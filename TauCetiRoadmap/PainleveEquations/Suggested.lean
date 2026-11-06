module

public import TauCeti.Geometry.Manifold.Submersion
public import TauCeti.Geometry.Manifold.VectorBundle.Hom
public import TauCeti.Geometry.Manifold.Distribution
public import TauCeti.Geometry.Manifold.Flow.Complete
public import TauCeti.Analysis.Complex.RiemannSurface.FunctionField
public import Mathlib.Dynamics.Flow
public import Mathlib.Geometry.Manifold.VectorBundle.Pullback

/-!
# Painlevé equations: suggested interfaces

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations suggest Lean forms for representative interfaces; the roadmap
also requires the constructions, full basic API, naturality, comparisons and applications
stated there. The theorem bodies marked `sorry` are proof targets, not completed proofs.

The prototypes concern the reusable floor: the actual tangent splitting and its vertical
curvature (0.1), an autonomous specialization of proper-semiconjugacy completeness (0.4),
and evaluation of a holomorphic observation along a curve (0.7). They use native Mathlib
tangent bundles and hom bundles, Tau Ceti's maximal-flow domain and completeness predicate,
and Tau Ceti's meromorphic functions on Riemann surfaces. They do not replace these carriers
with private versions. The full time-dependent continuation theorem, moduli constructions,
Riemann–Hilbert comparisons and Painlevé realization theorems remain the targets specified
in the README; these signatures do not represent all roadmap targets.
-/

public noncomputable section

open Bundle Set VectorField
open scoped Manifold ContDiff

namespace TauCetiRoadmap.PainleveEquations

/-! ## 0.1: a splitting of the actual tangent map -/

section NonlinearConnection

variable {𝕜 E F H K M B : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [NormedSpace 𝕜 E]
  [NormedAddCommGroup F] [NormedSpace 𝕜 F]
  [TopologicalSpace H] [TopologicalSpace K]
  (I : ModelWithCorners 𝕜 E H) (J : ModelWithCorners 𝕜 F K)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace B] [ChartedSpace K B] [IsManifold J ∞ B]

/-- A `C¹` nonlinear connection on a smooth submersion. Its lift is a fibrewise-linear
map from the native pullback of `TB` to `TM`, and is a right inverse of the derivative.
Regularity is stated on the total-space map; the native hom-bundle comparison identifies
this with regularity of the hom-bundle section for finite-dimensional base tangent fibres.
Surjectivity of `proj`, properness, flatness and completeness are not fields of this structure.
The complex version uses these same carriers over `ℂ`. -/
structure NonlinearConnection (proj : ContMDiffMap I J M B ∞) where
  isSubmersion : Manifold.IsSubmersion I J ∞ proj
  lift : ∀ x : M, (proj *ᵖ (TangentSpace J)) x →L[𝕜] TangentSpace I x
  contMDiff_lift : ContMDiff (I.prod 𝓘(𝕜, F)) I.tangent 1
    (fun u : TotalSpace F (proj *ᵖ (TangentSpace J : B → Type _)) ↦
      (⟨u.proj, lift u.proj u.2⟩ : TangentBundle I M))
  right_inverse : ∀ x, (mfderiv I J proj x).comp (lift x) =
    ContinuousLinearMap.id 𝕜 (TangentSpace J (proj x))

variable {I J} {proj : ContMDiffMap I J M B ∞}

/-- The horizontal subspace is the image of the specified lift, on the actual tangent fibre. -/
def NonlinearConnection.horizontal (h : NonlinearConnection I J proj) (x : M) :
    Submodule 𝕜 (TangentSpace I x) :=
  (h.lift x).range

/-- The vertical and horizontal subspaces are complementary; this is a consequence of the
right-inverse identity, rather than additional data in the connection object (0.1). -/
theorem NonlinearConnection.isCompl_vertical_horizontal (h : NonlinearConnection I J proj)
    (x : M) : IsCompl (mfderiv I J proj x).ker (h.horizontal x) := by
  sorry

/-- The horizontal spaces form a `C¹` distribution in Tau Ceti's native distribution API,
of rank equal to the dimension of the base. This constructs local frames from the tangent
splitting; a distribution or frame is not assumed as additional data (0.1). -/
theorem NonlinearConnection.isContMDiffDistribution_horizontal
    [FiniteDimensional 𝕜 E] [FiniteDimensional 𝕜 F]
    (h : NonlinearConnection I J proj) :
    TauCeti.IsContMDiffDistribution I 1 (Module.finrank 𝕜 F) h.horizontal := by
  sorry

/-- Lift an actual base vector field through the specified tangent splitting (0.1). -/
def NonlinearConnection.liftVectorField (h : NonlinearConnection I J proj)
    (X : ∀ b : B, TangentSpace J b) : ∀ x : M, TangentSpace I x :=
  fun x ↦ h.lift x (X (proj x))

/-- Curvature in the sign convention `[hX,hY] - h[X,Y]` (0.1). The expression uses
Mathlib's manifold Lie bracket and is subsequently proved to be a vertical tensor. -/
def NonlinearConnection.curvatureOn (h : NonlinearConnection I J proj)
    (X Y : ∀ b : B, TangentSpace J b) (x : M) : TangentSpace I x :=
  mlieBracket I (h.liftVectorField X) (h.liftVectorField Y) x -
    h.lift x (mlieBracket J X Y (proj x))

/-- Curvature takes values in the vertical tangent space. Neither flatness nor any global
existence hypothesis is used (0.1). -/
theorem NonlinearConnection.curvatureOn_mem_vertical
    [FiniteDimensional 𝕜 E] [FiniteDimensional 𝕜 F] [I.Boundaryless] [J.Boundaryless]
    (h : NonlinearConnection I J proj)
    (X Y : ∀ b : B, TangentSpace J b)
    (hX : ContMDiff J J.tangent 1 (fun b ↦ (⟨b, X b⟩ : TangentBundle J B)))
    (hY : ContMDiff J J.tangent 1 (fun b ↦ (⟨b, Y b⟩ : TangentBundle J B)))
    (x : M) : h.curvatureOn X Y x ∈ (mfderiv I J proj x).ker := by
  sorry

end NonlinearConnection

/-! ## 0.4: proper semiconjugacy, with a possibly singular target -/

/-- Autonomous specialization of 0.4 on the native maximal-flow carrier. A proper
semiconjugacy to a complete continuous flow implies completeness of the source field.
The target is only a topological space; its transport need not be differentiable, and the
semiconjugacy need not be injective or locally invertible. Properness is stated explicitly
as compactness of inverse images, exactly the condition used in the continuation argument.

The semiconjugacy identity is required at every point and every time of its maximal-flow
domain, including points on exceptional fibres. The full 0.4 theorem concerns piecewise
`C¹` base paths and continuous-time lifted equations; it is not replaced by this autonomous
specialization. -/
theorem isCompleteVectorField_of_proper_semiconjugacy
    {E H M R : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H) [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M] [TopologicalSpace R]
    (X : ∀ x : M, TangentSpace I x)
    (hX : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)))
    (F : M → R) (hF : Continuous F)
    (hproper : ∀ K : Set R, IsCompact K → IsCompact (F ⁻¹' K))
    (β : Flow ℝ R)
    (hsemi : ∀ (t : ℝ) (x : M), (t, x) ∈ TauCeti.flowDomain X →
      F (TauCeti.flowOf X t x) = β t (F x)) :
    TauCeti.IsCompleteVectorField X := by
  sorry

/-! ## 0.7: observations with the exceptional constant-infinity case excluded explicitly -/

/-- A holomorphic observation on a complex phase manifold, evaluated on a holomorphic
curve, defines a native meromorphic function as soon as one value is finite. The witness
is essential: a curve can lie entirely in the infinity divisor even if the observation is
nonconstant on the phase space. No connection, completeness or symplectic hypothesis is
needed for this evaluation operation (0.7). -/
def meromorphicObservation
    {E M S : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E]
    [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [TopologicalSpace S] [ChartedSpace ℂ S] [IsManifold 𝓘(ℂ) ∞ S]
    [T2Space S] [SecondCountableTopology S] [ConnectedSpace S]
    (Q : M → OnePoint ℂ) (hQ : MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) Q)
    (s : S → M) (hs : MDifferentiable 𝓘(ℂ) 𝓘(ℂ, E) s)
    (hfinite : ∃ z : S, Q (s z) ≠ OnePoint.infty) :
    TauCeti.RiemannSurface.MeromorphicFunction S where
  toFun := Q ∘ s
  mdifferentiable' := hQ.comp hs
  ne_infty' := by
    intro h
    obtain ⟨z, hz⟩ := hfinite
    exact hz (congrFun h z)

end TauCetiRoadmap.PainleveEquations

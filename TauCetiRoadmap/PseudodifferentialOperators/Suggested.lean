import Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace
import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Normed.Operator.Fredholm.Open
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection
import TauCeti.Geometry.Manifold.DerivationBundle
import Mathlib.RingTheory.Ideal.Cotangent

/-!
These are suggested forms, not an exhaustive checklist. The README is the
specification. The local symbols use smooth continuous-linear coefficients and
all mixed derivative bounds. Quantization uses Mathlib's Fourier transform
with the angular-frequency symbol evaluated at ξ=2πζ. The broader bundle,
classical-symbol and distribution interfaces are README construction targets.
-/

noncomputable section

namespace TauCetiRoadmap.PseudodifferentialOperators

open scoped ContDiff FourierTransform SchwartzMap RealInnerProductSpace
open MeasureTheory

section ScalarDifferentialCore

open scoped Manifold Derivation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [SecondCountableTopology M]

/-- The ordinary global vanishing ideal, using the existing smooth-function algebra. -/
def smoothVanishingIdeal (x : M) : Ideal C^∞⟮I, M; ℝ⟯ :=
  RingHom.ker (ContMDiffMap.evalRingHom x)

/-- The square is an algebraic ideal product, so membership uses finite sums. -/
theorem mem_smoothVanishingIdeal_sq_iff
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
    (x : M) (f : C^∞⟮I, M; ℝ⟯) :
    f ∈ smoothVanishingIdeal x ^ 2 ↔
      f x = 0 ∧ mfderiv I 𝓘(ℝ, ℝ) f x = 0 := by
  sorry

/-- The native ideal cotangent, rather than a quotient of the whole function ring. -/
def smoothCotangentEquiv
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
    (x : M) :
    (smoothVanishingIdeal (I := I) x).Cotangent ≃ₗ[ℝ]
      (TangentSpace I x →L[ℝ] ℝ) := by
  sorry

section RealVectorFields

variable [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]

theorem smoothCotangentEquiv_toCotangent (x : M) (f : smoothVanishingIdeal (I := I) x) :
    smoothCotangentEquiv x ((smoothVanishingIdeal (I := I) x).toCotangent f) =
      mvfderiv I (f : C^∞⟮I, M; ℝ⟯) x := by
  sorry

/-- The pointwise field uses the native tangent/point-derivation equivalence. -/
def derivationVectorField
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) : TangentSpace I x :=
  pointDerivationEquivTangentSpace x BoundarylessManifold.isInteriorPoint
    (Derivation.evalAt x D)

omit [SecondCountableTopology M] in
theorem derivationVectorField_apply
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯)
    (f : C^∞⟮I, M; ℝ⟯) (x : M) :
    mvfderiv I f x (derivationVectorField D x) = (D f) x := by
  change tangentToPointDerivation x
    (pointDerivationEquivTangentSpace x BoundarylessManifold.isInteriorPoint
      (Derivation.evalAt x D)) f = (D f) x
  rw [tangentToPointDerivation_pointDerivationEquivTangentSpace]
  rfl

omit [SecondCountableTopology M] in
theorem derivationVectorField_smul (f : C^∞⟮I, M; ℝ⟯)
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) :
    derivationVectorField (f • D) x = f x • derivationVectorField D x := by
  unfold derivationVectorField
  have heval : Derivation.evalAt x (f • D) = f x • Derivation.evalAt x D := by
    ext g
    rfl
  rw [heval, map_smul]

/-- Smoothness is a separate target, not a consequence of merely defining a pointwise field. -/
theorem contMDiff_derivationVectorField
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) :
    ContMDiff I I.tangent ∞
      (fun x ↦ (⟨x, derivationVectorField D x⟩ : TangentBundle I M)) := by
  sorry

end RealVectorFields

/-- The global scalar dictionary, with no assumed continuity of the derivation. -/
def derivationEquivSmoothVectorField
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M] :
    Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯ ≃ₗ[ℝ]
      ContMDiffSection I E ∞ (fun x : M ↦ TangentSpace I x) := by
  sorry

section RealDictionary

variable [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]

theorem derivationEquivSmoothVectorField_apply
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) :
    derivationEquivSmoothVectorField D x = derivationVectorField D x := by
  sorry

theorem derivationEquivSmoothVectorField_smul (f : C^∞⟮I, M; ℝ⟯)
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) :
    derivationEquivSmoothVectorField (f • D) x =
      f x • derivationEquivSmoothVectorField D x := by
  simp only [derivationEquivSmoothVectorField_apply, derivationVectorField_smul]

end RealDictionary

/-- Complex-valued smooth functions on the real manifold, with the real target model. -/
abbrev ComplexSmoothFunctions := C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯

/-- Complex multiplication is smooth for the real manifold structure too. -/
instance realComplexContMDiffRing : ContMDiffRing 𝓘(ℝ, ℂ) ∞ ℂ :=
  { instNormedSpaceLieAddGroup with
    contMDiff_mul := by
      rw [contMDiff_iff]
      refine ⟨continuous_mul, fun x y ↦ ?_⟩
      simp only [mfld_simps]
      rw [contDiffOn_univ]
      exact contDiff_mul }

open scoped TensorProduct

/-- Constant complex functions give the complex algebra, independently of the base field. -/
def complexSmoothConstants : ℂ →+* ComplexSmoothFunctions (I := I) (M := M) where
  toFun z := ContMDiffMap.const z
  map_zero' := by ext x; rfl
  map_one' := by ext x; rfl
  map_add' z w := by ext x; rfl
  map_mul' z w := by ext x; rfl

instance complexSmoothFunctionsAlgebra :
    Algebra ℂ (ComplexSmoothFunctions (I := I) (M := M)) :=
  (complexSmoothConstants (I := I) (M := M)).toAlgebra

/-- Complexification is the actual scalar tensor of the native real section carrier. -/
def complexDerivationEquivComplexifiedVectorField
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M] :
    Derivation ℂ (ComplexSmoothFunctions (I := I) (M := M))
      (ComplexSmoothFunctions (I := I) (M := M)) ≃ₗ[ℂ]
        ℂ ⊗[ℝ] ContMDiffSection I E ∞ (fun x : M ↦ TangentSpace I x) := by
  sorry

end ScalarDifferentialCore

/-- The ordinary index is constant on a continuous Fredholm family over a
preconnected parameter space; in particular this applies to a path on [0,1]. -/
theorem fredholmIndex_eq_of_preconnected
    {𝕜 X Y B : Type*} [NontriviallyNormedField 𝕜] [CompleteSpace 𝕜]
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [NormedSpace 𝕜 X] [NormedSpace 𝕜 Y] [CompleteSpace X]
    [TopologicalSpace B] [PreconnectedSpace B]
    (T : B → X →L[𝕜] Y) (hT : Continuous T)
    (hFredholm : ∀ b, (T b).IsFredholm) (a b : B) :
    (T a).index = (T b).index := by
  apply TotallyDisconnectedSpace.eq_of_continuous (fun c ↦ (T c).index)
  exact continuous_iff_continuousAt.mpr fun c ↦
    (hFredholm c).index_continuousAt.comp hT.continuousAt

abbrev CoordinateSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- An iterated coordinate derivative; smoothness later makes permutations equivalent. -/
def coordinateDeriv {n : ℕ} {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]
    (indices : List (Fin n)) (f : CoordinateSpace n → A) : CoordinateSpace n → A :=
  match indices with
  | [] => f
  | j :: js => fun x => fderiv ℝ (coordinateDeriv js f) x (PiLp.single 2 j 1)

/-- First differentiate in frequency, then in the spatial variables. -/
def mixedDeriv {n : ℕ} {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]
    (α β : List (Fin n)) (a : CoordinateSpace n × CoordinateSpace n → A)
    (x ξ : CoordinateSpace n) : A :=
  coordinateDeriv α (fun y => coordinateDeriv β (fun η => a (y, η)) ξ) x

variable {n : ℕ} {V W : Type*}
  [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]
  [NormedAddCommGroup W] [NormedSpace ℂ W] [CompleteSpace W]

/-- Local S^m_(1,0), with a bound on every compact spatial set. -/
structure Symbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V] [NormedSpace ℂ V]
    [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  coefficient : CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W
  smooth : ContDiff ℝ ∞ coefficient
  derivative_bound : ∀ (K : Set (CoordinateSpace n)), IsCompact K →
    ∀ (α β : List (Fin n)), ∃ C : ℝ, 0 ≤ C ∧
      ∀ x ∈ K, ∀ ξ,
        ‖mixedDeriv α β coefficient x ξ‖ ≤
          C * (1 + ‖ξ‖ ^ 2) ^ ((m - (β.length : ℝ)) / 2)

/-- Uniform bounds in x are extra data, not consequences of local symbol estimates. -/
def Symbol.IsUniform {m : ℝ} (a : Symbol n V W m) : Prop :=
  ∀ (α β : List (Fin n)), ∃ C : ℝ, 0 ≤ C ∧
    ∀ x ξ, ‖mixedDeriv α β a.coefficient x ξ‖ ≤
      C * (1 + ‖ξ‖ ^ 2) ^ ((m - (β.length : ℝ)) / 2)

/-- Compact spatial support for local weighted Schur estimates. -/
def Symbol.HasCompactSpatialSupport {m : ℝ} (a : Symbol n V W m) : Prop :=
  ∃ K : Set (CoordinateSpace n), IsCompact K ∧
    ∀ x ∉ K, ∀ ξ, a.coefficient (x, ξ) = 0

/-- The common ambient coefficient module pins the actual order subspaces. -/
def symbolSubmodule (m : ℝ) :
    Submodule ℂ (CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W) := by
  sorry

theorem mem_symbolSubmodule_iff (m : ℝ)
    (f : CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W) :
    f ∈ symbolSubmodule (n := n) (V := V) (W := W) m ↔
      ∃ a : Symbol n V W m, a.coefficient = f := by
  sorry

/-- A homogeneous principal term is smooth away from the zero covector. -/
structure HomogeneousSymbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V]
    [NormedSpace ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  coefficient : CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W
  zero_covector : ∀ x, coefficient (x, 0) = 0
  smooth_away_zero : ContDiffOn ℝ ∞ coefficient {p | p.2 ≠ 0}
  homogeneous : ∀ x ξ, ξ ≠ 0 → ∀ t : ℝ, 0 < t →
    coefficient (x, t • ξ) = (t ^ m) • coefficient (x, ξ)

/-- Cutoff data used in a one-step classical expansion. -/
structure FrequencyCutoff (n : ℕ) where
  toFun : CoordinateSpace n → ℝ
  smooth : ContDiff ℝ ∞ toFun
  zero_near_origin : ∀ ξ, ‖ξ‖ ≤ 1 → toFun ξ = 0
  one_at_infinity : ∀ ξ, 2 ≤ ‖ξ‖ → toFun ξ = 1
  bounds : ∀ ξ, 0 ≤ toFun ξ ∧ toFun ξ ≤ 1

/-- Classical symbols have explicit homogeneous terms and actual symbol remainders. -/
structure ClassicalSymbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V]
    [NormedSpace ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  symbol : Symbol n V W m
  cutoff : FrequencyCutoff n
  terms : (j : ℕ) → HomogeneousSymbol n V W (m - (j : ℝ))
  remainder : (N : ℕ) → Symbol n V W (m - (N : ℝ))
  remainder_eq : ∀ (N : ℕ) x ξ,
    (remainder N).coefficient (x, ξ) = symbol.coefficient (x, ξ) -
      ∑ j ∈ Finset.range N, cutoff.toFun ξ • (terms j).coefficient (x, ξ)

/-- A substantive condition on the actual principal term. -/
def ClassicalSymbol.IsElliptic {m : ℝ} (a : ClassicalSymbol n V W m) : Prop :=
  ∀ x ξ, ξ ≠ 0 → Function.Bijective ((a.terms 0).coefficient (x, ξ))

/-- Inversion constructs a smooth homogeneous symbol, not just pointwise inverses. -/
def inversePrincipalSymbol {m : ℝ} (a : ClassicalSymbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsElliptic) :
    HomogeneousSymbol n W V (-m) := by
  sorry

theorem inversePrincipalSymbol_spec {m : ℝ} (a : ClassicalSymbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsElliptic)
    (x ξ : CoordinateSpace n) (hξ : ξ ≠ 0) :
    ((inversePrincipalSymbol a ha).coefficient (x, ξ)).comp
      ((a.terms 0).coefficient (x, ξ)) = ContinuousLinearMap.id ℂ V ∧
    ((a.terms 0).coefficient (x, ξ)).comp
      ((inversePrincipalSymbol a ha).coefficient (x, ξ)) = ContinuousLinearMap.id ℂ W := by
  sorry

/-- Actual single integral; integrability is a separate theorem, not built into notation. -/
def quantizeSchwartzValue {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) : W :=
  ∫ ζ : CoordinateSpace n,
    Complex.exp (((2 * Real.pi * inner ℝ x ζ : ℝ) : ℂ) * Complex.I) •
      a.coefficient (x, (2 * Real.pi) • ζ) ((𝓕 u) ζ)

theorem integrable_quantizeSchwartz {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) :
    Integrable (fun ζ : CoordinateSpace n =>
      Complex.exp (((2 * Real.pi * inner ℝ x ζ : ℝ) : ℂ) * Complex.I) •
        a.coefficient (x, (2 * Real.pi) • ζ) ((𝓕 u) ζ)) := by
  sorry

theorem contDiff_quantizeSchwartzValue {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) :
    ContDiff ℝ ∞ (quantizeSchwartzValue a u) := by
  sorry

/-- Quantization as a linear map, with its concrete integral specification. -/
def quantizeSchwartz {m : ℝ} (a : Symbol n V W m) :
    SchwartzMap (CoordinateSpace n) V →ₗ[ℂ] (CoordinateSpace n → W) := by
  sorry

theorem quantizeSchwartz_apply {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) :
    quantizeSchwartz a u x = quantizeSchwartzValue a u x := by
  sorry

/-- Native all-real-order carrier, without a private completion. -/
def schwartzToSobolev (s : ℝ) (u : SchwartzMap (CoordinateSpace n) V) :
    BesselPotentialSpace (CoordinateSpace n) V s 2 :=
  (u.memSobolev (s := s) (p := 2)).toBesselPotentialSpace

/-- The order shift extends the same operator on Schwartz input. -/
def quantizeSobolev {m : ℝ} (a : Symbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (ha : a.HasCompactSpatialSupport) (s : ℝ) :
    BesselPotentialSpace (CoordinateSpace n) V s 2 →L[ℂ]
      BesselPotentialSpace (CoordinateSpace n) W (s - m) 2 := by
  sorry

theorem quantizeSobolev_schwartz {m : ℝ} (a : Symbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (ha : a.HasCompactSpatialSupport) (s : ℝ)
    (u : SchwartzMap (CoordinateSpace n) V)
    (φ : SchwartzMap (CoordinateSpace n) ℂ) :
    (quantizeSobolev a ha s (schwartzToSobolev s u)).toDistr φ =
      ∫ x, φ x • quantizeSchwartz a u x := by
  sorry

/-- All-x uniform order-zero bounds are a distinct Calderón--Vaillancourt target. -/
def quantizeUniformOrderZero (a : Symbol n V W 0)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsUniform) :
    BesselPotentialSpace (CoordinateSpace n) V 0 2 →L[ℂ]
      BesselPotentialSpace (CoordinateSpace n) W 0 2 := by
  sorry

theorem quantizeUniformOrderZero_schwartz (a : Symbol n V W 0)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsUniform)
    (u : SchwartzMap (CoordinateSpace n) V) (φ : SchwartzMap (CoordinateSpace n) ℂ) :
    (quantizeUniformOrderZero a ha (schwartzToSobolev 0 u)).toDistr φ =
      ∫ x, φ x • quantizeSchwartz a u x := by
  sorry

end TauCetiRoadmap.PseudodifferentialOperators

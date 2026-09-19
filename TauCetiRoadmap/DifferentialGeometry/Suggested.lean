import Mathlib
import TauCeti.Analysis.Calculus.Sard.EqualDimension
import TauCeti.Analysis.ODE.InitialCondition
import TauCeti.Geometry.Lie.IntegralCurve
import TauCeti.Geometry.Manifold.Boundary.Charts
import TauCeti.Geometry.Manifold.IntegralCurve.Maximal
import TauCeti.Geometry.Manifold.LocalDiffeomorph
import TauCeti.Geometry.Manifold.LocallyFlat.Basic
import TauCeti.Geometry.Manifold.TwoForm
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz

/-!
# Differential geometry — forms, de Rham cohomology, flows, and degree: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every load-bearing layer has at least one compiled declaration here. Where the pin cannot
yet express a type, the file fixes it *provisionally*: a definition with a `sorry` body
(never a `Prop`-typed placeholder) whose type pins the data, followed by the theorems that
pin its characteristic equations. The implementation need not match these definitions
definitionally; it must provide the data and laws they state. Real definitions are given
wherever the pin allows (`mpullback`, `flowDomain`, `degreeAtRegularValue`, `mgradient`,
`laplaceBeltrami`, …), so that the statements about them mean exactly what they say.

Existing Tau Ceti declarations are imported and consumed rather than restated: the
boundary manifold (`TauCeti.isManifold_boundary`), the manifold inverse function theorem
(`TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`), the maximal integral curve
(`maximalIntegralCurve`, whose compact-manifold completeness discharges a former target of
this file in place), finite-dimensional smooth dependence of flows
(`ODE.exists_contDiffAt_localFlow`), flat Sard (`Differentiable.dense_compl_image_criticalPoints`),
the Riesz duality of a Riemannian bundle (`Riemannian.Tensor.rieszDual`), the Levi-Civita
connection (`CovariantDerivative.leviCivita`), smooth 2-forms (`TauCeti.SmoothTwoForm`),
slice charts (`TauCeti.IsSliceChart`), and the invariant integral curves of a Lie group
(`mulInvariantIntegralCurve`).

`sorry` is allowed here (human-owned roadmap territory). No declaration carrying `sorry` is a
global instance: anything that should eventually be one (`ContMDiffVectorBundle` for the
alternating bundle, the charted structure of a covering space) is a theorem or a plain
definition, to be promoted only once proved. Two provisional structures — the topology and
charted structure of the orientation cover — are registered as *local* instances inside this
file only, so that the statements about the cover read naturally; the only global instances
are real ones (the projections of `IntegralManifold`, scalar multiplication of densities).

Conventions (see `README.md`): scalars `ℝ` where the geometry is real, `𝕜` where the
statement is honestly general; the wedge follows the determinant convention, pinned by
`wedge_apply_one_one`; hypotheses are unbundled and stated at their point of use; finite
dimension, Hausdorffness and σ-compactness are written wherever they are used; measure
statements carry `[MeasurableSpace M] [BorelSpace M]`. Elaborates against the pinned
toolchain (sorry-warnings only).
-/

open Bundle Set
open scoped Manifold Bundle Topology ContDiff InnerProductSpace

namespace TauCetiRoadmap.DifferentialGeometry

/-! ## Layer 0: alternating bundles, differential forms, and the wedge -/

section Wedge

variable {E F₁ F₂ F₃ F₁₂ F₂₃ G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F₁] [NormedSpace ℝ F₁] [NormedAddCommGroup F₂] [NormedSpace ℝ F₂]
  [NormedAddCommGroup F₃] [NormedSpace ℝ F₃] [NormedAddCommGroup F₁₂] [NormedSpace ℝ F₁₂]
  [NormedAddCommGroup F₂₃] [NormedSpace ℝ F₂₃] [NormedAddCommGroup G] [NormedSpace ℝ G]

/-- **Layer 0.1.** The paired wedge product of continuous alternating maps, in the
determinant convention, combining values through an explicit continuous bilinear map —
the `wedge_product` shape of Kudryashov's `DeRhamCohomology`. At this generality the
theorems are bilinearity, the norm bound, compatibility with `compContinuousLinearMap`,
the characterization through alternatization, naturality in `μ`, and the *flip* identity
`wedgeWith_flip`; associativity and graded commutativity are **not** theorems here
(degree zero reduces them to associativity and commutativity of `μ`) and hold only
under explicit hypotheses on the pairings — `wedgeWith_assoc` below. -/
noncomputable def wedgeWith {k l : ℕ} (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    E [⋀^Fin (k + l)]→L[ℝ] F₃ :=
  sorry

variable {k l m : ℕ} {μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃}

/-- **Layer 0.1.** Additivity in the first argument; with `wedgeWith_smul_left` and the
right-hand variants this makes the paired wedge bilinear. -/
theorem wedgeWith_add_left (φ φ' : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (φ + φ') ψ = wedgeWith μ φ ψ + wedgeWith μ φ' ψ :=
  sorry

theorem wedgeWith_smul_left (c : ℝ) (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (c • φ) ψ = c • wedgeWith μ φ ψ :=
  sorry

/-- **Layer 0.1.** The norm bound, with the explicit constant of the determinant convention:
the number of `(k, l)`-shuffles. -/
theorem norm_wedgeWith_le (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    ‖wedgeWith μ φ ψ‖ ≤ (k + l).choose k * ‖μ‖ * ‖φ‖ * ‖ψ‖ :=
  sorry

/-- **Layer 0.1.** Compatibility with the pointwise pullback `compContinuousLinearMap`; this is
what makes `mpullback` a wedge homomorphism with no differentiability hypothesis at all. -/
theorem wedgeWith_compContinuousLinearMap {E' : Type*} [NormedAddCommGroup E']
    [NormedSpace ℝ E'] (f : E' →L[ℝ] E) (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (φ.compContinuousLinearMap f) (ψ.compContinuousLinearMap f) =
      (wedgeWith μ φ ψ).compContinuousLinearMap f :=
  sorry

/-- **Layer 0.1, the flip identity.** Swapping the factors flips the pairing and costs the
graded sign; this holds for *every* pairing, and graded commutativity for a commutative
`μ` (where `μ.flip = μ`) is its corollary. The degree cast is `Fin.cast`. -/
theorem wedgeWith_flip (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂)
    (v : Fin (k + l) → E) :
    wedgeWith μ φ ψ v =
      (-1 : ℝ) ^ (k * l) • wedgeWith μ.flip ψ φ (v ∘ Fin.cast (Nat.add_comm l k)) :=
  sorry

/-- **Layer 0.1, associativity under a compatibility hypothesis on the pairings**: it is a
theorem exactly when the two composite pairings agree, `μ₁₂₃ (μ₁₂ a b) c = μ₁₂₃' a (μ₂₃ b c)`,
which is associativity of a multiplication in the algebra case and *fails* for a Lie
bracket. -/
theorem wedgeWith_assoc (μ₁₂ : F₁ →L[ℝ] F₂ →L[ℝ] F₁₂) (μ₁₂₃ : F₁₂ →L[ℝ] F₃ →L[ℝ] G)
    (μ₂₃ : F₂ →L[ℝ] F₃ →L[ℝ] F₂₃) (μ₁₂₃' : F₁ →L[ℝ] F₂₃ →L[ℝ] G)
    (h : ∀ a b c, μ₁₂₃ (μ₁₂ a b) c = μ₁₂₃' a (μ₂₃ b c))
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) (χ : E [⋀^Fin m]→L[ℝ] F₃)
    (v : Fin (k + l + m) → E) :
    wedgeWith μ₁₂₃ (wedgeWith μ₁₂ φ ψ) χ v =
      wedgeWith μ₁₂₃' φ (wedgeWith μ₂₃ ψ χ) (v ∘ Fin.cast (Nat.add_assoc k l m).symm) :=
  sorry

/-- **Layer 0.1.** The ℝ-valued wedge, the multiplication specialization of `wedgeWith`:
`ω ∧ η = ((k+l)!/(k!·l!)) • Alt (ω ⊗ η)`, so that elementary covectors satisfy
`ε^I ∧ ε^J = ε^{I++J}` and top-degree wedges of covectors are determinants. This is the
graded-commutative associative case, and the normalization is pinned by
`wedge_apply_one_one` below. -/
noncomputable def wedge (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    E [⋀^Fin (k + l)]→L[ℝ] ℝ :=
  wedgeWith (ContinuousLinearMap.mul ℝ ℝ) φ ψ

/-- **Layer 0.1, normalization gate.** On two 1-forms the wedge is the 2×2 determinant.
This pins the normalization: under the Alt convention the right-hand side would carry a
factor `1/2`, and a `wedge := 0` filler fails here. -/
theorem wedge_apply_one_one (φ ψ : E [⋀^Fin 1]→L[ℝ] ℝ) (v w : E) :
    wedge φ ψ ![v, w] = φ ![v] * ψ ![w] - φ ![w] * ψ ![v] :=
  sorry

/-- **Layer 0.1.** Left linearity in the scalar; with `wedge_add_left` and the right
variants (not stated here) this makes the wedge bilinear. -/
theorem wedge_smul_left (c : ℝ) (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    wedge (c • φ) ψ = c • wedge φ ψ :=
  sorry

/-- **Layer 0.1.** Graded commutativity of the ℝ-valued wedge: the flip identity with the
commutative pairing `mul`. -/
theorem wedge_comm (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) (v : Fin (k + l) → E) :
    wedge φ ψ v = (-1 : ℝ) ^ (k * l) • wedge ψ φ (v ∘ Fin.cast (Nat.add_comm l k)) :=
  sorry

/-- **Layer 0.1.** Associativity of the ℝ-valued wedge, the compatibility hypothesis of
`wedgeWith_assoc` being associativity of multiplication. -/
theorem wedge_assoc (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ)
    (χ : E [⋀^Fin m]→L[ℝ] ℝ) (v : Fin (k + l + m) → E) :
    wedge (wedge φ ψ) χ v = wedge φ (wedge ψ χ) (v ∘ Fin.cast (Nat.add_assoc k l m).symm) :=
  sorry

/-- **Layer 0.1.** The wedge of forms with values in a normed algebra, through its
multiplication: associative (`wedgeWith_assoc` with `h := mul_assoc`), and graded commutative
only when the algebra is commutative. -/
noncomputable def wedgeMul {A : Type*} [NormedRing A] [NormedAlgebra ℝ A]
    (φ : E [⋀^Fin k]→L[ℝ] A) (ψ : E [⋀^Fin l]→L[ℝ] A) : E [⋀^Fin (k + l)]→L[ℝ] A :=
  wedgeWith (ContinuousLinearMap.mul ℝ A) φ ψ

/-- **Layer 0.1.** The bracket wedge `[φ ∧ ψ]` of forms with values in a space carrying a
continuous bilinear bracket `β` (a finite-dimensional Lie algebra's bracket, say): `wedgeWith`
along `β`. It is neither associative nor graded commutative; its laws are graded
skew-symmetry and the graded Jacobi identity below, each under the corresponding hypothesis
on `β`. -/
noncomputable def bracketWedge (β : F₁ →L[ℝ] F₁ →L[ℝ] F₁) (φ : E [⋀^Fin k]→L[ℝ] F₁)
    (ψ : E [⋀^Fin l]→L[ℝ] F₁) : E [⋀^Fin (k + l)]→L[ℝ] F₁ :=
  wedgeWith β φ ψ

/-- **Layer 0.1.** Graded skew-symmetry of the bracket wedge, `[φ ∧ ψ] = -(-1)^{kl} [ψ ∧ φ]`,
for a skew-symmetric bracket: the flip identity with `β.flip = -β`. -/
theorem bracketWedge_skew {β : F₁ →L[ℝ] F₁ →L[ℝ] F₁} (hβ : ∀ a b, β a b = -β b a)
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₁) (v : Fin (k + l) → E) :
    bracketWedge β φ ψ v =
      -((-1 : ℝ) ^ (k * l) • bracketWedge β ψ φ (v ∘ Fin.cast (Nat.add_comm l k))) :=
  sorry

/-- **Layer 0.1.** The graded Jacobi identity of the bracket wedge,
`(-1)^{km} [[φ∧ψ]∧χ] + (-1)^{kl} [[ψ∧χ]∧φ] + (-1)^{lm} [[χ∧φ]∧ψ] = 0`, the three terms cast to
degree `k + l + m`, for a bracket satisfying the Jacobi identity. -/
theorem bracketWedge_jacobi {β : F₁ →L[ℝ] F₁ →L[ℝ] F₁} (hβ : ∀ a b, β a b = -β b a)
    (hβ' : ∀ a b c, β a (β b c) = β (β a b) c + β b (β a c))
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₁) (χ : E [⋀^Fin m]→L[ℝ] F₁)
    (v : Fin (k + l + m) → E) :
    (-1 : ℝ) ^ (k * m) • bracketWedge β (bracketWedge β φ ψ) χ v +
      (-1 : ℝ) ^ (k * l) • bracketWedge β (bracketWedge β ψ χ) φ
        (v ∘ Fin.cast (show l + m + k = k + l + m by omega)) +
      (-1 : ℝ) ^ (l * m) • bracketWedge β (bracketWedge β χ φ) ψ
        (v ∘ Fin.cast (show m + k + l = k + l + m by omega)) = 0 :=
  sorry

/-- **Layer 0.1, the interior product.** Mathlib's `ContinuousAlternatingMap.curryLeft` *is*
`ι_v`; what is built here is its calculus: `ι_v ∘ ι_v = 0` and the degree-`(−1)`
antiderivation rule [Lee, Lemma 14.13], stated for the paired wedge. -/
theorem curryLeft_curryLeft (φ : E [⋀^Fin (k + 2)]→L[ℝ] F₁) (v : E) :
    (φ.curryLeft v).curryLeft v = 0 :=
  sorry

theorem curryLeft_wedgeWith (φ : E [⋀^Fin (k + 1)]→L[ℝ] F₁) (ψ : E [⋀^Fin (l + 1)]→L[ℝ] F₂)
    (v : E) (w : Fin (k + 1 + l) → E) :
    (wedgeWith μ φ ψ).curryLeft v w =
      wedgeWith μ (φ.curryLeft v) ψ (w ∘ Fin.cast (show k + (l + 1) = k + 1 + l by omega)) +
        (-1 : ℝ) ^ (k + 1) • wedgeWith μ φ (ψ.curryLeft v) w :=
  sorry

end Wedge

section AlternatingBundle

variable {𝕜 B ι : Type*} {n : WithTop ℕ∞}
  [NontriviallyNormedField 𝕜] [Fintype ι]
  {F₁ F₂ : Type*} [NormedAddCommGroup F₁] [NormedSpace 𝕜 F₁]
  [NormedAddCommGroup F₂] [NormedSpace 𝕜 F₂]
  {E₁ : B → Type*} [∀ x, AddCommGroup (E₁ x)] [∀ x, Module 𝕜 (E₁ x)]
  [TopologicalSpace (TotalSpace F₁ E₁)] [∀ x, TopologicalSpace (E₁ x)]
  {E₂ : B → Type*} [∀ x, AddCommGroup (E₂ x)] [∀ x, Module 𝕜 (E₂ x)]
  [TopologicalSpace (TotalSpace F₂ E₂)] [∀ x, TopologicalSpace (E₂ x)]
  {EB : Type*} [NormedAddCommGroup EB] [NormedSpace 𝕜 EB]
  {HB : Type*} [TopologicalSpace HB] {IB : ModelWithCorners 𝕜 EB HB}
  [TopologicalSpace B] [ChartedSpace HB B]
  [FiberBundle F₁ E₁] [VectorBundle 𝕜 F₁ E₁]
  [FiberBundle F₂ E₂] [VectorBundle 𝕜 F₂ E₂]
  [∀ x, IsTopologicalAddGroup (E₂ x)] [∀ x, ContinuousSMul 𝕜 (E₂ x)]

/-- **Layer 0.2.** The bundle of continuous alternating maps
between two `C^n` vector bundles over the same base is a `C^n` vector bundle — the
statement mirrors `ContMDiffVectorBundle.continuousLinearMap` in
`Mathlib/Geometry/Manifold/VectorBundle/Hom.lean`, over the topological bundle of
`Mathlib/Topology/VectorBundle/ContinuousAlternatingMap.lean`. Stated as a theorem;
promote to an instance once proved, never while it carries `sorry`. -/
theorem contMDiffVectorBundle_continuousAlternatingMap
    [ContMDiffVectorBundle n F₁ E₁ IB] [ContMDiffVectorBundle n F₂ E₂ IB] :
    ContMDiffVectorBundle n (F₁ [⋀^ι]→L[𝕜] F₂) (fun x ↦ E₁ x [⋀^ι]→L[𝕜] E₂ x) IB :=
  sorry

end AlternatingBundle

/-! ## Layer 0.3–0.4: rough and smooth forms on manifolds, pullback -/

section Forms

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
  {E'' H'' M'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [TopologicalSpace H'']
  {I'' : ModelWithCorners ℝ E'' H''} [TopologicalSpace M''] [ChartedSpace H'' M'']
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : WithTop ℕ∞} {k l : ℕ}

/-- **Layer 0.3.** Rough `F`-valued `k`-forms: unbundled sections of the alternating bundle,
with no regularity. The value at `x` is a continuous alternating map on `TangentSpace I x`. -/
abbrev RoughForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Type _ :=
  (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] F

variable (I) in
/-- **Layer 0.3.** The `C^n` predicate on a rough form: `C^n` as a section of the topological
alternating bundle `fun x ↦ TangentSpace I x [⋀^Fin k]→L[ℝ] Trivial M F x` of
`Mathlib/Topology/VectorBundle/ContinuousAlternatingMap.lean`. -/
def IsSmoothForm [IsManifold I 1 M] (n : WithTop ℕ∞) (φ : RoughForm I M F k) : Prop :=
  ContMDiff I (I.prod 𝓘(ℝ, E [⋀^Fin k]→L[ℝ] F)) n
    (fun x ↦ TotalSpace.mk' (E [⋀^Fin k]→L[ℝ] F)
      (E := fun x ↦ TangentSpace I x [⋀^Fin k]→L[ℝ] Trivial M F x) x (φ x))

/-- **Layer 0.3.** The pullback of a rough form, total and junk-valued in the style of
`VectorField.mpullback`: `mpullback f φ x = (φ (f x)) ∘ mfderiv I I' f x`. -/
noncomputable def mpullback (I : ModelWithCorners ℝ E H) (I' : ModelWithCorners ℝ E' H')
    (f : M → M') (φ : RoughForm I' M' F k) : RoughForm I M F k :=
  fun x ↦ (φ (f x)).compContinuousLinearMap (mfderiv I I' f x)

theorem mpullback_apply (f : M → M') (φ : RoughForm I' M' F k) (x : M)
    (v : Fin k → TangentSpace I x) :
    mpullback I I' f φ x v = φ (f x) (fun i ↦ mfderiv I I' f x (v i)) :=
  rfl

theorem mpullback_id (φ : RoughForm I M F k) : mpullback I I id φ = φ :=
  sorry

/-- **Layer 0.3.** The chain rule for pullbacks needs differentiability, exactly as `mfderiv`'s
does: the composition law is *not* unconditional for a junk-valued derivative. -/
theorem mpullback_comp_at {f : M → M'} {g : M' → M''} {x : M}
    (hf : MDifferentiableAt I I' f x) (hg : MDifferentiableAt I' I'' g (f x))
    (φ : RoughForm I'' M'' F k) :
    mpullback I I'' (g ∘ f) φ x = mpullback I I' f (mpullback I' I'' g φ) x :=
  sorry

theorem mpullback_comp_on {f : M → M'} {g : M' → M''} {s : Set M} {t : Set M'}
    (hs : IsOpen s) (hf : ContMDiffOn I I' 1 f s) (ht : IsOpen t) (hg : ContMDiffOn I' I'' 1 g t)
    (hst : MapsTo f s t) (φ : RoughForm I'' M'' F k) :
    ∀ x ∈ s, mpullback I I'' (g ∘ f) φ x = mpullback I I' f (mpullback I' I'' g φ) x :=
  sorry

theorem mpullback_comp {f : M → M'} {g : M' → M''}
    (hf : MDifferentiable I I' f) (hg : MDifferentiable I' I'' g) (φ : RoughForm I'' M'' F k) :
    mpullback I I'' (g ∘ f) φ = mpullback I I' f (mpullback I' I'' g φ) :=
  sorry

theorem mpullback_add (f : M → M') (φ η : RoughForm I' M' F k) :
    mpullback I I' f (φ + η) = mpullback I I' f φ + mpullback I I' f η :=
  sorry

theorem mpullback_smul (f : M → M') (c : ℝ) (φ : RoughForm I' M' F k) :
    mpullback I I' f (c • φ) = c • mpullback I I' f φ :=
  sorry

/-- **Layer 0.3.** Pullback of a `C^n` form by a `C^(n+1)` map is `C^n`: one derivative is
spent on `mfderiv`. -/
theorem isSmoothForm_mpullback [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I (n + 1) M]
    [IsManifold I' (n + 1) M']
    {f : M → M'} (hf : ContMDiff I I' (n + 1) f) {φ : RoughForm I' M' F k}
    (hφ : IsSmoothForm I' n φ) : IsSmoothForm I n (mpullback I I' f φ) :=
  sorry

theorem isSmoothForm_mpullback_infty [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I ∞ M]
    [IsManifold I' ∞ M'] {f : M → M'} (hf : ContMDiff I I' ∞ f) {φ : RoughForm I' M' F k}
    (hφ : IsSmoothForm I' ∞ φ) : IsSmoothForm I ∞ (mpullback I I' f φ) :=
  sorry

/-- **Layer 0.3.** The pointwise wedge of ℝ-valued rough forms. -/
noncomputable def RoughForm.wedge (φ : RoughForm I M ℝ k) (η : RoughForm I M ℝ l) :
    RoughForm I M ℝ (k + l) :=
  fun x ↦ TauCetiRoadmap.DifferentialGeometry.wedge (E := E) (φ x) (η x)

/-- **Layer 0.3.** Pullback is a wedge homomorphism, unconditionally (it is pointwise algebra,
`wedgeWith_compContinuousLinearMap`). -/
theorem mpullback_wedge (f : M → M') (φ : RoughForm I' M' ℝ k) (η : RoughForm I' M' ℝ l) :
    mpullback I I' f (φ.wedge η) = (mpullback I I' f φ).wedge (mpullback I I' f η) :=
  sorry

/-- **Layer 0.3.** The support of a form, closed by convention. -/
def RoughForm.tsupport (φ : RoughForm I M F k) : Set M :=
  closure {x | φ x ≠ 0}

/-- **Layer 0.3.** The `0`-form of a function. -/
noncomputable def RoughForm.ofFunction (I : ModelWithCorners ℝ E H) (f : M → F) :
    RoughForm I M F 0 :=
  fun x ↦ ContinuousAlternatingMap.constOfIsEmpty ℝ (TangentSpace I x) (Fin 0) (f x)

/-- **Layer 0.3.** Restriction to an open subset is pullback along the inclusion. -/
noncomputable def RoughForm.restrict (U : TopologicalSpace.Opens M) (φ : RoughForm I M F k) :
    RoughForm I U F k :=
  mpullback I I (Subtype.val : U → M) φ

/-- **Layer 0.3.** The interior product `ι_V φ` of a vector field and a form, pointwise
`ContinuousAlternatingMap.curryLeft`. -/
noncomputable def RoughForm.interior (V : (x : M) → TangentSpace I x)
    (φ : RoughForm I M F (k + 1)) : RoughForm I M F k :=
  fun x ↦ ContinuousAlternatingMap.curryLeft (𝕜 := ℝ) (E := E) (F := F) (φ x) (V x)

/-- **Layer 0.4.** The bundled `C^∞` forms, as the submodule of rough forms cut out by
`IsSmoothForm I ∞`. Provisional: the submodule is pinned by `mem_smoothForms`; its closure
under the module operations is the content of the target. -/
def smoothForms (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Submodule ℝ (RoughForm I M F k) :=
  sorry

theorem mem_smoothForms [IsManifold I 1 M] {φ : RoughForm I M F k} :
    φ ∈ smoothForms I M F k ↔ IsSmoothForm I ∞ φ :=
  sorry

/-- **Layer 0.4.** `Ω^k⟮I, M; F⟯`, the module of smooth `F`-valued `k`-forms. -/
abbrev SmoothForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F]
    (k : ℕ) : Type _ :=
  ↥(smoothForms I M F k)

/-- **Layer 0.4.** The wedge of smooth forms is smooth; this is where 0.2's smooth bundle
structure is used. -/
theorem smoothForms_wedge_mem [IsManifold I 1 M] [IsManifold I ∞ M] (φ : SmoothForm I M ℝ k)
    (η : SmoothForm I M ℝ l) : (φ : RoughForm I M ℝ k).wedge η ∈ smoothForms I M ℝ (k + l) :=
  sorry

/-- **Layer 0.4, the bridge to Tau Ceti's symplectic lane.** A smooth 2-form in the sense of
this roadmap is a `TauCeti.SmoothTwoForm`, and conversely; the two notions are identified by
an equivalence, with the evaluation law `toSmoothTwoForm_apply`. The Heegaard Floer lane
defines "closed" exactly once, through `mextDeriv`, via this bridge. -/
noncomputable def smoothFormTwoEquiv [IsManifold I 1 M] [IsManifold I ∞ M] :
    SmoothForm I M ℝ 2 ≃ TauCeti.SmoothTwoForm I M :=
  sorry

theorem smoothFormTwoEquiv_apply [IsManifold I 1 M] [IsManifold I ∞ M] (φ : SmoothForm I M ℝ 2)
    (x : M)
    (v w : TangentSpace I x) :
    smoothFormTwoEquiv φ x v w = (φ : RoughForm I M ℝ 2) x ![v, w] :=
  sorry

/-- **Layer 0.4, acceptance.** Over the model `𝓘(ℝ, E)` the manifold pullback is the flat
pullback along `fderiv`, as a lemma, not by defeq. -/
theorem mpullback_eq_flat {E₁ E₂ : Type*} [NormedAddCommGroup E₁] [NormedSpace ℝ E₁]
    [NormedAddCommGroup E₂] [NormedSpace ℝ E₂] {f : E₁ → E₂}
    (φ : RoughForm 𝓘(ℝ, E₂) E₂ F k) {x : E₁} (hf : DifferentiableAt ℝ f x) :
    mpullback 𝓘(ℝ, E₁) 𝓘(ℝ, E₂) f φ x = (φ (f x)).compContinuousLinearMap (fderiv ℝ f x) :=
  sorry

end Forms

/-! ## Layer 1: the exterior derivative and its naturality -/

section ExtDerivFlat

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **Layer 1.3, the new flat lemma, at finite regularity.** The exterior derivative of a
`C^(n+1)` form is `C^n` on the same set — in successor form, so that no zero-regularity branch
is needed and `n = ∞` is the smooth case. Stated `Within` so it applies on `Set.range I` of a
model with corners; this is what lets `d` map `Ω^k` to `Ω^(k+1)`. -/
theorem contDiffOn_extDerivWithin_succ {n : WithTop ℕ∞} {k : ℕ} {φ : E → E [⋀^Fin k]→L[ℝ] F}
    {s : Set E} (hs : UniqueDiffOn ℝ s) (hφ : ContDiffOn ℝ (n + 1) φ s) :
    ContDiffOn ℝ n (extDerivWithin φ s) s :=
  sorry

end ExtDerivFlat

section ExtDeriv

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : WithTop ℕ∞} {k l : ℕ}

/-- **Layer 1.1.** The exterior derivative within a set, at a point: conjugate through
`extChartAt I x`, apply `extDerivWithin` on `(extChartAt I x).symm ⁻¹' s ∩ Set.range I`, pull
back through `mfderivWithin`. Total and junk-valued; chart independence is the theorem. -/
noncomputable def mextDerivWithin (φ : RoughForm I M F k) (s : Set M) (x : M) :
    TangentSpace I x [⋀^Fin (k + 1)]→L[ℝ] F :=
  sorry

/-- **Layer 1.1.** The exterior derivative. -/
noncomputable def mextDeriv (φ : RoughForm I M F k) : RoughForm I M F (k + 1) :=
  fun x ↦ mextDerivWithin φ univ x

theorem mextDerivWithin_univ (φ : RoughForm I M F k) : mextDerivWithin φ univ = mextDeriv φ :=
  rfl

/-- **Layer 1.1.** Over the model space the manifold derivative is the flat one. -/
theorem mextDeriv_eq_extDeriv (φ : RoughForm 𝓘(ℝ, E) E F k) (x : E) :
    mextDeriv φ x = extDeriv φ x :=
  sorry

/-- **Layer 1.1.** `d` of a `0`-form is `mfderiv` (that is, `mvfderiv`). -/
theorem mextDeriv_ofFunction (f : M → F) (x : M) (v : TangentSpace I x) :
    mextDeriv (RoughForm.ofFunction I f) x ![v] = (id (mfderiv I 𝓘(ℝ, F) f x v) : F) :=
  sorry

theorem mextDeriv_add [IsManifold I 1 M] {φ η : RoughForm I M F k} (hφ : IsSmoothForm I 1 φ)
    (hη : IsSmoothForm I 1 η) : mextDeriv (φ + η) = mextDeriv φ + mextDeriv η :=
  sorry

theorem mextDeriv_smul (c : ℝ) (φ : RoughForm I M F k) : mextDeriv (c • φ) = c • mextDeriv φ :=
  sorry

/-- **Layer 1.2, naturality.** For a `C²` map and a `C¹` form, `f^* (dφ) = d (f^* φ)`. -/
theorem mpullback_mextDeriv [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I 2 M]
    [IsManifold I' 2 M'] {f : M → M'}
    (hf : ContMDiff I I' 2 f) {φ : RoughForm I' M' F k} (hφ : IsSmoothForm I' 1 φ) :
    mpullback I I' f (mextDeriv φ) = mextDeriv (mpullback I I' f φ) :=
  sorry

/-- **Layer 1.3.** `d ∘ d = 0` on `C²` forms. -/
theorem mextDeriv_mextDeriv [IsManifold I 1 M] [IsManifold I 2 M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I 2 φ) : mextDeriv (mextDeriv φ) = 0 :=
  sorry

/-- **Layer 1.3.** Preservation of regularity, the manifold transfer of
`contDiffOn_extDerivWithin_succ`: on a `C^(n+2)` manifold, `d` takes `C^(n+1)` forms to `C^n`
forms. -/
theorem isSmoothForm_mextDeriv [IsManifold I 1 M] [IsManifold I (n + 2) M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I (n + 1) φ) : IsSmoothForm I n (mextDeriv φ) :=
  sorry

theorem isSmoothForm_mextDeriv_infty [IsManifold I 1 M] [IsManifold I ∞ M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I ∞ φ) : IsSmoothForm I ∞ (mextDeriv φ) :=
  sorry

/-- **Layer 1.4, the Leibniz rule with unit constants**, the degrees cast by `Fin.cast`. -/
theorem mextDeriv_wedge [IsManifold I 1 M] {φ : RoughForm I M ℝ k} {η : RoughForm I M ℝ l}
    (hφ : IsSmoothForm I 1 φ) (hη : IsSmoothForm I 1 η) (x : M)
    (v : Fin (k + l + 1) → TangentSpace I x) :
    mextDeriv (φ.wedge η) x v =
      (mextDeriv φ).wedge η x (v ∘ Fin.cast (show k + 1 + l = k + l + 1 by omega)) +
        (-1 : ℝ) ^ k • φ.wedge (mextDeriv η) x
          (v ∘ Fin.cast (show k + (l + 1) = k + l + 1 by omega)) :=
  sorry

/-- **Layer 1.4, the invariant formula for 1-forms** [Lee, Prop. 14.29]:
`dφ(V, W) = V(φ(W)) − W(φ(V)) − φ([V, W])`. -/
theorem mextDeriv_apply_one [IsManifold I 1 M] [IsManifold I 2 M] {φ : RoughForm I M ℝ 1}
    (hφ : IsSmoothForm I 1 φ)
    {V W : (x : M) → TangentSpace I x}
    (hV : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, V x⟩ : TangentBundle I M)))
    (hW : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, W x⟩ : TangentBundle I M))) (x : M) :
    mextDeriv φ x ![V x, W x] =
      (id (mfderiv I 𝓘(ℝ) (fun y ↦ φ y ![W y]) x (V x)) : ℝ) -
        (id (mfderiv I 𝓘(ℝ) (fun y ↦ φ y ![V y]) x (W x)) : ℝ) -
        φ x ![VectorField.mlieBracket I V W x] :=
  sorry

/-- **Layer 1.4.** The Lie derivative of a form along a vector field, defined without flows
by the bracket formula [Lee, Cor. 12.33]; 3.4 proves the flow characterization. -/
noncomputable def mlieDerivForm (V : (x : M) → TangentSpace I x) (φ : RoughForm I M F k) :
    RoughForm I M F k :=
  sorry

/-- **Layer 1.4, Cartan's magic formula** `L_V = ι_V ∘ d + d ∘ ι_V` [Lee, Thm. 14.35]. -/
theorem mlieDerivForm_eq_interior_mextDeriv_add [IsManifold I 1 M] [IsManifold I 2 M]
    {V : (x : M) → TangentSpace I x}
    (hV : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, V x⟩ : TangentBundle I M)))
    {φ : RoughForm I M F (k + 1)} (hφ : IsSmoothForm I 1 φ) :
    mlieDerivForm V φ = (mextDeriv φ).interior V + mextDeriv (φ.interior V) :=
  sorry

end ExtDeriv

/-! ## Layer 2: orientations and the orientation double cover -/

section Orientation

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} {M' : Type*} [TopologicalSpace M'] [ChartedSpace H' M']
  {ι : Type*} [Fintype ι] [DecidableEq ι] {n : WithTop ℕ∞}

/-- **Layer 2.1, the data of an orientation.** An orientation lift is a model orientation
together with *chart signs* `sign x y : ℤˣ` — the sign of the preferred chart at `x` at the
point `y` — locally constant on the chart source, and compatible with coordinate changes: on
a common source the product of the two signs is the sign of the transition Jacobian, computed
within `Set.range I` so that boundary points are included. This is the data and these are the
laws Tau Ceti requires, whatever names an upstream implementation eventually uses. -/
structure OrientationLift (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (ι : Type*) [Fintype ι] [FiniteDimensional ℝ E] where
  /-- The orientation of the model space. -/
  modelOrientation : Orientation ℝ E ι
  /-- `card_eq` makes the model orientation a genuine orientation of `E`. -/
  card_eq : Fintype.card ι = Module.finrank ℝ E
  /-- `sign x y` is the sign of the preferred chart at `x`, at the point `y`. -/
  sign : M → M → ℤˣ
  /-- Signs are locally constant on the chart source. -/
  continuousOn_sign : ∀ x, ContinuousOn (sign x) (chartAt H x).source
  /-- Compatibility: two charts at a common point differ by the sign of their transition
  Jacobian. -/
  sign_mul_sign : ∀ x x' y, y ∈ (chartAt H x).source → y ∈ (chartAt H x').source →
    ((sign x y * sign x' y : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt I x' ∘ (extChartAt I x).symm) (range I)
          (extChartAt I x y) : E →ₗ[ℝ] E)) : ℤ)

variable [FiniteDimensional ℝ E]

/-- **Layer 2.1.** Two lifts define the same orientation exactly when they are equal or both
flipped: the diagonal `ℤˣ`-action. -/
def OrientationLift.setoid : Setoid (OrientationLift I M ι) where
  r l l' := l' = l ∨
    (l'.modelOrientation = -l.modelOrientation ∧ l'.sign = fun x y ↦ -l.sign x y)
  iseqv := sorry

variable (I M ι) in
/-- **Layer 2.1.** A manifold orientation: an orientation lift modulo the diagonal flip. -/
def Manifold.Orientation : Type _ :=
  Quotient (OrientationLift.setoid (I := I) (M := M) (ι := ι))

/-- **Layer 2.1.** The opposite orientation: flip the model orientation, keep the signs. -/
noncomputable def Manifold.Orientation.neg (o : Manifold.Orientation I M ι) :
    Manifold.Orientation I M ι :=
  Quotient.map (fun l ↦ { l with modelOrientation := -l.modelOrientation }) sorry o

/-- **Layer 2.1.** The orientation of a tangent space induced by a manifold orientation. -/
noncomputable def orientationAt (o : Manifold.Orientation I M ι) (x : M) :
    Orientation ℝ (TangentSpace I x) ι :=
  sorry

/-- **Layer 2.1, the characteristic equation of `orientationAt`**: at the base point of its own
chart, a lift's orientation is its model orientation twisted by the chart sign there
(`TangentSpace I x` is `E` through that chart). -/
theorem orientationAt_mk (l : OrientationLift I M ι) (x : M) :
    orientationAt (Quotient.mk _ l) x =
      (if l.sign x x = 1 then l.modelOrientation else -l.modelOrientation :
        Orientation ℝ E ι) :=
  sorry

theorem orientationAt_neg (o : Manifold.Orientation I M ι) (x : M) :
    orientationAt o.neg x = -orientationAt o x :=
  sorry

/-- **Layer 2.1.** On a preconnected manifold there are at most two orientations. -/
theorem Manifold.Orientation.eq_or_eq_neg [PreconnectedSpace M]
    (o o' : Manifold.Orientation I M ι) : o' = o ∨ o' = o.neg :=
  sorry

theorem Manifold.Orientation.neg_ne [Nonempty M] (o : Manifold.Orientation I M ι) : o.neg ≠ o :=
  sorry

variable (I M) in
/-- **Layer 2.1.** Orientability, with the canonical index type `Fin (finrank ℝ E)`. -/
def Orientable : Prop :=
  Nonempty (Manifold.Orientation I M (Fin (Module.finrank ℝ E)))

/-- **Layer 2.2.** A map is orientation-preserving at `x` when its differential is invertible
there and carries `orientationAt o x` to `orientationAt o' (f x)`; orientation-reversing when
it carries it to the negative. -/
def IsOrientationPreservingAt [FiniteDimensional ℝ E'] (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation I' M' ι) (f : M → M') (x : M) : Prop :=
  ∃ e : TangentSpace I x ≃L[ℝ] TangentSpace I' (f x),
    (e : TangentSpace I x →L[ℝ] TangentSpace I' (f x)) = mfderiv I I' f x ∧
      Orientation.map ι e.toLinearEquiv (orientationAt o x) = orientationAt o' (f x)

def IsOrientationReversingAt [FiniteDimensional ℝ E'] (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation I' M' ι) (f : M → M') (x : M) : Prop :=
  ∃ e : TangentSpace I x ≃L[ℝ] TangentSpace I' (f x),
    (e : TangentSpace I x →L[ℝ] TangentSpace I' (f x)) = mfderiv I I' f x ∧
      Orientation.map ι e.toLinearEquiv (orientationAt o x) = -orientationAt o' (f x)

/-- **Layer 2.2.** The pullback orientation along a local diffeomorphism [Lee, Prop. 15.15],
characterized by making `f` orientation-preserving everywhere. -/
noncomputable def Manifold.Orientation.pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) : Manifold.Orientation I M ι :=
  sorry

theorem isOrientationPreservingAt_pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) (x : M) :
    IsOrientationPreservingAt (o'.pullback hf hn) o' f x :=
  sorry

/-- **Layer 2.2.** A nowhere-vanishing continuous top form determines an orientation: the one
for which the form is positive on positively oriented bases. -/
theorem exists_orientation_of_topForm [IsManifold I 1 M]
    {φ : RoughForm I M ℝ (Module.finrank ℝ E)} (hφ : IsSmoothForm I 0 φ) (h0 : ∀ x, φ x ≠ 0) :
    ∃ o : Manifold.Orientation I M (Fin (Module.finrank ℝ E)),
      ∀ (x : M) (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)),
        b.orientation = orientationAt o x ↔ 0 < φ x b :=
  sorry

/-- **Layer 2.2.** Conversely an orientation admits a positively oriented smooth top form; the
partition-of-unity direction carries `[T2Space M] [SigmaCompactSpace M]` [Lee, Prop. 15.5]. -/
theorem exists_topForm_of_orientation [T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M]
    (o : Manifold.Orientation I M (Fin (Module.finrank ℝ E))) :
    ∃ φ : RoughForm I M ℝ (Module.finrank ℝ E), IsSmoothForm I ∞ φ ∧
      ∀ (x : M) (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)),
        b.orientation = orientationAt o x → 0 < φ x b :=
  sorry

/-- **Layer 2.2.** The consistently-oriented-atlas criterion is a *theorem* for boundaryless
manifolds [Lee, Prop. 15.6] — and, per *Statements that must not enter*, false as a
definition once boundaries are allowed. -/
theorem orientable_iff_exists_atlas [BoundarylessManifold I M] [IsManifold I 1 M] :
    Orientable I M ↔ ∃ 𝒜 ⊆ IsManifold.maximalAtlas I 1 M, (⋃ e ∈ 𝒜, e.source) = univ ∧
      ∀ e ∈ 𝒜, ∀ e' ∈ 𝒜, ∀ y ∈ (e.symm ≫ₕ e').source,
        0 < LinearMap.det (fderiv ℝ (I ∘ (e.symm ≫ₕ e') ∘ I.symm) (I y) : E →ₗ[ℝ] E) :=
  sorry

end Orientation

section SmoothCover

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {J : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N]
  {X : Type*} [TopologicalSpace X] {n : WithTop ℕ∞}

variable (H) in
/-- **Layer 2.3, the smooth structure of a covering space.** The charted structure on the total
space of a covering map is *induced by the map* — it cannot be a global instance on the type,
which may carry several covering presentations — so it is a constructor. Statements about it
take the charted structure on `X` as an instance argument together with the hypothesis that it
is the induced one. Its charts are characterized by `IsCoveringMap.inducedChartedSpace_chartAt`. -/
@[instance_reducible]
noncomputable def IsCoveringMap.inducedChartedSpace {p : X → M} (hp : IsCoveringMap p) :
    ChartedSpace H X :=
  sorry

/-- **Layer 2.3, the characteristic equation.** The induced chart at `x` reads a point through
the chart of `M` at `p x`, after `p`: the charts are lifted charts of the base. -/
theorem IsCoveringMap.inducedChartedSpace_chartAt {p : X → M} (hp : IsCoveringMap p)
    [c : ChartedSpace H X] (hc : c = IsCoveringMap.inducedChartedSpace H hp) (x : X) :
    EqOn (chartAt H x) (chartAt H (p x) ∘ p) (chartAt H x).source :=
  sorry

theorem IsCoveringMap.induced_isManifold [IsManifold I n M] {p : X → M} (hp : IsCoveringMap p)
    [c : ChartedSpace H X] (hc : c = IsCoveringMap.inducedChartedSpace H hp) :
    IsManifold I n X :=
  sorry

theorem IsCoveringMap.induced_isLocalDiffeomorph [IsManifold I n M] {p : X → M}
    (hp : IsCoveringMap p) [c : ChartedSpace H X] (hc : c = IsCoveringMap.inducedChartedSpace H hp) :
    IsLocalDiffeomorph I I n p :=
  sorry

/-- **Layer 2.3, uniqueness.** Any charted structure on `X` making it a `C^n` manifold and `p` a
local diffeomorphism is compatible with the induced one: the union of the two atlases is still a
`C^n` atlas. -/
theorem IsCoveringMap.induced_unique [IsManifold I n M] {p : X → M} (hp : IsCoveringMap p)
    [c : ChartedSpace H X] [IsManifold I n X] (hpc : IsLocalDiffeomorph I I n p) :
    ∀ e ∈ c.atlas, ∀ e' ∈ (IsCoveringMap.inducedChartedSpace H hp).atlas,
      e.symm ≫ₕ e' ∈ contDiffGroupoid n I :=
  sorry

/-- **Layer 2.3, lifts are smooth.** A continuous lift of a `C^n` map through a covering map is
`C^n` for the induced structure. -/
theorem ContMDiff.of_comp_isCoveringMap [IsManifold I n M] [IsManifold J n N] {p : X → M}
    (hp : IsCoveringMap p) [c : ChartedSpace H X] (hc : c = IsCoveringMap.inducedChartedSpace H hp)
    {f : N → X} (hf : Continuous f) (hpf : ContMDiff J I n (p ∘ f)) : ContMDiff J I n f :=
  sorry

end SmoothCover

section Involution

variable {E H X : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I 1 X]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

/-- **Layer 2.4, the descent API, general form.** For an involution `τ` of a manifold, the
invariant and anti-invariant parts of a form under `τ^*`, the averaging projectors
`(1 + τ^*)/2` and `(1 − τ^*)/2`. -/
noncomputable def invariantPart (τ : X → X) (φ : RoughForm I X F k) : RoughForm I X F k :=
  (2⁻¹ : ℝ) • (φ + mpullback I I τ φ)

noncomputable def antiInvariantPart (τ : X → X) (φ : RoughForm I X F k) : RoughForm I X F k :=
  (2⁻¹ : ℝ) • (φ - mpullback I I τ φ)

theorem invariantPart_add_antiInvariantPart (τ : X → X) (φ : RoughForm I X F k) :
    invariantPart τ φ + antiInvariantPart τ φ = φ :=
  sorry

/-- The projectors commute with `d` (for `C¹` forms and a `C²` involution), and preserve
compact support. -/
theorem mextDeriv_invariantPart [IsManifold I 2 X] {τ : X → X} (hτ : ContMDiff I I 2 τ)
    {φ : RoughForm I X F k} (hφ : IsSmoothForm I 1 φ) :
    mextDeriv (invariantPart τ φ) = invariantPart τ (mextDeriv φ) :=
  sorry

theorem isCompact_tsupport_invariantPart {τ : X → X} (hτ : IsProperMap τ) {φ : RoughForm I X F k}
    (hφ : IsCompact φ.tsupport) : IsCompact (invariantPart τ φ).tsupport :=
  sorry

end Involution

section OrientationCover

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [FiniteDimensional ℝ E] {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

variable (I M) in
/-- **Layer 2.4.** The orientation double cover: pairs of a point and an orientation of its
tangent space. ⚠ Its topology is *not* the sigma topology (see *Statements that must not
enter*); it is provisional here (`OrientationCover.topologicalSpace`), pinned by
`isCoveringMap_proj` and the local-triviality of the lifted charts. -/
def OrientationCover : Type _ :=
  (x : M) × Orientation ℝ (TangentSpace I x) (Fin (Module.finrank ℝ E))

namespace OrientationCover

variable (I M) in
/-- The two-sheeted projection. -/
def proj : OrientationCover I M → M := Sigma.fst

variable (I M) in
/-- The topology of the orientation cover, from chart-induced trivializations. Provisional; a
*local* instance in this file only (it carries `sorry`), pinned by `isCoveringMap_proj`. -/
@[instance_reducible]
noncomputable def topologicalSpace : TopologicalSpace (OrientationCover I M) :=
  sorry

attribute [local instance] topologicalSpace

variable (I M) in
theorem isCoveringMap_proj [IsManifold I 1 M] : IsCoveringMap (proj I M) :=
  sorry

variable (I M) in
/-- **Layer 2.4.** The smooth structure of the cover: the one induced by the covering map (2.3).
Again a local instance in this file only. -/
@[instance_reducible]
noncomputable def chartedSpace [IsManifold I 1 M] : ChartedSpace H (OrientationCover I M) :=
  IsCoveringMap.inducedChartedSpace H (isCoveringMap_proj I M)

attribute [local instance] chartedSpace

variable (I M) in
/-- The deck involution: flip the orientation, fix the point. -/
noncomputable def deck : OrientationCover I M ≃ OrientationCover I M where
  toFun p := ⟨p.1, -p.2⟩
  invFun p := ⟨p.1, -p.2⟩
  left_inv := fun ⟨x, o⟩ ↦ congrArg (Sigma.mk x) (neg_neg o)
  right_inv := fun ⟨x, o⟩ ↦ congrArg (Sigma.mk x) (neg_neg o)

omit [FiniteDimensional ℝ E] in
theorem proj_deck (p : OrientationCover I M) : proj I M (deck I M p) = proj I M p := rfl

omit [FiniteDimensional ℝ E] in
theorem deck_deck (p : OrientationCover I M) : deck I M (deck I M p) = p :=
  (deck I M).left_inv p

theorem deck_ne_self (p : OrientationCover I M) : deck I M p ≠ p :=
  sorry

variable (I M) in
theorem continuous_deck : Continuous (deck I M) :=
  sorry

variable (I M) in
theorem contMDiff_deck [IsManifold I 1 M] : ContMDiff I I 1 (deck I M) :=
  sorry

variable (I M) in
/-- **Layer 2.4.** The canonical orientation of the total space: at `⟨x, o⟩` it is `o`,
transported along `proj`; the deck involution reverses it. -/
noncomputable def canonicalOrientation [IsManifold I 1 M] :
    Manifold.Orientation I (OrientationCover I M) (Fin (Module.finrank ℝ E)) :=
  sorry

theorem orientationAt_canonicalOrientation [IsManifold I 1 M] (p : OrientationCover I M) :
    Orientation.map (Fin (Module.finrank ℝ E))
      (IsLocalDiffeomorphAt.mfderivToContinuousLinearEquiv
        ((IsCoveringMap.induced_isLocalDiffeomorph (n := 1) (isCoveringMap_proj I M)
          rfl) p) one_ne_zero).toLinearEquiv
      (orientationAt (canonicalOrientation I M) p) = p.2 :=
  sorry

theorem isOrientationReversingAt_deck [IsManifold I 1 M] (p : OrientationCover I M) :
    IsOrientationReversingAt (canonicalOrientation I M) (canonicalOrientation I M) (deck I M) p :=
  sorry

/-- **Layer 2.4, the characterizations for connected `M`** [Lee, Thm. 15.41]: orientable iff the
cover is disconnected iff it admits a continuous section (iff it is trivial). -/
theorem orientable_iff_not_connectedSpace [IsManifold I 1 M] [ConnectedSpace M] :
    Orientable I M ↔ ¬ ConnectedSpace (OrientationCover I M) :=
  sorry

theorem orientable_iff_exists_section [IsManifold I 1 M] [ConnectedSpace M] :
    Orientable I M ↔ ∃ s : M → OrientationCover I M, Continuous s ∧ ∀ x, proj I M (s x) = x :=
  sorry

/-- **Layer 2.4** [Lee, Thm. 15.43]: if `π₁(M, x)` has no subgroup of index `2`, `M` is
orientable; in particular simply connected manifolds are orientable. Consumes Tau Ceti's
covering-space classification. -/
theorem orientable_of_forall_index_ne_two [IsManifold I 1 M] [T2Space M] [ConnectedSpace M]
    [LocallyPathConnectedSpace M] (x : M)
    (h : ∀ K : Subgroup (FundamentalGroup M x), K.index ≠ 2) : Orientable I M :=
  sorry

theorem orientable_of_simplyConnectedSpace [IsManifold I 1 M] [T2Space M]
    [SimplyConnectedSpace M] [LocallyPathConnectedSpace M] : Orientable I M :=
  sorry

/-- **Layer 2.4, descent.** A form on the cover is a pullback from `M` exactly when it is
deck-invariant; this is what the averaging projectors of `invariantPart` produce, and it is
the mechanism behind 9.2's vanishing theorems for nonorientable manifolds. -/
theorem exists_mpullback_proj_eq_iff [IsManifold I 1 M]
    (φ : RoughForm I (OrientationCover I M) F k) :
    (∃ ψ : RoughForm I M F k, mpullback I I (proj I M) ψ = φ) ↔ mpullback I I (deck I M) φ = φ :=
  sorry

end OrientationCover

end OrientationCover

/-! ## Layer 3: flows -/

section FlatFlow

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- **Layer 3.1, smooth dependence on initial conditions, flat and Banach-general.** A field
which is `C^(n+1)` near `a` has a local flow which is `C^(n+1)` jointly in time and initial
condition near `(a, 0)`, obeys the flow law, and solves the equation nearby. Tau Ceti has the
finite-dimensional case, `ODE.exists_contDiffAt_localFlow`, consumed as
`exists_contDiffAt_localFlow_of_finiteDimensional` below; the Banach case is the target. -/
theorem exists_contDiffAt_localFlow_of_completeSpace [CompleteSpace E] {n : ℕ∞} (v : E → E) {a : E}
    {s : Set E} (hv : ContDiffOn ℝ (n + 1) v s) (hs : s ∈ 𝓝 a) :
    ∃ Φ : E → ℝ → E, ContDiffAt ℝ (n + 1) (fun p : E × ℝ ↦ Φ p.1 p.2) (a, 0) ∧
      (∀ x, Φ x 0 = x) ∧ (∀ x t u, Φ x (t + u) = Φ (Φ x t) u) ∧
      ∀ᶠ p in 𝓝 ((a, 0) : E × ℝ), HasDerivAt (Φ p.1) (v (Φ p.1 p.2)) p.2 :=
  sorry

/-- The finite-dimensional case is already in Tau Ceti. -/
theorem exists_contDiffAt_localFlow_of_finiteDimensional [FiniteDimensional ℝ E] {n : ℕ∞}
    (v : E → E) {a : E} {s : Set E} (hv : ContDiffOn ℝ (n + 1) v s) (hs : s ∈ 𝓝 a) :
    ∃ Φ : E → ℝ → E, ContDiffAt ℝ (n + 1) (fun p : E × ℝ ↦ Φ p.1 p.2) (a, 0) ∧
      (∀ x, Φ x 0 = x) ∧ (∀ x t u, Φ x (t + u) = Φ (Φ x t) u) ∧
      ∀ᶠ p in 𝓝 ((a, 0) : E × ℝ), HasDerivAt (Φ p.1) (v (Φ p.1 p.2)) p.2 :=
  ODE.exists_contDiffAt_localFlow v hv hs

end FlatFlow

section Flows

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] {n : WithTop ℕ∞}

/-- **Layer 3.2.** The domain of the maximal flow of a vector field: the pairs `(t, x)` with `t`
in the maximal interval of existence through `x`. Consumes Tau Ceti's
`maximalIntegralCurveInterval`. -/
def flowDomain (v : (x : M) → TangentSpace I x) : Set (ℝ × M) :=
  {p | p.1 ∈ maximalIntegralCurveInterval v p.2}

/-- **Layer 3.2.** The maximal flow, total and junk-valued: `flowOf v t x` is Tau Ceti's maximal
integral curve through `x` at time `t`. -/
noncomputable def flowOf (v : (x : M) → TangentSpace I x) (t : ℝ) (x : M) : M :=
  maximalIntegralCurve v x t

variable [T2Space M] [BoundarylessManifold I M] [CompleteSpace E]

omit [CompleteSpace E] in
/-- The flow curve through `x` is an integral curve on its interval of existence (already Tau
Ceti's `isMIntegralCurveOn_maximalIntegralCurve`). -/
theorem isMIntegralCurveOn_flowOf [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    IsMIntegralCurveOn (fun t ↦ flowOf v t x) v {t | (t, x) ∈ flowDomain v} :=
  isMIntegralCurveOn_maximalIntegralCurve hv

omit [T2Space M] in
theorem mem_flowDomain_zero [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    ((0 : ℝ), x) ∈ flowDomain v :=
  zero_mem_maximalIntegralCurveInterval hv.contMDiffAt

omit [T2Space M] in
theorem flowOf_zero [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    flowOf v 0 x = x :=
  maximalIntegralCurve_zero (mem_flowDomain_zero hv x)

/-- **Layer 3.2, the fundamental theorem of flows** [Lee, Thm. 9.12], the two halves not in Tau
Ceti: the domain is *jointly* open, and the flow is jointly `C^n` on it — this is where 3.1
enters. -/
theorem isOpen_flowDomain [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    IsOpen (flowDomain v) :=
  sorry

theorem contMDiffOn_flowOf [IsManifold I 1 M] [IsManifold I (n + 1) M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent n (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (hn : 1 ≤ n) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) I n (fun p : ℝ × M ↦ flowOf v p.1 p.2) (flowDomain v) :=
  sorry

/-- **Layer 3.2, the group law**, with the domain bookkeeping it forces. -/
theorem flowOf_add [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {s t : ℝ} {x : M}
    (hs : (s, x) ∈ flowDomain v) (ht : (t, flowOf v s x) ∈ flowDomain v) :
    (s + t, x) ∈ flowDomain v ∧ flowOf v t (flowOf v s x) = flowOf v (s + t) x :=
  sorry

/-- **Layer 3.2, the escape lemma** [Lee, Lemma 9.19], one-sided: at a finite right endpoint of
the interval of existence the curve eventually leaves every compact set. -/
theorem eventually_flowOf_notMem [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {x : M} {b : ℝ}
    (hb : IsLUB {t | (t, x) ∈ flowDomain v} b) {K : Set M} (hK : IsCompact K) :
    ∀ᶠ t in 𝓝[<] b, flowOf v t x ∉ K :=
  sorry

/-- **Layer 3.3.** A vector field is complete when its flow is defined for all time. -/
def IsCompleteVectorField (v : (x : M) → TangentSpace I x) : Prop :=
  flowDomain v = univ

/-- **Layer 3.3.** Compactly supported fields are complete [Lee, Thm. 9.16]. -/
theorem isCompleteVectorField_of_isCompact [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {K : Set M}
    (hK : IsCompact K) (hvK : ∀ x ∉ K, v x = 0) : IsCompleteVectorField v :=
  sorry

/-- **Layer 3.3.** Every `C¹` field on a compact boundaryless manifold is complete: through every
point there is a global integral curve. This former target is discharged in place by Tau
Ceti's `isMIntegralCurve_maximalIntegralCurve`. -/
theorem exists_isMIntegralCurve_of_compactSpace [IsManifold I 1 M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
    (x₀ : M) :
    ∃ γ : ℝ → M, γ 0 = x₀ ∧ IsMIntegralCurve γ v :=
  ⟨maximalIntegralCurve v x₀, maximalIntegralCurve_zero (zero_mem_maximalIntegralCurveInterval
    hv.contMDiffAt), isMIntegralCurve_maximalIntegralCurve hv⟩

theorem isCompleteVectorField_of_compactSpace [IsManifold I 1 M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M))) :
    IsCompleteVectorField v :=
  sorry

/-- **Layer 3.3.** The flow of a complete `C¹` field is a `Flow ℝ M`, together with the
`ContMDiff` statement that `Flow` itself cannot record. -/
noncomputable def toFlow [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hc : IsCompleteVectorField v) : Flow ℝ M :=
  sorry

theorem toFlow_apply [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hc : IsCompleteVectorField v) (t : ℝ) (x : M) : toFlow hv hc t x = flowOf v t x :=
  sorry

/-- **Layer 3.3, homogeneity.** ⚠ Finite dimension is genuinely needed: on an
infinite-dimensional model every continuous compactly supported field is zero. For connected
boundaryless finite-dimensional `M`, any two points are related by the time-`1` flow of a
compactly supported smooth field. -/
theorem exists_flowOf_one_eq [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    [ConnectedSpace M]
    (x y : M) :
    ∃ v : (x : M) → TangentSpace I x,
      ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)) ∧
        (∃ K : Set M, IsCompact K ∧ ∀ z ∉ K, v z = 0) ∧ flowOf v 1 x = y :=
  sorry

/-- **Layer 3.4, naturality.** `F`-related fields have `F`-conjugate flows [Lee, Prop. 9.6]. -/
theorem flowOf_comp_of_related {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [CompleteSpace E'] [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace N]
    [ChartedSpace H' N] [T2Space N] [BoundarylessManifold J N] [IsManifold I 1 M]
    [IsManifold J 1 N] {v : (x : M) → TangentSpace I x} {w : (y : N) → TangentSpace J y}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff J J.tangent 1 (fun y ↦ (⟨y, w y⟩ : TangentBundle J N)))
    {f : M → N} (hf : ContMDiff I J 1 f) (hrel : ∀ x, mfderiv I J f x (v x) = w (f x))
    {t : ℝ} {x : M} (ht : (t, x) ∈ flowDomain v) :
    (t, f x) ∈ flowDomain w ∧ f (flowOf v t x) = flowOf w t (f x) :=
  sorry

/-- **Layer 3.4, the flow characterization of the Lie derivative** [Lee, Thm. 9.38]: the
derivative at `t = 0` of the pulled-back field is the bracket. -/
theorem hasDerivAt_mpullback_flowOf [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v w : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, w y⟩ : TangentBundle I M))) (x : M) :
    HasDerivAt (fun t ↦ VectorField.mpullback I I (flowOf v t) w x)
      (VectorField.mlieBracket I v w x) 0 :=
  sorry

/-- **Layer 3.4, the straightening theorem** [Lee, Thm. 9.22], layer 4's base case: near a
point where `v ≠ 0` there is a chart carrying `v` to the constant field `e`. -/
theorem exists_chart_mfderiv_eq_const [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {x : M}
    (hx : v x ≠ 0) :
    ∃ (e : OpenPartialHomeomorph M H) (u : E), e ∈ IsManifold.maximalAtlas I ∞ M ∧
      x ∈ e.source ∧ ∀ y ∈ e.source, mfderiv I 𝓘(ℝ, E) (I ∘ e) y (v y) = u :=
  sorry

/-- **Layer 3.3, reconciliation with the Lie-group flows of Tau Ceti.** The flow of a
left-invariant field is Tau Ceti's `mulInvariantIntegralCurve`. -/
theorem flowOf_mulInvariantVectorField {G : Type*} [TopologicalSpace G] [ChartedSpace H G]
    [Group G] [LieGroup I (minSmoothness ℝ 3) G] [IsManifold I 1 G] [T2Space G]
    [BoundarylessManifold I G] (v : GroupLieAlgebra I G) (t : ℝ) (g : G) :
    flowOf (mulInvariantVectorField v) t g = mulInvariantIntegralCurve v g t :=
  sorry

/-- **Layer 3.5, time-dependent flows** [Lee, Thm. 9.48]: a time-dependent `C¹` field on an open
time slab has a local flow solving the nonautonomous equation, by the autonomous trick on
`ℝ × M`. -/
theorem exists_timeDependentFlow [IsManifold I 1 M] {v : ℝ → (x : M) → TangentSpace I x}
    (hv : ContMDiff (𝓘(ℝ, ℝ).prod I) I.tangent 1
      (fun p : ℝ × M ↦ (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) (t₀ : ℝ) (x₀ : M) :
    ∃ (U : Set (ℝ × M)) (Ψ : ℝ → ℝ × M → M), IsOpen U ∧ (t₀, x₀) ∈ U ∧
      (∀ p ∈ U, Ψ p.1 p = p.2) ∧
      ∀ p ∈ U, ∀ᶠ t in 𝓝 p.1, HasMFDerivAt 𝓘(ℝ, ℝ) I (fun s ↦ Ψ s p) t
        (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (v t (Ψ t p))) :=
  sorry

end Flows

/-! ## Layer 4: the Frobenius theorem -/

section Frobenius

universe u

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type u} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [FiniteDimensional ℝ E] {n : WithTop ℕ∞} {k : ℕ}

/-- **Layer 4.1.** A rank-`k` `C^n` distribution, in the finite-dimensional generality of
[Lee, Ch. 19] — the generality decided for this layer: a pointwise family of `k`-dimensional
subspaces of the tangent spaces, locally spanned by `k` `C^n` vector fields. -/
structure Distribution (I : ModelWithCorners ℝ E H) (M : Type u) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] [FiniteDimensional ℝ E] (n : WithTop ℕ∞) (k : ℕ) where
  /-- The subspace at each point. -/
  fiber : (x : M) → Submodule ℝ (TangentSpace I x)
  /-- Constant rank `k`. -/
  finrank_fiber : ∀ x, Module.finrank ℝ (fiber x) = k
  /-- Local frames: near every point, `k` `C^n` fields span the fibers. -/
  exists_localFrame : ∀ x : M, ∃ (U : Set M) (V : Fin k → (y : M) → TangentSpace I y),
    IsOpen U ∧ x ∈ U ∧
      (∀ i, ContMDiffOn I I.tangent n (fun y ↦ (⟨y, V i y⟩ : TangentBundle I M)) U) ∧
      ∀ y ∈ U, fiber y = Submodule.span ℝ (range fun i ↦ V i y)

namespace Distribution

variable (D : Distribution I M n k)

/-- **Layer 4.2.** Involutivity: `C^n` sections of `D` are closed under the Lie bracket. -/
def IsInvolutive : Prop :=
  ∀ V W : (x : M) → TangentSpace I x,
    ContMDiff I I.tangent n (fun y ↦ (⟨y, V y⟩ : TangentBundle I M)) →
    ContMDiff I I.tangent n (fun y ↦ (⟨y, W y⟩ : TangentBundle I M)) →
    (∀ x, V x ∈ D.fiber x) → (∀ x, W x ∈ D.fiber x) →
    ∀ x, VectorField.mlieBracket I V W x ∈ D.fiber x

/-- **Layer 4.2.** An integral manifold of `D`: an *immersed* `k`-manifold whose differential has
image *equal to* `D` — never assumed embedded, and ⚠ never merely contained in `D` (see
*Statements that must not enter*). The carrier is a type with its own charted structure. -/
structure IntegralManifold where
  /-- The underlying manifold. -/
  carrier : Type u
  [topologicalSpace : TopologicalSpace carrier]
  [chartedSpace : ChartedSpace (EuclideanSpace ℝ (Fin k)) carrier]
  [isManifold : IsManifold (𝓡 k) n carrier]
  /-- The inclusion into `M`. -/
  inclusion : carrier → M
  isImmersion : Manifold.IsImmersion (𝓡 k) I n inclusion
  range_mfderiv : ∀ y, LinearMap.range (mfderiv (𝓡 k) I inclusion y).toLinearMap =
    D.fiber (inclusion y)

attribute [instance] IntegralManifold.topologicalSpace IntegralManifold.chartedSpace
  IntegralManifold.isManifold

/-- **Layer 4.2.** The unbundled predicate: `ι : N → M` is an integral manifold of `D`. -/
def IsIntegralManifold {N : Type*} [TopologicalSpace N] [ChartedSpace (EuclideanSpace ℝ (Fin k)) N]
    [IsManifold (𝓡 k) n N] (ι : N → M) : Prop :=
  Manifold.IsImmersion (𝓡 k) I n ι ∧
    ∀ y, LinearMap.range (mfderiv (𝓡 k) I ι y).toLinearMap = D.fiber (ι y)

/-- **Layer 4.2, the easy direction** [Lee, Prop. 19.3]: a distribution with an integral manifold
through every point is involutive. -/
theorem isInvolutive_of_forall_exists_integralManifold [IsManifold I n M]
    (h : ∀ x : M, ∃ N : D.IntegralManifold, x ∈ range N.inclusion) : D.IsInvolutive :=
  sorry

/-- **Layer 4.2, the 1-form criterion** [Lee, Thm. 19.7]: `D` is involutive iff `dη` annihilates
`D` whenever the 1-form `η` does. -/
theorem isInvolutive_iff_forall_mextDeriv [IsManifold I ∞ M] (D : Distribution I M ∞ k) :
    D.IsInvolutive ↔ ∀ η : RoughForm I M ℝ 1, IsSmoothForm I ∞ η →
      (∀ x, ∀ v ∈ D.fiber x, η x ![v] = 0) →
        ∀ x, ∀ v ∈ D.fiber x, ∀ w ∈ D.fiber x, mextDeriv η x ![v, w] = 0 :=
  sorry

/-- **Layer 4.3, the local Frobenius theorem** [Lee, Thm. 19.12]: through every point of an
involutive `C^∞` distribution there is a **flat chart**, carrying `D` to a constant subspace
`W` of the model. -/
theorem exists_flatChart [IsManifold I ∞ M] [BoundarylessManifold I M] (D : Distribution I M ∞ k)
    (hD : D.IsInvolutive) (x : M) :
    ∃ (e : OpenPartialHomeomorph M H) (W : Submodule ℝ E), e ∈ IsManifold.maximalAtlas I ∞ M ∧
      x ∈ e.source ∧ Module.finrank ℝ W = k ∧
      ∀ y ∈ e.source, Submodule.map (mfderiv I 𝓘(ℝ, E) (I ∘ e) y).toLinearMap (D.fiber y) = W :=
  sorry

/-- **Layer 4.3.** Through every point there is a local integral manifold which is a single
*slice* of a flat chart, in Tau Ceti's `IsSliceChart` sense. -/
theorem exists_isSliceChart_integralManifold [IsManifold I ∞ M] [I.Boundaryless]
    (D : Distribution I M ∞ k) (hD : D.IsInvolutive) (x : M) :
    ∃ (N : D.IntegralManifold) (e : OpenPartialHomeomorph M E) (S : Set E),
      x ∈ range N.inclusion ∧ x ∈ e.source ∧ TauCeti.IsSliceChart e S (range N.inclusion) :=
  sorry

/-- **Layer 4.3, weak embeddedness** [Lee, Thm. 19.17]: a smooth map into `M` with image in an
integral manifold of an involutive distribution factors smoothly through it. -/
theorem exists_contMDiff_factor [IsManifold I ∞ M] (D : Distribution I M ∞ k)
    (hD : D.IsInvolutive) (N : D.IntegralManifold) {E' H' P : Type*} [NormedAddCommGroup E']
    [NormedSpace ℝ E'] [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace P]
    [ChartedSpace H' P] [IsManifold J ∞ P] {f : P → M} (hf : ContMDiff J I ∞ f)
    (hrange : range f ⊆ range N.inclusion) :
    ∃ g : P → N.carrier, ContMDiff J (𝓡 k) ∞ g ∧ N.inclusion ∘ g = f :=
  sorry

/-- **Layer 4.4, the global Frobenius theorem** [Lee, Thm. 19.21]: the leaf through `x`, a
connected integral manifold with its own (finer) topology — the honest immersed leaf the
subalgebra ↔ subgroup correspondence needs — characterized by `mem_range_leafThrough`,
`connectedSpace_leafThrough`, `injective_leafThrough_inclusion` and maximality. -/
noncomputable def leafThrough [IsManifold I ∞ M] (D : Distribution I M ∞ k) (hD : D.IsInvolutive)
    (x : M) : D.IntegralManifold :=
  sorry

theorem mem_range_leafThrough [IsManifold I ∞ M] (D : Distribution I M ∞ k) (hD : D.IsInvolutive)
    (x : M) : x ∈ range (D.leafThrough hD x).inclusion :=
  sorry

theorem connectedSpace_leafThrough [IsManifold I ∞ M] (D : Distribution I M ∞ k)
    (hD : D.IsInvolutive) (x : M) : ConnectedSpace (D.leafThrough hD x).carrier :=
  sorry

theorem injective_leafThrough_inclusion [IsManifold I ∞ M] (D : Distribution I M ∞ k)
    (hD : D.IsInvolutive) (x : M) : Function.Injective (D.leafThrough hD x).inclusion :=
  sorry

/-- Maximality: every connected integral manifold through `x` factors smoothly through the
leaf. -/
theorem leafThrough_maximal [IsManifold I ∞ M] (D : Distribution I M ∞ k) (hD : D.IsInvolutive)
    (x : M) (N : D.IntegralManifold) [ConnectedSpace N.carrier] (hx : x ∈ range N.inclusion) :
    ∃ g : N.carrier → (D.leafThrough hD x).carrier, ContMDiff (𝓡 k) (𝓡 k) ∞ g ∧
      (D.leafThrough hD x).inclusion ∘ g = N.inclusion :=
  sorry

/-- The leaves partition `M`. -/
theorem leafThrough_eq_or_disjoint [IsManifold I ∞ M] (D : Distribution I M ∞ k)
    (hD : D.IsInvolutive) (x y : M) :
    range (D.leafThrough hD x).inclusion = range (D.leafThrough hD y).inclusion ∨
      Disjoint (range (D.leafThrough hD x).inclusion) (range (D.leafThrough hD y).inclusion) :=
  sorry

end Distribution

/-- **Layer 4.2, the named nonexample**: the rank-2 distribution on `ℝ³` spanned by
`∂x + y ∂z` and `∂y` (the contact distribution `ker (dz − y dx)`). -/
noncomputable def contactDistribution :
    Distribution 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) (EuclideanSpace ℝ (Fin 3)) ∞ 2 where
  fiber p := Submodule.span ℝ
    {EuclideanSpace.single 0 1 + p 1 • EuclideanSpace.single 2 1, EuclideanSpace.single 1 1}
  finrank_fiber := sorry
  exists_localFrame := sorry

/-- **Layer 4.4, acceptance.** The contact distribution is not involutive, hence (by
`isInvolutive_of_forall_exists_integralManifold`) has no integral surface through any point. -/
theorem not_isInvolutive_contactDistribution : ¬ contactDistribution.IsInvolutive :=
  sorry

end Frobenius

/-! ## Layer 5: integration on manifolds and Stokes' theorem -/

section NullSet

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

/-- **Layers 5.1 and 10.2.** Null sets of a manifold, read through charts: a set whose image in
every extended chart is null for Haar measure on the model. Well defined without any measurable
structure on `M`; the Borel structure of the model is a hypothesis. -/
def IsNullSet (I : ModelWithCorners ℝ E H) [MeasurableSpace E] [BorelSpace E] (s : Set M) : Prop :=
  ∀ x : M, ∀ (μ : MeasureTheory.Measure E) [μ.IsAddHaarMeasure],
    μ (extChartAt I x '' (s ∩ (extChartAt I x).source)) = 0

end NullSet

section Boundary

variable {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) 1 M] {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {j : ℕ}

/-- **Layer 5.1, the boundary interface, over the half-space model.** The boundary manifold is Tau
Ceti's (`TauCeti.boundaryChartedSpace`, `TauCeti.isManifold_boundary`,
`TauCeti.isSmoothEmbedding_subtypeVal_boundary`); restriction of forms to it is pullback along
the inclusion. -/
noncomputable def boundaryRestriction (φ : RoughForm (𝓡∂ (n + 1)) M F j) :
    RoughForm 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ((𝓡∂ (n + 1)).boundary M) F j :=
  mpullback 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val φ

/-- Restriction commutes with `d`, and preserves smoothness, on the consumed boundary manifold. -/
theorem boundaryRestriction_mextDeriv [IsManifold (𝓡∂ (n + 1)) 2 M]
    {φ : RoughForm (𝓡∂ (n + 1)) M F j} (hφ : IsSmoothForm (𝓡∂ (n + 1)) 1 φ) :
    boundaryRestriction (mextDeriv φ) = mextDeriv (boundaryRestriction φ) :=
  sorry

/-- **Layer 5.1.** Outward-pointing tangent vectors at a boundary point: in the preferred chart,
the zeroth coordinate (the one Mathlib's half-space constrains) decreases. -/
def IsOutwardPointing (x : M) (v : TangentSpace (𝓡∂ (n + 1)) x) : Prop :=
  x ∈ (𝓡∂ (n + 1)).boundary M ∧
    (id (mfderiv (𝓡∂ (n + 1)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1)))
      (extChartAt (𝓡∂ (n + 1)) x) x v) : EuclideanSpace ℝ (Fin (n + 1))) 0 < 0

/-- **Layer 5.1.** An outward-pointing smooth field along the boundary exists [Lee, Prop. 15.33]. -/
theorem exists_isOutwardPointing [T2Space M] [SigmaCompactSpace M] [IsManifold (𝓡∂ (n + 1)) ∞ M] :
    ∃ v : (x : M) → TangentSpace (𝓡∂ (n + 1)) x,
      ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle (𝓡∂ (n + 1)) M)) ∧
        ∀ x ∈ (𝓡∂ (n + 1)).boundary M, IsOutwardPointing x (v x) :=
  sorry

/-- **Layer 5.1, the induced boundary orientation**, outward-first [Lee, Prop. 15.24]; pinned by
`boundaryOrientation_spec`. -/
noncomputable def boundaryOrientation (o : Manifold.Orientation (𝓡∂ (n + 1)) M (Fin (n + 1))) :
    Manifold.Orientation 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ((𝓡∂ (n + 1)).boundary M) (Fin n) :=
  sorry

/-- Outward-first: a basis of `T_x ∂M` is positively oriented for the boundary orientation iff an
outward vector followed by (the image of) that basis is positively oriented for `o`. -/
theorem boundaryOrientation_spec (o : Manifold.Orientation (𝓡∂ (n + 1)) M (Fin (n + 1)))
    (x : (𝓡∂ (n + 1)).boundary M) {v : TangentSpace (𝓡∂ (n + 1)) (x : M)} (hv : IsOutwardPointing (x : M) v)
    (b : Module.Basis (Fin n) ℝ (TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x))
    (b' : Module.Basis (Fin (n + 1)) ℝ (TangentSpace (𝓡∂ (n + 1)) (x : M)))
    (hb' : ⇑b' = Fin.cons v (fun i ↦ mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1))
      Subtype.val x (b i))) :
    b.orientation = orientationAt (boundaryOrientation o) x ↔ b'.orientation = orientationAt o x :=
  sorry

/-- **Layer 5.1.** The boundary is a null set, in the form 5.2's well-definedness needs. -/
theorem isNullSet_boundary : IsNullSet (𝓡∂ (n + 1)) ((𝓡∂ (n + 1)).boundary M) :=
  sorry

end Boundary

section Integration

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  [FiniteDimensional ℝ E'] [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} {M' : Type*}
  [TopologicalSpace M'] [ChartedSpace H' M'] {m : ℕ}

/-- **Layer 5.2.** The integral of a top-degree form against an orientation, total and
junk-valued (zero unless `φ` is compactly supported and `m = finrank ℝ E`). Its construction is
pinned by `integralTopForm_of_tsupport_subset_chart`: chart by chart, against the Haar measure
of a basis positively oriented for the lift's model orientation, weighted by the chart signs. -/
noncomputable def integralTopForm (o : Manifold.Orientation I M (Fin m)) (φ : RoughForm I M ℝ m) :
    ℝ :=
  sorry

/-- **Layer 5.2, the characteristic equation.** For a form supported in one chart, the integral is
the chart integral of its coefficient — in a basis `b` positively oriented for the lift's model
orientation, against `b.addHaar` — weighted by the lift's chart signs. Independence of `b` among
equally oriented bases, of the chart, of the partition of unity, and of the lift, are the
well-definedness theorems. -/
theorem integralTopForm_of_tsupport_subset_chart [IsManifold I 1 M] [MeasurableSpace E]
    [BorelSpace E] (hm : Module.finrank ℝ E = m) (l : OrientationLift I M (Fin m))
    {φ : RoughForm I M ℝ m} (hφ : IsSmoothForm I 0 φ) (hc : IsCompact φ.tsupport) (x : M)
    (hx : φ.tsupport ⊆ (chartAt H x).source) (b : Module.Basis (Fin m) ℝ E)
    (hb : b.orientation = l.modelOrientation) :
    integralTopForm (Quotient.mk _ l) φ =
      ∫ y in (extChartAt I x).target,
        ((l.sign x ((extChartAt I x).symm y) : ℤ) : ℝ) *
          mpullback 𝓘(ℝ, E) I (extChartAt I x).symm φ y (fun i ↦ b i) ∂b.addHaar :=
  sorry

theorem integralTopForm_add [IsManifold I 1 M] (o : Manifold.Orientation I M (Fin m))
    {φ ψ : RoughForm I M ℝ m} (hφ : IsSmoothForm I 0 φ) (hψ : IsSmoothForm I 0 ψ)
    (hφc : IsCompact φ.tsupport) (hψc : IsCompact ψ.tsupport) :
    integralTopForm o (φ + ψ) = integralTopForm o φ + integralTopForm o ψ :=
  sorry

theorem integralTopForm_smul (o : Manifold.Orientation I M (Fin m)) (c : ℝ)
    (φ : RoughForm I M ℝ m) : integralTopForm o (c • φ) = c * integralTopForm o φ :=
  sorry

/-- **Layer 5.2.** `∫_{−M} φ = −∫_M φ`. -/
theorem integralTopForm_neg (o : Manifold.Orientation I M (Fin m)) (φ : RoughForm I M ℝ m) :
    integralTopForm o.neg φ = -integralTopForm o φ :=
  sorry

/-- **Layer 5.2, positivity** — for compactly supported forms that are nonnegative and somewhere
positive against the orientation; ⚠ not for orientation forms as such, which on noncompact `M`
are never compactly supported. -/
theorem integralTopForm_pos [IsManifold I 1 M] [T2Space M] [SigmaCompactSpace M]
    (hm : Module.finrank ℝ E = m) (o : Manifold.Orientation I M (Fin m)) {φ : RoughForm I M ℝ m}
    (hφ : IsSmoothForm I 0 φ) (hc : IsCompact φ.tsupport)
    (hnn : ∀ (x : M) (b : Module.Basis (Fin m) ℝ (TangentSpace I x)),
      b.orientation = orientationAt o x → 0 ≤ φ x b)
    (hpos : ∃ (x : M) (b : Module.Basis (Fin m) ℝ (TangentSpace I x)),
      b.orientation = orientationAt o x ∧ 0 < φ x b) :
    0 < integralTopForm o φ :=
  sorry

/-- **Layer 5.2, diffeomorphism invariance, in both signed forms** [Lee, Prop. 16.6]. -/
theorem integralTopForm_mpullback_of_preserving [IsManifold I ∞ M] [IsManifold I' ∞ M']
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation I' M' (Fin m))
    (f : M ≃ₘ⟮I, I'⟯ M') (hf : ∀ x, IsOrientationPreservingAt o o' f x)
    (φ : RoughForm I' M' ℝ m) :
    integralTopForm o (mpullback I I' f φ) = integralTopForm o' φ :=
  sorry

theorem integralTopForm_mpullback_of_reversing [IsManifold I ∞ M] [IsManifold I' ∞ M']
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation I' M' (Fin m))
    (f : M ≃ₘ⟮I, I'⟯ M') (hf : ∀ x, IsOrientationReversingAt o o' f x)
    (φ : RoughForm I' M' ℝ m) :
    integralTopForm o (mpullback I I' f φ) = -integralTopForm o' φ :=
  sorry

end Integration

section Stokes

variable {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) 1 M]

/-- **Layer 5.3, Stokes' theorem**: for an oriented `C^∞` manifold with boundary (half-space
model) and a compactly supported `C¹` `n`-form, `∫_M dφ = ∫_{∂M} ι^*φ`, the boundary carrying the
outward-first orientation of 5.1. -/
theorem integralTopForm_mextDeriv [T2Space M] [SigmaCompactSpace M] [IsManifold (𝓡∂ (n + 1)) ∞ M]
    (o : Manifold.Orientation (𝓡∂ (n + 1)) M (Fin (n + 1))) {φ : RoughForm (𝓡∂ (n + 1)) M ℝ n}
    (hφ : IsSmoothForm (𝓡∂ (n + 1)) 1 φ) (hc : IsCompact φ.tsupport) :
    integralTopForm o (mextDeriv φ) = integralTopForm (boundaryOrientation o) (boundaryRestriction φ) :=
  sorry

end Stokes

section StokesBoundaryless

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {m : ℕ}

/-- **Layer 5.3.** On a boundaryless manifold exact compactly supported top forms integrate to
zero [Lee, Cor. 16.13]. -/
theorem integralTopForm_mextDeriv_eq_zero [IsManifold I 1 M] [IsManifold I ∞ M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] (o : Manifold.Orientation I M (Fin (m + 1)))
    {φ : RoughForm I M ℝ m} (hφ : IsSmoothForm I 1 φ) (hc : IsCompact φ.tsupport) :
    integralTopForm o (mextDeriv φ) = 0 :=
  sorry

end StokesBoundaryless

section HomotopyOperator

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

/-- The inclusion of `M` at height `t` in the cylinder `M × [0, 1]`. -/
def sliceInclusion (t : Set.Icc (0 : ℝ) 1) (x : M) : M × Set.Icc (0 : ℝ) 1 := (x, t)

/-- **Layer 5.4, the homotopy operator** `h φ = ∫_0^1 ι_t^*(ι_{∂_t} φ) dt` on forms on the cylinder,
provisional; pinned by `homotopyOperator_spec`. -/
noncomputable def homotopyOperator
    (φ : RoughForm (I.prod (𝓡∂ 1)) (M × Set.Icc (0 : ℝ) 1) F (k + 1)) : RoughForm I M F k :=
  sorry

/-- **Layer 5.4, the cochain-homotopy identity**, proved directly (differentiation under the
integral and the FTC in the `Within` calculus), *not* through Stokes, so that it holds for `M`
with boundary and 6.3 carries no corners debt. Precise regularity: for a `C¹` form `φ`, `h φ`
is `C¹` and `ι₁^*φ − ι₀^*φ = d(hφ) + h(dφ)` pointwise. -/
theorem homotopyOperator_spec [IsManifold I 2 M]
    {φ : RoughForm (I.prod (𝓡∂ 1)) (M × Set.Icc (0 : ℝ) 1) F (k + 1)}
    (hφ : IsSmoothForm (I.prod (𝓡∂ 1)) 1 φ) :
    IsSmoothForm I 1 (homotopyOperator φ) ∧
      ∀ x, mpullback I (I.prod (𝓡∂ 1)) (sliceInclusion 1) φ x -
          mpullback I (I.prod (𝓡∂ 1)) (sliceInclusion 0) φ x =
        mextDeriv (homotopyOperator φ) x + homotopyOperator (mextDeriv φ) x :=
  sorry

end HomotopyOperator

section Densities

/-- **Layer 5.5.** A density on a real vector space: a function of `m`-tuples that transforms
by `|det|`. -/
structure Density (V : Type*) [AddCommGroup V] [Module ℝ V] (m : ℕ) where
  toFun : (Fin m → V) → ℝ
  map_comp : ∀ (T : V →ₗ[ℝ] V) (v : Fin m → V), toFun (T ∘ v) = |LinearMap.det T| * toFun v

/-- Densities are scaled pointwise. -/
instance {V : Type*} [AddCommGroup V] [Module ℝ V] {m : ℕ} : SMul ℝ (Density V m) :=
  ⟨fun c μ ↦ ⟨fun v ↦ c * μ.toFun v, fun T v ↦ by rw [μ.map_comp]; ring⟩⟩

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {m : ℕ}

/-- **Layer 5.5.** Rough densities on a manifold. -/
abbrev RoughDensity (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (m : ℕ) : Type _ :=
  (x : M) → Density (TangentSpace I x) m

/-- **Layer 5.5.** The density `φ · sign_o` of a top form and an orientation; pinned by
`toDensity_apply`. -/
noncomputable def RoughForm.toDensity (φ : RoughForm I M ℝ m) (o : Manifold.Orientation I M (Fin m)) :
    RoughDensity I M m :=
  sorry

open scoped Classical in
theorem RoughForm.toDensity_apply (hm : Module.finrank ℝ E = m) (φ : RoughForm I M ℝ m)
    (o : Manifold.Orientation I M (Fin m)) (x : M)
    (b : Module.Basis (Fin m) ℝ (TangentSpace I x)) :
    (φ.toDensity o x).toFun b = if b.orientation = orientationAt o x then φ x b else -φ x b :=
  sorry

/-- **Layer 5.5.** Integration of compactly supported continuous densities, orientation-free;
`integralTopForm_eq_integralDensity` identifies it with 5.2 on oriented manifolds, and 12.4's
Riemannian measure is induced from `riemannianDensity` through it. -/
noncomputable def integralDensity (μ : RoughDensity I M m) : ℝ :=
  sorry

theorem integralTopForm_eq_integralDensity (o : Manifold.Orientation I M (Fin m))
    (φ : RoughForm I M ℝ m) : integralTopForm o φ = integralDensity (φ.toDensity o) :=
  sorry

end Densities

section Gates

/-- **Layer 5.5, acceptance: the angular form.** The flat form `x dy − y dx` on `ℂ = ℝ²`, and its
pullback `dθ` to the circle along the inclusion. -/
noncomputable def planeAngularForm : RoughForm 𝓘(ℝ, ℂ) ℂ ℝ 1 :=
  fun z ↦ ContinuousAlternatingMap.ofSubsingleton ℝ ℂ ℝ (0 : Fin 1)
    (z.re • Complex.imCLM - z.im • Complex.reCLM)

noncomputable def circleAngularForm : RoughForm (𝓡 1) Circle ℝ 1 :=
  mpullback (𝓡 1) 𝓘(ℝ, ℂ) (fun z : Circle ↦ (z : ℂ)) planeAngularForm

/-- `∫_{S¹} dθ = ±2π`, the sign being that of the orientation; the number every later gate reuses
to catch orientation drift. -/
theorem abs_integralTopForm_circleAngularForm (o : Manifold.Orientation (𝓡 1) Circle (Fin 1)) :
    |integralTopForm o circleAngularForm| = 2 * Real.pi :=
  sorry

/-- **Layer 5.5, acceptance: the fundamental theorem of calculus on `Icc 0 1`.** The standard
orientation of the interval is the one positive on Mathlib's tangent vector `1`. -/
noncomputable def Icc.standardOrientation :
    Manifold.Orientation (𝓡∂ 1) (Set.Icc (0 : ℝ) 1) (Fin 1) :=
  sorry

theorem integralTopForm_mextDeriv_ofFunction_Icc {f : Set.Icc (0 : ℝ) 1 → ℝ}
    (hf : ContMDiff (𝓡∂ 1) 𝓘(ℝ) 1 f) :
    integralTopForm Icc.standardOrientation (mextDeriv (RoughForm.ofFunction (𝓡∂ 1) f)) =
      f ⟨1, by norm_num⟩ - f ⟨0, by norm_num⟩ :=
  sorry

end Gates

/-! ## Layer 6: the de Rham complex and cohomology -/

section DeRham

open CategoryTheory

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M]
  {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} {M' : Type*} [TopologicalSpace M'] [ChartedSpace H' M']
  [IsManifold I' 1 M'] [IsManifold I' ∞ M']
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

variable (I M) in
/-- **Layer 6.1.** The exterior derivative as a linear map on smooth forms. -/
noncomputable def mextDerivₗ (k : ℕ) : SmoothForm I M ℝ k →ₗ[ℝ] SmoothForm I M ℝ (k + 1) where
  toFun φ := ⟨mextDeriv φ, mem_smoothForms.2 (isSmoothForm_mextDeriv_infty (mem_smoothForms.1 φ.2))⟩
  map_add' := sorry
  map_smul' := sorry

theorem mextDerivₗ_apply (φ : SmoothForm I M ℝ k) :
    (mextDerivₗ I M k φ : RoughForm I M ℝ (k + 1)) = mextDeriv φ :=
  rfl

theorem mextDerivₗ_comp_mextDerivₗ (k : ℕ) :
    (mextDerivₗ I M (k + 1)).comp (mextDerivₗ I M k) = 0 :=
  sorry

variable (I M) in
/-- **Layer 6.1.** The de Rham complex, as a `CochainComplex (ModuleCat ℝ) ℕ` via
`CochainComplex.of`; `d ∘ d = 0` is `mextDerivₗ_comp_mextDerivₗ`. -/
noncomputable def deRhamComplex : CochainComplex (ModuleCat ℝ) ℕ :=
  CochainComplex.of (fun k ↦ ModuleCat.of ℝ (SmoothForm I M ℝ k))
    (fun k ↦ ModuleCat.ofHom (mextDerivₗ I M k)) sorry

/-- **Layer 6.1.** Closed and exact rough forms. -/
def IsClosedForm (φ : RoughForm I M F k) : Prop := mextDeriv φ = 0

def IsExactForm (φ : RoughForm I M F (k + 1)) : Prop :=
  ∃ ψ : RoughForm I M F k, IsSmoothForm I ∞ ψ ∧ mextDeriv ψ = φ

variable (I M) in
noncomputable def closedForms (k : ℕ) : Submodule ℝ (SmoothForm I M ℝ k) := LinearMap.ker (mextDerivₗ I M k)

variable (I M) in
noncomputable def exactForms : (k : ℕ) → Submodule ℝ (SmoothForm I M ℝ k)
  | 0 => ⊥
  | k + 1 => LinearMap.range (mextDerivₗ I M k)

theorem exactForms_le_closedForms (k : ℕ) : exactForms I M k ≤ closedForms I M k :=
  sorry

variable (I M) in
/-- **Layer 6.1.** De Rham cohomology: the homology of `deRhamComplex`, with its concrete
presentation given by the cycle-class map `deRhamCohomology.mk` — linear, surjective, with
kernel the exact forms (`ker_mk`) — which is what analytic arguments compute with. -/
abbrev deRhamCohomology (k : ℕ) : Type _ :=
  ((deRhamComplex I M).homology k)

variable (I M) in
/-- The class of a closed form. -/
noncomputable def deRhamCohomology.mk (k : ℕ) : ↥(closedForms I M k) →ₗ[ℝ] deRhamCohomology I M k :=
  sorry

theorem deRhamCohomology.mk_surjective (k : ℕ) : Function.Surjective (deRhamCohomology.mk I M k) :=
  sorry

theorem deRhamCohomology.ker_mk (k : ℕ) :
    LinearMap.ker (deRhamCohomology.mk I M k) = (exactForms I M k).comap (closedForms I M k).subtype :=
  sorry

/-- **Layer 6.1, functoriality.** Pullback as a linear map on smooth forms, and the induced map on
cohomology, with `map_id` and `map_comp` as unbundled lemmas — no manifold category. -/
noncomputable def mpullbackₗ {f : M → M'} (hf : ContMDiff I I' ∞ f) (k : ℕ) :
    SmoothForm I' M' ℝ k →ₗ[ℝ] SmoothForm I M ℝ k where
  toFun φ := ⟨mpullback I I' f φ,
    mem_smoothForms.2 (isSmoothForm_mpullback_infty hf (mem_smoothForms.1 φ.2))⟩
  map_add' := sorry
  map_smul' := sorry

theorem mpullbackₗ_mem_closedForms {f : M → M'} (hf : ContMDiff I I' ∞ f) {φ : SmoothForm I' M' ℝ k}
    (hφ : φ ∈ closedForms I' M' k) : mpullbackₗ hf k φ ∈ closedForms I M k :=
  sorry

noncomputable def deRhamCohomology.map {f : M → M'} (hf : ContMDiff I I' ∞ f) (k : ℕ) :
    deRhamCohomology I' M' k →ₗ[ℝ] deRhamCohomology I M k :=
  sorry

theorem deRhamCohomology.map_mk {f : M → M'} (hf : ContMDiff I I' ∞ f) {φ : SmoothForm I' M' ℝ k}
    (hφ : φ ∈ closedForms I' M' k) :
    deRhamCohomology.map hf k (deRhamCohomology.mk I' M' k ⟨φ, hφ⟩) =
      deRhamCohomology.mk I M k ⟨mpullbackₗ hf k φ, mpullbackₗ_mem_closedForms hf hφ⟩ :=
  sorry

theorem deRhamCohomology.map_id (k : ℕ) :
    deRhamCohomology.map (contMDiff_id (I := I) (M := M) (n := ∞)) k = LinearMap.id :=
  sorry

theorem deRhamCohomology.map_comp {E'' H'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E'']
    [TopologicalSpace H''] {I'' : ModelWithCorners ℝ E'' H''} {M'' : Type*} [TopologicalSpace M'']
    [ChartedSpace H'' M''] [IsManifold I'' 1 M''] [IsManifold I'' ∞ M''] {f : M → M'} {g : M' → M''}
    (hf : ContMDiff I I' ∞ f) (hg : ContMDiff I' I'' ∞ g) (k : ℕ) :
    deRhamCohomology.map (hg.comp hf) k = (deRhamCohomology.map hf k).comp (deRhamCohomology.map hg k) :=
  sorry

/-- **Layer 6.2.** `H⁰` is the locally constant functions. -/
noncomputable def deRhamCohomologyZeroEquiv : deRhamCohomology I M 0 ≃ₗ[ℝ] LocallyConstant M ℝ :=
  sorry

/-- **Layer 6.2.** The manifold Poincaré lemma: closed forms are locally exact, manifolds with
boundary included (via the relative flat lemma `exists_extDerivWithin_eq_of_starConvex`). -/
theorem exists_mextDeriv_eq_nhds {φ : RoughForm I M F (k + 1)} (hφ : IsSmoothForm I ∞ φ)
    (hclosed : IsClosedForm φ) (x : M) :
    ∃ U ∈ 𝓝 x, ∃ ψ : RoughForm I M F k, IsSmoothForm I ∞ ψ ∧ ∀ y ∈ U, mextDeriv ψ y = φ y :=
  sorry

/-- **Layer 6.3, homotopy invariance**, via 5.4's cochain-homotopy identity, hence with no
boundaryless restriction on `M`. -/
theorem deRhamCohomology.map_eq_of_homotopy {f g : M → M'} (hf : ContMDiff I I' ∞ f)
    (hg : ContMDiff I I' ∞ g) {Hm : M × Set.Icc (0 : ℝ) 1 → M'}
    (hH : ContMDiff (I.prod (𝓡∂ 1)) I' ∞ Hm) (h0 : ∀ x, Hm (x, 0) = f x) (h1 : ∀ x, Hm (x, 1) = g x)
    (k : ℕ) : deRhamCohomology.map hf k = deRhamCohomology.map hg k :=
  sorry

/-- **Layer 6.3, acceptance.** `H^k_dR(E) = 0` for `k ≥ 1`, on any normed space `E`. -/
theorem subsingleton_deRhamCohomology_normedSpace (E : Type*) [NormedAddCommGroup E]
    [NormedSpace ℝ E] (k : ℕ) : Subsingleton (deRhamCohomology 𝓘(ℝ, E) E (k + 1)) :=
  sorry

/-- **Layer 6.3.** The integral of a 1-form along a `C¹` path, by pullback to the interval. -/
noncomputable def pathIntegral (φ : RoughForm I M ℝ 1) (γ : ℝ → M) (a b : ℝ) : ℝ :=
  ∫ t in a..b, φ (γ t) ![mfderiv 𝓘(ℝ, ℝ) I γ t 1]

/-- **Layer 6.3, the `H¹`–`π₁` bridge** [Lee, Thm. 17.17], in the form that matters: a closed
1-form whose integral over every smooth loop vanishes is exact. -/
theorem isExactForm_of_forall_pathIntegral_eq_zero [ConnectedSpace M] {φ : RoughForm I M ℝ 1}
    (hφ : IsSmoothForm I ∞ φ) (hclosed : IsClosedForm φ) (x₀ : M)
    (h : ∀ γ : ℝ → M, ContMDiff 𝓘(ℝ, ℝ) I ∞ γ → γ 0 = x₀ → γ 1 = x₀ → pathIntegral φ γ 0 1 = 0) :
    IsExactForm φ :=
  sorry

theorem subsingleton_deRhamCohomology_one_of_simplyConnected [SimplyConnectedSpace M]
    [LocallyPathConnectedSpace M] : Subsingleton (deRhamCohomology I M 1) :=
  sorry

/-! ### Layer 6.4: compact supports -/

variable (I M) in
/-- **Layer 6.4.** Compactly supported smooth forms, pinned by `mem_compactlySupportedForms`. -/
def compactlySupportedForms (k : ℕ) : Submodule ℝ (SmoothForm I M ℝ k) :=
  sorry

theorem mem_compactlySupportedForms {φ : SmoothForm I M ℝ k} :
    φ ∈ compactlySupportedForms I M k ↔ IsCompact (φ : RoughForm I M ℝ k).tsupport :=
  sorry

/-- **Layer 6.4.** The compactly supported de Rham complex; its objects are pinned by
`compactlySupportedDeRhamComplex_X`, its differential is `mextDerivₗ` restricted. -/
noncomputable def compactlySupportedDeRhamComplex (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M] [IsManifold I ∞ M] :
    CochainComplex (ModuleCat ℝ) ℕ :=
  sorry

theorem compactlySupportedDeRhamComplex_X (k : ℕ) :
    (compactlySupportedDeRhamComplex I M).X k = ModuleCat.of ℝ (compactlySupportedForms I M k) :=
  sorry

variable (I M) in
/-- **Layer 6.4.** `H^•_c`. -/
abbrev compactlySupportedDeRhamCohomology (k : ℕ) : Type _ :=
  ((compactlySupportedDeRhamComplex I M).homology k)

variable (I M) in
/-- **Layer 6.4, extension by zero** `j_!` along an open inclusion: the *covariant* functoriality of
`Ω_c^•`, the arrow of 7.3's sequence. -/
noncomputable def extensionByZero (U : TopologicalSpace.Opens M) (k : ℕ) :
    compactlySupportedForms I U k →ₗ[ℝ] compactlySupportedForms I M k :=
  sorry

theorem extensionByZero_apply_of_mem (U : TopologicalSpace.Opens M)
    (φ : compactlySupportedForms I U k) (x : U) :
    ((extensionByZero I M U k φ : SmoothForm I M ℝ k) : RoughForm I M ℝ k) x =
      ((φ : SmoothForm I U ℝ k) : RoughForm I U ℝ k) x :=
  sorry

theorem extensionByZero_apply_of_notMem (U : TopologicalSpace.Opens M)
    (φ : compactlySupportedForms I U k) {x : M} (hx : x ∉ U) :
    ((extensionByZero I M U k φ : SmoothForm I M ℝ k) : RoughForm I M ℝ k) x = 0 :=
  sorry

/-- **Layer 6.4, proper pullback**: the *contravariant* functoriality of `Ω_c^•`, along proper
maps only — ⚠ and nothing at all for a general smooth map. -/
noncomputable def properPullback {f : M → M'} (hf : ContMDiff I I' ∞ f) (hp : IsProperMap f)
    (k : ℕ) : compactlySupportedForms I' M' k →ₗ[ℝ] compactlySupportedForms I M k :=
  sorry

theorem properPullback_apply {f : M → M'} (hf : ContMDiff I I' ∞ f) (hp : IsProperMap f)
    (φ : compactlySupportedForms I' M' k) :
    ((properPullback hf hp k φ : SmoothForm I M ℝ k) : RoughForm I M ℝ k) =
      mpullback I I' f ((φ : SmoothForm I' M' ℝ k) : RoughForm I' M' ℝ k) :=
  sorry

/-- **Layer 6.4.** `H^n_c(ℝⁿ) ≅ ℝ` [Lee, Lemma 17.27] and `H^j_c(ℝⁿ) = 0` for `j < n`
[Lee, Thm. 17.28] — both base cases of 9.3, since compact supports are not homotopy invariant. -/
theorem compactlySupportedDeRhamCohomology_top (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] :
    Nonempty (compactlySupportedDeRhamCohomology 𝓘(ℝ, E) E (Module.finrank ℝ E) ≃ₗ[ℝ] ℝ) :=
  sorry

theorem subsingleton_compactlySupportedDeRhamCohomology_of_lt (E : Type*) [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] {j : ℕ} (hj : j < Module.finrank ℝ E) :
    Subsingleton (compactlySupportedDeRhamCohomology 𝓘(ℝ, E) E j) :=
  sorry

/-! ### Layer 7: Mayer–Vietoris -/

/-- **Layer 7.1.** The Mayer–Vietoris short complex
`0 → Ω^•(U ⊔ V) → Ω^•(U) ⊕ Ω^•(V) → Ω^•(U ⊓ V) → 0`, sign convention `(res, −res)`; its three
terms are pinned by the `_X` lemmas and its exactness is `mayerVietorisShortComplex_shortExact`.
The long exact sequence is then Mathlib's `ShortComplex.ShortExact.homology_exact₁/₂/₃`. -/
noncomputable def mayerVietorisShortComplex (I : ModelWithCorners ℝ E H) [IsManifold I 1 M]
    [IsManifold I ∞ M] (U V : TopologicalSpace.Opens M) :
    ShortComplex (CochainComplex (ModuleCat ℝ) ℕ) :=
  sorry

theorem mayerVietorisShortComplex_X₁ (U V : TopologicalSpace.Opens M) :
    (mayerVietorisShortComplex I U V).X₁ = deRhamComplex I (U ⊔ V : TopologicalSpace.Opens M) :=
  sorry

theorem mayerVietorisShortComplex_X₂ (U V : TopologicalSpace.Opens M) :
    (mayerVietorisShortComplex I U V).X₂ = Limits.biprod (deRhamComplex I U) (deRhamComplex I V) :=
  sorry

theorem mayerVietorisShortComplex_X₃ (U V : TopologicalSpace.Opens M) :
    (mayerVietorisShortComplex I U V).X₃ = deRhamComplex I (U ⊓ V : TopologicalSpace.Opens M) :=
  sorry

/-- Exactness needs the standing hypotheses: surjectivity is a partition-of-unity statement. -/
theorem mayerVietorisShortComplex_shortExact [T2Space M] [SigmaCompactSpace M]
    [FiniteDimensional ℝ E] (U V : TopologicalSpace.Opens M) :
    (mayerVietorisShortComplex I U V).ShortExact :=
  sorry

/-- **Layer 7.3.** The compactly supported variant, arrows reversed (extension by zero):
`0 → Ω_c^•(U ⊓ V) → Ω_c^•(U) ⊕ Ω_c^•(V) → Ω_c^•(U ⊔ V) → 0`. -/
noncomputable def compactlySupportedMayerVietorisShortComplex (I : ModelWithCorners ℝ E H)
    [IsManifold I 1 M] [IsManifold I ∞ M] (U V : TopologicalSpace.Opens M) :
    ShortComplex (CochainComplex (ModuleCat ℝ) ℕ) :=
  sorry

theorem compactlySupportedMayerVietorisShortComplex_X₁ (U V : TopologicalSpace.Opens M) :
    (compactlySupportedMayerVietorisShortComplex I U V).X₁ =
      compactlySupportedDeRhamComplex I (U ⊓ V : TopologicalSpace.Opens M) :=
  sorry

theorem compactlySupportedMayerVietorisShortComplex_X₃ (U V : TopologicalSpace.Opens M) :
    (compactlySupportedMayerVietorisShortComplex I U V).X₃ =
      compactlySupportedDeRhamComplex I (U ⊔ V : TopologicalSpace.Opens M) :=
  sorry

theorem compactlySupportedMayerVietorisShortComplex_shortExact [T2Space M] [SigmaCompactSpace M]
    [FiniteDimensional ℝ E] (U V : TopologicalSpace.Opens M) :
    (compactlySupportedMayerVietorisShortComplex I U V).ShortExact :=
  sorry

/-- **Layer 7.3, acceptance: the cohomology of spheres** [Lee, Thm. 17.21]. -/
theorem deRhamCohomology_sphere_top (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (deRhamCohomology (𝓡 n) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) n ≃ₗ[ℝ] ℝ) :=
  sorry

theorem subsingleton_deRhamCohomology_sphere (n : ℕ) {k : ℕ} (h0 : 0 < k) (hk : k < n) :
    Subsingleton (deRhamCohomology (𝓡 n) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) k) :=
  sorry

end DeRham

/-! ## Layer 8: singular cohomology, smooth chains, and the de Rham theorem

Spaces live in `Type` here (Mathlib's singular functors are polymorphic; one universe avoids
`ULift` bookkeeping). -/

section Singular

open CategoryTheory

variable (R : Type) [CommRing R]

/-- **Layer 8.1.** Singular chains with coefficients in `R`, Mathlib's functor evaluated on the
coefficient module `R`. -/
noncomputable abbrev singularChains (X : TopCat.{0}) : ChainComplex (ModuleCat.{0} R) ℕ :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{0} R)).obj (ModuleCat.of R R)).obj X

/-- **Layer 8.1.** The singular cochain complex functor: the degreewise dual of the singular
chains, contravariant in the space. Pinned by `singularCochainComplex_X`. -/
noncomputable def singularCochainComplexFunctor : TopCat.{0}ᵒᵖ ⥤ CochainComplex (ModuleCat.{0} R) ℕ :=
  sorry

noncomputable abbrev singularCochainComplex (X : TopCat.{0}) : CochainComplex (ModuleCat.{0} R) ℕ :=
  (singularCochainComplexFunctor R).obj (Opposite.op X)

theorem singularCochainComplex_X (X : TopCat.{0}) (k : ℕ) :
    (singularCochainComplex R X).X k = ModuleCat.of R (Module.Dual R ((singularChains R X).X k)) :=
  sorry

/-- **Layer 8.1.** Singular cohomology `H^k(X; R)`. -/
noncomputable abbrev singularCohomology (X : TopCat.{0}) (k : ℕ) : Type :=
  ((singularCochainComplex R X).homology k)

/-- Contravariant functoriality, from the functor. -/
noncomputable def singularCohomology.map {X Y : TopCat.{0}} (f : X ⟶ Y) (k : ℕ) :
    singularCohomology R Y k →ₗ[R] singularCohomology R X k :=
  ((HomologicalComplex.homologyFunctor (ModuleCat.{0} R) (ComplexShape.up ℕ) k).map
    ((singularCochainComplexFunctor R).map f.op)).hom

/-- **Layer 8.1.** Singular homology `H_k(X; R)`, Mathlib's. -/
noncomputable abbrev singularHomology (X : TopCat.{0}) (k : ℕ) : Type :=
  (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} R) k).obj (ModuleCat.of R R)).obj X)

/-- **Layer 8.1, universal coefficients over a field**: `H^k(X; ℝ) ≅ Hom(H_k(X; ℝ), ℝ)`, which
recovers [Lee]'s dual-of-homology definition as a theorem. -/
noncomputable def singularCohomologyEquivDual (X : TopCat.{0}) (k : ℕ) :
    singularCohomology ℝ X k ≃ₗ[ℝ] Module.Dual ℝ (singularHomology ℝ X k) :=
  sorry

/-- **Layer 8.1.** Homotopy invariance of singular cohomology, transferred from the chain level. -/
theorem singularCohomology.map_eq_of_homotopic {X Y : TopCat.{0}} {f g : X ⟶ Y}
    (h : (f.hom).Homotopic g.hom) (k : ℕ) : singularCohomology.map R f k = singularCohomology.map R g k :=
  sorry

/-- **Layer 8.2, barycentric subdivision** as a chain map, chain-homotopic to the identity — the
pin has no chain-level subdivision at all. -/
noncomputable def barycentricSubdivision (X : TopCat.{0}) : singularChains R X ⟶ singularChains R X :=
  sorry

noncomputable def homotopyBarycentricSubdivision (X : TopCat.{0}) :
    Homotopy (barycentricSubdivision R X) (𝟙 (singularChains R X)) :=
  sorry

variable {X : Type} [TopologicalSpace X]

/-- **Layer 8.2, small chains and the small-simplices theorem.** The subcomplex of chains
subordinate to `{U, V}`, with its inclusion a quasi-isomorphism when `U ⊔ V = ⊤`. -/
noncomputable def smallChains (U V : TopologicalSpace.Opens X) : ChainComplex (ModuleCat.{0} R) ℕ :=
  sorry

noncomputable def smallChainsInclusion (U V : TopologicalSpace.Opens X) :
    smallChains R U V ⟶ singularChains R (TopCat.of X) :=
  sorry

theorem quasiIso_smallChainsInclusion (U V : TopologicalSpace.Opens X) (hUV : U ⊔ V = ⊤) :
    QuasiIso (smallChainsInclusion R U V) :=
  sorry

/-- **Layer 8.2, Mayer–Vietoris for singular chains**
`0 → C_•(U ⊓ V) → C_•(U) ⊕ C_•(V) → C_•^{U,V}(X) → 0`, exact; with `quasiIso_smallChainsInclusion`
and Mathlib's homology sequence this is the Mayer–Vietoris sequence of an open pair
[Lee, Thm. 18.4, 18.6], and its cohomological dual follows by dualizing. -/
noncomputable def singularMayerVietorisShortComplex (U V : TopologicalSpace.Opens X) :
    ShortComplex (ChainComplex (ModuleCat.{0} R) ℕ) :=
  sorry

theorem singularMayerVietorisShortComplex_X₁ (U V : TopologicalSpace.Opens X) :
    (singularMayerVietorisShortComplex R U V).X₁ = singularChains R (TopCat.of (U ⊓ V : TopologicalSpace.Opens X)) :=
  sorry

theorem singularMayerVietorisShortComplex_X₃ (U V : TopologicalSpace.Opens X) :
    (singularMayerVietorisShortComplex R U V).X₃ = smallChains R U V :=
  sorry

theorem singularMayerVietorisShortComplex_shortExact (U V : TopologicalSpace.Opens X) :
    (singularMayerVietorisShortComplex R U V).ShortExact :=
  sorry

/-- **Layer 8.2, acceptance.** `H_k(Sⁿ; R)` for `0 < k`: `R` in degree `n`, zero otherwise. -/
theorem singularHomology_sphere_top (n : ℕ) (hn : 0 < n) :
    Nonempty (singularHomology R (TopCat.of (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) n
      ≃ₗ[R] R) :=
  sorry

theorem subsingleton_singularHomology_sphere (n : ℕ) {k : ℕ} (h0 : 0 < k) (hk : k ≠ n) :
    Subsingleton (singularHomology R (TopCat.of (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) k) :=
  sorry

end Singular

section SmoothChains

open CategoryTheory

variable {E H : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type} [TopologicalSpace M] [ChartedSpace H M]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {p k : ℕ}

/-- **Layer 8.4.** The full-dimensional standard simplex `Δᵖ = {x ∈ ℝᵖ | 0 ≤ xᵢ, Σ xᵢ ≤ 1}`, the
integration domain; ⚠ Mathlib's barycentric `Convexity.StdSimplex` lies in a hyperplane and is the
wrong domain to integrate over directly. -/
def fullSimplex (p : ℕ) : Set (EuclideanSpace ℝ (Fin p)) :=
  {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i ≤ 1}

/-- **Layer 8.4.** The affine bridge to Mathlib's barycentric simplex `Convexity.StdSimplex`, pinned
by the two coordinate laws below. -/
noncomputable def fullSimplexEquivStdSimplex (p : ℕ) :
    fullSimplex p ≃ₜ Convexity.StdSimplex ℝ (Fin (p + 1)) :=
  sorry

theorem fullSimplexEquivStdSimplex_weights_succ (x : fullSimplex p) (i : Fin p) :
    (fullSimplexEquivStdSimplex p x).weights i.succ = (x : EuclideanSpace ℝ (Fin p)) i :=
  sorry

theorem fullSimplexEquivStdSimplex_weights_zero (x : fullSimplex p) :
    (fullSimplexEquivStdSimplex p x).weights 0 = 1 - ∑ i, (x : EuclideanSpace ℝ (Fin p)) i :=
  sorry

/-- **Layer 8.4.** The `i`-th face inclusion `δᵢ : Δᵖ → Δ^{p+1}`, the coface `SimplexCategory.δ i`
in the full-dimensional model: under the barycentric bridge it inserts a `0` at position `i`. -/
noncomputable def simplexFace (p : ℕ) (i : Fin (p + 2)) : fullSimplex p → fullSimplex (p + 1) :=
  sorry

theorem fullSimplexEquivStdSimplex_simplexFace_succAbove (i : Fin (p + 2)) (x : fullSimplex p)
    (j : Fin (p + 1)) :
    (fullSimplexEquivStdSimplex (p + 1) (simplexFace p i x)).weights (i.succAbove j) =
      (fullSimplexEquivStdSimplex p x).weights j :=
  sorry

theorem fullSimplexEquivStdSimplex_simplexFace_self (i : Fin (p + 2)) (x : fullSimplex p) :
    (fullSimplexEquivStdSimplex (p + 1) (simplexFace p i x)).weights i = 0 :=
  sorry

variable (I) in
/-- **Layer 8.3.** Smoothness on a subset in [Lee]'s local sense: near every point of `s`, `f`
agrees with a smooth map defined on a neighbourhood. This local definition is the primitive one;
⚠ a single global extension to a neighbourhood of all of `s` is *not* automatic for a
manifold-valued map and is not assumed anywhere. -/
def SmoothOnSubset {s : Set (EuclideanSpace ℝ (Fin p))} (f : s → M) : Prop :=
  ∀ x : s, ∃ U ∈ 𝓝 (x : EuclideanSpace ℝ (Fin p)), ∃ g : EuclideanSpace ℝ (Fin p) → M,
    ContMDiffOn 𝓘(ℝ, EuclideanSpace ℝ (Fin p)) I ∞ g U ∧
      ∀ y : s, (y : EuclideanSpace ℝ (Fin p)) ∈ U → g y = f y

variable (I M) in
/-- **Layer 8.3.** Smooth singular `p`-simplices. -/
def SmoothSimplex (p : ℕ) : Type _ :=
  {σ : fullSimplex p → M // SmoothOnSubset I σ}

/-- A smooth simplex is continuous. -/
noncomputable def SmoothSimplex.toContinuousMap (σ : SmoothSimplex I M p) : C(fullSimplex p, M) :=
  ⟨σ.1, sorry⟩

/-- The `i`-th face of a smooth simplex. -/
noncomputable def SmoothSimplex.face (σ : SmoothSimplex I M (p + 1)) (i : Fin (p + 2)) :
    SmoothSimplex I M p :=
  ⟨σ.1 ∘ simplexFace p i, sorry⟩

variable (I M) in
/-- **Layer 8.3.** The boundary of smooth chains, `∂σ = Σᵢ (−1)ⁱ σ ∘ δᵢ`. -/
noncomputable def smoothBoundary (p : ℕ) :
    (SmoothSimplex I M (p + 1) →₀ ℝ) →ₗ[ℝ] (SmoothSimplex I M p →₀ ℝ) :=
  Finsupp.linearCombination ℝ
    (fun σ ↦ ∑ i : Fin (p + 2), ((-1 : ℝ) ^ (i : ℕ)) • Finsupp.single (σ.face i) (1 : ℝ))

theorem smoothBoundary_comp_smoothBoundary (p : ℕ) :
    (smoothBoundary I M p).comp (smoothBoundary I M (p + 1)) = 0 :=
  sorry

variable (I M) in
/-- **Layer 8.3.** The smooth singular chain complex. -/
noncomputable def smoothSingularChainComplex : ChainComplex (ModuleCat.{0} ℝ) ℕ :=
  ChainComplex.of (fun p ↦ ModuleCat.of ℝ (SmoothSimplex I M p →₀ ℝ))
    (fun p ↦ ModuleCat.ofHom (smoothBoundary I M p)) sorry

variable (I M) in
/-- **Layer 8.3, the smoothing theorem as data** [Lee, Thm. 18.7]: the inclusion of smooth chains
into continuous chains, a chain map `smoothing` back, and the two chain homotopies — built by
induction over the faces, each simplex smoothed relative to its already-smoothed boundary. -/
noncomputable def smoothToSingular : smoothSingularChainComplex I M ⟶ singularChains ℝ (TopCat.of M) :=
  sorry

variable (I M) in
noncomputable def smoothing : singularChains ℝ (TopCat.of M) ⟶ smoothSingularChainComplex I M :=
  sorry

variable (I M) in
noncomputable def homotopySmoothingComp :
    Homotopy (smoothing I M ≫ smoothToSingular I M) (𝟙 (singularChains ℝ (TopCat.of M))) :=
  sorry

variable (I M) in
noncomputable def homotopyCompSmoothing :
    Homotopy (smoothToSingular I M ≫ smoothing I M) (𝟙 (smoothSingularChainComplex I M)) :=
  sorry

/-- **Layer 8.3, the relative smoothing theorem**, the actual input to the chain-level statement: a
continuous simplex whose faces are already smooth is homotopic, relative to its boundary, to a
smooth simplex with those faces. Needs Whitney approximation into a manifold in relative form. -/
theorem exists_smoothSimplex_homotopicRel [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
    [FiniteDimensional ℝ E] (σ : C(fullSimplex (p + 1), M))
    (hfaces : ∀ i, SmoothOnSubset I (σ ∘ simplexFace p i)) :
    ∃ τ : SmoothSimplex I M (p + 1), (∀ i, (τ.face i).1 = σ ∘ simplexFace p i) ∧
      Nonempty (σ.HomotopyRel τ.toContinuousMap (⋃ i, range (simplexFace p i))) :=
  sorry

/-- **Layer 8.4.** The integral of a `p`-form over a smooth `p`-simplex: the pullback integral
over `Δᵖ`, pinned by `SmoothSimplex.integral_eq` for any smooth extension. -/
noncomputable def SmoothSimplex.integral (σ : SmoothSimplex I M p) (φ : RoughForm I M F p) : F :=
  sorry

theorem SmoothSimplex.integral_eq (σ : SmoothSimplex I M p) (φ : RoughForm I M F p)
    {U : Set (EuclideanSpace ℝ (Fin p))} (hU : IsOpen U) (hsU : fullSimplex p ⊆ U)
    {g : EuclideanSpace ℝ (Fin p) → M} (hg : ContMDiffOn 𝓘(ℝ, EuclideanSpace ℝ (Fin p)) I ∞ g U)
    (hgσ : ∀ x : fullSimplex p, g x = σ.1 x) :
    σ.integral φ = ∫ x in fullSimplex p,
      mpullback 𝓘(ℝ, EuclideanSpace ℝ (Fin p)) I g φ x (fun i ↦ EuclideanSpace.single i 1) :=
  sorry

/-- **Layer 8.4, Stokes for the simplex** — its own flat target, an iterated-integral/FTC
computation that neither uses nor waits for the corners Stokes of 5.5. -/
theorem SmoothSimplex.integral_mextDeriv [IsManifold I 1 M] (σ : SmoothSimplex I M (p + 1))
    {φ : RoughForm I M F p} (hφ : IsSmoothForm I 1 φ) :
    σ.integral (mextDeriv φ) = ∑ i : Fin (p + 2), ((-1 : ℝ) ^ (i : ℕ)) • (σ.face i).integral φ :=
  sorry

/-- **Layer 8.4.** The integral over a smooth chain, and Stokes for chains [Lee, Thm. 18.12]. -/
noncomputable def chainIntegral (c : SmoothSimplex I M p →₀ ℝ) (φ : RoughForm I M F p) : F :=
  c.sum fun σ a ↦ a • σ.integral φ

theorem chainIntegral_smoothBoundary [IsManifold I 1 M] (c : SmoothSimplex I M (p + 1) →₀ ℝ)
    {φ : RoughForm I M F p} (hφ : IsSmoothForm I 1 φ) :
    chainIntegral (smoothBoundary I M p c) φ = chainIntegral c (mextDeriv φ) :=
  sorry

variable [IsManifold I 1 M] [IsManifold I ∞ M]

variable (I M) in
/-- **Layer 8.4, the de Rham homomorphism** `I : H^k_dR(M) → H^k(M; ℝ)`, well defined by 8.3 and
Stokes for chains; natural in `M` (`deRhamHom_naturality`). -/
noncomputable def deRhamHom (k : ℕ) : deRhamCohomology I M k →ₗ[ℝ] singularCohomology ℝ (TopCat.of M) k :=
  sorry

theorem deRhamHom_naturality {E' H' : Type} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} {M' : Type} [TopologicalSpace M']
    [ChartedSpace H' M'] [IsManifold I' 1 M'] [IsManifold I' ∞ M'] {f : M → M'}
    (hf : ContMDiff I I' ∞ f) (k : ℕ) :
    (deRhamHom I M k).comp (deRhamCohomology.map hf k) =
      (singularCohomology.map ℝ (TopCat.ofHom ⟨f, hf.continuous⟩) k).comp (deRhamHom I' M' k) :=
  sorry

variable (I M) in
/-- **Layer 8.5, the de Rham theorem** [Lee, Thm. 18.14]: `deRhamHom` is an isomorphism for every
T2 σ-compact finite-dimensional smooth manifold. -/
noncomputable def deRhamEquiv [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E] (k : ℕ) :
    deRhamCohomology I M k ≃ₗ[ℝ] singularCohomology ℝ (TopCat.of M) k :=
  sorry

theorem deRhamEquiv_apply [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E] (k : ℕ)
    (x : deRhamCohomology I M k) : deRhamEquiv I M k x = deRhamHom I M k x :=
  sorry

end SmoothChains

section MayerVietorisPrinciple

/-- **Layer 8.5, the Mayer–Vietoris induction principle**, stated once and consumed twice (8.5 and
9.3): a property of opens that holds on a basis stable under binary intersection, is closed under
two-set unions given the intersection, and under countable disjoint unions, holds on every open.
⚠ The countable-exhaustion step lives *inside* this principle; "exhaustion" is not an argument
until the principle makes it one. -/
theorem mayerVietoris_induction {X : Type*} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    [SecondCountableTopology X] (P : TopologicalSpace.Opens X → Prop)
    (B : Set (TopologicalSpace.Opens X)) (hB : TopologicalSpace.Opens.IsBasis B)
    (hB_inf : ∀ U ∈ B, ∀ V ∈ B, U ⊓ V ∈ B) (hbot : P ⊥) (hbase : ∀ U ∈ B, P U)
    (hsup : ∀ U V, P U → P V → P (U ⊓ V) → P (U ⊔ V))
    (hdisjoint : ∀ s : ℕ → TopologicalSpace.Opens X, (∀ i j, i ≠ j → Disjoint (s i) (s j)) →
      (∀ n, P (s n)) → P (⨆ n, s n)) :
    ∀ U, P U :=
  sorry

end MayerVietorisPrinciple

section CircleGate

open CategoryTheory

/-- **Layer 8.5, acceptance.** The fundamental class of the circle, the class of the standard loop
simplex `t ↦ exp (2π i t)`; it generates `H_1(S¹; ℝ) ≅ ℝ`. -/
noncomputable def circleFundamentalClass : singularHomology ℝ (TopCat.of Circle) 1 :=
  sorry

theorem singularHomology_circle_one : Nonempty (singularHomology ℝ (TopCat.of Circle) 1 ≃ₗ[ℝ] ℝ) :=
  sorry

theorem circleFundamentalClass_ne_zero : circleFundamentalClass ≠ 0 :=
  sorry

/-- The angular form as a smooth closed form on the circle. -/
noncomputable def circleAngularFormClosed' : closedForms (𝓡 1) Circle 1 :=
  ⟨⟨circleAngularForm, sorry⟩, sorry⟩

/-- The de Rham map sends `[dθ]` to the cochain whose value on the fundamental class is `2π` —
reusing the number from 5.5 to catch orientation drift. -/
theorem deRhamHom_circleAngularForm :
    singularCohomologyEquivDual (TopCat.of Circle) 1
      (deRhamHom (𝓡 1) Circle 1 (deRhamCohomology.mk (𝓡 1) Circle 1 circleAngularFormClosed'))
      circleFundamentalClass = 2 * Real.pi :=
  sorry

end CircleGate

/-! ### Layer 6.1 and 8.1: the multiplicative structure -/

section Ring

open CategoryTheory

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M] {k l : ℕ}

variable (I M) in
/-- **Layer 6.1, the ring structure.** The wedge descends to cohomology, `H^k × H^l → H^(k+l)`,
pinned on classes by `wedge_mk`; associativity and graded commutativity follow from 0.1's identities,
and with `[1]` as unit `H^•_dR(M)` is a graded-commutative ℝ-algebra. -/
noncomputable def deRhamCohomology.wedge (k l : ℕ) :
    deRhamCohomology I M k →ₗ[ℝ] deRhamCohomology I M l →ₗ[ℝ] deRhamCohomology I M (k + l) :=
  sorry

theorem closedForms_wedge_mem (φ : closedForms I M k) (ψ : closedForms I M l) :
    (⟨((φ : SmoothForm I M ℝ k) : RoughForm I M ℝ k).wedge ((ψ : SmoothForm I M ℝ l) : RoughForm I M ℝ l),
      smoothForms_wedge_mem φ ψ⟩ : SmoothForm I M ℝ (k + l)) ∈ closedForms I M (k + l) :=
  sorry

theorem deRhamCohomology.wedge_mk (φ : closedForms I M k) (ψ : closedForms I M l) :
    deRhamCohomology.wedge I M k l (deRhamCohomology.mk I M k φ) (deRhamCohomology.mk I M l ψ) =
      deRhamCohomology.mk I M (k + l) ⟨_, closedForms_wedge_mem φ ψ⟩ :=
  sorry

/-- Graded commutativity on cohomology, the degrees cast by `Fin.cast`-free transport along
`Nat.add_comm` (a `LinearEquiv` between `H^(k+l)` and `H^(l+k)`). -/
noncomputable def deRhamCohomology.castDegree {k l : ℕ} (h : k = l) :
    deRhamCohomology I M k ≃ₗ[ℝ] deRhamCohomology I M l :=
  sorry

theorem deRhamCohomology.wedge_comm (x : deRhamCohomology I M k) (y : deRhamCohomology I M l) :
    deRhamCohomology.wedge I M k l x y =
      (-1 : ℝ) ^ (k * l) • deRhamCohomology.castDegree (Nat.add_comm l k)
        (deRhamCohomology.wedge I M l k y x) :=
  sorry

end Ring

section Cup

open CategoryTheory

variable (R : Type) [CommRing R]

/-- **Layer 8.1, the cup product**, by the Alexander–Whitney formula on cochains, descending to
cohomology and making `H^•(X; R)` a graded ring, graded commutative on cohomology; natural in `X`. -/
noncomputable def singularCohomology.cup (X : TopCat.{0}) (k l : ℕ) :
    singularCohomology R X k →ₗ[R] singularCohomology R X l →ₗ[R] singularCohomology R X (k + l) :=
  sorry

theorem singularCohomology.map_cup {X Y : TopCat.{0}} (f : X ⟶ Y) (k l : ℕ)
    (x : singularCohomology R Y k) (y : singularCohomology R Y l) :
    singularCohomology.map R f (k + l) (singularCohomology.cup R Y k l x y) =
      singularCohomology.cup R X k l (singularCohomology.map R f k x) (singularCohomology.map R f l y) :=
  sorry

/-- **Layer 8.1, relative cohomology** of a pair, with the long exact sequence of the pair from the
short exact sequence of cochain complexes `0 → C^•(X, A) → C^•(X) → C^•(A) → 0`. -/
noncomputable def relativeSingularCochainComplex {X : Type} [TopologicalSpace X] (A : Set X) :
    CochainComplex (ModuleCat.{0} R) ℕ :=
  sorry

noncomputable def relativeSingularShortComplex {X : Type} [TopologicalSpace X] (A : Set X) :
    ShortComplex (CochainComplex (ModuleCat.{0} R) ℕ) :=
  sorry

theorem relativeSingularShortComplex_X₁ {X : Type} [TopologicalSpace X] (A : Set X) :
    (relativeSingularShortComplex R A).X₁ = relativeSingularCochainComplex R A :=
  sorry

theorem relativeSingularShortComplex_X₂ {X : Type} [TopologicalSpace X] (A : Set X) :
    (relativeSingularShortComplex R A).X₂ = singularCochainComplex R (TopCat.of X) :=
  sorry

theorem relativeSingularShortComplex_X₃ {X : Type} [TopologicalSpace X] (A : Set X) :
    (relativeSingularShortComplex R A).X₃ = singularCochainComplex R (TopCat.of A) :=
  sorry

theorem relativeSingularShortComplex_shortExact {X : Type} [TopologicalSpace X] (A : Set X) :
    (relativeSingularShortComplex R A).ShortExact :=
  sorry

end Cup

section DeRhamRing

open CategoryTheory

variable {E H : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M] {k l : ℕ}

/-- **Layer 8.5, multiplicativity.** The de Rham homomorphism carries the wedge to the cup product,
so `deRhamEquiv` is an isomorphism of graded algebras. -/
theorem deRhamHom_wedge (x : deRhamCohomology I M k) (y : deRhamCohomology I M l) :
    deRhamHom I M (k + l) (deRhamCohomology.wedge I M k l x y) =
      singularCohomology.cup ℝ (TopCat.of M) k l (deRhamHom I M k x) (deRhamHom I M l y) :=
  sorry

end DeRhamRing

/-! ## Layer 9: Poincaré duality -/

section Duality

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [IsManifold I 1 M] [IsManifold I ∞ M] {k l : ℕ}

variable (I M) in
/-- Compactly supported closed forms, the cycles of `compactlySupportedDeRhamComplex`. -/
noncomputable def compactlySupportedClosedForms (l : ℕ) : Submodule ℝ (SmoothForm I M ℝ l) :=
  compactlySupportedForms I M l ⊓ closedForms I M l

variable (I M) in
/-- The cycle-class map of compactly supported cohomology: linear, surjective, with kernel the
forms `dψ` with `ψ` compactly supported. -/
noncomputable def compactlySupportedDeRhamCohomology.mk (l : ℕ) :
    ↥(compactlySupportedClosedForms I M l) →ₗ[ℝ] compactlySupportedDeRhamCohomology I M l :=
  sorry

theorem compactlySupportedDeRhamCohomology.mk_surjective (l : ℕ) :
    Function.Surjective (compactlySupportedDeRhamCohomology.mk I M l) :=
  sorry

theorem compactlySupportedDeRhamCohomology.mk_eq_zero_iff_zero
    (φ : compactlySupportedClosedForms I M 0) :
    compactlySupportedDeRhamCohomology.mk I M 0 φ = 0 ↔ (φ : SmoothForm I M ℝ 0) = 0 :=
  sorry

theorem compactlySupportedDeRhamCohomology.mk_eq_zero_iff_succ
    (φ : compactlySupportedClosedForms I M (l + 1)) :
    compactlySupportedDeRhamCohomology.mk I M (l + 1) φ = 0 ↔
      ∃ ψ ∈ compactlySupportedForms I M l,
        mextDeriv (ψ : RoughForm I M ℝ l) = ((φ : SmoothForm I M ℝ (l + 1)) : RoughForm I M ℝ (l + 1)) :=
  sorry

variable (I M) in
/-- **Layer 9.1.** The pairing `(ω, η) ↦ ∫_M ω ∧ η` on `H^k × H^l_c`, for an orientation indexed by
`Fin (k + l)`; pinned on classes by `poincarePairing_mk`. -/
noncomputable def poincarePairing (o : Manifold.Orientation I M (Fin (k + l))) :
    deRhamCohomology I M k →ₗ[ℝ] compactlySupportedDeRhamCohomology I M l →ₗ[ℝ] ℝ :=
  sorry

theorem poincarePairing_mk (o : Manifold.Orientation I M (Fin (k + l))) (φ : closedForms I M k)
    (ψ : compactlySupportedClosedForms I M l) :
    poincarePairing I M o (deRhamCohomology.mk I M k φ) (compactlySupportedDeRhamCohomology.mk I M l ψ) =
      integralTopForm o (((φ : SmoothForm I M ℝ k) : RoughForm I M ℝ k).wedge
        ((ψ : SmoothForm I M ℝ l) : RoughForm I M ℝ l)) :=
  sorry

/-- **Layer 9.2.** Integration `H^n_c(M) → ℝ` is an isomorphism for connected oriented `M`. -/
theorem exists_compactlySupportedDeRhamCohomology_top_equiv [T2Space M] [SigmaCompactSpace M]
    [ConnectedSpace M] [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin (Module.finrank ℝ E))) :
    ∃ e : compactlySupportedDeRhamCohomology I M (Module.finrank ℝ E) ≃ₗ[ℝ] ℝ,
      ∀ ψ : compactlySupportedClosedForms I M (Module.finrank ℝ E),
        e (compactlySupportedDeRhamCohomology.mk I M (Module.finrank ℝ E) ψ) =
          integralTopForm o (((ψ : SmoothForm I M ℝ (Module.finrank ℝ E)) :
            RoughForm I M ℝ (Module.finrank ℝ E))) :=
  sorry

/-- **Layer 9.2.** For connected *non*orientable `M`, `H^n_c(M) = 0`, by averaging over the
orientation cover (`invariantPart`, `exists_mpullback_proj_eq_iff`); for compact connected
nonorientable `M` also `H^n_dR(M) = 0` [Lee, Thm. 17.34]. -/
theorem subsingleton_compactlySupportedDeRhamCohomology_top_of_not_orientable [T2Space M]
    [SigmaCompactSpace M] [ConnectedSpace M] [BoundarylessManifold I M] (h : ¬ Orientable I M) :
    Subsingleton (compactlySupportedDeRhamCohomology I M (Module.finrank ℝ E)) :=
  sorry

theorem subsingleton_deRhamCohomology_top_of_not_orientable [T2Space M] [CompactSpace M]
    [ConnectedSpace M] [BoundarylessManifold I M] (h : ¬ Orientable I M) :
    Subsingleton (deRhamCohomology I M (Module.finrank ℝ E)) :=
  sorry

variable (I M) in
/-- **Layer 9.3, Poincaré duality**: `PD : H^k_dR(M) → (H^{n−k}_c(M))*` is an isomorphism for every
T2 σ-compact oriented boundaryless `n`-manifold, with no compactness hypothesis. Proved by the
Mayer–Vietoris induction principle with the five lemma, base case 6.2 and both halves of 6.4. -/
noncomputable def poincareDuality [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin (k + l))) (hkl : k + l = Module.finrank ℝ E) :
    deRhamCohomology I M k ≃ₗ[ℝ] Module.Dual ℝ (compactlySupportedDeRhamCohomology I M l) :=
  sorry

theorem poincareDuality_apply [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin (k + l))) (hkl : k + l = Module.finrank ℝ E)
    (x : deRhamCohomology I M k) : poincareDuality I M o hkl x = poincarePairing I M o x :=
  sorry

variable (I M) in
/-- On a compact manifold compact supports are no restriction. -/
noncomputable def compactlySupportedDeRhamCohomologyEquiv [CompactSpace M] (k : ℕ) :
    compactlySupportedDeRhamCohomology I M k ≃ₗ[ℝ] deRhamCohomology I M k :=
  sorry

/-- **Layer 9.3, corollaries**: finite-dimensionality of `H^k_dR` of a compact manifold, by the
double-dual route through duality in complementary degrees (the nonorientable case through the
orientation cover), and nondegeneracy of the pairing on compact oriented `M`. -/
theorem finiteDimensional_deRhamCohomology [T2Space M] [CompactSpace M] [BoundarylessManifold I M]
    (k : ℕ) : FiniteDimensional ℝ (deRhamCohomology I M k) :=
  sorry

theorem poincarePairing_nondegenerate [T2Space M] [CompactSpace M] [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin (k + l))) (hkl : k + l = Module.finrank ℝ E)
    (x : deRhamCohomology I M k)
    (hx : ∀ y : compactlySupportedDeRhamCohomology I M l, poincarePairing I M o x y = 0) : x = 0 :=
  sorry

end Duality

section DualityGate

/-- The constant `1` as a compactly supported closed `0`-form on the circle. -/
noncomputable def circleOne : compactlySupportedClosedForms (𝓡 1) Circle 0 :=
  ⟨⟨RoughForm.ofFunction (𝓡 1) (fun _ ↦ (1 : ℝ)), sorry⟩, sorry⟩

/-- **Layer 9.3, acceptance.** `⟨[dθ], [1]⟩ = ∫_{S¹} dθ = ±2π ≠ 0`, pairing against the class of `1`
in `H⁰_c(S¹)`. -/
theorem abs_poincarePairing_circleAngularForm (o : Manifold.Orientation (𝓡 1) Circle (Fin (1 + 0))) :
    |poincarePairing (𝓡 1) Circle o (deRhamCohomology.mk (𝓡 1) Circle 1 circleAngularFormClosed')
      (compactlySupportedDeRhamCohomology.mk (𝓡 1) Circle 0 circleOne)| = 2 * Real.pi :=
  sorry

end DualityGate

/-! ## Layer 10: the Brouwer mapping degree -/

section InverseFunction

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {J : ModelWithCorners ℝ E' H'} {N : Type*} [TopologicalSpace N] [ChartedSpace H' N]
  {n : WithTop ℕ∞}

/-- **Layer 10.1, consumed.** The manifold inverse function theorem is Tau Ceti's
`TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, for boundaryless *model spaces*; this restatement
checks the import. -/
theorem isLocalDiffeomorphAt_of_mfderiv_eq_of_boundaryless [CompleteSpace E] [I.Boundaryless]
    [J.Boundaryless] [IsManifold I n M] [IsManifold J n N] {f : M → N} {s : Set M} {x : M}
    (hf : ContMDiffOn I J n f s) (hs : IsOpen s) (hx : x ∈ s) (hn : 1 ≤ n)
    {e : TangentSpace I x ≃L[ℝ] TangentSpace J (f x)}
    (he : (e : TangentSpace I x →L[ℝ] TangentSpace J (f x)) = mfderiv I J f x) :
    IsLocalDiffeomorphAt I J n f x :=
  TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq hf hs hx hn he

/-- **Layer 10.1, the one-hypothesis extension** owned jointly with Hopf–Rinow in that same file:
from boundaryless model spaces to boundaryless *manifolds* over arbitrary models. -/
theorem isLocalDiffeomorphAt_of_mfderiv_eq_of_boundarylessManifold [CompleteSpace E]
    [BoundarylessManifold I M] [BoundarylessManifold J N] [IsManifold I n M] [IsManifold J n N]
    {f : M → N} {s : Set M} {x : M} (hf : ContMDiffOn I J n f s) (hs : IsOpen s) (hx : x ∈ s)
    (hn : 1 ≤ n) {e : TangentSpace I x ≃L[ℝ] TangentSpace J (f x)}
    (he : (e : TangentSpace I x →L[ℝ] TangentSpace J (f x)) = mfderiv I J f x) :
    IsLocalDiffeomorphAt I J n f x :=
  sorry

variable (I J) in
/-- **Layer 10.1.** Regular points and regular values. -/
def IsRegularPoint (f : M → N) (x : M) : Prop := Function.Surjective (mfderiv I J f x)

variable (I J) in
def IsRegularValue (f : M → N) (y : N) : Prop := ∀ x, f x = y → IsRegularPoint I J f x

end InverseFunction

section Degree

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  [FiniteDimensional ℝ E'] [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} {N : Type*}
  [TopologicalSpace N] [ChartedSpace H' N] {ι : Type*} [Fintype ι] [DecidableEq ι] {m : ℕ}

/-- **Layer 10.2, flat Sard, consumed**: Tau Ceti's `Differentiable.dense_compl_image_criticalPoints`
in the equidimensional case; this restatement checks the import. -/
theorem dense_compl_image_criticalPoints_flat [MeasurableSpace E] [BorelSpace E] [MeasurableSpace E']
    [BorelSpace E'] {f : E → E'} (hf : Differentiable ℝ f)
    (hdim : Module.finrank ℝ E = Module.finrank ℝ E') :
    Dense (f '' {x | ¬ Function.Surjective (fderiv ℝ f x)})ᶜ :=
  hf.dense_compl_image_criticalPoints hdim

/-- **Layer 10.2, manifold Sard, equidimensional**: critical values form a null set, so regular
values are dense. -/
theorem isNullSet_image_criticalPoints [MeasurableSpace E'] [BorelSpace E'] [IsManifold I ∞ M]
    [IsManifold J ∞ N] [T2Space M] [SigmaCompactSpace M]
    (hdim : Module.finrank ℝ E = Module.finrank ℝ E') {f : M → N} (hf : ContMDiff I J ∞ f) :
    IsNullSet J (f '' {x | ¬ IsRegularPoint I J f x}) :=
  sorry

theorem dense_isRegularValue [IsManifold I ∞ M] [IsManifold J ∞ N] [T2Space M] [SigmaCompactSpace M]
    (hdim : Module.finrank ℝ E = Module.finrank ℝ E') {f : M → N} (hf : ContMDiff I J ∞ f) :
    Dense {y | IsRegularValue I J f y} :=
  sorry

/-- **Layer 10.3.** The sign of `f` at `x` for a pair of orientations: `+1` if orientation
preserving there, `−1` otherwise (junk `−1` where the differential is singular). -/
noncomputable def orientationSign (o : Manifold.Orientation I M ι) (o' : Manifold.Orientation J N ι)
    (f : M → N) (x : M) : ℤ := by
  classical exact if IsOrientationPreservingAt o o' f x then 1 else -1

/-- **Layer 10.3, the degree at a specified regular value**: the signed count of the fibre, junk
`0` if the fibre is infinite. Independence of `y` is exactly 10.4's theorem. -/
noncomputable def degreeAtRegularValue (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation J N ι) (f : M → N) (y : N) (_hy : IsRegularValue I J f y) : ℤ := by
  classical exact if h : (f ⁻¹' {y}).Finite then ∑ x ∈ h.toFinset, orientationSign o o' f x else 0

/-- **Layer 10.3, the stack of records**: over a regular value of a smooth map from a compact
manifold the fibre is finite. -/
theorem finite_preimage_of_isRegularValue [CompactSpace M] [T2Space M] [T2Space N]
    [IsManifold I 1 M] [IsManifold J 1 N] (hdim : Module.finrank ℝ E = Module.finrank ℝ E')
    {f : M → N} (hf : ContMDiff I J 1 f) {y : N} (hy : IsRegularValue I J f y) :
    (f ⁻¹' {y}).Finite :=
  sorry

/-- **Layer 10.4, the main theorem** [Lee, Thm. 17.35]: `∫_M f^*ω = deg_y f · ∫_N ω` at every regular
value; hence the sum of signs is independent of `y`, and the orientation degree is the de Rham
degree. Proved via 10.3, Stokes, and 3.3's homogeneity. -/
theorem integralTopForm_mpullback_eq_degreeAtRegularValue_mul [CompactSpace M] [ConnectedSpace N]
    [T2Space M] [T2Space N] [SigmaCompactSpace N] [BoundarylessManifold I M]
    [BoundarylessManifold J N] [IsManifold I ∞ M] [IsManifold J ∞ N] [IsManifold J 1 N]
    (hm : Module.finrank ℝ E = m) (hm' : Module.finrank ℝ E' = m)
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation J N (Fin m)) {f : M → N}
    (hf : ContMDiff I J ∞ f) {y : N} (hy : IsRegularValue I J f y) {φ : RoughForm J N ℝ m}
    (hφ : IsSmoothForm J 0 φ) (hc : IsCompact φ.tsupport) :
    integralTopForm o (mpullback I J f φ) = degreeAtRegularValue o o' f y hy * integralTopForm o' φ :=
  sorry

/-- **Layer 10.4.** The degree, defined once independence is available: the common value of
`degreeAtRegularValue` (junk `0` if there is no regular value, which does not happen). -/
noncomputable def degree (o : Manifold.Orientation I M ι) (o' : Manifold.Orientation J N ι)
    (f : M → N) : ℤ := by
  classical exact if h : ∃ y, IsRegularValue I J f y then
    degreeAtRegularValue o o' f h.choose h.choose_spec else 0

theorem degree_eq_degreeAtRegularValue [CompactSpace M] [ConnectedSpace N] [T2Space M] [T2Space N]
    [SigmaCompactSpace N] [BoundarylessManifold I M] [BoundarylessManifold J N] [IsManifold I ∞ M]
    [IsManifold J ∞ N] (hm : Module.finrank ℝ E = m) (hm' : Module.finrank ℝ E' = m)
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation J N (Fin m)) {f : M → N}
    (hf : ContMDiff I J ∞ f) {y : N} (hy : IsRegularValue I J f y) :
    degree o o' f = degreeAtRegularValue o o' f y hy :=
  sorry

/-- **Layer 10.5, degree calculus**: homotopy invariance, `deg id = 1`, and `deg f ≠ 0 ⇒ f`
surjective. -/
theorem degree_eq_of_homotopy [CompactSpace M] [ConnectedSpace N] [T2Space M] [T2Space N]
    [SigmaCompactSpace N] [BoundarylessManifold I M] [BoundarylessManifold J N] [IsManifold I ∞ M]
    [IsManifold J ∞ N] (hm : Module.finrank ℝ E = m) (hm' : Module.finrank ℝ E' = m)
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation J N (Fin m)) {f g : M → N}
    (hf : ContMDiff I J ∞ f) (hg : ContMDiff I J ∞ g) {Hm : M × Set.Icc (0 : ℝ) 1 → N}
    (hH : ContMDiff (I.prod (𝓡∂ 1)) J ∞ Hm) (h0 : ∀ x, Hm (x, 0) = f x) (h1 : ∀ x, Hm (x, 1) = g x) :
    degree o o' f = degree o o' g :=
  sorry

theorem degree_id [CompactSpace M] [ConnectedSpace M] [T2Space M] [BoundarylessManifold I M]
    [IsManifold I ∞ M] (hm : Module.finrank ℝ E = m) (hpos : 0 < m)
    (o : Manifold.Orientation I M (Fin m)) : degree o o (id : M → M) = 1 :=
  sorry

theorem degree_const [CompactSpace M] [ConnectedSpace N] [T2Space M] [T2Space N] [SigmaCompactSpace N]
    [BoundarylessManifold I M] [BoundarylessManifold J N] [IsManifold I ∞ M] [IsManifold J ∞ N]
    (hm : Module.finrank ℝ E = m) (hm' : Module.finrank ℝ E' = m) (hpos : 0 < m)
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation J N (Fin m)) (y₀ : N) :
    degree o o' (fun _ : M ↦ y₀) = 0 :=
  sorry

theorem surjective_of_degree_ne_zero [CompactSpace M] [ConnectedSpace N] [T2Space M] [T2Space N]
    [SigmaCompactSpace N] [BoundarylessManifold I M] [BoundarylessManifold J N] [IsManifold I ∞ M]
    [IsManifold J ∞ N] (hm : Module.finrank ℝ E = m) (hm' : Module.finrank ℝ E' = m)
    (o : Manifold.Orientation I M (Fin m)) (o' : Manifold.Orientation J N (Fin m)) {f : M → N}
    (hf : ContMDiff I J ∞ f) (hdeg : degree o o' f ≠ 0) : Function.Surjective f :=
  sorry

end Degree

section SphereDegree

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)]

/-- The antipodal map of the unit sphere. -/
def antipodal (x : Metric.sphere (0 : E) 1) : Metric.sphere (0 : E) 1 :=
  ⟨-x, by simp⟩

/-- **Layer 10.5, acceptance** (dimension `n ≥ 1`): `deg (antipodal : Sⁿ → Sⁿ) = (−1)^{n+1}`, for
either orientation of the sphere. -/
theorem degree_antipodal (hn : 1 ≤ n) (o : Manifold.Orientation (𝓡 n) (Metric.sphere (0 : E) 1) (Fin n)) :
    degree o o (antipodal (E := E)) = (-1) ^ (n + 1) :=
  sorry

/-- **Layer 10.5, corollaries**: no retraction of the ball onto its boundary sphere, and the Brouwer
fixed point theorem. -/
theorem not_exists_retraction :
    ¬ ∃ r : C(Metric.closedBall (0 : E) 1, Metric.sphere (0 : E) 1),
      ∀ x : Metric.sphere (0 : E) 1, r ⟨x, Metric.sphere_subset_closedBall x.2⟩ = x :=
  sorry

theorem exists_fixedPoint_closedBall (f : C(Metric.closedBall (0 : E) 1, Metric.closedBall (0 : E) 1)) :
    ∃ x, f x = x :=
  sorry

end SphereDegree

/-! ## Layer 11: the hairy ball theorem -/

section HairyBall

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)]

/-- **Layer 11.1.** The hairy ball theorem, elementary form: on the unit sphere of an
odd-dimensional ambient space `E` (so an *even*-dimensional sphere, `finrank ℝ E = n + 1` with `n`
even), every continuous tangent vector field vanishes somewhere. Tangency is `⟪w x, x⟫_ℝ = 0`,
matching how `Mathlib/Geometry/Manifold/Instances/Sphere.lean` describes the tangent space. -/
theorem exists_eq_zero_of_inner_eq_zero (hn : Even n) {w : Metric.sphere (0 : E) 1 → E}
    (hw : Continuous w) (ht : ∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) :
    ∃ x, w x = 0 :=
  sorry

/-- **Layer 11.2, the manifold form**: every continuous section of the tangent bundle of an
even-dimensional sphere vanishes somewhere — through an explicit `mfderiv`-composition bridge to
11.1, ⚠ never through the non-canonical identification of `range_mfderiv_coe_sphere`. -/
theorem exists_eq_zero_of_continuous_section (hn : Even n)
    {v : (x : Metric.sphere (0 : E) 1) → TangentSpace (𝓡 n) x}
    (hv : Continuous (fun x ↦ (⟨x, v x⟩ : TangentBundle (𝓡 n) (Metric.sphere (0 : E) 1)))) :
    ∃ x, v x = 0 :=
  sorry

/-- **Layer 11.2, the odd case**: an explicit nowhere-vanishing smooth tangent field on an
odd-dimensional sphere; together, `Sⁿ` admits a nowhere-vanishing tangent field iff `n` is odd. -/
theorem exists_nonvanishing_tangent_field_of_odd (hn : Odd n) :
    ∃ w : Metric.sphere (0 : E) 1 → E, ContMDiff (𝓡 n) 𝓘(ℝ, E) ∞ w ∧
      (∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) ∧ ∀ x, w x ≠ 0 :=
  sorry

theorem exists_nonvanishing_tangent_field_iff :
    (∃ w : Metric.sphere (0 : E) 1 → E, Continuous w ∧
      (∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) ∧ ∀ x, w x ≠ 0) ↔ Odd n :=
  sorry

end HairyBall

/-! ## Layer 12: Riemannian metrics and the Laplace–Beltrami operator -/

section RiemannianExistence

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M]

/-- **Layer 12.1.** Every T2 σ-compact finite-dimensional `C^∞` manifold admits a `C^∞`
Riemannian metric [Lee, Prop. 13.3]. -/
theorem nonempty_contMDiffRiemannianMetric [T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M] :
    Nonempty (ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :=
  sorry

end RiemannianExistence

section Riemannian

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] {m : ℕ}

/-- **Layer 12.2, the gradient**: `sharp` of `df`, through Tau Ceti's fibrewise Riesz duality
`Riemannian.Tensor.rieszDual` (consumed, not rebuilt). -/
noncomputable def mgradient (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) : TangentSpace I x :=
  Riemannian.Tensor.rieszDual (I := I) x (mfderiv I 𝓘(ℝ) f x)

/-- The defining identity of the gradient, discharged in place from Tau Ceti's `inner_rieszDual`. -/
theorem inner_mgradient (f : M → ℝ) (x : M) (v : TangentSpace I x) :
    ⟪mgradient I f x, v⟫_ℝ = (id (mfderiv I 𝓘(ℝ) f x v) : ℝ) :=
  Riemannian.Tensor.inner_rieszDual _ _

theorem contMDiff_mgradient [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, mgradient I f x⟩ : TangentBundle I M)) :=
  sorry

/-- **Layer 12.2, acceptance.** On an inner product space with its standard metric the manifold
gradient is Mathlib's `gradient`. -/
theorem mgradient_eq_gradient {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (f : F → ℝ) (x : F) :
    let _ : RiemannianBundle (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) :=
      ⟨(riemannianMetricVectorSpace F).toRiemannianMetric⟩
    mgradient 𝓘(ℝ, F) f x = gradient f x :=
  sorry

variable [IsManifold I 2 M] [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]

/-- **Layer 12.3.** Divergence as the pointwise trace of the covariant derivative — for Tau Ceti's
Levi-Civita connection `CovariantDerivative.leviCivita`, consumed together with its regularity
(`CovariantDerivative.instContMDiffCovariantDerivativeLeviCivita`); the fundamental theorem of
Riemannian geometry itself is the Hopf–Rinow roadmap's and is already in Tau Ceti. -/
noncomputable def divergence (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]
    (X : (x : M) → TangentSpace I x) (x : M) : ℝ :=
  LinearMap.trace ℝ (TangentSpace I x) (CovariantDerivative.leviCivita I M X x).toLinearMap

/-- **Layer 12.3.** The Hessian `Hess f (v, w) = ⟪∇_v grad f, w⟫`. -/
noncomputable def hessian (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) (v w : TangentSpace I x) : ℝ :=
  ⟪CovariantDerivative.leviCivita I M (mgradient I f) x v, w⟫_ℝ

/-- Symmetry of the Hessian, from torsion-freeness. -/
theorem hessian_symm [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M) (v w : TangentSpace I x) :
    hessian I f x v w = hessian I f x w v :=
  sorry

/-- **Layer 12.3.** The Laplace–Beltrami operator, `Δ f = div (grad f)` — this repository's sign. -/
noncomputable def laplaceBeltrami (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)] (f : M → ℝ) (x : M) : ℝ :=
  divergence I (mgradient I f) x

/-- `Δ f` is the trace of the Hessian. -/
theorem laplaceBeltrami_eq_sum_hessian (f : M → ℝ) (x : M)
    (b : OrthonormalBasis (Fin m) ℝ (TangentSpace I x)) :
    laplaceBeltrami I f x = ∑ i, hessian I f x (b i) (b i) :=
  sorry

/-- **Layer 12.5, acceptance: the sign gate.** On an inner product space, `laplaceBeltrami` is the
`Δ` of `InnerProductSpace.instLaplacian`, and `Δ ‖x‖² = 2 · dim`. -/
theorem laplaceBeltrami_eq_laplacian {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] {f : F → ℝ} (hf : ContDiff ℝ 2 f) (x : F) :
    let _ : RiemannianBundle (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) :=
      ⟨(riemannianMetricVectorSpace F).toRiemannianMetric⟩
    let _ : IsContMDiffRiemannianBundle 𝓘(ℝ, F) 1 F (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) := sorry
    laplaceBeltrami 𝓘(ℝ, F) f x = Laplacian.laplacian f x :=
  sorry

theorem laplaceBeltrami_norm_sq {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (x : F) :
    let _ : RiemannianBundle (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) :=
      ⟨(riemannianMetricVectorSpace F).toRiemannianMetric⟩
    let _ : IsContMDiffRiemannianBundle 𝓘(ℝ, F) 1 F (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) := sorry
    laplaceBeltrami 𝓘(ℝ, F) (fun y ↦ ‖y‖ ^ 2) x = 2 * Module.finrank ℝ F :=
  sorry

/-- **Layer 12.4.** The Riemannian volume form of an oriented Riemannian manifold: the unique
positively oriented top form taking the value `1` on positively oriented orthonormal bases
[Lee, Prop. 15.29]. -/
noncomputable def riemannianVolumeForm (o : Manifold.Orientation I M (Fin m)) : RoughForm I M ℝ m :=
  sorry

theorem riemannianVolumeForm_apply_orthonormal (hm : Module.finrank ℝ E = m)
    (o : Manifold.Orientation I M (Fin m)) (x : M) (b : OrthonormalBasis (Fin m) ℝ (TangentSpace I x))
    (hb : b.toBasis.orientation = orientationAt o x) : riemannianVolumeForm o x b = 1 :=
  sorry

variable (I M) in
/-- **Layer 12.4.** The Riemannian density, orientation-free: value `1` on orthonormal bases. It is
what 5.5's densities are for, and the measure is induced from it. -/
noncomputable def riemannianDensity : RoughDensity I M (Module.finrank ℝ E) :=
  sorry

theorem riemannianDensity_apply_orthonormal (x : M)
    (b : OrthonormalBasis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)) :
    (riemannianDensity I M x).toFun b = 1 :=
  sorry

theorem riemannianVolumeForm_toDensity (o : Manifold.Orientation I M (Fin (Module.finrank ℝ E))) :
    (riemannianVolumeForm o).toDensity o = riemannianDensity I M :=
  sorry

/-- **Layer 12.4, the primary Riemannian integration object**: the Riemannian measure, a Borel
measure on `M` (`[MeasurableSpace M] [BorelSpace M]` are hypotheses, not installed), induced
from the Riemannian density; locally finite and of full support, and agreeing with
`integralDensity` — hence with `∫_M f dV_g` on oriented `M` — for compactly supported continuous
integrands. -/
noncomputable def riemannianMeasure (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [MeasurableSpace M] [BorelSpace M] : MeasureTheory.Measure M :=
  sorry

theorem integral_riemannianMeasure_eq_integralDensity [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] {f : M → ℝ} (hf : Continuous f) (hc : HasCompactSupport f) :
    ∫ x, f x ∂riemannianMeasure I M = integralDensity (fun x ↦ f x • riemannianDensity I M x) :=
  sorry

theorem isOpenPosMeasure_riemannianMeasure [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] : (riemannianMeasure I M).IsOpenPosMeasure :=
  sorry

theorem isLocallyFiniteMeasure_riemannianMeasure [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] : MeasureTheory.IsLocallyFiniteMeasure (riemannianMeasure I M) :=
  sorry

/-- Strict positivity, stated measure-theoretically through `lintegral` — ⚠ never through the
junk-valued Bochner integral, which is `0` on any nonintegrable function. -/
theorem lintegral_riemannianMeasure_pos [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] {f : M → ℝ} (hf : Continuous f) (hnn : ∀ x, 0 ≤ f x)
    (hpos : ∃ x, 0 < f x) : 0 < ∫⁻ x, ENNReal.ofReal (f x) ∂riemannianMeasure I M :=
  sorry

/-- **Layer 12.4.** `div` re-characterized by `d(ι_X dV_g) = (div X) dV_g`, the bridge between the
trace definition and [Lee]'s form-level one; orientation independence of `div` is automatic. -/
theorem mextDeriv_interior_riemannianVolumeForm [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (hm : Module.finrank ℝ E = m + 1) (o : Manifold.Orientation I M (Fin (m + 1)))
    {X : (x : M) → TangentSpace I x}
    (hX : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, X y⟩ : TangentBundle I M))) :
    mextDeriv ((riemannianVolumeForm o).interior X) = fun x ↦ divergence I X x • riemannianVolumeForm o x :=
  sorry

/-- **Layer 12.5, the divergence theorem and Green's identities** on boundaryless `M`, for
compactly supported fields and functions; the boundary version, with the outward unit normal
and the induced metric of 5.1 and 12.1, is stated in `README.md`. -/
theorem integral_divergence_eq_zero [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    {X : (x : M) → TangentSpace I x}
    (hX : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, X y⟩ : TangentBundle I M)))
    {K : Set M} (hK : IsCompact K) (hXK : ∀ x ∉ K, X x = 0) :
    ∫ x, divergence I X x ∂riemannianMeasure I M = 0 :=
  sorry

theorem integral_mul_laplaceBeltrami [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] {f g : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hfc : HasCompactSupport f) :
    ∫ x, f x * laplaceBeltrami I g x ∂riemannianMeasure I M =
      -∫ x, ⟪mgradient I f x, mgradient I g x⟫_ℝ ∂riemannianMeasure I M :=
  sorry

theorem integral_laplaceBeltrami_symm [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] {f g : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hfc : HasCompactSupport f)
    (hgc : HasCompactSupport g) :
    ∫ x, f x * laplaceBeltrami I g x ∂riemannianMeasure I M =
      ∫ x, laplaceBeltrami I f x * g x ∂riemannianMeasure I M :=
  sorry

end Riemannian

section RoundMetric

/-- **Layer 12.1.** The round metric on the circle, the pullback of the ambient inner product along
the inclusion; `volume_circle` is the gate `vol(S¹) = 2π`, reusing the integral from 5.5. -/
@[instance_reducible]
noncomputable def roundMetricCircle : RiemannianBundle (fun x : Circle ↦ TangentSpace (𝓡 1) x) :=
  sorry

theorem roundMetricCircle_inner (x : Circle) (v w : TangentSpace (𝓡 1) x) :
    let _ := roundMetricCircle
    ⟪v, w⟫_ℝ = ⟪mfderiv (𝓡 1) 𝓘(ℝ, ℂ) (fun z : Circle ↦ (z : ℂ)) x v,
      mfderiv (𝓡 1) 𝓘(ℝ, ℂ) (fun z : Circle ↦ (z : ℂ)) x w⟫_ℝ :=
  sorry

theorem volume_circle :
    let _ := roundMetricCircle
    riemannianMeasure (𝓡 1) Circle Set.univ = ENNReal.ofReal (2 * Real.pi) :=
  sorry

end RoundMetric
end TauCetiRoadmap.DifferentialGeometry

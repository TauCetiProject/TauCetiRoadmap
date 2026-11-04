import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic
import TauCeti.LinearAlgebra.TotallyReal.Basic
import Mathlib.Geometry.Manifold.SmoothEmbedding

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
They cover the planar Sobolev classes of PH1.1, the finite-regularity almost complex structures
and totally real embeddings of PH2.1 to PH2.2, and the planar form of the weak Cauchy–Riemann
equation with the interior bootstrapping theorem of PH5.1. The surface-level classes of PH4,
the bundle Sobolev spaces of PH6 and Riemann–Roch are README targets with no prototype here.
-/

noncomputable section

namespace TauCetiRoadmap.PseudoholomorphicCurveAnalysis

open MeasureTheory TopologicalSpace Complex
open scoped Manifold ContDiff

/-! ## PH1.1: vector-valued local Sobolev classes on planar domains -/

/-- `u` lies in `Lᵖ` on every compact subset of `Ω`. -/
def MemLpLoc {F : Type*} [NormedAddCommGroup F] (p : ENNReal) (Ω : Opens ℂ) (u : ℂ → F) :
    Prop :=
  ∀ K : Set ℂ, K ⊆ Ω → IsCompact K → MemLp u p (volume.restrict K)

/-- `MemWkpLoc p k Ω u`: the iterated weak derivatives of `u` up to order `k` exist on `Ω` and
are locally `Lᵖ`. The derivative of a map into `F` is a map into `ℂ →L[ℝ] F`, so the order-`k`
derivative takes values in `k`-fold iterated continuous linear maps. -/
def MemWkpLoc (p : ENNReal) (Ω : Opens ℂ) :
    (k : ℕ) → {F : Type} → [NormedAddCommGroup F] → [NormedSpace ℝ F] → (ℂ → F) → Prop
  | 0, _, _, _, u => MemLpLoc p Ω u
  | k + 1, F, _, _, u => MemLpLoc p Ω u ∧
      ∃ U : ℂ → ℂ →L[ℝ] F, TauCeti.HasWeakFDerivOn volume Ω u U ∧ MemWkpLoc p Ω k U

/-! ## PH2.1: finite-regularity almost complex structures -/

section AlmostComplex

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- A `C^n` almost complex structure: a `C^n` section of the tangent endomorphism bundle with
square `-1` in every fiber. At `n = ∞` this is `TauCeti.SmoothAlmostComplexStructure`. -/
structure ContMDiffAlmostComplexStructure (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] (n : ℕ∞) where
  /-- The underlying `C^n` section of the tangent endomorphism bundle. -/
  toEndomorphism :
    ContMDiffSection I (E →L[ℝ] E) n
      (fun x : M ↦ TangentSpace I x →L[ℝ] TangentSpace I x)
  /-- The defining identity `J² = -1` on every tangent fiber. -/
  square_neg : ∀ x, (toEndomorphism x).comp (toEndomorphism x) = -ContinuousLinearMap.id ℝ _

/-- The two carriers agree at `n = ∞` (PH2.1). -/
def ContMDiffAlmostComplexStructure.equivSmooth :
    ContMDiffAlmostComplexStructure I M ⊤ ≃ TauCeti.SmoothAlmostComplexStructure I M :=
  sorry

end AlmostComplex

/-! ## PH2.2: totally real embeddings -/

section TotallyReal

variable {E H M EL HL L : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [NormedAddCommGroup EL] [NormedSpace ℝ EL] [TopologicalSpace HL]
  {IL : ModelWithCorners ℝ EL HL} [TopologicalSpace L] [ChartedSpace HL L] [IsManifold IL ∞ L]

/-- A smooth embedding whose tangent image at every point is maximal totally real for `J`. -/
def IsTotallyRealEmbedding (J : TauCeti.SmoothAlmostComplexStructure I M) (ι : L → M) : Prop :=
  Manifold.IsSmoothEmbedding IL I ∞ ι ∧
    ∀ x : L, TauCeti.IsMaximalTotallyReal (J.toEndomorphism (ι x)).toLinearMap
      (LinearMap.range (mfderiv IL I ι x).toLinearMap)

end TotallyReal

/-! ## PH4.2 and PH5.1 in planar form -/

section Planar

variable {V : Type} [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V]

/-- The weak nonlinear Cauchy–Riemann equation `∂ₛu + J(u) ∂ₜu = 0` on a planar domain, for a
continuous `W^{1,p}_loc` map. The derivative at `z` applied to `1` is `∂ₛu` and applied to `I`
is `∂ₜu`. -/
def IsWeakCauchyRiemannOn (p : ENNReal) (Ω : Opens ℂ) (J : V → V →L[ℝ] V) (u : ℂ → V) : Prop :=
  ContinuousOn u Ω ∧ MemWkpLoc p Ω 1 u ∧
    ∃ U : ℂ → ℂ →L[ℝ] V, TauCeti.HasWeakFDerivOn volume Ω u U ∧
      ∀ᵐ z ∂(volume.restrict (Ω : Set ℂ)), U z 1 + J (u z) (U z I) = 0

/-- PH5.1, interior planar form: a weak solution for a `C^ℓ` structure, `ℓ ≥ 1`, finite
`p > 2`, is in `W^{ℓ+1,p}_loc`. The endpoint `p = ∞` is excluded: see the README. -/
theorem memWkpLoc_of_isWeakCauchyRiemannOn {p : ENNReal} (hp : 2 < p) (hp_top : p ≠ ⊤)
    {ℓ : ℕ} (hℓ : 1 ≤ ℓ) {Ω : Opens ℂ} {J : V → V →L[ℝ] V} (hJ : ContDiff ℝ ℓ J)
    (hJsq : ∀ x, (J x).comp (J x) = -ContinuousLinearMap.id ℝ V) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannOn p Ω J u) :
    MemWkpLoc p Ω (ℓ + 1) u :=
  sorry

/-- PH5.1, smooth case: a weak solution for a smooth structure is smooth on `Ω`. Since `u` is
continuous, no modification on a null set is needed. -/
theorem contDiffOn_of_isWeakCauchyRiemannOn {p : ENNReal} (hp : 2 < p)
    {Ω : Opens ℂ} {J : V → V →L[ℝ] V} (hJ : ContDiff ℝ ∞ J)
    (hJsq : ∀ x, (J x).comp (J x) = -ContinuousLinearMap.id ℝ V) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannOn p Ω J u) :
    ContDiffOn ℝ ∞ u Ω :=
  sorry

end Planar

end TauCetiRoadmap.PseudoholomorphicCurveAnalysis

module

public import Mathlib
public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
public import TauCeti.LinearAlgebra.TotallyReal.Basic

/-!
# Elliptic analysis of pseudoholomorphic curves: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, in the planar form to which
the README's Layer 5 reduces them: a map from an open subset of `ℂ`, or of the closed upper half
plane, into a finite-dimensional real vector space, solving the weak Cauchy–Riemann equation
`∂ₛu + J(z, u)∂ₜu = η(z, u)` for domain-dependent `J` and an inhomogeneous term `η`. The only
definitions are the local Sobolev classes of Layer 1 and the two weak-solution predicates of
Layer 4 that these statements need.

Stated here: interior bootstrapping (Layer 5.1, Theorem B.4.1 with Remark B.4.3 of
McDuff–Salamon) in its finite-regularity and smooth forms; boundary bootstrapping in the adapted
chart, with the totally real boundary condition `u(ℝ) ⊆ L` and `J = i` along `L`, in both forms;
and the Carleman similarity principle (Layer 3.5, Theorem 2.3.5).

Not statable at the pins: the surface-level statements of Layers 4 and 5 (no carrier for
`W^{k,p}_loc` maps from a Riemann surface, with or without boundary, into a manifold); the
uniform estimates of Layer 5.2 (the same carrier); the Fredholm theorem of Layer 6.3 and the
Riemann–Roch formulas of Layer 7.2 (no `W^{k,p}` sections of a bundle over a compact surface
with boundary and no `c₁` pairing of a complex bundle with the fundamental class).
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.PseudoholomorphicCurveAnalysis

open MeasureTheory TopologicalSpace Complex
open scoped ContDiff

/-! ## Layer 1: local Sobolev maps on planar domains and half-discs -/

/-- `u` lies in `Lᵖ` on every compact subset of `U`. For a relatively open subset `U` of the
closed upper half plane the compact sets reach the real axis, so the bounds hold up to it. -/
def MemLpLoc {F : Type*} [NormedAddCommGroup F] (p : ENNReal) (U : Set ℂ) (u : ℂ → F) :
    Prop :=
  ∀ K : Set ℂ, K ⊆ U → IsCompact K → MemLp u p (volume.restrict K)

/-- `MemWkpLoc p Ω k u`: the iterated weak derivatives of `u` up to order `k` exist on the open
set `Ω` and are locally `Lᵖ`. The derivative of a map into `F` is a map into `ℂ →L[ℝ] F`, so
the order-`k` derivative takes values in `k`-fold iterated continuous linear maps. -/
def MemWkpLoc (p : ENNReal) (Ω : Opens ℂ) :
    (k : ℕ) → {F : Type*} → [NormedAddCommGroup F] → [NormedSpace ℝ F] → (ℂ → F) → Prop
  | 0, _, _, _, u => MemLpLoc p Ω u
  | k + 1, F, _, _, u => MemLpLoc p Ω u ∧
      ∃ U : ℂ → ℂ →L[ℝ] F, TauCeti.HasWeakFDerivOn volume Ω u U ∧ MemWkpLoc p Ω k U

/-- `MemWkpLocHalf p U k u`: the half-disc class. The weak derivatives are taken on the interior
of `U` in `ℂ`, which for a relatively open subset `U` of the closed upper half plane is
`U ∖ ℝ`, and every derivative is `Lᵖ` on every compact subset of `U`, so the bounds reach the
real axis while the test functions are those of the interior. -/
def MemWkpLocHalf (p : ENNReal) (U : Set ℂ) :
    (k : ℕ) → {F : Type*} → [NormedAddCommGroup F] → [NormedSpace ℝ F] → (ℂ → F) → Prop
  | 0, _, _, _, u => MemLpLoc p U u
  | k + 1, F, _, _, u => MemLpLoc p U u ∧
      ∃ U' : ℂ → ℂ →L[ℝ] F,
        TauCeti.HasWeakFDerivOn volume ⟨interior U, isOpen_interior⟩ u U' ∧
          MemWkpLocHalf p U k U'

/-! ## Layer 4: the weak Cauchy–Riemann equation in planar form -/

section Planar

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- The weak nonlinear Cauchy–Riemann equation `∂ₛu + J(z, u) ∂ₜu = η(z, u)` on an open set
`Ω`, for a continuous `W^{1,p}_loc` map `u`, a domain-dependent structure `J` and an
inhomogeneous term `η`. The weak derivative at `z` applied to `1` is `∂ₛu` and applied to `I`
is `∂ₜu`. -/
def IsWeakCauchyRiemannOn (p : ENNReal) (Ω : Opens ℂ) (J : ℂ → V → V →L[ℝ] V)
    (η : ℂ → V → V) (u : ℂ → V) : Prop :=
  ContinuousOn u Ω ∧ MemLpLoc p Ω u ∧
    ∃ U : ℂ → ℂ →L[ℝ] V, TauCeti.HasWeakFDerivOn volume Ω u U ∧ MemLpLoc p Ω U ∧
      ∀ᵐ z ∂(volume.restrict (Ω : Set ℂ)), U z 1 + J z (u z) (U z I) = η z (u z)

/-- The same equation on a set `U` reaching the real axis: `u` is continuous on `U`, the weak
derivative is taken on the interior of `U`, and `u` and its derivative are `Lᵖ` on the compact
subsets of `U`. -/
def IsWeakCauchyRiemannHalfOn (p : ENNReal) (U : Set ℂ) (J : ℂ → V → V →L[ℝ] V)
    (η : ℂ → V → V) (u : ℂ → V) : Prop :=
  ContinuousOn u U ∧ MemLpLoc p U u ∧
    ∃ U' : ℂ → ℂ →L[ℝ] V,
      TauCeti.HasWeakFDerivOn volume ⟨interior U, isOpen_interior⟩ u U' ∧ MemLpLoc p U U' ∧
        ∀ᵐ z ∂(volume.restrict U), U' z 1 + J z (u z) (U' z I) = η z (u z)

/-! ## Layer 5: nonlinear bootstrapping, interior case -/

/-- Layer 5.1, interior: a weak solution for a `C^ℓ` domain-dependent structure and a `C^ℓ`
inhomogeneous term, `ℓ ≥ 1`, finite `p > 2`, is in `W^{ℓ+1,p}_loc` (McDuff–Salamon Theorem B.4.1
with Remark B.4.3). The endpoint `p = ∞` is excluded: see the README. -/
theorem memWkpLoc_of_isWeakCauchyRiemannOn [FiniteDimensional ℝ V] {p : ENNReal} (hp : 2 < p)
    (hp_top : p ≠ ⊤) {ℓ : ℕ} (hℓ : 1 ≤ ℓ) {Ω : Opens ℂ} {J : ℂ → V → V →L[ℝ] V}
    (hJ : ContDiff ℝ ℓ (Function.uncurry J))
    (hJsq : ∀ z x, (J z x).comp (J z x) = -ContinuousLinearMap.id ℝ V) {η : ℂ → V → V}
    (hη : ContDiff ℝ ℓ (Function.uncurry η)) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannOn p Ω J η u) :
    MemWkpLoc p Ω (ℓ + 1) u := by
  sorry

/-- Layer 5.1, interior smooth case: a weak solution for smooth data is smooth on `Ω`. Since `u`
is continuous, no modification on a null set is needed. Unlike the finite-regularity statement
this allows `p = ∞`: a `W^{1,∞}_loc` solution is `W^{1,q}_loc` for every finite `q > 2`. -/
theorem contDiffOn_of_isWeakCauchyRiemannOn [FiniteDimensional ℝ V] {p : ENNReal} (hp : 2 < p)
    {Ω : Opens ℂ} {J : ℂ → V → V →L[ℝ] V} (hJ : ContDiff ℝ ∞ (Function.uncurry J))
    (hJsq : ∀ z x, (J z x).comp (J z x) = -ContinuousLinearMap.id ℝ V) {η : ℂ → V → V}
    (hη : ContDiff ℝ ∞ (Function.uncurry η)) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannOn p Ω J η u) :
    ContDiffOn ℝ ∞ u Ω := by
  sorry

end Planar

/-! ## Layers 3 and 5: the complex model, boundary case and similarity principle -/

section ComplexModel

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]

/-- Layer 5.1, boundary case in the adapted chart of Layer 2.3 (McDuff–Salamon Theorem B.4.1
and Proposition B.4.9): `U` is relatively open in the closed upper half plane, `L` is a maximal
totally real subspace for multiplication by `i`, the structure equals `i` along `L` over the
real axis, and `u` maps `U ∩ ℝ` into `L`. For `ℓ ≥ 1` and finite `p > 2`, `u` is in
`W^{ℓ+1,p}` up to the real axis. The manifold statement, `W^{ℓ,p}` for `ℓ ≥ 2`, is this one
applied to the `C^{ℓ−1}` structure pushed forward by the adapted chart. -/
theorem memWkpLocHalf_of_isWeakCauchyRiemannHalfOn [FiniteDimensional ℂ V] {p : ENNReal}
    (hp : 2 < p) (hp_top : p ≠ ⊤) {ℓ : ℕ} (hℓ : 1 ≤ ℓ) {U : Set ℂ}
    (hU : ∃ W : Set ℂ, IsOpen W ∧ U = W ∩ {z : ℂ | 0 ≤ z.im}) {L : Submodule ℝ V}
    (hL : TauCeti.IsMaximalTotallyReal ((LinearMap.lsmul ℂ V I).restrictScalars ℝ) L)
    {J : ℂ → V → V →L[ℝ] V} (hJ : ContDiff ℝ ℓ (Function.uncurry J))
    (hJsq : ∀ z x, (J z x).comp (J z x) = -ContinuousLinearMap.id ℝ V)
    (hJL : ∀ z : ℂ, z.im = 0 → ∀ x ∈ L, ∀ v, J z x v = I • v) {η : ℂ → V → V}
    (hη : ContDiff ℝ ℓ (Function.uncurry η)) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannHalfOn p U J η u) (hbd : ∀ z ∈ U, z.im = 0 → u z ∈ L) :
    MemWkpLocHalf p U (ℓ + 1) u := by
  sorry

/-- Layer 5.1, boundary smooth case: for smooth data the solution is `W^{k,p}` up to the real
axis for every `k`, which is smoothness up to the boundary. `p = ∞` is allowed as in the interior
case. -/
theorem memWkpLocHalf_all_of_isWeakCauchyRiemannHalfOn [FiniteDimensional ℂ V] {p : ENNReal}
    (hp : 2 < p) {U : Set ℂ} (hU : ∃ W : Set ℂ, IsOpen W ∧ U = W ∩ {z : ℂ | 0 ≤ z.im})
    {L : Submodule ℝ V}
    (hL : TauCeti.IsMaximalTotallyReal ((LinearMap.lsmul ℂ V I).restrictScalars ℝ) L)
    {J : ℂ → V → V →L[ℝ] V} (hJ : ContDiff ℝ ∞ (Function.uncurry J))
    (hJsq : ∀ z x, (J z x).comp (J z x) = -ContinuousLinearMap.id ℝ V)
    (hJL : ∀ z : ℂ, z.im = 0 → ∀ x ∈ L, ∀ v, J z x v = I • v) {η : ℂ → V → V}
    (hη : ContDiff ℝ ∞ (Function.uncurry η)) {u : ℂ → V}
    (hu : IsWeakCauchyRiemannHalfOn p U J η u) (hbd : ∀ z ∈ U, z.im = 0 → u z ∈ L) :
    ∀ k : ℕ, MemWkpLocHalf p U k u := by
  sorry

/-- Layer 3.5, the Carleman similarity principle (McDuff–Salamon Theorem 2.3.5): for finite
`p > 2`, a `W^{1,p}_loc` structure `J` with `J² = −1`, a locally `Lᵖ` zeroth-order term `C` and
a continuous `W^{1,p}_loc` solution `ξ` of `∂ₛξ + J ∂ₜξ + Cξ = 0` vanishing at `z₀`, there are a
disc about `z₀`, a continuous `W^{1,p}` frame `Φ` of invertible maps intertwining `J` with
multiplication by `i`, and a holomorphic `σ` vanishing at `z₀`, with `ξ = Φσ` on the disc. -/
theorem exists_similarity_of_isWeakLinearCauchyRiemann [FiniteDimensional ℂ V] {p : ENNReal}
    (hp : 2 < p) (hp_top : p ≠ ⊤) {Ω : Opens ℂ} {J : ℂ → V →L[ℝ] V} (hJ : MemWkpLoc p Ω 1 J)
    (hJsq : ∀ z ∈ Ω, (J z).comp (J z) = -ContinuousLinearMap.id ℝ V) {C : ℂ → V →L[ℝ] V}
    (hC : MemLpLoc p Ω C) {ξ : ℂ → V} (hξ : ContinuousOn ξ Ω) {U : ℂ → ℂ →L[ℝ] V}
    (hU : TauCeti.HasWeakFDerivOn volume Ω ξ U) (hUp : MemLpLoc p Ω U)
    (heq : ∀ᵐ z ∂(volume.restrict (Ω : Set ℂ)), U z 1 + J z (U z I) + C z (ξ z) = 0)
    {z₀ : ℂ} (hz₀ : z₀ ∈ Ω) (h0 : ξ z₀ = 0) :
    ∃ r > 0, Metric.ball z₀ r ⊆ Ω ∧ ∃ Φ : ℂ → V ≃L[ℝ] V, ∃ σ : ℂ → V,
      ContinuousOn (fun z ↦ (Φ z : V →L[ℝ] V)) (Metric.ball z₀ r) ∧
      MemWkpLoc p ⟨Metric.ball z₀ r, Metric.isOpen_ball⟩ 1 (fun z ↦ (Φ z : V →L[ℝ] V)) ∧
      (∀ z ∈ Metric.ball z₀ r, ∀ v, J z (Φ z v) = Φ z (I • v)) ∧
      DifferentiableOn ℂ σ (Metric.ball z₀ r) ∧ σ z₀ = 0 ∧
      ∀ z ∈ Metric.ball z₀ r, ξ z = Φ z (σ z) := by
  sorry

end ComplexModel

end TauCetiRoadmap.PseudoholomorphicCurveAnalysis

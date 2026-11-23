module

public import Mathlib
public import TauCeti.Geometry.Diffeomorphism.Group

/-!
# Hölder maps between manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's core
definitions against the pinned Mathlib and Tau Ceti, with some of the theorems about them. The
README is definitive, and the declarations here are suggested forms, not an exhaustive checklist.

Stated here: the class `C^{k,α}` of maps between manifolds with corners, at a point, on a set and
globally (§2.1), with the comparison with `C^k` and `C^{k+1}` (§2.1 item 1), chart independence
over the maximal atlases (§2.2) and composition (§2.3 items 1 and 2); Hölder diffeomorphisms
(§3.1) with the regularity of the inverse of a `C^k` diffeomorphism that is `C^{k,α}`; and the
subgroup `Diff^{k,α}(M)` of the `C^k` diffeomorphism group `TauCeti.Diff I M k` (§3.3).

The definitions accept every `α`; the theorems assume `0 < α ≤ 1`. The subgroup takes `1 ≤ k`
and `α ≤ 1`, the range in which §2.3 gives closure under composition, as `Fact` instances.

Not statable at the pins:
* the Euclidean estimates of Layer 1 and the function-space statements of Layer 5: they are about
  Tau Ceti's Hölder spaces of positive order on open sets and on compact manifolds
  (`TauCeti.CkHolderSpaceOn`, `TauCeti.CompactChartAtlas.CkHolderSpace`), which are not at the
  pinned Tau Ceti;
* the uniform estimates in exponential charts (§3.4): the radius of uniform normal domains,
  `TauCeti.Manifold.exists_pos_contMDiffAt_riemannianExp_smul_riemannianLog`, is not at the pin.

Not stated here although statable: the inverse function theorems of §3.2, and the topologies of
Layer 4, which the README defines by Hölder chart tests.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.HolderMapsBetweenManifolds

open Set
open scoped Manifold ContDiff NNReal Topology

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'}
  {N : Type*} [TopologicalSpace N] [ChartedSpace H' N]
  {E'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [FiniteDimensional ℝ E'']
  {H'' : Type*} [TopologicalSpace H''] {K : ModelWithCorners ℝ E'' H''}
  {P : Type*} [TopologicalSpace P] [ChartedSpace H'' P]

/-! ## Layer 2: `C^{k,α}` maps between manifolds -/

section Class

/-- §2.1. `f` is `C^{k,α}` at `x`: continuous at `x`, and on a relative ball around
`extChartAt I x x` inside the domain of its representative, the representative is `C^k` with
`α`-Hölder `k`th derivative. -/
def ContMDiffHolderAt (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) (x : M) : Prop :=
  ContinuousAt f x ∧ ∃ r > (0 : ℝ), ∃ C : ℝ≥0,
    let s := range I ∩ Metric.ball (extChartAt I x x) r
    s ⊆ (extChartAt I x).target ∩ (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J (f x)).source) ∧
    ContDiffOn ℝ k (writtenInExtChartAt I J x f) s ∧
    HolderOnWith C α (iteratedFDerivWithin ℝ k (writtenInExtChartAt I J x f) s) s

/-- §2.1. `f` is `C^{k,α}` at every point of `s`; on an open `s` this is the local class
`C^{k,α}_loc(s, N)`. -/
def ContMDiffHolderOn (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) (s : Set M) : Prop :=
  ∀ x ∈ s, ContMDiffHolderAt I J k α f x

/-- §2.1. `f` is `C^{k,α}`. On a noncompact `M` this is the local class, with no global bound. -/
def ContMDiffHolder (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) : Prop :=
  ∀ x, ContMDiffHolderAt I J k α f x

variable [IsManifold I ∞ M] [IsManifold J ∞ N] [IsManifold K ∞ P]
  {k : ℕ} {α β γ : ℝ≥0} {f : M → N} {g : N → P}

/-- §2.1 item 1. -/
theorem ContMDiffHolder.contMDiff (hf : ContMDiffHolder I J k α f) : ContMDiff I J k f :=
  sorry

/-- §2.1 item 1: `C^{k+1}` maps are `C^{k,1}`. -/
theorem _root_.ContMDiff.contMDiffHolder_one (hf : ContMDiff I J (k + 1) f) :
    ContMDiffHolder I J k 1 f :=
  sorry

/-- §2.2: chart independence. Membership in `C^{k,α}` can be tested in every pair of charts of
the maximal atlases, with Hölder bounds on compact subsets of the chart domains. -/
theorem contMDiffHolder_iff_maximalAtlas (hα₀ : 0 < α) (hα₁ : α ≤ 1) :
    ContMDiffHolder I J k α f ↔ Continuous f ∧
      ∀ e ∈ IsManifold.maximalAtlas I ∞ M, ∀ e' ∈ IsManifold.maximalAtlas J ∞ N,
        let U := e.extend I '' (e.source ∩ f ⁻¹' e'.source)
        ContDiffOn ℝ k (e'.extend J ∘ f ∘ (e.extend I).symm) U ∧
          ∀ L ⊆ U, IsCompact L → ∃ C : ℝ≥0,
            HolderOnWith C α (iteratedFDerivWithin ℝ k (e'.extend J ∘ f ∘ (e.extend I).symm) U)
              L :=
  sorry

/-- §2.3 item 1: composition in positive order. -/
theorem ContMDiffHolder.comp (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1)
    (hg : ContMDiffHolder J K k α g) (hf : ContMDiffHolder I J k α f) :
    ContMDiffHolder I K k α (g ∘ f) :=
  sorry

/-- §2.3 item 2: in order zero the exponents multiply. -/
theorem ContMDiffHolder.comp_zero (hβ₀ : 0 < β) (hβ₁ : β ≤ 1) (hγ₀ : 0 < γ) (hγ₁ : γ ≤ 1)
    (hg : ContMDiffHolder J K 0 γ g) (hf : ContMDiffHolder I J 0 β f) :
    ContMDiffHolder I K 0 (β * γ) (g ∘ f) :=
  sorry

end Class

/-! ## Layer 3: Hölder diffeomorphisms and the group `Diff^{k,α}(M)` -/

section Diffeomorph

/-- §3.1. A `C^{k,α}` diffeomorphism: a `C^k` diffeomorphism that is `C^{k,α}` with `C^{k,α}`
inverse. A `C^{1+α}` diffeomorphism is a `HolderDiffeomorph I J M N 1 α`. -/
structure HolderDiffeomorph (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (M N : Type*) [TopologicalSpace M] [ChartedSpace H M] [TopologicalSpace N]
    [ChartedSpace H' N] (k : ℕ) (α : ℝ≥0) extends Diffeomorph I J M N k where
  contMDiffHolder_toFun : ContMDiffHolder I J k α toFun
  contMDiffHolder_invFun : ContMDiffHolder J I k α invFun

variable [IsManifold I ∞ M] [IsManifold J ∞ N] {k : ℕ} {α : ℝ≥0}

/-- §3.1: the inverse of a `C^k` diffeomorphism that is `C^{k,α}` is `C^{k,α}`, with boundary
and corners allowed. -/
theorem _root_.Diffeomorph.contMDiffHolder_symm (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1)
    (f : Diffeomorph I J M N k) (hf : ContMDiffHolder I J k α f) :
    ContMDiffHolder J I k α f.symm :=
  sorry

variable (I M k α) in
/-- §3.3. The group `Diff^{k,α}(M)` of `C^{k,α}` self-diffeomorphisms, as a subgroup of the
`C^k` diffeomorphism group. By `Diffeomorph.contMDiffHolder_symm` the second condition follows
from the first when `0 < α`. -/
def HolderDiff [Fact (1 ≤ k)] [Fact (α ≤ 1)] : Subgroup (TauCeti.Diff I M k) where
  carrier := {f | ContMDiffHolder I I k α f ∧ ContMDiffHolder I I k α f.symm}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

end Diffeomorph

end TauCetiRoadmap.HolderMapsBetweenManifolds

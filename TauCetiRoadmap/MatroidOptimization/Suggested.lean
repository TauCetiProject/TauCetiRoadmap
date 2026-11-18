import Mathlib
import TauCeti.Order.Lattice.Submodular

/-!
# Matroid optimization and submodular functions: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Matroids are Mathlib's `Matroid α`, whose ground set `M.E` is a set in the type `α` and may be
infinite; each statement carries the finiteness it needs. Weights are functions `w : α → R` on the
whole type. Set functions are functions `Finset α → ℝ` or `Finset α → ℕ`, and submodularity is Tau
Ceti's `TauCeti.IsSubmodular` on the lattice `Finset α`. The rank `M.eRk X` of a set is the rank of
`X ∩ M.E`, so sets in rank conditions need not lie in the ground set.
-/

noncomputable section

open Set TauCeti

namespace TauCetiRoadmap.MatroidOptimization

variable {α : Type*} {R : Type*}

/-! ## Layer 1: weighted bases and exchange -/

/-- 1.1 The weight of a set `X` for an element weight `w`: the sum of `w` over `X`. It is used
for finite sets only; on an infinite set whose weights have infinite support the `finsum` is
`0`. -/
def weight [AddCommMonoid R] (w : α → R) (X : Set α) : R :=
  ∑ᶠ e ∈ X, w e

/-- 1.1 A base of maximum weight: a base of `M` whose weight is at least the weight of every base
of `M`. -/
def IsMaxWeightBase [AddCommMonoid R] [LE R] (w : α → R) (M : Matroid α) (B : Set α) : Prop :=
  M.IsBase B ∧ ∀ B', M.IsBase B' → weight w B' ≤ weight w B

/-- 1.2 The symmetric exchange property. For bases `B`, `B'` of a matroid and `e ∈ B \ B'` there
is `f ∈ B' \ B` such that both `B - e + f` and `B' - f + e` are bases. No finiteness is
assumed. -/
theorem exists_symm_exchange {M : Matroid α} {B B' : Set α} (hB : M.IsBase B)
    (hB' : M.IsBase B') {e : α} (he : e ∈ B \ B') :
    ∃ f ∈ B' \ B, M.IsBase (insert f (B \ {e})) ∧ M.IsBase (insert e (B' \ {f})) := by
  sorry

section Cancel

variable [AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]

/-- 1.3 The exchange criterion. In a matroid of finite rank, a base has maximum weight exactly
when no exchange of one element for another increases the weight: whenever `e ∉ B`, `f ∈ B` and
`B - f + e` is a base, `w e ≤ w f`. -/
theorem isMaxWeightBase_iff_forall_exchange (M : Matroid α) [M.RankFinite] (w : α → R)
    (B : Set α) :
    IsMaxWeightBase w M B ↔
      M.IsBase B ∧ ∀ e f, e ∉ B → f ∈ B → M.IsBase (insert e (B \ {f})) → w e ≤ w f := by
  sorry

/-- 1.3 The threshold criterion. In a matroid of finite rank, a base `B` has maximum weight
exactly when, for every threshold `t`, the elements of `B` of weight at least `t` form a basis of
the set of all elements of the ground set of weight at least `t`. -/
theorem isMaxWeightBase_iff_forall_isBasis (M : Matroid α) [M.RankFinite] (w : α → R)
    (B : Set α) :
    IsMaxWeightBase w M B ↔
      M.IsBase B ∧ ∀ t : R, M.IsBasis (B ∩ {e | t ≤ w e}) (M.E ∩ {e | t ≤ w e}) := by
  sorry

/-- 1.3 The domination criterion. In a matroid of finite rank, a base `B` has maximum weight
exactly when every base `B'` can be mapped bijectively onto `B` so that no element is sent to a
lighter one. -/
theorem isMaxWeightBase_iff_forall_exists_bijOn (M : Matroid α) [M.RankFinite] (w : α → R)
    (B : Set α) :
    IsMaxWeightBase w M B ↔
      M.IsBase B ∧ ∀ B', M.IsBase B' →
        ∃ φ : α → α, BijOn φ B' B ∧ ∀ e ∈ B', w e ≤ w (φ e) := by
  sorry

/-- 1.4 Uniqueness. If the weight is injective on the ground set of a matroid of finite rank, any
two bases of maximum weight are equal. -/
theorem IsMaxWeightBase.eq_of_injOn {M : Matroid α} [M.RankFinite] {w : α → R} {B B' : Set α}
    (hB : IsMaxWeightBase w M B) (hB' : IsMaxWeightBase w M B') (hw : InjOn w M.E) : B = B' := by
  sorry

end Cancel

/-! ## Layer 2: the greedy theorem and its converse -/

/-- 2.1 The greedily built sets for a property `P` of sets and a weight `w`: the sets obtained
from the empty set by repeatedly adding an element `e` outside the set whose addition keeps `P`
and whose weight is greatest among the elements with these two properties. For `P = M.Indep`
these are the sets the greedy method can reach in the matroid `M`; the relation is stated for an
arbitrary property so that it applies to families of sets that are not matroids. -/
inductive Greedy [LE R] (P : Set α → Prop) (w : α → R) : Set α → Prop
  | empty : Greedy P w ∅
  | step {I : Set α} {e : α} : Greedy P w I → e ∉ I → P (insert e I) →
      (∀ e', e' ∉ I → P (insert e' I) → w e' ≤ w e) → Greedy P w (insert e I)

section Ordered

variable [AddCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]

/-- 2.1 The greedy theorem. In any matroid, a greedily built set has the greatest weight among
the independent sets with the same number of elements. No finiteness is assumed: a greedily built
set is finite. -/
theorem Greedy.weight_le {M : Matroid α} {w : α → R} {I J : Set α}
    (hI : Greedy M.Indep w I) (hJ : M.Indep J) (hcard : J.encard = I.encard) :
    weight w J ≤ weight w I := by
  sorry

/-- 2.1 In a matroid with finite ground set, every greedily built set is contained in a base of
maximum weight. -/
theorem Greedy.exists_isMaxWeightBase_superset {M : Matroid α} [M.Finite] {w : α → R}
    {I : Set α} (hI : Greedy M.Indep w I) : ∃ B, IsMaxWeightBase w M B ∧ I ⊆ B := by
  sorry

end Ordered

/-- 2.2 The converse of the greedy theorem (Rado, Edmonds). On a finite type, a family of sets
containing the empty set and closed under subsets is the family of independent sets of a matroid
if and only if, for every weight with values in `ℕ`, every greedily built member of the family
that is maximal in it has the greatest weight among all members. -/
theorem exists_matroid_indep_iff_greedy [Finite α] (P : Set α → Prop) (h0 : P ∅)
    (hmono : ∀ ⦃I J : Set α⦄, P J → I ⊆ J → P I) :
    (∃ M : Matroid α, ∀ I, M.Indep I ↔ P I) ↔
      ∀ (w : α → ℕ) (I : Set α), Greedy P w I → Maximal P I →
        ∀ J, P J → weight w J ≤ weight w I := by
  sorry

/-! ## Layer 3: rank functions, intersection and union -/

/-- 3.1 The characterization of rank functions. A function `r` from finite sets to `ℕ` is the
rank function of a matroid, restricted to finite sets, if and only if `r S ≤ |S|` for all `S`,
`r` is monotone and `r` is submodular. -/
theorem exists_matroid_eRk_eq_iff [DecidableEq α] (r : Finset α → ℕ) :
    (∃ M : Matroid α, ∀ S : Finset α, M.eRk (S : Set α) = r S) ↔
      (∀ S, r S ≤ S.card) ∧ Monotone r ∧ IsSubmodular r := by
  sorry

/-- 3.2 The matroid intersection theorem (Edmonds). For matroids `M₁`, `M₂` on the same type,
the first with finite ground set, there are a set `I` independent in both and a set `A` with
`|I| = r₁(A) + r₂(Aᶜ)`. Since every common independent set has at most `r₁(A) + r₂(Aᶜ)` elements
for every `A`, the set `I` is a largest common independent set and `A` minimises the sum of
ranks. -/
theorem exists_indep_encard_eq_eRk_add_eRk_compl (M₁ M₂ : Matroid α) [M₁.Finite] :
    ∃ I A : Set α, M₁.Indep I ∧ M₂.Indep I ∧ I.encard = M₁.eRk A + M₂.eRk Aᶜ := by
  sorry

/-- 3.3 The matroid union theorem, rank formula (Nash-Williams, Edmonds). For a finite family of
matroids on one type and a finite set `X`, there are independent sets `I i ⊆ X` of the `M i` and
a set `T ⊆ X` with `|⋃ i, I i| = |X \ T| + ∑ i, rᵢ(T)`. Every union of independent subsets of
`X` has at most `|X \ T| + ∑ i, rᵢ(T)` elements for every `T ⊆ X`. -/
theorem exists_iUnion_indep_encard_eq {ι : Type*} [Fintype ι] (M : ι → Matroid α) {X : Set α}
    (hX : X.Finite) :
    ∃ (I : ι → Set α) (T : Set α), (∀ i, (M i).Indep (I i)) ∧ (∀ i, I i ⊆ X) ∧ T ⊆ X ∧
      (⋃ i, I i).encard = (X \ T).encard + ∑ i, (M i).eRk T := by
  sorry

/-- 3.3 The matroid union theorem. For a finite family of matroids with finite ground sets, the
unions of independent sets, one from each matroid, are the independent sets of a matroid on the
union of the ground sets. -/
theorem exists_matroid_indep_iff_iUnion {ι : Type*} [Finite ι] (M : ι → Matroid α)
    [∀ i, (M i).Finite] :
    ∃ N : Matroid α, N.E = ⋃ i, (M i).E ∧
      ∀ J, N.Indep J ↔ ∃ I : ι → Set α, (∀ i, (M i).Indep (I i)) ∧ J = ⋃ i, I i := by
  sorry

/-- 3.4 Packing bases (Edmonds). A matroid with finite ground set has `k` pairwise disjoint bases
if and only if `k * (r(E) - r(T)) ≤ |E \ T|` for every set `T`, written here without
subtraction. -/
theorem exists_pairwise_disjoint_isBase_iff (M : Matroid α) [M.Finite] (k : ℕ) :
    (∃ B : Fin k → Set α, (∀ i, M.IsBase (B i)) ∧ Pairwise (Function.onFun Disjoint B)) ↔
      ∀ T : Set α, k * M.eRank ≤ k * M.eRk T + (M.E \ T).encard := by
  sorry

/-- 3.4 Covering by independent sets (Edmonds). The ground set of a matroid with finite ground
set is the union of `k` independent sets if and only if `|T| ≤ k * r(T)` for every subset `T` of
the ground set. -/
theorem exists_iUnion_indep_eq_ground_iff (M : Matroid α) [M.Finite] (k : ℕ) :
    (∃ I : Fin k → Set α, (∀ i, M.Indep (I i)) ∧ ⋃ i, I i = M.E) ↔
      ∀ T ⊆ M.E, T.encard ≤ k * M.eRk T := by
  sorry

/-- 3.5 Rado's theorem on independent transversals. A finite family of finite sets has a system
of distinct representatives that is independent in a matroid `M` if and only if the union of
every `n` of the sets has rank at least `n`. For the free matroid this is Hall's theorem. -/
theorem exists_injective_indep_range_iff {ι : Type*} [Finite ι] (M : Matroid α)
    (t : ι → Finset α) :
    (∃ f : ι → α, Function.Injective f ∧ (∀ i, f i ∈ t i) ∧ M.Indep (range f)) ↔
      ∀ s : Finset ι, (s.card : ℕ∞) ≤ M.eRk (⋃ i ∈ s, (t i : Set α)) := by
  sorry

/-! ## Layer 4: submodular set functions and the Lovász extension -/

section Lovasz

variable [Fintype α]

/-- 4.2 The Lovász extension of a set function `f` at `w : α → ℝ`: the sum over the values `t`
of `w` of `t * (f {w ≥ t} - f {w > t})`. It depends on `f` only through `f - f ∅`. -/
def lovaszExtension (f : Finset α → ℝ) (w : α → ℝ) : ℝ :=
  ∑ t ∈ Finset.univ.image w,
    t * (f (Finset.univ.filter fun i => t ≤ w i) - f (Finset.univ.filter fun i => t < w i))

/-- 4.3 The base polytope of a set function `f`: the vectors `x` with `x(S) ≤ f S` for every set
`S` and `x(univ) = f univ`. -/
def basePolytope (f : Finset α → ℝ) : Set (α → ℝ) :=
  {x | (∀ S : Finset α, ∑ i ∈ S, x i ≤ f S) ∧ ∑ i, x i = f Finset.univ}

/-- 4.3 The greedy theorem for the base polytope (Edmonds). For a submodular `f` with `f ∅ = 0`,
the Lovász extension at `w` is the greatest value of the linear function `x ↦ ∑ i, w i * x i` on
the base polytope; in particular the base polytope is not empty. -/
theorem isGreatest_image_basePolytope [DecidableEq α] {f : Finset α → ℝ}
    (hf : IsSubmodular f) (h0 : f ∅ = 0) (w : α → ℝ) :
    IsGreatest ((fun x : α → ℝ => ∑ i, w i * x i) '' basePolytope f) (lovaszExtension f w) := by
  sorry

/-- 4.4 Lovász's theorem. A set function is submodular if and only if its Lovász extension is
convex. -/
theorem convexOn_lovaszExtension_iff [DecidableEq α] (f : Finset α → ℝ) :
    ConvexOn ℝ univ (lovaszExtension f) ↔ IsSubmodular f := by
  sorry

/-- 4.5 For a set function `f` with `f ∅ = 0`, the Lovász extension has the same least value on
the cube `[0, 1]^α` as `f` has on the subsets of `α`. Submodularity is not needed. -/
theorem isLeast_image_lovaszExtension_iff {f : Finset α → ℝ} (h0 : f ∅ = 0) (m : ℝ) :
    IsLeast (lovaszExtension f '' Icc 0 1) m ↔ IsLeast (range f) m := by
  sorry

/-- 4.5 Edmonds' min-max theorem for submodular functions. For a submodular `f` with `f ∅ = 0`,
the least value of `f` is the greatest value, over the base polytope, of the sum of the negative
parts `min (x i) 0`. -/
theorem isGreatest_image_sum_min_basePolytope [DecidableEq α] {f : Finset α → ℝ}
    (hf : IsSubmodular f) (h0 : f ∅ = 0) {m : ℝ} (hm : IsLeast (range f) m) :
    IsGreatest ((fun x : α → ℝ => ∑ i, min (x i) 0) '' basePolytope f) m := by
  sorry

/-- 4.6 The weight of a base of maximum weight, for real weights, is the Lovász extension of the
rank function at the weight. -/
theorem IsMaxWeightBase.weight_eq_lovaszExtension {M : Matroid α} {w : α → ℝ} {B : Set α}
    (hB : IsMaxWeightBase w M B) :
    weight w B = lovaszExtension (fun S : Finset α => ((M.eRk (S : Set α)).toNat : ℝ)) w := by
  sorry

end Lovasz

/-! ## Layer 5: greedy maximization of monotone submodular functions -/

/-- 5.2 The bound of Nemhauser, Wolsey and Fisher. Let `f` be a monotone submodular function on
finite sets and let `s 0 = ∅`, `s 1`, ..., `s l` be built by adding at each step an element whose
addition gives the greatest value of `f`. Then for every set `T` with at most `k` elements,
`f T - f (s l) ≤ (1 - 1/k)^l * (f T - f ∅)`. For `k = 0` the factor is `1`, division by zero
being zero, and the statement is `f ∅ ≤ f (s l)`. -/
theorem sub_le_pow_mul_sub_of_greedy [DecidableEq α] {f : Finset α → ℝ} (hmono : Monotone f)
    (hf : IsSubmodular f) (s : ℕ → Finset α) (h0 : s 0 = ∅) (l : ℕ)
    (hs : ∀ i < l, ∃ x, s (i + 1) = insert x (s i) ∧
      ∀ y, f (insert y (s i)) ≤ f (insert x (s i)))
    {k : ℕ} {T : Finset α} (hT : T.card ≤ k) :
    f T - f (s l) ≤ (1 - 1 / (k : ℝ)) ^ l * (f T - f ∅) := by
  sorry

end TauCetiRoadmap.MatroidOptimization

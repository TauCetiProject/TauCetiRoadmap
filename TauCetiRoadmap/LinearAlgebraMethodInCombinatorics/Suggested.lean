import Mathlib

/-!
# The linear algebra method in combinatorics: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the two definitions
they need; both definitions have real bodies. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not restated.

Set systems are finite families `F : Finset (Finset α)` of subsets of a finite type `α`, whose
cardinality `Fintype.card α` plays the role of `n`. Intersection conditions on distinct members are
stated directly or with Mathlib's `Set.IsIntersectingOf`. Set pairs, biclique decompositions and
sunflowers are indexed families of finite sets in an arbitrary type.
-/

open Finset

namespace TauCetiRoadmap.LinearAlgebraMethodInCombinatorics

variable {α : Type*} [Fintype α] [DecidableEq α]

/-! ## Layer 1: incidence vectors and Gram matrices -/

/-- 1.1 The oddtown theorem modulo a prime. If `p` is prime, no member of a family of subsets of
an `n`-element set has size divisible by `p`, and any two distinct members meet in a number of
elements divisible by `p`, then the family has at most `n` members. For `p = 2` this is the
oddtown theorem. -/
theorem card_le_of_not_dvd_card_of_dvd_card_inter {p : ℕ} (hp : p.Prime)
    (F : Finset (Finset α)) (hsize : ∀ A ∈ F, ¬ p ∣ #A)
    (hinter : ∀ A ∈ F, ∀ B ∈ F, A ≠ B → p ∣ #(A ∩ B)) :
    #F ≤ Fintype.card α := by
  sorry

/-- 1.2 The eventown theorem. A family of subsets of an `n`-element set whose members have even
size and whose distinct members meet in an even number of elements has at most `2 ^ ⌊n / 2⌋`
members. -/
theorem card_le_two_pow_of_even (F : Finset (Finset α)) (hsize : ∀ A ∈ F, Even #A)
    (hinter : ∀ A ∈ F, ∀ B ∈ F, A ≠ B → Even #(A ∩ B)) :
    #F ≤ 2 ^ (Fintype.card α / 2) := by
  sorry

/-- 1.3 Fisher's inequality, nonuniform form. A family of nonempty subsets of an `n`-element set
in which any two distinct members meet in exactly `t` elements, for one `t`, has at most `n`
members. -/
theorem card_le_of_isIntersectingOf_singleton (F : Finset (Finset α)) (t : ℕ)
    (hne : ∀ A ∈ F, A.Nonempty) (h : Set.IsIntersectingOf {t} (F : Set (Finset α))) :
    #F ≤ Fintype.card α := by
  sorry

/-! ## Layer 2: spaces of multilinear functions -/

/-- 2.1 The nonuniform Frankl–Wilson inequality. If any two distinct members of a family of
subsets of an `n`-element set meet in a number of elements belonging to a set `L` of `s`
integers, the family has at most `C(n, 0) + C(n, 1) + ⋯ + C(n, s)` members. -/
theorem card_le_sum_choose_of_isIntersectingOf (F : Finset (Finset α)) (L : Finset ℕ)
    (h : Set.IsIntersectingOf (L : Set ℕ) (F : Set (Finset α))) :
    #F ≤ ∑ i ∈ range (#L + 1), (Fintype.card α).choose i := by
  sorry

/-- 2.2 The theorem of Alon, Babai and Suzuki, with the Ray-Chaudhuri–Wilson theorem as the case
of one size `k ≥ s`. Let `K` be a set of `r` sizes and `L` a set of `s` intersection sizes with
`k > s - r` for every `k ∈ K`. A family of subsets of an `n`-element set whose members have sizes
in `K` and whose distinct members meet in a number of elements in `L` has at most
`C(n, s) + C(n, s - 1) + ⋯ + C(n, s - r + 1)` members, the terms with negative index omitted. -/
theorem card_le_sum_choose_of_card_mem (F : Finset (Finset α)) (K L : Finset ℕ)
    (hK : ∀ A ∈ F, #A ∈ K) (hKL : ∀ k ∈ K, #L < k + #K)
    (h : Set.IsIntersectingOf (L : Set ℕ) (F : Set (Finset α))) :
    #F ≤ ∑ j ∈ Ico (#L + 1 - #K) (#L + 1), (Fintype.card α).choose j := by
  sorry

/-- 2.3 The modular Frankl–Wilson inequality, nonuniform form. Let `p` be prime and `L` a set of
`s` residues modulo `p`. If no member of a family of subsets of an `n`-element set has size in
`L` modulo `p`, and any two distinct members meet in a number of elements in `L` modulo `p`, the
family has at most `C(n, 0) + C(n, 1) + ⋯ + C(n, s)` members. -/
theorem card_le_sum_choose_of_zmod {p : ℕ} [Fact p.Prime] (F : Finset (Finset α))
    (L : Finset (ZMod p)) (hsize : ∀ A ∈ F, ((#A : ℕ) : ZMod p) ∉ L)
    (hinter : ∀ A ∈ F, ∀ B ∈ F, A ≠ B → ((#(A ∩ B) : ℕ) : ZMod p) ∈ L) :
    #F ≤ ∑ i ∈ range (#L + 1), (Fintype.card α).choose i := by
  sorry

/-- 2.4 A forbidden intersection. If `p` is prime and no two distinct members of a family of
`(2p - 1)`-element subsets of an `n`-element set meet in exactly `p - 1` elements, the family has
at most `C(n, 0) + C(n, 1) + ⋯ + C(n, p - 1)` members. -/
theorem card_le_sum_choose_of_inter_ne {p : ℕ} (hp : p.Prime) (F : Finset (Finset α))
    (hsize : ∀ A ∈ F, #A = 2 * p - 1)
    (hinter : ∀ A ∈ F, ∀ B ∈ F, A ≠ B → #(A ∩ B) ≠ p - 1) :
    #F ≤ ∑ i ∈ range p, (Fintype.card α).choose i := by
  sorry

/-! ## Layer 3: two-distance sets -/

/-- 3.1 Blokhuis's bound for two-distance sets. A finite set of points of `ℝⁿ` whose distinct
points are at one of two distances `a` and `b` has at most `C(n + 2, 2) = (n + 1)(n + 2)/2`
points. -/
theorem card_le_choose_of_dist_eq_or_eq {n : ℕ} (P : Finset (EuclideanSpace ℝ (Fin n)))
    (a b : ℝ) (h : ∀ x ∈ P, ∀ y ∈ P, x ≠ y → dist x y = a ∨ dist x y = b) :
    #P ≤ (n + 2).choose 2 := by
  sorry

/-! ## Layer 4: decompositions of the complete graph into bicliques -/

/-- 4.1 A decomposition of the complete graph on `V` into `m` complete bipartite graphs: for each
`k < m` two disjoint sets `X k` and `Y k`, the `k`-th biclique having as edges the pairs with one
end in `X k` and the other in `Y k`, such that every pair of distinct vertices is an edge of
exactly one of the bicliques. -/
def IsBicliqueDecomposition {V : Type*} {m : ℕ} (X Y : Fin m → Finset V) : Prop :=
  (∀ k, Disjoint (X k) (Y k)) ∧
    ∀ u v : V, u ≠ v → ∃! k, (u ∈ X k ∧ v ∈ Y k) ∨ (v ∈ X k ∧ u ∈ Y k)

/-- 4.2 The Graham–Pollak theorem. A decomposition of the complete graph on `n` vertices into `m`
complete bipartite graphs has `m ≥ n - 1`. -/
theorem card_le_of_isBicliqueDecomposition {V : Type*} [Fintype V] {m : ℕ}
    {X Y : Fin m → Finset V} (h : IsBicliqueDecomposition X Y) :
    Fintype.card V ≤ m + 1 := by
  sorry

/-! ## Layer 5: set pairs -/

variable {β : Type*} [DecidableEq β]

/-- 5.1 Bollobás's set-pairs inequality. Let `A i` and `B i`, `i < m`, be finite sets with
`A i` disjoint from `B i` and `A i` meeting `B j` whenever `i ≠ j`. Then
`∑ i, 1 / C(|A i| + |B i|, |A i|) ≤ 1`. -/
theorem sum_inv_choose_le_one {m : ℕ} (A B : Fin m → Finset β)
    (hdisj : ∀ i, Disjoint (A i) (B i)) (hmeet : ∀ i j, i ≠ j → (A i ∩ B j).Nonempty) :
    ∑ i, (((#(A i) + #(B i)).choose #(A i) : ℕ) : ℝ)⁻¹ ≤ 1 := by
  sorry

/-- 5.2 The skew set-pairs theorem. Let `A i` and `B i`, `i < m`, be finite sets with at most `k`
and at most `l` elements, with `A i` disjoint from `B i` and `A i` meeting `B j` whenever `i < j`.
Then `m ≤ C(k + l, k)`. -/
theorem le_choose_of_skew {m k l : ℕ} (A B : Fin m → Finset β) (hA : ∀ i, #(A i) ≤ k)
    (hB : ∀ i, #(B i) ≤ l) (hdisj : ∀ i, Disjoint (A i) (B i))
    (hmeet : ∀ i j, i < j → (A i ∩ B j).Nonempty) :
    m ≤ (k + l).choose k := by
  sorry

/-! ## Layer 6: sunflowers -/

/-- 6.1 A sunflower: a family of finite sets any two distinct members of which have the same
intersection `Y`, its kernel. The kernel may be empty. -/
def IsSunflower (S : Finset (Finset β)) : Prop :=
  ∃ Y : Finset β, ∀ A ∈ S, ∀ B ∈ S, A ≠ B → A ∩ B = Y

/-- 6.2 The sunflower lemma of Erdős and Rado. A family of more than `k! (p - 1) ^ k` finite sets,
each with at most `k` elements, contains a sunflower with `p` members. -/
theorem exists_isSunflower_of_lt_card {k p : ℕ} (F : Finset (Finset β))
    (hsize : ∀ A ∈ F, #A ≤ k) (hcard : k.factorial * (p - 1) ^ k < #F) :
    ∃ S ⊆ F, #S = p ∧ IsSunflower S := by
  sorry

end TauCetiRoadmap.LinearAlgebraMethodInCombinatorics

import Mathlib
import TauCeti.Data.Finset.Inversions

/-!
# Comparison sorting and selection: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

An input of a comparison tree on `n` items is a ranking `σ : Equiv.Perm (Fin n)`, where `σ i` is
the rank of item `i`. A comparator network on `n` wires is a list of pairs of wires and acts on
functions `Fin n → β` into a linear order.
-/

open Finset

namespace TauCetiRoadmap.ComparisonSortingAndSelection

/-! ## Layer 1: comparison trees and counting bounds -/

/-- 1.1 A comparison tree on `n` items with outputs in `α`: a leaf carries an output, and an inner
node compares the items `i` and `j` and continues in `lt` when item `i` is smaller and in `ge`
otherwise. -/
inductive CompTree (n : ℕ) (α : Type*) where
  | leaf (a : α) : CompTree n α
  | node (i j : Fin n) (lt ge : CompTree n α) : CompTree n α

namespace CompTree

variable {n : ℕ} {α : Type*} {β : Type*} [LinearOrder β]

/-- 1.1 The output of a comparison tree on the input `x`. -/
def eval : CompTree n α → (Fin n → β) → α
  | leaf a, _ => a
  | node i j l r, x => if x i < x j then l.eval x else r.eval x

/-- 1.1 The number of comparisons a comparison tree makes on the input `x`. -/
def cost : CompTree n α → (Fin n → β) → ℕ
  | leaf _, _ => 0
  | node i j l r, x => (if x i < x j then l.cost x else r.cost x) + 1

/-- 1.1 The depth of a comparison tree: the largest number of nodes on a branch. -/
def depth : CompTree n α → ℕ
  | leaf _ => 0
  | node _ _ l r => max l.depth r.depth + 1

/-- 1.2 A tree solves the problem `R` on the set `A` of admissible rankings when its output on
every ranking in `A` is related to that ranking by `R`. -/
def Solves (t : CompTree n α) (A : Set (Equiv.Perm (Fin n)))
    (R : Equiv.Perm (Fin n) → α → Prop) : Prop :=
  ∀ σ ∈ A, R σ (t.eval ⇑σ)

/-- 1.3 Kraft's inequality for a comparison tree: over a finite set of rankings on which the tree
takes pairwise different outputs, the numbers `2⁻¹ ^ cost` sum to at most `1`. -/
theorem sum_two_inv_pow_cost_le_one (t : CompTree n α) (A : Finset (Equiv.Perm (Fin n)))
    (hA : Set.InjOn (fun σ : Equiv.Perm (Fin n) => t.eval ⇑σ) A) :
    ∑ σ ∈ A, (2⁻¹ : ℝ) ^ t.cost ⇑σ ≤ 1 := by
  sorry

/-- 1.3 The counting bound. If a tree takes pairwise different outputs on a nonempty finite set
`A` of rankings, it makes at least `⌈log₂ |A|⌉` comparisons on one of them. -/
theorem exists_clog_card_le_cost (t : CompTree n α) (A : Finset (Equiv.Perm (Fin n)))
    (hne : A.Nonempty) (hA : Set.InjOn (fun σ : Equiv.Perm (Fin n) => t.eval ⇑σ) A) :
    ∃ σ ∈ A, Nat.clog 2 A.card ≤ t.cost ⇑σ := by
  sorry

/-- 1.3 The average counting bound. If a tree takes pairwise different outputs on a finite set
`A` of rankings, its total number of comparisons over `A` is at least `|A| log₂ |A|`. -/
theorem card_mul_logb_card_le_sum_cost (t : CompTree n α) (A : Finset (Equiv.Perm (Fin n)))
    (hA : Set.InjOn (fun σ : Equiv.Perm (Fin n) => t.eval ⇑σ) A) :
    (A.card : ℝ) * Real.logb 2 A.card ≤ ∑ σ ∈ A, (t.cost ⇑σ : ℝ) := by
  sorry

end CompTree

/-- 1.2 The number `v` is the comparison complexity of the problem `R` on the admissible rankings
`A`: some tree of depth at most `v` solves it, and every tree that solves it makes at least `v`
comparisons on some admissible ranking. -/
def IsComparisonComplexity {n : ℕ} {α : Type*} (A : Set (Equiv.Perm (Fin n)))
    (R : Equiv.Perm (Fin n) → α → Prop) (v : ℕ) : Prop :=
  (∃ t : CompTree n α, t.Solves A R ∧ t.depth ≤ v) ∧
    ∀ t : CompTree n α, t.Solves A R → ∃ σ ∈ A, v ≤ t.cost ⇑σ

/-! ## Layer 2: sorting and merging -/

section Sorting

variable {n : ℕ}

/-- 2.1 The lower bound for sorting. A comparison tree that outputs the ranking of every input
makes at least `⌈log₂ n!⌉` comparisons on some input. -/
theorem exists_clog_factorial_le_cost (t : CompTree n (Equiv.Perm (Fin n)))
    (ht : t.Solves Set.univ fun σ τ => τ = σ) :
    ∃ σ : Equiv.Perm (Fin n), Nat.clog 2 n.factorial ≤ t.cost ⇑σ := by
  sorry

/-- 2.1 The average lower bound for sorting. A comparison tree that outputs the ranking of every
input makes at least `log₂ n!` comparisons on average over the `n!` rankings. -/
theorem logb_factorial_le_average_cost (t : CompTree n (Equiv.Perm (Fin n)))
    (ht : t.Solves Set.univ fun σ τ => τ = σ) :
    Real.logb 2 n.factorial ≤
      (∑ σ : Equiv.Perm (Fin n), (t.cost ⇑σ : ℝ)) / n.factorial := by
  sorry

/-- 2.2 Sorting by binary insertion: some comparison tree of depth at most
`⌈log₂ 1⌉ + ⌈log₂ 2⌉ + ⋯ + ⌈log₂ n⌉` outputs the ranking of every input. -/
theorem exists_sorting_tree_depth_le (n : ℕ) :
    ∃ t : CompTree n (Equiv.Perm (Fin n)), (t.Solves Set.univ fun σ τ => τ = σ) ∧
      t.depth ≤ ∑ k ∈ range (n + 1), Nat.clog 2 k := by
  sorry

/-- 2.3 The admissible rankings for merging: the first `m` items are in increasing order and so
are the last `k` items. -/
def mergeInputs (m k : ℕ) : Set (Equiv.Perm (Fin (m + k))) :=
  {σ | StrictMonoOn ⇑σ {i | (i : ℕ) < m} ∧ StrictMonoOn ⇑σ {i | m ≤ (i : ℕ)}}

/-- 2.3 The lower bound for merging. A comparison tree that outputs the ranking of every
admissible input makes at least `⌈log₂ C(m + k, m)⌉` comparisons on some admissible input. -/
theorem exists_clog_choose_le_cost (m k : ℕ) (t : CompTree (m + k) (Equiv.Perm (Fin (m + k))))
    (ht : t.Solves (mergeInputs m k) fun σ τ => τ = σ) :
    ∃ σ ∈ mergeInputs m k, Nat.clog 2 ((m + k).choose m) ≤ t.cost ⇑σ := by
  sorry

/-- 2.3 Merging two increasing sequences of the same length `m` has comparison complexity
`2 m - 1` (and `0` when `m = 0`, which is the value of the truncated subtraction). -/
theorem isComparisonComplexity_merge_self (m : ℕ) :
    IsComparisonComplexity (mergeInputs m m) (fun σ τ => τ = σ) (2 * m - 1) := by
  sorry

end Sorting

/-! ## Layer 3: selection -/

section Selection

variable {n : ℕ}

/-- 3.1 Selecting the item of any fixed rank takes `n - 1` comparisons: a tree whose output on
every ranking is the item of rank `k` makes at least `n - 1` comparisons on some ranking. -/
theorem exists_pred_le_cost (k : ℕ) (t : CompTree n (Fin n))
    (ht : t.Solves Set.univ fun σ i => (σ i : ℕ) = k) :
    ∃ σ : Equiv.Perm (Fin n), n - 1 ≤ t.cost ⇑σ := by
  sorry

/-- 3.1 Finding the smallest of `n ≥ 1` items has comparison complexity `n - 1`. -/
theorem isComparisonComplexity_min (hn : 1 ≤ n) :
    IsComparisonComplexity (Set.univ : Set (Equiv.Perm (Fin n)))
      (fun σ (i : Fin n) => (σ i : ℕ) = 0) (n - 1) := by
  sorry

/-- 3.2 Finding the smallest and the largest of `n ≥ 1` items together has comparison complexity
`⌈3 n / 2⌉ - 2`. -/
theorem isComparisonComplexity_min_max (hn : 1 ≤ n) :
    IsComparisonComplexity (Set.univ : Set (Equiv.Perm (Fin n)))
      (fun σ (p : Fin n × Fin n) => (σ p.1 : ℕ) = 0 ∧ (σ p.2 : ℕ) + 1 = n)
      ((3 * n + 1) / 2 - 2) := by
  sorry

/-- 3.3 Finding the second smallest of `n ≥ 2` items has comparison complexity
`n + ⌈log₂ n⌉ - 2`. -/
theorem isComparisonComplexity_second (hn : 2 ≤ n) :
    IsComparisonComplexity (Set.univ : Set (Equiv.Perm (Fin n)))
      (fun σ (i : Fin n) => (σ i : ℕ) = 1) (n + Nat.clog 2 n - 2) := by
  sorry

end Selection

/-! ## Layer 4: comparator networks -/

/-- 4.1 A comparator network on `n` wires: a list of comparators, each a pair of wires. -/
abbrev Network (n : ℕ) : Type := List (Fin n × Fin n)

/-- 4.1 The comparator `p` puts the smaller of the values on the wires `p.1` and `p.2` on the
wire `p.1` and the larger on the wire `p.2`. -/
def comparator {n : ℕ} {β : Type*} [LinearOrder β] (p : Fin n × Fin n) (x : Fin n → β) :
    Fin n → β :=
  fun k => if k = p.1 then min (x p.1) (x p.2) else if k = p.2 then max (x p.1) (x p.2) else x k

namespace Network

variable {n : ℕ} {β : Type*} [LinearOrder β]

/-- 4.1 The output of a network on the input `x`: its comparators act in the order of the list. -/
def apply : Network n → (Fin n → β) → Fin n → β
  | [], x => x
  | p :: c, x => apply c (comparator p x)

/-- 4.1 A network sorts the linear order `β` when all its outputs on inputs from `β` are
monotone. -/
def Sorts (c : Network n) (β : Type*) [LinearOrder β] : Prop :=
  ∀ x : Fin n → β, Monotone (c.apply x)

/-- 4.1 The depth of each wire: a comparator raises the depths of its two wires to one more than
the larger of them. -/
def wireDepth (c : Network n) : Fin n → ℕ :=
  c.foldl (fun d p k => if k = p.1 ∨ k = p.2 then max (d p.1) (d p.2) + 1 else d k) fun _ => 0

/-- 4.1 The depth of a network: the largest depth of a wire. -/
def depth (c : Network n) : ℕ :=
  univ.sup c.wireDepth

/-- 4.1 A network is standard when every comparator puts the smaller value on the wire of
smaller index. -/
def IsStandard (c : Network n) : Prop :=
  ∀ p ∈ c, p.1 < p.2

/-- 5.1 A network is primitive when every comparator joins a wire to the next one. -/
def IsPrimitive (c : Network n) : Prop :=
  ∀ p ∈ c, (p.1 : ℕ) + 1 = p.2

/-- 5.1 The number of comparators of a network that exchange their two values on the input
`x`. -/
def exchanges : Network n → (Fin n → β) → ℕ
  | [], _ => 0
  | p :: c, x => (if x p.2 < x p.1 then 1 else 0) + exchanges c (comparator p x)

/-- 4.2 The zero-one principle. A network that sorts all inputs of zeros and ones sorts all
inputs from every linear order. -/
theorem sorts_of_sorts_bool (c : Network n) (h : c.Sorts Bool) (β : Type*) [LinearOrder β] :
    c.Sorts β := by
  sorry

/-- 4.3 A sorting network on `n` wires has at least `⌈log₂ n!⌉` comparators. -/
theorem clog_factorial_le_length (c : Network n) (h : c.Sorts Bool) :
    Nat.clog 2 n.factorial ≤ c.length := by
  sorry

/-- 4.3 A sorting network on `n` wires has depth at least `⌈log₂ n⌉`. -/
theorem clog_le_depth (c : Network n) (h : c.Sorts Bool) : Nat.clog 2 n ≤ c.depth := by
  sorry

/-- 4.4 Standard form. For every sorting network there is a standard sorting network on the same
wires with at most as many comparators and at most the same depth. -/
theorem exists_isStandard_sorts (c : Network n) (h : c.Sorts Bool) :
    ∃ c' : Network n, c'.IsStandard ∧ c'.Sorts Bool ∧ c'.length ≤ c.length ∧
      c'.depth ≤ c.depth := by
  sorry

/-- 4.5 Batcher's odd-even merge sort. On `2 ^ k` wires there is a standard sorting network of
depth `k (k + 1) / 2` with `(k² - k + 4) 2 ^ (k - 2) - 1` comparators for `k ≥ 2`, with none for
`k = 0` and one for `k = 1`; the first equation says this for all `k` without subtraction in the
exponent. -/
theorem exists_isStandard_sorts_two_pow (k : ℕ) :
    ∃ c : Network (2 ^ k), c.IsStandard ∧ c.Sorts Bool ∧
      (k * (k - 1) + 4) * 2 ^ k = 4 * (c.length + 1) ∧ 2 * c.depth = k * (k + 1) := by
  sorry

/-! ## Layer 5: primitive networks and inversions -/

/-- 5.1 In a primitive network every exchange removes exactly one inversion: the number of
exchanges on the input `x` and the number of inversions of the output add up to the number of
inversions of `x`. -/
theorem IsPrimitive.exchanges_add_card_inversions {c : Network n} (hc : c.IsPrimitive)
    (x : Fin n → β) :
    c.exchanges x + ((univ : Finset (Fin n)).inversions (c.apply x)).card =
      ((univ : Finset (Fin n)).inversions x).card := by
  sorry

/-- 5.1 A primitive sorting network on `n` wires has at least `C(n, 2)` comparators. -/
theorem IsPrimitive.choose_two_le_length {c : Network n} (hc : c.IsPrimitive)
    (h : c.Sorts Bool) : n.choose 2 ≤ c.length := by
  sorry

/-- 5.2 A primitive network is a sorting network as soon as it sorts the decreasing input
`n - 1, …, 1, 0`. -/
theorem IsPrimitive.sorts_iff_monotone_apply_revPerm {c : Network n} (hc : c.IsPrimitive) :
    c.Sorts Bool ↔ Monotone (c.apply ⇑(Fin.revPerm : Equiv.Perm (Fin n))) := by
  sorry

end Network

/-- 5.3 The comparators of round `r` of the odd-even transposition network: the pairs
`(i, i + 1)` with `i` of the parity of `r`. -/
def transpositionRound (n r : ℕ) : Network n :=
  (List.finRange n).filterMap fun i : Fin n =>
    if h : (i : ℕ) + 1 < n ∧ (i : ℕ) % 2 = r % 2 then some (i, ⟨i + 1, h.1⟩) else none

/-- 5.3 The odd-even transposition network on `n` wires: the rounds `0, 1, …, n - 1` in this
order. -/
def oddEvenTransposition (n : ℕ) : Network n :=
  (List.range n).flatMap (transpositionRound n)

/-- 5.3 The odd-even transposition network with `n` rounds sorts every input on `n` wires. -/
theorem oddEvenTransposition_sorts (n : ℕ) (β : Type*) [LinearOrder β] :
    (oddEvenTransposition n).Sorts β := by
  sorry

/-- 5.3 The odd-even transposition network on `n` wires is primitive and has exactly `C(n, 2)`
comparators, the least number a primitive sorting network can have by 5.1. -/
theorem oddEvenTransposition_isPrimitive_and_length (n : ℕ) :
    (oddEvenTransposition n).IsPrimitive ∧ (oddEvenTransposition n).length = n.choose 2 := by
  sorry

end TauCetiRoadmap.ComparisonSortingAndSelection

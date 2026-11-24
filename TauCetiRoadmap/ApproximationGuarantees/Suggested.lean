import Mathlib

/-!
# Approximation guarantees: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions they
need; every definition has a real body. Every headline theorem of the README is statable at the
pins and is stated here: the harmonic bound for greedy sequences of a set system against
fractional covers, half-integrality and persistency for fractional vertex covers, the tree and
matching bounds for tours of a finite pseudometric space, and the two bounds for list schedules.
The remaining statements are the inequalities of the other sections that carry a name in the
README.

Sums over a set of vertices, edges or indices are `finsum`s; the statements that contain one
assume the finiteness that makes it a finite sum, or have a hypothesis that implies it.
-/

namespace TauCetiRoadmap.ApproximationGuarantees

/-! ## Layer 1: covering by sets -/

section SetCover

variable {ι α : Type*}

/-- 1.1 A fractional cover of the set system `S`: nonnegative multipliers `x` on the sets such
that, for every element `e` of a set of the system, the multipliers of the sets containing `e`
sum to at least `1`. -/
def IsFractionalCover [Fintype ι] [DecidableEq α] (S : ι → Finset α) (x : ι → ℝ) : Prop :=
  (∀ j, 0 ≤ x j) ∧ ∀ j, ∀ e ∈ S j, 1 ≤ ∑ i with e ∈ S i, x i

/-- 1.2 The number of elements of `S j` that lie in no set `S i` with `i` in the list `l`. -/
def gain [DecidableEq α] (S : ι → Finset α) (l : List ι) (j : ι) : ℕ :=
  ((S j).filter fun e => ∀ i ∈ l, e ∉ S i).card

/-- 1.2 A greedy sequence for the costs `c`: each entry covers at least one element not covered
by the earlier entries, and its cost per newly covered element is least possible. The comparison
of the two ratios is written without division; it expresses this rule for nonnegative costs. -/
def IsGreedy [DecidableEq α] (c : ι → ℝ) (S : ι → Finset α) (l : List ι) : Prop :=
  ∀ (k : ℕ) (hk : k < l.length), 0 < gain S (l.take k) l[k] ∧
    ∀ j, c l[k] * gain S (l.take k) j ≤ c j * gain S (l.take k) l[k]

/-- 1.2 The harmonic bound (Johnson, Lovász, Chvátal): for nonnegative costs and sets with at
most `d` elements, the cost of a greedy sequence is at most `H_d` times the cost of any
fractional cover. -/
theorem IsGreedy.sum_cost_le_harmonic_mul [Fintype ι] [DecidableEq α] {S : ι → Finset α}
    {c : ι → ℝ} (hc : ∀ j, 0 ≤ c j) {d : ℕ} (hd : ∀ j, (S j).card ≤ d) {l : List ι}
    (hl : IsGreedy c S l) {x : ι → ℝ} (hx : IsFractionalCover S x) :
    (l.map c).sum ≤ (harmonic d : ℝ) * ∑ j, c j * x j := by
  sorry

/-- 1.3 Rounding by frequency (Hochbaum): if every element lies in at most `f` sets, the sets
`i` with `1 ≤ f * x i` cover every element of the system and cost at most `f` times the cost of
the fractional cover `x`. -/
theorem IsFractionalCover.sum_cost_le_mul_of_card_le [Fintype ι] [DecidableEq α]
    {S : ι → Finset α} {c : ι → ℝ} (hc : ∀ j, 0 ≤ c j) {f : ℕ}
    (hf : ∀ e, (Finset.univ.filter fun j => e ∈ S j).card ≤ f) {x : ι → ℝ}
    (hx : IsFractionalCover S x) :
    (∀ j, ∀ e ∈ S j, ∃ i, 1 ≤ f * x i ∧ e ∈ S i) ∧
      ∑ᶠ i ∈ {i | 1 ≤ f * x i}, c i ≤ f * ∑ j, c j * x j := by
  sorry

/-- 1.4 Pricing (Bar-Yehuda and Even): for nonnegative prices `y` on the elements under which
no set is overpaid, the sets that are paid exactly cost at most `f` times the cost of any
fractional cover, where every element lies in at most `f` sets. -/
theorem IsFractionalCover.sum_tight_cost_le_mul [Fintype ι] [DecidableEq α]
    {S : ι → Finset α} {c : ι → ℝ} {f : ℕ}
    (hf : ∀ e, (Finset.univ.filter fun j => e ∈ S j).card ≤ f) {y : α → ℝ} (hy₀ : ∀ e, 0 ≤ y e)
    (hy : ∀ j, ∑ e ∈ S j, y e ≤ c j) {x : ι → ℝ} (hx : IsFractionalCover S x) :
    ∑ᶠ i ∈ {i | ∑ e ∈ S i, y e = c i}, c i ≤ f * ∑ j, c j * x j := by
  sorry

end SetCover

/-! ## Layer 2: vertex covers, matchings and cuts -/

section Graphs

variable {V : Type*}

/-- 2.1 A matching is maximal among the matchings of `G` if and only if its vertices form a
vertex cover of `G`. No finiteness is assumed. -/
theorem maximal_isMatching_iff {G : SimpleGraph V} (M : G.Subgraph) :
    Maximal (fun M : G.Subgraph => M.IsMatching) M ↔ M.IsMatching ∧ G.IsVertexCover M.verts := by
  sorry

/-- 2.1 A matching has at most as many edges as the vertex cover number. No finiteness is
assumed. -/
theorem encard_edgeSet_le_vertexCoverNum {G : SimpleGraph V} {M : G.Subgraph}
    (hM : M.IsMatching) : M.edgeSet.encard ≤ G.vertexCoverNum := by
  sorry

/-- 2.2 The fractional vertex covers of `G`: the nonnegative functions on the vertices whose
values at the two ends of every edge sum to at least `1`. -/
def fractionalVertexCovers (G : SimpleGraph V) : Set (V → ℝ) :=
  {x | (∀ v, 0 ≤ x v) ∧ ∀ u v, G.Adj u v → 1 ≤ x u + x v}

/-- 2.2 Half-integrality (Nemhauser and Trotter): an extreme point of the fractional vertex
covers of a graph takes only the values `0`, `1/2` and `1`. No finiteness is assumed. -/
theorem eq_zero_or_half_or_one_of_mem_extremePoints (G : SimpleGraph V) {x : V → ℝ}
    (hx : x ∈ Set.extremePoints ℝ (fractionalVertexCovers G)) (v : V) :
    x v = 0 ∨ x v = 1 / 2 ∨ x v = 1 := by
  sorry

/-- 2.2 For nonnegative weights on a finite graph, the least weight of a fractional vertex
cover is attained at one with values in `{0, 1/2, 1}`. -/
theorem exists_half_integral_minimizer [Finite V] (G : SimpleGraph V) {w : V → ℝ}
    (hw : ∀ v, 0 ≤ w v) :
    ∃ x ∈ fractionalVertexCovers G, (∀ v, x v = 0 ∨ x v = 1 / 2 ∨ x v = 1) ∧
      ∀ y ∈ fractionalVertexCovers G, ∑ᶠ v, w v * x v ≤ ∑ᶠ v, w v * y v := by
  sorry

/-- 2.3 Persistency (Nemhauser and Trotter): if `x` is a fractional vertex cover of least weight
of a finite graph, some vertex cover of least weight contains every vertex with `x v > 1/2` and
no vertex with `x v < 1/2`. -/
theorem exists_isVertexCover_between [Finite V] (G : SimpleGraph V) (w : V → ℝ) {x : V → ℝ}
    (hx : x ∈ fractionalVertexCovers G)
    (hopt : ∀ y ∈ fractionalVertexCovers G, ∑ᶠ v, w v * x v ≤ ∑ᶠ v, w v * y v) :
    ∃ C : Set V, G.IsVertexCover C ∧
      (∀ D : Set V, G.IsVertexCover D → ∑ᶠ v ∈ C, w v ≤ ∑ᶠ v ∈ D, w v) ∧
      {v | 1 / 2 < x v} ⊆ C ∧ C ⊆ {v | 1 / 2 ≤ x v} := by
  sorry

/-- 2.4 The weight of the cut of `S`: the sum of `c` over the edges of `G` with exactly one end
in `S`. -/
noncomputable def cutWeight (G : SimpleGraph V) (c : Sym2 V → ℝ) (S : Set V) : ℝ :=
  ∑ᶠ e ∈ {e ∈ G.edgeSet | ∃ u ∈ S, ∃ v ∉ S, e = s(u, v)}, c e

open scoped symmDiff in
/-- 2.4 If moving any single vertex to the other side does not increase the weight of the cut
of `S`, the cut has at least half the total weight of the edges. The weights may have either
sign. -/
theorem sum_le_two_mul_cutWeight [Finite V] (G : SimpleGraph V) (c : Sym2 V → ℝ) {S : Set V}
    (hS : ∀ v, cutWeight G c (S ∆ {v}) ≤ cutWeight G c S) :
    ∑ᶠ e ∈ G.edgeSet, c e ≤ 2 * cutWeight G c S := by
  sorry

end Graphs

/-! ## Layer 3: tours and centres in pseudometric spaces -/

section Metric

variable {V : Type*} [PseudoMetricSpace V]

/-- 3.1 The length of the closed route through the points of `l` in order, returning from the
last point to the first. -/
noncomputable def tourLength (l : List V) : ℝ :=
  (List.zipWith dist l (l.rotate 1)).sum

/-- 3.1 The distance between the two ends of an unordered pair. -/
noncomputable def edgeLength (e : Sym2 V) : ℝ :=
  Sym2.lift ⟨fun a b => dist a b, fun a b => dist_comm a b⟩ e

/-- 3.1 The total length of the edges of a graph on the points. -/
noncomputable def graphLength (H : SimpleGraph V) : ℝ :=
  ∑ᶠ e ∈ H.edgeSet, edgeLength e

/-- 3.2 Shortcutting: omitting points from a closed route does not make it longer. -/
theorem tourLength_le_of_sublist {l l' : List V} (h : l'.Sublist l) :
    tourLength l' ≤ tourLength l := by
  sorry

/-- 3.3 Every closed route through all points of a nonempty space is at least as long as some
spanning tree. -/
theorem exists_isTree_graphLength_le_tourLength [Nonempty V] {l : List V} (hl : ∀ v, v ∈ l) :
    ∃ T : SimpleGraph V, T.IsTree ∧ graphLength T ≤ tourLength l := by
  sorry

/-- 3.3 Every closed route through all points is at least twice as long as some perfect matching
of any given set with an even number of points. -/
theorem exists_isMatching_two_mul_graphLength_le_tourLength {l : List V} (hl : ∀ v, v ∈ l)
    {U : Set V} (hU : Even U.ncard) :
    ∃ M : (⊤ : SimpleGraph V).Subgraph, M.IsMatching ∧ M.verts = U ∧
      2 * graphLength M.spanningCoe ≤ tourLength l := by
  sorry

/-- 3.4 Doubling: every spanning tree of a finite pseudometric space has a tour at most twice
as long as the tree. -/
theorem exists_tour_le_two_mul_graphLength [Finite V] {T : SimpleGraph V} (hT : T.IsTree) :
    ∃ l : List V, l.Nodup ∧ (∀ v, v ∈ l) ∧ tourLength l ≤ 2 * graphLength T := by
  sorry

/-- 3.4 Tree plus matching (Christofides, Serdyukov): for a spanning tree `T` and a perfect
matching `M` of its vertices of odd degree there is a tour at most as long as `T` and `M`
together. -/
theorem exists_tour_le_graphLength_add [Finite V] {T : SimpleGraph V} (hT : T.IsTree)
    {M : (⊤ : SimpleGraph V).Subgraph} (hM : M.IsMatching)
    (hodd : M.verts = {v | Odd (T.neighborSet v).ncard}) :
    ∃ l : List V, l.Nodup ∧ (∀ v, v ∈ l) ∧
      tourLength l ≤ graphLength T + graphLength M.spanningCoe := by
  sorry

/-- 3.5 A farthest-first sequence: every entry after the first is a point whose distance to the
set of earlier entries is largest. -/
def IsFarthestFirst (l : List V) : Prop :=
  ∀ (i : ℕ) (hi : i < l.length), 0 < i →
    ∀ x, ∃ c ∈ l.take i, ∀ c' ∈ l.take i, dist x c ≤ dist l[i] c'

/-- 3.5 If at most as many centres as a farthest-first sequence has entries cover the space
with radius `r`, the entries of the sequence cover it with radius `2 * r`. -/
theorem IsFarthestFirst.exists_dist_le_two_mul {l : List V} (hl : IsFarthestFirst l)
    {C : Finset V} (hC : C.card ≤ l.length) {r : ℝ} (hr : ∀ x, ∃ c ∈ C, dist x c ≤ r) (x : V) :
    ∃ c ∈ l, dist x c ≤ 2 * r := by
  sorry

end Metric

/-! ## Layer 4: schedules and packings -/

section Loads

variable {ι κ : Type*}

/-- 4.1 The load of `i` under the assignment `σ`: the sum of `p j` over the `j` assigned to
`i`. -/
def load [Fintype ι] [DecidableEq κ] (p : ι → ℝ) (σ : ι → κ) (i : κ) : ℝ :=
  ∑ j with σ j = i, p j

/-- 4.1 The makespan of an assignment of `n` jobs to `m ≥ 1` machines: the largest load. -/
def makespan {n m : ℕ} [NeZero m] (p : Fin n → ℝ) (σ : Fin n → Fin m) : ℝ :=
  Finset.univ.sup' Finset.univ_nonempty (load p σ)

/-- 4.1 A list schedule: every job is assigned to a machine whose load from the earlier jobs is
least. -/
def IsListSchedule {n m : ℕ} (p : Fin n → ℝ) (σ : Fin n → Fin m) : Prop :=
  ∀ (j : Fin n) (i : Fin m),
    ∑ k with k < j ∧ σ k = σ j, p k ≤ ∑ k with k < j ∧ σ k = i, p k

/-- 4.2 Graham's bound: for nonnegative processing times, the makespan of a list schedule on `m`
machines is at most `2 - 1/m` times the makespan of any assignment. -/
theorem IsListSchedule.makespan_le {n m : ℕ} [NeZero m] {p : Fin n → ℝ} (hp : ∀ j, 0 ≤ p j)
    {σ : Fin n → Fin m} (hσ : IsListSchedule p σ) (τ : Fin n → Fin m) :
    makespan p σ ≤ (2 - 1 / (m : ℝ)) * makespan p τ := by
  sorry

/-- 4.2 Graham's bound for nonincreasing processing times: the makespan of a list schedule is
then at most `4/3 - 1/(3m)` times the makespan of any assignment. -/
theorem IsListSchedule.makespan_le_of_antitone {n m : ℕ} [NeZero m] {p : Fin n → ℝ}
    (hp : ∀ j, 0 ≤ p j) (hanti : Antitone p) {σ : Fin n → Fin m} (hσ : IsListSchedule p σ)
    (τ : Fin n → Fin m) :
    makespan p σ ≤ (4 / 3 - 1 / (3 * (m : ℝ))) * makespan p τ := by
  sorry

/-- 4.3 If a packing of a nonempty family of items into `k` bins of capacity `1` has no two
consecutive bins whose contents fit into one bin, then `k + 1 ≤ 2 * k'` for every packing of the
same items into `k'` bins of capacity `1`. -/
theorem succ_le_two_mul_of_adjacent_load [Fintype ι] [Nonempty ι] (s : ι → ℝ) {k k' : ℕ}
    {f : ι → Fin k} (hf : ∀ b, load s f b ≤ 1)
    (hadj : ∀ b b' : Fin k, (b : ℕ) + 1 = b' → 1 < load s f b + load s f b')
    {g : ι → Fin k'} (hg : ∀ b, load s g b ≤ 1) : k + 1 ≤ 2 * k' := by
  sorry

/-- 4.4 Prefix dominance: for nonnegative values and weights listed in order of nonincreasing
value per unit of weight, a set of items that weighs less than the first `k` items is worth at
most as much as they are. The order is written without division. -/
theorem sum_value_le_sum_prefix {n : ℕ} {v w : Fin n → ℝ} (hv : ∀ i, 0 ≤ v i)
    (hw : ∀ i, 0 ≤ w i) (hsort : ∀ i j, i < j → v j * w i ≤ v i * w j) (k : ℕ)
    {A : Finset (Fin n)} (hA : ∑ i ∈ A, w i < ∑ i with i.val < k, w i) :
    ∑ i ∈ A, v i ≤ ∑ i with i.val < k, v i := by
  sorry

end Loads

end TauCetiRoadmap.ApproximationGuarantees

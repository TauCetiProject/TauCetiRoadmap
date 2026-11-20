import Mathlib

/-!
# Spectral graph bounds: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here. The README's remaining targets, API lists and
Checks are not restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality and decidable
adjacency. Their adjacency eigenvalues are Mathlib's `Matrix.IsHermitian.eigenvalues₀` of the real
adjacency matrix `G.adjMatrix ℝ`, indexed by `Fin (Fintype.card V)` and sorted in nonincreasing
order, so index `0` carries the largest eigenvalue `λ₁` and index `Fintype.card V - 1` the
smallest `λₙ`. Bounds whose classical form divides by an eigenvalue or by a degree are stated
multiplied out, so that they hold also for graphs without edges. Colourings are quantified over
every `k` with `G.Colorable k` rather than through the `ℕ∞`-valued chromatic number, and the
diameter is Mathlib's `SimpleGraph.diam`, which is `0` for a graph that is not connected.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: the adjacency spectrum -/

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

/-- 1.1 The largest adjacency eigenvalue `λ₁` of a graph on a nonempty vertex type. -/
def largestEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  adjEigenvalues G ⟨0, Fintype.card_pos⟩

/-- 1.1 The smallest adjacency eigenvalue `λₙ` of a graph on a nonempty vertex type. -/
def smallestEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  adjEigenvalues G ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩

/-- 1.2 The average degree is at most the largest eigenvalue: `2 |E| ≤ n λ₁`. -/
theorem two_mul_card_edgeFinset_le [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    (2 * #G.edgeFinset : ℝ) ≤ Fintype.card V * largestEigenvalue G := by
  sorry

/-- 1.2 The average degree equals the largest eigenvalue exactly when the graph is regular. -/
theorem card_mul_largestEigenvalue_eq_iff [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    (Fintype.card V : ℝ) * largestEigenvalue G = 2 * #G.edgeFinset ↔
      ∃ d : ℕ, G.IsRegularOfDegree d := by
  sorry

/-- 1.2 The largest eigenvalue is at most the maximum degree. -/
theorem largestEigenvalue_le_maxDegree [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    largestEigenvalue G ≤ G.maxDegree := by
  sorry

/-- 1.3 Every adjacency eigenvalue has absolute value at most the largest one. -/
theorem abs_adjEigenvalues_le [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (i : Fin (Fintype.card V)) :
    |adjEigenvalues G i| ≤ largestEigenvalue G := by
  sorry

/-- 1.3 The largest eigenvalue does not increase when edges are removed. -/
theorem largestEigenvalue_mono [Nonempty V] {G H : SimpleGraph V} [DecidableRel G.Adj]
    [DecidableRel H.Adj] (h : H ≤ G) :
    largestEigenvalue H ≤ largestEigenvalue G := by
  sorry

/-- 1.4 In a `d`-regular graph the eigenvalue `d` occurs exactly as often as there are connected
components. -/
theorem card_adjEigenvalues_eq_degree (G : SimpleGraph V) [DecidableRel G.Adj] {d : ℕ}
    (hd : G.IsRegularOfDegree d) :
    #{i | adjEigenvalues G i = d} = Fintype.card G.ConnectedComponent := by
  sorry

/-! ## Layer 2: colourings -/

/-- 2.1 Wilf's bound: `χ(G) ≤ 1 + ⌊λ₁⌋`. -/
theorem colorable_floor_largestEigenvalue_add_one [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    G.Colorable (⌊largestEigenvalue G⌋₊ + 1) := by
  sorry

/-- 2.2 Hoffman's inequality: if `G` is `k`-colourable with `k ≤ n`, then `λ₁` plus the sum of
the `k - 1` smallest eigenvalues is at most `0`. -/
theorem largestEigenvalue_add_sum_le_zero [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {k : ℕ} (hk : G.Colorable k) (hkn : k ≤ Fintype.card V) :
    largestEigenvalue G +
        ∑ i ∈ univ.filter (fun i : Fin (Fintype.card V) => Fintype.card V < (i : ℕ) + k),
          adjEigenvalues G i ≤ 0 := by
  sorry

/-- 2.2 Hoffman's bound, multiplied out: if `G` is `k`-colourable, then `λ₁ + (k - 1) λₙ ≤ 0`.
For a graph with an edge `λₙ < 0`, and this is `χ(G) ≥ 1 - λ₁ / λₙ`. -/
theorem largestEigenvalue_add_mul_smallestEigenvalue_nonpos [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] {k : ℕ} (hk : G.Colorable k) :
    largestEigenvalue G + ((k : ℝ) - 1) * smallestEigenvalue G ≤ 0 := by
  sorry

/-! ## Layer 3: independent sets -/

/-- 3.1 Cvetković's inertia bound: the independence number is at most the number of
nonnegative eigenvalues. -/
theorem indepNum_le_card_nonneg (G : SimpleGraph V) [DecidableRel G.Adj] :
    G.indepNum ≤ #{i | 0 ≤ adjEigenvalues G i} := by
  sorry

/-- 3.1 Cvetković's inertia bound: the independence number is at most the number of
nonpositive eigenvalues. -/
theorem indepNum_le_card_nonpos (G : SimpleGraph V) [DecidableRel G.Adj] :
    G.indepNum ≤ #{i | adjEigenvalues G i ≤ 0} := by
  sorry

/-- 3.2 Hoffman's ratio bound for a `d`-regular graph, multiplied out:
`α (d - λₙ) ≤ n (-λₙ)`. -/
theorem indepNum_mul_le [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] {d : ℕ}
    (hd : G.IsRegularOfDegree d) :
    (G.indepNum : ℝ) * (d - smallestEigenvalue G) ≤ Fintype.card V * -smallestEigenvalue G := by
  sorry

/-- 3.2 Equality in the ratio bound: if an independent set `S` of a `d`-regular graph attains it,
every vertex outside `S` has exactly `-λₙ` neighbours in `S`. -/
theorem card_neighbor_inter_eq_of_eq [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {d : ℕ} (hd : G.IsRegularOfDegree d) {S : Finset V} (hS : G.IsIndepSet (S : Set V))
    (heq : (#S : ℝ) * (d - smallestEigenvalue G) = Fintype.card V * -smallestEigenvalue G)
    {v : V} (hv : v ∉ S) :
    (#{u ∈ S | G.Adj v u} : ℝ) = -smallestEigenvalue G := by
  sorry

/-! ## Layer 4: edge distribution -/

/-- 4.1 The expander mixing lemma. In a `d`-regular graph on `n` vertices whose eigenvalues other
than the first, by index, have absolute value at most `β`, the number `e(S, T)` of ordered pairs
`(u, v) ∈ S × T` with `u ~ v` satisfies
`|e(S, T) - d |S| |T| / n| ≤ β √(|S| |T| (1 - |S|/n) (1 - |T|/n))`. -/
theorem abs_card_interedges_sub_le (G : SimpleGraph V) [DecidableRel G.Adj] {d : ℕ}
    (hd : G.IsRegularOfDegree d) {β : ℝ}
    (hβ : ∀ i : Fin (Fintype.card V), (i : ℕ) ≠ 0 → |adjEigenvalues G i| ≤ β) (S T : Finset V) :
    |(#(G.interedges S T) : ℝ) - d * #S * #T / Fintype.card V| ≤
      β * Real.sqrt (#S * #T * (1 - #S / Fintype.card V) * (1 - #T / Fintype.card V)) := by
  sorry

/-! ## Layer 5: lower bounds from the diameter -/

/-- 5.1 Quenell's bound. If every vertex has degree at least `k ≥ 3`, `G` has diameter `D` and
`1 ≤ i` with `4 i ≤ D`, then the eigenvalue of index `i` (the `(i + 1)`-st largest) exceeds
`2 √(k - 1) cos (π / (⌊D / (2 i)⌋ + 1))`. -/
theorem lt_adjEigenvalues_of_le_diam (G : SimpleGraph V) [DecidableRel G.Adj] {k : ℕ}
    (hk : 3 ≤ k) (hdeg : ∀ v, k ≤ G.degree v) (i : Fin (Fintype.card V)) (hi : 1 ≤ (i : ℕ))
    (hD : 4 * (i : ℕ) ≤ G.diam) :
    2 * Real.sqrt ((k : ℝ) - 1) * Real.cos (Real.pi / ((G.diam / (2 * (i : ℕ)) : ℕ) + 1)) <
      adjEigenvalues G i := by
  sorry

/-- 5.2 The Alon–Boppana bound. For `d ≥ 3` and `ε > 0`, every `d`-regular graph on enough
vertices has second largest eigenvalue at least `2 √(d - 1) - ε`. -/
theorem alon_boppana {d : ℕ} (hd : 3 ≤ d) {ε : ℝ} (hε : 0 < ε) :
    ∃ N : ℕ, ∀ n, N ≤ n → ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj],
      G.IsRegularOfDegree d → ∀ i : Fin (Fintype.card (Fin n)), (i : ℕ) = 1 →
        2 * Real.sqrt ((d : ℝ) - 1) - ε ≤ adjEigenvalues G i := by
  sorry

end TauCetiRoadmap.SpectralGraphBounds

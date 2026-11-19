import Mathlib

/-!
# Bernoulli bond percolation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining API lists and Checks are not restated.

The lattice `ℤ^d` is `Fin d → ℤ` with the nearest-neighbour graph `latticeGraph d`. A
configuration is the graph of open edges, an element of `SimpleGraph (Fin d → ℤ)` with Mathlib's
σ-algebra on simple graphs, and bond percolation with parameter `p` is the image of Mathlib's
random set `setBer((latticeGraph d).edgeSet, p)` under `SimpleGraph.fromEdgeSet`. Parameters lie
in `unitInterval`. An event is increasing when it is an upper set for the order of simple graphs
(for the inclusion of sets in Layers 2 and 3). The open cluster of `x` is the support of the
connected component of `x`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory unitInterval SimpleGraph

namespace TauCetiRoadmap.BernoulliPercolation

/-! ## Layer 1: the lattice, bond percolation and open clusters -/

/-- 1.1 The nearest-neighbour graph on `ℤ^d`: two points are adjacent when their `ℓ¹` distance
is `1`, that is, when they differ by `±1` in exactly one coordinate. -/
def latticeGraph (d : ℕ) : SimpleGraph (Fin d → ℤ) :=
  SimpleGraph.fromRel fun x y => ∑ i, |x i - y i| = 1

/-- 1.2 Bernoulli bond percolation on `ℤ^d` with parameter `p`: the law of the graph of open
edges when each edge of `latticeGraph d` is open with probability `p`, independently. -/
def bondPercolation (d : ℕ) (p : I) : Measure (SimpleGraph (Fin d → ℤ)) :=
  (setBer((latticeGraph d).edgeSet, p)).map SimpleGraph.fromEdgeSet

/-- 1.3 The percolation probability `θ(p)`: the probability that the open cluster of the origin
is infinite. -/
def percolationProb (d : ℕ) (p : I) : ℝ :=
  (bondPercolation d p).real {G | (G.connectedComponentMk 0).supp.Infinite}

/-- 1.3 The critical probability `p_c(d)`: the supremum of the parameters `p ∈ [0, 1]` with
`θ(p) = 0`. The set contains `0`, so the supremum is a value in `[0, 1]`. -/
def criticalProb (d : ℕ) : ℝ :=
  sSup {x : ℝ | ∃ p : I, (p : ℝ) = x ∧ percolationProb d p = 0}

/-- 1.4 Measurability. On a countable vertex type, the event that the connected component of a
vertex is infinite, and the event that some connected component is infinite, are measurable for
Mathlib's σ-algebra on simple graphs. -/
theorem measurableSet_supp_infinite {V : Type*} [Countable V] (x : V) :
    MeasurableSet {G : SimpleGraph V | (G.connectedComponentMk x).supp.Infinite} ∧
      MeasurableSet {G : SimpleGraph V | ∃ y, (G.connectedComponentMk y).supp.Infinite} := by
  sorry

/-- 1.5 Translation invariance. For every vertex `x`, the probability that the open cluster of
`x` is infinite is `θ(p)`. -/
theorem bondPercolation_real_supp_infinite_eq (d : ℕ) (p : I) (x : Fin d → ℤ) :
    (bondPercolation d p).real {G | (G.connectedComponentMk x).supp.Infinite} =
      percolationProb d p := by
  sorry

/-! ## Layer 2: the monotone coupling -/

/-- 2.1 The monotone coupling. If `(U i)` are independent uniform variables on `[0, 1]`, the
random set of the `i ∈ u` with `U i < p` has law `setBer(u, p)`. -/
theorem map_infinitePi_volume_eq_setBernoulli {ι : Type*} (u : Set ι) (p : I) :
    (Measure.infinitePi fun _ : ι => (volume : Measure I)).map
      (fun U => {i | i ∈ u ∧ U i < p}) = setBer(u, p) := by
  sorry

/-- 2.2 The probability of a measurable increasing family of sets is nondecreasing in the
parameter. -/
theorem setBernoulli_le_of_isUpperSet {ι : Type*} (u : Set ι) {S : Set (Set ι)}
    (hS : MeasurableSet S) (hS' : IsUpperSet S) {p q : I} (hpq : p ≤ q) :
    setBer(u, p) S ≤ setBer(u, q) S := by
  sorry

/-- 2.3 The percolation probability is nondecreasing in `p`. -/
theorem percolationProb_mono (d : ℕ) : Monotone (percolationProb d) := by
  sorry

/-- 2.3 The two phases: `θ(p) = 0` below `p_c(d)` and `θ(p) > 0` above it. -/
theorem percolationProb_phases (d : ℕ) :
    (∀ p : I, (p : ℝ) < criticalProb d → percolationProb d p = 0) ∧
      ∀ p : I, criticalProb d < p → 0 < percolationProb d p := by
  sorry

/-! ## Layer 3: Harris's inequality -/

/-- 3.1 Harris's inequality. On a countable type, under the Bernoulli random subset of `u` with
parameter `p`, two measurable increasing families of sets are positively correlated. -/
theorem setBernoulli_mul_le_of_isUpperSet {ι : Type*} [Countable ι] (u : Set ι) (p : I)
    {S T : Set (Set ι)} (hS : MeasurableSet S) (hT : MeasurableSet T) (hS' : IsUpperSet S)
    (hT' : IsUpperSet T) :
    setBer(u, p) S * setBer(u, p) T ≤ setBer(u, p) (S ∩ T) := by
  sorry

/-! ## Layer 4: the zero–one law for an infinite cluster -/

/-- 4.1 The zero–one law: the probability that some open cluster is infinite is `0` or `1`. -/
theorem bondPercolation_exists_infinite_eq_zero_or_one (d : ℕ) (p : I) :
    bondPercolation d p {G | ∃ x, (G.connectedComponentMk x).supp.Infinite} = 0 ∨
      bondPercolation d p {G | ∃ x, (G.connectedComponentMk x).supp.Infinite} = 1 := by
  sorry

/-- 4.2 Some open cluster is infinite almost surely exactly when `θ(p) > 0`. -/
theorem bondPercolation_exists_infinite_eq_one_iff (d : ℕ) (p : I) :
    bondPercolation d p {G | ∃ x, (G.connectedComponentMk x).supp.Infinite} = 1 ↔
      0 < percolationProb d p := by
  sorry

/-! ## Layer 5: self-avoiding walks and the lower bound -/

/-- 5.1 Counting self-avoiding walks. For `n ≥ 1` there are finitely many paths of length `n`
in `latticeGraph d` starting at `x`, and at most `2d (2d - 1)^(n - 1)` of them. -/
theorem card_isPath_length_le (d n : ℕ) (hn : 1 ≤ n) (x : Fin d → ℤ) :
    Finite {q : Σ y, (latticeGraph d).Walk x y // q.2.IsPath ∧ q.2.length = n} ∧
      Nat.card {q : Σ y, (latticeGraph d).Walk x y // q.2.IsPath ∧ q.2.length = n} ≤
        2 * d * (2 * d - 1) ^ (n - 1) := by
  sorry

/-- 5.1 Counting self-avoiding walks with a prescribed first step: for every `y`, at most
`(2d - 1)^(n - 1)` paths of length `n` start at `x` and have `y` as their second vertex. -/
theorem card_isPath_length_getVert_one_le (d n : ℕ) (x y : Fin d → ℤ) :
    Nat.card {q : Σ z, (latticeGraph d).Walk x z //
      q.2.IsPath ∧ q.2.length = n ∧ q.2.getVert 1 = y} ≤ (2 * d - 1) ^ (n - 1) := by
  sorry

/-- 5.2 No percolation when `(2d - 1) p < 1`. -/
theorem percolationProb_eq_zero_of_mul_lt_one (d : ℕ) (p : I) (h : (2 * (d : ℝ) - 1) * p < 1) :
    percolationProb d p = 0 := by
  sorry

/-- 5.2 The lower bound `1 / (2d - 1) ≤ p_c(d)`. -/
theorem one_div_le_criticalProb (d : ℕ) : 1 / (2 * (d : ℝ) - 1) ≤ criticalProb d := by
  sorry

/-! ## Layer 6: planar duality and the upper bound -/

/-- 6.1 The graph of closed dual edges. A point `u` of `ℤ²` stands for the dual vertex
`u + (1/2, 1/2)`. The dual edge from `u` to `v = u + eᵢ` crosses the primal edge from `v` to
`u + (1, 1)`; it is an edge of `closedDualGraph G` when that primal edge is not an edge of `G`. -/
def closedDualGraph (G : SimpleGraph (Fin 2 → ℤ)) : SimpleGraph (Fin 2 → ℤ) :=
  SimpleGraph.fromRel fun u v => ∃ i : Fin 2, v = u + Pi.single i 1 ∧ ¬ G.Adj v (u + 1)

/-- 6.1 The dual edges crossing the half-line `{(t, 0) : t > 0}`: for `k ≥ 0`, the dual edge from
`(k, -1)` to `(k, 0)` crosses the primal edge from `(k, 0)` to `(k + 1, 0)`. -/
def rayEdges : Set (Sym2 (Fin 2 → ℤ)) :=
  {e | ∃ k : ℕ, e = s(![(k : ℤ), -1], ![(k : ℤ), 0])}

open Classical in
/-- 6.1 A closed walk of dual vertices surrounds the origin when it uses an odd number of the
edges in `rayEdges`, counted with multiplicity. -/
def Surrounds {H : SimpleGraph (Fin 2 → ℤ)} {u : Fin 2 → ℤ} (c : H.Walk u u) : Prop :=
  Odd (c.edges.countP fun e => decide (e ∈ rayEdges))

/-- 6.2 Planar duality. If the open cluster of the origin is finite, some cycle of closed dual
edges surrounds the origin. -/
theorem exists_isCycle_surrounds_of_finite (G : SimpleGraph (Fin 2 → ℤ))
    (h : (G.connectedComponentMk 0).supp.Finite) :
    ∃ u, ∃ c : (closedDualGraph G).Walk u u, c.IsCycle ∧ Surrounds c := by
  sorry

/-- 6.3 Peierls's argument: on `ℤ²`, `θ(p) > 0` for `p > 2/3`. -/
theorem percolationProb_pos_of_two_thirds_lt (p : I) (hp : (2 / 3 : ℝ) < p) :
    0 < percolationProb 2 p := by
  sorry

/-- 6.4 The percolation probability is nondecreasing in the dimension. -/
theorem percolationProb_le_of_le {d d' : ℕ} (h : d ≤ d') (p : I) :
    percolationProb d p ≤ percolationProb d' p := by
  sorry

/-- 6.4 The upper bound `p_c(d) ≤ 2/3` for `d ≥ 2`. -/
theorem criticalProb_le_two_thirds {d : ℕ} (hd : 2 ≤ d) : criticalProb d ≤ 2 / 3 := by
  sorry

end TauCetiRoadmap.BernoulliPercolation

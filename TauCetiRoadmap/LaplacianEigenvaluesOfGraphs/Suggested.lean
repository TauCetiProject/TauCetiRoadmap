import Mathlib

/-!
# Laplacian eigenvalues of graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's routes and Checks are not restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality and decidable
adjacency, and `n = Fintype.card V`. The Laplacian is Mathlib's `G.lapMatrix ℝ`. Its eigenvalues
are Mathlib's `Matrix.IsHermitian.eigenvalues₀`, indexed by `Fin n` and sorted in nonincreasing
order: index `0` carries the largest eigenvalue and index `n - 1` the smallest, which is `0`. The
algebraic connectivity, the second smallest eigenvalue, is the value at index `n - 2`, and `0` by
convention when `n ≤ 1`. Numbers of connected components of induced subgraphs are `Nat.card`s.
The definitions of networks and effective resistance used in 7.1 are copied verbatim from the
roadmap ElectricalNetworksAndRandomWalks, Layers 1 and 2.
-/

noncomputable section

open SimpleGraph Finset Matrix

namespace TauCetiRoadmap.LaplacianEigenvaluesOfGraphs

/-! ## Layer 1: the Laplacian spectrum -/

section Spectrum

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

/-- 1.1 The largest Laplacian eigenvalue of a graph on a nonempty vertex type. -/
def largestLapEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  lapEigenvalues G ⟨0, Fintype.card_pos⟩

/-- 1.1 The algebraic connectivity: the second smallest Laplacian eigenvalue, at index `n - 2`,
and `0` when `n ≤ 1`. -/
def algebraicConnectivity (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  if h : 2 ≤ Fintype.card V then lapEigenvalues G ⟨Fintype.card V - 2, by omega⟩ else 0

/-- 1.2 The eigenvalue `0` occurs exactly as often as there are connected components. -/
theorem card_lapEigenvalues_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj] :
    #{i | lapEigenvalues G i = 0} = Fintype.card G.ConnectedComponent := by
  sorry

/-! ## Layer 2: complements and adding edges -/

/-- 2.1 The Laplacian eigenvalues of the complement: if `i + j + 2 = n`, the eigenvalue of `Gᶜ`
at index `i` is `n` minus the eigenvalue of `G` at index `j`. -/
theorem lapEigenvalues_compl (G : SimpleGraph V) [DecidableRel G.Adj]
    {i j : Fin (Fintype.card V)} (hij : (i : ℕ) + j + 2 = Fintype.card V) :
    lapEigenvalues Gᶜ i = Fintype.card V - lapEigenvalues G j := by
  sorry

/-- 2.2 Adding edges does not lower any Laplacian eigenvalue. -/
theorem lapEigenvalues_le_of_le {G H : SimpleGraph V} [DecidableRel G.Adj] [DecidableRel H.Adj]
    (h : G ≤ H) (i : Fin (Fintype.card V)) :
    lapEigenvalues G i ≤ lapEigenvalues H i := by
  sorry

/-- 2.2 Edge interlacing: if `H` is `G` with `r` edges added and `i + r ≤ k`, the eigenvalue of
`H` at index `k` is at most the eigenvalue of `G` at index `i`. -/
theorem lapEigenvalues_le_of_le_of_add_le {G H : SimpleGraph V} [DecidableRel G.Adj]
    [DecidableRel H.Adj] (h : G ≤ H) {i k : Fin (Fintype.card V)}
    (hik : (i : ℕ) + #(H.edgeFinset \ G.edgeFinset) ≤ k) :
    lapEigenvalues H k ≤ lapEigenvalues G i := by
  sorry

/-! ## Layer 3: algebraic connectivity -/

/-- 3.1 Fiedler's superadditivity: for edge-disjoint graphs on the same vertex type, the
algebraic connectivity of the union is at least the sum of the two. -/
theorem algebraicConnectivity_add_le_sup {G H : SimpleGraph V} [DecidableRel G.Adj]
    [DecidableRel H.Adj] (h : Disjoint G H) :
    algebraicConnectivity G + algebraicConnectivity H ≤ algebraicConnectivity (G ⊔ H) := by
  sorry

/-- 3.2 Fiedler's vertex-cut bound: if deleting the vertices of `D` leaves a graph that is not
connected (or empty), the algebraic connectivity is at most `#D`. -/
theorem algebraicConnectivity_le_card (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V)
    (hD : ¬(G.induce ((D : Set V)ᶜ)).Connected) :
    algebraicConnectivity G ≤ #D := by
  sorry

/-! ## Layer 4: the largest eigenvalue -/

/-- 4.1 The Anderson–Morley bound: a graph with an edge has an edge `xy` with
`largestLapEigenvalue G ≤ deg x + deg y`. -/
theorem exists_adj_largestLapEigenvalue_le [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (hG : G ≠ ⊥) :
    ∃ x y, G.Adj x y ∧ largestLapEigenvalue G ≤ G.degree x + G.degree y := by
  sorry

/-- 4.2 Grone and Merris: a graph with an edge has `Δ + 1 ≤ largestLapEigenvalue G`. -/
theorem maxDegree_add_one_le [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (hG : G ≠ ⊥) :
    (G.maxDegree : ℝ) + 1 ≤ largestLapEigenvalue G := by
  sorry

/-! ## Layer 5: degrees -/

/-- 5.1 Grone's degree bound, in the form of the second proof of Brouwer–Haemers: for a set `Z`
of vertices, the number `h` of components of the subgraph induced on `Z` that are joined by an
edge to a vertex outside `Z`, plus the sum of the degrees of the vertices of `Z`, is at most the
sum of the `#Z` largest Laplacian eigenvalues. -/
theorem card_add_sum_degree_le (G : SimpleGraph V) [DecidableRel G.Adj] (Z : Finset V) :
    (Nat.card {c : (G.induce (Z : Set V)).ConnectedComponent //
        ∃ v : (Z : Set V), (G.induce (Z : Set V)).connectedComponentMk v = c ∧
          ∃ w, w ∉ Z ∧ G.Adj v w} : ℝ) + ∑ z ∈ Z, (G.degree z : ℝ) ≤
      ∑ i ∈ univ.filter (fun i : Fin (Fintype.card V) => (i : ℕ) < #Z), lapEigenvalues G i := by
  sorry

/-! ## Layer 6: nodal domains -/

/-- 6.1 Fiedler's nodal domain theorem: if `L ψ = θ ψ` with `θ > 0` and `t ≤ 0`, the subgraph
induced on `{v | t ≤ ψ v}` has at most as many components as there are eigenvalues below `θ`. -/
theorem card_connectedComponent_induce_le (G : SimpleGraph V) [DecidableRel G.Adj]
    {ψ : V → ℝ} {θ : ℝ} (hψ : G.lapMatrix ℝ *ᵥ ψ = θ • ψ) (hθ : 0 < θ) {t : ℝ} (ht : t ≤ 0) :
    Nat.card (G.induce {v | t ≤ ψ v}).ConnectedComponent ≤ #{i | lapEigenvalues G i < θ} := by
  sorry

/-- 6.2 The strong nodal domain theorem: if `L ψ = θ ψ`, the components of the subgraphs
induced on `{ψ > 0}` and on `{ψ < 0}` number at most the eigenvalues `≤ θ`. -/
theorem card_strongNodalDomains_le (G : SimpleGraph V) [DecidableRel G.Adj] {ψ : V → ℝ} {θ : ℝ}
    (hψ : G.lapMatrix ℝ *ᵥ ψ = θ • ψ) :
    Nat.card (G.induce {v | 0 < ψ v}).ConnectedComponent +
        Nat.card (G.induce {v | ψ v < 0}).ConnectedComponent ≤
      #{i | lapEigenvalues G i ≤ θ} := by
  sorry

/-- 6.3 A weak nodal domain of `ψ`: a set of vertices maximal among those that induce a connected
subgraph and on which `ψ` takes no two values of opposite strict signs. -/
def IsWeakNodalDomain (G : SimpleGraph V) (ψ : V → ℝ) (D : Set V) : Prop :=
  Maximal (fun D : Set V => (G.induce D).Connected ∧ ∀ x ∈ D, ∀ y ∈ D, 0 ≤ ψ x * ψ y) D

/-- 6.3 The weak nodal domain theorem: on a connected graph, if `L ψ = θ ψ`, the number of weak
nodal domains of `ψ` is at most one more than the number of eigenvalues below `θ`. -/
theorem ncard_weakNodalDomains_le (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Connected)
    {ψ : V → ℝ} {θ : ℝ} (hψ : G.lapMatrix ℝ *ᵥ ψ = θ • ψ) :
    {D | IsWeakNodalDomain G ψ D}.ncard ≤ #{i | lapEigenvalues G i < θ} + 1 := by
  sorry

end Spectrum

/-! ## Layer 7: the Kirchhoff index -/

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) A network on `V`: a
symmetric nonnegative conductance function. Loops `cond x x` are allowed; a pair `x ≠ y` with
`cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The weight
`c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

variable [DecidableEq V]

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian
`diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian with the row
and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The voltage of the unit
current from `a` to `z`, grounded at `z`: the column of `a` of the inverse of the grounded
Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 7.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The effective resistance
`R(a ↔ z)`: the voltage at `a` of the unit current from `a` to `z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

end Network

section Kirchhoff

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 7.1 The network of a simple graph with unit conductances: `c(x, y) = 1` when `x ~ y` and
`0` otherwise. -/
def unitNetwork (G : SimpleGraph V) [DecidableRel G.Adj] : Network V where
  cond x y := if G.Adj x y then 1 else 0
  symm x y := by simp only [G.adj_comm]
  nonneg x y := by split_ifs <;> norm_num

/-- 7.1 The Kirchhoff index: on a connected graph, the sum of the effective resistances over
all ordered pairs of vertices is `2 n` times the sum of the reciprocals of the nonzero Laplacian
eigenvalues, which sit at the indices `i` with `i + 1 < n`. -/
theorem sum_effResistance_eq (G : SimpleGraph V) [DecidableRel G.Adj] (hG : G.Connected) :
    ∑ a, ∑ z, (unitNetwork G).effResistance a z =
      2 * Fintype.card V *
        ∑ i ∈ univ.filter (fun i : Fin (Fintype.card V) => (i : ℕ) + 1 < Fintype.card V),
          (lapEigenvalues G i)⁻¹ := by
  sorry

end Kirchhoff

/-! ## Layer 8: the dual Cheeger inequality -/

section DualCheeger

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 8.1 The bottom `σ(G)` of the signless Rayleigh quotient: the infimum of
`xᵀ (D + A) x / xᵀ D x` over the real vectors with `xᵀ D x > 0`, where `D` is the degree matrix
and `A` the adjacency matrix; `0` for a graph without edges, where no such vector exists. -/
def signlessBottom (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  ⨅ x : {x : V → ℝ // 0 < x ⬝ᵥ (G.degMatrix ℝ *ᵥ x)},
    (x : V → ℝ) ⬝ᵥ ((G.degMatrix ℝ + G.adjMatrix ℝ) *ᵥ (x : V → ℝ)) /
      (x : V → ℝ) ⬝ᵥ (G.degMatrix ℝ *ᵥ (x : V → ℝ))

/-- 8.1 The bipartiteness ratio `β(G)`: the infimum, over the vectors `y` with entries in
`{-1, 0, 1}` and `∑ v, deg v |y v| > 0`, of `∑_{uv ∈ E} |y u + y v| / ∑ v, deg v |y v|`; the sum
over edges is half the sum over ordered adjacent pairs. It is `0` for a graph without edges. -/
def bipartitenessRatio (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  ⨅ y : {y : V → ℝ // (∀ v, y v = -1 ∨ y v = 0 ∨ y v = 1) ∧ 0 < ∑ v, (G.degree v : ℝ) * |y v|},
    (∑ u, ∑ v, if G.Adj u v then |(y : V → ℝ) u + (y : V → ℝ) v| else 0) /
      (2 * ∑ v, (G.degree v : ℝ) * |(y : V → ℝ) v|)

/-- 8.2 The dual Cheeger inequality, in signless form: `σ(G) / 2 ≤ β(G) ≤ √(2 σ(G))`. -/
theorem signlessBottom_div_two_le_bipartitenessRatio (G : SimpleGraph V) [DecidableRel G.Adj] :
    signlessBottom G / 2 ≤ bipartitenessRatio G ∧
      bipartitenessRatio G ≤ Real.sqrt (2 * signlessBottom G) := by
  sorry

end DualCheeger

/-! ## Layer 9: the Grone–Merris inequality -/

section GroneMerris

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 9.1 The Grone–Merris inequality (Bai's theorem): for every `t`, the sum of the `t` largest
Laplacian eigenvalues is at most `∑_{j=1}^{t} #{x | j ≤ deg x}`, the sum of the first `t` terms
of the conjugate of the degree sequence. -/
theorem sum_lapEigenvalues_le_sum_card_le_degree (G : SimpleGraph V) [DecidableRel G.Adj]
    (t : ℕ) :
    ∑ i ∈ univ.filter (fun i : Fin (Fintype.card V) => (i : ℕ) < t), lapEigenvalues G i ≤
      ∑ j ∈ Icc 1 t, (#{x | j ≤ G.degree x} : ℝ) := by
  sorry

end GroneMerris

end TauCetiRoadmap.LaplacianEigenvaluesOfGraphs

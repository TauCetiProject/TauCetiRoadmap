import Mathlib
import TauCeti.Combinatorics.SimpleGraph.Connectivity.VertexConnectivity

/-!
# Hamiltonian cycles: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here; the existence of a spanning path in a tournament is
the positivity of the count in Rédei's parity theorem and is not stated separately. The README's
remaining targets, API lists and Checks are not restated.

Undirected graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality, and
Hamiltonicity is Mathlib's `SimpleGraph.IsHamiltonian`, under which the graph on one vertex is
Hamiltonian and graphs on zero or two vertices are not. Degrees are `SimpleGraph.degree`, and every
degree condition is written without natural-number subtraction or division. Vertex connectivity is
Tau Ceti's `SimpleGraph.vertexConnectivity`, valued in `ℕ∞`. Tournaments are Mathlib digraphs
with exactly one arc between any two distinct vertices; their spanning paths are lists of vertices
and their spanning cycles are cyclic permutations.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.HamiltonianCycles

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: necessary conditions -/

/-- 1.1 Hamiltonian graphs are 1-tough: deleting a nonempty set `S` of vertices from a Hamiltonian
graph leaves at most `#S` connected components. -/
theorem card_connectedComponent_induce_compl_le_of_isHamiltonian {G : SimpleGraph V}
    (hG : G.IsHamiltonian) {S : Finset V} (hS : S.Nonempty) :
    Nat.card (G.induce ((S : Set V)ᶜ)).ConnectedComponent ≤ #S := by
  sorry

omit [Fintype V] in
/-- 1.1 Deleting any set `S` of vertices from a graph with a Hamiltonian path leaves at most
`#S + 1` connected components. -/
theorem card_connectedComponent_induce_compl_le_of_isHamiltonian_walk {G : SimpleGraph V}
    {a b : V} {p : G.Walk a b} (hp : p.IsHamiltonian) (S : Finset V) :
    Nat.card (G.induce ((S : Set V)ᶜ)).ConnectedComponent ≤ #S + 1 := by
  sorry

/-! ## Layer 2: the Bondy–Chvátal closure -/

/-- 2.1 The Bondy–Chvátal lemma. If `u` and `v` are distinct nonadjacent vertices whose degrees sum
to at least the number of vertices, then `G` is Hamiltonian if and only if `G` with the edge `uv`
added is. -/
theorem isHamiltonian_sup_edge_iff {G : SimpleGraph V} [DecidableRel G.Adj] {u v : V}
    (huv : u ≠ v) (hadj : ¬G.Adj u v) (hdeg : Fintype.card V ≤ G.degree u + G.degree v) :
    (G ⊔ edge u v).IsHamiltonian ↔ G.IsHamiltonian := by
  sorry

open Classical in
/-- 2.2 A graph is degree-closed when any two distinct nonadjacent vertices have degree sum less
than the number of vertices. -/
def IsDegreeClosed (H : SimpleGraph V) : Prop :=
  ∀ u v, u ≠ v → ¬H.Adj u v → H.degree u + H.degree v < Fintype.card V

/-- 2.2 The Bondy–Chvátal closure of `G`: the intersection of all degree-closed graphs containing
`G`. The complete graph is one of them, so the family is nonempty. -/
def degreeClosure (G : SimpleGraph V) : SimpleGraph V :=
  sInf {H | G ≤ H ∧ IsDegreeClosed H}

omit [DecidableEq V] in
/-- 2.2 The closure is well defined: it is itself degree-closed, so it is the least degree-closed
graph containing `G`. -/
theorem isLeast_degreeClosure (G : SimpleGraph V) :
    IsLeast {H | G ≤ H ∧ IsDegreeClosed H} (degreeClosure G) := by
  sorry

open Classical in
/-- 2.2 The closure does not depend on the order of the additions. A graph `H` is the closure of
`G` if and only if it is degree-closed and is reached from `G` by adding edges one at a time, each
between two distinct nonadjacent vertices whose degrees in the graph reached before it sum to at
least the number of vertices. -/
theorem eq_degreeClosure_iff_reflTransGen (G H : SimpleGraph V) :
    H = degreeClosure G ↔ IsDegreeClosed H ∧ Relation.ReflTransGen
      (fun K K' : SimpleGraph V ↦ ∃ u v, u ≠ v ∧ ¬K.Adj u v ∧
        Fintype.card V ≤ K.degree u + K.degree v ∧ K' = K ⊔ edge u v) G H := by
  sorry

/-- 2.3 A graph is Hamiltonian if and only if its Bondy–Chvátal closure is. -/
theorem isHamiltonian_degreeClosure_iff (G : SimpleGraph V) :
    (degreeClosure G).IsHamiltonian ↔ G.IsHamiltonian := by
  sorry

/-! ## Layer 3: degree conditions -/

section Degrees

variable {G : SimpleGraph V} [DecidableRel G.Adj]

/-- 3.1 Ore's theorem. A graph on at least three vertices in which any two distinct nonadjacent
vertices have degree sum at least the number of vertices is Hamiltonian. -/
theorem isHamiltonian_of_ore (hn : 3 ≤ Fintype.card V)
    (h : ∀ u v, u ≠ v → ¬G.Adj u v → Fintype.card V ≤ G.degree u + G.degree v) :
    G.IsHamiltonian := by
  sorry

/-- 3.1 Dirac's theorem. A graph on `n ≥ 3` vertices in which every vertex has degree at least
`n / 2` is Hamiltonian; the bound is written `n ≤ 2 * deg v`. -/
theorem isHamiltonian_of_dirac (hn : 3 ≤ Fintype.card V)
    (h : ∀ v, Fintype.card V ≤ 2 * G.degree v) : G.IsHamiltonian := by
  sorry

/-- 3.2 A graph on a nonempty vertex type in which any two distinct nonadjacent vertices have
degree sum at least the number of vertices minus one has a Hamiltonian path. -/
theorem exists_isHamiltonian_walk_of_ore [Nonempty V]
    (h : ∀ u v, u ≠ v → ¬G.Adj u v → Fintype.card V ≤ G.degree u + G.degree v + 1) :
    ∃ (a b : V) (p : G.Walk a b), p.IsHamiltonian := by
  sorry

end Degrees

/-- 3.3 Chvátal's condition on a function `d : V → ℕ`, in counting form: for every `i ≥ 1` with
`2 * i < n`, if at least `i` vertices have `d ≤ i`, then at least `i + 1` vertices have
`d ≥ n - i` (written `n ≤ d v + i`). For a nondecreasing listing `d₁ ≤ ⋯ ≤ dₙ` of the values this
says `dᵢ ≤ i → dₙ₋ᵢ ≥ n - i`. -/
def ChvatalCondition (d : V → ℕ) : Prop :=
  ∀ i : ℕ, 1 ≤ i → 2 * i < Fintype.card V →
    i ≤ #{v | d v ≤ i} → i + 1 ≤ #{v | Fintype.card V ≤ d v + i}

/-- 3.3 Chvátal's theorem. A graph on at least three vertices whose degrees satisfy Chvátal's
condition is Hamiltonian. -/
theorem isHamiltonian_of_chvatalCondition {G : SimpleGraph V} [DecidableRel G.Adj]
    (hn : 3 ≤ Fintype.card V) (h : ChvatalCondition fun v ↦ G.degree v) : G.IsHamiltonian := by
  sorry

/-- 3.4 Chvátal's extremal graph `C(m, n)` on `Fin n`: the vertices below `m` form an independent
set, the vertices from `m` on are pairwise adjacent, and the top `m` vertices are adjacent to every
other vertex. When `2 * m < n` it is the join of `K_m` with the disjoint union of `m` isolated
vertices and `K_(n - 2m)`. -/
def chvatalGraph (m n : ℕ) : SimpleGraph (Fin n) :=
  SimpleGraph.fromRel fun i j ↦ n ≤ (i : ℕ) + m ∨ (m ≤ (i : ℕ) ∧ m ≤ (j : ℕ))

/-- 3.4 The adjacency of `chvatalGraph m n` is decidable. -/
instance (m n : ℕ) : DecidableRel (chvatalGraph m n).Adj := fun i j ↦
  inferInstanceAs (Decidable (i ≠ j ∧ ((n ≤ (i : ℕ) + m ∨ (m ≤ (i : ℕ) ∧ m ≤ (j : ℕ))) ∨
    (n ≤ (j : ℕ) + m ∨ (m ≤ (j : ℕ) ∧ m ≤ (i : ℕ))))))

/-- 3.4 For `1 ≤ m` and `2 * m < n`, Chvátal's graph `C(m, n)` is not Hamiltonian. -/
theorem not_isHamiltonian_chvatalGraph {m n : ℕ} (hm : 1 ≤ m) (hmn : 2 * m < n) :
    ¬(chvatalGraph m n).IsHamiltonian := by
  sorry

/-- 3.4 Chvátal's theorem that his condition is best possible. Every non-Hamiltonian graph on
`n ≥ 3` vertices is degree-majorised by some `C(m, n)` with `1 ≤ m` and `2 * m < n`: some bijection
between the vertices sends each vertex to one of at least its degree. -/
theorem exists_chvatalGraph_degree_majorizes {G : SimpleGraph V} [DecidableRel G.Adj]
    (hn : 3 ≤ Fintype.card V) (hG : ¬G.IsHamiltonian) :
    ∃ m, 1 ≤ m ∧ 2 * m < Fintype.card V ∧ ∃ e : V ≃ Fin (Fintype.card V),
      ∀ v, G.degree v ≤ (chvatalGraph m (Fintype.card V)).degree (e v) := by
  sorry

section EdgeCount

variable {G : SimpleGraph V} [DecidableRel G.Adj]

/-- 3.5 The theorem of Ore and Bondy on edge counts. A graph on `n ≥ 3` vertices with at least
`binom(n - 1, 2) + 2` edges is Hamiltonian. -/
theorem isHamiltonian_of_choose_add_two_le_card_edgeFinset (hn : 3 ≤ Fintype.card V)
    (h : (Fintype.card V - 1).choose 2 + 2 ≤ #G.edgeFinset) : G.IsHamiltonian := by
  sorry

/-- 3.5 The non-Hamiltonian graphs on `n ≥ 3` vertices with exactly `binom(n - 1, 2) + 1` edges are,
up to isomorphism, `C(1, n)` and, when `n = 5`, `C(2, 5)`. -/
theorem not_isHamiltonian_iff_of_card_edgeFinset_eq (hn : 3 ≤ Fintype.card V)
    (h : #G.edgeFinset = (Fintype.card V - 1).choose 2 + 1) :
    ¬G.IsHamiltonian ↔ Nonempty (G ≃g chvatalGraph 1 (Fintype.card V)) ∨
      (Fintype.card V = 5 ∧ Nonempty (G ≃g chvatalGraph 2 5)) := by
  sorry

end EdgeCount

/-! ## Layer 4: connectivity and independence -/

/-- 4.1 The Chvátal–Erdős theorem. A graph on at least three vertices whose independence number is
at most its vertex connectivity is Hamiltonian. -/
theorem isHamiltonian_of_indepNum_le_vertexConnectivity {G : SimpleGraph V}
    (hn : 3 ≤ Fintype.card V) (h : (G.indepNum : ℕ∞) ≤ G.vertexConnectivity) :
    G.IsHamiltonian := by
  sorry

/-- 4.1 A graph on a nonempty vertex type whose independence number is at most its vertex
connectivity plus one has a Hamiltonian path. -/
theorem exists_isHamiltonian_walk_of_indepNum_le [Nonempty V] {G : SimpleGraph V}
    (h : (G.indepNum : ℕ∞) ≤ G.vertexConnectivity + 1) :
    ∃ (a b : V) (p : G.Walk a b), p.IsHamiltonian := by
  sorry

/-! ## Layer 5: tournaments -/

section Tournaments

variable {W : Type*}

/-- 5.1 A tournament: a digraph with exactly one arc between any two distinct vertices, and hence
no loops. -/
def IsTournament (T : Digraph W) : Prop :=
  (∀ u v, T.Adj u v → ¬T.Adj v u) ∧ ∀ u v, u ≠ v → T.Adj u v ∨ T.Adj v u

/-- 5.1 A spanning path of a digraph: a list of vertices without repetition that contains every
vertex and in which each vertex has an arc to the next. -/
def IsSpanningPath (D : Digraph W) (l : List W) : Prop :=
  l.Nodup ∧ (∀ v, v ∈ l) ∧ l.IsChain D.Adj

/-- 5.1 A spanning cycle of a digraph: a cyclic permutation `σ` that moves every vertex and has an
arc from each vertex `v` to `σ v`. -/
def IsSpanningCycle (D : Digraph W) (σ : Equiv.Perm W) : Prop :=
  σ.IsCycle ∧ ∀ v, σ v ≠ v ∧ D.Adj v (σ v)

/-- 5.2 Rédei's theorem. Every tournament on a finite vertex type has an odd number of spanning
paths; in particular it has one. -/
theorem IsTournament.odd_card_isSpanningPath [Fintype W] {T : Digraph W}
    (hT : IsTournament T) : Odd (Nat.card {l : List W // IsSpanningPath T l}) := by
  sorry

/-- 5.3 Camion's theorem. A tournament on a finite vertex type with at least two vertices has a
spanning cycle if and only if it is strongly connected. -/
theorem IsTournament.exists_isSpanningCycle_iff [Fintype W] [Nontrivial W] {T : Digraph W}
    (hT : IsTournament T) :
    (∃ σ, IsSpanningCycle T σ) ↔ ∀ u v, Relation.ReflTransGen T.Adj u v := by
  sorry

end Tournaments

end TauCetiRoadmap.HamiltonianCycles

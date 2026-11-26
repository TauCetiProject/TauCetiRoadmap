import Mathlib

/-!
# Matching theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

Graphs are Mathlib's `SimpleGraph V`, matchings are subgraphs `M : G.Subgraph` with
`M.IsMatching`, and the size of a matching is the cardinality `M.edgeSet.encard` of its edge set
in `ℕ∞`. The matching number and the edge cover number are valued in `ℕ∞`, like Mathlib's
`SimpleGraph.vertexCoverNum`, so they have their intended values on every vertex type; the
theorems that need a finite vertex type assume `[Finite V]`. The odd components left by deleting a
set `U` of vertices are counted exactly as in Mathlib's `SimpleGraph.IsTutteViolator`.
-/

noncomputable section

open SimpleGraph

namespace TauCetiRoadmap.MatchingTheory

variable {V : Type*}

/-! ## Layer 1: the matching number and Gallai's identities -/

/-- 1.1 The matching number `ν(G)`: the supremum in `ℕ∞` of the sizes of the matchings of `G`. -/
def matchingNumber (G : SimpleGraph V) : ℕ∞ :=
  ⨆ (M : G.Subgraph) (_ : M.IsMatching), M.edgeSet.encard

/-- 1.1 A maximum matching: a matching with at least as many edges as every matching of `G`. -/
def IsMaximumMatching {G : SimpleGraph V} (M : G.Subgraph) : Prop :=
  M.IsMatching ∧ ∀ M' : G.Subgraph, M'.IsMatching → M'.edgeSet.encard ≤ M.edgeSet.encard

/-- 1.1 The edge cover number `ρ(G)`: the infimum in `ℕ∞` of the sizes of the sets of edges of `G`
that meet every vertex. It is `⊤` when `G` has an isolated vertex, since then there is no such
set. -/
def edgeCoverNum (G : SimpleGraph V) : ℕ∞ :=
  ⨅ (F : Set (Sym2 V)) (_ : F ⊆ G.edgeSet ∧ ∀ v, ∃ e ∈ F, v ∈ e), F.encard

/-- 1.2 Gallai's identity `ν(G) + ρ(G) = |V|` for a graph without isolated vertices. -/
theorem matchingNumber_add_edgeCoverNum (G : SimpleGraph V) (h : ∀ v, ∃ w, G.Adj v w) :
    matchingNumber G + edgeCoverNum G = ENat.card V := by
  sorry

/-! ## Layer 2: augmenting paths -/

/-- 2.1 An `M`-augmenting path: a path between two distinct vertices that `M` leaves unmatched,
whose edges lie alternately outside and inside `M`, the first one outside. -/
def IsAugmentingPath {G : SimpleGraph V} (M : G.Subgraph) {u v : V} (p : G.Walk u v) : Prop :=
  p.IsPath ∧ u ≠ v ∧ u ∉ M.verts ∧ v ∉ M.verts ∧
    ∀ (i : ℕ) (hi : i < p.edges.length), (p.edges[i] ∈ M.edgeSet ↔ Odd i)

/-- 2.2 Berge's theorem. A matching of a finite graph is a maximum matching if and only if there
is no augmenting path for it. -/
theorem isMaximumMatching_iff_forall_not_isAugmentingPath [Finite V] {G : SimpleGraph V}
    {M : G.Subgraph} (hM : M.IsMatching) :
    IsMaximumMatching M ↔ ∀ (u v : V) (p : G.Walk u v), ¬IsAugmentingPath M p := by
  sorry

/-! ## Layer 3: the Tutte–Berge formula -/

/-- 3.1 The number `o(G − U)` of connected components of odd size of the graph left by deleting the
vertices of `U`, written as in Mathlib's `SimpleGraph.IsTutteViolator`. -/
def numOddComponents (G : SimpleGraph V) (U : Set V) : ℕ :=
  ((⊤ : G.Subgraph).deleteVerts U).coe.oddComponents.ncard

/-- 3.1 The easy half of the Tutte–Berge formula: `2ν(G) + o(G − U) ≤ |V| + |U|` for every set
`U` of vertices of a finite graph. -/
theorem two_mul_matchingNumber_add_numOddComponents_le [Finite V] (G : SimpleGraph V)
    (U : Set V) :
    2 * matchingNumber G + (numOddComponents G U : ℕ∞) ≤ (Nat.card V : ℕ∞) + (U.ncard : ℕ∞) := by
  sorry

/-- 3.2 The Tutte–Berge formula: some set `U` of vertices of a finite graph attains equality in
3.1, so `ν(G) = min_U (|V| + |U| − o(G − U)) / 2`. -/
theorem exists_two_mul_matchingNumber_add_numOddComponents_eq [Finite V] (G : SimpleGraph V) :
    ∃ U : Set V,
      2 * matchingNumber G + (numOddComponents G U : ℕ∞) = (Nat.card V : ℕ∞) + (U.ncard : ℕ∞) := by
  sorry

/-! ## Layer 4: factor-critical graphs and the Gallai–Edmonds structure theorem -/

/-- 4.1 A set `S` of vertices is factor-critical in `G` if it is nonempty and, for each `v ∈ S`,
some matching of `G` has vertex set exactly `S \ {v}`; for `S = Set.univ` this says that `G` is
factor-critical. -/
def IsFactorCriticalOn (G : SimpleGraph V) (S : Set V) : Prop :=
  S.Nonempty ∧ ∀ v ∈ S, ∃ M : G.Subgraph, M.IsMatching ∧ M.verts = S \ {v}

/-- 4.2 Gallai's lemma and its converse. A finite graph is factor-critical if and only if it is
connected and each vertex is missed by some maximum matching. -/
theorem isFactorCriticalOn_univ_iff [Finite V] (G : SimpleGraph V) :
    IsFactorCriticalOn G Set.univ ↔
      G.Connected ∧ ∀ v, ∃ M : G.Subgraph, IsMaximumMatching M ∧ v ∉ M.verts := by
  sorry

/-- 4.3 The set `D(G)` of the vertices missed by some maximum matching. -/
def gallaiEdmondsD (G : SimpleGraph V) : Set V :=
  {v | ∃ M : G.Subgraph, IsMaximumMatching M ∧ v ∉ M.verts}

/-- 4.3 The set `A(G)` of the vertices outside `D(G)` with a neighbour in `D(G)`. -/
def gallaiEdmondsA (G : SimpleGraph V) : Set V :=
  {v | v ∉ gallaiEdmondsD G ∧ ∃ u ∈ gallaiEdmondsD G, G.Adj v u}

/-- 4.3 The set `C(G)` of the vertices in neither `D(G)` nor `A(G)`. -/
def gallaiEdmondsC (G : SimpleGraph V) : Set V :=
  {v | v ∉ gallaiEdmondsD G ∧ v ∉ gallaiEdmondsA G}

/-- 4.3 The Gallai–Edmonds structure theorem. In a finite graph every connected component of the
subgraph induced on `D(G)` is factor-critical, the subgraph induced on `C(G)` has a perfect
matching, and `U = A(G)` attains the minimum in the Tutte–Berge formula. -/
theorem gallaiEdmonds [Finite V] (G : SimpleGraph V) :
    (∀ c : (G.induce (gallaiEdmondsD G)).ConnectedComponent,
        IsFactorCriticalOn G (Subtype.val '' c.supp)) ∧
      (∃ M : G.Subgraph, M.IsMatching ∧ M.verts = gallaiEdmondsC G) ∧
      2 * matchingNumber G + (numOddComponents G (gallaiEdmondsA G) : ℕ∞) =
        (Nat.card V : ℕ∞) + ((gallaiEdmondsA G).ncard : ℕ∞) := by
  sorry

/-- 4.4 The maximum matchings in the Gallai–Edmonds decomposition. Every maximum matching of a
finite graph matches each vertex of `A(G)` to a vertex of `D(G)`, and distinct vertices of `A(G)`
into distinct components of the subgraph induced on `D(G)`; it matches each vertex of `C(G)` to a
vertex of `C(G)`; and in each component of the subgraph induced on `D(G)` exactly one vertex is not
matched to a vertex of the same component. -/
theorem IsMaximumMatching.gallaiEdmonds [Finite V] {G : SimpleGraph V} {M : G.Subgraph}
    (hM : IsMaximumMatching M) :
    (∀ a ∈ gallaiEdmondsA G, ∃ d ∈ gallaiEdmondsD G, M.Adj a d) ∧
      (∀ a ∈ gallaiEdmondsA G, ∀ b ∈ gallaiEdmondsA G, ∀ (d d' : gallaiEdmondsD G),
        M.Adj a d → M.Adj b d' →
          (G.induce (gallaiEdmondsD G)).connectedComponentMk d =
            (G.induce (gallaiEdmondsD G)).connectedComponentMk d' → a = b) ∧
      (∀ x ∈ gallaiEdmondsC G, ∃ y ∈ gallaiEdmondsC G, M.Adj x y) ∧
      (∀ c : (G.induce (gallaiEdmondsD G)).ConnectedComponent,
        {x ∈ Subtype.val '' c.supp | ¬∃ y ∈ Subtype.val '' c.supp, M.Adj x y}.ncard = 1) := by
  sorry

/-! ## Layer 5: perfect matchings in regular and symmetric graphs -/

/-- 5.1 Petersen's theorem. A finite 3-regular graph in which no edge is a bridge has a perfect
matching. -/
theorem exists_isPerfectMatching_of_isRegularOfDegree_three [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (h3 : G.IsRegularOfDegree 3) (hb : ∀ e ∈ G.edgeSet, ¬G.IsBridge e) :
    ∃ M : G.Subgraph, M.IsPerfectMatching := by
  sorry

/-- 5.2 A finite connected vertex-transitive graph with an even number of vertices has a perfect
matching. -/
theorem exists_isPerfectMatching_of_vertexTransitive [Finite V] {G : SimpleGraph V}
    (hc : G.Connected) (ht : ∀ v w : V, ∃ φ : G ≃g G, φ v = w) (he : Even (Nat.card V)) :
    ∃ M : G.Subgraph, M.IsPerfectMatching := by
  sorry

end TauCetiRoadmap.MatchingTheory

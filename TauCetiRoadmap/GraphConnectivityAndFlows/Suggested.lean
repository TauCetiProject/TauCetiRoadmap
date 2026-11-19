import Mathlib
import TauCeti.Combinatorics.Graph.Connectivity.EdgeConnectivity
import TauCeti.Combinatorics.Graph.Connectivity.Ear.Basic
import TauCeti.Combinatorics.Graph.Connectivity.Walk.OfSimpleGraph
import TauCeti.Combinatorics.Graph.Incidence
import TauCeti.Combinatorics.Graph.Orientation.Basic
import TauCeti.Combinatorics.SimpleGraph.Connectivity.Block
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# Finite graph connectivity and network flows: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries do not yet prove,
each with `sorry`, together with the three small definitions these statements use.

The other headline theorems of the roadmap are proved in the pinned Tau Ceti and are therefore
not restated here; the README names them under its supplier contracts. They are max-flow/min-cut
with integrality (`TauCeti.Flow.exists_val_eq_arrowSum`, `TauCeti.Flow.exists_isMaximum_mem`),
the poset of minimum cuts (`TauCeti.BoundedFlow.IsMaximum.minimizersOrderIso`), Menger's theorem
(`TauCeti.exists_paths_vertexSeparator_card_eq`, `Graph.exists_paths_edgeSeparator_card_eq`,
`SimpleGraph.isVertexConnected_iff_forall_exists_paths`), Hoffman's circulation theorem
(`TauCeti.exists_isCirculation_iff`), Hakimi's orientation theorem
(`Graph.exists_orientation_indegree_eq_iff`), the Gomory–Hu theorem
(`TauCeti.TerminalCut.exists_isCutTree`) and the bridge forest (`Graph.isForest_bridgeForest`).

One headline theorem of the roadmap is not statable at the pins: the characterization of strong
connectivity of a finite network by directed ear decompositions (README §7.2, item 3). The pinned
libraries have no directed ear decomposition: Tau Ceti's `Graph.EarDecomposition` is undirected,
and building the directed carrier is itself a target of README §7.2.

The statements below use Tau Ceti's multigraph walks, ear decompositions and orientations
(`Graph.Walk`, `Graph.EarDecomposition`, `Graph.Orientation`), its connectivity predicates
(`Graph.IsEdgeConnected`, `SimpleGraph.IsVertexConnected`), its blocks and cut vertices
(`SimpleGraph.IsBlock`, `SimpleGraph.IsCutVertex`), its simple-graph orientations
(`TauCeti.DoubledQuiver.Orientation`), and Mathlib's `Graph`, `SimpleGraph` and
`Quiver.IsStronglyConnected`.
-/

open Finset

namespace TauCetiRoadmap.GraphConnectivityAndFlows

universe u v

/-! ## Layer 2: bridges, bonds, cut vertices, and blocks -/

/-- The block–cut graph of a simple graph: its vertices are the blocks and the cut vertices, and
a block is adjacent to a cut vertex exactly when it contains it (the block graph of Diestel,
*Graph Theory*, 6th edition, §3.1, p. 65). -/
def blockCutGraph {V : Type u} (G : SimpleGraph V) :
    SimpleGraph ({B : Set V // G.IsBlock B} ⊕ {c : V // G.IsCutVertex c}) :=
  SimpleGraph.fromRel fun x y =>
    ∃ (B : {B : Set V // G.IsBlock B}) (c : {c : V // G.IsCutVertex c}),
      x = .inl B ∧ y = .inr c ∧ c.1 ∈ B.1

/-- The block–cut graph of every simple graph is a forest (for finite graphs, Diestel, *Graph
Theory*, 6th edition, Lemma 3.1.4, p. 66, applied to each component). -/
theorem isAcyclic_blockCutGraph {V : Type u} (G : SimpleGraph V) :
    (blockCutGraph G).IsAcyclic := by
  sorry

/-- The block–cut graph of a connected simple graph is a tree (Diestel, *Graph Theory*,
6th edition, Lemma 3.1.4, p. 66). -/
theorem isTree_blockCutGraph {V : Type u} (G : SimpleGraph V) (hG : G.Connected) :
    (blockCutGraph G).IsTree := by
  sorry

/-! ## Layer 6: connectivity, bipartite matching, and edge-colouring -/

/-- A bipartition of a multigraph with finitely many actual vertices: disjoint sides covering the
actual vertices, every edge joining the two sides. A loop would have both ends on one side, so a
multigraph with a bipartition has no loops. -/
def IsBipartition {α : Type u} {β : Type v} (G : Graph α β) (L R : Finset G.vertexSet) : Prop :=
  Disjoint L R ∧ (∀ v : G.vertexSet, v ∈ L ∨ v ∈ R) ∧
    ∀ (e : G.edgeSet) (x y : G.vertexSet), G.IsLink e.1 x.1 y.1 →
      (x ∈ L ∧ y ∈ R) ∨ (x ∈ R ∧ y ∈ L)

open Classical in
/-- The usage at a vertex of an edge multiplicity function `x`: the sum of the multiplicities of
the actual edges incident with the vertex. -/
noncomputable def edgeUsage {α : Type u} {β : Type v} (G : Graph α β) [Fintype G.edgeSet]
    (x : G.edgeSet → ℕ) (v : G.vertexSet) : ℕ :=
  ∑ e ∈ univ.filter (fun e : G.edgeSet => G.Inc e.1 v.1), x e

/-- Multiset capacitated Kőnig theorem: for a finite bipartite multigraph with vertex capacities
`b`, some multiplicity function with usage at most `b` everywhere (a multiset capacitated
matching) has size equal to the `b`-weight of some vertex cover, and every such matching has size
at most the weight of every cover (Schrijver, *A Course in Combinatorial Optimization*, Theorem 8.3,
p. 139, with Corollary 8.1b, p. 135, the min–max relation asked for in Exercise 8.11, p. 143; the
case `b = 1` is Kőnig's theorem, Corollary 8.3a, p. 140). -/
theorem exists_capacitatedMatching_cover_eq {α : Type u} {β : Type v} (G : Graph α β)
    [Fintype G.vertexSet] [Fintype G.edgeSet] {L R : Finset G.vertexSet}
    (hLR : IsBipartition G L R) (b : G.vertexSet → ℕ) :
    (∃ (x : G.edgeSet → ℕ) (C : Finset G.vertexSet), (∀ v, edgeUsage G x v ≤ b v) ∧
        (∀ e : G.edgeSet, ∃ v ∈ C, G.Inc e.1 v.1) ∧ ∑ e, x e = ∑ v ∈ C, b v) ∧
      ∀ (x : G.edgeSet → ℕ) (C : Finset G.vertexSet), (∀ v, edgeUsage G x v ≤ b v) →
        (∀ e : G.edgeSet, ∃ v ∈ C, G.Inc e.1 v.1) → ∑ e, x e ≤ ∑ v ∈ C, b v := by
  sorry

open Classical in
/-- Capacitated Hall theorem: a multiset capacitated matching saturating every vertex of the side
`L` exists if and only if `b(S) ≤ b(N(S))` for every `S ⊆ L`, where `N(S)` is the set of
neighbours of `S` (Diestel, *Graph Theory*, 6th edition, Exercise 9 of Chapter 2, p. 57, for unit
capacities on `R`; Hall's theorem, Theorem 2.1.2, p. 40, is the case `b = 1`). -/
theorem exists_capacitatedMatching_saturating_left_iff {α : Type u} {β : Type v}
    (G : Graph α β) [Fintype G.vertexSet] [Fintype G.edgeSet] {L R : Finset G.vertexSet}
    (hLR : IsBipartition G L R) (b : G.vertexSet → ℕ) :
    (∃ x : G.edgeSet → ℕ, (∀ v, edgeUsage G x v ≤ b v) ∧ ∀ v ∈ L, edgeUsage G x v = b v) ↔
      ∀ S ⊆ L, ∑ v ∈ S, b v ≤
        ∑ w ∈ univ.filter (fun w : G.vertexSet => ∃ u ∈ S, G.Adj u.1 w.1), b w := by
  sorry

/-- Kőnig's edge-colouring theorem: a finite bipartite multigraph has a proper edge-colouring by
`Fin k`, distinct edges with a common end receiving distinct colours, if and only if every vertex
is incident with at most `k` edges, parallel edges counted separately (Schrijver, *A Course in
Combinatorial Optimization*, Theorem 7.4, p. 116; Diestel, *Graph Theory*, 6th edition,
Proposition 5.3.1, p. 132). -/
theorem exists_edgeColoring_iff {α : Type u} {β : Type v} (G : Graph α β)
    [Fintype G.vertexSet] [Fintype G.edgeSet] {L R : Finset G.vertexSet}
    (hLR : IsBipartition G L R) (k : ℕ) :
    (∃ c : G.edgeSet → Fin k, ∀ e f : G.edgeSet, e ≠ f →
        ∀ v, G.Inc e.1 v → G.Inc f.1 v → c e ≠ c f) ↔
      ∀ v : G.vertexSet, G.incidenceCount v.1 ≤ k := by
  sorry

/-! ## Layer 7: ear decompositions and strong orientations -/

/-- Whitney's ear theorem: a finite simple graph is 2-vertex-connected if and only if it has an
open ear decomposition, one starting from a cycle and adding only open ears; on fewer than three
vertices both sides fail, as 2-vertex-connectivity asks for three vertices and there is no cycle
(Diestel, *Graph Theory*, 6th edition, Proposition 3.1.1, p. 63). -/
theorem isVertexConnected_two_iff_exists_isOpen_earDecomposition {V : Type u}
    (H : SimpleGraph V) [Finite V] :
    H.IsVertexConnected 2 ↔
      ∃ d : (Graph.ofSimpleGraph H).EarDecomposition (Graph.ofSimpleGraph H), d.IsOpen := by
  sorry

/-- In a finite 2-vertex-connected simple graph, every cycle is the initial graph of an open ear
decomposition (the proof of Diestel, *Graph Theory*, 6th edition, Proposition 3.1.1, p. 63, run
with the subgraphs built from the given cycle). -/
theorem exists_isOpen_earDecomposition_initial_eq {V : Type u} (H : SimpleGraph V) [Finite V]
    (hH : H.IsVertexConnected 2) {x : V} (c : H.Walk x x) (hc : c.IsCycle) :
    ∃ d : (Graph.ofSimpleGraph H).EarDecomposition (Graph.ofSimpleGraph H),
      d.IsOpen ∧ d.initial = (Graph.ofSimpleGraph H).walkGraph c.toGraph := by
  sorry

/-- A finite multigraph with an actual vertex is 2-edge-connected if and only if it is built from
one vertex by adding open and closed ears: some ear decomposition of `G` starts from a vertex rather
than a cycle (the construction in the proof of Bang-Jensen–Gutin, *Digraphs*, 1st edition,
Theorem 1.6.2, pp. 20–21). -/
theorem isEdgeConnected_two_iff_exists_earDecomposition {α : Type u} {β : Type v}
    (G : Graph α β) [Finite G.vertexSet] [Finite G.edgeSet] (hV : G.vertexSet.Nonempty) :
    G.IsEdgeConnected 2 ↔ ∃ d : G.EarDecomposition G, ¬ d.start.IsCycle := by
  sorry

/-- Robbins' theorem for finite multigraphs: some orientation is strongly connected on the actual
vertices if and only if the multigraph is 2-edge-connected (Bang-Jensen–Gutin, *Digraphs*,
1st edition, Theorem 1.6.2, p. 20, for connected graphs, and §8.6, p. 443, for multigraphs). -/
theorem exists_isStronglyConnected_orientation_iff {α : Type u} {β : Type v} (G : Graph α β)
    [Finite G.vertexSet] [Finite G.edgeSet] :
    (∃ o : G.Orientation, @Quiver.IsStronglyConnected G.vertexSet ⟨o.Hom⟩) ↔
      G.IsEdgeConnected 2 := by
  sorry

/-- Robbins' theorem for finite simple graphs, with Tau Ceti's simple-graph orientations
(Bang-Jensen–Gutin, *Digraphs*, 1st edition, Theorem 1.6.2, p. 20). -/
theorem exists_isStronglyConnected_doubledQuiverOrientation_iff {V : Type u}
    (H : SimpleGraph V) [Finite V] :
    (∃ o : TauCeti.DoubledQuiver.Orientation H,
        Quiver.IsStronglyConnected (TauCeti.DoubledQuiver.OrientedQuiver H o)) ↔
      H.IsEdgeConnected 2 := by
  sorry

/-- Existence of `st`-numberings: for an edge `st` of a finite 2-vertex-connected simple graph,
the vertices can be numbered bijectively by `Fin |V|` with `s` first and `t` last so that every
other vertex has a lower-numbered and a higher-numbered neighbour (a theorem of Lempel, Even and
Cederbaum, stated in Papamanthou–Tollis, *Applications of parameterized st-orientations*, §1,
p. 338). -/
theorem exists_stNumbering {V : Type u} [Fintype V] (H : SimpleGraph V)
    (hH : H.IsVertexConnected 2) {s t : V} (hst : H.Adj s t) :
    ∃ σ : V ≃ Fin (Fintype.card V), (σ s).val = 0 ∧ (σ t).val + 1 = Fintype.card V ∧
      ∀ v, v ≠ s → v ≠ t →
        (∃ u, H.Adj u v ∧ σ u < σ v) ∧ ∃ w, H.Adj v w ∧ σ v < σ w := by
  sorry

end TauCetiRoadmap.GraphConnectivityAndFlows

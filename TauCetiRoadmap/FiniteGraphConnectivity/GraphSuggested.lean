import TauCetiRoadmap.FiniteGraphConnectivity.Suggested

/-!
# Finite multigraph connectivity: suggested signatures

**This file is not the roadmap and is not exhaustive.**
The definitive document is `README.md`; these are suggested forms, not an exhaustive checklist.
`sorry` marks mathematical targets, not completed proofs.

The path prototypes use the bidirected-network side of the required correspondence with the shared `GraphLike.Walk` proposal.
They retain edge identities and state the transport obligations without introducing a competing native undirected walk type.
The implementation follows the upstream shared-walk interfaces and proves the correspondence specified in Milestone 1.
All definitions here live in a prototype namespace; the implementation extends `Graph` and the shared walk API.
-/

open Finset

universe u v w

namespace TauCetiRoadmap.FiniteGraphConnectivity.Multigraph

variable {α : Type u} {β : Type v} (G : Graph α β)

/-- The bidirected arrow family has one arrow per incident edge and ordered pair of ends.
A loop gives one loop arrow; a nonloop edge gives two opposite arrows. -/
abbrev Hom (s t : G.vertexSet) := {e : G.edgeSet // G.IsLink e.val s.val t.val}

abbrev Walk (s t : G.vertexSet) := ArrowWalk (Hom G) s t

/-- Both directions of an edge retain the same underlying identity. -/
def edgeList {s t : G.vertexSet} (p : Walk G s t) : List β := by
  letI : Quiver G.vertexSet := ⟨Hom G⟩
  induction p with
  | nil => exact []
  | cons p e es => exact es ++ [e.val.val]

def IsCycle {s : G.vertexSet} (p : Walk G s s) : Prop :=
  0 < ArrowWalk.length p ∧ (ArrowWalk.vertices p).tail.Nodup ∧ (edgeList G p).Nodup

def EdgeDisjoint {s t : G.vertexSet} (p q : Walk G s t) : Prop :=
  (edgeList G p).Disjoint (edgeList G q)

def InternallyDisjoint {s t : G.vertexSet} (p q : Walk G s t) : Prop :=
  ∀ x ∈ ArrowWalk.vertices p, x ∈ ArrowWalk.vertices q → x = s ∨ x = t

/-- Ambient endpoints must be actual vertices, including for a zero-length walk. -/
def Reachable (s t : α) : Prop :=
  ∃ (hs : s ∈ G.vertexSet) (ht : t ∈ G.vertexSet),
    Nonempty (Walk G ⟨s, hs⟩ ⟨t, ht⟩)

theorem reachable_iff_toSimpleGraph (s t : G.vertexSet) :
    Reachable G s.val t.val ↔ G.toSimpleGraph.Reachable s t := by
  sorry

/-- Vertex connectivity reuses the underlying simple graph. -/
abbrev IsVertexConnected (k : ℕ∞) : Prop :=
  TauCetiRoadmap.FiniteGraphConnectivity.IsVertexConnected G.toSimpleGraph k

def IsEdgeReachable (k : ℕ) (s t : G.vertexSet) : Prop :=
  ∀ F : Set β, F ⊆ G.edgeSet → F.encard < k → Reachable (G.deleteEdges F) s.val t.val

def IsEdgeConnected (k : ℕ) : Prop := ∀ s t : G.vertexSet, IsEdgeReachable G k s t

noncomputable def edgeConnectivity : ℕ∞ :=
  ⨆ (k : ℕ) (_ : IsEdgeConnected G k), (k : ℕ∞)

/-- A bridge is an actual edge; unlike `SimpleGraph.IsBridge`, this is false on non-edges. -/
def IsBridge (e : β) : Prop :=
  ∃ s t, G.IsLink e s t ∧ ¬ Reachable (G.deleteEdges {e}) s t

theorem isBridge_iff_not_mem_cycle (e : G.edgeSet) :
    IsBridge G e.val ↔ ∀ s (p : Walk G s s), IsCycle G p → e.val ∉ edgeList G p := by
  sorry

/-- Edge deletion retains multiplicity; only actual vertices and edges need be finite. -/
theorem exists_paths_edgeSeparator_card_eq [Finite G.vertexSet] [Finite G.edgeSet]
    {s t : G.vertexSet} (hst : s ≠ t) :
    ∃ (k : ℕ) (P : Fin k → Walk G s t) (F : Set β),
      Function.Injective P ∧ (∀ i, ArrowWalk.IsPath (P i)) ∧
      (Pairwise fun i j => EdgeDisjoint G (P i) (P j)) ∧
      F ⊆ G.edgeSet ∧ F.ncard = k ∧ ¬ Reachable (G.deleteEdges F) s.val t.val := by
  sorry

theorem isEdgeReachable_iff_exists_paths [Finite G.vertexSet] [Finite G.edgeSet]
    {s t : G.vertexSet} (hst : s ≠ t) (k : ℕ) :
    IsEdgeReachable G k s t ↔
      ∃ P : Fin k → Walk G s t, Function.Injective P ∧ (∀ i, ArrowWalk.IsPath (P i)) ∧
        Pairwise fun i j => EdgeDisjoint G (P i) (P j) := by
  sorry

/-- Vertex Menger returns paths with original edge identities. -/
theorem exists_paths_vertexSeparator_card_eq [Finite G.vertexSet] [Finite G.edgeSet]
    {s t : G.vertexSet} (hst : s ≠ t) (hadj : ¬ G.Adj s.val t.val) :
    ∃ (k : ℕ) (P : Fin k → Walk G s t) (X : Set α),
      Function.Injective P ∧ (∀ i, ArrowWalk.IsPath (P i)) ∧
      (Pairwise fun i j => InternallyDisjoint G (P i) (P j)) ∧
      X ⊆ G.vertexSet ∧ X.ncard = k ∧ s.val ∉ X ∧ t.val ∉ X ∧
      ¬ Reachable (G.deleteVerts X) s.val t.val := by
  sorry

/-- All direct terminal edges contribute distinct one-edge paths. -/
theorem exists_paths_separator_card_eq_add_multiplicity
    [Finite G.vertexSet] [Finite G.edgeSet] {s t : G.vertexSet} (hst : s ≠ t) :
    let D : Set β := {e | G.IsLink e s.val t.val}
    ∃ (k : ℕ) (P : Fin (k + D.ncard) → Walk G s t) (X : Set α),
      Function.Injective P ∧ (∀ i, ArrowWalk.IsPath (P i)) ∧
      (Pairwise fun i j => InternallyDisjoint G (P i) (P j)) ∧
      X ⊆ G.vertexSet ∧ X.ncard = k ∧ s.val ∉ X ∧ t.val ∉ X ∧
      ¬ Reachable ((G.deleteEdges D).deleteVerts X) s.val t.val := by
  sorry

/-- A simple path projects without forgetting any vertex. Distinct parallel one-edge paths
can still have the same projection. -/
noncomputable def projectPath {s t : G.vertexSet} (p : Walk G s t) (hp : ArrowWalk.IsPath p) :
    {q : G.toSimpleGraph.Walk s t // q.IsPath ∧ q.support = ArrowWalk.vertices p} := by
  sorry

noncomputable def liftPath {s t : G.vertexSet} (p : G.toSimpleGraph.Walk s t) (hp : p.IsPath) :
    {q : Walk G s t // ArrowWalk.IsPath q ∧ ArrowWalk.vertices q = p.support} := by
  sorry

/-- On simple graphs the correspondence is an equivalence even for arbitrary walks. -/
noncomputable def ofSimpleGraphWalkEquiv {V : Type*} (H : SimpleGraph V) (s t : V) :
    H.Walk s t ≃ Walk (Graph.ofSimpleGraph H) ⟨s, by simp⟩ ⟨t, by simp⟩ := by
  sorry

theorem isEdgeConnected_ofSimpleGraph {V : Type*} (H : SimpleGraph V) (k : ℕ) :
    IsEdgeConnected (Graph.ofSimpleGraph H) k ↔ H.IsEdgeConnected k := by
  sorry

/-- Ordering the ends retains one arrow for each edge, including each loop. -/
structure Orientation where
  ends : G.edgeSet → G.vertexSet × G.vertexSet
  isLink : ∀ e, G.IsLink e.val (ends e).1.val (ends e).2.val

def Orientation.Hom (o : Orientation G) (s t : G.vertexSet) :=
  {e : G.edgeSet // o.ends e = (s, t)}

def Orientation.IsStronglyConnected (o : Orientation G) : Prop :=
  TauCetiRoadmap.FiniteGraphConnectivity.IsStronglyConnected o.Hom

noncomputable def orientationOfSimpleGraphEquiv {V : Type*} (H : SimpleGraph V) :
    Orientation (Graph.ofSimpleGraph H) ≃ TauCeti.DoubledQuiver.Orientation H := by
  sorry

theorem orientationOfSimpleGraphEquiv_stronglyConnected {V : Type*} (H : SimpleGraph V)
    (o : Orientation (Graph.ofSimpleGraph H)) :
    o.IsStronglyConnected ↔
      @Quiver.IsStronglyConnected
        (TauCeti.DoubledQuiver.OrientedQuiver H (orientationOfSimpleGraphEquiv H o))
        inferInstance := by
  sorry

theorem exists_orientation_isStronglyConnected_iff [Finite G.vertexSet] [Finite G.edgeSet] :
    (∃ o : Orientation G, o.IsStronglyConnected) ↔ IsEdgeConnected G 2 := by
  sorry

/-- Pairwise reachability is vacuous on the empty vertex set, as is edge connectivity. -/
theorem isEdgeConnected_two_iff [Finite G.vertexSet] [Finite G.edgeSet] :
    IsEdgeConnected G 2 ↔
      (∀ s t : G.vertexSet, Reachable G s.val t.val) ∧ ∀ e ∈ G.edgeSet, ¬ IsBridge G e := by
  sorry

/-- The graph traced by a walk, with the original ambient vertex and edge types. -/
def walkGraph {s t : G.vertexSet} (p : Walk G s t) : Graph α β :=
  (G.induce {x | ∃ v ∈ ArrowWalk.vertices p, v.val = x}).deleteEdges
    {e | e ∉ edgeList G p}

inductive Ear (H : Graph α β) : Type max u v
  | open {s t : G.vertexSet} (p : Walk G s t) (hp : ArrowWalk.IsPath p)
      (hs : s.val ∈ H.vertexSet) (ht : t.val ∈ H.vertexSet) (hst : s ≠ t)
      (hint : ∀ x ∈ ArrowWalk.vertices p, x ≠ s → x ≠ t → x.val ∉ H.vertexSet)
      (hedge : ∀ e ∈ edgeList G p, e ∉ H.edgeSet)
  | closed {s : G.vertexSet} (p : Walk G s s) (hp : IsCycle G p)
      (hs : s.val ∈ H.vertexSet)
      (hint : ∀ x ∈ ArrowWalk.vertices p, x ≠ s → x.val ∉ H.vertexSet)
      (hedge : ∀ e ∈ edgeList G p, e ∉ H.edgeSet)

def Ear.toWalk {H : Graph α β} : Ear G H → Σ s t, Walk G s t
  | .open p .. => ⟨_, _, p⟩
  | .closed p .. => ⟨_, _, p⟩

def Ear.toGraph {H : Graph α β} (e : Ear G H) : Graph α β :=
  walkGraph G e.toWalk.2.2

/-- Prefix graphs specify the addition of each ear without assuming a total union operation
on arbitrary, potentially incompatible graphs. -/
structure EarDecomposition where
  length : ℕ
  graphAfter : Fin (length + 1) → Graph α β
  subgraph : ∀ i, graphAfter i ≤ G
  initial : {v : G.vertexSet // graphAfter 0 = Graph.noEdge {v.val} β} ⊕
    (Σ s : G.vertexSet, {p : Walk G s s // IsCycle G p ∧ graphAfter 0 = walkGraph G p})
  earAt : (i : Fin length) → Ear G (graphAfter i.castSucc)
  vertices_step : ∀ i, (graphAfter i.succ).vertexSet =
    (graphAfter i.castSucc).vertexSet ∪ (Ear.toGraph G (earAt i)).vertexSet
  edges_step : ∀ i, (graphAfter i.succ).edgeSet =
    (graphAfter i.castSucc).edgeSet ∪ (Ear.toGraph G (earAt i)).edgeSet
  final : graphAfter (Fin.last length) = G

noncomputable def EarDecomposition.prefix (d : EarDecomposition G) (i : Fin (d.length + 1)) :
    EarDecomposition (d.graphAfter i) := by
  sorry

theorem EarDecomposition.prefix_length (d : EarDecomposition G) (i : Fin (d.length + 1)) :
    (EarDecomposition.prefix G d i).length = i.val := by
  sorry

theorem isEdgeConnected_two_iff_nonempty_earDecomposition
    [Finite G.vertexSet] [Finite G.edgeSet] [Nonempty G.vertexSet] :
    IsEdgeConnected G 2 ↔ Nonempty (EarDecomposition G) := by
  sorry

section Capacities

variable {K : Type w} [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]

/-- Capacities decorate the incidence arrow family; they do not determine which edges exist. -/
abbrev bidirectedNetwork (c : G.edgeSet → K) (hc : ∀ e, 0 ≤ c e) : Network K G.vertexSet where
  Hom := Hom G
  cap e := c e.val
  cap_nonneg e := hc e.val

variable [Fintype G.vertexSet] [Fintype G.edgeSet]

open Classical in
noncomputable def cutCapacity (c : G.edgeSet → K) (S : Finset G.vertexSet) : K :=
  ∑ e : G.edgeSet, if ∃ s ∈ S, ∃ t ∉ S, G.IsLink e.val s.val t.val then c e else 0

open Classical in
theorem bidirected_cutCapacity (c : G.edgeSet → K) (hc : ∀ e, 0 ≤ c e)
    (S : Finset G.vertexSet) :
    (bidirectedNetwork G c hc).cutCapacity S = cutCapacity G c S := by
  sorry

open Classical in
/-- The aggregated pair capacity counts all parallel edges and discards loops. -/
noncomputable def pairCapacity (c : G.edgeSet → K) (p : Sym2 G.vertexSet) : K :=
  ∑ e : G.edgeSet,
    if ∃ s t : G.vertexSet, s ≠ t ∧ p = s(s, t) ∧ G.IsLink e.val s.val t.val then c e else 0

open Classical in
theorem cutCapacity_pairCapacity (c : G.edgeSet → K) (S : Finset G.vertexSet) :
    TauCetiRoadmap.FiniteGraphConnectivity.cutCapacity (pairCapacity G c) S =
      cutCapacity G c S := by
  sorry

open Classical in
theorem isSymmSubmodular_cutCapacity (c : G.edgeSet → K) (hc : ∀ e, 0 ≤ c e) :
    IsSymmSubmodular (cutCapacity G c) := by
  sorry

open Classical in
theorem isEdgeReachable_iff_le_minCut {s t : G.vertexSet} (hst : s ≠ t) (k : ℕ) :
    IsEdgeReachable G k s t ↔ (k : ℤ) ≤ minCut (cutCapacity G (fun _ => (1 : ℤ))) s t := by
  sorry

end Capacities

end TauCetiRoadmap.FiniteGraphConnectivity.Multigraph

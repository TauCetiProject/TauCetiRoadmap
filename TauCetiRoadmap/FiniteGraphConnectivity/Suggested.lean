import Mathlib

/-!
# Finite graph connectivity: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for the load-bearing structures and a few milestone
statements, so that contributors and reviewers converge on names and shapes. Discharging every
declaration here finishes neither a milestone nor the roadmap. `sorry` is allowed in this
human-owned roadmap library: these are targets, not completed definitions or proofs.

The pinned choices this file exhibits: a directed network is a *term* `N : Network V` whose
`Quiver` instance lives on the type synonym `N.Vert`; the residual network has the
flow-independent arrow type `N.Hom v w ⊕ N.Hom w v`, and an augmenting path is a path in its
positive-capacity part; an orientation of a simple graph is a choice of `Dart` per edge, with its
quiver instance on the synonym `Oriented G o`; connectivity is predicate-first, following Mathlib's
`IsEdgeConnected` and the shape of Mathlib proposal #33355 for vertex connectivity; and every sum
is a `Finset.sum`.

Declarations that Mathlib proposals will eventually provide (`IsVertexReachable`,
`IsVertexConnected`) are stand-ins in this roadmap's namespace, not in `SimpleGraph`, so that this
file keeps compiling when Mathlib lands them.
-/

open scoped NNReal
open Finset

universe u

namespace TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Directed networks (Conventions; Milestones 1, 3, 4, 8) -/

/-- A directed network: an arrow type for every ordered pair of vertices and a capacity for
every arrow. Parallel arrows, antiparallel arrows, loops, and zero capacities are allowed.
Networks are terms; the quiver instance lives on `Network.Vert`. -/
structure Network (V : Type u) where
  Hom : V → V → Type u
  cap : ∀ {v w : V}, Hom v w → ℝ≥0

variable {V : Type u}

/-- Type synonym carrying the quiver instance of a network, as `Quiver.Symmetrify` does. -/
def Network.Vert (_N : Network V) : Type u := V

instance (N : Network V) : Quiver N.Vert := ⟨N.Hom⟩

/-- View a vertex as a vertex of the network's quiver. -/
def Network.toVert (_N : Network V) (v : V) : _N.Vert := v

/-- Directed reachability in a network, through Mathlib's `Quiver.Path`. -/
def Network.Reachable (N : Network V) (v w : V) : Prop :=
  Nonempty (Quiver.Path (N.toVert v) (N.toVert w))

/-- The subnetwork of arrows with positive capacity. -/
def Network.positivePart (N : Network V) : Network V where
  Hom v w := {e : N.Hom v w // 0 < N.cap e}
  cap e := N.cap e.1

/-- A real-valued assignment on the arrows of a network. -/
abbrev Network.Assignment (N : Network V) : Type u := ∀ {v w : V}, N.Hom v w → ℝ

section Finite

variable (N : Network V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (N.Hom v w)]

/-- Divergence: outgoing minus incoming flow. Real-valued, since it can be negative. -/
noncomputable def Network.divergence (f : N.Assignment) (v : V) : ℝ :=
  ∑ w, ∑ e : N.Hom v w, f e - ∑ w, ∑ e : N.Hom w v, f e

/-- Capacity of the cut with source side `S`: the total capacity of arrows leaving `S`. -/
noncomputable def Network.cutCapacity (S : Finset V) : ℝ≥0 :=
  ∑ v ∈ S, ∑ w ∈ Sᶜ, ∑ e : N.Hom v w, N.cap e

/-- An `s–t` flow: nonnegative, capacity-respecting, conserved away from the terminals.
Arrows into `s` and out of `t` are allowed. -/
structure Network.Flow (s t : V) where
  toFun : ∀ {v w : V}, N.Hom v w → ℝ≥0
  le_cap : ∀ {v w : V} (e : N.Hom v w), toFun e ≤ N.cap e
  conserve : ∀ v, v ≠ s → v ≠ t → N.divergence (fun e => (toFun e : ℝ)) v = 0

variable {N} {s t : V}

/-- The value of a flow is its divergence at the source. -/
noncomputable def Network.Flow.value (f : N.Flow s t) : ℝ :=
  N.divergence (fun e => (f.toFun e : ℝ)) s

/-- The residual network. Its arrow type does not depend on `f`: a forward arrow keeps the
unused capacity `u e − f e`, a reverse arrow carries the cancellable flow `f e`, and arrows of
zero residual capacity are ordinary arrows. -/
noncomputable def Network.residual (f : N.Flow s t) : Network V where
  Hom v w := N.Hom v w ⊕ N.Hom w v
  cap := Sum.elim (fun e => N.cap e - f.toFun e) (fun e => f.toFun e)

/-- An augmenting path exists exactly when `t` is reachable from `s` through residual arrows of
positive capacity. -/
def Network.Flow.HasAugmentingPath (f : N.Flow s t) : Prop :=
  (N.residual f).positivePart.Reachable s t

/-- Weak duality. -/
theorem Network.Flow.value_le_cutCapacity (f : N.Flow s t) {S : Finset V} (hs : s ∈ S)
    (ht : t ∉ S) : f.value ≤ N.cutCapacity S := by
  sorry

/-- Max-flow/min-cut with attainment on both sides. -/
theorem Network.exists_flow_cut_value_eq (hst : s ≠ t) :
    ∃ (f : N.Flow s t) (S : Finset V), s ∈ S ∧ t ∉ S ∧ f.value = N.cutCapacity S := by
  sorry

/-- First optimality certificate: a flow is maximum iff it has no augmenting path. The
hypothesis `s ≠ t` is needed: for `s = t` every flow has value zero, so every flow is maximum,
while `s` is trivially reachable from itself. -/
theorem Network.Flow.isMax_iff_not_hasAugmentingPath (hst : s ≠ t) (f : N.Flow s t) :
    (∀ g : N.Flow s t, g.value ≤ f.value) ↔ ¬ f.HasAugmentingPath := by
  sorry

/-- Second optimality certificate: a flow is maximum iff some cut attains its value. -/
theorem Network.Flow.isMax_iff_exists_cut (hst : s ≠ t) (f : N.Flow s t) :
    (∀ g : N.Flow s t, g.value ≤ f.value) ↔
      ∃ S : Finset V, s ∈ S ∧ t ∉ S ∧ f.value = N.cutCapacity S := by
  sorry

/-- Integrality: natural-number capacities admit a natural-number-valued maximum flow. -/
theorem Network.exists_integral_max_flow (hst : s ≠ t)
    (hcap : ∀ {v w : V} (e : N.Hom v w), ∃ n : ℕ, N.cap e = n) :
    ∃ f : N.Flow s t, (∀ {v w : V} (e : N.Hom v w), ∃ n : ℕ, f.toFun e = n) ∧
      ∀ g : N.Flow s t, g.value ≤ f.value := by
  sorry

open Classical in
/-- For any maximum flow, the vertices reachable from `s` along residual arrows of positive
capacity form a minimum-cut source side, and it is contained in every minimum-cut source side. -/
theorem Network.Flow.residualReachable_isMinCut (hst : s ≠ t) (f : N.Flow s t)
    (hf : ∀ g : N.Flow s t, g.value ≤ f.value) :
    N.cutCapacity (univ.filter fun v => (N.residual f).positivePart.Reachable s v) = f.value ∧
      ∀ S : Finset V, s ∈ S → t ∉ S → (N.cutCapacity S : ℝ) = f.value →
        (univ.filter fun v => (N.residual f).positivePart.Reachable s v) ⊆ S := by
  sorry

/-- A circulation with lower bounds `lo` and upper bounds `N.cap`, conserved at every vertex. -/
structure Network.BoundedCirculation (lo : ∀ {v w : V}, N.Hom v w → ℝ≥0) where
  toFun : ∀ {v w : V}, N.Hom v w → ℝ≥0
  lo_le : ∀ {v w : V} (e : N.Hom v w), lo e ≤ toFun e
  le_cap : ∀ {v w : V} (e : N.Hom v w), toFun e ≤ N.cap e
  conserve : ∀ v, N.divergence (fun e => (toFun e : ℝ)) v = 0

/-- Hoffman's circulation theorem: `ℓ(δ⁻(S)) ≤ u(δ⁺(S))` for every vertex set `S`. -/
theorem Network.nonempty_boundedCirculation_iff (lo : ∀ {v w : V}, N.Hom v w → ℝ≥0)
    (hlo : ∀ {v w : V} (e : N.Hom v w), lo e ≤ N.cap e) :
    Nonempty (N.BoundedCirculation lo) ↔
      ∀ S : Finset V, ∑ v ∈ Sᶜ, ∑ w ∈ S, ∑ e : N.Hom v w, lo e ≤ N.cutCapacity S := by
  sorry

end Finite

/-! ## Undirected connectivity (Conventions; Milestones 1, 2, 5, 6, 7) -/

variable (G : SimpleGraph V)

/-- Stand-in for Mathlib proposal #33355: `u` and `v` stay reachable after deleting any set of
fewer than `k` vertices not containing them. -/
def IsVertexReachable (k : ℕ∞) (u v : V) : Prop :=
  ∀ ⦃s : Set V⦄, s.encard < k → (hu : u ∉ s) → (hv : v ∉ s) →
    (G.induce sᶜ).Reachable ⟨u, hu⟩ ⟨v, hv⟩

/-- Stand-in for Mathlib proposal #33355: more than `k` vertices, and every pair is
`k`-vertex-reachable. -/
def IsVertexConnected (k : ℕ∞) : Prop :=
  k + 1 ≤ ENat.card V ∧ ∀ u v, IsVertexReachable G k u v

/-- Two `s–t` walks are internally disjoint if they share only the terminals. -/
def InternallyDisjoint {s t : V} (p q : G.Walk s t) : Prop :=
  ∀ v ∈ p.support, v ∈ q.support → v = s ∨ v = t

/-- Two walks are edge-disjoint if no unordered edge lies on both. -/
def EdgeDisjoint {s t : V} (p q : G.Walk s t) : Prop :=
  ∀ e ∈ p.edges, e ∉ q.edges

/-- Local vertex Menger in witness form: a path family and a separator of the same size. The
inequality between any family and any separator is a separate, easier target. -/
theorem exists_paths_separator_card_eq [Finite V] {s t : V} (hst : s ≠ t) (hadj : ¬ G.Adj s t) :
    ∃ (k : ℕ) (P : Fin k → G.Walk s t) (X : Set V),
      Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        (Pairwise fun i j => InternallyDisjoint G (P i) (P j)) ∧
      X.ncard = k ∧ ∃ (hs : s ∉ X) (ht : t ∉ X), ¬ (G.induce Xᶜ).Reachable ⟨s, hs⟩ ⟨t, ht⟩ := by
  sorry

/-- Local vertex Menger, predicate form, for nonadjacent terminals. -/
theorem isVertexReachable_iff_exists_paths [Finite V] {s t : V} (hst : s ≠ t)
    (hadj : ¬ G.Adj s t) (k : ℕ) :
    IsVertexReachable G k s t ↔
      ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => InternallyDisjoint G (P i) (P j) := by
  sorry

/-- Local edge Menger, predicate form, against Mathlib's `IsEdgeReachable`. -/
theorem isEdgeReachable_iff_exists_paths [Finite V] {s t : V} (hst : s ≠ t) (k : ℕ) :
    G.IsEdgeReachable k s t ↔
      ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => EdgeDisjoint G (P i) (P j) := by
  sorry

/-- Global vertex Menger: on more than `k` vertices, `k`-vertex-connectivity is `k` internally
disjoint paths between every pair of distinct vertices, adjacent pairs included. -/
theorem isVertexConnected_iff_forall_exists_paths [Fintype V] (k : ℕ) (hk : k < Fintype.card V) :
    IsVertexConnected G k ↔
      ∀ s t, s ≠ t → ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => InternallyDisjoint G (P i) (P j) := by
  sorry

/-- Whitney's inequalities in predicate form. -/
theorem IsVertexConnected.isEdgeConnected [Finite V] {k : ℕ} (h : IsVertexConnected G k) :
    G.IsEdgeConnected k := by
  sorry

theorem le_minDegree_of_isEdgeConnected [Fintype V] [DecidableRel G.Adj] [Nontrivial V] {k : ℕ}
    (h : G.IsEdgeConnected k) : k ≤ G.minDegree := by
  sorry

/-- An articulation vertex separates two other vertices. The component-count form is a lemma. -/
def IsCutVertex (v : V) : Prop :=
  ∃ u w, ∃ (hu : u ≠ v) (hw : w ≠ v),
    G.Reachable u w ∧ ¬ (G.induce {v}ᶜ).Reachable ⟨u, hu⟩ ⟨w, hw⟩

/-- A block: a maximal vertex set inducing a connected graph without articulation vertices. -/
def IsBlock (B : Set V) : Prop :=
  Maximal (fun B : Set V => (G.induce B).Connected ∧ ∀ v, ¬ IsCutVertex (G.induce B) v) B

/-- Subgraphs of `G` built from a cycle by adding open ears: paths whose distinct endpoints lie
in the subgraph so far, whose interior vertices are new, and whose edges are new. Single-edge
ears are allowed. -/
inductive OpenEarBuilt : G.Subgraph → Prop
  | cycle {u : V} (c : G.Walk u u) (hc : c.IsCycle) : OpenEarBuilt c.toSubgraph
  | ear {H : G.Subgraph} (hH : OpenEarBuilt H) {u v : V} (p : G.Walk u v) (hp : p.IsPath)
      (hu : u ∈ H.verts) (hv : v ∈ H.verts) (huv : u ≠ v)
      (hint : ∀ w ∈ p.support, w ≠ u → w ≠ v → w ∉ H.verts)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet) : OpenEarBuilt (H ⊔ p.toSubgraph)

/-- Whitney's ear characterization of 2-connectivity. -/
theorem isVertexConnected_two_iff_openEarBuilt [Fintype V] (h3 : 3 ≤ Fintype.card V) :
    IsVertexConnected G 2 ↔ OpenEarBuilt G ⊤ := by
  sorry

/-- The form of 2-edge-connectivity Mathlib's edge-connectivity file names as intended.
`IsBridge` on a non-edge means its endpoints are unreachable, so this includes connectedness. -/
theorem isEdgeConnected_two_iff_forall_not_isBridge :
    G.IsEdgeConnected 2 ↔ ∀ e, ¬ G.IsBridge e := by
  sorry

/-- An orientation chooses one dart for every edge. -/
structure Orientation where
  dart : G.edgeSet → G.Dart
  edge_dart : ∀ e, (dart e).edge = (e : Sym2 V)

/-- Type synonym carrying the quiver instance of an oriented graph. -/
def Oriented (_o : Orientation G) : Type u := V

instance (o : Orientation G) : Quiver (Oriented G o) :=
  ⟨fun v w => {e : G.edgeSet // (o.dart e).fst = v ∧ (o.dart e).snd = w}⟩

/-- Robbins' theorem, with no connectedness or size hypothesis. -/
theorem exists_orientation_isStronglyConnected_iff [Finite V] :
    (∃ o : Orientation G, Quiver.IsStronglyConnected (Oriented G o)) ↔ G.IsEdgeConnected 2 := by
  sorry

/-- Kőnig's theorem, with witnesses. -/
theorem konig [Finite V] (h : G.IsBipartite) :
    ∃ (M : G.Subgraph) (C : Set V), M.IsMatching ∧ G.IsVertexCover C ∧
      M.edgeSet.ncard = C.ncard := by
  sorry

/-! ## Cut trees (Milestone 9) -/

section CutTrees

variable [Fintype V] [DecidableEq V] [DecidableRel G.Adj]

/-- Capacity of the undirected cut `(S, Sᶜ)`: each crossing edge counted once. -/
noncomputable def cutCapacity (c : Sym2 V → ℝ≥0) (S : Finset V) : ℝ≥0 :=
  ∑ e ∈ G.edgeFinset with (∃ x ∈ e, x ∈ S) ∧ (∃ y ∈ e, y ∉ S), c e

/-- The minimum `s–t` cut capacity. -/
noncomputable def minCutCapacity (c : Sym2 V → ℝ≥0) (s t : V) : ℝ≥0 :=
  ⨅ S : {S : Finset V // s ∈ S ∧ t ∉ S}, cutCapacity G c S

/-- A weighted tree on the vertex type. -/
structure WeightedTree (V : Type u) where
  tree : SimpleGraph V
  isTree : tree.IsTree
  weight : Sym2 V → ℝ≥0

open Classical in
/-- Gomory–Hu: minimum cut values are read off tree paths, and every tree edge's fundamental
partition is a minimum cut for its endpoints. -/
theorem exists_gomoryHu_tree [Nonempty V] (c : Sym2 V → ℝ≥0) :
    ∃ T : WeightedTree V,
      (∀ s t, s ≠ t → ∀ p : T.tree.Walk s t, p.IsPath →
        (∀ e ∈ p.edges, minCutCapacity G c s t ≤ T.weight e) ∧
          ∃ e ∈ p.edges, T.weight e = minCutCapacity G c s t) ∧
      ∀ u v, T.tree.Adj u v →
        T.weight s(u, v) = minCutCapacity G c u v ∧
          cutCapacity G c (univ.filter fun x => (T.tree.deleteEdges {s(u, v)}).Reachable u x) =
            minCutCapacity G c u v := by
  sorry

end CutTrees

end TauCetiRoadmap.FiniteGraphConnectivity

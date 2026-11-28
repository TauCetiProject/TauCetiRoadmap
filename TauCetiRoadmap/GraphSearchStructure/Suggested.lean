import Mathlib
import TauCeti.Combinatorics.Quiver.StronglyConnectedComponent
import TauCeti.RepresentationTheory.Quiver.Acyclic.Basic
import TauCeti.Combinatorics.SimpleGraph.Connectivity.CutVertex

/-!
# Graph search structure: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's routes and Checks are not restated.

A depth-first search forest is specified, not computed: `IsDFSForest r pre post parent` says that
discovery times `pre`, finishing times `post` (one shared clock) and a parent map satisfy six
axioms for the relation `r` (`r u v`: an arc from `u` to `v`). No search procedure is defined. A
quiver enters through the relation `fun a b ↦ Nonempty (a ⟶ b)`, its reverse through
`fun a b ↦ Nonempty (b ⟶ a)`, and a simple graph through `G.Adj`. Strongly connected components
and their reachability order are Mathlib's `Quiver.StronglyConnectedComponent` with Tau Ceti's
partial order, acyclicity is Tau Ceti's `TauCeti.Quiver.IsAcyclic`, cut vertices are Tau Ceti's
`SimpleGraph.IsCutVertex`, and bridges are Mathlib's `SimpleGraph.IsBridge`.
-/

namespace TauCetiRoadmap.GraphSearchStructure

open Quiver

variable {V : Type*}

/-! ## Layer 1: depth-first forests -/

/-- 1.1. `u` is an ancestor of `v` (reflexively) in the forest of the parent map: the
reflexive-transitive closure of "`b` has parent `a`". -/
def IsAncestor (parent : V → Option V) : V → V → Prop :=
  Relation.ReflTransGen fun a b ↦ parent b = some a

/-- 1.2. A depth-first search forest of the relation `r` (`r u v`: an arc from `u` to `v`), with
discovery times `pre`, finishing times `post` and parent map `parent`. -/
structure IsDFSForest (r : V → V → Prop) (pre post : V → ℕ) (parent : V → Option V) :
    Prop where
  /-- (D1) the discovery and finishing times are pairwise distinct (one shared clock). -/
  injective : Function.Injective (Sum.elim pre post)
  /-- (D2) every vertex is discovered before it finishes. -/
  pre_lt_post : ∀ v, pre v < post v
  /-- (D3) an interval that starts inside another ends inside it. -/
  post_lt_post : ∀ u v, pre u < pre v → pre v < post u → post v < post u
  /-- (D4) the parent is the innermost interval strictly containing the vertex's interval. -/
  parent_eq_some_iff : ∀ u v, parent v = some u ↔
    (pre u < pre v ∧ post v < post u ∧
      ∀ w, pre w < pre v → post v < post w → pre w ≤ pre u)
  /-- (D5) tree edges are arcs. -/
  rel_of_parent_eq_some : ∀ u v, parent v = some u → r u v
  /-- (D6) every out-neighbour of `u` is discovered before `u` finishes. -/
  pre_lt_post_of_rel : ∀ u v, r u v → pre v < post u

/-- 1.3. Roots chosen by priority `key`: every root has the largest `key` among the vertices
not yet discovered when it is discovered (those `w` with `pre x ≤ pre w`). -/
def RootsByKey (key : V → ℕ) (pre : V → ℕ) (parent : V → Option V) : Prop :=
  ∀ x, parent x = none → ∀ w, pre x ≤ pre w → key w ≤ key x

/-- 1.4. Existence: on a finite vertex type, every relation has a depth-first forest whose roots
are chosen by any given priority. -/
theorem exists_isDFSForest_rootsByKey [Finite V] (r : V → V → Prop) (key : V → ℕ) :
    ∃ (pre post : V → ℕ) (parent : V → Option V),
      IsDFSForest r pre post parent ∧ RootsByKey key pre parent := by
  sorry

/-! ## Layer 2: parentheses, white paths and arc classes -/

section Relation

variable {r : V → V → Prop} {pre post : V → ℕ} {parent : V → Option V}

/-- 2.1. Parenthesis theorem: `u` is an ancestor of `v` iff the interval of `v` lies in that of
`u` (Erickson, Lemma 6.1 (a) ⇔ (b)). -/
theorem IsDFSForest.isAncestor_iff (h : IsDFSForest r pre post parent) (u v : V) :
    IsAncestor parent u v ↔ pre u ≤ pre v ∧ post v ≤ post u := by
  sorry

/-- 2.2. White-path theorem: `u` is an ancestor of `v` iff a path of arcs runs from `u` to `v`
through vertices discovered no earlier than `u` (Erickson, Lemma 6.1 (a) ⇔ (d)). -/
theorem IsDFSForest.isAncestor_iff_reflTransGen (h : IsDFSForest r pre post parent) (u v : V) :
    IsAncestor parent u v ↔ Relation.ReflTransGen (fun a b ↦ r a b ∧ pre u ≤ pre b) u v := by
  sorry

/-- 2.3. Arc classes: every arc goes from an ancestor to a descendant, from a descendant to an
ancestor, or to a vertex that finished before its tail was discovered. -/
theorem IsDFSForest.isAncestor_or_isAncestor_or_post_lt (h : IsDFSForest r pre post parent)
    {u v : V} (huv : r u v) :
    IsAncestor parent u v ∨ IsAncestor parent v u ∨ post v < pre u := by
  sorry

end Relation

/-! ## Layer 3: acyclicity and strongly connected components -/

/-- 3.5. Erickson's `low`: the least discovery time of a vertex reached from `v` by tree edges
followed by at most one further arc. -/
noncomputable def lowLink (r : V → V → Prop) (pre : V → ℕ) (parent : V → Option V) (v : V) : ℕ :=
  sInf (insert (pre v) {n | ∃ w x, IsAncestor parent v w ∧ r w x ∧ n = pre x})

section Quiver

variable [Quiver V] {pre post pre' post' : V → ℕ} {parent parent' : V → Option V}

/-- 3.1. A quiver is acyclic iff the finishing times of a depth-first forest decrease strictly
along every arrow. -/
theorem IsDFSForest.isAcyclic_iff
    (h : IsDFSForest (fun a b : V ↦ Nonempty (a ⟶ b)) pre post parent) :
    TauCeti.Quiver.IsAcyclic V ↔ ∀ u v : V, Nonempty (u ⟶ v) → post v < post u := by
  sorry

/-- 3.2. Each strongly connected component contains exactly one vertex whose parent is not in
it (Erickson, Lemma 6.2). -/
theorem IsDFSForest.existsUnique_parent_not_mem
    (h : IsDFSForest (fun a b : V ↦ Nonempty (a ⟶ b)) pre post parent)
    (C : StronglyConnectedComponent V) :
    ∃! v, StronglyConnectedComponent.mk v = C ∧
      ∀ u, parent v = some u → StronglyConnectedComponent.mk u ≠ C := by
  sorry

/-- 3.3. If the component of `u` lies strictly below that of `v` in the reachability order, some
vertex of the component of `u` finishes after every vertex of the component of `v`. -/
theorem IsDFSForest.exists_forall_post_lt
    (h : IsDFSForest (fun a b : V ↦ Nonempty (a ⟶ b)) pre post parent) {u v : V}
    (huv : StronglyConnectedComponent.mk u < StronglyConnectedComponent.mk v) :
    ∃ x, StronglyConnectedComponent.mk x = StronglyConnectedComponent.mk u ∧
      ∀ y, StronglyConnectedComponent.mk y = StronglyConnectedComponent.mk v →
        post y < post x := by
  sorry

/-- 3.4. Kosaraju–Sharir: in a depth-first forest of the reversed quiver whose roots are taken in
decreasing finishing time of a depth-first forest of the quiver, the tree of each root is its
strongly connected component. -/
theorem IsDFSForest.isAncestor_iff_mk_eq_of_rootsByKey
    (h : IsDFSForest (fun a b : V ↦ Nonempty (a ⟶ b)) pre post parent)
    (h' : IsDFSForest (fun a b : V ↦ Nonempty (b ⟶ a)) pre' post' parent')
    (hroot : RootsByKey post pre' parent') {x : V} (hx : parent' x = none) (v : V) :
    IsAncestor parent' x v ↔ StronglyConnectedComponent.mk v = StronglyConnectedComponent.mk x := by
  sorry

/-- 3.5. Tarjan's criterion (Erickson, Lemma 6.4): `v` is the earliest discovered vertex of a sink
component iff `lowLink v = pre v` and every proper descendant `w` has `lowLink w < pre w`. -/
theorem IsDFSForest.isMax_and_le_iff_lowLink
    (h : IsDFSForest (fun a b : V ↦ Nonempty (a ⟶ b)) pre post parent) (v : V) :
    (IsMax (StronglyConnectedComponent.mk v) ∧
      ∀ w, StronglyConnectedComponent.mk w = StronglyConnectedComponent.mk v → pre v ≤ pre w) ↔
    (lowLink (fun a b : V ↦ Nonempty (a ⟶ b)) pre parent v = pre v ∧
      ∀ w, IsAncestor parent v w → w ≠ v →
        lowLink (fun a b : V ↦ Nonempty (a ⟶ b)) pre parent w < pre w) := by
  sorry

end Quiver

/-! ## Layer 4: undirected search, cut vertices and bridges -/

/-- 4.3. The low point of `v` in a simple graph: as `lowLink`, except that an edge from a vertex
to its own parent does not count. -/
noncomputable def lowPoint (G : SimpleGraph V) (pre : V → ℕ) (parent : V → Option V) (v : V) :
    ℕ :=
  sInf (insert (pre v)
    {n | ∃ w x, IsAncestor parent v w ∧ G.Adj w x ∧ parent w ≠ some x ∧ n = pre x})

section SimpleGraph

variable {G : SimpleGraph V} {pre post : V → ℕ} {parent : V → Option V}

/-- 4.1. Undirected search: every edge joins an ancestor and a descendant, so the forest is
normal. -/
theorem IsDFSForest.isAncestor_or_isAncestor_of_adj (h : IsDFSForest G.Adj pre post parent)
    {u v : V} (huv : G.Adj u v) : IsAncestor parent u v ∨ IsAncestor parent v u := by
  sorry

/-- 4.2. For a connected graph the tree edges of a depth-first forest form a spanning tree. -/
theorem IsDFSForest.isTree_fromRel (h : IsDFSForest G.Adj pre post parent) (hG : G.Connected) :
    (SimpleGraph.fromRel fun a b ↦ parent b = some a).IsTree := by
  sorry

/-- 4.4. A root is a cut vertex iff it has at least two distinct children. -/
theorem IsDFSForest.isCutVertex_iff_of_parent_eq_none (h : IsDFSForest G.Adj pre post parent)
    {u : V} (hu : parent u = none) :
    G.IsCutVertex u ↔ ∃ v w, v ≠ w ∧ parent v = some u ∧ parent w = some u := by
  sorry

/-- 4.5. A vertex with a parent is a cut vertex iff some child has low point at least the
vertex's discovery time. -/
theorem IsDFSForest.isCutVertex_iff_of_parent_eq_some (h : IsDFSForest G.Adj pre post parent)
    {u p : V} (hu : parent u = some p) :
    G.IsCutVertex u ↔ ∃ v, parent v = some u ∧ pre u ≤ lowPoint G pre parent v := by
  sorry

/-- 4.6. A tree edge is a bridge iff the child's low point is its own discovery time. -/
theorem IsDFSForest.isBridge_iff (h : IsDFSForest G.Adj pre post parent) {u v : V}
    (hv : parent v = some u) :
    G.IsBridge s(u, v) ↔ lowPoint G pre parent v = pre v := by
  sorry

/-! ## Layer 5: breadth-first layers -/

/-- 5.1. A connected graph is bipartite iff no edge joins two vertices at the same distance from
a fixed vertex `s`. -/
theorem isBipartite_iff_forall_adj_dist_ne (hG : G.Connected) (s : V) :
    G.IsBipartite ↔ ∀ u v, G.Adj u v → G.dist s u ≠ G.dist s v := by
  sorry

end SimpleGraph

end TauCetiRoadmap.GraphSearchStructure

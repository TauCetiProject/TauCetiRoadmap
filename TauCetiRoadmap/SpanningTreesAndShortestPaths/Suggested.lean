import Mathlib
import TauCeti.Combinatorics.Network.Walk

/-!
# Spanning trees, shortest paths and Eulerian graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

The undirected statements are about Mathlib's `SimpleGraph` with a weight `w : Sym2 V → R` on
unordered pairs. The directed statements are about an explicit arrow family `Q : V → V → Type*`
with Tau Ceti's walks `TauCeti.ArrowWalk Q s t` and a weight `w : TauCeti.Assignment Q R` on
arrows.
-/

noncomputable section

open SimpleGraph TauCeti

namespace TauCetiRoadmap.SpanningTreesAndShortestPaths

/-! ## Layer 1: spanning forests and exchange -/

section Forests

variable {V : Type*}

/-- 1.1 A spanning forest of `G`: an acyclic subgraph on the same vertices with the same
reachability relation as `G`, that is, a spanning tree of every connected component. -/
def IsSpanningForest (F G : SimpleGraph V) : Prop :=
  F ≤ G ∧ F.IsAcyclic ∧ F.Reachable = G.Reachable

/-- 1.2 The exchange criterion. Let `F` be a spanning forest of `G`, let `u`, `v` be adjacent in
`G`, and let `p` be the path of `F` from `u` to `v`. For an edge `f` of `F`, removing `f` and
adding the edge `uv` gives a spanning forest of `G` exactly when `f` lies on `p`. -/
theorem isSpanningForest_exchange_iff {F G : SimpleGraph V} (hF : IsSpanningForest F G)
    {u v : V} (huv : G.Adj u v) {f : Sym2 V} (hf : f ∈ F.edgeSet) (p : F.Walk u v)
    (hp : p.IsPath) :
    IsSpanningForest (F.deleteEdges {f} ⊔ edge u v) G ↔ f ∈ p.edges := by
  sorry

/-- 1.3 The symmetric exchange property. For spanning forests `F`, `F'` of `G` and an edge `e` of
`F'` that is not in `F`, there is an edge `f` of `F` that is not in `F'` such that both
`F - f + e` and `F' - e + f` are spanning forests of `G`. -/
theorem IsSpanningForest.exists_symm_exchange {F F' G : SimpleGraph V}
    (hF : IsSpanningForest F G) (hF' : IsSpanningForest F' G) {e : Sym2 V}
    (he : e ∈ F'.edgeSet) (heF : e ∉ F.edgeSet) :
    ∃ f ∈ F.edgeSet, f ∉ F'.edgeSet ∧
      IsSpanningForest (F.deleteEdges {f} ⊔ fromEdgeSet {e}) G ∧
      IsSpanningForest (F'.deleteEdges {e} ⊔ fromEdgeSet {f}) G := by
  sorry

end Forests

/-! ## Layer 2: minimum spanning forests -/

section MinimumSpanningForests

variable {V : Type*} {R : Type*}

/-- 2.1 The weight of a graph for an edge weight `w`: the sum of `w` over its edges. The edge set
is finite whenever `V` is, which every statement about this weight assumes. -/
def totalWeight [AddCommMonoid R] (w : Sym2 V → R) (F : SimpleGraph V) : R :=
  ∑ᶠ e ∈ F.edgeSet, w e

/-- 2.1 A minimum spanning forest of `G` for the weight `w`: a spanning forest whose weight is at
most the weight of every spanning forest of `G`. -/
def IsMinSpanningForest [AddCommMonoid R] [LE R] (w : Sym2 V → R) (F G : SimpleGraph V) : Prop :=
  IsSpanningForest F G ∧ ∀ F', IsSpanningForest F' G → totalWeight w F ≤ totalWeight w F'

section Weak

variable [AddCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]

/-- 2.2 The cut property. An edge `uv` of `G` of least weight among the edges of `G` leaving a set
`S` of vertices lies in some minimum spanning forest. -/
theorem exists_isMinSpanningForest_adj_of_cut [Finite V] (w : Sym2 V → R) (G : SimpleGraph V)
    (S : Set V) {u v : V} (huv : G.Adj u v) (hu : u ∈ S) (hv : v ∉ S)
    (hmin : ∀ ⦃x y : V⦄, G.Adj x y → x ∈ S → y ∉ S → w s(u, v) ≤ w s(x, y)) :
    ∃ F, IsMinSpanningForest w F G ∧ F.Adj u v := by
  sorry

/-- 2.2 The cycle property. An edge of greatest weight on a cycle of `G` is missing from some
minimum spanning forest. -/
theorem exists_isMinSpanningForest_notMem_of_cycle [Finite V] (w : Sym2 V → R)
    (G : SimpleGraph V) {a : V} (c : G.Walk a a) (hc : c.IsCycle) {e : Sym2 V}
    (he : e ∈ c.edges) (hmax : ∀ e' ∈ c.edges, w e' ≤ w e) :
    ∃ F, IsMinSpanningForest w F G ∧ e ∉ F.edgeSet := by
  sorry

/-- 2.5 A colouring of some edges of `G` blue (the first set) and red (the second set) obtained
from the empty colouring by the two greedy rules. Blue rule: for a set `S` of vertices that no
blue edge leaves, colour blue an uncoloured edge of least weight among the uncoloured edges of
`G` leaving `S`. Red rule: for a cycle of `G` without red edges, colour red an uncoloured edge of
greatest weight among the uncoloured edges of the cycle. -/
inductive GreedyColouring (w : Sym2 V → R) (G : SimpleGraph V) :
    Set (Sym2 V) → Set (Sym2 V) → Prop
  | init : GreedyColouring w G ∅ ∅
  | blue {B D : Set (Sym2 V)} (S : Set V) {u v : V} :
      GreedyColouring w G B D → G.Adj u v → u ∈ S → v ∉ S → s(u, v) ∉ D →
      (∀ ⦃x y : V⦄, s(x, y) ∈ B → x ∈ S → y ∈ S) →
      (∀ ⦃x y : V⦄, G.Adj x y → x ∈ S → y ∉ S → s(x, y) ∉ D → w s(u, v) ≤ w s(x, y)) →
      GreedyColouring w G (insert s(u, v) B) D
  | red {B D : Set (Sym2 V)} {a : V} (c : G.Walk a a) {e : Sym2 V} :
      GreedyColouring w G B D → c.IsCycle → e ∈ c.edges → e ∉ B →
      (∀ e' ∈ c.edges, e' ∉ D) →
      (∀ e' ∈ c.edges, e' ∉ B → w e' ≤ w e) →
      GreedyColouring w G B (insert e D)

/-- 2.5 The greedy theorem (the colour invariant). For every colouring obtained by the blue and
red rules there is a minimum spanning forest that contains every blue edge and no red edge. -/
theorem GreedyColouring.exists_isMinSpanningForest [Finite V] {w : Sym2 V → R}
    {G : SimpleGraph V} {B D : Set (Sym2 V)} (h : GreedyColouring w G B D) :
    ∃ F, IsMinSpanningForest w F G ∧ B ⊆ F.edgeSet ∧ Disjoint D F.edgeSet := by
  sorry

/-- 2.6 The Kruskal forest of `G` for a strict order `lt` on unordered pairs: an edge `uv` of `G`
belongs to it exactly when `u` and `v` are not joined by a walk along edges of `G` that precede
`uv`. -/
def kruskalForest (lt : Sym2 V → Sym2 V → Prop) (G : SimpleGraph V) : SimpleGraph V :=
  fromEdgeSet {e | ∃ u v : V, e = s(u, v) ∧ G.Adj u v ∧
    ¬(fromEdgeSet {e' | e' ∈ G.edgeSet ∧ lt e' s(u, v)}).Reachable u v}

/-- 2.6 Kruskal's theorem. If `lt` is a strict total order under which edges of smaller weight
come first, the Kruskal forest is a minimum spanning forest. -/
theorem isMinSpanningForest_kruskalForest [Finite V] (w : Sym2 V → R) (G : SimpleGraph V)
    (lt : Sym2 V → Sym2 V → Prop) [IsStrictTotalOrder (Sym2 V) lt]
    (hlt : ∀ e ∈ G.edgeSet, ∀ e' ∈ G.edgeSet, w e < w e' → lt e e') :
    IsMinSpanningForest w (kruskalForest lt G) G := by
  sorry

end Weak

/-- 2.6 The cut property with ties broken. For an asymmetric relation `lt`, in particular a
strict total order, an edge of `G` leaving a set `S` of vertices that precedes every other edge
of `G` leaving `S` belongs to the Kruskal forest of `lt`. -/
theorem kruskalForest_adj_of_cut (lt : Sym2 V → Sym2 V → Prop) [Std.Asymm lt]
    (G : SimpleGraph V) (S : Set V) {u v : V} (huv : G.Adj u v) (hu : u ∈ S) (hv : v ∉ S)
    (hmin : ∀ ⦃x y : V⦄, G.Adj x y → x ∈ S → y ∉ S → s(x, y) = s(u, v) ∨ lt s(u, v) s(x, y)) :
    (kruskalForest lt G).Adj u v := by
  sorry

section Strict

variable [AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]

/-- 2.3 The cycle criterion. A spanning forest `F` of `G` is minimum exactly when every edge `uv`
of `G` weighs at least as much as every edge of the path of `F` from `u` to `v`. -/
theorem isMinSpanningForest_iff_cycle [Finite V] (w : Sym2 V → R) {F G : SimpleGraph V}
    (hF : IsSpanningForest F G) :
    IsMinSpanningForest w F G ↔
      ∀ ⦃u v : V⦄ (p : F.Walk u v), p.IsPath → G.Adj u v → ∀ f ∈ p.edges, w f ≤ w s(u, v) := by
  sorry

/-- 2.3 The cut criterion. A spanning forest `F` of `G` is minimum exactly when every edge `f` of
`F` weighs at most as much as every edge of `G` whose ends are separated in `F - f`. -/
theorem isMinSpanningForest_iff_cut [Finite V] (w : Sym2 V → R) {F G : SimpleGraph V}
    (hF : IsSpanningForest F G) :
    IsMinSpanningForest w F G ↔
      ∀ f ∈ F.edgeSet, ∀ ⦃u v : V⦄, G.Adj u v → ¬(F.deleteEdges {f}).Reachable u v →
        w f ≤ w s(u, v) := by
  sorry

/-- 2.2 The strict cut property. An edge `uv` of `G` that is strictly lighter than every other
edge of `G` leaving a set `S` of vertices lies in every minimum spanning forest. -/
theorem IsMinSpanningForest.adj_of_cut [Finite V] {w : Sym2 V → R} {F G : SimpleGraph V}
    (hF : IsMinSpanningForest w F G) (S : Set V) {u v : V} (huv : G.Adj u v) (hu : u ∈ S)
    (hv : v ∉ S)
    (hmin : ∀ ⦃x y : V⦄, G.Adj x y → x ∈ S → y ∉ S → s(x, y) ≠ s(u, v) →
      w s(u, v) < w s(x, y)) :
    F.Adj u v := by
  sorry

/-- 2.2 The strict cycle property. An edge that is strictly heavier than every other edge of a
cycle of `G` lies in no minimum spanning forest. -/
theorem IsMinSpanningForest.notMem_of_cycle [Finite V] {w : Sym2 V → R} {F G : SimpleGraph V}
    (hF : IsMinSpanningForest w F G) {a : V} (c : G.Walk a a) (hc : c.IsCycle) {e : Sym2 V}
    (he : e ∈ c.edges) (hmax : ∀ e' ∈ c.edges, e' ≠ e → w e' < w e) :
    e ∉ F.edgeSet := by
  sorry

/-- 2.4 Uniqueness. If the edges of `G` have pairwise different weights, `G` has only one minimum
spanning forest. -/
theorem IsMinSpanningForest.eq_of_injOn [Finite V] {w : Sym2 V → R} {F F' G : SimpleGraph V}
    (hw : Set.InjOn w G.edgeSet) (hF : IsMinSpanningForest w F G)
    (hF' : IsMinSpanningForest w F' G) :
    F = F' := by
  sorry

/-- 2.4 Any two minimum spanning forests have the same number of edges of each weight. -/
theorem IsMinSpanningForest.ncard_weight_eq [Finite V] {w : Sym2 V → R} {F F' G : SimpleGraph V}
    (hF : IsMinSpanningForest w F G) (hF' : IsMinSpanningForest w F' G) (r : R) :
    {e | e ∈ F.edgeSet ∧ w e = r}.ncard = {e | e ∈ F'.edgeSet ∧ w e = r}.ncard := by
  sorry

/-- 2.4 The minimax property. Every edge of the path of a minimum spanning forest between two
vertices weighs at most as much as some edge of any given walk of `G` between them. -/
theorem IsMinSpanningForest.exists_le_of_mem_edges [Finite V] {w : Sym2 V → R}
    {F G : SimpleGraph V} (hF : IsMinSpanningForest w F G) {u v : V} (p : F.Walk u v)
    (hp : p.IsPath) (q : G.Walk u v) :
    ∀ f ∈ p.edges, ∃ g ∈ q.edges, w f ≤ w g := by
  sorry

end Strict

end MinimumSpanningForests

/-! ## Layer 3: shortest walks and potentials -/

section ShortestWalks

variable {V : Type*} {Q : V → V → Type*} {R : Type*}

/-- 3.1 The weight of a walk, the sum of the weights of the arrows it traverses, with
repetitions: Mathlib's `Quiver.Path.addWeight` for the quiver whose arrows are `Q`, abbreviated
for an arrow family in the way `TauCeti.ArrowWalk.length` abbreviates `Quiver.Path.length`. -/
abbrev walkWeight [AddMonoid R] (w : Assignment Q R) {s t : V} (p : ArrowWalk Q s t) : R :=
  @Quiver.Path.addWeight V ⟨Q⟩ R _ (fun {_ _} e => w e) s t p

/-- 3.1 A shortest walk: one whose weight is at most the weight of every walk with the same
ends. -/
def IsShortest [AddCommMonoid R] [LE R] (w : Assignment Q R) {s t : V} (p : ArrowWalk Q s t) :
    Prop :=
  ∀ q : ArrowWalk Q s t, walkWeight w p ≤ walkWeight w q

/-- 3.1 A weight is conservative when no closed walk has negative weight. -/
def IsConservative [AddCommMonoid R] [LE R] (w : Assignment Q R) : Prop :=
  ∀ ⦃v : V⦄ (c : ArrowWalk Q v v), 0 ≤ walkWeight w c

/-- 3.1 The distance from `s` to `t`, as a relation: `x` is the least weight of a walk from `s` to
`t`, and `⊤` when there is no such walk. No `x` satisfies it when the weights of the walks from
`s` to `t` have no least element. -/
def IsDist [AddCommMonoid R] [LE R] (w : Assignment Q R) (s t : V) (x : WithTop R) : Prop :=
  IsLeast (insert ⊤ (Set.range fun p : ArrowWalk Q s t => ((walkWeight w p : R) : WithTop R))) x

/-- 3.3 A potential for `w`: a function on vertices that rises along every arrow by at most the
weight of the arrow. -/
def IsPotential [Add R] [LE R] (w : Assignment Q R) (y : V → R) : Prop :=
  ∀ ⦃u v : V⦄ (e : Q u v), y v ≤ y u + w e

/-- 3.4 The Bellman equations at the source `s` for a function `y` with values in `WithTop R`:
`y s = 0` and, for `v ≠ s`, `y v` is the least of the values `y u + w e` over the arrows
`e : u ⟶ v`, and `⊤` when there is no such arrow. -/
def IsBellman [AddCommMonoid R] [LE R] (w : Assignment Q R) (s : V) (y : V → WithTop R) : Prop :=
  y s = 0 ∧ ∀ v, v ≠ s →
    (∀ ⦃u : V⦄ (e : Q u v), y v ≤ y u + (w e : WithTop R)) ∧
    (y v = ⊤ ∨ ∃ (u : V) (e : Q u v), y v = y u + (w e : WithTop R))

section Monoid

variable [AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]

/-- 3.2 Existence of shortest walks. On a finite arrow family, if `t` can be reached from `s` and
no closed walk at a vertex lying on a walk from `s` to `t` has negative weight, then some path
from `s` to `t` is a shortest walk. -/
theorem exists_isPath_isShortest [Finite V] [∀ x y, Finite (Q x y)] (w : Assignment Q R)
    {s t : V} (hst : Nonempty (ArrowWalk Q s t))
    (hw : ∀ ⦃v : V⦄ (c : ArrowWalk Q v v), Nonempty (ArrowWalk Q s v) →
      Nonempty (ArrowWalk Q v t) → 0 ≤ walkWeight w c) :
    ∃ p : ArrowWalk Q s t, p.IsPath ∧ IsShortest w p := by
  sorry

/-- 3.2 On a finite arrow family, every pair of vertices has a distance exactly when the weight
is conservative. -/
theorem forall_exists_isDist_iff [Finite V] [∀ x y, Finite (Q x y)] (w : Assignment Q R) :
    (∀ s t : V, ∃ x, IsDist w s t x) ↔ IsConservative w := by
  sorry

/-- 3.3 A finite arrow family has a potential exactly when its weight is conservative. -/
theorem exists_isPotential_iff [Finite V] [∀ x y, Finite (Q x y)] (w : Assignment Q R) :
    (∃ y : V → R, IsPotential w y) ↔ IsConservative w := by
  sorry

/-- 3.4 The distances from `s`, when they exist, solve the Bellman equations. -/
theorem isBellman_of_isDist (w : Assignment Q R) {s : V} {d : V → WithTop R}
    (hd : ∀ v, IsDist w s v (d v)) :
    IsBellman w s d := by
  sorry

/-- 3.4 Uniqueness for the Bellman equations. On a finite vertex type, if every closed walk of
positive length has positive weight, a solution of the Bellman equations at `s` is the distance
from `s`. -/
theorem IsBellman.isDist [Finite V] {w : Assignment Q R}
    (hpos : ∀ ⦃v : V⦄ (c : ArrowWalk Q v v), 0 < c.length → 0 < walkWeight w c) {s : V}
    {y : V → WithTop R} (hy : IsBellman w s y) (v : V) :
    IsDist w s v (y v) := by
  sorry

/-- 3.5 The invariant behind Dijkstra's method. For nonnegative weights with distances `d` from
`s`, let `S` be a set of vertices containing `s` and let `e : u ⟶ v` minimise `d u + w e` among
the arrows leaving `S`. Then `d v = d u + w e`. -/
theorem isDist_eq_add_of_min_leaving {w : Assignment Q R} (hw : ∀ ⦃x y : V⦄ (e : Q x y), 0 ≤ w e)
    {s : V} {d : V → WithTop R} (hd : ∀ v, IsDist w s v (d v)) (S : Set V) (hs : s ∈ S)
    {u v : V} (e : Q u v) (hu : u ∈ S) (hv : v ∉ S)
    (hmin : ∀ ⦃x y : V⦄ (e' : Q x y), x ∈ S → y ∉ S →
      d u + (w e : WithTop R) ≤ d x + (w e' : WithTop R)) :
    d v = d u + (w e : WithTop R) := by
  sorry

/-- 3.6 Shortest-path trees. On a finite arrow family, if no closed walk at a vertex reachable
from `s` has negative weight, there is a set `T` of arrows such that every vertex reachable from
`s` is the end of exactly one walk from `s` along arrows of `T`, and that walk is shortest. -/
theorem exists_shortestPathTree [Finite V] [∀ x y, Finite (Q x y)] (w : Assignment Q R) (s : V)
    (hw : ∀ ⦃v : V⦄ (c : ArrowWalk Q v v), Nonempty (ArrowWalk Q s v) → 0 ≤ walkWeight w c) :
    ∃ T : Set (Σ x y, Q x y), ∀ v : V, Nonempty (ArrowWalk Q s v) →
      ∃ p : ArrowWalk Q s v, (∀ a ∈ p.arrows, a ∈ T) ∧ IsShortest w p ∧
        ∀ q : ArrowWalk Q s v, (∀ a ∈ q.arrows, a ∈ T) → q = p := by
  sorry

end Monoid

section MinPlus

variable [AddCancelCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]

/-- 3.7 The min-plus matrix of a weight on a finite arrow family: the entry at `(u, v)` is the
least weight of an arrow from `u` to `v`, and `⊤` (the zero of the tropical semiring) when there
is none. -/
def arcMatrix [∀ x y, Fintype (Q x y)] (w : Assignment Q R) :
    Matrix V V (MinTropical (WithTop R)) :=
  fun u v => ∑ e : Q u v, MinTropical.trop (w e : WithTop R)

/-- 3.7 Min-plus powers. The `(s, t)` entry of the `k`-th power of `1 + arcMatrix w` is the least
weight of a walk from `s` to `t` with at most `k` arrows, and `⊤` when there is none. -/
theorem isLeast_untrop_one_add_arcMatrix_pow [Fintype V] [DecidableEq V]
    [∀ x y, Fintype (Q x y)] (w : Assignment Q R) (k : ℕ) (s t : V) :
    IsLeast
      (insert ⊤ (Set.range fun p : {p : ArrowWalk Q s t // p.length ≤ k} =>
        ((walkWeight w p.1 : R) : WithTop R)))
      (MinTropical.untrop (((1 + arcMatrix w) ^ k) s t)) := by
  sorry

/-- 3.7 Stabilisation. With `n` vertices, the row of `s` in the `n`-th power of
`1 + arcMatrix w` equals its row in the `(n - 1)`-st power exactly when no closed walk at a vertex
reachable from `s` has negative weight. -/
theorem one_add_arcMatrix_pow_card_eq_iff [Fintype V] [DecidableEq V] [∀ x y, Fintype (Q x y)]
    (w : Assignment Q R) (s : V) :
    (∀ t, ((1 + arcMatrix w) ^ Fintype.card V) s t =
        ((1 + arcMatrix w) ^ (Fintype.card V - 1)) s t) ↔
      ∀ ⦃v : V⦄ (c : ArrowWalk Q v v), Nonempty (ArrowWalk Q s v) → 0 ≤ walkWeight w c := by
  sorry

end MinPlus

/-- 3.3 Duality between shortest walks and potentials. For a conservative weight with values in a
linearly ordered commutative group on a finite arrow family, the greatest rise `y t - y s` of a
potential `y` from `s` to `t` is the weight of a shortest walk from `s` to `t`. -/
theorem isGreatest_isPotential_sub [AddCommGroup R] [LinearOrder R] [IsOrderedAddMonoid R]
    [Finite V] [∀ x y, Finite (Q x y)] {w : Assignment Q R} (hw : IsConservative w) {s t : V}
    (p : ArrowWalk Q s t) (hp : IsShortest w p) :
    IsGreatest {x : R | ∃ y : V → R, IsPotential w y ∧ y t - y s = x} (walkWeight w p) := by
  sorry

end ShortestWalks

/-! ## Layer 4: Eulerian trails and cycle decompositions -/

section Euler

variable {V : Type*} [Fintype V]

/-- 4.1 Euler's theorem. A finite graph on a nonempty vertex type has a closed walk traversing
every edge exactly once exactly when every degree is even and any two vertices of positive degree
are joined by a walk. -/
theorem exists_isEulerian_circuit_iff [DecidableEq V] [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    (∃ (u : V) (p : G.Walk u u), p.IsEulerian) ↔
      (∀ v, Even (G.degree v)) ∧
        ∀ u v, G.degree u ≠ 0 → G.degree v ≠ 0 → G.Reachable u v := by
  sorry

/-- 4.1 Eulerian trails. For distinct vertices `u`, `v` of a finite graph, a walk from `u` to `v`
traversing every edge exactly once exists exactly when `u` and `v` are the vertices of odd degree
and any two vertices of positive degree are joined by a walk. -/
theorem exists_isEulerian_trail_iff [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {u v : V} (huv : u ≠ v) :
    (∃ p : G.Walk u v, p.IsEulerian) ↔
      (∀ x, Odd (G.degree x) ↔ x = u ∨ x = v) ∧
        ∀ x y, G.degree x ≠ 0 → G.degree y ≠ 0 → G.Reachable x y := by
  sorry

/-- 4.2 Veblen's theorem. Every degree of a finite graph is even exactly when its edge set is a
disjoint union of edge sets of cycles. -/
theorem forall_even_degree_iff_exists_cycle_partition (G : SimpleGraph V) [DecidableRel G.Adj] :
    (∀ v, Even (G.degree v)) ↔
      ∃ C : Set (Set (Sym2 V)),
        (∀ D ∈ C, ∃ (v : V) (c : G.Walk v v), c.IsCycle ∧ c.edgeSet = D) ∧
        C.PairwiseDisjoint id ∧ ⋃₀ C = G.edgeSet := by
  sorry

end Euler

/-! ## Layer 5: counting labelled trees -/

section Counting

variable {V : Type*}

/-- 5.1 The Prüfer correspondence. On a finite type with `n ≥ 2` elements, the trees correspond
bijectively to the sequences of `n - 2` vertices, in such a way that every vertex occurs in the
sequence of a tree one time fewer than its degree in the tree. -/
theorem exists_equiv_isTree_pruferCode [Fintype V] (hV : 2 ≤ Fintype.card V) :
    ∃ φ : {T : SimpleGraph V // T.IsTree} ≃ (Fin (Fintype.card V - 2) → V),
      ∀ (T : {T : SimpleGraph V // T.IsTree}) (v : V),
        {i | φ T i = v}.ncard + 1 = (T.1.neighborSet v).ncard := by
  sorry

/-- 5.2 Cayley's formula. A nonempty finite type with `n` elements carries `n ^ (n - 2)` trees. -/
theorem card_isTree [Finite V] [Nonempty V] :
    Nat.card {T : SimpleGraph V // T.IsTree} = Nat.card V ^ (Nat.card V - 2) := by
  sorry

/-- 5.2 Trees with prescribed degrees. For positive integers `d v` with sum `2 (n - 1)` on a type
with `n` elements, the number of trees in which every vertex `v` has degree `d v` is the
multinomial coefficient of the numbers `d v - 1`. -/
theorem card_isTree_degree_eq [Fintype V] (d : V → ℕ) (hd : ∀ v, 1 ≤ d v)
    (hsum : (∑ v, d v) + 2 = 2 * Fintype.card V) :
    Nat.card {T : SimpleGraph V // T.IsTree ∧ ∀ v, (T.neighborSet v).ncard = d v} =
      Nat.multinomial Finset.univ fun v => d v - 1 := by
  sorry

end Counting

end TauCetiRoadmap.SpanningTreesAndShortestPaths

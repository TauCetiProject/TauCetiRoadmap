import Mathlib

/-!
# Finite graph connectivity: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for the load-bearing structures and a few milestone
statements, so that contributors and reviewers converge on names and shapes. Discharging every
declaration here finishes neither a milestone nor the roadmap. `sorry` is allowed in this
human-owned roadmap library: these are targets, not completed definitions or proofs.

The pinned choices this file exhibits: finite capacities and flows use a linearly ordered additive
commutative group `K`; a directed network is a *term* `N : Network C V` whose `Quiver` instance
lives on the type synonym `N.Vert`, with arrow types in a universe independent of the vertex
universe, and whose capacity type `C` is `K` for an ordinary network and `WithTop K` for an
extended one, so that assignments, divergence, and cut capacity are defined once; the residual
network has the flow-independent arrow type `N.Hom v w ⊕ N.Hom w v`, and an augmenting path is a
path in its positive-capacity part; flows on an extended network are finite `K`-valued and reach
the finite theory by truncation rather than extended subtraction; integrality is stated for an
additive subgroup of `K`; an orientation of a simple graph is a choice of `Dart` per edge, with its
quiver instance on the synonym `G.Oriented o`; ear decompositions are data, here terms of one
inductive type family indexed by the subgraph built so far, while the roadmap pins their observable
prefix API rather than this representation; connectivity predicates are primary, following
Mathlib's `IsEdgeConnected` and the shape of Mathlib proposal #33355 for vertex connectivity, with
derived `ℕ∞`-valued invariants; Menger is stated in witness form; and every sum is a `Finset.sum`.

Namespaces: in Tau Ceti, new declarations about simple graphs live in `SimpleGraph`, including
the vertex-connectivity predicates under the names of #33355. Here those two predicates are
stand-ins in this roadmap's namespace only so that this file keeps compiling when Mathlib lands
them; everything else about simple graphs is already in `SimpleGraph`.
-/

open Finset

universe u v w

namespace TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Directed networks (Conventions; Milestones 1, 3, 4, 8) -/

/-- A directed network with capacities in `C`: an arrow type for every ordered pair of vertices, a
capacity for every arrow, and its nonnegativity. `C` is the coefficient type `K` for an ordinary
network and `WithTop K` for an extended one. Parallel arrows, antiparallel arrows, loops, and zero
capacities are allowed. Networks are terms; the quiver instance lives on `Network.Vert`. -/
structure Network (C : Type w) (V : Type u) [Zero C] [LE C] where
  Hom : V → V → Type v
  cap : ∀ {v w : V}, Hom v w → C
  cap_nonneg : ∀ {v w : V} (e : Hom v w), 0 ≤ cap e

variable {V : Type u}

section AnyCapacity

variable {C : Type w} [AddCommMonoid C] [PartialOrder C]

/-- Type synonym carrying the quiver instance of a network, as `Quiver.Symmetrify` does. -/
def Network.Vert (_N : Network C V) : Type u := V

instance (N : Network C V) : Quiver N.Vert := ⟨N.Hom⟩

/-- View a vertex as a vertex of the network's quiver. -/
def Network.toVert (_N : Network C V) (v : V) : _N.Vert := v

/-- Directed reachability in a network, through Mathlib's `Quiver.Path`. -/
def Network.Reachable (N : Network C V) (v w : V) : Prop :=
  Nonempty (Quiver.Path (N.toVert v) (N.toVert w))

/-- The subnetwork of arrows with positive capacity. -/
def Network.positivePart (N : Network C V) : Network C V where
  Hom v w := {e : N.Hom v w // 0 < N.cap e}
  cap e := N.cap e.1
  cap_nonneg e := N.cap_nonneg e.1

/-- An assignment of values in `K` to the arrows of a network; the value type is independent of
the capacity type. -/
abbrev Network.Assignment (N : Network C V) (K : Type w) :=
  ∀ {v w : V}, N.Hom v w → K

/-- Replace the capacities while retaining exactly the same arrow types. -/
abbrev Network.withCap {C' : Type w} [AddCommMonoid C'] [PartialOrder C'] (N : Network C V)
    (cap : N.Assignment C') (cap_nonneg : ∀ {v w : V} (e : N.Hom v w), 0 ≤ cap e) :
    Network C' V where
  Hom := N.Hom
  cap := cap
  cap_nonneg := cap_nonneg

/-- Capacity replacement is extensional in the new capacity function. -/
theorem Network.withCap_congr {C' : Type w} [AddCommMonoid C'] [PartialOrder C']
    (N : Network C V) {cap cap' : N.Assignment C'}
    (hcap : ∀ {v w : V} (e : N.Hom v w), 0 ≤ cap e)
    (hcap' : ∀ {v w : V} (e : N.Hom v w), 0 ≤ cap' e)
    (h : ∀ {v w : V} (e : N.Hom v w), cap e = cap' e) :
    N.withCap cap hcap = N.withCap cap' hcap' := by
  sorry

section Finite

variable (N : Network C V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (N.Hom v w)]

/-- Divergence: outgoing minus incoming flow, in any additive group of values. -/
noncomputable def Network.divergence {K : Type w} [AddCommGroup K] (f : N.Assignment K) (v : V) :
    K :=
  ∑ w, ∑ e : N.Hom v w, f e - ∑ w, ∑ e : N.Hom w v, f e

/-- Capacity of the cut with source side `S`: the total capacity of arrows leaving `S`. -/
noncomputable def Network.cutCapacity (S : Finset V) : C :=
  ∑ v ∈ S, ∑ w ∈ Sᶜ, ∑ e : N.Hom v w, N.cap e

end Finite

end AnyCapacity

variable {K : Type w} [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]

section Finite

variable (N : Network K V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (N.Hom v w)]

/-- An `s–t` flow: nonnegative, capacity-respecting, conserved away from the terminals.
Arrows into `s` and out of `t` are allowed. -/
structure Network.Flow (s t : V) where
  toFun : N.Assignment K
  nonneg : ∀ {v w : V} (e : N.Hom v w), 0 ≤ toFun e
  le_cap : ∀ {v w : V} (e : N.Hom v w), toFun e ≤ N.cap e
  conserve : ∀ v, v ≠ s → v ≠ t → N.divergence toFun v = 0

variable {N} {s t : V}

/-- A feasible flow remains feasible after pointwise enlargement of the capacities. -/
noncomputable def Network.Flow.monoCap (f : N.Flow s t) {cap : N.Assignment K}
    (hcap : ∀ {v w : V} (e : N.Hom v w), 0 ≤ cap e)
    (h : ∀ {v w : V} (e : N.Hom v w), N.cap e ≤ cap e) :
    (N.withCap cap hcap).Flow s t where
  toFun := f.toFun
  nonneg := f.nonneg
  le_cap e := (f.le_cap e).trans (h e)
  conserve := f.conserve

/-- The value of a flow is its divergence at the source. -/
noncomputable def Network.Flow.value (f : N.Flow s t) : K :=
  N.divergence f.toFun s

/-- The residual network. Its arrow type does not depend on `f`: a forward arrow keeps the
unused capacity `u e − f e`, a reverse arrow carries the cancellable flow `f e`, and arrows of
zero residual capacity are ordinary arrows. -/
noncomputable def Network.residual (f : N.Flow s t) : Network K V where
  Hom v w := N.Hom v w ⊕ N.Hom w v
  cap := Sum.elim (fun e => N.cap e - f.toFun e) (fun e => f.toFun e)
  cap_nonneg e := by
    cases e with
    | inl e => exact sub_nonneg.mpr (f.le_cap e)
    | inr e => exact f.nonneg e

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

/-- Integrality in its intrinsic form: capacities in an additive subgroup `H` of `K` admit a
maximum flow with all arrow values in `H`. Natural-number capacities in `ℤ`, `ℚ`, or `ℝ` are the
case `H = AddSubgroup.zmultiples 1`, restated with `ℕ`-casts. -/
theorem Network.exists_max_flow_mem_addSubgroup (hst : s ≠ t) (H : AddSubgroup K)
    (hcap : ∀ {v w : V} (e : N.Hom v w), N.cap e ∈ H) :
    ∃ f : N.Flow s t, (∀ {v w : V} (e : N.Hom v w), f.toFun e ∈ H) ∧
      ∀ g : N.Flow s t, g.value ≤ f.value := by
  sorry

open Classical in
/-- For any maximum flow, the vertices reachable from `s` along residual arrows of positive
capacity form a minimum-cut source side, and it is contained in every minimum-cut source side. -/
theorem Network.Flow.residualReachable_isMinCut (hst : s ≠ t) (f : N.Flow s t)
    (hf : ∀ g : N.Flow s t, g.value ≤ f.value) :
    N.cutCapacity (univ.filter fun v => (N.residual f).positivePart.Reachable s v) = f.value ∧
      ∀ S : Finset V, s ∈ S → t ∉ S → N.cutCapacity S = f.value →
        (univ.filter fun v => (N.residual f).positivePart.Reachable s v) ⊆ S := by
  sorry

/-- A circulation with lower bounds `lo` and upper bounds `N.cap`, conserved at every vertex. -/
structure Network.BoundedCirculation (lo : N.Assignment K) where
  toFun : N.Assignment K
  lo_le : ∀ {v w : V} (e : N.Hom v w), lo e ≤ toFun e
  le_cap : ∀ {v w : V} (e : N.Hom v w), toFun e ≤ N.cap e
  conserve : ∀ v, N.divergence toFun v = 0

/-- Hoffman's circulation theorem: `ℓ(δ⁻(S)) ≤ u(δ⁺(S))` for every vertex set `S`. -/
theorem Network.nonempty_boundedCirculation_iff (lo : N.Assignment K)
    (hlo0 : ∀ {v w : V} (e : N.Hom v w), 0 ≤ lo e)
    (hlo : ∀ {v w : V} (e : N.Hom v w), lo e ≤ N.cap e) :
    Nonempty (N.BoundedCirculation lo) ↔
      ∀ S : Finset V, ∑ v ∈ Sᶜ, ∑ w ∈ S, ∑ e : N.Hom v w, lo e ≤ N.cutCapacity S := by
  sorry

end Finite

/-! ## Extended capacities (Milestone 3)

An extended network is a `Network (WithTop K) V`; assignments, divergence, and cut capacity are
the ones above. Only its flows need a separate structure, since they stay `K`-valued. -/

/-- Regard every finite capacity as an extended capacity. -/
abbrev Network.toExtended (N : Network K V) : Network (WithTop K) V :=
  N.withCap (fun e => (N.cap e : WithTop K)) fun e => WithTop.coe_nonneg.mpr (N.cap_nonneg e)

/-- Replace every infinite capacity by the nonnegative finite bound `B`, leaving finite capacities
unchanged. -/
abbrev Network.truncate (E : Network (WithTop K) V) (B : K) (hB : 0 ≤ B) : Network K V :=
  E.withCap (fun e => (E.cap e).untopD B) fun e => by
    sorry

section Extended

variable (E : Network (WithTop K) V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (E.Hom v w)]

/-- A finite flow subject to possibly infinite capacities. -/
structure Network.FiniteFlow (s t : V) where
  toFun : E.Assignment K
  nonneg : ∀ {v w : V} (e : E.Hom v w), 0 ≤ toFun e
  le_cap : ∀ {v w : V} (e : E.Hom v w), (toFun e : WithTop K) ≤ E.cap e
  conserve : ∀ v, v ≠ s → v ≠ t → E.divergence toFun v = 0

variable {E} {s t : V}

noncomputable def Network.FiniteFlow.value (f : E.FiniteFlow s t) : K :=
  E.divergence f.toFun s

/-- A flow on a truncation is a finite flow on the extended network. -/
noncomputable def Network.Flow.toFiniteFlow {B : K} {hB : 0 ≤ B}
    (f : (E.truncate B hB).Flow s t) : E.FiniteFlow s t where
  toFun := f.toFun
  nonneg := f.nonneg
  le_cap e := by
    sorry
  conserve := f.conserve

/-- Weak duality compares a finite flow value with an extended cut capacity. -/
theorem Network.FiniteFlow.value_le_cutCapacity (f : E.FiniteFlow s t) {S : Finset V}
    (hs : s ∈ S) (ht : t ∉ S) : (f.value : WithTop K) ≤ E.cutCapacity S := by
  sorry

/-- If a finite terminal-separating cut exists, a finite maximum flow and an extended minimum cut
attain the same finite value. The implementation truncates every `⊤` capacity at the capacity of
the supplied finite cut and invokes finite max-flow/min-cut. -/
theorem Network.exists_finiteFlow_cut_value_eq_of_exists_finite_cut (hst : s ≠ t)
    (hfinite : ∃ S : Finset V, s ∈ S ∧ t ∉ S ∧ E.cutCapacity S ≠ ⊤) :
    ∃ (f : E.FiniteFlow s t) (S : Finset V),
      s ∈ S ∧ t ∉ S ∧ (f.value : WithTop K) = E.cutCapacity S := by
  sorry

/-- If every terminal-separating cut has infinite capacity, finite feasible flow values are
unbounded above. -/
theorem Network.finiteFlow_values_unbounded_of_forall_cutCapacity_eq_top (hst : s ≠ t)
    (hinfinite : ∀ S : Finset V, s ∈ S → t ∉ S → E.cutCapacity S = ⊤) :
    ∀ b : K, ∃ f : E.FiniteFlow s t, b ≤ f.value := by
  sorry

end Extended

/-! ## Stand-ins for Mathlib proposal #33355 (Conventions) -/

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

end TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Undirected connectivity (Milestones 1, 2, 5, 6, 7) -/

namespace SimpleGraph

open TauCetiRoadmap.FiniteGraphConnectivity

variable {V : Type u} (G : SimpleGraph V)

open Classical in
/-- The largest natural threshold at which `G` is vertex-connected, as an extended natural.
The empty-carrier convention is zero. The predicates remain the primary interface. -/
noncomputable def vertexConnectivity [Finite V] : ℕ∞ :=
  ⨆ k : ℕ, if IsVertexConnected G (k : ℕ∞) then (k : ℕ∞) else 0

open Classical in
/-- The largest natural threshold at which `G` is edge-connected, as an extended natural.
This is `⊤` on a subsingleton carrier. The predicates remain the primary interface. -/
noncomputable def edgeConnectivity [Finite V] : ℕ∞ :=
  ⨆ k : ℕ, if G.IsEdgeConnected k then (k : ℕ∞) else 0

/-- On a nonempty finite carrier, numerical vertex connectivity records exactly the valid
thresholds. -/
theorem isVertexConnected_iff_le_vertexConnectivity [Finite V] [Nonempty V] (k : ℕ) :
    IsVertexConnected G k ↔ (k : ℕ∞) ≤ G.vertexConnectivity := by
  sorry

/-- Numerical edge connectivity records exactly the valid thresholds, including the value `⊤`
on subsingleton carriers. -/
theorem isEdgeConnected_iff_le_edgeConnectivity [Finite V] (k : ℕ) :
    G.IsEdgeConnected k ↔ (k : ℕ∞) ≤ G.edgeConnectivity := by
  sorry

theorem edgeConnectivity_eq_top_iff [Finite V] :
    G.edgeConnectivity = ⊤ ↔ Subsingleton V := by
  sorry

theorem vertexConnectivity_ne_top [Finite V] : G.vertexConnectivity ≠ ⊤ := by
  sorry

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
        (Pairwise fun i j => G.InternallyDisjoint (P i) (P j)) ∧
      X.ncard = k ∧ ∃ (hs : s ∉ X) (ht : t ∉ X), ¬ (G.induce Xᶜ).Reachable ⟨s, hs⟩ ⟨t, ht⟩ := by
  sorry

/-- Local vertex Menger, predicate form, for nonadjacent terminals. -/
theorem isVertexReachable_iff_exists_paths [Finite V] {s t : V} (hst : s ≠ t)
    (hadj : ¬ G.Adj s t) (k : ℕ) :
    IsVertexReachable G k s t ↔
      ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => G.InternallyDisjoint (P i) (P j) := by
  sorry

/-- Local edge Menger, predicate form, against Mathlib's `IsEdgeReachable`. -/
theorem isEdgeReachable_iff_exists_paths [Finite V] {s t : V} (hst : s ≠ t) (k : ℕ) :
    G.IsEdgeReachable k s t ↔
      ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => G.EdgeDisjoint (P i) (P j) := by
  sorry

/-- Global vertex Menger: on more than `k` vertices, `k`-vertex-connectivity is `k` internally
disjoint paths between every pair of distinct vertices, adjacent pairs included. -/
theorem isVertexConnected_iff_forall_exists_paths [Fintype V] (k : ℕ) (hk : k < Fintype.card V) :
    IsVertexConnected G k ↔
      ∀ s t, s ≠ t → ∃ P : Fin k → G.Walk s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => G.InternallyDisjoint (P i) (P j) := by
  sorry

/-- Whitney's inequalities in predicate form. -/
theorem isEdgeConnected_of_isVertexConnected [Finite V] {k : ℕ} (h : IsVertexConnected G k) :
    G.IsEdgeConnected k := by
  sorry

theorem le_minDegree_of_isEdgeConnected [Fintype V] [DecidableRel G.Adj] [Nontrivial V] {k : ℕ}
    (h : G.IsEdgeConnected k) : k ≤ G.minDegree := by
  sorry

/-- Whitney's inequalities for the derived numerical invariants. -/
theorem vertexConnectivity_le_edgeConnectivity [Finite V] :
    G.vertexConnectivity ≤ G.edgeConnectivity := by
  sorry

theorem edgeConnectivity_le_minDegree [Fintype V] [DecidableRel G.Adj] [Nontrivial V] :
    G.edgeConnectivity ≤ (G.minDegree : ℕ∞) := by
  sorry

/-- An articulation vertex separates two other vertices. The component-count form is a lemma. -/
def IsCutVertex (v : V) : Prop :=
  ∃ u w, ∃ (hu : u ≠ v) (hw : w ≠ v),
    G.Reachable u w ∧ ¬ (G.induce {v}ᶜ).Reachable ⟨u, hu⟩ ⟨w, hw⟩

/-- A block: a maximal vertex set inducing a connected graph without articulation vertices. -/
def IsBlock (B : Set V) : Prop :=
  Maximal (fun B : Set V => (G.induce B).Connected ∧ ∀ v, ¬ (G.induce B).IsCutVertex v) B

/-- Whether a displayed ear is open or closed. -/
inductive EarKind
  | open
  | closed

/-- One possible representation of open ear decompositions as data. The roadmap requires the
prefix API below, but does not require this inductive representation. It starts from a cycle and
adds paths whose distinct endpoints lie in the subgraph so far, whose interior vertices are new,
and whose edges are new. Single-edge ears are allowed. -/
inductive OpenEarDecomposition : G.Subgraph → Type u
  | cycle {u : V} (c : G.Walk u u) (hc : c.IsCycle) : OpenEarDecomposition c.toSubgraph
  | ear {H : G.Subgraph} (d : OpenEarDecomposition H) {u v : V} (p : G.Walk u v) (hp : p.IsPath)
      (hu : u ∈ H.verts) (hv : v ∈ H.verts) (huv : u ≠ v)
      (hint : ∀ w ∈ p.support, w ≠ u → w ≠ v → w ∉ H.verts)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet) : OpenEarDecomposition (H ⊔ p.toSubgraph)

/-- The number of ears; one of the functions of the decomposition the API is built on. -/
def OpenEarDecomposition.length : ∀ {H : G.Subgraph}, G.OpenEarDecomposition H → ℕ
  | _, .cycle _ _ => 0
  | _, .ear d _ _ _ _ _ _ _ => d.length + 1

/-- The initial cycle, exposed independently of the internal representation. -/
noncomputable def OpenEarDecomposition.initialCycle {H : G.Subgraph}
    (_d : G.OpenEarDecomposition H) : Σ u : V, G.Walk u u := by
  sorry

/-- The `k`-th ear, including its endpoints and underlying path. -/
noncomputable def OpenEarDecomposition.earAt {H : G.Subgraph} (d : G.OpenEarDecomposition H)
    (_k : Fin d.length) : Σ u v : V, G.Walk u v := by
  sorry

/-- The subgraph built after a prefix of the ears. Index zero is the initial cycle and the last
index is the final subgraph. -/
noncomputable def OpenEarDecomposition.subgraphAfter {H : G.Subgraph}
    (d : G.OpenEarDecomposition H) (_k : Fin (d.length + 1)) : G.Subgraph := by
  sorry

/-- Every initial segment is itself an ear decomposition of its displayed subgraph. -/
noncomputable def OpenEarDecomposition.prefix {H : G.Subgraph} (d : G.OpenEarDecomposition H)
    (k : Fin (d.length + 1)) :
    G.OpenEarDecomposition (OpenEarDecomposition.subgraphAfter G d k) := by
  sorry

theorem OpenEarDecomposition.subgraphAfter_last {H : G.Subgraph}
    (d : G.OpenEarDecomposition H) :
    OpenEarDecomposition.subgraphAfter G d ⟨d.length, Nat.lt_succ_self _⟩ = H := by
  sorry

/-- One possible representation of ear decompositions with closed ears allowed. It starts from a
single vertex and adds open ears as above or closed ears, cycles meeting the subgraph so far in
exactly their base vertex. The required public interface is the same prefix API as above. -/
inductive EarDecomposition : G.Subgraph → Type u
  | vertex (v : V) : EarDecomposition (G.singletonSubgraph v)
  | openEar {H : G.Subgraph} (d : EarDecomposition H) {u v : V} (p : G.Walk u v) (hp : p.IsPath)
      (hu : u ∈ H.verts) (hv : v ∈ H.verts) (huv : u ≠ v)
      (hint : ∀ w ∈ p.support, w ≠ u → w ≠ v → w ∉ H.verts)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet) : EarDecomposition (H ⊔ p.toSubgraph)
  | closedEar {H : G.Subgraph} (d : EarDecomposition H) {u : V} (c : G.Walk u u) (hc : c.IsCycle)
      (hu : u ∈ H.verts) (hint : ∀ w ∈ c.support, w ≠ u → w ∉ H.verts) :
      EarDecomposition (H ⊔ c.toSubgraph)

noncomputable def EarDecomposition.length {H : G.Subgraph}
    (_d : G.EarDecomposition H) : ℕ := by
  sorry

noncomputable def EarDecomposition.initialVertex {H : G.Subgraph}
    (_d : G.EarDecomposition H) : V := by
  sorry

noncomputable def EarDecomposition.earAt {H : G.Subgraph} (d : G.EarDecomposition H)
    (_k : Fin d.length) : Σ u v : V, G.Walk u v := by
  sorry

noncomputable def EarDecomposition.kindAt {H : G.Subgraph} (d : G.EarDecomposition H)
    (_k : Fin d.length) : EarKind := by
  sorry

noncomputable def EarDecomposition.subgraphAfter {H : G.Subgraph}
    (d : G.EarDecomposition H) (_k : Fin (d.length + 1)) : G.Subgraph := by
  sorry

noncomputable def EarDecomposition.prefix {H : G.Subgraph} (d : G.EarDecomposition H)
    (k : Fin (d.length + 1)) :
    G.EarDecomposition (EarDecomposition.subgraphAfter G d k) := by
  sorry

theorem EarDecomposition.subgraphAfter_last {H : G.Subgraph} (d : G.EarDecomposition H) :
    EarDecomposition.subgraphAfter G d ⟨d.length, Nat.lt_succ_self _⟩ = H := by
  sorry

/-- Whitney's ear characterization of 2-connectivity. -/
theorem isVertexConnected_two_iff_nonempty_openEarDecomposition [Fintype V]
    (h3 : 3 ≤ Fintype.card V) :
    IsVertexConnected G 2 ↔ Nonempty (G.OpenEarDecomposition ⊤) := by
  sorry

/-- The closed-ear characterization of 2-edge-connectivity. -/
theorem isEdgeConnected_two_iff_nonempty_earDecomposition [Finite V] [Nonempty V] :
    G.IsEdgeConnected 2 ↔ Nonempty (G.EarDecomposition ⊤) := by
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
def Oriented (_o : G.Orientation) : Type u := V

instance (o : G.Orientation) : Quiver (G.Oriented o) :=
  ⟨fun v w => {e : G.edgeSet // (o.dart e).fst = v ∧ (o.dart e).snd = w}⟩

/-- Robbins' theorem, with no connectedness or size hypothesis. -/
theorem exists_orientation_isStronglyConnected_iff [Finite V] :
    (∃ o : G.Orientation, Quiver.IsStronglyConnected (G.Oriented o)) ↔ G.IsEdgeConnected 2 := by
  sorry

/-- Kőnig's theorem, with witnesses. -/
theorem konig [Finite V] (h : G.IsBipartite) :
    ∃ (M : G.Subgraph) (C : Set V), M.IsMatching ∧ G.IsVertexCover C ∧
      M.edgeSet.ncard = C.ncard := by
  sorry

/-- The König–Ore deficiency formula in witness form: a matching `M` and a set `S ⊆ L` with
`|M| + |S| = |L| + |N(S)|`. The inequality `|M| + |S| ≤ |L| + |N(S)|` for every matching and
every `S ⊆ L` is a separate target; Hall's theorem is the case `S = ∅` of the equality. -/
theorem konig_ore [Finite V] {L R : Set V} (h : G.IsBipartiteWith L R) :
    ∃ (M : G.Subgraph) (S : Set V), M.IsMatching ∧ S ⊆ L ∧
      M.edgeSet.ncard + S.ncard = L.ncard + (⋃ x ∈ S, G.neighborSet x).ncard := by
  sorry

end SimpleGraph

/-! ## Cut trees (Milestone 9) -/

namespace TauCetiRoadmap.FiniteGraphConnectivity

variable {K : Type w} [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]
variable {V : Type u} (G : SimpleGraph V) [Fintype V] [DecidableEq V] [DecidableRel G.Adj]

/-- Capacity of the undirected cut `(S, Sᶜ)`: each crossing edge counted once. -/
noncomputable def cutCapacity (c : Sym2 V → K) (S : Finset V) : K :=
  ∑ e ∈ G.edgeFinset with (∃ x ∈ e, x ∈ S) ∧ (∃ y ∈ e, y ∉ S), c e

/-- The minimum `s–t` cut capacity, obtained as the minimum of a nonempty finite family when
`s ≠ t`, and defined to be zero when `s = t`. No order completeness is required. -/
noncomputable def minCutCapacity (c : Sym2 V → K) (s t : V) : K := by
  let _usesGraph := G
  sorry

/-- A weighted tree on the vertex type. -/
structure WeightedTree (K : Type w) (V : Type u) [Zero K] [LE K] where
  tree : SimpleGraph V
  isTree : tree.IsTree
  weight : Sym2 V → K
  weight_nonneg : ∀ e, 0 ≤ weight e

open Classical in
/-- Gomory–Hu: minimum cut values are read off tree paths, and every tree edge's fundamental
partition is a minimum cut for its endpoints. -/
theorem exists_gomoryHu_tree [Nonempty V] (c : Sym2 V → K) (hc : ∀ e, 0 ≤ c e) :
    ∃ T : WeightedTree K V,
      (∀ s t, s ≠ t → ∀ p : T.tree.Walk s t, p.IsPath →
        (∀ e ∈ p.edges, minCutCapacity G c s t ≤ T.weight e) ∧
          ∃ e ∈ p.edges, T.weight e = minCutCapacity G c s t) ∧
      ∀ u v, T.tree.Adj u v →
        T.weight s(u, v) = minCutCapacity G c u v ∧
          cutCapacity G c (univ.filter fun x => (T.tree.deleteEdges {s(u, v)}).Reachable u x) =
            minCutCapacity G c u v := by
  sorry

end TauCetiRoadmap.FiniteGraphConnectivity

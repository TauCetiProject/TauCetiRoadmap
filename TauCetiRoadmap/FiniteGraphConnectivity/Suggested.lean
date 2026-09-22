import Mathlib
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# Finite graph connectivity: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for the load-bearing structures and a few milestone
statements, so that contributors and reviewers converge on names and shapes. Discharging every
declaration here finishes neither a milestone nor the roadmap. `sorry` is allowed in this
human-owned roadmap library: these are targets, not completed definitions or proofs.

The multigraph edge theory and its transport interfaces are prototyped in `GraphSuggested.lean`.
The simple-graph edge and orientation statements here are required corollaries of that theory.
`CirculationSuggested.lean` prototypes signed bounds, circulation correspondences, and extremal values.

The pinned choices this file exhibits: finite bounds and flows use a linearly ordered additive
commutative group `K`; a directed network is a *term* `N : Network C V` with arrow types in a
universe independent of the vertex universe, and lower and upper bounds in a common type `C`,
equal to `K` for finite bounds and `WithTop K` for extended bounds; ordinary networks set the
lower bound to zero in the same structure; assignments, excess, cut capacity, and flows
use an explicit quiver and separate capacities, with network abbreviations for the same objects;
excess is incoming minus outgoing and flow value is nonnegative excess at the sink;
directed walks abbreviate Mathlib's `Quiver.Path` with the quiver
argument supplied explicitly, so networks and orientations share its API without competing
instances or vertex-type synonyms; the residual network has the flow-independent arrow type
`N.Hom v w ⊕ N.Hom w v`, and an augmenting path is a path in its positive-capacity part; flows on
an extended network are finite `K`-valued and reach the finite theory by truncation rather than
extended subtraction; integrality is stated for an additive subgroup of `K`; an orientation of a
simple graph reuses `TauCeti.DoubledQuiver.Orientation`; ear decompositions are data, here terms of one
inductive type family indexed by the subgraph built so far, while the roadmap pins their observable
prefix API rather than this representation; connectivity predicates are primary, following
Mathlib's `IsEdgeConnected` and the shape of Mathlib proposal [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) for vertex connectivity, with
derived `ℕ∞`-valued invariants; Menger is stated in witness form; and every sum is a `Finset.sum`.

Namespaces: in Tau Ceti, new declarations about simple graphs live in `SimpleGraph`, including
the connectivity declarations under the names of [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) and [#42494](https://github.com/leanprover-community/mathlib4/pull/42494). Their prototype definitions
are stand-ins in this roadmap's namespace so that this file keeps compiling when Mathlib lands
them. Orientations use the existing Tau Ceti type.
-/

open Finset

universe u v w

namespace TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Directed networks (Conventions; Milestones 1, 3, 4, 8) -/

/-- Both bounds use the same type. Feasibility is a condition on assignments, not on the carrier. -/
structure Network (C : Type w) (V : Type u) [LE C] where
  Hom : V → V → Type v
  lower : ∀ {v w : V}, Hom v w → C
  upper : ∀ {v w : V}, Hom v w → C
  lower_le_upper : ∀ {v w : V} (e : Hom v w), lower e ≤ upper e

variable {V : Type u}

abbrev Assignment (Q : Quiver V) (K : Type w) := ∀ {v w : V}, Q.Hom v w → K

abbrev Network.Assignment {C : Type w} [LE C] (N : Network C V) (K : Type w) :=
  TauCetiRoadmap.FiniteGraphConnectivity.Assignment ⟨N.Hom⟩ K

abbrev Network.ofCapacity {C : Type w} [Zero C] [LE C] (Q : Quiver V)
    (cap : TauCetiRoadmap.FiniteGraphConnectivity.Assignment Q C)
    (hcap : ∀ {v w} (e : Q.Hom v w), 0 ≤ cap e) : Network C V where
  Hom := Q.Hom
  lower _ := 0
  upper := cap
  lower_le_upper := hcap

abbrev Network.withBounds {C D : Type w} [LE C] [LE D] (N : Network C V)
    (lo hi : N.Assignment D) (h : ∀ {v w} (e : N.Hom v w), lo e ≤ hi e) : Network D V where
  Hom := N.Hom
  lower := lo
  upper := hi
  lower_le_upper := h

noncomputable def excessAt (Q : Quiver V) [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] {K : Type w} [AddCommGroup K]
    (f : Assignment Q K) (v : V) : K :=
  ∑ w, ∑ e : Q.Hom w v, f e - ∑ w, ∑ e : Q.Hom v w, f e

theorem excessAt_source_eq_neg_sink (Q : Quiver V) [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] {K : Type w} [AddCommGroup K]
    (f : Assignment Q K) {s t : V}
    (hconserve : ∀ v, v ≠ s → v ≠ t → excessAt Q f v = 0) :
    excessAt Q f s = -excessAt Q f t := by
  sorry

noncomputable def arrowCutCapacity (Q : Quiver V) [Fintype V] [DecidableEq V]
    [∀ v w, Fintype (Q.Hom v w)] {C : Type w} [AddCommMonoid C]
    (cap : Assignment Q C) (S : Finset V) : C :=
  ∑ v ∈ S, ∑ w ∈ Sᶜ, ∑ e : Q.Hom v w, cap e

structure BoundedAssignment {K : Type w} [LE K] (Q : Quiver V)
    (lo hi : Assignment Q K) where
  toFun : Assignment Q K
  lower_le : ∀ {v w} (e : Q.Hom v w), lo e ≤ toFun e
  le_upper : ∀ {v w} (e : Q.Hom v w), toFun e ≤ hi e

abbrev PseudoFlow {K : Type w} [Zero K] [LE K] (Q : Quiver V) (cap : Assignment Q K) :=
  BoundedAssignment Q (fun _ => 0) cap

structure Flow {K : Type w} [AddCommGroup K] [LE K]
    (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (cap : Assignment Q K) (s t : V) extends PseudoFlow Q cap where
  conserve : ∀ v, v ≠ s → v ≠ t → excessAt Q toFun v = 0
  val_nonneg : 0 ≤ excessAt Q toFun t

noncomputable def Flow.val {K : Type w} [AddCommGroup K] [LE K]
    {Q : Quiver V} [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    {cap : Assignment Q K} {s t : V} (f : Flow Q cap s t) : K :=
  excessAt Q f.toFun t

/-- General terminal assignments have signed values and may have signed arrow values. -/
structure BoundedFlow {K : Type w} [AddCommGroup K] [LE K]
    (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (lo hi : Assignment Q K) (s t : V) extends BoundedAssignment Q lo hi where
  conserve : ∀ v, v ≠ s → v ≠ t → excessAt Q toFun v = 0

noncomputable def BoundedFlow.val {K : Type w} [AddCommGroup K] [LE K]
    {Q : Quiver V} [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    {lo hi : Assignment Q K} {s t : V} (f : BoundedFlow Q lo hi s t) : K :=
  excessAt Q f.toFun t

abbrev Network.Feasible {K : Type w} [LE K] (N : Network K V) :=
  BoundedAssignment ⟨N.Hom⟩ N.lower N.upper

abbrev Network.BoundedFlow {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] (s t : V) :=
  TauCetiRoadmap.FiniteGraphConnectivity.BoundedFlow ⟨N.Hom⟩ N.lower N.upper s t

abbrev Realizes {K : Type w} [AddCommGroup K] [LE K] (Q : Quiver V)
    [Fintype V] [∀ v w, Fintype (Q.Hom v w)] (lo hi : Assignment Q K) (b : V → K) :=
  {f : BoundedAssignment Q lo hi // ∀ v, excessAt Q f.toFun v = b v}

abbrev Network.Realizes {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] (b : V → K) :=
  TauCetiRoadmap.FiniteGraphConnectivity.Realizes ⟨N.Hom⟩ N.lower N.upper b

abbrev Network.Circulation {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] := N.Realizes (fun _ => 0)

/-- Mathlib's directed walks with the arrow family supplied explicitly, so several quivers on
the same vertex type can coexist without installing competing instances. -/
abbrev ArrowWalk (Hom : V → V → Type v) (s t : V) := @Quiver.Path V ⟨Hom⟩ s t

namespace ArrowWalk

variable {Hom : V → V → Type v}

abbrev length {s t : V} (p : ArrowWalk Hom s t) : ℕ :=
  @Quiver.Path.length V ⟨Hom⟩ s t p

abbrev vertices {s t : V} (p : ArrowWalk Hom s t) : List V :=
  @Quiver.Path.vertices V ⟨Hom⟩ s t p

abbrev comp {s t z : V} (p : ArrowWalk Hom s t) (q : ArrowWalk Hom t z) :
    ArrowWalk Hom s z := @Quiver.Path.comp V ⟨Hom⟩ s t z p q

/-- A directed path: a walk with no repeated vertices. -/
def IsPath {u w : V} (p : ArrowWalk Hom u w) : Prop := (vertices p).Nodup

/-- A directed cycle: positive length, no repeated vertices apart from the coinciding endpoints. -/
def IsCycle {u : V} (c : ArrowWalk Hom u u) : Prop := 0 < length c ∧ (vertices c).tail.Nodup

end ArrowWalk

/-- Directed reachability along an arrow family. -/
def ArrowReachable (Hom : V → V → Type v) (v w : V) : Prop := Nonempty (ArrowWalk Hom v w)

/-- Mathlib's strong connectivity with the quiver argument supplied explicitly. -/
abbrev IsStronglyConnected (Hom : V → V → Type v) : Prop :=
  @Quiver.IsStronglyConnected V ⟨Hom⟩

section AnyBounds

variable {C : Type w} [AddCommMonoid C] [PartialOrder C]

abbrev Network.Walk (N : Network C V) (v w : V) := ArrowWalk N.Hom v w
abbrev Network.Reachable (N : Network C V) (v w : V) : Prop := ArrowReachable N.Hom v w
abbrev Network.IsStronglyConnected (N : Network C V) : Prop :=
  TauCetiRoadmap.FiniteGraphConnectivity.IsStronglyConnected N.Hom

/-- Used on zero-lower-bound residual networks. -/
def Network.positivePart (N : Network C V) : Network C V where
  Hom v w := {e : N.Hom v w // 0 < N.upper e}
  lower e := N.lower e.val
  upper e := N.upper e.val
  lower_le_upper e := N.lower_le_upper e.val

variable (N : Network C V) [Fintype V] [∀ v w, Fintype (N.Hom v w)]

noncomputable abbrev Network.excessAt {K : Type w} [AddCommGroup K]
    (f : N.Assignment K) (v : V) : K :=
  TauCetiRoadmap.FiniteGraphConnectivity.excessAt ⟨N.Hom⟩ f v

noncomputable abbrev Network.upperCutCapacity [DecidableEq V] (S : Finset V) : C :=
  arrowCutCapacity ⟨N.Hom⟩ N.upper S

end AnyBounds

variable {K : Type w} [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]

/-- Residual arrows have zero lower bounds, regardless of the original bounds. -/
noncomputable abbrev residual (Q : Quiver V) (lo hi : Assignment Q K)
    (f : BoundedAssignment Q lo hi) : Network K V where
  Hom v w := Q.Hom v w ⊕ Q.Hom w v
  lower _ := 0
  upper := Sum.elim (fun e => hi e - f.toFun e) (fun e => f.toFun e - lo e)
  lower_le_upper e := by
    cases e with
    | inl e => exact sub_nonneg.mpr (f.le_upper e)
    | inr e => exact sub_nonneg.mpr (f.lower_le e)

noncomputable abbrev Network.residual (N : Network K V) (f : N.Feasible) :=
  TauCetiRoadmap.FiniteGraphConnectivity.residual ⟨N.Hom⟩ N.lower N.upper f

noncomputable def Network.cutCapacity (N : Network K V) [Fintype V] [DecidableEq V]
    [∀ v w, Fintype (N.Hom v w)] (S : Finset V) : K :=
  N.upperCutCapacity S - arrowCutCapacity ⟨N.Hom⟩ N.lower Sᶜ

section Ordinary

variable (Q : Quiver V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (Q.Hom v w)]
variable (cap : Assignment Q K) (hcap : ∀ {v w} (e : Q.Hom v w), 0 ≤ cap e)
variable {s t : V}

/-- Ordinary flows use the same assignments as zero-lower-bound networks. -/
noncomputable def Flow.boundedEquiv :
    Flow Q cap s t ≃ {f : (Network.ofCapacity Q cap hcap).BoundedFlow s t // 0 ≤ f.val} := by
  sorry

noncomputable def PseudoFlow.toFlowSwap (f : PseudoFlow Q cap)
    (hconserve : ∀ v, v ≠ s → v ≠ t → excessAt Q f.toFun v = 0)
    (hval : excessAt Q f.toFun t ≤ 0) : Flow Q cap t s where
  toBoundedAssignment := f
  conserve v hvt hvs := hconserve v hvs hvt
  val_nonneg := by
    rw [excessAt_source_eq_neg_sink Q f.toFun hconserve]
    exact neg_nonneg.mpr hval

noncomputable abbrev Flow.residual (f : Flow Q cap s t) : Network K V :=
  TauCetiRoadmap.FiniteGraphConnectivity.residual Q (fun _ => 0) cap f.toBoundedAssignment

def Flow.HasAugmentingPath (f : Flow Q cap s t) : Prop :=
  (Flow.residual Q cap f).positivePart.Reachable s t

theorem Flow.val_le_cutCapacity (f : Flow Q cap s t) {S : Finset V}
    (hs : s ∈ S) (ht : t ∉ S) : f.val ≤ arrowCutCapacity Q cap S := by
  sorry

include hcap in
theorem exists_flow_cut_value_eq (hst : s ≠ t) :
    ∃ (f : Flow Q cap s t) (S : Finset V),
      s ∈ S ∧ t ∉ S ∧ f.val = arrowCutCapacity Q cap S := by
  sorry

theorem Flow.isMax_iff_not_hasAugmentingPath (hst : s ≠ t) (f : Flow Q cap s t) :
    (∀ g : Flow Q cap s t, g.val ≤ f.val) ↔ ¬ Flow.HasAugmentingPath Q cap f := by
  sorry

theorem Flow.isMax_iff_exists_cut (hst : s ≠ t) (f : Flow Q cap s t) :
    (∀ g : Flow Q cap s t, g.val ≤ f.val) ↔
      ∃ S : Finset V, s ∈ S ∧ t ∉ S ∧ f.val = arrowCutCapacity Q cap S := by
  sorry

include hcap in
theorem exists_max_flow_mem_addSubgroup (hst : s ≠ t) (H : AddSubgroup K)
    (hcapH : ∀ {v w} (e : Q.Hom v w), cap e ∈ H) :
    ∃ f : Flow Q cap s t, (∀ {v w} (e : Q.Hom v w), f.toFun e ∈ H) ∧
      ∀ g : Flow Q cap s t, g.val ≤ f.val := by
  sorry

open Classical in
theorem Flow.residualReachable_isMinCut (hst : s ≠ t) (f : Flow Q cap s t)
    (hf : ∀ g : Flow Q cap s t, g.val ≤ f.val) :
    let S := univ.filter fun v => (Flow.residual Q cap f).positivePart.Reachable s v
    arrowCutCapacity Q cap S = f.val ∧
      ∀ T : Finset V, s ∈ T → t ∉ T → arrowCutCapacity Q cap T = f.val → S ⊆ T := by
  sorry

end Ordinary

/-! ## Extended bounds (Conventions; Milestone 3) -/

/-- Both bounds are extended, but the assignment remains finite-valued. -/
structure FiniteBoundedAssignment (Q : Quiver V) (lo hi : Assignment Q (WithTop K)) where
  toFun : Assignment Q K
  lower_le : ∀ {v w} (e : Q.Hom v w), lo e ≤ (toFun e : WithTop K)
  le_upper : ∀ {v w} (e : Q.Hom v w), (toFun e : WithTop K) ≤ hi e

abbrev Network.FiniteFeasible (N : Network (WithTop K) V) :=
  FiniteBoundedAssignment ⟨N.Hom⟩ N.lower N.upper

theorem Network.not_finiteFeasible_of_lower_eq_top (N : Network (WithTop K) V)
    {v w : V} (e : N.Hom v w) (he : N.lower e = ⊤) : ¬ Nonempty N.FiniteFeasible := by
  sorry

theorem Network.nonempty_finiteFeasible_iff (N : Network (WithTop K) V) :
    Nonempty N.FiniteFeasible ↔ ∀ {v w} (e : N.Hom v w), N.lower e ≠ ⊤ := by
  sorry

abbrev Network.toExtended (N : Network K V) : Network (WithTop K) V :=
  N.withBounds (fun e => (N.lower e : WithTop K)) (fun e => (N.upper e : WithTop K))
    (fun e => WithTop.coe_le_coe.mpr (N.lower_le_upper e))

noncomputable def Network.finiteBounds (N : Network (WithTop K) V)
    (hlo : ∀ {v w} (e : N.Hom v w), N.lower e ≠ ⊤)
    (hhi : ∀ {v w} (e : N.Hom v w), N.upper e ≠ ⊤) : Network K V where
  Hom := N.Hom
  lower e := (N.lower e).untop (hlo e)
  upper e := (N.upper e).untop (hhi e)
  lower_le_upper := by sorry

noncomputable def Network.finiteBoundsEquiv (N : Network (WithTop K) V)
    (hlo : ∀ {v w} (e : N.Hom v w), N.lower e ≠ ⊤)
    (hhi : ∀ {v w} (e : N.Hom v w), N.upper e ≠ ⊤) :
    N.FiniteFeasible ≃ (N.finiteBounds hlo hhi).Feasible := by
  sorry

/-- Truncation of infinite upper bounds is used only in the ordinary zero-lower-bound theory. -/
noncomputable def truncateCapacity (Q : Quiver V) (cap : Assignment Q (WithTop K))
    (hcap : ∀ {v w} (e : Q.Hom v w), 0 ≤ cap e) (B : K) (hB : 0 ≤ B) : Network K V where
  Hom := Q.Hom
  lower _ := 0
  upper e := (cap e).untopD B
  lower_le_upper := by sorry

structure FiniteFlow (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (cap : Assignment Q (WithTop K)) (s t : V)
    extends FiniteBoundedAssignment Q (fun _ => 0) cap where
  conserve : ∀ v, v ≠ s → v ≠ t → excessAt Q toFun v = 0
  val_nonneg : 0 ≤ excessAt Q toFun t

noncomputable def FiniteFlow.val {Q : Quiver V} [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] {cap : Assignment Q (WithTop K)} {s t : V}
    (f : FiniteFlow Q cap s t) : K := excessAt Q f.toFun t

section ExtendedOrdinary

variable (Q : Quiver V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (Q.Hom v w)]
variable (cap : Assignment Q (WithTop K))
variable (hcap : ∀ {v w} (e : Q.Hom v w), 0 ≤ cap e) {s t : V}

theorem FiniteFlow.val_le_cutCapacity (f : FiniteFlow Q cap s t) {S : Finset V}
    (hs : s ∈ S) (ht : t ∉ S) : (f.val : WithTop K) ≤ arrowCutCapacity Q cap S := by
  sorry

include hcap in
theorem exists_finiteFlow_cut_value_eq_of_exists_finite_cut (hst : s ≠ t)
    (hfinite : ∃ S : Finset V, s ∈ S ∧ t ∉ S ∧ arrowCutCapacity Q cap S ≠ ⊤) :
    ∃ (f : FiniteFlow Q cap s t) (S : Finset V),
      s ∈ S ∧ t ∉ S ∧ (f.val : WithTop K) = arrowCutCapacity Q cap S := by
  sorry

include hcap in
theorem finiteFlow_values_cofinal_of_forall_cutCapacity_eq_top (hst : s ≠ t)
    (hinfinite : ∀ S : Finset V, s ∈ S → t ∉ S → arrowCutCapacity Q cap S = ⊤) :
    ∀ b : K, ∃ f : FiniteFlow Q cap s t, b ≤ f.val := by
  sorry

include hcap in
theorem finiteFlow_values_unbounded_of_forall_cutCapacity_eq_top [Nontrivial K]
    (hst : s ≠ t)
    (hinfinite : ∀ S : Finset V, s ∈ S → t ∉ S → arrowCutCapacity Q cap S = ⊤) :
    ∀ b : K, ∃ f : FiniteFlow Q cap s t, b < f.val := by
  sorry

end ExtendedOrdinary

theorem sSup_finiteFlow_value_eq_iInf_cutCapacity (Q : Quiver V) [Fintype V]
    [DecidableEq V] [∀ v w, Fintype (Q.Hom v w)] (cap : Assignment Q (WithTop ℝ))
    (hcap : ∀ {v w} (e : Q.Hom v w), 0 ≤ cap e) {s t : V} (hst : s ≠ t) :
    sSup (Set.range fun f : FiniteFlow Q cap s t => (f.val : WithTop ℝ)) =
      ⨅ S : {S : Finset V // s ∈ S ∧ t ∉ S}, arrowCutCapacity Q cap S := by
  sorry


/-! ## Stand-ins for Mathlib proposal [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) (Conventions) -/

variable (G : SimpleGraph V)

/-- Stand-in for Mathlib proposal [#33355](https://github.com/leanprover-community/mathlib4/pull/33355): `u` and `v` stay reachable after deleting any set of
fewer than `k` vertices not containing them. -/
def IsVertexReachable (k : ℕ∞) (u v : V) : Prop :=
  ∀ ⦃s : Set V⦄, s.encard < k → (hu : u ∉ s) → (hv : v ∉ s) →
    (G.induce sᶜ).Reachable ⟨u, hu⟩ ⟨v, hv⟩

/-- Stand-in for Mathlib proposal [#33355](https://github.com/leanprover-community/mathlib4/pull/33355): more than `k` vertices, and every pair is
`k`-vertex-reachable. -/
def IsVertexConnected (k : ℕ∞) : Prop :=
  k + 1 ≤ ENat.card V ∧ ∀ u v, IsVertexReachable G k u v

/-- Stand-in for [#42494](https://github.com/leanprover-community/mathlib4/pull/42494), with the proposed supremum definition. -/
noncomputable def edgeReachability (u v : V) : ℕ∞ :=
  ⨆ (k : ℕ) (_ : G.IsEdgeReachable k u v), (k : ℕ∞)

/-- Stand-in for [#42494](https://github.com/leanprover-community/mathlib4/pull/42494), including its value `⊤` on subsingleton carriers. -/
noncomputable def edgeConnectivity : ℕ∞ :=
  ⨆ (k : ℕ) (_ : G.IsEdgeConnected k), (k : ℕ∞)

end TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Undirected connectivity (Milestones 1, 2, 5, 6, 7) -/

namespace SimpleGraph

open TauCetiRoadmap.FiniteGraphConnectivity

variable {V : Type u} (G : SimpleGraph V)

open Classical in
/-- The largest natural threshold at which `G` is vertex-connected, as an extended natural.
The empty-carrier convention is zero. The predicates remain the primary interface. -/
noncomputable def vertexConnectivity : ℕ∞ :=
  ⨆ k : ℕ, if IsVertexConnected G (k : ℕ∞) then (k : ℕ∞) else 0

/-- On a nonempty finite carrier, numerical vertex connectivity records exactly the valid
thresholds. -/
theorem isVertexConnected_iff_le_vertexConnectivity [Finite V] [Nonempty V] (k : ℕ) :
    IsVertexConnected G k ↔ (k : ℕ∞) ≤ G.vertexConnectivity := by
  sorry

/-- Numerical edge connectivity records exactly the valid thresholds, including the value `⊤`
on subsingleton carriers. -/
theorem isEdgeConnected_iff_le_edgeConnectivity [Finite V] (k : ℕ) :
    G.IsEdgeConnected k ↔ (k : ℕ∞) ≤ edgeConnectivity G := by
  sorry

theorem edgeConnectivity_eq_top_iff [Finite V] :
    edgeConnectivity G = ⊤ ↔ Subsingleton V := by
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
    G.vertexConnectivity ≤ edgeConnectivity G := by
  sorry

theorem edgeConnectivity_le_minDegree_target [Fintype V] [DecidableRel G.Adj] [Nontrivial V] :
    edgeConnectivity G ≤ (G.minDegree : ℕ∞) := by
  sorry

/-- An articulation vertex separates two other vertices. The component-count form is a lemma. -/
def IsCutVertex (v : V) : Prop :=
  ∃ u w, ∃ (hu : u ≠ v) (hw : w ≠ v),
    G.Reachable u w ∧ ¬ (G.induce {v}ᶜ).Reachable ⟨u, hu⟩ ⟨w, hw⟩

/-- A block: a maximal vertex set inducing a connected graph without articulation vertices. -/
def IsBlock (B : Set V) : Prop :=
  Maximal (fun B : Set V => (G.induce B).Connected ∧ ∀ v, ¬ (G.induce B).IsCutVertex v) B

/-- An ear added to the subgraph `H`: an open ear is a path with distinct endpoints in `H`, new
interior vertices, and new edges; a closed ear is a cycle meeting `H` in exactly its base vertex.
Single-edge open ears are allowed. -/
inductive Ear (H : G.Subgraph) : Type u
  | open {u v : V} (p : G.Walk u v) (hp : p.IsPath) (hu : u ∈ H.verts) (hv : v ∈ H.verts)
      (huv : u ≠ v) (hint : ∀ w ∈ p.support, w ≠ u → w ≠ v → w ∉ H.verts)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet)
  | closed {u : V} (c : G.Walk u u) (hc : c.IsCycle) (hu : u ∈ H.verts)
      (hint : ∀ w ∈ c.support, w ≠ u → w ∉ H.verts)

/-- Whether an ear is open or closed. -/
inductive EarKind
  | open
  | closed

def Ear.kind {H : G.Subgraph} : G.Ear H → EarKind
  | .open .. => .open
  | .closed .. => .closed

/-- The subgraph consisting of an ear's vertices and edges. -/
def Ear.toSubgraph {H : G.Subgraph} : G.Ear H → G.Subgraph
  | .open p .. => p.toSubgraph
  | .closed c .. => c.toSubgraph

/-- The underlying walk of an ear, with its endpoints. -/
def Ear.toWalk {H : G.Subgraph} : G.Ear H → Σ u v : V, G.Walk u v
  | .open p .. => ⟨_, _, p⟩
  | .closed c .. => ⟨_, _, c⟩

/-- One possible representation of ear decompositions as data. The roadmap requires the prefix
API below, but does not require this inductive representation. A decomposition starts from a
single vertex or from a cycle and adds ears to the subgraph built so far. -/
inductive EarDecomposition : G.Subgraph → Type u
  | vertex (v : V) : EarDecomposition (G.singletonSubgraph v)
  | cycle {u : V} (c : G.Walk u u) (hc : c.IsCycle) : EarDecomposition c.toSubgraph
  | ear {H : G.Subgraph} (d : EarDecomposition H) (e : G.Ear H) :
      EarDecomposition (H ⊔ e.toSubgraph)

/-- An open ear decomposition starts from a cycle and adds only open ears. -/
def EarDecomposition.IsOpen : ∀ {H : G.Subgraph}, G.EarDecomposition H → Prop
  | _, .vertex _ => False
  | _, .cycle _ _ => True
  | _, .ear d e => d.IsOpen ∧ e.kind = .open

/-- The number of ears; one of the functions of the decomposition the API is built on. -/
def EarDecomposition.length : ∀ {H : G.Subgraph}, G.EarDecomposition H → ℕ
  | _, .vertex _ => 0
  | _, .cycle _ _ => 0
  | _, .ear d _ => d.length + 1

/-- The initial subgraph: a single vertex or a cycle. -/
def EarDecomposition.initial : ∀ {H : G.Subgraph}, G.EarDecomposition H → G.Subgraph
  | _, .vertex v => G.singletonSubgraph v
  | _, .cycle c _ => c.toSubgraph
  | _, .ear d _ => d.initial

/-- The `k`-th ear as a walk with its endpoints, exposed independently of the representation. -/
noncomputable def EarDecomposition.earAt {H : G.Subgraph} (d : G.EarDecomposition H)
    (_k : Fin d.length) : Σ u v : V, G.Walk u v := by
  sorry

noncomputable def EarDecomposition.kindAt {H : G.Subgraph} (d : G.EarDecomposition H)
    (_k : Fin d.length) : EarKind := by
  sorry

/-- The subgraph built after a prefix of the ears. Index zero is the initial subgraph and the
last index is the final subgraph. -/
noncomputable def EarDecomposition.subgraphAfter {H : G.Subgraph} (d : G.EarDecomposition H)
    (_k : Fin (d.length + 1)) : G.Subgraph := by
  sorry

/-- Every initial segment is itself an ear decomposition of its displayed subgraph. -/
noncomputable def EarDecomposition.prefix {H : G.Subgraph} (d : G.EarDecomposition H)
    (k : Fin (d.length + 1)) : G.EarDecomposition (EarDecomposition.subgraphAfter G d k) := by
  sorry

theorem EarDecomposition.subgraphAfter_zero {H : G.Subgraph} (d : G.EarDecomposition H) :
    EarDecomposition.subgraphAfter G d 0 = d.initial := by
  sorry

theorem EarDecomposition.subgraphAfter_last {H : G.Subgraph} (d : G.EarDecomposition H) :
    EarDecomposition.subgraphAfter G d ⟨d.length, Nat.lt_succ_self _⟩ = H := by
  sorry

/-- Whitney's ear characterization of 2-connectivity. -/
theorem isVertexConnected_two_iff_exists_isOpen_earDecomposition [Fintype V]
    (h3 : 3 ≤ Fintype.card V) :
    IsVertexConnected G 2 ↔ ∃ d : G.EarDecomposition ⊤, d.IsOpen := by
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

/-- Robbins' simple-graph corollary uses the orientation API owned by ZigzagPreprojective. -/
theorem exists_orientation_isStronglyConnected_iff [Finite V] :
    (∃ o : TauCeti.DoubledQuiver.Orientation G,
      @Quiver.IsStronglyConnected (TauCeti.DoubledQuiver.OrientedQuiver G o) inferInstance) ↔
      G.IsEdgeConnected 2 := by
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

namespace TauCetiRoadmap.FiniteGraphConnectivity

/-- The deficiency formula in the indexed-family form of Mathlib's Hall theorem, in witness form:
an injective choice `f` on the subtype of indices in `D` with `f i ∈ t i`, and a set `S` with
`|D| + |S| = |ι| + |⋃ i ∈ S, t i|`. The inequality for every `D`, `f`, and `S` is a separate
target. Under Hall's condition the witness has `D = univ`, which is
`Finset.all_card_le_biUnion_card_iff_exists_injective`. -/
theorem konig_ore_family {ι α : Type*} [Fintype ι] [DecidableEq α] (t : ι → Finset α) :
    ∃ (D : Finset ι) (f : D → α) (S : Finset ι), Function.Injective f ∧ (∀ i : D, f i ∈ t i.val) ∧
      D.card + S.card = Fintype.card ι + (S.biUnion t).card := by
  sorry

end TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Cut functions and cut trees (Milestones 4, 5, 9) -/

namespace TauCetiRoadmap.FiniteGraphConnectivity

variable {K : Type w} [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]
variable {V : Type u} [Fintype V] [DecidableEq V]

/-- A symmetric submodular function on vertex sets: the setting of the minimum-cut lattice, the
non-crossing lemmas, and the cut tree. Undirected cut capacity is the instance the roadmap's
consumers use. -/
structure IsSymmSubmodular (f : Finset V → K) : Prop where
  symm : ∀ S, f Sᶜ = f S
  submodular : ∀ S T, f (S ∪ T) + f (S ∩ T) ≤ f S + f T

/-- The minimum of `f` over sets containing `s` and not `t`: the minimum of a nonempty finite
family when `s ≠ t`, and zero when `s = t`. No order completeness is required. -/
noncomputable def minCut (f : Finset V → K) (s t : V) : K :=
  if h : s ≠ t then
    (univ.filter fun S : Finset V => s ∈ S ∧ t ∉ S).inf' ⟨{s}, by simp [Finset.mem_filter, h.symm]⟩ f
  else 0

/-- The non-crossing lemma: if `S` is a minimum `s–t` cut for a symmetric submodular `f` and
`u, v ∈ S` are distinct, some minimum `u–v` cut has a side contained in `S`. -/
theorem exists_minCut_subset {f : Finset V → K} (hf : IsSymmSubmodular f) {s t u v : V}
    (huv : u ≠ v) {S : Finset V} (hs : s ∈ S) (ht : t ∉ S) (hS : f S = minCut f s t)
    (hu : u ∈ S) (hv : v ∈ S) :
    ∃ T ⊆ S, ((u ∈ T ∧ v ∉ T) ∨ (v ∈ T ∧ u ∉ T)) ∧ f T = minCut f u v := by
  sorry

/-- The ultrametric inequality: every `s–t` cut separates `s` from `v` or `v` from `t`. -/
theorem min_minCut_le_minCut (f : Finset V → K) (s v t : V) (hst : s ≠ t) :
    min (minCut f s v) (minCut f v t) ≤ minCut f s t := by
  sorry

/-- Capacity of the undirected cut `(S, Sᶜ)` of a weighted graph `c`: each crossing pair counted
once. Loops never cross, and pairs of capacity zero are the non-edges. -/
noncomputable def cutCapacity (c : Sym2 V → K) (S : Finset V) : K :=
  ∑ e ∈ univ.filter (fun e : Sym2 V => (∃ x ∈ e, x ∈ S) ∧ (∃ y ∈ e, y ∉ S)), c e

/-- The support ignores diagonal capacities, as does the cut function. -/
def capacitySupport (c : Sym2 V → K) : SimpleGraph V where
  Adj v w := v ≠ w ∧ 0 < c s(v, w)
  symm := ⟨fun v w h => ⟨h.1.symm, by simpa only [Sym2.eq_swap] using h.2⟩⟩
  loopless := ⟨fun v h => h.1 rfl⟩

theorem cutCapacity_eq_of_offDiagonal_eq (c d : Sym2 V → K)
    (h : ∀ v w, v ≠ w → c s(v, w) = d s(v, w)) : cutCapacity c = cutCapacity d := by
  sorry

theorem isSymmSubmodular_cutCapacity (c : Sym2 V → K) (hc : ∀ e, 0 ≤ c e) :
    IsSymmSubmodular (cutCapacity c) := by
  sorry

/-- Local edge reachability is the unit-capacity minimum cut: `s` and `t` stay reachable after
deleting fewer than `k` edges exactly when every `s–t` cut has at least `k` edges. -/
theorem isEdgeReachable_iff_le_minCut (G : SimpleGraph V) [DecidableRel G.Adj] {s t : V}
    (hst : s ≠ t) (k : ℕ) :
    G.IsEdgeReachable k s t ↔
      (k : ℤ) ≤ minCut (cutCapacity fun e => if e ∈ G.edgeFinset then (1 : ℤ) else 0) s t := by
  sorry

/-- A weighted tree on the vertex type. -/
structure WeightedTree (K : Type w) (V : Type u) where
  tree : SimpleGraph V
  isTree : tree.IsTree
  weight : Sym2 V → K

open Classical in
/-- Gomory–Hu for a symmetric submodular function: minimum cut values are read off tree paths,
and every tree edge's fundamental partition is a minimum cut for its endpoints. Weighted graphs
are the instance `f = cutCapacity c`. -/
theorem exists_gomoryHu_tree [Nonempty V] (f : Finset V → K) (hf : IsSymmSubmodular f) :
    ∃ T : WeightedTree K V,
      (∀ s t, s ≠ t → ∀ p : T.tree.Walk s t, p.IsPath →
        (∀ e ∈ p.edges, minCut f s t ≤ T.weight e) ∧ ∃ e ∈ p.edges, T.weight e = minCut f s t) ∧
      ∀ u v, T.tree.Adj u v →
        T.weight s(u, v) = minCut f u v ∧
          f (univ.filter fun x => (T.tree.deleteEdges {s(u, v)}).Reachable u x) = minCut f u v := by
  sorry

end TauCetiRoadmap.FiniteGraphConnectivity

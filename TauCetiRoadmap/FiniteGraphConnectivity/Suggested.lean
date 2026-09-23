import Mathlib
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# Finite graph connectivity: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for the load-bearing structures and a few milestone
statements, so that contributors and reviewers converge on names and shapes. Discharging every
declaration here finishes neither a milestone nor the roadmap. `sorry` is allowed in this
human-owned roadmap library: these are targets, not completed definitions or proofs.

The simple-graph edge and orientation statements are required corollaries of the multigraph theory.
The circulation prototypes cover signed bounds, exact and interval excess, and extremal values.

The pinned choices illustrated here are:

- Finite bounds and flows use a linearly ordered additive commutative group `K`.
  Integrality concerns values in an additive subgroup; every sum is a `Finset.sum`.
  Only the rounding target adds an ordered ring and `FloorRing` structure.
- A network is a term `N : Network C V`, with arrow types in a universe independent of `V`.
  Both bounds lie in `C`; ordinary networks set the lower bound to zero.
  Assignments and flows use an explicit quiver and separate bounds, with network abbreviations.
  Bounded assignments compare their values with bounds through an order embedding.
- Excess is incoming minus outgoing; ordinary flow value is nonnegative excess at the sink.
  General bounded terminal assignments allow signed values.
  Nonnegative assignments decompose into supply-to-demand paths and cycles.
- Directed walks use `Quiver.Path` with an explicit quiver argument.
  Native undirected walks follow the shared-walk proposal, with the bidirected correspondence
  stated as a target.
  Subnetworks record actual vertices as well as arrow subsets.
  Residual arrows are `N.Hom v w ⊕ N.Hom w v`, independently of the assignment.
  Augmenting paths use the positive-capacity part of that fixed arrow family.
- Extended networks use `WithTop K` bounds and finite `K`-valued assignments.
  Truncation at a finite terminal-cut bound preserves optimal values.
  It need not preserve an original assignment.
- Simple-graph orientations reuse `TauCeti.DoubledQuiver.Orientation`.
  Ear decompositions are data with a prefix API.
  These prototypes illustrate an inductive family for simple graphs and a prefix structure for
  multigraphs; neither representation is required by the roadmap.
- Connectivity predicates are primary, with derived `ℕ∞`-valued invariants.
  Menger uses path and separator witnesses.
  Multigraph vertex-only targets require finite actual vertices, without finite actual edges.
- Minimum-cut lattices use submodular functions and disjoint terminal sets.
  Symmetry is an additional hypothesis for non-crossing lemmas and Gomory–Hu trees.

Namespaces: in Tau Ceti, new declarations about simple graphs live in `SimpleGraph`, including
the connectivity declarations under the names of [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) and [#42494](https://github.com/leanprover-community/mathlib4/pull/42494). Their prototype definitions
are stand-ins in this roadmap's namespace so that this file keeps compiling when Mathlib lands
them. Orientations use the existing Tau Ceti type.
-/

open Finset

universe u v w z

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

/-- A subnetwork records its actual vertices as well as its original arrow identities. -/
structure Network.Subnetwork {C : Type w} [LE C] (N : Network C V) where
  verts : Set V
  arrows : ∀ v w, Set (N.Hom v w)
  endpoints : ∀ {v w} (e : N.Hom v w), e ∈ arrows v w → v ∈ verts ∧ w ∈ verts

abbrev Network.Subnetwork.toNetwork {C : Type w} [LE C] {N : Network C V}
    (H : N.Subnetwork) : Network C H.verts where
  Hom v w := {e : N.Hom v.val w.val // e ∈ H.arrows v.val w.val}
  lower e := N.lower e.val
  upper e := N.upper e.val
  lower_le_upper e := N.lower_le_upper e.val

def Network.Subnetwork.singleton {C : Type w} [LE C] (N : Network C V)
    (v : V) : N.Subnetwork where
  verts := {v}
  arrows _ _ := ∅
  endpoints _ h := False.elim h

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

structure BoundedAssignment {K : Type w} {C : Type z} [LE K] [LE C]
    (Q : Quiver V) (ι : K ↪o C) (lo hi : Assignment Q C) where
  toFun : Assignment Q K
  lower_le : ∀ {v w} (e : Q.Hom v w), lo e ≤ ι (toFun e)
  le_upper : ∀ {v w} (e : Q.Hom v w), ι (toFun e) ≤ hi e

@[ext] theorem BoundedAssignment.ext {K : Type w} {C : Type z} [LE K] [LE C]
    {Q : Quiver V} {ι : K ↪o C} {lo hi : Assignment Q C}
    {f g : BoundedAssignment Q ι lo hi}
    (h : ∀ {v w} (e : Q.Hom v w), f.toFun e = g.toFun e) : f = g := by
  sorry

def BoundedAssignment.monoBounds {K : Type w} {C : Type z} [LE K] [Preorder C]
    {Q : Quiver V} {ι : K ↪o C} {lo hi lo' hi' : Assignment Q C}
    (f : BoundedAssignment Q ι lo hi)
    (hlo : ∀ {v w} (e : Q.Hom v w), lo' e ≤ lo e)
    (hhi : ∀ {v w} (e : Q.Hom v w), hi e ≤ hi' e) :
    BoundedAssignment Q ι lo' hi' where
  toFun := f.toFun
  lower_le e := (hlo e).trans (f.lower_le e)
  le_upper e := (f.le_upper e).trans (hhi e)

abbrev PseudoFlow {K : Type w} [Zero K] [LE K] (Q : Quiver V) (cap : Assignment Q K) :=
  BoundedAssignment Q (OrderEmbedding.id K) (fun _ => 0) cap

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
    (lo hi : Assignment Q K) (s t : V) extends BoundedAssignment Q (OrderEmbedding.id K) lo hi where
  conserve : ∀ v, v ≠ s → v ≠ t → excessAt Q toFun v = 0

noncomputable def BoundedFlow.val {K : Type w} [AddCommGroup K] [LE K]
    {Q : Quiver V} [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    {lo hi : Assignment Q K} {s t : V} (f : BoundedFlow Q lo hi s t) : K :=
  excessAt Q f.toFun t

abbrev Network.Feasible {K : Type w} [LE K] (N : Network K V) :=
  BoundedAssignment ⟨N.Hom⟩ (OrderEmbedding.id K) N.lower N.upper

abbrev Network.BoundedFlow {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] (s t : V) :=
  TauCetiRoadmap.FiniteGraphConnectivity.BoundedFlow ⟨N.Hom⟩ N.lower N.upper s t

abbrev Realizes {K : Type w} {C : Type z} [AddCommGroup K] [LE K] [LE C]
    (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (ι : K ↪o C) (lo hi : Assignment Q C) (b : V → K) :=
  {f : BoundedAssignment Q ι lo hi // ∀ v, excessAt Q f.toFun v = b v}

abbrev RealizesWithin {K : Type w} {C : Type z} [AddCommGroup K] [LE K] [LE C]
    (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (ι : K ↪o C) (lo hi : Assignment Q C) (a b : V → K) :=
  {f : BoundedAssignment Q ι lo hi //
    ∀ v, a v ≤ excessAt Q f.toFun v ∧ excessAt Q f.toFun v ≤ b v}

noncomputable def realizesWithin_self_equiv {K : Type w} {C : Type z}
    [AddCommGroup K] [PartialOrder K] [LE C]
    (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]
    (ι : K ↪o C) (lo hi : Assignment Q C) (b : V → K) :
    RealizesWithin Q ι lo hi b b ≃ Realizes Q ι lo hi b where
  toFun f := ⟨f.val, fun v => le_antisymm (f.property v).2 (f.property v).1⟩
  invFun f := ⟨f.val, fun v => ⟨(f.property v).ge, (f.property v).le⟩⟩
  left_inv _ := rfl
  right_inv _ := rfl

abbrev Network.Realizes {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] (b : V → K) :=
  TauCetiRoadmap.FiniteGraphConnectivity.Realizes ⟨N.Hom⟩ (OrderEmbedding.id K) N.lower N.upper b

abbrev Network.RealizesWithin {K : Type w} [AddCommGroup K] [LE K] (N : Network K V)
    [Fintype V] [∀ v w, Fintype (N.Hom v w)] (a b : V → K) :=
  TauCetiRoadmap.FiniteGraphConnectivity.RealizesWithin ⟨N.Hom⟩
    (OrderEmbedding.id K) N.lower N.upper a b

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

def arrows {s t : V} (p : ArrowWalk Hom s t) : List (Σ v w, Hom v w) := by
  letI : Quiver V := ⟨Hom⟩
  induction p with
  | nil => exact []
  | cons p e ih => exact ih ++ [⟨_, _, e⟩]

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

open Classical in
/-- Each occurrence contributes the weight; this needs no multiplication on the coefficient type. -/
noncomputable def walkAssignment (Q : Quiver V) {s t : V}
    (p : @Quiver.Path V Q s t) (q : K) : Assignment Q K :=
  fun {_ _} e => (ArrowWalk.arrows p).count ⟨_, _, e⟩ • q

/-- Decomposition data for a nonnegative assignment, with supply and demand determined by it. -/
structure NonnegativeDecomposition (Q : Quiver V) [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] (f : Assignment Q K) where
  pathCount : ℕ
  cycleCount : ℕ
  source : Fin pathCount → V
  sink : Fin pathCount → V
  path : (i : Fin pathCount) → @Quiver.Path V Q (source i) (sink i)
  path_isPath : ∀ i, ArrowWalk.IsPath (path i)
  pathWeight : Fin pathCount → K
  pathWeight_pos : ∀ i, 0 < pathWeight i
  source_supply : ∀ i, excessAt Q f (source i) < 0
  sink_demand : ∀ i, 0 < excessAt Q f (sink i)
  base : Fin cycleCount → V
  cycle : (i : Fin cycleCount) → @Quiver.Path V Q (base i) (base i)
  cycle_isCycle : ∀ i, ArrowWalk.IsCycle (cycle i)
  cycleWeight : Fin cycleCount → K
  cycleWeight_pos : ∀ i, 0 < cycleWeight i
  arrow_eq : ∀ {v w} (e : Q.Hom v w), f e =
    (∑ i, walkAssignment Q (path i) (pathWeight i) e) +
      ∑ i, walkAssignment Q (cycle i) (cycleWeight i) e

theorem exists_nonnegativeDecomposition (Q : Quiver V) [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] (f : Assignment Q K)
    (hf : ∀ {v w} (e : Q.Hom v w), 0 ≤ f e) : Nonempty (NonnegativeDecomposition Q f) := by
  sorry

theorem exists_nonnegativeDecomposition_mem_addSubgroup (Q : Quiver V) [Fintype V]
    [∀ v w, Fintype (Q.Hom v w)] (f : Assignment Q K)
    (hf : ∀ {v w} (e : Q.Hom v w), 0 ≤ f e) (H : AddSubgroup K)
    (hH : ∀ {v w} (e : Q.Hom v w), f e ∈ H) :
    ∃ d : NonnegativeDecomposition Q f,
      (∀ i, d.pathWeight i ∈ H) ∧ ∀ i, d.cycleWeight i ∈ H := by
  sorry

/-- Residual arrows have zero lower bounds, regardless of the original bounds. -/
noncomputable abbrev residual (Q : Quiver V) (lo hi : Assignment Q K)
    (f : BoundedAssignment Q (OrderEmbedding.id K) lo hi) : Network K V where
  Hom v w := Q.Hom v w ⊕ Q.Hom w v
  lower _ := 0
  upper := Sum.elim (fun e => hi e - f.toFun e) (fun e => f.toFun e - lo e)
  lower_le_upper e := by
    cases e with
    | inl e => exact sub_nonneg.mpr (f.le_upper e)
    | inr e => exact sub_nonneg.mpr (f.lower_le e)

noncomputable abbrev Network.residual (N : Network K V) (f : N.Feasible) :=
  TauCetiRoadmap.FiniteGraphConnectivity.residual ⟨N.Hom⟩ N.lower N.upper f

noncomputable def Network.cutBound (N : Network K V) [Fintype V] [DecidableEq V]
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

abbrev FiniteBoundedAssignment (Q : Quiver V) (lo hi : Assignment Q (WithTop K)) :=
  BoundedAssignment Q WithTop.coeOrderHom lo hi

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

/-- Cycle removal preserves terminal value, but need not preserve the original assignment. -/
theorem exists_truncatedFlow_same_value (hst : s ≠ t) (B : K) (hB : 0 ≤ B)
    {S : Finset V} (hs : s ∈ S) (ht : t ∉ S)
    (hS : arrowCutCapacity Q cap S = (B : WithTop K)) (f : FiniteFlow Q cap s t) :
    ∃ g : Flow Q (truncateCapacity Q cap hcap B hB).upper s t,
      g.val = f.val ∧ ∀ {v w} (e : Q.Hom v w), g.toFun e ≤ f.toFun e := by
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

/-- Submodularity alone suffices for the minimum-cut lattice, including directed cut capacities. -/
def IsSubmodular (f : Finset V → K) : Prop :=
  ∀ S T, f (S ∪ T) + f (S ∩ T) ≤ f S + f T

/-- Symmetry is the additional hypothesis for non-crossing lemmas and cut trees. -/
structure IsSymmSubmodular (f : Finset V → K) : Prop where
  symm : ∀ S, f Sᶜ = f S
  submodular : IsSubmodular f

def IsMinCutBetween (f : Finset V → K) (A B S : Finset V) : Prop :=
  A ⊆ S ∧ Disjoint S B ∧ ∀ T, A ⊆ T → Disjoint T B → f S ≤ f T

noncomputable def minCutBetween (f : Finset V → K) (A B : Finset V)
    (hAB : Disjoint A B) : K :=
  (univ.filter fun S : Finset V => A ⊆ S ∧ Disjoint S B).inf'
    ⟨A, by simp [hAB]⟩ f

theorem isMinCutBetween_iff_value_eq (f : Finset V → K) (A B : Finset V)
    (hAB : Disjoint A B) (S : Finset V) :
    IsMinCutBetween f A B S ↔ A ⊆ S ∧ Disjoint S B ∧ f S = minCutBetween f A B hAB := by
  sorry

theorem IsSubmodular.isMinCutBetween_union_inter {f : Finset V → K}
    (hf : IsSubmodular f) {A B S T : Finset V}
    (hS : IsMinCutBetween f A B S) (hT : IsMinCutBetween f A B T) :
    IsMinCutBetween f A B (S ∪ T) ∧ IsMinCutBetween f A B (S ∩ T) := by
  sorry

theorem IsSubmodular.exists_extremal_minCuts {f : Finset V → K}
    (hf : IsSubmodular f) (A B : Finset V) (hAB : Disjoint A B) :
    ∃ Smin Smax, IsMinCutBetween f A B Smin ∧ IsMinCutBetween f A B Smax ∧
      ∀ S, IsMinCutBetween f A B S → Smin ⊆ S ∧ S ⊆ Smax := by
  sorry

/-- The minimum of `f` over sets containing `s` and not `t`: the minimum of a nonempty finite
family when `s ≠ t`, and zero when `s = t`. No order completeness is required. -/
noncomputable def minCut (f : Finset V → K) (s t : V) : K :=
  if h : s ≠ t then
    (univ.filter fun S : Finset V => s ∈ S ∧ t ∉ S).inf' ⟨{s}, by simp [Finset.mem_filter, h.symm]⟩ f
  else 0

theorem minCutBetween_singleton (f : Finset V → K) (s t : V) (hst : s ≠ t) :
    minCutBetween f {s} {t} (by simpa using hst) = minCut f s t := by
  sorry

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
noncomputable def pairCutCapacity (c : Sym2 V → K) (S : Finset V) : K :=
  ∑ e ∈ univ.filter (fun e : Sym2 V => (∃ x ∈ e, x ∈ S) ∧ (∃ y ∈ e, y ∉ S)), c e

/-- The support ignores diagonal capacities, as does the cut function. -/
def capacitySupport (c : Sym2 V → K) : SimpleGraph V where
  Adj v w := v ≠ w ∧ 0 < c s(v, w)
  symm := ⟨fun v w h => ⟨h.1.symm, by simpa only [Sym2.eq_swap] using h.2⟩⟩
  loopless := ⟨fun v h => h.1 rfl⟩

theorem pairCutCapacity_eq_of_offDiagonal_eq (c d : Sym2 V → K)
    (h : ∀ v w, v ≠ w → c s(v, w) = d s(v, w)) : pairCutCapacity c = pairCutCapacity d := by
  sorry

theorem isSymmSubmodular_pairCutCapacity (c : Sym2 V → K) (hc : ∀ e, 0 ≤ c e) :
    IsSymmSubmodular (pairCutCapacity c) := by
  sorry

/-- Local edge reachability is the unit-capacity minimum cut: `s` and `t` stay reachable after
deleting fewer than `k` edges exactly when every `s–t` cut has at least `k` edges. -/
theorem isEdgeReachable_iff_le_minCut (G : SimpleGraph V) [DecidableRel G.Adj] {s t : V}
    (hst : s ≠ t) (k : ℕ) :
    G.IsEdgeReachable k s t ↔
      (k : ℤ) ≤ minCut (pairCutCapacity fun e => if e ∈ G.edgeFinset then (1 : ℤ) else 0) s t := by
  sorry

/-- A weighted tree on the vertex type. -/
structure WeightedTree (K : Type w) (V : Type u) where
  tree : SimpleGraph V
  isTree : tree.IsTree
  weight : Sym2 V → K

open Classical in
/-- Gomory–Hu for a symmetric submodular function: minimum cut values are read off tree paths,
and every tree edge's fundamental partition is a minimum cut for its endpoints. Weighted graphs
are the instance `f = pairCutCapacity c`. -/
theorem exists_gomoryHu_tree [Nonempty V] (f : Finset V → K) (hf : IsSymmSubmodular f) :
    ∃ T : WeightedTree K V,
      (∀ s t, s ≠ t → ∀ p : T.tree.Walk s t, p.IsPath →
        (∀ e ∈ p.edges, minCut f s t ≤ T.weight e) ∧ ∃ e ∈ p.edges, T.weight e = minCut f s t) ∧
      ∀ u v, T.tree.Adj u v →
        T.weight s(u, v) = minCut f u v ∧
          f (univ.filter fun x => (T.tree.deleteEdges {s(u, v)}).Reachable u x) = minCut f u v := by
  sorry

end TauCetiRoadmap.FiniteGraphConnectivity

/-! ## Circulations and bounded flows (Milestones 1, 4, 8) -/

namespace TauCetiRoadmap.FiniteGraphConnectivity

variable {V : Type u} {K : Type w}
variable [AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]

section Algebra

variable (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]

/-- No capacity constraints: the signed circulation group is the kernel of excess. -/
noncomputable def signedCirculations : AddSubgroup (Assignment Q K) where
  carrier := {f | ∀ v, excessAt Q f v = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

theorem sub_mem_signedCirculations_iff (f g : Assignment Q K) :
    (signedCirculations (K := K) Q).carrier (fun {_ _} e => g e - f e) ↔
      ∀ v, excessAt Q g v = excessAt Q f v := by
  sorry

end Algebra

section FiniteBounds

variable (N : Network K V) [Fintype V] [DecidableEq V] [∀ v w, Fintype (N.Hom v w)]

abbrev Network.shift (h : N.Assignment K) : Network K V :=
  N.withBounds (fun e => N.lower e - h e) (fun e => N.upper e - h e)
    (fun e => sub_le_sub_right (N.lower_le_upper e) (h e))

noncomputable def Network.shiftEquiv (h : N.Assignment K) :
    N.Feasible ≃ (N.shift h).Feasible := by
  sorry

theorem Network.shiftEquiv_apply (h : N.Assignment K) (f : N.Feasible)
    {v w : V} (e : N.Hom v w) :
    (N.shiftEquiv h f).toFun e = f.toFun e - h e := by
  sorry

noncomputable def Network.shiftRealizesEquiv (h : N.Assignment K) (b : V → K) :
    N.Realizes b ≃ (N.shift h).Realizes (fun v => b v - N.excessAt h v) := by
  sorry

noncomputable def Network.shiftRealizesWithinEquiv (h : N.Assignment K) (a b : V → K) :
    N.RealizesWithin a b ≃ (N.shift h).RealizesWithin
      (fun v => a v - N.excessAt h v) (fun v => b v - N.excessAt h v) := by
  sorry

abbrev Network.shiftLower : Network K V :=
  Network.ofCapacity ⟨N.Hom⟩ (fun e => N.upper e - N.lower e)
    (fun e => sub_nonneg.mpr (N.lower_le_upper e))

theorem Network.shift_lower : N.shift N.lower = N.shiftLower := by
  sorry

noncomputable def Network.shiftLowerEquiv (b : V → K) :
    N.Realizes b ≃ N.shiftLower.Realizes (fun v => b v - N.excessAt N.lower v) := by
  sorry

theorem Network.shiftLowerEquiv_apply (b : V → K) (f : N.Realizes b)
    {v w : V} (e : N.Hom v w) :
    (N.shiftLowerEquiv b f).val.toFun e = f.val.toFun e - N.lower e := by
  sorry

/-- The same criterion applies when either or both bounds are negative. -/
theorem Network.nonempty_circulation_iff :
    Nonempty N.Circulation ↔ ∀ S : Finset V,
      arrowCutCapacity ⟨N.Hom⟩ N.lower Sᶜ ≤ N.upperCutCapacity S := by
  sorry

theorem Network.nonempty_realizes_iff (b : V → K) :
    Nonempty (N.Realizes b) ↔ (∑ v, b v) = 0 ∧ ∀ S : Finset V,
      (∑ v ∈ S, b v) + arrowCutCapacity ⟨N.Hom⟩ N.lower S ≤ N.upperCutCapacity Sᶜ := by
  sorry

theorem Network.feasible_or_obstruction (b : V → K) :
    Nonempty (N.Realizes b) ∨ (∑ v, b v) ≠ 0 ∨ ∃ S : Finset V,
      N.upperCutCapacity Sᶜ < (∑ v ∈ S, b v) + arrowCutCapacity ⟨N.Hom⟩ N.lower S := by
  sorry

theorem Network.exists_realizes_mem_addSubgroup (b : V → K) (H : AddSubgroup K)
    (hlo : ∀ {v w} (e : N.Hom v w), N.lower e ∈ H)
    (hhi : ∀ {v w} (e : N.Hom v w), N.upper e ∈ H) (hb : ∀ v, b v ∈ H)
    (hf : Nonempty (N.Realizes b)) :
    ∃ f : N.Realizes b, ∀ {v w} (e : N.Hom v w), f.val.toFun e ∈ H := by
  sorry

noncomputable def Network.residualUpdate (f : N.Feasible)
    (r : (N.residual f).Feasible) : N.Feasible where
  toFun e := f.toFun e + r.toFun (Sum.inl e) - r.toFun (Sum.inr e)
  lower_le := by sorry
  le_upper := by sorry

theorem Network.excessAt_residualUpdate (f : N.Feasible)
    (r : (N.residual f).Feasible) (v : V) :
    N.excessAt (N.residualUpdate f r).toFun v =
      N.excessAt f.toFun v + (N.residual f).excessAt r.toFun v := by
  sorry

theorem Network.excessAt_residualUpdate_circulation (f : N.Feasible)
    (r : (N.residual f).Circulation) (v : V) :
    N.excessAt (N.residualUpdate f r.val).toFun v = N.excessAt f.toFun v := by
  exact (N.excessAt_residualUpdate f r.val v).trans
    ((congrArg (fun x => N.excessAt f.toFun v + x) (r.property v)).trans (add_zero _))

noncomputable def Network.residualDifference (f g : N.Feasible) :
    (N.residual f).Feasible where
  toFun := Sum.elim (fun e => max (g.toFun e - f.toFun e) 0)
    (fun e => max (f.toFun e - g.toFun e) 0)
  lower_le := by sorry
  le_upper := by sorry

theorem Network.excessAt_residualDifference (f g : N.Feasible) (v : V) :
    (N.residual f).excessAt (N.residualDifference f g).toFun v =
      N.excessAt g.toFun v - N.excessAt f.toFun v := by
  sorry

noncomputable def Network.residualDifferenceCirculation (f g : N.Feasible)
    (h : ∀ v, N.excessAt g.toFun v = N.excessAt f.toFun v) :
    (N.residual f).Circulation :=
  ⟨N.residualDifference f g, by
    intro v
    change (N.residual f).excessAt (N.residualDifference f g).toFun v = 0
    rw [N.excessAt_residualDifference, h v, sub_self]⟩

theorem Network.residualUpdate_difference (f g : N.Feasible) :
    N.residualUpdate f (N.residualDifference f g) = g := by
  sorry

/-- The new arrow is tagged, so existing arrows from `t` to `s` remain distinct. -/
abbrev Network.withReturnBounds (s t : V) (a b : K) (hab : a ≤ b) : Network K V where
  Hom v w := N.Hom v w ⊕ PLift (v = t ∧ w = s)
  lower := Sum.elim N.lower (fun _ => a)
  upper := Sum.elim N.upper (fun _ => b)
  lower_le_upper e := by
    cases e with
    | inl e => exact N.lower_le_upper e
    | inr _ => exact hab

noncomputable def Network.returnIntervalEquiv {s t : V} (hst : s ≠ t)
    (a b : K) (hab : a ≤ b) :
    {f : N.BoundedFlow s t // a ≤ f.val ∧ f.val ≤ b} ≃
      (N.withReturnBounds s t a b hab).Circulation := by
  sorry

noncomputable def Network.returnEquiv {s t : V} (hst : s ≠ t) (q : K) :
    {f : N.BoundedFlow s t // f.val = q} ≃
      (N.withReturnBounds s t q q le_rfl).Circulation := by
  sorry

theorem Network.returnEquiv_original {s t : V} (hst : s ≠ t) (q : K)
    (f : {f : N.BoundedFlow s t // f.val = q}) {v w : V} (e : N.Hom v w) :
    (N.returnEquiv hst q f).val.toFun (Sum.inl e) = f.val.toFun e := by
  sorry

theorem Network.returnEquiv_return {s t : V} (hst : s ≠ t) (q : K)
    (f : {f : N.BoundedFlow s t // f.val = q}) :
    (N.returnEquiv hst q f).val.toFun (Sum.inr ⟨rfl, rfl⟩) = q := by
  sorry

theorem Network.cutBound_eq_shiftLower (S : Finset V) :
    N.cutBound S = N.shiftLower.upperCutCapacity S - ∑ v ∈ S, N.excessAt N.lower v := by
  sorry

theorem Network.cutBound_submodular (S T : Finset V) :
    N.cutBound (S ∪ T) + N.cutBound (S ∩ T) ≤ N.cutBound S + N.cutBound T := by
  sorry

theorem Network.boundedFlow_cut_gap {s t : V} (f : N.BoundedFlow s t)
    {S : Finset V} (hs : s ∈ S) (ht : t ∉ S) :
    N.cutBound S - f.val = (N.residual f.toBoundedAssignment).upperCutCapacity S := by
  sorry

open Classical in
theorem Network.boundedFlow_canonicalCuts {s t : V} (hst : s ≠ t)
    (f : N.BoundedFlow s t) (hf : ∀ g : N.BoundedFlow s t, g.val ≤ f.val) :
    let R := (N.residual f.toBoundedAssignment).positivePart
    let Smin := univ.filter fun v => R.Reachable s v
    let Smax := univ.filter fun v => ¬ R.Reachable v t
    s ∈ Smin ∧ t ∉ Smin ∧ s ∈ Smax ∧ t ∉ Smax ∧
      N.cutBound Smin = f.val ∧ N.cutBound Smax = f.val ∧
      ∀ S : Finset V, s ∈ S → t ∉ S → N.cutBound S = f.val →
        Smin ⊆ S ∧ S ⊆ Smax := by
  sorry

theorem Network.boundedFlow_cut_bounds {s t : V} (f : N.BoundedFlow s t)
    {S : Finset V} (hs : s ∈ S) (ht : t ∉ S) :
    -N.cutBound Sᶜ ≤ f.val ∧ f.val ≤ N.cutBound S := by
  sorry

theorem Network.exists_boundedFlow_extrema {s t : V} (hst : s ≠ t)
    (hf : Nonempty (N.BoundedFlow s t)) :
    ∃ (fmin fmax : N.BoundedFlow s t) (Smin Smax : Finset V),
      s ∈ Smin ∧ t ∉ Smin ∧ s ∈ Smax ∧ t ∉ Smax ∧
      fmin.val = -N.cutBound Sminᶜ ∧ fmax.val = N.cutBound Smax ∧
      ∀ f : N.BoundedFlow s t, fmin.val ≤ f.val ∧ f.val ≤ fmax.val := by
  sorry

theorem Network.exists_boundedFlow_val_iff {s t : V} (hst : s ≠ t)
    (hf : Nonempty (N.BoundedFlow s t)) (q : K) :
    (∃ f : N.BoundedFlow s t, f.val = q) ↔ ∀ S : Finset V,
      s ∈ S → t ∉ S → -N.cutBound Sᶜ ≤ q ∧ q ≤ N.cutBound S := by
  sorry

theorem Network.boundedFlow_isMax_iff {s t : V} (hst : s ≠ t) (f : N.BoundedFlow s t) :
    (∀ g : N.BoundedFlow s t, g.val ≤ f.val) ↔
      ¬ (N.residual f.toBoundedAssignment).positivePart.Reachable s t := by
  sorry

theorem Network.boundedFlow_isMin_iff {s t : V} (hst : s ≠ t) (f : N.BoundedFlow s t) :
    (∀ g : N.BoundedFlow s t, f.val ≤ g.val) ↔
      ¬ (N.residual f.toBoundedAssignment).positivePart.Reachable t s := by
  sorry

/-- Original vertices are `some v`; `none` is a fresh balancing vertex. -/
abbrev Network.withExcessBounds (a b : V → K) (hab : ∀ v, a v ≤ b v) :
    Network K (Option V) where
  Hom v w := match v, w with
    | some v, some w => N.Hom v w
    | some _, none => PUnit
    | none, _ => PEmpty
  lower {v w} := match v, w with
    | some _, some _ => N.lower
    | some v, none => fun _ => a v
    | none, _ => fun e => nomatch e
  upper {v w} := match v, w with
    | some _, some _ => N.upper
    | some v, none => fun _ => b v
    | none, _ => fun e => nomatch e
  lower_le_upper {v w} := match v, w with
    | some _, some _ => N.lower_le_upper
    | some v, none => fun _ => hab v
    | none, _ => fun e => nomatch e

instance Network.withExcessBounds_fintype (a b : V → K) (hab : ∀ v, a v ≤ b v)
    (v w : Option V) : Fintype ((N.withExcessBounds a b hab).Hom v w) := by
  cases v <;> cases w <;> dsimp [Network.withExcessBounds] <;> infer_instance

noncomputable def Network.excessIntervalEquiv (a b : V → K) (hab : ∀ v, a v ≤ b v) :
    N.RealizesWithin a b ≃ (N.withExcessBounds a b hab).Circulation := by
  sorry

theorem Network.excessIntervalEquiv_original (a b : V → K) (hab : ∀ v, a v ≤ b v)
    (f : N.RealizesWithin a b) {v w : V} (e : N.Hom v w) :
    (N.excessIntervalEquiv a b hab f).val.toFun (v := some v) (w := some w) e =
      f.val.toFun e := by
  sorry

theorem Network.excessIntervalEquiv_auxiliary (a b : V → K) (hab : ∀ v, a v ≤ b v)
    (f : N.RealizesWithin a b) (v : V) :
    (N.excessIntervalEquiv a b hab f).val.toFun (v := some v) (w := none) PUnit.unit =
      N.excessAt f.val.toFun v := by
  sorry

theorem Network.nonempty_realizesWithin_iff (a b : V → K) (hab : ∀ v, a v ≤ b v) :
    Nonempty (N.RealizesWithin a b) ↔ ∀ S : Finset V,
      (∑ v ∈ S, a v) ≤ N.cutBound Sᶜ ∧ -N.cutBound S ≤ ∑ v ∈ S, b v := by
  sorry

theorem Network.realizesWithin_or_obstruction (a b : V → K) (hab : ∀ v, a v ≤ b v) :
    Nonempty (N.RealizesWithin a b) ∨ ∃ S : Finset V,
      N.cutBound Sᶜ < (∑ v ∈ S, a v) ∨ (∑ v ∈ S, b v) < -N.cutBound S := by
  sorry

theorem Network.exists_realizesWithin_mem_addSubgroup (a b : V → K)
    (H : AddSubgroup K)
    (hlo : ∀ {v w} (e : N.Hom v w), N.lower e ∈ H)
    (hhi : ∀ {v w} (e : N.Hom v w), N.upper e ∈ H)
    (ha : ∀ v, a v ∈ H) (hb : ∀ v, b v ∈ H)
    (hf : Nonempty (N.RealizesWithin a b)) :
    ∃ f : N.RealizesWithin a b, ∀ {v w} (e : N.Hom v w), f.val.toFun e ∈ H := by
  sorry

end FiniteBounds

section Rounding

variable (Q : Quiver V) [Fintype V] [∀ v w, Fintype (Q.Hom v w)]

theorem exists_integer_rounding {R : Type*} [Ring R] [LinearOrder R]
    [IsStrictOrderedRing R] [FloorRing R] (f : Assignment Q R) (b : V → ℤ)
    (hb : ∀ v, excessAt Q f v = (b v : R)) :
    ∃ g : Assignment Q ℤ, (∀ v, excessAt Q g v = b v) ∧
      ∀ {v w} (e : Q.Hom v w), ⌊f e⌋ ≤ g e ∧ g e ≤ ⌈f e⌉ := by
  sorry

theorem exists_integer_rounding_rat (f : Assignment Q ℚ) (b : V → ℤ)
    (hb : ∀ v, excessAt Q f v = (b v : ℚ)) :
    ∃ g : Assignment Q ℤ, (∀ v, excessAt Q g v = b v) ∧
      ∀ {v w} (e : Q.Hom v w), ⌊f e⌋ ≤ g e ∧ g e ≤ ⌈f e⌉ :=
  exists_integer_rounding Q f b hb

theorem exists_integer_rounding_real (f : Assignment Q ℝ) (b : V → ℤ)
    (hb : ∀ v, excessAt Q f v = (b v : ℝ)) :
    ∃ g : Assignment Q ℤ, (∀ v, excessAt Q g v = b v) ∧
      ∀ {v w} (e : Q.Hom v w), ⌊f e⌋ ≤ g e ∧ g e ≤ ⌈f e⌉ :=
  exists_integer_rounding Q f b hb

end Rounding

end TauCetiRoadmap.FiniteGraphConnectivity

/-!
## Multigraph connectivity and transport

Native undirected walks follow the shape of the shared-walk proposal
[#36756](https://github.com/leanprover-community/mathlib4/pull/36756) with the `Graph` darts of
[#39053](https://github.com/leanprover-community/mathlib4/pull/39053): a walk is a sequence of
steps, each a dart of the graph with the matching ends, and it retains edge identities. The
bidirected arrow family is the proof-side device on which the flow reductions run; Milestone 1
requires the correspondence stated below. All definitions here are stand-ins in a prototype
namespace; the implementation extends `Graph` and the shared walk API.
-/

namespace TauCetiRoadmap.FiniteGraphConnectivity.Multigraph

variable {α : Type u} {β : Type v} (G : Graph α β)

/-- Stand-in for the darts of [#39053](https://github.com/leanprover-community/mathlib4/pull/39053):
an edge with an ordered pair of ends. A loop has a forward and a backward dart. -/
inductive Dart (α : Type u) (β : Type v) : Type (max u v)
  | dir (e : β) (u v : α) (h : u ≠ v)
  | fwd (e : β) (u : α)
  | bwd (e : β) (u : α)

namespace Dart

def src : Dart α β → α
  | dir _ u _ _ => u
  | fwd _ u => u
  | bwd _ u => u

def tgt : Dart α β → α
  | dir _ _ v _ => v
  | fwd _ u => u
  | bwd _ u => u

def edge : Dart α β → β
  | dir e _ _ _ => e
  | fwd e _ => e
  | bwd e _ => e

end Dart

/-- The darts of `G`: those whose edge links their ends in `G`. -/
def darts : Set (Dart α β) := {d | G.IsLink d.edge d.src d.tgt}

/-- A step from `u` to `v`: a dart of `G` with those ends. -/
def Step (u v : α) := {d : Dart α β // d ∈ darts G ∧ d.src = u ∧ d.tgt = v}

/-- Native walks in the shape of `GraphLike.Walk`. A zero-length walk exists at every ambient
vertex, so reachability adds the membership condition. -/
inductive Walk : α → α → Type (max u v)
  | nil {u : α} : Walk u u
  | cons {u v w : α} (s : Step G u v) (p : Walk v w) : Walk u w

namespace Walk

variable {G}

def length : ∀ {u v : α}, Walk G u v → ℕ
  | _, _, .nil => 0
  | _, _, .cons _ p => p.length + 1

def support : ∀ {u v : α}, Walk G u v → List α
  | u, _, .nil => [u]
  | u, _, .cons _ p => u :: p.support

/-- The traversed edge identities in order; both darts of a loop give the same edge. -/
def edges : ∀ {u v : α}, Walk G u v → List β
  | _, _, .nil => []
  | _, _, .cons s p => s.val.edge :: p.edges

def IsPath {u v : α} (p : Walk G u v) : Prop := p.support.Nodup

/-- Positive length, no repeated vertices apart from the endpoints, and no repeated edge
identity: a loop is a one-edge cycle, two parallel edges form a two-edge cycle, and traversing
one edge out and back is not a cycle. -/
def IsCycle {u : α} (p : Walk G u u) : Prop :=
  0 < p.length ∧ p.support.tail.Nodup ∧ p.edges.Nodup

def EdgeDisjoint {u v : α} (p q : Walk G u v) : Prop := p.edges.Disjoint q.edges

def InternallyDisjoint {u v : α} (p q : Walk G u v) : Prop :=
  ∀ x ∈ p.support, x ∈ q.support → x = u ∨ x = v

end Walk

/-- Reachability between actual vertices. The membership condition excludes the zero-length walk
at an ambient non-vertex; a positive-length walk has actual endpoints automatically. -/
def Reachable (s t : α) : Prop := s ∈ G.vertexSet ∧ Nonempty (Walk G s t)

/-- The bidirected arrow family has one arrow per incident edge and ordered pair of ends.
A loop gives one loop arrow; a nonloop edge gives two opposite arrows. -/
abbrev Hom (s t : G.vertexSet) := {e : G.edgeSet // G.IsLink e.val s.val t.val}

/-- The correspondence required in Milestone 1: a native walk between actual vertices gives a
path of the bidirected quiver with the same vertex and edge sequences, and conversely. The two
darts of a loop both map to its one loop arrow, so this is not a bijection on walks. -/
noncomputable def Walk.toBidirected {s t : G.vertexSet} (p : Walk G s t) :
    ArrowWalk (Hom G) s t := by
  sorry

theorem Walk.vertices_toBidirected {s t : G.vertexSet} (p : Walk G s t) :
    (ArrowWalk.vertices p.toBidirected).map Subtype.val = p.support := by
  sorry

theorem Walk.isPath_toBidirected {s t : G.vertexSet} (p : Walk G s t) :
    ArrowWalk.IsPath p.toBidirected ↔ p.IsPath := by
  sorry

noncomputable def Walk.ofBidirected {s t : G.vertexSet} (q : ArrowWalk (Hom G) s t) :
    {p : Walk G s t // p.support = (ArrowWalk.vertices q).map Subtype.val ∧
      p.edges = (ArrowWalk.arrows q).map fun a => a.2.2.val.val} := by
  sorry

theorem reachable_iff_toSimpleGraph (s t : G.vertexSet) :
    Reachable G s t ↔ G.toSimpleGraph.Reachable s t := by
  sorry

/-- Vertex connectivity reuses the underlying simple graph. -/
abbrev IsVertexConnected (k : ℕ∞) : Prop :=
  TauCetiRoadmap.FiniteGraphConnectivity.IsVertexConnected G.toSimpleGraph k

def IsEdgeReachable (k : ℕ) (s t : G.vertexSet) : Prop :=
  ∀ F : Set β, F ⊆ G.edgeSet → F.encard < k → Reachable (G.deleteEdges F) s t

def IsEdgeConnected (k : ℕ) : Prop := ∀ s t : G.vertexSet, IsEdgeReachable G k s t

noncomputable def edgeConnectivity : ℕ∞ :=
  ⨆ (k : ℕ) (_ : IsEdgeConnected G k), (k : ℕ∞)

/-- A bridge is an actual edge; unlike `SimpleGraph.IsBridge`, this is false on non-edges. -/
def IsBridge (e : β) : Prop :=
  ∃ s t, G.IsLink e s t ∧ ¬ Reachable (G.deleteEdges {e}) s t

theorem isBridge_iff_not_mem_cycle (e : G.edgeSet) :
    IsBridge G e.val ↔ ∀ (s : α) (p : Walk G s s), p.IsCycle → e.val ∉ p.edges := by
  sorry

/-- Edge deletion retains multiplicity; only actual vertices and edges need be finite. -/
theorem exists_paths_edgeSeparator_card_eq [Finite G.vertexSet] [Finite G.edgeSet]
    {s t : G.vertexSet} (hst : s ≠ t) :
    ∃ (k : ℕ) (P : Fin k → Walk G s t) (F : Set β),
      Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
      (Pairwise fun i j => (P i).EdgeDisjoint (P j)) ∧
      F ⊆ G.edgeSet ∧ F.ncard = k ∧ ¬ Reachable (G.deleteEdges F) s t := by
  sorry

theorem isEdgeReachable_iff_exists_paths [Finite G.vertexSet] [Finite G.edgeSet]
    {s t : G.vertexSet} (hst : s ≠ t) (k : ℕ) :
    IsEdgeReachable G k s t ↔
      ∃ P : Fin k → Walk G s t, Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
        Pairwise fun i j => (P i).EdgeDisjoint (P j) := by
  sorry

/-- Vertex Menger returns paths with original edge identities. -/
theorem exists_paths_vertexSeparator_card_eq [Finite G.vertexSet]
    {s t : G.vertexSet} (hst : s ≠ t) (hadj : ¬ G.Adj s.val t.val) :
    ∃ (k : ℕ) (P : Fin k → Walk G s t) (X : Set α),
      Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
      (Pairwise fun i j => (P i).InternallyDisjoint (P j)) ∧
      X ⊆ G.vertexSet ∧ X.ncard = k ∧ s.val ∉ X ∧ t.val ∉ X ∧
      ¬ Reachable (G.deleteVerts X) s t := by
  sorry

/-- All direct terminal edges contribute distinct one-edge paths. -/
theorem exists_paths_separator_card_eq_add_multiplicity
    [Finite G.vertexSet] [Finite G.edgeSet] {s t : G.vertexSet} (hst : s ≠ t) :
    let D : Set β := {e | G.IsLink e s.val t.val}
    ∃ (k : ℕ) (P : Fin (k + D.ncard) → Walk G s t) (X : Set α),
      Function.Injective P ∧ (∀ i, (P i).IsPath) ∧
      (Pairwise fun i j => (P i).InternallyDisjoint (P j)) ∧
      X ⊆ G.vertexSet ∧ X.ncard = k ∧ s.val ∉ X ∧ t.val ∉ X ∧
      ¬ Reachable ((G.deleteEdges D).deleteVerts X) s t := by
  sorry

/-- A simple path projects without forgetting any vertex. Distinct parallel one-edge paths
can still have the same projection. -/
noncomputable def projectPath {s t : G.vertexSet} (p : Walk G s t) (hp : p.IsPath) :
    {q : G.toSimpleGraph.Walk s t // q.IsPath ∧ q.support.map Subtype.val = p.support} := by
  sorry

noncomputable def liftPath {s t : G.vertexSet} (p : G.toSimpleGraph.Walk s t) (hp : p.IsPath) :
    {q : Walk G s t // q.IsPath ∧ q.support = p.support.map Subtype.val} := by
  sorry

/-- On simple graphs the correspondence is an equivalence even for arbitrary walks. -/
noncomputable def ofSimpleGraphWalkEquiv {V : Type*} (H : SimpleGraph V) (s t : V) :
    H.Walk s t ≃ Walk (Graph.ofSimpleGraph H) s t := by
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
      (∀ s t : G.vertexSet, Reachable G s t) ∧ ∀ e ∈ G.edgeSet, ¬ IsBridge G e := by
  sorry

/-- The graph traced by a walk, with the original ambient vertex and edge types. -/
def walkGraph {s t : α} (p : Walk G s t) : Graph α β :=
  (G.induce {x | x ∈ p.support}).deleteEdges {e | e ∉ p.edges}

inductive Ear (H : Graph α β) : Type max u v
  | open {s t : α} (p : Walk G s t) (hp : p.IsPath)
      (hs : s ∈ H.vertexSet) (ht : t ∈ H.vertexSet) (hst : s ≠ t)
      (hint : ∀ x ∈ p.support, x ≠ s → x ≠ t → x ∉ H.vertexSet)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet)
  | closed {s : α} (p : Walk G s s) (hp : p.IsCycle) (hs : s ∈ H.vertexSet)
      (hint : ∀ x ∈ p.support, x ≠ s → x ∉ H.vertexSet)
      (hedge : ∀ e ∈ p.edges, e ∉ H.edgeSet)

def Ear.toWalk {H : Graph α β} : Ear G H → Σ s t : α, Walk G s t
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
  initial : {v : α // v ∈ G.vertexSet ∧ graphAfter 0 = Graph.noEdge {v} β} ⊕
    (Σ s : α, {p : Walk G s s // p.IsCycle ∧ graphAfter 0 = walkGraph G p})
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
  lower _ := 0
  upper e := c e.val
  lower_le_upper e := hc e.val

variable [Fintype G.vertexSet] [Fintype G.edgeSet]

open Classical in
noncomputable def edgeCutCapacity (c : G.edgeSet → K) (S : Finset G.vertexSet) : K :=
  ∑ e : G.edgeSet, if ∃ s ∈ S, ∃ t ∉ S, G.IsLink e.val s.val t.val then c e else 0

open Classical in
theorem bidirected_edgeCutCapacity (c : G.edgeSet → K) (hc : ∀ e, 0 ≤ c e)
    (S : Finset G.vertexSet) :
    (bidirectedNetwork G c hc).upperCutCapacity S = edgeCutCapacity G c S := by
  sorry

open Classical in
/-- The aggregated pair capacity counts all parallel edges and discards loops. -/
noncomputable def pairCapacity (c : G.edgeSet → K) (p : Sym2 G.vertexSet) : K :=
  ∑ e : G.edgeSet,
    if ∃ s t : G.vertexSet, s ≠ t ∧ p = s(s, t) ∧ G.IsLink e.val s.val t.val then c e else 0

open Classical in
theorem pairCutCapacity_pairCapacity (c : G.edgeSet → K) (S : Finset G.vertexSet) :
    pairCutCapacity (pairCapacity G c) S =
      edgeCutCapacity G c S := by
  sorry

open Classical in
theorem isSymmSubmodular_edgeCutCapacity (c : G.edgeSet → K) (hc : ∀ e, 0 ≤ c e) :
    IsSymmSubmodular (edgeCutCapacity G c) := by
  sorry

open Classical in
theorem isEdgeReachable_iff_le_minCut {s t : G.vertexSet} (hst : s ≠ t) (k : ℕ) :
    IsEdgeReachable G k s t ↔ (k : ℤ) ≤ minCut (edgeCutCapacity G (fun _ => (1 : ℤ))) s t := by
  sorry

end Capacities

end TauCetiRoadmap.FiniteGraphConnectivity.Multigraph

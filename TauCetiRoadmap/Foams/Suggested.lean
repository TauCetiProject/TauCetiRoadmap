import Mathlib

set_option autoImplicit false

/-!
# Foams: suggested interfaces

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

This prototype covers the following parts of the roadmap.

* Layer 0, *Unlabelled closed webs*: the record `ClosedWeb`, with mirror and reversal.
* Layer 0, *Labelling data and labelled prefoams*: `NilvalentLabelingDatum`,
  `LabelingDatum` with the extra structure `LabelingDatum.NeutralLabel` for data with a label 0;
  labelled closed webs `LabeledClosedWeb` with Goertz–Marino–Wedrich's ordered vertex equation; the
  natural-label webs `NonnegativeWeb`, `PositiveWeb` and `BoundedPositiveWeb`.
* Layer 0, *The gl(N) labelling instances*: the data `LabelingDatum.glNonnegative` and
  `LabelingDatum.glPositive`, the Bar-Natan datum, and the equivariant coefficient ring
  `EquivariantRing N`.
* Layers 1–2: the unit-valued circle trace coefficient and its sign
  specializations. The default is σ=1; σ=-1 is the Robert–Wagner specialization.
* Layer 0, *Web presentations*, and Layer 4, *The gl(N) foam monoidal 2-category*: signed
  boundary words, generating and basic webs, planar generator words `WebWord s t`, and the
  weighted Euler characteristic that fixes the shift of the 2-hom modules.
* Layer 2, *State spaces and the evaluated foam category*: the universal construction for any
  `R`-linear monoidal category with an `R`-linear evaluation of the endomorphisms of its unit
  (`ClosedEvaluation`): radical, state space, gluing maps and the state-action ideal `I₂`. The
  gl(N) and both Bar-Natan state spaces are instances.
* Layer 3, *Semistrict structure and local enrichment*: the data
  (`SemistrictMonoidalBicategoryStruct`) and the conditions (`SemistrictMonoidalBicategory`) of
  Baez–Neuchl, Lemma 4, on a strict Mathlib bicategory, with the tensorator in
  Goertz–Marino–Wedrich's direction.

Prefoams with boundary, their categories, decorations, linearization, evaluations, open-web
incidence data, closures of words, the expression syntax `WebExpr s t` and its diagram
quotient `WebDiagram s t`, the trace ideal `I₁`, Layer 3's enrichment, coefficient instances and
formal shifts, the foam 2-categories themselves, spatial duality, the foam compiler and Layer 7's canopolis are not stated here; their types do not
exist yet.

The README's Khovanov comparison milestones KH1–KH4 specialize the nilvalent
branch to the chosen dual-number Frobenius algebra with `deg X = -2` and
`c = -1`, so the circle `A{1}` has degrees `+1, -1` on `1, X`. KH2 compares
states with Khovanov circle tensors; KH3 compares compiled elementary maps;
KH4 maps formal surfaces to evaluated disk categories. These targets are not
prototyped here: the nilvalent states, compiler and disk categories have no
types in this file. Do not substitute free predicates or arbitrary categories
for them. Prototype the comparisons against the owning roadmap interfaces
when those types are available; the mathematical specification is in README.md.

Labels are independent of the evaluation rank. The positive theory is a subtype of the
nonnegative theory, and a rank bound is a separate predicate. Incidence counts edge ends, so a
self-loop arc contributes two incidences. Merge/split roles are specified even at zero labels;
the label equation alone does not define an allowed zero-label vertex. Vertex-free circles are
separate.

These are unreduced combinatorial records, without a planar realization. In particular,
an all-zero theta retains its two vertices. No zero-erasure procedure or foam carrier is
specified here. The roadmap's admissibility and zero-removal targets remain necessary.

Developed as part of an autoformalization working group at IPAM, including
Juan Ramón Gómez García, Qiuyu Ren, Iordanis Romaidis, Paul Wedrich,
Michael Willis and Hongjian Yang.
The finite-record choices here are suggestions, not a required implementation of the roadmap.

References: [A] Goertz–Marino–Wedrich, arXiv:2602.11120.
-/

namespace TauCetiRoadmap.Foams

open scoped BigOperators

universe u v w

/-! ## Layer 0: unlabelled closed webs -/

/-- The two occurrences of an interval edge, distinguished even for a self-loop arc. -/
inductive EdgeEnd where
  | source
  | target
  deriving DecidableEq

instance : Fintype EdgeEnd where
  elems := {.source, .target}
  complete h := by cases h <;> decide

/-- Reversing an arc exchanges its two ends. -/
def EdgeEnd.swap : EdgeEnd → EdgeEnd
  | .source => .target
  | .target => .source

@[simp] theorem EdgeEnd.swap_swap (h : EdgeEnd) : h.swap.swap = h := by
  cases h <;> rfl

/-- Orientation pattern at a trivalent vertex, independently of its labels. -/
inductive VertexKind where
  | merge
  | split
  deriving DecidableEq

/-- Reversing all arcs turns merges into splits and splits into merges. -/
def VertexKind.swap : VertexKind → VertexKind
  | .merge => .split
  | .split => .merge

/-- A merge has one outgoing large edge; a split has one incoming large edge. -/
def VertexKind.largeEnd : VertexKind → EdgeEnd
  | .merge => .source
  | .split => .target

/-- The common end type of the two small edges at a vertex. -/
def VertexKind.smallEnd : VertexKind → EdgeEnd
  | .merge => .target
  | .split => .source

theorem VertexKind.largeEnd_swap (k : VertexKind) : k.swap.largeEnd = k.largeEnd.swap := by
  cases k <;> rfl

theorem VertexKind.smallEnd_swap (k : VertexKind) : k.swap.smallEnd = k.smallEnd.swap := by
  cases k <;> rfl

/-- Endpoint of an edge-end occurrence. -/
def endpoint {V : Type u} {A : Type v} (source target : A → V) : A × EdgeEnd → V
  | (e, .source) => source e
  | (e, .target) => target e

/-- Incident ends, rather than the set of adjacent edges. -/
abbrev Incident {V : Type u} {A : Type v} (source target : A → V) (x : V) :=
  { h : A × EdgeEnd // endpoint source target h = x }

theorem endpoint_swap {V : Type u} {A : Type v} (source target : A → V) (h : A × EdgeEnd) :
    endpoint target source (h.1, h.2.swap) = endpoint source target h := by
  rcases h with ⟨e, _ | _⟩ <;> rfl

/-- Reversing every arc identifies the ends at `x` with the ends at `x` of the reversed web,
exchanging source and target ends. -/
def incidentSwap {V : Type u} {A : Type v} (source target : A → V) (x : V) :
    Incident source target x ≃ Incident target source x where
  toFun h := ⟨(h.val.1, h.val.2.swap), (endpoint_swap source target h.val).trans h.property⟩
  invFun h := ⟨(h.val.1, h.val.2.swap), (endpoint_swap target source h.val).trans h.property⟩
  left_inv h := by rcases h with ⟨⟨e, _ | _⟩, _⟩ <;> rfl
  right_inv h := by rcases h with ⟨⟨e, _ | _⟩, _⟩ <;> rfl

@[simp] theorem incidentSwap_apply_coe {V : Type u} {A : Type v} (source target : A → V) (x : V)
    (h : Incident source target x) :
    (incidentSwap source target x h).val = (h.val.1, h.val.2.swap) := rfl

@[simp] theorem incidentSwap_symm_apply_coe {V : Type u} {A : Type v} (source target : A → V)
    (x : V) (h : Incident target source x) :
    ((incidentSwap source target x).symm h).val = (h.val.1, h.val.2.swap) := rfl

/-- A fixed-point-free permutation of a three-element type is a three-cycle, so its inverse is
its square. -/
private theorem perm_symm_apply_eq_of_card_eq_three {α : Type*} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) (hcard : Fintype.card α = 3) (hσ : ∀ a, σ a ≠ a) (a : α) :
    σ.symm a = σ (σ a) := by
  have hsupp : σ.support = Finset.univ := by
    ext b
    simp [Equiv.Perm.mem_support, hσ b]
  have h3 : σ.IsThreeCycle := by
    rw [← card_support_eq_three_iff, hsupp, Finset.card_univ, hcard]
  have hpow : σ ^ 3 = 1 := by
    rw [← h3.orderOf]
    exact pow_orderOf_eq_one σ
  have h := congrArg (fun τ : Equiv.Perm α => τ a) hpow
  simp only [pow_three, Equiv.Perm.coe_mul, Function.comp_apply, Equiv.Perm.coe_one,
    id_eq] at h
  rw [Equiv.symm_apply_eq]
  exact h.symm

/-- **Layer 0, Unlabelled closed webs** ([A] Defs. 3.4–3.5). A candidate unreduced,
unlabelled closed web: finite vertices, oriented interval edges (arcs) and vertex-free circles.
The README's `ClosedWeb`; the labelled record is `LabeledClosedWeb`.

Each vertex has three incident ends, a cyclic order on them (the cyclic successor
`cyclicNext`, a fixed-point-free permutation of a three-element type) and a merge/split
orientation pattern. The large end is the unique end with the minority orientation. Keeping
this role explicit avoids recovering it from the largest numerical label, which fails when
labels vanish. The record contains no labels. -/
structure ClosedWeb where
  Vertex : Type u
  Arc : Type v
  Circle : Type w
  [vertexFintype : Fintype Vertex]
  [arcFintype : Fintype Arc]
  [circleFintype : Fintype Circle]
  [vertexDecidableEq : DecidableEq Vertex]
  source : Arc → Vertex
  target : Arc → Vertex
  trivalent : ∀ x, Fintype.card (Incident source target x) = 3
  cyclicNext : (x : Vertex) → Equiv.Perm (Incident source target x)
  cyclicNext_ne : ∀ x h, cyclicNext x h ≠ h
  kind : Vertex → VertexKind
  large : (x : Vertex) → Incident source target x
  large_role : ∀ x, (large x).val.2 = (kind x).largeEnd
  small_role : ∀ x h, h ≠ large x → h.val.2 = (kind x).smallEnd

attribute [instance] ClosedWeb.vertexFintype ClosedWeb.arcFintype
  ClosedWeb.circleFintype ClosedWeb.vertexDecidableEq

namespace ClosedWeb

/-- This predicate exposes the distinct-endpoint convention for comparison with
Goertz–Marino–Wedrich ([A] Def. 3.1). Here a loop is an arc whose two ends are the same vertex,
not Goertz–Marino–Wedrich's loop, which is a vertex-free circle. -/
def NoLoops (W : ClosedWeb.{u,v,w}) : Prop := ∀ e, W.source e ≠ W.target e

/-- The first small end `e₁` at `x`: the successor of the large end in the cyclic order
([A] Def. 3.12). -/
def firstSmallEnd (W : ClosedWeb.{u,v,w}) (x : W.Vertex) : Incident W.source W.target x :=
  W.cyclicNext x (W.large x)

/-- The second small end `e₂` at `x`: the successor of `e₁` in the cyclic order. -/
def secondSmallEnd (W : ClosedWeb.{u,v,w}) (x : W.Vertex) : Incident W.source W.target x :=
  W.cyclicNext x (W.firstSmallEnd x)

/-- **Layer 0, Unlabelled closed webs.** The cyclic successor is a three-cycle, so its
inverse is its square. Proof: a fixed-point-free permutation of three elements has support of
size three. -/
theorem cyclicNext_symm_apply (W : ClosedWeb.{u,v,w}) (x : W.Vertex)
    (h : Incident W.source W.target x) :
    (W.cyclicNext x).symm h = W.cyclicNext x (W.cyclicNext x h) := by
  classical
  exact perm_symm_apply_eq_of_card_eq_three (W.cyclicNext x) (W.trivalent x)
    (W.cyclicNext_ne x) h

/-- **Layer 0, Unlabelled closed webs.** The empty web. -/
def empty : ClosedWeb where
  Vertex := Fin 0
  Arc := Fin 0
  Circle := Fin 0
  source := Fin.elim0
  target := Fin.elim0
  trivalent := fun x => Fin.elim0 x
  cyclicNext := fun x => Fin.elim0 x
  cyclicNext_ne := fun x => Fin.elim0 x
  kind := Fin.elim0
  large := fun x => Fin.elim0 x
  large_role := fun x => Fin.elim0 x
  small_role := fun x => Fin.elim0 x

/-- **Layer 0, Unlabelled closed webs.** Mirror `W^m` ([A] Def. 3.5) reverses cyclic orders,
retaining interval orientations. -/
def mirror (W : ClosedWeb.{u,v,w}) : ClosedWeb.{u,v,w} :=
  { W with
    cyclicNext := fun x => (W.cyclicNext x).symm
    cyclicNext_ne := by
      intro x h hfix
      have heq := congrArg (W.cyclicNext x) hfix
      simp only [Equiv.apply_symm_apply] at heq
      exact W.cyclicNext_ne x h heq.symm }

@[simp] theorem mirror_mirror (W : ClosedWeb.{u,v,w}) : W.mirror.mirror = W := by
  cases W
  rfl

/-- **Layer 0, Unlabelled closed webs.** Reverse `W^r` ([A] Def. 3.5) reverses the orientation
of every arc, keeping the cyclic orders and the large end; merges and splits are exchanged. -/
def reverse (W : ClosedWeb.{u,v,w}) : ClosedWeb.{u,v,w} where
  Vertex := W.Vertex
  Arc := W.Arc
  Circle := W.Circle
  source := W.target
  target := W.source
  trivalent x := (Fintype.card_congr (incidentSwap W.source W.target x)).symm.trans
    (W.trivalent x)
  cyclicNext x := (incidentSwap W.source W.target x).permCongr (W.cyclicNext x)
  cyclicNext_ne x h hfix := by
    rw [Equiv.permCongr_apply, ← Equiv.eq_symm_apply] at hfix
    exact W.cyclicNext_ne x _ hfix
  kind x := (W.kind x).swap
  large x := incidentSwap W.source W.target x (W.large x)
  large_role x := by
    rw [incidentSwap_apply_coe, W.large_role x, VertexKind.largeEnd_swap]
  small_role x h hne := by
    have hne' : (incidentSwap W.source W.target x).symm h ≠ W.large x := by
      intro heq
      apply hne
      rw [← heq, Equiv.apply_symm_apply]
    have hsmall := W.small_role x _ hne'
    rw [incidentSwap_symm_apply_coe] at hsmall
    rw [VertexKind.smallEnd_swap, ← hsmall, EdgeEnd.swap_swap]

end ClosedWeb

/-! ## Layer 0: labelled closed webs -/

/-- **Layer 0, Labelling data and labelled prefoams** ([A] Def. 3.12). A labelled closed web
assigns a label to every arc and every vertex-free circle. At each vertex `x`, the cyclic order
is refined to the total order `(e₁, e₂, e₃)` with `e₃ = large x` the end of odd orientation,
`e₁ = cyclicNext x e₃` and `e₂ = cyclicNext x e₁`; the labels satisfy the ordered equation
`label e₁ + label e₂ = label e₃`. The label operation need not be commutative.

The parameter is the label type with its operation; for a datum `L : LabelingDatum R`, the
labelled webs are `LabeledClosedWeb L.Label`. -/
structure LabeledClosedWeb (Label : Type*) [Add Label] extends ClosedWeb.{u, v, w} where
  label : Arc ⊕ Circle → Label
  label_add_label : ∀ x : Vertex,
    label (.inl (cyclicNext x (large x)).val.1) +
        label (.inl (cyclicNext x (cyclicNext x (large x))).val.1) =
      label (.inl (large x).val.1)

-- The vertex, arc and circle universes are independent, as in `ClosedWeb`.
set_option linter.checkUnivs false in
/-- **Layer 0, The gl(N) labelling instances.** Webs with arbitrary nonnegative natural labels:
the natural-label instance `L_ℕ`, with no upper bound on labels. -/
abbrev NonnegativeWeb := LabeledClosedWeb.{u, v, w, 0} ℕ

namespace LabeledClosedWeb

variable {Label : Type*}

/-- The ordered vertex equation, restated through the named ends `e₁ = firstSmallEnd` and
`e₂ = secondSmallEnd`. Proof: definitional. -/
theorem label_firstSmallEnd_add_label_secondSmallEnd [Add Label]
    (W : LabeledClosedWeb.{u, v, w} Label) (x : W.Vertex) :
    W.label (.inl (W.firstSmallEnd x).val.1) + W.label (.inl (W.secondSmallEnd x).val.1) =
      W.label (.inl (W.large x).val.1) :=
  W.label_add_label x

/-- **Layer 0, Labelling data and labelled prefoams.** Flux conservation: at each vertex the
labels of incoming arcs and of outgoing arcs have the same sum. This is the unordered shadow of
the vertex equation, for commutative labels. Proof: the three ends at `x` are the large end and
`e₁`, `e₂`; the large end is outgoing at a merge and incoming at a split, and the small ends
have the other orientation. -/
theorem flux [AddCommMonoid Label] (W : LabeledClosedWeb.{u, v, w} Label) (x : W.Vertex) :
    (∑ e : W.Arc, if W.target e = x then W.label (.inl e) else 0) =
      ∑ e : W.Arc, if W.source e = x then W.label (.inl e) else 0 := by
  classical
  have hsum : ∀ g : W.Arc × EdgeEnd → Label,
      (∑ h : Incident W.source W.target x, g h.val) =
        ∑ e : W.Arc, ((if W.source e = x then g (e, .source) else 0) +
          (if W.target e = x then g (e, .target) else 0)) := by
    intro g
    rw [← Finset.sum_subtype (Finset.univ.filter fun p => endpoint W.source W.target p = x)
      (fun p => by simp) g, Finset.sum_filter, Fintype.sum_prod_type]
    refine Finset.sum_congr rfl fun e _ => ?_
    rw [show (Finset.univ : Finset EdgeEnd) = {.source, .target} by decide,
      Finset.sum_pair (by decide)]
    rfl
  have hT := hsum fun p => if p.2 = .target then W.label (.inl p.1) else 0
  have hS := hsum fun p => if p.2 = .source then W.label (.inl p.1) else 0
  simp only [reduceCtorEq, ↓reduceIte, ite_self, zero_add, add_zero] at hT hS
  set σ := W.cyclicNext x
  set L := W.large x
  have h1 : σ L ≠ L := W.cyclicNext_ne x L
  have h2 : σ (σ L) ≠ σ L := W.cyclicNext_ne x (σ L)
  have h3 : σ (σ L) ≠ L := by
    intro h
    have hsymm := W.cyclicNext_symm_apply x L
    rw [h, Equiv.symm_apply_eq] at hsymm
    exact h1 hsymm.symm
  have huniv : (Finset.univ : Finset (Incident W.source W.target x)) = {L, σ L, σ (σ L)} :=
    (Finset.eq_univ_of_card _ ((Finset.card_eq_three.2
      ⟨L, σ L, σ (σ L), h1.symm, h3.symm, h2.symm, rfl⟩).trans (W.trivalent x).symm)).symm
  have hnotin : L ∉ ({σ L, σ (σ L)} : Finset (Incident W.source W.target x)) := by
    simp [Ne.symm h1, Ne.symm h3]
  rw [← hT, ← hS, huniv, Finset.sum_insert hnotin, Finset.sum_pair h2.symm,
    Finset.sum_insert hnotin, Finset.sum_pair h2.symm,
    W.small_role x _ h1, W.small_role x _ h3, W.large_role x]
  have hadd := W.label_add_label x
  rcases hk : W.kind x with _ | _
  · simpa [VertexKind.largeEnd, VertexKind.smallEnd] using hadd
  · simpa [VertexKind.largeEnd, VertexKind.smallEnd] using hadd.symm

/-- **Layer 0, Unlabelled closed webs**, labelled version. Mirror reverses the cyclic orders and
keeps the labels. It is defined only for commutative label operations: mirroring exchanges
`e₁` and `e₂`, so the ordered equation `a + b = c` becomes `b + a = c`. -/
def mirror [AddCommSemigroup Label] (W : LabeledClosedWeb.{u, v, w} Label) :
    LabeledClosedWeb.{u, v, w} Label where
  toClosedWeb := W.toClosedWeb.mirror
  label := W.label
  label_add_label x := by
    show W.label (.inl ((W.cyclicNext x).symm (W.large x)).val.1) +
        W.label (.inl ((W.cyclicNext x).symm ((W.cyclicNext x).symm (W.large x))).val.1) =
      W.label (.inl (W.large x).val.1)
    rw [W.cyclicNext_symm_apply x (W.large x), Equiv.symm_apply_apply, add_comm]
    exact W.label_add_label x

@[simp] theorem mirror_mirror [AddCommSemigroup Label] (W : LabeledClosedWeb.{u, v, w} Label) :
    W.mirror.mirror = W := by
  rcases W with ⟨⟨⟩⟩
  rfl

/-- **Layer 0, Unlabelled closed webs**, labelled version. Reversal keeps the labels, the cyclic
orders and the large ends, so the ordered equation is unchanged; no commutativity is needed. -/
def reverse [Add Label] (W : LabeledClosedWeb.{u, v, w} Label) :
    LabeledClosedWeb.{u, v, w} Label where
  toClosedWeb := W.toClosedWeb.reverse
  label := W.label
  label_add_label x := by
    have key : ∀ h : Incident W.source W.target x,
        (incidentSwap W.source W.target x).permCongr (W.cyclicNext x)
            (incidentSwap W.source W.target x h) =
          incidentSwap W.source W.target x (W.cyclicNext x h) := by
      intro h
      rw [Equiv.permCongr_apply, Equiv.symm_apply_apply]
    show W.label (.inl ((incidentSwap W.source W.target x).permCongr (W.cyclicNext x)
          (incidentSwap W.source W.target x (W.large x))).val.1) +
        W.label (.inl ((incidentSwap W.source W.target x).permCongr (W.cyclicNext x)
          ((incidentSwap W.source W.target x).permCongr (W.cyclicNext x)
            (incidentSwap W.source W.target x (W.large x)))).val.1) =
      W.label (.inl (incidentSwap W.source W.target x (W.large x)).val.1)
    rw [key, key]
    exact W.label_add_label x

/-- Strict positivity includes labels of the vertex-free circles. -/
def IsPositive (W : LabeledClosedWeb.{u, v, w} ℕ) : Prop := ∀ e, 0 < W.label e

/-- A bound is a property of a web, not a parameter of the raw carrier. -/
def LabelsAtMost (W : LabeledClosedWeb.{u, v, w} ℕ) (N : ℕ) : Prop := ∀ e, W.label e ≤ N

theorem labelsAtMost_mono (W : LabeledClosedWeb.{u, v, w} ℕ) {N M : ℕ}
    (h : W.LabelsAtMost N) (hNM : N ≤ M) : W.LabelsAtMost M :=
  fun e => (h e).trans hNM

theorem not_labelsAtMost_of_overlarge (W : LabeledClosedWeb.{u, v, w} ℕ) {N : ℕ}
    (e : W.Arc ⊕ W.Circle) (h : N < W.label e) : ¬ W.LabelsAtMost N := by
  intro hbound
  exact (Nat.not_lt_of_ge (hbound e)) h

@[simp] theorem isPositive_mirror (W : LabeledClosedWeb.{u, v, w} ℕ) :
    W.mirror.IsPositive ↔ W.IsPositive := Iff.rfl

@[simp] theorem labelsAtMost_mirror (W : LabeledClosedWeb.{u, v, w} ℕ) (N : ℕ) :
    W.mirror.LabelsAtMost N ↔ W.LabelsAtMost N := Iff.rfl

@[simp] theorem isPositive_reverse (W : LabeledClosedWeb.{u, v, w} ℕ) :
    W.reverse.IsPositive ↔ W.IsPositive := Iff.rfl

end LabeledClosedWeb

set_option linter.checkUnivs false in
/-- **Layer 0, The gl(N) labelling instances.** The positive theory `L_+`, with no evaluation
rank and no upper bound on labels. -/
abbrev PositiveWeb := { W : NonnegativeWeb.{u,v,w} // W.IsPositive }

set_option linter.checkUnivs false in
/-- The bounded positive subtheory. Evaluation separately assumes `0 < N`. -/
abbrev BoundedPositiveWeb (N : ℕ) :=
  { W : PositiveWeb.{u,v,w} // W.val.LabelsAtMost N }

namespace PositiveWeb

/-- Inclusion keeps all vertex, circle and cyclic-order data. -/
def toNonnegative (W : PositiveWeb.{u,v,w}) : NonnegativeWeb.{u,v,w} := W.val

theorem toNonnegative_injective :
    Function.Injective (toNonnegative : PositiveWeb.{u,v,w} → NonnegativeWeb.{u,v,w}) :=
  Subtype.val_injective

theorem exists_toNonnegative_iff (W : NonnegativeWeb.{u,v,w}) :
    (∃ P : PositiveWeb.{u,v,w}, P.toNonnegative = W) ↔ W.IsPositive := by
  constructor
  · rintro ⟨P, rfl⟩
    exact P.property
  · intro h
    exact ⟨⟨W, h⟩, rfl⟩

def mirror (W : PositiveWeb.{u,v,w}) : PositiveWeb.{u,v,w} :=
  ⟨W.val.mirror, W.property⟩

/-- **Layer 0, The gl(N) labelling instances.** Positive natural-labelled webs are the labelled
webs of the datum `L_+`, whose label type is `ℕ+`. Both directions keep the underlying unlabelled
web and the numerical labels. -/
def equivPNat : PositiveWeb.{u,v,w} ≃ LabeledClosedWeb.{u,v,w} ℕ+ where
  toFun W :=
    { W.val.toClosedWeb with
      label := fun e => ⟨W.val.label e, W.property e⟩
      label_add_label := fun x => PNat.eq (W.val.label_add_label x) }
  invFun W :=
    ⟨{ W.toClosedWeb with
        label := fun e => (W.label e : ℕ)
        label_add_label := fun x => by rw [← PNat.add_coe, W.label_add_label x] },
      fun e => (W.label e).pos⟩
  left_inv _ := rfl
  right_inv _ := rfl

end PositiveWeb

namespace BoundedPositiveWeb

def forgetBound {N : ℕ} (W : BoundedPositiveWeb.{u,v,w} N) : PositiveWeb.{u,v,w} := W.val

theorem forgetBound_injective (N : ℕ) :
    Function.Injective (forgetBound : BoundedPositiveWeb.{u,v,w} N → PositiveWeb.{u,v,w}) :=
  Subtype.val_injective

def increaseBound {N M : ℕ} (hNM : N ≤ M) (W : BoundedPositiveWeb.{u,v,w} N) :
    BoundedPositiveWeb.{u,v,w} M :=
  ⟨W.val, W.val.val.labelsAtMost_mono W.property hNM⟩

@[simp] theorem forget_increaseBound {N M : ℕ} (hNM : N ≤ M)
    (W : BoundedPositiveWeb.{u,v,w} N) :
    (increaseBound hNM W).forgetBound = W.forgetBound := rfl

end BoundedPositiveWeb

/-! ## Layer 0: labelling data and the gl(N) and Bar-Natan instances -/

/-- **Layer 0, Labelling data and labelled prefoams** ([A] Def. 2.4, nilvalent case). A
labelling datum for nilvalent prefoams over a commutative ring `R`: a type of labels and a
commutative `R`-algebra `Dec a` of decorations for each label `a`. -/
structure NilvalentLabelingDatum (R : Type u) [CommRing R] where
  Label : Type v
  Dec : Label → Type w
  [commRing : ∀ a, CommRing (Dec a)]
  [algebra : ∀ a, Algebra R (Dec a)]

attribute [instance] NilvalentLabelingDatum.commRing NilvalentLabelingDatum.algebra

/-- **Layer 0, Labelling data and labelled prefoams** ([A] Def. 2.4, trivalent case). A
trivalent labelling datum: a nilvalent datum whose labels form a semigroup, with associative
operation written `+`. The operation need not be commutative, and there need not be a neutral
label (the positive natural labels have none). -/
structure LabelingDatum (R : Type u) [CommRing R] extends NilvalentLabelingDatum.{u, v, w} R where
  [addSemigroup : AddSemigroup Label]

attribute [instance] LabelingDatum.addSemigroup

/-- **Layer 0, Labelling data and labelled prefoams.** A neutral label `0` of a trivalent
datum, together with the required identification `Dec(0) ≅ R` ([A] Def. 2.4). It is a separate
structure because the positive natural labels have no `0`. -/
structure LabelingDatum.NeutralLabel {R : Type u} [CommRing R]
    (L : LabelingDatum.{u, v, w} R) where
  zero : L.Label
  zero_add : ∀ a, zero + a = a
  add_zero : ∀ a, a + zero = a
  decAlgEquiv : L.Dec zero ≃ₐ[R] R

/-- **Layer 0, The gl(N) labelling instances** (README `L_ℕ`; [A] Exs. 2.10–2.11). Nonnegative
natural labels under addition, with `Dec_R(a) = R[x₁,…,x_a]^{S_a}`. -/
noncomputable def LabelingDatum.glNonnegative (R : Type u) [CommRing R] :
    LabelingDatum.{u, 0, u} R where
  Label := ℕ
  Dec a := MvPolynomial.symmetricSubalgebra (Fin a) R

/-- **Layer 0, The gl(N) labelling instances** (README `L_+`). Positive natural labels under
addition, with `Dec_R(a) = R[x₁,…,x_a]^{S_a}`. -/
noncomputable def LabelingDatum.glPositive (R : Type u) [CommRing R] :
    LabelingDatum.{u, 0, u} R where
  Label := ℕ+
  Dec a := MvPolynomial.symmetricSubalgebra (Fin a) R

/-- With no variables every polynomial is symmetric. -/
private theorem symmetricSubalgebra_fin_zero (R : Type u) [CommRing R] :
    MvPolynomial.symmetricSubalgebra (Fin 0) R = ⊤ := by
  refine eq_top_iff.2 fun p _ => (MvPolynomial.mem_symmetricSubalgebra p).2 fun e => ?_
  have he : (⇑e : Fin 0 → Fin 0) = id := funext fun i => i.elim0
  rw [he, MvPolynomial.rename_id]
  rfl

/-- **Layer 0, The gl(N) labelling instances.** The neutral label `0` of `L_ℕ`, with
`Dec_R(0) = R[]^{S_0} ≅ R`: every polynomial in zero variables is symmetric and constant. -/
noncomputable def LabelingDatum.NeutralLabel.glNonnegative (R : Type u) [CommRing R] :
    (LabelingDatum.glNonnegative R).NeutralLabel where
  zero := (0 : ℕ)
  zero_add := Nat.zero_add
  add_zero := Nat.add_zero
  decAlgEquiv :=
    (Subalgebra.equivOfEq _ _ (symmetricSubalgebra_fin_zero R)).trans
      (Subalgebra.topEquiv.trans (MvPolynomial.isEmptyAlgEquiv R (Fin 0)))

/-- **Layer 0, Labelling data and labelled prefoams.** The Bar-Natan datum: a single label
with decoration algebra `A`. The Frobenius structure of `A` is not part of the datum. -/
def NilvalentLabelingDatum.barNatan (R : Type u) [CommRing R] (A : Type v) [CommRing A]
    [Algebra R A] : NilvalentLabelingDatum.{u, 0, v} R where
  Label := Unit
  Dec _ := A

/-! ## Standing conventions: the equivariant coefficient ring -/

/-- **Standing conventions** (gl(N) bullet). The equivariant coefficient ring
`Λ_N = ℤ[e₁,…,e_N]`, `deg eᵢ = 2i` ([A] Ex. 2.11). A type synonym of `MvPolynomial (Fin N) ℤ`:
the Lean variable `X i` is the prose generator `e_{i+1}`. -/
def EquivariantRing (N : ℕ) : Type := MvPolynomial (Fin N) ℤ

namespace EquivariantRing

noncomputable instance (N : ℕ) : CommRing (EquivariantRing N) :=
  inferInstanceAs (CommRing (MvPolynomial (Fin N) ℤ))

noncomputable instance (N : ℕ) : Algebra ℤ (EquivariantRing N) :=
  inferInstanceAs (Algebra ℤ (MvPolynomial (Fin N) ℤ))

/-- The grading of `Λ_N`: `X i` (prose `e_{i+1}`) has degree `2(i+1)`. -/
def grading (N : ℕ) : ℤ → Submodule ℤ (EquivariantRing N) :=
  MvPolynomial.weightedHomogeneousSubmodule ℤ (fun i : Fin N => 2 * ((i : ℕ) + 1 : ℤ))

noncomputable instance (N : ℕ) : GradedAlgebra (grading N) :=
  MvPolynomial.weightedGradedAlgebra ℤ _

/-- **Standing conventions** (gl(N) bullet). `Λ_N` is the ring of symmetric polynomials in the
pigment variables `X₁,…,X_N`, by `eᵢ ↦ eᵢ(X₁,…,X_N)` (fundamental theorem of symmetric
polynomials, `MvPolynomial.esymmAlgEquiv`). -/
noncomputable def toSymmetric (N : ℕ) :
    EquivariantRing N ≃ₐ[ℤ] MvPolynomial.symmetricSubalgebra (Fin N) ℤ :=
  MvPolynomial.esymmAlgEquiv (Fin N) ℤ (Fintype.card_fin N)

theorem toSymmetric_X (N : ℕ) (i : Fin N) :
    (toSymmetric N (MvPolynomial.X i) : MvPolynomial (Fin N) ℤ) =
      MvPolynomial.esymm (Fin N) ℤ ((i : ℕ) + 1) := by
  show ((MvPolynomial.esymmAlgEquiv (Fin N) ℤ (Fintype.card_fin N) (MvPolynomial.X i) :
    MvPolynomial (Fin N) ℤ)) = _
  rw [MvPolynomial.esymmAlgEquiv_apply, MvPolynomial.esymmAlgHom_apply, MvPolynomial.aeval_X]

end EquivariantRing

/-! ## Layers 1–2: circle trace normalization (default σ=1) -/

namespace Normalization

variable {R : Type*} [CommRing R]

/-- The coefficient of Wu's normalized Sylvester trace on an `a`-labelled circle.
README Layer 2, *Circle state spaces as Frobenius algebras*. The unit is assumed
degree zero in graded applications; this definition concerns its underlying value. -/
def circleTraceUnit (σ : Rˣ) (a : ℕ) : Rˣ :=
  (-1) ^ (a.choose 2) * σ ^ a

/-- Literal Robert–Wagner specialization, with exponent `a(a+1)/2`. -/
theorem circleTraceUnit_robertWagner (a : ℕ) :
    circleTraceUnit (-1 : Rˣ) a = (-1 : Rˣ) ^ ((a + 1).choose 2) := by
  sorry

/-- Default σ=1: the positive one-color normalization of Ehrig–Tubbenhauer–Wedrich. -/
theorem circleTraceUnit_positive (a : ℕ) :
    circleTraceUnit (1 : Rˣ) a = (-1 : Rˣ) ^ (a.choose 2) := by
  simp [circleTraceUnit]

end Normalization

/-- **Standing conventions** (gl(N) bullet). The pigment ring `ℤ[X₁,…,X_N]`, `deg X_j = 2`
(Robert–Wagner, §2.2): a second type synonym of `MvPolynomial (Fin N) ℤ`, with its own grading. -/
def PigmentRing (N : ℕ) : Type := MvPolynomial (Fin N) ℤ

namespace PigmentRing

noncomputable instance (N : ℕ) : CommRing (PigmentRing N) :=
  inferInstanceAs (CommRing (MvPolynomial (Fin N) ℤ))

noncomputable instance (N : ℕ) : Algebra ℤ (PigmentRing N) :=
  inferInstanceAs (Algebra ℤ (MvPolynomial (Fin N) ℤ))

/-- The grading of the pigment ring: every variable has degree `2`. -/
def grading (N : ℕ) : ℤ → Submodule ℤ (PigmentRing N) :=
  MvPolynomial.weightedHomogeneousSubmodule ℤ (fun _ : Fin N => (2 : ℤ))

noncomputable instance (N : ℕ) : GradedAlgebra (grading N) :=
  MvPolynomial.weightedGradedAlgebra ℤ _

end PigmentRing

/-- The inclusion `Λ_N → ℤ[X₁,…,X_N]`, `eᵢ ↦ eᵢ(X₁,…,X_N)`. -/
noncomputable def EquivariantRing.toPigment (N : ℕ) : EquivariantRing N →ₐ[ℤ] PigmentRing N :=
  (MvPolynomial.symmetricSubalgebra (Fin N) ℤ).val.comp (EquivariantRing.toSymmetric N).toAlgHom

/-- Evaluation at weighted-homogeneous polynomials: if `φ` has `w`-degree `d` and each `g i` has
`w'`-degree `w i`, then `φ(g)` has `w'`-degree `d`. -/
private theorem isWeightedHomogeneous_aeval {σ τ : Type*} {w : σ → ℤ} {w' : τ → ℤ}
    {φ : MvPolynomial σ ℤ} {d : ℤ} (hφ : φ.IsWeightedHomogeneous w d)
    (g : σ → MvPolynomial τ ℤ) (hg : ∀ i, (g i).IsWeightedHomogeneous w' (w i)) :
    (MvPolynomial.aeval g φ).IsWeightedHomogeneous w' d := by
  rw [MvPolynomial.aeval_def, MvPolynomial.algebraMap_eq, MvPolynomial.eval₂_eq]
  apply MvPolynomial.IsWeightedHomogeneous.sum
  intro u hu
  rw [← zero_add d]
  apply MvPolynomial.IsWeightedHomogeneous.mul (MvPolynomial.isWeightedHomogeneous_C _ _)
  have := MvPolynomial.IsWeightedHomogeneous.prod u.support (fun i => g i ^ u i)
    (fun i => u i • w i) (fun i _ => (hg i).pow (u i))
  convert this using 1
  rw [← hφ (MvPolynomial.mem_support_iff.1 hu), Finsupp.weight_apply, Finsupp.sum]

/-- `eₙ(X₁,…,X_N)` has degree `2n` when every pigment variable has degree `2`. -/
private theorem isWeightedHomogeneous_esymm (N n : ℕ) :
    (MvPolynomial.esymm (Fin N) ℤ n).IsWeightedHomogeneous (fun _ : Fin N => (2 : ℤ))
      (2 * n) := by
  rw [MvPolynomial.esymm]
  apply MvPolynomial.IsWeightedHomogeneous.sum
  intro t ht
  have := MvPolynomial.IsWeightedHomogeneous.prod t
    (fun i => (MvPolynomial.X i : MvPolynomial (Fin N) ℤ)) (fun _ => (2 : ℤ))
    (fun i _ => MvPolynomial.isWeightedHomogeneous_X ℤ _ i)
  rw [Finset.sum_const, (Finset.mem_powersetCard.1 ht).2, nsmul_eq_mul, mul_comm] at this
  exact this

/-- **Standing conventions** (gl(N) bullet). The inclusion `Λ_N → ℤ[X₁,…,X_N]` preserves
degrees: `eᵢ` and `eᵢ(X₁,…,X_N)` both have degree `2i`. Proof: `eᵢ(X)` is homogeneous of degree
`i` in variables of degree `2`, and evaluation at weighted-homogeneous elements preserves the
weighted degree. -/
theorem EquivariantRing.toPigment_mem_grading (N : ℕ) {d : ℤ} {x : EquivariantRing N}
    (hx : x ∈ EquivariantRing.grading N d) :
    EquivariantRing.toPigment N x ∈ PigmentRing.grading N d := by
  have h : (EquivariantRing.toPigment N x : MvPolynomial (Fin N) ℤ) =
      MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin N) ℤ ((i : ℕ) + 1))
        (x : MvPolynomial (Fin N) ℤ) :=
    MvPolynomial.esymmAlgHom_apply (σ := Fin N) (R := ℤ) (n := N) x
  show MvPolynomial.IsWeightedHomogeneous _
    (EquivariantRing.toPigment N x : MvPolynomial (Fin N) ℤ) d
  rw [h]
  refine isWeightedHomogeneous_aeval hx _ fun i => ?_
  convert isWeightedHomogeneous_esymm N ((i : ℕ) + 1) using 1
  push_cast
  ring

/-! ## Layer 0 (web presentations) and Layer 4: boundary words and planar generator words -/

/-- **Layer 4, The gl(N) foam monoidal 2-category** ([A] Def. 4.1, Conv. 4.3). The sign of a
boundary point: `pos` is `↑`, prose `+a = (a, ↑) = â`, a strand oriented in the direction of
composition of 1-morphisms; `neg` is `↓`, prose `−a = (a, ↓) = ǎ`. -/
inductive BoundarySign where
  | pos
  | neg
  deriving DecidableEq

/-- Exchanging `↑` and `↓`. -/
def BoundarySign.flip : BoundarySign → BoundarySign
  | .pos => .neg
  | .neg => .pos

@[simp] theorem BoundarySign.flip_flip (σ : BoundarySign) : σ.flip.flip = σ := by
  cases σ <;> rfl

/-- **Layer 0, Web presentations**; **Layer 4** ([A] Def. 4.1). A boundary word: a finite
ordered list of signed labels `(a, σ)`, written `+a` or `−a` in prose. The empty word `∅` is
the tensor unit and concatenation `++` is the tensor `⊠` on objects. It is a one-field
structure, so that the quiver of basic webs lives on boundary words. -/
@[ext] structure BoundaryWord (Label : Type u) where
  /-- The signed labels, from left to right. -/
  toList : List (Label × BoundarySign)
  deriving DecidableEq

namespace BoundaryWord

variable {Label : Type u}

/-- The empty word `∅`, the tensor unit. -/
instance : EmptyCollection (BoundaryWord Label) := ⟨⟨[]⟩⟩

/-- Concatenation, the tensor `⊠` on objects. -/
instance : Append (BoundaryWord Label) := ⟨fun s t => ⟨s.toList ++ t.toList⟩⟩

@[simp] theorem toList_empty : (∅ : BoundaryWord Label).toList = [] := rfl

@[simp] theorem toList_append (s t : BoundaryWord Label) :
    (s ++ t).toList = s.toList ++ t.toList := rfl

/-- **Layer 4** ([A] Constr. 4.7; prose `s^#`). The dual word reverses the order and flips
every sign. -/
def dual (s : BoundaryWord Label) : BoundaryWord Label :=
  ⟨s.toList.reverse.map fun p => (p.1, p.2.flip)⟩

@[simp] theorem dual_dual (s : BoundaryWord Label) : s.dual.dual = s := by
  ext1
  simp [dual, List.map_reverse, Function.comp_def]

theorem dual_append (s t : BoundaryWord Label) : (s ++ t).dual = t.dual ++ s.dual := by
  ext1
  simp [dual]

/-- **Layer 4** ([A] Ex. 4.33). The boundary weight `c(s) = Σ k(N − k)` over the
points of `s`, computed in `ℤ` (labels may exceed `N`). -/
def weight (N : ℕ) (s : BoundaryWord ℕ) : ℤ :=
  (s.toList.map fun p => (p.1 : ℤ) * ((N : ℤ) - p.1)).sum

@[simp] theorem weight_empty (N : ℕ) : (∅ : BoundaryWord ℕ).weight N = 0 := rfl

theorem weight_append (N : ℕ) (s t : BoundaryWord ℕ) :
    (s ++ t).weight N = s.weight N + t.weight N := by
  simp [weight]

theorem weight_dual (N : ℕ) (s : BoundaryWord ℕ) : s.dual.weight N = s.weight N := by
  simp [weight, dual, List.map_reverse, Function.comp_def]

end BoundaryWord

/-- **Layer 4, The gl(N) foam monoidal 2-category** ([A] Def. 4.2(i); README Layer 4,
"Give typed identity strands, both oriented cups and caps, and merge/split vertices").
The generating webs, indexed by source and target words:

* `merge a b : (+a, +b) → (+(a+b))` and `split a b : (+(a+b)) → (+a, +b)`;
* `cupLeft a : ∅ → (+a, −a)`, prose `cup←_a`;
* `cupRight a : ∅ → (−a, +a)`, prose `cup→_a`;
* `capRight a : (+a, −a) → ∅`, prose `cap→_a`;
* `capLeft a : (−a, +a) → ∅`, prose `cap←_a`.

The constructor names follow the arrows of [A]: `Left` is `←` and `Right` is `→`. -/
inductive GeneratingWeb (Label : Type u) [Add Label] :
    BoundaryWord Label → BoundaryWord Label → Type u
  | merge (a b : Label) : GeneratingWeb Label ⟨[(a, .pos), (b, .pos)]⟩ ⟨[(a + b, .pos)]⟩
  | split (a b : Label) : GeneratingWeb Label ⟨[(a + b, .pos)]⟩ ⟨[(a, .pos), (b, .pos)]⟩
  | cupLeft (a : Label) : GeneratingWeb Label ∅ ⟨[(a, .pos), (a, .neg)]⟩
  | cupRight (a : Label) : GeneratingWeb Label ∅ ⟨[(a, .neg), (a, .pos)]⟩
  | capRight (a : Label) : GeneratingWeb Label ⟨[(a, .pos), (a, .neg)]⟩ ∅
  | capLeft (a : Label) : GeneratingWeb Label ⟨[(a, .neg), (a, .pos)]⟩ ∅

/-- **Layer 4** ([A] Def. 4.2(ii); README "scan contexts `id_left ⊠ generator ⊠ id_right`").
A basic web `o_l ⊠ G ⊠ o_r : o_l ⊠ s(G) ⊠ o_r → o_l ⊠ t(G) ⊠ o_r`. -/
inductive BasicWeb {Label : Type u} [Add Label] :
    BoundaryWord Label → BoundaryWord Label → Type u
  | mk (left : BoundaryWord Label) {src tgt : BoundaryWord Label}
      (G : GeneratingWeb Label src tgt) (right : BoundaryWord Label) :
      BasicWeb (left ++ src ++ right) (left ++ tgt ++ right)

/-- Boundary words form a quiver whose arrows are the basic webs. -/
instance BoundaryWord.instQuiver {Label : Type u} [Add Label] : Quiver (BoundaryWord Label) where
  Hom := BasicWeb

/-- **Layer 4, The gl(N) foam monoidal 2-category** ([A] Def. 4.2(iii)). A planar generator
word from `s` to `t`: a composable finite sequence of basic webs, first web first, as a path in
the quiver of basic webs. The empty path is the identity `id_s`; `Quiver.Path.comp` is
composition of 1-morphisms. -/
abbrev WebWord {Label : Type u} [Add Label] (s t : BoundaryWord Label) : Type u :=
  Quiver.Path s t

/-! ### The weighted Euler characteristic and the 2-hom shift -/

/-- The weighted Euler characteristic of a generating web: `a(N−a) + b(N−b) − ab` for a merge
or split vertex with its three boundary arcs, and `a(N−a)` for a cup or cap. -/
def GeneratingWeb.weight (N : ℕ) : {s t : BoundaryWord ℕ} → GeneratingWeb ℕ s t → ℤ
  | _, _, .merge a b => (a : ℤ) * (N - a) + (b : ℤ) * (N - b) - (a : ℤ) * b
  | _, _, .split a b => (a : ℤ) * (N - a) + (b : ℤ) * (N - b) - (a : ℤ) * b
  | _, _, .cupLeft a => (a : ℤ) * (N - a)
  | _, _, .cupRight a => (a : ℤ) * (N - a)
  | _, _, .capRight a => (a : ℤ) * (N - a)
  | _, _, .capLeft a => (a : ℤ) * (N - a)

theorem GeneratingWeb.two_mul_weight_eq_add (N : ℕ) {s t : BoundaryWord ℕ}
    (G : GeneratingWeb ℕ s t) : 2 * G.weight N = s.weight N + t.weight N := by
  cases G <;> simp [GeneratingWeb.weight, BoundaryWord.weight] <;> ring

/-- The weighted Euler characteristic of a basic web `o_l ⊠ G ⊠ o_r`: the passing strands of
`o_l` and `o_r` contribute `c(o_l) + c(o_r)`. -/
def BasicWeb.weight (N : ℕ) : {s t : BoundaryWord ℕ} → BasicWeb s t → ℤ
  | _, _, .mk l G r => l.weight N + r.weight N + G.weight N

theorem BasicWeb.two_mul_weight_eq_add (N : ℕ) {s t : BoundaryWord ℕ} (B : BasicWeb s t) :
    2 * B.weight N = s.weight N + t.weight N := by
  cases B with
  | mk l G r =>
    simp only [BasicWeb.weight, BoundaryWord.weight_append]
    have := G.two_mul_weight_eq_add N
    linarith

/-- **Layer 4, The gl(N) foam monoidal 2-category** ([A] Ex. 4.33). The
weighted Euler characteristic `w_N(W) = Σ_arcs k(N−k) − Σ_vertices ((k+l)(N−k−l) + kl)` of a
planar generator word, over the arcs of the glued web (each counted once) and its vertices;
circles contribute `0`. Computed by stacking: the identity at `s` gives `c(s)`, and appending a
basic web `B` from `u` adds `w(B) − c(u)`, since each point of `u` joins two edge pieces into
one arc. By [A] Ex. 4.33 it is `−deg(cup_W)`, the degree of the identity foam on `W`. -/
def weightedEulerChar (N : ℕ) {s : BoundaryWord ℕ} : {t : BoundaryWord ℕ} → WebWord s t → ℤ
  | _, .nil => s.weight N
  | _, .cons (b := u) p B => weightedEulerChar N p + BasicWeb.weight N B - u.weight N

/-- **Layer 4** (*The gl(N) foam monoidal 2-category*). `2 w_N(W) = c(s) + c(t)` for every planar
generator word `W : s → t`. Proof: induction on the word; a basic web satisfies it because every
generator does, using `(a+b)(N−a−b) = a(N−a) + b(N−b) − 2ab`. -/
theorem two_mul_weightedEulerChar_eq_add (N : ℕ) {s t : BoundaryWord ℕ} (W : WebWord s t) :
    2 * weightedEulerChar N W = s.weight N + t.weight N := by
  induction W with
  | nil => simp only [weightedEulerChar]; ring
  | cons p B ih =>
    simp only [weightedEulerChar]
    have := BasicWeb.two_mul_weight_eq_add N B
    linarith

/-- **Layer 4** (*The gl(N) foam monoidal 2-category*). Composition: `w_N(p ≫ q) = w_N(p) + w_N(q) −
c(t)` for `p : s → t` and `q : t → u`. Proof: induction on `q`. -/
theorem weightedEulerChar_comp (N : ℕ) {s t u : BoundaryWord ℕ} (p : WebWord s t)
    (q : WebWord t u) :
    weightedEulerChar N (p.comp q) =
      weightedEulerChar N p + weightedEulerChar N q - t.weight N := by
  induction q with
  | nil => simp [weightedEulerChar]
  | cons q B ih =>
    simp only [Quiver.Path.comp_cons, weightedEulerChar, ih]
    ring

/-- **Layer 4, The gl(N) foam monoidal 2-category**. For parallel planar
generator words `S T : s → t`, `w_N(S) = w_N(T)`. Hence the 2-hom shift
`δ(S,T) = ½(w_N(S) + w_N(T))` equals the integer `weightedEulerChar N S`, and
`Hom(S,T) = 𝓕_N(Cl(S,T)){δ(S,T)}`. Proof: both sides equal `½(c(s) + c(t))`. -/
theorem weightedEulerChar_eq_of_parallel (N : ℕ) {s t : BoundaryWord ℕ} (S T : WebWord s t) :
    weightedEulerChar N S = weightedEulerChar N T := by
  have hS := two_mul_weightedEulerChar_eq_add N S
  have hT := two_mul_weightedEulerChar_eq_add N T
  omega

/-- The 2-hom shift as the prose writes it, `½(w_N(S) + w_N(T))`, computed in `ℚ`, is the
integer `w_N(S)`. -/
example (N : ℕ) {s t : BoundaryWord ℕ} (S T : WebWord s t) :
    ((weightedEulerChar N S + weightedEulerChar N T : ℤ) : ℚ) / 2 = weightedEulerChar N S := by
  rw [weightedEulerChar_eq_of_parallel N T S]
  push_cast
  ring

namespace Examples

/-! ### Closed-web examples -/

/-- The empty web is independent of any positive-rank hypothesis. -/
def empty : NonnegativeWeb where
  toClosedWeb := ClosedWeb.empty
  label := fun e => e.elim Fin.elim0 Fin.elim0
  label_add_label := fun x => Fin.elim0 x

def positiveEmpty : PositiveWeb :=
  ⟨empty, fun e => e.elim Fin.elim0 Fin.elim0⟩

/-- A vertex-free circle, including label zero in the unreduced theory. -/
def circle (a : ℕ) : NonnegativeWeb where
  Vertex := Fin 0
  Arc := Fin 0
  Circle := Fin 1
  source := Fin.elim0
  target := Fin.elim0
  trivalent := fun x => Fin.elim0 x
  cyclicNext := fun x => Fin.elim0 x
  cyclicNext_ne := fun x => Fin.elim0 x
  kind := Fin.elim0
  large := fun x => Fin.elim0 x
  large_role := fun x => Fin.elim0 x
  small_role := fun x => Fin.elim0 x
  label := fun e => e.elim Fin.elim0 (fun _ => a)
  label_add_label := fun x => Fin.elim0 x

def positiveCircle (a : ℕ) (ha : 0 < a) : PositiveWeb := by
  refine ⟨circle a, ?_⟩
  intro e
  rcases e with e | e
  · exact Fin.elim0 e
  · exact ha

/-- Overlarge labels remain valid raw objects; evaluated vanishing is a later theorem. -/
def overlargeCircle (N : ℕ) : PositiveWeb := positiveCircle (N + 1) (by omega)

theorem overlargeCircle_not_bounded (N : ℕ) :
    ¬ (overlargeCircle N).val.LabelsAtMost N := by
  intro h
  have hh := h (Sum.inr (0 : Fin 1))
  change N + 1 ≤ N at hh
  omega

private def thetaSource (e : Fin 3) : Fin 2 := if e = 2 then 1 else 0
private def thetaTarget (e : Fin 3) : Fin 2 := if e = 2 then 0 else 1

private def thetaEnd (x : Fin 2) (e : Fin 3) : EdgeEnd :=
  if thetaSource e = x then .source else .target

private def thetaIncident (x : Fin 2) :
    Incident thetaSource thetaTarget x ≃ Fin 3 where
  toFun := fun h => h.val.1
  invFun := fun e => ⟨(e, thetaEnd x e),
    (by decide : ∀ x e, endpoint thetaSource thetaTarget (e, thetaEnd x e) = x) x e⟩
  left_inv := by
    intro h
    apply Subtype.ext
    exact (by decide : ∀ x (h : Incident thetaSource thetaTarget x),
      (h.val.1, thetaEnd x h.val.1) = h.val) x h
  right_inv := fun _ => rfl

private def rotateThree : Equiv.Perm (Fin 3) where
  toFun := fun e => e + 1
  invFun := fun e => e + 2
  left_inv := by decide
  right_inv := by decide

private def thetaNext (reverse : Bool) (x : Fin 2) :
    Equiv.Perm (Incident thetaSource thetaTarget x) :=
  ((thetaIncident x).trans (if reverse then rotateThree.symm else rotateThree)).trans
    (thetaIncident x).symm

private def thetaLabel (a b : ℕ) (e : Fin 3) : ℕ :=
  if e = 0 then a else if e = 1 then b else a + b

/-- Theta with labels `a`, `b`, `a + b`, allowing zeros and independent cyclic orders.
No planarity assertion is made about either choice of cyclic data. With the default cyclic
order, `e₁` has label `a` and `e₂` has label `b` at both vertices; reversing the cyclic order
at a vertex exchanges them, which is allowed because `ℕ` is commutative. -/
def theta (a b : ℕ) (reverseAt : Fin 2 → Bool := fun _ => false) : NonnegativeWeb where
  Vertex := Fin 2
  Arc := Fin 3
  Circle := Fin 0
  source := thetaSource
  target := thetaTarget
  trivalent := by decide
  cyclicNext := fun x => thetaNext (reverseAt x) x
  cyclicNext_ne := fun x h =>
    (by decide : ∀ reverse x h, thetaNext reverse x h ≠ h) (reverseAt x) x h
  kind := fun x => if x = 0 then .split else .merge
  large := fun x => (thetaIncident x).symm 2
  large_role := by decide
  small_role := by decide
  label := fun e => e.elim (thetaLabel a b) Fin.elim0
  label_add_label := by
    intro x
    have key : ∀ (r : Bool) (x : Fin 2),
        (thetaNext r x ((thetaIncident x).symm 2)).val.1 = (if r then 1 else 0) ∧
          (thetaNext r x (thetaNext r x ((thetaIncident x).symm 2))).val.1 =
            (if r then 0 else 1) := by
      decide
    obtain ⟨h1, h2⟩ := key (reverseAt x) x
    show thetaLabel a b (thetaNext (reverseAt x) x ((thetaIncident x).symm 2)).val.1 +
        thetaLabel a b
          (thetaNext (reverseAt x) x (thetaNext (reverseAt x) x ((thetaIncident x).symm 2))).val.1 =
      thetaLabel a b 2
    rw [h1, h2]
    cases reverseAt x <;> simp [thetaLabel, Nat.add_comm]

def positiveTheta (a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (reverseAt : Fin 2 → Bool := fun _ => false) : PositiveWeb := by
  refine ⟨theta a b reverseAt, ?_⟩
  intro e
  rcases e with e | e
  · change Fin 3 at e
    change 0 < if e = 0 then a else if e = 1 then b else a + b
    split_ifs <;> omega
  · exact Fin.elim0 e

def theta112 : PositiveWeb := positiveTheta 1 1 (by decide) (by decide)

def theta112Opposite : PositiveWeb :=
  positiveTheta 1 1 (by decide) (by decide) (fun x => x == 1)

def boundedTheta112 : BoundedPositiveWeb 2 := ⟨theta112, by
  change ∀ e : Fin 3 ⊕ Fin 0,
    e.elim (fun e => if e = 0 then 1 else if e = 1 then 1 else 1 + 1) Fin.elim0 ≤ 2
  decide⟩

/-- Degenerate labels do not delete the vertices of a raw web. -/
def zeroTheta : NonnegativeWeb := theta 0 0

example : Fintype.card zeroTheta.Vertex = 2 := by decide

example : ¬ zeroTheta.IsPositive := by
  intro h
  exact (Nat.lt_irrefl 0) (h (Sum.inl (0 : Fin 3)))

/-- Regression check: a single self-loop arc has two ends at its vertex. -/
example : Fintype.card
    (Incident (fun _ : Fin 1 => (0 : Fin 1)) (fun _ : Fin 1 => (0 : Fin 1)) 0) = 2 := by
  decide

/-- The nonnegative webs are the labelled webs of the datum `L_ℕ`. -/
example (R : Type) [CommRing R] :
    LabeledClosedWeb.{0, 0, 0} (LabelingDatum.glNonnegative R).Label = NonnegativeWeb.{0, 0, 0} :=
  rfl

/-- The equivariant gl(N) datum is `L_ℕ` over `Λ_N`. -/
noncomputable example (N : ℕ) : LabelingDatum (EquivariantRing N) :=
  LabelingDatum.glNonnegative (EquivariantRing N)

/-- `X 1`, prose `e₂`, has degree `4` in `Λ_2`. -/
example : (MvPolynomial.X 1 : EquivariantRing 2) ∈ EquivariantRing.grading 2 4 :=
  MvPolynomial.isWeightedHomogeneous_X ℤ _ (1 : Fin 2)

/-! ### Word examples -/

/-- Merge then split on `(+1, +1)`: `w_2 = 2`. -/
example : weightedEulerChar 2
    (((Quiver.Path.nil : WebWord (⟨[(1, .pos), (1, .pos)]⟩ : BoundaryWord ℕ) _).cons
      (BasicWeb.mk ∅ (.merge 1 1) ∅)).cons (BasicWeb.mk ∅ (.split 1 1) ∅)) = 2 := by
  decide

/-- Merge then split on `(+1, +1)`: `w_3 = 4`. -/
example : weightedEulerChar 3
    (((Quiver.Path.nil : WebWord (⟨[(1, .pos), (1, .pos)]⟩ : BoundaryWord ℕ) _).cons
      (BasicWeb.mk ∅ (.merge 1 1) ∅)).cons (BasicWeb.mk ∅ (.split 1 1) ∅)) = 4 := by
  decide

/-- Merge then split on `(+1, +2)`: `w_4 = 7`. -/
example : weightedEulerChar 4
    (((Quiver.Path.nil : WebWord (⟨[(1, .pos), (2, .pos)]⟩ : BoundaryWord ℕ) _).cons
      (BasicWeb.mk ∅ (.merge 1 2) ∅)).cons (BasicWeb.mk ∅ (.split 1 2) ∅)) = 7 := by
  decide

/-- A cup followed by the matching cap is a circle, which contributes `0`. -/
example (N a : ℕ) : weightedEulerChar N
    (((Quiver.Path.nil : WebWord (∅ : BoundaryWord ℕ) _).cons
      (BasicWeb.mk ∅ (.cupLeft a) ∅)).cons (BasicWeb.mk ∅ (.capRight a) ∅)) = 0 := by
  simp [weightedEulerChar, BasicWeb.weight, GeneratingWeb.weight, BoundaryWord.weight]

/-- The identity on a single `a`-strand is one arc: `w_N = a(N − a)`. -/
example (N a : ℕ) :
    weightedEulerChar N (Quiver.Path.nil : WebWord (⟨[(a, .pos)]⟩ : BoundaryWord ℕ) _) =
      a * ((N : ℤ) - a) := by
  simp [weightedEulerChar, BoundaryWord.weight]

/-- A basic web with a passing strand on the left: `(+c) ⊠ merge a b ⊠ ∅`. -/
example (a b c : ℕ) :
    BasicWeb (⟨[(c, .pos), (a, .pos), (b, .pos)]⟩ : BoundaryWord ℕ) ⟨[(c, .pos), (a + b, .pos)]⟩ :=
  BasicWeb.mk ⟨[(c, .pos)]⟩ (.merge a b) ∅

/-- The dual of `(+a, −b)` is `(+b, −a)`. -/
example (a b : ℕ) :
    (⟨[(a, .pos), (b, .neg)]⟩ : BoundaryWord ℕ).dual = ⟨[(b, .pos), (a, .neg)]⟩ := rfl

end Examples


open CategoryTheory

/-! ## Layer 3: the data of a semistrict monoidal 2-category -/

section SemistrictMonoidal

open Bicategory

/-- **Layer 3, semistrict structure: the data** (README Layer 3, *Semistrict structure and local
enrichment*; Baez–Neuchl, Lemma 4, data (1)–(7)). An object tensor `a ⊠ b`, a unit object
`tensorUnit B` (prose `∅`), the actions of the tensoring operations `a ⊠ -` and `- ⊠ c` on
1-morphisms and 2-morphisms, and the tensorator in Goertz–Marino–Wedrich's direction (Construction
4.28).

On 1- and 2-morphisms the tensor acts through tensoring with an object (`lTensor`, `rTensor`,
distinct from the whiskerings `◁`, `▷`). The composites `lTensor s T ≫ rTensor S t'` and
`rTensor S s' ≫ lTensor t T` are related by the tensorator, an isomorphism. -/
class SemistrictMonoidalBicategoryStruct (B : Type u) [Bicategory.{w, v} B] where
  /-- The tensor of two objects, written `a ⊠ b` (Baez–Neuchl (2)). -/
  tensorObj : B → B → B
  /-- The unit object, prose `∅` (Baez–Neuchl (1)). -/
  tensorUnit (B) : B
  /-- The 1-morphism `a ⊠ g : a ⊠ b ⟶ a ⊠ c` (Baez–Neuchl (4)). -/
  lTensor (a : B) {b c : B} (g : b ⟶ c) : tensorObj a b ⟶ tensorObj a c
  /-- The 1-morphism `f ⊠ c : a ⊠ c ⟶ b ⊠ c` (Baez–Neuchl (3)). -/
  rTensor {a b : B} (f : a ⟶ b) (c : B) : tensorObj a c ⟶ tensorObj b c
  /-- The 2-morphism `a ⊠ β : a ⊠ g ⟶ a ⊠ g'` (Baez–Neuchl (6)). -/
  lTensor₂ (a : B) {b c : B} {g g' : b ⟶ c} (β : g ⟶ g') : lTensor a g ⟶ lTensor a g'
  /-- The 2-morphism `α ⊠ c : f ⊠ c ⟶ f' ⊠ c` (Baez–Neuchl (5)). -/
  rTensor₂ {a b : B} {f f' : a ⟶ b} (α : f ⟶ f') (c : B) : rTensor f c ⟶ rTensor f' c
  /-- The tensorator `⊗_{S,T} : (s ⊠ T) ≫ (S ⊠ t') ≅ (S ⊠ s') ≫ (t ⊠ T)` for `S : s ⟶ t`,
  `T : s' ⟶ t'` (Baez–Neuchl (7); Goertz–Marino–Wedrich, Construction 4.28). -/
  tensorator {s t s' t' : B} (S : s ⟶ t) (T : s' ⟶ t') :
    lTensor s T ≫ rTensor S t' ≅ rTensor S s' ≫ lTensor t T

namespace SemistrictMonoidalBicategory

export SemistrictMonoidalBicategoryStruct
  (tensorObj tensorUnit lTensor rTensor lTensor₂ rTensor₂ tensorator)

/-- The tensor `a ⊠ b` of objects of a semistrict monoidal 2-category. It is defined on objects
only; on 1- and 2-morphisms use `lTensor`, `rTensor`, `lTensor₂`, `rTensor₂`. -/
scoped infixr:70 " ⊠ " => SemistrictMonoidalBicategoryStruct.tensorObj

end SemistrictMonoidalBicategory

open SemistrictMonoidalBicategory

/-! ## Layer 3: the axioms

The field statements below use the field names `tensorObj`, `tensorUnit` rather than the
notation, so that the transport proofs inside the statements see one form of each term. -/

/-- **Layer 3, semistrict monoidal 2-category (Gray monoid)** (README Layer 3, *Semistrict structure
and local enrichment*). The conditions (i)–(viii) of Baez–Neuchl, Lemma 4, on the data
of `SemistrictMonoidalBicategoryStruct`, over a strict bicategory. Every condition of the lemma is a
field below.

Where the two sides of an equation have different types because objects are only
propositionally equal (`(a ⊠ b) ⊠ c = a ⊠ (b ⊠ c)`, `tensorUnit B ⊠ a = a`), they are compared
after composing with `eqToHom` 1-morphisms and 2-morphisms, as in `Functor.ext` and in
`Bicategory.Strict`. Associators and unitors appear where a composite of 1-morphisms is
re-bracketed; in a strict bicategory they are `eqToIso`s.

Conditions of Baez–Neuchl, Lemma 4, and the fields stating them:
* (i) `a ⊠ -` and `- ⊠ c` are (strict) 2-functors: `lTensor_id` … `rTensor₂_whiskerRight`;
  `tensorLeftPseudofunctor`, `tensorRightPseudofunctor` package them as Mathlib
  `StrictPseudofunctor`s.
* (ii) unit: `tensorUnit_tensorObj` … `rTensor₂_tensorUnit`.
* (iii) associativity: `tensorObj_assoc` … `rTensor₂_tensorObj`.
* (iv) `tensorator_lTensor_left`, `tensorator_rTensor_left`, `tensorator_rTensor_right`.
* (v) `lTensor_id`, `rTensor_id` (shared with (i)), `tensorator_id_left`,
  `tensorator_id_right`.
* (vi) `tensorator_naturality_right`; (vii) `tensorator_naturality_left`.
* (viii) `tensorator_comp_right`, `tensorator_comp_left`. -/
class SemistrictMonoidalBicategory (B : Type u) [Bicategory.{w, v} B] [Bicategory.Strict B]
    extends SemistrictMonoidalBicategoryStruct B where
  /-- (i), (v): `a ⊠ 𝟙 b = 𝟙 (a ⊠ b)`. -/
  lTensor_id (a b : B) : lTensor a (𝟙 b) = 𝟙 (tensorObj a b)
  /-- (i): `a ⊠ (g ≫ h) = (a ⊠ g) ≫ (a ⊠ h)`. -/
  lTensor_comp (a : B) {b c d : B} (g : b ⟶ c) (h : c ⟶ d) :
    lTensor a (g ≫ h) = lTensor a g ≫ lTensor a h
  /-- (i): `a ⊠ 𝟙 g = 𝟙 (a ⊠ g)`. -/
  lTensor₂_id (a : B) {b c : B} (g : b ⟶ c) : lTensor₂ a (𝟙 g) = 𝟙 (lTensor a g)
  /-- (i): `a ⊠ (β ≫ β') = (a ⊠ β) ≫ (a ⊠ β')`. -/
  lTensor₂_comp (a : B) {b c : B} {g g' g'' : b ⟶ c} (β : g ⟶ g') (β' : g' ⟶ g'') :
    lTensor₂ a (β ≫ β') = lTensor₂ a β ≫ lTensor₂ a β'
  /-- (i): `a ⊠ -` preserves left whiskering. -/
  lTensor₂_whiskerLeft (a : B) {b c d : B} (g : b ⟶ c) {h h' : c ⟶ d} (β : h ⟶ h') :
    lTensor₂ a (g ◁ β) =
      eqToHom (lTensor_comp a g h) ≫ lTensor a g ◁ lTensor₂ a β ≫
        eqToHom (lTensor_comp a g h').symm
  /-- (i): `a ⊠ -` preserves right whiskering. -/
  lTensor₂_whiskerRight (a : B) {b c d : B} {g g' : b ⟶ c} (β : g ⟶ g') (h : c ⟶ d) :
    lTensor₂ a (β ▷ h) =
      eqToHom (lTensor_comp a g h) ≫ lTensor₂ a β ▷ lTensor a h ≫
        eqToHom (lTensor_comp a g' h).symm
  /-- (i), (v): `𝟙 a ⊠ c = 𝟙 (a ⊠ c)`. -/
  rTensor_id (a c : B) : rTensor (𝟙 a) c = 𝟙 (tensorObj a c)
  /-- (i): `(f ≫ g) ⊠ c = (f ⊠ c) ≫ (g ⊠ c)`. -/
  rTensor_comp {a b d : B} (f : a ⟶ b) (g : b ⟶ d) (c : B) :
    rTensor (f ≫ g) c = rTensor f c ≫ rTensor g c
  /-- (i): `𝟙 f ⊠ c = 𝟙 (f ⊠ c)`. -/
  rTensor₂_id {a b : B} (f : a ⟶ b) (c : B) : rTensor₂ (𝟙 f) c = 𝟙 (rTensor f c)
  /-- (i): `(α ≫ α') ⊠ c = (α ⊠ c) ≫ (α' ⊠ c)`. -/
  rTensor₂_comp {a b : B} {f f' f'' : a ⟶ b} (α : f ⟶ f') (α' : f' ⟶ f'') (c : B) :
    rTensor₂ (α ≫ α') c = rTensor₂ α c ≫ rTensor₂ α' c
  /-- (i): `- ⊠ c` preserves left whiskering. -/
  rTensor₂_whiskerLeft {a b d : B} (f : a ⟶ b) {g g' : b ⟶ d} (α : g ⟶ g') (c : B) :
    rTensor₂ (f ◁ α) c =
      eqToHom (rTensor_comp f g c) ≫ rTensor f c ◁ rTensor₂ α c ≫
        eqToHom (rTensor_comp f g' c).symm
  /-- (i): `- ⊠ c` preserves right whiskering. -/
  rTensor₂_whiskerRight {a b d : B} {f f' : a ⟶ b} (α : f ⟶ f') (g : b ⟶ d) (c : B) :
    rTensor₂ (α ▷ g) c =
      eqToHom (rTensor_comp f g c) ≫ rTensor₂ α c ▷ rTensor g c ≫
        eqToHom (rTensor_comp f' g c).symm
  /-- (ii), objects: `∅ ⊠ a = a`. -/
  tensorUnit_tensorObj (a : B) : tensorObj tensorUnit a = a
  /-- (ii), objects: `a ⊠ ∅ = a`. -/
  tensorObj_tensorUnit (a : B) : tensorObj a tensorUnit = a
  /-- (ii), 1-morphisms: `∅ ⊠ f = f`. -/
  lTensor_tensorUnit {a b : B} (f : a ⟶ b) :
    lTensor tensorUnit f =
      eqToHom (tensorUnit_tensorObj a) ≫ f ≫ eqToHom (tensorUnit_tensorObj b).symm
  /-- (ii), 1-morphisms: `f ⊠ ∅ = f`. -/
  rTensor_tensorUnit {a b : B} (f : a ⟶ b) :
    rTensor f tensorUnit =
      eqToHom (tensorObj_tensorUnit a) ≫ f ≫ eqToHom (tensorObj_tensorUnit b).symm
  /-- (ii), 2-morphisms: `∅ ⊠ α = α`. -/
  lTensor₂_tensorUnit {a b : B} {f f' : a ⟶ b} (α : f ⟶ f') :
    lTensor₂ tensorUnit α =
      eqToHom (lTensor_tensorUnit f) ≫
        (eqToHom (tensorUnit_tensorObj a) ◁ (α ▷ eqToHom (tensorUnit_tensorObj b).symm)) ≫
          eqToHom (lTensor_tensorUnit f').symm
  /-- (ii), 2-morphisms: `α ⊠ ∅ = α`. -/
  rTensor₂_tensorUnit {a b : B} {f f' : a ⟶ b} (α : f ⟶ f') :
    rTensor₂ α tensorUnit =
      eqToHom (rTensor_tensorUnit f) ≫
        (eqToHom (tensorObj_tensorUnit a) ◁ (α ▷ eqToHom (tensorObj_tensorUnit b).symm)) ≫
          eqToHom (rTensor_tensorUnit f').symm
  /-- (iii), objects: `(a ⊠ b) ⊠ c = a ⊠ (b ⊠ c)`. -/
  tensorObj_assoc (a b c : B) : tensorObj (tensorObj a b) c = tensorObj a (tensorObj b c)
  /-- (iii), 1-morphisms: `(a ⊠ b) ⊠ f = a ⊠ (b ⊠ f)`. -/
  lTensor_tensorObj (a b : B) {c d : B} (f : c ⟶ d) :
    lTensor (tensorObj a b) f =
      eqToHom (tensorObj_assoc a b c) ≫ lTensor a (lTensor b f) ≫
        eqToHom (tensorObj_assoc a b d).symm
  /-- (iii), 1-morphisms: `(a ⊠ f) ⊠ b = a ⊠ (f ⊠ b)`. -/
  rTensor_lTensor (a : B) {c d : B} (f : c ⟶ d) (b : B) :
    rTensor (lTensor a f) b =
      eqToHom (tensorObj_assoc a c b) ≫ lTensor a (rTensor f b) ≫
        eqToHom (tensorObj_assoc a d b).symm
  /-- (iii), 1-morphisms: `f ⊠ (a ⊠ b) = (f ⊠ a) ⊠ b`. -/
  rTensor_tensorObj {c d : B} (f : c ⟶ d) (a b : B) :
    rTensor f (tensorObj a b) =
      eqToHom (tensorObj_assoc c a b).symm ≫ rTensor (rTensor f a) b ≫
        eqToHom (tensorObj_assoc d a b)
  /-- (iii), 2-morphisms: `(a ⊠ b) ⊠ α = a ⊠ (b ⊠ α)`. -/
  lTensor₂_tensorObj (a b : B) {c d : B} {f f' : c ⟶ d} (α : f ⟶ f') :
    lTensor₂ (tensorObj a b) α =
      eqToHom (lTensor_tensorObj a b f) ≫
        (eqToHom (tensorObj_assoc a b c) ◁
          (lTensor₂ a (lTensor₂ b α) ▷ eqToHom (tensorObj_assoc a b d).symm)) ≫
          eqToHom (lTensor_tensorObj a b f').symm
  /-- (iii), 2-morphisms: `(a ⊠ α) ⊠ b = a ⊠ (α ⊠ b)`. -/
  rTensor₂_lTensor₂ (a : B) {c d : B} {f f' : c ⟶ d} (α : f ⟶ f') (b : B) :
    rTensor₂ (lTensor₂ a α) b =
      eqToHom (rTensor_lTensor a f b) ≫
        (eqToHom (tensorObj_assoc a c b) ◁
          (lTensor₂ a (rTensor₂ α b) ▷ eqToHom (tensorObj_assoc a d b).symm)) ≫
          eqToHom (rTensor_lTensor a f' b).symm
  /-- (iii), 2-morphisms: `α ⊠ (a ⊠ b) = (α ⊠ a) ⊠ b`. -/
  rTensor₂_tensorObj {c d : B} {f f' : c ⟶ d} (α : f ⟶ f') (a b : B) :
    rTensor₂ α (tensorObj a b) =
      eqToHom (rTensor_tensorObj f a b) ≫
        (eqToHom (tensorObj_assoc c a b).symm ◁
          (rTensor₂ (rTensor₂ α a) b ▷ eqToHom (tensorObj_assoc d a b))) ≫
          eqToHom (rTensor_tensorObj f' a b).symm
  /-- (iv): `⊗_{a ⊠ g, h} = a ⊠ ⊗_{g, h}`. -/
  tensorator_lTensor_left (a : B) {b b' c c' : B} (g : b ⟶ b') (h : c ⟶ c') :
    (tensorator (lTensor a g) h).hom =
      eqToHom (by rw [lTensor_comp, lTensor_tensorObj, rTensor_lTensor]; simp) ≫
        (eqToHom (tensorObj_assoc a b c) ◁
          (lTensor₂ a (tensorator g h).hom ▷ eqToHom (tensorObj_assoc a b' c').symm)) ≫
          eqToHom (by rw [lTensor_comp, lTensor_tensorObj, rTensor_lTensor]; simp)
  /-- (iv): `⊗_{f ⊠ b, h} = ⊗_{f, b ⊠ h}`. -/
  tensorator_rTensor_left {a a' : B} (f : a ⟶ a') (b : B) {c c' : B} (h : c ⟶ c') :
    (tensorator (rTensor f b) h).hom =
      eqToHom (by rw [lTensor_tensorObj, rTensor_tensorObj]; simp) ≫
        (eqToHom (tensorObj_assoc a b c) ◁
          ((tensorator f (lTensor b h)).hom ▷ eqToHom (tensorObj_assoc a' b c').symm)) ≫
          eqToHom (by rw [lTensor_tensorObj, rTensor_tensorObj]; simp)
  /-- (iv): `⊗_{f, g ⊠ c} = ⊗_{f, g} ⊠ c`. -/
  tensorator_rTensor_right {a a' b b' : B} (f : a ⟶ a') (g : b ⟶ b') (c : B) :
    (tensorator f (rTensor g c)).hom =
      eqToHom (by rw [rTensor_comp, rTensor_tensorObj, rTensor_lTensor]; simp) ≫
        (eqToHom (tensorObj_assoc a b c).symm ◁
          (rTensor₂ (tensorator f g).hom c ▷ eqToHom (tensorObj_assoc a' b' c))) ≫
          eqToHom (by rw [rTensor_comp, rTensor_tensorObj, rTensor_lTensor]; simp)
  /-- (v): `⊗_{𝟙 a, g}` is the identity of `a ⊠ g`, up to `𝟙 a ⊠ - = 𝟙` and the unitors. -/
  tensorator_id_left (a : B) {b b' : B} (g : b ⟶ b') :
    (tensorator (𝟙 a) g).hom =
      lTensor a g ◁ eqToHom (rTensor_id a b') ≫ (ρ_ (lTensor a g)).hom ≫
        (λ_ (lTensor a g)).inv ≫ eqToHom (rTensor_id a b).symm ▷ lTensor a g
  /-- (v): `⊗_{f, 𝟙 b}` is the identity of `f ⊠ b`, up to `- ⊠ 𝟙 b = 𝟙` and the unitors. -/
  tensorator_id_right {a a' : B} (f : a ⟶ a') (b : B) :
    (tensorator f (𝟙 b)).hom =
      eqToHom (lTensor_id a b) ▷ rTensor f b ≫ (λ_ (rTensor f b)).hom ≫
        (ρ_ (rTensor f b)).inv ≫ rTensor f b ◁ eqToHom (lTensor_id a' b).symm
  /-- (vi): naturality of the tensorator in its second argument
  (Goertz–Marino–Wedrich (4.14)). -/
  tensorator_naturality_right {a a' b b' : B} (f : a ⟶ a') {g g' : b ⟶ b'} (β : g ⟶ g') :
    lTensor₂ a β ▷ rTensor f b' ≫ (tensorator f g').hom =
      (tensorator f g).hom ≫ rTensor f b ◁ lTensor₂ a' β
  /-- (vii): naturality of the tensorator in its first argument. -/
  tensorator_naturality_left {a a' b b' : B} {f f' : a ⟶ a'} (α : f ⟶ f') (g : b ⟶ b') :
    lTensor a g ◁ rTensor₂ α b' ≫ (tensorator f' g).hom =
      (tensorator f g).hom ≫ rTensor₂ α b ▷ lTensor a' g
  /-- (viii): `⊗_{f, g ≫ g'}` is the pasting of `⊗_{f, g'}` and then `⊗_{f, g}`. -/
  tensorator_comp_right {a a' b b' b'' : B} (f : a ⟶ a') (g : b ⟶ b') (g' : b' ⟶ b'') :
    (tensorator f (g ≫ g')).hom =
      eqToHom (lTensor_comp a g g') ▷ rTensor f b'' ≫
        (α_ (lTensor a g) (lTensor a g') (rTensor f b'')).hom ≫
          lTensor a g ◁ (tensorator f g').hom ≫
            (α_ (lTensor a g) (rTensor f b') (lTensor a' g')).inv ≫
              (tensorator f g).hom ▷ lTensor a' g' ≫
                (α_ (rTensor f b) (lTensor a' g) (lTensor a' g')).hom ≫
                  rTensor f b ◁ eqToHom (lTensor_comp a' g g').symm
  /-- (viii): `⊗_{f ≫ f', g}` is the pasting of `⊗_{f, g}` and then `⊗_{f', g}`. -/
  tensorator_comp_left {a a' a'' b b' : B} (f : a ⟶ a') (f' : a' ⟶ a'') (g : b ⟶ b') :
    (tensorator (f ≫ f') g).hom =
      lTensor a g ◁ eqToHom (rTensor_comp f f' b') ≫
        (α_ (lTensor a g) (rTensor f b') (rTensor f' b')).inv ≫
          (tensorator f g).hom ▷ rTensor f' b' ≫
            (α_ (rTensor f b) (lTensor a' g) (rTensor f' b')).hom ≫
              rTensor f b ◁ (tensorator f' g).hom ≫
                (α_ (rTensor f b) (rTensor f' b) (lTensor a'' g)).inv ≫
                  eqToHom (rTensor_comp f f' b).symm ▷ lTensor a'' g

namespace SemistrictMonoidalBicategory

variable {B : Type u} [Bicategory.{w, v} B] [Bicategory.Strict B] [SemistrictMonoidalBicategory B]

/-- **Layer 3, left tensoring 2-functor** (README Layer 3, *Semistrict structure and local
enrichment*; Baez–Neuchl, Lemma 4 (i); Goertz–Marino–Wedrich, Construction 4.26). `a ⊠ -` as a
Mathlib strict pseudofunctor, built by `StrictPseudofunctor.mk''` from the fields of condition (i).
-/
def tensorLeftPseudofunctor (a : B) : StrictPseudofunctor B B :=
  StrictPseudofunctor.mk''
    { obj := fun b => a ⊠ b
      map := fun g => lTensor a g
      map₂ := fun β => lTensor₂ a β
      map₂_id := SemistrictMonoidalBicategory.lTensor₂_id a
      map₂_comp := SemistrictMonoidalBicategory.lTensor₂_comp a
      map_id := SemistrictMonoidalBicategory.lTensor_id a
      map_comp := SemistrictMonoidalBicategory.lTensor_comp a
      map₂_whisker_left := SemistrictMonoidalBicategory.lTensor₂_whiskerLeft a
      map₂_whisker_right := SemistrictMonoidalBicategory.lTensor₂_whiskerRight a }

/-- **Layer 3, right tensoring 2-functor** (README Layer 3, *Semistrict structure and local
enrichment*; Baez–Neuchl, Lemma 4 (i)). `- ⊠ c` as a Mathlib strict pseudofunctor. -/
def tensorRightPseudofunctor (c : B) : StrictPseudofunctor B B :=
  StrictPseudofunctor.mk''
    { obj := fun a => a ⊠ c
      map := fun f => rTensor f c
      map₂ := fun α => rTensor₂ α c
      map₂_id := fun f => SemistrictMonoidalBicategory.rTensor₂_id f c
      map₂_comp := fun α α' => SemistrictMonoidalBicategory.rTensor₂_comp α α' c
      map_id := fun a => SemistrictMonoidalBicategory.rTensor_id a c
      map_comp := fun f g => SemistrictMonoidalBicategory.rTensor_comp f g c
      map₂_whisker_left := fun f _ _ α =>
        SemistrictMonoidalBicategory.rTensor₂_whiskerLeft f α c
      map₂_whisker_right := fun α g =>
        SemistrictMonoidalBicategory.rTensor₂_whiskerRight α g c }

end SemistrictMonoidalBicategory

/-- **Non-vacuity of the axioms** (README Layer 3, *Semistrict structure and local enrichment*). A
monoid `M`, viewed as the locally discrete bicategory `LocallyDiscrete (Discrete M)` with `a ⊠ b = a
* b`, is a semistrict monoidal 2-category. The object conditions are the monoid laws; every 1- and
2-morphism condition holds because these hom-types are subsingletons. -/
example (M : Type u) [Monoid M] : SemistrictMonoidalBicategory (LocallyDiscrete (Discrete M)) :=
  haveI (x y : LocallyDiscrete (Discrete M)) : Subsingleton (x ⟶ y) :=
    inferInstanceAs (Subsingleton (Discrete (x.as ⟶ y.as)))
  { tensorObj := fun a b => ⟨⟨a.as.as * b.as.as⟩⟩
    tensorUnit := ⟨⟨1⟩⟩
    lTensor := fun a _ _ g => ⟨⟨congrArg (a.as.as * ·) g.as.eq⟩⟩
    rTensor := fun f c => ⟨⟨congrArg (· * c.as.as) f.as.eq⟩⟩
    lTensor₂ := fun _ _ _ _ _ _ => eqToHom (Subsingleton.elim _ _)
    rTensor₂ := fun _ _ => eqToHom (Subsingleton.elim _ _)
    tensorator := fun _ _ => eqToIso (Subsingleton.elim _ _)
    lTensor_id := by intros; exact Subsingleton.elim _ _
    lTensor_comp := by intros; exact Subsingleton.elim _ _
    lTensor₂_id := by intros; exact Subsingleton.elim _ _
    lTensor₂_comp := by intros; exact Subsingleton.elim _ _
    lTensor₂_whiskerLeft := by intros; exact Subsingleton.elim _ _
    lTensor₂_whiskerRight := by intros; exact Subsingleton.elim _ _
    rTensor_id := by intros; exact Subsingleton.elim _ _
    rTensor_comp := by intros; exact Subsingleton.elim _ _
    rTensor₂_id := by intros; exact Subsingleton.elim _ _
    rTensor₂_comp := by intros; exact Subsingleton.elim _ _
    rTensor₂_whiskerLeft := by intros; exact Subsingleton.elim _ _
    rTensor₂_whiskerRight := by intros; exact Subsingleton.elim _ _
    tensorUnit_tensorObj := fun a => by cases a; simp
    tensorObj_tensorUnit := fun a => by cases a; simp
    lTensor_tensorUnit := by intros; exact Subsingleton.elim _ _
    rTensor_tensorUnit := by intros; exact Subsingleton.elim _ _
    lTensor₂_tensorUnit := by intros; exact Subsingleton.elim _ _
    rTensor₂_tensorUnit := by intros; exact Subsingleton.elim _ _
    tensorObj_assoc := fun _ _ _ => by simp [mul_assoc]
    lTensor_tensorObj := by intros; exact Subsingleton.elim _ _
    rTensor_lTensor := by intros; exact Subsingleton.elim _ _
    rTensor_tensorObj := by intros; exact Subsingleton.elim _ _
    lTensor₂_tensorObj := by intros; exact Subsingleton.elim _ _
    rTensor₂_lTensor₂ := by intros; exact Subsingleton.elim _ _
    rTensor₂_tensorObj := by intros; exact Subsingleton.elim _ _
    tensorator_lTensor_left := by intros; exact Subsingleton.elim _ _
    tensorator_rTensor_left := by intros; exact Subsingleton.elim _ _
    tensorator_rTensor_right := by intros; exact Subsingleton.elim _ _
    tensorator_id_left := by intros; exact Subsingleton.elim _ _
    tensorator_id_right := by intros; exact Subsingleton.elim _ _
    tensorator_naturality_right := by intros; exact Subsingleton.elim _ _
    tensorator_naturality_left := by intros; exact Subsingleton.elim _ _
    tensorator_comp_right := by intros; exact Subsingleton.elim _ _
    tensorator_comp_left := by intros; exact Subsingleton.elim _ _ }

end SemistrictMonoidal

/-! ## Layer 2: the universal construction for an arbitrary linear evaluation -/

section UniversalConstruction

open MonoidalCategory

/-- **Layer 2, closed evaluation** (README Layer 2, *State spaces and the evaluated foam category*
and *Bar-Natan state spaces and circle decompositions*; Goertz–Marino–Wedrich, Definition 2.7). An
`R`-linear evaluation of closed morphisms, i.e. of endomorphisms of the tensor unit `𝟙_ C` (prose:
closed foams `∅ → ∅`). No multiplicativity is assumed, as in Goertz–Marino–Wedrich §3.3. The
instances are `ev_(N,σ)` (gl(N), with default `ev_N` at σ=1), `ev_A` and `ev_A^→`
(Bar-Natan). -/
abbrev ClosedEvaluation (R : Type w) [CommRing R] (C : Type u) [Category.{v} C] [Preadditive C]
    [Linear R C] [MonoidalCategory C] :=
  (𝟙_ C ⟶ 𝟙_ C) →ₗ[R] R

namespace ClosedEvaluation

variable {R : Type w} [CommRing R] {C : Type u} [Category.{v} C] [Preadditive C] [Linear R C]
  [MonoidalCategory C] (ev : ClosedEvaluation R C)

/-- **Layer 2, radical** `Rad_ev(W)` (README Layer 2, *State spaces and the evaluated foam
category*). The fillings `x : 𝟙_ C ⟶ W` (prose `Fill(W)`) with `ev(G ∘ x) = 0` for
every test `G : W ⟶ 𝟙_ C`. It equals Goertz–Marino–Wedrich's `I(∅, W)` (Lemma 3.19); see
`actionKernel_tensorUnit_eq_radical`. -/
def radical (W : C) : Submodule R (𝟙_ C ⟶ W) where
  carrier := {x | ∀ G : W ⟶ 𝟙_ C, ev (x ≫ G) = 0}
  add_mem' {x y} hx hy G := by
    rw [Preadditive.add_comp, map_add, hx G, hy G, add_zero]
  zero_mem' G := by
    rw [Limits.zero_comp, map_zero]
  smul_mem' r x hx G := by
    rw [Linear.smul_comp, map_smul, hx G, smul_zero]

theorem mem_radical {W : C} (x : 𝟙_ C ⟶ W) :
    x ∈ ev.radical W ↔ ∀ G : W ⟶ 𝟙_ C, ev (x ≫ G) = 0 :=
  Iff.rfl

/-- **Layer 2, radical as an intersection of kernels** (README Layer 2, *State spaces and the
evaluated foam category*; Robert–Wagner `⋂_G ker φ_G`, §3.3; Goertz–Marino–Wedrich (3.4)). -/
theorem radical_eq_iInf_ker (W : C) :
    ev.radical W = ⨅ G : W ⟶ 𝟙_ C, LinearMap.ker (ev ∘ₗ Linear.rightComp R (𝟙_ C) G) := by
  ext x
  simp [mem_radical, Submodule.mem_iInf]

/-- **Layer 2, state space** `𝓕_ev(W) = Fill(W) / Rad_ev(W)` (README Layer 2, *State spaces and the
evaluated foam category*), an `R`-module. Goertz–Marino–Wedrich's `F(W)` (after
Corollary 3.21). -/
abbrev stateSpace (W : C) : Type v :=
  (𝟙_ C ⟶ W) ⧸ ev.radical W

/-- Gluing a morphism `f : W ⟶ V` onto fillings maps the radical of `W` into that of `V`. -/
theorem radical_le_comap_rightComp {W V : C} (f : W ⟶ V) :
    ev.radical W ≤ (ev.radical V).comap (Linear.rightComp R (𝟙_ C) f) := by
  intro x hx G
  simpa using hx (f ≫ G)

/-- **Layer 2, gluing maps** `𝓕_ev(f)[x] = [f ∘ x]` (README Layer 2, *State spaces and the evaluated
foam category*), induced by `x ↦ x ≫ f`. -/
def stateSpaceMap {W V : C} (f : W ⟶ V) : ev.stateSpace W →ₗ[R] ev.stateSpace V :=
  (ev.radical W).mapQ (ev.radical V) (Linear.rightComp R (𝟙_ C) f)
    (ev.radical_le_comap_rightComp f)

@[simp]
theorem stateSpaceMap_mk {W V : C} (f : W ⟶ V) (x : 𝟙_ C ⟶ W) :
    ev.stateSpaceMap f (Submodule.Quotient.mk x) = Submodule.Quotient.mk (x ≫ f) :=
  rfl

/-- **Layer 2, functoriality of gluing: identities** (README Layer 2, *State spaces and the
evaluated foam category*). -/
@[simp]
theorem stateSpaceMap_id (W : C) : ev.stateSpaceMap (𝟙 W) = LinearMap.id := by
  ext x
  simp

/-- **Layer 2, functoriality of gluing: composition** (README Layer 2, *State spaces and the
evaluated foam category*). -/
theorem stateSpaceMap_comp {W V U : C} (f : W ⟶ V) (g : V ⟶ U) :
    ev.stateSpaceMap (f ≫ g) = ev.stateSpaceMap g ∘ₗ ev.stateSpaceMap f := by
  ext x
  simp

/-- **Layer 2, the state-space functor** `𝓕_ev : C ⥤ ModuleCat R` (README Layer 2, *State spaces and
the evaluated foam category*; Goertz–Marino–Wedrich, Definition 3.20, `F`). -/
def stateSpaceFunctor : C ⥤ ModuleCat.{v} R where
  obj W := ModuleCat.of R (ev.stateSpace W)
  map f := ModuleCat.ofHom (ev.stateSpaceMap f)
  map_id W := by ext1; exact ev.stateSpaceMap_id W
  map_comp f g := by ext1; exact ev.stateSpaceMap_comp f g

/-- **Layer 2, the state-action ideal** `I₂(W, V)` (README Layer 2, *State spaces and the evaluated
foam category*; Goertz–Marino–Wedrich (3.4), Lemma 3.18): the morphisms `f : W ⟶ V` with `ev(b ∘ f ∘
a) = 0` for all fillings `a : 𝟙_ C ⟶ W` and tests `b : V ⟶ 𝟙_ C`. The trace ideal `I₁` (README Layer
2) is not defined here: it needs a trace on a rigid category. -/
def actionKernel (W V : C) : Submodule R (W ⟶ V) where
  carrier := {f | ∀ (a : 𝟙_ C ⟶ W) (b : V ⟶ 𝟙_ C), ev (a ≫ f ≫ b) = 0}
  add_mem' {f g} hf hg a b := by
    rw [Preadditive.add_comp, Preadditive.comp_add, map_add, hf a b, hg a b, add_zero]
  zero_mem' a b := by
    rw [Limits.zero_comp, Limits.comp_zero, map_zero]
  smul_mem' r f hf a b := by
    rw [Linear.smul_comp, Linear.comp_smul, map_smul, hf a b, smul_zero]

theorem mem_actionKernel {W V : C} (f : W ⟶ V) :
    f ∈ ev.actionKernel W V ↔ ∀ (a : 𝟙_ C ⟶ W) (b : V ⟶ 𝟙_ C), ev (a ≫ f ≫ b) = 0 :=
  Iff.rfl

/-- **Layer 2, `I₂` is an ideal: precomposition** (README Layer 2, *State spaces and the evaluated
foam category*; Goertz–Marino–Wedrich, Lemma 3.18). -/
theorem comp_mem_actionKernel_left {U W V : C} (g : U ⟶ W) {f : W ⟶ V}
    (hf : f ∈ ev.actionKernel W V) : g ≫ f ∈ ev.actionKernel U V := by
  intro a b
  simpa using hf (a ≫ g) b

/-- **Layer 2, `I₂` is an ideal: postcomposition** (README Layer 2, *State spaces and the evaluated
foam category*; Goertz–Marino–Wedrich, Lemma 3.18). -/
theorem comp_mem_actionKernel_right {W V U : C} {f : W ⟶ V} (hf : f ∈ ev.actionKernel W V)
    (g : V ⟶ U) : f ≫ g ∈ ev.actionKernel W U := by
  intro a b
  simpa using hf a (g ≫ b)

/-- **Layer 2, `I₂` is the kernel of the action on states** (README Layer 2, *State spaces and the
evaluated foam category*). -/
theorem mem_actionKernel_iff_stateSpaceMap_eq_zero {W V : C} (f : W ⟶ V) :
    f ∈ ev.actionKernel W V ↔ ev.stateSpaceMap f = 0 := by
  constructor
  · intro hf
    ext x
    simpa [Submodule.Quotient.mk_eq_zero, mem_radical] using fun b => hf x b
  · intro hf a b
    have := congrArg (fun φ => φ (Submodule.Quotient.mk a)) hf
    simp only [stateSpaceMap_mk, LinearMap.zero_apply, Submodule.Quotient.mk_eq_zero] at this
    simpa using this b

/-- **Layer 2, `I₂(∅, W) = Rad_ev(W)`** (README Layer 2, *State spaces and the evaluated foam
category*; Goertz–Marino–Wedrich, Lemma 3.19 for `I₂`). The proof moves a closed morphism `a : 𝟙_ C
⟶ 𝟙_ C` past a filling with the unitors and the interchange law. -/
theorem actionKernel_tensorUnit_eq_radical (W : C) :
    ev.actionKernel (𝟙_ C) W = ev.radical W := by
  have key (a : 𝟙_ C ⟶ 𝟙_ C) (x : 𝟙_ C ⟶ W) :
      a ≫ x = x ≫ (λ_ W).inv ≫ a ▷ W ≫ (λ_ W).hom := by
    rw [← Category.assoc x, leftUnitor_inv_naturality, Category.assoc, whisker_exchange_assoc,
      leftUnitor_naturality, unitors_equal, unitors_inv_equal, whiskerRight_id]
    simp
  ext x
  constructor
  · intro hx G
    simpa using hx (𝟙 _) G
  · intro hx a b
    rw [← Category.assoc, key, Category.assoc]
    exact hx _

end ClosedEvaluation

end UniversalConstruction

end TauCetiRoadmap.Foams

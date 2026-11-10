module

public import Mathlib
public import TauCeti.Combinatorics.SimpleGraph.RelationalConfiguration
public import TauCeti.ModelTheory.BackAndForth.AtomicType
public import TauCeti.ModelTheory.BackAndForth.Equivalence
public import TauCeti.ModelTheory.Interpolation.PCClass
public import TauCeti.ModelTheory.RelationalConfiguration.BackAndForth
public import TauCeti.ModelTheory.RelationalConfiguration.Isomorphism
public import TauCeti.ModelTheory.RelationalConfiguration.ModelsOf
public import TauCeti.ModelTheory.RelationalConfiguration.Structure
public import TauCeti.ModelTheory.RelationalConfiguration.Topology
public import TauCeti.ModelTheory.Scott.Height
public import TauCeti.ModelTheory.Scott.Isomorphism
public import TauCeti.ModelTheory.Scott.Rank
public import TauCeti.ModelTheory.Scott.Sentence
public import TauCeti.ModelTheory.Scott.Stabilization
public import TauCeti.Topology.Algebra.Group.Perm

/-!
# Spaces of countable structures and the López–Escobar theorem: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, standing conventions,
layer-by-layer build (Layers 0–6), worked examples, coordination, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

Everything is stated over the pinned Tau Ceti library: the infinitary syntax and satisfaction
(`FirstOrder.Language.BoundedFormulaInf`, `Sentenceω`, `SentenceInf.Realize`), back-and-forth
equivalence and the Scott analysis (`TauCeti.BFEquiv`, `TauCeti.scottSentence`,
`TauCeti.SelfStabilizesCompletely`, `TauCeti.scottHeight`), the coding space
`TauCeti.RelationalConfiguration` with its topology, decoding, logic action, model classes and
isomorphism and back-and-forth setoids, the permutation-group topology, and projective classes
(`FirstOrder.Language.LHom.PCMem`). Milestones the pin already proves are stated in the roadmap's
form and proved by the library's theorem. One declaration below, `pcSeparation`, is a stand-in for
the InfinitaryModelExistence roadmap, which owns it, marked with the owner's revision it was checked
against. The PC sentence of a tree is recorded by its specification (`exists_pcSentence`); the
README gives its explicit construction. Names and namespaces are provisional.
-/

@[expose] public section

set_option autoImplicit false

universe u v w w' u' v' u₁ v₁ u₂ v₂

namespace TauCetiRoadmap.CountableStructureSpaces

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure MeasureTheory Topology
open TauCeti TauCeti.RelationalConfiguration Descriptive
open scoped Pointwise

/-! ## Layer 0: the coding space

The coding space on a carrier `α` is `RelationalConfiguration L α`: a code says, for every atom
`atom R x` (a relation symbol with a tuple of its arity), whether the relation holds there. It is
a type synonym for `Atom L α → Bool`, with the product topology and σ-algebra for every language
and carrier, and is compact, Polish and standard Borel once the relation symbols of each arity and
the carrier are countable. -/

variable {L : FirstOrder.Language.{u, v}} {α : Type w}

example [∀ n, Countable (L.Relations n)] : StandardBorelSpace (RelationalConfiguration L ℕ) :=
  inferInstance

example [∀ n, Countable (L.Relations n)] :
    StandardBorelSpace (RelationalConfiguration L ℕ × RelationalConfiguration L ℕ) :=
  inferInstance

/-- **Layer 0 milestone.** Decoding then encoding is the identity on codes. -/
theorem ofStructure_toStructure [L.IsRelational] (c : RelationalConfiguration L α) :
    @ofStructure L α c.toStructure = c :=
  RelationalConfiguration.ofStructure_toStructure c

/-- **Layer 0 milestone.** Encoding then decoding is the identity on structures of a relational
language. -/
theorem toStructure_ofStructure [L.IsRelational] (S : L.Structure α) :
    (@ofStructure L α S).toStructure = S :=
  RelationalConfiguration.toStructure_ofStructure S

/-- **Layer 0 milestone.** The code transported along a bijection names a structure isomorphic to
the source. -/
theorem nonempty_equiv_encodeVia [L.IsRelational] {M : Type*} [L.Structure M] (e : M ≃ α) :
    Nonempty (@Language.Equiv L M α _ (e.encodeVia (L := L)).toStructure) :=
  e.nonempty_equiv_encodeVia

/-- **Layer 0 milestone.** The basic cylinders are clopen. -/
theorem isClopen_setOf_eval (a : Atom L α) :
    IsClopen {c : RelationalConfiguration L α | c.eval a = true} :=
  RelationalConfiguration.isClopen_setOf_eval a true

/-- **Layer 0, the query code.** The coordinates of a code read along a fixed enumeration of the
atoms, padded with `false`; the embedding of the coding space into Cantor space. -/
noncomputable def queryCode [∀ n, Countable (L.Relations n)] (c : RelationalConfiguration L ℕ) :
    ℕ → Bool := by
  letI : Encodable (Atom L ℕ) := Encodable.ofCountable _
  exact fun n => (Encodable.decode n : Option (Atom L ℕ)).elim false c.eval

/-- **Layer 0 milestone.** The query code is a closed embedding into Cantor space. -/
theorem isClosedEmbedding_queryCode [∀ n, Countable (L.Relations n)] :
    IsClosedEmbedding (queryCode (L := L)) := by
  sorry

/-- **Layer 0 milestone.** A coding space on a countable carrier has at most continuum many
points. -/
theorem mk_le_continuum [∀ n, Countable (L.Relations n)] [Countable α] :
    Cardinal.mk (RelationalConfiguration L α) ≤ Cardinal.continuum :=
  RelationalConfiguration.mk_le_continuum L α

/-- **Layer 0 graph example.** Coding is a measurable embedding of Mathlib's measurable space of
graphs on `ℕ`. -/
theorem measurableEmbedding_graphCode :
    MeasurableEmbedding (SimpleGraph.toRelationalConfiguration : SimpleGraph ℕ → _) :=
  SimpleGraph.measurableEmbedding_toRelationalConfiguration

/-! ## Layer 1: the logic action of `S∞`

`Equiv.Perm α` carries the topology of pointwise convergence (induced by `σ ↦ (σ, σ⁻¹)`), and acts
on `RelationalConfiguration L α` by relabelling, for every language. -/

section PermTopology

variable [TopologicalSpace α] [DiscreteTopology α]

/-- **Layer 1 acceptance lemma.** The pointwise stabilizers of finite sets form a neighbourhood
basis of the identity, so the induced topology is the pointwise one. The library indexes the basis
by finite `Set`s (`Equiv.Perm.hasBasis_nhds_one_fixingSubgroup`); here it is indexed by
`Finset`s. -/
theorem hasBasis_nhds_one_fixingSubgroup :
    (𝓝 (1 : Equiv.Perm α)).HasBasis (fun _ : Finset α => True)
      (fun s => (fixingSubgroup (Equiv.Perm α) (s : Set α) : Set (Equiv.Perm α))) :=
  Equiv.Perm.hasBasis_nhds_one_fixingSubgroup.to_hasBasis
    (fun s hs => ⟨hs.toFinset, trivial, by simp⟩) (fun s _ => ⟨s, s.finite_toSet, subset_rfl⟩)

/-- **Layer 1 milestone.** The permutation group of a discrete space is a topological group. -/
theorem isTopologicalGroup_perm : IsTopologicalGroup (Equiv.Perm α) :=
  inferInstance

/-- **Layer 1 milestone.** The permutation group of a countable discrete space is Polish; for
`α = ℕ` this is `S∞`. -/
theorem polishSpace_perm [Countable α] : PolishSpace (Equiv.Perm α) :=
  inferInstance

end PermTopology

/-- **Layer 1, the logic action**: `(σ • c)` holds of `R` on `x` exactly when `c` holds of `R` on
`σ⁻¹ ∘ x`. -/
theorem eval_smul_atom (σ : Equiv.Perm α) (c : RelationalConfiguration L α) {n : ℕ}
    (R : L.Relations n) (x : Fin n → α) :
    (σ • c).eval (atom R x) = c.eval (atom R (⇑σ⁻¹ ∘ x)) := by
  rw [eval_perm_smul, Atom.map_atom]
  rfl

/-- **Layer 1 milestone.** The logic action is jointly continuous, for every language: the
library's joint continuity of restriction (`RelationalConfiguration.continuous_uncurry_restrict`)
composed with `Equiv.Perm.continuous_inv_apply`. -/
theorem continuousSMul_relationalConfiguration [TopologicalSpace α] [DiscreteTopology α] :
    ContinuousSMul (Equiv.Perm α) (RelationalConfiguration L α) := by
  refine ⟨?_⟩
  simp only [perm_smul_def]
  exact (continuous_uncurry_restrict (L := L) (V := α) (W := α)).comp
    ((continuous_pi fun x => (Equiv.Perm.continuous_inv_apply x).comp continuous_fst).prodMk
      continuous_snd)

/-- **Layer 1 milestone, orbits are isomorphism classes.** -/
theorem orbitRel_iff_nonempty_equiv [L.IsRelational] (c d : RelationalConfiguration L α) :
    (MulAction.orbitRel (Equiv.Perm α) (RelationalConfiguration L α)) c d ↔
      Nonempty (@Language.Equiv L α α c.toStructure d.toStructure) := by
  rw [← isoSetoid_eq_orbitRel]
  exact isoSetoid_apply

/-- **Layer 1 milestone, stabilizers are automorphism groups.** -/
theorem mem_stabilizer_iff [L.IsRelational] (σ : Equiv.Perm α) (c : RelationalConfiguration L α) :
    σ ∈ MulAction.stabilizer (Equiv.Perm α) c ↔
      ∀ {l : ℕ} (R : L.Relations l) (v : Fin l → α),
        @RelMap L α c.toStructure l R (σ ∘ v) ↔ @RelMap L α c.toStructure l R v := by
  sorry

/-- **Layer 1 milestone.** Action invariance, Mathlib's `MulAction.IsFixedBlock`, is the
library's isomorphism invariance `RelationalConfiguration.IsomorphismInvariant`, through Tau Ceti's
`isomorphismInvariant_iff_isInvariantBlock` and Mathlib's `isInvariantBlock_iff_isFixedBlock`. -/
theorem isFixedBlock_iff_isomorphismInvariant [L.IsRelational]
    (B : Set (RelationalConfiguration L α)) :
    MulAction.IsFixedBlock (Equiv.Perm α) B ↔ IsomorphismInvariant B :=
  (isomorphismInvariant_iff_isInvariantBlock.trans
    MulAction.isInvariantBlock_iff_isFixedBlock).symm

/-- **Layer 1 milestone, the invariant σ-algebra.** Measurability for the infimum over `σ` of
Mathlib's `MeasurableSpace.invariants (σ • ·)` is measurability together with action
invariance. -/
theorem measurableSet_iInf_invariants_iff (B : Set (RelationalConfiguration L α)) :
    MeasurableSet[⨅ σ : Equiv.Perm α,
        MeasurableSpace.invariants (fun c : RelationalConfiguration L α => σ • c)] B ↔
      MeasurableSet B ∧ MulAction.IsFixedBlock (Equiv.Perm α) B := by
  simp only [MeasurableSpace.measurableSet_iInf, MeasurableSpace.measurableSet_invariants]
  exact ⟨fun h => ⟨(h 1).1, fun σ => by simpa [Set.preimage_smul] using (h σ⁻¹).2⟩,
    fun ⟨hB, hfix⟩ σ => ⟨hB, by rw [Set.preimage_smul, hfix]⟩⟩

/-- **Layer 1 milestone.** The saturation of an analytic class is analytic, for every language.
The library proves the relational case (`RelationalConfiguration.analyticSet_iUnion_smul`). -/
theorem analyticSet_iUnion_smul [∀ n, Countable (L.Relations n)]
    {A : Set (RelationalConfiguration L ℕ)} (hA : AnalyticSet A) :
    AnalyticSet (⋃ σ : Equiv.Perm ℕ, σ • A) := by
  sorry

open Set in
/-- **Layer 1.** The orbit relation of the logic action, as a subset of the square, is analytic: it
is the image of the Polish space `Perm ℕ × RelationalConfiguration L ℕ` under a continuous map. The
library proves the relational case for the isomorphism setoid
(`RelationalConfiguration.analyticSet_setOf_isoSetoid`). -/
theorem analyticSet_orbitRel_graph [∀ n, Countable (L.Relations n)] :
    AnalyticSet {p : RelationalConfiguration L ℕ × RelationalConfiguration L ℕ |
      MulAction.orbitRel (Equiv.Perm ℕ) (RelationalConfiguration L ℕ) p.1 p.2} := by
  have : ContinuousSMul (Equiv.Perm ℕ) (RelationalConfiguration L ℕ) :=
    continuousSMul_relationalConfiguration
  have h : Continuous fun q : Equiv.Perm ℕ × RelationalConfiguration L ℕ => (q.1 • q.2, q.2) :=
    continuous_smul.prodMk continuous_snd
  convert analyticSet_range_of_polishSpace h using 1
  ext ⟨c, d⟩
  simp only [mem_ofPred_eq, mem_range, Prod.exists, Prod.mk.injEq, MulAction.orbitRel_apply,
    MulAction.mem_orbit_iff]
  constructor
  · rintro ⟨σ, rfl⟩; exact ⟨σ, d, rfl, rfl⟩
  · rintro ⟨σ, d', h1, rfl⟩; exact ⟨σ, h1⟩

/-! ## Layer 2: satisfaction and model classes

The model class of an infinitary sentence is the library's `RelationalConfiguration.modelsOf`. -/

/-- The codes in which a bounded formula holds at the given assignments. -/
def modelsOfBounded [L.IsRelational] {β : Type u'} {n : ℕ} (φ : L.BoundedFormulaω β n)
    (v : β → α) (xs : Fin n → α) : Set (RelationalConfiguration L α) :=
  {c | letI : L.Structure α := c.toStructure; φ.Realize v xs}

/-- **Layer 2 milestone, satisfaction is Borel**: measurable for the product σ-algebra, for every
relational language and countable carrier. -/
theorem measurableSet_modelsOfBounded [L.IsRelational] [Countable α] {β : Type u'} {n : ℕ}
    (φ : L.BoundedFormulaω β n) (v : β → α) (xs : Fin n → α) :
    MeasurableSet (modelsOfBounded φ v xs) :=
  RelationalConfiguration.measurableSet_setOf_realize φ v xs

/-- **Layer 2 milestone.** -/
theorem measurableSet_modelsOf [L.IsRelational] [Countable α] (φ : L.Sentenceω) :
    MeasurableSet (modelsOf φ : Set (RelationalConfiguration L α)) :=
  RelationalConfiguration.measurableSet_modelsOf φ

/-- **Layer 2 milestone.** Model classes are isomorphism invariant, by the library's
`Language.Equiv.mem_modelsOf_iff`. -/
theorem isomorphismInvariant_modelsOf [L.IsRelational] (φ : L.Sentenceω) :
    IsomorphismInvariant (modelsOf φ : Set (RelationalConfiguration L α)) :=
  isomorphismInvariant_iff.2 fun _ _ h hc =>
    ((Classical.choice (isoSetoid_apply.1 h)).mem_modelsOf_iff φ).1 hc

/-- **Layer 2 milestone.** A model class is standard Borel in the subspace σ-algebra. -/
theorem standardBorelSpace_modelsOf [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (φ : L.Sentenceω) : StandardBorelSpace (modelsOf φ : Set (RelationalConfiguration L ℕ)) :=
  inferInstance

/-- **Layer 2 milestone.** For a first-order `∀∃` sentence the model class is Gδ: the matrix is
clopen, an existential quantifier gives a countable union, a universal one a countable
intersection. -/
theorem isGδ_modelsOf_toInf_alls [L.IsRelational] {n : ℕ} (ψ : L.BoundedFormula Empty n)
    (hψ : ψ.IsExistential) :
    IsGδ (modelsOf (ψ.alls.toInf (ι := ℕ)) : Set (RelationalConfiguration L ℕ)) := by
  sorry

/-- **Layer 2 graph example.** Satisfaction of an `Lω₁ω` sentence is a measurable event on
graphs on `ℕ`. -/
theorem measurableSet_setOf_realize_graph (φ : Language.graph.Sentenceω) :
    MeasurableSet {G : SimpleGraph ℕ | letI := G.structure; SentenceInf.Realize φ ℕ} := by
  sorry

/-! ## Layer 3: trees, the analytic tree representation and boundedness -/

/-- The first `n` values of a sequence. Named and stated as in Mathlib PR #41946. -/
def initialSegment {A : Type*} (x : ℕ → A) (n : ℕ) : List A :=
  List.ofFn fun i : Fin n => x i

/-- **Layer 3, the body** of a tree: its infinite branches. Named and stated as in Mathlib
PR #41946. -/
def body {A : Type*} (T : tree A) : Set (ℕ → A) :=
  {x | ∀ n, initialSegment x n ∈ T}

/-- Strict extension on the nodes of a tree: `y` properly extends `x`. -/
def StrictExt {A : Type*} (T : tree A) (y x : T) : Prop :=
  (x : List A) <+: y ∧ (x : List A) ≠ y

/-- **Layer 3 milestone.** A tree has no infinite branch exactly when strict extension is
well-founded on its nodes. No finiteness of the branching is needed. -/
theorem wellFounded_strictExt_iff {A : Type*} (T : tree A) :
    WellFounded (StrictExt T) ↔ body T = ∅ := by
  sorry

/-- **Layer 3, the height of a well-founded tree**: the strict supremum of the ranks of its
nodes, so the empty tree has height `0` and the root alone height `1`. -/
noncomputable def treeHeight {A : Type u} (T : tree A) (hT : body T = ∅) : Ordinal.{u} :=
  haveI : WellFounded (StrictExt T) := (wellFounded_strictExt_iff T).2 hT
  ⨆ x : T, Order.succ (WellFounded.rank (StrictExt T) x)

/-- **Layer 3 milestone.** A well-founded tree on `ℕ` has countable height. -/
theorem treeHeight_lt_omega_one (T : tree ℕ) (hT : body T = ∅) :
    treeHeight T hT < Ordinal.omega 1 := by
  sorry

/-- **Layer 3 milestone, the boundedness theorem for well-founded trees** (Kunen's proof through
a tree of attempts). An analytic family of well-founded trees with closed node sets has heights
bounded below `ω₁`. -/
theorem analytic_treeHeight_bounded {X : Type*} [TopologicalSpace X] {A : Set X}
    (hA : AnalyticSet A) (T : X → tree ℕ) (hT : ∀ s : List ℕ, IsClosed {x | s ∈ T x})
    (hwf : ∀ x ∈ A, body (T x) = ∅) :
    ∃ β < Ordinal.omega 1, ∀ x (hx : x ∈ A), treeHeight (T x) (hwf x hx) < β := by
  sorry

/-- **Layer 3 milestone, the tree representation of analytic sets in Cantor space.** -/
theorem exists_tree_of_analyticSet_cantor {A : Set (ℕ → Bool)} (hA : AnalyticSet A) :
    ∃ T : tree (Bool × ℕ), A = {x | ∃ y : ℕ → ℕ, (fun n => (x n, y n)) ∈ body T} := by
  sorry

/-- **Layer 3 milestone, the tree representation of analytic classes of codes**, through the
query code. -/
theorem exists_tree_of_analyticSet [∀ n, Countable (L.Relations n)]
    {B : Set (RelationalConfiguration L ℕ)} (hB : AnalyticSet B) :
    ∃ T : tree (Bool × ℕ), ∀ c, c ∈ B ↔ ∃ g : ℕ → ℕ, (fun n => (queryCode c n, g n)) ∈ body T := by
  sorry

/-- **Layer 3, the Kleene–Brouwer order** on finite sequences: a proper extension comes first,
otherwise the first difference decides. -/
def KBLT (x y : List ℕ) : Prop :=
  (y <+: x ∧ x ≠ y) ∨
    ∃ (p : List ℕ) (a b : ℕ) (x' y' : List ℕ), a < b ∧ x = p ++ a :: x' ∧ y = p ++ b :: y'

/-- **Layer 3 milestone.** The Kleene–Brouwer order is well-founded on the nodes of a tree
exactly when the tree has no infinite branch. -/
theorem wellFounded_kbLT_iff (T : tree ℕ) :
    WellFounded (fun x y : T => KBLT x y) ↔ body T = ∅ := by
  sorry

/-! ## Layer 4: back-and-forth, isomorphism and Scott height on codes

Isomorphism of codes is the library's `RelationalConfiguration.isoSetoid L α`, back-and-forth
equivalence of the empty tuples at level `β` is `RelationalConfiguration.bfEquivSetoid L α β`
(assembled from `TauCeti.BFEquiv.refl`, `symm` and `trans`), and external stabilization and the
Scott height are `TauCeti.StabilizesCompletely` and `TauCeti.scottHeight`, which test against
countable structures in `Type`. -/

/-- **Layer 4, back-and-forth equivalence on the pair space**, at fixed tuples. -/
def bfEquivSet [L.IsRelational] (β : Ordinal.{0}) (n : ℕ) (a b : Fin n → ℕ) :
    Set (RelationalConfiguration L ℕ × RelationalConfiguration L ℕ) :=
  {p | @BFEquiv L _ ℕ ℕ p.1.toStructure p.2.toStructure β n a b}

/-- **Layer 4 milestone.** Back-and-forth equivalence at a countable level is Borel. -/
theorem measurableSet_bfEquivSet [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1) (n : ℕ) (a b : Fin n → ℕ) :
    MeasurableSet (bfEquivSet (L := L) β n a b) :=
  RelationalConfiguration.measurableSet_setOf_bfEquiv hβ a b

/-- **Layer 4 milestone.** On every carrier, isomorphism is the orbit relation of the logic
action. -/
theorem isoSetoid_eq_orbitRel [L.IsRelational] :
    isoSetoid L α = MulAction.orbitRel (Equiv.Perm α) (RelationalConfiguration L α) :=
  RelationalConfiguration.isoSetoid_eq_orbitRel

/-- **Layer 4 milestone.** At a countable level, back-and-forth equivalence of codes is Borel. -/
theorem measurableSet_bfEquivSetoid [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1) :
    MeasurableSet {p : RelationalConfiguration L ℕ × RelationalConfiguration L ℕ |
      (bfEquivSetoid L ℕ β) p.1 p.2} :=
  RelationalConfiguration.measurableSet_setOf_bfEquivSetoid hβ

/-- **Layer 4 milestone.** Isomorphism refines every back-and-forth level. -/
theorem isoSetoid_le_bfEquivSetoid [L.IsRelational] (β : Ordinal.{0}) :
    isoSetoid L ℕ ≤ bfEquivSetoid L ℕ β :=
  RelationalConfiguration.isoSetoid_le_bfEquivSetoid β

/-- **Layer 4 milestone, isomorphism classes are Borel**: the class of a code is the model class
of the Scott sentence of the structure it names, by the library's `realize_scottSentence_iff`. -/
theorem setOf_iso_eq_modelsOf_scottSentence [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (c : RelationalConfiguration L ℕ) :
    {d | (isoSetoid L ℕ) c d} =
      modelsOf (letI : L.Structure ℕ := c.toStructure; scottSentence (L := L) ℕ) := by
  ext d
  rw [Set.mem_ofPred_eq, isoSetoid_apply, mem_modelsOf]
  exact (@realize_scottSentence_iff L _ _ ℕ c.toStructure _ ℕ d.toStructure _).symm

/-- **Layer 4 milestone, upward closure.** External stabilization persists at every higher
level. -/
theorem stabilizesCompletely_mono [L.IsRelational] {M : Type w} [L.Structure M]
    {β γ : Ordinal.{w}} (h : StabilizesCompletely (L := L) M β) (hβγ : β ≤ γ) :
    StabilizesCompletely (L := L) M γ :=
  h.mono hβγ

/-- **Layer 4 milestone, the infimum is attained.** -/
theorem stabilizesCompletely_scottHeight [L.IsRelational] (M : Type w) [L.Structure M] :
    StabilizesCompletely (L := L) M (scottHeight (L := L) M) :=
  TauCeti.stabilizesCompletely_scottHeight M

/-- **Layer 4 milestone.** Scott height is an isomorphism invariant. -/
theorem scottHeight_congr [L.IsRelational] {M N : Type w} [L.Structure M] [L.Structure N]
    (e : M ≃[L] N) : scottHeight (L := L) M = scottHeight (L := L) N :=
  e.scottHeight_eq

/-- **Layer 4 milestone, the constant-chain bound.** If `M` stabilizes internally at `β`, then
back-and-forth equivalence at `β + ω` between a tuple of `M` and a tuple of any structure `N`, of
any cardinality and in any universe, implies equivalence at every level: the library's step at the
limit level `β + ω` for any `N` (`SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit`),
propagated upward by `bfEquiv_of_le_of_forall_add_one`. -/
theorem bfEquiv_of_selfStabilizesCompletely [L.IsRelational] {M : Type w} {N : Type w'}
    [L.Structure M] [L.Structure N] {β : Ordinal.{w}}
    (h : SelfStabilizesCompletely (L := L) M β) {n : ℕ} {a : Fin n → M} {b : Fin n → N}
    (hab : BFEquiv (L := L) (β + Ordinal.omega0) n a b) (γ : Ordinal.{w}) :
    BFEquiv (L := L) γ n a b := by
  rcases le_total (β + Ordinal.omega0) γ with hγ | hγ
  · refine bfEquiv_of_le_of_forall_add_one (fun n a b => ?_) hγ hab
    exact h.bfEquiv_add_one_of_isSuccLimit (Ordinal.isSuccLimit_add β Ordinal.isSuccLimit_omega0)
      (lt_add_of_pos_right β Ordinal.omega0_pos)
  · exact hab.mono hγ

/-- **Layer 4 milestone, the countable case.** Internal stabilization at `β` gives external
stabilization at `β + ω`: the case of `bfEquiv_of_selfStabilizesCompletely` with `N` countable
and the next level. -/
theorem stabilizesCompletely_add_omega0 [L.IsRelational] {M : Type w} [L.Structure M]
    {β : Ordinal.{w}} (h : SelfStabilizesCompletely (L := L) M β) :
    StabilizesCompletely (L := L) M (β + Ordinal.omega0) :=
  h.stabilizesCompletely_add_omega0

/-- **Layer 4 milestone.** -/
theorem scottHeight_lt_omega_one [L.IsRelational] (M : Type w) [L.Structure M] [Countable M] :
    scottHeight (L := L) M < Ordinal.omega 1 :=
  TauCeti.scottHeight_lt_omega_one M

/-- **Layer 4 milestone, comparison with internal stabilization.** -/
theorem selfStabilizationOrdinal_le_scottHeight [L.IsRelational] (M : Type w) [L.Structure M]
    [Countable M] :
    selfStabilizationOrdinal (L := L) M ≤ scottHeight (L := L) M := by
  sorry

/-- **Layer 4 milestone.** -/
theorem scottHeight_le_selfStabilizationOrdinal_add_omega0 [L.IsRelational] (M : Type w)
    [L.Structure M] :
    scottHeight (L := L) M ≤ selfStabilizationOrdinal (L := L) M + Ordinal.omega0 :=
  TauCeti.scottHeight_le_selfStabilizationOrdinal_add_omega0 M

/-- **Layer 4 milestone, comparison with `internalScottRank`.** -/
theorem internalScottRank_le_succ_scottHeight [L.IsRelational] (M : Type w) [L.Structure M]
    [Countable M] :
    internalScottRank (L := L) M ≤ Order.succ (scottHeight (L := L) M) := by
  sorry

/-- **Layer 4 milestone.** -/
theorem scottHeight_le_internalScottRank_add_omega0 [L.IsRelational] (M : Type w)
    [L.Structure M] :
    scottHeight (L := L) M ≤ internalScottRank (L := L) M + Ordinal.omega0 :=
  TauCeti.scottHeight_le_internalScottRank_add_omega0 M

/-- **Layer 4 milestone, the height comparison.** Back-and-forth equivalence of the empty tuples
at a level at least the Scott height of one side is isomorphism, between countable structures. The
library allows `N` in another universe. -/
theorem nonempty_equiv_of_bfEquiv_of_scottHeight_le [L.IsRelational] {M N : Type w}
    [L.Structure M] [L.Structure N] [Countable M] [Countable N] {β : Ordinal.{w}}
    (hβ : scottHeight (L := L) M ≤ β)
    (h : BFEquiv (L := L) β 0 (Fin.elim0 : Fin 0 → M) (Fin.elim0 : Fin 0 → N)) :
    Nonempty (M ≃[L] N) :=
  TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le hβ h

/-- **Layer 4 milestone, isomorphism is Borel under bounded Scott height.** -/
theorem measurableSet_iso_inter_of_scottHeight_le [L.IsRelational]
    [∀ n, Countable (L.Relations n)] {φ : L.Sentenceω} {β : Ordinal.{0}}
    (hβ : β < Ordinal.omega 1)
    (hbound : ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)),
      (letI : L.Structure ℕ := c.toStructure; scottHeight (L := L) ℕ) ≤ β) :
    MeasurableSet ({p : RelationalConfiguration L ℕ × RelationalConfiguration L ℕ |
        (isoSetoid L ℕ) p.1 p.2} ∩ (modelsOf φ ×ˢ modelsOf φ)) := by
  sorry

/-- **Layer 4 milestone, internal strata are Borel.** -/
theorem measurableSet_setOf_selfStabilizationOrdinal_le [L.IsRelational]
    [∀ n, Countable (L.Relations n)] {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1) :
    MeasurableSet {c : RelationalConfiguration L ℕ |
      (letI : L.Structure ℕ := c.toStructure; selfStabilizationOrdinal (L := L) ℕ) ≤ β} := by
  sorry

/-- The tree of the finite sequences all of whose prefixes satisfy `P`. -/
def prefixTree {A : Type*} (P : List A → Prop) : tree A :=
  ⟨{s | ∀ k ≤ s.length, P (s.take k)}, fun x a h k hk => by
    have hk' : k ≤ (x ++ [a]).length := by simp; omega
    simpa [List.take_append_of_le_length hk] using h k hk'⟩

/-- The left tuple of a node of the forced tree: position `2 i` is `i`, position `2 i + 1` is the
node's entry (the left answer to element `i` of the right structure). -/
def bfLeft (s : List ℕ) (j : Fin s.length) : ℕ :=
  if j.1 % 2 = 0 then j.1 / 2 else s[j]

/-- The right tuple of a node of the forced tree: position `2 i` is the node's entry (the right
answer to element `i` of the left structure), position `2 i + 1` is `i`. -/
def bfRight (s : List ℕ) (j : Fin s.length) : ℕ :=
  if j.1 % 2 = 0 then s[j] else j.1 / 2

/-- **Layer 4, the forced back-and-forth tree** of a pair of codes: step `2 i` answers element `i`
of the left structure, step `2 i + 1` element `i` of the right one, and a node is in the tree when
the two finite tuples it decodes (and those of its prefixes) have the same atomic type. -/
def bfTree [L.IsRelational] (c d : RelationalConfiguration L ℕ) : tree ℕ :=
  prefixTree fun s =>
    @SameAtomicType L s.length ℕ ℕ c.toStructure d.toStructure _ (bfLeft s) (bfRight s)

/-- **Layer 4 milestone.** The forced tree has a branch exactly when the codes are isomorphic. -/
theorem body_bfTree_nonempty_iff [L.IsRelational] (c d : RelationalConfiguration L ℕ) :
    (body (bfTree c d)).Nonempty ↔ (isoSetoid L ℕ) c d := by
  sorry

/-- **Layer 4 milestone.** Node conditions of the forced tree are closed in the pair space. -/
theorem isClosed_setOf_mem_bfTree [L.IsRelational] (s : List ℕ) :
    IsClosed {p : RelationalConfiguration L ℕ × RelationalConfiguration L ℕ |
      s ∈ bfTree p.1 p.2} := by
  sorry

/-- **Layer 4 milestone.** Back-and-forth equivalence of the empty tuples bounds the height of the
forced tree from below. -/
theorem lt_treeHeight_bfTree [L.IsRelational] {c d : RelationalConfiguration L ℕ}
    (hT : body (bfTree c d) = ∅) {β : Ordinal.{0}}
    (h : @BFEquiv L _ ℕ ℕ c.toStructure d.toStructure β 0 Fin.elim0 Fin.elim0) :
    β < treeHeight (bfTree c d) hT := by
  sorry

/-- **Layer 4 milestone, uniform back-and-forth separation.** An analytic set of non-isomorphic
pairs is separated at one countable back-and-forth level. -/
theorem exists_uniform_bfSeparation [L.IsRelational]
    {A : Set (RelationalConfiguration L ℕ × RelationalConfiguration L ℕ)} (hA : AnalyticSet A)
    (hiso : ∀ p ∈ A, ¬ (isoSetoid L ℕ) p.1 p.2) :
    ∃ β < (Ordinal.omega 1 : Ordinal.{0}), ∀ p ∈ A,
      ¬ @BFEquiv L _ ℕ ℕ p.1.toStructure p.2.toStructure β 0 Fin.elim0 Fin.elim0 := by
  sorry

/-- **Layer 4 milestone.** Isomorphism on a model class is Borel exactly when one countable
back-and-forth level decides it there. -/
theorem measurableSet_iso_inter_iff_exists_bfLevel [L.IsRelational]
    [∀ n, Countable (L.Relations n)] (φ : L.Sentenceω) :
    MeasurableSet ({p : RelationalConfiguration L ℕ × RelationalConfiguration L ℕ |
        (isoSetoid L ℕ) p.1 p.2} ∩ (modelsOf φ ×ˢ modelsOf φ)) ↔
      ∃ β < (Ordinal.omega 1 : Ordinal.{0}),
        ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)),
        ∀ d ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)),
          ((isoSetoid L ℕ) c d ↔ (bfEquivSetoid L ℕ β) c d) := by
  sorry

/-! ## Layer 5: the López–Escobar theorem

Projective classes are the library's `FirstOrder.Language.LHom.PCMem`. -/

/-! ### Stand-in owned by InfinitaryModelExistence

Owner: the InfinitaryModelExistence roadmap, Layer 7. Declaration: `pcSeparation`, over the pinned
infinitary syntax. Checked against revision 786457c7 of that roadmap (follow-up TauCetiRoadmap #1615). The
copy is prototype scaffolding; the owner's statement is authoritative. -/

/-- **Stand-in for `pcSeparation` of the InfinitaryModelExistence roadmap** (its Craig
interpolation layer), stated as there. Two projective classes with no common countable nonempty
member are separated by a single `L`-sentence on nonempty structures; no language is assumed
countable. For a countable relational language, on the space of structures with carrier `ℕ`, it
plays the role of Lusin separation. Each `LHom.PCMem` carries its own expansion, so the theorem
applies with `L₁ = L₂`. This roadmap consumes the theorem and does not prove it; Layer 5 applies it
to the PC sentences of trees for `B` and its complement. -/
theorem pcSeparation {L : FirstOrder.Language.{u, v}} {L₁ : FirstOrder.Language.{u₁, v₁}}
    {L₂ : FirstOrder.Language.{u₂, v₂}}
    (Θ₁ : (L.sum L₁).Sentenceω) (Θ₂ : (L.sum L₂).Sentenceω)
    (h : ∀ (M : Type) [L.Structure M] [Nonempty M] [Countable M],
      LHom.PCMem LHom.sumInl Θ₁ M → ¬ LHom.PCMem LHom.sumInl Θ₂ M) :
    ∃ θ : L.Sentenceω,
      (∀ (M : Type w) [L.Structure M] [Nonempty M], LHom.PCMem LHom.sumInl Θ₁ M →
        SentenceInf.Realize θ M) ∧
      (∀ (M : Type w) [L.Structure M] [Nonempty M], LHom.PCMem LHom.sumInl Θ₂ M →
        ¬ SentenceInf.Realize θ M) := by
  sorry

/-- The relation symbols of the witness vocabulary: a zero, the graph of a successor, and the
graph of a branch. -/
inductive PCWitnessRel : ℕ → Type
  | zero : PCWitnessRel 1
  | succ : PCWitnessRel 2
  | branch : PCWitnessRel 2

/-- **Layer 5, the relational witness vocabulary.** -/
def pcWitnessLanguage : FirstOrder.Language.{0, 0} :=
  ⟨fun _ => Empty, PCWitnessRel⟩

instance : pcWitnessLanguage.IsRelational := fun _ => inferInstanceAs (IsEmpty Empty)

/-- The relations of the standard witness structure on `ℕ` for a branch `g`: zero is `{0}`, the
successor graph is `n ↦ n + 1`, the branch graph is `n ↦ g n`. -/
def standardWitnessRel (g : ℕ → ℕ) : {n : ℕ} → PCWitnessRel n → (Fin n → ℕ) → Prop
  | _, .zero, v => v 0 = 0
  | _, .succ, v => v 1 = v 0 + 1
  | _, .branch, v => v 1 = g (v 0)

/-- The standard witness structure on `ℕ` for a branch `g`. -/
@[instance_reducible]
def standardWitness (g : ℕ → ℕ) : pcWitnessLanguage.Structure ℕ where
  funMap f := isEmptyElim f
  RelMap := standardWitnessRel g

/-- **Layer 5, the PC sentence of a tree, as its specification.** The README constructs the
sentence `pcSentence T` explicitly (numerals of the zero and successor graphs enumerate the
universe without repetition, the branch graph is a total function `g`, and the code read along
the numerals together with `g` is a branch of `T`); the two conjuncts below are its two theorems.
Completeness: the standard witness on `ℕ` of a branch is a model. Soundness: every model is
enumerated by a bijection with `ℕ` along which its code, with some branch, lies in the body of
`T`; no invariance is used. -/
theorem exists_pcSentence [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (T : tree (Bool × ℕ)) :
    ∃ ψ : (L.sum pcWitnessLanguage).Sentenceω,
      (∀ (c : RelationalConfiguration L ℕ) (g : ℕ → ℕ),
        (fun n => (queryCode c n, g n)) ∈ body T →
        letI : L.Structure ℕ := c.toStructure
        letI : pcWitnessLanguage.Structure ℕ := standardWitness g
        SentenceInf.Realize ψ ℕ) ∧
      (∀ (M : Type w) [L.Structure M] [pcWitnessLanguage.Structure M], SentenceInf.Realize ψ M →
        ∃ e : M ≃ ℕ, ∃ g : ℕ → ℕ,
          (fun n => (queryCode (e.encodeVia (L := L)) n, g n)) ∈ body T) := by
  sorry

/-- **Layer 5, the López–Escobar theorem, hard direction.** -/
theorem lopez_escobar [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {B : Set (RelationalConfiguration L ℕ)} (hB : MeasurableSet B)
    (hinv : IsomorphismInvariant B) :
    ∃ φ : L.Sentenceω, B = modelsOf φ := by
  sorry

/-- **Layer 5 headline, the López–Escobar theorem.** -/
theorem lopezEscobar_iff [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {B : Set (RelationalConfiguration L ℕ)} :
    (MeasurableSet B ∧ IsomorphismInvariant B) ↔ ∃ φ : L.Sentenceω, B = modelsOf φ := by
  sorry

/-- **Layer 5 headline, action form.** -/
theorem lopezEscobar_action_iff [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {B : Set (RelationalConfiguration L ℕ)} :
    (MeasurableSet B ∧ MulAction.IsFixedBlock (Equiv.Perm ℕ) B) ↔
      ∃ φ : L.Sentenceω, B = modelsOf φ := by
  sorry

/-- **Layer 5 headline, the invariant σ-algebra is the definable one.** -/
theorem measurableSet_iInf_invariants_iff_exists_modelsOf [L.IsRelational]
    [∀ n, Countable (L.Relations n)] (B : Set (RelationalConfiguration L ℕ)) :
    MeasurableSet[⨅ σ : Equiv.Perm ℕ,
        MeasurableSpace.invariants (fun c : RelationalConfiguration L ℕ => σ • c)] B ↔
      ∃ φ : L.Sentenceω, B = modelsOf φ := by
  sorry

/-- **Layer 5 milestone, invariant analytic classes are PC classes.** -/
theorem analyticSet_iff_exists_pc [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {B : Set (RelationalConfiguration L ℕ)} (hinv : IsomorphismInvariant B) :
    AnalyticSet B ↔ ∃ ψ : (L.sum pcWitnessLanguage).Sentenceω,
      B = {c | letI : L.Structure ℕ := c.toStructure; LHom.PCMem LHom.sumInl ψ ℕ} := by
  sorry

/-! ## Layer 6: separation and the well-order class -/

open Set in
/-- **Layer 6.** Saturation for the orbit relation, in the form of invariant Lusin separation for
analytic equivalence relations, is action invariance, for every language. The library proves the
relational case for the isomorphism setoid
(`RelationalConfiguration.isomorphismInvariant_iff_preimage_image_quotientMk`). -/
theorem saturated_iff_isFixedBlock {B : Set (RelationalConfiguration L ℕ)} :
    Quotient.mk (MulAction.orbitRel (Equiv.Perm ℕ) (RelationalConfiguration L ℕ)) ⁻¹'
        (Quotient.mk (MulAction.orbitRel (Equiv.Perm ℕ) (RelationalConfiguration L ℕ)) '' B) = B ↔
      MulAction.IsFixedBlock (Equiv.Perm ℕ) B := by
  constructor
  · intro h
    refine MulAction.isInvariantBlock_iff_isFixedBlock.1 fun σ => ?_
    rintro _ ⟨x, hx, rfl⟩
    rw [← h]
    exact ⟨x, hx, Quotient.sound (MulAction.mem_orbit_iff.mpr ⟨σ⁻¹, inv_smul_smul σ x⟩)⟩
  · intro h
    ext x
    constructor
    · rintro ⟨y, hy, hxy⟩
      obtain ⟨g, rfl⟩ := MulAction.mem_orbit_iff.mp (Quotient.exact hxy)
      rw [← h g⁻¹]
      exact ⟨g • x, hy, inv_smul_smul g x⟩
    · intro hx; exact ⟨x, hx, rfl⟩

/-- **Layer 6 milestone, invariant analytic separation**, for every language. The route through
the library's `Setoid.exists_invariant_measurableSet_separating` and
`RelationalConfiguration.analyticSet_setOf_isoSetoid` covers relational languages. -/
theorem invariant_analytic_separation [∀ n, Countable (L.Relations n)]
    {A B : Set (RelationalConfiguration L ℕ)} (hA : AnalyticSet A) (hB : AnalyticSet B)
    (hinv : MulAction.IsFixedBlock (Equiv.Perm ℕ) B) (hd : Disjoint A B) :
    ∃ C, A ⊆ C ∧ Disjoint B C ∧ MeasurableSet C ∧ MulAction.IsFixedBlock (Equiv.Perm ℕ) C := by
  sorry

/-- **Layer 6 milestone.** A sentence separates an analytic class from a disjoint invariant
analytic class. -/
theorem exists_sentence_separating [L.IsRelational] [∀ n, Countable (L.Relations n)]
    {A B : Set (RelationalConfiguration L ℕ)} (hA : AnalyticSet A) (hB : AnalyticSet B)
    (hinv : MulAction.IsFixedBlock (Equiv.Perm ℕ) B) (hd : Disjoint A B) :
    ∃ θ : L.Sentenceω, A ⊆ modelsOf θ ∧ Disjoint B (modelsOf θ) := by
  sorry

/-- The relation a code assigns to a distinguished binary symbol. -/
def codeRel [L.IsRelational] (lt : L.Relations 2) (c : RelationalConfiguration L ℕ) (x y : ℕ) :
    Prop :=
  @RelMap L ℕ c.toStructure 2 lt ![x, y]

/-- **Layer 6, the coded well-order class** `WO`. -/
def wellOrderClass [L.IsRelational] (lt : L.Relations 2) : Set (RelationalConfiguration L ℕ) :=
  {c | IsWellOrder ℕ (codeRel lt c)}

/-- **Layer 6 milestone.** Every countably infinite ordinal is the order type of a code in `WO`. -/
theorem exists_mem_wellOrderClass_type_eq [L.IsRelational] (lt : L.Relations 2)
    {β : Ordinal.{0}} (hω : Ordinal.omega0 ≤ β) (hβ : β < Ordinal.omega 1) :
    ∃ c : RelationalConfiguration L ℕ, ∃ h : IsWellOrder ℕ (codeRel lt c),
      @Ordinal.type ℕ (codeRel lt c) h = β := by
  sorry

/-- **Layer 6 milestone.** `WO` is coanalytic. -/
theorem analyticSet_compl_wellOrderClass [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (lt : L.Relations 2) : AnalyticSet (wellOrderClass lt)ᶜ := by
  sorry

/-- **Layer 6, the tree of descending sequences** of a code: the finite sequences strictly
decreasing for the distinguished relation. -/
def descTree [L.IsRelational] (lt : L.Relations 2) (c : RelationalConfiguration L ℕ) : tree ℕ :=
  prefixTree fun s => ∀ (i : ℕ) (h : i + 1 < s.length), codeRel lt c s[i + 1] s[i]

/-- **Layer 6 milestone, boundedness for analytic classes of well-orders.** -/
theorem analytic_type_bounded [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (lt : L.Relations 2) {A : Set (RelationalConfiguration L ℕ)} (hA : AnalyticSet A)
    (hAW : A ⊆ wellOrderClass lt) :
    ∃ β < (Ordinal.omega 1 : Ordinal.{0}), ∀ c (hc : c ∈ A),
      @Ordinal.type ℕ (codeRel lt c) (hAW hc) < β := by
  sorry

/-- **Layer 6 headline.** `WO` is not analytic. -/
theorem not_analyticSet_wellOrderClass [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (lt : L.Relations 2) : ¬ AnalyticSet (wellOrderClass lt) := by
  sorry

/-- **Layer 6 headline.** `WO` is not Borel. -/
theorem not_measurableSet_wellOrderClass [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (lt : L.Relations 2) : ¬ MeasurableSet (wellOrderClass lt) := by
  sorry

/-- **Layer 6 milestone, coded undefinability.** No `Lω₁ω` sentence has exactly the coded
well-orders as its coded models. -/
theorem not_exists_modelsOf_eq_wellOrderClass [L.IsRelational] [∀ n, Countable (L.Relations n)]
    (lt : L.Relations 2) : ¬ ∃ φ : L.Sentenceω, modelsOf φ = wellOrderClass lt := by
  sorry

/-! ## Worked examples -/

/-- **Worked example.** A pure set of `m` elements has Scott height `m + 1`, although its internal
Scott rank is `1`. -/
theorem scottHeight_fin_pureSet (m : ℕ) :
    @scottHeight Language.empty _ (Fin m) Language.emptyStructure = (m : Ordinal.{0}) + 1 := by
  sorry

/-- **Worked example.** The countably infinite pure set has Scott height `ω`, so the `+ ω` in
`scottHeight_le_internalScottRank_add_omega0` is attained. -/
theorem scottHeight_nat_pureSet :
    @scottHeight Language.empty _ ℕ Language.emptyStructure = Ordinal.omega0 := by
  sorry

end TauCetiRoadmap.CountableStructureSpaces

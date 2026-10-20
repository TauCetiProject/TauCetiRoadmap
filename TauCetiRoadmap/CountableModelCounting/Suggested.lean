import Mathlib
import TauCetiRoadmap.InfinitaryLogic.Suggested

/-!
# Counting countable models: Morley's theorem and the Vaught toolkit: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, standing conventions,
layer-by-layer build (Layers 0–6), worked examples, coordination, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

The parent roadmap's prototype (`TauCetiRoadmap.InfinitaryLogic`) supplies the infinitary syntax,
`BFEquiv`, `scottFormula` and `internalScottRank`. Marked **stand-ins**, copied verbatim from their
owners' prototypes, cover the objects consumed from other roadmaps:
* CountableStructureSpaces: `RelQueryOn`, `StructureSpaceOn` (a `def` type synonym) with its
  topology and σ-algebra, `StructureSpaceOn.toStructure`, `ofStructure`, `encodeVia`, `modelsOf`,
  `structureIsoSetoidOn`, `structureIsoSetoid`, `bfEquivSetoid`, `StabilizesCompletely`,
  `scottHeight`;
* InfinitaryModelExistence: `onBoundedFormulaInf` and `realize_onBoundedFormulaInf` (its Layer 0.1);
* Tau Ceti: `exs`, a parent-roadmap target missing only from the parent prototype.
The perfect-set vocabulary of the BorelEquivalenceRelations roadmap is written out where it is
used rather than restated, and Silver's theorem enters only through proofs. Names and namespaces
are provisional.
-/

set_option autoImplicit false

universe u v w w' u' v' uι

namespace TauCetiRoadmap.CountableModelCounting

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure Cardinal MeasureTheory Set
open TauCetiRoadmap.InfinitaryLogic

/-! ## Stand-ins for the CountableStructureSpaces roadmap (verbatim copies) -/

section StandIns

/-- **Stand-in (CountableStructureSpaces, verbatim).** A relation query on the carrier `α`: a
relation symbol together with a tuple of its arity. -/
def RelQueryOn (L : FirstOrder.Language.{u, v}) (α : Type w) : Type (max v w) :=
  Σ R : (Σ l, L.Relations l), Fin R.1 → α

/-- **Stand-in (CountableStructureSpaces, verbatim).** The coding space on a carrier, a type
synonym so that the logic action is an instance on this type and never on a function type. -/
def StructureSpaceOn (L : FirstOrder.Language.{u, v}) (α : Type w) : Type (max v w) :=
  RelQueryOn L α → Bool

/-- **Stand-in (CountableStructureSpaces, verbatim).** Codes of `L`-structures on `ℕ`. -/
abbrev StructureSpace (L : FirstOrder.Language.{u, v}) : Type v := StructureSpaceOn L ℕ

variable {L : FirstOrder.Language.{u, v}} {α : Type w}

/-- **Stand-in (CountableStructureSpaces, verbatim).** The product topology. -/
instance : TopologicalSpace (StructureSpaceOn L α) := Pi.topologicalSpace

/-- **Stand-in (CountableStructureSpaces, verbatim).** The product σ-algebra. -/
instance : MeasurableSpace (StructureSpaceOn L α) := MeasurableSpace.pi

namespace StructureSpaceOn

/-- **Stand-in (CountableStructureSpaces, verbatim).** Decoding: the `L`-structure on `α` named by
a code; relational languages only. -/
@[instance_reducible]
noncomputable def toStructure [L.IsRelational] (c : StructureSpaceOn L α) : L.Structure α where
  funMap f := isEmptyElim f
  RelMap {l} R v := c ⟨⟨l, R⟩, v⟩ = true

/-- **Stand-in (CountableStructureSpaces, verbatim).** Encoding: the code of a structure on `α`
(its function symbols are forgotten). -/
noncomputable def ofStructure (S : L.Structure α) : StructureSpaceOn L α := by
  classical
  exact fun q => decide (@RelMap L α S q.1.1 q.1.2 q.2)

/-- **Stand-in (CountableStructureSpaces, verbatim).** The code on `α` of a structure on `M`,
pushed forward along a bijection. -/
noncomputable def encodeVia {M : Type*} [L.Structure M] (e : M ≃ α) : StructureSpaceOn L α :=
  ofStructure (e.inducedStructure)

end StructureSpaceOn

/-- **Stand-in (CountableStructureSpaces, verbatim).** The isomorphism relation on codes on a
carrier: the decoded structures are isomorphic. -/
def structureIsoSetoidOn (L : FirstOrder.Language.{u, v}) [L.IsRelational] (α : Type w) :
    Setoid (StructureSpaceOn L α) where
  r c d := Nonempty (@Language.Equiv L α α c.toStructure d.toStructure)
  iseqv :=
    { refl := fun c => ⟨@Language.Equiv.refl L α c.toStructure⟩
      symm := fun {c d} ⟨e⟩ => ⟨@Language.Equiv.symm L α α c.toStructure d.toStructure e⟩
      trans := fun {c d e} ⟨f⟩ ⟨g⟩ =>
        ⟨@Language.Equiv.comp L α α c.toStructure d.toStructure α e.toStructure g f⟩ }

/-- **Stand-in (CountableStructureSpaces, verbatim).** The ambient isomorphism relation on codes
on `ℕ`. -/
abbrev structureIsoSetoid (L : FirstOrder.Language.{u, v}) [L.IsRelational] :
    Setoid (StructureSpace L) :=
  structureIsoSetoidOn L ℕ

/-- **Stand-in (CountableStructureSpaces, verbatim).** The model class of a sentence: the codes of
its models on `α`. -/
def modelsOf [L.IsRelational] (φ : Sentenceω L) : Set (StructureSpaceOn L α) :=
  {c | letI : L.Structure α := c.toStructure; φ.Realize α}

/-- **Stand-in (CountableStructureSpaces, verbatim).** Back-and-forth equivalence of the empty
tuples at level `β`, an equivalence relation on codes coarser than isomorphism. -/
def bfEquivSetoid [L.IsRelational] (β : Ordinal.{0}) : Setoid (StructureSpace L) where
  r c d := @BFEquiv L ℕ ℕ c.toStructure d.toStructure β 0 Fin.elim0 Fin.elim0
  iseqv := by sorry

/-- **Stand-in (CountableStructureSpaces, verbatim).** External stabilization against every
countable structure in `Type`, finite ones included. -/
def StabilizesCompletely [L.IsRelational] (M : Type w) [L.Structure M] (β : Ordinal.{w}) :
    Prop :=
  ∀ (N : Type) [L.Structure N] [Countable N] (n : ℕ) (a : Fin n → M) (b : Fin n → N),
    BFEquiv (L := L) β n a b → BFEquiv (L := L) (Order.succ β) n a b

/-- **Stand-in (CountableStructureSpaces, verbatim).** The Scott height: the least externally
stabilizing level. -/
noncomputable def scottHeight [L.IsRelational] (M : Type w) [L.Structure M] : Ordinal.{w} :=
  sInf {β | StabilizesCompletely (L := L) M β}

end StandIns

variable {L : FirstOrder.Language.{u, v}}

/-! ## Layer 0: counting isomorphism classes of countable models -/

section Layer0

variable [L.IsRelational]

/-- **Layer 0.** Isomorphism restricted to the codes on `α` of models of `φ`. -/
def isoSetoidOn (α : Type) (φ : Sentenceω L) : Setoid (modelsOf φ : Set (StructureSpaceOn L α)) :=
  (structureIsoSetoidOn L α).comap Subtype.val

/-- **Layer 0.** The isomorphism classes of countable models of `φ`, tier by tier: the models with
carrier `ℕ`, and for each `n` the models with carrier `Fin n`. Every countable model of `φ`, in any
universe, has exactly one class here (`classOf_eq_classOf_iff`, `classOf_surjective`). -/
def CountableModelClasses (φ : Sentenceω L) : Type v :=
  Quotient (isoSetoidOn ℕ φ) ⊕ Σ n : ℕ, Quotient (isoSetoidOn (Fin n) φ)

/-- **Layer 0.** The number of countable models of `φ`, up to isomorphism. -/
noncomputable def countableModelCount (φ : Sentenceω L) : Cardinal.{v} :=
  #(CountableModelClasses φ)

/-- **Layer 0 milestone.** A code transported from a model is a code of a model (by the
CountableStructureSpaces roadmap's `nonempty_equiv_encodeVia` and invariance of realization under
isomorphism). -/
theorem encodeVia_mem_modelsOf {α : Type} (φ : Sentenceω L) {M : Type w} [L.Structure M]
    (e : M ≃ α) (hM : SentenceInf.Realize φ M) :
    StructureSpaceOn.encodeVia (L := L) e ∈ (modelsOf φ : Set (StructureSpaceOn L α)) := by
  sorry

/-- **Layer 0.** The class of a countable model: its code on `Fin n` along a bijection if it has
`n` elements, and on `ℕ` otherwise. -/
noncomputable def classOf (φ : Sentenceω L) {M : Type w} [L.Structure M] [Countable M]
    (hM : SentenceInf.Realize φ M) : CountableModelClasses φ := by
  classical
  exact if h : Finite M then
    Sum.inr ⟨Nat.card M, Quotient.mk _
      ⟨StructureSpaceOn.encodeVia (Finite.equivFin M), encodeVia_mem_modelsOf φ _ hM⟩⟩
  else
    haveI : Infinite M := not_finite_iff_infinite.mp h
    Sum.inl (Quotient.mk _ ⟨StructureSpaceOn.encodeVia (nonempty_equiv_of_countable.some : M ≃ ℕ),
      encodeVia_mem_modelsOf φ _ hM⟩)

/-- **Layer 0 milestone.** Two countable models, in any two universes, have the same class
exactly when they are isomorphic. -/
theorem classOf_eq_classOf_iff (φ : Sentenceω L) {M : Type w} {N : Type w'} [L.Structure M]
    [L.Structure N] [Countable M] [Countable N] (hM : SentenceInf.Realize φ M)
    (hN : SentenceInf.Realize φ N) :
    classOf φ hM = classOf φ hN ↔ Nonempty (M ≃[L] N) := by
  sorry

/-- **Layer 0 milestone.** Every class is the class of a countable model in every universe. -/
theorem classOf_surjective (φ : Sentenceω L) (q : CountableModelClasses φ) :
    ∃ (M : Type w) (_ : L.Structure M) (_ : Countable M) (hM : SentenceInf.Realize φ M),
      classOf φ hM = q := by
  sorry

/-- **Layer 0 milestone.** There are at most continuum many countable models. -/
theorem countableModelCount_le_continuum [Countable (Σ l, L.Relations l)] (φ : Sentenceω L) :
    countableModelCount φ ≤ 𝔠 := by
  sorry

/-- **Layer 0 milestone.** Isomorphism of codes on `Fin n` is a finite union of graphs of
relabellings, so it has Borel graph. -/
theorem measurableSet_structureIsoSetoidOn_fin [Countable (Σ l, L.Relations l)] (n : ℕ) :
    MeasurableSet {p : StructureSpaceOn L (Fin n) × StructureSpaceOn L (Fin n) |
      structureIsoSetoidOn L (Fin n) p.1 p.2} := by
  sorry

/-- **Layer 0.** `φ` has a perfect set of pairwise non-isomorphic models with carrier `α`. This is
the BorelEquivalenceRelations roadmap's `HasPerfectAntichainOn (structureIsoSetoidOn L α)
(modelsOf φ)`, written out. -/
def HasPerfectSetOfNonisoModelsOn (α : Type) (φ : Sentenceω L) : Prop :=
  ∃ P : Set (StructureSpaceOn L α), Perfect P ∧ P.Nonempty ∧ P ⊆ modelsOf φ ∧
    ∀ c ∈ P, ∀ d ∈ P, structureIsoSetoidOn L α c d → c = d

/-- **Layer 0.** `φ` has perfectly many countable models: a perfect set of pairwise
non-isomorphic models at the tier `ℕ` or at some tier `Fin n`. The finite tiers are needed: with
countably many unary predicates, "there is exactly one element" has a perfect set of models on
`Fin 1` and no model on `ℕ`. -/
def HasPerfectlyManyCountableModels (φ : Sentenceω L) : Prop :=
  HasPerfectSetOfNonisoModelsOn ℕ φ ∨ ∃ n, HasPerfectSetOfNonisoModelsOn (Fin n) φ

/-- **Layer 0 milestone.** Perfectly many countable models are continuum many. -/
theorem HasPerfectlyManyCountableModels.countableModelCount_eq [Countable (Σ l, L.Relations l)]
    {φ : Sentenceω L} (h : HasPerfectlyManyCountableModels φ) : countableModelCount φ = 𝔠 := by
  sorry

/-- **Layer 0 milestone, the finite tiers.** For each `n`, the models of `φ` on `Fin n` are
countably many up to isomorphism, or there is a perfect set of pairwise non-isomorphic ones:
Silver's theorem for the Borel isomorphism relation on the Borel set of models. -/
theorem countable_or_hasPerfectSetOfNonisoModelsOn_fin [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L) (n : ℕ) :
    Countable (Quotient (isoSetoidOn (Fin n) φ)) ∨ HasPerfectSetOfNonisoModelsOn (Fin n) φ := by
  sorry

/-- Existential closure over all bound positions. Stand-in for Tau Ceti's
`FirstOrder.Language.BoundedFormulaInf.exs` (`TauCeti/ModelTheory/Infinitary/Syntax.lean` at Tau
Ceti main), a parent-roadmap target that the parent prototype does not declare. -/
def exs {ι : Type uι} {α : Type*} : {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L ι α 0
  | 0, φ => φ
  | _ + 1, φ => exs φ.ex

/-- The bound positions of an `n`-tuple are pairwise distinct. -/
noncomputable def pairwiseDistinct (n : ℕ) : BoundedFormulaω L Empty n :=
  BoundedFormulaInf.iInfAlong
    (IndexCoding.ofEncodableWith (Encodable.ofCountable {p : Fin n × Fin n // p.1 < p.2}))
    fun p => (BoundedFormulaInf.equal (Term.var (Sum.inr p.1.1))
      (Term.var (Sum.inr p.1.2))).not

variable (L) in
/-- **Layer 0.** The sentence "the universe is infinite": for every `n`, there are `n` pairwise
distinct elements. -/
noncomputable def infiniteSentence : Sentenceω L :=
  BoundedFormulaInf.iInf fun n => exs (pairwiseDistinct (L := L) n)

theorem realize_infiniteSentence_iff {M : Type w} [L.Structure M] :
    SentenceInf.Realize (infiniteSentence L) M ↔ Infinite M := by
  sorry

end Layer0

/-! ## Layer 0: transport between presentations of a countable language -/

section Transport

section LanguageMaps

variable {L' : FirstOrder.Language.{u', v'}} {ι : Type uι} {α : Type*}

/-- **Stand-in for `onBoundedFormulaInf` of the InfinitaryModelExistence roadmap (its Layer
0.1)**, copied verbatim from that roadmap's prototype. A
language homomorphism acts on infinitary formulas at every carrier, symbol by symbol. -/
def onBoundedFormulaInf (g : L →ᴸ L') :
    {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L' ι α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal (g.onTerm t₁) (g.onTerm t₂)
  | _, .rel R ts => .rel (g.onRelation R) fun i => g.onTerm (ts i)
  | _, .imp φ ψ => (onBoundedFormulaInf g φ).imp (onBoundedFormulaInf g ψ)
  | _, .all φ => (onBoundedFormulaInf g φ).all
  | _, .iSup φs => .iSup fun i => onBoundedFormulaInf g (φs i)
  | _, .iInf φs => .iInf fun i => onBoundedFormulaInf g (φs i)

/-- **Stand-in for `realize_onBoundedFormulaInf` of the InfinitaryModelExistence roadmap (its Layer
0.1)**, copied verbatim from that roadmap's prototype. -/
theorem realize_onBoundedFormulaInf (g : L →ᴸ L') {M : Type w} [L.Structure M]
    [L'.Structure M] [g.IsExpansionOn M] {n : ℕ} (φ : BoundedFormulaInf L ι α n)
    (v : α → M) (xs : Fin n → M) :
    (onBoundedFormulaInf g φ).Realize v xs ↔ φ.Realize v xs := by
  sorry

end LanguageMaps

/-- **Layer 0 milestone, transport of the count.** A language equivalence between relational
languages preserves the number of countable models and perfectly many countable models. -/
theorem lift_countableModelCount_onBoundedFormulaInf {L' : FirstOrder.Language.{u', v'}}
    [L.IsRelational] [L'.IsRelational] (e : L ≃ᴸ L') (φ : Sentenceω L) :
    Cardinal.lift.{v'} (countableModelCount φ) =
      Cardinal.lift.{v} (countableModelCount (onBoundedFormulaInf e.toLHom φ)) := by
  sorry

theorem hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff
    {L' : FirstOrder.Language.{u', v'}} [L.IsRelational] [L'.IsRelational] (e : L ≃ᴸ L')
    (φ : Sentenceω L) :
    HasPerfectlyManyCountableModels (onBoundedFormulaInf e.toLHom φ) ↔
      HasPerfectlyManyCountableModels φ := by
  sorry

end Transport

/-! ## Layer 0 acceptance check: a perfect set at the finite tier `Fin 1` -/

namespace UnaryPredicates

/-- One unary relation symbol for each natural number, and nothing else. -/
def Rel : ℕ → Type
  | 1 => ℕ
  | _ => PEmpty

/-- The language of countably many unary predicates. -/
def lang : FirstOrder.Language.{0, 0} := ⟨fun _ => PEmpty, Rel⟩

instance : lang.IsRelational := fun _ => inferInstanceAs (IsEmpty PEmpty)

instance (l : ℕ) : Countable (lang.Relations l) := by
  rcases l with _ | _ | l <;> simp only [lang, Rel] <;> infer_instance

/-- "There is exactly one element": `∃ x ∀ y, y = x`, through the parent's finitary embedding. -/
def oneElement : Sentenceω lang :=
  toInf (ι := ℕ) (BoundedFormula.ex (BoundedFormula.all
    (Term.bdEqual (Term.var (Sum.inr (1 : Fin 2))) (Term.var (Sum.inr (0 : Fin 2))))))

/-- **Layer 0 acceptance check.** The codes on `Fin 1` form a perfect set of pairwise
non-isomorphic models: continuum many pairwise non-isomorphic one-element structures. -/
theorem hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates :
    HasPerfectSetOfNonisoModelsOn (Fin 1) oneElement := by
  sorry

/-- There are no models on `ℕ`, so the perfect alternative holds only at a finite tier. -/
theorem modelsOf_oneElement_nat : (modelsOf oneElement : Set (StructureSpace lang)) = ∅ := by
  sorry

theorem countableModelCount_oneElement : countableModelCount oneElement = 𝔠 := by
  sorry

end UnaryPredicates

/-! ## Layer 1: the back-and-forth stratification and isolating ranks -/

section Layer1

variable [L.IsRelational]

/-- **Layer 1.** Back-and-forth equivalence at level `β` on the models of `φ` on `ℕ`. -/
def bfEquivSetoidOn (φ : Sentenceω L) (β : Ordinal.{0}) :
    Setoid (modelsOf φ : Set (StructureSpace L)) :=
  (bfEquivSetoid β).comap Subtype.val

/-- **Layer 1.** The parent roadmap's Scott formula of the empty tuple of the structure decoded
from `c`, at level `β`, read as a sentence (`BoundedFormulaω L Empty 0` is `Sentenceω L`). -/
noncomputable def scottSentenceAtLevel [Countable (Σ l, L.Relations l)] (c : StructureSpace L)
    (β : Ordinal.{0}) : Sentenceω L :=
  @scottFormula L _ ℕ c.toStructure _ 0 Fin.elim0 β

/-- **Layer 1 milestone.** Below `ω₁`, every back-and-forth class is the model class of a
sentence. -/
theorem modelsOf_scottSentenceAtLevel [Countable (Σ l, L.Relations l)] (c : StructureSpace L)
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1) :
    (modelsOf (scottSentenceAtLevel c β) : Set (StructureSpace L)) = {d | bfEquivSetoid β c d} := by
  sorry

/-- **Layer 1, the isolating-rank contract.** A rank on codes that is isomorphism invariant,
countable, and isolating at its own value: back-and-forth equivalence at the rank of `c` decides
isomorphism with `c`. Countable fibres and "countable iff bounded" are theorems, not fields. -/
structure IsIsolatingRank (ρ : StructureSpace L → Ordinal.{0}) : Prop where
  iso_invariant : ∀ ⦃c d⦄, structureIsoSetoid L c d → ρ c = ρ d
  lt_omega_one : ∀ c, ρ c < Ordinal.omega 1
  isolates : ∀ ⦃c d⦄, bfEquivSetoid (ρ c) c d → structureIsoSetoid L c d

/-- **Layer 1 milestone, the instance.** The Scott height of the CountableStructureSpaces roadmap
(values in `Ordinal.{0}` for structures on `ℕ`), read on codes, is an isolating rank, by that
roadmap's `nonempty_equiv_of_bfEquiv_of_scottHeight_le`, `scottHeight_lt_omega_one` and
`scottHeight_congr`. -/
theorem isIsolatingRank_scottHeight [Countable (Σ l, L.Relations l)] :
    IsIsolatingRank
      (fun c : StructureSpace L => letI := c.toStructure; scottHeight (L := L) ℕ) := by
  sorry

theorem exists_isIsolatingRank [Countable (Σ l, L.Relations l)] :
    ∃ ρ : StructureSpace L → Ordinal.{0}, IsIsolatingRank ρ :=
  ⟨_, isIsolatingRank_scottHeight⟩

/-- **Layer 1.** An isolating rank isolates at every level at or above its value. -/
theorem IsIsolatingRank.isolates_of_le {ρ : StructureSpace L → Ordinal.{0}}
    (hρ : IsIsolatingRank ρ) {c d : StructureSpace L} {γ : Ordinal.{0}} (hγ : ρ c ≤ γ)
    (h : bfEquivSetoid γ c d) : structureIsoSetoid L c d := by
  sorry

/-- **Layer 1 milestone, the stratification bound.** If at every level `β < ω₁` the codes of a
set `K` fall into countably many back-and-forth classes, then `K` meets at most `ℵ₁`
isomorphism classes: the classes of rank `β` inject into the level-`β` quotient. -/
theorem mk_isoClasses_le_aleph_one_of_countable_levels [Countable (Σ l, L.Relations l)]
    (K : Set (StructureSpace L))
    (hK : ∀ β < Ordinal.omega 1,
      Countable (Quotient ((bfEquivSetoid β).comap (Subtype.val : K → StructureSpace L)))) :
    #(Quotient.mk (structureIsoSetoid L) '' K) ≤ ℵ₁ := by
  sorry

/-- **Layer 1, isolation.** Every point is determined, up to the target relation, by its class
under one of countably many relations (the index may depend on the point). -/
def _root_.Setoid.IsolatedBy {X : Type*} {I : Type*} (E : I → Setoid X) (R : Setoid X) : Prop :=
  ∀ x, ∃ i, ∀ y, E i x y → R x y

/-- **Layer 1 milestone.** Countably many relations with countable quotients, isolating the
target, give it a countable quotient. -/
theorem _root_.Setoid.countable_quotient_of_isolatedBy {X : Type*} {I : Type*} [Countable I]
    {E : I → Setoid X} {R : Setoid X} (hE : ∀ i, Countable (Quotient (E i)))
    (h : Setoid.IsolatedBy E R) : Countable (Quotient R) := by
  sorry

end Layer1

/-! ## Layer 2: the bounded-rank dichotomy -/

section Layer2

variable [L.IsRelational] [Countable (Σ l, L.Relations l)]

/-- **Layer 2 milestone, the bounded-rank dichotomy with a witness.** If an isolating rank is
bounded below `ω₁` on the models of `φ` on `ℕ`, then isomorphism on those models is
back-and-forth equivalence at the bound, hence Borel, and Silver's theorem gives countably many
countable models or a perfect set of pairwise non-isomorphic ones. -/
theorem countableModelCount_le_aleph0_or_hasPerfectlyMany_of_bounded
    {ρ : StructureSpace L → Ordinal.{0}} (hρ : IsIsolatingRank ρ) {φ : Sentenceω L}
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (StructureSpace L)), ρ c ≤ β) :
    countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 2 milestone, the cardinal form.** Under the same hypotheses, `≤ ℵ₀` or exactly
continuum many countable models. -/
theorem countableModelCount_le_aleph0_or_eq_continuum_of_bounded
    {ρ : StructureSpace L → Ordinal.{0}} (hρ : IsIsolatingRank ρ) {φ : Sentenceω L}
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (StructureSpace L)), ρ c ≤ β) :
    countableModelCount φ ≤ ℵ₀ ∨ countableModelCount φ = 𝔠 := by
  sorry

/-- **Layer 2 milestone, internal Scott rank.** A uniform bound below `ω₁` on the parent roadmap's
internal Scott rank of the models on `ℕ` gives the same dichotomy: by the CountableStructureSpaces
roadmap's `scottHeight_le_internalScottRank_add_omega0`, the Scott height is then below the bound
plus `ω`. -/
theorem countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le
    {φ : Sentenceω L} {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (StructureSpace L)),
      letI := c.toStructure; internalScottRank (L := L) ℕ ≤ β) :
    countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ := by
  sorry

end Layer2

/-! ## Layer 3: Morley's theorem -/

section Layer3

variable [L.IsRelational] [Countable (Σ l, L.Relations l)]

/-- **Layer 3 milestone, one level.** At each level `β < ω₁` the models of `φ` on `ℕ` fall into
countably many back-and-forth classes, or there is a perfect set of pairwise non-isomorphic
models on `ℕ`: Silver's theorem relative to the Borel set of models, for the Borel relation
`bfEquivSetoidOn φ β`, which isomorphism refines. -/
theorem countable_bfClasses_or_hasPerfectSet (φ : Sentenceω L) {β : Ordinal.{0}}
    (hβ : β < Ordinal.omega 1) :
    Countable (Quotient (bfEquivSetoidOn φ β)) ∨ HasPerfectSetOfNonisoModelsOn ℕ φ := by
  sorry

/-- **Layer 3.** A sentence is thin on its models on `ℕ`: no perfect set of pairwise
non-isomorphic ones (the BorelEquivalenceRelations roadmap's `IsThinOn` for these models). -/
def IsThinOnNatModels (φ : Sentenceω L) : Prop :=
  ¬ HasPerfectSetOfNonisoModelsOn ℕ φ

/-- **Layer 3, the summit: Morley's theorem with a witness.** A sentence of `Lω₁ω` in a countable
relational language has at most `ℵ₁` countable models up to isomorphism, or a perfect set of
pairwise non-isomorphic countable models. No form of the continuum hypothesis is used. -/
theorem morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany (φ : Sentenceω L) :
    countableModelCount φ ≤ ℵ₁ ∨ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 3, Morley's theorem, cardinal form**: at most `ℵ₁` or exactly continuum many. -/
theorem morley_countableModelCount (φ : Sentenceω L) :
    countableModelCount φ ≤ ℵ₁ ∨ countableModelCount φ = 𝔠 := by
  sorry

end Layer3

/-! ## Layer 4: scattered classes and thinness criteria -/

section Layer4

variable [L.IsRelational]

/-- **Layer 4.** A set of codes is back-and-forth scattered: at every level below `ω₁` it meets
countably many back-and-forth classes. No definability of `K` is assumed. -/
def BFScattered (K : Set (StructureSpace L)) : Prop :=
  ∀ β < Ordinal.omega 1,
    Countable (Quotient ((bfEquivSetoid β).comap (Subtype.val : K → StructureSpace L)))

/-- **Layer 4 milestone.** A back-and-forth scattered set carries no Cantor antichain for
isomorphism (the BorelEquivalenceRelations roadmap's `HasCantorAntichainOn`, written out): its
range is analytic, so the CountableStructureSpaces roadmap's uniform separation finds one level
separating it. -/
theorem not_hasCantorAntichainOn_of_bfScattered {K : Set (StructureSpace L)}
    (hK : BFScattered K) :
    ¬ ∃ f : (ℕ → Bool) → StructureSpace L, Continuous f ∧ (∀ x, f x ∈ K) ∧
        ∀ x y, x ≠ y → ¬ structureIsoSetoid L (f x) (f y) := by
  sorry

/-- **Layer 4 milestone.** For the models of a sentence, thin is the same as back-and-forth
scattered. Scattered implies thin by uniform separation; thin implies scattered by the one-level
Silver step of Layer 3. -/
theorem bfScattered_modelsOf_iff_isThinOnNatModels [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L) : BFScattered (modelsOf φ) ↔ IsThinOnNatModels φ := by
  sorry

/-- **Layer 4 milestone, counting a scattered class.** For any isolating rank and any
back-and-forth scattered set of codes, countably many isomorphism classes exactly when the rank
is bounded below `ω₁` on it. -/
theorem IsIsolatingRank.countable_isoClasses_iff_bounded {ρ : StructureSpace L → Ordinal.{0}}
    (hρ : IsIsolatingRank ρ) {K : Set (StructureSpace L)} (hK : BFScattered K) :
    (Quotient.mk (structureIsoSetoid L) '' K).Countable ↔
      ∃ β < Ordinal.omega 1, ∀ c ∈ K, ρ c < β := by
  sorry

/-- **Layer 4 milestone.** Under the same hypotheses, uncountably many classes are exactly `ℵ₁`. -/
theorem IsIsolatingRank.mk_isoClasses_eq_aleph_one {ρ : StructureSpace L → Ordinal.{0}}
    (hρ : IsIsolatingRank ρ) {K : Set (StructureSpace L)} (hK : BFScattered K)
    (hunc : ¬ (Quotient.mk (structureIsoSetoid L) '' K).Countable) :
    #(Quotient.mk (structureIsoSetoid L) '' K) = ℵ₁ := by
  sorry

/-- **Layer 4.** A set of codes is concentrated at back-and-forth levels: at each level `β < ω₁`,
all but countably many of its isomorphism classes lie in the class of one centre `k`. -/
def ConcentratedAtBFLevels (C : Set (StructureSpace L)) : Prop :=
  ∀ β < Ordinal.omega 1, ∃ k : StructureSpace L,
    (Quotient.mk (structureIsoSetoid L) '' {x | x ∈ C ∧ ¬ bfEquivSetoid β x k}).Countable

theorem ConcentratedAtBFLevels.bfScattered {C : Set (StructureSpace L)}
    (hC : ConcentratedAtBFLevels C) : BFScattered C := by
  sorry

/-- **Layer 4.** The truth sequence of a countable list of sentences at a code. -/
noncomputable def sentenceTheory (θ : ℕ → Sentenceω L) (c : StructureSpace L) : ℕ → Bool :=
  fun n => @decide (c ∈ (modelsOf (θ n) : Set (StructureSpace L))) (Classical.propDecidable _)

/-- **Layer 4 milestone, the sentence-spectrum characterization.** A Borel set of codes carries
no perfect set of pairwise non-isomorphic codes exactly when every countable list of sentences
has countably many realized truth sequences on it. No isomorphism invariance is assumed. -/
theorem isThin_iff_countable_sentenceSpectra [Countable (Σ l, L.Relations l)]
    (C : Set (StructureSpace L)) (hC : MeasurableSet C) :
    (¬ ∃ P : Set (StructureSpace L), Perfect P ∧ P.Nonempty ∧ P ⊆ C ∧
        ∀ c ∈ P, ∀ d ∈ P, structureIsoSetoid L c d → c = d) ↔
      ∀ θ : ℕ → Sentenceω L, (sentenceTheory θ '' C).Countable := by
  sorry

end Layer4

/-! ## Layer 5: Vaught's conjecture, stated, and its reformulations -/

section Layer5

/-- **Layer 5.** The Vaught dichotomy for one sentence, in its perfect-set form: countably many
countable models, or a perfect set of pairwise non-isomorphic ones. -/
def HasVaughtDichotomy [L.IsRelational] (φ : Sentenceω L) : Prop :=
  countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ

/-- **Layer 5.** The cardinal form for one sentence: `≤ ℵ₀` or exactly continuum many. -/
def HasVaughtCount [L.IsRelational] (φ : Sentenceω L) : Prop :=
  countableModelCount φ ≤ ℵ₀ ∨ countableModelCount φ = 𝔠

/-- **Layer 5, Vaught's conjecture** for `Lω₁ω`, perfect-set form: every sentence of a countable
relational language has countably many countable models or perfectly many. A statement, not a
target. It quantifies over `Language.{0, 0}` because a countable language can always be presented
in universe 0; the per-sentence predicates above are universe-polymorphic. -/
def VaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L), HasVaughtDichotomy φ

/-- **Layer 5.** The cardinal form of the conjecture. -/
def CardinalVaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L), HasVaughtCount φ

/-- **Layer 5 milestone.** The perfect-set form implies the cardinal form. -/
theorem VaughtConjecture.cardinal (h : VaughtConjecture) : CardinalVaughtConjecture := by
  sorry

/-- **Layer 5 milestone.** Under the continuum hypothesis the cardinal form holds, by Morley's
theorem. -/
theorem cardinalVaughtConjecture_of_aleph_one_eq_continuum (hCH : ℵ₁ = 𝔠) :
    CardinalVaughtConjecture := by
  sorry

/-- **Layer 5 milestone.** When `ℵ₁ < 𝔠`, the two forms are equivalent, by the witnessed form of
Morley's theorem. -/
theorem cardinalVaughtConjecture_iff_vaughtConjecture (h : ℵ₁ < 𝔠) :
    CardinalVaughtConjecture ↔ VaughtConjecture := by
  sorry

/-- **Layer 5 milestone, counterexamples.** A sentence fails the Vaught dichotomy exactly when it
has exactly `ℵ₁` countable models and no perfect set of pairwise non-isomorphic ones. -/
theorem not_hasVaughtDichotomy_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L) :
    ¬ HasVaughtDichotomy φ ↔
      countableModelCount φ = ℵ₁ ∧ ¬ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 5 milestone, cardinal counterexamples.** A sentence fails the cardinal form exactly
when it has exactly `ℵ₁` countable models and `ℵ₁ < 𝔠`. -/
theorem not_hasVaughtCount_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L) :
    ¬ HasVaughtCount φ ↔ countableModelCount φ = ℵ₁ ∧ ℵ₁ < 𝔠 := by
  sorry

/-- **Layer 5 milestone, the infinite-model reduction.** Adding "the universe is infinite" removes
the finite tiers: the dichotomy then speaks of the models on `ℕ` alone. -/
theorem hasVaughtDichotomy_and_infiniteSentence_iff [L.IsRelational]
    [Countable (Σ l, L.Relations l)] (φ : Sentenceω L) :
    HasVaughtDichotomy (φ.and (infiniteSentence L)) ↔
      Countable (Quotient (isoSetoidOn ℕ φ)) ∨ HasPerfectSetOfNonisoModelsOn ℕ φ := by
  sorry

/-- **Layer 5 milestone.** Vaught's conjecture holds exactly when every sentence whose models on
`ℕ` are back-and-forth scattered has countably many models on `ℕ`. -/
theorem vaughtConjecture_iff_bfScattered :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : Sentenceω L), BFScattered (modelsOf φ) →
          Countable (Quotient (isoSetoidOn ℕ φ)) := by
  sorry

/-- **Layer 5 milestone.** Under `ℵ₁ < 𝔠`, and only so, the scattered reformulation is also
equivalent to the cardinal form. -/
theorem cardinalVaughtConjecture_iff_bfScattered (h : ℵ₁ < 𝔠) :
    CardinalVaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : Sentenceω L), BFScattered (modelsOf φ) →
          Countable (Quotient (isoSetoidOn ℕ φ)) := by
  sorry

/-- **Layer 5 milestone, universes.** The conjecture over `Language.{0, 0}` is the conjecture over
countable relational languages in any universe, by the InfinitaryModelExistence roadmap's
`smallPresentationEquiv` and `lift_countableModelCount_onBoundedFormulaInf`. -/
theorem vaughtConjecture_iff_forall_universe :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{u, v}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : Sentenceω L), HasVaughtDichotomy φ := by
  sorry

/-- **Layer 5.** The codes on `ℕ` of models of a first-order theory. -/
def modelsOfTheory [L.IsRelational] (T : L.Theory) : Set (StructureSpace L) :=
  {c | letI := c.toStructure; T.Model ℕ}

/-- **Layer 5, Vaught's original conjecture**: a complete first-order theory in a countable
relational language has countably many countably infinite models or perfectly many. Stated
separately from `VaughtConjecture`; only the implication below is claimed. -/
def FirstOrderVaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (T : L.Theory), T.IsComplete →
      Countable (Quotient ((structureIsoSetoid L).comap
        (Subtype.val : modelsOfTheory T → StructureSpace L))) ∨
      ∃ P : Set (StructureSpace L), Perfect P ∧ P.Nonempty ∧ P ⊆ modelsOfTheory T ∧
        ∀ c ∈ P, ∀ d ∈ P, structureIsoSetoid L c d → c = d

/-- **Layer 5 milestone.** The `Lω₁ω` conjecture implies the first-order one: a theory in a
countable language is countable, so it is one `Lω₁ω` sentence. -/
theorem VaughtConjecture.firstOrder (h : VaughtConjecture) : FirstOrderVaughtConjecture := by
  sorry

/-- **Layer 5.** A set of codes is minimally uncountable: it meets uncountably many isomorphism
classes, and every cut by a sentence has a side meeting only countably many. -/
def MinimallyUncountableOn [L.IsRelational] (K : Set (StructureSpace L)) : Prop :=
  ¬ (Quotient.mk (structureIsoSetoid L) '' K).Countable ∧
    ∀ θ : Sentenceω L, (Quotient.mk (structureIsoSetoid L) '' (K ∩ modelsOf θ)).Countable ∨
      (Quotient.mk (structureIsoSetoid L) '' (K \ modelsOf θ)).Countable

/-- **Layer 5 milestone.** The models of a sentence are minimally uncountable exactly when they
are concentrated at back-and-forth levels and meet uncountably many isomorphism classes. -/
theorem minimallyUncountableOn_modelsOf_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : Sentenceω L) :
    MinimallyUncountableOn (modelsOf φ) ↔ ConcentratedAtBFLevels (modelsOf φ) ∧
      ¬ (Quotient.mk (structureIsoSetoid L) ''
        (modelsOf φ : Set (StructureSpace L))).Countable := by
  sorry

/-- **Layer 5 milestone.** A minimally uncountable sentence refutes Vaught's conjecture:
`φ.and (infiniteSentence L)` has the same models on `ℕ`, thin and uncountably many, and no finite
models. -/
theorem not_vaughtConjecture_of_minimallyUncountableOn {L : FirstOrder.Language.{0, 0}}
    [L.IsRelational] [Countable (Σ l, L.Relations l)] {φ : Sentenceω L}
    (h : MinimallyUncountableOn (modelsOf φ)) : ¬ VaughtConjecture := by
  sorry

/-! ### Minimal counterexamples (Harnik–Makkai, Steel) -/

/-- **Layer 5 milestone, saturation.** The models of a sentence are a union of back-and-forth
classes from some countable level on (uniform separation of the CountableStructureSpaces
roadmap applied to the Borel set of pairs separating `modelsOf θ` from its complement). -/
theorem exists_bfLevel_saturated_modelsOf [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (θ : Sentenceω L) :
    ∃ β₀ < Ordinal.omega 1, ∀ β, β₀ ≤ β → ∀ c d : StructureSpace L, bfEquivSetoid β c d →
      (c ∈ (modelsOf θ : Set (StructureSpace L)) ↔ d ∈ (modelsOf θ : Set (StructureSpace L))) := by
  sorry

/-- **Layer 5.** The two forms of "countably many models on `ℕ`" agree: through the setoid
`isoSetoidOn ℕ φ` on the model class, and through the image of the model class in the quotient by
the ambient isomorphism relation. -/
theorem countable_quotient_isoSetoidOn_iff [L.IsRelational] (φ : Sentenceω L) :
    Countable (Quotient (isoSetoidOn ℕ φ)) ↔
      (Quotient.mk (structureIsoSetoid L) '' (modelsOf φ : Set (StructureSpace L))).Countable := by
  sorry

/-- **Layer 5 milestone, the limit model.** A sequence of codes, consecutive ones back-and-forth
equivalent at `α i + ω` along a monotone sequence of levels, has a limit code back-and-forth
equivalent to the `i`-th at level `α i`. The offset `ω` suffices because extending a tuple of
length `n` costs `n` levels in the one-element convention of `BFEquiv` and the tuples of the
construction grow without bound; no countability of the levels is needed. -/
theorem exists_limit_of_bfEquiv_chain [L.IsRelational] (c : ℕ → StructureSpace L)
    (α : ℕ → Ordinal.{0}) (hα : Monotone α)
    (hc : ∀ i, bfEquivSetoid (α i + Ordinal.omega0) (c i) (c (i + 1))) :
    ∃ d : StructureSpace L, ∀ i, bfEquivSetoid (α i) d (c i) := by
  sorry

/-- **Layer 5 milestone, the Harnik–Makkai reduction.** A sentence with back-and-forth scattered
models on `ℕ` meeting uncountably many isomorphism classes has a minimally uncountable
strengthening. -/
theorem exists_minimallyUncountableOn_and_of_bfScattered [L.IsRelational]
    [Countable (Σ l, L.Relations l)] {Θ : Sentenceω L} (hK : BFScattered (modelsOf Θ))
    (hunc : ¬ (Quotient.mk (structureIsoSetoid L) ''
      (modelsOf Θ : Set (StructureSpace L))).Countable) :
    ∃ θ : Sentenceω L, MinimallyUncountableOn (modelsOf (Θ.and θ)) := by
  sorry

/-- **Layer 5 milestone.** Vaught's conjecture holds exactly when there is no minimally
uncountable sentence. -/
theorem vaughtConjecture_iff_forall_not_minimallyUncountableOn :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : Sentenceω L), ¬ MinimallyUncountableOn (modelsOf φ) := by
  sorry

end Layer5

/-! ## Layer 6: row assemblies and a structure of internal Scott rank `ω` -/

namespace RowAssembly

/-- Labels: nonempty words over `U`. -/
def Label (U : Type) : Type := {τ : List U // τ ≠ []}

/-- The relation symbols of the assembled language: rows, ownership, labels, and the lifted
component relations (with the nullary ones read at the owner row). -/
inductive Sym (U : Type) (Lc : FirstOrder.Language.{0, 0}) : ℕ → Type
  | row : Sym U Lc 1
  | own : Sym U Lc 2
  | lab (τ : Label U) : Sym U Lc 1
  | lift {l : ℕ} (R : Lc.Relations (l + 1)) : Sym U Lc (l + 1)
  | lift0 (R : Lc.Relations 0) (τ : Label U) : Sym U Lc 1

/-- The assembled language: relational, with the symbols of `Sym`. -/
def lang (U : Type) (Lc : FirstOrder.Language.{0, 0}) : FirstOrder.Language.{0, 0} :=
  ⟨fun _ => PEmpty, Sym U Lc⟩

instance (U : Type) (Lc : FirstOrder.Language.{0, 0}) : (lang U Lc).IsRelational :=
  fun _ => inferInstanceAs (IsEmpty PEmpty)

/-- The assembled carrier: rows, and the points of every fiber. -/
inductive Carrier {U : Type} (R : Type) (C : R → Label U → Type) : Type
  | row (r : R)
  | pt (r : R) (τ : Label U) (x : C r τ)

/-- **Layer 6 milestone.** There is a countable structure of internal Scott rank exactly `ω`
and a family, indexed by Cantor space, of countable structures that are pairwise
non-isomorphic, not isomorphic to it, and back-and-forth equivalent to it at level `ω`. The
README fixes the construction: the prefix assembly over `ℕ` with components `Fin (u + 1)`,
default `ℕ`, allowed sets `{u | u ≤ n}`, and its companions along the paths of binary
sequences. -/
theorem exists_internalScottRank_omega_with_large_bfClass :
    ∃ (M : Type) (_ : (lang ℕ Language.empty).Structure M) (_ : Countable M)
      (N : (ℕ → Bool) → Type) (_ : ∀ z, (lang ℕ Language.empty).Structure (N z))
      (_ : ∀ z, Countable (N z)),
      internalScottRank (L := lang ℕ Language.empty) M = Ordinal.omega0 ∧
      Ordinal.omega0 < scottHeight (L := lang ℕ Language.empty) M ∧
      (∀ z, BFEquiv (L := lang ℕ Language.empty) Ordinal.omega0.{0} 0
        (Fin.elim0 : Fin 0 → N z) (Fin.elim0 : Fin 0 → M)) ∧
      (∀ z, IsEmpty (N z ≃[lang ℕ Language.empty] M)) ∧
      (∀ z z', z ≠ z' → IsEmpty (N z ≃[lang ℕ Language.empty] N z')) := by
  sorry

/-- **Layer 6 milestone.** The internal Scott rank, read on codes, is not an isolating rank. -/
theorem not_isIsolatingRank_internalScottRank :
    ¬ IsIsolatingRank (L := lang ℕ Language.empty)
        (fun c => letI := c.toStructure; internalScottRank (L := lang ℕ Language.empty) ℕ) := by
  sorry

end RowAssembly

end TauCetiRoadmap.CountableModelCounting

module

public import Mathlib
public import TauCeti.Data.Setoid.Isolation
public import TauCeti.ModelTheory.Counting.Classes
public import TauCeti.ModelTheory.Counting.LanguageEquiv
public import TauCeti.ModelTheory.Counting.Levels
public import TauCeti.ModelTheory.Counting.Scattered.Basic
public import TauCeti.ModelTheory.Counting.Stratification
public import TauCeti.ModelTheory.Infinitary.Infinite
public import TauCeti.ModelTheory.ModelExistence.Morleyization
public import TauCeti.ModelTheory.RelationalConfiguration.LanguageMap
public import TauCeti.ModelTheory.RelationalConfiguration.LevelSentence
public import TauCeti.ModelTheory.Scott.Height
public import TauCeti.ModelTheory.Scott.Rank
public import TauCeti.SetTheory.Descriptive.Antichain

/-!
# Counting countable models: Morley's theorem and the Vaught toolkit: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, standing conventions,
layer-by-layer build (Layers 0–6), worked examples, coordination, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

The file builds on the native Tau Ceti declarations at this repository's pin (the infinitary
syntax, back-and-forth equivalence and Scott analysis, the relational configurations
`TauCeti.RelationalConfiguration` with their model classes, isomorphism and back-and-forth
relations, the perfect-set vocabulary, the language maps and the Morleyization), including the
targets of this roadmap that Tau Ceti already implements. Names and namespaces are provisional.
-/

@[expose] public section

set_option autoImplicit false

universe u v w w' u' v'

namespace TauCetiRoadmap.CountableModelCounting

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure Cardinal MeasureTheory Set
open TauCeti
open TauCeti.RelationalConfiguration (atom modelsOf isoSetoid isoSetoidOn bfEquivSetoid
  bfEquivSetoidOn)

variable {L : FirstOrder.Language.{u, v}}

/-! ## Layer 0: counting isomorphism classes of countable models

The restricted isomorphism `isoSetoidOn V φ`, the classes `CountableModelClasses φ`, the count
`countableModelCount φ`, the class map `classOf φ hM` and `HasPerfectlyManyCountableModels φ` are
Tau Ceti's `TauCeti.RelationalConfiguration.isoSetoidOn`, `TauCeti.CountableModelClasses`,
`TauCeti.countableModelCount`, `TauCeti.classOf` and `TauCeti.HasPerfectlyManyCountableModels`;
the sentence `L.infiniteSentence` is `FirstOrder.Language.infiniteSentence`. -/

section Layer0

variable [L.IsRelational]

/-- **Layer 0 milestone.** A code transported from a model is a code of a model (by
`Equiv.realize_encodeVia`, which carries realization along `Equiv.nonempty_equiv_encodeVia`). -/
theorem encodeVia_mem_modelsOf {α : Type} (φ : L.Sentenceω) {M : Type w} [L.Structure M]
    (e : M ≃ α) (hM : SentenceInf.Realize φ M) :
    e.encodeVia (L := L) ∈ (modelsOf φ : Set (RelationalConfiguration L α)) := by
  sorry

/-- **Layer 0 milestone.** Two countable models, in any two universes, have the same class
exactly when they are isomorphic. -/
theorem classOf_eq_classOf_iff (φ : L.Sentenceω) {M : Type w} {N : Type w'} [L.Structure M]
    [L.Structure N] [Countable M] [Countable N] (hM : SentenceInf.Realize φ M)
    (hN : SentenceInf.Realize φ N) :
    classOf φ hM = classOf φ hN ↔ Nonempty (M ≃[L] N) := by
  sorry

/-- **Layer 0 milestone.** Every class is the class of a countable model in every universe. -/
theorem classOf_surjective (φ : L.Sentenceω) (q : CountableModelClasses φ) :
    ∃ (M : Type w) (_ : L.Structure M) (_ : Countable M) (hM : SentenceInf.Realize φ M),
      classOf φ hM = q := by
  sorry

/-- **Layer 0 milestone.** There are at most continuum many countable models. -/
theorem countableModelCount_le_continuum [Countable (Σ l, L.Relations l)] (φ : L.Sentenceω) :
    countableModelCount φ ≤ 𝔠 := by
  sorry

/-- **Layer 0 milestone.** Isomorphism of codes on `Fin n` is a finite union of graphs of
relabellings, so it has Borel graph. -/
theorem measurableSet_isoSetoid_fin [Countable (Σ l, L.Relations l)] (n : ℕ) :
    MeasurableSet {p : RelationalConfiguration L (Fin n) × RelationalConfiguration L (Fin n) |
      isoSetoid L (Fin n) p.1 p.2} := by
  sorry

/-- **Layer 0.** `φ` has a perfect set of pairwise non-isomorphic models with carrier `α`. -/
def HasPerfectSetOfNonisoModelsOn (α : Type) (φ : L.Sentenceω) : Prop :=
  (isoSetoid L α).HasPerfectAntichainOn (modelsOf φ)

/-- **Layer 0 milestone.** Perfectly many countable models are continuum many. -/
theorem HasPerfectlyManyCountableModels.countableModelCount_eq [Countable (Σ l, L.Relations l)]
    {φ : L.Sentenceω} (h : HasPerfectlyManyCountableModels φ) : countableModelCount φ = 𝔠 := by
  sorry

/-- **Layer 0 milestone, the finite tiers.** For each `n`, the models of `φ` on `Fin n` are
countably many up to isomorphism, or there is a perfect set of pairwise non-isomorphic ones:
Silver's theorem for the Borel isomorphism relation on the Borel set of models. -/
theorem countable_or_hasPerfectSetOfNonisoModelsOn_fin [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω) (n : ℕ) :
    Countable (Quotient (isoSetoidOn (Fin n) φ)) ∨ HasPerfectSetOfNonisoModelsOn (Fin n) φ := by
  sorry

/-- **Layer 0.** The sentence "the universe is infinite", `L.infiniteSentence`: for every `n`,
there are `n` pairwise distinct elements. -/
theorem realize_infiniteSentence_iff {M : Type w} [L.Structure M] :
    SentenceInf.Realize L.infiniteSentence M ↔ Infinite M := by
  sorry

end Layer0

/-! ## Layer 0: transport between presentations of a countable language -/

section Transport

/-- **Layer 0 milestone, transport of the count.** A language equivalence between relational
languages preserves the number of countable models and perfectly many countable models. -/
theorem lift_countableModelCount_onBoundedFormulaInf {L' : FirstOrder.Language.{u', v'}}
    [L.IsRelational] [L'.IsRelational] (e : L ≃ᴸ L') (φ : L.Sentenceω) :
    Cardinal.lift.{v'} (countableModelCount φ) =
      Cardinal.lift.{v} (countableModelCount (e.toLHom.onBoundedFormulaInf φ)) := by
  sorry

theorem hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff
    {L' : FirstOrder.Language.{u', v'}} [L.IsRelational] [L'.IsRelational] (e : L ≃ᴸ L')
    (φ : L.Sentenceω) :
    HasPerfectlyManyCountableModels (e.toLHom.onBoundedFormulaInf φ) ↔
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

/-- "There is exactly one element": `∃ x ∀ y, y = x`, through the finitary embedding
`BoundedFormula.toInf`. -/
def oneElement : lang.Sentenceω :=
  BoundedFormula.toInf (ι := ℕ) (BoundedFormula.ex (BoundedFormula.all
    (Term.bdEqual (Term.var (Sum.inr (1 : Fin 2))) (Term.var (Sum.inr (0 : Fin 2))))))

/-- **Layer 0 acceptance check.** The codes on `Fin 1` form a perfect set of pairwise
non-isomorphic models: continuum many pairwise non-isomorphic one-element structures. -/
theorem hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates :
    HasPerfectSetOfNonisoModelsOn (Fin 1) oneElement := by
  sorry

/-- There are no models on `ℕ`, so the perfect alternative holds only at a finite tier. -/
theorem modelsOf_oneElement_nat :
    (modelsOf oneElement : Set (RelationalConfiguration lang ℕ)) = ∅ := by
  sorry

theorem countableModelCount_oneElement : countableModelCount oneElement = 𝔠 := by
  sorry

end UnaryPredicates

/-! ## Layer 1: the back-and-forth stratification and isolating ranks

The restricted levels `bfEquivSetoidOn V φ α`, the level sentences `c.scottSentenceAtLevel α`, the
contract `IsIsolatingRank ρ` and isolation `R.IsolatedBy E` are Tau Ceti's
`TauCeti.RelationalConfiguration.bfEquivSetoidOn`,
`TauCeti.RelationalConfiguration.scottSentenceAtLevel`, `TauCeti.IsIsolatingRank` and
`Setoid.IsolatedBy`. -/

section Layer1

variable [L.IsRelational]

/-- **Layer 1 milestone.** Below `ω₁`, every back-and-forth class is the model class of a
sentence. -/
theorem modelsOf_scottSentenceAtLevel [Countable (Σ l, L.Relations l)]
    (c : RelationalConfiguration L ℕ) {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1) :
    (modelsOf (c.scottSentenceAtLevel β) : Set (RelationalConfiguration L ℕ)) =
      {d | bfEquivSetoid L ℕ β c d} := by
  sorry

/-- **Layer 1 milestone, the instance.** The Scott height (values in `Ordinal.{0}` for structures
on `ℕ`), read on codes, is an isolating rank, by `nonempty_equiv_of_bfEquiv_of_scottHeight_le`,
`scottHeight_lt_omega_one` and `Language.Equiv.scottHeight_eq`. -/
theorem isIsolatingRank_scottHeight [Countable (Σ l, L.Relations l)] :
    IsIsolatingRank
      (fun c : RelationalConfiguration L ℕ => letI := c.toStructure; scottHeight (L := L) ℕ) := by
  sorry

theorem exists_isIsolatingRank [Countable (Σ l, L.Relations l)] :
    ∃ ρ : RelationalConfiguration L ℕ → Ordinal.{0}, IsIsolatingRank ρ :=
  ⟨_, CountableModelCounting.isIsolatingRank_scottHeight⟩

/-- **Layer 1.** An isolating rank isolates at every level at or above its value. -/
theorem IsIsolatingRank.isolates_of_le {ρ : RelationalConfiguration L ℕ → Ordinal.{0}}
    (hρ : IsIsolatingRank ρ) {c d : RelationalConfiguration L ℕ} {γ : Ordinal.{0}}
    (hγ : ρ c ≤ γ) (h : bfEquivSetoid L ℕ γ c d) : isoSetoid L ℕ c d := by
  sorry

/-- **Layer 1 milestone, the stratification bound.** If at every level `β < ω₁` the codes of a
set `K` fall into countably many back-and-forth classes, then `K` meets at most `ℵ₁`
isomorphism classes: the classes of rank `β` inject into the level-`β` quotient. -/
theorem mk_isoClasses_le_aleph_one_of_countable_levels [Countable (Σ l, L.Relations l)]
    (K : Set (RelationalConfiguration L ℕ))
    (hK : ∀ β < (Ordinal.omega 1 : Ordinal.{0}),
      Countable (Quotient ((bfEquivSetoid L ℕ β).comap
        (Subtype.val : K → RelationalConfiguration L ℕ)))) :
    #(Quotient.mk (isoSetoid L ℕ) '' K) ≤ ℵ₁ := by
  sorry

/-- **Layer 1 milestone.** Countably many relations with countable quotients, isolating the
target, give it a countable quotient. -/
theorem _root_.Setoid.countable_quotient_of_isolatedBy {X : Type*} {I : Type*} [Countable I]
    {E : I → Setoid X} {R : Setoid X} (hE : ∀ i, Countable (Quotient (E i)))
    (h : R.IsolatedBy E) : Countable (Quotient R) := by
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
    {ρ : RelationalConfiguration L ℕ → Ordinal.{0}} (hρ : IsIsolatingRank ρ) {φ : L.Sentenceω}
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)), ρ c ≤ β) :
    countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 2 milestone, the cardinal form.** Under the same hypotheses, `≤ ℵ₀` or exactly
continuum many countable models. -/
theorem countableModelCount_le_aleph0_or_eq_continuum_of_bounded
    {ρ : RelationalConfiguration L ℕ → Ordinal.{0}} (hρ : IsIsolatingRank ρ) {φ : L.Sentenceω}
    {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)), ρ c ≤ β) :
    countableModelCount φ ≤ ℵ₀ ∨ countableModelCount φ = 𝔠 := by
  sorry

/-- **Layer 2 milestone, internal Scott rank.** A uniform bound below `ω₁` on the internal Scott
rank of the models on `ℕ` gives the same dichotomy: by
`scottHeight_le_internalScottRank_add_omega0`, the Scott height is then below the bound plus
`ω`. -/
theorem countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le
    {φ : L.Sentenceω} {β : Ordinal.{0}} (hβ : β < Ordinal.omega 1)
    (hb : ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)),
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
`bfEquivSetoidOn ℕ φ β`, which isomorphism refines. -/
theorem countable_bfClasses_or_hasPerfectSet (φ : L.Sentenceω) {β : Ordinal.{0}}
    (hβ : β < Ordinal.omega 1) :
    Countable (Quotient (bfEquivSetoidOn ℕ φ β)) ∨ HasPerfectSetOfNonisoModelsOn ℕ φ := by
  sorry

/-- **Layer 3.** A sentence is thin on its models on `ℕ`: no perfect set of pairwise
non-isomorphic ones. -/
def IsThinOnNatModels (φ : L.Sentenceω) : Prop :=
  (isoSetoid L ℕ).IsThinOn (modelsOf φ)

/-- **Layer 3, the summit: Morley's theorem with a witness.** A sentence of `Lω₁ω` in a countable
relational language has at most `ℵ₁` countable models up to isomorphism, or a perfect set of
pairwise non-isomorphic countable models. No form of the continuum hypothesis is used. -/
theorem morley_countableModelCount_le_aleph_one_or_hasPerfectlyMany (φ : L.Sentenceω) :
    countableModelCount φ ≤ ℵ₁ ∨ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 3, Morley's theorem, cardinal form**: at most `ℵ₁` or exactly continuum many. -/
theorem morley_countableModelCount (φ : L.Sentenceω) :
    countableModelCount φ ≤ ℵ₁ ∨ countableModelCount φ = 𝔠 := by
  sorry

end Layer3

/-! ## Layer 4: scattered classes and thinness criteria

`BFScattered K` is Tau Ceti's `TauCeti.BFScattered`. -/

section Layer4

variable [L.IsRelational]

/-- **Layer 4 milestone.** A back-and-forth scattered set carries no Cantor antichain for
isomorphism: its range is analytic, so uniform back-and-forth separation finds one level
separating it. -/
theorem not_hasCantorAntichainOn_of_bfScattered {K : Set (RelationalConfiguration L ℕ)}
    (hK : BFScattered K) : ¬ (isoSetoid L ℕ).HasCantorAntichainOn K := by
  sorry

/-- **Layer 4 milestone.** For the models of a sentence, thin is the same as back-and-forth
scattered. Scattered implies thin by uniform separation; thin implies scattered by the one-level
Silver step of Layer 3. -/
theorem bfScattered_modelsOf_iff_isThinOnNatModels [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω) : BFScattered (modelsOf φ) ↔ IsThinOnNatModels φ := by
  sorry

/-- **Layer 4 milestone, counting a scattered class.** For any isolating rank and any
back-and-forth scattered set of codes, countably many isomorphism classes exactly when the rank
is bounded below `ω₁` on it. -/
theorem IsIsolatingRank.countable_isoClasses_iff_bounded
    {ρ : RelationalConfiguration L ℕ → Ordinal.{0}} (hρ : IsIsolatingRank ρ)
    {K : Set (RelationalConfiguration L ℕ)} (hK : BFScattered K) :
    (Quotient.mk (isoSetoid L ℕ) '' K).Countable ↔
      ∃ β < Ordinal.omega 1, ∀ c ∈ K, ρ c < β := by
  sorry

/-- **Layer 4 milestone.** Under the same hypotheses, uncountably many classes are exactly `ℵ₁`. -/
theorem IsIsolatingRank.mk_isoClasses_eq_aleph_one
    {ρ : RelationalConfiguration L ℕ → Ordinal.{0}} (hρ : IsIsolatingRank ρ)
    {K : Set (RelationalConfiguration L ℕ)} (hK : BFScattered K)
    (hunc : ¬ (Quotient.mk (isoSetoid L ℕ) '' K).Countable) :
    #(Quotient.mk (isoSetoid L ℕ) '' K) = ℵ₁ := by
  sorry

/-- **Layer 4.** A set of codes is concentrated at back-and-forth levels: at each level `β < ω₁`,
all but countably many of its isomorphism classes lie in the class of one centre `k`. -/
def ConcentratedAtBFLevels (C : Set (RelationalConfiguration L ℕ)) : Prop :=
  ∀ β < (Ordinal.omega 1 : Ordinal.{0}), ∃ k : RelationalConfiguration L ℕ,
    (Quotient.mk (isoSetoid L ℕ) '' {x | x ∈ C ∧ ¬ bfEquivSetoid L ℕ β x k}).Countable

theorem ConcentratedAtBFLevels.bfScattered {C : Set (RelationalConfiguration L ℕ)}
    (hC : ConcentratedAtBFLevels C) : BFScattered C := by
  sorry

/-- **Layer 4.** The truth sequence of a countable list of sentences at a code. -/
noncomputable def sentenceTheory (θ : ℕ → L.Sentenceω) (c : RelationalConfiguration L ℕ) :
    ℕ → Bool :=
  fun n => @decide (c ∈ (modelsOf (θ n) : Set (RelationalConfiguration L ℕ)))
    (Classical.propDecidable _)

/-- **Layer 4 milestone, the sentence-spectrum characterization.** A Borel set of codes carries
no perfect set of pairwise non-isomorphic codes exactly when every countable list of sentences
has countably many realized truth sequences on it. No isomorphism invariance is assumed. -/
theorem isThin_iff_countable_sentenceSpectra [Countable (Σ l, L.Relations l)]
    (C : Set (RelationalConfiguration L ℕ)) (hC : MeasurableSet C) :
    (isoSetoid L ℕ).IsThinOn C ↔ ∀ θ : ℕ → L.Sentenceω, (sentenceTheory θ '' C).Countable := by
  sorry

end Layer4

/-! ## Layer 4g: Morleyization transport

The Morleyization `L.morleyize Φ`, its inclusion `lhomMorleyize Φ`, the canonical expansion
`morleyExpansion Φ M` and `nonempty_morleyEquiv_iff` are Tau Ceti's
(`TauCeti/ModelTheory/ModelExistence/Morleyization.lean`). -/

section MorleyCode

variable {L : FirstOrder.Language.{u, v}} [L.IsRelational]
  (Φ : Set (Σ n, L.BoundedFormulaω Empty n))

/-- **Layer 4g, the expansion code.** The code of the canonical expansion of the decoded
structure: a base bit is copied (`morleyCode_inl`); the bit of the new symbol of `φ ∈ Φ` at a tuple
is the truth of `φ` there in the decoded structure (`morleyCode_inr_eq_true_iff`). -/
noncomputable def morleyCode (c : RelationalConfiguration L ℕ) :
    RelationalConfiguration (L.morleyize Φ) ℕ :=
  @RelationalConfiguration.ofStructure (L.morleyize Φ) ℕ (@morleyExpansion L Φ ℕ c.toStructure)

/-- **Layer 4g.** The base code of a code of the Morleyization: its bits at the base symbols, the
reduct along `lhomMorleyize Φ`. -/
def morleyBase (e : RelationalConfiguration (L.morleyize Φ) ℕ) : RelationalConfiguration L ℕ :=
  (lhomMorleyize Φ).reductConfiguration e

theorem morleyCode_inl (c : RelationalConfiguration L ℕ) {l : ℕ} (R : L.Relations l)
    (v : Fin l → ℕ) :
    (morleyCode Φ c).eval (atom (Sum.inl R : (L.morleyize Φ).Relations l) v) =
      c.eval (atom R v) := by
  rw [morleyCode,
    @RelationalConfiguration.eval_ofStructure _ _ (@morleyExpansion L Φ ℕ c.toStructure)]
  simp only [@morleyExpansion_relMap_inl L Φ ℕ c.toStructure,
    RelationalConfiguration.toStructure_relMap, Bool.decide_eq_true]

theorem morleyCode_inr_eq_true_iff (c : RelationalConfiguration L ℕ) {l : ℕ}
    (φ : {φ : L.BoundedFormulaω Empty l // ⟨l, φ⟩ ∈ Φ}) (v : Fin l → ℕ) :
    (morleyCode Φ c).eval (atom (Sum.inr φ : (L.morleyize Φ).Relations l) v) = true ↔
      (letI : L.Structure ℕ := c.toStructure; φ.1.Realize Empty.elim v) := by
  rw [morleyCode,
    @RelationalConfiguration.eval_ofStructure _ _ (@morleyExpansion L Φ ℕ c.toStructure)]
  simp only [decide_eq_true_eq]
  exact @morleyExpansion_relMap_morleyRel L Φ ℕ c.toStructure l φ.1 φ.2 v

theorem morleyBase_morleyCode (c : RelationalConfiguration L ℕ) :
    morleyBase Φ (morleyCode Φ c) = c := by
  ext a
  induction a using RelationalConfiguration.Atom.induction_atom with
  | h R v =>
    rw [morleyBase, LHom.eval_reductConfiguration, LHom.onAtom_atom, lhomMorleyize_onRelation,
      morleyCode_inl]

theorem morleyCode_injective : Function.Injective (morleyCode Φ) := fun c d h => by
  rw [← morleyBase_morleyCode Φ c, h, morleyBase_morleyCode]

/-- **Layer 4g, decoding agreement.** Decoding the expansion code gives the canonical expansion of
the decoded base structure. -/
theorem toStructure_morleyCode (c : RelationalConfiguration L ℕ) :
    (morleyCode Φ c).toStructure = @morleyExpansion L Φ ℕ c.toStructure :=
  RelationalConfiguration.toStructure_ofStructure _

/-- **Layer 4g.** The expansion code is a measurable embedding: Borel because satisfaction is
Borel in the code, injective by `morleyCode_injective`, hence an embedding by Lusin–Souslin. -/
theorem measurableEmbedding_morleyCode [Countable (Σ l, L.Relations l)] (hΦ : Φ.Countable) :
    MeasurableEmbedding (morleyCode Φ) := by
  sorry

/-- **Layer 4g.** Expansion codes are isomorphic exactly when the base codes are: by decoding
agreement, this is `nonempty_morleyEquiv_iff` for the decoded structures. -/
theorem isoSetoid_morleyCode_iff (c d : RelationalConfiguration L ℕ) :
    isoSetoid (L.morleyize Φ) ℕ (morleyCode Φ c) (morleyCode Φ d) ↔ isoSetoid L ℕ c d := by
  rw [RelationalConfiguration.isoSetoid_apply, RelationalConfiguration.isoSetoid_apply,
    toStructure_morleyCode, toStructure_morleyCode]
  exact @nonempty_morleyEquiv_iff L Φ ℕ ℕ c.toStructure d.toStructure

/-- **Layer 4g.** The range of the expansion code: the codes whose new bits agree with the truth of
their formulas in the decoded base code. -/
theorem range_morleyCode :
    Set.range (morleyCode Φ) =
      {e | ∀ (l : ℕ) (φ : {φ : L.BoundedFormulaω Empty l // ⟨l, φ⟩ ∈ Φ}) (v : Fin l → ℕ),
        e.eval (atom (Sum.inr φ : (L.morleyize Φ).Relations l) v) = true ↔
          (letI : L.Structure ℕ := (morleyBase Φ e).toStructure; φ.1.Realize Empty.elim v)} := by
  sorry

/-- **Layer 4g milestone, Morleyization transport.** A class of base codes carries a Cantor
antichain for isomorphism exactly when its image under the expansion code does. This is
`Setoid.hasCantorAntichainOn_image_iff` applied with `measurableEmbedding_morleyCode` and
`isoSetoid_morleyCode_iff`. -/
theorem hasCantorAntichainOn_image_morleyCode_iff [Countable (Σ l, L.Relations l)]
    (hΦ : Φ.Countable) (K : Set (RelationalConfiguration L ℕ)) :
    (isoSetoid (L.morleyize Φ) ℕ).HasCantorAntichainOn (morleyCode Φ '' K) ↔
      (isoSetoid L ℕ).HasCantorAntichainOn K := by
  sorry

end MorleyCode

/-! ## Layer 5: Vaught's conjecture, stated, and its reformulations -/

section Layer5

/-- **Layer 5.** The Vaught dichotomy for one sentence, in its perfect-set form: countably many
countable models, or a perfect set of pairwise non-isomorphic ones. -/
def HasVaughtDichotomy [L.IsRelational] (φ : L.Sentenceω) : Prop :=
  countableModelCount φ ≤ ℵ₀ ∨ HasPerfectlyManyCountableModels φ

/-- **Layer 5.** The cardinal form for one sentence: `≤ ℵ₀` or exactly continuum many. -/
def HasVaughtCount [L.IsRelational] (φ : L.Sentenceω) : Prop :=
  countableModelCount φ ≤ ℵ₀ ∨ countableModelCount φ = 𝔠

/-- **Layer 5, Vaught's conjecture** for `Lω₁ω`, perfect-set form: every sentence of a countable
relational language has countably many countable models or perfectly many. A statement, not a
target. It quantifies over `Language.{0, 0}` because a countable language can always be presented
in universe 0; the per-sentence predicates above are universe-polymorphic. -/
def VaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω), HasVaughtDichotomy φ

/-- **Layer 5.** The cardinal form of the conjecture. -/
def CardinalVaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω), HasVaughtCount φ

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
    (φ : L.Sentenceω) :
    ¬ HasVaughtDichotomy φ ↔
      countableModelCount φ = ℵ₁ ∧ ¬ HasPerfectlyManyCountableModels φ := by
  sorry

/-- **Layer 5 milestone, cardinal counterexamples.** A sentence fails the cardinal form exactly
when it has exactly `ℵ₁` countable models and `ℵ₁ < 𝔠`. -/
theorem not_hasVaughtCount_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω) :
    ¬ HasVaughtCount φ ↔ countableModelCount φ = ℵ₁ ∧ ℵ₁ < 𝔠 := by
  sorry

/-- **Layer 5 milestone, the infinite-model reduction.** Adding "the universe is infinite" removes
the finite tiers: the dichotomy then speaks of the models on `ℕ` alone. -/
theorem hasVaughtDichotomy_and_infiniteSentence_iff [L.IsRelational]
    [Countable (Σ l, L.Relations l)] (φ : L.Sentenceω) :
    HasVaughtDichotomy (φ ⊓ L.infiniteSentence) ↔
      Countable (Quotient (isoSetoidOn ℕ φ)) ∨ HasPerfectSetOfNonisoModelsOn ℕ φ := by
  sorry

/-- **Layer 5 milestone.** Vaught's conjecture holds exactly when every sentence whose models on
`ℕ` are back-and-forth scattered has countably many models on `ℕ`. -/
theorem vaughtConjecture_iff_bfScattered :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : L.Sentenceω), BFScattered (modelsOf φ) →
          Countable (Quotient (isoSetoidOn ℕ φ)) := by
  sorry

/-- **Layer 5 milestone.** Under `ℵ₁ < 𝔠`, and only so, the scattered reformulation is also
equivalent to the cardinal form. -/
theorem cardinalVaughtConjecture_iff_bfScattered (h : ℵ₁ < 𝔠) :
    CardinalVaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : L.Sentenceω), BFScattered (modelsOf φ) →
          Countable (Quotient (isoSetoidOn ℕ φ)) := by
  sorry

/-- **Layer 5 milestone, universes.** The conjecture over `Language.{0, 0}` is the conjecture over
countable relational languages in any universe, by `smallPresentationEquiv` and
`lift_countableModelCount_onBoundedFormulaInf`. -/
theorem vaughtConjecture_iff_forall_universe :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{u, v}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : L.Sentenceω), HasVaughtDichotomy φ := by
  sorry

/-- **Layer 5.** The codes on `ℕ` of models of a first-order theory. -/
def modelsOfTheory [L.IsRelational] (T : L.Theory) : Set (RelationalConfiguration L ℕ) :=
  {c | letI := c.toStructure; T.Model ℕ}

/-- **Layer 5, Vaught's original conjecture**: a complete first-order theory in a countable
relational language has countably many countably infinite models or perfectly many. Stated
separately from `VaughtConjecture`; only the implication below is claimed. -/
def FirstOrderVaughtConjecture : Prop :=
  ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (T : L.Theory), T.IsComplete →
      Countable (Quotient ((isoSetoid L ℕ).comap
        (Subtype.val : modelsOfTheory T → RelationalConfiguration L ℕ))) ∨
      (isoSetoid L ℕ).HasPerfectAntichainOn (modelsOfTheory T)

/-- **Layer 5 milestone.** The `Lω₁ω` conjecture implies the first-order one: a theory in a
countable language is countable, so it is one `Lω₁ω` sentence. -/
theorem VaughtConjecture.firstOrder (h : VaughtConjecture) : FirstOrderVaughtConjecture := by
  sorry

/-- **Layer 5.** A set of codes is minimally uncountable: it meets uncountably many isomorphism
classes, and every cut by a sentence has a side meeting only countably many. -/
def MinimallyUncountableOn [L.IsRelational] (K : Set (RelationalConfiguration L ℕ)) : Prop :=
  ¬ (Quotient.mk (isoSetoid L ℕ) '' K).Countable ∧
    ∀ θ : L.Sentenceω, (Quotient.mk (isoSetoid L ℕ) '' (K ∩ modelsOf θ)).Countable ∨
      (Quotient.mk (isoSetoid L ℕ) '' (K \ modelsOf θ)).Countable

/-- **Layer 5 milestone.** The models of a sentence are minimally uncountable exactly when they
are concentrated at back-and-forth levels and meet uncountably many isomorphism classes. -/
theorem minimallyUncountableOn_modelsOf_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (φ : L.Sentenceω) :
    MinimallyUncountableOn (modelsOf φ) ↔ ConcentratedAtBFLevels (modelsOf φ) ∧
      ¬ (Quotient.mk (isoSetoid L ℕ) ''
        (modelsOf φ : Set (RelationalConfiguration L ℕ))).Countable := by
  sorry

/-- **Layer 5 milestone.** A minimally uncountable sentence refutes Vaught's conjecture:
`φ ⊓ L.infiniteSentence` has the same models on `ℕ`, thin and uncountably many, and no finite
models. -/
theorem not_vaughtConjecture_of_minimallyUncountableOn {L : FirstOrder.Language.{0, 0}}
    [L.IsRelational] [Countable (Σ l, L.Relations l)] {φ : L.Sentenceω}
    (h : MinimallyUncountableOn (modelsOf φ)) : ¬ VaughtConjecture := by
  sorry

/-! ### Minimal counterexamples (Harnik–Makkai, Steel) -/

/-- **Layer 5 milestone, saturation.** The models of a sentence are a union of back-and-forth
classes from some countable level on (uniform back-and-forth separation applied to the Borel set
of pairs separating `modelsOf θ` from its complement). -/
theorem exists_bfLevel_saturated_modelsOf [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (θ : L.Sentenceω) :
    ∃ β₀ < (Ordinal.omega 1 : Ordinal.{0}), ∀ β, β₀ ≤ β → ∀ c d : RelationalConfiguration L ℕ,
      bfEquivSetoid L ℕ β c d →
        (c ∈ (modelsOf θ : Set (RelationalConfiguration L ℕ)) ↔
          d ∈ (modelsOf θ : Set (RelationalConfiguration L ℕ))) := by
  sorry

/-- **Layer 5.** The two forms of "countably many models on `ℕ`" agree: through the setoid
`isoSetoidOn ℕ φ` on the model class, and through the image of the model class in the quotient by
the ambient isomorphism relation. -/
theorem countable_quotient_isoSetoidOn_iff [L.IsRelational] (φ : L.Sentenceω) :
    Countable (Quotient (isoSetoidOn ℕ φ)) ↔
      (Quotient.mk (isoSetoid L ℕ) ''
        (modelsOf φ : Set (RelationalConfiguration L ℕ))).Countable := by
  sorry

/-- **Layer 5 milestone, the limit model.** A sequence of codes, consecutive ones back-and-forth
equivalent at `α i + ω` along a monotone sequence of levels, has a limit code back-and-forth
equivalent to the `i`-th at level `α i`. The offset `ω` suffices because extending a tuple of
length `n` costs `n` levels in the one-element convention of `BFEquiv` and the tuples of the
construction grow without bound; no countability of the levels is needed. -/
theorem exists_limit_of_bfEquiv_chain [L.IsRelational] (c : ℕ → RelationalConfiguration L ℕ)
    (α : ℕ → Ordinal.{0}) (hα : Monotone α)
    (hc : ∀ i, bfEquivSetoid L ℕ (α i + Ordinal.omega0) (c i) (c (i + 1))) :
    ∃ d : RelationalConfiguration L ℕ, ∀ i, bfEquivSetoid L ℕ (α i) d (c i) := by
  sorry

/-- **Layer 5 milestone, the Harnik–Makkai reduction.** A sentence with back-and-forth scattered
models on `ℕ` meeting uncountably many isomorphism classes has a minimally uncountable
strengthening. -/
theorem exists_minimallyUncountableOn_and_of_bfScattered [L.IsRelational]
    [Countable (Σ l, L.Relations l)] {Θ : L.Sentenceω} (hK : BFScattered (modelsOf Θ))
    (hunc : ¬ (Quotient.mk (isoSetoid L ℕ) ''
      (modelsOf Θ : Set (RelationalConfiguration L ℕ))).Countable) :
    ∃ θ : L.Sentenceω, MinimallyUncountableOn (modelsOf (Θ ⊓ θ)) := by
  sorry

/-- **Layer 5 milestone.** Vaught's conjecture holds exactly when there is no minimally
uncountable sentence. -/
theorem vaughtConjecture_iff_forall_not_minimallyUncountableOn :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (φ : L.Sentenceω), ¬ MinimallyUncountableOn (modelsOf φ) := by
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

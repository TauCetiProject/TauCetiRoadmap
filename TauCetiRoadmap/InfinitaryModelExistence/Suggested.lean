module

public import Mathlib
public import TauCeti.ModelTheory.Infinitary.Symbols
public import TauCeti.ModelTheory.Infinitary.Sublanguage
public import TauCeti.ModelTheory.Infinitary.SubstBounds
public import TauCeti.ModelTheory.Infinitary.SmallPresentation
public import TauCeti.ModelTheory.Infinitary.LanguageMap
public import TauCeti.ModelTheory.Infinitary.Satisfiability
public import TauCeti.ModelTheory.Infinitary.FormationClosed
public import TauCeti.ModelTheory.ModelExistence.AElementary
public import TauCeti.ModelTheory.ModelExistence.LowenheimSkolem
public import TauCeti.ModelTheory.ModelExistence.DirectedUnion
public import TauCeti.ModelTheory.ModelExistence.CountableModel
public import TauCeti.ModelTheory.ModelExistence.ModelExistence
public import TauCeti.ModelTheory.ModelExistence.Types
public import TauCeti.ModelTheory.ModelExistence.Isolation
public import TauCeti.ModelTheory.ModelExistence.Morleyization
public import TauCeti.ModelTheory.Infinitary.GraphTranslation.Relationalize
public import TauCeti.ModelTheory.Infinitary.GraphTranslation.BackTranslate
public import TauCeti.ModelTheory.Interpolation.PCClass
public import TauCeti.ModelTheory.WellOrdering

/-!
# Infinitary model existence, omitting types and interpolation: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, layer-by-layer build
(Layers 0–8), standing conventions, worked examples, and references are the specification. This
file is **not** the roadmap and is **not exhaustive**: it records suggested Lean `sorry`-forms
(allowed in this human-owned roadmap library) for *particular* milestones, so that contributors and
reviewers converge on names and signatures; discharging every statement here neither finishes a
layer nor the roadmap.

The interpolation and well-ordering theorems are stated for arbitrary languages; their relational
cores are proved first and transferred by the graph translation of Layer 6.

The infinitary syntax and semantics come from Tau Ceti's `TauCeti.ModelTheory.Infinitary.*`, and
so do the definitions of this roadmap that Tau Ceti implements (language maps, occurrence sets,
bound substitution, the small presentation, theories and entailment, fragments, `A`-elementarity,
consistency properties, types and isolation, Morleyization, the graph translation, projective
classes and chains): they are used here under their Tau Ceti names. A target that Tau Ceti proves
keeps its statement here and is proved by the Tau Ceti theorem, named in its docstring; every other
target is a `sorry`. Every definition below has an actual mathematical body; where a construction
is specified in `README.md` but too long to prototype (the first-order Morley theory, the
inseparability consistency property), the milestone is stated as an existence theorem or a
property of the construction, never as a placeholder proposition. Names and namespaces are
provisional.
-/

@[expose] public section

universe u v u' v' u₁ v₁ u₂ v₂ w w' uι

namespace TauCetiRoadmap.InfinitaryModelExistence

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure

/-! ## Layer 0: the signature calculus -/

section Signature

variable {L : FirstOrder.Language.{u, v}} {L' : FirstOrder.Language.{u', v'}}
variable {ι : Type uι} {α : Type*}

/-- **Layer 0 milestone, realization along an expansion**, the infinitary form of Mathlib's
`LHom.realize_onBoundedFormula`, for Tau Ceti's `LHom.onBoundedFormulaInf`. Proved in Tau Ceti as
`LHom.realize_onBoundedFormulaInf`. -/
theorem realize_onBoundedFormulaInf (g : L →ᴸ L') {M : Type w} [L.Structure M]
    [L'.Structure M] [g.IsExpansionOn M] {n : ℕ} (φ : L.BoundedFormulaInf ι α n)
    (v : α → M) (xs : Fin n → M) :
    (g.onBoundedFormulaInf φ).Realize v xs ↔ φ.Realize v xs :=
  g.realize_onBoundedFormulaInf φ v xs

/-- **Layer 0 milestone.** A formula at a countable carrier mentions countably many relation
symbols (the function-symbol twin is the same statement with `functionsIn`). Proved in Tau Ceti as
`BoundedFormulaInf.relationsIn_countable`. -/
theorem relationsIn_countable [Countable ι] {n : ℕ} (φ : L.BoundedFormulaInf ι α n) :
    φ.relationsIn.Countable :=
  BoundedFormulaInf.relationsIn_countable φ

/-- **Layer 0 milestone, symbol locality.** Two structures on one carrier that agree on the
symbols occurring in `φ` give `φ` the same truth value. This is what lets a sentence be moved to
the countable sublanguage of its own symbols and back. Proved in Tau Ceti as
`BoundedFormulaInf.realize_congr_of_agreeOn`. -/
theorem realize_congr_of_agreeOn {M : Type w} (S₁ S₂ : L.Structure M) {n : ℕ}
    (φ : L.BoundedFormulaInf ι α n)
    (hf : ∀ p ∈ φ.functionsIn, ∀ x : Fin p.1 → M,
      S₁.funMap p.2 x = S₂.funMap p.2 x)
    (hr : ∀ p ∈ φ.relationsIn, ∀ x : Fin p.1 → M,
      (S₁.RelMap p.2 x ↔ S₂.RelMap p.2 x))
    (v : α → M) (xs : Fin n → M) :
    @BoundedFormulaInf.Realize L ι α M S₁ n φ v xs ↔
      @BoundedFormulaInf.Realize L ι α M S₂ n φ v xs :=
  BoundedFormulaInf.realize_congr_of_agreeOn φ S₁ S₂ (fun _ hf' x => hf _ hf' x)
    (fun _ hr' x => hr _ hr' x) v xs

/-- **Layer 0 milestone, pulling a formula back along a language map.** A formula of `L'` whose
occurring symbols all lie in the range of `g` is the image of a formula of `L`. No injectivity is
needed: choose a preimage for each occurring symbol. Proved in Tau Ceti as
`LHom.exists_eq_onBoundedFormulaInf_of_subset_range`. -/
theorem exists_eq_onBoundedFormulaInf_of_subset_range (g : L →ᴸ L') {n : ℕ}
    (φ : L'.BoundedFormulaInf ι α n)
    (hf : φ.functionsIn ⊆ Set.range fun p : Σ k, L.Functions k =>
      (⟨p.1, g.onFunction p.2⟩ : Σ k, L'.Functions k))
    (hr : φ.relationsIn ⊆ Set.range fun p : Σ k, L.Relations k =>
      (⟨p.1, g.onRelation p.2⟩ : Σ k, L'.Relations k)) :
    ∃ ψ : L.BoundedFormulaInf ι α n, g.onBoundedFormulaInf ψ = φ :=
  g.exists_eq_onBoundedFormulaInf_of_subset_range φ hf hr

/-- **Layer 0 milestone, realization of a bound substitution** (Tau Ceti's
`BoundedFormulaInf.substBounds`). Proved in Tau Ceti as `BoundedFormulaInf.realize_substBounds`. -/
theorem realize_substBounds {M : Type w} [L.Structure M] {m k : ℕ}
    (σ : Fin m → L.Term (α ⊕ Fin k)) (φ : L.BoundedFormulaInf ι α m) (v : α → M)
    (xs : Fin k → M) :
    (BoundedFormulaInf.substBounds σ φ).Realize v xs ↔
      φ.Realize v fun i => (σ i).realize (Sum.elim v xs) :=
  BoundedFormulaInf.realize_substBounds σ φ v xs

/-- **Layer 0 milestone, language maps commute with bound substitution.** Proved in Tau Ceti as
`LHom.onBoundedFormulaInf_substBounds`. -/
theorem onBoundedFormulaInf_substBounds (g : L →ᴸ L')
    {m k : ℕ} (σ : Fin m → L.Term (α ⊕ Fin k)) (φ : L.BoundedFormulaInf ι α m) :
    g.onBoundedFormulaInf (BoundedFormulaInf.substBounds σ φ) =
      BoundedFormulaInf.substBounds (fun i => g.onTerm (σ i)) (g.onBoundedFormulaInf φ) :=
  g.onBoundedFormulaInf_substBounds σ φ

/-- **Layer 0 milestone, realization transport** to the small presentation
(`Language.smallPresentation`): an `L`-structure reinterpreted along the inverse map realizes the
transported formula exactly when it realizes the original. Proved in Tau Ceti as
`Language.realize_smallPresentation`. -/
theorem realize_smallPresentation [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] {M : Type w} [L.Structure M] {n : ℕ}
    (φ : L.BoundedFormulaInf ι α n) (v : α → M) (xs : Fin n → M) :
    @BoundedFormulaInf.Realize L.smallPresentation ι α M
        (L.smallPresentationEquiv.invLHom.reduct M) n
        (L.smallPresentationEquiv.toLHom.onBoundedFormulaInf φ) v xs ↔
      φ.Realize v xs :=
  L.realize_smallPresentation φ v xs

end Signature

/-! ## Layer 1: theories, entailment and fragments -/

section Theories

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 1 milestone**, Mathlib's `models_iff_not_satisfiable` for `Lω₁ω`. Proved in Tau Ceti
as `Theoryω.entails_iff_not_isSatisfiable`. -/
theorem Theoryω.entails_iff_not_isSatisfiable (T : L.Theoryω) (φ : L.Sentenceω) :
    T.Entails φ ↔ ¬ (insert φ.not T).IsSatisfiable :=
  FirstOrder.Language.Theoryω.entails_iff_not_isSatisfiable

/-- **Layer 1 milestone.** A countable set generates a countable fragment: every member is
reached by a finite path of component steps, each indexed by a natural number. No countability of
the language is needed. Proved in Tau Ceti as `Fragment.generated_countable`. -/
theorem Fragment.generated_countable {S : Set (Σ n, L.BoundedFormulaω Empty n)}
    (hS : S.Countable) : (Fragment.generated S).toSet.Countable :=
  FirstOrder.Language.Fragment.generated_countable hS

end Theories

/-! ## Layer 2: fragment elementarity and downward Löwenheim–Skolem -/

section LowenheimSkolem

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 2 milestone, downward Löwenheim–Skolem with the honest bound.** Every subset `X` of
`M` lies in an `A`-elementary substructure of cardinality at most
`max ℵ₀ |X| |A| |Σ n, L.Functions n|`. Function symbols enter separately because a fragment need
not contain an atomic formula mentioning them. Proved in Tau Ceti as
`exists_aElementary_substructure` (the same bound, bracketed `max ℵ₀ (max |X| (max |A| |Σ|))`). -/
theorem exists_aElementary_substructure (A : L.Fragment) {M : Type w} [L.Structure M]
    (X : Set M) :
    ∃ N : L.Substructure M, X ⊆ N ∧ AElementary A N.subtype ∧
      Cardinal.lift.{max u v} (Cardinal.mk N) ≤
        max (max Cardinal.aleph0 (Cardinal.lift.{max u v} (Cardinal.mk X)))
          (max (Cardinal.lift.{w} (Cardinal.mk A.toSet))
            (Cardinal.lift.{max v w} (Cardinal.mk (Σ n, L.Functions n)))) := by
  obtain ⟨N, hXN, hN, hcard⟩ := FirstOrder.Language.exists_aElementary_substructure A X
  exact ⟨N, hXN, hN, by rwa [max_assoc]⟩

/-- **Layer 2 milestone, the countable case** consumed by the sibling roadmaps. Proved in Tau Ceti
as `exists_countable_aElementary_substructure`. -/
theorem exists_countable_aElementary_substructure [Countable (Σ n, L.Functions n)]
    (A : L.Fragment) (hA : A.toSet.Countable) {M : Type w} [L.Structure M] {X : Set M}
    (hX : X.Countable) :
    ∃ N : L.Substructure M, X ⊆ N ∧ AElementary A N.subtype ∧ Countable N :=
  FirstOrder.Language.exists_countable_aElementary_substructure A hA hX

/-- **Layer 2 milestone, directed unions in one ambient structure.** Proved in Tau Ceti as
`aElementary_iSup`. -/
theorem aElementary_iSup (A : L.Fragment) {M : Type w} [L.Structure M] {ι : Type*} [Nonempty ι]
    (S : ι → L.Substructure M) (hdir : Directed (· ≤ ·) S)
    (hS : ∀ i, AElementary A (S i).subtype) : AElementary A (⨆ i, S i).subtype :=
  FirstOrder.Language.aElementary_iSup hdir hS

/-- **Layer 2 milestone, sentence-level Löwenheim–Skolem.** A satisfiable countable theory has a
countable nonempty model in every universe. The proof passes to the countable sublanguage of the
occurring symbols, takes a countable `A`-elementary substructure there, and expands back. Proved
in Tau Ceti as `Theoryω.exists_countable_model`. -/
theorem Theoryω.exists_countable_model {T : L.Theoryω} (hT : T.Countable)
    (hsat : T.IsSatisfiable) :
    ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ Countable M ∧ T.Model M := by
  obtain ⟨M, _, hc, hn, hM⟩ := FirstOrder.Language.Theoryω.exists_countable_model.{u, v, w} hT hsat
  exact ⟨M, _, hn, hc, hM⟩

/-- **Layer 2 milestone, universe invariance of entailment** for countable theories: entailment
can be tested on countable models in any universe. Proved in Tau Ceti as
`Theoryω.entails_iff_countable`. -/
theorem Theoryω.entails_iff_countable {T : L.Theoryω} (hT : T.Countable) (φ : L.Sentenceω) :
    T.Entails φ ↔ ∀ (M : Type w) [L.Structure M] [Nonempty M] [Countable M],
      T.Model M → SentenceInf.Realize φ M := by
  rw [FirstOrder.Language.Theoryω.entails_iff_countable.{u, v, w} hT]
  exact ⟨fun h M _ _ _ => h M, fun h M _ _ _ => h M⟩

/-- **Layer 2 milestone, entailment in arbitrary models.** For a countable theory, entailment gives
the conclusion in every nonempty model, of any cardinality and in any universe. Proved in Tau Ceti
as `Theoryω.Entails.realize`. -/
theorem Theoryω.Entails.realize {T : L.Theoryω} (hT : T.Countable) {φ : L.Sentenceω}
    (h : T.Entails φ) (M : Type w) [L.Structure M] [Nonempty M] (hM : T.Model M) :
    SentenceInf.Realize φ M :=
  FirstOrder.Language.Theoryω.Entails.realize hT h M hM

end LowenheimSkolem

/-! ## Layer 3: consistency properties and model existence -/

section ModelExistence

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 3 milestone, the model existence theorem** for Tau Ceti's `ConsistencyProperty`. A
countable member of a consistency property has a countable model, in any universe, every element
of which names a Henkin constant. The proof is a fair enumeration through the countable closure of
`s` under the decomposition targets, followed by the closed-term quotient and a two-polarity truth
lemma; the limit set is never claimed to be a member. Proved in Tau Ceti as
`ConsistencyProperty.model_existence`, which also gives `Nonempty M`. -/
theorem model_existence [Countable (Σ n, L.Functions n)] [Countable (Σ n, L.Relations n)]
    (C : ConsistencyProperty L) {s : L[[ℕ]].Theoryω} (hs : s ∈ C.sets)
    (hsc : s.Countable) :
    ∃ (M : Type w) (_ : L[[ℕ]].Structure M), Countable M ∧ s.Model M ∧
      ∀ m : M, ∃ c : ℕ, (L.con c : M) = m := by
  obtain ⟨M, _, hc, -, hM, hsurj⟩ := C.model_existence.{u, v, w} hs hsc
  exact ⟨M, _, hc, hM, hsurj⟩

/-- **Layer 3 milestone, model existence with omission requests.** If, for each partial type `p`
of a countable family and every tuple of Henkin constants, some formula of `p` can be refuted at
that tuple consistently with any member, the countable named model also omits every `p`. With `P`
empty this is `model_existence`; Layer 4 derives the omitting types theorem from it. Proved in Tau
Ceti as `ConsistencyProperty.model_existence_omitting`, for a countable indexed family of types. -/
theorem model_existence_omitting [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] (C : ConsistencyProperty L)
    (P : Set (Σ n, Set (L[[ℕ]].BoundedFormulaω Empty n))) (hP : P.Countable)
    (hPc : ∀ p ∈ P, p.2.Countable)
    (hreq : ∀ p ∈ P, ∀ s ∈ C.sets, ∀ c : Fin p.1 → ℕ, ∃ ψ ∈ p.2,
      insert (BoundedFormulaInf.substBounds (fun i => (L.con (c i)).term) ψ).not s ∈ C.sets)
    {s : L[[ℕ]].Theoryω} (hs : s ∈ C.sets) (hsc : s.Countable) :
    ∃ (M : Type w) (_ : L[[ℕ]].Structure M), Countable M ∧ s.Model M ∧
      (∀ m : M, ∃ c : ℕ, (L.con c : M) = m) ∧ ∀ p ∈ P, OmitsType M p.2 := by
  have := hP.to_subtype
  obtain ⟨M, _, hc, -, hM, hsurj, homit⟩ :=
    C.model_existence_omitting.{u, v, w} (ι := P) (n := fun p => p.1.1) (fun p => p.1.2)
      (fun p => hPc p.1 p.2) (fun p => hreq p.1 p.2) hs hsc
  exact ⟨M, _, hc, hM, hsurj, fun p hp => homit ⟨p, hp⟩⟩

end ModelExistence

/-! ## Layer 4: types and omitting types -/

section Types

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 4 milestone, realized-type isolators** for Tau Ceti's `infinitaryType` and
`realizedTypes`. If `M` realizes countably many complete `n`-types, each realized type is isolated
among the realized ones by a single formula: a countable conjunction of separators, one for each
other realized type. No smallness predicate, fragment or relational hypothesis is involved. Proved
in Tau Ceti as `exists_isolatingFormula`. -/
theorem exists_isolatingFormula {M : Type w} [L.Structure M] {n : ℕ}
    (h : (realizedTypes (L := L) M n).Countable) (a : Fin n → M) :
    ∃ χ : L.BoundedFormulaω Empty n, ∀ b : Fin n → M,
      χ.Realize Empty.elim b ↔ infinitaryType (L := L) M b = infinitaryType M a :=
  FirstOrder.Language.exists_isolatingFormula h a

/-- **Layer 4, the type of a tuple relative to a fragment.** -/
def fragmentType (A : L.Fragment) (M : Type w) [L.Structure M] {n : ℕ} (a : Fin n → M) :
    Set (L.BoundedFormulaω Empty n) :=
  {φ | (⟨n, φ⟩ : Σ n, L.BoundedFormulaω Empty n) ∈ A.toSet ∧ φ.Realize Empty.elim a}

/-- **Layer 4 milestone.** `A`-elementary embeddings preserve `A`-types. -/
theorem AElementary.fragmentType_comp {A : L.Fragment} {N : Type w} {M : Type w'}
    [L.Structure N] [L.Structure M] {f : N ↪[L] M} (hf : AElementary A f) {n : ℕ}
    (a : Fin n → N) : fragmentType A M (f ∘ a) = fragmentType A N a := by
  sorry

/-- **Layer 4 milestone, the omitting types theorem for countable fragments**, with isolation in
the sense of Tau Ceti's `Theoryω.IsolatesIn`. -/
theorem Theoryω.exists_countable_model_omitting (A : L.Fragment) (hA : A.FormationClosed)
    (hAc : A.toSet.Countable) (T : L.Theoryω)
    (hTA : ∀ φ ∈ T, (⟨0, φ⟩ : Σ n, L.BoundedFormulaω Empty n) ∈ A.toSet)
    (hsat : T.IsSatisfiable) (P : Set (Σ n, Set (L.BoundedFormulaω Empty n))) (hP : P.Countable)
    (hPA : ∀ p ∈ P, ∀ ψ ∈ p.2, (⟨p.1, ψ⟩ : Σ n, L.BoundedFormulaω Empty n) ∈ A.toSet)
    (hiso : ∀ p ∈ P, ¬ T.IsolatesIn A p.2) :
    ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ Countable M ∧ T.Model M ∧
      ∀ p ∈ P, OmitsType M p.2 := by
  sorry

/-- Omission of a first-order partial type, with tuples in bound positions. -/
def OmitsFOType {L : FirstOrder.Language.{u, v}} (M : Type w) [L.Structure M] {n : ℕ}
    (p : Set (L.BoundedFormula Empty n)) : Prop :=
  ∀ a : Fin n → M, ∃ ψ ∈ p, ¬ ψ.Realize Empty.elim a

/-- **Layer 4, first-order isolation**: some first-order formula `φ`, consistent with `T`,
implies every formula of `p` modulo `T`. -/
def IsolatesFO (T : L.Theory) {n : ℕ} (p : Set (L.BoundedFormula Empty n)) : Prop :=
  ∃ φ : L.BoundedFormula Empty n, (insert φ.exs T).IsSatisfiable ∧ ∀ ψ ∈ p, T ⊨ᵇ φ.imp ψ

/-- **Layer 4 corollary, the first-order omitting types theorem.** For a countable language, a
satisfiable first-order theory and countably many first-order partial types, none isolated over
the theory, some countable nonempty model omits them all, in any universe. The hypothesis is
necessary: the empty type is isolated by `⊤` and realized by every tuple. -/
theorem exists_countable_model_omitting_fo [Countable (Σ l, L.Functions l)]
    [Countable (Σ l, L.Relations l)] (T : L.Theory) (hsat : T.IsSatisfiable)
    (P : Set (Σ n, Set (L.BoundedFormula Empty n))) (hP : P.Countable)
    (hiso : ∀ p ∈ P, ¬ IsolatesFO T p.2) :
    ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ Countable M ∧ M ⊨ T ∧
      ∀ p ∈ P, OmitsFOType M p.2 := by
  sorry

end Types

/-! ## Layer 5: Morleyization -/

section Morleyization

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 5.** Morleyizing (Tau Ceti's `morleyize`) by a countable family keeps the relation
symbols countable. Proved in Tau Ceti as `countable_relations_morleyize`. -/
theorem countable_relations_morleyize [Countable (Σ n, L.Relations n)]
    {Φ : Set (Σ n, L.BoundedFormulaω Empty n)} (hΦ : Φ.Countable) :
    Countable (Σ n, (morleyize L Φ).Relations n) :=
  FirstOrder.Language.countable_relations_morleyize hΦ

/-- **Layer 5.** The canonical expansion `morleyExpansion` is an expansion along `lhomMorleyize`.
Tau Ceti's instance `isExpansionOn_morleyExpansion`. -/
theorem isExpansionOn_morleyExpansion (Φ : Set (Σ n, L.BoundedFormulaω Empty n)) (M : Type w)
    [L.Structure M] :
    @LHom.IsExpansionOn L (morleyize L Φ) (lhomMorleyize Φ) M _ (morleyExpansion Φ M) :=
  FirstOrder.Language.isExpansionOn_morleyExpansion

/-- **Layer 5 milestone.** Isomorphisms of `L`-structures lift to isomorphisms of the canonical
expansions and restrict back. Proved in Tau Ceti as `nonempty_morleyEquiv_iff`. -/
theorem nonempty_morleyEquiv_iff (Φ : Set (Σ n, L.BoundedFormulaω Empty n)) {M : Type w}
    {N : Type w'} [L.Structure M] [L.Structure N] :
    Nonempty (@Language.Equiv (morleyize L Φ) M N (morleyExpansion Φ M) (morleyExpansion Φ N)) ↔
      Nonempty (M ≃[L] N) :=
  FirstOrder.Language.nonempty_morleyEquiv_iff Φ

/-- **Layer 5 milestone, the first-order presentation of a countable fragment** (Marker 2016,
Chapter 1). There is a first-order theory of the Morleyization, countable when `A` is (no
countability of the language is needed), and a countable family of first-order partial types, such
that an expansion of an `L`-structure models the theory and omits the types exactly when it is the
canonical expansion.
`README.md` Layer 5 specifies the axioms and the types explicitly. -/
theorem exists_firstOrder_presentation (A : L.Fragment) (hA : A.toSet.Countable) :
    ∃ (T : (morleyize L A.toSet).Theory)
      (Γ : Set (Σ n, Set ((morleyize L A.toSet).BoundedFormula Empty n))),
      T.Countable ∧ Γ.Countable ∧
      ∀ (M : Type w) [L.Structure M] (S : (morleyize L A.toSet).Structure M),
        @LHom.IsExpansionOn L (morleyize L A.toSet) (lhomMorleyize A.toSet) M _ S →
          ((@Theory.Model (morleyize L A.toSet) M S T ∧
              ∀ p ∈ Γ, @OmitsFOType (morleyize L A.toSet) M S p.1 p.2) ↔
            S = morleyExpansion A.toSet M) := by
  sorry

end Morleyization

/-! ## Layer 6: the graph translation (a proof device for Layers 7 and 8) -/

section GraphTranslation

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 6 milestone, the shared-vocabulary identity** for Tau Ceti's `relSym` in
`graphLanguage L`. Proved in Tau Ceti as `relSym_inter`. -/
theorem relSym_inter (F₁ F₂ : Set (Σ n, L.Functions n)) (R₁ R₂ : Set (Σ n, L.Relations n)) :
    relSym F₁ R₁ ∩ relSym F₂ R₂ = relSym (F₁ ∩ F₂) (R₁ ∩ R₂) :=
  FirstOrder.Language.relSym_inter F₁ F₂ R₁ R₂

/-- **Layer 6, formula translation** (stated as the existence of a translation with the
specified properties; `README.md` Layer 6 gives the term-flattening construction): over the graph
expansion it is realized exactly when the original is, and its relation symbols are exactly the
relationalization of the original's symbols. Proved by Tau Ceti's `BoundedFormulaInf.relationalize`,
with `realize_relationalize` and `relationsIn_relationalize`. -/
theorem exists_relationalize {α : Type*} :
    ∃ τ : (n : ℕ) → L.BoundedFormulaω α n → L.graphLanguage.BoundedFormulaω α n,
      (∀ (M : Type w) [L.Structure M] {n : ℕ} (φ : L.BoundedFormulaω α n) (v : α → M)
          (xs : Fin n → M),
          @BoundedFormulaInf.Realize L.graphLanguage ℕ α M (graphExpansion L M) n (τ n φ) v xs ↔
            φ.Realize v xs) ∧
      ∀ {n : ℕ} (φ : L.BoundedFormulaω α n),
        (τ n φ).relationsIn = relSym φ.functionsIn φ.relationsIn :=
  ⟨fun _ φ => φ.relationalize, fun _ _ _ φ v xs => φ.realize_relationalize v xs,
    fun φ => φ.relationsIn_relationalize⟩

/-- **Layer 6 milestone, back-translation semantics** for Tau Ceti's
`BoundedFormulaInf.backTranslate`, over the graph expansion of any `L`-structure. Proved in Tau
Ceti as `BoundedFormulaInf.realize_backTranslate`, at every carrier. -/
theorem realize_backTranslate {α : Type*} {M : Type w} [L.Structure M] {n : ℕ}
    (θ : L.graphLanguage.BoundedFormulaω α n) (v : α → M) (xs : Fin n → M) :
    θ.backTranslate.Realize v xs ↔
      @BoundedFormulaInf.Realize L.graphLanguage ℕ α M (graphExpansion L M) n θ v xs :=
  θ.realize_backTranslate v xs

end GraphTranslation

/-! ## Layer 7: projective classes and interpolation -/

section Interpolation

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 7 milestone, the relational core of Craig interpolation**, for relational languages
of any cardinality. -/
theorem craig_interpolation_relational [L.IsRelational] (φ ψ : L.Sentenceω)
    (h : Sentenceω.Entails φ ψ) :
    ∃ θ : L.Sentenceω, θ.relationsIn ⊆ φ.relationsIn ∩ ψ.relationsIn ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7 milestone, Craig interpolation** for an arbitrary language, with no hypothesis on
`L`: the relational core transferred by the graph translation of Layer 6. -/
theorem craig_interpolation (φ ψ : L.Sentenceω) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : L.Sentenceω, θ.functionsIn ⊆ φ.functionsIn ∩ ψ.functionsIn ∧
      θ.relationsIn ⊆ φ.relationsIn ∩ ψ.relationsIn ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7 milestone, PC separation**, for Tau Ceti's projective-class membership
`LHom.PCMem`. Two projective classes, given by new symbols `L₁` and `L₂`, with no common countable
nonempty member, are separated by a single `L`-sentence on nonempty structures of every universe.
Only countable members are excluded because a common member would give a countable one
(Layer 2); the proof is Craig interpolation for the two sentences with their new symbols renamed
apart. No language is assumed relational or countable. For a countable relational language, on the
space of structures with carrier `ℕ`, it plays the role of Lusin separation. -/
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

/-- **Layer 7, signed relation occurrences**: an antecedent flips the sign; quantifiers and the
countable connectives preserve it; equality contributes to neither sign. -/
def relationsInSigned {ι : Type uι} {α : Type*} :
    {n : ℕ} → Bool → L.BoundedFormulaInf ι α n → Set (Σ n, L.Relations n)
  | _, _, .falsum => ∅
  | _, _, .equal _ _ => ∅
  | _, s, .rel R _ => if s then {⟨_, R⟩} else ∅
  | _, s, .imp φ ψ => relationsInSigned (!s) φ ∪ relationsInSigned s ψ
  | _, s, .all φ => relationsInSigned s φ
  | _, s, .iSup φs => ⋃ i, relationsInSigned s (φs i)
  | _, s, .iInf φs => ⋃ i, relationsInSigned s (φs i)

/-- **Layer 7 milestone, Lyndon interpolation**, in the relation-polarity form with logical
equality, for an arbitrary language (the relational core `lyndon_interpolation_relational` is the
same statement under `[L.IsRelational]`, without the function-symbol bound). -/
theorem lyndon_interpolation (φ ψ : L.Sentenceω) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : L.Sentenceω, θ.functionsIn ⊆ φ.functionsIn ∩ ψ.functionsIn ∧
      relationsInSigned true θ ⊆ relationsInSigned true φ ∩ relationsInSigned true ψ ∧
      relationsInSigned false θ ⊆ relationsInSigned false φ ∩ relationsInSigned false ψ ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7, the universal class** (`s = true`) and the existential class (`s = false`):
atomic formulas lie in both, an antecedent flips the class, countable connectives preserve it and
are not counted as quantifiers, and `∀` is universal only. -/
def universalSigned {ι : Type uι} {α : Type*} :
    {n : ℕ} → Bool → L.BoundedFormulaInf ι α n → Prop
  | _, _, .falsum => True
  | _, _, .equal _ _ => True
  | _, _, .rel _ _ => True
  | _, s, .imp φ ψ => universalSigned (!s) φ ∧ universalSigned s ψ
  | _, s, .all φ => s = true ∧ universalSigned s φ
  | _, s, .iSup φs => ∀ i, universalSigned s (φs i)
  | _, s, .iInf φs => ∀ i, universalSigned s (φs i)

/-- **Layer 7 milestone, Malitz interpolation**: a universal consequent has a universal
interpolant, in the function-free formulation (Harrison-Trainor–Kretschmer, Theorem 4.5): the
graph translation of Layer 6 does not preserve the universal syntax this theorem needs. -/
theorem malitz_interpolation [L.IsRelational] (φ ψ : L.Sentenceω)
    (hψ : universalSigned true ψ) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : L.Sentenceω, universalSigned true θ ∧
      θ.relationsIn ⊆ φ.relationsIn ∩ ψ.relationsIn ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

end Interpolation

/-! ## Layer 8: well-ordering -/

section WellOrdering

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 8 milestone, Marker's boundedness theorem** in the raw positive form, for an arbitrary
language, under Tau Ceti's `Sentenceω.HasWellOrderedChains`: a countable nonempty model of `φ`
with an `lt`-preserving map from `ℚ` (Tau Ceti's `RelChain`). Proved in Tau Ceti as
`Sentenceω.exists_model_relChain_rat`. -/
theorem exists_model_relChain_rat (φ : L.Sentenceω) (lt : L.Relations 2)
    (h : Sentenceω.HasWellOrderedChains.{u, v, w} φ lt) :
    ∃ (M : Type w') (_ : L.Structure M), Nonempty M ∧ Countable M ∧ SentenceInf.Realize φ M ∧
      ∃ f : ℚ → M, RelChain lt f :=
  Sentenceω.exists_model_relChain_rat.{u, v, w, w'} h

/-- **Layer 8 milestone, boundedness of order types**: well-ordered models have uniformly
bounded countable order type. Proved in Tau Ceti as `Sentenceω.wellOrder_type_boundedness`. -/
theorem wellOrder_type_boundedness (φ : L.Sentenceω) (lt : L.Relations 2)
    (hwo : ∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M →
      IsWellOrder M fun x y : M => RelMap lt ![x, y]) :
    ∃ α : Ordinal.{w}, α < Ordinal.omega 1 ∧
      ∀ (M : Type w) (inst : L.Structure M) (h : SentenceInf.Realize φ M),
        @Ordinal.type M (fun x y => RelMap lt ![x, y]) (hwo M inst h) < α :=
  Sentenceω.wellOrder_type_boundedness hwo

/-- **Layer 8 milestone, undefinability of well-ordering.** Proved in Tau Ceti as
`wellOrdering_undefinable`. -/
theorem wellOrdering_undefinable (lt : L.Relations 2) :
    ¬ ∃ φ : L.Sentenceω, ∀ (M : Type w) (_ : L.Structure M),
      (SentenceInf.Realize φ M ↔ IsWellOrder M fun x y : M => RelMap lt ![x, y]) :=
  FirstOrder.Language.wellOrdering_undefinable lt

end WellOrdering

end TauCetiRoadmap.InfinitaryModelExistence

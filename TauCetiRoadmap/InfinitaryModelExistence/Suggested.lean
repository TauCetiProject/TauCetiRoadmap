module

public import Mathlib
public import TauCeti.ModelTheory.Infinitary.Symbols
public import TauCeti.ModelTheory.Infinitary.FormationClosed
public import TauCeti.ModelTheory.ModelExistence.AElementary
public import TauCeti.ModelTheory.ModelExistence.ModelExistence
public import TauCeti.ModelTheory.ModelExistence.Isolation
public import TauCeti.ModelTheory.ModelExistence.Morleyization
public import TauCeti.ModelTheory.Interpolation.PCClass

/-!
# Infinitary model existence, omitting types and interpolation: target signatures

**`README.md` is the definitive roadmap document** — its narrative plan, layer-by-layer build
(Layers 0–8), standing conventions, worked examples, and references are the specification. This
file is **not** the roadmap and is **not exhaustive**: it records suggested Lean `sorry`-forms
(allowed in this human-owned roadmap library) for *particular* milestones, so that contributors and
reviewers converge on names and signatures; discharging every statement here neither finishes a
layer nor the roadmap.

The interpolation theorems are stated for arbitrary languages; their relational cores are proved
first and transferred by the graph translation of Layer 6.

The infinitary syntax and semantics come from Tau Ceti's `TauCeti.ModelTheory.Infinitary.*`, and
so do the definitions of this roadmap that Tau Ceti implements at this repository's pin (language
maps, occurrence sets, bound substitution, theories and entailment, fragments, `A`-elementarity,
consistency properties, types and isolation, Morleyization, the graph translation and projective
classes): they are used here under their Tau Ceti names. The theorems Tau Ceti proves at the pin,
among them model existence and the theorems of Layers 6 and 8, are not restated here; the
"Tau Ceti implementation" table of `README.md` names each with its Tau Ceti declaration. This file
states the targets the pin lacks, and one adapter, `model_existence_omitting`, which takes the
omitted types as a countable set of tagged types, the indexing of the omitting types theorem of
Layer 4, where Tau Ceti takes a countable indexed family. Every definition below has an actual
mathematical body; where a construction is specified in `README.md` but too long to prototype (the
first-order Morley theory, the inseparability consistency property), the milestone is stated as an
existence theorem or a property of the construction, never as a placeholder proposition. Names and
namespaces are provisional.
-/

@[expose] public section

universe u v u₁ v₁ u₂ v₂ w w' uι

namespace TauCetiRoadmap.InfinitaryModelExistence

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure

/-! ## Layer 3: consistency properties and model existence -/

section ModelExistence

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 3 milestone, model existence with omission requests.** If, for each partial type `p`
of a countable family and every tuple of Henkin constants, some formula of `p` can be refuted at
that tuple consistently with any member, the countable named model also omits every `p`. With `P`
empty this is `model_existence`; Layer 4 derives the omitting types theorem from it. The types
form a countable set of tagged types, as in Layer 4; this adapter derives that form from Tau Ceti's
`ConsistencyProperty.model_existence_omitting`, which takes a countable indexed family. -/
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

/-- **Layer 4, the type of a tuple relative to a fragment.** -/
def fragmentType (A : L.Fragment) (M : Type w) [L.Structure M] {n : ℕ} (a : Fin n → M) :
    Set (L.BoundedFormulaω Empty n) :=
  {φ | (⟨n, φ⟩ : Σ n, L.BoundedFormulaω Empty n) ∈ A.toSet ∧ φ.Realize Empty.elim a}

/-- **Layer 4 milestone.** `A`-elementary embeddings preserve `A`-types. This checks `fragmentType`
against Tau Ceti's `AElementary`: it is `AElementary.realize_iff` at each member of `A`. -/
theorem AElementary.fragmentType_comp {A : L.Fragment} {N : Type w} {M : Type w'}
    [L.Structure N] [L.Structure M] {f : N ↪[L] M} (hf : AElementary A f) {n : ℕ}
    (a : Fin n → N) : fragmentType A M (f ∘ a) = fragmentType A N a :=
  Set.ext fun _ => and_congr_right fun h => hf.realize_iff h a

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

end TauCetiRoadmap.InfinitaryModelExistence

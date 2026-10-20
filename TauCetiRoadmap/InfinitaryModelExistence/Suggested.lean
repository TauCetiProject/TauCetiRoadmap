import Mathlib
import TauCetiRoadmap.InfinitaryLogic.Suggested

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

The infinitary syntax, its realization and the coded connectives are imported from the parent
InfinitaryLogic prototype (`TauCetiRoadmap.InfinitaryLogic`), which mirrors Tau Ceti's
`TauCeti.ModelTheory.Infinitary.*`. Every definition below has an actual mathematical body; where
a construction is specified in `README.md` but too long to prototype (the first-order Morley
theory, the inseparability consistency property), the milestone is stated as an existence
theorem or a property of the construction, never as a placeholder proposition. Names and
namespaces are provisional.
-/

set_option autoImplicit false

universe u v u' v' u₁ v₁ u₂ v₂ w w' uι

namespace TauCetiRoadmap.InfinitaryModelExistence

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure
open TauCetiRoadmap.InfinitaryLogic

/-! ## Layer 0: the signature calculus -/

section Signature

variable {L : FirstOrder.Language.{u, v}} {L' : FirstOrder.Language.{u', v'}}
variable {ι : Type uι} {α : Type*}

/-- **Layer 0, language maps.** A language homomorphism acts on infinitary formulas at every
carrier, symbol by symbol, through Mathlib's `LHom.onTerm`. -/
def onBoundedFormulaInf (g : L →ᴸ L') :
    {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L' ι α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal (g.onTerm t₁) (g.onTerm t₂)
  | _, .rel R ts => .rel (g.onRelation R) fun i => g.onTerm (ts i)
  | _, .imp φ ψ => (onBoundedFormulaInf g φ).imp (onBoundedFormulaInf g ψ)
  | _, .all φ => (onBoundedFormulaInf g φ).all
  | _, .iSup φs => .iSup fun i => onBoundedFormulaInf g (φs i)
  | _, .iInf φs => .iInf fun i => onBoundedFormulaInf g (φs i)

/-- **Layer 0 milestone, realization along an expansion**, the infinitary form of Mathlib's
`LHom.realize_onBoundedFormula`. -/
theorem realize_onBoundedFormulaInf (g : L →ᴸ L') {M : Type w} [L.Structure M]
    [L'.Structure M] [g.IsExpansionOn M] {n : ℕ} (φ : BoundedFormulaInf L ι α n)
    (v : α → M) (xs : Fin n → M) :
    (onBoundedFormulaInf g φ).Realize v xs ↔ φ.Realize v xs := by
  sorry

/-- The function symbols occurring in a term. -/
def termFunctionsIn {β : Type*} : L.Term β → Set (Σ n, L.Functions n)
  | .var _ => ∅
  | .func f ts => insert ⟨_, f⟩ (⋃ i, termFunctionsIn (ts i))

/-- **Layer 0, function-symbol occurrences** of an infinitary formula. Equality is logical and
contributes only the function symbols of its two terms. -/
def functionsIn : {n : ℕ} → BoundedFormulaInf L ι α n → Set (Σ n, L.Functions n)
  | _, .falsum => ∅
  | _, .equal t₁ t₂ => termFunctionsIn t₁ ∪ termFunctionsIn t₂
  | _, .rel _ ts => ⋃ i, termFunctionsIn (ts i)
  | _, .imp φ ψ => functionsIn φ ∪ functionsIn ψ
  | _, .all φ => functionsIn φ
  | _, .iSup φs => ⋃ i, functionsIn (φs i)
  | _, .iInf φs => ⋃ i, functionsIn (φs i)

/-- **Layer 0, relation-symbol occurrences.** Equality is not a relation symbol. -/
def relationsIn : {n : ℕ} → BoundedFormulaInf L ι α n → Set (Σ n, L.Relations n)
  | _, .falsum => ∅
  | _, .equal _ _ => ∅
  | _, .rel R _ => {⟨_, R⟩}
  | _, .imp φ ψ => relationsIn φ ∪ relationsIn ψ
  | _, .all φ => relationsIn φ
  | _, .iSup φs => ⋃ i, relationsIn (φs i)
  | _, .iInf φs => ⋃ i, relationsIn (φs i)

/-- **Layer 0 milestone.** A formula at a countable carrier mentions countably many relation
symbols (the function-symbol twin is the same statement with `functionsIn`). -/
theorem relationsIn_countable [Countable ι] {n : ℕ} (φ : BoundedFormulaInf L ι α n) :
    (relationsIn φ).Countable := by
  sorry

/-- **Layer 0 milestone, symbol locality.** Two structures on one carrier that agree on the
symbols occurring in `φ` give `φ` the same truth value. This is what lets a sentence be moved to
the countable sublanguage of its own symbols and back. -/
theorem realize_congr_of_agreeOn {M : Type w} (S₁ S₂ : L.Structure M) {n : ℕ}
    (φ : BoundedFormulaInf L ι α n)
    (hf : ∀ p ∈ functionsIn φ, ∀ x : Fin p.1 → M,
      S₁.funMap p.2 x = S₂.funMap p.2 x)
    (hr : ∀ p ∈ relationsIn φ, ∀ x : Fin p.1 → M,
      (S₁.RelMap p.2 x ↔ S₂.RelMap p.2 x))
    (v : α → M) (xs : Fin n → M) :
    @BoundedFormulaInf.Realize L ι α M S₁ n φ v xs ↔
      @BoundedFormulaInf.Realize L ι α M S₂ n φ v xs := by
  sorry

/-- **Layer 0 milestone, pulling a formula back along a language map.** A formula of `L'` whose
occurring symbols all lie in the range of `g` is the image of a formula of `L`. No injectivity is
needed: choose a preimage for each occurring symbol. -/
theorem exists_eq_onBoundedFormulaInf_of_subset_range (g : L →ᴸ L') {n : ℕ}
    (φ : BoundedFormulaInf L' ι α n)
    (hf : functionsIn φ ⊆ Set.range fun p : Σ k, L.Functions k =>
      (⟨p.1, g.onFunction p.2⟩ : Σ k, L'.Functions k))
    (hr : relationsIn φ ⊆ Set.range fun p : Σ k, L.Relations k =>
      (⟨p.1, g.onRelation p.2⟩ : Σ k, L'.Relations k)) :
    ∃ ψ : BoundedFormulaInf L ι α n, onBoundedFormulaInf g ψ = φ := by
  sorry

/-- Lift a bound-position substitution under one more binder: old positions shift by
`Fin.castSucc`, and the new last position is sent to itself. -/
def liftSubst {m k : ℕ} (σ : Fin m → L.Term (α ⊕ Fin k)) : Fin (m + 1) → L.Term (α ⊕ Fin (k + 1)) :=
  Fin.snoc (fun i => (σ i).relabel (Sum.map id Fin.castSucc)) (Term.var (Sum.inr (Fin.last k)))

/-- **Layer 0, substitution for bound positions.** Replace bound position `i` by the term
`σ i`, whose own bound positions live in `Fin k`. With variable terms this is Tau Ceti's
`mapBound`; with closed terms it instantiates a formula, and with Henkin constants it produces
the instances used by every consistency property. -/
def substBounds : {m k : ℕ} → (Fin m → L.Term (α ⊕ Fin k)) →
    BoundedFormulaInf L ι α m → BoundedFormulaInf L ι α k
  | _, _, _, .falsum => .falsum
  | _, _, σ, .equal t₁ t₂ =>
      .equal (t₁.subst (Sum.elim (fun a => Term.var (Sum.inl a)) σ))
        (t₂.subst (Sum.elim (fun a => Term.var (Sum.inl a)) σ))
  | _, _, σ, .rel R ts => .rel R fun i => (ts i).subst (Sum.elim (fun a => Term.var (Sum.inl a)) σ)
  | _, _, σ, .imp φ ψ => (substBounds σ φ).imp (substBounds σ ψ)
  | _, _, σ, .all φ => (substBounds (liftSubst σ) φ).all
  | _, _, σ, .iSup φs => .iSup fun i => substBounds σ (φs i)
  | _, _, σ, .iInf φs => .iInf fun i => substBounds σ (φs i)

/-- **Layer 0 milestone, realization of a bound substitution.** -/
theorem realize_substBounds {M : Type w} [L.Structure M] {m k : ℕ}
    (σ : Fin m → L.Term (α ⊕ Fin k)) (φ : BoundedFormulaInf L ι α m) (v : α → M)
    (xs : Fin k → M) :
    (substBounds σ φ).Realize v xs ↔ φ.Realize v fun i => (σ i).realize (Sum.elim v xs) := by
  sorry

/-- **Layer 0 milestone, language maps commute with bound substitution.** -/
theorem onBoundedFormulaInf_substBounds {L' : FirstOrder.Language.{u', v'}} (g : L →ᴸ L')
    {m k : ℕ} (σ : Fin m → L.Term (α ⊕ Fin k)) (φ : BoundedFormulaInf L ι α m) :
    onBoundedFormulaInf g (substBounds σ φ) =
      substBounds (fun i => g.onTerm (σ i)) (onBoundedFormulaInf g φ) := by
  sorry

/-- A language with countably many function symbols has countably many of each arity. -/
instance countable_functions_of_sigma [Countable (Σ n, L.Functions n)] (n : ℕ) :
    Countable (L.Functions n) :=
  Function.Injective.countable (f := Sigma.mk n) sigma_mk_injective

/-- A language with countably many relation symbols has countably many of each arity. -/
instance countable_relations_of_sigma [Countable (Σ n, L.Relations n)] (n : ℕ) :
    Countable (L.Relations n) :=
  Function.Injective.countable (f := Sigma.mk n) sigma_mk_injective

/-- **Layer 0, the small presentation** of a language with countably many function and relation
symbols: a copy in `Language.{0, 0}`, function symbols included, obtained by shrinking each
symbol type. -/
def smallPresentation (L : FirstOrder.Language.{u, v}) [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] : FirstOrder.Language.{0, 0} where
  Functions n := Shrink.{0} (L.Functions n)
  Relations n := Shrink.{0} (L.Relations n)

/-- **Layer 0, the equivalence** with the small presentation, as a Mathlib `LEquiv`. -/
noncomputable def smallPresentationEquiv (L : FirstOrder.Language.{u, v})
    [Countable (Σ n, L.Functions n)] [Countable (Σ n, L.Relations n)] :
    L ≃ᴸ smallPresentation L where
  toLHom := ⟨fun n f => equivShrink.{0} (L.Functions n) f,
    fun n R => equivShrink.{0} (L.Relations n) R⟩
  invLHom := ⟨fun n f => (equivShrink.{0} (L.Functions n)).symm f,
    fun n R => (equivShrink.{0} (L.Relations n)).symm R⟩
  left_inv := LHom.funext
    (funext fun _ => funext fun f => (equivShrink.{0} _).symm_apply_apply f)
    (funext fun _ => funext fun R => (equivShrink.{0} _).symm_apply_apply R)
  right_inv := LHom.funext
    (funext fun _ => funext fun f => (equivShrink.{0} _).apply_symm_apply f)
    (funext fun _ => funext fun R => (equivShrink.{0} _).apply_symm_apply R)

/-- **Layer 0.** The small presentation of a relational language is relational. -/
instance smallPresentation_isRelational [L.IsRelational] [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] : (smallPresentation L).IsRelational :=
  fun n => (equivShrink.{0} (L.Functions n)).symm.isEmpty

/-- **Layer 0.** The small presentation has countably many relation symbols. -/
instance countable_relations_smallPresentation [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] : Countable (Σ n, (smallPresentation L).Relations n) :=
  Countable.of_equiv _ (Equiv.sigmaCongrRight fun n => equivShrink.{0} (L.Relations n))

/-- **Layer 0.** The small presentation has countably many function symbols. -/
instance countable_functions_smallPresentation [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] : Countable (Σ n, (smallPresentation L).Functions n) :=
  Countable.of_equiv _ (Equiv.sigmaCongrRight fun n => equivShrink.{0} (L.Functions n))

/-- **Layer 0 milestone, realization transport** to the small presentation: an `L`-structure
reinterpreted along the inverse map realizes the transported formula exactly when it realizes
the original. -/
theorem realize_smallPresentation [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] {M : Type w} [L.Structure M] {n : ℕ}
    (φ : BoundedFormulaInf L ι α n) (v : α → M) (xs : Fin n → M) :
    @BoundedFormulaInf.Realize (smallPresentation L) ι α M
        ((smallPresentationEquiv L).invLHom.reduct M) n
        (onBoundedFormulaInf (smallPresentationEquiv L).toLHom φ) v xs ↔
      φ.Realize v xs := by
  sorry

/-- Instantiate the single bound position of a formula by a closed term. -/
def inst (φ : BoundedFormulaInf L ι Empty 1) (t : L.Term (Empty ⊕ Fin 0)) :
    BoundedFormulaInf L ι Empty 0 :=
  substBounds (fun _ => t) φ

/-- Atomic formulas: equalities and relation instances. -/
def IsAtomic {n : ℕ} : BoundedFormulaInf L ι α n → Prop
  | .equal _ _ => True
  | .rel _ _ => True
  | _ => False

end Signature

/-! ## Layer 1: theories, entailment and fragments -/

section Theories

variable {L : FirstOrder.Language.{u, v}}

/-- An `Lω₁ω` theory is a set of sentences. -/
abbrev Theoryω (L : FirstOrder.Language.{u, v}) := Set (Sentenceω L)

/-- `M` satisfies every sentence of `T`. -/
def Theoryω.Model (T : Theoryω L) (M : Type w) [L.Structure M] : Prop :=
  ∀ φ ∈ T, SentenceInf.Realize φ M

/-- **Layer 1, satisfiability**, at Mathlib's model universe `max u v` and with Mathlib's
nonempty-model convention (`FirstOrder.Language.Theory.IsSatisfiable`). -/
def Theoryω.IsSatisfiable (T : Theoryω L) : Prop :=
  ∃ (M : Type (max u v)) (_ : L.Structure M), Nonempty M ∧ T.Model M

/-- **Layer 1, semantic entailment**: every nonempty model of `T` in the universe `max u v`
satisfies `φ` (the shape of Mathlib's `Theory.ModelsBoundedFormula`). -/
def Theoryω.Entails (T : Theoryω L) (φ : Sentenceω L) : Prop :=
  ∀ (M : Type (max u v)) [L.Structure M] [Nonempty M], T.Model M → SentenceInf.Realize φ M

/-- Entailment between sentences. -/
def Sentenceω.Entails (φ ψ : Sentenceω L) : Prop :=
  Theoryω.Entails {φ} ψ

/-- **Layer 1.** A structure omits a partial type when no tuple realizes all of it. -/
def OmitsType (M : Type w) [L.Structure M] {n : ℕ} (p : Set (BoundedFormulaω L Empty n)) : Prop :=
  ∀ a : Fin n → M, ∃ ψ ∈ p, ¬ ψ.Realize Empty.elim a

/-- **Layer 1 milestone**, Mathlib's `models_iff_not_satisfiable` for `Lω₁ω`. -/
theorem Theoryω.entails_iff_not_isSatisfiable (T : Theoryω L) (φ : Sentenceω L) :
    T.Entails φ ↔ ¬ (insert φ.not T).IsSatisfiable := by
  sorry

/-- **Layer 1, fragments.** A set of formulas, tagged by their number of bound positions, closed
under taking constructor components. Formulas have no free variables; parameters enter through
tuples. No atomic formula is required to belong, so a countable fragment exists over any language;
formation closure is the separate predicate `Fragment.FormationClosed`. -/
structure Fragment (L : FirstOrder.Language.{u, v}) where
  toSet : Set (Σ n, BoundedFormulaω L Empty n)
  imp_left_mem {n : ℕ} {φ ψ : BoundedFormulaω L Empty n} :
    (⟨n, φ.imp ψ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ toSet → ⟨n, φ⟩ ∈ toSet
  imp_right_mem {n : ℕ} {φ ψ : BoundedFormulaω L Empty n} :
    (⟨n, φ.imp ψ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ toSet → ⟨n, ψ⟩ ∈ toSet
  all_mem {n : ℕ} {φ : BoundedFormulaω L Empty (n + 1)} :
    (⟨n, φ.all⟩ : Σ n, BoundedFormulaω L Empty n) ∈ toSet → ⟨n + 1, φ⟩ ∈ toSet
  iInf_mem {n : ℕ} {φs : ℕ → BoundedFormulaω L Empty n} :
    (⟨n, .iInf φs⟩ : Σ n, BoundedFormulaω L Empty n) ∈ toSet → ∀ k, ⟨n, φs k⟩ ∈ toSet
  iSup_mem {n : ℕ} {φs : ℕ → BoundedFormulaω L Empty n} :
    (⟨n, .iSup φs⟩ : Σ n, BoundedFormulaω L Empty n) ∈ toSet → ∀ k, ⟨n, φs k⟩ ∈ toSet

/-- **Layer 1, generated fragments**: the component closure of a set of formulas. -/
inductive GeneratedFrom (S : Set (Σ n, BoundedFormulaω L Empty n)) :
    (Σ n, BoundedFormulaω L Empty n) → Prop
  | base {p} (h : p ∈ S) : GeneratedFrom S p
  | imp_left {n : ℕ} {φ ψ : BoundedFormulaω L Empty n} :
      GeneratedFrom S ⟨n, φ.imp ψ⟩ → GeneratedFrom S ⟨n, φ⟩
  | imp_right {n : ℕ} {φ ψ : BoundedFormulaω L Empty n} :
      GeneratedFrom S ⟨n, φ.imp ψ⟩ → GeneratedFrom S ⟨n, ψ⟩
  | all_body {n : ℕ} {φ : BoundedFormulaω L Empty (n + 1)} :
      GeneratedFrom S ⟨n, φ.all⟩ → GeneratedFrom S ⟨n + 1, φ⟩
  | iInf_comp {n : ℕ} {φs : ℕ → BoundedFormulaω L Empty n} (k : ℕ) :
      GeneratedFrom S ⟨n, .iInf φs⟩ → GeneratedFrom S ⟨n, φs k⟩
  | iSup_comp {n : ℕ} {φs : ℕ → BoundedFormulaω L Empty n} (k : ℕ) :
      GeneratedFrom S ⟨n, .iSup φs⟩ → GeneratedFrom S ⟨n, φs k⟩

/-- The smallest fragment containing `S`. -/
def Fragment.generated (S : Set (Σ n, BoundedFormulaω L Empty n)) : Fragment L where
  toSet := {p | GeneratedFrom S p}
  imp_left_mem h := .imp_left h
  imp_right_mem h := .imp_right h
  all_mem h := .all_body h
  iInf_mem h k := .iInf_comp k h
  iSup_mem h k := .iSup_comp k h

/-- **Layer 1 milestone.** A countable set generates a countable fragment: every member is
reached by a finite path of component steps, each indexed by a natural number. No countability of
the language is needed. -/
theorem Fragment.generated_countable {S : Set (Σ n, BoundedFormulaω L Empty n)}
    (hS : S.Countable) : (Fragment.generated S).toSet.Countable := by
  sorry

/-- **Layer 1, formation-closed fragments**, which play the role of Marker's fragments: every
atomic formula belongs, and the fragment is closed under `⊥`, implication, universal
quantification and substitution of bound positions by variables. -/
structure Fragment.FormationClosed (A : Fragment L) : Prop where
  atomic_mem {n : ℕ} {φ : BoundedFormulaω L Empty n} : IsAtomic φ →
    (⟨n, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet
  falsum_mem (n : ℕ) : (⟨n, .falsum⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet
  imp_mem {n : ℕ} {φ ψ : BoundedFormulaω L Empty n} :
    (⟨n, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet → ⟨n, ψ⟩ ∈ A.toSet →
      ⟨n, φ.imp ψ⟩ ∈ A.toSet
  all_mem' {n : ℕ} {φ : BoundedFormulaω L Empty (n + 1)} :
    (⟨n + 1, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet → ⟨n, φ.all⟩ ∈ A.toSet
  rename_mem {m k : ℕ} (f : Fin m → Fin k) {φ : BoundedFormulaω L Empty m} :
    (⟨m, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet →
      ⟨k, substBounds (fun i => Term.var (Sum.inr (f i))) φ⟩ ∈ A.toSet

end Theories

/-! ## Layer 2: fragment elementarity and downward Löwenheim–Skolem -/

section LowenheimSkolem

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 2, `A`-elementary embeddings**: truth agreement on every member of `A` at every
tuple. Stated as an iff, since a fragment need not be closed under negation. -/
def AElementary (A : Fragment L) {N : Type w} {M : Type w'} [L.Structure N] [L.Structure M]
    (f : N ↪[L] M) : Prop :=
  ∀ p ∈ A.toSet, ∀ a : Fin p.1 → N,
    (p.2.Realize Empty.elim (f ∘ a) ↔ p.2.Realize Empty.elim a)

/-- **Layer 2 milestone, downward Löwenheim–Skolem with the honest bound.** Every subset `X` of
`M` lies in an `A`-elementary substructure of cardinality at most
`max ℵ₀ |X| |A| |Σ n, L.Functions n|`. Function symbols enter separately because a fragment need
not contain an atomic formula mentioning them. -/
theorem exists_aElementary_substructure (A : Fragment L) {M : Type w} [L.Structure M]
    (X : Set M) :
    ∃ N : L.Substructure M, X ⊆ N ∧ AElementary A N.subtype ∧
      Cardinal.lift.{max u v} (Cardinal.mk N) ≤
        max (max Cardinal.aleph0 (Cardinal.lift.{max u v} (Cardinal.mk X)))
          (max (Cardinal.lift.{w} (Cardinal.mk A.toSet))
            (Cardinal.lift.{max v w} (Cardinal.mk (Σ n, L.Functions n)))) := by
  sorry

/-- **Layer 2 milestone, the countable case** consumed by the sibling roadmaps. -/
theorem exists_countable_aElementary_substructure [Countable (Σ n, L.Functions n)]
    (A : Fragment L) (hA : A.toSet.Countable) {M : Type w} [L.Structure M] {X : Set M}
    (hX : X.Countable) :
    ∃ N : L.Substructure M, X ⊆ N ∧ AElementary A N.subtype ∧ Countable N := by
  sorry

/-- **Layer 2 milestone, directed unions in one ambient structure.** -/
theorem aElementary_iSup (A : Fragment L) {M : Type w} [L.Structure M] {ι : Type*} [Nonempty ι]
    (S : ι → L.Substructure M) (hdir : Directed (· ≤ ·) S)
    (hS : ∀ i, AElementary A (S i).subtype) : AElementary A (⨆ i, S i).subtype := by
  sorry

/-- **Layer 2 milestone, sentence-level Löwenheim–Skolem.** A satisfiable countable theory has a
countable nonempty model in every universe. The proof passes to the countable sublanguage of the
occurring symbols, takes a countable `A`-elementary substructure there, and expands back. -/
theorem Theoryω.exists_countable_model {T : Theoryω L} (hT : T.Countable)
    (hsat : T.IsSatisfiable) :
    ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ Countable M ∧ T.Model M := by
  sorry

/-- **Layer 2 milestone, universe invariance of entailment** for countable theories: entailment
can be tested on countable models in any universe. -/
theorem Theoryω.entails_iff_countable {T : Theoryω L} (hT : T.Countable) (φ : Sentenceω L) :
    T.Entails φ ↔ ∀ (M : Type w) [L.Structure M] [Nonempty M] [Countable M],
      T.Model M → SentenceInf.Realize φ M := by
  sorry

/-- **Layer 2 milestone, entailment in arbitrary models.** For a countable theory, entailment gives
the conclusion in every nonempty model, of any cardinality and in any universe. -/
theorem Theoryω.Entails.realize {T : Theoryω L} (hT : T.Countable) {φ : Sentenceω L}
    (h : T.Entails φ) (M : Type w) [L.Structure M] [Nonempty M] (hM : T.Model M) :
    SentenceInf.Realize φ M := by
  sorry

end LowenheimSkolem

/-! ## Layer 3: consistency properties and model existence -/

section ModelExistence

variable {L : FirstOrder.Language.{u, v}}

/-- The Henkin constant `c` as a closed term. -/
abbrev hc (c : ℕ) : L[[ℕ]].Term (Empty ⊕ Fin 0) := (L.con c).term

/-- **Layer 3, consistency properties** over the Henkin expansion `L[[ℕ]]`, following Marker, Chapter 4,
and Keisler. Each clause either forbids a contradiction or lets one decomposition target be added
consistently; double negation is the `not_imp` clause at `ψ = ⊥`. There is no chain-closure or
decide-every-sentence clause: `Lω₁ω` is not compact, and the satisfiable sets do not have either
property. -/
structure ConsistencyProperty (L : FirstOrder.Language.{u, v}) where
  sets : Set (Set (Sentenceω L[[ℕ]]))
  no_falsum : ∀ s ∈ sets, (BoundedFormulaInf.falsum : Sentenceω L[[ℕ]]) ∉ s
  no_contradiction : ∀ s ∈ sets, ∀ φ : Sentenceω L[[ℕ]], φ ∈ s → φ.not ∉ s
  imp : ∀ s ∈ sets, ∀ φ ψ : Sentenceω L[[ℕ]], φ.imp ψ ∈ s →
    insert φ.not s ∈ sets ∨ insert ψ s ∈ sets
  not_imp : ∀ s ∈ sets, ∀ φ ψ : Sentenceω L[[ℕ]], (φ.imp ψ).not ∈ s →
    insert φ s ∈ sets ∧ insert ψ.not s ∈ sets
  iInf : ∀ s ∈ sets, ∀ φs : ℕ → Sentenceω L[[ℕ]], .iInf φs ∈ s → ∀ k, insert (φs k) s ∈ sets
  not_iInf : ∀ s ∈ sets, ∀ φs : ℕ → Sentenceω L[[ℕ]], (BoundedFormulaInf.iInf φs).not ∈ s →
    ∃ k, insert (φs k).not s ∈ sets
  iSup : ∀ s ∈ sets, ∀ φs : ℕ → Sentenceω L[[ℕ]], .iSup φs ∈ s → ∃ k, insert (φs k) s ∈ sets
  not_iSup : ∀ s ∈ sets, ∀ φs : ℕ → Sentenceω L[[ℕ]], (BoundedFormulaInf.iSup φs).not ∈ s →
    ∀ k, insert (φs k).not s ∈ sets
  all : ∀ s ∈ sets, ∀ φ : BoundedFormulaω L[[ℕ]] Empty 1, φ.all ∈ s →
    ∀ c : ℕ, insert (inst φ (hc c)) s ∈ sets
  not_all : ∀ s ∈ sets, ∀ φ : BoundedFormulaω L[[ℕ]] Empty 1, φ.all.not ∈ s →
    ∃ c : ℕ, insert (inst φ (hc c)).not s ∈ sets
  eq_refl : ∀ s ∈ sets, ∀ t : L[[ℕ]].Term (Empty ⊕ Fin 0), insert (.equal t t) s ∈ sets
  eq_subst : ∀ s ∈ sets, ∀ (t t' : L[[ℕ]].Term (Empty ⊕ Fin 0))
    (φ : BoundedFormulaω L[[ℕ]] Empty 1), IsAtomic φ → .equal t t' ∈ s → inst φ t ∈ s →
      insert (inst φ t') s ∈ sets
  eq_name : ∀ s ∈ sets, ∀ t : L[[ℕ]].Term (Empty ⊕ Fin 0),
    ∃ c : ℕ, insert (.equal (hc c) t) s ∈ sets

/-- **Layer 3 milestone, the model existence theorem.** A countable member of a consistency
property has a countable model, in any universe, every element of which names a Henkin constant.
The proof is a fair enumeration through the countable closure of `s` under the decomposition
targets, followed by the closed-term quotient and a two-polarity truth lemma; the limit set is
never claimed to be a member. -/
theorem model_existence [Countable (Σ n, L.Functions n)] [Countable (Σ n, L.Relations n)]
    (C : ConsistencyProperty L) {s : Set (Sentenceω L[[ℕ]])} (hs : s ∈ C.sets)
    (hsc : s.Countable) :
    ∃ (M : Type w) (_ : L[[ℕ]].Structure M), Countable M ∧ Theoryω.Model s M ∧
      ∀ m : M, ∃ c : ℕ, (L.con c : M) = m := by
  sorry

/-- **Layer 3 milestone, model existence with omission requests.** If, for each partial type `p`
of a countable family and every tuple of Henkin constants, some formula of `p` can be refuted at
that tuple consistently with any member, the countable named model also omits every `p`. With `P`
empty this is `model_existence`; Layer 4 derives the omitting types theorem from it. -/
theorem model_existence_omitting [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] (C : ConsistencyProperty L)
    (P : Set (Σ n, Set (BoundedFormulaω L[[ℕ]] Empty n))) (hP : P.Countable)
    (hPc : ∀ p ∈ P, p.2.Countable)
    (hreq : ∀ p ∈ P, ∀ s ∈ C.sets, ∀ c : Fin p.1 → ℕ, ∃ ψ ∈ p.2,
      insert (substBounds (fun i => hc (c i)) ψ).not s ∈ C.sets)
    {s : Set (Sentenceω L[[ℕ]])} (hs : s ∈ C.sets) (hsc : s.Countable) :
    ∃ (M : Type w) (_ : L[[ℕ]].Structure M), Countable M ∧ Theoryω.Model s M ∧
      (∀ m : M, ∃ c : ℕ, (L.con c : M) = m) ∧ ∀ p ∈ P, OmitsType M p.2 := by
  sorry

end ModelExistence

/-! ## Layer 4: types and omitting types -/

section Types

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 4, the complete `Lω₁ω`-type** of a tuple. -/
def infinitaryType (M : Type w) [L.Structure M] {n : ℕ} (a : Fin n → M) :
    Set (BoundedFormulaω L Empty n) :=
  {φ | φ.Realize Empty.elim a}

/-- The complete types realized in `M` at arity `n`. -/
def realizedTypes (M : Type w) [L.Structure M] (n : ℕ) : Set (Set (BoundedFormulaω L Empty n)) :=
  Set.range (infinitaryType M (n := n))

/-- **Layer 4 milestone, realized-type isolators.** If `M` realizes countably many complete
`n`-types, each realized type is isolated among the realized ones by a single formula: a countable
conjunction of separators, one for each other realized type. No smallness predicate, fragment or
relational hypothesis is involved. -/
theorem exists_isolatingFormula {M : Type w} [L.Structure M] {n : ℕ}
    (h : (realizedTypes (L := L) M n).Countable) (a : Fin n → M) :
    ∃ χ : BoundedFormulaω L Empty n, ∀ b : Fin n → M,
      χ.Realize Empty.elim b ↔ infinitaryType (L := L) M b = infinitaryType M a := by
  sorry

/-- **Layer 4, the type of a tuple relative to a fragment.** -/
def fragmentType (A : Fragment L) (M : Type w) [L.Structure M] {n : ℕ} (a : Fin n → M) :
    Set (BoundedFormulaω L Empty n) :=
  {φ | (⟨n, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet ∧ φ.Realize Empty.elim a}

/-- **Layer 4 milestone.** `A`-elementary embeddings preserve `A`-types. -/
theorem AElementary.fragmentType_comp {A : Fragment L} {N : Type w} {M : Type w'}
    [L.Structure N] [L.Structure M] {f : N ↪[L] M} (hf : AElementary A f) {n : ℕ}
    (a : Fin n → N) : fragmentType A M (f ∘ a) = fragmentType A N a := by
  sorry

/-- Existential closure over all bound positions. Stand-in for Tau Ceti's
`FirstOrder.Language.BoundedFormulaInf.exs` (`TauCeti/ModelTheory/Infinitary/Syntax.lean` at Tau
Ceti main), a parent-roadmap target that the parent prototype does not declare. -/
def exs {ι : Type uι} {α : Type*} : {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L ι α 0
  | 0, φ => φ
  | _ + 1, φ => exs φ.ex

/-- **Layer 4, isolation over a theory inside a fragment**: some member `φ` of `A` is consistent
with `T` and implies every formula of `p` modulo `T`. -/
def Theoryω.IsolatesIn (A : Fragment L) (T : Theoryω L) {n : ℕ}
    (p : Set (BoundedFormulaω L Empty n)) : Prop :=
  ∃ φ : BoundedFormulaω L Empty n, (⟨n, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet ∧
    (insert (exs φ) T).IsSatisfiable ∧ ∀ ψ ∈ p, T.Entails (BoundedFormulaInf.alls (φ.imp ψ))

/-- **Layer 4 milestone, the omitting types theorem for countable fragments.** -/
theorem Theoryω.exists_countable_model_omitting (A : Fragment L) (hA : A.FormationClosed)
    (hAc : A.toSet.Countable) (T : Theoryω L)
    (hTA : ∀ φ ∈ T, (⟨0, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet)
    (hsat : T.IsSatisfiable) (P : Set (Σ n, Set (BoundedFormulaω L Empty n))) (hP : P.Countable)
    (hPA : ∀ p ∈ P, ∀ ψ ∈ p.2, (⟨p.1, ψ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ A.toSet)
    (hiso : ∀ p ∈ P, ¬ T.IsolatesIn A p.2) :
    ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ Countable M ∧ T.Model M ∧
      ∀ p ∈ P, OmitsType M p.2 := by
  sorry

end Types

/-! ## Layer 5: Morleyization -/

section Morleyization

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 5, the Morleyization** of `L` by a family `Φ`: the base signature together with one
`n`-ary relation symbol for each member of `Φ` at arity `n`. -/
def morleyize (L : FirstOrder.Language.{u, v}) (Φ : Set (Σ n, BoundedFormulaω L Empty n)) :
    FirstOrder.Language.{u, max u v} where
  Functions := L.Functions
  Relations n := L.Relations n ⊕ {φ : BoundedFormulaω L Empty n // ⟨n, φ⟩ ∈ Φ}

/-- The inclusion of the base language. -/
def lhomMorleyize (Φ : Set (Σ n, BoundedFormulaω L Empty n)) : L →ᴸ morleyize L Φ where
  onFunction _ f := f
  onRelation _ R := Sum.inl R

/-- **Layer 5, the canonical expansion**: `R_φ(a)` holds exactly when `φ(a)` does. Nothing is
chosen. -/
@[instance_reducible] def morleyExpansion (Φ : Set (Σ n, BoundedFormulaω L Empty n)) (M : Type w)
    [L.Structure M] :
    (morleyize L Φ).Structure M where
  funMap f x := Structure.funMap (L := L) f x
  RelMap
    | Sum.inl R, x => Structure.RelMap R x
    | Sum.inr φ, x => φ.1.Realize Empty.elim x

/-- **Layer 5.** The Morleyization of a relational language is relational: it has the function
symbols of `L`. -/
instance morleyize_isRelational [L.IsRelational] (Φ : Set (Σ n, BoundedFormulaω L Empty n)) :
    (morleyize L Φ).IsRelational :=
  fun n => (inferInstance : IsEmpty (L.Functions n))

/-- **Layer 5.** Morleyizing by a countable family keeps the relation symbols countable. -/
theorem countable_relations_morleyize [Countable (Σ n, L.Relations n)]
    {Φ : Set (Σ n, BoundedFormulaω L Empty n)} (hΦ : Φ.Countable) :
    Countable (Σ n, (morleyize L Φ).Relations n) := by
  sorry

/-- **Layer 5.** The canonical expansion is an expansion along `lhomMorleyize`. -/
theorem isExpansionOn_morleyExpansion (Φ : Set (Σ n, BoundedFormulaω L Empty n)) (M : Type w)
    [L.Structure M] :
    @LHom.IsExpansionOn L (morleyize L Φ) (lhomMorleyize Φ) M _ (morleyExpansion Φ M) :=
  @LHom.IsExpansionOn.mk L (morleyize L Φ) (lhomMorleyize Φ) M _ (morleyExpansion Φ M)
    (fun _ _ => rfl) (fun _ _ => rfl)

/-- **Layer 5 milestone.** Isomorphisms of `L`-structures lift to isomorphisms of the canonical
expansions and restrict back. -/
theorem nonempty_morleyEquiv_iff (Φ : Set (Σ n, BoundedFormulaω L Empty n)) {M : Type w}
    {N : Type w'} [L.Structure M] [L.Structure N] :
    Nonempty (@Language.Equiv (morleyize L Φ) M N (morleyExpansion Φ M) (morleyExpansion Φ N)) ↔
      Nonempty (M ≃[L] N) := by
  sorry

/-- Omission of a first-order partial type, with tuples in bound positions. -/
def OmitsFOType {L : FirstOrder.Language.{u, v}} (M : Type w) [L.Structure M] {n : ℕ}
    (p : Set (L.BoundedFormula Empty n)) : Prop :=
  ∀ a : Fin n → M, ∃ ψ ∈ p, ¬ ψ.Realize Empty.elim a

/-- **Layer 5 milestone, the first-order presentation of a countable fragment** (Marker 2016,
Chapter 1). There is a first-order theory of the Morleyization, countable when `A` is (no
countability of the language is needed), and a countable family of first-order partial types, such
that an expansion of an `L`-structure models the theory and omits the types exactly when it is the
canonical expansion.
`README.md` Layer 5 specifies the axioms and the types explicitly. -/
theorem exists_firstOrder_presentation (A : Fragment L) (hA : A.toSet.Countable) :
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

/-- **Layer 6, graph relations**: every base relation symbol at its arity, and for every `n`-ary
function symbol an `(n + 1)`-ary relation symbol for its graph. -/
inductive GraphRelation (L : FirstOrder.Language.{u, v}) : ℕ → Type (max u v) where
  | base {n : ℕ} (R : L.Relations n) : GraphRelation L n
  | graph {n : ℕ} (f : L.Functions n) : GraphRelation L (n + 1)

/-- **Layer 6, the graph language**: no function symbols, relation symbols `GraphRelation L`. -/
@[reducible] def graphLanguage (L : FirstOrder.Language.{u, v}) :
    FirstOrder.Language.{u, max u v} where
  Functions _ := PEmpty
  Relations := GraphRelation L

instance graphLanguage_isRelational : (graphLanguage L).IsRelational :=
  fun _ => inferInstanceAs (IsEmpty PEmpty)

/-- **Layer 6, the graph expansion**: base relations unchanged, and `G_f(x̄, y)` read as
`f(x̄) = y`. -/
@[instance_reducible] def graphExpansion (M : Type w) [L.Structure M] :
    (graphLanguage L).Structure M where
  funMap f _ := PEmpty.elim f
  RelMap
    | .base R, x => Structure.RelMap R x
    | .graph f, x => Structure.funMap f (Fin.init x) = x (Fin.last _)

/-- Which graph-language symbols come from the function symbols `F` and relation symbols `R`. -/
def RelSymMem (F : Set (Σ n, L.Functions n)) (R : Set (Σ n, L.Relations n)) :
    (Σ n, GraphRelation L n) → Prop
  | ⟨_, .base R'⟩ => (⟨_, R'⟩ : Σ n, L.Relations n) ∈ R
  | ⟨_, .graph f⟩ => (⟨_, f⟩ : Σ n, L.Functions n) ∈ F

/-- The relationalization `relSym F R` of a pair of symbol sets. -/
def relSym (F : Set (Σ n, L.Functions n)) (R : Set (Σ n, L.Relations n)) :
    Set (Σ n, (graphLanguage L).Relations n) :=
  {p | RelSymMem F R p}

/-- **Layer 6 milestone, the shared-vocabulary identity.** -/
theorem relSym_inter (F₁ F₂ : Set (Σ n, L.Functions n)) (R₁ R₂ : Set (Σ n, L.Relations n)) :
    relSym F₁ R₁ ∩ relSym F₂ R₂ = relSym (F₁ ∩ F₂) (R₁ ∩ R₂) := by
  sorry

/-- **Layer 6, formula translation** (stated as the existence of a translation with the
specified properties; `README.md` Layer 6 gives the term-flattening construction): over the graph
expansion it is realized exactly when the original is, and its relation symbols are exactly the
relationalization of the original's symbols. -/
theorem exists_relationalize {α : Type*} :
    ∃ τ : (n : ℕ) → BoundedFormulaω L α n → BoundedFormulaω (graphLanguage L) α n,
      (∀ (M : Type w) [L.Structure M] {n : ℕ} (φ : BoundedFormulaω L α n) (v : α → M)
          (xs : Fin n → M),
          @BoundedFormulaInf.Realize (graphLanguage L) ℕ α M (graphExpansion M) n (τ n φ) v xs ↔
            φ.Realize v xs) ∧
      ∀ {n : ℕ} (φ : BoundedFormulaω L α n),
        relationsIn (τ n φ) = relSym (functionsIn φ) (relationsIn φ) := by
  sorry

/-- Erase a graph-language term (it has no function symbols). -/
def ungraphTerm {β : Type*} : (graphLanguage L).Term β → L.Term β
  | .var z => .var z
  | .func f _ => PEmpty.elim f

/-- **Layer 6, back-translation**: a graph atom `G_f(x̄, y)` becomes `f(x̄) = y`. -/
def backTranslate {α : Type*} :
    {n : ℕ} → BoundedFormulaω (graphLanguage L) α n → BoundedFormulaω L α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal (ungraphTerm t₁) (ungraphTerm t₂)
  | _, .rel (.base R) ts => .rel R fun i => ungraphTerm (ts i)
  | _, .rel (.graph f) ts =>
      .equal (.func f fun i => ungraphTerm (ts (Fin.castSucc i))) (ungraphTerm (ts (Fin.last _)))
  | _, .imp φ ψ => (backTranslate φ).imp (backTranslate ψ)
  | _, .all φ => (backTranslate φ).all
  | _, .iSup φs => .iSup fun i => backTranslate (φs i)
  | _, .iInf φs => .iInf fun i => backTranslate (φs i)

/-- **Layer 6 milestone, back-translation semantics**, over the graph expansion of any
`L`-structure. -/
theorem realize_backTranslate {α : Type*} {M : Type w} [L.Structure M] {n : ℕ}
    (θ : BoundedFormulaω (graphLanguage L) α n) (v : α → M) (xs : Fin n → M) :
    (backTranslate θ).Realize v xs ↔
      @BoundedFormulaInf.Realize (graphLanguage L) ℕ α M (graphExpansion M) n θ v xs := by
  sorry

end GraphTranslation

/-! ## Layer 7: projective classes and interpolation -/

section Interpolation

variable {L : FirstOrder.Language.{u, v}}

/-- **Layer 7, projective-class membership**: `M` itself, on the same carrier, expands along `g`
to a model of `Θ`. -/
def PCMem {L' : FirstOrder.Language.{u', v'}} (g : L →ᴸ L') (Θ : Sentenceω L') (M : Type w)
    [L.Structure M] : Prop :=
  ∃ S : L'.Structure M, @LHom.IsExpansionOn L L' g M _ S ∧ @SentenceInf.Realize L' ℕ Θ M S

/-- **Layer 7 milestone, the relational core of Craig interpolation**, for relational languages
of any cardinality. -/
theorem craig_interpolation_relational [L.IsRelational] (φ ψ : Sentenceω L)
    (h : Sentenceω.Entails φ ψ) :
    ∃ θ : Sentenceω L, relationsIn θ ⊆ relationsIn φ ∩ relationsIn ψ ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7 milestone, Craig interpolation** for an arbitrary language, with no hypothesis on
`L`: the relational core transferred by the graph translation of Layer 6. -/
theorem craig_interpolation (φ ψ : Sentenceω L) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : Sentenceω L, functionsIn θ ⊆ functionsIn φ ∩ functionsIn ψ ∧
      relationsIn θ ⊆ relationsIn φ ∩ relationsIn ψ ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7 milestone, PC separation.** Two projective classes, given by new symbols
`L₁` and `L₂`, with no common countable nonempty member, are separated by a single `L`-sentence on
nonempty structures of every universe. No language is assumed relational or countable. -/
theorem pcSeparation {L₁ : FirstOrder.Language.{u₁, v₁}}
    {L₂ : FirstOrder.Language.{u₂, v₂}}
    (Θ₁ : Sentenceω (L.sum L₁)) (Θ₂ : Sentenceω (L.sum L₂))
    (h : ∀ (M : Type) [L.Structure M] [Nonempty M] [Countable M],
      PCMem LHom.sumInl Θ₁ M → ¬ PCMem LHom.sumInl Θ₂ M) :
    ∃ θ : Sentenceω L,
      (∀ (M : Type w) [L.Structure M] [Nonempty M], PCMem LHom.sumInl Θ₁ M →
        SentenceInf.Realize θ M) ∧
      (∀ (M : Type w) [L.Structure M] [Nonempty M], PCMem LHom.sumInl Θ₂ M →
        ¬ SentenceInf.Realize θ M) := by
  sorry

/-- **Layer 7, signed relation occurrences**: an antecedent flips the sign; quantifiers and the
countable connectives preserve it; equality contributes to neither sign. -/
def relationsInSigned {ι : Type uι} {α : Type*} :
    {n : ℕ} → Bool → BoundedFormulaInf L ι α n → Set (Σ n, L.Relations n)
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
theorem lyndon_interpolation (φ ψ : Sentenceω L) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : Sentenceω L, functionsIn θ ⊆ functionsIn φ ∩ functionsIn ψ ∧
      relationsInSigned true θ ⊆ relationsInSigned true φ ∩ relationsInSigned true ψ ∧
      relationsInSigned false θ ⊆ relationsInSigned false φ ∩ relationsInSigned false ψ ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

/-- **Layer 7, the universal class** (`s = true`) and the existential class (`s = false`):
atomic formulas lie in both, an antecedent flips the class, countable connectives preserve it and
are not counted as quantifiers, and `∀` is universal only. -/
def universalSigned {ι : Type uι} {α : Type*} :
    {n : ℕ} → Bool → BoundedFormulaInf L ι α n → Prop
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
theorem malitz_interpolation [L.IsRelational] (φ ψ : Sentenceω L)
    (hψ : universalSigned true ψ) (h : Sentenceω.Entails φ ψ) :
    ∃ θ : Sentenceω L, universalSigned true θ ∧
      relationsIn θ ⊆ relationsIn φ ∩ relationsIn ψ ∧
      Sentenceω.Entails φ θ ∧ Sentenceω.Entails θ ψ := by
  sorry

end Interpolation

/-! ## Layer 8: well-ordering -/

section WellOrdering

variable {L : FirstOrder.Language.{u, v}}

/-- A map whose image is an `lt`-chain along the order of its domain. -/
def RelChain {M : Type w} [L.Structure M] (lt : L.Relations 2) {β : Type*} [LT β]
    (f : β → M) : Prop :=
  ∀ x y, x < y → RelMap lt ![f x, f y]

/-- **Layer 8, the hypothesis of Marker's boundedness theorem**: models of `φ` carry `lt`-chains of
every countable length. -/
def HasWellOrderedChains (φ : Sentenceω L) (lt : L.Relations 2) : Prop :=
  ∀ α : Ordinal.{w}, α < Ordinal.omega 1 → ∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧
    SentenceInf.Realize φ M ∧ ∃ f : α.ToType → M, RelChain lt f

/-- **Layer 8 milestone, Marker's boundedness theorem** in the raw positive form, for an arbitrary
language: a countable nonempty model of `φ` with an `lt`-preserving map from `ℚ`. -/
theorem exists_model_relChain_rat (φ : Sentenceω L) (lt : L.Relations 2)
    (h : HasWellOrderedChains.{u, v, w} φ lt) :
    ∃ (M : Type w') (_ : L.Structure M), Nonempty M ∧ Countable M ∧ SentenceInf.Realize φ M ∧
      ∃ f : ℚ → M, RelChain lt f := by
  sorry

/-- **Layer 8 milestone, boundedness of order types**: well-ordered models have uniformly
bounded countable order type. -/
theorem wellOrder_type_boundedness (φ : Sentenceω L) (lt : L.Relations 2)
    (hwo : ∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M →
      IsWellOrder M fun x y : M => RelMap lt ![x, y]) :
    ∃ α : Ordinal.{w}, α < Ordinal.omega 1 ∧
      ∀ (M : Type w) (inst : L.Structure M) (h : SentenceInf.Realize φ M),
        @Ordinal.type M (fun x y => RelMap lt ![x, y]) (hwo M inst h) < α := by
  sorry

/-- **Layer 8 milestone, undefinability of well-ordering.** -/
theorem wellOrdering_undefinable (lt : L.Relations 2) :
    ¬ ∃ φ : Sentenceω L, ∀ (M : Type w) (_ : L.Structure M),
      (SentenceInf.Realize φ M ↔ IsWellOrder M fun x y : M => RelMap lt ![x, y]) := by
  sorry

end WellOrdering

end TauCetiRoadmap.InfinitaryModelExistence

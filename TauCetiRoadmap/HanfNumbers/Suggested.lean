import Mathlib
import Completed.InfinitaryLogic.Suggested

/-!
# Ehrenfeucht–Mostowski models and Hanf numbers for Lω₁ω: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, layer-by-layer build
(Layers 0–5), conventions, worked examples, and references are the specification. This file is
**not** the roadmap and is **not exhaustive**: it records suggested Lean `sorry`-forms (allowed in
this human-owned roadmap library) for *particular* milestones, so that contributors and reviewers
converge on names and signatures; discharging every statement here neither finishes a layer nor
the roadmap.

The infinitary syntax and semantics are the parent roadmap's (`BoundedFormulaω`, `Sentenceω`,
`BoundedFormulaInf.Realize`, `SentenceInf.Realize`), imported from its prototype. Skolem towers and
the construction of the Ehrenfeucht–Mostowski term model are specified in the README only, because
they need `substBounds` and `Fragment` of the InfinitaryModelExistence roadmap, which this
prototype does not import; the source and stretching theorems are stated here semantically. The
three stand-ins below, `onBoundedFormulaInf`, `infinitaryType` and `realizedTypes`, copy that
roadmap's prototype signatures and bodies exactly, as checked against its revision 6da153fb
(TauCetiRoadmap #1315). They are prototype scaffolding: InfinitaryModelExistence owns these
declarations, and Tau Ceti implements only the owner's.
Names are provisional.
-/

set_option autoImplicit false

universe u v w u' u'' v'' uι

namespace TauCetiRoadmap.HanfNumbers

open FirstOrder FirstOrder.Language Cardinal
open TauCetiRoadmap.InfinitaryLogic

/-! ## Layer 0: the partition calculus the Morley–Hanf proof uses -/

section PartitionCalculus

variable {I : Type u} [LinearOrder I] {C : Type v}

/-- `H` is homogeneous for a colouring of increasing `n`-tuples: all increasing tuples from `H`
get the same colour. Increasing tuples of a linear order are the same thing as `n`-element
subsets, so this is the classical notion. -/
def IsHomogeneousOn {n : ℕ} (c : (Fin n ↪o I) → C) (H : Set I) : Prop :=
  ∀ s t : Fin n ↪o I, (∀ k, s k ∈ H) → (∀ k, t k ∈ H) → c s = c t

/-- `H` is end-homogeneous: the colour of an increasing `(n + 2)`-tuple from `H` does not depend on
its last point. -/
def IsEndHomogeneousOn {n : ℕ} (c : (Fin (n + 2) ↪o I) → C) (H : Set I) : Prop :=
  ∀ s t : Fin (n + 2) ↪o I, (∀ k, s k ∈ H) → (∀ k, t k ∈ H) →
    (∀ k : Fin (n + 1), s k.castSucc = t k.castSucc) → c s = c t

/-- The partition relation `κ → (λ)ⁿ_μ`: every colouring of the increasing `n`-tuples of a linear
order of cardinality `κ` with at most `μ` colours has a homogeneous set of cardinality at least
`λ`. The relation does not depend on the linear order chosen (`partitionRel_iff_finset`). -/
def PartitionRel (κ lam : Cardinal.{u}) (n : ℕ) (μ : Cardinal.{u}) : Prop :=
  ∀ (J : Type u) [LinearOrder J] (D : Type u), #J = κ → #D ≤ μ →
    ∀ c : (Fin n ↪o J) → D, ∃ H : Set J, lam ≤ #H ∧ IsHomogeneousOn c H

/-- **Layer 0, order-free form.** The partition relation is the classical statement about
colourings of `n`-element subsets. -/
theorem partitionRel_iff_finset {κ lam μ : Cardinal.{u}} {n : ℕ} :
    PartitionRel κ lam n μ ↔
      ∀ (X : Type u) (D : Type u), #X = κ → #D ≤ μ →
        ∀ c : {s : Finset X // s.card = n} → D, ∃ H : Set X, lam ≤ #H ∧
          ∀ s t : {s : Finset X // s.card = n}, (↑s.1 : Set X) ⊆ H → (↑t.1 : Set X) ⊆ H →
            c s = c t := by
  sorry

/-- **Layer 0, monotonicity.** A larger source, a smaller target and fewer colours preserve the
relation. -/
theorem PartitionRel.mono {κ κ' lam lam' μ μ' : Cardinal.{u}} {n : ℕ}
    (h : PartitionRel κ lam n μ) (hκ : κ ≤ κ') (hlam : lam' ≤ lam) (hμ : μ' ≤ μ) :
    PartitionRel κ' lam' n μ' := by
  sorry

/-- The iterated exponential `ℶₙ(κ)`: `ℶ₀(κ) = κ` and `ℶₙ₊₁(κ) = 2 ^ ℶₙ(κ)`. -/
noncomputable def iteratedTwoPow (κ : Cardinal.{u}) : ℕ → Cardinal.{u}
  | 0 => κ
  | n + 1 => 2 ^ iteratedTwoPow κ n

/-- On the beth scale the iterated exponential is a shift of the index. -/
theorem iteratedTwoPow_beth (α : Ordinal.{u}) (n : ℕ) :
    iteratedTwoPow (ℶ_ α) n = ℶ_ (α + n) := by
  sorry

/-- **Layer 0, the pigeonhole principle** `κ⁺ → (κ⁺)¹_κ`, from the regularity of successor
cardinals. -/
theorem partitionRel_succ_one {κ : Cardinal.{u}} (hκ : ℵ₀ ≤ κ) :
    PartitionRel (Order.succ κ) (Order.succ κ) 1 κ := by
  sorry

/-- **Layer 0, end-homogeneous sets.** A well-ordered source of size at least `(2 ^ λ)⁺`
coloured with at most `λ` colours has an end-homogeneous subset of size `λ⁺`. -/
theorem exists_isEndHomogeneousOn {lam : Cardinal.{u}} (hlam : ℵ₀ ≤ lam) {J : Type u}
    [LinearOrder J] [WellFoundedLT J] (hJ : Order.succ (2 ^ lam) ≤ #J) {D : Type u}
    (hD : #D ≤ lam) {n : ℕ} (c : (Fin (n + 2) ↪o J) → D) :
    ∃ H : Set J, Order.succ lam ≤ #H ∧ IsEndHomogeneousOn c H := by
  sorry

/-- **Layer 0 milestone, the Erdős–Rado theorem** `ℶₙ(κ)⁺ → (κ⁺)ⁿ⁺¹_κ` for infinite `κ`. -/
theorem erdos_rado {κ : Cardinal.{u}} (hκ : ℵ₀ ≤ κ) (n : ℕ) :
    PartitionRel (Order.succ (iteratedTwoPow κ n)) (Order.succ κ) (n + 1) κ := by
  sorry

/-- **Layer 0, the beth form** used at every level `α` of the Morley–Hanf construction. -/
theorem erdos_rado_beth (α : Ordinal.{u}) (n : ℕ) :
    PartitionRel (Order.succ (ℶ_ (α + n))) (Order.succ (ℶ_ α)) (n + 1) (ℶ_ α) := by
  sorry

/-- **Layer 0, the `ω₁`-pigeonhole principle.** A countable colouring of the countable ordinals
has a colour taken at unboundedly many of them. -/
theorem exists_unbounded_fiber {D : Type*} [Countable D]
    (f : Set.Iio (Ordinal.omega.{u} 1) → D) :
    ∃ d, ∀ β < Ordinal.omega.{u} 1, ∃ α : Set.Iio (Ordinal.omega.{u} 1), β ≤ α.1 ∧ f α = d := by
  sorry

end PartitionCalculus

/-! ## Layer 1: indiscernible sequences and templates -/

section Indiscernibles

variable {L : FirstOrder.Language.{u, v}}

/-- A sequence indexed by a linear order is indiscernible for a set `Δ` of formulas: each formula
of `Δ` has the same truth value at every increasing tuple. Formulas carry their variables in
bound positions, as in the parent roadmap's tuple-indexed constructions. -/
def IsIndiscernibleOn {J : Type u'} [LinearOrder J] {M : Type w} [L.Structure M] (a : J → M)
    (Δ : Set (Σ n, BoundedFormulaω L Empty n)) : Prop :=
  ∀ p ∈ Δ, ∀ s t : Fin p.1 ↪o J,
    BoundedFormulaInf.Realize p.2 (Empty.elim : Empty → M) (a ∘ s) ↔
      BoundedFormulaInf.Realize p.2 (Empty.elim : Empty → M) (a ∘ t)

/-- Indiscernibility passes to subsequences. -/
theorem IsIndiscernibleOn.comp {J : Type u'} [LinearOrder J] {K : Type*} [LinearOrder K]
    {M : Type w} [L.Structure M] {a : J → M} {Δ : Set (Σ n, BoundedFormulaω L Empty n)}
    (h : IsIndiscernibleOn a Δ) (e : K ↪o J) : IsIndiscernibleOn (a ∘ e) Δ := by
  sorry

/-- An Ehrenfeucht–Mostowski template: for each arity, the formulas declared true of increasing
tuples. The README pins its coherence, completeness and Skolem conditions. -/
structure EMTemplate (L : FirstOrder.Language.{u, v}) where
  /-- The formulas in `n` bound variables declared true. -/
  formulas : (n : ℕ) → Set (BoundedFormulaω L Empty n)

/-- The template of a sequence: the formulas true at every increasing tuple. -/
def templateOf {J : Type u'} [LinearOrder J] {M : Type w} [L.Structure M] (a : J → M) :
    EMTemplate L :=
  ⟨fun n => {φ | ∀ t : Fin n ↪o J, BoundedFormulaInf.Realize φ (Empty.elim : Empty → M) (a ∘ t)}⟩

/-- A sequence realizes a template on `Δ` when each formula of `Δ` holds at an increasing tuple
exactly if the template declares it true. -/
def EMTemplate.RealizesOn (Φ : EMTemplate L) {J : Type u'} [LinearOrder J] {M : Type w}
    [L.Structure M] (a : J → M) (Δ : Set (Σ n, BoundedFormulaω L Empty n)) : Prop :=
  ∀ p ∈ Δ, ∀ t : Fin p.1 ↪o J,
    BoundedFormulaInf.Realize p.2 (Empty.elim : Empty → M) (a ∘ t) ↔ p.2 ∈ Φ.formulas p.1

/-- On an infinite index order, indiscernibility on `Δ` is realization of the sequence's own
template on `Δ`. -/
theorem isIndiscernibleOn_iff_realizesOn_templateOf {J : Type u'} [LinearOrder J] [Infinite J]
    {M : Type w} [L.Structure M] (a : J → M) (Δ : Set (Σ n, BoundedFormulaω L Empty n)) :
    IsIndiscernibleOn a Δ ↔ (templateOf a).RealizesOn a Δ := by
  sorry

/-- The formula `x₀ ≠ x₁` on two bound positions. -/
def disEq : BoundedFormulaω L Empty 2 :=
  (BoundedFormulaInf.equal (Term.var (Sum.inr 0)) (Term.var (Sum.inr 1))).not

/-- The Morley seed of a sentence: the sentence itself and `x₀ ≠ x₁`. -/
def morleySeed (φ : Sentenceω L) : Set (Σ n, BoundedFormulaω L Empty n) :=
  {⟨0, φ⟩, ⟨2, disEq⟩}

/-- **Layer 1 worked example.** Every injective sequence in a model of `φ` is indiscernible for
the Morley seed. -/
theorem isIndiscernibleOn_morleySeed {J : Type u'} [LinearOrder J] {M : Type w} [L.Structure M]
    (φ : Sentenceω L) {a : J → M} (ha : Function.Injective a) :
    IsIndiscernibleOn a (morleySeed φ) := by
  sorry

end Indiscernibles

/-! ## Layer 2: Ehrenfeucht–Mostowski sources and models -/

section LanguageMaps

variable {L : FirstOrder.Language.{u, v}} {L' : FirstOrder.Language.{u'', v''}}
variable {ι : Type uι} {α : Type*}

/-! Owner: InfinitaryModelExistence (TauCetiRoadmap #1315), Layer 0.1. Declaration:
`onBoundedFormulaInf`. Checked against revision 6da153fb of that roadmap. Scaffolding only. -/

/-- Stand-in for `onBoundedFormulaInf` of the InfinitaryModelExistence roadmap (its Layer 0.1),
with the same signature and body: the symbol-by-symbol action of a language map. -/
def onBoundedFormulaInf (g : L →ᴸ L') :
    {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L' ι α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal (g.onTerm t₁) (g.onTerm t₂)
  | _, .rel R ts => .rel (g.onRelation R) fun i => g.onTerm (ts i)
  | _, .imp φ ψ => (onBoundedFormulaInf g φ).imp (onBoundedFormulaInf g ψ)
  | _, .all φ => (onBoundedFormulaInf g φ).all
  | _, .iSup φs => .iSup fun i => onBoundedFormulaInf g (φs i)
  | _, .iInf φs => .iInf fun i => onBoundedFormulaInf g (φs i)

end LanguageMaps

section EMModels

variable {L : FirstOrder.Language.{u, v}}

/-- An **Ehrenfeucht–Mostowski source** on a set `Γ` of formulas: a structure `N` with a sequence
`a : ℕ → N` such that `Γ` is closed under constructor components (it is the underlying set of a
`Fragment` of the InfinitaryModelExistence roadmap), contains the equality atom and
an atom for every relation symbol, every universal member of `Γ` has its counterexamples witnessed
by a term, and `a` is indiscernible for every member of `Γ` evaluated at terms in the sequence. The
template of `a` on `Γ` is then a Skolem template for `Γ` and these terms (README, Layer 2.2),
ω-complete because `Γ` is component-closed. -/
structure IsEMSource (Γ : Set (Σ n, BoundedFormulaω L Empty n)) (N : Type w) [L.Structure N]
    (a : ℕ → N) : Prop where
  imp_mem : ∀ {n} (φ ψ : BoundedFormulaω L Empty n), ⟨n, φ.imp ψ⟩ ∈ Γ →
    (⟨n, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ Γ ∧ (⟨n, ψ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ Γ
  all_mem : ∀ {n} (φ : BoundedFormulaω L Empty (n + 1)), ⟨n, φ.all⟩ ∈ Γ →
    (⟨n + 1, φ⟩ : Σ n, BoundedFormulaω L Empty n) ∈ Γ
  iSup_mem : ∀ {n} (φs : ℕ → BoundedFormulaω L Empty n) (i : ℕ),
    ⟨n, BoundedFormulaInf.iSup φs⟩ ∈ Γ → (⟨n, φs i⟩ : Σ n, BoundedFormulaω L Empty n) ∈ Γ
  iInf_mem : ∀ {n} (φs : ℕ → BoundedFormulaω L Empty n) (i : ℕ),
    ⟨n, BoundedFormulaInf.iInf φs⟩ ∈ Γ → (⟨n, φs i⟩ : Σ n, BoundedFormulaω L Empty n) ∈ Γ
  equal_mem : (⟨2, BoundedFormulaInf.equal (Term.var (Sum.inr 0)) (Term.var (Sum.inr 1))⟩ :
    Σ n, BoundedFormulaω L Empty n) ∈ Γ
  rel_mem : ∀ {l} (R : L.Relations l),
    (⟨l, BoundedFormulaInf.rel R fun i => Term.var (Sum.inr i)⟩ :
      Σ n, BoundedFormulaω L Empty n) ∈ Γ
  skolem : ∀ {n} (φ : BoundedFormulaω L Empty (n + 1)), ⟨n, φ.all⟩ ∈ Γ →
    ∃ t : L.Term (Empty ⊕ Fin n), ∀ xs : Fin n → N,
      (∃ y, ¬BoundedFormulaInf.Realize φ (Empty.elim : Empty → N) (Fin.snoc xs y)) →
        ¬BoundedFormulaInf.Realize φ (Empty.elim : Empty → N)
          (Fin.snoc xs (t.realize (Sum.elim (Empty.elim : Empty → N) xs)))
  indiscernible : ∀ p ∈ Γ, ∀ (m : ℕ) (τ : Fin p.1 → L.Term (Empty ⊕ Fin m)) (s t : Fin m ↪o ℕ),
    BoundedFormulaInf.Realize p.2 (Empty.elim : Empty → N)
        (fun i => (τ i).realize (Sum.elim (Empty.elim : Empty → N) (a ∘ s))) ↔
      BoundedFormulaInf.Realize p.2 (Empty.elim : Empty → N)
        (fun i => (τ i).realize (Sum.elim (Empty.elim : Empty → N) (a ∘ t)))

/-- **Layer 2 milestone, the Ehrenfeucht–Mostowski model with its cardinality bound.** An
Ehrenfeucht–Mostowski source over a language in `Language.{0, 0}` stretches to every linear order
`J`: the term model `EM(J, templateOf a)` agrees with `N` on the sentences of `Γ`, realizes the
template of `a` on `Γ` along its skeleton, and has cardinality at most `max ℵ₀ |J| |L_fun|`. The
skeleton is injective when `a` is. -/
theorem exists_emModel {L' : FirstOrder.Language.{0, 0}} {Γ : Set (Σ n, BoundedFormulaω L' Empty n)}
    {N : Type} [L'.Structure N] {a : ℕ → N} (h : IsEMSource Γ N a) (J : Type w) [LinearOrder J] :
    ∃ (E : Type w) (_ : L'.Structure E) (c : J → E),
      (∀ ψ : Sentenceω L', (⟨0, ψ⟩ : Σ n, BoundedFormulaω L' Empty n) ∈ Γ →
        (SentenceInf.Realize ψ N ↔ SentenceInf.Realize ψ E)) ∧
      (templateOf a).RealizesOn c Γ ∧
      #E ≤ max ℵ₀ (max #J (Cardinal.lift.{w} #(Σ n, L'.Functions n))) ∧
      (Function.Injective a → Function.Injective c) := by
  sorry

/-- **Layer 2 milestone, exact cardinality.** Over a language with countably many function
symbols, an injective source stretched along an infinite `J` gives a model of cardinality exactly
`#J`: the language term of `exists_emModel` is absorbed. -/
theorem exists_emModel_card_eq {L' : FirstOrder.Language.{0, 0}}
    [Countable (Σ n, L'.Functions n)] {Γ : Set (Σ n, BoundedFormulaω L' Empty n)} {N : Type}
    [L'.Structure N] {a : ℕ → N} (h : IsEMSource Γ N a) (ha : Function.Injective a)
    (J : Type w) [LinearOrder J] [Infinite J] :
    ∃ (E : Type w) (_ : L'.Structure E) (c : J → E),
      (∀ ψ : Sentenceω L', (⟨0, ψ⟩ : Σ n, BoundedFormulaω L' Empty n) ∈ Γ →
        (SentenceInf.Realize ψ N ↔ SentenceInf.Realize ψ E)) ∧
      (templateOf a).RealizesOn c Γ ∧ Function.Injective c ∧ #E = #J := by
  sorry

end EMModels

/-! ## Layer 3.3: approximation by homogeneous sets -/

section Approximation

variable {L' : FirstOrder.Language.{u'', v''}}

/-- **Layer 3.3.** `(pos, neg)` is approximated at `κ` in models of `σ`: some model `N ⊨ σ` with an
extra linear order on its carrier has a set `H` of size at least `κ` on whose increasing tuples
every member of `pos` is true and every member of `neg` false. The linear order is extra data, not
a symbol of `L'`. -/
def IsApproximatedAt (σ : Sentenceω L') (pos neg : Set (Σ n, BoundedFormulaω L' Empty n))
    (κ : Cardinal.{w}) : Prop :=
  ∃ (N : Type w) (_ : L'.Structure N) (_ : LinearOrder N) (H : Set N),
    SentenceInf.Realize σ N ∧ κ ≤ #H ∧
    ∀ (q : Σ n, BoundedFormulaω L' Empty n) (t : Fin q.1 ↪o N), (∀ i, t i ∈ H) →
      (q ∈ pos → BoundedFormulaInf.Realize q.2 (Empty.elim : Empty → N) t) ∧
      (q ∈ neg → ¬BoundedFormulaInf.Realize q.2 (Empty.elim : Empty → N) t)

/-- **Layer 3.3.** Approximated at `ℶ_α` for every `α < ω₁`. -/
def IsCofinallyApproximated (σ : Sentenceω L') (pos neg : Set (Σ n, BoundedFormulaω L' Empty n)) :
    Prop :=
  ∀ α : Ordinal.{w}, α < Ordinal.omega.{w} 1 → IsApproximatedAt σ pos neg (ℶ_ α)

/-- **Layer 3 milestone, the start condition.** Under the cofinal hypothesis, the sentence and
`x₀ ≠ x₁` are cofinally approximated. -/
theorem isCofinallyApproximated_start {σ : Sentenceω L'}
    (h : ∀ α : Ordinal.{w}, α < Ordinal.omega.{w} 1 →
      ∃ (N : Type w) (_ : L'.Structure N), SentenceInf.Realize σ N ∧ ℶ_ α ≤ #N) :
    IsCofinallyApproximated.{w} σ {⟨0, σ⟩, ⟨2, disEq⟩} ∅ := by
  sorry

/-- **Layer 3 milestone, decision.** A cofinally approximated condition can be extended by either
truth value of any formula, and one of the two extensions is again cofinally approximated. -/
theorem IsCofinallyApproximated.decide {σ : Sentenceω L'}
    {pos neg : Set (Σ n, BoundedFormulaω L' Empty n)}
    (h : IsCofinallyApproximated.{w} σ pos neg) (ψ : Σ n, BoundedFormulaω L' Empty n) :
    IsCofinallyApproximated.{w} σ (insert ψ pos) neg ∨
      IsCofinallyApproximated.{w} σ pos (insert ψ neg) := by
  sorry

/-- **Layer 3 milestone, disjunction witnesses.** -/
theorem IsCofinallyApproximated.exists_iSup_witness {σ : Sentenceω L'}
    {pos neg : Set (Σ n, BoundedFormulaω L' Empty n)}
    (h : IsCofinallyApproximated.{w} σ pos neg) {n : ℕ}
    {ψs : ℕ → BoundedFormulaω L' Empty n} (hψ : ⟨n, BoundedFormulaInf.iSup ψs⟩ ∈ pos) :
    ∃ i, IsCofinallyApproximated.{w} σ (insert ⟨n, ψs i⟩ pos) neg := by
  sorry

/-- **Layer 3 milestone, conjunction witnesses.** -/
theorem IsCofinallyApproximated.exists_iInf_witness {σ : Sentenceω L'}
    {pos neg : Set (Σ n, BoundedFormulaω L' Empty n)}
    (h : IsCofinallyApproximated.{w} σ pos neg) {n : ℕ}
    {ψs : ℕ → BoundedFormulaω L' Empty n} (hψ : ⟨n, BoundedFormulaInf.iInf ψs⟩ ∈ neg) :
    ∃ i, IsCofinallyApproximated.{w} σ pos (insert ⟨n, ψs i⟩ neg) := by
  sorry

end Approximation

/-! ## Layer 3: Hanf bounds and the Morley–Hanf theorem -/

section Hanf

variable {L : FirstOrder.Language.{u, v}}

/-- A sentence has arbitrarily large models in the universe `w`. From `κ = 1` on these models are
nonempty, so no nonemptiness condition is needed here. -/
def HasArbLargeModels (φ : Sentenceω L) : Prop :=
  ∀ κ : Cardinal.{w}, ∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ κ ≤ #M

/-- `κ` is a Hanf bound for `φ`: a nonempty model of size at least `κ` forces arbitrarily large
models. Empty models are not counted, so that Hanf bounds and Hanf numbers are invariant under
language expansion: otherwise `∀x ⊥` over the empty language would have Hanf number `1` and its
image in a language with a constant, which has no model, Hanf number `0`. -/
def IsHanfBound (φ : Sentenceω L) (κ : Cardinal.{w}) : Prop :=
  (∃ (M : Type w) (_ : L.Structure M), Nonempty M ∧ SentenceInf.Realize φ M ∧ κ ≤ #M) →
    HasArbLargeModels.{u, v, w} φ

/-- The Hanf number of a sentence: its least Hanf bound. -/
noncomputable def hanfNumber (φ : Sentenceω L) : Cardinal.{w} :=
  sInf {κ : Cardinal.{w} | IsHanfBound φ κ}

/-- Every sentence has a Hanf bound, so the infimum is attained. -/
theorem hanfNumber_isHanfBound (φ : Sentenceω L) :
    IsHanfBound φ (hanfNumber.{u, v, w} φ) := by
  sorry

/-- **Layer 3 milestone, extraction of an Ehrenfeucht–Mostowski source from the cofinal
hypothesis.** If `φ` has models of cardinality at least `ℶ_α` for every `α < ω₁`, there are a
countable language `L'` with a language map `g : L →ᴸ L'` (sending each symbol of `φ` to its copy
in the Skolem extension, and every other symbol to a dummy), a countable set `Γ` containing the image of `φ`,
and an injective Ehrenfeucht–Mostowski source on `Γ` in a model of the image of `φ`. -/
theorem exists_emSource_of_forall_beth (φ : Sentenceω L)
    (h : ∀ α < Ordinal.omega.{w} 1,
      ∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ ℶ_ α ≤ #M) :
    ∃ (L' : FirstOrder.Language.{0, 0}) (_ : Countable (Σ n, L'.Functions n))
      (_ : Countable (Σ n, L'.Relations n)) (g : L →ᴸ L')
      (Γ : Set (Σ n, BoundedFormulaω L' Empty n)) (N : Type) (_ : L'.Structure N) (a : ℕ → N),
      Γ.Countable ∧ IsEMSource Γ N a ∧ Function.Injective a ∧
      (⟨0, onBoundedFormulaInf g φ⟩ : Σ n, BoundedFormulaω L' Empty n) ∈ Γ ∧
      SentenceInf.Realize (onBoundedFormulaInf g φ) N := by
  sorry

/-- **Layer 3 milestone, the Morley–Hanf theorem with exact cardinalities.** A sentence with
models of size at least `ℶ_α` for every `α < ω₁` has a model of every infinite cardinality: apply
`exists_emModel_card_eq` to the source of `exists_emSource_of_forall_beth` along
`κ.ord.ToType`, and take the reduct along `g`. -/
theorem exists_model_card_eq_of_forall_beth (φ : Sentenceω L)
    (h : ∀ α < Ordinal.omega.{w} 1,
      ∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ ℶ_ α ≤ #M)
    {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) :
    ∃ (N : Type w) (_ : L.Structure N), SentenceInf.Realize φ N ∧ #N = κ := by
  sorry

/-- **Layer 3 headline, the Morley–Hanf theorem.** `ℶ_ω₁` is a Hanf bound for every Lω₁ω
sentence, over any language. -/
theorem morley_hanf (φ : Sentenceω L) :
    IsHanfBound φ (ℶ_ (Ordinal.omega.{w} 1)) := by
  sorry

theorem hanfNumber_le_beth_omega_one (φ : Sentenceω L) :
    hanfNumber.{u, v, w} φ ≤ ℶ_ (Ordinal.omega.{w} 1) := by
  sorry

/-- **Layer 3, Morley's omitting-types theorem**, over any language. Partial first-order types are
tagged with their arity. Countability of each type is a hypothesis separate from countability of
the family: without it the omitting sentence is not in Lω₁ω, and the theorem fails (README 3.4). -/
theorem morley_omitting_types (T : L.Theory) (S : Set (Σ n, Set (L.BoundedFormula Empty n)))
    (hT : T.Countable) (hS : S.Countable) (hSc : ∀ p ∈ S, p.2.Countable)
    (h : ∀ α < Ordinal.omega.{w} 1, ∃ (M : Type w) (_ : L.Structure M), T.Model M ∧
      (∀ p ∈ S, ∀ a : Fin p.1 → M, ∃ θ ∈ p.2, ¬ θ.Realize Empty.elim a) ∧ ℶ_ α ≤ #M)
    {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) :
    ∃ (M : Type w) (_ : L.Structure M), T.Model M ∧
      (∀ p ∈ S, ∀ a : Fin p.1 → M, ∃ θ ∈ p.2, ¬ θ.Realize Empty.elim a) ∧ #M = κ := by
  sorry

/-- **Layer 3.** Over a language with countably many symbols, only the family of types needs to be
countable. -/
theorem morley_omitting_types_of_countable [Countable (Σ n, L.Functions n)]
    [Countable (Σ n, L.Relations n)] (T : L.Theory)
    (S : Set (Σ n, Set (L.BoundedFormula Empty n))) (hS : S.Countable)
    (h : ∀ α < Ordinal.omega.{w} 1, ∃ (M : Type w) (_ : L.Structure M), T.Model M ∧
      (∀ p ∈ S, ∀ a : Fin p.1 → M, ∃ θ ∈ p.2, ¬ θ.Realize Empty.elim a) ∧ ℶ_ α ≤ #M)
    {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) :
    ∃ (M : Type w) (_ : L.Structure M), T.Model M ∧
      (∀ p ∈ S, ∀ a : Fin p.1 → M, ∃ θ ∈ p.2, ¬ θ.Realize Empty.elim a) ∧ #M = κ := by
  sorry

end Hanf

/-! ## Layer 4: the Hanf number of Lω₁ω -/

section Sharpness

/-- A cardinal that is a Hanf bound for every sentence of every language in `Language.{u, v}`. -/
def IsLω₁ωHanfBound (κ : Cardinal.{w}) : Prop :=
  ∀ (L : FirstOrder.Language.{u, v}) (φ : Sentenceω L), IsHanfBound φ κ

/-- The Hanf number of the logic Lω₁ω, for languages in `Language.{u, v}` and models in
`Type w`. -/
noncomputable def lomega1omegaHanfNumber : Cardinal.{w} :=
  sInf {κ : Cardinal.{w} | IsLω₁ωHanfBound.{u, v, w} κ}

/-- **Layer 4, bounded spectra.** For each `α < ω₁`, a sentence of a countable language has a
model of size exactly `ℶ_(α+1)` and no larger model. -/
theorem exists_sentence_maximal_model {α : Ordinal.{w}} (hα : α < Ordinal.omega 1) :
    ∃ (L : FirstOrder.Language.{u, v}) (_ : Countable (Σ n, L.Functions n))
      (_ : Countable (Σ n, L.Relations n)) (φ : Sentenceω L),
      (∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ #M = ℶ_ (α + 1)) ∧
      ∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M → #M ≤ ℶ_ (α + 1) := by
  sorry

/-- **Layer 4 headline, sharpness:** `Hanf(Lω₁ω) = ℶ_ω₁`. -/
theorem lomega1omegaHanfNumber_eq_beth_omega_one :
    lomega1omegaHanfNumber.{u, v, w} = ℶ_ (Ordinal.omega.{w} 1) := by
  sorry

end Sharpness

/-! ## Layer 5: small models, complete sentences and categoricity -/

section Small

variable {L : FirstOrder.Language.{u, v}}

/-! Owner: InfinitaryModelExistence (TauCetiRoadmap #1315), Layer 4.1. Declarations:
`infinitaryType`, `realizedTypes`. Checked against revision 6da153fb of that roadmap. Scaffolding
only. -/

/-- Stand-in for `infinitaryType` of the InfinitaryModelExistence roadmap (its Layer 4.1), with the
same signature and body: the complete Lω₁ω-type of a tuple, i.e. all formulas in `n` bound
variables true of it. -/
def infinitaryType (M : Type w) [L.Structure M] {n : ℕ} (a : Fin n → M) :
    Set (BoundedFormulaω L Empty n) :=
  {φ | φ.Realize Empty.elim a}

/-- Stand-in for `realizedTypes` of the InfinitaryModelExistence roadmap (its Layer 4.1): the
complete types realized in `M` at arity `n`. -/
def realizedTypes (M : Type w) [L.Structure M] (n : ℕ) : Set (Set (BoundedFormulaω L Empty n)) :=
  Set.range (infinitaryType M (n := n))

/-- A structure is Lω₁ω-small when it realizes only countably many complete Lω₁ω-types in each
finite number of variables. -/
def IsLω₁ωSmall (M : Type w) [L.Structure M] : Prop :=
  ∀ n, (realizedTypes (L := L) M n).Countable

theorem isLω₁ωSmall_of_countable (M : Type w) [L.Structure M] [Countable M] :
    IsLω₁ωSmall (L := L) M := by
  sorry

/-- A linear order is highly order-transitive when any two increasing tuples of the same length
are conjugate by an order automorphism. -/
def HighlyOrderTransitive (J : Type*) [LinearOrder J] : Prop :=
  ∀ (n : ℕ) (s t : Fin n ↪o J), ∃ e : J ≃o J, ∀ i, e (s i) = t i

/-- Every ordered field is highly order-transitive, by piecewise-affine automorphisms. -/
theorem HighlyOrderTransitive.of_field (K : Type*) [Field K] [LinearOrder K]
    [IsStrictOrderedRing K] : HighlyOrderTransitive K := by
  sorry

/-- Every infinite cardinal carries a highly order-transitive linear order. -/
theorem exists_highlyOrderTransitive {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) :
    ∃ (J : Type w) (_ : LinearOrder J), #J = κ ∧ HighlyOrderTransitive J := by
  sorry

/-- **Layer 5 milestone, small models.** Under the Morley–Hanf hypothesis, `φ` has an Lω₁ω-small
model of every infinite cardinality. -/
theorem exists_small_model_card_eq (φ : Sentenceω L)
    (h : ∀ α < Ordinal.omega.{w} 1,
      ∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ ℶ_ α ≤ #M)
    {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) :
    ∃ (N : Type w) (_ : L.Structure N), SentenceInf.Realize φ N ∧ #N = κ ∧
      IsLω₁ωSmall (L := L) N := by
  sorry

/-- A sentence is complete when it decides every Lω₁ω sentence on its models in `Type w`. -/
def IsCompleteSentence (σ : Sentenceω L) : Prop :=
  ∀ ψ : Sentenceω L,
    (∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize σ M → SentenceInf.Realize ψ M) ∨
      (∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize σ M → ¬SentenceInf.Realize ψ M)

/-- `φ` is `κ`-categorical: any two of its models of cardinality `κ` are isomorphic. -/
def IsCategorical (φ : Sentenceω L) (κ : Cardinal.{w}) : Prop :=
  ∀ (M N : Type w) (_ : L.Structure M) (_ : L.Structure N), SentenceInf.Realize φ M →
    SentenceInf.Realize φ N → #M = κ → #N = κ → Nonempty (M ≃[L] N)

/-- **Layer 5 milestone, small structures satisfy complete sentences.** For a countable relational
language, a structure is Lω₁ω-small exactly when it satisfies a complete sentence. -/
theorem isLω₁ωSmall_iff_exists_isCompleteSentence [L.IsRelational]
    [Countable (Σ l, L.Relations l)] (M : Type w) [L.Structure M] :
    IsLω₁ωSmall (L := L) M ↔
      ∃ σ : Sentenceω L, IsCompleteSentence.{u, v, w} σ ∧ SentenceInf.Realize σ M := by
  sorry

/-- **Layer 5 headline, categorical completions.** A `κ`-categorical sentence of a countable
relational language satisfying the Morley–Hanf hypothesis has a complete strengthening with a model
of cardinality `κ`, and that strengthening is `κ`-categorical. -/
theorem exists_isCompleteSentence_isCategorical [L.IsRelational]
    [Countable (Σ l, L.Relations l)] (φ : Sentenceω L)
    (h : ∀ α < Ordinal.omega.{w} 1,
      ∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize φ M ∧ ℶ_ α ≤ #M)
    {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ) (hcat : IsCategorical φ κ) :
    ∃ σ : Sentenceω L, IsCompleteSentence.{u, v, w} σ ∧
      (∀ (M : Type w) (_ : L.Structure M), SentenceInf.Realize σ M → SentenceInf.Realize φ M) ∧
      (∃ (M : Type w) (_ : L.Structure M), SentenceInf.Realize σ M ∧ #M = κ) ∧
      IsCategorical σ κ := by
  sorry

end Small

end TauCetiRoadmap.HanfNumbers

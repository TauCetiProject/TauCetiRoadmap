import Mathlib

/-!
# Sequent calculus and cut elimination: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The structural lemmas of Layer 1 (weakening,
substitution, inversion), the consistency property of Layer 2 and the reduction lemma of Layer 3
are README targets on the way to these statements and are not restated, and neither are the
README's Checks.

Formulas are Mathlib's first-order formulas `L.Formula ℕ` over an arbitrary language `L`, with
free variables indexed by `ℕ` and de Bruijn-style bound positions; the primitive connectives are
`⊥`, implication and the universal quantifier, and equality is logical. A sequent is a pair of
finite sets of formulas, so exchange and contraction are built in and weakening is admissible.
Derivations are a `Type`-valued inductive family with one constructor per rule, and carry a height
and a cut rank. A sequent is valid when every assignment of the free variables in every structure
that makes all of its antecedent true makes some formula of its succedent true; an assignment
`ℕ → M` exists only on a nonempty carrier, so empty structures play no role.
-/

noncomputable section

open FirstOrder Language BoundedFormula

namespace TauCetiRoadmap.SequentCalculusAndCutElimination

universe u v w

variable {L : FirstOrder.Language.{u, v}}

/-! ## Layer 1: the calculus -/

/-- 1.1 The instance of a formula with `k` bound positions at a tuple of terms: the bound
positions are replaced by the terms `ts`, the free variables are kept. -/
def inst {k : ℕ} (φ : L.BoundedFormula ℕ k) (ts : Fin k → L.Term ℕ) : L.Formula ℕ :=
  φ.toFormula.subst (Sum.elim Term.var ts)

/-- 1.1 The depth of a formula: `0` for `⊥` and atomic formulas, one more than the larger depth
of the two sides for an implication, and one more than the depth of the body for a universal
quantifier. -/
def depth {α : Type*} : {n : ℕ} → L.BoundedFormula α n → ℕ
  | _, .imp φ ψ => max (depth φ) (depth ψ) + 1
  | _, .all φ => depth φ + 1
  | _, _ => 0

open Classical in
/-- 1.2 Derivations of the two-sided sequent calculus `LK` with equality. A sequent `Γ ⇒ Δ` is a
pair of finite sets of formulas. The principal formula of a logical rule stays in the premises,
initial sequents share an atomic formula or have `⊥` in the antecedent, the eigenvariable `y` of
the right universal rule occurs free in no formula of the conclusion, and the equality rules are
reflexivity and replacement in atomic formulas, both acting on the antecedent. -/
inductive LKDerivation : Finset (L.Formula ℕ) → Finset (L.Formula ℕ) → Type (max u v)
  | ax {Γ Δ : Finset (L.Formula ℕ)} (φ : L.Formula ℕ) (hφ : φ.IsAtomic) (hΓ : φ ∈ Γ)
      (hΔ : φ ∈ Δ) : LKDerivation Γ Δ
  | botL {Γ Δ : Finset (L.Formula ℕ)} (h : (⊥ : L.Formula ℕ) ∈ Γ) : LKDerivation Γ Δ
  | impL {Γ Δ : Finset (L.Formula ℕ)} (φ ψ : L.Formula ℕ) (h : φ.imp ψ ∈ Γ)
      (d₁ : LKDerivation Γ (insert φ Δ)) (d₂ : LKDerivation (insert ψ Γ) Δ) : LKDerivation Γ Δ
  | impR {Γ Δ : Finset (L.Formula ℕ)} (φ ψ : L.Formula ℕ) (h : φ.imp ψ ∈ Δ)
      (d : LKDerivation (insert φ Γ) (insert ψ Δ)) : LKDerivation Γ Δ
  | allL {Γ Δ : Finset (L.Formula ℕ)} (φ : L.BoundedFormula ℕ 1) (t : L.Term ℕ) (h : φ.all ∈ Γ)
      (d : LKDerivation (insert (inst φ ![t]) Γ) Δ) : LKDerivation Γ Δ
  | allR {Γ Δ : Finset (L.Formula ℕ)} (φ : L.BoundedFormula ℕ 1) (y : ℕ) (h : φ.all ∈ Δ)
      (hy : ∀ ψ ∈ Γ ∪ Δ, y ∉ BoundedFormula.freeVarFinset ψ)
      (d : LKDerivation Γ (insert (inst φ ![Term.var y]) Δ)) : LKDerivation Γ Δ
  | ref {Γ Δ : Finset (L.Formula ℕ)} (t : L.Term ℕ) (d : LKDerivation (insert (t.equal t) Γ) Δ) :
      LKDerivation Γ Δ
  | repl {Γ Δ : Finset (L.Formula ℕ)} (φ : L.BoundedFormula ℕ 1) (hφ : φ.IsAtomic)
      (s t : L.Term ℕ) (h₁ : s.equal t ∈ Γ) (h₂ : inst φ ![s] ∈ Γ)
      (d : LKDerivation (insert (inst φ ![t]) Γ) Δ) : LKDerivation Γ Δ
  | cut {Γ Δ : Finset (L.Formula ℕ)} (φ : L.Formula ℕ) (d₁ : LKDerivation Γ (insert φ Δ))
      (d₂ : LKDerivation (insert φ Γ) Δ) : LKDerivation Γ Δ

namespace LKDerivation

variable {Γ Δ : Finset (L.Formula ℕ)}

/-- 1.2 The height of a derivation: `0` for an initial sequent, and one more than the largest
height of the premises for every other rule. -/
def height : {Γ Δ : Finset (L.Formula ℕ)} → LKDerivation Γ Δ → ℕ
  | _, _, .ax .. => 0
  | _, _, .botL _ => 0
  | _, _, .impL _ _ _ d₁ d₂ => max d₁.height d₂.height + 1
  | _, _, .impR _ _ _ d => d.height + 1
  | _, _, .allL _ _ _ d => d.height + 1
  | _, _, .allR _ _ _ _ d => d.height + 1
  | _, _, .ref _ d => d.height + 1
  | _, _, .repl _ _ _ _ _ _ d => d.height + 1
  | _, _, .cut _ d₁ d₂ => max d₁.height d₂.height + 1

/-- 1.2 The cut rank of a derivation: the largest value of `depth φ + 1` over the cut formulas
`φ` of its cuts, and `0` when it has no cut. -/
def cutRank : {Γ Δ : Finset (L.Formula ℕ)} → LKDerivation Γ Δ → ℕ
  | _, _, .ax .. => 0
  | _, _, .botL _ => 0
  | _, _, .impL _ _ _ d₁ d₂ => max d₁.cutRank d₂.cutRank
  | _, _, .impR _ _ _ d => d.cutRank
  | _, _, .allL _ _ _ d => d.cutRank
  | _, _, .allR _ _ _ _ d => d.cutRank
  | _, _, .ref _ d => d.cutRank
  | _, _, .repl _ _ _ _ _ _ d => d.cutRank
  | _, _, .cut φ d₁ d₂ => max (depth φ + 1) (max d₁.cutRank d₂.cutRank)

/-- 1.2 The formulas occurring in a derivation: those of its end sequent and those occurring in
the derivations of its premises. -/
def formulas : {Γ Δ : Finset (L.Formula ℕ)} → LKDerivation Γ Δ → Set (L.Formula ℕ)
  | Γ, Δ, .ax .. => ↑Γ ∪ ↑Δ
  | Γ, Δ, .botL _ => ↑Γ ∪ ↑Δ
  | Γ, Δ, .impL _ _ _ d₁ d₂ => ↑Γ ∪ ↑Δ ∪ d₁.formulas ∪ d₂.formulas
  | Γ, Δ, .impR _ _ _ d => ↑Γ ∪ ↑Δ ∪ d.formulas
  | Γ, Δ, .allL _ _ _ d => ↑Γ ∪ ↑Δ ∪ d.formulas
  | Γ, Δ, .allR _ _ _ _ d => ↑Γ ∪ ↑Δ ∪ d.formulas
  | Γ, Δ, .ref _ d => ↑Γ ∪ ↑Δ ∪ d.formulas
  | Γ, Δ, .repl _ _ _ _ _ _ d => ↑Γ ∪ ↑Δ ∪ d.formulas
  | Γ, Δ, .cut _ d₁ d₂ => ↑Γ ∪ ↑Δ ∪ d₁.formulas ∪ d₂.formulas

end LKDerivation

/-! ## Layer 2: soundness and cut-free completeness -/

/-- 2.1 Validity of a sequent: in every structure on a carrier in the universe `max u v`, every
assignment of the free variables that makes every formula of `Γ` true makes some formula of `Δ`
true. -/
def Valid (Γ Δ : Finset (L.Formula ℕ)) : Prop :=
  ∀ (M : Type (max u v)) [L.Structure M] (v : ℕ → M),
    (∀ φ ∈ Γ, φ.Realize v) → ∃ ψ ∈ Δ, ψ.Realize v

/-- 2.1 Soundness: if `Γ ⇒ Δ` has a derivation, then in every structure, on a carrier in any
universe, every assignment that makes every formula of `Γ` true makes some formula of `Δ`
true. -/
theorem LKDerivation.sound {Γ Δ : Finset (L.Formula ℕ)} (d : LKDerivation Γ Δ) (M : Type w)
    [L.Structure M] (v : ℕ → M) (hΓ : ∀ φ ∈ Γ, φ.Realize v) : ∃ ψ ∈ Δ, ψ.Realize v := by
  sorry

/-- 2.3 Completeness of the cut-free calculus: every valid sequent, over any language, has a
derivation without cuts. -/
theorem exists_cutRank_eq_zero_of_valid {Γ Δ : Finset (L.Formula ℕ)} (h : Valid Γ Δ) :
    ∃ d : LKDerivation Γ Δ, d.cutRank = 0 := by
  sorry

open Classical in
/-- 2.4 Completeness for theories: a first-order theory `T` entails a sentence `φ`, in the sense
of Mathlib's `Theory.ModelsBoundedFormula`, if and only if for some finite subset `T₀` of `T` the
sequent `T₀ ⇒ φ`, read as a sequent of formulas, has a derivation without cuts. -/
theorem models_iff_exists_cutRank_eq_zero {T : L.Theory} {φ : L.Sentence} :
    T ⊨ᵇ φ ↔ ∃ T₀ : Finset L.Sentence, ↑T₀ ⊆ T ∧
      ∃ d : LKDerivation (T₀.image (Formula.relabel (Empty.elim : Empty → ℕ)))
        {Formula.relabel (Empty.elim : Empty → ℕ) φ}, d.cutRank = 0 := by
  sorry

/-! ## Layer 3: syntactic cut elimination and the subformula property -/

/-- 3.3 The iterated exponential: `tower 0 h = h` and `tower (c + 1) h = 2 ^ tower c h`, a stack
of `c` twos topped by `h`. -/
def tower : ℕ → ℕ → ℕ
  | 0, h => h
  | c + 1, h => 2 ^ tower c h

/-- 3.3 Cut elimination with a height bound: a derivation of height `h` and cut rank `c` can be
replaced by a derivation of the same sequent without cuts whose height is at most `tower c h`. -/
theorem LKDerivation.exists_cutRank_eq_zero_height_le {Γ Δ : Finset (L.Formula ℕ)}
    (d : LKDerivation Γ Δ) :
    ∃ d' : LKDerivation Γ Δ, d'.cutRank = 0 ∧ d'.height ≤ tower d.cutRank d.height := by
  sorry

/-- 3.4 The subformula instances of a set `S` of formulas: the members of `S`, both sides of an
implication that is a subformula instance, and every instance `φ[t]` of a universal formula `∀φ`
that is a subformula instance. -/
inductive IsSubformulaInstance (S : Set (L.Formula ℕ)) : L.Formula ℕ → Prop
  | mem {φ : L.Formula ℕ} (h : φ ∈ S) : IsSubformulaInstance S φ
  | impLeft {φ ψ : L.Formula ℕ} (h : IsSubformulaInstance S (φ.imp ψ)) : IsSubformulaInstance S φ
  | impRight {φ ψ : L.Formula ℕ} (h : IsSubformulaInstance S (φ.imp ψ)) :
      IsSubformulaInstance S ψ
  | inst {φ : L.BoundedFormula ℕ 1} (t : L.Term ℕ) (h : IsSubformulaInstance S φ.all) :
      IsSubformulaInstance S (inst φ ![t])

/-- 3.4 The subformula property: every formula occurring in a derivation without cuts is atomic or
a subformula instance of a formula of its end sequent. -/
theorem LKDerivation.subformula_property {Γ Δ : Finset (L.Formula ℕ)} (d : LKDerivation Γ Δ)
    (hd : d.cutRank = 0) :
    ∀ ψ ∈ d.formulas, ψ.IsAtomic ∨ IsSubformulaInstance (↑Γ ∪ ↑Δ) ψ := by
  sorry

/-! ## Layer 4: Herbrand's theorem -/

/-- 4.1 A formula is valid when the sequent with empty antecedent and the formula as its only
succedent formula is valid. -/
def IsValid (φ : L.Formula ℕ) : Prop :=
  Valid ∅ {φ}

/-- 4.1 The disjunction of a list of formulas, `φ₁ ⊔ (φ₂ ⊔ ⋯ ⊔ (φₘ ⊔ ⊥))`, where Mathlib's
`φ ⊔ ψ` is `¬φ → ψ`; the empty disjunction is `⊥`. -/
def disjunction (l : List (L.Formula ℕ)) : L.Formula ℕ :=
  l.foldr (· ⊔ ·) ⊥

/-- 4.1 The truth value of a formula under an assignment `τ` of truth values to formulas: `⊥` is
false, an implication is material implication, and every other formula (an atomic formula or a
universal formula) takes the value `τ` gives it. -/
def truthValue (τ : (n : ℕ) → L.BoundedFormula ℕ n → Prop) :
    {n : ℕ} → L.BoundedFormula ℕ n → Prop
  | _, .falsum => False
  | _, .imp φ ψ => truthValue τ φ → truthValue τ ψ
  | n, φ => τ n φ

/-- 4.1 A propositional tautology: a formula true under every assignment of truth values to its
atomic (and universal) subformulas. -/
def IsTautology (φ : L.Formula ℕ) : Prop :=
  ∀ τ : (n : ℕ) → L.BoundedFormula ℕ n → Prop, truthValue τ φ

/-- 4.1 A formula is equality-free when no atomic subformula is an equation. -/
def IsEqualityFree {α : Type*} : {n : ℕ} → L.BoundedFormula α n → Prop
  | _, .falsum => True
  | _, .equal _ _ => False
  | _, .rel _ _ => True
  | _, .imp φ ψ => IsEqualityFree φ ∧ IsEqualityFree ψ
  | _, .all φ => IsEqualityFree φ

/-- 4.2 Herbrand's theorem: for a quantifier-free `φ` with `k` bound positions, the formula
`∃ x₁ … xₖ, φ` is valid if and only if some finite disjunction of instances of `φ` at `k`-tuples
of terms is valid. -/
theorem herbrand {k : ℕ} {φ : L.BoundedFormula ℕ k} (hφ : φ.IsQF) :
    IsValid φ.exs ↔ ∃ l : List (Fin k → L.Term ℕ), IsValid (disjunction (l.map (inst φ))) := by
  sorry

/-- 4.3 Herbrand's theorem for equality-free formulas: for a quantifier-free, equality-free `φ`
with `k` bound positions, the formula `∃ x₁ … xₖ, φ` is valid if and only if some finite
disjunction of instances of `φ` at `k`-tuples of terms is a propositional tautology. -/
theorem herbrand_isTautology {k : ℕ} {φ : L.BoundedFormula ℕ k} (hφ : φ.IsQF)
    (he : IsEqualityFree φ) :
    IsValid φ.exs ↔
      ∃ l : List (Fin k → L.Term ℕ), IsTautology (disjunction (l.map (inst φ))) := by
  sorry

end TauCetiRoadmap.SequentCalculusAndCutElimination

import Mathlib

/-!
# The simply typed λ-calculus: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

Terms are untyped λ-terms with de Bruijn indices, `Term.var i`, `Term.app s t` and `Term.lam t`,
where the index `0` refers to the nearest enclosing `lam`. `Term.shift t k` raises every index
`i ≥ k` of `t` by one, and `Term.subst t s k` replaces the index `k` of `t` by `s`, lowers every
index above `k` by one, and shifts `s` when it passes under a binder. β-reduction `Beta` is the
closure of `(lam s) t ↦ s.subst t 0` under all term formers, and strong normalization `SN t` is
accessibility of `t` for the converse of `Beta`. Types are simple types over an arbitrary type `ι`
of base types, and typing `HasType Γ t A` is assignment of types to untyped terms (typing à la
Curry) in a context `Γ : List (Ty ι)` whose entry `i` is the type of the index `i`.
-/

namespace TauCetiRoadmap.SimplyTypedLambdaCalculus

open Relation

universe u

/-! ## Layer 1: terms, shifting and substitution -/

/-- 1.1 Untyped λ-terms with de Bruijn indices. -/
inductive Term : Type
  | var : ℕ → Term
  | app : Term → Term → Term
  | lam : Term → Term
  deriving DecidableEq

namespace Term

/-- 1.1 `shift t k` raises by one every index of `t` that is at least `k`, where `k` is
incremented under each binder. -/
def shift : Term → ℕ → Term
  | var i, k => if i < k then var i else var (i + 1)
  | app s t, k => app (shift s k) (shift t k)
  | lam t, k => lam (shift t (k + 1))

/-- 1.1 `subst t s k` replaces the index `k` of `t` by `s`, lowers every index above `k` by one
and leaves the indices below `k` alone; under a binder, `k` is incremented and `s` is shifted. -/
def subst : Term → Term → ℕ → Term
  | var i, s, k => if k < i then var (i - 1) else if i = k then s else var i
  | app t₁ t₂, s, k => app (subst t₁ s k) (subst t₂ s k)
  | lam t, s, k => lam (subst t (shift s 0) (k + 1))

/-- 1.2 Simultaneous substitution: `substAll t σ` replaces every free index `i` of `t` by `σ i`;
under a binder the index `0` is kept and the index `i + 1` is sent to `shift (σ i) 0`. -/
def substAll : Term → (ℕ → Term) → Term
  | var i, σ => σ i
  | app s t, σ => app (substAll s σ) (substAll t σ)
  | lam t, σ => lam (substAll t fun i => Nat.casesOn i (var 0) fun j => shift (σ j) 0)

/-- 1.2 The substitution lemma for de Bruijn indices: for `i ≤ j`, substituting `v` for `j` after
substituting `u` for `i` is substituting `u.subst v j` for `i` after substituting
`v.shift i` for `j + 1`. -/
theorem subst_subst {i j : ℕ} (hij : i ≤ j) (t u v : Term) :
    (t.subst (v.shift i) (j + 1)).subst (u.subst v j) i = (t.subst u i).subst v j := by
  sorry

end Term

open Term

/-! ## Layer 2: β-reduction and the Church–Rosser theorem -/

/-- 2.1 One-step β-reduction: contraction of one redex `(lam s) t ↦ s.subst t 0` anywhere in a
term. -/
inductive Beta : Term → Term → Prop
  | beta (s t : Term) : Beta (app (lam s) t) (s.subst t 0)
  | appL {s s' : Term} (t : Term) : Beta s s' → Beta (app s t) (app s' t)
  | appR (s : Term) {t t' : Term} : Beta t t' → Beta (app s t) (app s t')
  | lam {s s' : Term} : Beta s s' → Beta (lam s) (lam s')

/-- 2.2 Parallel reduction of Tait and Martin-Löf: any set of redexes present in the term is
contracted in one step. -/
inductive ParRed : Term → Term → Prop
  | var (i : ℕ) : ParRed (var i) (var i)
  | app {s s' t t' : Term} : ParRed s s' → ParRed t t' → ParRed (app s t) (app s' t')
  | lam {s s' : Term} : ParRed s s' → ParRed (lam s) (lam s')
  | beta {s s' t t' : Term} : ParRed s s' → ParRed t t' →
      ParRed (app (lam s) t) (s'.subst t' 0)

/-- 2.2 The complete development: every redex present in the term is contracted. -/
def develop : Term → Term
  | var i => var i
  | app (lam s) t => (develop s).subst (develop t) 0
  | app s t => app (develop s) (develop t)
  | lam s => lam (develop s)

/-- 2.2 Parallel reduction and β-reduction have the same reflexive transitive closure. -/
theorem reflTransGen_parRed_iff {t u : Term} :
    ReflTransGen ParRed t u ↔ ReflTransGen Beta t u := by
  sorry

/-- 2.2 Every parallel reduct of `t` parallel-reduces to the complete development of `t`; in
particular parallel reduction has the diamond property. -/
theorem ParRed.parRed_develop {t u : Term} (h : ParRed t u) : ParRed u (develop t) := by
  sorry

/-- 2.3 The Church–Rosser theorem for β-reduction: two multi-step reducts of one term have a
common multi-step reduct. -/
theorem church_rosser {t u v : Term} (hu : ReflTransGen Beta t u) (hv : ReflTransGen Beta t v) :
    Join (ReflTransGen Beta) u v := by
  sorry

/-! ## Layer 3: normal forms and normalization -/

/-- 3.1 A term is β-normal when it has no β-reduct. -/
def IsNormal (t : Term) : Prop :=
  ∀ u, ¬ Beta t u

/-- 3.1 Strong normalization: `t` is accessible for the converse of β-reduction, so every
β-reduction sequence from `t` is finite. -/
def SN (t : Term) : Prop :=
  Acc (fun u v => Beta v u) t

/-- 3.2 β-convertibility, the equivalence relation generated by β-reduction, is joinability by
multi-step β-reduction. -/
theorem eqvGen_beta_iff_join {t u : Term} :
    EqvGen Beta t u ↔ Join (ReflTransGen Beta) t u := by
  sorry

/-- 3.2 Two β-convertible β-normal terms are equal. With de Bruijn indices, equality is equality
up to renaming of bound variables. -/
theorem eq_of_eqvGen_of_isNormal {u v : Term} (h : EqvGen Beta u v) (hu : IsNormal u)
    (hv : IsNormal v) : u = v := by
  sorry

/-! ## Layer 4: simple types and subject reduction -/

/-- 4.1 Simple types over a type `ι` of base types. -/
inductive Ty (ι : Type u) : Type u
  | base : ι → Ty ι
  | arrow : Ty ι → Ty ι → Ty ι

/-- 4.1 Typing à la Curry: `HasType Γ t A` says that the untyped term `t` has type `A` when each
free index `i` has the type `Γ[i]?`; the index `0` is the head of the context. -/
inductive HasType {ι : Type u} : List (Ty ι) → Term → Ty ι → Prop
  | var {Γ : List (Ty ι)} {i : ℕ} {A : Ty ι} : Γ[i]? = some A → HasType Γ (var i) A
  | app {Γ : List (Ty ι)} {s t : Term} {A B : Ty ι} :
      HasType Γ s (Ty.arrow A B) → HasType Γ t A → HasType Γ (app s t) B
  | lam {Γ : List (Ty ι)} {t : Term} {A B : Ty ι} :
      HasType (A :: Γ) t B → HasType Γ (lam t) (Ty.arrow A B)

variable {ι : Type u}

/-- 4.2 Weakening: inserting a type at position `k` of the context and shifting the indices from
`k` on preserves typing. -/
theorem HasType.shift {Γ : List (Ty ι)} {t : Term} {A : Ty ι} (h : HasType Γ t A) (k : ℕ)
    (B : Ty ι) : HasType (Γ.insertIdx k B) (t.shift k) A := by
  sorry

/-- 4.2 The typing substitution lemma: substituting a term of type `B` for an index `k` of type
`B` preserves typing. -/
theorem HasType.subst {Γ : List (Ty ι)} {k : ℕ} {B : Ty ι} {t s : Term} {A : Ty ι}
    (ht : HasType (Γ.insertIdx k B) t A) (hs : HasType Γ s B) : HasType Γ (t.subst s k) A := by
  sorry

/-- 4.3 Subject reduction: β-reduction preserves the type of a term in a fixed context. -/
theorem HasType.of_beta {Γ : List (Ty ι)} {t u : Term} {A : Ty ι} (h : HasType Γ t A)
    (htu : Beta t u) : HasType Γ u A := by
  sorry

/-! ## Layer 5: strong normalization -/

/-- 5.1 A term is neutral when it is not an abstraction. -/
def Neutral (t : Term) : Prop :=
  ∀ s, t ≠ lam s

/-- 5.1 Girard's conditions (CR1)–(CR3) on a set of terms: its members are strongly normalizing,
it is closed under β-reduction, and it contains every neutral term all of whose β-reducts it
contains. -/
def IsCandidate (P : Term → Prop) : Prop :=
  (∀ t, P t → SN t) ∧ (∀ t u, P t → Beta t u → P u) ∧
    (∀ t, Neutral t → (∀ u, Beta t u → P u) → P t)

/-- 5.1 Tait's reducibility predicates: at a base type the strongly normalizing terms, at
`arrow A B` the terms whose application to every term reducible at `A` is reducible at `B`. -/
def Red : Ty ι → Term → Prop
  | .base _, t => SN t
  | .arrow A B, t => ∀ u, Red A u → Red B (app t u)

/-- 5.1 Each reducibility predicate satisfies (CR1)–(CR3). -/
theorem isCandidate_red (A : Ty ι) : IsCandidate (Red A) := by
  sorry

/-- 5.2 The adequacy theorem: a term of type `A` in `Γ`, with every index `i` of type `B`
replaced by a term reducible at `B`, is reducible at `A`. -/
theorem HasType.red_substAll {Γ : List (Ty ι)} {t : Term} {A : Ty ι} (h : HasType Γ t A)
    {σ : ℕ → Term} (hσ : ∀ i B, Γ[i]? = some B → Red B (σ i)) : Red A (t.substAll σ) := by
  sorry

/-- 5.3 Strong normalization: every simply typed term, in any context, is strongly normalizing
for β-reduction. -/
theorem HasType.sn {Γ : List (Ty ι)} {t : Term} {A : Ty ι} (h : HasType Γ t A) : SN t := by
  sorry

/-- 5.3 Every simply typed term has exactly one β-normal form that it reduces to. -/
theorem HasType.existsUnique_isNormal {Γ : List (Ty ι)} {t : Term} {A : Ty ι}
    (h : HasType Γ t A) : ∃! u, ReflTransGen Beta t u ∧ IsNormal u := by
  sorry

/-! ## Layer 6: η-reduction -/

/-- 6.1 One-step η-reduction: contraction of one redex `lam (app (s.shift 0) (var 0)) ↦ s`
anywhere in a term; the shift says that the index `0` does not occur free in the function part. -/
inductive Eta : Term → Term → Prop
  | eta (s : Term) : Eta (lam (app (s.shift 0) (var 0))) s
  | appL {s s' : Term} (t : Term) : Eta s s' → Eta (app s t) (app s' t)
  | appR (s : Term) {t t' : Term} : Eta t t' → Eta (app s t) (app s t')
  | lam {s s' : Term} : Eta s s' → Eta (lam s) (lam s')

/-- 6.1 One-step βη-reduction. -/
def BetaEta (t u : Term) : Prop :=
  Beta t u ∨ Eta t u

/-- 6.2 The Church–Rosser theorem for βη-reduction. -/
theorem church_rosser_betaEta {t u v : Term} (hu : ReflTransGen BetaEta t u)
    (hv : ReflTransGen BetaEta t v) : Join (ReflTransGen BetaEta) u v := by
  sorry

/-- 6.3 Subject reduction for η: η-reduction preserves the type of a term in a fixed context. -/
theorem HasType.of_eta {Γ : List (Ty ι)} {t u : Term} {A : Ty ι} (h : HasType Γ t A)
    (htu : Eta t u) : HasType Γ u A := by
  sorry

end TauCetiRoadmap.SimplyTypedLambdaCalculus

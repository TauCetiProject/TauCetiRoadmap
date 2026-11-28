import Mathlib

/-!
# Well-quasi-orders, Kruskal's tree theorem and path orders: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the definitions they need,
each with a real body: finite rooted plane trees with labels, homeomorphic embedding, the
monotonicity, subterm and stability properties of relations on Mathlib's first-order terms, the
one-step rewrite relation of a set of rules, and the recursive and lexicographic path orders.
Every headline theorem of the README is statable at the pins and is stated here.

Conventions. A relation `r` on terms is read "`r s t`: `s` lies below `t`", so `WellFounded r`
says that there is no infinite descending sequence. A set of rules `R` (with `R l r` for the rule
`l → r`) terminates when `WellFounded (flip (Rewrites R))`. A precedence is a relation on the
function symbols `Σ n, L.Functions n`, read the same way.

Library results used by the routes of the README and not restated: Higman's lemma
`Set.PartiallyWellOrderedOn.partiallyWellOrderedOn_sublistForall₂`, the minimal bad sequence
`Set.PartiallyWellOrderedOn.exists_min_bad_of_exists_bad`,
`WellQuasiOrdered.exists_monotone_subseq`, `Finite.wellQuasiOrdered`, `List.sublistForall₂_iff`,
`wellFounded_iff_isEmpty_descending_chain`, `Relation.CutExpand`, `WellFounded.cutExpand`,
`WellFounded.prod_lex`, `WellFounded.psigma_lex`, `Pi.Lex.wellFounded`, `WellFounded.transGen`
and `Subrelation.wf`.
-/

namespace TauCetiRoadmap.WellQuasiOrdersAndKruskal

open FirstOrder Language

/-! ## Layer 1: plane trees and homeomorphic embedding -/

/-- 1.1 Finite rooted plane trees labelled by `α`: a node carries a label and the ordered list of
its subtrees. -/
inductive PlaneTree (α : Type*) where
  | node : α → List (PlaneTree α) → PlaneTree α

namespace PlaneTree

variable {α : Type*}

/-- 1.2 Homeomorphic embedding of labelled plane trees, with labels compared by `r`: a tree
embeds into `node b ts` if it embeds into one of the subtrees in `ts`, and `node a ss` embeds into
`node b ts` if `r a b` and the list `ss` embeds, entry by entry, into a sublist of `ts` (so the
order of siblings is respected). -/
inductive Embeds (r : α → α → Prop) : PlaneTree α → PlaneTree α → Prop
  | toChild {s t : PlaneTree α} {b : α} {ts : List (PlaneTree α)} :
      t ∈ ts → Embeds r s t → Embeds r s (node b ts)
  | node {a b : α} {ss ts : List (PlaneTree α)} :
      r a b → List.SublistForall₂ (Embeds r) ss ts → Embeds r (node a ss) (node b ts)

/-! ## Layer 2: Kruskal's tree theorem -/

/-- 2.1 Kruskal's tree theorem: for a preorder `r` on the labels, homeomorphic embedding is a
well-quasi-order on labelled plane trees exactly when `r` is a well-quasi-order on the labels. -/
theorem wellQuasiOrdered_embeds_iff (r : α → α → Prop) [IsPreorder α r] :
    WellQuasiOrdered (Embeds r) ↔ WellQuasiOrdered r := by
  sorry

end PlaneTree

/-! ## Layer 3: simplification orderings and termination -/

section Terms

variable {L : Language} {α : Type*}

/-- 3.1 A relation on terms is monotone if replacing one argument of a term by a term below it
gives a term below the original. -/
def IsMonotoneTermRel (r : L.Term α → L.Term α → Prop) : Prop :=
  ∀ {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) (s : L.Term α),
    r s (ts i) → r (Term.func f (Function.update ts i s)) (Term.func f ts)

/-- 3.1 A relation on terms has the subterm property if every argument of a term lies below the
term. -/
def HasSubtermProperty (r : L.Term α → L.Term α → Prop) : Prop :=
  ∀ {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n), r (ts i) (Term.func f ts)

/-- 3.1 A relation on terms is stable if it is preserved by every substitution. -/
def IsStableTermRel (r : L.Term α → L.Term α → Prop) : Prop :=
  ∀ (s t : L.Term α) (σ : α → L.Term α), r s t → r (s.subst σ) (t.subst σ)

/-- 3.1 The one-step rewrite relation of a set of rules `R` (`R l r` for the rule `l → r`): an
instance of a rule by a substitution, applied at the root or inside one argument. -/
inductive Rewrites (R : L.Term α → L.Term α → Prop) : L.Term α → L.Term α → Prop
  | root {l r : L.Term α} (σ : α → L.Term α) : R l r → Rewrites R (l.subst σ) (r.subst σ)
  | arg {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) {t : L.Term α} :
      Rewrites R (ts i) t → Rewrites R (Term.func f ts) (Term.func f (Function.update ts i t))

/-- 3.2 Dershowitz's theorem for finitely many symbols and variables: a strict order on terms that
is monotone and has the subterm property is well-founded. -/
theorem wellFounded_of_isSimplification [Finite (Σ n, L.Functions n)] [Finite α]
    (r : L.Term α → L.Term α → Prop) [IsStrictOrder (L.Term α) r]
    (hmono : IsMonotoneTermRel r) (hsub : HasSubtermProperty r) : WellFounded r := by
  sorry

/-- 3.3 A set of rules terminates exactly when its rules decrease in some reduction order: a
well-founded strict order on terms that is monotone and stable. -/
theorem wellFounded_rewrites_iff (R : L.Term α → L.Term α → Prop) :
    WellFounded (flip (Rewrites R)) ↔
      ∃ r : L.Term α → L.Term α → Prop, IsStrictOrder (L.Term α) r ∧ WellFounded r ∧
        IsMonotoneTermRel r ∧ IsStableTermRel r ∧ ∀ l r', R l r' → r r' l := by
  sorry

/-- 3.4 Dershowitz's termination theorem: a finite set of rules terminates if every rule
decreases in a stable strict order on terms that is monotone and has the subterm property, over
any signature and any set of variables. -/
theorem wellFounded_rewrites_of_isSimplification (R : L.Term α → L.Term α → Prop)
    (hR : {p : L.Term α × L.Term α | R p.1 p.2}.Finite)
    (r : L.Term α → L.Term α → Prop) [IsStrictOrder (L.Term α) r]
    (hmono : IsMonotoneTermRel r) (hsub : HasSubtermProperty r) (hstab : IsStableTermRel r)
    (hdec : ∀ l r', R l r' → r r' l) : WellFounded (flip (Rewrites R)) := by
  sorry

/-! ## Layer 4: the recursive and lexicographic path orders -/

/-- 4.1 The recursive path order (multiset path order) of a precedence `prec` on the function
symbols (`prec g f`: `g` below `f`); `RpoLT prec s t` says that `s` lies below `t`. Variables are
compared with nothing but their superterms. Below `f(t₁, …, tₙ)` lie each `tᵢ` and everything
below it; every `g(s₁, …, sₘ)` with `g` below `f` whose arguments all lie below `f(t₁, …, tₙ)`;
and every `f(s₁, …, sₙ)` whose multiset of arguments lies below that of `t` in the
Dershowitz–Manna extension (some nonempty part `X` of the arguments of `t` is replaced by a
multiset `Y`, each member of which lies below some member of `X`, chosen by `c`); arguments cancel
only when they are equal, not up to permutation of subterms. -/
inductive RpoLT (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop) :
    L.Term α → L.Term α → Prop
  | arg {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) :
      RpoLT prec (ts i) (Term.func f ts)
  | subterm {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) {s : L.Term α} :
      RpoLT prec s (ts i) → RpoLT prec s (Term.func f ts)
  | prec {m n : ℕ} (g : L.Functions m) (ss : Fin m → L.Term α) (f : L.Functions n)
      (ts : Fin n → L.Term α) :
      prec ⟨m, g⟩ ⟨n, f⟩ → (∀ j, RpoLT prec (ss j) (Term.func f ts)) →
        RpoLT prec (Term.func g ss) (Term.func f ts)
  | mul {n : ℕ} (f : L.Functions n) (ss ts : Fin n → L.Term α) (X Y Z : Multiset (L.Term α))
      (c : L.Term α → L.Term α) :
      X ≠ 0 → Multiset.map ts Finset.univ.val = Z + X →
      Multiset.map ss Finset.univ.val = Z + Y → (∀ y ∈ Y, c y ∈ X) →
      (∀ y ∈ Y, RpoLT prec y (c y)) → RpoLT prec (Term.func f ss) (Term.func f ts)

/-- 4.1 The lexicographic path order of a precedence `prec`; the first three clauses are those of
`RpoLT`, and `f(s₁, …, sₙ)` lies below `f(t₁, …, tₙ)` if every `sⱼ` lies below `f(t₁, …, tₙ)` and,
at the first index `i` where the argument lists differ, `sᵢ` lies below `tᵢ`. -/
inductive LpoLT (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop) :
    L.Term α → L.Term α → Prop
  | arg {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) :
      LpoLT prec (ts i) (Term.func f ts)
  | subterm {n : ℕ} (f : L.Functions n) (ts : Fin n → L.Term α) (i : Fin n) {s : L.Term α} :
      LpoLT prec s (ts i) → LpoLT prec s (Term.func f ts)
  | prec {m n : ℕ} (g : L.Functions m) (ss : Fin m → L.Term α) (f : L.Functions n)
      (ts : Fin n → L.Term α) :
      prec ⟨m, g⟩ ⟨n, f⟩ → (∀ j, LpoLT prec (ss j) (Term.func f ts)) →
        LpoLT prec (Term.func g ss) (Term.func f ts)
  | lex {n : ℕ} (f : L.Functions n) (ss ts : Fin n → L.Term α) (i : Fin n) :
      (∀ j, LpoLT prec (ss j) (Term.func f ts)) → (∀ k, k < i → ss k = ts k) →
      LpoLT prec (ss i) (ts i) → LpoLT prec (Term.func f ss) (Term.func f ts)

/-- 4.2 The recursive path order of a well-founded precedence is well-founded, for any signature
and any set of variables. -/
theorem wellFounded_rpoLT (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop)
    (hprec : WellFounded prec) : WellFounded (RpoLT (α := α) prec) := by
  sorry

/-- 4.3 The lexicographic path order of a well-founded precedence is well-founded, for any
signature and any set of variables. -/
theorem wellFounded_lpoLT (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop)
    (hprec : WellFounded prec) : WellFounded (LpoLT (α := α) prec) := by
  sorry

/-- 4.4 A set of rules, each of whose right-hand sides lies below its left-hand side in the
recursive path order of a well-founded precedence, terminates. -/
theorem wellFounded_rewrites_of_rpoLT (R : L.Term α → L.Term α → Prop)
    (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop) (hprec : WellFounded prec)
    (hdec : ∀ l r, R l r → RpoLT prec r l) : WellFounded (flip (Rewrites R)) := by
  sorry

/-- 4.5 A set of rules, each of whose right-hand sides lies below its left-hand side in the
lexicographic path order of a well-founded precedence, terminates. -/
theorem wellFounded_rewrites_of_lpoLT (R : L.Term α → L.Term α → Prop)
    (prec : (Σ n, L.Functions n) → (Σ n, L.Functions n) → Prop) (hprec : WellFounded prec)
    (hdec : ∀ l r, R l r → LpoLT prec r l) : WellFounded (flip (Rewrites R)) := by
  sorry

end Terms

end TauCetiRoadmap.WellQuasiOrdersAndKruskal

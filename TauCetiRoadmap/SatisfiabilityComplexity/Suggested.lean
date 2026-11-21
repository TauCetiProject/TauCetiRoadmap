import Mathlib

/-!
# Complexity of propositional satisfiability: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Lean core, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

The clause sets, the resolution calculus and the pigeonhole formulas belong to the roadmap
PropositionalSatisfiability (1.1, 3.1, 3.4 and 3.5). A roadmap module cannot be imported, so the
declarations of that roadmap that the statements below mention (`Clause`, `CNF`, `Satisfies`,
`Models`, `Satisfiable`, `Clause.vars`, `CNF.vars`, `resolve`, `Derivable`, `IsDerivation`,
`Clause.IsHorn` and `pigeonhole`) are copied verbatim in the first section, only to make the
statements elaborate; their laws belong to that roadmap.

Suppliers used below: `Std.Sat.Literal` and `Std.Sat.Literal.negate`; Mathlib
`Relation.ReflTransGen`, `Set.encard`, `Nat.log`, `Nat.ceil`, `Real.sqrt`, `Real.log`,
`Turing.TM2ComputableInPolyTime`, `Language`, `Polynomial.eval`, `Computability.encodeNat`,
`SimpleGraph.fromRel` and `SimpleGraph.IsIndepSet`. Suppliers used by the README and not restated
here: PropositionalSatisfiability 1.1 (`Entails`), 1.3 (`satisfiable_iff_forall_finset`), 2.3
(`tseitin`, `models_tseitin_iff`, `card_tseitin_le`), 3.1
(`derivable_iff_exists_isDerivation`), 3.3 (`not_satisfiable_iff_derivable_empty`,
`exists_isDerivation_of_not_satisfiable`) and 3.4 (`UnitDerivable`,
`not_satisfiable_iff_unitDerivable_empty`); Mathlib `Turing.idComputableInPolyTime`,
`Turing.FinTM2`, `Turing.TM2OutputsInTime`, `Turing.TM2.step`, `Polynomial.comp`,
`Computability.decode_encodeNat`, `SimpleGraph.fromRel_adj`, `SimpleGraph.isClique_compl`,
`SimpleGraph.IsVertexCover`, `SimpleGraph.isVertexCover_compl` and `Finset.card_powersetCard`.
-/

open Std.Sat (Literal)

namespace TauCetiRoadmap.SatisfiabilityComplexity

/-! ## Conventions: the carriers of PropositionalSatisfiability -/

/-- Conventions: a clause is a finite set of literals (PropositionalSatisfiability 1.1, copied
verbatim). -/
abbrev Clause (V : Type*) := Finset (Literal V)

/-- Conventions: a formula in conjunctive normal form is a finite set of clauses
(PropositionalSatisfiability 1.1, copied verbatim). -/
abbrev CNF (V : Type*) := Finset (Clause V)

variable {V : Type*}

/-- Conventions: the assignment `τ` satisfies the clause `C` (PropositionalSatisfiability 1.1,
copied verbatim). -/
def Satisfies (τ : V → Bool) (C : Clause V) : Prop := ∃ l ∈ C, τ l.1 = l.2

/-- Conventions: the assignment `τ` is a model of the clause set `S`
(PropositionalSatisfiability 1.1, copied verbatim). -/
def Models (τ : V → Bool) (S : Set (Clause V)) : Prop := ∀ C ∈ S, Satisfies τ C

/-- Conventions: the clause set `S` has a model (PropositionalSatisfiability 1.1, copied
verbatim). -/
def Satisfiable (S : Set (Clause V)) : Prop := ∃ τ, Models τ S

/-- Conventions: the variables of a clause (PropositionalSatisfiability 1.1, copied verbatim). -/
def Clause.vars [DecidableEq V] (C : Clause V) : Finset V := C.image Prod.fst

/-- Conventions: the variables of a formula (PropositionalSatisfiability 1.1, copied
verbatim). -/
def CNF.vars [DecidableEq V] (F : CNF V) : Finset V := F.biUnion Clause.vars

/-- Conventions: a Horn clause has at most one positive literal (PropositionalSatisfiability 3.4,
copied verbatim). -/
def Clause.IsHorn (C : Clause V) : Prop := (C.filter fun l ↦ l.2 = true).card ≤ 1

section Carriers

variable [DecidableEq V]

/-- Conventions: the resolvent of `C` and `D` on `l`, used when `l ∈ C` and `l.negate ∈ D`
(PropositionalSatisfiability 3.1, copied verbatim). -/
def resolve (C D : Clause V) (l : Literal V) : Clause V := C.erase l ∪ D.erase l.negate

/-- Conventions: `C` has a resolution derivation from the clause set `S`
(PropositionalSatisfiability 3.1, copied verbatim). -/
inductive Derivable (S : Set (Clause V)) : Clause V → Prop
  | ax {C : Clause V} : C ∈ S → Derivable S C
  | res {C D : Clause V} {l : Literal V} : Derivable S C → Derivable S D → l ∈ C →
      l.negate ∈ D → Derivable S (resolve C D l)

/-- Conventions: a resolution derivation from `S` in sequence form, most recent clause first:
every clause is in `S` or is a resolvent of two clauses that occur later in the list
(PropositionalSatisfiability 3.1, copied verbatim). -/
def IsDerivation (S : Set (Clause V)) : List (Clause V) → Prop
  | [] => True
  | C :: L => IsDerivation S L ∧
      (C ∈ S ∨ ∃ A ∈ L, ∃ B ∈ L, ∃ l ∈ A, l.negate ∈ B ∧ C = resolve A B l)

end Carriers

/-- Conventions: the pigeonhole formula for `m` pigeons and `n` holes
(PropositionalSatisfiability 3.5, copied verbatim). -/
def pigeonhole (m n : ℕ) : CNF (Fin m × Fin n) :=
  (Finset.univ.image fun i : Fin m ↦ Finset.univ.image fun j : Fin n ↦ ((i, j), true)) ∪
    ((Finset.univ : Finset (Fin m × Fin m × Fin n)).filter fun t ↦ t.1 < t.2.1).image fun t ↦
      {((t.1, t.2.2), false), ((t.2.1, t.2.2), false)}

/-! ## Layer 1: clauses with at most two literals -/

/-- 1.1: the clauses derivable by resolution from a formula with `n` variables and at most two
literals per clause number at most `2 n ^ 2 + n + 1`. -/
theorem encard_derivable_le [DecidableEq V] (F : CNF V) (hF : ∀ C ∈ F, C.card ≤ 2) :
    {C | Derivable (F : Set (Clause V)) C}.encard ≤
      ((2 * (CNF.vars F).card ^ 2 + (CNF.vars F).card + 1 : ℕ) : ℕ∞) :=
  sorry

/-- 1.2: the implication relation of a clause set: `a` implies `b` when the clause
`{¬a, b}` belongs to `S`. A unit clause `{b}` gives the single pair `(¬b, b)`. -/
def Implies [DecidableEq V] (S : Set (Clause V)) (a b : Literal V) : Prop :=
  ({a.negate, b} : Clause V) ∈ S

/-- 1.2: the theorem of Aspvall, Plass and Tarjan, for an arbitrary set of clauses with at most
two literals each: it is satisfiable if and only if it does not contain the empty clause and no
literal is joined to its negation by chains of implications in both directions. -/
theorem satisfiable_iff_not_reflTransGen_implies [DecidableEq V] (S : Set (Clause V))
    (hS : ∀ C ∈ S, C.card ≤ 2) :
    Satisfiable S ↔ ∅ ∉ S ∧ ∀ l : Literal V,
      ¬ (Relation.ReflTransGen (Implies S) l l.negate ∧
        Relation.ReflTransGen (Implies S) l.negate l) :=
  sorry

/-- 1.3: over a finite type of variables, a set of assignments that is closed under the
pointwise majority of three is the set of models of a formula with at most two literals per
clause. -/
theorem exists_cnf_card_le_two_of_majority_mem [Finite V] (M : Set (V → Bool))
    (hM : ∀ σ ∈ M, ∀ τ ∈ M, ∀ ρ ∈ M,
      (fun v ↦ (σ v && τ v) || (σ v && ρ v) || (τ v && ρ v)) ∈ M) :
    ∃ F : CNF V, (∀ C ∈ F, C.card ≤ 2) ∧ ∀ τ, Models τ (F : Set (Clause V)) ↔ τ ∈ M :=
  sorry

/-! ## Layer 2: Horn clause sets -/

/-- 2.1: over a finite type of variables, a set of assignments that is closed under the
pointwise conjunction of two is the set of models of a formula of Horn clauses. -/
theorem exists_cnf_isHorn_of_and_mem [Finite V] (M : Set (V → Bool))
    (hM : ∀ σ ∈ M, ∀ τ ∈ M, (fun v ↦ σ v && τ v) ∈ M) :
    ∃ F : CNF V, (∀ C ∈ F, Clause.IsHorn C) ∧ ∀ τ, Models τ (F : Set (Clause V)) ↔ τ ∈ M :=
  sorry

/-- 2.2: the renaming of a clause by `τ`: the polarity of every literal whose variable `v` has
`τ v = true` is flipped. -/
def Clause.rename [DecidableEq V] (τ : V → Bool) (C : Clause V) : Clause V :=
  C.image fun l ↦ (l.1, xor l.2 (τ l.1))

/-- 2.2: Lewis's criterion. The renaming by `τ` turns every clause of `S` into a Horn clause if
and only if `τ` is a model of the set of all two-element subsets of the clauses of `S`. -/
theorem forall_isHorn_rename_iff [DecidableEq V] (S : Set (Clause V)) (τ : V → Bool) :
    (∀ C ∈ S, Clause.IsHorn (Clause.rename τ C)) ↔
      Models τ {D | ∃ C ∈ S, ∃ l ∈ C, ∃ k ∈ C, l ≠ k ∧ D = {l, k}} :=
  sorry

/-! ## Layer 3: width and size of resolution refutations -/

/-- 3.1: the width of a formula: the largest number of literals of a clause, and `0` for the
empty formula. -/
def CNF.width (F : CNF V) : ℕ := F.sup Finset.card

section Width

variable [DecidableEq V]

/-- 3.1: `C` has a resolution derivation from `S` in which every clause has at most `w`
literals. -/
inductive WidthDerivable (S : Set (Clause V)) (w : ℕ) : Clause V → Prop
  | ax {C : Clause V} : C ∈ S → C.card ≤ w → WidthDerivable S w C
  | res {C D : Clause V} {l : Literal V} : WidthDerivable S w C → WidthDerivable S w D →
      l ∈ C → l.negate ∈ D → (resolve C D l).card ≤ w → WidthDerivable S w (resolve C D l)

/-- 3.1: `C` has a tree-like resolution derivation from `S` with exactly `s` nodes; a leaf is a
clause of `S` and counts once for each of its occurrences. -/
inductive TreeDerivable (S : Set (Clause V)) : ℕ → Clause V → Prop
  | ax {C : Clause V} : C ∈ S → TreeDerivable S 1 C
  | res {C D : Clause V} {l : Literal V} {s t : ℕ} : TreeDerivable S s C →
      TreeDerivable S t D → l ∈ C → l.negate ∈ D → TreeDerivable S (s + t + 1) (resolve C D l)

/-- 3.2: Ben-Sasson and Wigderson, tree-like case: a formula with a tree-like refutation of `s`
nodes has a refutation of width at most `w(F) + log₂ s`. -/
theorem widthDerivable_of_treeDerivable (F : CNF V) {s : ℕ}
    (h : TreeDerivable (F : Set (Clause V)) s ∅) :
    WidthDerivable (F : Set (Clause V)) (CNF.width F + Nat.log 2 s) ∅ :=
  sorry

/-- 3.3: Ben-Sasson and Wigderson, general case: a formula with `n` variables and a refutation
of length `S` has a refutation of width at most `w(F) + 2 ⌈√(2 n ln S)⌉`. -/
theorem widthDerivable_of_isDerivation (F : CNF V) {L : List (Clause V)}
    (hL : IsDerivation (F : Set (Clause V)) L) (h0 : ∅ ∈ L) :
    WidthDerivable (F : Set (Clause V))
      (CNF.width F + 2 * ⌈Real.sqrt (2 * (CNF.vars F).card * Real.log L.length)⌉₊) ∅ :=
  sorry

end Width

/-- 3.4: Haken's theorem with the bound of Beame, Karp, Pitassi and Saks: for `n ≥ 1`, every
resolution refutation of the pigeonhole formula with `n + 1` pigeons and `n` holes has length at
least `2 ^ ((n + 1) / 20)`. -/
theorem two_rpow_le_length_of_isDerivation_pigeonhole {n : ℕ} (hn : 1 ≤ n)
    {L : List (Clause (Fin (n + 1) × Fin n))}
    (hL : IsDerivation (pigeonhole (n + 1) n : Set (Clause (Fin (n + 1) × Fin n))) L)
    (h0 : ∅ ∈ L) : (2 : ℝ) ^ (((n : ℝ) + 1) / 20) ≤ L.length :=
  sorry

/-! ## Layer 4: polynomial time, the classes P and NP, and reductions -/

/-- 4.1: polynomial-time computable functions between encoded types are closed under
composition. -/
theorem nonempty_tm2ComputableInPolyTime_comp {α β γ αΓ βΓ γΓ : Type} {ea : α → List αΓ}
    {eb : β → List βΓ} {ec : γ → List γΓ} {f : α → β} {g : β → γ}
    (hf : Nonempty (Turing.TM2ComputableInPolyTime ea eb f))
    (hg : Nonempty (Turing.TM2ComputableInPolyTime eb ec g)) :
    Nonempty (Turing.TM2ComputableInPolyTime ea ec (g ∘ f)) :=
  sorry

/-- 4.1: a function on bit strings is polynomial-time computable: some machine of Mathlib's
`Turing.FinTM2` computes it within a polynomial number of steps in the length of the input. -/
def IsPolyTime (f : List Bool → List Bool) : Prop :=
  Nonempty (Turing.TM2ComputableInPolyTime (id : List Bool → List Bool) id f)

/-- 4.2: the self-delimiting copy of a bit string: every bit is preceded by `true` and the
string is closed by `false`. -/
def delim (s : List Bool) : List Bool := s.flatMap (fun b ↦ [true, b]) ++ [false]

/-- 4.2: the pairing of two bit strings. -/
def pair (x w : List Bool) : List Bool := delim x ++ w

/-- 4.3: the language `L` is decidable in polynomial time. -/
def InP (L : Language Bool) : Prop := ∃ f, IsPolyTime f ∧ ∀ x, x ∈ L ↔ f x = [true]

/-- 4.3: the language `L` has polynomially bounded certificates that are checkable in polynomial
time. -/
def InNP (L : Language Bool) : Prop :=
  ∃ R : Language Bool, InP R ∧ ∃ p : Polynomial ℕ, ∀ x,
    x ∈ L ↔ ∃ w : List Bool, w.length ≤ p.eval x.length ∧ pair x w ∈ R

/-- 4.3: `L` is polynomial-time many-one reducible to `M`. -/
def PolyTimeReducible (L M : Language Bool) : Prop :=
  ∃ f, IsPolyTime f ∧ ∀ x, x ∈ L ↔ f x ∈ M

/-- 4.3: P is contained in NP. -/
theorem InP.inNP {L : Language Bool} (h : InP L) : InNP L :=
  sorry

/-- 4.3: NP is closed downwards under polynomial-time many-one reductions. -/
theorem InNP.of_polyTimeReducible {L M : Language Bool} (h : PolyTimeReducible L M)
    (hM : InNP M) : InNP L :=
  sorry

/-! ## Layer 5: NP-completeness of satisfiability and the tractable fragments -/

/-- 5.1: the code of a literal: its sign, then the delimited binary numeral of its variable. -/
def encodeLit (l : Literal ℕ) : List Bool := l.2 :: delim (Computability.encodeNat l.1)

/-- 5.1: the code of a list of literals: each literal is preceded by `true` and the list is
closed by `false`. -/
def encodeClause (C : List (Literal ℕ)) : List Bool :=
  C.flatMap (fun l ↦ true :: encodeLit l) ++ [false]

/-- 5.1: the code of a list of lists of literals. -/
def encodeCNF (F : List (List (Literal ℕ))) : List Bool :=
  F.flatMap (fun C ↦ true :: encodeClause C) ++ [false]

/-- 5.1: the formula presented by a list of lists of literals. -/
def cnfOfLists (F : List (List (Literal ℕ))) : CNF ℕ := (F.map List.toFinset).toFinset

/-- 5.1: the language of codes of satisfiable formulas. -/
def satLang : Language Bool :=
  {x | ∃ F, encodeCNF F = x ∧ Satisfiable (cnfOfLists F : Set (Clause ℕ))}

/-- 5.1: the language of codes of satisfiable formulas with at most `k` literals per clause. -/
def kSatLang (k : ℕ) : Language Bool :=
  {x | ∃ F, encodeCNF F = x ∧ (∀ C ∈ cnfOfLists F, C.card ≤ k) ∧
    Satisfiable (cnfOfLists F : Set (Clause ℕ))}

/-- 5.1: the language of codes of satisfiable formulas of Horn clauses. -/
def hornSatLang : Language Bool :=
  {x | ∃ F, encodeCNF F = x ∧ (∀ C ∈ cnfOfLists F, Clause.IsHorn C) ∧
    Satisfiable (cnfOfLists F : Set (Clause ℕ))}

/-- 5.2: satisfiability is in NP. -/
theorem satLang_inNP : InNP satLang :=
  sorry

/-- 5.2: the Cook–Levin theorem: every language in NP is polynomial-time many-one reducible to
satisfiability. -/
theorem polyTimeReducible_satLang_of_inNP {L : Language Bool} (h : InNP L) :
    PolyTimeReducible L satLang :=
  sorry

/-- 5.3: satisfiability reduces to satisfiability of formulas with at most three literals per
clause. -/
theorem polyTimeReducible_satLang_kSatLang_three : PolyTimeReducible satLang (kSatLang 3) :=
  sorry

/-- 5.4: satisfiability of formulas with at most two literals per clause is decidable in
polynomial time. -/
theorem kSatLang_two_inP : InP (kSatLang 2) :=
  sorry

/-- 5.4: satisfiability of Horn formulas is decidable in polynomial time. -/
theorem hornSatLang_inP : InP hornSatLang :=
  sorry

/-- 5.5: the conflict graph on pairs of a clause and a literal: two distinct pairs are adjacent
when they have the same clause or complementary literals. -/
def conflictGraph (V : Type*) : SimpleGraph (Clause V × Literal V) :=
  SimpleGraph.fromRel fun p q ↦ p.1 = q.1 ∨ p.2 = q.2.negate

/-- 5.5: a formula is satisfiable if and only if its occurrences of literals contain an
independent set of the conflict graph with as many elements as the formula has clauses. -/
theorem satisfiable_iff_exists_isIndepSet (F : CNF V) :
    Satisfiable (F : Set (Clause V)) ↔ ∃ s : Finset (Clause V × Literal V),
      (∀ p ∈ s, p.1 ∈ F ∧ p.2 ∈ p.1) ∧ (conflictGraph V).IsIndepSet (s : Set _) ∧
        s.card = F.card :=
  sorry

end TauCetiRoadmap.SatisfiabilityComplexity

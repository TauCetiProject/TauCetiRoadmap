import Mathlib

/-!
# Propositional satisfiability: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Lean core, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used below: `Std.Sat.Literal` and `Std.Sat.Literal.negate` (the literal type `V × Bool`
and its negation), and, for the comparison of 6.4 only, `Std.Sat.CNF`, `Std.Sat.CNF.clauses`,
`Std.Sat.CNF.Clause.literals` and `Std.Sat.CNF.Sat`. Suppliers used by the README and not
restated here: Mathlib `CompactSpace.iInter_nonempty`, `Function.compactSpace`,
`continuous_apply`, `isClosed_discrete`, `Fintype.exists_ne_map_eq_of_card_lt`; Lean core
`Std.Sat.CNF.sat_iff_all_mem_sat` and `Std.Sat.CNF.Clause.sat_iff_exists_mem_eq`. The README
also names, as boundaries, `Std.Sat.CNF.exists_sat_add_of_rat` and
`Std.Tactic.BVDecide.LRAT.check_sound`.
-/

open Std.Sat (Literal)

namespace TauCetiRoadmap.PropositionalSatisfiability

/-! ## Layer 1: clauses, assignments and satisfiability -/

/-- 1.1: a clause is a finite set of literals. -/
abbrev Clause (V : Type*) := Finset (Literal V)

/-- 1.1: a formula in conjunctive normal form is a finite set of clauses. -/
abbrev CNF (V : Type*) := Finset (Clause V)

variable {V : Type*}

/-- 1.1: the assignment `τ` satisfies the clause `C`: some literal `(v, b)` of `C` has
`τ v = b`. -/
def Satisfies (τ : V → Bool) (C : Clause V) : Prop := ∃ l ∈ C, τ l.1 = l.2

/-- 1.1: the assignment `τ` is a model of the clause set `S`. -/
def Models (τ : V → Bool) (S : Set (Clause V)) : Prop := ∀ C ∈ S, Satisfies τ C

/-- 1.1: the clause set `S` has a model. -/
def Satisfiable (S : Set (Clause V)) : Prop := ∃ τ, Models τ S

/-- 1.1: every model of `S` satisfies `C`. -/
def Entails (S : Set (Clause V)) (C : Clause V) : Prop := ∀ τ, Models τ S → Satisfies τ C

/-- 1.1: a clause is tautological if it contains a literal and its negation. -/
def Clause.IsTautology (C : Clause V) : Prop := ∃ l ∈ C, l.negate ∈ C

/-- 1.1: the variables of a clause. -/
def Clause.vars [DecidableEq V] (C : Clause V) : Finset V := C.image Prod.fst

/-- 1.1: the variables of a formula. -/
def CNF.vars [DecidableEq V] (F : CNF V) : Finset V := F.biUnion Clause.vars

/-- 1.3: compactness. A set of clauses over any variable type is satisfiable if and only if each
of its finite subsets is. -/
theorem satisfiable_iff_forall_finset (S : Set (Clause V)) :
    Satisfiable S ↔ ∀ T : Finset (Clause V), (T : Set (Clause V)) ⊆ S →
      Satisfiable (T : Set (Clause V)) :=
  sorry

/-! ## Layer 2: formulas and normal forms -/

/-- 2.1: propositional formulas over the variables `V`. -/
inductive PropForm (V : Type*) : Type _
  | var (v : V)
  | tru
  | fls
  | neg (φ : PropForm V)
  | and (φ ψ : PropForm V)
  | or (φ ψ : PropForm V)
  deriving DecidableEq

namespace PropForm

/-- 2.1: the truth value of a formula under an assignment. -/
def eval (τ : V → Bool) : PropForm V → Bool
  | var v => τ v
  | tru => true
  | fls => false
  | neg φ => !eval τ φ
  | and φ ψ => eval τ φ && eval τ ψ
  | or φ ψ => eval τ φ || eval τ ψ

/-- 2.1: the number of occurrences of constants and connectives. -/
def size : PropForm V → ℕ
  | var _ => 0
  | tru => 1
  | fls => 1
  | neg φ => size φ + 1
  | and φ ψ => size φ + size ψ + 1
  | or φ ψ => size φ + size ψ + 1

/-- 2.1: the set of subformulas, the formula itself included. -/
def subformulas [DecidableEq V] : PropForm V → Finset (PropForm V)
  | var v => {var v}
  | tru => {tru}
  | fls => {fls}
  | neg φ => insert (neg φ) (subformulas φ)
  | and φ ψ => insert (and φ ψ) (subformulas φ ∪ subformulas ψ)
  | or φ ψ => insert (or φ ψ) (subformulas φ ∪ subformulas ψ)

end PropForm

/-- 2.2: the distributive translation; `toCNF true φ` is a conjunctive normal form of `φ` and
`toCNF false φ` one of its negation. -/
def toCNF [DecidableEq V] : Bool → PropForm V → CNF V
  | b, .var v => {{(v, b)}}
  | true, .tru => ∅
  | false, .tru => {∅}
  | true, .fls => {∅}
  | false, .fls => ∅
  | b, .neg φ => toCNF (!b) φ
  | true, .and φ ψ => toCNF true φ ∪ toCNF true ψ
  | false, .and φ ψ => Finset.image₂ (· ∪ ·) (toCNF false φ) (toCNF false ψ)
  | true, .or φ ψ => Finset.image₂ (· ∪ ·) (toCNF true φ) (toCNF true ψ)
  | false, .or φ ψ => toCNF false φ ∪ toCNF false ψ

/-- 2.2: the distributive translation is an equivalence. -/
theorem models_toCNF [DecidableEq V] (b : Bool) (φ : PropForm V) (τ : V → Bool) :
    Models τ (toCNF b φ : Set (Clause V)) ↔ φ.eval τ = b :=
  sorry

/-- 2.3: the definitional clauses of polarity `b`. Each subformula is its own name: the variable
of `ψ` in the output is `ψ`. Polarity `true` keeps the clauses saying that the name of a
subformula implies its definition, polarity `false` the converse ones, and the polarity flips
under a negation. -/
def defClauses [DecidableEq V] : Bool → PropForm V → CNF (PropForm V)
  | _, .var _ => ∅
  | true, .tru => ∅
  | false, .tru => {{(.tru, true)}}
  | true, .fls => {{(.fls, false)}}
  | false, .fls => ∅
  | true, .neg φ => insert {(.neg φ, false), (φ, false)} (defClauses false φ)
  | false, .neg φ => insert {(.neg φ, true), (φ, true)} (defClauses true φ)
  | true, .and φ ψ =>
      {{(.and φ ψ, false), (φ, true)}, {(.and φ ψ, false), (ψ, true)}} ∪
        (defClauses true φ ∪ defClauses true ψ)
  | false, .and φ ψ =>
      insert {(.and φ ψ, true), (φ, false), (ψ, false)} (defClauses false φ ∪ defClauses false ψ)
  | true, .or φ ψ =>
      insert {(.or φ ψ, false), (φ, true), (ψ, true)} (defClauses true φ ∪ defClauses true ψ)
  | false, .or φ ψ =>
      {{(.or φ ψ, true), (φ, false)}, {(.or φ ψ, true), (ψ, false)}} ∪
        (defClauses false φ ∪ defClauses false ψ)

/-- 2.3: the Tseitin transformation: the unit clause of the name of `φ` and the definitional
clauses of both polarities. -/
def tseitin [DecidableEq V] (φ : PropForm V) : CNF (PropForm V) :=
  insert {(φ, true)} (defClauses true φ ∪ defClauses false φ)

/-- 2.4: the Plaisted–Greenbaum transformation: the unit clause of the name of `φ` and the
definitional clauses of positive polarity only. -/
def plaistedGreenbaum [DecidableEq V] (φ : PropForm V) : CNF (PropForm V) :=
  insert {(φ, true)} (defClauses true φ)

/-- 2.3: the models of the Tseitin transformation are exactly the assignments that give every
subformula of `φ` its truth value under the induced assignment of the variables and make `φ`
true. -/
theorem models_tseitin_iff [DecidableEq V] (φ : PropForm V) (σ : PropForm V → Bool) :
    Models σ (tseitin φ : Set (Clause (PropForm V))) ↔
      (∀ ψ ∈ φ.subformulas, σ ψ = ψ.eval fun v ↦ σ (.var v)) ∧
        φ.eval (fun v ↦ σ (.var v)) = true :=
  sorry

/-- 2.3: the Tseitin transformation has at most `3 * φ.size + 1` clauses, each with at most
three literals. -/
theorem card_tseitin_le [DecidableEq V] (φ : PropForm V) :
    (tseitin φ).card ≤ 3 * φ.size + 1 ∧ ∀ C ∈ tseitin φ, C.card ≤ 3 :=
  sorry

/-- 2.4: a model of the Plaisted–Greenbaum transformation makes `φ` true. -/
theorem eval_eq_true_of_models_plaistedGreenbaum [DecidableEq V] (φ : PropForm V)
    (σ : PropForm V → Bool)
    (h : Models σ (plaistedGreenbaum φ : Set (Clause (PropForm V)))) :
    φ.eval (fun v ↦ σ (.var v)) = true :=
  sorry

/-! ## Layer 3: resolution -/

section Resolution

variable [DecidableEq V]

/-- 3.1: the resolvent of `C` and `D` on `l`, used when `l ∈ C` and `l.negate ∈ D`. -/
def resolve (C D : Clause V) (l : Literal V) : Clause V := C.erase l ∪ D.erase l.negate

/-- 3.1: `C` has a resolution derivation from the clause set `S`. -/
inductive Derivable (S : Set (Clause V)) : Clause V → Prop
  | ax {C : Clause V} : C ∈ S → Derivable S C
  | res {C D : Clause V} {l : Literal V} : Derivable S C → Derivable S D → l ∈ C →
      l.negate ∈ D → Derivable S (resolve C D l)

/-- 3.1: a resolution derivation from `S` in sequence form, most recent clause first: every
clause is in `S` or is a resolvent of two clauses that occur later in the list. -/
def IsDerivation (S : Set (Clause V)) : List (Clause V) → Prop
  | [] => True
  | C :: L => IsDerivation S L ∧
      (C ∈ S ∨ ∃ A ∈ L, ∃ B ∈ L, ∃ l ∈ A, l.negate ∈ B ∧ C = resolve A B l)

/-- 3.1: the tree and sequence forms derive the same clauses. -/
theorem derivable_iff_exists_isDerivation (S : Set (Clause V)) (C : Clause V) :
    Derivable S C ↔ ∃ L, IsDerivation S L ∧ C ∈ L :=
  sorry

/-- 3.2: Davis–Putnam elimination of the variable `v`: the clauses without `v` and the resolvents
on `v` of the clauses that contain exactly one of the two literals of `v`. -/
def eliminate (F : CNF V) (v : V) : CNF V :=
  F.filter (fun C ↦ v ∉ Clause.vars C) ∪
    Finset.image₂ (fun C D ↦ resolve C D (v, true))
      (F.filter fun C ↦ (v, true) ∈ C ∧ (v, false) ∉ C)
      (F.filter fun D ↦ (v, false) ∈ D ∧ (v, true) ∉ D)

/-- 3.2: eliminating `v` quantifies it existentially. -/
theorem models_eliminate_iff (F : CNF V) (v : V) (τ : V → Bool) :
    Models τ (eliminate F v : Set (Clause V)) ↔
      ∃ b, Models (Function.update τ v b) (F : Set (Clause V)) :=
  sorry

/-- 3.3: soundness and refutational completeness of resolution, for an arbitrary set of clauses
over an arbitrary variable type. -/
theorem not_satisfiable_iff_derivable_empty (S : Set (Clause V)) :
    ¬ Satisfiable S ↔ Derivable S ∅ :=
  sorry

/-- 3.3: an unsatisfiable clause set has a refutation from its non-tautological clauses in which
no clause is tautological. -/
theorem exists_isDerivation_of_not_satisfiable (S : Set (Clause V)) (h : ¬ Satisfiable S) :
    ∃ L, IsDerivation {C | C ∈ S ∧ ¬ C.IsTautology} L ∧ ∅ ∈ L ∧ ∀ C ∈ L, ¬ C.IsTautology :=
  sorry

/-- 3.3: the subsumption theorem. A non-tautological clause entailed by `S` has a subset with a
resolution derivation from `S`. -/
theorem exists_derivable_subset_of_entails (S : Set (Clause V)) (C : Clause V)
    (h : Entails S C) (hC : ¬ C.IsTautology) : ∃ D, D ⊆ C ∧ Derivable S D :=
  sorry

/-- 3.4: unit resolution: one premise of every resolution step is a unit clause. -/
inductive UnitDerivable (S : Set (Clause V)) : Clause V → Prop
  | ax {C : Clause V} : C ∈ S → UnitDerivable S C
  | res {l : Literal V} {D : Clause V} : UnitDerivable S {l} → UnitDerivable S D →
      l.negate ∈ D → UnitDerivable S (D.erase l.negate)

/-- 3.4: a Horn clause has at most one positive literal. -/
def Clause.IsHorn (C : Clause V) : Prop := (C.filter fun l ↦ l.2 = true).card ≤ 1

/-- 3.4: unit resolution is refutationally complete for sets of Horn clauses. -/
theorem not_satisfiable_iff_unitDerivable_empty (S : Set (Clause V))
    (hS : ∀ C ∈ S, Clause.IsHorn C) : ¬ Satisfiable S ↔ UnitDerivable S ∅ :=
  sorry

/-- 3.5: the pigeonhole formula for `m` pigeons and `n` holes: every pigeon is in a hole and no
two pigeons share one. -/
def pigeonhole (m n : ℕ) : CNF (Fin m × Fin n) :=
  (Finset.univ.image fun i : Fin m ↦ Finset.univ.image fun j : Fin n ↦ ((i, j), true)) ∪
    ((Finset.univ : Finset (Fin m × Fin m × Fin n)).filter fun t ↦ t.1 < t.2.1).image fun t ↦
      {((t.1, t.2.2), false), ((t.2.1, t.2.2), false)}

/-- 3.5: the pigeonhole formula is satisfiable exactly when the pigeons fit. -/
theorem satisfiable_pigeonhole_iff (m n : ℕ) :
    Satisfiable (pigeonhole m n : Set (Clause (Fin m × Fin n))) ↔ m ≤ n :=
  sorry

end Resolution

/-! ## Layer 4: unit propagation and the abstract Davis–Putnam–Logemann–Loveland systems -/

section DPLL

variable [DecidableEq V]

/-- 4.1: the closure of a set `M` of literals under unit propagation with the clauses of `S`. -/
inductive Propagated (S : Set (Clause V)) (M : Set (Literal V)) : Literal V → Prop
  | base {l : Literal V} : l ∈ M → Propagated S M l
  | unit {C : Clause V} {l : Literal V} : C ∈ S → l ∈ C →
      (∀ k ∈ C, k ≠ l → Propagated S M k.negate) → Propagated S M l

/-- 4.1: unit propagation derives exactly the unit clauses that unit resolution derives from `S`
and the unit clauses of `M`. -/
theorem propagated_iff_unitDerivable (S : Set (Clause V)) (M : Set (Literal V))
    (l : Literal V) :
    Propagated S M l ↔ UnitDerivable (S ∪ (fun k ↦ ({k} : Clause V)) '' M) {l} :=
  sorry

/-- 4.2: a trail is a list of literals, most recent first, each marked `true` if it is a decision
literal. -/
abbrev Trail (V : Type*) := List (Literal V × Bool)

/-- 4.2: the set of literals of a trail. -/
def Trail.lits (M : Trail V) : Finset (Literal V) := (M.map Prod.fst).toFinset

/-- 4.2: a state is `fail` or a trail together with a formula. -/
inductive State (V : Type*)
  | fail
  | run (M : Trail V) (F : CNF V)

/-- 4.2: the names of the transition rules. -/
inductive Rule
  | unitPropagate
  | pureLiteral
  | decide
  | fail
  | backtrack
  | backjump
  | learn
  | forget
  | restart

/-- 4.2 and 5.1: the transition rules of abstract DPLL, most recent trail literal first. -/
inductive Step : Rule → State V → State V → Prop
  | unitPropagate {M : Trail V} {F : CNF V} {C : Clause V} {l : Literal V} : C ∈ F → l ∈ C →
      (∀ k ∈ C, k ≠ l → k.negate ∈ M.lits) → l ∉ M.lits → l.negate ∉ M.lits →
      Step .unitPropagate (.run M F) (.run ((l, false) :: M) F)
  | pureLiteral {M : Trail V} {F : CNF V} {C : Clause V} {l : Literal V} : C ∈ F → l ∈ C →
      (∀ D ∈ F, l.negate ∉ D) → l ∉ M.lits → l.negate ∉ M.lits →
      Step .pureLiteral (.run M F) (.run ((l, false) :: M) F)
  | decide {M : Trail V} {F : CNF V} {l : Literal V} : l.1 ∈ CNF.vars F → l ∉ M.lits →
      l.negate ∉ M.lits → Step .decide (.run M F) (.run ((l, true) :: M) F)
  | fail {M : Trail V} {F : CNF V} {C : Clause V} : C ∈ F → (∀ k ∈ C, k.negate ∈ M.lits) →
      (∀ a ∈ M, a.2 = false) → Step .fail (.run M F) .fail
  | backtrack {M N : Trail V} {F : CNF V} {C : Clause V} {l : Literal V} : C ∈ F →
      (∀ k ∈ C, k.negate ∈ Trail.lits (N ++ (l, true) :: M)) → (∀ a ∈ N, a.2 = false) →
      Step .backtrack (.run (N ++ (l, true) :: M) F) (.run ((l.negate, false) :: M) F)
  | backjump {M N : Trail V} {F : CNF V} {C C' : Clause V} {l l' : Literal V} : C ∈ F →
      (∀ k ∈ C, k.negate ∈ Trail.lits (N ++ (l, true) :: M)) →
      Entails (F : Set (Clause V)) (insert l' C') → (∀ k ∈ C', k.negate ∈ M.lits) →
      l' ∉ M.lits → l'.negate ∉ M.lits →
      (l'.1 ∈ CNF.vars F ∨ l'.1 ∈ (Trail.lits (N ++ (l, true) :: M)).image Prod.fst) →
      Step .backjump (.run (N ++ (l, true) :: M) F) (.run ((l', false) :: M) F)
  | learn {M : Trail V} {F : CNF V} {C : Clause V} :
      Clause.vars C ⊆ CNF.vars F ∪ M.lits.image Prod.fst → Entails (F : Set (Clause V)) C →
      Step .learn (.run M F) (.run M (insert C F))
  | forget {M : Trail V} {F : CNF V} {C : Clause V} : Entails (F : Set (Clause V)) C →
      Step .forget (.run M (insert C F)) (.run M F)
  | restart {M : Trail V} {F : CNF V} : Step .restart (.run M F) (.run [] F)

/-- 4.2: the Classical DPLL system. -/
def classicalDPLL : Set Rule := {.unitPropagate, .pureLiteral, .decide, .fail, .backtrack}

/-- 4.2: the Basic DPLL system. -/
def basicDPLL : Set Rule := {.unitPropagate, .decide, .fail, .backjump}

/-- 5.1: the DPLL system with learning and restarts. -/
def cdcl : Set Rule := basicDPLL ∪ {.learn, .forget, .restart}

/-- 4.2: one step by a rule of the system `R`. -/
def StepIn (R : Set Rule) (S T : State V) : Prop := ∃ r ∈ R, Step r S T

/-- 4.2: `S` is reachable from the initial state of `F` by the rules of `R`. -/
def Reachable (R : Set Rule) (F : CNF V) (S : State V) : Prop :=
  Relation.ReflTransGen (StepIn R) (.run [] F) S

/-- 4.2: no rule of `R` applies to `S`. -/
def IsFinal (R : Set Rule) (S : State V) : Prop := ∀ T, ¬ StepIn R S T

/-- 4.3: Classical DPLL is sound and complete: a reachable final state is `fail` exactly when
the formula is unsatisfiable, and otherwise its trail contains a literal of every clause. -/
theorem classicalDPLL_final {F : CNF V} {S : State V} (h : Reachable classicalDPLL F S)
    (hS : IsFinal classicalDPLL S) :
    (S = .fail ↔ ¬ Satisfiable (F : Set (Clause V))) ∧
      ∀ M G, S = .run M G → ∀ C ∈ F, ∃ l ∈ C, l ∈ M.lits :=
  sorry

/-- 4.4: every step except a learning, forgetting or restarting one makes progress: a derivation
without restarts from the initial state of `F` has fewer than `2 ^ (n + 1)` such steps, where
`n` is the number of variables of `F`. -/
theorem ncard_progress_steps_lt (F : CNF V) (s : ℕ → State V) (r : ℕ → Rule) (N : ℕ)
    (h0 : s 0 = .run [] F) (hs : ∀ i < N, Step (r i) (s i) (s (i + 1)))
    (hr : ∀ i < N, r i ≠ .restart) :
    {i | i < N ∧ r i ≠ .learn ∧ r i ≠ .forget}.ncard < 2 ^ ((CNF.vars F).card + 1) :=
  sorry

/-! ## Layer 5: clause learning and conflict analysis -/

/-- 5.1: when a clause is false in a reachable state, `fail` or `backjump` applies. -/
theorem exists_step_fail_or_backjump {F G : CNF V} {M : Trail V} {C : Clause V}
    (h : Reachable cdcl F (.run M G)) (hC : C ∈ G) (hfalse : ∀ k ∈ C, k.negate ∈ M.lits) :
    ∃ T, Step .fail (.run M G) T ∨ Step .backjump (.run M G) T :=
  sorry

/-- 5.1: in a reachable state, chronological backtracking is a backjump. -/
theorem Step.backjump_of_backtrack {F : CNF V} {S T : State V}
    (h : Reachable (cdcl ∪ {.backtrack}) F S) (hST : Step .backtrack S T) :
    Step .backjump S T :=
  sorry

/-- 5.1: soundness and completeness: a reachable state that is final for Basic DPLL is `fail`
exactly when the initial formula is unsatisfiable. -/
theorem eq_fail_iff_not_satisfiable {F : CNF V} {S : State V} (h : Reachable cdcl F S)
    (hS : IsFinal basicDPLL S) : S = .fail ↔ ¬ Satisfiable (F : Set (Clause V)) :=
  sorry

/-- 5.1: a reachable state `M ‖ G` that is final for Basic DPLL has a consistent trail that
contains a literal of every clause of `G`, and every assignment extending the trail is a model
of the initial formula. -/
theorem models_of_isFinal {F G : CNF V} {M : Trail V} (h : Reachable cdcl F (.run M G))
    (hS : IsFinal basicDPLL (.run M G)) :
    (∀ l ∈ M.lits, l.negate ∉ M.lits) ∧ (∀ C ∈ G, ∃ l ∈ C, l ∈ M.lits) ∧
      ∀ τ : V → Bool, (∀ l ∈ M.lits, τ l.1 = l.2) → Models τ (F : Set (Clause V)) :=
  sorry

/-- 5.1: termination with restarts. In an infinite derivation from the initial state of `F` in
which the number of progress steps between consecutive restarts strictly increases, all steps
from some point on are learning or forgetting steps. -/
theorem eventually_learn_or_forget (F : CNF V) (s : ℕ → State V) (r : ℕ → Rule)
    (h0 : s 0 = .run [] F) (hs : ∀ i, Step (r i) (s i) (s (i + 1)))
    (hper : ∀ i j k, i < j → j < k → r i = .restart → r j = .restart → r k = .restart →
      (∀ t, i < t → t < k → t ≠ j → r t ≠ .restart) →
      {t | i < t ∧ t < j ∧ r t ≠ .learn ∧ r t ≠ .forget}.ncard <
        {t | j < t ∧ t < k ∧ r t ≠ .learn ∧ r t ≠ .forget}.ncard) :
    ∃ N, ∀ i, N ≤ i → r i = .learn ∨ r i = .forget :=
  sorry

/-- 5.2: a trail with reasons, most recent first: a decision literal has no reason and a
propagated literal carries the clause that propagated it. -/
abbrev ReasonTrail (V : Type*) := List (Literal V × Option (Clause V))

/-- 5.2: the set of literals of a trail with reasons. -/
def ReasonTrail.lits (M : ReasonTrail V) : Finset (Literal V) := (M.map Prod.fst).toFinset

/-- 5.2: an implication trail for `S`: no variable is assigned twice, and every reason is a
clause of `S` that contains its literal and whose other literals are false in the earlier
trail. -/
def IsImplicationTrail (S : Set (Clause V)) : ReasonTrail V → Prop
  | [] => True
  | a :: M => IsImplicationTrail S M ∧ a.1 ∉ ReasonTrail.lits M ∧
      a.1.negate ∉ ReasonTrail.lits M ∧
      ∀ R, a.2 = some R → R ∈ S ∧ a.1 ∈ R ∧ ∀ k ∈ R, k ≠ a.1 → k.negate ∈ ReasonTrail.lits M

/-- 5.2: the decision level of the trail literal `l`: the number of decision literals up to and
including `l`; it is `0` for a literal that is not on the trail. -/
def ReasonTrail.level (M : ReasonTrail V) (l : Literal V) : ℕ :=
  ((M.dropWhile fun a ↦ decide (a.1 ≠ l)).filter fun a ↦ a.2.isNone).length

/-- 5.2: one step of conflict analysis: resolve the clause with the reason of a trail literal
whose negation it contains. -/
inductive AnalysisStep (M : ReasonTrail V) : Clause V → Clause V → Prop
  | intro {l : Literal V} {R D : Clause V} : (l, some R) ∈ M → l.negate ∈ D →
      AnalysisStep M D (resolve R D l)

/-- 5.2: `E` is obtained from `D` by resolving successively with clauses of `S`. -/
inductive InputDerivable (S : Set (Clause V)) : Clause V → Clause V → Prop
  | refl (D : Clause V) : InputDerivable S D D
  | step {D E R : Clause V} {l : Literal V} : InputDerivable S D E → R ∈ S → l ∈ R →
      l.negate ∈ E → InputDerivable S D (resolve R E l)

/-- 5.2: conflict analysis is input resolution and preserves the conflict. -/
theorem inputDerivable_of_analysis {S : Set (Clause V)} {M : ReasonTrail V} {D E : Clause V}
    (hM : IsImplicationTrail S M) (hD : ∀ k ∈ D, k.negate ∈ M.lits)
    (h : Relation.ReflTransGen (AnalysisStep M) D E) :
    InputDerivable S D E ∧ ∀ k ∈ E, k.negate ∈ M.lits :=
  sorry

/-- 5.2: conflict analysis terminates. -/
theorem wellFounded_analysisStep {S : Set (Clause V)} {M : ReasonTrail V}
    (hM : IsImplicationTrail S M) : WellFounded fun E D ↦ AnalysisStep M D E :=
  sorry

/-- 5.2: a clause that is false in an implication trail analyses to a clause of negated decision
literals. -/
theorem exists_analysis_decisions {S : Set (Clause V)} {M : ReasonTrail V} {D : Clause V}
    (hM : IsImplicationTrail S M) (hD : ∀ k ∈ D, k.negate ∈ M.lits) :
    ∃ E, Relation.ReflTransGen (AnalysisStep M) D E ∧ ∀ k ∈ E, (k.negate, none) ∈ M :=
  sorry

/-- 5.2: the first unique implication point. A nonempty clause that is false in an implication
trail, with `j` the highest decision level of the negations of its literals, analyses to a clause
with exactly one literal whose negation has level `j`. -/
theorem exists_analysis_asserting {S : Set (Clause V)} {M : ReasonTrail V} {D : Clause V}
    {l₀ : Literal V} (hM : IsImplicationTrail S M) (hD : ∀ k ∈ D, k.negate ∈ M.lits)
    (hl₀ : l₀ ∈ D) (hmax : ∀ k ∈ D, M.level k.negate ≤ M.level l₀.negate) :
    ∃ E, Relation.ReflTransGen (AnalysisStep M) D E ∧ ∃ l ∈ E,
      M.level l.negate = M.level l₀.negate ∧
        ∀ k ∈ E, k ≠ l → M.level k.negate < M.level l.negate :=
  sorry

/-! ## Layer 6: clausal proof systems -/

/-- 6.1: reverse unit propagation: unit resolution refutes `S` together with the negations of
the literals of `C`. -/
def IsRUP (S : Set (Clause V)) (C : Clause V) : Prop :=
  UnitDerivable (S ∪ (fun l : Literal V ↦ ({l.negate} : Clause V)) '' (C : Set (Literal V))) ∅

/-- 6.1: a clause with the reverse unit propagation property is entailed. -/
theorem IsRUP.entails {S : Set (Clause V)} {C : Clause V} (h : IsRUP S C) : Entails S C :=
  sorry

/-- 6.1: input resolution preserves the reverse unit propagation property; in particular every
clause produced by conflict analysis has it. -/
theorem InputDerivable.isRUP {S : Set (Clause V)} {D E : Clause V} (hD : IsRUP S D)
    (h : InputDerivable S D E) : IsRUP S E :=
  sorry

/-- 6.1: a chain of hints for the literal set `M`: each hint has all its literals but one false
in the current set, which then gains that literal, until a hint has all its literals false. -/
def UnitChain : Finset (Literal V) → List (Clause V) → Prop
  | _, [] => False
  | M, D :: hints => (∀ k ∈ D, k.negate ∈ M) ∨
      ∃ l ∈ D, (∀ k ∈ D, k ≠ l → k.negate ∈ M) ∧ UnitChain (insert l M) hints

/-- 6.1: a non-tautological clause has the reverse unit propagation property exactly when a
chain of hints from `S` certifies it. -/
theorem isRUP_iff_exists_unitChain {S : Set (Clause V)} {C : Clause V}
    (hC : ¬ C.IsTautology) :
    IsRUP S C ↔ ∃ hints : List (Clause V),
      (∀ D ∈ hints, D ∈ S) ∧ UnitChain (C.image Literal.negate) hints :=
  sorry

/-- 6.2: `C` is a resolution asymmetric tautology on `l` with respect to `S`. -/
def IsRAT (S : Set (Clause V)) (C : Clause V) (l : Literal V) : Prop :=
  l ∈ C ∧ ∀ D ∈ S, l.negate ∈ D → IsRUP S (C ∪ D.erase l.negate)

/-- 6.2: adding a clause whose resolvents on `l` are entailed preserves satisfiability: a model
of `S` is a model of `S` with `C` either as it is or after making `l` true. -/
theorem models_insert_or_models_update {S : Set (Clause V)} {C : Clause V} {l : Literal V}
    (hl : l ∈ C) (h : ∀ D ∈ S, l.negate ∈ D → Entails S (C ∪ D.erase l.negate))
    {τ : V → Bool} (hτ : Models τ S) :
    Models τ (insert C S) ∨ Models (Function.update τ l.1 l.2) (insert C S) :=
  sorry

/-- 6.3: a step of a clausal proof adds or deletes a clause. -/
inductive ProofStep (V : Type*)
  | add (C : Clause V)
  | delete (C : Clause V)

/-- 6.3: the formula obtained from `F` by a list of proof steps. -/
def applySteps (F : CNF V) : List (ProofStep V) → CNF V
  | [] => F
  | .add C :: π => applySteps (insert C F) π
  | .delete C :: π => applySteps (F.erase C) π

/-- 6.3: a DRAT proof from `F`: every added clause has the reverse unit propagation property or
is a resolution asymmetric tautology with respect to the formula at that point. -/
def IsDRATProof (F : CNF V) : List (ProofStep V) → Prop
  | [] => True
  | .add C :: π => (IsRUP (F : Set (Clause V)) C ∨ ∃ l, IsRAT (F : Set (Clause V)) C l) ∧
      IsDRATProof (insert C F) π
  | .delete C :: π => IsDRATProof (F.erase C) π

/-- 6.3: soundness of DRAT: a DRAT proof preserves satisfiability, so a proof that reaches a
formula containing the empty clause refutes `F`. -/
theorem satisfiable_applySteps {F : CNF V} {π : List (ProofStep V)} (h : IsDRATProof F π)
    (hF : Satisfiable (F : Set (Clause V))) :
    Satisfiable (applySteps F π : Set (Clause V)) :=
  sorry

/-- 6.4: the formula of this roadmap underlying a formula of Lean's `Std.Sat.CNF`. -/
def ofStd (f : Std.Sat.CNF V) : CNF V :=
  (f.clauses.toList.map fun c ↦ c.literals.toFinset).toFinset

/-- 6.4: the two notions of satisfaction agree. -/
theorem sat_iff_models_ofStd (τ : V → Bool) (f : Std.Sat.CNF V) :
    Std.Sat.CNF.Sat τ f ↔ Models τ (ofStd f : Set (Clause V)) :=
  sorry

end DPLL

end TauCetiRoadmap.PropositionalSatisfiability

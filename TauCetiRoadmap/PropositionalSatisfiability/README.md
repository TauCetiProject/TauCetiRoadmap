# Roadmap: propositional satisfiability, resolution and clausal proof systems

**Summary.** This roadmap develops the logical core of propositional satisfiability: clauses and
sets of clauses over an arbitrary type of variables, their models, the translation of formulas into
clause sets, the resolution calculus, the abstract transition systems that describe backtracking
search with and without clause learning, and the clausal proof systems built on unit propagation.
A clause is a finite set of literals and a clause set is any set of clauses, finite or not; the
variable type carries no hypothesis beyond decidable equality where clauses are manipulated.
Everything is stated as a theorem about relations, derivations and models. No solver, proof
checker or other program is specified.

The headline theorems are the following.

- Resolution is sound and refutationally complete: a set of clauses, finite or infinite, over any
  type of variables is unsatisfiable if and only if the empty clause has a resolution derivation
  from it. More generally a non-tautological clause entailed by a clause set has a subset that is
  derivable by resolution.
- The Tseitin transformation of a formula `φ` is a set of at most `3 s + 1` clauses of at most
  three literals, where `s` is the number of constants and connectives of `φ`, in variables named
  by the subformulas of `φ`. Its models are exactly the assignments that give each subformula its
  truth value and make `φ` true, so each model of `φ` extends to a model in exactly one way on the
  subformulas.
- In the abstract Davis–Putnam–Logemann–Loveland system with backjumping, learning, forgetting
  and restarts, started from a finite clause set `F` with the empty trail, every reachable state
  that is final for the rules without learning is the failure state if and only if `F` is
  unsatisfiable, and otherwise every assignment extending its trail is a model of `F`. A
  derivation without restarts makes fewer than `2^(n+1)` steps other than learning and forgetting
  steps, where `n` is the number of variables of `F`.
- A clause all of whose resolvents on one of its literals against a clause set are entailed by
  that set can be added to it without destroying satisfiability, though not in general without
  losing models; consequently a proof by reverse unit propagation and resolution asymmetric
  tautology steps, with deletions, that reaches the empty clause shows unsatisfiability.

The roadmap builds on Mathlib's finite sets, on its compactness of product spaces (for the
compactness theorem of propositional logic) and on the literal type that Lean's standard library
uses for its own conjunctive normal forms, to which the semantics here is compared. It feeds
complexity-theoretic developments, which need the clause sets, the Tseitin transformation, the
resolution derivations and the pigeonhole formulas as fixed mathematical objects.

Layer 1 below gives clauses, models, entailment, restriction and compactness. Layer 2 gives
formulas, the distributive translation and the Tseitin and Plaisted–Greenbaum transformations.
Layer 3 is resolution. Layer 4 treats unit propagation and the transition systems without
learning, Layer 5 learning, restarts and conflict analysis, and Layer 6 the clausal proof systems.

## Conventions

- `V` is an arbitrary type of **variables**. Statements that erase, insert or unite clauses assume
  `[DecidableEq V]`; the semantic notions of 1.1 and the compactness theorem 1.3 assume nothing.
  No statement assumes `V` finite or nonempty.
- A **literal** is an element of `Std.Sat.Literal V`, which is `V × Bool`: `(v, true)` is the
  positive and `(v, false)` the negative literal of `v`, and `Std.Sat.Literal.negate` flips the
  second component. In prose `¬l` is the negation of the literal `l`.
- A **clause** is a finite set of literals, `Clause V := Finset (Literal V)`; the **empty clause**
  is `∅`. A **formula in conjunctive normal form** is a finite set of clauses,
  `CNF V := Finset (Clause V)`; a **clause set** is any `S : Set (Clause V)`, and a `CNF V` is
  used as a clause set through the coercion of `Finset` to `Set`. `S`, `T` denote clause sets,
  `F`, `G` formulas in conjunctive normal form, `C`, `D`, `E`, `R` clauses and `l`, `k` literals.
- An **assignment** is a function `τ : V → Bool`. The literal `l` is true under `τ` if
  `τ l.1 = l.2`.
- A **unit clause** is a clause `{l}` with exactly one literal.
- A **trail** is a list of literals with marks, **most recent first**: the head of the list is the
  literal assigned last. Positions and decision levels are counted from the oldest entry.
- A literal `l` is **true in a trail** `M` if it occurs in `M`, **false** if `¬l` occurs, and
  **undefined** otherwise; a clause is **false in** `M` if all its literals are false in `M`.
- `Relation.ReflTransGen` is Mathlib's reflexive transitive closure.

## Layer 1: clauses, assignments and satisfiability

### 1.1 Clauses, models and entailment

Define the types `Clause` and `CNF` of the [Conventions](#conventions) and, without any hypothesis
on `V`:

- `Satisfies τ C`: some literal of `C` is true under `τ`;
- `Models τ S`: `τ` satisfies every clause of `S`;
- `Satisfiable S`: some assignment is a model of `S`;
- `Entails S C`: every model of `S` satisfies `C`;
- `Clause.IsTautology C`: `C` contains a literal and its negation;

and, for `[DecidableEq V]`, the variable sets `Clause.vars C` (the image of `C` under the first
projection) and `CNF.vars F` (the union over the clauses of `F`). Two clause sets are
**equivalent** if they have the same models and **equisatisfiable** if one is satisfiable exactly
when the other is. Prove that:

- the empty clause is satisfied by no assignment, the empty clause set by every assignment, and a
  clause set that contains the empty clause is unsatisfiable;
- a tautological clause is satisfied by every assignment, and a clause satisfied by every
  assignment is tautological;
- `Satisfies τ C` depends only on the restriction of `τ` to the variables of `C`, and `Models τ F`
  only on the restriction to the variables of `F`;
- `Models`, `Satisfiable` and `Entails` are antitone, antitone and monotone in the clause set, a
  clause with a subset in `S` is entailed by `S`, and entailment is transitive: if `S` entails
  every clause of `T` and `T` entails `C` then `S` entails `C`;
- `S` entails `C` if and only if `S` together with the unit clauses `{¬l}`, `l ∈ C`, is
  unsatisfiable; in particular `S` is unsatisfiable if and only if it entails `∅`;
- relabelling: for `f : V → W`, the image of `S` under `f` on variables has `τ` as a model if and
  only if `S` has `τ ∘ f` as a model.

(Proved here.)

**Checks.**

- The empty formula is satisfiable and the formula `{∅}` is not: the two degenerate objects are
  different, and when `V` is empty these are the only two formulas.
- `{(x, true), (x, false)}` is tautological; `{(x, true), (y, false)}` is not, and it is false
  under `x ↦ false`, `y ↦ true`, which pins the polarity convention: `(v, true)` is the positive
  literal.
- The clause set of both unit clauses of `x` is unsatisfiable and entails every clause, including
  `∅`.

*Needs:* Lean core `Std.Sat.Literal`, `Std.Sat.Literal.negate`.

### 1.2 Restriction and splitting

For a formula `F` and a literal `l`, with `[DecidableEq V]`, define the **restriction** `F|l` as
the set of clauses `C \ {¬l}` for the clauses `C` of `F` that do not contain `l`. Prove that:

- if `l` is true under `τ` then `τ` is a model of `F|l` if and only if it is a model of `F`;
- the variable of `l` does not occur in `F|l`;
- the splitting rule: `F` is satisfiable if and only if `F|l` or `F|¬l` is;
- if `{l} ∈ F` then `F` is satisfiable if and only if `F|l` is;
- if `l` is **pure** in `F`, meaning that no clause of `F` contains `¬l`, then `F` is satisfiable
  if and only if the set of clauses of `F` not containing `l` is.

For a finite set `M` of literals the restriction by `M` deletes the clauses that meet `M` and
removes from the others the literals whose negation is in `M`. An assignment under which all
literals of `M` are true is a model of the restriction by `M` if and only if it is a model of `F`;
if `M` contains no literal together with its negation, satisfiability of the restriction by `M`
implies satisfiability of `F`. (Proved here.)

**Checks.**

- `F = {{x, y}, {¬x, y}, {¬y}}` and `l = x`: `F|x = {{y}, {¬y}}`, and `F|¬x` is the same set; both
  are unsatisfiable, as `F` is.
- The consistency hypothesis is needed: for `F = {{x}, {¬x}}` and `M = {x, ¬x}` the restriction
  by `M` is the empty formula, which is satisfiable, while `F` is not.
- A wrong restriction that keeps the clauses containing `l` gives, for `F = {{x}}` and `l = x`,
  the formula `{{x}}` in place of the empty formula; the first bullet still holds for it but the
  variable of `l` survives.

*Needs:* 1.1.

### 1.3 Compactness

Prove `satisfiable_iff_forall_finset`: for every type `V` and every clause set `S` over `V`, `S`
is satisfiable if and only if every finite subset of `S` is satisfiable. The space `V → Bool` with
the product of the discrete topologies is compact (`Function.compactSpace`), the set of
assignments satisfying a fixed clause is closed, being a finite union of preimages of points under
coordinate maps (`continuous_apply`, `isClosed_discrete`), and a family of closed sets in a
compact space whose finite subfamilies have nonempty intersection has nonempty intersection
(`CompactSpace.iInter_nonempty`). (Proved here.)

**Checks.**

- `V = ℕ` and `S = {{(n, true)} : n ∈ ℕ} ∪ {{(n, false), (n + 1, false)} : n ∈ ℕ}`: the finite
  subset `{{(0, true)}, {(1, true)}, {(0, false), (1, false)}}` is already unsatisfiable.
- Finiteness of clauses is what makes the theorem true: an "infinite clause" asserting that some
  `(n, true)` holds, together with all unit clauses `{(n, false)}`, would be finitely satisfiable
  and unsatisfiable. The type `Clause V` admits no such object.

*Needs:* 1.1; Mathlib `Function.compactSpace`, `continuous_apply`, `isClosed_discrete`,
`CompactSpace.iInter_nonempty`.

### Examples

The formula `{{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}}` is unsatisfiable, and each of its four
three-clause subsets has exactly one model.

### Dependencies

Layer 1 uses Lean core's literal type and Mathlib's compactness of product spaces.

## Layer 2: formulas and normal forms

### 2.1 Formulas

Define the inductive type `PropForm V` of formulas with constructors `var v`, `tru`, `fls`,
`neg φ`, `and φ ψ` and `or φ ψ`; the truth value `PropForm.eval τ φ : Bool`; the size
`PropForm.size φ`, the number of occurrences of constants and connectives (a variable has size
`0`); and, for `[DecidableEq V]`, the finite set `PropForm.subformulas φ` of subformulas, `φ`
included. A formula is **satisfiable** if it evaluates to `true` under some assignment, two
formulas are **equivalent** if they evaluate equally under every assignment, and they are
**equisatisfiable** if one is satisfiable exactly when the other is. Prove that:

- `PropForm.eval τ φ` depends only on the values of `τ` on the variables that occur in `φ`;
- `PropForm.subformulas φ` has at most `PropForm.size φ + m` elements, where `m` is the number of
  distinct variables of `φ`, and it is closed under taking immediate subformulas;
- negation normal form: the map that pushes negations inwards by the De Morgan laws, removes
  double negations and replaces a negated constant by the other constant sends `φ` to an
  equivalent formula in which `neg` is applied to variables only, with the same number of
  occurrences of `and` and `or` together and the same number of occurrences of variables and
  constants together.

(Proved here.)

**Checks.**

- `and (var x) (neg (var x))` has size `2`, three subformulas and evaluates to `false` under both
  assignments of `x`.
- Subformulas form a set: for `φ = or (var x) (var x)`, of size `1` with two subformulas, the
  formula `and φ φ` has size `3` and three subformulas, fewer than the bound `3 + 1`.
- The negation normal form of `neg (and (var x) (neg (var y)))` is
  `or (neg (var x)) (var y)`; a map that forgot to flip the connective would return a formula
  that differs from the original under `x ↦ true`, `y ↦ true`.

*Needs:* nothing beyond Mathlib's `Finset`.

### 2.2 The distributive translation

For `[DecidableEq V]` define `toCNF : Bool → PropForm V → CNF V` by recursion on the formula:
`toCNF b (var v) = {{(v, b)}}`; `toCNF true tru = toCNF false fls = ∅` and
`toCNF false tru = toCNF true fls = {∅}`; `toCNF b (neg φ) = toCNF (!b) φ`;
`toCNF true (and φ ψ)` and `toCNF false (or φ ψ)` are the unions of the translations of `φ` and
`ψ` at the same polarity; `toCNF false (and φ ψ)` and `toCNF true (or φ ψ)` are the sets of all
unions `C ∪ D` with `C` in the translation of `φ` and `D` in that of `ψ` at the same polarity.
Prove `models_toCNF`: `Models τ (toCNF b φ)` if and only if `PropForm.eval τ φ = b`. Hence every
formula is equivalent to a formula in conjunctive normal form over its own variables, namely
`toCNF true φ`. (Proved here.)

**Checks.**

- For distinct variables `x₁, y₁, …, xₙ, yₙ` and `n ≥ 1`, the translation at polarity `true` of
  the disjunction of the `n` formulas `and (var xᵢ) (var yᵢ)` has exactly `2^n` clauses, each
  with `n` literals, while the formula has size `2 n − 1`: the translation is not of polynomial
  size.
- `toCNF true tru` is the empty formula and `toCNF true fls` is `{∅}`; exchanging the two would
  make the constant `tru` unsatisfiable.

*Needs:* 1.1, 2.1.

### 2.3 The Tseitin transformation

The transformation names every subformula by itself: its output is a formula in conjunctive
normal form over the variable type `PropForm V`, in which the variable `ψ` stands for the
subformula `ψ` and `var v` for the original variable `v`. For `[DecidableEq V]` define
`defClauses : Bool → PropForm V → CNF (PropForm V)`, the **definitional clauses** of a polarity,
by recursion. Writing `ψ⁺ = (ψ, true)` and `ψ⁻ = (ψ, false)`:

- a variable has no definitional clauses;
- `tru` contributes `{tru⁺}` at polarity `false` and nothing at polarity `true`; `fls`
  contributes `{fls⁻}` at polarity `true` and nothing at polarity `false`;
- `ψ = neg φ` contributes `{ψ⁻, φ⁻}` at polarity `true`, with the clauses of `φ` at polarity
  `false`, and `{ψ⁺, φ⁺}` at polarity `false`, with the clauses of `φ` at polarity `true`;
- `ψ = and φ χ` contributes `{ψ⁻, φ⁺}` and `{ψ⁻, χ⁺}` at polarity `true` and `{ψ⁺, φ⁻, χ⁻}` at
  polarity `false`, with the clauses of `φ` and `χ` at the same polarity;
- `ψ = or φ χ` contributes `{ψ⁻, φ⁺, χ⁺}` at polarity `true` and `{ψ⁺, φ⁻}` and `{ψ⁺, χ⁻}` at
  polarity `false`, with the clauses of `φ` and `χ` at the same polarity.

So polarity `true` collects the clauses saying that the name of a subformula implies its
definition and polarity `false` the converse clauses. Define

    tseitin φ = insert {φ⁺} (defClauses true φ ∪ defClauses false φ).

Prove:

- `models_tseitin_iff`: an assignment `σ : PropForm V → Bool` is a model of `tseitin φ` if and
  only if `σ ψ = PropForm.eval (σ ∘ var) ψ` for every `ψ ∈ PropForm.subformulas φ` and
  `PropForm.eval (σ ∘ var) φ = true`;
- consequently, for `τ : V → Bool`, `φ` is true under `τ` if and only if some model `σ` of
  `tseitin φ` has `σ ∘ var = τ`; one such `σ` is `ψ ↦ PropForm.eval τ ψ`, and any two agree on
  the subformulas of `φ`; in particular `φ` and `tseitin φ` are equisatisfiable;
- `card_tseitin_le`: `tseitin φ` has at most `3 * PropForm.size φ + 1` clauses and each of them
  has at most three literals;
- every variable of `tseitin φ` is a subformula of `φ` and no clause of `tseitin φ` is
  tautological.

(The transformation is due to Tseitin, 1968; proved here.)

**Checks.**

- `φ = var x`: `tseitin φ` is the single unit clause `{(var x)⁺}`, of cardinality
  `1 = 3 · 0 + 1`.
- For the disjunction of 2.2 the transformation has exactly `3 (2 n − 1) + 1` clauses, so the
  bound is attained, against the `2^n` clauses of the distributive translation.
- `φ = and (var x) (var x)`: the two clauses of polarity `true` coincide and `tseitin φ` has
  three clauses, fewer than `3 · 1 + 1`.
- Uniqueness holds on the subformulas only: a model of `tseitin φ` may take any value at a
  formula that is not a subformula of `φ`.
- Dropping the clause `{ψ⁺, φ⁻, χ⁻}` of a conjunction would leave `(and (var x) (var y)) ↦ false`
  with `x, y ↦ true` as a model of the definitional clauses, against the first bullet.

*Needs:* 1.1, 2.1.

### 2.4 The Plaisted–Greenbaum transformation

Define `plaistedGreenbaum φ = insert {φ⁺} (defClauses true φ)`, a subset of `tseitin φ`. Prove:

- `eval_eq_true_of_models_plaistedGreenbaum`: if `σ` is a model of `plaistedGreenbaum φ` then
  `PropForm.eval (σ ∘ var) φ = true`;
- conversely, if `PropForm.eval τ φ = true` then `ψ ↦ PropForm.eval τ ψ` is a model of
  `plaistedGreenbaum φ`, by 2.3; hence `φ` and `plaistedGreenbaum φ` are equisatisfiable;
- `plaistedGreenbaum φ` has at most `2 * PropForm.size φ + 1` clauses.

(The optimization is due to Plaisted and Greenbaum, 1986; proved here.)

**Checks.**

- `φ = or (var x) (var y)`: `plaistedGreenbaum φ = {{φ⁺}, {φ⁻, (var x)⁺, (var y)⁺}}`, two
  clauses against the four of `tseitin φ`.
- Models are not unique on subformulas: for `φ = or (and (var x) (var y)) (var z)` and
  `x, y, z ↦ true`, the name of `and (var x) (var y)` may be `true` or `false` in a model.

*Needs:* 1.1, 2.1, 2.3.

### Examples

For `φ = and (or (var x) (var y)) (neg (var x))`: `toCNF true φ = {{x, y}, {¬x}}`, and `tseitin φ`
has nine clauses, one unit clause and eight definitional ones, with exactly one model over the
five subformulas, extending `x ↦ false`, `y ↦ true`.

### Dependencies

Layer 2 uses 1.1.

## Layer 3: resolution

Throughout this layer `[DecidableEq V]`.

### 3.1 Resolvents and derivations

Define the **resolvent** `resolve C D l = C.erase l ∪ D.erase l.negate`, used when `l ∈ C` and
`¬l ∈ D`. Define the inductive predicate `Derivable S C`, "`C` has a resolution derivation from
`S`": every clause of `S` is derivable, and if `C` and `D` are derivable, `l ∈ C` and `¬l ∈ D`,
then `resolve C D l` is derivable. Define the sequence form `IsDerivation S L` for a list `L` of
clauses, most recent first: every member of `L` is in `S` or equals `resolve A B l` for members
`A`, `B` that occur after it in the list and some `l ∈ A` with `¬l ∈ B`. A **refutation** of `S`
is a derivation of `∅`. Prove:

- `derivable_iff_exists_isDerivation`: `Derivable S C` if and only if `C` is a member of some
  list `L` with `IsDerivation S L`;
- the relation between the two sizes: a derivation tree with `m` nodes yields a sequence of
  length at most `m`, and a clause in a sequence of length `m` has a derivation tree with at most
  `2^m − 1` nodes;
- soundness of the rule: an assignment satisfying `C` and `D` satisfies `resolve C D l`, for
  every literal `l`; hence `Derivable S C` implies `Entails S C`;
- monotonicity and cut: `Derivable` is monotone in `S`, and if every clause of `T` is derivable
  from `S` then every clause derivable from `T` is derivable from `S`;
- finiteness: a derivable clause is derivable from a finite subset of `S`;
- the subsumption lemma: if every clause of `S` has a subset in `T` and `C` is derivable from
  `S`, then some subset of `C` is derivable from `T`.

(The calculus is due to Robinson, 1965; proved here.)

**Checks.**

- `resolve {x, y} {¬x, z} x = {y, z}`, and `resolve {x} {¬x} x = ∅`.
- Clauses are sets, so no factoring rule is needed: `resolve {x, y} {¬x, y} x = {y}`.
- `resolve {x, ¬x} {¬x, y} x = {¬x, y}`: a resolvent on `x` may still contain the variable `x`
  when a premise is tautological.
- From `S = {{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}}` the list `[∅, {¬y}, {y}]` followed by the four
  clauses of `S` is a derivation, of length `7`.

*Needs:* 1.1.

### 3.2 Davis–Putnam variable elimination

For a formula `F` and a variable `v` define `eliminate F v` as the union of the set of clauses of
`F` in which `v` does not occur and the set of resolvents `resolve C D (v, true)` over the clauses
`C ∈ F` that contain `(v, true)` and not `(v, false)` and the clauses `D ∈ F` that contain
`(v, false)` and not `(v, true)`. Prove:

- `models_eliminate_iff`: `τ` is a model of `eliminate F v` if and only if
  `Function.update τ v b` is a model of `F` for some `b : Bool`;
- hence `F` and `eliminate F v` are equisatisfiable, `v` does not occur in `eliminate F v`, and
  the variables of `eliminate F v` are variables of `F`;
- every clause of `eliminate F v` is derivable from `F`.

(Davis and Putnam, 1960; proved here.)

**Checks.**

- `F = {{x, y}, {¬x, z}, {y, z}}` and `v = x`: `eliminate F x = {{y, z}}`.
- `F = {{x}, {¬x}}`: `eliminate F x = {∅}`. `F = {{x}}`: `eliminate F x = ∅`.
- Taking resolvents over all clauses containing `(v, true)` would leave `v` in the result: for
  `F = {{x, ¬x, y}, {¬x, z}}` the resolvent of the two clauses on `x` is `{¬x, y, z}`, whereas
  `eliminate F x = ∅`.

*Needs:* 1.1, 3.1.

### 3.3 Soundness and completeness

Prove, for every clause set `S` over every type `V` with decidable equality:

- `not_satisfiable_iff_derivable_empty`: `S` is unsatisfiable if and only if `Derivable S ∅`. For
  finite `S` completeness is proved by induction on the number of variables, using 3.2; the
  general case follows from 1.3 and the finiteness bullet of 3.1;
- `exists_isDerivation_of_not_satisfiable`: if `S` is unsatisfiable there is a list `L`, with
  `IsDerivation` from the non-tautological clauses of `S`, that contains `∅` and no tautological
  clause; so deleting tautologies, from the premises and from the derivation, preserves
  refutability;
- `exists_derivable_subset_of_entails`, the subsumption theorem: if `Entails S C` and `C` is not
  tautological, then some `D ⊆ C` has `Derivable S D`;
- deleting subsumed clauses preserves refutability: if `C, D ∈ S` and `D ⊂ C` then `S \ {C}` is
  refutable whenever `S` is, by the subsumption lemma of 3.1.

(Completeness is due to Robinson, 1965, and the subsumption theorem to Lee, 1967; proved here.)

**Checks.**

- The hypothesis that `C` is not tautological is needed in the subsumption theorem: the empty
  clause set entails `{x, ¬x}` and derives no clause at all.
- The subsumption theorem cannot be strengthened to derivability of `C` itself: `{{x}}` entails
  `{x, y}`, and the only clause derivable from `{{x}}` is `{x}`.
- The satisfiable set `{{x, y}, {¬x, y}}` derives `{y}` and not `∅`.
- For the set of all unit clauses over `V = ℕ` of both polarities, a refutation uses two clauses.

*Needs:* 1.1, 1.3, 3.1, 3.2.

### 3.4 Unit resolution and Horn clauses

Define the inductive predicate `UnitDerivable S C`: every clause of `S` is unit derivable, and if
the unit clause `{l}` and a clause `D` with `¬l ∈ D` are unit derivable then so is
`D.erase l.negate`. Define `Clause.IsHorn C`: at most one literal of `C` is positive. Prove:

- unit derivability implies derivability;
- `not_satisfiable_iff_unitDerivable_empty`: for every set `S` of Horn clauses, `S` is
  unsatisfiable if and only if `UnitDerivable S ∅`;
- the models of a set of Horn clauses are closed under pointwise conjunction, so a satisfiable
  set of Horn clauses has a least model, which makes true exactly the variables `v` whose unit
  clause `{(v, true)}` is unit derivable.

(Proved here.)

**Checks.**

- The Horn hypothesis is needed: the four clauses `{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}` are
  unsatisfiable, and unit resolution derives nothing from them beyond the four clauses.
- `{{x}, {¬x, y}, {¬y}}` is a set of Horn clauses with the unit refutation `{y}`, then `∅`.
- The empty clause and every clause of negative literals are Horn; `{x, y}` is not.

*Needs:* 1.1, 1.3, 3.1.

### 3.5 Pigeonhole formulas

Define `pigeonhole m n : CNF (Fin m × Fin n)`, with variable `(i, j)` read as "pigeon `i` is in
hole `j`": the clauses `{((i, j), true) : j}` for each pigeon `i`, and the clauses
`{((i, j), false), ((i', j), false)}` for each hole `j` and each pair of pigeons `i < i'`. Prove
`satisfiable_pigeonhole_iff`: `pigeonhole m n` is satisfiable if and only if `m ≤ n`. A model
chooses a hole for each pigeon injectively, which contradicts
`Fintype.exists_ne_map_eq_of_card_lt` when `n < m`; for `m ≤ n` the assignment
`(i, j) ↦ decide (i.val = j.val)` is a model. By 3.3 the formula has a resolution refutation when
`n < m`. (Proved here.)

**Checks.**

- For `n ≥ 1` the formula has `m + n · m (m − 1) / 2` clauses; `pigeonhole 2 1` is
  `{{p₀₀}, {p₁₀}, {¬p₀₀, ¬p₁₀}}`.
- `m = 0`: the formula is empty and satisfiable. `n = 0 < m`: every pigeon clause is the empty
  clause and the formula is `{∅}`.

*Needs:* 1.1; Mathlib `Fintype.exists_ne_map_eq_of_card_lt`.

### Examples

The parity constraint "an odd number of the variables of `X` are true" is expressed by the
`2^(|X| − 1)` clauses that each exclude one assignment of `X` with an even number of true
variables. On the triangle with edge variables `a, b, c`, the three vertex constraints with
parities odd, even, even give six clauses that are unsatisfiable; resolution refutes them and
unit resolution derives nothing new, since no clause is a unit clause.

### Dependencies

Layer 3 uses 1.1 and 1.3, and Mathlib's pigeonhole principle for finite types in 3.5.

## Layer 4: unit propagation and the abstract Davis–Putnam–Logemann–Loveland systems

Throughout this layer `[DecidableEq V]`.

### 4.1 Unit propagation

For a clause set `S` and a set `M` of literals define the inductive predicate `Propagated S M l`:
every literal of `M` is propagated, and if `C ∈ S`, `l ∈ C` and `¬k` is propagated for every
`k ∈ C` other than `l`, then `l` is propagated. The set `M` need not be consistent. Prove:

- closure: `M ↦ {l | Propagated S M l}` is extensive, monotone and idempotent, and it is the
  least set containing `M` that is closed under the propagation rule; so any sequence of single
  propagation steps from `M` that ends in a closed set ends in this set, whatever the order;
- soundness: an assignment that is a model of `S` and makes every literal of `M` true makes every
  propagated literal true;
- `propagated_iff_unitDerivable`: `Propagated S M l` if and only if the unit clause `{l}` is unit
  derivable from `S` together with the unit clauses of the literals of `M`;
- a clause `C` is unit derivable from `S` together with the unit clauses of `M` if and only if
  `C ⊆ D` for a clause `D` of that set such that `¬k` is propagated for every `k ∈ D \ C`; in
  particular `∅` is unit derivable if and only if some clause of that set has the negations of
  all its literals propagated.

(Proved here.)

**Checks.**

- `S = {{x}, {¬x, y}, {¬y, z}}`, `M = ∅`: the propagated literals are `x, y, z`. Adding the clause
  `{¬z, ¬x}` makes `¬x` and `¬z` propagated as well: the closure is inconsistent and `∅` is unit
  derivable.
- `S = {{x, y}}`, `M = ∅`: nothing is propagated; with `M = {¬x}` the literal `y` is.
- `S = {∅}`: nothing is propagated from `M = ∅`, and yet `∅` is unit derivable; the last bullet
  covers this through the clause `D = ∅`.

*Needs:* 1.1, 3.4.

### 4.2 States and rules

Define `Trail V := List (Literal V × Bool)`, most recent literal first, the mark `true` meaning
a **decision literal**; `Trail.lits M`, the finite set of literals of `M`; the type `State V`
with constructors `fail` and `run M F` for a trail `M` and a formula `F`, the latter written
`M ‖ F`; the type `Rule` of the nine rule names; and the inductive relation
`Step : Rule → State V → State V → Prop` with one constructor for each rule:

- `unitPropagate`: `M ‖ F` steps to `(l, false) :: M ‖ F` if some `C ∈ F` contains `l`, every
  other literal of `C` is false in `M`, and `l` is undefined in `M`;
- `pureLiteral`: `M ‖ F` steps to `(l, false) :: M ‖ F` if `l` occurs in a clause of `F`, `¬l`
  occurs in no clause of `F`, and `l` is undefined in `M`;
- `decide`: `M ‖ F` steps to `(l, true) :: M ‖ F` if the variable of `l` is in `CNF.vars F` and
  `l` is undefined in `M`;
- `fail`: `M ‖ F` steps to `fail` if some clause of `F` is false in `M` and `M` has no decision
  literal;
- `backtrack`: `N ++ (l, true) :: M ‖ F` steps to `(¬l, false) :: M ‖ F` if some clause of `F`
  is false in the whole trail and `N` has no decision literal;
- `backjump`: `N ++ (l, true) :: M ‖ F` steps to `(l', false) :: M ‖ F` if some clause of `F` is
  false in the whole trail and there are a clause `C'` and a literal `l'` such that `F` entails
  `insert l' C'`, `C'` is false in `M`, `l'` is undefined in `M`, and the variable of `l'` occurs
  in `F` or in the whole trail;
- `learn`: `M ‖ F` steps to `M ‖ insert C F` if `F` entails `C` and every variable of `C` occurs
  in `F` or in `M`;
- `forget`: `M ‖ insert C F` steps to `M ‖ F` if `F` entails `C`;
- `restart`: `M ‖ F` steps to `[] ‖ F`.

Define the rule sets `classicalDPLL` (`unitPropagate`, `pureLiteral`, `decide`, `fail`,
`backtrack`), `basicDPLL` (`unitPropagate`, `decide`, `fail`, `backjump`) and `cdcl` (`basicDPLL`
with `learn`, `forget` and `restart`); `StepIn R S T`, a step by some rule of `R`;
`Reachable R F S`, the reflexive transitive closure of `StepIn R` from `[] ‖ F`; and
`IsFinal R S`, no step by a rule of `R` leaves `S`. (Nieuwenhuis, Oliveras and Tinelli 2006,
Definitions 2.1, 2.4, 2.5 and 2.14.)

Prove the structural invariants of states `M ‖ G` reachable from `[] ‖ F` by any of the nine
rules: the variables of the literals of `M` and the variables of `G` are variables of `F`, and
`M` contains no literal twice and no literal together with its negation. (Nieuwenhuis, Oliveras
and Tinelli 2006, Lemma 2.7, items 1 and 2; proved here for the nine rules.)

**Checks.**

- `F = {{x}, {¬x, y}}`: two `unitPropagate` steps lead from `[] ‖ F` to
  `[(y, false), (x, false)] ‖ F`, which is final for every rule set above without `restart`,
  `learn` and `forget`; the head of the list is the literal assigned last.
- `F = {∅}`: `fail` applies to `[] ‖ F`. `F = ∅`: no rule of `basicDPLL` applies to `[] ‖ F`.
- `forget` with `C ∈ F` is a step from a state to itself, as is `learn` of a clause already in
  the formula, and `restart` from an empty trail; a derivation may therefore repeat a state.
- A `unitPropagate` rule without the requirement that `l` be undefined would allow
  `[(x, false)] ‖ {{x}}` to step to a trail containing `x` twice, against the invariant.

*Needs:* 1.1; Mathlib `Relation.ReflTransGen`.

### 4.3 Classical DPLL

Prove `classicalDPLL_final`: if `S` is reachable from `[] ‖ F` by the rules of `classicalDPLL`
and is final for them, then `S = fail` if and only if `F` is unsatisfiable, and if `S = M ‖ G`
then every clause of `F` contains a literal of `M`. The proof keeps the invariant that, for every
initial segment `P` of the trail in order of assignment and every model of `F` making the decision
literals of `P` true, the assignment obtained from that model by making all literals of `P` true
is again a model of `F`; the pure literal rule preserves it because the value of a pure literal
can be changed to `true` in a model.
(Nieuwenhuis, Oliveras and Tinelli 2006, stated without proof after Definition 2.1; proved here.)

**Checks.**

- `F = {{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}}`: `decide x`, `unitPropagate y`, `backtrack` to `¬x`,
  `unitPropagate y`, `fail` is a derivation of five steps ending in `fail`.
- `F = {{x, y}}`: `pureLiteral x` followed by `pureLiteral y` reaches a final state whose trail
  contains a literal of the clause; here `x` is not entailed by `F`, so trail literals of this
  system are not consequences of the formula and the decisions.

*Needs:* 1.1, 1.2, 4.2.

### 4.4 The progress measure

For a trail `M` of length `k` and a number `n ≥ k`, define the **potential**

    P(M, n) = (2^(n − k + 1) − 2) + Σ (2^(n − i) − 1),

the sum over the positions `i`, counted from `0` at the oldest entry, at which `M` has a decision
literal. Let `n` be the number of variables of `F`. Prove that along every step from a state
`M ‖ G` reachable from `[] ‖ F` by rules other than `restart`, to a state `M' ‖ G'`:
`P(M', n) < P(M, n)` for the rules `unitPropagate`, `pureLiteral`, `decide`, `backtrack` and
`backjump`, and `M' = M` for `learn` and `forget`. Since `P([], n) = 2^(n+1) − 2` and no step
leaves `fail`, conclude `ncard_progress_steps_lt`: if `s : ℕ → State V` and `r : ℕ → Rule` satisfy
`s 0 = [] ‖ F`, `Step (r i) (s i) (s (i + 1))` and `r i ≠ restart` for all `i < N`, then the
number of `i < N` with `r i` neither `learn` nor `forget` is less than
`2 ^ ((CNF.vars F).card + 1)`. In particular the relations `StepIn classicalDPLL` and
`StepIn basicDPLL` admit no infinite derivation from `[] ‖ F`. (Nieuwenhuis, Oliveras and Tinelli
2006, Theorem 2.10, proves termination of the basic system by a lexicographic order on the
lengths of the decision levels; Blanchette, Fleury, Lammich and Weidenbach 2018, Theorem 1 in
Section 3.2 and Theorem 6 in Section 4.1, by lexicographic orders on the lists of those lengths
and on lists of weights. The potential and the bound are proved here.)

**Checks.**

- `n = 1`, `F = {{x}, {¬x}}`: `decide x`, `backjump` to `¬x`, `fail` has three progress steps,
  and `2^2 − 1 = 3`; the potentials of the three trails are `2`, `1`, `0`.
- The bound is attained for every `n`: on the formula of all `2^n` clauses that contain exactly
  one literal of each of `n` variables, deciding whenever possible and backtracking
  chronologically gives `2^(n+1) − 2` steps before `fail`.
- A decision at position `i` lowers the potential by exactly `1`, and a propagation at position
  `i` by `2^(n − i)`.
- The count `3^n` of all strings of marks "decision, propagated, unassigned" overestimates: for
  `n = 2` the longest derivation has `7` progress steps, not `9`.

*Needs:* 4.2.

### Examples

For `F = {{¬x, y}, {¬z, w}, {¬y, ¬w}}` the derivation `decide x`, `unitPropagate y`, `decide z`,
`unitPropagate w` reaches a trail in which `{¬y, ¬w}` is false. `backtrack` leads to the trail
with literals `x, y, ¬z` in order of assignment, and `backjump` with `C' = {¬x}` and `l' = ¬z`
leads to the same state, since `F` entails `{¬x, ¬z}`.

### Dependencies

Layer 4 uses 1.1, 1.2 and 3.4.

## Layer 5: clause learning and conflict analysis

Throughout this layer `[DecidableEq V]`.

### 5.1 Backjumping, learning, forgetting and restarts

For states reachable from `[] ‖ F` by the rules of `cdcl` together with `backtrack`, prove the
semantic invariants: the formula `G` of the state is equivalent to `F`, and every literal of the
trail that is not a decision literal is true in every model of `F` that makes true the decision
literals older than it (Nieuwenhuis, Oliveras and Tinelli 2006, Lemma 2.7, items 3 and 4).
Prove:

- `exists_step_fail_or_backjump`: if `M ‖ G` is reachable from `[] ‖ F` by `cdcl` and some clause
  of `G` is false in `M`, then `fail` or `backjump` applies to `M ‖ G`; when `M` has a decision
  literal, a backjump clause is the clause of the negations of the decision literals (Lemma 2.8
  of the same source);
- `Step.backjump_of_backtrack`: from a state reachable by `cdcl` together with `backtrack`, every
  `backtrack` step is a `backjump` step (the remark after Lemma 2.8; Blanchette, Fleury, Lammich
  and Weidenbach 2018, Lemma 3);
- `eq_fail_iff_not_satisfiable`: if `S` is reachable from `[] ‖ F` by `cdcl` and is final for
  `basicDPLL`, then `S = fail` if and only if `F` is unsatisfiable (Theorem 2.12, item 1);
- `models_of_isFinal`: if `M ‖ G` is reachable from `[] ‖ F` by `cdcl` and is final for
  `basicDPLL`, then `M` contains no literal with its negation, every clause of `G` contains a
  literal of `M`, and every assignment that makes all literals of `M` true is a model of `F`
  (Lemma 2.9 and Theorem 2.12, item 2). Consequently every clause of `F` that is not tautological
  contains a literal of `M`, and so does every clause of `F` if no `forget` step was used. The
  source calls a set of literals a model of `F` when it contains a literal of every clause of `F`,
  defines entailment through such models, and states item 2 as "`M` is a model of `F`"; with the
  entailment of 1.1, `forget` can remove a tautological clause, and the conclusion takes the form
  above;
- `eventually_learn_or_forget`: let `s : ℕ → State V`, `r : ℕ → Rule` with `s 0 = [] ‖ F` and
  `Step (r i) (s i) (s (i + 1))` for all `i`, the rules being any of the nine. Suppose restarts
  have **increasing periodicity**: whenever `i < j < k` are restart steps with no other restart
  step between `i` and `k`, the number of steps strictly between `i` and `j` that are neither
  `learn` nor `forget` is smaller than the number of such steps strictly between `j` and `k`.
  Then from some index on every step is a `learn` or a `forget` step. So a derivation with
  increasing periodicity of restarts and no infinite run of learning and forgetting steps is
  finite (Definition 2.15 and Theorem 2.16; without restarts this is Theorem 2.11). The proof
  uses 4.4: between two consecutive restarts there are fewer than `2^(n+1)` progress steps.

**Checks.**

- The trail of a final state need not contain a literal of every clause of `F` once `forget` is
  used: for `F = {{x, ¬x}}` the step `forget` leads to `[] ‖ ∅`, which is final for `basicDPLL`
  with an empty trail. Every assignment is a model of `F`, as `models_of_isFinal` says.
- Without the periodicity condition the conclusion fails: `decide x` followed by `restart`,
  repeated, is an infinite derivation from `[] ‖ {{x, y}}`.
- Learning and forgetting alone can run for ever: `learn {x, y}` from `[] ‖ {{x}, {y}}` followed
  by `forget {x, y}`, repeated; the theorem allows exactly this behaviour. From `[] ‖ {{x}}` the
  clause `{x, y}` cannot be learned, although it is entailed: `y` occurs neither in the formula
  nor in the trail.
- `F = {{x}, {¬x}}`: after `unitPropagate x` the clause `{¬x}` is false and the trail has no
  decision literal, so `fail` applies and `backjump` does not.

*Needs:* 1.1, 4.2, 4.4.

### 5.2 Implication trails and conflict analysis

Define `ReasonTrail V := List (Literal V × Option (Clause V))`, most recent first: an entry
`(l, none)` is a decision literal and an entry `(l, some R)` a literal with **reason** `R`;
`ReasonTrail.lits M` is its set of literals, and its **underlying trail** is the trail of 4.2
with the same literals, an entry being marked as a decision exactly when it has no reason. Define
`IsImplicationTrail S M` by recursion: the empty list is an implication trail, and `a :: M` is one
if `M` is, the literal of `a` is undefined in `M`, and, when `a` has a reason `R`, `R ∈ S`, the
literal of `a` is in `R` and every other literal of `R` is false in `M`. Define the **decision
level** `ReasonTrail.level M l` as the number of decision literals among the entries from the
oldest up to and including `l`; it is `0` when `l` is not on the trail, and every statement below
applies it to trail literals only. The **implication graph** of `M` has the trail literals as
vertices and an edge from `¬k` to `l` whenever `l` has a reason `R` and `k ∈ R`, `k ≠ l`.

Define the relation `AnalysisStep M D E`: `E = resolve R D l` for an entry `(l, some R)` of `M`
with `¬l ∈ D`. Define `InputDerivable S D E` inductively: `InputDerivable S D D`, and if
`InputDerivable S D E`, `R ∈ S`, `l ∈ R` and `¬l ∈ E` then `InputDerivable S D (resolve R E l)`.
Prove, for an implication trail `M` for `S`:

- the implication graph is acyclic, every edge leading from an older to a more recent literal;
- `inputDerivable_of_analysis`: if `D` is false in `M` and `E` is reached from `D` by analysis
  steps, then `InputDerivable S D E` and `E` is false in `M`; every literal of `E` is the negation
  of a trail literal from which the negation of some literal of `D` can be reached in the
  implication graph;
- if `InputDerivable S D E` then `E` is derivable by resolution from `S ∪ {D}`; with the cut rule
  of 3.1, a clause obtained by analysis from a clause of `G`, on an implication trail for `G`,
  where every clause of `G` is derivable from `F`, is derivable from `F`;
- `wellFounded_analysisStep`: the converse of `AnalysisStep M` is well founded; the sum of
  `2^p` over the positions `p` of the trail literals whose negation is in the clause decreases at
  each step;
- `exists_analysis_decisions`: if `D` is false in `M`, analysis leads from `D` to a clause all of
  whose literals are negations of decision literals of `M`; if `M` has no decision literal this
  clause is `∅`, and `S ∪ {D}` is refuted;
- `exists_analysis_asserting`, the first unique implication point: if `D` is false in `M` and the
  literal `l₀ ∈ D` has the highest level `j` among the negated literals of `D`, then analysis
  leads from `D` to a clause `E` containing a literal `l` with `¬l` of level `j` such that every
  other literal of `E` has its negation at a level smaller than `j`. The route resolves, while two
  literals of level `j` remain, on the most recent one, which is not the decision literal of level
  `j` and so has a reason. For `j = 0` the clause `E` is a unit clause;
- such a clause licenses a backjump when `j > 0`: if moreover `F` entails `E`, some clause of
  `F` is false in the underlying trail of `M`, and `M₀` is the part of the trail older than the
  decision literal of level `i + 1`, where `i < j` is at least the level of the negation of every
  literal of `E` other than `l`, then the rule `backjump` of 4.2 leads from the underlying trail
  to `(l, false) :: M₀` with `C' = E \ {l}` and `l' = l`.

(Nieuwenhuis, Oliveras and Tinelli 2006, Example 2.6, describes the analysis; Beame, Kautz and
Sabharwal 2004, Proposition 4, states that conflict clauses are derived by input resolution on
distinct variables; proved here.)

**Checks.**

- `S = {{¬x, y}, {¬y, ¬z, w}, {¬w, ¬y}}` and the trail, oldest first, `x` (decision), `y` (reason
  `{¬x, y}`), `z` (decision), `w` (reason `{¬y, ¬z, w}`): the levels are `1, 1, 2, 2`. The clause
  `{¬w, ¬y}` is false; one step, on `w`, gives `{¬y, ¬z}`, which has exactly one literal of level
  `2`; a further step on `y` gives `{¬x, ¬z}`, the clause of negated decisions.
- In that example the backjump to level `1` puts `¬z` after `x, y`.
- If the trail has no decision literal the analysis of a false clause ends in `∅`: for
  `S = {{x}, {¬x, y}, {¬y}}` and the trail `x, y` with reasons `{x}` and `{¬x, y}`, the clause
  `{¬y}` gives `{¬x}` and then `∅`.
- The level of a decision literal counts itself: a definition counting only the strictly older
  decisions would give `z` level `1` in the first example and the clause `{¬y, ¬z}` two literals
  of the same level.

*Needs:* 1.1, 3.1, 4.2.

### Examples

In the example of 5.2, the clause `{¬y, ¬z}` is entailed by `S`, so `learn` adds it, and after
the backjump it is the clause by which `unitPropagate` would have produced `¬z` from `y`.

### Dependencies

Layer 5 uses 1.1, 3.1, 4.2 and 4.4.

## Layer 6: clausal proof systems

Throughout this layer `[DecidableEq V]`.

### 6.1 Reverse unit propagation

Define `IsRUP S C`: the empty clause is unit derivable (3.4) from `S` together with the unit
clauses `{¬l}`, `l ∈ C`. By 4.1 this says that the propagation closure of the negations of `C`
falsifies a clause of `S` or contains a literal of `C`. Prove:

- `IsRUP.entails`: `IsRUP S C` implies `Entails S C`;
- every clause with a subset in `S`, and every tautological clause, has the property; the
  property is monotone in `S` and in `C`;
- `InputDerivable.isRUP`: if `IsRUP S D` and `InputDerivable S D E` then `IsRUP S E`; hence every
  clause obtained by the conflict analysis of 5.2 from a clause of `S`, on an implication trail
  for `S`, has the property (Beame, Kautz and Sabharwal 2004, Proposition 3, for derivations on
  distinct variables);
- hints. Define `UnitChain M hints` for a finite set `M` of literals and a list of clauses by
  recursion: it is false for the empty list, and `UnitChain M (D :: hints)` holds if all literals
  of `D` are false in `M`, or some `l ∈ D` has all other literals of `D` false in `M` and
  `UnitChain (insert l M) hints` holds. Prove `isRUP_iff_exists_unitChain`: for a non-tautological
  clause `C`, `IsRUP S C` if and only if `UnitChain` holds for the set of negations of the
  literals of `C` and some list of clauses of `S`. The implication from a chain to the property
  holds for every clause.

(The property and its name "asymmetric tautology" are in Wetzler, Heule and Hunt 2014, Section 2,
and Järvisalo, Heule and Biere 2012, Section 3.1; hints that "become unit from left to right" are
the content of the format of Cruz-Filipe, Heule, Hunt, Kaufmann and Schneider-Kamp 2017, Sections
1 and 3. Proved here.)

**Checks.**

- `S = {{x}, {¬x, y}, {¬y, z}}` and `C = {z}`: starting from `¬z`, the three clauses in this
  order form a chain, giving `x`, then `y`, then a false clause. The list
  `[{¬x, y}, {x}, {¬y, z}]` is not a chain: its first clause has two literals that are not false.
- The converse of `IsRUP.entails` fails: the four clauses `{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}`
  entail `∅`, which does not have the property.
- The hypothesis on tautologies in the last bullet is needed: for `S = ∅` and `C = {x, ¬x}` the
  property holds and no chain exists, since the list of hints would be empty.
- If `∅ ∈ S` every clause has the property. The formulation by asymmetric literal addition in the
  sources differs here: it adds no literal on account of the empty clause.

*Needs:* 1.1, 3.4, 4.1; for the third bullet, 5.2.

### 6.2 Resolution asymmetric tautologies

Define `IsRAT S C l`: `l ∈ C` and, for every `D ∈ S` with `¬l ∈ D`,
`IsRUP S (C ∪ D.erase l.negate)`. A clause `C` is **blocked** on `l` with respect to `S` if
`l ∈ C` and, for every `D ∈ S` with `¬l ∈ D`, the clause `C ∪ D.erase l.negate` is tautological.
Prove:

- `models_insert_or_models_update`: let `l ∈ C` and suppose `S` entails `C ∪ D.erase l.negate` for
  every `D ∈ S` with `¬l ∈ D`. If `τ` is a model of `S`, then `τ` or `Function.update τ l.1 l.2`
  is a model of `insert C S`. So `S` and `insert C S` are equisatisfiable;
- the hypothesis holds when `IsRAT S C l`, by `IsRUP.entails`; a clause with `IsRUP S C` satisfies
  `IsRAT S C l` for each `l ∈ C`, and a clause blocked on `l` satisfies `IsRAT S C l`;
- a clause containing a literal that is pure in `S` is blocked on it;
- extension: if `x` does not occur in `F` and is not the variable of the literals `a`, `b`, then
  the clauses `{(x, false), a}`, `{(x, false), b}` and `{(x, true), ¬a, ¬b}`, added to `F` one
  after the other in any order, are each blocked on their literal of `x` with respect to the
  formula they are added to; the models of the result are the models `τ` of `F` with `τ x` equal
  to the conjunction of the values of `a` and `b`.

(Järvisalo, Heule and Biere 2012, Definition 3 and Proposition 1; the form of the definition with
the whole clause `C` in the resolvent is that of Wetzler, Heule and Hunt 2014, Section 2. Blocked
clauses are due to Kullmann, 1999. Proved here, under entailment of the resolvents in place of
their reverse unit propagation property.)

**Checks.**

- Satisfiability is preserved and equivalence is not: `S = {{a, b}}` and `C = {¬a, ¬b}` with
  `l = ¬a`. The only clause with `a` gives `{¬a, ¬b, b}`, a tautology, so `IsRAT S C l`; `C` is
  not entailed by `S`, whose model `a, b ↦ true` falsifies it, and changing `a` to `false` gives a
  model of both clauses.
- `S = {{¬a, b}, {a, c}, {b, ¬c}}`: the clause `{a}` satisfies `IsRAT` on `a`, since `{a, b}`
  has the reverse unit propagation property, and `{a}` itself does not have it (Wetzler, Heule
  and Hunt 2014, Example 1).

*Needs:* 1.1, 6.1.

### 6.3 Deletion and DRAT proofs

Define the type `ProofStep V` with constructors `add C` and `delete C`; the formula
`applySteps F π` obtained from `F` by inserting and erasing clauses along the list `π`; and
`IsDRATProof F π` by recursion on `π`: the empty list is a proof; `add C :: π` is a proof from `F`
if `IsRUP F C` or `IsRAT F C l` for some `l`, and `π` is a proof from `insert C F`; and
`delete C :: π` is a proof from `F` if `π` is a proof from `F.erase C`. Prove
`satisfiable_applySteps`: if `IsDRATProof F π` and `F` is satisfiable then `applySteps F π` is
satisfiable. Hence if `IsDRATProof F π` and `∅ ∈ applySteps F π`, then `F` is unsatisfiable: a
**DRAT refutation** is sound. Conversely every unsatisfiable `F` has such a refutation consisting
of `add` steps with the reverse unit propagation property only, since each resolvent has that
property with respect to a set containing its premises, by 3.3. (Wetzler, Heule and Hunt 2014,
Section 3, defines the sequence of formulas and the two tests; Cruz-Filipe, Heule, Hunt, Kaufmann
and Schneider-Kamp 2017, Section 2. Proved here.)

**Checks.**

- Deleting a clause preserves satisfiability and not unsatisfiability: erasing one of the four
  clauses `{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}` leaves a satisfiable formula. The system therefore
  certifies unsatisfiability of the initial formula only.
- For those four clauses, `[add {y}, add ∅]` is a refutation: `{y}` has the reverse unit
  propagation property, and then `∅` has it.
- `[add {¬a, ¬b}]` is a proof from `{{a, b}}` whose result is not equivalent to `{{a, b}}`.

*Needs:* 1.1, 3.1, 3.3, 6.1, 6.2.

### 6.4 Comparison with the conjunctive normal forms of Lean core

Define `ofStd f : CNF V` for `f : Std.Sat.CNF V` as the finite set of the finite sets of literals
of the clauses of `f` (`Std.Sat.CNF.clauses`, `Std.Sat.CNF.Clause.literals`). Prove
`sat_iff_models_ofStd`: `Std.Sat.CNF.Sat τ f` if and only if `Models τ (ofStd f)`, by
`Std.Sat.CNF.sat_iff_all_mem_sat` and `Std.Sat.CNF.Clause.sat_iff_exists_mem_eq`. Hence
`Std.Sat.CNF.Unsat f` if and only if `ofStd f` is unsatisfiable, and every formula in the sense
of 1.1 is `ofStd f` for some `f`. (Proved here.)

**Checks.**

- A formula of Lean core with the clause `x ∨ x` listed twice is sent to `{{x}}`: order and
  repetition are forgotten and the models are the same.

*Needs:* 1.1; Lean core `Std.Sat.CNF`, `Std.Sat.CNF.Sat`, `Std.Sat.CNF.sat_iff_all_mem_sat`,
`Std.Sat.CNF.Clause.sat_iff_exists_mem_eq`.

### Examples

For `F = {{x, y}, {¬x, y}, {x, ¬y}, {¬x, ¬y}}` and a variable `z` not in `F`, the list
`[add {(z, true)}, delete {x, y}, add {y}]` is not a DRAT proof: `{(z, true)}` is blocked on `z`,
but after the deletion `{y}` has neither property with respect to the three remaining clauses
and the unit clause of `z`. Indeed those four clauses are satisfiable and adding `{y}` makes
them unsatisfiable.

### Dependencies

Layer 6 uses 1.1, 3.1, 3.3, 3.4, 4.1 and 5.2, and Lean core's `Std.Sat.CNF` in 6.4.

## Downstream consumers

Reductions to satisfiability use the clause sets of 1.1 and the Tseitin transformation of 2.3,
whose clauses have at most three literals and whose size is linear. Lower bounds for resolution
use the sequence form of derivations of 3.1, with the length of the list as the measure of size,
and the pigeonhole formulas of 3.5. Statements about the power of clause learning relative to
resolution use the input derivations of 5.2. The comparison of clausal proof systems with
resolution uses 6.1 to 6.3, and statements about Lean core's formulas are transported by 6.4.

## Scope and ownership

This roadmap owns:

- clauses, clause sets, models, entailment, restriction and the compactness theorem of
  propositional logic for clause sets;
- propositional formulas with their evaluation, the distributive translation and the Tseitin and
  Plaisted–Greenbaum transformations;
- the resolution calculus, its soundness and completeness, the subsumption theorem, variable
  elimination, unit resolution and its completeness for Horn clauses, and the pigeonhole formulas
  with their satisfiability;
- unit propagation as a closure operator, the abstract Davis–Putnam–Logemann–Loveland transition
  systems with their soundness, completeness and termination, implication trails and conflict
  analysis;
- the reverse unit propagation and resolution asymmetric tautology properties and the soundness of
  DRAT proofs.

Out of scope:

- verified implementations of solvers and of proof checkers, their data structures (watched
  literals, clause identifiers, file formats) and decision heuristics: every target above is a
  statement about a relation, a derivation or a set of models;
- complexity classes, NP-completeness, and the polynomial-time solvability of formulas with two
  literals per clause and of Horn formulas as complexity statements;
- lower bounds on the size of proofs, including those for the pigeonhole formulas of 3.5 and for
  parity formulas on graphs, and the comparison of proof systems by simulation;
- extended resolution as a proof system beyond the extension bullet of 6.2, and propagation
  redundancy;
- random formulas and the local lemma, satisfiability modulo theories, maximum satisfiability,
  quantified Boolean formulas and decision diagrams;
- first-order logic: Mathlib's `FirstOrder.Language.Theory.isSatisfiable_iff_isFinitelySatisfiable`
  is the compactness theorem for first-order theories, and 1.3 is proved directly from the
  compactness of `V → Bool` and does not pass through it.

Relation to what Lean and Mathlib contain:

- Mathlib's `Mathlib/Tactic/Sat/FromLRAT.lean` defines `Sat.Literal`, `Sat.Clause`, `Sat.Fmla`
  and `Sat.Valuation` in a `meta` section, as the machinery of the `lrat_proof` command: literals
  over natural-number variables, clauses and formulas as lists, and valuations with values in
  `Prop`. They are the internal vocabulary of that command; this roadmap states nothing about
  them.
- Lean core's `Std.Sat.Literal` is the plain product `V × Bool` and is reused as the literal
  type. Its `Std.Sat.CNF` stores a clause as an array of atoms with a byte array of polarities
  and a formula as an array of clauses: order and multiplicity are data, there are no infinite
  clause sets, and the lemmas are those needed by a checker. It is therefore not used as the
  carrier; 6.4 above relates the two semantics exactly.
- Lean core proves `Std.Sat.CNF.exists_sat_add_of_rat`, the preservation of satisfiability by a
  clause whose resolvents on a literal are entailed, for `Std.Sat.CNF`; 6.2 above states it for
  arbitrary clause sets with the explicit model. Lean core's
  `Std.Tactic.BVDecide.LRAT.check_sound` states that a successful run of its checker on
  `cnf : Std.Sat.CNF ℕ` implies `cnf.Unsat`; by 6.4 that conclusion is unsatisfiability of
  `ofStd cnf`. The checker itself is outside this roadmap.

No roadmap of this repository states any of the material above. ComputabilityTheory treats
computable functions and degrees and has no propositional logic.

Formalizations elsewhere, as reference material and not as the specification: the IsaFoL
development of Fleury and Blanchette in Isabelle/HOL, described in Blanchette, Fleury, Lammich and
Weidenbach 2018, which contains the abstract systems of Layers 4 and 5 and a refinement to a
verified solver; Marić's entry "Formal Verification of Modern SAT Solvers" in the Archive of
Formal Proofs; the verified checkers of Cruz-Filipe, Heule, Hunt, Kaufmann and Schneider-Kamp in
Coq and ACL2; the checker `cake_lpr` of Tan, Heule and Myreen in CakeML; and the checker of Lean
core named above.

## Exact supplier contracts

### From Mathlib

- `Function.compactSpace` (`Mathlib/Topology/Compactness/Compact.lean`): `ι → Y` is compact when
  `Y` is; used with `Y = Bool`, compact as a finite space (`Finite.compactSpace`, same file).
- `CompactSpace.iInter_nonempty` (same file): in a compact space, a family of closed sets all of
  whose finite subfamilies have nonempty intersection has nonempty intersection.
- `continuous_apply` (`Mathlib/Topology/Constructions.lean`): the coordinate maps of a product
  are continuous. `isClosed_discrete` (`Mathlib/Topology/Order.lean`): every subset of a discrete
  space is closed.
- `Fintype.exists_ne_map_eq_of_card_lt` (`Mathlib/Data/Fintype/Pigeonhole.lean`): a map between
  finite types with `Fintype.card β < Fintype.card α` takes the same value at two distinct points.
- `Relation.ReflTransGen` (`Mathlib/Logic/Relation.lean`), `Function.update`, `Set.ncard` and
  `Finset.image₂`, as the vocabulary of the statements.

### From Lean core

- `Std.Sat.Literal` and `Std.Sat.Literal.negate` (`Std/Sat/CNF/Literal.lean`): `Literal α` is
  `α × Bool` and `negate l = (l.1, !l.2)`.
- `Std.Sat.CNF`, its field `clauses`, and `Std.Sat.CNF.Clause.literals` (`Std/Sat/CNF/Basic.lean`):
  the list of literals of a clause; membership of a literal in a clause is membership in this
  list.
- `Std.Sat.CNF.Sat`, `Std.Sat.CNF.sat_iff_all_mem_sat` (a formula is satisfied if and only if all
  its clauses are) and `Std.Sat.CNF.Clause.sat_iff_exists_mem_eq` (a clause is satisfied by `a`
  if and only if some literal `lit` of it has `a lit.1 = lit.2`) (`Std/Sat/CNF/Sat.lean`).

## References

- P. Beame, H. Kautz and A. Sabharwal, *Towards understanding and harnessing the potential of
  clause learning*, J. Artificial Intelligence Res. **22** (2004), 319–351; read as
  arXiv:1107.0044.
- J. C. Blanchette, M. Fleury, P. Lammich and C. Weidenbach, *A verified SAT solver framework
  with learn, forget, restart, and incrementality*, J. Automat. Reason. **61** (2018), 333–365;
  read in the authors' manuscript of the journal version, whose theorem numbers are cited.
- L. Cruz-Filipe, M. J. H. Heule, W. A. Hunt Jr., M. Kaufmann and P. Schneider-Kamp, *Efficient
  certified RAT verification*, CADE 2017; read as arXiv:1612.02353.
- M. Järvisalo, M. J. H. Heule and A. Biere, *Inprocessing rules*, IJCAR 2012; read in the
  authors' copy.
- R. Nieuwenhuis, A. Oliveras and C. Tinelli, *Solving SAT and SAT modulo theories: from an
  abstract Davis–Putnam–Logemann–Loveland procedure to DPLL(T)*, J. ACM **53** (2006), 937–977;
  read in the authors' copy of the article.
- N. Wetzler, M. J. H. Heule and W. A. Hunt Jr., *DRAT-trim: efficient checking and trimming
  using expressive clausal proofs*, SAT 2014; read in the authors' copy.

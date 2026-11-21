# Roadmap: complexity of propositional satisfiability

**Summary.** This roadmap treats the difficulty of deciding and of refuting formulas in conjunctive
normal form. It has a combinatorial half, which needs no model of computation, and a
complexity-theoretic half. The first half describes the two classical fragments in which
satisfiability has a simple certificate, clauses with at most two literals and Horn clauses, and it
measures resolution refutations by their width and their size. The second half defines polynomial
time on the Turing machines of Mathlib, the classes P and NP of languages of bit strings and
polynomial-time many-one reductions, and places satisfiability and its fragments in them. A clause
is a finite set of literals over an arbitrary type of variables, a language is a set of finite bit
strings, and polynomial time means that the number of steps of a machine is bounded by a polynomial
in the length of its input. Every target is a theorem about these objects; no procedure is
specified and no running time is claimed outside the machine model.

The headline theorems are the following.

- A set of clauses, finite or infinite, each with at most two literals, is satisfiable if and only
  if it does not contain the empty clause and no literal is joined to its negation by chains of
  implications in both directions, where a clause "not `a`, or `b`" is read as the implication from
  `a` to `b` (Aspvall, Plass and Tarjan).
- If a formula `F` with `n` variables, whose widest clause has `w(F)` literals, has a resolution
  refutation with `S` clauses, then it has one in which every clause has at most
  `w(F) + 2 ⌈√(2 n ln S)⌉` literals; if it has a tree-like refutation with `s` nodes, it has one
  of width at most `w(F) + log₂ s` (Ben-Sasson and Wigderson).
- For `n ≥ 1`, every resolution refutation of the pigeonhole formula with `n + 1` pigeons and `n`
  holes has at least `2^((n + 1)/20)` clauses (Haken, with the bound of Beame, Karp, Pitassi and
  Saks).
- Every language in NP is polynomial-time many-one reducible to the language of satisfiable
  formulas in conjunctive normal form, which is itself in NP (Cook and Levin). That language
  reduces to its restriction to clauses with at most three literals, whereas the restrictions to
  clauses with at most two literals and to Horn clauses are in P.

The roadmap builds on PropositionalSatisfiability, which supplies clause sets and their models,
the resolution calculus with its derivations in sequence form, unit resolution for Horn clauses,
the Tseitin transformation and the pigeonhole formulas. It builds on Mathlib's stack Turing
machines with a bound on the number of steps, which are the model of computation, and on Mathlib's
simple graphs for the reduction of satisfiability to independent sets.

## How to read the build

Layer 1 below treats clauses with at most two literals and Layer 2 Horn clauses and their
renamings. Layer 3 defines the width and the tree size of resolution derivations and proves the
relations between width and size and the lower bound for the pigeonhole formulas. Layer 4 is the
complexity framework: polynomial-time functions, pairing, P, NP and reductions. Layer 5 encodes
formulas as bit strings and proves the membership and hardness theorems. Layers 1 to 3 do not use
Layers 4 and 5; Layer 2 uses the criterion of Layer 1 once, Layer 3 its bound on the resolution
closure, Layer 4 uses no other layer, and Layer 5 uses Layers 1 and 4.

## Conventions

- `V` is an arbitrary type of **variables**; statements that form clauses from literals assume
  `[DecidableEq V]`, and a statement assumes `V` finite only where it says so.
- Literals, clauses, formulas and their semantics are those of PropositionalSatisfiability 1.1: a
  **literal** is an element of `Std.Sat.Literal V`, which is `V × Bool`, with `(v, true)` positive,
  and `¬l` denotes `Std.Sat.Literal.negate l`; `Clause V` is `Finset (Literal V)` and `CNF V` is
  `Finset (Clause V)`; a **clause set** is any `S : Set (Clause V)`; `Satisfies τ C`, `Models τ S`
  and `Satisfiable S` are satisfaction of a clause, of a clause set, and satisfiability;
  `Clause.vars` and `CNF.vars` are the sets of variables. `Clause.IsHorn`, `resolve`, `Derivable`,
  `IsDerivation` and `pigeonhole` are those of PropositionalSatisfiability 3.1, 3.4 and 3.5.
- The **width** of a clause is its number of literals, `C.card`. A clause set has **width at most
  `k`** if each of its clauses has at most `k` literals; the empty clause and unit clauses are
  allowed. For a formula `F`, `n` denotes the number `(CNF.vars F).card` of its variables.
- A derivation in sequence form is a list of clauses, most recent first, and its **length** is the
  length of the list; a clause that occurs twice is counted twice.
- `log₂` in a statement about natural numbers is `Nat.log 2`, the integer part of the logarithm;
  `ln` is `Real.log`; `⌈x⌉` is `Nat.ceil x`.
- A **bit string** is an element of `List Bool` and `|x|` is its length. A **language** is an
  element of Mathlib's `Language Bool`, which is `Set (List Bool)`.
- A **machine** is an element of Mathlib's `Turing.FinTM2`: finitely many stacks, labels and
  internal states, an input stack and an output stack. Only the alphabet of the input stack is
  required to be finite; a machine nevertheless writes finitely many symbols, those that its
  finitely many statements produce from its finitely many internal states. Its **time** on an
  input is the number of applications of its step function until it halts, each application
  executing the statement of one label. A **polynomial** is an element of `Polynomial ℕ`.

## Layer 1: clauses with at most two literals

Throughout this layer `[DecidableEq V]`.

### 1.1 The resolution closure

Prove that a resolvent of two clauses of width at most `2` has width at most `2`, so every clause
derivable from a clause set of width at most `2` has width at most `2`; and that every clause
derivable from a formula `F` has its variables in `CNF.vars F`. Deduce
`encard_derivable_le`: for a formula `F` of width at most `2` with `n` variables, the set of
clauses `C` with `Derivable F C` has at most `2 n² + n + 1` elements, the number of sets of at most
two of the `2 n` literals (`Finset.card_powersetCard`). Hence, by PropositionalSatisfiability 3.3,
an unsatisfiable formula of width at most `2` has a refutation in sequence form, without repeated
clauses, of length at most `2 n² + n + 1` in which every clause has width at most `2`.
(Proved here.)

**Checks.**

- `1 + 2 n + (2 n)(2 n − 1)/2 = 2 n² + n + 1`; for `n = 1` the four clauses are `∅`, `{x}`,
  `{¬x}` and `{x, ¬x}`, and all four are derivable from `{{x}, {¬x}, {x, ¬x}}`.
- The bound is attained for every `n` by the formula of all clauses of width at most `2`.
- Width `3` is not closed: for distinct variables, `resolve {x, a, b} {¬x, c, d} x` has four
  literals.

*Needs:* PropositionalSatisfiability 3.1 (`resolve`, `Derivable`, `IsDerivation`,
`derivable_iff_exists_isDerivation`), 3.3 (`not_satisfiable_iff_derivable_empty`); Mathlib
`Set.encard`, `Finset.card_powersetCard`.

### 1.2 The implication relation and the satisfiability criterion

For a clause set `S` define the relation `Implies S` on literals: `Implies S a b` holds if the
clause `{¬a, b}` belongs to `S`. So a clause `{l, k}` with `l ≠ k` gives the two pairs `(¬l, k)`
and `(¬k, l)`, a unit clause `{l}` gives the single pair `(¬l, l)`, and clauses with no literal
or with more than two give none. A **chain** from `a` to `b` is an instance of
`Relation.ReflTransGen (Implies S) a b`. Prove:

- contraposition: `Implies S a b` if and only if `Implies S ¬b ¬a`, hence the same for chains;
- soundness: if `τ` is a model of `S`, there is a chain from `a` to `b` and `a` is true under `τ`,
  then `b` is true under `τ`;
- `satisfiable_iff_not_reflTransGen_implies`: if `S` has width at most `2`, then `S` is
  satisfiable if and only if `∅ ∉ S` and there is no literal `l` with a chain from `l` to `¬l`
  and a chain from `¬l` to `l`;
- consequences of a satisfiable set: if `S` has width at most `2` and is satisfiable, then `S`
  entails the unit clause `{l}` if and only if there is a chain from `¬l` to `l`, and `S` entails
  `{¬a, b}` if and only if there is a chain from `a` to `b`, or from `a` to `¬a`, or from `¬b` to
  `b`.

For a finite `S` the criterion follows from the second bullet and from 1.1: a refutation of `S`
has width at most `2`, a derivable clause `{¬a, b}` yields a chain from `a` to `b` by induction on
the derivation, and the last step of a refutation resolves `{l}` with `{¬l}`. The general case
follows from the compactness theorem, PropositionalSatisfiability 1.3, because a chain uses
finitely many clauses. (The criterion is due to Aspvall, Plass and Tarjan, 1979; proved here.)

**Checks.**

- `S = {{x, y}, {¬x, y}, {¬y}}`: the pairs are `(¬x, y)`, `(¬y, x)`, `(x, y)`, `(¬y, ¬x)` and
  `(y, ¬y)`. There are chains `¬y → x → y` and `y → ¬y`, and `S` is unsatisfiable.
- The unit convention: `{{x}}` gives only `(¬x, x)` and is satisfiable; `{{x}, {¬x}}` gives
  `(¬x, x)` and `(x, ¬x)` and is unsatisfiable. A relation that ignored unit clauses would call
  the second set satisfiable.
- The condition `∅ ∉ S` is needed: `{∅}` has no pairs at all and is unsatisfiable.
- The width hypothesis is needed: the eight clauses with three literals on `x, y, z` are
  unsatisfiable, do not contain `∅`, and give no pairs.
- A tautological clause `{x, ¬x}` gives the two loops `(x, x)` and `(¬x, ¬x)` only.

*Needs:* PropositionalSatisfiability 1.1 (`Entails`), 1.3 (`satisfiable_iff_forall_finset`), 3.1,
3.3 (`not_satisfiable_iff_derivable_empty`); 1.1; Mathlib `Relation.ReflTransGen`; Lean core
`Std.Sat.Literal.negate`.

### 1.3 Closure under majority

The **majority** of three assignments `σ, τ, ρ` is the assignment whose value at `v` is the value
taken by at least two of `σ v`, `τ v`, `ρ v`. Prove:

- if `S` has width at most `2`, the majority of three models of `S` is a model of `S` (for
  clauses with exactly two literals: Chen 2006, Section 1, footnote 2; for unit clauses it is
  immediate);
- `exists_cnf_card_le_two_of_majority_mem`: if `V` is finite and a set `M` of assignments
  contains the majority of any three of its elements, then `M` is the set of models of a formula
  of width at most `2`. One such formula consists of all clauses of width at most `2` that are
  satisfied by every element of `M`: an assignment `τ` satisfying them agrees, on every set of at
  most two variables, with some element of `M`, and majorities of elements of `M` then agree with
  `τ` on larger and larger sets of variables.

(The characterization is among those that Schaefer used in 1978 to classify Boolean constraint
problems; the second bullet is proved here.)

**Checks.**

- On three variables, `M = {100, 010, 001}` is not closed: the majority of its elements is `000`.
  The clauses of width at most `2` satisfied on `M` are satisfied by exactly four assignments,
  the elements of `M` and `000`.
- `M = ∅` is closed and is the set of models of `{∅}`; if `V` is empty the two sets of assignments
  are the sets of models of `{∅}` and of the empty formula.
- Finiteness of `V` is needed: for `V = ℕ` the set of assignments with finitely many true values
  is closed under majority, and every clause satisfied by all of them contains a positive
  literal (the assignment that is true exactly on the variables of the clause is in the set, and
  it falsifies a clause with no positive literal), so the constant assignment `true`, which is not in the set, is a model of every such
  clause.

*Needs:* PropositionalSatisfiability 1.1.

### Examples

For `F = {{¬x, y}, {¬y, z}, {¬z, x}}` the chains join `x`, `y`, `z` in a cycle, and the same for
their negations; no literal is joined to its negation, and the two models are the constant
assignments. Adding `{x}` and `{¬z}` gives the chain `¬x → x → y → z → ¬z → ¬y → ¬x`, so the
five clauses are unsatisfiable.

### Dependencies

Layer 1 uses PropositionalSatisfiability 1.1, 1.3, 3.1 and 3.3, Lean core's negation of
literals, and Mathlib's reflexive transitive closure, extended cardinality of sets and count of
subsets of a given size.

## Layer 2: Horn clause sets

### 2.1 Closure under conjunction

By PropositionalSatisfiability 3.4 the models of a set of Horn clauses are closed under pointwise
conjunction. Prove the converse over finitely many variables,
`exists_cnf_isHorn_of_and_mem`: if `V` is finite and a set `M` of assignments contains the
pointwise conjunction of any two of its elements, then `M` is the set of models of a formula all
of whose clauses are Horn. One such formula consists of all Horn clauses satisfied by every
element of `M`: if `τ` satisfies them and `P` is the set of variables true under `τ`, the
elements of `M` that are true on `P` form a nonempty finite set whose conjunction is in `M` and
equals `τ`, since the negative clause on `P` and the clauses with negative part `P` and one
positive literal would otherwise be violated by `τ`. (Proved here.)

**Checks.**

- On two variables, `M = {10, 01}` is not closed. The Horn clauses satisfied on `M` are satisfied
  by exactly `00`, `10` and `01`; the clause `{x, y}` that excludes `00` is not Horn.
- `M = ∅` is the set of models of `{∅}`, and `∅` is a Horn clause.
- Finiteness of `V` is needed, by the example of 1.3: the assignments on `ℕ` with finitely many
  true values are closed under conjunction.

*Needs:* PropositionalSatisfiability 1.1, 3.4 (`Clause.IsHorn`).

### 2.2 Renaming

For `[DecidableEq V]`, an assignment `τ` and a clause `C` define the **renaming**
`Clause.rename τ C`, the image of `C` under the map that sends a literal `(v, b)` to
`(v, xor b (τ v))`: the polarity of the variables `v` with `τ v = true` is flipped. A clause set
`S` is **renamable Horn** if for some `τ` every `Clause.rename τ C`, `C ∈ S`, is a Horn clause.
Prove:

- renaming and models: `σ` is a model of the set of renamings by `τ` of the clauses of `S` if and
  only if `v ↦ xor (σ v) (τ v)` is a model of `S`; in particular the two sets are equisatisfiable;
- `forall_isHorn_rename_iff`: every `Clause.rename τ C`, `C ∈ S`, is Horn if and only if `τ` is a
  model of the clause set of all `{l, k}` with `l ≠ k` and `l, k ∈ C` for some `C ∈ S`. Indeed a
  literal is positive after the renaming exactly when it is false under `τ`;
- hence `S` is renamable Horn if and only if that clause set of two-element clauses is
  satisfiable, which 1.2 characterizes by chains of implications;
- unit resolution is refutationally complete for renamable Horn sets: such a set `S` is
  unsatisfiable if and only if `UnitDerivable S ∅`, by PropositionalSatisfiability 3.4, because
  renaming commutes with negation and with the unit resolution rule.

(The criterion is due to Lewis, 1978; proved here.)

**Checks.**

- `{{x, y}}` becomes Horn under the three renamings that flip `x`, `y` or both, and not under the
  identity, which is the renaming by the constant `false`; the three are the models of
  `{{x, y}}`. With the opposite convention, flipping the variables where `τ` is `false`, the
  constant `true` would be the identity: a model of `{{x, y}}` whose renaming is not Horn.
- `{{x, y, z}, {¬x, ¬y, ¬z}}` is not renamable Horn: its six two-element clauses force `x, y, z`
  to be pairwise different. The set is satisfiable, and unit resolution derives nothing from
  it.
- A clause that contains both literals of a variable has exactly one positive literal of that
  variable after every renaming, in agreement with the fact that every assignment satisfies the
  two-element clause `{(v, true), (v, false)}`.

*Needs:* PropositionalSatisfiability 1.1, 3.4 (`Clause.IsHorn`, `UnitDerivable`,
`not_satisfiable_iff_unitDerivable_empty`); 1.2.

### Examples

`S = {{x, y}, {¬x, ¬y}, {x, ¬y}}` is not a set of Horn clauses. Its two-element clauses are its
own three clauses, whose only model is `x ↦ true`, `y ↦ false`; flipping `x` gives the Horn set
`{{¬x, y}, {x, ¬y}, {¬x, ¬y}}`.

### Dependencies

Layer 2 uses PropositionalSatisfiability 1.1 and 3.4, and 1.2 above for the third bullet of 2.2.

## Layer 3: width and size of resolution refutations

Throughout this layer `[DecidableEq V]`.

### 3.1 Width, tree size and length

Define the **width** `CNF.width F` of a formula as the largest width of its clauses, and `0` for
the empty formula. Define two inductive predicates on the derivations of
PropositionalSatisfiability 3.1:

- `WidthDerivable S w C`, "`C` has a derivation from `S` of width at most `w`": every clause of
  `S` of width at most `w` is so derivable, and if `C` and `D` are, `l ∈ C`, `¬l ∈ D` and
  `resolve C D l` has width at most `w`, then `resolve C D l` is;
- `TreeDerivable S s C`, "`C` has a tree-like derivation from `S` with `s` nodes": every clause
  of `S` has one with `1` node, and if `C` has one with `s` nodes and `D` one with `t` nodes,
  `l ∈ C` and `¬l ∈ D`, then `resolve C D l` has one with `s + t + 1` nodes.

A clause of `S` used at several leaves of a tree is counted at each of them, and a derivation of
width at most `w` uses only clauses of `S` of width at most `w`. Prove:

- `WidthDerivable S w C` is monotone in `S` and in `w` and implies `Derivable S C`; for a formula
  `F` with `n` variables, `Derivable F C` implies `WidthDerivable F (2 n) C`;
- `Derivable S C` if and only if `TreeDerivable S s C` for some `s`, and every such `s` is odd;
- `TreeDerivable S s C` holds exactly when `C` has a derivation tree from `S` with `s` nodes, so
  the comparison of the two sizes of PropositionalSatisfiability 3.1 applies to this node count:
  if `TreeDerivable S s C` then `C` belongs to a list `L` with `IsDerivation S L` of length at
  most `s`, and a clause of a list `L` with `IsDerivation S L` of length `m` has
  `TreeDerivable S s C` for some `s ≤ 2^m − 1`;
- from width to length: if `F` has `n` variables and `WidthDerivable F w ∅`, then `F` has a
  refutation in sequence form of length at most `∑ i ≤ w, (2 n).choose i`, the number of
  clauses of width at most `w` in the variables of `F`;
- by 1.1, for a formula `F` of width at most `2`, `Derivable F C` if and only if
  `WidthDerivable F 2 C`;
- subsumption with width and size: if every clause of `S` has a subset in `T` and
  `WidthDerivable S w C`, then `WidthDerivable T w C'` for some `C' ⊆ C`; and if
  `TreeDerivable S s C`, then `TreeDerivable T s' C'` for some `C' ⊆ C` and some `s' ≤ s`. The
  induction is that of the subsumption lemma of PropositionalSatisfiability 3.1, whose statement
  records neither bound: when the resolved literal is missing from the subset found for one
  premise, that subset alone is kept, and otherwise the two subsets are resolved, which gives a
  subset of `resolve C D l`.

(Proved here.)

**Checks.**

- `F = {{x}, {¬x}}`: the refutation tree has `3` nodes and width `1`.
- The four clauses of two literals on `x, y`: the least number of nodes of a refutation tree is
  `7`, the least length of a refutation in sequence form is `7`, and the least width is `2`.
- The eight clauses of three literals on `x, y, z`: the smallest refutation tree has `15` nodes,
  eight leaves and seven resolvents, and the least width is `3`.
- `F = {∅, {x, y, z}}` has width `3` and `WidthDerivable F 0 ∅` holds: the width of a derivation
  does not count the unused clauses of `F`.

*Needs:* PropositionalSatisfiability 3.1 (`resolve`, `Derivable`, `IsDerivation`,
`derivable_iff_exists_isDerivation` and the comparison of tree and sequence sizes); 1.1; Mathlib
`Finset.card_powersetCard`.

### 3.2 Width from tree size

Prove `widthDerivable_of_treeDerivable`: if a formula `F` has a tree-like refutation with `s`
nodes, `TreeDerivable F s ∅`, then `WidthDerivable F (CNF.width F + Nat.log 2 s) ∅`
(Ben-Sasson–Wigderson 1999, Theorem 3.1). Equivalently a tree-like refutation of a formula whose
refutations all have width at least `w` has at least `2^(w − CNF.width F)` nodes when
`w ≥ CNF.width F` (Corollary 3.1 there).

The source argues by induction on `b` and on the number of variables that a refutation tree with
at most `2^b` nodes gives width `CNF.width F + b`; the same induction with the bound
`2^(b + 1) − 1` gives the integer part of the logarithm. The last step of the tree resolves `{x}`
with `{¬x}`; one of the two subtrees has at most `2^b − 1` nodes, and restricting it by the value
of `x` that falsifies its root gives a refutation tree of the restricted formula, to which the
induction on `b` applies, while the other restricted formula has one variable less. A refutation
of width `k − 1` of one restriction and one of width `k` of the other combine into one of width
`max k (CNF.width F)` of `F` (Lemmas 3.1 and 3.2 there). The restriction of a derivation is a
derivation from the restricted clauses up to passing to subsets of clauses, which the last bullet
of 3.1, subsumption with width and size, absorbs when the clause derived is `∅`.

**Checks.**

- `∅ ∈ F`: `s = 1`, `Nat.log 2 1 = 0`, and the refutation `∅` has width `0 ≤ CNF.width F`.
- The parity constraints of the complete graph on four vertices, one variable for each of the
  six edges and an odd number of true edges at three vertices and an even number at the fourth:
  `16` clauses of width `3`, least refutation width `4`, smallest refutation tree `55` nodes, and
  `4 ≤ 3 + Nat.log 2 55 = 8`.
- The four clauses on `x, y` of 3.1: `2 ≤ 2 + Nat.log 2 7 = 4`. The inequality bounds the
  refutation width, which can be smaller than `CNF.width F`: for `F = {∅, {x, y, z}}` it reads
  `0 ≤ 3`.

*Needs:* 3.1 (with its subsumption bullet); PropositionalSatisfiability 1.2 (restriction);
Mathlib `Nat.log`.

### 3.3 Width from length

Prove `widthDerivable_of_isDerivation`: if a formula `F` with `n` variables has a refutation in
sequence form of length `S`, that is, a list `L` with `IsDerivation F L`, `∅ ∈ L` and
`L.length = S`, then

    WidthDerivable F (CNF.width F + 2 * ⌈√(2 n ln S)⌉) ∅.

This is Ben-Sasson–Wigderson 1999, Theorem 3.2, which states the bound as
`CNF.width F + O(√(n ln S))`; the constant is the one its proof gives. Put `d = ⌈√(2 n ln S)⌉`
and call a clause **fat** if its width exceeds `d`. If `d ≥ 2 n` there is nothing to prove, since
a refutation without tautological clauses has width at most `max n (CNF.width F)`
(PropositionalSatisfiability 3.3). Otherwise let `a = 1/(1 − d/(2 n))`. The proof shows by
induction on `b` and on the number of variables that a formula in the variables of `F` with a
refutation that has fewer than `a^b` fat clauses has a refutation of width
`CNF.width F + d + b`: some literal lies in at least the fraction `d/(2 n)` of the fat clauses,
making it true removes them, and making it false removes a variable. A refutation of length `S`
has at most `S − 1` fat clauses and `a^d ≥ exp(d²/(2 n)) ≥ S`, so `b = d` suffices.

Consequently, if every refutation of `F` has width at least `w ≥ CNF.width F + 2` and `n ≥ 1`,
every refutation of `F` in sequence form has length at least
`exp((w − CNF.width F − 2)² / (8 n))` (Corollary 3.2 there, with its constant made explicit).

**Checks.**

- `∅ ∈ F` and `L = [∅]`: `ln 1 = 0`, the bound is `CNF.width F`, and `∅` has width `0`.
- `F = {{x}, {¬x}}`: `S = 3`, `n = 1`, `⌈√(2 ln 3)⌉ = 2`, and the bound `1 + 4` exceeds the
  actual width `1`; the theorem has content only when `n` is large compared with `ln S`.
- A formula without variables is `∅` or `{∅}`, and only the second has a refutation: `n = 0`
  gives the bound `CNF.width F = 0`.
- The length may count repeated clauses: lengthening `L` weakens the conclusion, so the
  statement for lists follows from the statement for lists without repetition.

*Needs:* 3.1 (with its subsumption bullet); PropositionalSatisfiability 1.2 (restriction), 3.1
(`IsDerivation`), 3.3 (`exists_isDerivation_of_not_satisfiable`); Mathlib `Real.sqrt`, `Real.log`,
`Nat.ceil`.

### 3.4 The pigeonhole formulas

Prove `two_rpow_le_length_of_isDerivation_pigeonhole`: for `n ≥ 1`, every list `L` with
`IsDerivation (pigeonhole (n + 1) n) L` and `∅ ∈ L` satisfies `2^((n + 1)/20) ≤ L.length`, the
exponent being a real number (Beame–Karp–Pitassi–Saks 2002, Theorem 4.1, where the formula with
`n` pigeons and `n − 1` holes is treated for `n ≥ 2`). An exponential lower bound was first
proved by Haken in 1985; the source quotes his bound as `2^(n/577)`.

The proof of the source replaces every negative literal "pigeon `i` is not in hole `k`" of a
clause by the positive literals of the other pigeons in hole `k`, calls the resulting clause
large if it has at least a tenth of all variables, and shows two facts. For `m ≥ 2`, a refutation
of the formula with `m` pigeons and `m − 1` holes contains a clause whose replacement has at least
`2 m²/9` literals (Lemma 4.2 there): for a clause, count the pigeons `i` such that some
assignment that leaves out `i` and matches the other pigeons with the holes falsifies the
clause; the count is at most `1` on the clauses of the formula, it is `m` on `∅`, and at a
resolution step it is at most the sum of the counts of the premises. And fixing one pigeon in
one hole, chosen to lie in at least a tenth of the large clauses, turns a refutation into one
for one pigeon and one hole fewer; fewer than `2^(m/20)` large clauses are removed in this way
while more than `0.671 m` pigeons remain. Both facts hold for every sequence of clauses that
ends in `∅` and in which each clause is a clause of the formula or is entailed by two earlier
ones, hence for the derivations of PropositionalSatisfiability 3.1, tautological clauses
included.

**Checks.**

- `n = 0` is excluded for a reason: `pigeonhole 1 0 = {∅}` has the refutation `[∅]` of length
  `1 < 2^(1/20)`.
- `n = 1`: `pigeonhole 2 1 = {{p₀₀}, {p₁₀}, {¬p₀₀, ¬p₁₀}}`, whose shortest refutation has length
  `5`, the three clauses, a unit clause and `∅`; `2^(2/20) < 1.08`.
- `pigeonhole 3 2` has `9` clauses of width at most `2`, so by 1.1 a refutation of width `2`;
  its smallest refutation tree has `21` nodes. The lower bound is about length, not width.
- For `n + 1 ≤ 31` the bound is below `3`, and a refutation of a formula without the empty
  clause has length at least `3`.

*Needs:* PropositionalSatisfiability 3.1 (`IsDerivation`), 3.5 (`pigeonhole`).

### Examples

Width and length together: by 1.1 and the fourth bullet of 3.1 a formula of width at most `2`
has refutations of length quadratic in `n`, and by 3.3 a family of formulas of bounded width
whose refutations need width `c n` needs refutations of length `exp((c n − k − 2)²/(8 n))`,
exponential in `n`.

### Dependencies

Layer 3 uses PropositionalSatisfiability 1.2, 3.1, 3.3 and 3.5, 1.1 above in 3.1, and Mathlib's
`Nat.log`, real square root and logarithm, ceiling and count of subsets of a given size.

## Layer 4: polynomial time, the classes P and NP, and reductions

### 4.1 Polynomial-time computable functions

Mathlib's `Turing.TM2ComputableInPolyTime ea eb f`, for encodings `ea : α → List αΓ` and
`eb : β → List βΓ` and `f : α → β`, is the type of machines whose input and output alphabets are
identified with `αΓ` and `βΓ`, together with a polynomial `p`, such that on every `a` the
machine started with `ea a` on its input stack halts within `p.eval (ea a).length` steps with
`eb (f a)` on its output stack, all other stacks empty and the initial internal state
(`Turing.TM2OutputsInTime`). It is a type of data; this roadmap uses the proposition that it is
nonempty. Prove:

- `nonempty_tm2ComputableInPolyTime_comp`: if `Turing.TM2ComputableInPolyTime ea eb f` and
  `Turing.TM2ComputableInPolyTime eb ec g` are nonempty, so is
  `Turing.TM2ComputableInPolyTime ea ec (g ∘ f)`. The composite machine runs the first, moves its
  output to the input stack of the second through an auxiliary stack, which restores the order,
  and runs the second; the time is polynomial because the output of the first machine is at most
  as long as its input plus a constant multiple of its time, a statement executing a bounded
  number of stack operations, and because a polynomial with natural coefficients is monotone.

Define `IsPolyTime f`, for `f : List Bool → List Bool`, as the nonemptiness of
`Turing.TM2ComputableInPolyTime id id f`. Prove:

- the identity is `IsPolyTime` (`Turing.idComputableInPolyTime`), and `IsPolyTime` is closed
  under composition;
- length bound: if `IsPolyTime f` there is a polynomial `q` with `|f x| ≤ q.eval |x|` for all
  `x`;
- constant functions are `IsPolyTime`; if `f` and `g` are, so is `x ↦ f x ++ g x`;
- definition by cases: if `f`, `g` and `h` are `IsPolyTime`, so is the function that sends `x`
  to `g x` when `f x = [true]` and to `h x` otherwise.

(Computing a function within a time bound is Arora–Barak 2007, Definition 1.4, there for
machines with tapes; proved here.)

**Checks.**

- The function that sends `x` to the concatenation of `2^|x|` copies of `[true]` is not
  `IsPolyTime`, by the length bound. It is computed by a machine without a time bound, so the
  time bound is what the definition adds to `Turing.TM2Computable`.
- Time is measured against the length of the input, not against a number that the input denotes:
  the function sending the binary numeral `Computability.encodeNat k` to the string of `k`
  copies of `[true]` and other strings to `[]` is not `IsPolyTime`, since the numeral of `2^m`
  has length `m + 1`.
- The length bound has the input length as a summand: the identity has `|f x| = |x|` and is
  computed in one step.

*Needs:* Mathlib `Turing.FinTM2`, `Turing.TM2ComputableInPolyTime`, `Turing.TM2OutputsInTime`,
`Turing.idComputableInPolyTime`, `Turing.TM2.step`, `Polynomial.eval`.

### 4.2 Pairing

Define `delim s`, the **self-delimiting copy** of a bit string `s`: every bit of `s` preceded by
`true`, followed by one `false`; and the **pairing** `pair x w = delim x ++ w`. Prove:

- `delim s` has length `2 |s| + 1`, and no `delim s` is a proper prefix of a `delim t`; if
  `delim s ++ u = delim t ++ v` then `s = t` and `u = v`;
- hence `pair` is injective in both arguments together, and `|pair x w| = 2 |x| + 1 + |w|`;
- there are `IsPolyTime` functions `p₁` and `p₂` with `p₁ (pair x w) = x` and
  `p₂ (pair x w) = w` for all `x` and `w`, and the function sending `pair x w` to `[true]` and
  every other string to `[]` is `IsPolyTime`;
- `delim` is `IsPolyTime`, and if `f` and `g` are, so is `x ↦ pair (f x) (g x)`;
- for every polynomial `p`, the function sending `pair x w` to `[true]` when `|w| ≤ p.eval |x|`,
  and every other string to `[]`, is `IsPolyTime`.

(Proved here.)

**Checks.**

- `pair [] [] = [false]` and `pair [true] [false] = [true, true, false, false]`.
- Plain concatenation is not injective: `[true] ++ [false, true] = [true, false] ++ [true]`.
- `[]` and `[true]` are not of the form `pair x w`.

*Needs:* 4.1.

### 4.3 The classes P and NP and reductions

For a language `L` define:

- `InP L`: there is an `IsPolyTime` function `f` with `x ∈ L` if and only if `f x = [true]`;
- `InNP L`: there are a language `R` with `InP R` and a polynomial `p` such that `x ∈ L` if and
  only if some bit string `w` with `|w| ≤ p.eval |x|` has `pair x w ∈ R`;
- `PolyTimeReducible L M`: there is an `IsPolyTime` function `f` with `x ∈ L` if and only if
  `f x ∈ M`.

A language `M` is **NP-hard** if `PolyTimeReducible L M` for every `L` with `InNP L`, and
**NP-complete** if moreover `InNP M` (Arora–Barak 2007, Definitions 1.20, 2.1 and 2.7). Prove:

- `PolyTimeReducible` is reflexive and transitive (Theorem 2.8(1) there);
- `InP` is closed under complement, finite unions and finite intersections, and if
  `PolyTimeReducible L M` and `InP M` then `InP L`;
- `InP.inNP`: `InP L` implies `InNP L` (Claim 2.3 there), with `R` the set of all `pair x w`,
  `x ∈ L`, and `p = 0`;
- `InNP.of_polyTimeReducible`: if `PolyTimeReducible L M` and `InNP M` then `InNP L`. If `f` is
  the reduction, `R` and `p` witness `InNP M` and `q` is a length bound for `f`, the witnesses
  for `L` are the set of all `pair x w` with `pair (f x) w ∈ R` and `|w| ≤ p.eval |f x|`, and the
  polynomial `p.comp q`;
- certificates of exact length: `InNP L` if and only if there are `R` with `InP R` and a
  polynomial `p` such that `x ∈ L` if and only if some `w` with `|w| = p.eval |x|` has
  `pair x w ∈ R`, the form of Definition 2.1 there;
- if `M` is NP-hard and `InP M`, then `InP L` for every `L` with `InNP L` (Theorem 2.8(2)
  there).

**Checks.**

- The empty language and the language of all strings are in P, by constant functions.
- Many-one reductions distinguish them: the language of all strings is reducible to `M` if and
  only if `M` is nonempty, and the empty language if and only if `M` is not the language of all
  strings. So a language in P is reducible to every language other than these two, and to
  neither of them unless it equals it.
- In `InNP.of_polyTimeReducible` the condition `|w| ≤ p.eval |f x|` in the new `R` is needed:
  the certificates of `x` are bounded by `p.comp q` evaluated at `|x|`, which may exceed
  `p.eval |f x|`, and `R` may contain `pair (f x) w` for a long `w` when `f x ∉ M`.

*Needs:* 4.1, 4.2; Mathlib `Language`, `Polynomial.eval`, `Polynomial.comp`.

### Examples

The language of bit strings with an even number of `true` bits is in P, and so is the language of
all `pair x x`. For a language `L` in P the language of all `x` that have an extension `x ++ w`
in `L` with `|w| ≤ |x|` is in NP, with `R` the set of all `pair x w` with `x ++ w ∈ L` and
`p = X`.

### Dependencies

Layer 4 uses Mathlib's stack machines with time bounds, its languages and its polynomials.
It uses no other layer.

## Layer 5: NP-completeness of satisfiability and the tractable fragments

### 5.1 Formulas as bit strings

A formula is presented by a list of lists of literals over `ℕ`. Define:

- `encodeLit (v, b)`: the bit `b` followed by `delim (Computability.encodeNat v)`, where
  `Computability.encodeNat` is Mathlib's binary numeral, least significant bit first;
- `encodeClause C`: each literal code preceded by `true`, followed by one `false`;
- `encodeCNF F`: each clause code preceded by `true`, followed by one `false`;
- `cnfOfLists F`: the formula in `CNF ℕ` whose clauses are the sets of literals of the lists
  of `F`;
- `satLang`: the language of all `encodeCNF F` with `cnfOfLists F` satisfiable;
- `kSatLang k`: the language of all `encodeCNF F` with `cnfOfLists F` of width at most `k` and
  satisfiable;
- `hornSatLang`: the language of all `encodeCNF F` with every clause of `cnfOfLists F` Horn and
  `cnfOfLists F` satisfiable.

Prove:

- `encodeCNF` is injective, and `encodeCNF F` has length
  `1 + ∑ C ∈ F, (2 + ∑ (v, b) ∈ C, (3 + 2 * Nat.size v))`, the sums over the entries of the
  lists;
- every formula in `CNF ℕ` is `cnfOfLists F` for some `F`;
- the languages of codes, of codes of formulas of width at most `k`, and of codes of formulas of
  Horn clauses are in P;
- `kSatLang k ⊆ kSatLang (k + 1) ⊆ satLang`, and `kSatLang 0 = {encodeCNF []}`.

The code is linear in the number of literal occurrences and the lengths of the numerals. A
numbering of lists by iterated pairing of natural numbers is not: under Mathlib's `Encodable`
instance for lists the list of `m` zeros has the numbers `0, 1, 2, 5, 26, 677, …` for
`m = 0, 1, 2, …`, each the square of the previous one plus one, so the length of its numeral is
exponential in `m`. (Proved here.)

**Checks.**

- `encodeCNF [] = [false]`, `encodeCNF [[]] = [true, false, false]` and
  `encodeCNF [[(0, true)]] = [true, true, true, false, false, false]`; the first and the third
  are in `satLang` and the second is not.
- `encodeCNF [[(5, true), (2, false)], [(0, true)]]` has length `24 = 1 + (2 + 9 + 7) + (2 + 3)`.
- Of the `2047` bit strings of length at most `10`, `31` are codes; `[]` and `[true]` are not, so
  they belong to none of the three languages.
- Width is counted on sets: `[[(0, true), (0, true), (0, true)]]` presents `{{(0, true)}}` and
  its code is in `kSatLang 1`.

*Needs:* 4.1, 4.2, 4.3; PropositionalSatisfiability 1.1, 3.4 (`Clause.IsHorn`); Mathlib
`Computability.encodeNat`, `Computability.decode_encodeNat`, `Language`.

### 5.2 Satisfiability is NP-complete

Prove:

- `satLang_inNP`: `InNP satLang`. A certificate for `encodeCNF F` is `encodeClause` of the list,
  without repetition, of the positive literals of the variables of `F` that a model makes true;
  its length is at most that of `encodeCNF F`;
- `polyTimeReducible_satLang_of_inNP`, the Cook–Levin theorem: if `InNP L` then
  `PolyTimeReducible L satLang` (Arora–Barak 2007, Theorem 2.10(1) and Lemma 2.12).

So `satLang` is NP-complete. For the second statement let `R`, `p` witness `InNP L` and let a
machine decide `R` within `t.eval` of the input length. For an input `x` the reduction produces a
formula with variables for the bits of a certificate `w` of length at most `p.eval |x|`, for its
length, and, for each time up to `T = t.eval (2 |x| + 1 + p.eval |x|)`, for the label, the internal
state, the height of each stack and the symbol in each cell of each stack up to height
`2 |x| + 1 + p.eval |x| + c T`, where `c` bounds the stack operations of one statement. The clauses
say that the time-`0` variables describe the initial configuration on `pair x w`, that consecutive
configurations are related by `Turing.TM2.step`, each such condition involving the variables of a
bounded number of cells once the heights are fixed, and that the final configuration is the halting
one with output `[true]`. The formula is satisfiable exactly when `x ∈ L`, and its code is produced
in polynomial time by 4.1 and 4.2. The source argues for two-tape machines with a fixed pattern of
head movements; the stacks of Mathlib's machines take the place of the tapes.

**Checks.**

- `L = ∅` is reducible by the constant function with value `encodeCNF [[]]`, and the language of
  all strings by the constant function with value `encodeCNF []`; both use the injectivity of
  `encodeCNF` (5.1): the code of `[[]]` is the code of no other presentation, and the empty
  formula is satisfiable.
- The certificate bound matters: without the bound `|w| ≤ p.eval |x|` in `InNP`, every language
  that is the projection of a language in P would qualify, and the number of certificate
  variables of the formula for `x` would not be bounded.

*Needs:* 4.1, 4.2, 4.3, 5.1; Mathlib `Turing.FinTM2`, `Turing.TM2.step`,
`Turing.TM2OutputsInTime`.

### 5.3 At most three literals per clause

For a presentation `F`, let the **formula of `F`** be the element of the type `PropForm ℕ` of
PropositionalSatisfiability 2.1 obtained as the right-nested conjunction, ending in the constant
`tru`, of the right-nested disjunctions, ending in the constant `fls`, of the literals of each
list, a literal `(v, true)` being `var v` and `(v, false)` being `neg (var v)`. Prove:

- an assignment makes the formula of `F` true if and only if it is a model of `cnfOfLists F`;
- if `F` has `m` lists with `t` entries in all, `r` of them negative, the formula of `F` has
  size `1 + 2 m + t + r`;
- hence, by `models_tseitin_iff` and `card_tseitin_le` of PropositionalSatisfiability 2.3, the
  Tseitin transformation of the formula of `F` is a clause set of width at most `3` with at most
  `3 (1 + 2 m + t + r) + 1` clauses, in variables named by subformulas, that is satisfiable if
  and only if `cnfOfLists F` is; relabelling its variables injectively by natural numbers
  preserves this (PropositionalSatisfiability 1.1);
- `polyTimeReducible_satLang_kSatLang_three`: `PolyTimeReducible satLang (kSatLang 3)`
  (Arora–Barak 2007, Lemma 2.15, where clauses are split with fresh variables instead);
- consequently `kSatLang k` is NP-complete for every `k ≥ 3`, and `InP (kSatLang 3)` holds if and
  only if `InP L` for every `L` with `InNP L` (Theorem 2.8(3) there).

**Checks.**

- The formula of `[]` is `tru`, of size `1`, and its Tseitin transformation is the single unit
  clause of the name of `tru`; the formula of `[[]]` is `and fls tru`, of size `3 = 1 + 2`, and
  its Tseitin transformation has `6` clauses and is unsatisfiable.
- The reduction must send strings that are not codes outside `kSatLang 3`, for instance to
  `encodeCNF [[]]`.
- `kSatLang 3` is not the same language as `satLang`: the code of a single clause with four
  distinct literals is in `satLang` only.

*Needs:* 4.1, 4.2, 4.3, 5.1; PropositionalSatisfiability 1.1 (relabelling), 2.1 (`PropForm`),
2.3 (`tseitin`, `models_tseitin_iff`, `card_tseitin_le`).

### 5.4 The tractable fragments

Prove:

- `kSatLang_two_inP`: `InP (kSatLang 2)`. By 1.1 a formula of width at most `2` with `n`
  variables is unsatisfiable exactly when `∅` belongs to its resolution closure, a set of at
  most `2 n² + n + 1` clauses reached by at most that many additions of a resolvent; by 1.2 the
  same is decided by chains of implications among `2 n` literals;
- `hornSatLang_inP`: `InP hornSatLang`. By PropositionalSatisfiability 3.4 a set of Horn clauses
  is unsatisfiable exactly when unit resolution derives `∅`, and by PropositionalSatisfiability
  4.1 that happens exactly when some clause has the negations of all its literals among the
  propagated literals, of which there are at most `2 n`;
- hence `InP (kSatLang 0)` and `InP (kSatLang 1)`.

(Proved here.)

**Checks.**

- Together with 5.3 the boundary is between two and three literals per clause: `kSatLang 2` is in
  P and `kSatLang 3` is NP-complete.
- The statements are about the languages of codes: a string that is not a code is rejected, and
  so is the code of a satisfiable formula with a clause of three distinct literals, which is in
  `satLang` and not in `kSatLang 2`.

*Needs:* 4.1, 4.2, 4.3, 5.1; 1.1, 1.2; PropositionalSatisfiability 3.4
(`not_satisfiable_iff_unitDerivable_empty`), 4.1 (unit derivability of `∅` through propagated
literals).

### 5.5 Independent sets, cliques and vertex covers

This target needs no machine. Define the **conflict graph** `conflictGraph V`, a simple graph on
the pairs `(C, l)` of a clause and a literal: two distinct pairs are adjacent if they have the
same clause or complementary literals
(`SimpleGraph.fromRel` applied to the relation `p.1 = q.1 ∨ p.2 = ¬q.2`). An **occurrence** of a
formula `F` is a pair `(C, l)` with `C ∈ F` and `l ∈ C`. Prove:

- `satisfiable_iff_exists_isIndepSet`: for every type `V` and every formula `F`, `F` is
  satisfiable if and only if some finite set `s` of occurrences of `F` is an independent set of
  `conflictGraph V` with `s.card = F.card`. Such a set contains one occurrence of each clause and
  no two complementary literals, and the literals it contains are made true by an assignment;
- no independent set of occurrences of `F` has more than `F.card` elements;
- cliques: `F` is satisfiable if and only if some set of `F.card` occurrences is a clique of the
  complement graph (`SimpleGraph.isClique_compl`);
- vertex covers: with `O` the finite set of occurrences of `F` and `G` the graph induced on `O`,
  `F` is satisfiable if and only if `G` has a vertex cover `c` with `c.card + F.card = O.card`
  (`SimpleGraph.isVertexCover_compl`).

(The reduction is classical; Arora–Barak 2007, Theorem 2.16, proves the NP-completeness of the
independent set problem with another graph. Proved here.)

**Checks.**

- `F = {{x, y}, {¬x}, {¬y}}` has four occurrences and three edges, a path; its largest
  independent sets have two elements, fewer than three, and `F` is unsatisfiable.
- `F = {∅}` has no occurrence and one clause; the empty formula has the empty independent set.
- The edges inside a clause are needed: for the four clauses of two literals on `x, y`, the four
  occurrences of positive literals contain no complementary pair, and the formula is
  unsatisfiable.
- A tautological clause `{x, ¬x}` contributes two adjacent occurrences, of which one is chosen.

*Needs:* PropositionalSatisfiability 1.1; Mathlib `SimpleGraph.fromRel`,
`SimpleGraph.fromRel_adj`, `SimpleGraph.IsIndepSet`, `SimpleGraph.isClique_compl`,
`SimpleGraph.IsVertexCover`, `SimpleGraph.isVertexCover_compl`.

### Examples

For the language `L` of 4.3's example, the extensions in a language in P, 5.2 gives for each `x`
a formula that is satisfiable exactly when `x` has such an extension; by 5.3 it may be taken of
width at most `3`, and by 5.5 its satisfiability is the existence of an independent set of
prescribed size in an explicit graph.

### Dependencies

Layer 5 uses Layer 4 throughout 5.1 to 5.4, Layer 1 in 5.4, PropositionalSatisfiability 1.1,
2.1, 2.3, 3.4 and 4.1, and Mathlib's machines, binary numerals and simple graphs. Target 5.5 uses
only PropositionalSatisfiability 1.1 and Mathlib's simple graphs.

## Downstream consumers

Reductions from satisfiability to other problems start from `kSatLang 3` and 5.3, and
NP-hardness proofs use `InNP.of_polyTimeReducible` and the transitivity of 4.3. Lower bounds for
other proof systems and for other families of formulas use the measures of 3.1 and the relations
3.2 and 3.3, which turn a lower bound on width into one on size.

## Scope and ownership

This roadmap owns:

- the implication relation of a clause set of width at most `2`, the satisfiability criterion,
  the bound on the resolution closure, and the characterizations of the model sets of formulas of
  width at most `2` and of Horn formulas by closure under majority and under conjunction;
- renamings of clauses and the criterion for a renaming to produce Horn clauses;
- the width of formulas and of derivations, the node count of tree-like derivations, the two
  relations between width and size, and the lower bound on the length of refutations of the
  pigeonhole formulas;
- polynomial-time computable functions on bit strings on Mathlib's machines, closure under
  composition, the pairing of bit strings, the classes P and NP of languages, polynomial-time
  many-one reductions and their basic closure properties;
- the codes of formulas, the languages of satisfiable formulas, membership in NP, the Cook–Levin
  theorem, the reduction to width at most `3`, membership in P of the fragments of width at most
  `2` and of Horn formulas;
- the conflict graph and the equivalences of satisfiability with independent sets, cliques and
  vertex covers.

It leaves to PropositionalSatisfiability: clauses, models, entailment, restriction and
compactness (its Layer 1); formulas and the Tseitin transformation (Layer 2); resolution, its
completeness, the subsumption lemma, the comparison of tree and sequence sizes, unit resolution
and its completeness for Horn clauses, the closure of Horn model sets under conjunction and their
least models, and the pigeonhole formulas with their satisfiability (Layer 3); unit propagation
(4.1). None of these is restated above. `Suggested.lean` carries verbatim copies of the
definitions `Clause`, `CNF`, `Satisfies`, `Models`, `Satisfiable`, `Clause.vars`, `CNF.vars`,
`Clause.IsHorn`, `resolve`, `Derivable`, `IsDerivation` and `pigeonhole` of that roadmap, which
exist only to make its statements elaborate, because a roadmap module cannot be imported.

Out of scope:

- the polynomial hierarchy, space-bounded classes, circuits, probabilistic and interactive
  classes, probabilistically checkable proofs and hardness of approximation, and parameterized
  complexity;
- languages of graphs, and therefore the NP-completeness of the independent set, clique and
  vertex cover problems as statements about languages: 5.5 above is the combinatorial
  equivalence, and no encoding of graphs is fixed here. Reductions to colourability, to subset
  sum and to further problems are not treated;
- Schaefer's dichotomy theorem for constraint languages beyond the two closure characterizations
  of 1.3 and 2.1, and affine clause sets;
- proof systems other than resolution (extended resolution, Frege systems, cutting planes,
  polynomial calculus), lower bounds for parity formulas on expander graphs and for random
  formulas, and the exponential separation of tree-like from general resolution;
- satisfiability thresholds of random formulas;
- solvers, decision procedures as programs and their data structures: 5.4 asserts the existence
  of a machine in the sense of 4.1 and specifies none.

Relation to what Mathlib and the roadmaps of this repository contain:

- Mathlib defines the machines `Turing.FinTM2` and the types `Turing.TM2ComputableInTime` and
  `Turing.TM2ComputableInPolyTime` and proves that the identity is computable in polynomial time
  (`Turing.idComputableInPolyTime`). At the pin it has no composition of such computations, no
  class of languages defined by them and no reduction between languages; `ManyOneReducible` in
  `Mathlib/Computability/Reduce.lean` is reducibility by computable functions without a time
  bound. The composition is therefore a target of this roadmap, the first bullet of 4.1 above,
  stated as a proposition about the types of Mathlib.
- CertifiedPermutationComputation (an open roadmap, not on main), in its section 1.2, plans the
  same two facts as data for its executable primitives: the bound of the output length by the
  input length plus a constant multiple of the number of steps, and the composite machine with an
  explicit time polynomial. The first bullet of 4.1 is their propositional form: it asserts only
  that the type is nonempty and exposes no machine and no polynomial, so it follows from that
  construction and does not ask for a second one. This roadmap does not depend on that one;
  whichever of the two is built first, the composite machine is to be built once, as data, and
  `nonempty_tm2ComputableInPolyTime_comp` obtained from it.
- ComputabilityTheory treats computable and computably enumerable sets, Turing reducibility, the
  jump and priority constructions, without bounds on time; nothing of it is used above and
  nothing above is stated there.
- Mathlib's `Mathlib/Combinatorics/SimpleGraph/Clique.lean` and `VertexCover.lean` supply
  independent sets, cliques and vertex covers; reachability in 1.2 is expressed with
  `Relation.ReflTransGen`, as in PropositionalSatisfiability, and no graph structure is put on
  the literals.

Formalizations elsewhere, as reference material and not as the specification: F. J. Balbach,
"The Cook-Levin theorem", Archive of Formal Proofs, 2023, in Isabelle/HOL, on deterministic
multi-tape Turing machines, with P, NP, polynomial-time many-one reductions and the NP-hardness
of satisfiability through oblivious two-tape machines; and L. Gäher and F. Kunze, "Mechanising
complexity theory: the Cook-Levin theorem in Coq", ITP 2021, where the model of computation is
the call-by-value lambda calculus and Turing machines are an intermediate problem.

## Exact supplier contracts

### From Mathlib

- `Relation.ReflTransGen` (`Mathlib/Logic/Relation.lean`): the reflexive transitive closure of a
  relation.
- `Set.encard` (`Mathlib/Data/Set/Card.lean`): the cardinality of a set as an extended natural
  number. `Finset.card_powersetCard` (`Mathlib/Data/Finset/Powerset.lean`): a finite set `s` has
  `s.card.choose n` subsets with `n` elements.
- `Nat.log` (`Mathlib/Data/Nat/Log.lean`): `Nat.log b n` is the largest `k` with `b^k ≤ n` for
  `b ≥ 2` and `n ≥ 1`. `Real.sqrt`, `Real.log` and `Nat.ceil`, as the vocabulary of 3.3.
- `Turing.FinTM2`, `Turing.TM2OutputsInTime`, `Turing.TM2ComputableInPolyTime` and
  `Turing.idComputableInPolyTime` (`Mathlib/Computability/TuringMachine/Computable.lean`): a
  bundled machine with finitely many stacks, labels and states and a finite input alphabet; the
  type of runs from the initial configuration on an input list to the halting configuration on
  an output list within a given number of steps; the type of machines computing `f` between
  encoded types within `time.eval` of the length of the encoded input, `time : Polynomial ℕ`;
  and the element of `Turing.TM2ComputableInPolyTime ea ea id` for an encoding `ea` into a finite
  alphabet. The initial configuration has the input on the input stack, first symbol on top, and
  the halting configuration has the output on the output stack, the other stacks empty and the
  initial internal state.
- `Turing.TM2.step` (`Mathlib/Computability/TuringMachine/StackTuringMachine.lean`): the step
  function of a stack machine, which executes the statement of the present label.
- `Language` (`Mathlib/Computability/Language.lean`): `Language α` is `Set (List α)`.
  `Polynomial.eval` and `Polynomial.comp`, for polynomials with natural coefficients.
- `Computability.encodeNat` and `Computability.decode_encodeNat`
  (`Mathlib/Computability/Encoding.lean`): the binary numeral of a natural number as a list of
  bits, least significant first, with `encodeNat 0 = []`, and its left inverse.
- `SimpleGraph.fromRel` and `SimpleGraph.fromRel_adj`
  (`Mathlib/Combinatorics/SimpleGraph/Basic.lean`): the graph of a relation `r`, in which `v` and
  `w` are adjacent if and only if `v ≠ w` and `r v w ∨ r w v`.
- `SimpleGraph.IsIndepSet` and `SimpleGraph.isClique_compl`
  (`Mathlib/Combinatorics/SimpleGraph/Clique.lean`): a set is independent if its elements are
  pairwise non-adjacent, and it is a clique of the complement graph if and only if it is
  independent. `SimpleGraph.IsVertexCover` and `SimpleGraph.isVertexCover_compl`
  (`Mathlib/Combinatorics/SimpleGraph/VertexCover.lean`): the complement of a set is a vertex
  cover if and only if the set is independent.

### From Lean core

- `Std.Sat.Literal` and `Std.Sat.Literal.negate` (`Std/Sat/CNF/Literal.lean`): `Literal α` is
  `α × Bool` and `negate l = (l.1, !l.2)`.

### From TauCetiRoadmap.PropositionalSatisfiability

- 1.1: `Clause`, `CNF`, `Satisfies`, `Models`, `Satisfiable`, `Entails`, `Clause.vars`,
  `CNF.vars`, and the relabelling of variables: the image of `S` under `f` on variables has `τ`
  as a model if and only if `S` has `τ ∘ f` as a model.
- 1.2: the restriction of a formula by a literal.
- 1.3: `satisfiable_iff_forall_finset`, compactness for clause sets over any type of variables.
- 2.1 and 2.3: `PropForm` with its evaluation and size; `tseitin`; `models_tseitin_iff`, the
  models of `tseitin φ` are the assignments that give every subformula its truth value and make
  `φ` true; `card_tseitin_le`, at most `3 * PropForm.size φ + 1` clauses of at most three
  literals.
- 3.1: `resolve`, `Derivable`, `IsDerivation`, `derivable_iff_exists_isDerivation`; the
  comparison of the sizes of derivation trees and of sequences; the subsumption lemma: if every
  clause of `S` has a subset in `T` and `C` is derivable from `S`, some subset of `C` is
  derivable from `T`.
- 3.3: `not_satisfiable_iff_derivable_empty`; `exists_isDerivation_of_not_satisfiable`, an
  unsatisfiable set has a refutation without tautological clauses.
- 3.4: `Clause.IsHorn`, `UnitDerivable`, `not_satisfiable_iff_unitDerivable_empty`, and the
  closure of the models of a set of Horn clauses under pointwise conjunction.
- 3.5: `pigeonhole`.
- 4.1: `∅` is unit derivable from `S` if and only if some clause of `S` has the negations of all
  its literals among the literals propagated from the empty set.

## References

- S. Arora and B. Barak, *Computational complexity: a modern approach*, Cambridge University
  Press, 2009; read in the authors' web draft of January 2007, whose numbering is cited.
- P. Beame, R. Karp, T. Pitassi and M. Saks, *The efficiency of resolution and Davis–Putnam
  procedures*, SIAM J. Comput. **31** (2002), 1048–1075; read in the first author's copy of the
  article.
- E. Ben-Sasson and A. Wigderson, *Short proofs are narrow: resolution made simple*, Electronic
  Colloquium on Computational Complexity, Report TR99-022, 1999, whose numbering is cited; the
  journal version is J. ACM **48** (2001), 149–169.
- Named for attribution and not consulted: B. Aspvall, M. F. Plass and R. E. Tarjan, *A
  linear-time algorithm for testing the truth of certain quantified Boolean formulas*, Inform.
  Process. Lett. **8** (1979), 121–123; S. A. Cook, *The complexity of theorem-proving
  procedures*, Proc. 3rd ACM Symposium on Theory of Computing, 1971, 151–158; A. Haken, *The
  intractability of resolution*, Theoret. Comput. Sci. **39** (1985), 297–308; L. A. Levin,
  *Universal sequential search problems*, Problemy Peredachi Informatsii **9** (1973), no. 3,
  115–116; H. R. Lewis, *Renaming a set of clauses as a Horn set*, J. ACM **25** (1978), 134–135;
  T. J. Schaefer, *The complexity of satisfiability problems*, Proc. 10th ACM Symposium on Theory
  of Computing, 1978, 216–226.
- H. Chen, *A rendezvous of logic, complexity, and algebra*, SIGACT News Logic Column 17, 2006;
  read as arXiv:cs/0611018v1.

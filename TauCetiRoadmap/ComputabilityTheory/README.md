# Roadmap: computability theory and finite-injury constructions

**Summary.** This roadmap develops classical computability theory on sets of natural numbers as far
as the finite-injury priority method, following Soare's *Recursively Enumerable Sets and Degrees*.
Its objects are oracle computations with their finite uses, computably enumerable (c.e.) sets with
their stage-by-stage enumerations, Turing reducibility, the Turing jump and the arithmetical
hierarchy, limit approximations with their moduli, and the bookkeeping of priority constructions:
restraints, the numbers that injure a requirement, and the stages at which they enter. Every set is
a set of natural numbers, used as an oracle through its total characteristic function, so that every
query is answered and the answer outside the set is no. A set is low when its jump is Turing
equivalent to ∅′, the jump of the empty set.

The headline theorems are these.

- *Friedberg–Muchnik.* There are c.e. sets A and B, neither Turing reducible to the other, built by
  the original witness-and-restraint construction; both lie strictly between the computable sets
  and ∅′.
- *Sacks splitting with low halves.* If B and C are c.e. sets and C is not computable, then B is
  the union of two disjoint low c.e. sets, neither of which computes C. B need not be infinite.
- *Sacks cone avoidance.* If C is a noncomputable c.e. set, some simple set does not compute C.
- *Post's theorem and the Limit Lemma, relativized.* For every set Z and every n, a set is Σ⁰ₙ₊₁
  relative to Z exactly when it is c.e. relative to the n-th jump Z⁽ⁿ⁾, and Δ⁰ₙ₊₁ relative to Z
  exactly when it is computable from Z⁽ⁿ⁾; a total function ℕ → ℕ is computable from Z′ exactly
  when it is the pointwise eventually constant limit of a sequence of total functions uniformly
  computable from Z.

The splitting theorem gives the classical corollaries on c.e. degrees: every c.e. degree is the
join of two low c.e. degrees, no nonzero c.e. degree is minimal, and every nonzero incomplete c.e.
degree has an incomparable c.e. degree. The Kleene–Post construction, which builds incomparable sets
below ∅′ with the help of an oracle, is the comparison case.

The roadmap stands on two libraries. Mathlib supplies partial recursive functions and their codes,
computable and c.e. predicates, oracle-relative computability, and Turing degrees as a quotient of
partial functions, which a set enters through its characteristic function. Tau Ceti's computability
library supplies the foundations the constructions share: numbered oracle programs whose bounded
runs record output and use, enumeration stages and their serialization, the jump and low sets, limit
approximations and moduli, the injury calculus of priority arguments, the reductions attached to a
disjoint c.e. splitting, and the first of Soare's three finite-injury constructions, a low simple
set. No other roadmap supplies or consumes this one.

Layers 0 and 1 below complete the operational and enumeration theory: query substitution, racing,
relative c.e. sets and the presentations of c.e. sets. Layer 2 adds padding, the reducibility facts
for sets and effective searches; Layer 3 the arithmetical hierarchy, Post's theorem and index sets;
Layer 4 the Modulus and Limit Lemmas; Layer 5 the Kleene–Post construction; Layer 6 completes the
injury calculus. Layer 7 is the Friedberg–Muchnik construction, and Layer 8 the length-of-agreement
method with Sacks's cone avoidance, splitting with low halves and its corollaries.

## How to read the build

Each layer opens by naming the Tau Ceti material it rests on; its numbered sections are its
targets, and each target's *Needs:* line lists what its statement and its route use, item by item,
so that a target proved another way is not held behind an unrelated one. The layers are numbered in
build order, but most of them are independent of each other.

- Layer 0 rests on Tau Ceti's single-oracle programs; Layer 1 uses Layer 0 only for its relative
  forms; Layer 2 uses Layers 0 and 1.
- Layer 3 uses Layers 0 to 2; Layer 4 uses Layer 1, and Layer 3 only for the Δ⁰₂ form of the Limit
  Lemma.
- Layer 5 uses Layers 0 to 2. Layer 6 is set-theoretic: its injury objects need no oracle
  evaluation, and only the preservation statements use Layer 0.
- Layer 7 uses Layers 0, 2 and 6. Layer 8 uses Layers 0, 1, 2 and 6.

The arithmetical hierarchy (Layer 3) and the Kleene–Post construction (Layer 5) are required
results, but neither priority construction depends on them, so they are developed alongside
Layers 7 and 8. Layers 7 and 8 are independent of each other; the examples of Layer 8 that use Tau
Ceti's low simple set live in a separate examples module.

## Conventions

1. **Vocabulary.** Prose and new names say *computable*, *partial computable* and *c.e.* where this
   does not conflict with the existing library. Mathlib's names `Primrec`, `Partrec`, `Computable`,
   `ComputablePred`, `REPred`, `RecursiveIn`, `ComputableIn`, `ManyOneReducible`,
   `OneOneReducible`, `TuringReducible`, `TuringEquivalent` and `TuringDegree` are kept; no
   predicate is duplicated to replace `RE` by `CE` in its spelling. A set `C` is c.e. when
   `REPred (· ∈ C)` holds.
2. **Effectivity.** An encoding or a `DecidablePred` instance is not a computability certificate:
   every effective operation has a theorem about `Primrec`, `Computable`, `Partrec`, `ComputableIn`
   or `RecursiveIn`. Classical choice may be used in semantic definitions and in proofs; it does not
   implement a stage search. Mathematical state data are kept separate from invariant proofs; no
   metaprogramming or new global computability tactic is a prerequisite of the mathematics, and
   effective finite searches and index transformations are mathematical algorithms that belong in
   the mathematical modules.
3. **What discharges a construction.** The constructions expose their finite computations and
   uses, the actual numbers that cause injury, and the reductions connecting them to ordinary
   computability theory. An abstract stabilization result, or a negative reducibility theorem over a
   machine model not connected to Mathlib's oracle computability by the adequacy theorems, does not
   discharge a construction target.
4. **Numbers, strings and oracles.** Numbers, program indices, arguments, witnesses and stages lie
   in ℕ. A finite string is an initial segment of answers, not a finite set of positive answers. A
   finite set `A_s` used as an oracle answers no outside `A_s`; a finite string answers neither yes
   nor no beyond its length. In Tau Ceti, oracle answers are a function `ℕ → Option ℕ` with `none`
   meaning unanswered, and the answers of a set `A` are `TauCeti.Oracle.Single.Code.setAnswers A`.
   The oracle of a set `A` is `Set.oracle A`, its characteristic function `A.indicator 1` as a
   total partial function. Reductions of sets are reductions of these oracles: `A ≤_T B` means
   `TuringReducible A.oracle B.oracle`, and `A ≡_T B` means `TuringEquivalent A.oracle B.oracle`.
5. **Numberings.** `φ_e` is the ordinary partial computable function with index `e` and `Φ^Z_e` its
   counterpart relative to the oracle `Z`. The fixed acceptable numbering is Tau Ceti's numbering
   of single-oracle programs `TauCeti.Oracle.Single.Code` (its `Denumerable` instance): `Φ^Z_e` is
   `TauCeti.Oracle.Single.Code.eval Z.oracle` applied to program number `e`. Ordinary programs are
   Mathlib's `Nat.Partrec.Code`, numbered by their `Denumerable` instance, and enter the oracle
   numbering through the query-free translation `Nat.Partrec.Code.toSingleOracleCode`. Numeric
   equality of different numberings is not a target.
6. **Halting sets.** `W_e` is the domain of `φ_e` and `W^Z_e` that of `Φ^Z_e`. The jump
   `K^Z = {e : Φ^Z_e(e)↓} = Z′` is Tau Ceti's `Set.jump`, and the paired halting set
   `K^Z_0 = {⟨x, e⟩ : x ∈ W^Z_e}` is `Set.pairedJump`; the order of its coordinates, input first and
   index second, is deliberate. `K` is `∅′`, and the iterates `Z⁽ⁿ⁾` are `Set.jump^[n] Z`.
7. **Pairing, columns, join.** Pairs are Mathlib's `Nat.pair`. Soare's columns are
   `ω^[e] = {⟨x, e⟩ : x ∈ ℕ}`. The binary join is the parity join
   `A ⊕ B = {2x : x ∈ A} ∪ {2x + 1 : x ∈ B}`, Tau Ceti's `Set.join`.
8. **Stages.** `A_s` is the finite content at the *end* of stage `s`, so `ΔA_s = A_{s+1} ∖ A_s`
   (Tau Ceti's `TauCeti.Enumeration.fresh A s`) consists of the entries made at stage `s + 1`. A
   restraint read when those entries are selected is `r(e, s)`, not `r(e, s + 1)`. The limit
   `⋃ₛ A_s` is `TauCeti.Enumeration.stageLimit A`. The stages of a constructed c.e. set increase
   and start empty.
9. **Bounded evaluation.** Stage computations follow [S, III.1.7]: `Φ^Z_{e,s}(x)↓ = y` implies
   `e, x, y < s` and use at most `s`. For a fixed oracle, convergence, output and the recorded use
   persist as the stage grows, and stage zero has no convergent computation. Tau Ceti has raw runs
   with fuel, `TauCeti.Oracle.Single.Code.evaln`, which bound the input and the use, and Soare's
   stage evaluation `TauCeti.Oracle.Single.Code.evalStage`, which adds the bounds on the index and
   the output. The two are different interfaces, and statements say which they use.
10. **Use.** The use of a successful computation is one plus its greatest queried address, or zero
   when it made no query; only the addresses below the use matter. The stage use is zero when there
   is no successful computation, as in [S, III.1.7]. Convergence is recorded separately, by an
   `Option`-valued result: use zero does not imply divergence.
11. **Enumerations.** Raw simulation bounds and normalized enumeration stages are different
    interfaces. Slowing and serialization maps come with equality of the limiting sets; no
    statement asserts equality at the same stage after recoding or slowing. A serialized
    enumeration starts empty and adds zero or one new entry at each stage, including for finite and
    empty sets; an enumeration adding exactly one entry at each stage needs the set to be infinite.
12. **Degrees.** Mathlib's `TuringDegree` is the quotient of all partial functions `ℕ →. ℕ`. The
    set-degree statements here concern the classes of the oracles `Set.oracle A`; that slice is
    named explicitly where it is used. No statement asserts that every degree of a partial function
    is the degree of a set, and no second degree quotient is introduced.
13. **Priority.** A smaller index means a higher priority. The low simple construction orders its
    requirements `N_0, P_0, N_1, P_1, …`; the original Friedberg–Muchnik construction uses
    `R_{2e} : A ≠ Φ^B_e` and `R_{2e+1} : B ≠ Φ^A_e`; Sacks splitting orders its pairs `(e, i)` by
    `2e + i`.
14. **Restraints.** A restraint is an `Option ℕ`. Soare sometimes writes `−1` for an inactive
    restraint; here inactivity is `none` and an active restraint is `some r`. This encodes the
    distinction and does not change the protected interval: `none` protects no number, `some r`
    protects `{x : x ≤ r}`, and so `some 0` protects `0` and is a different state from `none`.
    Restraints need not be monotone: they can drop after an injury, and a convergent restraint has
    no promised computable modulus. A live restraint is not replaced by its historical maximum
    unless the strategy is proved to work with it; the maximum of the *current* higher-priority
    restraints is a different operation.
15. **Injury.** The public injury set of requirement `e` is Soare's set of *numbers*, with the
    inclusive inequality of [S, VII.1, p. 112; VII.3, p. 123]:
    `I_e = {x : ∃ s, x ∈ A_{s+1} ∖ A_s ∧ x ≤ r(e, s)}`, the condition being false for an inactive
    restraint. It is Tau Ceti's `TauCeti.Priority.injurySet`. The injury-stage set, the stages
    `s + 1` at which at least one such number enters, is `TauCeti.Priority.injuryStages`; the event
    relation, which keeps both `s` and `x`, is `TauCeti.Priority.injuryEvents`. Initialization,
    attention and witness changes are other sets, not definitions of `I_e`. The use prefix `[0, u)`
    of a computation and the protected interval `[0, r]` of a restraint stay distinct: an entry at
    `x = u = r` is an injury although it cannot invalidate that computation. This conservative
    boundary injury is part of the definition; the use-prefix breaches, entries strictly below an
    active restraint, are a separate object (Tau Ceti's `TauCeti.Priority.usePrefixRestraint`).
16. **The acceptance file.** `Suggested.lean` imports only Mathlib and states the headline theorems
    and the targets of the layers on its own prototypes of the carriers, so that it reads on its
    own. The prototypes and the Tau Ceti carriers they model are: `characteristic`, `totalOracle`
    and `oracle` (`Set.oracle`); the program type `Oracle.Single.Code` with `Code.encode`,
    `Code.decodeFuel` and `Code.ofNat` (the same programs and numbering as
    `TauCeti.Oracle.Single.Code`); a fuelled evaluator `Code.run` with results `Code.Halt`, its
    bounded minimization `Code.search`, the induced partial function `Code.eval`, Soare's stage
    evaluation `Code.stage` against a finite string, `Code.initialSegment`, `Code.stageAt`,
    `Code.stageUse`, and the query-free embedding `Code.embed` (Tau Ceti's `evalStage`, `evaln`,
    `stageUse` and `toSingleOracleCode`); the numberings `PhiTotal`, `Phi`, `W` and the stages
    `WStage` (Convention 5); the finite-set codes `finiteCode` and `finiteDecode` (Mathlib's
    `Finset.equivBitIndices`); `stageLimit`, `fresh` and the bundled enumeration `CEApproximation`
    (Tau Ceti's stages); `jump`, `K₀`, `iterateJump`, `Low` (`Set.jump`, `Set.pairedJump`, iterates,
    `Set.Low`); `join` (`Set.join`); `Immune`, `Simple`, `ComputablyInseparable` (`Set.Immune`,
    `Set.Simple`, `Set.ComputablyInseparable`); `EventuallyAgrees` and `IsModulus` (Tau Ceti's
    `Converges` and `IsModulus` with the stage argument last); and the injury objects
    `injuriesAt`, `useBreachesAt`, `boundaryInjuriesAt`, `useBreachSet`, `injurySet`,
    `injuryEvents`, `injuryStages`, `attentionStages` (Tau Ceti's, the breaches being the injuries
    for `usePrefixRestraint`). Each prototype is the same mathematical object as its Tau Ceti
    counterpart, with one exception: the fuelled evaluator `Code.run`, and the stage evaluation, stage
    use and stages `WStage` built from it, agree with Tau Ceti's `evaln` and `evalStage` in their
    limit semantics and in the stage conventions, not stage by stage. An implementation states
    the theorems on Tau Ceti's carriers. The statements of the acceptance file that restate results
    Tau Ceti proves are listed under Scope and ownership. This README is the specification: proving
    every statement of the acceptance file neither completes a layer nor completes the roadmap.
17. **Placement.** Implementations sit under `TauCeti/Computability/` by subject, not by source
    project: `SingleOracle/` (programs, bounded evaluation, use, adequacy), `Enumeration/` (c.e.
    stages, serialization, indices), `Jump/` (the concrete jump, iterates, relative forms),
    `Hierarchy/` (normal forms, Post's theorem, index sets), `Approximation/` (moduli and limit
    lemmas), `Priority/` (entry and injury sets, causes, epochs, induction), `Simple/` (positive and
    low simple constructions), `FriedbergMuchnik/`, `SacksSplitting/`, and `Examples/`
    (cross-client consequences and counterexamples).

## Layer 0: oracle computations and the use principle

The programs, their evaluation against a partial oracle, raw bounded runs recording output and use,
Soare's stage evaluation, the coding of finite data, adequacy in both directions, the universal
program, s-m-n, the fixed-point theorems, the use principle and the passage to a moving oracle are
Tau Ceti's (supplier contracts). This layer adds the remaining operational facts of [S, I.2–3;
III.1, especially III.1.7–9].

### 0.1 Query substitution and simultaneous preservation

Define the substitution of a program `d` for the queries of a program `c`, a map we call query
substitution: the program obtained from `c` by replacing each query instruction by `d`. Prove that
query substitution is primitive recursive on programs and independent of the oracle, and that for
every partial oracle `O` the substituted program, evaluated against `O`, is `c` evaluated against
the oracle `Φ^O_d` (the program form of Mathlib's `Nat.RecursiveIn.subst`).

Prove finite simultaneous preservation: if finitely many raw runs of programs `c_j` on inputs `x_j`
against answers `σ` succeed with results `d_j`, and answers `τ` agree with `σ` at every address
below the largest of the uses of the `d_j`, then every one of these runs succeeds against `τ` with
the same result, at the same fuel and at every larger fuel; the same holds for Soare's stage
evaluation at every larger stage. A computation with use zero is preserved against any answers.
*Needs:* Tau Ceti `TauCeti.Oracle.Single.Code.evaln`, `TauCeti.Oracle.Single.Code.evalStage` and,
in the namespace `TauCeti.Oracle.Single.Code`, `evaln_eq_some_of_eqOn`, `evalStage_eq_some_of_eqOn`
and `evaln_mono`; Mathlib `Nat.RecursiveIn.subst`.

**Checks.**
- Let `c` be the program that queries its input and `d` the successor program. The substituted
  program is the successor: against every oracle it returns `x + 1` on input `x` and makes no
  query, so its use is zero. A substitution that kept the outer query and composed with `d`
  afterwards would query address `x` and return the oracle's answer plus one.
- The runs of the query program on inputs `0` and `5` have uses `1` and `6`. Answers agreeing below
  `6` preserve both; answers agreeing only below `1` preserve the first and can change the second,
  so the bound must be the largest use, not the smallest.

### 0.2 Pointwise adequacy is not uniformity

Prove `no_uniform_program_for_emptiness`: no single index `e` has, for every set `Z`, `Φ^Z_e` equal
to the constant function with value `1` when `Z = ∅` and `0` otherwise. For each `Z` that function
is constant, so some index computes it; but a run that halts on `∅` with use `u` halts with the same
output on `{u}`, which agrees with `∅` below `u`. Consequently adequacy, which gives for every
oracle an index, does not in general yield one index for every oracle, and no computable extraction of a program
from an arbitrary `RecursiveIn` proof is assumed anywhere in this roadmap. Uniformity statements
take program indices or coded schemes as input and produce computable index transformations whose
correctness holds for every oracle, as Tau Ceti's universal program, s-m-n and fixed points do.
*Needs:* Tau Ceti's use principle (`evaln_eq_some_of_eqOn` and `evalStage_sound` in the namespace
`TauCeti.Oracle.Single.Code`).

### 0.3 Earliest-discovery racing

Call a *staged discovery* a sequence `D : ℕ → Option α` that is persistent: once `D(s) = some a`,
`D(t) = some a` for every `t ≥ s`. The stage evaluation of a fixed program on a fixed input against
fixed answers is one (Tau Ceti's `evalStage_mono`). For staged discoveries `D_0, …, D_{k−1}` define
their race, a staged discovery with values in `Fin k × α`: at stage `s` it is `none` while no `D_i`
has discovered anything by stage `s`; from the first stage at which some `D_i` has discovered, it
is `some (i, a)` with `i` the least index among those whose first discovery stage is least and `a`
its value. Prove:

- the race is persistent: the winner is selected at the first discovery stage and then retained;
- the race discovers exactly when some `D_i` does, and its winner's first discovery stage is at
  most that of every `D_i`;
- if the `D_i` are computable uniformly in `(i, s)`, the race is computable in `s`; for the stage
  evaluations of programs `c_0, …, c_{k−1}` against a set's answers it is computable from that set,
  uniformly in the programs.

*Needs:* Tau Ceti `TauCeti.Oracle.Single.Code.evalStage` and `evalStage_mono`,
`primrec_evalStage` in the namespace `TauCeti.Oracle.Single.Code`.

**Checks.**
- Let `D_1` discover at stage `1` and `D_0` at stage `2`. Preferring at each stage the least `i`
  whose `D_i` has discovered gives `1` at stage `1` and `0` at stage `2`, which is not persistent;
  the race keeps `(1, ·)` from stage `1` on.
- If `D_0` and `D_1` both first discover at stage `3`, the race picks `0` at stage `3` and keeps
  it, whatever later stages show.

### Examples

- The query-free programs `zero` and `succ` succeed with use `0` at every fuel above the input,
  against any answers, including none at all. In the acceptance file the fuelled evaluator
  `Code.run` gives `zero` the result with output and use `0` against empty answers, and fails on a
  query against empty answers: a computation with use zero is not a missing answer.
- A query at address `0` succeeds with use `1` against the strings `(1)` and `(0)`: a negative
  answer is an answer and still has positive use (the acceptance file checks that `Code.run` returns
  output `0` and use `1` for the answer `0`). Against the empty string it fails.
- A query at address `1` against a string of length one fails at every fuel: the string answers
  nothing beyond its length.
- A computation invalidated by a later c.e. entry: the query program on input `3` against a stage
  `A_s` with `3 ∉ A_s` halts with output `0` and use `4`; if `3` enters at stage `s + 1`, the run
  against `A_{s+1}` outputs `1`.
- Simultaneous preservation of two computations with different uses, and the race with its
  non-persistent left-preference variant, as in the Checks of 0.1 and 0.3.

### Dependencies

Tau Ceti: single-oracle programs, their evaluation, raw runs and stage evaluation with use, the use
principle, adequacy, the universal program, s-m-n and fixed points. Mathlib: `Nat.Partrec.Code`,
`RecursiveIn`, `Nat.RecursiveIn.subst`. No earlier layer.

## Layer 1: c.e. sets and effective presentations of enumerations

Finite stages and their limits, membership by an existential stage, fresh entries and their unique
entry stage under monotonicity, finite-prefix stabilization, stage shifts and reindexing by cofinal
clocks, the presentation of a c.e. set as the domain of a program and as the union of computable
increasing finite stages starting empty, and serialization to at most one new element per stage,
uniformly from a program, are Tau Ceti's (supplier contracts). An enumeration's finite stage data
and its limit are separate objects: the limit is not given a computable characteristic function
because its stages are computable. This layer adds the relative notions and the remaining
presentations [S, II.1–2; III.1].

### 1.1 C.e. and computable relative to an oracle

For a set `Z` and a predicate `p` on ℕ, define *c.e. in `Z`* (`REPredIn`): the partial function that
halts without information exactly where `p` holds is recursive in the oracle of `Z`; and *computable
in `Z`* (`ComputablePredIn`): `p` has a decision procedure computable in the oracle of `Z`. Prove:

- at the empty oracle they are Mathlib's notions: `rePredIn_empty_iff` (c.e. in `∅` iff `REPred`)
  and `computablePredIn_empty_iff` (computable in `∅` iff `ComputablePred`);
- `p` is c.e. in `Z` iff `{x : p x} = W^Z_e` for some `e` (`rePredIn_iff_W`), iff `p` is the domain
  of some partial function recursive in the oracle of `Z`;
- `W^Z_e` is the union of its stages `W^Z_{e,s} = {x < s : Φ^Z_{e,s}(x)↓}`, which increase with `s`
  (`WStage_mono`, `mem_W_iff_mem_stage`), and `y` is a value of `Φ^Z_e` at `x` iff some stage
  computation converges at `x` with output `y` (`mem_phi_iff_stage`);
- `p` is computable in `Z` iff `p` and its negation are both c.e. in `Z`;
- c.e. in `Z` is closed under finite union and intersection, preimage under a computable function,
  and projection `x ↦ ∃ y, q ⟨x, y⟩`; computable in `Z` is closed under the Boolean operations and
  computable preimage;
- if `Z ≤_T Y`, every predicate c.e. in `Z` is c.e. in `Y` and every predicate computable in `Z` is
  computable in `Y`.

*Needs:* Mathlib `RecursiveIn`, `ComputableIn`, `REPred`, `ComputablePred`,
`ComputablePred.computable_iff_re_compl_re'`, `RecursiveIn.partrec_of_oracle`; Tau Ceti's adequacy,
`exists_code` and `mem_eval_iff_exists_evalStage` in the namespace `TauCeti.Oracle.Single.Code`.

**Checks.**
- The empty set is c.e. in every `Z`, as the domain of the nowhere-halting program. A definition of
  "c.e. in `Z`" as "the range of a total function computable in `Z`" would exclude it.
- `K` is c.e. in `∅` and not computable in `∅`, and its complement is computable in `∅′` and not
  c.e. in `∅`. So c.e. in `Z` is not closed under complement, and a definition that identified it
  with "computable in `Z`" would make `K` not c.e.

### 1.2 Presentations and closure of c.e. sets

Prove, with the index maps computable where an index is given:

- a set is c.e. iff it is the range of a partial computable function;
- a nonempty set is c.e. iff it is the range of a total computable function; the empty set is c.e.
  and has no total range presentation;
- an infinite set is c.e. iff it is the range of an injective total computable function;
- for uniformly indexed families, there are computable index maps for union and intersection
  (`W_{u(a,b)} = W_a ∪ W_b`, `W_{i(a,b)} = W_a ∩ W_b`), for preimage under a computable `f`
  (`W_{f*(a)} = f⁻¹(W_a)`), for the image under a partial computable `g` (`W_{g!(a)} = g(W_a)`) and
  for projection (`W_{π(a)} = {x : ∃ y, ⟨x, y⟩ ∈ W_a}`), each with its semantic equation;
- the relative forms of all of these, for `W^Z` and with index maps independent of `Z`; at `Z = ∅`
  they are the ordinary ones.

*Needs:* 1.1; Mathlib `REPred`, `Partrec`, `Nat.Partrec.Code`; Tau Ceti
`TauCeti.Enumeration.rePred_iff_exists_code`, `TauCeti.Enumeration.rePred_iff_exists_stages`.

**Checks.**
- The empty set is c.e. and is not the range of any total function `ℕ → ℕ`, whose range is nonempty:
  the range presentation needs the nonemptiness hypothesis.
- The constant function `0` is total computable with range `{0}`, so a range presentation need not
  be injective; injective enumerations exist exactly for the infinite c.e. sets, and `{0}` has none.

### 1.3 Serialization of pairs and tagged unions, and exactly-one-entry enumerations

Prove, uniformly from an index and without deciding whether the set is finite:

- serialization for enumerated pairs: a c.e. relation on ℕ × ℕ given by computable increasing finite
  stages has a computable stage sequence of pairs, starting empty, adding at most one new pair at each
  stage, with the same limit;
- serialization for tagged disjoint unions: for c.e. sets `A` and `B` given by stages, a serialized
  enumeration of `{(0, x) : x ∈ A} ∪ {(1, x) : x ∈ B}`, each new entry carrying the tag of its
  source;
- stage comparison: computable maps between the stages of an enumeration and those of its
  serialization, in both directions, such that every element present at a stage of one is present
  at the mapped stage of the other, witnessing equality of the limiting sets.

Prove that an infinite c.e. set has a computable enumeration starting empty with exactly one new
element at every stage, and the same limit. *Needs:* 1.2; Tau Ceti `TauCeti.Enumeration.serializedStage`,
`TauCeti.Enumeration.subset_serializedStage`, `TauCeti.Enumeration.serializedStage_subset`,
`TauCeti.Enumeration.stageLimit_serializedStage`, `TauCeti.Enumeration.computable_serializedStage`.

**Checks.**
- A finite set, the empty set included, has no enumeration adding exactly one new element at every
  stage, since after finitely many stages nothing is left to add; the serialized form, zero or one
  new element, covers it. A serialization promising exactly one entry would exclude every finite
  set.

### Examples

- The empty set (all stages empty), a singleton `{5}` (empty, then `{5}` from stage `1` on), a finite
  set, all of ℕ (stage `s` is `{0, …, s − 1}`), the even numbers (stage `s` is
  `{2x : x < s}`), and `K` (stage `s` is `{e < s : Φ_{e,s}(e)↓}`).
- A repeated-output enumeration: the constant function `0` enumerates `{0}`; only stage `1` has a
  fresh entry.
- A paused enumeration: `{0, …, ⌊s/2⌋ − 1}` has the same limit as `{0, …, s − 1}`, each number
  entering at twice the stage.
- A batched enumeration and its serialization: the stages `A_0 = ∅` and `A_{s+1} = {0, …, 2^s − 1}`
  add the `2^s` numbers from `2^s` to `2^(s+1) − 1` at once at stage `s + 2`; the serialization adds
  them one at a time over later stages.
- Two enumerations of the same set with different entry times, the paused one and the unpaused one.

### Dependencies

Layer 0 for the relative forms. Tau Ceti: enumeration stages, their limits and serialization, and
the presentations of c.e. sets as domains and as stage unions. Mathlib: `REPred`, `ComputablePred`,
`Partrec`, `RecursiveIn`.

## Layer 2: numberings, reductions, joins and searches

The set oracles, the characterization of the computable sets as the bottom degree, the passage from
many-one to Turing reducibility, the parity join as a least upper bound in Mathlib's degree quotient,
the join of partial functions with the resulting `SemilatticeSup` on `TuringDegree`, the reductions
attached to a disjoint c.e. splitting `B = A_0 ⊔ A_1` (`A_0 ≤_T B`, `A_1 ≤_T B`,
`B ≡_T A_0 ⊕ A_1`, [S, VII.3.3]) with a uniform program, the universal program, s-m-n with
injective parameter compilation, and parameterized self-reference independent of the oracle are Tau
Ceti's (supplier contracts). This layer adds the remaining facts of [S, I.3; II.2–3; III.1–2].

### 2.1 Padding

Define a padding compiler on single-oracle programs, a map we call padding that takes a program `c`
and a number `n`. Prove that padding is primitive recursive and injective in the pair `(c, n)`, and
that for every partial oracle `O` the padded program evaluates against `O` to the same partial
function as `c`. Consequently every partial function recursive in `O` has infinitely many indices,
given uniformly from one of them, independently of `O`. *Needs:* Tau Ceti
`TauCeti.Oracle.Single.Code`, its `Denumerable` numbering and `TauCeti.Oracle.Single.Code.eval`.

### 2.2 Reducibility facts for sets

Prove:

- complement invariance: `A ≡_T Aᶜ` for every set `A`;
- computable changes of presentation: for a computable bijection `π` of ℕ, `π(A)` and `A` are
  one-one equivalent, hence `π(A) ≡_T A`;
- the columns `ω^[e]` (`column`) are infinite (`column_infinite`), pairwise disjoint and cover ℕ, and
  membership of `x` in `ω^[e]` is computable in `(x, e)`;
- ordinary subset inclusion is not a reducibility: there is a noncomputable subset of a computable
  set.

*Needs:* Tau Ceti `Set.oracle`, `ManyOneReducible.turingReducible_oracle`; Mathlib
`OneOneReducible`, `OneOneEquiv`, `Nat.pair`, `Nat.unpair`.

**Checks.**
- `K ≡_T Kᶜ`, but `K` is not many-one reducible to `Kᶜ`: such a reduction would make `K` co-c.e. and
  hence computable. A set reducibility defined through many-one reductions would separate a set from
  its complement.

### 2.3 Least-witness search and finite-priority selection

For a predicate `q` on ℕ × ℕ computable in `Z`, prove that the least-witness search
`a ↦ min {y : q(a, y)}` is a partial function recursive in `Z` whose domain is exactly
`{a : ∃ y, q(a, y)}` and whose value there is the least witness; under the premise
`∀ a, ∃ y, q(a, y)` it is total and computable in `Z`; and an index for the search is computable
from an index for `q`, independently of `Z`. No default number stands for a failed search.

For a finite list of candidates in priority order and an eligibility predicate, define finite-priority
selection: `none` when no candidate is eligible, otherwise `some` of the first eligible candidate.
Prove the minimum specification (the selected candidate is eligible and no earlier one is), the
no-candidate specification (`none` exactly when no candidate is eligible), and computability when
the list and the predicate are computable. The routing search `leastThreat` of 8.3 is an instance.
*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`,
`Nat.RecursiveIn.rfind'`.

### Examples

- Parity inclusions and projections: `x ↦ 2x` and `x ↦ 2x + 1` one-one reduce `A` and `B` to
  `A ⊕ B`, and `n ↦ ⌊n/2⌋` on even and odd `n` recovers them.
- A set equivalent to its complement: every set, by 2.2; for instance `K` and `Kᶜ`.
- Finite sets are computable, hence of the bottom degree.
- A disjoint c.e. split: `K = (K ∩ evens) ⊔ (K ∩ odds)`; both parts are c.e. and Turing reducible to
  `K`, and `K` is Turing equivalent to their join.
- A noncomputable subset of a computable set: `{2x : x ∈ K}` inside the even numbers.
- Parameter compilation and a genuinely self-referential index: by the parameterized fixed point, a
  program that outputs its own index, and an oracle program that queries its own index.

### Dependencies

Layers 0 and 1. Tau Ceti: set oracles, the parity join and its least-upper-bound property, the join
of partial functions and the semilattice of degrees, split reductions, s-m-n and fixed points.
Mathlib: `ManyOneReducible`, `OneOneReducible`, `TuringReducible`, `TuringDegree`.

## Layer 3: the jump, the arithmetical hierarchy and index sets

The concrete jump `Set.jump` (diagonal halting of single-oracle programs), the paired halting set
`Set.pairedJump`, and their theory are Tau Ceti's (supplier contracts): `Z <_T Z′`; monotonicity
under `≤_T` and invariance under `≡_T`; one-one equivalence of the diagonal and paired halting
sets; completeness of `Z′` for the domains of partial functions recursive in `Z`, from which the
upper-bound interface ("some oracle decides every `Z`-halting question") is derived; the iterates
with their strict increase and their transport along reductions; and low sets `Set.Low`, with degree
invariance, downward closure, lowness of computable sets, the fact that a low set does not compute
`∅′`, and the fact that no jump is low. This layer adds the remaining material of [S, III.2;
IV.1–4].

### 3.1 The jump as the complete set c.e. in Z

Prove in the vocabulary of 1.1 that every set c.e. in `Z` is one-one, hence many-one, reducible to
`Z′` (`relative_ce_reduces_jump` states the many-one form), and that `Z′` is c.e. in `Z`; and that a
predicate whose negation is c.e. in `Z` is computable in `Z′`. *Needs:* 1.1; Tau Ceti `Set.jump`,
`Set.oneOneReducible_jump_of_recursiveIn`, `Set.turingReducible_jump_of_recursiveIn`.

### 3.2 The arithmetical pointclasses

Define the classes by number quantifiers over matrices computable in `Z`, not by relative
computability in a jump. For predicates on ℕ: `Σ⁰₀(Z) = Π⁰₀(Z)` is the class of predicates
computable in `Z`; `p ∈ Σ⁰ₙ₊₁(Z)` when there is `q` whose negation is in `Σ⁰ₙ(Z)` (so
`q ∈ Π⁰ₙ(Z)`) with `p(x) ↔ ∃ y, q(⟨x, y⟩)` for all `x` (`SigmaIn`); `Π⁰ₙ(Z)` is the class of
negations of `Σ⁰ₙ(Z)` predicates (`PiIn`); `Δ⁰ₙ(Z) = Σ⁰ₙ(Z) ∩ Π⁰ₙ(Z)` (`DeltaIn`). Tuples are coded by
`Nat.pair`, and a predicate of several arguments is in a class when its uncurried form on the coded
tuple is. Prove:

- the inclusions `Σ⁰ₙ(Z) ∪ Π⁰ₙ(Z) ⊆ Δ⁰ₙ₊₁(Z)`;
- closure: each `Σ⁰ₙ(Z)` and `Π⁰ₙ(Z)` is closed under conjunction, disjunction, bounded quantifiers
  and preimage under computable functions; `Σ⁰ₙ₊₁(Z)` under `∃` and `Π⁰ₙ₊₁(Z)` under `∀`;
- quantifier contraction: two adjacent quantifiers of the same kind merge into one through
  `Nat.pair`, and a relabelling of the coded tuple by a computable bijection does not change the
  class;
- normal forms: every `Σ⁰ₙ(Z)` predicate is `x ↦ ∃ y₁ ∀ y₂ … M(x, y₁, …, yₙ)` with an alternating
  prefix of `n` quantifiers and a matrix `M` computable in `Z`, and dually for `Π⁰ₙ(Z)`;
- `Σ⁰₁(Z)` is exactly the class of predicates c.e. in `Z`.

A normal-form code consists of an alternating number-quantifier prefix, a tuple-arity convention,
and an index for a total Boolean-valued matrix procedure relative to the oracle. Totality is a
semantic promise on the supplied code, not a decidable validity test. Prove that the closure
operations and contractions above are computable maps on such codes, correct for every oracle; they
operate on the coded data and do not extract an algorithm from an arbitrary semantic witness. This
is a development of pointclasses: interpreting a first-order object language of arithmetic is not a
prerequisite. *Needs:* 1.1, 2.3; Mathlib `Nat.pair`, `ComputableIn`.

**Checks.**
- `FIN = {e : W_e finite}` is `Σ⁰₂(∅)`: `e ∈ FIN` iff `∃ n ∀ s ∀ x < s, (x ∈ W_{e,s} → x < n)`, a
  computable matrix after contracting the universal quantifiers. If `Σ⁰ₙ₊₁` were defined by an
  existential quantifier over a `Σ⁰ₙ` matrix instead of a `Π⁰ₙ` one, every level would collapse to
  `Σ⁰₁` (adjacent existential quantifiers contract), and `FIN`, which is not c.e., would not be
  `Σ⁰₂`.
- `K ∈ Σ⁰₁(∅)`, with the computable matrix `(e, s) ↦ Φ_{e,s}(e)↓`, and `K ∉ Π⁰₁(∅)`: a `Π⁰₁` set
  has c.e. complement, and `K` with c.e. complement would be computable.

### 3.3 Post's theorem

Prove, for every set `Z` and every `n`: a predicate is `Σ⁰ₙ₊₁(Z)` iff it is c.e. in `Z⁽ⁿ⁾`
(`post_sigma`), and `Δ⁰ₙ₊₁(Z)` iff it is computable in `Z⁽ⁿ⁾` (`post_delta`). Prove strictness:
`Z⁽ⁿ⁺¹⁾` is `Σ⁰ₙ₊₁(Z)` and not `Π⁰ₙ₊₁(Z)`, so `Σ⁰ₙ₊₁(Z) ≠ Π⁰ₙ₊₁(Z)` and `Δ⁰ₙ₊₁(Z)` is a proper
subclass of both. The proofs use the theorems on the concrete jump and the normal forms of 3.2, not
a definition of the pointclasses through the jump. *Needs:* 3.1, 3.2; Tau Ceti `Set.jump` and its
iterates, `Set.not_jump_turingReducible`, `Set.turingReducible_iterate_jump_of_le`.

### 3.4 Index sets

With `W_e` the domain of Mathlib's ordinary program number `e`, define `TOT = {e : W_e = ℕ}`,
`FIN = {e : W_e finite}` and `INF = {e : W_e infinite}`. Prove the exact classifications with
many-one completeness: `K` is `Σ⁰₁` and every `Σ⁰₁` set many-one reduces to it; `TOT` is
`Π⁰₂`-complete, `FIN` is `Σ⁰₂`-complete and `INF` is `Π⁰₂`-complete. By 3.3, none of `TOT`, `FIN`,
`INF` is `Σ⁰₁` or `Π⁰₁`, and `TOT` is not `Σ⁰₂`. *Needs:* 3.2, 3.3; Mathlib
`ComputablePred.halting_problem`, `ManyOneReducible`.

**Checks.**
- `TOT` is `Π⁰₂`: `e ∈ TOT` iff `∀ x ∃ s, Φ_{e,s}(x)↓`. A single query to `∅′` asks whether one
  computation halts, and a set decidable with finitely many such queries per input would be
  `Δ⁰₂`; `TOT`, being `Π⁰₂`-complete, is not.

### Examples

- Ordinary and relative halting: `K = ∅′`, and the jump of `K` is `∅″`.
- Deciding a predicate with c.e. complement using the jump: `x ∉ W_e` is decided by asking `∅′`
  whether `x ∈ W_e`.
- Computable sets are low and `K` is not (Tau Ceti).
- The distinction between membership in a list of axioms and a decision procedure for its c.e.
  closure: the list may be computable while its closure under computable rules is only `Σ⁰₁`.
- `TOT` against a single halting query, as in the Check of 3.4.
- The jump does not preserve joins: the halves of the splitting of `K` in 8.4 are low while their
  join is Turing equivalent to `K`, which is not.

### Dependencies

Layers 0 to 2 (3.1 needs 1.1; 3.2 needs 1.1 and 2.3). Tau Ceti: the concrete jump, the paired
halting set, iterates and low sets. Mathlib: `ComputablePred.halting_problem`, `ManyOneReducible`,
`OneOneReducible`.

## Layer 4: moduli, limit approximation and stabilization information

Pointwise eventual agreement `TauCeti.Approximation.Converges` and moduli
`TauCeti.Approximation.IsModulus` (the stage is the first argument of the approximation), with
finite-coordinate aggregation, shifts, reindexing along a clock tending to infinity, computability
of a limit from a computable approximation and a computable modulus together with its converse, the
direction of the relativized Limit Lemma that computes a limit in the jump, and the finite-use
lemmas (a genuine computation against a converging sequence of oracles is eventually visible; a
stage computation whose use stays protected is preserved) are Tau Ceti's (supplier contracts). This
layer adds the remaining material of [S, III.3, especially III.3.1–4]. The finite-use lemmas are the
link between the limit calculus and Layers 6 to 8.

### 4.1 Relativized moduli

Prove: if an approximation `f(s, x)` is computable in `Z` uniformly in `(s, x)` and has a modulus
computable in `Z`, its limit is computable in `Z`; in particular a computable approximation with a
modulus computable in `Z` has a limit computable in `Z`. *Needs:* Tau Ceti
`TauCeti.Approximation.IsModulus`; Mathlib `ComputableIn`.

### 4.2 The Modulus Lemma

Prove the Modulus Lemma [S, III.3.2]: for a c.e. set `Z` and a total `f : ℕ → ℕ`, `f` is computable
in `Z` iff `f` has a computable approximation with a modulus computable in `Z`. The forward
direction is `modulus_of_ce_oracle`; the converse is 4.1. *Needs:* 4.1; Tau Ceti
`TauCeti.Enumeration.rePred_iff_exists_stages` and, in the namespace `TauCeti.Oracle.Single.Code`,
`exists_code` and the finite-use lemma `exists_eventually_evaln_setAnswers_eq_some_of_mem_eval`.

**Checks.**
- For `Z = K` and `f` the characteristic function of `K`, the approximation "`x` has entered `K` by
  stage `s`" has the modulus "the entry stage of `x` if `x ∈ K`, else `0`", which is computable in
  `K`; it has no computable modulus, since a computable modulus would decide `K`. The lemma's
  modulus is computable in `Z`, not computable outright.

### 4.3 The Limit Lemma

Prove the Limit Lemma [S, III.3.3], relativized, for total functions `ℕ → ℕ`: for every set `Z`,
`f` is computable in `Z′` iff `f` is the pointwise eventually constant limit of a sequence of total
functions uniformly computable in `Z` (`limitLemma`). Prove the characteristic-function
specialization: `A ≤_T Z′` iff the characteristic function of `A` is such a limit. Using 3.3, prove
that `A ∈ Δ⁰₂(Z)` iff the characteristic function of `A` is such a limit. *Needs:* 3.3 for the `Δ⁰₂`
form only; Tau Ceti `TauCeti.Approximation.Converges.computableIn_jump`,
`TauCeti.Approximation.Converges.turingReducible_jump`, `Set.jump`.

**Checks.**
- The approximation "`x` has entered `K` by stage `s`" converges to the characteristic function of
  `K`, which is computable in `∅′` and not computable: a limit of a computable approximation without
  a modulus is not computable in general.

### 4.4 Functions of c.e. degree

Prove [S, III.3.4]: a total `f : ℕ → ℕ` has c.e. degree, that is, `f` (as the partial function
`n ↦ Part.some (f n)`) is Turing equivalent to `Set.oracle A` for some c.e. set `A`, iff `f` has a
computable approximation with a modulus computable in `f`. Prove the graph coding used to pass
between total functions and sets: a total `f` is Turing equivalent to its graph `{⟨x, f x⟩ : x ∈ ℕ}`.
*Needs:* 4.1, 4.2; Tau Ceti `Set.oracle`, `TauCeti.Approximation.IsModulus`.

### Examples

- Finite-change approximations: each value changes finitely often, and the limit exists.
- The increasing approximation to `K`, whose limit is not computable (Check of 4.3).
- A bit that changes once and then stays changed: the approximation `s ↦ (x < s)` converges to
  `true`, and its moduli are exactly the functions `m` with `x < m(x)`.
- An eventually stable restraint with no supplied effective stabilization stage: each restraint of
  the low simple construction is eventually constant, and no computable bound on the stabilization
  stage is part of that statement.
- An everywhere computable modulus for the standard approximation to `K` would decide `K` (Check
  of 4.2).

### Dependencies

Layer 1 (4.2 uses c.e. oracles and the relative notions), and 3.3 for the `Δ⁰₂` form of 4.3. Tau
Ceti: convergence, moduli, the finite-use lemmas and one direction of the Limit Lemma. Mathlib:
`ComputableIn`, `TuringEquivalent`.

## Layer 5: diagonalization, simple sets and the Kleene–Post construction

Computable inseparability `Set.ComputablyInseparable` and a disjoint pair of computably inseparable
c.e. sets from the two diagonal output conditions, with its disjointness and its indices ([S, I.3,
exercises on inseparability]); immune and simple sets `Set.Immune` and `Set.Simple` with the
requirement characterization (a c.e. set is simple iff its complement is infinite and it meets every
infinite `W_e`); Post's simple set, built with the witness condition `x > 2e` and the counting
invariant that gives coinfinitude; and the noncomputability of simple sets ([S, V.1]) are Tau Ceti's
(supplier contracts). Simplicity does not imply incompleteness: no statement here derives Turing
incompleteness from simplicity. This layer adds the oracle construction of [S, VI.1].

### 5.1 The Kleene–Post construction

Prove `kleene_post` [S, VI.1.2]: there are sets `A` and `B`, both Turing reducible to `∅′`, with
neither Turing reducible to the other. Build finite strings `α_s ⊆ α_{s+1}` and `β_s ⊆ β_{s+1}` by a
finite-extension procedure computable in `∅′`, meeting `R_{2e} : A ≠ Φ^B_e` and
`R_{2e+1} : B ≠ Φ^A_e` in turn. To meet `R_{2e}` take `x` the first number outside the domain of
`α_s`, and ask `∅′` whether some string extending `β_s` makes `Φ_e(x)` converge. State the
alternative: either such an extension `β′` exists, and then `β_{s+1}` is the first found and
`α_{s+1}` sets `x` to a value different from the output; or none exists, and then `Φ^B_e(x)`
diverges for every `B` extending `β_s`, and the requirement holds by permanent divergence. Prove that
the question is a c.e. search in the strings, so `∅′` decides it; that both strings are extended at
every step, so every coordinate receives a value (coverage) and the limits are total characteristic
functions; that every diagonal requirement holds; and that `A, B ≤_T ∅′`. The construction uses an
oracle and does not give c.e. sets; the c.e. pair is Layer 7. *Needs:* Layers 0 and 2 (strings as
oracle answers, and the use principle); Tau Ceti `Set.jump`,
`Set.turingReducible_jump_of_recursiveIn`, `TauCeti.Oracle.Single.Code.evaln`.

**Checks.**
- If `Φ_e` is the program that ignores its oracle and diverges, no extension makes `Φ_e(x)` converge;
  the requirement `R_{2e}` holds by divergence, and the procedure must still extend both strings, or
  the coordinate `x` would never receive a value.

### Examples

- Both computably inseparable sets: `{e : φ_e(e) = 0}` and `{e : φ_e(e) = 1}`.
- The protected coinfinite reservoir of Post's construction: at most `n` of the numbers
  `0, …, 2n` enter the simple set, so its complement is infinite.
- A requirement with finite `W_e` is vacuous: simplicity asks nothing of it.
- Kleene–Post requirements met by a permanent disagreement and by permanent divergence (Check of
  5.1).

### Dependencies

Layers 0 to 2. Tau Ceti: computably inseparable sets, immune and simple sets, Post's simple set, the
jump. Mathlib: `REPred`, `ComputablePred`, `TuringReducible`.

## Layer 6: injury sets, events, restraints and finite-injury reasoning

This layer is public infrastructure: no definition in it is private to a construction or defined
retrospectively from the assertion that a proof succeeds [S, VII.1, pp. 111–113; VII.2,
pp. 118–120; VII.3, pp. 122–126]. For any finite-stage sequence `A_s` and restraint data `r(e, s)`,
the injury batch `J(e, s)` (`TauCeti.Priority.injuriesAt`), the event relation "`x` injures `e` at
stage `s + 1`" (`TauCeti.Priority.injuryEvents`), the number set `I_e` (`TauCeti.Priority.injurySet`)
and the injury-stage set `S_e` (`TauCeti.Priority.injuryStages`) are Tau Ceti's, with: their
membership equations; projections from events to numbers and to stages; monotonicity in the
restraint; under monotone stages, at most one entry stage per number and the equivalences
`I_e finite ⟺ S_e finite ⟺ ∃ s₀ ∀ s ≥ s₀, J(e, s) = ∅`; `|S_e| ≤ |I_e|` for monotone stages and
finite `I_e`; uniform computability of the event relation and of `S_e` and uniform c.e.-ness of
`I_e` from computable stage data, `I_e` being in general only c.e.; the use-prefix breaches as the
injuries for the shifted restraint `TauCeti.Priority.usePrefixRestraint`, the boundary batch
`TauCeti.Priority.boundaryInjuriesAt`, the decomposition of each batch into breaches and boundary
entries, and finiteness of the breaches from finiteness of `I_e`; finiteness of `I_e` from eventual
boundedness of the restraint, with no monotonicity of the stages and no bound on earlier values, and
an injury-free tail when the stages are monotone; the cause-counting bound
`|I_e| ≤ ∑_{i<e} b_i` for injuring entries certified to come from higher-priority contributors
supplying at most `b_i` entries each, the attribution covering the actual entries (a ledger of
contributions alone bounds nothing), and its one-entry form `|I_e| ≤ e`; preservation of a stage
computation in the limit when no element below its use enters later, and when a live restraint keeps
covering the use and is never injured, inclusively or for use-prefix breaches; and priority records
with updates, locality and reset, attention stages, and stabilization of each record from local
finiteness of attention (supplier contracts). This layer adds the rest.

### 6.1 Finite histories, extensionality and single-entry counting

Define the injuries through stage `n`, `⋃_{s<n} J(e, s)` (`injuriesThrough`). Prove that they
increase with `n` (`injuriesThrough_mono`) and that `x ∈ I_e` iff `x` lies in the injuries through
some stage (`mem_injurySet_iff_through`); that the injury set depends only on the stages and on the
restraint of `e` (`injurySet_congr`); and that for monotone stages, finite `I_e`, and at most one
injuring entry at each stage, `|S_e| = |I_e|` (`injuryStages_ncard_eq_of_single_entry`). The general
interface carries no single-entry hypothesis. Cardinal bounds are stated together with finiteness:
`Set.ncard` is zero on an infinite set, and a bound on it alone would be vacuous.
*Needs:* Tau Ceti `TauCeti.Priority.injuriesAt`, `TauCeti.Priority.injurySet`,
`TauCeti.Priority.injuryStages`, `TauCeti.Priority.injOn_snd_injuryEvents`,
`TauCeti.Priority.ncard_injuryStages_le`.

**Checks.**
- Two numbers entering at one stage under a restraint covering both give `|I_e| = 2` and `|S_e| = 1`
  (Example 4 below): the single-entry hypothesis is needed for equality.
- For stages that are not monotone, `0` entering at stage `1`, leaving, and entering again at stage
  `3` for good gives `I_e = {0}` under the restraint `some 0`, and `S_e = {1, 3}`, so
  `|S_e| ≤ |I_e|` fails without monotonicity even when both sets are finite.

### 6.2 Several monitored oracles

For several constructed sets, indexed by labels, parameterize the monitored oracle by a target map
from requirements to labels, and define the labelled injury events (`monitoredInjuryEvents`): the
events of requirement `e` in the stages of its target set, each carrying the label. Prove the
membership equation (`monitoredInjuryEvents_mem`); that projecting the labelled events of `e` gives
the unlabelled events of its target set; and that restricting to an initial segment of priorities
`{e : e < n}` commutes with this projection. The label keeps an entry of a number in `A` distinct
from an entry of the same number in `B`. A switch of monitored oracle is a new proof obligation, not
a reindexing of unlabelled numbers. In the original Friedberg–Muchnik construction the requirements
enumerate into one set and protect the other: the target of `R_{2e}` is `B` and that of `R_{2e+1}`
is `A`. *Needs:* Tau Ceti `TauCeti.Priority.injuryEvents`.

### 6.3 Initialization, epochs and finite-injury induction

Define the initialization stages of requirement `e` under the blanket-reset convention, the stages at
which some requirement of strictly higher priority acts (`initializationStages`), and, for a strategy
that uses them, its epochs, the intervals between consecutive initialization stages. Prove that if
every requirement of higher priority than `e` acts finitely often, `e` is initialized finitely often
(`initialization_finite_of_attention`), so its last epoch is infinite. Locality for records, that
an action at a lower priority does not modify higher-priority records, is Tau Ceti's; prove its form
for injuries: an entry above every current higher-priority restraint injures no higher-priority
requirement, so respecting those restraints prevents the relevant injuries. The construction's own
rule that a higher-priority attention event resets lower-priority records is a separate statement,
and an initialization may occur with no new number entering a protected interval.

Two styles of finite-injury reasoning are reusable. In the first, finiteness of attention at each
priority, given finiteness at all higher priorities, gives eventual silence of every priority by
induction, and locality then gives stabilization of each finite record; Tau Ceti proves both steps.
In the second, finite injury to a negative requirement together with the preservation equations of
its computations and a hypothesis on its target gives satisfaction and stabilization of its
restraint, with no finite set of discrete attention events; it is stated and proved in 8.1, for the
agreement restraint that Sacks's changing restraints use. Each lemma states the premises it uses:
the general interface asks for no computable bound on injuries and no effective stabilization stage,
and stabilization of an idle strategy is not a satisfaction theorem.
*Needs:* Tau Ceti `TauCeti.Priority.attentionStages`,
`TauCeti.Priority.finite_attentionStages_of_local`, `TauCeti.Priority.Update`,
`TauCeti.Priority.run`, `TauCeti.Priority.exists_forall_getElem?_run_eq_of_local`.

### Examples

These boundary cases are part of the specification; the acceptance file proves those marked with its
example data from the definitions.

1. With an inactive restraint a fresh entry at `0` is not an injury; with `some 0` it is (stages
   `Examples.zeroThenZero`, restraints `Examples.allInactive` and `Examples.allZero`).
2. A fresh entry exactly at an active restraint is an injury: under `some 1`, an entry `1` gives
   `I_e = {1}` (`Examples.zeroThenBoundary`, `Examples.allOne`).
3. An entry at the exclusive use boundary leaves the computation intact although it is a
   conservative injury: with `1` entering under the restraint `some 1`, the strings of length one of
   the stage and of the limit agree, so a computation of use `1` is preserved
   (`Examples.zeroThenBoundary`).
4. Two distinct injuring numbers at one stage contribute two numbers and one injury stage:
   `I_e = {0, 1}` and `S_e = {1}` (`Examples.zeroThenPair`).
5. Without monotonicity, repeated entry and removal of `0` gives `I_e = {0}` and infinitely many
   injury stages (`Examples.oscillatingZero`).
6. A lower-priority reset can occur without any injury to the protected oracle: requirement `0` acts
   once and initializes requirement `1` at stage `1`, while no number ever enters
   (`Examples.resetOnce`).
7. Finite injury alone does not force an arbitrary restraint to stabilize: with no entries and the
   growing restraint `r(e, s) = some s`, `I_e = ∅` and the restraint is never constant
   (`Examples.growingRestraint`).
8. Absence of injury to a restraint that later drops does not preserve an earlier use it no longer
   covers: the restraint `some 1` at stage `0` and `none` afterwards, with `0` entering at stage `2`,
   give `I_e = ∅` while the string of length one changes (`Examples.lateZero`,
   `Examples.droppedRestraint`).
9. A discovery against a fixed oracle is persistent; a discovery against a moving oracle can fail:
   the query program on input `0` outputs `0` against the stage `∅` and `1` once `0` has entered.
10. An event in one oracle cannot discharge the matching event claim for another: if `5` enters `A`
    and not `B`, the labelled event of `5` in `A` is present and the one in `B` is not.
11. Boundary-only injuries under a growing restraint can be infinite with no use-prefix breach:
    with `A_s = {0, …, s − 1}` and `r(e, s) = some s`, every number is an injury and no entry lies
    strictly below the restraint (`Examples.initialSegments`). Finitely many use-prefix breaches do
    not give finite injury without control of the restraint.
12. A uniformly c.e. family of finite injury-number sets need not be uniformly computable: for the
    standard enumeration of `K` (`Examples.haltingStages`) and the restraint `r(e, s) = some e`
    (`Examples.perIndexRestraint`), `I_e = K ∩ [0, e]`, and the diagonal query `e ∈ I_e` would
    decide `K` (`Examples.finite_injurySet_haltingStages_and_not_computablePred`).

### Dependencies

Tau Ceti: the injury objects and their calculus, priority records and attention, the preservation
lemmas, and Layer 0's material for them. Mathlib: `Set.Finite`, `Set.ncard`, `Finset`. Layer 0 for
the preservation statements only.

## Layer 7: the original Friedberg–Muchnik construction

This layer builds the c.e. pair of [S, VII.2.1] by the original witness-and-restraint construction.
Deriving the existence of incomparable c.e. sets only from Sacks splitting (8.4) does not supply the
stages, witnesses and injury interfaces asked for here, so the construction itself is the target.

### 7.1 Requirements, witnesses and the stage transition

Use the requirements `R_{2e} : A ≠ Φ^B_e` and `R_{2e+1} : B ≠ Φ^A_e` (Convention 13), each with its
own infinite column of potential witnesses (2.2), restraints that are inactive until set, and least
eligible attention. At stage `s + 1`, a requirement whose current witness `x` is not yet enumerated
and at which the stage computation of the opposite oracle gives `0` requires attention; the
highest-priority such requirement enumerates `x` into its own set, sets its restraint to the use of
that computation, protecting the opposite set, and initializes every lower-priority requirement,
cancelling its witness and its restraint. A requirement without a witness is appointed a fresh one
from its column; witness allocation and reallocation are computable searches in the infinite column
above all the current bounds the construction requires, and an appointment is a separate event from
an attention event that enumerates a witness. Prove that these searches are computable and always
succeed, the columns being infinite. A finite record of the active requirements together with a
uniform default for those not yet activated may represent Soare's infinite sequence of markers;
prove the correspondence theorem relating that record to the markers.

Export the stage transition and its computability, c.e. indices for `A` and `B`, witness ownership
(each witness belongs to one requirement and lies in its column), monotonicity of the stages, the
action and initialization equations, higher-priority locality (a lower-priority action changes no
higher-priority witness or restraint), protection of the opposite oracle below each active
restraint, and the actual injury events, as the labelled events of 6.2 with targets `B` for
`R_{2e}` and `A` for `R_{2e+1}`. *Needs:* 2.2 (columns), 2.3, 6.2, 6.3; Tau Ceti
`TauCeti.Oracle.Single.Code.evalStage`, `TauCeti.Enumeration.stageLimit`,
`TauCeti.Enumeration.rePred_iff_exists_stages`, `TauCeti.Priority.injuryEvents`.

### 7.2 Priority induction and the injury bound

Prove by induction on the priority that each requirement eventually has a permanent witness and acts
at most once after every higher-priority requirement has stopped acting. Prove the quantitative
bound of the original convention: requirement `R_i` acts at most `2^i` times, since it acts at most
once between consecutive initializations, so the number of injuries to `R_e` is at most the number
of higher-priority actions, `∑_{i<e} 2^i = 2^e − 1`, and in particular finite. An implementation
with auxiliary bookkeeping actions relates them to the mathematical attention events before quoting
this bound. *Needs:* 7.1; 6.3; Tau Ceti `TauCeti.Priority.finite_attentionStages_of_local`,
`TauCeti.Priority.finite_injurySet_and_ncard_le_sum_of_causes`.

**Checks.**
- Higher-priority actions can outnumber the higher-priority requirements: `R_1` acts, `R_0` then acts
  and initializes it, and `R_1` acts again with a new witness, three actions above `R_2`. A count
  allowing one action per requirement would give `e`; the bound counts actions, `2^e − 1`, which is
  `0`, `1` and `3` for `e = 0, 1, 2`.

### 7.3 The Friedberg–Muchnik theorem

Prove satisfaction of each requirement in both cases: when a computation of `0` at the permanent
witness is permanently preserved, so the witness is in its own set while the opposite oracle's
functional gives `0`; and when no such computation appears after stabilization, so the witness stays
out while the functional does not give `0` there. Use the adequacy of Tau Ceti's programs to
quantify over every Mathlib oracle reduction. Conclude `friedberg_muchnik`: there are c.e. sets `A`
and `B` with `A ≰_T B` and `B ≰_T A`; and derive that both degrees are nonzero (a computable set
reduces to every set) and below `0′`, that is `∅ <_T A <_T ∅′` and `∅ <_T B <_T ∅′`.
*Needs:* 7.1, 7.2; Tau Ceti `Set.turingReducible_jump_of_recursiveIn`, `Set.empty_turingReducible`
and, in the namespace `TauCeti.Oracle.Single.Code`, `turingReducible_iff_exists_code` and
`evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty`.

### Examples

- If `Φ_e` ignores its oracle and returns `1` everywhere, `R_{2e}` never requires attention and is
  satisfied because its witness stays out of `A` while `Φ^B_e` gives `1` there.
- If `Φ_e` ignores its oracle and returns `0` everywhere, `R_{2e}` acts once its witness has been
  appointed and the stage bound admits the computation; after the higher priorities have stopped
  acting, its last witness enters `A` while `Φ^B_e` gives `0` there, whatever `B` becomes, since the
  computation makes no query.

### Dependencies

Layers 0, 2 and 6. Tau Ceti: single-oracle programs and their adequacy, enumeration stages, the
injury calculus and the preservation lemmas, priority records, and the jump for the degree
corollary.

## Layer 8: agreement preservation and Sacks's constructions

This layer implements [S, VII.3.1–7]. Tau Ceti has the length of agreement and the agreement
restraint of a raw run with fuel against a target function (`TauCeti.Oracle.Single.Code.agreementLength`,
`TauCeti.Oracle.Single.Code.agreementRestraint`), with their preservation under a change of answers
above the restraint and their persistence over an interval of stages on which neither the answers
at or below the restraint nor the target below the length change (supplier contracts). Soare's
`ℓ(e, s)` and `r(e, s)` use the stage evaluation of Convention 9 instead, with its bound on the
index; the finite searches of 8.3 depend on that bound.

### 8.1 Length of agreement and its restraint

For a c.e. target `C` and a constructed set `A` with stages `C_s` and `A_s`, define the stage
agreement `agreesAt` (the stage computation `Φ^{A_s}_{e,s}(x)` converges with output `C_s(x)`), the
length of agreement `ℓ(e, s)` (`agreementLength`), the first argument at which the stage computation
is absent or differs from `C_s`, and the restraint
`r(e, s) = max {u(A_s; e, x, s) : x ≤ ℓ(e, s)}` (`agreementRestraint`, with `sacksRestraint` its
active form `some r(e, s)`), where the stage use of a divergent computation is `0`. The upper index
is inclusive: the restraint protects any convergent computation at the first disagreement as well as
the computations at smaller arguments. Prove:

- `ℓ(e, s) ≤ s`, every argument below `ℓ(e, s)` agrees, and `ℓ(e, s)` does not
  (`agreementLength_spec`): Soare's stage bound makes the search end at the latest at `s`;
- every stage use at an argument up to and including `ℓ(e, s)` is at most `r(e, s)`
  (`stageUse_le_agreementRestraint`, `first_disagreement_use_le`);
- `ℓ` and `r` are computable uniformly in `(e, s)` from computable stages of `A` and `C`
  (`agreementLength_computable`, `sacksRestraint_computable`);
- one-step preservation: if the stages of `A` increase, `x ≤ ℓ(e, s)`, the stage computation at `x`
  converges with output `y` and use `u`, and no element enters `A` at stage `s + 1` at or below the
  restraint `r(e, s)` read at stage `s`, then the stage-`(s + 1)` computation at `x` converges with
  the same output and use (`sacks_computation_preserved`); this needs no hypothesis on `C`, and
  agreement at `x` is preserved as well when in addition `C_{s+1}(x) = C_s(x)`
  (`sacks_agreement_preserved`);
- if `Φ^A_e = C` for the limits, the agreement length tends to infinity
  (`agreement_cofinal_of_computes`);
- on an injury-free interval, the simultaneous preservation equations of the Remark in [S, VII.3,
  p. 122], and the stable-disagreement alternative;
- [S, VII.3.1, Lemma 1] (`nonreduction_of_finite_sacks_injury`): if `A` and `C` are c.e. with
  increasing stages, `C` is not computable, and the injury set of `e` for the restraint `r` is
  finite, then `Φ^A_e ≠ C`. If `Φ^A_e = C`, arbitrarily long agreement after the last injury lets a
  computable search decide `C`; the last injury stage is not computed from the data, it is a fixed
  number in the existence proof of the decision procedure;
- stabilization (`sacks_agreement_and_restraint_stabilize`): if the injury set of `e` is finite and
  `Φ^A_e ≠ C`, then `ℓ(e, s)` and `r(e, s)` are eventually constant; with Lemma 1, finite injury
  alone gives an eventually constant restraint when `C` is not computable
  (`sacks_restraint_stabilizes`).

To iterate preservation across an interval, the live restraint must continue to cover the recorded
use, as in Layer 6, or that coverage must be proved from the construction's invariants: absence of
injury is not enough, because a change of `C` at a smaller argument can shorten the agreement length
and release the protection. Preserving agreement also needs the target bit at the argument to stay
unchanged.

The stabilization statement takes the disagreement as a hypothesis, so that it does not depend on
how nonreduction was obtained; in the constructions nonreduction comes from Lemma 1. Its route: let
`x₀` be the first argument with `Φ^A_e(x₀) ≠ C(x₀)`. If `Φ^A_e(x₀)` diverges, computations against
the stages `A_s` may still converge transiently at `x₀`; once injuries have stopped and the target
bits at and below `x₀` and the computations at smaller arguments have settled, such a transient
computation is protected by the inclusive maximum and would be preserved forever, giving a
convergent computation against `A`. So `ℓ(e, s)` is eventually `x₀`, and the restraint, a maximum
over finitely many settled uses, stabilizes. The order of the argument is: finite injury and a
limiting disagreement give stabilization of the agreement length, which gives stabilization of the
restraint. Neither the lengths of agreement nor the restraints are assumed globally monotone.
*Needs:* Layer 0 (stage evaluation and the use principle); Layer 6; Tau Ceti
`TauCeti.Oracle.Single.Code.evalStage`, `TauCeti.Priority.injuriesAt`,
`TauCeti.Priority.injurySet`, `TauCeti.Priority.finite_injurySet_iff_eventually_eq_empty`,
`TauCeti.Enumeration.finite_prefix_stabilizes`, and, in the namespace `TauCeti.Oracle.Single.Code`,
`exists_eventually_evaln_setAnswers_eq_some_of_mem_eval` and
`evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty`.

**Checks.**
- Let `Φ_e` return `0` at input `0` without queries and return the oracle's answer at `1` at input
  `1`, diverging elsewhere, with `A` and `C` empty at first. Then `ℓ = 2`, the stage uses at `0`,
  `1`, `2` are `0`, `2`, `0`, and `r = 2` protects position `1`. When `0` enters `C`, `ℓ` drops to
  `0` and `r` to `0`, and `1` can then enter `A` without injury, changing the computation at `1`
  although `C(1)` never changed: absence of injury does not preserve computations across a drop.
- If the restraint took the maximum only over `x < ℓ(e, s)`, a convergent computation with a wrong
  output at the first disagreement would be unprotected; it could be injured and later agree, so the
  disagreement that witnesses `Φ^A_e ≠ C` would not be preserved.

### 8.2 A simple set avoiding a noncomputable c.e. cone

Prove `exists_simple_avoiding` [S, VII.3.1]: for a c.e. set `C` that is not computable there is a
simple set `A` with `C ≰_T A`. Build `A` with the positive requirements `P_i` (`A` meets `W_i` when
`W_i` is infinite) and the negative requirements `N_e : C ≠ Φ^A_e`, the restraint of 8.1, and the
simple-set witness bounds: `P_i` enumerates the least `x` in `W_{i,s}` with `x > 2i` and
`x > r(e, s)` for every `e ≤ i`, if `P_i` is not yet met. Prove, in this order, finite injury
(`|I_e| ≤ e`, each `P_i` acting at most once, by the one-entry cause count of Layer 6),
nonreduction (Lemma 1), stabilization of the restraints (8.1), and satisfaction of every `P_i`.
Export both an index for the constructed set and its simplicity and cone avoidance. This is a client
of 8.1, not a premise of its generic preservation lemmas. *Needs:* 8.1; Layer 6; Tau Ceti
`Set.Simple`, `Set.simple_iff_forall_code`,
`TauCeti.Priority.finite_injurySet_and_ncard_le_of_subsingleton_causes`.

### 8.3 Splitting a c.e. set with low halves

Take an enumeration of `B` by computable increasing finite stages starting empty, serialized with
pauses or in batches; build disjoint increasing finite stages of `A_0` and `A_1`, assigning every
fresh element of `B` to exactly one side. For each negative requirement `N_{(e,i)} : C ≠ Φ^{A_i}_e`
protect the computations of `Φ^{A_i}_e` against `C` with the restraint `r^i(e, s)` of 8.1 computed
from the stages of `A_i`, ordering the pairs by `2e + i`. Put a fresh element `x` on the side
opposite the highest-priority pair with `x ≤ r^i(e, s)`, and on side `0` if there is no such pair
[S, VII.3, p. 125]. The routing test is the inclusive inequality of the injury set, and each fresh
element is routed separately against the stage-`s` restraints, so the transition also applies to
batched enumerations; empty and finite `B` need no separate case.

The search for the highest-priority threatened pair is finite. At stage `s` no index `e ≥ s` has a
convergent stage computation, so `ℓ^i(e, s) = 0` and `r^i(e, s) = 0` (`sacksRestraint_of_le`). A
positive `x` is therefore threatened only by pairs with `e < s`, and `x = 0` is threatened by the
pair `(s, 0)` at the latest. In both cases the least threatened pair, if any, has `e ≤ s`, and the
search runs over `e ≤ s` and `i ≤ 1` (`pairsThrough`, the selection `leastThreat` of 2.3, and
`leastThreat_sacks`: the search finds the highest-priority threatened pair among all pairs, and finds
none only when no pair is threatened). The side is `routeSide`, and the stages of the halves are
`sacksSplit`. Prove:

- the halves are disjoint with union `B_s` at every stage (`sacksSplit_union`,
  `sacksSplit_disjoint`), and their stages are computable (`sacksSplit_computable`);
- by induction on the priority `2e + i`, the three statements of [S, p. 125]: `I^i_e` is finite,
  `C ≠ Φ^{A_i}_e`, and `r^i(e, s)` converges, together with the convergence of `ℓ^i(e, s)` that the
  lowness proof uses (`sacksSplit_requirement`). For finite injury, the higher-priority restraints
  converge by the induction hypothesis, so from some stage on they are all at most a number `r`; an
  element entering `A_i` with `x ≤ r^i(e, s)` is threatened by `(e, i)`, so it was routed by a
  higher-priority pair of the other side, and hence `x ≤ r`; once `B` has settled at and below `r`,
  no such element enters. Nonreduction and convergence of `r^i(e, s)` then follow from 8.1. There is
  in general no computable bound on `|I^i_e|` [S, p. 126], and none is assumed.

Prove lowness of both halves by the agreement-length test of [S, pp. 125–126]. Supply the probe
compiler as a reusable index construction, uniform in a bit given as data
(`lowness_probe_compiler`): a computable `g : {0, 1} × ℕ → ℕ` such that for every oracle `X` and all
`b, e, x, y`, `y` is a value of `Φ^X_{g(b,e)}` at `x` iff `x = 0`, `Φ^X_e(e)` converges, and
`y = b`. The program waits for the diagonal computation, returns `b` at input `0`, and diverges at
every positive input. For the fixed target take `b = C(0)`. The probe's agreement length on `A_i`
then settles at exactly `1` when `Φ^{A_i}_e(e)` converges, since the output at `0` agrees and the
probe diverges at `1`, and at `0` when it diverges, by the divergent first-disagreement argument of
8.1 (`sacksSplit_probe_length`). So `h_i(e, s) = 1` iff `ℓ^i(g(b, e), s) > 0` is computable, by the
computability of the agreement length, and converges to the characteristic function of the jump of
`A_i` (`sacksSplit_jump_approximation`); the Limit Lemma then gives `A_i′ ≤_T ∅′`. Conclude
`sacksSplit_spec` for the constructed halves and `sacks_splitting` [S, VII.3.2]: for c.e. `B` and
`C` with `C` not computable there are low c.e. sets `A_0`, `A_1` with `B = A_0 ∪ A_1`,
`A_0 ∩ A_1 = ∅` and `C ≰_T A_i` for `i = 0, 1`; there is no infinitude hypothesis on `B`.

The existence proof specializes the compiler to `C(0)`; it does not claim to compute that bit
uniformly from an arbitrary c.e. index for `C`. No computable operation extracts `C(0)` from a c.e.
index, even under the promise that `C` is not computable: the uniformly c.e. sets
`C_e = {2n + 1 : n ∈ K} ∪ ({0} if e ∈ K)` are all noncomputable, and `0 ∈ C_e` iff `e ∈ K`. This
rules out only that operation, not every uniform form of the lowness reductions.

Provide total computable output-index maps `f_0`, `f_1` on input enumeration indices `b`, `c`,
identified with the construction above: run on the canonical stages `W_{b,s}` and `W_{c,s}`, the
halves satisfy `W_{f_i(b,c)} = ⋃ₛ A_{i,s}` for all `b` and `c`, with no noncomputability premise, and
the stage table is computable in `(b, c, s, i)` (`sacks_splitting_uniform_indices`). Computability of
the stages for each fixed pair of approximations does not by itself give an operator on indices. The
unconditional facts are kept apart from the promised ones (`sacksSplit_W_spec`): for all `b` and `c`
the halves are disjoint with union `W_b`; when `W_c` is not computable they are low and neither
computes `W_c`. No uniform indices for the lowness reductions are promised. The canonical stages
enumerate in batches, which the per-element routing handles.
*Needs:* 8.1, 2.3; Tau Ceti `TauCeti.Enumeration.stageLimit`, `TauCeti.Enumeration.fresh`,
`TauCeti.Approximation.Converges.turingReducible_jump_empty`, `Set.Low`, `Set.jump`; Mathlib
`ComputablePred.halting_problem`.

**Checks.**
- With the inclusive test, `0` is threatened at stage `s` by the pair `(s, 0)`, whose restraint is
  `0`, so the search over `e ≤ s` always finds a pair for `x = 0`. An exclusive test `x < r` would
  leave `0` unthreatened by every pair with restraint `0`, and could send an entry exactly at a
  restraint to the protected side, injuring that requirement.
- If the probe returned `b` at input `0` without waiting for `Φ^X_e(e)`, its agreement length on
  `A_i` would eventually be at least `1` whether or not `e` is in the jump of `A_i`, and the
  approximation `h_i(e, ·)` would converge to `1` for every `e`.
- For `C_e` as above, `0 ∈ C_e` iff `e ∈ K`, and every `C_e` computes `K` through its odd part, so
  each `C_e` is noncomputable while the bit `C_e(0)` is not computable from `e`.

### 8.4 Connective corollaries

Apply the split reductions of Layer 2, not subset inclusion, to prove [S, VII.3.3–7]:

- for a c.e. set `B` that is not computable, there are low c.e. sets `A_0`, `A_1` splitting `B`,
  each Turing reducible to `B`, neither computing `B` and neither computing the other, with `B`
  Turing equivalent to `A_0 ⊕ A_1` (`low_incomparable_split`): two low incomparable c.e. degrees
  strictly below the degree of `B` whose join is the degree of `B`;
- every c.e. degree is the join of two low c.e. degrees;
- no nonzero c.e. degree is minimal;
- each c.e. degree strictly between `0` and `0′` has a c.e. degree incomparable with it.

For the last item, keep the distinction of [S, p. 125] between constructing a pair of which at least
one member works and uniformly selecting the successful half: splitting `K` while avoiding a set of
the given degree gives two halves, at least one of which is incomparable with it, and no statement
claims to choose that half uniformly. Prove `low_halves_of_K`: `K` splits into two low c.e. sets
whose join is not low, which refutes an unrestricted identity making the jump distribute over joins.
*Needs:* 8.3; Tau Ceti `Disjoint.turingReducible_union_left`, `Disjoint.turingReducible_union_right`,
`Disjoint.turingEquivalent_union_join`, `Set.not_low_jump`, `Set.join`.

### Examples

- Splitting the empty set, a singleton and an infinite computable set against a fixed noncomputable
  c.e. target: the halves of the empty set are empty, the singleton goes to one side, and the halves
  of a computable set are low.
- Splitting Tau Ceti's low simple set: both halves are low and c.e., and their join is Turing
  equivalent to the low simple set.
- Splitting `K`: both halves are low, and their join, Turing equivalent to `K`, is not low.
- Splitting relative to a target different from the set being split, for instance `B` the even
  numbers of `K` and `C = K`: neither half computes `K`.

### Dependencies

Layers 0, 1, 2 and 6. Tau Ceti: stage evaluation and use, enumeration stages, the injury calculus,
simple sets, the jump and low sets, the limit approximation of the jump, and the split reductions.
Mathlib: `REPred`, `ComputablePred`, `TuringReducible`.

## Scope and ownership

**This roadmap owns** the material of the layers above: query substitution, simultaneous
preservation, the failure of uniformity and earliest-discovery racing (Layer 0); relative c.e. and
relative computable predicates and the presentations, closure and serialization of c.e. sets not
listed below (Layer 1); padding, complement and presentation invariance, columns, least-witness
search and finite-priority selection (Layer 2); the completeness of the jump in the relative
vocabulary, the arithmetical hierarchy with its normal forms and codes, Post's theorem with
strictness, and the index sets `TOT`, `FIN`, `INF` (Layer 3); relativized moduli, the Modulus
Lemma, the converse direction of the Limit Lemma with its characteristic-function and `Δ⁰₂` forms,
and the functions of c.e. degree (Layer 4); the Kleene–Post construction (Layer 5); finite
histories, single-entry counting, labelled events, initialization and epochs (Layer 6); the original
Friedberg–Muchnik construction (Layer 7); and Soare's length of agreement for stage computations,
Lemma 1 and stabilization, cone avoidance, splitting with low halves with uniform output indices,
and the connective corollaries (Layer 8). The scope covers the set-level and degree-level
corollaries, explicit construction indices where uniformity is specified, and the examples above.

**Already in Tau Ceti**, by exact declaration name in the supplier contracts, and not planned again:

- the operational foundations of [S, I.2–3; III.1]: single-oracle programs with primitive recursive
  coding, inspection and constructors; evaluation against a partial oracle; raw runs with fuel
  recording output and use, with uniqueness, persistence, primitive recursiveness and the exact
  correspondence with evaluation; Soare's stage evaluation with its bounds; the use principle in its
  string, stage and extension forms and the zero-use case; adequacy in both directions for every
  partial oracle and the set form; the query-free translation of Mathlib's codes; the universal
  program, s-m-n with injectivity and the fixed-point theorems, all independent of the oracle; and
  the passage to a moving oracle (a genuine computation is eventually visible, a protected stage
  computation is preserved);
- the canonical binary coding of finite sets of naturals, `Finset.equivBitIndices`, the effective
  finite-set indices of [S, II.2], with primitive recursive membership, union, intersection,
  difference, bounded filtering and least element;
- enumeration stages, their limits, fresh entries and entry stages, finite-prefix stabilization,
  shifts, cofinal clocks, the presentations of c.e. sets as domains and stage unions, and
  serialization of a stage sequence of sets;
- the set oracle, the bottom degree, the parity join with its least-upper-bound property, the join of
  partial functions and the `SemilatticeSup` on `TuringDegree`, and the split reductions
  [S, VII.3.3] with a uniform program;
- the concrete jump and paired halting set with strictness, monotonicity, invariance, completeness
  and iterates, and low sets with their basic theory;
- convergence and moduli of approximations, computability from a computable modulus, the direction
  of the relativized Limit Lemma computing a limit in the jump, and the finite-use lemmas;
- computably inseparable c.e. sets, immune and simple sets, and Post's simple set;
- the injury calculus of [S, VII]: batches, events, numbers and stages, use-prefix breaches and
  boundary injuries, finiteness criteria, cause counting, effectivity, preservation, priority
  records, attention stages and stabilization by priority induction;
- the low simple set of [S, VII.1.1–2] (`TauCeti.lowSimpleSet`): its finite-injury construction with
  the requirements `N_e` turning recurrent convergence of the diagonal stage computation into true
  convergence and `P_i` making the set meet every infinite `W_i`; the restraint `r(e, s)`, the current
  use of the diagonal computation as `some` of the stage use, zero when nothing converges; the witness
  rule (the least eligible `i` and then the least `x` in `W_{i,s}` with `x > 2i` and `x > r(e, s)`
  for every `e ≤ i`); a computable stage transition with increasing stages; each `P_i` acting at most
  once; attribution of every injury of `N_e` to some `P_i` with `i < e` and `|I_e| ≤ e`; finite
  injury, preservation of convergent computations and stabilization of each restraint; the counting
  invariant `|A ∩ [0, 2n]| ≤ n` and every property of a simple set; the computable bit approximation
  of its jump, `A′ ≤_T ∅′` by the Limit Lemma and the reverse reduction, hence lowness; an index for
  it; and the degree corollary `∅ <_T A <_T ∅′`;
- the length of agreement and the agreement restraint of raw runs, with preservation and
  persistence, and one-step preservation without injury.

The acceptance file restates, on its prototypes (Convention 16), these results that Tau Ceti proves:
`oracle_eq_totalOracle`; `Code.ofNat_encode`, `Code.encode_ofNat`, `Code.eval_embed`,
`Code.run_persistent`, `Code.run_use`, `Code.run_unique`, `Code.stage_bounds`,
`Code.stage_computable`, `Code.stageAt_persistent`, `Code.stageAt_agreement`, `embed_computable`,
`recursiveIn_iff_code_total`, `recursiveIn_iff_code`, `universal_oracle_program`, `smn_uniform`,
`fixed_point_uniform_in_oracle` (Layer 0 foundations); `finiteDecode_finiteCode`,
`finiteCode_finiteDecode`, `finiteDecode_membership_computable`, `finiteCode_list_computable`,
`re_iff_finiteStages`, `serialized_ce_approximation`, `unique_entry_stage`,
`finite_prefix_stabilizes` (Layer 1 foundations); `join_le_iff` and `ce_split_reductions` (the
parity join and the split reductions); `jump_strict`, `jump_monotone`, `paired_halting_equiv`
(the jump); `computable_of_computable_modulus` and `eventually_stage_of_limit_computation`
(approximation); `exists_computablyInseparable_ce`, `simple_iff_requirements`, `exists_simple`,
`simple_not_computable` (Layer 5 foundations); `exists_low_simple` and
`exists_intermediate_ce_degree` (the low simple set and its degree); `injurySet_eq_image`,
`injuryStages_eq_image`, `injuriesAt_eq_breach_union_boundary`, `breaches_disjoint_boundary`,
`useBreachSet_subset_injurySet`, `finite_injurySet_of_eventually_bounded_restraint`,
`finite_injurySet_of_restraint_stabilizes`, `finite_useBreachSet_iff_eventually_empty`,
`mem_injuriesAt`, `injuriesAt_none`, `boundary_mem_injuriesAt`, `succ_mem_injuryStages`,
`zero_not_mem_injuryStages`, `injury_number_projection_injective`,
`finite_injurySet_iff_finite_injuryStages`, `finite_injurySet_iff_eventually_empty`,
`injuryStages_ncard_le`, `injury_membership_computable`, `injurySet_uniformly_ce`,
`injuryStages_uniformly_computable`, `injuryStages_uniformly_ce`, `injury_budget` with its
attribution sets `contributions`, `limit_agrees_of_no_fresh_below`,
`computation_preserved_by_live_restraint`, `computation_preserved_without_use_breaches` and
`all_attention_finite_of_local` (the injury calculus). Its other statements are the targets of the
layers, cited there by name.

**Mathlib** owns partial recursive functions, their codes and bounded evaluation, the c.e. and
computable predicates with the theorem that a predicate is computable iff it and its negation are
c.e., the halting problem and Rice's theorem, many-one and one-one reducibility with Mathlib's
many-one degrees, oracle-relative computability, and Turing reducibility with its degree quotient.
This roadmap states their interfaces with oracle reduction and their relative counterparts.

**Not in scope**: infinite-injury constructions, permitting and density arguments, jump inversion,
the hypersimple and hyperhypersimple hierarchy, admissible and hyperarithmetical theory, computable
model theory, Type-2 computability and algorithmic randomness. They are neither implicit
prerequisites nor targets. The generic computability and injury modules import no model theory:
effective model theory and randomness can consume their interfaces, and own none of them. A client
needing a decision procedure from c.e. complements, finite-use preservation, or effective
least-witness search obtains it from the modules here. The original Friedberg–Muchnik construction
(Layer 7) and Sacks's constructions (Layer 8) share the oracle, use and injury infrastructure
without importing one another's construction proofs. No external project is a dependency of the
delivered library: every dependency is Mathlib, Tau Ceti, or a layer above.

## Exact supplier contracts

### From Mathlib

- `Primrec`, `Primcodable`, `Computable`, `Partrec`, `Nat.Partrec`, `Partrec.rfind`, `Nat.rfind`,
  `Nat.pair`, `Nat.unpair` (`Mathlib/Computability/Primrec/`, `Mathlib/Computability/Partrec.lean`).
- `Nat.Partrec.Code` with its `Denumerable` numbering, `Nat.Partrec.Code.eval`,
  `Nat.Partrec.Code.evaln`, `Nat.Partrec.Code.curry`, and in the namespace `Nat.Partrec.Code`:
  `evaln_sound`, `evaln_complete`, `evaln_mono`, `smn`, `exists_code` (a function is partial
  recursive iff some code evaluates to it), `fixed_point` and `fixed_point₂` (the recursion theorem)
  (`Mathlib/Computability/PartrecCode.lean`).
- `ComputablePred`, `REPred`, `REPred.of_eq`, `Partrec.dom_re`, and
  `ComputablePred.computable_iff_re_compl_re'` (a predicate is computable iff it and its negation
  are c.e.) (`Mathlib/Computability/RE.lean`).
- `ComputablePred.halting_problem` (the halting set of a fixed input is not computable),
  `ComputablePred.halting_problem_re`, `ComputablePred.halting_problem_not_re` and
  `ComputablePred.rice` (`Mathlib/Computability/Halting.lean`).
- `ManyOneReducible`, `OneOneReducible`, `OneOneReducible.to_many_one`, `ManyOneEquiv`,
  `OneOneEquiv`, `ManyOneDegree`, `ComputablePred.computable_of_manyOneReducible`
  (`Mathlib/Computability/Reduce.lean`).
- `Nat.RecursiveIn`, `RecursiveIn` (a partial function between `Primcodable` types is recursive in a
  set of oracles), `ComputableIn`, `ComputableIn₂`, `RecursiveIn.iff_nat`, `Nat.RecursiveIn.subst`
  and `RecursiveIn.subst` (substitution of oracles), `RecursiveIn.partrec_of_oracle`,
  `partrec_iff_forall_recursiveIn_singleton`, `Computable.computableIn`
  (`Mathlib/Computability/RecursiveIn.lean`).
- `TuringReducible` (`f` is recursive in the single oracle `g`), `TuringEquivalent`,
  `TuringReducible.trans`, and `TuringDegree`, the antisymmetrization of `TuringReducible` on
  `ℕ →. ℕ`, with its partial order (`Mathlib/Computability/TuringDegree.lean`).
- `Finset.equivBitIndices`, the bijection between ℕ and finite sets of naturals by binary
  expansion (`Mathlib/Combinatorics/Colex.lean`); `Set.Finite`, `Set.Infinite`, `Set.ncard` (zero
  on infinite sets); `Filter.atTop`; `List.find?`; `Antisymmetrization` and `toAntisymmetrization`.

### From Tau Ceti

Paths are under `TauCeti/Computability/`. Every declaration below is proved at the pin.

- *Programs and evaluation* (`SingleOracle/Code.lean`): the program type
  `TauCeti.Oracle.Single.Code` with constructors `zero`, `succ`, `left`, `right`, `oracle`, `pair`,
  `comp`, `prec`, `rfind'`, its numbering `TauCeti.Oracle.Single.Code.encodeCode` and
  `TauCeti.Oracle.Single.Code.ofNatCode` (the `Denumerable` instance), primitive recursive
  constructors and case analysis; `TauCeti.Oracle.Single.Code.eval` (evaluation against a partial
  oracle `ℕ →. ℕ`); and, in the namespace `TauCeti.Oracle.Single.Code`: `recursiveIn_eval`,
  `exists_code` (for every partial oracle `O`, `f` is recursive in `O` iff some program evaluates
  to `f` against `O`), `exists_code_of_recursiveIn`, `turingReducible_iff_exists_code`,
  `exists_forall_eval_eq_of_partrec` (a partial recursive function has one program for every
  oracle). The query-free translation `Nat.Partrec.Code.toSingleOracleCode` is injective and
  primitive recursive, and the translated program evaluates, against every oracle, to the ordinary
  one (`toSingleOracleCode_injective` and `primrec_toSingleOracleCode` in the namespace
  `Nat.Partrec.Code`).
- *Raw runs and use* (`SingleOracle/Evaln.lean`, `SingleOracle/Primrec.lean`):
  `TauCeti.Oracle.Single.Code.Halt` (output and use), `TauCeti.Oracle.Single.Code.evaln` (a run with
  fuel `k` against answers `ℕ → Option ℕ`, which fails on inputs at or above `k`),
  `TauCeti.Oracle.Single.Code.stageUse` (the use of a successful run, `0` otherwise),
  `TauCeti.Oracle.Single.Code.setAnswers`; and in the namespace `TauCeti.Oracle.Single.Code`:
  `evaln_mono` (persistence in the fuel), `evaln_unique` (output and use do not depend on the fuel),
  `evaln_use_le` (use at most the fuel), `evaln_eq_some_of_eqOn` (the use principle: answers agreeing
  below the use give the same result), `evaln_eq_some_of_use_eq_zero`, `evaln_sound` (a run whose
  answers below its use are values of `O` gives a value of the evaluation against `O`),
  `exists_evaln_eq_some_of_mem_eval`, `mem_eval_iff_exists_evaln`,
  `mem_eval_iff_exists_evaln_range_map` (for a total oracle, a value is the output of a run against
  a finite initial string), `primrec_evaln`, `primrec_evaln_list`,
  `primrec_evaln_equivBitIndices` (runs are primitive recursive in the program, the input, the fuel
  and finite answers).
- *Stage evaluation* (`SingleOracle/Stage.lean`): `TauCeti.Oracle.Single.Code.evalStage` (Soare's
  `Φ_{e,s}`: a run with fuel `s` retained when the program index and the output are below `s`);
  and in the namespace `TauCeti.Oracle.Single.Code`: `evalStage_eq_some_iff`, `evalStage_input_lt`,
  `evalStage_index_lt`, `evalStage_output_lt`, `evalStage_use_le`, `evalStage_mono`,
  `evalStage_unique`, `evalStage_eq_some_of_eqOn` (the use principle between stages),
  `evalStage_sound`, `exists_eventually_evalStage_eq_some_of_mem_eval`,
  `mem_eval_iff_exists_evalStage`, `primrec_evalStage`.
- *Uniform index maps* (`SingleOracle/Universal.lean`, `SingleOracle/Recursion.lean`):
  `TauCeti.Oracle.Single.Code.universal` with its evaluation equation, one universal program for
  every total oracle; `TauCeti.Oracle.Single.Code.curry` (s-m-n), primitive recursive and injective
  (`primrec₂_curry`, `curry_inj` in the namespace `TauCeti.Oracle.Single.Code`), with its evaluation
  equation for every oracle; `TauCeti.Oracle.Single.Code.fixedPoint` and
  `TauCeti.Oracle.Single.Code.fixedPointParam` with their evaluation equations, and in the namespace
  `TauCeti.Oracle.Single.Code`: `fixed_point` and `fixed_point_param` (the recursion theorem,
  parameterized, uniform in every total oracle).
- *Moving oracles* (`SingleOracle/Limit.lean`), in the namespace `TauCeti.Oracle.Single.Code`:
  `eventually_evaln_eq_some_of_converges`, `exists_eventually_evaln_eq_some_of_mem_eval`,
  `converges_setAnswers_stageLimit`, `exists_eventually_evaln_setAnswers_eq_some_of_mem_eval` (a
  genuine computation against the limit of increasing stages is eventually a stage computation),
  `evaln_setAnswers_eq_some_of_forall_notMem_fresh` and
  `evaln_setAnswers_stageLimit_eq_some_of_forall_notMem_fresh` (a stage computation is preserved
  when nothing below its use enters later).
- *Length of agreement* (`SingleOracle/Agreement.lean`): `TauCeti.Oracle.Single.Code.AgreesAt`,
  `TauCeti.Oracle.Single.Code.agreementLength`, `TauCeti.Oracle.Single.Code.agreementRestraint`
  for raw runs with fuel against a target function; in the namespace `TauCeti.Oracle.Single.Code`:
  `le_agreementLength_iff`, `not_agreesAt_of_le`, `use_le_agreementRestraint`,
  `evaln_eq_some_of_eqOn_agreementRestraint` (preservation of computations at arguments up to and
  including the length under a change of answers above the restraint) and
  `evaln_eq_some_of_forall_Ico` (persistence over an interval).
- *Finite data* (`Primrec/FiniteSet.lean`, `Primrec/Bitwise.lean`, `Primrec/List.lean`, `RE.lean`,
  `RecursiveIn.lean`): `Primrec.mem_equivBitIndices`, `Primrec.nat_filterBitIndices`,
  `Primrec.equivBitIndices_symm_toFinset`, `Primrec.equivBitIndices_symm_range`,
  `Primrec.nat_leastBitIndex`, `Primrec.nat_lor`, `Primrec.nat_land`, `Primrec.nat_ldiff`,
  `Primrec.nat_testBit`, `Primrec.list_find?`; `ComputablePred.and`, `ComputablePred.exists_lt`,
  `ComputablePred.rePred_exists`; `Nat.RecursiveIn.cond`, `Nat.RecursiveIn.rfind'`,
  `ComputableIn₂.iff_nat`.
- *Enumeration stages* (`Enumeration/Stage.lean`, `Enumeration/Code.lean`,
  `Enumeration/Domain.lean`, `Enumeration/Serialization.lean`, `Enumeration/Converges.lean`):
  `TauCeti.Enumeration.fresh`, `TauCeti.Enumeration.stageLimit`, `TauCeti.Enumeration.mem_fresh`,
  `TauCeti.Enumeration.mem_stageLimit`, `TauCeti.Enumeration.mem_stageLimit_iff_eventually`,
  `TauCeti.Enumeration.unique_entry_stage` (monotone stages), `TauCeti.Enumeration.finite_prefix_stabilizes`,
  `TauCeti.Enumeration.stageLimit_shift`, `TauCeti.Enumeration.stageLimit_comp_of_cofinal`,
  `TauCeti.Enumeration.agrees_of_no_fresh_below`, `TauCeti.Enumeration.limit_agrees_of_no_fresh_below`;
  `Nat.Partrec.Code.domStage` (the stages of the domain of an ordinary program);
  `TauCeti.Enumeration.rePred_mem_stageLimit`, `TauCeti.Enumeration.rePred_iff_exists_stages` (a
  predicate is c.e. iff it is the limit of monotone stages, empty at stage `0`, with computable
  canonical codes), `TauCeti.Enumeration.rePred_iff_exists_code`;
  `TauCeti.Enumeration.serializedStage` with `TauCeti.Enumeration.card_fresh_serializedStage_le_one`,
  `TauCeti.Enumeration.stageLimit_serializedStage`, `TauCeti.Enumeration.serializedStage_subset`,
  `TauCeti.Enumeration.subset_serializedStage`, `TauCeti.Enumeration.computable_serializedStage`,
  `TauCeti.Enumeration.computable_serializedStage_domStage`,
  `TauCeti.Enumeration.rePred_iff_exists_serialized_stages`;
  `TauCeti.Enumeration.converges_indicator_stageLimit`.
- *Set oracles, joins and splits* (`TuringDegree.lean`, `Join.lean`, `Split.lean`): `Set.oracle`,
  `Set.partrec_oracle_iff`, `Set.empty_turingReducible`, `Set.turingReducible_empty_iff` (the
  computable sets are the bottom degree), `Set.union_turingReducible`,
  `ManyOneReducible.turingReducible_oracle`, `TauCeti.turingDegree_le_iff`; `PFun.turingJoin`,
  `PFun.turingJoin_turingReducible_iff`, `TuringReducible.turingJoin_left`,
  `TuringReducible.turingJoin_right`, the instance `TuringDegree.instSemilatticeSup` with
  `TuringDegree.toAntisymmetrization_sup_toAntisymmetrization`, `Set.turingJoin` (the same parity
  join as `Set.join`) with `Set.oracle_turingJoin_turingEquivalent`; `Set.join`, `Set.mem_join`,
  `Set.oneOneReducible_join_left`, `Set.oneOneReducible_join_right`, `Set.join_turingReducible_iff`,
  `Set.isLUB_degree_join`; `Disjoint.turingReducible_union_left`,
  `Disjoint.turingReducible_union_right`, `Disjoint.turingEquivalent_union_join` (for disjoint c.e.
  `A_0`, `A_1`: each reduces to the union, which is equivalent to their join), and
  `Nat.Partrec.Code.splitProgram`, a primitive recursive program computing the first half from the
  union for every disjoint pair of ordinary programs.
- *The jump and low sets* (`Jump/Basic.lean`, `Jump/Iterate.lean`, `Jump/Low.lean`): `Set.jump`,
  `Set.pairedJump`, `Set.mem_jump`, `Set.pair_mem_pairedJump`, `Set.turingReducible_jump`,
  `Set.not_jump_turingReducible`, `Set.turingReducible_jump_jump`,
  `Set.turingEquivalent_jump_jump`, `Set.oneOneEquiv_jump_pairedJump`,
  `Set.turingEquivalent_jump_pairedJump`, `Set.oneOneReducible_jump_of_recursiveIn`,
  `Set.turingReducible_jump_of_recursiveIn`; `Set.turingReducible_iterate_jump_of_le`,
  `Set.not_iterate_jump_turingReducible_of_lt`, `Set.strictMono_degree_iterate_jump`,
  `Set.turingEquivalent_iterate_jump_iterate_jump`; `Set.Low` (the jump is Turing equivalent to
  `∅′`), `Set.low_congr`, `Set.low_of_computablePred`, `Set.low_empty`, `Set.not_low_jump`, and the
  facts that a set reducible to a low set is low and that a low set does not compute `∅′`.
- *Approximation* (`Approximation/Modulus.lean`, `Approximation/Limit.lean`):
  `TauCeti.Approximation.Converges` (for every argument, eventually equal to the limit),
  `TauCeti.Approximation.IsModulus` (from the modulus on, equal to the limit),
  `TauCeti.Approximation.converges_iff_exists_isModulus`,
  `TauCeti.Approximation.converges_shift_iff`, `TauCeti.Approximation.computable_iff_exists_isModulus`
  (a function is computable iff it has a computable approximation with a computable modulus), the
  aggregation, shift, reindexing and computability lemmas in the namespaces
  `TauCeti.Approximation.Converges` and `TauCeti.Approximation.IsModulus`;
  `TauCeti.Approximation.Converges.computableIn_jump` (a limit of an approximation computable in `Z`
  is computable in `Z′`), `TauCeti.Approximation.Converges.turingReducible_jump`,
  `TauCeti.Approximation.Converges.turingReducible_jump_empty`.
- *Inseparable and simple sets* (`Inseparable.lean`, `Simple/Basic.lean`, `Simple/Post.lean`):
  `Set.ComputablyInseparable` (disjoint, and every computable superset of the first meets the
  second); `TauCeti.diagonalFiber`, `TauCeti.computablyInseparable_diagonalFiber`,
  `TauCeti.rePred_mem_diagonalFiber`, `TauCeti.diagonalFiberCode`,
  `TauCeti.computable_diagonalFiberCode`, `TauCeti.exists_computablyInseparable_rePred`;
  `Set.Immune` (infinite, containing no infinite c.e. set), `Set.Simple` (c.e. with immune
  complement), `Set.simple_iff_forall_code`, and the facts that a simple set has infinite
  complement, meets every infinite c.e. set and is not computable; `TauCeti.postSimpleSet`,
  `TauCeti.postWitness`, `TauCeti.rePred_mem_postSimpleSet`,
  `TauCeti.ncard_postSimpleSet_inter_Iic_le`, `TauCeti.infinite_compl_postSimpleSet`,
  `TauCeti.simple_postSimpleSet`.
- *The low simple set* (`Simple/Low.lean`, `Simple/Lowness.lean`): `TauCeti.lowSimpleSet`,
  `TauCeti.lowSimpleSet_eq_stageLimit`, `TauCeti.rePred_mem_lowSimpleSet`,
  `TauCeti.ncard_lowSimpleSet_inter_Iic_le`, `TauCeti.infinite_compl_lowSimpleSet`,
  `TauCeti.simple_lowSimpleSet`, `TauCeti.low_lowSimpleSet`, `TauCeti.degree_lowSimpleSet_mem_Ioo`,
  `TauCeti.exists_simple_low_code`; the construction `TauCeti.LowSimple.stage`,
  `TauCeti.LowSimple.restraint`, `TauCeti.LowSimple.requiresAttention_iff`,
  `TauCeti.LowSimple.primrec_stage`, `TauCeti.LowSimple.subsingleton_enumeratedBy`,
  `TauCeti.LowSimple.exists_lt_of_mem_injuriesAt`, `TauCeti.LowSimple.finite_injurySet_and_ncard_le`,
  `TauCeti.LowSimple.diagRun_succ_eq_some`, `TauCeti.LowSimple.exists_eventually_restraint_eq`,
  `TauCeti.LowSimple.jumpApproximation`, `TauCeti.LowSimple.converges_jumpApproximation`.
- *The injury calculus* (`Priority/Injury/Basic.lean`, `Priority/Injury/Causes.lean`,
  `Priority/Injury/Computable.lean`, `Priority/Breach.lean`, `Priority/Preservation.lean`,
  `Priority/Agreement.lean`): `TauCeti.Priority.injuriesAt`, `TauCeti.Priority.injuryEvents`,
  `TauCeti.Priority.injurySet`, `TauCeti.Priority.injuryStages`, `TauCeti.Priority.mem_injuriesAt`,
  `TauCeti.Priority.injurySet_eq_image`, `TauCeti.Priority.injuryStages_eq_image`,
  `TauCeti.Priority.injOn_snd_injuryEvents`, `TauCeti.Priority.finite_injurySet_iff_finite_injuryStages`,
  `TauCeti.Priority.finite_injuryStages_iff_eventually_eq_empty`,
  `TauCeti.Priority.finite_injurySet_iff_eventually_eq_empty`,
  `TauCeti.Priority.finite_injurySet_of_eventually_bounded`,
  `TauCeti.Priority.exists_forall_injuriesAt_eq_empty_of_eventually_bounded`,
  `TauCeti.Priority.ncard_injuryStages_le`; `TauCeti.Priority.finite_injurySet_and_ncard_le_sum_of_causes`
  and `TauCeti.Priority.finite_injurySet_and_ncard_le_of_subsingleton_causes`;
  `TauCeti.Priority.computablePred_mem_injuryEvents`, `TauCeti.Priority.computablePred_mem_injuryStages`,
  `TauCeti.Priority.rePred_mem_injurySet`; `TauCeti.Priority.usePrefixRestraint`,
  `TauCeti.Priority.mem_injuriesAt_usePrefixRestraint`, `TauCeti.Priority.boundaryInjuriesAt`,
  `TauCeti.Priority.injuriesAt_usePrefixRestraint_union_boundaryInjuriesAt`,
  `TauCeti.Priority.disjoint_injuriesAt_usePrefixRestraint_boundaryInjuriesAt`,
  `TauCeti.Priority.finite_injurySet_usePrefixRestraint_of_finite_injurySet`; in the namespace
  `TauCeti.Oracle.Single.Code`: `evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty` and
  `evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_usePrefixRestraint_eq_empty` (preservation in
  the limit under a live covering restraint), and `evaln_succ_eq_some_of_injuriesAt_eq_empty` with
  its companion for agreement in `Priority/Agreement.lean` (one-step preservation of computations,
  and of agreement where the target does not change, when no injury occurs).
- *Priority records* (`Priority/Records.lean`): `TauCeti.Priority.Update`,
  `TauCeti.Priority.Update.apply`, `TauCeti.Priority.Update.take_apply_of_le` (locality),
  `TauCeti.Priority.Update.getElem?_apply_of_gt` (reset), `TauCeti.Priority.run`,
  `TauCeti.Priority.attentionStages`, `TauCeti.Priority.finite_attentionStages_of_local`,
  `TauCeti.Priority.exists_forall_getElem?_run_eq_of_local`.

## References

- **[S]** R. I. Soare, *Recursively Enumerable Sets and Degrees: A Study of Computable Functions and
  Computably Generated Sets*, Perspectives in Mathematical Logic, Springer, 1987. Locators are to
  chapter and section numbers and to printed pages. The scope is drawn from Chapters I–IV, V.1,
  VI.1 and VII.1–3, and does not cover every result of those chapters.
- E. Park, single-oracle codes, evaluation, reducibility and the jump, Mathlib pull request
  https://github.com/leanprover-community/mathlib4/pull/38973. Its single-oracle code and evaluation
  interface is the design that Tau Ceti's single-oracle programs follow; its auxiliary tactics and
  duplicate convenience predicates are not prescribed here.
- T. Duve, the Turing join of partial functions and the semilattice structure on Turing degrees,
  Mathlib pull request https://github.com/leanprover-community/mathlib4/pull/37062. Its join of
  partial functions, splitting both input and output by parity, with its least-upper-bound lemmas
  and the `SemilatticeSup` instance on `TuringDegree`, is the shape of Tau Ceti's; it also changes
  the unfolding of `TuringReducible f g` to `Nat.RecursiveIn {g} f`.

The following sources inform implementations, not the mathematical specification; their
declarations and proofs, not their descriptions of themselves, determine what they supply. Their
code is integrated under the repository's rules for porting existing work, with the authors'
agreement or after checking the licence and discussing the integration on the Lean Zulip, and cited
at its actual source; a provenance link is not evidence of consent. Independent developments of the
same mathematics cite the overlapping work.

| Pinned source | Material to compare or adapt | Integration work |
| --- | --- | --- |
| C. Freer, [computable-model-theory at `a1fe761`](https://github.com/cameronfreer/computable-model-theory/tree/a1fe76155a98f03933f7de0811e03b2473dd2e21/ComputableModelTheory/Computability) | `Computability/OraclePred`, `RecursiveIn`, `Jump`, `StagedPartial`, `StagedRace`, `FiniteInjury` | Extract only the generic layers; construct the actual relative jump and staged representation; keep the distinction between injury sets and a record-reset kernel |
| A. Aslyan, [friedberg-muchnik-lean at `d5b3463`](https://github.com/aaslyan/friedberg-muchnik-lean/tree/d5b34637724cdcb55c7fc20be4c89ac60fec4954) | `OracleComputability` code, use and bridge modules; the original Friedberg–Muchnik construction; splitting with nonreducibility | Harmonize codes and predicates, complete the positive and negative semantic bridges, and establish the low-half strengthening of [S, VII.3.2] |
| [Single-oracle Mathlib proposal at `302800b`](https://github.com/hyeoniuwu/mathlib4/tree/302800b4882ddd8037580014ffa89a824639ce09/Mathlib/Computability/SingleOracle) | Single-oracle codes, evaluation, reducibility, the jump and `SingleReducibleIff`, taken from the core of CiL | Coordinate shape and remove duplicate ordinary interfaces; add the stage, use and finite-injury interfaces asked for here |
| E. Park, [CiL at `3f44ae2`](https://github.com/hyeoniuwu/CiL/tree/3f44ae202755cd7185a53714eafa6c91e7ed871f/Computability) | The same single-oracle core, with set oracles and their jump (`Set_lt_SetJump`, `CEIn_deg`), the use principle (`Use/Principle.lean`), a simple set (`exists_simple_set`) and the Kleene–Post pair below `∅′` (`ex_incomparable_sets_below_j1` in `Constructions/KP54.lean`), all proved; at this commit `LowSimple.lean` begins a low simple construction with no lowness statement, and `Post.lean` is commented out | CiL has its own `Code`, `RecursiveIn`, reducibility and degrees, bridged to Mathlib only by `SingleReducibleIff`; its codes connect to `Nat.Partrec.Code` and its degrees to Mathlib's `TuringDegree`. Its use principle can serve Layer 0, its jump results Layer 3, and its simple set and Kleene–Post proofs Layer 5 |

A successful port of a source is not a reason to relax the statement of a target or to omit its
computability, degree or injury-interface consequences.

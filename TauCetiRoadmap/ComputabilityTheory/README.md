# Roadmap: computability theory and finite-injury constructions

**Summary.** This roadmap develops classical computability theory on sets of natural numbers as far
as the finite-injury priority method, with Soare's *Recursively Enumerable Sets and Degrees* as its
main reference.
Its objects are oracle computations with their finite uses, computably enumerable (c.e.) sets with
their stage-by-stage enumerations, Turing reducibility, the Turing jump and the arithmetical
hierarchy, limit approximations with their moduli, and the bookkeeping of priority constructions:
restraints, the numbers that injure a requirement, and the stages at which they enter. Every set is
a set of natural numbers, used as an oracle through its total characteristic function, so that every
query is answered and the answer outside the set is no. A set is low when its jump is Turing
equivalent to ∅′, the jump of the empty set.

The headline theorems are these.

- *Low simple set.* There is a simple c.e. set A, built by finite injury, whose jump is Turing
  equivalent to ∅′; its degree lies strictly between the computable sets and ∅′.
- *Friedberg–Muchnik.* There are c.e. sets A and B, neither Turing reducible to the other, built by
  the original witness-and-restraint construction; both lie strictly between the computable sets
  and ∅′.
- *Sacks splitting with low halves.* If B and C are c.e. sets and C is not computable, then B is
  the union of two disjoint low c.e. sets, neither of which computes C. B need not be infinite.
  Sacks's cone avoidance belongs to the same method: if C is a noncomputable c.e. set, some simple
  set does not compute C.
- *Post's theorem and the Limit Lemma, relativized.* For every set Z and every n, a set is Σ⁰ₙ₊₁
  relative to Z exactly when it is c.e. relative to the n-th jump Z⁽ⁿ⁾, and Δ⁰ₙ₊₁ relative to Z
  exactly when it is computable from Z⁽ⁿ⁾; a total function ℕ → ℕ is computable from Z′ exactly
  when it is the pointwise eventually constant limit of a sequence of total functions uniformly
  computable from Z.

The splitting theorem gives the classical corollaries on c.e. degrees: every c.e. degree is the
join of two low c.e. degrees, no nonzero c.e. degree is minimal, and every nonzero incomplete c.e.
degree has an incomparable c.e. degree. The Kleene–Post construction, which builds incomparable sets
below ∅′ with the help of an oracle, is the comparison case.

The roadmap builds on Mathlib, which supplies partial recursive functions and their codes,
computable and c.e. predicates, oracle-relative computability, and Turing degrees as a quotient of
partial functions, which a set enters through its characteristic function. Its own material is
implemented in Tau Ceti's computability library, and every item realised there names the
declarations that realise it. No other roadmap supplies or consumes this one.

L0 below builds oracle programs with their uses, the use principle and the adequacy of the programs
for Mathlib's oracle computability; L1 c.e. sets and their enumerations; L2 numberings, reducibility
of sets, joins, splittings and effective searches; L3 the jump and low sets, the arithmetical
hierarchy, Post's theorem and index sets; L4 moduli and the Modulus and Limit Lemmas; L5 computably
inseparable and simple sets and the Kleene–Post construction; L6 the injury calculus of priority
arguments. L7, L8 and L9 are Soare's three finite-injury constructions: the low simple set, the
original Friedberg–Muchnik construction, and the length-of-agreement method with cone avoidance,
splitting with low halves and its corollaries.

## How to read the build

Each layer is identified by its label `L0`, …, `L9`, and its numbered sections `k.n` are its
targets, cited as `Lk.n`. Each target's *Needs:* line lists what its statement and its route use,
item by item, so that a target proved another way is not held behind an unrelated one. An item
realised in Tau Ceti ends with an *In Tau Ceti:* line naming the declarations that realise it. The
layers are numbered in build order, but many of them are independent of each other.

- L0 uses Mathlib only; L1 uses L0 only for its relative forms; L2 uses L0 and L1.
- L3.1 uses L0 to L2, and L3.2 uses L3.1. L4 uses L0, L1 and L3.1, and L3.2 only for the Δ⁰₂ form
  of the Limit Lemma.
- L5 uses L0 to L2, and L3.1 for the Kleene–Post construction. L6 is set-theoretic: its injury
  objects need no oracle evaluation, and only the preservation statements use L0 and L1.
- L7 uses L0, L1, L3.1, L4, L5 and L6. L8 uses L0 to L2 and L6, and L3.1 for its degree corollary.
  L9 uses L0, L1 and L6; L5 for cone avoidance (L9.2); and L2, L3.1 and L4 for splitting with low
  halves and its corollaries.

The arithmetical hierarchy (L3.2) and the Kleene–Post construction (L5.3) are required results, but
no priority construction depends on them, so they are developed alongside L7 to L9. L7, L8 and L9
are independent of one another; the examples of L9 that use the low simple set of L7 live in a
separate examples module.

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
   machine model not connected to Mathlib's oracle computability by the adequacy theorems of L0.2,
   does not discharge a construction target.
4. **Numbers, strings and oracles.** Numbers, program indices, arguments, witnesses and stages lie
   in ℕ. A finite string is an initial segment of answers, not a finite set of positive answers. A
   finite set `A_s` used as an oracle answers no outside `A_s`; a finite string answers neither yes
   nor no beyond its length. Oracle answers are a function `ℕ → Option ℕ` with `none` meaning
   unanswered, and the answers of a set `A` are `TauCeti.Oracle.Single.Code.setAnswers A`. The
   oracle of a set `A` is `Set.oracle A`, its characteristic function `A.indicator 1` as a total
   partial function. Reductions of sets are reductions of these oracles: `A ≤_T B` means
   `TuringReducible A.oracle B.oracle`, and `A ≡_T B` means `TuringEquivalent A.oracle B.oracle`.
5. **Numberings.** `φ_e` is the ordinary partial computable function with index `e` and `Φ^Z_e` its
   counterpart relative to the oracle `Z`. The fixed acceptable numbering is the numbering of the
   single-oracle programs of L0.1, `TauCeti.Oracle.Single.Code` with its `Denumerable` instance:
   `Φ^Z_e` is `TauCeti.Oracle.Single.Code.eval Z.oracle` applied to program number `e`. Ordinary
   programs are Mathlib's `Nat.Partrec.Code`, numbered by their `Denumerable` instance, and enter
   the oracle numbering through the query-free translation `Nat.Partrec.Code.toSingleOracleCode`.
   Numeric equality of different numberings is not a target.
6. **Halting sets.** `W_e` is the domain of `φ_e` and `W^Z_e` that of `Φ^Z_e`. The jump
   `K^Z = {e : Φ^Z_e(e)↓} = Z′` is `Set.jump`, and the paired halting set
   `K^Z_0 = {⟨x, e⟩ : x ∈ W^Z_e}` is `Set.pairedJump`; the order of its coordinates, input first and
   index second, is deliberate. `K` is `∅′`, and the iterates `Z⁽ⁿ⁾` are `Set.jump^[n] Z`.
7. **Pairing, columns, join.** Pairs are Mathlib's `Nat.pair`. Soare's columns are
   `ω^[e] = {⟨x, e⟩ : x ∈ ℕ}`. The binary join is the parity join
   `A ⊕ B = {2x : x ∈ A} ∪ {2x + 1 : x ∈ B}`, `Set.join`.
8. **Stages.** `A_s` is the finite content at the *end* of stage `s`, so `ΔA_s = A_{s+1} ∖ A_s`
   (`TauCeti.Enumeration.fresh A s`) consists of the entries made at stage `s + 1`. A restraint read
   when those entries are selected is `r(e, s)`, not `r(e, s + 1)`. The limit `⋃ₛ A_s` is
   `TauCeti.Enumeration.stageLimit A`. The stages of a constructed c.e. set increase and start empty.
9. **Bounded evaluation.** Stage computations follow [S, III.1.7]: `Φ^Z_{e,s}(x)↓ = y` implies
   `e, x, y < s` and use at most `s`. For a fixed oracle, convergence, output and the recorded use
   persist as the stage grows, and stage zero has no convergent computation. There are raw runs
   with fuel, `TauCeti.Oracle.Single.Code.evaln`, which bound the input and the use, and Soare's
   stage evaluation `TauCeti.Oracle.Single.Code.evalStage`, which adds the bounds on the index and
   the output (L0.1). The two are different interfaces, and statements say which they use.
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
    restraint (`TauCeti.Priority.injurySet`, L6.1). The injury-stage set, the stages `s + 1` at
    which at least one such number enters, and the event relation, which keeps both `s` and `x`,
    are separate objects. Initialization, attention and witness changes are other sets, not
    definitions of `I_e`. The use prefix `[0, u)` of a computation and the protected interval
    `[0, r]` of a restraint stay distinct: an entry at `x = u = r` is an injury although it cannot
    invalidate that computation. This conservative boundary injury is part of the definition; the
    use-prefix breaches, entries strictly below an active restraint, are a separate object.
16. **The acceptance file.** `Suggested.lean` imports Mathlib and the Tau Ceti modules it uses, and
    states the headline theorems on Tau Ceti's carriers: `Set.oracle`, `Set.jump` and its iterates,
    `Set.Low`, `Set.Simple`, `Set.join`, `TauCeti.Approximation.Converges` and
    `TauCeti.Approximation.IsModulus`, the enumeration stages of `TauCeti.Enumeration` with the
    canonical stages `Nat.Partrec.Code.domStage`, the stage evaluation
    `TauCeti.Oracle.Single.Code.evalStage` against `TauCeti.Oracle.Single.Code.setAnswers`, and
    `TauCeti.Priority.injurySet`. Its own definitions are those the statements need: the relative
    notions of L1.1, the pointclasses of L3.2 and the stage machine of Sacks splitting (L9.1, L9.3).
    A headline theorem that the pinned Tau Ceti proves, the low simple set of L7, is not restated
    there. The other targets of the layers are stated in this README only. This README is the
    specification: proving every statement of the acceptance file neither completes a layer nor
    completes the roadmap.
17. **Placement.** Implementations sit under `TauCeti/Computability/` by subject, not by source
    project: `SingleOracle/` (programs, bounded evaluation, use, adequacy), `Enumeration/` (c.e.
    stages, serialization, indices), `Jump/` (the concrete jump, iterates, relative forms),
    `Hierarchy/` (normal forms, Post's theorem, index sets), `Approximation/` (moduli and limit
    lemmas), `Priority/` (entry and injury sets, causes, epochs, induction), `Simple/` (positive and
    low simple constructions), `FriedbergMuchnik/`, `SacksSplitting/`, and `Examples/`
    (cross-client consequences and counterexamples).

## L0: Operational oracle computation and the use principle

This layer is the operational theory of oracle computation of [S, I.2–3; III.1, especially
III.1.7–9]: numbered programs with a query instruction, their bounded runs recording output and use,
the use principle, adequacy of the programs for Mathlib's oracle computability in both directions,
the uniform index maps, and the passage from a fixed oracle to a moving one.

### 0.1 Codes and evaluation (L0.1)

Ground the effectivity of the finite data first. Supply primitive recursive encodings and basic
operations for the lists, options, finite sets of numbers, tuples and finite records used by the
constructions, reusing Mathlib's `Primcodable` instances where they exist. A finite set `D ⊆ ℕ` is
coded by the number `∑_{x ∈ D} 2^x` (Mathlib's bijection `Finset.equivBitIndices`), which gives the
effective finite-set indices of [S, II.2]; coding and decoding are mutually inverse, as for any
bijection. Prove that membership `x ∈ D` is primitive recursive in the code and `x`; that union,
intersection and difference of codes are primitive recursive (binary or, and, and-not); that
bounded filtering of a code by a primitive recursive predicate and the least element of a code are
primitive recursive; and that the code of the set of entries of a list, and the code of
`{0, …, n − 1}`, are primitive recursive. Computability is stated on the numeric codes;
no `Primcodable (Finset ℕ)` instance is assumed.
*In Tau Ceti:* `Primrec.mem_equivBitIndices`, `Primrec.nat_testBit`, `Primrec.nat_lor`,
`Primrec.nat_land`, `Primrec.nat_ldiff`, `Primrec.nat_filterBitIndices`, `Primrec.nat_leastBitIndex`,
`Primrec.equivBitIndices_symm_toFinset`, `Primrec.equivBitIndices_symm_range`.

Define a numbered type of oracle programs: the constructors of Mathlib's `Nat.Partrec.Code`
(`zero`, `succ`, `left`, `right`, `pair`, `comp`, `prec`, `rfind'`) together with a query
instruction `oracle`, which on input `z` returns the oracle's answer at `z`. Define the partial
function `eval O c` computed by a program `c` relative to an arbitrary partial oracle
`O : ℕ →. ℕ`; total natural-valued oracles, and set oracles as their 0/1-valued case, are special
cases. Finite oracle answers are a separate object, a function `σ : ℕ → Option ℕ` with `none`
meaning unanswered. Define the raw run of `c` on input `n` with fuel `k` against answers `σ`: it
fails (`none`) or succeeds with a result recording the output and the use, the use being one plus
the largest queried address, or `0` when no query is made. The stage use is the use of a successful
run and `0` otherwise.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code`, `TauCeti.Oracle.Single.Code.encodeCode`,
`TauCeti.Oracle.Single.Code.ofNatCode`, `TauCeti.Oracle.Single.Code.eval`,
`TauCeti.Oracle.Single.Code.Halt`, `TauCeti.Oracle.Single.Code.evaln`,
`TauCeti.Oracle.Single.Code.stageUse`, `TauCeti.Oracle.Single.Code.setAnswers`.

Build the coding and the computational proofs, rather than taking an evaluator's correctness,
universality or stage approximability as unexplained fields. Prove:

- the numbering of programs is a bijection with ℕ, the constructors are primitive recursive on
  program numbers, the components of a compound program have smaller numbers than the program, and
  case analysis on programs is primitive recursive;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.encodeCode_ofNatCode`,
  `TauCeti.Oracle.Single.Code.ofNatCode_encodeCode`, `TauCeti.Oracle.Single.Code.primrec₂_pair`,
  `TauCeti.Oracle.Single.Code.primrec₂_comp`, `TauCeti.Oracle.Single.Code.primrec₂_prec`,
  `TauCeti.Oracle.Single.Code.primrec_rfind'`, `TauCeti.Oracle.Single.Code.encode_lt_pair`,
  `TauCeti.Oracle.Single.Code.encode_lt_comp`, `TauCeti.Oracle.Single.Code.encode_lt_prec`,
  `TauCeti.Oracle.Single.Code.encode_lt_rfind'`, `TauCeti.Oracle.Single.Code.primrec_casesOn`.
- the raw run is primitive recursive in the program, the input, the fuel and finite answers, given
  as a primitive recursive family, as a list (a finite string) or as the code of a finite set
  answering `1` on it and `0` outside it;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.primrec_evaln`,
  `TauCeti.Oracle.Single.Code.primrec_evaln_list`,
  `TauCeti.Oracle.Single.Code.primrec_evaln_equivBitIndices`.
- the exact correspondence between finite successful runs and evaluation: if a run against `σ`
  succeeds and every answer of `σ` below its use is a value of `O`, its output is a value of
  `eval O c n` (answers at or above the use are not read); if `σ` gives every value of `O`, every
  value of `eval O c n` is the output of a successful run against `σ`; so when `σ` gives exactly
  the values of `O`, `y ∈ eval O c n` iff some run against `σ` succeeds with output `y`; and for a
  total oracle `O`, `y ∈ eval O c n` iff for some `k` the run with fuel `k` against the finite
  string `O 0, …, O (k − 1)` succeeds with output `y`;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.evaln_sound`,
  `TauCeti.Oracle.Single.Code.exists_evaln_eq_some_of_mem_eval`,
  `TauCeti.Oracle.Single.Code.mem_eval_iff_exists_evaln`,
  `TauCeti.Oracle.Single.Code.mem_eval_iff_exists_evaln_range_map`.
- uniqueness and stability of output *and* use: a successful run persists, with the same output and
  use, at every larger fuel; two successful runs of a program on an input, at any two fuels, have
  the same output and use; a successful run with fuel `k` has input below `k` and use at most `k`,
  so a run fails on every input at or above its fuel, and the stage use at fuel `k` is at most `k`;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.evaln_mono`, `TauCeti.Oracle.Single.Code.evaln_unique`,
  `TauCeti.Oracle.Single.Code.evaln_bound`, `TauCeti.Oracle.Single.Code.evaln_eq_none_of_le`,
  `TauCeti.Oracle.Single.Code.evaln_use_le`, `TauCeti.Oracle.Single.Code.stageUse_le`.
- the comparison of raw fuel with Soare's stages: Soare's stage evaluation `Φ^σ_{e,s}` keeps the raw
  run with fuel `s` of program `e` exactly when the program index and the output are below `s`; a
  successful stage computation has index, input and output below `s` and use at most `s`, stage
  zero has none, and a program whose index is at least `s` has none at stage `s`; stage
  computations persist with the same output and use, and two of them on the same input agree; a
  successful raw run with fuel `k` is a stage computation, with the same output and use, at every
  stage `s ≥ k` above its index and output; and stage evaluation is primitive recursive in finite
  answers given as a list or as the code of a finite set;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.evalStage`,
  `TauCeti.Oracle.Single.Code.evalStage_eq_some_iff`, `TauCeti.Oracle.Single.Code.evalStage_zero`,
  `TauCeti.Oracle.Single.Code.evalStage_eq_none_of_le_encode`,
  `TauCeti.Oracle.Single.Code.evalStage_index_lt`, `TauCeti.Oracle.Single.Code.evalStage_input_lt`,
  `TauCeti.Oracle.Single.Code.evalStage_output_lt`, `TauCeti.Oracle.Single.Code.evalStage_use_le`,
  `TauCeti.Oracle.Single.Code.evalStage_mono`, `TauCeti.Oracle.Single.Code.evalStage_unique`,
  `TauCeti.Oracle.Single.Code.evalStage_eq_some_of_evaln`,
  `TauCeti.Oracle.Single.Code.evalStage_max_eq_some`,
  `TauCeti.Oracle.Single.Code.exists_forall_evalStage_eq_some`,
  `TauCeti.Oracle.Single.Code.primrec_evalStage`,
  `TauCeti.Oracle.Single.Code.primrec_evalStage_list`,
  `TauCeti.Oracle.Single.Code.primrec_evalStage_equivBitIndices`.
- the query-free translation of Mathlib's ordinary codes: an injective primitive recursive map
  `Nat.Partrec.Code → TauCeti.Oracle.Single.Code` whose image makes no query and such that, against
  every oracle, the translated program computes the same partial function as the ordinary code.
  *In Tau Ceti:* `Nat.Partrec.Code.toSingleOracleCode`,
  `Nat.Partrec.Code.toSingleOracleCode_injective`, `Nat.Partrec.Code.primrec_toSingleOracleCode`,
  `TauCeti.Oracle.Single.Code.eval_toSingleOracleCode`.

A finite snapshot distinguishes an unanswered query from an answer of zero, and both branches of a
successful query, the negative answer included, are represented: a query at `z` with fuel `k + 1`
succeeds exactly when `z ≤ k` and `σ z = some y` for some `y`, and then its output is `y` and its
use `z + 1`; against `σ z = none` it fails.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.evaln_succ_oracle_eq_some`.

### 0.2 Use, substitution and representation (L0.2)

Prove the finite-string use principle in all three forms. Extraction: for a total oracle `O`, a
value of `eval O c n` is the output of a successful run against a finite initial string of `O` (the
last item of L0.1). Preservation: a successful run against answers `σ` succeeds, with the same
output and use, against any answers `τ` agreeing with `σ` below its use; between stages, if
`Φ^σ_{e,s}(x)↓ = y` with use `u`, `τ` agrees with `σ` below `u` and `s ≤ t`, then
`Φ^τ_{e,t}(x)↓ = y` with use `u`; a run with use `0` succeeds against every answers (the zero-query
case). Passage to a total extending oracle: if a raw or stage run against `σ` succeeds and every
answer of `σ` below its use is a value of the oracle `O`, its output is a value of `eval O c n`. In
oracle-agreement form: if `Φ^Z_{e,s}(x)↓ = y` with recorded use `u` and `Z ↾ u = Y ↾ u`, then
`Φ^Y_e(x)↓ = y`.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn`,
`TauCeti.Oracle.Single.Code.evalStage_eq_some_of_eqOn`,
`TauCeti.Oracle.Single.Code.evaln_eq_some_of_use_eq_zero`, `TauCeti.Oracle.Single.Code.evaln_sound`,
`TauCeti.Oracle.Single.Code.evalStage_sound`,
`TauCeti.Oracle.Single.Code.mem_eval_iff_exists_evaln_range_map`.

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
*Needs:* L0.1 (raw runs, stage evaluation and their persistence) and the use principle above
(`TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn`,
`TauCeti.Oracle.Single.Code.evalStage_eq_some_of_eqOn`, `TauCeti.Oracle.Single.Code.evaln_mono`);
Mathlib `Nat.RecursiveIn.subst`.

**Checks.**
- Let `c` be the program that queries its input and `d` the successor program. The substituted
  program is the successor: against every oracle it returns `x + 1` on input `x` and makes no
  query, so its use is zero. A substitution that kept the outer query and composed with `d`
  afterwards would query address `x` and return the oracle's answer plus one.
- The runs of the query program on inputs `0` and `5` have uses `1` and `6`. Answers agreeing below
  `6` preserve both; answers agreeing only below `1` preserve the first and can change the second,
  so the bound must be the largest use, not the smallest.

Prove both representation directions: for every partial oracle `O : ℕ →. ℕ`, a partial function
`f : ℕ →. ℕ` is recursive in `O` (`Nat.RecursiveIn {O} f`) iff `eval O c = f` for some program `c`;
in particular this holds for each total oracle `O : ℕ → ℕ`, as `fun n => Part.some (O n)`, and
for a set `Z` through `Set.oracle Z`, where it reads: `f` is Turing reducible to `g` iff some
program computes `f` relative to `g`. The direction from Mathlib to programs transfers
nonreducibility; the other transfers positive algorithms. Consequently the domains of the partial
functions recursive in `O` are exactly the domains of programs against `O`, and the total functions
computable in `O` exactly those computed by programs that halt everywhere against `O`; the relative
c.e. form is L1.1.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.recursiveIn_eval`,
`TauCeti.Oracle.Single.Code.exists_code_of_recursiveIn`, `TauCeti.Oracle.Single.Code.exists_code`,
`TauCeti.Oracle.Single.Code.turingReducible_iff_exists_code`.

Separate this extensional adequacy from effective compilation. Adequacy quantifies over arbitrary
partial functions at one fixed oracle. Uniformity statements take explicit program indices or coded
schemes as input and produce computable index transformations whose correctness holds for every
oracle:

- a universal program `u`, independent of the oracle, with `Φ^O_u(⟨e, x⟩) ≃ Φ^O_e(x)` for every
  total oracle `O` and all `e`, `x`; and evaluation `(c, x) ↦ eval O c x` is recursive in `O`,
  uniformly in the program;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.universal`,
  `TauCeti.Oracle.Single.Code.eval_universal`, `TauCeti.Oracle.Single.Code.recursiveIn₂_eval`.
- for each source numbering kept for interoperability, a computable translation `t` with
  `Φ^O_{t(e)}(x) ≃ Ψ^O_e(x)` for all `O`, `e`, `x`. For Mathlib's ordinary codes this is the
  query-free translation of L0.1, so every partial recursive function has one program computing it
  relative to every oracle. The single-oracle programs follow the coordinated Mathlib design, so
  no second numbering of oracle programs is maintained;
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.eval_toSingleOracleCode`,
  `TauCeti.Oracle.Single.Code.exists_forall_eval_eq_of_partrec`.
- s-m-n and fixed points whose correctness holds for every oracle: a primitive recursive injective
  map `curry` with `eval O (curry c a) x = eval O c ⟨a, x⟩` for every partial oracle `O`; a
  primitive recursive self-reference compiler `fixedPoint` with
  `eval O (fixedPoint c) x = eval O c ⟨fixedPoint c, x⟩` for every partial oracle, and its
  parameterized form; for every computable transformation `f` of programs a program `c` with
  `eval O (f c) = eval O c` for every total oracle `O`, the program chosen before the oracle; and
  for every computable family `f(a, ·)` a primitive recursive family `g` with
  `eval O (f(a, g a)) = eval O (g a)` for every total oracle `O` and every `a`.
  *In Tau Ceti:* `TauCeti.Oracle.Single.Code.curry`, `TauCeti.Oracle.Single.Code.eval_curry`,
  `TauCeti.Oracle.Single.Code.primrec₂_curry`, `TauCeti.Oracle.Single.Code.curry_inj`,
  `TauCeti.Oracle.Single.Code.fixedPoint`, `TauCeti.Oracle.Single.Code.primrec_fixedPoint`,
  `TauCeti.Oracle.Single.Code.eval_fixedPoint`, `TauCeti.Oracle.Single.Code.fixedPointParam`,
  `TauCeti.Oracle.Single.Code.primrec₂_fixedPointParam`,
  `TauCeti.Oracle.Single.Code.eval_fixedPointParam`, `TauCeti.Oracle.Single.Code.fixed_point`,
  `TauCeti.Oracle.Single.Code.fixed_point_param`.

Prove that pointwise adequacy is not uniformity: no single index `e` has, for every set `Z`,
`Φ^Z_e` equal to the constant function with value `1` when `Z = ∅` and `0` otherwise. For each `Z`
that function is constant, so some index computes it; but a run that halts on `∅` with use `u`
halts with the same output on `{u}`, which agrees with `∅` below `u`. Consequently adequacy, which
gives for every oracle an index, does not in general yield one index for every oracle (`∀ Z ∃ e`
does not become `∃ e ∀ Z`), and no computable extraction of a program from an arbitrary
`RecursiveIn` proof is assumed anywhere in this roadmap.
*Needs:* the use principle above (`TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn`,
`TauCeti.Oracle.Single.Code.evalStage_sound`).

### 0.3 Fixed and moving oracles (L0.3)

For a fixed oracle, staged discovery is data: for a program `c`, an input `x` and answers `σ` giving
exactly the values of a partial oracle `O`, the stage computations `s ↦ Φ^σ_{c,s}(x)` are a
persistent sequence (once a stage computation succeeds, it succeeds with the same output and use at
every later stage) whose outputs are exactly the values of `eval O c x`, each appearing at all
sufficiently large stages with one fixed use. Such a staged presentation exists for every partial
function recursive in `O`, by the representation theorem of L0.2, and is not added as an unproved
hypothesis to the final results.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.evalStage_mono`,
`TauCeti.Oracle.Single.Code.mem_eval_iff_exists_evalStage`,
`TauCeti.Oracle.Single.Code.exists_eventually_evalStage_eq_some_of_mem_eval`,
`TauCeti.Oracle.Single.Code.exists_code`.

For a varying sequence of answers the theorem is different. If answers `σ_s` converge pointwise to
`σ`, a successful run against `σ` is, from some stage on, a successful run with the same fuel,
output and use against `σ_s`, and also with fuel `t(s)` for any clock `t` tending to infinity; if
moreover `σ` gives every value of `O`, every value of a program relative to `O` is the output of one
run, with a fixed use, that from some stage on succeeds against `σ_s`. For increasing finite stages
`A_s` with limit `A`, the answers of `A_s` converge pointwise to those of `A`, so a successful
computation relative to the oracle of `A` becomes visible against `A_s` at all sufficiently large
stages. The proof uses stabilization of the finitely many addresses below the use. Arbitrary stage
computations against `A_s` do *not* persist merely because the fuel grows.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.eventually_evaln_eq_some_of_converges`,
`TauCeti.Oracle.Single.Code.eventually_evaln_eq_some_of_converges_of_tendsto`,
`TauCeti.Oracle.Single.Code.exists_eventually_evaln_eq_some_of_mem_eval`,
`TauCeti.Oracle.Single.Code.converges_setAnswers_stageLimit`,
`TauCeti.Oracle.Single.Code.exists_eventually_evaln_setAnswers_eq_some_of_mem_eval`.

Supply earliest-discovery racing with a fixed tie rule. Call a *staged discovery* a sequence
`D : ℕ → Option α` that is persistent: once `D(s) = some a`, `D(t) = some a` for every `t ≥ s`. The
stage evaluation of a fixed program on a fixed input against fixed answers is one. For staged
discoveries `D_0, …, D_{k−1}` define their race, a staged discovery with values in `Fin k × α`: at
stage `s` it is `none` while no `D_i` has discovered anything by stage `s`; from the first stage at
which some `D_i` has discovered, it is `some (i, a)` with `i` the least index among those whose
first discovery stage is least and `a` its value. Prove:

- the race is persistent: the winner is selected at the first discovery stage and then retained;
- the race discovers exactly when some `D_i` does, and its winner's first discovery stage is at
  most that of every `D_i`;
- if the `D_i` are computable uniformly in `(i, s)`, the race is computable in `s`; for the stage
  evaluations of programs `c_0, …, c_{k−1}` against a set's answers it is computable from that set,
  uniformly in the programs.

*Needs:* L0.1 (`TauCeti.Oracle.Single.Code.evalStage`, `TauCeti.Oracle.Single.Code.evalStage_mono`,
`TauCeti.Oracle.Single.Code.primrec_evalStage`).

**Checks.**
- Let `D_1` discover at stage `1` and `D_0` at stage `2`. Preferring at each stage the least `i`
  whose `D_i` has discovered gives `1` at stage `1` and `0` at stage `2`, which is not persistent;
  the race keeps `(1, ·)` from stage `1` on.
- If `D_0` and `D_1` both first discover at stage `3`, the race picks `0` at stage `3` and keeps
  it, whatever later stages show.

### Examples

- The query-free programs `zero` and `succ` succeed with use `0` at every fuel above the input,
  against any answers, including none at all: against empty answers the raw run of `zero` returns
  output and use `0`, while a query fails. A computation with use zero is not a missing answer.
- A query at address `0` succeeds with use `1` against the strings `(1)` and `(0)`: a negative
  answer is an answer and still has positive use (for the answer `0` the run returns output `0` and
  use `1`). Against the empty string it fails.
- A query at address `1` against a string of length one fails at every fuel: the string answers
  nothing beyond its length.
- A computation invalidated by a later c.e. entry: the query program on input `3` against a stage
  `A_s` with `3 ∉ A_s` halts with output `0` and use `4`; if `3` enters at stage `s + 1`, the run
  against `A_{s+1}` outputs `1`.
- Simultaneous preservation of two computations with different uses, and the race with its
  non-persistent left-preference variant, as in the Checks of L0.2 and L0.3.

### Dependencies

Mathlib only: `Primcodable`, `Primrec`, `Finset.equivBitIndices`, `Nat.Partrec.Code`,
`Nat.RecursiveIn`, `RecursiveIn`, `TuringReducible`, `Nat.RecursiveIn.subst`. No earlier layer.

## L1: c.e. sets and effective presentations of enumerations

This layer is the theory of c.e. sets and of their enumerations by finite stages [S, II.1–2; III.1]:
the relative notions, the presentations of c.e. sets as domains, ranges and stage unions, the
interfaces of finite stages and their limits, and serialization. An enumeration's finite stage data
and its limit are separate objects: the limit is not given a computable characteristic function
because its stages are computable.

### 1.1 C.e. and computable relative to an oracle (L1.1)

For a set `Z` and a predicate `p` on ℕ, define *c.e. in `Z`* (`REPredIn`): the partial function that
halts without information exactly where `p` holds is recursive in the oracle of `Z`; and *computable
in `Z`* (`ComputablePredIn`): `p` has a decision procedure computable in the oracle of `Z`. Prove:

- at the empty oracle they are Mathlib's notions: c.e. in `∅` iff `REPred`, and computable in `∅`
  iff `ComputablePred`;
- `p` is c.e. in `Z` iff `{x : p x} = W^Z_e` for some `e`, iff `p` is the domain of some partial
  function recursive in the oracle of `Z`;
- `W^Z_e` is the union of its stages `W^Z_{e,s} = {x < s : Φ^Z_{e,s}(x)↓}`, which increase with `s`,
  and `y` is a value of `Φ^Z_e` at `x` iff some stage computation converges at `x` with output `y`;
- `p` is computable in `Z` iff `p` and its negation are both c.e. in `Z`;
- c.e. in `Z` is closed under finite union and intersection, preimage under a computable function,
  and projection `x ↦ ∃ y, q ⟨x, y⟩`; computable in `Z` is closed under the Boolean operations and
  computable preimage;
- if `Z ≤_T Y`, every predicate c.e. in `Z` is c.e. in `Y` and every predicate computable in `Z` is
  computable in `Y`.

*Needs:* L0.2 (adequacy, `TauCeti.Oracle.Single.Code.exists_code`) and L0.3
(`TauCeti.Oracle.Single.Code.mem_eval_iff_exists_evalStage`); Mathlib `RecursiveIn`, `ComputableIn`,
`REPred`, `ComputablePred`, `ComputablePred.computable_iff_re_compl_re'`,
`RecursiveIn.partrec_of_oracle`.

**Checks.**
- The empty set is c.e. in every `Z`, as the domain of the nowhere-halting program. A definition of
  "c.e. in `Z`" as "the range of a total function computable in `Z`" would exclude it.
- `K` is c.e. in `∅` and not computable in `∅`, and its complement is computable in `∅′` and not
  c.e. in `∅`. So c.e. in `Z` is not closed under complement, and a definition that identified it
  with "computable in `Z`" would make `K` not c.e.

### 1.2 Stages, presentations and closure of c.e. sets (L1.2)

For a sequence of finite stages `A : ℕ → Finset ℕ`, with fresh entries `ΔA_s = A_{s+1} ∖ A_s` and
limit `⋃ₛ A_s` (Convention 8), prove: membership in the limit is membership at some stage, and a
member of the limit not in `A_0` is fresh at some stage; under increasing stages, a number is fresh
at most once (its entry stage is unique), it is in the limit iff it is in every late enough stage,
and the stages eventually agree with the limit below any bound `u` (finite-prefix stabilization);
under increasing stages, dropping the first `k` stages, or reading the stages along a clock whose
range is cofinal (the clock need not increase), does not change the limit; and, under increasing
stages, if nothing below `u` enters after stage `s`, or between stages `s ≤ t`, then the limit, or
`A_t`, agrees with `A_s` below `u`.
*In Tau Ceti:* `TauCeti.Enumeration.fresh`, `TauCeti.Enumeration.mem_fresh`,
`TauCeti.Enumeration.stageLimit`, `TauCeti.Enumeration.mem_stageLimit`,
`TauCeti.Enumeration.exists_mem_fresh_of_mem_stageLimit`, `TauCeti.Enumeration.unique_entry_stage`,
`TauCeti.Enumeration.mem_stageLimit_iff_eventually`, `TauCeti.Enumeration.finite_prefix_stabilizes`,
`TauCeti.Enumeration.stageLimit_shift`, `TauCeti.Enumeration.stageLimit_comp_of_cofinal`,
`TauCeti.Enumeration.agrees_of_no_fresh_below`,
`TauCeti.Enumeration.limit_agrees_of_no_fresh_below`.

Prove that a predicate on ℕ is c.e. iff it is the domain of the partial function of some ordinary
code, and iff it is the limit of increasing finite stages, starting empty, whose binary finite-set
codes (L0.1) are computable; the domain `W_c` of a code is the limit of its canonical stages
`W_{c,s}`, the inputs on which `c` halts within `s` steps, which start empty, increase, lie below
`s`, and are primitive recursive in the code, the stage and the number; and the limit of finite
stages with computable membership is c.e.
*In Tau Ceti:* `TauCeti.Enumeration.rePred_iff_exists_code`, `Nat.Partrec.Code.rePred_dom_eval`,
`TauCeti.Enumeration.rePred_iff_exists_stages`, `TauCeti.Enumeration.rePred_mem_stageLimit`,
`Nat.Partrec.Code.domStage`, `Nat.Partrec.Code.mem_domStage`, `Nat.Partrec.Code.domStage_zero`,
`Nat.Partrec.Code.monotone_domStage`, `Nat.Partrec.Code.domStage_subset_range`,
`Nat.Partrec.Code.stageLimit_domStage`, `Nat.Partrec.Code.primrecRel_mem_domStage`,
`Nat.Partrec.Code.primrec_domStage`.

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

*Needs:* L1.1; Mathlib `REPred`, `Partrec`, `Nat.Partrec.Code`; the presentations above
(`TauCeti.Enumeration.rePred_iff_exists_code`, `TauCeti.Enumeration.rePred_iff_exists_stages`).

**Checks.**
- The empty set is c.e. and is not the range of any total function `ℕ → ℕ`, whose range is nonempty:
  the range presentation needs the nonemptiness hypothesis.
- The constant function `0` is total computable with range `{0}`, so a range presentation need not
  be injective; injective enumerations exist exactly for the infinite c.e. sets, and `{0}` has none.

### 1.3 Serialization (L1.3)

Prove serialization of a stage sequence of sets, uniformly and without deciding whether the limit
is finite: from any finite stages `A_s` build stages, by inspecting one pair (number, original
stage) per transition, that start empty, increase, add at most one new number at each stage, and
have the same limit as `A`, with no monotonicity or effectivity hypothesis; for increasing `A` the
serialized stage `s` is contained in `A_s`, and every element of `A_t` is present by an explicit
serialized stage computable from `t` and the code of `A_t`; the codes of the serialized stages are
computable uniformly in all parameters of computable source stages, in particular for the canonical
stages of the domains of ordinary codes; and every c.e. predicate has an effective increasing
presentation starting empty with at most one new entry per stage.
*In Tau Ceti:* `TauCeti.Enumeration.serializedStage`, `TauCeti.Enumeration.serializedStage_zero`,
`TauCeti.Enumeration.monotone_serializedStage`,
`TauCeti.Enumeration.card_fresh_serializedStage_le_one`,
`TauCeti.Enumeration.stageLimit_serializedStage`, `TauCeti.Enumeration.serializedStage_subset`,
`TauCeti.Enumeration.subset_serializedStage`, `TauCeti.Enumeration.computable_serializedStage`,
`TauCeti.Enumeration.computable_serializedStage_domStage`,
`TauCeti.Enumeration.rePred_iff_exists_serialized_stages`.

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
element at every stage, and the same limit. *Needs:* L1.2; the serialization of sets above
(`TauCeti.Enumeration.serializedStage`, `TauCeti.Enumeration.subset_serializedStage`,
`TauCeti.Enumeration.serializedStage_subset`, `TauCeti.Enumeration.stageLimit_serializedStage`,
`TauCeti.Enumeration.computable_serializedStage`).

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

L0 for the relative forms and for the stage computations. Mathlib: `REPred`, `ComputablePred`,
`Partrec`, `Nat.Partrec.Code`, `RecursiveIn`.

## L2: Numberings, reductions, joins and uniform construction interfaces

This layer is the theory of [S, I.3; II.2–3; III.1–2] that the constructions use: padding and the
oracle-relative recursion theorems, Turing reducibility of sets and its degree statements, the
parity join, the reductions attached to a disjoint c.e. splitting, and effective searches.

### 2.1 Padding and self-reference (L2.1)

Mathlib's ordinary enumeration, s-m-n and recursion theorems are reused. The oracle-relative forms
are those of L0.2: parameter specialization `curry` is primitive recursive and injective, and the
parameterized recursion theorem gives, for every computable family `f(a, ·)` of program
transformations, a primitive recursive family `g` with `Φ^O_{f(a, g a)} = Φ^O_{g a}` for every
total oracle `O` and every `a`; the compilers are computable independently of the oracle. Ordinary
programs enter the oracle numbering through the injective primitive recursive query-free
translation of L0.1, and every partial recursive function has one program computing it relative to
every oracle.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.curry_inj`,
`TauCeti.Oracle.Single.Code.fixed_point_param`, `TauCeti.Oracle.Single.Code.fixedPointParam`,
`TauCeti.Oracle.Single.Code.eval_fixedPointParam`, `Nat.Partrec.Code.toSingleOracleCode_injective`,
`TauCeti.Oracle.Single.Code.exists_forall_eval_eq_of_partrec`.

Define a padding compiler on single-oracle programs, a map we call padding that takes a program `c`
and a number `n`. Prove that padding is primitive recursive and injective in the pair `(c, n)`, and
that for every partial oracle `O` the padded program evaluates against `O` to the same partial
function as `c`. Consequently every partial function recursive in `O` has infinitely many indices,
given uniformly from one of them, independently of `O`. *Needs:* L0.1
(`TauCeti.Oracle.Single.Code`, its `Denumerable` numbering and `TauCeti.Oracle.Single.Code.eval`).

### 2.2 Reducibility of sets, joins and degrees (L2.2)

Specialize Mathlib's Turing reducibility to the total characteristic functions of sets: the oracle
`Set.oracle A` of a set `A` answers `A.indicator 1 n` at `n`, and it is partial computable iff
membership in `A` is computable. Reducibility of sets is reflexive and transitive (Mathlib's
`TuringReducible.refl` and `TuringReducible.trans` for the oracles); a many-one reduction of sets
gives a Turing reduction of their oracles, and a one-one reduction a many-one one (Mathlib's
`OneOneReducible.to_many_one`). The bottom degree: the oracle of `∅` is Turing reducible to every
partial function, and a set is Turing reducible to `∅` iff it is computable. In Mathlib's degree
quotient, the order on the degrees represented by partial functions is Turing reducibility.
*In Tau Ceti:* `Set.oracle`, `Set.oracle_apply`, `Set.partrec_oracle_iff`,
`ManyOneReducible.turingReducible_oracle`, `Set.empty_turingReducible`,
`Set.turingReducible_empty_iff`, `TauCeti.turingDegree_le_iff`.

The parity join is a least upper bound. For sets `A` and `B`, `2x ∈ A ⊕ B` iff `x ∈ A` and
`2x + 1 ∈ A ⊕ B` iff `x ∈ B`; `A` and `B` one-one reduce to `A ⊕ B` by `x ↦ 2x` and `x ↦ 2x + 1`,
hence are Turing reducible to it; `A ⊕ B` is Turing reducible to an oracle `g` iff both `A` and `B`
are; and in Mathlib's degree quotient the degree of `A ⊕ B` is the least upper bound of the degrees
of `A` and `B` among all degrees. The join of partial functions follows the shape of the Mathlib
proposal cited in the references: `f ⊕ g` sends `2n` to `2y` for each value `y` of `f n` and
`2n + 1` to `2y + 1` for each value `y` of `g n`, so that the parity of the input selects the side
and the parity of the output records it; it is the least upper bound for Turing reducibility,
monotone and compatible with Turing equivalence in both arguments, and makes `TuringDegree` a
join-semilattice. The characteristic function of `A ⊕ B` is Turing equivalent to the join of the
characteristic functions of `A` and `B`, so the degree of `A ⊕ B` is the supremum of the two degrees
in that semilattice.
*In Tau Ceti:* `Set.join`, `Set.mem_join`, `Set.two_mul_mem_join`, `Set.two_mul_add_one_mem_join`,
`Set.oneOneReducible_join_left`, `Set.oneOneReducible_join_right`, `Set.turingReducible_join_left`,
`Set.turingReducible_join_right`, `Set.join_turingReducible_iff`, `Set.isLUB_degree_join`,
`PFun.turingJoin`, `PFun.turingJoin_turingReducible_iff`, `TuringReducible.turingJoin_left`,
`TuringReducible.turingJoin_right`, `TuringReducible.turingJoin`, `TuringEquivalent.turingJoin`,
`TuringDegree.instSemilatticeSup`, `TuringDegree.toAntisymmetrization_sup_toAntisymmetrization`,
`Set.turingJoin`, `Set.oracle_turingJoin_turingEquivalent`,
`TuringDegree.toAntisymmetrization_oracle_turingJoin`.

Prove:

- complement invariance: `A ≡_T Aᶜ` for every set `A`;
- computable changes of presentation: for a computable bijection `π` of ℕ, `π(A)` and `A` are
  one-one equivalent, hence `π(A) ≡_T A`;
- the columns `ω^[e]` are infinite, pairwise disjoint and cover ℕ, and membership of `x` in `ω^[e]`
  is computable in `(x, e)`;
- ordinary subset inclusion is not a reducibility: there is a noncomputable subset of a computable
  set.

*Needs:* the set oracles and the many-one implication above (`Set.oracle`,
`ManyOneReducible.turingReducible_oracle`); Mathlib `OneOneReducible`, `OneOneEquiv`, `Nat.pair`,
`Nat.unpair`.

**Checks.**
- `K ≡_T Kᶜ`, but `K` is not many-one reducible to `Kᶜ`: such a reduction would make `K` co-c.e. and
  hence computable. A set reducibility defined through many-one reductions would separate a set from
  its complement.

### 2.3 Least-witness search and finite-priority selection (L2.3)

For a predicate `q` on ℕ × ℕ computable in `Z`, prove that the least-witness search
`a ↦ min {y : q(a, y)}` is a partial function recursive in `Z` whose domain is exactly
`{a : ∃ y, q(a, y)}` and whose value there is the least witness; under the premise
`∀ a, ∃ y, q(a, y)` it is total and computable in `Z`; and an index for the search is computable
from an index for `q`, independently of `Z`. No default number stands for a failed search.

For a finite list of candidates in priority order and an eligibility predicate, define finite-priority
selection: `none` when no candidate is eligible, otherwise `some` of the first eligible candidate.
Prove the minimum specification (the selected candidate is eligible and no earlier one is), the
no-candidate specification (`none` exactly when no candidate is eligible), and computability when
the list and the predicate are computable. The routing search `leastThreat` of L9.3 is an instance.
*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`,
`Nat.RecursiveIn.rfind'`.

### 2.4 Disjoint c.e. splittings (L2.4)

For a disjoint c.e. splitting `B = A_0 ∪ A_1`, `A_0 ∩ A_1 = ∅`, prove [S, VII.3.3]:
`A_0 ≤_T B`, `A_1 ≤_T B` and `B ≡_T A_0 ⊕ A_1`. The reductions use both enumerations: to decide
`x ∈ A_0` from `B`, first ask whether `x ∈ B`; if not, answer no, and if so, wait until `x` is
enumerated into one of the two halves. Export the uniform version: a primitive recursive map
sending two ordinary codes `c_0`, `c_1` to an oracle program that, whenever the domains `W_{c_0}`
and `W_{c_1}` are disjoint, computes the characteristic function of `W_{c_0}` relative to the oracle
of `W_{c_0} ∪ W_{c_1}`. This information is not lost by retaining only `A_i ⊆ B`.
*In Tau Ceti:* `Disjoint.turingReducible_union_left`, `Disjoint.turingReducible_union_right`,
`Disjoint.turingEquivalent_union_join`, `Nat.Partrec.Code.splitProgram`,
`Nat.Partrec.Code.primrec₂_splitProgram`, `Nat.Partrec.Code.eval_splitProgram`.

### Examples

- Parity inclusions and projections: `x ↦ 2x` and `x ↦ 2x + 1` one-one reduce `A` and `B` to
  `A ⊕ B`, and `n ↦ ⌊n/2⌋` on even and odd `n` recovers them.
- A set equivalent to its complement: every set, by L2.2; for instance `K` and `Kᶜ`.
- Finite sets are computable, hence of the bottom degree.
- A disjoint c.e. split: `K = (K ∩ evens) ⊔ (K ∩ odds)`; both parts are c.e. and Turing reducible to
  `K`, and `K` is Turing equivalent to their join.
- A noncomputable subset of a computable set: `{2x : x ∈ K}` inside the even numbers.
- Parameter compilation and a genuinely self-referential index: by the parameterized fixed point, a
  program that outputs its own index, and an oracle program that queries its own index.

### Dependencies

L0 and L1. Mathlib: `ManyOneReducible`, `OneOneReducible`, `TuringReducible`, `TuringDegree`,
`Nat.rfind`, `List.find?`.

## L3: The jump, the arithmetical hierarchy, and index sets

This layer is the material of [S, III.2; IV.1–4]: the concrete jump and low sets, then the
arithmetical hierarchy, Post's theorem and the classification of index sets.

### 3.1 The jump and low sets (L3.1)

Define the jump `Z′` with the indexed evaluator of L0: `e ∈ Z′` iff the program numbered `e` halts
on input `e` relative to the oracle of `Z`; and the paired halting set
`K^Z_0 = {⟨x, e⟩ : Φ^Z_e(x)↓}`. Prove: `Z` reduces one-one to `Z′` and `Z′` is not Turing
reducible to `Z`, so `Z <_T Z′`; monotonicity on reductions, `A ≤_T B` implies that `A′` reduces
one-one, hence Turing, to `B′`; invariance under Turing equivalence, `A ≡_T B` implies that `A′` and
`B′` are one-one equivalent; the diagonal and paired halting sets are one-one equivalent, hence
Turing equivalent; and completeness for sets c.e. in `Z`: the domain of every partial function
recursive in the oracle of `Z` reduces one-one to `Z′`, uniformly in the program. The upper-bound
interface, that the jump decides every `Z`-halting question (the oracle of the domain of every
partial function recursive in `Z` is Turing reducible to `Z′`), is derived from the concrete jump;
it is not the definition or the construction of the jump.
*In Tau Ceti:* `Set.jump`, `Set.pairedJump`, `Set.mem_jump`, `Set.pair_mem_pairedJump`,
`Set.oneOneReducible_jump`, `Set.turingReducible_jump`, `Set.not_jump_turingReducible`,
`Set.oneOneReducible_jump_jump`, `Set.turingReducible_jump_jump`, `Set.oneOneEquiv_jump_jump`,
`Set.turingEquivalent_jump_jump`, `Set.oneOneEquiv_jump_pairedJump`,
`Set.turingEquivalent_jump_pairedJump`, `Set.oneOneReducible_dom_eval_jump`,
`Set.oneOneReducible_jump_of_recursiveIn`, `Set.turingReducible_jump_of_recursiveIn`.

Prove the finite iterates `Z⁽ⁿ⁾` and their transport: `Z⁽ᵐ⁾` reduces one-one to `Z⁽ⁿ⁾` when
`m ≤ n`, and is not Turing reducible to it when `m < n`, so `Z⁽ᵐ⁾ ≤_T Z⁽ⁿ⁾` iff `m ≤ n` and the
degrees of the iterates are strictly increasing in Mathlib's quotient; `A ≤_T B` implies
`A⁽ⁿ⁾ ≤_T B⁽ⁿ⁾`, and one-one reducibility from the first jump on; Turing equivalent sets have Turing
equivalent iterated jumps, one-one equivalent from the first jump on.
*In Tau Ceti:* `Set.oneOneReducible_iterate_jump_of_le`, `Set.turingReducible_iterate_jump_of_le`,
`Set.not_iterate_jump_turingReducible_of_lt`, `Set.turingReducible_iterate_jump_iff`,
`Set.turingEquivalent_iterate_jump_iff`, `Set.strictMono_degree_iterate_jump`,
`Set.turingReducible_iterate_jump_iterate_jump`, `Set.oneOneReducible_iterate_jump_iterate_jump`,
`Set.turingEquivalent_iterate_jump_iterate_jump`, `Set.oneOneEquiv_iterate_jump_iterate_jump`.

Define low sets: `A` is low when `A′ ≡_T ∅′`; since `∅′ ≤_T A′` always holds, lowness is equivalent
to `A′ ≤_T ∅′`. Prove degree invariance (Turing equivalent sets are low together), downward closure
among set degrees (a set Turing reducible to a low set is low), that `∅` and every computable set
are low, that every low set is Turing reducible to `∅′` while no low set computes `∅′` (so a low
c.e. set, noncomputable or not, is incomplete, and its degree is strictly below `0′`), that a low
set has the iterated jumps of `∅` from the first jump on, and that no jump is low.
*In Tau Ceti:* `Set.Low`, `Set.low_def`, `Set.low_iff_jump_turingReducible`, `Set.low_congr`,
`Set.Low.of_turingReducible`, `Set.low_empty`, `Set.low_of_computablePred`,
`Set.Low.turingReducible_jump_empty`, `Set.Low.not_jump_empty_turingReducible`,
`Set.Low.degree_lt_jump_empty`, `Set.Low.turingEquivalent_iterate_jump`, `Set.not_low_jump`.

**Checks.**
- `K ≤_T ∅′`, but `K` is not low: `K′ = ∅″` is not Turing reducible to `∅′`. A definition of low
  sets as the sets Turing reducible to `∅′` would make `K` low.

In the vocabulary of L1.1, prove that every set c.e. in `Z` is one-one, hence many-one, reducible
to `Z′`, and that `Z′` is c.e. in `Z`; and that a predicate whose negation is c.e. in `Z` is
computable in `Z′`. *Needs:* L1.1; the completeness of the jump above (`Set.jump`,
`Set.oneOneReducible_jump_of_recursiveIn`, `Set.turingReducible_jump_of_recursiveIn`).

### 3.2 The arithmetical hierarchy and index sets (L3.2)

#### The pointclasses

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
prerequisite. *Needs:* L1.1, L2.3; Mathlib `Nat.pair`, `ComputableIn`.

**Checks.**
- `FIN = {e : W_e finite}` is `Σ⁰₂(∅)`: `e ∈ FIN` iff `∃ n ∀ s ∀ x < s, (x ∈ W_{e,s} → x < n)`, a
  computable matrix after contracting the universal quantifiers. If `Σ⁰ₙ₊₁` were defined by an
  existential quantifier over a `Σ⁰ₙ` matrix instead of a `Π⁰ₙ` one, every level would collapse to
  `Σ⁰₁` (adjacent existential quantifiers contract), and `FIN`, which is not c.e., would not be
  `Σ⁰₂`.
- `K ∈ Σ⁰₁(∅)`, with the computable matrix `(e, s) ↦ Φ_{e,s}(e)↓`, and `K ∉ Π⁰₁(∅)`: a `Π⁰₁` set
  has c.e. complement, and `K` with c.e. complement would be computable.

#### Post's theorem

Prove, for every set `Z` and every `n`: a predicate is `Σ⁰ₙ₊₁(Z)` iff it is c.e. in `Z⁽ⁿ⁾`
(`post_sigma`), and `Δ⁰ₙ₊₁(Z)` iff it is computable in `Z⁽ⁿ⁾` (`post_delta`). Prove strictness:
`Z⁽ⁿ⁺¹⁾` is `Σ⁰ₙ₊₁(Z)` and not `Π⁰ₙ₊₁(Z)`, so `Σ⁰ₙ₊₁(Z) ≠ Π⁰ₙ₊₁(Z)` and `Δ⁰ₙ₊₁(Z)` is a proper
subclass of both. The proofs use the theorems on the concrete jump of L3.1 and the normal forms
above, not a definition of the pointclasses through the jump. *Needs:* L3.1 (`Set.jump` and its
iterates, `Set.not_jump_turingReducible`, `Set.turingReducible_iterate_jump_of_le`); the pointclasses
above.

#### Index sets

With `W_e` the domain of Mathlib's ordinary program number `e`, define `TOT = {e : W_e = ℕ}`,
`FIN = {e : W_e finite}` and `INF = {e : W_e infinite}`. Prove the exact classifications with
many-one completeness: `K` is `Σ⁰₁` and every `Σ⁰₁` set many-one reduces to it; `TOT` is
`Π⁰₂`-complete, `FIN` is `Σ⁰₂`-complete and `INF` is `Π⁰₂`-complete. By Post's theorem, none of
`TOT`, `FIN`, `INF` is `Σ⁰₁` or `Π⁰₁`, and `TOT` is not `Σ⁰₂`. *Needs:* the pointclasses and Post's
theorem above; Mathlib `ComputablePred.halting_problem`, `ManyOneReducible`, and s-m-n for the
reductions (`Nat.Partrec.Code.curry`, `Nat.Partrec.Code.smn`).

**Checks.**
- `TOT` is `Π⁰₂`: `e ∈ TOT` iff `∀ x ∃ s, Φ_{e,s}(x)↓`. A single query to `∅′` asks whether one
  computation halts, and a set decidable with finitely many such queries per input would be
  `Δ⁰₂`; `TOT`, being `Π⁰₂`-complete, is not.

### Examples

- Ordinary and relative halting: `K = ∅′`, and the jump of `K` is `∅″`.
- Deciding a predicate with c.e. complement using the jump: `x ∉ W_e` is decided by asking `∅′`
  whether `x ∈ W_e`.
- Computable sets are low and `K` is not (L3.1).
- The distinction between membership in a list of axioms and a decision procedure for its c.e.
  closure: the list may be computable while its closure under computable rules is only `Σ⁰₁`.
- `TOT` against a single halting query, as in the Check of the index sets.
- The jump does not preserve joins: the halves of the splitting of `K` in L9.4 are low while their
  join is Turing equivalent to `K`, which is not.

### Dependencies

L0 to L2: L3.1 uses L0, L1.1 and L2.2, and L3.2 uses L3.1, L1.1 and L2.3. Mathlib: `ComputablePred.halting_problem`, `ManyOneReducible`, `OneOneReducible`.

## L4: Moduli, limit approximation, and stabilization information

This layer is the material of [S, III.3, especially III.3.1–4]: convergence of approximations and
their moduli, the Modulus Lemma, the Limit Lemma and the functions of c.e. degree, and the finite-use
lemmas that link the limit calculus to the priority constructions of L6 to L9.

### 4.1 Convergence and moduli (L4.1)

For a sequence `f : ℕ → α → β` of functions, the stage being the first argument, define pointwise
eventual agreement with `g`, `f(s, x) = g(x)` for all sufficiently large `s` at each `x`, and a
modulus `m` of it, `∀ x, ∀ s ≥ m(x), f(s, x) = g(x)`. Prove: limits are unique; a sequence converges
iff it has a modulus, every larger function being a modulus too; finite-coordinate aggregation
(finitely many coordinates are simultaneously correct from some stage on, and from the largest of
their moduli on); on ℕ a convergent sequence has a monotone modulus; stage shifts (dropping the first
`k` stages changes neither convergence nor the limit, and moduli shift by `k`); reindexing along a
clock `t` tending to infinity preserves the limit, with the modulus `n ∘ m` when `n(k)` is a stage
after which `t` stays at least `k` (effective reindexing); and a uniformly computable sequence with
a computable modulus has a computable limit, so that a function is computable iff it is the limit of
a uniformly computable sequence with a computable modulus.
*In Tau Ceti:* `TauCeti.Approximation.Converges`, `TauCeti.Approximation.IsModulus`,
`TauCeti.Approximation.Converges.unique`, `TauCeti.Approximation.converges_iff_exists_isModulus`,
`TauCeti.Approximation.IsModulus.mono`, `TauCeti.Approximation.Converges.eventually_forall_mem`,
`TauCeti.Approximation.IsModulus.forall_mem_of_sup_le`,
`TauCeti.Approximation.Converges.exists_monotone_isModulus`,
`TauCeti.Approximation.converges_shift_iff`, `TauCeti.Approximation.IsModulus.shift`,
`TauCeti.Approximation.IsModulus.of_shift`, `TauCeti.Approximation.Converges.comp_tendsto`,
`TauCeti.Approximation.IsModulus.comp`, `TauCeti.Approximation.IsModulus.computable`,
`TauCeti.Approximation.computable_iff_exists_isModulus`.

State the exact relativized hypotheses for each version. Prove: if an approximation `f(s, x)` is
computable in `Z` uniformly in `(s, x)` and has a modulus computable in `Z`, its limit is computable
in `Z`; in particular a computable approximation with a modulus computable in `Z` has a limit
computable in `Z`. *Needs:* the moduli above (`TauCeti.Approximation.IsModulus`); Mathlib
`ComputableIn`.

### 4.2 The Modulus Lemma (L4.2)

Prove the Modulus Lemma [S, III.3.2]: for a c.e. set `Z` and a total `f : ℕ → ℕ`, `f` is computable
in `Z` iff `f` has a computable approximation with a modulus computable in `Z`. The forward
direction is `modulus_of_ce_oracle`; the converse is L4.1. *Needs:* L4.1; L1.2
(`TauCeti.Enumeration.rePred_iff_exists_stages`); L0.2 (`TauCeti.Oracle.Single.Code.exists_code`);
L0.3 (`TauCeti.Oracle.Single.Code.exists_eventually_evaln_setAnswers_eq_some_of_mem_eval`).

**Checks.**
- For `Z = K` and `f` the characteristic function of `K`, the approximation "`x` has entered `K` by
  stage `s`" has the modulus "the entry stage of `x` if `x ∈ K`, else `0`", which is computable in
  `K`; it has no computable modulus, since a computable modulus would decide `K`. The lemma's
  modulus is computable in `Z`, not computable outright.

### 4.3 The Limit Lemma (L4.3)

Prove the Limit Lemma [S, III.3.3], relativized, for total functions `ℕ → ℕ`: for every set `Z`,
`f` is computable in `Z′` iff `f` is the pointwise eventually constant limit of a sequence of total
functions uniformly computable in `Z` (`limitLemma`). Its parts:

- from a limit to the jump: if the stages `f(s, ·)` are computable in `Z`, uniformly in `s`, and
  converge pointwise to `g`, then `g` is computable in `Z′`; for sets, if they converge to the
  characteristic function of `A`, then `A ≤_T Z′`, and for a computable approximation `A ≤_T ∅′`.
  The proof decides, with `Z′`, whether the value at `x` changes after a given stage, a question c.e.
  in `Z`;
  *In Tau Ceti:* `TauCeti.Approximation.Converges.computableIn_jump`,
  `TauCeti.Approximation.Converges.turingReducible_jump`,
  `TauCeti.Approximation.Converges.turingReducible_jump_empty`.
- from the jump to a limit: every total `f` computable in `Z′` is the limit of a sequence uniformly
  computable in `Z`. The approximation runs a program computing `f` from `Z′` against the stages of
  `Z′`, a stage computation reading only a finite initial segment of `Z`;
- the characteristic-function specialization: `A ≤_T Z′` iff the characteristic function of `A` is
  such a limit;
- using Post's theorem (L3.2), `A ∈ Δ⁰₂(Z)` iff the characteristic function of `A` is such a limit.

*Needs:* L3.2 for the `Δ⁰₂` form only; the first part above; L3.1 (`Set.jump`); for the converse,
L0.1 (`TauCeti.Oracle.Single.Code.evalStage`, `TauCeti.Oracle.Single.Code.primrec_evalStage_list`).

**Checks.**
- The approximation "`x` has entered `K` by stage `s`" converges to the characteristic function of
  `K`, which is computable in `∅′` and not computable: a limit of a computable approximation without
  a modulus is not computable in general.

### 4.4 Functions of c.e. degree (L4.4)

Prove [S, III.3.4]: a total `f : ℕ → ℕ` has c.e. degree, that is, `f` (as the partial function
`n ↦ Part.some (f n)`) is Turing equivalent to `Set.oracle A` for some c.e. set `A`, iff `f` has a
computable approximation with a modulus computable in `f`. Prove the graph coding used to pass
between total functions and sets: a total `f` is Turing equivalent to its graph `{⟨x, f x⟩ : x ∈ ℕ}`.
*Needs:* L4.1, L4.2; L2.2 (`Set.oracle`).

### 4.5 Finite use against approximated oracles (L4.5)

Export the finite-use lemma that makes genuine computations in an approximated oracle eventually
visible: if increasing finite stages `A_s` have limit `A`, every value of a program relative to the
oracle of `A` is the output of a single run, with a fixed use, that succeeds against the answers of
`A_s` from some stage on, with fuel `t(s)` for any clock `t` tending to infinity; more generally for
answers converging pointwise (L0.3). Export the separate preservation lemma for stage computations
whose uses stay protected: under increasing stages, if a run against the answers of `A_s` succeeds
and no number below its use enters from stage `s` up to a later stage `t`, or after stage `s`, it
succeeds with the same output and use against the answers of `A_t`, or of the limit. These connect
the limit calculus to L6 to L9.
*In Tau Ceti:* `TauCeti.Oracle.Single.Code.exists_eventually_evaln_setAnswers_eq_some_of_mem_eval`,
`TauCeti.Oracle.Single.Code.eventually_evaln_eq_some_of_converges_of_tendsto`,
`TauCeti.Oracle.Single.Code.evaln_setAnswers_eq_some_of_forall_notMem_fresh`,
`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_forall_notMem_fresh`.

### Examples

- Finite-change approximations: each value changes finitely often, and the limit exists.
- The increasing approximation to `K`, whose limit is not computable (Check of L4.3).
- A bit that changes once and then stays changed: the approximation `s ↦ (x < s)` converges to
  `true`, and its moduli are exactly the functions `m` with `x < m(x)`.
- An eventually stable restraint with no supplied effective stabilization stage: each restraint of
  the low simple construction of L7 is eventually constant, and no computable bound on the
  stabilization stage is part of that statement.
- An everywhere computable modulus for the standard approximation to `K` would decide `K` (Check
  of L4.2).

### Dependencies

L0 and L1 (L4.2 uses c.e. oracles and the relative notions, L4.5 the stages and runs), L2.2 for set
oracles, L3.1 for the jump, and L3.2 for the `Δ⁰₂` form of L4.3. Mathlib: `ComputableIn`,
`TuringEquivalent`, `Filter.atTop`.

## L5: Diagonalization, simple sets, and finite-extension comparison

This layer is the diagonal material of [S, I.3, exercises on inseparability; V.1; VI.1]: computably
inseparable c.e. sets, immune and simple sets with Post's construction, and the Kleene–Post
construction of incomparable sets below `∅′`.

### 5.1 Computably inseparable c.e. sets (L5.1)

Call disjoint sets `A` and `B` computably inseparable when every computable set containing `A`
meets `B`. Prove that the relation is symmetric, passes to disjoint supersets, and that each member
of a computably inseparable pair is noncomputable. Construct disjoint c.e. computably inseparable
sets from the two diagonal output conditions: for `b ≠ b′` the fibres
`{e : φ_e(e) = b}` and `{e : φ_e(e) = b′}` of the diagonal function are disjoint, c.e. uniformly in
`b` (a computable map sends `b` to a code whose domain is the fibre over `b`), and computably
inseparable. The non-separation uses the actual enumeration of all computable functions: if a
computable `C` contained the fibre over `b` and missed the fibre over `b′`, the computable function
with value `b′` on `C` and `b` off `C` would be `φ_e` for some `e`, and `e` could lie neither in
`C` nor outside it. Export the pair's disjointness and c.e. indices, not only its existential
theorem.
*In Tau Ceti:* `Set.ComputablyInseparable`, `Set.ComputablyInseparable.symm`,
`Set.ComputablyInseparable.mono`, `Set.ComputablyInseparable.not_computablePred_left`,
`Set.ComputablyInseparable.not_computablePred_right`, `TauCeti.diagonalFiber`,
`TauCeti.disjoint_diagonalFiber`, `TauCeti.diagonalFiberCode`,
`TauCeti.computable_diagonalFiberCode`, `TauCeti.dom_eval_diagonalFiberCode_iff`,
`TauCeti.rePred_mem_diagonalFiber`, `TauCeti.computablyInseparable_diagonalFiber`,
`TauCeti.exists_computablyInseparable_rePred`.

### 5.2 Immune and simple sets (L5.2)

Define immune sets, the infinite sets with no infinite c.e. subset, and simple sets, with the
ordinary definition that `A` is c.e. and its complement is immune: infinite, with no infinite c.e.
subset. Prove that an infinite subset of an immune set is immune and that an immune set is not c.e.;
that a simple set has infinite complement, meets every infinite c.e. set and is not computable; and
the requirement characterization: a set of naturals is simple iff it is c.e., coinfinite, and meets
`W_e` for every `e` with `W_e` infinite.
*In Tau Ceti:* `Set.Immune`, `Set.Immune.mono`, `Set.Immune.not_rePred`, `Set.Simple`,
`Set.Simple.infinite_compl`, `Set.Simple.inter_nonempty`, `Set.Simple.not_computablePred`,
`Set.simple_iff_forall_code`.

Construct a simple set by effective positive requirements with the witness condition `x > 2e`
(Post's construction): the witness of `P_e` is the first element greater than `2e` in the
enumeration of `W_e`, a partial computable function of `e` defined exactly when `W_e` has an element
greater than `2e`, and the set is the range of the witness function. Prove that it is c.e., the
counting invariant that at most `n` of its elements are at most `2n` (an element up to `2n` is the
witness of some `P_e` with `e < n`, and each requirement has at most one witness), hence
coinfinitude, that it meets every infinite `W_e`, and that it is simple. Simplicity does not imply
incompleteness: no statement here derives Turing incompleteness from simplicity.
*In Tau Ceti:* `TauCeti.postWitness`, `TauCeti.partrec_postWitness`, `TauCeti.postWitness_spec`,
`TauCeti.postWitness_dom_iff`, `TauCeti.postSimpleSet`, `TauCeti.rePred_mem_postSimpleSet`,
`TauCeti.ncard_postSimpleSet_inter_Iic_le`, `TauCeti.infinite_compl_postSimpleSet`,
`TauCeti.inter_postSimpleSet_nonempty`, `TauCeti.simple_postSimpleSet`.

**Checks.**
- A cofinite c.e. set, such as `{x : x ≥ 1}`, meets every infinite c.e. set and is not simple: its
  complement is finite. A definition of simple sets that dropped the coinfinitude would make ℕ
  itself simple.

### 5.3 The Kleene–Post construction (L5.3)

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
oracle and does not give c.e. sets; the c.e. pair is L8. *Needs:* L0 and L2 (strings as oracle
answers, and the use principle, `TauCeti.Oracle.Single.Code.evaln`); L3.1 (`Set.jump`,
`Set.turingReducible_jump_of_recursiveIn`).

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
  L5.3).

### Dependencies

L0 to L2, and L3.1 for the Kleene–Post construction. Mathlib: `REPred`, `ComputablePred`,
`TuringReducible`, `Set.ncard`.

## L6: Injury sets, events, restraints, and finite-injury reasoning

This layer is public infrastructure: no definition in it is private to a particular construction or
defined retrospectively from the assertion that its proof succeeds [S, VII.1, pp. 111–113; VII.2,
pp. 118–120; VII.3, pp. 122–126].

### 6.1 The three injury objects (L6.1)

For any finite-stage sequence `A_s` and restraint data `r(e, s)`, define:

- the finite injury batch `J(e, s) = {x ∈ ΔA_s : r(e, s) = some b, x ≤ b}`, empty when the
  restraint is inactive;
- the event relation: `(s, x)` is an injury event of `e` iff `x ∈ J(e, s)`, describing injury at
  stage `s + 1`;
- the number set `I_e = ⋃ₛ J(e, s)` and the injury-stage set `S_e = {s + 1 : J(e, s) ≠ ∅}`.

Prove the membership equations (stage `0` is never an injury stage, and `s + 1 ∈ S_e` iff
`J(e, s) ≠ ∅`), the inclusion of each batch in the fresh entries and in `I_e`, the projections of
the events to the numbers (`I_e`) and to the stages (`S_e`), and monotonicity in the restraint (a
smaller active restraint has fewer injuries). Prove that if membership in the stages `A_s` and the
restraints `r(e, s)` are uniformly computable, then the event relation and `S_e` are uniformly
computable and `I_e` is uniformly c.e.; the number set is in general only uniformly c.e.
*In Tau Ceti:* `TauCeti.Priority.injuriesAt`, `TauCeti.Priority.injuryEvents`,
`TauCeti.Priority.injurySet`, `TauCeti.Priority.injuryStages`, `TauCeti.Priority.mem_injuriesAt`,
`TauCeti.Priority.mem_injuryEvents`, `TauCeti.Priority.mem_injurySet`,
`TauCeti.Priority.mem_injuryStages`, `TauCeti.Priority.succ_mem_injuryStages`,
`TauCeti.Priority.zero_notMem_injuryStages`, `TauCeti.Priority.injuriesAt_subset_fresh`,
`TauCeti.Priority.injurySet_eq_image`, `TauCeti.Priority.injuryStages_eq_image`,
`TauCeti.Priority.injuriesAt_mono`, `TauCeti.Priority.injurySet_mono`,
`TauCeti.Priority.computablePred_mem_injuryEvents`,
`TauCeti.Priority.computablePred_mem_injuryStages`, `TauCeti.Priority.rePred_mem_injurySet`.

Under increasing stages a number has at most one entry stage, so it injures `e` at most once.
Consequently, for each `e`, prove `I_e` finite ⟺ `S_e` finite ⟺ `∃ s₀ ∀ s ≥ s₀, J(e, s) = ∅`;
finitely many injury stages give finitely many injuring numbers and an injury-free tail with no
monotonicity. This equivalence is not assumed by the definitions. When `I_e` is finite and the
stages increase, prove `|S_e| ≤ |I_e|`.
*In Tau Ceti:* `TauCeti.Priority.injOn_snd_injuryEvents`,
`TauCeti.Priority.finite_injurySet_iff_finite_injuryStages`,
`TauCeti.Priority.finite_injurySet_of_finite_injuryStages`,
`TauCeti.Priority.finite_injuryStages_iff_eventually_eq_empty`,
`TauCeti.Priority.finite_injurySet_iff_eventually_eq_empty`, `TauCeti.Priority.ncard_injuryStages_le`.

A computation's use is exclusive and a restraint's protected interval is inclusive, so a restraint
equal to the use protects one more number than the computation reads. The weaker condition that no
entry falls strictly below the restraint is the use-prefix breach batch
`J^<(e, s) = {x ∈ ΔA_s : r(e, s) = some b, x < b}`, the injury batch of the shifted restraint that
is `some c` where `r(e, s) = some (c + 1)` and inactive where `r(e, s)` is `none` or `some 0`; its
number set `I^<_e`, stages and events are the corresponding objects, with the same membership,
projection and effectivity theory. It is a separate object, not a variant definition of `I_e`.
Prove `J(e, s) = J^<(e, s) ∪ J^=(e, s)`, where the boundary batch `J^=(e, s)` consists of the fresh
entries equal to the active restraint, that the two batches are disjoint, and that every breach is
an injury. Finite `I_e` implies finite `I^<_e`; the converse fails (L6.4, example 11). Eventual
boundedness of the restraint alone gives finite `I_e` as a number set: if from stage `s₀` on every
active restraint of `e` is at most `R`, then `I_e` is finite, with no monotonicity of the stages and
no bound on earlier restraint values; increasing stages then give an injury-free tail.
*In Tau Ceti:* `TauCeti.Priority.usePrefixRestraint`,
`TauCeti.Priority.mem_injuriesAt_usePrefixRestraint`, `TauCeti.Priority.boundaryInjuriesAt`,
`TauCeti.Priority.mem_boundaryInjuriesAt`,
`TauCeti.Priority.injuriesAt_usePrefixRestraint_union_boundaryInjuriesAt`,
`TauCeti.Priority.disjoint_injuriesAt_usePrefixRestraint_boundaryInjuriesAt`,
`TauCeti.Priority.injuriesAt_usePrefixRestraint_subset`,
`TauCeti.Priority.finite_injurySet_usePrefixRestraint_of_finite_injurySet`,
`TauCeti.Priority.finite_injurySet_of_eventually_bounded`,
`TauCeti.Priority.exists_forall_injuriesAt_eq_empty_of_eventually_bounded`.

Define the injuries through stage `n`, `⋃_{s<n} J(e, s)`. Prove that they increase with `n` and that
`x ∈ I_e` iff `x` lies in the injuries through some stage; extensionality, that the injury objects
of `e` depend only on the stages and on the restraint of `e` (equal stage data and equal restraints
of `e` give equal batches, events, numbers and stages); and that for increasing stages, finite
`I_e`, and at most one injuring entry at each stage, `|S_e| = |I_e|`. The general interface carries
no single-entry hypothesis. Cardinal bounds are stated together with finiteness: `Set.ncard` is zero
on an infinite set, and a bound on it alone would be vacuous. *Needs:* the injury objects above
(`TauCeti.Priority.injuriesAt`, `TauCeti.Priority.injurySet`, `TauCeti.Priority.injuryStages`,
`TauCeti.Priority.injOn_snd_injuryEvents`, `TauCeti.Priority.ncard_injuryStages_le`).

**Checks.**
- Two numbers entering at one stage under a restraint covering both give `|I_e| = 2` and `|S_e| = 1`
  (L6.4, example 4): the single-entry hypothesis is needed for equality.
- For stages that are not monotone, `0` entering at stage `1`, leaving, and entering again at stage
  `3` for good gives `I_e = {0}` under the restraint `some 0`, and `S_e = {1, 3}`, so
  `|S_e| ≤ |I_e|` fails without monotonicity even when both sets are finite.

### 6.2 Quantitative causes and multiple oracles (L6.2)

Prove the cause-counting result. Suppose every injuring entry of `e` is assigned to a
higher-priority contributor `i < e`, contributor `i` supplies at most `b_i` distinct entries, and the
assignment is certified for the actual entries: each number of `J(e, s)` lies in the contribution
set of some `i < e`. Then `I_e` is finite and `|I_e| ≤ ∑_{i<e} b_i`, with neither disjoint
contributions nor monotone stages required. In particular, if every higher-priority contributor
supplies at most one distinct number, `|I_e| ≤ e`; this specialization is used in L7 and in the
simple-set construction of L9.2. The assignment must account for the actual stage differences; a
ledger of contributions alone bounds nothing.
*In Tau Ceti:* `TauCeti.Priority.finite_injurySet_and_ncard_le_sum_of_causes`,
`TauCeti.Priority.finite_injurySet_and_ncard_le_of_subsingleton_causes`.

For several constructed sets, indexed by labels, parameterize the monitored oracle by a target map
from requirements to labels, and define the labelled injury events: the events of requirement `e`
in the stages of its target set, each carrying the label. Prove the membership equation; that
projecting the labelled events of `e` gives the unlabelled events of its target set; and that
restricting to an initial segment of priorities `{e : e < n}` commutes with this projection. The
label keeps an entry of a number in `A` distinct from an entry of the same number in `B`. A switch
of monitored oracle is a new proof obligation, not a reindexing of unlabelled numbers. In the
original Friedberg–Muchnik construction the requirements enumerate into one set and protect the
other: the target of `R_{2e}` is `B` and that of `R_{2e+1}` is `A`. *Needs:* L6.1
(`TauCeti.Priority.injuryEvents`).

### 6.3 Preservation, injury-free epochs, and initialization (L6.3)

Prove the direct telescope result: under increasing stages, if no element below `u` enters after
stage `s`, then the limit and `A_s` agree below `u`; combined with the use principle of L0.2, a run
against the answers of `A_s` then succeeds with the same output and use against the answers of the
limit. For moving restraints, the premise that the currently protected interval continues to cover
the recorded use is part of the statement, since absence of injuries alone does not imply it: under
increasing stages, if a run against the answers of `A_s` succeeds and at every later stage `e` is
not injured and every address below the use lies in the protected interval (the restraint is
`some b` with the address at most `b`), the run succeeds with the same output and use against the
answers of the limit. Prove the same for use-prefix breaches, where the live restraint `some b`
must exceed every queried address, so that every queried address lies strictly below it.
*In Tau Ceti:* `TauCeti.Enumeration.limit_agrees_of_no_fresh_below`,
`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_forall_notMem_fresh`,
`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty`,
`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_usePrefixRestraint_eq_empty`.

Model priority records as a finite list, one record per active priority, changed by updates: an
update at priority `e` keeps every record of strictly higher priority (locality), installs its own
record at position `e`, and resets every record of strictly lower priority (reset); a run applies
the update scheduled at each stage, if any. A requirement's attention stages are the stages after
which an update of its priority has been applied. Prove locality and reset for single updates and
runs, and the first reusable style of finite-injury reasoning: if each requirement receives
attention finitely often whenever every higher-priority requirement does, then every requirement
receives attention finitely often (priority induction), and every record eventually stops changing.
*In Tau Ceti:* `TauCeti.Priority.Update`, `TauCeti.Priority.Update.apply`,
`TauCeti.Priority.Update.getElem?_apply_of_lt`, `TauCeti.Priority.Update.take_apply_of_le`,
`TauCeti.Priority.Update.getElem?_apply_of_gt`, `TauCeti.Priority.run`,
`TauCeti.Priority.attentionStages`, `TauCeti.Priority.finite_attentionStages_of_local`,
`TauCeti.Priority.exists_forall_getElem?_run_eq_of_finite`,
`TauCeti.Priority.exists_forall_getElem?_run_eq_of_local`.

Define the initialization stages of requirement `e` under the blanket-reset convention, the stages
at which some requirement of strictly higher priority acts, and, for a strategy that uses them, its
epochs, the intervals between consecutive initialization stages. Prove that if every requirement of
higher priority than `e` acts finitely often, `e` is initialized finitely often, so its last epoch
is infinite. Prove locality for injuries: an entry above every current higher-priority restraint
injures no higher-priority requirement, so respecting those restraints prevents the relevant
injuries. The construction's own rule that a higher-priority attention event resets lower-priority
records is a separate statement, and an initialization may occur with no new number entering a
protected interval. *Needs:* the records and priority induction above
(`TauCeti.Priority.attentionStages`, `TauCeti.Priority.finite_attentionStages_of_local`,
`TauCeti.Priority.Update`, `TauCeti.Priority.run`,
`TauCeti.Priority.exists_forall_getElem?_run_eq_of_local`); L6.1.

The second reusable style of finite-injury reasoning: finite injury to a negative requirement,
together with the preservation equations of its computations and a hypothesis on its target, gives
satisfaction and stabilization of its restraint, with no finite set of discrete attention events.
It is needed by Sacks's changing agreement-length restraints, and is stated precisely, and proved,
for the agreement restraint in L9.1 (Lemma 1 and the stabilization theorem). Each lemma states the
premises it uses: the general interface asks for no computable bound on injuries and no effective
stabilization stage, and stabilization of an idle strategy is not a satisfaction theorem.

### 6.4 Mandatory boundary examples (L6.4)

Prove, as concrete mathematical examples:

1. With an inactive restraint a fresh entry at `0` is not an injury; with `some 0` it is.
2. A fresh entry exactly at an active restraint is an injury: under `some 1`, an entry `1` gives
   `I_e = {1}`.
3. An entry at the exclusive use boundary leaves the computation intact although it is a
   conservative injury: with `1` entering under the restraint `some 1`, the strings of length one of
   the stage and of the limit agree, so a computation of use `1` is preserved.
4. Two distinct injuring numbers at one stage contribute two numbers and one injury stage:
   `I_e = {0, 1}` and `S_e = {1}`.
5. Without monotonicity, repeated entry and removal of `0` under the restraint `some 0` gives
   `I_e = {0}` and infinitely many injury stages.
6. A lower-priority reset can occur without any injury to the protected oracle: requirement `0` acts
   once and initializes requirement `1` at stage `1`, while no number ever enters.
7. Finite injury alone does not force an arbitrary restraint to stabilize: with no entries and the
   growing restraint `r(e, s) = some s`, `I_e = ∅` and the restraint is never constant.
8. Absence of injury to a restraint that later drops does not preserve an earlier use it no longer
   covers: the restraint `some 1` at stage `0` and `none` afterwards, with `0` entering at stage `2`,
   give `I_e = ∅` while the string of length one changes.
9. A discovery against a fixed oracle is persistent; a discovery against a moving oracle can fail:
   the query program on input `0` outputs `0` against the stage `∅` and `1` once `0` has entered.
10. An event in one oracle cannot discharge the matching event claim for another: if `5` enters `A`
    and not `B`, the labelled event of `5` in `A` is present and the one in `B` is not.
11. Boundary-only injuries under a growing restraint can be infinite with no use-prefix breach:
    with `A_s = {0, …, s − 1}` and `r(e, s) = some s`, every number is an injury and no entry lies
    strictly below the restraint. Finitely many use-prefix breaches do not give finite injury
    without control of the restraint.
12. A uniformly c.e. family of finite injury-number sets need not be uniformly computable: for the
    standard enumeration of `K`, stage `s` being `{e < s : Φ_{e,s}(e)↓}`, and the restraint
    `r(e, s) = some e`, `I_e = K ∩ [0, e]`, and the diagonal query `e ∈ I_e` would decide `K`.

*Needs:* L6.1 to L6.3; L0.1 for examples 3, 8 and 9; L1.2 for the enumeration of `K` in example 12.

### Examples

The twelve boundary cases of L6.4 are the examples of this layer. Two more, from the constructions:
in the low simple construction of L7 every injury of `N_e` comes from a positive requirement `P_i`
with `i < e`, each acting at most once, so the one-entry form of the cause count of L6.2 gives
`|I_e| ≤ e`; in Sacks splitting (L9.3) the injuries of a pair are finite but admit no computable
bound.

### Dependencies

Finite data only for the injury objects (L6.1, L6.2); L0 and L1 for the preservation statements of
L6.3 and for some of the examples. Mathlib: `Set.Finite`, `Set.ncard`, `Finset`.

## L7: Low simple sets

This layer is Soare's first finite-injury construction, a simple set whose jump is Turing
equivalent to `∅′` [S, VII.1.1–2].

### 7.1 Requirements, restraints and the stage transition (L7.1)

Use the positive requirements `P_i` for simplicity, `P_i`: if `W_i` is infinite then `A` meets
`W_i`, with `W_{i,s}` the canonical stages of L1.2; and the negative requirements `N_e`, which turn
infinitely recurrent convergence of the diagonal computation `Φ^{A_s}_{e,s}(e)` into true
convergence of `Φ^A_e(e)`, in the priority order `N_0, P_0, N_1, P_1, …`. Here `Φ^{A_s}_{e,s}(e)` is
the raw run of L0.1 of program `e` on input `e` with fuel `s` against the answers of the finite set
`A_s`. The stages start empty, `A_0 = ∅`. At the transition to stage `s + 1` the restraint of `N_e`
is the current use, `r(e, s) = some u` with `u` the stage use of `Φ^{A_s}_{e,s}(e)`, including
`some 0` when no convergence has been found, which still protects `0`. `P_i` requires attention with
the witness `x` when `W_{i,s}` is disjoint from `A_s`, `x ∈ W_{i,s}`, `x > 2i`, and `x > r(e, s)` for
every `e ≤ i`. The least `i` that requires attention, necessarily `i < s`, enumerates its least
witness, and nothing else enters, so at most one number enters at each stage.

Prove that the stage transition is computable, with the binary codes of the stages (L0.1) primitive
recursive in `s`, so that the limit `A` is c.e.; that the stages increase, and a number enters at
stage `s + 1` exactly when it is the witness of the action at stage `s`; and that each positive
requirement acts at most once, so the numbers it enumerates form a set with at most one element, all
greater than `2i`. *Needs:* L0.1 (raw runs, stage use, binary codes of finite sets), L1.2 (the
canonical stages `W_{i,s}`, limits of stages and the presentation of c.e. sets by stages).
*In Tau Ceti:* `TauCeti.LowSimple.diagRun`, `TauCeti.LowSimple.diagUse`,
`TauCeti.LowSimple.RequiresAttention`, `TauCeti.LowSimple.requiresAttention_iff`,
`TauCeti.LowSimple.attention`, `TauCeti.LowSimple.attention_eq_some_iff`, `TauCeti.LowSimple.stage`,
`TauCeti.LowSimple.restraint`, `TauCeti.LowSimple.restraint_eq`, `TauCeti.LowSimple.monotone_stage`,
`TauCeti.LowSimple.mem_fresh_stage`, `TauCeti.LowSimple.primrec_stage`,
`TauCeti.LowSimple.eq_of_attention_eq_some`, `TauCeti.LowSimple.subsingleton_enumeratedBy`,
`TauCeti.LowSimple.lt_of_mem_enumeratedBy`, `TauCeti.lowSimpleSet`,
`TauCeti.lowSimpleSet_eq_stageLimit`, `TauCeti.rePred_mem_lowSimpleSet`.

### 7.2 Finite injury, preservation and simplicity (L7.2)

Prove the actual injury attribution: every number injuring `N_e` at stage `s + 1`, an entry at or
below `r(e, s)`, is the witness of some `P_i` with `i < e` acting at stage `s`; with the one-entry
cause count of L6.2 this gives that `I_e` is finite with `|I_e| ≤ e`. Prove finite injury before
extracting an injury-free stage. Then prove preservation of convergent computations: if
`Φ^{A_s}_{e,s}(e)` converges and nothing injures `N_e` at stage `s + 1`, then
`Φ^{A_{s+1}}_{e,s+1}(e)` converges with the same output and use; hence, after the last injury, the
diagonal computations of `N_e` are eventually constant (eventually divergent forever, or convergent
with a fixed output and use), and the restraint `r(e, s)` stabilizes. Use that stabilization to
discharge every `P_i`: once the restraints of `N_0, …, N_i` and the actions of `P_0, …, P_{i−1}`
have settled, `P_i` acts if `W_i` is infinite and still disjoint from `A`, so `A` meets every
infinite `W_i`.

The counting invariant `|A ∩ [0, 2n]| ≤ n` holds, since an element up to `2n` is the witness of some
`P_i` with `i < n`; it gives coinfinitude. Establish all the properties of a simple set (L5.2)
rather than treating the list of requirements as their definition: `A` is c.e., coinfinite, and
meets every infinite c.e. set, so `A` is simple. *Needs:* L7.1; L6.1 and L6.2 (injury sets, the
finiteness criteria and the one-entry cause count); L0.2 (the use principle); L1.2 (finite-prefix
stabilization); L5.2 (the requirement characterization of simple sets).
*In Tau Ceti:* `TauCeti.LowSimple.exists_lt_of_mem_injuriesAt`,
`TauCeti.LowSimple.finite_injurySet_and_ncard_le`, `TauCeti.LowSimple.diagRun_succ_eq_some`,
`TauCeti.LowSimple.exists_eventually_diagRun_eq`, `TauCeti.LowSimple.exists_eventually_restraint_eq`,
`TauCeti.ncard_lowSimpleSet_inter_Iic_le`,
`TauCeti.infinite_compl_lowSimpleSet`, `TauCeti.inter_lowSimpleSet_nonempty`,
`TauCeti.simple_lowSimpleSet`.

### 7.3 Lowness and the degree of the low simple set (L7.3)

Define the computable bit approximation `g(e, s) = 1` iff `Φ^{A_s}_{e,s}(e)` converges, and `0`
otherwise; it tests convergence, not the use, so use zero is not mistaken for divergence. Prove its
pointwise eventual agreement with the characteristic function of `A′`: after stabilization,
convergence of the diagonal stage computation is exactly membership of `e` in the jump of the limit,
finite-prefix stabilization (L1.2) identifying the stable runs with computations against `A`, so
that a transient computation supplies no false positive. No computable stabilization bound is
asserted. Apply the Limit Lemma (L4.3) to obtain `A′ ≤_T ∅′`; the reverse reduction `∅′ ≤_T A′`
always holds (L3.1), so `A` is low. Export an ordinary program whose domain is the constructed set,
simple and low, and the intermediate-degree corollary `∅ <_T A <_T K`: in Mathlib's degree quotient
the degree of `A` lies strictly between the degree of `∅` and that of `∅′`. *Needs:* L7.2; L3.1
(the jump and low sets); L4.1 and the first part of L4.3; L0.3 (moving oracles); L2.2 (set oracles
and the bottom degree).
*In Tau Ceti:* `TauCeti.LowSimple.jumpApproximation`, `TauCeti.LowSimple.primrec₂_jumpApproximation`,
`TauCeti.LowSimple.eventually_isSome_diagRun_iff_mem_jump`,
`TauCeti.LowSimple.converges_jumpApproximation`, `TauCeti.low_lowSimpleSet`,
`TauCeti.exists_simple_low_code`, `TauCeti.degree_lowSimpleSet_mem_Ioo`.

### Examples

- The number `0` never enters the low simple set: every witness of `P_i` exceeds `2i ≥ 0`. More
  generally at most `n` of the numbers `0, …, 2n` enter, the reservoir that keeps the complement
  infinite.
- If program `e` makes no query and halts on input `e`, the bit approximation `g(e, s)` is `1` for
  all sufficiently large `s`, whatever the stages; if program `e` never halts on input `e` against
  any oracle, `g(e, s) = 0` for every `s`. The approximation converges to the characteristic function
  of `A′` without a computable modulus.
- A requirement `P_i` with `W_i` finite may never act, and asks nothing: simplicity concerns only the
  infinite `W_i`.

### Dependencies

L0 (raw runs and the use principle), L1 (finite stages, their limits and the canonical stages of
`W_i`), L3.1 (the jump and low sets), L4 (convergence and the first part of the Limit Lemma), L5
(simple sets) and L6 (injury sets and the cause count). Mathlib: `REPred`, `Primrec`, `Set.ncard`,
`TuringDegree`.

## L8: The original Friedberg–Muchnik construction

This layer builds the c.e. pair of [S, VII.2.1] by the original witness-and-restraint construction.
Deriving the existence of incomparable c.e. sets only from Sacks splitting (L9.4) does not supply the
stages, witnesses and injury interfaces asked for here, so the construction itself is the target.

### 8.1 Requirements, witnesses and the stage transition (L8.1)

Use the requirements `R_{2e} : A ≠ Φ^B_e` and `R_{2e+1} : B ≠ Φ^A_e` (Convention 13), each with its
own infinite column of potential witnesses (L2.2), restraints that are inactive until set, and least
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
restraint, and the actual injury events, as the labelled events of L6.2 with targets `B` for
`R_{2e}` and `A` for `R_{2e+1}`. *Needs:* L2.2 (columns), L2.3, L6.2, L6.3; L0.1
(`TauCeti.Oracle.Single.Code.evalStage`); L1.2 (`TauCeti.Enumeration.stageLimit`,
`TauCeti.Enumeration.rePred_iff_exists_stages`); L6.1 (`TauCeti.Priority.injuryEvents`).

### 8.2 Priority induction and the injury bound (L8.2)

Prove by induction on the priority that each requirement eventually has a permanent witness and acts
at most once after every higher-priority requirement has stopped acting. Prove the quantitative
bound of the original convention: requirement `R_i` acts at most `2^i` times, since it acts at most
once between consecutive initializations, so the number of injuries to `R_e` is at most the number
of higher-priority actions, `∑_{i<e} 2^i = 2^e − 1`, and in particular finite. An implementation
with auxiliary bookkeeping actions relates them to the mathematical attention events before quoting
this bound. *Needs:* L8.1; L6.3 (`TauCeti.Priority.finite_attentionStages_of_local`); L6.2
(`TauCeti.Priority.finite_injurySet_and_ncard_le_sum_of_causes`).

**Checks.**
- Higher-priority actions can outnumber the higher-priority requirements: `R_1` acts, `R_0` then acts
  and initializes it, and `R_1` acts again with a new witness, three actions above `R_2`. A count
  allowing one action per requirement would give `e`; the bound counts actions, `2^e − 1`, which is
  `0`, `1` and `3` for `e = 0, 1, 2`.

### 8.3 The Friedberg–Muchnik theorem (L8.3)

Prove satisfaction of each requirement in both cases: when a computation of `0` at the permanent
witness is permanently preserved, so the witness is in its own set while the opposite oracle's
functional gives `0`; and when no such computation appears after stabilization, so the witness stays
out while the functional does not give `0` there. Use the adequacy of the programs (L0.2) to quantify over every
Mathlib oracle reduction. Conclude `friedberg_muchnik`: there are c.e. sets `A`
and `B` with `A ≰_T B` and `B ≰_T A`; and derive that both degrees are nonzero (a computable set
reduces to every set) and below `0′`, that is `∅ <_T A <_T ∅′` and `∅ <_T B <_T ∅′`.
*Needs:* L8.1, L8.2; L3.1 (`Set.turingReducible_jump_of_recursiveIn`); L2.2
(`Set.empty_turingReducible`); L0.2 (`TauCeti.Oracle.Single.Code.turingReducible_iff_exists_code`);
L6.3 (`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty`).

### Examples

- If `Φ_e` ignores its oracle and returns `1` everywhere, `R_{2e}` never requires attention and is
  satisfied because its witness stays out of `A` while `Φ^B_e` gives `1` there.
- If `Φ_e` ignores its oracle and returns `0` everywhere, `R_{2e}` acts once its witness has been
  appointed and the stage bound admits the computation; after the higher priorities have stopped
  acting, its last witness enters `A` while `Φ^B_e` gives `0` there, whatever `B` becomes, since the
  computation makes no query.

### Dependencies

L0 (programs, stage evaluation and adequacy), L1 (enumeration stages), L2 (columns and searches)
and L6 (labelled injury events, preservation and priority induction), and L3.1 for the degree
corollary.

## L9: Agreement preservation and low Sacks splitting

This layer implements [S, VII.3.1–7]. Tau Ceti has the length of agreement and the agreement
restraint of a raw run with fuel against a target function (`TauCeti.Oracle.Single.Code.agreementLength`,
`TauCeti.Oracle.Single.Code.agreementRestraint`), with their preservation under a change of answers
above the restraint, their persistence over an interval of stages on which neither the answers
at or below the restraint nor the target below the length change, and one-step preservation of
computations and of agreement when no injury occurs (supplier contracts). Soare's `ℓ(e, s)` and
`r(e, s)` use the stage evaluation of Convention 9 instead, with its bound on the index; the finite
searches of L9.3 depend on that bound.

### 9.1 Length of agreement and its restraint (L9.1)

For a c.e. target `C` and a constructed set `A` with stages `C_s` and `A_s`, define the stage
agreement `stageAgreesAt` (the stage computation `Φ^{A_s}_{e,s}(x)`, Tau Ceti's `evalStage` of
program number `e` against the answers of `A_s`, converges with output `C_s(x)`), the length of
agreement `ℓ(e, s)` (`stageAgreementLength`), the first argument at which the stage computation is
absent or differs from `C_s`, and the restraint `r(e, s) = max {u(A_s; e, x, s) : x ≤ ℓ(e, s)}`
(`stageAgreementRestraint`, with `sacksRestraint` its active form `some r(e, s)`), where the stage
use of a divergent computation is `0`. The upper index is inclusive: the restraint protects any
convergent computation at the first disagreement as well as the computations at smaller arguments.
Prove:

- `ℓ(e, s) ≤ s`, every argument below `ℓ(e, s)` agrees, and `ℓ(e, s)` does not: Soare's stage
  bound makes the search end at the latest at `s`;
- every stage use at an argument up to and including `ℓ(e, s)` is at most `r(e, s)`;
- `ℓ` and `r` are computable uniformly in `(e, s)` from computable stages of `A` and `C`;
- one-step preservation: if the stages of `A` increase, `x ≤ ℓ(e, s)`, the stage computation at `x`
  converges with output `y` and use `u`, and no element enters `A` at stage `s + 1` at or below the
  restraint `r(e, s)` read at stage `s`, then the stage-`(s + 1)` computation at `x` converges with
  the same output and use; this needs no hypothesis on `C`, and agreement at `x` is preserved as
  well when in addition `C_{s+1}(x) = C_s(x)`;
- if the stages of `A` and `C` increase and `Φ^A_e = C` for the limits, the agreement length tends
  to infinity;
- on an injury-free interval, the simultaneous preservation equations of the Remark in [S, VII.3,
  p. 122], and the stable-disagreement alternative;
- [S, VII.3.1, Lemma 1] (`nonreduction_of_finite_sacks_injury`): if `A` and `C` are enumerated by
  computable increasing finite stages, `C` is not computable, and the injury set of `e` for the
  restraint `r` is finite, then `Φ^A_e ≠ C`. If `Φ^A_e = C`, arbitrarily long agreement after the
  last injury lets a computable search decide `C`; the last injury stage is not computed from the
  data, it is a fixed number in the existence proof of the decision procedure;
- stabilization (`sacks_agreement_and_restraint_stabilize`): if the stages of `A` and `C` increase,
  the injury set of `e` is finite and `Φ^A_e ≠ C`, then `ℓ(e, s)` and `r(e, s)` are eventually
  constant; with Lemma 1, finite injury alone gives an eventually constant restraint when `C` is not
  computable.

To iterate preservation across an interval, the live restraint must continue to cover the recorded
use, as in L6.3, or that coverage must be proved from the construction's invariants: absence of
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
*Needs:* L0 (stage evaluation and the use principle, `TauCeti.Oracle.Single.Code.evalStage`); L6.1
(`TauCeti.Priority.injuriesAt`, `TauCeti.Priority.injurySet`,
`TauCeti.Priority.finite_injurySet_iff_eventually_eq_empty`); L1.2
(`TauCeti.Enumeration.finite_prefix_stabilizes`); L4.5
(`TauCeti.Oracle.Single.Code.exists_eventually_evaln_setAnswers_eq_some_of_mem_eval`); L6.3
(`TauCeti.Oracle.Single.Code.evaln_setAnswers_stageLimit_eq_some_of_injuriesAt_eq_empty`).

**Checks.**
- Let `Φ_e` return `0` at input `0` without queries and return the oracle's answer at `1` at input
  `1`, diverging elsewhere, with `A` and `C` empty at first. Then `ℓ = 2`, the stage uses at `0`,
  `1`, `2` are `0`, `2`, `0`, and `r = 2` protects position `1`. When `0` enters `C`, `ℓ` drops to
  `0` and `r` to `0`, and `1` can then enter `A` without injury, changing the computation at `1`
  although `C(1)` never changed: absence of injury does not preserve computations across a drop.
- If the restraint took the maximum only over `x < ℓ(e, s)`, a convergent computation with a wrong
  output at the first disagreement would be unprotected; it could be injured and later agree, so the
  disagreement that witnesses `Φ^A_e ≠ C` would not be preserved.

### 9.2 A simple set avoiding a prescribed noncomputable c.e. cone (L9.2)

Prove `exists_simple_avoiding` [S, VII.3.1]: for a c.e. set `C` that is not computable there is a
simple set `A` with `C ≰_T A`. Build `A` with the positive requirements `P_i` (`A` meets `W_i` when
`W_i` is infinite) and the negative requirements `N_e : C ≠ Φ^A_e`, the restraint of L9.1, and the
simple-set witness bounds: `P_i` enumerates the least `x` in `W_{i,s}` with `x > 2i` and
`x > r(e, s)` for every `e ≤ i`, if `P_i` is not yet met. Prove, in this order, finite injury
(`|I_e| ≤ e`, each `P_i` acting at most once, by the one-entry cause count of L6.2),
nonreduction (Lemma 1), stabilization of the restraints (L9.1), and satisfaction of every `P_i`.
Export both an index for the constructed set and its simplicity and cone avoidance. This is a client
of L9.1, not a premise of its generic preservation lemmas. *Needs:* L9.1; L6.2
(`TauCeti.Priority.finite_injurySet_and_ncard_le_of_subsingleton_causes`); L5.2 (`Set.Simple`,
`Set.simple_iff_forall_code`).

### 9.3 Splitting an arbitrary c.e. set (L9.3)

Take an enumeration of `B` by computable increasing finite stages starting empty, serialized with
pauses or in batches; build disjoint increasing finite stages of `A_0` and `A_1`, assigning every
fresh element of `B` to exactly one side. For each negative requirement `N_{(e,i)} : C ≠ Φ^{A_i}_e`
protect the computations of `Φ^{A_i}_e` against `C` with the restraint `r^i(e, s)` of L9.1 computed
from the stages of `A_i`, ordering the pairs by `2e + i`. Put a fresh element `x` on the side
opposite the highest-priority pair with `x ≤ r^i(e, s)`, and on side `0` if there is no such pair
[S, VII.3, p. 125]. The routing test is the inclusive inequality of the injury set, and each fresh
element is routed separately against the stage-`s` restraints, so the transition also applies to
batched enumerations; empty and finite `B` need no separate case.

The search for the highest-priority threatened pair is finite. At stage `s` no index `e ≥ s` has a
convergent stage computation, so `ℓ^i(e, s) = 0` and `r^i(e, s) = 0`. A positive `x` is therefore
threatened only by pairs with `e < s`, and `x = 0` is threatened by the pair `(s, 0)` at the latest.
In both cases the least threatened pair, if any, has `e ≤ s`, and the search runs over `e ≤ s` and
`i ≤ 1` (`pairsThrough` and the selection `leastThreat` of L2.3). Prove that this search finds the
highest-priority threatened pair among all pairs, and finds none only when no pair is threatened.
The side is `routeSide`, and the stages of the halves are `sacksSplit`. Prove:

- the halves are disjoint with union `B_s` at every stage, and their stages are computable;
- by induction on the priority `2e + i`, the three statements of [S, p. 125]: `I^i_e` is finite,
  `C ≠ Φ^{A_i}_e`, and `r^i(e, s)` converges, together with the convergence of `ℓ^i(e, s)` that the
  lowness proof uses. For finite injury, the higher-priority restraints
  converge by the induction hypothesis, so from some stage on they are all at most a number `r`; an
  element entering `A_i` with `x ≤ r^i(e, s)` is threatened by `(e, i)`, so it was routed by a
  higher-priority pair of the other side, and hence `x ≤ r`; once `B` has settled at and below `r`,
  no such element enters. Nonreduction and convergence of `r^i(e, s)` then follow from L9.1. There is
  in general no computable bound on `|I^i_e|` [S, p. 126], and none is assumed.

Prove lowness of both halves by the agreement-length test of [S, pp. 125–126]. Supply the probe
compiler as a reusable index construction, uniform in a bit given as data: a computable
`g : {0, 1} × ℕ → ℕ` such that for every oracle `X` and all `b, e, x, y`, `y` is a value of
`Φ^X_{g(b,e)}` at `x` iff `x = 0`, `Φ^X_e(e)` converges, and `y = b`. The program waits for the
diagonal computation, returns `b` at input `0`, and diverges at every positive input. For the fixed
target take `b = C(0)`. The probe's agreement length on `A_i` then settles at exactly `1` when
`Φ^{A_i}_e(e)` converges, since the output at `0` agrees and the probe diverges at `1`, and at `0`
when it diverges, by the divergent first-disagreement argument of L9.1. So `h_i(e, s) = 1` iff
`ℓ^i(g(b, e), s) > 0` is computable, by the computability of the agreement length, and converges to
the characteristic function of the jump of `A_i`; the Limit Lemma then gives `A_i′ ≤_T ∅′`. Conclude
`sacksSplit_spec` for the constructed halves and `sacks_splitting` [S, VII.3.2]: for c.e. `B` and
`C` with `C` not computable there are low c.e. sets `A_0`, `A_1` with `B = A_0 ∪ A_1`,
`A_0 ∩ A_1 = ∅` and `C ≰_T A_i` for `i = 0, 1`; there is no infinitude hypothesis on `B`.

The existence proof specializes the compiler to `C(0)`; it does not claim to compute that bit
uniformly from an arbitrary c.e. index for `C`. No computable operation extracts `C(0)` from a c.e.
index, even under the promise that `C` is not computable: the uniformly c.e. sets
`C_e = {2n + 1 : n ∈ K} ∪ ({0} if e ∈ K)` are all noncomputable, and `0 ∈ C_e` iff `e ∈ K`. This
rules out only that operation, not every uniform form of the lowness reductions.

Provide total computable output-index maps `f_0`, `f_1` on input enumeration indices `b`, `c`,
identified with the construction above: run on the canonical stages of `W_b` and `W_c`, the stages
`Nat.Partrec.Code.domStage` of the ordinary programs numbered `b` and `c`, the halves satisfy
`W_{f_i(b,c)} = ⋃ₛ A_{i,s}` for all `b` and `c`, with no noncomputability premise, and the stage
table is computable in `(b, c, s, i)` (`sacks_splitting_uniform_indices`). Computability of the
stages for each fixed pair of approximations does not by itself give an operator on indices. The
unconditional facts are kept apart from the promised ones (`sacksSplit_W_spec`): for all `b` and `c`
the halves are disjoint with union `W_b`; when `W_c` is not computable they are low and neither
computes `W_c`. No uniform indices for the lowness reductions are promised. The canonical stages
enumerate in batches, which the per-element routing handles. *Needs:* L9.1, L2.3; L1.2
(`TauCeti.Enumeration.stageLimit`, `TauCeti.Enumeration.fresh`, `Nat.Partrec.Code.domStage`); L4.3
(`TauCeti.Approximation.Converges.turingReducible_jump_empty`); L3.1 (`Set.Low`, `Set.jump`);
Mathlib `ComputablePred.halting_problem`.

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

### 9.4 Connective corollaries (L9.4)

Apply the split reductions of L2.4, not subset inclusion, to prove [S, VII.3.3–7]:

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
*Needs:* L9.3; L2.4 (`Disjoint.turingReducible_union_left`, `Disjoint.turingReducible_union_right`,
`Disjoint.turingEquivalent_union_join`); L3.1 (`Set.not_low_jump`); L2.2 (`Set.join`).

### Examples

- Splitting the empty set, a singleton and an infinite computable set against a fixed noncomputable
  c.e. target: the halves of the empty set are empty, the singleton goes to one side, and the halves
  of a computable set are low.
- Splitting the low simple set of L7: both halves are low and c.e., and their join is Turing
  equivalent to the low simple set.
- Splitting `K`: both halves are low, and their join, Turing equivalent to `K`, is not low.
- Splitting relative to a target different from the set being split, for instance `B` the even
  numbers of `K` and `C = K`: neither half computes `K`.

### Dependencies

L0 (stage evaluation and use), L1 (enumeration stages) and L6 (the injury calculus); L5 for cone
avoidance (L9.2); L2 (the split reductions and searches), L3.1 (the jump and low sets) and L4 (the
Limit Lemma) for splitting with low halves and its corollaries. The examples that split the low
simple set use L7. Mathlib: `REPred`, `ComputablePred`, `TuringReducible`.

## Scope and ownership

**This roadmap owns** the material of the layers above: oracle programs, their raw runs and stage
evaluation with use, the coding of finite data, the use principle, query substitution and
simultaneous preservation, adequacy in both directions, the universal program, s-m-n and fixed
points uniform in the oracle, the failure of uniformity, staged discovery against fixed and moving
oracles, and earliest-discovery racing (L0); relative c.e. and relative computable predicates,
finite stages and their limits, the presentations and closure of c.e. sets, and serialization (L1);
padding and the relative recursion theorems, Turing reducibility of sets with its degree
statements, the parity join and the join of partial functions, complement and presentation
invariance, columns, least-witness search and finite-priority selection, and the reductions of
disjoint c.e. splittings (L2); the concrete jump and its iterates, low sets, the completeness of the
jump in the relative vocabulary (L3.1), and the arithmetical hierarchy with its normal forms and
codes, Post's theorem with strictness, and the index sets `TOT`, `FIN`, `INF` (L3.2); convergence and
moduli, relativized moduli, the Modulus Lemma, the Limit Lemma with its characteristic-function and
`Δ⁰₂` forms, the functions of c.e. degree, and the finite-use lemmas (L4); computably inseparable
c.e. sets, immune and simple sets with Post's construction, and the Kleene–Post construction (L5);
the injury calculus with its use-prefix and boundary forms, cause counting, labelled events,
preservation, priority records and induction, initialization and epochs, and the boundary examples
(L6); the low simple set (L7); the original Friedberg–Muchnik construction (L8); and Soare's length
of agreement for stage computations, Lemma 1 and stabilization, cone avoidance, splitting with low
halves with uniform output indices, and the connective corollaries (L9). The scope covers the
set-level and degree-level corollaries, explicit construction indices where uniformity is
specified, and the examples above. Every item the pinned Tau Ceti realises stays in its layer with
its statement and names the realising declarations on its *In Tau Ceti:* line.

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
least-witness search obtains it from the modules here. The low simple construction (L7), the
original Friedberg–Muchnik construction (L8) and Sacks's constructions (L9) share the oracle, use
and injury infrastructure without importing one another's construction proofs. No external project
is a dependency of the delivered library: every dependency is Mathlib, Tau Ceti, or a layer above.

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
  `TuringReducible.refl`, `TuringReducible.trans`, and `TuringDegree`, the antisymmetrization of
  `TuringReducible` on `ℕ →. ℕ`, with its partial order (`Mathlib/Computability/TuringDegree.lean`).
- `Finset.equivBitIndices`, the bijection between ℕ and finite sets of naturals by binary
  expansion (`Mathlib/Combinatorics/Colex.lean`); `Set.Finite`, `Set.Infinite`, `Set.ncard` (zero
  on infinite sets); `Filter.atTop`; `List.find?`; `Antisymmetrization` and `toAntisymmetrization`.

### From Tau Ceti

The declarations realising this roadmap's own items are named in the layers, on the *In Tau Ceti:*
line of each item; every one of them is proved at the pin. Besides them the roadmap consumes these
general helpers of Tau Ceti's computability library (paths under `TauCeti/Computability/`), each
proved at the pin:

- *Finite data and searches* (`Primrec/List.lean`, `RE.lean`, `RecursiveIn.lean`):
  `Primrec.list_find?` (the first element of a list satisfying a primitive recursive test is
  primitive recursive); `ComputablePred.and`, `ComputablePred.exists_lt` (computable predicates are
  closed under conjunction and bounded existential quantification) and
  `ComputablePred.rePred_exists` (the projection of a computable relation is c.e.);
  `Nat.RecursiveIn.cond`, `Nat.RecursiveIn.rfind'` (definition by cases and unbounded search
  preserve recursiveness in an oracle) and `ComputableIn₂.iff_nat`.
- *Sets of naturals as oracles* (`TuringDegree.lean`): `Set.union_turingReducible` (if `A` and `B`
  are Turing reducible to an oracle, so is `A ∪ B`).
- *Limits of stages* (`Enumeration/Converges.lean`): `TauCeti.Enumeration.converges_indicator_stageLimit`
  (under increasing stages the indicator functions of the stages converge to that of the limit).
- *Length of agreement of raw runs* (`SingleOracle/Agreement.lean`, `Priority/Agreement.lean`),
  the raw-fuel counterpart of Soare's length of agreement of L9.1, which uses stage evaluation:
  `TauCeti.Oracle.Single.Code.AgreesAt`, `TauCeti.Oracle.Single.Code.agreementLength`,
  `TauCeti.Oracle.Single.Code.agreementRestraint` for raw runs with fuel against a target function;
  `TauCeti.Oracle.Single.Code.le_agreementLength_iff`, `TauCeti.Oracle.Single.Code.agreementLength_le`,
  `TauCeti.Oracle.Single.Code.not_agreesAt_of_le`, `TauCeti.Oracle.Single.Code.use_le_agreementRestraint`
  (every use at an argument up to and including the length is at most the restraint),
  `TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn_agreementRestraint` (preservation of those
  computations under a change of answers above the restraint) and
  `TauCeti.Oracle.Single.Code.evaln_eq_some_of_forall_Ico` (persistence over an interval of stages on
  which neither the answers at or below the restraint nor the target below the length change);
  `TauCeti.Oracle.Single.Code.evaln_succ_eq_some_of_injuriesAt_eq_empty` and
  `TauCeti.Oracle.Single.Code.agreesAt_succ_of_injuriesAt_eq_empty` (one-step preservation of
  computations, and of agreement where the target does not change, when no injury occurs).

## References

- **[S]** R. I. Soare, *Recursively Enumerable Sets and Degrees: A Study of Computable Functions and
  Computably Generated Sets*, Perspectives in Mathematical Logic, Springer, 1987. Locators are to
  chapter and section numbers and to printed pages. The scope is drawn from Chapters I–IV, V.1,
  VI.1 and VII.1–3, and does not cover every result of those chapters.
- E. Park, single-oracle codes, evaluation, reducibility and the jump, Mathlib pull request
  https://github.com/leanprover-community/mathlib4/pull/38973. Its single-oracle code and evaluation
  interface is the design that the single-oracle programs of L0 follow; its auxiliary tactics and
  duplicate convenience predicates are not prescribed here.
- T. Duve, the Turing join of partial functions and the semilattice structure on Turing degrees,
  Mathlib pull request https://github.com/leanprover-community/mathlib4/pull/37062. Its join of
  partial functions, splitting both input and output by parity, with its least-upper-bound lemmas
  and the `SemilatticeSup` instance on `TuringDegree`, is the shape of the join of L2.2; it also
  changes the unfolding of `TuringReducible f g` to `Nat.RecursiveIn {g} f`, which the
  representation theorem of L0.2 follows if it lands.

The following sources inform implementations, not the mathematical specification; their
declarations and proofs, not their descriptions of themselves, determine what they supply. Their
code is integrated under the repository's rules for porting existing work, with the authors'
agreement or after checking the licence and discussing the integration on the Lean Zulip, and cited
at its actual source; a provenance link is not evidence of consent. Independent developments of the
same mathematics cite the overlapping work.

| Pinned source | Material to compare or adapt | Integration work |
| --- | --- | --- |
| C. Freer, [computable-model-theory at `a1fe761`](https://github.com/cameronfreer/computable-model-theory/tree/a1fe76155a98f03933f7de0811e03b2473dd2e21/ComputableModelTheory/Computability) | `Computability/OraclePred`, `RecursiveIn`, `Jump`, `StagedPartial`, `StagedRace`, `FiniteInjury` | Compare its relative predicates (`OraclePred`) with L1.1 and its two-sided race (`StagedRace`) with the racing of L0.3; the relative jump, the staged representation and the priority records of its `FiniteInjury` correspond to L3.1, L0.3 and L6.3, and those records are not the injury sets of L6.1 |
| A. Aslyan, [friedberg-muchnik-lean at `d5b3463`](https://github.com/aaslyan/friedberg-muchnik-lean/tree/d5b34637724cdcb55c7fc20be4c89ac60fec4954) | `OracleComputability` code, use and bridge modules; the original Friedberg–Muchnik construction; splitting with nonreducibility | Compare its original Friedberg–Muchnik construction with L8 and its splitting with nonreducibility with L9.3, which adds the low halves of [S, VII.3.2]; its codes and semantic bridges correspond to the single-oracle programs and adequacy of L0 |
| [Single-oracle Mathlib proposal at `302800b`](https://github.com/hyeoniuwu/mathlib4/tree/302800b4882ddd8037580014ffa89a824639ce09/Mathlib/Computability/SingleOracle) | Single-oracle codes, evaluation, reducibility, the jump and `SingleReducibleIff`, taken from the core of CiL | The single-oracle programs of L0 follow its shape; the stage, use and finite-injury interfaces of L0, L1 and L6 are this roadmap's |
| E. Park, [CiL at `3f44ae2`](https://github.com/hyeoniuwu/CiL/tree/3f44ae202755cd7185a53714eafa6c91e7ed871f/Computability) | The same single-oracle core, with set oracles and their jump (`Set_lt_SetJump`, `CEIn_deg`), the use principle (`Use/Principle.lean`), a simple set (`exists_simple_set`) and the Kleene–Post pair below `∅′` (`ex_incomparable_sets_below_j1` in `Constructions/KP54.lean`), all proved; at this commit `LowSimple.lean` begins a low simple construction with no lowness statement, and `Post.lean` is commented out | CiL has its own `Code`, `RecursiveIn`, reducibility and degrees, bridged to Mathlib only by `SingleReducibleIff`; its codes connect to `Nat.Partrec.Code` and its degrees to Mathlib's `TuringDegree`. Its Kleene–Post pair can be compared with L5.3; its use principle, jump results and simple set correspond to L0.2, L3.1 and L5.2 |

A successful port of a source is not a reason to relax the statement of a target or to omit its
computability, degree or injury-interface consequences.

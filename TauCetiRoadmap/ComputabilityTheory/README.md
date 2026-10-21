# Computability theory and finite-injury constructions

Develop a reusable library of computable functions, computably enumerable (c.e.) sets,
oracle computations, Turing reducibility, the jump, effective approximation, and
finite-injury constructions. The main construction targets are the three distinct
methods in Soare, *Recursively Enumerable Sets and Degrees* (1987), Chapter VII:
low simple sets, the original Friedberg–Muchnik construction, and Sacks splitting
with low halves. The foundations also yield the relativized Post theorem, the
modulus and limit lemmas, and the Kleene–Post finite-extension construction.

The library must expose the finite computations and their uses, the actual
numbers that cause injury, and the reductions connecting the constructions to
ordinary computability theory. An abstract stabilization result or a negative
reducibility theorem over an unconnected private machine model does not discharge
a construction target.

`Suggested.lean` records representative signatures and concrete prototype
definitions. This README is the definitive specification. Proving every statement
in that file neither completes a layer nor completes the roadmap.

## Scope and end results

The following results, together with the basic theories and interfaces below, are
in scope. In these statements, reductions of sets mean reductions of their total
characteristic functions, and c.e. means Mathlib's `REPred` applied to membership.

* **Relativized Post theorem and limit lemma.** For every oracle set $Z$ and $n\in\mathbb N$,
  $C\in\Sigma^0_{n+1}(Z)$ iff $C$ is c.e. in $Z^{(n)}$, and
  $C\in\Delta^0_{n+1}(Z)$ iff $C\le_T Z^{(n)}$.
  A total function is computable in $Z'$ iff it is the pointwise, eventually
  constant limit of a uniformly $Z$-computable sequence of total functions.
* **Low simple set** [S, VII.1.1]. There is a simple c.e. set $A$ with $A'\equiv_T\varnothing'$.
* **Original Friedberg–Muchnik theorem** [S, VII.2.1]. There are c.e. sets $A,B$ with
  $A\nleq_T B$ and $B\nleq_T A$. The original witness-and-restraint construction is
  itself a target; deriving this existence result only from splitting does not
  supply its stage, witness, and injury APIs.
* **Sacks simple-set cone avoidance** [S, VII.3.1]. For every noncomputable c.e. set
  $C$, there is a simple c.e. set $A$ with $C\nleq_T A$.
* **Sacks splitting with low halves** [S, VII.3.2]. For c.e. sets $B,C$, with $C$
  noncomputable, there are low c.e. sets $A_0,A_1$ such that
  $B=A_0\cup A_1$, $A_0\cap A_1=\varnothing$, and $C\nleq_T A_i$ for $i=0,1$.
  There is no infinitude hypothesis on $B$.

The scope includes the associated set-level and degree-level corollaries, explicit
construction indices where uniformity is specified, and the acceptance examples
below. It excludes infinite-injury constructions, permitting and density
arguments, jump inversion, the hypersimple/hyperhypersimple hierarchy, admissible
and hyperarithmetical theory, computable model theory, Type-2 computability, and
algorithmic randomness. Those subjects are not implicit prerequisites or targets.

## Conventions

### Mathematical vocabulary and existing Lean vocabulary

Use **computable**, **partial computable**, and **c.e.** in prose and in new names
where this does not conflict with the existing library. Retain the established
Mathlib names `Primrec`, `Partrec`, `Computable`, `ComputablePred`, `REPred`,
`RecursiveIn`, `ComputableIn`, `ManyOneReducible`, `OneOneReducible`,
`TuringReducible`, `TuringEquivalent`, and `TuringDegree`. Do not duplicate these
predicates just to replace `RE` by `CE` in their spelling.

An encoding or a `DecidablePred` instance is not a computability certificate.
Every effective operation has a theorem about `Computable`, `Partrec`, or the
corresponding oracle-relative Mathlib predicate. Classical choice can be used in
semantic definitions and proofs; it is not an implementation of a stage search.

### Numberings, oracles, and stages

1. Numbers, program indices, arguments, witnesses, and stages lie in $\mathbb N$.
   Finite strings are initial segments, not finite sets of positive answers.
   A finite set $A_s$ used as an oracle answers **no** outside $A_s$; a finite
   oracle string answers neither yes nor no beyond its length.
2. $\varphi_e$ is the ordinary partial computable function with index $e$;
   $\Phi_e^Z$ is its oracle counterpart. Use a fixed acceptable numbering, with
   uniform computable translations to Mathlib's ordinary code numbering and to
   any adopted single-oracle API. Numeric equality of different numberings is
   not a mathematical target.
3. $W_e=\operatorname{dom}\varphi_e$ and
   $W_e^Z=\operatorname{dom}\Phi_e^Z$.
   $K^Z=\{e:\Phi_e^Z(e)\downarrow\}=Z'$ and
   $K_0^Z=\{\langle x,e\rangle:x\in W_e^Z\}$.
   The order of the two coordinates in $K_0^Z$ is deliberate.
4. Use Mathlib's pairing machinery. Soare's columns become
   $\omega^{[e]}=\{\langle x,e\rangle:x\in\mathbb N\}$.
   The binary join is the parity join
   $A\oplus B=\{2x:x\in A\}\cup\{2x+1:x\in B\}$.
5. $A_s$ is the finite content **at the end of stage $s$**. Thus
   $\Delta A_s=A_{s+1}\setminus A_s$ consists of entries made at stage $s+1$.
   A restraint read when selecting those entries is $r(e,s)$, not $r(e,s+1)$.
6. Follow the bounded oracle-evaluation convention of [S, III.1.7]:
   $\Phi_{e,s}^Z(x)\downarrow=y$ implies $e,x,y<s$ and use at most $s$.
   For a fixed oracle, convergence, output, and the recorded use persist as the
   stage bound increases. Stage zero has no convergent computations.
7. A successful computation's **use** is one plus its greatest queried oracle
   address, or zero when there were no queries. Only addresses $z<u$ matter.
   Stage use is zero when there is no successful computation, as in [S, III.1.7].
   Keep a separate convergence flag or an `Option`-valued result: zero use does
   not imply divergence.
8. Raw simulation bounds and normalized enumeration stages are different APIs.
   Supply slowing/serialization maps for c.e. enumerations and prove equality
   of their limiting sets. Do not assert equality at the same stage after
   recoding or slowing. A serialized enumeration permits **zero or one** new
   entry at each stage and starts empty, including for finite and empty sets.
   An exactly-one-entry enumeration requires the separate infinitude premise.

### Priority, restraint, and injury

Smaller index means higher priority. In the low-simple construction the order is
$N_0,P_0,N_1,P_1,\ldots$; in the original Friedberg–Muchnik construction use
$R_{2e}:A\ne\Phi_e^B$ and $R_{2e+1}:B\ne\Phi_e^A$.

Soare sometimes writes $-1$ for an inactive restraint. Represent inactivity by
`none : Option ℕ` and an active numerical restraint by `some r`. This is an
encoding of the distinction, not a change of the protected interval:

* `none` protects no number;
* `some r` protects $\{x:x\le r\}$;
* `some 0` therefore protects $0$, and is not the same state as `none`.

The public **injury set** is Soare's set of **numbers**, with the inclusive
inequality of [S, VII.1, p.112; VII.3, p.123]:

$$
 I_e=\{x:\exists s\ (x\in A_{s+1}\setminus A_s\ \land\ x\le r(e,s))\}.
$$

For an inactive restraint the last condition is false. The separate
**injury-stage set** contains the stages $s+1$ at which at least one such number
enters. The separate **injury-event relation** retains both $s$ and $x$.
A strategy's initialization/reset events, attention events, and witness changes
are other sets; they are not definitions of $I_e$.

The use prefix $[0,u)$ and the protected restraint interval $[0,r]$ must remain
distinct. An entry at $x=u=r$ is an injury in the displayed sense even though it
cannot invalidate that particular computation. Such conservative boundary injury
is permitted; weakening the public definition to $x<r$ is not.

Restraints need not be monotone. They can drop after an injury, and a convergent
restraint has no promised computable modulus. Do not replace a live restraint by
its historical maximum without proving the relevant strategy still works.
The maximum of **current higher-priority** restraints is a different operation.

## Grounding and ownership

Every mathematical dependency is supplied by the existing modules in this table
or by an explicitly numbered layer below. No external project is a Lake
dependency of the delivered library, and no theorem depends on an unmerged
Mathlib branch.

| Existing foundation | Reused interface | New work above it |
| --- | --- | --- |
| `Mathlib.Computability.Partrec` and `PartrecCode` | Ordinary computation, codes, `Code.eval`, bounded evaluation, $s$-$m$-$n$, fixed points | Certified oracle code layer, finite-use traces, translations, relative forms |
| `Mathlib.Computability.RE` | `ComputablePred`, `REPred`, closure, computable iff c.e. and co-c.e. | Uniform enumeration and stage APIs; relative counterparts and their bridges |
| `Mathlib.Computability.Halting` | Halting undecidability and Rice's theorem | Relative statements, completeness and index-set applications |
| `Mathlib.Computability.Reduce` | Many-one/one-one reducibility and existing degree theory | Their interfaces with oracle reduction and canonical examples |
| `Mathlib.Computability.RecursiveIn` | Extensional oracle-relative computation | Indexed, operational semantics with both representation directions |
| `Mathlib.Computability.TuringDegree` | Partial-function reducibility, equivalence, quotient order | Set-characteristic-function specialization, joins, jump and c.e.-degree statements |
| Mathlib finite sets, lists, `Part`, `Option`, pairing, orders and filters | Finite data, partial values, induction, eventuality | Injury events, finite histories, limits and preservation |

Mathlib's `TuringDegree` is constructed from partial functions. This roadmap's
classical set-degree claims concern classes represented by **total characteristic
functions**. Reuse that quotient and explicitly identify the represented slice;
do not assert without proof that every partial-function degree is a classical
set degree, and do not introduce an unrelated degree quotient.

The generic computability and injury modules import no model theory. Effective
model-theory and randomness clients can consume these APIs, but neither owns
them. A client needing a c.e.-complement decision procedure, finite-use
preservation, or effective least-witness search obtains it from the modules here.

A proposed dependency graph is:

```text
Mathlib ordinary computability + finite data
  ├─ L0 operational oracle codes / use
  ├─ L1 c.e. presentations / serialization
  └─ L2 numberings / reductions / set degrees
          ├─ L3 jump / hierarchy
          │     └─ L4 modulus / limit lemmas
          └─ L5 diagonalization / simple sets / finite extension
finite data ── L6 injury calculus ──────────────────────┐
L0 + L1 + L3 + L4 + L5 + L6 ── L7 low simple           │
L0 + L1 + L2 + L5 + L6 ───────── L8 original FM         │
L0 + L1 + L2 + L3 + L4 + L5 + L6 ── L9 Sacks methods ─┘
```

The diagram indicates dependencies, not a demand that all proofs be linearized.
L6's set-theoretic injury theory is independent of oracle simulation. L7, L8 and
L9 are independent application modules over the shared foundation. L9's
nonvacuity examples can import L7 or L8 in a separate examples module.

## L0. Operational oracle computation and the use principle

**Source:** [S, I.2–3; III.1, especially III.1.7–9].

### L0.1. Codes and evaluation

Ground the finite data's effectivity first. Supply primitive-recursive encodings
and basic operations for the lists, options, finite sets of numbers, tuples and
finite records used by the algorithms. Reuse existing `Primcodable` instances
where they exist. For finite sets, canonical binary coding
$D\mapsto\sum_{x\in D}2^x$ gives a concrete bridge to the effective finite-set
indices of [S, II.2]. Prove its inverse/round trips and effective membership,
union, difference, bounded filtering and least-element search. The prototype
states computability on these numeric codes; it does not assume that a
`Primcodable (Finset ℕ)` instance is already imported.

Provide a numbered oracle-program type compatible with the single-oracle design
under coordination below. It has ordinary computation and a query operation for
a **total natural-valued oracle**; set oracles are the 0/1-valued specialization.
Finite oracle answers are represented separately. Define operational evaluation,
bounded simulation, successful output and use, and the induced partial function.

Build the coding and computational proofs, rather than taking an evaluator's
correctness, universality, or stage approximability as unexplained fields. Prove:

* code encoding/decoding round trips, effective constructors and inspection;
* bounded simulation computability on finite input data;
* exact correspondence between finite successful runs and partial evaluation;
* uniqueness and stability of output **and use** for a deterministic run;
* raw-fuel and Soare-stage comparison, including the index/input/output bounds;
* query-free translations from Mathlib `Nat.Partrec.Code` and semantic agreement.

A finite snapshot must distinguish an unanswered query from an answer of zero.
Both successful-query branches must be represented, including negative answers.

### L0.2. Use, substitution, and representation

Prove the finite-string Use Principle in all three forms: extract a finite
initial-segment witness from a convergent computation; preserve it under
extension of both the string and stage bound; and pass from a finite string to
any total extending oracle. Export the equivalent oracle-agreement theorem:

$$
 \Phi_{e,s}^{Z}(x)\downarrow=y,\quad
 Z\mathbin{\upharpoonright}u=Y\mathbin{\upharpoonright}u
 \quad\Longrightarrow\quad \Phi_e^Y(x)\downarrow=y.
$$

Here $u$ is the recorded use of the first computation. Also export the
stage-to-stage form, the zero-query case, query substitution/composition, and
finite simultaneous preservation for a list of successful computations.

Prove **both** representation directions against
`RecursiveIn {χ_Z}` for arbitrary partial functions. The direction from Mathlib
to codes is necessary to transfer non-reducibility; the other direction is
necessary to transfer positive algorithms. Connect c.e. domains and total
computations in both directions too. Index transformations are computable
uniformly and do not depend on the oracle whose program they transform.

### L0.3. Fixed and moving oracles

For a fixed oracle, package staged discovery as data and derive a staged
presentation from its code. Prove the existence of such data from extensional
`RecursiveIn` using the representation theorem, not by adding staging as an
unproved hypothesis to the final results.

For a varying sequence $Z_s$, prove a different theorem: a successful limit-oracle
computation becomes visible at all sufficiently large stages when $Z_s$ converges
pointwise to $Z$. The proof uses stabilization of the finitely many addresses
below its use. Arbitrary stage computations using $Z_s$ do **not** persist merely
because the fuel grows.

Supply earliest-discovery racing for fixed-oracle staged procedures, with a fixed
tie rule. The winner is selected at the first discovery stage and then retained;
current-stage left preference is not a valid monotone tagged race.

**Examples:** query-free zero and successor; a query at address zero; a query
beyond a finite string; positive and negative query answers; a computation
invalidated by a later c.e. entry; simultaneous preservation of two computations
with different uses; the tagged-race counterexample and its corrected version.

## L1. c.e. sets and effective presentations of enumerations

**Source:** [S, II.1–2; III.1].

Prove the uniform equivalences between `REPred`, domains of indexed partial
computable functions, ranges of partial computable functions, and unions of
computable increasing finite-set sequences starting empty. A nonempty c.e. set
is the range of a total computable function; a total range presentation is not
promised for the empty set. Infinite c.e. sets have injective total enumerations.

Supply both individual and uniformly indexed families of enumerations. Prove
closure under finite union/intersection, computable preimages, c.e. images and
projection, with index constructors and semantic equations. Relative forms
specialize to the existing ordinary API at the empty oracle.

An enumeration's finite stage data and its limit are separate objects. Export
membership as an existential stage, freshness of $\Delta A_s$, unique entry
stage under monotonicity, finite-prefix stabilization, stage shifts, and
reindexing by cofinal increasing clocks. The limit is not given a computable
characteristic function merely because its stages are computable.

Provide serialization to zero-or-one new element per stage, uniformly from an
index, without deciding whether the set is finite. Provide the corresponding
statement for enumerated pairs and tagged disjoint unions. Supply uniform stage
comparison/search maps witnessing equality of the limiting sets. The stronger
exactly-one-entry convention is available under infinitude, separately.

**Examples:** empty, singleton, finite, all naturals, the even numbers, $K$;
a repeated-output enumeration; a paused enumeration; a batched enumeration and
its serialization; two enumerations of the same set with different entry times.

## L2. Numberings, reductions, joins, and uniform construction interfaces

**Source:** [S, I.3; II.2–3; III.1–2].

Reuse Mathlib's ordinary enumeration, $s$-$m$-$n$ and recursion theorems.
Build an injective padding compiler and its semantic preservation theorem on
the adopted code syntax. Establish the oracle-relative forms, including parameterized
self-reference and the fact that the compiler is computable independently of the
oracle. Give interoperability theorems for the adopted numberings.

Specialize Mathlib's Turing reducibility to total set characteristic functions.
Develop reflexivity, transitivity, computable changes of presentation,
complement invariance, many-one/one-one implications, and the parity-join least
upper bound. Prove the bottom-degree characterization, computable invariance of
columns, and the induced statements in Mathlib's degree quotient on the
set-represented slice. Ordinary subset inclusion is not a reducibility theorem.

For a **disjoint c.e. split** $B=A_0\cup A_1$, prove [S, VII.3.3]:

$$ A_0\le_T B,\qquad A_1\le_T B,\qquad B\equiv_T A_0\oplus A_1. $$

The reductions use both enumeration indices: first ask whether $x\in B$; if yes,
wait until $x$ enters one of the two halves. Export the uniform index-level
version. Do not lose this information by retaining only $A_i\subseteq B$.

Give a common effective least-witness search API with its actual domain and a
totality corollary under an explicit existence premise. Supply finite-priority
selection returning `none` when nothing is eligible. Prove its minimum and
no-candidate specifications. No arbitrary default number stands for a failed
search.

**Examples:** parity inclusions/projections; a set equivalent to its complement;
finite computable sets at the bottom degree; disjoint c.e. splits; a noncomputable
subset of a computable set illustrating the failure of inclusion-to-reducibility;
parameter compilation and a genuinely self-referential index.

## L3. The jump, the arithmetical hierarchy, and index sets

**Source:** [S, III.2; IV.1–4].

Define $Z'$ using the indexed evaluator and prove $Z<_T Z'$, monotonicity on
reductions, invariance under Turing equivalence, the equivalence of diagonal and
paired halting sets, and completeness for $Z$-c.e. sets. Prove finite iterates and
their index/degree transport. A relation saying that some oracle can decide every
$Z$-halting question is an upper-bound interface, not the definition or
construction of the actual jump. Derive that interface from the concrete jump.

Define the arithmetical pointclasses by **number quantifiers over computable
matrix predicates**, with explicit pairing/relabeling conventions, rather than
by declaring them to be relative computability in a jump. Set
$\Sigma^0_0(Z)=\Pi^0_0(Z)$ to be the $Z$-computable predicates;
$\Pi^0_n(Z)$ is the complement class and
$\Delta^0_n(Z)=\Sigma^0_n(Z)\cap\Pi^0_n(Z)$.
Construct normal forms, quantifier contraction, the bounded-quantifier and Boolean
closure results needed to manipulate those forms, and effective transformations
of their codes. A displayed normal-form code consists of an alternating
number-quantifier prefix, a tuple-arity convention, and an index for its total
Boolean-valued matrix procedure relative to the oracle. Totality is a semantic
promise on the supplied code, not a decidable validity test. Uniform code
transformations operate on this data; they do not extract an algorithm from an
arbitrary semantic `Prop` witness. This is a pointclass development; interpreting a separate
first-order arithmetic object language is not a hidden prerequisite.

Prove the Post equivalences in the scope statement, the resulting strictness
statements, and their oracle-relative forms. Use the concrete jump theorems and
normal forms in the proofs, not a circular definition of the pointclasses.

As applications, prove exact classifications and many-one completeness for the
halting set ($\Sigma^0_1$), `TOT` ($\Pi^0_2$), `FIN` ($\Sigma^0_2$), and `INF`
($\Pi^0_2$), with explicit index-set definitions. Define low sets by
$A'\equiv_T\varnothing'$ and prove degree invariance, downward closure among set
degrees, and that a noncomputable low c.e. set is incomplete.

**Examples:** ordinary/relative halting; the distinction between membership in an
axiom list and a decision procedure for its c.e. closure; deciding a predicate
with c.e. complement using the jump; `TOT` versus a single halting query;
computable sets are low; $K$ is not low. Do not claim the jump preserves joins.

## L4. Moduli, limit approximation, and stabilization information

**Source:** [S, III.3, especially III.3.1–4].

Define pointwise eventual agreement for a sequence of total functions and a
modulus $m$ by
$\forall x\,\forall s\ge m(x)\ f_s(x)=f(x)$.
Prove finite-coordinate aggregation, shifts, effective reindexing, and the
computability of a limit from a uniformly computable sequence and a computable
modulus. State the exact relativized hypotheses for each version.

Prove the Modulus Lemma for c.e. oracle sets [S, III.3.2], and the Limit Lemma
[S, III.3.3] for total natural-valued functions. Supply the characteristic-function
specialization and the equivalence with $\Delta^0_2$. Also prove [S, III.3.4]: a
total function has c.e. degree exactly when it has a computable approximation
with a modulus computable from that function. Use graph coding for total-function
oracles when translating to set-degree statements.

Export the finite-use lemma that makes genuine computations in an approximated
oracle eventually visible, and the separate preservation lemma for stage
computations whose uses stay protected. These connect the limit calculus to L6–L9.

**Examples:** finite-change approximations; the increasing approximation to $K$,
whose limit is not computable; a concrete bit that changes once and then stays
changed; an eventually stable restraint with no supplied effective stabilization
stage. Prove that an everywhere computable modulus for the standard approximation
to $K$ would decide $K$.

## L5. Diagonalization, simple sets, and finite-extension comparison

**Source:** [S, I.3 exercises on inseparability; V.1; VI.1].

Construct disjoint c.e. computably inseparable sets from the two diagonal output
conditions. Prove the advertised non-separation using the actual enumeration of
all computable characteristic functions. Expose the pair's disjointness and c.e.
indices, not only its existential theorem.

Define immune sets and simple sets, with the ordinary definition that $A$ is c.e.
and its complement is infinite and has no infinite c.e. subset. Prove the
requirement characterization
$W_e\text{ infinite}\Rightarrow W_e\cap A\ne\varnothing$ together with
coinfinitude. Construct a simple set by effective positive requirements with the
witness condition $x>2e$, and prove the counting invariant ensuring coinfinitude.
Derive noncomputability. Do not infer incompleteness from simplicity.

Construct the Kleene–Post pair of incomparable sets below $\varnothing'$ by a
$\varnothing'$-computable finite-extension procedure [S, VI.1.2]. State the
extension-or-permanent-divergence alternative and show the oracle can decide the
required c.e. searches. Prove coverage of each coordinate, totality of the limit
sets, and all diagonal requirements. This is the comparison case where a
construction uses an oracle; it does not supply the c.e. Friedberg–Muchnik pair.

**Examples:** both inseparable sets; the protected coinfinite reservoir in the
simple-set construction; a finite $W_e$ whose positive requirement is vacuous;
requirements met by a permanent disagreement versus permanent divergence.

## L6. Injury sets, events, restraints, and finite-injury reasoning

**Source:** [S, VII.1, pp.111–113; VII.2, pp.118–120; VII.3, pp.122–126].

This layer is public infrastructure. It must not be private to a particular
construction or defined retrospectively from the assertion that its proof
succeeds.

### L6.1. The three injury objects

For any finite-stage sequence $A_s$ and restraint data $r(e,s)$, define:

* the finite injury batch
  $J(e,s)=\{x\in\Delta A_s:r(e,s)=\operatorname{some}(b),\ x\le b\}$;
* the event relation $\operatorname{InjuresAt}(e,s,x)$ iff $x\in J(e,s)$,
  describing injury **at stage $s+1$**;
* the number set $I_e=\bigcup_s J(e,s)$ and the injury-stage set
  $S_e=\{s+1:J(e,s)\ne\varnothing\}$.

Give membership equations, extensionality under equality of stage and restraint
data, finite-horizon unions, inclusion of each batch in $I_e$, and the projections
from event records to numbers and stages. Prove that if $A_s$ and $r(e,s)$ are
uniformly computable then $I_e$, $S_e$, and the event relation are uniformly c.e.
The event relation and the injury-stage set are in fact uniformly computable
from computable stage data; the number set is generally only uniformly c.e.

Under monotonicity of $A_s$, a number has at most one entry stage. Consequently,
for each $e$, prove:

$$
 I_e\text{ finite}\ \Longleftrightarrow\ S_e\text{ finite}
 \ \Longleftrightarrow\ \exists s_0\,\forall s\ge s_0\ J(e,s)=\varnothing.
$$

This equivalence is not assumed by the definitions. When the sets are finite,
prove $|S_e|\le |I_e|$; equality needs at most one injuring entry per stage.
Do not impose a single-entry hypothesis on the general API. Numeric cardinality
bounds must include or establish finiteness: `Set.ncard` is zero on an infinite
set and must not turn an asserted finite injury budget into a vacuous bound.

The source uses a **strict** test in Sacks's routing on p.125, despite the
inclusive displayed injury set on pp.112 and 123. Preserve both conventions.
Define the auxiliary use-prefix breach batch
$J^<(e,s)=\{x\in\Delta A_s:r(e,s)=\operatorname{some}(b),\ x<b\}$,
its number set $I^<_e$, and its stage/event projections. These are named
**use-prefix breaches**, not a redefinition of Soare's injury set. Prove
$J(e,s)=J^<(e,s)\cup J^=(e,s)$, where the boundary batch consists of fresh
entries equal to the active restraint, and prove disjointness of the two batches.
Prove their uniform effective membership and projection APIs as for the inclusive
objects. Prove finite $I_e$ implies finite $I^<_e$; the converse needs control of
the boundary entries. In particular, eventual boundedness of the restraint implies finite boundary
injury and finite inclusive injury as **number sets**, without requiring
monotonicity of the stages or a bound on the earlier restraint values. Monotone
stages then give finite injury stages and an injury-free tail. L9 must supply
stabilization before invoking this
bridge. This is an additional explicit proof step, not a silent endpoint change.

### L6.2. Quantitative causes and multiple oracles

Provide the following cause-counting result. Suppose every injuring entry is
assigned to a higher-priority contributor $i<e$, contributor $i$ supplies at most
$b_i$ distinct entries, and the assignment is certified for the actual entries.
Then $|I_e|\le\sum_{i<e}b_i$. Export the one-entry-per-contributor specialization
used to obtain $|I_e|\le e$ in L7 and in the simple-set construction of L9.
A purported contributor ledger is not a substitute for proving that it accounts
for the actual stage difference.

For several constructed sets, parameterize the monitored oracle by a target map
from requirements to set labels. Instantiate the same injury API on each
monitored sequence. Retain the label in combined event records so that an entry
in $A$ is not confused with an entry of the same number in $B$. The original
Friedberg–Muchnik requirements enumerate into one set and protect the other.

Provide projection and restriction results for labelled events and initial
priority segments. A switch of monitored oracle is a new proof obligation; it is
not an innocuous reindexing of unlabelled numbers.

### L6.3. Preservation, injury-free epochs, and initialization

Prove the direct telescope result: if no element below $u$ enters after stage $s$,
then the limit oracle and $A_s$ agree below $u$. Combine it with L0's use theorem.
For moving restraints, expose the premise that the currently protected interval
continues to cover the recorded use; absence of injuries alone does not imply it.
Give the preservation theorem both for inclusive injury and for use-prefix
breaches. In the latter, the live numerical restraint must be at least the
recorded use, so that every queried address lies strictly below it.

Define finite intervals between initialization stages as epochs when a concrete
strategy uses epochs. Prove locality: a lower-priority action cannot modify
higher-priority records, and respecting their restraints prevents the relevant
injuries. Separate this from the construction's rule that a higher-priority
attention event resets lower-priority records. Initialization may occur with no
new number entering a protected interval.

Give two reusable styles of finite-injury reasoning:

* local finiteness of attention, conditional on finiteness at all higher
  priorities, implies eventual silence by induction; locality then gives
  stabilization of each finite record;
* finite injury to a negative requirement, computation-preservation equations,
  and its diagonal/target hypotheses imply satisfaction and restraint
  stabilization, without requiring the requirement to have a finite set of
  discrete attention events.

The second style is needed by Sacks's changing agreement-length restraints.
State the premises actually used by each lemma. In particular, do not add a
computable bound on injuries or an effective stabilization stage to the general
API. Conversely, stabilization of an idle strategy is not a satisfaction theorem.

### L6.4. Mandatory boundary examples

Prove, as concrete mathematical examples:

1. With `none`, a fresh entry at zero is not an injury; with `some 0`, it is.
2. A fresh entry exactly at an active restraint is in $I_e$.
3. An entry at the exclusive use boundary leaves that computation intact even
   when it belongs to the conservative injury set.
4. Two distinct injuring numbers in one stage contribute two numbers and one
   injury stage.
5. Without monotonicity, repeated entry/removal of zero gives a finite number
   set and infinitely many injury stages.
6. A lower-priority reset can occur without any injury to the protected oracle.
7. Finite injury alone does not force an arbitrary restraint to stabilize.
8. No injury to a restraint which later drops does not preserve an earlier,
   no-longer-covered use.
9. A fixed-oracle discovery is persistent; a moving-oracle discovery can fail.
10. An event in one oracle cannot discharge the matching event claim for another.
11. Boundary-only injuries with a growing restraint can be infinite even when the
    use-prefix breach set is empty. An explicit example has $A_s=[0,s)$ and
    $r(e,s)=\operatorname{some}(s)$. Thus the finite-prefix/stabilization bridge
    cannot be omitted from the Sacks induction.
12. A uniformly c.e. family of finite injury-number sets need not be uniformly
    computable: use a computable enumeration of $K$ and constant restraint
    $r(e,s)=\operatorname{some}(e)$ to obtain $I_e=K\cap[0,e]$. The diagonal
    membership query would decide $K$.

## L7. Low simple sets

**Source:** [S, VII.1.1–2]. **Dependencies:** L0–L6.

Use the positive requirements $P_i$ for simplicity and the negative requirements
$N_e$ that turn infinitely recurrent convergence of $\Phi_{e,s}^{A_s}(e)$ into
true convergence of $\Phi_e^A(e)$. At stage $s+1$, use the current use as
$r(e,s)$, represented as `some (stageUse ...)`, including zero when no convergence
has been found. Choose the least eligible $i\le s$ and then the least witness in
$W_{i,s}$ with $x>2i$ and $x>r(e,s)$ for every $e\le i$.

Define a computable stage transition and prove increasing finite stages,
positive-requirement action at most once, the actual injury attribution to
$i<e$, and the bound $|I_e|\le e$. Prove finite injury before extracting an
injury-free stage. Then prove preservation of convergent computations and
stabilization of $r(e,s)$; use that stabilization to discharge every $P_i$.

The counting invariant $|A\cap[0,2n]|\le n$ gives coinfinitude. Establish all
simple-set properties rather than treating a list of requirements as their
definition.

Define the computable bit approximation
$g(e,s)=1$ iff $\Phi_{e,s}^{A_s}(e)\downarrow$.
Prove its pointwise eventual agreement with $\chi_{A'}$ and apply L4 to obtain
$A'\le_T\varnothing'$. Supply the reverse reduction and conclude lowness.
Export an index for the constructed c.e. set, its simple/low properties, and the
intermediate-degree corollary $\varnothing<_T A<_T K$.

## L8. The original Friedberg–Muchnik construction

**Source:** [S, VII.2.1]. **Dependencies:** L0–L2, L5–L6; L3 for the degree corollary.

Use the interleaved negative requirements specified above, distinct witness
columns, inactive restraints, and least eligible attention. A requirement that
sees the opposite oracle compute zero at its fresh witness enumerates that
witness into its own set, records the use protecting the opposite set, and
initializes lower-priority requirements. Witness allocation and reallocation are
computable searches in infinite columns above all required current bounds.

Prove the effective existence of those searches. A finite active record plus a
uniform default for not-yet-activated requirements can represent Soare's infinite
sequence of markers, but it must have a semantic correspondence theorem.

Export the stage transition, both c.e. enumeration indices, witness ownership,
monotonicity, action/initialization equations, higher-priority locality,
protection of the opposite oracle, and the actual injury events. Prove by
priority induction that each requirement eventually has a permanent witness and
acts at most once after higher priorities settle. Separate an appointment event
from an attention event that enumerates a witness.

For the original convention, prove the finite quantitative bound obtained by
summing higher-priority attentions (at most $2^e-1$ for priority $e$). An
implementation with auxiliary bookkeeping actions must relate those actions to
the mathematical attention events before quoting this bound.

Prove satisfaction both when a zero computation is permanently preserved and
when no zero computation ever appears after stabilization. Use L0's adequacy to
quantify over every Mathlib oracle reduction. Conclude the c.e. incomparability
statement and derive that both constructed degrees are nonzero and below $0'$.

## L9. Agreement preservation and low Sacks splitting

**Source:** [S, VII.3.1–7]. **Dependencies:** L0–L6.

### L9.1. Length of agreement and its restraint

For a c.e. target $C$ and a constructed oracle $A$, define the finite-stage
length of agreement $\ell(e,s)$ to be the first argument where bounded evaluation
is absent or differs from $C_s$. Soare's stage bound ensures such an argument
exists (at latest $s$). Define

$$ r(e,s)=\max\{u(A_s;e,x,s):x\le\ell(e,s)\}. $$

The upper index is **inclusive**. Preserve any convergent computation at the
first disagreement as well as the computations at smaller arguments. Define the
empty/no-convergence behavior explicitly. Prove computability uniformly from the
enumerations and program index.

On an interval free of use-prefix breaches, prove the simultaneous preservation
equations, the
stable-disagreement alternative, and the following key implication: if the
limiting functional nevertheless computes $C$, then arbitrarily long agreement
allows a computable search to decide $C$. No effective knowledge of the final
injury stage is claimed; its fixed finite value can be a parameter in an
existence proof for a computable decision procedure. Export the inclusive-injury version as a
consequence of $I^<_e\subseteq I_e$, not as a different preservation proof.

Prove restraint stabilization from the first limiting disagreement, including
the case of a divergent limiting computation. Do not simply assume that lengths
of agreement or restraints are globally monotone.

### L9.2. A simple set avoiding a prescribed noncomputable c.e. cone

Implement [S, VII.3.1] using $P_i$ and $N_e:C\ne\Phi_e^A$, the preceding length
and restraint, and the simple-set witness bounds. Prove finite injury,
non-reduction, stabilization, and positive satisfaction in that order. Export
both the constructed set's index and its simple/cone-avoidance properties.
This is a client of L9.1, not a premise of its generic preservation lemmas.

### L9.3. Splitting an arbitrary c.e. set

Take a serialized enumeration of $B$ with pauses; build disjoint increasing
finite stages for $A_0,A_1$, assigning every fresh element to exactly one side.
For each negative requirement $(e,i)$, protect the computations of
$\Phi_e^{A_i}$ against $C$. Choose the highest-priority currently threatened
requirement and put the new element on the other side; use side zero if neither
side has a threatened requirement.

The threat test is exactly the **strict** test $x<r^i(e,s)$ printed in
[S, VII.3, p.125]. Only indices $e<s$ can threaten at stage $s$, since the stage
bound makes all uses at $e\ge s$ zero; use this to justify the finite search.
The public injury set still uses $x\le r^i(e,s)$.

Prove the induction over the paired priority in the following noncircular order:
finite **use-prefix** breach set, satisfaction of $C\ne\Phi_e^{A_i}$,
convergence of that requirement's restraint, and then finite **inclusive** injury
set by L6's eventual-boundedness and boundary bridge. To obtain finite use-prefix breaches, higher
priorities' stabilized restraints are bounded; once the corresponding finite
prefix of $B$ has settled, routing prevents any further lower-priority breach.
Boundary equality need not have been prevented by the routing test and cannot
be dismissed before the current restraint stabilizes. This refinement preserves
both printed endpoint conventions while making the omitted connection explicit.
It does not assume an a priori computable bound on the number of injuries.

Prove lowness of both halves by the agreement-length test in [S, pp.125–126]:
compile a program which, at input zero, returns the fixed bit $C(0)$ exactly when
$\Phi_e^X(e)$ converges and diverges at every positive input. Stabilization of the
corresponding agreement length yields a computable convergent approximation to
the jump of each half; apply L4. The compiler with the bit as explicit finite
input is computable. The existence proof may specialize it to $C(0)$; it must
not claim to compute that bit uniformly from an arbitrary c.e. index for $C$.

Provide total computable output-index transformations on input enumeration
indices for $B,C$, with the negative and lowness conclusions under the stated
noncomputability promise on $C$. Do not additionally promise uniform indices for
all lowness reductions unless those are independently proved. Empty and finite
$B$ are handled by the same paused algorithm.

### L9.4. Connective corollaries

Apply L2's split reductions, not subset inclusion, to prove [S, VII.3.3–7]:

* for noncomputable c.e. $B$, two low incomparable c.e. degrees strictly below
  $\deg_T(B)$ whose join is $\deg_T(B)$;
* every c.e. degree is the join of two low c.e. degrees;
* no nonzero c.e. degree is minimal;
* each nonzero incomplete c.e. degree has an incomparable c.e. degree.

For the last item, preserve the distinction in [S, p.125] between constructing
a pair at least one of which works and uniformly selecting the successful half.

**Examples:** splitting an empty set, a singleton and an infinite computable set
against a fixed noncomputable c.e. target; splitting the low simple set from L7;
splitting $K$; and splitting relative to a target different from the set being
split. In the $K$ example prove both halves low but their join not low. This also
refutes a purported unrestricted jump-distributes-over-join identity.

## Suggested organization of implementation modules

Use subjects rather than source-project structure for placement. The following
paths describe the intended boundaries; Mathlib/Tau Ceti review owns final names.

```text
TauCeti/Computability/SingleOracle/   -- code, bounded evaluation, use, adequacy
TauCeti/Computability/Enumeration/    -- c.e. stages, serialization, indices
TauCeti/Computability/Jump/           -- concrete jump, iterates, relative forms
TauCeti/Computability/Hierarchy/      -- normal forms, Post, index sets
TauCeti/Computability/Approximation/  -- moduli and limit lemma
TauCeti/Computability/Priority/      -- entry/injury sets, causes, epochs, induction
TauCeti/Computability/Simple/        -- positive and low-simple constructions
TauCeti/Computability/FriedbergMuchnik/
TauCeti/Computability/SacksSplitting/
TauCeti/Computability/Examples/      -- cross-client consequences and counterexamples
```

Keep mathematical state data separate from invariant proofs. Do not introduce
metaprogramming or a new global computability tactic as a prerequisite for the
mathematics. Effective finite searches and index transformations are mathematical
algorithms and belong in the mathematical modules.

## Coordination with Mathlib and existing developments

Follow the repository's [Working with Mathlib][policy] and [Porting existing
work][porting] rules. Search the relevant current PRs and Zulip discussions before
selecting names. Mathlib owns its API, but an open PR is not a waiting condition:
construct the required material in Tau Ceti against its Mathlib dependency,
following the emerging interface, and adopt Mathlib's declarations if they land.
Delete superseded local declarations and repair their consumers rather than
retaining compatibility-only aliases or forwarding modules. Opening a Mathlib PR
is not a roadmap target.

In particular coordinate with [Mathlib #38973][oracle-pr], the single-oracle code,
reducibility and jump work by Edwin Park and Tanner Duve, and the contributors to
Mathlib's existing `RecursiveIn` and `TuringDegree`. The source proposal's
`Oracle.Single.Code`/evaluation interface is design evidence for L0–L3; its
auxiliary tactics and duplicate convenience predicates are not prescribed here.

Coordinate with the authors of the source projects below before integrating
code. Cite adaptations at their actual source. Where contact is not possible,
verify the licence and discuss the integration on Lean Zulip before copying.
Independent development still cites and coordinates with overlapping work.
Record completed coordination in the PR discussion; do not infer consent from
the presence of a provenance link.

## References and secondary implementation provenance

**[S]** Robert I. Soare, *Recursively Enumerable Sets and Degrees: A Study of
Computable Functions and Computably Generated Sets*, Perspectives in Mathematical
Logic, Springer, 1987. References above are to printed pages and chapter/section
numbers, not PDF-image indices. The requested scope is selected from I–IV, V.1,
VI.1, and VII.1–3; it does not claim to cover every result of those chapters.

The following sources inform implementations, not the mathematical specification.
Inspect their declarations and proofs rather than adopting status prose as a
statement of scope.

| Pinned source | Material to compare or adapt | Required integration work |
| --- | --- | --- |
| [Cameron Freer, computable-model-theory at `a1fe761`][cmt] | `Computability/OraclePred`, `RecursiveIn`, `Jump`, `StagedPartial`, `StagedRace`, `FiniteInjury` | Extract only the generic layers; construct the actual relative jump and staged representation; retain the distinction between injury sets and a record-reset kernel |
| [Ara Aslyan, friedberg-muchnik-lean at `d5b3463`][fm-source] | `OracleComputability` code/use/bridge modules; original FM; splitting-with-non-reducibility | Harmonize codes and predicates, complete positive/negative semantic bridges, fit current Lean and Tau Ceti proof constraints, and establish the low-half strengthening required by [S, VII.3.2] |
| [Single-oracle Mathlib proposal at `302800b`][oracle-source] | Single-oracle codes, evaluation, reducibility, jump and `SingleReducibleIff` | Coordinate shape and remove duplicate ordinary API; add the explicit stage/use and finite-injury interfaces required here |

The original FM and Sacks applications should share the oracle/use and injury
infrastructure without importing one another's construction proofs. A successful
source port is not a reason to relax the statement of a target or to omit its
computability, degree, or injury-interface consequences.

[policy]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/README.md#working-with-mathlib
[porting]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/README.md#porting-existing-work
[oracle-pr]: https://github.com/leanprover-community/mathlib4/pull/38973
[cmt]: https://github.com/cameronfreer/computable-model-theory/tree/a1fe76155a98f03933f7de0811e03b2473dd2e21/ComputableModelTheory/Computability
[fm-source]: https://github.com/aaslyan/friedberg-muchnik-lean/tree/d5b34637724cdcb55c7fc20be4c89ac60fec4954
[oracle-source]: https://github.com/hyeoniuwu/mathlib4/tree/302800b4882ddd8037580014ffa89a824639ce09/Mathlib/Computability/SingleOracle

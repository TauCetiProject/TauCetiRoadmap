# Roadmap: Certified permutation-group computation

## Goal

Build an executable, polynomial-time verifier for certificates about normal
closures in finite permutation groups, and a bounded randomized search wrapper
with a proved failure bound.

The central mathematical result is the following. Let a finite list of
permutations generate a group \(G \le S_n\), let words in those generators
generate a subgroup \(H \le G\), and let
\[
N=\langle\!\langle H\rangle\!\rangle_G,\qquad
K=N.\mathrm{map}(G.\mathrm{subtype})\le S_n.
\]
An accepted certificate proves that \(K\) is doubly transitive, is \(A_n\), or
is \(S_n\), according to its claim. Verification has a polynomial bound in
the combined encoded length of the input and certificate. For every choice
of random seeds, an accepted claim is true.

A candidate generator with polynomial bounds on seed length, running time,
and output length can be connected to the verifier. If one trial produces
an accepted certificate with probability at least \(1/R(m)\), where \(R\)
is a fixed polynomial with natural coefficients and \(R(m)>0\), then
\(kR(m)\) independent trials fail with probability at most \(2^{-k}\).
The combined runner has a polynomial worst-case time bound in \(m+k\).
Here \(m\) is the encoded input length, and \(k\) is a unary-encoded
precision parameter.

The probability hypothesis is a mathematical contract on the candidate
generator. It does not follow from efficient verification. The runner
returns `unknown` when no candidate succeeds; that result is not a
certificate that the group is different from \(A_n\) or \(S_n\).

Concrete instances must include explicitly generated symmetric and
alternating groups with polynomial-size certificates. The generic search
theorem must accept these concrete generators as instances, as well as
other generators satisfying its stated contract.

## Scope and dependencies

Use `Equiv.Perm`, `Subgroup.closure`, `Subgroup.normalClosure`,
`MulAction.IsPreprimitive`, `IsMultiplyPretransitive`, `fixingSubgroup`,
`Turing.FinTM2`, `TM2ComputableInPolyTime`, `ProbabilityTheory.HasLaw`,
`ProbabilityTheory.condVar`, and `Polynomial ℕ`. Mathematical statements
should be reusable for arbitrary finite actions where their proofs allow
it; executable representations are specialized to `Fin n`.

The roadmap depends on existing Mathlib group actions, finite permutations,
Turing machines, conditional expectation, finite product probability
measures, and elementary real exponential inequalities. It also uses
these precise existing developments:

* [PolynomialGaloisGroups, Layer 1, Jordan's prime-cycle theorem](
  https://github.com/TauCetiProject/TauCetiRoadmap/blob/e89d8eca59f30545a8f226c3455b54f5ba49daf3/TauCetiRoadmap/PolynomialGaloisGroups/README.md#L614-L632):
  a primitive permutation subgroup containing a prime \(p\)-cycle with
  \(p+3\le n\) contains \(A_n\). The implementation is
  [`TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`](
  https://github.com/TauCetiProject/TauCeti/blob/734b670f1e17c4a2352b1f40998e025f5405a01b/TauCeti/GroupTheory/Perm/Jordan.lean#L151-L156).
* [StandardDistributions, Layer 1, elementary Bernoulli theory](
  https://github.com/TauCetiProject/TauCetiRoadmap/blob/e89d8eca59f30545a8f226c3455b54f5ba49daf3/TauCetiRoadmap/StandardDistributions/README.md#L226-L240):
  ordinary Bernoulli moments. Reuse the existing Bernoulli measure and
  moment theorems; the conditional and repeated-trial results below are
  separate targets.

Every layer below is required. No layer depends on an unspecified group
sampler, a mixing-time theorem, a general efficient group-recognition
algorithm, or a field-arithmetic development. The arithmetic Galois
certificates specified in PolynomialGaloisGroups remain in that roadmap.
This roadmap specifies a finite permutation input format, normal-closure
witnesses, executable verification, machine costs, and probabilistic search.

## Layer 1: computational operations and polynomial budgets

### 1.1 Computable finite sequences

Provide the computability API for `List.rec`, `List.foldl`, `List.foldr`,
and `List.map` over `Primcodable` types, with hypotheses expressing the
computability of their arguments. Include computable list encodings,
concatenation, reversal, length, bounded indexing, and finite traversals.
Prove compatibility of these encodings with their mathematical
operations, including empty lists and out-of-range indices.

Qualitative computability and a polynomial running-time bound are
different conclusions. The executable primitives used later also need
explicit finite-machine implementations and costs.

### 1.2 Output size and composition

For a finite TM2 machine, define the maximum number of symbols a single
transition can push. Prove that a halting run with input length \(m\)
and \(t\) steps has output length at most
\[
m+\mathrm{maxPushes}\,t.
\]
Expose the corresponding bound for `TM2ComputableInPolyTime` witnesses.

Prove monotonicity of polynomial evaluation for natural coefficients,
with reusable ordered-semiring generality when the required order
hypotheses hold. Use this API when substituting a bound on intermediate
output size into the running-time polynomial of the next machine.

Construct polynomial-time composition for compatible input and output
encodings. In the existing two-transfer implementation, if the first
machine has time polynomial \(P\), maximum push count \(c\), and the
second has time polynomial \(T\), the intermediate length polynomial is
\[
Q=X+C(c)P,
\]
and the composed bound is
\[
P+4Q+2+T.\mathrm{comp}(Q).
\]
Expose the output semantics, transfer-order correctness, step count,
and the resulting polynomial witness.

### 1.3 Uniform bounded loops

Construct a clocked iterator over encoded finite states. Its correctness
theorem must identify the state after each iteration with the specified
mathematical step function. Its polynomial-time theorem takes:

* a polynomial bound \(B(m)\) on the number of iterations;
* a proved invariant bounding the encoded state length by a fixed
  polynomial \(S(m)\), including the clock and stored counters;
* a single step machine with a fixed polynomial cost bound;
* polynomial costs for initialization and final output.

Produce a single finite machine and an explicit polynomial bound for the
whole iterator. Account for clock maintenance, state transfers, and
termination. Repeated application of a composition theorem without a
state-size invariant is insufficient, since the state could grow
exponentially.

Implement the Boolean-list and unary-counter operations needed by
parsing, table traversal, graph reachability, and relation saturation.
Give a fixed polynomial witness for each. All later cost bounds must be
constructed from these implementations and loop theorems.

## Layer 2: finite permutation data and executable predicates

### 2.1 Encoding and denotation

Use an explicit `List Bool` wire encoding. Encode degree \(n\) as a
unary prefix `1^n 0`. Counts and list lengths use the same convention.
For \(t\ge1\), let \(b(t)=\max(1,\lceil\log_2 t\rceil)\); indices into a
nonempty collection of size \(t\) use exactly \(b(t)\) bits, most
significant bit first. An empty collection has no valid indices.
Reject any index whose decoded natural number is outside its range.

An input contains the degree, a unary generator count, and that many
forward-image tables, each with exactly \(n\) entries. Validate that
every entry belongs to `Fin n` and that each table is bijective.
Inverses are computed from the validated tables. Reject trailing,
truncated, or otherwise malformed encodings.

If `gs : List (Equiv.Perm (Fin n))` is the decoded list, its denotation
is the subgroup generated by its members. A signed word letter is an
index into a generator list and one inversion bit. A word is encoded by
a unary letter count followed by its letters. Evaluate words by a
left fold with accumulator update `acc * letter`, starting at `1`;
permutation multiplication therefore retains Mathlib's convention
that the right factor acts first.

Prove encoder/decoder round trips, rejection of malformed inputs,
compatibility of multiplication and inversion with word evaluation,
and membership of every evaluated generator word in the generated
subgroup. Reversing a word and reversing all its signs represents its
inverse. Include the empty generator list and empty word cases.

The unary prefixes imply \(n\le m\) and bound the number of stored
objects by their encoded length. All complexity statements use encoded
length, rather than treating large numbers or permutation tables as
unit-cost objects.

### 2.2 Orbit and primitivity checking

Implement orbit reachability using the graph whose edges are the
validated generators and their inverses. Prove equivalence between
reachability and membership in the orbit of the generated group.
Store parent edges to extract generator-word witnesses; prove that a
shortest witness uses at most \(n-1\) edges.

For each \(b\ne0\), compute the least invariant equivalence relation
containing \((0,b)\). Use finite saturation under reflexivity, symmetry,
transitivity, and the generator and inverse-generator actions.
The state is an \(n\times n\) Boolean relation. A monotone saturation
process has at most \(n^2\) strict additions; its termination measure and
polynomial time must be proved using Layer 1.

Prove that, for a transitive action on `Fin n` with \(n>1\), the action
is primitive if and only if every one of these relations is universal.
Relate invariant equivalence relations to Mathlib's blocks and
`IsPreprimitive`. This gives a polynomial-time ambient-primitivity
checker, without enumerating subsets of `Fin n` or group elements.
Handle degrees zero and one in the underlying API; the Jordan
certificate checker can reject them because its cardinality hypotheses
cannot hold.

### 2.3 Cycles and parity

Compute support, cycle decomposition, support size, and sign from a
permutation table. Prove agreement with `Equiv.Perm.support`,
`IsCycle`, and `sign`. Implement the predicate that the permutation
is one nontrivial cycle of prime length \(p\), with \(p+3\le n\).
Trial division up to \(p\) is sufficient here because \(p\le n\le m\).
Prove its correctness and polynomial cost.

Compute signs of generator words and products of conjugates. Prove the
parity rules for multiplication, inversion, and conjugation. These
rules support both evenness of an entire normal closure and explicit
odd witnesses.

## Layer 3: normal-closure certificates and Jordan recognition

### 3.1 Strong Jordan criteria

Formalize Wielandt's normal-subgroup strong Jordan criteria with
Mathlib's action vocabulary. For a primitive action of \(G\) on
\(\alpha\), a normal subgroup \(N\), and a set \(s\), assume
\[
|s|=a+1,\qquad a+2<|\alpha|.
\]
If `fixingSubgroup N s` acts transitively on the complement of \(s\),
then \(N\) acts doubly transitively on \(\alpha\). Also expose the
corresponding double-primitivity conclusion when that complement
action is primitive, and the formulation using the normal closure of
the ambient fixing subgroup.

Prove the certificate-oriented corollary: if \(H\le G\) fixes \(s\)
pointwise and is transitive on its complement, then
\(\langle\!\langle H\rangle\!\rangle_G\) is doubly transitive.
It is enough to supply one base point \(b\notin s\) and, for each
\(x\notin s\), an element \(v_x\in H\) with \(v_x(b)=x\).
The element \(v_yv_x^{-1}\) moves \(x\) to \(y\).

Transport these conclusions to the permutation image of the normal
closure. Apply the existing prime-cycle Jordan theorem to that image
to prove that it contains \(A_n\). Membership of the prime cycle must
be in the normal closure itself.

### 3.2 Certificate representation

A certificate contains the following fields in order:

1. A two-bit claim tag: `00` for double transitivity, `01` for equality
   with \(A_n\), `10` for equality with \(S_n\); reject `11`.
2. A unary count and a list of signed ambient-generator words
   \(h_0,\ldots,h_{r-1}\), generating \(H\le G\).
3. An \(n\)-bit characteristic mask for \(s\), followed by a base-point
   index \(b\).
4. For each point of the complement in increasing order, a signed word
   in the \(h_j\), witnessing that it sends \(b\) to that point.
5. For an \(A_n\) or \(S_n\) claim, a unary count and a list of
   conjugate factors. Each factor consists of an ambient-generator
   word \(u\), an index \(j\), and an inversion bit, and denotes
   \(u h_j^{\pm1}u^{-1}\).

The final list denotes a permutation \(g\in N\); prove membership by
normality and the generator-word interpretation. A plain word in
ambient generators does not by itself certify normal-closure
membership. Double-transitivity certificates omit the final field.
The decoder is determined by the claim tag and consumes the entire
encoding.

For decoded data, define a transparent validity predicate containing
the following finite conditions:

* the ambient action is primitive;
* \(s\) is nonempty, \(|s|+1<n\), and \(b\notin s\);
* every \(h_j\) fixes every point of \(s\);
* every orbit word has the prescribed image of \(b\);
* for the last two claim tags, the conjugate product \(g\) passes the
  prime-cycle predicate of Layer 2;
* for the alternating claim, every \(h_j\) is even;
* for the symmetric claim, at least one \(h_j\) is odd.

Prove that checking the finite conditions is equivalent to this
validity predicate. Prove the closure lemma turning pointwise fixing
of the generators into pointwise fixing of \(H\). Prove that even
generators imply \(K\le A_n\), since parity is preserved by
conjugation, and that an odd generator supplies an odd element of
\(K\). Combine these statements with \(A_n\le K\) to establish the
two equality claims.

### 3.3 Executable verifier and its cost

Implement the total verifier on raw Boolean lists. Its output is
`unknown` or one of the three certified claims. For malformed inputs,
malformed certificates, or failed checks, return `unknown`.

Prove:

* decoding and checking valid certificates returns their claim;
* a returned double-transitivity claim implies
  `IsMultiplyPretransitive K (Fin n) 2`;
* a returned alternating claim implies `K = alternatingGroup (Fin n)`;
* a returned symmetric claim implies `K = ⊤`;
* there is a `TM2ComputableInPolyTime` witness for this verifier, with
  an explicit `Polynomial ℕ` in the combined input and certificate
  lengths.

Account for parsing, table validation, word evaluation, orbit checking,
relation saturation, primality testing, cycle testing, and parity.
Stored tables, relation matrices, and intermediate words need explicit
polynomial size invariants. The existence of decidable predicates does
not supply these runtime bounds.

### 3.4 Explicit symmetric and alternating families

For \(n\ge5\), use the list of all transpositions \((i\,j)\), \(i<j\),
as ambient generators. Prove it generates \(S_n\). Let \(s=\{0\}\)
and generate \(H\) using the transpositions on its complement.
Use \(b=1\) and an identity or a transposition \((1\,x)\) for the
orbit witnesses. A transposition in \(H\) supplies a prime cycle of
length two and an odd generator. Prove that the verifier returns the
symmetric claim and that the resulting normal closure is \(S_n\).

For \(n\ge6\), use all three-cycles
`swap i j * swap j k` on ordered triples of distinct points as
ambient generators. Prove they generate \(A_n\). Let \(H\) use the
three-cycles on the complement of \(\{0\}\). With \(b=1\), choose a
third complement point to obtain a three-cycle sending \(b\) to any
other complement point; use the identity for \(b\). A three-cycle in
\(H\) supplies a prime cycle of length three, and every generator is
even. Prove that the verifier returns the alternating claim and the
normal closure is \(A_n\).

Construct the lists and witnesses directly from indices. Prove fixed
polynomial bounds on their encoded sizes and construction times.
Do not enumerate all permutations or all elements of the generated
groups. These constructions instantiate the generic checker and the
search wrapper below with success probability one.

## Layer 4: Bernoulli trials and failure amplification

### 4.1 Success indicators and conditional moments

For a measurable success event, define its real-valued zero-one
indicator. Prove its Bernoulli law, with parameter equal to the event's
probability, and expose measurable and integrable versions needed by
finite-product and conditional-expectation arguments.

For a random variable \(X\) with law `Ber(1, 0, p)` and a
sub-\(\sigma\)-algebra \(\mathcal F\), write
\(q_\mathcal F=\mathbb E[X\mid\mathcal F]\). Prove
\[
\operatorname{Var}(X\mid\mathcal F)
=q_\mathcal F(1-q_\mathcal F)
\quad\text{almost everywhere},
\qquad 0\le q_\mathcal F\le1.
\]
Expose both the product-of-conditional-expectations formulation and
the displayed conditional-mean formulation. Prove that independence
from \(\mathcal F\) gives \(q_\mathcal F=p\) almost everywhere and
conditional variance \(p(1-p)\).

For finitely many independent success indicators with common success
probability \(q\), prove the binomial law of the count of successes
and its mean \(rq\) and variance \(rq(1-q)\), reusing existing
Bernoulli and binomial results where available.

### 4.2 Exact and conditional failure bounds

For \(r\) independent trials of success probability \(q\), prove
\[
\mathbb P(\text{all }r\text{ trials fail})=(1-q)^r.
\]
Include \(r=0\), \(q=0\), and \(q=1\).

Also prove the reusable finite-history version: for success
indicators adapted to an increasing finite sequence of
sub-\(\sigma\)-algebras, if
\(\mathbb E[X_i\mid\mathcal F_i]\ge q\) almost everywhere,
then
\[
\mathbb P(\text{all }r\text{ trials fail})\le(1-q)^r.
\]
Here \(\mathcal F_i\) contains the outcomes of all trials before
trial \(i\). Prove the one-step recurrence using conditional
expectation and the event of previous failures. The conditional
variance identity does not establish independence, and the
conditional lower bound must be an explicit hypothesis.

For \(0\le q\le1\) and natural numbers \(r,k\), prove the numerical
amplification bounds
\[
(1-q)^r\le \exp(-qr),
\qquad
qr\ge k\Longrightarrow (1-q)^r\le2^{-k}.
\]
For \(q\ge1/R(m)\) and \(r=kR(m)\), deduce the requested
failure probability. Include the positivity assumption on \(R(m)\).

## Layer 5: a verified bounded search runner

### 5.1 Candidate-generator contract

A candidate generator is an executable deterministic function of a
raw input and a finite Boolean seed. It produces a certificate
encoding. Its contract supplies:

* a fixed natural-coefficient polynomial \(B\) bounding seed length;
* a polynomial-time machine for candidate generation;
* a polynomial bound on candidate length, derivable from the machine
  output-size theorem when appropriate;
* a fixed polynomial \(R\) and a proof that a uniformly drawn fresh
  seed gives an accepted certificate with probability at least
  \(1/R(m)\) for the input class under consideration;
* \(R(m)>0\) on that input class.

Use a transparent uniform distribution on finite Boolean seeds.
For a fixed input the success parameter is the fraction of seeds
accepted by generation followed by verification. Define this
mathematically and prove its Bernoulli interpretation; the algorithm
does not need to compute the fraction.

The contract applies to a stated input class, not to all permutation
groups by default. Candidate generators may produce malformed or
invalid certificates; the verifier handles them.

### 5.2 Runner semantics and final theorem

Given the input and unary precision \(k\), perform at most \(kR(m)\)
trials, with independent uniform seeds of length \(B(m)\), and stop
at the first accepted certificate. Return the claim together with
the accepted certificate, or `unknown` after all trials fail.

Formalize the deterministic seeded runner first. Prove that every
returned certificate verifies, hence that the associated group claim
is true for every seed sequence. Then equip the seed sequence with
the finite product law and prove the failure bound
\[
\mathbb P(\text{runner returns unknown})\le2^{-k}.
\]

Construct a finite TM2 implementation and a polynomial in \(m+k\)
bounding its worst-case execution, including candidate generation,
verification, seed reading, storage, and loop control. Seed input is
explicit in the machine model: the mathematical random-seed source
is represented by a read-only encoded stream. The number and total
length of seeds are bounded by
\(kR(m)B(m)\). The theorem must bound this external input in
\(m+k\) as well as the machine's own operations.

Instantiate the final theorem with the direct certificate generators
for the two families in Layer 3.4, taking \(R=1\) and ignoring the
seed. For \(k\ge1\), these instances return their correct claims
with probability one and polynomial worst-case time.

The completed result is an executable certified normal-closure
checker, a reusable amplification theorem with explicit sampling
assumptions, and concrete polynomial-time constructions recognizing
the stated symmetric and alternating families.

## References and contribution provenance

* H. Wielandt, *Finite Permutation Groups*: the strong Jordan
  normal-subgroup criteria and the prime-cycle criterion.
* Mathlib's finite permutation, subgroup, group-action, Turing-machine,
  Bernoulli, conditional-expectation, and finite-product probability
  APIs.
* Existing contributions toward Layer 1:
  [computable lists (#12581)](https://github.com/TauCetiProject/TauCeti/pull/12581),
  [polynomial evaluation monotonicity (#12582)](https://github.com/TauCetiProject/TauCeti/pull/12582),
  [TM2 output length (#12590)](https://github.com/TauCetiProject/TauCeti/pull/12590),
  [TM2 composition (#12591)](https://github.com/TauCetiProject/TauCeti/pull/12591).
* Existing contributions toward Layer 3:
  [strong Jordan criteria (#12583)](https://github.com/TauCetiProject/TauCeti/pull/12583).
* Existing contributions toward Layer 4:
  [Bernoulli conditional variance (#12586)](https://github.com/TauCetiProject/TauCeti/pull/12586).

These links identify relevant prior work. The mathematical targets above
stand independently of any particular implementation or contributor.

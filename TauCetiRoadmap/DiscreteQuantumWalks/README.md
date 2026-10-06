# Roadmap: finite discrete-time quantum walks

Discrete-time quantum walks evolve by powers of a finite unitary matrix.  Their two principal
graph models are coined walks, where a coin is followed by a conditional shift on directed
edges, and Szegedy walks, where a stochastic matrix supplies two reflections on a doubled state
space.  The subject has a clean finite-dimensional core but currently lacks a shared Lean API:
unitarity, spectral mapping, graph/Markov adapters, transfer and mixing, symmetry reduction, and
standard examples are repeatedly reconstructed as ad hoc matrix calculations.

This roadmap builds that core on Mathlib matrices and stochastic matrices.  It is separate from
continuous-time walks because the spectral maps, state spaces and quotient compatibility are
different; it consumes the same equitable-operator reduction library where an invariant
cell-uniform subspace really exists.

Suggested home: `TauCeti/Analysis/Matrix/DiscreteQuantumWalk/` and graph adapters under
`TauCeti/Combinatorics/SimpleGraph/QuantumWalk/`.

## Ownership and boundaries

This roadmap owns:

- finite unitary discrete dynamics and step-indexed transfer/mixing notions;
- coined walks on finite port systems and directed-edge spaces;
- Szegedy walks from Mathlib row-stochastic matrices;
- discriminant/spectral-mapping theorems and invariant two-dimensional blocks;
- lumping/equitable reductions proved by explicit intertwiners;
- search, hitting and standard finite-family examples within these unitary models.

It consumes the [equitable operator-reduction roadmap][equitable-roadmap] for partition embeddings
and exact powers of
intertwined matrices.  It consumes the continuous-time roadmap only for shared graph-family
definitions, not for dynamics.

It does not own completely positive maps, density matrices, Kraus channels, Lindblad semigroups,
quantum Markov decision processes, graphon operators, scaling limits to Dirac equations, or query-
complexity advantage.  Those require distinct roadmaps and stronger foundations.  In particular,
a unitary walk followed by measurement is not silently identified with an open quantum channel.

## Conventions

1. **Evolution order.** A coined step is `U = S C`: the coin acts first on a column state, then
   the shift.  A Szegedy step is the ordered product of the two pinned reflections.  Reversing an
   order gives a related walk, not definitional equality.
2. **Discrete time.** Evolution at `n : ℕ` is `U^n`.  PST from `u` to `v` at step `n` means
   `U^n e_u = γ e_v` for a unit phase, with the unit-amplitude formulation proved equivalent.
3. **Unitary predicate.** Use a shared matrix predicate/equivalence for `UᴴU=1` and prove the
   finite-square converse `UUᴴ=1`; do not introduce separate incompatible predicates in the
   coined and Szegedy namespaces.
4. **Stochastic input.** Szegedy walks consume Mathlib's `Matrix.rowStochastic ℝ V`.  Zero rows are
   impossible by construction.  Reversible chains and symmetric weights are additional
   hypotheses, not part of the base definition.
5. **Square-root amplitudes.** The isometry associated to `P` has coefficients `sqrt(P x y)`.
   Every theorem records which coordinate is the current vertex and which is the proposed next
   vertex.  A two-state nonsymmetric chain is the transpose-regression test.
6. **Doubled space.** Szegedy states live on `V × V`.  The swap and reflection operators are
   explicit matrices/linear isometries and the discriminant is computed from the two isometries;
   it is not assumed to be the original transition matrix.
7. **Coined space.** The general model uses a finite coin/port type and a bijective conditional
   shift.  The flip-flop walk on directed graph edges is an adapter.  Irregular graphs do not get
   padded with fictitious ports without an explicit construction.
8. **Quotient claim.** Compression of a walk to an invariant subspace is always meaningful.
   Identification of that compression with the intrinsic coined/Szegedy walk of a quotient graph
   needs a separate coin-amplitude theorem; it must not follow merely from graph equitability.

## Foundations to consume

- Mathlib matrices, conjugate transpose, Kronecker product, finite-dimensional inner products and
  `Matrix.rowStochastic` / `Matrix.colStochastic`.
- Mathlib `SimpleGraph`, darts/edges, regular graphs, adjacency matrices and finite group actions.
- Mathlib real square roots, finite sums, polynomial/characteristic-polynomial and Hermitian
  spectral theory.
- The [equitable operator-reduction roadmap][equitable-roadmap] for normalized cell embeddings,
  powers and
  compression.
- The finite spectral quantum-walk roadmap for shared graph families and cospectral vocabulary
  where it applies.

## Layer 0 — finite unitary steps

Develop a common API for finite unitary matrices:

- identity, multiplication, powers, inverse, conjugate transpose, Kronecker products and
  permutation conjugation;
- norm preservation and orthonormal columns/rows;
- transition amplitudes/probabilities and doubly-stochastic probability matrices;
- step-indexed PST, periodicity, PGST along a sequence of steps, and instantaneous mixing;
- invariant subspaces, compressions and exact reduction of all powers through an intertwiner.

Acceptance examples: identity, a swap, a phase diagonal, and a three-cycle permutation matrix.
The swap locks transfer orientation and the three-cycle locks multiplication order.

## Layer 1 — coined walks

Define a coined walk from a finite vertex type `V`, coin type `C`, a bijective conditional shift
on `C × V`, and a unitary coin on `C`.  Develop:

- the conditional-shift permutation matrix and proof of unitarity;
- the lifted coin `coin ⊗ I`, its matrix entries and unitarity;
- unitarity of `S(C⊗I)` and formulas for its action on basis states;
- vertex-position measurement by summing over coin states;
- position transfer, periodicity and mixing, kept distinct from basis-state transfer in the full
  coin-position space;
- direct sums, product coins and symmetry under port-preserving graph automorphisms.

For graph walks, define the directed-edge/arc state space, flip-flop shift and Grover diffusion
coin.  Prove regular-graph and irregular-graph constructions separately and relate the arc model
to Mathlib's darts.

## Layer 2 — coined spectral mapping

Construct the incidence/isometry from vertex states to arc states and the discriminant operator.
Prove:

- the projection/reflection identities for the Grover coin;
- invariant two-dimensional blocks generated by a discriminant eigenvector;
- the Joukowsky/cosine spectral map from discriminant eigenvalues to walk eigenphases;
- the exceptional `±1` eigenspaces with correct multiplicities;
- characteristic-polynomial and spectrum formulas for finite regular graphs;
- consequences for periodicity and search.

Repeated eigenvalues and bipartite graphs are mandatory tests because the exceptional phases are
easy to lose in a generic block argument.

## Layer 3 — Szegedy walks

For `P : Matrix.rowStochastic ℝ V`, define the square-root isometry, its range projection, the
swap, the two reflections and the ordered Szegedy step.  Prove:

- the isometry and projection laws;
- reflection Hermiticity, involutivity and unitarity;
- unitarity of the Szegedy walk;
- the discriminant `D = Aᴴ S A`, its entry formula `sqrt(Pxy Pyx)`, Hermiticity, and norm bound;
- the invariant two-dimensional block and full spectral mapping, including exceptional spaces;
- the reversible-chain specialization and relation to the symmetrized Markov operator;
- behavior under reindexing, direct sums and products of chains.

Acceptance chains: deterministic permutation, two-state reversible/nonsymmetric chains, complete
mixing and a simple random walk on a regular graph.

## Layer 4 — lumping and equitable reduction

Develop cell embeddings on the doubled state space and prove the exact statements they support:

- strong lumpability of a stochastic matrix and its quotient row-stochastic matrix;
- intertwining of the Markov operator and its powers;
- sufficient conditions for the Szegedy isometry, swap and reflections to preserve the doubled
  cell-uniform subspace;
- the compressed Szegedy walk and cell-uniform matrix-element equality;
- equivalence of cell-uniform PST/mixing with the compressed walk;
- an explicit theorem identifying the compression with the quotient chain's intrinsic Szegedy
  walk under the required square-root coin-amplitude compatibility;
- analogous port-compatible reductions for coined walks.

Include a counterexample where the graph quotient exists but the intrinsic quotient coin does not
match the compressed walk.  This guards the most tempting false identification in the subject.

## Layer 5 — search and hitting

Formalize unitary search schemes by specifying initial state, oracle/reflection, walk step and
measurement.  Develop:

- marked-set reflections and amplitude amplification identities;
- absorbing-chain/Szegedy search constructions and the discriminant gap relation;
- finite hitting and detection probabilities at a fixed step and under time averaging;
- symmetry reductions that preserve the marked set;
- exact analyses of complete graphs and cycles/small paths;
- a clean interface separating an amplitude theorem from an algorithm and its query cost.

No asymptotic speedup theorem is accepted without a classical comparator and an explicit cost
model.

## Layer 6 — standard families and computation

Provide proved instances for:

- Grover walks on cycles, complete graphs, hypercubes and finite regular graphs;
- Szegedy walks of simple random walks on complete graphs, cycles and bipartite examples;
- Cartesian/product chains and product coined walks;
- automorphism reductions and quotient examples with unequal cells.

Add computable finite constructors, exact small-matrix evaluation and decision procedures for
fixed-step transfer/periodicity.  Prove soundness of the procedures and keep floating-point
simulation outside theorem statements.

## Acceptance gates

- Coin, shift, reflection and full-step unitarity are proved from their actual hypotheses.
- Position transfer is distinguished from transfer in the full coin-position basis.
- Both coined and Szegedy spectral mappings include exceptional `±1` eigenspaces.
- `Matrix.rowStochastic` is the stochastic carrier; the nonsymmetric two-state regression fixes
  all coordinate orientations.
- Cell-uniform Szegedy PST/mixing is equivalent to the compressed walk, while identification with
  the intrinsic quotient walk carries the extra coin-amplitude hypothesis.
- At least one nontrivial coined family and one nontrivial Szegedy family are analyzed end to end.

## Prior formalization and coordination

[Graphplay](https://github.com/emberian/graphplay) commit
[`822204a`](https://github.com/emberian/graphplay/commit/822204afe580a93206aa71adbe66b98f9e2beac8)
contains sorry-free prototypes in `DiscreteTime.lean`, `DiscreteTime/Lifts.lean` and
`StdLib/CoinedWalk.lean`.  They prove coined and Szegedy unitarity, discriminant block
correspondences, cell-uniform Szegedy PST/mixing iff compressed PST/mixing, and an explicit
compatibility theorem for identifying the compression with a quotient walk.  The Graphplay
author is coordinating this roadmap and permits adaptation under MIT/Apache-2.0.  Tau Ceti should
replace Graphplay's private graph carrier and local stochastic predicates with Mathlib objects.

Graphplay's open-system, graphon-Lindblad and continuum-limit modules are not prior
formalizations of this roadmap and are intentionally excluded.

## References

- M. Szegedy, *Quantum speed-up of Markov chain based algorithms*.
- J. Kempe, *Quantum random walks: an introductory overview*.
- A. Ambainis et al., work on coined quantum-walk search.
- C. Portugal, *Quantum Walks and Search Algorithms*.
- T. Doliwa et al., work on quotient constructions for discrete quantum walks.

[equitable-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/257

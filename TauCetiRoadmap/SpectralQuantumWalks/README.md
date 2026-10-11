# Roadmap: finite spectral graph theory and continuous-time quantum walks

Continuous-time quantum walks turn a finite Hermitian matrix `A` into the unitary group

`U_A(t) = exp(-i t A)`.

For an adjacency matrix this dynamics connects algebraic graph theory, matrix analysis and
quantum transport.  Perfect and pretty-good state transfer, periodicity, instantaneous and
average mixing, search Hamiltonians, and product constructions are all questions about matrix
elements of `U_A(t)` and the spectral projectors of `A`.

The goal is a Mathlib-native finite spectral-dynamics library: the general Hermitian-matrix
theory, its graph adapters, the arithmetic characterizations of transfer, and a tested catalogue
of graph families.  Existing proofs in Graphplay show that a substantial portion is reachable,
but the Tau Ceti development should be organized around standard matrix and graph objects rather
than Graphplay's application-specific carrier.

Suggested home: `TauCeti/Combinatorics/SimpleGraph/Spectral/` and
`TauCeti/Analysis/Matrix/QuantumWalk/`.

## Ownership and dependencies

This roadmap owns:

- finite Hermitian continuous-time dynamics and its transition amplitudes/probabilities;
- local spectral support, cospectrality and strong cospectrality;
- perfect state transfer (PST), pretty-good state transfer (PGST), periodicity, fractional
  revival, instantaneous mixing and average mixing;
- spectral and arithmetic criteria for those phenomena;
- Cartesian-product/Kronecker-sum transport and standard finite graph families;
- finite continuous-time spatial search and its exact symmetry reductions.

It consumes the [equitable-partition/operator-reduction roadmap][equitable-roadmap] for invariant
cell subspaces and
quotient dynamics.  It consumes Mathlib's matrix exponential, Hermitian spectral theorem,
polynomials, algebraic numbers, Kronecker products and `SimpleGraph` library.  General operator
perturbation belongs to the [Hilbert-space operator-theory roadmap][operator-roadmap].

It does not own discrete-time coined or Szegedy walks, quantum channels/Lindblad evolution,
graphon limits, quantum query-complexity lower bounds, hardware compilation, or categorical
reformulations.  A statement that a quantum walk is fast is not by itself a computational
advantage theorem; this roadmap proves the dynamics and states complexity only when a classical
model and lower bound are separately formalized.

## Conventions

1. **Generator and sign.** `U_A(t) = exp((-i t) A)`.  The amplitude from `u` to `v` is
   `U_A(t) v u` (column states).  Every product and search theorem uses this orientation.
2. **Primary carrier.** The core object is an arbitrary finite Hermitian complex matrix.  Zero
   diagonal, real symmetry, nonnegative weights, integrality and simple-graph support are
   hypotheses or adapters, not fields of a universal “weighted graph” structure.
3. **PST is phase equality.** Define PST at time `t` by
   `U_A(t)e_u = γ e_v` for some `‖γ‖ = 1`; prove equivalence with
   `‖U_A(t) v u‖ = 1` using unitarity.  Do not use the modulus statement as a shortcut before
   proving that equivalence.
4. **Real eigenvalue indexing.** Hermitian spectral projectors are indexed by real eigenvalues.
   Local support at `u` consists of the eigenvalues whose projector does not kill `e_u`.
   Results insensitive to repeated entries must be phrased by distinct eigenvalues/projectors,
   not by an arbitrary enumeration of eigenvectors.
5. **Average mixing.** The average mixing matrix is the Cesàro limit of entrywise transition
   probabilities and equals the sum of Schur squares of distinct spectral projectors.  It is not
   `|lim U(t)|²`, and instantaneous uniform mixing does not imply average uniform mixing.
6. **Graph conventions.** Ordinary graphs use Mathlib `SimpleGraph.adjMatrix`.  Cartesian graph
   product must agree with Mathlib's graph product and its adjacency matrix must be proved equal
   to the Kronecker sum.  Loops/diagonal potentials are represented by the Hamiltonian matrix,
   without changing the underlying simple graph.
7. **Search Hamiltonian.** Pin
   `H(A, γ, w) = -γ A - |w⟩⟨w|` and evolve it by the same `exp(-itH)` convention.  Global sign
   changes are theorem-level equivalences, never silently mixed within calculations.
8. **Gauge/switching invariance.** Diagonal unitary conjugation and permutation similarity are
   explicit equivalences.  Chiral phases are Hermitian edge weights; gauge-invariant cycle
   holonomy is kept distinct from a removable choice of vertex phases.

## Foundations to consume

- Mathlib Hermitian matrices, `Matrix.IsHermitian.eigenvalues`, unitary diagonalization,
  spectrum, eigenspaces, matrix exponential and finite sums.
- Mathlib `SimpleGraph`, adjacency/laplacian matrices, paths, cycles, complete graphs, products,
  Cayley and circulant graph infrastructure where available.
- Mathlib Kronecker products, characteristic/minimal polynomials, Chebyshev polynomials,
  cyclotomic fields, algebraic integers and irrationality tools.
- The [equitable operator-reduction roadmap][equitable-roadmap] for cell embeddings, exact
  matrix-function
  intertwining and perturbative quotient errors.
- The [operator-theory roadmap][operator-roadmap] for general functional calculus and spectral
  perturbation.

## Layer 0 — finite Hermitian evolution

Define `unitaryEvolution A t` and develop its complete basic API:

- `U(0)=1`, `U(s+t)=U(s)U(t)`, `U(-t)=U(t)ᴴ=U(t)⁻¹`, unitarity and normality;
- derivative and Schrödinger equation `dU/dt = -i A U = -i U A`;
- invariance under unitary conjugation, permutation reindexing, real/complex scalar shifts and
  diagonal gauge switching;
- transition amplitudes and probabilities, nonnegativity, row/column sums, time reversal and
  symmetry for real-symmetric matrices;
- spectral-projector expansion `U(t)=∑_λ exp(-itλ)E_λ`, grouped by distinct eigenvalues.

Acceptance examples are the zero Hamiltonian, a two-state coupling, a diagonal Hamiltonian and a
permuted two-state system.  They lock the time, row/column and conjugation conventions.

## Layer 1 — local spectral theory

Develop spectral projectors and local spectral support with:

- projector orthogonality, completeness, Hermitian/idempotent laws and matrix-element formulas;
- local multiplicities `(E_λ)_{u,u}`, their nonnegativity and sum one;
- cospectral vertices via equal local multiplicities, with equivalent deleted-characteristic-
  polynomial and closed-walk-count formulations;
- strong cospectrality via `E_λ e_u = ± E_λ e_v` on every supported eigenspace;
- automorphism orbits imply cospectrality, while examples distinguish automorphic,
  cospectral and strongly cospectral vertices;
- support under Cartesian products, equitable quotients and diagonal shifts.

Repeated eigenvalues are a mandatory regression.  No theorem may depend on which orthonormal
basis Mathlib chooses inside an eigenspace.

## Layer 2 — transfer, periodicity and revival

Define PST/PGST at vertices and normalized states, vertex periodicity, fractional revival on a
finite subset, and cell-uniform transfer through normalized cell states.  Prove:

- PST symmetry, time reversal, phase uniqueness and preservation under switching/permutation;
- PST implies strong cospectrality and equal local spectra;
- PST from `u` to `v` implies periodicity at both vertices at time `2t`;
- periodicity and transfer criteria in terms of phases on local spectral support;
- diagonal scalar shifts preserve transition probabilities and PST times;
- exact equivalence between cell-uniform host transfer and quotient transfer from the equitable
  reduction API;
- the corresponding necessary support and phase conditions for PGST;
- subset fractional revival in spectral-projector and invariant-subspace forms.

Include counterexamples to the converses “cospectral implies PST” and “strongly cospectral
implies PST.”

## Layer 3 — arithmetic characterization

Formalize the finite arithmetic theory used in Godsil's characterizations:

- ratio conditions on differences of eigenvalues in local support;
- phase alignment on the plus/minus strong-cospectral support;
- the exact PST criterion and formula for admissible transfer times;
- periodicity criteria and algebraic-integer consequences for integral symmetric matrices;
- Kronecker's simultaneous approximation theorem in the form needed for PGST, and the parity
  obstruction/criterion for strongly cospectral vertices;
- negative criteria from irrational or incompatible eigenvalue ratios.

State every load-bearing hypothesis.  Real symmetry, full support, integrality and simple
spectrum are not interchangeable.  The exact theorem must be tested on a matrix with repeated
eigenvalues and on a strongly-cospectral non-PST pair.

## Layer 4 — mixing

Define instantaneous uniform mixing and the average mixing matrix.  Develop:

- doubly-stochasticity of each transition-probability matrix and of the average mixing matrix;
- the projector/Schur-product formula for the Cesàro limit;
- symmetry, positive semidefiniteness, trace and rank bounds;
- rationality for integral symmetric matrices through a proved Galois-invariance argument;
- behavior under Cartesian products and switching;
- exact relations and separations among PST, periodicity, instantaneous uniform mixing and
  average uniform mixing.

The hypercube must demonstrate instantaneous uniform mixing at its standard time and failure of
average uniform mixing in nontrivial dimensions.

## Layer 5 — products and graph constructions

Develop the Cartesian product at the matrix and graph levels:

- adjacency as a Kronecker sum;
- commutation of the two summands and exponential factorization;
- entrywise tensor formula for transition amplitudes;
- PST, periodicity and mixing product theorems.

Add direct sums/disjoint unions, joins, coronas and graph bundles only with complete matrix
formulas and clearly stated hypotheses.  Switching/gauge equivalence belongs here for complex
Hermitian weights.  Do not import speculative bundle-lift claims without a proved intertwiner.

## Layer 6 — finite spatial search

Define the marked-vertex Hamiltonian and success probability from an initial normalized state.
Prove:

- exact reduction under a marked-refined equitable partition;
- complete-graph reduction to its two-dimensional invariant subspace and the exact success
  amplitude/time;
- hypercube reduction to the Hamming-weight chain;
- perturbation stability by consuming the approximate-intertwiner bounds;
- criteria separating a dynamical hitting theorem from a query-complexity advantage theorem.

The complete graph is the end-to-end acceptance case.  General-dimensional hypercube optimal
timing is included only when its Krawtchouk/spectral estimate is proved in the library, never as a
typeclass assumption named after the desired conclusion.

## Layer 7 — standard library of families

Provide Mathlib-native definitions/adapters and proved results for:

- paths and cycles, including the exact unweighted PST classifications;
- complete and complete multipartite graphs;
- hypercubes and Hamming graphs;
- Cayley/circulant graphs over finite abelian groups;
- Cartesian powers and products;
- representative joins, coronas and graphs with tails where they illustrate a general theorem.

For each family, prove its adjacency formula, spectrum/projectors or character diagonalization,
and then derive transport results.  A table of isolated computed examples is not a replacement
for a family theorem.  Computational decision procedures may accompany the theory, but their
soundness and completeness must be proved.

## Acceptance gates

- `U_A(t)` is a unitary group with the pinned sign and amplitude orientation.
- PST by phase equality is equivalent to unit transition amplitude and implies strong
  cospectrality.
- The spectral-projector expansion is insensitive to repeated-eigenvalue bases.
- Godsil's exact transfer criterion proves both directions under its stated hypotheses.
- The Cartesian-product exponential factorization yields antipodal hypercube PST at `π/2` and
  instantaneous uniform mixing at `π/4`.
- The average mixing matrix is doubly stochastic and is not confused with instantaneous mixing.
- Complete-graph search is proved by an exact two-dimensional reduction.
- Paths/cycles include positive and negative classification cases.

## Prior formalization and coordination

[Graphplay](https://github.com/emberian/graphplay) commit
[`822204a`](https://github.com/emberian/graphplay/commit/822204afe580a93206aa71adbe66b98f9e2beac8)
contains a sorry-free proof-of-concept across `Weighted.lean`, `PST/*.lean`, `Mixing.lean`,
`Search.lean`, `Product/PST.lean` and `StdLib/*.lean`.  A full local build at that commit
completed successfully (3,975 jobs).  Its clean results include quotient/PST equivalence,
PST-implies-strong-cospectrality, both directions of a Godsil-style criterion under explicit
hypotheses, Cartesian-product evolution, antipodal hypercube PST and uniform mixing, and several
negative results.  Some deeper classifications are represented there by named external
assumptions; this roadmap instead makes the missing mathematics explicit targets.

The Graphplay author is coordinating this roadmap and permits adaptation under the repository's
MIT/Apache-2.0 license.  The existing code is provenance rather than an API prescription.

## References

- C. Godsil, *State Transfer on Graphs* and related papers on periodic graphs.
- C. Godsil and G. Royle, *Algebraic Graph Theory*.
- A. E. Brouwer and W. H. Haemers, *Spectra of Graphs*.
- C. Godsil, S. Kirkland, S. Severini and J. Smith, work on number-theoretic PST criteria.
- A. Childs and J. Goldstone, *Spatial search by quantum walk*.

[equitable-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/257
[operator-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/126

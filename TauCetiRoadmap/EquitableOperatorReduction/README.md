# Roadmap: equitable partitions and finite operator reduction

An equitable partition is a finite symmetry reduction that does not require a group action.
For a matrix `A` on a finite state space and a partition of the states, equitability says that
the sum of the entries of each row into a target cell depends only on the source cell.  In its
normalized Hilbert-space form this is exactly an intertwining relation

`A E = E Q`,

where the columns of `E` are normalized cell indicators and `Q = Eᴴ A E` is the compressed
operator.  This one identity explains invariant cell-constant subspaces, quotient spectra,
exact reduction of matrix functions and time evolutions, and the familiar symmetric quotient
`D^(1/2) B D^(-1/2)` of a graph divisor matrix.  A controlled residual
`R = A E - E Q` gives the approximate theory.

The goal is a reusable library for finite matrices and operators.  Quantum walks, spectral
graph theory, structured linear algebra, Markov chains, and block algorithms are consumers;
none should need to redevelop the partition calculus in a private vocabulary.

Suggested home: `TauCeti/LinearAlgebra/Matrix/Equitable/`, with graph adapters under
`TauCeti/Combinatorics/SimpleGraph/Equitable/`.

## Ownership and boundaries

This roadmap owns:

- finite cell partitions and their adapters to Mathlib's `Finpartition`;
- exact algebraic equitability for rectangular and square matrices;
- normalized cell embeddings, compression, invariant cell-constant subspaces, and quotient
  intertwiners over `ℝ` and `ℂ`;
- transport of polynomial, power-series, exponential, resolvent, and spectral information
  through an exact intertwiner;
- quantitative residual bounds for approximately equitable partitions;
- adapters from Mathlib `SimpleGraph`, weighted adjacency matrices, Laplacians, stochastic
  matrices, and orbit partitions.

It does not own perfect state transfer, quantum-walk classifications, graph regularity,
graphons, Weisfeiler--Leman theory, or attention architectures.  Those theories consume this
roadmap.  In particular, “equitable” here means constant block row sums, not Mathlib's
`Set.EquitableOn` (balanced cardinalities) and not an `IsEquipartition` from the regularity
lemma.

The spectral perturbation results here are the finite intertwiner estimates specific to the
residual `A E - E Q`.  General Davis--Kahan theory, principal angles, operator ideals, and
unbounded spectral theory belong to the Hilbert-space operator-theory roadmap and should be
consumed where available.

## Conventions

1. **Two interfaces, one notion.**  The computational interface is a surjective cell map
   `cell : V → I`; the combinatorial interface is a `Finpartition (Finset.univ : Finset V)`.
   Build inverse adapters and prove that all definitions agree.  Public graph theorems should
   accept the Mathlib partition form when no explicit quotient index is needed.
2. **Empty cells are excluded.**  Cell maps are surjective.  This makes normalized indicators
   honest and prevents quotient rows that are artifacts of an empty index.
3. **Algebraic and Hilbert tiers stay distinct.**  Constant block-row sums and the raw quotient
   make sense over a semiring.  Conjugate transpose, normalized indicators, orthogonal
   compression, and Hermitian conclusions are stated over `RCLike` scalars.  Do not force the
   algebraic API through square roots.
4. **Normalized compression is canonical.**  For finite `V` and `I`, the embedding
   `E : I →ₗ[𝕜] V` sends a cell basis vector to `1_C / sqrt |C|`; hence `EᴴE = 1` and the
   symmetric quotient is definitionally or theorem-level equal to `Eᴴ A E`.  The raw divisor
   matrix is a secondary coordinate form.
5. **Matrix orientation is fixed.**  Matrices act on column vectors by `Matrix.mulVec`; row
   index is the source state and the branching number into cell `j` is
   `∑ y, if cell y = j then A x y else 0`.  Every adapter gets a two-cell regression test so
   a transpose error cannot survive.
6. **Approximation is measured by the intertwining residual.**  The primary defect is an
   operator norm of `A E - E Q`, not a bespoke entrywise epsilon predicate.  Entrywise block
   oscillation and Frobenius bounds are proved as sufficient estimates for this norm.
7. **No private graph type.**  Graph-facing results use Mathlib's `SimpleGraph`, its adjacency
   matrix and Laplacian APIs.  Weighted or chiral networks are Hermitian matrices together with
   whatever support condition a consumer needs; looplessness is a hypothesis, not baked into
   the general operator carrier.

## Existing foundations to consume

- Mathlib `Matrix`, `mulVec`, conjugate transpose, Kronecker products, matrix norms, Hermitian
  matrices and the matrix exponential.
- Mathlib `Finpartition`, finite sums, fibers, `Fintype`, and equivalences of finite index
  types.
- Mathlib `SimpleGraph`, adjacency matrices, Laplacians, graph maps and automorphisms.
- Tau Ceti's bounded-operator exponential and semigroup infrastructure when a statement is
  cleaner at the operator level.
- The Hilbert-space operator-theory roadmap for general spectral-subspace perturbation and
  functional-calculus infrastructure.

## Layer 0 — finite partitions and cell calculus

Develop the cell-map object/predicate and the `Finpartition` adapters with a complete API:
fibers, nonemptiness, cardinalities, sums by fibers, refinement, relabeling by an equivalence,
restriction to unions of cells, products of partitions, and orbit partitions of finite group
actions.  Prove extensionality up to relabeling rather than making quotient indices part of the
mathematical identity of a partition.

Define the cell-constant submodule of `V → 𝕜`, the raw indicator map, the normalized embedding,
and the averaging/coordinate map.  Prove the expected inverse and projection identities,
including `EᴴE = 1`, `EEᴴ` as the orthogonal projection onto cell-constant vectors, its action
as within-cell averaging, and norm preservation.

Acceptance examples: the indiscrete partition, the discrete partition, a two-block partition
with unequal cell sizes, a relabeling, and a nontrivial orbit partition.

## Layer 1 — exact algebraic equitability

For a matrix `A : Matrix V W R` and source/target cell maps, define constant block-row sums in
the general rectangular form.  Develop:

- branching sums and their independence of representatives;
- the raw quotient matrix and its uniqueness;
- equivalence among constant block-row sums, preservation of cell-constant vectors, and a raw
  indicator intertwining identity;
- closure under zero, identity, addition, scalar multiplication, multiplication/composition,
  transpose where the corresponding column condition is present, block diagonal sums, and
  Kronecker products;
- refinement and coarsening criteria, with counterexamples showing that an arbitrary refinement
  of an equitable partition need not remain equitable;
- automorphism-orbit partitions as equitable partitions, without claiming the converse.

The rectangular form is required: it is the reusable statement behind block algorithms and
compositions, while square graph quotients are only one specialization.

## Layer 2 — normalized Hermitian quotient

Specialize to square real or complex matrices.  Define the normalized compression `Eᴴ A E` and
prove:

- exact equitability iff `A E = E (Eᴴ A E)`;
- Hermitian `A` gives Hermitian compression;
- the cell-constant subspace is invariant, and for Hermitian `A` its orthogonal complement is
  invariant as well;
- the restriction of `A` to the invariant subspace is unitarily equivalent to the normalized
  quotient;
- the normalized quotient is diagonally similar to the raw divisor matrix, with the precise
  cell-cardinality factors;
- eigenvectors lift, geometric multiplicities do not decrease, and quotient spectrum is
  contained in host spectrum;
- Cauchy interlacing for arbitrary orthogonal compression, with equality/inclusion sharpened
  under equitability.

The unequal-two-cell example is a sign and normalization gate: the raw quotient is generally
not Hermitian even when `A` is, while the normalized quotient is.

## Layer 3 — functions of an intertwined operator

Build a general finite-dimensional intertwiner API.  From `A E = E Q`, prove the relation for
powers and polynomials, then for convergent power series and the matrix exponential.  Add the
resolvent identity away from the two spectra and the Hermitian continuous-functional-calculus
form when the operator-theory API supports it.

Required consequences include exact reduction of:

- discrete iterates `A^n E = E Q^n`;
- continuous evolution `exp(tA) E = E exp(tQ)`;
- unitary evolution generated by a Hermitian matrix;
- heat/Markov evolution when the generator preserves the cell-constant space;
- spectral projectors and matrix elements between normalized cell states.

The theorem should be stated for an arbitrary isometric intertwiner before specializing to a
cell embedding.

## Layer 4 — approximate equitability

Define the residual `R = A E - E Q` and develop its elementary calculus under sums, products,
changes of cell coordinates, and perturbations of `A` and `Q`.  Prove:

- telescoping bounds for `A^n E - E Q^n`;
- a Duhamel/variation-of-constants identity and norm bound for
  `exp(tA) E - E exp(tQ)`;
- resolvent residual bounds away from the spectra;
- approximate eigenvector and nearby-spectrum consequences for Hermitian matrices;
- observable and transition-amplitude error estimates;
- sufficient residual bounds from entrywise block oscillation, rowwise `ℓ¹` error, Frobenius
  error, and best block-constant approximation.

State constants explicitly.  Include zero-residual recovery of every exact theorem and a
two-by-two perturbation whose error is attained to first order.

## Layer 5 — standard adapters

Connect the core theory to:

- `SimpleGraph.adjMatrix`, weighted real-symmetric and complex-Hermitian adjacency matrices;
- combinatorial equitable partitions and divisor matrices;
- adjacency, combinatorial Laplacian and normalized Laplacian conventions;
- Mathlib row-stochastic and column-stochastic matrices, strong lumpability, and the induced
  quotient chain;
- orbit partitions under graph automorphisms;
- Cartesian products and product partitions.

Each adapter proves agreement with the intrinsic matrix definition.  The graph regularity
roadmap's equipartitions and the dense-graph-limits roadmap's measurable partitions are merely
neighboring notions; no coercion between them should be introduced without a theorem explaining
the changed semantics.

## Acceptance gates

- The normalized cell embedding is an isometry and its range is exactly the cell-constant
  subspace.
- Exact equitability has all three characterizations: block sums, invariant subspace, and
  intertwining.
- The normalized quotient of a Hermitian matrix is Hermitian; the raw unequal-cell divisor
  example demonstrates why normalization matters.
- Matrix exponentials and spectral projectors commute with the embedding.
- The approximate exponential estimate specializes to equality at residual zero and has a
  concrete nonzero regression.
- Mathlib simple graphs, stochastic matrices, and orbit partitions all use the same core API.

## Prior formalization and coordination

The public Lean library [Graphplay](https://github.com/emberian/graphplay), at commit
[`822204a`](https://github.com/emberian/graphplay/commit/822204afe580a93206aa71adbe66b98f9e2beac8),
contains a substantial proof-of-concept in `Weighted.lean`, `Equitable.lean`, `Spectral.lean`,
`PST/QuotientIff.lean`, and `Integrations/EpsEquitable.lean`, including normalized quotient
intertwiners, spectral inclusion, exact evolution reduction, and perturbative dynamics.  Its
author is coordinating this roadmap and permits reuse under the repository's MIT/Apache-2.0
licensing.  Graphplay is provenance, not specification: it has a private graph carrier and
several application-driven interfaces that should be replaced by Mathlib-native, more general
ones here.

## References

- C. Godsil and G. Royle, *Algebraic Graph Theory*, sections on equitable partitions.
- A. E. Brouwer and W. H. Haemers, *Spectra of Graphs*.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*.
- A. Bachman et al., work on quotient graphs and perfect state transfer.

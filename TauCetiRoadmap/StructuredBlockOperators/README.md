# Roadmap: structured block operators and certified fast application

Many dense finite operators have repeated structure induced by a partition of their input and
output indices.  If

`A i j = B (rowCell i) (colCell j)`,

then applying `A` to a batch of feature vectors can be done by first summing within input cells
and then applying the smaller block matrix `B`.  The resulting algorithm is exact, its operation
count is transparent, and the same algebra supports controlled approximate reductions.  This is
the mathematical core behind segment-uniform attention, grouped linear layers, quotient/residual
methods, and several symmetry-aware kernels.

The goal is a reusable library of structured finite operators and verified algorithms, not an ML
framework.  Exact block-constant structure, the weaker invariant-subspace notion of equitability,
and approximate low-rank/block structure must be distinguished in both definitions and
complexity claims.

Suggested home: `TauCeti/LinearAlgebra/Matrix/Structured/` and verified finite algorithms under
`TauCeti/Algorithm/LinearAlgebra/Structured/`.

## Ownership and dependencies

This roadmap owns:

- rectangular block-constant matrices and exact fiber-sum application algorithms;
- explicit arithmetic/communication cost models for those algorithms;
- best block approximation, quotient-plus-residual decompositions and certified error bounds;
- stable row normalization/softmax adapters under explicit analytic hypotheses;
- banded and circulant application as distinct structured mechanisms;
- decidable certificates whose accepted output implies the mathematical structure and error
  bounds used by a downstream computation.

It consumes the [equitable-operator-reduction roadmap][equitable-roadmap] for cell-constant
subspaces and invariant
quotient dynamics.  It consumes Mathlib matrix norms, finite sums, singular values and
permutation/reindexing.  General low-rank approximation and singular-value perturbation should
align with the [Hilbert-space operator-theory roadmap][operator-roadmap].

It does not own transformer semantics, training convergence, neural tangent kernels, quantum
algorithms, hardware compilation, empirical model claims, or claims that learned dense attention
is exactly structured.  Such statements may use this library after producing the required
certificate.

## Conventions

1. **Rectangular first.** `A : Matrix M N R` has independent surjective row and column cell maps.
   Square one-partition operators are a specialization.
2. **Column-vector application.** For features `X : N → D → R`, full application is
   `Y i e = ∑ j, A i j * X j e`.  The block algorithm first computes
   `cellSum c e = ∑ j, if colCell j = c then X j e else 0`.
3. **Block-constant is stronger than equitable.** Exact application to arbitrary `X` requires
   entries constant on each block.  Equal block row sums merely preserve the cell-constant
   subspace and gives exact reduction only for cell-constant inputs.  APIs and theorem names must
   never conflate these properties.
4. **Costs count a specified program.** Define multiplication, addition, storage and optionally
   communication counts for a concrete algorithm.  An identity such as `n*r*d = O(n)` is not a
   verified running-time theorem by itself.  State parameter regimes and preprocessing costs.
5. **Approximation norm is explicit.** Use Mathlib operator, Frobenius/Hilbert--Schmidt, row
   `ℓ¹`, or entrywise norms as the theorem requires.  Never name an epsilon without saying which
   norm it controls.
6. **Canonical block approximation.** For squared Frobenius loss the block value is the mean of
   each occupied block.  Empty blocks are excluded by surjective cell maps.  Weighted variants
   carry the weight in the definition and theorem.
7. **Residual correction is algebra, not magic.** `A = A_block + R`; applying a rank-`k`
   factorization of `R` costs what the factor application costs.  Any low-rank claim is backed by
   an exact factorization or a singular-value error certificate.
8. **Nonlinear normalization is a separate layer.** Softmax or row normalization can destroy
   approximate block structure.  Stability theorems carry explicit bounded-logit/denominator and
   Lipschitz hypotheses.
9. **Banded/circulant are not cell quotients.** A sliding-window operator earns sparse
   `O(n w)` application; a circulant operator earns character/FFT diagonalization.  Neither is
   advertised as an `O(n r)` cell reduction unless it separately satisfies the block predicate.

## Foundations to consume

- Mathlib matrices, `mulVec`, finite fiber sums, `Finpartition`, matrix norms, Frobenius inner
  product, rank, singular values and Kronecker products.
- Mathlib `ZMod`, finite Fourier/character theory, polynomial arithmetic and computable finite
  structures.
- The [equitable operator-reduction roadmap][equitable-roadmap] for normalized embeddings,
  invariant subspaces,
  quotient operators and residual bounds.
- The [operator-theory roadmap][operator-roadmap] for Eckart--Young, unitarily invariant norms and
  perturbation tools
  when those targets land.

## Layer 0 — partitions and block-constant matrices

Define rectangular block structure from row/column cell maps and develop:

- extensionality and uniqueness of the small block matrix;
- construction by pullback `B (rowCell i) (colCell j)`;
- closure under zero, addition, scalar multiplication, transpose/conjugate transpose,
  reindexing, block-compatible multiplication and Kronecker products;
- conversion to/from occupied `Finpartition`s;
- rank bound by the number of occupied row/column cells;
- relation to the cell-constant submodules and the normalized compression.

Prove that block-constant implies the corresponding equitable row-sum property, with the cell
cardinality factor.  Supply a matrix that is equitable but not block-constant as a regression.

## Layer 1 — exact fiber-sum application

Define the full and block algorithms on a feature matrix `X : N → D → R`.  Prove by a genuine
fiberwise reindexing theorem that they agree for a block-constant matrix.  Develop:

- cell sums and their incremental/batched forms;
- the rectangular and square algorithms;
- fusion with bias, pointwise feature maps and multiple heads where the cell maps agree;
- reverse-mode derivatives with respect to `B` and `X`, and equality to differentiating the
  full expression;
- exact arithmetic counts for preprocessing and application;
- memory-access and stored-entry counts for explicit array representations.

Acceptance includes unequal cell sizes, nonsymmetric rectangular matrices, multiple feature
columns and a zero-dimensional feature type.

## Layer 2 — certified complexity

Define a small cost semantics for the straight-line/fold programs used in Layer 1.  Prove:

- dense application performs the stated `|M||N||D|` scalar products/additions up to the pinned
  convention for the first accumulator;
- block application performs the cell aggregation plus `|M||C||D|` contraction cost;
- batched reuse of precomputed cell sums and the break-even inequality;
- peak storage and, for a distributed partition, communication volume under an explicit layout;
- cost preservation/refinement for code extraction to finite arrays.

Use exact natural-number identities/inequalities first.  Derive asymptotic statements only through
a defined asymptotic relation and clearly fixed parameters.

## Layer 3 — block approximation and residuals

For arbitrary real/complex `A`, define the canonical block-average approximation for fixed cell
maps.  Prove:

- orthogonal-projection/Pythagorean characterization in Frobenius space;
- block means minimize squared Frobenius residual;
- operator and output error bounds `‖(A-A_block)X‖` in compatible norms;
- entrywise oscillation and rowwise bounds implying operator bounds;
- monotonicity of optimal error under partition refinement;
- quotient-plus-residual decomposition and exact corrected application;
- rank-`k` residual approximation with Eckart--Young error, consuming the general singular-value
  API rather than reproving it privately;
- end-to-end cost/error tradeoffs for block plus low-rank residual application.

Include a lower bound showing when a proposed residual rank cannot represent `A` exactly.  The
bound must be genuinely below the ambient dimension and use the rank of the block part.

## Layer 4 — approximate equitability and dynamics

Connect the block-residual theory to the weaker operator-reduction residual:

- block approximation implies a bound on `A E - E Q`;
- exact equitability corresponds to zero invariant-subspace residual but not necessarily zero
  block-constant residual;
- approximate eigenvector/spectrum and exponential-dynamics bounds are imported from the
  equitable-reduction roadmap;
- iterative structured layers accumulate error by explicit telescoping/Gronwall bounds;
- residual correction restores exactness when the residual is applied exactly.

This layer is the shared interface for structured numerical linear algebra and symmetry-reduced
dynamics; it should not mention an ML architecture.

## Layer 5 — normalized kernels and attention as consumers

Formalize row normalization and softmax on finite matrices with the analytic API needed to prove:

- exact block-constant logits remain block-constant after rowwise softmax, with the required
  cell-multiplicity correction made explicit;
- stable softmax/output error under a specified norm and bounded logits;
- segment/group-uniform attention as an exact instance of Layer 1;
- grouped-query attention as a head-axis instance, separate from token-axis grouping;
- pooled/interchangeable-token reduction on the cell-constant sector via the equitable roadmap;
- certified approximate attention from a checked residual bound.

Do not claim a generic dense learned attention matrix has this structure.  The input to every fast
theorem is either a construction that guarantees it or a verified certificate.

## Layer 6 — sparse, banded and circulant operators

Build separate reusable APIs for:

- finite support per row and sparse application;
- banded matrices on line/cyclic index types and exact `O(n w)` counts;
- circulant matrices on `ZMod n`, convolution form and character diagonalization;
- radix-2 FFT cost/correctness once the corresponding finite Fourier algorithm exists;
- sums and compositions of block, sparse, banded, circulant and low-rank components with combined
  cost/error certificates.

Each structure has its own predicate and eliminator.  Conversion theorems exist only when one
structure really implies another.

## Layer 7 — executable certificates

Define decidable certificate formats for rational/algebraic or interval-enclosed matrices:

- exact block constancy and exact equitability;
- entrywise/block oscillation bounds;
- operator/Frobenius residual bounds with a checked derivation;
- exact low-rank factorizations and certified approximate factorizations;
- band/support/circulant structure.

Prove checker soundness against the mathematical predicates and provide negative tests for a
single corrupted entry, a transposed cell map and an underestimated interval.  Floating-point
data enters through interval/rational certificates; a Boolean comparison of raw floats is not a
proof.

## Acceptance gates

- Exact block application equals dense application by fiberwise regrouping for rectangular
  matrices and arbitrary feature dimension.
- Block-constant and equitable are distinguished by theorems and a concrete counterexample.
- Exact cost theorems account for aggregation, contraction and preprocessing.
- Block means are the Frobenius-optimal fixed-partition approximation.
- Quotient-plus-low-rank residual carries both an output error and a verified cost bound.
- Softmax stability states its norm and boundedness hypotheses; exact segment attention is an
  instance, not an assumption.
- Banded and circulant algorithms are proved through their own structure.
- Every executable certificate has a theorem connecting acceptance to the mathematical claim.

## Prior formalization and coordination

[Graphplay](https://github.com/emberian/graphplay) commit
[`822204a`](https://github.com/emberian/graphplay/commit/822204afe580a93206aa71adbe66b98f9e2beac8)
contains sorry-free prototypes in `Integrations/AttentionComplexity.lean`,
`StructuredAttention.lean`, `EquitableMechanism.lean`, `EpsEquitable.lean`,
`EpsSoftmax.lean`, `EpsDynamics.lean` and `EquitableCertChecker.lean`.  Proven examples include
exact fiber-sum application, explicit operation-count identities, block-average residual
optimality, structured attention families and checked finite certificates.  The Graphplay author
is coordinating this roadmap and permits adaptation under MIT/Apache-2.0.

Tau Ceti should generalize the core away from attention, replace local graph/matrix wrappers with
Mathlib vocabulary, and treat Graphplay's empirical/model-specific modules as applications rather
than source specifications.

## References

- R. A. Horn and C. R. Johnson, *Matrix Analysis*.
- G. H. Golub and C. F. Van Loan, *Matrix Computations*.
- C. Godsil and G. Royle, *Algebraic Graph Theory*, for equitable partitions.
- A. Vaswani et al., *Attention Is All You Need*, for the motivating normalized-kernel consumer.
- I. Beltagy et al., *Longformer*, for the distinct banded/sliding-window consumer.

[equitable-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/257
[operator-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/126

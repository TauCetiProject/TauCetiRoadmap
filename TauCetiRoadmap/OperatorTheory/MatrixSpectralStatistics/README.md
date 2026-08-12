# Matrix spectral statistics: rank factorizations, spectral measurability, and concentration

## Introduction

Spectral statistics passes between three forms of structure: low-rank matrix factorizations,
deterministic spectral control, and probabilistic error bounds. Positive-semidefinite Gram matrices
encode finite point configurations. Entrywise control of a Hermitian matrix gives operator-norm and
sorted-eigenvalue control. Sample moments supply entrywise error bounds, and concentration converts
those bounds into high-probability spectral conclusions.

The three Parts follow this pipeline. Part A develops rank and Gram factorizations, including their
natural uniqueness actions. Part B develops the deterministic bridge from matrix entries to spectra,
together with measurability of matrix spectral constructions. Part C develops finite-sample moment
identities and elementary matrix concentration. Combined with
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md), Parts B and C turn a
matrix estimation bound into a statistical spectral-subspace bound.

Suggested homes: `TauCeti/LinearAlgebra/Matrix/`, `TauCeti/Analysis/Matrix/`,
`TauCeti/Probability/Moments/`, and supporting measure-theory files under `TauCeti/MeasureTheory/`.

## Notation and terminology

- **Matrices and dimensions.** `M`, `A`, `B`, and `Ŝ` denote finite matrices. An inner factorization
  dimension is represented by `Fin r`.
- **Scalar fields.** Rank factorization in Part A is over an arbitrary field. Gram factorization and
  the deterministic Hermitian spectral layer are over `ℝ` or `ℂ`. The statistical model in Part C
  is real-valued.
- **Adjoint.** `Aᴴ` denotes the conjugate transpose of a matrix.
- **Gram matrix.** A matrix of the form `AᴴA` is the Gram matrix of the columns of `A`.
- **Euclidean operator.** `Matrix.toEuclideanLin A` denotes the linear operator induced by a square
  matrix on the corresponding Euclidean space.
- **Sorted eigenvalues.** For Hermitian `A`, `(λ₀(A),…,λ_{n-1}(A))` denotes the nonincreasing
  eigenvalue list with multiplicity. The Lean interface uses Mathlib's
  `Matrix.IsHermitian.eigenvalues₀` indexing.
- **Entrywise control.** An entrywise bound means `‖A i j‖ ≤ ε` for every pair of indices. The
  associated Euclidean operator bound carries the explicit dimension factor `n`.
- **Fixed-threshold spectral projector.** For a deterministic threshold `c`, `P_[c,∞)(A)` denotes
  the orthogonal projector onto the sum of Hermitian eigenspaces with eigenvalue in `[c,∞)`.
- **Empirical second moment.** `M̂ = r⁻¹∑ᵢ VᵢVᵢᵀ` denotes the uncentered empirical second-moment
  matrix.
- **Finite mean and centered scatter.** For a finite family `(zᵢ)`, `z̄` denotes its finite mean and
  `S(z)=∑ᵢ (zᵢ-z̄)⊗(zᵢ-z̄)` its unnormalized centered scatter operator.
- **Independence convention.** Sample-mean identities use pairwise independence and a common mean.
- **Dimension constants.** The elementary concentration route uses the factors `n` in the
  entrywise-to-operator comparison and `n²` in the union bound.

## What Mathlib already has (consume)

- **Matrix linear algebra:** `Matrix.rank` with `rank_mul_le` and the column-space API;
  `Matrix.PosSemidef` with `posSemidef_conjTranspose_mul_self` and
  `rank_conjTranspose_mul_self`; `Matrix.IsHermitian.spectral_theorem`, `eigenvalues`,
  `eigenvectorUnitary`; `Matrix.toEuclideanLin` and the `ℓ²` operator-norm API.
- **Sorted eigenvalues:** `Matrix.IsHermitian.eigenvalues₀` and
  `Matrix.IsHermitian.eigenvalues₀_antitone`. The rank count, positive-semidefinite
  nonnegativity, and vanishing-tail statements are built here for this indexing.
- **Spectral theory of operators:** `LinearMap.IsSymmetric.eigenvalues` / `eigenvectorBasis` and
  `Matrix.isSymmetric_toEuclideanLin_iff`.
- **Probability:** `ProbabilityTheory.variance` with `IndepFun.variance_sum`, the Bochner integral,
  `MemLp`, and `MeasureTheory.TendstoInMeasure`.
- **Hermitian continuous functional calculus:** Mathlib's generic `cfc` for Hermitian matrices over
  `RCLike`, including continuity in the operator variable (`continuousOn_cfc`).

---

## What is missing (build here)

- Rank factorization through `Fin r`, positive-semidefinite Gram factorization, and their natural
  uniqueness actions.
- Entrywise-to-operator and entrywise-to-eigenvalue estimates, basic sorted-eigenvalue theory, and
  measurable spectral constructions for Hermitian matrices.
- Finite-sample mean and second-moment identities, centered scatter, and elementary matrix
  concentration.

## The build, in layers

The labels in Parts A–C form the complete mathematical obligation set for this roadmap. Each label
names one definition or theorem. Milestones and acceptance examples cite these labels.
`Suggested.lean` cites the labels represented by its sample declarations.

### Part A — rank factorization and positive-semidefinite Gram factorization

Rank factorization identifies matrix rank with the least inner dimension of a product. The
positive-semidefinite specialization identifies low-rank Gram matrices with finite point
configurations. Their uniqueness groups are respectively changes of basis and left unitaries.

- **MSS-A01 — Exact-rank factorization.** Every matrix `M : Matrix m n 𝕜` over a field factors as
  `M=LR` through `Fin (rank M)`.
- **MSS-A02 — Zero-padded rank factorization.** If `rank M ≤ r`, then `M=LR` for matrices
  `L : Matrix m (Fin r) 𝕜` and `R : Matrix (Fin r) n 𝕜`.
- **MSS-A03 — Rank-factorization characterization.** For every `r`,
  `rank M ≤ r` exactly when `M` factors through `Fin r`.
- **MSS-A04 — Hermitian spectral expansion.** If `B` is Hermitian with eigenvalues `(λ_k)` and
  unitary eigenvector matrix `U`, then
  `B i j = ∑_k λ_k U i k conjugate(U j k)`.
- **MSS-A05 — Square Gram factorization.** Every positive-semidefinite square matrix `B` admits a
  square factor `A` with `B=AᴴA`.
- **MSS-A06 — Rank-controlled Gram factorization.** If `B` is positive semidefinite and
  `rank B ≤ d`, then `B=AᴴA` for some `A : Matrix (Fin d) (Fin n) 𝕜`.
- **MSS-A07 — Gram-factorization characterization.** A square matrix `B` is positive semidefinite
  with `rank B ≤ d` exactly when `B=AᴴA` for some `d`-row matrix `A`.
- **MSS-A08 — Exact-rank factorization uniqueness.** If `rank M=r` and
  `M=LR=L'R'` through `Fin r`, then there is an invertible `g` on `Fin r` with
  `L'=Lg` and `R'=g⁻¹R`.
- **MSS-A09 — Gram-factorization uniqueness.** If `AᴴA=A'ᴴA'` for two `d`-row Gram factors, then
  `A'=UA` for a unitary `U` on the row space.

**Milestone A1 — rank factorization.** `MSS-A01`–`MSS-A03`.

**Milestone A2 — positive-semidefinite Gram factorization.** `MSS-A04`–`MSS-A07`.

**Milestone A3 — uniqueness actions.** `MSS-A08`–`MSS-A09`.

### Part B — matrix spectra and spectral measurability

Part B connects entrywise matrix data to Euclidean operator and spectral data. It also supplies the
measurability needed to apply deterministic spectral constructions to random Hermitian matrices.
The fixed-threshold projector is the canonical cluster object used in the presence of eigenvalue
multiplicity.

- **MSS-B01 — Entrywise measurable structure on matrices.** For measurable entry type `α`, the
  product measurable structure on `m → n → α` induces a measurable structure on `Matrix m n α`.
- **MSS-B02 — Borel structure on matrices.** For countable index types and a second-countable
  Borel entry space, the entrywise measurable structure on matrices is the Borel structure.
- **MSS-B03 — Entrywise-to-operator comparison.** For an `n×n` matrix over `ℝ` or `ℂ`,
  `‖A i j‖≤ε` for all `i,j` implies
  `‖A x‖≤n ε ‖x‖` for every Euclidean vector `x`.
- **MSS-B04 — Entrywise eigenvalue perturbation.** If Hermitian `A` and `Â` satisfy
  `‖Â i j-A i j‖≤ε` entrywise, then
  `|λ_k(Â)-λ_k(A)|≤n ε` for every sorted eigenvalue index `k`.
- **MSS-B05 — A-priori sorted-eigenvalue bound.** If Hermitian `A` satisfies
  `‖A i j‖≤β` entrywise, then `|λ_k(A)|≤n β` for every `k`.
- **MSS-B06 — Rank count for sorted eigenvalues.** For Hermitian `A`, `rank A` equals the number
  of nonzero entries in its sorted eigenvalue list.
- **MSS-B07 — Positive-semidefinite sorted eigenvalues.** Every sorted eigenvalue of a
  positive-semidefinite matrix is nonnegative.
- **MSS-B08 — Positive-semidefinite vanishing tail.** If positive-semidefinite `A` has
  `rank A≤d`, then every sorted eigenvalue with index at least `d` is zero.
- **MSS-B09 — Continuity of Hermitian functional calculus.** For continuous `h : ℝ → ℝ`, the map
  `A ↦ h(A)` is continuous on finite Hermitian matrices.
- **MSS-B10 — Measurability of Hermitian functional calculus.** If `A(ω)` is a measurable
  Hermitian random matrix and `h : ℝ → ℝ` is continuous, then `ω ↦ h(A(ω))` is measurable.
- **MSS-B11 — Fixed-threshold spectral projector.** For Hermitian `A` and deterministic `c`,
  define the orthogonal projector `P_[c,∞)(A)` onto the sum of eigenspaces with eigenvalue in
  `[c,∞)`.
- **MSS-B12 — Measurability of the fixed-threshold projector.** For fixed `c`, the map
  `A ↦ P_[c,∞)(A)` is Borel measurable on Hermitian matrices.
- **MSS-B13 — Random-matrix threshold projector.** If `A(ω)` is a measurable Hermitian random
  matrix, then `ω ↦ P_[c,∞)(A(ω))` is measurable for every fixed `c`.
- **MSS-B14 — Threshold rank stability.** Let `A` and `Â` be Hermitian, and suppose
  `|λ_k(A)-c|>δ` for every sorted eigenvalue index `k`. If `‖Â-A‖<δ`, then `A` and `Â` have the
  same number of eigenvalues in `[c,∞)`, counted with multiplicity.
- **MSS-B16 — Measurability-free complement bound.** For a probability measure `P` and any set
  `S`, `1-P(Sᶜ)≤P(S)`.
- **MSS-B17 — Convergence in measure from `edist` rates.** If `rate_i→0` and
  `P{rate_i<edist(f_i,g)}→0`, then `f_i→g` in measure.
- **MSS-B18 — Convergence in measure from distance rates.** If `rate_i→0` and
  `P{rate_i<dist(f_i,g)}→0`, then `f_i→g` in measure.
- **MSS-B19 — High-probability convergence in measure.** If `rate_i→0`, the events
  `{dist(f_i,g)≤rate_i}` are null-measurable, and their probabilities tend to `1`, then
  `f_i→g` in measure.

**Milestone B1 — measurable matrix structure and deterministic spectral bridge.** `MSS-B01`–`MSS-B08`.

**Milestone B2 — continuous spectral functions.** `MSS-B09`–`MSS-B10`.

**Milestone B3 — fixed-threshold spectral projectors.** `MSS-B11`–`MSS-B14`.

**Milestone B4 — probability-to-convergence bridges.** `MSS-B16`–`MSS-B19`.

### Part C — sample moments and matrix concentration

Part C starts from scalar second-moment estimates and pairwise independence. The sample-mean
identities provide the `1/r` mean-square scale, centered scatter records deterministic finite-sample
geometry, and the entrywise union bound turns per-entry second moments into operator and eigenvalue
concentration.

- **MSS-C01 — Uncentered Chebyshev inequality.** If `Y²` is integrable,
  `∫Y² dP≤v`, and `η>0`, then `P{η<Y}≤ENNReal.ofReal(v/η²)`.
- **MSS-C02 — Scalar sample-mean identity.** For pairwise-independent square-integrable real
  random variables with common mean `c`,
  `∫(r⁻¹∑_k Z_k-c)² dP = r⁻²∑_k ∫(Z_k-c)² dP`.
- **MSS-C03 — Vector sample-mean identity.** For pairwise-independent square-integrable random
  vectors in a finite-dimensional real Hilbert space with common mean `μ`,
  `∫‖r⁻¹∑_k X_k-μ‖² dP = r⁻²∑_k ∫‖X_k-μ‖² dP`.
- **MSS-C04 — Identically distributed sample-mean form.** If the per-sample mean-square errors in
  `MSS-C03` are equal, then the sample-mean mean-square error is `1/r` times the common value.
- **MSS-C05 — Uniform sample-mean bound.** If every per-sample mean-square error is at most `γ`,
  then the sample-mean mean-square error is at most `γ/r`.
- **MSS-C06 — Finite mean.** Define `z̄ = n⁻¹∑_i z_i` for a finite family in a normed
  `RCLike` module, with the empty mean equal to `0` under the ambient total-inverse convention.
- **MSS-C07 — Centered sum.** For every finite family, `∑_i (z_i-z̄)=0`.
- **MSS-C08 — Add-one mean identity.** If `z'` appends `y` to a family of size `n`, then
  `z̄' = z̄ + (n+1)⁻¹(y-z̄)`, including `n=0`.
- **MSS-C09 — Centered scatter.** Define
  `S(z)=∑_i (z_i-z̄)⊗(z_i-z̄)` as a bounded self-map of the ambient Hilbert space.
- **MSS-C10 — Add-one scatter identity.** Appending `y` gives
  `S(z') = S(z) + n/(n+1) (y-z̄)⊗(y-z̄)`.
- **MSS-C11 — Scatter quadratic form.** For every `x`,
  `Re⟪S(z)x,x⟫ = ∑_i |⟪z_i-z̄,x⟫|²`.
- **MSS-C12 — Positivity of centered scatter.** The operator `S(z)` is positive.
- **MSS-C13 — Monotonicity under appending.** `S(z)≤S(z')` in Löwner order after appending one
  point.
- **MSS-C14 — Add-one quadratic-form identity.** The quadratic form of `S(z')` equals that of
  `S(z)` plus `n/(n+1)|⟪y-z̄,x⟫|²`.
- **MSS-C15 — Empirical second moment.** Define
  `M̂_{kl}(ω)=r⁻¹∑_i V_i(ω)_k V_i(ω)_l`.
- **MSS-C16 — Hermitian empirical second moment.** For every sample `ω`, `M̂(ω)` is Hermitian.
- **MSS-C17 — Per-entry second-moment bound.** Let `r>0`, fix coordinates `k,l`, and put
  `Y_i(ω)=V_i(ω)_kV_i(ω)_l`. Assume every `Y_i` is square-integrable, every `Y_i` has common
  mean `M_{kl}`, the family `(Y_i)` is pairwise independent, all centered second moments
  `∫|Y_i-M_{kl}|²` are equal, and their common value is at most `v`. Then
  `∫(M̂_{kl}-M_{kl})² ≤ v/r`.
- **MSS-C18 — Entrywise concentration.** If every entry of `Ŝ-A` has mean square at most `v`, then
  `P{∃k,l, η<|Ŝ_{kl}-A_{kl}|}≤ENNReal.ofReal(n²v/η²)` for `η>0`.
- **MSS-C19 — Measurability of the entrywise deviation event.** If every entry of `Ŝ` is
  measurable, then `{ω | ∃k,l, η<|Ŝ_{kl}(ω)-A_{kl}|}` is measurable.
- **MSS-C20 — Eigenvalue concentration.** For Hermitian `Ŝ(ω)` and Hermitian `A`, with probability
  at least `1-ENNReal.ofReal(n²v/η²)`, every sorted eigenvalue differs by at most `nη`.
- **MSS-C21 — One-sided eigenvalue floor.** Under the hypotheses of `MSS-C20`, with the same
  probability every sorted eigenvalue of `Ŝ(ω)` is at least the corresponding eigenvalue of `A`
  minus `nη`.
- **MSS-C22 — Operator-norm concentration.** Under the entrywise second-moment hypotheses, with
  probability at least `1-ENNReal.ofReal(n²v/η²)`,
  `‖(Ŝ(ω)-A)x‖≤nη‖x‖` for every Euclidean vector `x`.
- **MSS-C23 — Empirical-second-moment eigenvalue floor.** Applying `MSS-C21` to `M̂` gives the
  corresponding high-probability eigenvalue lower bound for an empirical second-moment matrix;
  in particular, taking `η=c/(2d)` keeps a population eigenvalue bounded below by `c` above
  `c/2` on the resulting event.

**Milestone C1 — scalar and vector sample-mean identities.** `MSS-C01`–`MSS-C05`.

**Milestone C2 — finite means and centered scatter.** `MSS-C06`–`MSS-C14`.

**Milestone C3 — empirical second moments.** `MSS-C15`–`MSS-C17`.

**Milestone C4 — entrywise, eigenvalue, and operator concentration.** `MSS-C18`–`MSS-C23`.

## Worked examples (acceptance criteria)

### Part A

The rank-factorization characterization is `MSS-A01`–`MSS-A03`; the Gram characterization is
`MSS-A04`–`MSS-A07`; the two natural uniqueness actions are `MSS-A08`–`MSS-A09`.

### Part B

The deterministic entrywise-to-spectral path is `MSS-B03`–`MSS-B08`. The continuous and
fixed-threshold measurable spectral constructions are `MSS-B09`–`MSS-B14`. The convergence-in-
measure consumers are `MSS-B16`–`MSS-B19`.

### Part C

The `1/r` sample-mean scale is `MSS-C02`–`MSS-C05`; the exact add-one scatter calculus is
`MSS-C06`–`MSS-C14`; and the sample-second-moment concentration path is `MSS-C15`–`MSS-C23`.

## Ordering

Part A depends only on Mathlib. Part B depends on
[`PolarDecomposition`](../PolarDecomposition/README.md) for the finite-dimensional Weyl bound and
otherwise on Mathlib's matrix spectral theory and continuous functional calculus. Part C depends on
Part B's entrywise-to-spectral bridge and on Mathlib probability and integration.

Within Part B, the entrywise operator estimate precedes eigenvalue perturbation and the sorted-index
lemmas; the measurable continuous and threshold spectral constructions use the resulting spectral
control. Within Part C, scalar moments feed the sample-mean and empirical-second-moment estimates,
and the entrywise concentration event feeds both the eigenvalue and operator-norm conclusions.

## Definitions

**D1 (`MSS-B09`–`MSS-B10`).** `h(A)` denotes Mathlib's Hermitian continuous functional calculus
for a fixed continuous real function `h`.

**D2 (`MSS-B11`–`MSS-B14`).** `P_[c,∞)(A)` denotes the fixed-threshold orthogonal spectral
projector of a Hermitian matrix.

**D3 (`MSS-C15`–`MSS-C17`).** `M̂=r⁻¹∑ᵢVᵢVᵢᵀ` is the uncentered empirical
second-moment matrix.

**D4 (`MSS-C06`–`MSS-C14`).** `S(z)=∑ᵢ(zᵢ-z̄)⊗(zᵢ-z̄)` is the unnormalized centered scatter
operator.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — spectral theorem, positive
  semidefinite Gram factorizations, Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling and positive-semidefinite Gram embeddings.
- R. Vershynin, *High-Dimensional Probability* (2018) — sample second-moment concentration and
  its uses.

## Acknowledgements

An Apache-2.0 implementation of Part A and most of Parts B and C exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.),
in `TauCeti.*` and `TauCeti.Matrix.*` namespaces.

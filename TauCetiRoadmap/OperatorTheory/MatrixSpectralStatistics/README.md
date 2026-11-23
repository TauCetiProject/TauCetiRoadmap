# Roadmap: matrix spectral statistics — rank factorizations, spectral measurability and concentration

**Summary.** This roadmap collects the finite-dimensional matrix analysis on which statistical
applications of spectral perturbation theory rest: low-rank and Gram factorizations of matrices; a
deterministic passage from the entries of a Hermitian matrix to its operator norm and its
eigenvalues, with the measurability that lets spectral constructions be applied to random
matrices; and elementary concentration of a random matrix from entrywise second moments, with the
finite-sample identities for means, scatter operators and empirical second-moment matrices that
feed it. Matrices are indexed by finite types. Rank factorization is over any field, everything
spectral is over `ℝ` or `ℂ`, and the eigenvalues of a Hermitian `n × n` matrix are listed in
nonincreasing order with multiplicity, `λ_0 ≥ λ_1 ≥ … ≥ λ_(n-1)`.

Four theorems carry it. A square matrix `B` over `ℝ` or `ℂ` is positive semidefinite of rank at
most `d` exactly when `B = AᴴA` for a matrix `A` with `d` rows, that is, when `B` is the Gram
matrix of `n` points in `d`-dimensional space; two such factors differ by a `d × d` unitary acting
on the left. If Hermitian `n × n` matrices `A` and `Â` have entries within `ε` of each other, then
`|λ_k(Â) − λ_k(A)| ≤ nε` for every `k`. If `ω ↦ A(ω)` is a measurable random Hermitian matrix,
then `ω ↦ h(A(ω))` is measurable for every continuous `h : ℝ → ℝ`, and so is the orthogonal
projector onto the eigenspaces of `A(ω)` with eigenvalue at least `c`, although that projector is
not continuous in the matrix. If `Ŝ` is a random Hermitian `n × n` matrix, `A` a fixed Hermitian
matrix, and every entry of `Ŝ − A` has second moment at most `v`, then for `η > 0`, with
probability at least `1 − n²v/η²`, every `λ_k(Ŝ)` lies within `nη` of `λ_k(A)`. For the empirical
second-moment matrix of `r` samples of a `d`-dimensional real vector, whose coordinate products are
pairwise independent across samples with second moment at most `v` about the population matrix
`M`, it follows that with probability at least `1 − 4d⁴v/(rc²)` every eigenvalue of `M` that is at
least `c > 0` stays at least `c/2`.

The roadmap stands on Mathlib's matrix rank, positive semidefiniteness, sorted eigenvalues of
Hermitian matrices, continuous functional calculus and probability theory. From
[PolarDecomposition](../PolarDecomposition/README.md) it takes Weyl's perturbation bound
`|λ_k(S) − λ_k(T)| ≤ ‖S − T‖` for symmetric operators. Applied on the high-probability events of
the last Part, the population-gap `sin Θ` theorem of
[SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md) turns a matrix
estimation bound into a statistical bound for spectral subspaces.

Part A below gives the rank and Gram factorizations and their uniqueness (milestones A1–A3).
Part B passes from entries to operator norms and sorted eigenvalues, makes spectral functions and
fixed-threshold projectors of random matrices measurable, and bridges high-probability bounds to
convergence in measure (B1–B4). Part C gives the sample-mean and scatter identities, the empirical
second-moment matrix, and the entrywise route to eigenvalue and operator-norm concentration
(C1–C4).

## Conventions

1. **Matrices.** `M`, `A`, `B` and `Ŝ` denote matrices `Matrix m n 𝕜` with finite index types
   (`[Fintype n]` wherever a sum over `n` occurs); an inner factorization dimension is `Fin r`.
   Rank factorization (MSS-A01–MSS-A03, MSS-A08) is over an arbitrary field. Gram factorization
   and every spectral statement are over a field `𝕜` with `[RCLike 𝕜]`, that is `ℝ` or `ℂ`. The
   statistical model of Part C is real-valued; identities that hold over `RCLike` are stated there
   in that generality.
2. **Adjoint and Gram matrices.** `Aᴴ` is the conjugate transpose, Mathlib's
   `Matrix.conjTranspose`. For `A : Matrix m n 𝕜` with columns `a_j`, `Aᴴ * A` is the Gram matrix
   of the columns: `(Aᴴ * A) i j = ⟪a_i, a_j⟫`, for Mathlib's inner product, which is
   conjugate-linear in its first argument. Unitary matrices form `Matrix.unitaryGroup m 𝕜`.
3. **Euclidean operator and norms.** `Matrix.toEuclideanLin A` is the linear map of a matrix on
   `EuclideanSpace 𝕜 n`, which carries the Euclidean norm; we write `A x` for its value at `x`.
   Where a matrix norm `‖A‖` appears (Weyl's bound MSS-B20, the threshold statement MSS-B14) it is
   the ℓ² operator norm of Mathlib's scope `Matrix.Norms.L2Operator`, the operator norm of
   `Matrix.toEuclideanCLM A`. Elsewhere operator bounds are written pointwise, `‖A x‖ ≤ C‖x‖` for
   every `x`.
4. **Sorted eigenvalues.** For `hA : A.IsHermitian` with `A : Matrix n n 𝕜`, Mathlib's
   `hA.eigenvalues₀ : Fin (Fintype.card n) → ℝ` lists the eigenvalues with multiplicity in
   nonincreasing order (`Matrix.IsHermitian.eigenvalues₀_antitone`); `λ_k(A)` denotes its `k`-th
   entry, `k = 0, …, n − 1`. The unsorted eigenvalues `hA.eigenvalues : n → ℝ` go with the
   eigenvector unitary `hA.eigenvectorUnitary`, whose `k`-th column is a unit eigenvector for
   `hA.eigenvalues k`.
5. **Entrywise control and dimension constants.** An entrywise bound on `A` is
   `∀ i j, ‖A i j‖ ≤ ε`. Comparing it with the Euclidean operator costs the factor `n` for an
   `n × n` matrix and `√(card m) · √(card n)` for an `m × n` one; the union bound over entries in
   Part C costs `n²`. These constants are part of the specification: the roadmap follows this
   elementary route and does not sharpen them.
6. **Functional calculus and threshold projectors.** (D1) For `h : ℝ → ℝ` and a square matrix
   `A`, `h(A)` is Mathlib's `cfc h A`. For Hermitian `A` it acts on an eigenvector of `A` with
   eigenvalue `μ` as multiplication by `h μ`; for a matrix that is not Hermitian, `cfc h A = 0`
   (Mathlib's `cfc_apply_of_not_predicate`). (D2) For a deterministic threshold `c : ℝ`, the
   fixed-threshold spectral projector is `P_[c,∞)(A) = cfc ((Set.Ici c).indicator 1) A`; for
   Hermitian `A` it is the orthogonal projector onto the sum of the eigenspaces of `A` with
   eigenvalue in `[c, ∞)` (MSS-B11). It is the canonical cluster object when eigenvalues have
   multiplicity.
7. **Measurable structure on matrices.** For a measurable space `α`, `Matrix m n α` carries
   Mathlib's entrywise measurable structure, that of `m → n → α`; it is the Borel structure when
   `m` and `n` are countable and `α` is second countable with its Borel structure (MSS-B01,
   MSS-B02). A random matrix is a function `Ω → Matrix m n α`.
8. **Means, scatter and second moments.** For a finite family `z : ι → E` in a vector space over a
   field `R`, the finite mean is `z̄ = (card ι)⁻¹ • ∑ᵢ zᵢ` (MSS-C06); through the total inverse of
   the field the empty family has mean `0`. For an inner product space `E` over `𝕜`, `u ⊗ u` is
   the rank-one operator `x ↦ ⟪u, x⟫ u`, Mathlib's `InnerProductSpace.rankOne 𝕜 u u`, and (D4)
   the unnormalized centered scatter operator of `z` is `S(z) = ∑ᵢ (zᵢ − z̄) ⊗ (zᵢ − z̄)`
   (MSS-C09). Appending a point `y` to `z : Fin n → E` gives `Fin.snoc z y : Fin (n + 1) → E`.
   (D3) For a sample `v : ι → n → 𝕜` of `r = card ι` vectors, the uncentered empirical
   second-moment matrix is `M̂ = r⁻¹ ∑ᵢ vᵢ vᵢᴴ`, with entries `M̂ k l = r⁻¹ ∑ᵢ vᵢ k · conj (vᵢ l)`
   (MSS-C15); for real samples the conjugation is trivial.
9. **Probability.** `(Ω, μ)` is a measure space; a statement that subtracts a probability from `1`
   assumes `[IsProbabilityMeasure μ]`. Independence is Mathlib's `ProbabilityTheory.IndepFun`,
   written `X ⟂ᵢ[μ] Y`, and is only ever assumed pairwise. Square integrability is `MemLp X 2 μ`,
   and expectations are Bochner integrals. Measures of events lie in `ℝ≥0∞`, real bounds enter
   through `ENNReal.ofReal`, and `1 − p` is truncated subtraction, so a bound with `p ≥ 1` says
   nothing. An upper bound on the measure of an exceptional set needs no measurability of that
   set: a measure is monotone on all subsets.
10. **Labels and names.** Each Part is divided into milestones, the subsections A1–A3, B1–B4 and
    C1–C4 below, and each definition or theorem carries a label MSS-A01, MSS-B03, … of its Part;
    D1–D4 label the notation of Conventions 6 and 8. An item that the pinned Tau Ceti library
    proves ends with an *In Tau Ceti* line naming the declarations that realise it; a Mathlib
    declaration is named in the statement of the item. `Suggested.lean` declares nothing of this
    roadmap's own; it pins the declarations of the headline theorems.

## Part A — rank factorization and positive-semidefinite Gram factorization

Rank factorization identifies the rank of a matrix with the least inner dimension of a
factorization. Its positive-semidefinite specialization identifies Gram matrices of low rank with
configurations of points in low dimension. The two uniqueness statements describe the remaining
freedom: an invertible change of basis of the inner space, and a unitary acting on the row space.

### A1 Rank factorization

Let `𝕜` be a field and `M : Matrix m n 𝕜` with `n` finite.

**MSS-A01 — Exact-rank factorization.** `M = L * R` for some `L : Matrix m (Fin M.rank) 𝕜` and
`R : Matrix (Fin M.rank) n 𝕜`. For `M = 0` the inner index type is `Fin 0`.

*In Tau Ceti:* `Matrix.exists_eq_mul_fin_rank`.

**MSS-A02 — Zero-padded rank factorization.** If `M.rank ≤ r`, then `M = L * R` for some
`L : Matrix m (Fin r) 𝕜` and `R : Matrix (Fin r) n 𝕜`. It is obtained from MSS-A01 by appending
zero columns to `L` and zero rows to `R`.

*In Tau Ceti:* `Matrix.exists_eq_mul_of_rank_le`.

**MSS-A03 — Rank-factorization characterization.** For every `r`, `M.rank ≤ r` if and only if
`M = L * R` for some `L : Matrix m (Fin r) 𝕜` and `R : Matrix (Fin r) n 𝕜`. So the rank is the
least inner dimension of a factorization. The reverse implication is
`rank (L * R) ≤ rank L ≤ r`.

*In Tau Ceti:* `Matrix.rank_le_iff_exists_eq_mul`.

*Needs:* Mathlib `Matrix.rank`, `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`.

**Checks.**
- The zero `m × n` matrix factors through `Fin 0`: both factors are empty matrices and their
  product is zero. A characterization stated only for `r > 0`, or through a nonempty inner type,
  would miss the rank-zero case.
- Over `ℚ`, `M = [[1, 2], [2, 4]]` has rank one and `M = L * R` with `L = [[1], [2]]` and
  `R = [[1, 2]]`, through `Fin 1`; it does not factor through `Fin 0`, being nonzero. This tells
  `rank M ≤ r` apart from `rank M < r`.

### A2 Positive-semidefinite Gram factorization

Let `B : Matrix n n 𝕜` with `[RCLike 𝕜]` and `n` finite.

**MSS-A04 — Hermitian spectral expansion.** If `hB : B.IsHermitian`, with
`U = hB.eigenvectorUnitary` and `λ = hB.eigenvalues`, then
`B i j = ∑ₖ λ k · U i k · conj (U j k)` for all `i`, `j`. It is the entrywise reading of
Mathlib's `Matrix.IsHermitian.spectral_theorem`.

*In Tau Ceti:* `Matrix.IsHermitian.apply_eq_sum_eigenvalues`.

**MSS-A05 — Square Gram factorization.** `B` is positive semidefinite if and only if
`B = Aᴴ * A` for some `A : Matrix n n 𝕜`; the reverse implication is Mathlib's
`Matrix.posSemidef_conjTranspose_mul_self`.

*In Tau Ceti:* `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`.

**MSS-A06 — Rank-controlled Gram factorization.** If `B` is positive semidefinite and
`B.rank ≤ Fintype.card m` for a finite type `m`, then `B = Aᴴ * A` for some `A : Matrix m n 𝕜`.
For `m = Fin d` the hypothesis reads `B.rank ≤ d`.

*In Tau Ceti:* `Matrix.PosSemidef.exists_eq_conjTranspose_mul_self_of_rank_le`.

**MSS-A07 — Gram-factorization characterization.** For a finite type `m`, `B` is positive
semidefinite with `B.rank ≤ Fintype.card m` if and only if `B = Aᴴ * A` for some
`A : Matrix m n 𝕜`. With `m = Fin d`: the positive-semidefinite `n × n` matrices of rank at most
`d` are exactly the Gram matrices of `n` points of `𝕜ᵈ` (Horn and Johnson, §7.2; Cox and Cox,
*Multidimensional Scaling*, §2.2–2.3, classical scaling and Gram embeddings).

*In Tau Ceti:* `Matrix.posSemidef_and_rank_le_iff_eq_conjTranspose_mul_self`.

*Route.* The square factorization is the description `0 ≤ x ↔ ∃ y, x = star y * y` of the
nonnegative elements of a C⋆-algebra, for the matrix order. The rank-controlled one compresses a
square factor `X` through a rank factorization `X = L * R` (§A1), writes `B = Rᴴ (Lᴴ L) R`, and
factors the small middle term. In the converse, the rank bound is `rank (Aᴴ * A) = rank A ≤ d`.

*Needs:* §A1 (for MSS-A06 and MSS-A07); Mathlib `Matrix.PosSemidef`,
`Matrix.posSemidef_conjTranspose_mul_self`, `Matrix.rank_conjTranspose_mul_self`,
`Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.eigenvalues`,
`Matrix.IsHermitian.eigenvectorUnitary`, `CStarAlgebra.nonneg_iff_eq_star_mul_self`.

**Checks.**
- For `B = [[1, i], [−i, 1]]` over `ℂ`, the eigenvalues are `2` and `0`, with unit eigenvectors
  `(1, −i)/√2` and `(1, i)/√2`; the expansion gives `B 0 1 = 2 · (1/√2) · conj (−i/√2) = i`.
  Without the conjugate on the second factor it would give `−i`; over `ℝ` the two versions agree
  and cannot be told apart. The value does not depend on the choice of unit eigenvectors, since
  each term is unchanged when a column of `U` is multiplied by a scalar of modulus one.
- `B = [[1, 2], [2, 1]]` is Hermitian of rank two with eigenvalues `3` and `−1`. It is not positive
  semidefinite, so it is not `Aᴴ * A` for any `A`; a characterization asking only for Hermitian
  matrices of rank at most `d` would accept it.
- `B = [[1, 1], [1, 1]]` is positive semidefinite of rank one and equals `Aᴴ * A` for the one-row
  `A = [[1, 1]]`; it is not `Aᴴ * A` for an `A` with no rows, as that product is zero.

### A3 Uniqueness of the factorizations

**MSS-A08 — Exact-rank factorization uniqueness.** Let `𝕜` be a field, `n` finite, and `ι` a
finite type with `M.rank = Fintype.card ι`. If `M = L * R = L' * R'` with `L, L' : Matrix m ι 𝕜`
and `R, R' : Matrix ι n 𝕜`, then there is an invertible `g : Matrix ι ι 𝕜` with `L' = L * g` and
`R' = g⁻¹ * R`. For `ι = Fin r` the hypothesis reads `M.rank = r`. Route: an exact-rank left
factor has full column rank and the column space of `M`.

*In Tau Ceti:* `Matrix.exists_unit_eq_mul_of_rank_factorization`.

**MSS-A09 — Gram-factorization uniqueness.** Let `[RCLike 𝕜]` and `m` finite. For
`A, A' : Matrix m n 𝕜` with the same row index type, `Aᴴ * A = A'ᴴ * A'` if and only if
`A' = U * A` for some unitary `U ∈ Matrix.unitaryGroup m 𝕜`. No rank assumption is made, and the
column index type may be infinite. Route: the columns of `A` and of `A'` have the same Gram
matrix, so the isometry between their spans extends to a unitary of `𝕜ᵐ`.

*In Tau Ceti:* `TauCeti.conjTranspose_mul_self_eq_iff_exists_unitary_mul`.

*Needs:* §A1 for MSS-A08; Mathlib `Matrix.unitaryGroup` for MSS-A09.

**Checks.**
- The rank hypothesis cannot be dropped from MSS-A08. The zero `2 × 2` matrix factors through
  `Fin 1` as `L * R` with `L = [[1], [0]]` and `R = 0`, and as `L' * R'` with `L' = 0` and
  `R' = [[1, 0]]`; no invertible `1 × 1` matrix `g` satisfies `L' = L * g`, since
  `L * g = [[g], [0]]` is nonzero.
- The unitary in MSS-A09 need not be unique: for `A = [[1, 0], [0, 0]]`, every `U = diag(1, u)`
  with `|u| = 1` satisfies `U * A = A`. Uniqueness of `U` would need the columns of `A` to span
  `𝕜ᵐ`.

### Examples

The acceptance criteria of Part A are the rank-factorization characterization (MSS-A01–MSS-A03),
the Gram characterization (MSS-A04–MSS-A07) and the two natural uniqueness actions
(MSS-A08–MSS-A09).

- The collinear points `0, 1, 2` of `ℝ` have Gram matrix
  `B = [[0, 0, 0], [0, 1, 2], [0, 2, 4]] = Aᵀ A` with `A = [[0, 1, 2]]`. `B` is positive
  semidefinite of rank one, so MSS-A07 realizes it with one row; by MSS-A09 every one-row factor
  of `B` is `±A`, the `1 × 1` real unitaries being `±1`.
- A rank-one matrix over a field factors through `Fin 1` as a column times a row (MSS-A01), and by
  MSS-A08 two such factorizations differ by a nonzero scalar: `L' = c L` and `R' = c⁻¹ R`.

### Dependencies

Mathlib: matrix rank and its behaviour under products, positive semidefiniteness, the spectral
theorem for Hermitian matrices with its eigenvector unitary, the unitary group, and the description
of nonnegative elements of a C⋆-algebra. No other roadmap.

## Part B — matrix spectra and spectral measurability

This Part connects the entries of a matrix to its Euclidean operator and to its spectrum, and
supplies the measurability needed to apply deterministic spectral constructions to random matrices.
The fixed-threshold projector is the canonical cluster object in the presence of eigenvalue
multiplicity.

### B1 Measurable matrix structure and the deterministic spectral bridge

Let `α` be a measurable space.

**MSS-B01 — Entrywise measurable structure on matrices.** The measurable structure on
`Matrix m n α` is that of `m → n → α`: a map into matrices is measurable if and only if each entry
is. This is Mathlib's instance `MeasurableSpace (Matrix m n α)` with `Matrix.measurable_iff`.

**MSS-B02 — Borel structure on matrices.** If `m` and `n` are countable and `α` is a
second-countable topological space with its Borel structure, the entrywise measurable structure on
`Matrix m n α` is the Borel structure. This is Mathlib's instance `BorelSpace (Matrix m n α)`.

Let now `[RCLike 𝕜]`.

**MSS-B03 — Entrywise-to-operator comparison.** If `A : Matrix n n 𝕜` with `n` finite satisfies
`‖A i j‖ ≤ ε` for all `i`, `j`, then `‖A x‖ ≤ (card n) · ε · ‖x‖` for every
`x : EuclideanSpace 𝕜 n`. For a rectangular `A : Matrix m n 𝕜` with `m`, `n` finite and
`‖A i j‖ ≤ ε` for all `i`, `j`, the factor is `√(card m) · √(card n)`. Empty index types are
allowed.

*In Tau Ceti:* `Matrix.norm_toEuclideanLin_le_of_entry_le_square`, `Matrix.norm_toEuclideanLin_le_of_entry_le`.

For the next items let `A, Â : Matrix n n 𝕜` be Hermitian, with `n` finite.

**MSS-B20 — Weyl's bound for Hermitian matrices.** `|λ_k(Â) − λ_k(A)| ≤ ‖Â − A‖`, in the ℓ²
operator norm, for every `k` (Horn and Johnson, Theorem 4.3.1; Bhatia, *Matrix Analysis*,
Corollary III.2.6). It is the matrix form of PolarDecomposition, Part A, PD-A53.

*In Tau Ceti:* `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`.

**MSS-B04 — Entrywise eigenvalue perturbation.** If `‖Â i j − A i j‖ ≤ ε` for all `i`, `j`, then
`|λ_k(Â) − λ_k(A)| ≤ (card n) · ε` for every `k`: MSS-B20 composed with MSS-B03.

*In Tau Ceti:* `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_of_entry_le`.

**MSS-B05 — A-priori sorted-eigenvalue bound.** If `‖A i j‖ ≤ β` for all `i`, `j`, then
`|λ_k(A)| ≤ (card n) · β` for every `k`.

*In Tau Ceti:* `Matrix.IsHermitian.abs_eigenvalues₀_le_of_entry_le`.

**MSS-B06 — Rank count for sorted eigenvalues.** For Hermitian `A`, `A.rank` is the number of
indices `k` with `λ_k(A) ≠ 0`. It is the sorted form of Mathlib's
`Matrix.IsHermitian.rank_eq_card_non_zero_eigs`.

*In Tau Ceti:* `Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`.

**MSS-B07 — Positive-semidefinite sorted eigenvalues.** For positive-semidefinite `A`, every
`λ_k(A)` is nonnegative.

*In Tau Ceti:* `Matrix.PosSemidef.eigenvalues₀_nonneg`.

**MSS-B08 — Positive-semidefinite vanishing tail.** For positive-semidefinite `A` with
`A.rank ≤ d`, `λ_k(A) = 0` for every `k ≥ d`. Conversely, a positive-semidefinite `A` whose sorted
eigenvalues vanish from index `d` on has rank at most `d`.

*In Tau Ceti:* `Matrix.PosSemidef.eigenvalues₀_eq_zero_of_rank_le`, `Matrix.PosSemidef.rank_le_iff_eigenvalues₀_eq_zero`.

*Needs:* PolarDecomposition, Part A, PD-A53 (Weyl's perturbation bound, for MSS-B20); Mathlib
`Matrix.toEuclideanLin`, `Matrix.IsHermitian.eigenvalues₀`,
`Matrix.IsHermitian.eigenvalues₀_antitone`, `Matrix.isSymmetric_toEuclideanLin_iff`,
`LinearMap.IsSymmetric.eigenvalues`, `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`,
`Matrix.measurable_iff`.

**Checks.**
- The factor `n` cannot be lowered: the all-ones `n × n` matrix `J` has entries of norm `1`, and
  `J x = n x` for `x = (1, …, 1)`, so `‖J x‖ = n‖x‖`. A bound with `√n` in place of `n` fails for
  every `n ≥ 2`.
- The eigenvalue bound is attained: for `A = 0` and `Â = εJ` with `ε > 0`, the entries differ by
  `ε`, and `λ_0(Â) = nε` while `λ_0(A) = 0`.
- For the Hermitian `A = diag(1, −1, 0)`, the rank is two and the sorted eigenvalues are
  `(1, 0, −1)`: two are nonzero, but the one at index two is `−1`. So the vanishing tail needs
  positive semidefiniteness; for a Hermitian matrix the nonzero sorted eigenvalues need not form an
  initial segment.

### B2 Continuous spectral functions

Let `[RCLike 𝕜]`, `n` finite, and `h : ℝ → ℝ` continuous.

**MSS-B09 — Continuity of Hermitian functional calculus.** The map `A ↦ cfc h A` is continuous on
the set of Hermitian matrices in `Matrix n n 𝕜`; equivalently, its restriction to the subtype of
Hermitian matrices is continuous. This is Mathlib's continuity of the functional calculus in its
operator variable, `ContinuousOn.cfc_of_mem_nhdsSet` with all of `ℝ` as the neighbourhood of the
spectra, for the ℓ² operator norm, which induces the entrywise topology.

*In Tau Ceti:* `TauCeti.continuousOn_matrix_cfc`.

**MSS-B10 — Measurability of Hermitian functional calculus.** The map `A ↦ cfc h A` is Borel
measurable on all of `Matrix n n 𝕜`: it is continuous on the closed set of Hermitian matrices and
zero off it. Hence for every measurable random matrix `ω ↦ A(ω)`, in particular every measurable
random Hermitian matrix, `ω ↦ cfc h (A(ω))` is measurable, by composition.

*In Tau Ceti:* `TauCeti.measurable_matrix_cfc`.

*Needs:* MSS-B01 and MSS-B02 (the measurable structure); Mathlib `cfc`,
`cfc_apply_of_not_predicate`, `ContinuousOn.cfc_of_mem_nhdsSet`.

**Checks.**
- The map `A ↦ cfc id A` is the identity on Hermitian matrices and `0` off them: for the
  non-Hermitian `[[0, 1], [0, 0]]` its value is `0`, not the matrix itself. So it is continuous on
  the Hermitian matrices but not on all matrices: `[[1, t], [0, 1]] → I` as `t → 0`, while the
  values are `0` for `t ≠ 0` and `I` at `t = 0`. A reading of continuity on all of
  `Matrix n n 𝕜` would be false, and measurability on all matrices needs the closed-set argument
  above.

### B3 Fixed-threshold spectral projectors

Let `[RCLike 𝕜]`, `n` finite and `c : ℝ` a deterministic threshold.

**MSS-B11 — Fixed-threshold spectral projector.** Define
`P_[c,∞)(A) = cfc ((Set.Ici c).indicator 1) A` (Conventions 6, D2). It is a star projection,
self-adjoint and idempotent, for every `A`. For Hermitian `A`, its Euclidean operator is the
orthogonal projection onto the sum of the eigenspaces of `A` with eigenvalue in `[c, ∞)`, and its
trace is the number of eigenvalues of `A` in `[c, ∞)`, counted with multiplicity (the trace of
`cfc f A` is `∑ᵢ f (λᵢ)`, applied to the indicator).

*In Tau Ceti:* `TauCeti.isStarProjection_cfc_indicator`, `Matrix.IsHermitian.toEuclideanLin_cfc_indicator`, `Matrix.IsHermitian.trace_cfc`.

**MSS-B12 — Measurability of the fixed-threshold projector.** For fixed `c`, the map
`A ↦ P_[c,∞)(A)` is Borel measurable on `Matrix n n 𝕜`, hence on the Hermitian matrices with the
subspace structure. The map is not continuous. Route: the indicator of the closed set `[c, ∞)` is
a pointwise limit of continuous functions, and since the spectrum of a matrix is finite, pointwise
convergence of functions gives convergence of their functional calculi at every matrix
(`TauCeti.tendsto_matrix_cfc_fun`), so measurability passes from MSS-B10 to the limit.

*In Tau Ceti:* `TauCeti.measurable_matrix_cfc_indicator`.

**MSS-B13 — Random-matrix threshold projector.** For every measurable random matrix
`ω ↦ A(ω)`, in particular every measurable random Hermitian matrix, and every fixed `c`, the map
`ω ↦ P_[c,∞)(A(ω))` is measurable, by composition with MSS-B12.

*In Tau Ceti:* `TauCeti.measurable_matrix_cfc_indicator`.

**MSS-B14 — Threshold rank stability.** Let `A`, `Â` be Hermitian and `δ ≤ |λ_k(A) − c|` for every
`k`. If `‖Â − A‖ < δ` in the ℓ² operator norm, then `A` and `Â` have the same number of sorted
eigenvalues in `[c, ∞)`, counted with multiplicity. Index by index,
`c ≤ λ_k(Â) ↔ c ≤ λ_k(A)` whenever `‖Â − A‖ < |λ_k(A) − c|`. Both follow from MSS-B20 (Bhatia,
Corollary III.2.6).

*In Tau Ceti:* `Matrix.IsHermitian.card_eigenvalues₀_ge_eq_of_norm_sub_lt`, `Matrix.IsHermitian.le_eigenvalues₀_iff_of_norm_sub_lt`.

*Needs:* MSS-B20 (Weyl's bound), MSS-B01 and MSS-B02 (the measurable structure) and MSS-B10
(measurability for continuous functions); Tau Ceti `Module.End.pointSpectralSubspace` for the
eigenspace sum; Mathlib `cfc`, `Set.indicator`, `IsStarProjection`.

**Checks.**
- The endpoint is closed: for `A = diag(1, 0)` and `c = 1`, `P_[1,∞)(A) = diag(1, 0)`, while the
  projector onto eigenvalues in the open interval `(1, ∞)` is `0`. A definition with a strict
  threshold differs exactly when `c` is an eigenvalue.
- The projector is not continuous in `A`: for `A_t = diag(t, −1)` and `c = 0`,
  `P_[0,∞)(A_t) = 0` for `t < 0` and `diag(1, 0)` at `t = 0`. So its measurability is not a
  consequence of the continuity MSS-B09.
- The gap hypothesis is needed: for `A = diag(1, 0)` and `c = 1` no `δ > 0` satisfies it, and
  `Â = diag(1 − t, 0)`, at operator distance `t` from `A`, has no eigenvalue in `[1, ∞)` for any
  `t > 0`, while `A` has one.

### B4 Probability-to-convergence bridges

Let `(Ω, μ)` be a measure space, `l` a filter on an index type `ι`, `f : ι → Ω → E` and
`g : Ω → E`. Convergence in measure is Mathlib's `MeasureTheory.TendstoInMeasure`. These are the
forms in which the high-probability bounds of Part C are consumed.

**MSS-B16 — Measurability-free complement bound.** For a probability measure `μ` and every set
`s ⊆ Ω`, measurable or not, `1 − μ sᶜ ≤ μ s`.

*In Tau Ceti:* `MeasureTheory.Measure.one_sub_measure_compl_le`.

**MSS-B17 — Convergence in measure from `edist` rates.** If `E` has an extended distance,
`rate : ι → ℝ≥0∞` tends to `0` along `l`, and `μ {x | rate i < edist (f i x) (g x)}` tends to `0`,
then `f` tends to `g` in measure.

*In Tau Ceti:* `TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_edist`.

**MSS-B18 — Convergence in measure from distance rates.** If `E` is a pseudometric space,
`rate : ι → ℝ` tends to `0`, and `μ {x | rate i < dist (f i x) (g x)}` tends to `0`, then `f`
tends to `g` in measure; the rate may take negative values.

*In Tau Ceti:* `TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_dist`.

**MSS-B19 — High-probability convergence in measure.** If `μ` is a probability measure, `E` is a
pseudometric space, `rate : ι → ℝ` tends to `0`, the events `{x | dist (f i x) (g x) ≤ rate i}`
are null-measurable, and their probabilities tend to `1`, then `f` tends to `g` in measure. Here
null-measurability is used to pass from the event to its complement.

*In Tau Ceti:* `TauCeti.tendstoInMeasure_of_tendsto_measure_dist_le_rate`.

MSS-B16, MSS-B17 and MSS-B18 need no measurability of the exceptional sets, by subadditivity
(MSS-B16) and monotonicity (MSS-B17, MSS-B18) of the measure on all subsets.

*Needs:* Mathlib `MeasureTheory.TendstoInMeasure`, `MeasureTheory.IsProbabilityMeasure`.

### Examples

The acceptance criteria of Part B are the deterministic entrywise-to-spectral path
(MSS-B03–MSS-B08), the continuous and fixed-threshold measurable spectral constructions
(MSS-B09–MSS-B14) and the convergence-in-measure consumers (MSS-B16–MSS-B19).

- Let `A = diag(3, 1, 1)` and `c = 2`, so `|λ_k(A) − 2| ≥ 1` for every `k`. Every Hermitian `Â`
  whose entries are within `ε < 1/3` of those of `A` has `‖Â − A‖ ≤ 3ε < 1` by MSS-B03, hence
  exactly one sorted eigenvalue in `[2, ∞)` by MSS-B14, and `P_[2,∞)(Â)` is a projection of trace
  one by MSS-B11.
- For a measurable random Hermitian matrix `ω ↦ A(ω)`, the matrix exponential
  `ω ↦ cfc Real.exp (A(ω))` is measurable by MSS-B10 and the spectral projector
  `ω ↦ P_[c,∞)(A(ω))` by MSS-B13, without any measurable choice of eigenvectors.

### Dependencies

PolarDecomposition, Part A, PD-A53 (Weyl's perturbation bound for symmetric operators). Mathlib:
the measurable and Borel structures on matrices, the Euclidean operator of a matrix and the ℓ²
operator norm, the sorted eigenvalues of a Hermitian matrix, the continuous functional calculus
with its continuity in the operator variable, and convergence in measure. Tau Ceti: the point
spectral subspace of an endomorphism (MSS-B11). Part A is not used.

## Part C — sample moments and matrix concentration

This Part starts from scalar second moments and pairwise independence. The sample-mean identities
give the `1/r` mean-square scale, the centered scatter operator records the finite-sample geometry
exactly, and a union bound over entries turns per-entry second moments into eigenvalue and
operator-norm concentration through §B1.

### C1 Scalar and vector sample-mean identities

Let `(Ω, μ)` be a probability space and `ι` a finite nonempty index type, `r = card ι`; for
`ι = Fin r` nonemptiness is `0 < r`. The sample mean `r⁻¹ ∑ₖ Xₖ` is the finite mean of MSS-C06.

**MSS-C01 — Uncentered Chebyshev inequality.** For any measure `μ`: if `Y : Ω → ℝ` has `Y²`
integrable, `∫ Y² dμ ≤ v` and `η > 0`, then `μ {η < Y} ≤ ENNReal.ofReal (v / η²)` (Markov's
inequality for `Y²`, as in Vershynin, *High-Dimensional Probability*, Proposition 1.2.4 and
Corollary 1.2.5, p. 8). More generally, for `Y` with values in a type with a norm and `‖Y‖²`
integrable, `μ {c ≤ ‖Y‖} ≤ ENNReal.ofReal ((∫ ‖Y‖² dμ) / c²)` for `c > 0`.

*In Tau Ceti:* `TauCeti.meas_gt_le_div_sq_of_integral_sq_le`, `TauCeti.meas_ge_le_integral_norm_sq_div_sq`.

**MSS-C02 — Scalar sample-mean identity.** If `Z : ι → Ω → ℝ` are square integrable, pairwise
independent and have a common mean `c`, then `∫ (r⁻¹ ∑ₖ Zₖ − c)² dμ = r⁻² ∑ₖ ∫ (Zₖ − c)² dμ`. For
independent, identically distributed `Zₖ` of variance `σ²`, both sides equal `σ²/r`, the variance
of the sample mean (Vershynin, (1.5), p. 9).

*In Tau Ceti:* `TauCeti.integral_finiteMean_sub_sq`.

**MSS-C03 — Vector sample-mean identity.** If `X : ι → Ω → E` take values in a real Hilbert space
`E` with its Borel structure (finite-dimensional real inner product spaces are examples), are
square integrable, pairwise independent and have a common mean `m`, then
`∫ ‖r⁻¹ ∑ₖ Xₖ − m‖² dμ = r⁻² ∑ₖ ∫ ‖Xₖ − m‖² dμ`. Route: Bienaymé's identity, that for pairwise
independent, centered, square-integrable random vectors the expected squared norm of the sum is
the sum of the expected squared norms (`TauCeti.integral_norm_sum_sq_of_pairwise_indepFun`).

*In Tau Ceti:* `TauCeti.integral_norm_finiteMean_sub_sq`.

**MSS-C04 — Identically distributed sample-mean form.** Under the hypotheses of MSS-C03, if
moreover `∫ ‖Xₖ − m‖² dμ = γ` for every `k`, the sample mean has mean-square error `γ / r`.

*In Tau Ceti:* `TauCeti.integral_norm_finiteMean_sub_sq_of_forall_eq`.

**MSS-C05 — Uniform sample-mean bound.** Under the hypotheses of MSS-C03, if instead
`∫ ‖Xₖ − m‖² dμ ≤ γ` for every `k`, the sample mean has mean-square error at most `γ / r`.

*In Tau Ceti:* `TauCeti.integral_norm_finiteMean_sub_sq_le_of_forall_le`.

*Needs:* MSS-C06 (the finite mean); Mathlib `ProbabilityTheory.IndepFun`,
`ProbabilityTheory.IndepFun.integral_bilin`, `MeasureTheory.MemLp`,
`MeasureTheory.meas_ge_le_lintegral_div`.

**Checks.**
- Pairwise independence suffices: for independent fair signs `Z₁, Z₂ ∈ {±1}` and `Z₃ = Z₁ Z₂`,
  the three are pairwise independent but not independent, have common mean `0`, and
  `∫ ((Z₁ + Z₂ + Z₃)/3)² = 1/3 = 3⁻² · 3`, as MSS-C02 says. A statement asking for mutual
  independence would not apply to this family.
- The common mean cannot be dropped: the constants `Z₁ = 1` and `Z₂ = −1` are independent, and
  with `c = 0` the left side is `∫ ((1 − 1)/2)² = 0` while the right side is `2⁻² (1 + 1) = 1/2`.

### C2 Finite means and centered scatter

Let `z : ι → E` with `ι` finite and `E` a vector space over a field `R`; write `z̄` for its finite
mean.

**MSS-C06 — Finite mean.** Define the finite mean `z̄` as the center of mass of `z` with equal
weights. Then `z̄ = (card ι)⁻¹ • ∑ᵢ zᵢ`, and the empty family has mean `0`. Normed spaces over `ℝ`
or `ℂ` are the case `R = 𝕜`.

*In Tau Ceti:* `TauCeti.finiteMean`, `TauCeti.finiteMean_eq_inv_smul_sum`, `TauCeti.finiteMean_of_isEmpty`.

**MSS-C07 — Centered sum.** Over a field of characteristic zero, the deviations sum to zero:
`∑ᵢ (zᵢ − z̄) = 0`.

*In Tau Ceti:* `TauCeti.sum_sub_finiteMean`.

**MSS-C08 — Add-one mean identity.** Over a field of characteristic zero, appending `y` to
`z : Fin n → E` moves the mean to `z̄ + (n + 1)⁻¹ • (y − z̄)`, for every `n` including `n = 0`.

*In Tau Ceti:* `TauCeti.finiteMean_snoc`.

For the scatter items let `E` be an inner product space over `𝕜` with `[RCLike 𝕜]`, not
necessarily complete, and `z : ι → E` with `ι` finite.

**MSS-C09 — Centered scatter.** Define the centered scatter operator as the bounded operator
`S(z) = ∑ᵢ (zᵢ − z̄) ⊗ (zᵢ − z̄) : E →L[𝕜] E` (Conventions 8, D4), sending `x` to
`∑ᵢ ⟪zᵢ − z̄, x⟫ (zᵢ − z̄)`.

*In Tau Ceti:* `TauCeti.centeredScatter`, `TauCeti.centeredScatter_apply`.

**MSS-C10 — Add-one scatter identity.** For `z : Fin n → E` and `y : E`,
`S(Fin.snoc z y) = S(z) + (n / (n + 1)) • (y − z̄) ⊗ (y − z̄)`. Route: the scatter about an
arbitrary centre `p` is `∑ᵢ (zᵢ − p) ⊗ (zᵢ − p) = S(z) + (card ι) • (z̄ − p) ⊗ (z̄ − p)`
(`TauCeti.sum_rankOne_sub_eq_centeredScatter_add`); with `p` the new mean and MSS-C08 it gives the
identity.

*In Tau Ceti:* `TauCeti.centeredScatter_snoc`.

**MSS-C11 — Scatter quadratic form.** `Re ⟪S(z) x, x⟫ = ∑ᵢ ‖⟪zᵢ − z̄, x⟫‖²` for every `x`.

*In Tau Ceti:* `TauCeti.re_inner_centeredScatter_apply_self`.

**MSS-C12 — Positivity of centered scatter.** `S(z)` is a positive operator.

*In Tau Ceti:* `TauCeti.isPositive_centeredScatter`.

**MSS-C13 — Monotonicity under appending.** For `z : Fin n → E` and `y : E`,
`S(z) ≤ S(Fin.snoc z y)` in the Loewner order.

*In Tau Ceti:* `TauCeti.centeredScatter_le_centeredScatter_snoc`.

**MSS-C14 — Add-one quadratic-form identity.** For `z : Fin n → E` and `y : E`,
`Re ⟪S(Fin.snoc z y) x, x⟫ = Re ⟪S(z) x, x⟫ + n/(n + 1) · ‖⟪y − z̄, x⟫‖²` for every `x`.

*In Tau Ceti:* `TauCeti.re_inner_centeredScatter_snoc_apply_self`.

*Needs:* Mathlib `Finset.centerMass`, `InnerProductSpace.rankOne`,
`ContinuousLinearMap.IsPositive`, `Fin.snoc`.

**Checks.**
- The add-one mean identity at `n = 0` reads `z̄' = 0 + 1⁻¹ (y − 0) = y`: the mean of one point is
  that point, which holds because the empty family has mean `0`. A convention leaving the empty
  mean unspecified, as the affine centroid does, would not give the identity at `n = 0`.
- For `z = (0, 2)` in `ℝ` and `y = 4`: `z̄ = 1` and `S(z) = 2`; the extended family `(0, 2, 4)`
  has mean `2` and scatter `8`; MSS-C10 gives `2 + (2/3)(4 − 1)² = 8`. With the coefficient `1`
  in place of `n/(n + 1)` it would give `11`.

### C3 Empirical second moments

Let `[RCLike 𝕜]`, and let `v : ι → n → 𝕜` be a sample of `r = card ι` vectors.

**MSS-C15 — Empirical second moment.** Define the empirical second-moment matrix `M̂` as the finite
mean of the rank-one matrices `vᵢ vᵢᴴ` (Mathlib's `Matrix.vecMulVec`), `r⁻¹ ∑ᵢ vᵢ vᵢᴴ`
(Conventions 8, D3); its `(k, l)` entry is `r⁻¹ ∑ᵢ vᵢ k · conj (vᵢ l)`. For real random vectors
`V : ι → Ω → n → ℝ`, `M̂(ω)`, the matrix of the sample `(V i ω)ᵢ`, has entries
`r⁻¹ ∑ᵢ V i ω k · V i ω l`. It is uncentered: the sample mean is not subtracted. For real samples
it is the sample version (Vershynin, *High-Dimensional Probability*, §4.7, p. 99) of the
second-moment matrix `E XXᵀ` of a random vector `X` (Vershynin, §3.2, p. 45).

*In Tau Ceti:* `TauCeti.sampleSecondMoment`, `TauCeti.sampleSecondMoment_apply`.

**MSS-C16 — Hermitian empirical second moment.** `M̂` is Hermitian for every sample, and positive
semidefinite when `n` is finite.

*In Tau Ceti:* `TauCeti.isHermitian_sampleSecondMoment`, `TauCeti.posSemidef_sampleSecondMoment`.

**MSS-C17 — Per-entry second-moment bound.** Let `μ` be a probability measure, `ι` nonempty,
`V : ι → Ω → n → ℝ`, `M : Matrix n n ℝ`, and fix coordinates `k`, `l`. If the products
`Yᵢ(ω) = V i ω k · V i ω l` are square integrable, pairwise independent and have a common mean
`M k l`, and `∫ (Yᵢ − M k l)² dμ ≤ v` for every `i`, then `∫ (M̂ k l − M k l)² dμ ≤ v / r`. In
particular this holds when the centered second moments of the `Yᵢ` are all equal to a common value
at most `v`.

*In Tau Ceti:* `TauCeti.integral_sampleSecondMoment_apply_sub_sq_le`.

*Needs:* MSS-C05 (with `E = ℝ`) and MSS-C06; Mathlib `Matrix.vecMulVec`, `Matrix.IsHermitian`,
`Matrix.PosSemidef`.

**Checks.**
- For the real sample `v₁ = (1, 1)`, `v₂ = (1, −1)`,
  `M̂ = ½ ([[1, 1], [1, 1]] + [[1, −1], [−1, 1]]) = I`, while the centered sample covariance
  `½ ∑ᵢ (vᵢ − v̄)(vᵢ − v̄)ᵀ`, with `v̄ = (1, 0)`, is `diag(0, 1)`. The two notions differ as soon as
  the sample mean is nonzero.
- For the complex vector `v = (1, i)`, `v vᴴ = [[1, −i], [i, 1]]` is Hermitian while
  `v vᵀ = [[1, i], [i, −1]]` is not; the conjugate in the entries is what makes `M̂` Hermitian
  over `ℂ`.

### C4 Entrywise, eigenvalue and operator concentration

Let `(Ω, μ)` be a measure space, `m` and `n` finite, `S : Ω → Matrix m n E` a random matrix with
entries in a type with a norm and a subtraction, `A : Matrix m n E` a fixed matrix, `v` real and
`η > 0`. Suppose every squared entrywise deviation `ω ↦ ‖S ω k l − A k l‖²` is integrable, with
`∫ ‖S ω k l − A k l‖² dμ ≤ v`. For real entries `‖·‖²` is the square.

**MSS-C18 — Entrywise concentration.**
`μ {ω | ∃ k l, η < ‖S ω k l − A k l‖} ≤ ENNReal.ofReal (card m · card n · v / η²)`: Chebyshev's
inequality MSS-C01 for each entry and a union bound. For `n × n` matrices the factor is `n²`. No
measurability of the entries is needed. In complementary form, for a probability measure, every
set that contains all outcomes at which all entries of `S` are within `η` of those of `A` has
measure at least `1 − ENNReal.ofReal (card m · card n · v / η²)`, by MSS-B16.

*In Tau Ceti:* `TauCeti.measure_exists_lt_norm_sub_le`, `TauCeti.one_sub_le_measure_of_entry_le`.

**MSS-C19 — Measurability of the entrywise deviation event.** If `m` and `n` are countable, `E` is
a seminormed group whose open sets are measurable and whose subtraction is measurable, and every
entry `ω ↦ S ω k l` is measurable, then `{ω | ∃ k l, η < ‖S ω k l − A k l‖}` is measurable for
every real `η`. In particular the event of MSS-C18 is measurable for a real random matrix with
measurable entries.

*In Tau Ceti:* `TauCeti.measurableSet_exists_lt_norm_sub`.

Let now `μ` be a probability measure, `[RCLike 𝕜]`, `n` finite, and `S : Ω → Matrix n n 𝕜`,
`A : Matrix n n 𝕜` satisfy the moment hypotheses above. Real symmetric matrices are the case
`𝕜 = ℝ`.

**MSS-C20 — Eigenvalue concentration.** If `S ω` is Hermitian for every `ω` and `A` is Hermitian,
then with probability at least `1 − ENNReal.ofReal (n² v / η²)`, `|λ_k(S ω) − λ_k(A)| ≤ nη` for
every `k`, by MSS-B04.

*In Tau Ceti:* `TauCeti.one_sub_le_measure_forall_abs_eigenvalues₀_sub_le`.

**MSS-C21 — One-sided eigenvalue floor.** Under the hypotheses of MSS-C20, with the same
probability, `λ_k(A) − nη ≤ λ_k(S ω)` for every `k`.

*In Tau Ceti:* `TauCeti.one_sub_le_measure_forall_eigenvalues₀_sub_le`.

**MSS-C22 — Operator-norm concentration.** With probability at least
`1 − ENNReal.ofReal (n² v / η²)`, `‖(S ω − A) x‖ ≤ nη ‖x‖` for every `x : EuclideanSpace 𝕜 n`; no
Hermitian hypothesis is needed. For rectangular `m × n` matrices the bound is
`√(card m) · η · √(card n) · ‖x‖`, with probability at least
`1 − ENNReal.ofReal (card m · card n · v / η²)`.

*In Tau Ceti:* `TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le_square`, `TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le`.

**MSS-C23 — Empirical-second-moment eigenvalue floor.** Let `V : ι → Ω → n → ℝ` be
`r = card ι > 0` real random vectors of dimension `d = card n`, `M̂(ω)` their empirical
second-moment matrix (MSS-C15), and `M : Matrix n n ℝ` symmetric. Suppose that for every pair of
coordinates `k`, `l` the hypotheses of MSS-C17 hold with the same `v`: the products
`V i ω k · V i ω l` are square integrable, pairwise independent in `i`, have common mean `M k l`,
and have second moment about it at most `v`. Then for every `c > 0`, with probability at least
`1 − ENNReal.ofReal (4 d⁴ v / (r c²))`, every index `k` with `c ≤ λ_k(M)` has
`c/2 ≤ λ_k(M̂(ω))`. Route: MSS-C21 with the moment bound `v / r` of MSS-C17 and `η = c/(2d)`. The
symmetry of `M` already follows from the common-mean hypothesis, since `V i ω k · V i ω l` is
symmetric in `k` and `l`; it is a hypothesis because the statement names the sorted eigenvalues of
`M`. No measurability of the entries and no lower bound on `d` is needed: for `d = 0` there are no
eigenvalues and the event is certain.

*In Tau Ceti:* `TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment`.

The probability bounds of this section come from Chebyshev's inequality and a union bound over
entries. For comparison, when the sample vector is sub-gaussian or almost surely bounded, the
expected operator-norm error of the empirical second-moment matrix is a small multiple of the norm
of the second-moment matrix once the sample size exceeds a multiple of the dimension, or of the
dimension times its logarithm (Vershynin, *High-Dimensional Probability*, Theorem 4.7.1, p. 99,
and Theorem 5.6.1, p. 129); those bounds are not used here.

*Needs:* MSS-B03 and MSS-B04 (the entrywise operator and eigenvalue bounds), MSS-B16 (the
complement bound), MSS-C01 (Chebyshev's inequality), MSS-C16 and MSS-C17 (the Hermitian `M̂` and
the per-entry bound); Mathlib `MeasureTheory.Integrable`, `MeasureTheory.measure_iUnion_fintype_le`,
`ENNReal.ofReal`.

**Checks.**
- The constant of the floor: with the moment bound `v/r` and `η = c/(2d)`, the eigenvalue
  concentration probability is `1 − d² (v/r) / (c/(2d))² = 1 − 4d⁴v/(rc²)`, and
  `λ_k(M) − dη = λ_k(M) − c/2 ≥ c/2` when `λ_k(M) ≥ c`. Dropping the factor `n²` of the union bound
  would give `4d²v/(rc²)`, which the route does not prove.

### Examples

The acceptance criteria of Part C are the `1/r` sample-mean scale (MSS-C02–MSS-C05), the exact
add-one scatter calculus (MSS-C06–MSS-C14) and the sample-second-moment concentration path
(MSS-C15–MSS-C23).

- Take `r` independent, identically distributed samples `V i` of a random vector in `ℝ²` whose
  coordinates are bounded by `1` in absolute value, and let `M k l` be the mean of the product of
  coordinates `k` and `l`. The products `V i k · V i l` are bounded by `1`, independent across
  samples, have common mean `M k l`, and have second moment at most `1` about it, their variance.
  With `v = 1`, `d = 2`, `c = 1` and `r = 640`, MSS-C23 gives probability at least
  `1 − 4 · 16/640 = 0.9` that every eigenvalue of `M` at least `1` keeps the corresponding
  eigenvalue of `M̂` at least `1/2`.
- Points added one at a time only increase the centered scatter operator in the Loewner order
  (MSS-C13): for `z = (0, 2)` and `y = 4` in `ℝ` the scatter grows from `2` to `8`, by
  `(2/3)(4 − 1)² = 6`.

### Dependencies

Part B (MSS-B03, MSS-B04 and MSS-B16). Mathlib: pairwise independence, `MemLp`, the Bochner and
Lebesgue integrals with Markov's inequality, finite unions of sets, the variance of a sum of
pairwise independent real variables, rank-one operators and positivity on inner product spaces.
Part A is not used.

## Downstream consumers

- KernelsAndSpectralMethods, §5.1 (classical scaling): the Gram characterization MSS-A07 realizes
  a Euclidean distance matrix by points of `ℝᵖ`, and the uniqueness MSS-A09 identifies any two
  centred realizations up to an orthogonal matrix.

## Provenance

An Apache-2.0 implementation of Part A and most of Parts B and C exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.),
in its `TauCeti.*` and `TauCeti.Matrix.*` namespaces. Several Tau Ceti modules named in the Parts
above record their adaptation from it.

## Scope and ownership

*This roadmap owns* the matrix-level statements of Parts A–C above: rank factorization through
`Fin r` and its exact-rank uniqueness; the Gram characterization of positive-semidefinite matrices
with its unitary uniqueness and the entrywise spectral expansion; the measurable and Borel
structures on matrices as the roadmap uses them, the entrywise-to-operator and
entrywise-to-eigenvalue comparisons, Weyl's bound in matrix form, the a-priori eigenvalue bound,
the rank count and the vanishing tail of sorted eigenvalues; continuity and measurability of the
Hermitian functional calculus and of fixed-threshold spectral projectors, and threshold rank
stability; the probability-to-convergence bridges; the sample-mean identities, finite means and the
centered scatter calculus, the empirical second-moment matrix, and entrywise, eigenvalue and
operator-norm concentration. Within the operator-theory family, matrix-level statements with
entrywise hypotheses belong here.

*Realised in the libraries.* MSS-B01 and MSS-B02 are Mathlib's measurable and Borel structures
on matrices, named in those items. Every other item names, on its *In Tau Ceti* line, the
declarations of the pinned Tau Ceti library that realise it, and `Suggested.lean` pins those of the
headline theorems. Matrix rank, positive semidefiniteness, the sorted eigenvalues of a Hermitian
matrix, the continuous functional calculus with its continuity in the operator variable, and
convergence in measure are Mathlib's, consumed under the supplier contracts below.

*Owned elsewhere and consumed here.*

- *Weyl's perturbation bound* for symmetric operators on a finite-dimensional inner product space:
  PolarDecomposition, Part A, PD-A53. Its Tau Ceti declaration is
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`, and MSS-B20 is its matrix form.

*Outside this roadmap.* The Davis–Kahan and Yu–Wang–Samworth `sin Θ` theorems belong to
SpectralSubspacePerturbation; they can be applied on the events of §C4. Concentration with
logarithmic dimension dependence, such as matrix Bernstein and matrix Chernoff inequalities, is
not part of this roadmap: the dimension factors of Conventions 5 are the specification.

## Exact supplier contracts

### From Mathlib

- *Matrices and rank:* `Matrix`, `Matrix.rank`, `Matrix.rank_mul_le`
  (`rank (A * B) ≤ min (rank A) (rank B)`), `Matrix.rank_mul_le_left` (`rank (A * B) ≤ rank A`),
  `Matrix.rank_le_card_width` (`rank A ≤ card n` for `A : Matrix m n R`), `Matrix.conjTranspose`,
  `Matrix.vecMulVec`, `Matrix.unitaryGroup`.
- *Positive semidefiniteness:* `Matrix.PosSemidef`, `Matrix.posSemidef_conjTranspose_mul_self`
  (`Aᴴ * A` is positive semidefinite), `Matrix.rank_conjTranspose_mul_self`
  (`rank (Aᴴ * A) = rank A`), `CStarAlgebra.nonneg_iff_eq_star_mul_self` (in a C⋆-algebra,
  `0 ≤ x` iff `x = star y * y` for some `y`), used for the matrix order.
- *Hermitian spectral theory:* `Matrix.IsHermitian`, `Matrix.IsHermitian.eigenvalues`,
  `Matrix.IsHermitian.eigenvectorUnitary`, `Matrix.IsHermitian.spectral_theorem` (a Hermitian
  matrix is `U * diagonal λ * Uᴴ` for its eigenvector unitary `U` and eigenvalues `λ`),
  `Matrix.IsHermitian.eigenvalues₀` with `Matrix.IsHermitian.eigenvalues₀_antitone` (the sorted
  eigenvalues are nonincreasing), `Matrix.IsHermitian.rank_eq_card_non_zero_eigs` (the rank counts
  the nonzero eigenvalues); `Matrix.toEuclideanLin`, `Matrix.toEuclideanCLM`,
  `Matrix.isSymmetric_toEuclideanLin_iff` (a matrix is Hermitian iff its Euclidean operator is
  symmetric), the ℓ² operator norm of the scope `Matrix.Norms.L2Operator`;
  `LinearMap.IsSymmetric.eigenvalues` and `LinearMap.IsSymmetric.eigenvectorBasis`.
- *Functional calculus:* `cfc`, with its instance for Hermitian matrices over `RCLike`;
  `cfc_apply_of_not_predicate` (`cfc f a = 0` when `a` is not self-adjoint);
  `ContinuousOn.cfc_of_mem_nhdsSet` (if `a` is continuous on `t`, each `a x` is in the domain of
  the calculus, and `f` is continuous on a neighbourhood of the union of the spectra of the `a x`,
  then `x ↦ cfc f (a x)` is continuous on `t`); `Set.indicator`, `IsStarProjection`.
- *Measurability on matrices:* the instance `MeasurableSpace (Matrix m n α)`, defined as that of
  `m → n → α`, with `Matrix.measurable_iff`; the instance `BorelSpace (Matrix m n α)` for countable
  `m`, `n` and a second-countable Borel space `α` (both in
  `Mathlib/Analysis/Matrix/MeasurableSpace.lean`). They are MSS-B01 and MSS-B02.
- *Probability and measure:* `ProbabilityTheory.IndepFun`,
  `ProbabilityTheory.IndepFun.integral_bilin` (independent functions integrate a continuous
  bilinear form to the form of their integrals), `ProbabilityTheory.variance` with
  `ProbabilityTheory.IndepFun.variance_sum` (the variance of a sum of pairwise independent real
  variables is the sum of their variances), `MeasureTheory.MemLp`, `MeasureTheory.Integrable`, the
  Bochner integral, `MeasureTheory.meas_ge_le_lintegral_div` (Markov's inequality),
  `MeasureTheory.measure_iUnion_fintype_le`, `MeasureTheory.IsProbabilityMeasure`,
  `MeasureTheory.TendstoInMeasure`, `ENNReal.ofReal`.
- *Inner product spaces:* `InnerProductSpace.rankOne` (`rankOne 𝕜 x y z = ⟪y, z⟫ • x`),
  `ContinuousLinearMap.IsPositive` and the Loewner order on `E →L[𝕜] E`, `Finset.centerMass`,
  `Fin.snoc`.

### From Tau Ceti

The declarations realising this roadmap's own items are named in the Parts above, on the
*In Tau Ceti* line of each item. Beyond them the roadmap consumes:

- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm` (Weyl's bound for symmetric
  continuous linear maps on a finite-dimensional inner product space, the declaration of
  PolarDecomposition, Part A, PD-A53), of which MSS-B20 is the matrix form.
- `TauCeti/Analysis/InnerProductSpace/PointSpectrum.lean`: `Module.End.pointSpectralSubspace`, the
  sum of the eigenspaces of an endomorphism at eigenvalues in a set `Ω ⊆ ℝ`; MSS-B11 identifies the
  Euclidean operator of `P_[c,∞)(A)` as the orthogonal projection onto
  `Module.End.pointSpectralSubspace (Matrix.toEuclideanLin A) (Set.Ici c)`.

### From TauCetiRoadmap.PolarDecomposition

- Part A, PD-A53, Weyl's perturbation bound: for symmetric endomorphisms `S` and `T` of a
  finite-dimensional inner product space, `|λ_k(S) − λ_k(T)| ≤ ‖S − T‖` for every sorted index `k`.
  MSS-B20 is its matrix form.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — positive semidefinite Gram
  factorizations (§7.2), Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling and positive-semidefinite Gram embeddings.
- R. Vershynin, *High-Dimensional Probability*, 1st ed. (2018) — Markov's and Chebyshev's
  inequalities (Proposition 1.2.4, Corollary 1.2.5), the variance of a sample mean ((1.5)), the
  second-moment matrix and its sample version (§3.2, §4.7), covariance estimation (Theorems 4.7.1
  and 5.6.1).

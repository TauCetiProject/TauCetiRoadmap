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
`|λ_k(S) − λ_k(T)| ≤ ‖S − T‖` for symmetric operators. It feeds
[SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md), whose population-gap
`sin Θ` theorem, applied on the high-probability events of the last layer, turns a matrix
estimation bound into a statistical bound for spectral subspaces.

Layer 1 below gives the rank and Gram factorizations and their uniqueness. Layer 2 passes from
entries to operator norms and sorted eigenvalues, makes spectral functions and fixed-threshold
projectors of random matrices measurable, and bridges high-probability bounds to convergence in
measure. Layer 3 gives the sample-mean and scatter identities, the empirical second-moment matrix,
and the entrywise route to eigenvalue and operator-norm concentration.

## Conventions

1. **Matrices.** `M`, `A`, `B` and `Ŝ` denote matrices `Matrix m n 𝕜` with finite index types
   (`[Fintype n]` wherever a sum over `n` occurs); an inner factorization dimension is `Fin r`.
   Rank factorization (§1.1, §1.3) is over an arbitrary field. Gram factorization and every
   spectral statement are over a field `𝕜` with `[RCLike 𝕜]`, that is `ℝ` or `ℂ`. The statistical
   model of Layer 3 is real-valued; identities that hold over `RCLike` are stated there in that
   generality.
2. **Adjoint and Gram matrices.** `Aᴴ` is the conjugate transpose, Mathlib's
   `Matrix.conjTranspose`. For `A : Matrix m n 𝕜` with columns `a_j`, `Aᴴ * A` is the Gram matrix
   of the columns: `(Aᴴ * A) i j = ⟪a_i, a_j⟫`, for Mathlib's inner product, which is
   conjugate-linear in its first argument. Unitary matrices form `Matrix.unitaryGroup m 𝕜`.
3. **Euclidean operator and norms.** `Matrix.toEuclideanLin A` is the linear map of a matrix on
   `EuclideanSpace 𝕜 n`, which carries the Euclidean norm; we write `A x` for its value at `x`.
   Where a matrix norm `‖A‖` appears (Weyl's bound in §2.1, the threshold statements of §2.3) it
   is the ℓ² operator norm of Mathlib's scope `Matrix.Norms.L2Operator`, the operator norm of
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
   Layer 3 costs `n²`. These constants are part of the specification: the roadmap follows this
   elementary route and does not sharpen them.
6. **Functional calculus and threshold projectors.** For `h : ℝ → ℝ` and a square matrix `A`,
   `h(A)` is Mathlib's `cfc h A`. For Hermitian `A` it acts on an eigenvector of `A` with
   eigenvalue `μ` as multiplication by `h μ`; for a matrix that is not Hermitian, `cfc h A = 0`
   (Mathlib's `cfc_apply_of_not_predicate`). For a deterministic threshold `c : ℝ`, the
   fixed-threshold spectral projector is `P_[c,∞)(A) = cfc ((Set.Ici c).indicator 1) A`; for
   Hermitian `A` it is the orthogonal projector onto the sum of the eigenspaces of `A` with
   eigenvalue in `[c, ∞)` (§2.3). It is the canonical cluster object when eigenvalues have
   multiplicity.
7. **Measurable structure on matrices.** For a measurable space `α`, `Matrix m n α` carries
   Mathlib's entrywise measurable structure, that of `m → n → α`; it is the Borel structure when
   `m` and `n` are countable and `α` is second countable with its Borel structure (§2.1). A random
   matrix is a function `Ω → Matrix m n α`.
8. **Means, scatter and second moments.** For a finite family `z : ι → E` in a vector space over a
   field `R`, the finite mean is `z̄ = (card ι)⁻¹ • ∑ᵢ zᵢ`, Tau Ceti's `TauCeti.finiteMean R z`;
   through the total inverse of the field the empty family has mean `0`. For an inner product
   space `E` over `𝕜`, `u ⊗ u` is the rank-one operator `x ↦ ⟪u, x⟫ u`, Mathlib's
   `InnerProductSpace.rankOne 𝕜 u u`, and the unnormalized centered scatter operator of `z` is
   `S(z) = ∑ᵢ (zᵢ − z̄) ⊗ (zᵢ − z̄)`. Appending a point `y` to `z : Fin n → E` gives
   `Fin.snoc z y : Fin (n + 1) → E`. For a sample `v : ι → n → 𝕜` of `r = card ι` vectors, the
   uncentered empirical second-moment matrix is `M̂ = r⁻¹ ∑ᵢ vᵢ vᵢᴴ`, with entries
   `M̂ k l = r⁻¹ ∑ᵢ vᵢ k · conj (vᵢ l)`; for real samples the conjugation is trivial.
9. **Probability.** `(Ω, μ)` is a measure space; a statement that subtracts a probability from `1`
   assumes `[IsProbabilityMeasure μ]`. Independence is Mathlib's `ProbabilityTheory.IndepFun`,
   written `X ⟂ᵢ[μ] Y`, and is only ever assumed pairwise. Square integrability is `MemLp X 2 μ`,
   and expectations are Bochner integrals. Measures of events lie in `ℝ≥0∞`, real bounds enter
   through `ENNReal.ofReal`, and `1 − p` is truncated subtraction, so a bound with `p ≥ 1` says
   nothing. An upper bound on the measure of an exceptional set needs no measurability of that
   set: a measure is monotone on all subsets.
10. **Names.** Every statement below is named by the Mathlib or Tau Ceti declaration that states it.
    `Suggested.lean` declares nothing of this roadmap's own; it pins the declarations of the
    headline theorems.

## Layer 1: rank factorization and positive-semidefinite Gram factorization

Rank factorization identifies the rank of a matrix with the least inner dimension of a
factorization. Its positive-semidefinite specialization identifies Gram matrices of low rank with
configurations of points in low dimension. The two uniqueness statements describe the remaining
freedom: an invertible change of basis of the inner space, and a unitary acting on the row space.

### 1.1 Rank factorization

Let `𝕜` be a field and `M : Matrix m n 𝕜` with `n` finite.

- *Exact-rank factorization:* `M = L * R` with `L : Matrix m (Fin M.rank) 𝕜` and
  `R : Matrix (Fin M.rank) n 𝕜` (`Matrix.exists_eq_mul_fin_rank`). For `M = 0` the inner index
  type is `Fin 0`.
- *Zero-padded factorization:* if `M.rank ≤ r`, then `M = L * R` with `L : Matrix m (Fin r) 𝕜`
  and `R : Matrix (Fin r) n 𝕜`, obtained from the exact-rank factorization by appending zero
  columns to `L` and zero rows to `R` (`Matrix.exists_eq_mul_of_rank_le`).
- *Characterization:* for every `r`, `M.rank ≤ r` if and only if `M = L * R` for some
  `L : Matrix m (Fin r) 𝕜` and `R : Matrix (Fin r) n 𝕜` (`Matrix.rank_le_iff_exists_eq_mul`). The
  reverse implication is `rank (L * R) ≤ rank L ≤ r`. So the rank is the least inner dimension of a
  factorization.

*Needs:* Mathlib `Matrix.rank`, `Matrix.rank_mul_le_left`, `Matrix.rank_le_card_width`.

**Checks.**
- The zero `m × n` matrix factors through `Fin 0`: both factors are empty matrices and their
  product is zero. A characterization stated only for `r > 0`, or through a nonempty inner type,
  would miss the rank-zero case.
- Over `ℚ`, `M = [[1, 2], [2, 4]]` has rank one and `M = L * R` with `L = [[1], [2]]` and
  `R = [[1, 2]]`, through `Fin 1`; it does not factor through `Fin 0`, being nonzero. This tells
  `rank M ≤ r` apart from `rank M < r`.

### 1.2 Positive-semidefinite Gram factorization

Let `B : Matrix n n 𝕜` with `[RCLike 𝕜]` and `n` finite.

- *Spectral expansion:* if `hB : B.IsHermitian`, with `U = hB.eigenvectorUnitary` and
  `λ = hB.eigenvalues`, then `B i j = ∑ₖ λ k · U i k · conj (U j k)` for all `i`, `j`
  (`Matrix.IsHermitian.apply_eq_sum_eigenvalues`; Horn and Johnson, the spectral theorem). It is
  the entrywise reading of Mathlib's `Matrix.IsHermitian.spectral_theorem`.
- *Square Gram factorization:* `B` is positive semidefinite if and only if `B = Aᴴ * A` for some
  `A : Matrix n n 𝕜` (`Matrix.posSemidef_iff_eq_conjTranspose_mul_self`); the reverse implication
  is Mathlib's `Matrix.posSemidef_conjTranspose_mul_self`.
- *Rank-controlled factorization:* if `B` is positive semidefinite and `B.rank ≤ Fintype.card m`
  for a finite type `m`, then `B = Aᴴ * A` for some `A : Matrix m n 𝕜`
  (`Matrix.PosSemidef.exists_eq_conjTranspose_mul_self_of_rank_le`). For `m = Fin d` the
  hypothesis reads `B.rank ≤ d`.
- *Gram characterization:* `B` is positive semidefinite with `B.rank ≤ Fintype.card m` if and only
  if `B = Aᴴ * A` for some `A : Matrix m n 𝕜`
  (`Matrix.posSemidef_and_rank_le_iff_eq_conjTranspose_mul_self`). With `m = Fin d`: the
  positive-semidefinite `n × n` matrices of rank at most `d` are exactly the Gram matrices of `n`
  points of `𝕜ᵈ` (Horn and Johnson, positive-semidefinite Gram factorizations; Cox and Cox,
  *Multidimensional Scaling*, §2.2–2.3, classical scaling and Gram embeddings).

*Route.* The square factorization is the description `0 ≤ x ↔ ∃ y, x = star y * y` of the
nonnegative elements of a C⋆-algebra, for the matrix order. The rank-controlled one compresses a
square factor `X` through a rank factorization `X = L * R` of §1.1, writes
`B = Rᴴ (Lᴴ L) R`, and factors the small middle term. In the converse, the rank bound is
`rank (Aᴴ * A) = rank A ≤ d`.

*Needs:* §1.1; Mathlib `Matrix.PosSemidef`, `Matrix.posSemidef_conjTranspose_mul_self`,
`Matrix.rank_conjTranspose_mul_self`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.eigenvectorUnitary`,
`CStarAlgebra.nonneg_iff_eq_star_mul_self`.

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

### 1.3 Uniqueness of the factorizations

- *Exact-rank factorizations.* Let `𝕜` be a field, `n` finite, and `ι` a finite type with
  `M.rank = Fintype.card ι`. If `M = L * R = L' * R'` with `L, L' : Matrix m ι 𝕜` and
  `R, R' : Matrix ι n 𝕜`, then there is an invertible `g : Matrix ι ι 𝕜` with `L' = L * g` and
  `R' = g⁻¹ * R` (`Matrix.exists_unit_eq_mul_of_rank_factorization`). For `ι = Fin r` the
  hypothesis reads `M.rank = r`. Route: an exact-rank left factor has full column rank and the
  column space of `M`.
- *Gram factors.* Let `[RCLike 𝕜]` and `m` finite. For `A, A' : Matrix m n 𝕜` with the same row
  index type, `Aᴴ * A = A'ᴴ * A'` if and only if `A' = U * A` for some unitary
  `U ∈ Matrix.unitaryGroup m 𝕜` (`TauCeti.conjTranspose_mul_self_eq_iff_exists_unitary_mul`). No
  rank assumption is made, and the column index type may be infinite. Route: the columns of `A`
  and of `A'` have the same Gram matrix, so the isometry between their spans extends to a unitary
  of `𝕜ᵐ` (Horn and Johnson, positive-semidefinite Gram factorizations).

*Needs:* §1.1 for the first statement; Mathlib `Matrix.unitaryGroup` for the second.

**Checks.**
- The rank hypothesis cannot be dropped from the first statement. The zero `2 × 2` matrix factors
  through `Fin 1` as `L * R` with `L = [[1], [0]]` and `R = 0`, and as `L' * R'` with `L' = 0` and
  `R' = [[1, 0]]`; no invertible `1 × 1` matrix `g` satisfies `L' = L * g`, since
  `L * g = [[g], [0]]` is nonzero.
- The unitary in the second statement need not be unique: for `A = [[1, 0], [0, 0]]`, every
  `U = diag(1, u)` with `|u| = 1` satisfies `U * A = A`. Uniqueness of `U` would need the columns
  of `A` to span `𝕜ᵐ`.

### Examples

- The collinear points `0, 1, 2` of `ℝ` have Gram matrix
  `B = [[0, 0, 0], [0, 1, 2], [0, 2, 4]] = Aᵀ A` with `A = [[0, 1, 2]]`. `B` is positive
  semidefinite of rank one, so §1.2 realizes it with one row; by §1.3 every one-row factor of `B`
  is `±A`, the `1 × 1` real unitaries being `±1`.
- A rank-one matrix over a field factors through `Fin 1` as a column times a row (§1.1), and by
  §1.3 two such factorizations differ by a nonzero scalar: `L' = c L` and `R' = c⁻¹ R`.

### Dependencies

Mathlib: matrix rank and its behaviour under products, positive semidefiniteness, the spectral
theorem for Hermitian matrices with its eigenvector unitary, the unitary group, and the description
of nonnegative elements of a C⋆-algebra. Tau Ceti: the factorization theorems named above, listed
under the supplier contracts. No other roadmap.

## Layer 2: matrix spectra and spectral measurability

This layer connects the entries of a matrix to its Euclidean operator and to its spectrum, and
supplies the measurability needed to apply deterministic spectral constructions to random matrices.

### 2.1 Measurable matrix structure and the deterministic spectral bridge

*Measurable structure.* For a measurable space `α`, the measurable structure on `Matrix m n α` is
that of `m → n → α`: a map into matrices is measurable if and only if each entry is
(`Matrix.measurable_iff`). If `m` and `n` are countable and `α` is a second-countable topological
space with its Borel structure, the entrywise structure on `Matrix m n α` is the Borel structure
(Mathlib's `BorelSpace (Matrix m n α)` instance).

*Entrywise to operator.* Let `[RCLike 𝕜]`.

- If `A : Matrix n n 𝕜` with `n` finite satisfies `‖A i j‖ ≤ ε` for all `i`, `j`, then
  `‖A x‖ ≤ (card n) · ε · ‖x‖` for every `x : EuclideanSpace 𝕜 n`
  (`Matrix.norm_toEuclideanLin_le_of_entry_le_square`). For a rectangular `A : Matrix m n 𝕜` the
  factor is `√(card m) · √(card n)` (`Matrix.norm_toEuclideanLin_le_of_entry_le`). Empty index
  types are allowed.

*Entrywise to eigenvalues.* Let `A, Â : Matrix n n 𝕜` be Hermitian.

- *Weyl's bound:* `|λ_k(Â) − λ_k(A)| ≤ ‖Â − A‖`, in the ℓ² operator norm, for every `k`
  (`Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`; Horn and Johnson, Theorem 4.3.1; Bhatia,
  *Matrix Analysis*, Corollary III.2.6). It is the matrix form of PolarDecomposition, Part A,
  PD-A53.
- *Entrywise eigenvalue perturbation:* if `‖Â i j − A i j‖ ≤ ε` for all `i`, `j`, then
  `|λ_k(Â) − λ_k(A)| ≤ (card n) · ε` for every `k`
  (`Matrix.IsHermitian.abs_eigenvalues₀_sub_le_of_entry_le`): Weyl's bound composed with the
  entrywise operator bound.
- *A-priori bound:* if `‖A i j‖ ≤ β` for all `i`, `j`, then `|λ_k(A)| ≤ (card n) · β` for every
  `k` (`Matrix.IsHermitian.abs_eigenvalues₀_le_of_entry_le`).

*Rank and sorted eigenvalues.*

- For Hermitian `A`, `A.rank` is the number of indices `k` with `λ_k(A) ≠ 0`
  (`Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`), the sorted form of Mathlib's
  `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`.
- For positive-semidefinite `A`, every `λ_k(A)` is nonnegative
  (`Matrix.PosSemidef.eigenvalues₀_nonneg`).
- For positive-semidefinite `A` with `A.rank ≤ d`, `λ_k(A) = 0` for every `k ≥ d`
  (`Matrix.PosSemidef.eigenvalues₀_eq_zero_of_rank_le`). Conversely, a positive-semidefinite `A`
  whose sorted eigenvalues vanish from index `d` on has rank at most `d`
  (`Matrix.PosSemidef.rank_le_iff_eigenvalues₀_eq_zero`).

*Needs:* PolarDecomposition, Part A, PD-A53 (Weyl's perturbation bound); Mathlib
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

### 2.2 Continuous spectral functions

Let `[RCLike 𝕜]`, `n` finite, and `h : ℝ → ℝ` continuous.

- The map `A ↦ cfc h A` is continuous on the set of Hermitian matrices in `Matrix n n 𝕜`
  (`TauCeti.continuousOn_matrix_cfc`); equivalently, its restriction to the subtype of Hermitian
  matrices is continuous. This is Mathlib's continuity of the functional calculus in its operator
  variable, `continuousOn_cfc`, for the ℓ² operator norm, which induces the entrywise topology.
- The map `A ↦ cfc h A` is Borel measurable on all of `Matrix n n 𝕜`
  (`TauCeti.measurable_matrix_cfc`): it is continuous on the closed set of Hermitian matrices and
  zero off it. Hence for every measurable random matrix `ω ↦ A(ω)`, in particular every measurable
  random Hermitian matrix, `ω ↦ cfc h (A(ω))` is measurable, by composition.

*Needs:* §2.1 (the measurable structure); Mathlib `cfc`, `cfc_apply_of_not_predicate`,
`continuousOn_cfc`.

**Checks.**
- The map `A ↦ cfc id A` is the identity on Hermitian matrices and `0` off them: for the
  non-Hermitian `[[0, 1], [0, 0]]` its value is `0`, not the matrix itself. So it is continuous on
  the Hermitian matrices but not on all matrices: `[[1, t], [0, 1]] → I` as `t → 0`, while the
  values are `0` for `t ≠ 0` and `I` at `t = 0`. A reading of continuity on all of
  `Matrix n n 𝕜` would be false, and measurability on all matrices needs the closed-set argument
  above.

### 2.3 Fixed-threshold spectral projectors

Let `[RCLike 𝕜]`, `n` finite, `c : ℝ` a deterministic threshold and
`P_[c,∞)(A) = cfc ((Set.Ici c).indicator 1) A` (Conventions 6).

- *The projector:* `P_[c,∞)(A)` is a star projection, self-adjoint and idempotent, for every `A`
  (`TauCeti.isStarProjection_cfc_indicator`). For Hermitian `A`, its Euclidean operator is the
  orthogonal projection onto the sum of the eigenspaces of `A` with eigenvalue in `[c, ∞)`
  (`Matrix.IsHermitian.toEuclideanLin_cfc_indicator`), and its trace is the number of eigenvalues
  of `A` in `[c, ∞)`, counted with multiplicity (`Matrix.IsHermitian.trace_cfc`, applied to the
  indicator).
- *Measurability:* `A ↦ P_[c,∞)(A)` is Borel measurable on `Matrix n n 𝕜`
  (`TauCeti.measurable_matrix_cfc_indicator`, for the closed set `Set.Ici c`), hence on the
  Hermitian matrices with the subspace structure. The map is not continuous; the indicator of
  `[c, ∞)` is a pointwise limit of continuous functions, and since the spectrum of a matrix is
  finite, pointwise convergence of functions gives convergence of their functional calculi at every
  matrix (`TauCeti.tendsto_matrix_cfc_fun`), so measurability passes from §2.2 to the limit.
- *Random matrices:* for every measurable random matrix `ω ↦ A(ω)`, in particular every measurable
  random Hermitian matrix, `ω ↦ P_[c,∞)(A(ω))` is measurable, by composition.
- *Threshold rank stability:* let `A`, `Â` be Hermitian and `δ ≤ |λ_k(A) − c|` for every `k`. If
  `‖Â − A‖ < δ` in the ℓ² operator norm, then `A` and `Â` have the same number of sorted
  eigenvalues in `[c, ∞)`, counted with multiplicity
  (`Matrix.IsHermitian.card_eigenvalues₀_ge_eq_of_norm_sub_lt`). Index by index,
  `c ≤ λ_k(Â) ↔ c ≤ λ_k(A)` whenever `‖Â − A‖ < |λ_k(A) − c|`
  (`Matrix.IsHermitian.le_eigenvalues₀_iff_of_norm_sub_lt`). Both follow from Weyl's bound of §2.1
  (Bhatia, Corollary III.2.6).

*Needs:* §2.1 (Weyl's bound, the measurable structure) and §2.2 (measurability for continuous
functions); Mathlib `cfc`, `Set.indicator`, `IsStarProjection`.

**Checks.**
- The endpoint is closed: for `A = diag(1, 0)` and `c = 1`, `P_[1,∞)(A) = diag(1, 0)`, while the
  projector onto eigenvalues in the open interval `(1, ∞)` is `0`. A definition with a strict
  threshold differs exactly when `c` is an eigenvalue.
- The projector is not continuous in `A`: for `A_t = diag(t, −1)` and `c = 0`,
  `P_[0,∞)(A_t) = 0` for `t < 0` and `diag(1, 0)` at `t = 0`. So its measurability is not a
  consequence of the continuity of §2.2.
- The gap hypothesis is needed: for `A = diag(1, 0)` and `c = 1` no `δ > 0` satisfies it, and
  `Â = diag(1 − t, 0)`, at operator distance `t` from `A`, has no eigenvalue in `[1, ∞)` for any
  `t > 0`, while `A` has one.

### 2.4 Probability-to-convergence bridges

Let `(Ω, μ)` be a measure space, `l` a filter on an index type `ι`, `f : ι → Ω → E` and
`g : Ω → E`. Convergence in measure is Mathlib's `MeasureTheory.TendstoInMeasure`. These are the
forms in which the high-probability bounds of Layer 3 are consumed.

- *Complement bound:* for a probability measure and every set `s ⊆ Ω`, measurable or not,
  `1 − μ sᶜ ≤ μ s` (`MeasureTheory.Measure.one_sub_measure_compl_le`).
- *Extended-distance rates:* if `E` has an extended distance, `rate : ι → ℝ≥0∞` tends to `0`
  along `l`, and `μ {x | rate i < edist (f i x) (g x)}` tends to `0`, then `f` tends to `g` in
  measure (`TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_edist`).
- *Distance rates:* if `E` is a pseudometric space, `rate : ι → ℝ` tends to `0`, and
  `μ {x | rate i < dist (f i x) (g x)}` tends to `0`, then `f` tends to `g` in measure
  (`TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_dist`); the rate may take negative values.
- *High-probability form:* if `μ` is a probability measure, `rate : ι → ℝ` tends to `0`, the
  events `{x | dist (f i x) (g x) ≤ rate i}` are null-measurable, and their probabilities tend to
  `1`, then `f` tends to `g` in measure
  (`TauCeti.tendstoInMeasure_of_tendsto_measure_dist_le_rate`). Here null-measurability is used to
  pass from the event to its complement.

The first three statements need no measurability of the exceptional sets, by monotonicity of the
measure on all subsets.

*Needs:* Mathlib `MeasureTheory.TendstoInMeasure`, `MeasureTheory.IsProbabilityMeasure`.

### Examples

- Let `A = diag(3, 1, 1)` and `c = 2`, so `|λ_k(A) − 2| ≥ 1` for every `k`. Every Hermitian `Â`
  whose entries are within `ε < 1/3` of those of `A` has `‖Â − A‖ ≤ 3ε < 1` by §2.1, hence
  exactly one sorted eigenvalue in `[2, ∞)` by §2.3, and `P_[2,∞)(Â)` is a projection of trace one.
- For a measurable random Hermitian matrix `ω ↦ A(ω)`, the matrix exponential
  `ω ↦ cfc Real.exp (A(ω))` is measurable by §2.2 and the spectral projector
  `ω ↦ P_[c,∞)(A(ω))` by §2.3, without any measurable choice of eigenvectors.

### Dependencies

PolarDecomposition, Part A, PD-A53 (Weyl's perturbation bound for symmetric operators). Mathlib:
the measurable and Borel structures on matrices, the Euclidean operator of a matrix and the ℓ²
operator norm, the sorted eigenvalues of a Hermitian matrix, the continuous functional calculus
with its continuity in the operator variable, and convergence in measure. Tau Ceti: the
declarations named above. Layer 1 is not used.

## Layer 3: sample moments and matrix concentration

This layer starts from scalar second moments and pairwise independence. The sample-mean identities
give the `1/r` mean-square scale, the centered scatter operator records the finite-sample geometry
exactly, and a union bound over entries turns per-entry second moments into eigenvalue and
operator-norm concentration through §2.1.

### 3.1 Scalar and vector sample-mean identities

Let `(Ω, μ)` be a probability space and `ι` a finite nonempty index type, `r = card ι`; for
`ι = Fin r` nonemptiness is `0 < r`. The sample mean `r⁻¹ ∑ₖ Xₖ` is the finite mean of
Conventions 8 (Vershynin, *High-Dimensional Probability*).

- *Uncentered Chebyshev inequality*, for any measure `μ`: if `Y : Ω → ℝ` has `Y²` integrable,
  `∫ Y² dμ ≤ v` and `η > 0`, then `μ {η < Y} ≤ ENNReal.ofReal (v / η²)`
  (`TauCeti.meas_gt_le_div_sq_of_integral_sq_le`). More generally, for `Y` with values in a type
  with a norm and `‖Y‖²` integrable, `μ {c ≤ ‖Y‖} ≤ ENNReal.ofReal ((∫ ‖Y‖² dμ) / c²)` for
  `c > 0` (`TauCeti.meas_ge_le_integral_norm_sq_div_sq`).
- *Scalar sample mean:* if `Z : ι → Ω → ℝ` are square integrable, pairwise independent and have a
  common mean `c`, then `∫ (r⁻¹ ∑ₖ Zₖ − c)² dμ = r⁻² ∑ₖ ∫ (Zₖ − c)² dμ`
  (`TauCeti.integral_finiteMean_sub_sq`).
- *Vector sample mean:* if `X : ι → Ω → E` take values in a real Hilbert space `E` with its Borel
  structure (finite-dimensional real inner product spaces are examples), are square integrable,
  pairwise independent and have a common mean `m`, then
  `∫ ‖r⁻¹ ∑ₖ Xₖ − m‖² dμ = r⁻² ∑ₖ ∫ ‖Xₖ − m‖² dμ` (`TauCeti.integral_norm_finiteMean_sub_sq`). It
  rests on Bienaymé's identity: for pairwise independent, centered, square-integrable random
  vectors, the expected squared norm of the sum is the sum of the expected squared norms
  (`TauCeti.integral_norm_sum_sq_of_pairwise_indepFun`).
- *Identically distributed form:* if moreover `∫ ‖Xₖ − m‖² dμ = γ` for every `k`, the sample mean
  has mean-square error `γ / r` (`TauCeti.integral_norm_finiteMean_sub_sq_of_forall_eq`).
- *Uniform bound:* if instead `∫ ‖Xₖ − m‖² dμ ≤ γ` for every `k`, the sample mean has mean-square
  error at most `γ / r` (`TauCeti.integral_norm_finiteMean_sub_sq_le_of_forall_le`).

*Needs:* the finite mean of Conventions 8 (`TauCeti.finiteMean`); Mathlib
`ProbabilityTheory.IndepFun`, `ProbabilityTheory.IndepFun.integral_bilin`, `MeasureTheory.MemLp`,
`MeasureTheory.meas_ge_le_lintegral_div`.

**Checks.**
- Pairwise independence suffices: for independent fair signs `Z₁, Z₂ ∈ {±1}` and `Z₃ = Z₁ Z₂`,
  the three are pairwise independent but not independent, have common mean `0`, and
  `∫ ((Z₁ + Z₂ + Z₃)/3)² = 1/3 = 3⁻² · 3`, as the scalar identity says. A statement asking for
  mutual independence would not apply to this family.
- The common mean cannot be dropped: the constants `Z₁ = 1` and `Z₂ = −1` are independent, and
  with `c = 0` the left side is `∫ ((1 − 1)/2)² = 0` while the right side is `2⁻² (1 + 1) = 1/2`.

### 3.2 Finite means and centered scatter

*Finite mean.* For `z : ι → E` with `ι` finite and `E` a vector space over a field `R`, the finite
mean `TauCeti.finiteMean R z` is the center of mass of `z` with equal weights, and
`TauCeti.finiteMean R z = (card ι)⁻¹ • ∑ᵢ zᵢ` (`TauCeti.finiteMean_eq_inv_smul_sum`). Normed
spaces over `ℝ` or `ℂ` are the case `R = 𝕜`.

- The empty family has mean `0` (`TauCeti.finiteMean_of_isEmpty`).
- Over a field of characteristic zero, the deviations sum to zero, `∑ᵢ (zᵢ − z̄) = 0`
  (`TauCeti.sum_sub_finiteMean`).
- Over a field of characteristic zero, appending `y` to `z : Fin n → E` moves the mean to
  `z̄ + (n + 1)⁻¹ • (y − z̄)`, for every `n` including `n = 0` (`TauCeti.finiteMean_snoc`).

*Centered scatter.* Let `E` be an inner product space over `𝕜` with `[RCLike 𝕜]`, not necessarily
complete, and `z : ι → E` with `ι` finite. The centered scatter operator is the bounded operator
`TauCeti.centeredScatter 𝕜 z = ∑ᵢ (zᵢ − z̄) ⊗ (zᵢ − z̄) : E →L[𝕜] E`, sending `x` to
`∑ᵢ ⟪zᵢ − z̄, x⟫ (zᵢ − z̄)` (`TauCeti.centeredScatter_apply`). Write `S(z)` for it.

- *Add-one identity:* for `z : Fin n → E` and `y : E`,
  `S(Fin.snoc z y) = S(z) + (n / (n + 1)) • (y − z̄) ⊗ (y − z̄)` (`TauCeti.centeredScatter_snoc`).
- *Quadratic form:* `Re ⟪S(z) x, x⟫ = ∑ᵢ ‖⟪zᵢ − z̄, x⟫‖²` for every `x`
  (`TauCeti.re_inner_centeredScatter_apply_self`).
- *Positivity:* `S(z)` is a positive operator (`TauCeti.isPositive_centeredScatter`).
- *Monotonicity under appending:* `S(z) ≤ S(Fin.snoc z y)` in the Loewner order
  (`TauCeti.centeredScatter_le_centeredScatter_snoc`).
- *Add-one quadratic form:*
  `Re ⟪S(Fin.snoc z y) x, x⟫ = Re ⟪S(z) x, x⟫ + n/(n + 1) · ‖⟪y − z̄, x⟫‖²` for every `x`
  (`TauCeti.re_inner_centeredScatter_snoc_apply_self`).

*Route.* The scatter about an arbitrary centre `p` is
`∑ᵢ (zᵢ − p) ⊗ (zᵢ − p) = S(z) + (card ι) • (z̄ − p) ⊗ (z̄ − p)`
(`TauCeti.sum_rankOne_sub_eq_centeredScatter_add`); with `p` the new mean and the add-one mean
identity it gives the add-one identity.

*Needs:* Mathlib `Finset.centerMass`, `InnerProductSpace.rankOne`, `ContinuousLinearMap.IsPositive`,
`Fin.snoc`.

**Checks.**
- The add-one mean identity at `n = 0` reads `z̄' = 0 + 1⁻¹ (y − 0) = y`: the mean of one point is
  that point, which holds because the empty family has mean `0`. A convention leaving the empty
  mean unspecified, as the affine centroid does, would not give the identity at `n = 0`.
- For `z = (0, 2)` in `ℝ` and `y = 4`: `z̄ = 1` and `S(z) = 2`; the extended family `(0, 2, 4)`
  has mean `2` and scatter `8`; the identity gives `2 + (2/3)(4 − 1)² = 8`. With the coefficient `1`
  in place of `n/(n + 1)` it would give `11`.

### 3.3 Empirical second moments

For a sample `v : ι → n → 𝕜` of `r = card ι` vectors over `[RCLike 𝕜]`, the empirical
second-moment matrix `TauCeti.sampleSecondMoment v` is the finite mean of the rank-one matrices
`vᵢ vᵢᴴ` (Mathlib's `Matrix.vecMulVec`), `r⁻¹ ∑ᵢ vᵢ vᵢᴴ`; its `(k, l)` entry is
`r⁻¹ ∑ᵢ vᵢ k · conj (vᵢ l)` (`TauCeti.sampleSecondMoment_apply`). For real random vectors
`V : ι → Ω → n → ℝ`, `M̂(ω) = TauCeti.sampleSecondMoment (fun i ↦ V i ω)` has entries
`r⁻¹ ∑ᵢ V i ω k · V i ω l`. It is uncentered: the sample mean is not subtracted.

- *Hermitian:* `M̂` is Hermitian for every sample (`TauCeti.isHermitian_sampleSecondMoment`), and
  positive semidefinite (`TauCeti.posSemidef_sampleSecondMoment`).
- *Per-entry second moment:* let `μ` be a probability measure, `ι` nonempty, and fix coordinates
  `k`, `l`. If the products `Yᵢ(ω) = V i ω k · V i ω l` are square integrable, pairwise
  independent and have a common mean `M k l`, and `∫ (Yᵢ − M k l)² dμ ≤ v` for every `i`, then
  `∫ (M̂ k l − M k l)² dμ ≤ v / r` (`TauCeti.integral_sampleSecondMoment_apply_sub_sq_le`;
  Vershynin, *High-Dimensional Probability*). In particular this holds when the centered second
  moments of the `Yᵢ` are all equal to a common value at most `v`.

*Needs:* §3.1 (the uniform sample-mean bound with `E = ℝ`) and §3.2 (the finite mean); Mathlib
`Matrix.vecMulVec`, `Matrix.IsHermitian`, `Matrix.PosSemidef`.

**Checks.**
- For the real sample `v₁ = (1, 1)`, `v₂ = (1, −1)`,
  `M̂ = ½ ([[1, 1], [1, 1]] + [[1, −1], [−1, 1]]) = I`, while the centered sample covariance
  `½ ∑ᵢ (vᵢ − v̄)(vᵢ − v̄)ᵀ`, with `v̄ = (1, 0)`, is `diag(0, 1)`. The two notions differ as soon as
  the sample mean is nonzero.
- For the complex vector `v = (1, i)`, `v vᴴ = [[1, −i], [i, 1]]` is Hermitian while
  `v vᵀ = [[1, i], [i, −1]]` is not; the conjugate in the entries is what makes `M̂` Hermitian
  over `ℂ`.

### 3.4 Entrywise, eigenvalue and operator concentration

Let `(Ω, μ)` be a measure space, `S : Ω → Matrix m n E` a random matrix with entries in a type with
a norm and a subtraction, `A : Matrix m n E` a fixed matrix, `v` real and `η > 0`. Suppose every
squared entrywise deviation `ω ↦ ‖S ω k l − A k l‖²` is integrable, with
`∫ ‖S ω k l − A k l‖² dμ ≤ v`. For real entries `‖·‖²` is the square (Vershynin,
*High-Dimensional Probability*, sample second-moment concentration).

- *Entrywise concentration:*
  `μ {ω | ∃ k l, η < ‖S ω k l − A k l‖} ≤ ENNReal.ofReal (card m · card n · v / η²)`
  (`TauCeti.measure_exists_lt_norm_sub_le`): Chebyshev's inequality of §3.1 for each entry and a
  union bound. For `n × n` matrices the factor is `n²`. No measurability of the entries is needed.
- *Measurability of the deviation event:* if `m` and `n` are countable, `E` is a seminormed group
  whose open sets are measurable and whose subtraction is measurable, and every entry
  `ω ↦ S ω k l` is measurable, then `{ω | ∃ k l, η < ‖S ω k l − A k l‖}` is measurable for every
  real `η` (`TauCeti.measurableSet_exists_lt_norm_sub`). In particular the event of the entrywise
  bound is measurable for a real random matrix with measurable entries.
- *High-probability closeness:* for a probability measure, every set that contains all outcomes at
  which all entries of `S` are within `η` of those of `A` has measure at least
  `1 − ENNReal.ofReal (card m · card n · v / η²)` (`TauCeti.one_sub_le_measure_of_entry_le`), by
  the complement bound of §2.4.

Let now `μ` be a probability measure, `[RCLike 𝕜]`, `n` finite, and `S : Ω → Matrix n n 𝕜`,
`A : Matrix n n 𝕜` satisfy the moment hypotheses above. Real symmetric matrices are the case
`𝕜 = ℝ`.

- *Eigenvalue concentration:* if `S ω` is Hermitian for every `ω` and `A` is Hermitian, then with
  probability at least `1 − ENNReal.ofReal (n² v / η²)`, `|λ_k(S ω) − λ_k(A)| ≤ nη` for every `k`
  (`TauCeti.one_sub_le_measure_forall_abs_eigenvalues₀_sub_le`), by §2.1.
- *One-sided eigenvalue floor:* under the same hypotheses, with the same probability,
  `λ_k(A) − nη ≤ λ_k(S ω)` for every `k` (`TauCeti.one_sub_le_measure_forall_eigenvalues₀_sub_le`).
- *Operator-norm concentration:* with probability at least `1 − ENNReal.ofReal (n² v / η²)`,
  `‖(S ω − A) x‖ ≤ nη ‖x‖` for every `x : EuclideanSpace 𝕜 n`
  (`TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le_square`); no Hermitian hypothesis
  is needed. For rectangular `m × n` matrices the bound is `√(card m) · η · √(card n) · ‖x‖`, with
  probability at least `1 − ENNReal.ofReal (card m · card n · v / η²)`
  (`TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le`).
- *Empirical second-moment eigenvalue floor:* let `V : ι → Ω → n → ℝ` be `r = card ι > 0` real
  random vectors of dimension `d = card n`, `M̂(ω)` their empirical second-moment matrix (§3.3), and
  `M : Matrix n n ℝ` symmetric. Suppose that for every pair of coordinates `k`, `l` the hypotheses
  of the per-entry bound of §3.3 hold with the same `v`: the products `V i ω k · V i ω l` are square
  integrable, pairwise independent in `i`, have common mean `M k l`, and have second moment about
  it at most `v`. Then for every `c > 0`, with probability at least
  `1 − ENNReal.ofReal (4 d⁴ v / (r c²))`, every index `k` with `c ≤ λ_k(M)` has
  `c/2 ≤ λ_k(M̂(ω))`
  (`TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment`). Route: the
  one-sided floor with the moment bound `v / r` of §3.3 and `η = c/(2d)`. The symmetry of `M`
  already follows from the common-mean hypothesis, since `V i ω k · V i ω l` is symmetric in `k`
  and `l`; it is a hypothesis because the statement names the sorted eigenvalues of `M`. No
  measurability of the entries and no lower bound on `d` is needed: for `d = 0` there are no
  eigenvalues and the event is certain.

*Needs:* §2.1 (the entrywise operator and eigenvalue bounds), §2.4 (the complement bound), §3.1
(Chebyshev's inequality), §3.3 (the per-entry bound and the Hermitian `M̂`); Mathlib
`MeasureTheory.Integrable`, `MeasureTheory.measure_iUnion_fintype_le`, `ENNReal.ofReal`.

**Checks.**
- The constant of the floor: with the moment bound `v/r` and `η = c/(2d)`, the eigenvalue
  concentration probability is `1 − d² (v/r) / (c/(2d))² = 1 − 4d⁴v/(rc²)`, and
  `λ_k(M) − dη = λ_k(M) − c/2 ≥ c/2` when `λ_k(M) ≥ c`. Dropping the factor `n²` of the union bound
  would give `4d²v/(rc²)`, which the route does not prove.

### Examples

- Take `r` independent, identically distributed samples `V i` of a random vector in `ℝ²` whose
  coordinates are bounded by `1` in absolute value, and let `M k l` be the mean of the product of
  coordinates `k` and `l`. The products `V i k · V i l` are bounded by `1`, independent across
  samples, have common mean `M k l`, and have second moment at most `1` about it, their variance.
  With `v = 1`, `d = 2`, `c = 1` and `r = 640`, §3.4 gives probability at least
  `1 − 4 · 16/640 = 0.9` that every eigenvalue of `M` at least `1` keeps the corresponding
  eigenvalue of `M̂` at least `1/2`.
- Points added one at a time only increase the centered scatter operator in the Loewner order
  (§3.2): for `z = (0, 2)` and `y = 4` in `ℝ` the scatter grows from `2` to `8`, by
  `(2/3)(4 − 1)² = 6`.

### Dependencies

Layer 2 (§2.1 and §2.4). Mathlib: pairwise independence, `MemLp`, the Bochner and Lebesgue
integrals with Markov's inequality, finite unions of sets, the variance of a sum of pairwise
independent real variables, rank-one operators and positivity on inner product spaces. Tau Ceti:
the declarations named above. Layer 1 is not used.

## Downstream consumers

- [SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md), Part D, the
  Yu–Wang–Samworth population-gap `sin Θ` theorem (SSP-D16): applied on the event of operator-norm
  concentration of §3.4, it turns an entrywise second-moment bound on a matrix estimator into a
  high-probability bound for its spectral subspaces.

## Provenance

An Apache-2.0 implementation of Layer 1 and most of Layers 2 and 3 exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.),
in its `TauCeti.*` and `TauCeti.Matrix.*` namespaces. Several Tau Ceti modules named under the
supplier contracts record their adaptation from it.

## Scope and ownership

**This roadmap owns** the matrix-level statements of Layers 1–3 above: rank factorization through
`Fin r` and its exact-rank uniqueness; the Gram characterization of positive-semidefinite matrices
with its unitary uniqueness and the entrywise spectral expansion; the entrywise-to-operator and
entrywise-to-eigenvalue comparisons, the a-priori eigenvalue bound, the rank count and the vanishing
tail of sorted eigenvalues; continuity and measurability of the Hermitian functional calculus and
of fixed-threshold spectral projectors, and threshold rank stability; the probability-to-convergence
bridges; the sample-mean identities, finite means and the centered scatter calculus, the empirical
second-moment matrix, and entrywise, eigenvalue and operator-norm concentration. Within the
operator-theory family, matrix-level statements with entrywise hypotheses belong here.

**Already in the library.** Every statement of Layers 1–3 is proved in the pinned Tau Ceti library
or in Mathlib, under the declaration named at it; the declarations are listed with their
hypotheses under the supplier contracts below, and `Suggested.lean` pins those of the headline
theorems. The measurable structure on matrices and its Borel property, matrix rank, positive
semidefiniteness, the sorted eigenvalues of a Hermitian matrix, the continuous functional calculus
with its continuity in the operator variable, and convergence in measure are Mathlib's; the
declarations listed under the Tau Ceti supplier contracts below are Tau Ceti's.

**Owned elsewhere and consumed here.**

- *Weyl's perturbation bound* for symmetric operators on a finite-dimensional inner product space:
  PolarDecomposition, Part A, PD-A53. Its Tau Ceti declaration is
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`, and §2.1 uses its matrix form.

**Outside this roadmap.** The Davis–Kahan and Yu–Wang–Samworth `sin Θ` theorems belong to
SpectralSubspacePerturbation, which combines them with Layers 2 and 3 (Downstream consumers).
Concentration with logarithmic dimension dependence, such as matrix Bernstein and matrix Chernoff
inequalities, is not part of this roadmap: the dimension factors of Conventions 5 are the
specification.

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
  `cfc_apply_of_not_predicate` (`cfc f a = 0` when `a` is not self-adjoint); `continuousOn_cfc`
  (continuity of the functional calculus in the operator variable); `Set.indicator`,
  `IsStarProjection`.
- *Measurability on matrices:* the instance `MeasurableSpace (Matrix m n α)`, defined as that of
  `m → n → α`, with `Matrix.measurable_iff`; the instance `BorelSpace (Matrix m n α)` for countable
  `m`, `n` and a second-countable Borel space `α` (both in
  `Mathlib/Analysis/Matrix/MeasurableSpace.lean`).
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

Every declaration below is proved at the pin, with the hypotheses stated where the layers use
it.

- `TauCeti/LinearAlgebra/Matrix/Rank.lean`, over a field with `[Fintype n]`:
  `Matrix.exists_eq_mul_fin_rank`, `Matrix.exists_eq_mul_of_rank_le`,
  `Matrix.rank_le_iff_exists_eq_mul` (§1.1).
- `TauCeti/LinearAlgebra/Matrix/Rank/Factorization.lean`:
  `Matrix.exists_unit_eq_mul_of_rank_factorization` (two factorizations through a finite `ι` with
  `card ι = rank` differ by a unit, §1.3).
- `TauCeti/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.apply_eq_sum_eigenvalues` (§1.2).
- `TauCeti/Analysis/Matrix/GramFactorization.lean`, over `RCLike` with finite `m`, `n`:
  `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`,
  `Matrix.PosSemidef.exists_eq_conjTranspose_mul_self_of_rank_le`,
  `Matrix.posSemidef_and_rank_le_iff_eq_conjTranspose_mul_self` (§1.2).
- `TauCeti/Analysis/Matrix/GramFactorization/Uniqueness.lean`:
  `TauCeti.conjTranspose_mul_self_eq_iff_exists_unitary_mul` (finite `m` with decidable equality,
  any `n`, §1.3).
- `TauCeti/Analysis/Matrix/EntrywiseOpNorm.lean`: `Matrix.norm_toEuclideanLin_le_of_entry_le`
  (rectangular, factor `√(card m) · √(card n)`) and
  `Matrix.norm_toEuclideanLin_le_of_entry_le_square` (square, factor `card n`) (§2.1).
- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`:
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm` (Weyl's bound for symmetric
  continuous linear maps on a finite-dimensional inner product space, §2.1).
- `TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`, for Hermitian matrices over `RCLike` with a
  finite index type: `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`,
  `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_of_entry_le`,
  `Matrix.IsHermitian.abs_eigenvalues₀_le_of_entry_le`,
  `Matrix.IsHermitian.rank_eq_card_non_zero_eigenvalues₀`, `Matrix.PosSemidef.eigenvalues₀_nonneg`,
  `Matrix.PosSemidef.eigenvalues₀_eq_zero_of_rank_le`,
  `Matrix.PosSemidef.rank_le_iff_eigenvalues₀_eq_zero` (§2.1);
  `Matrix.IsHermitian.le_eigenvalues₀_iff_of_norm_sub_lt` and
  `Matrix.IsHermitian.card_eigenvalues₀_ge_eq_of_norm_sub_lt`, in the ℓ² operator norm (§2.3).
- `TauCeti/Analysis/Matrix/FunctionalCalculus.lean`: `TauCeti.continuousOn_matrix_cfc`,
  `TauCeti.measurable_matrix_cfc` (continuous `f`, §2.2); `TauCeti.tendsto_matrix_cfc_fun`,
  `TauCeti.measurable_matrix_cfc_indicator` (closed `Ω ⊆ ℝ`),
  `Matrix.IsHermitian.toEuclideanLin_cfc_indicator` (the Euclidean operator of
  `cfc (Ω.indicator 1) A` is the orthogonal projection onto Tau Ceti's
  `Module.End.pointSpectralSubspace (Matrix.toEuclideanLin A) Ω`, the sum of the eigenspaces at
  eigenvalues in `Ω`) and `Matrix.IsHermitian.trace_cfc` (§2.3).
- `TauCeti/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Projection.lean`:
  `TauCeti.isStarProjection_cfc_indicator` (any `Ω ⊆ ℝ` and any element, §2.3).
- `TauCeti/MeasureTheory/Measure/Typeclasses/Probability.lean`:
  `MeasureTheory.Measure.one_sub_measure_compl_le` (§2.4).
- `TauCeti/MeasureTheory/Function/ConvergenceInMeasure.lean`:
  `TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_edist`,
  `TauCeti.tendstoInMeasure_of_tendsto_measure_rate_lt_dist` (any measure and filter) and
  `TauCeti.tendstoInMeasure_of_tendsto_measure_dist_le_rate` (a probability measure and
  null-measurable events) (§2.4).
- `TauCeti/Probability/Moments/Chebyshev.lean`: `TauCeti.meas_gt_le_div_sq_of_integral_sq_le`,
  `TauCeti.meas_ge_le_integral_norm_sq_div_sq` (any measure, §3.1).
- `TauCeti/Probability/Moments/SampleMean.lean`, on a probability space with a finite nonempty
  index type and values in a complete real inner product space with its Borel structure:
  `TauCeti.integral_norm_sum_sq_of_pairwise_indepFun`, `TauCeti.integral_finiteMean_sub_sq`,
  `TauCeti.integral_norm_finiteMean_sub_sq`, `TauCeti.integral_norm_finiteMean_sub_sq_of_forall_eq`,
  `TauCeti.integral_norm_finiteMean_sub_sq_le_of_forall_le` (§3.1).
- `TauCeti/Analysis/Convex/FiniteMean.lean`: `TauCeti.finiteMean`,
  `TauCeti.finiteMean_eq_inv_smul_sum`, `TauCeti.finiteMean_of_isEmpty` (any field),
  `TauCeti.sum_sub_finiteMean`, `TauCeti.finiteMean_snoc` (characteristic zero) (§3.2).
- `TauCeti/Analysis/InnerProductSpace/CenteredScatter.lean`, for an inner product space over
  `RCLike`: `TauCeti.centeredScatter`, `TauCeti.centeredScatter_apply`,
  `TauCeti.sum_rankOne_sub_eq_centeredScatter_add`, `TauCeti.re_inner_centeredScatter_apply_self`,
  `TauCeti.isPositive_centeredScatter`, `TauCeti.centeredScatter_snoc`,
  `TauCeti.re_inner_centeredScatter_snoc_apply_self`,
  `TauCeti.centeredScatter_le_centeredScatter_snoc` (§3.2).
- `TauCeti/Analysis/Matrix/SampleSecondMoment.lean`, over `RCLike` with a finite sample index:
  `TauCeti.sampleSecondMoment`, `TauCeti.sampleSecondMoment_apply`,
  `TauCeti.isHermitian_sampleSecondMoment`, `TauCeti.posSemidef_sampleSecondMoment` (finite `n`)
  (§3.3).
- `TauCeti/Probability/Moments/MatrixConcentration.lean`:
  `TauCeti.integral_sampleSecondMoment_apply_sub_sq_le` (§3.3);
  `TauCeti.measure_exists_lt_norm_sub_le` (any measure, entries in a type with a norm and a
  subtraction), `TauCeti.measurableSet_exists_lt_norm_sub` (countable indices),
  `TauCeti.one_sub_le_measure_of_entry_le`,
  `TauCeti.one_sub_le_measure_forall_abs_eigenvalues₀_sub_le`,
  `TauCeti.one_sub_le_measure_forall_eigenvalues₀_sub_le`,
  `TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le`,
  `TauCeti.one_sub_le_measure_forall_norm_toEuclideanLin_sub_le_square` (a probability measure)
  and `TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment` (§3.4).

### From TauCetiRoadmap.PolarDecomposition

- Part A, PD-A53, Weyl's perturbation bound: for symmetric endomorphisms `S` and `T` of a
  finite-dimensional inner product space, `|λ_k(S) − λ_k(T)| ≤ ‖S − T‖` for every sorted index `k`.
  §2.1 uses it in the matrix form `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed. (2013) — spectral theorem, positive
  semidefinite Gram factorizations, Weyl's inequality (Theorem 4.3.1).
- R. Bhatia, *Matrix Analysis* (GTM 169, 1997) — eigenvalue perturbation (Corollary III.2.6).
- T. F. Cox, M. A. A. Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 — classical
  scaling and positive-semidefinite Gram embeddings.
- R. Vershynin, *High-Dimensional Probability* (2018) — sample second-moment concentration and
  its uses.

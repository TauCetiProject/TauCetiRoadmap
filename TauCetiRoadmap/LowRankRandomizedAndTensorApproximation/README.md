# Roadmap: low-rank, randomized and tensor approximation

**Summary.** This roadmap builds the approximation theory behind the compression of matrices,
tensors and integral operators by low-rank objects:
- best approximation of a matrix by matrices of rank at most `k`, in the spectral and the
  Frobenius norm, attained by the truncated singular value expansion;
- the randomized range finder: a deterministic error bound for an arbitrary test matrix, and the
  expected error for a Gaussian test matrix, with the moments of the pseudoinverse of a
  rectangular Gaussian matrix and Chevet's inequality;
- Gaussian widths, Gaussian concentration above the mean, Gordon's tail bounds for the restricted
  singular values of a Gaussian matrix, and their two applications: oblivious subspace
  embeddings and the Johnson–Lindenstrauss embedding of a finite set;
- tensor rank and topological border rank over `ℝ` and `ℂ`: the tensor of rank three that is a
  limit of tensors of rank two, closedness of the rank-one tensors and non-closedness of the
  tensors of rank at most `r` for `r ≥ 2` and three or more parties, the comparison with the
  algebraic border rank, and stable limits;
- the Tucker format and the higher-order SVD, with its error bound and quasi-optimality;
- the tensor-train format, its characterization by the ranks of the cut unfoldings, and the
  TT-SVD truncation with its error bound and quasi-optimality;
- separable approximation of asymptotically smooth kernels by Taylor expansion, the resulting
  low-rank Galerkin blocks on separated clusters, and the logarithmic kernel in one dimension.

The nearest roadmaps are
[RandomProjectionsAndSketching](../RandomProjectionsAndSketching/README.md), whose subspace
embeddings and sketch-and-solve receive the Gaussian embeddings of Layer 3;
GaussianComparisonInequalities, which supplies Gordon's inequality in expectation and the
Sudakov–Fernique comparison used in Layers 2 and 3; BilinearComplexityAndBorderRank, which supplies
the algebraic border rank and the tensor of rank three compared with the topological notions of
Layer 4; and [AsymptoticSpectra](../AsymptoticSpectra/README.md), which owns tensor rank. The
roadmap is a synthesis of several sources: Martinsson–Tropp's survey of randomized linear algebra,
Foucart–Rauhut on Gaussian comparison and concentration, Hackbusch's monographs on tensor spaces and
hierarchical matrices, Lim's survey of tensors in computation, and Trefethen–Bau (see
[References](#references)). Headlines that restate a source result cite a theorem, definition,
section or equation number with its printed page; corollaries and adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the bullets without a Lean name are
definitions, results consumed from Tau Ceti or other roadmaps, corollaries one step from a stated
headline, or headlines of the same standing stated in prose.

Suggested home: `TauCeti/Analysis/Matrix/LowRank/` for Layers 1–2,
`TauCeti/Probability/GaussianWidth/` for Layer 3, `TauCeti/LinearAlgebra/Tensor/Approximation/`
for Layers 4–6 and `TauCeti/Analysis/SeparableApproximation/` for Layer 7.

## How to read the build

Layer 1 is the deterministic core. The spectral-norm Eckart–Young theorem is Tau Ceti's
identification of approximation numbers with singular values; the Frobenius form follows from
Tau Ceti's Hoffman–Wielandt inequality, because a matrix of rank at most `k` has vanishing
singular values from index `k` on. Every error bound of Layers 2, 5 and 6 is measured against
the tails of Layer 1.

Layer 2 applies Layer 1 to a sketch `A Ω`. The deterministic bound of 2.1 isolates the only
random quantity, the product of the tail part of `A` with a right inverse of the projected test
matrix; for a Gaussian test matrix, rotation invariance splits that product into independent
Gaussian blocks, and 2.2–2.4 bound its expectation by Chevet's inequality and the inverse
Wishart mean.

Layer 3 is independent of Layers 1–2. It defines the Gaussian width, bounds it for subspaces and
finite sets, and turns Gordon's inequality in expectation (GaussianComparisonInequalities 5.2)
and the Sudakov–Fernique comparison into tail bounds by Gaussian concentration above the mean.
Subspace embeddings and the Johnson–Lindenstrauss lemma are the two specializations.

Layers 4–6 concern tensors with a fixed format. Layer 4 is topology: which sets of low-rank
tensors are closed. Layers 5 and 6 replace the CP format of Layer 4 by formats defined through
ranks of matrix unfoldings, which are closed because rank is lower semicontinuous; their
truncation algorithms apply Layer 1 to each unfolding and combine the projections by one
orthogonality lemma.

Layer 7 is independent of Layers 2–6: a Taylor polynomial in `x` is separable in `(x, y)`, so an
asymptotically smooth kernel on a separated pair of clusters is approximated by a separable
kernel, and the Galerkin block by a matrix of low rank, with the error of the Taylor remainder.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Matrices.** Matrices are `Matrix (Fin m) (Fin n) 𝕜` over an `RCLike` field `𝕜`, acting on
  `EuclideanSpace 𝕜 (Fin n)` through `Matrix.toEuclideanLin`. Gaussian statements are real.
- **Zero-based singular values.** The singular values of `A` are Mathlib's
  `LinearMap.singularValues` of `Matrix.toEuclideanLin A`, a decreasing sequence indexed from `0`
  that vanishes beyond the rank. The sources' `σ_{k+1}`, the first singular value not captured
  by a rank-`k` approximation, is index `k` here. The squared tail `∑_{i ≥ k} σᵢ²` is `tailSq`.
- **Matrix norms.** There is no default matrix norm. The spectral norm is Mathlib's scoped
  instance `Matrix.Norms.L2Operator`, opened where it is used. The Frobenius norm is the explicit
  `frobNorm`, equal to Mathlib's scoped Frobenius norm (`frobNorm_eq_norm`), so that statements
  mixing the two norms, as Chevet's inequality does, open one instance only. These are the
  conventions of MatrixFactorizationsAndSparseElimination (Conventions), with the Frobenius norm
  written out for that reason.
- **Chi means.** a(k) is the mean of `‖g‖` for `g` standard Gaussian in `ℝᵏ`, the mean of the
  chi law with `k` degrees of freedom; so a(1) = √(2/π).
- **Projectors and pseudoinverses.** The orthogonal projector onto the range of `Y` is
  `rangeProj Y`, built from Mathlib's `Submodule.starProjection`; the Moore–Penrose inverse is
  `pinv`, from Tau Ceti's `LinearMap.moorePenroseInverse`. Neither carries a rank hypothesis: both
  are genuine for every matrix.
- **Gaussian matrices.** A standard Gaussian `m × n` matrix is `toMatrix x` for `x` drawn from
  `stdGaussian` on `EuclideanSpace ℝ (Fin m × Fin n)`, the convention of
  GaussianComparisonInequalities; the normalized embedding of Layer 3 is `(√d)⁻¹ • toMatrix x`,
  with entries of variance `1/d`. Probabilities are `.real` of the measure.
- **Suprema over sets.** The Gaussian width and the restricted singular values are suprema and
  infima over the subtype of a set `K`, never `⨆ x ∈ K` in `ℝ`, whose inner supremum over an
  empty condition is the junk value `0`. Statements assume `K` nonempty and contained in the unit
  sphere or ball, so that every supremum is bounded.
- **Possibly infinite moments.** A moment that is infinite for some parameters is a lower
  Lebesgue integral in `ℝ≥0∞` (`lintegral_frobNorm_sq_pinv_toMatrix`); a Bochner integral is used
  only for integrands that are bounded, or with integrability as a conjunct
  (`integral_opNorm_pinv_toMatrix_le`).
- **Tensors.** A tensor with parties `ι` and format `n : ι → ℕ` is an array
  `(∀ p, Fin (n p)) → 𝕜`, with Mathlib's product topology; for `ι = Fin d` the modes are
  numbered from `0`. Squared Frobenius distances of tensors are `sqDist`, never the sup norm that
  Mathlib puts on the product. The pair of a format and an array is AsymptoticSpectra's
  `CoordTensor`.
- **Kernels.** Points are in `EuclideanSpace ℝ (Fin m)`; `iteratedFDeriv` of `κ(·, y)` is used
  only where `κ` is smooth, off the diagonal, by the hypothesis `IsAsymptoticallySmooth`.

## Layer 1: best low-rank approximation of matrices

### 1.1 The truncated singular value expansion

- `truncSVD A k` is `∑_{i < k} σᵢ uᵢ vᵢᴴ`, with Tau Ceti's right singular basis `vᵢ` and left
  singular vectors `uᵢ = σᵢ⁻¹ A vᵢ` (`LinearMap.leftSingularVector`), the compact SVD of Tau
  Ceti's `LinearMap.exists_orthonormal_eq_sum_singularValues_smul_rankOne`.
- **The truncated expansion** (`truncSVD_spec`): `truncSVD A k` has rank at most `k`, spectral
  error `‖A − truncSVD A k‖ = σ_k`, and squared Frobenius error `∑_{i ≥ k} σᵢ²` [TB, Theorems
  5.8 and 5.9, pp. 35–36; HM, Theorem 2.11 and (2.3c), p. 30]. Route: on the right singular
  basis, `A − truncSVD A k` maps `vᵢ` to `σᵢ uᵢ` for `i ≥ k` and to `0` for `i < k`; its
  singular values are `σ_k, σ_{k+1}, …`, and Tau Ceti's
  `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero` gives the spectral norm.

*Needs:* Tau Ceti `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`,
`LinearMap.exists_orthonormal_eq_sum_singularValues_smul_rankOne`,
`LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`; Mathlib `Matrix.rank`.

**Checks.**

- `A = diag(3, 1)`, `k = 1`: `truncSVD A 1 = diag(3, 0)`; both errors are `1`, and the spectral
  error is the singular value of index `1`. A one-based reading of `σ_k` would give `3`.
- `A = [[1, 1], [1, 1]]`, of rank one with singular values `2, 0`: `truncSVD A 1 = A`, and both
  errors vanish.
- `k ≥ min(m, n)`: `truncSVD A k = A`; the spectral error is `σ_k = 0`, beyond the dimension.
- Random complex `4 × 3`, `5 × 5` and `3 × 6` matrices, `k = 0, …, 4`: both errors agree with
  `σ_k` and the tail to `10⁻¹²`, and no random matrix of rank `k` comes closer in the Frobenius
  norm (200 samples each).

### 1.2 The spectral norm

- Tau Ceti's Eckart–Young theorem, `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`:
  between finite-dimensional inner product spaces, the `n`th approximation number is the `n`th
  singular value.
- **Eckart–Young in the spectral norm** (`isLeast_rankApproximation_l2`): `σ_k` is the least
  value of `‖A − B‖` over matrices `B` of rank at most `k` [TB, Theorem 5.8, p. 35; HM,
  Theorem 2.11, p. 30]. Route: the approximation numbers are infima over linear maps of rank
  below `k + 1`; translate rank and norm through `Matrix.toEuclideanLin`; `truncSVD_spec`
  attains the value.

*Needs:* 1.1; Tau Ceti `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`.

**Checks.**

- `A = diag(3, 1)`, `k = 1`: every `B` of rank one has `‖A − B‖ ≥ 1`, and `B = diag(3, 0)`
  attains it; `B = diag(2, 0)` gives `1` as well, so the minimizer is not unique.
- `k = 0`: the set is `{‖A‖}` and the value is `σ₀ = ‖A‖`.

### 1.3 The Frobenius norm

- Tau Ceti's singular-value Hoffman–Wielandt inequality,
  `Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq`:
  `∑ᵢ (σᵢ(A) − σᵢ(B))² ≤ ‖A − B‖_F²`.
- **Eckart–Young–Mirsky in the Frobenius norm** (`isLeast_rankApproximation_frobenius_sq`): the
  tail `∑_{i ≥ k} σᵢ²` is the least squared Frobenius distance from `A` to a matrix of rank at
  most `k` [TB, Theorem 5.9, p. 36; HM, Theorem 2.11, p. 30]. Route: for `B` of rank at most `k`,
  `σᵢ(B) = 0` for `i ≥ k`, so Hoffman–Wielandt bounds the tail by `‖A − B‖_F²`, and
  `truncSVD_spec` attains it.
- For every unitarily invariant norm the same truncation is optimal (Mirsky). Route:
  SpectralSteepestDescent §2.1 compares the singular values of `A − B` with `|σᵢ(A) − σᵢ(B)|`,
  which dominate those of `A − truncSVD A k` when `B` has rank at most `k`.

*Needs:* 1.1; Tau Ceti
`Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq`; SpectralSteepestDescent
§2.1 for the unitarily invariant form.

**Checks.**

- `A = diag(3, 2, 1)`, `k = 1`: the value is `2² + 1² = 5`, attained by `diag(3, 0, 0)`; the
  competitor `diag(3, 2, 0)` has rank two and is excluded.
- Hoffman–Wielandt applied to `B = truncSVD A k` is an equality, since the singular values of
  `A` and `B` agree below `k`.

## Layer 2: the randomized range finder

### 2.1 The deterministic bound

- `rangeProj Y` is the orthogonal projector onto the range of `Y`, so `A − rangeProj (A Ω) A` is
  the residual of the range finder with test matrix `Ω` [MT, §11.1.1, p. 467, and Algorithm 7,
  p. 468].
- **The deterministic range-finder bound** (`rangeFinder_error_le`): for any `Ω` and any `R`
  with `A_k Ω R = A_k`, where `A_k = truncSVD A k`,
  `‖A − P A‖² ≤ ‖A − A_k‖² + ‖(A − A_k) Ω R‖²` in the spectral norm, with `P = rangeProj (A Ω)`.
  This adapts [MT, Theorem 11.4, (11.2), p. 472], an unsquared spectral bound followed by a
  remark on quadratic unitarily invariant norms: when the first `k` right singular coordinates
  `Ω₁ = V₁ᴴ Ω` of `Ω` have full row rank, `R = Ω₁† V₁ᴴ` satisfies the hypothesis and
  `(A − A_k) Ω R` has the norm of the source's `Σ₂ Ω₂ Ω₁†`. Route:
  `A Ω R = A_k + (A − A_k) Ω R` lies in the range of `A Ω`, so `‖A − P A‖ ≤ ‖A − A Ω R'‖` for
  every `R'` of the same kind; for `R' = R V₁ V₁ᴴ` the two terms of `A − A Ω R'` have
  orthogonal row spaces, and `‖X V₁‖ ≤ ‖X‖` replaces `R'` by `R`. If `σ_{k−1} = 0`, the
  hypothesis reads `A Ω R = A` and the left side vanishes.
- **The Frobenius form** (`rangeFinder_error_le_frobenius`): under the same hypothesis,
  `‖A − P A‖_F² ≤ ∑_{i ≥ k} σᵢ² + ‖(A − A_k) Ω R‖_F²`; the same route, with the Pythagorean
  identity for the Frobenius norm.
- The source's unsquared form `‖A − P A‖ ≤ σ_k + ‖Σ₂ Ω₂ Ω₁†‖` follows from the squared one.

*Needs:* 1.1; Mathlib `Submodule.starProjection`.

**Checks.**

- 4000 random real and complex cases with `m, n ≤ 6`, `k ≤ n + 1`, rank-deficient `A` in a third
  of them, and `R = (A_k Ω)† A_k + (I − (A_k Ω)† A_k Ω) N` for random `N`: no violation of
  either bound.
- Negative control: dropping the hypothesis on `R` (random `R` of size `10⁻²`, `5 × 5` matrices,
  `k = 2`, `l = 3`) violates the spectral bound in 1015 of 2000 trials.
- `k = 0`: the truncation is `0`, every `R` is admissible, and the bound reads
  `‖A − P A‖² ≤ ‖A‖² + ‖A Ω R‖²`; at `R = 0` it is `‖A − P A‖ ≤ ‖A‖`.

### 2.2 Chevet's inequality

- **Chevet's inequality** (`integral_opNorm_mul_toMatrix_mul_le`): for a standard Gaussian
  `m × n` matrix `G` and fixed real `S`, `T`, `E ‖S G T‖ ≤ ‖S‖ ‖T‖_F + ‖S‖_F ‖T‖` [MT, p. 474,
  in the proof sketch of Theorem 11.5]. Route: `‖S G T‖` is the supremum of the Gaussian process
  `X_{u,v} = ⟪Sᵀ u, G T v⟫` over unit vectors `u`, `v`; its increments are dominated by those of
  `Y_{u,v} = ‖T‖ ⟪g, Sᵀ u⟫ + ‖S‖ ⟪h, T v⟫` with independent standard Gaussian `g`, `h`, so the
  Sudakov–Fernique comparison of GaussianComparisonInequalities 2.2 on finite nets, and monotone
  convergence to the unit spheres, give `E sup X ≤ E sup Y`, which is the right side by
  Jensen's inequality.

*Needs:* GaussianComparisonInequalities §2.2; Mathlib `stdGaussian`, monotone convergence.

**Checks.**

- `S = 1`, `T = 1`: the bound is `√n + √m`, the bound of GaussianComparisonInequalities 5.1
  for `E ‖G‖`.
- Monte Carlo with 4000 samples, 300 random `S`, `T` of sizes up to `4`: no violation.
- `S = e₀ᵀ`, `T = e₀`: `S G T = G₀₀` and `E |G₀₀| = 0.798 ≤ 2`.

### 2.3 Pseudoinverses of Gaussian matrices

- Tau Ceti's inverse Wishart mean `TauCeti.Probability.integral_id_inverseWishartMeasure`: for
  `n > p + 1`, the mean of the inverse Wishart law of parameter `n` and scale `S` is
  `(n − p − 1)⁻¹ S`.
- **The second moment of `Γ†`** (`lintegral_frobNorm_sq_pinv_toMatrix`): for a standard Gaussian
  `k × l` matrix `Γ` with `k + 2 ≤ l`, `E ‖Γ†‖_F² = k / (l − k − 1)`, in `ℝ≥0∞` [MT, p. 474, in
  the proof sketch of Theorem 11.5]. Route: `Γ` has full row rank almost surely, `Γ† = Γᵀ (Γ Γᵀ)⁻¹`
  and `‖Γ†‖_F² = tr((Γ Γᵀ)⁻¹)`; `Γ Γᵀ` is Wishart with `l` degrees of freedom and identity
  scale, so its inverse has mean `(l − k − 1)⁻¹ I`.
- **The first moment of `‖Γ†‖`** (`integral_opNorm_pinv_toMatrix_le`): for `k + 2 ≤ l`,
  `‖Γ†‖` is integrable and `E ‖Γ†‖ ≤ √(k / (l − k − 1))`. Route: `‖Γ†‖ ≤ ‖Γ†‖_F` and Jensen.

*Needs:* Tau Ceti `LinearMap.moorePenroseInverse`,
`TauCeti.Probability.integral_id_inverseWishartMeasure`.

**Checks.**

- Monte Carlo with 40000 samples: `E ‖Γ†‖_F²` is `1.977` for `(k, l) = (2, 4)` against `2`,
  `1.243` for `(5, 10)` against `1.25`, and `1.053` for `(20, 40)` against `1.0526`.
- Negative control, `l = k + 1`: for `k = 1`, `l = 2`, `‖Γ†‖_F² = 1/‖g‖²` with `g` standard in
  `ℝ²`, and `E 1/‖g‖² = ∫₀^∞ r⁻¹ e^{−r²/2} dr = ∞`. A Bochner integral would return `0` here,
  which is why the statement is in `ℝ≥0∞` and assumes `k + 2 ≤ l`; the sample mean for
  `(2, 3)` is `28.8` and grows with the sample size.
- `E ‖Γ†‖` against the bound: `1.072 ≤ 1.414` for `(2, 4)`, `0.477 ≤ 1.026` for `(20, 40)`.

### 2.4 The Gaussian range finder

- **Expected error in the spectral norm** (`rangeFinder_expected_l2_le`): for a real `A`, a
  standard Gaussian `n × l` test matrix and `k + 2 ≤ l`,
  `E ‖A − P A‖ ≤ (1 + √(k/(l−k−1))) σ_k + E ‖Γ†‖ · (∑_{i ≥ k} σᵢ²)^{1/2}`, with `Γ` a standard
  Gaussian `k × l` matrix [MT, Theorem 11.5, p. 473]. Route: rotation invariance makes
  `Ω₁ = V₁ᵀ Ω` and `Ω₂ = V₂ᵀ Ω` independent standard Gaussian; condition on `Ω₁`, apply 2.1 with
  `R = Ω₁† V₁ᵀ`, then Chevet's inequality 2.2 in `Ω₂` with `S = Σ₂` and `T = Ω₁†`, and 2.3.
- With 2.3 the bound becomes `(1 + √c) σ_k + √c (∑_{i ≥ k} σᵢ²)^{1/2}` for `c = k/(l−k−1)`.
- **Expected error in the Frobenius norm** (`rangeFinder_expected_frobenius_sq_le`): for
  `k + 2 ≤ l`, `E ‖A − P A‖_F² ≤ (1 + k/(l−k−1)) ∑_{i ≥ k} σᵢ²`. Route: 2.1 in the Frobenius
  form, and `E ‖Σ₂ Ω₂ Ω₁†‖_F² = ‖Σ₂‖_F² E ‖Ω₁†‖_F²` by independence, with 2.3.

*Needs:* 1.1, 2.1, 2.2, 2.3; rotation invariance of `stdGaussian`.

**Checks.**

- `A = diag(1, e⁻¹, …, e⁻⁵)`, `k = 1`, `l = 3`: the tail is `∑_{1 ≤ i ≤ 5} e^{−2i} = 0.15651`,
  so the Frobenius bound is `0.31302`; for the `1 × 3` matrix `Γ`, `‖Γ†‖ = 1/‖g‖` with `g`
  standard in `ℝ³` and `E ‖Γ†‖ = √(2/π) = 0.79788`, so the spectral bound is
  `2e⁻¹ + 0.79788 · √0.15651 = 1.0515`, and `1.1314` with the bound of 2.3 in place of
  `E ‖Γ†‖`. Monte Carlo with 20000 test matrices gives `E ‖A − P A‖_F² ≈ 0.029` and
  `E ‖A − P A‖ ≈ 0.140`.
- `A` of rank at most `k`: both right sides vanish, and indeed `P A = A` almost surely.
- `k = 0`: `Γ` is `0 × l`, `Γ† = 0`, and the spectral bound is `E ‖A − P A‖ ≤ ‖A‖`.

## Layer 3: Gaussian widths and Gaussian embeddings

### 3.1 Gaussian widths

- `gaussianWidth K` is `E sup_{u ∈ K} ⟪g, u⟫` for `g` standard Gaussian in `ℝⁿ` [MT, §8.4,
  pp. 448–449; FR, (9.26), p. 285]. It is the expression written inline in
  GaussianComparisonInequalities 5.2 (`gaussianWidth_def`).
- **Chi means** (`integral_norm_stdGaussian_mem_Ioo`): for `k ≥ 1`, the chi mean a(k) satisfies
  `√(k − 1) < a(k) < √k` [MT, (8.3), p. 449]. Route: Tau Ceti's
  `TauCeti.Probability.stdGaussian_map_norm` and `TauCeti.Probability.integral_id_chiMeasure` give
  a(k) = √2 Γ((k + 1)/2)/Γ(k/2); the upper bound is Jensen's inequality, strict because `‖g‖` is
  not constant; log-convexity of `Γ` gives a(k) ≥ k/√(k + 1) [FR, Proposition 8.1(b), (8.1),
  p. 202], and `k²/(k + 1) > k − 1`. Hence also a(k) ≥ √k − 1.
- **Subspaces** (`gaussianWidth_inter_sphere`): the width of the unit sphere of a subspace of
  dimension `k ≥ 1` is a(k) [MT, (8.3), p. 449]. Route: `sup_{u ∈ L ∩ S} ⟪g, u⟫` is the
  norm of the orthogonal projection of `g` to `L`, a standard Gaussian vector of `L`.
- **Finite sets** (`gaussianWidth_le_sqrt_two_log_card`): a nonempty finite set in the unit ball
  has width at most `√(2 log #K)` [FR, Proposition 8.1(c), (8.2), p. 202; MT, §8.6, p. 451].
  Route: each `⟪g, u⟫` is sub-Gaussian with variance proxy `‖u‖² ≤ 1`, and
  [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) §3.3
  bounds the mean maximum of `N` sub-Gaussian variables, independent or not, by `√(2 c log N)`.

*Needs:* GaussianComparisonInequalities §5.2 (the inline width); Tau Ceti
`TauCeti.Probability.stdGaussian_map_norm`, `TauCeti.Probability.integral_id_chiMeasure`;
MathematicalStatisticsAsymptotic §3.3; log-convexity of the Gamma function.

**Checks.**

- a(1) = √(2/π) = 0.79788 ∈ (0, 1), a(2) = √(π/2) = 1.25331 ∈ (1, 1.41421),
  a(10) = 3.08433 ∈ (3, 3.16228), a(100) = 9.97503 ∈ (9.94987, 10).
- Negative control for the lower bound: `√(k − 1)` cannot be replaced by `√k`, since
  a(k) < √k for every `k` (a(1) = 0.798 < 1, a(100) = 9.97503 < 10).
- A singleton has width `0 = √(2 log 1)`. The standard basis `e₀, …, e₇` of `ℝ⁸` has width
  `E max(g₀, …, g₇) = 1.42360` (by quadrature) against `√(2 log 8) = 2.03933`.
- Negative control for the unit-ball hypothesis: `{2u}` and `{−2u}` together have width
  `2 E |⟪g, u⟫| = 1.596` for a unit `u`, above `√(2 log 2) = 1.177`.

### 3.2 Gaussian concentration above the mean

- **One-sided Gaussian concentration** (`stdGaussian_add_le_le_exp`): for an `L`-Lipschitz
  function `f` on a finite-dimensional real inner product space, `L > 0` and `t ≥ 0`,
  `P(f ≥ E f + t) ≤ exp(−t²/(2L²))` under the standard Gaussian measure [FR, Theorem 8.40,
  p. 246]. Route: Herbst's argument of [RandomMatrices](../RandomMatrices/README.md) §2.2 under
  the Gaussian logarithmic Sobolev inequality with constant `1` bounds
  `E e^{λ(f − E f)} ≤ e^{λ² L²/2}`; Chernoff's bound at `λ = t/L²` finishes. RandomMatrices §2.2
  records the two-sided consequence with the factor `2`; the one-sided form is the one Gordon's
  tails need. GaussianIsoperimetryAndClusters §8.4 has the form about a median. The hypothesis
  `L > 0` keeps the exponent genuine: at `L = 0` the Lean expression `−t²/(2L²)` is the junk
  value `0`.

*Needs:* RandomMatrices §2.2; Mathlib `stdGaussian`, `LipschitzWith`.

**Checks.**

- `f(x) = x₀`: `P(f ≥ t) = 1 − Φ(t)`, `0.0228 ≤ 0.1353` at `t = 2`.
- The smallest singular value of a `5 × 3` Gaussian matrix, `1`-Lipschitz in the Frobenius norm:
  `P(f ≥ E f + 1) = 0.0135 ≤ e^{−1/2} = 0.6065` (100000 samples).
- Negative control for the norm: `f(x) = x₀ + x₁ + x₂ + x₃` on `ℝ⁴` is `1`-Lipschitz for the
  `ℓ¹` norm but `2`-Lipschitz for the Euclidean norm; read with `L = 1`, the bound would give
  `P(f ≥ 2) ≤ e^{−2} = 0.1353`, while `P(f ≥ 2) = 1 − Φ(1) = 0.1587`. The statement is on an
  inner product space, so the Lipschitz constant is Euclidean.

### 3.3 Expected restricted singular values

- GaussianComparisonInequalities 5.2 supplies Gordon's inequality in expectation: for nonempty
  `K` in the unit sphere and a standard Gaussian `d × n` matrix `G`,
  `E ‖h‖ − w(K) ≤ E inf_{u ∈ K} ‖G u‖`, with `h` standard Gaussian in `ℝᵈ`.
- **The upper comparison** (`integral_iSup_norm_toMatrix_le`):
  `E sup_{u ∈ K} ‖G u‖ ≤ E ‖h‖ + w(K)` [FR, Lemma 8.25, p. 228; MT, p. 449, in the sketch of
  proof of Theorem 8.4]. Route: `‖G u‖ = sup_{‖v‖ = 1} ⟪v, G u⟫`; compare the process
  `X_{u,v} = ⟪v, G u⟫` with `Y_{u,v} = ⟪h, v⟫ + ⟪g, u⟫` by the Sudakov–Fernique inequality of
  GaussianComparisonInequalities 2.2 on finite subsets, then pass to the supremum by monotone
  convergence.

*Needs:* 3.1; GaussianComparisonInequalities §2.2 and §5.2.

**Checks.**

- `d = 20`, `K = {e₀, …, e₇}` in `ℝ⁸`: the `‖G eᵢ‖` are independent with the chi law of `20`
  degrees of freedom, so by quadrature `E sup ‖G u‖ = 5.4426 ≤ a(20) + w(K) = 5.8402` and
  `E inf ‖G u‖ = 3.4444 ≥ a(20) − w(K) = 2.9930`, with a(20) = 4.41661 and w(K) = 1.42360.
- `K` a single unit vector: `G u` is standard Gaussian in `ℝᵈ`, the width is `0`, and both
  comparisons are equalities.

### 3.4 Gordon's tail bounds

- **The lower tail** (`gordon_tail_lower`): for `Γ = d^{−1/2} G` with `d ≥ 1`, nonempty `K` in
  the unit sphere and `t > 0`, `P(inf_{u ∈ K} ‖Γ u‖ ≤ 1 − (w(K) + 1)/√d − t) ≤ e^{−d t²/2}`
  [MT, Theorem 8.4, p. 449; FR, Theorem 9.21, p. 285]. Route: GaussianComparisonInequalities 5.2
  and a(d) ≥ √d − 1 (3.1) bound the mean of the infimum of `‖G u‖` over `K` below by
  `√d − 1 − w(K)`; the map from `G` to that infimum is `1`-Lipschitz for the Frobenius norm,
  which is the Euclidean norm of `EuclideanSpace ℝ (Fin d × Fin n)`; apply 3.2 to its negative,
  and rescale by `√d`.
- **The upper tail** (`gordon_tail_upper`):
  `P(sup_{u ∈ K} ‖Γ u‖ ≥ 1 + w(K)/√d + t) ≤ e^{−d t²/2}` [MT, Theorem 8.4, p. 449]. Route: 3.3,
  a(d) < √d and 3.2.

*Needs:* 3.1, 3.2, 3.3; GaussianComparisonInequalities §5.2.

**Checks.**

- `d = 20`, `K = {e₀, …, e₇}` in `ℝ⁸`, `w(K) = 1.42360`, computed from the chi law of `20`
  degrees of freedom: at `t = 0.1` the thresholds are `0.3581` and `1.4183`, the lower tail has
  probability `8.3 · 10⁻⁶` and the upper `0.0367`, against the bound `e^{−0.1} = 0.905`; at
  `t = 0.3`, `1.7 · 10⁻¹²` and `8.0 · 10⁻⁴` against `0.407`.
- `K` the unit sphere of `ℝⁿ`: the bounds are those of the extreme singular values of `Γ`,
  `1 − (a(n) + 1)/√d` and `1 + a(n)/√d`, against the Bai–Yin limits `1 ∓ √(n/d)` [MT, Remark 8.5,
  p. 450].

### 3.5 Subspace embeddings and the Johnson–Lindenstrauss embedding

- **Gaussian subspace embedding** (`isSubspaceEmbedding_gaussian`): for a subspace `V` of `ℝⁿ` of
  dimension `k`, `t > 0` and `a = 1 − (1 + √k)/√d − t`, `Γ = d^{−1/2} G` fails to be an
  `ε`-subspace embedding for `V` in the sense of
  [RandomProjectionsAndSketching](../RandomProjectionsAndSketching/README.md) §5.1
  (`IsSubspaceEmbedding`), with `ε = max((1 + √k/√d + t)² − 1, 1 − a²)`, with probability at
  most `2 e^{−d t²/2}` [MT, §8.7, (8.5), p. 452, and the tail bounds on p. 453]. Route: 3.4 for
  the unit sphere of `V`, whose width is below `√k` by 3.1; on the complement of both tails,
  `a ‖y‖ ≤ ‖Γ y‖ ≤ (1 + √k/√d + t) ‖y‖` on `V`, which gives both inequalities when `a ≥ 0`. If
  `a < 0` and `k ≥ 1`, then `√k/√d + t` exceeds both `1/√d` and `1 − 1/√d`, hence `1/2`, so
  `(1 + √k/√d + t)² > 2`, `1 − ε < 0` and only the upper tail matters; `k = 0` is trivial.
- With this embedding, the sketch-and-solve bound of RandomProjectionsAndSketching §5.2 applies
  to `Γ` and the span of the columns of a least-squares matrix and the right side.
- **The Johnson–Lindenstrauss embedding** (`stdGaussian_bad_pair_le`): for `N` points of `ℝⁿ`,
  `M = N(N − 1)/2`, `t > 0` and `(1 + √(2 log M))/√d + t ≤ ε`, the probability that `Γ` distorts
  some distance `‖aᵢ − aⱼ‖` by a factor outside `[1 − ε, 1 + ε]` is at most `2 e^{−d t²/2}`
  [MT, §8.6, pp. 450–451]. Route: the normalized differences of distinct points form a set of
  at most `M` unit vectors, of width at most `√(2 log M)` by 3.1; apply 3.4 to it.

*Needs:* 3.1, 3.4; RandomProjectionsAndSketching §5.1 (`IsSubspaceEmbedding`) and §5.2.

**Checks.**

- `k = 3`, `n = 10`, `d = 400`, `t = 0.1`: `a = 0.7634`, `ε = 0.4172`, failure frequency `0` in
  4000 samples against the bound `0.2707`.
- Negative control for `t > 0`: with `k = 3`, `d = 400` and `t = −0.1` the formula gives
  `ε = 0.0719`, and `Γ` fails to be a `0.0719`-subspace embedding of `ℝ³` in `95%` of 4000
  samples, against the bound `0.2707`.
- `N = 1000`, `ε = 1/2`, `t = 1/4`: `√(2 log M) = 5.123`, so `d = 600` suffices, with failure
  probability at most `1.4 · 10⁻⁸`. RandomProjectionsAndSketching §1.3, for squared distances
  and its own constant, asks `k ≥ 331.6`; the two statements are not comparable term by term,
  because one controls distances and the other squared distances.
- `N = 2`: `M = 1`, the width of a single unit vector is `0`, and the condition reads
  `1/√d + t ≤ ε`.

## Layer 4: tensor rank, border rank and non-closedness

### 4.1 Tensors of bounded rank

- `IsRankLE r T`: `T` is a sum of at most `r` products, `T(x) = ∑_{i < r} ∏_p A_p(x_p, i)`
  [HT, Definition 3.32, p. 62; Lim, (3.41), p. 619]. Zero columns pad a shorter sum.
- **Rank sets** (`isRankLE_iff_tensorRank_le`): with at least one party, `IsRankLE r T` holds
  exactly when AsymptoticSpectra's `tensorRank` of the `CoordTensor` with format `n` and array
  `T` is at most `r` (AsymptoticSpectra §3.1). Route: the set defining `tensorRank` is
  nonempty (the standard basis gives `∏_p n_p` terms) and upward closed by padding.

*Needs:* AsymptoticSpectra §3.1 (`CoordTensor`, `tensorRank`).

**Checks.**

- Negative control for the party hypothesis: with no party, an array is a scalar `c`, and
  `IsRankLE r c` says `c = r`; over `ℝ`, `c = 1/2` is of no rank while `tensorRank` is
  `sInf ∅ = 0`.
- Two parties: `IsRankLE r` is the set of matrices of rank at most `r`.

### 4.2 The tensor of rank three and border rank two

- `wTensorOf a b` is `∑_q ⊗_p (b_p if p = q, else a_p)`, for three parties
  `b₀ ⊗ a₁ ⊗ a₂ + a₀ ⊗ b₁ ⊗ a₂ + a₀ ⊗ a₁ ⊗ b₂` [HT, Lemma 3.42, p. 67; Lim, (3.43), p. 620].
- `topBorderRank T` is the least `r` with `T` in the closure of the tensors of rank at most `r`
  [HT, Definition 9.12, p. 255; Lim, (3.42), p. 619].
- **Rank three** (`tensorRank_wTensorOf`): over every field, if `a_p, b_p` are linearly
  independent at each of the three parties, the tensor has tensor rank `3` [HT, Lemma 3.42,
  p. 67]. Route: choose matrices sending `a_p, b_p` to the first two standard basis vectors, and
  at the third party exchange the two; the tensor restricts to BilinearComplexityAndBorderRank's
  tensor `W` of §2.3 (coordinate `1` where `i + j = l`), of tensor rank `3` over every field, and
  conversely; tensor rank is monotone under restriction (AsymptoticSpectra
  §3.1).
- **Border rank two** (`topBorderRank_wTensorOf`): over `ℝ` or `ℂ` the same tensor has
  topological border rank `2`, lies in the closure of the tensors of rank at most `2`, and is
  not of rank at most `2` [HT, (9.10), p. 254, and Lemma 9.11, p. 255; Lim, (3.43), p. 620].
  Route: `n (⊗_p (a_p + b_p/n)) − n (⊗_p a_p)` has rank at most `2` and differs from the tensor
  by `O(1/n)`; rank at most one is excluded because that set is closed (4.4) and the tensor's
  flattenings have rank `2`; rank two is excluded by `tensorRank_wTensorOf`.
- Hence the tensor has no best approximation of rank at most `2`: the infimum of the distances
  is `0` and is not attained.

*Needs:* 4.1, 4.4; BilinearComplexityAndBorderRank §2.3; AsymptoticSpectra §3.1 (restriction).

**Checks.**

- `a = e₀`, `b = e₁` in `(𝕜²)^{⊗3}`: `vₙ − W = (1/n)(b⊗b⊗a + b⊗a⊗b + a⊗b⊗b) + (1/n²) b⊗b⊗b`,
  of sup norm `1/n` and Frobenius norm `√(3/n² + 1/n⁴)` (`0.1735` at `n = 10`), while the two
  terms of `vₙ` have Frobenius norms growing like `n` [HT, Remark 9.14, p. 256].
- Over the field with two elements, exhaustive search over all sums of products in
  `(𝔽₂³)^{⊗3}` confirms that `W` is a sum of three products and not of two.
- Negative control for linear independence: with `b = a`, the tensor is `3 a₀⊗a₁⊗a₂`, of
  rank one.

### 4.3 Algebraic and topological border rank

- BilinearComplexityAndBorderRank §2.1 owns `IsBorderDecomp` and `borderRank`: approximate
  decompositions by factor matrices over `𝕜[X]` and the least number of terms of one.
- **Comparison** (`topBorderRank_le_borderRank`): with at least one party, the topological border
  rank is at most the algebraic border rank. Route (an adaptation; [Lim, p. 619] describes the
  algebraic definition as an alternative to the limit (3.42)): from an
  approximate decomposition of degree `h` with `r` terms, evaluate the polynomial factors at
  `ε = 1/n` and divide the factor of one party by `εʰ`; the resulting tensors of rank at most
  `r` converge to `T`. BilinearComplexityAndBorderRank §2.1 supplies that its border rank is
  attained by some approximate decomposition when there is a party.

*Needs:* 4.1, 4.2; BilinearComplexityAndBorderRank §2.1 (the border rank is attained).

**Checks.**

- For `W`, both border ranks are `2` (BilinearComplexityAndBorderRank §2.3 for the algebraic one,
  4.2 for the topological one).
- A decomposition of degree `0` is an exact one, so both border ranks are at most the tensor rank.

### 4.4 Closedness

- **Rank one is closed** (`isClosed_setOf_isRankLE_one`): the tensors of rank at most one form a
  closed set [HT, Lemma 9.11, p. 255]. Route: normalize the factors of a convergent sequence of
  products to equal norms, extract convergent subsequences by compactness, and treat the limit
  `0` separately.
- **Rank `r ≥ 2` is not closed** (`not_isClosed_setOf_isRankLE`): with at least three parties
  and `2 ≤ r ≤ n_p` for every party, the tensors of rank at most `r` do not form a closed set
  [HT, Lemma 9.11, p. 255, which proves `r = 2` and refers the general case to De Silva and
  Lim]. Route, proved here for all `r`: on three parties take
  `v = W ⊕ ⊕_{2 ≤ i < r} eᵢ⊗eᵢ⊗eᵢ`, a limit of tensors of rank at most `r` by 4.2. If `v` had
  rank at most `r`, its slices, which span the `r`-dimensional space of matrices
  `[[α, β], [β, 0]] ⊕ diag(γ₂, …, γ_{r−1})`, would be spanned by `r` matrices of rank one lying in
  that space; but its rank-one elements have `β = 0` and lie in a subspace of dimension `r − 1`.
  Further parties carry the factor `e₀`.

*Needs:* 4.1, 4.2; compactness of closed bounded sets in finite dimension.

**Checks.**

- Negative control for three parties: with two parties, the matrices of rank at most `r` form a
  closed set, since rank is lower semicontinuous.
- `r = 3`, three parties of dimension `3`, over `𝔽₂`: exhaustive search confirms that
  `W ⊕ e₂⊗e₂⊗e₂` is a sum of four products and not of three, as the slice argument predicts.
- With no party, the tensors of rank at most one are the single scalar `1`, a closed set.

### 4.5 Stable limits

- **Stability** (`isRankLE_of_tendsto_of_bounded`): a limit of tensors with `r`-term
  representations whose factor entries are bounded uniformly has rank at most `r` [HT,
  Definition 9.15, p. 256, and Proposition 9.16, p. 257]. Route: the factors lie in a compact
  set; a convergent subsequence of factors represents the limit. Hackbusch's stability bound
  `∑ᵢ ∏_p ‖v_{i,p}‖ ≤ κ ‖v‖` gives such factors after balancing the norms within each term.

*Needs:* 4.1; sequential compactness of bounded sets in finite dimension.

**Checks.**

- The sequence `vₙ` of 4.2 has unbounded factors, as it must, since its limit has rank `3`.
- A constant sequence is stable, and the conclusion is the hypothesis.

## Layer 5: Tucker format and the higher-order SVD

### 5.1 The Tucker format

- `modeUnfold T j` is the matrix with rows indexed by mode `j` and columns by the other modes;
  `modeApply j M T` applies `M` along mode `j`; `kronApply P T` applies one matrix per mode
  [HT, §8.1, p. 218].
- `IsTuckerLE r T`: `T` has a core of size `r` and one factor matrix per mode [HT,
  Definition 8.1, p. 218, with Corollary 8.3, p. 219].
- **Tucker ranks are unfolding ranks** (`isTuckerLE_iff_rank_modeUnfold_le`): `T` is in the
  Tucker format `r` exactly when every mode-`j` unfolding has rank at most `r j` [HT,
  Remark 8.4, p. 219]. The rank of `modeUnfold T j` is the flattening rank at `{j}` of
  AsymptoticSpectra §3.2.
- **Closedness** (`isClosed_setOf_isTuckerLE`) [HT, Lemma 8.6, p. 219]. Route: by the previous
  headline, an intersection of sublevel sets of rank, which is lower semicontinuous.
- **Best approximation** (`exists_isMinOn_sqDist_isTuckerLE`): every tensor has a best
  approximation in the Tucker format [HT, Theorem 10.8, p. 290]. Route: the format is closed and
  contains `0`, and in finite dimension the distance to a nonempty closed set is attained.

*Needs:* AsymptoticSpectra §3.2 (flattening ranks, compared); lower semicontinuity of
`Matrix.rank`; attainment of the distance to a closed set in finite dimension.

**Checks.**

- `d = 2`: the Tucker format `(k, k)` is the set of matrices of rank at most `k`.
- With no mode (`d = 0`), every scalar is in the Tucker format, and the right side of the
  characterization is empty.
- `T = e₀ ⊗ e₀ ⊗ e₀ + e₁ ⊗ e₁ ⊗ e₁` has all unfolding ranks `2`, is in the Tucker format
  `(2, 2, 2)` and not in `(1, 2, 2)`.

### 5.2 The higher-order SVD

- **Simultaneous orthogonal projections** (`sqDist_kronApply_le`): for frames `U j` with
  orthonormal columns and `P j = U j (U j)ᴴ`, `‖T − (⊗ⱼ P j) T‖² ≤ ∑ⱼ ‖T − P j ×ⱼ T‖²` [HT,
  Lemma 4.123(b), p. 141]. Route: telescope
  `I − P₀ ⋯ P_{d−1} = ∑ⱼ P₀ ⋯ P_{j−1} (I − Pⱼ)`; consecutive terms are orthogonal and the
  projections are contractions.
- **HOSVD error** (`hosvd_projection_error_sq_le`): if `U j` consists of orthonormal leading
  left singular vectors of `modeUnfold T j`, written as the eigen-equation
  `T_(j) T_(j)ᴴ U j = U j diag(σᵢ(T_(j))²)`, then
  `‖T − (⊗ⱼ P j) T‖² ≤ ∑ⱼ ∑_{i ≥ r j} σᵢ(T_(j))²` [HT, Theorem 10.3, (10.4b), p. 283]. Route:
  the previous headline, and `‖T − P j ×ⱼ T‖²` is the Frobenius error of the orthogonal
  projection of `T_(j)` onto its leading singular subspace, the tail by Layer 1. The source's
  hypothesis `r j ≤ rank_j(T)` is not needed.

*Needs:* 1.1, 1.3, 5.1.

**Checks.**

- 300 random tensors of order `3` with dimensions `2`–`4`, random `r`: the bound holds up to
  rounding (largest excess `5.7 · 10⁻¹⁴`).
- `d = 2`, `r = (k, k)`: the HOSVD projection is `truncSVD T k`, with error the tail, and the
  bound is twice the tail.

### 5.3 Quasi-optimality

- **Quasi-optimality of the HOSVD** (`hosvd_quasi_optimal`): under the hypotheses of 5.2, the
  squared error is at most the number of modes with `r j` below the unfolding rank times
  `‖T − w‖²` for every `w` in the Tucker format `r`, so the HOSVD is within the factor
  `√#{j : r j < rank_j(T)}` of the best approximation [HT, Corollary 10.4, p. 284]. Route: a mode
  with `r j ≥ rank_j(T)` has tail `0`; for the others, the unfolding of `w` has rank at most
  `r j` by 5.1, so the tail is at most `‖T − w‖²` by Eckart–Young in the Frobenius norm (1.3).

*Needs:* 1.3, 5.1, 5.2.

**Checks.**

- All `r j` at least the unfolding ranks: the count is `0`, and the HOSVD is exact.
- 300 random tensors: each tail is at most the error of the best Tucker approximation found by
  alternating least squares from 30 starts (largest ratio `1.0000`).

## Layer 6: the tensor-train format

### 6.1 Tensor trains and cut ranks

- `cutUnfold T k` is the matrix with rows indexed by modes `0, …, k − 1` and columns by the
  others; `cutApply T k M` applies `M` on its row side.
- `HasTensorTrain T r`: `T(i) = ∑_b ∏ⱼ Gⱼ(b_j, b_{j+1}, i_j)` with bond dimensions `r`, trivial
  at both ends [HT, Definition 12.1, (12.4), p. 373].
- **TT ranks are cut ranks** (`hasTensorTrain_iff_cutRank_le`): for `d ≥ 1` and trivial end
  ranks, `T` has a tensor train with bond dimensions `r` exactly when every inner cut unfolding
  `k` has rank at most `r k` [HT, Theorem 12.2, p. 373]. Route: summing a train over all bonds
  but the bond at `k` factors `cutUnfold T k` through `𝕜^{r k}`; conversely, factor the cut
  unfoldings successively, the TT-SVD construction. Unlike the source, `T = 0` is allowed.
- **Closedness** (`isClosed_setOf_hasTensorTrain`). Route: the previous headline and lower
  semicontinuity of rank; for `d = 0` or nontrivial end ranks the set is a point or empty.
- **Best approximation** (`exists_isMinOn_sqDist_hasTensorTrain`): for `d ≥ 1` and trivial end
  ranks every tensor has a best approximation in the format, which contains `0`.

*Needs:* lower semicontinuity of `Matrix.rank`; rank factorization of matrices; attainment of
the distance to a closed set in finite dimension.

**Checks.**

- `d = 2`: a tensor train with bond `(1, r, 1)` is a matrix of rank at most `r`.
- A sum of two products of order `4` has all cut ranks `2`, and the TT-SVD returns bonds
  `(1, 2, 2, 2, 1)`.
- Negative control for `d ≥ 1`: with `d = 0`, a tensor train is the scalar `1`, while the cut
  condition is empty, so the characterization fails at every other scalar.

### 6.2 TT-SVD truncation

- `ttTruncate U T` applies the projections `U k (U k)ᴴ` at the inner cuts in the order
  `k = d − 1, …, 1`, the cut `d − 1` first [HT, §12.2.7, p. 379, and (11.60), p. 357].
- **The truncation is a tensor train** (`hasTensorTrain_ttTruncate`): for any frames, `d ≥ 1` and
  trivial end ranks, `ttTruncate U T` has a tensor train with bond dimensions `r`. Route: the
  projection at cut `k` bounds the rank of cut `k` by `r k`; the projections applied after it act
  on row modes of cut `k` only, by left multiplication, which does not raise its rank; then 6.1.
- **The TT-SVD error** (`sqDist_ttTruncate_le`): with frames of leading left singular vectors of
  the cut unfoldings of `T` itself, `‖T − ttTruncate U T‖² ≤ ∑_{0 < k < d} ∑_{i ≥ r k} σᵢ(T_[k])²`
  [HT, Theorem 11.58, (11.61), p. 357, with §12.2.7, p. 379]. Route: writing Qₖ for the
  projections, `I − Q₁ ⋯ Q_{d−1} = (I − Q₁) + Q₁ (I − Q₂ ⋯ Q_{d−1})` with orthogonal terms;
  induction and Layer 1 for each `‖(I − Q_k) T‖²`.

*Needs:* 1.1, 1.3, 6.1.

**Checks.**

- Negative control for the order: for a random `3 × 3 × 3 × 3` tensor and `r = (1, 2, 3, 2, 1)`,
  the order `d − 1, …, 1` gives cut ranks `(2, 3, 2)`, while the order `1, …, d − 1` gives
  `(3, 6, 2)`, outside the format.
- 500 random tensors of orders `2`–`5`: no violation of the error bound or of the cut ranks.
- `d = 2`: `ttTruncate` is `truncSVD` and the bound is the tail of Layer 1.

### 6.3 Quasi-optimality

- **Quasi-optimality of the TT-SVD** (`ttTruncate_quasi_optimal`): for `d ≥ 1`, the squared error
  of the TT-SVD is at most `d − 1` times `‖T − w‖²` for every `w` with a tensor train of bond
  dimensions `r`, the factor `√(d − 1)` of [HT, §12.2.7, p. 379]. Route: as in 5.3, each of the
  `d − 1` tails is at most `‖T − w‖²` because the cut unfoldings of `w` have rank at most `r k`.

*Needs:* 1.3, 6.1, 6.2.

**Checks.**

- `d = 2`: the factor is `1`, and the statement is Eckart–Young in the Frobenius norm.
- Negative control for `d ≥ 1`: with `d = 0` the right side is `−‖T − 1‖²`, negative unless
  `T = 1`.

## Layer 7: separable approximation of asymptotically smooth kernels

### 7.1 Asymptotic smoothness and Taylor kernels

- `IsAsymptoticallySmooth κ X Y C γ ρ s`: `κ` is smooth off the diagonal and
  `|D^p_{t,x} κ(x, y)| ≤ C p! p^ρ γ^p ‖x − y‖^{−p−s}` for `p ≥ 1`, unit `t`, `x ∈ X`, `y ∈ Y`,
  `x ≠ y` [HM, (4.17e), p. 65; the multi-index form is Definition 4.14, (4.17a,b), p. 64].
- `taylorKernel κ x₀ q` is the Taylor polynomial of degree `q − 1` of `κ(·, y)` about `x₀`
  [HM, (4.10)–(4.11), p. 60].
- **Separability** (`taylorKernel_separable`): the Taylor kernel is a sum of
  `C(q − 1 + m, m)` products `φᵢ(x) ψᵢ(y)` [HM, (4.12), p. 60]. Route: expand the symmetric
  multilinear maps `D^p κ(x₀, y)` on `x − x₀` in coordinates; the monomials of degree below `q`
  in `m` variables are `C(q − 1 + m, m)` in number.

*Needs:* Mathlib `iteratedFDeriv`, `ContDiffOn`, and the expansion of a continuous multilinear
map in coordinates.

**Checks.**

- `log ‖x − y‖` in `ℝ²` satisfies the hypothesis with `C = 1`, `γ = 1`, `ρ = −1`, `s = 0`, since
  its `p`th directional derivative is bounded by `(p − 1)! ‖x − y‖^{−p}` [HM, Example 4.16,
  p. 65]; `‖x − y‖⁻¹` in `ℝ³` with `C = 1`, `γ = 1`, `ρ = 0`, `s = 1`, by the Legendre expansion.
- `m = 2`, `q = 4`: `C(5, 2) = 10` monomials of degree at most `3` in two variables.

### 7.2 The Taylor error

- **Taylor error bound** (`abs_sub_taylorKernel_le`): for an asymptotically smooth `κ`, a convex
  `X ∋ x₀` within distance `R` of `x₀` and at distance at least `δ > 0` from `Y`, `q ≥ 1` and
  `q + s ≥ 0`, `|κ − κ_q| ≤ C q^ρ (γ R/δ)^q δ^{−s}` on `X × Y` [HM, Theorem 4.17 and (4.18),
  p. 66, and Lemma 4.18, p. 67]. Route: Lagrange's remainder along the segment from `x₀` to `x`,
  which stays in `X`, with the directional bound at `p = q`, `‖x − x₀‖ ≤ R` and
  `‖ξ − y‖^{−q−s} ≤ δ^{−q−s}` because `q + s ≥ 0`.
- If `γ R/δ ≤ η < 1`, the error with `r = C(q − 1 + m, m)` terms is at most `c₁ exp(−c₂ r^{1/m})`
  [HM, (5.8), p. 88, and Theorem 5.8, p. 89]. Route: `r ≤ (q + m)^m/m!`, so `q ≥ c r^{1/m}`.

*Needs:* 7.1; Taylor's theorem with Lagrange remainder along a segment.

**Checks.**

- `log ‖x − y‖` in `ℝ²`, `X` the disc of radius `R = 1/2` about `x₀ = 0`, `Y` at distance at
  least `δ = 1` (4000 random pairs): worst errors `3.37 · 10⁻³ ≤ 1.56 · 10⁻²` at `q = 4` and
  `1.93 · 10⁻⁵ ≤ 4.88 · 10⁻⁴` at `q = 8`.
- `‖x − y‖⁻¹` in `ℝ³`, same geometry: `8.21 · 10⁻³ ≤ 6.25 · 10⁻²` at `q = 4`.
- Negative control for `q + s ≥ 0`: `κ(x, y) = (y − x)³` on `X = [−1, 1]`, `Y = [2, 10]` is
  asymptotically smooth with `C = 3`, `γ = 1`, `ρ = 0`, `s = −3`; at `q = 1`, `x₀ = 0`, `R = 1`,
  `δ = 1` the bound would be `3`, while `|κ(1, 10) − κ(0, 10)| = 271`.

### 7.3 Galerkin blocks on separated clusters

- **Low-rank Galerkin blocks** (`galerkin_block_approx`): for integrable test functions `φᵢ`
  supported in a compact convex `X` and `ψⱼ` supported in a compact `Y`, under the hypotheses of
  7.2, the block `∫∫ φᵢ(x) κ_q(x, y) ψⱼ(y)` has rank at most `C(q − 1 + m, m)`, and its entries
  differ from those of `∫∫ φᵢ κ ψⱼ` by at most the bound of 7.2 times `‖φᵢ‖₁ ‖ψⱼ‖₁` [HM,
  (5.9), p. 88, and Theorem 5.8, p. 89, there with the factor `(μ(X) μ(Y))^{1/2}` for the
  operator norm of the block]. Route: 7.1 splits every entry as `∑ₖ (∫ φᵢ fₖ)(∫ gₖ ψⱼ)`; the
  coefficient functions are continuous on the compact `Y`, so every integral exists; 7.2 bounds
  the difference pointwise on `X × Y`.

*Needs:* 7.1, 7.2; Bochner integrals of bounded functions on compact sets.

**Checks.**

- One test function on each side, `φ = 1_X`, `ψ = 1_Y`: the block is a single entry, of rank at
  most one, and the bound reads `|∫∫ (κ − κ_q)| ≤ B |X| |Y|`.
- The test functions must be supported in the clusters: for `log |x − y|` and test functions
  whose supports overlap, the Taylor kernel about `x₀` has a singularity at `y = x₀` inside the
  support of `ψ`, and no bound of the form of 7.2 holds.

### 7.4 The logarithmic kernel in one dimension

- **The logarithmic kernel** (`abs_log_sub_taylor_le`): for `a < b < c`, `x ∈ [a, b]`, `y ≥ c`,
  `x₀ = (a + b)/2`, `η = (b − a)/(c − b)` and `r ≥ 1`, the `r`-term Taylor expansion of
  `log(y − x)` about `x₀` has error at most `(2 + η)/(2r) · (η/(2 + η))^r` [HM, Remark 4.13,
  (4.16a,b), p. 63, proof p. 64]. Route: the remainder is `∑_{l ≥ r} q^l/l` with
  `q = (x − x₀)/(y − x₀)`, `|q| ≤ η/(2 + η)`, bounded by `q^r/(r (1 − q))`.

*Needs:* the power series of `Real.log` about `1`.

**Checks.**

- `[a, b] = [0, 1]`, `y ≥ 2` (`η = 1`), `r = 12`: worst error on a grid `2.268 · 10⁻⁷`, bound
  `2.352 · 10⁻⁷`, nearly sharp at `x = b`, `y = c`.
- `η = 4` (`c = 1.25`): `1.692 · 10⁻³ ≤ 1.927 · 10⁻³`; `η = 1/4`: `3.288 · 10⁻¹³ ≤ 3.319 · 10⁻¹³`.
- `r = 1`: the bound is `η/2`, and the worst error is `log(1 + η/2)`.

## Downstream consumers

Roadmaps on reduced-order models and proper orthogonal decomposition consume Layer 1 (the
truncated singular value expansion and its optimality). Roadmaps on compressed sensing and on
randomized least squares consume Layer 3 (Gaussian concentration above the mean, Gordon's tails
and Gaussian subspace embeddings).
Roadmaps on hierarchical matrices and fast integral-equation solvers consume Layer 7.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Best low-rank approximation.** The truncated singular value expansion with its rank and
   errors, Eckart–Young in the spectral norm for matrices, and the Frobenius form.
2. **The range finder.** The deterministic bounds in both norms, Chevet's inequality, the
   moments of `Γ†`, and the expected errors in both norms.
3. **Gaussian widths and embeddings.** Chi means, widths of subspaces and finite sets, one-sided
   Gaussian concentration, the upper comparison, Gordon's two tails, the subspace embedding and
   the Johnson–Lindenstrauss embedding.
4. **Tensor rank and border rank.** Rank sets, the tensor of rank three and topological border
   rank two, the comparison with algebraic border rank, closedness of rank one, non-closedness of
   rank `r ≥ 2`, and stable limits.
5. **Tucker and HOSVD.** Tucker ranks as unfolding ranks, closedness, best approximation, the
   projection lemma, the HOSVD error and its quasi-optimality.
6. **Tensor trains.** TT ranks as cut ranks, closedness, best approximation, the TT-SVD format,
   error and quasi-optimality.
7. **Separable kernels.** Separability of the Taylor kernel, the Taylor error, Galerkin blocks
   and the logarithmic kernel.

Owned elsewhere and consumed:
- Tau Ceti owns the spectral-norm Eckart–Young theorem, the singular-value Hoffman–Wielandt
  inequality, the compact SVD and singular vectors, Moore–Penrose inverses, the chi law of the
  norm of a standard Gaussian vector and the inverse Wishart mean.
- RandomProjectionsAndSketching owns subspace embeddings (§5.1), sketch-and-solve (§5.2) and the
  Dasgupta–Gupta form of the Johnson–Lindenstrauss lemma for squared distances (§1.3); its scope
  leaves Gaussian subspace embeddings, the range finder and low-rank approximation to other
  roadmaps. The Johnson–Lindenstrauss embedding here is the width-based form for distances.
- GaussianComparisonInequalities owns the Sudakov–Fernique comparison (§2.2), Gordon's
  inequality in tail and expectation forms (§§3.1–3.2), the expected norm of a Gaussian matrix
  (§5.1) and the expected minimum restricted singular value (§5.2); this roadmap adds the
  Gaussian width as a definition, the upper comparison, and the tail bounds.
- BilinearComplexityAndBorderRank owns approximate decompositions and algebraic border rank
  (§2.1) and the rank of `W` (§2.3); AsymptoticSpectra owns tensor rank (§3.1) and flattening
  ranks (§3.2).
- MathematicalStatisticsAsymptotic §3.3 owns the sub-Gaussian maximal inequality; RandomMatrices
  §2.2 owns the Gaussian logarithmic Sobolev inequality and Herbst's argument;
  GaussianIsoperimetryAndClusters §8.4 owns concentration about a median; SpectralSteepestDescent
  §2.1 owns singular-value perturbation in unitarily invariant norms.
- MathematicalStatisticsHighDimensional leaves Gaussian comparison and Gaussian widths to other
  roadmaps; the widths are defined and bounded here.

The matrix conventions are those of MatrixFactorizationsAndSparseElimination (Conventions); no
result of it is consumed.

## Exact supplier contracts

### From Mathlib

- `LinearMap.singularValues`, `Matrix.toEuclideanLin`, the scoped instances
  `Matrix.Norms.L2Operator` and the Frobenius norm, `Submodule.starProjection`, `stdGaussian`,
  `iteratedFDeriv`, `ContDiffOn`, `Matrix.rank`, `closure`.

### From Tau Ceti

- `ContinuousLinearMap.singularValue_eq_linearMap_singularValues` (1.2).
- `Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq` (1.3).
- `LinearMap.leftSingularVector`, `LinearMap.rightSingularBasis`,
  `LinearMap.exists_orthonormal_eq_sum_singularValues_smul_rankOne` and
  `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero` (1.1).
- `LinearMap.moorePenroseInverse` (2.3).
- `TauCeti.Probability.integral_id_inverseWishartMeasure` (2.3).
- `TauCeti.Probability.stdGaussian_map_norm`, `TauCeti.Probability.integral_id_chiMeasure`
  (3.1).

### From [RandomProjectionsAndSketching](../RandomProjectionsAndSketching/README.md)

- §5.1 `IsSubspaceEmbedding`, copied verbatim (3.5); §5.2 sketch-and-solve, applied in prose
  (3.5); §1.3 compared in 3.5.

### From GaussianComparisonInequalities

- §2.2 the Sudakov–Fernique inequality for finite Gaussian vectors (2.2, 3.3).
- §5.1 the convention `toMatrix`, copied verbatim (Layers 2 and 3), and the expected norm of a
  Gaussian matrix, compared in 2.2.
- §5.2 Gordon's inequality in expectation for nonempty sets in the unit sphere (3.3, 3.4), whose
  inline Gaussian width is `gaussianWidth` (3.1).

### From BilinearComplexityAndBorderRank

- §2.1 `IsBorderDecomp` and `borderRank`, copied verbatim, with the attainment of the border
  rank by an approximate decomposition when there is a party (4.3).
- §2.3 the tensor rank `3` of `W` over every field (4.2), and its border rank `2` (a Check of 4.3).

### From [AsymptoticSpectra](../AsymptoticSpectra/README.md)

- §3.1 `CoordTensor` and `tensorRank`, copied verbatim, and monotonicity of tensor rank under
  restriction (4.1, 4.2); §3.2 flattening ranks, compared in 5.1.

### From [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md)

- §3.3 the maximal inequality for finitely many sub-Gaussian variables (3.1).

### From [RandomMatrices](../RandomMatrices/README.md)

- §2.2 the Gaussian logarithmic Sobolev inequality with constant `1` and Herbst's argument (3.2).

### From [SpectralSteepestDescent](../SpectralSteepestDescent/README.md)

- §2.1 singular-value perturbation in Ky Fan norms, for the unitarily invariant form of 1.3.

## Beyond this roadmap

- **Sharper range-finder constants.** The bound `E ‖Γ†‖ ≤ e √l/(l − k)` of Halko, Martinsson and
  Tropp needs the density of the smallest singular value of a rectangular Gaussian matrix; for
  large `l` it improves the bound of 2.3 (`0.860` against `1.026` at `(20, 40)`).
- **Powered range finders and Nyström approximation**, with the spectral gap of `(A Aᴴ)^q`, and
  structured random test matrices.
- **Hierarchical matrices**: cluster trees, admissible block partitions, storage and arithmetic
  cost, building on 7.3.
- **Hierarchical Tucker formats** on general dimension trees, of which the tensor train is the
  linear-tree case.
- **Generic ranks**: the set of tensors of rank `r` with nonempty interior in the real case
  (De Silva and Lim), and the Zariski closure as a third notion of border rank.
- **Algorithms with cost models**: alternating least squares for CP and Tucker, sequential
  TT-SVD with rounding, and their flop counts.

## Prior formalization

The lean-NASC project ([github.com/bjbraams/lean-NASC](https://github.com/bjbraams/lean-NASC),
commit 92a6dba) states, in `NASC/LowRankApproximation.lean`, the Frobenius Eckart–Young theorem
(1.3), a deterministic range-finder bound (2.1), a Gaussian Johnson–Lindenstrauss tail (3.5, as
NASC.gaussianMatrixLaw_exists_distorted_pair_le, with the Gaussian law of
`NASC/Support/GaussianMatrix.lean`), closedness of rank one and a tensor of border rank two that
is not of rank two (4.2, 4.4), the HOSVD error bound (5.2), the characterization of tensor trains
by cut ranks (6.1) and a separable Taylor approximation (7.2), all with `sorry`; it proves none of
them. Its proved declarations are definitions and the lemmas that unfold them. The names
`isLeast_rankApproximation_frobenius_sq`, `rangeFinder_error_le`, `modeUnfold`,
`hosvd_projection_error_sq_le`, `cutUnfold`, `HasTensorTrain` and
`hasTensorTrain_iff_cutRank_le` follow it; its tensor trains carry a scalar factor, so that for
`d = 0` every scalar is one, while `HasTensorTrain` here has none and the characterization
assumes `d ≥ 1`. Its modules are a cited source, not the specification.

Mathlib has singular values and the scoped matrix norms but no low-rank approximation theorem;
Tau Ceti has the spectral-norm Eckart–Young theorem and Hoffman–Wielandt (see the supplier
contracts). No Lean library known to us formalizes Gaussian widths, Gordon's tail bounds,
topological border rank, the higher-order SVD or tensor trains.

## References

The locators refer to these editions; page numbers are printed page numbers.

- [FR] S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing*,
  Birkhäuser, 2013.
- [HM] W. Hackbusch, *Hierarchical Matrices: Algorithms and Analysis*, Springer Series in
  Computational Mathematics 49, Springer, 2015.
- [HT] W. Hackbusch, *Tensor Spaces and Numerical Tensor Calculus*, Springer Series in
  Computational Mathematics 42, Springer, 2012.
- [Lim] L.-H. Lim, Tensors in computations, *Acta Numerica* 30 (2021), 555–764.
- [MT] P.-G. Martinsson and J. A. Tropp, Randomized numerical linear algebra: foundations and
  algorithms, *Acta Numerica* 29 (2020), 403–572.
- [TB] L. N. Trefethen and D. Bau III, *Numerical Linear Algebra*, SIAM, 1997.

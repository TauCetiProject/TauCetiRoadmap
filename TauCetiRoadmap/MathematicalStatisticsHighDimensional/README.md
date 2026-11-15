# Roadmap: high-dimensional statistics

**Summary.** This roadmap builds the finite-sample theory of estimation, testing and recovery when
the number of parameters is comparable to or larger than the number of observations:
- exact and stable sparse recovery: restricted nullspace, basis pursuit and the restricted
  isometry property, including the restricted isometry property of sub-Gaussian designs;
- the lasso: optimality conditions, the cone condition, slow and fast rates under compatibility
  and restricted eigenvalue conditions, orthogonal designs, support recovery under mutual
  incoherence, and debiased inference;
- penalized model selection in the Gaussian regression model, and Akaike's and Schwarz's
  criteria;
- minimax rates for sparse estimation in the Gaussian sequence model and in sparse regression;
- false discovery rate control by the Benjamini–Hochberg and Benjamini–Yekutieli procedures;
- low-rank and structured matrices: nuclear-norm trace regression, thresholded covariance
  estimation, neighbourhood selection and the graphical lasso;
- principal components: the Davis–Kahan bound for the leading eigenvector, the spiked
  sub-Gaussian ensemble, and the statistical reading of the Marchenko–Pastur, Bai–Yin and spiked
  covariance limits.

Every probabilistic theorem is split in two: a **deterministic theorem on an event** (the noise
event of the lasso, the restricted eigenvalue event of a random design, the max-norm event of a
sample covariance), and a **probability bound for the event**. The deterministic theorems are
convex analysis and linear algebra; the probability bounds rest on a small toolkit of
sub-Gaussian, chi-squared and net arguments (Layer 1) and on the matrix concentration owned by
[RandomMatrices](../RandomMatrices/README.md).

The material is the standard content of Wainwright, Giraud, Foucart–Rauhut, van de Geer and
Johnstone (see [References](#references)). Headlines that restate a source result cite a
theorem, definition, section or equation number with its printed page; corollaries and
adaptations carry a proof route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. Every headline whose carriers exist at the pins carries a Lean name; the bullets
without one are consumed results, marked as such, or facts about a single definition, as the
module docstring of `Suggested.lean` lists.

Suggested home: `TauCeti/Statistics/HighDimensional/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Probabilistic toolkit.** Gaussian variables are sub-Gaussian; tail and maximal inequalities
   for finitely many sub-Gaussian variables; sub-Gaussian random vectors; two-sided chi-squared
   tails; sub-exponential products and the entrywise and operator-norm concentration of sample
   covariances; entrywise domination and the Schur test for operator norms; trace duality,
   orthogonal additivity and the low-rank decomposition of the nuclear norm; nets of low-rank
   matrices; row sums of the inverse of a positive definite matrix; the binomial bound; and the
   sparse Varshamov–Gilbert packing.
2. **Sparse recovery.** The restricted nullspace property and its equivalence with exact recovery
   by basis pursuit; the restricted isometry route to it; the robust nullspace property and
   stable recovery under `δ₂ₛ < 4/√41`; and the restricted isometry property of designs with
   independent sub-Gaussian entries, and exact recovery from such designs.
3. **The lasso.** Existence, optimality conditions and uniqueness of the fit; the basic
   inequality and the cone condition; the slow rate; fast rates under the compatibility and
   restricted eigenvalue conditions; the probability of the noise event; restricted eigenvalues
   from the restricted isometry property and for random designs; orthogonal designs, soft
   thresholding and ridge; support recovery by the primal–dual witness; and debiased inference.
4. **Model selection.** The oracle inequality for penalized model selection over a countable
   family of linear models; the optimism identity behind Akaike's criterion, the overfitting of
   the Akaike selector and the consistency of the Schwarz (BIC) selector in nested models.
5. **Sparse minimax rates.** The risk of soft thresholding at a general threshold; the minimax
   rate `σ² s log(p/s)` in the Gaussian sequence model with the matching soft-threshold
   estimator and the universal threshold; and the minimax rate of sparse regression.
6. **Multiple testing.** False discovery proportion and rate, valid p-values, step-up
   procedures, positive regression dependence; false discovery rate control by
   Benjamini–Hochberg under independence and under positive regression dependence, exactness
   under independent uniform nulls, and the Benjamini–Yekutieli procedure under arbitrary
   dependence.
7. **Low-rank and structured matrices.** Nuclear-norm penalized trace regression; hard
   thresholding of a sample covariance; neighbourhood selection and the graphical lasso for
   Gaussian graphical models.
8. **Principal components.** Perturbation of the leading eigenvector; the leading sample
   eigenvector in the spiked sub-Gaussian ensemble; and the high-dimensional limits of sample
   eigenvalues and eigenvectors in the form statistics uses them: the translation to the
   conventions of RandomMatrices, the centring and scaling of the largest eigenvalue, and the
   inconsistency of the leading sample eigenvector in the spiked model.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- the vocabulary of
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md): the
  number of nonzero coordinates as `hammingNorm`, the restricted `ℓ¹` norm, the best `s`-sparse
  `ℓ¹` error and the restricted isometry property (9.3); the Benjamini–Hochberg count (9.3);
  the algebra of convergence in probability (8.3) and Slutsky's lemma (8.4);
- from MathematicalStatisticsNonparametric: the Kullback–Leibler divergence between isotropic
  Gaussian laws (1.3) and the minimax lower-bound toolkit of its Layer 2, Le Cam's two-point
  method (2.2), Fano's method (2.4) and Assouad's lemma (2.5) with their minimax forms (2.6).
  Layer 5 applies them to Gaussian location families; the sparse packing it needs (1.5) is not
  the Varshamov–Gilbert packing of the full hypercube owned there (2.3);
- the soft-threshold map, its one-coordinate risk and the two one-coordinate risk bounds, and
  the oracle inequality at the universal threshold, which belong to
  MathematicalStatisticsNonparametric (6.4). 5.1 owns the risk bounds at a general threshold;
- random matrix theory, from [RandomMatrices](../RandomMatrices/README.md): the sub-exponential
  definition and Bernstein's inequality for sub-exponential sums (§2.1), norms and singular
  values of matrices with independent sub-Gaussian entries or rows (§2.4), the sample covariance
  (§4.1), the Marchenko–Pastur law (§4.4), the Bai–Yin limit of the largest eigenvalue (§4.5),
  and the spiked sample covariance limits (§7.3);
- the residual Davis–Kahan `sin Θ` theorem, owned by
  [OperatorTheory/SpectralSubspacePerturbation](../OperatorTheory/SpectralSubspacePerturbation/README.md)
  (SSP-C17) and proved in Tau Ceti; 8.1 applies it to the leading eigenvector.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with Mathlib's `ProbabilityTheory`
  and `MeasureTheory` opened throughout. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.MathematicalStatisticsHighDimensional`.
- **Vectors and designs.** Parameters are `β : EuclideanSpace ℝ (Fin p)`, observations
  `y : EuclideanSpace ℝ (Fin n)`, and a design is `X : Matrix (Fin n) (Fin p) ℝ` acting by
  `Matrix.toEuclideanLin X`, written `Xβ`. The norm `‖·‖` of `EuclideanSpace` is the `ℓ²` norm.
  `‖β‖₁` is the restricted `ℓ¹` norm of Foundations 9.3 on `Finset.univ`, and `β_S` is the vector
  equal to `β` on `S` and `0` off `S`; `‖β_S‖₁` is the restricted norm on `S`. The `ℓ^∞` norm is
  never used as a norm: a bound `‖v‖∞ ≤ b` is written `∀ j, |v j| ≤ b`. The `j`-th column is `X_j`
  (`designCol X j`), and `X_S = X.submatrix id (Subtype.val : S → Fin p)`. The Gram matrix is
  `Σ̂ = XᵀX/n`.
- **Design normalization.** Column normalization is the hypothesis `‖X_j‖²/n ≤ 1` for every `j`,
  stated where used and never built into a definition. Restricted isometry statements are
  stated for the rescaled design `n^{-1/2} X`.
- **Noise.** Sub-Gaussian noise with variance proxy `σ²` means independent coordinates with
  Mathlib's `HasSubgaussianMGF (εᵢ) (σ²) μ`, the proxy an `ℝ≥0`. Gaussian noise `N(0, σ² Iₙ)` is
  the law `(stdGaussian _).map (σ • ·)`, and it is sub-Gaussian with proxy `σ²` by 1.1. A
  sub-Gaussian random vector with proxy `c` (1.1) is one whose every linear form `⟪u, x⟫` has
  `HasSubgaussianMGF` with proxy `c‖u‖²`; this is the row hypothesis of RandomMatrices §2.4.
- **The lasso.** For `λ > 0`, the lasso objective is
  `L(β) = ‖y - Xβ‖²/(2n) + λ‖β‖₁`, and a lasso solution is any `β̂` with
  `IsMinOn L univ β̂`. No measurable selection of a solution is assumed: probabilistic lasso
  theorems are a deterministic statement for every solution on an event, together with a bound
  for the probability of that event.
- **Cones and design constants.** For `S ⊆ Fin p` and `L > 0` the cone is
  `C_L(S) = {δ | ‖δ_{Sᶜ}‖₁ ≤ L‖δ_S‖₁}`. The compatibility constant is the infimum
  `φ(S, L) = inf {|S| ‖Xδ‖²/(n‖δ_S‖₁²) | δ ∈ C_L(S), δ ≠ 0}`, written `φ̂²(L, S)` in van de Geer;
  for nonempty `S`, `δ ≠ 0` in the cone forces `δ_S ≠ 0`, so every ratio is defined.
  The restricted eigenvalue condition with constant `κ > 0` is `κ‖δ‖² ≤ ‖Xδ‖²/n` for every
  `δ ∈ C_3(S)`. Both are defined in 3.2; theorems assume `φ(S, 3) > 0` or the restricted
  eigenvalue condition.
- **Matrix norms.** For matrices, `‖·‖` is the Euclidean operator norm of the
  `Matrix.Norms.L2Operator` scope, opened locally. The Frobenius norm is
  `‖A‖_F = (∑ᵢⱼ Aᵢⱼ²)^{1/2}`, the max norm `‖A‖_max = maxᵢⱼ |Aᵢⱼ|` and the `∞ → ∞` norm
  `maxᵢ ∑ⱼ |Aᵢⱼ|`; the last two appear only as explicit hypotheses `∀ i j, |A i j| ≤ b` and
  `∀ i, ∑ j, |A i j| ≤ b`. The nuclear norm of `Θ : Matrix (Fin d₁) (Fin d₂) ℝ` is Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.nuclear` applied to `Matrix.toEuclideanLin Θ`, the sum of
  its singular values. The Frobenius inner product is `⟪A, B⟫_F = ∑ᵢⱼ Aᵢⱼ Bᵢⱼ = tr(AᵀB)`.
- **Eigenvalues** are Mathlib's decreasing `Matrix.IsHermitian.eigenvalues₀`, as in
  RandomMatrices. A leading unit eigenvector of a symmetric `M` is a unit `u` with
  `M u = λ_max(M) u`.
- **Gaussian regression model.** `Y = f + σξ` in `EuclideanSpace ℝ (Fin n)`, with `ξ` of law
  `stdGaussian` and `σ > 0`. Probabilities and expectations are taken under
  `stdGaussian` for `ξ`, so that no ambient probability space is needed. The empirical norm is
  `‖v‖ₙ² = ‖v‖²/n`. Projections are Mathlib's `Submodule.starProjection`.
- **Gaussian sequence model.** `Y = θ + σξ` in `EuclideanSpace ℝ (Fin p)`. Its experiment is the
  Markov kernel `θ ↦ (stdGaussian _).map (fun z ↦ θ + σ • z)`, restricted to a parameter subtype
  by `Kernel.comap`. The minimax risk is Mathlib's `minimaxRisk` with the loss
  `ENNReal.ofReal ‖a - θ‖²`, an infimum over Markov kernels, so randomized estimators are
  included.
- **Multiple testing.** There are `m` hypotheses indexed by `Fin m`, a set `I₀ : Finset (Fin m)`
  of true nulls of size `m₀`, and p-values `p : Ω → Fin m → ℝ`, measurable. A null p-value is
  valid when `μ {pᵢ ≤ t} ≤ t` for every `t ∈ [0, 1]`. For a rejection set `R`, `V = |R ∩ I₀|`
  and the false discovery proportion is `V / max(|R|, 1)`; it is `0` when nothing is rejected,
  which is the convention `0/0 = 0`. The false discovery rate is its expectation.
- **Constants.** "Universal constants" are real numbers chosen before every other quantity:
  the statement is `∃ c C > 0, ∀ …`. Constants "depending only on `K`" are chosen after `K`
  and before everything else.
- **Asymptotic regimes.** A high-dimensional limit is along `n → ∞` with a dimension sequence
  `p : ℕ → ℕ`, `p n ≥ 1` and `p n / n → y`. Almost-sure statements use the corners of one
  infinite i.i.d. array, as in RandomMatrices.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). A locator marked *by the same argument* names the theorem whose
  proof the target follows when the target's hypotheses or constants differ from those printed.

**Checks.**

- `designCol`: for `X = [[1, 2], [3, 4]]`, `X_1 = (2, 4)`, not the row `(3, 4)`.
- `designCol`: for the same `X`, `‖X_0‖²/n = (1 + 9)/2 = 5`.
- `designCol`: for `X = [[2, 1]]` (`n = 1`), `⟪X_0, y⟫/n = 2y`.

## Exact supplier contracts

### From Mathlib

- **Probability:** `HasSubgaussianMGF` with `HasSubgaussianMGF.measure_ge_le`,
  `HasSubgaussianMGF.const_mul` and `HasSubgaussianMGF.sum_of_iIndepFun`
  (`Mathlib/Probability/Moments/SubGaussian.lean`), `gaussianReal` and `mgf_id_gaussianReal`,
  for 1.1; `mgf`; `stdGaussian` and `multivariateGaussian`; `iIndepFun`, `IndepFun`, `HasLaw`;
  `condDistrib`, for 3.8 and 6.1; `cdf` and `TendstoInMeasure`, for 3.8.
- **Decision theory and divergences:** `minimaxRisk`, `Kernel.deterministic`, `Kernel.map` and
  `Kernel.comap`, for Layer 5; `klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`)
  and `tvDist`, for 5.2 and 5.3.
- **Sparsity:** `hammingNorm`, `hammingDist` (`Mathlib/InformationTheory/Hamming.lean`).
- **Linear algebra:** `Matrix.toEuclideanLin`, the `Matrix.Norms.L2Operator` scope with
  `Matrix.l2_opNorm_def` and `Matrix.l2_opNorm_mulVec`, `Matrix.IsHermitian.eigenvalues₀`,
  `LinearMap.singularValues` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`),
  `Matrix.PosDef`, `Matrix.PosSemidef`, `Submodule.starProjection`, `Matrix.det`.
- **Optimization:** `IsMinOn`, `ConvexOn`, `StrictConvexOn`.

### From Tau Ceti

- **Gaussian laws**, for 1.2 and Layer 4: `TauCeti.Probability.chiSquaredMeasure` with its
  moment generating function `TauCeti.Probability.mgf_id_chiSquaredMeasure`
  (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean`);
  `ProbabilityTheory.HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian` and
  `ProbabilityTheory.HasLaw.iIndepFun_norm_sq_orthogonalProjectionOnto_stdGaussian`
  (`TauCeti/Probability/Distributions/Gaussian/Projection.lean`).
- **Gaussian conditioning**, for 7.3: `EuclideanSpace.gaussianCondMean`,
  `TauCeti.Probability.condDistrib_multivariateGaussian` and
  `ProbabilityTheory.HasLaw.indepFun_gaussianResidual`
  (`TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.lean`).
- **Information theory**, for 5.2 and 5.3: Pinsker's inequality
  `TauCeti.etvDist_sq_le_two_mul_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`).
- **Matrices and operators:** `TauCeti.sampleSecondMoment` with
  `TauCeti.isHermitian_sampleSecondMoment` (`TauCeti/Analysis/Matrix/SampleSecondMoment.lean`),
  for 1.3 and 8.3; Weyl's inequality `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`), for 8.1; the residual `sin Θ`
  theorem `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.lean`) in the
  operator norm `TauCeti.UnitarilyInvariantSeminorm.opNorm`, for 8.1; the nuclear seminorm
  `TauCeti.UnitarilyInvariantSeminorm.nuclear` with
  `TauCeti.UnitarilyInvariantSeminorm.nuclear_apply` and
  `TauCeti.UnitarilyInvariantSeminorm.nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/`), for 1.4 and 7.1.
- **Convex analysis and nets:** `TauCeti.subdifferential` with
  `TauCeti.mem_subdifferential_coe_iff_isMinOn_sub`
  (`TauCeti/Analysis/Convex/Subdifferential.lean`), for 3.1; the net bounds
  `TauCeti.exists_finset_isCover_of_subset_closedBall`, for 1.5, and
  `TauCeti.exists_finset_isCover_sphere`, `(1 + 2/η)^d` points, for 8.2
  (`TauCeti/Analysis/Normed/Module/CoveringNumber.lean`).
- **Spectral laws**, for 8.3: the Marchenko–Pastur law `TauCeti.Probability.marchenkoPastur`
  (`TauCeti/Probability/Distributions/MarchenkoPastur/Basic.lean`).

### From MathematicalStatisticsFoundations

[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) supplies:
- 9.3: `hammingNorm (WithLp.ofLp x)` as the sparsity of `x`, for Layers 2 and 5; the restricted
  `ℓ¹` norm `∑_{j ∈ S} |xⱼ|`, for Layers 2 and 3; the best `s`-sparse `ℓ¹` error `σₛ(x)₁` with
  its attainment on a set of `s` largest coordinates, for 2.2 and 2.3; the restricted isometry
  property of order `s` and constant `δ` with its passage to smaller orders and larger
  constants, for Layer 2 and 3.4–3.5; the Benjamini–Hochberg count with its rejection set, for
  6.1.
- 8.3: the algebra of convergence in probability, including `O_P(1) · o_P(1) = o_P(1)`, for 3.8.
- 8.4: Slutsky's lemma without separability, for 3.8.

`Suggested.lean` carries local copies of the restricted `ℓ¹` norm (`restrictedL1Norm`), the best
`s`-sparse `ℓ¹` error (`bestSparseL1Error`), and the restricted isometry property (`HasRIP`), each
with a docstring naming 9.3.

### From MathematicalStatisticsNonparametric

MathematicalStatisticsNonparametric supplies exactly the following, all from its Layers 1 and 2
and its section 6.4, and nothing else is used:
- 1.3: for `a, b : EuclideanSpace ℝ (Fin d)` and `v > 0`, the divergence
  `klDiv (multivariateGaussian a (v • 1)) (multivariateGaussian b (v • 1))` is
  `ENNReal.ofReal (‖a - b‖²/(2v))`, for 1.5, 5.2 and 5.3.
- 2.2 and 2.6: Le Cam's two-point method in its minimax form. For a kernel `P : Kernel Θ X`,
  `g : Θ → Y`, the loss `ofReal (d(a, g θ)²)`, `s ≥ 0` and `θ₀, θ₁` with
  `d(g θ₀, g θ₁) ≥ 2s`, the minimax risk is at least `ofReal (s²(1 - tvDist(P θ₀, P θ₁)/2)/2)`;
  Mathlib's `tvDist` takes values in `[0, 2]`. For 5.2.
- 2.4 and 2.6: Fano's method in its minimax form. For `M ≥ 2` parameters `θⱼ` with
  `d(g θᵢ, g θⱼ) ≥ 2s` for `i ≠ j`, `s ≥ 0`, and a probability measure `Q` with
  `klDiv (P θⱼ) Q ≠ ∞` for every `j`, the minimax risk is at least `ofReal` of
  `s²(1 - (M⁻¹ ∑ⱼ (klDiv (P θⱼ) Q).toReal + log 2)/log M)`. For 5.2.
- 2.5 and 2.6: Assouad's lemma in its metric form. For `θ : (Fin m → Bool) → Θ` and `c > 0` with
  `d(g(θ ω), g(θ ω'))² ≥ c · hammingDist ω ω'`, the minimax risk is at least
  `ofReal ((c/8) m min (1 - tvDist(P(θ ω), P(θ ω'))/2))`, the minimum over neighbours
  (`hammingDist ω ω' = 1`). For 5.3.
- 6.4: the soft-threshold map `η_λ(y) = sign(y)(|y| - λ)₊`, its one-coordinate risk
  `r(λ, θ) = E(η_λ(θ + Z) - θ)²` for `Z ~ N(0, 1)`, and, for `λ ≥ 0`, the bounds
  `r(λ, 0) ≤ e^{-λ²/2}` and `r(λ, θ) ≤ r(λ, 0) + min(θ², 1 + λ²)`, for 3.6 and 5.1.

`Suggested.lean` carries local copies of the soft-threshold map and its one-coordinate risk, each
with a docstring naming 6.4.

### From RandomMatrices

[RandomMatrices](../RandomMatrices/README.md) supplies:
- §2.1: the definition of a sub-exponential variable with parameter `K > 0`
  (`exp(t(X - EX))` integrable and `E exp(t(X - EX)) ≤ exp(K²t²)` for `|t| ≤ 1/K`), of which
  `Suggested.lean` carries a local copy, and Bernstein's inequality for independent sums of
  such variables (V Theorem 2.8.1), for 1.3 and 8.2.
- §2.4: for a `p × n` matrix with independent centred entries, each sub-Gaussian with proxy at
  most `K²`, `P(‖X‖ > CK(√p + √n + t)) ≤ 2exp(-ct²)` for `t ≥ 0` (V Theorem 4.4.5), for 7.1;
  for a matrix with `N` independent centred isotropic rows in `ℝ^d` whose linear forms in
  direction `u` have proxy at most `K²‖u‖²`,
  `√N - CK²(√d + t) ≤ s_min ≤ s_max ≤ √N + CK²(√d + t)` with probability at least
  `1 - 2exp(-ct²)` (V Theorem 4.6.1), for 1.3, 2.4 and 7.3.
- §4.1: the sample covariance `XX*/n` of a `p × n` matrix `X` as Tau Ceti's sample second moment
  of the columns of `X`, for 8.3.
- §4.4: the almost-sure Marchenko–Pastur law for the `p(n) × n` corners of an infinite real
  i.i.d. array with mean `0` and variance `1`, `p(n) ≥ 1` and `p(n)/n → y ∈ (0, ∞)`, for 8.3.
- §4.5: under the hypotheses of §4.4 and a finite fourth moment,
  `λ_max(XX*/n) → (1 + √y)²` almost surely, for 8.3.
- §7.3: for the Gaussian sample covariance with `0 < y < 1` and `T_p = diag(ℓ, 1, …, 1)`,
  `ℓ > 1`, the threshold `1 + √y`; above it the outlier limit `ℓ(1 + y/(ℓ - 1))` and the squared
  overlap limit `(1 - y/(ℓ - 1)²)/(1 + y/(ℓ - 1))`; at and below it the limits `(1 + √y)²` and
  `0`. For 8.3.

## How to read the build

Layer 1 is the toolkit: everything probabilistic in Layers 2–8 is a union bound over
sub-Gaussian or sub-exponential tails, a chi-squared tail, or a net argument, and Layer 1 states
each in the exact form used. Layer 2 is the geometry of the `ℓ¹` ball: a matrix recovers every
vector supported on `S` by basis pursuit exactly when its kernel avoids the cone `C_1(S)`, and
the restricted isometry property is a checkable sufficient condition that random designs
satisfy.

Layer 3 is one inequality used many times. Optimality of the lasso gives the basic inequality
`‖XΔ‖²/n ≤ ⟪ε, XΔ⟫/n + λ(‖β‖₁ - ‖β̂‖₁)` for the error `Δ = β̂ - β`. On the noise event
`λ ≥ 2 maxⱼ |⟪X_j, ε⟫|/n` this places `Δ` in the cone `C_3(S)` and bounds the prediction error
by `(3λ/2)‖Δ_S‖₁`; every rate follows by comparing `‖Δ_S‖₁` with `‖XΔ‖` through a design
constant. Layer 7 runs the same argument for the nuclear norm and for the graphical lasso.
Layer 4 is the Gaussian regression model with projections, Layer 5 combines the soft-threshold
risk with the lower-bound toolkit, and Layer 6 is the combinatorics of step-up procedures
together with one monotonicity property of the joint law of the p-values. Layer 8 is
perturbation theory for the leading eigenvector, and the translation of the random matrix
limits into statements about sample covariances.

The layers are in build order. Layers 2, 4 and 6 need only Layer 1 and the suppliers; Layer 3
needs Layer 2 for random designs; Layer 5 needs Layers 1 and 4; Layer 7 needs Layers 1 and 3;
Layer 8 needs Layer 1.

## Layer 1: probabilistic and linear-algebra toolkit

### 1.1 Sub-Gaussian variables and vectors

- `hasSubgaussianMGF_gaussianReal`: a variable with law `gaussianReal 0 v` satisfies
  `HasSubgaussianMGF X v μ`. The proof is `mgf_id_gaussianReal`, which gives equality in the
  moment generating function bound. Mathlib has no such lemma.
- Weighted sums: if `ε₁, …, εₙ` are independent with proxies `cᵢ`, then `∑ aᵢ εᵢ` has proxy
  `∑ aᵢ² cᵢ` (`HasSubgaussianMGF.sum_of_iIndepFun` and `HasSubgaussianMGF.const_mul`). In particular
  `⟪u, ε⟫` has proxy `σ²‖u‖²` for sub-Gaussian noise with proxy `σ²`, and `⟪X_j, ε⟫/n` has proxy
  `σ²‖X_j‖²/n²`.
- Two-sided tail: `μ {t ≤ |Z|} ≤ 2 exp(-t²/(2c))` for `t ≥ 0` and proxy `c`, from
  `HasSubgaussianMGF.measure_ge_le` applied to `Z` and `-Z`.
- **Maximal inequality** (`measure_max_abs_gt_le`): for `Z₁, …, Z_N`, `N ≥ 1`, each with proxy
  `c`, and with no independence assumed,
  `μ {√(2c(log N + t)) < maxⱼ |Zⱼ|} ≤ 2e^{-t}` for `t ≥ 0`, by the union bound. The exceedance
  is strict: with `c = 0` every `Zⱼ` is `0` a.e., and the non-strict event would have
  probability `1`.
- `IsSubgaussianVector μ x c`, for `x : Ω → E` in a finite-dimensional real inner product
  space: for every `u : E`, `HasSubgaussianMGF (fun ω ↦ ⟪u, x ω⟫) (c * ‖u‖₊²) μ`. A vector with
  independent coordinates of proxy `c` is a sub-Gaussian vector with proxy `c`; a centred
  Gaussian vector `multivariateGaussian 0 Σ` with `Σ` positive semidefinite is one with proxy
  `‖Σ‖`; the image of a sub-Gaussian vector under a linear map `A` has proxy `c‖A‖²`.

*Needs:* Mathlib `HasSubgaussianMGF`, `mgf_id_gaussianReal`, `multivariateGaussian`.

**Checks.**

- Gaussian proxy: for `X ~ N(0, 1)`, `E exp(tX) = exp(t²/2)`, so the proxy `1` is attained
  and no proxy `c < 1` works (at `t = 1`, `e^{1/2} > e^{c/2}`).
- Maximal inequality: for `N = 1` and `t = 0` the threshold is `0` and the bound `2` is
  trivially true.
- Maximal inequality, negative control: for `N = 1`, `c = 0`, `Z₁ = 0` the strict event is
  empty, while `{0 ≤ |Z₁|}` has probability `1 > 2e^{-t}` for `t > log 2`.
- Maximal inequality: for `N = 2`, `c = 1`, `t = 1` the threshold is
  `√(2(log 2 + 1)) ≈ 1.840`.
- `IsSubgaussianVector`: a Rademacher vector in `ℝ²` with independent signs has proxy `1`.
- `IsSubgaussianVector`: the vector `(g, g)` with `g ~ N(0, 1)` has proxy `2 = ‖Σ‖` with
  `Σ = [[1, 1], [1, 1]]`.
- `IsSubgaussianVector`, negative control: `(g, g)` has coordinates of proxy `1` but is not a
  sub-Gaussian vector with proxy `1`, since for `u = (1, 1)/√2` the form `⟪u, x⟫ = √2 g` has
  variance `2 > ‖u‖² = 1`; a definition through the coordinates alone would accept it.

### 1.2 Chi-squared tails and Gaussian projections

- For a subspace `K` of `EuclideanSpace ℝ (Fin n)` of dimension `k` and `ξ ~ stdGaussian`,
  `‖P_K ξ‖²` has the law `chiSquaredMeasure k`. This is not a target: it is Tau Ceti's
  `ProbabilityTheory.HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`.
- **Chi-squared tails** (`chiSquared_tail_upper`, `chiSquared_tail_lower`): for `Z` of law
  `chiSquaredMeasure k` and `t ≥ 0`, `P(Z - k ≥ 2√(kt) + 2t) ≤ e^{-t}` and
  `P(k - Z > 2√(kt)) ≤ e^{-t}` (Boucheron–Lugosi–Massart, §2.4, pp. 28–29, and Example 2.7,
  p. 33: `χ²_k` is a gamma variable with `a = k/2`, `b = 2`, so it is sub-gamma on the right
  with `v = 2k`, `c = 2`, and on the left with `v = 2k`, `c = 0`). The proof is the
  Cramér–Chernoff bound with the moment generating function `(1 - 2s)^{-k/2}` of Tau Ceti's
  `TauCeti.Probability.mgf_id_chiSquaredMeasure`.
- The exponential moment `E exp(s‖P_K ξ‖²) = (1 - 2s)^{-k/2}` for `s < 1/2`, in particular
  `E exp(‖P_K ξ‖²/4) = 2^{k/2}`, is not a target: it is
  `TauCeti.Probability.mgf_id_chiSquaredMeasure` through the law of the first bullet.
- The independence of `‖P_K ξ‖²` and `‖P_{K'} ξ‖²` for orthogonal subspaces `K ⊥ K'` is not a
  target: it is Tau Ceti's
  `ProbabilityTheory.HasLaw.iIndepFun_norm_sq_orthogonalProjectionOnto_stdGaussian`, for any
  family of pairwise orthogonal subspaces.

*Needs:* Tau Ceti `chiSquaredMeasure`, `mgf_id_chiSquaredMeasure`,
`HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian`.

**Checks.**

- Upper tail, `k = 1`, `t = 1`: the bound is `P(Z ≥ 5) ≤ e^{-1} ≈ 0.368`, while
  `P(χ²₁ ≥ 5) ≈ 0.0253`.
- Lower tail, `k = 4`, `t = 1`: `P(Z < 0) = 0 ≤ e^{-1}`, consistent since `4 - 2√4 = 0`.
- Lower tail, `k = 0`, `t > 0`: `chiSquaredMeasure 0 = dirac 0`, so `P(Z < 0) = 0`; the
  non-strict event `{Z ≤ 0}` would have probability `1 > e^{-t}`, which is why the lower tail is
  strict. The upper tail needs no change: for `k = 0` its event is `{Z ≥ 2t}`, of probability
  `1 = e^0` at `t = 0` and `0` for `t > 0`.
- Exponential moment, `k = 2`: `E exp(Z/4) = (1/2)^{-1} = 2`.

### 1.3 Sub-exponential products and sample covariances

- **Products** (`isSubexponential_mul_sub`): there is a universal `C > 0` such that, if `U` and
  `V` (not necessarily independent) have `HasSubgaussianMGF` with proxy `σ² > 0`, then `UV` is
  sub-exponential in the sense of RandomMatrices §2.1 (`IsSubexponential`, a local copy) with
  parameter `Cσ²`: `E exp(t(UV - E[UV])) ≤ exp(C²σ⁴t²)` for `|t| ≤ 1/(Cσ²)` (Vershynin,
  Lemma 2.7.7, p. 31, in the Orlicz-norm form `‖UV‖_ψ₁ ≤ ‖U‖_ψ₂‖V‖_ψ₂`; property (v) of
  Prop 2.7.1, p. 29, after the centring of Exercise 2.7.10, p. 32, is the form stated here).
  The proxy is positive: at `σ = 0` the product vanishes a.e. and its parameter `C · 0` is
  excluded by the condition `K > 0` of the definition. The proof writes
  `4UV = (U + V)² - (U - V)²`, bounds the moment generating function of the square of a
  sub-Gaussian variable by the Gaussian comparison
  `E exp(sW²) ≤ (1 - 2sc)^{-1/2}` for proxy `c` and `0 ≤ s < 1/(2c)`, and recentres. The range
  `s ≥ 0` is needed: for `W = 0`, `c = 1`, `s = -1` the claim would read `1 ≤ 1/√3`. The
  argument only uses it at `s ≥ 0`: for either sign of `λ`, `E exp(λUV)` is bounded by
  Cauchy–Schwarz through `E exp(|λ|(U ± V)²/2)`.
- **Entrywise covariance concentration** (`measure_max_abs_sampleCovariance_sub_gt_le`): for
  independent `x₁, …, xₙ` in `EuclideanSpace ℝ (Fin p)` with common covariance `Σ`, each
  coordinate of each `xᵢ` sub-Gaussian with proxy `σ²`, and `Σ̂ = n⁻¹ ∑ xᵢ xᵢᵀ`, there are
  universal constants `c₀, c₁, c₂ > 0` such that for `n > log p` and `δ > 0`,
  `P(maxⱼₖ |Σ̂ⱼₖ - Σⱼₖ| > σ²(c₀√((log p)/n) + δ)) ≤ c₁ exp(-c₂ n min(δ, δ²))`. The exceedance
  is strict: with `σ = 0` all observations vanish a.e. and `Σ = 0`, and the non-strict event
  would have probability `1` for every `n`.
  The proof is Bernstein's inequality for sub-exponential sums (RandomMatrices §2.1) for each
  entry and the union bound over `p²` entries; the term `c₀√((log p)/n)` absorbs `2 log p`,
  using `n > log p` when `c₀√((log p)/n) > 1`.
- **Operator-norm concentration of a sample covariance** (`norm_sampleCovariance_sub_le`): there
  are universal `C, c > 0` such that, for `n ≥ 1`, `t ≥ 0` and independent isotropic
  (`E⟪u, wᵢ⟫⟪v, wᵢ⟫ = ⟪u, v⟫`) sub-Gaussian vectors `w₁, …, wₙ` in `ℝ^p` with proxy `K²`
  (`IsSubgaussianVector`, which makes them centred), with probability at least
  `1 - 2exp(-ct²)`, `‖n⁻¹ ∑ wᵢwᵢᵀ - I‖ ≤ 3 max(ε, ε²)` with `ε = CK²(√p + t)/√n`; the matrix
  `n⁻¹ ∑ wᵢwᵢᵀ` is Tau Ceti's `TauCeti.sampleSecondMoment` of the `wᵢ`. This is the singular value
  bound of RandomMatrices §2.4 for the `n × p` matrix with rows `wᵢ`, through
  `|s² - 1| ≤ 3 max(|s - 1|, |s - 1|²)`.

*Needs:* 1.1; RandomMatrices §2.1 (sub-exponential variables and Bernstein's inequality), §2.4.

**Checks.**

- Products: for independent `U, V ~ N(0, 1)`, `E exp(sUV) = (1 - s²)^{-1/2}` for `|s| < 1`,
  finite near `0` and infinite at `s = 1`: `UV` is sub-exponential and not sub-Gaussian.
- Products: for `U = V ~ N(0, 1)`, `UV - 1 = U² - 1` has `E exp(s(U² - 1)) = e^{-s}(1 - 2s)^{-1/2}`
  for `s < 1/2`.
- Operator norm: for `p = 1` and Rademacher `wᵢ`, `n⁻¹ ∑ wᵢ² - 1 = 0` exactly.

### 1.4 Operator and nuclear norms

- **Entrywise domination** (`norm_le_norm_of_abs_le`): if `|Mᵢⱼ| ≤ Bᵢⱼ` for every entry, then
  `‖M‖ ≤ ‖B‖`, by `|Mv| ≤ B|v|` coordinatewise. Tau Ceti's
  `Matrix.norm_toEuclideanLin_le_of_entry_le` is the uniform-entry special case only.
- **Schur test** (`norm_le_sqrt_maxRowSum_mul_maxColSum`): if every absolute row sum
  `∑ⱼ |Aᵢⱼ|` is at most `r` and every absolute column sum `∑ᵢ |Aᵢⱼ|` is at most `c`, then
  `‖A‖ ≤ √(rc)`. No sign condition is needed: if both index types are nonempty the hypotheses
  force `r, c ≥ 0`, and otherwise `‖A‖ = 0`.
- **Symmetric Schur test** (`norm_le_of_rowSum_le`): for a symmetric `A`, `‖A‖ ≤ b` whenever
  `0 ≤ b` and every row sum `∑ⱼ |Aᵢⱼ|` is at most `b`. The sign condition matters only for the
  empty index type, where `‖A‖ = 0`. For a symmetric `0–1` matrix with at most `s` ones per row
  this gives `‖A‖ ≤ s`.
- The `∞ → ∞` bound of a matrix by its row sums: for `A` with `∀ i, ∑ⱼ |Aᵢⱼ| ≤ b`,
  `|(Av)ᵢ| ≤ b maxⱼ |vⱼ|`.
- **Row sums of an inverse** (`sum_abs_inv_apply_le`): for a `k × k` positive definite `M` whose
  eigenvalues are all at least `c > 0`, every absolute row sum satisfies
  `∑ⱼ |(M⁻¹)ᵢⱼ| ≤ √k/c`. The proof bounds the `ℓ¹` norm of the row `M⁻¹eᵢ` by `√k` times its
  `ℓ²` norm, which is at most `‖M⁻¹‖ ≤ 1/c`. The condition `c > 0` is needed: at `c = 0` the
  right-hand side is Lean's `√k/0 = 0`.
- `nuclearNorm Θ`, `frobInner A B` and `frobNormSq A`: the nuclear norm, the Frobenius inner
  product `∑ᵢⱼ Aᵢⱼ Bᵢⱼ` and the squared Frobenius norm `∑ᵢⱼ Aᵢⱼ²` of the Conventions, the first
  for `Θ : Matrix (Fin d₁) (Fin d₂) ℝ`.
- **Trace duality** (`abs_frobInner_le_norm_mul_nuclearNorm`):
  `|⟪A, B⟫_F| ≤ ‖A‖ · nuclear(B)` for `A, B : Matrix (Fin d₁) (Fin d₂) ℝ`, by the singular
  value decomposition of `B`.
- **Orthogonal additivity** (`nuclearNorm_add_of_orthogonal`): if `AᵀB = 0` and `ABᵀ = 0` then
  `nuclear(A + B) = nuclear(A) + nuclear(B)`.
- **Low-rank decomposition** (`exists_lowRank_decomposition`, Wainwright, §10.2.1,
  pp. 317–318): for `Θ*` of rank at most `r` and any `Δ`, there are `Δ' + Δ'' = Δ` with
  `rank Δ' ≤ 2r`, `Θ*ᵀΔ'' = 0`, `Θ*Δ''ᵀ = 0`, `⟪Δ', Δ''⟫_F = 0`,
  `nuclear(Θ* + Δ) ≥ nuclear(Θ*) + nuclear(Δ'') - nuclear(Δ')` and
  `nuclear(Δ') ≤ √(2r) ‖Δ‖_F`. The inequality for `nuclear(Θ* + Δ)` is orthogonal additivity
  for `Θ*` and `Δ''`; the last bound is Tau Ceti's
  `TauCeti.UnitarilyInvariantSeminorm.nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`,
  `nuclear(Δ') ≤ √(rank Δ') ‖Δ'‖_F`, with `‖Δ'‖_F ≤ ‖Δ‖_F` by orthogonality. With `U` and `V`
  the column and row spaces of `Θ*`, `Δ'' = P_{U⊥} Δ P_{V⊥}`; Wainwright's representation
  (10.14) shows that `Δ' = Δ - Δ''` has rank at most `2r`, and his decomposability computation
  is orthogonal additivity.

*Needs:* Mathlib `LinearMap.singularValues`, `Matrix.Norms.L2Operator`,
`Matrix.IsHermitian.eigenvalues₀`; Tau Ceti `nuclear`, `nuclear_apply`,
`nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`.

**Checks.**

- Entrywise domination: `M = [[1, -1], [1, 1]]` and `B = [[1, 1], [1, 1]]`: `‖M‖ = √2 ≤ 2 = ‖B‖`.
  The absolute values are needed: `M = -I₂ ≤ 0 = B` entrywise, while `‖M‖ = 1 > 0`.
- Schur test: the `2 × 2` all-ones matrix has row and column sums `2` and norm `2`, so the
  bound `√(2 · 2)` is attained.
- Schur test: `A = [[1, 0], [1, 0]]` has row sums `1`, column sums `2, 0` and
  `‖A‖ = √2 = √(1 · 2)`.
- Symmetric Schur test, negative control: the same `A` is not symmetric, and its largest row
  sum `1` is below `‖A‖ = √2`, so the symmetry hypothesis cannot be dropped.
- Trace duality: `A = B = diag(1, 0)`: `⟪A, B⟫_F = 1 = ‖A‖ · nuclear(B)`; `A = I₂`,
  `B = diag(1, -1)`: `0 ≤ 2`.
- Orthogonal additivity: `A = diag(1, 0)`, `B = diag(0, 2)`: `nuclear(A + B) = 3 = 1 + 2`; for
  `A = B = diag(1, 0)` the hypothesis fails and `nuclear(2A) = 2` still equals `1 + 1`, while
  `A = diag(1, 0)`, `B = -A` gives `0 ≠ 2`.
- Row sums of an inverse: `M = 2I₂`, `c = 2`: each row sum of `M⁻¹ = I₂/2` is `1/2 ≤ √2/2`.
- Row sums of an inverse, negative control: `M = diag(1, 1/4)` with `c = 1`, above the
  eigenvalue `1/4`: the second row sum of `M⁻¹` is `4 > √2`.
- `nuclearNorm diag(1, -2) = 3`, the sum of the singular values `2, 1`, not the trace `-1`.
- `nuclearNorm` of the `1 × 2` matrix `[[1, 1]]` is its one singular value `√2`, not the sum `2`
  of the absolute entries.
- `nuclearNorm` of a rank-one `uvᵀ` is `‖u‖‖v‖`: for `u = (3, 4)`, `v = (1)` it is `5`.
- `frobInner [[1, 2]] [[3, 4]] = 11`, and `frobInner A A = frobNormSq A`.
- `frobInner`, negative control: it pairs `Aᵢⱼ` with `Bᵢⱼ`, as `tr(AᵀB)`, not with `Bⱼᵢ` as
  `tr(AB)`: for `A = [[0, 1], [0, 0]]` and `B = Aᵀ`, `frobInner A B = 0` while `tr(AB) = 1`.
- `frobNormSq [[1, 2], [3, 4]] = 30`.
- `frobNormSq`, negative control: `frobNormSq I₂ = 2`, while the squared operator norm is
  `‖I₂‖² = 1`.

### 1.5 Counting, packing and divergences

- **Binomial bound**: `C(p, k) ≤ (ep/k)^k` and
  `log C(p, k) ≤ k log(ep/k)` for `1 ≤ k ≤ p`. The proof is Mathlib's `Nat.choose_le_pow_div`,
  `C(p, k) ≤ p^k/k!`, with `k! ≥ (k/e)^k`.
- **Sparse Varshamov–Gilbert packing** (`exists_sparse_packing`): for `1 ≤ D < p/5` there is a
  set `C` of vectors in `{0, 1}^p` with exactly `D` ones, pairwise Hamming distance greater than
  `D`, and `log |C| ≥ (D/2) log(p/(5D))` (Giraud, Lemma 3.7, p. 65). The proof is the greedy
  construction: a ball of Hamming radius `D` in the exactly-`D`-sparse vectors has at most
  `∑_{j ≤ D/2} C(D, j) C(p - D, j)` points.
- **Nets of low-rank matrices** (`exists_net_lowRank`): for `0 < ε ≤ 1` the set of `d₁ × d₂`
  matrices of rank at most `r` and Frobenius norm `1` has an `ε`-net in the Frobenius norm,
  contained in the set, with at most `(9/ε)^{(d₁ + d₂ + 1) r}` points (Candès–Plan 2011, Lemma 3.1).
  The proof writes each such matrix as `UΣVᵀ` with `U` and `V` having `r` orthonormal columns and
  `Σ` diagonal of Frobenius norm `1`, and takes `ε/3`-nets, inside their sets, of the frames `U` and
  `V` in the norm `maxⱼ ‖uⱼ‖` (the sup norm of `Fin r → EuclideanSpace ℝ (Fin d)`) and of the
  diagonals in the `ℓ²` norm, by Tau Ceti's `TauCeti.exists_finset_isCover_of_subset_closedBall`:
  each has at most `(1 + 6/ε)^{dim} ≤ (9/ε)^{dim}` points, the dimensions are `d₁r`, `d₂r` and `r`,
  and the triangle inequality gives distance at most `ε` for the products, which lie in the set.
- **Gaussian divergence** (consumed, not a target here): the divergence of `N(a, σ²I)` from
  `N(b, σ²I)` is `ENNReal.ofReal (‖a - b‖²/(2σ²))`. This is the isotropic Gaussian divergence of
  MathematicalStatisticsNonparametric 1.3, stated there for `multivariateGaussian a (v • 1)`
  with `v = σ²`. This roadmap writes `N(a, σ²I)` as `(stdGaussian _).map (fun z ↦ a + σ • z)`.
  The two agree because Mathlib defines `multivariateGaussian a S` as the image of
  `stdGaussian` under `x ↦ a + √S x`, and `CFC.sqrt (σ² • 1) = σ • 1` for `σ > 0`.

*Needs:* Mathlib `hammingDist`, `stdGaussian`; Tau Ceti
`exists_finset_isCover_of_subset_closedBall`;
MathematicalStatisticsNonparametric 1.3 (Gaussian divergence).

**Checks.**

- Binomial bound: `C(5, 2) = 10 ≤ (5e/2)² ≈ 46.2`.
- Binomial bound: `C(p, p) = 1 ≤ e^p`, and `log C(p, p) = 0 ≤ p`.
- Binomial bound, negative control: the hypothesis `k ≤ p` is needed for the logarithmic form:
  for `p = 1`, `k = 3`, `C(1, 3) = 0` and Lean's `Real.log 0 = 0`, while `3 log(e/3) ≈ -0.296`.
- Sparse packing: `D = 1`, `p = 6`: the six unit vectors are pairwise at distance `2 > 1`, and
  `log 6 ≥ (1/2) log(6/5)`.
- Gaussian divergence: `d = 1`, `a = 1`, `b = 0`, `σ = 1`: `1/2`; the divergence is symmetric
  in `a, b` and vanishes iff `a = b`.

### Examples

- For `p` independent `N(0, σ²)` coordinates the maximal inequality with `t = log p` gives
  `maxⱼ |Zⱼ| ≤ 2σ√(log p)` with probability at least `1 - 2/p`.
- For `n = 100` and `k = 5`, the chi-squared upper tail at `t = 3` gives
  `‖P_K ξ‖² ≤ 5 + 2√15 + 6 ≈ 18.75` with probability at least `1 - e^{-3} ≈ 0.95`.

### Dependencies

Mathlib; Tau Ceti's chi-squared and Gaussian projection laws, nets and nuclear norm;
RandomMatrices §§2.1, 2.4.

## Layer 2: exact and stable sparse recovery

### 2.1 The restricted nullspace property

- `HasRestrictedNullspace X S`: the kernel of `X` meets the cone `C_1(S)` only at `0`, that is
  `Xδ = 0` and `‖δ_{Sᶜ}‖₁ ≤ ‖δ_S‖₁` imply `δ = 0`.
- `IsBasisPursuitSolution X y b`: `Xb = y` and `b` minimizes `‖·‖₁` on `{b' | Xb' = y}`.
  Feasibility is a separate conjunct because Mathlib's `IsMinOn f s b` does not ask for
  `b ∈ s`.
- **Exact recovery** (`hasRestrictedNullspace_iff_basisPursuit`): every `β` supported in `S` is
  the unique basis pursuit solution for `y = Xβ` iff `HasRestrictedNullspace X S` (Wainwright,
  Thm 7.8, p. 202; Foucart–Rauhut, Thm 4.4 and Thm 4.5, p. 79, with the uniform version over
  all `S` with `|S| ≤ s`).

*Needs:* Foundations 9.3 (the restricted `ℓ¹` norm).

**Checks.**

- `HasRestrictedNullspace X ∅` holds for every `X`, since `C_1(∅) = {0}`.
- `HasRestrictedNullspace` holds for `X = [[2, 1]]` and `S = {0}` (Examples).
- `HasRestrictedNullspace`, negative control: it fails for `X = [[1, 1]]` and `S = {0}`, whose
  kernel vector `(1, -1)` lies on the boundary `‖δ_{Sᶜ}‖₁ = ‖δ_S‖₁` of the cone. A definition
  with the strict cone `‖δ_{Sᶜ}‖₁ < ‖δ_S‖₁` would accept this `X`, although basis pursuit for
  `y = 1` then has the two solutions `(1, 0)` and `(0, 1)` (Examples).
- `IsBasisPursuitSolution`: for `X = [[1, 1]]` and `y = 1` the solutions are the `b ≥ 0` with
  `b₀ + b₁ = 1`, all of `ℓ¹` norm `1`.
- `IsBasisPursuitSolution`: for `X = [[2, 1]]` and `y = 1` the feasible points are `(a, 1 - 2a)`,
  of `ℓ¹` norm `|a| + |1 - 2a|`, and the only solution is `(1/2, 0)`.
- `IsBasisPursuitSolution`, negative control: for the same `X` and `y`, `b = 0` satisfies
  `IsMinOn ‖·‖₁ {b' | Xb' = 1} 0`, since `‖0‖₁ = 0`, but `X0 ≠ 1`; without the feasibility
  conjunct it would be a solution and the exact recovery equivalence would fail.

### 2.2 From restricted isometry to restricted nullspace

- **`δ₂ₛ < 1/3`** (`hasRestrictedNullspace_of_rip`): if `n^{-1/2}X` has the restricted isometry
  property of order `2s` with a constant `δ < 1/3`, then `HasRestrictedNullspace X S` for every
  `S` with `|S| ≤ s` (Wainwright, Prop 7.11, p. 204). The proof splits `δ_{Sᶜ}` into blocks of
  `s` coordinates in decreasing order of magnitude and uses
  `|⟪Xu, Xv⟫|/n ≤ δ‖u‖‖v‖` for `u, v` with disjoint supports of size at most `s`, the
  polarization form of the restricted isometry property.

*Needs:* 2.1; Foundations 9.3 (the restricted isometry property, the best `s`-sparse error).

### 2.3 Robust nullspace property and stable recovery

Throughout this section `s ≥ 1`. At `s = 0` the restricted isometry property of order `0` and
the robust nullspace property of order `0` with `τ ≥ 0` hold for every matrix, and the `ℓ²`
bound would divide by `√0`, which Lean reads as `0`: for `A = 0 ∈ ℝ^{1×1}`, `β = 1`, `y = 0`,
`η = 0` the minimizer is `β♯ = 0` and the bound would read `1 ≤ 0`.

- `HasRobustNullspace A s ρ τ`: for every `v` and every `S` with `|S| ≤ s`,
  `‖v_S‖ ≤ ρ‖v_{Sᶜ}‖₁/√s + τ‖Av‖` (the `ℓ²`-robust nullspace property, Foucart–Rauhut, Def 4.21,
  p. 87).
- **Robust nullspace from restricted isometry** (`hasRobustNullspace_of_rip`): if `A` has the
  restricted isometry property of order `2s` with `δ < 4/√41`, then `A` has the `ℓ²`-robust
  nullspace property of order `s` with `0 < ρ < 1` and `τ > 0` depending only on `δ`
  (Foucart–Rauhut, Thm 6.13 and Lemma 6.14, p. 144).
- **Stable recovery** (`stable_recovery`): under the `ℓ²`-robust nullspace property of order
  `s` with `0 ≤ ρ < 1` and `τ ≥ 0`, for every `β` and `y` with `‖Aβ - y‖ ≤ η`, every `β♯` with
  `‖Aβ♯ - y‖ ≤ η` that minimizes `‖b‖₁` on `{b | ‖Ab - y‖ ≤ η}` satisfies
  `‖β♯ - β‖₁ ≤ C σₛ(β)₁ + D√s η` and `‖β♯ - β‖ ≤ C σₛ(β)₁/√s + Dη`, with
  `C = 2(1 + ρ)²/(1 - ρ)` and `D = 2(3 + ρ)τ/(1 - ρ)` (Foucart–Rauhut, Thm 4.22, p. 88, with
  the constants of Thm 4.25, p. 89, since `‖β♯‖₁ ≤ ‖β‖₁` and `‖A(β♯ - β)‖ ≤ 2η`). The source
  asks `0 < ρ` and `τ > 0`; the proof of Thm 4.25 runs unchanged at `ρ = 0`. The sign of `τ` is
  needed: for `p = 0` every matrix has the property with every `τ`, and with `τ < 0` and `η > 0`
  the first bound would read `0 ≤ 2(3 + ρ)τ√s η/(1 - ρ) < 0`. For `p ≥ 1` the property itself
  forces `τ > 0`.
- **Stable recovery under restricted isometry** (`stable_recovery_of_rip`): for `δ < 4/√41`
  there are `C, D > 0` depending only on `δ` such that, if `A` has the restricted isometry
  property of order `2s` and constant `δ`, the two bounds of `stable_recovery` hold for every
  `β`, `y` and `β♯` as there (Foucart–Rauhut, Thm 6.12, p. 144). It is `stable_recovery` applied
  with the constants of `hasRobustNullspace_of_rip`.

For `η = 0` and `s`-sparse `β` both bounds vanish, so `β♯ = β`.

*Needs:* 2.1, 2.2; Foundations 9.3.

**Checks.**

- `HasRobustNullspace`: the identity matrix has `‖v_S‖ ≤ ‖v‖`, so it has the property for every
  `ρ ≥ 0` with `τ = 1`.
- `HasRobustNullspace`: the zero `1 × 1` matrix does not have it at `s = 1` for any `ρ`, `τ`: for
  `v = 1` and `S = {0}` it would read `1 ≤ 0`.
- `HasRobustNullspace`, the convention `s ≥ 1`: at `s = 0` only `S = ∅` occurs, and every matrix
  has the property for every `τ ≥ 0`.
- `HasRobustNullspace`, negative control on the factor `1/√s`: let the kernel of `A` (for
  instance the `3 × 4` matrix with rows `(1, -1, 0, 0)`, `(0, 1, -1, 0)`, `(0, 0, 1, -1)`) be
  spanned by `w = (1, 1, 1, 1)`, and `s = 2`. For `S = {0, 1}` the property at `v = w` reads
  `√2 ≤ ρ · 2/√2`, so it fails for every `ρ < 1`, as it must, since `(1, 1, 0, 0)` and
  `(0, 0, -1, -1)` have the same image and the same `ℓ¹` norm. Without the factor `1/√s` the
  inequality at `w` would read `√2 ≤ 2ρ` and hold with `ρ = 1/√2`.
- `stable_recovery`, negative control: for `A = (1)`, `y = 1`, `η = 0`, `β = 1` and `s = 1`, the
  point `b = 0` minimizes `‖·‖₁` in the sense of `IsMinOn` on `{b | ‖Ab - y‖ ≤ 0} = {1}`, since
  `IsMinOn` does not ask for membership, but `‖A0 - y‖ = 1 > 0`; without the feasibility
  hypothesis the bound would read `1 ≤ C σ₁(1)₁ = 0`.

### 2.4 Restricted isometry of sub-Gaussian designs

- **Sub-Gaussian designs** (`rip_of_subgaussian`): there are constants `C, c > 0` depending only
  on `K` such that, if `X` has independent centred entries of variance `1`, each with
  `HasSubgaussianMGF` of proxy `K²`, and `0 < δ < 1`, `1 ≤ s ≤ p`,
  `n ≥ Cδ⁻²s log(ep/s)`, then `n^{-1/2}X` has the restricted isometry property of order `s` and
  constant `δ` with probability at least `1 - 2exp(-cδ²n)` (Foucart–Rauhut, Thm 9.2, p. 273, in
  the form with `ε = 2exp(-δ²m/(2C))` stated after it; there the sub-Gaussian parameters are
  the tail constants of (9.1), p. 272, equivalent to a moment generating function bound (9.2)).
  The proof here differs from the source's: it applies the singular value bound of
  RandomMatrices §2.4 to each `n × s` column submatrix `X_T`, whose rows are independent
  isotropic vectors with independent coordinates and hence sub-Gaussian vectors with proxy `K²`
  (1.1), with `t` chosen so that `CK²(√s + t)/√n ≤ δ/3`, and takes the union bound over the
  `C(p, s) ≤ (ep/s)^s` supports (1.5).
- **Exact recovery from sub-Gaussian designs** (`basisPursuit_of_subgaussian`): there are
  `C, c > 0` depending only on `K` such that, for `X` as in `rip_of_subgaussian`, `1 ≤ s` and
  `2s ≤ p`, if `n ≥ Cs log(ep/s)` then with probability at least `1 - 2exp(-cn)` every vector
  supported on a set of at most `s` coordinates is the unique basis pursuit solution for its
  measurements. It is `rip_of_subgaussian` at order `2s` with `δ = 1/4`, using
  `2s log(ep/(2s)) ≤ 2s log(ep/s)`, followed by `hasRestrictedNullspace_of_rip` and
  `hasRestrictedNullspace_iff_basisPursuit`.

*Needs:* 2.1, 2.2; 1.1, 1.5; RandomMatrices §2.4.

### Examples

- `X = [[1, 1]]` (`n = 1`, `p = 2`) and `S = {0}`: the kernel is spanned by `(1, -1)`, which lies
  in `C_1(S)`, so the restricted nullspace property fails, and indeed `(1, 0)` and `(0, 1)` both
  solve basis pursuit for `y = 1`.
- `X = [[2, 1]]` and `S = {0}`: the kernel is spanned by `(1, -2)`, with
  `‖δ_{Sᶜ}‖₁ = 2 > 1 = ‖δ_S‖₁`, so the property holds, and `(1/2, 0)` is the unique basis
  pursuit solution for `y = 1`.
- Stable recovery constants: `δ = 4/√41 ≈ 0.6247` is the threshold. The identity matrix has
  `‖v_S‖ ≤ ‖v‖`, the robust nullspace property for every `ρ ≥ 0` with `τ = 1`, and at `ρ = 0`
  the constants are `C = 2(1 + ρ)²/(1 - ρ) = 2` and `D = 2(3 + ρ)τ/(1 - ρ) = 6`.

### Dependencies

Layer 1 (1.1, 1.5 for 2.4); Foundations 9.3; RandomMatrices §2.4.

## Layer 3: the lasso

Throughout, `n ≥ 1`, `y = Xβ + ε` with `β, ε` arbitrary unless a probability statement is made,
`λ > 0`, `β̂` is any lasso solution and `Δ = β̂ - β`. The **noise event**
`LassoNoiseEvent X ε λ` is `∀ j, 2|⟪X_j, ε⟫|/n ≤ λ`, that is `‖Xᵀε/n‖∞ ≤ λ/2` in the sources
(Wainwright, Thm 7.13, p. 210; van de Geer, Thm 2.1, p. 12, with `λ_ε = λ/2`).

### 3.1 Existence and optimality

- `lassoObjective X y λ β = ‖y - Xβ‖²/(2n) + λ‖β‖₁` (Wainwright, (7.18), p. 206; van de Geer,
  (2.3), p. 8, writes `‖Y - Xβ‖ₙ² + 2λ‖β‖₁`, twice this); `IsLassoSolution X y λ β̂` is
  `IsMinOn (lassoObjective X y λ) univ β̂`.
- **Existence** (`exists_isLassoSolution`): for `λ > 0` a solution exists, since the objective is
  continuous and coercive.
- **Optimality conditions** (`isLassoSolution_iff`): `β̂` is a solution iff for every `j`,
  `⟪X_j, y - Xβ̂⟫/n = λ sign(β̂ⱼ)` when `β̂ⱼ ≠ 0` and `|⟪X_j, y - Xβ̂⟫/n| ≤ λ` when `β̂ⱼ = 0`
  (van de Geer, (2.4), p. 9). The proof is Tau Ceti's
  `TauCeti.mem_subdifferential_coe_iff_isMinOn_sub` with the subdifferential of the `ℓ¹` norm
  computed coordinatewise.
- The zero vector is a solution iff `λ ≥ maxⱼ |⟪X_j, y⟫|/n`, by the optimality conditions at
  `β̂ = 0`.
- **Uniqueness of the fit** (`IsLassoSolution.fit_eq`): any two solutions `β̂, β̂'` have
  `Xβ̂ = Xβ̂'` and `‖β̂‖₁ = ‖β̂'‖₁`. The proof: the midpoint of two solutions with different fits
  has a strictly smaller objective, by strict convexity of `u ↦ ‖y - u‖²` and convexity of
  `‖·‖₁`; equal fits and equal objective values give equal `ℓ¹` norms since `λ > 0`.
- **Variational inequality** (`IsLassoSolution.variational`): for every solution and every `b`,
  `‖X(β̂ - b)‖²/n ≤ ⟪y - Xb, X(β̂ - b)⟫/n + λ(‖b‖₁ - ‖β̂‖₁)`. This is the first-order condition
  `⟪∇g(β̂), b - β̂⟫ + λ(‖b‖₁ - ‖β̂‖₁) ≥ 0` for the smooth part `g` (van de Geer, §2.4, p. 9, the
  last display), with `y - Xβ̂ = (y - Xb) - X(β̂ - b)`. It is sharper by a factor `2` than the
  comparison of objective values, which gives only `‖X(β̂ - b)‖²/(2n)` on the left.

*Needs:* Foundations 9.3 (the restricted `ℓ¹` norm); Tau Ceti `subdifferential`.

**Checks.**

- `lassoObjective`: for `n = p = 1`, `X = (1)`, `y = 3/4` and `λ = 1/2`, the objective is
  `(3/4 - β)²/2 + |β|/2`, with values `9/32` at `0`, `1/4` at `1/4` and `3/8` at `3/4`.
- `lassoObjective`: at `β = 0` it is `‖y‖²/(2n)` for every `λ`.
- `lassoObjective`, negative control: with `‖y - Xβ‖²/n` in place of `‖y - Xβ‖²/(2n)`, the same
  data have the minimizer `η_{λ/2}(3/4) = 1/2` instead of `η_λ(3/4) = 1/4`, and every threshold
  of this layer would be off by a factor `2`.
- `IsLassoSolution`: for `n = p = 1` and `X = (1)` the unique solution is `η_λ(y)`; for
  `y = 3/4`, `λ = 1/2` it is `1/4`, and the least-squares fit `3/4` is not a solution.
- `IsLassoSolution`: for `X = [[1, 1]]`, `y = 3`, `λ = 1` the solutions are the `β̂ ≥ 0` with
  `β̂₀ + β̂₁ = 2`; the residual is `1`, so both optimality conditions hold with equality, and
  `(3, -1)` is not a solution although its fit is `2`.
- `IsLassoSolution`, negative control: for `n = 2`, `p = 1`, `X = (1, 1)ᵀ`, `y = (1, 1)` and
  `λ = 1`, the zero vector is a solution, since `|⟪X, y⟫|/n = 1 ≤ λ`; a threshold without the
  factor `1/n` would require `λ ≥ 2`.

### 3.2 The cone condition and rates on the noise event

- **Slow rate** (`lasso_slow_rate`): on the noise event, for every `β`,
  `‖XΔ‖²/n ≤ (3λ/2)‖β‖₁ - (λ/2)‖β̂‖₁ ≤ (3λ/2)‖β‖₁`. No sparsity or design condition is used. The
  proof is the variational inequality with `b = β`, `⟪ε, XΔ⟫/n ≤ (λ/2)‖Δ‖₁` on the noise event,
  and `‖Δ‖₁ ≤ ‖β‖₁ + ‖β̂‖₁` (Wainwright, Thm 7.20(a), p. 217, *by the same argument*; the printed
  constant is `12`).
- **Cone condition** (`lasso_cone`): if `β` is supported in `S` then on the noise event
  `‖XΔ‖²/n + (λ/2)‖Δ_{Sᶜ}‖₁ ≤ (3λ/2)‖Δ_S‖₁`, and hence `Δ ∈ C_3(S)`. The proof uses
  `‖β‖₁ - ‖β̂‖₁ ≤ ‖Δ_S‖₁ - ‖Δ_{Sᶜ}‖₁`.
- `compatibilityConstant X S L`: the infimum `φ(S, L)` of the Conventions, as `⨅` over the
  nonzero vectors of `C_L(S)` (van de Geer, Def 2.1, p. 11, where it is `φ̂²(L, S)`, normalized
  by `‖δ_S‖₁ = 1`). For `S = ∅` the index set is empty and the infimum is `0`; every theorem
  assumes `S` nonempty, where the ratios are nonnegative and the index set contains `e_j` for
  `j ∈ S`.
- `HasRestrictedEigenvalue X S L κ`: `κ‖δ‖² ≤ ‖Xδ‖²/n` for every `δ ∈ C_L(S)` (Wainwright,
  Def 7.12, p. 208).
- **Compatibility rates** (`lasso_compatibility`): for `S` nonempty, `β` supported in `S` and
  `φ = φ(S, 3) > 0`, on the noise event
  `‖XΔ‖²/n ≤ 9λ²|S|/(4φ)` and `‖Δ‖₁ ≤ 2λ|S|/φ`. The first follows from the cone condition and
  `‖Δ_S‖₁² ≤ |S| ‖XΔ‖²/(nφ)`; the second from
  `‖XΔ‖²/n + (λ/2)‖Δ‖₁ ≤ 2λ‖Δ_S‖₁ ≤ ‖XΔ‖²/n + λ²|S|/φ`. The prediction bound is van de Geer,
  Thm 2.1, p. 12, with her `β = β⁰` supported in `S` and `λ_ε = λ/2`, so that her stretching
  factor is `3`; the `ℓ¹` bound is *by the same argument* as her Thm 2.2, p. 14.
- **Restricted eigenvalue rate** (`lasso_restrictedEigenvalue`): under
  `HasRestrictedEigenvalue X S 3 κ` with `κ > 0`, on the noise event `‖Δ‖ ≤ 3λ√|S|/(2κ)`, and
  `φ(S, 3) ≥ κ` since `‖δ_S‖₁² ≤ |S| ‖δ‖²` (Wainwright, Thm 7.13(a), p. 210, *by the same
  argument*; the printed constant is `3√s λ/κ`).

*Needs:* 3.1.

**Checks.**

- `LassoNoiseEvent`: for `n = p = 1`, `X = (1)`, `ε = -1/4` it holds exactly for `λ ≥ 1/2`; the
  inequality is not strict, so `λ = 1/2` is included.
- `LassoNoiseEvent`: `ε = 0` satisfies it for every `λ ≥ 0`, and so does every `ε` orthogonal to
  all columns.
- `LassoNoiseEvent`, negative control: for `n = p = 1`, `X = (1)`, `β = 1`, `ε = -1/4` and
  `λ = 1/4`, the bound `|⟪X_j, ε⟫|/n ≤ λ` without the factor `2` holds, but the noise event
  fails; the lasso is `η_{1/4}(3/4) = 1/2` and `‖XΔ‖²/n = 1/4 > 9/64 = 9λ²/4`, so the
  compatibility rate (with `φ = 1`) would fail without the factor `2`.
- `compatibilityConstant`: for `n = p = 1`, `X = (1)`, `S = {0}` every ratio is `1`, so
  `φ(S, L) = 1` for every `L ≥ 0`.
- `compatibilityConstant`: for `X = [[1, 1]]` and `S = {0}`, `δ = (1, -1) ∈ C_3(S)` has `Xδ = 0`,
  so `φ(S, 3) = 0`.
- `compatibilityConstant`, negative control: for `X = √2 I₂` (`n = 2`) and `S = {0, 1}`, the
  ratio is `2‖δ‖²/‖δ‖₁² ≥ 1` with equality at `δ = (1, 1)`, so `φ(S, 3) = 1`; without the factor
  `|S|` the infimum would be `1/2`, and the compatibility rates would lose a factor `2`.
- `HasRestrictedEigenvalue`: for `X = √2 I₂` and `S = {0}`, `‖Xδ‖²/n = ‖δ‖²`, so it holds with
  `κ = 1` and fails for every `κ > 1` at `δ = (1, 0)`.
- `HasRestrictedEigenvalue`: for `X = [[1, 1]]` and `S = {0}` it fails for every `κ > 0`, at
  `δ = (1, -1)`; every design satisfies it with `κ = 0`.
- `HasRestrictedEigenvalue`, negative control: for `X = √2 I₂` and `S = {0}`, a condition on
  `‖Xδ‖²` without the factor `1/n` would hold with `κ = 2`, and the rate `3λ√|S|/(2κ)` would be
  off by a factor `2`.

### 3.3 The probability of the noise event

- **Sub-Gaussian noise** (`measure_lassoNoiseEvent_ge`): if the `εᵢ` are independent with proxy
  `σ²`, `‖X_j‖²/n ≤ b` for every `j`, `t ≥ 0`, and `λ = 2σ√(2b(log p + t)/n)`, then the noise
  event has probability at least `1 - 2e^{-t}`. Each `⟪X_j, ε⟫/n` has proxy at most `bσ²/n`
  (1.1), so `P(2|⟪X_j, ε⟫|/n > λ) ≤ 2e^{-t}/p`, and the union bound over `p` columns concludes
  (Wainwright, Example 7.14, p. 211, *by the same argument*, with `b = C²` and
  `t = nδ²/2 + √(2n log p) δ`). Column normalization is `b = 1`.
- For Gaussian noise `ε ~ N(0, σ²Iₙ)` the coordinates are independent `N(0, σ²)` variables,
  with proxy `σ²` by 1.1, so the same bound holds.

*Needs:* 1.1.

### 3.4 Restricted eigenvalues from restricted isometry

- **Block argument** (`hasRestrictedEigenvalue_of_rip`): if `S` is nonempty and `n^{-1/2}X` has
  the restricted isometry property of order `37|S|` with constant `1/2`, then
  `HasRestrictedEigenvalue X S 3 κ₀` with `κ₀ = ((2/3)(1/√2 - √6/4))² ≈ 0.003989`. The proof
  sorts `Δ_{Sᶜ}` into blocks `T₁, T₂, …` of `36|S|` coordinates in decreasing order of magnitude,
  sets `T₀ = S ∪ T₁`, and uses `∑_{k ≥ 2} ‖δ_{T_k}‖ ≤ ‖δ_{Sᶜ}‖₁/√(36|S|) ≤ ‖δ_S‖/2` on
  `C_3(S)`, so that `‖δ‖ ≤ (3/2)‖δ_{T₀}‖` and
  `‖Xδ‖/√n ≥ (√(1/2) - √(3/2)/2)‖δ_{T₀}‖` (Foucart–Rauhut, Lemma 6.10 and the proof of
  Thm 6.9, p. 142, for the block decomposition).

*Needs:* 3.2; Foundations 9.3 (the restricted isometry property).

### 3.5 Random designs

- **Sub-Gaussian designs** (`hasRestrictedEigenvalue_of_subgaussian`): there are constants
  `C, c > 0` depending only on `K` such that, for `X` with independent centred entries of variance
  `1` and proxy `K²`, `1 ≤ s ≤ p` and `n ≥ Cs log(ep/s)`, with probability at least `1 - 2e^{-cn}`,
  `HasRestrictedEigenvalue X S 3 κ₀` holds simultaneously for every nonempty `S` with `|S| ≤ s`. The
  proof is 2.4 with `δ = 1/2` at order `s' = min(37s, p)` and 3.4; the restricted isometry
  property of order `p` covers every vector, and `s' log(ep/s') ≤ 37s log(ep/s)` since
  `u ↦ u log(ep/u)` is increasing on `[1, p]`.
- For a random design the deterministic theorems of 3.2 apply to each realization: for `β`
  supported in a nonempty `S` with `|S| ≤ s`, on the intersection of the restricted eigenvalue
  event and the noise event, every lasso solution satisfies `‖Δ‖ ≤ 3λ√|S|/(2κ₀)`. For a design
  independent of the noise, the noise event is bounded conditionally on the design by 3.3 with
  `b = maxⱼ ‖X_j‖²/n`.

*Needs:* 2.4, 3.2–3.4.

### 3.6 Orthogonal designs and soft thresholding

- **Orthogonal design** (`isLassoSolution_iff_softThreshold`): if `XᵀX/n = I_p`, the lasso
  solution is unique and is `β̂ⱼ = η_λ(zⱼ) = sign(zⱼ)(|zⱼ| - λ)₊` with `z = Xᵀy/n`. The objective
  is `‖y‖²/(2n) + ∑ⱼ (βⱼ²/2 - zⱼβⱼ + λ|βⱼ|)`, a sum of strictly convex one-dimensional problems
  (Giraud, §5.2.2 and (5.7), pp. 92–94, *by the same argument*, for the criterion
  `‖Y - Xβ‖² + λ|β|₁` with `XᵀX = I_p`).
- Under the same design, ridge regression `(XᵀX + λI)⁻¹Xᵀy` is `nz/(n + λ)` for `λ ≥ 0`, since
  `XᵀX + λI = (n + λ)I`: it shrinks every coordinate of `z` by the same factor and sets none to
  zero.

*Needs:* 3.1; MathematicalStatisticsNonparametric 6.4 (the soft-threshold map).

### 3.7 Support recovery by the primal–dual witness

Let `β` be supported in `S` with `|S| = s ≥ 1`, `Σ̂_SS = X_SᵀX_S/n`, and let `Π` be the orthogonal
projection onto the orthogonal complement of the column span of `X_S`.

- **Deterministic theorem** (`lasso_support_recovery`): assume `λ_min(Σ̂_SS) ≥ c_min > 0`, the
  mutual incoherence `max_{j ∉ S} ∑_{k ∈ S} |((X_SᵀX_S)⁻¹X_SᵀX_j)ₖ| ≤ α` with `0 ≤ α < 1`, and
  `λ ≥ (2/(1 - α)) max_{j ∉ S} |⟪X_j, Πε⟫|/n`. Then the lasso has exactly one solution, it is
  supported in `S`, and `maxⱼ∈S |β̂ⱼ - βⱼ| ≤ B` with
  `B = maxⱼ∈S (|(Σ̂_SS⁻¹ X_Sᵀε/n)ⱼ| + λ ∑ₖ∈S |(Σ̂_SS⁻¹)ⱼₖ|)`, at most Wainwright's `B`, the
  sum of the two maxima. Every `j ∈ S` with `|βⱼ| > B` has
  `β̂ⱼ ≠ 0` and `sign β̂ⱼ = sign βⱼ` (Wainwright, Thm 7.21, p. 220). The proof constructs the
  restricted solution on `S`, its dual vector `ẑ_{Sᶜ}`, checks strict dual feasibility
  `|ẑⱼ| ≤ (1 + α)/2 < 1` for `j ∉ S` from incoherence, and deduces uniqueness from the uniqueness
  of the fit (3.1) and the invertibility of `Σ̂_SS` (Wainwright, Lemma 7.23, p. 223, and §7.5.2,
  pp. 222–224).
- **Sub-Gaussian noise** (`lasso_support_recovery_prob`): if moreover `p > s`, the `εᵢ` are
  independent with proxy `σ² > 0`, `‖X_j‖ ≤ C√n` for every `j`, `δ > 0`, and
  `λ = (2Cσ/(1 - α))(√(2 log(p - s)/n) + δ)`, then with probability at least `1 - 4e^{-nδ²/2}`
  the conclusions of the deterministic theorem hold and the first term of `B` is at most
  `c_min^{-1/2} σ(√(2(log s)/n) + δ)` (Wainwright, Cor 7.22, pp. 220–221). The noise level is
  positive: at `σ = 0` the prescribed `λ` is `0`, and for `p > n` the least-squares solutions
  are not unique. Each half of the probability is a union bound over at most `p - s`,
  respectively `s`, sub-Gaussian variables with proxy `σ²C²/n`, respectively `σ²/(c_min n)` (1.1).

*Needs:* 3.1; 1.1, 1.4 (the `∞ → ∞` bounds).

### 3.8 Debiased estimation

Let `X : Ω → Matrix (Fin n) (Fin p) ℝ` and `ε : Ω → EuclideanSpace ℝ (Fin n)` be independent,
`ε ~ N(0, σ²Iₙ)`, `y = Xβ + ε`, `β̂` any measurable estimator, `Θ̂ = Θ̂(X)` a measurable function
of the design only, and `Σ̂ = XᵀX/n`.

- `debiasedEstimator X Θ̂ y β̂ = β̃ = β̂ + Θ̂Xᵀ(y - Xβ̂)/n`, the de-sparsified lasso when `β̂` is a
  lasso solution (van de Geer, Def 5.1, p. 63, whose `Θ̂ᵀ` is the `Θ̂` here).
- **Exact decomposition** (`debiased_decomposition`):
  `√n(β̃ - β) = Θ̂Xᵀε/√n + √n(I - Θ̂Σ̂)(β̂ - β)`, and, if every entry of `Θ̂Σ̂ - I` is at most `b`
  in absolute value, each coordinate of the second term is at most `√n b ‖β̂ - β‖₁` in
  absolute value (van de Geer, Thm 5.1, p. 64, *by the same argument*).
- **Conditional law** (`condDistrib_debiased_main`): the conditional law of `Θ̂Xᵀε/√n` given
  `X` is `multivariateGaussian 0 (σ² Θ̂Σ̂Θ̂ᵀ)` almost everywhere, as the image of `N(0, σ²Iₙ)`
  under the linear map `Θ̂(x)xᵀ/√n`.
- **Coverage** (`tendsto_debiased_coverage`): along `n → ∞` with `p = p(n)`, fix a coordinate
  `j = j(n)` and `α ∈ (0, 1)`, let `z` satisfy `cdf (gaussianReal 0 1) z = 1 - α/2`, and write
  `vⱼ = (Θ̂Σ̂Θ̂ᵀ)ⱼⱼ`. If `σ > 0`, `√n maxₖ |(Θ̂Σ̂ - I)ⱼₖ| ‖β̂ - β‖₁ → 0` in probability, a
  measurable `σ̂ → σ` in probability and `P(vⱼ ≥ c) → 1` for some `c > 0`, then
  `P(|β̃ⱼ - βⱼ| ≤ zσ̂√(vⱼ/n)) → 1 - α` (van de Geer, Thm 5.2, p. 65, for a fixed design, *by the
  same argument*). The proof writes `√n(β̃ⱼ - βⱼ) = Mₙ + Rₙ` with the main term
  `Mₙ = (Θ̂Xᵀε)ⱼ/√n` and `|Rₙ| ≤ √n maxₖ |(Θ̂Σ̂ - I)ⱼₖ| ‖β̂ - β‖₁ → 0` by the decomposition. By
  the conditional law, `P(Mₙ/(σ√vⱼ) ∈ A, vⱼ ≥ c) = P(vⱼ ≥ c) P(N(0, 1) ∈ A)`; since
  `P(vⱼ ≥ c) → 1`, `Rₙ/√vⱼ → 0` and `σ̂/σ → 1` in probability, Slutsky's lemma
  (Foundations 8.4, with 8.3) and the continuity of the Gaussian distribution function at `±z`
  conclude.

*Needs:* 3.1; Foundations 8.3, 8.4; Mathlib `condDistrib`, `multivariateGaussian`.

**Checks.**

- `debiasedEstimator` with `Θ̂ = 0` is `β̂`.
- `debiasedEstimator`: for `n = p = 1`, `X = (2)`, `Σ̂ = 4` and `Θ̂ = 1/4`,
  `β̃ = β̂ + 2(y - 2β̂)/4 = y/2`, the least-squares estimator, for every `β̂`; then `vⱼ = 1/4`
  and the main term `ε/2` has law `N(0, σ²/4)`.
- `debiasedEstimator`, negative control: for `n = 2`, `p = 1`, `X = (1, 1)ᵀ`, `Σ̂ = 1` and
  `Θ̂ = 1`, `β̃ = (y₁ + y₂)/2`; without the factor `1/n` the correction would give
  `y₁ + y₂ - β̂`, which depends on `β̂` and is not the least-squares estimator.

### Examples

- `n = p = 1`, `X = (1)`: the lasso is `η_λ(y)`. For `β = 1`, `ε = -1/4` and `λ = 1/2` the noise
  event holds, `β̂ = η_{1/2}(3/4) = 1/4`, `‖XΔ‖² = 9/16 = 9λ²/4`: the compatibility rate (with
  `φ = 1`) and the restricted eigenvalue rate `|Δ| ≤ 3λ/2` (with `κ = 1`) are attained, and
  `|Δ| = 3/4 ≤ 2λ`.
- The same design with `λ = 1/4`: the noise event fails, `β̂ = 1/2`, and
  `‖XΔ‖² = 1/4 > 9λ²/4`, while the slow rate `1/4 ≤ (3λ/2) - (λ/2)(1/2) = 5/16` still holds.
- `X = [[1, 1]]` (`n = 1`, `p = 2`), `S = {0}`: `δ = (1, -1) ∈ C_3(S)` has `Xδ = 0`, so
  `φ(S, 3) = 0` and no restricted eigenvalue condition holds, while the slow rate still applies.
  The solutions for `y = 3`, `λ = 1` are the `β̂ ≥ 0` with `β̂₀ + β̂₁ = 2`, all with the same fit
  `2` and the same `‖β̂‖₁ = 2`.
- `X = √2 I₂` (`n = p = 2`), `S = {0}`: `Σ̂ = I`, `φ(S, 3) = 1` and the restricted eigenvalue
  condition holds with `κ = 1`; the lasso is soft thresholding of `z = Xᵀy/2`.
- Primal–dual witness for an orthogonal design: `α = 0`, `c_min = 1`, and for `j ∈ S` with
  `|zⱼ| > λ`, `β̂ⱼ - βⱼ = ⟪X_j, ε⟫/n - λ sign(zⱼ)`, so `|β̂ⱼ - βⱼ| ≤ |⟪X_j, ε⟫|/n + λ ≤ B`, with
  equality in the first bound when `⟪X_j, ε⟫` is `0` or of sign opposite to `zⱼ`.
- `X = [[2, 1]]` (`n = 1`, `p = 2`), `S = {0}`: `Σ̂_SS = 4`, the incoherence is `α = 1/2`, `Π = 0`,
  and the lasso is `(sign(y)(|y|/2 - λ/4)₊, 0)`, with `B = |ε|/2 + λ/4`.
- Debiasing with `p ≤ n`, `Σ̂` invertible and `Θ̂ = Σ̂⁻¹`: `β̃` is the least-squares estimator
  for every `β̂`, the second term vanishes, and `vⱼ = (Σ̂⁻¹)ⱼⱼ`.
- Ridge for `n = 1`, `X = (1)`, `y = 3`, `λ = 2`: `3/(1 + 2) = 1`.

### Dependencies

Layers 1 and 2 (2.4 for 3.5); Foundations 8.3, 8.4, 9.3; MathematicalStatisticsNonparametric
6.4 (the soft-threshold map).

## Layer 4: model selection in the Gaussian regression model

Throughout, `Y = f + σξ` in `EuclideanSpace ℝ (Fin n)` with `ξ ~ stdGaussian`, `n ≥ 1` and
`σ > 0`, and `P_K` is the orthogonal projection onto a subspace `K`.

### 4.1 Penalized model selection

Let `M` be a countable type, `(S_m)` subspaces of dimensions `d_m`, and `π : M → ℝ` with
`π_m > 0` and `∑ π_m ≤ 1` (summable). For a penalty `pen : M → ℝ` the criterion is
`crit(m, Y) = ‖Y - P_{S_m} Y‖ₙ² + pen(m)`, in Lean `penalizedCriterion`.

- **Selectors** (`exists_measurable_penalizedSelector`): if `M` is nonempty and
  `pen(m) ≥ κσ²(d_m + log(1/π_m))/n` with `κ > 0`, a minimizer of `crit(·, Y)` exists for every
  `Y`, and there is a measurable selector `m̂` with `m̂(Y)` a minimizer. Nonemptiness is needed
  here (for `M` empty there is no map into `M`); the oracle inequality below takes `m̂` as given.
  For fixed `Y` and any `m₀ ∈ M`,
  only finitely many `m` have `pen(m) ≤ crit(m₀, Y)`, since `π_m ≥ exp(-n crit(m₀, Y)/(κσ²))`
  for them and `∑ π_m ≤ 1`. The smallest minimizer in an enumeration of `M` is measurable.
- **Oracle inequality** (`penalized_model_selection`): there is a universal `κ₀` such that for
  every `κ > κ₀` there is `C(κ)` with the following property. For every `n ≥ 1`, `σ > 0`, `f`,
  family `(S_m, π_m)`, penalty with `pen(m) ≥ κσ²(d_m + log(1/π_m))/n`, and measurable selector
  `m̂`, the squared error `‖P_{S_{m̂}} Y - f‖ₙ²` is integrable and
  `E‖P_{S_{m̂}} Y - f‖ₙ² ≤ C(κ)(inf_m (‖f - P_{S_m} f‖ₙ² + pen(m)) + σ²/n)`
  (Giraud, Thm 2.2, p. 37; Massart, Thm 4.2, p. 90, whose penalty hypothesis (4.6) is likewise a
  lower bound). Giraud's penalty is
  `Kσ²(√d_m + √(2 log(1/π_m)))²` with `K > 1`, which is at most `4Kσ²(d_m + log(1/π_m))`, so
  `κ₀ = 4` follows from his proof. The proof assigned here replaces his Gaussian concentration
  step by the exponential moment of 1.2: compare the criterion at `m̂` and at a fixed `m`,
  reduce to `σ²‖P_{m'}ξ‖²` with `P_{m'}` the projection onto `S_{m'} + span(f - P_{S_m} f)` of
  dimension at most `d_{m'} + 1`, and bound
  `E sup_{m'} (‖P_{m'}ξ‖² - κ₁(d_{m'} + 1 + log(1/π_{m'})))₊` by a universal constant through
  `E exp(‖P_{m'}ξ‖²/4) = 2^{(d_{m'} + 1)/2}` and `∑ π_{m'} ≤ 1`. This route gives `κ₀ = 8`.

*Needs:* 1.2.

**Checks.**

- `crit`: for `n = 2`, `S = span(e₁)` and `Y = (3, 4)`, `‖Y - P_S Y‖ₙ² = 16/2 = 8`, so
  `crit = 8 + pen`; without the factor `1/n` it would be `16`.
- `crit`: for `S = ⊥` it is `‖Y‖ₙ² + pen`, and for `S` the whole space it is `pen`.
- `crit`, negative control: the projected norm `‖P_S Y‖ₙ²` in place of the residual gives
  `9/2` in the first check, and the selector would then prefer the smallest model.
- Selector: `n = 1`, `κ = σ = 1`, `M = {0, 1}`, `S₀ = ⊥`, `S₁ = ℝ`, `π = (1/2, 1/2)` and
  `pen(m) = d_m + log 2`: `crit(0, Y) = Y² + log 2` and `crit(1, Y) = 1 + log 2`, so the smallest
  minimizer is `1` exactly when `Y² > 1`.
- Selector, negative control: for `M = ℕ`, `n = 1`, `S_m = ⊥` and `pen(m) = 1/(m + 1)` the
  criterion has infimum `‖Y‖²`, not attained; this penalty violates the hypothesis, since
  `log(1/π_m) → ∞` for every summable `π`.

### 4.2 Akaike's and Schwarz's criteria

The Gaussian log-likelihood with known `σ²` is
`ℓ(g; Y) = -(n/2) log(2πσ²) - ‖Y - g‖²/(2σ²)` (`gaussLogLik`), maximized over `g ∈ S` at
`P_S Y`.

- **Optimism** (`aic_optimism`): for a subspace `S` of dimension `k` and any `f`, with `Y'` an
  independent copy of `Y`, `E[ℓ(P_S Y; Y) - ℓ(P_S Y; Y')] = k`, whether or not `f ∈ S`.
  It is the identity
  `E‖Y' - P_S Y‖² - E‖Y - P_S Y‖² = 2kσ²`, from
  `E‖Y - P_S Y‖² = ‖f - P_S f‖² + (n - k)σ²` and
  `E‖Y' - P_S Y‖² = ‖f - P_S f‖² + (n + k)σ²`, by `E‖P_S ξ‖² = k`.
- Fix `J` and integers `k₁ < ⋯ < k_J`, and for each `n ≥ k_J` nested subspaces
  `S₁ ⊂ ⋯ ⊂ S_J` of `EuclideanSpace ℝ (Fin n)` with `dim S_j = k_j`, and `fₙ`. Akaike's criterion
  is `AIC_j = ‖Y - P_{S_j} Y‖²/σ² + 2k_j` and Schwarz's is
  `BIC_j = ‖Y - P_{S_j} Y‖²/σ² + k_j log n`, each `-2ℓ` plus the penalty, up to the constant
  `n log(2πσ²)`. The selectors `aicSelector` and `bicSelector` return the smallest minimizing
  index, `smallestArgmin`.
- **Akaike overfits** (`aic_overfit`): let `j₀ < J` be fixed, `fₙ ∈ S_{j₀}` for every `n`, and,
  if `j₀ > 1`, `‖fₙ - P_{S_{j₀ - 1}} fₙ‖²/log n → ∞`. Then
  `liminf P(Ĵ_AIC > j₀) ≥ P(χ²_d > 2d) > 0` with `d = k_{j₀ + 1} - k_{j₀}`. The proof: for every
  `n`, `P(AIC_{j₀ + 1} < AIC_{j₀}) = P(χ²_d > 2d)` exactly, since the difference is
  `2d - ‖(P_{S_{j₀+1}} - P_{S_{j₀}})ξ‖²` and the projection difference has rank `d` (1.2). On
  that event `j₀` is not a minimizer, so `Ĵ_AIC > j₀` unless `Ĵ_AIC < j₀`, and the probability of
  selecting an index below `j₀` tends to `0` as in the next item.
- **Schwarz is consistent** (`bic_consistent`): under the same hypotheses
  `P(Ĵ_BIC = j₀) → 1`. For `j > j₀`,
  `P(BIC_j < BIC_{j₀}) = P(χ²_{k_j - k_{j₀}} > (k_j - k_{j₀}) log n) → 0`.
  For `j < j₀`, `BIC_j - BIC_{j₀} = ‖(P_{S_{j₀}} - P_{S_j})Y‖²/σ² - (k_{j₀} - k_j) log n` with
  `‖(P_{S_{j₀}} - P_{S_j}) fₙ‖ ≥ ‖fₙ - P_{S_{j₀-1}} fₙ‖ = aₙ`, and
  `‖a + σg‖² ≥ ‖a‖² - 2σ|⟪a, g⟫|` with `⟪a, g⟫/‖a‖` standard Gaussian, so the probability that
  it is at most `0` tends to `0` because `aₙ²/log n → ∞`. The number of indices is fixed, so the
  union bound concludes.

*Needs:* 1.1, 1.2.

**Checks.**

- `ℓ`: for `n = 1`, `σ = 1` and `g = Y`, `ℓ = -(1/2) log(2π) ≈ -0.9189`.
- `ℓ`, negative control: for `n = 1`, `σ = 2` and `g = Y`, `ℓ = -(1/2) log(8π) ≈ -1.6121`;
  writing `log(2πσ)` in place of `log(2πσ²)` would give `-(1/2) log(4π) ≈ -1.2655`.
- `ℓ`: for `n = 1`, `σ = 1`, `Y = 1` and `g = 0`, `ℓ = -0.9189 - 1/2`; the maximizer over
  `S = ℝ` is `g = Y`.
- Smallest minimizer: for `c = (1, 0, 0)` (indices `0, 1, 2`) it is `1`; the largest minimizer
  would be `2`.
- Smallest minimizer: for a constant `c` it is `0`; for `J = 1` it is `0`.
- Akaike selector: `J = 2`, `n = 1`, `σ = 1`, `S₁ = ⊥`, `S₂ = ℝ`: `AIC₁ = Y²` and `AIC₂ = 2`,
  so the larger model is selected exactly when `Y² > 2`, with probability `P(χ²₁ > 2) ≈ 0.1573`
  for `f = 0`, the bound of the overfitting bullet with `d = 1`.
- Akaike selector: at a tie `Y² = 2` the smaller index is returned.
- Akaike selector, the factor `1/σ²`: with `σ = 2` in the same setting, `AIC₁ = Y²/4` and
  `AIC₂ = 2`, so the larger model is selected exactly when `Y² > 8`, not `Y² > 2`.
- Schwarz selector, negative control: in the same setting `BIC₂ = log 1 = 0`, so the larger
  model is selected whenever `Y ≠ 0`; the Schwarz penalty `log n` is below Akaike's `2` for
  `n ≤ 7` (`e² ≈ 7.389`), and its consistency is a statement about large `n`.
- Schwarz selector: for `n = 100`, `σ = 1`, `S₁ = ⊥` and `S₂` a line, `S₂` is selected exactly
  when `‖P_{S₂} Y‖² > log 100 ≈ 4.605`, against `‖P_{S₂} Y‖² > 2` for Akaike's.
- Schwarz selector, ties: in the same setting with `‖P_{S₂} Y‖² = log 100`, the two criteria
  agree and the smaller index is returned.

### 4.3 The upper bound for sparse regression

Let `X` be a fixed `n × p` design, `f = Xβ`, and for `m ⊆ Fin p` let `S_m = columnSpan X m` be
the span of the columns indexed by `m`, and `π_m = subsetWeight p m = 2^{-|m|-1} C(p, |m|)^{-1}`.

- The weights satisfy `∑_m π_m = 1 - 2^{-p-1} ≤ 1` and
  `log(1/π_m) ≤ (|m| + 1) log 2 + |m| log(ep/|m|)` for `m` nonempty (1.5).
- **Upper bound** (`sparse_regression_upper`): for every `κ > κ₀` there is `C`, depending only
  on `κ`, such that the penalized estimator of 4.1 with these subspaces and
  `pen(m) = κσ²(d_m + log(1/π_m))/n` has integrable squared error and satisfies
  `sup {E_f ‖f̂ - f‖² | f ∈ V_D(X)} ≤ Cσ² D log(ep/D)` for `1 ≤ D ≤ p`, where `V_D(X)` is the set
  of `Xβ` with `β` having exactly `D` nonzero coordinates (Giraud, (3.16), p. 67, *by the same
  argument*: he takes `π_m = C(p, |m|)^{-1} e^{-|m|}(e - 1)/(e - e^{-p})` and `D ≤ p/2`, with
  `log(p/D)` in place of `log(ep/D)`). The oracle term at `m = supp β` vanishes, `d_m ≤ D`, and
  `log(ep/D) ≥ 1` absorbs the remaining terms.

*Needs:* 4.1; 1.5.

**Checks.**

- Weights for `p = 4`: `π_∅ = 1/2`, `π_m = 1/16` for `|m| = 1`, `π_m = 1/32` for `|m| = 4`, and
  `∑_m π_m = ∑_{k ≤ 4} 2^{-k-1} = 31/32`.
- Weights, the logarithmic bound at `p = 4`, `|m| = 1`:
  `log 16 ≈ 2.773 ≤ 2 log 2 + log(4e) ≈ 3.773`.
- Weights, negative control: the uniform weights `2^{-p}` on all subsets have
  `log(1/π_m) = p log 2` for every `m`, which at `p = 10`, `|m| = 1` is `6.931`, above
  `2 log 2 + log(10e) ≈ 4.689`; the factor `C(p, |m|)^{-1}` is what makes the bound depend on
  `|m|` only.
- Column span: for `X = I₂` and `m = {0}` it is `span(e₀)`, of dimension `1`; for `m = ∅` it
  is `⊥`.
- Column span, negative control: for the `1 × 2` design `[[1, 1]]` and `m = {0, 1}` it has
  dimension `1`, not `|m| = 2`, so `d_m ≤ |m|` can be strict.

### Examples

- Optimism, `n = k = 1`, `S = ℝ`: `P_S Y = Y`, `E‖Y' - Y‖² = 2σ²`, and the optimism is `1`.
- Akaike's overfitting probability: `P(χ²₁ > 2) ≈ 0.1573` for `d = 1`,
  `P(χ²₂ > 4) = e^{-2} ≈ 0.1353` for `d = 2`.
- Schwarz's criterion against one superfluous dimension: `P(χ²₁ > log n)` is `≈ 0.0319` at
  `n = 100` and `≈ 0.0086` at `n = 1000`.
- Weights for `p = 4`: `∑_m π_m = ∑_{k ≤ 4} 2^{-k-1} = 31/32`.

### Dependencies

Layer 1 (1.1, 1.2, 1.5).

## Layer 5: sparse minimax rates

Throughout, `Θ_s = sparseVectors p s = {θ ∈ EuclideanSpace ℝ (Fin p) | hammingNorm θ ≤ s}`, the
Gaussian sequence experiment is `P_θ = N(θ, σ²I)` (`gaussianLocationKernel`), the coordinatewise
soft-threshold map is `η_λ = softThresholdVec λ`, and minimax risks are Mathlib's `minimaxRisk` for
the squared loss, as in the Conventions.

### 5.1 The risk of soft thresholding

- `softThresholdRisk λ μ = E(η_λ(μ + Z) - μ)²` for `Z ~ N(0, 1)`.
- **One-coordinate bounds** (consumed, not targets here): for `λ ≥ 0`,
  `softThresholdRisk λ 0 ≤ e^{-λ²/2}` and
  `softThresholdRisk λ μ ≤ softThresholdRisk λ 0 + min(1 + λ², μ²)`
  (Johnstone, (8.7), p. 220, and Lemma 8.3, p. 220, with (8.12), p. 221). These are the risk at
  zero and the risk bound of MathematicalStatisticsNonparametric 6.4, which also owns
  `softThreshold` and `softThresholdRisk`; this roadmap carries local copies of the two
  definitions only.
- **Scaled vector form** (`softThreshold_vec_risk_le`): for `σ > 0`, `λ ≥ 0` and
  `Y ~ N(θ, σ²I)`, `E‖η_{σλ}(Y) - θ‖² = σ² ∑ⱼ softThresholdRisk λ (θⱼ/σ)`, coordinatewise from
  `η_{σλ}(σx) = σ η_λ(x)`, and hence
  `E‖η_{σλ}(Y) - θ‖² ≤ σ² ∑ⱼ (e^{-λ²/2} + min(1 + λ², θⱼ²/σ²))` by the one-coordinate bounds.
- **Known sparsity** (`softThreshold_sparse_risk_le`): for `σ > 0`, `1 ≤ s`, `2s ≤ p`,
  `θ ∈ Θ_s` and the threshold `σ√(2 log(p/s))`, the risk is at most `2σ²s(1 + log(p/s))`, hence
  at most `(2 + 2/log 2) σ² s log(p/s)` (Johnstone, (8.44), p. 231). In the scaled vector form
  the terms `e^{-λ²/2}` sum to `p e^{-log(p/s)} = s` and the at most `s` nonzero terms
  `min(1 + λ², ·)` to at most `s(1 + 2 log(p/s))`; the second form uses `log(p/s) ≥ log 2`.
- **Universal threshold** (`softThreshold_universal_risk_le`): for `σ > 0`, `p ≥ 1`, `θ ∈ Θ_s`
  and the threshold `σ√(2 log p)`, the risk is at most `σ²(1 + s(1 + 2 log p))`: in the
  scaled vector form the terms `e^{-λ²/2}` sum to `p e^{-log p} = 1`. The weaker bound
  `(2 log p + 1)(s + 1)σ²` is the soft-threshold oracle inequality of
  MathematicalStatisticsNonparametric 6.4 at `θ ∈ Θ_s`.

*Needs:* MathematicalStatisticsNonparametric 6.4 (the soft-threshold map and its one-coordinate
risk bounds); Mathlib `gaussianReal`, `stdGaussian`.

**Checks.**

- `softThresholdRisk 0 0 = 1`, the risk of `Y` itself; `softThresholdRisk 1 0 ≈ 0.1507`, below
  `e^{-1/2} ≈ 0.6065`; `softThresholdRisk 2 5 ≈ 4.996`, below `1 + 2² = 5`.
- Vector soft thresholding: `η₁(3, 1/2, -3) = (2, 0, -2)`, and `η₀` is the identity.
- Vector soft thresholding, negative control: hard thresholding at `1` gives `(3, 0, -3)`, and
  dropping the sign gives `(2, 0, 2)`.
- Location experiment: for `p = 1`, `σ = 2` and `θ = 1` it is `N(1, 4)`, with
  `E(Y - θ)² = σ² = 4`; reading `σ` as the variance would give `2`.
- Location experiment: at `σ = 0` it is the Dirac law at `θ`; `σ` and `-σ` give the same law,
  since `stdGaussian` is symmetric.
- Location experiment: the soft-threshold risk at `λ = 0` (the estimator `Y`) is `pσ²`.
- Sparse vectors: `0 ∈ Θ₀`; `(1, 0, 0) ∈ Θ₁` and `(1, 1, 0) ∉ Θ₁`; `Θ_p` is the whole space.
- Universal threshold, sharpness: for `p = 1`, `s = 0` and `θ = 0` the threshold is `0`, the
  estimator is `Y`, and the risk `σ²` equals the bound `σ²(1 + 0)`.
- Known sparsity, negative control: the hypothesis `1 ≤ s` is needed; at `s = 0` Lean's
  `p / 0 = 0` and `Real.log 0 = 0` make the threshold and the bound `0`, while the risk at
  `θ = 0` is `pσ²`.

### 5.2 The lower bound for sparse regression

Let `X` be an `n × p` design, `1 ≤ D_max`, `5D_max ≤ p`, and let `c̲ > 0` and `c̄` satisfy
`c̲‖β‖ ≤ ‖Xβ‖ ≤ c̄‖β‖` for every `β` with `hammingNorm β ≤ 2D_max` (for instance the infimum and
the supremum of `‖Xβ‖/‖β‖` over the nonzero such `β`, Giraud, (3.10), p. 64); then
`c̄ ≥ c̲ > 0`. The model is `Y = f + σξ`, `σ > 0`, with `f ∈ V_D(X)` (4.3).

- **Lower bound** (`sparse_regression_lower`): there is a universal `c > 0` such that for every
  such design and `1 ≤ D ≤ D_max`,
  `minimaxRisk ≥ c (c̲/c̄)² σ² D log(p/(5D))`, the minimax risk over `V_D(X)` for the loss
  `‖f̂ - f‖²` (Giraud, Thm 3.5, p. 64, with a universal constant in place of the printed
  `e/(4(2e + 1)²)`, and Fano's method in place of Birgé's lemma). Two regimes, which give
  `c = min(1/32, 1/(128 log 2))`:
  - if `(D/2) log(p/(5D)) ≥ 4 log 2`, Fano's method in the minimax form of
    MathematicalStatisticsNonparametric 2.6, with the packing `C` of 1.5 (so `|C| ≥ 16 ≥ 2`):
    for `ω ∈ C` put `f_ω = X(aω)` with `a² = σ² log(p/(5D))/(4c̄²)`. Then
    `‖f_ω - f_ω'‖² ≥ c̲²a²D = (2s)²`, `s ≥ 0`, and the divergence to the reference probability
    measure `N(0, σ²I)` is `‖f_ω‖²/(2σ²) ≤ (1/4) log |C|`, finite (1.5, the Gaussian divergence),
    so the Fano bound is at least `1 - 1/4 - log 2/log |C| ≥ 1/2` and the risk at least
    `s²/2 = c̲²σ²D log(p/(5D))/(32c̄²)`;
  - otherwise `D log(p/(5D)) < 8 log 2`, and Le Cam's two-point method in the minimax form of
    MathematicalStatisticsNonparametric 2.2, with `f₀ = Xβ₀`, `f₁ = X(β₀ + (σ/c̄)e_j)` for a `β₀`
    with exactly `D` positive coordinates and `j` in its support, so that `f₀, f₁ ∈ V_D(X)` and
    `‖f₀ - f₁‖ ≥ c̲σ/c̄ = 2s`: the divergence is at most `1/2`, so `tvDist ≤ 1` by Pinsker's
    inequality (Tau Ceti `TauCeti.etvDist_sq_le_two_mul_klDiv`), and the risk is at least
    `s²/4 = (c̲/c̄)²σ²/16`.
- **Matching rate** (`sparse_regression_minimax_rate`): there are universal `0 < c` and `0 < C`
  such that for such a design and `1 ≤ D ≤ D_max` with `25D ≤ p`,
  `c (c̲/c̄)² σ² D log(p/(5D)) ≤ minimaxRisk ≤ Cσ² D log(p/(5D))` over `V_D(X)`. The lower bound
  is the previous bullet; the upper bound is the deterministic kernel of the estimator of 4.3,
  with a measurable selector from 4.1, and
  `log(ep/D) ≤ (1 + (1 + log 5)/log 5) log(p/(5D))` when `p/(5D) ≥ 5`.

*Needs:* 1.5, 4.1, 4.3; MathematicalStatisticsNonparametric 1.3, 2.2, 2.4 and 2.6 (the
Gaussian divergence, Le Cam's two-point method, Fano's method); Tau Ceti
`etvDist_sq_le_two_mul_klDiv`; Mathlib `Kernel.deterministic`.

**Checks.**

- The constant: `1/32 = 0.03125` and `1/(128 log 2) ≈ 0.01127`, so `c ≈ 0.01127`.
- Fano regime: `|C| ≥ 16` gives `1 - 1/4 - log 2/log 16 = 1/2`.
- Boundary: at `p = 5D` the factor `log(p/(5D))` is `0` and the bound is trivial.
- Design constants, negative control: taken over `D`-sparse `β` in place of `2D_max`-sparse
  ones the bound fails. The `1 × p` design of ones with `D = D_max = 1` has `c̲ = c̄ = 1` on
  `1`-sparse vectors, while `V_1(X) ⊆ ℝ` has minimax risk at most `σ²` (the estimator `Y`),
  below `cσ² log(p/5)` for large `p`. Over `2`-sparse vectors `c̲ = 0`, since
  `X(e₀ - e₁) = 0`.
- Matching rate: at `p/(5D) = 5`, `log(ep/D) = 1 + 2 log 5 ≈ 4.219` and
  `(1 + (1 + log 5)/log 5) log 5 = 1 + 2 log 5`, with equality.

### 5.3 The minimax rate in the Gaussian sequence model

- **Sparse minimax rate** (`sparse_minimax_rate`): there are universal `0 < c ≤ C` such that
  for `σ > 0`, `1 ≤ s` and `2s ≤ p`,
  `cσ²s log(p/s) ≤ minimaxRisk ≤ Cσ²s log(p/s)` over `Θ_s` (Johnstone, Prop 8.20, p. 243, in the
  form `σ²s(1 + log(p/s))` for `k ≥ 1`, `n ≥ 2`, comparable since `log(p/s) ≥ log 2`). The upper
  bound is the deterministic kernel of soft thresholding at `σ√(2 log(p/s))` (5.1). For the lower
  bound:
  - if `25s ≤ p`, 5.2 with `X = I_p` (`c̲ = c̄ = 1`) and `D = D_max = s`, since `V_s(I) ⊆ Θ_s`
    and `log(p/(5s)) ≥ log(p/s)/2`;
  - if `25s > p`, then `log(p/s) < log 25`, and Assouad's lemma in the metric minimax form of
    MathematicalStatisticsNonparametric 2.6, on the cube `{σω | ω ∈ {0, 1}^S}` for a fixed `S`
    with `|S| = s` and `c = σ² > 0`, gives risk at least `σ²s/16`: neighbours have divergence
    `1/2`, hence `tvDist ≤ 1` by Pinsker's inequality. This step uses only `s ≤ p`.
- **Universal threshold** (`softThreshold_universal_near_minimax`): for `0 ≤ a < 1` there is
  `C(a)` such that for `σ > 0`, `p ≥ 3`, `1 ≤ s ≤ p^a` and `θ ∈ Θ_s`, the risk of soft
  thresholding at `σ√(2 log p)` is at most `C(a)` times the minimax risk over `Θ_s`. By 5.1 the
  risk is at most `σ²(1 + s(1 + 2 log p)) ≤ 2σ²s(1 + log p)`. When `2s ≤ p` the lower bound
  above applies and `log(p/s) ≥ (1 - a) log p`; when `2s > p`, `s ≤ p^a` forces
  `p < 2^{1/(1 - a)}`, which bounds `log p`, and the Assouad step above gives the minimax
  risk at least `σ²s/16`.

*Needs:* 5.1, 5.2; MathematicalStatisticsNonparametric 1.3, 2.5 and 2.6 (the Gaussian divergence,
Assouad's lemma); Tau Ceti `etvDist_sq_le_two_mul_klDiv`; Mathlib `minimaxRisk`,
`Kernel.deterministic`.

**Checks.**

- Upper constant: `2(1 + log(p/s)) ≤ (2 + 2/log 2) log(p/s) ≈ 4.885 log(p/s)` for
  `p/s ≥ 2`, with equality at `p/s = 2`.
- Assouad regime: for `s = 1`, `p = 2` the lower bound is `σ²/16`, below the risk `2σ²` of `Y`
  and the soft-threshold bound `2σ²(1 + log 2) ≈ 3.386σ²`.
- Universal threshold, negative control: for `a = 1` the hypothesis allows `s = p`, where the
  bound of 5.1 is `σ²(1 + p(1 + 2 log p))` while the minimax risk over `Θ_p = ℝ^p` is `pσ²`, a
  ratio unbounded in `p`.

### Examples

- `softThresholdRisk 0 0 = 1`, the risk of `Y` itself; `softThresholdRisk 1 0 ≈ 0.1507 ≤ e^{-1/2}`;
  `softThresholdRisk 2 5 ≈ 4.996 ≤ 1 + 2² = 5`.
- Known sparsity, `p = 100`, `s = 5`: the threshold is `σ√(2 log 20) ≈ 2.448σ` and the risk bound
  `10σ²(1 + log 20) ≈ 39.96σ²`.
- Universal threshold, `p = 100`, `s = 5`: `σ²(1 + 5(1 + 2 log 100)) ≈ 52.05σ²`.

### Dependencies

Layers 1 and 4 (4.1, 4.3); MathematicalStatisticsNonparametric 1.3, 2.2, 2.4–2.6 and 6.4 (the
Gaussian divergence, Le Cam, Fano, Assouad, the soft-threshold map); Tau Ceti's Pinsker
inequality.

## Layer 6: multiple testing

Throughout, the hypotheses, the null set `I₀` with `m₀ = |I₀|`, the p-values `p : Ω → Fin m → ℝ`
and the false discovery proportion are as in the Conventions, and `μ` is a probability measure.

### 6.1 Procedures and dependence

- `falseDiscoveryProportion I₀ R = |R ∩ I₀| / max(|R|, 1)` for `R : Finset (Fin m)`; it lies in
  `[0, 1]` and is `0` for `R = ∅`. The false discovery rate of a measurable rejection rule
  `R(ω)` is `∫ falseDiscoveryProportion I₀ (R ω) ∂μ`.
- `IsValidPValue μ q`: `μ {q ≤ t} ≤ t` for every `t ∈ [0, 1]`. For a probability measure it
  then holds for every `t ≥ 1` as well.
- **Step-up procedures**: for a nondecreasing `β : ℕ → ℝ` with `β ≥ 0` and `α > 0`, the thresholds
  are `t_k = αβ(k)/m`; the step-up count `k̂ = stepUpCount β α p` is the largest `k ≤ m` with at
  least `k` p-values at most `t_k` (`0` if there is none), and the rejection set
  `stepUpRejections β α p` is `{i | pᵢ ≤ t_{k̂}}` when `k̂ ≥ 1` and `∅` otherwise (Giraud, (10.9), pp.
  208–209). For `k̂ ≥ 1` the rejection set has exactly `k̂` elements: if `c` p-values are at most
  `t_{k̂}`, then `c ≤ m` and at least `c` p-values are at most `t_c ≥ t_{k̂}`, so `c ≤ k̂` by
  maximality.
- **Benjamini–Hochberg** is `β(k) = k`: its step-up count is the
  Benjamini–Hochberg count of Foundations 9.3, and for `α ≥ 0` its rejection set is the
  rejection set `{i | pᵢ ≤ k̂α/m}` there. When the count is `0` and `α ≥ 0` no p-value is at
  most `0`, since such a p-value would make `k = 1` admissible. Equivalently, with ordered
  p-values `p_(1) ≤ ⋯ ≤ p_(m)`, `k̂ = max {i | p_(i) ≤ iα/m}`, and the procedure rejects the
  hypotheses of `p_(1), …, p_(k̂)` (Dickhaus, Def 5.6, p. 80).
- **Benjamini–Yekutieli** is `β(k) = k/H_m` with `H_m = ∑_{j ≤ m} 1/j` (Giraud, p. 210).
- A set `D ⊆ Fin m → ℝ` is increasing (`IsIncreasingSet D`) when `x ∈ D` and `x ≤ y` coordinatewise
  imply `y ∈ D`.
- `IsWPRD μ p I₀` (weak positive regression dependence): for every `i ∈ I₀` and every
  measurable increasing `D`, `u ↦ μ({p ∈ D} ∩ {pᵢ ≤ u}) / μ{pᵢ ≤ u}` is nondecreasing on
  `{u | 0 < μ{pᵢ ≤ u}}` (Giraud, (10.14), p. 211, the hypothesis of his Thm 10.5, there for
  bounded measurable nondecreasing functions in place of indicators of increasing sets, which is
  equivalent by the layer-cake formula, and for `u ∈ [0, 1]` only).
- `IsPRDS μ p I₀` (positive regression dependence on the subset `I₀`): for every `i ∈ I₀` there
  is a version `κ` of `condDistrib p (pᵢ) μ` such that `t ↦ κ t D` is nondecreasing for every
  measurable increasing `D` (Dickhaus, Def 5.1, pp. 72–73). Conditional probabilities given
  `pᵢ = t` are defined only almost everywhere, and this is the form that makes "nondecreasing in
  `t`" meaningful.
- **Independence gives PRDS** (`isPRDS_of_indepFun`): if `p` is measurable and for every
  `i ∈ I₀` the variable `pᵢ` is independent of `(pⱼ)_{j ≠ i}`, then `IsPRDS μ p I₀`, with the
  version `κ t = (law of the rest) placed at pᵢ = t`, monotone because `D` is increasing in
  coordinate `i`. Null p-values independent of each other and of the non-null p-values satisfy
  this hypothesis.
- **PRDS gives WPRD** (`isWPRD_of_isPRDS`): for measurable `p`, the ratio is the average of
  `t ↦ κ t D` over the law of `pᵢ` restricted to `(-∞, u]`, and averages of a nondecreasing
  function over initial segments are nondecreasing in `u`.

*Needs:* Foundations 9.3 (the Benjamini–Hochberg count); Mathlib `condDistrib`, `IndepFun`.

**Checks.**

- False discovery proportion: for `m = 3`, `I₀ = {1}` and `R = {0, 1}` it is `1/2`; for
  `R = ∅` it is `0`; for `∅ ≠ R ⊆ I₀` it is `1`.
- False discovery proportion, negative control: dividing by `m` in place of `max(|R|, 1)` gives
  `1/3` in the first case.
- Validity: a uniform `q` is valid, and so is the constant `1` (`μ{1 ≤ t} = 0` for `t < 1`).
- Validity, negative control: `q = U/2` with `U` uniform is not valid, since
  `μ{q ≤ 1/4} = 1/2`; nor is the constant `0`, since `μ{0 ≤ 0} = 1`.
- Step-up count: for `p = (0.01, 0.04, 0.5)` and `α = 0.1` it is `2` with `β(k) = k` and `1`
  with `β(k) = k/H₃`; for `p = (1, 1, 1)` it is `0`.
- Step-up count, negative control: for `p = (0.05, 0.06, 0.5)`, `α = 0.1` and `β(k) = k` it is
  `2` (`0.06 ≤ 0.0667`), while the step-down rule, which stops at the first `k` with
  `p_(k) > t_k`, rejects nothing (`0.05 > 0.0333`).
- Rejection set: for `p = (0.01, 0.04, 0.5)`, `α = 0.1` and `β(k) = k` it is `{0, 1}`, of size
  `k̂ = 2`.
- Rejection set, negative control: for `p = (0.01, 0.08, 0.5)`, `α = 0.1` and `β(k) = k`,
  `k̂ = 1` and the rejection set is `{0}`; the threshold `t_m = α` in place of `t_{k̂}` would give
  `{0, 1}`.
- Rejection set, negative control for `α ≥ 0`: for `p = (-1, -1)` and `α = -3` the count is
  `0` and the step-up rejection set is `∅`, while `{i | pᵢ ≤ 0 · α/m}` has both elements.
- Increasing sets: `{x | x 0 ≥ 1/2}`, `∅` and the whole space are increasing; `{x | x 0 ≤ 1/2}`
  is not.
- Increasing sets: `{k̂ < k}` is increasing, since `k̂` is antitone in each p-value.
- Increasing sets, negative control: `{k̂ ≥ 2}` is not increasing: `p = (0.01, 0.04, 0.5)` has
  `k̂ = 2` for `α = 0.1`, and raising the second p-value to `0.07` gives `k̂ = 1`.
- WPRD: for `m = 1`, `I₀ = {0}`, `p₀` uniform and `D = [c, ∞)`, `c ∈ [0, 1]`, the ratio is
  `(u - c)₊/u` on `u ∈ (0, 1]` and `1 - c` for `u ≥ 1`, nondecreasing.
- WPRD: comonotone p-values `p₁ = p₀`, `p₀` uniform, satisfy it, by `isWPRD_of_isPRDS` and the
  PRDS check below.
- WPRD, negative control: for `p₁ = 1 - p₀`, `p₀` uniform, `I₀ = {0}` and
  `D = {x | x 1 ≥ 1/2}`, the ratio is `min(u, 1/2)/u`, which decreases on `[1/2, 1]`.
- PRDS: independent coordinates satisfy it, by `isPRDS_of_indepFun`.
- PRDS: for `p₁ = p₀`, `κ t = δ_{(t, t)}` is a version, and `t ↦ δ_{(t, t)} D` is nondecreasing
  for increasing `D`.
- PRDS, negative control: for `p₁ = 1 - p₀` with `p₀` uniform and `D = {x | x 1 ≥ 1/2}`, every
  version has `κ t D = 1{t ≤ 1/2}` for almost every `t ∈ [0, 1]`, and no nondecreasing function
  agrees with it almost everywhere.

### 6.2 Benjamini–Hochberg

- **FDR control** (`bh_fdr_le`): for measurable `p`, `α ∈ (0, 1)`, valid null p-values and
  `IsWPRD μ p I₀`, the false discovery rate of Benjamini–Hochberg is at most `αm₀/m ≤ α`
  (Giraud, Thm 10.5, p. 213, whose proof on pp. 213–214 gives the factor `m₀/m`; Dickhaus,
  Thm 5.3, (5.12), p. 80). The proof writes the rate as
  `∑_{i ∈ I₀} ∑_{k ≥ 1} k⁻¹ μ({pᵢ ≤ αk/m} ∩ {k̂ = k})`, observes that `{k̂ ≥ k}` is a decreasing
  event in `p`, and combines WPRD for the increasing complements with validity
  `μ{pᵢ ≤ αk/m} ≤ αk/m` by Abel summation in `k`.
- Under independence of each null p-value from the others, and under `IsPRDS`, the bound holds
  by 6.1 (Giraud, Lemma 10.4, p. 212, for null p-values independent of each other and of the
  non-null ones).
- **Exactness** (`bh_fdr_eq`): for measurable `p` and `α ∈ (0, 1)`, if each null `pᵢ` is
  uniform on `[0, 1]` (`μ{pᵢ ≤ t} = t` for `t ∈ [0, 1]`) and independent of `(pⱼ)_{j ≠ i}`, the
  false discovery rate equals `αm₀/m` (Dickhaus, Thm 5.3, (5.13), p. 80, under null p-values that
  are i.i.d. uniform and independent of the non-null ones, which implies the hypothesis here).
  The proof conditions on the other p-values: on `{pᵢ ≤ αk/m}`, `k̂ = k` holds exactly when the
  count `k̂⁽ⁱ⁾` computed with `pᵢ` replaced by `0` equals `k`, and `k̂⁽ⁱ⁾` is a function of the
  others, so `μ({pᵢ ≤ αk/m} ∩ {k̂ = k}) = (αk/m) μ{k̂⁽ⁱ⁾ = k}`; summing over `k ≥ 1` gives `α/m`
  for each `i ∈ I₀`, since `k̂⁽ⁱ⁾ ≥ 1`.

*Needs:* 6.1.

**Checks.**

- Exactness, `m = m₀ = 2`: see the Examples, the rate is `α`.
- Exactness, `m = 2`, `I₀ = {0}`, `p₁ = 0` and `p₀` uniform: `k̂ ≥ 1` always, both are rejected
  when `p₀ ≤ α` and only `1` otherwise, so the rate is `α/2 = αm₀/m`.
- FDR control, negative control: validity is needed. For `m = 1`, `I₀ = {0}` and the invalid
  `p₀ = 0` (which satisfies WPRD, the ratio being constant) the hypothesis is always rejected and
  the rate is `1 > α`.

### 6.3 Arbitrary dependence

- **General step-up bound** (`stepUp_fdr_le`): for measurable `p`, any joint law with valid null
  p-values, `α > 0` and a nondecreasing `β ≥ 0`, the step-up procedure with thresholds
  `αβ(k)/m` has false discovery rate at most
  `α(m₀/m) (∑_{j=1}^{m-1} β(j)/(j(j + 1)) + β(m)/m)` (Giraud, Thm 10.2, p. 209,
  whose sum `∑_{j ≥ 1} β(min(j, m))/(j(j + 1))` has this finite form). The proof uses
  `1/k = ∑_{j ≥ k} 1/(j(j + 1))` to write the rate as a sum over `j` of probabilities
  `μ{pᵢ ≤ αβ(min(j, m))/m}`, each at most `αβ(min(j, m))/m` by validity (for thresholds above
  `1` the bound `μ ≤ 1` suffices).
- **Benjamini–Yekutieli** (`by_fdr_le`): with `β(k) = k/H_m` the sum equals `1`, so the false
  discovery rate is at most `αm₀/m` for every joint law of valid null p-values (Dickhaus,
  Thm 5.5, p. 81; Giraud, Cor 10.3, p. 211).

*Needs:* 6.1.

**Checks.**

- The finite form: `∑_{j ≥ m} 1/(j(j + 1)) = 1/m`, so the tail `β(m) ∑_{j ≥ m} 1/(j(j + 1))` is
  `β(m)/m`.
- Benjamini–Hochberg under arbitrary dependence: `β(k) = k` gives the sum
  `∑_{j=1}^{m-1} 1/(j + 1) + 1 = H_m`, the bound `αm₀H_m/m` of Giraud, p. 210.
- Benjamini–Yekutieli for `m = 1`: `H₁ = 1`, the procedure is Benjamini–Hochberg, and the bound
  is `αm₀`.

### Examples

- Benjamini–Hochberg, `p = (0.01, 0.04, 0.5)`, `α = 0.1`: the thresholds are
  `(0.0333, 0.0667, 0.1)`, `k̂ = 2`, and the first two hypotheses are rejected; this is the
  count of Foundations 9.3.
- Benjamini–Yekutieli on the same p-values: `H₃ = 11/6`, thresholds
  `(0.0182, 0.0364, 0.0545)`, `k̂ = 1`, and only the first hypothesis is rejected.
- Exactness for `m = m₀ = 2`, independent uniform p-values: `R ≥ 1` iff `min pᵢ ≤ α/2` or
  `max pᵢ ≤ α`, with probability `(α - α²/4) + α²/4 = α`, and the proportion is `1` whenever
  `R ≥ 1`; so the rate is `α = αm₀/m`.
- `IsValidPValue`: a uniform `q` is valid; `q = U/2` with `U` uniform is not, since
  `μ{q ≤ 1/4} = 1/2`.
- Benjamini–Yekutieli sum for `m = 3`: `(1/2 + 1/3)/H₃ + (3/H₃)/3 = (5/6 + 1)·(6/11) = 1`.

### Dependencies

Foundations 9.3; Mathlib `condDistrib`.

## Layer 7: low-rank and structured matrices

### 7.1 Nuclear-norm trace regression

One observes `yᵢ = ⟪Xᵢ, Θ*⟫_F + wᵢ`, `i < n`, for `Θ* : Matrix (Fin d₁) (Fin d₂) ℝ`; write
`𝔛Θ = (⟪Xᵢ, Θ⟫_F)ᵢ ∈ ℝⁿ` (`traceObs`) and `G = n⁻¹ ∑ wᵢXᵢ`. The estimator `Θ̂` is any minimizer
of `traceObjective`, `‖y - 𝔛Θ‖²/(2n) + λ nuclear(Θ)`, which exists for `λ > 0`. For `Θ*` with
column space `U` and row space `V`, the decomposition of 1.4 is `Δ'' = P_{U⊥} Δ P_{V⊥}`
(`lowRankCompl`), `Δ' = Δ - Δ''`, and the nuclear cone is
`C(Θ*) = {Δ | nuclear(Δ'') ≤ 3 nuclear(Δ')}` (`InNuclearCone`). Here `V⊥` is the kernel of `Θ*`.

- **Deterministic theorem** (`nuclear_trace_regression_det`): if `rank Θ* ≤ r`,
  `λ ≥ 2‖G‖` and `‖𝔛Δ‖²/n ≥ κ‖Δ‖_F²` for every `Δ ∈ C(Θ*)` with `κ > 0`, then
  `Θ̂ - Θ* ∈ C(Θ*)` and `‖Θ̂ - Θ*‖_F ≤ 3λ√(2r)/(2κ)`. The proof is the variational inequality of
  3.1, which holds for any norm penalty with the same proof, then trace duality
  `⟪w, 𝔛Δ⟫/n = ⟪G, Δ⟫_F ≤ ‖G‖ nuclear(Δ)`, the decomposition inequality of 1.4, and
  `nuclear(Δ') ≤ √(2r)‖Δ‖_F`: these give
  `‖𝔛Δ‖²/n + (λ/2) nuclear(Δ'') ≤ (3λ/2) nuclear(Δ')`. The squared bound
  `9λ²r/(2κ²)` is (10.19) of Wainwright, p. 320, which follows from Prop 10.6, p. 319, where
  restricted strong convexity is assumed on every `Δ` with a tolerance term; the factor `2` gained
  over the comparison of objective values comes from the variational inequality. For `r = 0` the
  cone is `{0}` and `Θ̂ = Θ*`.
- **Restricted isometry of the Gaussian ensemble** (`rankRIP_gaussian`): there are universal
  `C, c > 0` such that if the `Xᵢ` have independent standard normal entries and
  `n ≥ CR(d₁ + d₂)`, then with probability at least `1 - 2e^{-cn}`,
  `‖Δ‖_F²/2 ≤ ‖𝔛Δ‖²/n ≤ 3‖Δ‖_F²/2` for every `Δ` of rank at most `R`. For fixed `Δ`,
  `‖𝔛Δ‖²/‖Δ‖_F²` has the law `χ²ₙ` (1.2); the net of 1.5 and the standard extension from a net to
  all low-rank matrices conclude (Candès–Plan 2011, Theorem 2.3, by the same argument).
- **Restricted strong convexity from restricted isometry** (`rsc_of_rankRIP`): if `rank Θ* ≤ r`
  and the restricted isometry of order `74r` holds with `δ = 1/2`, then
  `‖𝔛Δ‖²/n ≥ κ₀‖Δ‖_F²` on `C(Θ*)` with the `κ₀` of 3.4. The proof is the block argument of 3.4
  applied to the singular value decomposition of `Δ''` in blocks of rank `72r`, in decreasing
  order of singular values, with `T₀ = Δ' + (first block)` of rank at most `74r`: the cone gives
  `∑_{k ≥ 2} ‖Bₖ‖_F ≤ nuclear(Δ'')/√(72r) ≤ 3√(2r)‖Δ'‖_F/√(72r) = ‖Δ'‖_F/2`, and `Δ'` is
  Frobenius-orthogonal to every block.
- **Gaussian ensemble** (`nuclear_trace_regression_gaussian`): there are universal
  `c₀, c, C, c₁, c₂ > 0` such that if the `Xᵢ` have independent standard normal entries, the `wᵢ`
  are independent `N(0, σ²)` and independent of the design, `σ > 0`, `rank Θ* ≤ r`,
  `n > cr(d₁ + d₂)`, `0 < δ ≤ 1` and `λ = c₀σ(√((d₁ + d₂)/n) + δ)`, then with probability at
  least `1 - c₁ exp(-c₂nδ²)`, `‖Θ̂ - Θ*‖_F² ≤ Cσ²(r(d₁ + d₂)/n + rδ²)` (Wainwright, Cor 10.10,
  p. 323, for the identity covariance, *by the same argument*; the printed constants are
  `λ = 10σ(√((d₁ + d₂)/n) + δ)` and `1 - 2e^{-2nδ²}`). The noise event: conditionally on `w`,
  `G` has independent `N(0, ‖w‖²/n²)` entries, so the norm bound of RandomMatrices §2.4 with
  `t = √n δ` and the chi-squared tail `‖w‖² ≤ 5nσ²` (1.2, `t = n`) give `‖G‖ ≤ λ/2` with
  probability at least `1 - 2exp(-cnδ²) - e^{-n}`, and `e^{-n} ≤ e^{-nδ²}` since `δ ≤ 1`.

*Needs:* 3.1, 3.4, 1.2, 1.4, 1.5; RandomMatrices §2.4.

**Checks.**

- `traceObs`, convention: for `X₀ = [[1, 2], [0, 1]]` and `Θ = [[1, 0], [1, 1]]`,
  `⟪X₀, Θ⟫_F = tr(X₀ᵀΘ) = 2`, while `tr(X₀Θ) = 4`: the observation is the Frobenius pairing, not
  the trace of the product.
- `traceObs`: for `d₁ = d₂ = 1` and `Xᵢ = (xᵢ)`, `𝔛θ = θx`, the design of a one-column regression.
- `traceObs`: for `Xᵢ` with independent standard normal entries, `⟪Xᵢ, Θ⟫_F` has law
  `N(0, ‖Θ‖_F²)`; for `Θ = I₂` the variance is `2`.
- `traceObjective`: for `d₁ = d₂ = n = 1`, `X₀ = (1)`, `y = 3` and `λ = 1`, the objective is
  `(3 - θ)²/2 + |θ|`, minimized at the soft threshold `θ = 2` with value `5/2`.
- `traceObjective`: the factor `1/(2n)` makes a duplicated observation harmless: for `n = 2`,
  `X₀ = X₁ = (1)`, `y = (3, 3)` and `λ = 1`, the objective is again `(3 - θ)²/2 + |θ|`.
- `traceObjective`, negative control: the penalty is the nuclear norm, not the entrywise `ℓ¹`
  norm: the all-ones `2 × 2` matrix has nuclear norm `2` and entrywise `ℓ¹` norm `4`.
- `lowRankCompl`: for `Θ* = diag(1, 0)` and `Δ = [[a, b], [c, d]]`, `Δ'' = diag(0, d)` and
  `Δ' = [[a, b], [c, 0]]`, of rank at most `2 = 2r`.
- `lowRankCompl`: for invertible `Θ*`, `U⊥ = 0`, so `Δ'' = 0` and every `Δ` is in the cone.
- `InNuclearCone`: for `Θ* = 0`, `Δ'' = Δ` and `Δ' = 0`, so the cone is `{0}`.
- `InNuclearCone`, the constant `3`: for `Θ* = diag(1, 0)`, `Δ = diag(1, 3)` is in the cone
  (`3 ≤ 3`), and `Δ = diag(1, 4)` is not.
- `lowRankCompl`, negative control: for `Θ* = [[0, 1], [0, 0]]`, with column space `span e₁` and
  kernel `span e₁`, and `Δ = [[0, 0], [1, 0]]`, `Δ'' = Δ`, so `Δ` is not in the cone. Exchanging
  the two projections gives `Δ'' = 0` and puts `Δ` in the cone.

### 7.2 Thresholded covariance estimation

Let `x₁, …, xₙ` be independent centred vectors in `EuclideanSpace ℝ (Fin p)` with covariance
`Σ`, `Σ̂ = n⁻¹ ∑ xᵢxᵢᵀ`, `T_λ(M)ⱼₖ = Mⱼₖ 1{|Mⱼₖ| > λ}` the hard-threshold operator
(`hardThreshold`), and `A` the `0–1` matrix with `Aⱼₖ = 1` iff `Σⱼₖ ≠ 0` (`supportPattern`); `s`
bounds the number of nonzero entries in each row of `Σ`.

- **Deterministic theorem** (`norm_hardThreshold_sub_le`): if `Σ` is symmetric with at most `s`
  nonzero entries per row and `|Σ̂ⱼₖ - Σⱼₖ| ≤ λ` for all `j, k`, then
  `‖T_λ(Σ̂) - Σ‖ ≤ 2λ‖A‖` and `‖A‖ ≤ s` (Wainwright, Thm 6.23 with (6.54), p. 181, and Cor 6.24,
  p. 182; Bickel–Levina 2008, Theorem 1). Each entry satisfies `|T_λ(Σ̂)ⱼₖ - Σⱼₖ| ≤ 2λAⱼₖ`: where
  `Σⱼₖ = 0` the entry `Σ̂ⱼₖ` is thresholded to `0`, and elsewhere either it is kept, with error at
  most `λ`, or it is removed, with `|Σⱼₖ| ≤ |Σ̂ⱼₖ| + λ ≤ 2λ`. Entrywise domination and the
  symmetric Schur test (1.4) conclude.
- **Sub-Gaussian coordinates** (`hardThreshold_covariance_prob`): there are universal
  `c₀, c₁, c₂ > 0` such that, if each coordinate of each `xᵢ` has proxy `σ²`, `Σ` is symmetric
  with at most `s` nonzero entries per row, `n > log p` and `λ = σ²(c₀ + 1)√((log p)/n)`, then
  `‖T_λ(Σ̂) - Σ‖ ≤ 2(c₀ + 1)sσ²√((log p)/n)` with probability at least `1 - c₁p^{-c₂}`
  (Wainwright, Cor 6.24, p. 182, *by the same argument*). The proof is 1.3 with
  `δ = √((log p)/n)`: for `λ = σ²(c₀√((log p)/n) + δ)` the hypothesis of the deterministic
  theorem holds with probability at least `1 - c₁ exp(-c₂n min(δ, δ²))`, and
  `n min(δ, δ²) = log p` since `δ < 1`. For `p = 1` the threshold is `0`, so `T_λ(Σ̂) = Σ̂`, and
  the statement holds because `c₁ ≥ 1` may be taken. The printed constants of Wainwright
  (`λ = 8σ²√((log p)/n) + σ²δ` and `8e^{-n min(δ, δ²)/16}`, Thm 6.23, p. 181, through Lemma 6.26,
  p. 183) are not used.

*Needs:* 1.3, 1.4.

**Checks.**

- `hardThreshold`: for `λ = 0.1` and `M = [[0.1, 0.2], [-0.3, 0.05]]`,
  `T_λ(M) = [[0, 0.2], [-0.3, 0]]`: an entry equal to `λ` in absolute value is removed.
- `hardThreshold`, negative control: the strict inequality is needed. For `Σ = 0`,
  `Σ̂ = diag(0.1, 0)` and `λ = 0.1`, `T_λ(Σ̂) = 0` and the bound `0 ≤ 2λ‖A‖ = 0` holds; keeping
  the entries with `|Σ̂ⱼₖ| ≥ λ` would give error `0.1 > 0`.
- `hardThreshold`: for `λ ≥ maxⱼₖ |Mⱼₖ|`, `T_λ(M) = 0`; for `λ < 0`, `T_λ(M) = M`.
- `supportPattern`: the diagonal is counted: `Σ = I₂` has pattern `I₂` and `‖A‖ = 1`.
- `supportPattern`: the star `Σ = [[1, a, a], [a, 1, 0], [a, 0, 1]]`, `a ≠ 0`, has
  `‖A‖ = 1 + √2 ≈ 2.414 ≤ s = 3`, the hub-and-spoke value `1 + √(s - 1)`.
- `supportPattern`, negative control: `[[2, -3], [0, 5]]` has pattern `[[1, 1], [0, 1]]`; a sign
  pattern would have `-1`, and the pattern of a non-symmetric matrix need not be symmetric.
- Deterministic theorem, negative control: symmetry is needed for `‖A‖ ≤ s`. The pattern
  `[[1, 0], [1, 0]]` has one nonzero entry per row and norm `√2 > 1`.

### 7.3 Neighbourhood selection

Let the observations be `n` independent `N(0, Σ)` vectors in `ℝ^p` with `Σ` positive definite,
`Θ = Σ⁻¹`, `Σⱼⱼ ≤ 1`, and `N(j) = {k ≠ j | Θⱼₖ ≠ 0}` (`neighbourhood`) with `|N(j)| ≤ m`.

- **Gaussian regression** (`gaussian_regression_coeff`): for `x ~ N(0, Σ)` with `Σ` positive
  definite, the residual `xⱼ - ∑_{k ≠ j} (-Θⱼₖ/Θⱼⱼ) xₖ` has law `N(0, 1/Θⱼⱼ)`, it is independent
  of the other coordinates, and `1/Θⱼⱼ ≤ Σⱼⱼ`. Hence the conditional mean of coordinate `j`
  given the others is `∑_{k ≠ j} (-Θⱼₖ/Θⱼⱼ) xₖ`, with coefficients supported on `N(j)`. This is
  the single-coordinate form of Tau Ceti's `EuclideanSpace.gaussianCondMean`,
  `TauCeti.Probability.condDistrib_multivariateGaussian` and
  `ProbabilityTheory.HasLaw.indepFun_gaussianResidual`, which treat a block split `ι ⊕ κ`,
  together with the block-inverse formula that expresses the regression coefficients and the
  residual variance through `Θ`.
- **Neighbourhood selection** (`neighbourhood_selection`): there is a universal `c₀ > 0`, and for
  `α ∈ (0, 1]` and `b ≥ 1` there are `c₁, c₂, c₃ > 0` depending only on `α` and `b`, such that the
  following holds. Assume `m ≥ 1` and `n ≥ c₁ m max(m, log p)`; for each `j`, with `Γ` the
  covariance of the coordinates other than `j`,
  `max_{k ∉ N(j)} ∑_{l ∈ N(j)} |(Γ_{k,N(j)} Γ_{N(j),N(j)}⁻¹)ₗ| ≤ 1 - α` and
  `max_{k ∈ N(j)} ∑_{l ∈ N(j)} |(Σ_{N(j),N(j)}⁻¹)ₖₗ| ≤ b`. Run the lasso of each coordinate on the
  others with `λ = c₀α⁻¹(√((log p)/n) + δ)`, `0 < δ ≤ 1`, and join the estimated neighbourhoods by
  the "and" or the "or" rule. Then with probability at least `1 - c₂ exp(-c₃n min(δ², 1/m))` both
  rules include no false edge and include every edge with `|Θⱼₖ| > 7bλ max(Θⱼⱼ, Θₖₖ)`, that is,
  every edge whose two regression coefficients exceed `7bλ` in absolute value (Wainwright,
  Thm 11.12, pp. 361–362, *by the same argument*). The printed statement has universal constants,
  the condition `|Θⱼₖ| ≥ 7bλ` and the sample size `n ≳ m log p`. Its proof bounds the regression
  coefficients `-Θⱼₖ/Θⱼⱼ`, which gives the edge condition stated here, with strict inequality
  because the coefficient error bound `7bλ` is not strict. Its control of the sample incoherence
  (p. 363) needs a sample size `bm log p` times a negative power of `α`, and it treats the
  coefficient bound only for `m ≤ log p` (p. 364), where `n ≳ m²` is used; the sample size
  `n ≥ c₁ m max(m, log p)`, with `c₁` depending on `α` and `b`, covers both. The proof applies
  3.7 to each node regression, with the sample incoherence, minimum eigenvalue and `∞ → ∞`
  bounds of the `N(j)`-blocks of `Σ̂` derived from the population ones through 1.3 and
  RandomMatrices §2.4, and the noise term bounded conditionally on the design (1.1). For
  `N(j) = ∅` the regression has `β = 0`; on `λ ≥ maxₖ |⟪X_k, y⟫|/n` the zero vector is a
  solution (3.1), and every solution has `ℓ¹` norm `0` by `IsLassoSolution.fit_eq`, so it is the
  only one.

*Needs:* 3.1, 3.7, 1.1, 1.3; RandomMatrices §2.4; Tau Ceti `gaussianCondMean`,
`indepFun_gaussianResidual`.

**Checks.**

- `neighbourhood`: for `Σ = [[1, ρ], [ρ, 1]]` with `0 < |ρ| < 1`, `N(0) = {1}`; for `Σ = I`,
  every `N(j)` is empty.
- `neighbourhood`: since `Θ` is symmetric, `k ∈ N(j)` iff `j ∈ N(k)`, so the "and" and "or" rules
  agree on the population graph.
- `neighbourhood`, negative control: it is read off `Θ = Σ⁻¹`, not off `Σ`. For the chain
  `Σ = [[1, 1/2, 1/4], [1/2, 1, 1/2], [1/4, 1/2, 1]]`, every entry of `Σ` is nonzero, while
  `Θ = (4/3)[[1, -1/2, 0], [-1/2, 5/4, -1/2], [0, -1/2, 1]]`, so `N(0) = {1}` and
  `N(1) = {0, 2}`.
- Gaussian regression for the chain: the coefficients of coordinate `1` on `0` and `2` are
  `-Θ₁₀/Θ₁₁ = -Θ₁₂/Θ₁₁ = 2/5` and the residual variance is `1/Θ₁₁ = 3/5 ≤ Σ₁₁ = 1`.

### 7.4 The graphical lasso

The graphical lasso objective (`glassoObjective`) is
`F(Θ) = tr(ΘΣ̂) - log det Θ + λ ∑_{j ≠ k} |Θⱼₖ|` on positive definite `Θ`; the sum runs over
ordered pairs, as in Wainwright's (11.10), p. 354.

- **Existence and uniqueness** (`existsUnique_graphicalLasso`): for `λ > 0` and `Σ̂` positive
  semidefinite with `Σ̂ⱼⱼ > 0` for every `j`, `F` has a unique minimizer on the positive definite
  matrices. Uniqueness is strict convexity of `-log det`. Existence is coercivity: `tr(ΘΣ̂) ≥ 0`
  for positive semidefinite `Σ̂`, and `tr(ΘΣ̂) ≥ minⱼ Σ̂ⱼⱼ tr Θ - maxⱼₖ |Σ̂ⱼₖ| ∑_{j ≠ k} |Θⱼₖ|`;
  a convex combination of the two bounds, absorbed by the penalty, gives
  `F(Θ) ≥ ε tr Θ - log det Θ` for some `ε > 0`, which tends to `∞` as `tr Θ → ∞` or
  `det Θ → 0` with `tr Θ` bounded.
- **Deterministic theorem** (`graphicalLasso_frobenius_det`): let `Θ*` be positive definite with
  at most `m` nonzero entries per row, the diagonal included, `Σ = Θ*⁻¹`, `λ > 0`,
  `|Σ̂ⱼₖ - Σⱼₖ| ≤ λ/2` for all `j, k`, and `3(‖Θ*‖ + 1)²λ√(mp) < 1`. Then
  `‖Θ̂ - Θ*‖_F² ≤ 9(‖Θ*‖ + 1)⁴mpλ²` (Wainwright, Prop 11.9, p. 355, whose hypothesis
  `6(‖Θ*‖ + 1)²λ√(mp) < 1` implies the one here). The proof: on the segment from `Θ*` to `Θ̂` all
  matrices are positive definite and `F` is at most `F(Θ*)`; for `D` on it with `‖D‖_F ≤ 1`, the
  Hessian `Θ⁻¹ ⊗ Θ⁻¹` gives curvature `κ = (‖Θ*‖ + 1)^{-2}`, the score `Σ̂ - Σ` gives
  `|⟪Σ̂ - Σ, D⟫_F| ≤ (λ/2)‖D‖₁`, and the support `S` of `Θ*` (with `|S| ≤ mp`, the diagonal in
  `S`) gives `0 ≥ F(Θ* + D) - F(Θ*) ≥ (κ/2)‖D‖_F² - (3λ/2)√(mp)‖D‖_F`, so
  `‖D‖_F ≤ 3λ√(mp)/κ < 1`, which excludes `‖Θ̂ - Θ*‖_F` above this value.
- **Covariance-error event** (`graphicalLasso_covarianceEvent_prob`): if each coordinate of the
  observations has proxy `σ²`, there are universal `c₀, c₁, c₂ > 0` such that for `n > log p`,
  `0 < δ ≤ 1` and `λ = c₀σ²(√((log p)/n) + δ)`, the event `maxⱼₖ |Σ̂ⱼₖ - Σⱼₖ| ≤ λ/2` has
  probability at least `1 - c₁ exp(-c₂nδ²)` (1.3). This is only the covariance hypothesis of the
  deterministic theorem. Its smallness hypothesis `3(‖Θ*‖ + 1)²λ√(mp) < 1` is deterministic and
  is not implied: for `p = m = 1`, `δ = 1`, `σ = 1` and observations of variance `ε ≤ 1`, one has
  `Θ* = 1/ε` and `λ ≥ c₀`, so the condition fails for small `ε` at every `n`. Combining the two
  therefore needs the explicit restriction `3(‖Θ*‖ + 1)²c₀σ²(√((log p)/n) + δ)√(mp) < 1`, which
  holds for instance when `n > 36c₀²(‖Θ*‖ + 1)⁴σ⁴mp log p` and
  `δ < (6c₀(‖Θ*‖ + 1)²σ²√(mp))⁻¹` (Wainwright, Prop 11.9, p. 355, also keeps the smallness
  condition as a separate assumption). Under both, the estimator exists: `Σ̂` is positive
  semidefinite by construction, and `Σⱼⱼ ≥ λ_min(Σ) = ‖Θ*‖⁻¹ > λ/2` (the smallness condition with
  `m, p ≥ 1` gives `λ < 1/(3(‖Θ*‖ + 1)²)`), so `Σ̂ⱼⱼ > 0` on the event and
  `existsUnique_graphicalLasso` applies.

*Needs:* 1.3; Mathlib `Matrix.det`, `Matrix.PosDef`, `StrictConvexOn`.

**Checks.**

- `glassoObjective`, `p = 1`: `F(θ) = θΣ̂ - log θ`, minimized at `θ = 1/Σ̂`; for `Σ̂ = 2` the
  minimum is `1 + log 2 ≈ 1.693` at `θ = 1/2`.
- `glassoObjective`: the diagonal is not penalized: for `Σ̂ = I₂` and `λ = 1`, `F(I₂) = 2`, and
  `F(Θ)` for `Θ = [[1, 1/2], [1/2, 1]]` is `2 - log(3/4) + 1 ≈ 3.288`.
- `glassoObjective`: for `Σ̂ = I₂` and `λ = 1`, `F(2I₂) = 4 - log 4 ≈ 2.614 > F(I₂) = 2`.
- Existence, negative control: positive semidefiniteness is needed. For
  `Σ̂ = [[1, 2], [2, 1]]` (eigenvalues `3` and `-1`, positive diagonal) and `λ = 1/2`, the
  positive definite `Θₐ = [[a, 1/2 - a], [1/2 - a, a]]` give
  `F(Θₐ) = 3/2 - a - log(a - 1/4) → -∞`, so no minimizer exists.
- Existence, negative control: the positive diagonal is needed. For `p = 1` and `Σ̂ = 0`,
  `F(θ) = -log θ` has no minimizer.

### Examples

- Thresholding: `Σ = I₂`, `Σ̂ = [[1.1, 0.05], [0.05, 0.95]]`, `λ = 0.1`: the max-norm hypothesis
  holds, `T_λ(Σ̂) = diag(1.1, 0.95)`, and `‖T_λ(Σ̂) - Σ‖ = 0.1 ≤ 2λ‖I‖ = 0.2`.
- Trace regression with `d₁ = d₂ = 1`: the nuclear norm is `|θ|` and the estimator is the
  one-dimensional lasso.
- Graphical lasso with `p = 1`: no penalty applies and `Θ̂ = 1/Σ̂`.
- Neighbourhood regression for `Σ = [[1, ρ], [ρ, 1]]`, `|ρ| < 1`:
  `Θ = (1 - ρ²)⁻¹[[1, -ρ], [-ρ, 1]]`, the coefficient `-Θ₁₂/Θ₁₁ = ρ` and the residual variance
  `1/Θ₁₁ = 1 - ρ²`.

### Dependencies

Layers 1 and 3 (3.1, 3.4, 3.7); RandomMatrices §2.4; Tau Ceti's Gaussian conditioning.

## Layer 8: principal components

### 8.1 Perturbation of the leading eigenvector

Let `E` be a finite-dimensional real inner product space, `Σ, P : E →L[ℝ] E` self-adjoint,
`θ*` a unit vector with `Σθ* = γθ*`, and `ν > 0` with `⟪u, Σu⟫ ≤ (γ - ν)‖u‖²` for every
`u ⟂ θ*`; for a symmetric matrix this says that `γ = γ₁` is the largest eigenvalue and
`γ₁ - γ₂ ≥ ν`. A leading unit eigenvector of a symmetric `M` (`IsLeadingUnitEigenvector`) is a
unit `u` with `⟪v, Mv⟫ ≤ ⟪u, Mu⟫‖v‖²` for every `v`, that is, `Mu = λ_max(M)u`.

- **Davis–Kahan for the leading eigenvector** (`leading_eigenvector_perturbation`): if `‖P‖ < ν/2`,
  then the largest eigenvalue of `Σ + P` is simple, that is, `Σ + P` has a leading unit
  eigenvector `θ̂`, unique up to sign, and with the sign chosen so that `⟪θ̂, θ*⟫ ≥ 0`,
  `‖θ̂ - θ*‖ ≤ √2 ‖(I - θ*θ*ᵀ)Pθ*‖/(ν - 2‖P‖)`. This implies Wainwright's bound, which has `2` in
  place of `√2` (Wainwright, Thm 8.5, p. 243). Simplicity is Weyl's inequality (Tau Ceti
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`): the gap of `Σ + P` is at least
  `ν - 2‖P‖ > 0`. The bound is the residual `sin Θ` theorem of
  OperatorTheory/SpectralSubspacePerturbation (SSP-C17), Tau Ceti
  `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply` in the
  operator norm `TauCeti.UnitarilyInvariantSeminorm.opNorm`, with `A = Σ + P`, `U = span θ̂`,
  `X : ℝ → E`, `1 ↦ θ*`, and `M = ⟪θ*, (Σ + P)θ*⟫`. The residual `AX - XM` is
  `(I - θ*θ*ᵀ)Pθ*`, `M ≥ γ - ‖P‖`, and by Weyl the eigenvalues of `Σ + P` on `θ̂^⟂` are at most
  `γ - ν + ‖P‖`, so `δ = ν - 2‖P‖` and `sin ∠(θ̂, θ*) ≤ ‖(I - θ*θ*ᵀ)Pθ*‖/(ν - 2‖P‖)`. With
  `ρ = ⟪θ̂, θ*⟫ ∈ [0, 1]`, `‖θ̂ - θ*‖² = 2(1 - ρ) ≤ 2(1 - ρ²) = 2 sin² ∠(θ̂, θ*)` concludes.
- Positive semidefiniteness of `Σ` is not needed. The residual `‖(I - θ*θ*ᵀ)Pθ*‖` is at most
  `‖P‖`, and it is what the spiked ensemble needs: the residual form of the `sin Θ` theorem gives
  it, while the perturbation form bounds the angle in `‖P‖` only.

*Needs:* Tau Ceti `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`,
`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`,
`TauCeti.UnitarilyInvariantSeminorm.opNorm`; OperatorTheory/SpectralSubspacePerturbation SSP-C17.

**Checks.**

- `IsLeadingUnitEigenvector`: for `M = diag(2, 1)` the leading unit eigenvectors are `±e₁`; for
  `M = I₂` every unit vector is one.
- `IsLeadingUnitEigenvector`, negative control: for `M = diag(-1, -2)` the leading unit
  eigenvectors are `±e₁`, for the largest eigenvalue `-1`, not `±e₂`, for the eigenvalue
  `-2` of largest absolute value: at `u = e₂`, `v = e₁` gives `-1 > -2`.
- `IsLeadingUnitEigenvector`: the zero vector is excluded by `‖u‖ = 1`, so on the zero space
  there is none.
- Davis–Kahan, negative control: the example below with `P = diag(-1/2, 1/2)` has `‖P‖ = ν/2`
  and no unique leading eigenvector (Wainwright, p. 243).

### 8.2 The spiked sub-Gaussian ensemble

Let `θ*` be a unit vector in `ℝ^p`, `ν > 0`, and `xᵢ = √ν ξᵢ θ* + wᵢ`, `i < n`, with all `ξᵢ`, `wᵢ`
independent, `ξᵢ` centred of variance `1` with proxy `1`, and `wᵢ` centred with covariance `I_p`
and `IsSubgaussianVector` with proxy `1`. Then `Σ = νθ*θ*ᵀ + I_p`, with gap `ν` and leading
eigenvector `θ*`, and `Σ̂ = n⁻¹ ∑ xᵢxᵢᵀ`.

- **Spiked ensemble** (`spiked_leading_eigenvector`): there are universal `c₀, c₁, c₂ > 0` such
  that, if `n > p`, `((ν + 1)/ν²)(p/n) ≤ 1/128` and `δ > 0`, then with probability at least
  `1 - c₁ exp(-c₂n min(1, νδ², ν²δ²))`, every leading unit eigenvector `θ̂` of `Σ̂` with
  `⟪θ̂, θ*⟫ ≥ 0` satisfies `‖θ̂ - θ*‖ ≤ c₀√(((ν + 1)/ν²)(p/n)) + δ`. This corrects Wainwright,
  Cor 8.7, p. 245, whose printed exponent `n min(√ν δ, νδ²)` is unbounded in `ν` at fixed `n` and
  `δ` (see the Checks); the two exponents agree when `ν ≥ 1` and `√ν δ ≤ 1`.
  The proof applies 8.1 with `P = Σ̂ - Σ`, split as
  `ν(n⁻¹∑ ξᵢ² - 1)θ*θ*ᵀ + √ν(θ*vᵀ + vθ*ᵀ) + (n⁻¹∑ wᵢwᵢᵀ - I)` with `v = n⁻¹∑ ξᵢwᵢ` (Wainwright,
  (8.21), p. 246). It suffices to take `δ ≤ √2` and `c₀√(((ν + 1)/ν²)(p/n)) < √2`, since
  otherwise the bound holds trivially. The first term satisfies `|n⁻¹∑ ξᵢ² - 1| ≤ 1/32` except
  with probability `2e^{-cn}`, by Bernstein's inequality for the sub-exponential `ξᵢ² - 1` (1.3).
  The second satisfies `‖v‖ ≤ C√(p/n) + √ν δ/64` except with probability
  `2 exp(-cn min(√ν δ, νδ²))`, by a `1/2`-net of the sphere (Tau Ceti
  `TauCeti.exists_finset_isCover_sphere`) and the sub-exponential products `ξᵢ⟪u, wᵢ⟫`. The third
  satisfies `‖n⁻¹∑ wᵢwᵢᵀ - I‖ ≤ C√(p/n) + νδ/128` except with probability
  `2 exp(-cn min(1, ν²δ²))`, by the operator-norm bound of 1.3 at `ε ≤ 1`. Then `‖P‖ ≤ ν/4`, and
  8.1 gives `(2√2/ν)(√ν ‖v‖ + ‖n⁻¹∑ wᵢwᵢᵀ - I‖) ≤ c₀√(((ν + 1)/ν²)(p/n)) + δ`. Each of the
  three exponents dominates `c n min(1, νδ², ν²δ²)`.

**Checks.**
- Large `ν`, negative control for the printed exponent: `p = 2`, `n = 3`, `δ = 1`, Gaussian `ξᵢ`
  and `wᵢ`, `ν → ∞`. On `{|ξᵢ| ≤ 1/ν for all i < 3}`, which has probability `≥ 0.1 ν⁻³`, one has
  `xᵢ = wᵢ + O(ν^{-1/2})`, so `∠(θ̂, θ*) > 70°` with probability bounded below. The failure
  probability is `≳ ν⁻³`, which is `≫ c₁ e^{-3c₂√ν}`, but it is within the constant bound
  `c₁e^{-3c₂}`.
- Small `ν`, a second negative control: `p = 2`, `δ = 1`, `ν → 0` and `n → ∞` with `nν² → ∞`. The
  failure probability is `≍ exp(-cnν²)`, which is `≫ exp(-c₂nν)`, the printed bound there.
- At `ν = 1` and `δ = 1/2`, both exponents equal `n/4`.

*Needs:* 8.1; 1.1, 1.3; RandomMatrices §2.1 (Bernstein's inequality for sub-exponential sums);
Tau Ceti `exists_finset_isCover_sphere`.

### 8.3 High-dimensional limits of sample covariances

Here `X : Matrix (Fin n) (Fin p) ℝ` has rows the observations, and the sample covariance is
`XᵀX/n`, a `p × p` matrix.

- The matrix `XᵀX/n` is Tau Ceti's `TauCeti.sampleSecondMoment` of the rows of `X`, entry by
  entry from the definition, and the statements below are written with it. RandomMatrices
  §4.1 defines the sample covariance `XX*/n` of a `p × n` matrix as the same sample second moment
  of its columns, so `XᵀX/n` is the sample covariance of the `p × n` matrix `Xᵀ` in the sense of
  RandomMatrices, with aspect ratio `y = p/n`. The corners of an infinite i.i.d. array transpose
  to corners of the transposed array.
- **Global law** (`marchenkoPastur_sampleCov_ae`): for the `n × p(n)` corners of an infinite
  real i.i.d. array with mean `0` and variance `1`, `p(n) ≥ 1` and `p(n)/n → y ∈ (0, ∞)`, almost
  surely the empirical spectral measures `p⁻¹ ∑ₖ δ_{λₖ}` of `XᵀX/n` converge weakly to the
  Marchenko–Pastur law `TauCeti.Probability.marchenkoPastur y`: for every bounded continuous
  `f`, `p⁻¹ ∑ₖ f(λₖ(XᵀX/n)) → ∫ f dMP_y`, simultaneously for all `f`. This is the almost-sure
  Marchenko–Pastur law of RandomMatrices §4.4 through the translation (Yao–Zheng–Bai, Thm 2.9,
  p. 12).
- **Largest eigenvalue** (`largest_eigenvalue_sampleCov_ae`): under the same hypotheses and a
  finite fourth moment, `λ_max(XᵀX/n) → (1 + √y)²` almost surely. This is the edge limit of
  RandomMatrices §4.5 through the translation (Yao–Zheng–Bai, Thm 11.1, p. 216).
- **Edge centring and scaling**: with
  `μ_{n,p} = (√(n - 1) + √p)²/n` and
  `σ_{n,p} = (√(n - 1) + √p)((n - 1)^{-1/2} + p^{-1/2})^{1/3}/n`, if `p/n → y ∈ (0, ∞)` then
  `μ_{n,p} → (1 + √y)²` and `n^{2/3} σ_{n,p} → (1 + √y)(1 + 1/√y)^{1/3}`. These are the centring
  and scaling of the Tracy–Widom limit of the boundary list (Yao–Zheng–Bai, (11.3), p. 217, whose
  display of `σ_{n,p}` omits the factor `1/n`; without it `σ_{n,p}` grows like `n^{1/3}`, while
  the fluctuations of `λ_max(XᵀX/n)` are of order `n^{-2/3}`).
- **Spiked covariance** (`spiked_sampleCov_ae`): let `X` be the `n × p(n)` corner of an
  infinite array of independent centred Gaussian variables, of variance `ℓ` in the first column and
  `1` elsewhere, so that the rows are independent `N(0, diag(ℓ, 1, …, 1))`, with `ℓ > 1`,
  `p(n) ≥ 1` and `p(n)/n → y ∈ (0, 1)`. Almost surely,
  `λ_max(XᵀX/n) → ℓ(1 + y/(ℓ - 1)) = ℓ + yℓ/(ℓ - 1)` when `ℓ > 1 + √y` and `→ (1 + √y)²` when
  `ℓ ≤ 1 + √y`; and for every choice of leading unit eigenvectors `û`,
  `⟪û, e₁⟫² → spikeOverlap y ℓ = ((ℓ - 1)² - y)/((ℓ - 1)(ℓ - 1 + y))` when `ℓ > 1 + √y` and
  `→ 0` otherwise. This is RandomMatrices §7.3 through the translation, with
  `T_p = diag(ℓ, 1, …, 1)` and `XᵀX/n = T_p^{1/2}(ZZᵀ/n)T_p^{1/2}` for the `p × n` matrix
  `Z = T_p^{-1/2}Xᵀ`, which has independent standard Gaussian entries, together with the identity
  `(1 - y/(ℓ - 1)²)/(1 + y/(ℓ - 1)) = ((ℓ - 1)² - y)/((ℓ - 1)(ℓ - 1 + y))` for `ℓ > 1`, `y ≥ 0`.
  The limits above the threshold are Yao–Zheng–Bai, Thm 11.3, p. 220, and Thm 11.5, p. 223,
  where `ψ(ℓ) = ℓ + yℓ/(ℓ - 1)` and `ℓψ'(ℓ)/ψ(ℓ)` is the squared overlap.
- **Limiting overlap**: for `y > 0` and
  `ℓ > 1 + √y` the limit `spikeOverlap y ℓ` lies in `(0, 1)`; it tends to `0` as `ℓ ↓ 1 + √y`
  and to `1` as `ℓ → ∞`.
- **Inconsistency of the leading sample eigenvector**
  (`spiked_sampleEigenvector_not_tendsto_one`): under the hypotheses of the spiked covariance,
  for every `ℓ > 1`, almost surely no choice of leading unit eigenvectors `û` has
  `|⟪û, e₁⟫| → 1`: `û` is not a consistent estimator of `±e₁` (Yao–Zheng–Bai, Cor 11.6,
  pp. 225–226, for `ℓ > 1 + √y`). The proof combines the spiked covariance limits with the
  limiting overlap: the limit of `⟪û, e₁⟫²` is `spikeOverlap y ℓ < 1` or `0`.

*Needs:* RandomMatrices §§4.1, 4.4, 4.5, 7.3; Tau Ceti `sampleSecondMoment`,
`marchenkoPastur`.

**Checks.**

- `spikeOverlap`: for `y = 1/4`, `spikeOverlap y 2 = 3/5` and `spikeOverlap y 3 = 5/6`; at the
  threshold `ℓ = 3/2` it is `0`.
- `spikeOverlap`, negative control: below the threshold the formula is not the limit: for
  `y = 1/4` and `ℓ = 6/5`, `spikeOverlap y ℓ = -7/3 < 0`, which is why the limit there is `0`.
- `spikeOverlap`: it is the squared overlap, not the overlap: Yao–Zheng–Bai's length of the
  projection on the spike is `d = √(spikeOverlap y ℓ)`, `√(3/5) ≈ 0.775` for `y = 1/4`, `ℓ = 2`.
- Spiked covariance at the threshold `ℓ = 1 + √y`: `ℓ(1 + y/(ℓ - 1)) = (1 + √y)²`, so the
  eigenvalue limit is continuous there.

### Examples

- Davis–Kahan: `Σ = diag(2, 1)` (`ν = 1`, `θ* = e₁`) and `P = [[0, 1/4], [1/4, 0]]`: the bound is
  `√2 · (1/4)/(1 - 1/2) ≈ 0.7071` (Wainwright's constant `2` gives `1`), and the leading eigenvector
  `(0.9732, 0.2298)` of `Σ + P` is at distance `0.2313` from `e₁`. With `P = diag(-1/2, 1/2)`,
  `‖P‖ = ν/2` and `Σ + P = (3/2)I` has no unique leading eigenvector: the strict inequality is
  needed.
- Spiked covariance with `y = 1/4`: the threshold is `ℓ = 3/2` with bulk edge `9/4`; for `ℓ = 2`
  the outlier is `5/2` with squared overlap `3/5`, and for `ℓ = 3` it is `27/8` with `5/6`.
- Edge centring, `y = 1`: `μ_{n,n} → 4` and `n^{2/3}σ_{n,n} → 2 · 2^{1/3} ≈ 2.520`.

### Dependencies

Layer 1 (1.1, 1.3 for 8.2); Tau Ceti's Weyl inequality, residual `sin Θ` theorem and nets;
OperatorTheory/SpectralSubspacePerturbation (SSP-C17); RandomMatrices §§2.1, 2.4 (through 1.3),
4.1, 4.4, 4.5, 7.3.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Edge fluctuations of sample covariances**: the Tracy–Widom limit
  `(λ_max(XᵀX/n) - μ_{n,p})/σ_{n,p} ⇒ F₁` for Gaussian `X` with `p/n → y ∈ (0, ∞)`
  (Johnstone 2001; Yao–Zheng–Bai, Thm 11.1, p. 216, and (11.3), p. 217), and its complex
  analogue with `F₂`. It needs the edge asymptotics of the Laguerre ensembles, which
  RandomMatrices (§§5.3, 8.4, 8.5) does not reach: it proves the Tracy–Widom laws for the
  Gaussian unitary and orthogonal ensembles only. 8.3 owns the centring and scaling.
- **Spiked models outside RandomMatrices §7.3**: the spike limits and eigenvector overlaps for
  `y ≥ 1`, for non-Gaussian entries, and for several spikes of equal size (Yao–Zheng–Bai,
  Cor 11.6, p. 225, covers all `y > 0`); fluctuations of spiked eigenvalues (the
  Baik–Ben Arous–Péché transition).
- **Constants that rest on other tools**: the explicit constant `e/(4(2e + 1)²)` of the sparse
  regression lower bound (Giraud, Thm 3.5, p. 64), which uses Birgé's lemma; the constants `10`
  and `2e^{-2nδ²}` of Wainwright's trace-regression corollary, which use the Gordon–Slepian
  comparison inequality; the printed constants of Wainwright's covariance-thresholding and
  graphical-lasso statements (Thm 6.23, p. 181; Prop 11.9, p. 355). 5.2, 7.1, 7.2 and 7.4 state
  universal constants.
- **Gaussian comparison**: Slepian's and Gordon's inequalities, Gaussian widths, and the
  phase transitions of basis pursuit.
- **Further estimators**: the square-root and scaled lasso, estimation of the noise level, the
  elastic net, the group lasso, SLOPE, nonconvex penalties, the Dantzig selector, matrix
  completion, sparse principal components and their minimax rates.
- **Construction of debiasing matrices**: the nodewise lasso and the conditions under which
  `√n maxⱼₖ |(Θ̂Σ̂ - I)ⱼₖ| ‖β̂ - β‖₁ → 0` for random designs; 3.8 takes them as hypotheses.
- **Further multiple testing**: adaptive procedures (Storey), knockoffs, online false
  discovery rate control, and family-wise error rate procedures.
- **Sharp asymptotics**: the asymptotic minimax constant `2σ²s log(p/s)` (Johnstone, Thm 8.21,
  p. 243), information-theoretic lower bounds for graphical model selection, and the exact
  asymptotics of the lasso risk.
- Every result not listed in a layer.

## Prior formalization

Parts of Layers 1–8 are formalized in `CKSD/Nonparametric/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD), the Core Knowledge of Statistics and Data
Science project. There:
- the lasso basic inequality and compatibility bounds, the Benjamini–Hochberg bound under
  independence, the soft-threshold minimax bounds (with `c = 1/512`, `C = 17`), exact and stable
  sparse recovery, thresholded covariance with the Schur test, and the penalized model selection
  oracle inequality (with `κ₀ = 8`, `C = 23`) are proved;
- the graphical-model and Tracy–Widom statements are stated with admitted proofs.

The completions this roadmap adds are not there: the slow rate and the restricted eigenvalue
route of 3.2 and 3.4–3.5, support recovery, debiasing, the
PRDS theory and the Benjamini–Yekutieli bound, trace regression, the Davis–Kahan residual bound
and the spiked ensemble. The map below follows lean-CKSD's numbering of its synopsis items
(SYNOPSIS103, items 33–38, 41–44, 47–55) and is not prescriptive:

| Layer | Synopsis items | lean-CKSD files |
|---|---|---|
| 1 | supporting | Nonparametric: GaussianProjection, LowerBounds |
| 2 | 48, 49 | Nonparametric/SparseRecovery: Basic, Nullspace, Robust |
| 3 | 34, 41, 42, 43, 50 | Nonparametric: HighDimensional, Models |
| 4 | 35, 36, 47 (upper bound) | Nonparametric: ShapeAndSelection, GaussianProjection |
| 5 | 33, 47 (lower bound) | Nonparametric: Models, LowerBounds |
| 6 | 37, 44 | Nonparametric: HighDimensional |
| 7 | 51, 52, 53 | Nonparametric: CovarianceThresholding, GraphicalModels |
| 8 | 38, 54, 55 | Nonparametric: EmpiricalCovariance, TracyWidom |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) proves the testing identity
  `inf_ψ (P₀(ψ = 1) + P₁(ψ = 0)) = 1 - tvDist/2`, the Bretagnolle–Huber inequality, tensorization
  of the divergence and Fano-type bounds for Bayes risks; these sit under the lower-bound toolkit
  that Layer 5 consumes.

## Downstream consumers

No other roadmap consumes the results of this one.

## References

The locators refer to these editions; page numbers are printed page numbers.

- M. J. Wainwright, *High-Dimensional Statistics: A Non-Asymptotic Viewpoint*, Cambridge
  University Press, 2019.
- C. Giraud, *Introduction to High-Dimensional Statistics*, 2nd ed., CRC Press, 2022.
- S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing*, Birkhäuser,
  2013.
- S. van de Geer, *Estimation and Testing Under Sparsity*, Lecture Notes in Mathematics 2159,
  Springer, 2016.
- I. M. Johnstone, *Gaussian Estimation: Sequence and Wavelet Models*, book manuscript, draft
  version of August 9, 2017.
- T. Dickhaus, *Simultaneous Statistical Inference*, Springer, 2014.
- P. Massart, *Concentration Inequalities and Model Selection*, Lecture Notes in Mathematics
  1896, Springer, 2007.
- S. Boucheron, G. Lugosi and P. Massart, *Concentration Inequalities*, Oxford University Press,
  2013.
- J. Yao, S. Zheng and Z. Bai, *Large Sample Covariance Matrices and High-Dimensional Data
  Analysis*, Cambridge University Press, 2015.
- R. Vershynin, *High-Dimensional Probability: An Introduction with Applications in Data
  Science*, Cambridge University Press, 2018 (cited as V in the RandomMatrices contract).

Also cited:

- P. J. Bickel and E. Levina, Covariance regularization by thresholding, *Ann. Statist.* 36
  (2008), 2577–2604.
- E. J. Candès and Y. Plan, Tight oracle inequalities for low-rank matrix recovery from a
  minimal number of noisy random measurements, *IEEE Trans. Inform. Theory* 57 (2011),
  2342–2359.
- I. M. Johnstone, On the distribution of the largest eigenvalue in principal components
  analysis, *Ann. Statist.* 29 (2001), 295–327.

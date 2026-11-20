# Roadmap: Kernels and spectral methods

**Summary.** This roadmap builds two families of tools that data analysis applies to point
clouds and to probability laws: spectral methods on weighted graphs and Euclidean
configurations, and distances between laws defined through positive-definite kernels. The first
half covers weighted graph Laplacians and their spectra, the Cheeger inequality, random-walk
diffusion distances, classical scaling and low-rank approximation, graph approximations of
geodesic distances, support estimation, Procrustes shape analysis and extrinsic means. The second
half covers kernel mean embeddings and the maximum mean discrepancy (MMD), characteristic kernels,
the comparison of MMD with the Wasserstein, total-variation and Dudley distances and the
metrization of weak convergence, the limit laws and calibration of kernel two-sample and
independence tests (MMD, energy distance, distance covariance, HSIC, permutation tests), kernel
Stein discrepancies, conditional mean embeddings and random Fourier features. The main sources
are Chung's *Spectral Graph Theory*, Grigor'yan's *Introduction to Analysis on Graphs*, Fiedler's
*Matrices and Graphs in Geometry*, Wang's *Geometric Structure of High-Dimensional Data and
Dimensionality Reduction*, Mardia–Kent–Bibby's *Multivariate Analysis*, Dryden–Mardia's
*Statistical Shape Analysis*, Bhattacharya–Bhattacharya's *Nonparametric Inference on
Manifolds*, Berlinet–Thomas-Agnan's *Reproducing Kernel Hilbert Spaces in Probability and
Statistics*, Wendland's *Scattered Data Approximation*, Schölkopf–Smola's *Learning with
Kernels*, Saitoh–Sawano's *Theory of Reproducing Kernels and Applications* and
Peters–Janzing–Schölkopf's *Elements of Causal Inference*, with research papers where no book
states a result.

## Scope and ownership

Completion means that every target below is proved in Tau Ceti, against Mathlib and Tau Ceti as
pinned and the sections of other roadmaps named under Exact supplier contracts. The owned subjects
are:

- weighted graphs with loops, their degree, combinatorial, normalized and random-walk Laplacians,
  the kernels and spectra of these Laplacians, and the bridge to Mathlib's
  `SimpleGraph.lapMatrix` (Layer 1);
- the Rayleigh-quotient spectral gap, the spectral relaxation of the normalized cut, Laplacian
  eigenmaps and locally linear embedding (Layer 2);
- conductance, the Cheeger constant and the Cheeger inequality for the normalized Laplacian of a
  weighted graph (Layer 3);
- the random walk of a weighted graph, its `L²(π)` spectral expansion, diffusion maps and
  diffusion distances (Layer 4);
- classical multidimensional scaling, the best positive semidefinite approximation of bounded
  rank, graph approximation of geodesic distances in the Isomap setting, and the `O_P` rate of
  Hausdorff estimation of a support under a local small-ball bound (Layer 5);
- ordinary and generalized Procrustes analysis, the full and partial Procrustes distances, the
  planar full Procrustes mean, and the extrinsic mean of a law on a Euclidean set with its central
  limit theorem (Layer 6);
- kernel mean embeddings of finite measures, the MMD and its unit-ball form, the witness
  function, and the concentration of empirical mean embeddings (Layer 7);
- characteristic kernels: the Fourier criterion for translation-invariant kernels, scale
  mixtures of Gaussians, and the moment blindness of polynomial kernels (Layer 8);
- the comparison of MMD with coupling costs, `W₁` and total variation, the Dudley distance, and
  the metrization of weak convergence by MMD (Layer 9);
- unbiased and biased MMD statistics with their null and alternative limits, energy distance,
  distance covariance, HSIC with its Gram-matrix form, and permutation tests (Layer 10);
- kernel Stein discrepancies and their convergence under `W₁`, the covariance identity of
  conditional mean embeddings with the regularized estimator, and random Fourier features
  (Layer 11).

**Not owned here.**

- Reproducing-kernel Hilbert spaces, the Moore–Aronszajn construction, the Kolmogorov feature
  space, universal kernels and the injectivity of the mean embedding of a universal kernel on a
  compact space are Mathlib's `RKHS` and Tau Ceti's kernel library; they are consumed.
- Bochner's theorem is Tau Ceti's `TauCeti.bochner`; it is consumed.
- The representer theorem and smoothing splines are MathematicalStatisticsNonparametric 5.8.
- Limit laws of nondegenerate and degenerate U-statistics are MathematicalStatisticsAsymptotic
  6.2 and 6.3; the multivariate central limit theorem is MathematicalStatisticsAsymptotic 1.2;
  the delta method and Slutsky's lemma are MathematicalStatisticsFoundations 8.4. They are
  consumed by Layers 6 and 10.
- Wasserstein distances, Kantorovich–Rubinstein duality and the bounded-Lipschitz metrization of
  weak convergence are Tau Ceti's optimal-transport library and OptimalTransport Layer 3.
- Fréchet radii and barycenters, their existence on proper spaces, uniqueness in CAT(0) spaces
  and the strong consistency of empirical barycenters are Tau Ceti's Fréchet-mean files and
  OptimalTransport Layer 12. This roadmap owns only the extrinsic mean of Layer 6.4; intrinsic
  means on manifolds are listed under Beyond.
- Sinkhorn divergences and their relation to kernel energies are OptimalTransport 13.4.
- Gram factorizations of positive semidefinite matrices and their uniqueness are
  OperatorTheory/MatrixSpectralStatistics, items MSS-A05 to MSS-A09.
- The spectral decomposition of a reversible Markov kernel and Cheeger's inequality for its
  bottleneck ratio are MarkovChainMixing 2.1 and 3.2, stated for Markov kernels. This roadmap
  owns the weighted-matrix forms (3.2 and 4.1) and proves them from its Layers 1–2; the dictionary
  between the two is recorded under Downstream consumers.
- Kernel ridge regression, its risk bounds and kernel methods for classification belong to a
  separate roadmap on statistical learning theory.
- Persistent homology, its stability and its statistical inference are TopologicalDataAnalysis.
  The sampling bound for the Hausdorff distance from a sample to the support of a law that is
  standard at every radius is its 8.4, consumed by 5.4.
- The statistical rates of optimal transport are listed under Beyond.

## Conventions

- **Weighted graphs.** A weighted graph on a finite type `V` is a matrix `W : Matrix V V ℝ` with
  `IsWeightedGraph W`: symmetric with nonnegative entries. Loops (`W i i > 0`) are allowed, as in
  Chung §1.4, p. 12; a loop counts once in the degree `degree W i = ∑ⱼ Wᵢⱼ`. The graph of positive
  weights `positiveGraph W` is a Mathlib `SimpleGraph` and drops loops; connectivity, components
  and bipartiteness refer to it.
- **Laplacians.** `laplacian W = D - W` with `D = diag(d)`; `normalizedLaplacian W` is
  `D^{-1/2} L D^{-1/2}` with `0⁻¹ = 0`, so a vertex of degree `0` has a zero row and column, which
  is Chung's convention for isolated vertices (Chung §1.2, p. 2); `randomWalkLaplacian W` is
  `D⁻¹ L`. Eigenvalues of `𝓛` are written in increasing order `0 = λ₀ ≤ λ₁ ≤ …` in the prose;
  Mathlib's `Matrix.IsHermitian.eigenvalues₀` lists them in decreasing order and the Lean
  statements index accordingly. Most theorems assume positive degrees.
- **Kernels.** A kernel on a type `X` is `k : X → X → ℝ` with a proof `hk : Matrix.PosSemidef k`:
  Mathlib's definition quantifies over finitely supported coefficient vectors, so it applies to
  arbitrary `X`. Its feature map is `hk.kolmogorovFeature : X → hk.KolmogorovSpace` with
  `⟪Φ x, Φ y⟫ = k x y`, and the mean embedding of a measure is the Bochner integral
  `hk.kernelMeanEmbedding μ = ∫ Φ dμ` (Tau Ceti). A Bochner integral of a non-integrable function
  is `0`, so every statement about an embedding carries `Integrable hk.kolmogorovFeature μ`, which
  7.1 discharges for bounded continuous kernels on second-countable spaces. Unbounded kernels (the
  distance-induced kernel and the polynomial kernel) carry moment hypotheses instead.
- **MMD.** `mmd hk μ ν = ‖m μ - m ν‖`, a real number. By Tau Ceti's
  `Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq` its square is
  `∫∫ k dμ dμ - 2 ∫∫ k dμ dν + ∫∫ k dν dν`.
- **Test statistics.** Two samples of equal size `n` are paired as `zᵢ = (xᵢ, yᵢ)`. The unbiased
  statistic `mmdU k n z` is the U-statistic of order `2` of
  `h(z, z') = k(x, x') + k(y, y') - k(x, y') - k(x', y)`, which omits all pairs with equal
  indices; the biased statistic `mmdV k n z` is the V-statistic, the squared MMD of the two
  empirical laws. Gretton et al. also use an unbiased statistic that keeps the cross terms
  `k(xᵢ, yᵢ)`; for independent samples it differs from `mmdU` by `o_P(n⁻¹)` and has the same
  null limit.
- **Total variation.** Mathlib's `MeasureTheory.tvDist μ ν` is the total variation norm
  `|μ - ν|(X)`, with values in `[0, 2]` for probability measures; it is twice
  `sup_A |μ(A) - ν(A)|`. All bounds below use Mathlib's normalization.
- **Fourier conventions.** Tau Ceti's `TauCeti.fourierAtom v q` is `exp(-2πi⟪v, q⟫)` and Bochner's
  theorem represents a continuous positive-definite `ψ` as `ψ(v) = ∫ fourierAtom v q dΛ(q)`.
  Mathlib's `MeasureTheory.charFun μ t` is `∫ exp(i⟪x, t⟫) dμ`. The two meet at `t = 2π q`.
- **Samples.** A sample of size `n` from `P` is a point of `Fin n → X` under `Measure.pi`; an
  i.i.d. sequence is a point of `ℕ → X` under `Measure.infinitePi`.
- **Shapes.** A configuration of `k` landmarks in `ℝᵐ` is a matrix `Z : Matrix (Fin k) (Fin m) ℝ`
  whose rows are landmarks. A pre-shape is centred with unit Frobenius norm. Rotations are
  `Matrix.specialOrthogonalGroup (Fin m) ℝ`, so reflections are not quotiented out.
- **Junk values.** `fiedlerValue W` and `cheegerConstant W` are real infima, and both are `0` when
  `card V = 1`: the index set of `cheegerConstant` is empty, and that of `fiedlerValue` is empty
  when the vertex carries a loop and otherwise consists of all nonzero `g`, with quotient
  `0/0 = 0`; the theorems assume `2 ≤ card V`. The
  normalized cut and conductance divide by volumes, which vanish only for `S = ∅` or
  `S = univ`, excluded by the hypotheses. `procrustesCos` is a real supremum over the compact group
  `SO(m)`, which is bounded. Quantities that can be infinite are in `ℝ≥0∞`:
  `sampleGraphEDist` (no walk) and `dudleyDist` (a supremum).

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.lapMatrix`, `SimpleGraph.degMatrix`, `SimpleGraph.posSemidef_lapMatrix`,
  `SimpleGraph.lapMatrix_mulVec_eq_zero_iff_forall_reachable` and
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`
  (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`): the Laplacian of a simple graph, its
  positivity and its kernel. Layer 1 extends them to weights.
- `SimpleGraph.IsBipartite` and `SimpleGraph.induce`
  (`Mathlib/Combinatorics/SimpleGraph/Maps.lean`).
- `Matrix.IsHermitian.eigenvalues₀` with `Matrix.IsHermitian.eigenvalues₀_antitone`
  (`Mathlib/Analysis/Matrix/Spectrum.lean`), `Module.End.HasEigenvalue`,
  `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean`), and
  `Matrix.PosSemidef.kronecker` (`Mathlib/Analysis/Matrix/Order.lean`, finite index types).
- `Matrix.specialOrthogonalGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`).
- `RKHS` and `RKHS.kerFun` (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`).
- `MeasureTheory.charFun` and `MeasureTheory.Measure.ext_of_charFun`
  (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`).
- `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`).
- `MeasureTheory.IsTightMeasureSet` and `isCompact_closure_of_isTightMeasureSet`
  (`Mathlib/MeasureTheory/Measure/Tight.lean`, `Mathlib/MeasureTheory/Measure/Prokhorov.lean`).
- `MeasureTheory.TendstoInDistribution`
  (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`), `ProbabilityTheory.HasLaw`,
  `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.multivariateGaussian`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`) and the central limit theorem
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`
  (`Mathlib/Probability/CentralLimitTheorem.lean`).
- `ProbabilityTheory.HasSubgaussianMGF.measure_ge_le` and
  `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun` (Hoeffding).
- `MeasureTheory.Measure.condKernel` (`Mathlib/Probability/Kernel/Disintegration/`),
  `MeasureTheory.Measure.infinitePi` (`Mathlib/Probability/ProductMeasure.lean`),
  `Metric.hausdorffDist`, `gradient` (`Mathlib/Analysis/Calculus/Gradient/Basic.lean`).

### From Tau Ceti

- `Matrix.PosSemidef.KolmogorovSpace`, `Matrix.PosSemidef.kolmogorovFeature`,
  `Matrix.PosSemidef.inner_kolmogorovFeature`, `Matrix.PosSemidef.norm_kolmogorovFeature_sub_sq`
  and `Matrix.PosSemidef.continuous_kolmogorovFeature`
  (`TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`).
- `Matrix.PosSemidef.kernelMeanEmbedding`,
  `Matrix.PosSemidef.inner_kolmogorovFeature_kernelMeanEmbedding`,
  `Matrix.PosSemidef.inner_kernelMeanEmbedding`,
  `Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq`,
  `Matrix.PosSemidef.integrable_kolmogorovFeature` (compact space) and
  `Matrix.PosSemidef.kernelMeanEmbedding_inj` (universal kernel on a compact space)
  (`TauCeti/Analysis/PositiveDefinite/Kernel/MeanEmbedding.lean`), with `TauCeti.IsUniversalKernel`
  (`…/Kernel/Universal.lean`).
- `TauCeti.bochner`, `TauCeti.bochner_euclideanSpace` and `TauCeti.fourierAtom`
  (`TauCeti/Analysis/Bochner/BochnerTheorem.lean`,
  `TauCeti/Analysis/PositiveDefinite/FourierAtom.lean`), and
  `TauCeti.posSemidef_cexp_neg_mul_sq_norm` (`TauCeti/Analysis/Bochner/Gaussian/Basic.lean`).
- `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` (Ky Fan's maximum principle)
  and `LinearMap.exists_linearIsometryEquiv_trace_comp_eq_kyFanSum`
  (`TauCeti/Analysis/InnerProductSpace/KyFan.lean`),
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (Courant–Fischer,
  `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`) and
  `TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le`
  (`TauCeti/Analysis/InnerProductSpace/Orthonormal/Procrustes.lean`).
- `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` (the Hoffman–Wielandt
  inequality, `TauCeti/Analysis/Matrix/HoffmanWielandt.lean`).
- `TauCeti.coveringNumber_le_of_subset_closedBall` and
  `TauCeti.exists_finset_isCover_of_subset_closedBall`
  (`TauCeti/Analysis/Normed/Module/CoveringNumber.lean`).
- `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences` (McDiarmid,
  `TauCeti/Probability/McDiarmid.lean`).
- `TauCeti.covMatrix` (`TauCeti/Probability/Moments/Covariance.lean`) and
  `TauCeti.Probability.empiricalFiniteMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`).
- `TauCeti.IsCoupling`, `TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_one_eq_iSup` and
  `TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`
  (`TauCeti/MeasureTheory/OptimalTransport/`).
- `TauCeti.IsFrechetBarycenter`, `TauCeti.exists_isFrechetBarycenter`,
  `TauCeti.subsingleton_frechetBarycenters_two` and
  `TauCeti.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae`
  (`TauCeti/MeasureTheory/Measure/FrechetMean/`).

### From MathematicalStatisticsFoundations

- 2.4: the U-statistic, used here through a local copy `uStatistic` whose docstring names the
  owner.
- 8.2: boundedness in probability, used through a local copy `IsBoundedInProbability`.
- 8.4: the delta method, consumed by 6.4.
- 8.5: i.i.d. sequences and the identification of the law of the first `n` terms with
  `Measure.pi`, consumed by 5.4, 6.4 and 7.3.

### From MathematicalStatisticsAsymptotic

- 1.2: the multivariate central limit theorem in `EuclideanSpace ℝ (Fin k)` with limit law
  `multivariateGaussian 0 (covMatrix P)`, consumed by 6.4.
- 6.2: the limit law of a nondegenerate U-statistic, consumed by 10.2 (alternative).
- 6.3: the Hoeffding decomposition and the limit law `∑ λⱼ (Zⱼ² - 1)` of a degenerate quadratic
  U-statistic in the eigen-expansion form, consumed by 10.2 (null).

### From MathematicalStatisticsNonparametric

- 5.8: the representer theorem for Mathlib's `RKHS`, consumed by 11.3 for the regularized
  conditional mean embedding.

### From OptimalTransport

- Layer 3: the Wasserstein distance and Kantorovich–Rubinstein duality, consumed by 9.1, 9.2
  and 11.2 through the Tau Ceti declarations above.
- Layer 12, sections 12.2 and 12.8: existence and strong consistency of Fréchet barycenters,
  cited in 6.4.

### From OperatorTheory/MatrixSpectralStatistics

- MSS-A05 to MSS-A07: a positive semidefinite matrix of rank at most `p` is a Gram matrix
  `AᵀA` of a matrix with `p` rows; MSS-A09: two such factors differ by an orthogonal matrix.
  Consumed by 5.1.

### From TopologicalDataAnalysis

- 8.4: the sampling bound
  `P(d_H(X̂_n, S) > ε) ≤ max(1, 4ᵇ/(a εᵇ)) exp(-n min(1, a εᵇ/2ᵇ))` for a law with compact support
  `S` and `μ(closedBall x r) ≥ min(1, a rᵇ)` for `x ∈ S` and every `r > 0`. Consumed by 5.4.
- 5.3: the small-ball bound at small radii for a law on a compact submanifold of positive reach
  with density bounded below. Cited in 5.4.

## How to read the build

There are two strands. The spectral strand runs Layer 1 → 2 → 3 and 1 → 4, with Layer 5 resting
on Layer 1, Mathlib's spectral theorem and, for 5.4, the sampling bound of TopologicalDataAnalysis
8.4, and Layer 6 resting on Mathlib and Tau Ceti.
The kernel strand runs Layer 7 → 8 → 9 → 10 → 11; Layer 10.4 uses Layer 8's characteristic
kernels, and Layer 11.4 uses only Layer 7. Each layer lists its definitions, its targets with
their Lean names where `Suggested.lean` states them, locators or proof routes, and a `*Needs:*`
line. `Suggested.lean` states the headlines that carry a Lean name, each with every conclusion
attached to it here; it is not an exhaustive acceptance test. The targets stated only in prose
are listed in its module docstring with what each lacks for a Lean statement; they are targets of
this roadmap all the same, with their locators or proof routes.

## Layer 1: Weighted graphs and their Laplacians

### 1.1 Weighted graphs

- `IsWeightedGraph W`: `W` is symmetric with nonnegative entries. `degree W i = ∑ⱼ Wᵢⱼ`.
- `laplacian W = diag(degree W) - W`; `normalizedLaplacian W = D^{-1/2} L D^{-1/2}` with
  `(√0)⁻¹ = 0`; `randomWalkLaplacian W = D⁻¹ L`; `positiveGraph W` is the simple graph with an
  edge `i ~ j` for `i ≠ j` and `0 < Wᵢⱼ` or `0 < Wⱼᵢ`.
- Chung §1.4, p. 12, defines the weighted Laplacian with loops; Fiedler §6.1, pp. 145–146, gives
  the combinatorial Laplacian of a weighted graph and its quadratic form; Wang Ch. 3, p. 68
  (Theorem 3.1), writes the normalized Laplacian as `SᵀS`.
- `laplacian_adjMatrix`: for a simple graph `G`, `laplacian (G.adjMatrix ℝ) = G.lapMatrix ℝ`.
  Proof: `degree (G.adjMatrix ℝ) i` is `G.degree i` (Mathlib's sum of an adjacency row), and both
  sides are `diag(d) - A`.

*Needs:* Mathlib `SimpleGraph.lapMatrix`, `SimpleGraph.degMatrix`, `SimpleGraph.fromRel`.

### 1.2 The quadratic form

- `laplacian_quadForm`: for a weighted graph,
  `fᵀ L f = ½ ∑ᵢ ∑ⱼ Wᵢⱼ (fᵢ - fⱼ)²`, and both `L` and `𝓛` are positive semidefinite (Fiedler
  §6.1, p. 145; Grigor'yan Lemma 2.4, p. 31, Green's formula; Keller–Lenz–Wojciechowski
  Proposition 0.8, p. 11). Proof: expand `∑ᵢ dᵢ fᵢ² - ∑ᵢⱼ Wᵢⱼ fᵢ fⱼ` and symmetrize with
  `W = Wᵀ`; loops contribute `0`. For `𝓛` substitute `f = D^{-1/2} g`.
- `isHermitian_normalizedLaplacian`: `𝓛` is symmetric when `W` is.

*Needs:* 1.1.

### 1.3 Kernels and connected components

- `finrank_ker_laplacian`: `L f = 0` exactly when `f` is constant along every path of
  `positiveGraph W`, and the dimension of `ker L` is the number of connected components.
- `finrank_ker_normalizedLaplacian`: with positive degrees, `𝓛 g = 0` exactly when `g / √d` is
  constant on components, and `ker 𝓛` and `ker L_{rw}` both have the number of components as
  dimension (Chung Lemma 1.7(iv), pp. 6–7; Fiedler §6.1, (L 4), p. 145).
- Proof route: by 1.2, `fᵀ L f = 0` forces `fᵢ = fⱼ` whenever `Wᵢⱼ > 0`, and a positive
  semidefinite matrix annihilates `f` exactly when its quadratic form vanishes at `f`; this is
  Mathlib's `SimpleGraph.lapMatrix_mulVec_eq_zero_iff_forall_reachable` argument with weights.
  The basis of indicator functions of components gives the dimension, as in
  `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`. For `𝓛` and `L_{rw}`
  multiply by the invertible diagonal `D^{1/2}` and `D⁻¹`.

*Needs:* 1.2.

### 1.4 The spectrum of the normalized Laplacian

- `spectrum_normalizedLaplacian`: with positive degrees every eigenvalue of `𝓛` lies in `[0, 2]`;
  if moreover `W` has no loops, `2` is an eigenvalue exactly when some connected component of
  `positiveGraph W` is bipartite (Chung Lemma 1.7(v), pp. 6–7; Grigor'yan Theorem 2.7, p. 32).
- Proof route: `0 ≤ λ` is 1.2. For the upper bound
  `∑ Wᵢⱼ (fᵢ - fⱼ)² ≤ 2 ∑ Wᵢⱼ (fᵢ² + fⱼ²) = 4 ∑ dᵢ fᵢ²` gives `gᵀ 𝓛 g ≤ 2 ‖g‖²`. Equality forces
  `fᵢ = -fⱼ` whenever `Wᵢⱼ > 0`; without loops, on a component where `f ≠ 0` the sign of `f` is
  a proper 2-colouring, and conversely the signed indicator of a 2-colouring of a component is an
  eigenvector for `2`. A loop at `i` with `fᵢ ≠ 0` makes the inequality strict, which is why loops
  are excluded from the second statement.

*Needs:* 1.2, 1.3; Mathlib `SimpleGraph.IsBipartite`, `SimpleGraph.induce`.

**Checks.**

- `IsWeightedGraph`: the adjacency matrix of every simple graph is a weighted graph.
- `IsWeightedGraph`: `[[0, 1], [2, 0]]` is not (not symmetric), and neither is
  `[[0, -1], [-1, 0]]` (a negative weight).
- `IsWeightedGraph`: `[[1, 1], [1, 0]]`, an edge with a loop at vertex `0`, is a weighted graph.
- `degree`: on the path `P₃` (`0 ~ 1 ~ 2`) the degrees are `(1, 2, 1)`; on `K₃` they are all `2`.
- `degree`: the loop graph `[[1, 1], [1, 0]]` has degrees `(2, 1)`; a convention counting loops
  twice would give `(3, 1)`.
- `degree`: the zero matrix has all degrees `0`.
- `laplacian`: on `P₃` it is `[[1, -1, 0], [-1, 2, -1], [0, -1, 1]]`.
- `laplacian`: the loop graph `[[1, 1], [1, 0]]` has the same Laplacian `[[1, -1], [-1, 1]]` as
  `K₂`, since loops cancel in `D - W`.
- `laplacian`: every row sums to `0`, so `L 𝟙 = 0` for every `W`.
- `normalizedLaplacian`: on `K₂` it is `[[1, -1], [-1, 1]]`, with eigenvalues `0, 2`.
- `normalizedLaplacian`: on `P₃` the off-diagonal entries are `-1/√2`, and the eigenvalues are
  `0, 1, 2`.
- `normalizedLaplacian`: the loop graph `[[1, 1], [1, 0]]` gives `[[1/2, -1/√2], [-1/√2, 1]]`,
  with eigenvalues `0` and `3/2`; its positive graph `K₂` is bipartite, so the loop-free
  hypothesis of 1.4 cannot be dropped.
- `normalizedLaplacian`: on a single vertex with `W = 0` it is `0`, not undefined.
- `randomWalkLaplacian`: on `P₃` it is `[[1, -1, 0], [-1/2, 1, -1/2], [0, -1, 1]]`, which is not
  symmetric, with eigenvalues `0, 1, 2` like `𝓛`.
- `randomWalkLaplacian`: on `K₃` it is `I - ½ (J - I)`, with eigenvalues `0, 3/2, 3/2`.
- `randomWalkLaplacian`: a vertex of degree `0` gives a zero row.
- `positiveGraph`: of the adjacency matrix of `K₃` it is `K₃`.
- `positiveGraph`: of the loop graph `[[1, 1], [1, 0]]` it is `K₂`; the loop is dropped.
- `positiveGraph`: of the zero matrix on `n` vertices it has no edges and `n` components.

### Examples

- `K₂`: `𝓛` has eigenvalues `0, 2`, and `K₂` is bipartite.
- `K₃`: `𝓛` has eigenvalues `0, 3/2, 3/2` (Chung Example 1.1, p. 6: `0` and `n/(n - 1)`); no
  eigenvalue `2`, since `K₃` is not bipartite.
- Two disjoint copies of `K₂` with weights `1` and `2`: `𝓛` has eigenvalues `0, 0, 2, 2`; the
  kernel has dimension `2`, the number of components.
- The 4-cycle `C₄`: eigenvalues `0, 1, 1, 2`.

### Dependencies

Mathlib's simple-graph Laplacian and matrix library only.

## Layer 2: Rayleigh quotients, cuts and eigenmaps

### 2.1 The spectral gap

- `fiedlerValue W` is the infimum of `gᵀ L g / ∑ dᵢ gᵢ²` over nonzero `g` with `∑ dᵢ gᵢ = 0`
  (Chung (1.2), p. 4; Fiedler's algebraic connectivity, Fiedler §6.1, p. 146, is the
  corresponding eigenvalue of `L`).
- `fiedlerValue_spec`: for a weighted graph with positive degrees and `2 ≤ card V`,
  - `fiedlerValue W` is an eigenvalue of `𝓛`, and every eigenvalue below it is `0`;
  - `0 < fiedlerValue W` exactly when `positiveGraph W` is connected (Chung Lemma 1.7(iv),
    pp. 6–7);
  - `fiedlerValue W ≤ n / (n - 1)` for `n = card V` (Chung Lemma 1.7(ii), pp. 6–7);
  - `fiedlerValue W ≤ normalizedCut W S` for every nonempty proper `S` (2.2).
- Proof route: substitute `g = D^{-1/2} u`; the constraint becomes `u ⊥ √d`, and `√d` spans an
  eigenvector of `𝓛` for `0`. Courant–Fischer (Tau Ceti's
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`)
  on the orthogonal complement identifies the infimum with the second smallest eigenvalue. The
  connectivity statement is 1.3. For the bound, `tr 𝓛 = ∑ᵢ (1 - Wᵢᵢ/dᵢ) ≤ n` and the
  `n - 1` eigenvalues other than `λ₀ = 0` are at least `λ₁`.

*Needs:* 1.2–1.3; Tau Ceti Courant–Fischer.

### 2.2 The normalized cut

- `graphVolume W S = ∑_{i ∈ S} dᵢ`, `cutWeight W S = ∑_{i ∈ S} ∑_{j ∉ S} Wᵢⱼ`, and
  `normalizedCut W S = cut(S) (1 / vol S + 1 / vol Sᶜ)`.
- Spectral relaxation (the last conjunct of `fiedlerValue_spec`):
  `λ₁ ≤ Ncut(S)` for every nonempty proper `S`. Proof: the test function
  `g = 𝟙_S / vol S - 𝟙_{Sᶜ} / vol Sᶜ` satisfies `∑ dᵢ gᵢ = 0`, its numerator is
  `cut(S) (1/vol S + 1/vol Sᶜ)²` and its denominator `1/vol S + 1/vol Sᶜ` (von Luxburg, *A
  tutorial on spectral clustering*, 2007, §5, for the relaxation; the computation is the one of
  Chung Lemma 2.1, p. 25).
- The spectral clustering procedure (threshold the eigenvector of `λ₁` and take the best of the
  `n - 1` level sets) produces a set of conductance at most `√(2 λ₁)`; this is the second half of
  the proof of 3.2, stated there.

*Needs:* 2.1.

### 2.3 Laplacian eigenmaps and locally linear embedding

- `isLeast_laplacianEigenmap`: for `k ≤ card V`, the least value of `∑ₐ Yₐᵀ L Yₐ` over families
  `Y₀, …, Y_{k-1}` that are orthonormal for the inner product `∑ dᵢ uᵢ vᵢ` is the sum of the `k`
  smallest eigenvalues of `𝓛`, attained by `Yₐ = D^{-1/2} uₐ` for orthonormal eigenvectors `uₐ`
  of the `k` smallest eigenvalues (Belkin–Niyogi, *Laplacian eigenmaps for dimensionality
  reduction and data representation*, 2003; Wang Ch. 12, p. 235).
- Proof route: `Y = D^{-1/2} U` turns the constraint into orthonormality of `U` and the objective
  into `∑ₐ uₐᵀ 𝓛 uₐ`. Apply Tau Ceti's Ky Fan principle
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` to `-𝓛` on
  `EuclideanSpace ℝ V`.
- `isLeast_locallyLinearEmbedding`: for a weight matrix `R` whose rows sum to `1`, put
  `M = (I - R)ᵀ (I - R)`, which is positive semidefinite with `M 𝟙 = 0`. For `p ≤ card V - 1`,
  among `Y : V → ℝᵖ` with `∑ᵢ Yᵢ = 0` and orthonormal coordinate columns, the least value of
  `∑ᵢ ‖Yᵢ - ∑ⱼ Rᵢⱼ Yⱼ‖²` is the sum of the second to the `(p + 1)`-st smallest eigenvalues of `M`,
  attained by the corresponding eigenvectors (Roweis–Saul, *Nonlinear dimensionality reduction
  by locally linear embedding*, 2000; Wang (10.4)–(10.6), pp. 206–207). Proof: the objective is
  `tr(Yᵀ M Y)`, the constraint puts the columns in `𝟙^⊥`, which `M` preserves, and the Ky Fan
  argument above on `𝟙^⊥` gives the minimum. For `p ≥ card V` no admissible `Y` exists.

*Needs:* 2.1; Tau Ceti Ky Fan.

**Checks.**

- `fiedlerValue`: `3/2` on `K₃`, `1` on `P₃`, `2` on `K₂`.
- `fiedlerValue`: `0` on two disjoint copies of `K₂`, which are disconnected.
- `fiedlerValue`: on a single vertex the value is `0`: with a loop the index set is empty, and
  without one every nonzero `g` qualifies and the quotient is `0/0 = 0`.
- `graphVolume`: on `P₃`, `vol {0} = 1`, `vol {1} = 2`, `vol V = 4`.
- `graphVolume`: `vol ∅ = 0`.
- `graphVolume`: a loop of weight `1` at a vertex adds `1` to its volume.
- `cutWeight`: on `P₃`, `cut {0} = 1` and `cut {1} = 2`.
- `cutWeight`: `cut ∅ = cut V = 0`.
- `cutWeight`: on `K₂`, `cut {0} = 1`; a sum over both orders of each crossing pair would give `2`.
- `cutWeight`: on two disjoint copies of `K₂`, the cut of one copy is `0`.
- `normalizedCut`: on `P₃`, `Ncut {0} = 1 · (1 + 1/3) = 4/3` and `Ncut {1} = 2 (1/2 + 1/2) = 2`.
- `normalizedCut`: on `K₃`, `Ncut {0} = 2 (1/2 + 1/4) = 3/2 = λ₁`, so the relaxation is sharp.
- `normalizedCut`: `Ncut V = 0`, since `vol ∅ = 0` and `0⁻¹ = 0`, below `λ₁ = 3/2` on `K₃`; this
  is why the relaxation excludes `S = V`.

### Examples

- On `P₃`, `λ₁ = 1` and the least normalized cut is `4/3`.
- Laplacian eigenmap on `P₃` with `k = 2`: the minimum is `0 + 1 = 1`; the second eigenvector of
  `𝓛` is proportional to `(1, 0, -1)`, so the one-dimensional map separates the endpoints and puts
  the middle vertex at `0`.

### Dependencies

Layer 1; Tau Ceti Courant–Fischer and Ky Fan.

## Layer 3: Conductance and the Cheeger inequality

### 3.1 Conductance

- `conductance W S = cut(S) / min(vol S, vol Sᶜ)` and `cheegerConstant W` is its infimum over
  nonempty proper `S` (Chung (2.1)–(2.2), p. 24; Grigor'yan Definition 3.1, p. 53).
- For a weighted graph, `0 ≤ h ≤ 1`: `cut(S) ≤ vol S` and `cut(S) ≤ vol Sᶜ`.

*Needs:* 2.2.

### 3.2 The Cheeger inequality

- `cheeger_inequality`: for a weighted graph with positive degrees and `2 ≤ card V`,
  - `λ₁ ≤ 2h` (Chung Lemma 2.1, p. 25; Grigor'yan Lemma 3.2, p. 53);
  - `h²/2 ≤ λ₁` (Chung Theorem 2.2, p. 26; Grigor'yan Theorem 3.3, p. 54);
  - `1 - √(1 - h²) ≤ λ₁` (Chung Theorem 2.3, p. 27).
  The 1997 printing of Chung states both lower bounds as strict inequalities for connected
  graphs. The strict form of Theorem 2.2 holds for connected graphs, since then `h > 0` and
  `1 - √(1 - h²) > h²/2`; the strict form of Theorem 2.3 fails for `P₃` (Examples). The
  non-strict forms hold for every weighted graph and are the ones stated.
- Proof route. The upper bound: `λ₁ ≤ Ncut(S) ≤ 2 cut(S)/min(vol S, vol Sᶜ)` by 2.2. The lower
  bounds: take an eigenvector `f` of `λ₁` for the generalized problem `L f = λ D f`, shift it by
  a weighted median so that both `{f > 0}` and `{f < 0}` have volume at most `vol V / 2`, and
  apply the discrete co-area formula (Grigor'yan Lemma 3.4, p. 54) to `f₊²` and `f₋²`:
  `∑ Wᵢⱼ |fᵢ² - fⱼ²| ≥ h ∑ dᵢ fᵢ²`. Cauchy–Schwarz with
  `∑ Wᵢⱼ (fᵢ + fⱼ)² = 4 ∑ dᵢ fᵢ² - ∑ Wᵢⱼ (fᵢ - fⱼ)²` gives `h² ≤ λ₁ (2 - λ₁)`, which is the
  third bound; the second follows from `1 - √(1 - h²) ≥ h²/2`. The proof also shows that one of
  the level sets of `f` has conductance at most `√(2 λ₁)`.

*Needs:* 2.1–2.2, 3.1.

**Checks.**

- `conductance`: on `P₃` every nonempty proper set has conductance `1`.
- `conductance`: on `C₄`, two adjacent vertices have conductance `2/4 = 1/2`; one vertex has `1`.
- `conductance`: on two disjoint copies of `K₂`, one copy has conductance `0`.
- `cheegerConstant`: `1` on `K₂`, `P₃` and `K₃`; `1/2` on `C₄`; `0` on two disjoint copies of `K₂`.
- `cheegerConstant`: on a single vertex the index set is empty and the value is `0`.
- `cheegerConstant`: replacing `min (vol S) (vol Sᶜ)` by `vol S` alone would give `1/3` on `P₃`
  (the set `{0, 1}`), which violates `λ₁ ≤ 2h` with `λ₁ = 1`.

### Examples

- `C₄`: `λ₁ = 1 = 2h`, equality in the upper bound.
- `P₃`: `h = 1` and `λ₁ = 1 = 1 - √(1 - h²)`, equality in the strongest lower bound, so its
  strict form fails on a connected graph.
- `K₂`: `λ₁ = 2 = 2h`.
- Two disjoint copies of `K₂`: `h = λ₁ = 0`, so all three bounds are equalities, and the strict
  form of `h²/2 ≤ λ₁` fails on a disconnected graph.

### Dependencies

Layers 1–2.

## Layer 4: Random walks and diffusion distances

### 4.1 The random walk and its spectral expansion

- `transitionMatrix W = D⁻¹ W` and `stationary W = d / vol V`. With positive degrees `P` is
  stochastic, `π P = π`, and `P` is reversible: `πᵢ Pᵢⱼ = πⱼ Pⱼᵢ` (Chung §1.5, p. 14).
- First half of `diffusionDistSq_eq`: there are real `λⱼ ∈ [-1, 1]` and functions `ψⱼ`,
  orthonormal in `L²(π)`, with `P ψⱼ = λⱼ ψⱼ` and
  `P(x, z) = ∑ⱼ λⱼ ψⱼ(x) ψⱼ(z) π(z)`.
- Proof route: `P = D^{-1/2} (I - 𝓛) D^{1/2}`, so the orthonormal eigenvectors `uⱼ` of the
  symmetric `I - 𝓛` give `ψⱼ = √(vol V) D^{-1/2} uⱼ` with `λⱼ = 1 - (eigenvalue of 𝓛) ∈ [-1, 1]`
  by 1.4; the expansion is the spectral decomposition of `I - 𝓛` conjugated back.

*Needs:* 1.4.

### 4.2 Diffusion maps and diffusion distances

- `diffusionDistSq W t x y = ∑_z (Pᵗ(x, z) - Pᵗ(y, z))² / π(z)` is the squared distance between
  the laws of the walk at time `t` started at `x` and `y`, in `L²(1/π)` (Wang Definition 14.3,
  p. 290; Coifman–Lafon, *Diffusion maps*, 2006).
- Second half of `diffusionDistSq_eq`: for every family `(λⱼ, ψⱼ)` as in 4.1,
  `diffusionDistSq W t x y = ∑ⱼ λⱼ^{2t} (ψⱼ(x) - ψⱼ(y))²`; so the diffusion map
  `x ↦ (λⱼᵗ ψⱼ(x))ⱼ` is an isometry onto its image (Wang Lemma 14.1, p. 291). The constant
  eigenfunction contributes `0`, and the identity needs neither connectivity nor aperiodicity.
- Proof: insert the expansion of `Pᵗ` and use `∑_z π(z) ψⱼ(z) ψₗ(z) = δⱼₗ`.

*Needs:* 4.1.

**Checks.**

- `transitionMatrix`: on `P₃` it is `[[0, 1, 0], [1/2, 0, 1/2], [0, 1, 0]]`.
- `transitionMatrix`: on the loop graph `[[1, 1], [1, 0]]` it is `[[1/2, 1/2], [1, 0]]`: the loop
  is a holding probability.
- `transitionMatrix`: a vertex of degree `0` gives a zero row, so `P` is not stochastic without
  positive degrees.
- `stationary`: on `P₃` it is `(1/4, 1/2, 1/4)`, and `π P = π`.
- `stationary`: on `K₃` it is uniform.
- `stationary`: for `W = 0` it is `0` (a junk value; `vol V = 0`).
- `diffusionDistSq`: at `t = 0` and `x ≠ y` it is `1/π(x) + 1/π(y)`; on `P₃` between the endpoints
  it is `8`.
- `diffusionDistSq`: on `P₃` at `t = 1` between the endpoints it is `0`, although the endpoints
  are distinct: both walks are at the middle vertex. Diffusion distance is a pseudometric.
- `diffusionDistSq`: on `P₃` at `t = 1` between `0` and `1` it is `4`.

### Examples

- On `P₃` the eigenvalues of `P` are `1, 0, -1`, with `ψ` proportional to `(1, 1, 1)`,
  `(1, 0, -1)` and `(1, -1, 1)`; the identity of 4.2 at `t = 1` between `0` and `1` gives
  `0 + 0 + 1 · (ψ₂(0) - ψ₂(1))² = 4` with `ψ₂ = (1, -1, 1)`, which has `L²(π)` norm `1`.

### Dependencies

Layer 1.

## Layer 5: Euclidean distance geometry

### 5.1 Classical scaling

- `centeringMatrix ι = I - n⁻¹ 𝟙 𝟙ᵀ` and `doubleCenteredGram Δ = -½ H (Δ ∘ Δ) H`, where `Δ ∘ Δ`
  squares entrywise.
- `exists_euclidean_realization_iff`: a symmetric nonnegative `Δ` with zero diagonal is the
  distance matrix of points of `ℝᵖ` exactly when `B = doubleCenteredGram Δ` is positive
  semidefinite of rank at most `p` (Mardia–Kent–Bibby Theorem 14.2.1, p. 397; Wang Theorems 6.1
  and 6.2, pp. 122–125; Schoenberg's criterion).
- Realization and uniqueness: the rows of `U_p Λ_p^{1/2}`, for the top `p` eigenpairs of `B`,
  realize `Δ` and are centred; any two centred realizations in `ℝᵖ` differ by an orthogonal
  matrix (MSS-A09).
- Proof route: for points `xᵢ` with centroid `0`, `B = X Xᵀ` is the Gram matrix (expand
  `‖xᵢ - xⱼ‖²` and centre). Conversely MSS-A06 factors `B = AᵀA` with `A` of `p` rows; the columns
  of `A` realize `Δ`, since `Bᵢᵢ + Bⱼⱼ - 2Bᵢⱼ = Δᵢⱼ²` by `H Δ∘Δ H` and the zero diagonal.

*Needs:* MSS-A05 to MSS-A07, MSS-A09; Mathlib `Matrix.PosSemidef`, `Matrix.rank`.

### 5.2 Best positive semidefinite approximation of bounded rank

- `isLeast_posSemidef_rank_le`: for a symmetric `B` with eigenvalues `λ₀ ≥ … ≥ λ_{n-1}` and
  `k ≤ n`, the least value of `‖B - C‖_F²` over positive semidefinite `C` of rank at most `k` is
  `∑_{j<k} min(λⱼ, 0)² + ∑_{j≥k} λⱼ²`, attained by keeping the positive parts of the top `k`
  eigenvalues. This is the optimality of classical scaling among `k`-dimensional configurations
  for the criterion `tr (B - B̂)²` (Mardia–Kent–Bibby Theorem 14.4.2, p. 408).
- Proof route: for `C` of rank at most `k`, the Hoffman–Wielandt inequality
  `‖B - C‖_F² ≥ ∑ⱼ (λⱼ - γⱼ)²`, with the eigenvalues `γ₀ ≥ …` of `C` sorted in the same order, is
  Tau Ceti's `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq`; minimize over
  `γ ≥ 0` with at most `k` nonzero entries, and attain the minimum by the spectral decomposition
  of `B` with the eigenvalues replaced.

*Needs:* Mathlib `Matrix.IsHermitian.eigenvalues₀`; Tau Ceti Hoffman–Wielandt.

### 5.3 Graph approximation of geodesic distances

- `walkLength ι a b l` is the length of the walk `a, l₀, …, b` measured by `‖ι u - ι v‖`, and
  `sampleGraphEDist ι S ε a b ∈ ℝ≥0∞` is the infimum over walks with interior vertices in `S`
  and every step of embedded length at most `ε`, `∞` when there is none.
- `sampleGraphEDist_bounds`: let `M` be a metric space in which every two points are joined by a
  geodesic segment, `ι : M → E` a `1`-Lipschitz map into a normed group, `S` a `δ`-net of `M`, and
  `4δ < ε`. For `a, b ∈ S`,
  - `d_G(a, b) ≤ (1 + 4δ/ε) d_M(a, b)` (Wang Theorem 8.2, p. 176; Bernstein–de Silva–Langford–
    Tenenbaum, *Graph approximations to geodesics on embedded manifolds*, 2000);
  - if moreover, for some `η ≥ 0`, `‖ι x - ι y‖ ≤ ε` implies `d_M(x, y) ≤ (1 + η) ‖ι x - ι y‖`,
    then
    `d_M(a, b) ≤ (1 + η) d_G(a, b)`.
- Proof route. Upper bound: if `d_M(a, b) ≤ ε` the direct edge has length at most `d_M(a, b)`.
  Otherwise cut the geodesic into `m = ⌈d_M/(ε - 2δ)⌉` pieces of length at most `ε - 2δ`, replace
  each interior division point by a point of `S` within `δ`, and bound consecutive embedded
  distances by `ε`; the total is at most `d_M + 2δ(m - 1) ≤ d_M (1 + 2δ/(ε - 2δ))`, and
  `2δ/(ε - 2δ) < 4δ/ε` since `ε - 2δ > ε/2`. Lower bound: the triangle inequality along any walk.
- For a compact submanifold of positive reach the local chord–arc condition holds with
  `η = O(ε)`; that geometric input is listed under Beyond.

*Needs:* Mathlib `LipschitzWith`, `ENNReal`.

### 5.4 Hausdorff estimation of a support

- `isBoundedInProbability_hausdorffDist`: let `P` be a probability measure on a separable metric
  space, carried by a compact `K`, with `P(B(x, r)) ≥ c rᵈ` for `x ∈ K` and `0 < r < r₀`. For an
  i.i.d. sequence from `P`, `d_H({X₀, …, X_{n-1}}, K) / (log(n + 1)/n)^{1/d}` is bounded in
  probability (Cuevas–Rodríguez-Casal, *On boundary estimation*, 2004). It differs from the rate
  of TopologicalDataAnalysis 8.4, which bounds the expectation for laws standard at every radius,
  in requiring the small-ball bound only below `r₀` and concluding
  boundedness in probability; it follows from the sampling bound of 8.4 as below.
- Proof route. The local bound makes `P` standard at every radius with exponent `d` and
  `a = c (r₀/(2R))ᵈ`, `R = max(r₀, diam K)`: for `r < r₀` the closed ball contains the open one and
  `a ≤ c`; for `r₀ ≤ r ≤ diam K` it contains `B(x, r₀/2)`, of mass at least
  `c (r₀/2)ᵈ ≥ a rᵈ`; for `r > diam K` it contains `K`. The sampling bound of
  TopologicalDataAnalysis 8.4 at `ε = tₙ = C (log(n + 1)/n)^{1/d}` gives, once `a tₙᵈ ≤ 2ᵈ`,
  `P(d_H > tₙ) ≤ max(1, 4ᵈ n/(a Cᵈ log(n + 1))) (n + 1)^{-a Cᵈ/2ᵈ}`, which tends to `0` when
  `a Cᵈ/2ᵈ ≥ 2`. For each of the finitely many remaining `n ≥ 1`, `d_H ≤ diam K` almost surely.
- For a `d`-dimensional compact submanifold of positive reach with a density bounded below, the
  small-ball hypothesis holds below a radius `r₀`, by TopologicalDataAnalysis 5.3.

*Needs:* Foundations 8.2 (local copy `IsBoundedInProbability`) and 8.5; TopologicalDataAnalysis
8.4; Mathlib `Metric.hausdorffDist`, `Measure.infinitePi`.

**Checks.**

- `centeringMatrix`: for `n = 2` it is `[[1/2, -1/2], [-1/2, 1/2]]`.
- `centeringMatrix`: `H 𝟙 = 0` and `H² = H`.
- `centeringMatrix`: it is not the identity: `H e₀ = e₀ - 𝟙/n`.
- `doubleCenteredGram`: two points at distance `a` give `[[a²/4, -a²/4], [-a²/4, a²/4]]`, rank `1`,
  eigenvalue `a²/2`.
- `doubleCenteredGram`: the collinear points `0, 1, 2` give `[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]`,
  of rank `1`; the equilateral triangle of side `1` gives eigenvalues `0, 1/2, 1/2`, rank `2`.
- `doubleCenteredGram`: the star metric (a centre at distance `1` from three leaves, leaves at
  distance `2` from each other) is a metric, but its matrix has the eigenvalue `-1/4`: not every
  metric is Euclidean. The dissimilarity `Δ₀₂ = 3`, `Δ₀₁ = Δ₁₂ = 1`, which violates the triangle
  inequality, gives the eigenvalue `-5/6`.
- `walkLength`: for the empty list it is `‖ι a - ι b‖`.
- `walkLength`: for the list `[u]` it is `‖ι a - ι u‖ + ‖ι u - ι b‖`.
- `walkLength`: it is at least `‖ι a - ι b‖` for every list.
- `sampleGraphEDist`: `0` when `a = b` and `0 ≤ ε`.
- `sampleGraphEDist`: with `S = {a, b}`, it is `‖ι a - ι b‖` when `‖ι a - ι b‖ ≤ ε` and `∞`
  otherwise.
- `sampleGraphEDist`: on the unit circle with arc-length metric and `ε ≥ 2`, antipodal sample
  points are at graph distance `2` (the chord) and intrinsic distance `π`; the upper bound holds
  but the lower bound needs `η ≥ π/2 - 1`, so the chord–arc hypothesis cannot be dropped.

### Examples

- On the unit circle sampled with gaps at most `2δ = 0.04` and `ε = 0.1`, the graph distances lie
  between `d_M/(1 + η)` with `η = 2 arcsin(ε/2)/ε - 1 ≈ 4.2 · 10⁻⁴` and `(1 + 4δ/ε) d_M = 1.8 d_M`.
- Four points with all distances `1` (a regular simplex) give `B` with eigenvalues
  `0, 1/2, 1/2, 1/2`: realizable in `ℝ³` but not in `ℝ²`.

### Dependencies

MatrixSpectralStatistics Part A; Foundations 8.2 and 8.5; TopologicalDataAnalysis 8.4; Tau Ceti
Hoffman–Wielandt.

## Layer 6: Shape and extrinsic means

### 6.1 Ordinary Procrustes analysis

- `IsPreshape Z`: the columns of `Z` sum to `0` and `∑ Zᵢⱼ² = 1`.
- `procrustesCos Z₁ Z₂ = sup_{R ∈ SO(m)} tr(Z₂ᵀ Z₁ R)`.
- `procrustesCos_eq`: the supremum is attained; with `A = Z₂ᵀ Z₁` and singular values `σᵢ`
  (square roots of the eigenvalues of `AᵀA`), it equals `∑ σᵢ` when `det A ≥ 0` and
  `∑ σᵢ - 2 σ_min` when `det A < 0`; for `m ≥ 2` it is nonnegative (Dryden–Mardia Definition 4.12
  and Result 4.1, p. 61; Result 5.1, pp. 84–85; Mardia–Kent–Bibby Theorem 14.7.1, p. 416, over
  `O(m)`).
- Proof route: write `A = U Σ Vᵀ`; `tr(A R) = tr(Σ Vᵀ R U)` and `Vᵀ R U` ranges over `O(m)` with
  determinant `det R · det(UV)`. The diagonal of a rotation lies in the convex hull of the
  sign vectors with an even number of `-1`'s when `det = 1` (Horn's theorem for `SO(m)`), and a
  linear function on that hull is maximized at `(1, …, 1)` or at the vertex with one `-1` at the
  smallest singular value (Horn, *Doubly stochastic matrices and the diagonal of a rotation
  matrix*, 1954). Tau Ceti's `LinearMap.exists_linearIsometryEquiv_trace_comp_eq_kyFanSum`
  gives the `O(m)` case.

*Needs:* Mathlib `Matrix.specialOrthogonalGroup`, `Matrix.IsHermitian.eigenvalues`; Tau Ceti Ky
Fan.

### 6.2 Procrustes distances and generalized Procrustes analysis

- `fullProcrustesDist Z₁ Z₂ = inf_{β ≥ 0, R ∈ SO(m)} ‖Z₂ - β Z₁ R‖_F` and
  `partialProcrustesDist Z₁ Z₂ = inf_{R ∈ SO(m)} ‖Z₂ - Z₁ R‖_F`.
- `procrustesDist_eq`: for pre-shapes and `m ≥ 2`, `cos ρ = procrustesCos Z₁ Z₂ ≤ 1`,
  `d_F = √(1 - cos² ρ) = sin ρ` and `d_P = √(2 - 2 cos ρ) = 2 sin(ρ/2)` (Dryden–Mardia Result 4.1,
  p. 61, Definition 4.13 and Result 4.2, p. 63, and p. 64). Proof:
  `‖Z₂ - β Z₁ R‖² = 1 - 2β tr(Z₂ᵀ Z₁ R) + β²`, minimized at `β = tr(Z₂ᵀ Z₁ R) ≥ 0`.
- `gpaMean Z β R = n⁻¹ ∑ᵢ βᵢ Zᵢ Rᵢ` and `gpaObjective Z β R = ∑ᵢ ‖βᵢ Zᵢ Rᵢ - gpaMean Z β R‖_F²`.
- `generalizedProcrustes_spec`: for pre-shapes `Z₁, …, Z_n` (`n ≥ 1`, `m ≥ 2`), let `(β, R)`
  minimize `G = gpaObjective Z β R` over `βᵢ ≥ 0` and `Rᵢ ∈ SO(m)` under `∑ βᵢ² = n`, and put
  `μ̄ = gpaMean Z β R`. Then `μ̄ ≠ 0`, `μ̄/‖μ̄‖` minimizes `μ ↦ ∑ᵢ d_F²(Zᵢ, μ)` over pre-shapes, so
  the mean of the fits has the shape of the full Procrustes mean, and `βᵢ` is proportional to
  `cos ρ(Zᵢ, μ̄/‖μ̄‖)` (Dryden–Mardia Definition 5.3, p. 88, Definition 5.5 and Result 5.2, p. 89).
  Proof route: `G = n - n‖μ̄‖²`, and `‖μ̄‖ = sup_{‖μ‖ = 1} ⟪μ̄, μ⟫`; for fixed `μ` the supremum over
  `Rᵢ` is `cos ρ(Zᵢ, μ)` by 6.1, and over `β` with `∑ βᵢ² = n` it is
  `√n (∑ᵢ cos² ρ(Zᵢ, μ))^{1/2}` by Cauchy–Schwarz, with equality for `βᵢ ∝ cos ρ(Zᵢ, μ)`. Hence
  minimizing `G` maximizes `∑ᵢ cos² ρ(Zᵢ, μ) = n - ∑ᵢ d_F²(Zᵢ, μ)` by 6.2. Taking `μ = Z₁` gives
  `‖μ̄‖ ≥ n^{-1/2}`, so `μ̄ ≠ 0`.

*Needs:* 6.1.

### 6.3 The planar full Procrustes mean

- In the plane a configuration is a vector `z ∈ ℂᵏ`, rotation and scaling are multiplication by
  `β ∈ ℂ`, and `planarFullProcrustesDistSq z w = inf_β ‖w - β z‖²`.
- `planarFullProcrustesMean`: for unit `z` and `w`, `d_F²(z, w) = 1 - |⟪z, w⟫|²` (Dryden–Mardia
  Result 4.3 and (4.25), p. 68); and a unit `μ` minimizes `∑ᵢ d_F²(zᵢ, μ)` exactly when it is an
  eigenvector of `S = ∑ᵢ zᵢ zᵢ*` for its largest eigenvalue (Dryden–Mardia Result 3.2, p. 44,
  after Kent).
- Proof: the infimum over `β` is the squared distance to the line `ℂ z`, which is
  `‖w‖² - |⟪z, w⟫|²` by projection. Then `∑ᵢ d_F²(zᵢ, μ) = n - μ* S μ` for unit `μ`, and
  `μ* S μ` is maximized on the unit sphere exactly by the top eigenvectors (Rayleigh).
- The shape space `Σ₂ᵏ` of centred planar configurations up to rotation and scale is the complex
  projective space `ℂP^{k-2}` (Dryden–Mardia Result 4.3, p. 68); with Mathlib's
  `Projectivization` this is a target: the map `z ↦ [z]` from nonzero centred configurations
  identifies configurations exactly when they differ by a nonzero complex factor.

*Needs:* Mathlib `EuclideanSpace ℂ`, inner products, `Projectivization`.

### 6.4 Extrinsic means

- `extrinsicMean_iff`: for a law `μ` on `ℝᴰ` with finite second moment and any set `S`, a point
  `p ∈ S` minimizes `q ↦ E‖X - q‖²` over `S` exactly when `p` is a nearest point of `S` to the
  Euclidean mean `m = E X` (Bhattacharya–Bhattacharya Definition 4.1, p. 36, and Proposition
  4.2, p. 37). Proof: `E‖X - q‖² = E‖X - m‖² + ‖m - q‖²`. Bhattacharya–Bhattacharya take `S`
  closed, which makes the extrinsic mean set nonempty; the equivalence does not use it.
- `tendstoInDistribution_extrinsicMean`: if `proj` is a measurable map that near `m` is a
  nearest-point map of `S` and is differentiable at `m` with derivative `Dproj`, then for an i.i.d.
  sequence `√n (proj(X̄ₙ) - proj(m)) → Dproj Z` in law with `Z ~ N(0, Cov X)`
  (Bhattacharya–Bhattacharya Proposition 4.3, p. 38). Proof: the multivariate central limit theorem
  (Asymptotic 1.2) and the delta method (Foundations 8.4).
- On a compact space with continuous loss, Fréchet means exist (Bhattacharya–Bhattacharya
  Theorem 3.2, p. 23; Theorem 3.3, p. 24, on proper spaces); these are Tau Ceti's
  `TauCeti.exists_isFrechetBarycenter` and OptimalTransport 12.2, consumed, and the strong
  consistency of empirical Fréchet means is
  `TauCeti.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae` (OptimalTransport 12.8). The
  general definition is Marron–Dryden §7.1, (7.5), p. 127.

*Needs:* Foundations 8.4; Asymptotic 1.2; Mathlib `Metric.infDist`, `HasFDerivAt`; Tau Ceti
`TauCeti.covMatrix`.

**Checks.**

- `IsPreshape`: `Z = [[1, 0], [-1, 0]] / √2` is a pre-shape.
- `IsPreshape`: `[[1, 0], [0, 0]]` has unit norm but is not centred.
- `IsPreshape`: the zero configuration is centred but not of unit size.
- `procrustesCos`: `procrustesCos Z Z = 1` for a pre-shape `Z`.
- `procrustesCos`: for `m = 1`, `SO(1)` is trivial and `procrustesCos Z (-Z) = -1`; the formula
  of 6.1 gives `|a| - 2|a| = -|a|` with `a = -1`, and nonnegativity fails, as the hypothesis
  `m ≥ 2` predicts.
- `procrustesCos`: for the triangle with vertices `(0, 0), (1, 0), (0, 1)` and its mirror image
  under `y ↦ -y`, the cosine over `SO(2)` is `1/2` while over `O(2)` it is `1`: reflections are not
  quotiented out.
- `fullProcrustesDist`: `0` between a pre-shape and any rotation of it.
- `fullProcrustesDist`: for the mirror triangles above, `√(1 - 1/4) = √3/2`.
- `fullProcrustesDist`: for `m = 1`, `Z₂ = -Z₁` gives `d_F = 1` (take `β = 0`), while
  `√(1 - cos²) = 0`; the formula needs `m ≥ 2`.
- `partialProcrustesDist`: `0` between a pre-shape and a rotation of it.
- `partialProcrustesDist`: for the mirror triangles, `√(2 - 1) = 1`.
- `partialProcrustesDist`: it is at most `2` for pre-shapes, with `2` for `m = 1` and `Z₂ = -Z₁`.
- `gpaMean`: for `n = 1` it is `β₁ Z₁ R₁`.
- `gpaMean`: for `n = 2`, `Z₂ = -Z₁`, `β = (1, 1)` and `R = (I, I)` it is `0`; with `m = 2` and
  `R₂ = -I ∈ SO(2)` it is `Z₁`.
- `gpaMean`: it divides by `n`, not by `∑ βᵢ`: for `n = 2`, `Z₁ = Z₂`, `R = (I, I)` and
  `β = (√2, 0)` it is `Z₁/√2`, not `Z₁`.
- `gpaObjective`: for `n = 1` it is `0`.
- `gpaObjective`: for `n = 2`, pre-shapes `Z₂ = -Z₁`, `β = (1, 1)` and `R = (I, I)` it is `2`; with
  `m = 2` and `R₂ = -I` it is `0`, so rotations are fitted.
- `gpaObjective`: for `β = 0` it is `0`, which is why the minimization constrains `∑ βᵢ² = n`.
- `planarFullProcrustesDistSq`: `0` for `w = i z` (a rotation by `π/2`).
- `planarFullProcrustesDistSq`: `1` for unit `z ⊥ w`.
- `planarFullProcrustesDistSq`: for `w = 2z` it is `0`, while the partial distance of rotation
  alone is positive: scaling is quotiented out.

### Examples

- For the mirror triangles of the Checks, `cos ρ = 1/2`; the optimal scale is `β = cos ρ = 1/2`,
  and `‖Z₂ - β Z₁ R‖² = 1 - 2 · (1/2) · (1/2) + 1/4 = 3/4 = d_F²`, while the scale `β = 1` gives
  `2 - 2 cos ρ = 1 = d_P²`.
- `S` the unit sphere in `ℝ³` and `μ` uniform on two antipodal points: `m = 0`, every point of
  `S` is nearest, and the extrinsic mean set is all of `S`; the differentiability hypothesis of
  6.4 fails at `m`.

### Dependencies

Foundations 8.4; Asymptotic 1.2; Tau Ceti Fréchet means, `TauCeti.covMatrix` and Ky Fan.

## Layer 7: Kernel mean embeddings

### 7.1 Integrability of the feature map

- `integrable_kolmogorovFeature_of_le`: for a jointly continuous kernel with `k(x, x) ≤ C` on a
  second-countable space, the feature map is integrable for every finite measure.
- Proof: `Φ` is continuous (Tau Ceti `Matrix.PosSemidef.continuous_kolmogorovFeature`; Saitoh–
  Sawano Theorem 2.3, p. 73), hence strongly measurable on a second-countable space, and
  `‖Φ x‖ = √k(x, x) ≤ √C`.
- For an unbounded kernel, `Φ` is integrable when `∫ √k(x, x) dμ < ∞` and `Φ` is strongly
  measurable; 8.3 and 10.3 use this with moment hypotheses.

*Needs:* Tau Ceti kernel library.

### 7.2 The MMD and the witness function

- `mmd hk μ ν = ‖m μ - m ν‖`.
- `mmd_eq_iSup`: for integrable feature maps,
  - `⟪f, m μ⟫ = ∫ ⟪f, Φ x⟫ dμ` for every `f` in the Kolmogorov space;
  - `MMD(μ, ν) = sup_{‖f‖ ≤ 1} (∫ f dμ - ∫ f dν)`, the integral probability metric of the unit
    ball (Berlinet–Thomas-Agnan §4.6, p. 210; Gretton–Borgwardt–Rasch–Schölkopf–Smola, *A kernel
    two-sample test*, 2012);
  - the witness function `x ↦ ⟪Φ x, m μ - m ν⟫` is `∫ k(x, y) dμ(y) - ∫ k(x, y) dν(y)`;
  - when `MMD ≠ 0`, the normalized witness has norm `1` and attains the supremum.
- Proof: Bochner integrals commute with the continuous functional `⟪f, ·⟫`; Cauchy–Schwarz and the
  normalized witness give the supremum. The witness formula is Tau Ceti's
  `Matrix.PosSemidef.inner_kolmogorovFeature_kernelMeanEmbedding` applied to `μ` and to `ν`.
- The double-integral form of `MMD²` is Tau Ceti's
  `Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq`, consumed.

*Needs:* 7.1.

### 7.3 Empirical mean embeddings

- `kernelMeanEmbedding_empirical`: for a bounded continuous kernel with `k(x, x) ≤ C`, the
  empirical law `Pₙ` of an i.i.d. sample of size `n ≥ 1` satisfies
  - `E‖m(Pₙ) - m(P)‖² = (E k(X, X) - ‖m(P)‖²)/n ≤ C/n`;
  - `P(‖m(Pₙ) - m(P)‖ ≥ √(C/n) + t) ≤ exp(-n t²/(2C))` for `t ≥ 0`
  (Berlinet–Thomas-Agnan §4.9.1, p. 223, for the empirical measure as a Hilbert-space valued
  variable; Smola–Gretton–Song–Schölkopf, *A Hilbert space embedding for distributions*, 2007).
- Proof route: `m(Pₙ) - m(P) = n⁻¹ ∑ (Φ Xᵢ - m P)`, a mean of independent centred Hilbert-space
  variables, so the cross terms vanish and `E‖Φ X - m P‖² = E k(X, X) - ‖m P‖²`. The map
  `x ↦ ‖m(Pₙ) - m(P)‖` has bounded differences `2√C/n`; Tau Ceti's
  `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences` with
  `ProbabilityTheory.HasSubgaussianMGF.measure_ge_le` gives the tail around the mean, and
  `E‖·‖ ≤ √(E‖·‖²) ≤ √(C/n)`.
- Consequence: `MMD(Pₙ, Qₘ) → MMD(P, Q)` almost surely, by the triangle inequality and
  Borel–Cantelli.

*Needs:* 7.1–7.2; Foundations 8.5; Tau Ceti McDiarmid and `empiricalFiniteMeasure`.

**Checks.**

- `mmd`: for Dirac laws, `MMD(δₓ, δ_y)² = k(x, x) - 2k(x, y) + k(y, y)`; for the Gaussian kernel
  with `σ = 1` at distance `1` this is `2 - 2e^{-1/2} ≈ 0.7869`.
- `mmd`: `MMD(μ, μ) = 0`.
- `mmd`: for the constant kernel `k ≡ 1`, `MMD(μ, ν) = 0` for all probability measures: the MMD
  need not separate laws.

### Examples

- For `P` on the three atoms `0, 1, 3` with weights `1/2, 3/10, 1/5`, the Gaussian kernel with
  `σ = 1` and `n = 2`, exact enumeration gives `E‖m(P₂) - m(P)‖² = 0.20979`, equal to
  `(1 - ‖m(P)‖²)/2` and below `C/n = 1/2`.

### Dependencies

Tau Ceti kernel library and McDiarmid; Foundations 8.5.

## Layer 8: Characteristic kernels

### 8.1 Characteristic kernels and the Fourier criterion

- `IsCharacteristic hk`: the mean embedding is injective on probability measures with integrable
  feature map. Universal kernels on compact spaces are characteristic: this is Tau Ceti's
  `Matrix.PosSemidef.kernelMeanEmbedding_inj`, consumed.
- `mmd_sq_eq_integral_charFun`: for `k(x, y) = ψ(x - y)` on `ℝᵈ` with spectral measure `Λ`, every
  probability measure has an integrable feature map and
  `MMD(μ, ν)² = ∫ |φ_μ(2πq) - φ_ν(2πq)|² dΛ(q)` for the characteristic functions `φ`
  (Sriperumbudur–Gretton–Fukumizu–Schölkopf–Lanckriet, *Hilbert space embeddings and metrics on
  probability measures*, 2010; Bochner's theorem in Wendland Theorem 6.6, p. 70). Proof: insert
  the Bochner representation into the double-integral form and use Fubini; `|k| ≤ Λ(ℝᵈ)` and
  `k` is continuous by dominated convergence.
- `isCharacteristic_iff_isOpenPosMeasure`: for `d ≥ 1`, such a kernel is characteristic exactly
  when `Λ` charges every nonempty open set (Sriperumbudur et al. 2010).
- Proof route. If `Λ` charges every open set, `MMD = 0` forces `φ_μ = φ_ν` on a dense set, hence
  everywhere by continuity, and `MeasureTheory.Measure.ext_of_charFun` gives `μ = ν`. Conversely, if
  `Λ` misses a ball `B(q₀, r)`, which by the symmetry of `Λ` (`ψ` is real) can be taken together
  with `B(-q₀, r)`, choose a real even Schwartz function `θ` with `θ̂` supported in the two balls,
  `θ̂(0) = 0` and `θ ≢ 0`; then `θ` is real, integrable and has integral `0`, and
  `μ = (|θ| + θ) dx / c` and `ν = |θ| dx / c` with `c = ∫ |θ|` are distinct probability laws whose
  characteristic functions differ only on the support of `θ̂`, which `Λ` does not charge.
- Corollary: a nonzero continuous positive-definite `ψ` with compact support has an analytic
  Fourier transform that is not identically zero, so its spectral measure has full support and
  the kernel is characteristic. The sinc kernel `ψ(x) = sin(x)/x` on `ℝ` has spectral measure
  uniform on `[-1/(2π), 1/(2π)]` and is not characteristic.

*Needs:* Layer 7; Tau Ceti `TauCeti.bochner`; Mathlib `MeasureTheory.charFun`,
`MeasureTheory.Measure.ext_of_charFun`, Schwartz functions and Fourier inversion.

### 8.2 Scale mixtures of Gaussians

- `gaussianKernel σ x y = exp(-‖x - y‖²/(2σ²))`, `laplaceKernel σ x y = exp(-‖x - y‖/σ)` and
  `imqKernel c β x y = (c² + ‖x - y‖²)^{-β}`.
- `posSemidef_gaussianKernel`: the Gaussian kernel is positive semidefinite (Wendland Theorem
  6.10, p. 74); the real part of Tau Ceti's `TauCeti.posSemidef_cexp_neg_mul_sq_norm`.
- `isCharacteristic_of_scaleMixture`: if `k(x, y) = ∫ exp(-t ‖x - y‖²) dρ(t)` for a nonzero finite
  measure `ρ` on `(0, ∞)`, then `k` is positive semidefinite and characteristic; in particular
  the Gaussian, Laplace and inverse multiquadric kernels (`c, β > 0`) are characteristic
  (Wendland Theorem 7.13, p. 93, Theorem 7.14 and Theorem 7.15, p. 95).
- Proof route: each `exp(-t ‖·‖²)` has a Gaussian spectral measure with full support, so the
  mixture's spectral measure is the `ρ`-mixture of Gaussians, which has a positive density; apply
  8.1. The Laplace kernel is the mixture with the density
  `t^{-3/2} e^{-1/(4 σ² t)} / (2 σ √π)`, from `e^{-√s} = ∫ e^{-ts} t^{-3/2} e^{-1/(4t)} dt / (2√π)`;
  the inverse multiquadric is the mixture with density `t^{β-1} e^{-c² t}/Γ(β)`.

*Needs:* 8.1.

### 8.3 Polynomial kernels see finitely many moments

- `polynomialKernel_mmd_sq`: for `k(x, y) = (1 + ⟪x, y⟫)²` on `ℝᵈ` and laws with finite second
  moments, `k` is positive semidefinite, the feature maps are integrable, and
  `MMD(μ, ν)² = 2 ‖m_μ - m_ν‖² + ‖S_μ - S_ν‖_F²` for the means `m` and second-moment matrices
  `S = E X Xᵀ` (Schölkopf–Smola Proposition 2.1, p. 27, for the feature map of polynomial
  kernels).
- Proof: `(1 + ⟪x, y⟫)² = 1 + 2⟪x, y⟫ + ⟪x xᵀ, y yᵀ⟫_F`, so `Φ(x) = (1, √2 x, x xᵀ)` up to an
  isometry and `‖Φ x‖ = 1 + ‖x‖²`.
- Consequence: the kernel is not characteristic for `d ≥ 1`: two laws with the same mean and
  second-moment matrix have `MMD = 0`.

*Needs:* 7.1–7.2.

**Checks.**

- `IsCharacteristic`: the Gaussian kernel on `ℝᵈ` is characteristic (8.2).
- `IsCharacteristic`: the constant kernel `k ≡ 1` is not; neither is the linear kernel `⟪x, y⟫`,
  for which `MMD(μ, ν) = ‖E_μ X - E_ν X‖`.
- `IsCharacteristic`: on a finite discrete space the identity kernel is characteristic (Tau
  Ceti's universal kernels on finite spaces).
- `gaussianKernel`: `k(x, x) = 1`.
- `gaussianKernel`: at distance `σ` it is `e^{-1/2}`.
- `gaussianKernel`: its values lie in `(0, 1]`, and it is not of the form `ψ(⟪x, y⟫)`.
- `laplaceKernel`: `k(x, x) = 1`.
- `laplaceKernel`: at distance `σ` it is `e^{-1}`.
- `laplaceKernel`: it is not differentiable on the diagonal, so it fails the `C²` hypothesis of
  11.1–11.2.
- `imqKernel`: `k(x, x) = c^{-2β}`.
- `imqKernel`: with `c = 1`, `β = 1/2` at distance `1` it is `1/√2`.
- `imqKernel`: for `β < 0` it is the multiquadric `(c² + r²)^{|β|}`, unbounded and not positive
  semidefinite, which is why 8.2 requires `β > 0`.

### Examples

- Polynomial kernel: the Rademacher law on `ℝ` and `N(0, 1)` both have `m = 0` and `S = 1`, so
  `MMD² = 0` by 8.3.
- Polynomial kernel: for `μ = δ₀` and `ν = δ_{e₁}` on `ℝ²` the double-integral form is
  `1 - 2 · 1 + 4 = 3`, and `2‖m_μ - m_ν‖² + ‖S_μ - S_ν‖_F² = 2 + 1 = 3`.

### Dependencies

Layer 7; Tau Ceti Bochner and Gaussian positive definiteness; Mathlib characteristic functions.

## Layer 9: Comparison of distances and metrization

### 9.1 MMD against coupling costs, `W₁` and total variation

- `mmd_le`: for integrable feature maps,
  - `MMD(μ, ν) ≤ ∫ ‖Φ x - Φ y‖ dπ(x, y)` for every coupling `π` of `μ` and `ν`;
  - if `‖Φ x - Φ y‖ ≤ L d(x, y)`, then `MMD(μ, ν) ≤ L W₁(μ, ν)`;
  - if `k(x, x) ≤ C`, then `MMD(μ, ν) ≤ √C · tvDist μ ν`.
  (Sriperumbudur–Fukumizu–Gretton–Schölkopf–Lanckriet, *On the empirical estimation of integral
  probability metrics*, 2012.)
- Proof: `m μ - m ν = ∫ (Φ x - Φ y) dπ` and the norm of a Bochner integral; the second item
  takes the infimum over couplings, which is Tau Ceti's `TauCeti.wassersteinEDist` at `p = 1`; the
  third writes `m μ - m ν = ∫ Φ d(μ - ν)` with `‖Φ‖ ≤ √C` and the Hahn decomposition behind
  Mathlib's `tvDist`.
- For the Gaussian kernel, `‖Φ x - Φ y‖² = 2 - 2e^{-r²/(2σ²)} ≤ r²/σ²`, so `L = 1/σ`.

*Needs:* 7.2; Tau Ceti Wasserstein distances.

### 9.2 The Dudley distance

- `dudleyDist μ ν = sup |∫ f dμ - ∫ f dν|` over `f` with `sup |f| + Lip f ≤ 1`, in `ℝ≥0∞`.
- `dudleyDist_le`: on a separable space, `β ≤ W₁`, `β ≤ tvDist`, and, if the diameter is at most
  `D`, `W₁ ≤ D · tvDist / 2` (Dudley, *Real Analysis and Probability*, 2002; Gibbs–Su,
  *On choosing and bounding probability metrics*, 2002). Proof: a function with
  `Lip f ≤ 1` integrates against a coupling to at most `∫ d dπ`; `|f| ≤ 1` against `μ - ν`; and the
  coupling that keeps the common part `μ ∧ ν` on the diagonal moves mass `tvDist/2` by at most
  `D`. Separability makes the Borel σ-algebra of `X × X` the product σ-algebra, so the distance
  is measurable for that coupling; without it `W₁` can be `∞` even for `μ = ν`.
- `tendsto_iff_dudleyDist`: on a Polish space, weak convergence of probability measures is
  convergence in `β`. Proof: Tau Ceti's
  `TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz` at
  `R = 1` uses the class `{Lip f ≤ 1, |f| ≤ 1}`, which contains the Dudley unit ball and is
  contained in twice it.
- Neither `W₁` nor total variation metrizes weak convergence: on `ℝ`, `δ_{1/n} → δ₀` while
  `tvDist = 2`, and `(1 - 1/n) δ₀ + n⁻¹ δₙ → δ₀` while `W₁ = 1`.

*Needs:* Tau Ceti Wasserstein and bounded-Lipschitz files; Mathlib `tvDist`.

### 9.3 Metrization of weak convergence by MMD

- `tendsto_mmd_iff`: for a bounded continuous kernel on a separable metric space,
  - weak convergence `μₙ → μ` implies `MMD(μₙ, μ) → 0`;
  - for a characteristic kernel, a tight sequence with `MMD(μₙ, μ) → 0` converges weakly to `μ`
    (Berlinet–Thomas-Agnan Theorem 101, p. 217, on compact spaces; Sriperumbudur,
    *On the optimal estimation of probability measures in weak and strong topologies*, 2016).
- Proof route. First item: `MMD(μₙ, μ)² = ∫ k d(μₙ ⊗ μₙ) - 2 ∫ k d(μₙ ⊗ μ) + ∫ k d(μ ⊗ μ)`, and
  products of weakly convergent sequences converge weakly on separable spaces. Second item: by
  Prokhorov (`isCompact_closure_of_isTightMeasureSet`) every subsequence has a weakly convergent
  subsequence with limit `ν`; by the first item and the triangle inequality `MMD(ν, μ) = 0`, so
  `ν = μ`.
- Corollary: on a compact metric space the MMD of a continuous characteristic kernel metrizes
  weak convergence of probability measures (Berlinet–Thomas-Agnan Theorem 101, p. 217), since
  every family is tight.

*Needs:* 7.1–7.2, 8.1; Mathlib Prokhorov.

**Checks.**

- `dudleyDist`: `β(δ₀, δ_d) = 2d/(2 + d)` on `ℝ`, attained by `|f| ≤ a`, `Lip f ≤ b` with `2a = bd`
  and `a + b = 1`; for `d = 1` this is `2/3`.
- `dudleyDist`: `β(δ₀, δ_d) → 2 = tvDist` as `d → ∞` and `β/d → 1 = W₁/d` as `d → 0`.
- `dudleyDist`: `β(μ, μ) = 0`, and `β ≤ 2` for probability measures.

### Examples

- Gaussian kernel: `2 - 2e^{-r²/(2σ²)} ≤ r²/σ²` because `1 - e^{-t} ≤ t`; at `r = σ` the two
  sides are `2 - 2e^{-1/2} ≈ 0.787` and `1`. This is the Lipschitz constant `1/σ` of 9.1.
- For `μₙ = (1 - 1/n) δ₀ + n⁻¹ δₙ` and the Gaussian kernel, `MMD(μₙ, δ₀) ≤ 2/n → 0` by the
  total-variation bound, while `W₁(μₙ, δ₀) = 1`.

### Dependencies

Layers 7–8; Tau Ceti optimal-transport library; Mathlib Prokhorov.

## Layer 10: Kernel tests

### 10.1 The MMD statistics

- `mmdKernel k (x, y) (x', y') = k(x, x') + k(y, y') - k(x, y') - k(x', y)`; `mmdU k n` is its
  U-statistic and `mmdV k n` its V-statistic `n⁻² ∑ᵢⱼ h(zᵢ, zⱼ)`; `centeredKernel P k` is
  `k̃(x, y) = k(x, y) - E k(x, X) - E k(X, y) + E k(X, X')`.
- `mmdV_eq_mmd_sq`: `mmdV k n z` is the squared MMD of the empirical laws of the `xᵢ` and of the
  `yᵢ`. Proof: expand both sides.
- For `n ≥ 2` and feature maps integrable under `P` and under `Q`, `E mmdU = MMD(P, Q)²` under
  `(P ⊗ Q)ⁿ`; for every `n`, `n · mmdV = (n - 1) · mmdU + n⁻¹ ∑ᵢ h(zᵢ, zᵢ)`. Both are identities
  of the U- and V-statistics (Foundations 2.4). For `n ≤ 1` there are no pairs of distinct
  indices and `mmdU = 0`, while for `P = δ₀`, `Q = δ₁` and the Gaussian kernel with `σ = 1`
  the right side is `2 - 2e^{-1/2} ≈ 0.787`.

*Needs:* Layer 7; Foundations 2.4 (local copy `uStatistic`).

### 10.2 Limit laws

- `tendstoInDistribution_mmd_null`: for a bounded continuous symmetric kernel and `P = Q`, with
  the eigenvalues `λⱼ` and `L²(P)`-orthonormal eigenfunctions of the centred kernel `k̃` and
  independent standard normals `Zⱼ`,
  - `n · mmdU → ∑ⱼ 2λⱼ (Zⱼ² - 1)` in law;
  - `n · mmdV → ∑ⱼ 2λⱼ (Zⱼ² - 1) + 2 E k̃(X, X)` in law
  (Gretton et al. 2012).
- Proof route: under `P = Q`, `h(z, z') = ⟪Φ̃x - Φ̃y, Φ̃x' - Φ̃y'⟫` with the centred feature `Φ̃`,
  so `h` is degenerate and its integral operator on `L²(P ⊗ P)` has eigenvalues `2λⱼ` with
  eigenfunctions `(φⱼ(x) - φⱼ(y))/√2`. Asymptotic 6.3 gives the first item. For the second,
  `n · mmdV = ((n - 1)/n) · n · mmdU + n⁻¹ ∑ h(zᵢ, zᵢ)` and the strong law gives
  `n⁻¹ ∑ h(zᵢ, zᵢ) → E h(Z, Z) = 2 E k̃(X, X)`; Slutsky (Foundations 8.4).
- When `∑ λⱼ = E k̃(X, X)` (for instance by Mercer's theorem on a compact space, Schölkopf–Smola
  Theorem 2.10, p. 37) the biased limit is `∑ 2λⱼ Zⱼ²`.
- `tendstoInDistribution_mmdU_alternative`: for a bounded continuous kernel, any `P` and `Q`, and
  `Δ = m_P - m_Q`, `√n (mmdU - MMD(P, Q)²) → N(0, 4 Var_P ⟪Φ X, Δ⟫ + 4 Var_Q ⟪Φ Y, Δ⟫)` in law,
  the point mass at `0` when the variance vanishes. Proof: the first projection
  `E h((x, y), Z')` is `Δ(x) - Δ(y)` with `Δ(x) = ⟪Φ x, Δ⟫` the witness of 7.2, whose variance
  under `P ⊗ Q` is `Var_P Δ(X) + Var_Q Δ(Y)`; Asymptotic 6.2 with `m = 2`.

*Needs:* 7.2, 10.1; Asymptotic 6.2–6.3; Foundations 8.4.

### 10.3 Energy distance

- `distanceKernel x y = (‖x‖ + ‖y‖ - ‖x - y‖)/2` and
  `energyDist μ ν = 2 E‖X - Y‖ - E‖X - X'‖ - E‖Y - Y'‖`.
- `posSemidef_distanceKernel`: the distance-induced kernel on `ℝᵈ` is positive semidefinite.
  Proof: `‖x - y‖` is conditionally negative definite, from
  `‖v‖ = c_d ∫ (1 - cos⟪v, t⟫) ‖t‖^{-d-1} dt` (Székely–Rizzo, *Energy statistics*, 2013), and
  `k₀(x, y) = ½(‖x - 0‖ + ‖y - 0‖ - ‖x - y‖)` is the Gram kernel of such a function based at `0`
  (Berg–Christensen–Ressel, *Harmonic Analysis on Semigroups*, 1984, the lemma on kernels based
  at a point).
- `energyDist_eq`: under finite first moments the feature maps are integrable,
  `energyDist μ ν = 2 MMD_{k₀}(μ, ν)²`, and `energyDist μ ν = 0` exactly when `μ = ν` (Sejdinovic–
  Sriperumbudur–Gretton–Fukumizu, *Equivalence of distance-based and RKHS-based statistics in
  hypothesis testing*, 2013; Székely–Rizzo 2013).
- Proof route: `‖Φ x‖ = √‖x‖`, integrable under a first moment. The first moments cancel in
  `MMD²`. For separation, the Fourier formula above gives
  `energyDist μ ν = c_d ∫ |φ_μ(t) - φ_ν(t)|² ‖t‖^{-d-1} dt`, whose vanishing forces `φ_μ = φ_ν`.

*Needs:* 7.1–7.2; Mathlib `MeasureTheory.charFun`.

### 10.4 Independence: distance covariance and HSIC

- `posSemidef_kronecker`: the product kernel `(x, y), (x', y') ↦ k(x, x') l(y, y')` of two positive
  semidefinite kernels on arbitrary types is positive semidefinite. Proof: positive
  semidefiniteness is tested on finite supports; restrict to the finite product of the supports
  and apply Mathlib's `Matrix.PosSemidef.kronecker`.
- `hsic hk hl ρ = MMD_{k⊗l}(ρ, ρ_X ⊗ ρ_Y)²`, the squared Hilbert–Schmidt norm of the centred
  cross-covariance operator (Peters–Janzing–Schölkopf Appendix A.2, item (iii), p. 217; Gretton–
  Bousquet–Smola–Schölkopf, *Measuring statistical dependence with Hilbert–Schmidt norms*, 2005).
- `distanceCovarianceSq ρ = E‖X - X'‖‖Y - Y'‖ + E‖X - X'‖ E‖Y - Y'‖ - 2 E‖X - X'‖‖Y - Y''‖`.
- `distanceCovarianceSq_eq`: under finite second moments,
  `dCov²(X, Y) = 4 HSIC_{k₀, l₀}(X, Y)` and `dCov² = 0` exactly at independence (Székely–Rizzo–
  Bakirov, *Measuring and testing dependence by correlation of distances*, 2007; Sejdinovic et
  al. 2013). Proof: double centring turns `‖x - x'‖` into `-2 k̃₀(x, x')`; the factor is
  `(-2)(-2) = 4`. Separation: the product kernel `k₀ ⊗ l₀` separates joint laws with fixed
  marginals, by applying the energy-distance separation of 10.3 in each coordinate.
- `hsic_gaussianKernel_eq_zero_iff`: for Gaussian kernels on both coordinates, `HSIC = 0` exactly
  at independence. Proof: the product of Gaussian kernels is a Gaussian kernel on
  `ℝᵈ × ℝᵉ`, with full-support spectral measure, hence characteristic (8.2).
- `hsic_empirical_eq_trace`: the HSIC of the empirical joint law of `n` pairs is
  `n⁻² tr(K H L H)` for the Gram matrices `K`, `L` and the centring matrix `H` (Gretton et al.
  2005). Proof: expand `MMD²` of the empirical joint law against the product of its marginals.
- `tendstoInDistribution_hsic_null`: for bounded continuous kernels and a product law
  `ρ = P_X ⊗ P_Y`, with the eigenvalues `λ_r`, `η_s` and orthonormal eigenfunctions of the centred
  kernels `k̃` under `P_X` and `l̃` under `P_Y`, and independent standard normals `Z_{rs}`, the
  statistic `n Ĥₙ`, with `Ĥₙ` the HSIC of the empirical joint law of `n` pairs, converges in law
  to `∑_{r,s} λ_r η_s Z_{rs}²` (Gretton et al. 2005, for the statistic). Proof route: `Ĥₙ` is a
  V-statistic of order `4`; its Hoeffding projection is the V-statistic of order `2` of
  `k̃(x, x') l̃(y, y')`, whose integral operator on `L²(P_X ⊗ P_Y)` has eigenvalues `λ_r η_s`.
  Asymptotic 6.3 gives the limit `∑ λ_r η_s (Z_{rs}² - 1)` of the U-statistic, and the diagonal
  adds
  `E k̃(X, X) · E l̃(Y, Y) = ∑ λ_r · ∑ η_s`, the traces of the covariance operators of the centred
  features; the remainder of the projection is `o_P(n⁻¹)` by the bounds on the kernels.

*Needs:* 8.2, 10.1, 10.3; Mathlib `Matrix.PosSemidef.kronecker`; Asymptotic 6.3.

### 10.5 Permutation tests

- `permutationPValue T z` is the fraction of permutations `σ` of `Fin N` with
  `T(z) ≤ T(z ∘ σ)`.
- `measureReal_permutationPValue_le`: under a law of `Fin N → X` invariant under every
  permutation of coordinates, `P(p ≤ α) ≤ α` for every `α ≥ 0` (Hoeffding, *The large-sample power
  of tests based on permutations of observations*, 1952).
- Proof route: by invariance, `z ↦ z ∘ σ` preserves the law, so averaging over `σ` gives
  `P(p(z) ≤ α) = E[ (N!)⁻¹ #{σ : p(z ∘ σ) ≤ α} ]`. Within one orbit, the `σ` with `p(z ∘ σ) ≤ α`
  are those whose value `T(z ∘ σ)` lies among the top `⌊α N!⌋` values counted with ties, at most
  `α N!` of them.
- Applications: for two samples under `P = Q`, the pooled vector has law `Measure.pi`, which is
  invariant; for `n` pairs under independence, permuting the `y`-coordinates alone preserves
  `(P_X ⊗ P_Y)ⁿ`.
- `randomizedPermutationPValue T z u` is `(#{σ : T(z) < T(z ∘ σ)} + u · #{σ : T(z ∘ σ) = T(z)})/N!`
  for `u ∈ [0, 1]`.
- `measureReal_randomizedPermutationPValue_eq`: under a law of `Fin N → X` invariant under every
  permutation of coordinates and `u` uniform on `[0, 1]` independent of `z`, the randomized
  p-value is uniform: `P(p̃ ≤ α) = α` for every `α ∈ [0, 1]`, so the test rejecting when `p̃ ≤ α`
  has level exactly `α`. Proof route: as above, average over `σ`; within one orbit the values
  `T(z ∘ σ)` form a fixed list, and the value at a uniformly chosen position, with ties broken by
  `u`, has `p̃` uniform: a block of `m` tied values with `g` larger values carries probability
  `m/N!`, and on it `p̃ = (g + u m)/N!` is uniform on `[g/N!, (g + m)/N!]`.

*Needs:* Mathlib `Equiv.Perm`, `Measure.map`.

**Checks.**

- `mmdKernel`: `h(z, z) = ‖Φ x - Φ y‖² ≥ 0`.
- `mmdKernel`: for a symmetric kernel `h(z, z') = h(z', z)`.
- `mmdKernel`: for `z = (x, x)` and `z' = (x', x')` it is `0`.
- `mmdU`: for `n = 2` it is `h(z₀, z₁)`; for the Gaussian kernel with `σ = 1`, `z₀ = (0, 1)`,
  `z₁ = (1, 0)` it is `-(2 - 2e^{-1/2}) ≈ -0.787`: the unbiased statistic can be negative.
- `mmdU`: for `n = 1` there are no injective pairs, and the value is `0`.
- `mmdU`: if all `xᵢ = yᵢ` it is `0`.
- `mmdV`: for `n = 1` it is `‖Φ x₀ - Φ y₀‖² ≥ 0`.
- `mmdV`: for the example of `mmdU` above it is `0`, while `mmdU = -0.787`.
- `mmdV`: it is always nonnegative (by 10.1), unlike `mmdU`.
- `centeredKernel`: `∫ k̃(x, y) dP(x) = 0` for every `y`.
- `centeredKernel`: for `P = δ_a`, `k̃(a, a) = 0`.
- `centeredKernel`: for the linear kernel `xy` on `ℝ` and `P` with mean `m`,
  `k̃(x, y) = (x - m)(y - m)`.
- `distanceKernel`: `k₀(x, x) = ‖x‖` and `k₀(0, y) = 0`.
- `distanceKernel`: on `ℝ`, `k₀(1, 2) = 1 = min(1, 2)` and `k₀(1, -1) = 0`: it is the covariance of
  two-sided Brownian motion.
- `distanceKernel`: it is not bounded, so 7.1 does not apply and 10.3 needs first moments.
- `energyDist`: `energyDist δ₀ δ₁ = 2` on `ℝ`, and `2 MMD_{k₀}² = 2`.
- `energyDist`: `energyDist δ₀ (½δ₋₁ + ½δ₁) = 2 - 0 - 1 = 1`.
- `energyDist`: `energyDist μ μ = 0`.
- `hsic`: `0` for a product law.
- `hsic`: for `ρ = ½(δ_{(0,0)} + δ_{(1,1)})` and Gaussian kernels with `σ = τ = 1` it is
  `(1 - e^{-1/2})²/4 ≈ 0.0387`.
- `hsic`: with the constant kernel `l ≡ 1` it is `0` for every `ρ`: a non-characteristic kernel
  misses dependence.
- `distanceCovarianceSq`: `0` for a product law.
- `distanceCovarianceSq`: for `ρ = ½(δ_{(0,0)} + δ_{(1,1)})` it is `1/2 + 1/4 - 1/2 = 1/4`, and
  `4 HSIC_{k₀,l₀} = 4 · 1/16`.
- `distanceCovarianceSq`: for `X` uniform on `{-1, 0, 1}` and `Y = X²`, `Cov(X, Y) = 0` but
  `dCov² = 8/81 > 0`.
- `permutationPValue`: it is at least `1/N!`, since the identity always counts.
- `permutationPValue`: for a constant statistic it is `1`.
- `permutationPValue`: for `N = 2`, `T(z) = z₀ - z₁` and `z₀ > z₁` it is `1/2`.
- `randomizedPermutationPValue`: at `u = 1` it is `permutationPValue T z`.
- `randomizedPermutationPValue`: for `N = 2` and `T(z) = z₀ - z₁` it is `u/2` when `z₀ > z₁`,
  `(1 + u)/2` when `z₀ < z₁`, and `u` when `z₀ = z₁`.
- `randomizedPermutationPValue`: for a constant statistic it is `u`, uniform, while
  `permutationPValue` is `1` and the unrandomized test never rejects at `α < 1`.

### Examples

- `N = 2`, `T(z) = z₀ - z₁`, i.i.d. data from a continuous law: `p = 1/2` when `z₀ > z₁` and
  `p = 1` otherwise, so `P(p ≤ 1/2) = 1/2` exactly and `P(p ≤ 1/3) = 0 < 1/3`. For i.i.d.
  Bernoulli(1/2) data, `z₀ = z₁` with probability `1/2` and then `p = 1`, so
  `P(p ≤ 1/2) = 1/4 < 1/2`, while the randomized p-value gives `1/4 + 1/2 · 1/2 = 1/2`.
- The `mmdU` example of the Checks (`n = 2`): `n · mmdV = 0` and
  `(n - 1) · mmdU + n⁻¹ ∑ h(zᵢ, zᵢ) = -(2 - 2e^{-1/2}) + (2 - 2e^{-1/2}) = 0`.
- For `z = ((0, 0), (1, 1))` and Gaussian kernels with `σ = τ = 1`, with `a = e^{-1/2}`:
  `H K H = H L H = ((1 - a)/2) [[1, -1], [-1, 1]]`, so `n⁻² tr(K H L H) = (1 - a)²/4`, the value
  of `hsic` on `½(δ_{(0,0)} + δ_{(1,1)})` in the Checks.

### Dependencies

Layers 7–8; Asymptotic 6.2–6.3; Foundations 2.4 and 8.4.

## Layer 11: Stein discrepancies, conditional embeddings and random features

### 11.1 Kernel Stein discrepancies

- For a target `P` with positive `C¹` density `p` on `ℝᵈ` and score `b = ∇p / p`, the Stein kernel
  `steinKernel k b x y = ⟪b x, b y⟫ k + ⟪b x, ∇_y k⟫ + ⟪b y, ∇_x k⟫ + ∑ⱼ ∂_{xⱼ} ∂_{yⱼ} k` and
  `ksdSq k b μ = ∫∫ k_P dμ dμ`.
- `steinKernel_spec`: if `k` is `C²`, positive semidefinite and bounded with bounded first
  derivatives and bounded mixed second derivative, and `E_P ‖b‖ < ∞`, then
  - `∫ k_P(x, y) dP(x) = 0` for every `y` (the Stein identity);
  - `k_P` is positive semidefinite, and for every `μ` with `E_μ ‖b‖ < ∞` the feature map of `k_P`
    is `μ`-integrable and `ksdSq k b μ = MMD_{k_P}(μ, P)²`
  (Liu–Lee–Jordan, *A kernelized Stein discrepancy for goodness-of-fit tests*, 2016; Chwialkowski–
  Strathmann–Gretton, *A kernel test of goodness of fit*, 2016; Gorham–Mackey, *Measuring sample
  quality with kernels*, 2017).
- Proof route: for `g = k(·, y) e` the field `p g` is integrable with integrable divergence
  `⟪g, ∇p⟫ + p ∇·g`, and the divergence of an integrable field with integrable divergence on `ℝᵈ`
  integrates to `0` (cut off with `χ(x/R)` and let `R → ∞`). Positive semidefiniteness:
  `k_P(x, y) = ⟪ξₓ, ξ_y⟫` in the `d`-fold product of the Kolmogorov space with
  `ξₓ = b(x) Φ(x) + ∇ₓΦ(x)`. The identity with `MMD²` follows from the Stein identity, which kills
  the cross and `P ⊗ P` terms.
- The supremum form `KSD(μ) = sup |E_μ (T_P g)(X)|` over the unit ball of the `d`-fold Kolmogorov
  space, with `T_P g = ⟪g, b⟫ + ∇·g`, is 7.2 for the kernel `k_P`; it is a target stated in prose
  with that proof.

*Needs:* 7.1–7.2; Mathlib `gradient`, `fderiv`, Gauss–Green on boxes.

### 11.2 Convergence control

- `tendsto_ksdSq_of_tendsto_wassersteinEDist`: if `P` has a finite first moment and Lipschitz
  score, and `k` is as in 11.1, then `W₁(μₙ, P) → 0` implies `KSD(μₙ)² → 0` (Gorham–Mackey
  2017, under stronger hypotheses on the kernel and the score; the route below gives the
  statement as written).
- Proof route (own): `|k_P(x, y)| ≤ C'(1 + ‖x‖)(1 + ‖y‖)` from the bounds on `k` and
  `‖b(x)‖ ≤ ‖b(0)‖ + L‖x‖`. Convergence in `W₁` is weak convergence with uniformly integrable
  first moments, so `μₙ ⊗ μₙ → P ⊗ P` weakly with `(1 + ‖x‖)(1 + ‖y‖)` uniformly integrable; `k_P`
  is continuous, so `∫∫ k_P dμₙ dμₙ → ∫∫ k_P dP dP = 0` by 11.1.
- The converse directions (convergence control by the inverse multiquadric Stein discrepancy for
  distantly dissipative targets, and its failure for fast-decaying kernels in dimension `d ≥ 3`)
  are listed under Beyond.

*Needs:* 11.1; Tau Ceti `TauCeti.wassersteinEDist`.

### 11.3 Conditional mean embeddings

- `covariance_condExp_eq`: for bounded continuous kernels `k` on `X` and `l` on `Y`, a joint law
  `ρ` and `g` in the Kolmogorov space of `l`, if `f` in the Kolmogorov space of `k` satisfies
  `f(x) = E[g(Y) | X = x]` for `ρ_X`-almost every `x`, then `C_{XX} f = C_{XY} g`, where
  `C_{XX} f = E[⟪f, Φ X⟫ Φ X]` and `C_{XY} g = E[⟪g, Ψ Y⟫ Φ X]` (Song–Huang–Smola–Fukumizu, *Hilbert
  space embeddings of conditional distributions*, 2009; Fukumizu–Bach–Jordan, *Dimensionality
  reduction for supervised learning with reproducing kernel Hilbert spaces*, 2004).
- Proof: disintegrate `ρ = ρ_X ⊗ ρ.condKernel` and integrate `⟪g, Ψ y⟫ Φ x` first in `y`.
- Consequence (prose target): if `C_{XX}` is injective, `Φ x` lies in its range, and for every `g`
  in the Kolmogorov space of `l` some `f_g` in the Kolmogorov space of `k` represents
  `x ↦ E[g(Y) | X = x]` as above, then `U_{Y|x} = C_{YX} C_{XX}⁻¹ Φ x` satisfies
  `⟪g, U_{Y|x}⟫ = f_g(x)` for every `g`, hence `⟪g, U_{Y|x}⟫ = E[g(Y) | X = x]` for `ρ_X`-almost
  every `x`. Proof: `C_{XY} g = C_{XX} f_g` by `covariance_condExp_eq`, and `C_{XX}` is
  self-adjoint, so `⟪g, U_{Y|x}⟫ = ⟪C_{XX} f_g, C_{XX}⁻¹ Φ x⟫ = ⟪f_g, Φ x⟫`. Without the
  representability hypothesis the conclusion fails: for `X = Y` uniform on `{1, 2}`, `k ≡ 1` and
  `l(y, y') = 𝟙[y = y']`, `C_{XX}` is the identity on the constants, and
  `⟪g, U_{Y|x}⟫ = (g(1) + g(2))/2` while `E[g(Y) | X = x] = g(x)`.
- The hypothesis can fail: for Gaussian kernels and independent `X`, `Y`, the conditional
  expectations are nonzero constants, which do not lie in the Gaussian Kolmogorov space (its
  functions vanish at infinity, Wendland Theorem 10.12, p. 139, for the native space). Hence the
  regularized estimator `Û_{Y|x} = ∑ᵢ βᵢ(x) l(yᵢ, ·)` with
  `cmeWeights k xs λ x = (K + nλ I)⁻¹ (k(x, xᵢ))ᵢ`; it is the representer-theorem solution
  (Nonparametric 5.8) of the ridge regression of `Ψ(Y)` on `X` with penalty `λ`.
- `cmeWeights_isMinOn`: for `n ≥ 1`, `λ > 0` and values `v ∈ ℝⁿ` (for instance `vᵢ = g(yᵢ)`), the
  element `f = ∑ᵢ ((K + nλ I)⁻¹ v)ᵢ Φ(xᵢ)` of the Kolmogorov space satisfies
  `⟪f, Φ x⟫ = cmeWeights k xs λ x ⬝ v` for every `x`, and minimizes
  `f' ↦ n⁻¹ ∑ᵢ (vᵢ - ⟪f', Φ xᵢ⟫)² + λ ‖f'‖²` over the whole space: the estimate
  `⟪g, Û_{Y|x}⟫ = ∑ᵢ βᵢ(x) g(yᵢ)` is the kernel ridge regression of `g(Y)` on `X`. Proof: `K + nλ I`
  is positive definite, hence invertible and symmetric; the component of `f'` orthogonal to the
  `Φ(xᵢ)` only adds to the norm, and on their span the objective is the convex quadratic
  `n⁻¹ ‖v - K α‖² + λ αᵀ K α`, whose gradient `2K((K + nλ I) α - v)/n` vanishes at
  `α = (K + nλ I)⁻¹ v`.

*Needs:* 7.1; Nonparametric 5.8; Mathlib `MeasureTheory.Measure.condKernel`.

### 11.4 Random Fourier features

- `uniformPhase` is the uniform law on `[0, 2π]`, and
  `rffKernel s x y = D⁻¹ ∑ⱼ 2 cos(⟪ωⱼ, x⟫ + bⱼ) cos(⟪ωⱼ, y⟫ + bⱼ)` for `s = ((ωⱼ, bⱼ))ⱼ`.
- `rffKernel_spec`: let `k(x, y) = ∫ cos⟪ω, x - y⟫ dΛ(ω)` for a probability measure `Λ` on `ℝᵈ`
  (Bochner with `ψ(0) = 1`), let `D ≥ 1`, and draw `(ωⱼ, bⱼ)`, `j < D`, i.i.d. from
  `Λ ⊗ uniformPhase`. Then
  - `E rffKernel s x y = k(x, y)`;
  - `P(|rffKernel s x y - k(x, y)| ≥ ε) ≤ 2 e^{-Dε²/8}`;
  - if `σ² = ∫ ‖ω‖² dΛ < ∞`, `M` is compact and `ε ≤ σ diam M`, then
    `P(sup_{x, y ∈ M} |rffKernel s x y - k(x, y)| ≥ ε) ≤ 98 (σ diam M/ε)² e^{-Dε²/(32(d + 1))}`;
  - on the event `sup_{M×M} |rffKernel - k| ≤ ε`, the kernel energies
    `∫∫ k dμ dμ - 2 ∫∫ k dμ dν + ∫∫ k dν dν` of `rffKernel` and `k` differ by at most `4ε` for all
    probability measures carried by `M`
  (Rahimi–Recht, *Random features for large-scale kernel machines*, 2007, who state the uniform
  bound with other constants; the constants `98` and `32(d + 1)` for these features with phases
  are those of Sutherland–Schneider, *On the error of random Fourier features*, 2015).
- Proof route. Unbiasedness: `2 cos a cos b = cos(a - b) + cos(a + b)` and the uniform phase kills
  `cos(a + b)`. Pointwise: each summand lies in `[-2/D, 2/D]`; Hoeffding
  (`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`). Uniform: with phases,
  `rffKernel s x y` is not a function of `x - y` (Checks), so the net lives on `M × M ⊂ ℝ²ᵈ`. An
  `r`-net of `M` from Tau Ceti's `TauCeti.exists_finset_isCover_of_subset_closedBall`, with at
  most `(4 diam M / r)ᵈ` points, gives a net of `M × M` of its pairs; apply Hoeffding at the net
  pairs with a union bound, and Markov's inequality for `D⁻¹ ∑ⱼ ‖ωⱼ‖²`, which bounds the Lipschitz
  constant of `(x, y) ↦ rffKernel s x y - k(x, y)` on `M × M`; optimize `r`. MMD: each of the
  four double integrals moves by at most `ε`.
- For the Gaussian kernel `e^{-γ‖x - y‖²}`, `Λ = N(0, 2γ I)` and `σ² = 2dγ`.

*Needs:* Mathlib Hoeffding, `Measure.pi`; Tau Ceti covering numbers.

**Checks.**

- `steinKernel`: for `P = N(0, 1)` (`b(x) = -x`) and the Gaussian kernel with width `σ`, on the
  diagonal `k_P(x, x) = x² + σ⁻²`, since `∇_y k` vanishes there and `∂_x ∂_y k = σ⁻²`; at `x = 0`
  and `σ = 1.3` it is `1/1.69 ≈ 0.592`.
- `steinKernel`: for the constant kernel `k ≡ 1`, `k_P(x, y) = ⟪b x, b y⟫`.
- `steinKernel`: it depends on `p` only through `b`, so `p` and `2p` give the same kernel.
- `ksdSq`: `ksdSq k b P = 0` by 11.1.
- `ksdSq`: for `P = N(0, 1)`, the Gaussian kernel with `σ = 1.3`, `ksdSq(N(1/2, 1)) ≈ 0.169` and
  `ksdSq(N(1, 1)) ≈ 0.677`.
- `ksdSq`: for the constant kernel, `ksdSq μ = ‖E_μ b‖²`, which vanishes for every `μ` with
  `E_μ b = 0`, for instance `μ = N(0, 4)` when `P = N(0, 1)`: the constant kernel does not
  control convergence.
- `cmeWeights`: for `n = 1`, `β(x) = k(x, x₁)/(k(x₁, x₁) + λ)`.
- `cmeWeights`: for `λ = 0` and an invertible Gram matrix, `β(xᵢ) = eᵢ` (interpolation).
- `cmeWeights`: for `λ = 0` and a repeated point the Gram matrix is singular, Mathlib's inverse
  is `0`, and `β = 0`; this junk value is why the estimator takes `λ > 0`.
- `uniformPhase`: it is a probability measure.
- `uniformPhase`: `∫ cos(t + b) d(uniformPhase)(b) = 0` for every `t`.
- `uniformPhase`: it gives mass `1/2` to `[0, π]` and `0` to `[2π, 3π]`.
- `rffKernel`: for `D = 1`, `ω = 0`, it is `2 cos² b`, with mean `1 = k(x, x)`.
- `rffKernel`: `|rffKernel s x y| ≤ 2`.
- `rffKernel`: it is not a function of `x - y`: for `d = D = 1`, `ω = 1` and `b = 0` it is `2` at
  `x = y = 0` and `0` at `x = y = π/2`.
- `rffKernel`: without the phases (`b = 0`) the mean is `(k(x, y) + E cos⟪ω, x + y⟫)`, not
  `k(x, y)`: the uniform phase is needed for unbiasedness.

### Examples

- For `ε = 0.3` the pointwise bound `2e^{-Dε²/8}` is below `1` from `D = 62` on
  (`2e^{-62 · 0.09/8} ≈ 0.996`) and below `0.05` from `D = 328` on
  (`2e^{-328 · 0.09/8} ≈ 0.0499`, while `D = 327` gives `≈ 0.0505`).

### Dependencies

Layers 7–9; Nonparametric 5.8; Tau Ceti covering numbers; Mathlib Hoeffding.

## Downstream consumers

No other roadmap consumes the results of this one.

MarkovChainMixing states the spectral decomposition of a kernel reversible for a stationary law
`π > 0` (its 2.1) and Cheeger's inequality `Φ⋆²/2 ≤ γ ≤ 2Φ⋆` for the bottleneck ratio `Φ⋆` and the
spectral gap `γ` (its 3.2), for Markov kernels. This roadmap owns the weighted-matrix forms 3.2
and 4.1 and proves them from its Layers 1–2; neither roadmap supplies the other. The dictionary: a
chain with transition matrix `P` reversible for `π > 0` is the weighted graph
`W x y = π(x) P(x, y)`, with degrees `π(x)` and total volume `1`; conversely a weighted graph with
positive degrees has the walk `P = D⁻¹ W` with `π = d / vol V` (4.1). Under it `h = Φ⋆`,
`λ₁ = γ`, and the first half of `diffusionDistSq_eq` is MarkovChainMixing 2.1 for the walk of
`W`. The bound `1 - √(1 - h²) ≤ λ₁` of 3.2 is specific to this roadmap.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Geometric statistics on manifolds.** Uniqueness of intrinsic Fréchet means in geodesic balls
  (Afsari's theorem; Pennec–Sommer–Fletcher Theorem 2.2 and Example 2.4, p. 43), the central limit
  theorem for intrinsic means on manifolds, the barycentric equation, and the
  `ε`-neighbourhood consistency of empirical Fréchet mean sets. They need Riemannian
  exponential maps and Jacobi-field estimates that Mathlib does not have.
- **Manifold reach.** That a compact submanifold of positive reach `τ` satisfies the local
  chord–arc condition of 5.3 with `η = O(ε/τ)`; minimax rates of manifold estimation in Hausdorff
  loss (Genovese–Perone-Pacifico–Verdinelli–Wasserman, *Manifold estimation and singular
  deconvolution under Hausdorff loss*, 2012).
- **Stein convergence control.** Weak convergence from `KSD → 0` for distantly dissipative
  targets with the inverse multiquadric kernel, the tight version for translation-invariant
  kernels with nonvanishing Fourier transform, and the counterexample for fast-decaying kernels
  in `d ≥ 3` (Gorham–Mackey 2017). They need solutions of the Stein equation with
  gradient bounds for Langevin diffusions.
- **Sobolev-type metrization.** MMD metrizes weak convergence on `ℝᵈ` without tightness for
  translation-invariant kernels whose Fourier transform decays polynomially (Matérn), via the
  native space of Wendland Theorem 10.12, p. 139.
- **Spectral convergence of graph Laplacians.** Convergence of the eigenvectors of the graph
  Laplacians of random geometric graphs to those of the Laplace–Beltrami operator.
- **Statistical optimal transport.** Rates of empirical Wasserstein distances, entropic and
  semidiscrete transport statistics, and estimation of transport maps.

## Prior formalization

This section is secondary and not prescriptive.

- **lean-CKSD** (Core Knowledge of Statistics and Data Science, Apache 2.0) formalizes the
  synopsis items behind this roadmap in `CKSD/Geometry/`: `Cheeger.lean` (synopsis 108.1),
  `GeometricStatistics.lean` (108.5, 108.7, 108.8, 108.10), `ManifoldLearning.lean` (108.4), and
  under `Kernels/` the files `Characteristic.lean`, `Distance.lean`,
  `DistanceCovarianceCentering.lean`, `DistanceProductSeparation.lean`, `EnergyDistance.lean`,
  `Spectral.lean`, `UnbiasedMMD.lean`, `RandomFeatures.lean` (108.60–108.62, 108.68, 108.74) and
  `SteinDiscrepancy.lean` (108.71–108.72). The limit laws of `UnbiasedMMD.lean` are for a bounded
  finite-dimensional feature map; 10.2 here is general.
- **Statlib** (Apache 2.0) covers U-statistics and the central limit theorem used through the
  Asymptotic roadmap; it has no kernel-discrepancy or spectral-graph material.
- Mathlib's `SimpleGraph.lapMatrix` file is the unweighted case of 1.1–1.3.

## References

- A. Berlinet and C. Thomas-Agnan, *Reproducing Kernel Hilbert Spaces in Probability and
  Statistics*, Springer, 2004. Chapter 4: §4.6 (p. 210), Theorem 101 (p. 217), §4.9.1 (p. 223).
- A. Bhattacharya and R. Bhattacharya, *Nonparametric Inference on Manifolds*, Cambridge
  University Press, 2012. Chapter 3: Theorems 3.2–3.3 (pp. 23–24); Chapter 4: Definition 4.1,
  Propositions 4.2–4.3 (pp. 36–38).
- F. R. K. Chung, *Spectral Graph Theory*, CBMS Regional Conference Series 92, American
  Mathematical Society, 1997. Chapter 1: (1.2) (p. 4), Lemma 1.7 (pp. 6–7), §1.4 (p. 12), §1.5
  (p. 14); Chapter 2: (2.1)–(2.2) (p. 24), Lemma 2.1 (p. 25), Theorems 2.2–2.3 (pp. 26–27).
- I. L. Dryden and K. V. Mardia, *Statistical Shape Analysis*, Wiley, 1998. Result 3.2 (p. 44);
  Definitions 4.12–4.13, Results 4.1–4.3 and (4.25) (pp. 61–68); Definitions 5.1, 5.3, 5.5 and
  Results 5.1–5.2 (pp. 84–89).
- M. Fiedler, *Matrices and Graphs in Geometry*, Cambridge University Press, 2011. §6.1
  (pp. 145–146).
- A. Grigor'yan, *Introduction to Analysis on Graphs*, University Lecture Series 71, American
  Mathematical Society, 2018. Lemma 2.4 (p. 31), Theorem 2.7 (p. 32), Definition 3.1 and
  Lemma 3.2 (p. 53), Theorem 3.3 and Lemma 3.4 (p. 54).
- M. Keller, D. Lenz and R. K. Wojciechowski, *Graphs and Discrete Dirichlet Spaces*, Springer,
  2021. Proposition 0.8 (p. 11).
- K. V. Mardia, J. T. Kent and J. M. Bibby, *Multivariate Analysis*, Academic Press, 1979.
  Theorem 14.2.1 (p. 397), Theorem 14.4.2 (p. 408), Theorem 14.7.1 (p. 416).
- J. S. Marron and I. L. Dryden, *Object Oriented Data Analysis*, CRC Press, 2022. §7.1, (7.5)
  (p. 127).
- V. I. Paulsen and M. Raghupathi, *An Introduction to the Theory of Reproducing Kernel Hilbert
  Spaces*, Cambridge University Press, 2016. Theorem 2.14 (p. 25), the Moore–Aronszajn theorem
  behind the Kolmogorov space.
- X. Pennec, S. Sommer and T. Fletcher (eds.), *Riemannian Geometric Statistics in Medical Image
  Analysis*, Academic Press, 2020. Chapter 2: Theorem 2.2 and Example 2.4 (p. 43), for Beyond.
- J. Peters, D. Janzing and B. Schölkopf, *Elements of Causal Inference*, MIT Press, 2017.
  Appendix A.2, item (iii) (pp. 216–217).
- S. Saitoh and Y. Sawano, *Theory of Reproducing Kernels and Applications*, Springer, 2016.
  Theorem 2.3 (p. 73).
- B. Schölkopf and A. J. Smola, *Learning with Kernels*, MIT Press, 2002. Proposition 2.1
  (p. 27), Theorem 2.10 (p. 37).
- J. Wang, *Geometric Structure of High-Dimensional Data and Dimensionality Reduction*, Springer,
  2012. Theorem 3.1 (p. 68); Theorems 6.1–6.2 (pp. 122–125); Theorem 8.2 (p. 176); (10.4)–(10.6)
  (pp. 206–207); Chapter 12 (p. 235); Definition 14.3 (p. 290), Lemma 14.1 (p. 291).
- H. Wendland, *Scattered Data Approximation*, Cambridge University Press, 2004. Theorem 6.6
  (p. 70), Theorem 6.10 (p. 74), Theorems 7.13–7.15 (pp. 93–95), Theorem 10.12 (p. 139).
- Works cited by author, title and year, with proof routes of this roadmap: Belkin–Niyogi 2003;
  Berg–Christensen–Ressel 1984; Bernstein–de Silva–Langford–Tenenbaum 2000;
  Chwialkowski–Strathmann–Gretton 2016; Coifman–Lafon 2006; Cuevas–Rodríguez-Casal 2004; Dudley
  2002; Fukumizu–Bach–Jordan 2004; Genovese–Perone-Pacifico–Verdinelli–Wasserman 2012; Gibbs–Su
  2002; Gorham–Mackey 2017; Gretton–Bousquet–Smola–Schölkopf 2005;
  Gretton–Borgwardt–Rasch–Schölkopf–Smola 2012; Hoeffding 1952; Horn 1954; Liu–Lee–Jordan 2016;
  Rahimi–Recht 2007; Roweis–Saul 2000; Sejdinovic–Sriperumbudur–Gretton–Fukumizu 2013;
  Smola–Gretton–Song–Schölkopf 2007; Song–Huang–Smola–Fukumizu 2009;
  Sriperumbudur–Gretton–Fukumizu–Schölkopf–Lanckriet 2010;
  Sriperumbudur–Fukumizu–Gretton–Schölkopf–Lanckriet 2012; Sriperumbudur 2016; Székely–Rizzo–Bakirov
  2007; Székely–Rizzo 2013; von Luxburg 2007.

# Roadmap: determinantal point processes

**Summary.** A determinantal point process is a random configuration of points whose
correlation functions are the determinants of a kernel evaluated at the points. Its points repel
one another. This roadmap builds the general theory on a locally compact Polish space with a
reference measure:
- the linear algebra of kernel matrices, namely Hadamard's inequality, gauge changes, weights,
  the Schur complement and the Cauchy–Binet expansion of finite-rank kernels;
- the definition through factorial moments of counts, with simplicity, intensity and pair
  correlation, change of reference measure, indistinguishable kernels, the Poisson process as a
  determinantal process, domination by Poisson moments, exponential tails, uniqueness of the law
  and the void probability series;
- kernels in spectral form on bounded windows and their integral operators;
- projection processes, the Bernoulli mixture representation and the law of counts;
- the Macchi–Soshnikov existence theorem;
- the reduced Palm distributions;
- stationary processes on ℝ^d, with the spectral existence condition and the Gaussian, Cauchy,
  Whittle–Matérn and power exponential models.

The roadmap is a synthesis of several sources: Hough, Krishnapur, Peres and Virág; Baccelli,
Błaszczyszyn and Karray; and Lavancier, Møller and Rubak. The Macchi–Soshnikov theorem and the Palm
kernel go back to Soshnikov and to Shirai and Takahashi (see [References](#references)).

Four other roadmaps are nearest.
- SpatialPointProcessFoundations, of the same spatial-statistics family, supplies the
  configuration space, counts, intensities, the Poisson property, Palm kernels, factorial moment
  and Janossy measures, thinning and stationarity. This roadmap's processes are point processes in
  its sense.
- [RandomMatrices](../RandomMatrices/README.md) treats determinantal processes from continuous
  kernels: Mercer's theorem, trace-class integral operators, Fredholm determinants and joint
  count laws. It proves existence for finite ensembles and their limits. This roadmap supplies
  the general existence theorem and the measurable-kernel theory that it leaves out, and uses its
  continuous-kernel results.
- [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) supplies the trace-class gauge.
- SecondOrderRandomFields, of the same family, owns the Matérn family. Its Matérn spectral
  density (§4.1) is the spectral density of the Whittle–Matérn model of 7.3, after the change of
  Fourier convention, and its Matérn correlation, built on the K-Bessel kernel of
  [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §2.1a, is the classical
  form of that model's covariance.

Headlines that restate a source result cite a theorem, definition, section or equation number
with its printed page; corollaries and adaptations carry a proof route.

`Suggested.lean` states the headlines below that carry a Lean name, against the pinned Mathlib
and Tau Ceti. Each is stated with every conclusion the README attaches to it, together with the
definitions those statements need. It is not an exhaustive acceptance test. The other headlines
are targets of the same standing, stated in prose.

Suggested home: `TauCeti/Probability/PointProcess/Determinantal/`.

## How to read the build

Layer 1 is finite-dimensional linear algebra about the matrices [K(xᵢ, xⱼ)]. Every inequality
and identity of the layers that follow is one of these facts, integrated against a product measure.

Layer 2 defines a determinantal point process through the factorial moments of its counts on
disjoint bounded windows. These are the integrals of the kernel determinants. The definition
needs no operator theory, and each property in Layer 2 is a statement about these integrals.
Hadamard's inequality bounds the factorial moments by Poisson moments. That bound gives
exponential moments, and the exponential moments make the factorial moments determine the law.

Layer 3 introduces the operator side. On a bounded window a kernel in spectral form is
∑ λₖ φₖ(x) conj φₖ(y), with orthonormal φₖ and summable λₖ ≥ 0. Its integral operator is
positive and trace class, with eigenvalues λₖ. The spectral form fixes the kernel on the diagonal,
not only up to a null set of pairs. The diagonal enters every determinant, so this is the point
on which existence turns.

Layer 4 builds the processes of projection kernels and mixes them over independent Bernoulli
choices of eigenfunctions. Layer 5 is the converse: a kernel in spectral form is the kernel of a
process iff every eigenvalue is at most 1. Layer 6 conditions on a point. Layer 7 specialises to
translation-invariant kernels on ℝ^d, where the eigenvalue condition becomes a bound on the
Fourier transform.

The layers are in build order. Each layer needs only earlier layers and the suppliers. Layers 6
and 7 need only Layers 1–5, not each other.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with `MeasureTheory` and
  `ProbabilityTheory` opened. `Suggested.lean` states the prototypes in the namespace
  `TauCetiRoadmap.DeterminantalPointProcesses`.
- **Space and reference measure.** S is a locally compact Polish space with its Borel
  σ-algebra, and μ is a σ-finite measure on S. Where a statement needs it, μ is also finite on
  compact sets. A bounded window is a measurable set with compact closure, as in
  SpatialPointProcessFoundations.
- **Configurations.** A point process is a measurable map from a probability space into
  `PointMeasure`, the locally finite integer-valued measures of SpatialPointProcessFoundations
  §1.1. Counts are `PointMeasure.count`, in `ℕ∞`, and simplicity is `PointMeasure.IsSimple`. The
  intensity is `intensity` (§2.1 there). A law on configurations is a probability measure on
  `PointMeasure`, viewed as the identity process. The Poisson property is
  `IsPoissonRandomMeasure`, with `IsPoissonPointProcess` its form on point measures (§5.1 there);
  it includes almost surely infinite counts on sets of infinite intensity.
- **Kernels.** A kernel is a function K : S → S → ℂ. `kernelMatrix` is the matrix
  [K(xᵢ, xⱼ)] at a tuple of points. A positive semidefinite kernel is one with
  `Matrix.PosSemidef K`, K read as a matrix indexed by S: Hermitian, with nonnegative quadratic
  form on finitely supported vectors. This is the form of Tau Ceti's Bochner theorem
  `TauCeti.bochner_posSemidef`. `IsAEPSDKernel` asks only that the kernel matrices be positive
  semidefinite at almost every tuple.
- **The order on ℂ.** The order is Mathlib's `ComplexOrder`, so 0 ≤ z says that z is a
  nonnegative real number. A kernel determinant enters an integral as the extended nonnegative
  real `ENNReal.ofReal` of its real part, after a separate condition that it is a.e. nonnegative.
- **Determinantal.** `IsDeterminantal` asks four things of P, N, K and μ: N and K are
  measurable; for every n the n-th kernel determinant is nonnegative at μⁿ-almost every
  tuple; and for every family of pairwise disjoint bounded windows B₁, …, B_m and every
  assignment c of n indices to windows, `E ∏ⱼ N(Bⱼ)^(nⱼ) = ∫ det[K(xᵢ, xⱼ)] dμⁿ` over the
  product of the `B (c i)`. Here nⱼ is the number of indices sent to Bⱼ and `N(B)^(k)` is the
  falling factorial (`factorialCountMoment`, SpatialPointProcessFoundations §4.1). Integrals of
  counts are lower Lebesgue integrals in `ℝ≥0∞`, so they take no junk value. The case n = 0 says
  that P is a probability measure.
- **Spectral data.** The eigenvalues of a spectral form are indexed by ℕ, with multiplicity and
  with zeros allowed, and the eigenfunctions are measurable. Orthonormality is asked only of
  eigenfunctions with nonzero eigenvalue, so finite-rank kernels on finite spaces are included.
  The same holds for the orthonormal families of Layer 4, which are indexed by ℕ and orthonormal
  on a chosen set of indices.
- **Fourier transform.** The Fourier transform is Mathlib's, with kernel exp(−2πi⟪x, ξ⟫). This is
  the convention of Lavancier–Møller–Rubak. On L² it is Mathlib's
  `MeasureTheory.Lp.fourierTransformₗᵢ`. The spectral density of a covariance function C₀ is its
  Fourier transform.
- **Locators** are (source, item, printed page) in the editions under
  [References](#references). HKPV is Hough–Krishnapur–Peres–Virág, BBK is
  Baccelli–Błaszczyszyn–Karray and LMR is Lavancier–Møller–Rubak.

## Layer 1: kernel matrices

### 1.1 Hadamard's inequality

- `kernelMatrix K x` is the matrix [K(xᵢ, xⱼ)]. A positive semidefinite kernel
  (`Matrix.PosSemidef K`) has positive semidefinite kernel matrices at every tuple, repeated
  points allowed (`posSemidef_kernelMatrix`, proved in `Suggested.lean` as a supporting step by
  Mathlib's `Matrix.PosSemidef.submatrix`). Conversely, positive semidefinite kernel matrices at
  every tuple give `Matrix.PosSemidef K`, by enumerating the support of a finitely supported
  vector.
- **Hadamard's inequality for kernel matrices** (`det_kernelMatrix_mem_Icc`; HKPV (4.2.15),
  p. 53). For a positive semidefinite kernel, 0 ≤ det[K(xᵢ, xⱼ)] ≤ ∏ᵢ K(xᵢ, xᵢ) in the order of
  ℂ. Route: a positive semidefinite matrix is a Gram matrix (Mathlib's square root of a positive
  semidefinite matrix), and Tau Ceti's `Matrix.det_gram_le_prod_norm_sq` bounds Gram
  determinants. The lower bound is Mathlib's `Matrix.PosSemidef.det_nonneg`.
- A repeated point makes the determinant vanish (`det_kernelMatrix_eq_zero`). This is proved in
  `Suggested.lean` as a supporting step; it is the mechanism of simplicity (2.2).

*Needs:* Mathlib `Matrix.PosSemidef` and `Matrix.PosSemidef.submatrix`; Tau Ceti
`Matrix.det_gram_le_prod_norm_sq`.

**Checks.**

- K = [[2, 1 + i], [1 − i, 3]] has determinant 4, between 0 and 6.
- Hermitian non-PSD case (negative control): [[1, 2], [2, 1]] has determinant −3 < 0. So the
  lower bound needs positive semidefiniteness, not only the Hermitian property.
- [[2, 1, 0], [1, 2, 1], [0, 1, 2]] has determinant 4, at most the product 8 of its diagonal
  entries.

### 1.2 Gauge, weights and the pair correlation

- A gauge change h(x) K(x, y) h(y)⁻¹, with h nowhere zero, conjugates every kernel matrix by a
  diagonal matrix and leaves the determinants unchanged (`det_kernelMatrix_gauge`). This is
  proved in `Suggested.lean` as a supporting step.
- **Weighted kernels** (`det_kernelMatrix_mul_sqrt`). For f : S → ℝ≥0, the kernel
  √f(x) K(x, y) √f(y) has determinants ∏ᵢ f(xᵢ) · det[K(xᵢ, xⱼ)]. This is the identity behind
  change of reference measure (2.3) and thinning (2.3). Route: the matrix is D K D with D the
  diagonal matrix of the √f(xᵢ).
- `pairCorrelation K x y` is 1 − |K(x, y)|² / (K(x, x) K(y, y)).
- **The pair correlation of a positive semidefinite kernel** (`pairCorrelation_determinantal`;
  LMR (2.3), p. 857). If K(x, x) > 0 and K(y, y) > 0, then the second kernel determinant is
  K(x, x) K(y, y) g(x, y) with 0 ≤ g(x, y) ≤ 1. Route: the 2 × 2 determinant of a Hermitian
  matrix and the case n = 2 of Hadamard's inequality.

*Needs:* 1.1.

**Checks.**

- For K = [[2, 1 + i], [1 − i, 3]] at the pair of its two points, g = 1 − 2/6 = 2/3 and the
  determinant is 2 · 3 · 2/3 = 4.
- Let T be the 4 × 4 tridiagonal matrix with 2 on the diagonal and 1 beside it, and K = T/5. Its
  eigenvalues are (2 + 2 cos(kπ/5))/5, k = 1, …, 4, that is 0.723607, 0.523607, 0.276393 and
  0.076393, and det K = 5/625 = 0.008. The same K serves the Checks of 1.3, 2.1, 2.3, 4.2, 4.3
  and 6.1, on the 4-point space {0, 1, 2, 3} with counting measure. With weights
  p = (0.3, 0.7, 0.5, 0.9), both sides of the weighted identity equal 0.0945 · 0.008 = 0.000756.
- For the sine kernel, g(r) = 1 − (sin πr / πr)², and g(1/2) = 0.594715. It tends to 0 as r → 0,
  which is repulsion at short range.

### 1.3 The Schur complement

- `reducedKernel K u` is the kernel K(x, y) − K(x, u) K(u, y) / K(u, u). It is K itself when
  K(u, u) = 0, by Lean's x / 0 = 0, and for a positive semidefinite kernel K(x, u) = 0 then.
- **Schur complement of kernel determinants** (`det_kernelMatrix_cons`). If K(u, u) ≠ 0, then the
  determinant at (u, x₁, …, x_n) is K(u, u) times the determinant of the reduced kernel at
  (x₁, …, x_n). Route: Mathlib's `Matrix.det_fromBlocks₁₁`.
- **The reduced kernel of a positive semidefinite kernel is positive semidefinite**
  (`posSemidef_reducedKernel`). Route: the Schur complement of a positive semidefinite block
  matrix, Mathlib's `Matrix.PosDef.fromBlocks₁₁`, and the case K(u, u) = 0 separately.

*Needs:* 1.1.

**Checks.**

- For K = T/5 of 1.2 and u = 0, both sides of the Schur identity equal 0.4 · 0.02 = 0.008. The
  reduced matrix is [[1.5, 1, 0], [1, 2, 1], [0, 1, 2]]/5, with eigenvalues 0.085866, 0.351514
  and 0.662620.

### 1.4 Finite-rank kernels

- **Cauchy–Binet for finite-rank kernels** (`factorial_mul_det_kernelMatrix_finiteRank`; HKPV
  (4.5.2), p. 66). For K(x, y) the sum over k < r of λₖ φₖ(x) conj φₖ(y),
  `n! det[K(xᵢ, xⱼ)] = ∑_f ∏ᵢ λ_{f(i)} |det[φ_{f(j)}(xᵢ)]|²`, the sum running over all maps
  f from n indices to r. Maps that are not injective contribute 0. Each n-element set of
  eigenfunctions is counted n! times with the same value. Route: Tau Ceti's
  `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` with A = ΦΛ and B = Φ*, then grouping the maps
  by their image.

*Needs:* 1.1; Tau Ceti `Matrix.det_mul_eq_sum_prod_mul_det_submatrix`.

**Checks.**

- r = 4, n = 3, λ = (0.9, 0.5, 0.2, 0.1), and the values φₖ(xᵢ) at three points given by the rows
  (1, i, 0), (1, −1, 2), (0, 1, 1) and (i, 0, 1) for k = 1, …, 4: both sides equal 8.7.
- r < n: every map f repeats a column, so the right side is 0, and K has rank below n, so the
  determinant on the left is 0 too.

## Layer 2: determinantal point processes

### 2.1 The definition

- `factorialCountMoment` (SpatialPointProcessFoundations §4.1) is `∏ⱼ N(Bⱼ)^(nⱼ)` in `ℝ≥0∞`.
  Since the windows are bounded, every count of a point measure on them is finite.
- `IsDeterminantal P N K μ` is the definition of the Conventions. It is the count form of HKPV
  Definition 4.2.1 (p. 48), BBK Definition 5.1.1 (p. 227) and LMR Definition 1 (p. 857): the
  correlation functions with respect to μ are ρₙ(x) = det[K(xᵢ, xⱼ)]. Simplicity is not part of
  the definition; it is a theorem (2.2).
- `IsLocallyIntegrableDiagonal K μ` says that ∫_W K(x, x) dμ < ∞ on every bounded window W, and
  `IsAEPSDKernel K μ` that the kernel matrices are positive semidefinite at μⁿ-a.e. tuple.
- **Agreement with correlation functions** (`isDeterminantal_iff_isProductDensity`; HKPV
  (1.2.3), p. 8). Let K be a.e. positive semidefinite with locally integrable diagonal. Then N is
  determinantal with kernel K iff N and K are measurable, the kernel determinants are a.e.
  nonnegative, and for every n the function ofReal(det[K(xᵢ, xⱼ)]) is an n-th product density
  with respect to μ (`IsProductDensity`, built on `factorialMomentMeasure` and
  `factorialMeasure`, SpatialPointProcessFoundations §§4.1–4.2). Route: the window form of
  product densities (SpatialPointProcessFoundations §4.2), whose hypothesis of finite integrals
  over compact boxes Kⁿ holds since Hadamard's inequality (1.1) bounds the integral by
  (∫_K K(x, x) dμ)ⁿ.

*Needs:* 1.1; SpatialPointProcessFoundations §§1.1, 2.1, 4.1–4.2.

**Checks.**

- n = 0: both sides of the defining identity are 1, the empty product and the measure of the
  single point of S⁰.
- For K = T/5 of 1.2, the second factorial moment measure computed from the law of the process
  equals the 2 × 2 determinant of K at every pair (i, j) with i ≠ j, to 10⁻¹⁶, and vanishes on
  the diagonal. The ordinary second moment measure E N ⊗ N instead has mass K(i, i) = 0.4 on the
  diagonal point (i, i), so it is not the right measure to compare with det[K(xᵢ, xⱼ)] (negative
  control).
- K = 0 is the kernel of the empty process, and of no other process.
- One-point space, μ the unit mass, K = 2 (negative control). The two-point determinant is
  det[[2, 2], [2, 2]] = 0, so E N(N − 1) = 0 and N ≤ 1 a.s., while E N = 2. No process has this
  kernel, although its determinants are nonnegative; Layer 5 excludes it by its eigenvalue 2 > 1.

### 2.2 Simplicity, intensity and pair correlation

- **The intensity is K(x, x) μ(dx)** (`intensity_eq_withDensity`; HKPV (1.2.2), p. 8; LMR (2.2),
  p. 857). Route: the case n = 1 on bounded windows, and σ-additivity, since S is a countable
  union of bounded windows.
- **A determinantal point process is simple** (`ae_isSimple`; BBK Lemma 5.1.4, p. 228), for an
  a.e. positive semidefinite kernel with locally integrable diagonal. The kernel determinant
  vanishes when two points coincide (1.1). So the second factorial moment measure gives the
  diagonal of S × S no mass. This needs approximation of the diagonal by unions Bᵢ × Bᵢ over finer
  partitions, with finiteness from 2.4. The argument holds at atoms of μ as well.
- **The pair correlation function** is g(x, y) = 1 − |K(x, y)|²/(K(x, x) K(y, y)) ≤ 1 where
  K(x, x) K(y, y) > 0 (LMR (2.3), p. 857): this is `pairCorrelation_determinantal` (1.2) read
  through the case n = 2 of the definition. Determinantal processes are therefore repulsive at
  second order.

*Needs:* 1.1–1.2, 2.1.

**Checks.**

- Poisson kernel 1{x = y} with Lebesgue μ: the intensity is μ and g = 1 off the diagonal.
- Rank-one projection vv* with v = (1, 1, 1)/√3 on three points: every 2 × 2 kernel determinant
  is 1/9 − 1/9 = 0, so the process has no pairs of points, and its intensity has total mass
  trace = 1.

### 2.3 Change of measure, gauge, indistinguishable kernels, restriction and thinning

- **Change of reference measure** (`isDeterminantal_withDensity_iff`; HKPV §4.2, observation
  (4), pp. 48–49, for f > 0). For measurable f : S → ℝ≥0 and measurable K, N is determinantal
  with kernel K with respect to fμ iff it is determinantal with kernel √f(x) K(x, y) √f(y) with
  respect to μ.
  Route: 1.2 and the density of (fμ)ⁿ with respect to μⁿ.
- **Gauge invariance** (`isDeterminantal_gauge_iff`). For a measurable nowhere-zero h, the
  kernels h(x) K(x, y) h(y)⁻¹ and K define the same processes. Route: `det_kernelMatrix_gauge`
  (1.2) under the integrals. For Hermitian K the gauged kernel is Hermitian exactly when
  |h(x)| = |h(y)| at every pair with K(x, y) ≠ 0, for instance when |h| is constant.
- **Indistinguishable kernels define the same processes** (`isDeterminantal_congr`; BBK
  Definition 5.1.8, p. 230, and Proposition 5.1.11, p. 231). The kernels must be measurable, agree
  μ ⊗ μ-a.e., and agree on the diagonal μ-a.e. Route: for i ≠ j the pair (xᵢ, xⱼ) has law μ ⊗ μ
  under μⁿ, and the diagonal entries are values at single points.
- **Restriction** (`isDeterminantal_restrict`; HKPV Remark 4.2.5, p. 52; BBK Lemma 5.1.5,
  p. 229). The restriction of a determinantal process to a measurable set D, by
  `PointMeasure.restrict` (SpatialPointProcessFoundations §1.3), is determinantal with the same
  kernel with respect to μ restricted to D. Route: the count of the restriction on B is the count
  of N on B ∩ D, the sets B ∩ D are again disjoint bounded windows, and `(μ|D)ⁿ` on
  `∏ B (c i)` is μⁿ on `∏ (B (c i) ∩ D)`.
- **Thinning** (`isProductDensity_thinning`; BBK Lemma 5.1.3, p. 228). Let the kernel be a.e.
  positive semidefinite with locally integrable diagonal, and let M be a marking of N by a
  Bool-valued Markov kernel κ (`IsMarking`, SpatialPointProcessFoundations §6.2), with retention
  probability p(x) = κ(x, {true}). Then for every n the retained random measure has the n-th
  product density ofReal(det[√p(xᵢ) K(xᵢ, xⱼ) √p(xⱼ)]) with respect to μ. So the thinning is
  determinantal with kernel √p(x) K(x, y) √p(y) in the product-density form of 2.1; it is a
  random measure, not a map into point measures, which is why the statement is in that form.
  Route: the factorial moment measures of the thinning are ∏ᵢ p(xᵢ) times those of N
  (SpatialPointProcessFoundations §6.3), then 2.1 and `det_kernelMatrix_mul_sqrt`. Combined with
  restriction, the thinning by 1_D is the restriction.

*Needs:* 1.2, 2.1; SpatialPointProcessFoundations §§1.3, 6.2–6.3.

**Checks.**

- Indistinguishability (negative control). The kernels 1{x = y} and 0 agree Lebesgue ⊗
  Lebesgue-a.e. on ℝ but differ on the whole diagonal. The first is the kernel of the unit-rate
  Poisson process and the second of the empty process. So the diagonal hypothesis of
  `isDeterminantal_congr` cannot be dropped.
- Change of measure with constant f = 1/2: the kernel √f K √f = K/2 has n-th determinants
  2⁻ⁿ det K, matching (μ/2)ⁿ = 2⁻ⁿ μⁿ.
- Thinning with constant p of the rank-one projection gives the kernel p φ ⊗ conj φ, the
  Bernoulli(p) count (4.2).
- Restriction of the process of K = T/5 (1.2) to D = {0, 1}: the law of N restricted to D,
  computed from the full law, agrees with the process of kernel K_D on D to 10⁻¹⁶, and
  P(N(D) = 0) = det(I − K_D) = 0.32.
- Thinning of the process of K = T/5 with retention p = (0.3, 0.7, 0.5, 0.9): the thinned law,
  computed by thinning the full law, has inclusion probabilities det[√p K √p]_A on every A, to
  3·10⁻¹⁶.

### 2.4 The Poisson process, moments and uniqueness

- **The Poisson process is determinantal** (`isDeterminantal_poisson_iff`; BBK Example 5.1.6,
  pp. 229–230). For diffuse μ, finite on compact sets, N is determinantal with kernel 1{x = y}
  iff N is a Poisson process with intensity μ (`IsPoissonPointProcess`,
  SpatialPointProcessFoundations §5.1). The backward direction holds because the factorial moment
  measures of the Poisson process are μⁿ (SpatialPointProcessFoundations §5.3). The forward
  direction is uniqueness, below, against the Poisson law on point measures of
  SpatialPointProcessFoundations §5.1; the Poisson property depends only on the law, its clause on
  sets of infinite intensity included.
- **Domination by Poisson moments** (`lintegral_factorialCountMoment_le_prod`; BBK
  Proposition 5.1.20(ii), p. 235, and Corollary 5.1.21, p. 236). For an a.e. positive
  semidefinite kernel the factorial count moments are at most `∏ᵢ ∫_{B (c i)} K(x, x) dμ`, which
  are the factorial moments of the Poisson process with the same intensity. Route: Hadamard
  (1.1) under the integral.
- **Exponential moments and tails** (`exponential_tail_determinantal`; BBK Corollary 5.1.14,
  p. 233; HKPV Lemma 4.2.6, (4.2.13), p. 52). Assume in addition a locally integrable diagonal.
  On a bounded window W, `E (1 + s)^N(W) ≤ exp(s ∫_W K(x, x) dμ)` for every s ≥ 0. Also
  `P(N(W) > k) ≤ C e^(−ck)` for some c > 0. Route: expand (1 + s)^N in falling factorials and
  apply the domination; the tail is Markov's inequality at s = 1.
- **Uniqueness of the law** (`map_eq_map_of_isDeterminantal`; HKPV Lemma 4.2.6, pp. 52–53; BBK
  Corollary 5.1.14, p. 233). Two determinantal processes with the same a.e. positive semidefinite
  kernel with locally integrable diagonal have the same law. Route: by 2.1 both have the product
  densities ofReal(det[K(xᵢ, xⱼ)]), hence the same factorial moment measures, and the exponential
  moments above give the hypothesis of moment determinacy (HKPV Remark 1.2.4, p. 9;
  SpatialPointProcessFoundations §4.2).
- **The void probability series** (`void_probability_eq_tsum`; BBK Corollary 5.1.19(iii),
  p. 235). For an a.e. positive semidefinite kernel with locally integrable diagonal and a
  bounded window W, `P(N(W) = 0) = ∑ₙ ((−1)ⁿ/n!) ∫_{Wⁿ} det[K(xᵢ, xⱼ)] dμⁿ`, with absolute
  convergence from domination. For continuous kernels the right side is the Fredholm
  determinant det(I − K_W) of RandomMatrices 8.3.

*Needs:* 1.1, 2.1–2.3; SpatialPointProcessFoundations §§4.2, 5.1 and 5.3.

**Checks.**

- Poisson: for μ(W) = 1 the series is ∑ (−1)ⁿ/n! = e⁻¹, the Poisson void probability.
- For λ = (0.9, 0.5, 0.2) (4.2), E 2ᴺ = 3.42 ≤ exp(1.6) = 4.953.
- Poisson with μ(W) = 1: `E 2^N(W) = e = exp(∫_W K(x, x) dμ)`, so the exponential bound is
  attained.

## Layer 3: spectral kernels and integral operators

### 3.1 Integral operators

- `HasIntegralKernel T K` says that T, a bounded operator on L²(ν), acts as
  (Tf)(x) = ∫ K(x, y) f(y) dν(y) for every f and ν-a.e. x, the integrand being integrable for
  those x.
- **Square-integrable kernels have integral operators, which are unique**
  (`existsUnique_hasIntegralKernel`). For a σ-finite measure ν and K ∈ L²(ν ⊗ ν), there is
  exactly one such T. Route: Cauchy–Schwarz gives ‖Tf‖ ≤ ‖K‖₂ ‖f‖₂; uniqueness is a.e. uniqueness of
  the integrals. T is Hilbert–Schmidt (OperatorIdeals OI-B32), hence compact (OI-C14).

*Needs:* Mathlib `MeasureTheory.Lp`; OperatorIdeals OI-B32 and OI-C14.

**Checks.**

- The kernel 1{x = y} on [0, 1] with Lebesgue measure is 0 in L²(ν ⊗ ν) and has integral
  operator 0.
- A rank-one kernel λ φ(x) conj φ(y) with ‖φ‖ = 1 has the operator λ ⟪φ, ·⟫ φ, with norm |λ|.
- Integrability clause. For K(x, y) = 1/|x − y| on [0, 1] and f = 1 the integrand K(x, ·) f
  is non-integrable at every x. Without the clause, the defining equation would read
  (Tf)(x) = 0 at every x for that f, a constraint produced by the junk value 0 of the Bochner
  integral and not by K. For f the indicator of [0, 1/2] and x = 3/4 the integral is
  log(x/(x − 1/2)) = log 3 = 1.098612, so the clause holds there.

### 3.2 Spectral forms

- `SpectralForm K μ W` holds a spectral form of K on the window W. It consists of eigenvalues
  λₖ ≥ 0 with ∑ λₖ < ∞, measurable eigenfunctions φₖ in L²(μ|W) that are orthonormal where
  λₖ ≠ 0, and a carrier D ⊆ W with μ(W \ D) = 0, such that K(x, y) = ∑ λₖ φₖ(x) conj φₖ(y) for
  all x, y ∈ D. `IsSpectralKernel K μ` asks for a spectral form on every bounded window. This is
  HKPV Assumption 4.2.3 (p. 51) with the version (4.2.12) (p. 52) built in. On each window the
  kernel is Hermitian, its operator is positive and trace class, and it equals its spectral
  version including on the diagonal. It is BBK's local regularity in the trace-class case
  (Definitions 5.2.10–5.2.11, pp. 244–245).
- **The canonical version of a kernel** (`exists_ae_eq_spectralForm`; HKPV Lemma 4.2.2, p. 50; BBK
  Proposition 5.2.9, p. 243). Let μ be σ-finite, W measurable, and let K be a measurable kernel
  with an integral operator on L²(μ|W) that is positive and trace class, with finite nuclear gauge
  `ContinuousLinearMap.nuclearENorm`. Then there is a measurable kernel that agrees with K
  μ|W ⊗ μ|W-a.e. and has a spectral form on W. Route: the spectral theorem for
  compact self-adjoint operators (Mathlib) and summability of the eigenvalues, from the nuclear
  gauge (OI-B29). The series converges for μ-a.e. x in L² in y, and a subsequence argument as in
  HKPV gives pointwise convergence on a carrier. The version is one for the window W; a single
  version for all windows at once is not a target of this roadmap (Beyond), and the theorems
  below that need one assume a spectral kernel. Measurability of K is needed: under the
  continuum hypothesis, a well-ordering of [0, 1] of type ω₁ gives a non-measurable K, with
  K(x, y) = 1 when y precedes x, whose sections vanish off countable sets, so the operator 0 has
  kernel K, while no measurable kernel agrees with K almost everywhere, by Tonelli.
- **The integral operator of a spectral form** (`SpectralForm.integralOperator`; HKPV (4.2.12),
  p. 52). If T has kernel K on L²(μ|W), then:
  - T is positive;
  - its nuclear gauge is ∑ λₖ, which equals ∫_W K(x, x) dμ;
  - its spectrum lies in [0, 1] iff every λₖ ≤ 1.

  Route: T = ∑ λₖ ⟪φₖ, ·⟫ φₖ; the diagonal identity is monotone convergence on the carrier.
- **Spectral kernels satisfy the hypotheses of Layer 2** (`IsSpectralKernel.isAEPSDKernel`).
  They have a locally integrable diagonal and a.e. positive semidefinite kernel matrices. Route:
  exhaust S by countably many windows. A.e. tuple then lies in one carrier, where each kernel
  matrix is a sum of positive semidefinite rank-one matrices.

*Needs:* 3.1; OperatorIdeals OI-B29 (`ContinuousLinearMap.nuclearENorm`) and OI-B30 (the
trace-class ideal); Mathlib's spectral theorem for compact self-adjoint operators and
`spectrum`.

**Checks.**

- The kernel 1{x = y} with Lebesgue measure on [0, 1] (negative control). Its operator is 0, so
  every spectral form of a kernel equal to it a.e. has all λₖ = 0 and diagonal 0. But
  ∫ K(x, x) dx over [0, 1] is 1 ≠ 0. So 1{x = y} is not a spectral kernel, though its kernel
  matrices are positive semidefinite. The trace identity detects the wrong diagonal.
- On a finite set with counting measure, a positive semidefinite matrix K is a spectral kernel,
  with its eigen-decomposition as spectral form and all of S as carrier.
- For K = 0.95 · uu*/|u|² on a finite set, the nuclear gauge is 0.95 and the spectrum is {0, 0.95}.

### 3.3 Continuous kernels

- **Continuous kernels are spectral kernels** (`isSpectralKernel_of_continuous`). A continuous
  positive semidefinite kernel (hence Hermitian), with μ σ-finite and finite on compact sets, is
  a spectral kernel. On a bounded window W the carrier is W ∩ supp(μ|W), the window intersected
  with the support of μ restricted to W. It has full measure in W, since S is second countable.
  Route: Mercer's theorem on the compact set supp(μ|W) with the finite measure μ|W
  (RandomMatrices 8.3, AGZ Lemma 4.2.13). Its eigen-expansion converges uniformly there. The
  carrier W ∩ supp μ would not do (negative control): on ℝ with Lebesgue measure,
  W = {0} ∪ [1, 2] and K(x, y) = max(0, 1 − |x − y|), an expansion valid at 0 would give
  ∑ λₖ |φₖ(0)|² = 0, since K(0, ·) = 0 on [1, 2], while K(0, 0) = 1.
- BBK Corollary 5.2.18 (p. 248) is the resulting existence statement for continuous kernels.
  Hence every accepted kernel of RandomMatrices 8.3 has a determinantal point process (Layer 5).
  For pairwise disjoint bounded windows, the joint law of its counts is a joint count law of
  that kernel in RandomMatrices' sense, by 2.4 and the identities of RandomMatrices 8.3.

*Needs:* 3.2; RandomMatrices 8.3.

**Checks.**

- On a finite set with counting measure every point has positive mass, so supp(μ|W) = W and the
  carrier is the whole window, as in the second Check of 3.2.
- If μ(W) = 0, then supp(μ|W) is empty, and the spectral form with all λₖ = 0 and empty carrier
  satisfies the definition.

## Layer 4: projection kernels and Bernoulli mixtures

### 4.1 Projection processes

- `IsOrthonormalOn φ I μ` asks that the φₖ with k ∈ I be measurable and orthonormal in L²(μ);
  nothing is asked of the others. `projectionKernel φ J` is `∑_{k∈J} φₖ(x) conj φₖ(y)`, for a
  finite set J of indices.
- **Finite projection processes exist** (`exists_isDeterminantal_projectionKernel`; HKPV
  Lemma 4.5.1, p. 65). For φₖ, k ∈ J, orthonormal, the kernel `projectionKernel φ J` is the
  kernel of a determinantal law on point measures. Route: the density
  `(1/n!) |det[φ_{jₗ}(xᵢ)]|²` on Sⁿ, n = |J|, is a probability density by 1.4 and orthonormality.
  Its image under the map from tuples to their point measures (SpatialPointProcessFoundations
  §1.3) is the required law, with correlation functions given by integrating out coordinates
  (HKPV Exercise 4.5.2, p. 66).
- **A rank-n projection process has exactly n points** (`count_univ_projectionKernel`; HKPV
  Lemma 4.4.1, p. 63). For φₖ, k ∈ J, orthonormal and n = |J|, N(S) = n a.s. Route:
  E N(S) = ∫ K(x, x) dμ = n. Also `∫ ρ_(n+1) = 0`, since the rank of K is n, and
  Var N(S) = n − ∫∫ |K|² = 0.

*Needs:* 1.4, 2.1–2.4.

**Checks.**

- n = 1: a single point with density |φ(x)|². The 2 × 2 determinants vanish, as in 2.2.
- On three points with counting measure, a rank-one projection has trace 1 and vanishing 2 × 2
  minors.

### 4.2 Bernoulli mixtures and counts

- `bernoulliWeight lam J` is `∏_{k∈J} λₖ ∏_{k∉J} (1 − λₖ)`.
- **The Bernoulli mixture of projection processes** (`isDeterminantal_mixture`; HKPV
  Theorem 4.5.3, p. 67; BBK Theorem 5.2.5, p. 239). Let λₖ ∈ [0, 1] with ∑ λₖ < ∞, let the φₖ
  with λₖ ≠ 0 be orthonormal, and let K be measurable with K(x, y) = ∑ λₖ φₖ(x) conj φₖ(y) for
  all x, y in a set D of full μ-measure. For each finite J ⊆ {k : λₖ ≠ 0} let L_J be a projection
  law of kernel `projectionKernel φ J` (4.1); for the other J, L_J is any probability law, and
  its weight is 0. Then the mixture of the L_J with weights `bernoulliWeight lam J` is a
  probability law on configurations, and it is determinantal with kernel K. Choose
  eigenfunctions by independent Bernoulli(λₖ) coins, which almost surely select finitely many,
  then draw the projection process of the chosen ones. Route: the weights sum to 1 since
  ∑ λₖ < ∞; on Dⁿ the expectation of the projection determinant over the coins is det K, by 1.4
  and independence, and Dⁿ has full μⁿ-measure.
- **The count on a window is a sum of independent Bernoulli variables** (`count_determinantal`;
  HKPV Theorem 4.5.3, p. 67; LMR Theorem 2 and (2.10), p. 859). Let K have a spectral form on a
  bounded window W with eigenvalues λₖ, for a determinantal process N with kernel K. Then:
  - every λₖ is at most 1;
  - N(W) has generating function `E z^N(W) = ∏ (1 − λₖ + λₖ z)` on [0, 1];
  - its mean is ∑ λₖ;
  - its variance is ∑ λₖ (1 − λₖ);
  - its void probability is ∏ (1 − λₖ).

  Route, which does not use the mixture: the restriction to W (2.3) is determinantal with
  respect to μ|W, where the spectral form gives the hypotheses of 2.4 (as in 3.2). By the
  exponential moments of 2.4, `E z^N(W) = ∑ₙ ((z − 1)ⁿ/n!) ∫_{Wⁿ} det[K(xᵢ, xⱼ)] dμⁿ`. On the
  carrier, 1.4 in the limit of finite rank and orthonormality give
  `(1/n!) ∫_{Wⁿ} det[K(xᵢ, xⱼ)] dμⁿ = eₙ(λ)`, the n-th elementary symmetric function of the λₖ, so
  `E z^N(W) = ∏ (1 + (z − 1) λₖ)`. If some λₖ > 1, this vanishes at z = 1 − 1/λₖ ∈ (0, 1),
  while the generating function of a law on ℕ is positive on (0, 1); so every λₖ ≤ 1. Mean,
  variance and void probability are read off at z = 1 and z = 0. For a continuous kernel the
  generating function is RandomMatrices 8.3's one-set count law.
- **Central limit theorem for counts** (HKPV Theorem 4.6.1, p. 72). If Var N(Wₙ) → ∞ along
  windows Wₙ, then (N(Wₙ) − E N(Wₙ))/√Var N(Wₙ) tends to N(0, 1) in law. Route: by
  `count_determinantal` this is the central limit theorem for sums of independent Bernoulli
  variables, which RandomMatrices 8.3 proves (AGZ Theorem 4.2.25).

*Needs:* 1.4, 2.3–2.4, 3.2, 4.1; RandomMatrices 8.3.

**Checks.**

- For K = T/5 of 1.2, (1/n!) ∫ det K over ordered n-tuples equals eₙ of the eigenvalues for
  n = 1, …, 4 (1.6, 0.84, 0.16, 0.008), and at z = 0.3 both sides of the generating function are
  0.238641.
- A rank-2 kernel on a 4-point space: K = 0.7 h₁h₁* + 0.4 h₂h₂* with h₁ = (1, 1, 1, 1)/2 and
  h₂ = (1, −1, 1, −1)/2, eigenvalues (0.7, 0.4, 0, 0). The mixture over the subsets of the two
  indices of nonzero eigenvalue is a probability law (total 1 to 10⁻¹⁵) with inclusion
  probabilities det K_A, to 2·10⁻¹⁶. An ℕ-indexed family orthonormal at every index
  does not exist in the 4-dimensional L² (negative control), which is why orthonormality is
  asked only where λₖ ≠ 0.
- λ = (0.9, 0.5, 0.2): the count law is (0.04, 0.41, 0.46, 0.09) on {0, 1, 2, 3}, with mean 1.6,
  variance 0.5 and void probability 0.04.
- For K = T/5 of 1.2: the mixture law of 4.2 and the Janossy formula of 4.3 agree on every
  subset (to 10⁻¹⁶), the probabilities sum to 1, and P(A ⊆ X) = det K_A on every A. The mean
  1.6 = tr K, the variance 0.72 = tr K − tr K², and the void probability 0.088 = det(I − K). The
  count law is (0.088, 0.368, 0.408, 0.128, 0.008) on {0, …, 4}.
- λ = 1 for every k ≤ n and 0 otherwise gives the projection process, with deterministic count n
  (4.1).

### 4.3 Janossy densities

- **Janossy densities** (BBK Theorem 5.2.17(ii), p. 248, with (5.2.13) of Theorem 5.2.16(iii),
  p. 247; LMR Theorem 4, (2.14), p. 860). On a bounded window W where every eigenvalue is
  below 1, the n-th Janossy measure of N in W has density (1/n!) det(I − K_W) det[K̃(xᵢ, xⱼ)]
  with respect to μⁿ on Wⁿ. Here K̃ = K_W (I − K_W)⁻¹ has eigenvalues λₖ/(1 − λₖ), and
  det(I − K_W) = ∏ (1 − λₖ). Janossy measures are those of SpatialPointProcessFoundations §4.3,
  normalized by 1/n! so that the n-th has total mass P(N(W) = n); the factor 1/n! of the
  density is that normalization. BBK gives the density, unnormalized, as the Bernoulli mixture
  of squared determinants `∑_{|J|=n} ∏_J λₖ ∏_{J^c} (1 − λₖ) |det φ_J|²`. Route: the mixture
  formula of 4.2 restricted to the event N(W) = n, which gives BBK's form, and the identity that
  this sum equals ∏ (1 − λₖ) · det[K̃], from 1.4 applied to K̃.

*Needs:* 4.2; SpatialPointProcessFoundations §4.3.

**Checks.**

- For K = T/5 of 1.2, the sum over all subsets A of det(I − K) det K̃_A is 1 to 10⁻¹⁵.
- Normalization (negative control). For K = T/5, the integral over ordered pairs W² of
  (1/2!) det(I − K) det K̃ is P(N(W) = 2) = 0.408; without the factor 1/2! it is 0.816, twice
  that. For n = 3 the integral without 1/3! is 0.768 = 6 · 0.128.

## Layer 5: existence

### 5.1 The Macchi–Soshnikov theorem

- **The Macchi–Soshnikov theorem** (`exists_isDeterminantal_iff`; HKPV Theorem 4.5.5, p. 68;
  BBK Theorem 5.2.17, p. 248; LMR Theorem 1, p. 858). Let K be a measurable spectral kernel.
  Then K is the kernel of a
  determinantal point process iff every eigenvalue of every spectral form on every bounded window
  is at most 1. The law is then unique (2.4). Sufficiency: on each window 4.2 gives the process
  with kernel K on W. The laws on an increasing sequence of windows are consistent by restriction
  and uniqueness, and the projective limit is a point process, since the counts generate the
  σ-algebra of point measures (SpatialPointProcessFoundations §1.2).
  Necessity is the first conclusion of `count_determinantal` (4.2), whose route uses only the
  factorial moments and the spectral form.
- **Operator form** (`exists_isDeterminantal_iff_spectrum`). Under the same hypotheses, the
  eigenvalue condition is equivalent to spectrum(T_W) ⊆ [0, 1] for the integral operator T_W on
  each bounded window. Route: `SpectralForm.integralOperator`.
- **Global form** (HKPV Theorem 4.5.5, p. 68). For a measurable spectral kernel whose integral
  operator T on L²(μ) is bounded and self-adjoint, the window condition is equivalent to
  0 ≤ T ≤ I on L²(μ). Route: each window operator is the compression 1_W T 1_W, and the
  compressions on an exhausting sequence converge strongly to T. The local-to-global step for
  0 ≤ T is BBK Lemma 5.2.12(ii), p. 245; the same limit of quadratic forms gives T ≤ I.

*Needs:* 2.3–2.4, 3.2, 4.1–4.2; SpatialPointProcessFoundations §1.2.

**Checks.**

- The one-point space with K = 2 (2.1) has eigenvalue 2 > 1, and indeed no process exists.
- A rank-one kernel λ φ ⊗ conj φ with ‖φ‖ = 1 gives Bernoulli(λ) for λ ≤ 1. For λ > 1 the would-be
  void probability is 1 − λ < 0.
- A spectrum above 1 need not make det(I − K) negative (negative control). On four points with
  counting measure, K = diag(1.5, 2, 0.5, 0.2) has two eigenvalues above 1 and
  det(I − K) = (−0.5)(−1)(0.5)(0.8) = 0.2 > 0. So the sign of the void probability does not
  replace the eigenvalue condition.
- The Poisson kernel 1{x = y} is not a spectral kernel (3.2), and Layer 5 says nothing about it;
  the Poisson process exists by SpatialPointProcessFoundations §5.1 and is determinantal by 2.4.

## Layer 6: Palm distributions

### 6.1 The reduced Palm kernel

- `IsReducedPalmKernel` is the reduced Palm kernel of SpatialPointProcessFoundations §3.2: a
  Markov kernel κ into measures with E ∫ g(x, N − δₓ) N(dx) = ∫∫ g(x, ν) κ(x, dν) Λ(dx) for every
  measurable g ≥ 0, where Λ is the intensity. Here it is applied to a kernel Q into point
  measures, through its image in measures.
- **The reduced Palm distributions are determinantal with the Schur-complement kernel**
  (`exists_isReducedPalmKernel_determinantal`; BBK Theorem 5.5.2, p. 273). Let the kernel be a.e.
  positive semidefinite with locally integrable diagonal. Then there is a Markov kernel Q into
  point measures whose image in measures is a reduced Palm kernel of N, and whose value at Λ-a.e.
  u is determinantal with kernel K^u = `reducedKernel K u`. Route: a reduced Palm kernel exists
  by disintegration of the Campbell measure (SpatialPointProcessFoundations §3.2) and takes
  point-measure values Λ-a.e. Its window form (SpatialPointProcessFoundations §3.2) and the
  determinantal identity of order n + 1 give, for a countable generating family of windows and
  Λ-a.e. u, the factorial moments of Q(u) as the integrals of det[K^u(xᵢ, xⱼ)]: the determinant
  of order n + 1 at (u, x) is K(u, u) det[K^u(xᵢ, xⱼ)] (1.3), and Λ has density K(u, u). K^u
  is positive semidefinite by 1.3, so 2.1 and 2.4 extend this to all windows and fix the law.

*Needs:* 1.3, 2.1–2.4; SpatialPointProcessFoundations §3.2.

**Checks.**

- Poisson: K^u(x, y) = 1{x = y} − 1{x = u} 1{u = y} agrees with 1{x = y} except at x = y = u, a
  null diagonal point for diffuse μ. This is Slivnyak's theorem.
- Rank-one projection: K^u = 0, so the Palm process given a point at u is empty, as it must be
  for a process with exactly one point.
- For K = T/5 of 1.2 and u = 0, K^u is the positive semidefinite matrix of the Check of 1.3.
- On the process of K = T/5, the conditional law of N − δ_u given a point at u = 0 has inclusion
  probabilities det K^u_B on every B ⊆ {1, 2, 3}, to 2·10⁻¹⁶, and the point u is present with
  probability K(u, u) = 0.4.

## Layer 7: stationary determinantal point processes on ℝ^d

### 7.1 Stationary kernels

- `stationaryKernel C₀` is the kernel C₀(x − y) on `E d`, Euclidean d-space
  (SpatialPointProcessFoundations §7.1), with Lebesgue measure. C₀ is the covariance function.
- **The intensity** (`intensity_stationary`; LMR (3.1), p. 861) is C₀(0) times Lebesgue
  measure. Route: 2.2.
- **Stationarity** (`isStationary_iff_det_kernelMatrix_add`; BBK Proposition 5.6.1, p. 275; LMR
  (3.1), p. 861). Assume an a.e. positive semidefinite kernel with locally integrable diagonal. A
  determinantal process on ℝ^d is stationary iff for every n and t its kernel determinants are
  invariant under the shift of every point by t, Lebesgue-a.e. In particular a stationary kernel
  gives a stationary process. Stationarity is `IsStationary`, invariance of the law under the
  translation action of SpatialPointProcessFoundations §7.1. Route: the shifted process is
  determinantal with the shifted kernel, by translation invariance of Lebesgue measure; then
  uniqueness (2.4) in one direction, and in the other the equality of the integrals of the two
  determinants over all products of windows.

*Needs:* 2.2, 2.4; SpatialPointProcessFoundations §7.1.

**Checks.**

- The pair correlation of a stationary kernel is g(x, y) = 1 − |C₀(x − y)|²/C₀(0)², by the
  definition of `pairCorrelation` (1.2).
- The gauge kernel (1/2)(1 + x²)(1 + y²)⁻¹ exp(−(x − y)²) on ℝ is the gauge of the Gaussian
  model with ρ = 1/2 and α = 1 (7.3), which exists since 1/2 ≤ 1/√π = 0.5642. It is not
  translation invariant: at (0.1, −0.8) it is 0.136984 and after the shift t = 0.37 it is
  0.229187. Its 3 × 3 determinants are invariant (0.0935476353 at (0.1, −0.8, 1.3) and after
  the shift), so the criterion asks for invariant determinants, not an invariant kernel.
- Negative control: the kernel f(x) 1{x = y} with f(x) = 1 + x² is the Poisson process of
  intensity f (2.3, change of measure). Its one-point determinant f is 1.01 at 0.1 and 1.2209 at
  0.47, so the process is not stationary.

### 7.2 The spectral condition

- **The spectral condition for existence** (`exists_isDeterminantal_stationary_iff`; LMR
  Proposition 1, (3.3), p. 861; BBK Theorem 5.6.8, p. 279). Let C₀ be continuous and square
  integrable with C₀(x − y) positive semidefinite. Then a determinantal process with kernel
  C₀(x − y) exists iff its spectral density φ = 𝓕C₀, in L², satisfies φ ≤ 1 a.e. Route: on a
  window W the integral operator is the compression of convolution by C₀. Convolution is unitarily
  equivalent to multiplication by φ (Mathlib's L² Fourier transform), and φ ≥ 0 by positive
  semidefiniteness. So all window spectra lie in [0, 1] iff 0 ≤ φ ≤ 1. Continuity makes the kernel
  spectral (3.3), and Layer 5 applies.
- **Spectral construction** (`exists_isDeterminantal_of_spectralDensity`; LMR Corollary 1,
  p. 862; BBK Proposition 5.6.13, p. 282). An integrable φ with values in [0, 1] has a continuous,
  square-integrable, positive semidefinite inverse Fourier transform C₀ = 𝓕⁻¹φ. Its stationary
  kernel is the kernel of a determinantal process, with intensity C₀(0) = ∫ φ times Lebesgue
  measure. Route: the easy direction of Tau Ceti's `TauCeti.bochner_posSemidef`, for the finite
  measure φ(ξ) dξ, and Plancherel, then the spectral condition and 7.1.

*Needs:* 3.3, Layer 5, 7.1; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`, Fourier inversion;
Tau Ceti `TauCeti.bochner_posSemidef`.

### 7.3 Parametric families

Each model has intensity ρ and scale α > 0, and the last three a shape ν > 0. In each case the
spectral density is largest at 0, which gives ρ_max; for ρ < 0 the one-point determinant ρ is
negative.

- `gaussianCovariance ρ α` is ρ exp(−(‖x‖/α)²).
- **The Gaussian spectral density** (`fourier_gaussianCovariance`; LMR Table 2, p. 863). It is
  ρ (√π α)^d exp(−(πα‖ξ‖)²). Route: Mathlib's `fourier_gaussian_innerProductSpace` with
  b = α⁻².
- **The Gaussian model** (`exists_isDeterminantal_gaussian_iff`; LMR Table 2, p. 863; BBK
  Example 5.6.11, p. 281). It exists iff `0 ≤ ρ ≤ (√π α)^(−d)`.
- `cauchyCovariance ρ α ν` is `ρ (1 + (‖x‖/α)²)^(−ν−d/2)`.
- **The Cauchy model** (`exists_isDeterminantal_cauchy_iff`; LMR Table 2, p. 863; BBK
  Example 5.6.12, p. 282). It exists iff `0 ≤ ρ ≤ Γ(ν + d/2)/(Γ(ν) π^(d/2) α^d)`, for every
  ν > 0. Route: C₀ ≥ 0 is integrable, so `|φ(ξ)| ≤ φ(0) = ∫ C₀ = ρ π^(d/2) α^d Γ(ν)/Γ(ν + d/2)`,
  a Beta integral in polar coordinates. Positive semidefiniteness holds because `(1 + r²)^(−β)`
  is a scale mixture of Gaussians.
- `maternSpectralDensity ν α d` is SecondOrderRandomFields' Matérn spectral density (§4.1
  there), `Γ(ν + d/2)/(Γ(ν) π^(d/2)) α^d (1 + α²‖ω‖²)^(−ν−d/2)`, a probability density in the
  convention `e^(i⟨ω, h⟩)` of characteristic functions. In the convention `e^(−2πi⟨x, ξ⟩)` of
  Mathlib's Fourier transform the spectral density of the model is ρ (2π)^d times
  `maternSpectralDensity` ν α d at 2πξ, that is
  `ρ Γ(ν + d/2) (2√π α)^d / (Γ(ν) (1 + ‖2παξ‖²)^(ν+d/2))`, and the Whittle–Matérn covariance
  `maternCovariance ρ α ν` is its inverse Fourier transform.
- **The Whittle–Matérn covariance in Bessel form** (`maternCovariance_eq_maternCorrelation`; LMR
  Table 2, p. 863). For α, ν > 0, `maternCovariance ρ α ν` at x is
  `ρ 2^(1−ν)/Γ(ν) · ‖x/α‖^ν K_ν(‖x/α‖)`, that is ρ times `maternCorrelation` ν α at ‖x‖, the
  Matérn correlation of SecondOrderRandomFields §4.1. There K_ν is `positiveAxisBesselK`, the
  K-Bessel kernel of AnalyticNumberTheoryPartI §2.1a. Route: SecondOrderRandomFields §4.1
  identifies `φ_ν,α(‖h‖)` as the characteristic function of the Matérn spectral density; the
  change of variables ω = 2πξ turns it into the inverse Fourier transform above.
- **The Whittle–Matérn model** (`exists_isDeterminantal_matern_iff`; LMR Table 2, p. 863).
  C₀(0) = ρ, and the model exists iff 0 ≤ ρ ≤ Γ(ν)/(Γ(ν + d/2) (2√π α)^d). Route: spectral
  construction (7.2); ∫ φ = ρ by a Beta integral.
- `powerExponentialSpectralDensity ρ α ν` is
  `ρ Γ(d/2 + 1) α^d/(π^(d/2) Γ(d/ν + 1)) exp(−(α‖ξ‖)^ν)`, and `powerExponentialCovariance ρ α ν`
  is its inverse Fourier transform.
- **The power exponential model** (`exists_isDeterminantal_powerExponential_iff`; LMR (3.7),
  p. 863). C₀(0) = ρ, and the model exists iff `0 ≤ ρ ≤ π^(d/2) Γ(d/ν + 1)/(Γ(d/2 + 1) α^d)`.
  Route: spectral construction; `∫ exp(−(α‖ξ‖)^ν) dξ = 2π^(d/2) Γ(d/ν)/(ν Γ(d/2) α^d)`.

*Needs:* 7.1–7.2; Mathlib `fourier_gaussian_innerProductSpace`, `Real.Gamma`;
SecondOrderRandomFields §4.1 for the Matérn spectral density, the Matérn correlation and its
characteristic-function identity.

**Checks.**

- Gaussian, d = 1, α = 0.7: numerical φ(0) = 1.240718 = √π α. For d = 2 and |ξ| = 0.4 the
  radial integral is 0.710066, matching the closed form.
- Gaussian, d = 2, α = 0.05: ρ_max = (√π α)⁻² = 127.324, and g(α) = 1 − e⁻² = 0.864665.
- Whittle–Matérn, d = 1, ν = 1.5, α = 0.7: numerical ∫ C₀ = 2.8, matching
  Γ(ν + 1/2) 2√π α/Γ(ν). In d = 1, ρ_max α = Γ(ν)/(2√π Γ(ν + 1/2)) = 0.25. In d = 2 the spectral
  density integrates to ρ (1.000000) for ν = 0.5 and 2.
- Bessel form, d = 1, ρ = 1.3, α = 0.7: the numerical inverse Fourier transform equals
  `ρ φ_ν,α(|x|)` at x = 0, 0.5, 1.4 for ν = 1.2 and 1.5 to 10⁻⁶ (1.090979 at ν = 1.5, x = 0.5,
  which is `ρ (1 + x/α) e^(−x/α)`), and for ν = 0.5 to 2·10⁻⁵, the slow tail limiting the
  quadrature.
- Whittle–Matérn convention: ρ (2π)^d times `maternSpectralDensity` ν α d at 2πξ agrees with the
  closed form `ρ Γ(ν + d/2) (2√π α)^d / (Γ(ν) (1 + ‖2παξ‖²)^(ν+d/2))` to a relative 2 · 10⁻¹⁵ for
  d = 1, 2, 3, ν = 0.5, 1.5, 2 and α = 0.3, 0.7. Negative control: reading
  `maternSpectralDensity` ν α d at ξ directly as the density of Mathlib's convention would give
  ρ_max = 2.243995 at d = 1, ν = 1.5, α = 0.7, not 0.25/α = 0.357143.
- Cauchy, d = 1, α = 0.7: φ(0) = 1.099557 for ν = 1.5 and 2.199115 for ν = 0.5, both matching the
  closed form. BBK states the Fourier formula for η < d/2 only; both cases have ν ≥ d/2, so the
  formula holds beyond that range. In d = 2, ν = 1.5: ∫ C₀ = 1.026254 and ρ_max = 0.974418.
- Power exponential, d = 1, α = 0.7: ∫ φ/ρ = 1.000000 for ν = 1, 2, 5, with ρ_max = 2.857143,
  2.532077 and 2.623339. For d = 2, ν = 0.5 and 2, the integral is 1.000000.
- ρ < 0 (negative control): the one-point determinant is ρ < 0, so no model exists, which is
  why each criterion includes 0 ≤ ρ.

## Downstream consumers

No roadmap on main or among the open pull requests consumes this one.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Kernel matrices.** Hadamard's inequality for positive semidefinite kernels, gauge and weight
   identities, the pair correlation bound, the Schur complement and the positivity of the reduced
   kernel, and the Cauchy–Binet expansion of finite-rank kernels.
2. **Determinantal point processes.** The count-form definition and its agreement with
   correlation functions; intensity, simplicity and pair correlation; change of reference
   measure, gauge invariance, indistinguishable kernels, restriction and thinning; the Poisson
   process as a determinantal process; domination by Poisson moments, exponential moments and
   tails, uniqueness of the law, and the void probability series.
3. **Spectral kernels.** Integral operators of square-integrable kernels; spectral forms on
   windows, the canonical version, the trace and spectrum of the window operators; spectral
   kernels satisfy the hypotheses of Layer 2; continuous kernels are spectral, with carrier the
   support of μ restricted to each window.
4. **Projections and mixtures.** Existence of finite projection processes and their
   deterministic count; the Bernoulli mixture representation; the count law on a window with its
   generating function, mean, variance and void probability; the central limit theorem for
   counts; the Janossy densities.
5. **Existence.** The Macchi–Soshnikov theorem in eigenvalue, window-operator and global forms.
6. **Palm distributions.** The Schur-complement kernel of the reduced Palm distributions.
7. **Stationary processes.** The intensity, the stationarity criterion, the
   spectral existence condition, the spectral construction, the Gaussian, Cauchy,
   Whittle–Matérn and power exponential models with their intensity bounds, and the Bessel form
   of the Whittle–Matérn covariance.

The numbers are those of the layers above, and k.n names subsection n of Layer k.

**Not owned here.** The following are used, not built:
- the configuration space `PointMeasure` with its counts, vague topology, Borel σ-algebra and
  restriction, the intensity, reduced Palm kernels and their window form, factorial powers,
  factorial count moments, factorial moment measures, product densities and their window form,
  Janossy measures, moment determinacy, the Poisson property and Poisson law, markings and
  independent thinning, the translation action and stationarity: SpatialPointProcessFoundations
  §§1.1–1.3, 2.1, 3.2, 4.1–4.3, 5.1, 5.3, 6.2–6.3 and 7.1;
- Mercer's theorem for continuous kernels, the trace functional, Fredholm determinants, joint
  count laws of accepted kernels and the central limit theorem for sums of independent Bernoulli
  variables: [RandomMatrices](../RandomMatrices/README.md) 8.3;
- the nuclear gauge, the trace-class ideal and the Hilbert–Schmidt operators with their
  compactness: [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) OI-B29, OI-B30,
  OI-B32 and OI-C14;
- the Matérn spectral density and correlation: SecondOrderRandomFields §4.1;
- the K-Bessel kernel K_ν: [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md)
  §2.1a, through SecondOrderRandomFields;
- Hadamard's inequality for Gram matrices, the expansion of the determinant of a product and
  Bochner's theorem: Tau Ceti; positive semidefinite matrices, the spectral theorem for compact
  self-adjoint operators, the Fourier transform on L² and the Gaussian Fourier transform: Mathlib.

**Scope boundaries.**
- Continuous-kernel determinantal processes on ℝ from random matrices, their scaling limits (sine,
  Airy) and Fredholm-determinant gap probabilities stay with RandomMatrices Layer 8. This roadmap
  shows only that its existence theorem covers their kernels (3.3).
- Statistical inference for determinantal models (likelihood, minimum contrast, simulation) is
  outside this roadmap.
- Bochner's theorem itself stays with Tau Ceti (`TauCeti.bochner_posSemidef`); 7.2 uses its easy
  direction.
- Non-Hermitian kernels, which occur for space-time processes, are excluded, as in HKPV
  Remark 4.2.4 (p. 52).

## Exact supplier contracts

### From SpatialPointProcessFoundations (spatial statistics family)

Consumed by name, as verbatim local copies in `Suggested.lean`:
- §1.1: `IsIntegerValued`, `LocallyFiniteMeasure`,
  `PointMeasure`, `PointMeasure.toLocallyFinite`, `PointMeasure.count` and
  `PointMeasure.IsSimple`;
- §1.2: the vague topology and the Borel σ-algebra on `PointMeasure`;
- §1.3: `PointMeasure.restrict`;
- §2.1: `intensity`;
- §3.2: `IsReducedPalmKernel`;
- §§4.1–4.2: `factorialMeasure`, `factorialCountMoment`, `factorialMomentMeasure` and
  `IsProductDensity`;
- §5.1: `IsPoissonRandomMeasure` (with the clause on sets of infinite intensity) and
  `IsPoissonPointProcess`;
- §6.2: `IsMarking`, with `markExponent` and `expNeg`;
- §7.1: `E`, the translation action on `PointMeasure` and `IsStationary`.

`IsIntegerValued`, `IsPoissonRandomMeasure` and `expNeg` are SpatialPointProcessFoundations'
copies of definitions of the Tau Ceti library at commit `d395922`; the pinned Tau Ceti does not
contain them.

Consumed in prose, as stated there:
- §1.2: the generation of the σ-algebra of point measures by counts;
- §1.3: the point measure of a finite tuple;
- §3.2: existence of a reduced Palm kernel by disintegration, and the window form of reduced Palm
  kernels on bounded windows;
- §4.2: the window form of product densities, and moment determinacy under exponential count
  moments;
- §4.3: Janossy measures with the 1/n! normalization;
- §5.1: existence of the Poisson law on point measures for a locally finite intensity;
- §5.3: the factorial moment measures μⁿ of the Poisson random measure;
- §6.3: the factorial moment measures of a thinning, ∏ᵢ p(xᵢ) times those of the process.

### From RandomMatrices

- 8.3: Mercer's theorem for continuous positive semidefinite Hermitian kernels on compact metric
  spaces (AGZ Lemma 4.2.13), accepted kernels and their joint count laws, the one-set count law
  ∏ (1 − λₖ + λₖ z), and the central limit theorem for counts (AGZ Theorem 4.2.25).

### From OperatorIdeals

- OI-B29: the nuclear gauge `ContinuousLinearMap.nuclearENorm`, finite exactly on nuclear
  operators.
- OI-B30: the trace-class ideal, whose members are the operators of finite nuclear gauge.
- OI-B32 and OI-C14: Hilbert–Schmidt operators and their compactness.

### From SecondOrderRandomFields (spatial statistics family)

- §4.1: `maternSpectralDensity` and `maternCorrelation`, as verbatim local copies, with its copy
  `positiveAxisBesselK` of the K-Bessel kernel of AnalyticNumberTheoryPartI §2.1a; and in prose
  its theorem that `φ_ν,θ(‖h‖)` is the characteristic function of the Matérn spectral measure,
  for the Whittle–Matérn model (7.3).

### From Tau Ceti and Mathlib

- Tau Ceti `Matrix.det_gram_le_prod_norm_sq` (Hadamard's inequality for Gram matrices),
  `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` (the expansion of the determinant of a product)
  and `TauCeti.bochner_posSemidef` (Bochner's theorem in kernel form, for 7.2).
- Mathlib `Matrix.PosSemidef`, `Matrix.PosSemidef.submatrix` and `Matrix.PosSemidef.det_nonneg`;
  `spectrum`;
  `MeasureTheory.Lp.fourierTransformₗᵢ`; `fourier_gaussian_innerProductSpace`; `Real.Gamma`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- Permanental and α-determinantal processes (BBK §5.3), with the Vere-Jones α-determinant.
- Determinantal processes on discrete spaces and uniform spanning trees, through the transfer
  current theorem.
- Zeros of Gaussian analytic functions, and the hyperbolic and Ginibre processes, as
  determinantal processes on the plane and the disc.
- Rigidity and number variance of stationary determinantal processes.
- A single canonical version of a kernel whose window operators are positive and trace class,
  valid on all windows at once (BBK's local regularity, Definitions 5.2.10–5.2.11), with the
  restriction and overlap lemmas for the window versions that its gluing needs.
- Simulation (HKPV Algorithm 4.4.2, p. 64) and the likelihood theory of determinantal models.

## Prior formalization

The [lean-MSSS](https://github.com/bjbraams/lean-MSSS) repository (commit 6826ba2) has a module
`MSSS/PointProcesses/Determinantal.lean`. Its carrier is a
point process given by an indicator sequence and a location sequence, through the factorial point
sums of `MSSS/PointProcesses/Basic.lean`; this roadmap uses the point measures of
SpatialPointProcessFoundations §1.1 instead. Proved there without `sorry`:
- 2.2: the intensity of a determinantal process (MSSS intensity_determinantal);
- 1.2: the 2 × 2 kernel determinant formula behind the pair correlation (MSSS
  pairCorrelation_determinantal);
- 2.3: thinning by uniform marks independent of the process (MSSS isDeterminantal_thinning), on
  an enumeration of the points rather than through the marking of SpatialPointProcessFoundations
  §6.2;
- 2.1: the first factorial point sum as the point sum (MSSS map_eval_factorialPointSum_one).

Stated there with `sorry`: uniqueness of the law, exponential tails, existence for continuous
Hermitian kernels in quadratic-form form, the Bernoulli mixture and the count law. The MSSS
definition includes simplicity, which here is a theorem (2.2). The map, which is not prescriptive,
lists the lean-MSSS files:

| Layer | lean-MSSS files |
|---|---|
| 1 | PointProcesses/Determinantal (the 2 × 2 determinant) |
| 2 | PointProcesses/Determinantal (definition, intensity, thinning), PointProcesses/Basic |

Related libraries: no Mathlib file or open Mathlib pull request concerns determinantal point
processes, integral operators of measurable kernels or the Macchi–Soshnikov theorem.

## References

The locators refer to these editions; page numbers are printed page numbers.

- F. Baccelli, B. Błaszczyszyn and M. Karray, *Random Measures, Point Processes, and Stochastic
  Geometry*, Inria, 2024 (hal-02460214v2).
- J. B. Hough, M. Krishnapur, Y. Peres and B. Virág, *Zeros of Gaussian Analytic Functions and
  Determinantal Point Processes*, University Lecture Series 51, American Mathematical Society,
  2009.
- F. Lavancier, J. Møller and E. Rubak, Determinantal point process models and statistical
  inference, *J. R. Stat. Soc. Ser. B* 77 (2015), 853–877. Numbering and pages are those of the
  journal version; the arXiv preprint 1205.4818 numbers its results by section.
- T. Shirai and Y. Takahashi, Random point fields associated with certain Fredholm determinants
  I: fermion, Poisson and boson point processes, *J. Funct. Anal.* 205 (2003), 414–463.
- A. Soshnikov, Determinantal random point fields, *Russian Math. Surveys* 55 (2000), 923–975.
- G. W. Anderson, A. Guionnet and O. Zeitouni, *An Introduction to Random Matrices*, Cambridge
  University Press, 2010 (cited through RandomMatrices 8.3).

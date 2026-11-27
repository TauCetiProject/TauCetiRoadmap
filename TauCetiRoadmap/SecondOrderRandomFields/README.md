# Roadmap: second-order random fields and covariance functions

**Summary.** This roadmap builds the second-order theory of random fields that spatial
statistics rests on:
- second-order and Gaussian fields on an arbitrary index set: every symmetric positive
  semidefinite kernel is the covariance of a Gaussian field, whose law is fixed by its mean and
  covariance; strict, second-order and intrinsic stationarity, and mean-square continuity;
- the spectral theory of stationary fields on `ℝ^d`: the spectral measure of a stationary
  covariance (Bochner's theorem read for fields), spectral densities of integrable covariances,
  the lattice form on `ℤ^d`, the spectral representation `Z(t) = ∫ e^{i⟨t, ω⟩} W(dω)` by an
  orthogonally scattered random measure, and mean-square differentiability, which holds `m` times
  exactly when the spectral moment of order `2m` is finite;
- isotropic correlation functions: Schoenberg's theorem that the isotropic correlations on
  `ℝ^d` are the mixtures of the characteristic function `Ω_d` of the uniform law on the sphere,
  with the strict nesting of the classes, strict positive definiteness, the sharp lower bounds,
  the Gaussian-mixture and completely monotone characterizations of the correlations valid in
  every dimension, Pólya's criterion and the truncated power functions;
- the Matérn family: its spectral density in every dimension, its closed forms at half-integer
  smoothness, its Gaussian limit, its small-lag behaviour and the mean-square smoothness of
  Matérn processes;
- variograms: the properties of the semivariogram of an intrinsically stationary field and the
  Schoenberg–von Neumann theorem, which identifies the continuous semivariograms with the
  conditionally negative definite functions and with the Lévy–Khintchine form;
- space–time covariances: the Cressie–Huang criterion and Gneiting's nonseparable construction;
- correlations on spheres: Schoenberg's Gegenbauer expansion on `S^d` and its power-series form
  on all spheres, the criteria for strict positive definiteness, and the passage from Euclidean to
  spherical correlations in chordal and in great-circle distance.

The material is the standard graduate content of Stein, Chilès–Delfiner, Gaetan–Guyon, the
Handbook of Spatial Statistics, Matérn, Adler–Taylor and Spodarev, and of Gneiting's papers on
space–time and spherical covariances (see [References](#references)); the roadmap is a synthesis
of these sources and follows none of them in its organization. Headlines that restate a source
result cite a theorem, definition, section or equation number with its printed page; corollaries
and adaptations carry a proof route.

The roadmap sits on Tau Ceti's harmonic analysis of positive definite functions: Bochner's
theorem, Herglotz's theorem and the Hausdorff–Bernstein–Widder theorem are supplied, and this
roadmap reads them for random fields. The modified Bessel function `K_ν` of the Matérn family
comes from AnalyticNumberTheoryPartI and its asymptotics from SpecialFunctionsBessel; the zonal
functions of the sphere, with the addition theorem and the Funk–Hecke formula behind Schoenberg's
theorem on spheres, come from the roadmaps on higher spheres and on Euclidean motion groups;
isonormal Gaussian processes come from WienerChaosAndMalliavinCalculus. The roadmap feeds the
spatial-statistics roadmaps on Gaussian suprema and excursion sets, on kriging and likelihood, on
equivalence of Gaussian measures, on Gaussian Markov random fields, on Cox processes, on
point-pattern statistics and on determinantal point processes (see
[Downstream consumers](#downstream-consumers)).

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the bullets without a Lean name are
definitions, results supplied by Mathlib, Tau Ceti or other roadmaps, or facts about a single
definition, and they are targets of the same standing, stated in prose.

Suggested home: `TauCeti/Probability/RandomField/` for Layers 1, 2 and 5,
`TauCeti/Analysis/PositiveDefinite/Isotropic/` for Layers 3, 4 and 6, and
`TauCeti/Analysis/PositiveDefinite/Sphere/` for Layer 7.

## How to read the build

Layer 1 is probability without topology: covariance kernels, Gaussian fields with a given
covariance, and the stationarity notions. Its 1.4 identifies the stationary covariances on an
additive group with the real positive definite functions, so that every subsequent layer may state
its results about positive definite functions and read them back as statements about fields.
Layer 2 adds the Fourier side on `ℝ^d`: Tau Ceti's Bochner theorem gives the spectral measure,
and the spectral representation and mean-square calculus are statements about the isometry
between `L²(F)` and the Gaussian space of the field.

Layers 3–7 are harmonic analysis of positive definite functions with symmetry. Layer 3 is the
rotation-invariant case: averaging the spectral measure over spheres turns Bochner's theorem
into Schoenberg's, and letting the dimension tend to infinity turns `Ω_d` into a Gaussian.
Layer 4 is one family of Layer 3 studied in depth, through its Gamma-mixture representation.
Layer 5 is the conditionally negative definite case, which is to positive definite functions
what generators are to semigroups: `γ` is a semivariogram exactly when every `e^{−tγ}` is a
correlation. Layer 6 treats product groups `ℝ^d × ℝ`, and Layer 7 the sphere, where the Fourier
transform is replaced by expansion in zonal polynomials; 7.4 compares Layers 3 and 7.

The layers are in build order: each layer needs only earlier layers and the suppliers. Layers 5,
6 and 7 depend on Layers 1–3 but not on each other.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`, with Mathlib's
  `ProbabilityTheory` and `MeasureTheory` opened. `Suggested.lean` states the prototypes in the
  namespace `TauCetiRoadmap.SecondOrderRandomFields`.
- **Random fields.** A random field on an index set `T` is a family `Z : T → Ω → ℝ` of real
  random variables on one probability space `(Ω, P)`; measurability of each `Z t` is a hypothesis
  where it is needed. Its law is `P.map (fun ω t ↦ Z t ω)` on `T → ℝ` with the product
  σ-algebra. Means are `P[Z t]`, covariances Mathlib's `cov[Z s, Z t; P]`, variances `Var[X; P]`.
  Complex-valued fields appear only through the spectral representation (2.2).
- **Kernels and positive definiteness.** A kernel `C : T → T → ℝ` is symmetric and positive
  semidefinite when `(Matrix.of C).PosSemidef`, which for an infinite `T` quantifies over finitely
  supported coefficient vectors. A function `F : G → ℂ` on an additive group is positive definite
  when Tau Ceti's `TauCeti.IsPositiveDefiniteSub F` holds:
  `∑_{i,j} cᵢ conj(cⱼ) F(vᵢ − vⱼ) ≥ 0`. A real function `C : G → ℝ` is positive definite when its
  coercion to `ℂ` is; such a `C` is even, since positive definiteness gives `F(−x) = conj F(x)`.
  Strict positive definiteness is `IsStrictlyPositiveDefiniteSub` (3.1).
- **Fourier conventions.** Spectral measures are on the angular-frequency side: the spectral
  measure of a covariance `C` on a finite-dimensional real inner-product space `E` is the finite
  measure `F` with `charFun F = C`, where Mathlib's `charFun F h = ∫ exp (i ⟪ω, h⟫) dF(ω)`. This is
  the convention of Stein, Gaetan–Guyon, Adler–Taylor and the Handbook. Tau Ceti's
  `TauCeti.bochner_charFun` states Bochner's theorem in this form. Chilès–Delfiner use ordinary
  frequency, with `4π²|u|²` in place of `‖ω‖²` (5.2).
- **Euclidean spaces.** `ℝ^d` is `EuclideanSpace ℝ (Fin d)`, and `S^{d−1}` its unit sphere. In
  Layer 7, `S^d` is the unit sphere of `ℝ^{d+1}`, so that the subscript of `Ψ_d` is the dimension
  of the sphere, as in Gneiting (2013); the zonal polynomial of `S^d` is
  `zonalPolynomial (d + 1) n`, indexed by the ambient dimension as in the roadmap on higher
  spheres.
- **Isotropic correlations** are functions `φ : ℝ → ℝ` evaluated at `‖h‖ ≥ 0`. The classes `Φ_d`
  constrain them only on `[0, ∞)`; the families of Layers 3 and 4 are defined with `|t|`, so that
  they are even, but no statement depends on their values at negative arguments.
- **Correlations on spheres** are functions `ψ : ℝ → ℝ` evaluated at the great-circle distance
  `θ(x, y) = arccos ⟪x, y⟫ ∈ [0, π]`; the classes `Ψ_d` constrain them only on `[0, π]`.
  Mathlib's `Real.arccos` clamps its argument to `[−1, 1]`, which never matters on the sphere.
- **Complete monotonicity** is Tau Ceti's `TauCeti.IsContinuousCompletelyMonotoneOnIoi`:
  continuity on `[0, ∞)` and `(−1)^n φ^{(n)} ≥ 0` on `(0, ∞)` for all `n`. Continuity at `0` is
  part of the definition; Gneiting (2002), Theorem 2, and Gneiting (2013), Theorem 7, need it and
  their derivative conditions on `(0, ∞)` do not give it. Bernstein's theorem is Tau Ceti's
  `TauCeti.hausdorff_bernstein_widder`. For the derivative of `ψ` in 6.2 the open-half-line
  predicate `TauCeti.IsCompletelyMonotoneOnIoi` is used.
- **Bessel functions.** `K_ν(x)` for `x > 0` is `positiveAxisBesselK`, the K-Bessel kernel
  `½ ∫₀^∞ exp(−x(u + u⁻¹)/2) u^{ν−1} du` of AnalyticNumberTheoryPartI (§2.1a), equal to
  `∫₀^∞ e^{−x cosh u} cosh(νu) du`; it is never evaluated at `x ≤ 0`. `J_ν` is Mathlib's
  `Complex.besselJ`. `Ω_d(t) = Γ(d/2)(2/t)^{(d−2)/2} J_{(d−2)/2}(t)`, with `Ω_d(0) = 1`, is
  `sphereCharFun d t`, the real part of the entire zonal Bessel function `besselZonal d 1 t` of
  the roadmap on Euclidean motion groups; the series form makes it entire and even, and gives
  `Ω_1 = cos` without the singular factor of `J_{−1/2}` at `0`.
- **Junk values.** Bochner integrals are used only of integrable functions, which every theorem
  ensures through its hypotheses; quantities that can be infinite (spectral moments, the
  Lévy–Khintchine integrability condition) are `Integrable` statements or finite `∫⁻`. Real
  infima are taken only of bounded families. `Real.rpow` is used with nonnegative bases, where
  `0 ^ α = 0` for `α > 0` is the intended value in `(1 − t/a)₊^ν` and `e^{−c 0^α} = 1`.
- **Locators** are `(Author, number, printed page)` in the editions listed under
  [References](#references).

## Layer 1: second-order and Gaussian fields

### 1.1 Second-order fields and covariance kernels

- `IsSecondOrderField Z P`: every `Z t` is in `L²(P)`.
- **Covariance kernels are positive semidefinite** (`posSemidef_covariance`): the covariance
  kernel `(s, t) ↦ cov[Z s, Z t; P]` of a second-order field is symmetric and positive
  semidefinite (van Lieshout, Proposition 2.1, p. 12; Stein, §2.3, p. 19; Cressie, (2.5.1),
  p. 83). Route: `∑ aᵢ aⱼ cov(Z sᵢ, Z sⱼ) = Var(∑ aᵢ Z sᵢ)`.

**Checks.**

- For `Z t = X` constant in `t` with `Var X = 1`, the kernel is the all-ones matrix, positive
  semidefinite of rank `1` on every finite set.
- Negative control: `C(s, t) = 1{s ≠ t}` on two points is the matrix `[[0, 1], [1, 0]]`, with
  eigenvalue `−1`; it is the covariance of no field.

### 1.2 Gaussian fields with given mean and covariance

- **Existence** (`exists_isGaussianProcess_coord`): for every set `T`, function `m : T → ℝ` and
  kernel `C` with `(Matrix.of C).PosSemidef`, there is a probability measure on `T → ℝ` under
  which the coordinate process is Gaussian in the sense of Mathlib's `IsGaussianProcess`, with
  mean `m` and covariance `C` (van Lieshout, Proposition 2.1, p. 12; Gaetan–Guyon,
  Definition 1.3, p. 3; Spodarev, Theorem 9.2, p. 282, for the extension theorem). Route:
  Tau Ceti's Kolmogorov feature map `Matrix.PosSemidef.kolmogorovFeature` sends `T` into a real
  Hilbert space `H` with `⟪v s, v t⟫ = C(s, t)` (`Matrix.PosSemidef.inner_kolmogorovFeature`);
  an isonormal process `W` on `H` (WienerChaosAndMalliavinCalculus 1.1) gives
  `Z t = m t + W(v t)`, and the law of `Z` is the measure sought. The hypothesis on `C` cannot
  be dropped: Mathlib's `ProbabilityTheory.multivariateGaussian` returns a fallback law for a
  matrix that is not positive semidefinite, so a construction through it typechecks without the
  hypothesis.
- **Uniqueness of the law** (`map_eq_of_isGaussianProcess`): two Gaussian fields with measurable
  coordinates and the same means and covariances have the same law on `T → ℝ`. Route: the
  finite-dimensional laws are multivariate Gaussian with the same mean and covariance, hence
  equal by `MeasureTheory.Measure.ext_of_charFun`, and the cylinder sets form a π-system
  generating the product σ-algebra.

**Checks.**

- `T = Fin 2`, `m = 0`, `C = [[1, ρ], [ρ, 1]]` with `|ρ| ≤ 1`: the law is the bivariate normal
  with correlation `ρ`; at `ρ = 1` it is carried by the diagonal.
- `T = [0, ∞)`, `C(s, t) = min(s, t)`: the law of Brownian motion at finitely many times.

### 1.3 Stationarity and variograms

For a field `Z : G → Ω → ℝ` on an additive commutative group `G`:
- `IsStrictlyStationary Z P`: for every finite `I ⊆ G` and every `h`, the law of
  `(Z(t + h))_{t ∈ I}` is that of `(Z t)_{t ∈ I}`;
- `IsSecondOrderStationary Z P`: second order, with constant mean and
  `cov(Z(s + h), Z(t + h)) = cov(Z s, Z t)`; `stationaryCov Z P h = cov(Z h, Z 0)` is its
  **stationary covariance**, so `cov(Z s, Z t) = C(s − t)`;
- `IsIntrinsicallyStationary Z P`: the increments `Z(s + h) − Z s` are in `L²`, centred, with
  variance depending only on `h`; `semivariogram Z P h = Var(Z h − Z 0)/2` is its **semivariogram**
  `γ`, and `2γ` its variogram. Gaetan–Guyon ask only that every increment process be
  second-order stationary, which admits affine means; the centred form here is Cressie's.

(Gaetan–Guyon, Definitions 1.4 and 1.6, pp. 3 and 8; Cressie, (2.3.2)–(2.3.4), pp. 53 and 58;
Stein, p. 19.) An isotropic field is a second-order stationary field on `ℝ^d` with
`C(h) = C₀(‖h‖)`; Layer 3 treats the functions `C₀`.

- **Strict implies second order** (`IsStrictlyStationary.isSecondOrderStationary`): a strictly
  stationary field with measurable square-integrable coordinates is second-order stationary
  (Gaetan–Guyon, p. 5). Route: the one- and two-dimensional laws are translation invariant.
- **Gaussian fields** (`isStrictlyStationary_iff_of_isGaussianProcess`): for a Gaussian field with
  measurable coordinates the two notions coincide (Gaetan–Guyon, p. 5; Stein, Exercise 1, p. 17).
  Route: 1.2's uniqueness applied to each finite-dimensional law.
- **Stationary implies intrinsic**
  (`IsSecondOrderStationary.isIntrinsicallyStationary`): with `γ(h) = C(0) − C(h)`
  (Gaetan–Guyon, (1.5), p. 10; Cressie, (2.5.2), p. 83).

**Checks.**

- Two-sided Brownian motion on `ℝ`, the centred Gaussian field with covariance
  `(|s| + |t| − |s − t|)/2` (a positive semidefinite kernel by 5.2), is intrinsically stationary
  with `γ(h) = |h|/2` but not second-order stationary, since `Var Z t = |t|` is not constant
  (Gaetan–Guyon, p. 8, give the variogram `|h|` of Brownian motion).
- Negative control: `Z t = tX` with `X` standard normal on `ℝ` has `Var(Z(s + h) − Z s) = h²`
  for every `s`, so it is intrinsically stationary with `γ(h) = h²/2`, but `Var Z t = t²`: a
  semivariogram need not be bounded, and an unbounded one belongs to no second-order stationary
  field, for which `γ ≤ 2C(0)`.

### 1.4 Stationary covariances

- **Elementary properties** (`IsSecondOrderStationary.stationaryCov_properties`): `C(0) ≥ 0`,
  `C(−h) = C(h)`, `|C(h)| ≤ C(0)`, and `C` is positive definite (Gaetan–Guyon, Proposition 1.1,
  p. 4; Stein, §2.3, p. 19; Chilès–Delfiner, (2.8), p. 62).
- **The converse** (`exists_isGaussianProcess_stationaryCov`): every real positive definite
  function on `G` is the stationary covariance of a centred Gaussian field. Route: 1.2 with the
  kernel `C(s − t)`, positive semidefinite by Tau Ceti's
  `TauCeti.isPositiveDefiniteSub_iff_posSemidef`.
- **Identification.** By the previous two bullets, the stationary covariances on `G` are exactly
  the real positive definite functions.
- **The continuity estimate** (`abs_sub_le_sqrt_of_isPositiveDefiniteSub`): for a real positive
  definite `C`, `|C(s + h) − C(s)| ≤ √(2 C(0)(C(0) − C(h)))` (Gaetan–Guyon, proof of
  Proposition 1.1, p. 4; Stein, p. 21). Route: realize `C` by 1.4's field and apply
  Cauchy–Schwarz to `C(s + h) − C(s) = cov(Z(s + h) − Z s, Z 0)`.
- **Uniform continuity** (`uniformContinuous_of_isPositiveDefiniteSub`): on a normed group, a real
  positive definite function continuous at `0` is uniformly continuous (Gaetan–Guyon,
  Proposition 1.1(4), p. 4).
- **Closure.** The real positive definite functions on `G` are closed under nonnegative linear
  combinations, products (Tau Ceti's `TauCeti.IsPositiveDefiniteSub.mul`), pointwise limits
  (`TauCeti.IsPositiveDefiniteSub.of_tendsto`) and composition with additive homomorphisms, in
  particular `h ↦ C(Ah)` for a linear map `A` of `ℝ^d` (Gaetan–Guyon, Proposition 1.1(3), (5),
  p. 4; Spodarev, Theorems 9.13–9.14, pp. 312–313).
- **Mixtures** (`isPositiveDefiniteSub_integral`): if `F x` is positive definite for every `x`
  and `x ↦ F x z` is `μ`-integrable for every `z`, then `z ↦ ∫ F x z dμ(x)` is positive definite
  (Gaetan–Guyon, Proposition 1.1(5b), p. 4; Spodarev, Theorem 9.14, pp. 312–313). Route: the
  quadratic form of the integral is the integral of the quadratic forms.

**Checks.**

- `C(h) = cos h` on `ℝ` (the covariance of `X cos t + Y sin t` with `X`, `Y` independent standard
  normal) attains `|C(h)| = C(0)` at every `h ∈ πℤ`.
- The estimate with equality: for `C = cos`, `s = 0`, `h = π`, the left side is `2` and the right
  side `√(2 · 1 · 2) = 2`. On 20000 random lags for Matérn and Gaussian covariances the ratio of
  left to right side never exceeded `0.7071`.
- Negative control: `C(h) = 1{h = 0}`, the covariance of white noise, is positive definite and
  not continuous at `0`; the continuity estimate gives `|C(s + h) − C(s)| ≤ √2` and nothing
  better, consistent with its discontinuity.

### 1.5 Mean-square continuity

- `IsMeanSquareContinuous Z P`: `E(Z t − Z s)² → 0` as `t → s`, for every `s`.
- **Through the covariance** (`isMeanSquareContinuous_iff`): a second-order field is mean-square
  continuous iff its covariance is continuous at every diagonal point `(s, s)` and its mean is
  continuous (Gaetan–Guyon, Definition 1.7 and Proposition 1.3, p. 16, for centred fields; Stein,
  §2.4, p. 20). Route: `E(Z t − Z s)² = C(t, t) − 2C(t, s) + C(s, s) + (m t − m s)²`, and
  Cauchy–Schwarz for the converse. For a centred field the mean condition is void.
- **The stationary case** (`IsSecondOrderStationary.isMeanSquareContinuous_iff`):
  `E(Z x − Z y)² = 2(C(0) − C(x − y))`, so a second-order stationary field on a normed group is
  mean-square continuous iff `C` is continuous at `0`, and then `C` is continuous everywhere
  (Stein, §2.4, pp. 20–21; Handbook, §2.6, p. 23).

**Checks.**

- Negative control: `Z t = 1{t ≥ U}` with `U` uniform on `[0, 1]` has
  `E(Z t − Z s)² = |t − s|` for `s, t ∈ [0, 1]`, so it is mean-square continuous, while every
  path jumps at `U`: mean-square continuity does not give continuous paths.
- The mean condition is needed: `Z t = 1{t ≥ 0}` (deterministic) has covariance `0`, continuous
  everywhere, and is not mean-square continuous at `0`.

### Dependencies

Mathlib's `IsGaussianProcess`, `cov[·, ·; ·]` and `Var[·; ·]`, the product σ-algebra and
`MeasureTheory.Measure.ext_of_charFun`; Tau Ceti's Kolmogorov feature map and
`TauCeti.isPositiveDefiniteSub_iff_posSemidef`; WienerChaosAndMalliavinCalculus 1.1.

## Layer 2: spectral theory

### 2.1 Spectral measures

Tau Ceti supplies Bochner's theorem on a finite-dimensional real inner-product space,
`TauCeti.bochner_charFun`: a continuous positive definite function is the characteristic
function of a unique finite measure (Stein, §2.5, Theorem 1, p. 24; Adler–Taylor,
Theorem 5.4.1, p. 109; Spodarev, Theorem 9.6, p. 309; van Lieshout, Theorem 2.1, p. 18). It is
consumed, not a target.

- **The spectral measure of a stationary field**
  (`IsSecondOrderStationary.existsUnique_spectralMeasure`): the covariance of a mean-square
  continuous second-order stationary field on `E` is `charFun F` for a unique finite measure `F`;
  this `F` is symmetric, `F(E) = C(0)`, and `C(h) = ∫ cos⟪h, ω⟫ dF(ω)` (Spodarev, Remark 9.4,
  p. 310; Handbook, (2.6), p. 20; Gaetan–Guyon, (1.2), p. 5). Route: 1.5 gives continuity, 1.4
  positive definiteness, and Bochner's theorem the measure; symmetry is uniqueness applied to
  `F.map Neg.neg`, whose characteristic function is `conj C = C`.
- **Identification.** By the previous bullet and 1.4's converse, the covariances of mean-square
  continuous second-order stationary fields on `E` are exactly the characteristic functions of
  finite symmetric measures.
- **Spectral densities** (`eq_withDensity_of_integrable`): if `C` is integrable, `F` has the
  continuous nonnegative density `f(ω) = (2π)^{−d} ∫ e^{−i⟪h, ω⟫} C(h) dh` (Stein, (11), p. 25;
  Chilès–Delfiner, p. 68; Handbook, (2.7), p. 20). Route: Tau Ceti's Fourier inversion for
  measures, `MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun`, rescaled from its
  `2π`-convention. Stein's Theorem 1 assumes a density rather than integrability of `C`.
- **Ordinary frequency.** In the convention `∫ e^{2πi⟪h, ξ⟫} dG(ξ)` of Mathlib's Fourier
  transform and of Chilès–Delfiner, the spectral measure of `C` is `G = F.map (· / (2π))`, the
  image of `F` under `ω ↦ ω/(2π)`; when `F` has the density `f`, `G` has the density
  `(2π)^d f(2πξ)`. For instance the Matérn spectral measure of 4.1 has in ordinary frequency the
  density `(2π)^d maternSpectralDensity ν θ d (2πξ)`. Route: change of variables.
- **The lattice form** (`isPositiveDefiniteSub_iff_lattice`): a function on `ℤ^d` is positive
  definite iff it is `h ↦ ∫ e^{i⟨h, ω⟩} dF(ω)` for a finite measure `F` on `[−π, π)^d`
  (Spodarev, Theorem 9.8, p. 310). Route: the direction from `F` is
  `∑ cᵢ conj(cⱼ) φ(hᵢ − hⱼ) = ∫ |∑ cᵢ e^{i⟨hᵢ, ω⟩}|² dF(ω)`. For the other direction, Tau
  Ceti's Bochner theorem on discrete abelian groups,
  `TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq`, gives a finite
  measure `μ` on the Pontryagin dual of `ℤ^d` (written multiplicatively) whose transform is `φ`. The
  map sending `ω ∈ [−π, π)^d` to the character `h ↦ e^{i⟨h, ω⟩}` is a measurable bijection onto
  this dual, with measurable inverse (it is the restriction to a fundamental domain of the
  quotient map onto the torus `(ℝ/2πℤ)^d`, which is homeomorphic to the dual); `F` is the image
  of `μ` under the inverse, extended by `0` off the half-open cube. For `d = 1` this is Tau Ceti's
  Herglotz theorem `TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq`,
  read through `ω ↦ e^{iω}` from `[−π, π)` onto the unit circle.

**Checks.**

- `C(h) = e^{−|h|}` on `ℝ` has spectral density `1/(π(1 + ω²))`, the Cauchy density; at `h = 1`
  the integral `∫ cos(ω)/(π(1 + ω²)) dω` is `e^{−1} = 0.36788`.
- `C(h) = e^{−‖h‖²}` on `ℝ^d` has density `(4π)^{−d/2} e^{−‖ω‖²/4}`, which at `‖ω‖ = 1.3` is
  `0.18489`, `0.05216`, `0.01471`, `0.00415` for `d = 1, 2, 3, 4`.
- Negative control: `C = cos` is positive definite with the non-integrable covariance and the
  spectral measure `(δ₁ + δ₋₁)/2`, which has no density; the integrability hypothesis is needed.
- Lattice: `φ(h) = (−1)^h` on `ℤ` is positive definite with `F = δ_π` pulled into `[−π, π)` as
  `δ_{−π}`; a measure on the closed cube `[−π, π]` would not be unique.

### 2.2 The spectral representation

An orthogonally scattered random measure `W` on `E` with control measure `F` (complex,
`E W(A) conj W(B) = F(A ∩ B)`) is encoded by the linear isometry
`I : L²(F) → L²(P)` with `W(A) = I(1_A)`, and `∫ g dW = I g`; this avoids a separate theory of
vector measures. `expLp F t` is the plane wave `ω ↦ e^{i⟪ω, t⟫}` in `L²(F)`.

- **Spectral representation** (`exists_spectralRepresentation`): a centred, mean-square
  continuous, second-order stationary field with spectral measure `F` is `Z t = I(expLp F t)`
  almost surely, for a linear isometry `I` with centred values, and `I` is the only linear
  isometry with `I(expLp F t) = Z t` for every `t` (Stein, (7), p. 23; Adler–Taylor,
  Theorem 5.4.2, p. 110; Chilès–Delfiner, (2.14)–(2.18), pp. 66–68; Cressie, §2.5.1, p. 84,
  where "independent increments" is meant as orthogonal increments). Route: the plane waves span
  a dense subspace of `L²(F)`, and `⟪expLp F s, expLp F t⟫ = C(t − s) = cov(Z s, Z t)`, so
  `expLp F t ↦ Z t` extends to an isometry (Stein, §2.6, p. 26), centred because integration
  against `1` is continuous on `L²(P)`; two linear isometries that agree on the plane waves agree
  on their closed span, which is `L²(F)`.
- **Conjugate symmetry** (`spectralRepresentation_neg`): for a real field, `W(−A) = conj W(A)`
  for every Borel set `A` (Chilès–Delfiner, p. 67). Route: `f ↦ conj(f ∘ neg)` is a
  conjugate-linear isometry of `L²(F)` (`F` is symmetric by 2.1) fixing every plane wave, and
  `I` intertwines it with conjugation on the dense span of the plane waves.
- **The converse** (`spectralIntegral_properties`): for every linear isometry `I` with centred
  values, `t ↦ I(expLp F t)` is a centred, mean-square continuous field with
  `E Z(s) conj Z(t) = ∫ e^{i⟪s − t, ω⟫} dF(ω)`, and it is real when `W(−A) = conj W(A)` for every
  `A` (Stein, §2.5, p. 23; Adler–Taylor, Theorem 5.4.2, p. 110).

**Checks.**

- `F = (δ₁ + δ₋₁)/2` on `ℝ`: `W` is carried by `{±1}` with `W{1} = (X − iY)/2`,
  `W{−1} = (X + iY)/2` for independent standard normal `X`, `Y`, and `Z t = X cos t + Y sin t`,
  with covariance `cos(s − t)`.
- Negative control: a symmetric `F` does not make the field real: `W{1} = X`, `W{−1} = iY` with
  `X`, `Y` independent `N(0, 1/2)` has control measure `F` and gives `Z 0 = X + iY`, not real;
  the symmetry `W(−A) = conj W(A)` is the condition.

### 2.3 Mean-square differentiability

- `HasMeanSquareDeriv Z Z' P`: `E((Z(t + h) − Z t)/h − Z' t)² → 0` as `h → 0`, `h ≠ 0`, for every
  `t`. `IsMeanSquareDifferentiable m Z P`: there are square-integrable processes
  `D 0 = Z, D 1, …, D m`, each the mean-square derivative of the previous one.
  `HasFiniteIteratedDerivAt n K x`: `K` is `C^{n−1}` near `x` and its derivative of order `n − 1`
  is differentiable at `x`. Mathlib's `iteratedDeriv` is `0` where the derivative does not
  exist, so "`K^{(2m)}(0)` exists and is finite" cannot be written as a value of `iteratedDeriv`.
- **The equivalence** (`isMeanSquareDifferentiable_tfae`): for a centred second-order stationary
  process on `ℝ` with spectral measure `F` and `m ≥ 1`, `Z` is `m` times mean-square
  differentiable iff `ω^{2m}` is `F`-integrable iff `K^{(2m)}(0)` exists and is finite
  (Stein, §2.4, p. 21, and §2.6, pp. 26–27; Gaetan–Guyon, Proposition 1.4, pp. 16–17, for a
  nonstationary version). Route: through 2.2, mean-square differentiability of `Z` is
  convergence of `(e^{iω(t+h)} − e^{iωt})/h` in `L²(F)`, which holds iff `∫ ω² dF < ∞`; a finite
  second symmetric difference of `charFun F` at `0` gives a finite second moment by Fatou, and
  Mathlib's `MeasureTheory.contDiff_charFun` gives the converse; induct on `m`.
- **The derivative process** (`IsMeanSquareDifferentiable.derivative`): then `K` is `C^{2m}`
  and `Z^{(m)}` is second-order stationary with covariance `(−1)^m K^{(2m)}` (Stein, p. 21).
  Route: `MeasureTheory.iteratedDeriv_charFun`.
- **Analytic paths without mean-square derivative**
  (`not_isMeanSquareDifferentiable_cos_cauchy`): `Z t = cos(Xt + Y)`, with `X` standard Cauchy
  and `Y` uniform on `[0, 2π)` independent of `X`, is second-order stationary with covariance
  `e^{−|h|}/2` and not mean-square differentiable (Stein, pp. 21–22). Route: the spectral
  density of `e^{−|h|}/2` is `1/(2π(1 + ω²))`, with `∫ ω² dF = ∞`, and the equivalence above.
- **Paths of the example.** Every path `t ↦ cos(X(ω) t + Y(ω))` is analytic, so mean-square
  differentiability is not a property of the paths.

**Checks.**

- The Cauchy example by Monte Carlo with `4 · 10⁶` samples: the empirical covariance at lag `1` is
  `0.1837` against `e^{−1}/2 = 0.1839`, and at lag `2` it is `0.0680` against `0.0677`.
- `K(h) = e^{−h²}` (`F` the normal law with variance `2`): `Z` is mean-square differentiable of
  every order, and `Z'` has covariance `−K'' = (2 − 4h²) e^{−h²}`, with variance `2 = ∫ ω² dF`.
- Negative control: `K(h) = e^{−|h|}` has right derivative `−1` at `0` and left derivative `1`,
  so `K''(0)` does not exist, and the process is not mean-square differentiable, while Mathlib's
  `iteratedDeriv 2 K 0` is `0`; this is why `HasFiniteIteratedDerivAt` is used.

### Dependencies

Layer 1; Tau Ceti `TauCeti.bochner_charFun`,
`MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun`,
`TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq`,
`TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq`; Mathlib
`MeasureTheory.Lp`, `MeasureTheory.contDiff_charFun`, `MeasureTheory.iteratedDeriv_charFun`,
`cauchyMeasure`.

## Layer 3: isotropic correlation functions

### 3.1 Schoenberg's theorem on `ℝ^d`

- `sphereCharFun d t = Ω_d(t)`, the characteristic function of the uniform law on `S^{d−1}`
  evaluated at `t` times a unit vector: `Ω_d(‖a‖) = ∫ e^{i⟪a, ξ⟫} dσ(ξ)` is the sphere-integral
  bullet of the motion-group roadmap's §6.1, and `Ω_1 = cos`, `Ω_2 = J₀`, `Ω_3(t) = sin t / t`
  (Handbook, (2.10), p. 21; Gaetan–Guyon, p. 6; Stein, (26), p. 43). `|Ω_d| ≤ 1`.
- `isotropicClass d = Φ_d`: the `φ` continuous on `[0, ∞)` with `φ(0) = 1` and `x ↦ φ(‖x‖)`
  positive definite on `ℝ^d`. `isotropicClassInf = Φ_∞ = ⋂_{d ≥ 1} Φ_d`.
  `IsStrictlyPositiveDefiniteSub F`: the Hermitian form of `F` is positive at distinct points
  with coefficients not all `0`.
- **Schoenberg's theorem** (`mem_isotropicClass_iff`): for `d ≥ 1`, `φ ∈ Φ_d` iff
  `φ(t) = ∫ Ω_d(rt) dF₀(r)` for `t ≥ 0` and a probability measure `F₀` on `[0, ∞)` (Handbook,
  (2.9), p. 21; Stein, (26) and Theorem 5, pp. 43–44; Adler–Taylor, Theorem 5.7.2, p. 116;
  Spodarev, Theorem 9.11, p. 311; Gneiting (2013), (4), p. 1329, which attributes it to
  Schoenberg (1938)). Route: the spectral measure `F` of 2.1 is rotation invariant (uniqueness
  and Tau Ceti's linear pullbacks of Bochner measures); a rotation-invariant finite measure is
  the image of `σ ⊗ F₀` under `(ξ, r) ↦ rξ` with `F₀` the image of `F` under the norm, and
  integrating `e^{i⟪h, rξ⟫}` over `ξ` gives `Ω_d(r‖h‖)`.
- **Uniqueness** (`eq_of_integral_sphereCharFun_eq`) of `F₀`, and **identification**
  (`integral_sphereCharFun_map_norm`): `F₀` is the image of the spectral measure under
  `ω ↦ ‖ω‖`. Route: two radial measures with the same transform give rotation-invariant
  measures on `ℝ^d` with the same characteristic function.
- **The radial density** (`eq_withDensity_of_integrableOn_radial`): if a finite measure `F` on
  `ℝ^d` has `charFun F x = φ(‖x‖)` and `r^{d−1} φ(r)` is integrable on `(0, ∞)`, then `F` has
  density
  `f(u) = (2^{d−1} π^{d/2} Γ(d/2))⁻¹ ∫₀^∞ Ω_d(ur) r^{d−1} φ(r) dr` at `‖ω‖ = u`, which is the
  source form `(2π)^{−d/2} ∫₀^∞ (ur)^{−(d−2)/2} J_{(d−2)/2}(ur) r^{d−1} φ(r) dr` for `u > 0`
  (Stein, p. 46; Handbook, p. 21; Chilès–Delfiner, (2.23), p. 71). Route: 2.1's density and the
  Fourier transform of radial functions of the motion-group roadmap's §5.3; the `Ω_d` form has
  no junk value at `u = 0`.
- **Strict nesting** (`isotropicClass_ssubset`): `Φ_{d+1} ⊊ Φ_d` and `Φ_∞ ⊊ Φ_d` (Gneiting
  (2013), p. 1330; Handbook, p. 21). Route: inclusion by restriction to `ℝ^d ⊂ ℝ^{d+1}`;
  strictness by `Ω_d ∈ Φ_d \ Φ_{d+1}`, whose `ℝ^{d+1}`-spectral measure would be the image of the
  uniform law on `S^{d−1}`, which is not rotation invariant in `ℝ^{d+1}`; and
  `Φ_∞ ⊆ Φ_{d+1}`.
- **Strict positive definiteness** (`isStrictlyPositiveDefiniteSub_of_mem_isotropicClass`): for
  `d ≥ 2`, every non-constant `φ ∈ Φ_d` gives a strictly positive definite function on `ℝ^d`
  (Gneiting (2013), p. 1330, citing Sun). Route: if the quadratic form vanishes, then
  `∑ cⱼ e^{i⟪xⱼ, ω⟫} = 0` on the support of `F`, which is a union of spheres `‖ω‖ = r` with some
  `r > 0`; on such a sphere, for `d ≥ 2`, the exponentials at distinct points are linearly
  independent (the analytic function `∑ cⱼ e^{i⟪xⱼ, ·⟫}` vanishing on a sphere of dimension
  `≥ 1` vanishes identically on `ℝ^d`).

**Checks.**

- `Ω_1(1) = cos 1 = 0.54030`, `Ω_2(2) = J₀(2) = 0.22389`, `Ω_3(2) = sin 2 / 2 = 0.45465`;
  `Ω_4(1.26) = 0.81425` from the series and from the Bessel form.
- `φ = Ω_d` itself has `F₀ = δ₁`.
- Negative control: `d = 1` is excluded from strict positive definiteness: `φ = cos ∈ Φ_1` is
  not constant, and at the points `0` and `2π` with coefficients `1, −1` the form is `0`.

### 3.2 Lower bounds

- **The simplex bound** (`neg_inv_le_of_mem_isotropicClass`): `φ(t) ≥ −1/d` on `[0, ∞)` for
  `φ ∈ Φ_d` (Matérn, p. 13; Adler–Taylor, Theorem 5.7.1, p. 115). Route: the `d + 1` vertices of a
  regular simplex with edge `t` give `(d + 1)(1 + d φ(t)) ≥ 0`.
- **The sharp bound** (`iInf_sphereCharFun_le_of_mem_isotropicClass`):
  `φ(t) ≥ inf_{s ≥ 0} Ω_d(s)`; the infimum is a value `Ω_d(s₀)` with `s₀ ≥ 0`, and every
  `Ω_d(s₀ ·)` lies in `Φ_d`, so the bound is attained (Matérn, (2.3.17), p. 16; Handbook,
  Table 2.1, p. 22; Stein, p. 45). Route: 3.1, since a mixture of values of `Ω_d` is at least
  their infimum; the infimum is a minimum because `Ω_d` is continuous, takes a value below `0`
  for `d ≥ 1` and tends to `0` at infinity for `d ≥ 2` (`Ω_1 = cos` attains `−1` at `π`).
- **Rigidity** (`eq_one_of_mem_isotropicClass`): for `d ≥ 2`, if `φ(t₀) = 1` for some `t₀ > 0`
  then `φ ≡ 1` on `[0, ∞)` (Matérn, p. 13). Route: perfect correlation at distance `t₀`
  propagates to every distance in `(0, 2t₀)` through a third point, and then by induction.

**Checks.**

- The minima, to four places: `inf Ω_2 = −0.4028` at `s₀ = 3.8317`, `inf Ω_3 = −0.2172` at
  `4.4934`, `inf Ω_4 = −0.1323` at `5.1356`; all exceed `−1/d = −0.5, −0.333, −0.25`. The sources
  round outward (Stein, p. 45, the Handbook, Table 2.1, p. 22, Matérn, p. 16, and Gaetan–Guyon,
  p. 6, print `−0.218` for `d = 3`; Matérn prints `−0.133` for `d = 4`); Gaetan–Guyon, p. 6,
  print `−0.113` for `d = 4`, a misprint.
- For `d = 1` the two bounds agree: `inf cos = −1`, attained by `cos ∈ Φ_1`.
- Negative control for rigidity: `cos ∈ Φ_1` has `cos(2π) = 1` and is not constant, so `d ≥ 2`
  is needed.

### 3.3 Correlations valid in every dimension

- **Gaussian mixtures** (`mem_isotropicClassInf_iff_gaussianMixture`): `φ ∈ Φ_∞` iff
  `φ(t) = ∫ e^{−r²t²} dF(r)` on `t ≥ 0` for a probability measure `F` on `[0, ∞)` (Gneiting
  (2013), (5), p. 1330, after Schoenberg (1938); Handbook, (2.11), p. 22; Stein, (28),
  p. 44; Chilès–Delfiner, (2.27), p. 72). Route: the uniform limit below and Helly's selection
  applied to the radial measures of 3.1, with tightness from `φ(t) → 1` as `t → 0`; the converse
  is Tau Ceti's `TauCeti.posSemidef_cexp_neg_mul_sq_norm` and 1.4's mixtures.
- **The completely monotone criterion** (`mem_isotropicClassInf_iff_completelyMonotone`):
  `φ ∈ Φ_∞` iff `φ(0) = 1` and `t ↦ φ(√t)` is completely monotone (Chilès–Delfiner, p. 73;
  Gneiting (2002), (9), p. 593). Route: Bernstein's theorem applied to the previous bullet.
- **Properties** (`properties_of_mem_isotropicClassInf`): members of `Φ_∞` are positive,
  nonincreasing, strictly decreasing unless constant, and smooth on `(0, ∞)` (Handbook, p. 22,
  where constants must be excluded from strict decrease).
- **The Gaussian limit** (`tendstoUniformlyOn_sphereCharFun`):
  `Ω_d(√(2d) t) → e^{−t²}` uniformly on `[0, ∞)` (Stein, (27), p. 44, which refers the
  uniformity to Schoenberg). Route: `Ω_d(√(2d) t)` is the characteristic function of the first
  coordinate of `√(2d)` times a uniform point of `S^{d−1}`, which tends in law to `N(0, 2)`;
  uniformity in `t` from equicontinuity, and at infinity from the decay of both sides.
- **Completely monotone correlations** (`mem_isotropicClassInf_of_completelyMonotone`): every
  continuous completely monotone `φ` with `φ(0) = 1` lies in `Φ_∞` (Gneiting (2002), p. 593;
  Chilès–Delfiner, p. 72). Route: `φ(√·)` is completely monotone (composition with the Bernstein
  function `√·`), and the criterion; KernelsAndSpectralMethods 8.2 has the Gaussian scale
  mixtures.
- **The powered exponential and generalized Cauchy families**
  (`exp_neg_rpow_mem_isotropicClassInf`, `cauchyType_mem_isotropicClassInf`): `e^{−c t^α}` with
  `c ≥ 0` and `(1 + t^α)^{−β/α}` with `β > 0` lie in `Φ_∞` for `0 < α ≤ 2` (Gneiting (2013),
  Table 2, p. 1330). Route: `t ↦ e^{−c t^{α/2}}` and `(1 + t^{α/2})^{−β/α}` are completely
  monotone for `α/2 ≤ 1`.

**Checks.**

- `sup_{t ≥ 0} |Ω_d(√(2d) t) − e^{−t²}|` is `0.139` (`d = 5`), `0.029` (`d = 20`),
  `0.0055` (`d = 100`).
- `φ = e^{−t}` (`α = 1`): `φ(√t) = e^{−√t}` is completely monotone, and its Gaussian mixing
  measure has density `r^{−2} e^{−1/(4r²)}/√π` on `(0, ∞)`, of mass `1`; the mixture reproduces
  `e^{−t}` at `t = 0.3, 1, 2.5` to ten places.
- Negative control: `e^{−t³}` (`α = 3`) is in no `Φ_d`: it is `C²` with `φ''(0) = 0`, so its
  spectral measure would have zero second moment and be `δ₀`, giving `φ ≡ 1`.
- Negative control: `Ω_2 = J₀ ∈ Φ_2` takes negative values, so it is not in `Φ_∞`.

### 3.4 Pólya-type criteria and compact support

- **Pólya's criterion** (`mem_isotropicClass_one_of_convexOn`): a continuous `φ` that is convex
  on `[0, ∞)` with `φ(0) = 1` and `φ(t) → 0` as `t → ∞` lies in `Φ_1` (Handbook, p. 23;
  Chilès–Delfiner, (2.20), p. 69; Cressie, p. 86). Route: such a `φ` is a mixture of triangular
  functions `(1 − t/a)₊` against the measure `a dφ'(a)`, and 1.4's mixtures.
- **Truncated powers** (`truncatedPower_mem_isotropicClass_iff`): for `a > 0`, `ν > 0` and
  `n ≥ 1`, `(1 − t/a)₊^ν ∈ Φ_n` iff `ν ≥ (n + 1)/2` (Chilès–Delfiner, pp. 63–64, who attribute the
  equivalence to Golubov (1981); Spodarev, Theorem 9.9, p. 311, for a Pólya–Askey sufficient
  condition; Gneiting (2013), Table 3, p. 1331, for `n = 3`). Route: by scaling `a = 1`; the
  radial density of 3.1 is a Bessel integral of `(1 − r)₊^ν`, expressed through `₁F₂`. For
  `ν ≥ (n + 1)/2` it is nonnegative (Askey's sufficiency); for `ν < (n + 1)/2` the necessity is
  Golubov's theorem, whose route reads a negative value off the large-`u` asymptotics of the
  `₁F₂`, where the oscillating term of order `u^{−n/2−ν−1/2}` dominates the positive term of
  order `u^{−n−1}`.
- **The triangular function** (`triangular_mem_isotropicClass`): `(1 − t/a)₊` lies in `Φ_1` and
  not in `Φ_2` (Stein, pp. 30–31, for `Φ_1`). Route: the case `ν = 1`, `n = 1, 2` of the
  truncated powers.

**Checks.**

- The radial Fourier transform on `ℝ²` of `(1 − r)₊^ν` has minimum `−5.6 · 10⁻⁴` at `u ≈ 6.79`
  for `ν = 1` and `−1.8 · 10⁻⁴` for `ν = 1.2`, and is nonnegative for `ν = 1.5 = (2 + 1)/2`.
- On `ℝ³`, `u⁻¹ ∫₀¹ (1 − r)^ν r sin(ur) dr` (the radial transform up to the factor `4π`) has
  minimum `−2.06 · 10⁻⁴` at `u ≈ 8.28` for `ν = 1.5` and `−2.6 · 10⁻⁶` at `u ≈ 15.1` for
  `ν = 1.7`; at the threshold `ν = 2 = (3 + 1)/2` it is `2(u(2 + cos u) − 3 sin u)/u⁵ ≥ 0`.
- On `ℝ`, `(1 − |t|)₊` has the Fourier transform `(1 − cos ω)/(πω²) ≥ 0`, while for `ν = 0.9`
  the cosine transform `∫₀¹ (1 − r)^ν cos(ur) dr` has minimum `−6.9 · 10⁻³` at `u ≈ 6.07`.
- Negative control: `φ(t) = e^{−t} cos t` tends to `0` but is not convex; its spectral density
  `(2 + ω²)/(π(4 + ω⁴))` is positive, so Pólya's criterion is sufficient, not necessary.

### Dependencies

Layers 1–2; Tau Ceti `TauCeti.posSemidef_cexp_neg_mul_sq_norm`,
`TauCeti.hausdorff_bernstein_widder`; the motion-group roadmap, §§5.3 and 6.1;
KernelsAndSpectralMethods 8.2.

## Layer 4: the Matérn family

### 4.1 Matérn correlation and spectral density

- `maternCorrelation ν θ t = φ_{ν,θ}(t) = 2^{1−ν}/Γ(ν) (|t|/θ)^ν K_ν(|t|/θ)` for `t ≠ 0`, with
  `φ_{ν,θ}(0) = 1`; `maternSpectralDensity ν θ d` and `maternSpectralMeasure ν θ d`, the measure
  on `ℝ^d` with density `Γ(ν + d/2)/(Γ(ν) π^{d/2}) θ^d (1 + θ²‖ω‖²)^{−ν−d/2}`. Four
  parametrizations occur in the sources: Stein's `φ(αr)^ν K_ν(αr)`, the normalized scale form
  here, Gneiting's (2002) inverse scale `c`, and Stein's `ρ`-form (33), p. 50.
- **Spectral density** (`charFun_maternSpectralMeasure`): for `ν, θ > 0` and every `d`, the
  Matérn spectral measure is a probability measure with characteristic function
  `φ_{ν,θ}(‖h‖)` (Stein, (14), p. 31, and (32), p. 49; Handbook, (2.13), p. 24; van Lieshout,
  Example 2.11, p. 18; Matérn, §2.4, pp. 17–18). Route: write
  `(1 + θ²‖ω‖²)^{−ν−d/2}` as a Gamma mixture of Gaussians in `ω`, take the Gaussian Fourier
  transform, and evaluate the resulting `t`-integral by the `K_ν` integral of
  AnalyticNumberTheoryPartI §2.1a.
- `maternCorrelation_mem_isotropicClassInf`: `φ_{ν,θ} ∈ Φ_∞` (Gneiting (2013), Table 2,
  p. 1330).
- **Half-integer orders** (`maternCorrelation_half`, `maternCorrelation_threeHalves`,
  `maternCorrelation_halfInteger`): `φ_{1/2,θ}(t) = e^{−t/θ}`, `φ_{3/2,θ}(t) = (1 + t/θ)e^{−t/θ}`,
  and `φ_{m+1/2,θ}(t)` is `e^{−t/θ}` times a polynomial of degree `m` in `t/θ` (Handbook,
  Table 2.2, p. 24; Gneiting (2013), p. 1345). Route: the half-odd orders of `K_ν`,
  SpecialFunctionsBessel §2.3, through its agreement §5.1.
- **Gaussian limit** (`tendsto_maternCorrelation_gaussian`): with `θ = 1/(2√ν)`,
  `φ_{ν,θ}(t) → e^{−t²}` as `ν → ∞` (Stein, p. 50; Handbook, p. 24). Route: the Gamma mixture
  `φ_{ν,θ}(t) = E e^{−t²/(4θ²V)}`, `V ~ Γ(ν, 1)`, with `V/ν → 1` in probability.
- **Complete monotonicity** (`maternCorrelation_completelyMonotone_iff`): `φ_{ν,θ}` is completely
  monotone iff `0 < ν ≤ 1/2` (Gneiting (2013), Example 2, p. 1345, citing Miller and Samko).
  Route for "only if": for `ν > 1/2` the right derivative at `0` vanishes, and a completely monotone
  function with this property is constant by Bernstein's theorem, while `φ_{ν,θ}(t) → 0`.

**Checks.**

- `φ_{1/2,1.3}(0.7) = e^{−0.7/1.3} = 0.58365`; `φ_{3/2,1.3}(0.7) = 0.89792`;
  `φ_{5/2,1}(0.7) = (1 + 0.7 + 0.49/3) e^{−0.7} = 0.92530`.
- The spectral density has total mass `1` for `ν ∈ {0.3, 1.5}`, `d ∈ {1, 2, 3}`, and at `ν = 1.5`,
  `θ = 0.8`, `h = 0.9` its characteristic function is `0.68989` for `d = 1` and `d = 3`, equal to
  `φ_{1.5,0.8}(0.9)`.
- `max_t |φ_{ν,1/(2√ν)}(t) − e^{−t²}|` is `0.023` at `ν = 10` and `0.0023` at `ν = 100`.
- Negative control: the prefactor `2^{ν−1}/Γ(ν)` printed by Gneiting (2013), Table 2, p. 1330,
  and (36), p. 1345, gives the limit `2^{2ν−2} = 2` at `t → 0` for `ν = 3/2`, not `1`.

### 4.2 Smoothness of Matérn fields

- **Mean-square differentiability** (`isMeanSquareDifferentiable_matern_iff`): a centred
  second-order stationary process on `ℝ` with covariance `σ² φ_{ν,θ}`, `σ² > 0`, is `m` times
  mean-square differentiable iff `m < ν` (Stein, pp. 31–32). Route: 2.3, since
  `∫ ω^{2m}(1 + θ²ω²)^{−ν−1/2} dω < ∞` iff `m < ν`; at `m = 0` both sides hold.
- **Small-lag order** (`one_sub_maternCorrelation_isTheta`): as `t ↓ 0`, `1 − φ_{ν,θ}(t)` is of
  exact order `t^{2ν}` for `0 < ν < 1`, `t² log(1/t)` for `ν = 1`, and `t²` for `ν > 1` (Stein,
  (15)–(16), p. 32; Handbook, (2.12), p. 23; Gneiting (2013), Table 2 and (6), p. 1330). Route:
  the small-argument expansions of `K_ν`, SpecialFunctionsBessel §§2.1–2.2, through §5.1.
- **Principal irregular term** (`maternCorrelation_principalIrregularTerm`,
  `maternCorrelation_principalIrregularTerm_natCast`): after subtracting an even polynomial of
  degree less than `2ν`, `φ_{ν,θ}(t)` is `c t^{2ν} + o(t^{2ν})` with `c ≠ 0` for `ν ∉ ℕ`, and
  `c t^{2ν} log t + o(t^{2ν} log t)` for `ν ∈ ℕ`, `ν ≥ 1` (Stein, (15)–(16), p. 32, and (33),
  p. 50).

**Checks.**

- `(1 − φ_{ν,1}(t))/t^{min(2ν, 2)}` at `t = 10⁻⁴` is `0.954` (`ν = 0.3`), `0.500` (`ν = 1.5`) and
  `0.1667` (`ν = 2.5`), the last two `1/(4(ν − 1))`.
- At `ν = 1`, `(1 − φ_{1,1}(t))/(t² log(1/t))` is `0.527` at `t = 10⁻⁵`, tending to `1/2` like
  `1/log(1/t)`.
- Negative control: the order `t^{min(2ν,2)} = t²` alone is wrong at `ν = 1`: the ratio
  `(1 − φ_{1,1}(t))/t²` is unbounded as `t ↓ 0`.
- The Handbook's smoothness statement on p. 24 concerns sample paths, and Stein's mean-square
  derivatives; this layer states the latter.

### Dependencies

Layers 2–3; AnalyticNumberTheoryPartI §2.1a; SpecialFunctionsBessel §§2.1–2.3, 5.1; Mathlib
`Real.Gamma`, `ProbabilityTheory.gammaMeasure`, `Asymptotics.IsTheta`.

## Layer 5: variograms

### 5.1 Properties of semivariograms

- `IsCondNegDef γ`: `∑ cᵢ cⱼ γ(xᵢ − xⱼ) ≤ 0` for real coefficients with `∑ cᵢ = 0`. For a real even
  `γ` this is FactorRigidity's conditional negative definiteness (§4.1) on the group `G`, whose
  complex coefficients reduce to real ones by symmetry. Chilès–Delfiner state it with `−γ`
  conditionally positive definite.
- **Properties** (`IsIntrinsicallyStationary.semivariogram_properties`): `γ(0) = 0`,
  `γ(−h) = γ(h) ≥ 0`, and `Var(∑ aᵢ Z(sᵢ)) = −∑ aᵢ aⱼ γ(sᵢ − sⱼ)` when `∑ aᵢ = 0`, so `γ` is
  conditionally negative definite (Gaetan–Guyon, Proposition 1.2, pp. 8–9; Chilès–Delfiner,
  (2.9)–(2.11), pp. 63–64; Cressie, §2.5.2, p. 86). Route: `∑ aᵢ Z(sᵢ) = ∑ aᵢ(Z(sᵢ) − Z 0)` and
  the polarization `2cov(Y, Y') = Var Y + Var Y' − Var(Y − Y')`.
- **Closure.** Semivariograms on `ℝ^d` are closed under `h ↦ γ(Ah)` for linear `A`, nonnegative
  combinations, mixtures and pointwise limits (Gaetan–Guyon, Proposition 1.2, pp. 8–9): each
  operation preserves conditional negative definiteness, evenness and `γ(0) = 0`, and 5.2
  realizes the result.
- **Continuity** (`IsIntrinsicallyStationary.abs_semivariogram_sub_le`):
  `|γ(s + h) − γ(s)| ≤ √γ(h)(√γ(s) + √γ(s + h))`, so `γ` is continuous everywhere if it is
  continuous at `0` (Gaetan–Guyon, Proposition 1.2, p. 9; Chilès–Delfiner, p. 59). Route:
  `√(2γ)` is the `L²` norm of an increment and is subadditive. Gaetan–Guyon state the continuity
  at points where `γ` is locally bounded; the qualification is redundant.
- **Growth** (`IsIntrinsicallyStationary.semivariogram_growth`): `γ(nh) ≤ n² γ(h)`, and if `γ` is
  bounded near `0` there are `a, b ≥ 0` with `γ(h) ≤ a‖h‖² + b` (Gaetan–Guyon, Proposition 1.2,
  p. 9). Route: subadditivity of `√γ` along `0, h, 2h, …, nh`.

**Checks.**

- `γ(h) = |h|/2` of Brownian motion (1.3): `γ(nh) = n|h|/2 ≤ n²|h|/2`, with equality only at
  `n = 1`; `γ(h) = h²/2` of `tX` (1.3) attains `γ(nh) = n²γ(h)`.
- For `γ = ‖h‖^α` on twelve random points of `ℝ³`, the form `−∑ aᵢ aⱼ γ(sᵢ − sⱼ)` restricted to
  `∑ aᵢ = 0` has smallest eigenvalue `0` to rounding for `α = 0.5, 1, 2`, and `−5.08` for
  `α = 2.5`: negative control, `‖h‖^{2.5}` is no semivariogram.

### 5.2 The Schoenberg–von Neumann theorem

- **The characterization** (`isCondNegDef_tfae`): for continuous even `γ` on `ℝ^d` with
  `γ(0) = 0`, the following are equivalent: (a) `γ` is conditionally negative definite; (b)
  `e^{−tγ}` is positive definite for every `t > 0`; (c) `γ(h) = Q(h) + ∫ (1 − cos⟪ω, h⟫)/‖ω‖² dχ(ω)`
  with `Q(h) = ⟪T h, h⟫` for a positive operator `T` and `χ` symmetric with `χ{0} = 0` and
  `∫ (1 + ‖ω‖²)⁻¹ dχ < ∞` (Gaetan–Guyon, p. 10, for (a)⇔(b); Chilès–Delfiner, (2.21)–(2.22),
  pp. 69–70, in ordinary frequency; Cressie, §2.5.2, pp. 86–87, who requires `χ` to have no atom
  at `0`; Stein, §2.9, p. 38). Route: (a)⇒(b) is FactorRigidity's Schoenberg theorem (§4.1); (b)⇒(a)
  from `(1 − e^{−tγ})/t → γ` as `t ↓ 0`; (b)⇒(c): by Bochner, `e^{−tγ} = charFun μ_t` with
  `μ_t` symmetric probability measures, and `t⁻¹ (1 − cos⟪ω, h⟫) μ_t(dω)` converges, after
  splitting at `‖ω‖ = 1` and using the moment of order `2` near `0`, to the Lévy measure
  `‖ω‖⁻² χ(dω)` and the quadratic part; (c)⇒(a) for every `γ`, since each `1 − cos⟪ω, ·⟫` and `Q`
  are conditionally negative definite. Continuity is used only in (b)⇒(c). The bound
  `(1 − cos⟪ω, h⟫)/‖ω‖² ≤ (‖h‖²/2 + 2)(1 + ‖ω‖²)⁻¹` makes the integral in (c) a Bochner integral
  of an integrable function, and the junk value `0` of the integrand at `ω = 0` is harmless by
  `χ{0} = 0`.
- **Realization** (`exists_isGaussianProcess_semivariogram`): every conditionally negative
  definite even `γ` with `γ(0) = 0` on `ℝ^d` is the semivariogram of an intrinsically stationary
  Gaussian field (Gaetan–Guyon, p. 8; Cressie, p. 87). Route: 1.2 with the kernel
  `C(x, y) = γ(x) + γ(y) − γ(x − y)`, positive semidefinite by conditional negative definiteness
  applied to the coefficients `aᵢ` at `xᵢ` and `−∑ aᵢ` at `0`.
- **Power variograms** (`isCondNegDef_norm_rpow`): `‖h‖^α` is conditionally negative definite on
  every `ℝ^d` for `0 < α ≤ 2` (Gaetan–Guyon, p. 11; Chilès–Delfiner, p. 70, for `α = 1`).
  Route: (c) with `χ(dω) = c ‖ω‖^{2−d−α} dω` for `α < 2`, and `Q = ‖·‖²` for `α = 2`.

**Checks.**

- On `ℝ`, `∫ (1 − cos ωh)|ω|^{−1−α} dω = c_α |h|^α` with `c_α = 5.013, π, 3.342` for
  `α = 0.5, 1, 1.5`, the same at `h = 0.5` and `h = 2` (`c_α = 2Γ(1 − α)cos(πα/2)/α`).
- (b) for `γ = ‖h‖`: `e^{−t‖h‖}` is the characteristic function of a multivariate Cauchy law.
- Negative control: `γ = 1 − cos h` is continuous, even, conditionally negative definite and
  bounded: it is the semivariogram of the stationary field of 2.2's Check, with `Q = 0` and
  `χ = (δ₁ + δ₋₁)/2`; a quadratic `Q` alone would not represent it.

### Dependencies

Layers 1–2; FactorRigidity §4.1; Tau Ceti `TauCeti.bochner_charFun`.

## Layer 6: space–time covariances

### 6.1 The Cressie–Huang criterion

- **Cressie–Huang** (`isPositiveDefiniteSub_iff_ae_spatialFourier`): a continuous, bounded,
  integrable `C` on `ℝ^d × ℝ` with `C(−h, −u) = C(h, u)` is positive definite iff for almost
  every `ω ∈ ℝ^d` there is a continuous positive definite `F_ω` on `ℝ` with
  `F_ω(u) = ∫ e^{−i⟨h, ω⟩} C(h, u) dh` for almost every `u` (Gneiting (2002), Theorem 1, p. 592;
  Handbook, (23.9), pp. 430–431). Route: Bochner on `ℝ^{d+1}` and Fubini: the spectral density
  of `C`, which exists by integrability, is the time-Fourier transform of `F_ω`. The partial
  transform is junk for the null set of `u` at which `C(·, u)` is not integrable, which is why
  the agreement is almost everywhere.
- **The damping criterion** (`isPositiveDefiniteSub_iff_forall_exp_mul`): a real `C` on
  `ℝ^d × ℝ` is positive definite iff `e^{−a‖h‖−b|u|} C(h, u)` is positive definite for all
  `a, b > 0` (Gneiting (2002), p. 592). Route: products with the positive definite
  `e^{−a‖h‖}e^{−b|u|}` (3.3) and the pointwise limit `a, b → 0`. No regularity of `C` is
  used; Gneiting states the criterion for continuous, bounded, symmetric `C`, for which the
  damped functions are also integrable, so that the Cressie–Huang criterion applies to them.

**Checks.**

- The separable `C(h, u) = e^{−‖h‖²}e^{−u²}` satisfies the criterion with
  `F_ω(u) = π^{d/2} e^{−‖ω‖²/4} e^{−u²}`.
- Negative control: `C(h, u) = e^{−‖h‖²}(1 − 3u²)e^{−u²}` has
  `F_ω(u) = π^{d/2} e^{−‖ω‖²/4}(1 − 3u²)e^{−u²}`, which is positive definite for no `ω`: its
  integral over `u` is `π^{d/2} e^{−‖ω‖²/4} · (−√π/2) < 0`, so its spectral density is negative at
  frequency `0`; accordingly `C` is not positive definite.

### 6.2 Gneiting's nonseparable covariances

- **Gneiting's construction** (`isPositiveDefiniteSub_gneiting`): for `φ` continuous completely
  monotone, `ψ` continuous and positive on `[0, ∞)` and differentiable on `(0, ∞)` with
  completely monotone derivative, and `σ² > 0`,
  `C(h, u) = σ² ψ(u²)^{−d/2} φ(‖h‖²/ψ(u²))` is positive definite on `ℝ^d × ℝ` (Gneiting (2002),
  Theorem 2, (11), p. 593; Handbook, (23.12), p. 432). Route: Bernstein's theorem writes `φ` as a
  mixture of `e^{−r t}`; for each `r` the function
  `ψ(u²)^{−d/2} e^{−r‖h‖²/ψ(u²)}` is, as a function of `h`, a Gaussian whose spatial Fourier
  transform `e^{−ψ(u²)‖ω‖²/(4r)}` is positive definite in `u`, because `ψ(u²)` is a Bernstein
  function of `u²` and so `u ↦ ψ(u²)` is conditionally negative definite (5.2); then 6.1 and
  1.4's mixtures.
- **The parametric family** (`isPositiveDefiniteSub_gneiting_family`): with
  `φ(t) = e^{−ct^γ}`, `ψ(t) = (at^α + 1)^β`, `a, c ≥ 0`, `α, γ ∈ (0, 1]`, `β ∈ [0, 1]`; `β = 0` is
  the separable case and `β` measures space–time interaction (Gneiting (2002), (14), p. 593;
  Handbook, (23.13), p. 432, which takes `β ∈ (0, 1]`).

**Checks.**

- On random space–time point sets in `ℝ² × ℝ` with `φ(t) = e^{−t}`, `ψ(t) = 1 + t`, the
  covariance matrices have smallest eigenvalue `0.0064` over two hundred trials; without the
  factor `ψ(u²)^{−d/2}` the smallest eigenvalue is `−2.85`: negative control, the factor is
  necessary.
- `β = 0`: `C(h, u) = σ² e^{−c‖h‖^{2γ}}`, constant in `u`, which is positive definite.
- Negative control: the Handbook, p. 432, lists `ψ(r) = log(ar^α + 1)`, which vanishes at `0`
  and makes `C(h, 0)` undefined; Gneiting (2002), Table 2, p. 591, uses `log(at^α + b)/log b`
  with `b > 1`, which is positive.

### Dependencies

Layers 1–3, 5; Tau Ceti `TauCeti.bochner_charFun`, `TauCeti.hausdorff_bernstein_widder`.

## Layer 7: correlations on spheres

### 7.1 Schoenberg's theorem on spheres

- `sphereKernel d ψ`, the kernel `ψ(arccos ⟪x, y⟫)` on `S^d ⊂ ℝ^{d+1}`; `sphereClass d = Ψ_d`, the
  `ψ` continuous on `[0, π]` with `ψ(0) = 1` and `sphereKernel d ψ` positive semidefinite;
  `strictSphereClass d = Ψ_d⁺`, with `(sphereKernel d ψ).PosDef`; `sphereClassInf = Ψ_∞` and
  `strictSphereClassInf = Ψ_∞⁺`, the intersections over `d ≥ 1`. Mathlib's `Matrix.PosDef` over
  the infinite index type quantifies over finitely supported vectors, which is strict positive
  definiteness at distinct points.
- `zonalPolynomial (d + 1) n` is the normalized Gegenbauer polynomial
  `C_n^{((d−1)/2)}(x)/C_n^{((d−1)/2)}(1)` for `d ≥ 2`, the Chebyshev polynomial `T_n` for `d = 1`
  (so `T_n(cos θ) = cos nθ`, Schoenberg's convention `C_n^0(cos θ) = cos nθ`), and the Legendre
  polynomial `P_n` for `d = 2`.
- **Schoenberg's theorem** (`mem_sphereClass_iff`): for `d ≥ 1`, `ψ ∈ Ψ_d` iff
  `ψ(θ) = ∑ b_{n,d} ω_{d+1,n}(cos θ)` on `[0, π]` with `b_{n,d} ≥ 0` and `∑ b_{n,d} = 1`
  (Gneiting (2013), Theorem 1(a), p. 1332, (13)–(15), p. 1333, after Schoenberg (1942)). Route:
  the addition theorem of the higher-spheres roadmap (§4.1) makes each `ω_{d+1,n}(⟪x, y⟫)` a
  positive semidefinite kernel; conversely the Funk–Hecke formula (§4.3) shows that
  `b_{n,d} = λ_n(ψ ∘ arccos)·dim H_n` is the integral of the kernel against the reproducing kernel
  of `H_n`, hence nonnegative, and `∑ b_{n,d} = ψ(0) = 1` by Abel summation and positivity.
- **Uniqueness** (`eq_of_hasSum_zonalPolynomial`) of the coefficients, from the orthogonality of
  the zonal polynomials (the higher-spheres roadmap, §4.2).
- **All spheres** (`mem_sphereClassInf_iff`): `ψ ∈ Ψ_∞` iff `ψ(θ) = ∑ b_n (cos θ)^n` with
  `b_n ≥ 0`, `∑ b_n = 1` (Gneiting (2013), Theorem 1(b), p. 1333). Route: `⟪x, y⟫^n` is positive
  semidefinite on every sphere (Schur products of the Gram kernel); conversely the
  coefficients of `ω_{d+1,n}` converge to those of `x^n` as `d → ∞`.

**Checks.**

- `d = 2`, `ψ(θ) = cos θ = P_1(cos θ)`: `b_{1,2} = 1`. Negative control: Gneiting (2013), (15),
  p. 1333, prints the Legendre series as `∑ b_{n,2}(n + 1)⁻¹ P_n(cos θ)`; with it, `ψ(0) = 1/2`.
  Its own (11) gives `∑ b_{n,2} P_n(cos θ)`, since `C_n^{1/2}(1) = 1`.
- `d = 1`: `b_{0,1} = π⁻¹∫₀^π ψ` and `b_{n,1} = 2π⁻¹∫₀^π cos(nθ) ψ(θ) dθ` (Gneiting (2013), (14),
  p. 1333); for `ψ(θ) = e^{−θ}`, `b_{n,1} = 2(1 − (−1)^n e^{−π})/(π(1 + n²)) > 0` for `n ≥ 1`, with
  `b_{0,1} = 0.30455`, `b_{1,1} = 0.33207` and `b_{11,1} = 0.00544`.
- The chordal Gaussian `e^{−4 sin²(θ/2)} = e^{−2} e^{2 cos θ}` has `b_n = e^{−2} 2^n/n! > 0`,
  summing to `1`; at `θ = 1.1` the series gives `0.33527`.

### 7.2 Strict positive definiteness

- **On `S^d`, `d ≥ 2`** (`mem_strictSphereClass_iff`): a series with nonnegative coefficients
  summing to `1` lies in `Ψ_d⁺` iff infinitely many even and infinitely many odd `b_{n,d}` are
  positive (Gneiting (2013), Theorem 1(a), p. 1332, after Chen, Menegatto and Sun).
- **On the circle** (`mem_strictSphereClass_one_iff`): `ψ = ∑ b_{n,1} cos nθ` lies in `Ψ_1⁺` iff
  for any `0 ≤ j < n` some `b_{m,1}` with `m ≡ j` or `m ≡ −j (mod n)`, `m ≥ 0`, is positive; that
  is, the set `{m ∈ ℤ : b_{|m|,1} > 0}` meets every residue class `j + nℤ` (Gneiting (2013),
  Theorem 1(a), p. 1332, after Menegatto, Oliveira and Peron). Gneiting prints the condition with
  `b_{j+kn,1}`, `k ≥ 0`, only, which is sufficient but not necessary: it misses the reflected
  class `−j + nℤ`. Route: the quadratic form at points `θ₁, …, θ_N` is
  `∑_{m ∈ ℤ} (b_{|m|,1}/2)|∑ᵢ cᵢ e^{imθᵢ}|²` up to the factor `2` at `m = 0`; if the positive
  indices meet every class, its vanishing forces `∑ᵢ cᵢ e^{imθᵢ} = 0` on a set of `m` meeting
  every class, hence `c = 0`; if they miss `j + nℤ`, the `n`th roots of unity with
  `cₗ = e^{−2πijl/n}` give the form `0`.
- **On all spheres** (`mem_strictSphereClassInf_iff`): the even/odd criterion with the `b_n`
  (Gneiting (2013), Theorem 1(b), p. 1333).

**Checks.**

- Negative control on the circle: `ψ(θ) = cos 2θ` has only `b_{2,1} = 1`; for `j = 1`, `n = 2` no
  `b_{1+2k,1}` is positive, and at the antipodal points `0`, `π` the kernel is
  `[[1, 1], [1, 1]]`, singular.
- The reflected class matters: with `b_{m,1} ∝ 2^{−m}` for `m ≡ 0, 1 (mod 3)` and `b_{m,1} = 0`
  for `m ≡ 2`, Gneiting's printed condition fails at `j = 2`, `n = 3`, but `−1 ≡ 2` and
  `b_{1,1} > 0`; at the three cube roots of unity the kernel has eigenvalues `0.5, 0.5, 2`, and
  on two hundred random sets of two to eight points the smallest eigenvalue is positive. With
  `b_{m,1} = 0` unless `3 ∣ m`, the kernel at the cube roots of unity is singular.
- Negative control for `d ≥ 2`: `ψ = (1 + cos θ)/2 ∈ Ψ_2` has finitely many positive
  coefficients; on five random points of `S²` its kernel has smallest eigenvalue `0` to rounding
  (rank at most `4`).

### 7.3 Closure properties

- **Convexity and products** (`convex_sphereClass`) and **limits** (`mem_sphereClass_of_tendsto`):
  `Ψ_d` is convex, closed under products and under pointwise limits on `[0, π]` with continuous
  limit (Gneiting (2013), p. 1332, after Schoenberg). Route: sums and Schur products of positive
  semidefinite kernels (Tau Ceti's `TauCeti.IsPositiveDefiniteSub.mul` in kernel form) and
  pointwise limits of finite quadratic forms.
- **The intersections.** `Ψ_∞` inherits each of these properties by intersection over `d`.
  `Ψ_d⁺` and `Ψ_∞⁺` are not closed under limits: the constant `1` is the limit of
  `e^{−θ/k} ∈ Ψ_∞⁺` as `k → ∞` and is not strictly positive definite.

### 7.4 From Euclidean space to the sphere

- **Chordal distance** (`comp_chordal_mem_sphereClass`): for `k ≥ 2` and `φ ∈ Φ_k`,
  `θ ↦ φ(2 sin(θ/2))` lies in `Ψ_{k−1}`, and in `Ψ_{k−1}⁺` if `φ` is not constant (Gneiting
  (2013), (7), p. 1331, after Yadrenko). Route: `‖x − y‖ = 2 sin(θ(x, y)/2)` on `S^{k−1}`, so the
  kernel is the restriction of `φ(‖x − y‖)`; strictness from 3.1.
- **Compact support in great-circle distance** (`mem_strictSphereClass_three_of_eq_zero`): if
  `φ ∈ Φ_3` and `φ(t) = 0` for `t ≥ π`, then `φ` restricted to `[0, π]` lies in `Ψ_3⁺`
  (Gneiting (2013), Theorem 3, p. 1338).
- **Completely monotone functions** (`comp_div_mem_strictSphereClassInf`): if `φ` is continuous
  completely monotone and not constant with `φ(0) = 1`, then `θ ↦ φ(θ/c)` lies in `Ψ_∞⁺` for every
  `c > 0` (Gneiting (2013), Theorem 7, p. 1343, and p. 1344). Route: Bernstein's theorem makes
  `φ(θ/c)` a mixture of `e^{−aθ}`, each in `Ψ_∞⁺`, with mixing measure not concentrated at `0`.
- **Powered exponential** (`exp_neg_rpow_mem_sphereClass`): `e^{−(θ/c)^α}` lies in `Ψ_∞⁺` for
  `α ∈ (0, 1]` and in no `Ψ_d` for `α > 1` (Gneiting (2013), Example 1, p. 1345, by Theorem 8,
  p. 1344).
- **Matérn** (`maternCorrelation_mem_sphereClass`): `φ_{ν,c}` in great-circle distance lies in
  `Ψ_∞⁺` for `ν ∈ (0, 1/2]` and in no `Ψ_d` for `ν > 1/2` (Gneiting (2013), Example 2,
  p. 1345). Route: 4.1's complete monotonicity and the previous bullets; for `ν > 1/2`,
  Gneiting's Theorem 8, p. 1344, from the behaviour of `φ_{ν,c}` at `0` and `π`.

**Checks.**

- Negative control: `e^{−θ²}` (`α = 2`) has cosine coefficient `b_{8,1} = −2.0 · 10⁻⁶ < 0`, and on
  sixteen equally spaced points of the circle its kernel has smallest eigenvalue
  `−4.4 · 10⁻⁵`.
- Negative control: the Matérn correlation with `ν = 3/2`, `c = 1`, in great-circle distance has
  `b_{6,1} = −0.0014 < 0`, while in chordal distance it lies in every `Ψ_d⁺` by the first bullet.
- `e^{−θ}` on thirty random points of `S²` has smallest kernel eigenvalue `0.058 > 0`.

### Dependencies

Layers 1, 3, 4; the higher-spheres roadmap, §§3.1, 4.1–4.3; LaguerreJacobi §6.2 through it;
Tau Ceti `TauCeti.hausdorff_bernstein_widder`; Mathlib `Polynomial.Chebyshev.T`.

## Downstream consumers

Within the spatial-statistics family of roadmaps:
- GaussianFieldsSupremaAndExcursions takes second-order fields, stationarity, mean-square
  continuity and the stationary increment identity (1.1, 1.3, 1.5) for the canonical metric,
  the spectral measure (2.1) for its spectral continuity criterion, and mean-square derivatives
  with the derivative covariance (2.3) for the second spectral moment of Rice's formula and the
  excursion-set formulas;
- SpatialLinearPredictionAndLikelihood takes second-order fields, second-order and intrinsic
  stationarity and the semivariogram (1.1, 1.3), conditional negative definiteness with the
  variance identity for contrasts (5.1) and the realization of semivariograms by Gaussian fields
  (5.2) for kriging with a variogram and for variogram estimation;
- EquivalenceOfGaussianMeasuresAndInfillAsymptotics takes second-order and stationary fields,
  the existence and uniqueness of Gaussian field laws (1.1–1.3), spectral measures and densities
  (2.1) and the Matérn correlation and spectral measure (4.1);
- GaussianMarkovRandomFieldsAndTheSPDELink takes second-order fields, stationarity and
  mean-square continuity (1.1, 1.3, 1.5), stationary Gaussian fields with given covariance (1.4),
  uniqueness of the spectral measure (2.1) and the Matérn correlation and spectral measure (4.1);
- SpatialCoxAndClusterProcesses takes Gaussian fields with given mean and covariance and the
  stationarity notions (1.1–1.3) for log-Gaussian Cox processes, and the simplex bound (3.2) for
  their pair correlations;
- SpatialPointPatternStatistics takes second-order stationary fields and their covariance
  (1.1, 1.3) for the directing fields of reweighted and space–time Cox processes;
- DeterminantalPointProcesses takes the Matérn spectral density and correlation (4.1) for its
  Whittle–Matérn model (7.3).

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Second-order and Gaussian fields.** Positive semidefiniteness of covariance kernels;
   existence and uniqueness of the law of a Gaussian field with given mean and covariance; the
   three stationarity notions and their relations; the elementary properties, continuity
   estimate and closure properties of stationary covariances, and their identification with the
   real positive definite functions; mean-square continuity.
2. **Spectral theory.** The spectral measure of a stationary covariance and its density; the
   lattice form on `ℤ^d`; the spectral representation and its converse, with the conjugate
   symmetry of real fields; mean-square differentiability, the derivative process, and the
   Cauchy example.
3. **Isotropic correlations.** Schoenberg's theorem on `ℝ^d` with uniqueness, identification and
   radial density; strict nesting and strict positive definiteness; the lower bounds and
   rigidity; the characterizations of `Φ_∞`, its properties and the Gaussian limit; completely
   monotone correlations, the powered exponential and generalized Cauchy families; Pólya's
   criterion, truncated powers and the triangular function.
4. **The Matérn family.** Its spectral measure and membership in `Φ_∞`; half-integer closed
   forms; the Gaussian limit; complete monotonicity; mean-square smoothness, small-lag order and
   principal irregular terms.
5. **Variograms.** The properties, closure, continuity and growth of semivariograms; the
   Schoenberg–von Neumann theorem with the Lévy–Khintchine form; realization by Gaussian fields;
   power variograms.
6. **Space–time.** The Cressie–Huang and damping criteria; Gneiting's construction and family.
7. **Spheres.** Schoenberg's theorem on `S^d` and on all spheres with uniqueness; the strict
   positive definiteness criteria; closure; the chordal and great-circle constructions, the
   completely monotone, powered exponential and Matérn families on spheres.

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- Bochner's theorem on finite-dimensional inner-product spaces and on discrete abelian groups,
  Herglotz's theorem, Fourier inversion for measures, the Hausdorff–Bernstein–Widder theorem,
  the Gaussian kernel, products and limits of positive definite functions, and the Kolmogorov
  feature map: Tau Ceti;
- the K-Bessel kernel: AnalyticNumberTheoryPartI §2.1a; its half-odd orders, small-argument
  expansions and agreement with the DLMF `K_ν`: SpecialFunctionsBessel §§2.1–2.3, 5.1;
- the zonal Bessel function and the Fourier transform of radial functions: the roadmap on
  Euclidean motion groups and Bessel functions, §§5.3 and 6.1; the zonal polynomials, the
  addition theorem, orthogonality and the Funk–Hecke formula: the roadmap on higher spheres,
  §§3.1, 4.1–4.3; Gegenbauer polynomials: LaguerreJacobi §6.2;
- Gaussian scale-mixture kernels: KernelsAndSpectralMethods 8.2;
- isonormal Gaussian processes: WienerChaosAndMalliavinCalculus 1.1;
- Schoenberg's theorem that `e^{−tψ}` is positive definite for conditionally negative definite
  `ψ`: FactorRigidity §4.1.

**Boundaries with the family.** The existence theorem of Kolmogorov for consistent families of
finite-dimensional laws in general is StochasticCalculus's (1.1), and this roadmap needs only its
Gaussian case, through 1.2. Sample-path continuity, suprema, Dudley's bound, Fernique's theorem,
the Borell–TIS inequality, Rice formulas and excursion sets belong to
GaussianFieldsSupremaAndExcursions. Kriging, likelihood and variogram estimation belong to
SpatialLinearPredictionAndLikelihood, and equivalence of Gaussian measures to
EquivalenceOfGaussianMeasuresAndInfillAsymptotics.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Probability:** `IsGaussianProcess`, `HasLaw`, `IndepFun`, `cov[·, ·; ·]`, `Var[·; ·]`,
  `ProbabilityTheory.multivariateGaussian` with
  `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian`, `cauchyMeasure`,
  `ProbabilityTheory.gammaMeasure`.
- **Characteristic functions:** `charFun`, `MeasureTheory.Measure.ext_of_charFun`,
  `MeasureTheory.contDiff_charFun`, `MeasureTheory.iteratedDeriv_charFun`.
- **Analysis:** `MeasureTheory.Lp` and `indicatorConstLp`, `Matrix.PosSemidef`, `Matrix.PosDef`,
  `Complex.besselJ`, `Real.Gamma`, `Polynomial.Chebyshev.T`, `Real.arccos`,
  `Asymptotics.IsTheta`, `TendstoUniformlyOn`, `ConvexOn`.

### From Tau Ceti

- **Positive definite functions** (`TauCeti/Analysis/PositiveDefinite/`):
  `TauCeti.IsPositiveDefiniteSub`, `TauCeti.isPositiveDefiniteSub_iff_posSemidef`,
  `TauCeti.IsPositiveDefiniteSub.mul`, `TauCeti.IsPositiveDefiniteSub.of_tendsto`, and the
  Kolmogorov feature map `Matrix.PosSemidef.kolmogorovFeature` with
  `Matrix.PosSemidef.inner_kolmogorovFeature`.
- **Bochner and Herglotz** (`TauCeti/Analysis/Bochner/`): `TauCeti.bochner_charFun`,
  `TauCeti.isPositiveDefiniteSub_charFun`,
  `TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq`,
  `TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq` (Herglotz),
  `MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun`,
  `TauCeti.posSemidef_cexp_neg_mul_sq_norm`.
- **Complete monotonicity** (`TauCeti/Analysis/CompletelyMonotone/`):
  `TauCeti.IsCompletelyMonotoneOnIoi`, `TauCeti.IsContinuousCompletelyMonotoneOnIoi`,
  `TauCeti.hausdorff_bernstein_widder`.

### From AnalyticNumberTheoryPartI

[AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §2.1a owns the K-Bessel
kernel for complex order and positive argument, with its cosh form, positivity for real order
and the value at order `1/2`. Local copy `positiveAxisBesselK`.

### From SpecialFunctionsBessel

[SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) supplies: §2.1, the Frobenius
expansions of `K_ν` at `0`, logarithmic cases included; §2.2, its leading behaviour as `z → 0`;
§2.3, the half-odd orders; §5.1, the cosh form and the agreement of the DLMF `K_ν` with the
kernel of AnalyticNumberTheoryPartI on the positive axis, through which these statements apply to
`positiveAxisBesselK`.

### From LaguerreJacobi

[LaguerreJacobi](../LaguerreJacobi/README.md) §6.2 owns the Gegenbauer polynomials
`C_n^{(λ)}`, to which the zonal polynomials of 7.1 are related by the higher-spheres roadmap
(§3.1). This roadmap uses them only through that relation.

### From KernelsAndSpectralMethods

[KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) 8.2 supplies the positive
semidefiniteness of Gaussian scale-mixture kernels `∫ e^{−t‖x − y‖²} dρ(t)`, used in 3.3.

### From WienerChaosAndMalliavinCalculus

[WienerChaosAndMalliavinCalculus](../WienerChaosAndMalliavinCalculus/README.md) 1.1 supplies an
isonormal Gaussian process on every real inner-product space, with its laws and linearity, used
in 1.2.

### From FactorRigidity

[FactorRigidity](../FactorRigidity/README.md) §4.1 owns conditionally negative definite
functions on groups and Schoenberg's theorem that `e^{−tψ}` is positive definite for `t > 0`,
used in 5.2 on the additive group `ℝ^d`.

### From the roadmap on higher spheres (SpecialFunctionsHigherSpheres)

Its §3.1 owns the zonal polynomials `ω_{n,l}` with their value `1` at `t = 1`, their Chebyshev and
Legendre cases and their relation to the Gegenbauer polynomials (local copy `zonalPolynomial`);
7.1 uses the value at one for `∑ b_{n,d} = ψ(0) = 1`. Its §4.1 owns the addition theorem
and reproducing kernel, §4.2 orthogonality, and §4.3 the Funk–Hecke formula; all are stated for
`n ≥ 2` and used in 7.1 with `n = d + 1`.

### From the roadmap on Euclidean motion groups (SpecialFunctionsMotionGroupsBessel)

Its §6.1 owns the zonal Bessel function `Ω_n(λ, r)` (local copy `besselZonal`), its Bessel form,
and its identification with the mean of `e^{iλ⟨a, ξ⟩}` over `S^{n−1}` for `n ≥ 1`; its §5.3 owns
the Fourier transform of radial functions on `ℝⁿ` for `n ≥ 1`. Both are used in 3.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Generalized random fields and intrinsic random functions of order `k`**: Matheron's
  generalized covariances, conditionally positive definite functions of higher order, and
  random fields indexed by test functions.
- **Anisotropy and multivariate fields**: geometric and zonal anisotropy beyond linear
  substitution, cross-covariances, the linear model of coregionalization and multivariate
  Matérn models.
- **Further covariance classes**: Wendland and Askey functions beyond the truncated powers,
  the Dagum family, covariances on manifolds other than spheres and on graphs, and
  space–time covariances on spheres.
- **Schoenberg's metric-embedding theorem** and the theory of conditionally negative definite
  kernels on metric spaces; no local source states it.
- **Spectral theory of non-stationary fields**: Karhunen–Loève expansions, oscillatory and
  harmonizable processes.

## Prior formalization

[lean-MSSS](https://github.com/bjbraams/lean-MSSS) (commit `6826ba2`, Apache-2.0), by the author
of this roadmap, states most targets of this roadmap in `MSSS/RandomFields/`, in its own form.
Judged from the source text, with dependencies followed inside `MSSS/RandomFields/`, it proves
the following without `sorry`:
- 1.1 and 1.2 (covariance kernels; existence and uniqueness of Gaussian laws):
  `MSSS/RandomFields/Basic.lean`;
- the mixture bullet of 1.4, and all of Layer 6: `MSSS/RandomFields/SpaceTime.lean`;
- in 2.2, the existence of the spectral representation (without the uniqueness conjunct) and the
  covariance identity of the converse; in 2.3, the derivative process and the Cauchy example:
  `MSSS/RandomFields/Spectral.lean`;
- in 3.3, completely monotone correlations, and the powered exponential and generalized Cauchy
  families for `0 < α ≤ 1` only; in 3.4, the triangular function:
  `MSSS/RandomFields/Isotropic.lean`;
- all of 4.1, and in 4.2 the principal irregular terms and the small-lag order (the upper bound,
  and at `ν = 1` a weaker lower bound): `MSSS/RandomFields/Matern/Basic.lean` and
  `MSSS/RandomFields/Matern.lean`;
- in 5.2, realization by Gaussian fields and power variograms: `MSSS/RandomFields/Variogram.lean`;
- 7.3 for `Ψ_d` and `Ψ_∞`: `MSSS/RandomFields/Sphere.lean`.

Schoenberg's theorems on `ℝ^d` and on spheres, the characterizations of `Φ_∞`, the strict
positive definiteness results on `ℝ^d`, on `S^d` for `d ≥ 2` and on all spheres, Pólya's
criterion and truncated powers, the equivalence of 2.3 and its Matérn case in 4.2, and the
Schoenberg–von Neumann theorem are stated there with `sorry`. The conjugate symmetry of 2.2, the
mean-square-continuity and realness conjuncts of its converse, 1.3, the bullets of 1.4 other
than mixtures, 1.5, 2.1, 3.2, 5.1, the circle criterion of 7.2 and 7.4 are not stated there.

The design differs in three places: lean-MSSS defines `K_ν` by its own cosh integral, where 4.1
uses the kernel of AnalyticNumberTheoryPartI; it defines `Ω_d` through `J_{(d−2)/2}` and
Gegenbauer polynomials by their recurrence, where 3.1 and 7.1 use the zonal functions of the
motion-group and higher-spheres roadmaps; and its Matérn correlation is not even in `t`.

## References

The locators refer to these editions; page numbers are printed page numbers.

- R. J. Adler and J. E. Taylor, *Random Fields and Geometry*, Springer Monographs in
  Mathematics, Springer, 2007.
- J.-P. Chilès and P. Delfiner, *Geostatistics: Modeling Spatial Uncertainty*, 2nd ed., Wiley,
  2012.
- N. Cressie, *Statistics for Spatial Data*, revised ed., Wiley, 1993.
- C. Gaetan and X. Guyon, *Spatial Statistics and Modeling*, Springer Series in Statistics,
  Springer, 2010.
- A. E. Gelfand, P. J. Diggle, M. Fuentes and P. Guttorp (eds.), *Handbook of Spatial
  Statistics*, CRC Press, 2010; chapter 2 by T. Gneiting and P. Guttorp, chapter 23 by
  T. Gneiting and P. Guttorp.
- T. Gneiting, Nonseparable, stationary covariance functions for space–time data, *Journal of
  the American Statistical Association* 97 (2002), 590–600.
- T. Gneiting, Strictly and non-strictly positive definite functions on spheres, *Bernoulli* 19
  (2013), 1327–1349.
- B. Matérn, *Spatial Variation*, 2nd ed., Lecture Notes in Statistics 36, Springer, 1986.
- E. Spodarev (ed.), *Stochastic Geometry, Spatial Statistics and Random Fields: Asymptotic
  Methods*, Lecture Notes in Mathematics 2068, Springer, 2013; chapter 9 by A. Bulinski and
  E. Spodarev.
- M. L. Stein, *Interpolation of Spatial Data: Some Theory for Kriging*, Springer Series in
  Statistics, Springer, 1999.
- M. N. M. van Lieshout, *Theory of Spatial Statistics: A Concise Introduction*, Chapman and
  Hall/CRC, 2019.

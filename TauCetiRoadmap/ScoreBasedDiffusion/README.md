# Roadmap: score-based diffusion in continuous time

**Summary.** This roadmap develops the continuous-time theory of score-based diffusion models on
`ℝ^d` as far as it can be stated with explicit Gaussian kernels, without stochastic integrals.
The data law `μ₀` is an arbitrary probability measure on `ℝ^d`, with no density and no moment
assumed. A noising path is a pair of real functions of time, the signal level `c` and the noise
level `s`: at time `t` the data are observed as `X_t = c(t) X₀ + s(t) Z`, with `Z` standard
Gaussian and independent of `X₀`. The main example is the variance-preserving path `c = α`,
`s = √(1 − α²)` with `α(t) = exp(−½ ∫₀ᵗ β)`. Where `s(t) > 0` the law of `X_t` has a smooth
positive density `p_t`, with score `∇ log p_t`. The headline theorems are these.

- *Fokker–Planck.* Let `μ₀` be a finite measure and let `c`, `s` be differentiable at `t` with
  `c(t) ≠ 0` and `s(t) > 0`. Then at every point `x`, `t ↦ p_t(x)` is differentiable at `t` and
  `∂ₜp = −a ∇·(x p) + (G/2) Δp`, with `a = c′/c` and `G = 2(s s′ − s² c′/c)`. For the
  variance-preserving path with continuous `β` this reads `∂ₜp = (β/2)(∇·(x p) + Δp)`, at every
  time with `∫₀ᵗ β > 0`.
- *The score.* For every data law, every `c ≠ 0` and every `s > 0`, at every point `x`:
  `∇ log p(x) = (c m(x) − x)/s²`, and the derivative of the score is `((c²/s²) Σ(x) − I)/s²`,
  where `m(x)` and `Σ(x)` are the mean and the covariance of the posterior law of `X₀` given the
  observation `x`; for `c = 0` the score is `−x/s²`. If moreover the data lie in the closed ball
  of radius `R`, then for every `c`, `‖∇ log p(x)‖ ≤ (‖x‖ + |c| R)/s²` and
  `∇² log p ≤ (c² R²/s⁴ − 1/s²) I`.
- *Time reversal.* Let `c`, `s` be differentiable at `r` with `c(r) ≠ 0` and `s(r) > 0`, and fix
  a second level `(c₂, s₂)` with `(c₂/c(r))² s(r)² < s₂²`. Let `(X_r, X₂)` have the law of `X_r`
  followed by the Gaussian transition kernel to the second level. For `f` of class `C²` with
  compact support and `g` bounded and measurable, `E[f(X_r) g(X₂)]` is differentiable in `r` with
  derivative `−E[(A f)(X_r) g(X₂)]`, where `A f = ⟨−a x + G ∇ log p_r, ∇f⟩ + (G/2) Δf` is the
  generator of Anderson's reverse-time equation.

The roadmap continues the denoising-diffusion roadmap, which works in discrete time; its smoothed
density, score, Tweedie formula, score-matching identity and forward chain are consumed. The
analysis rests on the heat-kernel and Gaussian-measure libraries of Tau Ceti. The
stochastic-calculus roadmap owns stochastic differential equations; no statement below uses a
solution of one. The optimal-transport roadmap owns the Fokker–Planck equation as a gradient flow.

Layer 1 below composes Gaussian kernels, proves the Fokker–Planck equation and bounds the distance
of the path from the data. Layer 2 expresses the score and its derivative by the posterior law,
bounds them for bounded data, and integrates the score-matching identity over time. Layer 3
defines two-time laws and backward kernels and proves the time-reversal theorem.

## Conventions

- `d : ℕ` and `E = EuclideanSpace ℝ (Fin d)`, with its Borel σ-algebra and Lebesgue measure
  `volume`. The data law is a measure `μ₀` on `E`; Layer 1 assumes it finite where it says so,
  and Layers 2 and 3 assume a probability measure.
- **Isotropic Gaussians.** `N(m, v) := multivariateGaussian m (v • 1)` for `m : E` and `v ≥ 0`;
  `N(m, 0)` is `dirac m`. For `v > 0`,
  `φ_v(y) := multivariateGaussianPDFReal 0 (v • 1) y = (2πv)^(−d/2) exp(−‖y‖²/(2v))`.
- **Levels.** A level is a pair `(c, s)` of real numbers with `s ≥ 0`: the signal level and the
  noise level. The law of the data at level `(c, s)` is `μ₀.bind (gaussianKernel c (s ^ 2))`,
  the law of `c • X + s • Z` for `X` of law `μ₀` and an independent standard Gaussian `Z`. For
  `s > 0` its density is `p = smoothedDensity μ₀ c s`, with
  `smoothedDensity μ₀ c s y = ∫ φ_{s²} (y − c • x) ∂μ₀ x`, and its score is
  `noisyScore μ₀ c s = ∇ log p`. These three notions are those of DenoisingDiffusion 1.2 and 3.1.
- **Noising paths.** A noising path is a pair of functions `c s : ℝ → ℝ`. A statement at time `t`
  assumes that `c` and `s` have derivatives `c′` and `s′` at `t`, that `c t ≠ 0` and that
  `s t > 0`. Its drift coefficient is `a = c′/c` and its diffusion coefficient is
  `G = 2(s s′ − s² c′/c)`, both evaluated at `t`. When `G ≥ 0` these are the coefficients of the
  linear equation `dX = a X dt + √G dB`; that equation is named for orientation only.
- **The variance-preserving path.** For a continuous `β : ℝ → ℝ`, `vpSignal β t` is
  `α t = exp (−(1/2) ∫₀ᵗ β)` and `vpNoise β t` is `σ t = √(1 − (α t)²)`. Where `∫₀ᵗ β > 0` its
  coefficients are `a = −β t/2` and `G = β t`. The variance-exploding path is `c = 1`, `s = σ`
  for a function `σ`, with `a = 0` and `G = (σ²)′`. The sub-variance-preserving path is `c = α`,
  `s = 1 − α²`, with `a = −β/2` and `G = β (1 − exp (−2 ∫₀ᵗ β))`.
- **Derivatives.** `∇` is Mathlib's `gradient`, `Δ` is `Laplacian.laplacian`, and `⟪·, ·⟫` is the
  inner product of `E`. The divergence of the field `y ↦ p y • y` is written out as
  `∇·(y p) = d * p y + ⟪y, ∇ p y⟫`. A time derivative is a `HasDerivAt` statement at one time and
  one point.
- **Extended integrals.** The objectives of 2.3 are lower integrals `∫⁻` with values in
  `[0, ∞]`, so that no integrability is needed to state them.

## Layer 1: Gaussian noising paths and their Fokker–Planck equation

### 1.1 Composition of Gaussian kernels

`gaussianKernel c v : Kernel E E` is the kernel `x ↦ N(c • x, v)` of DenoisingDiffusion 1.2.
Prove, for `c c′ : ℝ` and `v, v′ ≥ 0`,

    gaussianKernel c′ v′ ∘ₖ gaussianKernel c v = gaussianKernel (c′ * c) (c′ ^ 2 * v + v′)

(`gaussianKernel_comp`), from the convolution and affine-image laws of Gaussian measures. The
variance-preserving case `c = √a`, `v = 1 − a` is DenoisingDiffusion 2.1. Consequences:

- **the law at a level.** In the Gaussian observation model of DenoisingDiffusion, `c • X + s • Z`
  has the law `μ₀.bind (gaussianKernel c (s ^ 2))`; so for `s > 0` and a probability measure
  `μ₀` this law is `volume.withDensity (fun y ↦ ENNReal.ofReal (smoothedDensity μ₀ c s y))`, by
  DenoisingDiffusion 3.1;
- **transition kernels.** For levels `(c₁, s₁)` and `(c₂, s₂)` with `c₁ ≠ 0` and
  `(c₂/c₁)² s₁² ≤ s₂²`, the kernel
  `K = gaussianKernel (c₂ / c₁) (s₂ ^ 2 − (c₂ / c₁) ^ 2 * s₁ ^ 2)` satisfies
  `K ∘ₖ gaussianKernel c₁ (s₁ ^ 2) = gaussianKernel c₂ (s₂ ^ 2)`, so it carries the law of the
  data at the first level to the law at the second, for every `μ₀`;
- **the Chapman–Kolmogorov property.** For three levels with `c₁, c₂ ≠ 0` and
  `(c₂/c₁)² s₁² ≤ s₂²`, `(c₃/c₂)² s₂² ≤ s₃²`, the transition kernel from the first to the third is
  the composition of the other two. Hence a noising path with `c > 0` and `s/c` nondecreasing has
  a transition kernel between any two of its times, and these compose;
- **the variance-preserving semigroup.** If `∫ β ≥ 0` over `[0, r]` and over `[r, t]`, the
  transition kernel of the variance-preserving path from time `r` to time `t` is
  `x ↦ N(√b • x, 1 − b)` with `b = exp (−∫ β)` over `[r, t]`, the noising kernel of
  DenoisingDiffusion 2.1 at the level `b`.

(Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole 2021, Appendix B, equation (29), for the
kernels of the three named paths; the composition law is proved here.)

**Checks.**

- `c = 0.7`, `v = 0.5`, `c′ = −1.3`, `v′ = 0.2`: the composite is `x ↦ N(−0.91 x, 1.045)`. In
  the other order it is `N(−0.91 x, 0.598)`, so the variance `c ^ 2 * v′ + v` is the wrong
  convention.
- `v = v′ = 0`: both kernels are deterministic and the composite is `x ↦ dirac ((c′ * c) • x)`.
- Variance-preserving path with `β = 2`: from time `0` to time `1` the kernel is
  `N(e⁻¹ x, 1 − e⁻²)`, with `e⁻¹ = 0.3679` and `1 − e⁻² = 0.8647`.
- Levels `(1.1, 0.3)`, `(0.8, 0.6)`, `(0.5, 0.9)`: the two steps have variances `0.3124` and
  `0.6694`, and `(0.5/0.8)² · 0.3124 + 0.6694 = 0.7914 = 0.81 − (0.5/1.1)² · 0.09`.

*Needs:* DenoisingDiffusion 1.2, 2.1 and 3.1; Tau Ceti
`multivariateGaussian_conv_multivariateGaussian`, `map_affine_multivariateGaussian`; Mathlib
`Kernel.comp`, `Measure.bind`.

### 1.2 The Fokker–Planck equation of a noising path

Let `μ₀` be a finite measure on `E`. Prove:

- **noise derivative.** For every `c` and every `s > 0`, `s ↦ smoothedDensity μ₀ c s y` has
  derivative `s * Δ p y` at `s`, with `p = smoothedDensity μ₀ c s`;
- **signal derivative.** For `c ≠ 0` and `s > 0`, `c ↦ smoothedDensity μ₀ c s y` has derivative
  `−(1/c) (d * p y + ⟪y, ∇ p y⟫) − (s²/c) Δ p y` at `c`;
- **the equation along a path.** If `c` and `s` have derivatives `c′` and `s′` at `t`, `c t ≠ 0`
  and `s t > 0`, then `r ↦ smoothedDensity μ₀ (c r) (s r) y` has at `t` the derivative

      −(c′ / c t) (d * p y + ⟪y, ∇ p y⟫) + (s t * s′ − (s t)² c′ / c t) Δ p y,

  with `p = smoothedDensity μ₀ (c t) (s t)` (`hasDerivAt_smoothedDensity_path`); in the notation
  of the Conventions, `∂ₜp = −a ∇·(y p) + (G/2) Δ p`;
- **the variance-preserving equation.** For a continuous `β` and a time `t` with `∫₀ᵗ β > 0`,
  `r ↦ smoothedDensity μ₀ (vpSignal β r) (vpNoise β r) y` has at `t` the derivative
  `(β t / 2) (d * p y + ⟪y, ∇ p y⟫ + Δ p y)` (`hasDerivAt_smoothedDensity_vp`); for the
  variance-exploding path the derivative is `(σ t * σ′) Δ p y`, a heat equation.

No moment of `μ₀` is assumed, and the equations hold at every point, not almost everywhere.

Route. Both sides of each equation are linear in `μ₀`, and a finite measure is zero or a multiple
of a probability measure, so `μ₀` may be taken to be a probability measure, as in
DenoisingDiffusion 3.1. By that section `φ_{s²}` is Tau Ceti's heat kernel at time `s²/2`, so
`F (c, s) x = φ_{s²} (y − c • x)` is smooth in `(c, s)` on `s > 0`, with partial derivatives
`s Δφ_{s²} (y − c • x)` in `s`, by `TauCeti.hasDerivAt_heatKernel`, and
`−⟪∇φ_{s²} (y − c • x), x⟫` in `c`. On a neighbourhood of a point `(c₀, s₀)` with `c₀ ≠ 0` and
`s₀ > 0` both are bounded uniformly in `x`: the first by
`TauCeti.exists_norm_iteratedDeriv_iteratedFDeriv_heatKernel_le`, the second because
`‖x‖ ≤ (‖y‖ + ‖y − c • x‖)/|c|` and
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp` bounds `‖∇φ_{s²} z‖` by a
Gaussian in `z`. A constant is integrable for the finite measure `μ₀`, so
`hasFDerivAt_integral_of_dominated_of_fderiv_le` differentiates under the integral in `(c, s)`
jointly, and `HasFDerivAt.comp_hasDerivAt` gives the derivative along the path. The integrals of
the partial derivatives are identified with `Δ p` and `∇ p`, which DenoisingDiffusion 3.1
computes under the integral, through the pointwise identity
`⟪z, ∇φ_v z⟫ = −v Δφ_v z − d φ_v z`, which follows from `TauCeti.laplacian_heatKernel` and
`∇φ_v z = −(1/v) φ_v z • z`. For the noise
derivative alone the domination is uniform in `x` for every `c`. The variance-preserving case
uses `intervalIntegral.integral_hasDerivAt_right` for the derivative `β t` of `∫₀ᵗ β`.

(Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole 2021, equation (5) for the forward
stochastic differential equation, equations (9), (11) and (12) for the three named paths, and
Appendix D.1, equation (35), for the Kolmogorov forward equation of a diffusion. That the
smoothed density of an arbitrary data law solves the equation at every point is proved here.)

**Checks.**

- `μ₀ = N(0, 1)` and the variance-preserving path: `p = φ₁` at every time, and
  `∇·(y φ₁) + Δφ₁ = (d − ‖y‖²) φ₁ + (‖y‖² − d) φ₁ = 0`. With the diffusion term halved,
  `∇·(y p) + (1/2) Δ p`, the right side would be `(d − ‖y‖²) φ₁/2`, not `0`.
- `μ₀ = dirac 0`, `d = 1`, variance-preserving path with `β = 2`: `p = φ_v` with
  `v = 1 − e^(−2t)`, and both sides equal `(1 − v)(y² − v) φ_v (y)/v²`.
- `μ₀ = dirac 0` and the variance-exploding path with `σ t = √t`: `p = φ_t`, and the equation is
  `∂ₜφ_t = (1/2) Δφ_t`.
- Sub-variance-preserving path: `s s′ − s² c′/c = (1 − α²)(β α²) + (1 − α²)² β/2 = (β/2)(1 − α⁴)`,
  so `G = β (1 − exp (−2 ∫₀ᵗ β))`.
- The hypothesis `c t ≠ 0` cannot be dropped. For `d = 1`, `μ₀` the standard Cauchy law and
  `s = 1`, `p` at the point `0` is `c ↦ exp (c²/2) erfc (|c|/√2)/√(2π)`, whose one-sided
  derivatives at `c = 0` are `−1/π` and `1/π`; along the path `c r = r`, `s r = 1` the density at
  `0` is not differentiable at time `0`.
- `d = 0`: `E` is a point, `p = μ₀ univ` at every level, and both sides are `0`.

*Needs:* DenoisingDiffusion 3.1; Tau Ceti `TauCeti.heatKernel`, `TauCeti.hasDerivAt_heatKernel`,
`TauCeti.laplacian_heatKernel`, `TauCeti.exists_norm_iteratedDeriv_iteratedFDeriv_heatKernel_le`,
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`; Mathlib
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `HasFDerivAt.comp_hasDerivAt`,
`intervalIntegral.integral_hasDerivAt_right`, `gradient`, `Laplacian.laplacian`.

### 1.3 The distance from the data

Let `μ₀` be a probability measure with `‖x‖²` integrable and `∫ ‖x‖² ∂μ₀ ≤ M`. Prove, for every
`c : ℝ` and `s ≥ 0`,

    TauCeti.wassersteinEDist 2 μ₀ (μ₀.bind (gaussianKernel c (s ^ 2))) ≤ ENNReal.ofReal √((1 − c)² M + s² d).

The coupling is `μ₀ ⊗ₘ gaussianKernel c (s ^ 2)`, the joint law of `(X, c • X + s • Z)`; its
marginals are `μ₀` and `μ₀.bind (gaussianKernel c (s ^ 2))` by `Measure.fst_compProd` and
`Measure.snd_compProd`. For it `E‖X − c • X − s • Z‖² = (1 − c)² E‖X‖² + s² d`, because `Z` is
centered and independent of `X` and `E‖Z‖² = d` (`stdGaussian_map_norm_sq` and
`integral_id_chiSquaredMeasure`). For the variance-preserving path the squared bound is
`(1 − α t)² M + (σ t)² d`, which tends to `0` as `∫₀ᵗ β → 0`: a path stopped at a small positive
time is close to the data in the Wasserstein distance of order two, whatever the support of the
data.

(Chen, Chewi, Li, Li, Salim and Zhang 2023, Appendix B, Lemma 20, first part, for the
Ornstein–Uhlenbeck path and data in a ball; the statement above is proved here.)

**Checks.**

- `μ₀ = dirac x₀`, `c = 1`: the second law is `N(x₀, s²)`, the only coupling is the product, and
  the distance is exactly `s √d`, the bound with `M = ‖x₀‖²`.
- `d = 1`, `μ₀ = N(0, 1)`, `c = 0.9`, `s = 0.4`: the second law is `N(0, 0.97)`, the squared
  distance is `(√0.97 − 1)² = 0.00023`, and the bound is `0.01 + 0.16 = 0.17`.
- `c = 1`, `s = 0`: both laws are `μ₀` and the bound is `0`.

*Needs:* DenoisingDiffusion 1.2; Tau Ceti `TauCeti.wassersteinEDist`,
`TauCeti.wassersteinEDist_le`, `TauCeti.IsCoupling`, `stdGaussian_map_norm_sq`,
`integral_id_chiSquaredMeasure`; Mathlib `Measure.compProd`, `Measure.fst_compProd`,
`Measure.snd_compProd`.

### Examples

The variance-preserving path with `β = 2`, for which `α t = e^(−t)` and `(σ t)² = 1 − e^(−2t)`:
its kernels are those of the Ornstein–Uhlenbeck semigroup, `x ↦ N(e^(−t) x, 1 − e^(−2t))`, and its
equation is `∂ₜp = ∇·(y p) + Δ p`.

Sampling on a time grid. Let `0 = t₀ < t₁ < … < t_N` with `∫ β > 0` over each `[t_{k−1}, t_k]`,
and let `β_k = 1 − exp (−∫ β)` over `[t_{k−1}, t_k]`, so that `0 < β_k < 1`. By the last
consequence of 1.1 the forward chain of DenoisingDiffusion 2.2 with the schedule `β_k` has the
transition kernels of the variance-preserving path between consecutive grid times, its cumulative
signal level `ᾱ k` is `(α t_k)²`, and its marginal at step `k` is the law of the data at level
`(α t_k, σ t_k)`. For `β = 1` and `t_k = k/10`, `β_k = 1 − e^(−0.1) = 0.0952`. If `β` vanishes on
`[t_{k−1}, t_k]` then `β_k = 0`, which the schedules of that roadmap exclude.

Convergence to the Gaussian. For `0 < b < 1` the law of the data at level `(√b, √(1 − b))` is the
first marginal of that chain for a schedule with `β₁ = 1 − b`, so DenoisingDiffusion 2.2 bounds its
Kullback–Leibler divergence from `N(0, 1)` by `(b M − d b − d log (1 − b))/2` when `‖x‖²` is
`μ₀`-integrable and `∫ ‖x‖² ∂μ₀ ≤ M`. Along the variance-preserving path `b = exp (−∫₀ᵗ β)`, and
for `b ≤ 1/2` the bound is at most `b (M + d b)/2`; at `b = 1/2`, `M = d = 1` the two values are
`0.3466` and `0.375`.

### Dependencies

DenoisingDiffusion 1.2 (1.1, 1.3), 2.1 (1.1) and 3.1 (1.1, 1.2). Tau Ceti's Gaussian
convolution and affine-image laws (1.1), heat kernel, its time derivative, its Laplacian and the
two derivative bounds (1.2), and Wasserstein distance with its coupling bound, the law of the
squared norm of a standard Gaussian vector and the mean of the chi-squared law (1.3). Mathlib's
kernel composition and `Measure.bind` (1.1), differentiation under the integral, the chain rule
`HasFDerivAt.comp_hasDerivAt`, `intervalIntegral.integral_hasDerivAt_right`, `gradient` and
`Laplacian.laplacian` (1.2), and `Measure.compProd` with its two marginals (1.3). No target of
this layer uses another target of it. The Examples use 1.1 and DenoisingDiffusion 2.2.

## Layer 2: the score along the path

In this layer `μ₀` is a probability measure, `c : ℝ` and `s > 0`, and `p = smoothedDensity μ₀ c s`.

### 2.1 The denoiser and the pointwise Tweedie formulas

Define the posterior mean and the posterior covariance at an observation `y`:

    denoiser μ₀ c s y = (p y)⁻¹ • ∫ φ_{s²} (y − c • x) • x ∂μ₀ x,
    posteriorCov μ₀ c s y = (p y)⁻¹ • ∫ φ_{s²} (y − c • x) • (x − m) ⊗ (x − m) ∂μ₀ x,

with `m = denoiser μ₀ c s y` and `u ⊗ u` the operator `w ↦ ⟪u, w⟫ • u` in `E →L[ℝ] E`. They are
the mean and the covariance of the probability measure with density
`x ↦ φ_{s²} (y − c • x)/p y` with respect to `μ₀`, the posterior law of `X` given
`c • X + s • Z = y`. For `c ≠ 0` both integrals converge absolutely for every `μ₀`, because
`‖x‖^k φ_{s²} (y − c • x)` is bounded in `x`. For `c = 0` they are the mean and the covariance of
`μ₀` when those exist, and Bochner's value `0` otherwise. Prove, for every `y : E`:

- **first order.** `noisyScore μ₀ c s y = (s²)⁻¹ • (c • denoiser μ₀ c s y − y)`
  (`noisyScore_eq_denoiser`);
- **second order.** `noisyScore μ₀ c s` has at `y` the Fréchet derivative
  `(s²)⁻¹ • ((c²/s²) • posteriorCov μ₀ c s y − 1)` (`hasFDerivAt_noisyScore`);
- **a lower bound for every data law.** Since the posterior covariance is positive semidefinite,
  `⟪fderiv ℝ (noisyScore μ₀ c s) y v, v⟫ ≥ −‖v‖²/s²` for all `v`: the function
  `y ↦ log p y + ‖y‖²/(2s²)` is convex.

Both identities hold for every `c`, with no moment assumption: for `c = 0` they read
`noisyScore μ₀ 0 s y = −y/s²` with derivative `−1/s²`, whatever the two integrals are. In the
Gaussian observation model of DenoisingDiffusion with `X` integrable and `c ≠ 0`, the first
identity and Tweedie's formula of DenoisingDiffusion 3.2 give
`P[X | Y] = denoiser μ₀ c s ∘ Y` almost surely; the statements here differ from that section in
holding at every point, in being expressed by the explicit posterior law, and in assuming no
integrability.

Route. DenoisingDiffusion 3.1 gives `∇ p y = −(1/s²) ∫ (y − c • x) φ_{s²} (y − c • x) ∂μ₀ x`.
For `c ≠ 0` the integrand splits into two integrable parts, which is the first identity; for
`c = 0`, `p = φ_{s²}`. For the second identity with `c ≠ 0`, differentiate
`y ↦ ∫ φ_{s²} (y − c • x) • x ∂μ₀ x` under the integral: its integrand has the derivative
`w ↦ −(1/s²) φ_{s²} (y − c • x) ⟪y − c • x, w⟫ • x`, bounded uniformly in `x` and locally
uniformly in `y` by `TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`, as in 1.2.
The quotient rule and the first identity give the covariance.

(Proved here.)

**Checks.**

- `μ₀ = dirac x₀`: the denoiser is `x₀`, the covariance is `0`, the score is `−(y − c • x₀)/s²`
  and its derivative is `−1/s²`, so the lower bound is attained.
- `d = 1`, `μ₀ = N(0, τ²)`: the denoiser is `c τ² y/(c² τ² + s²)`, the covariance is
  `τ² s²/(c² τ² + s²)`, and the second identity gives `−1/(c² τ² + s²)`, the derivative of the
  score `−y/(c² τ² + s²)`. For `τ = s = 1`, `c = 2`: `(4 · (1/5) − 1)/1 = −1/5`. With `c/s²` in
  place of `c²/s²` in the second identity the value would be `(2 · (1/5) − 1) = −3/5`.
- `d = 1`, `μ₀ = (dirac (−R) + dirac R)/2`, `y = 0`: the posterior is `μ₀`, the denoiser is `0`,
  the covariance is `R²`, and the derivative of the score is `c² R²/s⁴ − 1/s²`.

*Needs:* DenoisingDiffusion 3.1; Tau Ceti
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`, `TauCeti.contDiff_heatKernel`;
Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `gradient`.

### 2.2 Score bounds for data in a ball

Suppose `‖x‖ ≤ R` for `μ₀`-almost every `x`. Prove, for every `y, v : E`:

- `‖noisyScore μ₀ c s y‖ ≤ (‖y‖ + |c| R)/s²` (`norm_noisyScore_le`);
- `⟪fderiv ℝ (noisyScore μ₀ c s) y v, v⟫ ≤ (c² R²/s⁴ − 1/s²) ‖v‖²`
  (`inner_fderiv_noisyScore_le`);
- with the lower bound of 2.1, the score is Lipschitz with constant
  `max (1/s²) (c² R²/s⁴ − 1/s²)`.

The posterior law is absolutely continuous with respect to `μ₀`, so it is carried by the closed
ball of radius `R`: its mean has norm at most `R`, and `⟪posteriorCov μ₀ c s y v, v⟫`, the
posterior variance of `⟪x, v⟫`, is at most `R² ‖v‖²`. The bounds follow from 2.1. For the
variance-preserving path they read `‖∇ log p_t (y)‖ ≤ (‖y‖ + α t R)/(σ t)²` and
`−(σ t)⁻² ≤ ∇² log p_t ≤ (α t)² R²/(σ t)⁴ − (σ t)⁻²`.

(Chen, Chewi, Li, Li, Salim and Zhang 2023, Appendix B, the unnumbered display in the proof of
the third part of Lemma 20, for the two-sided bound on the second derivative along the
Ornstein–Uhlenbeck path, where it is taken from Mikulincer and Shenfeld; the bound on the norm of
the score and the statements for a general level are proved here.)

**Checks.**

- `d = 1`, `μ₀ = (dirac (−R) + dirac R)/2`, `y = 0`: the derivative of the score is
  `c² R²/s⁴ − 1/s²`, so the upper bound is attained; for `R = 1.3`, `c = 0.8`, `s = 0.6` it is
  `5.568`.
- `μ₀ = dirac x₀` with `‖x₀‖ = R`, `c > 0` and `y = −λ • x₀` with `λ ≥ 0`: the score is
  `−(y − c • x₀)/s²`, of norm `(‖y‖ + c R)/s²`, so the first bound is attained.
- No bound on the derivative of the score holds uniformly in the data without a hypothesis on
  the support: for the two-point law above the value at `0` tends to `∞` with `R`.

*Needs:* 2.1; Mathlib `lipschitzWith_of_nnnorm_fderiv_le` for the Lipschitz constant.

### 2.3 Time-integrated score matching

Let `(Ω, P)` be a probability space and `X, Z : Ω → E` measurable and independent, `X` of law
`μ₀` and `Z` of law `N(0, 1)`. Let `I ⊆ ℝ` be a measurable set of times, `c s : ℝ → ℝ` measurable
with `s t > 0` for `t ∈ I`, `Y_t = c t • X + s t • Z`, `w : ℝ → ℝ≥0∞` a measurable weight and
`F : ℝ × E → E` measurable. With extended integrals throughout, prove

    ∫⁻ t in I, w t * ∫⁻ ‖F (t, Y_t) + (s t)⁻¹ • Z‖² ∂P
      = ∫⁻ t in I, w t * ∫⁻ ‖F (t, Y_t) − noisyScore μ₀ (c t) (s t) Y_t‖² ∂P
        + ∫⁻ t in I, w t * ENNReal.ofReal (d/(s t)² − ∫ ‖noisyScore μ₀ (c t) (s t) Y_t‖² ∂P),

where the last integrand is nonnegative and does not depend on `F`. So the time-integrated
denoising objective is the time-integrated explicit objective plus a constant of the path, the
weight and the data, which may be infinite.

Route. For each `t ∈ I` the identity of the inner integrals is DenoisingDiffusion 3.3 when
`‖F (t, Y_t)‖²` is integrable; when it is not, both inner integrals on the two sides are `∞`,
because `(s t)⁻¹ • Z` and the score of `Y_t` are square integrable (DenoisingDiffusion 3.3). The
three inner integrals are measurable in `t`: the first two by Tonelli's theorem on `ℝ × Ω`, and
the third because `(c, s, y) ↦ noisyScore μ₀ c s y` is continuous on `s > 0`, by dominated
convergence in the integrals for `p` and `∇ p`. Then `lintegral_add_left` splits the sum.

(Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole 2021, equation (7), for the weighted
denoising objective in continuous time; proved here from DenoisingDiffusion 3.3.)

**Checks.**

- `μ₀ = dirac x₀`: the score of `Y_t` is `−(s t)⁻¹ • Z`, the constant is `0`, and the two
  objectives coincide.
- `d = 1`, `μ₀ = N(0, 1)`, variance-preserving path with `β = 1`: the last integrand is
  `w t · (α t)²/(σ t)²` with `(α t)² = e^(−t)`. For `w = 1` on `I = [ε, 1]` the constant is
  `log ((1 − e⁻¹)/(1 − e^(−ε)))`, which is `4.1515` at `ε = 0.01` and tends to `∞` as `ε → 0`.
- In the same example on `I = (0, 1]` with the weight `w t = β t = 1`, the constant is `∞`, so
  the denoising objective is `∞` for every `F`, while the explicit objective of the exact score
  is `0`. With the weight `w t = (σ t)²` the constant is `∫₀¹ e^(−t) dt = 0.6321`.

*Needs:* DenoisingDiffusion 3.1 and 3.3; Mathlib `lintegral_add_left`,
`Measurable.lintegral_prod_right'`.

### Examples

The two-point law `(dirac (−R) + dirac R)/2` on the line, for which the score is
`(c R tanh (c R y/s²) − y)/s²`, the denoiser is `R tanh (c R y/s²)` and the posterior covariance is
`R²/cosh² (c R y/s²)`; and the Gaussian law, for which all three are linear or constant in `y`.

### Dependencies

DenoisingDiffusion 3.1 (2.1, 2.3) and 3.3 (2.3); 2.1 (for 2.2); Tau Ceti's bound
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp` and
`TauCeti.contDiff_heatKernel` (2.1); Mathlib's differentiation under the integral and `gradient`
(2.1), `lipschitzWith_of_nnnorm_fderiv_le` (2.2), `lintegral_add_left` and
`Measurable.lintegral_prod_right'` (2.3). Layer 1 is not used.

## Layer 3: time reversal

In this layer `μ₀` is a probability measure.

### 3.1 Two-time laws and backward kernels

For levels `(c₁, s₁)` and `(c₂, s₂)` define the joint law of the path at the two levels,

    twoTimeLaw μ₀ c₁ s₁ c₂ s₂ = (μ₀.bind (gaussianKernel c₁ (s₁ ^ 2))) ⊗ₘ gaussianKernel (c₂ / c₁) (s₂ ^ 2 − (c₂ / c₁) ^ 2 * s₁ ^ 2),

the law at the first level followed by the transition kernel of 1.1. Write `m = c₂/c₁` and
`v = s₂² − m² s₁²`. Prove, for `c₁ ≠ 0` and `v ≥ 0`:

- its first marginal is the law of the data at level `(c₁, s₁)` and its second marginal is the
  law at level `(c₂, s₂)`, by 1.1;
- **Bayes' formula.** If moreover `s₁ > 0` and `v > 0`, define the backward kernel
  `y ↦ (volume.withDensity fun x ↦ ENNReal.ofReal (p₁ x * φ_v (y − m • x) / p₂ y))`, with `p₁`
  and `p₂` the densities at the two levels. It is a Markov kernel, and the two-time law is the
  law at the second level followed by the backward kernel, with the two coordinates exchanged;
- **the posterior of the data.** When the first level is the data itself, the law at the first
  level is `μ₀`, which has no density in general. For a level `(c, s)` with `s > 0` and
  `p = smoothedDensity μ₀ c s`, the posterior law of 2.1,
  `y ↦ μ₀.withDensity (fun x ↦ ENNReal.ofReal (φ_{s²} (y − c • x) / p y))`, is a Markov kernel, and
  `μ₀ ⊗ₘ gaussianKernel c (s ^ 2)` is the law at level `(c, s)` followed by this kernel, with the
  two coordinates exchanged, by Tonelli's theorem;
- **the moments of the backward kernel.** If moreover `m ≠ 0`, the backward kernel at `y` has
  mean `m⁻¹ • (y + v • noisyScore μ₀ c₂ s₂ y)` and covariance
  `(v/m²) • (1 + v • fderiv ℝ (noisyScore μ₀ c₂ s₂) y)`, for every `y` and every data law.

The moments are 2.1 applied to the law at the first level in place of `μ₀`, with signal level `m`
and noise level `√v`: by 1.1 the smoothed density of that law at this level is `p₂`, and the
posterior law is the backward kernel. For a short step, `m ≈ 1 + a h` and `v ≈ G h`, the mean is
`y + h (−a y + G ∇ log p₂ (y))` to first order in `h`: one Euler step of the equation
`dY = (−a Y + G ∇ log p (Y)) du + √G dB̄` in the reversed time `u`.

(Ho, Jain and Abbeel 2020, equation (11), for the mean of the reverse step written with the
noise; the statements above are proved here.)

**Checks.**

- `d = 1`, `μ₀ = N(0, 1)`, the variance-exploding levels `(1, √0.5)` and `(1, √2)`, `y = 1.2`:
  the laws are `N(0, 1.5)` and `N(0, 3)`, `v = 1.5`, the backward mean is
  `1.2 · 1.5/3 = 0.6 = 1.2 + 1.5 · (−1.2/3)`, and the backward variance is
  `1.5 · 1.5/3 = 0.75 = 1.5 (1 − 1.5/3)`.
- Variance-preserving path between grid times with `m = √(1 − β_k)` and `v = β_k`: the backward
  mean is `(y + β_k ∇ log p (y))/√(1 − β_k)`.
- `v = 0` with `m = 1`: the transition kernel is the identity and the two-time law is carried by
  the diagonal; Bayes' formula with a density requires `v > 0`.

*Needs:* 1.1, 2.1; DenoisingDiffusion 3.1; Tau Ceti `multivariateGaussian_eq_withDensity`;
Mathlib `Measure.compProd`, `Measure.fst_compProd`, `Measure.snd_compProd`, `Measure.bind`.

### 3.2 The generator of the reversed path

For a level `(c, s)` and real numbers `a`, `G` define, for `f : E → ℝ`,

    reverseGenerator μ₀ c s a G f x = ⟪(−a) • x + G • noisyScore μ₀ c s x, ∇ f x⟫ + (G/2) Δ f x.

Let `c`, `s` have derivatives `c′`, `s′` at `r`, with `c r ≠ 0` and `s r > 0`, and let
`a = c′/c r` and `G = 2(s r * s′ − (s r)² c′/c r)`. Fix a second level `(c₂, s₂)` with
`(c₂/c r)² (s r)² < s₂²`. Let `f : E → ℝ` be of class `C²` with compact support and `g : E → ℝ`
measurable and bounded. Prove that

    u ↦ ∫ f z.1 * g z.2 ∂(twoTimeLaw μ₀ (c u) (s u) c₂ s₂)

has at `r` the derivative

    −∫ reverseGenerator μ₀ (c r) (s r) a G f z.1 * g z.2 ∂(twoTimeLaw μ₀ (c r) (s r) c₂ s₂)

(`hasDerivAt_integral_twoTimeLaw`). In words: with the second level held fixed, moving the first
time backward by `h` changes `E[f(X_r) g(X₂)]` by `h E[(A f)(X_r) g(X₂)]` to first order, where
`A` is the generator of the equation `dY = (−a Y + G ∇ log p (Y)) du + √G dB̄` in the reversed
time `u`. For the variance-preserving path this equation is
`dY = ((β/2) Y + β ∇ log p (Y)) du + √β dB̄`. The hypothesis on the second level makes the
transition kernel nondegenerate at `r`, hence near `r`; it involves no monotonicity of `s/c`.

- **One time.** For `g = 1`: `u ↦ ∫ f ∂(law at level (c u, s u))` has derivative
  `−∫ (A f) ∂(law at level (c r, s r))`, the reverse-time Fokker–Planck equation in weak form.
- **Classical form.** By 1.2 and `p • ∇ log p = ∇ p`, for a time `T` and `u` such that the
  hypotheses of 1.2 hold at `T − u`, the function `q u y = smoothedDensity μ₀ (c (T − u)) (s (T − u)) y`
  satisfies `∂_u q = −∇·((−a y + G ∇ log q) q) + (G/2) Δ q` at every point, with `a` and `G`
  evaluated at `T − u`. This is a rewriting of 1.2.

Route. As in 1.2, the integral is a function of the level differentiated jointly in `(c, s)`, and
the path enters through the chain rule only, because `c` and `s` are differentiable at the one
time `r`. For a level `(c, s)` with `c ≠ 0`, `s > 0` and `(c₂/c)² s² < s₂²` put `m = c₂/c`,
`v = s₂² − m² s²` and `h x = ∫ g (m • x + √v • z) ∂N(0, 1) z`; the integral over the two-time law
is `Φ (c, s) = ∫ f x * p x * h x dx` with `p = smoothedDensity μ₀ c s`, by DenoisingDiffusion 3.1
and `Measure.integral_compProd`. Here `h x = H_v (m • x)`, with `H_v y = ∫ φ_v (y − w) g w dw` the
heat-kernel convolution of `g` at time `v/2`. It is smooth in `y` by
`TauCeti.contDiff_heatKernel_convolution`, with `∂_v H_v = (1/2) Δ H_v` by
`TauCeti.hasDerivAt_heatKernel_convolution`, and `(v, y) ↦ H_v y` is differentiable jointly on
`v > 0`, by differentiation under the integral with the Gaussian bounds of 1.2 on the
derivatives of the heat kernel, which are integrable in `w` because `g` is bounded. The partial
derivatives of `p` are those of 1.2. On the compact support of `f` the derivatives in `(c, s)` of
`f x * p x * h x` are bounded uniformly for `(c, s)` near `(c r, s r)`, so
`hasFDerivAt_integral_of_dominated_of_fderiv_le` gives the Fréchet derivative of `Φ` at
`(c r, s r)` and `HasFDerivAt.comp_hasDerivAt` the derivative along the path. Along the path
`m′ = −a m` and `v′ = −m² G`, so the derivative of `h` along it is
`−(a ⟪x, ∇ h x⟫ + (G/2) Δ h x)`, the backward equation, also when `m = 0`, where `h` is constant;
that of `p` is given by 1.2. Two integrations by parts against the compactly supported `f`, by
`integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable` along an orthonormal basis,
turn the derivative into `∫ p h (a ⟪x, ∇ f⟫ + (G/2) Δ f) + G ∫ p ⟪∇ f, ∇ h⟫`. A third
integration by parts turns the last term into `−G ∫ h (⟪∇ p, ∇ f⟫ + p Δ f)`, and
`∇ p = p • ∇ log p`.

(Song, Sohl-Dickstein, Kingma, Kumar, Ermon and Poole 2021, equation (6), for the reverse-time
equation, which is attributed there to Anderson's theorem of 1982 on reverse-time diffusion
models. The statement above, for every data law and for the two-time laws, is proved here.)

**Checks.**

- `μ₀ = N(0, 1)` and the variance-preserving path: `∇ log p = −x`, so
  `A f = (β/2)(Δ f − ⟪x, ∇ f⟫)`, the generator of the forward equation: the stationary
  Ornstein–Uhlenbeck process is reversible. With half the score term, `(G/2) ∇ log p`, which is
  the drift of the probability-flow equation, the first-order part would vanish.
- `μ₀ = dirac 0` and the variance-exploding path with `s u = √u`: `A f = −⟪x, ∇ f⟫/u + (1/2) Δ f`,
  the generator of the Brownian bridge to `0`; its drift is singular at `u = 0`, where
  `s u > 0` fails.
- `d = 1`, `μ₀ = 0.3 dirac (−1) + 0.5 dirac 0.4 + 0.2 dirac 1.7`, the variance-preserving path
  with `β t = 1/2 + t`, `r = 0.6`, the second level that of time `1.5`,
  `f x = (1 − x²/9)⁴ (1 + 0.3 x)` on `[−3, 3]` and `0` outside, `g y = tanh (2y − 1/2) + cos 3y`:
  both sides are `0.023460`. The expression with half the score term gives `0.00714`, and the
  forward generator `∫ (a ⟪x, ∇ f⟫ + (G/2) Δ f) g`, without the score and without the sign, gives
  `0.00281`.
- For `g = 1` in the same example both sides are `0.0068400`, and so is the forward expression:
  the one-time equation does not see the difference between the two generators, the two-time
  identity does.
- `d = 0`: every function is constant, `∇ f = 0`, `Δ f = 0`, and both sides are `0`.

*Needs:* 1.1, 1.2, 3.1; DenoisingDiffusion 3.1; Tau Ceti
`TauCeti.hasDerivAt_heatKernel_convolution`, `TauCeti.contDiff_heatKernel_convolution`,
`TauCeti.exists_norm_iteratedDeriv_iteratedFDeriv_heatKernel_le`,
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`,
`multivariateGaussian_eq_withDensity`; Mathlib `Measure.integral_compProd`,
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `HasFDerivAt.comp_hasDerivAt`,
`integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable`, `gradient`,
`Laplacian.laplacian`.

### Examples

The reversed discrete chain. Take the grid and the schedule `β_k` of the Examples of Layer 1.
Under the forward chain of DenoisingDiffusion 2.2 the law of the consecutive states
`(x (k − 1), x k)` is the marginal at step `k − 1` followed by `noiseKernel (1 − β_k)`: this is
`forwardPath_map_posterior` of DenoisingDiffusion 4.2 mapped to these two coordinates, and
`ddpm_posterior` of DenoisingDiffusion 2.3 integrated over `μ₀`. By `noiseKernel_apply` of
DenoisingDiffusion 2.1, `noiseKernel (1 − β_k) = gaussianKernel √(1 − β_k) β_k`, the transition
kernel of the variance-preserving path between the grid times `t_{k−1}` and `t_k`. So this law is
the two-time law of 3.1 for `k ≥ 2`, and `μ₀ ⊗ₘ gaussianKernel √(1 − β₁) β₁` for `k = 1`. By
Bayes' formula of 3.1 the backward kernels between consecutive grid times, `k ≥ 2`, and by the
posterior of the data in 3.1 the posterior kernel at the level of time `t₁`, `k = 1`, satisfy
`IsReverseKernel` of DenoisingDiffusion 4.1 for this schedule. By `forwardPath_reverse` of that
section the forward chain read backwards is the Markov chain with these kernels, started from
the law at time `t_N`; by 3.1 their means for `k ≥ 2` are `(y + β_k ∇ log p (y))/√(1 − β_k)`.

The stationary Ornstein–Uhlenbeck process, `μ₀ = N(0, 1)` with `β = 2`, for which the two-time law
is symmetric and the reversed generator is the forward one.

### Dependencies

Layers 1 and 2: 1.1 (3.1, 3.2), 1.2 (3.2), 2.1 (3.1); 3.1 (for 3.2). DenoisingDiffusion 3.1
(3.1, 3.2). Tau Ceti's Gaussian density (3.1, 3.2), heat-kernel convolution theorems and the two
heat-kernel derivative bounds (3.2).
Mathlib's `Measure.compProd` with its two marginals and `Measure.bind` (3.1),
`Measure.integral_compProd`, differentiation under the integral and integration by parts for
line derivatives, the chain rule `HasFDerivAt.comp_hasDerivAt`, `gradient` and
`Laplacian.laplacian` (3.2). The Examples use 2.1, 3.1 and DenoisingDiffusion 2.1, 2.3, 4.1 and
4.2.

## Downstream consumers

No roadmap on main consumes this one. The names offered to consumers are the definitions
`vpSignal`, `vpNoise`, `denoiser`, `posteriorCov`, `twoTimeLaw` and `reverseGenerator`, and the
statements `gaussianKernel_comp` (1.1), `hasDerivAt_smoothedDensity_path` and
`hasDerivAt_smoothedDensity_vp` (1.2), `noisyScore_eq_denoiser` and `hasFDerivAt_noisyScore`
(2.1), `norm_noisyScore_le` and `inner_fderiv_noisyScore_le` (2.2) and
`hasDerivAt_integral_twoTimeLaw` (3.2).

## Scope and ownership

This roadmap owns:

- the composition law of Gaussian observation kernels with arbitrary signal levels and variances,
  and the transition kernels of a noising path; the variance-preserving case of the composition
  law is DenoisingDiffusion 2.1;
- the Fokker–Planck equation satisfied at every point by the smoothed density of an arbitrary
  finite measure along a noising path, with the variance-preserving, variance-exploding and
  sub-variance-preserving equations as cases;
- the Wasserstein bound between the data and the path;
- the denoiser and the posterior covariance, the pointwise first- and second-order Tweedie
  formulas, and the score bounds for data in a ball. DenoisingDiffusion 3.2 owns Tweedie's
  formula as an identity of conditional expectations, almost surely and under an integrability
  hypothesis; 2.1 above differs as stated there;
- the time-integrated score-matching identity; the identity at one time is DenoisingDiffusion 3.3;
- two-time laws, backward kernels and their moments, and the generator of the reversed path.

Left to other roadmaps, by section:

- [DenoisingDiffusion](../DenoisingDiffusion/README.md) owns the kernel `gaussianKernel` (1.2),
  the noising kernels and the discrete forward chain (2.1 to 2.3), the smoothed density, its
  positivity, smoothness and score (3.1), Tweedie's formula (3.2), score matching at one noise
  level (3.3) and the variational bound of the discrete chain (Layer 4). DenoisingDiffusion owns the
  three definitions `gaussianKernel`, `smoothedDensity` and `noisyScore`. This roadmap's
  `Suggested.lean` declares them again in its own namespace, with bodies identical to those of
  DenoisingDiffusion's `Suggested.lean`, for the one reason that its statements must elaborate
  without importing another roadmap; they are not new notions, and an implementation uses
  DenoisingDiffusion's declarations.
- [StochasticCalculus](../StochasticCalculus/README.md) owns Brownian motion, stochastic
  integrals and stochastic differential equations. Its 9.4 solves the scalar Ornstein–Uhlenbeck
  equation `dX = −λX dt + σ dB` with constant coefficients explicitly, and names matrix linear
  equations and the variation of constants without a statement; its 9.1 and 9.3 give
  strong and weak solutions, with headline statements for scalar equations; its 10.2 proves the
  forward equation of the laws of a solution in distributional form against smooth compactly
  supported functions, and the equivalence of weak solutions with martingale problems; its 7.3 and
  7.4 give Novikov's criterion and Girsanov's theorem, with a scalar headline. Nothing above uses
  these sections. That roadmap has no target, with stated hypotheses, for the equation
  `dX = −(β(t)/2) X dt + √β(t) dB` on `ℝ^d` with a time-dependent `β`, or for the fact that the
  transition law of its solution is the Gaussian kernel of 1.1; that identification is not made
  here either, and the statements above are about the kernels.
- [OptimalTransport](../OptimalTransport/README.md) owns the continuity equation (8.7, 8.8) and
  the Fokker–Planck equation `∂ₜρ = Δρ + div(ρ∇V)` as the Wasserstein gradient flow of entropy
  plus potential, with its semigroup, contraction and invariant law (11.7 to 11.9). For
  `V = ‖x‖²/2` that equation is the variance-preserving equation of 1.2 with `β = 2`, so the
  densities of 1.2 solve it classically. That they are the gradient-flow curve of that roadmap is
  not claimed here: OptimalTransport 11.7 states that the gradient flow solves the equation in
  distributions, not the converse, and 11.9 constructs the semigroup generated by `Δ − ∇V·∇` and
  its agreement with the gradient flow without identifying it with the Gaussian kernels of 1.1.

Out of scope:

- the reverse-time stochastic differential equation as a process: that the time reversal of a
  solution of the forward equation is a weak solution of the reverse-time equation, and that the
  reverse-time equation started from the law at the final time has the reversed path law. The
  drift `G ∇ log p` is time-dependent, unbounded and, for data without a density, singular at
  the initial time, and the passage from the generator identity of 3.2 to a weak solution needs
  the martingale-problem equivalence for such drifts on `ℝ^d`;
- sampling-error bounds for a learned score in continuous time: the bound of the
  Kullback–Leibler divergence between the data and the generated law by the divergence at the
  final time plus `(1/2) ∫ G E‖s_θ − ∇ log p‖²` (Song, Durkan, Murray and Ermon 2021, Theorem 1,
  under the twelve regularity assumptions of its Appendix A, which include a twice
  differentiable data density and Novikov's condition), and the bounds for discretized samplers
  (Chen, Chewi, Li, Li, Salim and Zhang 2023, Theorem 2). Both compare path laws of
  `d`-dimensional equations by Girsanov's theorem and need the process-level time reversal of
  the previous item. The discrete-time counterpart is the chain rule and the variational bound of
  DenoisingDiffusion 4.1 to 4.3;
- the exponential decay `e^(−∫β)` of the Kullback–Leibler divergence from the Gaussian along the
  variance-preserving path, which needs the logarithmic Sobolev inequality together with the
  entropy-dissipation identity; the Examples of Layer 1 give the polynomial bound of
  DenoisingDiffusion 2.2 instead;
- the probability-flow ordinary differential equation, flows of vector fields, flow matching and
  the Wasserstein error of deterministic samplers, which are the subject of the flow-matching
  roadmap, and Langevin and Hamiltonian Monte Carlo samplers;
- the discretization of differential-equation solvers, training dynamics and the approximation of
  scores by parametric families, data carried by a manifold beyond what the hypotheses above
  cover, Schrödinger bridges, conditional and guided sampling, and diffusion on discrete state
  spaces.

Provenance: the repository [lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (BSD-3, by the
author of this roadmap) contains samplers for a trained diffusion model, among them DDPM, DDIM,
Euler, Heun and a stochastic sampler, with the variance-preserving reading of the cosine schedule
(`LeanMlir/Ddpm.lean`), as executable code. It contains no proofs of the material above.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.multivariateGaussian` and `ProbabilityTheory.stdGaussian`, the Gaussian
  measures on `EuclideanSpace ℝ ι`; `ProbabilityTheory.Kernel.comp` (`∘ₖ`),
  `MeasureTheory.Measure.bind`, `MeasureTheory.Measure.compProd` (`⊗ₘ`).
- `MeasureTheory.Measure.fst_compProd`
  (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`) and
  `MeasureTheory.Measure.snd_compProd`
  (`Mathlib/Probability/Kernel/Composition/MeasureComp.lean`): for an s-finite `μ`,
  `(μ ⊗ₘ κ).fst = μ` when `κ` is a Markov kernel, and `(μ ⊗ₘ κ).snd = κ ∘ₘ μ`, which is
  `μ.bind κ`, when `κ` is s-finite.
- `MeasureTheory.Measure.integral_compProd`
  (`Mathlib/Probability/Kernel/Composition/IntegralCompProd.lean`): for an s-finite measure, an
  s-finite kernel and a function integrable for `μ ⊗ₘ κ`,
  `∫ f ∂(μ ⊗ₘ κ) = ∫ ∫ f (a, b) ∂κ a ∂μ`.
- `hasFDerivAt_integral_of_dominated_of_fderiv_le`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean`): if `F x` is almost everywhere strongly
  measurable for `x` near `x₀`, `F x₀` is integrable, `F′ x₀` is almost everywhere strongly
  measurable, and on a neighbourhood `s` of `x₀` the derivative `F′ x a` of `x ↦ F x a` exists and
  is bounded by an integrable `bound a`, then `x ↦ ∫ F x a ∂μ` has derivative `∫ F′ x₀ a ∂μ` at
  `x₀`.
- `HasFDerivAt.comp_hasDerivAt` (`Mathlib/Analysis/Calculus/Deriv/Comp.lean`): the chain rule for
  a Fréchet-differentiable map composed with a curve.
- `intervalIntegral.integral_hasDerivAt_right`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`): for `f` interval
  integrable on `a..b`,
  strongly measurable near `b` and continuous at `b`, `u ↦ ∫ x in a..u, f x` has derivative `f b`
  at `b`.
- `integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean`): integration by parts for line
  derivatives on a finite-dimensional space with an additive Haar measure, when the three
  products are integrable.
- `MeasureTheory.lintegral_add_left`: for `f` measurable, `∫⁻ (f + g) = ∫⁻ f + ∫⁻ g`;
  `Measurable.lintegral_prod_right'`: for an s-finite `ν` and a measurable `f` on a product,
  `x ↦ ∫⁻ f (x, y) ∂ν y` is measurable.
- `lipschitzWith_of_nnnorm_fderiv_le` (`Mathlib/Analysis/Calculus/MeanValue.lean`): a
  differentiable map whose derivative has norm at most `C` everywhere is `C`-Lipschitz.
- `gradient` and `Laplacian.laplacian`.

### From Tau Ceti

- `TauCeti.Probability.multivariateGaussianPDFReal` and
  `TauCeti.Probability.multivariateGaussian_eq_withDensity`, for a positive definite covariance
  (`TauCeti/Probability/Distributions/Gaussian/Density.lean`).
- `TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`, for positive semidefinite
  covariances (`TauCeti/Probability/Distributions/Gaussian/Sum.lean`):
  `N(m₁, S₁) ∗ N(m₂, S₂) = N(m₁ + m₂, S₁ + S₂)`.
- `TauCeti.Probability.map_affine_multivariateGaussian`, for a positive semidefinite covariance
  (`TauCeti/Probability/Distributions/Gaussian/Affine.lean`): the image of `N(m, S)` under
  `x ↦ L x + c` is `N(L m + c, L S Lᵀ)`.
- `TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel`, `TauCeti.laplacian_heatKernel`
  (`Δ K_t x = (‖x‖²/(4t²) − n/(2t)) K_t x`) and `TauCeti.hasDerivAt_heatKernel` (for `t > 0`,
  `s ↦ K_s x` has derivative `Δ K_t x` at `t`), in `TauCeti/Analysis/PDE/HeatKernel/Basic.lean`.
  Here `K_t x = (4πt)^(−n/2) exp(−‖x‖²/(4t))`, so `φ_v = K_{v/2}`.
- `TauCeti.exists_norm_iteratedDeriv_iteratedFDeriv_heatKernel_le` and
  `TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`
  (`TauCeti/Analysis/PDE/HeatKernel/Derivatives.lean`): for each `j` and `m` there is `C` with
  `‖∂ₜʲ Dᵐ K_t x‖ ≤ C t^(−(n + m + 2j)/2) exp(−‖x‖²/(8t))` for all `t > 0` and `x`; the second
  is the case `j = 0`.
- `TauCeti.contDiff_heatKernel_convolution` and `TauCeti.hasDerivAt_heatKernel_convolution`
  (`TauCeti/Analysis/PDE/HeatKernel/HeatEquation.lean`): for `t > 0` and `g` almost everywhere
  strongly measurable and essentially bounded, `K_t ⋆ g` is smooth and `s ↦ (K_s ⋆ g) x` has
  derivative `Δ (K_t ⋆ g) x` at `t`.
- `TauCeti.Probability.stdGaussian_map_norm_sq`
  (`TauCeti/Probability/Distributions/Chi/Gaussian.lean`): the squared norm of a standard
  Gaussian vector has the chi-squared law with `finrank` degrees of freedom; and
  `TauCeti.Probability.integral_id_chiSquaredMeasure`
  (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean`): that law has mean `k` for `k ≥ 0`.
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`),
  `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_le`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`): the distance is the infimum
  over couplings of `eLpNorm (fun z ↦ edist z.1 z.2) p π`, and every coupling bounds it.

### From TauCetiRoadmap.DenoisingDiffusion

- 1.2: the kernel `gaussianKernel c v`, `x ↦ N(c • x, v)`.
- 2.1: the noising kernel `noiseKernel a`, `x ↦ N(√a • x, 1 − a)` for `a ∈ [0, 1]`
  (`noiseKernel_apply`), and its composition law `noiseKernel_comp`; 2.2: the forward chain `forwardPath`, its marginals
  `forwardMarginal`, and the bound `klDiv_forwardMarginal_le` on their divergence from `N(0, 1)`
  under a second-moment bound. Both are used in the Examples of Layers 1 and 3 only, apart from
  the comparison in 1.1.
- 3.1: `smoothedDensity μ₀ c s` is, for `s > 0`, a density of `c • X + s • Z`
  (`hasLaw_smoothedDensity`); it is positive and smooth; its gradient is
  `−(1/s²) ∫ (y − c • x) φ_{s²} (y − c • x) ∂μ₀ x`, and all its derivatives are taken under the
  integral; `φ_{s²}` is the heat kernel at time `s²/2`; `noisyScore μ₀ c s = ∇ log p`.
- 3.2: Tweedie's formula `tweedie`, for `X` integrable and `c ≠ 0`, used in 2.1 for the comparison
  with the conditional expectation only.
- 3.3: `memLp_noisyScore` (the score of the observation is square integrable, with second moment
  at most `d/s²`) and `dsm_eq_esm_add` (for a measurable `f` with `‖f (Y)‖²` integrable, the
  denoising objective is the explicit objective plus `d/s² − ∫ ‖noisyScore μ₀ c s (Y)‖² ∂P`).
- 2.3: the DDPM posterior `ddpm_posterior`; 4.1: the predicate `IsReverseKernel` and the reverse
  Markov property `forwardPath_reverse`; 4.2: the law `forwardPath_map_posterior` of
  `((x 0, x t), x (t − 1))` under the forward chain. These are used in the Examples of Layer 3
  only.

## References

- S. Chen, S. Chewi, J. Li, Y. Li, A. Salim and A. R. Zhang, *Sampling is as easy as learning the
  score: theory for diffusion models with minimal data assumptions*, ICLR 2023, arXiv:2209.11215.
- J. Ho, A. Jain and P. Abbeel, *Denoising diffusion probabilistic models*, NeurIPS 2020,
  arXiv:2006.11239.
- Y. Song, C. Durkan, I. Murray and S. Ermon, *Maximum likelihood training of score-based
  diffusion models*, NeurIPS 2021, arXiv:2101.09258.
- Y. Song, J. Sohl-Dickstein, D. P. Kingma, A. Kumar, S. Ermon and B. Poole, *Score-based
  generative modeling through stochastic differential equations*, ICLR 2021, arXiv:2011.13456.

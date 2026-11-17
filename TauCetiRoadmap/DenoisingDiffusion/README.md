# Roadmap: Gaussian denoising diffusion, Tweedie's formula and score matching

**Summary.** Develop the probability and statistics behind denoising diffusion models in discrete
time on `ℝ^d`. It starts with two Gaussian facts that the rest needs: the Kullback–Leibler
divergence between isotropic Gaussian laws with different variances, and the Gaussian Bayes
update. It builds the forward noising chain of Ho, Jain and Abbeel: the variance-preserving
Gaussian kernels, their composition law, the closed form of `q(x_t | x_0)`, the Gaussian posterior
`q(x_{t-1} | x_t, x_0)`, and the convergence of the marginals to the standard Gaussian. For a law
observed through Gaussian noise it proves that the observation has a smooth positive density,
Tweedie's formula for the posterior mean and its second-order form for the posterior covariance,
and the equivalence of denoising and explicit score matching up to a constant, with the score as
the unique minimizer. It ends with the variational bound of diffusion models: the reverse Markov
property and the chain rule for the path divergence, the posterior-conditioned surrogate and the
exact, finite constant separating them, and the closed form of the surrogate as a weighted
noise-prediction loss whose minimizer is the score.

## Scope and ownership

This roadmap owns:

- the Kullback–Leibler divergence between isotropic Gaussian laws `N(a, u)` and `N(b, v)` with
  `u ≠ v`, and the isotropic Gaussian Bayes update;
- the variance-preserving noising kernels, noise schedules, the forward chain, its path law and
  marginals, and the DDPM posterior;
- the density, gradient and score of a law convolved with an isotropic Gaussian;
- Tweedie's formula in first and second order;
- denoising score matching, explicit score matching and noise prediction, and their minimizers;
- reverse models and their path law, the reverse Markov property of the forward chain, the
  path-space variational bound, the posterior-conditioned surrogate, and its Gaussian closed form.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope, and not owned here:

- continuous-time diffusion: forward and reverse-time stochastic differential equations,
  Anderson's time-reversal theorem and the probability-flow equation;
- convergence and sampling-error bounds for learned reverse processes, and the approximation
  theory of neural score estimators;
- variance-exploding and non-Gaussian noising, discrete-state diffusion, deterministic samplers
  (DDIM), and guidance.

The Kullback–Leibler divergence between Gaussian laws of equal isotropic variance belongs to
[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 1.3 and
is consumed.

## Conventions

- `d : ℕ` and `E = EuclideanSpace ℝ (Fin d)`. Laws are probability measures on `E` with its Borel
  σ-algebra.
- **Isotropic Gaussians.** `N(m, v) := multivariateGaussian m (v • 1)` for `m : E` and `v ≥ 0`;
  `N(m, 0)` is `dirac m`, and `N(0, 1)` is `stdGaussian E`. Variances are real numbers, and every
  statement about `N(m, v)` assumes `0 ≤ v`. For `v > 0`,
  `φ_v(y) := multivariateGaussianPDFReal 0 (v • 1) y = (2πv)^{−d/2} exp(−‖y‖²/(2v))`.
- **Schedules.** A noise schedule is `β : ℕ → ℝ` with `0 < β t < 1` for `t ≥ 1`. Write
  `α t = 1 − β t` and `ᾱ t = alphaBar β t = ∏_{s ∈ Finset.Icc 1 t} α s`, so `ᾱ 0 = 1` and
  `0 < ᾱ t < 1` for `t ≥ 1`. Time runs over `0, 1, …, T`.
- **Divergences** are Mathlib's `klDiv`, valued in `ℝ≥0∞`. The conditional divergence of kernels
  `κ, η` under `μ` is `klDiv (μ ⊗ₘ κ) (μ ⊗ₘ η)`, which equals `∫⁻ x, klDiv (κ x) (η x) ∂μ`
  (supplier `TauCeti.klDiv_compProd_right`).
- **Gaussian observation model.** `(Ω, P)` is a probability space, `X : Ω → E` and `Z : Ω → E` are
  measurable, `X` has law `μ₀`, `Z` has law `N(0, 1)` and is independent of `X`, `c : ℝ`, `s > 0`,
  and `Y = c • X + s • Z`. Conditional expectations given `Y` are
  `P[· | MeasurableSpace.comap Y _]`; measurability of `X` and `Z` makes this σ-algebra a
  sub-σ-algebra, without which Mathlib's `condExp` is `0`.
- **Score.** For a law with a positive differentiable density `p`, its score is `∇ log p`,
  Mathlib's `gradient (fun y ↦ Real.log (p y))`.
- **Paths.** Paths are elements of `Π i : Finset.Iic T, E`, written `x`, with `x i` the state at
  time `i`; `pathEval i hi` (written `eval i`) is evaluation at `i`, for `hi : i ≤ T`; it is measurable
  (`measurable_pathEval`).

## Exact supplier contracts

- [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 1.3:
  `klDiv_multivariateGaussian`, for `a, b : EuclideanSpace ℝ (Fin d)` and `v > 0`,
  `klDiv (multivariateGaussian a (v • 1)) (multivariateGaussian b (v • 1)) = ofReal (‖a − b‖²/(2v))`.
- Tau Ceti, at the roadmap pin:
  - `multivariateGaussianPDFReal` and `multivariateGaussian_eq_withDensity` (for a positive
    definite covariance) (`TauCeti/Probability/Distributions/Gaussian/Density.lean`);
  - `TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel` and, for `t > 0`,
    `TauCeti.exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le`
    (`TauCeti/Analysis/PDE/HeatKernel/Basic.lean`, `Bounds.lean`), with
    `φ_{s²} = heatKernel (s²/2)`;
  - `multivariateGaussian_conv_multivariateGaussian`, for positive semidefinite covariances
    (`TauCeti/Probability/Distributions/Gaussian/Sum.lean`);
  - `map_affine_multivariateGaussian` and `map_comp_multivariateGaussian`, for a positive
    semidefinite covariance (`TauCeti/Probability/Distributions/Gaussian/Affine.lean`);
  - `indepFun_sumEquivProd_multivariateGaussian_iff`, for a positive semidefinite covariance
    (`TauCeti/Probability/Distributions/Gaussian/Multivariate.lean`);
  - `EuclideanSpace.gaussianCondKernel`, `EuclideanSpace.gaussianCondMean_of_posDef` and
    `Matrix.gaussianCondCov_of_posDef` (for a positive definite observed block),
    `EuclideanSpace.map_snd_fst_multivariateGaussian` and `condDistrib_multivariateGaussian`
    (for a positive semidefinite covariance)
    (`TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.lean`);
  - `TauCeti.klDiv_compProd_right` (finite measure, finite kernels) and
    `TauCeti.klDiv_compProd_eq_add_lintegral` (finite measures, Markov kernels)
    (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`).
- Mathlib: `multivariateGaussian`, `stdGaussian`, `integral_id_multivariateGaussian`,
  `covariance_eval_multivariateGaussian` (positive semidefinite covariance),
  `EuclideanSpace.sumEquivProd`; `klDiv`, `klDiv_map_le` and `klDiv_compProd_eq_add` (finite
  measures, Markov kernels); `Measure.compProd`, `Measure.bind`, `Measure.condKernel`,
  `Kernel.comp`, `Kernel.comap`, `Kernel.prodMkLeft`, `Kernel.prodMkRight`,
  `Kernel.partialTraj`; `condExp`, `eLpNorm_condExp_le_eLpNorm`, `condDistrib`, `IndepFun`,
  `HasLaw`, `MemLp`; `gradient`, `Laplacian.laplacian`;
  `hasFDerivAt_integral_of_dominated_of_fderiv_le`.

## How to read the build

Layer 1 proves the two Gaussian facts that Layers 2 and 4 use: the divergence between isotropic
Gaussian laws and the Bayes update. Layer 2 builds the forward chain on them: the noising kernels,
the path law, its marginals and the posterior. Layer 3 is independent of Layers 1 and 2: the
smoothed density, Tweedie's formula and score matching. Layer 4 combines the three into the
variational bound, its surrogate and the noise-prediction closed form.

Each layer opens with its definitions. Each numbered target ends with a **Checks** list of tests
that a wrong convention or constant would fail, and a *Needs:* line naming the targets and
suppliers it uses. Every claim carries a source locator in parentheses, or says that it is proved
here. `Suggested.lean` declares every roadmap-owned name used below.

## Layer 1: isotropic Gaussian tools

### 1.1 Divergence between isotropic Gaussians

For `a, b : E` and `u, v > 0`, prove
`klDiv N(a, u) N(b, v) = ofReal (d/2 · (u/v − 1 − log (u/v)) + ‖a − b‖²/(2v))`
(`klDiv_multivariateGaussian_smul_one`). Its case `u = v` is the supplier
MathematicalStatisticsNonparametric 1.3, used as is; the new content is the case `u ≠ v`, proved
from the densities of `multivariateGaussian_eq_withDensity` and the mean and second moments of
`N(a, u)` (`integral_id_multivariateGaussian`, `covariance_eval_multivariateGaussian`).
Also prove, for `d ≥ 1`, `klDiv N(a, u) N(b, 0) = ∞` and `klDiv N(a, 0) N(b, v) = ∞`: one law is a
Dirac mass and the other has a density.

(Proved here.)

**Checks.**

- `d = 1`, `a = b`, `u = 1`, `v = 2`: `(1/2)(1/2 − 1 + log 2) = 0.0966`.
- `u = v`: the variance term is `0` and the formula is the supplier's.
- `d = 0`: `E` is a point, both laws are `dirac 0`, and both sides are `0`.

*Needs:* MathematicalStatisticsNonparametric 1.3; Tau Ceti `multivariateGaussian_eq_withDensity`;
Mathlib `klDiv`, `integral_id_multivariateGaussian`, `covariance_eval_multivariateGaussian`.

### 1.2 The isotropic Gaussian Bayes update

Let `m : E`, `u ≥ 0`, `v > 0`, `c : ℝ`, `w = c² u + v`, and let `gaussianKernel c v : Kernel E E`
be `x ↦ N(c • x, v)`. Prove that the joint law of `(X, Y)` with `X ~ N(m, u)` and
`Y | X ~ N(c X, v)` is also obtained by drawing `Y ~ N(c • m, w)` and then
`X | Y ~ N(m + (c u / w) • (Y − c • m), u v / w)`:

`N(m, u) ⊗ₘ gaussianKernel c v = ((N(c • m, w)) ⊗ₘ K).map Prod.swap` with
`K y = N(m + (c u / w) • (y − c • m), u v / w)` (`compProd_gaussianKernel_eq_swap`).

Proof route, all part of the target. Let `G` be the `multivariateGaussian` on
`EuclideanSpace ℝ (Fin d ⊕ Fin d)` with block mean `(m, 0)` and block covariance
`[[u, 0], [0, v]] ⊗ 1`. Its two blocks are independent
(`indepFun_sumEquivProd_multivariateGaussian_iff`) with laws `N(m, u)` and `N(0, v)`
(`map_comp_multivariateGaussian` along the two inclusions), so `G` transported along
`EuclideanSpace.sumEquivProd : EuclideanSpace ℝ (Fin d ⊕ Fin d) ≃ E × E` is the product of these
laws. The image of `G` under the linear map `(x, e) ↦ (x, c • x + e)` is, by
`map_affine_multivariateGaussian`, the `multivariateGaussian` with block mean `(m, c • m)` and
block covariance `S = [[u, c u], [c u, c² u + v]] ⊗ 1`, and transported along
`EuclideanSpace.sumEquivProd` it is the left side. The supplier
`EuclideanSpace.map_snd_fst_multivariateGaussian` factors this Gaussian law, with the observed
block first, as `N(c • m, w) ⊗ₘ EuclideanSpace.gaussianCondKernel _ S`, which is the right side
once the kernel is evaluated: the observed block `w • 1` is positive definite, so
`EuclideanSpace.gaussianCondMean_of_posDef` and `Matrix.gaussianCondCov_of_posDef` give the mean
`m + (c u / w) • (y − c • m)` and the covariance `(u − c² u² / w) • 1 = (u v / w) • 1`. The
supplier `condDistrib_multivariateGaussian` states the same kernel as a conditional distribution.
(Proved here from these suppliers.)

**Checks.**

- `c = 0`: `w = v`, `K y = N(m, u)`, and both sides are `N(m, u) ⊗ N(0, v)`.
- `u = 0`: `K y = N(m, 0) = dirac m`.
- `d = 1`, `m = 0`, `u = v = c = 1`: `w = 2`, `K y = N(y/2, 1/2)`.

*Needs:* Tau Ceti `map_affine_multivariateGaussian`, `map_comp_multivariateGaussian`,
`indepFun_sumEquivProd_multivariateGaussian_iff`,
`EuclideanSpace.map_snd_fst_multivariateGaussian`, `EuclideanSpace.gaussianCondKernel`,
`EuclideanSpace.gaussianCondMean_of_posDef`, `Matrix.gaussianCondCov_of_posDef`; Mathlib
`EuclideanSpace.sumEquivProd`, `Measure.compProd`.

### Examples

`klDiv N(0, 1) N(0, 2)` in `ℝ` and the Bayes update with `u = v = c = 1`.

### Dependencies

MathematicalStatisticsNonparametric 1.3 (for 1.1), the Tau Ceti Gaussian suppliers (the density
for 1.1; the affine image, block independence and the conditional kernel for 1.2) and Mathlib.

## Layer 2: the forward noising chain

### 2.1 Noising kernels

For `a ∈ [0, 1]` define `noiseKernel a : Kernel E E` by
`noiseKernel a x = (stdGaussian E).map (fun e ↦ √a • x + √(1 − a) • e)`. Prove:

- `noiseKernel a x = N(√a • x, 1 − a)` (`noiseKernel_apply`), and `noiseKernel a` is a Markov
  kernel;
- **composition:** `noiseKernel b ∘ₖ noiseKernel a = noiseKernel (a * b)` for `a, b ∈ [0, 1]`
  (`noiseKernel_comp`);
- `noiseKernel 1 = Kernel.id` and `noiseKernel 0 = Kernel.const E N(0, 1)`.

(Ho, Jain and Abbeel 2020, equation (2), for the kernel; proved here from the supplier
convolution law.)

**Checks.**

- `a = b = 1/2`: `N(√(1/2) • √(1/2) • x, (1/2)(1/2) + 1/2) = N(x/2, 3/4) = noiseKernel (1/4) x`.
- `a = 1`: the composite is `noiseKernel b`.
- The kernels commute: `a * b = b * a`.

*Needs:* Tau Ceti `multivariateGaussian_conv_multivariateGaussian`,
`map_affine_multivariateGaussian`; Mathlib `Kernel.comp`.

### 2.2 The forward chain and its marginals

For a schedule `β`, the forward step from time `n` to `n + 1` on paths is
`forwardStep β n = (noiseKernel (α (n + 1))).comap (eval n) : Kernel (Π i : Iic n, E) E`. Define
the path law
`forwardPath μ₀ β T = Kernel.partialTraj (forwardStep β) 0 T ∘ₘ μ₀.map (fun x _ ↦ x)`,
where `μ₀` is transported to `Π i : Iic 0, E`, and the marginals
`forwardMarginal μ₀ β t = μ₀.bind (noiseKernel (ᾱ t))`. Prove:

- `(forwardPath μ₀ β T).map (eval t) = forwardMarginal μ₀ β t` for `t ≤ T`, and the joint law of
  `(x 0, x t)` is `μ₀ ⊗ₘ noiseKernel (ᾱ t)`, so that `q(x_t | x_0) = noiseKernel (ᾱ t)`
  (`forwardPath_map_eval`; from 2.1 by induction on `t`);
- if `∫ ‖x‖² ∂μ₀ ≤ M` with `‖x‖²` integrable and `t ≥ 1`:
  `klDiv (forwardMarginal μ₀ β t) N(0, 1) ≤ ofReal ((ᾱ t · M − d · ᾱ t − d · log (1 − ᾱ t))/2)`
  (`klDiv_forwardMarginal_le`), so the marginals tend to `N(0, 1)` in divergence when `ᾱ t → 0`.

The bound is the data-processing inequality `klDiv_map_le` applied to
`μ₀ ⊗ₘ noiseKernel a` and `μ₀ ⊗ₘ Kernel.const E N(0, 1)`, then `TauCeti.klDiv_compProd_right` and
1.1 with `klDiv N(√a x, 1 − a) N(0, 1) = (a ‖x‖² − d a − d log (1 − a))/2`. (Ho, Jain and Abbeel
2020, equation (4); the bound is proved here.)

**Checks.**

- `μ₀ = N(0, 1)`: every marginal is `N(0, 1)`, and with `M = d` the bound is
  `−(d/2) log (1 − ᾱ) ≥ 0`.
- `β t = 1/10` for all `t`: `ᾱ t = (9/10)^t`.
- `μ₀ = dirac 0` with `d = 1`, `ᾱ = 1/2`, `M = 0`: the bound is `(−1/2 + log 2)/2 = 0.0966`, which
  equals `klDiv N(0, 1/2) N(0, 1)`.

*Needs:* 1.1, 2.1; Tau Ceti `TauCeti.klDiv_compProd_right`; Mathlib `klDiv_map_le`,
`Kernel.partialTraj`, `Kernel.comap`.

### 2.3 The DDPM posterior

For `t ≥ 1` define `postVar β t = (1 − ᾱ (t − 1)) β t / (1 − ᾱ t)` (written `β̃ t`),
`postMean β t x₀ x = (√ᾱ(t − 1) β t / (1 − ᾱ t)) • x₀ + (√α t (1 − ᾱ (t − 1)) / (1 − ᾱ t)) • x`
(written `μ̃ t x₀ x`), and `postKernel β t : Kernel (E × E) E` by
`postKernel β t (x₀, x) = N(μ̃ t x₀ x, β̃ t)`. Prove, for every `x₀`:

`noiseKernel (ᾱ (t − 1)) x₀ ⊗ₘ noiseKernel (α t) = ((noiseKernel (ᾱ t) x₀) ⊗ₘ (fun x ↦ postKernel β t (x₀, x))).map Prod.swap`

(`ddpm_posterior`). Also prove the noise-prediction form: if
`x = √ᾱ t • x₀ + √(1 − ᾱ t) • ε`, then `μ̃ t x₀ x = (1/√α t) • (x − (β t / √(1 − ᾱ t)) • ε)`
(`postMean_eq_noise`).

This is 1.2 with `m = √ᾱ(t − 1) • x₀`, `u = 1 − ᾱ (t − 1)`, `c = √α t`, `v = β t`, for which
`c² u + v = 1 − ᾱ t`. (Ho, Jain and Abbeel 2020, equations (6), (7) and (10); proved here.)

**Checks.**

- `t = 1`: `ᾱ 0 = 1`, so `β̃ 1 = 0`, `μ̃ 1 x₀ x = x₀`, and `postKernel β 1 (x₀, x) = dirac x₀`.
- `β t = 1/10` for all `t` and `t = 2`: `ᾱ 1 = 9/10`, `ᾱ 2 = 81/100`,
  `β̃ 2 = (1/10)(1/10)/(19/100) = 1/19`.
- `β̃ t ≤ β t`, since `ᾱ t ≤ ᾱ (t − 1)`.

*Needs:* 1.2, 2.1.

### Examples

The constant schedule `β t = 1/10`, and the forward chain started at `dirac x₀`.

### Dependencies

Layer 1 (1.1 for 2.2, 1.2 for 2.3); the Tau Ceti convolution and affine-image laws (2.1); Tau
Ceti `TauCeti.klDiv_compProd_right` and Mathlib's `klDiv_map_le`, `Kernel.partialTraj` and
`Kernel.comap` (2.2).

## Layer 3: Tweedie's formula and score matching

### 3.1 The smoothed density and its score

In the Gaussian observation model, prove that `Y` has the law
`volume.withDensity (ofReal ∘ smoothedDensity μ₀ c s)` with
`smoothedDensity μ₀ c s y = ∫ φ_{s²} (y − c • x) ∂μ₀ x` (`hasLaw_smoothedDensity`), that this
density `p` is positive and `C^∞`, and that
`∇p y = −(1/s²) ∫ (y − c • x) φ_{s²} (y − c • x) ∂μ₀ x`, with all derivatives taken under the
integral. No moment assumption on `μ₀` is needed: every derivative of `φ_{s²}` is bounded, by
the suppliers named in the next item. Define `noisyScore μ₀ c s y = ∇ log p y = ∇p y / p y`.

- For `s > 0`, `multivariateGaussianPDFReal 0 (s² • 1) = TauCeti.heatKernel (s²/2)` on `E`: both
  are `y ↦ (2πs²)^{−d/2} exp(−‖y‖²/(2s²))`. Hence `φ_{s²}` is `C^∞`
  (`TauCeti.contDiff_heatKernel`) and, for each `k`, `‖D^k φ_{s²}‖` is bounded
  (`TauCeti.exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le` with `t = s²/2` and
  weight exponent `0`, whose right side `C · heatKernel s²` is bounded); these bounds are the
  dominating functions for differentiation under the integral.

(Efron 2011, equation (1.3), for the density when `d = 1` and `c = 1`; proved here.)

**Checks.**

- `μ₀ = dirac x₀`: `p = φ_{s²}(· − c x₀)` and `noisyScore μ₀ c s y = −(y − c x₀)/s²`.
- `μ₀ = N(0, τ²)`: `Y` has law `N(0, c² τ² + s²)` and `noisyScore μ₀ c s y = −y/(c² τ² + s²)`.
- `c = 0`: `p = φ_{s²}` whatever `μ₀` is.

*Needs:* Tau Ceti `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`,
`TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel`,
`TauCeti.exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le`; Mathlib
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `gradient`.

### 3.2 Tweedie's formula

Prove, in the Gaussian observation model:

- **noise form:** `P[Z | Y] =ᵐ fun ω ↦ −s • noisyScore μ₀ c s (Y ω)`, with no moment assumption
  on `μ₀` (`tweedie_noise`);
- **first order:** if `X` is integrable and `c ≠ 0`,
  `P[X | Y] =ᵐ fun ω ↦ c⁻¹ • (Y ω + s² • noisyScore μ₀ c s (Y ω))` (`tweedie`);
- **second order:** if `X` is integrable and `c ≠ 0`, with `W = X − P[X | Y]`, the conditional
  covariance `P[fun ω ↦ (innerSL ℝ (W ω)).smulRight (W ω) | Y]` is almost surely
  `(s²/c²) • (1 + s² • fderiv ℝ (noisyScore μ₀ c s) (Y ω))` in `E →L[ℝ] E`
  (`tweedie_covariance`); taking traces,
  `P[‖W‖² | Y] =ᵐ (s²/c²)(d + s² Δ (log p) (Y ω))` with `Δ = Laplacian.laplacian`.

The noise form follows from 3.1 by computing `∫ ψ(y) ∇p(y) dy` for bounded measurable `ψ`. The
first order follows from `X = c⁻¹ (Y − s Z)`, and the second from `W = −(s/c)(Z − P[Z | Y])`, so
only `Z`'s moments enter. (Robbins 1956, equations (44)–(46), p. 162, for an exponential family,
credited there to Tweedie; Efron 2011, equations (1.4) and (2.8), for `d = 1` and `c = 1`; proved
here.)

**Checks.**

- `μ₀ = dirac x₀`: `P[X | Y] = x₀`, the formula gives `c⁻¹ (y − (y − c x₀)) = x₀`, and the
  covariance is `(s²/c²)(1 − 1) = 0`.
- `μ₀ = N(0, τ²)`, `d = 1`: `E[X | Y = y] = c τ² y/(c² τ² + s²)`, and the posterior variance is
  `τ² s²/(c² τ² + s²) = (s²/c²)(1 − s²/(c² τ² + s²))`.
- A two-component Gaussian mixture prior: both orders agree with the closed-form mixture
  posterior.

*Needs:* 3.1; Mathlib `condExp`, `IndepFun`, `HasLaw`, `Laplacian.laplacian`.

### 3.3 Score matching

Prove `MemLp (fun ω ↦ noisyScore μ₀ c s (Y ω)) 2 P` with
`∫ ‖noisyScore μ₀ c s (Y ω)‖² ∂P ≤ d / s²` (`memLp_noisyScore`), by 3.2's noise form and the
`L²` contraction of the conditional expectation (`eLpNorm_condExp_le_eLpNorm`), since
`∫ ‖Z‖² ∂P = d`. For measurable `f : E → E` with `‖f (Y ω)‖²` integrable, define
`J_ESM f = ∫ ‖f (Y ω) − noisyScore μ₀ c s (Y ω)‖² ∂P` and
`J_DSM f = ∫ ‖f (Y ω) + s⁻¹ • Z ω‖² ∂P`. Prove:

- `J_DSM f = J_ESM f + (d / s² − ∫ ‖noisyScore μ₀ c s (Y ω)‖² ∂P)` (`dsm_eq_esm_add`), where the
  constant does not depend on `f` and is nonnegative;
- among such `f`, `f` minimizes `J_DSM` if and only if `f = noisyScore μ₀ c s` almost everywhere
  for the law of `Y`;
- **noise prediction:** among measurable `g` with `‖g (Y ω)‖²` integrable,
  `∫ ‖g (Y ω) − Z ω‖² ∂P` is minimized exactly by `g = −s • noisyScore μ₀ c s` almost everywhere
  for the law of `Y` (`noisePrediction_minimizer`).

The last two items are the `L²`-orthogonality of the conditional expectation. (Hyvärinen 2005,
equation (2), for the explicit objective; Vincent 2011 (technical report numbering),
Section 4.2, equation (11), and the Appendix, for the equivalence; proved here.)

**Checks.**

- `μ₀ = dirac x₀`: the score is known exactly, `‖noisyScore μ₀ c s (Y)‖² = ‖Z‖²/s²`, and the
  constant is `0`.
- `μ₀ = N(0, τ²)`, `d = 1`: the constant is `1/s² − 1/(c² τ² + s²) ≥ 0`.
- `f = 0`: `J_DSM 0 = d/s²` and `J_ESM 0 = ∫ ‖noisyScore‖²`, matching the constant.

*Needs:* 3.1, 3.2; Mathlib `condExp`, `eLpNorm_condExp_le_eLpNorm`, `MemLp`.

### Examples

Tweedie's formula for a Gaussian prior and for a two-component Gaussian mixture.

### Dependencies

The Tau Ceti Gaussian density and heat-kernel bounds (3.1) and Mathlib's parametric
differentiation, conditional expectation and its `L²` contraction. No other layer is used.

## Layer 4: the variational bound

Fix a schedule `β`, a horizon `T ≥ 1`, an initial law `μ₀`, a prior `π` on `E`, and reverse
model kernels `κ t : Kernel E E` (from `x_t` to the law of `x_{t−1}`) for `1 ≤ t ≤ T`, all Markov.
Let `reverseIndex T : (Π i : Iic T, E) → (Π i : Iic T, E)` be `(reverseIndex T x) i = x (T − i)`.
Define `modelPath π κ T` as the transport by `reverseIndex T` of
`Kernel.partialTraj (fun n ↦ (κ (T − n)).comap (eval n)) 0 T ∘ₘ π.map (fun x _ ↦ x)`: it draws
`x_T ~ π` and then `x_{t−1} ~ κ t x_t` for `t = T, …, 1`. Its marginal at time `0` is
`(modelPath π κ T).map (eval 0)`. Write `qₜ = forwardMarginal μ₀ β t` and
`ρₜ = μ₀ ⊗ₘ noiseKernel (ᾱ t)`, the joint law of `(x 0, x t)`.

### 4.1 The reverse Markov property and the path divergence

Let `rev t : Kernel E E` be reverse kernels of the forward chain, `IsReverseKernel μ₀ β T rev`:
`(forwardPath μ₀ β T).map (fun x ↦ (x t, x (t − 1))) = qₜ ⊗ₘ rev t` for `1 ≤ t ≤ T`. Such kernels exist because
`E` is standard Borel (Mathlib `condDistrib`). Prove:

- **reverse Markov property:** `(forwardPath μ₀ β T).map (reverseIndex T)` equals
  `Kernel.partialTraj (fun n ↦ (rev (T − n)).comap (eval n)) 0 T ∘ₘ q_T.map (fun x _ ↦ x)`
  (`forwardPath_reverse`): read backwards, the forward chain is the Markov chain started at `q_T`
  with kernels `rev t`;
- **chain rule:**
  `klDiv (forwardPath μ₀ β T) (modelPath π κ T) = klDiv q_T π + Σ_{t=1}^T klDiv (qₜ ⊗ₘ rev t) (qₜ ⊗ₘ κ t)`
  (`klDiv_forwardPath_eq`), from the reverse Markov property, invariance of `klDiv` under the
  measurable bijection `reverseIndex T`, and `klDiv_compProd_eq_add` along the trajectory;
- **the variational bound:**
  `klDiv μ₀ ((modelPath π κ T).map (eval 0)) ≤ klDiv (forwardPath μ₀ β T) (modelPath π κ T)`,
  by `klDiv_map_le` for `eval 0` (`klDiv_le_klDiv_forwardPath`).

The variational bound holds for every `β : ℕ → ℝ`: `noiseKernel a` is a Markov kernel for every
real `a`, and the time-`0` marginal of `forwardPath μ₀ β T` is `μ₀`. The reverse Markov property
and the chain rule assume a schedule, for which `qₜ` is the time-`t` marginal of the path law
(2.2).

(Ho, Jain and Abbeel 2020, equation (3) for the bound and equation (16) for the chain rule, both
written there with entropies; proved here.)

**Checks.**

- `κ t = rev t` for all `t` and `π = q_T`: the path divergence is `0` and the model reproduces
  `μ₀` at time `0`.
- `T = 1`: the chain rule reads `klDiv q₁ π + klDiv (q₁ ⊗ₘ rev 1) (q₁ ⊗ₘ κ 1)`.
- `T = 0`: the sum is empty, `q₀ = μ₀`, and both sides of the chain rule are `klDiv μ₀ π`.
- The bound is the data-processing inequality and holds when both sides are `∞`.

*Needs:* 2.2; Mathlib `klDiv_compProd_eq_add`, `klDiv_map_le`, `condDistrib`,
`Kernel.partialTraj`.

### 4.2 The posterior-conditioned surrogate

Prove, for `1 ≤ t ≤ T`:

- the law of `((x 0, x t), x (t − 1))` under `forwardPath μ₀ β T` is `ρₜ ⊗ₘ postKernel β t`
  (`forwardPath_map_posterior`), from 2.2 and 2.3; hence
  `(ρₜ ⊗ₘ postKernel β t).map (fun p ↦ (p.1.2, p.2)) = qₜ ⊗ₘ rev t`;
- **the surrogate identity:** for a probability measure `ρ` on `E × E` and Markov kernels
  `post : Kernel (E × E) E`, `rev, κ : Kernel E E` with
  `(ρ ⊗ₘ post).map (fun p ↦ (p.1.2, p.2)) = ρ.map Prod.snd ⊗ₘ rev`,
  `klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E κ) = klDiv (ρ.map Prod.snd ⊗ₘ rev) (ρ.map Prod.snd ⊗ₘ κ) + klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E rev)`
  in `ℝ≥0∞` (`klDiv_posterior_eq_add`); with `ρ = ρₜ`, `post = postKernel β t` and the first
  bullet this is the identity for `1 ≤ t ≤ T`. Proof: reorder the three coordinates as
  `((x_t, x_{t−1}), x₀)`, which preserves `klDiv` (`klDiv_map_le` for the reordering and for its
  inverse). With `c` a conditional kernel of `x₀` given `x_t` under `ρ` (`Measure.condKernel` of
  `ρ.map Prod.swap`), the second law becomes
  `(ρ.map Prod.snd ⊗ₘ κ) ⊗ₘ Kernel.prodMkRight E c`, whatever `κ` is, and the first is
  disintegrated over its marginal `ρ.map Prod.snd ⊗ₘ rev`. By
  `TauCeti.klDiv_compProd_eq_add_lintegral` the left side is
  `klDiv (ρ.map Prod.snd ⊗ₘ rev) (ρ.map Prod.snd ⊗ₘ κ)` plus a term that does not depend on `κ`;
  taking `κ = rev` identifies that term with the last divergence;
- **the conditional mutual information is finite:** for `2 ≤ t ≤ T`, with no moment assumption
  on `μ₀`,
  `Iₜ := klDiv (ρₜ ⊗ₘ postKernel β t) (ρₜ ⊗ₘ Kernel.prodMkLeft E (rev t)) ≤ ofReal ((d/2) log ((1 − ᾱ t)/(α t (1 − ᾱ (t − 1)))))`
  (`klDiv_posterior_rev_le`). By the surrogate identity with `κ = Q`, `Iₜ` is at most
  `klDiv (ρₜ ⊗ₘ postKernel β t) (ρₜ ⊗ₘ Kernel.prodMkLeft E Q)` for every Markov kernel `Q`; with
  `Q x = N(x/√α t, β t/α t)` that divergence is the `ρₜ`-average of the pointwise divergences
  (`TauCeti.klDiv_compProd_right`), which 1.1 computes, and it equals the right side, the
  linear terms cancelling because `α t (1 − ᾱ (t − 1)) + β t = 1 − ᾱ t`.

Hence, with the surrogate
`L(κ, π) = klDiv q_T π + Σ_{t=2}^T klDiv (ρₜ ⊗ₘ postKernel β t) (ρₜ ⊗ₘ Kernel.prodMkLeft E (κ t)) + klDiv (q₁ ⊗ₘ rev 1) (q₁ ⊗ₘ κ 1)`,
`L(κ, π) = klDiv (forwardPath μ₀ β T) (modelPath π κ T) + Σ_{t=2}^T Iₜ` with a finite sum that
does not depend on the model. Minimizing `L` over models is minimizing the path divergence.

(Sohl-Dickstein et al. 2015, equation (14) and Appendix B, and Ho, Jain and Abbeel 2020,
equation (5) and Appendix A, equations (17)–(22), for the surrogate; the identity with the exact
finite constant is proved here.)

**Checks.**

- `μ₀ = dirac x₀`: `postKernel β t (x₀, ·) = rev t`, `Iₜ = 0`, and the surrogate is the path
  divergence.
- For `d ≥ 1` the term `t = 1` cannot be conditioned on `x₀`: `postKernel β 1 (x₀, x) = dirac x₀`,
  and its divergence from a Gaussian `κ 1 x` is `∞`.
- `μ₀ = N(0, τ²)`, `d = 1`, `ᾱ (t − 1) = α t = 9/10`, `τ² = 1`: `Iₜ = 0.3209` and the bound is
  `(1/2) log (0.19/0.09) = 0.3736`; as `τ² → ∞`, `Iₜ` tends to the bound.

*Needs:* 1.1, 2.2, 2.3, 4.1; Tau Ceti `TauCeti.klDiv_compProd_eq_add_lintegral`,
`TauCeti.klDiv_compProd_right`; Mathlib `klDiv_map_le`, `Measure.condKernel`,
`Kernel.prodMkRight`.

### 4.3 The Gaussian closed form

Let `κ t = epsModelKernel β t (σ t) (ε̂ t)`, that is `κ t x = N(m t x, σ t²)` with `σ t > 0` and
`m t x = (1/√α t) • (x − (β t/√(1 − ᾱ t)) • ε̂ t x)` for a measurable `ε̂ t : E → E`, and let
`wₜ = β t² / (2 σ t² α t (1 − ᾱ t))`. Prove:

- for `t ≥ 2`, pointwise, for `x₀ : E` and `x = √ᾱ t • x₀ + √(1 − ᾱ t) • ε`:
  `klDiv (postKernel β t (x₀, x)) (κ t x) = ofReal (d/2 · (β̃ t/σ t² − 1 − log (β̃ t/σ t²)) + wₜ ‖ε − ε̂ t x‖²)`
  (`klDiv_postKernel_gaussian`);
- for `t ≥ 2`, integrated, if `‖ε̂ t (x t)‖²` is integrable under `ρₜ`, with the recovered noise
  `ε(x₀, x) = noiseOf β t (x₀, x) = (x − √ᾱ t • x₀)/√(1 − ᾱ t)`:
  `klDiv (ρₜ ⊗ₘ postKernel β t) (ρₜ ⊗ₘ Kernel.prodMkLeft E (κ t)) = ofReal (d/2 · (β̃ t/σ t² − 1 − log (β̃ t/σ t²)) + wₜ ∫ ‖ε p − ε̂ t p.2‖² ∂ρₜ)`
  (`klDiv_posterior_gaussian_integral`);
- for `t ≥ 1`, among measurable `ε̂ t` with `‖ε̂ t (x t)‖²` integrable under `ρₜ`, the integral
  `∫ ‖ε p − ε̂ t p.2‖² ∂ρₜ` is minimized exactly by
  `ε̂ t = −√(1 − ᾱ t) • noisyScore μ₀ (√ᾱ t) (√(1 − ᾱ t))` almost everywhere for `qₜ`
  (`posteriorLoss_minimizer`), which is 3.3's noise prediction with `c = √ᾱ t`, `s = √(1 − ᾱ t)`.

(Ho, Jain and Abbeel 2020, equations (8) and (10)–(12); proved here from 1.1, 2.3 and 3.3.)

**Checks.**

- `ε̂ t x = ε`: the mean term is `0`.
- `σ t² = β̃ t`: the variance term is `0` and the divergence is `wₜ ‖ε − ε̂‖²`.
- `β t = 1/10` for all `t`, `t = 2`, `σ 2² = 1/19`: `w₂ = (1/100)/(2 · (1/19) · (9/10) · (19/100)) = 5/9`.

*Needs:* 1.1, 2.3, 3.2, 3.3, 4.2; Tau Ceti `TauCeti.klDiv_compProd_right`.

### Examples

The two-step chain `T = 2` with the constant schedule `1/10`, and the Dirac initial law.

### Dependencies

Layers 1–3: 1.1 (4.2, 4.3), 2.2 (4.1, 4.2), 2.3 (4.2, 4.3), 3.2 and 3.3 (4.3). Tau Ceti
`TauCeti.klDiv_compProd_eq_add_lintegral` and `TauCeti.klDiv_compProd_right`; Mathlib
`klDiv_compProd_eq_add`, `klDiv_map_le`, `condDistrib`, `Measure.condKernel` and
`Kernel.partialTraj`.

## Downstream consumers

No roadmap on main consumes this one. The names offered to consumers are the definitions
`noiseKernel`, `forwardPath`, `forwardMarginal`, `postKernel`, `smoothedDensity`, `noisyScore`
and `modelPath`, and the statements `noiseKernel_comp` (2.1), `forwardPath_map_eval` (2.2),
`ddpm_posterior` (2.3), `tweedie_noise`, `tweedie` and `tweedie_covariance` (3.2),
`dsm_eq_esm_add` and `noisePrediction_minimizer` (3.3), `klDiv_forwardPath_eq` and
`klDiv_le_klDiv_forwardPath` (4.1), `klDiv_posterior_eq_add` (4.2) and
`klDiv_posterior_gaussian_integral` (4.3).

## References

- B. Efron, *Tweedie's formula and selection bias*, J. Amer. Statist. Assoc. **106** (2011),
  1602–1614.
- J. Ho, A. Jain and P. Abbeel, *Denoising diffusion probabilistic models*, NeurIPS 2020,
  arXiv:2006.11239.
- A. Hyvärinen, *Estimation of non-normalized statistical models by score matching*, J. Mach.
  Learn. Res. **6** (2005), 695–709.
- H. Robbins, *An empirical Bayes approach to statistics*, Proc. Third Berkeley Symp. Math.
  Statist. Probab. **1** (1956), 157–163.
- J. Sohl-Dickstein, E. Weiss, N. Maheswaranathan and S. Ganguli, *Deep unsupervised learning
  using nonequilibrium thermodynamics*, ICML 2015, arXiv:1503.03585.
- P. Vincent, *A connection between score matching and denoising autoencoders*, Technical Report
  1358, DIRO, Université de Montréal, 2010; published in Neural Comput. **23** (2011), 1661–1674.

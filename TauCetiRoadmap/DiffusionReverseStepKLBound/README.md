# Roadmap: Kullback–Leibler bound for one reverse step of a diffusion model

**Summary.** A denoising diffusion model noises data `x₀ ~ μ₀` on `ℝ^d` by a Gaussian Markov chain
with a schedule `β_t ∈ (0, 1)` and marginals `q_t`, and imitates each step of the reversed chain by
an isotropic Gaussian kernel of variance `β_t/(1 − β_t)`, whose mean is written through a
measurable noise predictor `ε̂_t`. This roadmap bounds the Kullback–Leibler divergence between one
exact reverse step and one model step. The standing hypothesis is that the data lie in the closed
ball of radius `R`.

The main theorem says that for `t ≥ 2` the divergence between the joint law of `(x_t, x_{t−1})`,
where `x_{t−1} ~ q_{t−1}` and `x_t` is obtained from it by one noising step, and the law of
`x_t ~ q_t` followed by one model step is at most the sum of two terms. The first,
`d β_t² L_{t−1}²/(2(1 − β_t)²)`, is a discretization term, where `L_{t−1}` is an explicit
Lipschitz constant of the score of `q_{t−1}`. The second is the training error
`E‖ε̂_t − ε*_t‖²` under `q_t`, weighted by `β_t/(2(1 − ᾱ_t))`, where `ε*_t` is the ideal noise
predictor and `ᾱ_t = (1 − β₁) ⋯ (1 − β_t)`.

The engine is that the exact reverse step is a Gaussian tilted by the noised data density, and
three facts about Gaussian references, each a theorem here. A logarithmic Sobolev inequality with
constant `C` bounds the divergence of `h μ` from `μ` by `C/2` times the relative Fisher
information, for every positive continuously differentiable probability density `h`, bounded or
not. For a law with a first moment, moving the centre of an isotropic Gaussian reference of
variance `σ²` from the law's mean to a point at distance `r` from it adds exactly `r²/(2σ²)` to
the divergence of the law from the reference. A Gaussian of variance `σ²` tilted by a function
whose gradient is `L`-Lipschitz is within `σ² L²/2` times the tilted law's variance of the Gaussian
with the tilted law's mean, with no convexity assumed.

The size of the bound is governed by `L_{t−1}`, which for small `β₁` and `R > 0` is about `R²/β₁²`
at `t = 2`. In dimension one, with data at `±1` and the ideal noise predictor, the bound at
`t = 2` for the constant schedule `β = 0.1` is `39.51` against an actual divergence of `0.128`;
for `β₁ = 0.5` and `β₂ = 0.02` it is `8.33 · 10⁻⁴` against `1.64 · 10⁻⁴`. The roadmap
makes no statement about the model chain as a whole: summed over the steps of the schedules in
common use, the bound is uninformative.

The forward chain, the model kernels and the score come from the denoising-diffusion roadmap; the
reverse step by Bayes' formula, its mean and the Lipschitz bound of the score from the score-based
diffusion roadmap; the Gaussian logarithmic Sobolev inequality from the log-concave one.

Layer 1 proves the three Gaussian facts, Layer 2 the one-step bound.

## Conventions

- `d : ℕ` and `E = EuclideanSpace ℝ (Fin d)` with its Borel σ-algebra and Lebesgue measure.
  `N(m, v) := multivariateGaussian m (v • 1)` for `m : E` and `v > 0`; `N(0, 1)` is
  `stdGaussian E`. `∇` is Mathlib's `gradient`.
- **Schedules.** `β : ℕ → ℝ` with `0 < β t < 1` for `t ≥ 1`, `α t = 1 − β t` and
  `ᾱ t = alphaBar β t = ∏_{s ∈ Icc 1 t} α s`, as in DenoisingDiffusion (Conventions).
- **Forward chain.** `noiseKernel a x = N(√a • x, 1 − a)` (DenoisingDiffusion 2.1) and the
  marginals `q_t = forwardMarginal μ₀ β t = μ₀.bind (noiseKernel (ᾱ t))`
  (DenoisingDiffusion 2.2). The data law `μ₀` is a probability measure with `‖x‖ ≤ R` for
  `μ₀`-almost every `x`; this forces `R ≥ 0`.
- **Score.** `smoothedDensity μ₀ c s` is the density of `c • X + s • Z` and `noisyScore μ₀ c s`
  its score `∇ log p` (DenoisingDiffusion 3.1). The score of `q_t` is
  `noisyScore μ₀ (√ᾱ t) (√(1 − ᾱ t))`.
- **Model.** The model kernel at step `t` is
  `epsModelKernel β t (√(β t/(1 − β t))) (ε̂ t)` (DenoisingDiffusion 4.3): `x ↦ N(m_t x, β_t/α_t)`
  with `m_t x = (1/√α_t)(x − (β_t/√(1 − ᾱ_t)) ε̂_t x)` for a measurable `ε̂_t : E → E`, the
  noise-prediction form of the mean of Ho, Jain and Abbeel (2020). The variance is fixed at
  `β_t/α_t`. A non-measurable `ε̂_t` would make the kernel the junk zero kernel (Mathlib's
  `Kernel.map` of a non-measurable map), so measurability is a standing hypothesis.
- **Divergences.** `klDiv` is Mathlib's, valued in `ℝ≥0∞`. Training errors are lower integrals
  `∫⁻` of `‖·‖ₑ²`, so no integrability of `ε̂_t` is assumed.
- **Logarithmic Sobolev inequality.** `LogSobolevInequality μ C` and
  `relativeFisherInformation μ h = ∫⁻ ‖∇h‖²/h dμ` are those of LogConcaveFunctionalInequalities
  1.2 and 1.3, in the normalisation `Ent_μ(f²) ≤ 2C ∫ ‖∇f‖² dμ`, required for continuously
  differentiable `f` that are bounded with a bounded gradient.
- The definitions of the two supplier roadmaps are copied verbatim into `Suggested.lean`, as the
  Scope and ownership section below lists; they are not restated as targets.

## Layer 1: three Gaussian facts

### 1.1 The logarithmic Sobolev inequality for unbounded densities

Prove `klDiv_withDensity_le_relativeFisherInformation`: if `μ` is a probability measure on `E`
with `LogSobolevInequality μ C` for a real `C`, and `h : E → ℝ` is continuously differentiable,
positive everywhere, with `∫ h dμ = 1`, then

    klDiv (μ.withDensity (ofReal ∘ h)) μ ≤ ofReal (C/2) * relativeFisherInformation μ h.

The inequality in the definition is required only of bounded test functions with bounded
gradients; LogConcaveFunctionalInequalities (Conventions) reads it in divergence form only for
`h = f²` with `f` such a function. Here `h` may be unbounded, with an unbounded gradient, as the
densities of Layer 2 are. The route of LogConcaveFunctionalInequalities 4.2 uses the same extension,
for the densities of a Fokker–Planck flow, inside its proof and without a statement; 1.1 states
it. Positivity is used by the route, to make `√h` continuously differentiable; densities with
zeros are not treated.

Route. Positivity makes `√h` continuously differentiable, with `‖∇√h‖² = ‖∇h‖²/(4h)`. If the
right side is `∞` there is nothing to prove. Let `ψ_n` be smooth and nondecreasing, with
`ψ_n(u) = u` on `[0, n]`, `ψ_n(u) ≤ min(u, n + 1)` for `u ≥ 0` and `0 ≤ ψ_n′ ≤ 1`, and let `χ` be
a smooth cut-off with `0 ≤ χ ≤ 1`, `χ = 1` on the unit ball and `χ = 0` outside the ball of
radius `2`. Then `f_n(y) = ψ_n(√h y) χ(y/n)` is a test function. As `n → ∞`, `f_n² → h`
pointwise with `f_n² ≤ h`, so `∫ f_n² dμ → 1` by dominated convergence; Fatou's lemma applied
to `u log u + 1/e ≥ 0` gives `∫ h log h dμ ≤ liminf ∫ f_n² log f_n² dμ`, and this limit inferior
is finite when `I` is, which gives the integrability of `h log h` that `klDiv` needs; and
`‖∇f_n‖_{L²(μ)} ≤ ‖∇√h‖_{L²(μ)} + ‖∇χ‖_∞/n` because `ψ_n(√h) ≤ √h` and `‖√h‖_{L²(μ)} = 1`. For
`C > 0` the inequality for `f_n` passes to the limit and gives
`∫ h log h dμ ≤ 2C ∫ ‖∇√h‖² dμ = (C/2) I`. For `C ≤ 0` the right side of the inequality for `f_n`
is at most `0`, so the same limit gives `∫ h log h dμ ≤ 0`, whatever `I` is: the divergence is `0`,
in agreement with the right side `ofReal (C/2) · I = 0` (`0 · ∞ = 0` in `ℝ≥0∞`). Since `μ` and
`h μ` are probability measures, `klDiv (h μ) μ = ∫ h log h dμ`. (Proved here; Gross 1975 for the
Gaussian inequality.)

**Checks.**

- Equality on translates: for `μ = N(c, σ²)` and `C = σ²` (the inequality used in 1.3 below), the
  density `h(y) = exp(⟪m, y − c⟫/σ² − ‖m‖²/(2σ²))` gives `h μ = N(c + m, σ²)`; the divergence is
  `‖m‖²/(2σ²)`, the Fisher information is `∫ ‖∇ log h‖² d(h μ) = ‖m‖²/σ⁴`, and the right side is
  `(σ²/2)(‖m‖²/σ⁴) = ‖m‖²/(2σ²)`. So for this `μ` the factor `C/2` cannot be lowered; and `h`
  is unbounded.
- `d = 0`: `μ` is the Dirac mass, `h = 1`, and both sides are `0` for every `C`.
- `μ` a Dirac mass in dimension `d ≥ 1`: the inequality holds for `C ≥ 0`, `h = 1` on the
  support of `μ`, and the divergence is `0`.

*Needs:* LogConcaveFunctionalInequalities 1.2 (`LogSobolevInequality`) and 1.3
(`relativeFisherInformation`); Mathlib `klDiv`, `ContDiffBump`,
`Real.smoothTransition`, `MeasureTheory.lintegral_liminf_le`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`.

### 1.2 Moving the centre of a Gaussian reference

Prove `klDiv_multivariateGaussian_eq_add`: for a probability measure `ν` on `E` with a finite
first moment and mean `b = ∫ y dν`, every `a : E` and every `σ > 0`,

    klDiv ν N(a, σ²) = klDiv ν N(b, σ²) + ofReal (‖a − b‖²/(2σ²)).

Route. The log-likelihood ratio of `N(b, σ²)` against `N(a, σ²)` is the affine function
`y ↦ (‖y − a‖² − ‖y − b‖²)/(2σ²)` (Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity` and
`TauCeti.Probability.multivariateGaussianPDFReal_def`). It is integrable against `ν` and against
`N(b, σ²)`, with the same integral `‖a − b‖²/(2σ²)` against both, because both laws have mean
`b`. If `ν ≪ N(b, σ²)`, Csiszár's Pythagorean identity (Tau Ceti `TauCeti.klDiv_eq_klDiv_add_klDiv`)
gives `klDiv ν N(a) = klDiv ν N(b) + klDiv N(b) N(a)`, and the last term is `‖a − b‖²/(2σ²)`
(MathematicalStatisticsNonparametric 1.3, `klDiv_multivariateGaussian`). Otherwise `ν` is not
absolutely continuous with respect to Lebesgue measure, hence not with respect to `N(a, σ²)`
either, and both sides are `∞`. Only the first moment of `ν` is used. Equivalently,
`N(a, σ²)` is the tilt of `N(b, σ²)` by the negative of that affine function, whose exponential
has integral `1` against `N(b, σ²)`, and Tau Ceti's change of reference for tilted measures,
`TauCeti.klDiv_tilted_eq_boltzmannEntropy` with
`TauCeti.klDiv_eq_boltzmannEntropy_of_measure_univ_eq`, gives the identity in `EReal`.
(Proved here.)

**Checks.**

- `ν = N(b, σ²)` gives MathematicalStatisticsNonparametric 1.3 back.
- A non-Gaussian `ν`: `d = 1`, `ν = (N(−1, 1) + N(1, 1))/2`, `σ = 1`. Numerically
  `klDiv ν N(0, 1) = 0.163169` and `klDiv ν N(1, 1) = 0.663169`; the difference is `0.5`, as the
  identity says. With `a = −0.3` the difference is `0.045 = 0.3²/2`.

*Needs:* MathematicalStatisticsNonparametric 1.3 (`klDiv_multivariateGaussian`); Tau Ceti
`TauCeti.klDiv_eq_klDiv_add_klDiv` (or `TauCeti.klDiv_tilted_eq_boltzmannEntropy`),
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal_def`; Mathlib `klDiv`, `MeasureTheory.llr`.

### 1.3 A Gaussian tilted by a function with Lipschitz gradient

Prove `klDiv_tilted_multivariateGaussian_le`: let `σ > 0`, `a : E`, let `f : E → ℝ` be
differentiable with `∇f` Lipschitz with constant `L ≥ 0`, let `exp ∘ f` be integrable under
`N(a, σ²)`, and let `ν = N(a, σ²).tilted f` (Mathlib's tilted measure, the law with density
proportional to `exp f`). Then, with `b = ∫ y dν`,

    klDiv ν N(b, σ²) ≤ ofReal (σ² L²/2) * ∫⁻ y, ‖y − b‖ₑ² ∂ν.

No convexity of `−f` and no bound on `L σ²` is assumed.

Route. If the right side is `∞` there is nothing to prove; in particular this covers a `ν` without
a first moment, whose Bochner mean is the junk value `0`. If `L = 0`, then `∇f` is constant, `f`
is affine and `ν` is a translate of `N(a, σ²)`, so both sides are `0`. Otherwise `ν` has a finite
second moment and mean `b`; let `c = a + σ² ∇f(b)`. Then
`ν = N(c, σ²).withDensity h` with `log h(y) = f(y) − ⟪∇f(b), y⟫ + const`, by `Measure.tilted`
and the Gaussian density; `h` is positive and continuously differentiable,
`∫ h dN(c, σ²) = 1`, and `∇ log h = ∇f − ∇f(b)`. The law `N(c, σ²)` is the Gibbs law of
`V(y) = ‖y − c‖²/(2σ²)`, which is `(1/σ²)`-strongly convex (Mathlib `strongConvexOn_iff_convex`:
`V − ‖y‖²/(2σ²)` is affine). The identification of the Gibbs law `volume.tilted (−V)` of
LogConcaveFunctionalInequalities 1.1 with `N(c, σ²)` is proved here, from Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity` with the positive definite covariance
`σ² • 1` and `TauCeti.Probability.multivariateGaussianPDFReal_def`, the normalising constant
being `(2πσ²)^(d/2)`. So LogConcaveFunctionalInequalities 2.3 gives the logarithmic Sobolev
inequality for `N(c, σ²)` with constant `σ²`, and 1.1 gives
`klDiv ν N(c, σ²) ≤ (σ²/2) ∫ ‖∇f(y) − ∇f(b)‖² dν ≤ (σ² L²/2) ∫ ‖y − b‖² dν`. Finally 1.2 gives
`klDiv ν N(b, σ²) ≤ klDiv ν N(c, σ²)`. (Proved here.)

**Checks.**

- `f = 0`: `ν = N(a, σ²)`, `b = a`, and both sides are `0`. `f` linear: `ν` is a translate of
  `N(a, σ²)`, `L = 0`, and the left side is `0`.
- A quadratic tilt in `d = 1`: `f(y) = −λ y²/2` with `λ > 0` has `L = λ` and
  `ν = N(a r, σ² r)` with `r = 1/(1 + λσ²)`. The left side is `(r − 1 − log r)/2` and the right
  side is `σ⁴λ² r/2`. For `λσ² = 1` they are `0.0966` and `0.25`; for `λσ² = 0.1`, `0.002201` and
  `0.004545`; for `λσ² = 0.01` the ratio is `0.4983`, tending to `1/2`.
- The constant cannot be lowered: `f(y) = λ y²/2` with `0 < λσ² < 1` has `L = λ` and
  `ν = N(a r, σ² r)` with `r = 1/(1 − λσ²) > 1`; the two sides are again `(r − 1 − log r)/2` and
  `σ⁴λ² r/2`, and their ratio is `0.6137`, `0.8268` and `0.9631` for `λσ² = 0.5`, `0.9` and `0.99`,
  tending to `1` as `λσ² → 1`.
- Integrability is needed: for `d ≥ 1` and `f(y) = ‖y‖²/(2σ²)`, whose gradient is Lipschitz
  with `L = 1/σ²`, the function `exp ∘ f` is not integrable under `N(0, σ²)`, so `ν` is the zero
  measure, whose divergence from a probability measure is `1` in Mathlib's convention, while the
  right side is `0`.
- Differentiability is needed: a bounded continuous nowhere differentiable `f` has Mathlib's junk
  gradient `0` everywhere, which is Lipschitz with `L = 0`, while `ν` is not Gaussian and the left
  side is positive.

*Needs:* 1.1, 1.2; LogConcaveFunctionalInequalities 1.1 (the Gibbs law) and 2.3
(`logSobolevInequality_gibbsMeasure`); Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal_def`; Mathlib `MeasureTheory.Measure.tilted`,
`MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.tilted_of_not_integrable`,
`strongConvexOn_iff_convex`, `MeasureTheory.withDensity_mul`.

### Examples

The Gaussian reference `N(c, σ²)` with a quadratic or linear tilt, where every quantity is
explicit; and, in Layer 2, the reverse step of the forward chain, where `f` is the logarithm of a
noised data density.

### Dependencies

1.1 needs LogConcaveFunctionalInequalities 1.2 and 1.3 (definitions) and Mathlib's dominated
convergence, Fatou's lemma and smooth cut-offs. 1.2 needs MathematicalStatisticsNonparametric 1.3,
Tau Ceti's Pythagorean identity and the Gaussian density. 1.3 needs 1.1, 1.2 and
LogConcaveFunctionalInequalities 1.1 and 2.3, Mathlib's tilted measures and strong convexity, and
the Gaussian density.

## Layer 2: the one-step bound

### 2.1 The one-step bound

Define the Lipschitz constant
`scoreLip R a = max (1/(1 − a)) (a R²/(1 − a)² − 1/(1 − a))`, which is ScoreBasedDiffusion 2.2's
constant `max (1/s²) (c² R²/s⁴ − 1/s²)` at `c = √a`, `s = √(1 − a)`, and the ideal noise predictor
`scoreNoise μ₀ β t = −√(1 − ᾱ t) • noisyScore μ₀ (√ᾱ t) (√(1 − ᾱ t))`, the minimizer of the
noise-prediction loss of DenoisingDiffusion 4.3 (`posteriorLoss_minimizer`, where it is a local
definition). Write `L_{t−1} = scoreLip R (ᾱ (t − 1))`.

Prove `klDiv_reverseStep_le`: for a probability measure `μ₀` with `‖x‖ ≤ R` almost everywhere, a
schedule `β`, `t ≥ 2` and a measurable `ε̂ : E → E`,

    klDiv ((q_{t−1} ⊗ₘ noiseKernel (1 − β t)).map Prod.swap)
          (q_t ⊗ₘ epsModelKernel β t (√(β t/(1 − β t))) ε̂)
      ≤ ofReal (d β_t² L_{t−1}²/(2 α_t²)) +
          ofReal (β_t/(2(1 − ᾱ_t))) * ∫⁻ x, ‖ε̂ x − scoreNoise μ₀ β t x‖ₑ² ∂q_t.

The first argument is the law of `(x_t, x_{t−1})` when `x_{t−1} ~ q_{t−1}` and `x_t` is drawn
from `noiseKernel (α_t) x_{t−1}`; along the forward chain of DenoisingDiffusion 2.2 this is the
law of two consecutive states, since the chain is Markov and `x_{t−1}` has law `q_{t−1}`. The
statement is written with this pair law itself and does not use the path law. The second
argument is the law of `x_t ~ q_t` followed by one model step. Write `v = β_t/α_t` for the model
variance.

Route, each step with its owner.

- (a) Bayes. ScoreBasedDiffusion 3.1, Bayes' formula, at the levels `(√ᾱ_{t−1}, √(1 − ᾱ_{t−1}))`
  and `(√ᾱ_t, √(1 − ᾱ_t))`, with `c₁ ≠ 0` and `s₁ > 0` because `t − 1 ≥ 1`. Its ratio is
  `m = √α_t` and its transition variance is `1 − ᾱ_t − α_t(1 − ᾱ_{t−1}) = β_t > 0`. It writes
  the first argument as `q_t ⊗ₘ B` with `B` its backward kernel, a Markov kernel. The
  identification of its two-time law `twoTimeLaw` with `q_{t−1} ⊗ₘ noiseKernel α_t` is proved
  here. Its kernels are `gaussianKernel c v` of DenoisingDiffusion 1.2, the image of `N(0, v)`
  under `e ↦ c • x + e`, which is `N(c • x, v)` (Mathlib `Kernel.map_apply`, Tau Ceti
  `TauCeti.Probability.map_affine_multivariateGaussian`); and
  `noiseKernel a x = N(√a • x, 1 − a)` (DenoisingDiffusion 2.1, `noiseKernel_apply`). So
  `gaussianKernel √a (1 − a)` and `noiseKernel a` agree at every point, for the levels of the two
  marginals and for the step.
- (b) Disintegration. `TauCeti.klDiv_compProd_right` writes the divergence as
  `∫⁻ x, klDiv (B x) (κ x) ∂q_t`, with `κ` the model kernel.
- (c) The two kernels. `κ x = N(m_t x, v)` is proved here from the definition of
  `epsModelKernel`: the image of `N(0, v)` under the translation by `m_t x` (Mathlib
  `Kernel.map_apply`, Tau Ceti `TauCeti.Probability.map_affine_multivariateGaussian` with the
  identity matrix).
  `B x = N(x/√α_t, v).tilted (log p_{t−1})`, with
  `p_{t−1} = smoothedDensity μ₀ √ᾱ_{t−1} √(1 − ᾱ_{t−1})`, is proved here from the Bayes density
  of (a), because
  `φ_{β_t}(x − √α_t y) = α_t^(−d/2) φ_v(y − x/√α_t)` as functions of `y` (Tau Ceti
  `TauCeti.Probability.multivariateGaussian_eq_withDensity`,
  `TauCeti.Probability.multivariateGaussianPDFReal_def`). The density
  `p_{t−1}` is positive and infinitely differentiable (DenoisingDiffusion 3.1), and bounded by
  `(2π(1 − ᾱ_{t−1}))^(−d/2)`, the maximum of the Gaussian density it averages, so
  `exp ∘ log p_{t−1} = p_{t−1}` is integrable under `N(x/√α_t, v)`.
- (d) Centre. By 1.2 with `a = m_t x` and `b(x)` the mean of `B x` (which has all moments):
  `klDiv (B x) (κ x) = klDiv (B x) N(b(x), v) + α_t ‖m_t x − b(x)‖²/(2β_t)`.
- (e) Shape. By 1.3 with `a = x/√α_t`, `σ² = v` and `f = log p_{t−1}`, which is differentiable
  because `p_{t−1}` is smooth and positive (DenoisingDiffusion 3.1), and whose gradient is by
  definition `noisyScore μ₀ √ᾱ_{t−1} √(1 − ᾱ_{t−1})`, Lipschitz with constant `L_{t−1}`
  (ScoreBasedDiffusion 2.2, its third bullet, a README statement with no Lean declaration there,
  resting on `hasFDerivAt_noisyScore` of its 2.1):
  `klDiv (B x) N(b(x), v) ≤ (v L_{t−1}²/2) ∫⁻ ‖y − b(x)‖² dB x`, which is at most
  `(v L_{t−1}²/2) ∫⁻ ‖y − x/√α_t‖² dB x`,
  the second step because the second moment about the mean is the least one.
- (f) Mean. ScoreBasedDiffusion 3.1, the moments of the backward kernel:
  `b(x) = (x + β_t noisyScore μ₀ √ᾱ_t √(1 − ᾱ_t) x)/√α_t`. Hence
  `m_t x − b(x) = −(β_t/(√α_t √(1 − ᾱ_t))) (ε̂ x − scoreNoise μ₀ β t x)`, and the last term of
  (d) is `β_t/(2(1 − ᾱ_t)) ‖ε̂ x − scoreNoise μ₀ β t x‖²`.
- (g) Integration. By (a), `∫⁻ x ∫⁻ ‖y − x/√α_t‖² dB x dq_t` is the integral of
  `‖x_{t−1} − x_t/√α_t‖²` under the first argument, the law of `(x_t, x_{t−1})`. Since
  `x_{t−1} − x_t/√α_t = −√v Z` with `Z` standard Gaussian, it equals `v E‖Z‖² = d v` (Tau Ceti
  `TauCeti.Probability.stdGaussian_map_norm_sq` and
  `TauCeti.Probability.integral_id_chiSquaredMeasure`). So the first term integrates to
  `(v L_{t−1}²/2) · d v = d β_t² L_{t−1}²/(2 α_t²)`.

For a fixed Lipschitz constant of the score, the bound is second order in `β_t`, because the
logarithmic Sobolev inequality compares the reverse step with a Gaussian through the variation of
the score over one step. Joint convexity of the divergence over the Gaussian-mixture form of the
reverse step would give only a first-order term, which does not vanish when the steps are refined.
(Proved here.)

**Checks.**

- `scoreLip 1 0.5 = 2`, `scoreLip 2 0.5 = 6`, `scoreLip 1 0.9 = 80`, `scoreLip 0 0.7 = 10/3`.
  For `R = 0` it is `1/(1 − a)`, the Lipschitz constant of the score `−y/(1 − a)` of
  `N(0, 1 − a)`.
- Dirac data, closed form (`μ₀ = dirac 0`, `R = 0`, `ε̂ = scoreNoise`). Every reverse step is
  Gaussian with variance `τ² = s² v/(s² + v)`, where `s² = 1 − ᾱ_{t−1}`; with `u = v/s²` the left
  side is `(d/2)(log(1 + u) − u/(1 + u))` and the bound is `d u²/2`. The inequality follows from
  `log(1 + u) ≤ u`, and the ratio tends to `1/2` as `u → 0` (`0.4934` at `u = 0.01`). For
  `β₁ = 0.3`, `β₂ = 0.05`, `t = 2`: `u = 0.17544`, the left side is `0.006194` and the bound is
  `0.015389`.
- Numerically, with the exact reverse kernels in `d = 1` (data at `±1`, at `±2`, at `{0.2, 1.5}`
  with weights `0.7, 0.3`, at `{−1, 0.3, 1}` with weights `0.2, 0.5, 0.3`, and the Dirac mass;
  the constant schedules `0.05` and `0.2`, the schedule `min(0.02 · 1.5^t, 0.5)`, and the schedule
  `0.3` then `0.01`; `t ∈ {2, 3, 5, 10}`; `ε̂ = scoreNoise`), the ratio of the left side to the
  bound is at most `0.4816` (Dirac data, schedule `0.3` then `0.01`, `t = 10`); the mean of each
  reverse kernel agrees with the formula of (f) to `10⁻¹⁴`; and the averaged variance of the
  reverse kernel is at most `0.986 v`, below the value `v` that (g) uses.
- The size of the bound. Data at `±1` (`d = 1`, `R = 1`), `ε̂ = scoreNoise`, `t = 2`. For the
  constant schedule `β ≡ 0.1`, `L₁ = scoreLip 1 0.9 = 80`, the bound is `39.51` and the left
  side is `0.128`. For `β₁ = 0.5` and `β₂ = 0.02`, `L₁ = scoreLip 1 0.5 = 2`, the bound is
  `8.33 · 10⁻⁴` and the left side is `1.64 · 10⁻⁴`.
- `t ≥ 2` is needed: for `d ≥ 1`, at `t = 1` with Dirac data the reverse step is `dirac 0`,
  whose divergence from a Gaussian is `∞`, while `scoreLip R (ᾱ 0) = scoreLip R 1` is the junk
  value `0` (division by zero) and the right side is `0` for `ε̂ = scoreNoise`.
- `d = 0`: both laws are the Dirac mass on the point and both sides are `0`.

*Needs:* 1.2, 1.3; ScoreBasedDiffusion 2.1 (differentiability of the score), 2.2 (the
Lipschitz constant, third bullet) and 3.1 (Bayes' formula and the moments of the backward kernel);
DenoisingDiffusion 1.2 (`gaussianKernel`), 2.1 (`noiseKernel_apply`), 2.2 (`alphaBar`,
`forwardMarginal`), 3.1 (positivity and bound of the smoothed density) and 4.3 (`epsModelKernel`,
the minimizer); Tau Ceti `TauCeti.klDiv_compProd_right`,
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal_def`,
`TauCeti.Probability.map_affine_multivariateGaussian`,
`TauCeti.Probability.stdGaussian_map_norm_sq`,
`TauCeti.Probability.integral_id_chiSquaredMeasure`; Mathlib `Kernel.map_apply`,
`Measure.lintegral_compProd`.


### Examples

The Dirac data law, for which every law in sight is Gaussian and both sides of 2.1 are explicit;
atomic data laws in dimension one, for which the exact reverse step is a finite Gaussian mixture;
the two schedules of the Check on the size of the bound.

### Dependencies

2.1 needs 1.2, 1.3, ScoreBasedDiffusion 2.1, 2.2 and 3.1, and DenoisingDiffusion 1.2, 2.1, 2.2,
3.1 and 4.3; Tau Ceti's disintegration of the divergence, Gaussian densities and chi-squared mean.

## Downstream consumers

The one-step bound 2.1 and the tilted-Gaussian bound 1.3 are offered to roadmaps that compare
reverse steps with Gaussians. No roadmap on main consumes this one.

Summing 2.1 over the steps would bound the divergence of `q₁` from the output of the model chain
started at a prior at time `T` and stopped at time `1`: the chain rule and the variational bound
of DenoisingDiffusion 4.1, applied to the forward chain restarted at `q₁`, would bound it by the
divergence of `q_T` from the prior plus the sum over `t = 2, …, T` of the right sides of 2.1.
That statement is not made here, because the sum is uninformative for the schedules in common use.
Every term is nonnegative, and the term of step `2` alone is `d β₂² L₁²/(2(1 − β₂)²)` with
`L₁ = scoreLip R (1 − β₁)`, which for `R > 0` and small `β₁` is about `(1 − β₁)R²/β₁²`. For a
constant schedule `β` that term is about `d R⁴/(2β²)`, which grows without bound as the steps are
refined. With `d = 1` and `R = 1` it is `39.51` for `β ≡ 0.1` (the Check on the size of the bound
in 2.1 above), and about `7.19 · 10⁷` for the linear schedule of Ho, Jain and Abbeel (2020), from
`β₁ = 10⁻⁴` to `β₁₀₀₀ = 0.02`. A divergence bound of `2` or more says nothing about the
total-variation distance through Pinsker's inequality. The sum is small only if the second step is
small compared with `1/L₁`, which for small `β₁` means small compared with `β₁²/R²`, a schedule
shaped for the bound rather than one in common use.

## Scope and ownership

This roadmap owns: the divergence form of a logarithmic Sobolev inequality for positive continuously
differentiable densities without boundedness (1.1); the change of centre of an isotropic Gaussian
reference for an arbitrary law with a first moment (1.2); the bound for a Gaussian tilted by a
function with Lipschitz gradient (1.3); the one-step bound (2.1); and the definitions `scoreLip`
and `scoreNoise`.

Stated by other roadmaps and consumed, not restated (the definitions are copied verbatim into
`Suggested.lean`):

- DenoisingDiffusion owns the Gaussian kernels (1.2), the noising kernels, the schedules and
  `alphaBar` (2.1, 2.2), the marginals of the forward chain (2.2), the smoothed density and the
  score (3.1), and the model kernel `epsModelKernel` with the minimizer of the noise-prediction
  loss (4.3). Copied: `noiseKernel`, `alphaBar`, `forwardMarginal`, `smoothedDensity`,
  `noisyScore`, `epsModelKernel`. `scoreNoise` names its minimizer, which is a local definition
  there. Its scope leaves sampling-error bounds for learned reverse processes out; 2.1 above bounds
  one reverse step and is not such a bound.
- ScoreBasedDiffusion owns the score bounds for data in a ball (2.2), including the Lipschitz
  constant of its third bullet, and the backward kernel of one step with Bayes' formula and its
  moments (3.1). This roadmap defines no backward kernel: 2.1 is written with the forward pair law,
  and the backward kernel enters only its route. `scoreLip` is the constant of
  ScoreBasedDiffusion 2.2 at one level, named so that it can be written in a statement.
- LogConcaveFunctionalInequalities owns `LogSobolevInequality` (1.2), `relativeFisherInformation`
  (1.3), the Gibbs law (1.1) and the Bakry–Émery inequality (2.3), used with a quadratic potential.
  Its Conventions read the inequality in divergence form for `h = f²` with `f` a test function;
  the route of its 4.2 extends it to the positive densities of a Fokker–Planck flow inside the
  proof, with no statement; 1.1 here states the extension to unbounded positive densities.
  RandomMatrices 2.2 owns the Gaussian logarithmic Sobolev inequality with constant `1` and its
  extension to Lipschitz functions; `√h` is not Lipschitz in general, so that extension does not
  give 1.1.
- MathematicalStatisticsNonparametric 1.3 owns the divergence between isotropic Gaussians with the
  same variance; 1.2 here differs in allowing any law with a first moment in the first argument,
  and uses that result as a step.
- Tau Ceti's Csiszár identity `TauCeti.klDiv_eq_klDiv_add_klDiv` is the general form behind 1.2;
  1.2 is its Gaussian case with the condition on the integrals verified, plus the singular case.
  Tau Ceti's change of reference for tilted measures (`TauCeti.klDiv_tilted_eq_boltzmannEntropy`;
  the change of reference of OptimalTransport 11.2 is its case of a radial weight, for laws with a
  second moment) is the other general form; 1.2 adds the Gaussian density ratio, its normalisation
  and the passage from `EReal` to `ℝ≥0∞`.

Neighbouring roadmaps, not used:

- DifferentialEntropyAndEntropyPower 1.3 (Layer 1, the divergence from a Gaussian,
  `klDiv_multivariateGaussian`) computes `klDiv μ N(m, S)` in `EReal` for a law `μ` with a finite
  second moment and any positive definite `S`; subtracting its isotropic instances `S = σ² • 1` at
  `m = a` and at `m = b` gives 1.2 for such laws. 1.2 needs only a first moment and is stated in
  `ℝ≥0∞`; it is proved here from Csiszár's identity, and this roadmap does not depend on that one.
- DiffusionODESamplerGuarantee says in its scope that DenoisingDiffusion 4.1–4.3 with Pinsker's
  inequality give a total-variation statement for the discrete chain, which it does not make; no
  statement about the whole chain is made here either (Downstream consumers above). That roadmap
  is about deterministic samplers in the Wasserstein distance, and neither depends on the other.

Outside the scope: the divergence or total-variation distance between the output of the whole
model chain and a marginal of the forward chain (Downstream consumers above); other model
variances (DenoisingDiffusion's `β̃_t`, or `β_t`; 1.2 needs the model and the Gaussian with the
reverse step's mean to have the same covariance); the step `t = 1`, whose divergence is infinite
for data without a density (DenoisingDiffusion 4.2, Checks); continuous time and stochastic
differential equations; training, the approximation of scores by networks, and deterministic
samplers.

## Exact supplier contracts

### From Mathlib

- `InformationTheory.klDiv` (values in `ℝ≥0∞`), `MeasureTheory.llr`.
- `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted` (for integrable
  `exp ∘ f`), `MeasureTheory.tilted_of_not_integrable` (the zero measure otherwise),
  `MeasureTheory.withDensity_mul`.
- `strongConvexOn_iff_convex` (strong convexity in an inner product space as convexity of
  `f − (m/2)‖·‖²`).
- `ContDiffBump`, `Real.smoothTransition` (smooth cut-offs),
  `MeasureTheory.lintegral_liminf_le` (Fatou),
  `MeasureTheory.tendsto_integral_of_dominated_convergence`.
- `ProbabilityTheory.Kernel.map_apply` (for a measurable map),
  `MeasureTheory.Measure.lintegral_compProd`, `ProbabilityTheory.stdGaussian`,
  `ProbabilityTheory.multivariateGaussian`.

### From Tau Ceti

- `TauCeti/Probability/Distributions/Gaussian/Density.lean`:
  `TauCeti.Probability.multivariateGaussianPDFReal`,
  `TauCeti.Probability.multivariateGaussianPDFReal_def`,
  `TauCeti.Probability.multivariateGaussian_eq_withDensity` (positive definite covariance).
- `TauCeti/Probability/Distributions/Gaussian/Affine.lean`:
  `TauCeti.Probability.map_affine_multivariateGaussian` (positive semidefinite covariance).
- `TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`: `TauCeti.klDiv_compProd_right`
  (finite measure, finite kernels, countably generated spaces).
- `TauCeti/InformationTheory/KullbackLeibler/ChangeOfReference.lean`:
  `TauCeti.klDiv_eq_klDiv_add_klDiv` (`γ ≪ π ≪ R` finite, `llr π R` integrable against `γ` and
  `π` with the same integral).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean`:
  `TauCeti.klDiv_tilted_eq_boltzmannEntropy` (σ-finite nonzero reference `m`, `exp f` integrable
  against `m`, `f` integrable against the finite `μ`; an identity in `EReal`) and
  `TauCeti.klDiv_eq_boltzmannEntropy_of_measure_univ_eq`.
- `TauCeti/Probability/Distributions/Chi/Gaussian.lean` and
  `TauCeti/Probability/Distributions/ChiSquared/Basic.lean`:
  `TauCeti.Probability.stdGaussian_map_norm_sq`,
  `TauCeti.Probability.integral_id_chiSquaredMeasure` (`0 ≤ k`).

### From TauCetiRoadmap.DenoisingDiffusion

- 1.2: `gaussianKernel c v`, the kernel `x ↦ N(c • x, v)`.
- 2.1: `noiseKernel`, `noiseKernel_apply` (`0 ≤ a ≤ 1`).
- 2.2: `alphaBar`, `forwardMarginal`.
- 3.1: `smoothedDensity`, `noisyScore`, positivity and smoothness of the smoothed density for
  `s > 0`.
- 4.3: `epsModelKernel`, and the minimizer of the noise-prediction loss
  (`posteriorLoss_minimizer`).

### From TauCetiRoadmap.ScoreBasedDiffusion

- 2.1: `hasFDerivAt_noisyScore` (differentiability of the score, `s > 0`).
- 2.2: for `‖x‖ ≤ R` almost everywhere and `s > 0`, the score `noisyScore μ₀ c s` is Lipschitz with
  constant `max (1/s²) (c² R²/s⁴ − 1/s²)` (the third bullet of 2.2, a README statement with no
  Lean declaration; its two other bullets are `norm_noisyScore_le` and
  `inner_fderiv_noisyScore_le`).
- 3.1: `twoTimeLaw`; for `c₁ ≠ 0`, `s₁ > 0` and `v = s₂² − (c₂/c₁)² s₁² > 0`, Bayes' formula: the
  backward kernel `y ↦ volume.withDensity (x ↦ p₁ x φ_v(y − m x)/p₂ y)` with `m = c₂/c₁` is a Markov
  kernel and the two-time law is the law at the second level followed by it, coordinates
  exchanged; for `m ≠ 0`, its mean at `y` is `m⁻¹ (y + v noisyScore μ₀ c₂ s₂ y)`. Both are README
  statements with no Lean declaration.

### From TauCetiRoadmap.LogConcaveFunctionalInequalities

- 1.1: the Gibbs law `volume.tilted (−V)` of a potential `V`.
- 1.2: `LogSobolevInequality`.
- 1.3: `relativeFisherInformation`.
- 2.3: `logSobolevInequality_gibbsMeasure`: a `κ`-strongly convex `V` with `κ > 0` has a Gibbs
  law satisfying the logarithmic Sobolev inequality with constant `1/κ`.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 1.3: `klDiv_multivariateGaussian`: `klDiv N(a, v) N(b, v) = ofReal (‖a − b‖²/(2v))` for `v > 0`.

## References

- L. Gross, *Logarithmic Sobolev inequalities*, Amer. J. Math. **97** (1975), 1061–1083.
- J. Ho, A. Jain and P. Abbeel, *Denoising diffusion probabilistic models*, NeurIPS 2020,
  arXiv:2006.11239.
- I. Csiszár, *I-divergence geometry of probability distributions and minimization problems*,
  Ann. Probab. **3** (1975), 146–158.

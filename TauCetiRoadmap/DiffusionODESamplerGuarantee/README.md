# Roadmap: wasserstein guarantee for the discretized flow sampler

**Summary.** A deterministic diffusion sampler draws a standard Gaussian vector and integrates a
learned velocity field with a one-step method until shortly before the data end of time. This
roadmap proves that the law it produces is close to the data law in the Wasserstein distance of
order two, with a bound that is the sum of three explicit terms: an early-stopping term, a training
term and a discretization term. The data law is a probability measure `μ₁` on `ℝ^d`, carried by the
closed ball of radius `R` in the main theorems. A schedule is a pair `α`, `β` of `C¹` functions
with `α(0) = 0`, `β(0) = 1` and `β > 0` on `[0, b]`; at time `t` the data are observed as
`α(t) X + β(t) Z`, with `Z` standard Gaussian and independent of the data point `X`, so time runs
from noise (`t = 0`) to data. The exact velocity of this interpolant is
`u_t(x) = (β′/β) x + (α′ − α β′/β) D_t(x)`, where `D_t` is the posterior mean of `X` given the
observation `x`. That the learned field `w` is `K`-Lipschitz in space is an assumption.

The headline theorems are these.

- *The exact field.* For data in the ball and `t` with `β(t) > 0`, the exact velocity is Lipschitz
  with constant `max(|β′/β|, |β′/β + (α′ − α β′/β) α R²/β²|)`, and its flow pushes the standard
  Gaussian to the law of `α(t) X + β(t) Z` for every `t ∈ [0, b]`.
- *Continuous time.* If `w` is `K`-Lipschitz in space and continuous in time on `[0, b]`, `b ≥ 0`,
  and `ψ` is its flow, then `W₂(μ₁, law of ψ_b(Z))` is at most
  `√((1 − α(b))² E‖X‖² + β(b)² d) + ∫₀ᵇ e^(K(b − t)) ‖u_t − w_t‖_(L²(p_t)) dt`, with `p_t` the
  law of `α(t) X + β(t) Z`.
- *The Euler sampler.* If moreover `‖w_r(x) − w_s(x)‖ ≤ Λ (1 + ‖x‖) |r − s|` on `[0, b]` and
  `‖w_t(0)‖ ≤ B₀`, the explicit Euler method on a mesh of `[0, b]` with steps at most `h` adds at
  most `M̄ h e_K(b)/2` to that bound, where `e_K(b) = (e^(Kb) − 1)/K` (and `b` for `K = 0`) and
  `M̄ = (Λ + K²)(e^(Kb) √d + B₀ e_K(b)) + Λ + K B₀`.
- *Heun's method.* If the trajectory of `w` from `x` has first and second time derivatives with
  Lipschitz constants `M₂(x)`, `M₃(x)` on `[0, b]`, whose Gaussian root mean squares are at most
  `m₂`, `m₃`, then the laws of the flow and of Heun's method at time `b` are within
  `(m₃/12 + K m₂/4) h² (e^(K′b) − 1)/K′` of each other in `W₂`, with `K′ = K (1 + hK/2)` (read
  `(e^(K′b) − 1)/K′` as `b` when `K′ = 0`).

The flow-matching roadmap supplies flows, the velocity–denoiser identity, the transport of laws by
the flow and the comparison of two flows in Wasserstein distance. The score-based diffusion roadmap
supplies the denoiser, its derivative and the distance of the noised law from the data. The roadmap
on one-step methods supplies the error bounds of the Euler and Heun methods.

Layer 1 below identifies the exact velocity and proves what the flow-matching theorems need of it.
Layer 2 proves the continuous-time guarantee, Layer 3 the Euler error along one trajectory, and
Layer 4 the guarantees for the laws of the Euler and Heun samplers.

## Conventions

- `d : ℕ`, `E = EuclideanSpace ℝ (Fin d)` with its Borel σ-algebra; `γ` is Mathlib's
  `ProbabilityTheory.stdGaussian E`, which is `multivariateGaussian 0 1`
  (`ProbabilityTheory.multivariateGaussian_zero_one`). Layer 3 works in any real normed space.
- **Data.** `μ₁` is a probability measure on `E`. From 1.3 on, `‖x‖ ≤ R` for `μ₁`-almost every
  `x`; 1.2 and 1.4 assume only a finite first moment, `∫⁻ x, ‖x‖ₑ ∂μ₁ < ∞`, which is what their
  routes use, and 1.1 assumes nothing. The ball is used for the Lipschitz constant of 1.3, and
  through it in 1.5 and Layers 2 and 4; it is not claimed to be necessary there. The
  coupling is `π = γ.prod μ₁`: the first coordinate is the source point `x₀`, the second the data
  point `x₁`, as in FlowMatching Layer 3.
- **Schedules.** `α β : ℝ → ℝ` with `ContDiff ℝ 1 α`, `ContDiff ℝ 1 β`; `α′` and `β′` are Mathlib's
  `deriv`. The interpolant is `interpolant α β t z = α t • z.2 + β t • z.1` (FlowMatching 3.1). The
  linear schedule is `α t = t`, `β t = 1 − t`; for it, and for every schedule with `β 1 = 0`, the
  condition `β > 0` on `[0, b]` forces `b < 1`: the sampler stops before the data end.
- **The exact law** at time `t` is `p_t = μ₁.bind (gaussianKernel (α t) (β t ^ 2))`, with
  `gaussianKernel c v` the kernel `x ↦ N(c • x, v)` of DenoisingDiffusion 1.2; by 1.1 below it is
  `π.map (interpolant α β t)`.
- **Fields and flows.** A field is `w : ℝ → E → E`, time first. `IsFlowOn w ψ 0 b` (FlowMatching
  1.1) says `ψ 0 x = x` and that `t ↦ ψ t x` is an integral curve of `w` on `[0, b]` for every `x`;
  values of `ψ t` for `t ∉ [0, b]` are unconstrained. The learned field is `K`-Lipschitz in space
  for every time, `∀ t, LipschitzWith K (w t)` with `K : ℝ≥0`, as OneStepMethodsForODEs requires.
  Only its values on `[0, b]` enter the statements below, and a field Lipschitz on `[0, b]` only
  is extended to all times by its value at the nearer endpoint without changing them.
- **Meshes and methods** are those of OneStepMethodsForODEs: nodes `meshNode 0 h n`, steps
  `0 ≤ h n ≤ hmax` for `n < N`, last node `meshNode 0 h N = b`, numerical solution
  `oneStepSeq (T.increment w) 0 h x N` for a Butcher tableau `T`, here `explicitEuler` or `heun`.
- **Grönwall bound.** Mathlib's `gronwallBound δ K ε x` is `δ e^(Kx) + (ε/K)(e^(Kx) − 1)` for
  `K ≠ 0` and `δ + εx` for `K = 0`; `gronwallBound 0 K 1 b` is `(e^(Kb) − 1)/K`, or `b`.
- **Distances and integrals.** `W₂` is Tau Ceti's `TauCeti.wassersteinEDist 2`, valued in `[0, ∞]`.
  Training errors are lower integrals `∫⁻` of `‖·‖ₑ`, so that no integrability is assumed to state
  them; the one Bochner integral in a statement, `∫ ‖x‖ ^ 2 ∂μ₁`, has an integrand bounded by `R²`.

## Layer 1: the exact velocity for data in a ball

### 1.1 The law of the interpolant

Prove `map_interpolant_eq_bind`: for every probability measure `μ₁` and every `t`,
`π.map (interpolant α β t) = μ₁.bind (gaussianKernel (α t) (β t ^ 2))`. Under `γ` the vector
`β t • Z` has the law `multivariateGaussian 0 ((β t ^ 2) • 1)`, by
`TauCeti.Probability.map_affine_multivariateGaussian` with `L = β t • 1` (any sign of `β t`), and
the product structure of `π` integrates `x₁ ↦ law of α t • x₁ + β t • Z` against `μ₁`, which is
the definition of the bind. Consequently `p_0 = γ` when `α 0 = 0` and `β 0 = 1`, since then the
interpolant is the first coordinate. (Proved here.)

**Checks.**

- Two-point data `μ₁ = (δ₋ᵣ + δᵣ)/2` on `ℝ`, linear schedule: `p_t` is the mixture
  `(N(−tr, (1 − t)²) + N(tr, (1 − t)²))/2`; at `t = 0` it is `N(0, 1)` and at `t = 1` it is `μ₁`.
- The variance is `β t ^ 2`, not `β t`: for `μ₁ = δ₀` and `β t = 1/2` the law is `N(0, 1/4)`.

*Needs:* DenoisingDiffusion 1.2 (`gaussianKernel`); FlowMatching 3.1 (`interpolant`); Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`; Mathlib
`ProbabilityTheory.multivariateGaussian_zero_one`, `MeasureTheory.Measure.bind`,
`MeasureTheory.Measure.map_prod_map`.

### 1.2 The exact velocity

Define `exactVelocity μ₁ α β t x` as

    (deriv β t / β t) • x + (deriv α t − α t * deriv β t / β t) • denoiser μ₁ (α t) (β t) x,

with `denoiser` of ScoreBasedDiffusion 2.1, the posterior mean of the data point given the
observation `y = α t • x₁ + β t • x₀`. This is the right side of the velocity–denoiser identity of
FlowMatching 3.1. The denoiser form is used rather than the score form of that section, whose
coefficients contain `1/α t`, which is infinite at `t = 0` although the field is not: when
`α 0 = 0` and `β 0 = 1` the posterior at `t = 0` is the prior, the denoiser is the mean of `μ₁`,
and the field is `β′(0) x + α′(0) E[X]`.

Prove `isInterpolantVelocity_exactVelocity`: if `μ₁` has a finite first moment, `α` and `β` are
measurable and `β t ≠ 0` for `t ∈ (0, b)`, then
`IsInterpolantVelocity π α β (exactVelocity μ₁ α β) 0 b`. Route: the field is measurable on
`ℝ × E` (`measurable_deriv`, and joint measurability of the parametric integrals defining the
denoiser); the denoiser at `(α t, β t)` is a marginal velocity of the moving Dirac masses for the
conditional fields `z.2`, because under `π` the observation has the density
`smoothedDensity μ₁ (α t) (β t)` (DenoisingDiffusion 3.1, `hasLaw_smoothedDensity`, applied with
`|β t|`, since `β t • Z` and `|β t| • Z` have the same law) and, by Tonelli's theorem,
`∫ 1_s(y) x₁ dπ = ∫_s denoiser μ₁ (α t) (β t) y dp_t(y)` for every Borel `s`, both sides being
integrable by the first moment (for `α t ≠ 0` this is the identity `P[X | Y] = denoiser ∘ Y` that
ScoreBasedDiffusion 2.1 derives from Tweedie's formula; for `α t = 0` the observation is
independent of the data point and the denoiser is the mean of `μ₁`); the velocity–denoiser identity
of FlowMatching 3.1, which needs `π` of finite first moment, `α`, `β` measurable and `β t ≠ 0` on
`(0, b)`, then gives the claim. (Proved here; FlowMatching 3.1 cites Albergo and Vanden-Eijnden
for the identity.)

**Checks.**

- Two-point data at `±r` on `ℝ`: the denoiser is `r tanh(α r y/β²)` (ScoreBasedDiffusion,
  Examples of Layer 2), so for the linear schedule
  `exactVelocity μ₁ α β t x = (r tanh(t r x/(1 − t)²) − x)/(1 − t)`; at `t = 0` it is `−x`, which is
  `E[x₁ − x₀ | x₀ = x]` for centred data.
- With the score form at `t = 0` one divides by `α 0 = 0`; with the coefficient `α′ + α β′/β` in
  place of `α′ − α β′/β` the two-point field at `t = 1/2`, `r = 1`, `x = 1` would be `−2`
  instead of `−2 + 2 tanh 2 = −0.071…`.

*Needs:* ScoreBasedDiffusion 2.1 (`denoiser`, and the identification of the denoiser with the
posterior mean); DenoisingDiffusion 3.1 (`smoothedDensity`, `hasLaw_smoothedDensity`);
FlowMatching 2.1 (`IsMarginalVelocity`) and 3.1 (`IsInterpolantVelocity`, the velocity–denoiser
identity); 1.1; Mathlib `measurable_deriv`.

### 1.3 The Lipschitz constant of the exact velocity

Prove `lipschitzWith_exactVelocity`: if `‖x‖ ≤ R` for `μ₁`-almost every `x` and `β t > 0`, then
`exactVelocity μ₁ α β t` is Lipschitz with constant

    Ku t = max |β′/β| |β′/β + (α′ − α β′/β) α R²/β²|          (all at t).

Route: for `c ≠ 0` and `s > 0`, ScoreBasedDiffusion 2.1 gives
`noisyScore = (s²)⁻¹ • (c • denoiser − y)` and
`fderiv noisyScore = (s²)⁻¹ • ((c²/s²) • posteriorCov − 1)`, so the denoiser is differentiable with
`fderiv (denoiser μ₁ c s) y = (c/s²) • posteriorCov μ₁ c s y`; for `c = 0` the denoiser is the
constant mean of `μ₁`, and the same formula holds. Hence the derivative of the field is
`(β′/β) • 1 + κ • posteriorCov` with `κ = (α′ − α β′/β) α/β²`. The posterior covariance is
self-adjoint (a mixture of the operators `w ↦ ⟪u, w⟫ • u`) with
`0 ≤ ⟪posteriorCov v, v⟫ ≤ R² ‖v‖²` for `c ≠ 0`: by the second-order identity of
ScoreBasedDiffusion 2.1 these two inequalities are equivalent to the lower bound
`⟪fderiv (noisyScore μ₁ c s) y v, v⟫ ≥ −‖v‖²/s²` of 2.1 and to the upper bound
`inner_fderiv_noisyScore_le` of ScoreBasedDiffusion 2.2. For `c = 0`, `κ = 0`. The Rayleigh
quotients of the derivative therefore lie between
`β′/β` and `β′/β + κ R²`, whatever the sign of `κ`, and its norm, the largest absolute Rayleigh
quotient (`ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`), is at most `Ku t`;
`lipschitzWith_of_nnnorm_fderiv_le` concludes. No differentiability of `α` or `β` is needed:
`deriv` denotes a number in any case. (Proved here. Benton, Deligiannidis and Doucet, Theorem 2,
bound the Lipschitz constant of an interpolant velocity under a regularity assumption on the
interpolated laws; the constant above, for data in a ball, is derived here.)

**Checks.**

- Linear schedule: `Ku t = max (1/(1 − t)) |t R²/(1 − t)³ − 1/(1 − t)|`; for `R = 1`, `t = 1/2`
  this is `max 2 |4 − 2| = 2`, and for `R = 2`, `t = 1/2` it is `max 2 |16 − 2| = 14`.
- Attained: for two-point data at `±R`, the posterior at `y = 0` is `μ₁`, its covariance is `R²`,
  and the derivative of the field at `0` is `β′/β + κ R²`; for the linear schedule at `t = 1/2` it
  is `2` for `R = 1` and `14` for `R = 2`.
- Negative `κ`: for `α t = t (6/5 − t)`, `β = 1` and `t = 17/20`, `κ = (6/5 − 2t) α t = −0.14875`,
  and the bound is `|κ| R²`, attained by the two-point law; a bound written
  `|β′/β| + κ R²` would be negative there.
- `R = 0`: `μ₁ = δ₀`, the denoiser is `0`, and `Ku t = |β′/β|`.
- No bound uniform in `t` up to the data end: for the linear schedule `Ku t ~ R²/(1 − t)³` as
  `t → 1` when `R > 0`.

*Needs:* ScoreBasedDiffusion 2.1 (`noisyScore_eq_denoiser`, `hasFDerivAt_noisyScore`, the lower
bound on the derivative of the score) and 2.2 (`inner_fderiv_noisyScore_le`); Mathlib
`ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`, `lipschitzWith_of_nnnorm_fderiv_le`.

### 1.4 Continuity in time

Prove `continuousOn_exactVelocity`: if `μ₁` has a finite first moment, `α` and `β` are `C¹` and
`β > 0` on `[0, b]`, then `(t, x) ↦ exactVelocity μ₁ α β t x` is continuous on `[0, b] × E`. The
coefficients are continuous there because `α` and `β` are `C¹` and `β > 0`. The two integrals
that define the denoiser at `(α t, β t, x)` are continuous by dominated convergence
(`MeasureTheory.continuousOn_of_dominated`): their integrands are continuous in `(t, x)` and bounded
by `sup φ` and `‖x₁‖ sup φ`, which is `μ₁`-integrable by the first moment, for the Gaussian density
`φ` with variance in a compact subset of `(0, ∞)`; the smoothed density is positive
(DenoisingDiffusion 3.1). The first moment enters where `α` vanishes, as at `t = 0`, where the
denoiser is the mean of `μ₁`. (Proved here.)

**Checks.**

- Two-point data at `±r` and the linear schedule: the field of 1.2 is continuous on
  `[0, b] × ℝ` for every `b < 1`, but not up to `t = 1`, where `β 1 = 0`: as `t → 1` with
  `x ∉ {0, r, −r}` fixed it tends to `±∞`.

*Needs:* ScoreBasedDiffusion 2.1 (`denoiser`); DenoisingDiffusion 3.1 (positivity of the smoothed
density); Mathlib `MeasureTheory.continuousOn_of_dominated`.

### 1.5 The flow of the exact velocity

Prove `map_flow_exactVelocity`: if `‖x‖ ≤ R` almost surely, `α 0 = 0`, `β 0 = 1`, `β > 0` on
`[0, b]` and `IsFlowOn (exactVelocity μ₁ α β) φ 0 b`, then `γ.map (φ t) = p_t` for every
`t ∈ [0, b]`. Route: `t ↦ Ku t` is continuous on the compact interval `[0, b]`, so it is bounded by
some `Kb` (`IsCompact.exists_bound_of_continuousOn`), and the exact velocity is continuous in time
and `Kb`-Lipschitz in space on `[0, b]` by 1.3 and 1.4 (the ball gives the first moment that 1.2 and
1.4 assume); `π` is a probability measure with a finite
first moment, since its second coordinate is bounded and its first is Gaussian; FlowMatching 3.2
(`map_interpolant_eq_map_flow`) with 1.2 gives
`π.map (interpolant α β t) = (π.map (interpolant α β 0)).map (φ t)`, and 1.1 identifies both sides.
By FlowMatching 1.1 (`exists_isFlowOn`) such a flow exists and can be taken continuous on `ℝ × E`.
(Proved here.)

**Checks.**

- Two-point data, linear schedule, `b = 9/10`, `r = 1`: integrating the field of 1.2 from the
  Gaussian quantiles gives a monotone map whose image law has the distribution function of the
  mixture of 1.1 at `t = 9/10`, up to `10⁻¹³`.
- The flow cannot be continued to `t = 1` for two-point data: the time maps of a flow of a
  Lipschitz field are homeomorphisms (FlowMatching 1.1), and a homeomorphism pushes `γ` to a law
  without atoms, while `p_1 = μ₁` has two; correspondingly `Ku t → ∞` as `t → 1`. (A map that is
  not injective can push `γ` to `μ₁`: `x ↦ r sign x` does.)

*Needs:* FlowMatching 1.1 (`exists_isFlowOn`) and 3.2 (`map_interpolant_eq_map_flow`); 1.1 to 1.4;
Mathlib `IsCompact.exists_bound_of_continuousOn`.

### Examples

Two-point data `(δ₋ᵣ + δᵣ)/2` on `ℝ` with the linear schedule: the law `p_t`, the field
`(r tanh(t r x/(1 − t)²) − x)/(1 − t)`, its Lipschitz constant and its flow, as in the Checks. A
point mass `δ_m`: the denoiser is `m`, the field is `(β′/β) x + (α′ − α β′/β) m`, affine, and the
flow is `x ↦ β t x + α t m`.

### Dependencies

Layer 1 uses DenoisingDiffusion 1.2 and 3.1, ScoreBasedDiffusion 2.1 and 2.2, FlowMatching 1.1,
2.1, 3.1 and 3.2, Tau Ceti's affine image of a Gaussian law, and Mathlib's Gaussian measures,
`bind`, product pushforwards, Rayleigh quotients, the mean value inequality, dominated convergence
and compactness. 1.2 uses 1.1; 1.5 uses 1.1 to 1.4.

## Layer 2: the continuous-time guarantee

### 2.1 Early stopping plus training error

Prove `wassersteinEDist_data_flow_le`. Let `μ₁` be carried by the ball of radius `R`, let the
schedule satisfy `α 0 = 0`, `β 0 = 1` and `β > 0` on `[0, b]` with `0 ≤ b`, let `w` satisfy
`∀ t, LipschitzWith K (w t)` and be continuous in time on `[0, b]` for every `x`, and let
`IsFlowOn w ψ 0 b`. Then

    W₂ (μ₁, γ.map (ψ b))
      ≤ ENNReal.ofReal √((1 − α b)² ∫ ‖x‖² ∂μ₁ + (β b)² d)
        + ∫⁻ t in Ioo 0 b, ENNReal.ofReal (exp (K (b − t))) * (∫⁻ x, ‖u t x − w t x‖ₑ² ∂p_t)^(1/2),

with `u = exactVelocity μ₁ α β`. The first term is the price of stopping at `b`: for `d ≥ 1` it is
at least `β b √d > 0`. The second is the training error of `w`
measured under the exact laws `p_t`, which is what a flow-matching objective controls
(FlowMatching 2.2), weighted by the stability factor of the learned flow.

Route: by the triangle inequality `TauCeti.wassersteinEDist_triangle` (with `measurable_edist`)
through `p_b`. The first term is ScoreBasedDiffusion 1.3 with `c = α b`, `s = β b` and
`M = ∫ ‖x‖² ∂μ₁`. For the second, FlowMatching 1.1 gives a flow `φ` of `u` on `[0, b]`, continuous
on `ℝ × E` (with 1.3, 1.4 and the bound `Kb` of 1.5), so measurable; FlowMatching 5.2
(`wassersteinEDist_map_flow_le`) with `μ = γ`, `a = 0`, `p = 2` and `u` jointly continuous on
`[0, b] × E` by 1.4 bounds `W₂ (γ.map (φ b), γ.map (ψ b))` by the second term with `γ.map (φ t)`
in place of `p_t`, and 1.5 replaces it by `p_t` for every `t ∈ [0, b]`. (Proved here. The same
decomposition, with a Gaussian smoothing of the endpoint laws in place of early stopping and a
time-dependent Lipschitz constant, is the proof of Benton, Deligiannidis and Doucet, Theorem 4,
which adds the smoothing distance to their Theorem 3, itself their Theorem 1 applied to a class of
Lipschitz fields.)

By the Cauchy–Schwarz inequality the second term is at most `(∫₀ᵇ e^(2K(b − t)) dt)^(1/2) ε`, with
`ε² = ∫₀ᵇ ∫ ‖u_t − w_t‖² dp_t dt` the flow-matching objective of `w` on `(0, b)`; FlowMatching 5.2
states this consequence.

**Checks.**

- `w = u` on `[0, b]` (extended outside as in the Conventions): the second term vanishes and the
  bound is the first term. For two-point data at `±r`, the linear schedule and `b = 9/10`, it is
  `√(0.01 r² + 0.01)`; the exact `W₂ (μ₁, p_b)`, computed from quantile functions, is at most
  this for `r = 1/2, 1, 2` and agrees with it to four digits, the two components of `p_b` barely
  overlapping.
- Early stopping is a trade: for a schedule with `α 1 = 1` and `β 1 = 0` the first term tends to
  `0` as `b → 1`, while the Lipschitz constant `Kb` of the exact field that a learned field can be
  expected to share tends to `∞` (1.3), and with it the factor `exp (K (b − t))`.
- An affine learned field: two-point data at `±1`, the linear schedule, `b = 9/10` and
  `w t x = −x` (`K = 1`). The law of `ψ b` is `N(0, e^(−9/5))`, and the exact
  `W₂ (μ₁, γ.map (ψ b)) = (1 − 2σ√(2/π) + σ²)^(1/2)` with `σ = e^(−9/10)` is `0.7187`; the first
  term is `√0.02 = 0.1414` and the second, by quadrature, `0.9860`, so the bound is `1.1275`.
- `b = 0`: `ψ 0` is the identity, the second term is `0`, and the bound reads
  `W₂ (μ₁, γ) ≤ √(∫ ‖x‖² ∂μ₁ + d)`, the cost of the product coupling. For `b < 0` the interval is
  empty, `ψ b` is unconstrained, and no bound holds: `0 ≤ b` is needed.
- `d = 0`: every law is the point mass and both sides are `0`.

*Needs:* 1.1 and 1.3 to 1.5; FlowMatching 1.1 (`exists_isFlowOn`) and 5.2
(`wassersteinEDist_map_flow_le`); ScoreBasedDiffusion 1.3; Tau Ceti
`TauCeti.wassersteinEDist_triangle`; Mathlib `measurable_edist`,
`MeasureTheory.setLIntegral_congr_fun`.

### Examples

Two-point data with the linear schedule and an affine learned field, as in the Checks.

### Dependencies

Layer 2 uses Layer 1, FlowMatching 1.1 and 5.2, ScoreBasedDiffusion 1.3, Tau Ceti's triangle
inequality for the Wasserstein distance and Mathlib's measurability of the distance.

## Layer 3: the Euler sampler, pathwise

In this layer `E` is any real normed space.

### 3.1 The Euler error from regularity of the field

Prove `norm_flow_sub_euler_le`. Let `∀ t, LipschitzWith K (w t)`, let `w` be Lipschitz in time with
linear growth on `[0, b]`,

    ‖w r x − w s x‖ ≤ Λ (1 + ‖x‖) |r − s|      for r, s ∈ [0, b] and all x,

with `Λ : ℝ≥0`, let `‖w t 0‖ ≤ B₀` for `t ∈ [0, b]`, let `IsFlowOn w ψ 0 b`, and let the mesh have
steps `0 ≤ h n ≤ hmax` for `n < N` and `meshNode 0 h N = b`. Then for every `x`

    ‖ψ b x − oneStepSeq (explicitEuler.increment w) 0 h x N‖ ≤ gronwallBound 0 K (M x * hmax / 2) b,
    M x = (Λ + K²) (exp (K b) ‖x‖ + B₀ · gronwallBound 0 K 1 b) + Λ + K B₀.

No continuity hypothesis is needed beyond these: the time-Lipschitz bound makes `w` continuous in
time on `[0, b]`.

It is close to the bullet "Lipschitz data" of OneStepMethodsForODEs 3.1, which gives the Lipschitz
constant `K′ + L B` of the derivative of a solution when the field is `K′`-Lipschitz in time
uniformly in the state and `‖f r (y r)‖ ≤ B` along the solution. 3.1 here differs in allowing a
time-Lipschitz constant that grows linearly with the state, as it does for a linear field, and in
deriving the bound along the trajectory from `B₀` and the initial point.

Route: OneStepMethodsForODEs 3.1 (`explicitEuler_error_le`) with `y = ψ · x`, `y₀ = x`, `a = 0`,
`n = N`, once `r ↦ w r (ψ r x)` is `M x`-Lipschitz on `[0, b]`. Since `‖w t y‖ ≤ B₀ + K ‖y‖`,
Grönwall's inequality (`norm_le_gronwallBound_of_norm_deriv_right_le`) gives
`‖ψ r x‖ ≤ P := exp (K b) ‖x‖ + B₀ · gronwallBound 0 K 1 b` on `[0, b]`, so the trajectory is
`(B₀ + K P)`-Lipschitz, and

    ‖w r (ψ r x) − w s (ψ s x)‖ ≤ Λ (1 + P) |r − s| + K (B₀ + K P) |r − s| = M x |r − s|.

(Proved here; the hypothesis on `w` is in a form checkable on the field, where
`explicitEuler_error_le` asks for the Lipschitz constant of the derivative of the solution.)

**Checks.**

- Sharpness up to the constant: `w t x = x` on `ℝ`, `K = 1`, `Λ = 0`, `B₀ = 0`, one step `b`. The
  error is `(e^b − 1 − b) |x|`, the bound is `(e^b b/2)(e^b − 1) |x|`, and their ratio is `0.890`,
  `0.988`, `0.9988` for `b = 10⁻¹, 10⁻², 10⁻³`.
- The time-Lipschitz hypothesis is needed: `w t x = √t` on `ℝ` (`K = 0`, `B₀ = √b`) is continuous
  in time but not Lipschitz at `0`. One step of size `b` from `x = 0` errs by `(2/3) b^(3/2)`,
  while the bound with any `Λ` would be `Λ (1 + b^(3/2)) b²/2`, smaller for
  `b < min(1, 4/(9Λ²))` (and for every `b` when `Λ = 0`).
- The factor `1 + ‖x‖` is needed for linear fields: `w t x = t x` satisfies the hypothesis with
  `Λ = 1`, and `‖w r x − w s x‖ = ‖x‖ |r − s|` admits no bound uniform in `x`.
- A field that is linear in the state: `w t x = t x` on `ℝ` and `[0, 1]` (extended outside as in
  the Conventions; `K = Λ = 1`, `B₀ = 0`), ten steps of `1/10` from `x = 1`. The error is
  `e^(1/2) − ∏_(n<10) (1 + n/100) = 0.1016…`, and the bound is `(e − 1)(2e + 1)/20 = 0.5530…`.
- `N = 0` forces `b = 0`; then both sides are `0`. `hmax = 0` forces every step to be `0`, so
  `b = 0` again.

*Needs:* OneStepMethodsForODEs 1.1 (`meshNode`), 1.2 (`oneStepSeq`), 2.1 (`ButcherTableau`,
`increment`) and 3.1 (`explicitEuler`, `explicitEuler_error_le`); FlowMatching 1.1 (`IsFlowOn`);
Mathlib `gronwallBound`, `norm_le_gronwallBound_of_norm_deriv_right_le`.

### Examples

Scalar affine fields, for which flow and Euler iterates are explicit, as in the Checks.

### Dependencies

Layer 3 uses OneStepMethodsForODEs 1.1, 1.2, 2.1 and 3.1, FlowMatching 1.1 and Mathlib's Grönwall
inequality. It does not use Layers 1 and 2.

## Layer 4: the sampler guarantee

### 4.1 The Euler sampler

Prove `wassersteinEDist_data_euler_le`: under the hypotheses of 2.1 on the data and the schedule,
and of 3.1 on `w`, `ψ` and the mesh,

    W₂ (μ₁, γ.map (x ↦ oneStepSeq (explicitEuler.increment w) 0 h x N))
      ≤ [the two terms of 2.1] + ENNReal.ofReal (gronwallBound 0 K (M̄ * hmax / 2) b),
    M̄ = (Λ + K²) (exp (K b) √d + B₀ · gronwallBound 0 K 1 b) + Λ + K B₀.

The continuity of `w` in time that 2.1 assumes follows from the time-Lipschitz bound, and
`0 ≤ b` from the mesh. The bound is the sum of three terms: early stopping, training error and
discretization, the last of order `hmax`.

Route: the triangle inequality through `γ.map (ψ b)`, with 2.1 for the first distance. For the
second, the diagonal coupling of `γ` (`MeasureTheory.Measure.isCoupling_diagonalCoupling`) and
`TauCeti.wassersteinEDist_map_le_eLpNorm` give
`W₂ (γ.map (ψ b), γ.map Y) ≤ (∫ ‖ψ b x − Y x‖² dγ)^(1/2)`; `ψ b` is `exp (K b)`-Lipschitz
(`dist_le_of_trajectories_ODE`) and `Y` is continuous, because the Euler increment is `w t y`
(OneStepMethodsForODEs 2.1) and `w t` is Lipschitz. By 3.1 and the linearity of
`gronwallBound 0 K ε b` in `ε`, the integrand is at most `(M x hmax/2) gronwallBound 0 K 1 b`,
and `M x` is affine in `‖x‖`; Minkowski's inequality (`MeasureTheory.eLpNorm_add_le`) and
`(∫ ‖x‖² dγ)^(1/2) = √d` (`TauCeti.Probability.stdGaussian_map_norm_sq` and
`TauCeti.Probability.integral_id_chiSquaredMeasure`) give `M̄`. (Proved here.)

**Checks.**

- `√d`, not `d`: the Gaussian root mean square of `‖x‖` is `√d`; for `d = 4` it is `2`.
- The example of the Checks of 2.1 with ten steps of `9/100`: the Euler law is
  `N(0, (91/100)^20)`, its exact `W₂` to `μ₁` is `0.7282`, the discretization term is
  `(9/200) e^(9/10) (e^(9/10) − 1) = 0.1616`, and the bound is `1.2890`; the exact `W₂` between
  the laws of the flow and of the Euler method is `e^(−9/10) − (91/100)^10 = 0.0172`.

*Needs:* 2.1, 3.1; OneStepMethodsForODEs 2.1 (`existsUnique_isStage_of_isExplicit`); Tau Ceti
`TauCeti.wassersteinEDist_triangle`, `TauCeti.wassersteinEDist_map_le_eLpNorm`,
`MeasureTheory.Measure.isCoupling_diagonalCoupling`,
`TauCeti.Probability.stdGaussian_map_norm_sq`,
`TauCeti.Probability.integral_id_chiSquaredMeasure`; Mathlib `dist_le_of_trajectories_ODE`,
`MeasureTheory.eLpNorm_add_le`, `measurable_edist`.

### 4.2 Heun's method

Prove `wassersteinEDist_flow_heun_le`. Let `∀ t, LipschitzWith K (w t)` and `IsFlowOn w ψ 0 b`.
Let `M₂ M₃ : E → ℝ≥0` be measurable and `m₂ m₃ : ℝ≥0` with `∫⁻ M₂² dγ ≤ m₂²` and
`∫⁻ M₃² dγ ≤ m₃²`, and suppose that for every `x` the trajectory `y = ψ · x` satisfies the
hypotheses of OneStepMethodsForODEs 3.2: `r ↦ w r (y r)` is `M₂ x`-Lipschitz on `[0, b]` and has a
derivative `y₂ r` within `[0, b]` at every `r ∈ [0, b]`, with `y₂` `M₃ x`-Lipschitz there. For a
mesh as in 3.1,

    W₂ (γ.map (ψ b), γ.map (x ↦ oneStepSeq (heun.increment w) 0 h x N))
      ≤ ENNReal.ofReal (gronwallBound 0 (K (1 + hmax K / 2)) ((m₃/12 + K m₂/4) hmax²) b).

Combined with 2.1 by the triangle inequality this is the second-order guarantee. No continuity of
`w` in time is assumed: the coupling argument needs only that `ψ b` and the Heun map are
continuous, which the Lipschitz bound of `w t` gives.

Route: OneStepMethodsForODEs 3.2 (`heun_defect_le`) bounds the defect by
`(M₃ x/12 + K M₂ x/4) s³`; the increment of `heun` is `K (1 + s K/2)`-Lipschitz for a step `s`
(OneStepMethodsForODEs 2.2, `norm_increment_sub_le_of_isExplicit`, monotone in `s ≥ 0`), so
OneStepMethodsForODEs 1.4 (`norm_sub_oneStepSeq_le`) with `p = 2` gives the pathwise bound
`gronwallBound 0 (K (1 + hmax K/2)) ((M₃ x/12 + K M₂ x/4) hmax²) b`, which is the constant of the
global error stated in OneStepMethodsForODEs 3.2. The coupling and Minkowski's inequality as in
4.1 finish, with `‖M₂‖_(L²(γ)) ≤ m₂` and `‖M₃‖_(L²(γ)) ≤ m₃`. When `0 < b` the mesh has a step, so
`hmax ≥ 0`. (Proved here.)

**Checks.**

- Autonomous affine fields `w x = a x + c` on `ℝ`: `y′ = e^(ar)(ax + c)`, so
  `M₂ x = |a| max(1, e^(ab)) |ax + c|` and `M₃ x = a² max(1, e^(ab)) |ax + c|`, with
  `m₂² = a² max(1, e^(ab))² (a² + c²)`. For `a = −1`, `c = 1/2`, `b = 1` and four steps of `1/4`:
  `m₂ = m₃ = √5/2`, the bound is `0.0431`, and the exact `W₂` between the two Gaussian laws is
  `0.0052`.
- The root mean squares are nonnegative: for `a = 3/2`, `c = 7/10`, `b = 1` and one step, the exact
  `W₂` is `0.945…`, while the expression with `−m₂` in place of `m₂` is `−13.57…`.

*Needs:* OneStepMethodsForODEs 1.4 (`norm_sub_oneStepSeq_le`), 2.2
(`norm_increment_sub_le_of_isExplicit`) and 3.2 (`heun`, `heun_defect_le`); the coupling of 4.1
(Tau Ceti `TauCeti.wassersteinEDist_map_le_eLpNorm`,
`MeasureTheory.Measure.isCoupling_diagonalCoupling`); Mathlib `dist_le_of_trajectories_ODE`,
`MeasureTheory.eLpNorm_add_le`.

### Examples

The two-point law on `ℝ` with the linear schedule, `b = 9/10`, sampled by Euler and Heun: the
three terms of 4.1 are the early-stopping term `√(0.01 r² + 0.01)`, the training term of the
learned field, and the discretization term.

### Dependencies

Layer 4 uses 2.1 and 3.1, OneStepMethodsForODEs 1.4, 2.1, 2.2 and 3.2, Tau Ceti's coupling bound
for pushforwards, triangle inequality and Gaussian second moment, and Mathlib's Grönwall estimate
between trajectories and Minkowski's inequality.

## Scope and ownership

This roadmap owns the exact velocity in denoiser form for a Gaussian source (1.2), its Lipschitz
constant for data in a ball (1.3), its continuity (1.4) and the identification of its flow (1.5),
the continuous-time guarantee with early stopping (2.1), the pathwise Euler bound from the
regularity of the field (3.1), and the guarantees for the Euler and Heun samplers (4.1, 4.2).

Left to other roadmaps, by section, and not restated:

- FlowMatching owns flows (1.1), marginal velocities (2.1), interpolants and the
  velocity–denoiser identity (3.1), the transport of laws by the flow of an interpolant velocity
  (3.2) and the comparison of two flows in Wasserstein distance (5.1, 5.2). 1.2 above supplies the
  hypothesis of that identity for a Gaussian source; it differs from the velocity–score identity
  of FlowMatching 3.1 in being defined at `α t = 0`. That roadmap names the discretization error
  of an integrator as adding to its 5.2 by the triangle inequality and leaves it out of scope;
  Layers 3 and 4 above are that addition. The existence of the flows used above is cited from
  FlowMatching 1.1 (`exists_isFlowOn`) and not restated; for one initial value it is a case of the
  nonlinear Carathéodory theorem of DiracScatteringAndNonlinearFourierTransform 1.7, Layer 1.
- ScoreBasedDiffusion owns the denoiser, the posterior covariance and the pointwise Tweedie
  formulas (2.1), the score bounds for data in a ball (2.2) and the distance of the noised law
  from the data (1.3). 1.3 above bounds the Lipschitz constant of the velocity field, a different
  map from the score whose Lipschitz constant ScoreBasedDiffusion 2.2 bounds.
- OneStepMethodsForODEs owns meshes, one-step methods, Butcher tableaux, the Euler and Heun methods
  and their error bounds (1.1 to 1.4, 2.1, 2.2, 3.1, 3.2). 3.1 above is its 3.1 with the Lipschitz
  constant of the derivative of the trajectory derived from regularity of the field; it differs
  from the bullet "Lipschitz data" of that section as stated in 3.1 above.
- DenoisingDiffusion owns the Gaussian observation kernel (1.2), the smoothed density and
  `hasLaw_smoothedDensity` (3.1), and the discrete-time chain with its variational bound
  (Layer 4). Its divergence decomposition 4.1 to 4.3 with Pinsker's inequality
  (`TauCeti.etvDist_sq_le_two_mul_klDiv`) gives a total-variation statement for the discrete chain;
  that statement is not made here.

Already in the libraries: the Wasserstein distance, its triangle inequality and the coupling bound
for pushforwards (Tau Ceti), the standard Gaussian law and its second moment (Mathlib and Tau
Ceti), Grönwall's inequality and `gronwallBound` (Mathlib).

`Suggested.lean` declares copies, with bodies identical to the owners', of `gaussianKernel`,
`smoothedDensity` (DenoisingDiffusion 1.2, 3.1, in the form of ScoreBasedDiffusion 1.1, 1.2),
`denoiser` (ScoreBasedDiffusion 2.1), `IsFlowOn` (FlowMatching 1.1), `mixture`,
`IsMarginalVelocity` (FlowMatching 2.1), `interpolant`, `interpolantVelocity`,
`IsInterpolantVelocity` (FlowMatching 3.1), `meshNode`, `oneStepSeq` (OneStepMethodsForODEs 1.1,
1.2), `ButcherTableau`, `IsStage`, `stages`, `increment` (OneStepMethodsForODEs 2.1),
`explicitEuler` and `heun` (OneStepMethodsForODEs 3.1, 3.2), so that its statements elaborate
without importing another roadmap. They are not new notions; an implementation uses the owners'
declarations. The one definition owned here is `exactVelocity`.

Out of scope: deterministic samplers other than Runge–Kutta methods applied to the flow equation,
among them DDIM and exponential integrators, which are not treated here; the probability-flow
equation of a noising diffusion run backwards in time, and every stochastic sampler, reverse-time
equation or change of measure; time-dependent Lipschitz constants; and any statement about how
`K`, `Λ`, `B₀`, `M₂`, `M₃` or the training error behave for a trained network.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.stdGaussian` and `ProbabilityTheory.multivariateGaussian_zero_one`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`):
  `multivariateGaussian 0 1 = stdGaussian (EuclideanSpace ℝ ι)`.
- `MeasureTheory.Measure.bind` (`Mathlib/MeasureTheory/Measure/GiryMonad.lean`);
  `MeasureTheory.Measure.map_prod_map`: for measurable `f`, `g` and s-finite second factor,
  `(μa.map f).prod (μc.map g) = (μa.prod μc).map (Prod.map f g)`.
- `measurable_deriv`: `deriv f` is measurable.
- `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`
  (`Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`): for a symmetric `T`,
  `‖T‖ = ⨆ x, |T.rayleighQuotient x|`.
- `lipschitzWith_of_nnnorm_fderiv_le` (`Mathlib/Analysis/Calculus/MeanValue.lean`): a
  differentiable map with `‖fderiv f x‖₊ ≤ C` everywhere is `C`-Lipschitz.
- `MeasureTheory.continuousOn_of_dominated`
  (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`): continuity of a parametric integral on a
  set, for a first-countable parameter space, under an integrable dominating function.
- `IsCompact.exists_bound_of_continuousOn` (`Mathlib/Analysis/Normed/Group/Bounded.lean`).
- `gronwallBound`, `norm_le_gronwallBound_of_norm_deriv_right_le` and
  `dist_le_of_trajectories_ODE` (`Mathlib/Analysis/ODE/Gronwall.lean`): the bound function of the
  Conventions; a continuous function on `[a, b]` with right derivative `f′`,
  `‖f a‖ ≤ δ` and `‖f′ x‖ ≤ K ‖f x‖ + ε` satisfies `‖f x‖ ≤ gronwallBound δ K ε (x − a)`; two
  solutions of an equation with `∀ t, LipschitzWith K (v t)` stay within
  `δ exp (K (t − a))` of each other.
- `measurable_edist`: on a second-countable Borel pseudo-metric space the distance is measurable.
- `MeasureTheory.eLpNorm_add_le`: Minkowski's inequality for a.e. strongly measurable functions
  and `1 ≤ p`; `MeasureTheory.setLIntegral_congr_fun`: lower integrals over a measurable set agree
  for functions equal on it.

### From Tau Ceti

- `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_triangle`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`): for a measurable distance on
  a standard Borel space, `1 ≤ p` and a finite middle measure,
  `W_p(μ, ρ) ≤ W_p(μ, ν) + W_p(ν, ρ)`.
- `TauCeti.wassersteinEDist_map_le_eLpNorm`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Pushforward.lean`): for a coupling `π` of
  `μ` and `ν` and a.e. strongly measurable `f`, `g`,
  `W_p(μ.map f, ν.map g) ≤ eLpNorm (q ↦ edist (f q.1) (g q.2)) p π`.
- `MeasureTheory.Measure.isCoupling_diagonalCoupling`
  (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`): the diagonal coupling of `μ` is a
  coupling of `μ` with itself.
- `TauCeti.Probability.stdGaussian_map_norm_sq`
  (`TauCeti/Probability/Distributions/Chi/Gaussian.lean`) and
  `TauCeti.Probability.integral_id_chiSquaredMeasure`
  (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean`): `‖x‖²` under the standard Gaussian
  has the chi-squared law with `finrank` degrees of freedom, whose mean is `k` for `k ≥ 0`.
- `TauCeti.Probability.map_affine_multivariateGaussian`
  (`TauCeti/Probability/Distributions/Gaussian/Affine.lean`): for a positive semidefinite `S`, the
  image of `N(m, S)` under `x ↦ L x + c` is `N(L m + c, L S Lᵀ)`.
- `TauCeti.Probability.multivariateGaussianPDFReal`
  (`TauCeti/Probability/Distributions/Gaussian/Density.lean`), used in the copied definitions.

### From TauCetiRoadmap.FlowMatching

- 1.1: `IsFlowOn` (copied); `exists_isFlowOn`: on a complete space a field continuous in time
  and `K`-Lipschitz on `[a, b]` has a flow on `[a, b]` continuous on `ℝ × E`.
- 2.1: `mixture`, `IsMarginalVelocity` (copied).
- 3.1: `interpolant`, `interpolantVelocity`, `IsInterpolantVelocity` (copied); the
  velocity–denoiser identity: for a finite `π` with finite first moment and measurable `α`, `β`,
  if `D` is a marginal velocity of the moving Dirac masses for the fields `z.2` and `β t ≠ 0` on
  `(a, b)`, then
  `(β′/β) x + (α′ − α β′/β) D t x` is an interpolant velocity.
- 3.2: `map_interpolant_eq_map_flow`: for a finite `π` with finite first moment, `C¹` schedules
  and an interpolant velocity continuous in time and `K`-Lipschitz on `[a, b]` with flow `φ`,
  `π.map (interpolant α β t) = (π.map (interpolant α β a)).map (φ t)` for `t ∈ [a, b]`.
- 5.2: `wassersteinEDist_map_flow_le`: for `u` jointly continuous on `[a, b] × E` with a jointly
  measurable flow `φ`, `w` continuous in time and `K`-Lipschitz on `[a, b]` with flow `ψ`,
  `a ≤ b`, a finite `μ` and `1 ≤ p < ∞`,
  `W_p(μ.map (φ b), μ.map (ψ b))` is at most
  `∫⁻ t in Ioo a b, exp (K (b − t)) (∫⁻ ‖u t − w t‖ₑ^p d(μ.map (φ t)))^(1/p)`; and its
  Cauchy–Schwarz form for `p = 2`.

### From TauCetiRoadmap.ScoreBasedDiffusion

- 1.3: for a probability measure `μ₀` with `∫ ‖x‖² ∂μ₀ ≤ M`, every `c` and `s ≥ 0`,
  `W₂(μ₀, μ₀.bind (gaussianKernel c (s ^ 2))) ≤ √((1 − c)² M + s² d)`.
- 2.1: `denoiser` (copied); `noisyScore_eq_denoiser` and `hasFDerivAt_noisyScore` for a
  probability measure, every `c` and `s > 0`; the lower bound
  `⟪fderiv (noisyScore μ₀ c s) y v, v⟫ ≥ −‖v‖²/s²`; and, for integrable data and `c ≠ 0`, the
  identification of `denoiser μ₀ c s` with the conditional mean of `X` given `c • X + s • Z`.
- 2.2: `inner_fderiv_noisyScore_le`: for `‖x‖ ≤ R` almost surely,
  `⟪fderiv (noisyScore μ₀ c s) y v, v⟫ ≤ (c² R²/s⁴ − 1/s²) ‖v‖²`.

### From TauCetiRoadmap.OneStepMethodsForODEs

- 1.1 and 1.2: `meshNode`, `oneStepSeq` (copied).
- 1.4: `norm_sub_oneStepSeq_le`: defects at most `C s^(p+1)` and an `L`-Lipschitz increment give
  the error bound `gronwallBound ‖y t₀ − y₀‖ L (C hmax^p) (t_n − t₀)`.
- 2.1: `ButcherTableau`, `IsStage`, `stages`, `increment` (copied);
  `existsUnique_isStage_of_isExplicit`.
- 2.2: `norm_increment_sub_le_of_isExplicit`, with constant `L (1 + h L/2)` for `heun`.
- 3.1: `explicitEuler` (copied); `explicitEuler_error_le`: for a solution `y` on `[a, b]`,
  `∀ t, LipschitzWith L (f t)` and `r ↦ f r (y r)` `M`-Lipschitz on `[a, b]`, the Euler error at
  `t_n` is at most `gronwallBound ‖y a − y₀‖ L (M hmax/2) (t_n − a)`; and the bullet "Lipschitz
  data" (`M = K′ + L B` for a field `K′`-Lipschitz in time uniformly in the state), compared with
  3.1 above.
- 3.2: `heun` (copied); `heun_defect_le`: under the hypotheses on `M₂`, `y₂`, `M₃` of 4.2 above,
  the defect is at most `(M₃/12 + L M₂/4) h³`.

### From TauCetiRoadmap.DenoisingDiffusion

- 1.2: `gaussianKernel` (copied). 3.1: `smoothedDensity` (copied) and `hasLaw_smoothedDensity`:
  for `s > 0` the observation `c • X + s • Z` has density `smoothedDensity μ₀ c s`; the density
  is positive.

## References

- J. Benton, G. Deligiannidis and A. Doucet, *Error bounds for flow matching methods*,
  Transactions on Machine Learning Research, 2024, arXiv:2305.16860 (version 2).

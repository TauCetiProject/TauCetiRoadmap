# Roadmap: conjugate priors and posterior updates

**Summary.** A Bayesian model is a prior law on a parameter and a kernel giving the law of the
data for each parameter; the posterior is the conditional law of the parameter given the data. A
family of priors is conjugate when every posterior is again in the family. This roadmap proves the
classical conjugate updates as exact identities for Mathlib's posterior kernel, and proves the
theorems of Diaconis and Ylvisaker: for a natural exponential family the conjugate priors are
proper exactly for the expected hyperparameters, and they are the only priors under which the
posterior mean of the mean parameter is affine in the observation.

The first headline: with positive hyperparameters, the posterior after `n` observations is

- `Beta(a + k, b + n − k)` for a `Beta(a, b)` prior and `k ≤ n` successes in `n` trials;
- `Dir(a + k)` for a Dirichlet prior and multinomial counts `k` of total `n`;
- `Gamma(α + ∑ kᵢ, β + n)` for a Gamma prior (shape, rate) and `n` independent Poisson counts;
- the normal law with mean `m + v/(n v + s) · ∑ (xᵢ − m)` and variance `v s/(n v + s)` for a
  `N(m, v)` prior, `v ≥ 0`, and observations of known variance `s > 0`;
- a normal–gamma law with updated hyperparameters for a normal–gamma prior on precision and mean.

The first three hold at every observation of positive probability, the last two almost surely.

The second headline: let `ν` be a measure on `ℝ^d` whose natural parameter space `Θ` is open and
nonempty, with log partition function `M`, and let `𝒳`, the interior of the convex hull of its
support, be nonempty. The conjugate measure with hyperparameters `n₀ > 0` and `x₀` has density
`exp (n₀ ⟪x₀, θ⟫ − n₀ M(θ))` on `Θ`; it is finite exactly when `x₀ ∈ 𝒳`. Then the prior mean of
the mean parameter is `x₀`, and after `n` observations the posterior is, almost surely, the
conjugate prior with hyperparameters `n₀ + n` and `(n₀ x₀ + ∑ xᵢ)/(n₀ + n)`. Conversely, if the
support of `ν` contains a nonempty open set, the prior is carried by `Θ` and is not a point mass,
and after one observation `x` the posterior mean of the mean parameter is finite and equal to
`a x + b` almost surely, then `a ≠ 0` and the prior has density proportional to
`exp (a⁻¹ ⟪b, θ⟫ − a⁻¹ (1 − a) M(θ))` on `Θ`.

The roadmap builds on the posterior kernel and the standard laws of Mathlib and Tau Ceti, and on
the natural exponential families of MathematicalStatisticsFoundations. Layer 1 holds the five
classical updates, independent of one another; Layer 2 the exponential-family theory.

## Conventions

- **Posterior.** For a prior `π` on a standard Borel space and a kernel `κ` to the data, the
  posterior is Mathlib's `ProbabilityTheory.posterior`, written `κ†π`, determined up to null
  sets of the marginal law `κ ∘ₘ π`. On countable data spaces the statements hold at every point
  of positive marginal mass; on continuous ones they hold `κ ∘ₘ π`-almost everywhere, and a
  pointwise claim would be false there.
- **Prior and kernel as variables.** Each theorem takes `π` and `κ` as variables with instances
  `IsProbabilityMeasure π` and `IsMarkovKernel κ` (or `IsFiniteKernel κ`) and equations `π = …`,
  `κ θ = …` for every `θ`. The instances follow from the equations, so nothing is lost, and no
  definition needs a measurability proof in its body.
- **Laws.** `betaMeasure`, `gammaMeasure α β` (shape, rate), `gaussianReal m v` (variance
  `v : ℝ≥0`), `binomial n p` (`p` in the unit interval; a real `p` is clamped by
  `Set.projIcc 0 1`) and `poissonMeasure r` (`r : ℝ≥0`; the kernel uses `r.toNNReal`) are
  Mathlib's; `dirichletMeasure` and `multinomialMeasure` are Tau Ceti's, and the multinomial
  kernel turns `x` into cell weights exactly as Tau Ceti's `dirichletMultinomialMeasure` does.
- **Exponential families.** For `ν` on `E = EuclideanSpace ℝ ι`, Layer 2 uses the definitions of
  MathematicalStatisticsFoundations 3.1 with `T = id`: `Θ = naturalParameterSpace ν id`,
  `M = logPartition ν id`, `P_θ = exponentialFamilyMeasure ν id θ` (the exponential tilt of `ν`
  by `⟪θ, ·⟫`, the zero measure off `Θ`), and the mean parameter `m(θ) = ∫ x dP_θ`.
  `𝒳 = interior (convexHull ℝ ν.support)` with Mathlib's `Measure.support`; `volume` is
  Lebesgue measure. Densities carry the indicator of `Θ`, where `M` has junk values.
- Observations are indexed by `Fin n` and `n = 0` is allowed; every formula reduces to the prior.

## Layer 1: the classical conjugate updates

### 1.1 Beta–binomial

Let `0 < a`, `0 < b`, `n : ℕ`, `π = betaMeasure a b`, and `κ p = binomial n (projIcc 0 1 p)`.
Then for every `k ≤ n`, `(κ†π) k = betaMeasure (a + k) (b + (n − k))`
(`posterior_binomial_betaMeasure`).

Route (proved here). Let `c_k = C(n, k) B(a + k, b + n − k)/B(a, b)` (`B` the Beta function).
The Beta density `p^{a−1}(1−p)^{b−1}/B(a, b)` on `(0, 1)` (`betaMeasure_eq_withDensity_ofReal`)
times the mass `C(n, k) p^k (1 − p)^{n−k}` (`binomial_real_singleton`) gives, for measurable `A`
and `k ≤ n`, `∫_A κ p {k} dπ(p) = c_k · betaMeasure (a + k) (b + n − k) A`; at `A = ℝ` the
marginal mass of `{k}` is `c_k > 0`, in accordance with `betaBinomialMeasure_eq_bind` and
`betaBinomialMeasure_singleton_ne_zero_iff`. The posterior is the conditional kernel of the swap
of `π ⊗ₘ κ`, whose first marginal is `κ ∘ₘ π`. On the discrete space `ℕ`,
`Measure.condKernel_apply_of_ne_zero` evaluates it at every point of positive marginal mass:
`(κ†π) k A = c_k⁻¹ ∫_A κ p {k} dπ(p) = betaMeasure (a + k) (b + n − k) A`. Source: Gelman et
al., §2.4, p. 35, where the posterior is computed as a density.

*Needs:* Mathlib `posterior`, `Measure.condKernel_apply_of_ne_zero`, `binomial_real_singleton`;
Tau Ceti `betaMeasure_eq_withDensity_ofReal`, `betaBinomialMeasure_eq_bind`,
`betaBinomialMeasure_singleton_ne_zero_iff`.

**Checks.**

- For `(a, b) ∈ {(1, 1), (1/2, 3/2), (2/3, 5/2)}`, `n ≤ 4`, `k ≤ n` and `j ≤ 4`, the ratio
  `∫ p^{k+j}(1−p)^{n−k} dBeta(a, b) / ∫ p^k (1−p)^{n−k} dBeta(a, b)` equals the `j`-th moment
  `(a + k)⁽ʲ⁾/(a + b + n)⁽ʲ⁾` of `Beta(a + k, b + n − k)` (rising factorials), exactly.
- At `k > n` the marginal mass is `0` and the posterior is not determined, hence `k ≤ n`.

### 1.2 Dirichlet–multinomial

Let `ι` be finite and nonempty, `0 < a i` for all `i`, `π = dirichletMeasure a`, and let `κ x` be
the multinomial law with `n` trials and cell weights `(x i).toNNReal` (completed as in Tau Ceti's
`dirichletMultinomialMeasure`). Then for every `k : ι → ℕ` with `∑ i, k i = n`,
`(κ†π) k = dirichletMeasure (a + k)` (`posterior_multinomial_dirichletMeasure`).

Route (proved here). The core is the tilting identity: for every measurable `A`,
`∫_A ∏ᵢ xᵢ^{kᵢ} dDir(a)(x) = D_k · Dir(a + k)(A)`, where
`D_k = Γ(A₀) ∏ Γ(aᵢ + kᵢ) / (Γ(A₀ + n) ∏ Γ(aᵢ))` and `A₀ = ∑ aᵢ`. To prove it, let `G` have law
`∏ᵢ Gamma(aᵢ, 1)`, `S = ∑ Gᵢ` and `D = G/S`. By `dirichletMeasure_of_pos`, `D` has law `Dir(a)`, and
by `map_dirichletNormalize_sum_pi_gammaMeasure`, `D` and `S` are independent with `S` of law
`Gamma(A₀, 1)`. Since `∏ Gᵢ^{kᵢ} = S^n ∏ Dᵢ^{kᵢ}`, independence gives
`E[1_A(D) ∏ Gᵢ^{kᵢ}] = E[S^n] · E[1_A(D) ∏ Dᵢ^{kᵢ}]`, with `E[S^n] = Γ(A₀ + n)/Γ(A₀)`
(`integral_pow_gammaMeasure`). On the other hand, weighting `Gamma(aᵢ, 1)` by `g^{kᵢ}` gives
`Γ(aᵢ + kᵢ)/Γ(aᵢ)` times `Gamma(aᵢ + kᵢ, 1)` (`powerBias_gammaMeasure` and its normalizing
constant). So the left side equals `∏ Γ(aᵢ + kᵢ)/Γ(aᵢ)` times the probability that the normalized
vector of independent `Gamma(aᵢ + kᵢ, 1)` variables lies in `A`, which is `Dir(a + k)(A)` by
`dirichletMeasure_of_pos`. The multinomial mass at `k` is `n!/∏ kᵢ!` times `∏ xᵢ^{kᵢ}`
(`multinomialMeasure_real_singleton`) for Dirichlet-almost every `x`, which lies in the simplex.
The argument of 1.1 then applies with
`c_k = (n!/∏ kᵢ!) D_k`. The marginal is `dirichletMultinomialMeasure n a` by its definition, and it
charges every `k` of total `n` (`dirichletMultinomialMeasure_singleton_ne_zero_iff`). Source:
Gelman et al., §3.4, p. 69.

*Needs:* Mathlib `Measure.condKernel_apply_of_ne_zero`; Tau Ceti `dirichletMeasure_of_pos`,
`map_dirichletNormalize_sum_pi_gammaMeasure`, `integral_pow_gammaMeasure`, `powerBias_gammaMeasure`,
`multinomialMeasure_real_singleton`, `dirichletMultinomialMeasure_singleton_ne_zero_iff`.

**Checks.**

- For `a = (1/2, 1, 5/3)`, every `k` with `∑ kᵢ = n ≤ 3` and every `j ∈ {0, 1, 2}³`, the ratio
  `∫ ∏ xᵢ^{kᵢ + jᵢ} dDir(a) / ∫ ∏ xᵢ^{kᵢ} dDir(a)` equals the mixed moment
  `∏ (aᵢ + kᵢ)⁽ʲⁱ⁾ / (A₀ + n)⁽|ʲ|⁾` of `Dir(a + k)`, exactly.

### 1.3 Gamma–Poisson

Let `0 < α`, `0 < β`, `π = gammaMeasure α β`, and `κ r = ∏_{i < n} Poisson(r.toNNReal)` on
`Fin n → ℕ`. Then for every `k : Fin n → ℕ`,
`(κ†π) k = gammaMeasure (α + ∑ i, k i) (β + n)` (`posterior_poisson_gammaMeasure`).

Route (proved here). Let `S = ∑ kᵢ`. By `Measure.pi_pi` and `poissonMeasure_real_singleton`, the
mass of `{k}` under `κ r` is `e^{−n r} r^S / ∏ kᵢ!` for `r ≥ 0`. The Gamma density
`β^α r^{α−1} e^{−β r}/Γ(α)` on `(0, ∞)` (`gammaMeasure_eq_withDensity_ofReal`) times this mass is
`c_k` times the density of `Gamma(α + S, β + n)`, where
`c_k = β^α Γ(α + S) / (Γ(α) (β + n)^{α+S} ∏ kᵢ!) > 0`. Every `k` has marginal mass `c_k > 0`,
so the argument of 1.1 applies at every `k`. Source: Gelman et al., §2.6, p. 44.

Combined with Tau Ceti's `bind_gammaMeasure_poissonMeasure_mul_toNNReal`, this identifies the
posterior predictive law of a further count as negative binomial with shape `α + S` and success
probability `(β + n)/(β + n + 1)`.

*Needs:* Mathlib `Measure.condKernel_apply_of_ne_zero`, `Measure.pi_pi`,
`poissonMeasure_real_singleton`; Tau Ceti `gammaMeasure_eq_withDensity_ofReal`,
`bind_gammaMeasure_poissonMeasure_mul_toNNReal`.

**Checks.**

- For `(α, β) ∈ {(1, 1), (1/2, 3), (7/3, 2/5)}`, `n ≤ 3`, `S ≤ 4` and `j ≤ 4`, the ratio
  `∫ r^{S+j} e^{−n r} dGamma(α, β) / ∫ r^S e^{−n r} dGamma(α, β)` equals `(α + S)⁽ʲ⁾/(β + n)^j`,
  the `j`-th moment of `Gamma(α + S, β + n)`, exactly.
- The predictive law: for `(r, c) ∈ {(3/2, 2), (1, 1/3)}` and `y ≤ 3`, the mass
  `∫ e^{−λ} λ^y/y! dGamma(r, c)` equals the negative binomial mass
  `Γ(r + y)/(Γ(r) y!) p^r (1 − p)^y` with `p = c/(c + 1)`.

### 1.4 Normal–normal with known variance

Let `m : ℝ`, `v s : ℝ≥0` with `s ≠ 0`, `π = gaussianReal m v`, and `κ θ = ∏_{i < n} N(θ, s)` on
`Fin n → ℝ`. Then for `κ ∘ₘ π`-almost every `x`,

    (κ†π) x = gaussianReal (m + v / (n v + s) * ∑ i, (x i − m)) (v s / (n v + s))

(`posterior_gaussianReal_gaussianReal`). At `v = 0` prior and posterior are the point mass at `m`.

Route (proved here). If `v = 0`, then `π = dirac m` (`gaussianReal_zero_var`), the swap of
`π ⊗ₘ κ` is `κ m ⊗ dirac m`, and the constant kernel `dirac m` satisfies the hypothesis of
`ae_eq_posterior_of_compProd_eq`. If `v ≠ 0`, both `π` and `κ θ` have Gaussian densities
(`gaussianReal_of_var_ne_zero`). For `n ≥ 1` the likelihood is a function of `x` times
`exp (−n (θ − x̄)²/(2s))`, `x̄` the sample mean, so the normalized product of prior and likelihood
is the normal-location posterior of MathematicalStatisticsFoundations 9.4 (centre `x̄`, variance
`s`, prior `N(m, v)`). In density form, for all `θ` and `x`,

    φ_v(θ − m) ∏ φ_s(xᵢ − θ) = q(x) φ_w(θ − μ(x)),

with `w = v s/(n v + s)`, `μ(x)` the posterior mean, `φ_t` the centred normal density of variance
`t`, and `q(x)` the θ-integral of the left side. Tonelli (`lintegral_lintegral_swap`) turns this
into the equality of `(κ ∘ₘ π) ⊗ₘ η` and the swap of `π ⊗ₘ κ` on rectangles `B × A`, where `η` is
the claimed kernel. It is measurable because `μ` is affine and `measurable_gaussianReal` holds.
The rectangles form a π-system generating the product σ-algebra (`generateFrom_prod`,
`isPiSystem_prod`) and both sides are probability measures, so they are equal
(`ext_of_generate_finite`), and `ae_eq_posterior_of_compProd_eq` concludes. Source: Gelman et
al., §2.5, equations (2.11)–(2.12), pp. 41–42, in precision form; Murphy, §2.3, equations (20)
and (24).

*Needs:* MathematicalStatisticsFoundations 9.4; Mathlib `gaussianReal_of_var_ne_zero`,
`gaussianReal_zero_var`, `measurable_gaussianReal`, `lintegral_lintegral_swap`,
`generateFrom_prod`, `isPiSystem_prod`, `ext_of_generate_finite`,
`ae_eq_posterior_of_compProd_eq`.

**Checks.**

- For `n ≤ 3`, the θ-derivative of
  `−(θ − m)²/(2v) − ∑ (xᵢ − θ)²/(2s) + (θ − μ(x))²/(2w)` is `0` identically (symbolic in
  `m, v, s, xᵢ`).
- `n = 0`: `μ = m`, `w = v s/s = v`, and the posterior is the prior.
- The hypothesis `s ≠ 0` is needed. With `s = 0`, `n = 0` and `v = 1`, the posterior is the prior
  `N(m, 1)`, while the formula gives the variance `1 · 0/(0 + 0) = 0`.

### 1.5 Normal–gamma

The normal–gamma law `normalGammaMeasure m κ₀ α β` on pairs `(τ, μ)` (precision, mean) has
`τ ~ Gamma(α, β)` and, given `τ`, `μ ~ N(m, (κ₀ τ)⁻¹)`: the bind of `gammaMeasure α β` with
`τ ↦ dirac τ ⊗ gaussianReal m ((κ₀ τ)⁻¹).toNNReal`.

Let `0 < κ₀`, `0 < α`, `0 < β`, `π = normalGammaMeasure m κ₀ α β`, and let
`L (τ, μ) = ∏_{i < n} N(μ, τ⁻¹)` on `Fin n → ℝ`. Then for `L ∘ₘ π`-almost every `x`,
`(L†π) x = normalGammaMeasure mₙ (κ₀ + n) (α + n/2) βₙ` (`posterior_normalGammaMeasure`), where

    mₙ = (κ₀ m + ∑ xᵢ)/(κ₀ + n),
    βₙ = β + ((∑ xᵢ²) + κ₀ m² − (κ₀ m + ∑ xᵢ)²/(κ₀ + n))/2.

For `n ≥ 1` and `x̄ = (∑ xᵢ)/n`, `βₙ = β + (1/2) ∑ (xᵢ − x̄)² + κ₀ n (x̄ − m)²/(2(κ₀ + n)) ≥ β`.

Route (proved here). The normal–gamma law has the density
`g(τ, μ) = Gamma(α, β)(τ) · φ_{(κ₀τ)⁻¹}(μ − m)` on `(0, ∞) × ℝ`, by `Measure.bind_apply` and
Tonelli, since `gammaMeasure α β` charges only `τ > 0` (`gammaMeasure_eq_withDensity_ofReal`).
Expanding the exponents in `τ` and `μ` gives, for `τ > 0`,
`g(τ, μ) ∏ φ_{τ⁻¹}(xᵢ − μ) = q(x) gₙ(τ, μ)`, where `gₙ` is the density of the updated law and
`q(x) > 0` depends on `x` alone. The rest is the rectangle argument of 1.4. The claimed kernel is
measurable because its density `gₙ` is jointly measurable in `(x, τ, μ)`. Source: Murphy, §3.3,
equations (85)–(89).

Under a normal–gamma law the marginal of `μ` is Student t with `2α` degrees of freedom, location
`m` and squared scale `β/(α κ₀)`: Tau Ceti's `multivariateTMeasure_smul_eq_bind_gammaMeasure` in
dimension one (`n = 2α`, `ρ = 2β`, `S = κ₀⁻¹`); for the posterior this is Murphy's (91).

*Needs:* Mathlib `Measure.bind_apply`, `gaussianReal_of_var_ne_zero`, `lintegral_lintegral_swap`,
`ext_of_generate_finite`, `ae_eq_posterior_of_compProd_eq`; Tau Ceti
`gammaMeasure_eq_withDensity_ofReal`, `multivariateTMeasure_smul_eq_bind_gammaMeasure`.

**Checks.**

- For `n ≤ 3`, the partial derivatives in `τ` and `μ` of `log g + ∑ log φ_{τ⁻¹}(xᵢ − μ) − log gₙ`
  vanish identically (symbolic in `m, κ₀, α, β, xᵢ`).
- For `n ∈ {1, 2, 3}`, the two expressions for `βₙ` agree identically.
- `n = 0`: `mₙ = m`, `βₙ = β + (κ₀ m² − κ₀ m²)/2 = β`, and the posterior is the prior.

### Examples

`Beta(1, 1)` with one success in two trials gives `Beta(2, 2)`; `Gamma(1, 1)` with counts `(2, 0)`
gives `Gamma(3, 3)` and the predictive `NB(3, 3/4)`; `N(0, 1)` with `s = 1` and one `x` gives
`N(x/2, 1/2)`.

### Dependencies

Mathlib and Tau Ceti, and MathematicalStatisticsFoundations 9.4 for 1.4, as in the *Needs:*
lines. 1.2 and 1.3 reuse the argument of 1.1, and 1.5 that of 1.4; no target uses another.

## Layer 2: conjugate priors for natural exponential families

Throughout, `ν` is a measure on `E = EuclideanSpace ℝ ι`, `ι` finite, and
`f_{n₀,x₀}(θ) = exp (n₀ ⟪x₀, θ⟫ − n₀ M(θ))` on `Θ`. In every theorem `Θ` is nonempty, so some
positive `exp ⟪θ, ·⟫` is `ν`-integrable and `ν` is σ-finite; it is not assumed separately.

### 2.1 The conjugate family

`naturalParameterSpace`, `logPartition` and `exponentialFamilyMeasure` are copied verbatim from
MathematicalStatisticsFoundations 3.1. `conjugatePriorMeasure ν n₀ x₀` is Lebesgue measure with
the density `f_{n₀,x₀}` on `Θ` and `0` off `Θ`. When its total mass is positive and finite, the
normalized measure is the conjugate prior: the family (2.3) of Diaconis and Ylvisaker,
pp. 271–272.

*Needs:* MathematicalStatisticsFoundations 3.1; Mathlib `Measure.tilted`, `Measure.support`.

### 2.2 Proper conjugate priors

Assume `𝒳` is nonempty, `Θ` is open and nonempty, and `n₀ > 0`. Then
`conjugatePriorMeasure ν n₀ x₀ univ < ∞ ↔ x₀ ∈ 𝒳` (`conjugatePriorMeasure_lt_top_iff`).

Route (proved here). *If `x₀ ∈ 𝒳`.* We show `M(θ) ≥ ⟪x₀, θ⟫ + δ‖θ‖ + log η` on `Θ`, for some
`δ > 0` and `0 < η ≤ 1`. Then `f_{n₀,x₀}(θ) ≤ η^{−n₀} e^{−n₀ δ ‖θ‖}`, which is integrable. Choose
`δ > 0` with the closed ball of radius `3δ` about `x₀` inside `𝒳`. For a unit vector `u`, the point
`x₀ + 3δ u` lies in the convex hull of the support. So some point `z` of the support has
`⟪u, z − x₀⟫ > 2δ`, since otherwise the whole hull lies in the half-space
`⟪u, · − x₀⟫ ≤ 2δ`. A small ball about `z` then has positive measure and lies in the open set
`H_u = {x | ⟪u, x − x₀⟫ > δ}`. The map `u ↦ min 1 (ν H_u)` is positive. It is also lower
semicontinuous, by Fatou's lemma applied to the indicators of `H_u`, which are lower
semicontinuous in `u`. So on the unit sphere it has a positive minimum `η`. For `θ ∈ Θ`, `θ ≠ 0`
and `u = θ/‖θ‖`, every `x ∈ H_u` has `⟪θ, x⟫ > ⟪θ, x₀⟫ + δ‖θ‖`. Hence
`e^{M(θ)} ≥ ∫_{H_u} e^{⟪θ, x⟫} dν ≥ η e^{⟪θ, x₀⟫ + δ‖θ‖}`. At `θ = 0`, `e^{M(0)} = ν E ≥ η`.

*If `x₀ ∉ 𝒳`.* Since `𝒳` is open, convex and nonempty, `geometric_hahn_banach_point_open` gives a
continuous linear functional `ℓ` with `ℓ x₀ < ℓ x` on `𝒳`. Write `ℓ = −⟪u, ·⟫`; then `u ≠ 0` and
`⟪u, x⟫ < ⟪u, x₀⟫` on `𝒳`. The support lies in the closure of `𝒳` (a convex set with
nonempty interior lies in the closure of its interior), so `⟪u, x⟫ ≤ ⟪u, x₀⟫` for
`ν`-almost every `x` (`Measure.measure_compl_support`). For `θ ∈ Θ` and `t ≥ 0` this gives
`e^{⟪θ + t u, x⟫} ≤ e^{t ⟪u, x₀⟫} e^{⟪θ, x⟫}` almost everywhere. Hence `θ + t u ∈ Θ` and
`M(θ + t u) ≤ M(θ) + t ⟪u, x₀⟫`, so `f_{n₀,x₀}(θ + t u) ≥ f_{n₀,x₀}(θ)` because `n₀ > 0`. Take a
closed ball `K ⊆ Θ`. The function `f_{n₀,x₀}` is continuous and positive on `Θ`, because `M` is
(`analyticOnNhd_logPartition`, MathematicalStatisticsFoundations 3.3; `ν ≠ 0` because `𝒳` is
nonempty), so it has a positive minimum on `K`. Then
`f_{n₀,x₀} ≥ min_K f_{n₀,x₀}` on the half-cylinder `K + [0, ∞) u ⊆ Θ`, which has infinite
volume. The two directions follow Diaconis–Ylvisaker, Theorem 1, p. 272, but the bound of the
first direction is our own.

*Needs:* 2.1; MathematicalStatisticsFoundations 3.3 (`analyticOnNhd_logPartition`); Mathlib
`Measure.measure_compl_support`, `geometric_hahn_banach_point_open`.

**Checks.**

- The hypothesis on `𝒳` is needed. Take `ι` empty and `ν = 0`. Then `E` is a point, `Θ = E` is
  open and nonempty, and the conjugate measure is the unit point mass, which is finite. But the
  support is empty and `x₀ ∉ 𝒳 = ∅`.
- Bernoulli: `ν = δ₀ + δ₁` on `ℝ`, `M(θ) = log (1 + e^θ)`, `𝒳 = (0, 1)`. Under `p = e^θ/(1+e^θ)`
  the conjugate prior is `Beta(n₀ x₀, n₀ (1 − x₀))`. At `x₀ = 1` the density
  `e^{n₀θ}/(1 + e^θ)^{n₀}` tends to `1` at `+∞`, so the mass is infinite, as 2.2 says.
- Poisson: `ν = ∑ₖ δₖ/k!`, `M(θ) = e^θ`, `𝒳 = (0, ∞)`; in `λ = e^θ` the prior is `Gamma(n₀ x₀, n₀)`.

### 2.3 The sign of `n₀`

Assume `ι` is nonempty and `Θ = E`. If `conjugatePriorMeasure ν n₀ x₀ univ < ∞`, then `n₀ > 0`
(`pos_of_conjugatePriorMeasure_lt_top`).

Route (proved here). Suppose `n₀ ≤ 0`. The function `M` is convex on `E`: by Hölder's inequality
when `ν ≠ 0`, and `M = log 0 = 0` when `ν = 0`. So the exponent
`n₀ ⟪x₀, θ⟫ − n₀ M(θ) = n₀ ⟪x₀, θ⟫ + |n₀| M(θ)` is a finite convex function on `E`. It has an affine
minorant `c + ⟪w, θ⟫`, a supporting hyperplane at `0`. Then `f_{n₀,x₀} ≥ e^{c + ⟪w, θ⟫}`, which is
not integrable on `E` for `ι` nonempty. Source: Diaconis–Ylvisaker, Theorem 1 (the case
`Θ = ℝ^d`), p. 272.

*Needs:* 2.1; Mathlib `integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder's inequality).

**Checks.**

- Normal location: `ν = N(0, 1)`, `M(θ) = θ²/2`, `Θ = ℝ`. For `n₀ ∈ {0, −1}`,
  `∫ exp (n₀ θ − n₀ θ²/2) dθ = ∞`.
- `ι` empty: `E` is a point and the measure is finite for every `n₀`, so the hypothesis is needed.

### 2.4 The prior mean of the mean parameter

Assume `Θ` is open and nonempty, `n₀ > 0`, `x₀ ∈ 𝒳`, and let `π` be the normalized conjugate
prior. Then `π` is a probability measure, the mean parameter `θ ↦ ∫ x dP_θ` is `π`-integrable,
and `∫ (∫ x dP_θ) dπ(θ) = x₀` (`integral_mean_conjugatePrior`).

Route (proved here). The mass of `π` is finite by 2.2 and positive because `f_{n₀,x₀} > 0` on
the nonempty open `Θ`. On `Θ`, `∇ f_{n₀,x₀} = n₀ (x₀ − m(θ)) f_{n₀,x₀}`, where `m(θ) = ∇M(θ)` is
the mean parameter (MathematicalStatisticsFoundations 3.3, `hasFDerivAt_logPartition`). So it
suffices to show that `∂ᵤ f_{n₀,x₀}` is integrable on `Θ` with integral `0`, for each unit vector
`u`; integrability of `m` under `π` follows. Write `θ = θ' + t u` with `θ' ⟂ u`. Each slice of
`Θ` is an open interval `(t₋, t₊)`, since `Θ` is open and convex. On it
`h(t) = f_{n₀,x₀}(θ' + t u)` is positive, smooth and log-concave, because `M` is convex (Hölder's
inequality). So `h'` changes sign at most once, and `∫ |h'| ≤ 2 sup h`. The bound of the route of
2.2 gives `h(t) ≤ η^{−n₀} e^{−n₀ δ ‖θ' + t u‖} ≤ η^{−n₀} e^{−n₀ δ ‖θ'‖}`, which is integrable
in `θ'` over the orthogonal complement of `u`; so `∂ᵤ f_{n₀,x₀}` is integrable and Fubini applies.
The boundary values vanish. At a finite endpoint, which is not in `Θ` because `Θ` is open,
Fatou's lemma gives `M → ∞` while `⟪x₀, ·⟫` stays bounded, so `h → 0`. At an infinite endpoint
`h → 0` by the same exponential bound. Hence `∫ h' dt = 0` on every slice. Source:
Diaconis–Ylvisaker, Theorem 2, p. 273, whose domination step is a different estimate, (2.9),
p. 274.

*Needs:* 2.2 (its bound); MathematicalStatisticsFoundations 3.3 (`hasFDerivAt_logPartition`,
`analyticOnNhd_logPartition`); Mathlib `integral_mul_le_Lp_mul_Lq_of_nonneg`.

**Checks.**

- Bernoulli with `(n₀, x₀) ∈ {(2, 1/2), (3, 1/3), (5/2, 4/5)}`: the mean of `p` under
  `Beta(n₀ x₀, n₀ (1 − x₀))` is `x₀`.
- Poisson with `(n₀, x₀) ∈ {(2, 3/2), (1/2, 4)}`: the mean of `λ` under `Gamma(n₀ x₀, n₀)` is `x₀`.
- Nonemptiness of `Θ` is needed. For Lebesgue measure on `ℝ`, `Θ = ∅` is open and `𝒳 = ℝ`. The
  conjugate measure is `0`, so `π = 0` is not a probability measure and the integral is `0 ≠ x₀`
  for `x₀ ≠ 0`.

### 2.5 Conjugate updating and the linear posterior mean

Assume `Θ` is open and nonempty, `n₀ > 0` and `x₀ ∈ 𝒳`. Let `π` be the normalized conjugate prior
and `κ θ = P_θ^{⊗ n}` on `Fin n → E`. For `κ ∘ₘ π`-almost every `x`, put
`y(x) = (n₀ + n)⁻¹ (n₀ x₀ + ∑ xᵢ)`. Then `(κ†π) x` is the normalized conjugate prior with
hyperparameters `n₀ + n` and `y(x)`, and the posterior mean of the mean parameter is `y(x)`
(`posterior_conjugatePrior`).

Route (proved here, from 2.2 and 2.4). For `θ ∈ Θ`, `P_θ^{⊗ n}` has density
`exp (⟪θ, ∑ xᵢ⟫ − n M(θ))` with respect to `ν^{⊗ n}`, and for `θ ∉ Θ` it is `0`. The algebra
`n₀ ⟪x₀, θ⟫ − n₀ M(θ) + ⟪θ, ∑ xᵢ⟫ − n M(θ) = (n₀ + n)(⟪y(x), θ⟫ − M(θ))` shows that the prior
density times the likelihood is `f_{n₀+n, y(x)}`, up to the constant normalizer of `π`.

Next, `y(x) ∈ 𝒳` for almost every `x`. The marginal `κ ∘ₘ π` is absolutely continuous with
respect to `ν^{⊗ n}`, and `ν`-almost every point lies in the support
(`Measure.measure_compl_support`). For such `x` with `n ≥ 1`, the average `(∑ xᵢ)/n` lies in the
convex hull of the support. Since `y(x)` is a combination of `x₀ ∈ 𝒳` with positive weight
`n₀/(n₀ + n)` and that average, `y(x) ∈ 𝒳` (`Convex.combo_interior_self_mem_interior`). For
`n = 0`, `y = x₀`. By 2.2 the normalizer of `f_{n₀+n, y(x)}` is then finite, and it is positive.

The claimed kernel is measurable in `x`, since its density is jointly measurable in `(x, θ)`.
Tonelli gives the rectangle identity, and `ae_eq_posterior_of_compProd_eq` gives the first
claim. The second follows from 2.4 at the hyperparameters `(n₀ + n, y(x))`. The form of the
posterior is stated by Diaconis–Ylvisaker in the Remarks after Theorem 2, p. 274, and the
posterior mean is their equation (2.10).

*Needs:* 2.2, 2.4; Mathlib `Measure.pi_pi`, `Measure.measure_compl_support`,
`Convex.combo_interior_self_mem_interior`, `lintegral_lintegral_swap`, `ext_of_generate_finite`,
`ae_eq_posterior_of_compProd_eq`.

**Checks.**

- Bernoulli with the three hyperparameter pairs of 2.4, `n ≤ 2` and `S = ∑ xᵢ ≤ n`: the posterior
  mean of `p` is `(n₀ x₀ + S)/(n₀ + n)`, and the posterior is
  `Beta(n₀ x₀ + S, n₀ (1 − x₀) + n − S)`, the update 1.1 for Bernoulli trials.
- Normal location `N(θ, 1)`: the conjugate prior `(n₀, x₀)` is `N(x₀, 1/n₀)`, and the update
  agrees with 1.4 for `m = x₀`, `v = 1/n₀`, `s = 1`.

### 2.6 The Diaconis–Ylvisaker characterization

Assume `Θ` is open and the support of `ν` contains a nonempty open set `U`. Let `π` be a
probability measure with `π Θᶜ = 0` that is not a point mass, and let `κ θ = P_θ`. Let `a : ℝ` and
`b : E`. Suppose that for `κ ∘ₘ π`-almost every `x`, the mean parameter is `(κ†π) x`-integrable
with `∫ (∫ y dP_θ) d(κ†π) x (θ) = a x + b`. Then `a ≠ 0`, and for some constant `c`,
`π = c · exp (a⁻¹ ⟪b, θ⟫ − a⁻¹ (1 − a) M(θ)) dθ` on `Θ`, with `π` zero off `Θ`
(`conjugatePrior_of_posterior_mean_eq`). For `a ≠ 1` this is the conjugate prior with
`n₀ = (1 − a)/a` and `x₀ = b/(1 − a)`.

Integrability of the posterior mean is part of the hypothesis; Diaconis and Ylvisaker read the
conditional expectation through positive and negative parts and deduce the same finiteness.

Route (sketched, our own route). Let `F = e^{−M} π`, a measure on `Θ` (not finite in general).
The marginal of the observation has the density `L(x) = ∫ e^{⟪x, θ⟫} dF(θ) > 0` with respect to
`ν`, and Bayes' formula (`posterior_eq_withDensity`) gives the posterior the `F`-density
`e^{⟪x, θ⟫}/L(x)`. The set where `L` is finite, and the set where `∫ |m| e^{⟪x, θ⟫} dF` is finite,
are convex, and by the hypothesis their complements are `ν`-null. For `x ∈ U` take a small
simplex in `U` around `x`; since `ν` charges every open subset of `U`, each set has points so
close to the vertices that their convex hull contains `x`. So both are finite on `U`. The
hypothesis then reads `∫ (m(θ) − a x − b) e^{⟪x, θ⟫} dF(θ) = 0` for `ν`-almost every `x ∈ U`,
hence for every `x ∈ U`, since such `x` are dense in `U` and the left side is continuous on `U`.
Both terms are analytic on the tube `U + i E`, and a function analytic on `B + i E`, for a ball
`B ⊆ U`, that vanishes on `B` vanishes identically; so the identity holds for every complex `z`
with real part in `U`. Fix
`x₁ ∈ U` and put `G = e^{⟪x₁, ·⟫} F`. Taking `z = x₁ + i y` gives, for all `y ∈ E`,
`Ĝ_m(y) = (a x₁ + b) Ĝ(y) + a · (i y) Ĝ(y)` for the Fourier transforms of `m G` and `G`, finite
because `x₁ ∈ U`.

If `a = 0`, then `(m − b) G = 0`, so `G` is concentrated on `{θ ∈ Θ | m(θ) = b}`. That set has at
most one point, since `m` is injective on `Θ`: MathematicalStatisticsFoundations 3.5
(`exists_analytic_inverse_exponential_family_mean`) gives a left inverse `g` of `m` on `Θ`.
Its hypotheses hold: `ν` is σ-finite and nonzero, `Θ` is open and nonempty, and the family is
minimal because no hyperplane carries the open set `U`. This contradicts the hypothesis that `π`
is not a point mass. If `a ≠ 0`, the identity says that the distributional gradient of `G` on `E` is
`−a⁻¹ (m − a x₁ − b) G` (pair both sides with the Fourier transform of a Schwartz function and use
Fourier inversion). On the connected open set `Θ`, where `m` is smooth, the only
distributions with this property are `G = c e^{φ}` with `∇φ = −a⁻¹ (m − a x₁ − b)`, that is,
`φ = −a⁻¹ M + ⟪x₁ + a⁻¹ b, ·⟫` up to a constant, because `e^{−φ} G` has gradient `0` on `Θ`.
Since `π Θᶜ = 0` and `π = e^{M − ⟪x₁, ·⟫} G` on `Θ`, the stated density follows. Source:
Diaconis–Ylvisaker, Theorem 3, p. 275. Their proof inverts the characteristic functions directly
rather than solving the distributional equation.

*Needs:* MathematicalStatisticsFoundations 3.3 (`hasFDerivAt_logPartition`) and 3.5
(`exists_analytic_inverse_exponential_family_mean`); Mathlib `posterior_eq_withDensity`,
`Measure.ext_of_charFun`.

**Checks.**

- The point-mass exclusion is needed. For `π = dirac θ₁` with `θ₁ ∈ Θ`, the posterior is
  `dirac θ₁` and its mean is the constant `m(θ₁)`, so the hypothesis holds with `a = 0`.
- The open-set hypothesis is needed. For the Bernoulli family (support `{0, 1}`) and the prior
  with mass `1/2` at each of `θ = ±1`, the posterior mean of `p` takes one value at `x = 0` and
  another at `x = 1`, so it is affine in `x` with `a ≠ 0`. But `π` has no density.
- Conversely, for a conjugate prior with `n₀ > 0`, 2.5 with `n = 1` gives
  `a = 1/(n₀ + 1) ∈ (0, 1)` and `b = n₀ x₀/(n₀ + 1)`, and the density
  `exp (a⁻¹ ⟪b, θ⟫ − a⁻¹ (1 − a) M)` is `f_{n₀,x₀}`.

### Examples

The Bernoulli, Poisson and normal location families of the Checks of 2.2–2.5.

### Dependencies

MathematicalStatisticsFoundations 3.1 (definitions, copied), 3.3 and 3.5, as in the *Needs:*
lines; Layer 1 only in the Checks.

## Scope and ownership

Owned here: the posterior kernels 1.1–1.5, the conjugate family 2.1 and the theorems 2.2–2.6.

Already in the library, used and not restated: the marginal laws of the data (beta-binomial,
Dirichlet-multinomial, the Gamma mixture of Poisson laws as a negative binomial law, the Gamma
scale mixture of normal laws as a multivariate t law); Tau Ceti's Gamma–Gaussian conjugacy
`lintegral_gammaMeasure_lintegral_multivariateGaussian` for a known mean and a Gamma precision with
shape equal to rate (1.5 is the case of an unknown mean); Mathlib's posterior kernel, its Bayes
formula `posterior_eq_withDensity`, and Bayes estimators.

Stated by other roadmaps and not restated: natural exponential families, their log partition
function, mean parametrization and maximum likelihood (MathematicalStatisticsFoundations Layer 3);
Bayes, admissible and minimax rules (MathematicalStatisticsFoundations Layer 7); the
normal-location posterior as a normalized density, identified as a Gaussian law
(MathematicalStatisticsFoundations 9.4), which 1.4 uses; the isotropic Gaussian Bayes update for
one observation `Y = cX + noise` (DenoisingDiffusion 1.2); the conditional law of a Gaussian state
given linear Gaussian measurements (KalmanFiltering Layer 3). Theorem 1.4 is the identification of
Mathlib's posterior kernel for `n` independent scalar observations.

Not treated: the urn proportion as a posterior mean and de Finetti's theorem, conjugate priors on
discrete observation spaces (Diaconis–Ylvisaker §4), admissibility of linear Bayes estimators,
normal–Wishart updates, and posterior consistency and asymptotic normality.

## Exact supplier contracts

### From Mathlib

- `Probability/Kernel/Posterior.lean`: `ProbabilityTheory.posterior` (finite `μ` and `κ`, standard
  Borel nonempty parameter space); `ae_eq_posterior_of_compProd_eq` (from
  `(κ ∘ₘ μ) ⊗ₘ η = (μ ⊗ₘ κ).map Prod.swap` with `η` finite, `η =ᵐ[κ ∘ₘ μ] κ†μ`);
  `posterior_eq_withDensity` (`κ ω ≪ κ ∘ₘ μ` for `μ`-a.e. `ω`).
- `Probability/Kernel/Disintegration/StandardBorel.lean`: `Measure.condKernel_apply_of_ne_zero`
  (measurable singletons, `ρ.fst {x} ≠ 0`: `ρ.condKernel x s = (ρ.fst {x})⁻¹ ρ ({x} ×ˢ s)`).
- `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `Measure.ext_of_charFun` (finite
  measures with equal characteristic functions are equal);
  `MeasureTheory/Integral/Bochner/Basic.lean`: `integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder).
- `MeasureTheory/Measure/Typeclasses/Finite.lean`: `ext_of_generate_finite` (finite measures equal
  on a generating π-system and on `univ`); `MeasureTheory/MeasurableSpace/Prod.lean`:
  `generateFrom_prod`, `isPiSystem_prod`; `lintegral_lintegral_swap` (a.e.-measurable integrand,
  s-finite measures), `Measure.bind_apply`, `Measure.pi_pi` (σ-finite factors).
- `Probability/Distributions/Binomial.lean`: `binomial_real_singleton`;
  `Probability/Distributions/Poisson/Basic.lean`: `poissonMeasure_real_singleton`;
  `Probability/Distributions/Gaussian/Real.lean`: `gaussianReal_of_var_ne_zero` (`v ≠ 0`),
  `gaussianReal_zero_var`, `measurable_gaussianReal`.
- `MeasureTheory/Measure/Tilted.lean`: `Measure.tilted`; `MeasureTheory/Measure/Support.lean`:
  `Measure.support`, `Measure.measure_compl_support` (hereditarily Lindelöf space);
  `geometric_hahn_banach_point_open` (open convex `t`, `x ∉ t`);
  `Convex.combo_interior_self_mem_interior` (`x ∈ interior s`, `y ∈ s`, `a > 0`, `b ≥ 0`,
  `a + b = 1`).

### From Tau Ceti

All under `TauCeti/Probability/Distributions/`:
- `Beta/Basic.lean`: `betaMeasure_eq_withDensity_ofReal`; `BetaBinomial/Basic.lean`:
  `betaBinomialMeasure_eq_bind` (`0 < a`, `0 < b`), `betaBinomialMeasure_singleton_ne_zero_iff`
  (`≠ 0 ↔ k ≤ n`).
- `Gamma/Basic.lean`: `gammaMeasure_eq_withDensity_ofReal`, `integral_pow_gammaMeasure` (`0 < a`,
  `0 < r`); `Gamma/PowerBias.lean`: `powerBias_gammaMeasure` (`0 < a`, `0 < r`, `−a < q`);
  `Gamma/Poisson.lean`: `bind_gammaMeasure_poissonMeasure_mul_toNNReal` (`0 < r`, `0 < c`).
- `Dirichlet/Basic.lean`: `dirichletMeasure_of_pos` (nonempty `ι`, all `aᵢ > 0`);
  `Dirichlet/Factorization.lean`: `map_dirichletNormalize_sum_pi_gammaMeasure` (all `aᵢ > 0`,
  `0 < r`); `Multinomial/Basic.lean`: `multinomialMeasure_real_singleton`;
  `DirichletMultinomial/Basic.lean`: `dirichletMultinomialMeasure_singleton_ne_zero_iff` (all
  `aᵢ > 0`; `≠ 0 ↔ ∑ kᵢ = n`).
- `MultivariateT/Basic.lean`: `multivariateTMeasure_smul_eq_bind_gammaMeasure` (`S` positive
  semidefinite, `0 < n`, `0 < ρ`).

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 3.1 `naturalParameterSpace`, `logPartition`, `exponentialFamilyMeasure` (copied verbatim).
- 3.3 `analyticOnNhd_logPartition` (`ν ≠ 0`; `M` analytic on the interior of `Θ`) and
  `hasFDerivAt_logPartition` (`ν ≠ 0`, `θ` interior: the derivative is `innerSL ℝ (m(θ))`).
- 3.5 `exists_analytic_inverse_exponential_family_mean` (σ-finite nonzero `ν`, minimal family,
  `Θ` open and nonempty): some `g` has `g (m(θ)) = θ` and `m(θ) ∈ 𝒳` for `θ ∈ Θ`.
- 9.4 the normal-location posterior (variance `v > 0`; for a Gaussian prior it is the Gaussian law
  with the summed precisions and the precision-weighted mean).

## References

- P. Diaconis and D. Ylvisaker, *Conjugate priors for exponential families*, Ann. Statist. 7
  (1979), no. 2, 269–281, doi:10.1214/aos/1176344611: the family (2.3), pp. 271–272; Theorem 1,
  p. 272; Theorem 2, p. 273; estimate (2.9), Remarks and (2.10), p. 274; Theorem 3, p. 275.
- A. Gelman, J. B. Carlin, H. S. Stern, D. B. Dunson, A. Vehtari and D. B. Rubin, *Bayesian Data
  Analysis*, 3rd ed., CRC Press, 2013 (electronic edition on the first author's page): §2.4, p. 35;
  §2.5, (2.11)–(2.12), pp. 41–42; §2.6, p. 44; §3.4, p. 69.
- K. P. Murphy, *Conjugate Bayesian analysis of the Gaussian distribution*, note, 2007 (author's
  page): §2.3, (20) and (24); §3.3, (85)–(91).

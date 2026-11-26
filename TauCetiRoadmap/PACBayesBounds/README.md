# Roadmap: PAC-Bayesian bounds

**Summary.** A learning procedure that outputs a probability distribution over hypotheses, rather
than a single hypothesis, can be judged by its average loss. PAC-Bayesian bounds control the gap
between the average loss on a sample and the average loss in the population, simultaneously for
every such distribution, at the price of its relative entropy to a distribution fixed before the
data are seen. This roadmap proves the classical bounds of this kind for losses with values in
`[0, 1]` and i.i.d. samples, and the optimality properties of the Gibbs posterior. Throughout, the
hypotheses form an arbitrary measurable space, the loss is jointly measurable in the hypothesis and
the data point, the sample has size `n ≥ 1`, and the prior `π` is a probability measure on the
hypotheses. For a posterior `ρ`, a probability measure on the hypotheses, `R(ρ)` is its average
risk and `r(ρ)` its average empirical risk; `KL(ρ‖π)` is the relative entropy.

The headline theorems are these. Each holds for every `δ > 0`, and "with probability at least
`1 − δ`" means that the set of samples on which some posterior violates the inequality has
(outer) probability at most `δ`.

- *The change of measure inequality.* If a jointly measurable function `f` of a hypothesis and a
  sample has `E exp f(θ, ·) ≤ 1` for every hypothesis `θ`, then with probability at least
  `1 − δ`, every posterior `ρ` with finite relative entropy has
  `∫ f dρ ≤ KL(ρ‖π) + log(1/δ)`. Every bound in probability below is this inequality
  applied to an exponential moment bound for a single hypothesis.
- *The Seeger–Maurer and McAllester bounds.* Maurer's inequality `E exp(n · kl(M ‖ μ)) ≤ 2√n`
  for the empirical mean `M` of `n` i.i.d. variables in `[0, 1]` with mean `μ`, where `kl` is the
  relative entropy between Bernoulli laws, gives, with probability at least `1 − δ`, for every
  posterior, `kl(r(ρ) ‖ R(ρ)) ≤ (KL(ρ‖π) + log(2√n/δ))/n`, and hence, by Pinsker's
  inequality, `R(ρ) ≤ r(ρ) + √((KL(ρ‖π) + log(2√n/δ))/(2n))`.
- *Catoni's bounds at a fixed inverse temperature.* For every `β > 0`, with probability at least
  `1 − δ`, every posterior has `R(ρ) ≤ r(ρ) + β/(8n) + (KL(ρ‖π) + log(1/δ))/β`, and also the
  sharper `R(ρ) ≤ (1 − exp(−(β/n) r(ρ) − (KL(ρ‖π) + log(1/δ))/n)) / (1 − exp(−β/n))`.
- *The Gibbs posterior.* For `β > 0` the measure with density proportional to
  `exp(−β · empirical risk)` with respect to `π` is the unique minimizer of
  `r(ρ) + KL(ρ‖π)/β`. With probability at least `1 − δ` its risk exceeds the risk of every
  posterior `ρ` by at most `β/(4n) + 2(KL(ρ‖π) + log(2/δ))/β`, and its expected risk over the
  sample exceeds the risk of `ρ` by at most `β/(8n) + KL(ρ‖π)/β`.

The roadmap builds on Mathlib's relative entropy, exponential tilting, product measures and
Hoeffding's lemma, and on Tau Ceti's relative-entropy library, which supplies the
Donsker–Varadhan variational inequality, the change-of-reference identity for tilted measures and
Pinsker's inequality. MathematicalStatisticsNonparametric supplies the relative entropy between
Bernoulli laws and its joint convexity.

Layer 1 below defines risks and proves the change of measure inequality. Layer 2 proves the
exponential moment bounds for a single hypothesis: Hoeffding's, Catoni's for Bernoulli laws, and
Maurer's. Layer 3 combines the two into the four bounds, and Layer 4 treats the Gibbs posterior.

## Conventions

- **Hypotheses, data and losses.** Hypotheses range over a measurable space `Θ` and data over a
  measurable space `Z` with a probability measure `P`. A loss is `ℓ : Θ → Z → ℝ` with
  `Measurable (Function.uncurry ℓ)` and values in `[0, 1]`. No topology, countability or standard
  Borel hypothesis is made on `Θ` or `Z`.
- **Samples.** A sample of size `n` is `S : Fin n → Z` under
  `Measure.pi (fun _ : Fin n ↦ P)`, written `Pⁿ`. Every bound assumes `n ≥ 1`.
- **Risks.** `risk P ℓ θ = ∫ ℓ θ z dP(z)` and `empiricalRisk ℓ S θ = (∑ i, ℓ θ (S i)) / n`. For a
  posterior `ρ`, `R(ρ) = ∫ risk P ℓ θ dρ(θ)` and `r(ρ, S) = ∫ empiricalRisk ℓ S θ dρ(θ)`, Bochner
  integrals of functions with values in `[0, 1]`.
- **Prior and posteriors.** The prior `π` is a probability measure on `Θ`, fixed before the sample.
  A posterior is any probability measure `ρ` on `Θ`; since every bound quantifies over all
  posteriors inside the event, a posterior may depend on the sample in any way, measurable or not.
- **Relative entropy.** `KL(ρ‖π)` is Mathlib's `InformationTheory.klDiv ρ π` with values in
  `ℝ≥0∞`, infinite unless `ρ ≪ π` with integrable log-likelihood ratio. The bounds quantify over
  posteriors with `klDiv ρ π ≠ ∞` and use the real number `(klDiv ρ π).toReal`; for the others
  they say nothing, as the classical bounds do.
- **Binary relative entropy.** `klBin a b = a log(a/b) + (1 − a) log((1 − a)/(1 − b))` is the
  definition of MathematicalStatisticsNonparametric 1.3, copied verbatim. With Mathlib's
  conventions `log 0 = 0` and `x/0 = 0` it is the relative entropy of the Bernoulli law with mean
  `a` from the one with mean `b` for `a ∈ [0, 1]` and `b ∈ (0, 1)`, and at `a = b ∈ {0, 1}`;
  where that relative entropy is infinite (`b ∈ {0, 1}` and `a ≠ b`) it takes a junk value at most
  `0`. An upper bound on `klBin` therefore never claims more than the bound on the true relative
  entropy.
- **Probability of the bad event.** "With probability at least `1 − δ`, for every posterior" is
  written `Pⁿ {S | ∃ ρ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧ (violation)} ≤ ENNReal.ofReal δ`.
  For an uncountable `Θ` this set need not be measurable, and Mathlib's measure of an arbitrary set
  is its outer measure. By `MeasureTheory.exists_measurable_superset`, the statement is equivalent
  to the existence of a measurable set of samples of probability at least `1 − δ` on which every
  posterior satisfies the inequality; the proofs below produce such a set directly.
- **Inverse temperature.** The parameter of Catoni's bounds and of the Gibbs posterior is written
  `β > 0`; the sources write `λ`.
- **Parameter ranges.** The statements assume only `δ > 0`; for `δ ≥ 1` they hold trivially, since
  a probability is at most `1`. They are false for `δ = 0`, where `log(1/0)` is the junk value
  `log 0 = 0`; for `n = 0`, where `empiricalRisk` and the terms divided by `n` are `0`; and for
  `β = 0`. Counterexamples are among the Checks: `δ = 0` in 1.2, `n = 0` in 2.3, 3.1, 3.3, 4.2
  and 4.3, and `β = 0` in 3.1 and 4.1.

## Layer 1: risks and the change of measure inequality

### 1.1 Risk and empirical risk

Define `risk P ℓ θ` and `empiricalRisk ℓ S θ` as in the conventions (Alquier, §1.1.1, pp. 4–5).

- For a loss with values in `[0, 1]`, both are in `[0, 1]`, and for `n ≥ 1` the mean of
  `empiricalRisk ℓ S θ` under `Pⁿ` is `risk P ℓ θ`.
- Joint measurability of `ℓ` makes `θ ↦ risk P ℓ θ` and `(θ, S) ↦ empiricalRisk ℓ S θ`
  measurable, so `R(ρ)` and `r(ρ, S)` are defined for every posterior and every sample.

**Checks.**
- One hypothesis, `Z = {0, 1}`, `ℓ θ z = z` and `P` the Bernoulli law with mean `p`: the risk is
  `p`, and on the sample `(1, 0, 1)` the empirical risk is `2/3`.
- For `n = 0` the empirical risk is the junk value `0` whatever the loss, while the risk can be
  `1`; this is why every bound assumes `n ≥ 1`.

*Needs:* Mathlib `MeasureTheory.Measure.pi`, `Measurable.lintegral_prod_right'`,
`MeasureTheory.measurePreserving_eval`. (Proved here.)

### 1.2 The change of measure inequality

Let `(Ω, μ)` be a probability space, `π` a probability measure on `Θ`, and `f : Θ → Ω → ℝ`
jointly measurable with `∫⁻ exp(f θ ω) dμ(ω) ≤ 1` for every `θ`. Prove
`measure_exists_integral_gt_klDiv_add_log_le`: for every `δ > 0`, the set of `ω` for which some
probability measure `ρ` with `klDiv ρ π ≠ ∞` has `(klDiv ρ π).toReal + log(1/δ) < ∫ f(θ, ω) dρ(θ)`
has `μ`-measure at most `δ` (Alquier, proof of Theorem 2.1, pp. 12–13, with Lemma 2.2, p. 12;
Catoni, Theorem 1.1.4, p. 4, from Lemma 1.1.3, p. 4).

Route: put `F(ω) = ∫⁻ exp(f(θ, ω)) dπ(θ)`, measurable by `Measurable.lintegral_prod_left'`. By
Tonelli (`MeasureTheory.lintegral_lintegral_swap`) `∫⁻ F dμ ≤ 1`, so Markov's inequality
(`MeasureTheory.meas_ge_le_lintegral_div`) gives `μ{F ≥ 1/δ} ≤ δ`. Off that set, for every `ρ`
with finite relative entropy the Donsker–Varadhan inequality
`∫ g dρ − log ∫ exp g dπ ≤ KL(ρ‖π)` of Tau Ceti
(`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`), applied to the truncations of
`f(·, ω)` at the levels `−K` and `K` and passed to the limit `K → ∞` by monotone convergence,
gives `∫ f dρ ≤ KL(ρ‖π) + log F(ω) ≤ KL(ρ‖π) + log(1/δ)`. Where `f(·, ω)` is not `ρ`-integrable
its Bochner integral is `0`, which is at most the right side for `δ ≤ 1`.

**Checks.**
- `δ > 0` is needed. Take `Θ` a point, `Ω = {0, 1}` with the fair law, `f = log(3/2)` at `1` and
  `log(1/2)` at `0`, so that `E exp f = (3/2 + 1/2)/2 = 1`. With `ρ = π` and `δ = 0` the
  inequality reads `f ≤ 0`, which fails on `{1}`, of probability `1/2 > 0`.
- The exponential moment hypothesis is needed: for `f ≡ 1`, `E exp f = e`, and with `ρ = π` and
  `δ = 1/2` the inequality `1 ≤ log 2 = 0.693` fails for every `ω`.
- For a finite `Θ` the supremum of `∫ f dρ − KL(ρ‖π)` over posteriors is `log ∑ π(θ) exp f(θ, ω)`
  (Donsker–Varadhan), so the event of the theorem is exactly `{log ∑ π(θ) exp f(θ, ·) > log(1/δ)}`.
  For the exponent of 3.1 with two hypotheses of losses `z` and `1 − z` under the fair law on
  `{0, 1}`, `π` uniform, `n = 10`, `β = 8` and `δ = 1/2`, this is the event
  `cosh(8(K/10 − 1/2)) > 2 e^(4/5)` for the number `K` of ones in the sample, that is
  `K ∈ {0, 1, 2, 8, 9, 10}`, of probability `112/1024 = 7/64 < 1/2`.

*Needs:* 1.1 for the setting; Mathlib `Measurable.lintegral_prod_left'`,
`MeasureTheory.lintegral_lintegral_swap`, `MeasureTheory.meas_ge_le_lintegral_div`; Tau Ceti
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`.

### Examples

The fair-coin function of the first Check of 1.2; finite hypothesis sets, where the supremum over
posteriors is a log-sum-exp.

### Dependencies

Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.measurePreserving_eval`,
`Measurable.lintegral_prod_right'`, `Measurable.lintegral_prod_left'`,
`MeasureTheory.lintegral_lintegral_swap`,
`MeasureTheory.meas_ge_le_lintegral_div`, `InformationTheory.klDiv`; Tau Ceti
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`. No other layer.

## Layer 2: exponential moments of one hypothesis

Throughout, `g : Z → ℝ` is measurable with values in `[0, 1]`, `μ = ∫ g dP`, and
`M(S) = (∑ i, g (S i)) / n` for `n ≥ 1`. For a loss, `g = ℓ θ`, `μ = risk P ℓ θ` and
`M(S) = empiricalRisk ℓ S θ`.

### 2.1 Hoeffding's exponential moment bound

Prove that for every real `β`, `E exp(β(μ − M)) ≤ exp(β²/(8n))` under `Pⁿ` (Alquier, Lemma 1.1,
p. 5, with `t = β/n`, as in the proof of Theorem 2.1, p. 13). Route: the coordinates
`S ↦ g (S i)` are independent under `Pⁿ` (`ProbabilityTheory.iIndepFun_pi`); each centred
coordinate has a sub-Gaussian moment generating function with parameter `1/4` by Hoeffding's
lemma (`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`); the sum of `n` of them has parameter
`n/4` (`ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun`), and its moment generating
function at `−β/n` is at most `exp((n/4)(β/n)²/2) = exp(β²/(8n))`
(`ProbabilityTheory.HasSubgaussianMGF.mgf_le`). The same bound holds for `E exp(β(M − μ))`.

**Checks.**
- `n = 1`, `g` the identity on `{0, 1}` with the fair law, `β = 2`: the left side is
  `(e + e⁻¹)/2 = cosh 1 = 1.5431` and the right side `exp(1/2) = 1.6487`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`,
`ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun`,
`ProbabilityTheory.HasSubgaussianMGF.mgf_le`. (Proved here.)

### 2.2 Catoni's exponential moment bound for Bernoulli laws

For `a > 0` let `Φₐ(p) = −log(1 − p(1 − e^(−a)))/a`, an increasing convex bijection of `[0, 1]`
onto itself with inverse `q ↦ (1 − e^(−aq))/(1 − e^(−a))`. Prove that for every `β > 0`,
`E exp(β Φ_(β/n)(μ) − β M) ≤ 1` under `Pⁿ`, with equality when `g` takes only the values `0`
and `1` (Catoni, (1.1), p. 2, and Lemma 1.1.1, p. 3, for losses with values in `{0, 1}`).
Route: by convexity of the exponential, `exp(−a x) ≤ 1 − x(1 − e^(−a))` for `x ∈ [0, 1]`, with
equality at `0` and `1`; take expectations, multiply over the independent coordinates
(`ProbabilityTheory.iIndepFun_pi`), and put `a = β/n`, so that
`E exp(−β M) ≤ (1 − μ(1 − e^(−a)))ⁿ = exp(−β Φₐ(μ))`. For losses with values in `[0, 1]` this is
proved here by the convexity step; the source treats the values `0` and `1`.

**Checks.**
- For `g ≡ 1/2`, `n = 1`, `β = 1`: `Φ₁(1/2) = −log((1 + e⁻¹)/2) = 0.37989`, and
  `exp(0.37989 − 1/2) = 0.88682 < 1`; for the Bernoulli law with mean `1/2` in its place the
  expectation is exactly `1`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.iIndepFun_pi`, `convexOn_exp`. (Proved here.)

### 2.3 Maurer's inequality

Define `klBin` as in the conventions (copied from MathematicalStatisticsNonparametric 1.3). Prove
`lintegral_exp_mul_klBin_le`: for `n ≥ 1`,
`∫⁻ exp(n · klBin(M(S), μ)) dPⁿ(S) ≤ 2√n` (Maurer, inequality (1), p. 1, and Theorem 1 with the
estimate below it, p. 3, for `n ≥ 8`).

Route: if `μ ∈ {0, 1}` then `M = μ` almost surely and `klBin μ μ = 0`, so the integral is
`1 ≤ 2√n`. Otherwise, by joint convexity of the binary relative entropy
(MathematicalStatisticsNonparametric 1.3, `convexOn_klBin`) the integrand is a convex function of
`(g (S 1), …, g (S n)) ∈ [0, 1]ⁿ`; writing each point of the cube as a convex combination of its
vertices with the product weights shows that its expectation is at most the same expectation for
the Bernoulli law with mean `μ` (Maurer, Lemma 3, p. 4). For that law the expectation equals
`ξ(n) = ∑_k (n choose k)(k/n)^k (1 − k/n)^(n − k)`, independent of `μ` (Maurer, proof of
Theorem 1, p. 6). Maurer bounds `ξ(n)` by `e^(1/(12n)) √(πn/2) + 2` through Stirling's formula and
an integral comparison, which is at most `2√n` for `n ≥ 8`; for `1 ≤ n ≤ 7` the exact values
below are at most `2√n`. The range `n ≥ 1` is proved here.

**Checks.**
- `ξ(1) = 2 = 2√1`, so the constant `2` is attained at `n = 1` by every Bernoulli law with mean
  in `(0, 1)`: `μ · (1/μ) + (1 − μ) · (1/(1 − μ)) = 2`.
- `ξ(2) = 5/2`, `ξ(3) = 26/9`, `ξ(4) = 103/32`, `ξ(5) = 2194/625`, `ξ(6) = 1223/324`,
  `ξ(7) = 472730/117649 = 4.0181`, against `2√n = 2.8284, 3.4641, 4.0000, 4.4721, 4.8990, 5.2915`.
  Maurer's estimate is not enough at `n = 7`: `e^(1/84) √(7π/2) + 2 = 5.3557 > 5.2915`.
- `ξ(n) ≤ 2√n` for every `n ≤ 20000`, with equality only at `n = 1`.
- `n ≥ 1` is needed: for `n = 0` the integrand is `exp 0 = 1` and the bound `2√0 = 0` fails.

*Needs:* 1.1; MathematicalStatisticsNonparametric 1.3 (`klBin`, `convexOn_klBin`); Mathlib
`ProbabilityTheory.iIndepFun_pi`, `MeasureTheory.Measure.pi_pi`.

### Examples

Bernoulli losses, for which the bounds of 2.2 and of the reduction step of 2.3 are equalities; the
constant loss `1/2`, for which 2.2 is strict.

### Dependencies

Layer 1 (1.1); MathematicalStatisticsNonparametric 1.3; Mathlib `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`,
`ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun`,
`ProbabilityTheory.HasSubgaussianMGF.mgf_le`, `convexOn_exp`, `MeasureTheory.Measure.pi_pi`.

## Layer 3: PAC-Bayesian bounds

In this layer `P`, `π` and `ℓ` are as in the conventions, `n ≥ 1` and `δ > 0`; each theorem bounds
`Pⁿ` of the set of samples on which some posterior `ρ` with `klDiv ρ π ≠ ∞` violates the stated
inequality by `δ`. Each is proved by 1.2 with `Ω = Zⁿ`, `μ = Pⁿ` and `f(θ, S)` the exponent of a
bound of Layer 2 for the loss `ℓ θ`, made jointly measurable by 1.1, followed by an inequality that
moves the average over `ρ` inside a function.

### 3.1 Catoni's bound

Prove `catoni_bound`: for `β > 0`, with probability at least `1 − δ`, every posterior has
`R(ρ) ≤ r(ρ) + β/(8n) + (KL(ρ‖π) + log(1/δ))/β` (Alquier, Theorem 2.1, p. 12, with `C = 1`,
stated there for `δ < 1`). The same holds with `R(ρ)` and `r(ρ)` exchanged (Alquier, (4.2) and
its proof, pp. 35–36).

Route: 1.2 with `f(θ, S) = β(risk P ℓ θ − empiricalRisk ℓ S θ) − β²/(8n)`, whose exponential
moment is at most `1` by 2.1; the integral over `ρ` is linear. For the exchanged form use the
exponent `β(empiricalRisk ℓ S θ − risk P ℓ θ) − β²/(8n)`.

**Checks.**
- With `KL(ρ‖π) = 0` and the best `β = √(8n log(1/δ))`, the slack is `√(log(1/δ)/(2n))`, the
  Hoeffding deviation for one hypothesis: for `n = 100` and `δ = 0.05`, `β = 48.95` and the slack
  is `0.12239`.
- `n ≥ 1` is needed: for `n = 0` the empirical risk and `β/(8n)` are `0`, the sample space is a
  point, and with `Θ` a point, `ℓ ≡ 1`, `ρ = π`, `δ = 1/2` and `β = 10` the inequality reads
  `1 ≤ log 2/10`, false with probability `1`.
- `β > 0` is needed: for `β = 0` both divisions give `0` and the inequality claims `R(ρ) ≤ r(ρ)`
  outside probability `δ`, which fails with probability `1/2 > δ = 1/4` for one hypothesis,
  `n = 1` and the fair Bernoulli loss.
- Exact binomial computation for one hypothesis with Bernoulli losses, `1 ≤ n ≤ 40`,
  `R ∈ {0, 1/40, …, 1}`, `β ∈ {0.1, 0.5, 1, 2, 5, 10, 30, 100}` and
  `δ ∈ {0.01, 0.05, 0.1, 0.5, 1}` gives violation probabilities at most `0.975 δ`, attained at
  `n = 1`, `R = 1/40`, `β = 0.1`, `δ = 1`. For `n = 1`, `δ = 1` and `β/8 < R` the violation
  probability is `1 − R`, so no constant below `1` holds for all `β`.

*Needs:* 1.1, 1.2, 2.1.

### 3.2 Catoni's bound for Bernoulli exponential moments

Prove `catoni_bernoulli_bound`: for `β > 0`, with probability at least `1 − δ`, every posterior has
`R(ρ) ≤ (1 − exp(−(β/n) r(ρ) − (KL(ρ‖π) + log(1/δ))/n)) / (1 − exp(−β/n))`
(Catoni, Theorem 1.2.6, p. 11, for losses with values in `{0, 1}`; Alquier, Theorem 3.2, p. 28).
For losses with values in `[0, 1]` it is proved here through 2.2.

Route: 1.2 with `f(θ, S) = β Φ_(β/n)(risk P ℓ θ) − β empiricalRisk ℓ S θ`, whose exponential moment
is at most `1` by 2.2. Then Jensen's inequality for the convex `Φ_(β/n)`
(`ConvexOn.map_integral_le`) gives `β Φ_(β/n)(R(ρ)) − β r(ρ) ≤ KL(ρ‖π) + log(1/δ)`, and
`Φ_(β/n)` is increasing with the inverse of 2.2. When the argument of the inverse exceeds `1` the
right side exceeds `1` and the bound holds trivially.

**Checks.**
- Catoni's example (Lemma 1.1.2, p. 3): one hypothesis, `n = 1000`, `δ = 0.01`, `r = 0.2`,
  `β = 234` gives `R ≤ 0.24016`, the minimum over integer `β`. The bound of 3.1 at the same
  values gives `0.24893`, and its minimum over `β` is `0.2 + √(log 100/2000) = 0.24799`.
- The bound is never weaker than 3.1: Hoeffding's lemma for a Bernoulli law gives
  `Φₐ(p) ≥ p − a/8`, so the inverse satisfies `Φₐ⁻¹(q) ≤ q + a/8` for `q ≤ 1`, and with `a = β/n`
  and `q = r(ρ) + (KL(ρ‖π) + log(1/δ))/β` the right side of 3.2 is at most that of 3.1. A grid of
  `n`, `β`, `r` and `KL` values confirms it.
- Exact binomial computation on the grid of 3.1 gives violation probabilities at most `0.995 δ`.

*Needs:* 1.1, 1.2, 2.2; Mathlib `ConvexOn.map_integral_le`.

### 3.3 The Seeger–Maurer bound

Prove `seeger_maurer_bound`: with probability at least `1 − δ`, every posterior has
`klBin(r(ρ), R(ρ)) ≤ (KL(ρ‖π) + log(2√n/δ))/n` (Maurer, Theorem 5, p. 7, for finite `Z` and `Θ` and
`n ≥ 8`; Alquier, Theorem 3.3, p. 28, for the 0–1 loss). The general measurable `Θ` and `Z` and the
range `1 ≤ n ≤ 7` are proved here.

Route: 1.2 with `f(θ, S) = n · klBin(empiricalRisk ℓ S θ, risk P ℓ θ) − log(2√n)`, whose
exponential moment is at most `1` by 2.3. This `f` is bounded below but not above, so `f(·, S)`
need not be `ρ`-integrable, and where it is not, the Bochner integral in 1.2 is `0` and says
nothing. Apply 1.2 instead to the truncations `min(f, K)`, `K ∈ ℕ`, which have the same
exponential moment bound and are bounded: their exceptional sets increase with `K`, so their union
still has outer measure at most `δ` (`Monotone.measure_iUnion`, which needs no measurability), and
off the union monotone convergence makes `f(·, S)` `ρ`-integrable with
`∫ f dρ ≤ KL(ρ‖π) + log(1/δ)`. Then Jensen's inequality for the jointly convex binary relative
entropy (MathematicalStatisticsNonparametric 1.3, `convexOn_klBin`) applied to the pair
`(empiricalRisk ℓ S θ, risk P ℓ θ)` under `ρ` gives
`n · klBin(r(ρ), R(ρ)) ≤ ∫ n · klBin dρ`. At hypotheses with `risk P ℓ θ ∈ {0, 1}` the loss
`ℓ θ` is almost surely constant, so by Tonelli the set of pairs `(θ, S)` with such a risk and a
different empirical risk is `π ⊗ Pⁿ`-null; off a `Pⁿ`-null set of samples it is therefore
`π`-null, hence `ρ`-null for `ρ ≪ π`, and the pair stays where `klBin` is the true relative
entropy. Jensen's inequality there is used for the convex lower semicontinuous extension of the
relative entropy to `[0, 1]²` (proved here). When `R(ρ) ∈ {0, 1}` and `r(ρ) ≠ R(ρ)` the junk value
is at most `0` and the bound holds.

**Checks.**
- One hypothesis, `n = 1000`, `δ = 0.01`, `r = 0.2`: the bound
  `kl(0.2 ‖ R) ≤ log(2√1000/0.01)/1000 = 0.0087522` gives `R ≤ 0.25623`.
- `n = 1`: for an empirical risk `0` the bound reads `−log(1 − R) ≤ log(2/δ)`, that is
  `R ≤ 1 − δ/2`; it is not vacuous.
- Exact binomial computation for one hypothesis, `1 ≤ n ≤ 40`, `R ∈ {0, 1/40, …, 1}` and
  `δ ∈ {0.01, 0.05, 0.1, 0.3, 0.5, 0.9, 1}`, gives violation probabilities at most `0.562 δ`. For
  the two hypotheses of the last Check of 1.2, `n = 20` and `δ = 0.05`, the larger event
  `{∑ π(θ) exp(n · kl(r(θ) ‖ R(θ))) > 2√n/δ}` is `{K ≤ 3 or K ≥ 17}`, of probability
  `1351/524288 = 0.0026`.
- `n ≥ 1` is needed: for `n = 0` the empirical risk is `0` and the right side is the junk value
  `x/0 = 0`, so with `R(ρ) = 1/2` and `δ < 1` the inequality reads `klBin 0 (1/2) = log 2 ≤ 0` on
  the only sample.

*Needs:* 1.1, 1.2, 2.3; MathematicalStatisticsNonparametric 1.3 (`klBin`, `convexOn_klBin`);
Mathlib `Monotone.measure_iUnion`, `MeasureTheory.lintegral_lintegral_swap`,
`MeasureTheory.Measure.ae_ae_of_ae_prod`.

### 3.4 McAllester's bound

Prove `mcallester_bound`: with probability at least `1 − δ`, every posterior has
`R(ρ) ≤ r(ρ) + √((KL(ρ‖π) + log(2√n/δ))/(2n))`. This is McAllester's bound with Maurer's
constant: Alquier, Theorem 3.1, p. 27, gives McAllester's original constants, and §3.2.3, p. 29,
remarks that Pinsker's inequality applied to Theorem 3.3 recovers it with better constants.

Route: from 3.3 and the binary Pinsker inequality `2(a − b)² ≤ klBin a b` for `a ∈ [0, 1]`,
`b ∈ (0, 1)`, which is Tau Ceti's Pinsker inequality for events
(`TauCeti.two_mul_sq_measureReal_sub_le_klDiv`) for the Bernoulli laws
(`ProbabilityTheory.bernoulliMeasure`) and the event `{true}`, read through
MathematicalStatisticsNonparametric 1.3 (`klDiv_bernoulliMeasure`). When `R(ρ) = 0` the bound is
trivial; when `R(ρ) = 1`, `risk P ℓ θ = 1` for `ρ`-almost every `θ`, and off a null set of samples
(as in 3.3) `r(ρ) = 1`.

**Checks.**
- One hypothesis, `n = 1000`, `δ = 0.01`, `r = 0.2`: the bound is
  `0.2 + √(0.0087522/2) = 0.26615`, weaker than the `0.25623` of 3.3.
- Pinsker: `kl(0.2 ‖ 0.3) = 0.025732 ≥ 2 · 0.1² = 0.02`.
- Exact binomial computation on the grid of 3.3 gives violation probabilities at most `0.4 δ`.

*Needs:* 3.3; MathematicalStatisticsNonparametric 1.3 (`klDiv_bernoulliMeasure`); Tau Ceti
`TauCeti.two_mul_sq_measureReal_sub_le_klDiv`; Mathlib `ProbabilityTheory.bernoulliMeasure`.

### Examples

Catoni's example `n = 1000`, `δ = 0.01`, `r = 0.2` under the four bounds: `0.24799` (3.1 at its
best `β`), `0.24016` (3.2 at `β = 234`), `0.25623` (3.3) and `0.26615` (3.4).

### Dependencies

Layers 1 and 2; MathematicalStatisticsNonparametric 1.3; Tau Ceti
`TauCeti.two_mul_sq_measureReal_sub_le_klDiv`; Mathlib `ConvexOn.map_integral_le`,
`Monotone.measure_iUnion`, `MeasureTheory.lintegral_lintegral_swap`,
`MeasureTheory.Measure.ae_ae_of_ae_prod`, `ProbabilityTheory.bernoulliMeasure`.

## Layer 4: the Gibbs posterior

### 4.1 The Gibbs posterior minimizes the Catoni objective

Define `gibbsPosterior ℓ π β S` as Mathlib's tilted measure
`π.tilted (fun θ ↦ −(β · empiricalRisk ℓ S θ))`, the measure with density
`exp(−β r(θ, S)) / ∫ exp(−β r) dπ` with respect to `π` (Alquier, Definition 2.1 and (2.4),
p. 14). Prove `gibbsPosterior_isLeast`: for `β > 0` and every sample `S`, the Gibbs posterior is a
probability measure with finite relative entropy to `π`; the Catoni objective
`ρ ↦ r(ρ, S) + KL(ρ‖π)/β` takes the value `−log(∫ exp(−β r(θ, S)) dπ(θ))/β` there; and every other
posterior with finite relative entropy has a strictly larger objective (Alquier, Corollary 2.3,
p. 14; Catoni, Lemma 1.1.3, p. 4).

Route: Tau Ceti's change-of-reference identity
(`TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`), for the potential `β · empiricalRisk ℓ S ≥ 0`,
reads `β r(ρ) + KL(ρ‖π) = KL(ρ‖G) − log Z` with `G` the Gibbs posterior and
`Z = ∫ exp(−β r) dπ ∈ (0, 1]`; at `ρ = G` it gives the value and the finiteness of `KL(G‖π)`, and
`KL(ρ‖G) > 0` for `ρ ≠ G` (`InformationTheory.klDiv_eq_zero_iff`) gives strictness.
`MeasureTheory.isProbabilityMeasure_tilted` makes `G` a probability measure.

**Checks.**
- `Θ = {a, b}`, `π` uniform, `r(a) = 0`, `r(b) = 1`, `β = log 3`: `G = (3/4, 1/4)`,
  `KL(G‖π) = (3/4) log(3/2) + (1/4) log(1/2) = 0.13081`, and the objective at `G` is
  `1/4 + 0.13081/log 3 = 0.36907 = −log(2/3)/log 3`. At the point mass at `a` it is
  `log 2/log 3 = 0.63093`, and at `π` it is `1/2`.
- `β > 0` is needed: for `β = 0` the Gibbs posterior is `π`, the objective is `r(ρ)` (the junk
  division by `0` gives `0`), and the point mass at `a` has objective `0 < 1/2`.
- A loss with values in `[0, 1]` (or any bound below on the empirical risk) is needed: for an
  empirical risk with `∫ exp(−β r) dπ = ∞` Mathlib's tilted measure is `0`, not a probability
  measure.
- Random search over 20000 points of the simplex on four hypotheses never goes below the closed
  form.

*Needs:* 1.1; Mathlib `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted`,
`InformationTheory.klDiv_eq_zero_iff`; Tau Ceti `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`.

### 4.2 The oracle inequality in probability

Prove `gibbsPosterior_oracle`: for `β > 0`, with probability at least `1 − δ`, every posterior `ρ`
with finite relative entropy has
`R(G) ≤ R(ρ) + β/(4n) + 2(KL(ρ‖π) + log(2/δ))/β`, where `G = gibbsPosterior ℓ π β S` (Alquier,
Theorem 4.2, p. 35, with `C = 1`).

Route (Alquier, pp. 35–36): 3.1 at `δ/2` applied to `G`, combined with 4.1, bounds `R(G)` by
`r(ρ) + KL(ρ‖π)/β + β/(8n) + log(2/δ)/β` for every `ρ`; the exchanged form of 3.1 at `δ/2` bounds
`r(ρ)` by `R(ρ) + β/(8n) + (KL(ρ‖π) + log(2/δ))/β`; the union of the two exceptional sets has
probability at most `δ`.

**Checks.**
- On a finite `Θ` with uniform `π` and `ρ` a point mass, `KL = log |Θ|`, and the bound reads
  `R(G) ≤ min R + β/(4n) + 2(log |Θ| + log(2/δ))/β`.
- Monte Carlo with up to five hypotheses, using the exact value
  `inf_ρ (R(ρ) + 2 KL(ρ‖π)/β) = −(2/β) log ∑ π(θ) exp(−β R(θ)/2)`, found no violation.
- `n ≥ 1` is needed: with the data of the last Check of 4.3 (`n = 0`, so that the Gibbs
  posterior is `π`) and `β = 40`, `δ = 1/2`, the claim reads `1/2 ≤ 2 log 8/40 = 0.104`, false on
  the only sample. At `β = 4` it reads `1/2 ≤ 2 log 8/4 = 1.04` and holds, so `β` matters here.

*Needs:* 3.1 (both directions), 4.1.

### 4.3 The oracle inequality in expectation

Prove `integral_risk_gibbsPosterior_le`: for `β > 0` and every posterior `ρ` with finite relative
entropy, `∫ R(gibbsPosterior ℓ π β S) dPⁿ(S) ≤ R(ρ) + β/(8n) + KL(ρ‖π)/β` (Alquier, Theorem 4.1,
p. 34, with `C = 1`).

Route: by 2.1 and Tonelli, `E log ∫ exp(β(R − r)) dπ ≤ log E ∫ exp(β(R − r)) dπ ≤ β²/(8n)`
(Jensen for the concave logarithm, `ConcaveOn.le_map_integral`). For each sample, the
Donsker–Varadhan inequality at `ρ = G` bounds `β(R(G) − r(G)) − KL(G‖π)` by the logarithm, so
`E R(G) ≤ E (r(G) + KL(G‖π)/β) + β/(8n)`; by 4.1 the bracket is at most `r(ρ) + KL(ρ‖π)/β`, whose
expectation is `R(ρ) + KL(ρ‖π)/β` by 1.1. The map `S ↦ R(G)` is measurable as a ratio of integrals
of jointly measurable functions.

**Checks.**
- Exact enumeration of all samples for up to four hypotheses, three data values and `n ≤ 6` gives
  `E R(G) ≤ −(1/β) log ∑ π(θ) exp(−β R(θ)) + β/(8n)`, the right side minimized over `ρ`.
- `n ≥ 1` is needed: for `n = 0` the Gibbs posterior is `π`; with `Θ = {a, b}`, `π` uniform,
  risks `0` and `1`, `ρ` the point mass at `a` and `β = 4`, the claim `1/2 ≤ log 2/4 = 0.173`
  fails.

*Needs:* 1.1, 1.2 (its route through Donsker–Varadhan), 2.1, 4.1; Mathlib
`ConcaveOn.le_map_integral`, `MeasureTheory.lintegral_lintegral_swap`; Tau Ceti
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`.

### Examples

The two-point Gibbs posterior of 4.1; finite hypothesis sets with uniform prior, where 4.2 and 4.3
compare the Gibbs posterior with the best single hypothesis at the cost of `log |Θ|`.

### Dependencies

Layers 1, 2 (2.1) and 3 (3.1); Mathlib `MeasureTheory.Measure.tilted`,
`MeasureTheory.isProbabilityMeasure_tilted`, `InformationTheory.klDiv_eq_zero_iff`,
`ConcaveOn.le_map_integral`, `MeasureTheory.lintegral_lintegral_swap`; Tau Ceti
`TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`, `TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: risk and empirical risk of a loss
indexed by hypotheses, the PAC-Bayesian change of measure inequality, the exponential moment bounds
of Layer 2 (Hoeffding's for the empirical mean, Catoni's for Bernoulli laws, Maurer's), Catoni's
two bounds, the Seeger–Maurer and McAllester bounds, the Gibbs posterior with its minimizing
property, and its oracle inequalities in probability and in expectation.

Already in the libraries and therefore not targets:

- the relative entropy `InformationTheory.klDiv` and its vanishing exactly at equality (Mathlib);
- the Donsker–Varadhan variational inequality and formula (Tau Ceti
  `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`);
- the change-of-reference identity for a measure tilted by a nonnegative potential, which is the
  Gibbs variational identity (Tau Ceti `TauCeti/InformationTheory/KullbackLeibler/Tilted.lean`);
  4.1 adds only its reading as a minimization over posteriors, with uniqueness;
- Pinsker's inequality for events (Tau Ceti `TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`);
- Hoeffding's lemma and sums of independent sub-Gaussian variables (Mathlib
  `Mathlib/Probability/Moments/SubGaussian.lean`).

Stated by roadmaps on main and not restated here:

- MathematicalStatisticsNonparametric 1.3 owns the binary relative entropy `klBin`, its
  identification with the relative entropy of Bernoulli laws and its joint convexity; the
  definition is copied verbatim above, and the two facts are consumed.

Other roadmaps:

- StatisticalLearningTheory (an open roadmap, not on main) defines risks of classifiers and of
  bounded losses and proves Rademacher, VC and finite-class bounds; it lists PAC-Bayes bounds as
  outside its scope. This roadmap does not depend on it; its risks here are the plain mean and
  sample mean of a loss indexed by hypotheses, and no statement here is about Rademacher
  complexity, VC dimension or a finite class.
- OnlineConvexOptimization (an open roadmap, not on main), in its 3.2, characterizes the Hedge
  weights as the unique minimizer of an entropy-regularized linear objective on the simplex of a
  finite set. 4.1 is the general form: a minimization over probability measures on an arbitrary
  measurable space with the relative entropy to a prior; that statement is its case of a finite
  set with the uniform prior, after scaling the objective by `β` and subtracting `log |Θ|`. This
  roadmap does not depend on that one.

Outside the scope: bounds with a data-dependent or optimized temperature (unions over grids of
`β`), the localized and relative bounds of Catoni, Bernstein-type and empirical Bernstein PAC-Bayes
bounds, bounds for unbounded or heavy-tailed losses, mutual-information and conditional bounds,
disintegrated bounds for a single draw from the posterior, PAC-Bayes for non-i.i.d. data, and the
choice of priors.

## Exact supplier contracts

### From Mathlib

- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv` (relative
  entropy in `ℝ≥0∞`, infinite off absolute continuity); `InformationTheory.klDiv_eq_zero_iff` (for
  finite measures, `klDiv μ ν = 0` if and only if `μ = ν`).
- `Mathlib/MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted` (`μ.tilted f` has
  density `exp (f x) / ∫ exp f dμ`); `MeasureTheory.isProbabilityMeasure_tilted` (a probability
  measure when `μ ≠ 0` and `exp ∘ f` is integrable).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.pi_pi`, `MeasureTheory.measurePreserving_eval` (each coordinate of
  `Measure.pi` has the law of its factor).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun_pi` (functions of
  distinct coordinates are independent under a product of probability measures).
- `Mathlib/Probability/Moments/SubGaussian.lean`: `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`
  (Hoeffding's lemma: a variable with values in `[a, b]`, centred, has a sub-Gaussian moment
  generating function with parameter `((b − a)/2)²`);
  `ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun` (parameters add over independent
  summands); `ProbabilityTheory.HasSubgaussianMGF.mgf_le` (`mgf X μ t ≤ exp (c t²/2)`).
- `Mathlib/Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure`.
- `Mathlib/MeasureTheory/Measure/Prod.lean`: `Measurable.lintegral_prod_right'` and
  `Measurable.lintegral_prod_left'` (the partial lower integral of a jointly measurable function,
  in the second or the first variable, is measurable);
  `MeasureTheory.lintegral_lintegral_swap` (Tonelli); `MeasureTheory.Measure.ae_ae_of_ae_prod`
  (a property almost everywhere for a product holds almost everywhere in each section, for almost
  every section).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean`: `MeasureTheory.meas_ge_le_lintegral_div`
  (Markov's inequality).
- `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`: `MeasureTheory.exists_measurable_superset`
  (every set has a measurable superset of the same outer measure), used in the conventions.
- `Mathlib/MeasureTheory/Measure/Continuity.lean`: `Monotone.measure_iUnion` (the measure of an
  increasing union of countably many sets, not necessarily measurable, is the supremum of their
  measures).
- `Mathlib/Analysis/Convex/Integral.lean`: `ConvexOn.map_integral_le` and
  `ConcaveOn.le_map_integral` (Jensen's inequality for a continuous convex or concave function on a
  closed convex set). `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `convexOn_exp`.

### From Tau Ceti

- `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`:
  `TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv` (for probability measures `μ`, `ν` and
  `f` with `f` `μ`-integrable and `exp ∘ f` `ν`-integrable,
  `ENNReal.ofReal (∫ f dμ − log ∫ exp f dν) ≤ klDiv μ ν`).
- `TauCeti/InformationTheory/KullbackLeibler/Tilted.lean`:
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log` (for probability measures `μ`, `ν` and an
  `ν`-a.e. measurable `f ≥ 0`,
  `klDiv μ (ν.tilted (−f)) + ENNReal.ofReal (−log ∫ exp (−f) dν) = ∫⁻ ENNReal.ofReal (f x) dμ + klDiv μ ν`).
- `TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`:
  `TauCeti.two_mul_sq_measureReal_sub_le_klDiv` (for probability measures and a measurable set `s`,
  `ENNReal.ofReal (2 (μ.real s − ν.real s)²) ≤ klDiv μ ν`).

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- §1.3, Kullback–Leibler complements: the definition `klBin` (copied verbatim above);
  `klDiv_bernoulliMeasure` (for `a ∈ [0, 1]` and `b ∈ (0, 1)`, `klBin a b` is the relative entropy
  of the Bernoulli law with mean `a` from the one with mean `b`); `convexOn_klBin` (joint convexity
  on `[0, 1] × (0, 1)`).

## References

- Pierre Alquier, *User-friendly introduction to PAC-Bayes bounds*, arXiv:2110.11216, version 5
  (March 2023); published in Foundations and Trends in Machine Learning 17 (2024). Lemma 1.1 (p. 5),
  Theorem 2.1 and Lemma 2.2 (p. 12), Definition 2.1 and Corollary 2.3 (p. 14), Theorems 3.1 (p. 27),
  3.2 and 3.3 (p. 28), the remark of §3.2.3 (p. 29), Theorem 4.1 (p. 34) and Theorem 4.2 with its
  proof (pp. 35–36), page numbers of the arXiv version.
- Olivier Catoni, *PAC-Bayesian supervised classification: the thermodynamics of statistical
  learning*, IMS Lecture Notes Monograph Series 56 (2007), arXiv:0712.0248, version 1. (1.1) (p. 2),
  Lemmas 1.1.1 and 1.1.2 (p. 3), Lemma 1.1.3 and Theorem 1.1.4 (p. 4), Theorem 1.2.6 (p. 11), page
  numbers of the arXiv version.
- Andreas Maurer, *A note on the PAC Bayesian theorem*, arXiv:cs/0411099, version 1 (2004).
  Inequality (1) (p. 1), Theorem 1 (p. 3), Lemma 3 (p. 4), the proof of Theorem 1 (pp. 5–6) and
  Theorem 5 (p. 7).
- Attributions made in prose without a locator: David McAllester (the PAC-Bayesian theorem, 1998
  and 2003); Matthias Seeger (the bound in binary relative entropy, 2002); M. D. Donsker and
  S. R. S. Varadhan (the variational formula); Wassily Hoeffding (1963).

# Roadmap: randomized smoothing, Gaussian certified radii and exact binomial confidence bounds

**Summary.** Develop the mathematics of randomized smoothing, the certification method that
replaces a classifier by the most probable class under Gaussian input noise. The analytic core
is a Gaussian shift inequality: among `[0, 1]`-valued functions with a given Gaussian mean, a
halfspace indicator loses the most mean under a translation. Consequently the probit
`Φ⁻¹` of a Gaussian smoothing is `1/σ`-Lipschitz, and the smoothed classifier is certified on
the ball of radius `(σ/2)(Φ⁻¹(p_A) − Φ⁻¹(p_B))` (Cohen–Rosenfeld–Kolter), a radius that is
sharp. The statistical core is the exact Clopper–Pearson lower confidence bound for a binomial
proportion, its coverage, and its identification with a Beta quantile. Together they give the
guarantee of the Monte Carlo certification procedure: the probability that it returns a
certificate that is false is at most `α`.

## Scope and ownership

This roadmap owns:

- Gaussian smoothing of bounded functions and of classifiers on a finite-dimensional real
  inner product space, and the positivity trichotomy for smoothed probabilities;
- the Gaussian shift inequality, the Lipschitz property of the smoothed probit and of the
  smoothing itself, with sharp constants;
- the certified radius of the smoothed classifier and its sharpness;
- the one-sided Clopper–Pearson bounds: definition, coverage, monotonicity, the Beta-quantile
  form, the closed form at `k = N`, and lower bounds for them from a single tail evaluation;
- the mean-value bounds for `Φ`;
- the Monte Carlo certification procedure and its error guarantee, with and without a
  selection stage.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

The Neyman–Pearson lemma for general laws belongs to
[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md), 6.2, and
general confidence sets to its 1.4. This roadmap needs only the Gaussian shift case, stated
directly. Out of scope: smoothing with non-Gaussian noise and certificates in norms other than
`ℓ²`; Hoeffding-type and other non-exact confidence bounds; the abstaining prediction
procedure and its binomial test; numerical evaluation of `Φ` and `Φ⁻¹`; training with noise;
and deterministic certificates, which belong to the RobustnessCertificates roadmap.

## Conventions

- `E` is a finite-dimensional real inner product space with its Borel σ-algebra, and
  `γ = stdGaussian E`. Noise has standard deviation `σ > 0`, so the noisy input is `x + σ z`
  with `z ∼ γ`.
- `Φ = cdf (gaussianReal 0 1)` (`stdNormalCDF`) and `Φ⁻¹ = (gaussianReal 0 1).quantile`
  (`probit`). Every statement about `Φ⁻¹ p` assumes `p ∈ (0, 1)`. `φ` is the standard Gaussian
  density.

## Exact supplier contracts

From Tau Ceti ([StandardDistributions](../StandardDistributions/README.md), Layers 1, 7 and
13, as implemented):

- `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile.lean`) and its comparison
  lemmas `Measure.quantile_le_iff` and `Measure.lt_quantile_iff`, for `0 < p < 1`, and
  `Measure.quantile_lt_iff`, applied with the continuity and strict monotonicity of `Φ`.
  Together they give, for `p ∈ (0, 1)`: `Φ⁻¹ p ≤ t ↔ p ≤ Φ t`, `t < Φ⁻¹ p ↔ Φ t < p`, and
  `Φ⁻¹ p < t ↔ p < Φ t`.
- `TauCeti.Probability.quantile_gaussianReal` (`Distributions/Gaussian/Quantile.lean`): the
  Gaussian quantile in closed form.
- `TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta`
  (`Distributions/Binomial/Tail.lean`): for `m ≤ n`,
  `Bin(n, p).real {k | m ≤ k} = I_p(m, n - m + 1)`.
- `TauCeti.Probability.cdf_betaMeasure_eq` (`Distributions/Beta/Cdf.lean`): for positive
  parameters, the Beta cdf is the regularized incomplete Beta function.
- `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli` (`Distributions/Binomial/Basic.lean`):
  a sum of independent Bernoulli variables is binomial.

From Mathlib: `gaussianReal`, `cdf`, `stdGaussian` on finite-dimensional real inner product
spaces with `stdGaussian_eq_map_pi_orthonormalBasis`, `ProbabilityTheory.binomial` with the
notation `Bin(n, p)`, `betaMeasure`, `Measure.pi`, `Measure.prod` and Fubini's theorem.

## How to read the build

Each object is defined in the layer that first uses it, with its API and its **Checks**:
three or more discriminating tests that a wrong convention would fail. Each numbered target
ends with its source locator in parentheses, or says that it is proved here, then lists its
Checks and a *Needs:* line naming the targets and suppliers it uses. Each layer ends with its
Examples and Dependencies. `Suggested.lean` states every headline theorem of Layers 1–5 against
the pinned APIs; the Lean name of each declared object or theorem is given at its statement.

## Layer 1: Gaussian smoothing

### 1.1 Smoothing

The **smoothing** of a measurable `f : E → ℝ` with `0 ≤ f ≤ 1` is
`smooth σ f x = ∫ f (x + σ z) dγ(z)` (`smooth`).

- `smooth σ f x ∈ [0, 1]`, and `smooth σ f (x + y) = ∫ f (x + y + σ z) dγ(z)`.
- **Positivity trichotomy.** Exactly one of the following holds: `f = 0` `γ`-almost
  everywhere and `smooth σ f ≡ 0`; `f = 1` `γ`-almost everywhere and `smooth σ f ≡ 1`; or
  `smooth σ f x ∈ (0, 1)` for every `x` (`smooth_trichotomy`). The proof uses that all
  translates of `γ` are mutually absolutely continuous.

(Proved here.)

**Checks.**

- `f ≡ 1/2`: `smooth σ f ≡ 1/2`, in the third case.
- For `E` nontrivial and `f` the indicator of `{0}`: `f = 0` `γ`-almost everywhere, so
  `smooth σ f ≡ 0` although `f ≠ 0`.
- `E` trivial and `f ≡ c`: `smooth σ f = c`, and the three cases are `c = 0`, `c = 1` and
  `c ∈ (0, 1)`.

*Needs:* Mathlib `stdGaussian`.

### 1.2 The Gaussian shift inequality

Let `g : E → ℝ` be measurable with `0 ≤ g ≤ 1`, let `t ∈ ℝ` and `δ ∈ E`.

- **Lower form.** If `Φ t ≤ ∫ g dγ`, then `Φ (t - ‖δ‖) ≤ ∫ g (z + δ) dγ(z)`
  (`stdNormalCDF_sub_norm_le_integral_add`).
- **Upper form.** If `∫ g dγ ≤ Φ t`, then `∫ g (z + δ) dγ(z) ≤ Φ (t + ‖δ‖)`
  (`integral_add_le_stdNormalCDF_add_norm`).
- **Equality.** For `δ ≠ 0` and `u = δ / ‖δ‖`, the indicator of the halfspace
  `{z | ⟪z, u⟫ ≤ t}` has mean `Φ t`, and its translate by `δ` has mean exactly `Φ (t - ‖δ‖)`.
  The analogous halfspace attains the upper form.

For the lower form, put `h = 1[⟪z, u⟫ ≤ t]`, `r(z) = exp(⟪z, δ⟫ - ‖δ‖²/2)`, the density of
`γ` shifted by `δ` with respect to `γ`, and `c = exp(t ‖δ‖ - ‖δ‖²/2)`. Then
`(g - h)(r - c) ≥ 0` pointwise, so `∫ (g - h) r dγ ≥ c ∫ (g - h) dγ ≥ 0`, and
`∫ h r dγ = Φ(t - ‖δ‖)` by reduction to the coordinate along `u`. The upper form is the lower
form for `1 - g` and `-t`.

(Cohen–Rosenfeld–Kolter, arXiv:1902.02918, Lemma 4, pp. 12–13.)

**Checks.**

- The halfspace indicator of `{z | ⟪z, u⟫ ≤ t}` attains the lower form.
- `δ = 0` gives the hypothesis back.
- `g ≡ 1/2`, `t = 0`: the hypothesis holds with equality, and the conclusion
  `Φ(-‖δ‖) ≤ 1/2` is strict for `δ ≠ 0`.

*Needs:* 1.1; Mathlib `stdGaussian_eq_map_pi_orthonormalBasis`, `gaussianReal`, `cdf`.

### 1.3 Lipschitz consequences

- **Probit.** If `smooth σ f x ∈ (0, 1)` for every `x`, then `x ↦ Φ⁻¹ (smooth σ f x)` is
  `σ⁻¹`-Lipschitz (`lipschitzWith_probit_smooth`).
- **Smoothing.** `smooth σ f` is `(σ √(2π))⁻¹`-Lipschitz (`lipschitzWith_smooth`), since `Φ` is
  `(√(2π))⁻¹`-Lipschitz. When `E` is nontrivial this constant is the least one valid for all
  such `f`: it is attained by a halfspace indicator at its boundary.

(Salman et al., arXiv:1906.04584, Lemma 2, Appendix A, p. 13, for the probit with `σ = 1`.
Their Lemma 1, p. 13, gives the weaker constant `√(2/π)/σ` for the smoothing; the sharp
constant is proved here.)

**Checks.**

- On `ℝ`, the indicator of `(-∞, 0]` has `smooth σ f x = Φ(-x/σ)`, whose probit `-x/σ` is
  exactly `σ⁻¹`-Lipschitz.
- The same function has derivative `-(σ √(2π))⁻¹` at `x = 0`, attaining the smoothing constant.
- `f ≡ 1/2` has constant probit `0`.

*Needs:* 1.1, 1.2; `quantile_gaussianReal`, `Measure.quantile_le_iff`.

### Examples

Constant functions and halfspace indicators (1.1–1.3).

### Dependencies

1.1 uses `stdGaussian`; 1.2 uses 1.1 and the orthonormal-basis form of `stdGaussian`; 1.3 uses
1.1, 1.2 and the Gaussian quantile.

## Layer 2: the certified radius

### 2.1 Class probabilities and certification

A **base classifier** is a measurable `C : E → Fin k`. Its **class probabilities** are
`P_c(x) = γ {z | C (x + σ z) = c}` (`classProb σ C c x`), the smoothing of the indicator of
`C ⁻¹' {c}`. The **smoothed classifier** predicts the classes of largest `P_c(x)`. It is
**certified at `x` with class `A` and radius `R`** (`SmoothCertified σ C x A R`) when
`P_c(x + δ) < P_A(x + δ)` for every `c ≠ A` and every `‖δ‖ < R`.

- `Σ_c P_c(x) = 1`, so `P_c(x) ≤ 1 - P_A(x)` for `c ≠ A`.
- Certification is antitone in `R`, and holds for every `R ≤ 0`.

(Proved here.)

**Checks.**

- A constant classifier `C ≡ A`: `P_A ≡ 1` and `P_c ≡ 0` for `c ≠ A`, and `SmoothCertified`
  holds for every `R`.
- For `k = 1` there is no `c ≠ A`, and `SmoothCertified` holds for every `R`.
- At a tie `P_A(x) = P_B(x) = 1/2`, `SmoothCertified σ C x A R` fails for every `R > 0`.

*Needs:* 1.1.

### 2.2 Soundness

Let `C` be a base classifier, `x ∈ E`, `A : Fin k`, and `p̲_A, p̄_B ∈ (0, 1)` with
`p̲_A ≤ P_A(x)` and `P_c(x) ≤ p̄_B` for every `c ≠ A`. Let
`R = (σ / 2) (Φ⁻¹ p̲_A - Φ⁻¹ p̄_B)`.

- **Cohen's theorem.** The smoothed classifier is certified at `x` with class `A` and radius
  `R` (`smoothCertified_of_bounds`). The proof applies the two forms of 1.2 to
  `z ↦ 1[C (x + σ z) = c]` with shift `δ / σ`; no hypothesis that `P_c(x)` lies in `(0, 1)` is
  needed.
- **One-sided form.** If `p̲_A ∈ (1/2, 1)` and `p̲_A ≤ P_A(x)`, take `p̄_B = 1 - p̲_A`. Then the
  radius is `σ Φ⁻¹ p̲_A` (`smoothCertified_of_lower_bound`).

(Cohen–Rosenfeld–Kolter, Theorem 1, p. 4, with the proof on p. 13, and Theorem 1 (binary
case), p. 4; the formulation with `p̲_A, p̄_B ∈ (0, 1)` and without hypotheses on the true
probabilities is proved here.)

**Checks.**

- `p̲_A = p̄_B`: `R = 0`, so nothing is certified.
- `p̲_A = 9/10`, `p̄_B = 1/10`: `R = σ Φ⁻¹(9/10)`, the same as the one-sided radius.
- The halfspace classifiers of 2.4 meet the radius exactly.

*Needs:* 1.2, 2.1; `quantile_gaussianReal`, `Measure.quantile_le_iff`.

### 2.3 Sharpness

Let `E` be nontrivial, `x ∈ E`, `A ≠ B` in `Fin k`, `0 < p_B ≤ p_A < 1`, `p_A + p_B ≤ 1`, and
`k ≥ 2 + ⌈(1 - p_A - p_B) / p_B⌉`. For every `δ` with
`‖δ‖ > (σ / 2) (Φ⁻¹ p_A - Φ⁻¹ p_B)` there is a base classifier `C` with `P_A(x) = p_A`,
`P_B(x) = p_B`, `P_c(x) ≤ p_B` for all `c ≠ A`, and `P_A(x + δ) < P_B(x + δ)`
(`exists_classifier_not_certified`). With `u = δ / ‖δ‖`, the construction assigns `A` to the
halfspace `⟪z - x, u⟫ ≤ σ Φ⁻¹ p_A`, `B` to the halfspace `⟪z - x, u⟫ ≥ -σ Φ⁻¹ p_B`, and splits
the slab between them into parallel slabs of probability at most `p_B`, one for each remaining
class used. Then `P_A(x + δ) = Φ(Φ⁻¹ p_A - ‖δ‖/σ) < Φ(‖δ‖/σ + Φ⁻¹ p_B) = P_B(x + δ)`.

(Cohen–Rosenfeld–Kolter, Theorem 2, p. 4, restated with proof on p. 15; the count of classes
needed is proved here.)

**Checks.**

- `p_A = 3/4`, `p_B = 1/4`: two classes suffice, and `P_B(x + s u) > P_A(x + s u)` for every
  `s > σ Φ⁻¹ (3/4)`, while 2.2 certifies the radius `σ Φ⁻¹ (3/4)`.
- `p_A = 1/2`, `p_B = 1/4`: three classes are needed.
- `p_A = 2/5`, `p_B = 1/10`: seven classes are needed, five of them in the slab.

*Needs:* 1.2, 2.1, 2.2.

### 2.4 Halfspace classifiers

For a unit vector `u`, `b ∈ ℝ` and `C x = A` exactly when `⟪x, u⟫ ≤ b`, with a second class
elsewhere, `P_A(x) = Φ ((b - ⟪x, u⟫) / σ)`. So when `⟪x, u⟫ < b` the one-sided radius of 2.2
with the exact `p̲_A = P_A(x)` equals the distance `b - ⟪x, u⟫` from `x` to the decision
boundary, and it is the exact certified radius.

(Cohen–Rosenfeld–Kolter, Propositions 3–5, pp. 17–19.)

**Checks.**

- For `E = EuclideanSpace ℝ (Fin 1)` and `C x = A` exactly when `x 0 ≤ 0`, the certified
  radius at `x` with `x 0 < 0` is `-x 0` for every `σ`.
- `P_A(x) = 1/2` on the boundary, where no radius is certified.
- Reflecting `u` and `b` swaps the two classes and leaves the radius unchanged.

*Needs:* 2.2, 2.3.

### Examples

Constant and halfspace classifiers (2.1, 2.4), and the slab construction of 2.3.

### Dependencies

2.1 uses 1.1; 2.2 uses 1.2 and 2.1; 2.3 uses 1.2, 2.1 and 2.2; 2.4 uses 2.2 and 2.3.

## Layer 3: exact binomial confidence bounds

### 3.1 Tails and the Clopper–Pearson bound

For `q ∈ unitInterval`, the **tail** is `tail N k q = Bin(N, q).real {m | k ≤ m}` (`tail`). For
`0 ≤ α`, the **Clopper–Pearson lower bound** is
`cpLower α N k = sSup {q ∈ [0, 1] | tail N k q ≤ α}` (`cpLower`), with `sSup ∅ = 0`.

- For `1 ≤ k ≤ N`, `q ↦ tail N k q` is continuous and strictly increasing on `[0, 1]`, from `0`
  to `1`.
- `k ↦ tail N k q` is antitone, and so `k ↦ cpLower α N k` is monotone (`monotone_cpLower`).

(Proved here.)

**Checks.**

- `tail N 1 q = 1 - (1 - q)^N`, `tail N 0 q = 1`, and `tail N k q = 0` for `k > N`.
- `cpLower α N 0 = 0` for `α < 1`, and `cpLower 1 N 0 = 1`.
- `cpLower α N k = 1` for `k > N`, and `tail 2 1 (1/2) = 3/4`, `tail 2 2 (1/2) = 1/4`.

*Needs:* Mathlib `ProbabilityTheory.binomial`.

### 3.2 Coverage

For `0 ≤ α` and every `p ∈ unitInterval`,

`Bin(N, p).real {k | p < cpLower α N k} ≤ α` (`binomial_real_lt_cpLower_le`).

The proof shows that `{k | p < cpLower α N k}` is an upper set `{k | k₀ ≤ k}` with
`tail N k₀ p ≤ α`.

(Proved here. `cpLower` is the lower end of the exact interval of Clopper and Pearson, Biometrika
**26** (1934), 404–413, as used by Cohen–Rosenfeld–Kolter, Appendix, p. 22.)

**Checks.**

- `N = 1`, `α < 1`: `cpLower α 1 1 = α`, and the coverage event has probability
  `p · 1[p < α] ≤ α`.
- `α = 0`: `cpLower 0 N k = 0` for `k ≤ N`, so the event is `{k | N < k}` when `p < 1` and
  empty when `p = 1`; its probability is `0`.
- `α = 1`: `cpLower 1 N k = 1` for every `k`, and the event has probability `1[p < 1] ≤ 1`.

*Needs:* 3.1.

### 3.3 Closed forms

- **Beta quantile.** For `1 ≤ k ≤ N` and `0 < α < 1`,
  `cpLower α N k = (betaMeasure k (N - k + 1)).quantile α`
  (`cpLower_eq_quantile_betaMeasure`), and `tail N k (cpLower α N k) = α`.
- **All successes.** For `1 ≤ N` and `0 ≤ α ≤ 1`, `cpLower α N N = α ^ (1 / N)`
  (`cpLower_self`). Hence `cpLower α N k ≤ α ^ (1 / N)` for all `k ≤ N`, and
  `cpLower α N k < 1` when also `α < 1`.
- **Upper bound.** The upper Clopper–Pearson bound, one minus `cpLower α N (N - k)`, is at least
  `p` except on an event of `Bin(N, p)`-probability at most `α`: the exceptional event is
  `{1 - p < cpLower α N (N - K)}` with `N - K ∼ Bin(N, 1 - p)`, which 3.2 bounds.

(Proved here, the Beta form from the binomial tail identity and the Beta cdf.)

**Checks.**

- `N = k = 1`: `Beta(1, 1)` is uniform, and `cpLower α 1 1 = α = α^(1/1)`.
- `cpLower (1/20) 10 10 = (1/20)^(1/10) ≈ 0.7411`.
- After `0` successes in `N` trials the upper bound is `1 - α^(1/N)`.

*Needs:* 3.1, 3.2; `binomial_tail_eq_regularizedIncompleteBeta`, `cdf_betaMeasure_eq`.

### 3.4 Lower bounds from one tail evaluation

- For `q ∈ [0, 1]`, `tail N k q = Σ_{m = k}^{N} (N choose m) q^m (1 - q)^(N - m)`.
- If `q ∈ [0, 1]` and `tail N k q ≤ α`, then `q ≤ cpLower α N k`.

(Proved here.)

**Checks.**

- `tail 2 2 (1/2) = 1/4 ≤ 1/4` gives `1/2 ≤ cpLower (1/4) 2 2 = 1/2`, with equality.
- `tail 3 3 (1/2) = 1/8`.
- `tail 2 1 (1/2) = 3/4 > 1/2`, and indeed `cpLower (1/2) 2 1 = 1 - 1/√2 < 1/2`.

*Needs:* 3.1.

### Examples

Small binomial tails (3.1, 3.4) and the all-successes bound (3.3).

### Dependencies

3.1 uses the binomial law; 3.2 and 3.4 use 3.1; 3.3 uses 3.1, 3.2, the binomial tail identity
and the Beta cdf.

## Layer 4: mean-value bounds for the Gaussian cdf

### 4.1 Mean-value bounds

For `0 ≤ a ≤ b`, `(b - a) φ(b) ≤ Φ b - Φ a ≤ (b - a) φ(a)`, since `φ` is decreasing on
`[0, ∞)`. Hence, with `Φ 0 = 1/2`, for `0 = a₀ ≤ a₁ ≤ … ≤ a_n` and `p ∈ (0, 1)`: if
`p ≤ 1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_i)` then `Φ⁻¹ p ≤ a_n`, and if
`1/2 + Σ_{i=1}^{n} (a_i - a_{i-1}) φ(a_{i-1}) < p` then `a_n < Φ⁻¹ p`.

(Proved here.)

**Checks.**

- `a = b`: both sides are `0`.
- `a = 0`, `b = 1`: `0.242 ≈ φ(1) ≤ Φ 1 - 1/2 ≈ 0.341 ≤ φ(0) ≈ 0.399`.
- `Φ 0 = 1/2`, so `Φ⁻¹ (1/2) = 0`, and `Φ 0 < 3/4` gives `0 < Φ⁻¹ (3/4)`.
- `p = 7/10`, grid `0, 1`: `1/2 + φ(1) ≈ 0.742 ≥ p` gives `Φ⁻¹ p ≤ 1`; `p = 19/20`:
  `1/2 + φ(0) ≈ 0.899 < p` gives `1 < Φ⁻¹ p ≈ 1.645`.

*Needs:* Mathlib `gaussianReal`, `cdf`; `Measure.quantile_le_iff`, `Measure.lt_quantile_iff`.

### Examples

The unit interval `[0, 1]` (4.1).

### Dependencies

4.1 uses only the Gaussian cdf and density and the quantile comparison lemmas.

## Layer 5: Monte Carlo certification

### 5.1 The estimation stage

Fix a base classifier `C`, `x ∈ E`, a class `A`, `N ∈ ℕ` and `α ∈ [0, 1)`. For a sample
`ω : Fin N → E` with law `Measure.pi (fun _ => γ)`, the **hit count** is
`K(ω) = #{i | C (x + σ ω i) = A}` (`hitCount σ C x A ω`).

- `K` has law `Bin(N, P_A(x))`.
- Let `p̲(ω) = cpLower α N (K ω)`. The **failure event** is the set of `ω` with `1/2 < p̲(ω)`
  for which the smoothed classifier is not certified at `x` with class `A` and radius
  `σ Φ⁻¹ p̲(ω)`. It is measurable and has probability at most `α` (`certify_failure_le`). The
  proof combines 3.2 with the one-sided form of 2.2.

(Cohen–Rosenfeld–Kolter, the CERTIFY pseudocode and Proposition 2, p. 6, with the proof on
p. 23.)

**Checks.**

- `N = 0`: `K = 0`, `p̲ = 0`, and nothing is ever certified.
- `C ≡ A` and `N ≥ 1`: `K = N` almost surely, `p̲ = α^(1/N)`, and the certificate is true.
- `α = 0`: `p̲ = 0` for every sample with `K ≤ N`, and the failure event is empty.

*Needs:* 2.2, 3.2, 3.3; `iIndepFun.hasLaw_sum_bernoulli`.

### 5.2 Selection

Let `N₀`, `N` be sample sizes, and let `s : (Fin N₀ → E) → Fin k` be measurable. Draw
`(ω₀, ω)` from the product of `Measure.pi (fun _ => γ)` on both factors, put `A = s ω₀`, and
run 5.1 with this `A`. The probability of the failure event is still at most `α`
(`certify_failure_le_of_selection`). The proof conditions on `ω₀` by Fubini.

(Cohen–Rosenfeld–Kolter, the CERTIFY pseudocode and Proposition 2, p. 6, with the proof on
p. 23, which draws the selection sample separately.)

**Checks.**

- A constant selection rule `s` reduces 5.2 to 5.1.
- `N₀ = 0` forces `s` to be constant.
- Independence of the two samples is needed: for `N = 1`, `α = 3/4`, the class
  `A = C (x + σ ω 0)` read from the estimation sample, and a two-class halfspace classifier
  with `x` on its boundary, `K = 1` and `p̲ = 3/4` always, so the radius `σ Φ⁻¹ (3/4)` is always
  returned while `P_A(x) = 1/2`: the failure event has probability `1 > 3/4`.

*Needs:* 5.1; Mathlib `Measure.prod` and Fubini.

### 5.3 Limits of the procedure

Let `N ≥ 1` and `0 < α < 1`. Every radius returned by 5.1 is at most `σ Φ⁻¹ (α ^ (1 / N))`, by
3.3; none is returned when `α ^ (1 / N) ≤ 1/2`.

(Cohen–Rosenfeld–Kolter, Section 3.2.2, p. 6; the bound is proved here.)

**Checks.**

- `N = 1`, `α = 3/4`: `α ^ (1 / N) = 3/4 > 1/2`, and the largest radius is `σ Φ⁻¹ (3/4)`.
- `N = 1`, `α = 1/2`: no radius is returned.
- `N = 100 000`, `α = 1/1000`: `Φ⁻¹ ((1/1000) ^ (1/100000)) ≈ 3.81`, so no radius above about
  `3.81 σ` is ever certified.

*Needs:* 3.3, 5.1; `Measure.quantile_le_iff`.

### Examples

Constant classifiers and constant selection rules (5.1, 5.2), and the sample sizes of 5.3.

### Dependencies

5.1 uses 2.2, 3.2, 3.3 and the Bernoulli-sum law; 5.2 uses 5.1 and Fubini; 5.3 uses 3.3 and
5.1.

## Downstream consumers

None at present.

## Provenance

A formalization of much of Layers 1–5, on `EuclideanSpace ℝ (Fin (n + 1))`, is in
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir), in the files
`LeanMlir/Proofs/Certificates/Smoothing/Gaussian.lean` (the Gaussian shift inequality, the
`1/σ`-Lipschitz probit and Cohen's radius), `Smoothing/CP.lean` (binomial tails, the
Clopper–Pearson bound, its coverage, the law of the hit count), `Smoothing/PhiBounds.lean`
(bounds for `Φ` and `Φ⁻¹`), `Smoothing/MC.lean` and `GaussianQuantile.lean` (a standalone
`Φ⁻¹`). It is BSD-3 licensed, and its author contributed this roadmap. There the certificates
are applied to trained MNIST and CIFAR-10 networks. The roadmap restates them over general inner
product spaces and Tau Ceti's quantile, adds sharpness, the Beta form and the selection stage;
the source is reference material, not the specification.

## References

- J. Cohen, E. Rosenfeld and J. Z. Kolter, *Certified adversarial robustness via randomized
  smoothing*, ICML 2019, arXiv:1902.02918.
- H. Salman et al., *Provably robust deep learning via adversarially trained smoothed
  classifiers*, NeurIPS 2019, arXiv:1906.04584.
- C. J. Clopper and E. S. Pearson, *The use of confidence or fiducial limits illustrated in the
  case of the binomial*, Biometrika **26** (1934), 404–413.

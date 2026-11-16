# Randomized smoothing: Gaussian certified radii and exact binomial confidence bounds

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
  inner product space, and the positivity dichotomy for smoothed probabilities;
- the Gaussian shift inequality, the Lipschitz property of the smoothed probit and of the
  smoothing itself, with sharp constants;
- the certified radius of the smoothed classifier and its sharpness;
- the one-sided Clopper–Pearson bounds: definition, coverage, monotonicity, the Beta-quantile
  form, the closed form at `k = N`, and rational certificates for them;
- rational bounds for `Φ` and `Φ⁻¹` sufficient to state certified radii as rational numbers;
- the Monte Carlo certification procedure and its error guarantee.

It consumes, and does not re-prove:

- [StandardDistributions](../StandardDistributions/README.md), as implemented in Tau Ceti: the
  quantile `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile`), the Gaussian
  quantile `TauCeti.Probability.quantile_gaussianReal`, the binomial tail identity
  `TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta`, the Beta cdf
  `TauCeti.Probability.cdf_betaMeasure_eq`, and the law of a sum of independent Bernoulli
  variables `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli`;
- Mathlib: `gaussianReal`, `cdf`, `stdGaussian` on finite-dimensional real inner product
  spaces with `stdGaussian_eq_map_pi_orthonormalBasis`, `ProbabilityTheory.binomial` with the
  notation `Bin(n, p)`, `betaMeasure`, and `Measure.pi`.

The Neyman–Pearson lemma for general laws belongs to
[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md), 6.2, and
general confidence sets to its 1.4. This roadmap needs only the Gaussian shift case, stated
directly. Out of scope: smoothing with non-Gaussian noise and certificates in norms other than
`ℓ²`; Hoeffding-type and other non-exact confidence bounds; the abstaining prediction
procedure and its binomial test; training with noise; and deterministic certificates, which
belong to [RobustnessCertificates](../RobustnessCertificates/README.md).

## Conventions

- `E` is a finite-dimensional real inner product space with its Borel σ-algebra, and
  `γ = stdGaussian E`. Noise has standard deviation `σ > 0`, so the noisy input is `x + σ z`
  with `z ∼ γ`.
- `Φ = cdf (gaussianReal 0 1)` and `Φ⁻¹ = (gaussianReal 0 1).quantile`. Every statement about
  `Φ⁻¹ p` assumes `p ∈ (0, 1)`.
- The **smoothing** of a measurable `f : E → ℝ` with `0 ≤ f ≤ 1` is
  `smooth σ f x = ∫ f (x + σ z) dγ(z)`.
- A **base classifier** is a measurable `C : E → Fin k`. Its **class probabilities** are
  `P_c(x) = γ {z | C (x + σ z) = c}`, the smoothing of the indicator of `C ⁻¹' {c}`. The
  **smoothed classifier** predicts the classes of largest `P_c(x)`.
- The smoothed classifier is **certified at `x` with class `A` and radius `R`** when
  `P_c(x + δ) < P_A(x + δ)` for every `c ≠ A` and every `‖δ‖ < R`.
- `Bin(N, q)` for `q ∈ unitInterval` is the binomial law on `ℕ`, and the **tail** is
  `tail N k q = Bin(N, q).real {m | k ≤ m}`.
- For `0 ≤ α`, the **Clopper–Pearson lower bound** is
  `cpLower α N k = sSup {q ∈ [0, 1] | tail N k q ≤ α}`, with `sSup ∅ = 0`; in particular
  `cpLower α N 0 = 0` for `α < 1`.

## Layer 1: Gaussian smoothing

### 1.1 Smoothing

- `smooth σ f x ∈ [0, 1]`, and `smooth σ f (x + y) = ∫ f (x + y + σ z) dγ(z)`.
- For a base classifier, `Σ_c P_c(x) = 1`, so `P_c(x) ≤ 1 - P_A(x)` for `c ≠ A`.
- **Positivity dichotomy.** Exactly one of the following holds: `f = 0` `γ`-almost everywhere
  and `smooth σ f ≡ 0`; `f = 1` `γ`-almost everywhere and `smooth σ f ≡ 1`; or
  `smooth σ f x ∈ (0, 1)` for every `x`. The proof uses that all translates of `γ` are
  mutually absolutely continuous.

### 1.2 The Gaussian shift inequality

Let `g : E → ℝ` be measurable with `0 ≤ g ≤ 1`, let `t ∈ ℝ` and `δ ∈ E`.

- **Lower form.** If `Φ t ≤ ∫ g dγ`, then `Φ (t - ‖δ‖) ≤ ∫ g (z + δ) dγ(z)`.
- **Upper form.** If `∫ g dγ ≤ Φ t`, then `∫ g (z + δ) dγ(z) ≤ Φ (t + ‖δ‖)`.
- **Equality.** For `δ ≠ 0` and `u = δ / ‖δ‖`, the indicator of the halfspace
  `{z | ⟪z, u⟫ ≤ t}` has mean `Φ t`, and its translate by `δ` has mean exactly `Φ (t - ‖δ‖)`.
  The analogous halfspace attains the upper form.

The lower form is the Neyman–Pearson lemma for the pair `γ` and `γ` shifted by `δ`, whose
likelihood ratio is monotone in `⟪z, δ⟫`. It reduces to one dimension along an orthonormal
basis whose first vector is `u`.

### 1.3 Lipschitz consequences

- **Probit.** If `smooth σ f x ∈ (0, 1)` for every `x`, then `x ↦ Φ⁻¹ (smooth σ f x)` is
  `σ⁻¹`-Lipschitz.
- **Smoothing.** `smooth σ f` is `(σ √(2π))⁻¹`-Lipschitz, since `Φ` is `(√(2π))⁻¹`-Lipschitz.
  When `E` is nontrivial this constant is the least one valid for all such `f`: it is attained
  by a halfspace indicator at its boundary.

## Layer 2: the certified radius

### 2.1 Soundness

Let `C` be a base classifier, `x ∈ E`, `A : Fin k`, and `p̲_A, p̄_B ∈ (0, 1)` with
`p̲_A ≤ P_A(x)` and `P_c(x) ≤ p̄_B` for every `c ≠ A`. Let
`R = (σ / 2) (Φ⁻¹ p̲_A - Φ⁻¹ p̄_B)`.

- **Cohen's theorem.** The smoothed classifier is certified at `x` with class `A` and
  radius `R`. The proof applies the two forms of 1.2 to `z ↦ 1[C (x + σ z) = c]` with shift
  `δ / σ`; no hypothesis that `P_c(x)` lies in `(0, 1)` is needed.
- **One-sided form.** If `p̲_A ∈ (1/2, 1)` and `p̲_A ≤ P_A(x)`, take `p̄_B = 1 - p̲_A`. Then the
  radius is `σ Φ⁻¹ p̲_A`.

### 2.2 Sharpness

Let `E` be nontrivial, `0 < p_B ≤ p_A < 1`, `p_A + p_B ≤ 1`, and
`k ≥ 2 + ⌈(1 - p_A - p_B) / p_B⌉`. For every `r > (σ / 2) (Φ⁻¹ p_A - Φ⁻¹ p_B)` there are a
base classifier `C` and `δ` with `‖δ‖ < r` such that `P_A(x) = p_A`, `P_B(x) = p_B`, `P_c(x) ≤ p_B` for all
`c ≠ A`, and `P_A(x + δ) < P_B(x + δ)`. The construction assigns `A` and `B` to two parallel
halfspaces, and splits the slab between them into parallel slabs of probability at most `p_B`,
one for each remaining class used.

### 2.3 Halfspace classifiers

For a unit vector `u`, `b ∈ ℝ` and `C x = A` exactly when `⟪x, u⟫ ≤ b`, with a second class
elsewhere, `P_A(x) = Φ ((b - ⟪x, u⟫) / σ)`. So when `⟪x, u⟫ < b` the one-sided radius of 2.1
with the exact `p̲_A = P_A(x)` equals the distance `b - ⟪x, u⟫` from `x` to the decision
boundary, and it is the exact certified radius.

## Layer 3: exact binomial confidence bounds

### 3.1 Monotonicity

- For `1 ≤ k ≤ N`, `q ↦ tail N k q` is continuous and strictly increasing on `[0, 1]`, from `0`
  to `1`.
- `k ↦ tail N k q` is antitone, and so `k ↦ cpLower α N k` is monotone.

### 3.2 Coverage

For `0 ≤ α` and every `p ∈ unitInterval`,

`Bin(N, p).real {k | p < cpLower α N k} ≤ α`.

The proof shows that `{k | p < cpLower α N k}` is an upper set `{k | k₀ ≤ k}` with
`tail N k₀ p ≤ α`.

### 3.3 Closed forms

- **Beta quantile.** For `1 ≤ k ≤ N` and `0 < α < 1`,
  `cpLower α N k = (betaMeasure k (N - k + 1)).quantile α`, and `tail N k (cpLower α N k) = α`.
- **All successes.** For `1 ≤ N` and `0 ≤ α ≤ 1`, `cpLower α N N = α ^ (1 / N)`. Hence
  `cpLower α N k ≤ α ^ (1 / N)` for all `k ≤ N`, and `cpLower α N k < 1` when also `α < 1`.
  For `k > N` the tail vanishes and `cpLower α N k = 1`.
- **Upper bound.** The upper bound `cpUpper α N k = 1 - cpLower α N (N - k)` satisfies
  `Bin(N, p).real {k | cpUpper α N k < p} ≤ α`.

### 3.4 Rational certificates

- For rational `q ∈ [0, 1]`, `tail N k q` is the rational number
  `Σ_{m = k}^{N} (N choose m) q^m (1 - q)^(N - m)`.
- If `q ∈ [0, 1]` and `tail N k q ≤ α`, then `q ≤ cpLower α N k`. Give a decidable check of
  `tail N k q ≤ α` for rational `q` and `α`, by exact natural-number arithmetic on a common
  denominator, and prove it sound.

## Layer 4: rational bounds for the probit

- For `0 ≤ a ≤ b`, `Φ b - Φ a ≤ (b - a) φ(a)`, where `φ` is the standard Gaussian density.
- For rational `a`, the partial sums of the exponential series give rational lower bounds for
  `exp (a² / 2)`, hence rational upper bounds for `φ(a)`. With `Φ 0 = 1/2` and the previous
  item, every grid `0 = a₀ < a₁ < ⋯ < a_m` gives a rational upper bound for `Φ a_m`.
- Symmetrically, `(b - a) φ(b) ≤ Φ b - Φ a` for `0 ≤ a ≤ b`, and rational upper bounds for
  `exp (a² / 2)` from Taylor's theorem with remainder give rational lower bounds for `Φ a_m`.
- For `p ∈ (0, 1)`: `Φ t ≤ p` implies `t ≤ Φ⁻¹ p`, `Φ t < p` implies `t < Φ⁻¹ p`, and
  `p ≤ Φ t` implies `Φ⁻¹ p ≤ t`, `p < Φ t` implies `Φ⁻¹ p < t`.
- Hence a rational `t` and a rational upper bound `U` with `Φ t ≤ U ≤ p̲` certify the radius
  `σ t ≤ σ Φ⁻¹ p̲`.

## Layer 5: Monte Carlo certification

### 5.1 The estimation stage

Fix a base classifier `C`, `x ∈ E`, a class `A`, `N ∈ ℕ` and `α ∈ [0, 1)`. For a sample
`ω : Fin N → E` with law `Measure.pi (fun _ => γ)`, let `K(ω) = #{i | C (x + σ ω i) = A}`.

- `K` has law `Bin(N, P_A(x))`.
- Let `p̲(ω) = cpLower α N (K ω)`. The **failure event** is the set of `ω` with `1/2 < p̲(ω)`
  for which the smoothed classifier is not certified at `x` with class `A` and radius
  `σ Φ⁻¹ p̲(ω)`. It is measurable and has probability at most `α`. The proof combines 3.2 with
  the one-sided form of 2.1.

### 5.2 Selection

Let `N₀`, `N` be sample sizes, and let `s : (Fin N₀ → E) → Fin k` be measurable. Draw
`(ω₀, ω)` from the product of `Measure.pi (fun _ => γ)` on both factors, put `A = s ω₀`, and
run 5.1 with this `A`. The probability of the failure event is still at most `α`. The proof
conditions on `ω₀` by Fubini.

### 5.3 Limits of the procedure

With `N` samples and level `α`, every radius returned by 5.1 is at most `σ Φ⁻¹ (α ^ (1 / N))`,
by 3.3.

## Layer 6: checks

- **Clopper–Pearson.** `cpLower (1/20) 10 10 = (1/20) ^ (1/10)`, and `cpLower α N 0 = 0`.
- **Maximal radii.** Prove the rational enclosures
  `0.646 < Φ⁻¹ ((1/20) ^ (1/10)) < 0.647`, `1.5 < Φ⁻¹ ((1/1000) ^ (1/100)) < 1.501`, and
  `3.81 < Φ⁻¹ ((1/1000) ^ (1/100000)) < 3.82`. So with `100 000` samples at `α = 0.001` no
  radius above `3.82 σ` is ever certified.
- **Halfspaces.** For `E = EuclideanSpace ℝ (Fin 1)` and `C x = A` exactly when `x 0 ≤ 0`, the
  certified radius at `x` with `x 0 < 0` is `-x 0` for every `σ`.
- **Sharpness.** For `p_A = 3/4`, `p_B = 1/4` and two classes, the halfspace pair of 2.2 with
  normal `u` has `P_B(x + s u) > P_A(x + s u)` for every `s > σ Φ⁻¹ (3/4)`, while 2.1 certifies
  the radius `σ Φ⁻¹ (3/4)`.

## Dependencies and order

Layer 1 uses Mathlib's `stdGaussian` and the Gaussian quantile. Layer 2 uses Layer 1. Layer 3
uses the binomial tail identity and the Beta cdf, and is independent of Layers 1 and 2. Layer 4
uses only the Gaussian cdf. Layer 5 uses Layers 2 and 3 and the Bernoulli-sum law. Layer 6 uses
all of them.

## Provenance

A formalization of much of Layers 1–5, on `EuclideanSpace ℝ (Fin (n + 1))`, is in
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir), in the files
`LeanMlir/Proofs/Certificates/Smoothing/Gaussian.lean` (the Gaussian shift inequality, the
`1/σ`-Lipschitz probit and Cohen's radius), `Smoothing/CP.lean` (binomial tails, the
Clopper–Pearson bound, its coverage, the law of the hit count, and kernel-checked tails),
`Smoothing/PhiBounds.lean` (rational bounds for `Φ` and `Φ⁻¹`), `Smoothing/MC.lean` and
`GaussianQuantile.lean` (a standalone `Φ⁻¹`). It is BSD-3 licensed, and its author contributed
this roadmap. There the certificates are applied to trained MNIST and CIFAR-10 networks. The
roadmap restates them over general inner product spaces and Tau Ceti's quantile, adds
sharpness, the Beta form and the selection stage; the source is reference material, not the
specification.

## References

- J. Cohen, E. Rosenfeld and J. Z. Kolter, *Certified adversarial robustness via randomized
  smoothing*, ICML 2019, arXiv:1902.02918.
- M. Lecuyer, V. Atlidakis, R. Geambasu, D. Hsu and S. Jana, *Certified robustness to
  adversarial examples with differential privacy*, IEEE S&P 2019, arXiv:1802.03471.
- H. Salman et al., *Provably robust deep learning via adversarially trained smoothed
  classifiers*, NeurIPS 2019, arXiv:1906.04584.
- C. J. Clopper and E. S. Pearson, *The use of confidence or fiducial limits illustrated in the
  case of the binomial*, Biometrika **26** (1934), 404–413.
- E. L. Lehmann and J. P. Romano, *Testing Statistical Hypotheses*, 3rd ed., Springer, 2005,
  Chapter 3.

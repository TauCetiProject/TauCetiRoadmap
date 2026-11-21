# Roadmap: Rényi divergence and Rényi differential privacy

**Summary.** This roadmap develops the Rényi divergence `D_α(P ‖ Q)` between probability
measures on an arbitrary measurable space, for the orders `α ∈ (0, 1) ∪ (1, ∞)`, and the privacy
notion built on it. The divergence is `log ∫ p^α q^(1-α) dμ / (α - 1)` for densities `p`, `q`
with respect to a measure dominating both laws, with values in `[0, ∞]` and natural logarithms;
it is `∞` when `α > 1` and `P` is not absolutely continuous with respect to `Q`.

The headline theorems are these.

- *Order and the Kullback–Leibler limit.* For probability measures `P`, `Q`, the map
  `α ↦ D_α(P ‖ Q)` is nondecreasing on `(0, 1) ∪ (1, ∞)`. As `α` increases to `1` it tends to the
  Kullback–Leibler divergence `KL(P ‖ Q)`, finite or not; as `α` decreases to `1` it tends to
  `KL(P ‖ Q)` provided that `KL(P ‖ Q) = ∞` or some order `β > 1` has `D_β(P ‖ Q) < ∞`.
- *Structure.* `D_α(P ‖ Q) = 0` exactly when `P = Q`; for `α < 1` it is `∞` exactly when `P` and
  `Q` are mutually singular. A Markov kernel does not increase it, it is additive over products
  of probability measures, and for Gaussian laws with a common variance `v > 0`,
  `D_α(N(m₀, v) ‖ N(m₁, v)) = α (m₀ - m₁)² / (2 v)`.
- *Composition.* For Markov kernels `κ`, `η` from a countable space, or into a countably
  generated one, if `D_α(κ x ‖ η x) ≤ c` for every `x`, then
  `D_α(μ ⊗ κ ‖ ν ⊗ η) ≤ D_α(μ ‖ ν) + c` for the joint laws. Consequently, for `α > 1`, if a
  mechanism `M` is `(α, ε₁)`-Rényi differentially private and a second release, chosen after
  seeing the first, is `(α, ε₂)`-private for each first output, the pair is
  `(α, ε₁ + ε₂)`-private, under the same countability condition on the two output spaces; and
  adding `N(0, v)` noise to each coordinate of a query of Euclidean sensitivity `Δ` is
  `(α, α Δ² / (2 v))`-private for every `α > 1`.
- *Conversion.* If `α > 1`, `D_α(P ‖ Q) ≤ ρ` with `ρ ≥ 0` real and `δ > 0`, then
  `P(A) ≤ exp(ρ + log(1/δ) / (α - 1)) Q(A) + δ` for every event `A`.

The roadmap builds on Mathlib's Kullback–Leibler divergence, Radon–Nikodym derivatives,
composition-products with Markov kernels and Gaussian laws. The orders `1/2` and `2` are, in
disguise, the Hellinger affinity and the chi-squared divergence of
MathematicalStatisticsNonparametric, which are compared here and not restated.

Layer 1 below defines the Hellinger integral and the Rényi divergence, settles the degenerate
pairs and computes the Gaussian case. Layer 2 proves the limits at order `1` and monotonicity in
the order; Layer 3 data processing, additivity and the chain bound. Layer 4 defines Rényi
differential privacy for an arbitrary adjacency relation and proves conversion, adaptive
composition and the Gaussian curve.

## Conventions

- **Measures.** `P`, `Q`, `μ`, `ν` are probability measures (`IsProbabilityMeasure`) on a
  measurable space; kernels are Markov kernels (`ProbabilityTheory.Kernel` with `IsMarkovKernel`).
  The composition of a measure with a kernel is `κ ∘ₘ P` (Mathlib's `Measure.bind`) and the joint
  law is `P ⊗ₘ κ` (`Measure.compProd`). Measures of total mass other than `1` are not in scope: the
  definitions below accept them, but no statement is made about them.
- **Orders.** An order is a real number `α` with `0 < α` and `α ≠ 1` (a *simple order* in van
  Erven–Harremoës). At `α = 1` and at `α ≤ 0` the definitions below are total but meaningless:
  at `α = 1` the formula divides by `α - 1 = 0` and returns `0`, and at `α = 0` it returns `0`
  for every pair because `x ^ 0 = 1` in `ℝ≥0∞`, including `x = 0` (this is Rényi's original order
  `0`, not the order `0` of van Erven–Harremoës). Every statement carries `0 < α` and `α ≠ 1`, or
  a stronger hypothesis, except the two limits of 2.1, which concern orders near `1` only. The Kullback–Leibler divergence enters only as Mathlib's
  `InformationTheory.klDiv` and only through limits.
- **Powers and densities.** Densities are Mathlib's `Measure.rnDeriv`, with values in `ℝ≥0∞`, and
  powers are `ℝ≥0∞`-valued real powers. Their conventions are the ones van Erven–Harremoës fix by
  hand: `0 ^ y = ∞` for `y < 0`, `0 ^ y = 0` for `y > 0`, and `0 · ∞ = 0`. So for `α > 1` the
  integrand `p^α q^(1-α)` is `∞` where `q = 0 < p` and `0` where `p = q = 0`.
- **Values.** Divergences are in `ℝ≥0∞`, like `klDiv`. The defining formula takes the real
  logarithm of the Hellinger integral only when that integral is neither `0` nor `∞`, and the
  divergence is `∞` otherwise; for probability measures the real number `log H / (α - 1)` is never
  negative, so the truncation `ENNReal.ofReal` loses nothing (1.2).
- **Privacy.** Data sets form an arbitrary type `𝒟` with an arbitrary adjacency relation
  `Adj : 𝒟 → 𝒟 → Prop`; a mechanism is a map `M : 𝒟 → Measure Y` to probability measures. No
  symmetry of `Adj` is assumed, so a statement about adjacent pairs covers both orders only when
  `Adj` is symmetric. Privacy budgets `ε` are in `ℝ≥0` and measured in nats: `(ε, δ)` bounds read
  `P(A) ≤ e^ε Q(A) + δ` with the natural exponential.

## Layer 1: the Hellinger integral and the Rényi divergence

### 1.1 The Hellinger integral

Define `hellingerIntegral α P Q` as `∫⁻ p^α q^(1-α) d(P + Q)`, where `p` and `q` are the
densities `P.rnDeriv (P + Q)` and `Q.rnDeriv (P + Q)` and the powers are taken in `ℝ≥0∞`
(van Erven–Harremoës, Definition 2 and Remark 1, p. 4, where the integral is called the Hellinger
integral). API, for probability measures `P`, `Q` and an order `α`:

- *Independence of the dominating measure.* For every σ-finite `μ` with `P ≪ μ` and `Q ≪ μ`, the
  Hellinger integral equals `∫⁻ (dP/dμ)^α (dQ/dμ)^(1-α) dμ` (van Erven–Harremoës, p. 4, the
  paragraph after Remark 1). Route: `dP/dμ = (dP/d(P + Q)) · (d(P + Q)/dμ)` almost everywhere
  (`Measure.rnDeriv_mul_rnDeriv`), and `(c a)^α (c b)^(1-α) = c a^α b^(1-α)` for `0 < c < ∞` and
  all `a, b ∈ [0, ∞]` with the conventions above.
- *Integration against `Q`.* If `0 < α < 1`, or if `P ≪ Q`, the Hellinger integral equals
  `∫⁻ (dP/dQ)^α dQ` (van Erven–Harremoës, p. 4, the display after Remark 1). For `α > 1` and
  `P` not absolutely continuous with respect to `Q` the Hellinger integral is `∞`, while
  `∫⁻ (dP/dQ)^α dQ` may be finite (van Erven–Harremoës, (11) and (12), p. 4).
- *Range.* For `0 < α < 1` the Hellinger integral lies in `[0, 1]`, and it is `0` exactly
  when `P` and `Q` are mutually singular. With `N = 1/(1 - α) > 1`, so that `α = 1 - 1/N`, the
  integration against `Q` turns it into minus Tau Ceti's Rényi entropy `S_N(P | Q)`
  (`TauCeti.renyiEntropy_eq_neg_lintegral_rpow`), so the bound `≤ 1` is Tau Ceti's Hölder bound
  `TauCeti.neg_rpow_mul_rpow_le_renyiEntropy` with the whole space as the carrying set, and the
  value `0` for mutually singular laws is `TauCeti.renyiEntropy_of_mutuallySingular`; the converse
  (value `0` forces `p q = 0` almost everywhere) is the target here. For `α > 1` it lies in
  `[1, ∞]` (Jensen's inequality for `t ↦ t^α` against `Q` when `P ≪ Q`, and `∞` otherwise).
- *Skew symmetry.* For `0 < α < 1`, `hellingerIntegral α P Q = hellingerIntegral (1 - α) Q P`,
  since `P + Q = Q + P`.

*Needs:* Mathlib `Measure.rnDeriv`, `Measure.rnDeriv_mul_rnDeriv`, `ConvexOn.map_integral_le`;
Tau Ceti `TauCeti.renyiEntropy_eq_neg_lintegral_rpow`, `TauCeti.neg_rpow_mul_rpow_le_renyiEntropy`,
`TauCeti.renyiEntropy_of_mutuallySingular`.

**Checks.**
- `P = Ber(1/2)`, `Q = Ber(1/4)` (the laws on two points with mass `1/2` and `1/4` at the first):
  `hellingerIntegral (1/2) P Q = √(1/8) + √(3/8) = 0.96593` and
  `hellingerIntegral 2 P Q = (1/2)²/(1/4) + (1/2)²/(3/4) = 4/3`.
- `hellingerIntegral α P P = 1` for every order: the integrand is `p` on `{p > 0}`.
- Against Tau Ceti's Rényi entropy at `N = 2` (order `α = 1/2`): `S_2(Ber(1/2) | Ber(1/4))` is
  `-((1/2)/(1/4))^(1/2) · (1/4) - ((1/2)/(3/4))^(1/2) · (3/4) = -0.96593`, minus the value above.
- `P = Ber(1/2)`, `Q = δ₀` and `α = 2`: the second point has `q = 0 < p`, so the Hellinger
  integral is `∞`, while `∫⁻ (dP/dQ)² dQ = 1/4` (van Erven–Harremoës, (12), with `α = 2`). A
  definition integrating against `Q` would give a finite divergence for a pair that is not
  absolutely continuous.
- `α = 0` (outside the orders): for `P = δ₀`, `Q = δ₁` the integrand is `q`, because `0 ^ 0 = 1`,
  so the integral is `1` and the formula gives divergence `0` for two mutually singular laws,
  whereas the order `0` of van Erven–Harremoës gives `-log Q(p > 0) = ∞`; this is why the orders
  exclude `0`.

### 1.2 The Rényi divergence

Define `renyiDiv α P Q` as `∞` when `hellingerIntegral α P Q` is `0` or `∞`, and otherwise as
`ENNReal.ofReal (log (hellingerIntegral α P Q).toReal / (α - 1))` (van Erven–Harremoës,
Definition 2, p. 4). API, for probability measures and an order `α`:

- *No truncation.* When the Hellinger integral is neither `0` nor `∞`, the real number
  `log H / (α - 1)` is nonnegative: `H ≤ 1` for `α < 1` and `H ≥ 1` for `α > 1` (1.1).
- *Conditioning.* If `Q(A) > 0` and `P = Q(· | A)`, then `renyiDiv α P Q = -log Q(A)` for every
  order (van Erven–Harremoës, Example 1, p. 1): the Hellinger integral is `Q(A)^(1-α)`.
- *Skew symmetry.* For `0 < α < 1`, `(1 - α) · renyiDiv α P Q = α · renyiDiv (1 - α) Q P`
  (van Erven–Harremoës, Proposition 2, p. 11), from the skew symmetry of 1.1.
- *Infinite values for `α > 1`.* If `α > 1` and `P` is not absolutely continuous with respect to
  `Q`, then `renyiDiv α P Q = ∞` (van Erven–Harremoës, p. 4, the sentence before (11)). The
  converse fails: see the Checks of 2.1.

*Remark (orders `1/2` and `2`).* With the Hellinger affinity and the chi-squared divergence of
MathematicalStatisticsNonparametric 1.1 and 1.2, `hellingerIntegral (1/2) P Q` is the affinity and
`hellingerIntegral 2 P Q = 1 + chiSqDiv P Q` in `ℝ≥0∞`. Hence `D_{1/2} = -2 log (affinity)` when
the affinity is positive, and `D_2 = log (1 + χ²)` (van Erven–Harremoës, (5) and (6), p. 2). These
identities compare the two roadmaps' objects; that roadmap's statements about the affinity and the
chi-squared divergence (products, Gaussian values, data processing) are its own and are not
restated here.

*Needs:* 1.1; Mathlib `Real.log`, `ENNReal.ofReal`.

**Checks.**
- `P = Ber(1/2)`, `Q = Ber(1/4)`: `D_{1/2} = -2 log (√(1/8) + √(3/8)) = 0.06934`,
  `D_2 = log (4/3) = 0.28768`, `D_3 = 0.39925`. Against MathematicalStatisticsNonparametric's
  Checks of 1.1 and 1.2 (affinity `√(1/8) + √(3/8) = 0.96593`, `χ² = 1/3`): `D_{1/2} = 0.06934` and
  `log (1 + 1/3) = 0.28768`.
- `Q` on three points with masses `(0.2, 0.3, 0.5)`, `A` the first two points and
  `P = Q(· | A) = (0.4, 0.6, 0)`: `renyiDiv α P Q = log 2 = 0.693147` at
  `α = 0.05, 0.5, 0.99, 1.01, 2, 7`. A definition without the factor `1/(α - 1)` would depend on
  `α` here.
- Skew symmetry at `α = 1/2`: `D_{1/2}` is symmetric; for `Ber(1/2)`, `Ber(1/4)` both orders give
  `0.06934`.

### 1.3 Positivity and infinite values

- `renyiDiv_eq_zero_iff`: for probability measures `P`, `Q` and an order `α`,
  `renyiDiv α P Q = 0 ↔ P = Q` (van Erven–Harremoës, Theorem 8, p. 8). Route: Jensen's inequality
  as in the source, with equality exactly when `dQ/dP` is `P`-almost surely constant and
  `Q ≪ P`.
- `renyiDiv_eq_top_iff_mutuallySingular`: for `0 < α < 1`, `renyiDiv α P Q = ∞ ↔ P ⟂ₘ Q`
  (van Erven–Harremoës, Theorem 24, p. 15, the equivalence of (i) and (iii) for `α ∈ (0, 1)`).
  Route: the Hellinger integral of a pair is `0` exactly when `p q = 0` almost everywhere, and it
  is never `∞` for `α < 1` (1.1).

*Needs:* 1.1, 1.2; Mathlib `ConvexOn.map_integral_le`, `Measure.MutuallySingular`.

**Checks.**
- `renyiDiv_eq_top_iff_mutuallySingular` fails for `α > 1`: `Ber(1/2)` and `δ₀` are not mutually
  singular, but `D_2(Ber(1/2) ‖ δ₀) = ∞` (1.1); and `D_{1/2}(Ber(1/2) ‖ δ₀) = log 2 = 0.693147`
  is finite, as the theorem requires for a non-singular pair.
- `δ₀` and `δ₁` are mutually singular and `D_{1/2}(δ₀ ‖ δ₁) = ∞`.
- `renyiDiv_eq_zero_iff` needs `α ≠ 1`: at `α = 1` the formula returns `0` for every pair.

### 1.4 Gaussian laws

`renyiDiv_gaussianReal`: for `m₀, m₁ ∈ ℝ`, a variance `v ≠ 0` (in `ℝ≥0`) and an order `α`,
`renyiDiv α (gaussianReal m₀ v) (gaussianReal m₁ v) = ENNReal.ofReal (α (m₀ - m₁)² / (2 v))`
(van Erven–Harremoës, (10), p. 4, with equal variances, where the logarithmic term vanishes;
Mironov, Proposition 7, p. 8, for `α > 1`). Route: with `φ_m` the density of `N(m, v)`,
`φ_{m₀}^α φ_{m₁}^(1-α) = exp(-α(1 - α)(m₀ - m₁)² / (2 v)) · φ_{α m₀ + (1 - α) m₁}` by completing
the square, so the Hellinger integral is `exp(α(α - 1)(m₀ - m₁)² / (2 v))`.

*Needs:* 1.1, 1.2; Mathlib `gaussianReal`, `gaussianPDF`, `rnDeriv_gaussianReal`,
`integral_gaussian`.

**Checks.**
- `D_α(N(0, 1) ‖ N(1, 1)) = α/2`; numerical integration agrees at
  `α = 0.1, 0.5, 0.9, 1.5, 2, 5`, and for the pairs `(0.3, -1.2, v = 2.5)`, `(0, 2, v = 0.5)`.
- Against MathematicalStatisticsNonparametric: its affinity `e^(-1/8)` of `N(0, 1)` and `N(1, 1)`
  gives `D_{1/2} = 1/4 = 0.5/2`, and its `1 + χ²(N(1, 1) ‖ N(0, 1)) = e` gives `D_2 = 1 = 2/2`;
  its Kullback–Leibler value `1/2` is the limit of `α/2` at `α = 1` (2.1).
- The hypothesis `v ≠ 0` is needed: `gaussianReal m 0` is the Dirac mass at `m`, so for
  `m₀ ≠ m₁` the left side is `∞` (1.3 for `α < 1`, 1.2 for `α > 1`), while the right side
  divides by `2 · 0` and is `0`.

### Examples

The conditional law `Q(· | A)` (1.2), whose divergence does not depend on the order, and the
Gaussian location pairs (1.4), whose divergence is linear in the order.

### Dependencies

Mathlib (Radon–Nikodym derivatives, Jensen's inequality and the Gaussian laws) and, for the
range bullet of 1.1, Tau Ceti's Rényi entropy with its Hölder bound.

## Layer 2: the order and the Kullback–Leibler limit

### 2.1 The limit at order 1

- `tendsto_renyiDiv_nhdsLT_one`: for probability measures `P`, `Q`,
  `renyiDiv α P Q → klDiv P Q` as `α → 1` from below, in `ℝ≥0∞` (van Erven–Harremoës, Theorem 5,
  (17), p. 6). The limit may be `∞`.
- `tendsto_renyiDiv_nhdsGT_one`: if `klDiv P Q = ∞` or `renyiDiv β P Q ≠ ∞` for some `β > 1`,
  then `renyiDiv α P Q → klDiv P Q` as `α → 1` from above (van Erven–Harremoës, Theorem 5, (18),
  p. 6).

Route (van Erven–Harremoës, Lemma 1, Lemma 2 and the proof of Theorem 5, p. 6–7): the Hellinger
integral `H(α)` is continuous at `1` from below by dominated convergence
(`p^α q^(1-α) ≤ p + q` for `α ∈ (0, 1)`), with limit `P(q > 0)`; if `P` is not absolutely
continuous with respect to `Q` this limit is below `1` and `D_α → ∞`. If `P ≪ Q`, then `H(α) → 1`,
and the bounds of their Lemma 2 on the logarithm near `1` reduce `log H(α) / (α - 1)` to
`(H(α) - 1)/(α - 1)`, the integral over `{p, q > 0}` of `(p^α q^(1-α) - p)/(α - 1)`. This
difference quotient is nondecreasing in `α` because `α ↦ p^α q^(1-α)` is convex, so monotone
convergence (bounded below by `p - q` for `α < 1`, and above by its value at `β` for `α ∈ (1, β)`,
integrable when `D_β < ∞`) gives the limit `∫ p log (p/q) dμ` from either side. Mathlib's `klDiv` is
`∞` unless `P ≪ Q` and the log-likelihood ratio is integrable, and equals `∫ p log(p/q) dμ` in
that case, which is the source's Kullback–Leibler divergence for probability measures (the
negative part of `log(p/q)` is always `P`-integrable, since `-log t ≤ 1/t - 1`).

*Needs:* 1.1, 1.2; Mathlib `InformationTheory.klDiv`,
`InformationTheory.klDiv_eq_integral_klFun`, `tendsto_lintegral_filter_of_dominated_convergence`,
`MeasureTheory.integral_tendsto_of_tendsto_of_monotone`,
`MeasureTheory.integral_tendsto_of_tendsto_of_antitone`, `MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone`.

**Checks.**
- Gaussian: `D_α(N(0, 1) ‖ N(1, 1)) = α/2 → 1/2`, the value of MathematicalStatisticsNonparametric's
  Check of 1.3 for `klDiv (gaussianReal 0 1) (gaussianReal 1 1)`.
- `Ber(1/2)`, `Ber(1/4)`: `D_{1 - 10⁻⁶}` and `D_{1 + 10⁻⁶}` both equal `KL = 0.14384` to `10⁻²`
  (brute force on 300 random pairs, same agreement).
- `KL = ∞` from below: for `P = Ber(1/2)`, `Q = δ₀` and `α < 1` the Hellinger integral is
  `(1/2)^α`, so `D_α = α log 2 / (1 - α)`, which is `6.238`, `68.622`, `692.454` at
  `α = 0.9, 0.99, 0.999`.
- The hypothesis of the second limit is needed (van Erven–Harremoës, p. 6, after Theorem 5, an
  example they credit to Liese and Vajda): `P` with density `e^(-2|x|)` and `Q = N(0, 1)` have
  `KL(P ‖ Q) = log √(2π) - 3/4 = 0.16894`, while `p^β q^(1-β)` grows like
  `exp((β - 1)x²/2 - 2β|x|)`, so `D_β = ∞` for every `β > 1` and the limit from above is `∞`.

### 2.2 Monotonicity in the order

`renyiDiv_le_renyiDiv_of_le`: for probability measures `P`, `Q` and orders `α ≤ β` (with
`0 < α`, `α ≠ 1`, `β ≠ 1`), `renyiDiv α P Q ≤ renyiDiv β P Q` (van Erven–Harremoës, Theorem 3,
p. 6). The orders may lie on either side of `1`; in particular
`renyiDiv α P Q ≤ klDiv P Q ≤ renyiDiv β P Q` for `0 < α < 1 < β` (van Erven–Harremoës, proof of
Theorem 3, p. 6). Route, for `α < β` on the same side of `1`: with `r = dQ/dP` on `{p > 0}`,
`renyiDiv α P Q = log ∫ r^(1-α) dP / (α - 1)`, and Jensen's inequality for
`x ↦ x^((α - 1)/(β - 1))`, convex if `α < 1` and concave if `α > 1`, against `P`. Across `1`:
the two limits of 2.1 and the monotonicity on each side give `D_α ≤ KL ≤ D_β`.

*Needs:* 1.1, 1.2, 2.1; Mathlib `ConvexOn.map_integral_le`.

**Checks.**
- `Ber(1/2)`, `Ber(1/4)`: `D_{1/2} = 0.06934 ≤ KL = 0.14384 ≤ D_2 = 0.28768 ≤ D_3 = 0.39925`;
  brute force over 3000 random pairs on at most five points (zero masses included) and the orders
  `0.05, 0.2, 0.5, 0.7, 0.9, 0.99, 1.01, 1.1, 1.5, 2, 3, 7` finds the values nondecreasing.
- The conditional law of 1.2 makes the map constant, so the inequality is not strict in general.

### Examples

The Gaussian location family, where `D_α = α (m₀ - m₁)² / (2 v)` is continuous through `α = 1`,
and the Laplace–Gaussian pair, where it jumps from `0.16894` to `∞`.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib's `klDiv`. Within the layer, 2.2 uses 2.1. No use of Layer 3.

## Layer 3: data processing, products and the chain bound

### 3.1 Data processing

`renyiDiv_comp_le`: for probability measures `P`, `Q` on `X`, a Markov kernel `κ : Kernel X Y` and
an order `α`, `renyiDiv α (κ ∘ₘ P) (κ ∘ₘ Q) ≤ renyiDiv α P Q` (van Erven–Harremoës, Theorem 1,
p. 4, for sub-σ-algebras, and Example 2, p. 5, for kernels). Measurable maps are the deterministic
kernels, so `renyiDiv α (P.map g) (Q.map g) ≤ renyiDiv α P Q` for measurable `g`.

Route: `κ ∘ₘ P` is the second marginal of `P ⊗ₘ κ` (`Measure.snd_compProd`), and
`d(P ⊗ₘ κ)/d(Q ⊗ₘ κ) = (dP/dQ) ∘ Prod.fst` (`ProbabilityTheory.rnDeriv_measure_compProd_left`),
so the joint laws have the Hellinger integral of `P`, `Q`. For the marginal, Jensen's inequality
for conditional expectations (`ConvexOn.comp_rnDeriv_map_le`) applied to `t ↦ t^α` for `α > 1`
(when `P ≪ Q`; otherwise the right side is `∞`) and to `t ↦ -t^α` for `α < 1`. For `α < 1`,
write `P'` for the part of `P` absolutely continuous with respect to `Q`: the Hellinger integral
of `P'`, `Q` equals that of `P`, `Q` (the integration against `Q` of 1.1, whose computation
does not use the total mass of `P`), Jensen's inequality gives
that of `κ ∘ₘ P'`, `κ ∘ₘ Q` at least that, and since `κ ∘ₘ P' ≤ κ ∘ₘ P` and `t ↦ t^α` is
nondecreasing, the Hellinger integral of `κ ∘ₘ P`, `κ ∘ₘ Q` is larger still; dividing by
`α - 1 < 0` reverses the inequality.

*Needs:* 1.1, 1.2; Mathlib `Measure.snd_compProd`, `ProbabilityTheory.rnDeriv_measure_compProd_left`,
`ConvexOn.comp_rnDeriv_map_le`, `ConvexOn.integrable_comp_rnDeriv_map`,
`Measure.haveLebesgueDecomposition_add`.

**Checks.**
- A kernel that merges the two points of `Ber(1/2)`, `Ber(1/4)` into one gives `δ₀`, `δ₀` and
  divergence `0 ≤ 0.28768` at `α = 2`.
- Brute force: 2000 random pairs on at most four points with random stochastic matrices to at most
  four points, all orders of 2.2: the inequality holds.
- The identity kernel gives equality.

### 3.2 Additivity over products

`renyiDiv_prod`: for probability measures `P`, `Q` on `X` and `P'`, `Q'` on `Y` and an order `α`,
`renyiDiv α (P.prod P') (Q.prod Q') = renyiDiv α P Q + renyiDiv α P' Q'` in `ℝ≥0∞`
(van Erven–Harremoës, Theorem 28, (42), p. 15). By induction through
`MeasurableEquiv.piFinSuccAbove`, which carries `Measure.pi` to a binary product, the finite form
`renyiDiv α (Measure.pi P) (Measure.pi Q) = ∑ i, renyiDiv α (P i) (Q i)` holds for families
`P Q : Fin n → Measure X` of probability measures, with value `0` for `n = 0`.

Route: densities of products with respect to `(P + Q).prod (P' + Q')` are products of densities,
so the Hellinger integral is multiplicative (`lintegral_prod_mul`, after the independence of the
dominating measure in 1.1); a factor `0` (for `α < 1`) or `∞` (for `α > 1`) makes both sides `∞`,
since the other factor lies in `[0, 1]` or in `[1, ∞]` respectively, so that the product is `0` or
`∞` as well.

*Needs:* 1.1, 1.2; Mathlib `Measure.prod`, `lintegral_prod_mul`, `Measure.pi`,
`MeasurableEquiv.piFinSuccAbove`, `measurePreserving_piFinSuccAbove`.

**Checks.**
- `Ber(1/2) ⊗ Ber(1/2)` against `Ber(1/4) ⊗ Ber(1/4)` at `α = 2`: the Hellinger integral is
  `(4/3)² = 16/9` and the divergence `log (16/9) = 0.57536 = 2 · 0.28768`.
- One infinite factor: `Ber(1/2) ⊗ Ber(1/2)` against `δ₀ ⊗ Ber(1/4)` at `α = 2` is `∞`, as is
  `∞ + 0.28768`.
- Brute force on 2000 random pairs of pairs (zero masses included) at all orders of 2.2.

### 3.3 The chain bound for composition-products

`renyiDiv_compProd_le`: let `μ`, `ν` be probability measures on `X`, `κ`, `η : Kernel X Y` Markov
kernels, `α` an order and `c ∈ [0, ∞]` with `renyiDiv α (κ x) (η x) ≤ c` for every `x`. If `X` is
countable or `Y` is countably generated, then `renyiDiv α (μ ⊗ₘ κ) (ν ⊗ₘ η) ≤ renyiDiv α μ ν + c`
(Mironov, the computation in the proof of Proposition 1, p. 4, written there for `α > 1` and
densities on the output spaces; proved here for `α ∈ (0, 1)` by the same computation, in which
both inequalities reverse and so does the division by `α - 1 < 0`).

Route: dominate by `λ = μ + ν` and the kernel `ξ = κ + η`. Mathlib's
`ProbabilityTheory.rnDeriv_measure_compProd` writes the density of `μ ⊗ₘ κ` with respect to
`λ ⊗ₘ ξ` as `(dμ/dλ)(x) · κ.rnDeriv ξ x y`, with Mathlib's jointly measurable kernel density
`Kernel.rnDeriv`; this is where the countability hypothesis enters. With the independence of the
dominating measure (1.1) and Tonelli, the Hellinger integral of the joint laws is
`∫ m(x)^α n(x)^(1-α) H_α(κ x, η x) dλ(x)`, where `m`, `n` are the densities of `μ`, `ν` with
respect to `λ` and `H_α(κ x, η x)` is the Hellinger integral of `κ x`, `η x`, which the hypothesis
bounds above by `exp((α - 1)c)` for `α > 1` and below by it for `α < 1`. The supremum over `x`
cannot be replaced by the average over `μ`: see the Checks.

*Needs:* 1.1, 1.2; Mathlib `ProbabilityTheory.rnDeriv_measure_compProd`,
`ProbabilityTheory.Kernel.rnDeriv`, `Kernel.rnDeriv_eq_rnDeriv_measure`,
`Measure.lintegral_compProd`, `MeasurableSpace.CountableOrCountablyGenerated`.

**Checks.**
- With `κ`, `η` constant kernels the joint laws are products (`Measure.compProd_const`) and the
  bound holds with equality by 3.2.
- The average does not suffice: `μ = ν` uniform on two points, `κ 0 = η 0`, and
  `κ 1 = Ber(1/2)`, `η 1 = Ber(1/4)`. At `α = 2` the joint Hellinger integral is
  `(1 + 4/3)/2 = 7/6`, so the joint divergence is `log (7/6) = 0.15415`, larger than the
  `μ`-average `0.28768/2 = 0.14384` of the divergences of the kernels, and at most `0 + 0.28768`.
- Brute force: 2000 random instances on at most three points per factor, all orders of 2.2.

### Examples

Products of Bernoulli laws (3.2) and the two-point mixture of 3.3, where the joint divergence lies
strictly between the average and the supremum of the conditional divergences.

### Dependencies

Layer 1 (1.1, 1.2). No use of Layer 2.

## Layer 4: Rényi differential privacy

### 4.1 From a Rényi bound to an `(ε, δ)` bound

- *Probability preservation.* For probability measures `P`, `Q`, `α > 1` with
  `renyiDiv α P Q < ∞` and every measurable `A`,
  `P(A) ≤ (exp(renyiDiv α P Q) · Q(A))^((α - 1)/α)` (Mironov, Proposition 10, p. 13, stated
  there for laws with a common support; here the finiteness gives `P ≪ Q` by 1.2, and the bound is
  Hölder's inequality applied to `∫_A (dP/dQ) dQ`).
- `measureReal_le_of_renyiDiv_le`: if `α > 1`, `renyiDiv α P Q ≤ ρ` for some `ρ ∈ ℝ≥0`, and
  `δ > 0`, then `P(A) ≤ exp(ρ + log(1/δ)/(α - 1)) · Q(A) + δ` for every measurable `A`
  (Mironov, Proposition 3, p. 5, stated there for `0 < δ < 1`; for `δ ≥ 1` the bound holds
  because `P(A) ≤ 1 ≤ δ`). Route: Mironov's two cases, according as `e^ρ Q(A)` exceeds
  `δ^(α/(α - 1))` or not, applied to probability preservation; they give the stronger bound
  `P(A) ≤ max(exp(ρ + log(1/δ)/(α - 1)) Q(A), δ)`.

*Needs:* 1.1, 1.2; Mathlib `ENNReal.lintegral_mul_le_Lp_mul_Lq`.

**Checks.**
- `δ > 0` is needed: with `δ = 0` the Lean expression `log (1/0)` is `log 0 = 0`, and the claim
  would read `P(A) ≤ e^ρ Q(A)`; for `P = Ber(1/2)`, `Q = Ber(1/4)`, `α = 2`, `ρ = log (4/3)` and `A`
  the first point it fails: `1/2 > e^0.28768 · 1/4 = 1/3`.
- `ρ ≥ 0` matters: a negative `ρ` coerced to a divergence bound `0` would force `P = Q`, and then
  with `ρ = -100`, `α = 2` and `δ = 0.1` the bound `P(A) ≤ e^(-100 + log 10) P(A) + 0.1` fails at
  `P(A) = 1/2`; the statement takes `ρ ∈ ℝ≥0`.
- Brute force over 3000 random pairs on at most five points, `α ∈ {1.01, 1.5, 2, 3, 10}`,
  `δ ∈ {10⁻³, 0.05, 0.3, 0.9, 1, 2}` and all events: the sum bound, the maximum bound and
  probability preservation hold.
- Gaussian mechanism with `v = 1`, `Δ = 1` (4.4) and `δ = 10⁻⁵`: minimizing
  `α/2 + log(10⁵)/(α - 1)` over `α > 1` gives `α = 1 + √(2 log 10⁵) = 5.7985` and
  `ε = 1/2 + √(2 log 10⁵) = 5.2985`; the exact smallest `δ` for this `ε` between `N(0, 1)` and
  `N(1, 1)`, `Φ(1/2 - ε) - e^ε Φ(-1/2 - ε)`, is `1.3 · 10⁻⁷ ≤ 10⁻⁵`.

### 4.2 Rényi differential privacy

Define `IsRenyiDP Adj M α ε`, for an adjacency relation `Adj` on a type `𝒟` of data sets, a
mechanism `M : 𝒟 → Measure Y`, an order `α` and `ε ∈ ℝ≥0`: `renyiDiv α (M D) (M D') ≤ ε` for all
`D`, `D'` with `Adj D D'` (Mironov, Definition 4, p. 3, for `α > 1`). API:

- *Post-processing.* If `IsRenyiDP Adj M α ε` and `κ : Kernel Y Z` is Markov, the mechanism
  `D ↦ κ ∘ₘ M D` is `(α, ε)`-Rényi differentially private, by 3.1.
- *Conversion.* If `α > 1`, the mechanisms take probability measures as values and
  `IsRenyiDP Adj M α ε`, then for every `δ > 0`, all adjacent `D`, `D'` and measurable `A`,
  `(M D)(A) ≤ exp(ε + log(1/δ)/(α - 1)) (M D')(A) + δ`, by 4.1 (Mironov, Proposition 3, p. 5):
  the inequality of `(ε + log(1/δ)/(α - 1), δ)`-differential privacy for the relation `Adj`.
- *Monotonicity in the order.* `IsRenyiDP Adj M β ε` implies `IsRenyiDP Adj M α ε` for orders
  `α ≤ β`, by 2.2.

*Needs:* 1.2, 2.2, 3.1, 4.1.

**Checks.**
- A constant mechanism `M D = ν` is `(α, 0)`-private for every order.
- The release `M D = δ_D` on `𝒟 = Bool` with `Adj` the relation `D ≠ D'` is not `(α, ε)`-private
  for any order and any `ε ∈ ℝ≥0`: the divergence between distinct Dirac masses is `∞` (1.3 and
  1.2).

### 4.3 Adaptive composition

`isRenyiDP_compProd`: let `M : 𝒟 → Measure Y` have probability measures as values and
`K : 𝒟 → Kernel Y Z` Markov kernels as values, with `Y` countable or `Z` countably generated, and
`α > 1`. If `IsRenyiDP Adj M α ε₁` and, for every first output `y`,
`IsRenyiDP Adj (fun D ↦ K D y) α ε₂`, then the joint release `D ↦ M D ⊗ₘ K D` satisfies
`IsRenyiDP Adj _ α (ε₁ + ε₂)` (Mironov, Proposition 1, p. 4). By induction, the adaptive
composition of `k` such mechanisms, each a kernel from the earlier outputs, is
`(α, ε₁ + ⋯ + ε_k)`-private.

Route: 3.3 with `μ = M D`, `ν = M D'`, `κ = K D`, `η = K D'` and `c = ε₂`.

*Needs:* 3.3, 4.2.

**Checks.**
- Two Gaussian mechanisms with `v = 1` and `Δ = 1` compose to the curve `α`, the curve of one
  Gaussian mechanism with `v = 1/2` (4.4); four with `v = 4` compose to `4 · α/8 = α/2`, the curve
  of `v = 1`.

### 4.4 The Gaussian mechanism

`isRenyiDP_gaussianMechanism`: let `f : 𝒟 → (Fin d → ℝ)` satisfy
`∑ i, (f D i - f D' i)² ≤ Δ²` for all adjacent `D`, `D'`, let `v ≠ 0` in `ℝ≥0` and `α > 1`. Then
the mechanism `D ↦ Measure.pi (fun i ↦ gaussianReal (f D i) v)` is
`(α, α Δ² / (2 v))`-Rényi differentially private (Mironov, Corollary 3, p. 8, for `d = 1` and
`Δ = 1`). Route: 3.2 in its finite form and 1.4 give the divergence
`α ∑ i (f D i - f D' i)² / (2 v)` exactly.

*Needs:* 1.4, 3.2, 4.2; Mathlib `Measure.pi`, `gaussianReal`.

**Checks.**
- `d = 1`, `Δ = 1`, `v = 1`: the curve `α/2`, Mironov's straight line.
- `d = 0`: every release is the Dirac mass on the unique point of `Fin 0 → ℝ`, divergence `0`, and
  the bound holds for every `Δ`.
- `v ≠ 0` is needed: with `v = 0` the mechanism releases `f D` exactly, and for adjacent data
  sets with `f D ≠ f D'` the divergence is `∞`, whereas the bound divides by `2 · 0` and is `0`.

### Examples

The Gaussian mechanism (4.4) with its linear curve, its compositions (4.3) and its `(ε, δ)`
guarantee at `δ = 10⁻⁵` (Checks of 4.1).

### Dependencies

Layer 1 (1.1, 1.2, 1.4), Layer 3 (3.1, 3.2, 3.3) and, for the monotonicity bullet of 4.2,
Layer 2 (2.2).

## Scope and ownership

This roadmap owns the Hellinger integral of general order and the Rényi divergence with the
statements above: positivity and infinite values, the Gaussian formula, monotonicity in the order,
the two limits at order `1`, data processing, additivity over products, the chain bound for
composition-products, probability preservation and the conversion to `(ε, δ)` bounds, Rényi
differential privacy for an arbitrary adjacency relation, its post-processing, adaptive
composition and the Gaussian mechanism.

Already in the libraries and therefore not targets: the Kullback–Leibler divergence, its data
processing inequality and chain rule (Mathlib, `Mathlib/InformationTheory/KullbackLeibler/`), and
its convexity, Pinsker's inequality and variational formulas (Tau Ceti,
`TauCeti/InformationTheory/KullbackLeibler/`); the Gaussian laws and their densities (Mathlib).
Tau Ceti's `TauCeti.renyiEntropy` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean`)
is the internal-energy functional `S_N(μ | m) = -∫ ρ^(1-1/N) dm` of the curvature-dimension
conditions, `EReal`-valued, with `ρ` the density of the absolutely continuous part of `μ` with
respect to the reference measure `m`. For probability measures and `N > 1` it is minus the
Hellinger integral of order `1 - 1/N ∈ (0, 1)` of `μ` and `m` (1.1, integration against `Q`), so
its Hölder bound and its value on mutually singular laws are cited in the range bullet of 1.1
instead of being planned. It covers no order above `1` and takes no logarithm; the Rényi
divergence, its order limits and its privacy theory are not in it.

Left to other roadmaps:

- MathematicalStatisticsNonparametric 1.1 and 1.2 own the Hellinger affinity and distance and the
  chi-squared divergence, with their products, Gaussian values and (for the affinity) data
  processing; 1.3 owns the Kullback–Leibler complements (finite products, Gaussian laws). Those
  are the orders `1/2`, `2` and the limit order `1` of the statements here, in other
  normalizations; the remark in 1.2 above and the Checks of 1.2, 1.4 and 2.1 compare the values,
  and no statement of that roadmap is restated. Its 1.4 bounds `klDiv P Q` by
  `log (1 + chiSqDiv P Q)`, which through the remark of 1.2 is the case `β = 2` of the comparison
  `KL ≤ D_β` in 2.2 above. The general-order statements here (2.2, 3.1, 3.2) are different
  statements, about the Rényi divergence of every order.
- StatisticalLearningTheory (an open roadmap, not on main), Layer 7, defines
  `(ε, δ)`-differential privacy for the substitution relation and proves the privacy of the
  Laplace, Gaussian and exponential mechanisms in that sense, basic and advanced composition and
  local privacy. This roadmap defines no `(ε, δ)` notion: its conversion (4.1, 4.2) concludes the
  `(ε, δ)` inequality for an arbitrary adjacency relation, and its Gaussian mechanism (4.4) is the
  Rényi curve, not an `(ε, δ)` guarantee. This roadmap does not depend on that one.

Outside the scope: the extended orders `0` and `∞`, negative orders, the convexity and continuity properties of van Erven–Harremoës beyond those
used above, Rényi entropy of a single law, concentrated differential privacy, privacy
amplification by subsampling (its exact form for the sampled Gaussian mechanism, due to Mironov,
Talwar and Zhang, needs random subsets of a data set, an add-or-remove adjacency and a symmetry
argument for Gaussian mixtures, and is a roadmap of its own), group privacy, and every algorithm or privacy accountant.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`: `Measure.rnDeriv` (the density of
  the absolutely continuous part, `ℝ≥0∞`-valued); `Measure.haveLebesgueDecomposition_add`
  (`μ = μ.singularPart ν + ν.withDensity (∂μ/∂ν)`).
  `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`: `Measure.rnDeriv_mul_rnDeriv`
  (for σ-finite measures and `μ ≪ ν`, `∂μ/∂ν * ∂ν/∂κ = ∂μ/∂κ` almost everywhere for `κ`).
- `Mathlib/MeasureTheory/Measure/MutuallySingular.lean`: `Measure.MutuallySingular` (`P ⟂ₘ Q`).
- `Mathlib/MeasureTheory/Integral/MeanInequalities.lean`: `ENNReal.lintegral_mul_le_Lp_mul_Lq`
  (Hölder's inequality for lower integrals with conjugate exponents).
  `Mathlib/Analysis/Convex/Integral.lean`: `ConvexOn.map_integral_le` (Jensen's inequality for a
  probability measure, a convex function continuous on a closed convex set, integrable data).
- `Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean`:
  `tendsto_lintegral_filter_of_dominated_convergence` (along a countably generated filter, with an
  integrable bound of finite integral).
  `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`:
  `MeasureTheory.lintegral_tendsto_of_tendsto_of_monotone` (monotone convergence for a sequence of
  a.e.-measurable `ℝ≥0∞`-valued functions). `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.integral_tendsto_of_tendsto_of_monotone` and
  `MeasureTheory.integral_tendsto_of_tendsto_of_antitone` (monotone convergence for a monotone or
  antitone sequence of integrable real functions with an integrable limit).
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv` (`∞` unless
  `P ≪ Q` and `llr P Q` is `P`-integrable, then `ofReal (∫ llr P Q dP + Q.real univ - P.real univ)`),
  `InformationTheory.klDiv_eq_integral_klFun` (the same value as `∫ klFun (dP/dQ) dQ`, for finite
  measures).
- `Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`: `ConvexOn.comp_rnDeriv_map_le`
  and `ConvexOn.integrable_comp_rnDeriv_map` (for finite measures `μ ≪ ν`, a measurable map `g`
  and a convex `f` on `[0, ∞)` continuous at `0` with `f (dμ/dν)` integrable: `f` of the density
  of the image laws is bounded by the conditional expectation of `f (dμ/dν)`, and is integrable).
- `Mathlib/Probability/Kernel/Defs.lean`: `ProbabilityTheory.Kernel`, `IsMarkovKernel`.
  `Mathlib/Probability/Kernel/Composition/CompNotation.lean`: the notation `κ ∘ₘ μ` for
  `Measure.bind μ κ`. `Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`:
  `Measure.compProd` (`μ ⊗ₘ κ`), `Measure.compProd_const` (`μ ⊗ₘ Kernel.const α ν = μ.prod ν`),
  `Measure.lintegral_compProd` (Tonelli for `μ ⊗ₘ κ`, measurable integrand).
  `Mathlib/Probability/Kernel/Composition/MeasureComp.lean`: `Measure.snd_compProd`
  (`(μ ⊗ₘ κ).snd = κ ∘ₘ μ`).
- `Mathlib/Probability/Kernel/Composition/RadonNikodym.lean`:
  `ProbabilityTheory.rnDeriv_measure_compProd_left` (finite measures and kernel:
  `∂(μ ⊗ₘ κ)/∂(ν ⊗ₘ κ) = (∂μ/∂ν) ∘ Prod.fst` almost everywhere, with no hypothesis on the spaces);
  `ProbabilityTheory.rnDeriv_measure_compProd` (under `CountableOrCountablyGenerated α β`:
  `∂(μ ⊗ₘ κ)/∂(ν ⊗ₘ η) = (∂μ/∂ν)(x) · κ.rnDeriv η x y` almost everywhere).
  `Mathlib/Probability/Kernel/RadonNikodym.lean`: `ProbabilityTheory.Kernel.rnDeriv` (under
  `CountableOrCountablyGenerated α γ`, a jointly measurable density of `κ` with respect to `η`) and
  `Kernel.rnDeriv_eq_rnDeriv_measure` (for finite kernels, `κ.rnDeriv η a = ∂(κ a)/∂(η a)` almost
  everywhere for `η a`). `Mathlib/MeasureTheory/MeasurableSpace/CountablyGenerated.lean`:
  `MeasurableSpace.CountableOrCountablyGenerated` (the first space is countable or the second is
  countably generated).
- `Mathlib/MeasureTheory/Measure/Prod.lean`: `Measure.prod`, `lintegral_prod_mul`
  (`∫⁻ f(x) g(y) d(μ.prod ν) = (∫⁻ f dμ)(∫⁻ g dν)` for a.e.-measurable `f`, `g`).
  `Mathlib/MeasureTheory/Constructions/Pi.lean`: `Measure.pi`,
  `MeasureTheory.measurePreserving_piFinSuccAbove` (with `MeasurableEquiv.piFinSuccAbove`, the
  product over `Fin (n + 1)` is the binary product of one factor and the rest).
- `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal m v`
  (mean `m`, variance `v : ℝ≥0`, the Dirac mass at `m` when `v = 0`), `gaussianPDF`,
  `rnDeriv_gaussianReal` (the density with respect to Lebesgue measure is `gaussianPDF m v`).
  `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean`: `integral_gaussian`
  (`∫ exp(-b x²) dx = √(π/b)`).

### From Tau Ceti

- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean`, cited in the range
  bullet of 1.1 only (no statement of `Suggested.lean` uses it): `TauCeti.renyiEntropy N m μ`
  (`EReal`-valued); `TauCeti.renyiEntropy_eq_neg_lintegral_rpow` (for `N > 1` and σ-finite `μ`,
  `renyiEntropy N m μ = -∫⁻ (dμ/dm)^(1 - 1/N) dm`); `TauCeti.neg_rpow_mul_rpow_le_renyiEntropy`
  (for `N ≥ 1` and `μ(Aᶜ) = 0`, `-(m(A)^(1/N) μ(X)^(1 - 1/N)) ≤ renyiEntropy N m μ`);
  `TauCeti.renyiEntropy_of_mutuallySingular` (for `N > 0` and `μ ⟂ₘ m`, the value is `0`).

## References

- Tim van Erven and Peter Harremoës, *Rényi divergence and Kullback–Leibler divergence*,
  arXiv:1206.2459, version 2 (2014), published in IEEE Transactions on Information Theory 60 (2014);
  theorem, equation and page numbers above are those of the arXiv version 2, which was read.
- Ilya Mironov, *Rényi differential privacy*, arXiv:1702.07476, version 3 (2017), in the
  proceedings of the 30th IEEE Computer Security Foundations Symposium; proposition, corollary and
  page numbers above are those of the arXiv version 3, which was read.
- Ilya Mironov, Kunal Talwar and Li Zhang, *Rényi differential privacy of the sampled Gaussian
  mechanism*, arXiv:1908.10530 (2019), read for the scope decision on subsampling only.
- Attributions in prose without a locator: Alfréd Rényi (the divergence of order `α`, 1961);
  Friedrich Liese and Igor Vajda (the Laplace–Gaussian example of 2.2, as credited by van
  Erven–Harremoës).

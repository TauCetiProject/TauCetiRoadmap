# Roadmap: error exponents of simple hypothesis tests

**Summary.** A statistician observes `n` independent draws from an unknown law on a measurable
space and must decide between two fixed probability measures, the null `P` and the alternative
`Q`. A randomized test is a measurable function `φ` with values in `[0, 1]`, the probability of
rejecting the null; its type I error is `∫ φ dPⁿ` and its type II error `∫ (1 − φ) dQⁿ`. This
roadmap determines the exponential rate at which the errors of optimal tests decay, in the two
classical regimes, with no assumption on `P` and `Q` beyond being probability measures. The
headline theorems:

- *Stein's lemma.* For `0 < ε < 1` let `β_n` be the least type II error of a test on `n` draws
  whose type I error is at most `ε`. If the Kullback–Leibler divergence `D(P ‖ Q)` is finite,
  `−(1/n) log β_n → D(P ‖ Q)`; if it is infinite, `β_n ≤ exp(−nE)` for all large `n`, for every
  `E`. The two halves are proved separately: for every `E < D(P ‖ Q)` there are rejection regions
  with type I error tending to `0` and type II error at most `exp(−nE)`; and if
  `D(P ‖ Q) < E` and `ε < 1`, every test of type I error at most `ε` has, for all large `n`, type
  II error at least `exp(−nE)` (strong converse), with no moment of the log-likelihood ratio
  beyond its integrability. A weak converse holds at every `n`:
  `(1 − ε) log(1/β_n) ≤ n D(P ‖ Q) + log 2`.
- *The Hellinger bound.* For a prior giving the two hypotheses weights `π₀`, `π₁` and every
  `0 < s < 1`, the least Bayes error on `n` draws is at most `π₀^s π₁^(1−s) H_s(P, Q)ⁿ`, where
  `H_s(P, Q) = ∫ p^s q^(1−s)` is the Hellinger integral of order `s`.
- *Chernoff's theorem.* If `π₀` and `π₁` are positive and finite, the `n`-th root of the least
  Bayes error tends to `inf_{0<s<1} H_s(P, Q)`. Equivalently, the Bayes error decays with
  exponent the Chernoff information `C(P, Q) = −log inf_{0<s<1} H_s(P, Q)`.

The roadmap rests on MathematicalStatisticsFoundations, whose randomized tests it uses and whose
sum-of-errors form of the Neyman–Pearson lemma identifies the least Bayes error; on
MathematicalStatisticsNonparametric, whose tensorization of the Kullback–Leibler divergence and
data-processing bound for an event give the weak converse; on RenyiDivergenceAndPrivacy, whose
Hellinger integral, Rényi divergence and additivity over products carry the Bayesian layer; and
on Mathlib's Kullback–Leibler divergence, Bayes risk, product measures and strong law of large
numbers.

Layer 1 defines the least type II error and proves the weak converse, achievability, the strong
converse and Stein's lemma. Layer 2 defines the Chernoff coefficient and proves the Hellinger
bound and Chernoff's theorem. The two layers are independent.

## Conventions

- **Hypotheses and samples.** `X` is a measurable space; `P` (the null) and `Q` (the
  alternative) are probability measures on `X`. The law of `n` independent draws is
  `Pⁿ = Measure.pi fun _ : Fin n ↦ P`, a measure on `Fin n → X`; for `n = 0` it is the Dirac mass
  on the single point. Nothing is assumed of `X` (no standard Borel hypothesis, no finite
  alphabet), and nothing of `P` and `Q`: they may be equal, mutually singular, or neither
  absolutely continuous with respect to the other.
- **Tests.** In Layer 1 a randomized test is a measurable `φ : X → ℝ` with values in `[0, 1]`
  (`IsStatisticalTest`, MathematicalStatisticsFoundations 1.3), the probability of rejecting the
  null. Type I error `∫ φ dP`, type II error `∫ (1 − φ) dQ`. A deterministic test is the
  indicator of a measurable rejection region `A`, with errors `P(A)` and `Q(Aᶜ)`. In Layer 2 a
  test is a Markov kernel `κ` from the sample space to `Bool` (Mathlib's estimators), `true`
  meaning "reject the null"; it corresponds to the randomized test `x ↦ κ x {true}`.
- **Divergences.** `D(P ‖ Q)` is Mathlib's `klDiv P Q` in `[0, ∞]`; it is `∞` when `P` is not
  absolutely continuous with respect to `Q`, and finite exactly when `P ≪ Q` and the
  log-likelihood ratio `llr P Q = log dP/dQ` is `P`-integrable (`klDiv_ne_top_iff`). Finiteness
  gives no second moment: for `P(k) = 4/(k(k+1)(k+2))` and `Q(k) = 2^(−k)` on `k ≥ 1`,
  `Σ P(k) = 1`, `D(P ‖ Q)` is finite and `E_P[(log dP/dQ)²] = ∞`. Logarithms are natural.
- **Hellinger integrals.** `H_s(P, Q)` is `hellingerIntegral s P Q` of RenyiDivergenceAndPrivacy
  1.1: `∫⁻ p^s q^(1−s) d(P + Q)` in `ℝ≥0∞` with `p`, `q` the densities with respect to `P + Q`.
  Only the orders `0 < s < 1` enter a statement; there `0^s = 0`, so the integrand vanishes where
  `p` or `q` does. At `s = 0` the definition gives `∫ 0^0 q = 1` because `0^0 = 1` in `ℝ≥0∞`, not
  `Q(p > 0)`, which is why every infimum below runs over the open interval.
- **Junk values.** `Real.log 0 = 0`, and an infimum over an empty set of reals is `0`. Layer 1
  uses a logarithm of the least type II error only where it is positive (finite divergence,
  `0 ≤ ε < 1`) or where the statement holds whatever the logarithm is: in 1.2 with infinite
  divergence and `n ≥ 1` the right side is `∞`, while the least type II error may be `0` (for
  `P = δ₀`, `Q = δ₁` the test rejecting when some draw is `1` has both errors `0`). Stein's lemma
  states the infinite-divergence case as an upper bound by `exp(−nE)`, which needs no logarithm.
  Layer 2 states Chernoff's theorem through `n`-th roots, so a Bayes error `0` (mutually singular
  laws) needs no logarithm either.

## Layer 1: Stein's lemma

### 1.1 The least type II error

Copy verbatim from MathematicalStatisticsFoundations 1.3 the predicate `IsStatisticalTest` (a
measurable function with values in `[0, 1]`). Define `steinBeta P Q ε` as the infimum, in `ℝ`, of
`∫ (1 − φ) dQ` over the tests `φ` with `∫ φ dP ≤ ε`. For `0 ≤ ε` the class contains `φ = 0`, so
`0 ≤ steinBeta P Q ε ≤ 1`; for `ε < 0` it is empty and the value is the junk `0`. The infimum is
over randomized tests; for `0 < ε < 1` it is attained by a Neyman–Pearson test
(MathematicalStatisticsFoundations 6.2), but nothing below uses that. Over deterministic tests
the least type II error can be larger at fixed `n`; the exponents of 1.3–1.5 are the same,
because the tests of 1.3 are deterministic
(Polyanskiy–Wu, Theorem 14.3, p. 279, describes the randomized region as the closed convex hull
of the deterministic one).

*Needs:* MathematicalStatisticsFoundations 1.3 (definition).

**Checks.** Let `P = (1/2, 1/2)` and `Q = (1/4, 3/4)` on two points, so
`D(P ‖ Q) = ½ log(4/3)`. The least type II error is attained by rejecting first where `q/p` is
largest (the Neyman–Pearson order). All values below are exact.

- `ε = 1/2`: `steinBeta Pⁿ Qⁿ (1/2)` for `n = 1, …, 6` is `1/4, 1/4, 5/32, 5/32, 53/512,
  53/512`; for `n = 0` it is `1/2`.
- `ε = 1/4`: the values are `5/8, 7/16, 7/16, 47/128, 161/512, 295/1024` for `n = 1, …, 6`.
- Randomized against deterministic, `n = 1`, `ε = 1/4`: no nonempty region has `P`-mass at most
  `1/4`, so the best deterministic test never rejects and has type II error `1`, while rejecting
  the second point with probability `1/2` gives `1 − (1/2)(3/4) = 5/8`.
- `P = Q`: `steinBeta Pⁿ Pⁿ ε = 1 − ε` for every `n` and `0 ≤ ε ≤ 1` (the type II error of any
  test is `1` minus its type I error).
- `ε = 0`: both laws charge every point, so a test of type I error `0` never rejects and
  `steinBeta Pⁿ Qⁿ 0 = 1` for all `n`; the exponent is `0 ≠ ½ log(4/3)`. `ε = 1`: the test that
  always rejects gives `steinBeta Pⁿ Qⁿ 1 = 0`.

### 1.2 The weak converse

Prove (`ofReal_mul_neg_log_steinBeta_le`) that for probability measures `P`, `Q`, `0 ≤ ε < 1`
and every `n`,
`(1 − ε) · (−log steinBeta Pⁿ Qⁿ ε) ≤ n · D(P ‖ Q) + log 2` in `[0, ∞]` (Polyanskiy–Wu,
Theorem 14.8, p. 282, and the weak converse in the proof of Theorem 14.14, (14.18), pp. 287–288).

Route. Fix a test `φ` with `∫ φ dPⁿ ≤ ε` and put `a = ∫ (1 − φ) dPⁿ ≥ 1 − ε`,
`b = ∫ (1 − φ) dQⁿ`. Realize `φ` as an event: on `(Fin n → X) × [0, 1]` with the uniform law `U`
on the second factor, the set `B = {(x, u) | φ x ≤ u}` is measurable with
`(Pⁿ ⊗ U)(B) = a` and `(Qⁿ ⊗ U)(B) = b`. MathematicalStatisticsNonparametric 1.3
(`ofReal_klBin_le_klDiv`) gives `klBin a b ≤ D(Pⁿ ⊗ U ‖ Qⁿ ⊗ U)`, and this divergence is
`D(Pⁿ ‖ Qⁿ) = n D(P ‖ Q)` by Tau Ceti's `klDiv_prod_prod_eq_add` with `klDiv_self`, and
MathematicalStatisticsNonparametric 1.3 (`klDiv_pi`). If `D(P ‖ Q) = ∞` and `n ≥ 1` there is
nothing to prove. Otherwise `Pⁿ ≪ Qⁿ` (for `n = 0` both laws are the Dirac mass; for `n ≥ 1`
the divergence is finite, so `P ≪ Q`), so `b > 0` (if `1 − φ = 0` `Qⁿ`-almost
everywhere then also `Pⁿ`-almost everywhere and `a = 0 < 1 − ε`). If `b = 1` the left side is
`0`. For `0 < b < 1`, `klBin a b = −h(a) + a log(1/b) + (1 − a) log(1/(1 − b))`, where
`h(a) = −a log a − (1 − a) log(1 − a) ≤ log 2`, so `a log(1/b) ≤ n D(P ‖ Q) + log 2`, and
`(1 − ε) log(1/b) ≤ a log(1/b)`. The bound on `log(1/b)` holds for every admissible test, so it
holds for the infimum `steinBeta Pⁿ Qⁿ ε`, which is therefore positive. For `n = 0` the bound
reads `(1 − ε) log(1/(1 − ε)) ≤ log 2`, true since `x log(1/x) ≤ 1/e < log 2`.

*Needs:* 1.1; MathematicalStatisticsNonparametric 1.3 (`ofReal_klBin_le_klDiv`, `klDiv_pi`,
`klBin`); Tau Ceti `klDiv_prod_prod_eq_add`; Mathlib `klDiv_self`, `klDiv_ne_top_iff`,
`Measure.AbsolutelyContinuous.pi` (Tau Ceti).

**Checks.**

- For `P = (1/2, 1/2)`, `Q = (1/4, 3/4)` and `ε = 1/2` the bound reads
  `1/steinBeta ≤ 4 (4/3)ⁿ`; with the values of 1.1 it holds for `n = 0, …, 6` (for example
  `512/53 ≤ 4 · 4096/729` at `n = 6`). For `ε = 1/4` it reads `(1/steinBeta)³ ≤ 16 (4/3)^(2n)`
  and holds for the values of 1.1.
- The bound alone gives `liminf −(1/n) log β_n ≤ D(P ‖ Q)/(1 − ε)`, which exceeds
  `D(P ‖ Q)` for every `ε > 0`; the sharp form is 1.4.

### 1.3 Achievability

Prove (`exists_tendsto_typeI_zero_and_typeII_le_exp`) that for probability measures `P`, `Q` and
`E ≥ 0` with `E < D(P ‖ Q)` (finite or infinite divergence) there are measurable regions
`Aₙ ⊆ Fin n → X` with `Pⁿ(Aₙ) → 0` and `Qⁿ(Aₙᶜ) ≤ exp(−nE)` for all large `n`
(Polyanskiy–Wu, Theorem 14.14, achievability and its last paragraph, pp. 287–288, with Corollary
14.12, pp. 285–286).

Route.

- *If `P` is not absolutely continuous with respect to `Q`*, take a measurable `B` with
  `Q(B) = 0 < P(B)` and let `Aₙ` be the set of samples with no coordinate in `B`. Then
  `Pⁿ(Aₙ) = (1 − P(B))ⁿ → 0` and `Qⁿ(Aₙᶜ) ≤ n Q(B) = 0`.
- *If `P ≪ Q`*, let `f = (dP/dQ).toReal`, so that `Pⁿ = Qⁿ.withDensity g` with
  `g x = ∏ dP/dQ(xᵢ)` (Mathlib `Measure.withDensity_rnDeriv_eq`, Tau Ceti `pi_withDensity`). Fix
  a real `τ` with `E < τ < D(P ‖ Q)` and let `Aₙ = {x | ∏ f(xᵢ) ≤ exp(nτ)}`. Then
  `exp(nτ) Qⁿ(Aₙᶜ) ≤ ∫_{Aₙᶜ} g dQⁿ = Pⁿ(Aₙᶜ) ≤ 1`, so `Qⁿ(Aₙᶜ) ≤ exp(−nτ) ≤ exp(−nE)` for all
  `n`. Since `f > 0` `P`-almost everywhere (`Measure.rnDeriv_pos`), `Aₙ` is, up to a `Pⁿ`-null
  set, the event `(1/n) Σ llr P Q (xᵢ) ≤ τ`. Realize the draws as the coordinates of
  `Measure.infinitePi fun _ : ℕ ↦ P`, which are independent (`iIndepFun_infinitePi`) and whose
  first `n` coordinates have law `Pⁿ` (`Measure.infinitePi_map_restrict`). If `D(P ‖ Q)` is
  finite, `llr P Q` is `P`-integrable with integral `D(P ‖ Q)` (`klDiv_ne_top_iff`,
  `toReal_klDiv_of_measure_eq`), and the strong law (`strong_law_ae`) gives
  `(1/n) Σ llr → D(P ‖ Q) > τ` almost surely, hence `Pⁿ(Aₙ) → 0`. If `D(P ‖ Q) = ∞`, the negative
  part of `llr P Q` is still `P`-integrable: `log t ≥ 1 − 1/t` bounds `llr` below by
  `1 − dQ/dP` (as `(dP/dQ)⁻¹ = dQ/dP` `P`-almost everywhere, `Measure.inv_rnDeriv`), and `dQ/dP`
  is `P`-integrable with integral at most `1`. So the truncations `min (llr P Q) M` are
  integrable with integrals increasing to `∞` (monotone convergence); choose `M` with integral
  above `τ` and apply the strong law to the truncation, which is at most `llr P Q`.

*Needs:* Mathlib `klDiv_ne_top_iff`, `toReal_klDiv_of_measure_eq`, `llr`,
`Measure.withDensity_rnDeriv_eq`, `Measure.rnDeriv_pos`, `Measure.inv_rnDeriv`,
`lintegral_tendsto_of_tendsto_of_monotone`, `Measure.infinitePi`,
`Measure.infinitePi_map_restrict`, `iIndepFun_infinitePi`, `strong_law_ae`,
`tendstoInMeasure_of_tendsto_ae`; Tau Ceti `pi_withDensity`.

**Checks.**

- `P ≪ Q` with `D(P ‖ Q) = ∞`: `P(k) = 1/(k(k+1))` and `Q(k) = 2^(−k)` on `k ≥ 1`. Here
  `log(P(k)/Q(k)) = k log 2 − log(k(k+1))` and `Σ P(k) · k = Σ 1/(k+1) = ∞`, so the divergence is
  infinite although `P ≪ Q`; this is the case that needs the truncated strong law.
- `P` not absolutely continuous: `P = (1/2, 1/2, 0)`, `Q = (0, 1/2, 1/2)`, `B` the first point.
  The regions "no draw equals the first point" have `Pⁿ(Aₙ) = 2^(−n)` and `Qⁿ(Aₙᶜ) = 0`.
- `P = Q`: `D = 0`, no `E ≥ 0` is below it, and the statement is empty; indeed every test has
  type I plus type II error `1`.

### 1.4 The strong converse

Prove (`exp_neg_mul_le_typeII_of_klDiv_lt`) that for probability measures `P`, `Q`, `ε < 1` and
`E` with `D(P ‖ Q) < E`, there is `N` such that for `n ≥ N` every randomized test `φ` on
`Fin n → X` with `∫ φ dPⁿ ≤ ε` has `∫ (1 − φ) dQⁿ ≥ exp(−nE)` (Polyanskiy–Wu, Lemma 14.9 and
Theorem 14.10, p. 283, and the strong converse in the proof of Theorem 14.14, p. 288). The only
hypothesis on the log-likelihood ratio is the finiteness of `D(P ‖ Q)`, that is, its
integrability.

Route. `D(P ‖ Q) < ∞` gives `P ≪ Q` and an integrable `llr P Q` with integral `D(P ‖ Q)`. With
`g` as in 1.3 and any `γ > 0`, for every test `φ`,
`∫ (1 − φ) dPⁿ = ∫ (1 − φ) g dQⁿ ≤ γ ∫ (1 − φ) dQⁿ + Pⁿ(g > γ)`, splitting at `{g ≤ γ}` (this
is Lemma 14.9 of Polyanskiy–Wu). Fix `τ` with `D(P ‖ Q) < τ < E` and `γ = exp(nτ)`. The left
side is at least `1 − ε`, and `Pⁿ(g > exp(nτ)) = Pⁿ((1/n) Σ llr > τ) → 0` by the strong law as
in 1.3, so for large `n` it is at most `(1 − ε)/2`, and then
`∫ (1 − φ) dQⁿ ≥ ((1 − ε)/2) exp(−nτ) ≥ exp(−nE)` once `exp(n(E − τ)) ≥ 2/(1 − ε)`. The
threshold depends on `n` only, not on `φ`. No variance enters: only the law of large numbers.

*Needs:* Mathlib `klDiv_ne_top_iff`, `toReal_klDiv_of_measure_eq`,
`Measure.withDensity_rnDeriv_eq`, `strong_law_ae` and the realization of 1.3; Tau Ceti
`pi_withDensity`.

**Checks.**

- The finite form `(1 − ε) − γ β ≤ Pⁿ(dPⁿ/dQⁿ > γ)` of the route, with `β = steinBeta Pⁿ Qⁿ ε`,
  holds for `P = (1/2, 1/2)`, `Q = (1/4, 3/4)`, `ε ∈ {1/4, 1/2}`, `n = 1, …, 6` and
  `γ ∈ {1/2, 1, 3/2, 2, 4, 8}` (exact rational comparison).
- `ε = 1` is excluded: the test that always rejects has type I error `1` and type II error `0`.
- Finite divergence without a second moment, as in the Conventions: the theorem applies to
  `P(k) = 4/(k(k+1)(k+2))`, `Q(k) = 2^(−k)`.

### 1.5 Stein's lemma

Prove (`tendsto_neg_log_steinBeta_div`) that for probability measures `P`, `Q` and `0 < ε < 1`:
if `D(P ‖ Q) < ∞` then `−log (steinBeta Pⁿ Qⁿ ε) / n → D(P ‖ Q)`; if `D(P ‖ Q) = ∞` then for
every real `E`, `steinBeta Pⁿ Qⁿ ε ≤ exp(−nE)` for all large `n` (Polyanskiy–Wu, Definition
14.13 with the equivalent form after it, and Theorem 14.14, pp. 286–288).

Route. Upper bound on `β_n = steinBeta Pⁿ Qⁿ ε`: for `0 ≤ E < D(P ‖ Q)` take the regions of 1.3;
since `Pⁿ(Aₙ) → 0 < ε`, eventually the indicator of `Aₙ` is an admissible test, so
`β_n ≤ Qⁿ(Aₙᶜ) ≤ exp(−nE)`. With `E = max E' 0` this is the infinite case, and for finite
`D(P ‖ Q)` it gives `liminf −(1/n) log β_n ≥ E` for every `E < D(P ‖ Q)` (for `D(P ‖ Q) = 0`
use `β_n ≤ 1`). Lower bound: for `E > D(P ‖ Q)`, 1.4 bounds every admissible test, hence the
infimum, by `β_n ≥ exp(−nE) > 0`, so `limsup −(1/n) log β_n ≤ E`.

*Needs:* 1.1, 1.3, 1.4.

**Checks.**

- Both bounds on `ε` are needed: at `ε = 0` and `ε = 1` the values of 1.1 give exponents `0`
  and the junk `−log 0 / n = 0`, not `½ log(4/3)`.
- `P = Q`: `−log(1 − ε)/n → 0 = D(P ‖ P)`.
- The convergence is slow: for `P = (1/2, 1/2)`, `Q = (1/4, 3/4)`, `ε = 1/2` and `n = 6`,
  `−(1/6) log(53/512)` exceeds `½ log(4/3)` by a factor above `2` (since
  `(512/53)^(1/6) > (4/3)` because `512 · 729 > 53 · 4096`).

### Examples

`P = (1/2, 1/2)` against `Q = (1/4, 3/4)`: the least type II errors of 1.1, the weak converse at
every `n` (1.2) and the limit `½ log(4/3)` (1.5). `P(k) = 4/(k(k+1)(k+2))` against `Q(k) = 2^(−k)`:
finite divergence, infinite variance of the log-likelihood ratio, Stein's lemma applies. Supports
that differ: zero type II error with type I error `2^(−n)` (1.3).

### Dependencies

1.1 uses MathematicalStatisticsFoundations 1.3. 1.2 uses 1.1 and MathematicalStatisticsNonparametric
1.3. 1.3 and 1.4 use Mathlib's divergence, product measures and strong law and Tau Ceti's
`pi_withDensity`. 1.5 uses 1.1, 1.3 and 1.4.

## Layer 2: the Bayes error and Chernoff information

### 2.1 The Bayes error and the Chernoff coefficient

The least Bayes error of `n` draws for a prior `π` on `Bool` (`false` for the null, `true` for
the alternative) is Mathlib's
`bayesRisk testLoss (Kernel.boolKernel Pⁿ Qⁿ) π`, the infimum over Markov kernels
`κ : Kernel (Fin n → X) Bool` of `π{false} (κ ∘ₘ Pⁿ){true} + π{true} (κ ∘ₘ Qⁿ){false}`, with the
zero-one loss `testLoss θ y = if θ = y then 0 else 1`. Copy verbatim from RenyiDivergenceAndPrivacy
1.1 the Hellinger integral `hellingerIntegral`. Define the Chernoff coefficient
`chernoffCoefficient P Q` as `⨅ s ∈ (0, 1), hellingerIntegral s P Q` in `ℝ≥0∞`, and the Chernoff
information (in prose) as `C(P, Q) = −log chernoffCoefficient P Q ∈ [0, ∞]`.

Facts used below, with their short proofs (no Lean statement):

- *Least Bayes error.* For `π{false}`, `π{true}` positive and finite and `μ` any σ-finite measure
  dominating `P` and `Q` with densities `p`, `q`, the Bayes error of `P` against `Q` equals
  `∫⁻ min(π{false} p, π{true} q) dμ`. The integral does not depend on `μ`: `min` is positively
  homogeneous, and the densities with respect to `μ` are those with respect to `P + Q` times
  `d(P + Q)/dμ` (`Measure.rnDeriv_mul_rnDeriv`). Lower bound: a kernel `κ` gives the test
  `T x = (κ x {true}).toReal`, and its average risk is `π{false} · npSumError P Q t T` with
  `t = π{true}/π{false}`; MathematicalStatisticsFoundations 6.2 (`neyman_pearson`) bounds this
  below by `π{false} · npSumError P Q t (npTest P Q t 0)`, which is the integral of the minimum
  (where `npTest` is `1`, `t q > p` or `p = 0`, and the integrand is `p`; elsewhere it is
  `t q`). Upper bound: the deterministic kernel of the indicator of
  `{π{true} q > π{false} p}` attains it. For equal unit weights this is the testing affinity of
  MathematicalStatisticsNonparametric 1.4.
- *Range.* For `0 < s < 1`, `p^s q^(1−s) ≤ s p + (1 − s) q`
  (`Real.geom_mean_le_arith_mean2_weighted`), so `hellingerIntegral s P Q ≤ 1`; it is `0` exactly
  when `p q = 0` almost everywhere, that is, when `P` and `Q` are mutually singular.
- *Products.* `hellingerIntegral s Pⁿ Qⁿ = (hellingerIntegral s P Q)ⁿ` for `0 < s < 1`. By
  RenyiDivergenceAndPrivacy 1.2 the Rényi divergence `renyiDiv s P Q` is
  `log H / (s − 1)` when `H = hellingerIntegral s P Q` is positive (it is at most `1`) and `∞`
  when `H = 0`. RenyiDivergenceAndPrivacy 3.2 (`renyiDiv_prod`) and 3.1 (`renyiDiv_comp_le`,
  applied to the deterministic kernels of `MeasurableEquiv.piFinSuccAbove` and its inverse, which
  carry `Pⁿ⁺¹` to `P.prod Pⁿ` by `measurePreserving_piFinSuccAbove`) give
  `renyiDiv s Pⁿ Qⁿ = n · renyiDiv s P Q` by induction; for `n = 0` both laws are the Dirac mass
  and the integral is `1`. Translating back gives the power, with `0ⁿ = 0` for `n ≥ 1` when the
  divergence is infinite.

**Checks.**

- `P = Q`: `hellingerIntegral s P P = 1` for every order, so the Chernoff coefficient is `1` and
  `C(P, P) = 0`.
- `P = δ₀`, `Q = δ₁`: every `hellingerIntegral s P Q` with `0 < s < 1` is `0`, the coefficient is
  `0` and `C = ∞`.
- `P = (1/4, 3/4)`, `Q = (3/4, 1/4)`: `H_s = (1/4)^s (3/4)^(1−s) + (3/4)^s (1/4)^(1−s)` is
  symmetric under `s ↦ 1 − s` and log-convex, with minimum `H_(1/2) = 2 √(3/16) = √3/2`; so
  `C = log(2/√3) = ½ log(4/3)`.
- The infimum need not be attained in `(0, 1)`: for `P = (1/2, 1/2, 0)` and
  `Q = (1/4, 1/4, 1/2)`, `H_s = 2 · (1/2)^s (1/4)^(1−s) = 2^(s−1)` decreases to `1/2 = Q(p > 0)`
  as `s → 0`, so the coefficient is `1/2`. The closed interval with the copied definition would
  give the wrong value: at `s = 0` it returns `1`, because `0^0 = 1` in `ℝ≥0∞`.
- The Chernoff information is at most `min(D(P ‖ Q), D(Q ‖ P))`. For `0 < s < 1`,
  `H_s(P, Q) = exp(−(1 − s) renyiDiv s P Q) ≥ exp(−(1 − s) D(P ‖ Q))`, because the Rényi
  divergence of order `s < 1` is at most `D(P ‖ Q)` (RenyiDivergenceAndPrivacy 2.2
  `renyiDiv_le_renyiDiv_of_le` and 2.1 `tendsto_renyiDiv_nhdsLT_one`: a nondecreasing function
  tending to `D(P ‖ Q)` from below); letting `s → 0` gives `C(P, Q) ≤ D(P ‖ Q)`, and
  `H_s(P, Q) = H_(1−s)(Q, P)` (the integrand is symmetric and `P + Q = Q + P`) gives the other
  bound. For the swapped pair above, `D(P ‖ Q) = D(Q ‖ P) = ½ log 3`, and `½ log(4/3) ≤ ½ log 3`.

*Needs:* Mathlib `bayesRisk`, `avgRisk`, `Kernel.boolKernel`, `Kernel.deterministic`,
`Measure.rnDeriv_mul_rnDeriv`,
`Real.geom_mean_le_arith_mean2_weighted`, `MeasurableEquiv.piFinSuccAbove`,
`measurePreserving_piFinSuccAbove`; MathematicalStatisticsFoundations 6.2 (`neyman_pearson`,
`npSumError`, `npTest`); RenyiDivergenceAndPrivacy 1.1 (definition), 1.2 (`renyiDiv`), 2.1, 2.2,
3.1, 3.2.

### 2.2 The Hellinger bound

Prove (`bayesRisk_le_hellingerIntegral_pow`) that for probability measures `P`, `Q`, any measure
`π` on `Bool`, `0 < s < 1` and every `n`,
`bayesRisk testLoss (Kernel.boolKernel Pⁿ Qⁿ) π ≤ π{false}^s π{true}^(1−s) H_s(P, Q)ⁿ` in
`[0, ∞]`. (Proved here: the Bayes formulation is Polyanskiy–Wu (14.1), p. 277, and the
connection of the optimal test with the Neyman–Pearson tests is §14.4, p. 284.)

Route. The deterministic kernel of the indicator of `{π{true} q > π{false} p}` (densities of
`Pⁿ`, `Qⁿ` with respect to `Pⁿ + Qⁿ`) has average risk `∫⁻ min(π{false} p, π{true} q)`. In
`[0, ∞]`, `min(a, b) ≤ a^s b^(1−s)` (if `a ≤ b` then `a = a^s a^(1−s) ≤ a^s b^(1−s)`, and
symmetrically; the conventions `0^s = 0`, `∞^s = ∞`, `0 · ∞ = 0` keep it true when a weight is
`0` or `∞`). Integrate and use 2.1 (products). No finiteness or positivity of the prior is
needed.

*Needs:* 2.1.

**Checks.**

- `P = (1/4, 3/4)`, `Q = (3/4, 1/4)`, `π{false} = π{true} = 1/2`: the least Bayes errors for
  `n = 0, …, 6` are `1/2, 1/4, 1/4, 5/32, 5/32, 53/512, 53/512`, and the bound at `s = 1/2`,
  `½ (√3/2)ⁿ`, holds in squared form `Pe(n)² ≤ ¼ (3/4)ⁿ` for each.
- A prior with `π{false} = 0`: the kernel that always rejects has risk `0`, and the right side is
  `0` too.

### 2.3 Chernoff's theorem

Prove (`tendsto_bayesRisk_rpow`) that for probability measures `P`, `Q` and a finite measure `π`
on `Bool` with `π{false} ≠ 0` and `π{true} ≠ 0`,
`(bayesRisk testLoss (Kernel.boolKernel Pⁿ Qⁿ) π)^(1/n) → chernoffCoefficient P Q` in `[0, ∞]`
(Polyanskiy–Wu, Corollary 16.2, p. 315, states the exponent for mutually absolutely continuous
laws and prints proofs only under a finite log-moment generating function; the statement here
has no such hypothesis and its route is complete below).

Route, upper bound. By 2.2, `Pe(n)^(1/n) ≤ (π{false}^s π{true}^(1−s))^(1/n) H_s(P, Q)` and the
first factor tends to `1`, so `limsup Pe(n)^(1/n) ≤ H_s(P, Q)` for every `0 < s < 1`.

Route, lower bound. If the coefficient is `0` there is nothing to prove. Otherwise let `μ = P + Q`,
`p`, `q` the densities, `S = {p > 0, q > 0}`, which has `μ(S) > 0` (2.1, range). By 2.1 (least
Bayes error, with the dominating measure `μⁿ` and densities `∏ p(xᵢ)`, `∏ q(xᵢ)` from Tau Ceti's
`pi_withDensity`) and `min(π₀ a, π₁ b) ≥ min(π₀, π₁) min(a, b)`, it suffices to show
`liminf (∫ min(∏ p(xᵢ), ∏ q(xᵢ)) dμⁿ)^(1/n) ≥ chernoffCoefficient P Q`.

- *The function `h`.* For `s ∈ [0, 1]` let `h(s) = ∫_S p^s q^(1−s) dμ` (positive bases, so no
  `0^0`). For `0 < s < 1` it equals `hellingerIntegral s P Q`; `h(0) = Q(S)`, `h(1) = P(S)`. By
  dominated convergence with the bound `p + q` (2.1, range), `h` is continuous on `[0, 1]`, so it
  has a minimizer `s*` there and `h(s*) = chernoffCoefficient P Q`.
- *Tilting.* Write `L = log(q/p)` on `S`, `Lₙ(x) = Σ L(xᵢ)`, and let `R` be the probability
  measure with density `p^(s*) q^(1−s*)/h(s*)` on `S`. On `Sⁿ`, with `a = Σ log p(xᵢ)` and
  `b = Σ log q(xᵢ)`, `min(e^a, e^b) ≥ e^(s* a + (1−s*) b) e^(−|Lₙ|)`, and
  `e^(s* a + (1−s*) b) = h(s*)ⁿ · (density of Rⁿ)`. Hence
  `∫ min ≥ h(s*)ⁿ e^(−nδ) Rⁿ(|Lₙ| ≤ nδ)` for every `δ > 0`.
- *Interior minimizer, `0 < s* < 1`.* For `s` in a compact subinterval of `(0, 1)`,
  `|p^s q^(1−s) log(q/p)| ≤ C (p + q)` on `S` (with `t = p/q`, `t^s |log t| ≤ C (1 + t)`), so `h`
  is differentiable at `s*` with derivative `−h(s*) E_R[L]`
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) and `L` is `R`-integrable; at the minimum
  the derivative vanishes, so `E_R[L] = 0`, and the strong law under `R` (realized as in 1.3)
  gives `Rⁿ(|Lₙ| ≤ nδ) → 1`.
- *Minimizer `s* = 0`.* Then `h(s*) = Q(S)` and `R = Q(· ∩ S)/Q(S)`. On `Sⁿ`,
  `min(e^a, e^b) ≥ e^b e^(−nδ)` where `Lₙ ≤ nδ`, so `∫ min ≥ Q(S)ⁿ e^(−nδ) Rⁿ(Lₙ ≤ nδ)`. For
  `0 < s ≤ 1`, `(h(s) − h(0))/s = ∫_S q (t^s − 1)/s ≥ 0` with `t = p/q`; as `s ↓ 0`,
  `(t^s − 1)/s` decreases to `log t` and is at most `t − 1`, which is `q`-integrable on `S`, so
  by monotone convergence `∫_S q log(p/q) dμ ≥ 0`, finite: `L` is `R`-integrable with
  `E_R[L] ≤ 0`, and the strong law gives `Rⁿ(Lₙ ≤ nδ) → 1`.
- *Minimizer `s* = 1`* is the same with the roles of `p` and `q` exchanged.
- In each case `liminf (∫ min)^(1/n) ≥ h(s*) e^(−δ)`, and `δ` is arbitrary.

Mutual absolute continuity is not needed: it only guarantees `S` has full measure under both
laws.

*Needs:* 2.1, 2.2; MathematicalStatisticsFoundations 6.2 (`neyman_pearson`) through 2.1; Mathlib
`tendsto_integral_of_dominated_convergence`, `IsCompact.exists_isMinOn`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `IsLocalMin.hasDerivAt_eq_zero`,
`lintegral_tendsto_of_tendsto_of_monotone`, `strong_law_ae`, `Measure.infinitePi`,
`iIndepFun_infinitePi`; Tau Ceti `pi_withDensity`.

**Checks.**

- Swapped pair `P = (1/4, 3/4)`, `Q = (3/4, 1/4)`, equal priors: `Pe(6)^(1/6) = (53/512)^(1/6)`
  is below the limit `√3/2`, since `(53/512)^(1/3) < 3/4` reads `53 · 64 < 27 · 512`; the
  roots approach the coefficient slowly, from below in this example.
- Coefficient not attained: for `P = (1/2, 1/2, 0)`, `Q = (1/4, 1/4, 1/2)` and priors
  `(π₀, π₁)` the least Bayes error is exactly `π₁ 2^(−n)` once `2ⁿ ≥ π₁/π₀` (for equal priors
  from `n = 0`; for `(1/10, 9/10)` from `n = 4`, the values for `n < 4` being `1/10`), so the
  root tends to `1/2`, the infimum over the open interval.
- Mutually singular laws: the least Bayes error is `0` for every `n ≥ 1`, the coefficient `0`.
- The prior must charge both hypotheses: with `π{false} = 0` the Bayes error is `0` for every
  `n`, while the coefficient of the swapped pair is `√3/2`.
- The prior must be finite: with `π{false} = ∞` and `π{true} = 1` the least Bayes error is
  `Qⁿ(pⁿ > 0)`, which is `1` for the swapped pair, whose coefficient is `√3/2`.

### Examples

The swapped pair `(1/4, 3/4)`, `(3/4, 1/4)`: exact Bayes errors, the bound `½ (√3/2)ⁿ`, Chernoff
information `½ log(4/3)` below both divergences `½ log 3`. The pair `(1/2, 1/2, 0)`,
`(1/4, 1/4, 1/2)`: the infimum over the orders is approached at `s → 0` and the Bayes error is
exactly `π₁ 2^(−n)`.

### Dependencies

2.1 uses MathematicalStatisticsFoundations 6.2 and RenyiDivergenceAndPrivacy 1.1, 1.2, 2.1, 2.2,
3.1, 3.2. 2.2 uses 2.1. 2.3 uses 2.1, 2.2 and the strong law; it does not use Layer 1.

## Scope and ownership

This roadmap owns the least type II error at a fixed level for product laws, Stein's lemma with
its weak converse, achievability and strong converse, the Chernoff coefficient, the Hellinger
bound on the Bayes error of product laws and Chernoff's theorem on the Bayes exponent.

Stated by other roadmaps and cited above, not restated: the randomized tests and the
Neyman–Pearson lemma (MathematicalStatisticsFoundations 1.3 and 6.2); the tensorization of the
Kullback–Leibler divergence and its data-processing bound for an event
(MathematicalStatisticsNonparametric 1.3); the Hellinger integral, the Rényi divergence, its
order, its limit at order `1`, data processing and additivity
(RenyiDivergenceAndPrivacy 1.1–3.2). MathematicalStatisticsNonparametric 1.4 owns the least sum
of the two error probabilities of a single pair, `1 − tvDist/2`, and Le Cam's two-sided
comparison with the Hellinger affinity; 2.1 above is the weighted form for products, and 2.2–2.3
concern its rate in `n`, which that roadmap does not state. Its 1.1 and 1.4 together do give
the case `s = 1/2` of 2.2 with unit weights: the least sum of errors over kernel tests is
`1 − tvDist/2` (`iInf_kernel_test_eq_one_sub_tvDist`), which is at most the Hellinger affinity
(`sqHellinger_le_tvDist_le`, with the squared Hellinger distance `2 (1 − affinity)`), and the
affinity of products is the product of the affinities (`hellingerAffinity_pi`); 2.2 is the bound
for every order and every prior. Already in the libraries: the Kullback–Leibler divergence, the
Bayes risk of Mathlib's decision theory, product measures and the strong law of large numbers.

Not treated here: Sanov's theorem, Cramér's theorem and large-deviation principles in general;
Bahadur efficiency of tests; the full trade-off between the two error exponents (Hoeffding's
form) and the information-projection description of the optimal exponents; sequential tests
(Wald's sequential probability ratio test); composite hypotheses and testing with communication
constraints; second-order (central-limit) refinements of Stein's lemma. The routes above use
the law of large numbers and a change of measure only, never a large-deviation principle.

## Exact supplier contracts

### From Mathlib

- `InformationTheory.klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`);
  `klDiv_ne_top_iff`: `klDiv μ ν ≠ ∞ ↔ μ ≪ ν ∧ Integrable (llr μ ν) μ`;
  `toReal_klDiv_of_measure_eq`: for finite `μ ≪ ν` of equal mass,
  `(klDiv μ ν).toReal = ∫ llr μ ν dμ`; `klDiv_self`; `MeasureTheory.llr`.
- `ProbabilityTheory.bayesRisk`, `avgRisk` (`Mathlib/Probability/Decision/Risk/Defs.lean`): the
  infimum over Markov kernels of the prior-averaged risk; `Kernel.boolKernel μ ν`
  (`Mathlib/Probability/Kernel/Basic.lean`), sending `false` to `μ` and `true` to `ν`;
  `Kernel.deterministic`.
- `Measure.pi`, `Measure.pi_pi`, `measurePreserving_piFinSuccAbove`
  (`Mathlib/MeasureTheory/Constructions/Pi.lean`); `MeasurableEquiv.piFinSuccAbove`
  (`Mathlib/MeasureTheory/MeasurableSpace/Embedding.lean`); `Measure.infinitePi`,
  `Measure.infinitePi_map_restrict` (`Mathlib/Probability/ProductMeasure.lean`): the image of the
  infinite product of probability measures under restriction to a finite set is the finite
  product; `iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean`).
- `ProbabilityTheory.strong_law_ae` (`Mathlib/Probability/StrongLaw.lean`): pairwise independent,
  identically distributed, integrable real variables have averages converging almost surely to
  the mean; `tendstoInMeasure_of_tendsto_ae`
  (`Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`).
- `Measure.withDensity_rnDeriv_eq`: `ν.withDensity (dμ/dν) = μ` for `μ ≪ ν`;
  `Measure.rnDeriv_pos`: `dμ/dν > 0` `μ`-almost everywhere for `μ ≪ ν`;
  `Measure.rnDeriv_mul_rnDeriv`: the chain rule for densities
  (`Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`).
- `Real.geom_mean_le_arith_mean2_weighted` (`Mathlib/Analysis/MeanInequalities.lean`);
  `tendsto_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`);
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean`); `IsCompact.exists_isMinOn`.

### From Tau Ceti

- `TauCeti.pi_withDensity` (`TauCeti/MeasureTheory/Measure/PiWithDensity.lean`): for σ-finite
  factors and measurable densities, `Measure.pi (fun i ↦ (μ i).withDensity (f i))` is
  `(Measure.pi μ).withDensity fun x ↦ ∏ i, f i (x i)`; `Measure.AbsolutelyContinuous.pi` (same
  file): finite products preserve absolute continuity.
- `TauCeti.klDiv_prod_prod_eq_add` (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`):
  `klDiv (μ.prod μ') (ν.prod ν') = klDiv μ ν + μ univ * klDiv μ' ν'` for finite `μ`, `ν` and
  probability measures `μ'`, `ν'`.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 1.3, `IsStatisticalTest` (copied verbatim): a measurable `φ : X → ℝ` with `φ x ∈ [0, 1]`.
- 6.2, `neyman_pearson`: for finite measures `P`, `Q`, `t > 0` and `η ∈ [0, 1]`,
  `npTest P Q t η` minimizes `npSumError P Q t T = ∫ T dP + t ∫ (1 − T) dQ` over measurable
  `[0, 1]`-valued `T` (`IsMinOn`), where `npTest P Q t η` is `1` where `dP/d(P+Q) = 0` or the
  likelihood ratio `npLikelihoodRatio P Q` exceeds `t⁻¹`, `η` where it equals `t⁻¹`, and `0`
  elsewhere.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 1.3, `klDiv_pi`: `klDiv (Measure.pi P) (Measure.pi Q) = Σ i, klDiv (P i) (Q i)` for families
  of probability measures indexed by `Fin n`.
- 1.3, `ofReal_klBin_le_klDiv`: for probability measures and a measurable set `A`,
  `ENNReal.ofReal (klBin (P.real A) (Q.real A)) ≤ klDiv P Q`, with
  `klBin a b = a log(a/b) + (1 − a) log((1 − a)/(1 − b))`.

### From TauCetiRoadmap.RenyiDivergenceAndPrivacy

- 1.1, `hellingerIntegral` (copied verbatim): `∫⁻ (dP/d(P+Q))^α (dQ/d(P+Q))^(1−α) d(P + Q)` in
  `ℝ≥0∞`.
- 1.2, `renyiDiv`: `∞` when the Hellinger integral is `0` or `∞`, otherwise
  `ENNReal.ofReal (log H / (α − 1))`.
- 2.1, `tendsto_renyiDiv_nhdsLT_one`: for probability measures, `renyiDiv α P Q → klDiv P Q` as
  `α ↑ 1`.
- 2.2, `renyiDiv_le_renyiDiv_of_le`: for probability measures and `0 < α ≤ β`, both different
  from `1`, `renyiDiv α P Q ≤ renyiDiv β P Q`.
- 3.1, `renyiDiv_comp_le`: for probability measures, a Markov kernel `κ` and an order `α` with
  `0 < α` and `α ≠ 1`, `renyiDiv α (κ ∘ₘ P) (κ ∘ₘ Q) ≤ renyiDiv α P Q`.
- 3.2, `renyiDiv_prod`: for probability measures and an order `α` with `0 < α` and `α ≠ 1`,
  `renyiDiv α (P.prod P') (Q.prod Q') = renyiDiv α P Q + renyiDiv α P' Q'`.

## References

- Y. Polyanskiy and Y. Wu, *Information Theory: From Coding to Learning*, Cambridge University
  Press, 2025, doi:10.1017/9781108966351; cited by the theorem, equation and page numbers of the
  authors' prepublication version of 16 August 2024 at
  <https://people.lids.mit.edu/yp/homepage/data/itbook-export.pdf>: §14.1–14.5 (Definition 14.1,
  Theorems 14.3, 14.8, 14.10, 14.11, 14.14, Lemma 14.9, Corollary 14.12, Definition 14.13),
  §16.1 (Theorem 16.1, Remark 16.1, Corollary 16.2).

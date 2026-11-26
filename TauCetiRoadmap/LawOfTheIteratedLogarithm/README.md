# Roadmap: the law of the iterated logarithm

**Summary.** By the strong law of large numbers, a sum `S_n` of `n` independent centred variables
is small compared with `n`; by the central limit theorem it is typically of order `√n`. Neither
says how far `S_n` strays along a single sample path. The law of the iterated logarithm answers
that question exactly: the largest fluctuations, measured on the scale `√(2 n log log n)`, come
arbitrarily close to that scale infinitely often and exceed it by a fixed factor only finitely
often. This roadmap proves the classical laws for partial sums of real random variables that are
independent but need not be identically distributed, and then for independent and identically
distributed ones.

The headline theorems are these.

- *Kolmogorov's lower exponential bound.* Let the summands be independent and centred, bounded by
  `M`, with variances adding up to `B`. If `x > 0`, `xM/B < 1/256`, `x²/B > 512` and `ε ≤ 1`, then
  `P(S > x)` exceeds `exp(−(x²/2B)(1 + ε))`, where `ε` is an explicit function of `xM/B` and
  `x²/B` that is small when the first is small and the second is large. Together with Bernstein's
  upper bound this pins the tail of `S` at the Gaussian rate.
- *Kolmogorov's law of the iterated logarithm.* Let `X_1, X_2, …` be independent and centred, let
  `B_n` be the variance of `S_n`, and suppose that `B_n → ∞` and that `|X_n| ≤ m_n` almost surely
  with constants `m_n = o(√(B_n / log log B_n))`. Then, almost surely, the upper limit of
  `S_n / √(2 B_n log log B_n)` is `1` and its lower limit is `−1`. Khinchin's law, for sums of
  independent signs `±1` with probability one half each, is the case `B_n = n`.
- *The Hartman–Wintner law and its cluster set.* If `X_1, X_2, …` are independent and identically
  distributed with mean `0` and finite variance `σ²`, then almost surely the upper and lower
  limits of `S_n / √(2 n log log n)` are `σ` and `−σ`, and the set of its limit points is the
  whole interval `[−σ, σ]`. No boundedness is assumed.

The roadmap builds on Mathlib's independence, its Borel–Cantelli lemmas and its maximal
inequality for submartingales, and on Tau Ceti's Bernstein inequality and Rademacher law.
StochasticCalculus proves the law of the iterated logarithm for Brownian motion; the laws here
are about discrete sums and are proved without embedding the sums in a Brownian motion.
MathematicalStatisticsAsymptotic names the absence of a law of the iterated logarithm as the
obstacle to the Bahadur–Kiefer theorem; this roadmap supplies the scalar laws, not the
empirical-process form that theorem needs.

Layer 1 below proves Kolmogorov's lower exponential bound. Layer 2 uses it, with Bernstein's
upper bound, for Kolmogorov's law and Khinchin's law. Layer 3 proves the Hartman–Wintner law by
truncating the summands and applying the bounds of Layer 1 to the bounded parts, and deduces the
cluster set.

## Conventions

- **Probability space.** `P` is a probability measure on a measurable space `Ω`. Random variables
  are real valued; a family `X` is independent in the sense of Mathlib's `iIndepFun X P`.
  Independence and the hypotheses below are stated for the whole sequence; only almost
  everywhere measurability is assumed.
- **Partial sums.** `S_n = ∑_{i < n} X_i`, written `∑ i ∈ Finset.range n, X i ω`, so that `S_0 = 0`
  and `S_n` has `n` terms; the summands are indexed from `0`. For centred summands,
  `B_n = ∑_{i < n} E[X_i²]` is the variance of `S_n`.
- **The normalising function.** `iteratedLogScale v = √(2 v log log v)`, with Mathlib's
  logarithm (`log 0 = 0`, `log v = log |v|` for `v < 0`) and square root (`0` on negative
  arguments). On `v ≥ 0`, the only arguments the statements below use, it is positive for
  `v > e`, it is `0` for `v = 0` and for `1/e ≤ v ≤ e`, and a quotient by `0` is `0`; for
  `0 < v < 1/e` it takes a positive junk value, since then `log log v = log |log v| > 0`. (On
  negative arguments it is not identically `0`: `iteratedLogScale (−2) = √(4 log (1/log 2)) =
  1.2108…`.) Every statement below uses it along a sequence `v_n → ∞`, so
  these junk values occur at finitely many indices and change no upper or lower limit and no
  cluster point.
- **Upper and lower limits.** Upper and lower limits along `atTop` are taken in `EReal`, of the
  real sequence coerced to `EReal`. In `ℝ`, Mathlib's `limsup` of a sequence that is not bounded
  above is `0` (the infimum of the empty set), so a statement "the upper limit is `0`" in `ℝ`
  would also hold for unbounded sequences; in `EReal` there is no junk value.
- **Cluster points.** `c` is a limit point of a sequence `u` when `MapClusterPt c atTop u`: every
  neighbourhood of `c` contains `u_n` for infinitely many `n`.

**Checks.**
- `iteratedLogScale 3 = √(6 log log 3) = 0.7512…` (`log log 3 = 0.0940…`);
  `iteratedLogScale (e^e) = √(2 e^e) = 5.5053…`; `iteratedLogScale e = iteratedLogScale 2 = 0`;
  the junk value `iteratedLogScale 0.01 = √(0.02 log log 100) = 0.1747…`.
  At `n = 10⁶`, `√(2n log log n) = 2291.6…`, about `2.29` standard deviations `√n = 1000` of a
  sum of `10⁶` signs.
- The sequence `u_n = n` has upper limit `⊤` in `EReal`, while Mathlib's `limsup` in `ℝ` returns
  `0` for it; the `EReal` convention tells the two apart.

## Layer 1: Kolmogorov's lower exponential bound

### 1.1 The lower exponential bound

Define `kolmogorovEpsilon w l = max (32 √(log l / l)) (64 √w)`. Prove
`kolmogorov_lower_exponential_bound`: let `X_i`, `i ∈ s` (a finite set), be independent, almost
everywhere measurable and centred, with `|X_i| ≤ M` almost surely, and let
`B = ∑_{i ∈ s} E[X_i²]`. If `x > 0`, `ω = xM/B < 1/256`, `λ = x²/B > 512` and `ε ≤ 1`, then

    P(∑_{i ∈ s} X_i > x) > exp(−(x² / 2B) (1 + ε)),   ε = max(32 √(log λ / λ), 64 √ω)

(Kolmogorov 1929, Hilfssatz IV, statement p. 128, proof pp. 128–131). Since `B ≥ 0` and
`x²/0 = 0`, the hypothesis `λ > 512` forces `B > 0`. The hypothesis `ε ≤ 1` says that
`ω ≤ 1/4096` and `log λ / λ ≤ 1/1024`. It is not in Kolmogorov's statement, which has only
`ω < 1/256` and `λ > 512`, hence `ε < 4`; but the last step of his proof (p. 131) passes from the
exponent `(x²/(2B(1 − δ)²))(1 + 4δ)`, `δ = ε/8`, to `(x²/2B)(1 + 8δ)`, which needs
`(1 + 4δ)/(1 − δ)² ≤ 1 + 8δ`, that is `8δ² − 15δ + 2 ≥ 0`, true exactly for
`δ ≤ (15 − √161)/16 = 0.1444…` on `0 < δ < 1/2`. With `ε ≤ 1`, `δ ≤ 1/8` and the step reads
`1.959… ≤ 2`. The laws of Layers 2 and 3 use the bound only with `ε` small.

Route (Kolmogorov's): tilt by `a = x / (B(1 − δ))` with `δ = ε/8`. A pointwise lower bound for
`exp(a X_i)` gives `E exp(aS) > exp((a²B/2)(1 − δ²/4))`; write `E exp(aS)` as
`a ∫ exp(ay) P(S > y) dy` over the real line (layer-cake formula), split the integral at `0`,
`aB(1 − δ)`, `aB(1 + δ)` and `8aB`, and bound the four outer pieces: on the negative half-line
by `P(S > y) ≤ 1`, and elsewhere by the upper tail bounds below (the third of them for
`y ≥ B/M`). What remains is the integral over `[aB(1 − δ), aB(1 + δ)]`, which is at most
`2a²B exp(a²B(1 + δ)) P(S > x)`; comparing gives `P(S > x) > exp(−(a²B/2)(1 + 4δ))`, and
`a²B = x²/(B(1 − δ)²)` with `(1 + 4δ)/(1 − δ)² ≤ 1 + 8δ` for `δ ≤ 1/8` gives the bound.
The upper tail bounds used are Kolmogorov's Hilfssätze I–III (pp. 127–128): for `xM ≤ B`,
`P(S > x) < exp(−(x²/2B)(1 − xM/2B))` and `P(S > x) < exp(−x²/4B)`; for `xM ≥ B`,
`P(S > x) < exp(−x/4M)`. Their forms with `≤`, which the route needs, follow from Tau Ceti's
Bernstein inequality, whose exponent `x²/(2(B + Mx/3))` is at least each of `(x²/2B)(1 − xM/2B)` and
`x²/4B` when `xM ≤ B`, and at least `x/4M` when `xM ≥ B`.

**Checks.**
- Rademacher sums: `X_i = ±1` with probability `1/2`, `n = 2.5·10¹¹` terms, `x = 5·10⁷`. Then
  `B = n`, `M = 1`, `ω = 0.0002 ≤ 1/4096 = 0.00024…`, `λ = 10⁴`, `ε = 0.9711…` (the term
  `32 √(log λ / λ) = 0.9711…` dominates `64 √ω = 0.9050…`), and the bound is `exp(−9855.7…)`,
  while the exact binomial tail is `P(S > x) = exp(−5005.5…)`.
- Centred Bernoulli variables `X_i = ξ_i − p` with `p = 0.1`, `n = 2.5·10¹²`, `x = 5·10⁷`:
  `B = 2.25·10¹¹`, `M = 0.9`, `ω = 0.0002`, `λ = 11111.1…`, `ε = 0.9265…`, bound
  `exp(−10703.1…)`, while the exact binomial tail is `exp(−5560.8…)`.
- Where `1 < ε < 4` the bound is not proved here. For `n = 4·10⁷` Rademacher terms and
  `x = 1.5·10⁵`, `ω = 0.00375 < 1/256`, `λ = 562.5 > 512` and `ε = 3.919…`: the stated form would
  be `exp(−1383.5…)`, the argument above gives only `exp(−3198.9…)`, and the exact tail is
  `exp(−285.3…)`.
- The condition on `λ` is needed: for `n = 100` Rademacher terms and `x = 0.1`, `λ = 10⁻⁴`, the
  right-hand side is `0.9998…` while `P(S > 0.1) = P(S ≥ 2) = 0.4602…`.
- The condition on `ω` is needed: for one Rademacher term and `x = 30`, `λ = 900 > 512` but
  `ω = 30`; the bound is a positive number while `P(S > 30) = 0`.

*Needs:* Mathlib `iIndepFun`, `mgf`, `lintegral_comp_eq_lintegral_meas_lt_mul`,
`measure_ge_le_exp_mul_mgf`; Tau Ceti `iIndepFun.measureReal_sum_ge_le_of_ae_le`. (Kolmogorov
1929, Hilfssatz IV.)

### Examples

Rademacher sums and centred Bernoulli sums at the moderate-deviation levels of the Checks of 1.1.

### Dependencies

Mathlib `iIndepFun`, `mgf`, `lintegral_comp_eq_lintegral_meas_lt_mul`,
`measure_ge_le_exp_mul_mgf`; Tau Ceti `iIndepFun.measureReal_sum_ge_le_of_ae_le`. No other
layer.

## Layer 2: Kolmogorov's law and Khinchin's law

### 2.1 Kolmogorov's law of the iterated logarithm

Prove `kolmogorov_lil`: let `X_n`, `n ∈ ℕ`, be independent, almost everywhere measurable and
centred, let `m_n` be real numbers with `|X_n| ≤ m_n` almost surely, and let
`B_n = ∑_{i < n} E[X_i²]`. Suppose

- `B_n → ∞`, and
- `m_n / √(B_{n+1} / log log B_{n+1}) → 0` (the bound on the summand `X_n` is compared with the
  variance `B_{n+1}` of the first sum that contains it).

Then almost surely the upper limit of `S_n / iteratedLogScale B_n` is `1` and its lower limit is
`−1` (Kolmogorov 1929, conditions I and II and display (2), p. 126; the upper half is §2,
pp. 132–133, and the lower half §3, pp. 133–135). Kolmogorov states the upper limit; the lower
limit is the upper limit for the family `−X_n`, which satisfies the same hypotheses.

Route (Kolmogorov's, with Doob's maximal inequality in place of his Hilfssatz V). Fix `δ > 0`.
*Upper half:* choose indices `n_k` along which `B_{n_k}` grows geometrically with ratio close
to `1 + δ/4`. For `a > 0` the process `exp(a S_n)` is a nonnegative submartingale for the
filtration generated by the `X_i` (its increments are independent and `E exp(aY) ≥ 1` for a
centred `Y`), so Doob's maximal inequality bounds `P(max_{n ≤ n_k} S_n > t)` by
`exp(−at) E exp(a S_{n_k})`; Bernstein's bound on the moment generating function and the choice
of `a` give probabilities whose sum over `k` converges, and the first Borel–Cantelli lemma gives
`S_n ≤ (1 + δ) iteratedLogScale B_n` eventually. *Lower half:* choose `n_k` with `B_{n_k}` growing
geometrically with a large ratio. The block sums `S_{n_k} − S_{n_{k−1}}` are independent, and 1.1
applied to each block, whose summands are bounded by `max_{i < n_k} m_i`, gives probabilities of
exceeding `(1 − δ) iteratedLogScale(B_{n_k} − B_{n_{k−1}})` whose sum diverges; the second
Borel–Cantelli lemma and the upper half applied to `−S_{n_{k−1}}` give
`S_{n_k} > (1 − 2δ) iteratedLogScale B_{n_k}` infinitely often. The mutual independence of the
countably many block events, which read disjoint blocks of an independent family, is proved
inside this route.

**Checks.**
- Weighted signs: `X_n = (n + 1)^α ε_n` with independent signs `ε_n` and `α ≥ 0`. Then
  `B_n = ∑_{k ≤ n} k^(2α)`, which grows like `n^(2α+1)/(2α + 1)`, and with `m_n = (n + 1)^α` the
  ratio in the second hypothesis is of order `√(log log n / n)`; for `α = 1` it is `0.0944…` at
  `n = 10³` and `0.00333…` at `n = 10⁶`. So the law holds for these unequal weights.
- The growth condition cannot be dropped. For `X_n = 2^n ε_n`, `B_n = (4^n − 1)/3 → ∞` but
  `m_n / √(B_{n+1}/log log B_{n+1})` grows (`1.41…` at `n = 10`, `1.88…` at `n = 80`). Here
  `|S_n| ≤ 2^n − 1` surely, and `(2^n − 1)/iteratedLogScale B_n` decreases to `0` (`0.767…` at
  `n = 10`, `0.565…` at `n = 80`), so the upper limit is `0`, not `1`.
- The condition `B_n → ∞` cannot be dropped: for `X_n = 2^(−n) ε_n`, `B_n` stays below `4/3` and
  `iteratedLogScale B_n = 0` for every `n`, so every quotient is `0`.

*Needs:* 1.1; Mathlib `iIndepFun`, `maximal_ineq`, `Submartingale`,
`iIndepFun.condExp_natural_ae_eq_of_lt`, `measure_limsup_atTop_eq_zero`,
`measure_limsup_eq_one`; Tau Ceti `iIndepFun.mgf_sum_le_exp_of_ae_le`. (Kolmogorov 1929.)

### 2.2 Khinchin's law of the iterated logarithm

Prove `khinchin_lil`: if the `X_n` are independent and each has Tau Ceti's Rademacher law
`rademacherMeasure` (the values `1` and `−1` with probability `1/2` each), then almost surely the
upper limit of `S_n / √(2 n log log n)` is `1` and the lower limit is `−1` (Khinchin, 1924, for
Bernoulli trials; Kolmogorov 1929, p. 126, credits him with important special cases of the
law).

Route: 2.1 with `m_n = 1` and `B_n = n`, by Tau Ceti's `integral_id_rademacherMeasure` and
`variance_id_rademacherMeasure`; the second hypothesis of 2.1 reads
`1/√((n + 1)/log log (n + 1)) → 0`. A direct proof with Mathlib's Hoeffding inequality in place of
Bernstein's and the binomial distribution in place of 1.1 avoids the general bounds.

**Checks.**
- The law is not that of the central limit theorem: `S_n/√n` has upper limit `+∞` almost surely
  under the same hypotheses, since `√(2 log log n) → ∞`.
- At `n = 10⁶` the normalisation is `2291.6…` against the standard deviation `1000`.

*Needs:* 2.1; Mathlib `HasLaw`; Tau Ceti `rademacherMeasure`, `integral_id_rademacherMeasure`,
`variance_id_rademacherMeasure`. (Khinchin, 1924.)

### Examples

Weighted sums of signs with polynomial weights, which satisfy the hypotheses of 2.1, and with
doubling weights, which do not and for which the conclusion fails; sums of signs.

### Dependencies

Layer 1 (1.1, in the lower half of 2.1); Mathlib `iIndepFun`, `HasLaw`, `maximal_ineq`,
`Submartingale`, `iIndepFun.condExp_natural_ae_eq_of_lt`, `measure_limsup_atTop_eq_zero`,
`measure_limsup_eq_one`; Tau Ceti `iIndepFun.mgf_sum_le_exp_of_ae_le`, `rademacherMeasure`,
`integral_id_rademacherMeasure`, `variance_id_rademacherMeasure`.

## Layer 3: the Hartman–Wintner law

### 3.1 The Hartman–Wintner law

Prove `hartman_wintner`: if the `X_n` are independent and identically distributed (Mathlib's
`IdentDistrib (X n) (X 0) P P`) with `X_0` square integrable and `E[X_0] = 0`, and
`σ = √(E[X_0²])`, then almost surely the upper limit of `S_n / √(2 n log log n)` is `σ` and the
lower limit is `−σ` (Durrett, Theorem 8.5.2, p. 418, which states the upper limit for
`E[X_0²] = 1`; the lower limit is the upper limit for `−X_n`, the general case follows by scaling
for `σ > 0`, and for `σ = 0` every `S_n` vanishes almost surely). The theorem
is due to Hartman and Wintner (1941).

Route, without the Skorokhod embedding that Durrett uses. Assume `σ > 0` and fix `η > 0`. Write
`X_k = Y_k + Z_k`, where `Y_k` is `X_k` truncated at `η √(k / log log k)` and recentred.
*Bounded part:* `|Y_k| ≤ 2η √(n / log log n)` for `k ≤ n` large, and `E[Y_k²] → σ²`. The
arguments of 2.1 apply with this bound in place of the `o`-condition, now with the error terms
of Bernstein's bound and of 1.1 controlled by `η` instead of tending to `0`: the upper limit of
`∑_{k < n} Y_k / √(2 n log log n)` lies between `σ(1 − c(η))` and `σ(1 + c(η))` with
`c(η) → 0` as `η → 0`. *Remainder:* `E[X_0²] < ∞` gives
`∑_k E[|X_k| ; |X_k| > η √(k / log log k)] / √(k log log k) < ∞`, so the series
`∑_k |Z_k| / √(k log log k)` converges almost surely; a summation by parts (Kronecker's argument,
carried out inside this proof) turns this into `∑_{k < n} Z_k = o(√(n log log n))` almost surely.
Letting `η → 0` along a sequence gives the theorem; the lower limit is the upper limit for `−X`.
A different proof, based on an exponential inequality, is de Acosta's (1983).

**Checks.**
- Sums of independent signs: `σ = 1`, and 3.1 agrees with 2.2.
- `σ = 0`: `X_n = 0` almost surely, every quotient is `0`, and both limits are `0`.
- Finite variance cannot be weakened to a lower moment: if `E|X_0|^α = ∞` for some `α < 2`, the
  upper limit of `|X_n| / n^(1/α)` is `+∞` almost surely, so `S_n / √(2 n log log n)` is unbounded
  (Durrett, Exercise 8.5.1, p. 419). A symmetric law with density proportional to `|x|^(−5/2)` on
  `|x| > 1` has `E|X| < ∞` and `E|X|^(3/2) = ∞`.
- No boundedness is assumed, so 3.1 is not a case of 2.1: a centred Gaussian law satisfies 3.1
  and has no almost sure bound `m_n`.

*Needs:* 1.1; Mathlib `iIndepFun`, `IdentDistrib`, `IdentDistrib.comp`, `iIndepFun.comp`,
`MemLp`, `maximal_ineq`, `Submartingale`, `iIndepFun.condExp_natural_ae_eq_of_lt`,
`measure_limsup_atTop_eq_zero`, `measure_limsup_eq_one`; Tau Ceti
`iIndepFun.mgf_sum_le_exp_of_ae_le`. (Durrett, Theorem 8.5.2; Hartman and Wintner, 1941.)

### 3.2 The cluster set

Prove `hartman_wintner_clusterPt`: under the hypotheses of 3.1, almost surely, for every real
`c`, `c` is a limit point of `S_n / √(2 n log log n)` if and only if `−σ ≤ c ≤ σ` (Durrett,
Exercise 8.5.2, p. 419, where it is stated as an exercise, for `σ = 1`; it also follows from
Strassen's invariance principle, which Durrett states without proof as Theorem 8.5.3, p. 419,
attributing it to Strassen (1964), by evaluating the limit functions at time `1`).

Route: by 3.1 the upper and lower limits are `σ` and `−σ`, so every limit point lies in
`[−σ, σ]` and `±σ` are limit points. The successive differences of the sequence tend to `0`
almost surely: `X_n / √n → 0` by the first Borel–Cantelli lemma, since
`∑_n P(X_0² > ε² n) ≤ E[X_0²]/ε² < ∞`, the quotients stay bounded by 3.1, and
`√(2 n log log n)/√(2 (n+1) log log (n+1)) → 1`. A
real sequence whose differences tend to `0` has a connected set of limit points, so every point
between `−σ` and `σ` is one.

**Checks.**
- The interval cannot be replaced by `{−σ, σ}`: for sums of signs, with `a_n = √(2 n log log n)`
  and `u_n = S_n / a_n`, each step satisfies `|u_{n+1} − u_n| ≤ 1/a_{n+1} + |u_n| (1 − a_n/a_{n+1})`,
  which tends to `0` because `u_n` stays bounded; so the sequence cannot jump from near `1` to near
  `−1`, and `0` is a limit point. The step is not bounded by `1/a_n` alone: at `n = 1000`,
  `S_n = 30` and `X_n = −1` it is `0.01633…` against `1/a_n = 0.01608…`.
- `σ = 0`: the sequence is `0` from the first index on, and its only limit point is `0`.

*Needs:* 3.1; Mathlib `MapClusterPt`, `measure_limsup_atTop_eq_zero`, `IdentDistrib`. (Durrett,
Exercise 8.5.2.)

### Examples

Sums of signs (`σ = 1`) and of standard Gaussian variables; the degenerate case `σ = 0`; a
symmetric law with infinite moment of order `3/2`, for which the conclusion fails.

### Dependencies

Layer 1 (1.1, for the bounded parts in 3.1); Mathlib `iIndepFun`, `IdentDistrib`,
`IdentDistrib.comp`, `iIndepFun.comp`, `MemLp`, `maximal_ineq`, `Submartingale`,
`iIndepFun.condExp_natural_ae_eq_of_lt`, `measure_limsup_atTop_eq_zero`,
`measure_limsup_eq_one`, `MapClusterPt`; Tau Ceti `iIndepFun.mgf_sum_le_exp_of_ae_le`. Layer 2
is not used: 3.1 repeats the block arguments of 2.1 for truncated variables.

## Downstream consumers

- MathematicalStatisticsAsymptotic lists the Bahadur–Kiefer theorem beyond its scope because no
  law of the iterated logarithm was available. That theorem needs the law of the iterated
  logarithm for the oscillation modulus of the uniform empirical process, which is not stated
  here; the scalar laws above are its starting point.

## Scope and ownership

This roadmap owns Kolmogorov's lower exponential bound (1.1), Kolmogorov's and Khinchin's laws of
the iterated logarithm (2.1, 2.2), the Hartman–Wintner law (3.1) and its cluster set (3.2), and
the normalising function `iteratedLogScale` and the constant `kolmogorovEpsilon`.

Already in the libraries and therefore not targets:

- Kolmogorov's upper exponential bounds (his Hilfssätze I–III, with `≤`) follow from Bernstein's
  inequality in Tau Ceti (`TauCeti/Probability/Moments/Bernstein.lean`), as the route of 1.1
  explains; Mathlib has Hoeffding's inequality for sub-Gaussian summands.
- The strong law of large numbers (Mathlib `strong_law_ae_real`), both Borel–Cantelli lemmas, and
  Doob's maximal inequality (Mathlib `maximal_ineq`).

Neighbouring results:

- StochasticCalculus §6.3 states the law of the iterated logarithm for Brownian motion
  (`brownian_lil`) and its local form; nothing here is about Brownian motion, and no route here
  uses Brownian motion or the Skorokhod embedding.
- The Lévy–Ottaviani inequality, Lévy's maximal inequalities for symmetric summands, Kronecker's
  lemma and Kolmogorov's strong law with norming constants are not treated here: the routes above
  use Doob's maximal inequality instead of those inequalities, and carry out the summation by
  parts of 3.1 directly.
- Cramér's theorem, the exponential rate of `P(S_n ≥ n a)` at a fixed level `a` for identically
  distributed summands, is not treated here. 1.1 is a different statement: a nonasymptotic bound
  at levels of order `√(B log log B)` for summands that need not be identically distributed.

Outside the scope: Strassen's functional law of the iterated logarithm and its converse, laws
for martingales, for vectors and in Banach spaces, Chung's law for the maximum, the
Erdős–Feller–Kolmogorov–Petrovsky integral test, and the laws for empirical processes.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun` (mutual
  independence of a family of random variables) and `ProbabilityTheory.iIndepFun.comp`
  (measurable functions of the members of an independent family are independent).
- `Mathlib/Probability/BorelCantelli.lean`: `ProbabilityTheory.measure_limsup_eq_one` (second
  Borel–Cantelli lemma: measurable independent sets with divergent sum of measures occur
  infinitely often with probability one) and
  `ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt` (for an independent family, the
  conditional expectation of a later member given the natural filtration at an earlier time is
  its mean).
- `Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean`:
  `MeasureTheory.measure_limsup_atTop_eq_zero` (first Borel–Cantelli lemma: sets with finite sum
  of measures occur infinitely often on a null set).
- `Mathlib/Probability/Martingale/OptionalStopping.lean`: `MeasureTheory.maximal_ineq` (Doob's
  maximal inequality for a nonnegative submartingale on a finite measure space);
  `Mathlib/Probability/Martingale/Basic.lean`: `MeasureTheory.Submartingale`.
- `Mathlib/Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf` and
  `ProbabilityTheory.measure_ge_le_exp_mul_mgf` (Chernoff's bound `P(X ≥ ε) ≤ e^(−tε) E e^(tX)`
  for `t ≥ 0` when `e^(tX)` is integrable).
- `Mathlib/MeasureTheory/Integral/Layercake.lean`:
  `MeasureTheory.lintegral_comp_eq_lintegral_meas_lt_mul` (the layer-cake formula for
  `∫ G(f) dμ` with `G` the integral of a nonnegative `g`).
- `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib` and
  `ProbabilityTheory.IdentDistrib.comp` (measurable images of identically distributed variables
  are identically distributed). `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw`.
  `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean`: `MeasureTheory.MemLp`.
- `Mathlib/Topology/Defs/Filter.lean`: `MapClusterPt` (a point every neighbourhood of which the
  sequence visits frequently).
- Named in Scope only: `ProbabilityTheory.strong_law_ae_real`
  (`Mathlib/Probability/StrongLaw.lean`) and
  `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`
  (`Mathlib/Probability/Moments/SubGaussian.lean`, Hoeffding's inequality).

### From Tau Ceti

- `TauCeti/Probability/Moments/Bernstein.lean`:
  `ProbabilityTheory.iIndepFun.measureReal_sum_ge_le_of_ae_le` (Bernstein's inequality: for
  independent centred square-integrable `X_i ≤ b`, `P(∑ X_i ≥ ε) ≤ exp(−ε²/(2(v + bε/3)))` with
  `v = ∑ E[X_i²]`, for `ε ≥ 0`) and `ProbabilityTheory.iIndepFun.mgf_sum_le_exp_of_ae_le` (under
  the same hypotheses, `E exp(t ∑ X_i) ≤ exp(v t²/(2(1 − tb/3)))` for `t ≥ 0` with `tb < 3`).
- `TauCeti/Probability/Distributions/Rademacher/Basic.lean`:
  `TauCeti.Probability.rademacherMeasure` (the law with mass `1/2` at each of `−1` and `1`),
  `TauCeti.Probability.integral_id_rademacherMeasure` (its mean is `0`) and
  `TauCeti.Probability.variance_id_rademacherMeasure` (its variance is `1`).

## References

- A. Kolmogoroff, *Über das Gesetz des iterierten Logarithmus*, Mathematische Annalen 101 (1929),
  126–135; scan at the Göttinger Digitalisierungszentrum (GDZ), read for the conditions and
  display (2) on p. 126, the Hilfssätze I–V on pp. 127–131 and the proof in §§2–3 on
  pp. 132–135.
- Rick Durrett, *Probability: Theory and Examples*, version 5 of 11 January 2019
  (`PTE5_011119.pdf`, from the author's page at Duke University): §8.5, Theorem 8.5.1 (p. 416,
  Brownian motion), Theorem 8.5.2 (p. 418), Theorem 8.5.3 (p. 419), Exercises 8.5.1 and 8.5.2
  (p. 419).
- Attributions made in prose without a locator: A. Khintchine, *Über einen Satz der
  Wahrscheinlichkeitsrechnung*, Fundamenta Mathematicae 6 (1924), 9–20 (the law for Bernoulli
  trials); P. Hartman and A. Wintner, *On the law of the iterated logarithm*, American Journal of
  Mathematics 63 (1941) (the law for identically distributed summands); A. de Acosta, *A new
  proof of the Hartman–Wintner law of the iterated logarithm*, Annals of Probability 11 (1983)
  (a proof based on an exponential inequality); V. Strassen (1964, 1965) for the invariance
  principle and the converse.

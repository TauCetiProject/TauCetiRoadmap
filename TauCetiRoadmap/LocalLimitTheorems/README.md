# Roadmap: local limit theorems

**Summary.** The central limit theorem says that the distribution function of a normalized sum
`(Sₙ − n m)/√n` of independent identically distributed summands with mean `m` and finite variance
`σ²` converges to the normal one. A local limit theorem says more: that the individual
probabilities `P(Sₙ = k)` of an integer-valued sum, or the density of a sum with a density, are
close to the normal density itself, uniformly over the whole line. This roadmap proves the two
classical local limit theorems of Gnedenko and the local de Moivre–Laplace theorem. Throughout, the
summands are independent and identically distributed, and no rate of convergence is claimed.
Gnedenko's two theorems need no moment hypothesis: when the second moment is infinite they say
that the local probabilities, or the densities, of `Sₙ/√n` tend to `0` uniformly.

The headline theorems are these.

- *Gnedenko's lattice local limit theorem.* If the summands are integer valued and their common
  law is carried by no coset `b + hℤ` with `h ≥ 2`, then, uniformly in the integer `k`,
  `√n · P(Sₙ = k) − (2πσ²)^(−1/2) exp(−(k − n m)²/(2nσ²)) → 0`, where `m` is the mean and `σ²` the
  variance; if the second moment is infinite, `√n · P(Sₙ = k) → 0` uniformly in `k`.
- *The local de Moivre–Laplace theorem.* For `0 < p < 1` and every `A`, the ratio of
  `P(Bin(n, p) = k)` to the normal density with mean `n p` and variance `n p (1 − p)` at `k` tends
  to `1`, uniformly over the integers `k` with `|k − n p| ≤ A √n`.
- *The smoothing condition.* Some power `|φ|^ν` of the characteristic function `φ` of a summand is
  integrable if and only if some partial sum `Sₙ` has a bounded density.
- *Gnedenko's local limit theorem for densities.* If `|φ|^ν` is integrable, then for `n ≥ ν` the
  normalized sum `(Sₙ − n m)/√n` has a continuous density, given by Fourier inversion, and these
  densities converge to the normal density with mean `0` and variance `σ²` uniformly on the line;
  if the second moment is infinite, they converge to `0` uniformly.

The roadmap builds on Mathlib's characteristic functions, its Taylor expansion of a characteristic
function at the origin and its central limit theorem, whose proof the local theorems refine; on
Mathlib's binomial law and its Wallis product; and on Tau Ceti's Fourier inversion theorem for
laws on the line with integrable characteristic function, which supplies the densities of Layer 3.
MarkovChainsAndRenewal treats lattice laws on the half-line for the renewal theorem; its notion of
span differs from the one here and nothing passes between the two.

Layer 1 below defines integer laws of maximal span one and proves the lattice local limit
theorem, through the characteristic function of such a law and Fourier inversion on the integers.
Layer 2 deduces the local de Moivre–Laplace theorem. Layer 3, which uses no other layer, proves the
smoothing condition and the local limit theorem for densities.

## Conventions

- **Summands.** `(Ω, P)` is a probability space and `X : ℕ → Ω → ℤ` or `X : ℕ → Ω → ℝ` a sequence of
  random variables that are mutually independent (Mathlib's `iIndepFun`) and identically
  distributed with `X 0` (Mathlib's `IdentDistrib`). The partial sums are
  `Sₙ = ∑ i ∈ Finset.range n, X i`, so `S₀ = 0`. A finite second moment is Mathlib's
  `MemLp (X 0) 2 P` (for integer summands, of the real cast). The mean is `m = P[X 0]` and the
  variance `σ² = Var[X 0; P]`, both of the real cast. Both are total: `P[X 0] = 0` when `X 0` is not
  integrable, and `Var[X 0; P] = 0` when the second moment is infinite (Mathlib's `variance` is the
  extended variance `evariance` sent to `ℝ` by `ENNReal.toReal`, which sends `∞` to `0`). The
  theorems 1.4 and 3.2 assume no moment; the other statements name their hypotheses.
- **Normal densities.** The normal density with mean `μ` and variance `v ≥ 0` is Mathlib's
  `gaussianPDFReal μ v`, `x ↦ (2πv)^(−1/2) exp(−(x − μ)²/(2v))`, with `v` in `ℝ≥0`; a real variance
  is passed through `Real.toNNReal`. For `v = 0` it is the zero function, by Lean's conventions
  `√0 = 0` and `0⁻¹ = 0`. We write `n_σ²` for `gaussianPDFReal 0 σ²`.
- **Characteristic functions.** `φ(t) = charFun (P.map (X 0)) t = E exp(i t X 0)`, Mathlib's
  convention, with the phase `+ i t x` and no factor `2π`. An integer law `μ` on `ℤ` is compared
  with characteristic functions through its image `μ.map (Int.cast : ℤ → ℝ)` on the line.
- **Densities by inversion.** For a law `μ` on `ℝ`, Tau Ceti's `charFunDensity μ` is
  `x ↦ (2π)⁻¹ Re ∫ exp(−i t x) charFun μ t dt`. It is a bounded continuous density of `μ` when the
  characteristic function is integrable, and it is the zero function otherwise.
- **Uniform convergence** of a sequence `aₙ(x)` to `a(x)` is written as
  `∀ ε > 0, ∀ᶠ n in atTop, ∀ x, |aₙ(x) − a(x)| ≤ ε`; no supremum over an unbounded family is taken.

## Layer 1: integer laws of maximal span one and the lattice local limit theorem

### 1.1 Maximal span one

Define `HasMaximalSpanOne μ` for a measure `μ` on `ℤ`: for every `b : ℤ` and every natural number
`h ≥ 2`, `μ` gives positive mass to the complement of the coset `b + hℤ`. For a probability
measure this says that the law is carried by no coset of a proper subgroup `hℤ`, `h ≥ 2`; in the
language of lattice laws, the law is lattice with maximal span one (Durrett, the definitions
before Example 3.5.1, p. 161, and Theorem 3.5.2, p. 162).

- A probability measure on `ℤ` has maximal span one if and only if the differences `k − l` of
  points of its support generate `ℤ` as a group.
- It is never a point mass, so its variance, when finite, is positive.

**Checks.**
- The Bernoulli law on `{0, 1}` with parameter `p ∈ (0, 1)` has maximal span one: a coset `b + hℤ`
  containing `0` and `1` has `h ∣ 1`.
- The uniform law on `{0, 2, 3}` has maximal span one (differences `2`, `3`, `1`); the uniform law
  on `{0, 2}` does not, being carried by `2ℤ`.
- The Rademacher law on `{−1, 1}` does not have maximal span one: it is carried by `1 + 2ℤ`. Its
  support generates `ℤ` as a group, so the plausible variant "the support generates `ℤ`" would
  wrongly accept it; the simple random walk has span `2`.
- A point mass `δ_b` does not have maximal span one: it is carried by `b + 2ℤ`.

*Needs:* Mathlib `MeasureTheory.Measure`.

### 1.2 The characteristic function of a law of maximal span one

This is a step of the proof of 1.4, not a separate target: a probability measure `μ` on `ℤ` has
maximal span one if and only if `|charFun (μ.map Int.cast) t| < 1` for every real `t` that is not
an integer multiple of `2π` (it is the case of integer laws of Durrett, Theorem 3.5.2, p. 162).

Route: the characteristic function of an integer law has period `2π`. If `μ` is carried by
`b + hℤ` with `h ≥ 2`, then `|charFun| = 1` at `2π/h`, which is not a multiple of `2π`. Conversely,
if `|charFun (μ.map Int.cast) t| = 1`, write it as `exp(i c)`; then `1 − cos(t k − c)` has
integral `0` against `μ` and is nonnegative, so `t k − c ∈ 2πℤ` for every `k` in the support, and
`t (k − l) ∈ 2πℤ` for all `k, l` in it. If the differences generate `ℤ`, then `t ∈ 2πℤ`.

**Checks.**
- For the uniform law on `{0, 2, 3}`, `|charFun π| = |1 + 1 − 1|/3 = 1/3`, and on the grid
  `t = 2πj/1000`, `1 ≤ j ≤ 999`, the largest value of `|charFun t|` is `0.99997`, reached next to
  the excluded endpoints.
- For the Rademacher law `charFun t = cos t`, of modulus `1` at `t = π`, which is not a multiple
  of `2π`.
- At `t = 2π` every integer law has `charFun = 1`: the multiples of `2π` must be excluded.

*Needs:* 1.1; Mathlib `charFun`, `MeasureTheory.integral_map`,
`MeasureTheory.integral_eq_zero_iff_of_nonneg`.

### 1.3 Inversion on the integers

This is a step of the proof of 1.4, not a separate target: for a probability measure `μ` on `ℤ`
and every `k : ℤ`,
`μ {k} = (2π)⁻¹ ∫_{−π}^{π} exp(−i t k) charFun (μ.map Int.cast) t dt` (Durrett, Exercise 3.3.2 (ii),
p. 131, with `h = 1`).

Route: expand the characteristic function as the sum `∑_l μ{l} exp(i t l)`, exchange sum and
integral (the series converges absolutely and uniformly), and use
`∫_{−π}^{π} exp(i t j) dt = 2π` for `j = 0` and `0` for every other integer `j`.

**Checks.**
- For the Bernoulli law with `p = 1/2`, `charFun t = (1 + exp(i t))/2` and the formula at `k = 1`
  gives `(2π)⁻¹ ∫ (exp(−i t) + 1)/2 dt = 1/2`.

*Needs:* Mathlib `charFun`, `integral_exp_mul_complex`, `MeasureTheory.integral_map`,
`MeasureTheory.integral_tsum`.

### 1.4 Gnedenko's lattice local limit theorem

Prove `localLimit_lattice`: let `X : ℕ → Ω → ℤ` be independent and identically distributed, and
let the law of `X 0` have maximal span one, mean `m` and variance `σ²` in the sense of the
Conventions. Then, uniformly in `k : ℤ`,
`√n · P(Sₙ = k) − n_σ²((k − n m)/√n) → 0`. With a finite second moment this is Durrett, Theorem
3.5.3, p. 162, proved on pp. 163–164, in the case of span `h = 1`; there the summands are centred
and `b` may be nonzero, which is the case `m = −b` here. With an infinite second moment `σ² = 0`,
`n_0` is the zero function, and the statement says that `√n · P(Sₙ = k) → 0` uniformly in `k`
(Proved here, for that case). No moment hypothesis is needed, so none is made.

Route with a finite second moment: by 1.3 and the product formula for characteristic functions of
independent sums,
`√n P(Sₙ = k) = (2π)⁻¹ ∫_{|u| ≤ π√n} exp(−i u x) ψ(u/√n)ⁿ du` with `x = (k − n m)/√n` and `ψ` the
characteristic function of `X 0 − m`. By the Fourier transform of the Gaussian,
`n_σ²(x) = (2π)⁻¹ ∫ exp(−i u x) exp(−σ²u²/2) du`. The difference is bounded, independently of `x`,
by `(2π)⁻¹ ∫_{|u| ≤ π√n} |ψ(u/√n)ⁿ − exp(−σ²u²/2)| du` plus the Gaussian tail beyond `π√n`. Split
the first integral: on `|u| ≤ A` the integrand tends to `0` boundedly (the central limit theorem for
characteristic functions); on `A ≤ |u| ≤ δ√n` the Taylor expansion of `ψ` at `0`, with `σ² > 0` by
1.1, gives `|ψ(v)| ≤ exp(−σ²v²/4)` for `|v| ≤ δ`, so the piece is at most `4 ∫_A^∞ exp(−σ²u²/4) du`;
on `δ√n ≤ |u| ≤ π√n`, 1.2 and continuity give `|ψ| ≤ η < 1` on `δ ≤ |v| ≤ π`, so the piece is at
most `2π√n ηⁿ` plus a Gaussian tail.

Route when the second moment is infinite: by 1.3, `√n · P(Sₙ = k) ≤ (2π)⁻¹ √n ∫_{−π}^{π} |φ(t)|ⁿ dt`
for every `k`. With `X'` an independent copy of `X 0`, `|φ(t)|²` is the characteristic function of
`X 0 − X'` at `t`, so `1 − |φ(t)|² = E(1 − cos(t (X 0 − X')))`, and Fatou's lemma with
`E (X 0 − X')² = ∞` (which holds because `E (X 0)² = ∞`: otherwise `X 0 − x'` would be square
integrable for some `x'`) gives `(1 − |φ(t)|²)/t² → ∞` as `t → 0`. By 1.2 and continuity this quotient is
then at least some `c > 0` on `0 < |t| ≤ π`, so `|φ(t)|ⁿ ≤ exp(−n t² g(t)/2)` with
`g(t) = (1 − |φ(t)|²)/t² ≥ c`. Substituting `t = u/√n`, the bound is
`(2π)⁻¹ ∫_{|u| ≤ π√n} exp(−u² g(u/√n)/2) du`, whose integrand tends to `0` for `u ≠ 0` and is at most
`exp(−c u²/2)`; dominated convergence gives the limit `0`.

**Checks.**
- Bernoulli summands with `p = 1/2` (`m = 1/2`, `σ² = 1/4`): the largest error over `k` is `0.0197`
  at `n = 10`, `0.0050` at `n = 40`, `0.0012` at `n = 160` and `0.0003` at `n = 640`. For the
  uniform law on `{0, 2, 3}` it is `0.0120`, `0.0048`, `0.0023`, `0.0011` at the same `n`.
- The span hypothesis is needed. For Rademacher summands `P(Sₙ = k) = 0` when `k − n` is odd,
  while `n_1(k/√n)` is near `n_1(0) = 0.3989` for `|k| ≤ 1`; the largest error is `0.3986` at
  `n = 640` and does not tend to `0`. At even `k` the probability is about twice the prediction:
  `√400 · P(S₄₀₀ = 0) = 0.7974` against `n_1(0) = 0.3989`.

*Needs:* 1.2, 1.3; Mathlib `charFun`, `iIndepFun.charFun_map_fun_finsetSum_eq_prod`,
`charFun_map_add_const`, `MeasureTheory.taylor_charFun_two`, `MeasureTheory.continuous_charFun`,
`MeasureTheory.norm_charFun_le_one`, `fourierIntegral_gaussian`, `gaussianPDFReal_def`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, and for an infinite second moment
`MeasureTheory.charFun_neg`, `MeasureTheory.charFun_conv`, `MeasureTheory.lintegral_liminf_le`.

### 1.5 Real lattice laws of any span

The form of 1.4 for real summands is a consequence of 1.4 by an affine change of variable, recorded
here and not a separate target: let `X : ℕ → Ω → ℝ` be independent and identically distributed
with mean `0` and finite variance `σ²`, carried by `b + hℤ` with `h > 0`, and carried by
no `b' + h'ℤ` with `h' > h`. Then, uniformly over the points `x` of `Lₙ = (n b + hℤ)/√n`,
`(√n/h) P(Sₙ/√n = x) − n_σ²(x) → 0` (Durrett, Theorem 3.5.3, p. 162).

Derivation: `Y = (X − b)/h` is integer valued almost surely, and its law has maximal span one,
because a coset `c + dℤ` with `d ≥ 2` carrying it would make `b + hc + hdℤ` carry `X`, with
`hd > h`. Its mean is `−b/h` and its variance `σ²/h²`. Apply 1.4 to `Y` and use
`n_{σ²/h²}(y/h) = h n_σ²(y)`.

**Checks.**
- Rademacher summands, `b = 1`, `h = 2`: the statement predicts `(√n/2) P(Sₙ = k) ≈ n_1(k/√n)` for
  `k ≡ n mod 2`; at `n = 400`, `k = 0` the two sides are `0.3987` and `0.3989`, which accounts for
  the factor `2` in the Check of 1.4.

*Needs:* 1.1, 1.4.

### Examples

Bernoulli, Rademacher and uniform laws on small subsets of `ℤ`, with and without maximal span one;
the error of the lattice local limit theorem computed exactly for small `n`.

### Dependencies

Mathlib characteristic functions, the Taylor expansion of a characteristic function, the Fourier
transform of the Gaussian, dominated convergence and Fatou's lemma. No other layer.

## Layer 2: the de Moivre–Laplace theorem

### 2.1 The local de Moivre–Laplace theorem

Prove `binomial_localLimit_ratio`: for `0 < p < 1`, every real `A` and every `ε > 0`, eventually in
`n`, every natural number `k` with `|k − n p| ≤ A√n` satisfies
`|P(Bin(n, p) = k) / gaussianPDFReal (n p) (n p (1 − p)) k − 1| ≤ ε`, where `Bin(n, p)` is
Mathlib's `binomial n p`. (Proved here; de Moivre for `p = 1/2`, Laplace for general `p`.)

Route: on the product space `Measure.infinitePi` of Bernoulli laws `Ber(p)` on `ℕ` the coordinates
are independent (Mathlib `iIndepFun_infinitePi`) and their partial sums have law `Bin(n, p)`
(Tau Ceti `iIndepFun.hasLaw_sum_bernoulli`); their casts to `ℤ` are independent, with a law of
maximal span one (1.1). Apply 1.4 with `m = p`, `σ² = p(1 − p)`, and use the scaling identity
`gaussianPDFReal (n p) (n σ²) k = n^(−1/2) n_σ²((k − n p)/√n)`. On the window `|k − n p| ≤ A√n`
the right side is at least `n^(−1/2) (2πσ²)^(−1/2) exp(−A²/(2σ²))`, so an error `o(n^(−1/2))` in the
numerator is `o(1)` relative to the denominator. A direct proof from Stirling's formula is the
other classical route.

**Checks.**
- `p = 1/2`, `A = 1`: the largest relative error over the window is `0.0537` at `n = 10`, `0.0050`
  at `n = 100` and `0.0005` at `n = 1000`.
- `p = 0.3`, `A = 3`: it is `1.64` at `n = 10`, `7.63` at `n = 100`, `1.63` at `n = 1000`, `0.43` at
  `n = 10⁴`, `0.125` at `n = 10⁵`, `0.038` at `n = 10⁶` and `0.012` at `n = 10⁷`. The convergence is
  slow at the edge of a wide window for a skewed law; from `n = 1000` on the values fall by a factor
  close to `√10` from one power of ten to the next.
- The window is needed: for `p = 1/2`, `n = 10⁴` and `k = 6584` (so `k − n p = 1584`, about
  `n^0.8`) the ratio is `1.67·10⁻⁴`.
- `0 < p` is needed: for `p = 0` and `A ≥ 0` the law is the point mass at `0` and the variance is
  `0`, so the normal density is the zero function, the quotient is Lean's `1/0 = 0`, and the error
  at `k = 0` is `1` for every `n`. The case `p = 1` is symmetric.

*Needs:* 1.1, 1.4; Mathlib `ProbabilityTheory.binomial`, `Measure.infinitePi`,
`iIndepFun_infinitePi`, `gaussianPDFReal_def`; Tau Ceti `iIndepFun.hasLaw_sum_bernoulli`.

### 2.2 Fair coin tossing

A consequence of 2.1, recorded here and not a separate target: if `kₙ` are integers with
`2kₙ/√(2n) → x`, then
`√(πn) · P(Bin(2n, 1/2) = n + kₙ) → exp(−x²/2)`; in terms of the simple random walk `S`,
`P(S_{2n} = 2kₙ) ∼ (πn)^(−1/2) exp(−x²/2)` (Durrett, Theorem 3.1.2, p. 114).

Derivation: 2.1 with `p = 1/2`, `2n` trials and `A = |x| + 1`. The normal density with mean `n` and
variance `n/2` at `n + kₙ` is `(πn)^(−1/2) exp(−kₙ²/n)`, and `kₙ²/n = (2kₙ/√(2n))²/2 → x²/2`.

**Checks.**
- `kₙ` the integer nearest `√(2n)/2`, so `xₙ = 2kₙ/√(2n) → 1`: the ratio of
  `√(πn) · P(Bin(2n, 1/2) = n + kₙ)` to `exp(−xₙ²/2)` is `1.00080` at `n = 100`, `1.000078` at
  `n = 1000` and `1.0000085` at `n = 10⁴`; against the limit `exp(−1/2)` itself the ratios are
  `1.0109`, `1.0162` and `0.9959`, because `xₙ` is `0.9899`, `0.9839` and `1.0041`.

*Needs:* 2.1.

### Examples

Binomial probabilities for `p = 1/2` and `p = 0.3` against the normal density, inside and outside
the window; the probabilities that the simple random walk sits at `2kₙ` at time `2n`.

### Dependencies

Layer 1 (1.1 and 1.4); Mathlib's binomial law and infinite product measures; Tau Ceti's binomial
law as a sum of Bernoulli variables.

## Layer 3: the local limit theorem for densities

### 3.1 The smoothing condition

Prove `exists_integrable_norm_charFun_pow_iff`: for independent identically distributed real
summands, `|φ|^ν` is integrable for some natural number `ν` if and only if, for some `n`, the law of
`Sₙ` is `volume.withDensity` of a bounded measurable function (Bobkov–Marsiglietti, §2, p. 4, the
paragraph after (2.1), where the converse is obtained with `ν = 2n`). (Proved here.)

Route: no power with `ν = 0` is integrable, since `|φ|⁰ = 1`, and `S₀ = 0` has no density; so both
sides concern positive indices. If `|φ|^ν` is integrable, the law of `S_ν` has characteristic
function `φ^ν`, which is integrable, so by Tau Ceti's inversion theorem it has the density
`charFunDensity`, which is measurable and bounded by `(2π)⁻¹ ∫ |φ|^ν`. Conversely, a bounded
density `f` of `Sₙ` is integrable and bounded, hence square integrable; the characteristic
function `φⁿ` of `Sₙ` is a rescaled Fourier transform of `f`, so it is square integrable by
Plancherel's theorem, and `|φ|^(2n)` is integrable.

**Checks.**
- The uniform law on `[−1, 1]` has `φ(t) = sin t / t`: `|φ|` is not integrable, `|φ|²` is, with
  integral `π`, and `S₁` already has the bounded density `1/2` on `[−1, 1]`; the converse indeed
  produces `ν = 2n`, not `ν = n`.
- Independence is needed: let every `X i` equal `X 0`, which has the density `|x|^(−1/3)/3` on
  `[−1, 1]`. That density is square integrable (`∫ |x|^(−2/3) dx = 6`), so `|φ|²` is integrable,
  but `Sₙ = n X 0` has the unbounded density `|x/n|^(−1/3)/(3n)` on `[−n, n]` for `n ≥ 1`, and
  `S₀ = 0` has none.
- Rademacher summands: no `Sₙ` has a density and `|φ(t)| = |cos t|` has no integrable power.

*Needs:* Mathlib `iIndepFun.charFun_map_fun_finsetSum_eq_prod`, `charFun_eq_fourierIntegral'`,
`MeasureTheory.Lp.norm_fourier_eq`; Tau Ceti `eq_withDensity_charFunDensity`, `charFunDensity_le`,
`charFunDensity_nonneg`, `continuous_charFunDensity`.

### 3.2 Gnedenko's local limit theorem for densities

Prove `localLimit_density`: let `X : ℕ → Ω → ℝ` be independent and identically distributed with
mean `m` and variance `σ²` in the sense of the Conventions, and let `|φ|^ν` be integrable. Write
`Zₙ = (Sₙ − n m)/√n`. Then for every `n ≥ ν` the law of `Zₙ` is `volume.withDensity` of
`charFunDensity` of that law, and `charFunDensity (law of Zₙ) → n_σ²` uniformly on `ℝ`. With a
finite second moment this is Bobkov–Marsiglietti, §2, display (2.1), p. 4, for `m = 0`, `σ² = 1`,
where it is recalled as Gnedenko's uniform local limit theorem; the general case follows by an
affine change of variable. With an infinite second moment `σ² = 0`, `n_0` is the zero function, and
the statement says that the densities of `Zₙ` tend to `0` uniformly. No moment hypothesis is
needed, so none is made. (Proved here.)

Route: the characteristic function of `Zₙ` is `ψ(t/√n)ⁿ`, with `ψ` that of `X 0 − m` and
`|ψ| = |φ|`; for `n ≥ ν` its modulus is at most `|φ(t/√n)|^ν`, which is integrable, and Tau Ceti's
inversion theorem gives the density. Then `charFunDensity (law of Zₙ)(x) − n_σ²(x)` is bounded,
independently of `x`, by `(2π)⁻¹ ∫ |ψ(t/√n)ⁿ − exp(−σ²t²/2)| dt`. Split as in 1.4: on `|t| ≤ A` the
integrand tends to `0` boundedly; on `A ≤ |t| ≤ δ√n` it is at most `2 exp(−σ²t²/4)`, by the Taylor
expansion of `ψ` at `0` with `σ² > 0` (a law with a density is not a point mass); on `|t| ≥ δ√n`,
`η = sup_{|v| ≥ δ} |φ(v)| < 1`, and that piece is at most `√n η^(n − ν) ∫ |φ|^ν` plus a Gaussian
tail. The bound `η < 1` holds because `φ^ν` is the characteristic function of a law with a density
(3.1), so `φ(v) → 0` as `|v| → ∞` by the Riemann–Lebesgue lemma, and `|φ(v₀)| = 1` for some `v₀ ≠ 0`
would give `|φ(j v₀)| = 1` for every integer `j` (the argument of 1.2), contradicting that limit;
continuity covers the compact range.

With an infinite second moment the density of `Zₙ` is nonnegative and at most
`(2π)⁻¹ √n ∫ |φ(v)|ⁿ dv` (Tau Ceti `charFunDensity_le`, after `t = √n v`). The range `|v| ≥ δ`
contributes at most `√n η^(n − ν) ∫ |φ|^ν`. On `|v| ≤ δ` argue as in the last paragraph of the
route of 1.4: `(1 − |φ(v)|²)/v² → ∞` as `v → 0`, and `|φ(v)| < 1` for `v ≠ 0`, so this quotient is
at least some `c > 0` on `0 < |v| ≤ δ`, and dominated convergence gives
`√n ∫_{|v| ≤ δ} |φ(v)|ⁿ dv → 0`.

**Checks.**
- Gaussian summands: `Zₙ` has law `N(0, σ²)` for every `n ≥ 1`, and the error is `0`.
- Uniform summands on `[−√3, √3]` (`σ² = 1`, `ν = 2`): the largest error over the line, computed on
  a grid of step `0.001`, is `0.0310` at `n = 2`, `0.0239` at `n = 3`, `0.0140` at `n = 4`, `0.0075`
  at `n = 8` and `0.0050` at `n = 12`; at `n = 2` the density at `0` is `√2/(2√3) = 0.4082` against
  `0.3989`. At `n = 1 < ν` the characteristic function is not integrable and `charFunDensity` is the
  zero function, although `Z₁` has a density: the first conclusion is stated only for `n ≥ ν`.
- Exponential summands of mean `1` (`φ(t) = 1/(1 − i t)`, `σ² = 1`, `ν = 2`): the largest error
  is `0.231` at `n = 2`, `0.070` at `n = 10`, `0.019` at `n = 100` and `0.0059` at `n = 1000`.
- The smoothing hypothesis is needed: for Bernoulli summands no power of `|φ|` is integrable,
  `charFunDensity` of the law of `Zₙ` is the zero function, and the error at `x = 0` is
  `n_σ²(0) > 0` for every `n`.

*Needs:* 3.1; Mathlib `ProbabilityTheory.charFun_inv_sqrt_mul_sum`, `charFun_map_add_const`,
`MeasureTheory.taylor_charFun_two`, `MeasureTheory.continuous_charFun`,
`tendsto_integral_exp_inner_smul_cocompact`, `fourierIntegral_gaussian`, `gaussianPDFReal_def`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, and for an infinite second moment
`MeasureTheory.charFun_neg`, `MeasureTheory.charFun_conv`, `MeasureTheory.lintegral_liminf_le`; Tau
Ceti `charFunDensity`, `eq_withDensity_charFunDensity`, `charFunDensity_le`, `charFunDensity_nonneg`.

### Examples

Uniform, exponential and Gaussian summands, with the exact densities of their normalized sums
against the normal density.

### Dependencies

Mathlib characteristic functions, the Riemann–Lebesgue lemma, Plancherel's theorem, the Fourier
transform of the Gaussian and Fatou's lemma; Tau Ceti's inversion theorem. No other layer: the
routes of 3.2 repeat two arguments of Layer 1 (that of 1.2, and the bound for an infinite second
moment in 1.4) for laws on the line, and use no statement of Layer 1.

## Downstream consumers

- Recurrence of the simple random walk on `ℤ`: by the case `kₙ = 0` of 2.2 the series
  `∑ P(S_{2n} = 0)` diverges.
- Renewal and Markov-chain arguments that need the probability that a lattice walk sits at a given
  point at a large time, which 1.4 gives uniformly in the point.

## Scope and ownership

This roadmap owns the definition and the four theorems stated above: integer laws of maximal span
one, Gnedenko's lattice local limit theorem, the local de Moivre–Laplace theorem, the smoothing
condition and Gnedenko's local limit theorem for densities. The characterization of maximal span
one by the characteristic function (1.2) and inversion on the integers (1.3) are steps of the proof
of the lattice theorem; the form for real lattice laws of any span (1.5) and the fair-coin form
(2.2) are recorded consequences. None of these four is a separate target.

The asymptotics `√(πn) · C(2n, n)/4ⁿ → 1` of the central binomial coefficient, the case `kₙ = 0`
of 2.2, is not a target: Mathlib's Wallis product gives it in a few lines, since
`Real.Wallis.W_eq_factorial_ratio` says that the `n`-th Wallis product is
`16ⁿ/(C(2n, n)² (2n + 1))` and `Real.Wallis.tendsto_W_nhds_pi_div_two` that it tends to `π/2`.

Already in the libraries and therefore not targets: characteristic functions with their product
formula for independent sums, Taylor expansion at `0` and continuity, the central limit theorem
for independent identically distributed summands and its integral form for the binomial law, the
binomial law, Stirling's formula and the Wallis product, the Fourier transform of the Gaussian,
the Riemann–Lebesgue lemma and Plancherel's theorem (Mathlib); the inversion theorem for laws on
the line with integrable characteristic function and the binomial law as a sum of Bernoulli
variables (Tau Ceti).

Boundaries with other roadmaps:

- MarkovChainsAndRenewal, Layer 5, defines lattice laws on the half-line by support in `aℕ`,
  without translation, for the lattice renewal theorem. Integer laws of maximal span one here allow
  a translation and live on all of `ℤ`; neither notion is consumed by the other.
- MathematicalStatisticsHigherOrderAndResampling (an open roadmap, not on main), §3.1, states
  lattice laws on `ℝ` and their characterization by the characteristic function, for every span;
  1.2 here, the special case of integer laws phrased through the maximal span one of 1.1, is only
  a step of the proof of 1.4, and this roadmap does not depend on that one. Its §4.3 (lattice
  Edgeworth expansions of distribution functions) and §4.6 (the local Edgeworth expansion of
  densities, with an error `O(1/n)` under a fourth moment) are refinements of a different kind: the
  theorems here assume no moment and give convergence without a rate. The first clause of its §4.6,
  that `Sₙ` has a bounded continuous density for `n ≥ ν`, is a step shared with the forward
  direction of 3.1 and with the first conclusion of 3.2 here, which is stated for `Zₙ`.
- The central limit theorem itself, in Mathlib, is consumed through its characteristic-function
  step; MathematicalStatisticsAsymptotic owns its Lindeberg–Feller and multivariate forms, which
  are not used.

Outside the scope: Stone's local limit theorem for nonlattice laws (intervals of fixed length);
local limit theorems in several dimensions, for non-identically distributed summands, for Markov
chains and for laws in the domain of attraction of a stable law (beyond the uniform convergence
to `0` that 1.4 and 3.2 give when the second moment is infinite); rates of convergence and local
Edgeworth expansions; moderate and large deviation forms of the de Moivre–Laplace theorem; the
recurrence and fluctuation theory of random walks.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.charFun` (the
  characteristic function `t ↦ ∫ exp(i⟪x, t⟫) dμ`), `MeasureTheory.norm_charFun_le_one` (modulus at
  most `1` for a probability measure), `MeasureTheory.charFun_map_add_const` (translating by `r`
  multiplies by `exp(i⟪r, t⟫)`), `MeasureTheory.charFun_eq_fourierIntegral'` (the characteristic
  function as Mathlib's Fourier integral at `−(2π)⁻¹ t`).
- `Mathlib/MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean`:
  `MeasureTheory.continuous_charFun` (continuity for a finite measure),
  `MeasureTheory.taylor_charFun_two` (for `X` with `P[X] = 0` and `P[X²] = 1`,
  `charFun − (1 − t²/2) = o(t²)` at `0`).
- `Mathlib/Probability/Independence/CharacteristicFunction.lean`:
  `ProbabilityTheory.iIndepFun.charFun_map_fun_finsetSum_eq_prod` (the characteristic function of
  a finite sum of independent variables is the product).
- `Mathlib/Probability/CentralLimitTheorem.lean`: `ProbabilityTheory.charFun_inv_sqrt_mul_sum`
  (the characteristic function of `n^(−1/2) Sₙ` is `φ(t/√n)ⁿ`),
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub` (the central limit theorem, cited
  in the scope).
- `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianPDFReal`,
  `ProbabilityTheory.gaussianPDFReal_def` (its formula), `ProbabilityTheory.charFun_gaussianReal`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`: `fourierIntegral_gaussian`
  (`∫ exp(i t x) exp(−b x²) dx = (π/b)^(1/2) exp(−t²/(4b))` for `Re b > 0`).
- `Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean`: `integral_exp_mul_complex` (the integral
  of `exp(c x)` over an interval, `c ≠ 0`).
- `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`: `tendsto_integral_exp_inner_smul_cocompact`
  (the Fourier transform of an integrable function tends to `0` at infinity).
- `Mathlib/Analysis/Fourier/LpSpace.lean`: `MeasureTheory.Lp.norm_fourier_eq` (Plancherel: the
  Fourier transform on `L²` preserves the norm).
- `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`:
  `MeasureTheory.tendsto_integral_of_dominated_convergence`, `MeasureTheory.integral_tsum` (exchange
  of a countable sum and an integral). `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.integral_eq_zero_iff_of_nonneg` (a nonnegative integrable function with integral
  `0` vanishes almost everywhere), `MeasureTheory.integral_map`.
- `Mathlib/Probability/Distributions/Binomial.lean`: `ProbabilityTheory.binomial` (the binomial law
  on `ℕ`), `ProbabilityTheory.binomial_real_singleton`
  (`P(Bin(n, p) = k) = C(n, k) pᵏ (1 − p)^(n − k)`).
- `Mathlib/Probability/ProductMeasure.lean`: `MeasureTheory.Measure.infinitePi`.
  `Mathlib/Probability/Independence/InfinitePi.lean`: `ProbabilityTheory.iIndepFun_infinitePi`
  (coordinates of an infinite product of probability measures are independent).
- `Mathlib/Analysis/SpecialFunctions/Stirling.lean`: `Stirling.factorial_isEquivalent_stirling`
  (the alternative route to 2.1). `Mathlib/Analysis/Real/Pi/Wallis.lean`:
  `Real.Wallis.W_eq_factorial_ratio` (the `n`-th Wallis product is
  `2^(4n) (n!)⁴/(((2n)!)² (2n + 1))`) and `Real.Wallis.tendsto_W_nhds_pi_div_two` (it tends to
  `π/2`), cited in the scope for the central binomial coefficient.
- `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.charFun_neg`
  (`charFun μ (−t)` is the conjugate of `charFun μ t`) and `MeasureTheory.charFun_conv` (the
  characteristic function of a convolution is the product), which give `|φ|²` as the characteristic
  function of `X 0 − X'`. `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`:
  `MeasureTheory.lintegral_liminf_le` (Fatou's lemma). These serve the case of an infinite second
  moment in 1.4 and 3.2.

### From Tau Ceti

- `TauCeti/Analysis/Bochner/CharFun/Inversion.lean`: `MeasureTheory.Measure.charFunDensity` (the
  convention above), `MeasureTheory.Measure.eq_withDensity_charFunDensity` (a finite measure on `ℝ`
  with integrable characteristic function is `volume.withDensity` of it),
  `MeasureTheory.Measure.charFunDensity_le` (bounded by `(2π)⁻¹ ∫ ‖charFun‖`),
  `MeasureTheory.Measure.charFunDensity_nonneg`, `MeasureTheory.Measure.continuous_charFunDensity`,
  `MeasureTheory.Measure.charFunDensity_of_not_integrable` (the zero function otherwise, used in
  the Checks of 3.2).
- `TauCeti/Probability/Distributions/Binomial/Basic.lean`:
  `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli` (a finite sum of independent `Ber(p)`
  variables with values in `ℕ` has law `Bin(n, p)`, `n` the number of summands).

## References

- Rick Durrett, *Probability: Theory and Examples*, fifth edition, version of 11 January 2019,
  author's page at Duke University: Theorem 3.1.2 (p. 114), Exercise 3.3.2 (p. 131), the
  definitions of §3.5 (p. 161) and Theorems 3.5.2 and 3.5.3 (pp. 162–164).
- Sergey G. Bobkov and Arnaud Marsiglietti, *Asymptotic behavior of Rényi entropy in the central
  limit theorem* (extended version), arXiv:1802.10212v1 (2018): §2, display (2.1) and the
  paragraph after it, p. 4.
- Attributions made in prose without a locator: Abraham de Moivre (1733) and Pierre-Simon Laplace
  (1812) for the local normal approximation of the binomial law; B. V. Gnedenko (1948) for the local
  limit theorems for lattice laws and for densities, presented in B. V. Gnedenko and
  A. N. Kolmogorov, *Limit Distributions for Sums of Independent Random Variables* (1954).

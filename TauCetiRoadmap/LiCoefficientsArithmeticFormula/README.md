# Roadmap: the arithmetic formula for Li's coefficients

**Summary.** Li's coefficients `λₙ` of the Riemann zeta function are sums over its nontrivial
zeros, and Li's criterion says that the Riemann hypothesis holds exactly when all of them are
nonnegative. A sum over the zeros cannot be evaluated directly. Bombieri and Lagarias showed
that each `λₙ` is also a finite expression in quantities that do not mention the zeros: Euler's
constant `γ`, `log 4π`, the values `ζ(2), …, ζ(n)`, and the first `n` coefficients `η_j` of the
expansion `−ζ'/ζ(1 + t) = 1/t + ∑ η_j t^j` at the pole. This roadmap proves that formula, proves
that the `η_j` are limits of explicit sums over prime powers, and proves Yoshida's local
positivity of Weil's quadratic form in Bombieri's quantitative form. Nothing here proves or
assumes the Riemann hypothesis.

The first main theorem is the closed form. For every `n ≥ 1`,
`λₙ = 1 − (n/2)(γ + log 4π) + ∑_{j=2}^{n} (−1)^j C(n, j)(1 − 2^(−j)) ζ(j)`
`− ∑_{j=1}^{n} C(n, j) η_{j−1}`.
For example `λ₁ = 1 + γ/2 − ½ log 4π ≈ 0.0230957` and `λ₂ ≈ 0.0923457`. The constant `1` is
what makes the hypothesis `n ≥ 1` necessary: at `n = 0` the left side is `0`.

The second makes the `η_j` arithmetic. There is one constant `c > 0` such that for every
`j ≥ 0` the sum of `Λ(m)(log m)^j/m` over `m ≤ x`, minus `(log x)^(j+1)/(j + 1)`, differs from
`(−1)^j j! η_j` by `O(exp(−c √(log x)))`, the implied constant depending on `j`. Here `Λ` is the
von Mangoldt function. At `j = 0` this is the classical statement that `∑_{m ≤ x} Λ(m)/m` is
`log x − γ` up to a small error.

The third is about Weil's form `W(g, g) = ∑_ρ ĝ(ρ) conj ĝ(1 − conj ρ)`, with `ĝ` the Mellin
transform of a smooth function `g` with compact support in `(0, ∞)`. There is a constant `C` such
that whenever `g` is supported in an interval `[b, b eᵃ]` with `0 < a < log 2`, the real part of
`W(g, g)` is at least `(log(1/a) − log log(1/a) − C)` times `∫ |g|²`. Since the factor tends to
infinity as `a → 0`, Weil's form is positive on nonzero functions of small enough logarithmic
support, whether or not the Riemann hypothesis holds.

The roadmap builds on Weil Positivity and Li's Criterion, which defines the Li coefficients,
the zero multiplicities and Weil's form and proves Li's derivative formula; the first theorem is
that formula evaluated. The polygamma values at `1/2` come from Gauss's integral for the digamma
function in Analytic Number Theory Part I, and the prime number theorem with the de la Vallée
Poussin remainder from Zeros of L-functions. The third theorem starts from the Weil explicit
formula of Zeros of L-functions.

Layer 1 below defines the `η_j`. Layer 2 proves the closed form, and Layer 3 the arithmetic
limit; both use Layer 1 and not each other. Layer 4 proves the local positivity and uses no
other layer.

## Conventions

- **Zeta.** `ζ` is Mathlib's `riemannZeta`, `γ` is `Real.eulerMascheroniConstant`, and
  `ζ₁ = riemannZeta₁` is the entire function equal to `(s − 1) ζ(s)` for `s ≠ 1`, with
  `ζ₁(1) = 1` (`riemannZeta₁_one`) and `ζ₁'(1) = γ` (`deriv_riemannZeta₁_one`). Off `1` and the
  zeros of `ζ`, `ζ'/ζ = −1/(s − 1) + ζ₁'/ζ₁` (`log_deriv_riemannZeta_eq_neg_inv_sub_add`, which
  states it near `1`).
- **Copied definitions.** `zetaZeroMult`, `liCoeff` and `weilForm` are those of
  WeilPositivityAndLiCriterion (1.1, 3.1 and 5.1), copied verbatim into `Suggested.lean` because
  a roadmap's Lean file never imports another roadmap's. `zetaZeroMult ρ` is the positive part of
  the divisor of `completedRiemannZeta` at `ρ`, the multiplicity of `ρ` as a nontrivial zero of
  `ζ`; `liCoeff n` is the symmetric absolutely convergent form
  `λₙ = ½ ∑_ρ m_ρ Re[(1 − (1 − 1/ρ)^n) + (1 − (1 − 1/(1 − ρ))^n)]`, with `liCoeff 0 = 0`;
  `weilForm g h = ∑_ρ m_ρ ĝ(ρ) conj ĥ(1 − conj ρ)` with `ĝ = mellin g`. Their laws are that
  roadmap's and are not restated here.
- **Normalization of `λₙ`.** `liCoeff n` is Lagarias's `λₙ = λ₋ₙ` for `ζ` (his (1.1)–(1.3);
  the two agree by the symmetry `ρ ↦ 1 − ρ` of the zeros). It equals Li's derivative formula
  `λₙ = (1/(n − 1)!) dⁿ/dsⁿ[s^(n−1) log ξ(s)]` at `s = 1` with
  `ξ(s) = ½ s(s − 1) π^(−s/2) Γ(s/2) ζ(s)` (WeilPositivityAndLiCriterion 3.4).
- **The coefficients `η_j`.** `η_j` is indexed by the power of `t = s − 1`, starting at `0`. It is
  Lagarias's `η_j(π_triv)` of his (4.5) and (4.12), and Bombieri–Lagarias's `η_j`. It is not the
  Stieltjes constant `γ_j` of `ζ(1 + t) = 1/t + ∑ (−1)^j γ_j t^j/j!`, and not Keiper's `λₙ/n`.
- **Lean's junk values.** `logDeriv f = deriv f / f` is `0` where `f` vanishes. `ζ₁` vanishes
  only at the zeros of `ζ`, none of which is near `1`, so `logDeriv riemannZeta₁` agrees with the
  true `ζ₁'/ζ₁` on a neighbourhood of `1` and all its derivatives at `1` are the true ones.
  `1 / 2 ^ j` and `riemannZeta j` in 2.1 are evaluated only at `j ≥ 2`. In 3.1 the sum over
  `1 ≤ m ≤ ⌊x⌋` is empty for `x < 1`, which does not matter along `atTop`.
- **Test functions.** As in WeilPositivityAndLiCriterion 5.1 and ZerosOfLFunctions 8.4: `g : ℝ →
  ℂ` with `ContDiff ℝ ∞ g`, where `∞ = ((⊤ : ℕ∞) : WithTop ℕ∞)` (smooth, not analytic). In 4.1
  the hypothesis `tsupport g ⊆ Icc b (b * exp a)` with `b > 0` gives both `HasCompactSupport g`
  and `tsupport g ⊆ Ioi 0`. Bombieri's additive variable is `F(x) = g(eˣ) e^(x/2)`; then
  `ĝ(1/2 + iv) = ∫ F(x) e^(ivx) dx`, `∫ |F(x)|² dx = ∫_0^∞ |g(t)|² dt`, and `g` has support in
  `[b, b eᵃ]` exactly when `F` has support in `[log b, log b + a]`.

## Layer 1: the Laurent coefficients of the logarithmic derivative of ζ at 1

### 1.1 The coefficients `η_j`

Define `zetaLogDerivCoeff j = −(1/j!) · iteratedDeriv j (logDeriv riemannZeta₁) 1`, the
coefficient `η_j`. Near `1`, `−ζ'/ζ(s) − 1/(s − 1) = −ζ₁'/ζ₁(s)` (Conventions), an analytic
function whose Taylor coefficients at `1` are the `η_j`; this is Lagarias's expansion (4.12)
(Lagarias, (4.5) p. 15 and (4.12) p. 16). The definition reads the coefficients off the entire
function `ζ₁`, so it needs neither the pole of `ζ` nor a choice of branch.

- `η₀ = −ζ₁'(1)/ζ₁(1) = −γ`; `Suggested.lean` checks this sign with a one-line `example`.
- Each `η_j` is real: the left side of 3.1 is real, so 3.1 exhibits `η_j` as a limit of real
  numbers.

**Checks.**
- `η₀ = −γ = −0.5772157`, whereas the Stieltjes constant `γ₀` is `+γ`: a definition through
  the Laurent coefficients of `ζ` itself would get the sign wrong.
- `η₁ = γ² + 2γ₁ = 0.1875462`, with `γ₁ = −0.0728158` the first Stieltjes constant (defined by
  ExplicitMultiplicativeFunctions 0.5 as `stieltjesGammaOne`, used here only as a value). It
  follows from `ζ₁(1 + t) = 1 + γt − γ₁t² + …`. The divisor-problem constant `γ² − 2γ₁ = 0.4788`
  has the other sign of `γ₁`.
- Computed two independent ways (from mpmath's Stieltjes constants by series division, and by
  a Cauchy integral of radius `1/2` around `1` of `ζ'/ζ(s) + 1/(s − 1)`), agreeing to `10⁻⁴²`:
  `η₂ = −0.0516886`, `η₃ = 0.0147517`, `η₄ = −0.0045245`, `η₅ = 0.0014468`,
  `η₆ = −0.0004715`, `η₇ = 0.0001552`.
- The ratios `η₅/η₄ = −0.3198`, `η₆/η₅ = −0.3259`, `η₇/η₆ = −0.3291` approach `−1/3`: the
  Taylor series of `−ζ₁'/ζ₁` about `1` has radius `3`, set by the trivial zero `−2` of `ζ`, the
  zero of `ζ₁` nearest to `1` (the nontrivial zeros have ordinates above `14`).

*Needs:* Mathlib `riemannZeta₁`, `riemannZeta₁_one`, `deriv_riemannZeta₁_one`,
`differentiable_riemannZeta₁`, `riemannZeta₁_ne_zero_of_near_one`,
`log_deriv_riemannZeta_eq_neg_inv_sub_add`, `logDeriv`, `iteratedDeriv`. (Definition.)

### Examples

`η₀, …, η₇` above; the alternating signs and the ratio near `−1/3` reflect the pole of `ζ'/ζ`
at `−2`.

### Dependencies

Mathlib only. No other layer.

## Layer 2: the arithmetic formula

### 2.1 The closed form for `λₙ`

Prove `liCoeff_eq_arithmetic`: for `n ≥ 1`,
`λₙ = 1 − (n/2)(γ + log 4π) + ∑_{j=2}^{n} (−1)^j C(n, j)(1 − 2^(−j)) ζ(j)`
`− ∑_{j=1}^{n} C(n, j) η_{j−1}`
(Lagarias, Lemma 4.2, (4.6) and (4.8) p. 15, with (4.11) p. 16, for `π = π_triv`, where
`δ = 1`; for `ζ` the formula is Bombieri and Lagarias's Theorem 2 of their 1999 paper). The
hypothesis `1 ≤ n` is needed: at `n = 0` the left side is `liCoeff 0 = 0` and the right side
is `1`.

Lagarias's (4.13), as printed, writes the finite-prime part as
`∑_{j=1}^{n} (−1)^(j−1) C(n, j) η_{j−1}`, with an alternating sign that his own (4.8) does not
have. With that sign the formula gives `λ₂ = 0.4674382` instead of the true `0.0923457` (Checks);
the statement here uses (4.8).

Route. Put `L(s) = log ξ(s)`, analytic near `1` because `ξ(1) = 1/2`.

- By the Leibniz rule (Mathlib `iteratedDeriv_mul`), since `dⁿ⁻ᵏ s^(n−1)` at `1` is
  `(n − 1)!/(k − 1)!` for `1 ≤ k ≤ n` and `0` for `k = 0`, Li's derivative formula
  (WeilPositivityAndLiCriterion 3.4) becomes `λₙ = ∑_{k=1}^{n} C(n, k) c_{k−1}`, where `c_m` is
  the coefficient of `t^m` in `L'(1 + t) = ξ'/ξ(1 + t)`.
- Near `1`, `ξ(s) = ½ s Γℝ(s) ζ₁(s)` with `Γℝ(s) = π^(−s/2) Γ(s/2)` (Mathlib
  `completedRiemannZeta_eq`, `riemannZeta_def_of_ne_zero`, `riemannZeta_eq_inv_sub_mul`; WP's
  `ξ` is written through the entire `completedRiemannZeta₀`, and the two agree off `0` and `1`
  and by continuity at `1`), and the three factors are nonzero at `1` (`Complex.Gammaℝ_one`,
  `riemannZeta₁_one`). So `ξ'/ξ(s) = 1/s + (½ ψ(s/2) − ½ log π) + ζ₁'/ζ₁(s)`, with the middle
  term `logDeriv Gammaℝ` (ZerosOfLFunctions 1.4).
- Coefficients of `t^m`: `1/s` gives `(−1)^m`. The gamma term gives
  `½ ψ(1/2) − ½ log π = −½(γ + log 4π)` at `m = 0` (Mathlib `Complex.digamma_one_half`), and
  `½ ψ^(m)(1/2)/(m! 2^m) = (−1)^(m+1)(1 − 2^(−(m+1))) ζ(m + 1)` at `m ≥ 1`, from
  `ψ^(m)(1/2) = (−1)^(m+1) m! (2^(m+1) − 1) ζ(m + 1)`. The last term gives `−η_m` (1.1).
- The polygamma values. Gauss's integral `ψ(z) = ∫_0^∞ (e^(−t)/t − e^(−zt)/(1 − e^(−t))) dt` for
  `Re z > 0` (AnalyticNumberTheoryPartI §1.8a, `digamma_eq_integral`) agrees with `ψ` on the open
  half-plane, so its derivatives at `1/2` are those of `ψ`. Differentiating `m ≥ 1` times under
  the integral, dominated near `z = 1/2` by `t^m e^(−t/4)/(1 − e^(−t))`, gives
  `ψ^(m)(z) = (−1)^(m+1) ∫_0^∞ t^m e^(−zt)/(1 − e^(−t)) dt`. At `z = 1/2` expand
  `1/(1 − e^(−t)) = ∑_{k ≥ 0} e^(−kt)` and integrate term by term:
  `∫_0^∞ t^m e^(−(k + 1/2)t) dt = m!/(k + 1/2)^(m+1)`, and
  `∑_{k ≥ 0} (k + 1/2)^(−(m+1)) = 2^(m+1) ∑_{k ≥ 0} (2k + 1)^(−(m+1)) = (2^(m+1) − 1) ζ(m + 1)`.
- Sum over `k`, using `∑_{k=1}^{n} (−1)^(k−1) C(n, k) = 1` for `n ≥ 1`.

**Checks.**
- `n = 1`: `1 − ½(γ + log 4π) − η₀ = 1 + γ/2 − ½ log 4π = 0.0230957`, with `log 4π = 2.5310242`;
  this is the value of `liCoeff 1` in WeilPositivityAndLiCriterion 3.1.
- `n = 2`: `1 − (γ + log 4π) + ¾ ζ(2) − 2η₀ − η₁`, that is
  `1 − 3.10823991 + 1.23370055 + 1.15443133 − 0.18754623 = 0.0923457`. With the alternating sign
  of (4.13) as printed, the finite-prime part is `2η₀ − η₁` instead of `2η₀ + η₁`, the last term
  becomes `+0.18754623`, and the value is `0.4674382`.
- `λ₁, …, λ₈ = 0.0230957, 0.0923457, 0.2076389, 0.3687905, 0.5755427, 0.8275660, 1.1244601,
  1.4657557` from the closed form, and the same values to within `1.5 · 10⁻³⁹` from Li's
  derivative formula computed directly by Cauchy integrals at 40 digits. The printed-sign
  variant gives `1.3329163, 2.6488486, …, 14.114908` for `n = 3, 4, …, 8`.
- From the zeros: the first `600` zeros above the axis with their conjugates (`T = 939.02`),
  summed as `∑ 2 Re(1 − (1 − 1/ρ)ⁿ)` plus the tail model `n²(log(T/2π) + 1)/(2πT)`, exceed the
  closed form by `3.2 · 10⁻⁷ · n²` for `n = 1, …, 8`, which is the size of the tail model's
  error.
- `n = 0`: the right side is `1 ≠ 0 = liCoeff 0`.

*Needs:* 1.1; WeilPositivityAndLiCriterion 3.4 (Li's derivative formula, with its `ξ`);
AnalyticNumberTheoryPartI §1.8a (`digamma_eq_integral`); ZerosOfLFunctions 1.4; Mathlib
`iteratedDeriv_mul`, `completedRiemannZeta_eq`, `riemannZeta_def_of_ne_zero`,
`riemannZeta_eq_inv_sub_mul`, `differentiable_riemannZeta₁`,
`riemannZeta₁_ne_zero_of_near_one`, `Complex.Gammaℝ`, `Complex.Gammaℝ_one`, `Complex.digamma`,
`Complex.digamma_one_half`, `Complex.log`, `Filter.EventuallyEq.iteratedDeriv_eq`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`MeasureTheory.integral_tsum_of_summable_integral_norm`, `Real.integral_rpow_mul_exp_neg_mul_Ioi`,
`zeta_nat_eq_tsum_of_gt_one`. (Proved here.)

### Examples

`λ₁` and `λ₂` above, each assembled from `γ`, `log 4π`, `ζ(2)`, `η₀` and `η₁`.

### Dependencies

Layer 1; WeilPositivityAndLiCriterion 3.4; AnalyticNumberTheoryPartI §1.8a; ZerosOfLFunctions
1.4.

## Layer 3: the arithmetic limit for the coefficients

### 3.1 Sums of `Λ(m)(log m)^j/m`

Prove `vonMangoldt_logPow_sum_sub_isBigO`: there is `c > 0` such that for every `j : ℕ`,
`∑_{1 ≤ m ≤ x} Λ(m)(log m)^j/m − (log x)^(j+1)/(j + 1) − (−1)^j j! η_j = O(exp(−c √(log x)))`
as `x → ∞`, the implied constant depending on `j` and `c` not. In particular
`η_j = ((−1)^j/j!) lim_{N→∞} (∑_{m ≤ N} Λ(m)(log m)^j/m − (log N)^(j+1)/(j + 1))`, Bombieri and
Lagarias's arithmetic expression for `η_j` (quoted by Lagarias, display after (4.13), p. 16;
the uniform remainder is proved here).

Route. Put `R(x) = ψ(x) − x` with `ψ` Chebyshev's function and `f_j(t) = (log t)^j/t`.

- The remainder: `R(x) = O(x exp(−c₀ √(log x)))` for some `c₀ > 0`. This is the case `K = ℚ` of
  ZerosOfLFunctions 8.5. In Lean form for `ℚ` it is reached from 8.7's
  `primeCounting_progression_effective` at `q = 1`: `π(x) = Li(x) + O(x exp(−c √(log x)))`.
  Partial summation (Mathlib `sum_mul_eq_sub_sub_integral_mul`) passes from `π` to `θ`, and
  `ψ − θ = O(√x)` (Mathlib `Chebyshev.isBigO_psi_sub_theta_sqrt`) from `θ` to `ψ`.
- Abel summation on `[1, x]`:
  `∑_{m ≤ x} Λ(m) f_j(m) = ∫_1^x f_j + R(x) f_j(x) + [j = 0] − ∫_1^x R f_j'`,
  where `∫_1^x f_j = (log x)^(j+1)/(j + 1)` and `[j = 0] = f_j(1)` is the boundary term at `1`,
  where `ψ` vanishes.
- With the remainder, `R(x) f_j(x) = O((log x)^j exp(−c₀ √(log x)))`, and since
  `|f_j'(t)| ≤ (j + 1)(log t)^j/t²` for `t ≥ e`, the tail satisfies
  `∫_x^∞ |R f_j'| ≤ C (j + 1) ∫_{log x}^∞ u^j exp(−c₀ √u) du`. Both are
  `O_j(exp(−(c₀/2) √(log x)))`, so `c = c₀/2` serves for every `j`. The sum minus
  `(log x)^(j+1)/(j + 1)` therefore tends to `[j = 0] − ∫_1^∞ R f_j'` at that rate.
- Identification of the limit. Put `F(s) = ∫_1^∞ R(x) x^(−s−1) dx`, which converges absolutely,
  with all its `s`-derivatives, for real `s ≥ 1` by the remainder. Differentiating under the
  integral, `−∫_1^∞ R f_j' = (−1)^j (F^(j)(1) + j F^(j−1)(1))`. For real `s > 1`,
  `−ζ'/ζ(s) = s ∫_1^∞ ψ(x) x^(−s−1) dx = s/(s − 1) + s F(s)` (Mathlib
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` and partial summation), so
  `−ζ'/ζ(s) − 1/(s − 1) = 1 + s F(s)`. The left side is `−ζ₁'/ζ₁(s)`, analytic at `1` with
  Taylor coefficients `η_j` (1.1); comparing right derivatives at `1` gives
  `j! η_j = [j = 0] + F^(j)(1) + j F^(j−1)(1)`, and the limit is `(−1)^j j! η_j`.

The remainder is what makes the statement true for `j ≥ 1`: the boundary term
`R(x)(log x)^j/x` tends to `0` only if `R(x) = o(x/(log x)^j)`, which `ψ(x) ∼ x` alone does not
give. For a single `j`, `R(x) = O(x/(log x)^(j+2))` would suffice; the de la Vallée Poussin
remainder gives every `j` with one exponent.

**Checks.** Exact sieve up to `10⁶`, values of
`S_j(N) = ∑_{m ≤ N} Λ(m)(log m)^j/m − (log N)^(j+1)/(j + 1)`, against the
limits `(−1)^j j! η_j = −0.577216, −0.187546, −0.103377` for `j = 0, 1, 2`:
- At `N = 10⁴, 10⁵, 10⁶` the raw values are `−0.575701, −0.576663, −0.577618` (`j = 0`),
  `−0.173578, −0.181203, −0.193115` (`j = 1`) and `0.025428, −0.030547, −0.180443` (`j = 2`).
- Subtracting the Abel boundary term `R(N)(log N)^j/N` gives `−0.577041, −0.577179, −0.577205`,
  `−0.185917, −0.187140, −0.187403` and `−0.088217, −0.098894, −0.101538`. The slow and
  non-monotone raw convergence at `j = 2` is that boundary term: at `N = 10⁶`,
  `R(N) = −413.40` and the term is `−0.0789`.
- The limits fix the normalization: at `j = 1` they approach `−η₁`, not `η₁ = 0.187546`, and at
  `j = 2` they approach `2η₂`, not `η₂ = −0.051689`; a statement without the factor
  `(−1)^j j!` would be false.
- `j = 0`: `∑_{m ≤ x} Λ(m)/m = log x − γ + O(exp(−c √(log x)))`, consistent with the explicit
  forms of ExplicitPrimeCounting 4.2: at `x = 10⁶` the error `−0.000402` is within Ramaré's
  `1.833/log² x = 0.0096`.

*Needs:* 1.1; ZerosOfLFunctions 8.5 and 8.7 (`primeCounting_progression_effective`); Mathlib
`ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`,
`Chebyshev.psi`, `Chebyshev.isBigO_psi_sub_theta_sqrt`, `sum_mul_eq_sub_sub_integral_mul`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `riemannZeta₁_ne_zero_of_near_one`,
`log_deriv_riemannZeta_eq_neg_inv_sub_add`. (Proved here.)

### Examples

The three columns above at `j = 0, 1, 2`.

### Dependencies

Layer 1; ZerosOfLFunctions 8.5, 8.7.

## Layer 4: Yoshida's local positivity

### 4.1 Bombieri's quantitative form

Prove `weilForm_re_ge_of_tsupport_subset_Icc`: there is `C` such that for all `a, b` with
`0 < a < log 2` and `b > 0`, and every `g : ℝ → ℂ` with `ContDiff ℝ ∞ g` and
`tsupport g ⊆ [b, b eᵃ]`,
`(log(1/a) − log log(1/a) − C) ∫ |g(t)|² dt ≤ Re W(g, g)` (Bombieri 2000, §12, Theorem 12 and its
proof, pp. 226–227, in the additive variable of the Conventions; positivity for small support
is due to Yoshida (1992), as Bombieri reports on p. 184). For `0 < a < log 2`,
`log(1/a) > log(1/log 2) = 0.3665 > 0`, so `log log(1/a)` is a true value. As `a → 0` the
factor tends to `+∞`; hence there is `δ > 0` such that `Re W(g, g) > 0` for every nonzero such
`g` with `a < δ`, which is Yoshida's positivity. The constant `C` is not made explicit: it
collects Bombieri's `O(1)`, which he does not compute.

Route.
- Put `g*(x) = x⁻¹ conj g(1/x)` and `φ = g ⋆ g*`, the Mellin convolution of
  AnalyticNumberTheoryPartIII 9.1. Then `mellin φ s = ĝ(s) conj ĝ(1 − conj s)`, `φ` is smooth
  (in the variable `log x` it is an additive convolution of smooth compactly supported functions,
  Mathlib `HasCompactSupport.contDiff_convolution_left`) and supported in `[e^(−a), eᵃ] ⊂ (1/2, 2)`
  (9.1, support rule). By WeilPositivityAndLiCriterion 5.1 the family defining `W(g, g)` is
  summable, and the zero side of ZerosOfLFunctions 8.4 (`riemannZeta_weilExplicitFormula`) at
  `φ` is `W(g, g)`.
- On the prime side `φ(n) = 0` and `φ(1/n) = 0` for `n ≥ 2`, and `Λ(0) = Λ(1) = 0`, so it
  vanishes. The pole terms `mellin φ 0 + mellin φ 1` are `∫ 2 cosh(x/2) G(x) dx` with
  `G(x) = φ(eˣ) e^(x/2) = ∫ F(x + u) conj F(u) du`.
- Shift the archimedean integral of 8.4 from `Re s = 2` to `Re s = 1/2`: `logDeriv Gammaℝ` has
  no pole in `Re s > 0`, and `mellin φ` decays like `(1 + |s|)^(−2)` on vertical strips
  (AnalyticNumberTheoryPartIII 9.2). The result is Bombieri's (12.3),
  `T[G] = ∫ 2 cosh(x/2) G − (log π) G(0) + (1/2π) ∫ Re ψ(1/4 + iv/2) |F̂(v)|² dv`. The same
  critical-line form of the archimedean term is AnalyticNumberTheoryPartI §1.8a
  (`zeta_weil_archimedean_critical_line`) applied to `G`, which is in its test class (smooth with
  compact support); either gives (12.3).
- Then Bombieri's (12.4)–(12.9): `G(0) = ‖F‖²`; Plancherel `(1/2π) ∫ |F̂|² = ‖F‖²` (Mathlib
  `MeasureTheory.Lp.norm_fourier_eq`); `|∫ 2 cosh(x/2) G| ≤ 4a cosh(a/2) ‖F‖²`;
  `Re ψ(1/4 + iv/2) ≥ log⁺|v| − C'` (ZerosOfLFunctions 1.2–1.4, digamma on a sector);
  and for `K > 1`, `(1/2π) ∫ log⁺|v| |F̂|² ≥ (log K − 4(a + 2/K) a K² log K) ‖F‖²`. Choose
  `K = (1/a)(1 + log(1/a))⁻¹`.
- Uniformity on the whole range `0 < a < log 2`. With `u = 1/a > 1/log 2 = 1.4427`,
  `K = u/(1 + log u)` is increasing in `u` and equals `1.0557` at `u = 1/log 2`, so `K > 1`
  throughout. With `L = log(1/a) ≥ 0.3665`, the loss `4(a + 2/K) a K² log K` equals
  `4(1/(1 + L)² + 2/(1 + L))(L − log(1 + L))`, which is below `8`, and
  `log K = L − log(1 + L)` differs from `L − log L` by `log(1 + 1/L) ≤ log 3.73`. So one `C`
  serves for every `a` in the range. Where the left factor is negative the inequality is still
  not trivial, since `Re W(g, g) ≥ 0` is not known in general; it follows there from the same
  estimates (12.6)–(12.9), which hold for every `a < log 2`.

**Checks.** The even real bump `F(x) = φ₀(x/a)`, `φ₀(y) = exp(−1/(1 − 4y²))` for `|y| < 1/2`,
that is `g(t) = F(log t) t^(−1/2)` on `[e^(−a/2), e^(a/2)]` (so `b = e^(−a/2)`):
- The zero side over the first `600` zeros (`T = 939.0`; the last term is below `10⁻¹³`)
  and the archimedean side (12.3), both divided by `∫ |g|²`, are `0.030981857` and
  `0.030981857` at `a = 0.6`, and `0.331242255` and `0.331242255` at `a = 0.3`. This fixes the
  normalization `W(g, g) = T[G]` and `‖F‖² = ∫_0^∞ |g(t)|² dt`, with no factor `2` or `2π`.
- The ratio `Re W(g, g)/∫ |g|²` against `log(1/a) − log log(1/a)`: `0.0101` against `1.3624`
  (`a = 0.69`), `0.3312` against `1.0183` (`a = 0.3`), `1.1699` against `1.4686` (`a = 0.1`),
  `3.3551` against `3.0780` (`a = 0.01`) and `7.9407` against `6.9900` (`a = 10⁻⁴`). The
  difference is at least `−1.36` on this family and grows as `a → 0`; this tests the
  normalization, not the value of `C`.
- `a < log 2` keeps the prime side out: for `a > log 2` the support `[e^(−a), eᵃ]` of `φ`
  contains `2` in its interior, and for a nonnegative nonzero `g` the term
  `Λ(2)(φ(2) + φ(1/2)/2)` of the explicit formula can be nonzero.

*Needs:* WeilPositivityAndLiCriterion 5.1 (`weilForm`, `summable_weilForm_and_im_eq_zero`);
ZerosOfLFunctions 8.4 (`riemannZeta_weilExplicitFormula`) and 1.2–1.4;
AnalyticNumberTheoryPartIII 9.1, 9.2; AnalyticNumberTheoryPartI §1.8a (for the critical-line
form, if that route is taken); Mathlib `mellin`, `MeasureTheory.Lp.norm_fourier_eq`,
`HasCompactSupport.contDiff_convolution_left`, `Complex.digamma`. (Proved here, following
Bombieri's proof.)

### Examples

The bump family above at `a = 0.6` and `a = 0.3`.

### Dependencies

WeilPositivityAndLiCriterion 5.1; ZerosOfLFunctions 1.2–1.4, 8.4; AnalyticNumberTheoryPartIII
9.1–9.2; AnalyticNumberTheoryPartI §1.8a. No other layer.

## Scope and ownership

This roadmap owns: the coefficients `η_j` as the Taylor coefficients of `−ζ'/ζ − 1/(s − 1)` at
`1` (1.1); the closed arithmetic formula for Li's coefficients of `ζ` (2.1); the arithmetic
limit for the `η_j` with a remainder exponent uniform in `j` (3.1); Yoshida's local positivity
of Weil's form in Bombieri's quantitative form (4.1).

Stated by other roadmaps and consumed, not restated:

- WeilPositivityAndLiCriterion owns the zero multiplicities `zetaZeroMult` and their
  symmetries (1.1–1.2), the Li coefficients `liCoeff` with their summability, Li's criterion,
  the symmetric limit and Li's derivative formula (Layer 3, consumed through 3.4), and Weil's
  form `weilForm`, its summability and reality (5.1, consumed) and Weil's criterion (5.2). Its
  definitions `zetaZeroMult`, `liCoeff` and `weilForm` are copied verbatim into
  `Suggested.lean`; its theorems are not restated. It names the arithmetic formula and Yoshida's
  local positivity as outside its scope; they are the subject here.
- AnalyticNumberTheoryPartI §1.8a owns Gauss's integral for `ψ` (`digamma_eq_integral`); the
  polygamma values `ψ^(m)(1/2)` that 2.1 needs are a step of its route, derived from that
  integral above and not stated as a target. SpecialFunctionsGamma 1.5 states them among its
  special values of the polygamma functions; nothing here depends on that roadmap.
- ZerosOfLFunctions owns the gamma-factor asymptotics and the logarithmic derivative of `Γℝ`
  (1.2–1.4), the Weil explicit formula (8.4), the effective prime ideal theorem (8.5) and its
  Lean form over `ℚ` (8.7). AnalyticNumberTheoryPartIII 10.2 with 10.3 also yields the
  remainder for `ψ` over `ℚ`, as an example there; 3.1 uses ZerosOfLFunctions 8.5.
- AnalyticNumberTheoryPartIII owns Mellin convolution and the decay of Mellin transforms of
  bumps (9.1–9.2). AnalyticNumberTheoryPartI §1.8a states Weil's explicit formula for `ζ` with
  `C¹` test functions and its critical-line archimedean form, an alternative for one step of 4.1.
- ExplicitPrimeCounting owns the explicit forms of `∑_{n ≤ x} Λ(n)/n` (4.2, through the exact
  transfer 0.7 and the constant of 0.2): Ramaré's `O*(1.833/log² x)` and, among others, the
  exponential form of Broadbent, Fiori, Kadiri, Ng and Wilk, which by itself gives the case
  `j = 0` of 3.1 with an explicit exponent. Theorem 3.1 is a different statement: it is
  qualitative, and its one exponent serves every `j`, which 4.2 does not treat. The case
  `j = 0` is not stated separately here, and the comparison with 4.2 is a Check.
- ExplicitMultiplicativeFunctions 0.5 defines the first Stieltjes constant; it appears here
  only as a numerical value in the Checks of 1.1. Stieltjes constants are not defined here.

Not treated here: Li coefficients of Dedekind zeta functions (ExplicitNumberFields, Part II) and
of automorphic L-functions; the asymptotics of `λₙ`, unconditional or under the Riemann
hypothesis; Yoshida's explicit verification of positivity for a specific support length, which
is a finite computation; Bombieri's results on eigenvalues of Weil's functional; the Stieltjes
constants as objects; any numerical verification of zeros or coefficients.

## Exact supplier contracts

### From Mathlib

- `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean`: `riemannZeta₁` (`1 + (s − 1) riemannZeta₀ s`,
  equal to `(s − 1) ζ(s)` for `s ≠ 1`), `riemannZeta₁_one` (`ζ₁(1) = 1`),
  `deriv_riemannZeta₁_one` (`ζ₁'(1) = γ`), `differentiable_riemannZeta₁` (entire),
  `riemannZeta₁_ne_zero_of_near_one` (nonzero on a neighbourhood of `1`),
  `riemannZeta_eq_inv_sub_mul` (`ζ(s) = (s − 1)⁻¹ ζ₁(s)` for `s ≠ 1`),
  `log_deriv_riemannZeta_eq_neg_inv_sub_add` (`ζ'/ζ = −(s − 1)⁻¹ + ζ₁'/ζ₁` on a punctured
  neighbourhood of `1`).
- `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`: `completedRiemannZeta_eq`
  (`Λ(s) = Λ₀(s) − 1/s − 1/(1 − s)`), `riemannZeta_def_of_ne_zero` (`ζ = Λ/Γℝ` for `s ≠ 0`).
- `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean`: `Complex.Gammaℝ`
  (`π^(−s/2) Γ(s/2)`), `Complex.Gammaℝ_one` (`Γℝ(1) = 1`).
- `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean`: `Complex.digamma` (`logDeriv Gamma`),
  `Complex.digamma_one_half` (`ψ(1/2) = −2 log 2 − γ`).
- `Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean`: `iteratedDeriv_mul` (Leibniz rule for
  functions `ContDiffAt` the point). `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`:
  `iteratedDeriv`. `Mathlib/Analysis/Calculus/LogDeriv.lean`: `logDeriv`.
- `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean`: `ArithmeticFunction.vonMangoldt`.
  `Mathlib/NumberTheory/LSeries/Dirichlet.lean`:
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`L(Λ, s) = −ζ'(s)/ζ(s)` for
  `Re s > 1`).
- `Mathlib/NumberTheory/Chebyshev.lean`: `Chebyshev.psi`, `Chebyshev.isBigO_psi_sub_theta_sqrt`
  (`ψ − θ = O(√x)`). `Mathlib/NumberTheory/AbelSummation.lean`:
  `sum_mul_eq_sub_sub_integral_mul` (Abel summation with a `C¹` weight).
- `Mathlib/Analysis/MellinTransform.lean`: `mellin`. `Mathlib/Analysis/Fourier/LpSpace.lean`:
  `MeasureTheory.Lp.norm_fourier_eq` (Plancherel on `L²`).
  `Mathlib/Analysis/Convolution.lean`: `HasCompactSupport.contDiff_convolution_left`.
- `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean`: `Complex.log`.
- For the polygamma values in 2.1: `Filter.EventuallyEq.iteratedDeriv_eq` (iterated derivatives
  depend only on the germ), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation
  under the integral sign, also used in 3.1),
  `MeasureTheory.integral_tsum_of_summable_integral_norm` (termwise integration),
  `Real.integral_rpow_mul_exp_neg_mul_Ioi` (`∫_0^∞ t^(r−1) e^(−at) dt = Γ(r)/a^r`) and
  `zeta_nat_eq_tsum_of_gt_one` (`ζ(k) = ∑ 1/n^k` for `k ≥ 2`).

### From TauCetiRoadmap.WeilPositivityAndLiCriterion

- Definitions copied verbatim: `zetaZeroMult` (1.1), `liCoeff` (3.1), `weilForm` (5.1).
- 3.4, Li's derivative formula (its theorem liCoeff_eq_iteratedDeriv): for `n ≥ 1`,
  `liCoeff n = iteratedDeriv n (s ↦ s^(n−1) Complex.log (riemannXi s)) 1/(n − 1)!`, with
  `riemannXi s = (s(s − 1) completedRiemannZeta₀ s + 1)/2`.
- 5.1, `summable_weilForm_and_im_eq_zero`: for a smooth `g` with compact support in `(0, ∞)`
  the family defining `weilForm g g` is summable and `weilForm g g` is real.

### From TauCetiRoadmap.ZerosOfLFunctions

- 1.2–1.4: Stirling on a sector, `ψ(s) = log s + O(1/|s|)` there, and
  `logDeriv Gammaℝ s = ψ(s/2)/2 − (log π)/2` off the poles.
- 8.4, `riemannZeta_weilExplicitFormula`: for smooth `φ` with compact support in `(0, ∞)`,
  `∑_ρ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (2π)⁻¹ ∫ logDeriv Gammaℝ(2 + it)(φ̃(2 + it) + φ̃(−1 − it)) dt −
  ∑_n Λ(n)(φ(n) + φ(1/n)/n)`, the zero family summable.
- 8.5: for every number field `K` (here `K = ℚ`), `ψ_K(x) = x + O(x exp(−c √(log x)))` for some
  `c > 0`; 8.7, `primeCounting_progression_effective` (at `q = 1`):
  `π(x) = Li(x) + O(x exp(−c √(log x)))`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

- 9.1: the Mellin convolution `(f ⋆ g)(x) = ∫_(0,∞) f(y) g(x/y) dy/y`, its Mellin transform the
  product of the transforms under absolute convergence, and its support rule.
- 9.2: for `ν` of class `C^k`, `k ≥ 1`, supported in `[a, b] ⊂ (0, ∞)`, `mellin ν` is entire and
  `O((1 + |s|)^(−k))` on vertical strips.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §1.8a, `digamma_eq_integral`: for `Re z > 0`, `ψ(z) = ∫_0^∞ (e^(−t)/t − e^(−zt)/(1 − e^(−t))) dt`,
  the combined integrand being integrable on `(0, ∞)` (used in 2.1).
- §1.8a, `zeta_weil_archimedean_critical_line`: for `F` in its class `WeilC1TestFunction`, which
  contains `x ↦ φ(eˣ) e^(x/2)` for smooth compactly supported `φ` on `(0, ∞)`, the archimedean
  term of Weil's formula is `F(0) log π` minus the symmetric limit of
  `(2π)⁻¹ ∫_{−T}^{T} Re ψ(1/4 + it/2) F̂(t) dt` (an alternative to the contour shift in 4.1).

## References

- J. C. Lagarias, *Li coefficients for automorphic L-functions*, arXiv:math/0404394v4: (1.1)–(1.3),
  p. 1; Definition 4.2, (4.5), and Lemma 4.2, (4.6)–(4.9), p. 15; (4.11)–(4.13) and the
  arithmetic expression for `η_j` after (4.13), p. 16; Lemma 4.3, p. 17, and the remark on
  `τₙ(π_triv)`, p. 18. Page numbers are those printed in the arXiv version. Its (4.13) as printed
  carries a sign `(−1)^(j−1)` inconsistent with its (4.8) (see 2.1).
- E. Bombieri, *Remarks on Weil's quadratic functional in the theory of prime numbers, I*, Rend.
  Mat. Acc. Lincei s. 9 v. 11 (2000), 183–233, open at the BDIM archive (bdim.eu): the
  introduction, p. 184; §12, Theorem 12 and its proof, (12.3)–(12.9), pp. 226–227.
- Attributed in prose without a locator: E. Bombieri and J. C. Lagarias, *Complements to Li's
  criterion for the Riemann hypothesis*, J. Number Theory 77 (1999), Theorem 2 (the arithmetic
  formula); H. Yoshida, *On Hermitian forms attached to zeta functions* (1992) (local
  positivity); Xian-Jin Li, J. Number Theory 65 (1997) (Li's coefficients).

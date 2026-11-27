# Roadmap: quadrature rules and Peano kernels

**Summary.** A quadrature rule on `[a, b]` replaces `∫_a^b f` by a weighted sum `∑ wᵢ f(xᵢ)`
of values at nodes `xᵢ ∈ [a, b]`. This roadmap develops the classical error theory of such rules
for real functions of one variable. Every target is an identity, an inequality, an existence
statement or a characterization; no procedure is specified. The headline theorems are these.

- *Peano kernel theorem.* If `a ≤ b` and a rule with nodes in `[a, b]` integrates every polynomial of degree
  at most `m` exactly and `f` is of class `C^{m+1}` on `[a, b]`, its error is
  `(1/m!) ∫_a^b K(t) f⁽ᵐ⁺¹⁾(t) dt`, where `K(t)` is the error of the rule on the truncated power
  `(x − t)₊ᵐ`. If `K` keeps one sign, the error is the error on `x^{m+1}` divided by `(m + 1)!`,
  times `f⁽ᵐ⁺¹⁾(ξ)` for some `ξ ∈ [a, b]`.
- *Composite rules.* For `a ≤ b`, `n ≥ 1` subintervals of width `h = (b − a)/n` and `f` of class
  `C²` on `[a, b]`, the trapezoidal rule minus the integral is `(b − a) h²/12 · f''(ξ)` and the
  integral minus the midpoint rule is `(b − a) h²/24 · f''(ξ)` for some `ξ ∈ [a, b]`. For `f` of
  class `C⁴`, `n ≥ 1` panels and `h = (b − a)/(2n)`, the integral minus Simpson's rule is
  `−(b − a) h⁴/180 · f⁽⁴⁾(ξ)`. The constants are attained by `x²` and `x⁴`.
- *Negative weights.* The closed Newton–Cotes rule with nine equally spaced nodes on `[0, 1]` has
  the weights `(989, 5888, −928, 10496, −4540, 10496, −928, 5888, 989)/28350`.
- *Convergence.* A sequence of rules, each with distinct nodes in `[a, b]`, converges to the
  integral for every continuous function on `[a, b]` if and only if it converges for every
  polynomial and the sums of the absolute values of the weights are bounded.
- *Periodic integrands.* If `f` is holomorphic, `2π`-periodic and bounded by `M` in the strip
  `|Im z| < a`, `a > 0`, the `N`-point trapezoidal rule on `[0, 2π]`, `N ≥ 1`, has error at most
  `4πM/(e^{aN} − 1)`.

The roadmap builds on Mathlib's trapezoidal rule, Taylor's theorem, Lagrange interpolation, the
theorems of Weierstrass and Banach–Steinhaus and the Fourier series of the Bernoulli polynomials,
and on the Euler–Maclaurin formula of AsymptoticExpansions. It continues
PolynomialInterpolationAndBestApproximation, which leaves quadrature open, and is disjoint from
the Gauss quadrature of SpecialFunctionsOrthogonalPolynomialsGeneral.

Layer 1 proves the Peano kernel theorem and its mean value form; Layer 2 sharpens Mathlib's
trapezoidal bound to a mean value form, applies Layer 1 panel by panel to the midpoint and Simpson
rules, and relates the three rules by halving the step; Layer 3 treats the closed
Newton–Cotes rules; Layer 4 proves the convergence criterion; Layer 5 bounds the trapezoidal rule
for smooth and for analytic periodic integrands. Layers 3, 4 and 5 do not use Layer 1.

## Conventions

- **Rules.** A rule on `[a, b]` with `k` nodes is a pair `w x : Fin k → ℝ` of weights and nodes;
  it sends `f` to `∑ i, w i * f (x i)`. Its *error* is `∫_a^b f − ∑ i, w i * f (x i)`. Mathlib's
  `trapezoidal_error f N a b` has the opposite sign: it is the rule minus the integral, and 2.1
  and 5.1 keep that sign. A rule is *exact in degree `m`* if its error vanishes on every real
  polynomial `p` with `p.natDegree ≤ m` (the zero polynomial included).
- **Truncated powers and the Peano kernel.** The truncated power `(y − t)₊ᵐ` is `(y − t)ᵐ` for
  `t < y` and `0` for `y ≤ t`, so that for `m = 0` it is the indicator of `t < y`. The Peano
  kernel `peanoKernel a b w x m t` is the error of the rule on `y ↦ (y − t)₊ᵐ`.
- **Derivatives.** Derivatives of a function on `[a, b]` are taken within `[a, b]`
  (`iteratedDerivWithin k f (Icc a b)`), so that they are one-sided at the endpoints;
  `ContDiffOn ℝ k f (Icc a b)` is the smoothness hypothesis.
- **Composite rules.** With `n` subintervals of width `h = (b − a)/n`, the trapezoidal rule is
  Mathlib's `trapezoidal_integral f n a b = h (f(a)/2 + f(a + h) + ⋯ + f(b − h) + f(b)/2)` and
  the midpoint rule is `midpointRule f n a b = h ∑_{j<n} f(a + (j + 1/2) h)`. Simpson's rule
  `simpsonRule f n a b` uses `n` panels of width `2h`, `h = (b − a)/(2n)`, and is
  `(h/3) ∑_{j<n} (f(a + 2jh) + 4 f(a + (2j + 1)h) + f(a + (2j + 2)h))`. With `n = 0` all three
  are `0`, because `(b − a)/0 = 0`.
- **Newton–Cotes rules.** For `n ≥ 1` the closed Newton–Cotes rule with `n + 1` nodes on `[0, 1]`
  has the nodes `i/n`, `0 ≤ i ≤ n`, and the weights `newtonCotesWeight n i`, the integrals over
  `[0, 1]` of the Lagrange basis polynomials of these nodes.
- **Bernoulli numbers** are Mathlib's `bernoulli`, with `B₂ = 1/6` and `B₄ = −1/30`.

## Layer 1: the Peano kernel

### 1.1 The Peano kernel theorem

Define `peanoKernel` (Conventions). Prove `integral_sub_sum_eq_integral_peanoKernel`: if `a ≤ b`, every node
lies in `[a, b]`, the rule is exact in degree `m` and `f` is of class `C^{m+1}` on `[a, b]`, then

    ∫_a^b f − ∑ wᵢ f(xᵢ) = (1/m!) ∫_a^b K(t) f⁽ᵐ⁺¹⁾(t) dt,   K = peanoKernel a b w x m.

For `a = b` exactness on `1` gives `∑ wᵢ = 0` and both sides vanish. (Proved here; the
representation is Peano's.)

Route, for `a < b`. Let `g = f⁽ᵐ⁺¹⁾` and let `P(x) = ∑_{j ≤ m} f⁽ʲ⁾(a)(x − a)ʲ/j!` with the
derivatives taken within `[a, b]`. For `x ∈ (a, b]`, Taylor's theorem with integral remainder on
`[a, x]` (`taylor_integral_remainder`, written out by `taylor_within_apply`) gives
`f(x) = P(x) + (1/m!) ∫_a^x (x − t)ᵐ g_x(t) dt`, with the derivatives within `[a, x]`; these agree
with the derivatives within `[a, b]` at the points of `[a, x]`
(`iteratedDerivWithin_eq_iteratedFDerivWithin` and `iteratedFDerivWithin_subset`, both intervals
having unique derivatives by `uniqueDiffOn_Icc`). The same formula holds at `x = a`, where both
sides are `f(a)`. Since `(x − t)₊ᵐ` vanishes for `t ≥ x` and equals `(x − t)ᵐ` for `t < x`,
`f(x) = P(x) + (1/m!) ∫_a^b (x − t)₊ᵐ g(t) dt` for every `x ∈ [a, b]`. The error is linear and
vanishes on `P`. On the remainder, the integral over `x` and the sum over the nodes are exchanged
with the integral over `t` (`MeasureTheory.integral_integral_swap`; the integrand is bounded and
measurable on `[a, b]²`, as `g` is continuous there by
`ContDiffOn.continuousOn_iteratedDerivWithin`), which produces `∫_a^b K(t) g(t) dt / m!`.

*Needs:* Mathlib `taylor_integral_remainder`, `taylor_within_apply`,
`iteratedDerivWithin_eq_iteratedFDerivWithin`, `iteratedFDerivWithin_subset`, `uniqueDiffOn_Icc`,
`ContDiffOn.continuousOn_iteratedDerivWithin`, `MeasureTheory.integral_integral_swap`.

**Checks.**
- On `[0, 1]`: trapezoid, `m = 1`, `K(t) = −t(1 − t)/2`; midpoint, `m = 1`,
  `K(t) = min(t, 1 − t)²/2`; Simpson, `m = 3`, `K(t) = t³(3t − 2)/12` on `[0, 1/2]`, symmetric.
- For these three rules, with `m = 0, 1` for the first two and `m = 2, 3` for Simpson, both sides
  agree exactly for `f = x⁷ − 3x⁵ + x⁴` and `f = eˣ`.
- With `(y − t)₊⁰` read as `max(y − t, 0)⁰ = 1`, the kernel of order `0` of a rule exact on
  constants would be `(b − a) − ∑ wᵢ = 0`, while the midpoint rule on `[0, 1]` has error `1/12` on
  `x²`: the convention `0` for `y ≤ t` is the one that makes the theorem true.

### 1.2 Kernels of one sign

Prove `exists_integral_sub_sum_eq_of_peanoKernel_sign`: under the hypotheses of 1.1, if moreover
`K ≥ 0` on `[a, b]` or `K ≤ 0` on `[a, b]`, there is `ξ ∈ [a, b]` with

    ∫_a^b f − ∑ wᵢ f(xᵢ) = E(x^{m+1})/(m + 1)! · f⁽ᵐ⁺¹⁾(ξ),
    E(x^{m+1}) = ∫_a^b x^{m+1} − ∑ wᵢ xᵢ^{m+1}.

(Proved here.)

Route. For `a = b`, take `ξ = a`: both sides vanish since `∑ wᵢ = 0`. For `a < b`, `g = f⁽ᵐ⁺¹⁾`
is continuous on `[a, b]` and attains a least value `g(s₁)` and a greatest value `g(s₂)` there
(`IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`). Say `K ≥ 0`; then
`g(s₁) ∫ K ≤ ∫ K g ≤ g(s₂) ∫ K` (`intervalIntegral.integral_mono_on`). If `∫ K = 0` then `∫ K g = 0`
and any `ξ` serves. Otherwise `∫ K g / ∫ K` lies between `g(s₁)` and `g(s₂)` and equals `g(ξ)` for
some `ξ` between them (`intermediate_value_Icc` and its dual). Finally 1.1 applied to
`x^{m+1}`, whose derivative of order `m + 1` within `[a, b]` is `(m + 1)!`, gives
`∫ K = m! E(x^{m+1})/(m + 1)!`. The case `K ≤ 0` is the same with the inequalities reversed.

*Needs:* 1.1; Mathlib `IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`,
`intervalIntegral.integral_mono_on`, `intermediate_value_Icc`, `intermediate_value_Icc'`.

**Checks.**
- The kernels of 1.1 have one sign, with integrals `−1/12`, `1/24`, `−1/480`, equal to
  `m! E(x^{m+1})/(m + 1)!` (`E(x²) = −1/6`, `E(x²) = 1/12`, `E(x⁴) = −1/120`); for Simpson the
  formula reads `−f⁽⁴⁾(ξ)/2880` on `[0, 1]`.

### Examples

- Simpson's rule is exact in degree `3`: its error on `x³` over `[0, 1]` is `1/4 − (4/8 + 1)/6 = 0`.

### Dependencies

1.1 uses Mathlib; 1.2 uses 1.1.

## Layer 2: composite rules

### 2.1 The trapezoidal rule

Prove `exists_trapezoidal_error_eq`: for `a ≤ b`, `f` of class `C²` on `[a, b]` and `N ≥ 1`
there is `ξ ∈ [a, b]` with `T_N(f) − ∫_a^b f = (b − a) h²/12 · f''(ξ)`, `h = (b − a)/N`.
(Abramowitz–Stegun 25.4.1 and 25.4.2, p. 885, with `x_m − x₀ = mh`.) This is the mean value form
of Mathlib's bound `trapezoidal_error_le_of_c2`, from which it follows in a few steps.

Route. For `a = b` both sides vanish (`trapezoidal_error_eq`). Let `a < b`, let `μ` and `ν` be the
least and the greatest value of the continuous `f''` on `[a, b]`
(`ContDiffOn.continuousOn_iteratedDerivWithin`, `IsCompact.exists_isMinOn`,
`IsCompact.exists_isMaxOn`), `c = (μ + ν)/2` and `K = (b − a) h²/12`. The rule and the integral
are linear in `f`, and on `q(x) = x²/2` the error is exactly `K` (a sum of squares; the Check
below). For `g = f − c q`, `g'' = f'' − c` on `[a, b]` (`iteratedDerivWithin_sub`), so
`|g''| ≤ (ν − μ)/2` on `[a, b]`, and outside `[a, b]` the derivative within `[a, b]` is `0`;
`trapezoidal_error_le_of_c2` gives `|T_N(f) − ∫ f − cK| ≤ (ν − μ)/2 · K`. Hence
`(T_N(f) − ∫ f)/K` lies in `[μ, ν]` and equals `f''(ξ)` for some `ξ ∈ [a, b]`
(`intermediate_value_Icc`). (A second route applies 1.2 to each subinterval, where the trapezoid
has the Peano kernel `−(t − c)(c + h − t)/2 ≤ 0`, and adds the errors with
`sum_trapezoidal_error_adjacent_intervals`.)

*Needs:* Mathlib `trapezoidal_error`, `trapezoidal_error_le_of_c2`, `trapezoidal_error_eq`,
`iteratedDerivWithin_sub`, `ContDiffOn.continuousOn_iteratedDerivWithin`,
`IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`, `intermediate_value_Icc`.

**Checks.**
- `f = x²` on `[0, 1]`, `N = 1`: `T₁ − I = 1/2 − 1/3 = 1/6 = 1 · 1/12 · 2`; equality holds for
  `x²` on `[0, 1]`, `[1, 3]` and `[−2, 5/3]` with `N = 1, 2, 3, 5`.
- `N ≥ 1` is needed: with `N = 0` the rule is `0`, and for `f = 1` on `[0, 1]` the left side is
  `−1` while the right side is `0`.
- `a ≤ b` is needed: for `a = 1`, `b = 0`, `N = 1` and `f = x²` the left side is
  `−1/2 + 1/3 = −1/6`, and `[1, 0]` contains no `ξ`.

### 2.2 The midpoint rule

Define `midpointRule`. Prove `exists_integral_sub_midpointRule_eq`: for `a ≤ b`, `f` of class `C²`
on `[a, b]` and `n ≥ 1` there is `ξ ∈ [a, b]` with
`∫_a^b f − M_n(f) = (b − a) h²/24 · f''(ξ)`, `h = (b − a)/n`. (Proved here.)

Route. For `a = b` both sides vanish. Let `a < b`. On `[c, c + h]`, `a ≤ c < c + h ≤ b`, the
midpoint rule is exact in degree `1` with Peano kernel of order `1` equal to
`min(t − c, c + h − t)²/2 ≥ 0`, of integral `h³/24`; by 1.2 its error is `h³/24 · f''(ξⱼ)` with
`ξⱼ ∈ [c, c + h]`, the derivative taken within `[c, c + h]`. At points of `[c, c + h]` it equals
the derivative within `[a, b]`: `f` is of class `C²` on `[c, c + h]` (`ContDiffOn.mono`), both
intervals have unique derivatives (`uniqueDiffOn_Icc`), and `iteratedFDerivWithin_subset` with
`iteratedDerivWithin_eq_iteratedFDerivWithin` identifies the two. Sum over the `n` subintervals:
the mean of the values `f''(ξⱼ)` lies between the least and the greatest value of the continuous
`f''` on `[a, b]`, hence equals `f''(ξ)` for some `ξ ∈ [a, b]` (`intermediate_value_Icc`), and
`n h³/24 = (b − a) h²/24`.

*Needs:* 1.2; Mathlib `ContDiffOn.mono`, `uniqueDiffOn_Icc`, `iteratedFDerivWithin_subset`,
`iteratedDerivWithin_eq_iteratedFDerivWithin`, `ContDiffOn.continuousOn_iteratedDerivWithin`,
`intermediate_value_Icc`.

**Checks.**
- `f = x²` on `[0, 1]`, `n = 1`: `1/3 − 1/4 = 1/12 = 1 · 1/24 · 2`; equality holds for `x²` on the
  three intervals of 2.1 with `n = 1, 2, 3, 5`.
- With `n = 0` and `f = 1` on `[0, 1]` the left side is `1` and the right side `0`.

### 2.3 Simpson's rule

Define `simpsonRule`. Prove `exists_integral_sub_simpsonRule_eq`: for `a ≤ b`, `f` of class `C⁴`
on `[a, b]` and `n ≥ 1` there is `ξ ∈ [a, b]` with
`∫_a^b f − S_n(f) = −(b − a) h⁴/180 · f⁽⁴⁾(ξ)`, `h = (b − a)/(2n)`. For `n = 1` the constant is
`(b − a)⁵/2880`. (Abramowitz–Stegun 25.4.5 and 25.4.6, p. 886: the error `−nh⁵/90 · f⁽⁴⁾(ξ)` with
`2nh = b − a`.)

Route. On a panel `[c, c + 2h]` Simpson's rule is exact in degree `3` (it is symmetric about the
midpoint, so it integrates `(x − c − h)³` to `0`, and it is interpolatory in degree `2`), and its
Peano kernel of order `3` is `u³(3u − 4h)/12 ≤ 0` for `u = t − c ∈ [0, h]`, symmetric about
`c + h`, with integral `−(2h)⁵/480`. By 1.2 the panel error is `−(2h)⁵/2880 · f⁽⁴⁾(ξⱼ) =
−h⁵/90 · f⁽⁴⁾(ξⱼ)`, the derivative within the panel being that within `[a, b]` as in 2.2. Sum
over the `n` panels and average as in 2.2: `n h⁵/90 = (b − a) h⁴/180`. For `a = b` both sides
vanish.

*Needs:* 1.2; Mathlib `ContDiffOn.mono`, `uniqueDiffOn_Icc`, `iteratedFDerivWithin_subset`,
`iteratedDerivWithin_eq_iteratedFDerivWithin`, `ContDiffOn.continuousOn_iteratedDerivWithin`,
`intermediate_value_Icc`.

**Checks.**
- `f = x⁴` on `[0, 1]`, `n = 1`: `1/5 − (0 + 4/16 + 1)/6 = −1/120 = −(1/16)/180 · 24`; equality
  holds for `x⁴` on the three intervals of 2.1 with `n = 1, 2, 3, 5`, and the error vanishes on
  `x³`.
- With `n = 0` and `f = 1` on `[0, 1]` the left side is `1` and the right side `0`.

### 2.4 Halving the step

Prove `trapezoidal_two_mul_and_richardson`: for every `f`, `n ≥ 1` and `a, b`,
`T_{2n}(f) = (T_n(f) + M_n(f))/2` and `(4 T_{2n}(f) − T_n(f))/3 = S_n(f)`. (Proved here. For
`n = 0` both identities hold only because all three rules are then `0`.)

Route. With `h = (b − a)/(2n)`, the nodes of `T_{2n}` are those of `T_n` at the even multiples
of `h` and the midpoints of `M_n` at the odd ones; the sum over `range (2n − 1)` splits by the
parity of the index, by induction on `n` with `Finset.sum_range_succ`. Then
`S_n = (2 M_n + T_n)/3`, which is the second identity after substituting the first.

*Needs:* Mathlib `trapezoidal_integral`, `Finset.sum_range_succ`.

**Checks.**
- For an undetermined function `F` and `n = 1, 2, 3, 4`, both identities hold as identities between
  linear combinations of the values of `F`.

### Examples

- If `f'' ≥ 0` on `[a, b]`, the trapezoidal rule lies above the integral, the midpoint rule below.

### Dependencies

2.1 uses Mathlib only; 2.2 and 2.3 use 1.2; 2.4 uses only the definitions.

## Layer 3: closed Newton–Cotes rules

### 3.1 Degree of exactness

Define `newtonCotesWeight n i = ∫_0^1 ℓᵢ`, `ℓᵢ` the Lagrange basis polynomial of the node `i/n`
among `0, 1/n, …, 1`. Prove `integral_eq_sum_newtonCotesWeight`: for `n ≥ 1` the rule
`∑ᵢ wᵢ p(i/n)` integrates every polynomial `p` of degree at most `n` exactly over `[0, 1]`, and
every `p` of degree at most `n + 1` if `n` is even. (Embree, lecture 21, Theorem 3.1, p. 121, for
the first part; the second is proved here.)

Route. For degree at most `n`, `p` is its own interpolant at the `n + 1` distinct nodes
(`Lagrange.eq_interpolate`), so `∫ p = ∑ p(i/n) ∫ ℓᵢ`. The map `y ↦ 1 − y` permutes the nodes by
`i ↦ n − i` and carries `ℓᵢ` to `ℓ_{n−i}`, so `wᵢ = w_{n−i}`
(`intervalIntegral.integral_comp_sub_left`).
For `n` even and degree `n + 1`, write `p = c (X − 1/2)^{n+1} + q` with `q` of degree at most
`n`. The odd power `(y − 1/2)^{n+1}` integrates to `0` over `[0, 1]`, and its values at `i/n` and
`(n − i)/n` are opposite, so the symmetric weights also give `0`.

*Needs:* Mathlib `Lagrange.basis`, `Lagrange.interpolate`, `Lagrange.eq_interpolate`,
`intervalIntegral.integral_comp_sub_left`.

**Checks.**
- `n = 0` is excluded: the one-node rule has weight `1` at `0`, and on `p = X` (degree `1`) it
  gives `0` instead of `1/2`.
- For `n = 1, …, 10` the degree is exactly `n` for odd `n` and `n + 1` for even `n`: the error on
  the next monomial is nonzero, e.g. `−1/6` for `n = 1`, `−1/120` for `n = 2`, `−37/17301504` for
  `n = 8`.

### 3.2 The weights for nine and eleven nodes

Prove `newtonCotesWeight_pos_and_eight`: all weights are positive for `n ∈ {1, …, 7, 9}`; for
`n = 8` the weights are `(989, 5888, −928, 10496, −4540, 10496, −928, 5888, 989)/28350`; and for
`n = 10` the weight at the node `2/10` is `−48525/598752`. (Abramowitz–Stegun 25.4.13 to 25.4.20,
pp. 886–887, with `h = 1/n`; trapezoid and Simpson for `n = 1, 2`.)

Route. Each weight is the integral of an explicit polynomial with rational coefficients; expand
`ℓᵢ` and integrate term by term. (Proved here.)

*Needs:* 3.1's definition; Mathlib `integral_pow`.

**Checks.**
- The weights sum to `1` for every `n` (exactness on constants); for `n = 8`,
  `2(989 + 5888 − 928 + 10496) − 4540 = 28350`.
- `∑ᵢ |w_{8,i}| = 6857/4725 > 1` and `∑ᵢ |w_{10,i}| = 152921/49896 > 3`; for the other listed `n`
  the sum is `1`.

### Examples

- Simpson's rule on `[0, 1]` is the case `n = 2`, with weights `1/6, 4/6, 1/6`.

### Dependencies

3.1 uses Mathlib; 3.2 uses the definition of 3.1.

## Layer 4: convergence for continuous integrands

### 4.1 The convergence criterion

Prove `tendsto_rule_iff`: let a sequence of rules `(w n, x n)` have, for each `n`, distinct nodes
in `[a, b]`. Then `∑ᵢ w n i f(x n i) → ∫_a^b f` for every `f` continuous on `[a, b]` if and only if
the same holds for every polynomial and `∑ᵢ |w n i|` is bounded in `n`. (Proved here; the
criterion is due to Pólya and to Steklov.)

Route. If `a > b` there are no nodes and both sides fail for `f = 1`. Let `a ≤ b`. Sufficiency:
Weierstrass' theorem (`exists_polynomial_near_of_continuousOn`) gives `p` with `|f − p| < ε` on
`[a, b]`, and the error on `f` is at most `C ε + (b − a) ε` plus the error on `p`. Necessity: the
rules are continuous linear functionals `Qₙ` on `C([a, b], ℝ)`; `Qₙ g` converges for every `g`
(extended to `ℝ` by `Set.IccExtend`), so Banach–Steinhaus bounds `‖Qₙ‖`. And `‖Qₙ‖ ≥ ∑ᵢ |w n i|`:
for `δ` below half the least gap between the nodes, `∑ᵢ sign(w n i) max(0, 1 − |y − x n i|/δ)` is
continuous, bounded by `1`, and equals `sign(w n i)` at `x n i`.

*Needs:* Mathlib `exists_polynomial_near_of_continuousOn`, `banach_steinhaus`, `Set.IccExtend`.

**Checks.**
- Distinct nodes are needed: on `[0, 1]` take the `n`-th rule to be the midpoint rule with `n + 1`
  subintervals together with two extra nodes at `0` carrying the weights `n` and `−n`. It
  converges for every continuous `f` (the extra terms cancel), while `∑ |w| = 2n + 1`.

### Examples

- The composite trapezoidal, midpoint and Simpson rules have positive weights summing to `b − a`,
  and converge on polynomials by 2.1–2.3; by 4.1 they converge for every continuous `f`.

### Dependencies

4.1 uses Mathlib only.

## Layer 5: the trapezoidal rule for periodic integrands

### 5.1 Matching odd derivatives

Prove `abs_trapezoidal_error_le_of_odd_deriv_eq`: let `a ≤ b`, `m ≥ 1`, `f` of class `C^{2m}` on
`[a, b]` with `f⁽²ʲ⁻¹⁾(a) = f⁽²ʲ⁻¹⁾(b)` for `1 ≤ j ≤ m`, and `N ≥ 1`. Then

    |T_N(f) − ∫_a^b f| ≤ |B_{2m}|/(2m)! · h^{2m} ∫_a^b |f⁽²ᵐ⁾|,   h = (b − a)/N.

It applies to one period of a smooth periodic function. (Proved here.) Route. For `a = b` both
sides vanish. For `a < b` put `g(s) = f(a + hs)` on `[0, N]`; then
`g⁽ᵏ⁾(s) = hᵏ f⁽ᵏ⁾(a + hs)` for `k ≤ 2m` and `s ∈ [0, N]`, the derivatives taken within `[0, N]`
and within `[a, b]`: the translation by `a` carries `[0, b − a]` to `[a, b]`
(`iteratedDerivWithin_comp_const_add`), and the dilation `s ↦ hs` is a continuous linear map
whose preimage of `[0, b − a]` is `[0, N]`, so `ContinuousLinearMap.iteratedFDerivWithin_comp_right`,
evaluated at `(1, …, 1)` and read through `iteratedDerivWithin_eq_iteratedFDerivWithin`, gives the
factor `hᵏ` (both intervals have unique derivatives, `uniqueDiffOn_Icc`). Moreover
`T_N(f) = h (∑_{j=0}^N g(j) − (g(0) + g(N))/2)` and `∫_a^b f = h ∫_0^N g`
(`intervalIntegral.integral_comp_mul_left`). The
Euler–Maclaurin formula of order `2m` (AsymptoticExpansions 13.1) for `g` on the integers `0 < N`
has all terms `B_{2s}/(2s)! (g⁽²ˢ⁻¹⁾(N) − g⁽²ˢ⁻¹⁾(0))`, `1 ≤ s < m`, equal to `0` by hypothesis,
and its remainder is `∫_0^N (B_{2m} − B̃_{2m}(s))/(2m)! · g⁽²ᵐ⁾(s) ds`, `B̃` the periodic Bernoulli
function. The part with `B_{2m}` equals `B_{2m}/(2m)! (g⁽²ᵐ⁻¹⁾(N) − g⁽²ᵐ⁻¹⁾(0)) = 0`
(`intervalIntegral.integral_eq_sub_of_hasDeriv_right_of_le`, the hypothesis for `j = m`). For the
rest, `|B_{2m}(u)| ≤ |B_{2m}|` on `[0, 1]`: by `hasSum_one_div_nat_pow_mul_cos`,
`B_{2m}(u) = (−1)^{m+1} 2(2m)!/(2π)^{2m} ∑_{k≥1} cos(2πku)/k^{2m}`, whose absolute value is at
most its value at `u = 0` (DLMF 24.9.1). Hence the error is at most
`h |B_{2m}|/(2m)! ∫_0^N h^{2m} |f⁽²ᵐ⁾(a + hs)| ds`, which is the bound.

*Needs:* AsymptoticExpansions 13.1 `sum_Icc_eq_eulerMaclaurin`; Mathlib `trapezoidal_integral`,
`hasSum_one_div_nat_pow_mul_cos`, `bernoulliFun`, `intervalIntegral.integral_comp_mul_left`,
`intervalIntegral.integral_eq_sub_of_hasDeriv_right_of_le`, `iteratedDerivWithin_comp_const_add`,
`ContinuousLinearMap.iteratedFDerivWithin_comp_right`, `iteratedDerivWithin_eq_iteratedFDerivWithin`,
`uniqueDiffOn_Icc`.

**Checks.**
- The hypothesis on odd derivatives is needed: `f = x⁴/12 − x⁵/10 + x⁶/30`, `f'' = x²(1 − x)²`, on
  `[0, 1]` with `m = 1`, `N = 1` has `f'(0) = 0 ≠ 1/30 = f'(1)`, error `1/280` and bound `1/360`.
- `m ≥ 1` is needed: for `m = 0` the bound reads `∫_0^1 |f|`, and `f = (1 − x)⁴`, `N = 1` has error
  `1/2 − 1/5 = 3/10 > 1/5`.
- `f = cos 2πx` on `[0, 1]` meets the hypothesis for every `m`; with `N = 1` the error is `1`, and
  the bounds for `m = 1, 2, 3` are `2π/3`, `2π³/45` and `4π⁵/945`, all larger than `1`.

### 5.2 Analytic periodic integrands

Prove `norm_trapezoid_sub_integral_le_of_strip`: let `a > 0`, let `f : ℂ → ℂ` be holomorphic on the
strip `|Im z| < a`, with `f(z + 2π) = f(z)` and `|f(z)| ≤ M` there. Then for `N ≥ 1`

    |(2π/N) ∑_{j<N} f(2πj/N) − ∫_0^{2π} f| ≤ 4πM/(e^{aN} − 1).

(Trefethen–Weideman, Theorem 3.2 and equations (3.17) and (3.18), pp. 396–397; there the sum runs
over `j = 1, …, N`, which gives the same value by periodicity.)

Route. Let `cₖ = (1/2π) ∫_0^{2π} e^{−ikθ} f(θ) dθ` (`fourierCoeff` of the restriction of `f` to
`ℝ`, viewed on `AddCircle (2π)`). For `0 < a' < a` and `k > 0`, Cauchy's theorem on the rectangle
with corners `0` and `2π − ia'` (`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`; the
vertical sides cancel by periodicity) moves the integral to `Im θ = −a'`, where
`|e^{−ikθ}| = e^{−ka'}`; so `|cₖ| ≤ M e^{−ka'}`, and likewise for `k < 0` with the rectangle
above. The coefficients are summable, so the Fourier series converges to `f` on `ℝ`
(`hasSum_fourier_series_of_summable`). Summing it over the nodes, `∑_{j<N} e^{2πijk/N}` is `N` if
`N ∣ k` and `0` otherwise (`IsPrimitiveRoot.geom_sum_eq_zero` with `Complex.isPrimitiveRoot_exp`),
so the rule equals `2π ∑_{l ∈ ℤ} c_{lN}` while the integral is `2π c₀`. The error is at most
`2π ∑_{l ≠ 0} M e^{−|l| a' N} = 4πM/(e^{a'N} − 1)`, and `a' → a` gives the bound.

*Needs:* Mathlib `fourierCoeff`, `hasSum_fourier_series_of_summable`,
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`, `IsPrimitiveRoot.geom_sum_eq_zero`,
`Complex.isPrimitiveRoot_exp`.

**Checks.**
- The constant `4π` is attained in the limit: `f(z) = 2 cos Nz` has integral `0` and rule `4π`, and
  its supremum on the strip is `2 cosh Na`, so the ratio of bound to error is
  `(e^{Na} + e^{−Na})/(e^{Na} − 1)`, which tends to `1` as `a → ∞` (Trefethen–Weideman, after
  Theorem 2.2).
- `N ≥ 1` is needed: for `N = 0` the rule is `0`, the right side is `4πM/0 = 0`, and `f = 1`
  gives `2π`.
- Periodicity is needed: `f(z) = e^{iz/2}` is holomorphic and bounded by `e^{a/2}` on the strip;
  with `a = 10` and `N = 1` the error is `|2π − 4i| > 4`, while the bound is
  `4π e⁵/(e¹⁰ − 1) < 2384/21999 < 1`.

### Examples

- `f(z) = 1/(2 − cos z)` meets the hypotheses of 5.2 on every strip `|Im z| < a`, `a < arcosh 2`.

### Dependencies

5.1 uses AsymptoticExpansions 13.1 and Mathlib; 5.2 uses Mathlib only.

## Scope and ownership

This roadmap owns the Peano kernel and its two theorems (Layer 1), the mean value forms of the
composite trapezoidal, midpoint and Simpson errors and the identities between these rules (Layer
2), the closed Newton–Cotes weights (Layer 3), the convergence criterion (Layer 4) and the error
bounds of the trapezoidal rule for periodic integrands (Layer 5).

Already in the library and therefore not targets: the composite trapezoidal rule with its
additivity over adjacent intervals and the bound `|T_N(f) − ∫ f| ≤ |b − a|³ ζ/(12 N²)` for
`|f''| ≤ ζ` (`trapezoidal_error_le_of_c2`), which the mean value form 2.1 implies; the
Chebyshev–Gauss rule (`Polynomial.Chebyshev.integral_eq_sumZeroes`); Taylor's theorem with integral
remainder (`taylor_integral_remainder`).

Stated by other roadmaps:

- The Euler–Maclaurin formula is AsymptoticExpansions 13.1, used in 5.1 (ExplicitZetaBounds 0.5a
  states it for Banach-valued functions).
- Gauss quadrature, with its positive weights, exactness up to degree `2n − 1` and convergence for
  continuous functions, is SpecialFunctionsOrthogonalPolynomialsGeneral 5.3 and 5.5.
- OneStepMethodsForODEs 3.2 bounds the one-step residuals of the trapezoidal and midpoint rules for
  vector-valued functions with Lipschitz derivatives; 2.1 and 2.2 concern composite rules for real
  functions of class `C²`.
- ProbabilisticAndMetricNumberTheory 2.7 bounds equal-weight rules on functions of bounded
  variation by the star discrepancy of the nodes.

Not treated here: Gauss, Clenshaw–Curtis and Gauss–Kronrod rules; the growth of the Newton–Cotes
weights and divergence of Newton–Cotes rules; Romberg tables beyond one step; the Euler–Maclaurin
expansion of the trapezoidal error; adaptive, multidimensional, Monte Carlo and quasi-Monte Carlo
rules.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory/Integral/IntervalIntegral/TrapezoidalRule.lean`: `trapezoidal_integral f N a b`
  (`((b − a)/N)((f a + f b)/2 + ∑_{k<N−1} f(a + (k + 1)(b − a)/N))`), `trapezoidal_error` (rule
  minus integral), `trapezoidal_error_eq` (`0` for `a = b`),
  `sum_trapezoidal_error_adjacent_intervals` (for `0 < N` and `f` interval integrable on
  `[a, a + Nh]`, the errors of single trapezoids on `[a + ih, a + (i + 1)h]` sum to the error with
  `N` subintervals), `trapezoidal_error_le_of_c2` (for `f` of class `C²` on `[[a, b]]`, `0 < N` and
  `|f''| ≤ ζ` everywhere, the derivative taken within `[[a, b]]`, the error is at most
  `|b − a|³ ζ/(12 N²)`).
- `Analysis/Calculus/Taylor.lean`: `taylor_integral_remainder` (for `f` of class `C^{n+1}` on
  `uIcc x₀ x`, `f x` minus the Taylor polynomial within `uIcc x₀ x` is
  `∫_{x₀}^x ((x − t)ⁿ/n!) f⁽ⁿ⁺¹⁾(t) dt`) and `taylor_within_apply` (that polynomial as
  `∑_{k≤n} (k!)⁻¹ (x − x₀)ᵏ f⁽ᵏ⁾(x₀)`).
- `Analysis/Calculus/IteratedDeriv/Defs.lean`: `iteratedDerivWithin_eq_iteratedFDerivWithin` and
  `ContDiffOn.continuousOn_iteratedDerivWithin` (for `ContDiffOn 𝕜 n f s`, `m ≤ n` and
  `UniqueDiffOn 𝕜 s`, the `m`-th derivative within `s` is continuous on `s`);
  `Analysis/Calculus/ContDiff/Defs.lean`: `iteratedFDerivWithin_subset` (for `s ⊆ t` with unique
  derivatives, `f` of class `Cⁿ` on `t` and `x ∈ s`, the derivatives within `s` and `t` agree at
  `x`); `Analysis/Calculus/TangentCone/Real.lean`: `uniqueDiffOn_Icc` (`a < b`);
  `Analysis/Calculus/IteratedDeriv/Lemmas.lean`: `iteratedDerivWithin_comp_const_add`,
  `iteratedDerivWithin_sub` (at a point of a set with unique derivatives);
  `Analysis/Calculus/ContDiff/Basic.lean`: `ContinuousLinearMap.iteratedFDerivWithin_comp_right`
  (the derivatives within `g ⁻¹' s` of `f ∘ g` for a continuous linear `g`);
  `Analysis/Calculus/ContDiff/Defs.lean`: `ContDiffOn.mono`.
- `MeasureTheory/Integral/Prod.lean`: `MeasureTheory.integral_integral_swap` (Fubini).
  `MeasureTheory/Integral/IntervalIntegral/Basic.lean`: `intervalIntegral.integral_mono_on` (for
  `a ≤ b`), `intervalIntegral.integral_comp_mul_left` (for `c ≠ 0`),
  `intervalIntegral.integral_comp_sub_left`. `.../IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_eq_sub_of_hasDeriv_right_of_le` (for `a ≤ b`, `f` continuous on
  `[a, b]` with right derivative `f'` on `(a, b)` and `f'` interval integrable).
  `Analysis/SpecialFunctions/Integrals/Basic.lean`: `integral_pow`.
- `Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`;
  `Topology/Order/IntermediateValue.lean`: `intermediate_value_Icc`, `intermediate_value_Icc'`
  (for `a ≤ b` and `f` continuous on `[a, b]`).
- `LinearAlgebra/Lagrange.lean`: `Lagrange.basis`, `Lagrange.interpolate`,
  `Lagrange.eq_interpolate` (for `Set.InjOn v s`, a polynomial of degree `< #s` is the interpolant
  of its own values).
- `Topology/ContinuousMap/Weierstrass.lean`: `exists_polynomial_near_of_continuousOn`;
  `Analysis/Normed/Operator/BanachSteinhaus.lean`: `banach_steinhaus` (on a Banach space);
  `Order/Interval/Set/ProjIcc.lean`: `Set.IccExtend` (for `a ≤ b`).
- `NumberTheory/Bernoulli.lean`: `bernoulli`; `NumberTheory/ZetaValues.lean`: `bernoulliFun`,
  `hasSum_one_div_nat_pow_mul_cos` (for `k ≠ 0` and `x ∈ [0, 1]`, `∑_n cos(2πnx)/n^{2k}` has sum
  `(−1)^{k+1}(2π)^{2k}/2/(2k)! · B_{2k}(x)`).
- `Analysis/Complex/CauchyIntegral.lean`:
  `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`; `Analysis/Fourier/AddCircle.lean`:
  `fourierCoeff`, `hasSum_fourier_series_of_summable` (summable coefficients);
  `RingTheory/RootsOfUnity/PrimitiveRoots.lean`: `IsPrimitiveRoot.geom_sum_eq_zero` (for `1 < k`);
  `RingTheory/RootsOfUnity/Complex.lean`: `Complex.isPrimitiveRoot_exp` (for `n ≠ 0`).

All paths are under `Mathlib/`.

### From Tau Ceti

Nothing is used. The pinned library has no quadrature rules, Peano kernels or Euler–Maclaurin
formula.

### From TauCetiRoadmap.AsymptoticExpansions

- 13.1 `sum_Icc_eq_eulerMaclaurin`: for integers `a < n`, `m ≥ 1` and `f : ℝ → ℝ` of class
  `C^{2m}` on `[a, n]`, with derivatives within `[a, n]`, the sum `∑_{j=a}^n f(j)` equals
  `∫_a^n f + f(a)/2 + f(n)/2` plus `∑_{s=1}^{m−1} B_{2s}/(2s)! (f⁽²ˢ⁻¹⁾(n) − f⁽²ˢ⁻¹⁾(a))` plus
  `∫_a^n (B_{2m} − B̃_{2m}(x))/(2m)! · f⁽²ᵐ⁾(x) dx`, where `B̃_{2m}(x)` is
  `bernoulliFun (2m) (Int.fract x)`. Used in 5.1.

## References

- M. Abramowitz and I. A. Stegun (eds.), *Handbook of Mathematical Functions*, National Bureau of
  Standards Applied Mathematics Series 55, §25.4, pp. 885–887.
- Mark Embree, lecture notes for Math 5466 at Virginia Tech, lecture 21, *Interpolatory Quadrature
  Rules*, from the author's page.
- G. Pólya, *Über die Konvergenz von Quadraturverfahren*, Mathematische Zeitschrift 37 (1933),
  264–286.
- Lloyd N. Trefethen and J. A. C. Weideman, *The exponentially convergent trapezoidal rule*, SIAM
  Review 56 (2014), 385–458, Section 3.
- NIST Digital Library of Mathematical Functions, §24.9, formula 24.9.1.

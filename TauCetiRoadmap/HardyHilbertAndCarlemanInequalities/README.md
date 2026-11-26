# Roadmap: Hardy, Hilbert and Carleman inequalities

**Summary.** This roadmap builds the classical inequalities for averaging and bilinear operators
on the half-line and on sequences, with their best constants, together with two inequalities for
functions and their derivatives that are proved by the same comparison arguments.

- Kernels homogeneous of degree `-1` on `(0, ∞)`: for such a kernel `K` and `p > 1` the operator
  `f ↦ ∫₀^∞ K(x, y) f(x) dx` is bounded on `L^p(0, ∞)` with norm at most
  `k = ∫₀^∞ K(x, 1) x^(-1/p) dx`, the bilinear form is strictly smaller than `k ‖f‖_p ‖g‖_p'`
  when `K` is positive, and the series form holds when the weighted sections of `K` decrease.
- Hardy's inequality: for `p > 1` the averages `(a₁ + ⋯ + aₙ)/n` and `(1/x) ∫₀ˣ f` satisfy
  `‖A‖_p ≤ p/(p − 1) ‖a‖_p`, strictly unless `a = 0`, with best constant; the finite-section form;
  the weighted form with power weights, the tail (dual) form and Copson's inequality for series;
  the Riemann–Liouville integrals; the reversed inequality for `0 < p < 1`; and the form
  `∫ |F/x|^p ≤ (p/(p − 1))^p ∫ |F'|^p` for a function vanishing at `0`.
- Hilbert's inequality: `∑∑ aₘ bₙ/(m + n + 1) < π / sin(π/p) ‖a‖_p ‖b‖_p'` and its integral
  analogue, strict unless a factor vanishes and with best constant, and the inequality with two
  independent exponents.
- Carleman's inequality `∑ (a₁ ⋯ aₙ)^(1/n) < e ∑ aₙ` with Pólya's sharper bound and best
  constant, and Knopp's integral form `∫₀^∞ exp((1/x) ∫₀ˣ log f) dx < e ∫₀^∞ f`.
- Weighted Hardy operators `v(x) ∫_{t ≤ x} u(t) f(t) dt`: the Muckenhoupt criterion
  `A ≤ ‖T‖_{L^p → L^q} ≤ 4A` for `1 ≤ p ≤ q ≤ ∞`, the sharp bound `p^(1/p) p'^(1/p') A` for
  `p = q`, and `‖T‖ = A` from `L¹`.
- Opial's inequality `∫₀^h |f f'| ≤ (h/4) ∫₀^h f'²` for `f(0) = f(h) = 0`, with its equality
  case, and the Bihari–LaSalle inequality for `u ≤ k + ∫ f w(u)` with Osgood's uniqueness
  criterion.

The roadmap is a synthesis of several sources: Hardy, Littlewood and Pólya (*Inequalities*,
Chapter IX), Garling (*Inequalities: A Journey into Linear Analysis*), Balinsky, Evans and Lewis
(*The Analysis and Geometry of Hardy's Inequality*), Edmunds and Evans (*Hardy Operators,
Function Spaces and Embeddings*), Mitrinović (*Analytic Inequalities*) and Pachpatte
(*Inequalities for Differential and Integral Equations*). The layers follow proof dependency, not
the order of any one of them: one theorem on homogeneous kernels yields Hardy's and Hilbert's
inequalities for integrals, and the series forms, Carleman's inequality and the weighted theory
are built on top.

The nearest roadmaps and library areas are these. Tau Ceti's Schur test for integral kernels is
the analytic engine of Layers 1–3; the weighted Hardy inequalities with power weights, in their
non-strict and strict forms with best constants, are targets of §2.2.
[UnboundedOperators](../OperatorTheory/UnboundedOperators/README.md) §4.8 uses the case
`p = 2` of the half-line Hardy inequality for Sturm–Liouville operators and owns that case with its
sharpness on smooth compactly supported functions.
[SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) §2.9 and
[AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §1.5a own the other inequality
called Hilbert's, for the kernel `1/(λ_r − λ_s)` with separated frequencies; nothing passes between
them and Layer 3. The roadmap on means, majorization and discrete inequalities stops at inequalities
between finitely many numbers and leaves the material here to this roadmap.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/Inequalities/` for Layers 1–5 and `TauCeti/Analysis/ODE/` for
§6.2.

## How to read the build

Layer 1 proves the theorem on kernels homogeneous of degree `-1` for integrals and for series.
Layer 2 applies it to the Hardy kernel and adds what the kernel theorem does not give: strictness,
best constants, the finite-section form, Copson's tail inequality, the reversed inequality and
the form with derivatives. Layer 3 applies Layer 1 to the Hilbert kernel `1/(x + y)` and uses
Layer 2 for the inequality with two exponents. Layer 4 proves Carleman's and Knopp's inequalities
from the arithmetic–geometric mean inequality; it uses no other layer. Layer 5 is the weighted
theory and uses only Hölder's inequality and Minkowski's integral inequality. Layer 6 is
independent of the others. Each subsection has bold headlines with a Lean name, a locator with its
printed page or a proof route, and a *Needs:* line; each layer ends with **Checks.**, *Examples*
where useful, and *Dependencies*.

## Conventions

- **Values in `ℝ≥0∞`.** Functions and sequences in the inequalities are nonnegative and valued in
  `ℝ≥0∞`; sums are `tsum` and integrals are lower Lebesgue integrals `∫⁻`. An inequality between
  such quantities needs no summability or integrability hypothesis, and `0 * ⊤ = 0` makes it true
  when a norm on the right vanishes. A strict inequality carries the hypotheses that the norms on
  its right-hand side are finite and nonzero. Norms are written either as
  `(∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹` or as Mathlib's `eLpNorm`.
- **Exponents.** A real exponent `p > 1` comes with its conjugate `q = p/(p − 1)` through
  Mathlib's `p.HolderConjugate q`; in Layer 5 the exponents are extended reals with
  `ENNReal.HolderConjugate`. The README writes `p'` for the conjugate exponent.
- **Indices.** Sequences are indexed by `ℕ` from `0`. The `n`-th Hardy average is
  `(∑ k ∈ range (n + 1), a k) / (n + 1)`, the `n`-th geometric mean is
  `(∏ k ∈ range (n + 1), a k) ^ (1/(n + 1))`, and Hilbert's kernel at `(m, n)` is
  `1/(m + n + 1)`. The sources index from `1`; the translation is `n ↦ n + 1`, and for Hilbert's
  kernel `1/(m + n)` with `m, n ≥ 1` becomes `1/(m + n + 2)`, which `1/(m + n + 1)` dominates.
- **The half-line.** Integrals over `(0, ∞)` are `∫⁻ x in Ioi 0`, prefix integrals are over
  `Ioc 0 x` and tails over `Ici x` or `Ioi x` (they differ by a null set). Power weights
  `x ^ s` are `ENNReal.ofReal (x ^ s)` with real `rpow`, which is the usual power for `x > 0`.
- **Homogeneous kernels.** A kernel is `K : ℝ → ℝ → ℝ≥0∞`, homogeneous of degree `-1` on
  `(0, ∞)²`: `K (c x) (c y) = c⁻¹ K x y` for `c, x, y > 0`. This one-line condition is written
  as a hypothesis and not wrapped in a predicate.
- **Junk values.** `Real.log 0 = 0` in Mathlib, so Knopp's inequality is stated for positive `f`
  with `log f` integrable on each `(0, x]`; without the integrability the Bochner integral of
  `log f` would be the junk value `0` where the true geometric mean is `0`. Derivatives are
  Mathlib's `deriv`, with value `0` where a function is not differentiable, a null set for the
  absolutely continuous functions of §2.3 and Layer 6.
- **Namespace.** Implementations live in the TauCeti namespace; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.HardyHilbertAndCarlemanInequalities`.

## Layer 1: Kernels homogeneous of degree −1

### 1.1 The constant of a homogeneous kernel

**Definition** (`kernelConstant`): for `K` homogeneous of degree `-1` and `p > 1`,
`kernelConstant K p = ∫⁻ x in Ioi 0, K x 1 * ENNReal.ofReal (x ^ (-p⁻¹))`, the constant `k` of
Hardy–Littlewood–Pólya, Theorem 318 (ii), p. 227, and Theorem 319, p. 229. It may be `⊤`.

- **Second form of the constant** (`kernelConstant_eq_lintegral_one_left`): for `K` measurable
  and homogeneous of degree `-1`, `kernelConstant K p = ∫₀^∞ K(1, y) y^(-1/p') dy`
  (Hardy–Littlewood–Pólya, remark (1) to Theorem 318, p. 228).

*Proof route.* Substitute `x = 1/y`: `K(1/y, 1) = y K(1, y)` by homogeneity with `c = y`, and
`dx = dy/y²`, so `K(x, 1) x^(-1/p) dx = K(1, y) y^(1/p − 1) dy = K(1, y) y^(-1/p') dy`. The
substitution is Mathlib's change of variables for `x ↦ x⁻¹` on `Ioi 0`.

*Needs:* Mathlib's change of variables on `Ioi 0`.

### 1.2 The integral theorem

Let `K` be measurable and homogeneous of degree `-1`, `p > 1` with conjugate `q`, and `f`, `g`
almost everywhere measurable on `(0, ∞)`.

- **Bilinear form** (`lintegral_lintegral_kernel_le`):
  `∫₀^∞ ∫₀^∞ K(x, y) f(x) g(y) dx dy ≤ k ‖f‖_p ‖g‖_q` with `k = kernelConstant K p`
  (Hardy–Littlewood–Pólya, Theorem 319 (a), p. 229).
- **Operator form** (`lintegral_rpow_lintegral_kernel_le`):
  `∫₀^∞ (∫₀^∞ K(x, y) f(x) dx)^p dy ≤ k^p ∫₀^∞ f^p` (Hardy–Littlewood–Pólya, Theorem 319 (b),
  p. 229).
- **Strictness** (`lintegral_lintegral_kernel_lt`): if `K > 0` on `(0, ∞)²` and `k < ∞`, the
  bilinear inequality is strict whenever `‖f‖_p` and `‖g‖_q` are finite and nonzero
  (Hardy–Littlewood–Pólya, Theorem 319, last sentence, p. 229, proof p. 230).
- Target in prose: the transposed operator form
  `∫₀^∞ (∫₀^∞ K(x, y) g(y) dy)^q dx ≤ k^q ∫₀^∞ g^q` (Theorem 319 (c), p. 229); it is the
  operator form for the kernel `(x, y) ↦ K(y, x)`, whose constant for `q` is `k` by §1.1.

*Proof route.* Schur's method (Hardy–Littlewood–Pólya, p. 230): write
`K f g = (f K^(1/p) (x/y)^(1/(p q))) · (g K^(1/q) (y/x)^(1/(p q)))`, apply Hölder in `(x, y)`
(`ENNReal.lintegral_mul_le_Lp_mul_Lq` on the product measure, after `lintegral_lintegral_swap`),
and evaluate each factor by homogeneity: `∫₀^∞ K(x, y) (x/y)^(1/q) dy = k` for each `x > 0`, by
the scaling `y = x t` (`Real.map_volume_mul_left`) and §1.1. The operator form follows from the
bilinear form by duality in `L^p`, or directly from Tau Ceti's Schur test
`TauCeti.lintegral_rpow_lintegral_mul_le`: the substitution `f(x) = x^(-1/p) φ(x)` turns it into
the bound for the kernel `L(x, y) = K(x, y) x^(1/q) y^(1/p)` on `L^p(dx/x)`, and with the measure
`dx/x` in both variables `∫ L(x, y) dx/x = ∫₀^∞ K(t, 1) t^(-1/p) dt = k` and
`∫ L(x, y) dy/y = ∫₀^∞ K(1, t) t^(-1/q) dt = k` by §1.1, so the test gives `k^(p − 1) k = k^p`.
Strictness: equality in Hölder forces `f(x)^p` to be proportional to `x^(-1)` on a set of positive
measure, which contradicts `‖f‖_p < ∞` (Hardy–Littlewood–Pólya, p. 230, equation (9.3.1)).

*Needs:* §1.1; Mathlib's Hölder inequality and Tonelli; Tau Ceti's Schur test.

### 1.3 The series theorem

- **Series form** (`tsum_tsum_kernel_le`): if `K` is homogeneous of degree `-1` and
  `x ↦ K(x, 1) x^(-1/p)` and `y ↦ K(1, y) y^(-1/q)` are antitone on `(0, ∞)`, then for all
  `a, b : ℕ → ℝ≥0∞`, `∑∑ K(m + 1, n + 1) aₘ bₙ ≤ k ‖a‖_p ‖b‖_q` (Hardy–Littlewood–Pólya,
  Theorem 318 (a), p. 227, under condition (iii)).
- Target in prose: the operator forms (b) and (c) of Theorem 318, p. 228, under the same
  hypotheses, with constants `k^p` and `k^q`.
- Target in prose: the strict form of Theorem 318 (a), p. 227, when the two weighted sections are
  strictly decreasing and both sequences are nonzero with finite norms.

*Proof route.* Hardy–Littlewood–Pólya, pp. 228–229: since the weighted section decreases,
`∑_{r ≥ 1} K(r/n, 1) (r/n)^(-1/p) (1/n) ≤ ∫₀^∞ K(x, 1) x^(-1/p) dx = k` (each term is at most the
integral over `[(r − 1)/n, r/n]`), which by homogeneity is `∑_m K(m, n) (m/n)^(-1/p) ≤ k`; the
same in the other variable; then the weighted Hölder argument of §1.2 with sums in place of
integrals (`ENNReal.inner_le_Lp_mul_Lq` on finite sections and a supremum over them).

*Needs:* §1.1; `ENNReal.inner_le_Lp_mul_Lq`.

### 1.4 Several variables and exponents below one

- Target in prose: the multilinear form. For `p₁, …, p_n > 1` with `∑ 1/pᵢ = 1` and `K` positive
  and homogeneous of degree `-(n − 1)` on `(0, ∞)^n`, with
  `k = ∫ K(1, y₂, …, y_n) y₂^(-1/p₂) ⋯ y_n^(-1/p_n) dy₂ ⋯ dy_n`,
  `∫ K f₁ ⋯ f_n ≤ k ∏ ‖fᵢ‖_{pᵢ}` (Hardy–Littlewood–Pólya, Theorem 322, pp. 231–232; proof by the
  method of §1.2).
- Target in prose: the reversed theorem. For `0 < p < 1` and `K ≥ 0` homogeneous of degree `-1`
  with `k < ∞`, `∫₀^∞ (∫₀^∞ K(x, y) f(x) dx)^p dy ≥ k^p ∫₀^∞ f^p` (Hardy–Littlewood–Pólya,
  Theorem 336 (b), p. 250; proof by the method of §1.2 with the reversed Hölder inequality).

**Checks.**

- Sanity check `kernelConstant_hardy`: for the Hardy kernel `K(x, y) = y⁻¹ 1_{x ≤ y}`,
  `K(x, 1) = 1_{x ≤ 1}` and `kernelConstant K p = ∫₀¹ x^(-1/p) dx = p/(p − 1)`; at `p = 3` it is
  `1.5`.
- Negative control for the exponent in the definition: with `x^(-1/q)` in place of `x^(-1/p)` the
  Hardy kernel would give `p` instead of `p/(p − 1)`, at `p = 3` the value `3`, which is not the
  constant of Hardy's inequality (Layer 2).
- Sanity check `kernelConstant_max`: for `K = 1/max(x, y)`,
  `kernelConstant K p = ∫₀¹ x^(-1/p) dx + ∫₁^∞ x^(-1/p − 1) dx = p' + p`, which equals `p p'`
  (Hardy–Littlewood–Pólya, Theorem 341, p. 254); at `p = 3` both are `4.5`.
- The kernel `log(x/y)/(x − y)` has `k = π² / sin²(π/p)` (Hardy–Littlewood–Pólya, Theorem 342,
  p. 255): at `p = 3` the integral `∫₀^∞ log x/(x − 1) x^(-1/3) dx` is `13.15947…`, which is
  `(π / sin(π/3))² = 4π²/3`.
- For the Hilbert kernel both forms of §1.1 give `π / sin(π/p)`: at `p = 3`, `∫₀^∞ x^(-1/3)/(1 + x)`
  and `∫₀^∞ y^(-2/3)/(1 + y)` both equal `2π/√3 ≈ 3.62760`.

### Dependencies

Mathlib's Hölder inequality for `∫⁻` and for finite sums, Tonelli, the scaling of Lebesgue
measure; Tau Ceti's Schur test.

## Layer 2: Hardy's inequality

### 2.1 Series

- **Finite sections** (`sum_range_hardy_le`): for `p > 1`, real `aₙ ≥ 0` and every `N`,
  `∑_{n < N} ((a₀ + ⋯ + aₙ)/(n + 1))^p ≤ (p/(p − 1))^p ∑_{n < N} aₙ^p` (Hardy–Littlewood–Pólya,
  equation (9.8.4), p. 241, in Elliott's proof of Theorem 326).
- **Strict inequality** (`tsum_hardy_lt`): for `a : ℕ → ℝ≥0∞` nonzero with `∑ aₙ^p < ∞`,
  `∑ ((a₀ + ⋯ + aₙ)/(n + 1))^p < (p/(p − 1))^p ∑ aₙ^p` (Hardy–Littlewood–Pólya, Theorem 326,
  p. 239; Garling, Corollary 8.1.1 (iii), p. 104, without strictness).
- Target in prose: the inequality `≤` for every `a : ℕ → ℝ≥0∞`, the supremum over `N` of the
  finite sections.
- **Best constant** (`tsum_hardy_sharp`): for every `c < (p/(p − 1))^p` there is `a` with
  `∑ aₙ^p < ∞` and `c ∑ aₙ^p < ∑ ((a₀ + ⋯ + aₙ)/(n + 1))^p` (Hardy–Littlewood–Pólya, Theorem 326,
  p. 239, proof p. 241).
- **Weighted series** (`tsum_hardy_weighted_le`): for positive finite weights `wₙ`,
  `∑ wₙ (W_n⁻¹ ∑_{k ≤ n} w_k a_k)^p ≤ (p/(p − 1))^p ∑ wₙ aₙ^p` with `W_n = ∑_{k ≤ n} w_k`
  (Hardy–Littlewood–Pólya, Theorem 332, p. 247, which also states strictness for nonzero `a`;
  that strict form is a target in prose).
- **Copson's tail inequality** (`tsum_copson_lt`): for `a` nonzero with
  `∑ ((n + 1) aₙ)^p < ∞`, `∑ₙ (∑_{k ≥ n} a_k)^p < p^p ∑ ((n + 1) aₙ)^p` (Hardy–Littlewood–Pólya,
  Theorem 331, p. 246). Target in prose: the constant `p^p` is best possible (same place).
- Target in prose: for a fixed multiset of values, `∑ φ(A_n/n)` with `φ` increasing is largest
  for the decreasing arrangement (Hardy–Littlewood–Pólya, Theorem 333, p. 248).
- Target in prose: for `0 < p < 1` and `∑ aₙ^p < ∞` with `a ≠ 0`,
  `∑'ₙ ((aₙ + aₙ₊₁ + ⋯)/(n + 1))^p > (p/(1 − p))^p ∑ aₙ^p`, where `∑'` multiplies the term
  `n = 0` by `1 + 1/(1 − p)`; the constant is best possible (Hardy–Littlewood–Pólya, Theorem 338,
  p. 252, with indices from `1` and the divisor `n` there). Without that factor the inequality
  fails for `p > 1/2` (same place, footnote on p. 253).

*Proof route.* Finite sections, Elliott's proof (Hardy–Littlewood–Pólya, pp. 240–241): with
`αₙ = Aₙ/(n + 1)`, `αₙ^p − (p/(p − 1)) αₙ^(p−1) aₙ ≤ (1/(p − 1)) (n αₙ₋₁^p − (n + 1) αₙ^p)` by
weighted AM–GM (`Real.geom_mean_le_arith_mean_weighted`) applied to `αₙ` and `αₙ₋₁`; summing
telescopes, and Hölder (`Real.inner_le_Lp_mul_Lq`) gives the bound. Strictness: equality in
Hölder forces `aₙ = αₙ` for all `n`, so `a` is constant, contradicting `∑ aₙ^p < ∞`. Best
constant: `aₙ = (n + 1)^(-1/p)` for `n < N` and `0` beyond, as `N → ∞` (p. 241). Weighted series:
Elliott's argument with `αₙ = Aₙ/Wₙ` (p. 247). Copson: duality with the finite-section form of
Hardy's inequality, as in Hardy–Littlewood–Pólya, pp. 246–247. Reversed series inequality:
Theorem 337 applied to the step function equal to `aₙ` on `[n + 1, n + 2)` and `0` on `(0, 1)`
(Hardy–Littlewood–Pólya, p. 252); on `[n + 1, n + 2)` the average `(1/x) ∫ₓ^∞ f` is at most
`(aₙ + aₙ₊₁ + ⋯)/(n + 1)`, and `(0, 1)` contributes `(1/(1 − p)) (a₀ + a₁ + ⋯)^p`.

*Needs:* `Real.geom_mean_le_arith_mean_weighted`, `Real.inner_le_Lp_mul_Lq`,
`NNReal.inner_le_Lp_mul_Lq_tsum`.

### 2.2 Integrals

- **Weighted inequality** (`hardy_rpow_weight_le`): for `p > 1`, `ε < 1 − 1/p` and every
  almost everywhere measurable `f ≥ 0`,
  `∫₀^∞ (∫₀ˣ f)^p x^(p(ε − 1)) dx ≤ (1 − 1/p − ε)^(-p) ∫₀^∞ f^p x^(εp) dx`
  (Balinsky–Evans–Lewis, Theorem 1.2.1, (1.2.1), p. 3; Hardy–Littlewood–Pólya, Theorem 330,
  pp. 245–246).
- **Weighted tail inequality** (`hardy_tail_rpow_weight_le`): for `p > 1`, `ε > 1 − 1/p` and
  every almost everywhere measurable `f ≥ 0`,
  `∫₀^∞ (∫ₓ^∞ f)^p x^(p(ε − 1)) dx ≤ (ε − 1 + 1/p)^(-p) ∫₀^∞ f^p x^(εp) dx`
  (Balinsky–Evans–Lewis, Theorem 1.2.1, (1.2.2), p. 3).
- **Strict weighted inequality** (`hardy_rpow_weight_lt`): for `p > 1`, `ε < 1 − 1/p` and
  `0 < ∫₀^∞ f^p x^(εp) < ∞`, `∫₀^∞ (∫₀ˣ f)^p x^(p(ε − 1)) dx < (1 − 1/p − ε)^(-p) ∫₀^∞ f^p x^(εp)`
  (Balinsky–Evans–Lewis, Theorem 1.2.1, p. 3; Hardy–Littlewood–Pólya, Theorem 330, pp. 245–246).
  The case `ε = 0` is Hardy's integral inequality `∫₀^∞ (F/x)^p < (p/(p − 1))^p ∫₀^∞ f^p`
  (Hardy–Littlewood–Pólya, Theorem 327, p. 240).
- **Best constant** (`hardy_rpow_weight_sharp`): for every `c < (1 − 1/p − ε)^(-p)` there is a
  measurable `f` with `∫₀^∞ f^p x^(εp) < ∞` and `c ∫₀^∞ f^p x^(εp) < ∫₀^∞ (∫₀ˣ f)^p x^(p(ε − 1))`
  (Balinsky–Evans–Lewis, Theorem 1.2.1, p. 3, proof p. 4).
- **Strict tail inequality** (`hardy_tail_rpow_weight_lt`): for `ε > 1 − 1/p` and
  `0 < ∫₀^∞ f^p x^(εp) < ∞`,
  `∫₀^∞ (∫ₓ^∞ f)^p x^(p(ε − 1)) dx < (ε − 1 + 1/p)^(-p) ∫₀^∞ f^p x^(εp)` (Balinsky–Evans–Lewis,
  Theorem 1.2.1, (1.2.2), p. 3). The case `ε = 1` is `∫₀^∞ (∫ₓ^∞ f)^p < p^p ∫₀^∞ (x f)^p`
  (Hardy–Littlewood–Pólya, Theorem 328, p. 244). Target in prose: its constant is best possible
  (Balinsky–Evans–Lewis, p. 4).
- **Riemann–Liouville integrals** (`hardy_riemannLiouville_lt`): for `p > 1`, `r > 0`,
  `f_r(x) = Γ(r)⁻¹ ∫₀ˣ (x − t)^(r − 1) f(t) dt` and `0 < ∫₀^∞ f^p < ∞`,
  `∫₀^∞ (x^(-r) f_r(x))^p dx < (Γ(1 − 1/p)/Γ(r + 1 − 1/p))^p ∫₀^∞ f^p`
  (Hardy–Littlewood–Pólya, Theorem 329, p. 245). Target in prose: the constant is best possible
  (same place).
- **Reversed inequality** (`hardy_reverse_lt`): for `0 < p < 1` and `0 < ∫₀^∞ f^p < ∞`,
  `(p/(1 − p))^p ∫₀^∞ f^p < ∫₀^∞ ((∫ₓ^∞ f)/x)^p dx` (Hardy–Littlewood–Pólya, Theorem 337, p. 251).
  Target in prose: the constant is best possible (same place).

*Proof route.* Weighted inequality and its tail form: when the right-hand side is `0` then `f = 0`
almost everywhere and both sides vanish, when it is `⊤` there is nothing to prove, and otherwise
they are the strict forms below. Strict weighted inequality: the substitution `h = x^ε f` turns
it into the operator form of §1.2 for the kernel `K(x, y) = y^(ε − 1) x^(-ε) 1_{x ≤ y}`,
homogeneous of degree `-1`, whose constant is `∫₀¹ x^(-ε − 1/p) dx = (1 − 1/p − ε)⁻¹`;
strictness by the equality analysis of Hardy–Littlewood–Pólya, p. 244 (equality forces `f` to be
a power of `x` near `0`) or the integration by parts of Balinsky–Evans–Lewis, pp. 3–4. Best
constant: `f = x^(-1/p + α)` on `(0, a)` and `0` beyond, with `α ↓ −ε`; the ratio is
`(α + 1/p')^(-p) (1 + (α + ε)/(1/p' − ε))` (Balinsky–Evans–Lewis, p. 4). Tail form: the same with
the transposed kernel (Theorem 1.2.1, (1.2.2)). Riemann–Liouville: §1.2 for
`K(x, y) = Γ(r)⁻¹ (y − x)^(r − 1) y^(-r) 1_{x < y}`, whose constant is
`Γ(r)⁻¹ B(1 − 1/p, r) = Γ(1 − 1/p)/Γ(r + 1 − 1/p)` (Mathlib's `ProbabilityTheory.beta` and the
Gamma quotient), and strictness as above. Reversed inequality: integration by parts as in
Hardy–Littlewood–Pólya, pp. 251–252, with the reversed Hölder inequality.

*Needs:* §1.2; `ProbabilityTheory.beta`, `Real.Gamma`.

### 2.3 Functions and their derivatives

- **Hardy's inequality for derivatives** (`hardy_deriv_le`): for `p > 1` and `F` absolutely
  continuous on every `[a, b] ⊂ (0, ∞)` with `F(x) → 0` as `x → 0⁺`,
  `∫₀^∞ (|F(x)|/x)^p dx ≤ (p/(p − 1))^p ∫₀^∞ |F'(x)|^p dx` (Balinsky–Evans–Lewis,
  Corollary 1.2.2, (1.2.4), p. 5).
- Target in prose: the companion `∫₀^∞ |G|^p ≤ p^p ∫₀^∞ |x G'|^p` for `G` locally absolutely
  continuous with `G(x) → 0` as `x → ∞` (Balinsky–Evans–Lewis, Corollary 1.2.2, (1.2.5), p. 5),
  and, for both, that the constants are best possible and equality holds only for `0` (same
  place).

*Proof route.* For `0 < a < x`, `F(x) − F(a) = ∫_a^x F'`
(`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`);
let `a → 0⁺` to get `|F(x)| ≤ ∫₀ˣ |F'|`, then apply the case `ε = 0` of the weighted inequality of
§2.2 (`hardy_rpow_weight_le`) to `|F'|`. The companion is the tail form with `ε = 1`
(`hardy_tail_rpow_weight_le`).

*Needs:* §2.2; `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`.

**Checks.**

- `sum_range_hardy_le` at `a = (1, 0, 0, …)`, `p = 2`: the left side tends to
  `∑ 1/(n + 1)² = π²/6 ≈ 1.6449 < 4`.
- Negative control for the index convention: with the denominator `n` in place of `n + 1`, the
  term at `n = 0` for `a = (1, 0, 0, …)` is `1/0 = ⊤` in `ℝ≥0∞`, and the inequality fails.
- `tsum_hardy_sharp` at `p = 2`: for `aₙ = (n + 1)^(-1/2)` for `n < N` and `0` beyond, the ratio
  of the left side of `tsum_hardy_sharp` (all `n`, including the averages beyond `N`) to
  `∑ aₙ²` is `3.1931` at `N = 10³` and `3.4868` at `N = 10⁵`, increasing to `4` slowly; the ratio
  of the two sides of `sum_range_hardy_le` at the same `N` is `2.6831` and `3.1575`.
- `tsum_copson_lt` at `a = (1, 0, 0, …)`: the left side is `1` and the right side is `p^p`.
- `hardy_rpow_weight_sharp` at `p = 2`, `ε = −1/2`: the sharp constant is `1`, and the extremal
  family `x^(α − 1/2) 1_{(0,1)}` gives the ratios `0.6667`, `0.9091`, `0.9901` at
  `α = 1, 0.6, 0.51`.
- `hardy_riemannLiouville_lt` at `r = 1` has the constant
  `(Γ(1 − 1/p)/Γ(2 − 1/p))^p = (p/(p − 1))^p`;
  at `p = 2`, `r = 2` the inner constant is `Γ(1/2)/Γ(5/2) = 4/3`.
- `hardy_reverse_lt` at `p = 1/2`, `f = e^(-x)`: the right side is
  `∫₀^∞ x^(-1/2) e^(-x/2) dx = √(2π) ≈ 2.5066`
  and the left side is `1 · ∫₀^∞ e^(-x/2) dx = 2`.
- The reversed series inequality (Theorem 338) at `a = (1, 0, 0, …)`: the left side is
  `1 + 1/(1 − p)` and the right side `(p/(1 − p))^p`; at `p = 3/4` they are `5` and
  `3^(3/4) ≈ 2.2795`.
- Negative control for the factor `1 + 1/(1 − p)`: without it the left side at `a = (1, 0, 0, …)`
  is `1`, below `3^(3/4) ≈ 2.2795` at `p = 3/4`.
- Negative control for the divisor `n + 1`: without it every tail dominates its first term, so the
  left side is at least `∑ aₙ^p` and the constant `1` would hold, while `(p/(1 − p))^p` is
  `(1/3)^(1/4) ≈ 0.7598 < 1` at `p = 1/4`; that constant could not be best possible.
- `hardy_deriv_le` at `p = 2` has the constant `(p/(p − 1))^p = 4`, the reciprocal of the `¼` in
  `∫|u′|² ≥ ¼ ∫|u/r|²` of UnboundedOperators §4.8; for `F(x) = x e^(-x)` the left side is
  `∫₀^∞ e^(-2x) dx = 1/2` and the right side `4 ∫₀^∞ (1 − x)² e^(-2x) dx = 1`.

### Dependencies

Layer 1; Mathlib's AM–GM, Hölder for sums and integrals, Beta and Gamma functions, absolute
continuity on intervals.

## Layer 3: Hilbert's inequality

### 3.1 Integrals

- **The Hilbert constant** (`kernelConstant_hilbert`): for `p > 1`,
  `kernelConstant (1/(x + y)) p = ∫₀^∞ x^(-1/p)/(1 + x) dx = π / sin(π/p)` (Garling, §5.10, p. 65).
- **Hilbert's inequality for integrals** (`hilbert_lintegral_le`):
  `∫₀^∞ ∫₀^∞ f(x) g(y)/(x + y) dx dy ≤ π / sin(π/p) ‖f‖_p ‖g‖_q` (Hardy–Littlewood–Pólya,
  Theorem 316, p. 226; Garling, Theorem 5.10.1, p. 65).
- **Strictness** (`hilbert_lintegral_lt`): strict when `‖f‖_p` and `‖g‖_q` are finite and nonzero
  (Hardy–Littlewood–Pólya, Theorem 316, p. 226).
- **Best constant** (`hilbert_lintegral_sharp`): for every `c < π / sin(π/p)` there are
  measurable `f`, `g` with finite norms and `c ‖f‖_p ‖g‖_q < ∫∫ f(x) g(y)/(x + y)`
  (Hardy–Littlewood–Pólya, Theorem 317, p. 226; Garling, Theorem 5.10.1, proof pp. 65–66).

*Proof route.* The constant: `∫₀^∞ x^(-1/p) (1 + x)^(-1) dx = B(1 − 1/p, 1/p)` is Tau Ceti's second
beta integral `TauCeti.integral_rpow_mul_one_add_rpow` with `a = 1 − 1/p`, `b = 1/p`, and
`B(1 − 1/p, 1/p) = Γ(1/p) Γ(1 − 1/p) = π / sin(π/p)` by `Real.Gamma_mul_Gamma_one_sub`. The
inequality and its strictness are §1.2 for the positive kernel `1/(x + y)`. Best constant: Garling's
family `f_λ = (λ − 1)^(1/p) x^(-λ/p) 1_{[1, ∞)}`, `g_λ` likewise with `q`, as `λ ↓ 1`
(Garling, pp. 65–66), or Hardy–Littlewood–Pólya's `x^(-(1 + ε)/p)` (pp. 232–233).

*Needs:* §1.2; `TauCeti.integral_rpow_mul_one_add_rpow`, `Real.Gamma_mul_Gamma_one_sub`.

### 3.2 Series

- **Hilbert's inequality for series** (`hilbert_tsum_le`):
  `∑∑ aₘ bₙ/(m + n + 1) ≤ π / sin(π/p) ‖a‖_p ‖b‖_q` for all `a, b : ℕ → ℝ≥0∞`
  (Hardy–Littlewood–Pólya, Theorem 323, p. 234; Garling, Theorem 5.10.2, p. 66). With indices from
  `1` this is the sharper form of Theorem 315, p. 226, whose kernel is `1/(m + n)`.
- **Strictness** (`hilbert_tsum_lt`): strict when both sequences are nonzero with finite norms
  (Hardy–Littlewood–Pólya, Theorems 315 and 323, pp. 226 and 234).
- **Best constant** (`hilbert_tsum_sharp`): for every `c < π / sin(π/p)` there are `a`, `b` with
  finite norms and `c ‖a‖_p ‖b‖_q < ∑∑ aₘ bₙ/(m + n + 1)` (Hardy–Littlewood–Pólya, Theorem 317,
  p. 226, proof §9.5, pp. 232–233; Garling, Theorem 5.10.2, p. 66).
- **Operator form** (`hilbert_tsum_rpow_le`):
  `∑ₙ (∑ₘ aₘ/(m + n + 1))^p ≤ (π / sin(π/p))^p ∑ aₘ^p` (Hardy–Littlewood–Pólya, Theorem 318 (b),
  p. 228, for the Hilbert kernel, with the shift of Theorem 323).
- Target in prose: for positive weights `λₘ`, `μₙ` with partial sums `Λₘ`, `Mₙ`,
  `∑∑ λₘ^(1/q) μₙ^(1/p) aₘ bₙ/(Λₘ + Mₙ) < π / sin(π/p) ‖a‖_p ‖b‖_q` for nonzero `a`, `b` of finite
  norm (Hardy–Littlewood–Pólya, Theorem 321, p. 231).

*Proof route.* Hardy–Littlewood–Pólya, p. 234: for the step functions `f = aₘ` on `[m, m + 1)`
and `g = bₙ` on `[n, n + 1)`, convexity of `t ↦ 1/t` gives
`∫_m^(m+1) ∫_n^(n+1) dx dy/(x + y) > 1/(m + n + 1)`, so the series is at most the integral of §3.1
with the same norms; strictness comes from this strict comparison. Best constant:
`aₘ = (m + 1)^(-(1 + ε)/p)`, `bₙ = (n + 1)^(-(1 + ε)/q)`, `ε ↓ 0`, comparing sums with integrals
(pp. 232–233). Operator form: the operator form of §1.2 for the step function of `a`, by the same
comparison, or duality from `hilbert_tsum_le`. Weighted form: the step functions on the intervals
`[Λₘ₋₁, Λₘ)` and `[Mₙ₋₁, Mₙ)` (p. 231).

*Needs:* §3.1.

### 3.3 Two exponents

- **Hilbert's inequality with two exponents** (`hilbert_two_exponents`): for `p, q > 1` with
  `1/p + 1/q ≥ 1` and `λ = 2 − 1/p − 1/q`, there is a finite `K` with
  `∑∑ aₘ bₙ/(m + n + 2)^λ ≤ K ‖a‖_p ‖b‖_q` for all `a, b` (Hardy–Littlewood–Pólya, Theorem 339,
  p. 253; indices from `1` there).
- Target in prose: the integral analogue
  `∫₀^∞ ∫₀^∞ f(x) g(y)/(x + y)^λ dx dy ≤ K ‖f‖_p ‖g‖_q` (Hardy–Littlewood–Pólya, Theorem 340,
  p. 254).

*Proof route.* Hardy–Littlewood–Pólya, pp. 253–254: split the double sum at the diagonal and
treat the part with `n ≤ m` (the other part is the same with `p` and `q` exchanged). There
`(m + n)^(-λ) ≤ m^(-λ)`, so the inner sum is at most `m^(-λ) Bₘ` with `Bₘ = b₁ + ⋯ + bₘ`; by
Hölder in `m` (Theorem 13) the bound (9.14.1) follows from a bound of `∑ (m^(-λ) Bₘ)^(p')` by a
multiple of `B^(p'/q)`, `B = ∑ bₙ^q` (equation (9.14.2)). Write
`(m^(-λ) Bₘ)^(p') = (Bₘ/m)^q Bₘ^(p' − q) m^(q − p'λ)` with `p' ≥ q`, and bound
`Bₘ ≤ m^(1/q') B^(1/q)` by Hölder; the powers of `m` cancel, since `(p' − q)/q' + q − p'λ = 0`,
and Hardy's inequality for the exponent `q` (the non-strict inequality of §2.1) bounds
`∑ (Bₘ/m)^q` by `(q/(q − 1))^q B` (Hardy–Littlewood–Pólya, p. 254).

*Needs:* §2.1.

**Checks.**

- `kernelConstant_hilbert` at `p = 2`: `∫₀^∞ x^(-1/2)/(1 + x) dx = π`; at `p = 4` it is
  `π / sin(π/4) = π√2 ≈ 4.44288`.
- `hilbert_tsum_le` at `a = b = (1, 0, 0, …)`, `p = 2`: the left side is `1`, the right side `π`.
- `hilbert_tsum_sharp` at `p = 2`: the truncations `aₙ = bₙ = (n + 1)^(-1/2)`, `n < N`, give the
  ratios `2.2212` at `N = 200` and `2.4470` at `N = 2000`, increasing to `π` slowly.
- Negative control for the index shift: the kernel `1/(m + n)` of the sources, read with indices
  from `0`, has the value `1/0 = ⊤` at `m = n = 0`, so `hilbert_tsum_le` with that kernel is false
  at `a = b = (1, 0, 0, …)`.

### Dependencies

Layers 1 and 2; Tau Ceti's second beta integral and Mathlib's reflection formula for `Γ`.

## Layer 4: Carleman's inequality

### 4.1 Series

- **Pólya's bound** (`carleman_le_tsum_one_add_inv_pow`): for every `a : ℕ → ℝ≥0∞`,
  `∑ₙ (a₀ ⋯ aₙ)^(1/(n + 1)) ≤ ∑ₙ (1 + 1/(n + 1))^(n + 1) aₙ` (Hardy–Littlewood–Pólya, proof of
  Theorem 334, p. 250; Garling, proof of Theorem 3.2.1, p. 22).
- **Carleman's inequality** (`carleman_lt`): for `a` nonzero with `∑ aₙ < ∞`,
  `∑ₙ (a₀ ⋯ aₙ)^(1/(n + 1)) < e ∑ aₙ` (Hardy–Littlewood–Pólya, Theorem 334, p. 249; Garling,
  Theorem 3.2.1, p. 22).
- **Best constant** (`carleman_sharp`): for every `c < e` there is `a` with `∑ aₙ < ∞` and
  `c ∑ aₙ < ∑ₙ (a₀ ⋯ aₙ)^(1/(n + 1))` (Hardy–Littlewood–Pólya, Theorem 334, p. 249, proof p. 250;
  Garling, Exercise 3.7, p. 23).

*Proof route.* Pólya's proof (Hardy–Littlewood–Pólya, pp. 249–250; Garling, p. 22): with
`c_k = (k + 2)^(k + 1)/(k + 1)^k`, `c₀ ⋯ cₙ = (n + 2)^(n + 1)`, so by AM–GM
(`Real.geom_mean_le_arith_mean_weighted`)
`(a₀ ⋯ aₙ)^(1/(n + 1)) ≤ (n + 2)⁻¹ (n + 1)⁻¹ ∑_{k ≤ n} c_k a_k`; exchange the sums (`tsum_comm`)
and use `∑_{n ≥ k} 1/((n + 1)(n + 2)) = 1/(k + 1)`, which gives the coefficient
`c_k/(k + 1) = (1 + 1/(k + 1))^(k + 1)`. Carleman's inequality follows since
`(1 + 1/(n + 1))^(n + 1) < e` (`Real.one_add_inv_pow_le_exp` with strictness from
`Real.add_one_lt_exp`). Best constant: `aₙ = 1/(n + 1)` for `n < N` and `0` beyond, as `N → ∞`
(Hardy–Littlewood–Pólya, p. 250). Hardy–Littlewood–Pólya, p. 249, also derives the non-strict
inequality from `tsum_hardy_lt` with `aₙ^(1/p)` in place of `aₙ` and `p → ∞`; that route is an
alternative, not a dependency.

*Needs:* `Real.geom_mean_le_arith_mean_weighted`, `Real.one_add_inv_pow_le_exp`,
`Real.add_one_lt_exp`, `tsum_comm`.

### 4.2 Knopp's integral inequality

- **Knopp's inequality** (`knopp_lt`): for `f > 0` on `(0, ∞)`, integrable there, with `log f`
  integrable on each `(0, x]`, `∫₀^∞ exp((1/x) ∫₀ˣ log f) dx < e ∫₀^∞ f`
  (Hardy–Littlewood–Pólya, Theorem 335, p. 250).
- **Best constant** (`knopp_sharp`): for every `c < e` there is such an `f` with
  `c ∫₀^∞ f < ∫₀^∞ exp((1/x) ∫₀ˣ log f) dx`.

*Proof route.* The integral analogue of Pólya's argument: by Jensen's inequality for the convex
exponential (`ConvexOn.map_integral_le`) applied to `log (t f(t))` on `(0, x]` with the uniform
probability measure,
`exp((1/x) ∫₀ˣ log f) = (e/x) exp((1/x) ∫₀ˣ log (t f(t)) dt) ≤ (e/x²) ∫₀ˣ t f(t) dt`, since
`(1/x) ∫₀ˣ log t dt = log x − 1`; integrate over `x` and exchange the integrals by Tonelli,
`∫_t^∞ x⁻² dx = 1/t`. Strictness: equality in Jensen for almost every `x` forces `t f(t)` to be
constant, so `f = c/t`, which is not integrable. Best constant: `f = 1` on `(0, 1]` and
`f = x^(-1 − ε)` on `(1, ∞)`; then `∫ f = 1 + 1/ε` and, for `x > 1`, the geometric mean is
`e^(1 + ε) x^(-1 − ε) e^(-(1 + ε)/x)`, so the ratio is
`(1 + e^(1 + ε) (1 + ε)^(-ε) γ(ε, 1 + ε))/(1 + 1/ε) → e` as `ε → 0`.

*Needs:* Mathlib's integral Jensen inequality (`ConvexOn.map_integral_le`) and Tonelli.

**Checks.**

- Pólya's bound at `a = (1, 0, 0, …)`: the left side is `1` (every product from `n = 1` on
  contains `a₁ = 0`), and the right side is `2 · 1 = 2 < e`.
- `carleman_sharp`: for `aₙ = 1/(n + 1)`, `n < N`, the ratio is `2.1655` at `N = 10³` and `2.3750`
  at `N = 10⁵`, increasing to `e ≈ 2.71828`.
- Negative control for the exponent: with `(a₀ ⋯ aₙ)^(1/n)` (the source's `1/n` read with indices
  from `0`) the term at `n = 0` is `a₀^(1/0)`, where Mathlib's `x ^ (0⁻¹ : ℝ) = x ^ 0 = 1`, so the
  left side would be at least `1` for the zero sequence.
- `knopp_lt` at `f = e^(-x)`: the geometric mean is `e^(-x/2)`, so the left side is `2` and the
  right side is `e`.
- `knopp_sharp`: the family of the proof route gives the ratios `2.3153`, `2.6114`, `2.7067`,
  `2.7171` at `ε = 0.5, 0.1, 0.01, 0.001`.

### Dependencies

Mathlib's AM–GM and integral Jensen inequalities, the bound `(1 + 1/n)^n ≤ e`, Tonelli. No other
layer.

## Layer 5: Weighted Hardy operators

### 5.1 The Muckenhoupt criterion

**Definitions.**

- `weightedHardyOp u v f x = v x * ∫⁻ t in Iic x, u t * f t`, the weighted Hardy operator on the
  line for weights `u, v : ℝ → ℝ≥0∞` (Edmunds–Evans, (2.1.5), and Balinsky–Evans–Lewis, (1.2.6),
  p. 5, on an interval `(a, b)`; an interval is the case of weights vanishing outside it).
- `muckenhouptConst u v p' q = ⨆ X, ‖u 1_{(-∞, X]}‖_{p'} ‖v 1_{(X, ∞)}‖_q`, the Muckenhoupt
  constant `A` (Edmunds–Evans, Theorem 2.2.1, (2.2.3), p. 12; Balinsky–Evans–Lewis, (1.2.10),
  p. 6).

**Targets.** Let `u`, `v`, `f` be almost everywhere measurable and `p, p' ∈ [1, ∞]` conjugate.

- **Sufficiency** (`eLpNorm_weightedHardyOp_le`): for `p ≤ q`,
  `‖T f‖_q ≤ 4 A ‖f‖_p` (Edmunds–Evans, Theorem 2.2.1, p. 12; Balinsky–Evans–Lewis,
  Theorem 1.2.3, p. 6, for `q = p`).
- **Necessity** (`muckenhouptConst_le`): if `‖T f‖_q ≤ C ‖f‖_p` for every measurable `f`, then
  `A ≤ C` (same places, p. 14 and p. 8).
- Target in prose: the tail operator `v(x) ∫_{t ≥ x} u f` has the same criterion with
  `⨆ X, ‖u 1_{[X, ∞)}‖_{p'} ‖v 1_{(-∞, X)}‖_q`, by the reflection `x ↦ −x`.

*Proof route.* Sawyer's dyadic argument (Edmunds–Evans, pp. 12–14; Balinsky–Evans–Lewis,
pp. 6–8): first `inf {‖f‖_p : ∫_{t ≤ X} u f = 1} = ‖u 1_{(-∞, X]}‖_{p'}⁻¹` (equation (2.2.6)); for
`f ≥ 0` let `X_i` be the points where `∫_{t ≤ x} u f` reaches `2^i`; on `[X_i, X_{i+1})` the
operator is at most `2^(i+1) v`, and summing with `A` and `p ≤ q` gives `‖T f‖_q ≤ 4 A ‖f‖_p`.
Necessity: test `f` supported in `(-∞, X]` with `∫ u f = 1` and `‖f‖_p` close to the infimum; then
`T f = v` on `(X, ∞)`. With values in `ℝ≥0∞` the hypotheses (2.2.1)–(2.2.2) of the sources are
not needed: an infinite `‖u 1_{(-∞, X]}‖_{p'}` with `‖v 1_{(X, ∞)}‖_q > 0` makes both `A` and the
operator norm infinite.

*Needs:* Mathlib's Hölder inequality and `eLpNorm`.

### 5.2 Sharp constants

- **Sharp bound for `p = q`** (`eLpNorm_weightedHardyOp_le_sharp`): for `1 < p < ∞`,
  `‖T f‖_p ≤ p^(1/p) p'^(1/p') A ‖f‖_p` (Balinsky–Evans–Lewis, Remark 1.2.4, p. 8;
  Edmunds–Evans, Remark 2.2.2, p. 14).
- **The source exponent `1`** (`eLpNorm_weightedHardyOp_le_of_one`): for `1 ≤ q`,
  `‖T f‖_q ≤ A ‖f‖₁` with `A = muckenhouptConst u v ⊤ q`, so `‖T‖ = A` by §5.1 (Edmunds–Evans,
  Remark 2.2.3, p. 15).
- Target in prose: `‖T‖ = A` also for `q = ∞` and every `p` (Edmunds–Evans, Remark 2.2.3, p. 15).

*Proof route.* Sharp bound (Balinsky–Evans–Lewis, Remark 1.2.4, p. 8, following the proof of
Theorem 1.2.3): put `U(t) = ∫_{s ≤ t} u^(p')`. Hölder with the auxiliary weight `U^(1/(p p'))`
gives `(∫_{t ≤ x} u f)^p ≤ (∫_{t ≤ x} f^p U^(1/p')) (∫_{t ≤ x} u^(p') U^(-1/p))^(p−1)`, and the
last integral is `p' U(x)^(1/p')`. Integrate against `v^p`, exchange the integrals by Tonelli and
bound `∫_{x ≥ t} v^p U(x)^((p − 1)/p')` by an integration by parts using
`∫_{x > X} v^p ≤ A^p U(X)^(1−p)`; the constants multiply to `p (p')^(p−1) A^p`, the `p`-th power of
`p^(1/p) p'^(1/p') A`. The exponent `1`:
Minkowski's integral inequality `TauCeti.lintegral_Lp_lintegral_le` gives
`‖T f‖_q ≤ ∫ f(t) u(t) ‖v 1_{[t, ∞)}‖_q dt`, and `u(t) ≤ ‖u 1_{(-∞, t]}‖_∞` for almost every `t`.

*Needs:* §5.1; `TauCeti.lintegral_Lp_lintegral_le`.

**Checks.**

- Sanity check `muckenhouptConst_rpow`: for `u = t^(-ε)` and `v = t^(ε − 1)` on `(0, ∞)`, the
  product `‖u 1_{(0, X]}‖_{p'} ‖v 1_{(X, ∞)}‖_p` does not depend on `X` and equals
  `(1 − ε p')^(-1/p') ((1 − ε) p − 1)^(-1/p)`; at `p = 3`, `ε = 0.2` it is `1.13386` at
  `X = 0.1, 1, 10`.
- With these weights `T` is the weighted Hardy operator of §2.2, and the sharp bound of §5.2 is
  `p^(1/p) p'^(1/p') A = (1/p' − ε)⁻¹`, the best constant of `hardy_rpow_weight_sharp`: at `p = 3`,
  `ε = 0.2` both are `2.142857`, while `4A = 4.5354`.
- Negative control for the exponents in `muckenhouptConst`: with `p` and `p'` exchanged, the
  power weights at `p = 3`, `ε = 0` give `2^(2/3) ≈ 1.5874`, which exceeds the operator norm
  `p' = 1.5` and so violates the necessity bound `A ≤ ‖T‖`; the correct constant is
  `2^(-1/3) ≈ 0.7937`.

### Dependencies

Mathlib's Hölder inequality, Tonelli and `eLpNorm`; Tau Ceti's Minkowski integral inequality.

## Layer 6: Opial's inequality and the Bihari–LaSalle inequality

### 6.1 Opial's inequality

- **One endpoint** (`opial_half`): for `g` absolutely continuous on `[0, a]` with `g(0) = 0`,
  `∫₀^a |g g'| ≤ (a/2) ∫₀^a g'²` (Mitrinović, §2.23.2, Theorem 2′, p. 154).
- **Its equality case** (`opial_half_eq_iff`): if `∫₀^a g'² < ∞`, equality holds exactly when
  `g = c x` on `[0, a]` (same place).
- **Opial's inequality** (`opial`): for `f` absolutely continuous on `[0, h]` with
  `f(0) = f(h) = 0`, `∫₀^h |f f'| ≤ (h/4) ∫₀^h f'²` (Mitrinović, §2.23.2, Theorems 1 and 2, p. 154).
- **Its equality case** (`opial_eq_iff`): if `∫₀^h f'² < ∞`, equality holds exactly when
  `f = c min(x, h − x)` (Mitrinović, Theorem 2, p. 154); in particular `h/4` is best possible.
- Target in prose: Beesack's weighted form, for `p > 0` continuous on `(a, X)` with
  `∫_a^X 1/p < ∞` and `f(x) = ∫_a^x f'`,
  `∫_a^X |f f'| ≤ (1/2) ∫_a^X dx/p(x) · ∫_a^X p f'²`, with equality exactly for
  `f = c ∫_a^x dt/p(t)` (Mitrinović, §2.23.2, Theorem 3, p. 155).

*Proof route.* Mallows' proof (Mitrinović, p. 155): with `h(x) = ∫₀ˣ |g'|`, `|g| ≤ h` and
`2 ∫₀^a |g g'| ≤ 2 ∫₀^a h h' = h(a)²`, and `h(a)² ≤ a ∫₀^a g'²` by Cauchy–Schwarz; equality in both
steps forces `|g'|` constant and `g` of constant sign. Opial's inequality applies the one-endpoint
form on `[0, h/2]` to `f` and to `x ↦ f(h − x)` (Mitrinović, p. 154).

*Needs:* `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`; Mathlib's Cauchy–Schwarz for
integrals (`ENNReal.lintegral_mul_le_Lp_mul_Lq` with `p = q = 2`).

### 6.2 The Bihari–LaSalle inequality

- **Bihari–LaSalle inequality** (`bihari`): let `u, f ≥ 0` be continuous on `[0, T]`, `w`
  continuous and monotone on `[0, ∞)` and positive on `(0, ∞)`, `k > 0`, and
  `u(t) ≤ k + ∫₀ᵗ f w(u)` on `[0, T]`. Then `∫_k^(max(u(t), k)) ds/w(s) ≤ ∫₀ᵗ f` on `[0, T]`, that
  is `G(u(t)) ≤ G(k) + ∫₀ᵗ f` for `G' = 1/w` whenever `u(t) ≥ k` (Pachpatte, Theorem 2.3.1,
  pp. 107–108). Stated with `G` rather than `G⁻¹`, it needs no restriction on `t`.
- **Osgood's criterion** (`eq_zero_of_le_integral_of_not_integrableOn_inv`): under the same
  hypotheses on `u`, `f`, `w`, if `1/w` is not integrable on `(0, 1]` and `u(t) ≤ ∫₀ᵗ f w(u)` on
  `[0, T]`, then `u = 0` on `[0, T]` (Pachpatte, remark after Theorem 2.3.1, p. 108, the case
  `k = 0` treated by LaSalle).

*Proof route.* Pachpatte, p. 108: `z(t) = k + ∫₀ᵗ f w(u)` is `C¹` with `z' = f w(u) ≤ f w(z)`
since `0 ≤ u ≤ z` and `w` is monotone; `z ≥ k > 0`, so `(G ∘ z)' = z'/w(z) ≤ f`, and integration
gives `G(z(t)) − G(k) ≤ ∫₀ᵗ f`; finally `max(u, k) ≤ z` and `G` is increasing. Osgood: apply
`bihari` with `k = ε` to get `∫_ε^(u(t)) ds/w(s) ≤ ∫₀ᵗ f < ∞` for every `ε ∈ (0, u(t))`; if
`u(t) > 0` the left side tends to `∞` as `ε → 0`.

*Needs:* Mathlib's fundamental theorem of calculus; nothing from this roadmap.

**Checks.**

- `opial_eq_iff`: for the tent `min(x, h − x)` on `[0, 2]` both sides of `opial` are `1`.
- `opial` for `sin(π x/h)`: the left side is `1` and the right side `π²/8 ≈ 1.2337`, ratio
  `8/π² ≈ 0.8106`.
- Negative control for the boundary condition: `f(x) = x` on `[0, 2]` (only `f(0) = 0`) has
  `∫ |f f'| = 2 > 1 = (h/4) ∫ f'²`, so `f(h) = 0` cannot be dropped from `opial`; `opial_half`
  with `a = 2` gives the correct bound `2`.
- `bihari` with `w(s) = s²`, `f = 1`, `k = 1/2`: the solution `u = k/(1 − k t)` of `u' = u²` gives
  equality, `∫_k^u ds/s² = 1/k − 1/u = t`, at `t = 1`.
- `bihari` with `w(s) = s` is Grönwall's inequality: `log(max(u, k)/k) ≤ ∫₀ᵗ f`.
- Negative control for Osgood's hypothesis: for `w = √s`, `1/w` is integrable at `0⁺` and
  `u = t²/4` satisfies `u = ∫₀ᵗ √u` without vanishing.

### Dependencies

Mathlib's absolute continuity on intervals, Cauchy–Schwarz and fundamental theorem of calculus. No
other layer.

## Downstream consumers

- UnboundedOperators §4.8 (UO-D07) uses the half-line Hardy inequality for `p = 2` for
  inverse-square potentials; `hardy_deriv_le` contains that inequality for every `p > 1` and every
  locally absolutely continuous function vanishing at `0`.
- Real interpolation (Lorentz spaces and the `K`-method) uses the weighted Hardy inequalities on
  `(0, ∞)`; the best constants of §2.2 and the Muckenhoupt criterion of Layer 5 are the general
  forms of the bounds it needs.
- Uniqueness theorems for ordinary differential equations with non-Lipschitz right-hand sides use
  Osgood's criterion of §6.2.

## Scope and ownership

The roadmap is complete when every target below is a theorem of the TauCeti namespace with the
hypotheses stated here, every owned definition has the API its Checks name, and every statement
in `Suggested.lean` is proved.

Owned here:

- the constant `kernelConstant` of a kernel homogeneous of degree `-1` and the integral, series,
  multilinear and reversed theorems of Layer 1;
- Hardy's inequality for series in finite-section, strict, weighted and tail (Copson) form with
  best constants, and for integrals the non-strict and strict forms with power weights, the best
  constants, the Riemann–Liouville form, the reversed inequality for `0 < p < 1` and the form with
  derivatives (Layer 2);
- Hilbert's inequality for the kernel `1/(x + y)`, for integrals and for series, strict and with
  best constant, its operator and weighted forms and the inequality with two exponents (Layer 3);
- Carleman's inequality with Pólya's bound and best constant, and Knopp's integral form (Layer 4);
- the weighted Hardy operator `weightedHardyOp`, the Muckenhoupt constant `muckenhouptConst` and
  the theorems of Layer 5;
- Opial's inequality with its equality cases and Beesack's weighted form, the Bihari–LaSalle
  inequality and Osgood's criterion (Layer 6).

**Not owned here.**

- Formalized in Tau Ceti and consumed, not restated: Schur's test and Young's inequality for
  integral kernels (`TauCeti/MeasureTheory/Integral/SchurTest.lean`), Minkowski's integral
  inequality, and Euler's second beta integral (see *Exact supplier contracts*).
- Formalized in Tau Ceti and not restated: the integral Grönwall inequality with a constant
  coefficient, `TauCeti.le_mul_exp_of_le_add_mul_integral` (`TauCeti/Analysis/ODE/Gronwall.lean`),
  which for nonnegative functions is the case `w(s) = s` with constant `f` of §6.2. Mathlib owns
  the differential Grönwall inequality `le_gronwallBound_of_liminf_deriv_right_le` and a discrete
  Grönwall inequality. The non-strict weighted Hardy inequalities that §2.3 consumes are targets
  of §2.2 here; the form with the measure `dt/t` used in real interpolation is not stated here.
- [UnboundedOperators](../OperatorTheory/UnboundedOperators/README.md) §4.8 (UO-D07) owns the
  half-line Hardy inequality `∫|u′|² ≥ ¼ ∫|u/r|²` with its sharpness for `u ∈ C_c^∞(0, ∞)`, as an
  input to its Sturm–Liouville theory. This roadmap owns the inequality for all `p > 1` and
  locally absolutely continuous functions (§2.3) and the best constants in integral-operator form
  (§2.2), and does not restate the smooth compactly supported case.
- The inequality also called Hilbert's, for the kernel `1/(λ_r − λ_s)` with separated real
  frequencies, is owned by
  [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) §2.9 (constant `π/δ`)
  and [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §1.5a (weighted, constant
  `3π/2`); its integer case `|∑_{m ≠ n} aₘ bₙ/(m − n)| ≤ π ‖a‖₂ ‖b‖₂` is the case `δ = 1` of the
  former. Layer 3 treats only the positive kernel `1/(x + y)` and its relatives.
- The Hilbert transform is owned by [PDE](../PDE/README.md) §2.3; Hardy spaces of analytic
  functions (Tau Ceti `TauCeti/Analysis/Fourier/Hardy/`) are a different subject.
- The roadmap on means, majorization and discrete inequalities owns weighted means, the finite
  inequalities of Hölder and Minkowski with their equality cases, and majorization; it names the
  inequalities of this roadmap as outside its scope.
- Rearrangements and symmetrisation belong to [Isoperimetry](../Isoperimetry/README.md) Layer 2,
  which uses the Schwarz rearrangement with its Hardy–Littlewood inequality; Theorem 333 of
  §2.1 is the only rearrangement statement here, for sequences.

## Exact supplier contracts

### From Mathlib

- `ENNReal.lintegral_mul_le_Lp_mul_Lq` (`Mathlib/MeasureTheory/Integral/MeanInequalities.lean`):
  Hölder's inequality for `∫⁻` with `p.HolderConjugate q`. Used in §§1.2, 6.1.
- `ENNReal.inner_le_Lp_mul_Lq`, `NNReal.inner_le_Lp_mul_Lq_tsum`, `Real.inner_le_Lp_mul_Lq`
  (`Mathlib/Analysis/MeanInequalities.lean`): Hölder's inequality for finite sums and series.
  Used in §§1.3, 2.1.
- `Real.geom_mean_le_arith_mean_weighted` (`Mathlib/Analysis/MeanInequalities.lean`): weighted
  AM–GM. Used in §§2.1, 4.1.
- `ConvexOn.map_integral_le` (`Mathlib/Analysis/Convex/Integral.lean`): Jensen's inequality for
  integrals. Used in §4.2.
- `MeasureTheory.lintegral_lintegral_swap` (`Mathlib/MeasureTheory/Measure/Prod.lean`) and
  `tsum_comm`: Tonelli for integrals and series. Used in §§1.2, 4.1, 4.2, 5.2.
- `Real.map_volume_mul_left` (`Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean`): scaling of
  Lebesgue measure. Used in §§1.1, 1.2.
- `ProbabilityTheory.beta`, `Real.Gamma`, `Real.Gamma_mul_Gamma_one_sub`
  (`Mathlib/Probability/Distributions/Beta.lean`,
  `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`): the Beta function and the reflection
  formula `Γ(s) Γ(1 − s) = π / sin(π s)`. Used in §§2.2, 3.1.
- `Real.one_add_inv_pow_le_exp`, `Real.add_one_lt_exp`
  (`Mathlib/Analysis/Complex/Exponential.lean`): `(1 + 1/n)^n ≤ e` and `x + 1 < e^x` for `x ≠ 0`.
  Used in §4.1.
- `AbsolutelyContinuousOnInterval`, `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean` and
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`): absolute
  continuity and the fundamental theorem of calculus for it. Used in §2.3 and Layer 6.
- `MeasureTheory.eLpNorm`, `ENNReal.HolderConjugate`, `Real.HolderConjugate`: norms and
  conjugate exponents. Used throughout.
- `le_gronwallBound_of_liminf_deriv_right_le` (`Mathlib/Analysis/ODE/Gronwall.lean`): the
  differential Grönwall inequality, named in *Scope and ownership*.

### From Tau Ceti

- `TauCeti.lintegral_rpow_lintegral_mul_le` and
  `TauCeti.lintegral_rpow_lintegral_mul_le_of_inv_add_inv_eq`
  (`TauCeti/MeasureTheory/Integral/SchurTest.lean`, imported by `Suggested.lean`): Schur's test,
  `∫⁻ x, (∫⁻ y, k x y * g y) ^ p ≤ A ^ (p − 1) * B * ∫⁻ y, g y ^ p` for a jointly measurable
  kernel with row integrals at most `A` and column integrals at most `B` almost everywhere and
  `p ≥ 1`, and Young's inequality for kernels. Used in §1.2.
- `TauCeti.lintegral_Lp_lintegral_le` (`TauCeti/MeasureTheory/Integral/MinkowskiIntegral.lean`,
  imported): Minkowski's integral inequality in `ℝ≥0∞`, for a σ-finite and an s-finite measure and
  `p ≥ 1`. Used in §5.2.
- `TauCeti.integral_rpow_mul_one_add_rpow` (`TauCeti/Analysis/SpecialFunctions/Beta.lean`,
  imported): `∫ x in Ioi 0, x ^ (a − 1) * (1 + x) ^ (-(a + b)) = beta a b` for `a, b > 0`. Used in
  §3.1.
- `TauCeti.le_mul_exp_of_le_add_mul_integral` (`TauCeti/Analysis/ODE/Gronwall.lean`, imported):
  for `φ` continuous on `[a, b]`, `K ≥ 0` and `φ t ≤ c + K ∫ₐᵗ φ`, `φ t ≤ c exp(K (t − a))`. Named
  in *Scope and ownership*; not used by a route.

### From other roadmaps

- [UnboundedOperators](../OperatorTheory/UnboundedOperators/README.md) §4.8 (UO-D07): the case
  `p = 2` of §2.3 for smooth compactly supported functions, with its sharpness, is owned there and
  is the reference for the comparison Check of Layer 2 (`hardy_deriv_le` at `p = 2`); nothing
  else is consumed.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Hardy inequalities in several variables and on domains**:
  `∫_{ℝ^n} |f|^p/|x|^p ≤ (p/(n − p))^p ∫ |∇f|^p` for `p < n` (a case of Balinsky–Evans–Lewis,
  Theorem 1.2.5, p. 9), Hardy inequalities with the distance to the boundary of a convex or
  mean-convex domain, and their improvements with remainder terms; they need Sobolev spaces on
  domains and the geometry of the distance function.
- **Weighted Hardy operators for `q < p`**: Maz'ya's criterion (Edmunds–Evans, Theorem 2.2.4,
  p. 15), and compactness and approximation numbers of Hardy-type operators (Edmunds–Evans,
  §§2.3–2.4).
- **Sharp constants with two exponents**: the best constant of §3.3, which Hardy–Littlewood–Pólya
  (p. 253) leave undetermined, and the best constant of the weighted Hardy operator for `p < q`,
  for which the bound `k(p, q) A` of Manakov and Read is the best known (Edmunds–Evans,
  Remark 2.2.2, (2.2.8), p. 15).
- **Discrete Opial inequalities and higher-order Opial and Wirtinger inequalities**
  (Mitrinović, §2.23), and the Gronwall–Bellman–Bihari inequalities in several
  variables (Pachpatte, Chapter 2 and the chapters after it).

## Prior formalization

- **[lean-CKMA](https://github.com/bjbraams/lean-CKMA)** (the author's project, Apache 2.0,
  commit f4bd822; design ideas and provenance): `CKMA/Analysis/Inequalities/ClassicalSequences.lean`
  proves the discrete Hardy inequality and the optimality of its constant;
  `CKMA/Analysis/Inequalities/Hilbert.lean` with `Hilbert/Kernel.lean` proves Hilbert's
  inequality for integrals and for series with the optimality of `π / sin(π/p)`;
  `CKMA/Analysis/Inequalities/Carleman.lean` proves Carleman's inequality and the optimality of
  `e`. They are the starting point for §§2.1, 3.1, 3.2 and 4.1, with the statements here moved to
  `ℝ≥0∞` and strengthened to strict inequalities. Coverage of the entries 11.32–11.42 of its
  synopsis file SYNOPSIS11.md (Hardy, Hilbert and differential inequalities): 11.32 (§2.1),
  11.33–11.34 (§2.2), 11.35 (Layer 5), 11.37 (Layer 3), 11.38 (§4.1), 11.39 (§4.2), 11.40 (linear
  case of §6.2), 11.41 (§6.2), 11.42 (§6.1).

## References

- P. R. Beesack, On an integral inequality of Z. Opial, *Trans. Amer. Math. Soc.* 104 (1962),
  470–475. Cited through Mitrinović, §2.23.2, Theorem 3, p. 155.
- A. A. Balinsky, W. D. Evans and R. T. Lewis, *The Analysis and Geometry of Hardy's Inequality*,
  Universitext, Springer, Cham, 2015. Used: Theorem 1.2.1, p. 3, proof pp. 3–4; Corollary 1.2.2,
  p. 5; (1.2.6), p. 5; Theorem 1.2.3, p. 6, proof pp. 6–8; Remark 1.2.4, p. 8; Theorem 1.2.5,
  p. 9.
- D. E. Edmunds and W. D. Evans, *Hardy Operators, Function Spaces and Embeddings*, Springer
  Monographs in Mathematics, Springer, Berlin, 2004. Used: Theorem 2.2.1, p. 12, proof pp. 12–14;
  Remark 2.2.2, pp. 14–15; Remark 2.2.3, p. 15; Theorem 2.2.4, p. 15.
- D. J. H. Garling, *Inequalities: A Journey into Linear Analysis*, Cambridge University Press,
  2007. Used: Theorem 3.2.1, p. 22; Exercise 3.7, p. 23; §5.10 and Theorem 5.10.1, p. 65, proof
  pp. 65–66; Theorem 5.10.2, p. 66; Corollary 8.1.1, p. 104.
- G. H. Hardy, J. E. Littlewood and G. Pólya, *Inequalities*, Cambridge University Press, 1934.
  Used: Chapter IX, Theorems 315–317, p. 226; Theorem 318, pp. 227–228, proof pp. 228–229;
  Theorem 319, p. 229, proof p. 230; Theorem 321, p. 231; Theorem 322, pp. 231–232; §9.5,
  pp. 232–234; Theorem 323, p. 234; Theorem 326, p. 239, proof pp. 240–241; Theorem 327, p. 240;
  Theorem 328, p. 244; Theorem 329, p. 245; Theorem 330, pp. 245–246; Theorem 331, p. 246;
  Theorem 332, p. 247; Theorem 333, p. 248; Theorem 334, p. 249, proof pp. 249–250; Theorem 335,
  p. 250; Theorem 336, p. 250; Theorem 337, p. 251; Theorem 338, p. 252; Theorem 339, p. 253, proof
  pp. 253–254; Theorem 340, p. 254; Theorem 341, p. 254; Theorem 342, p. 255.
- D. S. Mitrinović, *Analytic Inequalities*, Grundlehren 165, Springer, Berlin, 1970. Used:
  §2.23.2, Theorems 1, 2 and 2′, p. 154; Mallows' proof and Theorem 3, p. 155.
- B. G. Pachpatte, *Inequalities for Differential and Integral Equations*, Mathematics in Science
  and Engineering 197, Academic Press, San Diego, 1998. Used: §2.3, Theorem 2.3.1, pp. 107–108, and
  the remark after it, p. 108.

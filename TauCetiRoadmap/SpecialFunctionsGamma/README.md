# Roadmap: the Gamma and Beta functions

**Summary.** This roadmap completes the theory of the Gamma, Beta, psi and polygamma functions of
Chapter 5 of the NIST *Digital Library of Mathematical Functions* (DLMF; see
[References](#references)) as a library. Mathlib has `Γ` (`Complex.Gamma`), its integral, Euler's
limit, the recurrence, reflection and duplication formulas, the Beta integral, `ψ`
(`Complex.digamma`) with its recurrence, reflection and duplication, and Euler's constant; Tau Ceti
has the real Beta integrals 5.12.1 and 5.12.3 and, in `TauCeti/Analysis/SpecialFunctions/Gamma/`,
the Gauss series 5.7.6 of `ψ`, the real digamma function and `Γ` on vertical lines. This roadmap
proves what remains of DLMF §§5.2–5.9 and §§5.12–5.16, apart from the explicit Stirling theory and
the Barnes `G`-function, which other roadmaps own.

The roadmap covers:
- the Pochhammer duplication and Lah formulas, the values of `Γ` and `ψ` on the imaginary axis and
  at half-integers, Gauss's digamma theorem, and Gauss's multiplication formulas;
- the inequalities of Gautschi and Kershaw, the inequalities of §5.6(i) at `x` and `1/x`, and the
  lower bound and quotient bound of §5.6(ii);
- the Maclaurin series of `1/Γ`, `log Γ(1 + z)` and `ψ(1 + z)`, the series of `ψ` on half
  arguments and on the line `1 + iy`, the Weierstrass product and the balanced products;
- the integral representations of `Γ` and `ψ`: Hankel's loop, Temme's real-axis integral, the
  Cauchy–Saalschütz and oscillatory integrals, and the Frullani-type integrals of `ψ` and `γ`;
- the Beta integrals, including the loop and Pochhammer contours of §5.12(ii), with the contours
  written out;
- the Barnes-type integrals of §5.13 other than Barnes's first lemma;
- the polygamma functions: definition, values, recurrence, reflection, multiplication,
  asymptotic expansions in the sector `|ph z| ≤ π − δ`, and the two series of §5.16;
- the integrals of Dirichlet, Selberg, Aomoto, Mehta and Dyson (§5.14), on their full ranges of
  parameters.

**This roadmap is DLMF Chapter 5, not all of it.** The formula ranges are in the table under
[Scope and ownership](#scope-and-ownership). Stirling's series and its remainders (§5.11), the
bounds 5.6.1 and 5.6.9, Binet's formulas 5.9.10, the Mellin–Barnes integrals with `ζ` (5.9.11,
5.9.17), the continued fraction of §5.10, the Barnes `G`-function (§5.17), the `q`-Gamma and
`q`-Beta functions (§5.18), and the applications and computation sections are listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

The roadmap rests on Mathlib and Tau Ceti, on five roadmaps on main and on ExplicitNumberFields.
It consumes Stirling's formula on sectors and on vertical strips and the asymptotics of `ψ` from
[ZerosOfLFunctions](../ZerosOfLFunctions/README.md); the complex Gamma integral, Watson's lemma in
a sector, the rotation of the path, the Gamma bound on vertical strips and the exponential Mellin
inversion from [AsymptoticExpansions](../AsymptoticExpansions/README.md); the Mellin–Barnes
integral of `(1 + u)^{−a}`, the complex Beta integral 5.12.3, Barnes's first lemma and the periodic
Carlson lemma from [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md);
the product formula 5.8.3, its comparison in `x` and the value of `|Γ(1 + iy)|²` from
[SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md); and Gauss's
integral 5.9.12 from [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md); and the
series 5.7.6 and 5.15.1 on `Re z > 0` from ExplicitNumberFields 1.1a.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Gamma/`, beside Tau Ceti's existing files there,
and `TauCeti/Analysis/SpecialFunctions/Beta.lean`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Pochhammer symbols, special values and functional relations** (DLMF §5.2(iii), §5.4, §5.5).
2. **Series and products** (DLMF §§5.7–5.8 without 5.7.6, 5.8.1 and 5.8.3), and DLMF 5.15.1.
3. **Inequalities** (DLMF §5.6 without 5.6.1 and 5.6.9).
4. **Integral representations of `Γ` and `ψ`** (DLMF §5.9 without 5.9.10–5.9.12 and 5.9.17).
5. **The Beta function** (DLMF §5.12 without 5.12.1 and 5.12.3).
6. **Barnes-type integrals** (DLMF §5.13 without 5.13.3).
7. **Polygamma functions** (DLMF §§5.15–5.16).
8. **Multidimensional integrals** (DLMF §5.14).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 5.2.8, 5.2.9 | Pochhammer duplication and the Lah expansions (1.1). |
| 5.4.2, 5.4.4–5.4.5, 5.4.15–5.4.18 | Values of `Γ` and `ψ` at half-integers and on the lines `Re z ∈ {0, ¼, ½, 1}` (1.2). |
| 5.4.19 | Gauss's digamma theorem (1.3). |
| 5.5.6, 5.5.7, 5.5.9 | Gauss's multiplication formulas (1.4). |
| 5.7.1–5.7.5, 5.7.7, 5.7.8 | Maclaurin series and other series (2.1–2.3). |
| 5.8.2, 5.8.4–5.8.5 | The Weierstrass product and the balanced products (2.4). |
| 5.6.2–5.6.8 | Inequalities (Layer 3); 5.6.6 for every real `x` off the poles. |
| 5.9.1–5.9.9, 5.9.2_5 | Integral representations of `Γ` (4.1–4.3). |
| 5.9.13–5.9.16, 5.9.18–5.9.20 | Integral representations of `ψ`, `γ` and the derivatives of `Γ` (4.4). |
| 5.12.2, 5.12.4–5.12.12 | Beta integrals on segments, half-lines, vertical lines and loops (Layer 5). |
| 5.13.1, 5.13.2, 5.13.4, 5.13.5 | Barnes-type integrals (Layer 6). |
| 5.15.1 off `Re z > 0` (2.3), 5.15.2–5.15.9, the `ψ′` values of 5.4.12–5.4.13, 5.16.1–5.16.2 | Polygamma functions (Layer 7). |
| 5.14.1–5.14.7 | Dirichlet, Selberg, Aomoto, Mehta and Dyson integrals (Layer 8). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- 5.2.1 (`Complex.Gamma_eq_integral`), 5.2.2 (the definition `Complex.digamma = logDeriv Gamma`),
  5.2.3 (`Real.eulerMascheroniConstant`), 5.2.4–5.2.5 (`ascPochhammer`,
  `Complex.Gamma_add_nat_div_Gamma_eq`), 5.2.6–5.2.7 (`ascPochhammer_eval_neg_eq_descPochhammer`,
  `descPochhammer_eval_eq_ascPochhammer`, `descPochhammer_eval_eq_descFactorial`,
  `ascPochhammer_eval_neg_natCast_of_lt`);
- 5.4.1 (`Complex.Gamma_nat_eq_factorial`), 5.4.6 (`Real.Gamma_one_half_eq`), 5.4.11
  (`Real.eulerMascheroniConstant_eq_neg_deriv`), and the `ψ` values of 5.4.12–5.4.14
  (`Complex.digamma_one`, `Complex.digamma_one_half`, `Complex.digamma_nat_add_one`), and 5.4.3
  (SpecialFunctionsParabolicCylinder 6.6(a), divided by `|iy|² = y²`);
- 5.5.1–5.5.5 and 5.5.8 (`Complex.Gamma_add_one`, `Complex.digamma_apply_add_one`,
  `Complex.Gamma_mul_Gamma_one_sub`, `Complex.digamma_one_sub`, `Complex.Gamma_mul_Gamma_add_half`,
  `Complex.digamma_two_mul`);
- 5.6.6 for `x > 0` (Tau Ceti's `Complex.norm_Gamma_le_Gamma_re`), 5.7.6 (ExplicitNumberFields
  1.1a for `Re z > 0`; Tau Ceti's `Complex.digamma_eq_gaussSeries` for every `z` off the poles),
  5.15.1 for `Re z > 0` (ExplicitNumberFields 1.1a), 5.8.1 (`Complex.GammaSeq_tendsto_Gamma`);
- 5.9.1 for real `ν > 0` and `z > 0` (`integral_rpow_mul_exp_neg_mul_rpow`);
- 5.12.1 (`Complex.Gamma_mul_Gamma_eq_betaIntegral`, and Tau Ceti's
  `TauCeti.integral_rpow_mul_one_sub_rpow` for real parameters) and 5.12.3 for real parameters
  (Tau Ceti's `TauCeti.integral_rpow_mul_one_add_rpow`).

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti nor the consumed roadmaps provide:

| Result | Target |
|---|---|
| The Maclaurin coefficients `c_k` of `1/Γ` (`Complex.invGammaCoeff`) | 2.2 |
| The sine integral `∫₀^∞ sin(at)/(e^{2πt} − 1) dt = ¼ coth(a/2) − 1/(2a)` for `a > 0` | 4.4 |
| The polygamma functions `Complex.polygamma n = iteratedDeriv n Complex.digamma`, their holomorphy off the poles and their reality on the positive axis | 7.1 |
| The Laplace representation `ψ⁽ⁿ⁾(z) = (−1)ⁿ⁺¹ ∫₀^∞ tⁿ e^{−zt}/(1 − e^{−t}) dt` for `n ≥ 1`, `Re z > 0` | 7.3 |
| Carlson's theorem (the periodic case is SpecialFunctionsHypergeometric 4.2) | 8.1 |
| Landau's theorem for integrals of nonnegative functions against `x^s` | 8.1 |
| The Selberg integrand, its integrability on the full parameter range, and Aomoto's recurrence | 8.3 |

**What it does not own:**
- Stirling's formula on sectors, the holomorphic `log Γ` there and the Gamma function on vertical
  strips (ZerosOfLFunctions 1.1–1.3), and the complex Gamma integral, Watson's lemma in a sector,
  the rotation of the path and the Gamma bound on vertical strips (AsymptoticExpansions 4.1–4.3
  and 8.6); it consumes them.
- The Mellin–Barnes integral of `(1 + u)^{−a}` for `u > 0`, the Beta integral 5.12.3 for complex
  parameters and Barnes's first lemma 5.13.3 (SpecialFunctionsHypergeometric 6.3); it consumes
  them.
- The product formula 5.8.3, its comparison in `x` and `|Γ(1 + iy)|² = πy/sinh πy`, which is
  5.4.3 (SpecialFunctionsParabolicCylinder 6.6(a)); it consumes them.
- The series 5.7.6 and 5.15.1 on `Re z > 0` (ExplicitNumberFields 1.1a); it consumes them. 2.3
  extends 5.15.1 to every `z ∉ {0, −1, −2, …}` by the recurrence, and Tau Ceti has 5.7.6 there.
- The periodic Carlson lemma (SpecialFunctionsHypergeometric 4.2); it consumes it, and 8.1 proves
  the general theorem, which Dyson's integral (8.5) needs.
- Gauss's integral 5.9.12 (AnalyticNumberTheoryPartI §1.8a, `digamma_eq_integral`); it consumes
  it.
- The Maclaurin series of `log Γ(1 + z)` on `|z| < 1` in the form `−γz + Σ_{k≥2} (−1)^k ζ(k) z^k/k`
  (ConformalMappingPartII 5.6) and Gauss's triplication formula, the case `n = 3` of 5.5.6
  (SpecialFunctionsAiry 7.1). These are owned there; 2.1 and 1.4 here prove the general
  statements independently.
- Stirling's series and its remainders (§5.11), the bounds 5.6.1 and 5.6.9, Binet's formulas
  5.9.10–5.9.10_2, the formulas 5.9.11_1–5.9.11_2 for `Γ*`, the Mellin–Barnes integrals 5.9.11 and
  5.9.17, the
  continued fraction (§5.10), the extrema 5.4.20, the Barnes `G`-function (§5.17), the `q`-Gamma
  and `q`-Beta functions (§5.18), and the applications and computation sections (§§5.19–5.21).

See the last section for these.

RandomMatrices 5.2–5.3 prove the Gaussian, Laguerre and Jacobi normalizations at `c = β/2` for
`β ∈ {1, 2}` through matrix models, as part of their eigenvalue-density theorems; 8.3–8.4 here give
the same constants for every `β > 0`.

**The boundary in one sentence:** this roadmap owns every formula of DLMF §§5.2–5.9 and §§5.12–5.16
that is not in Mathlib or Tau Ceti, not one of the consumed results above, and not part of the
explicit Stirling theory (§5.11, 5.6.1, 5.6.9, 5.9.10–5.9.11_2, 5.9.17) or the continued fraction
of §5.10.

## Conventions

- **Gamma and its reciprocal.** `Γ` is Mathlib's `Complex.Gamma`, which is `0` at the poles
  `0, −1, −2, …`, and `Real.Gamma` on the real line (`Complex.Gamma_ofReal`). DLMF's `1/Γ(z)` is
  `(Gamma z)⁻¹`, which is entire under this convention (`Complex.differentiable_one_div_Gamma`).
  A `Γ` in a denominator is written as the factor `(Gamma ·)⁻¹`, so a formula with `Γ` only in
  denominators holds for all parameters; a `Γ` in a numerator carries the hypothesis that its
  argument is not a pole. Where DLMF prints a quotient that is entire after cancellation, the
  target is the form with reciprocal Gamma factors, and the layer says so.
- **The Beta function.** DLMF's `B(a, b)` is written `Γ(a) Γ(b) / Γ(a + b)`, or in a reciprocal
  form, and not as Mathlib's `Complex.betaIntegral`, which is the integral `∫₀¹` and has Lean's
  value of a divergent integral when `Re a ≤ 0` or `Re b ≤ 0`. For real parameters Mathlib's
  `ProbabilityTheory.beta` is the same quotient.
- **Psi and polygamma.** `ψ` is `Complex.digamma = logDeriv Gamma`; at the poles of `Γ` it is
  Lean's junk value of a logarithmic derivative, and every theorem about `ψ` at a point carries the
  hypothesis that the point is not a pole. `ψ⁽ⁿ⁾` is `Complex.polygamma n`, defined as
  `iteratedDeriv n Complex.digamma`, so `ψ⁽⁰⁾ = ψ`. For real `x > 0`, `ψ(x)` is
  `Complex.digamma x`, a real number (Tau Ceti's `Complex.digamma_ofReal` identifies it with
  `Real.digamma x`); a real inequality in `ψ` is stated with `(Complex.digamma x).re`.
- **Euler's constant** `γ` is `Real.eulerMascheroniConstant`; `ζ` is `riemannZeta`; Bernoulli
  numbers are Mathlib's `bernoulli` (with `B₁ = −½`; only even indices occur here).
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`, and the falling factorial
  `x(x − 1) ⋯ (x − n + 1)` is `(descPochhammer ℂ n).eval x`.
- **Powers** are principal (`Complex.cpow`) unless the layer pins another branch. A positive real
  base `x^s` is `(x : ℂ) ^ s`. DLMF's `|ph z| < π` is `z ∈ slitPlane`, and `|ph z| ≤ π − δ` is
  `|Complex.arg z| ≤ π − δ`.
- **Series and products.** An absolutely convergent series is a `HasSum`, an infinite product is a
  `HasProd`. A conditionally convergent series (5.7.7, 5.16.1) is the limit of its partial sums
  `Σ_{k<N}` as `N → ∞`.
- **Integrals.** An absolutely convergent integral is a Lebesgue integral over the stated set, with
  integrability part of the target. A conditionally convergent integral at `∞` (5.9.6–5.9.9) is the
  limit of `∫₀^R` as `R → ∞`. A vertical-line integral `(2πi)⁻¹ ∫_{c−i∞}^{c+i∞} f(s) ds` is
  `(2π)⁻¹ ∫_ℝ f(c + iy) dy`, with `y ↦ f(c + iy)` integrable.
- **Contours.** DLMF fixes the loop contours of 5.9.2 and 5.12.10–5.12.12 by figures and words.
  This roadmap writes each one as a sum of segment, ray and circle integrals with every branch
  stated, depending on a radius `ε`; the target holds for every admissible `ε`, which also shows
  that the value does not depend on `ε`.
- **Asymptotic expansions.** `f(z) ∼ Σ_k a_k φ_k(z)` as `z → ∞` in `|ph z| ≤ π − δ` means that for
  every `N` the remainder after `N` terms is `O(φ_N)` along the filter
  `cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π − δ}`. This is AsymptoticExpansions' `HasAsymptoticExpansion`
  with that filter.
- **Multidimensional integrals** are over `Fin n → ℝ` with the product measure. The simplex `V_n`
  of 5.14.1 is `{t | ∀ k, 0 ≤ t k} ∩ {t | Σ_k t k ≤ 1}`. DLMF's
  `Δ(t₁, …, tₙ) = ∏_{j<k} (t_j − t_k)` (5.14.3) enters 5.14.4–5.14.7 only through `|Δ|`, which is
  `|(Matrix.vandermonde t).det|` (`Matrix.det_vandermonde`). The power `|Δ|^{2c}` for complex `c`
  is `((|Δ| : ℝ) : ℂ) ^ (2c)`, whose value on the null set `Δ = 0` does not matter.
- **Names.** New functions and theorems live in `Complex` beside Mathlib's `Complex.Gamma` and
  `Complex.digamma` (`Complex.polygamma`, `Complex.invGammaCoeff`, `Complex.lah`), and the
  multidimensional integrals in `TauCeti`. Names in the layers are suggestions.

## Exact supplier contracts

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- 1.2: Stirling's formula `log Γ(s) = (s − ½) Log s − s + ½ log 2π + O(1/|s|)` uniformly on
  `|arg s| < π − δ`, `|s| > 1`. Used for the quotients `Γ(t + a)/Γ(t + b) ∼ t^{a−b}` with complex
  `a`, `b` as `t → +∞` on the real line (6.3).
- 1.3: `log |Γ(σ + it)| = (σ − ½) log|t| − π|t|/2 + ½ log 2π + O(1/|t|)` uniformly for `σ` in a
  compact interval, which bounds `|Γ|` and `|1/Γ|` on vertical strips (Layer 6, 8.3, 8.4).
- 1.4: for real `x > 0`, `ψ(x)` is real and `(Complex.digamma x).re = deriv (log ∘ Real.Gamma) x`,
  and `ψ(s) = log s + O(1/|s|)` on sectors (3.2).

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- 1.1 and 1.3: `HasAsymptoticExpansion` and the asymptotic scale `z ↦ z^{−n}` along a sector
  filter (7.3).
- 4.1: `∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}` for `Re s > 0`, `Re z > 0`
  (`integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos`) (4.1, 4.4, 5.2, 7.3).
- 4.2: Watson's lemma in `|ph z| ≤ π/2 − δ` (`hasAsymptoticExpansion_laplace_sector`) (7.3).
- 4.3: the rotation of the path of a Laplace integral and the continuation of its expansion to
  the rotated sector (7.3, and the rotated Beta integral of 3.4).
- 8.6: `|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` on a vertical strip away from the poles
  (`exists_norm_Gamma_le`), and `Complex.VerticalIntegrable` for `Γ` times `e^{θ|y|}` with
  `θ < π/2` on every line `Re z = x` off the poles (Layer 6, 7.4).
- 8.7: for `c > 0` and `Re w > 0`, `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}`
  (`integral_Gamma_mul_cpow_neg`) (Layer 6).

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- 6.3: the Mellin–Barnes integral of `(1 + u)^{−a}`: for `0 < σ′ < Re a` and `u > 0`,
  `Γ(a) (1 + u)^{−a} = (2π)⁻¹ ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy`; the Beta integral
  `∫₀^∞ t^{s−1} (1 + t)^{−a} dt = Γ(s) Γ(a − s)/Γ(a)` for `0 < Re s < Re a` (DLMF 5.12.3); and
  Barnes's first lemma, DLMF 5.13.3 (`integral_Gamma_mul_Gamma_mul_Gamma_mul_Gamma`) (5.4, 6.1,
  6.4).
- 4.2: the periodic Carlson lemma: a `1`-periodic function holomorphic on a neighbourhood of
  `Re w ≥ 0`, bounded by `C (1 + |Im w|)^K e^{σ|Im w|}` with `σ < π` on `0 ≤ Re w ≤ 1` and vanishing
  at `0`, vanishes on `Re w ≥ 0` (8.3).

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- 6.6(a): for real `x ∉ {0, −1, −2, …}`, `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)²/|Γ(x + iy)|²`
  (`hasProd_Gamma_norm_quotient`, DLMF 5.8.3), and its comparison in `x`:
  `|Γ(x + iy)| ≤ Γ(x)/Γ(x′) · |Γ(x′ + iy)|` for `0 < x ≤ x′` (3.3); and
  `|Γ(1 + iy)|² = πy/sinh πy` for `y ≠ 0` (`norm_Gamma_one_add_mul_I_sq`, 1.2).

### From [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md)

- §1.8a: Gauss's integral `ψ(z) = ∫₀^∞ (e^{−t}/t − e^{−zt}/(1 − e^{−t})) dt` for `Re z > 0`, the
  combined integrand absolutely integrable (`digamma_eq_integral`, DLMF 5.9.12) (4.4).

### From ExplicitNumberFields

- 1.1a: DLMF 5.7.6 and 5.15.1 for `Re z > 0`, with `ψ′` the complex derivative of
  `Complex.digamma`: `ψ(z) = −γ + Σ_{n≥0} (1/(n + 1) − 1/(n + z))` and `ψ′(z) = Σ_{n≥0} 1/(n + z)²`,
  converging absolutely and uniformly on every set `{Re z ≥ a₀, |z| ≤ R}` with `a₀ > 0` (1.3, 2.1,
  2.3, 3.2).

### From Tau Ceti

- `TauCeti/Analysis/SpecialFunctions/Beta.lean`: `TauCeti.integral_rpow_mul_one_sub_rpow`,
  `TauCeti.integral_rpow_mul_one_add_rpow` (Layer 5).
- `TauCeti/Analysis/SpecialFunctions/Gamma/`, which implements parts of the roadmap items above:
  `Complex.digamma_eq_gaussSeries` and `Complex.summable_gaussSeries` (DLMF 5.7.6 for every `z` off
  the poles, extending ExplicitNumberFields 1.1a); `Real.digamma`, `Complex.digamma_ofReal`,
  `Real.digamma_eq_deriv_log_Gamma` and `Complex.isBigO_digamma_ofReal_sub_log` (the real case of
  ZerosOfLFunctions 1.4); `Complex.norm_Gamma_le_Gamma_re` (DLMF 5.6.6 for `x > 0`);
  `Complex.verticalIntegrable_Gamma` and `Complex.mellinInv_Gamma` (AsymptoticExpansions 8.6 and
  8.7); and `Complex.norm_inv_Gamma_le`, a bound on `|1/Γ|` in the whole plane. Where a layer uses
  these, its *Needs:* line names the roadmap item.

### From Mathlib

- `Complex.Gamma`, `Complex.Gamma_eq_integral`, `Complex.Gamma_add_one`,
  `Complex.Gamma_mul_Gamma_one_sub`, `Complex.Gamma_mul_Gamma_add_half`, `Complex.Gamma_conj`,
  `Complex.Gamma_ne_zero`, `Complex.differentiableAt_Gamma`,
  `Complex.differentiable_one_div_Gamma`, `Complex.GammaSeq_tendsto_Gamma`,
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Real.Gamma_nat_add_half`,
  `Real.convexOn_log_Gamma`, `Real.eq_Gamma_of_log_convex`.
- `Complex.digamma`, `Complex.digamma_one`, `Complex.digamma_one_half`,
  `Complex.digamma_apply_add_one`, `Complex.digamma_one_sub`, `Complex.digamma_two_mul`,
  `Complex.digamma_nat_add_one`.
- `Real.eulerMascheroniConstant`, `riemannZeta`, `riemannZeta_two_mul_nat`, `bernoulli`,
  `ascPochhammer`, `descPochhammer`, `Nat.doubleFactorial_two_mul`, `Matrix.vandermonde`,
  `Matrix.det_vandermonde`, `Complex.cot`, `cot_series_rep`, `Complex.tendsto_euler_sin_prod`.
- `integral_rpow_mul_exp_neg_mul_rpow`, `integral_gaussian`, `HasProd`, `iteratedDeriv`,
  `Complex.VerticalIntegrable`, `mellinInv_mellin_eq`, the identity theorem
  (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`), and Phragmén–Lindelöf
  (`PhragmenLindelof.eq_zero_on_quadrant_I` and its siblings).

## How to read the build

Layer 1 needs Mathlib and, for 1.3, the Gauss series of `ψ`. Layer 2 needs the Gauss series of `ψ`
and of `ψ′`. Layer 3 needs 1.2, 2.3, the consumed product formula and the complex Gamma integral.
Layer 4 needs Layers 1 and 2 and the consumed Gamma integral and Gauss's integral. Layer 5 needs
the complex Gamma integral and the consumed Beta integral. Layer 6 needs Layer 5 and the
vertical-strip bounds. Layer 7 needs Layers 2 and 4 and Watson's lemma. Layer 8 needs Layer 5 and
Carlson's theorem, which it proves.

```text
Layer 1 ──► Layer 2 ──► Layer 4      Layer 5 ──► Layer 6
   │           │           │            │
   │           ├─────┬─────┘            └──► Layer 8
   │           │     ▼
   │           │  Layer 7
   │           ▼
   └──────► Layer 3
```

## Layer 1: Pochhammer symbols, special values and functional relations

### 1.1 Pochhammer duplication and Lah numbers

DLMF 5.2.8 and 5.2.9, for every `a, x ∈ ℂ` and `n ∈ ℕ`:
- `(a)_{2n} = 2^{2n} (a/2)ₙ ((a + 1)/2)ₙ` and `(a)_{2n+1} = 2^{2n+1} (a/2)_{n+1} ((a + 1)/2)ₙ`
  (`ascPochhammer_two_mul_eval`);
- `(x)ₙ = Σ_{k=0}^{n} L(n, k) x(x − 1) ⋯ (x − k + 1)` and
  `x(x − 1) ⋯ (x − n + 1) = Σ_{k=0}^{n} (−1)^{n−k} L(n, k) (x)_k`, where the Lah number is
  `L(n, k) = C(n − 1, k − 1) n!/k!` for `1 ≤ k ≤ n`, `L(0, 0) = 1` and `L(n, k) = 0` otherwise
  (`Complex.lah`; `ascPochhammer_eval_eq_sum_lah`, `descPochhammer_eval_eq_sum_lah`).

Route: induction on `n`. For 5.2.9, write `[x]_k = x(x − 1) ⋯ (x − k + 1)`; use the recurrence
`L(n + 1, k) = (n + k) L(n, k) + L(n, k − 1)`, `(x)_{n+1} = (x)ₙ (x + n)` and
`(x + n) [x]_k = [x]_{k+1} + (n + k) [x]_k`.
The second expansion is the first at `−x`, by `ascPochhammer_eval_neg_eq_descPochhammer`.

*Needs:* Mathlib `ascPochhammer`, `descPochhammer`, `Nat.choose`.

**Checks.**
- `n = 2`: `x(x + 1) = L(2,1) x + L(2,2) x(x − 1) = 2x + x(x − 1)`, and
  `x(x − 1) = −2x + x(x + 1)`.
- `L(n, k) = 0` for `k = 0 < n`: with truncated subtraction `C(n − 1, k − 1) n!/k!` would be
  `n!` there, which breaks `n = 1`: `(x)₁ = x`, not `x + 1`.
- 5.2.8 at `a = 1`, `n = 1`: `(1)₂ = 2 = 4 · (½)₁ (1)₁ = 4 · ½ · 1`.

### 1.2 Special values

- 5.4.2: for `n : ℕ`, `n‼ = 2^{n/2} Γ(n/2 + 1)` for even `n` and
  `n‼ = π^{−1/2} 2^{n/2+1/2} Γ(n/2 + 1)` for odd `n` (`doubleFactorial_odd_eq_Gamma`; the even case
  is `Nat.doubleFactorial_two_mul` with `Complex.Gamma_nat_eq_factorial`), from
  `Real.Gamma_nat_add_half` shifted by one.
- 5.4.4: `Γ(½ + iy) Γ(½ − iy) = |Γ(½ + iy)|² = π/cosh πy` for real `y`.
- 5.4.5: `Γ(¼ + iy) Γ(¾ − iy) = π√2/(cosh πy + i sinh πy)` for real `y`.
- 5.4.15: `ψ(n + ½) = −γ − 2 log 2 + 2 Σ_{k=1}^{n} 1/(2k − 1)` for `n : ℕ` (at `n = 0` this is
  `Complex.digamma_one_half`).
- 5.4.16–5.4.18: for real `y`, `Im ψ(iy) = 1/(2y) + (π/2) coth πy` and
  `Im ψ(1 + iy) = −1/(2y) + (π/2) coth πy` for `y ≠ 0`, and `Im ψ(½ + iy) = (π/2) tanh πy`.

5.4.3, `|Γ(iy)| = (π/(y sinh πy))^{1/2}` for real `y ≠ 0`, is SpecialFunctionsParabolicCylinder
6.6(a) `norm_Gamma_one_add_mul_I_sq` divided by `|iy|² = y²`.

Route: 5.4.4–5.4.5 are the reflection formula at `½ + iy`, `¼ + iy`, with `Γ(z̄) = conj Γ(z)`
(`Complex.Gamma_conj`). 5.4.16–5.4.18 are the imaginary parts of the
reflection formula for `ψ` (`Complex.digamma_one_sub`) at `iy`, `½ + iy`, using `ψ(z̄) = conj ψ(z)`
and the recurrence. 5.4.15 is the recurrence from `ψ(½)`.

*Needs:* Mathlib reflection and recurrence for `Γ` and `ψ`, `Complex.Gamma_conj`.
SpecialFunctionsParabolicCylinder 6.6(a) for 5.4.3, which the targets above do not use.

**Checks.**
- 5.4.4 at `y = 0`: `Γ(½)² = π`.
- 5.4.5 at `y = 0`: `Γ(¼) Γ(¾) = π√2`, the reflection formula at `¼`.
- 5.4.17 at `y = 0`: `Im ψ(½) = 0`.
- 5.4.18 is 5.4.16 plus `Im(1/(iy)) = −1/y`.
- 5.4.16 at `y = 1`: `Im ψ(i) = ½ + (π/2) coth π = 2.0767`, and 5.4.18 gives
  `Im ψ(1 + i) = 2.0767 − 1 = 1.0767`.

### 1.3 Gauss's digamma theorem

DLMF 5.4.19: for integers `0 < p < q`,
`ψ(p/q) = −γ − log q − (π/2) cot(πp/q) + ½ Σ_{k=1}^{q−1} cos(2πkp/q) log(2 − 2 cos(2πk/q))`
(`Complex.digamma_rat`).

Route: the Gauss series 5.7.6 at `p/q` and the discrete Fourier expansion of the indicator of the
residue class `p` modulo `q`, with `Σ_{n≥1} ω^{n}/n = −log(1 − ω)` for a `q`-th root of unity
`ω ≠ 1`; the real parts give the logarithms and the imaginary parts the cotangent.

*Needs:* ExplicitNumberFields 1.1a (5.7.6 at `p/q > 0`); Mathlib
`Complex.hasSum_taylorSeries_neg_log` or the Abel-summed logarithm series on the unit circle.

**Checks.**
- `p/q = ½`: `cot(π/2) = 0`, the sum is `½ cos π log 4 = −log 2`, total `−γ − 2 log 2`
  (`Complex.digamma_one_half`).
- `p/q = ⅓` and `⅔`: the cosine sums agree, so the formula gives
  `ψ(⅔) − ψ(⅓) = (π/2)(cot(π/3) − cot(2π/3)) = π/√3`, which is the reflection formula
  `ψ(1 − z) − ψ(z) = π cot πz` at `z = ⅓`.
- `p/q = ⅖`: both sides are `−2.561385`.

### 1.4 Gauss's multiplication formulas

DLMF 5.5.6, 5.5.7 and 5.5.9, for every integer `n ≥ 1`:
- `Γ(z) Γ(z + 1/n) ⋯ Γ(z + (n − 1)/n) = (2π)^{(n−1)/2} n^{1/2 − nz} Γ(nz)` for every `z ∈ ℂ`
  (`Complex.prod_Gamma_add_div`); both sides vanish exactly when `nz ∈ {0, −1, −2, …}`;
- `∏_{k=1}^{n−1} Γ(k/n) = (2π)^{(n−1)/2} n^{−1/2}`, the case `z = 1/n` of the first;
- `ψ(nz) = (1/n) Σ_{k=0}^{n−1} ψ(z + k/n) + log n` for `nz ∉ {0, −1, −2, …}`
  (`Complex.digamma_mul_nat`).

Route: for real `x > 0`, `f(x) = n^x ∏_{k=0}^{n−1} Γ((x + k)/n)` is log-convex and satisfies
`f(x + 1) = x f(x)`, so `f = f(1) Γ` by Bohr–Mollerup (`Real.eq_Gamma_of_log_convex`); put
`x = nz`. The constant `f(1) = n ∏_{k=1}^{n−1} Γ(k/n)` is 5.5.7, which comes from the reflection
formula paired as `Γ(k/n) Γ(1 − k/n) = π/sin(πk/n)` and `∏_{k=1}^{n−1} 2 sin(πk/n) = n`. Extend
to `ℂ` by the identity theorem. 5.5.9 is the logarithmic derivative.

*Needs:* Mathlib `Real.eq_Gamma_of_log_convex`, `Complex.Gamma_mul_Gamma_one_sub`, the identity
theorem.

**Checks.**
- `n = 1`: both sides are `Γ(z)`.
- `n = 2`: the duplication formula `Complex.Gamma_mul_Gamma_add_half`.
- `n = 3`: SpecialFunctionsAiry's `Complex.Gamma_mul_Gamma_add_third`.
- 5.5.9 at `n = 2` is `Complex.digamma_two_mul`.

### Dependencies

Mathlib; ExplicitNumberFields 1.1a.

## Layer 2: series and products

### 2.1 The Maclaurin series of `log Γ(1 + z)` and `ψ(1 + z)`

DLMF 5.7.3–5.7.5, with the branch of `log Γ(1 + z)` removed by exponentiating:
- 5.7.3: for `|z| < 2`, `z ≠ −1`,
  `Γ(1 + z) = (1 + z)⁻¹ exp(z(1 − γ) + Σ_{k≥2} (−1)^k (ζ(k) − 1) z^k/k)`
  (`Complex.Gamma_one_add_eq_exp`), the series converging absolutely;
- 5.7.4: for `|z| < 1`, `ψ(1 + z) = −γ + Σ_{k≥2} (−1)^k ζ(k) z^{k−1}`;
- 5.7.5: for `|z| < 2`, `z ∉ {0, 1, −1}`,
  `ψ(1 + z) = 1/(2z) − (π/2) cot πz + 1/(z² − 1) + 1 − γ − Σ_{k≥1} (ζ(2k + 1) − 1) z^{2k}`.

Route: 5.7.4 from the Gauss series 5.7.6 by expanding `1/(k + z)` geometrically and summing over
`k` first (absolute convergence for `|z| < 1`). For 5.7.3: `ψ(2 + z) = ψ(1 + z) + 1/(1 + z)` has
the series `1 − γ + Σ_{k≥2} (−1)^k (ζ(k) − 1) z^{k−1}`, which converges on `|z| < 2` because
`0 < ζ(k) − 1 ≤ 3 · 2^{−k}`; integrate from `0` and exponentiate, then extend from `|z| < 1` by the
identity theorem. 5.7.5 is the even part of 5.7.4 combined with the reflection formula for `ψ`,
with the same extension to `|z| < 2`.

*Needs:* ExplicitNumberFields 1.1a (5.7.6 on `Re z > 0`); Mathlib `riemannZeta`,
`Complex.digamma_one_sub`.

**Checks.**
- 5.7.3 at `z = 1`: `Σ_{k≥2} (−1)^k (ζ(k) − 1)/k = γ − 1 + log 2`, which with `Γ(2) = 1` is the
  identity `Σ_{k≥2} (−1)^k ζ(k)/k = γ` minus `Σ_{k≥2} (−1)^k/k = 1 − log 2`.
- 5.7.4 at `z = 0`: `ψ(1) = −γ`.
- 5.7.5 at `z = ½`: `cot(π/2) = 0` and `1/(z² − 1) = −4/3`, so 5.7.5 and
  `ψ(3/2) = 2 − γ − 2 log 2` give `Σ_{k≥1} (ζ(2k + 1) − 1) 4^{−k} = 2 log 2 − 4/3 = 0.052961`.
- The restriction of 5.7.3 to `|z| < 1`, rewritten with `log(1 + z) = Σ (−1)^{k+1} z^k/k`, is
  ConformalMappingPartII 5.6.

### 2.2 The reciprocal Gamma series

DLMF 5.7.1–5.7.2: with `c_k = (1/Γ)^{(k)}(0)/k!` (`Complex.invGammaCoeff`), for every `z ∈ ℂ`,
`1/Γ(z) = Σ_{k≥1} c_k z^k`, `c₀ = 0`, `c₁ = 1`, `c₂ = γ`, and for
`k ≥ 3`, `(k − 1) c_k = γ c_{k−1} − ζ(2) c_{k−2} + ζ(3) c_{k−3} − ⋯ + (−1)^k ζ(k − 1) c₁`.

Route: `1/Γ` is entire, so its Taylor series at `0` converges on `ℂ`. Multiply
`z (1/Γ)′(z) = (1/Γ(z)) · (−z ψ(z))` and expand `−zψ(z) = 1 + γz − Σ_{j≥2} (−1)^j ζ(j) z^j` on
`|z| < 1` (2.1); compare coefficients.

*Needs:* Mathlib `Complex.differentiable_one_div_Gamma`; 2.1 (5.7.4).

**Checks.**
- `c₃ = (γ² − ζ(2))/2 = −0.65587`, from the recurrence at `k = 3`.
- `Σ_k c_k = 1/Γ(1) = 1`.

### 2.3 Other series

- 5.7.7: for `z ∉ {0, −1, −2, …}`, `ψ((z + 1)/2) − ψ(z/2) = 2 Σ_{k≥0} (−1)^k/(k + z)`, the series
  converging conditionally, as the limit of its partial sums (`Complex.tendsto_digamma_half_sub`).
- 5.7.8: for real `y`, `Im ψ(1 + iy) = Σ_{k≥1} y/(k² + y²)`.
- 5.15.1: for `z ∉ {0, −1, −2, …}`, `deriv Complex.digamma z = Σ_{k≥0} 1/(k + z)²`
  (`Complex.hasSum_deriv_digamma`).

Route: 5.7.7 and 5.7.8 from 5.7.6; for 5.7.7, pair the terms of the two Gauss series and use that
the even partial sums and the odd partial sums of the alternating series have the same limit.
5.15.1 is ExplicitNumberFields 1.1a on `Re z > 0`; for other `z`, pick `n` with `Re z + n > 0` and
differentiate the recurrence `Complex.digamma_apply_add_nat`, which gives
`ψ′(z) = ψ′(z + n) + Σ_{k<n} 1/(k + z)²`.

*Needs:* ExplicitNumberFields 1.1a; Tau Ceti `Complex.digamma_eq_gaussSeries` (5.7.6 off
`Re z > 0`, for 5.7.7); Mathlib `Complex.digamma_apply_add_nat`.

**Checks.**
- 5.7.7 at `z = 1`: `ψ(1) − ψ(½) = 2 log 2 = 2(1 − ½ + ⅓ − ⋯)`.
- 5.7.8 against 5.4.18 at `y = 1`: `Σ 1/(k² + 1) = −½ + (π/2) coth π = 1.0767`.
- 5.15.1 at `z = 1`: `Σ_{k≥1} 1/k² = π²/6`.
- 5.15.1 at `z = −½`: the recurrence gives `ψ′(−½) = ψ′(½) + 4 = π²/2 + 4`, and the series is
  `4 + Σ_{k≥0} 1/(k + ½)²`.

### 2.4 Infinite products

- 5.8.2: for every `z`, the product `∏_{k≥1} (1 + z/k) e^{−z/k}` converges (as a `HasProd` over
  `k : ℕ` with the factor at `k + 1`) to a value `P` with `1/Γ(z) = z e^{γz} P`
  (`Complex.hasProd_inv_Gamma`); both sides vanish at the poles.
- 5.8.4–5.8.5: for `a, b : Fin m → ℂ` with `Σ a_k = Σ b_k` and no `b_k` in `{0, −1, −2, …}`,
  `∏_{j≥0} ∏_k (a_k + j)/(b_k + j) = ∏_k Γ(b_k) · ∏_k Γ(a_k)⁻¹` as a `HasProd`
  (`Complex.hasProd_balanced`). When some `a_k ∈ {0, −1, −2, …}` both sides are `0`.

Route: 5.8.2 from Euler's limit 5.8.1 and `Σ_{k≤n} 1/k − log n → γ`, with absolute convergence of
`Σ |(1 + z/k)e^{−z/k} − 1|`. 5.8.5 from 5.8.1: the balancing makes the factors `1 + O(1/j²)`, and
the partial products are quotients of `GammaSeq` up to `n^{Σ a_k − Σ b_k} = 1`.

*Needs:* Mathlib `Complex.GammaSeq_tendsto_Gamma`, `HasProd`.

**Checks.**
- 5.8.5 with `m = 2`, `a = (1, 1)`, `b = (½, 3/2)`: `∏ (j+1)²/((j+½)(j+3/2)) = Γ(½)Γ(3/2) = π/2`,
  the Wallis product.
- 5.8.2 at `z = 1`: `∏ (1 + 1/k)e^{−1/k} = e^{−γ}`.

### Dependencies

Layer 1; ExplicitNumberFields 1.1a; Tau Ceti `GaussSeries`.

## Layer 3: inequalities

### 3.1 The inequalities at `x` and `1/x`

DLMF 5.6.2 and 5.6.3: for real `x > 0`, `1/Γ(x) + 1/Γ(1/x) ≤ 2` and
`1/Γ(x)² + 1/Γ(1/x)² ≤ 2`.

Route: 5.6.2 follows from 5.6.3 by the inequality between the arithmetic and quadratic means.
5.6.3 is symmetric under `x ↦ 1/x`, so take `x ≥ 1`. For `x ≥ 2` both terms are at most `1`:
`Γ(x) ≥ 1`, and `Γ(1/x) ≥ Γ(½) > 1` because `Γ` decreases on `(0, 1]`. For `x = 1 + t` with
`0 ≤ t < 1`, write `1/x = 1 − r`; Taylor bounds for `log Γ` at `1`, from `ψ(1) = −γ`,
`ψ′(1) = ζ(2)` and the monotonicity of `ψ′` (both from 5.15.1, 2.3), give
`log Γ(1/x) ≥ γr + ζ(2)r²/2` and `log Γ(x) ≥ −γt + ζ(2)t²/2 − 4t³/9`; with `cosh d ≤ e^{d²/2}`
and `½ < γ < ⅗` the inequality reduces to a polynomial inequality in `t`.

*Needs:* Mathlib `Real.Gamma`, `Real.convexOn_log_Gamma`, `Real.eulerMascheroniConstant`; 2.3.

**Checks.**
- Equality at `x = 1`.
- At `x = 2`: `1/Γ(2) + 1/Γ(½) = 1 + 1/√π = 1.5642 ≤ 2`.

### 3.2 Gautschi's and Kershaw's inequalities

DLMF 5.6.4 and 5.6.5: for real `x > 0` and `0 < s < 1`,
- `x^{1−s} < Γ(x + 1)/Γ(x + s) < (x + 1)^{1−s}`;
- `exp((1 − s) ψ(x + s^{1/2})) ≤ Γ(x + 1)/Γ(x + s) ≤ exp((1 − s) ψ(x + (s + 1)/2))`.

Route: Gautschi is Wendel's argument with the strict log-convexity of `Γ` on `(0, ∞)`:
`Γ(x + s) < Γ(x)^{1−s} Γ(x + 1)^s` and `Γ(x + 1) < Γ(x + s)^s Γ(x + s + 1)^{1−s}`, with
`x + s < x + 1`. Strict convexity follows from `ψ′(x) > 0` (5.15.1, 2.3). Kershaw: for
`c ∈ {s^{1/2}, (s + 1)/2}` the function `x ↦ log Γ(x + 1) − log Γ(x + s) − (1 − s) ψ(x + c)` is
monotone on `(0, ∞)` (its derivative is a series of rational functions of fixed sign, by 5.7.6 and
5.15.1) and tends to `0` as `x → ∞` (by Gautschi's inequality and `ψ(x) − log x → 0`).

*Needs:* Mathlib `Real.convexOn_log_Gamma`; ExplicitNumberFields 1.1a (5.7.6); ZerosOfLFunctions
1.4 (`ψ(x) − log x → 0`); 2.3 (5.15.1).

**Checks.**
- `s → 1`: all four bounds tend to `1`.
- `x = 1`, `s = ½`: `Γ(2)/Γ(3/2) = 2/√π = 1.1284`, between `1` and `√2 = 1.4142`.
- Kershaw at `x = 1`, `s = ½`: `exp(½ ψ(1.7071)) = 1.1130 ≤ 1.1284 ≤ exp(½ ψ(1.75)) = 1.1317`.

### 3.3 Bounds on vertical lines

- DLMF 5.6.6: for real `x ∉ {0, −1, −2, …}` and real `y`, `|Γ(x + iy)| ≤ |Γ(x)|`
  (`Complex.norm_Gamma_add_mul_I_le`).
- DLMF 5.6.7: for real `x ≥ ½` and `y`, `|Γ(x + iy)| ≥ (sech πy)^{1/2} Γ(x)`.

Route: for 5.6.6, every factor `1 + y²/(x + k)²` of the product of SpecialFunctionsParabolicCylinder
6.6(a) is at least `1`, so `Γ(x)²/|Γ(x + iy)|² ≥ 1`. For 5.6.7, the comparison in `x` of 6.6(a)
from `½` to `x`, and 5.4.4.

*Needs:* SpecialFunctionsParabolicCylinder 6.6(a); 1.2.

**Checks.**
- 5.6.6 at `y = 0`: equality.
- 5.6.6 at `x = −½`, `y = 1`: `|Γ(−½ + i)| = 0.46563 ≤ |Γ(−½)| = 2√π = 3.54491`, and the
  product of 6.6(a) is `(3.54491/0.46563)² = 57.960`.
- 5.6.7 at `x = ½`: equality, by 5.4.4.
- 5.6.7 at `y = 0`: equality.

### 3.4 Gamma quotients in the right half-plane

DLMF 5.6.8: for real `a ≥ 0` and `b − a ≥ 1`, and `Re z > 0`,
`|Γ(z + a)/Γ(z + b)| ≤ |z|^{a−b}` (`Complex.norm_Gamma_add_div_Gamma_add_le`).

Route: the Beta integral in the form
`Γ(z + a)/Γ(z + b) = Γ(b − a)⁻¹ ∫₀^∞ e^{−zu} e^{−au} (1 − e^{−u})^{b−a−1} du` (put `t = e^{−u}` in
5.12.1). The kernel continues to `Re u > 0`, where `|e^{−au}| ≤ 1` and
`|(1 − e^{−u})^{b−a−1}| ≤ |u|^{b−a−1}` because `b − a − 1 ≥ 0` and `|1 − e^{−u}| ≤ |u|`. Rotate
the path to the ray `ph u = −ph z` (AsymptoticExpansions 4.3), where `zu = |z| r`, and bound by
`Γ(b − a)⁻¹ ∫₀^∞ e^{−|z|r} r^{b−a−1} dr = |z|^{a−b}`.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`; AsymptoticExpansions 4.1 and 4.3.

**Checks.**
- `a = 0`, `b = 1`, `z = x > 0`: `Γ(x)/Γ(x + 1) = 1/x`, equality.
- The hypothesis `b − a ≥ 1` is needed: at `a = 0`, `b = ½`, `z = x → 0⁺`, the quotient
  `Γ(x)/Γ(x + ½) ∼ 1/(x√π)` exceeds `x^{−1/2}`.

### Dependencies

Layers 1 and 2; ExplicitNumberFields 1.1a; ZerosOfLFunctions 1.4; SpecialFunctionsParabolicCylinder
6.6(a); AsymptoticExpansions 4.1, 4.3.

## Layer 4: integral representations of `Γ` and `ψ`

### 4.1 Real-axis integrals of `Γ`

- 5.9.1: for real `μ > 0`, `Re ν > 0` and `Re z > 0`,
  `∫₀^∞ exp(−z t^μ) t^{ν−1} dt = μ⁻¹ Γ(ν/μ) z^{−ν/μ}`.
- 5.9.3: for real `c > 0` and `Re z > 0`, `∫_ℝ |t|^{2z−1} e^{−ct²} dt = c^{−z} Γ(z)`.
- 5.9.4: for `z ∉ {0, −1, −2, …}`,
  `Γ(z) = ∫₁^∞ t^{z−1} e^{−t} dt + Σ_{k≥0} (−1)^k/((z + k) k!)`.
- 5.9.5 (Cauchy–Saalschütz): for `n : ℕ` and `−n − 1 < Re z < −n`,
  `Γ(z) = ∫₀^∞ t^{z−1} (e^{−t} − Σ_{k=0}^{n} (−t)^k/k!) dt`.
- 5.9.6–5.9.7: `∫₀^R t^{z−1} cos t dt → Γ(z) cos(πz/2)` for `0 < Re z < 1`, and
  `∫₀^R t^{z−1} sin t dt → π/(2 Γ(1 − z) cos(πz/2))` for `−1 < Re z < 1`, as `R → ∞`. The second is
  DLMF's `Γ(z) sin(πz/2)` with the removable singularity at `z = 0` written out: by reflection the
  two agree for `z ≠ 0`, and at `z = 0` the integral is `π/2`, whereas Mathlib's `Γ(0) = 0`.
- 5.9.8–5.9.9: for `n ≥ 2`, `∫₀^R cos(tⁿ) dt → Γ(1 + 1/n) cos(π/(2n))` and
  `∫₀^R sin(tⁿ) dt → Γ(1 + 1/n) sin(π/(2n))`.

Route: 5.9.1 from AsymptoticExpansions 4.1 by `u = t^μ`. 5.9.3 is 5.9.1 with `μ = 2` on each half
line. 5.9.4 splits 5.2.1 at `1` and expands `e^{−t}` on `[0, 1]`; both sides are holomorphic off
the poles. 5.9.5 by repeated integration by parts in the strip, continued from `n = −1` (which is
5.2.1). 5.9.6–5.9.7 by rotating `∫₀^∞ t^{z−1} e^{−st} dt = Γ(z) s^{−z}` to `s → ∓i` (Abel's limit
on the imaginary axis). 5.9.8–5.9.9 are 5.9.6–5.9.7 at `z = 1/n` after `u = tⁿ`.

*Needs:* AsymptoticExpansions 4.1; Mathlib `Complex.Gamma_eq_integral`.

**Checks.**
- 5.9.1 at `μ = 1`: 4.1 of AsymptoticExpansions.
- 5.9.3 at `z = ½`, `c = 1`: `∫ e^{−t²} = √π`.
- 5.9.7 at `z = 0`: the Dirichlet integral `∫₀^∞ sin t/t dt = π/2`.
- 5.9.8 at `n = 2`: the Fresnel integral `√(π/8)`.

### 4.2 Hankel's loop integral

DLMF 5.9.2, with the contour pinned: for every `z ∈ ℂ` and every `ε > 0`,

```text
1/Γ(z) = (sin πz/π) ∫_ε^∞ e^{−r} r^{−z} dr + (ε^{1−z}/2π) ∫_{−π}^{π} exp(ε e^{iθ} + i(1 − z)θ) dθ
```

(`Complex.inv_Gamma_eq_hankel`). This is DLMF's `(2πi)⁻¹ ∫_{−∞}^{(0+)} e^t t^{−z} dt` on the
contour that runs along the lower side of the negative axis (`ph t = −π`) from `−∞` to `−ε`,
around `|t| = ε` counterclockwise, and back along the upper side (`ph t = π`), with `t^{−z}`
principal on the positive axis and continuous along the path.

Route: both sides are entire in `z`; for `0 < Re z < 1` let `ε → 0`, where the circle term tends to
`0` and the ray term to `sin(πz)/π · Γ(1 − z)`, which is `1/Γ(z)` by reflection. Independence of
`ε` is Cauchy's theorem on the annular sector between two radii.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_one_sub`, `Complex.Gamma_eq_integral`, Cauchy's theorem
(`Complex.integral_boundary_rect_eq_zero_of_differentiableOn` in the variable `log t`), the identity
theorem.

**Checks.**
- `z = 1`: `sin π = 0` and `(1/2π) ∫ exp(εe^{iθ}) dθ = 1`, the mean value of `exp` on the circle.
- `z = 0`: `(ε/2π) ∫ exp(εe^{iθ} + iθ) dθ = 0`, matching `1/Γ(0) = 0`.

### 4.3 Temme's integral

DLMF 5.9.2_5: for `Re z > 0`,
`1/Γ(z) = (e^z z^{1−z}/2π) ∫_{−π}^{π} e^{−zΦ(t)} dt`, `Φ(t) = 1 − t cot t + log(t/sin t)`
(`Complex.inv_Gamma_eq_temme`); `Φ(0) = 0` and `Φ` is real-analytic and nonnegative on `(−π, π)`.

Route: 4.2 with the loop replaced by the steepest-descent path through the saddle `t = z` of
`e^t t^{−z}`. For real `z = x > 0` that path is `t = x (θ/sin θ) e^{iθ}`, `θ ∈ (−π, π)`, on which
`e^t t^{−x} = e^x x^{−x} e^{−xΦ(θ)}`; extend to `Re z > 0` by the identity theorem.

*Needs:* 4.2.

**Checks.**
- `z = 1`: `(e/2π) ∫ e^{−Φ(t)} dt = 1`.
- Laplace's method at `t = 0`, where `Φ(t) = t²/2 + O(t⁴)`, gives `1/Γ(x) ∼ e^x x^{½−x}/√(2π)`,
  Stirling's formula.

### 4.4 Integrals of `ψ`, `γ` and the derivatives of `Γ`

For `Re z > 0` (5.9.12 is AnalyticNumberTheoryPartI's `digamma_eq_integral`):
- 5.9.13: `ψ(z) = log z + ∫₀^∞ (1/t − 1/(1 − e^{−t})) e^{−tz} dt`;
- 5.9.14: `ψ(z) = ∫₀^∞ (e^{−t} − (1 + t)^{−z}) dt/t`;
- 5.9.15: `ψ(z) = log z − 1/(2z) − 2 ∫₀^∞ t dt/((t² + z²)(e^{2πt} − 1))`;
- 5.9.16: `ψ(z) + γ = ∫₀^∞ (e^{−t} − e^{−zt})/(1 − e^{−t}) dt = ∫₀¹ (1 − t^{z−1})/(1 − t) dt`;
- 5.9.19: for `n : ℕ`, `Γ⁽ⁿ⁾(z) = ∫₀^∞ (log t)ⁿ e^{−t} t^{z−1} dt`;
- 5.9.20: for `Re c > 0`, `∫ Γ` along the segment from `c` to `z` equals
  `∫₀^∞ (t^{z−1} − t^{c−1}) e^{−t}/log t dt`;

and the four integrals of 5.9.18 for `γ`:

```text
γ = −∫₀^∞ e^{−t} log t dt = ∫₀^∞ (1/(1 + t) − e^{−t}) dt/t
  = ∫₀¹ (1 − e^{−t}) dt/t − ∫₁^∞ e^{−t} dt/t = ∫₀^∞ (e^{−t}/(1 − e^{−t}) − e^{−t}/t) dt
```

Route: 5.9.13 is 5.9.12 minus the Frullani-type identity
`log z = ∫₀^∞ (e^{−t} − e^{−zt}) dt/t` (AsymptoticExpansions 4.1 integrated in `z`). 5.9.14 and
5.9.16 are 5.9.12 after `e^{−t} = 1/(1 + u)` and `e^{−t} = u`. 5.9.15 is 5.9.13 together with
`1/(e^u − 1) − 1/u + ½ = 2 ∫₀^∞ sin(ut)/(e^{2πt} − 1) dt` (the sine integral of the auxiliary
table, from the partial-fraction expansion of `coth` via Mathlib's cotangent series) and
`∫₀^∞ e^{−zu} sin(tu) du = t/(t² + z²)`, by Fubini. 5.9.19 by differentiating 5.2.1 under the
integral. 5.9.20 by integrating 5.2.1 in `z` and Fubini. 5.9.18 is 5.9.19 at `n = 1`, `z = 1`,
with `Γ′(1) = −γ`, and 5.9.12–5.9.16 at `z = 1`.

*Needs:* AnalyticNumberTheoryPartI §1.8a; AsymptoticExpansions 4.1; Mathlib
`Real.eulerMascheroniConstant_eq_neg_deriv`, the cotangent partial fractions `cot_series_rep`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**
- 5.9.16 at `z = 1`: both integrals vanish and `ψ(1) + γ = 0`.
- 5.9.16 at `z = 2`: `∫₀¹ (1 − t)/(1 − t) dt = 1 = ψ(2) + γ`.
- 5.9.19 at `n = 0` is 5.2.1.
- 5.9.15 at `z = 1`: `∫₀^∞ t dt/((t² + 1)(e^{2πt} − 1)) = (γ − ½)/2 = 0.038608`; the integral is
  positive, as `γ > ½` requires.

### Dependencies

Layers 1 and 2; AsymptoticExpansions 4.1; AnalyticNumberTheoryPartI §1.8a.

## Layer 5: the Beta function

### 5.1 Real-variable Beta integrals

For `Re a > 0`, `Re b > 0` unless stated:
- 5.12.2: `∫₀^{π/2} sin^{2a−1}θ cos^{2b−1}θ dθ = ½ Γ(a)Γ(b)/Γ(a + b)`;
- 5.12.4: for `z ∈ slitPlane`,
  `∫₀¹ t^{a−1}(1 − t)^{b−1}/(t + z)^{a+b} dt = (Γ(a)Γ(b)/Γ(a + b)) (1 + z)^{−a} z^{−b}`;
- 5.12.5: for `Re a > 0` and every `b`,
  `∫₀^{π/2} cos^{a−1}t cos(bt) dt = π Γ(a)/(2^a Γ((a + b + 1)/2) Γ((a − b + 1)/2))`;
- 5.12.6: for `Re a > 0` and every `b`,
  `∫₀^π sin^{a−1}t e^{ibt} dt = π e^{iπb/2} Γ(a)/(2^{a−1} Γ((a + b + 1)/2) Γ((a − b + 1)/2))`;
- 5.12.7: for `Re a > |Re b|`, `∫₀^∞ cosh(2bt)/cosh^{2a}t dt = 4^{a−1} Γ(a + b)Γ(a − b)/Γ(2a)`.

DLMF prints 5.12.5–5.12.6 with `1/(a B(½(a + b + 1), ½(a − b + 1)))`, which equals
`Γ(a)/(Γ((a + b + 1)/2) Γ((a − b + 1)/2))` because the two arguments sum to `a + 1`; the reciprocal
form holds for every `b`.

Route: 5.12.2 by `t = sin²θ` in 5.12.1. 5.12.4 by the Möbius substitution
`t ↦ (1 + z)t/(t + z)` for `z > 0`, then holomorphy in `z`. 5.12.5–5.12.6 for real `b` with
`|b| < Re a + 1` from the Beta integral on the contour `t ↦ e^{2it}` (Cauchy on the half disk), then
for all `b` by the identity theorem: the left sides are entire in `b`. 5.12.7 by `u = e^{−2t}` in
5.12.3.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`; SpecialFunctionsHypergeometric 6.3
(5.12.3 for complex parameters).

**Checks.**
- 5.12.4 at `a = b = 1`: `∫₀¹ dt/(t + z)² = 1/(z(1 + z))`.
- 5.12.5 at `(a, b) = (1, 0)`: `π/2`; 5.12.6 at `(1, 0)`: `π`.
- 5.12.5 at `a = 1`, `b = 3`: `∫₀^{π/2} cos 3t dt = −⅓`, and the right side is
  `π/(2 Γ(5/2) Γ(−½)) = π/(2 · (3√π/4)(−2√π)) = −⅓`.
- 5.12.7 at `a = 1`, `b = 0`: `∫ sech² = 1`.

### 5.2 The vertical-line Beta integrals

- 5.12.8: for `Re w > 0`, `Re z > 0` and `Re(a + b) > 1`,
  `(2π)⁻¹ ∫_ℝ (w + it)^{−a} (z − it)^{−b} dt = Γ(a + b − 1) (w + z)^{1−a−b} Γ(a)⁻¹ Γ(b)⁻¹`;
- 5.12.9: for `0 < c < 1` and `Re(a + b) > 0`,
  `(2π)⁻¹ ∫_ℝ (c + iy)^{−a} (1 − c − iy)^{−1−b} dy = Γ(a + b) Γ(a)⁻¹ Γ(1 + b)⁻¹`.

All powers are principal; their bases have positive real part. DLMF prints the right sides as
`(w + z)^{1−a−b}/((a + b − 1) B(a, b))` and `1/(b B(a, b))`; the forms above hold for all `a`, `b` in
the stated ranges, including the poles of `Γ(a)`, `Γ(b)`.

Route: for 5.12.8, the complex Gamma integral (AsymptoticExpansions 4.1) at `w + it` gives
`(w + it)^{−a} = Γ(a)⁻¹ ∫₀^∞ u^{a−1} e^{−(w+it)u} du` for `Re a > 0`; Fourier inversion in `t` and
5.12.1, then continuation in `a`, `b`. 5.12.9 is 5.12.8 after the Möbius change of variable
`t ↦ t/(t − 1)` on the line, or directly the Mellin inversion of 5.12.3.

*Needs:* AsymptoticExpansions 4.1; 5.1; Mathlib `mellinInv_mellin_eq`.

**Checks.**
- 5.12.8 at `a = b = 1`: `(2π)⁻¹ ∫ dt/((w + it)(z − it)) = 1/(w + z)`.
- 5.12.9 at `a = 1`: `1` for every `b`; at `(a, b) = (2, 1)`: `2`.

### 5.3 Loop contours

DLMF 5.12.10–5.12.12 with the contours pinned:
- 5.12.10: for `Re a > 0`, every `b` and `0 < ε < 1`,

  ```text
  (2πi)⁻¹ [(e^{−iπ(b−1)} − e^{iπ(b−1)}) ∫₀^{1−ε} t^{a−1}(1 − t)^{b−1} dt
           + i ε^b ∫_{−π}^{π} (1 + εe^{iθ})^{a−1} e^{ibθ} dθ] = Γ(a) Γ(a + b)⁻¹ Γ(1 − b)⁻¹
  ```

  This is DLMF's `(2πi)⁻¹ ∫₀^{(1+)} t^{a−1}(t − 1)^{b−1} dt` on the path from `0` along `(0, 1 − ε]`
  with `ph(t − 1) = −π`, around `|t − 1| = ε` counterclockwise, and back with `ph(t − 1) = π`; the
  right side is `(sin πb/π) B(a, b)` off the poles.
- 5.12.11: for `Re b > 0`, `a ∉ {0, −1, −2, …}` and `0 < ε < 1`,

  ```text
  (e^{2πia} − 1) ∫_ε^∞ t^{a−1}(1 + t)^{−a−b} dt + i ε^a ∫₀^{2π} e^{iaθ}(1 + εe^{iθ})^{−a−b} dθ
    = (e^{2πia} − 1) Γ(a)Γ(b)/Γ(a + b)
  ```

  This is DLMF's `∫_∞^{(0+)} t^{a−1}(1 + t)^{−a−b} dt` on the path from `+∞` to `ε` with `ph t = 0`,
  around `|t| = ε` counterclockwise, and back to `+∞` with `ph t = 2π`, multiplied out by
  `e^{2πia} − 1`, so that it also holds at the positive integers.
- 5.12.12: for all `a`, `b` and `0 < ε < ½`, with `f(t) = t^{a−1}(1 − t)^{b−1}` and

  ```text
  C₁ = −i ε^b ∫₀^{2π} (1 − εe^{iφ})^{a−1} e^{ibφ} dφ,
  C₀ = i ε^a ∫₀^{2π} e^{iaθ}(1 − εe^{iθ})^{b−1} dθ,
  (1 − e^{2πia})(1 − e^{2πib}) ∫_ε^{1−ε} f + (1 − e^{2πia}) C₁ − (1 − e^{2πib}) C₀
    = −4π² e^{πi(a+b)} Γ(1 − a)⁻¹ Γ(1 − b)⁻¹ Γ(a + b)⁻¹
  ```

  This is the Pochhammer integral `∫_P^{(1+, 0+, 1−, 0−)} t^{a−1}(1 − t)^{b−1} dt`, with the four
  passes along `[ε, 1 − ε]` collected and the four circles reduced to `C₀`, `C₁`; it does not depend
  on `P`, and the right side is `−4 e^{πi(a+b)} sin πa sin πb B(a, b)` off the poles.

Route: in each case, for `Re a`, `Re b` large enough let `ε → 0`: the circles vanish and the
segments give the Beta integral times the monodromy factors; independence of `ε` is Cauchy's
theorem; both sides are entire in the parameters (meromorphic with the stated exclusions), so the
identity theorem extends the formula.

*Needs:* 5.1; Mathlib `Complex.Gamma_mul_Gamma_one_sub`, the identity theorem.

**Checks.**
- 5.12.10 at `b = 1`: the factor `e^{0} − e^{0} = 0`, the circle term
  `(2πi)⁻¹ iε ∫ (1 + εe^{iθ})^{a−1} e^{iθ} dθ` is `0` by Cauchy, and `Γ(1 − 1)⁻¹ = 0`.
- 5.12.10 at `a = 1`, `b = ½`: the right side is `Γ(1)/(Γ(3/2)Γ(½)) = 2/π`.
- 5.12.11 at `a = 1`: both sides are `0`.
- 5.12.12 at `a = b = ½`: the right side is `−4π² e^{πi}/(π · 1) = 4π`.

### Dependencies

AsymptoticExpansions 4.1; SpecialFunctionsHypergeometric 6.3.

## Layer 6: Barnes-type integrals

### 6.1 Barnes's Beta integral

DLMF 5.13.1: for `Re(a + b) > 0`, `−Re a < c < Re b` and `z ∈ slitPlane`,
`(2π)⁻¹ ∫_ℝ Γ(c + iy + a) Γ(b − c − iy) z^{−c−iy} dy = Γ(a + b) z^a (1 + z)^{−a−b}`
(`Complex.integral_Gamma_mul_Gamma_mul_cpow`).

Route: for `z = u > 0` this is SpecialFunctionsHypergeometric 6.3's Mellin–Barnes integral of
`(1 + u)^{−a−b}` after `s ↦ s + a`. Both sides are holomorphic in `z` on the slit plane, the
integrand being `O((1 + |y|)^K e^{−(π − |ph z|)|y|})` by AsymptoticExpansions 8.6; the identity
theorem.

*Needs:* SpecialFunctionsHypergeometric 6.3; AsymptoticExpansions 8.6.

**Checks.**
- `a = b = ½`, `c = 0`, `z = 1`: `(2π)⁻¹ ∫ |Γ(½ + iy)|² dy = (2π)⁻¹ ∫ π/cosh πy dy = ½`, and the
  right side is `Γ(1) · ½ = ½`.

### 6.2 The modulus integral

DLMF 5.13.2: for real `a > 0` and `0 < b < π`,
`(2π)⁻¹ ∫_ℝ |Γ(a + it)|² e^{(2b−π)t} dt = Γ(2a)/(2 sin b)^{2a}`.

Route: 5.13.1 with `a = b`, `c = 0` and `z = e^{i(2b−π)}`, where `|ph z| < π`, and
`z^a (1 + z)^{−2a} = (2 cos(b − π/2))^{−2a}`.

*Needs:* 6.1.

**Checks.**
- `b = π/2`, `a = ½`: `(2π)⁻¹ ∫ π/cosh πt dt = ½ = Γ(1)/2`.

### 6.3 Ramanujan's integral

DLMF 5.13.4: for `Re(a + b + c + d) > 3`,

```text
∫_ℝ Γ(a + t)⁻¹ Γ(b + t)⁻¹ Γ(c − t)⁻¹ Γ(d − t)⁻¹ dt
  = Γ(a + b + c + d − 3) Γ(a + c − 1)⁻¹ Γ(a + d − 1)⁻¹ Γ(b + c − 1)⁻¹ Γ(b + d − 1)⁻¹,
```

the integrand being integrable on the real line (`Complex.integral_inv_Gamma_four`).

Route: for real `a, b, c, d`, the Fourier transform of `t ↦ 1/(Γ(a + t)Γ(c − t))` is supported in
`[−π, π]` and equals `(2 cos(x/2))^{a+c−2} e^{ix(c−a)/2}/Γ(a + c − 1)` there; Parseval and 5.12.6
give 5.13.4. Continue to complex parameters one at a time by the identity theorem. Integrability
uses `|Γ(a + t)/Γ(b + t)| ∼ t^{Re(a−b)}` (ZerosOfLFunctions 1.2) and the reflection formula for the
factors `Γ(c − t)⁻¹`, `Γ(d − t)⁻¹`.

*Needs:* 5.1; ZerosOfLFunctions 1.2; Mathlib Fourier inversion and Plancherel.

**Checks.**
- `a = b = c = d = 1`: `∫ dt/(Γ(1 + t)²Γ(1 − t)²) = ∫ (sin πt/(πt))² dt = 1`, and the right side is
  `Γ(1)/Γ(1)⁴ = 1`.

### 6.4 The de Branges–Wilson integral

DLMF 5.13.5: for `a : Fin 4 → ℂ` with `Re a_k > 0` (`Complex.integral_deBrangesWilson`),

```text
(4π)⁻¹ ∫_ℝ ∏_k Γ(a_k + it) Γ(a_k − it) · Γ(2it)⁻¹ Γ(−2it)⁻¹ dt
  = ∏_{j<k} Γ(a_j + a_k) · Γ(a₁ + a₂ + a₃ + a₄)⁻¹.
```

Route: by Barnes-type contour arguments that reduce the integral to Barnes's first lemma 5.13.3
(SpecialFunctionsHypergeometric 6.3); see Andrews, Askey and Roy, *Special Functions*, Chapter 3.
Integrability: `|Γ(2it)Γ(−2it)|⁻¹ = 2|t| sinh(2π|t|)/π` by reflection, against the decay of the
eight Gamma factors (AsymptoticExpansions 8.6).

*Needs:* SpecialFunctionsHypergeometric 6.3; AsymptoticExpansions 8.6.

**Checks.**
- `a = (½, ½, ½, ½)`: the right side is `Γ(1)⁶/Γ(2) = 1`; the left side is
  `π² ∫_ℝ t sinh πt/cosh³ πt dt = π² · (1/2π) ∫_ℝ sech² πt dt = 1`, by `|Γ(½ + it)|² = π/cosh πt`
  (5.4.4) and one integration by parts.
- The integrand at `t = 0` is the junk quotient by `Γ(0)² = 0`; the point is null.

### Dependencies

Layer 5; SpecialFunctionsHypergeometric 6.3; ZerosOfLFunctions 1.2; AsymptoticExpansions 8.6.

## Layer 7: polygamma functions

### 7.1 Definition

`Complex.polygamma n z = iteratedDeriv n Complex.digamma z`. Prove that it is holomorphic on
`ℂ \ {0, −1, −2, …}`, that `polygamma 0 = digamma`, that `deriv (polygamma n) = polygamma (n + 1)`
off the poles, and that `polygamma n x` is real for real `x > 0`.

*Needs:* Mathlib `Complex.digamma`, `Complex.differentiableAt_Gamma`, `iteratedDeriv`.

**Checks.**
- `polygamma 0 1 = −γ`.
- At a pole `z = −k`, `polygamma n z` is Lean's junk value; no theorem uses it.

### 7.2 Values and functional relations

- 5.15.1 for `polygamma 1`: `polygamma 1 = deriv Complex.digamma`, so 2.3 is 5.15.1.
- 5.15.2–5.15.3: for `n ≥ 1`, `ψ⁽ⁿ⁾(1) = (−1)^{n+1} n! ζ(n + 1)` and
  `ψ⁽ⁿ⁾(½) = (−1)^{n+1} n! (2^{n+1} − 1) ζ(n + 1)`; in particular the `ψ′` values of 5.4.12–5.4.13,
  `ψ′(1) = π²/6` and `ψ′(½) = π²/2`.
- 5.15.4: for `n ≥ 1`, `ψ′(n − ½) = π²/2 − 4 Σ_{k=1}^{n−1} 1/(2k − 1)²`.
- 5.15.5: for `z ∉ {0, −1, −2, …}`, `ψ⁽ⁿ⁾(z + 1) = ψ⁽ⁿ⁾(z) + (−1)ⁿ n! z^{−n−1}`.
- 5.15.6: for `z ∉ ℤ`, `ψ⁽ⁿ⁾(1 − z) + (−1)^{n+1} ψ⁽ⁿ⁾(z) = (−1)ⁿ π dⁿ/dzⁿ cot(πz)`, DLMF's sign
  `(−1)^{n−1}` written with the exponent `n + 1`.
- 5.15.7: for `n ≥ 1`, `m ≥ 1` and `mz ∉ {0, −1, −2, …}`,
  `ψ⁽ⁿ⁾(mz) = m^{−n−1} Σ_{k=0}^{m−1} ψ⁽ⁿ⁾(z + k/m)`.

Route: `ψ⁽ⁿ⁾(z) = (−1)^{n+1} n! Σ_{k≥0} (k + z)^{−n−1}` for `n ≥ 1` by differentiating 2.3
termwise (locally uniform convergence); 5.15.2–5.15.4 from this series
and `riemannZeta` on the integers `≥ 2`. 5.15.5–5.15.7 by differentiating 5.5.2, 5.5.4 and 5.5.9.

*Needs:* 7.1; 2.3; Mathlib `riemannZeta_two`,
`Complex.digamma_one_sub`; 1.4.

**Checks.**
- 5.15.4 at `n = 1`: `ψ′(½) = π²/2`, the empty sum.
- 5.15.6 at `n = 0`: `ψ(1 − z) − ψ(z) = π cot πz`, Mathlib's `Complex.digamma_one_sub`. The sign
  is `−1`; DLMF's `(−1)^{n−1}` with truncated subtraction in `ℕ` would give `+1` there.
- 5.15.7 at `m = 2`, `n = 1`, `z = ½`: `ψ′(1) = ¼(ψ′(½) + ψ′(1))`, i.e. `3ψ′(1) = ψ′(½)`.

### 7.3 Asymptotic expansions

DLMF 5.15.8–5.15.9: for `0 < δ < π` and `n ≥ 1`, as `z → ∞` in `|ph z| ≤ π − δ`,
`ψ⁽ⁿ⁾(z) ∼ (−1)^{n−1} ((n − 1)!/zⁿ + n!/(2z^{n+1}) + Σ_{k≥1} ((2k + n − 1)!/(2k)!) B_{2k}/z^{2k+n})`
(`Complex.hasAsymptoticExpansion_polygamma`); 5.15.8 is the case `n = 1`. In the form of the
conventions: for every `N`, the difference between `ψ⁽ⁿ⁾(z)` and the terms up to `k = N` is
`O(|z|^{−2N−n−2})` along `cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π − δ}`
(`isBigO_polygamma_sub_partialSum` in `Suggested.lean`).

Route: the Laplace representation `ψ⁽ⁿ⁾(z) = (−1)^{n+1} ∫₀^∞ tⁿ e^{−zt}/(1 − e^{−t}) dt` for
`Re z > 0` (auxiliary; from 7.2's series and `∫₀^∞ tⁿ e^{−(k+z)t} dt = n!/(k + z)^{n+1}`).
The function `q(t) = tⁿ/(1 − e^{−t})` is holomorphic in `|ph t| < π/2`, with the Maclaurin expansion
`t^{n−1} Σ_k B_k⁺ t^k/k!` (`B₁⁺ = ½`) at `0` and `q(t) = O(|t|ⁿ)` at `∞` in every closed
subsector. Watson's lemma (AsymptoticExpansions 4.2) gives the expansion in `|ph z| ≤ π/2 − δ`, and
the rotation of the path (AsymptoticExpansions 4.3) through `|θ| < π/2` extends it to
`|ph z| ≤ π − δ`.

*Needs:* 7.2; AsymptoticExpansions 4.1–4.3; Mathlib `bernoulli`.

**Checks.**
- `n = 1`, `z = 10`, terms up to `k = 2`: `ψ′(10) = 0.1051663356817` and
  `1/10 + 1/200 + 1/6000 − 1/300000 = 0.1051663333333`; the difference `2.35 · 10⁻⁹` is close to
  the next term `B₆/10⁷ = 1/(42 · 10⁷) = 2.38 · 10⁻⁹`.
- The sector cannot reach the negative axis: `ψ′` has poles at `−k`.

### 7.4 Series of trigamma values

DLMF 5.16.1–5.16.2:
- `Σ_{k≥1} (−1)^k ψ′(k) = −π²/8`, as the limit of the partial sums;
- `Σ_{k≥1} ψ′(k + 1)/k = ζ(3)` (absolutely convergent), and `ζ(3) = −½ ψ″(1)`.

Route: 5.15.1 and an exchange of summation. For 5.16.1, the even and odd partial sums have closed
forms in `Σ 1/(2j + 1)²`, whose sum is `π²/8`.

*Needs:* 7.2.

**Checks.**
- `−½ ψ″(1) = ζ(3)` is 5.15.2 at `n = 2`.
- The first terms of 5.16.1: `−ψ′(1) + ψ′(2) = −1`.

### Dependencies

Layers 2 and 4; AsymptoticExpansions 4.1–4.3.

## Layer 8: multidimensional integrals

### 8.1 Carlson's and Landau's theorems

Auxiliary:
- **Carlson's theorem.** Let `f` be holomorphic on `{Re z > 0}` and continuous on `{Re z ≥ 0}`,
  with `|f(z)| ≤ C e^{τ|z|}` there for some `τ`, and `|f(iy)| ≤ C e^{c|y|}` for real `y`, with
  `c < π`. If `f(n) = 0` for every `n : ℕ`, then `f = 0` on `{Re z ≥ 0}`
  (`Complex.eq_zero_of_carlson`).
- **Landau's theorem.** Let `w ≥ 0` and `g > 0` be measurable on a measure space, let
  `F(s) = ∫ w g^s` converge for real `s` in an interval `(s₀, s₁)`, and suppose `F` continues
  holomorphically from `(s₀, s₁)` to a neighbourhood of `[s₀′, s₁)` with `s₀′ < s₀`. Then
  `∫ w g^s` converges for `s ∈ (s₀′, s₁)` and equals the continuation there. (The proof expands
  `F` in a power series at a point of `(s₀, s₁)`; the coefficients are integrals of `w g^s (log g)^k`
  with constant sign, which allows monotone convergence.) With `g = e^{−t}` this is the theorem
  that a Laplace–Stieltjes integral with monotone determining function is singular at the real
  point of its axis of convergence (Widder, *The Laplace Transform*, Chapter II, §5, Theorem 5b,
  p. 58).

SpecialFunctionsHypergeometric 4.2 owns the periodic case of Carlson's theorem, which is all 8.3
uses; the general theorem is needed for Dyson's integral (8.5), whose normalized integral is not
periodic in `b`.

Route: Carlson by dividing `f` by `sin πz` and Phragmén–Lindelöf in the quadrants
(`PhragmenLindelof.eq_zero_on_quadrant_I` and its siblings), following the classical proof
(Titchmarsh, *The Theory of Functions*, §5.81).

*Needs:* Mathlib Phragmén–Lindelöf, `Complex.sin`, the identity theorem.

**Checks.**
- `f(z) = sin πz` vanishes on `ℕ` and has type exactly `π` on the imaginary axis; it shows `c < π`
  is necessary.

### 8.2 Dirichlet's integrals

DLMF 5.14.1–5.14.2: for `z : Fin n → ℂ` with `Re z_k > 0`,
`∫_{V_n} ∏_k t_k^{z_k−1} dt = ∏_k Γ(z_k) / Γ(1 + Σ_k z_k)`, and for `z : Fin (n + 1) → ℂ` with
`Re z_k > 0`, `∫_{V_n} (1 − Σ_k t_k)^{z_n − 1} ∏_{k<n} t_k^{z_k−1} dt = ∏_k Γ(z_k) / Γ(Σ_k z_k)`
(`TauCeti.integral_simplex_dirichlet`).

Route: induction on `n` with Fubini and 5.12.1; 5.14.1 is 5.14.2 with `z_{n} = 1`.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`, Fubini on `Fin n → ℝ`
(`MeasureTheory.measurePreserving_piFinSuccAbove`).

**Checks.**
- `n = 1`: 5.14.2 is 5.12.1; 5.14.1 is `∫₀¹ t^{z−1} dt = 1/z`.
- `z = 1` everywhere in 5.14.1: the volume of `V_n` is `1/n!`.

### 8.3 Selberg's and Aomoto's integrals

DLMF 5.14.3–5.14.4: for `n ≥ 1`, `0 ≤ m ≤ n`, `Re a > 0`, `Re b > 0` and
`Re c > −min(1/n, Re a/(n − 1), Re b/(n − 1))`, stated as `1 + n Re c > 0`,
`Re a + (n − 1) Re c > 0` and `Re b + (n − 1) Re c > 0` so that `n = 1` needs no division by `0`,

```text
∫_{[0,1]ⁿ} t₁ ⋯ t_m |Δ(t)|^{2c} ∏_k t_k^{a−1} (1 − t_k)^{b−1} dt
  = Γ(1 + c)^{−n} ∏_{k=1}^{m} (a + (n − k)c)/(a + b + (2n − k − 1)c)
      · ∏_{k=1}^{n} Γ(a + (n − k)c) Γ(b + (n − k)c) Γ(1 + kc)/Γ(a + b + (2n − k − 1)c),
```

with the integrand integrable (`TauCeti.integral_selberg_aomoto`); `m = 0` is Selberg's integral.

Route: Aomoto's recurrence in `m` by integration by parts in one coordinate, which reduces 5.14.4 to
`m = 0` and gives the shift `a ↦ a + 1` of Selberg's integral; for `Re c ≥ ½`, the ratio of the two
sides is `1`-periodic in `a`, bounded as Carlson's theorem requires (by 8.2 and the Gamma bounds of
AsymptoticExpansions 8.6), and `1` at large integers by the dimension recursion
`(a + nc) S_{n+1}(a, 1, c) = S_n(a, 1 + 2c, c)`, so it is `1` by the periodic Carlson lemma
(SpecialFunctionsHypergeometric 4.2). Holomorphy in `c` extends to
`Re c > 0`, and Landau's theorem (8.1), applied in the real parameter `Re c` to the positive integrand,
extends integrability and the formula to the full range.

*Needs:* 8.1 (Landau), 8.2; Layer 5; SpecialFunctionsHypergeometric 4.2; AsymptoticExpansions
8.6; ZerosOfLFunctions 1.3; Mathlib `Matrix.det_vandermonde`.

**Checks.**
- `n = 1`: Euler's Beta integral 5.12.1 (and `m = 1` gives `B(a + 1, b)`).
- `c = 0`: the product of `n` Beta integrals.
- `n = 2`, `a = b = 1`, `c = 1`: `∫∫ (t₁ − t₂)² = 1/6`, and the right side is
  `Γ(2)⁻² · Γ(2)Γ(2)Γ(2)/Γ(4) · Γ(1)Γ(1)Γ(3)/Γ(3) = 1/6`.
- At `n = 2`, `a = b = 1`, the range `Re c > −½` is sharp: `∫∫ |t₁ − t₂|^{2c}` diverges at `c = −½`.

### 8.4 The Laguerre and Hermite limits

DLMF 5.14.5–5.14.6:
- for `Re a > 0` and `Re c > −min(1/n, Re a/(n − 1))` (`TauCeti.integral_selberg_laguerre`),

  ```text
  ∫_{[0,∞)ⁿ} t₁ ⋯ t_m |Δ(t)|^{2c} ∏_k t_k^{a−1} e^{−t_k} dt
    = ∏_{k=1}^{m} (a + (n − k)c) · ∏_{k=1}^{n} Γ(a + (n − k)c) Γ(1 + kc) / Γ(1 + c)ⁿ;
  ```

- for `Re c > −1/n`, `(2π)^{−n/2} ∫_{ℝⁿ} |Δ(t)|^{2c} ∏_k e^{−t_k²/2} dt = ∏_{k=1}^{n} Γ(1 + kc)/Γ(1 + c)ⁿ`
  (`TauCeti.integral_selberg_hermite`).

Route: 5.14.5 is the limit `b → ∞` of 5.14.4 after `t ↦ t/b`, by dominated convergence and
`Γ(b + x)/Γ(b + y) ∼ b^{x−y}`; 5.14.6 is the limit `a = b → ∞` of 5.14.4 after
`t ↦ ½ + t/(2√(2a))`, likewise. Integrability on the full ranges by Landau's theorem as in 8.3.

*Needs:* 8.1, 8.3; ZerosOfLFunctions 1.2 (Gamma quotients).

**Checks.**
- 5.14.6 at `n = 2`, `c = 1`: `(2π)⁻¹ ∫∫ (t₁ − t₂)² e^{−(t₁²+t₂²)/2} = 2 = Γ(2)Γ(3)/Γ(2)²`.
- 5.14.5 at `n = 1`, `m = 1`: `∫₀^∞ t^{a} e^{−t} dt = a Γ(a)`, and the right side is
  `a · Γ(a) Γ(1 + c)/Γ(1 + c)`.

### 8.5 Dyson's integral

DLMF 5.14.7: for `Re b > −1/n`,
`(2π)^{−n} ∫_{[−π,π]ⁿ} ∏_{j<k} |e^{iθ_j} − e^{iθ_k}|^{2b} dθ = Γ(1 + bn)/Γ(1 + b)ⁿ`
(`TauCeti.integral_dyson`).

Route: for `b ∈ ℕ` the integral is the constant term of `∏_{j≠k} (1 − x_j/x_k)^b`, which is the
multinomial coefficient `(nb)!/(b!)ⁿ` by Good's proof of Dyson's conjecture (Lagrange
interpolation gives the recursion of the constant terms). Extend to `Re b ≥ 0` by Carlson's
theorem (8.1) applied to the left side multiplied by `Γ(1 + b)ⁿ/Γ(1 + bn)` after the
normalization that makes its type on the imaginary axis less than `π`, as in Andrews, Askey and
Roy, Chapter 8; then to `Re b > −1/n` by Landau's theorem.

*Needs:* 8.1; Mathlib `MvPolynomial` or Laurent polynomials for the constant term.

**Checks.**
- `n = 2`, `b = 1`: `(2π)⁻² ∫∫ |e^{iθ₁} − e^{iθ₂}|² = 2 = Γ(3)/Γ(2)²`.
- `n = 1`: both sides are `1`.

### Dependencies

Layer 5; SpecialFunctionsHypergeometric 4.2; AsymptoticExpansions 8.6; ZerosOfLFunctions 1.2,
1.3.

## Downstream consumers

Later roadmaps that need Gauss's multiplication formula for every `n` (1.4), the Beta integrals and
loop contours (Layer 5) or polygamma values (Layer 7) cite those sections.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of DLMF Chapter 5. It is recorded only to
fix the boundary. Contributors should not attempt it under this roadmap.

- **Graphics** (DLMF §5.3).
- **Decimal values and extrema** (DLMF 5.4.7–5.4.10, 5.4.20): numerical constants and the
  asymptotic location of the extrema of `Γ` on the negative axis.
- **Explicit Stirling theory**: the bounds 5.6.1 and 5.6.9, Binet's formulas 5.9.10–5.9.10_2,
  the formulas 5.9.11_1–5.9.11_2 for `Γ*`, and all of §5.11 (Stirling's series, its
  remainders, and the asymptotics of Gamma quotients). These rest on the periodic Bernoulli
  remainder of the Euler–Maclaurin formula.
- **Mellin–Barnes integrals with `ζ`** (DLMF 5.9.11, 5.9.17).
- **The continued fraction** for Binet's function (DLMF §5.10).
- **The Barnes `G`-function** (DLMF §5.17).
- **The `q`-Gamma and `q`-Beta functions** (DLMF §5.18), which belong with the basic hypergeometric
  functions of DLMF Chapter 17.
- **Applications and computation** (DLMF §§5.19–5.21).
- **Sections with nothing to formalize**: the notation of §5.1.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directories
`DLMF/Gamma/` and `DLMF/Selberg/` provide source material for Layers 1–8: Pochhammer identities,
the special values and Gauss's digamma theorem, the multiplication formulas, the inequalities
(5.6.8 is stated there without proof), the Maclaurin series (5.7.5 on `|z| < 1` only), the products,
the integral representations (5.9.2 is not stated there), the Beta integrals (5.12.10–5.12.12 are
not stated there), the Barnes-type integrals (5.13.5 is stated without proof), the polygamma
functions, and the Dirichlet, Selberg, Aomoto, Mehta and Dyson integrals.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Gamma/Pochhammer`, `Gamma/SpecialValues`, `Gamma/GaussDigamma`, `Gamma/Multiplication` |
| 2 | `Gamma/SeriesExpansions`, `Gamma/Basic` (`one_div_Gamma_eq_tprod`), `Gamma/Products` |
| 3 | `Gamma/Inequalities` |
| 4 | `Gamma/IntegralRepresentations/HankelAndGaussian`, `PrymAndOscillatory`, `FrullaniAndMoments` |
| 5 | `Gamma/BetaFunction/ParameterIntegrals`, `Cosine`, `Vertical` |
| 6 | `Gamma/Integrals/BarnesAndRamanujan`, `Gamma/Integrals/FourierAndTrigamma` |
| 7 | `Gamma/Polygamma`, `Gamma/Integrals/FourierAndTrigamma` |
| 8 | `Gamma/Multidimensional/SelbergLimits`, `Gamma/Multidimensional/Dyson`, `Selberg/IntegrationByParts`, `Selberg/DimensionAndParameters`, `Selberg/ContinuationAndAomoto` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 5
  (R. A. Askey and R. Roy), <https://dlmf.nist.gov/5>. Every equation number refers to this
  release.
- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapters 1, 3 and 8.
- D. V. Widder, *The Laplace Transform*, Princeton University Press, 1941 (second printing 1946),
  Chapter II, §5.
- E. C. Titchmarsh, *The Theory of Functions*, 2nd ed., Oxford University Press, 1939.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapter 3.
- R. B. Paris and D. Kaminski, *Asymptotics and Mellin–Barnes Integrals*, Cambridge University
  Press, 2001.

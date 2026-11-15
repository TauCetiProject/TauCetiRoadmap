# Roadmap: the Gamma and Beta functions

**Summary.** This roadmap builds the classical theory of Euler's Gamma function `Γ`, the Beta
function, the psi function `ψ = Γ′/Γ` and the polygamma functions `ψ⁽ⁿ⁾` as a library, on top of
what Mathlib has: `Γ` (`Complex.Gamma`) with Euler's integral, Euler's limit, the recurrence,
reflection and duplication formulas, the Beta integral and the Bohr–Mollerup theorem, and `ψ`
(`Complex.digamma`) with its recurrence, reflection and duplication. Its organization follows the
structure of the subject rather than any one text. The partial-fraction series of `ψ`, read off
from the product for `1/Γ`, comes first, because almost everything about `ψ` and `ψ⁽ⁿ⁾` follows
from it. Then come the Beta integral and its multidimensional extensions of Dirichlet and
Liouville, and the transforms of Euler's integral that give the integral representations of `Γ`,
`ψ` and `γ` and the asymptotics of `ψ⁽ⁿ⁾`. The uniqueness theorems of Wielandt and of the limit
type, the multiplication formulas and the special values follow, then the series that `ψ` sums,
the Taylor expansions at the origin and the inequalities. The contour integrals come last: Hankel's
loop and the loop forms of the Beta integral, the Mellin–Barnes integrals along vertical lines, and
the Selberg-type integrals. The content is drawn from Andrews–Askey–Roy (*Special Functions*,
Chs. 1–3 and 8), Remmert (*Classical Topics in Complex Function Theory*, Ch. 2), Whittaker–Watson
(Ch. XII), Temme (*Special Functions*, Ch. 3), Olver (*Asymptotics and Special Functions*, Ch. 2),
Lebedev (*Special Functions and Their Applications*, Ch. 1), Beals–Wong (*Special Functions*,
Ch. 2), Forrester (*Log-Gases and Random Matrices*, Ch. 4), Duverney (*An Introduction to
Hypergeometric Functions*, Ch. 2), Paris–Kaminski (*Asymptotics and Mellin–Barnes Integrals*,
§3.3) and the NIST *Digital Library of Mathematical Functions* (DLMF), and each headline cites its
sources; see [References](#references).

The roadmap covers:
- the poles and residues of `Γ` and `ψ`, Gauss's partial-fraction series of `ψ` and `ψ′` off the
  poles, the polygamma functions with their series, recurrence, reflection, multiplication and
  values at the integers and half-integers (Layer 1);
- the trigonometric, hyperbolic and algebraic forms of the Beta integral, and the integrals of
  Dirichlet and Liouville over simplices and power simplices (Layer 2);
- the scaled, split and subtracted forms of Euler's integral, its oscillatory forms, the integral
  representations of `ψ`, `γ` and the derivatives of `Γ`, and the Laplace representation and
  sector asymptotics of `ψ⁽ⁿ⁾` (Layer 3);
- Wielandt's uniqueness theorem and the limit characterization of `Γ`, Gauss's multiplication
  formulas, Pochhammer duplication and the Lah numbers, the values on vertical lines, Gauss's
  digamma theorem and Kummer's Fourier series of `log Γ` (Layer 4);
- the series of rational functions that `ψ` sums, the alternating and imaginary-axis series, the
  series of trigamma values, and the balanced infinite products (Layer 5);
- the Taylor series of `log Γ(1 + z)`, `ψ(1 + z)` and `1/Γ` at the origin (Layer 6);
- the inequalities at `x` and `1/x`, those of Gautschi and Kershaw, and the bounds on vertical
  lines and for Gamma quotients (Layer 7);
- Hankel's loop integral, Temme's integral, and the loop and Pochhammer contours of the Beta
  integral, with every contour written out (Layer 8);
- the vertical-line Beta integrals, Barnes's Beta integral, the modulus integral, Ramanujan's
  integral and the de Branges–Wilson integral (Layer 9);
- Carlson's and Landau's theorems, and the integrals of Selberg, Aomoto, Mehta and Dyson on their
  full ranges of parameters (Layer 10).

The roadmap rests on Mathlib and Tau Ceti, on five roadmaps on main and on ExplicitNumberFields.
It consumes Stirling's formula on sectors and on vertical strips and the asymptotics of `ψ` from
[ZerosOfLFunctions](../ZerosOfLFunctions/README.md); the complex Gamma integral, Watson's lemma in
a sector, the rotation of the path and the Gamma bound on vertical strips from
[AsymptoticExpansions](../AsymptoticExpansions/README.md); the Mellin–Barnes integral of
`(1 + u)^{−a}`, the half-line Beta integral for complex parameters, Barnes's first lemma and the
periodic Carlson lemma from
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md);
the product for `Γ(x)²/|Γ(x + iy)|²`, its comparison in `x` and the value of `|Γ(1 + iy)|²` from
[SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md); Gauss's
integral for `ψ` from [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md); and the
series of `ψ` and `ψ′` on `Re z > 0` from ExplicitNumberFields 1.1a.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Gamma/`, beside
`TauCeti/Analysis/SpecialFunctions/Gamma.lean`, and `TauCeti/Analysis/SpecialFunctions/Beta.lean`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Poles, partial fractions and the derivatives of `ψ`** (1.1–1.5).
2. **The Beta integral on real paths and in several variables** (2.1–2.3).
3. **Transforms of Euler's integral** (3.1–3.5).
4. **Uniqueness, multiplication and closed-form values** (4.1–4.6).
5. **Series summed by `ψ`, and balanced products** (5.1–5.4).
6. **Taylor expansions at the origin** (6.1–6.2).
7. **Convexity and inequalities** (7.1–7.4).
8. **Loop contours** (8.1–8.3).
9. **Integrals along vertical lines and along the real line** (9.1–9.4).
10. **Selberg-type integrals** (10.1–10.4).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

**Inputs.** Cases of the targets that Mathlib or Tau Ceti already proves are inputs, not targets:
- Euler's integral, `ψ = Γ′/Γ` and Euler's constant (DLMF 5.2.1–5.2.3):
  `Complex.Gamma_eq_integral`, the definition `Complex.digamma = logDeriv Gamma`, and
  `Real.eulerMascheroniConstant`;
- the Pochhammer symbols and their relations to `Γ` and to the falling factorial
  (DLMF 5.2.4–5.2.7): `ascPochhammer`, `Complex.Gamma_add_nat_div_Gamma_eq`,
  `ascPochhammer_eval_neg_eq_descPochhammer`, `descPochhammer_eval_eq_ascPochhammer`,
  `descPochhammer_eval_eq_descFactorial`, `ascPochhammer_eval_neg_natCast_of_lt`;
- the values `Γ(n + 1) = n!`, `Γ(½) = √π`, the double factorial and `Γ(n + 3/2)`, `Γ′(1) = −γ`,
  and `ψ(1)`, `ψ(½)`, `ψ(n + 1)` (DLMF 5.4.1, 5.4.2, 5.4.6, 5.4.11–5.4.14):
  `Complex.Gamma_nat_eq_factorial`, `Real.Gamma_one_half_eq`, `Nat.doubleFactorial_two_mul`,
  `Real.Gamma_nat_add_one_add_half`, `Real.eulerMascheroniConstant_eq_neg_deriv`,
  `Complex.digamma_one`, `Complex.digamma_one_half`, `Complex.digamma_nat_add_one`;
- `|Γ(iy)|² = π/(y sinh πy)` (DLMF 5.4.3), which is SpecialFunctionsParabolicCylinder 6.6(a)
  divided by `|iy|² = y²`;
- the recurrence, reflection and duplication formulas for `Γ` and `ψ` (DLMF 5.5.1–5.5.5, 5.5.8):
  `Complex.Gamma_add_one`, `Complex.digamma_apply_add_one`, `Complex.Gamma_mul_Gamma_one_sub`,
  `Complex.digamma_one_sub`, `Complex.Gamma_mul_Gamma_add_half`, `Complex.digamma_two_mul`;
- Euler's limit (DLMF 5.8.1): `Complex.GammaSeq_tendsto_Gamma`; the Bohr–Mollerup theorem:
  `Real.eq_Gamma_of_log_convex`; the residue of `Γ` at `0`:
  `Complex.tendsto_self_mul_Gamma_nhds_zero`;
- the series of `ψ` and `ψ′` for `Re z > 0` (ExplicitNumberFields 1.1a);
- the scaled Gamma integral for real `ν > 0`, `z > 0` (DLMF 5.9.1):
  `integral_rpow_mul_exp_neg_mul_rpow`; the two-sided integral at `c = 1` for real `z > 0`
  (DLMF 5.9.3): Tau Ceti's `TauCeti.integral_abs_rpow_mul_exp_neg_abs_rpow` at `p = 2`,
  `q = 2z − 1`; the Dirichlet integral `∫₀^∞ sin t/t dt = π/2` (DLMF 5.9.7 at `z = 0`): Tau Ceti's
  `TauCeti.Contour.tendsto_integral_sin_div_atTop`;
- Euler's Beta integral (DLMF 5.12.1): `Complex.Gamma_mul_Gamma_eq_betaIntegral`, and Tau Ceti's
  `TauCeti.integral_rpow_mul_one_sub_rpow` for real parameters; the half-line Beta integral for
  real parameters (DLMF 5.12.3): Tau Ceti's `TauCeti.integral_rpow_mul_one_add_rpow`;
- `γ = −∫₀^∞ e^{−t} log t dt` (the first equality of DLMF 5.9.18):
  `Real.eulerMascheroniConstant_eq_neg_integral_log`; and `Γ⁽ⁿ⁾` under the integral for `n ≤ 1`
  (DLMF 5.9.19): `Complex.Gamma_eq_integral`, `Complex.hasDerivAt_Gamma_of_re_pos`.

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
nor the consumed roadmaps provide:
- the polygamma functions `Complex.polygamma n = iteratedDeriv n Complex.digamma`, their
  holomorphy off the poles and their reality on the positive axis (1.3);
- the Maclaurin coefficients `c_k` of `1/Γ` (`Complex.invGammaCoeff`, 6.2);
- the sine integral `∫₀^∞ sin(at)/(e^{2πt} − 1) dt = ¼ coth(a/2) − 1/(2a)` for `a > 0` (3.3);
- the Laplace representation `ψ⁽ⁿ⁾(z) = (−1)ⁿ⁺¹ ∫₀^∞ tⁿ e^{−zt}/(1 − e^{−t}) dt` for `n ≥ 1`,
  `Re z > 0` (3.5);
- Carlson's theorem, whose periodic case is SpecialFunctionsHypergeometric 4.2, and Landau's
  theorem for integrals of nonnegative functions against `x^s` (10.1);
- the Selberg integrand, its integrability on the full parameter range, and Aomoto's recurrence
  (10.2).

**What it does not own:**
- Stirling's formula on sectors, the holomorphic `log Γ` there, the Gamma function on vertical
  strips and the asymptotics and reality of `ψ` (ZerosOfLFunctions 1.1–1.4), and the complex
  Gamma integral, Watson's lemma in a sector, the rotation of the path and the Gamma bound on
  vertical strips (AsymptoticExpansions 4.1–4.3 and 8.6); it consumes them.
- The Mellin–Barnes integral of `(1 + u)^{−a}` for `u > 0`, the half-line Beta integral for
  complex parameters (DLMF 5.12.3) and Barnes's first lemma (DLMF 5.13.3)
  (SpecialFunctionsHypergeometric 6.3); it consumes them.
- The product `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)²/|Γ(x + iy)|²` (DLMF 5.8.3), its comparison in
  `x` and `|Γ(1 + iy)|² = πy/sinh πy` (SpecialFunctionsParabolicCylinder 6.6(a)); it consumes them.
- The series of `ψ` and `ψ′` on `Re z > 0` (ExplicitNumberFields 1.1a); it consumes them, and 1.2
  extends both to every `z ∉ {0, −1, −2, …}` by the recurrence.
- The periodic Carlson lemma (SpecialFunctionsHypergeometric 4.2); it consumes it, and 10.1 proves
  the general theorem, which Dyson's integral (10.4) needs.
- Gauss's integral for `ψ` (DLMF 5.9.12; AnalyticNumberTheoryPartI §1.8a); it consumes it.
- The Maclaurin series of `log Γ(1 + z)` on `|z| < 1` in the form
  `−γz + Σ_{k≥2} (−1)^k ζ(k) z^k/k` (ConformalMappingPartII 5.6) and Gauss's triplication formula,
  the case `n = 3` of the multiplication formula (SpecialFunctionsAiry 7.1). These are owned there;
  6.1 and 4.2 here prove the general statements independently.
- The explicit Stirling theory: Stirling's series with its remainder and the enveloping property
  on the positive axis, the explicit bounds that it gives on the positive axis and on vertical
  lines, and Binet's formulas (ExplicitZetaBounds 1.1–1.2, 2.4 and 2.5).
- The Barnes `G`-function (AnalyticNumberTheoryPartII §4.3).
- The Weierstrass product for `1/Γ` (GlobalHolomorphicFunctions 6.1).
- The topics listed under the last section.

RandomMatrices 5.2–5.3 prove the Gaussian, Laguerre and Jacobi normalizations at `c = β/2` for
`β ∈ {1, 2}` through matrix models, as part of their eigenvalue-density theorems; 10.2–10.3 here
give the same constants for every `β > 0`.

**The boundary in one sentence:** this roadmap owns the identities, expansions, inequalities and
integral evaluations of `Γ`, `B`, `ψ` and `ψ⁽ⁿ⁾` stated in the layers, through elementary
functions, `ζ`, the Bernoulli numbers and the Pochhammer symbols, except Stirling's series and
everything that rests on its remainder, the continued fraction for Binet's function, the Barnes
`G`-function, the `q`-analogues and the arithmetic analogues (Gauss sums, `p`-adic Gamma).

## Conventions

- **Gamma and its reciprocal.** `Γ` is Mathlib's `Complex.Gamma`, which is `0` at the poles
  `0, −1, −2, …`, and `Real.Gamma` on the real line (`Complex.Gamma_ofReal`). The reciprocal
  `1/Γ(z)` is `(Gamma z)⁻¹`, which is entire under this convention
  (`Complex.differentiable_one_div_Gamma`). A `Γ` in a denominator is written as the factor
  `(Gamma ·)⁻¹`, so a formula with `Γ` only in denominators holds for all parameters; a `Γ` in a
  numerator carries the hypothesis that its argument is not a pole. Where a source prints a
  quotient that is entire after cancellation, the target is the form with reciprocal Gamma
  factors, and the layer says so.
- **The Beta function.** `B(a, b)` is written `Γ(a) Γ(b) / Γ(a + b)`, or in a reciprocal form, and
  not as Mathlib's `Complex.betaIntegral`, which is the integral `∫₀¹` and has Lean's value of a
  divergent integral when `Re a ≤ 0` or `Re b ≤ 0`. For real parameters Mathlib's
  `ProbabilityTheory.beta` is the same quotient.
- **Psi and polygamma.** `ψ` is `Complex.digamma = logDeriv Gamma`; at the poles of `Γ` it is
  Lean's junk value of a logarithmic derivative, and every theorem about `ψ` at a point carries the
  hypothesis that the point is not a pole. `ψ⁽ⁿ⁾` is `Complex.polygamma n`, defined as
  `iteratedDeriv n Complex.digamma`, so `ψ⁽⁰⁾ = ψ`. For real `x > 0`, `ψ(x)` is
  `Complex.digamma x`, a real number (ZerosOfLFunctions 1.4); a real inequality in `ψ` is stated
  with `(Complex.digamma x).re`.
- **Euler's constant** `γ` is `Real.eulerMascheroniConstant`; `ζ` is `riemannZeta`; Bernoulli
  numbers are Mathlib's `bernoulli` (with `B₁ = −½`; only even indices occur here).
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`, and the falling factorial
  `x(x − 1) ⋯ (x − n + 1)` is `(descPochhammer ℂ n).eval x`.
- **Powers** are principal (`Complex.cpow`) unless the layer pins another branch. A positive real
  base `x^s` is `(x : ℂ) ^ s`. The phase condition `|ph z| < π` is `z ∈ slitPlane`, and
  `|ph z| ≤ π − δ` is `|Complex.arg z| ≤ π − δ`.
- **Series and products.** An absolutely convergent series is a `HasSum`, an infinite product is a
  `HasProd`. A conditionally convergent series (4.6, 5.2, 5.3) is the limit of its partial sums
  `Σ_{k<N}` as `N → ∞`.
- **Integrals.** An absolutely convergent integral is a Lebesgue integral over the stated set, with
  integrability part of the target. A conditionally convergent integral at `∞` (3.2) is the limit
  of `∫₀^R` as `R → ∞`. A vertical-line integral `(2πi)⁻¹ ∫_{c−i∞}^{c+i∞} f(s) ds` is
  `(2π)⁻¹ ∫_ℝ f(c + iy) dy`, with `y ↦ f(c + iy)` integrable.
- **Contours.** The sources fix the loop contours of Hankel's integral and of the loop forms of
  the Beta integral (8.1, 8.3) by figures and words. This roadmap writes each one as a sum of
  segment, ray and circle integrals with every branch stated, depending on a radius `ε`; the
  target holds for every admissible `ε`, which also shows that the value does not depend on `ε`.
- **Asymptotic expansions.** `f(z) ∼ Σ_k a_k φ_k(z)` as `z → ∞` in `|ph z| ≤ π − δ` means that for
  every `N` the remainder after `N` terms is `O(φ_N)` along the filter
  `cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π − δ}` (the helper `sectorFilter δ`). This is the
  asymptotic-expansion predicate of AsymptoticExpansions 1.1 with that filter.
- **Multidimensional integrals** are over `Fin n → ℝ` with the product measure. The simplex is
  `V_n = {t | ∀ k, 0 ≤ t k} ∩ {t | Σ_k t k ≤ 1}`. The difference product
  `Δ(t₁, …, tₙ) = ∏_{j<k} (t_j − t_k)` enters the Selberg-type integrals (Layer 10) only through
  `|Δ|`, which is `|(Matrix.vandermonde t).det|` (`Matrix.det_vandermonde`; the helper
  `absVandermonde t`). The power `|Δ|^{2c}` for complex `c` is `((|Δ| : ℝ) : ℂ) ^ (2c)`, whose
  value on the null set `Δ = 0` does not matter.
- **Names.** New functions and theorems live in `Complex` and `Real` beside Mathlib's
  `Complex.Gamma`, `Complex.digamma` and `Real.Gamma` (`Complex.polygamma`,
  `Complex.invGammaCoeff`, `Complex.lah`), and the multidimensional integrals in the root
  namespace of Tau Ceti. Names in the layers are suggestions.

## Exact supplier contracts

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- 1.1–1.2: the holomorphic `log Γ` on sectors and Stirling's formula
  `log Γ(s) = (s − ½) Log s − s + ½ log 2π + O(1/|s|)` uniformly on `|arg s| < π − δ`, `|s| > 1`.
  Used for the quotients `Γ(t + a)/Γ(t + b) ∼ t^{a−b}` with complex `a`, `b` as `t → +∞` on the
  real line (9.3, 10.3).
- 1.3: `log |Γ(σ + it)| = (σ − ½) log|t| − π|t|/2 + ½ log 2π + O(1/|t|)` uniformly for `σ` in a
  compact interval, which bounds `|Γ|` and `|1/Γ|` on vertical strips (10.2).
- 1.4: for real `x > 0`, `ψ(x)` is real and `(Complex.digamma x).re = deriv (log ∘ Real.Gamma) x`,
  and `ψ(s) = log s + O(1/|s|)` on sectors (7.2).

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- 1.1 and 1.3: the asymptotic-expansion predicate and the asymptotic scale `z ↦ z^{−n}` along a
  sector filter (3.5).
- 4.1: `∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}` for `Re s > 0`, `Re z > 0` (3.1, 3.2, 3.3, 3.5,
  7.4, 9.1).
- 4.2: Watson's lemma in `|ph z| ≤ π/2 − δ` (3.5).
- 4.3: the rotation of the path of a Laplace integral and the continuation of its expansion to
  the rotated sector (3.5, and the rotated Beta integral of 7.4).
- 8.6: `|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` on a vertical strip away from the poles, and
  vertical integrability (`Complex.VerticalIntegrable`) of `Γ` times `e^{θ|y|}` with `θ < π/2` on
  every line `Re z = x` off the poles (9.2, 9.4, 10.2).

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- 6.3: the Mellin–Barnes integral of `(1 + u)^{−a}`: for `0 < σ′ < Re a` and `u > 0`,
  `Γ(a) (1 + u)^{−a} = (2π)⁻¹ ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy`; the Beta integral
  `∫₀^∞ t^{s−1} (1 + t)^{−a} dt = Γ(s) Γ(a − s)/Γ(a)` for `0 < Re s < Re a` (DLMF 5.12.3); and
  Barnes's first lemma (DLMF 5.13.3) (2.1, 9.2, 9.4).
- 4.2: the periodic Carlson lemma: a `1`-periodic function holomorphic on a neighbourhood of
  `Re w ≥ 0`, bounded by `C (1 + |Im w|)^K e^{σ|Im w|}` with `σ < π` on `0 ≤ Re w ≤ 1` and vanishing
  at `0`, vanishes on `Re w ≥ 0` (10.2).

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- 6.6(a): for real `x ∉ {0, −1, −2, …}`, `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)²/|Γ(x + iy)|²`
  (DLMF 5.8.3), and its comparison in `x`: `|Γ(x + iy)| ≤ Γ(x)/Γ(x′) · |Γ(x′ + iy)|` for
  `0 < x ≤ x′` (7.3); and `|Γ(1 + iy)|² = πy/sinh πy` for `y ≠ 0` (the input DLMF 5.4.3).

### From [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md)

- §1.8a: Gauss's integral `ψ(z) = ∫₀^∞ (e^{−t}/t − e^{−zt}/(1 − e^{−t})) dt` for `Re z > 0`, the
  combined integrand absolutely integrable (DLMF 5.9.12) (3.3).

### From ExplicitNumberFields

- 1.1a: for `Re z > 0`, with `ψ′` the complex derivative of `Complex.digamma`,
  `ψ(z) = −γ + Σ_{n≥0} (1/(n + 1) − 1/(n + z))` and `ψ′(z) = Σ_{n≥0} 1/(n + z)²` (DLMF 5.7.6,
  5.15.1), converging absolutely and uniformly on every set `{Re z ≥ a₀, |z| ≤ R}` with `a₀ > 0`
  (1.2).

### From Tau Ceti

- `TauCeti/Analysis/SpecialFunctions/Beta.lean`: `TauCeti.integral_rpow_mul_one_sub_rpow`,
  `TauCeti.integral_rpow_mul_one_add_rpow` (Layer 2).
- `TauCeti/MeasureTheory/Integral/Gamma.lean`: `TauCeti.integral_abs_rpow_mul_exp_neg_abs_rpow`
  (an input of 3.1).
- `TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`:
  `TauCeti.Contour.tendsto_integral_sin_div_atTop` (an input of 3.2).

### From Mathlib

- `Complex.Gamma`, `Complex.Gamma_eq_integral`, `Complex.Gamma_nat_eq_factorial`,
  `Complex.Gamma_add_one`, `Complex.Gamma_mul_Gamma_one_sub`, `Complex.Gamma_mul_Gamma_add_half`,
  `Complex.Gamma_conj`, `Complex.Gamma_ne_zero`, `Complex.differentiableAt_Gamma`,
  `Complex.differentiable_one_div_Gamma`, `Complex.GammaSeq_tendsto_Gamma`,
  `Complex.tendsto_self_mul_Gamma_nhds_zero`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
  `Real.Gamma_nat_add_half`, `Real.Gamma_nat_add_one_add_half`,
  `Complex.hasDerivAt_Gamma_of_re_pos`, `Real.convexOn_log_Gamma`, `Real.eq_Gamma_of_log_convex`.
- `Complex.digamma`, `Complex.digamma_one`, `Complex.digamma_one_half`,
  `Complex.digamma_apply_add_one`, `Complex.digamma_one_sub`, `Complex.digamma_two_mul`,
  `Complex.digamma_nat_add_one`, `Complex.digamma_apply_add_nat`.
- `Real.eulerMascheroniConstant`, `Real.eulerMascheroniConstant_eq_neg_integral_log`,
  `riemannZeta`, `riemannZeta_two`, `bernoulli`, `ascPochhammer`, `descPochhammer`,
  `Nat.doubleFactorial_two_mul`, `Matrix.vandermonde`, `Matrix.det_vandermonde`, `Complex.cot`,
  `cot_series_rep`.
- `integral_rpow_mul_exp_neg_mul_rpow`, `HasProd`, `iteratedDeriv`,
  `Complex.VerticalIntegrable`, `mellinInv_mellin_eq`, the identity theorem
  (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`), Liouville's theorem
  (`Differentiable.apply_eq_apply_of_bounded`), and Phragmén–Lindelöf
  (`PhragmenLindelof.eq_zero_on_quadrant_I` and its siblings).

## How to read the build

Layer 1 differentiates the product for `1/Γ` logarithmically: Gauss's series of `ψ` and `ψ′`, and
the polygamma functions with their series, which give the recurrence, the reflection, the
multiplication formula and the values at integers and half-integers of `ψ⁽ⁿ⁾`. Layer 2 takes
Euler's Beta identity from Mathlib and changes variables: the trigonometric and hyperbolic forms,
and by induction on the dimension Dirichlet's and Liouville's integrals. Layer 3 transforms
Euler's integral in the same way: scaling, splitting, subtracting Taylor polynomials, rotating to
oscillatory integrals, and integrating in the parameter, which gives the integrals of `ψ` and `γ`;
the Laplace representation of `ψ⁽ⁿ⁾` and Watson's lemma give its sector asymptotics. Layer 4 uses
the functional equation: Wielandt's theorem and the limit characterization, which single out `Γ`
among its solutions, the multiplication formulas, the values on vertical lines, Gauss's theorem on
`ψ(p/q)` and Kummer's Fourier series. Layer 5 sums series with the partial fractions of Layer 1,
and Layer 6 expands at the origin with them. Layer 7 combines Layers 1 and 4 with log-convexity
into the inequalities. Layers 8–10 are contour integrals: the loops around the branch points (8),
the vertical lines of the Mellin–Barnes integrals and Ramanujan's real-line integral (9), and the
`n`-dimensional Beta integrals of Selberg type, continued in their parameters by Carlson's and
Landau's theorems (10). The `**Checks.**` and `### Examples` of each layer are statements to
prove; they test the conventions on explicit values.

```text
Layer 1 ──┬──► Layer 3 ──► Layer 4 ──┬──► Layer 5
          │                          ├──► Layer 6
          │                          └──► Layer 7
          │
Layer 2 ──┼──► Layer 8 ──► Layer 9
          └──────────────────────────► Layer 10
```

## Layer 1: poles, partial fractions and the derivatives of `ψ`

### 1.1 Poles and residues of `Γ` and `ψ`

For every `n : ℕ` (`Complex.tendsto_add_nat_mul_Gamma`, `Complex.tendsto_add_nat_mul_digamma`):
- `(z + n) Γ(z) → (−1)ⁿ/n!` as `z → −n`, `z ≠ −n`: `Γ` has a simple pole of residue `(−1)ⁿ/n!` at
  `−n` (Olver, Ch. 2, §1.2, p. 32; Remmert, Ch. 2, §2.1, (2), p. 39; Temme, §3.2.1, p. 44;
  Andrews–Askey–Roy, (1.1.19), p. 7);
- `(z + n) ψ(z) → −1` as `z → −n`, `z ≠ −n`: `ψ` has a simple pole of residue `−1` at `−n`
  (Olver, Ch. 2, §2.1, p. 39).

Route: `(z + n) Γ(z) = Γ(z + n + 1)/(z(z + 1) ⋯ (z + n − 1))` by the recurrence, and the right side
is continuous at `−n` with the value `Γ(1)/((−n)(−n + 1) ⋯ (−1))`. For `ψ`, the recurrence
`ψ(z) = ψ(z + n + 1) − Σ_{k≤n} 1/(z + k)` off the poles, where `ψ(z + n + 1)` and the terms with
`k ≠ n` are continuous at `−n`.

*Needs:* Mathlib `Complex.tendsto_self_mul_Gamma_nhds_zero` (the case `n = 0` for `Γ`),
`Complex.Gamma_add_one`, `Complex.digamma_apply_add_nat`.

**Checks.**
- `n = 0`: `z Γ(z) → 1`, which is Mathlib's `Complex.tendsto_self_mul_Gamma_nhds_zero`.
- `n = 2`: `(z + 2) Γ(z) → ½`, the value `Γ(1)/((−2)(−1))`.
- The residue of `ψ` does not depend on `n`, whereas that of `Γ` alternates in sign: a residue
  `(−1)ⁿ` for `ψ` would give `+1` at `n = 1`, but `(z + 1) ψ(z) → −1`.

### 1.2 Gauss's partial-fraction series for `ψ` and `ψ′`

- For `z ∉ {0, −1, −2, …}`, `ψ(z) = −γ + Σ_{k≥0} (1/(k + 1) − 1/(k + z))`, the series converging
  absolutely (`Complex.summable_gaussSeries`, `Complex.digamma_eq_gaussSeries`).
- For `z ∉ {0, −1, −2, …}`, `ψ′(z) = Σ_{k≥0} 1/(k + z)²` (`Complex.hasSum_deriv_digamma`).

(Andrews–Askey–Roy, Thm. 1.2.5, (1.2.13)–(1.2.14), p. 13; Remmert, Ch. 2, §2.3, Prop. and
Cor. 2, p. 42; Temme, (3.10), p. 54; Whittaker–Watson, §12.16, p. 241; DLMF 5.7.6, 5.15.1.)

Route: pick `n` with `Re z + n > 0`; `Complex.digamma_apply_add_nat` gives
`ψ(z) = ψ(z + n) − Σ_{k<n} 1/(z + k)`, and ExplicitNumberFields 1.1a at `z + n`, reindexed, is the
series at `z`. For `ψ′`, differentiate the recurrence, which gives
`ψ′(z) = ψ′(z + n) + Σ_{k<n} 1/(k + z)²`, and use ExplicitNumberFields 1.1a at `z + n`.

*Needs:* ExplicitNumberFields 1.1a; Mathlib `Complex.digamma_apply_add_nat`.

**Checks.**
- The series of `ψ` at `z = −1.5 + 0.2i`, through `n = 2`: both sides are
  `0.7078599 + 1.6517574i`.
- At `z = −½`: the recurrence gives `ψ(−½) = ψ(½) + 2 = 2 − γ − 2 log 2 = 0.0364899`.
- `ψ′` at `z = 1`: `Σ_{k≥1} 1/k² = π²/6`.
- `ψ′` at `z = −½`: the recurrence gives `ψ′(−½) = ψ′(½) + 4 = π²/2 + 4`, and the series is
  `4 + Σ_{k≥0} 1/(k + ½)²`.

### 1.3 Higher derivatives of `ψ` and their series

`Complex.polygamma n z = iteratedDeriv n Complex.digamma z`, the `n`-th derivative of `ψ`
(Olver, Ch. 2, §2.1, p. 39; DLMF 5.15). Prove that it is holomorphic on `ℂ \ {0, −1, −2, …}`,
that `polygamma 0 = digamma`, that `polygamma 1 = deriv digamma`, that
`deriv (polygamma n) = polygamma (n + 1)` off the poles, and that `polygamma n x` is real for real
`x > 0`. For `n ≥ 1` and `z ∉ {0, −1, −2, …}`,
`ψ⁽ⁿ⁾(z) = (−1)ⁿ⁺¹ n! Σ_{k≥0} (k + z)^{−n−1}`, absolutely convergent (`Complex.hasSum_polygamma`;
Remmert, Ch. 2, §2.3, Cor. 2, p. 42, for `n = 1`; Temme, §3.4, p. 54, for `n = 1`).

Route: termwise differentiation of the series of `ψ′` in 1.2, which converges locally uniformly
off the poles.

*Needs:* 1.2; Mathlib `Complex.digamma`, `Complex.differentiableAt_Gamma`, `iteratedDeriv`.

**Checks.**
- `polygamma 0 1 = −γ`.
- `polygamma 2 1 = −2ζ(3) = −2.4041138`, negative; the series without the sign `(−1)ⁿ⁺¹` would
  give `+2ζ(3)`.
- The series at `n = 2`, `z = −1.5 + 0.2i`: both sides are `−0.2300158 + 23.7802054i`.
- At a pole `z = −k`, `polygamma n z` is Lean's junk value; no theorem uses it.

### 1.4 Recurrence, reflection and multiplication of `ψ⁽ⁿ⁾`

- For `z ∉ {0, −1, −2, …}`, `ψ⁽ⁿ⁾(z + 1) = ψ⁽ⁿ⁾(z) + (−1)ⁿ n! z^{−n−1}`
  (`Complex.polygamma_add_one`; DLMF 5.15.5).
- For `z ∉ ℤ`, `ψ⁽ⁿ⁾(1 − z) + (−1)^{n+1} ψ⁽ⁿ⁾(z) = (−1)ⁿ π dⁿ/dzⁿ cot(πz)`
  (`Complex.polygamma_one_sub`; DLMF 5.15.6, whose sign `(−1)^{n−1}` is written with the exponent
  `n + 1`).
- For `n ≥ 1`, `m ≥ 1` and `mz ∉ {0, −1, −2, …}`,
  `ψ⁽ⁿ⁾(mz) = m^{−n−1} Σ_{k=0}^{m−1} ψ⁽ⁿ⁾(z + k/m)` (`Complex.polygamma_mul_nat`; DLMF 5.15.7).

At `n = 0` the first two are Mathlib's `Complex.digamma_apply_add_one` and
`Complex.digamma_one_sub` (Lebedev, (1.3.3)–(1.3.4), p. 5); the multiplication formula for `ψ`
itself is 4.2.

Route: the first two by differentiating Mathlib's recurrence and reflection `n` times. The third
from the series of 1.3: split `Σ_{j≥0} (j + mz)^{−n−1}` by the residue of `j` modulo `m`, which
gives `m^{−n−1} Σ_{k<m} Σ_{l≥0} (l + z + k/m)^{−n−1}`.

*Needs:* 1.3; Mathlib `Complex.digamma_apply_add_one`, `Complex.digamma_one_sub`.

**Checks.**
- The reflection at `n = 0`: `ψ(1 − z) − ψ(z) = π cot πz`, Mathlib's `Complex.digamma_one_sub`.
  The sign is `−1`; the exponent `n − 1` with truncated subtraction in `ℕ` would give `+1` there.
- The multiplication at `m = 2`, `n = 1`, `z = ½`: `ψ′(1) = ¼(ψ′(½) + ψ′(1))`, i.e.
  `3ψ′(1) = ψ′(½)`.
- The recurrence at `n = 1`, `z = ½`: `ψ′(3/2) = ψ′(½) − 4`.

### 1.5 Values at the integers and half-integers

- For `n : ℕ`, `ψ(n + ½) = −γ − 2 log 2 + 2 Σ_{k=1}^{n} 1/(2k − 1)`
  (`Complex.digamma_nat_add_half`; Lebedev, (1.3.9), p. 6; DLMF 5.4.15); at `n = 0` this is
  `Complex.digamma_one_half`.
- For `n ≥ 1`, `ψ⁽ⁿ⁾(1) = (−1)^{n+1} n! ζ(n + 1)` and
  `ψ⁽ⁿ⁾(½) = (−1)^{n+1} n! (2^{n+1} − 1) ζ(n + 1)` (`Complex.polygamma_one_and_half`;
  DLMF 5.15.2–5.15.3); in particular `ψ′(1) = π²/6` and `ψ′(½) = π²/2` (DLMF 5.4.12–5.4.13).
- For `n ≥ 1`, `ψ′(n − ½) = π²/2 − 4 Σ_{k=1}^{n−1} 1/(2k − 1)²`
  (`Complex.polygamma_one_nat_sub_half`; DLMF 5.15.4).

Route: the first is the recurrence from `ψ(½)`. The others from the series of 1.3 at `1` and `½`,
splitting `Σ (k + ½)^{−n−1} = 2^{n+1} Σ (2k + 1)^{−n−1}` into all minus even terms, and the
recurrence of 1.4.

*Needs:* 1.3, 1.4; Mathlib `Complex.digamma_one_half`, `riemannZeta_two`.

**Checks.**
- `ψ′(n − ½)` at `n = 1`: `ψ′(½) = π²/2`, the empty sum.
- `ψ(3/2) = 2 − γ − 2 log 2 = 0.0364899`.
- `ψ″(1) = −2ζ(3)` and `ψ″(½) = −14ζ(3)`; the factor `2^{n+1} − 1` at `n = 2` is `7`, not `8`.

### Examples

- `ψ′(3/2)` two ways: 1.5 at `n = 2` gives `π²/2 − 4`; 1.4 at `n = 1`, `z = ½` gives `ψ′(½) − 4`,
  which is `π²/2 − 4` by 1.5; numerically `0.9348022`.

### Dependencies

Mathlib; ExplicitNumberFields 1.1a.

## Layer 2: the Beta integral on real paths and in several variables

### 2.1 Trigonometric, hyperbolic and algebraic forms of the Beta integral

For `Re a > 0`, `Re b > 0` unless stated:
- `∫₀^{π/2} sin^{2a−1}θ cos^{2b−1}θ dθ = ½ Γ(a)Γ(b)/Γ(a + b)`
  (`Complex.integral_sin_cpow_mul_cos_cpow`; Andrews–Askey–Roy, (1.1.21), p. 7;
  Whittaker–Watson, §12.42, p. 256; DLMF 5.12.2);
- for `z ∈ slitPlane`,
  `∫₀¹ t^{a−1}(1 − t)^{b−1}/(t + z)^{a+b} dt = (Γ(a)Γ(b)/Γ(a + b)) (1 + z)^{−a} z^{−b}`
  (`Complex.integral_beta_div_add_cpow`; DLMF 5.12.4);
- for `Re a > 0` and every `b`,
  `∫₀^{π/2} cos^{a−1}t cos(bt) dt = π Γ(a)/(2^a Γ((a + b + 1)/2) Γ((a − b + 1)/2))`
  (`Complex.integral_cos_cpow_mul_cos`; DLMF 5.12.5);
- for `Re a > 0` and every `b`,
  `∫₀^π sin^{a−1}t e^{ibt} dt = π e^{iπb/2} Γ(a)/(2^{a−1} Γ((a + b + 1)/2) Γ((a − b + 1)/2))`
  (`Complex.integral_sin_cpow_mul_exp`; Paris–Kaminski, (3.3.41), p. 100, in the variable
  `t − π/2`; DLMF 5.12.6);
- for `Re a > |Re b|`, `∫₀^∞ cosh(2bt)/cosh^{2a}t dt = 4^{a−1} Γ(a + b)Γ(a − b)/Γ(2a)`
  (`Complex.integral_cosh_div_cosh_cpow`; DLMF 5.12.7).

DLMF prints the third and fourth with `1/(a B(½(a + b + 1), ½(a − b + 1)))`, which equals
`Γ(a)/(Γ((a + b + 1)/2) Γ((a − b + 1)/2))` because the two arguments sum to `a + 1`; the reciprocal
form holds for every `b`.

Route: the first by `t = sin²θ` in Euler's Beta integral. The second by the Möbius substitution
`t ↦ (1 + z)t/(t + z)` for `z > 0`, then holomorphy in `z`. The third and fourth for real `b` with
`|b| < Re a + 1` from the Beta integral on the contour `t ↦ e^{2it}` (Cauchy on the half disk),
then for all `b` by the identity theorem: the left sides are entire in `b`. The fifth by
`u = e^{−2t}` in the half-line Beta integral.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`; SpecialFunctionsHypergeometric 6.3
(the half-line Beta integral for complex parameters).

**Checks.**
- The algebraic form at `a = b = 1`: `∫₀¹ dt/(t + z)² = 1/(z(1 + z))`.
- The cosine form at `(a, b) = (1, 0)`: `π/2`; the exponential form at `(1, 0)`: `π`.
- The cosine form at `a = 1`, `b = 3`: `∫₀^{π/2} cos 3t dt = −⅓`, and the right side is
  `π/(2 Γ(5/2) Γ(−½)) = π/(2 · (3√π/4)(−2√π)) = −⅓`.
- The hyperbolic form at `a = 1`, `b = 0`: `∫ sech² = 1`.

### 2.2 Dirichlet's integrals over the simplex

For `z : Fin n → ℂ` with `Re z_k > 0`,
`∫_{V_n} ∏_k t_k^{z_k−1} dt = ∏_k Γ(z_k) / Γ(1 + Σ_k z_k)`, and for `z : Fin (n + 1) → ℂ` with
`Re z_k > 0`, `∫_{V_n} (1 − Σ_k t_k)^{z_n − 1} ∏_{k<n} t_k^{z_k−1} dt = ∏_k Γ(z_k) / Γ(Σ_k z_k)`
(`TauCeti.integral_simplex_dirichlet`; Andrews–Askey–Roy, Thm. 1.8.1, p. 32; Whittaker–Watson,
§12.5, p. 258; DLMF 5.14.1–5.14.2).

Route: induction on `n` with Fubini and Euler's Beta integral; the first is the second with
`z_n = 1`.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`, Fubini on `Fin n → ℝ`
(`MeasureTheory.measurePreserving_piFinSuccAbove`).

**Checks.**
- `n = 1`: the second is Euler's Beta integral; the first is `∫₀¹ t^{z−1} dt = 1/z`.
- `z = 1` everywhere in the first: the volume of `V_n` is `1/n!`.
- The exponent of the last factor is `z_n − 1`, not `z_n`: at `n = 1`, `z = (1, 1)` the second
  gives `∫₀¹ dt = 1 = Γ(1)²/Γ(2)`, whereas the exponent `z_n` would give `½`.

### 2.3 Liouville's integrals over power simplices

For `a, p : Fin n → ℝ` with `a_k > 0`, `p_k > 0` and `α : Fin n → ℂ` with `Re α_k > 0`, on
`V = {x | (∀ k, 0 < x_k) ∧ Σ_k (x_k/a_k)^{p_k} ≤ 1}`,
`∫_V ∏_k x_k^{α_k − 1} dx = ∏_k (a_k^{α_k} Γ(α_k/p_k)/p_k) / Γ(1 + Σ_k α_k/p_k)`, the integrand
integrable on `V` (`TauCeti.integral_power_simplex`; Andrews–Askey–Roy, Cor. 1.8.2, p. 33). With
`α_k = 1`, `p_k = 2` it gives `2^{−n} π^{n/2} ∏_k a_k / Γ(1 + n/2)`, the volume of the part of
the ellipsoid `Σ (x_k/a_k)² ≤ 1` in the positive orthant (Andrews–Askey–Roy, Cor. 1.8.3, p. 33).

Route: the change of variables `y_k = (x_k/a_k)^{p_k}` on the positive orthant, with Jacobian
`∏_k (a_k/p_k) y_k^{1/p_k − 1}`, turns the integral into the first integral of 2.2 with exponents
`α_k/p_k`.

*Needs:* 2.2; Mathlib's change of variables on products of intervals.

**Checks.**
- `n = 1`: `∫₀^a x^{α−1} dx = a^α/α`, and the right side is `a^α Γ(α/p)/(p Γ(1 + α/p)) = a^α/α`
  for every `p`.
- `n = 2`, `a = p = (1, 1)`, `α = (1, 1)`: the triangle has area `½ = Γ(1)²/Γ(3)`.
- `n = 2`, `a = (1, 1)`, `p = (2, 2)`, `α = (1, 1)`: the quarter disk has area
  `(Γ(½)/2)²/Γ(2) = π/4`; without the factors `1/p_k` the right side would be `π`.

### Examples

- The first form of 2.1 at `a = b = ½` and the hyperbolic form at `a = ½`, `b = 0` both give
  `π/2`: `∫₀^{π/2} dθ = ½ Γ(½)²/Γ(1)` and `∫₀^∞ sech t dt = 4^{−1/2} Γ(½)²/Γ(1)`.

### Dependencies

Mathlib; SpecialFunctionsHypergeometric 6.3.

## Layer 3: transforms of Euler's integral

### 3.1 Scaled, split and subtracted Euler integrals

- For real `μ > 0`, `Re ν > 0` and `Re z > 0`,
  `∫₀^∞ exp(−z t^μ) t^{ν−1} dt = μ⁻¹ Γ(ν/μ) z^{−ν/μ}` (`Complex.integral_exp_neg_mul_rpow`;
  DLMF 5.9.1).
- For real `c > 0` and `Re z > 0`, `∫_ℝ |t|^{2z−1} e^{−ct²} dt = c^{−z} Γ(z)`
  (`Complex.integral_abs_cpow_mul_exp_neg_sq`; DLMF 5.9.3).
- Prym's decomposition: for `z ∉ {0, −1, −2, …}`,
  `Γ(z) = ∫₁^∞ t^{z−1} e^{−t} dt + Σ_{k≥0} (−1)^k/((z + k) k!)`
  (`Complex.Gamma_eq_integral_Ioi_one_add_tsum`; Temme, §3.2.1, p. 43; Andrews–Askey–Roy,
  (1.1.19), p. 7; DLMF 5.9.4).
- The Cauchy–Saalschütz integral: for `n : ℕ` and `−n − 1 < Re z < −n`,
  `Γ(z) = ∫₀^∞ t^{z−1} (e^{−t} − Σ_{k=0}^{n} (−t)^k/k!) dt`
  (`Complex.Gamma_eq_integral_exp_sub_taylor`; Temme, §3.2.2, pp. 44–45; Whittaker–Watson,
  §12.21, p. 243; DLMF 5.9.5).

Route: the first from AsymptoticExpansions 4.1 by `u = t^μ`; the second is the first with `μ = 2`
on each half line. Prym's decomposition splits Euler's integral at `1` and expands `e^{−t}` on
`[0, 1]`; both sides are holomorphic off the poles. The Cauchy–Saalschütz integral by repeated
integration by parts in the strip, continued from Euler's integral.

*Needs:* AsymptoticExpansions 4.1; Mathlib `Complex.Gamma_eq_integral`, the identity theorem.

**Checks.**
- The scaled integral at `μ = 1`: AsymptoticExpansions 4.1.
- The two-sided integral at `z = ½`, `c = 1`: `∫ e^{−t²} = √π`.
- Prym's decomposition at `z = 1`: `e^{−1} + Σ_k (−1)^k/((k + 1)k!) = e^{−1} + (1 − e^{−1}) = 1`.
- The Cauchy–Saalschütz integral at `n = 0`, `z = −½`:
  `∫₀^∞ t^{−3/2}(e^{−t} − 1) dt = −2√π = Γ(−½)`.

### 3.2 Oscillatory integrals

- `∫₀^R t^{z−1} cos t dt → Γ(z) cos(πz/2)` for `0 < Re z < 1`, and
  `∫₀^R t^{z−1} sin t dt → π/(2 Γ(1 − z) cos(πz/2))` for `−1 < Re z < 1`, as `R → ∞`
  (`Complex.tendsto_integral_cpow_mul_cos`, `Complex.tendsto_integral_cpow_mul_sin`;
  Andrews–Askey–Roy, Ch. 1, Ex. 19, p. 50; DLMF 5.9.6–5.9.7). The second is the source's
  `Γ(z) sin(πz/2)` with the removable singularity at `z = 0` written out: by reflection the two
  agree for `z ≠ 0`, and at `z = 0` the integral is `π/2`, whereas Mathlib's `Γ(0) = 0`.
- For `n ≥ 2`, `∫₀^R cos(tⁿ) dt → Γ(1 + 1/n) cos(π/(2n))` and
  `∫₀^R sin(tⁿ) dt → Γ(1 + 1/n) sin(π/(2n))` (`Complex.tendsto_integral_cos_pow_sin_pow`;
  DLMF 5.9.8–5.9.9).

Route: rotate `∫₀^∞ t^{z−1} e^{−st} dt = Γ(z) s^{−z}` to `s → ∓i` (Abel's limit on the imaginary
axis; Andrews–Askey–Roy, Ch. 1, Ex. 20, pp. 50–51, for the rotated integral). For the sine,
`∫₀^∞ t^{z−1} sin t · e^{−st} dt = Γ(z)((s − i)^{−z} − (s + i)^{−z})/(2i)` for `s > 0` and
`0 < Re z < 1`; both sides are holomorphic in `−1 < Re z < 1`, the right side with the value
`arctan(1/s)` at `z = 0`, so the identity theorem extends it to that strip; then Abel's limit
`s → 0⁺`. The integrals of `cos(tⁿ)` and `sin(tⁿ)` are the first two at `z = 1/n` after `u = tⁿ`.

*Needs:* AsymptoticExpansions 4.1; Mathlib the identity theorem.

**Checks.**
- The sine integral at `z = 0`: the Dirichlet integral `∫₀^∞ sin t/t dt = π/2`, Tau Ceti's
  `TauCeti.Contour.tendsto_integral_sin_div_atTop`.
- The sine integral off the range of Euler's integral: at `z = −0.3 + 0.4i` the limit is
  `π/(2 Γ(1.3 − 0.4i) cos(π(−0.3 + 0.4i)/2)) = 1.6209311 − 0.5587108i`; at `z = 0`, `s = 0.01` the
  damped integral is `arctan 100 = 1.5607967`.
- `∫₀^∞ cos(t²) dt`: the Fresnel integral `√(π/8)`.

### 3.3 Integrals for `ψ` and Euler's constant

For `Re z > 0` (Gauss's integral is AnalyticNumberTheoryPartI §1.8a):
- `ψ(z) = log z + ∫₀^∞ (1/t − 1/(1 − e^{−t})) e^{−tz} dt` (`Complex.digamma_eq_log_add_integral`;
  DLMF 5.9.13);
- Dirichlet's integral `ψ(z) = ∫₀^∞ (e^{−t} − (1 + t)^{−z}) dt/t`
  (`Complex.digamma_eq_integral_one_add`; Andrews–Askey–Roy, Thm. 1.6.1(i), p. 26; Lebedev,
  (1.3.12), p. 6; DLMF 5.9.14);
- `ψ(z) = log z − 1/(2z) − 2 ∫₀^∞ t dt/((t² + z²)(e^{2πt} − 1))`
  (`Complex.digamma_eq_log_sub_integral`; DLMF 5.9.15);
- `ψ(z) + γ = ∫₀^∞ (e^{−t} − e^{−zt})/(1 − e^{−t}) dt = ∫₀¹ (1 − t^{z−1})/(1 − t) dt`
  (`Complex.digamma_add_eulerMascheroni`; Temme, (3.11), p. 55, at `z − 1`; DLMF 5.9.16);

and the three remaining integrals for `γ` (`Real.eulerMascheroni_eq_integrals`; DLMF 5.9.18, whose
first equality is an input):

```text
γ = ∫₀^∞ (1/(1 + t) − e^{−t}) dt/t = ∫₀¹ (1 − e^{−t}) dt/t − ∫₁^∞ e^{−t} dt/t
  = ∫₀^∞ (e^{−t}/(1 − e^{−t}) − e^{−t}/t) dt
```

Route: the first is Gauss's integral minus Frullani's integral
`log z = ∫₀^∞ (e^{−t} − e^{−zt}) dt/t` (Andrews–Askey–Roy, (1.6.1), p. 27; AsymptoticExpansions
4.1 integrated in `z`). Dirichlet's integral and the fourth are Gauss's integral after
`e^{−t} = 1/(1 + u)` and `e^{−t} = u`. The third is the first together with
`1/(e^u − 1) − 1/u + ½ = 2 ∫₀^∞ sin(ut)/(e^{2πt} − 1) dt` (the auxiliary sine integral, from the
partial-fraction expansion of `coth` via Mathlib's cotangent series) and
`∫₀^∞ e^{−zu} sin(tu) du = t/(t² + z²)`, by Fubini. For `γ`: the integral over `(0, 1)` minus the
integral over `(1, ∞)` follows from the input by integrating `e^{−t} log t` by parts, against
`1 − e^{−t}` on `(0, 1)` and against `−e^{−t}` on `(1, ∞)`; the integrals of
`(1/(1 + t) − e^{−t})/t` and of `e^{−t}/(1 − e^{−t}) − e^{−t}/t` are Dirichlet's integral and the
first at `z = 1`, with `ψ(1) = −γ`.

*Needs:* AnalyticNumberTheoryPartI §1.8a; AsymptoticExpansions 4.1; Mathlib
`Real.eulerMascheroniConstant_eq_neg_integral_log`, `Real.eulerMascheroniConstant_eq_neg_deriv`,
the cotangent partial fractions `cot_series_rep`.

**Checks.**
- The fourth at `z = 1`: both integrals vanish and `ψ(1) + γ = 0`.
- The fourth at `z = 2`: `∫₀¹ (1 − t)/(1 − t) dt = 1 = ψ(2) + γ`.
- The third at `z = 1`: `∫₀^∞ t dt/((t² + 1)(e^{2πt} − 1)) = (γ − ½)/2 = 0.0386078`; the integral
  is positive, as `γ > ½` requires.
- Dirichlet's integral at `z = ½ + 1.3i`: both sides are `0.2340176 + 1.5699058i`.

### 3.4 Derivatives and integrals of `Γ`

For `Re z > 0`:
- for `n : ℕ`, `Γ⁽ⁿ⁾(z) = ∫₀^∞ (log t)ⁿ e^{−t} t^{z−1} dt`
  (`Complex.iteratedDeriv_Gamma_eq_integral`; DLMF 5.9.19; the cases `n ≤ 1` are inputs);
- for `Re c > 0`, `∫ Γ` along the segment from `c` to `z` equals
  `∫₀^∞ (t^{z−1} − t^{c−1}) e^{−t}/log t dt` (`Complex.integral_segment_Gamma`; DLMF 5.9.20).

Route: the first by differentiating Euler's integral under the integral sign. The second by
integrating Euler's integral in `z` and Fubini.

*Needs:* Mathlib `Complex.Gamma_eq_integral`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**
- The first at `n = 0` is Euler's integral.
- The first at `n = 1`, `z = 1`: `∫₀^∞ log t e^{−t} dt = −γ = Γ′(1)`.
- The second at `z = c`: both sides are `0`.

### 3.5 The Laplace representation of `ψ⁽ⁿ⁾` and its asymptotic expansion

For `0 < δ < π` and `n ≥ 1`, as `z → ∞` in `|ph z| ≤ π − δ`,
`ψ⁽ⁿ⁾(z) ∼ (−1)^{n−1} ((n − 1)!/zⁿ + n!/(2z^{n+1}) + Σ_{k≥1} ((2k + n − 1)!/(2k)!) B_{2k}/z^{2k+n})`
(DLMF 5.15.8–5.15.9; Temme, (3.12), p. 55, gives the Laplace form of `ψ` from which it comes). In
the form of the conventions: for every `N`, the difference between `ψ⁽ⁿ⁾(z)` and the terms up to
`k = N` is `O(|z|^{−2N−n−2})` along `cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π − δ}`
(`Complex.isBigO_polygamma_sub_partialSum`).

Route: the Laplace representation `ψ⁽ⁿ⁾(z) = (−1)^{n+1} ∫₀^∞ tⁿ e^{−zt}/(1 − e^{−t}) dt` for
`Re z > 0` (auxiliary; from the series of 1.3 and `∫₀^∞ tⁿ e^{−(k+z)t} dt = n!/(k + z)^{n+1}`).
The function `q(t) = tⁿ/(1 − e^{−t})` is holomorphic in `|ph t| < π/2`, with the Maclaurin
expansion `t^{n−1} Σ_k B_k⁺ t^k/k!` (`B₁⁺ = ½`) at `0` and `q(t) = O(|t|ⁿ)` at `∞` in every closed
subsector. Watson's lemma (AsymptoticExpansions 4.2) gives the expansion in `|ph z| ≤ π/2 − δ`,
and the rotation of the path (AsymptoticExpansions 4.3) through `|θ| < π/2` extends it to
`|ph z| ≤ π − δ`.

*Needs:* 1.3; AsymptoticExpansions 1.1, 1.3, 4.1–4.3; Mathlib `bernoulli`.

**Checks.**
- `n = 1`, `z = 10`, terms up to `k = 2`: `ψ′(10) = 0.1051663356817` and
  `1/10 + 1/200 + 1/6000 − 1/3000000 = 0.1051663333333`; the difference `2.35 · 10⁻⁹` is close to
  the next term `B₆/10⁷ = 1/(42 · 10⁷) = 2.38 · 10⁻⁹`.
- The sector cannot reach the negative axis: `ψ′` has poles at `−k`.
- The Laplace representation at `n = 1`, `z = 1`: `∫₀^∞ t e^{−t}/(1 − e^{−t}) dt = ζ(2) = ψ′(1)`.

### Examples

- At `z = ½`: the fourth integral of 3.3 gives
  `∫₀¹ (1 − t^{−1/2})/(1 − t) dt = −2 ∫₀¹ du/(1 + u) = −2 log 2`, which is `ψ(½) + γ`; then the
  third gives `∫₀^∞ t dt/((t² + ¼)(e^{2πt} − 1)) = (log 2 + γ − 1)/2 = 0.1351814`.

### Dependencies

Layer 1; AsymptoticExpansions 1.1, 1.3, 4.1–4.3; AnalyticNumberTheoryPartI §1.8a.

## Layer 4: uniqueness, multiplication and closed-form values

### 4.1 Wielandt's theorem and the limit characterization

- **Wielandt's theorem.** Let `F` be holomorphic on `Re z > 0`, with `F(z + 1) = z F(z)` there and
  `F` bounded on the strip `1 ≤ Re z < 2`. Then `F = F(1) Γ` on `Re z > 0`
  (`Complex.eq_mul_Gamma_of_isBounded`; Remmert, Ch. 2, §2.4, p. 43; Beals–Wong, Thm. 2.4.1,
  p. 28).
- **The limit characterization.** Let `f : (0, ∞) → ℝ` satisfy `f(1) = 1`, `f(x + 1) = x f(x)`
  and `f(x + n)/(n^x f(n)) → 1` as `n → ∞` for every `x > 0`. Then `f = Γ` on `(0, ∞)`
  (`Real.eq_Gamma_of_tendsto_ratio`; Andrews–Askey–Roy, Thm. 1.9.4, p. 36; Remmert, Ch. 2, §2.4,
  p. 44).

Route: for Wielandt, `v = F − F(1)Γ` satisfies the functional equation, continues to an entire
function through it (the poles cancel because `v(1) = 0`), and is bounded on `0 ≤ Re z ≤ 1`;
`v(z) v(1 − z)` is then a bounded entire function, constant by Liouville, with the value
`v(1) v(0) = 0` (Remmert's proof). For the limit characterization, the functional equation gives
`f(x) = f(x + n)/(x(x + 1) ⋯ (x + n − 1))` and `f(n) = (n − 1)!`, so the hypothesis turns it into
Euler's limit for `Γ(x)`.

*Needs:* Mathlib `Differentiable.apply_eq_apply_of_bounded`, `Complex.GammaSeq_tendsto_Gamma`,
`Complex.Gamma_mul_Gamma_one_sub`.

**Checks.**
- `F = Γ` satisfies the hypotheses of Wielandt's theorem: `|Γ(z)| ≤ Γ(Re z)` (7.3) is bounded on
  the strip.
- `F(z) = Γ(z) sin(2πz)` satisfies the functional equation and `F(1) = 0`, but `F ≠ 0`: it is
  unbounded on the strip, `|F(1.5 + 3i)| = 5.26 · 10⁶`, so boundedness cannot be dropped.
- `f(x) = Γ(x)(1 + sin²πx)` satisfies `f(1) = 1` and the functional equation, and
  `f(x + n)/(n^x f(n)) → 1 + sin²πx`, which at `x = 0.3` is `1.6545`; so the limit condition
  cannot be dropped.

### 4.2 Gauss's multiplication formula

For every integer `n ≥ 1`:
- `Γ(z) Γ(z + 1/n) ⋯ Γ(z + (n − 1)/n) = (2π)^{(n−1)/2} n^{1/2 − nz} Γ(nz)` for every `z ∈ ℂ`
  (`Complex.prod_Gamma_add_div`); both sides vanish exactly when `nz ∈ {0, −1, −2, …}`;
- `∏_{k=1}^{n−1} Γ(k/n) = (2π)^{(n−1)/2} n^{−1/2}`, the case `z = 1/n` of the first;
- `ψ(nz) = (1/n) Σ_{k=0}^{n−1} ψ(z + k/n) + log n` for `nz ∉ {0, −1, −2, …}`
  (`Complex.digamma_mul_nat`).

(Andrews–Askey–Roy, Thm. 1.5.2, (1.5.2)–(1.5.3), p. 23; Remmert, Ch. 2, §2.5, p. 45;
Temme, §3.3.1, p. 52; Whittaker–Watson, §12.15, p. 240; DLMF 5.5.6, 5.5.7, 5.5.9.)

Route: for real `x > 0`, `f(x) = n^x ∏_{k=0}^{n−1} Γ((x + k)/n)` is log-convex and satisfies
`f(x + 1) = x f(x)`, so `f = f(1) Γ` by Bohr–Mollerup (`Real.eq_Gamma_of_log_convex`); put
`x = nz`. The constant `f(1) = n ∏_{k=1}^{n−1} Γ(k/n)` is the second formula, which comes from the
reflection formula paired as `Γ(k/n) Γ(1 − k/n) = π/sin(πk/n)` and
`∏_{k=1}^{n−1} 2 sin(πk/n) = n`. Extend to `ℂ` by the identity theorem. The third is the
logarithmic derivative. Alternatively, Wielandt's theorem (4.1) gives the first on `Re z > 0`
directly (Remmert's proof).

*Needs:* Mathlib `Real.eq_Gamma_of_log_convex`, `Complex.Gamma_mul_Gamma_one_sub`, the identity
theorem.

**Checks.**
- `n = 1`: both sides are `Γ(z)`.
- `n = 2`: the duplication formula `Complex.Gamma_mul_Gamma_add_half`.
- `n = 3`: Gauss's triplication formula of SpecialFunctionsAiry 7.1.
- The formula for `ψ` at `n = 2` is `Complex.digamma_two_mul`.

### 4.3 Pochhammer duplication and Lah numbers

For every `a, x ∈ ℂ` and `n ∈ ℕ` (DLMF 5.2.8–5.2.9):
- `(a)_{2n} = 2^{2n} (a/2)ₙ ((a + 1)/2)ₙ` and `(a)_{2n+1} = 2^{2n+1} (a/2)_{n+1} ((a + 1)/2)ₙ`
  (`ascPochhammer_two_mul_eval`);
- `(x)ₙ = Σ_{k=0}^{n} L(n, k) x(x − 1) ⋯ (x − k + 1)` and
  `x(x − 1) ⋯ (x − n + 1) = Σ_{k=0}^{n} (−1)^{n−k} L(n, k) (x)_k`, where the Lah number is
  `L(n, k) = C(n − 1, k − 1) n!/k!` for `1 ≤ k ≤ n`, `L(0, 0) = 1` and `L(n, k) = 0` otherwise
  (`Complex.lah`; `ascPochhammer_eval_eq_sum_lah`, `descPochhammer_eval_eq_sum_lah`).

The first is the polynomial form of the duplication formula: off the poles it is
`Γ(a + 2n)/Γ(a)` against the duplication formula at `a/2 + n` and `a/2`.

Route: induction on `n`. For the Lah expansions, write `[x]_k = x(x − 1) ⋯ (x − k + 1)`; use the
recurrence `L(n + 1, k) = (n + k) L(n, k) + L(n, k − 1)`, `(x)_{n+1} = (x)ₙ (x + n)` and
`(x + n) [x]_k = [x]_{k+1} + (n + k) [x]_k`. The second expansion is the first at `−x`, by
`ascPochhammer_eval_neg_eq_descPochhammer`.

*Needs:* Mathlib `ascPochhammer`, `descPochhammer`, `Nat.choose`.

**Checks.**
- `n = 2`: `x(x + 1) = L(2,1) x + L(2,2) x(x − 1) = 2x + x(x − 1)`, and
  `x(x − 1) = −2x + x(x + 1)`.
- `L(n, k) = 0` for `k = 0 < n`: with truncated subtraction `C(n − 1, k − 1) n!/k!` would be
  `n!` there, which breaks `n = 1`: `(x)₁ = x`, not `x + 1`.
- The duplication at `a = 1`, `n = 1`: `(1)₂ = 2 = 4 · (½)₁ (1)₁ = 4 · ½ · 1`.

### 4.4 Values on vertical lines

- `Γ(½ + iy) Γ(½ − iy) = |Γ(½ + iy)|² = π/cosh πy` for real `y` (`Complex.Gamma_half_add_mul_I`;
  Remmert, Ch. 2, §2.1, 3), p. 40; DLMF 5.4.4).
- `Γ(¼ + iy) Γ(¾ − iy) = π√2/(cosh πy + i sinh πy)` for real `y`
  (`Complex.Gamma_quarter_add_mul_I`; DLMF 5.4.5).
- For real `y`, `Im ψ(iy) = 1/(2y) + (π/2) coth πy` and `Im ψ(1 + iy) = −1/(2y) + (π/2) coth πy`
  for `y ≠ 0`, and `Im ψ(½ + iy) = (π/2) tanh πy` (`Complex.im_digamma_mul_I`,
  `Complex.im_digamma_one_add_mul_I`, `Complex.im_digamma_half_add_mul_I`; DLMF 5.4.16–5.4.18).

The modulus `|Γ(iy)| = (π/(y sinh πy))^{1/2}` for real `y ≠ 0` (Remmert, Ch. 2, §2.1, 3), p. 40;
DLMF 5.4.3) is the input from SpecialFunctionsParabolicCylinder 6.6(a), divided by `|iy|² = y²`.

Route: the first two are the reflection formula at `½ + iy`, `¼ + iy`, with `Γ(z̄) = conj Γ(z)`
(`Complex.Gamma_conj`). The values of `Im ψ` are the imaginary parts of the reflection formula for
`ψ` (`Complex.digamma_one_sub`) at `iy`, `½ + iy`, using `ψ(z̄) = conj ψ(z)` and the recurrence.

*Needs:* Mathlib reflection and recurrence for `Γ` and `ψ`, `Complex.Gamma_conj`.

**Checks.**
- The first at `y = 0`: `Γ(½)² = π`.
- The second at `y = 0`: `Γ(¼) Γ(¾) = π√2`, the reflection formula at `¼`.
- `Im ψ(½ + iy)` at `y = 0`: `Im ψ(½) = 0`.
- `Im ψ(1 + iy)` is `Im ψ(iy)` plus `Im(1/(iy)) = −1/y`.
- At `y = 1`: `Im ψ(i) = ½ + (π/2) coth π = 2.0767`, and `Im ψ(1 + i) = 2.0767 − 1 = 1.0767`.

### 4.5 Gauss's digamma theorem

For integers `0 < p < q`,
`ψ(p/q) = −γ − log q − (π/2) cot(πp/q) + ½ Σ_{k=1}^{q−1} cos(2πkp/q) log(2 − 2 cos(2πk/q))`
(`Complex.digamma_rat`; Andrews–Askey–Roy, Thm. 1.2.7, (1.2.16), p. 13; DLMF 5.4.19).

Route: the Gauss series of 1.2 at `p/q` and the discrete Fourier expansion of the indicator of the
residue class `p` modulo `q`, with `Σ_{n≥1} ωⁿ/n = −log(1 − ω)` for a `q`-th root of unity
`ω ≠ 1`; the real parts give the logarithms and the imaginary parts the cotangent (Jensen's
argument, Andrews–Askey–Roy, pp. 14–15).

*Needs:* 1.2; Mathlib `Complex.hasSum_taylorSeries_neg_log` or the Abel-summed logarithm series
on the unit circle.

**Checks.**
- `p/q = ½`: `cot(π/2) = 0`, the sum is `½ cos π log 4 = −log 2`, total `−γ − 2 log 2`
  (`Complex.digamma_one_half`).
- `p/q = ⅓` and `⅔`: the cosine sums agree, so the formula gives
  `ψ(⅔) − ψ(⅓) = (π/2)(cot(π/3) − cot(2π/3)) = π/√3`, which is the reflection formula
  `ψ(1 − z) − ψ(z) = π cot πz` at `z = ⅓`.
- `p/q = ⅖`: both sides are `−2.5613845`.

### 4.6 Kummer's Fourier series of `log Γ`

For `0 < x < 1`, with partial sums over `k = 1, …, N`,
`Σ_{k≥1} (log k/k) sin 2πkx = π (log Γ(x) − ½ log 2π + ½ log(2 sin πx) − (γ + log 2π)(½ − x))`
(`Real.tendsto_sum_log_Gamma_sine`; Andrews–Askey–Roy, Thm. 1.7.1, p. 29).

Route: Kummer's Fourier series of `log Γ` on `(0, 1)`: the Fourier coefficients are
`∫₀¹ log Γ(x) dx = ½ log 2π`, `∫₀¹ log Γ(x) cos 2πkx dx = 1/(4k)` and
`∫₀¹ log Γ(x) sin 2πkx dx = (γ + log 2πk)/(2πk)`. The cosine coefficients come from the reflection
formula and the Fourier series of `log(2 sin πx)`; the sine coefficients by integrating Dirichlet's
integral for `ψ` (3.3) against `sin 2πkx` and Fubini, as in the proof of Andrews–Askey–Roy,
Thm. 1.7.1. Then `Σ_{k≥1} cos(2πkx)/k = −log(2 sin πx)` and `Σ_{k≥1} sin(2πkx)/k = π(½ − x)`
remove the cosine part and the `γ + log 2π` part. The series converges conditionally, so the
target is the limit of partial sums, for each `x` in `(0, 1)`.

*Needs:* 3.3; Mathlib `Complex.Gamma_mul_Gamma_one_sub`, Fourier series on the circle and the
pointwise convergence of the Fourier series of a function of bounded variation.

**Checks.**
- `x = ½`: every `sin πk = 0`, and `log Γ(½) − ½ log 2π + ½ log 2 = 0`, so both sides are `0`.
- `x = 0.3`: both sides are `−0.2059414`; at `x = ¼` both are `−0.1929013`.
- The sign of the linear term: with `(x − ½)` in place of `(½ − x)` the right side at `x = 0.3`
  would be `2.8289537`, not `−0.2059414`.

### Examples

- Gauss's theorem at `p/q = ¼`: the `k = 1, 3` terms vanish and `k = 2` gives `−log 2`, so
  `ψ(¼) = −γ − π/2 − 3 log 2 = −4.2274535`. With the reflection formula,
  `ψ(¾) = −γ + π/2 − 3 log 2`, and the multiplication formula for `ψ` at `n = 2`, `z = ¼` gives
  `½(ψ(¼) + ψ(¾)) + log 2 = −γ − 2 log 2 = ψ(½)`.

### Dependencies

Layers 1 and 3; Mathlib.

## Layer 5: series summed by `ψ`, and balanced products

### 5.1 Series of rational functions

For `a, A : Fin m → ℂ` with `Σ_k A_k = 0` and no `a_k` in `{0, 1, 2, …}`,
`Σ_{n≥0} Σ_k A_k/(n − a_k) = −Σ_k A_k ψ(−a_k)`, the series converging absolutely
(`Complex.hasSum_sum_div_sub`; Duverney, Ch. 2, (2.34), p. 34; Temme, Example 3.1, p. 56). This
sums `Σ_n P(n)/Q(n)` whenever `deg Q ≥ deg P + 2` and `Q` has simple roots off `{0, 1, 2, …}`,
with `A_k` the residues of `P/Q`.

Route: subtract `Σ_k A_k/(n + 1) = 0` termwise and apply the Gauss series of 1.2 at each `−a_k`.

*Needs:* 1.2.

**Checks.**
- `a = (−½, −1)`, `A = (1, −1)`:
  `Σ_n (1/(n + ½) − 1/(n + 1)) = Σ_n 1/((n + ½)(n + 1)) = ψ(1) − ψ(½) = 2 log 2 = 1.3862944`
  (Duverney, Example 2.8, pp. 34–35).
- `m = 1` forces `A₀ = 0` and both sides vanish; with `Σ A_k ≠ 0` the series diverges like the
  harmonic series, so the hypothesis cannot be dropped.
- `a = (−z, −1)`, `A = (−1, 1)`, `z` off the poles: the identity is the Gauss series itself,
  `Σ (1/(n + 1) − 1/(n + z)) = ψ(z) + γ`.

### 5.2 Alternating and imaginary-axis series

- For `z ∉ {0, −1, −2, …}`, `ψ((z + 1)/2) − ψ(z/2) = 2 Σ_{k≥0} (−1)^k/(k + z)`, the series
  converging conditionally, as the limit of its partial sums (`Complex.tendsto_digamma_half_sub`;
  Temme, (3.14), p. 56; Duverney, Ch. 2, (2.36), p. 35; DLMF 5.7.7).
- For real `y`, `Im ψ(1 + iy) = Σ_{k≥1} y/(k² + y²)` (`Complex.im_digamma_one_add_mul_I_eq_tsum`;
  DLMF 5.7.8).

Route: from the Gauss series of 1.2; for the alternating series, pair the terms of the two Gauss
series and use that the even partial sums and the odd partial sums have the same limit.

*Needs:* 1.2.

**Checks.**
- The alternating series at `z = 1`: `ψ(1) − ψ(½) = 2 log 2 = 2(1 − ½ + ⅓ − ⋯)`.
- The imaginary-axis series against 4.4 at `y = 1`: `Σ 1/(k² + 1) = −½ + (π/2) coth π = 1.0767`.
- The alternating series at `z = −½ + i`, off the right half-plane: both sides are
  `−1.0710150 − 0.4338242i`.

### 5.3 Series of trigamma values

- `Σ_{k≥1} (−1)^k ψ′(k) = −π²/8`, as the limit of the partial sums
  (`Complex.tendsto_sum_neg_one_pow_polygamma_one`; DLMF 5.16.1);
- `Σ_{k≥1} ψ′(k + 1)/k = ζ(3)` (absolutely convergent) (`Complex.hasSum_polygamma_one_div`;
  DLMF 5.16.2), and `ζ(3) = −½ ψ″(1)`.

Route: the series of `ψ′` of 1.2 and an exchange of summation. For the alternating series, the
even and odd partial sums have closed forms in `Σ 1/(2j + 1)²`, whose sum is `π²/8`.

*Needs:* 1.2, 1.3.

**Checks.**
- `−½ ψ″(1) = ζ(3)` is 1.5 at `n = 2`.
- The first terms of the alternating series: `−ψ′(1) + ψ′(2) = −1`.

### 5.4 Balanced infinite products

For `a, b : Fin m → ℂ` with `Σ a_k = Σ b_k` and no `b_k` in `{0, −1, −2, …}`,
`∏_{j≥0} ∏_k (a_k + j)/(b_k + j) = ∏_k Γ(b_k) · ∏_k Γ(a_k)⁻¹` as a `HasProd`
(`Complex.hasProd_balanced`; Whittaker–Watson, §12.13, pp. 238–239; DLMF 5.8.4–5.8.5). When some
`a_k ∈ {0, −1, −2, …}` both sides are `0`.

Route: from Euler's limit: the balancing makes the factors `1 + O(1/j²)`, and the partial products
are quotients of `GammaSeq` up to `n^{Σ a_k − Σ b_k} = 1`.

*Needs:* Mathlib `Complex.GammaSeq_tendsto_Gamma`, `HasProd`.

**Checks.**
- `m = 2`, `a = (1, 1)`, `b = (½, 3/2)`: `∏ (j+1)²/((j+½)(j+3/2)) = Γ(½)Γ(3/2) = π/2`, the
  Wallis product.
- `m = 1` forces `a = b` and both sides are `1`.

### Examples

- The alternating series of 5.2 at `z = ½`: `ψ(¾) − ψ(¼) = 4(1 − ⅓ + ⅕ − ⋯) = π`, the value from
  Gauss's theorem (4.5).

### Dependencies

Layers 1 and 4; Mathlib.

## Layer 6: Taylor expansions at the origin

### 6.1 The Maclaurin series of `log Γ(1 + z)` and `ψ(1 + z)`

With the branch of `log Γ(1 + z)` removed by exponentiating (DLMF 5.7.3–5.7.5):
- for `|z| < 2`, `z ≠ −1`,
  `Γ(1 + z) = (1 + z)⁻¹ exp(z(1 − γ) + Σ_{k≥2} (−1)^k (ζ(k) − 1) z^k/k)`
  (`Complex.Gamma_one_add_eq_exp`), the series converging absolutely;
- for `|z| < 1`, `ψ(1 + z) = −γ + Σ_{k≥2} (−1)^k ζ(k) z^{k−1}` (`Complex.digamma_one_add_eq_tsum`);
- for `|z| < 2`, `z ∉ {0, 1, −1}`,
  `ψ(1 + z) = 1/(2z) − (π/2) cot πz + 1/(z² − 1) + 1 − γ − Σ_{k≥1} (ζ(2k + 1) − 1) z^{2k}`
  (`Complex.digamma_one_add_eq_tsum_odd`).

Route: the series of `ψ(1 + z)` from the Gauss series of 1.2 by expanding `1/(k + z)`
geometrically and summing over `k` first (absolute convergence for `|z| < 1`). For `Γ(1 + z)`:
`ψ(2 + z) = ψ(1 + z) + 1/(1 + z)` has the series `1 − γ + Σ_{k≥2} (−1)^k (ζ(k) − 1) z^{k−1}`, which
converges on `|z| < 2` because `0 < ζ(k) − 1 ≤ 3 · 2^{−k}`; integrate from `0` and exponentiate,
then extend from `|z| < 1` by the identity theorem. The odd series is the even part of the series
of `ψ(1 + z)` combined with the reflection formula for `ψ`, with the same extension to `|z| < 2`.

*Needs:* 1.2; Mathlib `riemannZeta`, `Complex.digamma_one_sub`.

**Checks.**
- The series of `Γ(1 + z)` at `z = 1`: `Σ_{k≥2} (−1)^k (ζ(k) − 1)/k = γ − 1 + log 2`, which with
  `Γ(2) = 1` is the identity `Σ_{k≥2} (−1)^k ζ(k)/k = γ` minus `Σ_{k≥2} (−1)^k/k = 1 − log 2`.
- The series of `ψ(1 + z)` at `z = 0`: `ψ(1) = −γ`.
- The odd series at `z = ½`: `cot(π/2) = 0` and `1/(z² − 1) = −4/3`, so it and
  `ψ(3/2) = 2 − γ − 2 log 2` give `Σ_{k≥1} (ζ(2k + 1) − 1) 4^{−k} = 2 log 2 − 4/3 = 0.0529610`.
- The restriction of the series of `Γ(1 + z)` to `|z| < 1`, rewritten with
  `log(1 + z) = Σ (−1)^{k+1} z^k/k`, is ConformalMappingPartII 5.6.

### 6.2 The reciprocal Gamma series

With `c_k = (1/Γ)^{(k)}(0)/k!` (`Complex.invGammaCoeff`), for every `z ∈ ℂ`,
`1/Γ(z) = Σ_{k≥1} c_k z^k`, `c₀ = 0`, `c₁ = 1`, `c₂ = γ`, and for
`k ≥ 3`, `(k − 1) c_k = γ c_{k−1} − ζ(2) c_{k−2} + ζ(3) c_{k−3} − ⋯ + (−1)^k ζ(k − 1) c₁`
(`Complex.invGammaCoeff_recurrence`; DLMF 5.7.1–5.7.2).

Route: `1/Γ` is entire, so its Taylor series at `0` converges on `ℂ`. Multiply
`z (1/Γ)′(z) = (1/Γ(z)) · (−z ψ(z))` and expand `−zψ(z) = 1 + γz − Σ_{j≥2} (−1)^j ζ(j) z^j` on
`|z| < 1` (6.1); compare coefficients.

*Needs:* Mathlib `Complex.differentiable_one_div_Gamma`; 6.1.

**Checks.**
- `c₃ = (γ² − ζ(2))/2 = −0.6558781`, from the recurrence at `k = 3`.
- `Σ_k c_k = 1/Γ(1) = 1`.
- `(1/Γ)″(0) = 2γ = 1.1544313`, so `c₂ = γ`; without the factor `1/k!` the definition would give
  `c₂ = 2γ`.
- `3c₄ = γc₃ − ζ(2)c₂ + ζ(3)c₁ = −0.1260079`, so `c₄ = −0.0420026`, the fourth Taylor coefficient
  of `1/Γ` at `0`.

### Examples

- The series of `ψ(1 + z)` at `z = −½` with `ψ(½) = −γ − 2 log 2` gives
  `Σ_{k≥2} ζ(k)/2^{k−1} = 2 log 2 = 1.3862944`.

### Dependencies

Layer 1; Mathlib.

## Layer 7: convexity and inequalities

### 7.1 The inequalities at `x` and `1/x`

For real `x > 0`, `1/Γ(x) + 1/Γ(1/x) ≤ 2` and `1/Γ(x)² + 1/Γ(1/x)² ≤ 2`
(`Real.inv_Gamma_add_inv_Gamma_inv_le_two`, `Real.inv_Gamma_sq_add_inv_Gamma_inv_sq_le_two`;
DLMF 5.6.2–5.6.3).

Route: the first follows from the second by the inequality between the arithmetic and quadratic
means. The second is symmetric under `x ↦ 1/x`, so take `x ≥ 1`. For `x ≥ 2` both terms are at
most `1`: `Γ(x) ≥ 1`, and `Γ(1/x) ≥ Γ(½) > 1` because `Γ` decreases on `(0, 1]`. For `x = 1 + t`
with `0 ≤ t < 1`, write `1/x = 1 − r`; Taylor bounds for `log Γ` at `1`, from `ψ(1) = −γ`,
`ψ′(1) = ζ(2)` and the monotonicity of `ψ′` (1.2), give `log Γ(1/x) ≥ γr + ζ(2)r²/2` and
`log Γ(x) ≥ −γt + ζ(2)t²/2 − 4t³/9`; with `cosh d ≤ e^{d²/2}` and `½ < γ < ⅗` the inequality
reduces to a polynomial inequality in `t`.

*Needs:* Mathlib `Real.Gamma`, `Real.convexOn_log_Gamma`, `Real.eulerMascheroniConstant`; 1.2.

**Checks.**
- Equality at `x = 1`.
- At `x = 2`: `1/Γ(2) + 1/Γ(½) = 1 + 1/√π = 1.5642 ≤ 2`.
- At `x = 0.1`: `1/Γ(0.1) + 1/Γ(10) = 0.1051 + 0.0000028`, far from equality.

### 7.2 Gautschi's and Kershaw's inequalities

For real `x > 0` and `0 < s < 1` (DLMF 5.6.4–5.6.5):
- `x^{1−s} < Γ(x + 1)/Γ(x + s) < (x + 1)^{1−s}` (`Real.gautschi`);
- `exp((1 − s) ψ(x + s^{1/2})) ≤ Γ(x + 1)/Γ(x + s) ≤ exp((1 − s) ψ(x + (s + 1)/2))`
  (`Real.kershaw`).

Route: Gautschi is Wendel's argument with the strict log-convexity of `Γ` on `(0, ∞)`:
`Γ(x + s) < Γ(x)^{1−s} Γ(x + 1)^s` and `Γ(x + 1) < Γ(x + s)^s Γ(x + s + 1)^{1−s}`, with
`x + s < x + 1`. Strict convexity follows from `ψ′(x) > 0` (1.2). Kershaw: for
`c ∈ {s^{1/2}, (s + 1)/2}` the function `x ↦ log Γ(x + 1) − log Γ(x + s) − (1 − s) ψ(x + c)` is
monotone on `(0, ∞)` (its derivative is a series of rational functions of fixed sign, by 1.2) and
tends to `0` as `x → ∞` (by Gautschi's inequality and `ψ(x) − log x → 0`).

*Needs:* Mathlib `Real.convexOn_log_Gamma`; 1.2; ZerosOfLFunctions 1.4 (`ψ(x) − log x → 0`).

**Checks.**
- `s → 1`: all four bounds tend to `1`.
- `x = 1`, `s = ½`: `Γ(2)/Γ(3/2) = 2/√π = 1.1284`, between `1` and `√2 = 1.4142`.
- Kershaw at `x = 1`, `s = ½`: `exp(½ ψ(1.7071)) = 1.1130 ≤ 1.1284 ≤ exp(½ ψ(1.75)) = 1.1317`.

### 7.3 Bounds on vertical lines

- For real `x ∉ {0, −1, −2, …}` and real `y`, `|Γ(x + iy)| ≤ |Γ(x)|`
  (`Complex.norm_Gamma_add_mul_I_le`; Olver, Ch. 2, Ex. 1.4, p. 38; Remmert, Ch. 2, §2.1, (4),
  p. 40, for `x > 0`; DLMF 5.6.6).
- For real `x ≥ ½` and `y`, `|Γ(x + iy)| ≥ (sech πy)^{1/2} Γ(x)` (`Complex.norm_Gamma_add_mul_I_ge`;
  DLMF 5.6.7).

Route: for the upper bound, every factor `1 + y²/(x + k)²` of the product of
SpecialFunctionsParabolicCylinder 6.6(a) is at least `1`, so `Γ(x)²/|Γ(x + iy)|² ≥ 1`. For the
lower bound, the comparison in `x` of 6.6(a) from `½` to `x`, and 4.4.

*Needs:* SpecialFunctionsParabolicCylinder 6.6(a); 4.4.

**Checks.**
- The upper bound at `y = 0`: equality.
- The upper bound at `x = −½`, `y = 1`: `|Γ(−½ + i)| = 0.4656307 ≤ |Γ(−½)| = 2√π = 3.5449077`,
  and the product of 6.6(a) is `(3.5449077/0.4656307)² = 57.959766`.
- The lower bound at `x = ½`: equality, by 4.4.
- The lower bound at `y = 0`: equality.

### 7.4 Gamma quotients in the right half-plane

For real `a ≥ 0` and `b − a ≥ 1`, and `Re z > 0`, `|Γ(z + a)/Γ(z + b)| ≤ |z|^{a−b}`
(`Complex.norm_Gamma_add_div_Gamma_add_le`; DLMF 5.6.8).

Route: the Beta integral in the form
`Γ(z + a)/Γ(z + b) = Γ(b − a)⁻¹ ∫₀^∞ e^{−zu} e^{−au} (1 − e^{−u})^{b−a−1} du` (put `t = e^{−u}` in
Euler's Beta integral). The kernel continues to `Re u > 0`, where `|e^{−au}| ≤ 1` and
`|(1 − e^{−u})^{b−a−1}| ≤ |u|^{b−a−1}` because `b − a − 1 ≥ 0` and `|1 − e^{−u}| ≤ |u|`. Rotate
the path to the ray `ph u = −ph z` (AsymptoticExpansions 4.3), where `zu = |z| r`, and bound by
`Γ(b − a)⁻¹ ∫₀^∞ e^{−|z|r} r^{b−a−1} dr = |z|^{a−b}`.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`; AsymptoticExpansions 4.1 and 4.3.

**Checks.**
- `a = 0`, `b = 1`, `z = x > 0`: `Γ(x)/Γ(x + 1) = 1/x`, equality.
- The hypothesis `b − a ≥ 1` is needed: at `a = 0`, `b = ½`, `z = x → 0⁺`, the quotient
  `Γ(x)/Γ(x + ½) ∼ 1/(x√π)` exceeds `x^{−1/2}`.

### Examples

- At `x = 1`, `y = 1`: `|Γ(1 + i)| = (π/sinh π)^{1/2} = 0.5215640` lies between
  `(sech π)^{1/2} Γ(1) = 0.2937120` (the lower bound of 7.3) and `Γ(1) = 1` (the upper bound), and
  7.4 at `a = 0`, `b = 1`, `z = 1 + i` is the equality `|Γ(z)/Γ(z + 1)| = 1/|z| = 0.7071068`.

### Dependencies

Layers 1 and 4; ZerosOfLFunctions 1.4; SpecialFunctionsParabolicCylinder 6.6(a);
AsymptoticExpansions 4.1, 4.3.

## Layer 8: loop contours

### 8.1 Hankel's loop integral

For every `z ∈ ℂ` and every `ε > 0`,

```text
1/Γ(z) = (sin πz/π) ∫_ε^∞ e^{−r} r^{−z} dr + (ε^{1−z}/2π) ∫_{−π}^{π} exp(ε e^{iθ} + i(1 − z)θ) dθ
```

(`Complex.inv_Gamma_eq_hankel`; Olver, Ch. 2, §1.7, pp. 37–38; Remmert, Ch. 2, §3.4, pp. 53–55;
Temme, (3.6), p. 48; Whittaker–Watson, §12.22, p. 244; Andrews–Askey–Roy, Ch. 1, Ex. 22, p. 51;
DLMF 5.9.2). This is `(2πi)⁻¹ ∫_{−∞}^{(0+)} e^t t^{−z} dt` on the contour that runs along the
lower side of the negative axis (`ph t = −π`) from `−∞` to `−ε`, around `|t| = ε`
counterclockwise, and back along the upper side (`ph t = π`), with `t^{−z}` principal on the
positive axis and continuous along the path.

Route: both sides are entire in `z`; for `0 < Re z < 1` let `ε → 0`, where the circle term tends
to `0` and the ray term to `sin(πz)/π · Γ(1 − z)`, which is `1/Γ(z)` by reflection (Olver's and
Temme's proof). Independence of `ε` is Cauchy's theorem on the annular sector between two radii.

*Needs:* Mathlib `Complex.Gamma_mul_Gamma_one_sub`, `Complex.Gamma_eq_integral`, Cauchy's theorem
(`Complex.integral_boundary_rect_eq_zero_of_differentiableOn` in the variable `log t`), the
identity theorem.

**Checks.**
- `z = 1`: `sin π = 0` and `(1/2π) ∫ exp(εe^{iθ}) dθ = 1`, the mean value of `exp` on the circle.
- `z = 0`: `(ε/2π) ∫ exp(εe^{iθ} + iθ) dθ = 0`, matching `1/Γ(0) = 0`.
- `z = −1`: the ray term vanishes and `(ε²/2π) ∫ exp(εe^{iθ} + 2iθ) dθ = 0`, matching
  `1/Γ(−1) = 0`; with the circle traversed clockwise the check at `z = 1` would give `−1`.

### 8.2 Temme's integral

For `Re z > 0`, `1/Γ(z) = (e^z z^{1−z}/2π) ∫_{−π}^{π} e^{−zΦ(t)} dt`,
`Φ(t) = 1 − t cot t + log(t/sin t)` (`Complex.inv_Gamma_eq_temme`, with `Φ` the helper `temmePhi`,
whose value at the removable point is `Φ(0) = 0`; DLMF 5.9.2_5); `Φ` is real-analytic and
nonnegative on `(−π, π)`.

Route: 8.1 with the loop replaced by the steepest-descent path through the saddle `t = z` of
`e^t t^{−z}`. For real `z = x > 0` that path is `t = x (θ/sin θ) e^{iθ}`, `θ ∈ (−π, π)` (Temme,
§3.6.3, (3.34), p. 69), on which `e^t t^{−x} = e^x x^{−x} e^{−xΦ(θ)}`; extend to `Re z > 0` by the
identity theorem.

*Needs:* 8.1.

**Checks.**
- `z = 1`: `(e/2π) ∫ e^{−Φ(t)} dt = 1`.
- Laplace's method at `t = 0`, where `Φ(t) = t²/2 + O(t⁴)`, gives `1/Γ(x) ∼ e^x x^{½−x}/√(2π)`,
  Stirling's formula.

### 8.3 Loop and Pochhammer contours for the Beta integral

With the contours pinned (DLMF 5.12.10–5.12.12):

The loop around `1` (`Complex.beta_loop_one`; Temme, §3.2.7, p. 49): for `Re a > 0`, every `b`
and `0 < ε < 1`,

```text
(2πi)⁻¹ [(e^{−iπ(b−1)} − e^{iπ(b−1)}) ∫₀^{1−ε} t^{a−1}(1 − t)^{b−1} dt
         + i ε^b ∫_{−π}^{π} (1 + εe^{iθ})^{a−1} e^{ibθ} dθ] = Γ(a) Γ(a + b)⁻¹ Γ(1 − b)⁻¹
```

This is `(2πi)⁻¹ ∫₀^{(1+)} t^{a−1}(t − 1)^{b−1} dt` on the path from `0` along `(0, 1 − ε]` with
`ph(t − 1) = −π`, around `|t − 1| = ε` counterclockwise, and back with `ph(t − 1) = π`; the right
side is `(sin πb/π) B(a, b)` off the poles.

The loop around `0` (`Complex.beta_loop_zero`): for `Re b > 0`, `a ∉ {0, −1, −2, …}` and
`0 < ε < 1`,

```text
(e^{2πia} − 1) ∫_ε^∞ t^{a−1}(1 + t)^{−a−b} dt + i ε^a ∫₀^{2π} e^{iaθ}(1 + εe^{iθ})^{−a−b} dθ
  = (e^{2πia} − 1) Γ(a)Γ(b)/Γ(a + b)
```

This is `∫_∞^{(0+)} t^{a−1}(1 + t)^{−a−b} dt` on the path from `+∞` to `ε` with `ph t = 0`,
around `|t| = ε` counterclockwise, and back to `+∞` with `ph t = 2π`, multiplied out by
`e^{2πia} − 1`, so that it also holds at the positive integers.

The Pochhammer contour (`Complex.beta_pochhammer`; Whittaker–Watson, §12.43, p. 256; Olver,
Ch. 2, Ex. 1.6, p. 38): for all `a`, `b` and `0 < ε < ½`, with `f(t) = t^{a−1}(1 − t)^{b−1}` and

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

*Needs:* 2.1; Mathlib `Complex.Gamma_mul_Gamma_one_sub`, the identity theorem.

**Checks.**
- The loop around `1` at `b = 1`: the factor `e^{0} − e^{0} = 0`, the circle term
  `(2πi)⁻¹ iε ∫ (1 + εe^{iθ})^{a−1} e^{iθ} dθ` is `0` by Cauchy, and `Γ(1 − 1)⁻¹ = 0`.
- The loop around `1` at `a = 1`, `b = ½`: the right side is `Γ(1)/(Γ(3/2)Γ(½)) = 2/π`.
- The loop around `0` at `a = 1`: both sides are `0`.
- The Pochhammer contour at `a = b = ½`: the right side is `−4π² e^{πi}/(π · 1) = 4π`.

### Examples

- Hankel's integral at `z = ½`: the ray term is `π⁻¹ ∫_ε^∞ e^{−r} r^{−1/2} dr`, which tends to
  `Γ(½)/π = 1/√π` as `ε → 0`, and the circle term `(ε^{1/2}/2π) ∫ exp(εe^{iθ} + iθ/2) dθ` tends to
  `0`; so `1/Γ(½) = 1/√π`.

### Dependencies

Layer 2; Mathlib.

## Layer 9: integrals along vertical lines and along the real line

### 9.1 The vertical-line Beta integrals

- For `Re w > 0`, `Re z > 0` and `Re(a + b) > 1`,
  `(2π)⁻¹ ∫_ℝ (w + it)^{−a} (z − it)^{−b} dt = Γ(a + b − 1) (w + z)^{1−a−b} Γ(a)⁻¹ Γ(b)⁻¹`
  (`Complex.integral_vertical_beta`; DLMF 5.12.8);
- for `0 < c < 1` and `Re(a + b) > 0`,
  `(2π)⁻¹ ∫_ℝ (c + iy)^{−a} (1 − c − iy)^{−1−b} dy = Γ(a + b) Γ(a)⁻¹ Γ(1 + b)⁻¹`
  (`Complex.integral_vertical_beta_one_sub`; DLMF 5.12.9).

All powers are principal; their bases have positive real part. DLMF prints the right sides as
`(w + z)^{1−a−b}/((a + b − 1) B(a, b))` and `1/(b B(a, b))`; the forms above hold for all `a`, `b`
in the stated ranges, including the poles of `Γ(a)`, `Γ(b)`.

Route: for the first, the complex Gamma integral (AsymptoticExpansions 4.1) at `w + it` gives
`(w + it)^{−a} = Γ(a)⁻¹ ∫₀^∞ u^{a−1} e^{−(w+it)u} du` for `Re a > 0`; Fourier inversion in `t` and
Euler's Beta integral, then continuation in `a`, `b`. The second is the first after the Möbius
change of variable `t ↦ t/(t − 1)` on the line, or directly the Mellin inversion of the half-line
Beta integral.

*Needs:* AsymptoticExpansions 4.1; 2.1; Mathlib `mellinInv_mellin_eq`.

**Checks.**
- The first at `a = b = 1`: `(2π)⁻¹ ∫ dt/((w + it)(z − it)) = 1/(w + z)`.
- The second at `a = 1`: `1` for every `b`; at `(a, b) = (2, 1)`: `2`.

### 9.2 Barnes's Beta integral and the modulus integral

- For `Re(a + b) > 0`, `−Re a < c < Re b` and `z ∈ slitPlane`,
  `(2π)⁻¹ ∫_ℝ Γ(c + iy + a) Γ(b − c − iy) z^{−c−iy} dy = Γ(a + b) z^a (1 + z)^{−a−b}`
  (`Complex.integral_Gamma_mul_Gamma_mul_cpow`; Andrews–Askey–Roy, (2.4.4), p. 86, as the Mellin
  pair of `(1 + x)^{−a−b}`; DLMF 5.13.1).
- For real `a > 0` and `0 < b < π`,
  `(2π)⁻¹ ∫_ℝ |Γ(a + it)|² e^{(2b−π)t} dt = Γ(2a)/(2 sin b)^{2a}`
  (`Complex.integral_norm_Gamma_sq_mul_exp`; DLMF 5.13.2).

Route: for `z = u > 0` the first is SpecialFunctionsHypergeometric 6.3's Mellin–Barnes integral of
`(1 + u)^{−a−b}` after `s ↦ s + a`. Both sides are holomorphic in `z` on the slit plane, the
integrand being `O((1 + |y|)^K e^{−(π − |ph z|)|y|})` by AsymptoticExpansions 8.6; the identity
theorem. The modulus integral is the first with `a = b`, `c = 0` and `z = e^{i(2b−π)}`, where
`|ph z| < π`, and `z^a (1 + z)^{−2a} = (2 cos(b − π/2))^{−2a}`.

*Needs:* SpecialFunctionsHypergeometric 6.3; AsymptoticExpansions 8.6.

**Checks.**
- The first at `a = b = ½`, `c = 0`, `z = 1`:
  `(2π)⁻¹ ∫ |Γ(½ + iy)|² dy = (2π)⁻¹ ∫ π/cosh πy dy = ½`, and the right side is `Γ(1) · ½ = ½`.
- The modulus integral at `b = π/2`, `a = ½`: `(2π)⁻¹ ∫ π/cosh πt dt = ½ = Γ(1)/2`.

### 9.3 Ramanujan's integral

For `Re(a + b + c + d) > 3`,

```text
∫_ℝ Γ(a + t)⁻¹ Γ(b + t)⁻¹ Γ(c − t)⁻¹ Γ(d − t)⁻¹ dt
  = Γ(a + b + c + d − 3) Γ(a + c − 1)⁻¹ Γ(a + d − 1)⁻¹ Γ(b + c − 1)⁻¹ Γ(b + d − 1)⁻¹,
```

the integrand being integrable on the real line (`Complex.integral_inv_Gamma_four`;
Paris–Kaminski, §3.3.5, (3.3.44), p. 100; DLMF 5.13.4).

Route: for real `a, b, c, d`, the Fourier transform of `t ↦ 1/(Γ(a + t)Γ(c − t))` is supported in
`[−π, π]` and equals `(2 cos(x/2))^{a+c−2} e^{ix(c−a)/2}/Γ(a + c − 1)` there, by Fourier inversion
of the exponential form of 2.1 (Paris–Kaminski, (3.3.41)–(3.3.42), p. 100); Parseval and the
exponential form of 2.1 give the formula. Continue to complex parameters one at a time by the
identity theorem. Integrability uses `|Γ(a + t)/Γ(b + t)| ∼ t^{Re(a−b)}` (ZerosOfLFunctions 1.2)
and the reflection formula for the factors `Γ(c − t)⁻¹`, `Γ(d − t)⁻¹`.

*Needs:* 2.1; ZerosOfLFunctions 1.2; Mathlib Fourier inversion and Plancherel.

**Checks.**
- `a = b = c = d = 1`: `∫ dt/(Γ(1 + t)²Γ(1 − t)²) = ∫ (sin πt/(πt))² dt = 1`, and the right side
  is `Γ(1)/Γ(1)⁴ = 1`.

### 9.4 The de Branges–Wilson integral

For `a : Fin 4 → ℂ` with `Re a_k > 0` (`Complex.integral_deBrangesWilson`; Andrews–Askey–Roy,
Thm. 3.6.2, p. 151, and (3.6.1), p. 152; DLMF 5.13.5),

```text
(4π)⁻¹ ∫_ℝ ∏_k Γ(a_k + it) Γ(a_k − it) · Γ(2it)⁻¹ Γ(−2it)⁻¹ dt
  = ∏_{j<k} Γ(a_j + a_k) · Γ(a₁ + a₂ + a₃ + a₄)⁻¹.
```

Route: Andrews–Askey–Roy derive it from an integral analogue of a well-poised hypergeometric sum
(§3.6) by a change of parameters and the reflection formula; equivalently, by Barnes-type contour
arguments that reduce it to Barnes's first lemma (SpecialFunctionsHypergeometric 6.3).
Integrability: `|Γ(2it)Γ(−2it)|⁻¹ = 2|t| sinh(2π|t|)/π` by reflection, against the decay of the
eight Gamma factors (AsymptoticExpansions 8.6).

*Needs:* SpecialFunctionsHypergeometric 6.3; AsymptoticExpansions 8.6.

**Checks.**
- `a = (½, ½, ½, ½)`: the right side is `Γ(1)⁶/Γ(2) = 1`; the left side is
  `π² ∫_ℝ t sinh πt/cosh³ πt dt = 1`, by `|Γ(½ + it)|² = π/cosh πt` (4.4) and one integration by
  parts, which turns it into `(π/2) ∫_ℝ sech² πt dt = 1`.
- The integrand at `t = 0` is the junk quotient by `Γ(0)² = 0`; the point is null.

### Examples

- The modulus integral at `a = 1`, `b = π/2`: with `|Γ(1 + it)|² = πt/sinh πt` (the input of 4.4),
  `(2π)⁻¹ ∫_ℝ πt/sinh πt dt = ¼ = Γ(2)/2²`.

### Dependencies

Layer 2; Layer 4 (4.4); SpecialFunctionsHypergeometric 6.3; ZerosOfLFunctions 1.2;
AsymptoticExpansions 4.1, 8.6.

## Layer 10: Selberg-type integrals

### 10.1 Carlson's and Landau's theorems

Auxiliary:
- **Carlson's theorem.** Let `f` be holomorphic on `{Re z > 0}` and continuous on `{Re z ≥ 0}`,
  with `|f(z)| ≤ C e^{τ|z|}` there for some `τ`, and `|f(iy)| ≤ C e^{c|y|}` for real `y`, with
  `c < π`. If `f(n) = 0` for every `n : ℕ`, then `f = 0` on `{Re z ≥ 0}`
  (`Complex.eq_zero_of_carlson`; Andrews–Askey–Roy, Thm. 2.8.1 and the remark after it, p. 110).
- **Landau's theorem.** Let `w ≥ 0` and `g > 0` be measurable on a measure space, let
  `F(s) = ∫ w g^s` converge for real `s` in a nonempty interval `(s₀, s₁)`, `s₀ < s₁`, and suppose
  `F` continues holomorphically from `(s₀, s₁)` to a neighbourhood of `[s₀′, s₁)` with `s₀′ < s₀`.
  Then `∫ w g^s` converges for `s ∈ (s₀′, s₁)` and equals the continuation there. (The proof
  expands `F` in a power series at a point `s*` of `(s₀, s₁)` and splits the integral at `g = 1`.
  On `{g > 1}`, `g^s ≤ g^{s*}` for `s < s*`, so that part converges. On `{g ≤ 1}`, the Taylor
  coefficients at `s*` are `∫ w g^{s*} (log g)^k`, of sign `(−1)^k`, so every term of the series at
  `s < s*` is nonnegative and monotone convergence applies.) With `g = e^{−t}` this is the theorem
  that a Laplace–Stieltjes integral with monotone determining function is singular at the real
  point of its axis of convergence.

SpecialFunctionsHypergeometric 4.2 owns the periodic case of Carlson's theorem, which is all 10.2
uses; the general theorem is needed for Dyson's integral (10.4), whose normalized integral is not
periodic in `b`.

Route: Andrews–Askey–Roy prove the bounded case by Selberg's residue argument (p. 110). The
general case by dividing `f` by `sin πz` and Phragmén–Lindelöf in the quadrants
(`PhragmenLindelof.eq_zero_on_quadrant_I` and its siblings).

*Needs:* Mathlib Phragmén–Lindelöf, `Complex.sin`, the identity theorem.

**Checks.**
- `f(z) = sin πz` vanishes on `ℕ` and has type exactly `π` on the imaginary axis; it shows `c < π`
  is necessary.

### 10.2 Selberg's and Aomoto's integrals

For `n ≥ 1`, `0 ≤ m ≤ n`, `Re a > 0`, `Re b > 0` and
`Re c > −min(1/n, Re a/(n − 1), Re b/(n − 1))`, stated as `1 + n Re c > 0`,
`Re a + (n − 1) Re c > 0` and `Re b + (n − 1) Re c > 0` so that `n = 1` needs no division by `0`,

```text
∫_{[0,1]ⁿ} t₁ ⋯ t_m |Δ(t)|^{2c} ∏_k t_k^{a−1} (1 − t_k)^{b−1} dt
  = Γ(1 + c)^{−n} ∏_{k=1}^{m} (a + (n − k)c)/(a + b + (2n − k − 1)c)
      · ∏_{k=1}^{n} Γ(a + (n − k)c) Γ(b + (n − k)c) Γ(1 + kc)/Γ(a + b + (2n − k − 1)c),
```

with the integrand integrable (`TauCeti.integral_selberg_aomoto`); `m = 0` is Selberg's integral
(Andrews–Askey–Roy, Thms. 8.1.1–8.1.2, p. 402; Forrester, (4.1)–(4.3), p. 133; Beals–Wong, §2.7,
p. 36; DLMF 5.14.3–5.14.4).

Route: Aomoto's recurrence in `m` by integration by parts in one coordinate (Andrews–Askey–Roy,
§8.2; Forrester, §4.6, p. 165), which reduces the formula to `m = 0` and gives the shift
`a ↦ a + 1` of Selberg's integral; for `Re c ≥ ½`, the ratio of the two sides is `1`-periodic in
`a`, bounded as Carlson's theorem requires (by 2.2 and the Gamma bounds of AsymptoticExpansions
8.6), and `1` at large integers by the dimension recursion
`(a + nc) S_{n+1}(a, 1, c) = S_n(a, 1 + 2c, c)`, so it is `1` by the periodic Carlson lemma
(SpecialFunctionsHypergeometric 4.2). Holomorphy in `c` extends to `Re c > 0`, and Landau's
theorem (10.1), applied in the real parameter `Re c` to the positive integrand, extends
integrability and the formula to the full range.

*Needs:* 10.1 (Landau), 2.2; Layer 2; SpecialFunctionsHypergeometric 4.2; AsymptoticExpansions
8.6; ZerosOfLFunctions 1.3; Mathlib `Matrix.det_vandermonde`.

**Checks.**
- `n = 1`: Euler's Beta integral (and `m = 1` gives `B(a + 1, b)`).
- `c = 0`: the product of `n` Beta integrals.
- `n = 2`, `a = b = 1`, `c = 1`: `∫∫ (t₁ − t₂)² = 1/6`, and the right side is
  `Γ(2)⁻² · Γ(2)Γ(2)Γ(2)/Γ(4) · Γ(1)Γ(1)Γ(3)/Γ(3) = 1/6`.
- At `n = 2`, `a = b = 1`, the range `Re c > −½` is sharp: `∫∫ |t₁ − t₂|^{2c}` diverges at
  `c = −½`.

### 10.3 The Laguerre and Hermite limits

For `0 ≤ m ≤ n`, `Re a > 0` and `Re c > −min(1/n, Re a/(n − 1))`
(`TauCeti.integral_selberg_laguerre`; Andrews–Askey–Roy, Cor. 8.2.2, p. 406; Forrester,
Prop. 4.7.3, p. 174; DLMF 5.14.5),

```text
∫_{[0,∞)ⁿ} t₁ ⋯ t_m |Δ(t)|^{2c} ∏_k t_k^{a−1} e^{−t_k} dt
  = ∏_{k=1}^{m} (a + (n − k)c) · ∏_{k=1}^{n} Γ(a + (n − k)c) Γ(1 + kc) / Γ(1 + c)ⁿ;
```

and for `Re c > −1/n`, Mehta's integral
`(2π)^{−n/2} ∫_{ℝⁿ} |Δ(t)|^{2c} ∏_k e^{−t_k²/2} dt = ∏_{k=1}^{n} Γ(1 + kc)/Γ(1 + c)ⁿ`
(`TauCeti.integral_selberg_hermite`; Andrews–Askey–Roy, Cor. 8.2.3, p. 407; Forrester,
Prop. 4.7.1, p. 173; DLMF 5.14.6).

Route: the Laguerre integral is the limit `b → ∞` of 10.2 after `t ↦ t/b`, by dominated
convergence and `Γ(b + x)/Γ(b + y) ∼ b^{x−y}`; Mehta's integral is the limit `a = b → ∞` of 10.2
after `t ↦ ½ + t/(2√(2a))`, likewise. Integrability on the full ranges by Landau's theorem as in
10.2.

*Needs:* 10.1, 10.2; ZerosOfLFunctions 1.2 (Gamma quotients).

**Checks.**
- Mehta's integral at `n = 2`, `c = 1`:
  `(2π)⁻¹ ∫∫ (t₁ − t₂)² e^{−(t₁²+t₂²)/2} = 2 = Γ(2)Γ(3)/Γ(2)²`.
- The Laguerre integral at `n = 1`, `m = 1`: `∫₀^∞ t^{a} e^{−t} dt = a Γ(a)`, and the right side is
  `a · Γ(a) Γ(1 + c)/Γ(1 + c)`.

### 10.4 Dyson's integral

For `Re b > −1/n`,
`(2π)^{−n} ∫_{[−π,π]ⁿ} ∏_{j<k} |e^{iθ_j} − e^{iθ_k}|^{2b} dθ = Γ(1 + bn)/Γ(1 + b)ⁿ`
(`TauCeti.integral_dyson`; Forrester, Prop. 4.7.2, p. 173; DLMF 5.14.7).

Route: for `b ∈ ℕ` the integral is the constant term of `∏_{j≠k} (1 − x_j/x_k)^b`, which is the
multinomial coefficient `(nb)!/(b!)ⁿ` by Good's proof of Dyson's conjecture (Lagrange
interpolation gives the recursion of the constant terms; Andrews–Askey–Roy, Thm. 8.8.1, p. 427).
Extend to `Re b ≥ 0` by Carlson's theorem (10.1) applied to the left side multiplied by
`Γ(1 + b)ⁿ/Γ(1 + bn)` after the normalization that makes its type on the imaginary axis less
than `π`; then to `Re b > −1/n` by Landau's theorem.

*Needs:* 10.1; Mathlib `MvPolynomial` or Laurent polynomials for the constant term.

**Checks.**
- `n = 2`, `b = 1`: `(2π)⁻² ∫∫ |e^{iθ₁} − e^{iθ₂}|² = 2 = Γ(3)/Γ(2)²`.
- `n = 1`: both sides are `1`.
- `n = 3`, `b = 1`: the constant term of `∏_{j≠k} (1 − x_j/x_k)` is `3!/1 = 6 = Γ(4)/Γ(2)³`.

### Examples

- At `n = 2`, `m = 0`, `c = 1`: Selberg's integral at `a = b = 1` gives
  `∫∫_{[0,1]²} (t₁ − t₂)² = 1/6`, and the Laguerre integral at `a = 1` gives
  `∫∫_{[0,∞)²} (t₁ − t₂)² e^{−t₁−t₂} = Γ(1)Γ(2) · Γ(2)Γ(3)/Γ(2)² = 2`, twice the variance of the
  exponential distribution.

### Dependencies

Layer 2; SpecialFunctionsHypergeometric 4.2; AsymptoticExpansions 8.6; ZerosOfLFunctions 1.2,
1.3.

## Downstream consumers

Later roadmaps that need Gauss's multiplication formula for every `n` (4.2), the Beta integrals
and their loop contours (2.1, 8.3), the multidimensional Beta integrals (2.2, 2.3, Layer 10) or
the polygamma functions (1.3–1.5) cite those sections.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Explicit Stirling theory**: Stirling's series and its remainders, the explicit bounds on the
  positive axis and on vertical lines that follow from it, Binet's two formulas for `log Γ`, the
  scaled function `Γ*`, Gudermann's series, and the asymptotics of Gamma quotients beyond the
  leading term. These rest on the periodic Bernoulli remainder of the Euler–Maclaurin formula.
- **Mellin–Barnes integrals with `ζ`** for `log Γ` and `ψ`.
- **The continued fraction** for Binet's function.
- **The Barnes `G`-function** (AnalyticNumberTheoryPartII §4.3).
- **Hölder's theorem** that `Γ` satisfies no algebraic differential equation (Remmert, Ch. 2,
  §2.6, pp. 46–47).
- **Arithmetic analogues**: Gauss and Jacobi sums as finite-field Gamma and Beta functions, and
  Morita's `p`-adic Gamma function (Andrews–Askey–Roy, §§1.10–1.12).
- **The `q`-Gamma and `q`-Beta functions**, which belong with the basic hypergeometric functions.
- **Decimal values and extrema**: numerical constants, the minimum of `Γ` on `(0, ∞)` and the
  asymptotic location of the extrema of `Γ` on the negative axis.
- **Graphics, physical applications and numerical computation.**

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes special
functions on top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes),
drawing on DLMF and on Andrews–Askey–Roy, Temme, Olver and Duverney. Its directories
`DLMF/Gamma/` and `DLMF/Selberg/` provide source material for every layer: the Pochhammer
identities, the special values and Gauss's digamma theorem, the multiplication formulas, the
inequalities (7.4 is stated there without proof), the Taylor series (the odd series of 6.1 on
`|z| < 1` only), the products, the integral representations (Hankel's integral 8.1 is not stated
there), the Beta integrals (the loop forms of 8.3 are not stated there), the Barnes-type integrals
(9.4 is stated without proof), the polygamma functions, the residue of `ψ` at its poles, the
rational series of 5.1, Kummer's Fourier series 4.6 and the limit characterization of 4.1
(stated there with an extra positivity hypothesis), Liouville's integrals 2.3, and the Dirichlet,
Selberg, Aomoto, Mehta and Dyson integrals. It has no counterpart of Wielandt's theorem (4.1).

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Gamma/SeriesExpansions`, `Gamma/DigammaPoles`, `Gamma/Polygamma`, `Gamma/SpecialValues` |
| 2 | `Gamma/BetaFunction/ParameterIntegrals`, `Gamma/BetaFunction/Cosine`, `Gamma/Dirichlet`, `Gamma/Multidimensional/Liouville` |
| 3 | `Gamma/IntegralRepresentations/HankelAndGaussian`, `Gamma/IntegralRepresentations/PrymAndOscillatory`, `Gamma/IntegralRepresentations/FrullaniAndMoments`, `Gamma/Polygamma` |
| 4 | `Gamma/Characterizations`, `Gamma/Multiplication`, `Gamma/Pochhammer`, `Gamma/SpecialValues`, `Gamma/GaussDigamma`, `Gamma/KummerFourier` |
| 5 | `Gamma/RationalSeries`, `Gamma/AlternatingDigamma`, `Gamma/Integrals/FourierAndTrigamma`, `Gamma/Products` |
| 6 | `Gamma/SeriesExpansions`, `Gamma/Basic/Definitions` |
| 7 | `Gamma/Inequalities` |
| 8 | `Gamma/IntegralRepresentations/HankelAndGaussian`, `Gamma/BetaFunction/ComplexTrigonometric` |
| 9 | `Gamma/BetaFunction/Vertical`, `Gamma/Integrals/BarnesAndRamanujan`, `Gamma/Integrals/FourierAndTrigamma` |
| 10 | `Gamma/Multidimensional/SelbergLimits`, `Gamma/Multidimensional/Dyson`, `Selberg/IntegrationByParts`, `Selberg/DimensionAndParameters`, `Selberg/ContinuationAndAomoto` |

## References

- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Encyclopedia of Mathematics and its
  Applications 71, Cambridge University Press, 1999: Ch. 1 (§§1.1–1.9 and Exercises 19–22),
  §2.4, §2.8, §3.6, and Ch. 8 (§§8.1–8.2, 8.8).
- R. Beals and R. Wong, *Special Functions: A Graduate Text*, Cambridge Studies in Advanced
  Mathematics 126, Cambridge University Press, 2010: Ch. 2 (§§2.4, 2.7).
- D. Duverney, *An Introduction to Hypergeometric Functions*, Birkhäuser, 2024: Ch. 2 (§2.2).
- P. J. Forrester, *Log-Gases and Random Matrices*, London Mathematical Society Monographs 34,
  Princeton University Press, 2010: Ch. 4 (§§4.1, 4.6, 4.7).
- N. N. Lebedev, *Special Functions and Their Applications*, Dover, 1972: Ch. 1 (§1.3).
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 5
  (R. A. Askey and R. Roy), <https://dlmf.nist.gov/5>. Equation numbers refer to this release.
- F. W. J. Olver, *Asymptotics and Special Functions*, A K Peters, 1997: Ch. 2 (§§1–2 and their
  exercises).
- R. B. Paris and D. Kaminski, *Asymptotics and Mellin–Barnes Integrals*, Encyclopedia of
  Mathematics and its Applications 85, Cambridge University Press, 2001: §3.3.5.
- R. Remmert, *Classical Topics in Complex Function Theory*, Graduate Texts in Mathematics 172,
  Springer, 1998: Ch. 2 (§§2.1–2.6 and §3.4).
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996: Ch. 3 (§§3.2–3.4, 3.6.3).
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927: Ch. XII (§§12.13–12.5).

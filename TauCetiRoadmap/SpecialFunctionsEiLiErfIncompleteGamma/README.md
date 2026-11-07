# Roadmap: Exponential, logarithmic, error and incomplete Gamma functions

**Summary.** This roadmap builds the theory of Chapters 6, 7 and 8 of the NIST *Digital Library
of Mathematical Functions* (DLMF; see [References](#references)) as a library. It covers three
chapters:
- **Chapter 8:** the incomplete Gamma functions `γ(a, z)`, `Γ(a, z)`, `P`, `Q` and Tricomi's
  entire function `γ*(a, z)`; the generalized exponential integral `E_p(z)`; the generalized sine
  and cosine integrals; and the incomplete Beta function `B_x(a, b)`.
- **Chapter 6:** the exponential integrals `E₁`, `Ein` and `Ei`; the logarithmic integral `li`;
  the sine and cosine integrals `Si`, `si`, `Ci`, `Cin`, `Shi`, `Chi`; and their auxiliary
  functions `f`, `g`.
- **Chapter 7:** the complex error functions `erf`, `erfc` and `w`; the Fresnel integrals `C`,
  `S` and `ℱ` with their auxiliary functions; the Goodwin–Staton integral; the inverse error
  functions; the repeated integrals `iⁿ erfc`; and the Voigt functions.

The roadmap covers:
- definitions as entire or principal-branch functions, and analytic continuation in logarithmic
  coordinates;
- special values, symmetry, interrelations, and representations by Kummer's function and
  `₁F₂`;
- power series, recurrences and derivatives;
- integral representations, including the Mellin–Barnes integrals;
- inequalities and continued fractions, with Pincherle's theorem;
- asymptotic expansions for large argument and for large parameter with a fixed ratio;
- zeros;
- integrals, Laplace transforms and sums;
- the Gibbs phenomenon.

Chapter 8 is the base: Chapter 6 is the case `E₁ = Γ(0, ·)`, and Chapter 7 is the case
`erf z = z γ*(½, z²)` of Tricomi's entire function (equivalently `erf z = π^{−1/2} γ(½, z²)` for
`Re z > 0`, where `(z²)^{1/2} = z`). Layers 1–6 use nothing from Chapters 6 and 7. The Chapter 8
formulas that involve `E₁`, `erf`, `erfc` or Dawson's integral are placed after those functions,
in Layers 7, 11 and 13.

The general asymptotic methods are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md) (DLMF Chapter 2): the expansion API,
Watson's lemma, the rotation of the path, Laplace's method, transcendental equations, the Mellin
tools and three-term recurrences. Dawson's integral and the repeated Gaussian integrals `Hh_n` are
consumed from [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md).

Suggested home: `TauCeti/Analysis/SpecialFunctions/`, beside Tau Ceti's existing `Erf.lean`,
`IncompleteGamma.lean`, `IncompleteBeta.lean` and `LogIntegral.lean`. Suggested files, grouped by
layer:
- Layers 1–6: `IncompleteGamma/Complex.lean`, `IncompleteGamma/Continuation.lean`,
  `IncompleteGamma/Series.lean`, `IncompleteGamma/Integrals.lean`,
  `IncompleteGamma/ContinuedFraction.lean`, `IncompleteGamma/Asymptotics.lean`,
  `IncompleteGamma/Zeros.lean`.
- Layers 7–10: `ExpIntegral/Generalized.lean`, `ExpIntegral/Basic.lean`,
  `ExpIntegral/SineCosine.lean`, `ExpIntegral/GeneralizedSineCosine.lean`.
- Layers 11–14: `Erf/Complex.lean`, `Erf/Fresnel.lean`, `Erf/Integrals.lean`,
  `Erf/Asymptotics.lean`, `Erf/Zeros.lean`, `Erf/Inverse.lean`, `Erf/Repeated.lean`,
  `Erf/Voigt.lean`.
- Layer 15: `IncompleteBeta/Hypergeometric.lean`.
- The general Pincherle theorem of 4.1: `TauCeti/Algebra/ContinuedFractions/Pincherle.lean`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Incomplete Gamma: definitions and continuation** (DLMF 8.2.1–8.2.14, with 8.4.2, 8.4.12,
   8.7.1 and the bridge to Tau Ceti's real functions).
2. **Special values, Kummer representations, series and recurrences** (DLMF 8.4.5, 8.4.7–8.4.11,
   8.5.1–8.5.2, 8.7.2–8.7.3, 8.8.1–8.8.13, 8.8.15–8.8.19, 8.15.1).
3. **Integral representations, integrals and sums** (DLMF 8.6.1–8.6.5, 8.6.7–8.6.12,
   8.14.1–8.14.6, 8.22.2–8.22.3).
4. **Continued fractions and inequalities** (DLMF 8.9.1–8.9.2, 8.10.1–8.10.13), with Pincherle's
   theorem for continued fractions.
5. **Asymptotics of the incomplete Gamma functions** (DLMF 8.11.1–8.11.9, 8.11.12–8.11.19).
6. **Zeros of `γ*`** (DLMF §8.13(i) with 8.13.1, and §8.13(iii) (a)–(c)).
7. **The generalized exponential integral** (DLMF 8.4.4, 8.4.13, 8.4.15, 8.8.14,
   8.19.1–8.19.15, 8.19.17–8.19.27, 8.20.1–8.20.6, 8.22.1, and 2.11.5–2.11.7).
8. **Exponential and logarithmic integrals** (DLMF 6.2.1–6.2.8, 6.4.1–6.4.3, 6.5.1–6.5.2,
   6.6.1–6.6.4, 6.7.1–6.7.8, 6.8.1–6.8.3, 6.9.1, 6.10.1–6.10.3, 6.11.1, 6.12.1–6.12.2, 6.13.1,
   6.14.1, 6.14.4, and 2.5.49).
9. **Sine and cosine integrals** (DLMF 6.2.9–6.2.21, 6.4.4–6.4.7, 6.5.3–6.5.7, 6.6.5–6.6.6,
   6.7.9–6.7.14, 6.12.3–6.12.8, 6.13.2, 6.14.2–6.14.3, 6.14.5–6.14.7, 6.15.1–6.15.4,
   6.16.1–6.16.4).
10. **Generalized sine and cosine integrals** (DLMF 8.21.1–8.21.15, 8.21.18–8.21.27).
11. **Error functions and Fresnel integrals** (DLMF 7.2.1–7.2.12, 7.4.1–7.4.8, 7.5.1–7.5.13,
    7.6.1–7.6.7, 7.10.1–7.10.4, 7.11.1–7.11.4, 7.11.6–7.11.8, and 8.4.1, 8.4.3, 8.4.6, 8.4.14),
    with the symmetries of Dawson's integral.
12. **Integral representations, inequalities, continued fractions and integrals of the error
    functions** (DLMF 7.7.1–7.7.16, 7.8.1–7.8.8, 7.9.1–7.9.3, 7.14.1–7.14.8).
13. **Asymptotics and zeros of the error functions** (DLMF 7.12.1–7.12.7, §7.13 with
    7.13.1–7.13.7), and the incomplete Gamma functions near the transition point
    (DLMF 8.11.10–8.11.11).
14. **Inverse error functions, repeated integrals and Voigt functions** (DLMF 7.17.1–7.17.6,
    7.18.1–7.18.9, 7.18.12–7.18.14, 7.19.1–7.19.11).
15. **Incomplete Beta functions** (DLMF 8.17.1–8.17.24 with 8.17.9 for `0 ≤ x < ½`, and 8.18.1).

**What this roadmap owns:** the functions and formulas listed above, with the hypotheses and
conventions specified in the layers. It also owns the following auxiliary results, which the
layers need and which neither Mathlib nor Tau Ceti provides:

| Result | Subsection |
|---|---|
| Pincherle's theorem: a continued fraction converges if and only if its three-term recurrence has a minimal solution `f` with `f(0) ≠ 0`, and its value is `−f(1)/f(0)` | 4.1 |
| The reduction-of-order criterion for minimality, and the determinant formula for the continuants | 4.1 |
| Explicit minimal solutions for the recurrences of 8.9.1, 8.9.2, 7.18.13 and 8.17.22 | 4.2, 14.2, 15.4 |
| `∫₀^∞ e^{−zt} t^{s−1}/(1 + t) dt` and `∫₀^∞ e^{−zt}(1 + t)^{a−1} dt` as Laplace transforms in a sector | 3.1 |
| The circle form of Hankel's loop integral for `γ(a, z)` | 3.2 |
| The even contraction of a `GenContFract` | 12.3 |
| Rouché's theorem, from the argument principle, for counting zeros near their asymptotic positions | 13.3–13.4 |
| The uniform Gaussian estimates with a moving endpoint, for the transition region | 13.5 |

**What this roadmap does not own:**
- **The real functions Tau Ceti already has:** `TauCeti.lowerIncompleteGamma`,
  `TauCeti.regularizedGamma`, `TauCeti.regularizedIncompleteBeta`,
  `TauCeti.inverseRegularizedGamma`, `TauCeti.inverseRegularizedIncompleteBeta`,
  `TauCeti.Real.erf`, `TauCeti.Real.erfc`, `Real.erfInv` and the offset logarithmic integral
  `TauCeti.Real.logIntegral`, with their existing API. This roadmap restricts its complex
  functions to them and does not restate their real theory.
- **Dawson's integral `TauCeti.dawson` and the repeated Gaussian integrals
  `Hh_n = TauCeti.repeatedGaussianIntegral n`**, with their basic API, owned by
  [SpecialFunctionsParabolicCylinder §5.1](../SpecialFunctionsParabolicCylinder/README.md#51-hermite-cases)
  and [§5.3](../SpecialFunctionsParabolicCylinder/README.md#53-the-repeated-gaussian-integrals).
  Their Chapter 7 formulas (7.5.1, 7.6.3, 7.18.12 and the others listed in the layers) are owned
  here.
- **Probability statements:** the normal cdf (DLMF 7.20.1), the gamma, beta, Poisson and binomial
  cdfs, and their quantiles.
- **Formulas through other special functions**, listed in
  [Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement):
  Kummer's second function `U`, Whittaker functions, the parabolic cylinder functions, modified
  and spherical Bessel functions, Laguerre polynomials, Chebyshev expansions, the continued Gauss
  function `₂F₁` and the Hurwitz zeta function at complex shift.
- **The uniform asymptotic expansions of DLMF §8.12 and §8.18(ii)**, which rest on the
  coalescence of a saddle point with a pole, and exponentially improved expansions. The
  large-parameter statements that this roadmap does own are listed with their uniformity:
  8.11.6–8.11.7 (uniform for `λ` in compact subsets, 5.3), 8.11.18 (uniform for `x ≤ 1 − δ`,
  5.4), 8.20.6 (uniform for `λ ∈ [0, ∞)`, 7.6), 8.11.10–8.11.11 (uniform for `y` in compact
  subsets, 13.5) and 8.18.1 (fixed `b` and `x`, 15.5).
- **Numerical tables and methods of computation.**

**The boundary in one sentence:** this roadmap owns the complex theory of the functions of DLMF
Chapters 6–8 and its real-variable consequences; it consumes the general asymptotic methods of
AsymptoticExpansions, the existing real incomplete Gamma, Beta and error functions, and Dawson's
integral and `Hh_n` from the parabolic cylinder roadmap; and it excludes formulas through
functions of other chapters, the uniform expansions of §8.12 and §8.18(ii), exponentially
improved expansions and numerical tables.

**Mathlib and other roadmaps.** Mathlib has no error function, exponential integral, incomplete
Gamma or Beta function, Fresnel, sine or cosine integral, or Faddeeva function. Mathlib pull
request [#34053](https://github.com/leanprover-community/mathlib4/pull/34053) (real `erf`,
`erfc`) is prior art; Tau Ceti's `Erf.lean` follows its names, and the complex `erf` here
restricts to it. No other roadmap defines a complex error function, an exponential, sine or
cosine integral, or a complex incomplete Gamma function.

## Conventions

- **Namespaces.** The complex incomplete Gamma functions and the complex error functions live in
  `TauCeti.Complex`, beside their real counterparts in `TauCeti` and `TauCeti.Real`:
  - `TauCeti.Complex.lowerIncompleteGamma`, `upperIncompleteGamma`, `upperIncompleteGammaLog`;
  - `regularizedGamma` (`P`), `regularizedGammaQ` (`Q`) and `tricomiIncompleteGamma` (`γ*`);
  - `erf` and `erfc`.

  The other complex functions live in `TauCeti`: `faddeeva`, `fresnelC`, `fresnelS`,
  `fresnelTail` (`ℱ`), `fresnelAuxF`, `fresnelAuxG`, `goodwinStaton`, `iteratedErfc`,
  `expIntegralE`, `expIntegralELog`, `expIntegralEin`, `sinIntegral`, `sinIntegralTail` (`si`),
  `cosIntegral` (`Ci`), `cosIntegralCin`, `sinhIntegral`, `coshIntegral`, `sinIntegralAuxF`,
  `sinIntegralAuxG`, `generalizedSinIntegral` (`Si(a, z)`), `generalizedCosIntegral`,
  `generalizedSinIntegralTail` (`si(a, z)`), `generalizedCosIntegralTail`, and `incompleteBeta`.
  Functions defined only on `ℝ` live in `TauCeti.Real`: `expIntegralEi`, `principalLogIntegral`
  (DLMF's `li`), `voigtU`, `voigtV` and `voigtH`. Dawson's integral `TauCeti.dawson` and
  `TauCeti.repeatedGaussianIntegral` are the parabolic cylinder roadmap's. Argument order
  follows DLMF: parameter first.
- **Incomplete Gamma.** With Mathlib's `𝐌(a, b, z) = Complex.regularizedHGFun {a} {b} z`:

  ```lean
  def TauCeti.Complex.tricomiIncompleteGamma (a z : ℂ) : ℂ :=
    cexp (-z) * Complex.regularizedHGFun {1} {a + 1} z                    -- DLMF 8.5.2
  def regularizedGamma (a z : ℂ) : ℂ := z ^ a * tricomiIncompleteGamma a z -- P, DLMF 8.2.6
  def regularizedGammaQ (a z : ℂ) : ℂ := 1 - regularizedGamma a z        -- Q, DLMF 8.2.5
  def lowerIncompleteGamma (a z : ℂ) : ℂ := Complex.Gamma a * regularizedGamma a z
  def upperIncompleteGamma (a z : ℂ) : ℂ :=
    cexp (-z) * ∫ t in Ioi (0 : ℝ), (z + t) ^ (a - 1) * cexp (-(t : ℂ))
  ```

  `γ*` is entire in each variable. For `z ≠ 0`, `P(·, z)` and `Q(·, z)` are entire, and
  `P(a, ·)`, `Q(a, ·)` are holomorphic on `slitPlane`. `Γ(a, z)` is the integral 8.2.2 along the
  horizontal ray from `z`, which stays in `slitPlane` when `z` does. It is the principal value
  there and entire in `a`. On the cut `(−∞, 0]` its value is junk, and no statement is made
  there. `γ(a, z)` takes Mathlib's junk value of `Γ` at `a ∈ −ℕ`, where DLMF's `γ` has poles.
  Statements about it either exclude those points or are stated for `γ*` and `P`.
- **Logarithmic coordinates.** Values off the principal sheet, and sectors wider than
  `|ph z| < π`, are written in `w` with `z = exp w`:

  ```lean
  def upperIncompleteGammaLog (a w : ℂ) : ℂ :=
    upperIncompleteGamma a (Real.exp w.re) -
      ∫ s in (0 : ℝ)..1, I * w.im *
        cexp (a * (w.re + I * (s * w.im)) - cexp (w.re + I * (s * w.im)))
  ```

  This is `Γ(a, e^w)` continued from the positive axis along the vertical segment from `Re w` to
  `w`. The lower functions need no separate definition: `γ(a, e^w) = Γ(a) e^{aw} γ*(a, e^w)` and
  `P(a, e^w) = e^{aw} γ*(a, e^w)` are written out. `E_p` on the logarithmic plane is
  `expIntegralELog p w = exp((p − 1)w) · upperIncompleteGammaLog (1 − p) w`. "`z → ∞` in
  `|ph z| ≤ θ`" for `θ ≥ π` is the filter `comap re atTop ⊓ 𝓟 {w | |w.im| ≤ θ}`, as pinned by
  AsymptoticExpansions; for `θ < π` the filter `Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ}` is
  used directly.
- **Entire functions as segment integrals.** `erf`, `fresnelC`, `fresnelS`, `expIntegralEin`,
  `sinIntegral`, `cosIntegralCin` and `sinhIntegral` are defined by the integral from `0` to `z`
  along the segment, written `∫ s in 0..1, z * f(s z)` (or `f(sz)/s` for the kernels
  `(1 − e^{−t})/t` etc., whose singularity at `0` is removable), as `TauCeti.dawson` is. For
  example:

  ```lean
  def TauCeti.Complex.erf (z : ℂ) : ℂ := 2 / √π * ∫ s in (0 : ℝ)..1, z * cexp (-(s * z) ^ 2)
  def TauCeti.Complex.erfc (z : ℂ) : ℂ := 1 - erf z
  def TauCeti.faddeeva (z : ℂ) : ℂ := cexp (-z ^ 2) * Complex.erfc (-I * z)
  def TauCeti.expIntegralEin (z : ℂ) : ℂ := ∫ s in (0 : ℝ)..1, (1 - cexp (-(z * s))) / s
  def TauCeti.expIntegralE (p z : ℂ) : ℂ := z ^ (p - 1) * Complex.upperIncompleteGamma (1 - p) z
  ```

  The power series are theorems. `fresnelTail z = (1 + i)/2 − (C(z) + iS(z))` (DLMF 7.5.2);
  `cosIntegral`, `coshIntegral`, `sinIntegralTail` and the auxiliary functions are the explicit
  combinations 6.2.10, 6.2.13, 6.2.16–6.2.18, 7.2.10–7.2.11. The full list of bodies is in
  `Suggested.lean`.
- **Generalized sine and cosine integrals.** `Si(a, z)` and `Ci(a, z)` are the series
  8.21.14–8.21.15, with the principal power `z^a`; they take junk values at their parameter
  poles. `si(a, z)` and `ci(a, z)` are 8.21.1, solved for each function, through
  `upperIncompleteGammaLog a (log z ∓ πi/2)`; they are entire in `a`.
- **Real functions.**

  ```lean
  def TauCeti.Real.expIntegralEi (x : ℝ) : ℝ :=
    Real.eulerMascheroniConstant + Real.log |x| - (expIntegralEin (-x)).re   -- DLMF 6.2.7
  def TauCeti.Real.principalLogIntegral (x : ℝ) : ℝ := expIntegralEi (Real.log x)  -- DLMF 6.2.8
  ```

  `Ei(0)` and `li(1)` are junk values. The principal-value integrals 6.2.5 and 6.2.8 are
  theorems. The Voigt functions are the integrals 7.19.1, 7.19.2 and 7.19.4. `B_x(a, b)` is
  `incompleteBeta a b x = ∫ t in 0..x, t^(a−1) (1 − t)^(b−1)` with real powers, for `a, b > 0`
  and `0 ≤ x ≤ 1`.
- **Real values of complex functions.** A real-variable statement about a complex function is
  made at `(x : ℂ)`. Equalities are stated in `ℂ`. Inequalities, limits in `ℝ` and real zeros use
  `.re`, after the subsection proving that the imaginary part vanishes on the real line. The
  restrictions to Tau Ceti's real functions are equalities in `ℂ`, such as
  `Complex.erf x = (TauCeti.Real.erf x : ℂ)`.
- **Parameter poles.** `Γ` and `1/Γ` are Mathlib's: `Complex.Gamma (−n) = 0` is a junk value,
  and `(Complex.Gamma a)⁻¹` is the entire reciprocal. A formula of DLMF that holds "by limiting
  values" at `a ∈ −ℕ` is stated twice: once with the hypothesis `∀ n : ℕ, a ≠ −n`, and once at
  `a = −n` with the limit evaluated explicitly.
- **Special numbers and polynomials.** `ψ` is `Complex.digamma`. Pochhammer symbols `(a)_k` are
  `(ascPochhammer ℂ k).eval a`, and `(a − 1)(a − 2)⋯(a − k)` is
  `(descPochhammer ℂ k).eval (a − 1)`. DLMF's Hermite polynomial `H_n` (physicists') is
  `H_n(z) = 2^{n/2} He_n(√2 z)` with `He_n = Polynomial.hermite n` (probabilists'), written out.
  `e_n(z) = ∑_{k≤n} z^k/k!` (8.4.11) is written out as a `Finset` sum.
- **Continued fractions** are Mathlib's `GenContFract ℂ` (or `ℝ`). The continued fraction
  `b₀ + a₁/(b₁ + a₂/(b₂ + ⋯))` is `⟨b₀, Stream'.Seq.ofStream fun n => ⟨a (n+1), b (n+1)⟩⟩`. Its
  convergence to `v` is the conjunction of `∀ᶠ n in atTop, g.dens n ≠ 0` and
  `Tendsto g.convs atTop (𝓝 v)`; the first conjunct excludes convergents that are division by
  zero. DLMF's prefactors stay outside.
- **`E_p` at `0`.** The definition gives the junk value `expIntegralE p 0 = 0` for `p ≠ 1`.
  Where DLMF uses `E_p(0) = 1/(p − 1)` (`Re p > 1`), statements use the continuous extension
  `Function.update (expIntegralE p) 0 (p − 1)⁻¹`, written out.
- **Expansions** are stated with AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion` and
  its written-out uniform and generalized forms. `Suggested.lean` writes them out as `IsBigO`,
  so that it needs no import from that roadmap. Remainder bounds ("bounded by the first
  neglected term") are inequalities between the remainder and that term, with the hypotheses
  DLMF states.
- **Mills' ratio, `inverfc` and other DLMF notation for one-line expressions** are written out:
  `𝖬(x) = (√π/2) e^{x²} erfc x`, `inverfc x = erfInv (1 − x)`. No new names or predicates are
  introduced for them.

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

Consumed with the hypotheses and conventions stated there:
- the expansion notion `Asymptotics.HasAsymptoticExpansion`, asymptotic scales, Poincaré and
  generalized expansions and uniform expansions
  ([Layer 1](../AsymptoticExpansions/README.md#layer-1-scales-and-expansions));
- transcendental equations and reversion, for the zeros
  ([Layer 2](../AsymptoticExpansions/README.md#layer-2-transcendental-equations));
- integration by parts and Watson's lemma on the real line
  ([§3.1](../AsymptoticExpansions/README.md#31-integration-by-parts),
  [§3.3](../AsymptoticExpansions/README.md#33-watsons-lemma-on-the-real-line));
- Watson's lemma in a sector and the rotation of the path, including the gluing of the rotated
  transforms in logarithmic coordinates across `|ph z| ≥ π`
  ([§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector),
  [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path));
- Laplace's method on the real line and on a contour
  ([§5.2](../AsymptoticExpansions/README.md#52-laplaces-method-on-the-real-line),
  [§5.4](../AsymptoticExpansions/README.md#54-laplaces-method-on-a-contour));
- Parseval's formula with Mellin inversion, the shifting of the line with residues and its
  iteration, the pole-separated bound for `Γ` on vertical strips, and the exponential Mellin
  inversion, for the Mellin–Barnes integrals
  ([§8.1](../AsymptoticExpansions/README.md#81-parseval),
  [§8.2](../AsymptoticExpansions/README.md#82-shifting-the-line),
  [§8.6](../AsymptoticExpansions/README.md#86-the-gamma-function-on-vertical-strips),
  [§8.7](../AsymptoticExpansions/README.md#87-exponential-mellin-inversion));
- difference equations whose coefficients have limits with distinct characteristic roots
  ([§12.1](../AsymptoticExpansions/README.md#121-distinct-characteristic-roots)), for the
  minimal solution of the incomplete Beta fraction 8.17.22 (15.4). The incomplete Gamma and
  error-function fractions have coefficients that grow with the index, outside that theorem;
  their minimal solutions are explicit (4.2 and 14.2), and minimality is proved by the
  criterion of 4.1.

The AsymptoticExpansions formulas that are statements about `E₁` and `E_p`, DLMF 2.5.49 and
2.11.5–2.11.7, are owned here (8.1, 7.1 and 7.6).

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

Complex Stirling in `|ph a| ≤ π − δ`
([§1.2](../ZerosOfLFunctions/README.md#12-stirling-on-the-sector)), for 8.11.5 and for `Γ(a + 1)`
in 13.5. The decay of `Γ` on vertical lines
([§1.3](../ZerosOfLFunctions/README.md#13-vertical-strips)) is consumed through the
pole-separated bound of AsymptoticExpansions §8.6. Neither is restated here.

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- [§5.1](../SpecialFunctionsParabolicCylinder/README.md#51-hermite-cases): Dawson's integral
  `TauCeti.dawson z = e^{−z²} ∫₀¹ z e^{(sz)²} ds` (DLMF 7.2.5), entire
  (`differentiable_dawson`), with `F′ = 1 − 2zF` (`hasDerivAt_dawson`) and `F(0) = 0`.
- [§5.3](../SpecialFunctionsParabolicCylinder/README.md#53-the-repeated-gaussian-integrals): the
  repeated Gaussian integrals
  `TauCeti.repeatedGaussianIntegral n z = ∫₀^∞ tⁿ/n! · e^{−(z+t)²/2} dt`, entire, with
  `Hh₀′ = −e^{−z²/2}`, `Hh_{n+1}′ = −Hh_n`, the recurrence `(n + 2) Hh_{n+2} = Hh_n − z Hh_{n+1}`,
  the values `Hh_n(0)`, and reality and positivity on the real line.

Only these declarations are consumed; nothing here depends on the parabolic cylinder functions
themselves.

### From [ContourIntegration](../../Completed/ContourIntegration/README.md), implemented in Tau Ceti

Residues `TauCeti.Contour.residue` and the classical residue theorem
(`TauCeti/Analysis/Contour/Residue/`, Layer 2 of ContourIntegration), for the Mellin–Barnes
integrals (through AsymptoticExpansions §8.2) and for the argument principle in 13.3–13.4.

### From Tau Ceti

The real functions below are owned by
[StandardDistributions Layer 2](../StandardDistributions/README.md#layer-2-incomplete-special-functions-and-closed-form-cdfs)
(the real incomplete Gamma, incomplete Beta and error functions) and
[Layer 8.4](../StandardDistributions/README.md#84-inverse-functions) (their inverses), and the
offset logarithmic integral by
[ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) §6.2 and
ZerosOfLFunctions. They are implemented in Tau Ceti:
- **`TauCeti/Analysis/SpecialFunctions/Erf.lean`:** `TauCeti.Real.erf x = 2/√π ∫₀ˣ e^{−t²} dt`
  and `TauCeti.Real.erfc = 1 − erf`, with `erf_neg`, `hasDerivAt_erf`, `strictMono_erf`,
  `tendsto_erf_atTop` and the bounds; `Real.erfInv`, `Real.erfOrderIso`, `Real.hasDerivAt_erfInv`
  and `Real.tendsto_erfInv_nhdsLT_one`.
- **`TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`:** `TauCeti.lowerIncompleteGamma s x`
  and `TauCeti.regularizedGamma s x` for real `s`, `x`, both clamped to `0` for `s ≤ 0` or
  `x ≤ 0`, with `lowerIncompleteGamma_eq_integral`, `hasDerivAt_lowerIncompleteGamma`,
  `lowerIncompleteGamma_add_one` (`γ(s + 1, x) = sγ(s, x) − xˢe^{−x}`),
  `tendsto_regularizedGamma_atTop`, `regularizedGamma_natCast` and
  `TauCeti.Real.erf_eq_regularizedGamma_half_sq`.
- **`TauCeti/Analysis/SpecialFunctions/IncompleteBeta.lean`:**
  `TauCeti.regularizedIncompleteBeta a b x` and its inverse
  `TauCeti.inverseRegularizedIncompleteBeta`, with `regularizedIncompleteBeta_symm`
  (`I_x(a, b) = 1 − I_{1−x}(b, a)`), `regularizedIncompleteBeta_add_one_left` (8.17.20),
  `regularizedIncompleteBeta_add_one_right` and its difference form. `Beta.lean` supplies the Beta
  integral `integral_rpow_mul_one_sub_rpow`.
- **`TauCeti/Analysis/SpecialFunctions/LogIntegral.lean`:**
  `TauCeti.Real.logIntegral x = ∫₂ˣ dt/log t` with `logIntegral_isEquivalent_div_log`.
- **`TauCeti/Probability/Distributions/Gamma/Quantile.lean`:** `TauCeti.inverseRegularizedGamma`.

### From Mathlib

- **Hypergeometric functions.** `Complex.regularizedHGFun a b` for multisets `a`, `b` of
  complex parameters, the regularized `pFq` (DLMF 16.2.5), with `Complex.regularizedHGFunCoeff`
  and `Complex.analyticOnNhd_regularizedHGFun_of_card_le` (entire when `a.card ≤ b.card`); the
  Gauss series `ordinaryHypergeometric a b c x`, with junk value `0` outside its disc of
  convergence.
- **Gamma and related numbers.** `Complex.Gamma`, `Complex.differentiableAt_Gamma`,
  `Complex.Gamma_add_one`, `Complex.tendsto_self_mul_Gamma_nhds_zero`, `Complex.digamma`,
  `Real.eulerMascheroniConstant`, `ProbabilityTheory.beta`, `ascPochhammer`, `descPochhammer`,
  `riemannZeta`, `harmonic` and `Nat.choose`.
- **Bessel and Hermite.** `Complex.besselJ` and `Polynomial.hermite`.
- **Continued fractions.** `GenContFract`, with `GenContFract.convs`, `GenContFract.nums`,
  `GenContFract.dens` and the recurrences for the numerators and denominators.
- **Mellin transforms.** `mellin`, `mellinInv` and `mellinInv_mellin_eq`, through
  AsymptoticExpansions §8.1.
- **Complex analysis and integration.** `Complex.slitPlane`, `Complex.log`, `Complex.cpow`,
  `circleIntegral`, the Cauchy theorem for rectangles, `intervalIntegral`, integrals over
  `Set.Ioi`, parametric differentiation (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`),
  `integral_gaussian_complex` and integration by parts
  (`MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`).
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, `Bornology.cobounded` and
  `Complex.arg`.

## How to read the build

Layers 1–6 are the incomplete Gamma functions on their own. Layer 1 defines `γ*` through
Mathlib's regularized Kummer function and `Γ(a, z)` by the ray integral, and continues `Γ(a, ·)`
to the logarithmic plane. Layers 2 and 3 give the special values, recurrences and integral
representations. Layer 4 proves Pincherle's theorem in general (4.1) and applies it with explicit
minimal solutions. Layer 5 obtains the expansions from Watson's lemma and Laplace's method of
AsymptoticExpansions, and Layer 6 the real zeros of `γ*` from the differential equation and the
recurrences. Layers 7–10 specialize to the exponential, sine and cosine integrals, each as a
combination of values of `upperIncompleteGammaLog`. Layers 11–14 do the same for the error
functions through `erf z = z γ*(½, z²)`, consuming Dawson's integral and `Hh_n`; 13.5 returns to
the incomplete Gamma functions at the transition point, which needs `erfc` and Dawson's
integral. Layer 15 treats the incomplete Beta function, which uses only 3.3, 4.1 and Tau Ceti's
real function. The `### Examples` of each layer are statements to prove, and they test the
conventions on explicit parameters.

## Layer 1: incomplete Gamma, definitions and continuation

### 1.1 Tricomi's function

`γ*` (`tricomiIncompleteGamma`) is entire in `a` for fixed `z`
(`differentiable_tricomiIncompleteGamma_left`) and in `z` for fixed `a`
(`differentiable_tricomiIncompleteGamma_right`). Prove:
- the series 8.7.1: `γ*(a, z) = ∑ e^{−z} z^k/Γ(a + k + 1)` for all `a`, `z`
  (`hasSum_tricomiIncompleteGamma`), and `γ*(a, z) = Γ(a)⁻¹ ∑ (−z)^k/(k!(a + k))` for
  `a ∉ −ℕ`;
- the special values `γ*(a, 0) = 1/Γ(a + 1)` (8.4.2) and `γ*(−n, z) = zⁿ` (8.4.12,
  `tricomiIncompleteGamma_neg_natCast`);
- the integral 8.2.7 `γ*(a, z) = Γ(a)⁻¹ ∫₀¹ t^{a−1} e^{−zt} dt` for `Re a > 0`;
- the differential equation 8.2.14 (`tricomiIncompleteGamma_ode`).

**Checks.**
- `γ*(a, 0) = (Complex.Gamma (a + 1))⁻¹`, which is `0` at `a ∈ {−1, −2, …}`, consistent with
  `γ*(−n, 0) = 0ⁿ`.
- `γ*(0, z) = 1` for every `z`.
- `γ*(1, z) = (1 − e^{−z})/z` for `z ≠ 0`; this fixes `{a + 1}`, not `{a}`, as the denominator
  parameter.

*Needs:* Mathlib `Complex.regularizedHGFun`, `Complex.regularizedHGFunCoeff`,
`Complex.analyticOnNhd_regularizedHGFun_of_card_le`, `Complex.differentiable_one_div_Gamma` for
the entire reciprocal in the coefficients, and `Complex.Gamma_add_one`.

### 1.2 `P` and `γ`

Prove 8.2.1 in the form `γ(a, z) = z^a ∫₀¹ s^{a−1} e^{−zs} ds` for `Re a > 0` and every `z`
(`lowerIncompleteGamma_eq_integral`). Prove 8.2.4 and 8.2.6 (by definition, with `γ = Γ(a)P` for
`a ∉ −ℕ`). Prove the poles: for `z ≠ 0`, `(a + n) γ(a, z) → (−1)ⁿ/n!` as `a → −n`
(`tendsto_mul_lowerIncompleteGamma`). For fixed `z ≠ 0`, `P(·, z)` is entire, and `γ(·, z)` is
holomorphic off `−ℕ`.

**Checks.**
- `P(1, z) = 1 − e^{−z}` for every `z`.
- `P(−n, z) = 1` for `z ≠ 0`, so `Q(−n, z) = 0` as in 8.2.5.
- `P(½, x) = TauCeti.Real.erf √x` for `x > 0`, matching
  `TauCeti.Real.erf_eq_regularizedGamma_half_sq`.

*Needs:* 1.1; Mathlib `Complex.differentiableAt_Gamma`, `Complex.tendsto_self_mul_Gamma_nhds_zero`
and `Complex.Gamma_add_one` for the residues at `−n`; `Complex.cpow` on `slitPlane`.

### 1.3 `Γ(a, z)` and `Q`

For `z ∈ slitPlane`:
- the ray integral converges absolutely;
- `Γ(·, z)` is entire (`differentiable_upperIncompleteGamma_left`);
- `Γ(a, ·)` is holomorphic on `slitPlane`;
- 8.2.2 holds: the definition is its integral along the horizontal ray from `z`, and for `x > 0`,
  `Γ(a, x) = ∫_x^∞ t^{a−1} e^{−t} dt` (`upperIncompleteGamma_ofReal`);
- 8.2.3: `γ(a, z) + Γ(a, z) = Γ(a)` for `a ∉ −ℕ` (`upperIncompleteGamma_add_lowerIncompleteGamma`);
- 8.2.4–8.2.5: `Q(a, z) = Γ(a, z)/Γ(a)` for `a ∉ −ℕ`, and `Q(−n, z) = 0` for `z ≠ 0`;
- 8.2.12, for `Γ(a, ·)` on `slitPlane` and for `γ(a, ·)`, and 8.2.13, for
  `w = e^z z^{1−a} Γ(a, z)`.

**Checks.**
- `Γ(1, z) = e^{−z}` and `Γ(2, z) = (1 + z) e^{−z}` for every `z`, including the cut, because
  the integrands are polynomials times `e^{−t}`.
- `Γ(½, x) = √π · TauCeti.Real.erfc √x` for `x > 0`.
- `Γ(a, x) → Γ(a)` as `x → 0+` for `Re a > 0`.

*Needs:* 1.1–1.2; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, integrals over
`Set.Ioi`, `Complex.Gamma_eq_integral`, and the Cauchy theorem for rectangles to move the ray to
the segment for 8.2.3.

### 1.4 The real bridge

For real `s > 0` and `x ≥ 0`,
`Complex.lowerIncompleteGamma s x = (TauCeti.lowerIncompleteGamma s x : ℂ)`
(`lowerIncompleteGamma_ofReal`) and
`Complex.regularizedGamma s x = (TauCeti.regularizedGamma s x : ℂ)` (`regularizedGamma_ofReal`). For
real `a` and `x > 0`, `Γ(a, x)`, `P(a, x)` and `γ*(a, x)` are real, and `γ*(a, x)` is real for every
real `x`.

*Needs:* 1.2–1.3; Tau Ceti `TauCeti.lowerIncompleteGamma_eq_integral` and
`TauCeti.regularizedGamma_eq_div`.

### 1.5 Continuation

DLMF 8.2.8–8.2.11. Prove:
- `upperIncompleteGammaLog` is entire in `a` and in `w` (`differentiable_upperIncompleteGammaLog`);
- `upperIncompleteGammaLog a (log z) = Γ(a, z)` for `z ∈ slitPlane` (`upperIncompleteGammaLog_log`);
- `∂_w upperIncompleteGammaLog a w = −e^{aw − e^w}`;
- 8.2.8 for `γ(a, e^w) = Γ(a) e^{aw} γ*(a, e^w)`;
- 8.2.9 for `a ∉ −ℕ` (`upperIncompleteGammaLog_add_two_pi_mul_I`), and its limiting form
  `Γ(−n, e^{w+2πim}) = Γ(−n, e^w) − 2πim (−1)ⁿ/n!`
  (`upperIncompleteGammaLog_neg_natCast_add_two_pi_mul_I`);
- 8.2.10 for all `a`, with `1/Γ(1 − a)` written `(Complex.Gamma (1 − a))⁻¹`, Mathlib's entire
  reciprocal;
- 8.2.11 for `a ∉ −ℕ` and `z ≠ 0`, both signs, with `w = log z ± πi`
  (`upperIncompleteGammaLog_log_add_pi_mul_I` for the upper sign).

**Checks.**
- `upperIncompleteGammaLog 1 w = e^{−e^w}` for every `w`.
- `upperIncompleteGammaLog a (Real.log x) = Γ(a, x)` for `x > 0`, where the correction integral
  vanishes because `Im w = 0`.
- `upperIncompleteGammaLog 0 (w + 2πi) = upperIncompleteGammaLog 0 w − 2πi`, the case `n = 0`,
  `m = 1` of the limiting form; this is DLMF 6.4.2 for `E₁ = Γ(0, ·)`.

*Needs:* 1.1–1.3; Mathlib `intervalIntegral` with parametric differentiation and the identity
theorem (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`).

### Examples

- `γ(1, z) = 1 − e^{−z}` and `Γ(1, z) + γ(1, z) = 1`.
- `Γ(0, x) = ∫_x^∞ e^{−t}/t dt` for `x > 0`, the definition of `E₁(x)` in Layer 8.
- `Γ(−1, e^{w+2πi}) = Γ(−1, e^w) + 2πi`, the limiting form at `n = 1`, `m = 1`.

### Dependencies

Mathlib's regularized hypergeometric function, `Γ` and its entire reciprocal, parametric
integrals and the rectangle Cauchy theorem; Tau Ceti's real incomplete Gamma functions for 1.4.

## Layer 2: special values, Kummer representations, series and recurrences

### 2.1 Special values

DLMF 8.4.5, 8.4.7–8.4.11. `Γ(1, z) = e^{−z}`, and for `n ∈ ℕ` the Erlang forms 8.4.7–8.4.10 with
`e_n` written out (`upperIncompleteGamma_natCast_add_one` for 8.4.8). The upper function holds for
every `z`, because the integrand of `Γ(n + 1, z)` is a polynomial times `e^{−t}`.

*Needs:* 1.1–1.3; Mathlib `integral_Ioi_mul_deriv_eq_deriv_mul` for the integrations by parts.

### 2.2 Kummer representations

DLMF 8.5.1–8.5.2. `γ*(a, z) = 𝐌(a, a + 1, −z)`, and 8.5.1 for `a ∉ −ℕ` in the form
`γ(a, z) = a⁻¹ z^a Γ(a + 1) 𝐌(a, a + 1, −z)`. This is Kummer's transformation for the special
parameters `(1, a + 1)`, proved here from the series.

*Needs:* 1.1–1.2; Mathlib `Complex.regularizedHGFunCoeff` and Cauchy products of power series.

### 2.3 Series

DLMF 8.7.2–8.7.3. 8.7.3 for `a ∉ −ℕ` and `z ∈ slitPlane`. 8.7.2 for `|y| < |x|` with `x > 0`, as
a convergent series.

*Needs:* 1.1–1.3, 2.1.

### 2.4 Recurrences

DLMF 8.8.1–8.8.12. 8.8.1 for `a ∉ −ℕ`; 8.8.2 on `slitPlane` for all `a`
(`upperIncompleteGamma_add_one`); the three-term recurrence 8.8.3 for both functions; 8.8.4–8.8.6;
the iterated forms 8.8.7–8.8.12 for `n ∈ ℕ`, with `Γ(a + n)/Γ(a + k + 1)` written through
`(ascPochhammer ℂ _).eval` where `Γ` may vanish.

*Needs:* 1.1–1.3; Mathlib `ascPochhammer` and `Complex.Gamma_add_one`.

### 2.5 Derivatives

DLMF 8.8.13, 8.8.15–8.8.19. 8.8.13 on `slitPlane` (`hasDerivAt_upperIncompleteGamma`), and the
`n`th derivatives 8.8.15–8.8.19 with `iteratedDeriv`. The parameter derivative 8.8.14 is in 7.3.

*Needs:* 1.3, 1.5, 2.4; Mathlib `iteratedDeriv`.

### 2.6 Sums

DLMF 8.15.1. `γ(a, λx) = λ^a ∑ γ(a + k, x)(1 − λ)^k/k!` for `Re a > 0`, `x > 0` and
`|1 − λ| < 1`, which is the region of convergence used.

*Needs:* 1.2, 2.4.

### Examples

- `Γ(3, z) = (z² + 2z + 2) e^{−z}` and `Γ(n + 1, 0) = n!`.
- `γ*(a, z) = 𝐌(a, a + 1, −z)` at `a = 1`: `𝐌(1, 2, −z) = (1 − e^{−z})/z`.
- 8.8.2 at `a = 0` on `slitPlane`: `Γ(1, z) = Γ(0, z)·0 + e^{−z}`.

### Dependencies

Layer 1; Mathlib's Pochhammer symbols, iterated derivatives and power-series manipulation.

## Layer 3: integral representations, integrals and sums

### 3.1 Real-line integrals

DLMF 8.6.1–8.6.5, 8.6.7. 8.6.1 for `a ∉ ℤ` and `z ≠ 0`. 8.6.2 for `Re a > 0`, with Mathlib's
`Complex.besselJ`. 8.6.3 for `Re a > 0` and `Re z > 0`. 8.6.4 for `Re a < 1` and
`z ∈ slitPlane`. 8.6.5 and 8.6.7 for `Re z > 0`. The auxiliary Laplace transforms
`∫₀^∞ e^{−zt}(1 + t)^{a−1} dt` and `∫₀^∞ e^{−zt} t^{s−1}/(1 + t) dt` are holomorphic in `Re z > 0`
and continue across `|ph z| < π` by rotating the ray (AsymptoticExpansions §4.3), giving 8.6.4
from 8.6.5.

*Needs:* Layers 1–2; AsymptoticExpansions §4.3; Mathlib `Complex.besselJ` and its series.

### 3.2 Contour integrals

DLMF 8.6.8–8.6.9. 8.6.8 for `z ≠ 0`, `a ∉ ℤ`, with the loop taken as the unit circle from `−1`:
`γ(a, z) = z^a/(2 sin πa) ∫_{−π}^{π} e^{iaθ + z e^{iθ}} dθ`. 8.6.9 for `Re z > 0`, `Re a > −1`,
with the indented path taken as the ray `t = r e^{±iθ}`, `r > 0`, `0 < θ < π/2 − |ph z|` (same
sign as on the left), which avoids the pole at `t = 1`, with `t^a` the principal power on the ray,
and with the left side `upperIncompleteGammaLog (−a) (log z ± πi)`.

*Needs:* Layers 1–2; Mathlib `circleIntegral` and the Cauchy theorem; Mathlib
`Complex.Gamma_mul_Gamma_one_sub` for the factor `sin πa`.

### 3.3 Mellin–Barnes integrals

DLMF 8.6.10–8.6.12. Each is stated as an integral over the vertical line `Re s = c`, written as
`(2π)⁻¹ ∫ y : ℝ, f(c + iy)`, for the parameters for which a straight line separates the poles as
DLMF requires: 8.6.10 for `|ph z| < π/2`, `Re a > 0` and `0 < c < Re a`; 8.6.11 for
`|ph z| < π/2` and `c > max(0, −Re a)` (`upperIncompleteGamma_eq_mellinBarnes`); 8.6.12 for
`|ph z| < 3π/2` (in logarithmic coordinates), `Re a < 1` and `max(Re a − 1, −1) < c < 0`.

*Needs:* Layers 1–2; AsymptoticExpansions §8.1, §8.2, §8.6 and §8.7; ContourIntegration
`TauCeti.Contour.residue`.

### 3.4 Integrals

DLMF 8.14.1–8.14.6. 8.14.1–8.14.4 with the stated hypotheses, and with the limiting values at
`b = 0` stated separately. 8.14.5 for `Re s > 0`, where `1/(1 + s)` lies in the unit disc, and
8.14.6 for `Re s > −½`, where `s/(1 + s)` does, both with Mathlib's `ordinaryHypergeometric`.

*Needs:* Layers 1–2; Mathlib `ordinaryHypergeometric`, Fubini and `Complex.Gamma_eq_integral`.

### 3.5 The incomplete Riemann zeta function

DLMF 8.22.2–8.22.3. For `Re s > 1` and `x > 0`,
`Γ(s)⁻¹ ∫₀ˣ t^{s−1}/(e^t − 1) dt = ∑ k^{−s} P(s, kx)`, and its limit as `x → ∞` is
`riemannZeta s`.

*Needs:* 1.2; Mathlib `riemannZeta` and `zeta_eq_tsum_one_div_nat_cpow`.

### Examples

- 8.6.8 at `a = ½`, `z = 1`: `γ(½, 1) = ½ ∫_{−π}^{π} e^{iθ/2 + e^{iθ}} dθ`, equal to
  `√π · TauCeti.Real.erf 1`.
- 8.22.3 at `s = 2`: `∫₀^∞ t/(e^t − 1) dt = π²/6`.
- 8.14.1 at `b = 1`: `∫₀^∞ e^{−at} γ(1, t) dt = 1/(a(1 + a))` for `a > 0`.

### Dependencies

Layers 1–2; AsymptoticExpansions Layer 4 and Layer 8; ContourIntegration residues; Mathlib's
Bessel and Gauss functions, circle integrals and the Riemann zeta function.

## Layer 4: continued fractions and inequalities

### 4.1 Pincherle's theorem

Gautschi 1967, Theorem 1.1. Let `a n`, `b n` (`n ≥ 1`) be complex with every `a n ≠ 0`, and
consider the recurrence `y(n + 1) = b n · y(n) + a n · y(n − 1)` (`n ≥ 1`) for `y : ℕ → ℂ`
(`IsRecurrenceSolution`). A solution `f` is *minimal* (`IsMinimalSolution`) when `f ≠ 0` and, for
every solution `u` that is not a scalar multiple of `f`, `u(n) ≠ 0` for all large `n` and
`f(n)/u(n) → 0`. Let `g` be the continued fraction `a₁/(b₁ + a₂/(b₂ + ⋯))`, a `GenContFract ℂ` with
head `0` (`contFrac`). Prove:
- **the continuants:** with `A_n = g.nums n`, `B_n = g.dens n` and `A_{−1} = 1`, `B_{−1} = 0`,
  the sequences `n ↦ A_{n−1}` and `n ↦ B_{n−1}` are the solutions with `(y(0), y(1)) = (1, 0)`
  and `(0, 1)`, and `A_n B_{n−1} − A_{n−1} B_n = (−1)^{n−1} a₁⋯a_n` (`nums_mul_dens_sub`);
- **the Casoratian:** for solutions `f`, `u`, `W(n) = f(n)u(n + 1) − f(n + 1)u(n)` satisfies
  `W(n) = (−1)ⁿ a₁⋯a_n W(0)`;
- **the reduction-of-order criterion:** a solution `f` with `f(n) ≠ 0` for `n ≥ N` is minimal if
  and only if the partial sums of `∑_{m ≥ N} (−1)^m a₁⋯a_m/(f(m) f(m + 1))` tend to infinity in
  modulus (`isMinimalSolution_iff`);
- **Pincherle:** `g` converges (in the sense of the conventions) if and only if the recurrence has
  a minimal solution `f` with `f(0) ≠ 0`, and the value is then `−f(1)/f(0)` (`pincherle`,
  `tendsto_convs_of_isMinimalSolution`);
- **termination:** if `a_N = 0` for one `N` (the other `a_n` arbitrary) and `B_n ≠ 0` for
  `n ≥ N − 1`, the convergents are constant from index `N − 1`.

**Checks.**
- `a_n = b_n = 1`: the minimal solution is `f(n) = ((1 − √5)/2)ⁿ`, and the fraction converges to
  `−f(1)/f(0) = (√5 − 1)/2`.
- A recurrence whose minimal solution has `f(0) = 0` gives a divergent fraction: for `a₁ = −1`,
  `b₁ = 1`, `a_n = −2`, `b_n = 3` (`n ≥ 2`), the minimal solution is `0, 1, 1, …` and the
  convergents are `−(2ⁿ − 1)`.
- The zero sequence solves every recurrence and is not minimal.

*Needs:* Mathlib `GenContFract`, `GenContFract.convs`, `GenContFract.nums`, `GenContFract.dens`
and the recurrences for the numerators and denominators (`GenContFract.nums_recurrence`,
`GenContFract.dens_recurrence`).

### 4.2 The incomplete Gamma fractions

DLMF 8.9.1–8.9.2, each as convergence of a `GenContFract ℂ` via 4.1 with an explicit minimal
solution.
- **8.9.2**, for `z ∈ slitPlane` and `a ∉ ℤ_{>0}` (`tendsto_convs_upperIncompleteGamma`). The
  fraction has `b_n = 1`, `a₁ = 1/z`, `a_{2k} = (k − a)/z` and `a_{2k+1} = k/z`. With
  `K(c, d) = ∫₀^∞ e^{−zt} t^c (1 + t)^d dt` for `c ∈ ℕ` (defined for `Re z > 0` and continued to
  `slitPlane` by rotating the ray, AsymptoticExpansions §4.3, as in 3.1), the minimal solution
  with `f(0) = 1` is `f(2k) = (1 − a)_k z^{−k} K(k − 1, a − 1 − k)` (`k ≥ 1`) and
  `f(2k + 1) = −(1 − a)_k z^{−k} K(k, a − 1 − k)` (`k ≥ 0`), so that
  `−f(1)/f(0) = K(0, a − 1) = z^{−a} e^z Γ(a, z)`. The recurrence follows from
  `K(c, d) − K(c, d − 1) = K(c + 1, d − 1)` and the integration by parts
  `z K(c, d) = c K(c − 1, d) + d K(c, d − 1)` (`c ≥ 1`; at `c = 0` the boundary term is `1`).
  Minimality follows from the criterion of 4.1 and
  `K(k, a − 1 − k) ∼ √π e^{z/2} z^{−a/2−1/4} k^{a/2−1/4} e^{−2√(kz)}` as `k → ∞` (Laplace's
  method, AsymptoticExpansions §5.2). For `a ∈ ℤ_{>0}` the numerator `a_{2a}` vanishes, and 8.9.2
  is the finite identity given by the termination clause of 4.1.
- **8.9.1**, for `a ∉ {−1, −2, …}` and every `z`, with the fraction's head `0`, `b₁ = 1`,
  `b_n = a + n − 1` (`n ≥ 2`), `a₁ = 1`, `a₂ = −z`, `a_{2k} = −(a + k − 1)z` (`k ≥ 2`) and
  `a_{2k+1} = kz`. With `𝐌` as in the conventions and `d₁ = 1`,
  `d_{2k} = (a + 1)_{k−1} (k − 1)!`, `d_{2k+1} = (a + 1)_{k−1} k!`, the minimal solution with
  `f(0) = 1` is `f(n) = (−1)^{⌈n/2⌉} Γ(a + 1) zⁿ⁻¹ d_n 𝐌(⌈n/2⌉, a + n, z)` (`n ≥ 1`), so that
  `−f(1)/f(0) = Γ(a + 1) 𝐌(1, a + 1, z) = Γ(a + 1) e^z γ*(a, z)`. The recurrence is a pair of
  contiguous relations of `𝐌`, proved from the series. Minimality follows from the criterion of
  4.1 and `M(k, 2k + c, z) → e^{z/2}` as `k → ∞` for each fixed `c` (here `c = a` and
  `c = a − 1`), with `M(α, β, ·) = Γ(β) 𝐌(α, β, ·)`, proved from the series. At `z = 0` the
  fraction terminates.

*Needs:* 4.1; 1.1, 1.3, 3.1 (for `K`); AsymptoticExpansions §4.3 and §5.2.

### 4.3 Inequalities

DLMF 8.10.1–8.10.13. For real parameters and `x > 0`, with `Γ(a, x)` and `γ(a, x)` the real parts
of the complex functions:
- 8.10.1–8.10.2 for `0 < a ≤ 1`, with the reversed inequalities for `a ≥ 1`
  (`upperIncompleteGamma_bound` for 8.10.1);
- 8.10.3–8.10.4: with `ϑ` defined by 8.10.3, `ϑ → 1` as `x → ∞` and `0 < ϑ ≤ 1` for `a ≤ 2`
  (`a ≠ 1`);
- the Padé bounds 8.10.5–8.10.6 for `n = 1, 2`;
- 8.10.7–8.10.8;
- 8.10.9–8.10.10 for `0 < a < 1`;
- 8.10.11–8.10.12 for `a > 0`, with equality only at `a = 1`;
- 8.10.13 for `n ≥ 1`.

*Needs:* 1.3–1.4, 2.4, 4.2.

### Examples

- 8.9.2 at `a = 1` terminates after one level, with value `z⁻¹ = z^{−1} e^z Γ(1, z)`.
- 8.9.1 at `z = 0` terminates, with value `1 = Γ(a + 1) γ*(a, 0)`.
- 8.10.1 at `a = 1` is the equality `x⁰ eˣ Γ(1, x) = 1`.

### Dependencies

Layers 1–3; AsymptoticExpansions Layers 4–5; Mathlib's generalized continued fractions.

## Layer 5: asymptotics of the incomplete Gamma functions

### 5.1 Large `z`, fixed `a`

DLMF 8.11.1–8.11.3. With `u_k = (a − 1)(a − 2)⋯(a − k)`, for every `n` and `δ > 0`, in
logarithmic coordinates: `e^{(1−a)w + e^w} Γ(a, e^w) − ∑_{k<n} u_k e^{−kw} = O(e^{−nw})` as
`Re w → ∞` with `|Im w| ≤ 3π/2 − δ` (`upperIncompleteGammaLog_isBigO`). For real `a`, `x > 0` and
`n ≥ a − 1`, `R_n(a, x)` lies between `0` and the first neglected term `u_n/xⁿ`. The proof is
Watson's lemma (AsymptoticExpansions §§4.2–4.3) on 8.6.5, and 8.2.9 beyond `|ph z| ≤ π`.

*Needs:* 1.5, 3.1; AsymptoticExpansions Layer 1 and §§4.2–4.3.

### 5.2 Large `a`, fixed `z`

DLMF 8.11.4–8.11.5. 8.11.4 as a convergent series for `a ∉ −ℕ`, and as a generalized asymptotic
expansion as `a → ∞` in `|ph a| ≤ π − δ`, with respect to the scale `|z|^k/|(a)_{k+1}|`. 8.11.5 in
the same sector for fixed `z ≠ 0`, both relations as asymptotic equivalences along
`Bornology.cobounded ℂ ⊓ 𝓟 {a | |arg a| ≤ π − δ}`, using complex Stirling
(`regularizedGamma_isEquivalent` for the second). In the second relation
`(2πa)^{−1/2} e^{a−z} (z/a)^a` is written `exp(a − z + a(log z − log a) − ½ log a)/√(2π)` with
principal logarithms: the principal power of the quotient `z/a` differs from it by a factor
`e^{2πika}`, `k ∈ {−1, 0, 1}`, which does not tend to `1`.

*Needs:* 1.1–1.2; AsymptoticExpansions Layer 1; ZerosOfLFunctions §1.2.

### 5.3 Large `a`, fixed `z/a`

DLMF 8.11.6–8.11.9. With `b_k(λ)` the polynomials of 8.11.8–8.11.9 and `z = λa`:
- 8.11.6 for `0 < λ < 1` and `|ph a| ≤ π/2 − δ`;
- 8.11.7 for `λ > 1` and `|ph a| ≤ 3π/2 − δ`, in logarithmic coordinates for `a`;
- each as an asymptotic expansion in the scale `|a|^{−k}`, uniformly for `λ` in compact subsets
  of the stated intervals.

*Needs:* 1.2, 1.5, 3.1; AsymptoticExpansions Layer 1, §§4.2–4.3 and Layer 5.

### 5.4 `Γ(z, z)` and the exponential partial sums

DLMF 8.11.12–8.11.19:
- 8.11.12 with the stated six coefficients, as `z → ∞` in `|ph z| ≤ 2π − δ`, with `a = z` and the
  second argument in logarithmic coordinates;
- the limits 8.11.13;
- the identities 8.11.14–8.11.15;
- the expansions 8.11.16–8.11.17 to the stated number of terms;
- 8.11.18 uniformly for `x ≤ 1 − δ`, with `d_k` from 8.11.19.

The transition region 8.11.10–8.11.11, which needs `erfc` and Dawson's integral, is 13.5.

*Needs:* 1.5, 2.1, 3.1; AsymptoticExpansions Layer 1 and Layer 5 (§5.2, §5.4).

### Examples

- For `a = n + 1`, `n ∈ ℕ`, the expansion of 5.1 terminates: `u_k = 0` for `k > n`, and
  `x^{−n} eˣ Γ(n + 1, x) = ∑_{k≤n} u_k x^{−k}` exactly (8.4.8).
- At `a = 2` the remainder bound of 5.1 is the equality `R_1(2, x) = 1/x`.
- 8.11.5 at `z = 1` along real `a → +∞`: `P(a, 1) ∼ e^{a−1} a^{−a−1/2}/√(2π)`.

### Dependencies

Layers 1–3; AsymptoticExpansions Layers 1, 4 and 5; ZerosOfLFunctions §1.2.

## Layer 6: zeros of `γ*`

### 6.1 `x`-zeros

DLMF §8.13(i). For real `a ≥ 0`, `γ*(a, x) ≠ 0` for all real `x`. For `a < 0` and `n ≥ 1`:
- if `1 − 2n < a < 2 − 2n`, there is exactly one negative zero and no positive zero;
- if `−2n < a < 1 − 2n`, there is exactly one negative zero `x₋(a)` and exactly one positive zero
  `x₊(a)`;
- if `a = −n`, the only real zero is `x = 0`, of multiplicity `n` (from `γ*(−n, x) = xⁿ`).

On `−1 < a < 0`, `x₋` is strictly decreasing and satisfies 8.13.1.

*Needs:* 1.1, 1.4, 2.4; the intermediate value theorem and Rolle's theorem; 8.2.14 and 8.8.4
for the sign changes.

### 6.2 `a`-zeros

DLMF §8.13(iii) (a)–(c). For fixed real `x` and `n ≥ 1`:
- for `x < 0`, `γ*(·, x)` has exactly two zeros in `−2n < a < 2 − 2n`;
- there is `x*_n > 0` such that in `−2n < a < 1 − 2n` the function `γ*(·, x)` has exactly two
  zeros, both simple, for `0 < x < x*_n`; exactly one zero, which is double (`γ*` and `∂_a γ*`
  vanish there and `∂_a² γ*` does not), for `x = x*_n`; and no zero for `x > x*_n`;
- for `x = 0` its zeros are exactly `a = −n`, `n ≥ 1`.

*Needs:* 1.1, 1.4, 6.1; Mathlib's real analysis of `(Real.Gamma)⁻¹`.

### Examples

- `γ*(−½, x)` has exactly one negative real zero and no positive one (`n = 1`).
- `γ*(−3/2, x)` has exactly one negative and one positive real zero (`n = 1`).
- `γ*(−1, x) = x` vanishes only at `0`.

### Dependencies

Layers 1–2; Mathlib's intermediate value theorem and Rolle's theorem.

## Layer 7: the generalized exponential integral

### 7.1 Definition and integrals

DLMF 8.19.1–8.19.4. `E_p(z) = z^{p−1} Γ(1 − p, z)` (`expIntegralE`) by definition. `E_p` is
holomorphic on `slitPlane` for each `p`, and entire in `p` for each `z` there. Prove 8.19.2 along
the horizontal ray, 8.19.3 for `Re z > 0` (`expIntegralE_eq_integral`), and 8.19.4 for `Re z > 0`
and `Re p > 0`. Prove 2.11.5 as the same statement as 8.19.4. Prove the terminant identity 8.22.1
as `Γ(p) z^{1−p} E_p(z) = Γ(p) Γ(1 − p, z)`. `expIntegralELog p w = e^{(p−1)w} Γ_log(1 − p, w)`
is `E_p(e^w)` on the logarithmic plane, and `expIntegralELog p (log z) = E_p(z)` on `slitPlane`.

**Checks.**
- `E₀(z) = e^{−z}/z` and `E₁(z) = Γ(0, z)` on `slitPlane`.
- `E₂(z) = e^{−z} − z E₁(z)` on `slitPlane` (8.19.12 at `p = 1`).
- `expIntegralE p 0 = 0` for `p ≠ 1`: the junk value that the extension of the conventions
  replaces.

*Needs:* 1.3, 1.5; Mathlib `Complex.cpow` and integrals over `Set.Ioi`.

### 7.2 Special values and series

DLMF 8.19.5–8.19.11, 8.4.4, 8.4.13, 8.4.15. `E₀`. For `Re p > 1`, 8.19.6 as `E_p(z) → 1/(p − 1)`
as `z → 0` in `slitPlane`, so that the extension `Function.update (expIntegralE p) 0 (p − 1)⁻¹`
of the conventions is continuous at `0` within `slitPlane ∪ {0}`, and the definition's own value
at `0` is `0` for `p ≠ 1`. 8.19.7 for `n ≥ 2`. Prove 8.19.8–8.19.9 for `n ≥ 1` with
`ψ = Complex.digamma` and `z ∈ slitPlane`. Prove 8.19.10–8.19.11 for `p ∉ ℤ_{>0}`. Prove
`Γ(0, z) = E₁(z)` (8.4.4), 8.4.13 and 8.4.15.

*Needs:* 7.1, 1.1, 2.3; Mathlib `Complex.digamma` and `harmonic`.

### 7.3 Recurrence, derivatives and continuation

DLMF 8.19.12–8.19.15, 8.19.18, 8.8.14. 8.19.12–8.19.14 on `slitPlane` (`expIntegralE_add_one`
for 8.19.12), and 8.19.15 for `Re z > 0` and `j ≥ 1`. For 8.19.18, in logarithmic coordinates
and for `p ∉ ℤ_{>0}` (`expIntegralELog_add_two_pi_mul_I`):
`E_p(e^{w + 2πim}) = 2πi e^{mpπi} Γ(p)⁻¹ (sin(mpπ)/sin(pπ)) e^{(p−1)w} + E_p(e^w)`. At
`p = n ∈ ℤ_{>0}`, prove the limiting form
`E_n(e^{w+2πim}) = E_n(e^w) + 2πim (−1)ⁿ e^{(n−1)w}/(n − 1)!`, which is 6.4.2 at `n = 1`. Prove
the parameter derivative of `γ*` at `a = 0`, `∂_a γ*(a, z)|_{a=0} = −E₁(z) − ln z` (8.8.14), for
`z ∈ slitPlane` (`deriv_tricomiIncompleteGamma_left_zero`), from the series 8.7.1 and 8.19.8 at
`n = 1`.

*Needs:* 7.1–7.2, 1.5, 2.4–2.5.

### 7.4 Continued fraction and inequalities

DLMF 8.19.17, 8.19.19–8.19.22. 8.19.17 for `z ∈ slitPlane` and `p ∉ −ℕ`: it is 8.9.2 at
`a = 1 − p` after the equivalence transformation multiplying the odd-indexed levels by `z`, so the
minimal solution of 4.2 (rescaled) applies; at `p ∈ −ℕ` it terminates. 8.19.19–8.19.22 for
`n ≥ 1` and `x > 0` (with `E₀` from 8.19.5 where `n − 1 = 0`).

*Needs:* 7.1–7.3, 4.1–4.3.

### 7.5 Integrals

DLMF 8.19.23–8.19.27. 8.19.23 on `slitPlane` for `Re p > 1` along the ray. 8.19.24 for `n ≥ 1`
and `Re a > −1`. 8.19.25 for `Re a > −½` and `Re(p + b) > 1`, where `a/(1 + a)` lies in the unit
disc. 8.19.26–8.19.27 with `F(1, 1; 1 + p; ½)` as Mathlib's `ordinaryHypergeometric`.

*Needs:* 7.1–7.2, 3.4; Mathlib `ordinaryHypergeometric`.

### 7.6 Asymptotics

DLMF 8.20.1–8.20.6, 2.11.6–2.11.7. 8.20.1 as an identity. 8.20.2 in `|ph z| ≤ 3π/2 − δ` and
8.20.3 in `π/2 + δ ≤ ±ph z ≤ 7π/2 − δ`, both in logarithmic coordinates. 2.11.6–2.11.7 as the
same statements. 8.20.4–8.20.5: the polynomials `A_k` with `A₀ = 1` and
`A_{k+1}(λ) = (1 − 2kλ) A_k(λ) + λ(λ + 1) A_k′(λ)` (8.20.4), with the printed values 8.20.5 as
checks. 8.20.6 as `p → +∞` through real values, uniformly for `λ ∈ [0, ∞)`, with `E_p(0)` the
value `1/(p − 1)` of the extension in the conventions (`expIntegralE_large_order_isBigO`): for
every `n`, `e^{λp} (λ + 1) p E_p(λp) − ∑_{k<n} A_k(λ)/((λ + 1)^{2k} p^k) = O(p^{−n})`, uniformly in
`λ ≥ 0`. At `λ = 0` this is the exact identity `p/(p − 1) = ∑_{k<n} p^{−k} + p^{−n}/(1 − p^{−1})`,
since `A_k(0) = 1`.

*Needs:* 7.1–7.3, 5.1; AsymptoticExpansions Layer 1, §3.3 and §§4.2–4.3.

### Examples

- `A₁ = 1`, `A₂(λ) = 1 − 2λ` and `A₃(λ) = 1 − 8λ + 6λ²` from the recurrence 8.20.4.
- `E₂(0) = 1` for the extension, and `E₂(x) → 1` as `x → 0+`.
- 8.19.18 at `p = 1`, `m = 1`: `E₁(e^{w+2πi}) = E₁(e^w) − 2πi`.

### Dependencies

Layers 1–5; AsymptoticExpansions Layers 1, 3 and 4; Mathlib's digamma function and Gauss series.

## Layer 8: exponential and logarithmic integrals

### 8.1 `E₁` and `Ein`

DLMF 6.2.1–6.2.4, 6.4.1–6.4.3, 6.11.1, 2.5.49. `Ein` (`expIntegralEin`) is entire. On
`slitPlane`: 6.2.1 along the horizontal ray, 6.2.2 (which is 2.5.49), and 6.2.4
(`expIntegralE_one`). In logarithmic coordinates, `E₁(e^w) = Ein(e^w) − w − γ` (6.4.1) is the
value of `expIntegralELog 1 w`; deduce 6.4.2–6.4.3. 6.11.1 is 8.4.4. The elementary API:
`Ein′(z) = (1 − e^{−z})/z` for `z ≠ 0` and `Ein′(0) = 1`; `E₁′ = −e^{−z}/z` on `slitPlane`;
`Ein(z̄) = conj Ein(z)`, `Ein` real on the real line; `E₁(z̄) = conj E₁(z)` on `slitPlane`.

**Checks.**
- `Ein(z) = z − z²/4 + O(z³)` as `z → 0`.
- `E₁(1) ∈ (0.2193839343, 0.2193839345)`.
- `E₁(x) → 0` and `Ein(x) − ln x → γ` as `x → +∞`; the second fixes the sign of `γ` in 6.2.4.

*Needs:* 7.1–7.3; Mathlib `Real.eulerMascheroniConstant` and
`Real.eulerMascheroniConstant_eq_neg_integral_log` (`γ = −∫₀^∞ ln t e^{−t} dt`, for 6.2.4), and
`intervalIntegral` with parametric differentiation.

### 8.2 `Ei` and `li`

DLMF 6.2.5–6.2.8, 6.5.1–6.5.2. `Ei` is `TauCeti.Real.expIntegralEi`, and `li` is
`TauCeti.Real.principalLogIntegral`. The elementary API:
- `Ei` is differentiable on `x ≠ 0` with `Ei′(x) = eˣ/x` (`hasDerivAt_expIntegralEi`), continuous
  on `(−∞, 0)` and on `(0, ∞)`, strictly decreasing on `(−∞, 0)` and strictly increasing on
  `(0, ∞)` (`strictMonoOn_expIntegralEi`);
- `Ei(x) → −∞` as `x → 0` (from either side), `Ei(x) → 0` as `x → −∞` and `Ei(x) → +∞` as
  `x → +∞`;
- `li` is differentiable on `(0, 1) ∪ (1, ∞)` with `li′(x) = 1/ln x`, and `li(x) → 0` as `x → 0+`.

For `x > 0`:
- 6.2.5, both principal-value integrals, as limits as `ε → 0+` of integrals over
  `(−∞, x] \ (−ε, ε)` (`tendsto_expIntegralEi` for the first);
- 6.2.6 and 6.2.7;
- 6.5.1, as the limits of `E₁(−x ± iy)` as `y → 0+`;
- 6.5.2.

`principalLogIntegral` satisfies 6.2.8 for `x > 1` as the limit as `ε → 0+` of
`∫_{(0, x] \ (1 − ε, 1 + ε)} dt/ln t`, the exclusion symmetric in `t`. (The definition `Ei(ln x)`
corresponds to the exclusion `(e^{−ε}, e^{ε})`, symmetric in `ln t`; the two limits agree because
the excluded intervals differ by `O(ε²)` where the integrand is `O(1/ε)`.)
`TauCeti.Real.logIntegral x = li(x) − li(2)` for `x > 1`
(`logIntegral_eq_principalLogIntegral_sub`).

**Checks.**
- `Ei(−x) = −E₁(x)` for `x > 0` (6.2.6), from the definition and 6.2.4.
- `Ei(1) ∈ (1.8951178163, 1.8951178164)` and `li(2) ∈ (1.0451637801, 1.0451637802)`.
- `li(e) = Ei(1)`, and `TauCeti.Real.logIntegral 2 = 0 = li(2) − li(2)`.

*Needs:* 8.1, 1.5; Tau Ceti `TauCeti.Real.logIntegral_def`; Mathlib `intervalIntegral`, improper
integrals over `Set.Iic`.

### 8.3 Series and integral representations

DLMF 6.6.1–6.6.4, 6.7.1–6.7.8, 6.10.1–6.10.3. The power series 6.6.1–6.6.4, with 6.6.3 using
`ψ(n + 1) = Complex.digamma (n + 1)`. The integrals 6.7.1–6.7.8 with their stated parameter
ranges, with 6.7.3–6.7.4 as improper integrals. The inverse factorial series 6.10.1 for
`Re z > 0`, with `c_k` defined by 6.10.3 and the values 6.10.2 as checks.

*Needs:* 8.1–8.2; Mathlib `Complex.digamma` and `harmonic`.

### 8.4 Inequalities, continued fraction, asymptotics

DLMF 6.8.1–6.8.3, 6.9.1, 6.12.1–6.12.2. 6.8.1–6.8.3 for `x > 0`. 6.9.1 for `z ∈ slitPlane`, the
case `p = 1` of 8.19.17. 6.12.1 in `|ph z| ≤ 3π/2 − δ`, with the remainder bounds:
- at most the first neglected term in `|ph z| ≤ π/2`, and of the same sign on the positive axis;
- at most `csc |ph z|` times it in `π/2 ≤ |ph z| < π`.

6.12.2 as `x → +∞` (`expIntegralEi_isBigO`), with the remainder bound `1 + χ(n + 1)` times the
next term, where `χ(n) = π^{1/2} Γ(n/2 + 1)/Γ(n/2 + ½)` (DLMF 9.7.2) is written out. The expansion
of `li(x)` follows.

*Needs:* 8.1–8.2, 7.4, 7.6; AsymptoticExpansions §3.3 and §§4.2–4.3.

### 8.5 Zeros and integrals

DLMF 6.13.1, 6.14.1, 6.14.4. `Ei` has exactly one positive zero `x₀`
(`existsUnique_expIntegralEi_eq_zero`). `Ei(x) < 0` for `x < 0`, and
`x₀ ∈ (0.3725074107, 0.3725074108)` (`expIntegralEi_eq_zero_bounds`). Prove 6.14.1 for
`Re a > −1` (with the limit at `a = 0`) and 6.14.4.

*Needs:* 8.2–8.3; the intermediate value theorem and interval arithmetic on the series 6.6.2.

### Examples

- `Chi(x) + Shi(x) = Ei(x)` and `Chi(x) − Shi(x) = −E₁(x)` for `x > 0`, with `Chi`, `Shi` of
  Layer 9.
- 6.12.2 to two terms: `x e^{−x} Ei(x) = 1 + 1/x + O(x^{−2})`.
- 6.14.1 at `a = 1`: `∫₀^∞ e^{−t} E₁(t) dt = ln 2`.

### Dependencies

Layers 1 and 7; AsymptoticExpansions Layers 3–4; Tau Ceti's offset logarithmic integral; Mathlib's
Euler–Mascheroni constant and digamma function.

## Layer 9: sine and cosine integrals

### 9.1 Definitions and continuation

DLMF 6.2.9–6.2.16, 6.4.4–6.4.5. `Si`, `Cin` and `Shi` (`sinIntegral`, `cosIntegralCin`,
`sinhIntegral`) are entire. `Si` and `Shi` are odd and `Cin` is even. 6.2.10–6.2.11
(`sinIntegralTail`), with 6.2.11 on `slitPlane` along the horizontal ray as an improper integral.
6.2.13 (`cosIntegral`) and 6.2.16 (`coshIntegral`) hold by definition. Prove the limits 6.2.14
(`tendsto_sinIntegral_atTop` for `Si(x) → π/2`). Prove 6.4.4–6.4.5 in logarithmic coordinates,
with `Ci(e^w) = −Cin(e^w) + w + γ`. The elementary API:
- `Si′(z) = sin z/z`, `Cin′(z) = (1 − cos z)/z` and `Shi′(z) = sinh z/z` for `z ≠ 0`, with the
  values `1`, `0`, `1` at `z = 0`;
- `Ci′(z) = cos z/z` and `Chi′(z) = cosh z/z` on `slitPlane`;
- `Si`, `Cin`, `Shi` commute with conjugation and are real on the real line; `Ci` and `Chi`
  satisfy `f(z̄) = conj f(z)` on `slitPlane` and are real on `(0, ∞)`.

**Checks.**
- `Si(z) = z − z³/18 + O(z⁵)` and `Cin(z) = z²/4 + O(z⁴)` as `z → 0`.
- `Shi(z) = −i Si(iz)`.
- `Ci(x) → 0` and `si(x) → 0` as `x → +∞`; the first fixes the sign of `Cin` in 6.2.13.

*Needs:* 8.1; Mathlib `intervalIntegral`, `Complex.sin`, `Complex.cos` and their hyperbolic
counterparts.

### 9.2 Auxiliary functions

DLMF 6.2.17–6.2.21, 6.4.6–6.4.7, 6.7.12–6.7.14. `f` and `g` (`sinIntegralAuxF`,
`sinIntegralAuxG`) are 6.2.17–6.2.18 by definition. Prove 6.2.19–6.2.21. Prove 6.4.6–6.4.7 in
logarithmic coordinates. Prove 6.7.12 for `z ∈ slitPlane` with `∫_z^∞` the improper integral
along the horizontal ray `z + t`, `t ≥ 0` (which avoids `0` and the cut). On the cut, `z = −x`
with `x > 0` and `ph z = ±π`, prove 6.7.12 with both sides taken as their limits from
`slitPlane`: the left side `g(−x ± i0) + i f(−x ± i0)` is the value of 6.4.6–6.4.7 at
`w = ln x ± πi`, and the right side is the limit as `y → 0+` of the horizontal-ray integral from
`−x ± iy`. Prove the first integrals of 6.7.13–6.7.14 for `z ∈ slitPlane`, and the second for
`Re z ≥ 0` (with `z ≠ 0` for `g`).

**Checks.**
- `si(z) = −f(z) cos z − g(z) sin z` and `Ci(z) = f(z) sin z − g(z) cos z` (6.2.19–6.2.20),
  directly from the definitions.
- `f(x) ∼ 1/x` and `g(x) ∼ 1/x²` as `x → +∞`.
- `f(x)` and `g(x)` are positive for `x > 0`, from 6.7.13–6.7.14.

*Needs:* 9.1, 1.5, 8.1.

### 9.3 Interrelations and series

DLMF 6.5.3–6.5.7, 6.6.5–6.6.6, 6.7.9–6.7.11. 6.5.3–6.5.4 for `x > 0`; 6.5.5–6.5.7 for `Re z > 0`
(`sinIntegral_eq_expIntegralE` for 6.5.5); the power series 6.6.5–6.6.6; 6.7.9–6.7.11 with the
stated ranges.

*Needs:* 9.1, 8.1–8.2.

### 9.4 Asymptotics

DLMF 6.12.3–6.12.8. The remainder identities 6.12.5–6.12.8 for `Re z > 0`. The expansions
6.12.3–6.12.4 in `|ph z| ≤ π − δ`. The remainder bounds in `|ph z| ≤ π/4`, and with the factor
`csc(2|ph z|)` in `π/4 ≤ |ph z| < π/2`.

*Needs:* 9.2; AsymptoticExpansions §3.3 and §§4.2–4.3.

### 9.5 Zeros

DLMF §6.13, 6.13.2. The positive zeros of `Ci` are all simple and are exactly the values of a
strictly increasing sequence `c : ℕ → (0, ∞)`; likewise `s : ℕ → (0, ∞)` for `si`. So `c₀` and
`s₀` are the least positive zeros, as in DLMF. Prove 6.13.2 as `k → ∞`, with `α = kπ` for `c_k`
and `α = (k + ½)π` for `s_k`, as an asymptotic expansion in the scale `α^{1−2j}` to the stated
terms. Prove the alternating remainder property: the remainder after `n` terms has the sign of
the `(n + 1)`th term and modulus at most its modulus, for `n ≤ 4`.

*Needs:* 9.2, 9.4; AsymptoticExpansions Layer 2.

### 9.6 Integrals and sums

DLMF 6.14.2–6.14.3, 6.14.5–6.14.7, 6.15.1–6.15.4. As stated, with `Re a > 0` for the Laplace
transforms and improper integrals where DLMF's are not absolutely convergent.

*Needs:* 9.1–9.3; Mathlib Fourier series (`hasSum_fourier_series_of_summable`) for 6.15.

### 9.7 The Gibbs phenomenon

DLMF 6.16.1–6.16.4. The Fourier series 6.16.1 converges pointwise on `(−π, π)` to the stated
values, and the identity 6.16.2 holds. `R_n(x) = O(n⁻¹)` uniformly on `[−π, π]` (6.16.4). The
first positive maximum of `Si` is at `π`, and `S_n(π/(2n)) → Si(π)/2` as `n → ∞`.

*Needs:* 9.1, 9.4.

The Dirichlet integral 6.2.14 is proved here from 6.5.5 and the decay of `E₁` on the imaginary
axis.

### Examples

- `Si(π) ∈ (1.8519370519, 1.8519370520)`.
- `Ci(x) = γ + ln x + O(x²)` as `x → 0+`.
- `si(0) = −π/2`.

### Dependencies

Layers 7–8; AsymptoticExpansions Layers 2, 3 and 4.

## Layer 10: generalized sine and cosine integrals

### 10.1 Definitions and analyticity

DLMF 8.21.1–8.21.3. For each `z ∈ slitPlane`:
- `si(·, z)` and `ci(·, z)` (`generalizedSinIntegralTail`, `generalizedCosIntegralTail`) are
  entire;
- `Si(·, z)` (`generalizedSinIntegral`) is holomorphic off `{−1, −3, −5, …}` and `Ci(·, z)`
  (`generalizedCosIntegral`) off `{0, −2, −4, …}`, with simple poles there;
- 8.21.2 holds away from those poles;
- 8.21.1 holds by definition.

On the positive axis, the principal values are those of 8.21.1–8.21.2 with the principal
`Γ(a, ∓ix)` and `γ(a, ∓ix)`. Prove 8.21.3 for `0 < Re a < 1`.

**Checks.**
- `Si(0, z) = Si(z)`, `Si(1, z) = 1 − cos z` and `Ci(1, z) = sin z`.
- `si(1, z) = cos z` and `ci(1, z) = −sin z` on `slitPlane`; these fix the signs `∓πi/2` in the
  definitions.
- `si(0, x) = −si(x)` and `ci(0, x) = −Ci(x)` for `x > 0`.

*Needs:* 1.1–1.3, 1.5, 9.1; Mathlib `tsum` of power series and `Complex.cpow`.

### 10.2 Integral representations and interrelations

DLMF 8.21.4–8.21.9. 8.21.4–8.21.7 for real `x > 0`, with the stated ranges of `Re a`, as improper
integrals in 8.21.4–8.21.5 (`generalizedSinIntegral_ofReal` for 8.21.6). 8.21.8 for `a ∉ −ℕ`
(`generalizedSinIntegral_add_tail`), and its limiting form at `a = −2n`. 8.21.9 for `a ∉ −ℕ`, and
its limiting form at `a = −(2n + 1)`.

*Needs:* 10.1, 1.3.

### 10.3 Special values and series

DLMF 8.21.10–8.21.15. 8.21.10–8.21.11. 8.21.12–8.21.13 as limits along the positive axis with the
stated exclusions. 8.21.14–8.21.15 hold by definition.

*Needs:* 10.1–10.2.

### 10.4 Auxiliary functions and asymptotics

DLMF 8.21.18–8.21.27. 8.21.18–8.21.21. 8.21.22–8.21.23 for `z ∈ slitPlane` and `Re a < 1`, as
improper integrals over `t ∈ (0, ∞)` with the principal power `(t + z)^{a−1}`; the path `z + t`
stays in `slitPlane`, and no statement is made for `z` on the cut. 8.21.24–8.21.25 for
`Re z > 0`. 8.21.26–8.21.27 in `|ph z| ≤ π − δ`.

*Needs:* 10.1–10.2, 5.1; AsymptoticExpansions §§4.2–4.3.

### Examples

- 8.21.8 at `a = ½`, `x > 0`: `Si(½, x) + si(½, x) = Γ(½) sin(π/4) = √(π/2)`.
- 8.21.6 at `a = 0` is the definition of `Si(x)` as an integral.
- 8.21.8 at `a = 1`: `Si(1, z) + si(1, z) = (1 − cos z) + cos z = 1 = Γ(1) sin(π/2)`.

### Dependencies

Layers 1, 5 and 9; AsymptoticExpansions Layer 4.

## Layer 11: error functions and Fresnel integrals

### 11.1 Definitions

DLMF 7.2.1–7.2.3, 7.2.6–7.2.8, 7.2.10–7.2.12. `erf`, `erfc`, `w`, `C`, `S` and `ℱ` (`erf`,
`erfc`, `faddeeva`, `fresnelC`, `fresnelS`, `fresnelTail`) are entire (`differentiable_erf`).
`erf (x : ℂ) = TauCeti.Real.erf x` (`erf_ofReal`). The defining integrals from `0` are
characterized by their derivatives and their value `0` at `0`: `erf′ = 2π^{−1/2} e^{−z²}`,
`C′ = cos(πz²/2)` and `S′ = sin(πz²/2)`. 7.2.2 holds for `erfc` as `∫_z^∞` along the horizontal
ray for `|ph z| < π/4` and for real `z`. 7.2.6 holds for `ℱ` as an improper integral along the
real axis. The auxiliary functions `f`, `g` (`fresnelAuxF`, `fresnelAuxG`) are 7.2.10–7.2.11 by
definition. The integral defining `G` (`goodwinStaton`, 7.2.12) converges absolutely for
`z ∈ slitPlane`, and `G` is holomorphic there. Conjugation: `erf`, `erfc`, `C`, `S` commute with
`z ↦ z̄`, `w(−z̄) = conj w(z)`, and `G(z̄) = conj G(z)` on `slitPlane`.

**Checks.**
- `erf(−z) = −erf z` and `erf(z) = 2z/√π + O(z³)` as `z → 0`.
- `w(0) = 1` and `w(iy) = e^{y²} TauCeti.Real.erfc y` for real `y`; this fixes the sign of `−iz`
  in the definition.
- `C(z) = z + O(z⁵)`, `S(z) = πz³/6 + O(z⁷)`, `ℱ(0) = (1 + i)/2` and `f(0) = g(0) = ½`.
- `G(x) ∼ √π/(2x)` as `x → +∞`.

*Needs:* Tau Ceti `TauCeti.Real.erf_def` and `TauCeti.Real.hasDerivAt_erf`; Mathlib
`intervalIntegral` with parametric differentiation, `integral_gaussian` and integrals over
`Set.Ioi`.

### 11.2 Values at infinity and symmetry

DLMF 7.2.4, 7.2.9, 7.4.1–7.4.8. 7.2.4 in `|ph z| ≤ π/4 − δ`. 7.2.9 for the real parts
(`tendsto_fresnelC_atTop`). 7.4.1–7.4.8 as identities of entire functions. `C`, `S` and `erf`
are real on the real axis (`fresnelC_ofReal_im`).

*Needs:* 11.1; Tau Ceti `TauCeti.Real.tendsto_erf_atTop`; Mathlib `integral_gaussian_complex`.

### 11.3 Interrelations

DLMF 7.5.1–7.5.13. All as identities of entire functions, with 7.5.8–7.5.10 for both sign
choices (`dawson_eq_faddeeva` for 7.5.1, `fresnelC_add_I_mul_fresnelS` for 7.5.8 with the upper
signs). 7.5.11–7.5.12 for real `x` with the stated signs. 7.5.13 for `x > 0`, with `Ei` of 8.2.

*Needs:* 11.1–11.2, 11.6, 8.2.

### 11.4 Series, derivatives and hypergeometric forms

DLMF 7.6.1–7.6.7, 7.10.1–7.10.4, 7.11.1–7.11.4, 7.11.6–7.11.8. The power series 7.6.1–7.6.7
(`hasSum_erf` for 7.6.1). 7.10.1 with `H_n` written through `Polynomial.hermite`. 7.10.2–7.10.4
(`hasDerivAt_faddeeva` for 7.10.2). 7.11.1–7.11.3 for `Re z > 0`, where `(z²)^{1/2} = z`
(`erf_eq_lowerIncompleteGamma`), and the entire form `erf z = z γ*(½, z²)`
(`erf_eq_mul_tricomiIncompleteGamma`). 7.11.4 and 7.11.6 with `𝐌`
(`M(a, b, ·) = Γ(b) 𝐌(a, b, ·)`). 7.11.7–7.11.8 with `Complex.regularizedHGFun` for `₁F₂`.

*Needs:* 11.1, 11.6, 1.1–1.2, 2.2, 7.1 (for 7.11.3); Mathlib `Polynomial.hermite`,
`Complex.regularizedHGFun`.

### 11.5 Incomplete Gamma special values

DLMF 8.4.1, 8.4.3, 8.4.6, 8.4.14. 8.4.1 and 8.4.6 for `Re z > 0`. 8.4.3 for `z ≠ 0`. 8.4.14 for
`n ∈ ℕ` and `Re z > 0`.

*Needs:* 11.4, 1.2–1.3, 2.4.

### 11.6 Dawson's integral (consume)

Dawson's integral `F = TauCeti.dawson`, its entirety, `F′ = 1 − 2zF` and `F(0) = 0` are consumed
from
[SpecialFunctionsParabolicCylinder §5.1](../SpecialFunctionsParabolicCylinder/README.md#51-hermite-cases).
Prove here: `F` is odd (`dawson_neg`), `F(z̄) = conj F(z)` (`dawson_conj`), and `F` is real on the
real line.

*Needs:* SpecialFunctionsParabolicCylinder §5.1 (`differentiable_dawson`, `hasDerivAt_dawson`).

### Examples

- `erf(iy) = i (2/√π) e^{y²} F(y)` for real `y`, with `F = TauCeti.dawson`.
- `w(x) = e^{−x²} + (2i/√π) F(x)` for real `x`, from 7.5.1.
- 8.4.6 at `z = 1`: `Γ(½, 1) = √π erfc 1`.

### Dependencies

Layers 1, 2, 7 and 8; SpecialFunctionsParabolicCylinder §5.1; Tau Ceti's real error function;
Mathlib's Gaussian integrals, Hermite polynomials and regularized hypergeometric functions.

## Layer 12: integrals, inequalities and continued fractions of the error functions

### 12.1 Integral representations

DLMF 7.7.1–7.7.16. 7.7.1 for `|ph z| ≤ π/4` (`z ≠ 0`), 7.7.2 for `Im z > 0`
(`faddeeva_eq_integral`), and 7.7.3–7.7.9 with the stated ranges. 7.7.10–7.7.12 with the stated
ranges, with 7.7.12 as an improper integral. The Mellin–Barnes integrals 7.7.13–7.7.14 with
`ζ = π² z⁴/16` and `|ph z| < π/8` (so that `|ph ζ| < π/2`), as in 3.3. 7.7.15–7.7.16 for
`Re a > 0`.

*Needs:* Layer 11, 3.3; AsymptoticExpansions §8.1, §8.2, §8.6 and §8.7.

### 12.2 Inequalities

DLMF 7.8.1–7.8.8. With Mills' ratio written out, 7.8.2–7.8.5 on the stated ranges
(`millsRatio_bounds` for 7.8.2), and 7.8.6–7.8.8. 7.8.7 includes the strict decrease of
`F(x)/√(1 − e^{−2x²})` on `x > 0`.

*Needs:* 11.1–11.2, 11.6; Tau Ceti `TauCeti.Real.erfc_pos` and `TauCeti.Real.hasDerivAt_erfc`.

### 12.3 Continued fractions

DLMF 7.9.1–7.9.3. 7.9.1 for `Re z > 0`: it is 8.9.2 at `a = ½` and argument `z² ∈ slitPlane`,
with `Γ(½, z²) = √π erfc z` (8.4.6), multiplied by `z` and followed by the equivalence
transformation multiplying alternate levels by `z²`. 7.9.2 for `Re z > 0` as the even part of
7.9.1: prove, for a general `GenContFract`, that the convergents of its even contraction are its
even-indexed convergents. 7.9.3 for `Im z > 0`: it is 7.9.1 at `−iz`, where `Re(−iz) > 0`, after
an equivalence transformation.

*Needs:* 4.1–4.2, 11.5; Mathlib `GenContFract.convs` and the continuant recurrences.

### 12.4 Integrals

DLMF 7.14.1–7.14.8 with 7.14.4_5. With the stated ranges, the limit at `a = 0` in 7.14.1, and
principal square roots.

*Needs:* Layer 11, 8.1; Mathlib Fubini and `integral_gaussian_complex`.

### Examples

- 7.8.2 at `x = 0`: `1/√2 < √π/2`, and the upper bound is the equality `√π/2 = 1/√(4/π)`.
- `∫₀^∞ erfc t dt = 1/√π`.
- At `z = x > 0` the first two convergents of 7.9.1 bracket the value:
  `x/(x² + ½) < √π e^{x²} erfc x < 1/x`.

### Dependencies

Layers 3, 4, 8 and 11; AsymptoticExpansions Layer 8.

## Layer 13: asymptotics and zeros of the error functions

### 13.1 `erfc`

DLMF 7.12.1. Both expansions in `|ph z| ≤ 3π/4 − δ`, in logarithmic coordinates (`erfc_isBigO`).
The remainder bounds hold in `|ph z| ≤ π/4` (with the sign on the positive axis) and with the
factor `csc(2|ph z|)` in `π/4 ≤ |ph z| < π/2`.

*Needs:* 11.5, 5.1; AsymptoticExpansions Layer 1 and §§4.2–4.3.

### 13.2 Fresnel auxiliary functions

DLMF 7.12.2–7.12.7. The remainder identities 7.12.4–7.12.7 for `|ph z| < π/4`. The expansions in
`|ph z| ≤ π/2 − δ`. The remainder bounds in `|ph z| ≤ π/8` and with the factor `|csc(4 ph z)|` in
`π/8 ≤ |ph z| < π/4`.

*Needs:* 11.1, 11.3, 12.1; AsymptoticExpansions §§4.2–4.3.

### 13.3 Zeros of `erf` and `erfc`

DLMF §7.13(i)–(ii), 7.13.1–7.13.4. An *enumeration by increasing modulus* of the zeros of `f` in a
region `Ω` is a bijection `z : ℕ_{>0} → {ζ ∈ Ω | f ζ = 0}` with `n ↦ |z_n|` nondecreasing. Its
existence includes the statement that the zero set in `Ω` is infinite and has no finite
accumulation point. Ties in modulus are not excluded, and each expansion below holds for every
such enumeration. Prove:
- `erf` has a simple zero at `0`, no other zero on the real or imaginary axis, and infinitely many
  zeros in the open first quadrant (`infinite_erf_zeros_firstQuadrant`), all simple;
- the zero set of `erf` is exactly `{0} ∪ {±z_n, ±z̄_n}` for an enumeration `z_n` by increasing
  modulus of its zeros in the open first quadrant (`exists_erf_zero_enumeration`);
- `erfc` has no zero outside the sectors `π/2 < ±ph z < 3π/4`; its zeros there are simple, and
  its zero set is exactly `{z_n, z̄_n}` for an enumeration `z_n` by increasing modulus of its
  zeros in `π/2 < ph z < 3π/4`; the zeros of `w` are exactly `iz_n` and `i z̄_n`;
- 7.13.1 and 7.13.3 with `λ`, `μ` from 7.13.2 and 7.13.4, as expansions with logarithmic weights
  (`erf_zero_re_isBigO` for the real parts of the zeros of `erf` with `N = 3`): writing `p₀ = ±1`,
  `p₁ = ∓μ/4`, `p₂ = ±(1 − μ + μ²/2)/16` and `q₀ = 1`, `q₁ = μ/4`, `q₂ = (1 − μ + μ²/2)/16`
  (upper signs for `erf`, lower for `erfc`), for `N ≤ 3`,
  `x_n − ∑_{j<N} p_j λ^{1−2j} = O(λ^{1−2N} (1 + |μ|)^N)` and the same for `y_n` with `q_j`, as
  `n → ∞`.

*Needs:* 11.1–11.2, 13.1; AsymptoticExpansions Layer 1 and Layer 2; for counting zeros near their
asymptotic positions, the argument principle through ContourIntegration residues
(`TauCeti.Contour.residue`), and Rouché's theorem, derived from it here.

### 13.4 Zeros of the Fresnel integrals

DLMF §7.13(iii)–(iv), 7.13.5–7.13.7. The symmetry group generated by `z ↦ iz` and `z ↦ z̄` has
order `8`; under it `C` and `S` are conjugated or multiplied by `±1` or `±i` (11.2), so it
preserves their zero sets. Prove:
- `C` has a simple zero and `S` a triple zero at `0`, and neither has another zero on the rays
  `ph z ∈ (π/4)ℤ`;
- the zeros of each in the open sector `0 < ph z < π/4` are simple and admit an enumeration `z_n`
  by increasing modulus;
- the zero set is exactly `{0}` together with the eight images of each `z_n`, which are distinct;
  in particular the zeros in the open first quadrant are the `z_n` and the `i z̄_n`;
- 7.13.5 with 7.13.6 for `C`, respectively 7.13.7 for `S`, for the `z_n` of this sector: with
  `p₀ = 1`, `p₁ = α(απ − 4)/(8π)` and `q₀ = α/2`,
  `x_n − ∑_{j<N} p_j λ^{1−4j} = O(λ^{1−4N}(1 + |α|)^{2N})` for `N ≤ 2`, and
  `y_n − q₀ λ^{−1} = O(λ^{−5}(1 + |α|)³)`;
- if `z_n` is a zero of `erfc`, then `(1 + i) z_n/√π` is a zero of `ℱ`.

*Needs:* 11.2–11.3, 13.2–13.3; AsymptoticExpansions Layer 2; ContourIntegration residues, as in
13.3.

### 13.5 The incomplete Gamma functions near the transition point

DLMF 8.11.10–8.11.11. With `x = a + (2a)^{1/2} y`, both formulas hold as `a → +∞`, uniformly for
`y` in compact subsets of `ℝ`, with `erfc` and Dawson's integral; each is stated as a normalized
remainder that is `O(a^{−1})` uniformly on each bounded real `y`-set:
- **8.11.10** (`regularizedGamma_transition_isBigO`).
  `P(a + 1, x) − ½ erfc(−y) + ⅓ √(2/(πa)) (1 + y²) e^{−y²} = O(a^{−1})`. Route: 8.2.1 for
  `γ(a + 1, x)`, the substitution `t = a + (2a)^{1/2} s` and Stirling for `Γ(a + 1)` reduce it to a
  Gaussian integral with a moving upper endpoint `y`. The intermediate target is the uniform
  estimate: with `h_a(s) = a log(1 + s√(2/a)) − s√(2a)`, there are `C`, `c > 0` such that
  `|e^{h_a(s)} − e^{−s²}(1 + (2√2/3) s³ a^{−1/2})| ≤ C a^{−1}(1 + s⁶) e^{−cs²}` for
  `−√(a/2) < s ≤ Y` and `a ≥ a₀(Y)`. This is not the fixed-endpoint theorem of
  AsymptoticExpansions §5.2, and is proved here.
- **8.11.11** (`tricomiIncompleteGamma_transition_isBigO`).
  `x^{1−a} γ*(1 − a, −x) + cos πa − (sin πa/π)(2√π F(y) + ⅔ √(2π/a)(1 − y²)) e^{y²} = O(a^{−1})`.
  The integral 8.2.1 does not apply, since `Re(1 − a) < 0`. Route: the circle form of 3.2,
  `γ*(b, ζ) = (Γ(1 − b)/(2π)) ∫_{−π}^{π} e^{ibθ + ζe^{iθ}} dθ` for `b ∉ ℤ_{>0}` (8.6.8 with 8.2.6,
  extended to all such `b` by analytic continuation in `b`), at `b = 1 − a`, `ζ = −x`. The phase
  `−x e^{iθ} − iaθ` has its saddle at `θ = ±π`, where `e^{−iaθ}` jumps. Shifting to `θ = π − φ`
  on `(0, 2π)` gives two half-line Gaussian integrals with a linear imaginary term in the
  exponent. Their two-term expansion, uniform for bounded `y`, produces the Dawson term. The
  needed intermediate target is that two-term half-line Gaussian estimate, with remainder
  `O(a^{−1})`.

*Needs:* 1.2, 3.2, 5.2, 11.1, 11.6; ZerosOfLFunctions §1.2 (Stirling for `Γ(a + 1)`);
AsymptoticExpansions Layer 1.

### Examples

- `√π x e^{x²} erfc x → 1` as `x → +∞`, the case `n = 1` of 7.12.1 on the positive axis.
- `erf` has no real zero other than `0`, because `TauCeti.Real.erf` is strictly increasing
  (`TauCeti.Real.strictMono_erf`).
- At `y = 0`, 8.11.10 gives `P(a + 1, a) = ½ − ⅓ √(2/(πa)) + O(a^{−1})`.

### Dependencies

Layers 1, 3, 5, 11 and 12; AsymptoticExpansions Layers 1, 2 and 4; ZerosOfLFunctions §1.2;
ContourIntegration residues.

## Layer 14: inverse error functions, repeated integrals and Voigt functions

### 14.1 Inverse error functions

DLMF 7.17.1–7.17.6. `inverf` is `Real.erfInv` and `inverfc x` is `Real.erfInv (1 − x)`. Prove
7.17.2 for `|x| < 1`, with the coefficients defined by the recursion 7.17.2_5 and the four printed
coefficients as checks (`hasSum_erfInv`). Prove 7.17.3–7.17.6 as `x → 0+`, with `u`, `v` from
7.17.5–7.17.6, as a generalized expansion with logarithmic weights (`erfInv_one_sub_isBigO`). The
coefficients `a_k` of 7.17.4 are polynomials in `v`, and `v → ∞`, so this is not a Poincaré
expansion in the scale `u^{k−1/2}`. With `c₀ = 1`, `c₁ = 0`, `c₂ = v/8`, `c₃ = −(v² + 6v − 6)/32`
and `c₄ = (4v³ + 27v² + 108v − 300)/384`, for `N ≤ 5`:
`inverfc x − ∑_{j<N} c_j(v) u^{j−1/2} = O(u^{N−1/2} (1 + |v|)^N)` as `x → 0+`.

*Needs:* 13.1; Tau Ceti `Real.erfInv`, `Real.hasDerivAt_erfInv`, `Real.erf_erfInv` and
`Real.tendsto_erfInv_nhdsLT_one`; AsymptoticExpansions Layer 1 and Layer 2.

### 14.2 Repeated integrals

DLMF 7.18.1–7.18.9, 7.18.12–7.18.14. `iⁿ erfc` (`iteratedErfc`) is entire for each `n`, and its
defining integral converges absolutely for every `z`. Prove:
- `i⁰ erfc = erfc` (`iteratedErfc_zero`), `iⁿ erfc(0) = 1/(2ⁿ Γ(n/2 + 1))` (7.18.3), and
  `(iⁿ⁺¹ erfc)′ = −iⁿ erfc` for `n ≥ 0` (`hasDerivAt_iteratedErfc`), with
  `(i⁰ erfc)′ = −(2/√π) e^{−z²}`;
- 7.18.1–7.18.2, with the iterated-integral form along the horizontal ray;
- 7.18.3–7.18.4;
- 7.18.5 for `n ≥ 1`;
- 7.18.6–7.18.7 (`iteratedErfc_add_two`), with 7.18.7 at `n = 1` using `i⁻¹ erfc` written out;
- 7.18.8 with `H_n` through `Polynomial.hermite`;
- 7.18.9 with `𝐌`;
- 7.18.12, `iⁿ erfc(z) = (2^{n−1}π)^{−1/2} Hh_n(√2 z)` (`iteratedErfc_eq_repeatedGaussianIntegral`),
  with `Hh_n = TauCeti.repeatedGaussianIntegral n` consumed from the parabolic cylinder roadmap
  (the substitution `t = s/√2` in 7.18.2);
- 7.18.13 for `n ≥ 1` and `Re z > 0`, via 4.1. With `e_k = i^{n−1+k} erfc(z)`, the fraction has
  `b_k = z`, `a₁ = ½` and `a_k = (n + k − 1)/2` (`k ≥ 2`), and its minimal solution is
  `f(0) = n e₀`, `f(k) = (−1)^k (n)_k e_k` (`k ≥ 1`), so `−f(1)/f(0) = e₁/e₀`; the recurrence is
  7.18.7. Minimality follows from the criterion of 4.1, with the large-`k` behaviour of `e_k` from
  7.18.2 by Laplace's method (AsymptoticExpansions §5.2);
- 7.18.14 in `|ph z| ≤ 3π/4 − δ`.

**Checks.**
- `i¹ erfc(z) = e^{−z²}/√π − z erfc z`, and `i¹ erfc(0) = 1/√π`.
- `iⁿ erfc(x) > 0` for real `x`.
- 7.18.12 at `n = 0` is `erfc z = √(2/π) Hh₀(√2 z)`, consistent with the parabolic cylinder
  roadmap's check `Hh₀(x) = √(π/2) erfc(x/√2)`.

*Needs:* 11.1, 11.4, 13.1, 4.1; SpecialFunctionsParabolicCylinder §5.3; AsymptoticExpansions
§5.2; Mathlib `Polynomial.hermite`, `Complex.regularizedHGFun`.

### 14.3 Voigt functions

DLMF 7.19.1–7.19.11. The integrals 7.19.1, 7.19.2 and 7.19.4 (`voigtU`, `voigtV`, `voigtH`)
converge absolutely for `t > 0`, respectively `a > 0`, and define functions continuous in `(x, t)`
on `ℝ × (0, ∞)`, respectively in `(a, u)` on `(0, ∞) × ℝ`. For `t > 0`: 7.19.3 with
`z = (1 − ix)/(2√t)` (`voigt_eq_erfc`); 7.19.4 for `a > 0`; 7.19.5 as `t → 0+`; 7.19.6–7.19.9;
and 7.19.10–7.19.11 for `a > 0` and real `u`.

**Checks.**
- `𝖴(·, t)` is even and `𝖵(·, t)` is odd.
- `∫_ℝ 𝖴(x, t) dx = π` for every `t > 0`.
- `𝖴(x, t) → 1/(1 + x²)` and `𝖵(x, t) → x/(1 + x²)` as `t → 0+` (7.19.5).

*Needs:* 11.1, 12.1; Mathlib `integral_gaussian`, Fubini and dominated convergence.

### Examples

- The coefficients of 7.17.2 from 7.17.2_5: `1`, `1/3`, `7/30`, `127/630`.
- `inverfc 1 = 0` and `inverfc x → +∞` as `x → 0+`.
- 7.19.3 at `x = 0`: `𝖴(0, t) = √(π/(4t)) e^{1/(4t)} erfc(1/(2√t))`.

### Dependencies

Layers 4, 11, 12 and 13; SpecialFunctionsParabolicCylinder §5.3; AsymptoticExpansions Layers 1, 2
and 5; Tau Ceti's inverse error function.

## Layer 15: incomplete Beta functions

### 15.1 Definition and normalization

DLMF 8.17.1–8.17.6, 8.17.24. `B_x(a, b)` is `incompleteBeta a b x`. For `a, b > 0` and
`0 ≤ x ≤ 1`:
- `TauCeti.regularizedIncompleteBeta a b x = B_x(a, b)/B(a, b)` (8.17.2,
  `regularizedIncompleteBeta_eq_incompleteBeta`), with `ProbabilityTheory.beta`;
- 8.17.3 is the definition of `ProbabilityTheory.beta`;
- 8.17.4 is Tau Ceti's `regularizedIncompleteBeta_symm`, and is not restated;
- 8.17.5 (`regularizedIncompleteBeta_natCast`) and 8.17.24 for positive integers `m`, `n` and
  `0 ≤ x < 1`, 8.17.24 as a convergent series;
- 8.17.6 for `0 ≤ x ≤ ½`.

**Checks.**
- `B_x(1, 1) = x` and `B_x(a, 1) = x^a/a`.
- `B_1(a, b) = ProbabilityTheory.beta a b`.
- `I_x(1, b) = 1 − (1 − x)^b`.

*Needs:* Tau Ceti `TauCeti.regularizedIncompleteBeta_def_of_mem_Icc`,
`TauCeti.integral_rpow_mul_one_sub_rpow` and `regularizedIncompleteBeta_symm`; Mathlib
`ProbabilityTheory.beta`.

### 15.2 Hypergeometric and integral representations

DLMF 8.17.7–8.17.10. 8.17.7–8.17.8 for `0 ≤ x < 1` (`incompleteBeta_eq_hypergeometric` for
8.17.7), and 8.17.9 for `0 ≤ x < ½` (where `|x/(x − 1)| < 1`), all with Mathlib's
`ordinaryHypergeometric`. 8.17.10 for `0 < x < 1` and `x < c < 1`, as a vertical-line integral.

*Needs:* 15.1, 3.3; Mathlib `ordinaryHypergeometric`.

### 15.3 Recurrences

DLMF 8.17.11–8.17.21. All, for `a, b > 0` and `0 ≤ x ≤ 1`, with the parameters in each formula
positive. 8.17.20 is Tau Ceti's `regularizedIncompleteBeta_add_one_left`, and is not restated.

*Needs:* 15.1; Tau Ceti `regularizedIncompleteBeta_add_one_left` and
`regularizedIncompleteBeta_add_one_right`.

### 15.4 Continued fraction

DLMF 8.17.22–8.17.23. Convergence to the stated value for `0 ≤ x < 1`, via 4.1; at `x = 0` every
`d_m` vanishes and the fraction is `1`. For `0 < x < 1`, with
`g_n = F(a + b + ⌊n/2⌋, ⌈n/2⌉; a + n; x)` (Mathlib's `ordinaryHypergeometric`), prove the
contiguous relations `g_{n−1} = g_n + d_n g_{n+1}` (`n ≥ 1`). Then `g₀ = 1`,
`g₁ = F(a + b, 1; a + 1; x)` gives the value through 8.17.8, and `f(n) = (−1)ⁿ d₁⋯d_{n−1} g_n` is
the minimal solution with `f(0) = 1` for the fraction with `a₁ = 1`, `a_{n+1} = d_n` and
`b_n = 1`. Minimality follows from the criterion of 4.1 and `g_{n+1}/g_n → 2/(1 + √(1 − x))`, the
smaller of the characteristic roots `2(1 ∓ √(1 − x))/x` of the limiting recurrence. Prove this
limit by applying AsymptoticExpansions §12.1 to the two-step recurrences of `(g_{2k})` and
`(g_{2k+1})`, whose coefficients are rational in `k` with limits having the distinct
characteristic roots `(2(1 ∓ √(1 − x))/x)²`, together with a growth bound `g_n = O(Rⁿ)` for some
`R < 2(1 + √(1 − x))/x`, which selects the smaller root. DLMF's bracketing of the convergents is
not owned; see [Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

*Needs:* 15.2, 4.1; AsymptoticExpansions §12.1.

### 15.5 Large `a`, fixed `b` and `x`

DLMF 8.18.1. For fixed `b > 0`, `0 < x < 1` and each `n`, the normalized remainder
`Γ(a + n + 1) (I_x(a, b)/(Γ(a + b) x^a (1 − x)^{b−1}) − S_n)`, with
`S_n = ∑_{k<n} (x/(1 − x))^k/(Γ(a + k + 1) Γ(b − k))`, is bounded as `a → +∞`, with `1/Γ(b − k)`
Mathlib's entire reciprocal (`regularizedIncompleteBeta_large_a_isBigO`). For `b ∈ ℤ_{>0}` and
`n ≥ b` it is exactly `0`.

*Needs:* 15.1, 15.3; AsymptoticExpansions §3.1.

### Examples

- 8.17.5 at `m = n`: `I_x(n, 1) = xⁿ`.
- 8.17.22 at `x = 0` has every `d_m = 0`, and its value is `1`.
- 8.18.1 at `b = 1`, `n = 1`: `I_x(a, 1) = x^a` and the remainder is `0`.

### Dependencies

3.3 and 4.1; AsymptoticExpansions §§3.1 and 12.1; Tau Ceti's regularized incomplete Beta
function; Mathlib's Gauss function and Beta function.

## Downstream consumers

- **[AsymptoticExpansions](../AsymptoticExpansions/README.md)** cites DLMF 2.5.49 and
  2.11.5–2.11.7 as statements about `E₁` and `E_p`; they are proved here (8.1, 7.1 and 7.6).
- Any roadmap that needs the complex error functions, the exponential, logarithmic, sine or
  cosine integrals, or the complex incomplete Gamma and Beta functions consumes them from here,
  with the definitions and conventions pinned above.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.
- **Formulas through Kummer's second function `U` and Whittaker functions**: DLMF 6.11.2–6.11.3,
  7.11.5, 7.18.10, 8.5.3–8.5.5, 8.19.16. They belong to a confluent hypergeometric roadmap
  (DLMF Chapter 13).
- **The relation to the parabolic cylinder functions**: DLMF 7.18.11. It is 7.18.12 combined with
  `U(n + ½, z) = e^{z²/4} Hh_n(z)` (DLMF 12.7.7), and belongs to the parabolic cylinder roadmap.
- **Formulas through modified and spherical Bessel functions, Laguerre and Chebyshev
  polynomials**: DLMF 6.7.15–6.7.16, 6.10.4–6.10.8, 7.6.8–7.6.11, 8.6.6, 8.7.4–8.7.6,
  8.21.16–8.21.17. They belong to Bessel-function and orthogonal-polynomial roadmaps.
- **The continued Gauss function**: DLMF 8.14.5–8.14.6, 8.17.9 and 8.19.25 outside the unit disc
  of the hypergeometric argument. They belong to a hypergeometric roadmap (DLMF Chapter 15).
- **The Hurwitz zeta function at complex shift**: DLMF 8.15.2.
- **Uniform asymptotic expansions for large parameter**, which rest on the coalescence of a saddle
  point with a pole (beyond AsymptoticExpansions): DLMF §8.12 (8.12.1–8.12.22), §8.18(ii)
  (8.18.2–8.18.18), and the uniform approximations of Dunster and Paris cited there. Also
  excluded are the error bounds and exponentially improved extensions of 8.11.7 (Nemes), the
  extension of 8.11.7 to `−a`, `λ < 0`, and the inverse-function expansions of 8.12.21–8.12.22
  and 8.18.18.
- **Exponentially improved expansions and the Stokes phenomenon** for `E_p`, `erfc` and the
  auxiliary functions (DLMF §2.11(iii)–(v) applied to them; §§6.12, 7.12 references).
- **The bracketing of the incomplete Beta convergents** stated after DLMF 8.17.23. As printed
  (unconditionally for `a, b > 0`, `0 ≤ x ≤ 1`), it fails at large indices: for `a = 2.5`,
  `b = 3.3`, `x = 0.3` the convergents built from `d_1, …, d_n` exceed `I_x(a, b)` for every
  `n ≥ 5`, although half of them should lie below it. The range of indices for which it holds
  must be established before it can be specified.
- **The numerical values of the double zeros of `γ*(a, x)`** (DLMF Table 8.13.1), the complex
  trajectories of the `a`-zeros, and the `λ`-zeros of §8.13(ii). The existence and multiplicity
  of the double zero at `x = x*_n` are owned (6.2).
- **Numerical tables of zeros** (DLMF Tables 7.13.1–7.13.4, the 30-digit values of `c₁`, `c₂` and
  `x₀`).
- **Number theory**: von Koch's theorem 6.16.5, `li(x) − π(x) = O(√x ln x)` under the Riemann
  hypothesis, for an analytic number theory roadmap.
- **Methods of computation, tables, approximations and software** (DLMF §§6.18–6.21, 7.22–7.25,
  8.25–8.28), including the recurrences 6.18.1–6.18.2 of Acton's algorithm; the applications
  sections §§6.17, 7.20(ii), 7.21, 8.23, 8.24; and the generalized error functions of §7.16, which
  are incomplete Gamma functions by a change of variable and have no numbered formulas.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its
directories `DLMF/IncompleteGamma/`, `DLMF/ExpIntegrals/` and `DLMF/ErrorFunctions/`, with the
basic definitions in `DLMF/Confluent/Basic/` and `DLMF/Statistical/Basic/`, provide source
material for every layer. That development defines `Γ(a, z)` through Kummer's second function
`U`. This roadmap defines it by the ray integral, so that `U` is not needed. Its `γ*` is the same
as here, through `regularizedHGFun`. Its sine and cosine integrals are power series, while here
they are segment integrals and the series are theorems.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source contains both proved theorems and admitted statements, and serves as a
reference, not as a specification. The following secondary provenance map records source
counterparts; the mathematical targets and dependencies are specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1. Definitions, continuation | `Statistical/Basic/IncompleteGamma`, `Confluent/Basic/IncompleteGamma`, `IncompleteGamma/Basic`, `IncompleteGamma/Regularized`, `IncompleteGamma/ContinuedProperties` |
| 2. Values, series, recurrences | `IncompleteGamma/SpecialValues`, `IncompleteGamma/SeriesRecurrences` |
| 3. Integral representations | `IncompleteGamma/Representations/{UpperBarnes, LowerBarnes}`, `IncompleteGamma/RealIntegrals`, `IncompleteGamma/ZerosIntegrals` |
| 4. Fractions, inequalities | `IncompleteGamma/BoundsFractions`, `IncompleteGamma/BoundTools`, `IncompleteGamma/FractionTools`; general tools in `DLMFMathlib/Analysis/ContinuedFraction/{Convergence, JacobiValueRegion, PositiveConvergence}` |
| 5. Asymptotics | `IncompleteGamma/Asymptotics/{LargeArgument, PartialSums, Central}` |
| 6. Zeros | `IncompleteGamma/ZerosIntegrals` |
| 7. `E_p` | `Confluent/Basic/ExponentialIntegrals`, `IncompleteGamma/ExponentialIntegral`, `IncompleteGamma/ExpIntegralAsymptotics` |
| 8–9. `E₁`, `Ei`, `li`, `Si`, `Ci` | `ExpIntegrals/Basic/{Functions, Properties}`, `ExpIntegrals/{AnalyticProperties, Continuation, Representations, Expansions, Asymptotics, ZerosIntegrals}`, `ExpIntegrals/TransformTools/*` |
| 10. `Si(a, z)`, `Ci(a, z)` | `IncompleteGamma/SineCosine/{SphericalSeries, GammaRepresentations}` |
| 11. Error functions | `Confluent/Basic/ErrorFunctions`, `ErrorFunctions/Basic/{Functions, Properties}`, `ErrorFunctions/{Series, AnalyticProperties, Relations}` |
| 12. Integrals, inequalities | `ErrorFunctions/Integrals/*`, `ErrorFunctions/IntegralTools`, `ErrorFunctions/BoundsAsymptotics/ContinuedFractions` |
| 13. Asymptotics, zeros | `ErrorFunctions/BoundsAsymptotics/{GaussianRemainders, FresnelRemainders}`, `ErrorFunctions/{Zeros, ZeroTools, ZeroClassification}` |
| 14. Inverse, `iⁿ erfc`, Voigt | `ErrorFunctions/Basic/Inverse`, `ErrorFunctions/{InverseGeneralized, Repeated, Voigt}` |
| 15. Incomplete Beta | `IncompleteGamma/Basic/IncompleteBeta`, `IncompleteGamma/{Beta, BetaContinuedFraction, BetaAsymptotics}` |

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 6 (N. M. Temme), Chapter 7
  (N. M. Temme) and Chapter 8 (R. B. Paris), <https://dlmf.nist.gov/6>,
  <https://dlmf.nist.gov/7>, <https://dlmf.nist.gov/8>; and
  [§2.5(ii)](https://dlmf.nist.gov/2.5#ii), [§2.11(ii)](https://dlmf.nist.gov/2.11#ii).
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974, Chapters 2–3 and 9.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapters 3 and 11.
- W. B. Jones and W. J. Thron, *Continued Fractions: Analytic Theory and Applications*,
  Addison-Wesley, 1980, Chapter 4 (Pincherle's theorem).
- W. Gautschi, Computational aspects of three-term recurrence relations, *SIAM Rev.* 9 (1967),
  24–82.
- F. G. Tricomi, Asymptotische Eigenschaften der unvollständigen Gammafunktion, *Math. Z.* 53
  (1950), 136–148.
- K. S. Kölbig, On the zeros of the incomplete gamma function, *Math. Comp.* 26 (1972), 751–756.
- A. J. MacLeod, Asymptotic expansions for the zeros of certain special functions, *J. Comput.
  Appl. Math.* 145 (2002), 261–267.

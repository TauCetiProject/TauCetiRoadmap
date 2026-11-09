# Roadmap: Bessel functions

**Summary.** This roadmap builds the theory of the Bessel functions of Chapter 10 of the NIST
*Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a library.
The Bessel functions `J_ν`, `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν` are the standard solutions of Bessel's
equation

```text
z² w″ + z w′ + (z² − ν²) w = 0                                     (DLMF 10.2.1)
```

and the modified Bessel functions `I_ν`, `K_ν` are the standard solutions of the modified equation
`z² w″ + z w′ − (z² + ν²) w = 0` (DLMF 10.25.1).

The roadmap covers:
- the definitions of `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` beside Mathlib's `J_ν`, as
  holomorphic functions of `z` on the slit plane and entire functions of `ν`, with Bessel's
  equations, the Wronskians, the connection formulas, the recurrences and the analytic
  continuation;
- the power series, limiting forms, generating functions, addition theorems and Neumann
  expansions;
- the integral representations, the continued fractions, the derivatives with respect to the
  order and the relations to elementary, Kummer and parabolic cylinder functions;
- the expansions for large argument, with error bounds, and the modulus and phase functions;
- the expansions for large order outside the transition region (Debye's expansions);
- the real zeros of `J_ν`, `Y_ν` and of their derivatives: interlacing, infinite products,
  McMahon's expansions, the zeros of cross-products and the Fourier–Bessel series;
- integrals and sums of products;
- the spherical Bessel functions;
- the Kelvin functions;
- the formulas of DLMF Chapters 6–9 and 12 that other roadmaps leave to a Bessel roadmap.

**This roadmap is a substantial part of DLMF Chapter 10, not all of it.** It owns the
definitions, the equations and the classical theory on the principal sheet, the large-argument
and Debye expansions with their error bounds, the real zeros, the integrals, and the spherical
and Kelvin functions; the formula ranges are in the table under
[Scope and ownership](#scope-and-ownership). The rest of the chapter is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement), in two
groups: material planned for follow-up roadmaps, chiefly the Airy-type uniform expansions of
§10.20 and what rests on them and the formulas through Struve, Whittaker, Legendre and Gauss
functions, which belong with roadmaps for DLMF Chapters 11 and 13–15; and material deferred
without a planned roadmap, such as imaginary order, complex zeros, exponentially improved
expansions, the Hankel and Kontorovich–Lebedev transforms and the numerics of §§10.72–10.75;
the notation, graphs, approximations and software sections (§§10.1, 10.3, 10.26, 10.48, 10.62,
10.76, 10.77) have nothing to formalize.

The general asymptotic and contour tools are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md) (DLMF Chapter 2): the expansion API,
reversion, Watson's lemma, Laplace's method on contours and saddle points, the Mellin tools, the
Volterra equations, the regular and rank-one irregular singularities and the Liouville–Green
approximation. The Airy functions, Kummer's second transformation and the integral of `J₀` are
consumed from [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md), the parabolic cylinder
functions from [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md),
`K_ν` on `(0, ∞)` and `Y_ν` on `Re z > 0` from
[AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md), `I_ν` at real argument from
[AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md), and the exponential, sine and
cosine integrals, the error functions, the incomplete Gamma functions and Pincherle's theorem from
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md). This
roadmap builds the removable singularity in the order behind 10.2.4 and 10.27.5, Neumann's
polynomials, Gegenbauer's polynomials, the Rayleigh functions, the partial-fraction expansion of
`J′_ν/J_ν` and the Fourier–Bessel expansion theorem.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Bessel/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/BesselI.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definitions and the equations** (DLMF §§10.2, 10.4–10.6, 10.11, 10.13, 10.25, 10.27–10.29,
   10.34, 10.36): the definitions, Bessel's equations, holomorphy in `z` and in `ν`, Wronskians,
   connection formulas, recurrences, analytic continuation and the other differential equations.
2. **Series and sums** (DLMF §§10.7, 10.8, 10.12, 10.23, 10.30, 10.31, 10.35, 10.44): limiting
   forms, power series, generating functions, multiplication and addition theorems and Neumann
   expansions.
3. **Integral representations** (DLMF §§10.9, 10.32).
4. **Continued fractions, derivatives with respect to the order and relations to other
   functions** (DLMF §§10.10, 10.15, 10.16, 10.33, 10.38, 10.39).
5. **Large argument** (DLMF §§10.14, 10.17, 10.18, 10.37, 10.40): inequalities, the expansions
   with their error bounds, and the modulus and phase functions.
6. **Large order** (DLMF 10.19.1–10.19.7 and 10.41.1–10.41.13 on the positive real axis).
7. **Zeros** (DLMF §§10.21, 10.42 and 10.23(iii)).
8. **Integrals** (DLMF §§10.22, 10.43).
9. **Spherical Bessel functions** (DLMF §§10.47–10.60).
10. **Kelvin functions** (DLMF §§10.61–10.71 without §10.69).
11. **Relations owed to other roadmaps**: the formulas of DLMF Chapters 6–9 and 12 through
    Bessel functions that their roadmaps exclude.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 10.2.1–10.2.4, 10.4.1–10.4.8, 10.5.1–10.5.5, 10.6.1–10.6.10, 10.11.1–10.11.9, 10.13.1–10.13.11 | `J`, `Y`, `H`: equation, connection formulas, Wronskians, recurrences, continuation, other equations (1.1–1.6). |
| 10.25.1–10.25.3, 10.27.1–10.27.11, 10.28.1–10.28.2, 10.29.1–10.29.5, 10.34.1–10.34.7, 10.36.1–10.36.2 | `I`, `K`: the same (1.7–1.9). |
| 10.7.1–10.7.8, 10.8.1–10.8.3, 10.30.1–10.30.5, 10.31.1–10.31.3 | Limiting forms and power series (2.1–2.2). |
| 10.12.1–10.12.6, 10.35.1–10.35.6 | Generating functions and Jacobi–Anger expansions (2.3). |
| 10.23.1–10.23.17, 10.44.1–10.44.6 | Multiplication and addition theorems, Gegenbauer's addition theorem, Neumann expansions (2.4–2.6). |
| 10.9.1–10.9.30, 10.32.1–10.32.19 | Integral representations (Layer 3). |
| 10.10.1–10.10.2, 10.33.1–10.33.2 | Continued fractions (4.1). |
| 10.15.1–10.15.9, 10.38.1–10.38.7 | Derivatives with respect to the order (4.2). |
| 10.16.1–10.16.5, 10.16.9, 10.39.1–10.39.5, 10.39.9 | Relations to elementary, parabolic cylinder, Kummer and `₀F₁` functions (4.3). |
| 10.2.5–10.2.6, 10.17.1–10.17.15, 10.40.1–10.40.12 | Large-argument expansions and error bounds, on the principal sheet (5.1–5.3). |
| 10.18.1–10.18.21 | Modulus and phase (5.4). |
| 10.14.1–10.14.8, 10.37.1 | Inequalities and monotonicity (5.5). |
| 10.19.1–10.19.7, 10.41.1–10.41.13 | Large order: Debye's expansions (Layer 6). |
| 10.21.1–10.21.21, 10.21.48–10.21.55, 10.22.37–10.22.38, 10.23.18–10.23.21 | Real zeros, cross-product zeros, Rayleigh functions, Fourier–Bessel series (Layer 7). |
| 10.22.1, 10.22.3–10.22.49, 10.22.51–10.22.55, 10.22.59–10.22.65, 10.22.67–10.22.70, 10.22.73–10.22.75 | Integrals of `J`, `Y`, `H` (8.1–8.3). |
| 10.43.1, 10.43.3–10.43.21, 10.43.23–10.43.25, 10.43.27–10.43.29 | Integrals of `I`, `K` (8.4). |
| 10.47.1–10.47.17, 10.49.1–10.49.21, 10.50.1–10.50.4, 10.51.1–10.51.6, 10.52.1–10.52.6, 10.53.1–10.53.4, 10.54.1–10.54.5, 10.55.1, 10.56.1–10.56.5, 10.57.1, 10.58.1–10.58.2, 10.59.1, 10.60.1–10.60.14 | Spherical Bessel functions (Layer 9). |
| 10.61.1–10.61.12, 10.63.1–10.63.7, 10.64.1–10.64.2, 10.65.1–10.65.9, 10.66.1–10.66.2, 10.67.1–10.67.16, 10.68.1–10.68.21, 10.70.1–10.70.2, 10.71.1–10.71.8 | Kelvin functions (Layer 10). |
| 9.6.2–9.6.9 (`K`, `H` and complex `I` forms), 9.6.15–9.6.20, 9.8.9–9.8.12, 9.12.22–9.12.23, 9.13.2 and 9.13.4 (`K` forms) | Airy relations (11.1). |
| 12.7.8–12.7.11 | Parabolic cylinder relations (11.2). |
| 6.7.15–6.7.16, 6.10.4–6.10.8, 7.6.8–7.6.11, 8.6.6, 8.7.4–8.7.5, 8.21.16–8.21.17 | Relations to the functions of Chapters 6–8 (11.3). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- DLMF 10.2.2, the definition of `J_ν` (Mathlib `Complex.besselJ_def`).
- The `J` half of 10.4.1, `J_{−n} = (−1)ⁿ J_n` (Mathlib `Complex.besselJ_neg_int`); the `Y`
  half is a target.
- The first identity of 10.6.1 for `J`, `2ν J_ν = z J_{ν−1} + z J_{ν+1}` (Mathlib
  `Complex.two_mul_self_mul_besselJ`); the derivative identity, and both for `Y`, `H⁽¹⁾`, `H⁽²⁾`,
  are targets.
- 10.11.1 at integer order and `m = ±1`, `J_n(−z) = (−1)ⁿ J_n(z)` (Mathlib
  `Complex.besselJ_int_neg`, `Complex.odd_besselJ`, `Complex.even_besselJ`).
- For real `ν` and real `x`, the restriction of `I_ν` to `(0, ∞)` with its series (10.25.2;
  Tau Ceti `Real.besselI_eq_rpow_mul`, `Real.hasSum_besselI`);
  `I_{ν−1}(x) − I_{ν+1}(x) = (2ν/x) I_ν(x)` and `I′_ν(x) = I_{ν+1}(x) + (ν/x) I_ν(x)` for
  `x ≠ 0`, one form each of 10.29.1
  and 10.29.2 (`Real.besselI_sub_besselI`, `Real.hasDerivAt_besselI`); the case `k = 1` of the
  second identity of 10.29.4, `d/dx((x/2)^{−ν} I_ν(x)) = (x/2)^{−ν} I_{ν+1}(x)`
  (`Real.hasDerivAt_rpow_neg_mul_besselI`); 10.30.1 on the positive
  axis (`Real.tendsto_rpow_neg_mul_besselI_nhdsGT_zero`); the values `I_ν(0)`
  (`Real.besselI_zero`); `I_ν(x) > 0` for `ν > −1`, `x > 0` (`Real.besselI_pos`); and 10.32.3
  at real argument and natural order (`Real.integral_exp_mul_cos_mul_cos`, over `[−π, π]`).
  The targets of 1.7–1.8, 2.1 and 3.1 are the complex argument, `K_ν`, and the other forms of
  10.29.1–10.29.2 (`I_{ν−1} + I_{ν+1} = 2I′_ν`, `I′_ν = I_{ν−1} − (ν/z) I_ν`).
- The positive-axis and right-half-plane results of AnalyticNumberTheoryPartI and the
  real-argument results of AutomorphicSpectralTheory listed under
  [Exact supplier contracts](#exact-supplier-contracts): for `K_ν(x)`, `x > 0`, the integral
  10.32.9, 10.27.3, holomorphy in `ν`, 10.25.1, positivity, decay and `K_{1/2}`; for `Y_ν` on
  `Re z > 0`, 10.9.7 with 10.2.3, holomorphy, 10.2.1 and 10.6.1; for real `ν` and `x > 0`, the
  size of the remainders of 10.40.2 and of the `Y_ν` form of 10.17.4 in the ranges stated there;
  and for `I_ν` at real argument, 10.25.2 with 10.25.1, 10.29.1 and 10.27.1 for `y > 0`. The
  targets are their extensions to the slit plane, and the agreement of the definitions
  (`besselK_ofReal_eq_positiveAxisBesselK` and `besselY_eq_schlafli`, 3.1). The pinned `I_ν` at
  real `y` is AutomorphicSpectralTheory's `I_ν(y)` by definition.

It also owns the following auxiliary results, which the layers need and which neither Mathlib,
Tau Ceti nor a consumed roadmap provides:

| Result | Target |
|---|---|
| `J_ν(z)` and `I_ν(z)` are entire in `ν` for `z` in the slit plane, and the quotients 10.2.3 and 10.27.4 have removable singularities at the integers | 1.2, 1.7 |
| Uniqueness for Bessel's equation on the slit plane given value and derivative at one point | 1.1 |
| Sturm comparison on an open interval `I ⊆ ℝ`: for `p > 0` of class `C¹` and continuous `q₁ ≤ q₂`, if `a < b` are consecutive zeros of a nontrivial real solution `u` of `(p u′)′ + q₁ u = 0`, then every real solution `v` of `(p v′)′ + q₂ v = 0` has a zero in `(a, b)`, unless `q₁ = q₂` on `[a, b]` and `v` is a constant multiple of `u` on `[a, b]`; and the zeros of a nontrivial real solution are simple and isolated | 7.1 |
| Neumann's polynomials `O_n(t)` of 10.23.13, and their generating function 10.23.12 | 2.6 |
| Gegenbauer's polynomials `C_n^{(ν)}(x)` by the explicit sum 18.5.10, with the generating function 18.12.4, the expansion 18.18.17 of `(2x)ⁿ` and `C_n^{(1/2)}(x) = P_n(x)` | 2.5 |
| The holomorphic continuation of `𝐅(α, β; γ; x)` (Mathlib's `Complex.regularizedGaussHGFun`) from `|x| < 1` to `ℂ \ [1, ∞)` for `α = (μ + ν)/2`, `β = (μ + ν + 1)/2`, `γ = ν + 1`, `Re(μ + ν) > 0` | 8.2 |
| The partial-fraction expansion `J′_ν(z)/J_ν(z) = ν/z − ∑ₘ 2z/(j_{ν,m}² − z²)` and its logarithmic integral | 7.3 |
| Rayleigh's functions `σ_n(ν) = ∑ₘ j_{ν,m}^{−2n}` and the recursion from the Maclaurin series of `J_{ν+1}/J_ν` | 7.3 |
| The Fourier–Bessel expansion theorem for functions of bounded variation | 7.6 |
| Debye's polynomials `U_k`, `V_k` (10.41.9) | 6.1 |
| The explicit error bound of the Liouville–Green Case I expansion on `(ξ, ∞)` for real `ξ` (Olver 1997, Chapter 10, Theorem 3.1) | 6.1 |
| The variation of `t^{−ℓ}` along the paths `P(z)` of 5.3, bounded as in 10.17.15 and 10.40.12 | 5.3 |

**What it does not own:**
- The general asymptotic and contour tools: asymptotic expansions, reversion, Watson's lemma,
  Laplace's method and saddle points, the Mellin tools, Volterra equations, regular and rank-one
  irregular singularities, and the Liouville–Green approximation. They are consumed from
  AsymptoticExpansions; see [Exact supplier contracts](#exact-supplier-contracts).
- `Ai`, `Bi` and the generalized Airy functions, Kummer's second transformation
  `e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)` and the integral
  `J₀(z) = (2π)⁻¹ ∫₀^{2π} e^{iz cos φ} dφ`, consumed from SpecialFunctionsAiry.
- The parabolic cylinder functions `U(a, z)` and `W(a, x)`, consumed from
  SpecialFunctionsParabolicCylinder.
- `K_ν(x)` for complex `ν` and `x > 0`, `Y_ν(z)` on `Re z > 0`, and their positive-axis
  remainder bounds, consumed from AnalyticNumberTheoryPartI; `I_ν` at real argument, consumed
  from AutomorphicSpectralTheory. This roadmap owns their extensions to the slit plane.
- The exponential, sine and cosine integrals, the error and Fresnel functions, the incomplete
  Gamma functions and Pincherle's theorem, consumed from SpecialFunctionsEiLiErfIncompleteGamma.
- The formulas through the Struve, Whittaker, Kummer `U` and Legendre functions, which neither
  Mathlib, Tau Ceti nor a consumed roadmap defines, and the formulas through the Gauss
  hypergeometric function other than 10.22.49 and 10.22.64 (DLMF 10.16.6–10.16.8, 10.16.10, 10.22.2,
  10.22.50, 10.22.56–10.22.58, 10.22.66, 10.22.71–10.22.72, 10.39.6–10.39.8, 10.39.10,
  10.43.2, 10.43.22, 10.43.26, and 9.6.21–9.6.24).
- Values off the principal sheet: the parts of DLMF 10.17.5–10.17.6, 10.17.11–10.17.12, 10.40.2,
  10.40.4–10.40.5 with `|ph z| ≥ π`.
- The uniform expansions for large order in terms of Airy functions and everything that rests on
  them (DLMF §10.20, 10.19.8–10.19.15, 10.21.22–10.21.47, 10.41.14–10.41.15, 10.14.9, §10.57
  beyond 10.57.1, §10.69), and the complex sectors of Debye's expansions.
- Functions of imaginary order (DLMF §§10.24, 10.45), the generalized and incomplete Bessel
  functions (DLMF §10.46), the complex zeros (DLMF §10.21(ix)–(x)), the exponentially improved
  expansions (DLMF 10.17.16–10.17.18, 10.40.13–10.40.14), the Hankel and Kontorovich–Lebedev
  transforms (DLMF 10.22.76–10.22.79, 10.43.30–10.43.31), and the applications, computation and
  tables (DLMF §§10.72–10.75).

See the last section for these.

**The boundary in one sentence:** this roadmap owns `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν`, the
spherical and Kelvin functions and everything in DLMF Chapter 10 stated through them and functions
that Mathlib, Tau Ceti or a consumed roadmap defines, on the principal sheet, together with the
Bessel formulas that the roadmaps of Chapters 6–9 and 12 exclude; it consumes the general methods of
AsymptoticExpansions, the positive-axis `K_ν` and right-half-plane `Y_ν` of
AnalyticNumberTheoryPartI and the real-argument `I_ν` of AutomorphicSpectralTheory, and excludes
formulas through the Struve, Whittaker, `U` and Legendre functions and, except 10.22.49 and
10.22.64, the Gauss function, the Airy-type uniform theory of §10.20, imaginary order, transforms
and numerics.

## Conventions

- **Names.** The complex functions live in `Complex`, beside Mathlib's `Complex.besselJ`:
  `Complex.besselY`, `Complex.hankelH1`, `Complex.hankelH2`, `Complex.besselI`,
  `Complex.besselK : ℂ → ℂ → ℂ`, order first; `Complex.sphericalBesselJ`,
  `Complex.sphericalBesselY`, `Complex.sphericalHankelH1`, `Complex.sphericalHankelH2`,
  `Complex.modifiedSphericalBesselI1`, `Complex.modifiedSphericalBesselI2` and
  `Complex.modifiedSphericalBesselK : ℕ → ℂ → ℂ`. The real functions live in `Real`, beside Tau
  Ceti's `Real.besselI`: `Real.besselJ`, `Real.besselY` and `Real.besselK : ℝ → ℝ → ℝ`, the real
  parts of the complex values; the Kelvin functions `Real.kelvinBer`, `Real.kelvinBei`,
  `Real.kelvinKer`, `Real.kelvinKei`; the zeros, the modulus and phase functions and Debye's
  polynomials named below. Derivatives are Mathlib's `deriv`; no derivative functions are
  introduced.
- **Deference to Mathlib.** `J_ν` is Mathlib's
  [`Complex.besselJ`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/Bessel.html)
  `ν z = (z/2)^ν 𝐅(ν + 1, −(z/2)²)`. `I_ν` has the shape of Tau Ceti's `Real.besselI`. When Mathlib
  provides one of the functions pinned here with the same values, Tau Ceti uses Mathlib's and
  restates the affected theorems against it.
- **The reduced series.** `𝐅(b, x)` is `Complex.regularizedHGFun 0 {b} x = ∑ₙ xⁿ/(n! Γ(b + n))`,
  Mathlib's regularized `₀F₁`, entire in `b` and `x`. `𝐌(a, b, x)` is
  `Complex.regularizedHGFun {a} {b} x`, Olver's regularized Kummer function; `M(a, b, x)` means
  `Γ(b) 𝐌(a, b, x)` and is used only where `b ∉ {0, −1, −2, …}`.
- **Definitions.** With principal powers:

```text
Y_ν(z) = (J_ν(z) cos νπ − J_{−ν}(z)) / sin νπ                        ν ∉ ℤ   (10.2.3)
Y_n(z) = π⁻¹ (∂_ν J_ν(z)|_{ν=n} + (−1)ⁿ ∂_ν J_ν(z)|_{ν=−n})          n ∈ ℤ   (10.2.4)
H⁽¹⁾_ν = J_ν + i Y_ν,   H⁽²⁾_ν = J_ν − i Y_ν                                  (10.4.3)
I_ν(z) = (z/2)^ν 𝐅(ν + 1, (z/2)²)                                             (10.25.2)
K_ν(z) = ½π (I_{−ν}(z) − I_ν(z)) / sin νπ                            ν ∉ ℤ   (10.27.4)
K_n(z) = ½ (−1)^{n−1} (∂_ν I_ν(z)|_{ν=n} + ∂_ν I_ν(z)|_{ν=−n})       n ∈ ℤ   (10.27.5)
```

  The integer case is selected by `∃ n : ℤ, (n : ℂ) = ν`, and `∂_ν` is `deriv` in the order at
  fixed `z`. DLMF takes limits at integer order; 1.2 proves that the two cases glue to an entire
  function of `ν`, so the derivative form is that limit.
- **Branches and the cut.** All powers, logarithms and square roots are principal. The functions
  of `z` are holomorphic on `Complex.slitPlane`; their values on `(−∞, 0]` are those of the
  principal branch (Lean's `arg x = π` for `x < 0`) and are used only where a formula of DLMF
  evaluates on that ray with `ph z = π`, as 10.27.8 does at `ph z = π/2`. Statements involving
  `z e^{mπi}` are written for those `z` for which `z e^{mπi}` has principal phase `ph z + mπ`;
  other sheets are excluded (see the last section).
- **Spherical functions.** By the entire series, for `n : ℕ`:

```text
𝗃_n(z)  = (√π/2) (z/2)ⁿ 𝐅(n + 3/2, −(z/2)²)
𝗒_n(z)  = (−1)^{n+1} (√π/2) (z/2)^{−n−1} 𝐅(½ − n, −(z/2)²)
𝗂⁽¹⁾_n(z) = (√π/2) (z/2)ⁿ 𝐅(n + 3/2, (z/2)²)
𝗂⁽²⁾_n(z) = (√π/2) (z/2)^{−n−1} 𝐅(½ − n, (z/2)²)
𝗁⁽¹⁾_n = 𝗃_n + i 𝗒_n,  𝗁⁽²⁾_n = 𝗃_n − i 𝗒_n,  𝗄_n = (−1)^{n+1} (π/2)(𝗂⁽¹⁾_n − 𝗂⁽²⁾_n)
```

  with integer powers, so that `𝗃_n`, `𝗂⁽¹⁾_n` are entire and the others are holomorphic on
  `z ≠ 0`. The definitions 10.47.3–10.47.9 through `J_{±(n+1/2)}`, `Y`, `H`, `I`, `K` with the
  factor `(π/(2z))^{1/2}` are theorems on the slit plane (9.1).
- **Kelvin functions** (DLMF 10.61.1–10.61.2). For real `ν` and `x > 0`,
  `ber_ν x + i bei_ν x = J_ν(x e^{3πi/4})` and
  `ker_ν x + i kei_ν x = e^{−νπi/2} K_ν(x e^{πi/4})`; `kelvinBer ν x` and `kelvinBei ν x` are
  the real and imaginary parts, and likewise for `ker`, `kei`. The arguments `x e^{3πi/4}` and
  `x e^{πi/4}` lie in the slit plane. Statements are made for `x > 0`, except 10.61.5, which is
  stated for integer `n` and all real `x`: `J_n` is entire, so
  `ber_n(−x) + i bei_n(−x) = J_n(−x e^{3πi/4}) = (−1)ⁿ (ber_n x + i bei_n x)`.
- **Bessel's equation is not a predicate.** A solution is stated with `DifferentiableOn ℂ w U`
  and the equation at each point of `U`. The Wronskian is written out as
  `f z * deriv g z − deriv f z * g z`.
- **Sectors at infinity.** "As `z → ∞` in `|ph z| ≤ θ`" is the filter
  `Bornology.cobounded ℂ ⊓ 𝓟 {z | |Complex.arg z| ≤ θ}` for `θ < π`, written out in each
  statement.
- **Asymptotic expansions** are AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion`, which
  unfolds to "for every `N`, the remainder after `N` terms is `O(φ N)`". The oscillatory
  expansions 10.17.3–10.17.4 and 10.17.9–10.17.10, with two sums and an envelope `e^{|Im z|}`, are
  generalized expansions with independent truncation orders for the two sums. Divergent series
  are never summed.
- **Improper integrals.** "`∫₀^∞ f = L` as an improper integral" means
  `Tendsto (fun R ↦ ∫ t in (0)..R, f t) atTop (𝓝 L)`. Where an integrand is absolutely integrable,
  the statement uses the Bochner integral with an `IntegrableOn` hypothesis or conclusion.
- **Coefficients.** `a_k(ν) = (½ − ν)_k (½ + ν)_k / ((−2)^k k!)` (DLMF 10.17.1) is
  `Complex.hankelCoeff k ν`; `b_k(ν)` of 10.17.8 is written out. Debye's polynomials `U_k`
  (10.41.9) are `Real.debyeU k : ℝ → ℝ`, defined by the recursion with `U₀ = 1`; 6.1 proves that
  they are polynomials of degree `3k` and gives `V_k`. Gegenbauer's polynomial `C_n^{(ν)}(x)`
  (DLMF 18.5.10) is `Complex.gegenbauerC ν n x`; see 2.5.
- **Zeros** are indexed from `1`. For `f : ℝ → ℝ`, `Real.positiveZero f m` is the `x > 0` with
  `f x = 0` such that exactly `m − 1` zeros of `f` lie in `(0, x)`:

```text
Real.positiveZero f m
  = Classical.epsilon fun x ↦ 0 < x ∧ f x = 0 ∧ {y | 0 < y ∧ y < x ∧ f y = 0}.ncard = m − 1
```

  `j_{ν,m}`, `y_{ν,m}`, `y′_{ν,m}` are `Real.besselJZero`, `Real.besselYZero`,
  `Real.besselYDerivZero`, the instances for `J_ν`, `Y_ν`, `Y′_ν`. `j′_{ν,m}` is
  `Real.besselJDerivZero`, the instance for `J′_ν` when `ν ≠ 0`, and with DLMF's convention
  `j′_{0,1} = 0` (10.21.1) when `ν = 0`. Layer 7 proves that each epsilon is attained and unique
  for every real `ν`.
- **Modulus and phase** (DLMF 10.18.1–10.18.8). For real `ν ≥ 0` and `x > 0`:

```text
M_ν(x) = (J_ν(x)² + Y_ν(x)²)^{1/2}        θ_ν(x) = −π/2 + ∫₀^x 2/(π t M_ν(t)²) dt
N_ν(x) = (J′_ν(x)² + Y′_ν(x)²)^{1/2}      φ_ν(x) = π/2 + ∫₀^x 2(t² − ν²)/(π t³ N_ν(t)²) dt
```

  These are `Real.besselModulus`, `Real.besselPhase`, `Real.besselDerivModulus` and
  `Real.besselDerivPhase`. The integrands are integrable at `0` (5.4), so the phases are the
  continuous branches with the limits 10.18.3; DLMF's `Arctan` forms 10.18.7 are theorems modulo
  `π`.
- **Kelvin modulus and phase** (DLMF 10.68.1–10.68.6). For real `ν ≥ 0` and `x > 0`,
  `M_ν = (ber_ν² + bei_ν²)^{1/2}` and `N_ν = (ker_ν² + kei_ν²)^{1/2}` are
  `Real.kelvinModulus` and `Real.kelvinKModulus`. The phases `Real.kelvinPhase` and
  `Real.kelvinKPhase` are the continuous branches with `θ_ν(0+) = 3νπ/4` and
  `φ_ν(0+) = −3νπ/4`, defined as these values plus `∫₀^x Im(w′/w)` for
  `w = ber_ν + i bei_ν` and `w = ker_ν + i kei_ν` respectively; the limits are those of the
  leading terms of 10.30.2 and 10.30.3 at `x e^{3πi/4}` and `x e^{πi/4}`. DLMF leaves the branch
  open; 10.68.7 is stated with these branches as `ber_{−n} + i bei_{−n} = M_n e^{i(θ_n − nπ)}`.

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

The following are consumed with the hypotheses and conventions stated there.
- The expansion notion `Asymptotics.HasAsymptoticExpansion` along a filter and an asymptotic
  scale ([its Conventions](../AsymptoticExpansions/README.md#conventions)) and the integration
  and differentiation of expansions
  ([§1.5](../AsymptoticExpansions/README.md#15-integration-and-differentiation)), for Layers 5, 6
  and 10.
- The inversion of `f(x) ∼ x`, successive resubstitution and Lagrange's reversion
  ([Layer 2](../AsymptoticExpansions/README.md#layer-2-transcendental-equations)), for McMahon's
  expansions 10.21.19–10.21.21, the cross-product zeros 10.21.48–10.21.54 and the Kelvin zeros
  10.70.
- Watson's lemma in a sector and the rotation of the path
  ([§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector),
  [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path)), applied in 5.1 to the
  Laplace forms of `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `K_ν` (10.9.21, 10.32.8).
- Laplace's method on a contour and saddle points
  ([§5.4](../AsymptoticExpansions/README.md#54-laplaces-method-on-a-contour),
  [§5.5](../AsymptoticExpansions/README.md#55-saddle-points)), applied in 6.2 to the
  Sommerfeld integrals 10.9.17–10.9.18 for Debye's expansions 10.19.3–10.19.7.
- The Mellin tools: Parseval and the line shift with simple poles
  ([§8.1](../AsymptoticExpansions/README.md#81-parseval),
  [§8.2](../AsymptoticExpansions/README.md#82-shifting-the-line)) and the Gamma function on
  vertical strips
  ([§8.6](../AsymptoticExpansions/README.md#86-the-gamma-function-on-vertical-strips)),
  for the Mellin–Barnes integrals 10.9.22–10.9.25, 10.9.29 and 10.32.13–10.32.19.
- Volterra integral equations
  ([§10.1](../AsymptoticExpansions/README.md#101-volterra-integral-equations)), for the error
  bounds 10.17.13–10.17.15 and 10.40.10–10.40.12 and for the Case I error bound behind
  10.41.12–10.41.13 (6.1).
- Regular singularities and the irregular singularity of rank one
  ([§10.3](../AsymptoticExpansions/README.md#103-regular-singularities),
  [§10.4](../AsymptoticExpansions/README.md#104-irregular-singularity-of-rank-one-at-infinity)):
  the Frobenius solutions of Bessel's equation at `0`, which identify every solution on the slit
  plane through its behaviour at `0` (1.1), and the recessive solutions at `∞`, which identify
  `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `K_ν` by 10.2.5–10.2.6 and 10.25.3 (5.1).
- The Liouville–Green approximation and Case I with a large parameter
  ([§11.1](../AsymptoticExpansions/README.md#111-the-liouvillegreen-theorem) to
  [§11.4](../AsymptoticExpansions/README.md#114-case-i-no-transition-points)),
  for Debye's expansions of `I_ν(νz)`, `K_ν(νz)` on `z > 0` (6.1).

### From [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md)

- `TauCetiRoadmap.AnalyticNumberTheoryPartI.besselK (ν : ℂ) (c : ℝ)`,
  `K_ν(c) = ½ ∫₀^∞ exp(−c(u + u⁻¹)/2) u^ν du/u` for `c > 0`, with its cosh form
  `∫₀^∞ e^{−c cosh t} cosh(νt) dt`, `K_{−ν} = K_ν`, holomorphy in `ν`, the modified equation in
  `c`, `|K_ν(c)| ≤ K_{Re ν}(c)`, `K_σ(c) > 0` for real `σ`, the decay
  `|K_ν(c)| ≤ C c^{−1/2} e^{−c}` for `c ≥ 1` and `ν` in a compact set, and `K_{1/2}`
  ([its §2.1a](../AnalyticNumberTheoryPartI/README.md#21a-the-k-bessel-kernel)), for 1.7, 3.1 and
  5.5. `positiveAxisBesselK` in `Suggested.lean` is a roadmap-local copy of this definition.
- From [its §3.23b](../AnalyticNumberTheoryPartI/README.md#323-second-moment-of-zeta):
  - `Y_ν(z)` on `Re z > 0`, defined by Schläfli's integral 10.9.7, with the connection formula
    10.2.3, holomorphy in `z`, entire dependence on `ν`, the equation 10.2.1, the recurrence
    10.6.1 and `Y_{±1/2}` there, for 3.1;
  - for real `ν` and `x > 0`, the coefficients `a_j(ν)` and the first-omitted-term bounds on the
    remainders of 10.40.2 for `K_ν(x)`, with `|ν| < m + ½` after `m` terms, and of 10.17.4 for
    `Y_ν(x)`, with `|ν| < min(2r + ½, 2s + 3/2)` after `r` even and `s` odd terms, for 5.3;
  - the first-kind API on `(0, ∞)`: the series, the equation, 10.6.1 and `J_{1/2}`, which are the
    positive-axis cases of 1.1, 1.4, 2.2 and 4.3.

### From [AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md)

- `I_ν(y) = (y/2)^ν 𝐅(ν + 1, y²/4)` for complex `ν` and real `y`, with its series, the modified
  equation, `I_{ν−1}(y) − I_{ν+1}(y) = (2ν/y) I_ν(y)` and `I_{−n}(y) = I_n(y)` for `y > 0`
  ([its §0.25](../AutomorphicSpectralTheory/README.md#025-bessel-functions-j_ν-and-i_ν)), the
  real-argument cases of 1.7–1.8.

### From [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md)

- `TauCeti.airyAi`, `TauCeti.airyBi`, `TauCeti.scorerHi` and the generalized Airy functions
  `A_n`, `B_n` of its Layer 9, with Airy's equation, the connection formulas of its 1.4, the
  `J_ν` and real `I_ν` forms of its 1.7, the modulus and phase of its 4.1 and the integral
  representations of its 9.3, for 11.1.
- Kummer's second transformation `exp_neg_mul_kummer_two_mul`
  (`e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)` for `2a ∉ {0, −1, −2, …}`,
  [its 1.7](../SpecialFunctionsAiry/README.md#17-relations-to-bessel-and-kummer-functions)), for
  10.16.5 and 10.39.5 in 4.3.
- The integral `J₀(z) = (2π)⁻¹ ∫₀^{2π} e^{iz cos φ} dφ` for every `z ∈ ℂ`
  ([its 8.3](../SpecialFunctionsAiry/README.md#83-integral-representations-of-products)), for
  10.9.1 in 3.1.

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- `TauCeti.parabolicCylinderU (a z : ℂ)` and `TauCeti.Real.parabolicCylinderW (a x : ℝ)`, with
  their equations and values at `0`
  ([its Conventions](../SpecialFunctionsParabolicCylinder/README.md#conventions)),
  for 10.16.3–10.16.4 and 10.39.3–10.39.4 in 4.3 and for 12.7.8–12.7.11 in 11.2.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- Pincherle's theorem and the continued-fraction conventions `contFrac`, `IsMinimalSolution`,
  `pincherle` ([§4.1](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#41-pincherles-theorem)),
  for 4.1.
- `TauCeti.sinIntegral`, `TauCeti.cosIntegral`, `TauCeti.cosIntegralCin`,
  `TauCeti.expIntegralEin`, `TauCeti.expIntegralE`, `TauCeti.Real.expIntegralEi`,
  `TauCeti.sinIntegralAuxF`, `TauCeti.sinIntegralAuxG`, `TauCeti.Complex.erf`,
  `TauCeti.fresnelC`, `TauCeti.fresnelS`, `TauCeti.Complex.lowerIncompleteGamma`,
  `TauCeti.Complex.upperIncompleteGamma`, `TauCeti.Complex.tricomiIncompleteGamma`,
  `TauCeti.generalizedSinIntegral` and `TauCeti.generalizedCosIntegral`
  ([its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions)), for
  10.15.6–10.15.9, 10.38.6–10.38.7 and 10.60.11 and for Layer 11.

### From Tau Ceti

- **Modified Bessel function.** `Real.besselI`, `Real.besselI_eq_rpow_mul`, `Real.hasSum_besselI`,
  `Real.hasDerivAt_besselI`, `Real.besselI_sub_besselI`, `Real.hasDerivAt_rpow_neg_mul_besselI`,
  `Real.tendsto_rpow_neg_mul_besselI_nhdsGT_zero`, `Real.besselI_zero`, `Real.besselI_pos` and
  `Real.integral_exp_mul_cos_mul_cos` (10.32.3 at real argument)
  (`TauCeti/Analysis/SpecialFunctions/BesselI.lean`, owned by StandardDistributions). 1.7 proves
  that `Complex.besselI` restricts to it on `(0, ∞)`.
- **Regularized hypergeometric series.**
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean),
  the `HasSum` form of `𝐅` and `𝐌`.
- **Wronskians.** `TauCeti.wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean`),
  for the real Wronskians of 5.4 and Layer 7.
- **Residues.** `TauCeti.Contour.residue` and the residue theorem
  (`TauCeti/Analysis/Contour/Residue/`, from ContourIntegration), for the partial-fraction
  expansion of 7.3.

### From Mathlib

- **Bessel function.** `Complex.besselJ`, `Complex.besselJ_def`, `Complex.analyticAt_besselJ`,
  `Complex.analyticOnNhd_besselJ`, `Complex.analyticAt_besselJ_int`,
  `Complex.analyticOnNhd_besselJ_int`, `Complex.besselJ_neg_int` (the `J` half of 10.4.1),
  `Complex.besselJ_neg_comm` (`J_{−n}(z) = J_n(−z)`), `Complex.besselJ_int_neg`,
  `Complex.odd_besselJ` and `Complex.even_besselJ` (10.11.1 at integer order, `m = ±1`),
  `Complex.besselJ_zero` and `Complex.two_mul_self_mul_besselJ` (the first identity of 10.6.1 for
  `J`) (`Mathlib/Analysis/SpecialFunctions/Bessel.lean`).
- **Regularized hypergeometric series.** `Complex.regularizedHGFun`,
  `Complex.regularizedHGFunCoeff` and `Complex.analyticOnNhd_regularizedHGFun_of_card_le`; the
  regularized Gauss series `Complex.regularizedGaussHGFun`,
  `𝐅(α, β; γ; x) = ∑ (α)_k (β)_k xᵏ/(k! Γ(γ + k))`, whose series has radius at least 1, for
  10.22.49.
- **Gamma.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_mul_Gamma_one_sub`,
  `Complex.Gamma_mul_Gamma_add_half`, `Complex.Gamma_eq_integral`, `Complex.betaIntegral`,
  `Complex.digamma` and `Real.eulerMascheroniConstant`.
- **Polynomials.** `Polynomial.shiftedLegendre`, with `P̃_n(y) = P_n(1 − 2y)` (for
  `P_n(x) = P̃_n((1 − x)/2)` in Layer 9), and
  `Polynomial.Chebyshev.T` (for 7.6.9 in 11.3).
- **Holomorphic functions and contour integrals.** `AnalyticOnNhd`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, the Cauchy integral formula and
  `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.
- **Integration and transforms.** `MeasureTheory.integral` on `Set.Ioi`, `intervalIntegral`,
  Fubini, parametric differentiation, `mellin` and `mellinInv`, and `HasProd`.
- **Continued fractions and bounded variation.** `GenContFract`, `GenContFract.convs` and
  `Stream'.Seq.ofStream` (for 10.10.1 in 4.1); `BoundedVariationOn`, `Function.leftLim` and
  `Function.rightLim` (for 10.23.20 in 7.6).
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, `Bornology.cobounded`,
  `Complex.arg` and `Complex.cpow`.

## How to read the build

Layer 1 rests on two facts: Bessel's equation has, on the slit plane, a two-dimensional solution
space determined by the behaviour at `0` (AsymptoticExpansions §10.3), and `J_ν(z)` is entire in
`ν`. Every identity between solutions in Layers 1–4 is then checked on series coefficients or by
comparing leading terms at `0`; the integer orders follow from the non-integer ones by continuity
in `ν`. Layer 3 proves each integral representation by showing that the integral solves the
equation with the right behaviour at `0` or `∞`. Layer 5 identifies `H⁽¹⁾_ν`, `H⁽²⁾_ν` and `K_ν`
as recessive solutions at `∞` and expands their Laplace forms by Watson's lemma; `J_ν`, `Y_ν`,
`I_ν` follow from the connection formulas. Layer 6 applies saddle points to the Sommerfeld
integrals and the Liouville–Green theory to the modified equation. Layer 7 locates the zeros
through the phase of 5.4 and Sturm comparison, and inverts the phase expansions. Layers 8–10
apply Layers 1–7. Layer 11 proves the relations owed to other roadmaps. The `### Examples` of
each layer are statements to prove, and they test the conventions on explicit values.

## Layer 1: definitions, the equations, connection formulas and Wronskians

### 1.1 Bessel's equation and its solutions

`J_ν`, `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν` as pinned. For every `ν`:
- `J_ν` and `Y_ν` solve 10.2.1 on the slit plane (`besselJ_ode`, `besselY_ode`), and so do
  `H⁽¹⁾_ν`, `H⁽²⁾_ν`;
- `Y_ν` is holomorphic on the slit plane (`analyticOnNhd_besselY`); for integer `n`, `J_n` is
  entire (Mathlib);
- two solutions of 10.2.1 on the slit plane with the same value and derivative at one point are
  equal, and every solution is `c₁ J_ν + c₂ Y_ν`.

The proof of the equation for `J_ν` is the coefficient recurrence of `𝐅`; uniqueness is the
ordinary-point theory on the simply connected slit plane.

**Checks.**
- `J_0(0) = 1` and `J_ν(0) = 0` for `ν ≠ 0` (Mathlib `Complex.besselJ_zero`).
- `Y_{1/2}(z) = −(2/(πz))^{1/2} cos z`, from 10.2.3 at `ν = ½` and 10.16.1; with the sign of the
  second term of 10.2.3 reversed it would be `+(2/(πz))^{1/2} cos z`.
- `J_0(1) = 0.76519 76865…` and `Y_0(1) = 0.08825 69642…`.

*Needs:* Mathlib `Complex.besselJ_def`; Tau Ceti `Complex.hasSum_regularizedHGFun`;
AsymptoticExpansions §§10.2–10.3.

### 1.2 Holomorphy in the order

For `z` in the slit plane, `ν ↦ J_ν(z)` is entire, and so is `ν ↦ Y_ν(z)`
(`differentiable_besselY_left`): the quotient 10.2.3 has removable singularities at the integers,
where its value is 10.2.4. The proof: the numerator `J_ν cos νπ − J_{−ν}` vanishes at `ν = n` by
10.4.1, so the quotient extends holomorphically, and l'Hôpital's rule gives 10.2.4. The same holds
for `H⁽¹⁾_ν`, `H⁽²⁾_ν`.

**Checks.**
- `Y_0(z) = (2/π) ∂_ν J_ν(z)|_{ν=0}`, the case `n = 0` of 10.2.4 (10.15.5).
- `Y_{10⁻⁶}(1) − Y_0(1) = −1.20197…×10⁻⁶`, so the integer value is the limit of the quotient.
- `Y_1(1) = −0.78121 28213…`; without the factor `(−1)ⁿ`, 10.2.4 at `n = 1` would give
  `π⁻¹ (∂_ν J_ν|_{ν=1} + ∂_ν J_ν|_{ν=−1})`, which is not the limit of 10.2.3.

*Needs:* 1.1; Mathlib `Complex.besselJ_neg_int` and the removable-singularity theorem
`Complex.differentiableOn_update_limUnder_of_bddAbove`.

### 1.3 Connection formulas and Wronskians

DLMF 10.4.1–10.4.8 and 10.5.1–10.5.5, on the slit plane. In particular
`𝒲{J_ν, Y_ν} = J_ν Y′_ν − J′_ν Y_ν = 2/(πz)` (10.5.2; `besselJ_mul_deriv_besselY_sub`),
`𝒲{J_ν, J_{−ν}} = −2 sin(νπ)/(πz)` (10.5.1), and `H⁽¹⁾_{−ν} = e^{νπi} H⁽¹⁾_ν`,
`H⁽²⁾_{−ν} = e^{−νπi} H⁽²⁾_ν` (10.4.6). The Wronskians are computed from the leading terms of the
series at `0`, since `z 𝒲` is constant by 10.2.1.

*Needs:* 1.1–1.2.

### 1.4 Recurrences and derivatives

DLMF 10.6.1–10.6.10 for `𝒞_ν` any of `J_ν`, `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, on the slit plane:
`𝒞_{ν−1} + 𝒞_{ν+1} = (2ν/z) 𝒞_ν` and `𝒞_{ν−1} − 𝒞_{ν+1} = 2 𝒞′_ν` (10.6.1;
`besselY_sub_one_add_besselY_add_one` for `Y`), 10.6.2–10.6.3, the generalized recurrences
10.6.4–10.6.5 for `f_ν(z) = z^p 𝒞_ν(λ z^q)` with `λ ≠ 0`, on every open set on which `z^q` and
`λ z^q` avoid `(−∞, 0]` (as in 1.6), the iterated derivatives 10.6.6–10.6.7, and the cross-product
recurrences 10.6.8–10.6.10.

*Needs:* 1.1–1.3; Mathlib `Complex.two_mul_self_mul_besselJ`.

### 1.5 Analytic continuation

DLMF 10.11.1–10.11.9, for integer `m` and `z` such that `z e^{mπi}` has principal phase `ph z + mπ`:
for example, for `0 < ph z < π`, `H⁽²⁾_ν(−z) = −e^{νπi} H⁽¹⁾_ν(z)` (10.11.5 with `z e^{−πi} = −z`;
`hankelH2_neg`). For real `ν`, `J_ν(z̄) = conj J_ν(z)` and likewise for `Y_ν`, and
`H⁽¹⁾_ν(z̄) = conj H⁽²⁾_ν(z)` (10.11.9), all for `z` in the slit plane.

*Needs:* 1.1–1.3.

### 1.6 Other differential equations

DLMF 10.13.1–10.13.11, for `𝒞_ν`, `𝒟_ν` any solutions of 10.2.1 built from the pinned `J_ν`,
`Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν` (fixed linear combinations with coefficients independent of `z`),
`λ ∈ ℂ`, and all powers principal. Each statement holds on every open set on which the argument
of `𝒞_ν` and every power of `z` that occurs avoid `(−∞, 0]`:

- 10.13.1: `w = z^{1/2} 𝒞_ν(λz)` solves `w″ + (λ² − (ν² − ¼)/z²) w = 0`.
- 10.13.2: `w = z^{1/2} 𝒞_ν(λ z^{1/2})` solves `w″ + (λ²/(4z) − (ν² − 1)/(4z²)) w = 0`.
- 10.13.3, for `p ≠ 0`: `w = z^{1/2} 𝒞_{1/p}(2λ z^{p/2}/p)` solves `w″ + λ² z^{p−2} w = 0`.
- 10.13.4: `w = z^{±ν} 𝒞_ν(λz)` solves `w″ + ((1 ∓ 2ν)/z) w′ + λ² w = 0`, signs taken together.
- 10.13.5: `w = z^r 𝒞_ν(λ z^q)` solves `z² w″ + (1 − 2r) z w′ + (λ² q² z^{2q} + r² − ν² q²) w = 0`.
- 10.13.6: `w = 𝒞_ν(λ e^z)` solves `w″ + (λ² e^{2z} − ν²) w = 0`.
- 10.13.7: `w = 𝒞′_ν(z)` solves
  `z²(z² − ν²) w″ + z(z² − 3ν²) w′ + ((z² − ν²)² − (z² + ν²)) w = 0`.
- 10.13.8, for integer `n ≥ 1` and `k = 0, …, 2n − 1`: `w = z^{n/2} 𝒞_n(2λ e^{kπi/n} z^{1/2})`
  solves `w⁽²ⁿ⁾ = (−1)ⁿ λ^{2n} z^{−n} w`.
- 10.13.9: `w = 𝒞_ν 𝒟_ν` solves `z² w‴ + 3z w″ + (4z² + 1 − 4ν²) w′ + 4z w = 0`.
- 10.13.10: `w = z 𝒞_ν 𝒟_ν` solves `z³ w‴ + z(4z² + 1 − 4ν²) w′ + (4ν² − 1) w = 0`.
- 10.13.11, for `𝒟_μ` a solution of 10.2.1 of order `μ` and `ϑ = z d/dz`: `w = 𝒞_ν 𝒟_μ` solves
  `(ϑ⁴ − 2(ν² + μ²) ϑ² + (ν² − μ²)²) w + 4z² (ϑ + 1)(ϑ + 2) w = 0`.

Each is the chain rule applied to 10.2.1; 10.13.7 also uses 10.6.2, and 10.13.9–10.13.11
differentiate the product and eliminate second derivatives by 10.2.1.

**Checks.**
- 10.13.3 at `p = 2` with `𝒞 = J`: `z^{1/2} J_{1/2}(λz) = (2/(πλ))^{1/2} sin(λz)` (by 10.16.1),
  and `w″ + λ² w = 0`.
- 10.13.7 at `ν = 0`: `𝒞′_0 = −𝒞_1` and the equation reduces to 10.2.1 at order 1.
- 10.13.9 with `𝒞 = 𝒟 = J_{1/2}`: `w = 2 sin² z/(πz)` solves it at `ν = ½`.

*Needs:* 1.1, 1.4; 4.3 for the first Check.

### 1.7 Modified Bessel functions

`I_ν`, `K_ν` as pinned. DLMF 10.25.1–10.25.2 and 10.27.1–10.27.7: `I_ν` and `K_ν` solve 10.25.1
on the slit plane and are holomorphic there; `ν ↦ I_ν(z)` and `ν ↦ K_ν(z)` are entire; and
`I_ν(x) = Real.besselI ν x` for real `ν` and `x > 0` (`besselI_ofReal`). DLMF 10.25.3 is the
recessive characterization of `K_ν` and is proved in 5.1.

**Checks.**
- `K_{1/2}(z) = (π/(2z))^{1/2} e^{−z}` (10.39.2). The factor `½π` of 10.27.4 and `sin νπ` in
  the denominator are both needed for it.
- `K_0(1) = 0.42102 44382…` and `I_0(1) = 1.26606 58777…`.
- `I_ν(x) > 0` for `ν > −1`, `x > 0` (Tau Ceti `Real.besselI_pos`), while `K_ν(x) > 0` for all
  real `ν` and `x > 0` (AnalyticNumberTheoryPartI §2.1a, through 3.1).

*Needs:* 1.1–1.2; Tau Ceti `Real.besselI_def`.

### 1.8 Connection formulas, Wronskians and recurrences for `I`, `K`

DLMF 10.27.8–10.27.11, 10.28.1–10.28.2 and 10.29.1–10.29.5; for 10.29.4 the real case `k = 1`
of the second identity is Tau Ceti's `Real.hasDerivAt_rpow_neg_mul_besselI`, and induction on
`k` with 1.7 gives the rest. In particular, for `z ≠ 0` with
`ph z ≤ π/2`, `K_ν(z) = ½πi e^{νπi/2} H⁽¹⁾_ν(iz)` (10.27.8; `besselK_eq_hankelH1`), and
`I_ν K_{ν+1} + I_{ν+1} K_ν = 1/z` (10.28.2; `besselI_mul_besselK_add`).

*Needs:* 1.3–1.4, 1.7.

### 1.9 Continuation and equations for `I`, `K`

DLMF 10.34.1–10.34.7 with the convention of 1.5, and 10.36.1–10.36.2.

*Needs:* 1.5–1.8.

### Examples

- From 1.3 and 1.4 at `ν = ½`: `J_{1/2} Y′_{1/2} − J′_{1/2} Y_{1/2} = 2/(πz)` with the closed forms
  of 10.16.1.
- 10.27.8 at `z = x > 0`: `K_ν(x) = ½πi e^{νπi/2} H⁽¹⁾_ν(ix)`, real by 10.34.7.
- 10.11.6 at `m = 1`, `n = 0`: `Y_0(−x) = Y_0(x) + 2i J_0(x)` for `x > 0`, with `−x` on the cut.

### Dependencies

Mathlib's Bessel, regularized hypergeometric and Gamma API; Tau Ceti's `Real.besselI` and
`Complex.hasSum_regularizedHGFun`; AsymptoticExpansions §§10.2–10.3; AnalyticNumberTheoryPartI
§2.1a; AutomorphicSpectralTheory §0.25.

## Layer 2: series and sums

### 2.1 Limiting forms

DLMF 10.7.1–10.7.8 and 10.30.1–10.30.5, as `Asymptotics.IsEquivalent` or `Tendsto` statements
along `𝓝[slitPlane] 0` and, for 10.7.8 and 10.30.4–10.30.5, along the sector filters. For
example, for `Re ν > 0`, `Y_ν(z)/(z/2)^{−ν} → −Γ(ν)/π` as `z → 0` (10.7.4;
`tendsto_besselY_div_cpow`).

*Needs:* 1.2, 1.7; for 10.7.8 and 10.30.4–10.30.5, 5.1.

### 2.2 Power series

DLMF 10.8.1–10.8.3 and 10.31.1–10.31.3 as `HasSum` statements on the slit plane, with Mathlib's
`Complex.digamma` for `ψ` and `Real.eulerMascheroniConstant` for `γ`. The product formula 10.8.3
is the Cauchy product of the two series.

**Checks.**
- 10.8.2 at `z = 1` gives `Y_0(1) = 0.08825 69642…`.
- 10.8.1 at `n = 0` reduces to 10.8.2, with `ψ(1) = −γ`.
- 10.31.2 at `z = 1` gives `K_0(1) = 0.42102 44382…`.

*Needs:* 1.2, 1.7; Mathlib `Complex.digamma`.

### 2.3 Generating functions and Jacobi–Anger expansions

DLMF 10.12.1–10.12.6 and 10.35.1–10.35.6. For `t ≠ 0`,
`∑_{m∈ℤ} tᵐ J_m(z) = e^{z(t − t⁻¹)/2}` (10.12.1; `hasSum_besselJ_generating`), and the
Jacobi–Anger expansions follow at `t = e^{iθ}`.

*Needs:* 1.1; Mathlib `Complex.besselJ_neg_int`.

### 2.4 Multiplication and addition theorems

DLMF 10.23.1–10.23.7 and 10.44.1–10.44.3: the multiplication theorem 10.23.1 for `|λ² − 1| < 1`,
Neumann's addition theorem 10.23.2 for `|v| < |u|`, the sums 10.23.3–10.23.5 (10.23.3:
`hasSum_besselJ_sq`), and Graf's addition theorem 10.23.7 with the geometry of 10.23.6.

*Needs:* 2.3; 1.5.

### 2.5 Gegenbauer's addition theorem

Gegenbauer's polynomial is the auxiliary `Complex.gegenbauerC ν n x`,
`C_n^{(ν)}(x) = ∑_{ℓ=0}^{⌊n/2⌋} (−1)^ℓ (ν)_{n−ℓ}/(ℓ! (n − 2ℓ)!) (2x)^{n−2ℓ}` (DLMF 18.5.10), for
complex `ν` and `x`, with `(ν)_m` Mathlib's `ascPochhammer` evaluated at `ν`. This roadmap owns
the facts about it that 10.23.8–10.23.9 need: the generating function
`∑ₙ C_n^{(ν)}(x) tⁿ = (1 − 2xt + t²)^{−ν}` for `|t|` small (18.12.4), the expansion
`(2x)ⁿ = ∑_{ℓ=0}^{⌊n/2⌋} (ν + n − 2ℓ) n!/(ℓ! (ν)_{n−ℓ+1}) C_{n−2ℓ}^{(ν)}(x)` for
`ν ∉ {0, −1, −2, …}` (18.18.17), and `C_n^{(1/2)}(x) = P_n(x)`.

DLMF 10.23.8–10.23.9, for `ν ∉ {0, −1, −2, …}`:
- 10.23.8 for `𝒞 = J`, for all complex `u`, `v`, `α`, without DLMF's restriction (which DLMF
  notes is unnecessary for `J`): with `w² = u² + v² − 2uv cos α` and
  `J_ν(z)/z^ν = 2^{−ν} 𝐅(ν + 1)(−z²/4)` read as an entire function of `z²`,
  `J_ν(w)/w^ν = 2^ν Γ(ν) ∑ₖ (ν + k) (J_{ν+k}(u)/u^ν)(J_{ν+k}(v)/v^ν) C_k^{(ν)}(cos α)`
  (`hasSum_besselJ_gegenbauer`).
- 10.23.8 for `𝒞 = Y`, `H⁽¹⁾`, `H⁽²⁾`, for `Re u > 0` and `|v e^{±iα}| < |u|`, with
  `w = u ((1 − (v/u) e^{iα})(1 − (v/u) e^{−iα}))^{1/2}` (principal root). Both factors have
  positive real part, so this is the branch of 10.23.6 with `w → u` as `v → 0`, and `w` lies in
  the slit plane; `w^ν` and `u^ν` are principal and `J_{ν+k}(v)/v^ν` is read as in the `J` case
  (`hasSum_hankelH1_gegenbauer` for `H⁽¹⁾`).
- 10.23.9: `e^{iv cos α} = Γ(ν) (v/2)^{−ν} ∑ₖ (ν + k) iᵏ J_{ν+k}(v) C_k^{(ν)}(cos α)` for all
  complex `v`, `α`, with `(v/2)^{−ν} J_{ν+k}(v)` read as `(v/2)^k 𝐅(ν + k + 1)(−v²/4)`
  (`hasSum_cexp_gegenbauer`).

Route for `J`: write `J_ν(w)/w^ν = 2^{−ν} 𝐅(ν + 1)(x + y + z)` with `x = −u²/4`, `y = −v²/4`,
`z = uv cos α/2`; Taylor-expand the entire `𝐅(ν + 1)` about `x + y`, use the product formula
`𝐅(c)(x) 𝐅(c)(y) = ∑_ℓ (xy)^ℓ/(ℓ! Γ(c + ℓ)) 𝐅(c + 2ℓ)(x + y)`, expand each `(2 cos α)ⁿ` by 18.18.17,
and regroup the absolutely convergent double series by the Gegenbauer degree. For `Y`, `H⁽¹⁾`,
`H⁽²⁾`: for small `v`, apply the multiplication theorem 10.23.1 at `λ = w/u`, which expands
`𝒞_ν(w)/w^ν` in powers of `(v² − 2uv cos α)/2` with coefficients `𝒞_{ν+m}(u)/u^{ν+m}`; expand
each power binomially and each `(2 cos α)ⁿ` by 18.18.17, and regroup. Then extend to
`|v e^{±iα}| < |u|` by holomorphy in `v`. The series converges locally uniformly there by the
bounds `|J_{ν+k}(v)| ≤ C (|v|/2)^k/|Γ(ν + k + 1)|` and
`|𝒞_{ν+k}(u)| ≤ C |Γ(ν + k)| (2/|u|)^k` for large `k` from the power series of 2.2, and since
the generating function 18.12.4 at `x = cos α` has radius of convergence `min |e^{±iα}|`.
10.23.9 follows by the same regrouping applied to `e^{iv cos α} = ∑ₙ (iv cos α)ⁿ/n!`.

**Checks.**
- 10.23.8 at `v = 0`: only `k = 0` survives and both sides are `𝒞_ν(u)/u^ν`.
- 10.23.8 for `J` at `ν = 1`, `u = 2`, `v = 1`, `α = π/3`, where `w = √3`, `C_k^{(1)} = U_k` and
  `U_k(½) = sin((k + 1)π/3)/sin(π/3)`: both sides equal `0.33452 62387…`.
- 10.23.9 at `ν = ½` is the plane-wave expansion 10.60.7, since `C_k^{(1/2)} = P_k` and
  `(π/(2v))^{1/2} J_{k+1/2}(v) = 𝗃_k(v)`.
- `C_2^{(ν)}(x) = 2ν(ν + 1)x² − ν` and `C_4^{(1/2)}(0.3) = P_4(0.3) = 0.0729375`.

*Needs:* 2.2, 2.4; 1.2–1.3.

### 2.6 Neumann expansions

DLMF 10.23.10–10.23.17 and 10.44.4–10.44.6. Neumann's polynomials `O_n(t)` are defined by
10.23.13 with `O₀(t) = 1/t` (auxiliary). The expansion 10.23.10 holds for `f` holomorphic on a
disc `|z| < c`, with coefficients 10.23.11, and 10.23.12 is its case `f(z) = 1/(t − z)`.

**Checks.**
- `O₁(t) = t⁻²` and `O₂(t) = t⁻¹ + 4t⁻³` from 10.23.13; a factor `n/2` in place of `n/4` doubles
  both.
- 10.23.12 at `z = 0.6 + 0.2i`, `t = 1.7`: both sides equal `0.88 + 0.16i`.
- 10.23.12 at `z = 0` reduces to `1/t = J₀(0) O₀(t)`.

*Needs:* 2.2–2.3; Mathlib's Cauchy integral formula.

### Examples

- 10.12.4 is 10.12.2 at `θ = 0` (or 10.12.3 at `θ = π/2`), `z` arbitrary:
  `1 = J_0 + 2 ∑ J_{2k}`.
- 10.23.3 at `z = 0`: `J_0(0)² = 1`.
- 10.23.15 at `ν = ½`: `(z/2)^{1/2} = ∑ (2k + ½) Γ(k + ½)/k! J_{2k+1/2}(z)`.

### Dependencies

Layer 1; Mathlib's digamma and Euler–Mascheroni constant.

## Layer 3: integral representations

### 3.1 Integrals over finite intervals and half-lines

DLMF 10.9.1–10.9.16 and 10.32.1–10.32.11, with the conditions stated there. In particular Bessel's
integral `J_n(z) = π⁻¹ ∫₀^π cos(z sin θ − nθ) dθ` for every integer `n` (10.9.2;
`besselJ_int_eq_integral`), Poisson's integral 10.9.4, Schläfli's integrals 10.9.6–10.9.7 (10.9.7
for `Re z > 0`; `besselY_eq_schlafli`), the Mehler–Sonine integrals 10.9.8–10.9.12 as improper
integrals, and `K_ν(z) = ∫₀^∞ e^{−z cosh t} cosh(νt) dt` for `|ph z| < π/2` (10.32.9;
`besselK_eq_integral`). The case `n = 0`, 10.9.1, is consumed from SpecialFunctionsAiry 8.3, which
owns `J₀(z) = (2π)⁻¹ ∫₀^{2π} e^{iz cos φ} dφ` for every `z ∈ ℂ`; the substitution `φ = θ + π/2` and
`sin(θ + π) = −sin θ` turn it into `J₀(z) = π⁻¹ ∫₀^π cos(z sin θ) dθ`.

At `z = x > 0` the right side of 10.32.9 is the cosh form of AnalyticNumberTheoryPartI's
`besselK` (its §2.1a), so 10.32.9 gives the agreement `K_ν(x) = positiveAxisBesselK ν x`
(`besselK_ofReal_eq_positiveAxisBesselK`). The right side of 10.9.7 is that roadmap's definition
of `Y_ν` on `Re z > 0` (its §3.23b), so `besselY_eq_schlafli` is the agreement for `Y_ν`; it
follows from that roadmap's connection formula 10.2.3 there and 1.2.

*Needs:* Layer 1; Mathlib parametric differentiation; SpecialFunctionsAiry 8.3;
AnalyticNumberTheoryPartI §§2.1a, 3.23b.

### 3.2 Contour integrals

DLMF 10.9.17–10.9.21 (Sommerfeld's and Schläfli's integrals) and the contour integral
10.32.12. The contours are written as concatenations of segments and rays, parametrized explicitly;
DLMF's loop `∫_{−∞}^{(0+)}` is the path from `−∞` below the cut, round the circle `|t| = 1`
and back above. Each statement fixes its path.

*Needs:* 3.1; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

### 3.3 Mellin–Barnes integrals and products

DLMF 10.9.22–10.9.30 and 10.32.13–10.32.19, including Nicholson's formula
`J_ν(z)² + Y_ν(z)² = (8/π²) ∫₀^∞ cosh(2νt) K₀(2z sinh t) dt` for `Re z > 0` (10.9.30;
`besselJ_sq_add_besselY_sq`).

*Needs:* 3.1–3.2, 1.7; AsymptoticExpansions §§8.1–8.2, 8.6.

### Examples

- 10.9.1 is 10.9.2 at `n = 0`.
- 10.32.9 at `ν = ½` gives `K_{1/2}(x) = (π/(2x))^{1/2} e^{−x}`.
- 10.9.30 at `ν = ½`, `z = x > 0` gives `2/(πx) = (8/π²) ∫₀^∞ cosh t K₀(2x sinh t) dt`.

### Dependencies

Layers 1–2; AsymptoticExpansions Layer 8; SpecialFunctionsAiry; AnalyticNumberTheoryPartI.

## Layer 4: continued fractions, derivatives in the order and relations

### 4.1 Continued fractions

DLMF 10.10.1 and 10.33.1, for `z ≠ 0` and `ν` with `J_{ν−1}(z) ≠ 0` (respectively `I_{ν−1}(z) ≠ 0`).
The normalized fractions 10.10.2 and 10.33.2 need in addition `ν ∉ {0, −1, −2, …}`, as DLMF states,
since their partial numerators divide by `ν(ν + 1)⋯`. At `ν = 0`, `z = 1` the hypotheses of 10.10.1
hold but 10.10.2 starts with `1/0`. The sequence `n ↦ J_{ν+n}(z)` is the minimal solution of the
recurrence 10.6.1 in `n`, by 2.2 and the ratio `J_{ν+n+1}/J_{ν+n} → 0`; Pincherle's theorem gives
the fractions. 10.10.1 is stated with Mathlib's `GenContFract` as the limit of the convergents
(`tendsto_convs_besselJ`).

*Needs:* 1.4, 2.2; SpecialFunctionsEiLiErfIncompleteGamma §4.1.

### 4.2 Derivatives with respect to the order

DLMF 10.15.1–10.15.9 and 10.38.1–10.38.7. 10.15.6–10.15.9 and 10.38.6–10.38.7 are stated for
`x > 0` through SpecialFunctionsEiLiErfIncompleteGamma's `Si`, `Ci`, `E₁` and `Ei`.

*Needs:* 1.2, 2.2; SpecialFunctionsEiLiErfIncompleteGamma.

### 4.3 Relations to other functions

DLMF 10.16.1–10.16.5, 10.16.9, 10.39.1–10.39.5 and 10.39.9:
- the half-odd orders 10.16.1–10.16.2 and 10.39.1–10.39.2, for example
  `J_{1/2}(z) = (2/(πz))^{1/2} sin z`;
- the parabolic cylinder forms 10.16.3–10.16.4 for `z = x > 0`, through `W(0, ±2x^{1/2})` and its
  derivative, and 10.39.3–10.39.4 through `U(a, 2z^{1/2})` on `|ph z| < π/2`;
- the Kummer forms 10.16.5 and 10.39.5 with `M = Γ(b) 𝐌` and `2ν ∉ {−1, −2, …}`
  (`besselJ_eq_kummer`), from Kummer's second transformation (SpecialFunctionsAiry 1.7,
  `exp_neg_mul_kummer_two_mul`) at `a = ν + ½` and `x = ±iz` (for `J_ν`) or `x = ±z` (for
  `I_ν`), multiplied by `(z/2)^ν Γ(2ν + 1)/Γ(ν + 1)` (Mathlib `Complex.besselJ_def`);
- the `₀F₁` forms 10.16.9 and 10.39.9, which are the definitions.

*Needs:* 1.1, 1.7; SpecialFunctionsParabolicCylinder; SpecialFunctionsAiry 1.7.

### Examples

- 10.15.5 is the case `n = 0` of 10.15.3–10.15.4.
- 10.16.5 at `ν = ½` gives `J_{1/2}(z) = (z/2)^{1/2} e^{−iz} (Γ(2)/Γ(3/2)) 𝐌(1, 2, 2iz)`,
  equal to 10.16.1 since `𝐌(1, 2, w) = (e^w − 1)/w`.
- 10.10.1 at `ν = ½` reads `tan z = 1/(z⁻¹ − 1/(3z⁻¹ − ⋯))`, Lambert's fraction.

### Dependencies

Layers 1–3; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsParabolicCylinder;
SpecialFunctionsAiry.

## Layer 5: large argument

### 5.1 The Hankel functions and `K_ν`

DLMF 10.2.5–10.2.6, 10.17.5–10.17.6, 10.17.11–10.17.12, 10.25.3 and 10.40.2, 10.40.4, on the
principal sheet. For every `ν`, `δ > 0` and `N`, as `z → ∞` in `|ph z| ≤ π − δ`, with
`ω = z − νπ/2 − π/4`:

```text
H⁽¹⁾_ν(z) − (2/(πz))^{1/2} e^{iω} ∑_{k<N} iᵏ a_k(ν) z^{−k} = O(|e^{iω}| |z|^{−N−1/2})
K_ν(z)    − (π/(2z))^{1/2} e^{−z} ∑_{k<N} a_k(ν) z^{−k}    = O(|e^{−z}| |z|^{−N−1/2})
```

(`isBigO_hankelH1_sub_sum`, `isBigO_besselK_sub_sum`), and likewise for `H⁽²⁾_ν` and the
derivatives with `b_k(ν)`. The route: `K_ν` has the Laplace form of 10.32.8, and Watson's lemma
along rotated rays gives the expansion; 10.27.8 transfers it to `H⁽¹⁾_ν`, `H⁽²⁾_ν`. The recessive
solutions of AsymptoticExpansions §10.4 identify them: `H⁽¹⁾_ν` is the unique solution of 10.2.1
with the leading term of 10.2.5 as `z → ∞` along `ph z = π/2` (10.2.5–10.2.6), and `K_ν` the
unique one recessive along `(0, ∞)` with 10.25.3.

**Checks.**
- At `ν = ½` the series terminate after one term (`a_k(½) = 0` for `k ≥ 1`), and the expansions
  are exact: `H⁽¹⁾_{1/2}(z) = −i (2/(πz))^{1/2} e^{iz}` (10.16.2).
- `a_1(ν) = (4ν² − 1)/8` and `a_2(ν) = (4ν² − 1)(4ν² − 9)/128`.
- `K_0(10) = 1.77800 62316…×10⁻⁵`, and three terms of 10.40.2 give `1.77812…×10⁻⁵`.

*Needs:* 1.8, 3.1; AsymptoticExpansions §§4.2–4.3, 10.4.

### 5.2 `J`, `Y`, `I` for large argument

DLMF 10.17.3–10.17.4, 10.17.9–10.17.10, 10.40.1, 10.40.3 and 10.40.5 on the principal sheet, and
10.40.6–10.40.9, from 5.1 and the connection formulas 10.4.4 and 10.27.6. 10.17.3–10.17.4 hold in
`|ph z| ≤ π − δ` as generalized expansions with the envelope `e^{|Im z|} |z|^{−1/2}`.

*Needs:* 5.1, 1.3, 1.8.

### 5.3 Error bounds

Two kinds of bound, as in DLMF.

*Real argument* (DLMF §§10.17(iii), 10.40(ii)), for `x > 0`:
- for `ν ≥ 0`, the remainder of `∑_{k<ℓ} (−1)^k a_{2k}(ν) x^{−2k}` in 10.17.3–10.17.4 does not
  exceed the first neglected term in absolute value and has its sign, for
  `ℓ ≥ max(ν/2 − ¼, 1)`; likewise for `∑_{k<ℓ} (−1)^k a_{2k+1}(ν) x^{−2k−1}`, for
  `ℓ ≥ max(ν/2 − ¾, 1)`;
- for `ν > −½`, the remainder of 10.17.5–10.17.6 after `ℓ` terms is at most the first neglected
  term in absolute value, for `ℓ ≥ max(ν − ½, 1)`;
- for real `ν`, the remainder of 10.40.2 after `ℓ` terms does not exceed the first neglected
  term in absolute value and has its sign, for `ℓ ≥ max(|ν| − ½, 1)`.

The bounds on the size of the remainders of 10.40.2 for `|ν| < ℓ + ½` and of the `Y_ν` form of
10.17.4 for `|ν| < min(2r + ½, 2s + 3/2)` are AnalyticNumberTheoryPartI §3.23b's and are
consumed; this roadmap owns the signs, the `J_ν` and Hankel bounds, and the remaining orders.

Route: 10.32.8 with `t = 1 + u/x` gives
`K_ν(x) = (π/(2x))^{1/2} e^{−x} Γ(ν + ½)^{−1} ∫₀^∞ e^{−u} u^{ν−½} (1 + u/(2x))^{ν−½} du` for
`ν > −½`, and `K_ν = K_{−ν}` covers `ν ≤ −½`. Taylor's theorem with the integral remainder for
`(1 + τ)^{ν−½}`, with `τ > 0` for `K` and `τ ∈ iℝ` for the Hankel functions, gives the sign and
size of the remainder once `ℓ ≥ ν − ½`. The Hankel case comes from rotating the ray of
integration by 10.27.8 (Watson 1944, §7.3), and the `J`, `Y` statements are its real and
imaginary parts.

*Complex argument and order* (DLMF §§10.17(iv), 10.40(iii)), for complex `ν` and every
`ℓ ≥ 1`: the remainders `R^±_ℓ(ν, z)` of 10.17.13 and `R_ℓ(ν, z)` of 10.40.10 satisfy 10.17.14
and 10.40.11. The variation `𝒱` (DLMF 2.3.6) is taken along an explicit path `P(z)` that
avoids `0`, along which `Im t` (respectively `Re t`) is nondecreasing. DLMF's condition is that
`|Im t|` changes monotonically, which no path from the lower half-plane to `+i∞` meets; the
estimate holds along the paths below. For `R⁺`, with `y = |Im z|`:
- for `0 ≤ ph z ≤ π`, `P(z)` is the ray `z + is`, `s ≥ 0`;
- for `−π/2 ≤ ph z < 0`, it is the arc of `|t| = |z|` from `z` to `i|z|` through the right
  half-plane, then the ray up the imaginary axis;
- for `−π < ph z < −π/2`, it is the horizontal segment from `z` to `−iy`, then the arc of
  `|t| = y` from `−iy` to `iy` through the right half-plane, then the ray.

`R⁻` uses the conjugate paths, towards `−i∞`. For `K` the paths go to `+∞` and are rotated by
`−π/2`:
- for `|ph z| ≤ π/2`, the ray `z + s`;
- for `π/2 < |ph z| < π`, the arc of `|t| = |z|` from `z` to `|z|`, then the ray.

The bounds 10.17.15 and 10.40.12 are stated for these paths, in the sectors that lie in
`|ph z| < π`. `χ(ℓ)` comes from the arcs, as in DLMF §9.7(i). Route: the Volterra equation for
the remainder (Olver 1997, Chapter 7, §13), with the error-control function integrated along
`P(z)`.

**Checks.**
- At `ν = ½` every remainder vanishes, and `a_ℓ(½) = 0` makes the bound `0`.
- For `R⁺` the bound 10.17.15 is `|z|^{−ℓ}` on `0 ≤ ph z < π` and `χ(ℓ)|z|^{−ℓ}` on
  `−π/2 ≤ ph z ≤ 0`, with `χ(ℓ) = π^{1/2} Γ(ℓ/2 + 1)/Γ(ℓ/2 + ½)`.
- For `ν = 0`, `ℓ = 1`, `z = 10i`: `|R⁺_1| ≤ 2 |a_1(0)| 10^{−1} exp(¼ · 10^{−1})`.
- At `z = −i` the straight vertical path to `+i∞` passes through `0`, where the variation of
  `t^{−ℓ}` is infinite. `P(−i)` is the right half of the unit circle followed by the ray, and
  10.17.15 gives `χ(ℓ)`.
- `K_0(10)`: the remainder after `ℓ = 1` term is negative, and at most `|a_1(0)|/10 = 1/80` in
  absolute value, with `a_1(0) = −1/8`.

*Needs:* 5.1; AsymptoticExpansions §10.1; AnalyticNumberTheoryPartI §3.23b.

### 5.4 Modulus and phase

DLMF 10.18.1–10.18.21 for `ν ≥ 0` and `x > 0`, with `M_ν`, `θ_ν`, `N_ν`, `φ_ν` as pinned: the
integrands of the phases are integrable at `0`; `J_ν = M_ν cos θ_ν`, `Y_ν = M_ν sin θ_ν` and
`M_ν² θ′_ν = 2/(πx)` (`besselModulus_besselPhase`), with the analogues for `N_ν`, `φ_ν`
(`besselDerivModulus_besselDerivPhase`); 10.18.1–10.18.2, 10.18.7 modulo `π`, 10.18.9–10.18.16;
and the expansions 10.18.17–10.18.21 as `x → ∞`, through the integration of expansions and 5.2.

**Checks.**
- At `ν = ½`, `M_{1/2}(x)² = 2/(πx)` and `θ_{1/2}(x) = x − π/2`: the limits `−π/2` at `0+` and
  the derivative `1 = 2/(πx M²)` agree.
- 10.18.3: `θ_ν(0+) = −π/2` and `φ_ν(0+) = π/2`; the choice `+π/2` for `θ_ν` would give
  `J_ν = −M_ν cos` near `0`, contradicting `J_ν(x) > 0` for small `x > 0`.
- The leading term of 10.18.18 at `ν = 0` is `x − π/4`, the phase of 10.17.3.

*Needs:* 5.2, 1.3; Tau Ceti `TauCeti.wronskian_eq_of_hasDerivAt`; AsymptoticExpansions §1.5.

### 5.5 Inequalities and monotonicity

DLMF 10.14.1–10.14.8 and §10.37. In particular `|J_ν(x)| ≤ 1` for `ν ≥ 0` and real `x`, where
`|·|` is the complex modulus of the principal value, which is not real for `x < 0` and
`ν ∉ ℤ` (10.14.1; `norm_besselJ_le_one`), the bound 10.14.4 for `ν ≥ −½`, and the Kapteyn
bound 10.14.8 for `n ∈ ℕ` and every complex `z`, with the principal branch of `(1 − z²)^{1/2}` on
`ℂ \ ((−∞, −1] ∪ [1, ∞))` and its boundary values as stated there. From §10.37: for fixed
`ν ≥ 0`, `I_ν` is positive and increasing and `K_ν` is positive and decreasing on `(0, ∞)`; for
fixed `x > 0`, `ν ↦ I_ν(x)` is decreasing and `ν ↦ K_ν(x)` is increasing on `(0, ∞)`; and
`|K_ν(z)| < |K_μ(z)|` for `0 ≤ ν < μ` and `|ph z| ≤ π/2` (10.37.1). That `K_ν(x) > 0` for all
real `ν` and `x > 0` is AnalyticNumberTheoryPartI §2.1a's, through the agreement of 3.1.

**Checks.**
- At `x = 1.3`: `I_{1/2}, I_1, I_2 = 1.18851…, 0.79733…, 0.24262…` (decreasing in `ν`), and
  `K_{1/2}, K_1, K_2 = 0.29957…, 0.37255…, 0.85140…` (increasing in `ν`).
- 10.14.1 at `ν = ½`, `x = −π/2`: `J_{1/2}(−π/2) = (2/π) i`, of modulus `2/π ≤ 1`, while its real
  part is `0`.

*Needs:* 2.2, 3.1, 5.4; 1.7 and 3.1 (10.32.9) for §10.37.

### Examples

- 10.17.3 at `ν = ½` is exact: `J_{1/2}(x) = (2/(πx))^{1/2} cos(x − π/2)`.
- 10.18.17 at `ν = ½`: `μ − 1 = 0` and the series is `2/(πx)`, exact.
- 10.40.6 at `ν = ½`: `I_{1/2}(x) K_{1/2}(x) = (1 − e^{−2x})/(2x)`, whose expansion is `1/(2x)`.

### Dependencies

Layers 1–3; AsymptoticExpansions Layers 1, 4 and 10; AnalyticNumberTheoryPartI.

## Layer 6: large order

### 6.1 Debye's expansions of `I_ν`, `K_ν` on the positive axis

DLMF 10.41.1–10.41.11 for real `ν → ∞` and real `z > 0`, uniformly in `z ∈ (0, ∞)`, with
`η = (1 + z²)^{1/2} + ln(z/(1 + (1 + z²)^{1/2}))` and `p = (1 + z²)^{−1/2}` (10.41.7–10.41.8):

```text
I_ν(νz) − e^{νη} / ((2πν)^{1/2} (1 + z²)^{1/4}) ∑_{k<N} U_k(p) ν^{−k}
    = O(e^{νη} ν^{−1/2} (1 + z²)^{−1/4} ν^{−N})
```

(`isBigO_besselI_debye`), and likewise 10.41.4–10.41.6 for `K_ν`, `I′_ν`, `K′_ν`. `U_k` is
`Real.debyeU k`, and `V_k` is defined by 10.41.9; both are polynomials (10.41.10–10.41.11 for
`k ≤ 3`). 10.41.1–10.41.2 are the fixed-`z` forms. The route: `w(ξ) = (1 + z²)^{1/4} I_ν(νz)` in
the Liouville variable `ξ = η` solves an equation of Case I with `u = ν`, and AsymptoticExpansions
§11.4 gives the expansion; the solution is identified with `I_ν` through its behaviour at `z → 0`
(2.1) and with `K_ν` through recessiveness at `z → ∞` (5.1).

DLMF 10.41.12–10.41.13 (§10.41(iv)) are a different limit and are separate targets: `z → +∞`
along the real axis with `ν > 0` and `ℓ ≥ 1` fixed, the remainder `O(z^{−ℓ})` being inside the
bracket (`isBigO_besselI_debye_atTop`, `isBigO_besselK_debye_atTop`). The uniform estimate does
not give them, since its remainder is measured in `ν`.
- For `K` the route is the explicit error bound of Case I on `(ξ, ∞)` (Olver 1997, Chapter 10,
  Theorem 3.1, applied to `K_ν` on pp. 377–378; DLMF §2.8(ii) cites it without printing it).
  AsymptoticExpansions §11.4 states only `O(u^{−n})`, so this roadmap owns the bound as an
  auxiliary result, proved from the Volterra equation of AsymptoticExpansions §10.1:
  `|ε_ℓ| ≤ 2 exp(2𝒱(A₁)/u) 𝒱_{ξ,∞}(A_ℓ)/u^ℓ`. Here `A_ℓ` is `U_ℓ(p)` up to the normalization
  of 10.41.10. `U_ℓ(p)` is `p^ℓ` times a polynomial in `p²`, and `p` decreases to `0`, so
  `𝒱_{z,∞}(U_ℓ(p)) = O(z^{−ℓ})`.
- For `I`: `η − z`, `p` and `(1 + z²)^{1/4} z^{−1/2}` have convergent expansions in `1/z` for
  `z > 1`. They are odd, odd and even in `z` respectively, using `η = (1 + z²)^{1/2} − arsinh(1/z)`.
  So the bracket of 10.41.12, multiplied by `e^{ν(η−z)} (z²/(1 + z²))^{1/4}` and re-expanded in
  `1/z`, is the corresponding series for 10.41.13 with `z ↦ −z`. Comparing 10.41.13 with 10.40.2
  (5.1) identifies the latter's coefficients with `a_j(ν) ν^{−j}`, up to `z^{−(ℓ−1)}`. Then 10.41.12
  is 10.40.1 (5.2) with these coefficients.

**Checks.**
- `U₁(p) = (3p − 5p³)/24` from the recursion, and `U₂(p) = (81p² − 462p⁴ + 385p⁶)/1152`.
- As `z → 0` the leading term of 10.41.3 is `(νz/2)^ν/Γ(ν + 1)` times
  `Γ(ν + 1) e^ν ν^{−ν} (2πν)^{−1/2}`, which tends to `1` as `ν → ∞` by Stirling's formula.
- `I_{10}(10) = 21.89170 61637…`, and the leading term of 10.41.3 at `z = 1` gives `21.8649…`.

*Needs:* 2.1, 5.1, 5.2; AsymptoticExpansions §§10.1, 11.1–11.4.

### 6.2 Debye's expansions of `J_ν`, `Y_ν` and fixed argument

DLMF 10.19.1–10.19.7 for real `ν → ∞`: 10.19.1–10.19.2 for fixed `z`, from the series 2.2 and
Stirling's formula; 10.19.3–10.19.4 uniformly for `α` in compact subsets of `(0, ∞)`; and
10.19.6–10.19.7 uniformly for `β` in compact subsets of `(0, π/2)`, with `ξ` of 10.19.5. The route
for 10.19.3–10.19.7 is Laplace's method on the Sommerfeld contour of 10.9.17–10.9.18 through the
saddle points of `sinh t − t sech α` (respectively `sinh t − t sec β`).

*Needs:* 3.2, 6.1; AsymptoticExpansions §§5.4–5.5.

### Examples

- 10.19.1 at `z = 1`: `J_ν(1) ∼ (e/(2ν))^ν/(2πν)^{1/2}`, which with Stirling is `1/(2^ν Γ(ν + 1))`.
- At `p = 1` (`z → 0`) the `U_k(1)` are the coefficients of Stirling's series for
  `ν^ν e^{−ν} (2πν)^{1/2}/Γ(ν + 1)`: `U₁(1) = −1/12`.

### Dependencies

Layers 1–5; AsymptoticExpansions Layers 5 and 11.

## Layer 7: zeros

### 7.1 Reality, simplicity and enumeration

For every real `ν` the positive zeros of `J_ν`, `Y_ν`, `J′_ν`, `Y′_ν` are infinitely many and
enumerated increasingly by `Real.besselJZero` and the others; those of `J_ν` and `Y_ν` are simple,
those of `J′_ν` for `ν ≥ −1`, and those of `Y′_ν` for `ν ≥ −½` (DLMF §10.21(i); `besselJZero_spec`
for `J_ν`). There are infinitely many positive zeros by Sturm comparison (auxiliary):
`u = x^{1/2} J_ν(x)` solves `u″ + (1 − (ν² − ¼)/x²) u = 0` (10.13.1 at `λ = 1`), whose coefficient
is at least `1 − ε` on `(X, ∞)` for `X` large, so `u` has a zero between any two consecutive zeros
of `sin(√(1 − ε) x)` there; and they are simple because `x > 0` is an ordinary point of 10.2.1. For
`ν ≥ −1` all zeros of `J_ν` are real (DLMF §10.21(i)), so the zeros of `I_ν` are on the imaginary
axis; for real `ν`, `K_ν` has no zeros with `z ≠ 0` and `|ph z| ≤ π/2` (DLMF §10.42). For real
`ν < −1`, `ν ∉ ℤ`, the entire function `z ↦ 𝐅(ν + 1)(−z²/4)` has exactly `2⌊−ν⌋` non-real zeros, two
of them on the imaginary axis when `⌊−ν⌋` is odd (DLMF §10.21(i), Hurwitz; Watson 1944, §15.27).
Consequently (DLMF §10.42, by 10.27.6), for real `ν` the entire function `z ↦ 𝐅(ν + 1)(z²/4)` has
nonzero real zeros only when `−2ℓ < ν < −(2ℓ − 1)` for some integer `ℓ ≥ 1`, and then exactly two,
`±x₀`; equivalently `I_ν` has exactly one zero on `(0, ∞)` in that case and none otherwise. At
negative integer `ν` that function also vanishes at `0`, since `1/Γ(ν + 1) = 0`. The reduced
functions `z ↦ 𝐅(ν + 1)(∓z²/4)` are defined by the series and equal `(z/2)^{−ν} J_ν(z)` and
`(z/2)^{−ν} I_ν(z)` for `z ≠ 0`. At `z = 0` the totalized product need not agree: at `ν = 1` it is
`0` and the series is `1`. The zero-free statement for `K_ν` is for `z ≠ 0`, since `K_ν(0)` is
totalized to `0`. The distribution of the complex zeros of `K_n(nz)`, which DLMF gives only by
figures, is not a target. The route: the phase `θ_ν` of 5.4 is strictly increasing with
`θ_ν(0+) = −π/2` and `θ_ν(x) → ∞`, so 10.21.12 locates the zeros; reality of the zeros of `J_ν` is
the Lommel integral 10.22.5 against `J_ν(z̄ t)`.

**Checks.**
- `j_{0,1} = 2.40482 55577…`, `j_{1,1} = 3.83170 59702…`, `y_{0,1} = 0.89357 69663…`.
- `j′_{0,1} = 0` and `j′_{0,2} = j_{1,1}` (10.21.1).
- `j_{1/2,m} = mπ` and `y_{1/2,m} = (m − ½)π`, from 10.16.1.
- `I_{−3/2}` has one zero on `(0, ∞)`, since `𝐅(−½)(0) = 1/Γ(−½) < 0` and `𝐅(−½)(x²/4) → ∞`;
  `I_{−5/2}` has none.

*Needs:* 5.4, 1.7; Tau Ceti `TauCeti.wronskian_eq_of_hasDerivAt`.

### 7.2 Interlacing and the phases at the zeros

DLMF 10.21.2–10.21.14: the interlacing 10.21.2 (`besselJZero_interlace`) and 10.21.3, the
cylinder functions `𝒞_ν(z) = J_ν(z) cos(πt) + Y_ν(z) sin(πt)` and their zeros `ρ_ν(t)`,
`σ_ν(t)` (10.21.4–10.21.11), defined as continuous increasing functions of `t` through the phase,
and 10.21.12–10.21.14.

**Checks.**
- `ρ_{1/2}(t) = πt`, since `𝒞_{1/2}(x) = (2/(πx))^{1/2} sin(x − πt)` by 10.16.1 and
  `ρ_{1/2}(0) = 0`.
- 10.21.8 at `m = 1`, `ν = 0`: `ρ_0(1) = j_{0,1} = 2.40482 55577…` and
  `ρ_0(½) = y_{0,1} = 0.89357 69663…`.
- 10.21.10 at `ν = ½`: `𝒞′_{1/2}(ρ) = (2/(πρ))^{1/2} = (½ ρ dρ/dt)^{−1/2}` with `dρ/dt = π`.

*Needs:* 7.1.

### 7.3 Infinite products and Rayleigh functions

DLMF 10.21.15–10.21.18 and 10.21.55. For `ν ≥ 0` and `z` in the slit plane,
`J_ν(z) = (z/2)^ν/Γ(ν + 1) ∏_k (1 − z²/j_{ν,k}²)` (10.21.15; `hasProd_besselJ`), and 10.21.16.
The route is the partial-fraction expansion of `J′_ν/J_ν` (auxiliary) by the residue theorem on
squares between consecutive zeros, with 5.2 for the bound on their sides. Rayleigh's function
`σ_n(ν)` of 10.21.55 (auxiliary) is computed from the Maclaurin coefficients of `J_{ν+1}/J_ν`.
10.21.17–10.21.18 follow from Nicholson's formula 10.9.30 and 7.2.

**Checks.**
- `σ_1(ν) = 1/(4(ν + 1))` and `σ_2(ν) = 1/(16 (ν + 1)² (ν + 2))`.
- At `ν = ½`, 10.21.15 is Euler's product `sin z/z = ∏ (1 − z²/(k²π²))`.
- `σ_1(0) = 1/4 = ∑ j_{0,k}^{−2}`.

*Needs:* 7.1, 5.2, 3.3; Tau Ceti `TauCeti.Contour.residue`.

### 7.4 McMahon's expansions

DLMF 10.21.19–10.21.21 as `m → ∞` with `ν` fixed, as asymptotic expansions in powers of
`1/a` with `a = (m + ν/2 − 1/4)π` for `j_{ν,m}` (and the shifts stated there for the others),
from 10.18.18 and 10.18.21 by reversion. For example
`j_{ν,m} = a − (μ − 1)/(8a) + O(a^{−3})` with `μ = 4ν²` (`isBigO_besselJZero_mcmahon`).

**Checks.**
- At `ν = ½`, `μ = 1` and all correction terms vanish: `j_{1/2,m} = mπ`.
- `j_{0,1} ≈ 0.75π + 1/(8 · 0.75π) = 2.40925…` against `2.40482…`.
- The shift `a` for `y_{ν,m}` is `(m + ν/2 − 3/4)π`; with `ν = ½`, `y_{1/2,m} = (m − ½)π`.

*Needs:* 5.4, 7.1; AsymptoticExpansions Layer 2.

### 7.5 Zeros of cross-products

DLMF 10.21.48–10.21.54, for `ν ≥ 0` and `λ > 1`: the `m`th positive zeros of the cross-products
10.21.48 and 10.21.49 have the expansions 10.21.50 with the coefficients 10.21.51 and 10.21.52 as
`m → ∞`; for 10.21.53 there is an integer `m₀`, depending on `ν` and `λ`, such that the `(m + m₀)`th
positive zero has the expansion 10.21.50 with the coefficients 10.21.54. The route: the
cross-product 10.21.48 equals `M_ν(x) M_ν(λx) sin(θ_ν(λx) − θ_ν(x))` by 10.18.4, so the zeros solve
`θ_ν(λx) − θ_ν(x) = mπ`, which 10.18.18 and reversion invert.

*Needs:* 5.4, 7.4.

### 7.6 Fourier–Bessel series

DLMF 10.22.37–10.22.38 and 10.23.18–10.23.21: the orthogonality relations
(`integral_besselJ_mul_besselJZero` for 10.22.37, for `ν > −1`), and for `ν ≥ −½` and `f` of bounded
variation near `x ∈ (0, 1)` with 10.23.18, the series 10.23.20 with the coefficients 10.23.19
converges to `½(f(x−) + f(x+))` (auxiliary, Watson 1944, §18.24; `tendsto_sum_fourierBessel`, with
`BoundedVariationOn f (Set.Icc a b)` for `0 < a < x < b < 1`, `Function.leftLim` and
`Function.rightLim`, and the partial sums, since the series need not converge absolutely); 10.23.21
is an instance.

*Needs:* 7.1, 5.2.

### Examples

- 10.22.37 at `ν = ½` is the orthogonality of `sin(mπt)` on `[0, 1]`.
- 10.21.16 at `ν = 1` and `z → 0` reproduces `J′_1(0) = ½`.
- 10.23.21 at `ν = ½`, `x = ½`: `(½)^{1/2} = ∑ 2 J_{1/2}(mπ/2)/(mπ J_{3/2}(mπ))`.

### Dependencies

Layers 1–5; AsymptoticExpansions Layer 2; Tau Ceti's residues.

## Layer 8: integrals

### 8.1 Indefinite and finite integrals

DLMF 10.22.1, 10.22.3–10.22.40: the primitives 10.22.1, 10.22.3–10.22.7 as derivative statements
on the slit plane; the integrals over `[0, x]` 10.22.8–10.22.12; the trigonometric integrals
10.22.13–10.22.26; the integrals of products 10.22.27–10.22.30; the convolutions
10.22.31–10.22.35; the fractional integral 10.22.36; and 10.22.39–10.22.40.

*Needs:* Layers 1–3.

### 8.2 Integrals over `(0, ∞)`

DLMF 10.22.41–10.22.49, 10.22.51–10.22.55, 10.22.59–10.22.65 and 10.22.67–10.22.70, as
improper or Bochner integrals according to absolute convergence, with the conditions stated
there. In particular `∫₀^∞ J_ν(t) dt = 1` for `Re ν > −1` as an improper integral (10.22.41;
`tendsto_integral_besselJ`), and the discontinuous integrals 10.22.59–10.22.64 with each case
stated separately.

10.22.49 is owned on its full domain `Re(μ + ν) > 0`, `Re(a ± ib) > 0`, where the integral is a
Bochner integral since `Re a > |ℑ b|`:
`∫₀^∞ t^{μ−1} e^{−at} J_ν(bt) dt = (b/2)^ν a^{−μ−ν} Γ(μ + ν) 𝐅(α, β; ν + 1; −b²/a²)` with
`α = (μ + ν)/2`, `β = (μ + ν + 1)/2`, principal powers and Mathlib's regularized Gauss function.
- For `|b| < |a|`, `−b²/a²` lies in the unit disc, where Mathlib's series converges
  Route: expand `J_ν(bt)` by 10.2.2, integrate termwise by
  `Γ`, and use the duplication formula 5.5.5 for `Γ(μ + ν + 2k)`.
- On the whole domain, `−b²/a²` lies in `ℂ \ [1, ∞)`: if `−b²/a² = s ≥ 1` then `b = ±i√s a`
  and one of `a ± ib` is `(1 − √s) a`, which cannot have positive real part together with
  `(1 + √s) a`. The theorem is the existence of a holomorphic `G` on `ℂ \ [1, ∞)` equal to the
  series on the unit disc, with 10.22.49 holding with `G` in place of the series
  (`exists_integral_cpow_mul_exp_mul_besselJ`). `G` is unique since `ℂ \ [1, ∞)` is connected.
  Route, in the variables `u = a + ib`, `v = a − ib`, which range over the product `D` of two
  open right half-planes, a convex set. Let `F(u, v)` be the left side divided by
  `(b/2)^ν a^{−μ−ν} Γ(μ + ν)`, with `(b/2)^{−ν} J_ν(bt)` read as the entire even function
  `(t/2)^ν 𝐅(ν + 1)(−b²t²/4)` of `b` (2.2).
  - `F` is holomorphic on `D`, by differentiation under the integral sign.
  - `F(λu, λv) = F(u, v)` for real `λ > 0`, by the substitution `t ↦ t/λ`. Holomorphy then gives
    the same for complex `λ` with `(λu, λv) ∈ D`, by the identity theorem in `λ`. So
    `F(u, v) = Φ(u/v)` with `Φ` holomorphic on the slit plane `|ph r| < π`, which `u/v`
    fills.
  - Evenness in `b` exchanges `u` and `v`, so `Φ(1/r) = Φ(r)`.
  - The Möbius map `s = (r − 1)/(r + 1)` takes the slit plane onto
    `Ω = ℂ \ ((−∞, −1] ∪ [1, ∞))` and `r ↦ 1/r` to `s ↦ −s`. So `Ψ(s) = Φ(r)` is an even
    holomorphic function on `Ω`, and `−b²/a² = s²`.
  - An even holomorphic function on `Ω` is `G(s²)` with `G` holomorphic on `{s² : s ∈ Ω}`,
    which is `ℂ \ [1, ∞)`. Away from `0`, `G(w) = Ψ(√w)` for either root, holomorphic since
    `s ↦ s²` is locally biholomorphic there. At `w = 0` the singularity is removable.
  - On the unit disc `G` is the series, by the disc case.

  The surjectivity of `(a, b) ↦ −b²/a²` onto `ℂ \ [1, ∞)` uses complex `a`; with `a = 1` the
  image is only the parabolic region `Re w < 1 − (Im w)²/4`.

10.22.64 is owned for `n = 0, 1, 2, …`, `Re μ > −n − 1`, `a, b > 0`, as an improper integral:
`∫₀^∞ J_{μ+2n+1}(at) J_μ(bt) dt` equals
`b^μ Γ(μ + n + 1)/(a^{μ+1} n!) 𝐅(−n, μ + n + 1; μ + 1; b²/a²)` for `b < a` and `0` for `b > a`
and `(−1)ⁿ/(2a)` for `b = a` (`tendsto_integral_besselJ_mul_besselJ`, the three cases in one
statement). Here `𝐅` is Mathlib's regularized Gauss function,
whose series terminates since its first parameter is `−n`
(`Complex.radius_regularizedGaussHGFunSeries_eq_top_of_left`), so it is a polynomial of degree
`n` in `b²/a²`, also when `μ + 1` is a nonpositive integer. Route for `b ≠ a`: the
Mellin–Parseval formula (3.3) with the Mellin transforms of `J_{μ+2n+1}(a·)` and `J_μ(b·)`
(10.22.43). In the resulting Mellin–Barnes integrand,
`Γ((μ + 2n + 1 + s)/2)/Γ((μ + 1 + s)/2)` is a polynomial of degree `n` in `s`, and of the poles
of `Γ((μ + 1 − s)/2)` only `n + 1` survive the zeros of `1/Γ((μ + 2n + 3 − s)/2)`. Closing the
contour on the side without poles gives `0` (for `b > a`); closing it on the other side gives
`n + 1` residues, which sum to the polynomial (for `b < a`). Route for `b = a`: scale to `a = 1`
and induct on `n`. By 10.6.1, `J_{μ+2n+1} = (2(μ + 2n)/t) J_{μ+2n} − J_{μ+2n−1}`. The integral
`∫₀^∞ J_{μ+2n}(t) J_μ(t) dt/t` vanishes for `n ≥ 1` and `Re μ > −n`: by the primitive 10.22.6
(8.1) it is the limit at infinity of the primitive, which by 5.2 is
`(2/π) sin(nπ)/((μ + 2n)² − μ²) = 0`, and the primitive vanishes at `0+`. So the integral at `n`
is minus the one at `n − 1`, and the case `n = 0` is 10.22.63 at `b = a`, with value `1/2`. This
gives `Re μ > −n`; the strip `−n − 1 < Re μ ≤ −n` follows by the identity theorem in `μ`. The
improper integral is holomorphic in `μ` there: integrate the tail by parts once with 5.2, which
makes the convergence locally uniform.

**Checks.**
- 10.22.49 at `μ = 1`, `ν = 0`, `a = 1`, `b = 2`, outside the disc:
  `∫₀^∞ e^{−t} J_0(2t) dt = 5^{−1/2} = 0.44721 35954…`, and `𝐅(½, 1; 1; −4) = 5^{−1/2}`.
- 10.22.49 at `μ = 1.3`, `ν = 0.7`, `a = 1`, `b = 2.5`: both sides equal `0.21257 29798…`.
- 10.22.49 at `b → 0`: both sides are `∼ (b/2)^ν Γ(μ + ν)/(Γ(ν + 1) a^{μ+ν})`.
- 10.22.64 at `μ = 0`, `n = 0`: `∫₀^∞ J_1(at) J_0(bt) dt` is `1/a` for `b < a`, `1/(2a)` for
  `b = a` and `0` for `b > a`.
- At `b = a` the value `(−1)ⁿ/(2a)` is the mean of the one-sided limits `(−1)ⁿ/a` and `0`: by
  Chu–Vandermonde `𝐅(−n, μ + n + 1; μ + 1; 1) = (−1)ⁿ n!/Γ(μ + n + 1)`. Numerically,
  `∫₀^∞ J_{7/2}(t) J_{1/2}(t) dt = −½` and `∫₀^∞ J_{6.3}(t) J_{1.3}(t) dt = ½`.
- 10.22.64 at `μ = ½`, `n = 1`, `a = 2`, `b = 1`: both sides equal `0.30935 92167…`.

*Needs:* 8.1, 5.2, 3.3, 1.4; for 10.22.49 and 10.22.64, 2.2 and Mathlib
`Complex.regularizedGaussHGFun`.

### 8.3 Triple products

DLMF 10.22.73–10.22.75 with `A` of 10.22.73: each case `A > 0`, `A < 0`, `A = 0` stated
separately.

*Needs:* 8.2.

### 8.4 Integrals of `I_ν`, `K_ν`

DLMF 10.43.1, 10.43.3–10.43.21, 10.43.23–10.43.25 and 10.43.27–10.43.29, including the Mellin
transform `∫₀^∞ t^{μ−1} K_ν(t) dt = 2^{μ−2} Γ((μ − ν)/2) Γ((μ + ν)/2)` for `|Re ν| < Re μ`
(10.43.19; `integral_cpow_mul_besselK`).

Bickley's function is defined for `x > 0` and every complex `α` by
`Ki_α(x) = ∫₀^∞ e^{−x cosh t} (cosh t)^{−α} dt` (10.43.12). The integral converges absolutely and
is entire in `α`. 10.43.11 is a theorem for `Re α > 0`, and 10.43.13–10.43.17 are targets with
the conditions stated there; 10.43.16 is the limit `x → 0+` for `Re α > 0`.

**Checks.**
- `Ki₀(1) = K₀(1) = 0.42102 44382…` (10.43.14, from 10.32.9 at `ν = 0`).
- `Ki_{3/2}(0+) = √π Γ(¾)/(2 Γ(5/4)) = 1.19814 02347…` and `Ki₁(0+) = π/2` (10.43.16).
- `Ki₁(1) = ∫₁^∞ K₀(t) dt = 0.32828 64781…` (10.43.13 at `α = 1`).

*Needs:* Layers 1–3, 5.1.

### Examples

- 10.22.41 at `ν = ½`: `∫₀^∞ (2/(πt))^{1/2} sin t dt = 1`.
- 10.43.19 at `ν = ½`, `μ = 3/2`: `∫₀^∞ (π/2)^{1/2} e^{−t} dt = (π/2)^{1/2} = 2^{−1/2} Γ(½) Γ(1)`.
- 10.22.29 at `x → 0`: both sides are `O(x²)`.

### Dependencies

Layers 1–7.

## Layer 9: spherical Bessel functions

### 9.1 Definitions and basic properties

DLMF 10.47.1–10.47.17 with the pinned definitions: the relations 10.47.3–10.47.9 to `J`, `Y`,
`H`, `I`, `K` on the slit plane (10.47.3: `sphericalBesselJ_eq_besselJ`), the equations
10.47.1–10.47.2 (`sphericalBesselJ_ode` for `𝗃_n`), and 10.47.10–10.47.17.

**Checks.**
- `𝗃₀(z) = sin z/z` and `𝗒₀(z) = −cos z/z`.
- `𝗄₀(z) = (π/2) e^{−z}/z`; with `(−1)ⁿ` in place of `(−1)^{n+1}` in the pinned `𝗄_n` it would
  be negative on `(0, ∞)`.
- `𝗃₁(1) = 0.30116 86789…`.

*Needs:* 1.1, 1.7, 4.3.

### 9.2 Explicit formulas, recurrences, limiting forms and series

Throughout, `n` is a natural number, `z ≠ 0` (for `𝗒_n`, `𝗁⁽¹⁾_n`, `𝗁⁽²⁾_n`, `𝗂⁽²⁾_n`, `𝗄_n`),
and `(2m − 1)!!` is the double factorial with `(−1)!! = 1`. Set
`a_k(n + ½) = (n + k)!/(2^k k! (n − k)!)` and
`s_k(n + ½) = (2k)! (n + k)!/(2^{2k} (k!)² (n − k)!)` for `0 ≤ k ≤ n` (10.49.1, 10.49.17).

- Explicit formulas, 10.49.2–10.49.13: the finite sums for `𝗃_n`, `𝗒_n`, `𝗁⁽¹⁾_n`, `𝗁⁽²⁾_n`
  in terms of `sin`, `cos`, `e^{±iz}` and `a_k(n + ½)`, the corresponding sums for `𝗂⁽¹⁾_n`,
  `𝗂⁽²⁾_n` in `sinh`, `cosh`, and `𝗄_n(z) = ½π e^{−z} ∑_{k=0}^n a_k(n + ½)/z^{k+1}` (10.49.12),
  with the listed cases `n = 0, 1, 2`.
- Rayleigh formulas, 10.49.14–10.49.16: `𝗃_n(z) = zⁿ (−z⁻¹ d/dz)ⁿ (sin z/z)` and the analogues for
  `𝗒_n`, `𝗂⁽¹⁾_n`, `𝗂⁽²⁾_n` and `𝗄_n`.
- Squares, 10.49.18–10.49.21: `𝗃_n² + 𝗒_n² = ∑_{k=0}^n s_k(n + ½)/z^{2k+2}` and
  `(𝗂⁽¹⁾_n)² − (𝗂⁽²⁾_n)² = (−1)^{n+1} ∑_{k=0}^n (−1)^k s_k(n + ½)/z^{2k+2}`, with the listed
  cases `n = 0, 1, 2`.
- Wronskians and cross-products, 10.50.1–10.50.4: `𝒲{𝗃_n, 𝗒_n} = z⁻²`,
  `𝒲{𝗁⁽¹⁾_n, 𝗁⁽²⁾_n} = −2i z⁻²`, the `𝗂⁽¹⁾`, `𝗂⁽²⁾`, `𝗄` Wronskians of 10.50.2, the
  cross-products of 10.50.3, and `𝗃₀ 𝗃_n + 𝗒₀ 𝗒_n` as the finite sum of 10.50.4.
- Recurrences, 10.51.1–10.51.6: for `f_n` any of `𝗃_n`, `𝗒_n`, `𝗁⁽¹⁾_n`, `𝗁⁽²⁾_n`,
  `f_{n−1} + f_{n+1} = ((2n + 1)/z) f_n` and `n f_{n−1} − (n + 1) f_{n+1} = (2n + 1) f′_n` for
  `n ≥ 1`, the two derivative forms of 10.51.2 (for `n ≥ 1` and `n ≥ 0`), and both iterated forms
  of 10.51.3; and for `g_n` any of `𝗂⁽¹⁾_n`, `𝗂⁽²⁾_n`, `(−1)ⁿ 𝗄_n`, the sign-changed versions
  10.51.4–10.51.6 with the same ranges of `n` and `m`.
- Limiting forms, 10.52.1–10.52.6: as `z → 0`, `𝗃_n(z)` and `𝗂⁽¹⁾_n(z)` are
  `∼ zⁿ/(2n + 1)!!`, and `−𝗒_n`, `i 𝗁⁽¹⁾_n`, `−i 𝗁⁽²⁾_n`, `(−1)ⁿ 𝗂⁽²⁾_n`, `(2/π) 𝗄_n` are
  `∼ (2n − 1)!!/z^{n+1}`; as `z → ∞`, the forms of 10.52.3 with the error `e^{|ℑz|} O(z⁻²)`
  uniformly in `ph z`, 10.52.4 in `|ph z| ≤ π − δ`, 10.52.5 for `𝗂⁽¹⁾_n`, `𝗂⁽²⁾_n` in
  `|ph z| ≤ ½π − δ`, and 10.52.6 for `𝗄_n` in `|ph z| < π`.
- Power series, 10.53.1–10.53.4: `𝗃_n(z) = zⁿ ∑_k (−z²/2)^k/(k! (2n + 2k + 1)!!)`, the series of
  `𝗂⁽¹⁾_n` with `+z²/2`, and the two-part series of `𝗒_n` and `𝗂⁽²⁾_n` (a finite principal part
  and a convergent tail), each as a `HasSum` for every `z ≠ 0`.

Route: 10.49.2–10.49.13 and 10.53 follow from the pinned `𝐅` series and 10.16.1, or by induction
on `n` from `n = 0, 1` via 10.51; 10.52.3–10.52.6 then follow from the finite sums directly, not
from Layer 5. 10.50 follows from 9.1 and 1.3, or from the finite sums.

**Checks.**
- 10.49.19 at `n = 1`, `z = 1`: `𝗃₁(1)² + 𝗒₁(1)² = 2`.
- 10.50.4 at `n = 2`, `z = 2`: `𝗃₀(2) 𝗃₂(2) + 𝗒₀(2) 𝗒₂(2) = −1/16`, since `a₂(5/2) = 3`.
- 10.49.12 at `n = 1`: `𝗄₁(z) = ½π e^{−z}(z⁻¹ + z⁻²)`, positive on `(0, ∞)`.
- 10.51.2 at `n = 0`: `𝗃′₀ = −𝗃₁`, consistent with 10.49.3 at `n = 1`.

*Needs:* 9.1, 1.3–1.4, 2.1–2.2, 4.3.

### 9.3 Integral representations, continued fraction and generating functions

DLMF 10.54.1–10.54.5, 10.55.1 and 10.56.1–10.56.5. 10.54.2–10.54.3 use `P_n(x)`, written as
`Polynomial.shiftedLegendre n` at `(1 − x)/2`, since Mathlib's `P̃_n(y)` is `P_n(1 − 2y)`.

*Needs:* 9.1, 3.1, 4.1.

### 9.4 Zeros, integrals and sums

DLMF 10.57.1, 10.58.1–10.58.2, 10.59.1 and 10.60.1–10.60.14, with `P_n` as in 9.3 and `Si` from
SpecialFunctionsEiLiErfIncompleteGamma in 10.60.11. In particular the plane-wave expansion
`e^{iz cos α} = ∑ (2n + 1) iⁿ 𝗃_n(z) P_n(cos α)` (10.60.7; `hasSum_planeWave`). 10.59.1 is 10.22.64
and 10.22.43 (8.2): by parity it is `2∫₀^∞ cos(bt) 𝗃_n(t) dt` for even `n` and
`2i∫₀^∞ sin(bt) 𝗃_n(t) dt` for odd `n`, and by symmetry `b ≥ 0` suffices. For `b > 0`, with
`𝗃_n(t) = (π/(2t))^{1/2} J_{n+½}(t)` and `cos`, `sin` as `J_{∓½}`, this is 10.22.64 at `μ = ∓½` and
`a = 1`, and the case `b = 1` is its case `b = a`. For `b = 0` it is `2∫₀^∞ 𝗃_n(t) dt` (even `n`,
the odd case being `0`), which is 10.22.43 at `ν = n + ½`, `μ = −½`.

*Needs:* 9.1–9.3, 7.1, 2.4, 8.2.

### Examples

- 10.60.12 at `z = 0`: `𝗃₀(0)² = 1`.
- 10.60.7 at `α = π/2`: `1 = ∑ (2n + 1) iⁿ 𝗃_n(z) P_n(0)`, with only even `n` contributing.
- 10.49.3 at `n = 1`: `𝗃₁(z) = sin z/z² − cos z/z`.

### Dependencies

Layers 1–8; Mathlib `Polynomial.shiftedLegendre`.

## Layer 10: Kelvin functions

### 10.1 Definitions and basic properties

DLMF 10.61.1–10.61.12 for real `ν` and `x > 0`: the defining relations with all forms of
10.61.1–10.61.2, the equations 10.61.3–10.61.4 (`kelvin_ode`), and 10.61.5–10.61.12.

**Checks.**
- `ber 1 = 0.98438 17812…` and `bei 1 = 0.24956 60400…`.
- `ber_ν 0+ = 0` for `ν > 0`, and `ber 0+ = 1`.
- 10.61.9 at `ν = ½`, which fixes the choice `e^{3πi/4}` against `e^{πi/4}` in 10.61.1.

*Needs:* 1.1, 1.7–1.8.

### 10.2 Recurrences, integrals, series and expansions in Bessel series

Throughout, `ν` is real and `x > 0`, and `(f_ν, g_ν)` is any of the ordered pairs
`(ber_ν, bei_ν)`, `(bei_ν, −ber_ν)`, `(ker_ν, kei_ν)`, `(kei_ν, −ker_ν)` (10.63.1).

- Recurrences, 10.63.2–10.63.4: `f_{ν−1} + f_{ν+1} = −(ν√2/x)(f_ν − g_ν)`,
  `√2 f′_ν = f_{ν+1} + g_{ν+1} − (ν/x)(f_ν − g_ν) = −f_{ν−1} − g_{ν−1} + (ν/x)(f_ν − g_ν)`
  (10.63.2–10.63.3), and the order-zero cases `√2 ber′ x = ber₁ x + bei₁ x`,
  `√2 bei′ x = −ber₁ x + bei₁ x` and their `ker`, `kei` analogues (10.63.4).
- Quadratic combinations, 10.63.5–10.63.7: with `p_ν = ber_ν² + bei_ν²`,
  `q_ν = ber_ν bei′_ν − ber′_ν bei_ν`, `r_ν = ber_ν ber′_ν + bei_ν bei′_ν` and
  `s_ν = (ber′_ν)² + (bei′_ν)²`, the recurrences 10.63.6 and `p_ν s_ν = r_ν² + q_ν²` (10.63.7); and
  the same with `ker`, `kei` in place of `ber`, `bei`.
- Integral representations, 10.64.1–10.64.2, for integer `n`:
  `ber_n(x√2) = ((−1)ⁿ/π) ∫₀^π cos(x sin t − nt) cosh(x sin t) dt` and the companion for
  `bei_n(x√2)` with `sin(x sin t − nt) sinh(x sin t)`, from 3.1 at `x e^{3πi/4} √2`.
- Power series, 10.65.1–10.65.9: the series for `ber_ν x`, `bei_ν x` (10.65.1;
  `hasSum_kelvinBer` for `ber_ν`), the case `ν = 0` (10.65.2), the series for `ker_n x`, `kei_n x`
  at integer `n ≥ 0` with the finite part, the `ln(½x)` terms and the `ψ` terms of 10.65.3–10.65.5,
  and the series 10.65.6–10.65.9 for `p_ν`, `q_ν`, `r_ν`, `s_ν`, each with
  `1/(Γ(ν + k + 1) Γ(ν + 2k + 1))`-type coefficients read with `1/Γ` entire.
- Expansions in Bessel series, 10.66.1–10.66.2: `ber_ν x + i bei_ν x` equals both series of 10.66.1,
  in `J_{ν+k}(x)` and in `I_{ν+k}(x)`, and for integer `n` `ber_n(x√2)` and `bei_n(x√2)` equal the
  bilateral sums `∑_{k∈ℤ} (−1)^{n+k} J_{n+2k}(x) I_{2k}(x)` and its companion (10.66.2).
- Indefinite integrals, 10.71.1–10.71.8, each stated as the derivative of the right-hand side
  equalling the integrand on `(0, ∞)`: 10.71.1–10.71.2 for `x^{1±ν} f_ν`; 10.71.3–10.71.7 for the
  products of `(f_ν, g_ν)` with a second pair `(f̂_ν, ĝ_ν)` from 10.63.1, which may coincide
  with it; and 10.71.8: `x M_ν²` is the derivative of `x(ber_ν bei′_ν − ber′_ν bei_ν)` and
  `x N_ν²` that of `x(ker_ν kei′_ν − ker′_ν kei_ν)`.

Route: 10.63 and 10.71 from 1.4 and 1.8 at `x e^{3πi/4}` and `x e^{πi/4}` (real and imaginary
parts); 10.65 from the pinned `𝐅` series and 1.8; 10.66.1 from the multiplication theorem 10.23.1
or directly from the series; 10.66.2 from `J_n(u + v) = ∑_{k∈ℤ} J_{n−k}(u) J_k(v)` for all `u`,
`v` at integer `n` (a product of two generating functions 10.12.1), at `u = −x`, `v = ix`, with
`J_k(ix) = i^k I_k(x)` and `−x + ix = x√2 e^{3πi/4}`.

**Checks.**
- 10.63.4 at `x = 1`: `√2 ber′ 1 = ber₁ 1 + bei₁ 1 = −0.08831 16296…`.
- 10.64.1 at `n = 0`, `x = 1`: `ber √2 = (1/π) ∫₀^π cos(sin t) cosh(sin t) dt = 0.93760 84768…`.
- 10.71.5 for `(ber, bei)` at `ν = 0`: the derivative of `x(ber bei′ − ber′ bei)` at `x = 1` is
  `ber² 1 + bei² 1 = 1.03129 06995…`.

*Needs:* 10.1, Layers 1–3, 8.

### 10.3 Large argument, modulus and phase, zeros

DLMF 10.67.1–10.67.16, 10.68.1–10.68.21 and 10.70.1–10.70.2, with the pinned phases
(`kelvinModulus_kelvinPhase`, `kelvinKModulus_kelvinKPhase` for 10.68.3–10.68.4). 10.67 follows
from 5.1–5.2 at `x e^{3πi/4}` and `x e^{πi/4}`, both on the principal sheet; 10.70 from 10.68 by
reversion.

**Checks.**
- `θ₀(0+) = 0` and `φ₀(0+) = 0`, the pinned limits at `ν = 0`.
- From 10.61.9, `θ_{1/2}(x√2) = x + π/8 + Arg(1 − e^{−2(1+i)x})` for `x > 0`, with the principal
  `Arg` since `|e^{−2(1+i)x}| < 1`; it tends to `3π/8` at `0+`, and `θ_{1/2}(√2) = 1.50867 51751…`.
- As `x → ∞` the same formula gives `θ_{1/2}(x√2) − x → π/8`, the phase of 10.67.

*Needs:* 10.1, 5.1–5.2; AsymptoticExpansions Layer 2.

### Examples

- 10.68.5 and 10.67.9 at large `x`: `M_0(x)² ∼ e^{x√2}/(2πx)`.
- 10.65.1 at `ν = 0`: `ber x = ∑ (−1)^k (x²/4)^{2k}/((2k)!)²`.
- 10.61.8 at `n = 1`: `ber_{−1} = −ber_1`.

### Dependencies

Layers 1–8.

## Layer 11: relations owed to other roadmaps

### 11.1 Airy functions

SpecialFunctionsAiry excludes the formulas through `K_ν`, `Y_ν`, the Hankel functions and the
complex `I_ν`. This roadmap proves:
- the `K`, `H` and complex `I` forms of DLMF 9.6.2–9.6.9, for `|ph z| < 2π/3` with
  `ζ = (2/3) z^{3/2}`; for example `Ai(z) = π⁻¹ (z/3)^{1/2} K_{1/3}(ζ)` (9.6.2;
  `airyAi_eq_besselK`, stated in `Suggested.lean` with `airyAi`, a local copy of
  SpecialFunctionsAiry's pinned `Ai`);
- DLMF 9.6.15–9.6.20 for `ζ` in the slit plane with `z = (3ζ/2)^{2/3}`;
- DLMF 9.8.9–9.8.12, the Airy modulus and phase through `M_{1/3}`, `θ_{1/3}` and their
  derivatives;
- DLMF 9.12.22–9.12.23, the Scorer integrals of `K_{1/3}`;
- the `K` forms of DLMF 9.13.2 and 9.13.4 for the generalized Airy functions.

**Checks.**
- `Ai(1) = 0.13529 24163… = π⁻¹ 3^{−1/2} K_{1/3}(2/3)`.
- 9.6.2 with `K_{−1/3}` in place of `K_{1/3}` gives the same value, by 10.27.3.
- At `z → 0`, 9.6.2 and 10.30.2 give `Ai(0) = 3^{−2/3}/Γ(⅔)`.

*Needs:* 1.7–1.8, 5.4; SpecialFunctionsAiry.

### 11.2 Parabolic cylinder functions

DLMF 12.7.8–12.7.11: `U(a, z)` for `a = −2, −1, 0, 1` through `K_{1/4}`, `K_{3/4}`, `K_{5/4}` at
`z²/4`, for `|ph z| < π/4`.

*Needs:* 1.7–1.8, 4.3; SpecialFunctionsParabolicCylinder.

### 11.3 Exponential, error and incomplete Gamma functions

DLMF 6.7.15–6.7.16 (`f`, `g` through `K₀`), 6.10.4–6.10.8 (`Si`, `Cin` and `Ei` in 6.10.4–6.10.6 in
series of squares of spherical functions, and `Ein` in 6.10.8 linear in `𝗂⁽¹⁾_n`, with `a_n` of
6.10.7), 7.6.8–7.6.11 (`erf`, `C`, `S` in series of spherical functions, with Mathlib's
`Polynomial.Chebyshev.T` in 7.6.9), 8.6.6 (`Γ(a, z)` through `K_a`), 8.7.4–8.7.5 (`γ(a, x)` and
`γ*(a, z)` in series of `I_{n+a}` and `𝗂⁽¹⁾_n`, with `e_n(z) = ∑_{k≤n} zᵏ/k!`) and 8.21.16–8.21.17
(`Si(a, z)` in series of `𝗃_{2k+1}` and `Ci(a, z)` in series of `𝗃_{2k}`), with the conditions
stated there.

*Needs:* Layers 1, 3, 9; SpecialFunctionsEiLiErfIncompleteGamma.

### Examples

- 6.10.4 at `z → 0`: `Si(z) ∼ z 𝗃₀(0)² = z`.
- 9.6.15 is 9.6.2 solved for `K_{1/3}`.
- 12.7.10 at `z > 0`: `U(0, z) = (z/(2π))^{1/2} K_{1/4}(z²/4) > 0`.

### Dependencies

Layers 1–10; SpecialFunctionsAiry; SpecialFunctionsParabolicCylinder;
SpecialFunctionsEiLiErfIncompleteGamma.

## Downstream consumers

- **SpecialFunctionsConfluent** consumes `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν` and `K_ν` with their
  equations and connection formulas, the Kummer form 10.39.5 of `I_ν` and the integral 10.32.9 of
  `K_ν`.
- **StandardDistributions** can state the densities of the noncentral chi-squared, von Mises and
  normal-inverse-Gaussian laws through `I_ν` and `K_ν` from here.
- A roadmap for the uniform expansions of DLMF §10.20 consumes Layers 1, 5 and 6 and the Airy
  functions.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material completes DLMF Chapter 10. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

**Planned for follow-up roadmaps.**
- **Uniform expansions for large order** (DLMF §10.20) in terms of Airy functions, and what rests
  on them: the transition region 10.19.8–10.19.15, the zeros for large order 10.21.22–10.21.47,
  10.41.14–10.41.15, the domain `𝐊` of 10.14.9, the spherical expansions of §10.57 beyond 10.57.1,
  and the Kelvin expansions of §10.69. They need the turning-point theory of DLMF §§2.8(iii)–(iv),
  which AsymptoticExpansions excludes.
- **Debye's expansions in complex sectors**: 10.41.3–10.41.6 for `|ph z| < π/2` off the positive
  axis, which need a complex Liouville–Green theory.
- **Values off the principal sheet**: the parts of 10.17.5–10.17.6, 10.17.11–10.17.12, 10.40.2,
  10.40.4–10.40.5 with `|ph z| ≥ π`, which need the functions in logarithmic coordinates.
- **Formulas through Struve, Whittaker, Kummer `U`, Legendre and Gauss functions**: DLMF
  10.16.6–10.16.8, 10.16.10, 10.22.2, 10.22.50, 10.22.56–10.22.58, 10.22.66,
  10.22.71–10.22.72, 10.39.6–10.39.8, 10.39.10, 10.43.2, 10.43.22, 10.43.26, and DLMF
  9.6.21–9.6.24 and 12.7.14. They belong to roadmaps for DLMF Chapters 11, 13, 14 and 15.
- **Laguerre expansions** (DLMF 8.7.6), which belong to an orthogonal-polynomial roadmap.

**Deferred, with no planned roadmap.**
- **Functions of imaginary order** (DLMF §§10.24, 10.45) and **generalized and incomplete Bessel
  functions** (DLMF §10.46).
- **Complex zeros** of `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν` and their derivatives (DLMF §10.21(ix)–(x)).
- **Exponentially improved expansions** (DLMF 10.17.16–10.17.18, 10.40.13–10.40.14), which rest on
  the remainder theory of DLMF §2.11.
- **Hankel and Kontorovich–Lebedev transforms** (DLMF 10.22.76–10.22.79, 10.43.30–10.43.31).
- **Applications, computation and tables** (DLMF §§10.72–10.75).
- **Sections with nothing to formalize**: the notation of §10.1, the graphs of §§10.3, 10.26,
  10.48 and 10.62, the approximation references of §10.76 and the software list of §10.77.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its
directory `DLMF/Bessel/` provides source material for most layers, with a coverage table in
`DLMF/Bessel/DLMFCoverage.md`. That development defines `Y_ν` and `K_ν` at integer order by
`limUnder` and the spherical functions through `J_{n+1/2}`; this roadmap defines the integer
orders through `deriv` in the order (10.2.4, 10.27.5) and the spherical functions by entire
series, with the other forms as theorems.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source contains both proved theorems and admitted statements, and serves as a
reference, not as a specification. The following secondary provenance map records source
counterparts; the mathematical targets and dependencies are specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1–4 | `Bessel/Basic`, and the files of `DLMF/Bessel/` for DLMF §§10.2–10.16 and 10.25–10.39 |
| 5–6 | the files for DLMF §§10.14, 10.17–10.19, 10.37, 10.40–10.41 |
| 7 | the files for DLMF §§10.21, 10.42 |
| 8 | the files for DLMF §§10.22–10.23, 10.43–10.44 |
| 2.5 | `DLMF/SphericalHarmonics/BesselAddition.lean` (10.23.8 for `J`, `Re ν > 0`, real arguments) |
| 9 | `Bessel/Basic` (`sphericalJ`, `sphericalI`), `Bessel/SphericalSeriesTools`, `Bessel/SphericalProductTools` |
| 10 | none: the Kelvin functions of DLMF §§10.61–10.71 are new here |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 10
  (F. W. J. Olver and L. C. Maximon), <https://dlmf.nist.gov/10>. Every equation number refers to
  this release.
- G. N. Watson, *A Treatise on the Theory of Bessel Functions*, 2nd ed., Cambridge University
  Press, 1944.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapters 7, 10 and 11.
- G. Nemes, Error bounds for the large-argument asymptotic expansions of the Hankel and Bessel
  functions, *Acta Appl. Math.* 150 (2017), 141–177; arXiv:1606.07961.
- W. Gautschi, Computational aspects of three-term recurrence relations, *SIAM Rev.* 9 (1967),
  24–82.

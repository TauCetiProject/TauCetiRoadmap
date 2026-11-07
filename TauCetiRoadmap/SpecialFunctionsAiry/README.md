# Roadmap: Airy and Scorer functions

**Summary.** This roadmap builds the theory of the Airy and Scorer functions of Chapter 9 of the
NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. The Airy functions `Ai` and `Bi` are the standard solutions of Airy's equation

```text
w″ = z w                                                           (DLMF 9.2.1)
```

and the Scorer functions `Gi` and `Hi` are the standard solutions of the inhomogeneous equations
`w″ = z w ∓ 1/π` (DLMF 9.12.1, 9.12.3).

The roadmap covers:
- the definitions as entire functions, the values at the origin, the Wronskians and the
  connection formulas;
- the Maclaurin series and the integral representations;
- the asymptotic expansions for large argument in every sector, with explicit error bounds;
- the modulus and phase functions on the negative real axis;
- the real and complex zeros and their asymptotic expansions;
- the Scorer functions: series, integral representations, connection formulas, asymptotics and
  zeros;
- integrals, Laplace and Mellin transforms of `Ai` and `Bi`;
- products of Airy functions, their integrals and the Airy kernel;
- the incomplete Airy functions;
- the relations to Bessel functions of the first kind and to Kummer's function;
- the generalized Airy functions of Swanson and Headley, Olver, Smirnov and Reid.

The general asymptotic and contour tools are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md) (DLMF Chapter 2): the expansion API,
the inversion and reversion of transcendental equations, Watson's lemma in sectors and along
rotated rays, integration of expansions, the line shift with simple poles, the Gamma function on
vertical strips and the theory of ordinary points. The complex incomplete Gamma functions on the
logarithmic plane are consumed from
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md).
This roadmap builds the Gauss triplication formula for `Γ`, the binomial remainder bounds behind
the error bounds of DLMF §§9.7(iii)–(iv), Kummer's second transformation, the Bessel integral for
`J₀`, a half-line Sokhotski–Plemelj formula, and the Airy-kernel identities used in random matrix
theory.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Airy/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`, with the triplication formula
of 7.1 in `TauCeti/Analysis/SpecialFunctions/Gamma/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definitions and Airy's equation** (DLMF §§9.2, 9.4). `Ai` and `Bi` are entire, solve
   Airy's equation and have the stated Maclaurin series, values at the origin, Wronskians,
   rotations and connection formulas; every entire solution of Airy's equation is a combination
   of `Ai` and `Bi`. The relations of DLMF §9.6 to Mathlib's Bessel function `J_ν`, Tau Ceti's
   real `I_ν` and Kummer's function.
2. **Integral representations** (DLMF 9.5.1–9.5.8).
3. **Asymptotic expansions** (DLMF 9.7.1–9.7.19): the expansions of `Ai`, `Bi` and their
   derivatives in every sector, the error bounds of §9.7(iv) and the exact remainders.
4. **Modulus and phase** (DLMF 9.8.1–9.8.8 and 9.8.13–9.8.23).
5. **Zeros** (DLMF §9.9): the location, simplicity and enumeration of the zeros of `Ai`, `Ai′`,
   `Bi` and `Bi′`, the relations 9.9.1–9.9.5, and the asymptotic expansions 9.9.6–9.9.21.
6. **Scorer functions** (DLMF 9.12.1–9.12.7, 9.12.11–9.12.21 and 9.12.24–9.12.31, and the zeros
   of §9.12(ix)).
7. **Integrals** (DLMF 9.10.1–9.10.22), the Gauss triplication formula, and the incomplete Airy
   functions of DLMF §9.14.
8. **Products** (DLMF 9.11.1–9.11.19) and the Airy kernel.
9. **Generalized Airy functions** (DLMF §9.13): the functions of Swanson and Headley, Olver,
   Smirnov and Reid.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** Airy's equation, the inhomogeneous Airy equations and the following
DLMF formulas, with the hypotheses and conventions specified in the layers:

| Formulas | Targets |
|---|---|
| 9.2.1–9.2.16, 9.4.1–9.4.4 | Equation, values at the origin, Wronskians, connection formulas, Riccati form, Maclaurin series (Layer 1). |
| 9.6.1, 9.6.6–9.6.14, 9.6.25–9.6.26, and the `I` forms of 9.6.2–9.6.5 | Relations to `J_ν`, to the real `I_ν` on `(0, ∞)` and to Kummer's function (1.7). |
| 9.5.1–9.5.8 | Integral representations (Layer 2). |
| 9.7.1–9.7.19 | Coefficients, Poincaré expansions with an `O`-remainder for every truncation order, error bounds and exact remainders (Layer 3). |
| 9.8.1–9.8.8, 9.8.13–9.8.23 | Modulus and phase, their identities and expansions (Layer 4). |
| 9.9.1–9.9.21 | Zeros: phases and values at the zeros, and the asymptotic expansions (Layer 5). |
| 9.12.1–9.12.7, 9.12.11–9.12.21, 9.12.24–9.12.31 | Scorer functions (Layer 6). |
| 9.10.1–9.10.22 | Integrals and transforms (Layer 7). |
| 9.11.1–9.11.19 | Products (Layer 8). |
| 9.13.1–9.13.37 | Generalized Airy functions (Layer 9), with 9.13.2 and 9.13.4 in the forms of 9.1–9.2. |

It also owns the following auxiliary results, which the layers need and which neither Mathlib,
Tau Ceti nor a consumed roadmap provides:

| Result | Target |
|---|---|
| Convergence of the oscillatory improper integrals `∫₀^∞ cos(t³/3 + xt) dt` and `∫₀^∞ sin(t³/3 + xt) dt`, locally uniformly in `x` | 2.2 |
| Bounds for the remainder of the binomial expansion of `(1 + w)^{−1/6}` on rays and in sectors | 3.5 |
| The continuous phases `θ`, `φ` defined by integrals, with their limits at `±∞` | 4.1 |
| Kummer's second transformation `e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)` | 1.7 |
| The energy `Gi′² − x Gi² + 2 Gi/π` of the Scorer function, with derivative `−Gi²` | 6.7 |
| Gauss's triplication formula `Γ(z) Γ(z + ⅓) Γ(z + ⅔) = 2π 3^{½ − 3z} Γ(3z)` (DLMF 5.5.6 for `m = 3`) | 7.1 |
| The Sokhotski–Plemelj formula for Cauchy integrals over `(0, ∞)` with densities `C¹` near the point | 7.6 |
| The incomplete Airy function `Ai(a, z)` | 7.8 |
| Uniqueness for the product equation `w‴ − 4z w′ − 2w = 0` given `w(0)`, `w′(0)`, `w″(0)` | 8.1 |
| The representation `Ai(x)² = 2^{2/3} π⁻¹ ∫₀^∞ Ai(2^{2/3}(x + t²)) dt` | 8.3 |
| The Bessel integral `J₀(a) = (2π)⁻¹ ∫₀^{2π} e^{ia cos φ} dφ` | 8.3 |
| The Airy kernel `K_Ai(x, y) = ∫₀^∞ Ai(x + t) Ai(y + t) dt` in closed form, with its diagonal and tail bounds | 8.5 |
| The rotation connection formulas of `A_n` | 9.2 |
| The integral representation `A_n(z) = (2p/π) sin(pπ) z^{1/2} ∫₀^∞ e^{−ζ cosh u} cosh(pu) du` | 9.3 |

**What it does not own:**
- The general asymptotic and contour tools: asymptotic expansions, inversion and reversion of
  transcendental equations, Watson's lemma, the rotation of Laplace integrals, the line shift
  with simple poles, the Gamma function on vertical strips, and the existence and uniqueness of
  holomorphic solutions at ordinary points. They are consumed from AsymptoticExpansions; see
  [Exact supplier contracts](#exact-supplier-contracts).
- The complex incomplete Gamma functions, consumed from SpecialFunctionsEiLiErfIncompleteGamma for
  9.10.15–9.10.16.
- The formulas through functions that neither Mathlib nor Tau Ceti defines: `K_ν`, `Y_ν`, the
  Hankel functions, the Whittaker functions, Kummer's `U` and the modified Bessel function `I_ν`
  off the positive real axis. These are the `K`, `H` and complex `I` forms of 9.6.2–9.6.9, the
  relations 9.6.15–9.6.24, 9.8.9–9.8.12 and 9.12.22–9.12.23, and the `K` forms of 9.13.2 and
  9.13.4.
- The exponentially improved and hyperasymptotic expansions (DLMF 9.7.20–9.7.23).
- The complex zeros of the Scorer functions.
- Numerical values, tables and methods of computation.

See the last section for these.

**The boundary in one sentence:** this roadmap owns `Ai`, `Bi`, `Gi`, `Hi`, the generalized
Airy functions of DLMF §9.13 and everything in DLMF Chapter 9 stated through them and functions
that Mathlib or Tau Ceti defines (elementary functions, `Γ`, Kummer's `𝐌`, `J_ν`, the real `I_ν`
and the real incomplete Gamma function) or that a consumed roadmap supplies (the complex incomplete
Gamma functions); it consumes the general methods of AsymptoticExpansions and excludes formulas
through `K_ν`, `Y_ν`, the Hankel, Whittaker and `U` functions or the complex `I_ν`, remainder
theory beyond §9.7(iv), the complex zeros of the Scorer functions, and numerics.

## Conventions

- **Names.** The complex functions are `TauCeti.airyAi`, `TauCeti.airyBi`, `TauCeti.scorerGi`
  and `TauCeti.scorerHi`, all of type `ℂ → ℂ`. Derivatives are Mathlib's `deriv`; no separate
  derivative functions are introduced. The real restrictions are `TauCeti.Real.airyAi`,
  `TauCeti.Real.airyBi`, `TauCeti.Real.scorerGi` and `TauCeti.Real.scorerHi : ℝ → ℝ`, defined as
  the real parts of the complex functions at real points; 1.6 proves that the complex values are
  real there.
- **The reduced Bessel series.** `𝐅(b, x)` is
  `Complex.regularizedHGFun 0 {b} x = ∑ₙ xⁿ / (n! Γ(b + n))`, Mathlib's regularized `₀F₁`
  (the same series through which Mathlib defines `Complex.besselJ`). The Kummer function
  `𝐌(a, b, x)` is `Complex.regularizedHGFun {a} {b} x`.
- **Definitions of `Ai` and `Bi`.** By the Maclaurin series DLMF 9.4.1–9.4.4 with the initial
  values 9.2.3–9.2.6, written through `𝐅`:

```text
Ai(z) = 3^{−2/3} 𝐅(⅔, z³/9) − 3^{−4/3} z 𝐅(4/3, z³/9)
Bi(z) = 3^{−1/6} 𝐅(⅔, z³/9) + 3^{−5/6} z 𝐅(4/3, z³/9)
```

  The powers of `3` are principal `Complex.cpow` of a positive base. The initial values are
  `Ai(0) = 3^{−2/3}/Γ(⅔)`, `Ai′(0) = −3^{−1/3}/Γ(⅓)`, `Bi(0) = 3^{−1/6}/Γ(⅔)` and
  `Bi′(0) = 3^{1/6}/Γ(⅓)`, using `Γ(4/3) = Γ(⅓)/3`.
- **Scorer functions.** `Hi` is defined by DLMF 9.12.20 and `Gi` by DLMF 9.12.11:

```text
Hi(z) = π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt
Gi(z) = Bi(z) − Hi(z)
```

  The integral is the Bochner integral over `Set.Ioi 0`, absolutely convergent for every `z`.
- **Airy's equation is not a predicate.** A solution is stated with explicit hypotheses
  `Differentiable ℂ w` and `∀ z, deriv^[2] w z = z * w z`. The Wronskian is written out as
  `f z * deriv g z − deriv f z * g z`.
- **The variable `ζ`.** `ζ = (2/3) z^{3/2}` with the principal power, written out in each
  statement; for real `x > 0` it is `TauCeti.Real.airyZeta x = (2/3) * x ^ (3/2 : ℝ)`. Every
  complex power `z^c` is the principal `Complex.cpow`. All sectors used with `ζ` lie in
  `|ph z| < π`, where `z^{1/4}` and `z^{3/2}` are the principal powers; the statements use only
  the value of `ζ`. The phase of `ζ` is the lifted phase `ph ζ = (3/2) arg z`, the imaginary part
  of the logarithmic coordinate `Lζ(z) = log(2/3) + (3/2) log z`; it equals `arg ζ` only for
  `|arg z| < 2π/3`. The rotation of the path (AsymptoticExpansions §4.3) and the multipliers of
  9.7.17 use `Lζ` and the lifted phase.
- **Sectors at infinity.** "As `z → ∞` in `|ph z| ≤ θ`" is the filter
  `Bornology.cobounded ℂ ⊓ 𝓟 {z | |Complex.arg z| ≤ θ}`, written out in each statement; the
  filter for `|ph(−z)| ≤ θ` is the same with `Complex.arg (−z)`.
- **Bessel functions.** `J_ν` is Mathlib's
  [`Complex.besselJ`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/Bessel.html)
  `ν x = (x/2)^ν 𝐅(ν + 1, −(x/2)²)`, with the principal power, holomorphic in `x` on the slit
  plane. `I_ν` is Tau Ceti's `Real.besselI ν x`, the real part of `(x/2)^ν 𝐅(ν + 1, (x/2)²)`, used
  for `x > 0`. `₁F₁(a; b; x)` means `Γ(b) 𝐌(a, b, x)`.
- **Asymptotic expansions** are AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion`,
  which unfolds to "for every `N`, the remainder after `N` terms is `O(φ N)`". The oscillatory
  expansions 9.7.9–9.7.14, with two sums and an envelope `e^{|Im ζ|}`, are generalized
  expansions in that roadmap's sense and are written out with independent truncation orders for
  the two sums. Divergent series are never summed.
- **Improper integrals.** "`∫₀^∞ f = L` as an improper integral" means
  `Tendsto (fun R ↦ ∫ t in (0)..R, f t) atTop (𝓝 L)`, and likewise for `∫_{−∞}^0` with
  `atBot`; a whole-line improper integral has both tails converging separately. No predicate is
  introduced. Where an integrand is absolutely integrable, the statement uses the Bochner
  integral and an `IntegrableOn` hypothesis or conclusion.
- **Modulus and phase** (DLMF 9.8.3, 9.8.7). For real `x`:

```text
M(x) = (Ai(x)² + Bi(x)²)^{1/2}           θ(x) = π/6 − π⁻¹ ∫₀^x M(t)^{−2} dt
N(x) = (Ai′(x)² + Bi′(x)²)^{1/2}         φ(x) = −π/6 + π⁻¹ ∫₀^x t N(t)^{−2} dt
```

  These are `TauCeti.Real.airyModulus`, `airyPhase`, `airyDerivModulus` and `airyDerivPhase`.
  `M` and `N` are positive by the Wronskian 9.2.7, so the integrands are continuous. The phases
  are the continuous branches with `θ(0) = π/6` and `φ(0) = −π/6`; DLMF's `θ`, `φ` on `x ≤ 0`
  are their restrictions. The arctangent forms 9.8.4 and 9.8.8 are theorems modulo `π`.
- **Zeros** are indexed from `1`. For `f` one of `Ai`, `Ai′`, `Bi`, `Bi′` restricted to `ℝ`,
  the `k`th negative zero is the `x < 0` with `f x = 0` such that exactly `k − 1` zeros of `f`
  lie in `(x, 0)`:

```text
TauCeti.Real.negativeZero f k
  = Classical.epsilon fun x ↦ x < 0 ∧ f x = 0 ∧ {y | x < y ∧ y < 0 ∧ f y = 0}.ncard = k − 1
```

  `a_k`, `a′_k`, `b_k`, `b′_k` are `TauCeti.Real.airyAiZero`, `airyAiDerivZero`, `airyBiZero`
  and `airyBiDerivZero`, the instances for `Ai`, `Ai′`, `Bi`, `Bi′`. The complex zeros `β_k`,
  `β′_k` of `Bi`, `Bi′` with `π/3 < ph z < π/2` (`TauCeti.airyBiComplexZero`,
  `airyBiDerivComplexZero`) are ordered by modulus in the same way, with `‖w‖ < ‖z‖` in place of
  `x < y`. The value at `k = 0` is not used. 5.2 and 5.3 prove that each epsilon is attained and
  unique.
- **Asymptotic coefficients** (DLMF 9.7.2). `u_k = ∏_{j<2k} (2k + 1 + 2j) / (216^k k!)` and
  `v_k = −(6k + 1)/(6k − 1) · u_k`, so `u₀ = v₀ = 1`, `u₁ = 5/72`, `v₁ = −7/72`. These are
  `TauCeti.airyU`, `TauCeti.airyV : ℕ → ℝ`. The multiplier of DLMF 9.7.3 is
  `χ(x) = π^{1/2} Γ(x/2 + 1) / Γ(x/2 + ½)` (`TauCeti.Real.airyChi`).

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

The following are consumed with the hypotheses and conventions stated there.
- The expansion notion `Asymptotics.HasAsymptoticExpansion` along a filter and an asymptotic
  scale ([its Conventions](../AsymptoticExpansions/README.md#conventions)), through which
  Layers 3–6 state their Poincaré expansions, and the integration of expansions
  ([§1.5](../AsymptoticExpansions/README.md#15-integration-and-differentiation)), for 4.5 and the
  integrated expansions of 6.6 and 7.3.
- The inversion of `f(x) ∼ x`, successive resubstitution and Lagrange's reversion
  ([Layer 2](../AsymptoticExpansions/README.md#layer-2-transcendental-equations)), for the zero
  expansions of 5.4.
- Integration by parts and the Fourier integrals at the endpoints
  ([§3.1](../AsymptoticExpansions/README.md#31-integration-by-parts),
  [§3.2](../AsymptoticExpansions/README.md#32-fourier-integrals-at-the-endpoints)), for the
  oscillatory integrals of 2.2 and 7.3.
- Watson's lemma in a sector and the rotation of the path
  ([§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector),
  [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path)): the integrals along rotated
  rays, written in logarithmic coordinates, are holomorphic, agree on overlapping strips and have
  the expansion of Watson's lemma in each closed substrip. 3.2 applies them to the Laplace form
  2.4 of `Ai`, 6.6 to the Laplace integral 9.12.20 of `Hi`, and 9.3 to the integral
  representation of `A_n`.
- The line shift with simple poles and its iteration
  ([§8.2](../AsymptoticExpansions/README.md#82-shifting-the-line)) and the pole-separated bound for
  `Γ` on vertical strips
  ([§8.6](../AsymptoticExpansions/README.md#86-the-gamma-function-on-vertical-strips)), for the
  Mellin–Barnes integral of 6.5 and the residue series of 9.3.
- Ordinary points ([§10.2](../AsymptoticExpansions/README.md#102-ordinary-points)): for entire
  coefficients the initial-value problem has a unique entire solution. 1.2 applies it to Airy's
  equation, 6.1 to the inhomogeneous equations, after subtracting a particular solution, and 9.1
  to the generalized Airy equation.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- The incomplete Gamma function on the logarithmic plane,
  `TauCeti.Complex.upperIncompleteGammaLog a w`: `Γ(a, e^w)` continued from the positive axis,
  holomorphic in `w` and equal to `Γ(a, e^w)` for `|Im w| < π`
  ([its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions) and
  [§1.5](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#15-continuation)). 7.5 uses it for
  9.10.15–9.10.16 with complex `p`.

### From Tau Ceti

- **Regularized hypergeometric series.**
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean)
  gives the `HasSum` form of `𝐅` and `𝐌`, with absolute convergence, since `a.card ≤ b.card`.
- **Real incomplete Gamma.** `TauCeti.regularizedGamma s x = γ(s, x)/Γ(s)` for `s > 0`
  (`TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`, owned by StandardDistributions);
  the upper function is `Γ(s, x)/Γ(s) = 1 − regularizedGamma s x`. 7.5 uses it for
  9.10.15–9.10.16 with real `p > 0`.
- **Modified Bessel function.** `Real.besselI`, `Real.besselI_eq_rpow_mul` and
  `Real.hasSum_besselI` (`TauCeti/Analysis/SpecialFunctions/BesselI.lean`), for the `I` forms of
  1.7 and 9.2.
- **Wronskians.** `TauCeti.wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean`),
  for the real Wronskians of Layer 4.
- **Rouché's theorem.** `TauCeti.rouche` and `TauCeti.rouche_exists_eq_zero_iff`
  (`TauCeti/Analysis/Complex/Conformal/Rouche.lean`), for counting complex zeros near their
  asymptotic positions in 5.3.

### From Mathlib

- **Regularized hypergeometric series.** `Complex.regularizedHGFun`,
  `Complex.regularizedHGFunCoeff`, `Complex.regularizedHGFun_zero`,
  `Complex.analyticOnNhd_regularizedHGFun_of_card_le` and `Complex.regularizedHGFunCoeff_add_one`
  ([`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.html)).
- **Bessel function.** `Complex.besselJ`, `Complex.besselJ_def` and
  `Complex.analyticOnNhd_besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean`), for 1.7, 8.3
  and 9.2–9.4.
- **Mellin inversion.** `mellin`, `mellinInv` and `mellinInv_mellin_eq`, for 9.3.
- **Gamma.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_mul_Gamma_one_sub`
  (reflection), `Complex.Gamma_mul_Gamma_add_half` (duplication), `Complex.Gamma_eq_integral`,
  `Complex.betaIntegral` with `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
  `integral_rpow_mul_exp_neg_rpow` (`∫₀^∞ x^q e^{−x^p} dx = Γ((q + 1)/p)/p`), `Complex.digamma`
  and `Real.eulerMascheroniConstant`.
- **Holomorphic functions.** `Differentiable`, `AnalyticOnNhd`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, the Cauchy integral formula and
  `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` for contour deformation.
- **Integration.** `MeasureTheory.integral` on `Set.Ioi`, `intervalIntegral`, Fubini
  (`MeasureTheory.integral_integral_swap`) and parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, `Bornology.cobounded`,
  `Complex.arg` and `Complex.cpow`.

## How to read the build

Layer 1 is algebraic: the series definitions give the equation, the initial values and, through
the uniqueness theorem of AsymptoticExpansions §10.2, every identity between solutions of Airy's
equation, which is checked by comparing values and derivatives at `0`. Layer 2 proves the
integral representations, each by showing that the integral solves Airy's equation with the right
initial values. 1.7 rewrites the series of 1.1 through `J_ν`, `I_ν` and Kummer's function.
Layer 3 obtains 9.7.5–9.7.6 from the Laplace form 2.4 by Watson's lemma along
rotated rays, and the other sectors from the connection formulas of 1.4. Layer 4 builds the
modulus and phase on the real line and their expansions from 3.4; Layer 5 locates the zeros by the
phase and inverts the phase expansions. Layer 6 builds the Scorer functions from their Laplace
integral and the inhomogeneous equations. Layer 7 uses Layers 1–6 for the integrals, and Layer 8
uses the third-order equation satisfied by products. Layer 9 repeats the pattern of Layers 1–3
for the equation `w″ = zⁿ w`, and builds Reid's contour integrals as Layer 2 builds those of
`Ai`. The `### Examples` of each layer are
statements to prove, and they test the conventions on explicit values.

## Layer 1: definitions, Airy's equation and connection formulas

### 1.1 Definitions and Maclaurin series

`Ai` and `Bi` as pinned. They are entire (`differentiable_airyAi`, `differentiable_airyBi`), and
the Maclaurin series DLMF 9.4.1–9.4.4 hold as `HasSum` statements for every `z`
(`hasSum_airyAi`):
- `Ai(z) = Ai(0) ∑ₖ 3^k (⅓)_k z^{3k}/(3k)! + Ai′(0) ∑ₖ 3^k (⅔)_k z^{3k+1}/(3k + 1)!` (9.4.1);
- `Ai′(z) = Ai′(0) ∑ₖ 3^k (⅔)_k z^{3k}/(3k)! + Ai(0) ∑ₖ 3^k (4/3)_k z^{3k+2}/(3k + 2)!` (9.4.2);
- 9.4.3–9.4.4, the same with `Bi(0)`, `Bi′(0)` in place of `Ai(0)`, `Ai′(0)`.

Here `(c)_k` is `ascPochhammer ℂ k` evaluated at `c`. The derivative is
`deriv airyAi z = −3^{−1/3} 𝐅(⅓, z³/9) + 3^{−2/3} (z²/3) 𝐅(5/3, z³/9)`, and similarly for `Bi`.

**Checks.**
- `airyAi 0 = 3^{−2/3}/Γ(⅔)`, `deriv airyAi 0 = −3^{−1/3}/Γ(⅓)`, `airyBi 0 = 3^{−1/6}/Γ(⅔)`
  and `deriv airyBi 0 = 3^{1/6}/Γ(⅓)` (DLMF 9.2.3–9.2.6; `airyAi_zero`, `deriv_airyAi_zero`,
  `airyBi_zero`, `deriv_airyBi_zero`). They fix the four powers of `3` in the pinned forms.
- `Bi(0) = √3 Ai(0)` and `Bi′(0) = −√3 Ai′(0)`.

*Needs:* Tau Ceti `Complex.hasSum_regularizedHGFun`; Mathlib `Complex.Gamma_add_one`,
`ascPochhammer` and the triplication of factorials `(3k)! = 3^{3k} k! (⅓)_k (⅔)_k`.

### 1.2 Airy's equation and uniqueness

DLMF 9.2.1: `deriv^[2] airyAi z = z * airyAi z` and the same for `Bi` (`airyAi_ode`,
`airyBi_ode`), from the coefficient recurrence of the series. Every entire `w` with
`deriv^[2] w = z w` is `w = c₁ Ai + c₂ Bi`, with
`c₁ = π (w(0) Bi′(0) − w′(0) Bi(0))` and `c₂ = π (w′(0) Ai(0) − w(0) Ai′(0))`
(`eq_airy_combination`); two entire solutions with the same value and derivative at one point are
equal.

*Needs:* 1.1; AsymptoticExpansions §10.2.

### 1.3 Wronskians and rotations

DLMF 9.2.2 and 9.2.7–9.2.9. Let `ω = e^{2πi/3}`.
- For every cube root of unity `ε`, `z ↦ Ai(εz)` and `z ↦ Bi(εz)` solve Airy's equation (9.2.2).
- `𝒲{Ai, Bi} = Ai Bi′ − Ai′ Bi = 1/π` (9.2.7; `wronskian_airyAi_airyBi`).
- `𝒲{Ai(z), Ai(z ω^{∓1})} = e^{±πi/6}/(2π)` (9.2.8), and
  `𝒲{Ai(z ω^{−1}), Ai(z ω)} = 1/(2πi)` (9.2.9), the Wronskians of the composite functions.

*Needs:* 1.1–1.2; the derivative of a constant Wronskian.

### 1.4 Connection formulas

DLMF 9.2.10–9.2.15, for every `z`:
- `Bi(z) = e^{−πi/6} Ai(z ω^{−1}) + e^{πi/6} Ai(z ω)` (9.2.10;
  `airyBi_eq_airyAi_rotations`);
- `Ai(z ω^{∓1}) = ½ e^{∓πi/3} (Ai(z) ± i Bi(z))` (9.2.11);
- `Ai(z) + ω^{−1} Ai(z ω^{−1}) + ω Ai(z ω) = 0` and the same for `Bi` (9.2.12–9.2.13);
- `Ai(−z) = e^{πi/3} Ai(z e^{πi/3}) + e^{−πi/3} Ai(z e^{−πi/3})` (9.2.14);
- `Bi(−z) = e^{−πi/6} Ai(z e^{πi/3}) + e^{πi/6} Ai(z e^{−πi/3})` (9.2.15).

The proof route for 9.2.10–9.2.13 is 1.2: each side solves Airy's equation, and the values and
derivatives at `0` agree by 1.1. The functions in 9.2.14–9.2.15 solve `w″ = −z w`, not Airy's
equation, so 1.2 does not apply to them directly; 9.2.14 is 9.2.12 at `−z`, since
`−ω^{∓1} = e^{±πi/3}`, and 9.2.15 is 9.2.10 at `−z`.

*Needs:* 1.1–1.3.

### 1.5 The Riccati form

DLMF 9.2.16. If `w` is an entire solution of Airy's equation and `w(z) ≠ 0`, then `W = w′/w`
has derivative `z − W(z)²` at `z`.

*Needs:* 1.2.

### 1.6 Symmetry and the real line

For every `z`, `Ai(z̄) = conj Ai(z)` and `Bi(z̄) = conj Bi(z)`; so `Ai`, `Bi`, `Ai′`, `Bi′` are
real on `ℝ`, and `TauCeti.Real.airyAi x` is `airyAi x` with
`HasDerivAt Real.airyAi (deriv airyAi x).re x` (`ofReal_real_airyAi`, and likewise for `Bi`).
On `[0, ∞)`, `Bi > 0` and `Bi′ > 0`, and `Bi(x) → ∞` as `x → ∞`, since the series of 1.1 for
`Bi` and `Bi′` have positive coefficients.

*Needs:* 1.1–1.4.

### 1.7 Relations to Bessel and Kummer functions

DLMF 9.6.1, 9.6.6–9.6.14, 9.6.25–9.6.26 and the `I` forms of 9.6.2–9.6.5, with `J_ν`, `I_ν` and
`₁F₁` as in the Conventions:
- for `z ≠ 0` with `|ph z| < 2π/3` and `ζ = (2/3) z^{3/2}` (9.6.6–9.6.9;
  `airyAi_neg_eq_besselJ`):
  `Ai(−z) = (√z/3)(J_{1/3}(ζ) + J_{−1/3}(ζ))`, `Ai′(−z) = (z/3)(J_{2/3}(ζ) − J_{−2/3}(ζ))`,
  `Bi(−z) = √(z/3)(J_{−1/3}(ζ) − J_{1/3}(ζ))` and `Bi′(−z) = (z/√3)(J_{−2/3}(ζ) + J_{2/3}(ζ))`,
  where `Ai′(−z)` is `deriv airyAi (−z)`;
- for `ζ ≠ 0` in the slit plane, with `z = (3ζ/2)^{2/3}` (9.6.10–9.6.12):
  `J_{±1/3}(ζ) = ½ √(3/z) (√3 Ai(−z) ∓ Bi(−z))` and
  `J_{±2/3}(ζ) = ½ (√3/z) (±√3 Ai′(−z) + Bi′(−z))`;
- for real `x > 0` with `ζ = (2/3) x^{3/2}`, the `I` forms of 9.6.2–9.6.5:
  `Ai(x) = (√x/3)(I_{−1/3}(ζ) − I_{1/3}(ζ))`, `Ai′(x) = (x/3)(I_{2/3}(ζ) − I_{−2/3}(ζ))`,
  `Bi(x) = √(x/3)(I_{1/3}(ζ) + I_{−1/3}(ζ))` and `Bi′(x) = (x/√3)(I_{2/3}(ζ) + I_{−2/3}(ζ))`;
  and for real `ζ > 0` with `x = (3ζ/2)^{2/3}` (9.6.13–9.6.14):
  `I_{±1/3}(ζ) = ½ √(3/x) (∓√3 Ai(x) + Bi(x))` and
  `I_{±2/3}(ζ) = ½ (√3/x) (±√3 Ai′(x) + Bi′(x))`;
- for every `z`, with `ζ = (2/3) z^{3/2}` and with `ζ^{2/3}`, `ζ^{4/3}` read as `(2/3)^{2/3} z`
  and `(2/3)^{4/3} z²` (9.6.25–9.6.26; `airyBi_eq_kummer`):

```text
Bi(z)  = e^{−ζ} ₁F₁(1/6; 1/3; 2ζ) / (3^{1/6} Γ(⅔))
         + 3^{5/6} ζ^{2/3} e^{−ζ} ₁F₁(5/6; 5/3; 2ζ) / (2^{2/3} Γ(⅓))
Bi′(z) = 3^{1/6} e^{−ζ} ₁F₁(−1/6; −1/3; 2ζ) / Γ(⅓)
         + 3^{7/6} ζ^{4/3} e^{−ζ} ₁F₁(7/6; 7/3; 2ζ) / (2^{7/3} Γ(⅔))
```

The restriction `|ph z| < 2π/3` makes `(ζ/2)^{±1/3} = 3^{∓1/3} z^{±1/2}` with principal powers,
so that `√z J_{±1/3}(ζ)` and `z J_{±2/3}(ζ)` are the series of 1.1 at `−z`; the `I` forms are the
same computation with `Real.besselI_eq_rpow_mul`, and 9.6.11–9.6.14 follow by solving the
`2 × 2` systems with the Wronskian 9.2.7. For 9.6.25–9.6.26, Kummer's second transformation
`e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)`, for complex `a` with
`2a ∉ {0, −1, −2, …}`, is an owned auxiliary result (`exp_neg_mul_kummer_two_mul`): both sides
are entire in `x` and solve `x f″ + 2a f′ − x f = 0`, the left side by Kummer's equation for `𝐌`,
which follows from `Complex.regularizedHGFunCoeff_add_one`, and that equation determines the
Taylor coefficients of an entire solution from `f(0)`. It is applied at `x = ζ`, with
`a = 1/6, 5/6, −1/6, 7/6`, where `ζ²/4 = z³/9`.

*Needs:* 1.1, 1.3; Mathlib `Complex.besselJ_def`; Tau Ceti `Real.besselI_eq_rpow_mul`.

### Examples

- From 1.2, the solution with `w(0) = 1`, `w′(0) = 0` is
  `π (Bi′(0) Ai − Ai′(0) Bi) = Γ(⅔) 𝐅(⅔, z³/9)`, by the reflection formula.
- 9.2.14 at `z = 0` reads `Ai(0) = 2 cos(π/3) Ai(0)`.
- From 1.1, `Ai(z) + Bi(z)/√3 = 2 · 3^{−2/3} 𝐅(⅔, z³/9)`; it depends on `z³` only, so it is
  invariant under `z ↦ ωz`.

### Dependencies

Mathlib's regularized hypergeometric series, Gamma and Bessel API; Tau Ceti's
`Complex.hasSum_regularizedHGFun` and `Real.besselI`; AsymptoticExpansions §10.2.

## Layer 2: integral representations

### 2.1 Contour integrals

DLMF 9.5.4–9.5.5, with the contours written as rays from `0`. Let `f_z(t) = exp(t³/3 − z t)`.
For every `z`:

```text
Ai(z) = (2πi)⁻¹ ( ∫₀^∞ e^{πi/3} f_z(r e^{πi/3}) dr − ∫₀^∞ e^{−πi/3} f_z(r e^{−πi/3}) dr )
Bi(z) = (2π)⁻¹ ( 2 ∫_{−∞}^0 f_z(r) dr + ∫₀^∞ e^{πi/3} f_z(r e^{πi/3}) dr
                 + ∫₀^∞ e^{−πi/3} f_z(r e^{−πi/3}) dr )
```

(`airyAi_eq_ray_integral`, `airyBi_eq_ray_integral`). All integrals converge absolutely, since
`(r e^{±πi/3})³ = −r³`; each side is entire in `z` and solves Airy's equation by differentiation
under the integral and integration by parts, and the values at `0` are Gamma integrals. The
contours may be rotated within `|ph t ∓ π/3| < π/6` by Cauchy's theorem.

*Needs:* 1.2; Mathlib parametric differentiation, `integral_rpow_mul_exp_neg_rpow` and contour
deformation.

### 2.2 Real integrals

DLMF 9.5.1–9.5.3. For real `x`, as improper integrals (`airyAi_cos_integral`):
- `Ai(x) = π⁻¹ ∫₀^∞ cos(t³/3 + x t) dt` (9.5.1);
- `Ai(−x) = (√x/π) ∫_{−1}^∞ cos(x^{3/2}(t³/3 + t² − ⅔)) dt` for `x > 0` (9.5.2);
- `Bi(x) = π⁻¹ ∫₀^∞ (exp(−t³/3 + x t) + sin(t³/3 + x t)) dt` (9.5.3), the first integral
  absolutely convergent.

The oscillatory improper integrals converge locally uniformly in `x`, by integration by parts
against `(t² + x)⁻¹`; this is an owned auxiliary result. The proof route is the limit of 2.1 as
the rays rotate onto the imaginary axis, `t = ±i s`, with Jordan-type estimates on the connecting
arcs.

*Needs:* 2.1; AsymptoticExpansions §3.1.

### 2.3 Integrals with positive integrands

DLMF 9.5.6–9.5.7:
- `Ai(z) = (√3/(2π)) ∫₀^∞ exp(−t³/3 − z³/(3t³)) dt` for `|ph z| < π/6` (9.5.6);
- `Ai(z) = (e^{−ζ}/π) ∫₀^∞ exp(−z^{1/2} t²) cos(t³/3) dt` for `|ph z| < π` (9.5.7).

Both integrals converge absolutely in the stated sectors and are holomorphic there; the proof
route is to establish them for `z > 0` by the substitutions of DLMF §9.5 in 2.1 and to continue by
the identity theorem. Consequences of 9.5.6 on `[0, ∞)`: `Ai(x) > 0`, `Ai′(x) < 0`,
`Ai(x) → 0` as `x → ∞` (dominated convergence), and `∫₀^∞ Ai = ⅓` (Fubini, with
`∫₀^∞ exp(−x³/(3t³)) dx = 3^{1/3} Γ(4/3) t` and the reflection formula).

*Needs:* 2.1; Mathlib identity theorem, Fubini and `integral_rpow_mul_exp_neg_rpow`.

### 2.4 The Laplace form

DLMF 9.5.8. For `|ph z| < 2π/3`, `z ≠ 0`, with `ζ = (2/3) z^{3/2}`:

```text
Ai(z) = e^{−ζ} ζ^{−1/6} / (√π 48^{1/6} Γ(5/6)) · ∫₀^∞ e^{−t} t^{−1/6} (2 + t/ζ)^{−1/6} dt
```

(`airyAi_laplace_integral`), and

```text
Ai′(z) = −z (2ζ)^{−2/3} e^{−ζ} / (√(3π) Γ(7/6)) · ∫₀^∞ e^{−t} t^{1/6} (2ζ + t)^{1/6} dt
```

(`deriv_airyAi_laplace_integral`). The integrals converge absolutely, and the powers are
principal: `2 + t/ζ` and `2ζ + t` lie in the slit plane, since `|ph ζ| < π`. The proof route is
the substitution of DLMF §9.5(ii) in 2.1 for `z > 0`, followed by the identity theorem; the
second formula is proved in the same way from the ray integral of `−t f_z(t)`, which is `Ai′`.

*Needs:* 2.1, 2.3; Mathlib `Complex.Gamma_eq_integral`.

### Examples

- 9.5.6 at `z = 0` reads `Ai(0) = (√3/(2π)) · 3^{−2/3} Γ(⅓)`, which is DLMF 9.2.3 by the
  reflection formula `Γ(⅓) Γ(⅔) = 2π/√3`.
- 9.5.8 at `z = 1`: the prefactor is `e^{−2/3} (2/3)^{−1/6}/(√π 48^{1/6} Γ(5/6))`.

### Dependencies

Layer 1; Mathlib integration, parametric differentiation, contour deformation and Gamma
integrals; AsymptoticExpansions §3.1.

## Layer 3: asymptotic expansions

Throughout, `ζ = (2/3) z^{3/2}` and `0 < δ`. The filters are the sector filters of the
Conventions.

### 3.1 Coefficients

DLMF 9.7.1–9.7.4. `u_k` and `v_k` as pinned, with the recurrence
`u_{k+1} = (6k + 1)(6k + 3)(6k + 5) / ((2k + 1) · 216 · (k + 1)) · u_k`
(`airyU_succ`). `χ` as pinned, with `χ(1) = π/2`, `χ(2) = 2`, `χ` increasing on `(0, ∞)`, and
`χ(x) ∼ (πx/2)^{1/2}` as `x → ∞` (9.7.4).

*Needs:* Mathlib `Real.Gamma`, `Real.Gamma_add_one`, and the log-convexity
`Real.convexOn_log_Gamma`, which gives Gautschi's bounds for `Γ(x + 1)/Γ(x + ½)` and so 9.7.4.

### 3.2 The principal sector

DLMF 9.7.5–9.7.6. For `δ ∈ (0, π)` and every `N`, as `z → ∞` in `|ph z| ≤ π − δ`
(`isBigO_airyAi_sub_sum`, `isBigO_deriv_airyAi_sub_sum`):

```text
Ai(z) − e^{−ζ}/(2√π z^{1/4}) ∑_{k<N} (−1)^k u_k ζ^{−k}   = O(|e^{−ζ} z^{−1/4}| |ζ|^{−N})
Ai′(z) + z^{1/4} e^{−ζ}/(2√π) ∑_{k<N} (−1)^k v_k ζ^{−k} = O(|e^{−ζ} z^{1/4}| |ζ|^{−N})
```

The proof route is Watson's lemma (AsymptoticExpansions §4.2) for the two Laplace forms of 2.4,
whose amplitudes `(2 + t/ζ)^{−1/6}` and `(2ζ + t)^{1/6}` have binomial expansions in `t/ζ`; the
coefficients are `u_k` and `v_k` by the Gamma duplication formula. This gives `|ph ζ| ≤ π/2 − δ`,
and the rotation of the path (§4.3), in the logarithmic coordinate `Lζ` of the Conventions,
extends it to `|Im Lζ| ≤ 3π/2 − δ`, that is `|ph z| ≤ π − (2/3)δ`. Beyond `|ph z| = 2π/3` the
lifted phase of `ζ` differs from `arg ζ`; the statements depend only on the value of `ζ`.

*Needs:* 2.4, 3.1; AsymptoticExpansions §§4.2–4.3; Mathlib `Complex.Gamma_mul_Gamma_add_half`.

### 3.3 The functions `Bi`, `Bi′`

DLMF 9.7.7–9.7.8. For `δ ∈ (0, π/3)` and every `N`, as `z → ∞` in `|ph z| ≤ π/3 − δ`:

```text
Bi(z) − e^{ζ}/(√π z^{1/4}) ∑_{k<N} u_k ζ^{−k}   = O(|e^{ζ} z^{−1/4}| |ζ|^{−N})
Bi′(z) − z^{1/4} e^{ζ}/√π ∑_{k<N} v_k ζ^{−k}    = O(|e^{ζ} z^{1/4}| |ζ|^{−N})
```

(`isBigO_airyBi_sub_sum`), from 9.2.10 and 3.2 applied at `z e^{∓2πi/3}`. Both terms contribute
at leading order: for `|ph z| ≤ π/3 − δ` both points lie in `|ph| ≤ π − δ`, the value of `ζ` there
is `−ζ` and `(z e^{∓2πi/3})^{1/4} = e^{∓πi/6} z^{1/4}`, so `e^{∓πi/6} Ai(z e^{∓2πi/3})` has the
expansion `e^{ζ}/(2√π z^{1/4}) ∑ u_k ζ^{−k}`, and the two halves add.

*Needs:* 1.4, 3.2.

### 3.4 Oscillatory and rotated expansions

DLMF 9.7.9–9.7.14. For `δ ∈ (0, 2π/3)`, write
`P_N(z) = ∑_{k<N} (−1)^k u_{2k} ζ^{−2k}`, `Q_M(z) = ∑_{k<M} (−1)^k u_{2k+1} ζ^{−2k−1}`, and
`P′_N`, `Q′_M` for the same sums with `v` in place of `u`. For every `N`, `M`, as `z → ∞` in
`|ph z| ≤ 2π/3 − δ`, each of the following differences is
`O(|z^{∓1/4}| e^{|Im ζ|} (|ζ|^{−2N} + |ζ|^{−2M−1}))`, with `z^{−1/4}` for the functions and
`z^{1/4}` for the derivatives (`isBigO_airyAi_neg_sub_osc`):
- `Ai(−z) − (√π z^{1/4})⁻¹ (cos(ζ − π/4) P_N + sin(ζ − π/4) Q_M)` (9.7.9);
- `Ai′(−z) − (z^{1/4}/√π) (sin(ζ − π/4) P′_N − cos(ζ − π/4) Q′_M)` (9.7.10);
- `Bi(−z) − (√π z^{1/4})⁻¹ (−sin(ζ − π/4) P_N + cos(ζ − π/4) Q_M)` (9.7.11);
- `Bi′(−z) − (z^{1/4}/√π) (cos(ζ − π/4) P′_N + sin(ζ − π/4) Q′_M)` (9.7.12).

Here `Ai′(−z)` is `deriv airyAi (−z)`. With `ε = ±1` and `ϑ = ζ − π/4 − ε (i/2) ln 2`, in the
same sector and with the same error:
- `Bi(z e^{επi/3}) − √(2/π) e^{επi/6} z^{−1/4} (cos ϑ P_N + sin ϑ Q_M)` (9.7.13);
- `Bi′(z e^{επi/3}) − √(2/π) e^{−επi/6} z^{1/4} (−sin ϑ P′_N + cos ϑ Q′_M)` (9.7.14).

The proof route is the connection formulas 9.2.14–9.2.15 and 9.2.11, with 3.2 at `z e^{±πi/3}`.

*Needs:* 1.4, 3.2.

### 3.5 Error bounds and exact remainders

DLMF §§9.7(iii)–(iv), 9.7.15–9.7.19. For `z` in the slit plane and `n : ℕ`, the remainders
`R_n(z)`, `S_n(z)` are defined by (9.7.18–9.7.19; `airyRemainderAi`, `airyRemainderAiDeriv`)

```text
Ai(z)  =  e^{−ζ}/(2√π z^{1/4}) (∑_{k<n} (−1)^k u_k ζ^{−k} + R_n(z))
Ai′(z) = −z^{1/4} e^{−ζ}/(2√π) (∑_{k<n} (−1)^k v_k ζ^{−k} + S_n(z))
```

Let `m_n(σ, z)` be `1` for `|ph z| ≤ π/3`; `min(|csc(ph ζ)|, χ(n + σ) + 1)` for
`π/3 < |ph z| < 2π/3`; `χ(n + σ) + 1` for `|ph z| = 2π/3`; and
`(2π(n + σ))^{1/2} / |cos(ph ζ)|^{n+σ} + χ(n + σ) + 1` for `2π/3 < |ph z| < π`, where
`ph ζ = (3/2) ph z` is the lifted phase. Then (9.7.17; `norm_airyRemainderAi_le`):
- `|R_n(z)| ≤ m_n(1/6, z) u_n |ζ|^{−n}` for every `n`;
- `|S_n(z)| ≤ m_n(0, z) |v_n| |ζ|^{−n}` for `n ≥ 1`.

On the positive real axis, for `x > 0` with `ζ = (2/3) x^{3/2}` (DLMF §9.7(iii)):
- for `n ≥ 0`, `R_n(x) = ϑ (−1)^n u_n ζ^{−n}`, and for `n ≥ 1`, `S_n(x) = ϑ′ (−1)^n v_n ζ^{−n}`,
  with `ϑ, ϑ′ ∈ [0, 1]`: the error is bounded by the first neglected term and has its sign
  (`airyRemainderAi_real_eq`);
- for `n ≥ 0`, `|Bi(x) − e^{ζ}/(√π x^{1/4}) ∑_{k<n} u_k ζ^{−k}|
  ≤ e^{ζ}/(√π x^{1/4}) (χ(n + 1/6) + 1) u_n ζ^{−n}`, and for `n ≥ 1` the same for `Bi′` with
  `x^{1/4}` in place of `x^{−1/4}`, `v_k` in place of `u_k`, `|v_n|` and `χ(n)`;
- `Ai(x) ≤ e^{−ζ}/(2√π x^{1/4})` and `|Ai′(x)| ≤ x^{1/4} e^{−ζ}/(2√π) (1 + 7/(72ζ))` (9.7.15);
- `Bi(x) ≤ e^{ζ}/(√π x^{1/4}) (1 + (χ(7/6) + 1) · 5/(72ζ))` and
  `Bi′(x) ≤ x^{1/4} e^{ζ}/√π (1 + (π/2 + 1) · 7/(72ζ))` (9.7.16).

On the negative real axis, define real functions `p`, `q`, `p̃`, `q̃` on `(0, ∞)` by

```text
Ai(−x)  + i Bi(−x)  =     π^{−1/2} x^{−1/4} e^{−i(ζ − π/4)} (p(x) + i q(x))
Ai′(−x) + i Bi′(−x) = i π^{−1/2} x^{1/4}  e^{−i(ζ − π/4)} (p̃(x) + i q̃(x))
```

so that 9.7.9–9.7.12 are the expansions of `p`, `q` by the sums `P_N`, `Q_M` of 3.4 and of `p̃`,
`q̃` by `P′_N`, `Q′_M`. Then `p − P_N` and `q − Q_M` for `N, M ≥ 0`, `p̃ − P′_N` for `N ≥ 1`, and
`q̃ − Q′_M` for `M ≥ 0` are each `ϑ` times the first neglected term, with `ϑ ∈ [0, 1]`. These are
the orders at which the following term has the opposite sign; for `p̃` at `N = 0` the first two
terms are both positive. DLMF's remark that bounds for 9.7.7–9.7.14 at complex `z` follow from
9.7.17 and §9.2(v) states no further inequality; the inequalities above are the targets.

The proof route is the Laplace forms of 2.4. On `ph z = 0` the remainder of the binomial
expansion of `(1 + w)^{∓1/6}` for `w > 0` has the sign of its first neglected term and is bounded
by it, which gives the `R_n`, `S_n` cases on the positive axis. The complex bounds and the
oscillatory cases follow Nemes (2017b, (26) and Propositions B.1, B.3, B.4), who proves them for
the Hankel expansions of orders `⅓` and `⅔`; those Hankel integrals are the Laplace forms of 2.4
after rotation of the path, so no Bessel function enters. The bounds for the binomial remainder on
rays `w = t/(2ζ)`, `t > 0`, are an owned auxiliary result. The `Bi` cases and `p`, `q`, `p̃`, `q̃`
follow through 9.2.10–9.2.11, as 9.7.16 follows from 9.2.10 and 9.7.17 on `|ph z| = 2π/3`.

*Needs:* 2.4, 3.1–3.4.

### 3.6 Consequences on the real line

- **Recessive solution.** If `w : ℝ → ℝ` is twice differentiable with `w″ = x w` and
  `w(x) → 0` as `x → ∞`, then `w = w(0) Ai(0)⁻¹ Ai` on `ℝ` (`eq_smul_real_airyAi`).
- **Tail bound.** For `x > 0`, `−Ai′(x) > √x Ai(x)`; hence `x ↦ e^{(2/3)x^{3/2}} Ai(x)` is
  decreasing on `[0, ∞)` and `0 < Ai(x) ≤ Ai(0) e^{−(2/3)x^{3/2}}` for `x ≥ 0`. The proof route
  is the Riccati equation 1.5 for `W = Ai′/Ai`: `h = W + √x` satisfies
  `h′ = −(W − √x) h + 1/(2√x)`, so `h` crosses `0` only upwards, and `h(x) < 0` for large `x`
  by 3.2 with `N = 2`.
- **Zeros of `Ai` and `Ai′`.** All zeros of `Ai` and of `Ai′` are real and negative. The proof
  route: for a zero `z₀` of `w = Ai` or of `w′`, integrate `w̄ w″ = z |w|²` along the horizontal
  ray from `z₀` to `z₀ + ∞`, where `w` and `w′` decay by 3.2; the imaginary part gives
  `Im z₀ ∫ |w|² = 0`, and 2.3 excludes `[0, ∞)`.

*Needs:* 1.2, 1.5, 2.3, 3.2.

### Examples

- 3.1: `u₂ = 385/10368` and `v₂ = −455/10368`.
- 3.2 with `N = 1` at `z = x → +∞`: `Ai(x) · 2√π x^{1/4} e^{ζ} → 1`.
- 3.5 at `n = 0`: `m₀(1/6, z) = 1` for `|ph z| ≤ π/3`, so `|R₀(z)| ≤ 1`, that is
  `|Ai(z)| ≤ |e^{−ζ}/(2√π z^{1/4})|` there.

### Dependencies

Layers 1–2; AsymptoticExpansions §§4.2–4.3; Mathlib Gamma and binomial series.

## Layer 4: modulus and phase

### 4.1 Definitions and derivatives

`M`, `N`, `θ`, `φ` as pinned. `M > 0` and `N > 0` everywhere, since `Ai`, `Bi` have no common
zero and neither have `Ai′`, `Bi′` (Wronskian 9.2.7). `θ` and `φ` are differentiable with
(9.8.14; `airy_modulus_phase_deriv`)

```text
M² θ′ = −1/π            N² φ′ = x/π            N N′ = x M M′
```

so `θ` is strictly decreasing on `ℝ`, and `φ` is decreasing on `(−∞, 0]` and increasing on
`[0, ∞)`.

*Needs:* 1.3, 1.6; Mathlib fundamental theorem of calculus.

### 4.2 The modulus–phase forms

DLMF 9.8.1–9.8.2, 9.8.4–9.8.6, 9.8.8. For every real `x` (`real_airyAi_eq_modulus_mul_sin`):
- `Ai(x) = M(x) sin θ(x)`, `Bi(x) = M(x) cos θ(x)`;
- `Ai′(x) = N(x) sin φ(x)`, `Bi′(x) = N(x) cos φ(x)`;
- if `Bi(x) ≠ 0`, there is an integer `m` with `θ(x) = arctan(Ai(x)/Bi(x)) + mπ` (9.8.4), and
  likewise for `φ` with `Ai′`, `Bi′` (9.8.8).

The proof route: `g = Bi + i Ai` satisfies `Im(g′/g) = −𝒲{Ai, Bi}/M² = θ′`, so
`g e^{−iθ}/M` has derivative `0` and equals its value `1` at `0`; the same for `Bi′ + i Ai′` and
`φ`.

*Needs:* 4.1, 1.3.

### 4.3 Identities

DLMF 9.8.13 and 9.8.15–9.8.19, for every real `x`:
- `M N sin(θ − φ) = 1/π` (9.8.13);
- `N² = M′² + M² θ′² = M′² + 1/(π² M²)` (9.8.15) and `x² M² = N′² + N² φ′² = N′² + x²/(π² N²)`
  (9.8.16);
- `tan(θ − φ) = 1/(π M M′) = −M θ′/M′` where `M′(x) ≠ 0` (9.8.17);
- `M″ = x M + 1/(π² M³)`, and `w = M²` satisfies `w‴ − 4x w′ − 2w = 0` (9.8.18), by direct
  differentiation of `Ai² + Bi²` with Airy's equation;
- `θ′² + θ‴/(2θ′) − (3/4)(θ″/θ′)² = −x` (9.8.19).

*Needs:* 1.2, 4.1–4.2.

### 4.4 Behaviour at the ends

`θ(x) → 0` and `φ(x) → 0` as `x → +∞`, with `0 < θ(x) ≤ π/6` and `−π/6 ≤ φ(x) < 0` for
`x ≥ 0`; `θ(x) → +∞` and `φ(x) → +∞` as `x → −∞`. On `x ≥ 0` the values follow from the signs
of 1.6 and 2.3 and from `tan θ = Ai/Bi → 0`, `tan φ = Ai′/Bi′ → 0`. For `x ≤ 0`:

```text
M(x) e^{iθ(x)} = 2 e^{πi/6} Ai(x e^{2πi/3})        N(x) e^{iφ(x)} = 2 e^{5πi/6} Ai′(x e^{2πi/3})
```

by 9.2.11; since `Ai` and `Ai′` have no zeros in the slit plane (3.6), `θ(x) − π/6` is the
continuous argument of `Ai(x e^{2πi/3})` along `x ≤ 0`, measured from the real value at `0`, and
3.2 gives `θ(x) = π/4 + (2/3)(−x)^{3/2} + o(1)` and `φ(x) = −π/4 + (2/3)(−x)^{3/2} + o(1)` as
`x → −∞`. The integer ambiguity is resolved by the holomorphic logarithm of `Ai` on the slit
plane, real on `(0, ∞)`.

*Needs:* 1.4, 1.6, 2.3, 3.2, 3.6, 4.1–4.2.

### 4.5 Expansions

DLMF 9.8.20–9.8.23. Let `a_k = 1·3·5···(6k − 1) / (k! 96^k)` (`a₀ = 1`) and
`b_k = (1 + 6k)/(1 − 6k) · a_k`. Let `r_k`, `s_k` be the coefficients of the formal reciprocals
`(∑ a_k u^k)^{−1}` and `(∑ b_k u^k)^{−1}`, and `c_k = r_k/(1 − 2k)`, `d_k = s_k/(1 − 2k)`. As
`x → −∞`, for every `N ≥ 1` (`airyModulus_sq_expansion`, `airyPhase_expansion`):

```text
M²(x) − (π(−x)^{1/2})⁻¹ ∑_{k<N} a_k x^{−3k}          = O((−x)^{−1/2} |x|^{−3N})
N²(x) − ((−x)^{1/2}/π) ∑_{k<N} b_k x^{−3k}           = O((−x)^{1/2} |x|^{−3N})
θ(x) − π/4 − (2/3)(−x)^{3/2} ∑_{k<N} c_k x^{−3k}     = O((−x)^{3/2} |x|^{−3N})
φ(x) + π/4 − (2/3)(−x)^{3/2} ∑_{k<N} d_k x^{−3k}     = O((−x)^{3/2} |x|^{−3N})
```

The proof route: 9.8.20–9.8.21 from 3.4 at `z = −x > 0`, in which the squares of sine and cosine
combine to `1` and the cross terms cancel; then 9.8.22–9.8.23 by integrating
`θ′ = −1/(πM²)` and `φ′ = x/(πN²)` termwise (AsymptoticExpansions §1.5), the constants `±π/4`
coming from 4.4.

**Checks.**
- `a₁ = 5/32`, `a₂ = 1155/2048`; `b₁ = −7/32`, `b₂ = −1365/2048`.
- `c₁ = 5/32`, `c₂ = 1105/6144`, `c₃ = 82825/65536`, `c₄ = 1282031525/58720256`, the printed
  coefficients of 9.8.22.
- `d₁ = −7/32`, `d₂ = −1463/6144`, `d₃ = −495271/327680`, `d₄ = −206530429/8388608`, the printed
  coefficients of 9.8.23.

*Needs:* 3.4, 4.1, 4.4; AsymptoticExpansions §1.5.

### Examples

- `M(0) = 2 Ai(0)`, `N(0) = −2 Ai′(0)`, `θ(0) = π/6`, `φ(0) = −π/6`, and 9.8.13 at `0` reads
  `4 Ai(0) |Ai′(0)| sin(π/3) = 1/π`, which is the reflection formula `Γ(⅓) Γ(⅔) = 2π/√3`.

### Dependencies

Layers 1–3; Tau Ceti `TauCeti.wronskian_eq_of_hasDerivAt`; AsymptoticExpansions §1.5.

## Layer 5: zeros

### 5.1 Location

DLMF §9.9(i), first part:
- the zeros of `Ai` and `Ai′` are real and negative (3.6);
- the real zeros of `Bi` and `Bi′` are negative (1.6), and their nonreal zeros come in conjugate
  pairs (1.6);
- every zero of `Ai`, `Ai′`, `Bi`, `Bi′` is simple. For `w = Ai` or `Bi`, `w` and `w′` have no
  common zero by 9.2.7; and at a zero `z₀` of `w′`, `w″(z₀) = z₀ w(z₀) ≠ 0`, since `w(z₀) ≠ 0`
  and `z₀ ≠ 0` (`w′(0) ≠ 0` by 1.1).

*Needs:* 1.1, 1.3, 1.6, 3.6.

### 5.2 Real zeros and the phases

DLMF 9.9.1–9.9.5. For `k ≥ 1`: the epsilons defining `a_k`, `a′_k`, `b_k`, `b′_k` are attained
and unique, the sequences are strictly decreasing, and they enumerate all negative zeros
(`airyAiZero_spec`, `airyAiZero_strictAnti`); in particular each of the four functions has
infinitely many negative zeros. Moreover:
- `θ(a_k) = kπ`, `φ(a′_k) = (k − 1)π` (9.9.1); `θ(b_k) = (k − ½)π`, `φ(b′_k) = (k − ½)π`
  (9.9.2) (`airyPhase_airyAiZero`);
- `Ai′(a_k) = (−1)^{k−1}/(π M(a_k))`, `Bi′(b_k) = (−1)^{k−1}/(π M(b_k))` (9.9.3);
- `Ai(a′_k) = (−1)^{k−1}/(π N(a′_k))`, `Bi(b′_k) = (−1)^k/(π N(b′_k))` (9.9.4);
- for real `t ≥ 1/6` let `a(t) ≤ 0` solve `θ(a(t)) = tπ`, and for `t ≥ 5/6` let `a′(t) ≤ 0` solve
  `φ(a′(t)) = (t − 1)π`; these are differentiable for `t > 1/6`, `t > 5/6`, and
  `Ai′(a_k) = (−1)^{k−1} (−(da/dt)(k))^{−1/2}`,
  `Ai(a′_k) = (−1)^{k−1} (a′_k · (da′/dt)(k))^{−1/2}` (9.9.5).

The zeros of `Ai` are the points where `θ ∈ πℤ`, by 4.2, and `θ` is a decreasing bijection of `ℝ`
onto `(0, ∞)` by 4.1 and 4.4; the zeros of `Ai′` are where `φ ∈ πℤ` on `x < 0`, and `φ` is a
decreasing bijection of `(−∞, 0]` onto `[−π/6, ∞)`.

*Needs:* 4.1–4.4.

### 5.3 Complex zeros of `Bi` and `Bi′`

DLMF §9.9(i), second part. The nonreal zeros of `Bi` and `Bi′` lie in `π/3 < |ph z| < π/2`
(`airyBi_eq_zero_mem_sector`), and there are infinitely many in `π/3 < ph z < π/2`. For `k ≥ 1`,
the epsilons defining `β_k` and `β′_k` are attained and unique, `‖β_k‖` and `‖β′_k‖` are
strictly increasing, and they enumerate the zeros of `Bi`, `Bi′` in `π/3 < ph z < π/2`
(`airyBiComplexZero_spec`).

The proof route is the argument principle on truncated sectors, with 3.3–3.4 on the arcs and
rays and 5.2 on the negative axis, to locate and count the zeros, and Rouché's theorem on discs
around the zeros of the leading terms of 9.7.13–9.7.14 at `ε = 1`, where `cos ϑ` and `sin ϑ`
vanish, to place one zero in each disc.

*Needs:* 3.3–3.4, 5.1–5.2; Tau Ceti `TauCeti.rouche` and
`TauCeti.Contour.argumentPrinciple_divisor`.

### 5.4 Asymptotic expansions

DLMF 9.9.6–9.9.21. Let `t_k = (3π/8)(4k − 1)` and `t′_k = (3π/8)(4k − 3)`, and
`τ_k = t_k + (3i/4) ln 2`, `τ′_k = t′_k + (3i/4) ln 2`. Define formal series in `t^{−2}` by
reversion of the phase expansions of 4.5:
- `T(t) = t^{2/3} ∑ T_n t^{−2n}` is the formal solution of
  `T^{3/2} ∑_k (−1)^k c_k T^{−3k} = t`, and `U(t) = t^{2/3} ∑ U_n t^{−2n}` that of
  `U^{3/2} ∑_k (−1)^k d_k U^{−3k} = t`;
- `V(t) = π^{−1/2} t^{1/6} ∑ V_n t^{−2n}` is `π^{−1/2} T^{1/4} (∑_k (−1)^k a_k T^{−3k})^{−1/2}`,
  and `W(t) = π^{−1/2} t^{−1/6} ∑ W_n t^{−2n}` is
  `π^{−1/2} U^{−1/4} (∑_k (−1)^k b_k U^{−3k})^{−1/2}`.

Here `T_n`, `U_n`, `V_n`, `W_n` are rational numbers with `T₀ = U₀ = V₀ = W₀ = 1`. Then, as
`k → ∞` along `ℕ`, each of the following twelve sequences `f_k` with argument `s_k` and exponent
`q` satisfies `f_k s_k^{−q} − ∑_{n<N} C_n s_k^{−2n} = O(|s_k|^{−2N})` for every `N`, with the
coefficient sequence `C` indicated (DLMF 9.9.6–9.9.17; `airyAiZero_expansion` and siblings):

| `f_k` | `s_k` | `q` | `C` |
|---|---|---|---|
| `−a_k` | `t_k` | `2/3` | `T` |
| `(−1)^{k−1} Ai′(a_k)` | `t_k` | `1/6` | `π^{−1/2} V` |
| `−a′_k` | `t′_k` | `2/3` | `U` |
| `(−1)^{k−1} Ai(a′_k)` | `t′_k` | `−1/6` | `π^{−1/2} W` |
| `−b_k` | `t′_k` | `2/3` | `T` |
| `(−1)^{k−1} Bi′(b_k)` | `t′_k` | `1/6` | `π^{−1/2} V` |
| `−b′_k` | `t_k` | `2/3` | `U` |
| `(−1)^k Bi(b′_k)` | `t_k` | `−1/6` | `π^{−1/2} W` |
| `e^{−πi/3} β_k` | `τ_k` | `2/3` | `T` |
| `(−1)^k e^{πi/6} Bi′(β_k)/√2` | `τ_k` | `1/6` | `π^{−1/2} V` |
| `e^{−πi/3} β′_k` | `τ′_k` | `2/3` | `U` |
| `(−1)^{k−1} e^{−πi/6} Bi(β′_k)/√2` | `τ′_k` | `−1/6` | `π^{−1/2} W` |

The complex powers `s_k^{−q}`, `s_k^{−2n}` are principal; `Re τ_k > 0`. The proof route for the
real zeros is AsymptoticExpansions Layer 2 (inversion and reversion) applied to the phase
expansions of 4.5 through 5.2; for the complex zeros, the same reversion applied to the zeros of
the expansions 9.7.13–9.7.14 located in 5.3.

**Checks** (DLMF 9.9.18–9.9.21).
- `T_n`, `n = 1, …, 5`: `5/48`, `−5/36`, `77125/82944`, `−108056875/6967296`,
  `162375596875/334430208`.
- `U_n`: `−7/48`, `35/288`, `−181223/207360`, `18683371/1244160`, `−91145884361/191102976`.
- `V_n`: `5/48`, `−1525/4608`, `2397875/663552`, `−74898940625/891813888`,
  `144198303734375/42807066624`.
- `W_n`: `−7/96`, `1673/6144`, `−84394709/26542080`, `780277135421/10192158720`,
  `−204449051051945/65229815808`.

*Needs:* 4.5, 5.2–5.3; AsymptoticExpansions Layer 2.

### Examples

- `T₁ = 5/48` from `(3/2) T₁ − c₁ = 0` with `c₁ = 5/32`, and `V₁ = T₁/4 + a₁/2 = 5/48`.
- 9.9.3 from 9.8.13: at `a_k`, `sin θ = 0`, so `|sin(θ − φ)| = |sin φ|` and
  `M |Ai′(a_k)| = M N |sin φ| = 1/π`.

### Dependencies

Layers 1, 3 and 4; AsymptoticExpansions Layer 2; Tau Ceti `TauCeti.rouche`.

## Layer 6: Scorer functions

### 6.1 Definitions and equations

`Hi`, `Gi` as pinned; both are entire (`differentiable_scorerHi`). DLMF 9.12.1–9.12.3:
- `Hi″ = z Hi + 1/π` (9.12.1; `scorerHi_ode`), by differentiation under the integral, since
  `(t² − z) e^{−t³/3 + zt} = −∂_t e^{−t³/3 + zt}`;
- `Gi″ = z Gi − 1/π`, and for `ε = ±1`, `z ↦ e^{−2πiε/3} Hi(z e^{−2πiε/3})` solves
  `w″ = z w + 1/π` (9.12.3);
- every entire solution of `w″ = z w + 1/π` is `Hi + c₁ Ai + c₂ Bi` (9.12.2).

*Needs:* 1.2; AsymptoticExpansions §10.2; Mathlib parametric differentiation.

### 6.2 Values at the origin and variation of parameters

DLMF 9.12.4–9.12.7. With `∫₀^z f` the segment integral `∫ s in 0..1, z * f (s * z)`:
- `Gi(z) = Bi(z) (⅓ − ∫₀^z Ai) + Ai(z) ∫₀^z Bi` (9.12.4);
- `Hi(z) = Bi(z) (⅔ + ∫₀^z Ai) − Ai(z) ∫₀^z Bi` (9.12.5);
- `Gi(0) = Hi(0)/2 = Bi(0)/3 = 1/(3^{7/6} Γ(⅔))` (9.12.6; `scorerGi_zero`);
- `Gi′(0) = Hi′(0)/2 = Bi′(0)/3 = 1/(3^{5/6} Γ(⅓))` (9.12.7).

The values of `Hi` at `0` are `π⁻¹ ∫₀^∞ e^{−t³/3} t^j dt` for `j = 0, 1`; the variation formulas
follow from 6.1 and 1.2 by comparing values at `0`.

*Needs:* 6.1, 1.3; Mathlib `integral_rpow_mul_exp_neg_rpow` and the reflection formula.

### 6.3 Connection formulas

DLMF 9.12.11–9.12.14, for every `z` and `ε = ±1`:
- `Gi(z) + Hi(z) = Bi(z)` (9.12.11, definitional);
- `Gi(z) = ½ e^{πi/3} Hi(z e^{−2πi/3}) + ½ e^{−πi/3} Hi(z e^{2πi/3})` (9.12.12);
- `Gi(z) = e^{−επi/3} Hi(z e^{2επi/3}) + iε Ai(z)` (9.12.13);
- `Hi(z) = e^{2επi/3} Hi(z e^{2επi/3}) + 2 e^{−επi/6} Ai(z e^{−2επi/3})` (9.12.14).

*Needs:* 6.1–6.2, 1.4.

### 6.4 Maclaurin series

DLMF 9.12.15–9.12.18, as `HasSum` statements for every `z` (`hasSum_scorerHi`):
- `Gi(z) = 3^{−2/3} π⁻¹ ∑ₖ cos((2k − 1)π/3) Γ((k + 1)/3) (3^{1/3} z)^k / k!` (9.12.15);
- `Gi′(z) = 3^{−1/3} π⁻¹ ∑ₖ cos((2k + 1)π/3) Γ((k + 2)/3) (3^{1/3} z)^k / k!` (9.12.16);
- `Hi(z) = 3^{−2/3} π⁻¹ ∑ₖ Γ((k + 1)/3) (3^{1/3} z)^k / k!` (9.12.17);
- `Hi′(z) = 3^{−1/3} π⁻¹ ∑ₖ Γ((k + 2)/3) (3^{1/3} z)^k / k!` (9.12.18).

The proof route for `Hi` is termwise integration of `e^{zt}` against `e^{−t³/3}`; for `Gi`,
9.12.12.

*Needs:* 6.1, 6.3; Mathlib `integral_rpow_mul_exp_neg_rpow`.

### 6.5 Integral representations

DLMF 9.12.19–9.12.21 and 9.12.24:
- `Gi(x) = π⁻¹ ∫₀^∞ sin(t³/3 + x t) dt` for real `x`, as an improper integral (9.12.19);
- `Hi(z) = π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt` (9.12.20, definitional);
- `Gi(z) = −π⁻¹ ∫₀^∞ exp(−t³/3 − z t/2) cos(√3 z t/2 + 2π/3) dt` for every `z`, absolutely
  convergent (9.12.21);
- for `z ≠ 0` with `|ph(−z)| < 2π/3` and `−1 < σ < 0` (9.12.24; `scorerHi_mellin_barnes`):

```text
2π² 3^{2/3} Hi(z) = ∫_ℝ Γ(⅓ + s/3) Γ(−s) exp(s (ln 3 / 3 + log(−z))) dy,    s = σ + iy,
```

  the integral absolutely convergent, with `log` the principal logarithm.

The proof route for 9.12.24 is the line shift of AsymptoticExpansions §8.2 to the right, across
the poles of `Γ(−s)` at `s = 0, 1, 2, …`, whose residues reproduce the series 9.12.17, with §8.6
for the convergence and the identity theorem in the sector; for 9.12.19 and 9.12.21, the rotation
of the contour of 9.12.20 as in 2.2.

*Needs:* 2.2, 6.3–6.4; AsymptoticExpansions §§8.2, 8.6.

### 6.6 Asymptotic expansions

DLMF 9.12.25–9.12.31. Let `G_N(z) = ∑_{k<N} (3k)!/(k! (3z³)^k)` and
`G′_N(z) = ∑_{k<N} (3k + 1)!/(k! (3z³)^k)`. For `δ > 0` and every `N`:
- as `z → ∞` in `|ph z| ≤ π/3 − δ`: `Gi(z) − (πz)⁻¹ G_N(z) = O(|z|^{−3N−1})` (9.12.25) and
  `Gi′(z) + (πz²)⁻¹ G′_N(z) = O(|z|^{−3N−2})` (9.12.26);
- as `z → ∞` in `|ph(−z)| ≤ 2π/3 − δ`: `Hi(z) + (πz)⁻¹ G_N(z) = O(|z|^{−3N−1})` (9.12.27) and
  `Hi′(z) − (πz²)⁻¹ G′_N(z) = O(|z|^{−3N−2})` (9.12.28);
- as `z → ∞` in `|ph z| ≤ π − δ`, for every `M` (9.12.29):
  `Hi(z) + (πz)⁻¹ G_N(z) − e^{ζ}/(√π z^{1/4}) ∑_{k<M} u_k ζ^{−k}
   = O(|z|^{−3N−1} + |e^{ζ} z^{−1/4}| |ζ|^{−M})`;
- as `z → ∞` in `|ph z| ≤ π/3 − δ` (9.12.30), with `γ` Euler's constant:
  `∫₀^z Gi − π⁻¹ ln z − (2γ + ln 3)/(3π) + π⁻¹ ∑_{1≤k<N} (3k − 1)!/(k! (3z³)^k)
   = O(|z|^{−3N})`;
- as `z → ∞` in `|ph z| ≤ 2π/3 − δ` (9.12.31):
  `∫₀^z Hi(−t) dt − π⁻¹ ln z − (2γ + ln 3)/(3π) − π⁻¹ ∑_{1≤k<N} (−1)^{k−1} (3k − 1)!/(k! (3z³)^k)
   = O(|z|^{−3N})`.

The proof route for 9.12.27–9.12.28 is Watson's lemma for 9.12.20 written as
`π⁻¹ ∫₀^∞ e^{zt} e^{−t³/3} dt` (AsymptoticExpansions §§4.2–4.3), expanding `e^{−t³/3}`; 9.12.25,
9.12.26 and 9.12.29 follow by 9.12.11–9.12.13 and 3.2–3.3. For 9.12.31, Fubini in 9.12.20 gives
`∫₀^z Hi(−t) dt = π⁻¹ ∫₀^∞ (1 − e^{−zt}) e^{−t³/3} t⁻¹ dt`, whose expansion for large `z`,
constant term included, follows from Watson's lemma after one integration by parts against
`ln t`; 9.12.30 follows by 9.12.12.

*Needs:* 3.2–3.3, 6.1–6.5; AsymptoticExpansions §§1.5, 4.2–4.3; Mathlib `Complex.digamma`,
`Real.eulerMascheroniConstant`.

### 6.7 Zeros

DLMF §9.12(ix), the real zeros:
- `Hi` and `Hi′` have no real zeros; `Hi > 0` and `Hi′ > 0` on `ℝ`;
- `Gi` has no zeros in `[0, ∞)` and infinitely many negative zeros; `Gi′` has exactly one zero in
  `[0, ∞)` and infinitely many negative zeros;
- the negative zeros of `Gi` and `Gi′` interlace: between two consecutive negative zeros of
  either function there is exactly one zero of the other;
- every real zero of `Gi` is simple.

The positivity of `Hi`, `Hi′` is immediate from 9.12.20, and that of `Gi` on `[0, ∞)` from
9.12.4 with 1.6 and 2.3, since `∫₀^x Ai < ∫₀^∞ Ai = ⅓`. The negative zeros of `Gi` are located by
`Gi(−x) = Bi(−x) − Hi(−x)`, in which `Bi(−x)` oscillates with amplitude of order `x^{−1/4}` by 3.4
while `Hi(−x) = O(x^{−1})` by 9.12.27. The rest uses the energy `E = Gi′² − x Gi² + 2 Gi/π`, an
owned auxiliary result (`hasDerivAt_scorerGi_energy`): `E′ = −Gi²` by `Gi″ = x Gi − 1/π`, and
`E(x) → 0` as `x → +∞` by 9.12.25–9.12.26, so `E > 0` on `ℝ`.
- At a real zero of `Gi`, `Gi′² = E > 0`: the zero is simple.
- At a critical point `x < 0` of `Gi`, `E = Gi (2/π − x Gi) > 0` and `Gi″ = x Gi − 1/π`; so
  `Gi > 0` at every local maximum, `Gi < 0` at every local minimum, and `Gi″ ≠ 0`. Hence between
  consecutive negative zeros of `Gi` there is exactly one critical point, and between
  consecutive negative critical points there is a zero (Rolle).
- On `[0, ∞)`, `(Gi′)″ = Gi + x Gi′ > 0` wherever `Gi′ ≥ 0`, so `Gi′` has no local maximum
  there with a nonnegative value; with `Gi′(0) > 0` (9.12.7) and `Gi′ < 0` near `+∞`
  (9.12.26), `Gi′` has exactly one zero in `[0, ∞)`.

*Needs:* 1.6, 2.3, 3.4, 6.1–6.6.

### Examples

- 6.2 with 6.4 at `k = 0`: `Hi(0) = 3^{−2/3} π⁻¹ Γ(⅓)` equals `2/(3^{7/6} Γ(⅔))` by the
  reflection formula.
- 9.12.13 at `z = 0` reads `Gi(0) = e^{−επi/3} Hi(0) + iε Ai(0)`, whose real and imaginary parts
  are `Gi(0) = Hi(0)/2` and `Ai(0) = (√3/2) Hi(0)`.

### Dependencies

Layers 1–3; AsymptoticExpansions §§1.5, 4.2–4.3, 8.2, 8.6, 10.2; Mathlib digamma and Gamma
integrals.

## Layer 7: integrals

### 7.1 Gauss's triplication formula

DLMF 5.5.6 with `m = 3`: for every `z : ℂ` (`Complex.Gamma_mul_Gamma_add_third`),

```text
Γ(z) Γ(z + ⅓) Γ(z + ⅔) = 2π 3^{½ − 3z} Γ(3z)
```

Both sides vanish at the poles under Mathlib's convention `Γ(−n) = 0`. The proof route is the
Bohr–Mollerup characterization for real `z > 0` (Mathlib `Real.eq_Gamma_of_log_convex`) and the
identity theorem.

*Needs:* Mathlib `Real.eq_Gamma_of_log_convex`, `Complex.Gamma_ofReal` and the identity theorem.

### 7.2 Primitives and the Scorer functions

DLMF 9.10.1–9.10.3 and 9.10.11–9.10.12. With the segment integral of 6.2, for every `z`:
- `⅓ − ∫₀^z Ai = π (Ai(z) Gi′(z) − Ai′(z) Gi(z))` (9.10.1);
- `⅔ + ∫₀^z Ai = π (Ai(z) Hi′(z) − Ai′(z) Hi(z))` (9.10.2);
- `∫₀^z Bi = π (Bi′(z) Gi(z) − Bi(z) Gi′(z)) = π (Bi(z) Hi′(z) − Bi′(z) Hi(z))` (9.10.3).

As improper integrals on the real line (`integral_airyAi_Ioi`):
- `∫₀^∞ Ai = ⅓` (from 2.3) and `∫_{−∞}^0 Ai = ⅔` (9.10.11), the first absolutely convergent;
- `∫_{−∞}^0 Bi = 0` (9.10.12);
- hence `∫_{−∞}^x Ai = ⅔ + ∫₀^x Ai` and `∫_{−∞}^x Bi = ∫₀^x Bi` for every real `x`.

The right sides of 9.10.1–9.10.3 have derivative `−Ai`, `Ai`, `Bi` by 6.1, and agree at `0` by
6.2. The limits follow from these forms with 3.2–3.4 and 6.6.

*Needs:* 3.2–3.4, 6.1–6.2, 6.6.

### 7.3 Asymptotic forms of the primitives

DLMF 9.10.4–9.10.7. With `ζ = (2/3) x^{3/2}` for `x → +∞` and `ξ = (2/3)(−x)^{3/2}` for
`x → −∞`:
- `∫_x^∞ Ai ∼ e^{−ζ}/(2√π x^{3/4})` (9.10.4) and `∫₀^x Bi ∼ e^{ζ}/(√π x^{3/4})` (9.10.5), as
  `Asymptotics.IsEquivalent atTop`;
- `∫_{−∞}^x Ai = cos(ξ + π/4)/(√π (−x)^{3/4}) + O(|x|^{−9/4})` (9.10.6);
- `∫_{−∞}^x Bi = −sin(ξ + π/4)/(√π (−x)^{3/4}) + O(|x|^{−9/4})` (9.10.7).

The leading term of 9.10.7 has a minus sign: its derivative must be `Bi(x)`, which by 9.7.11 is
`−sin(ξ − π/4)/(√π (−x)^{1/4})` to leading order, and at `x = −10` the integral is
`−0.01504…`. (DLMF 9.10.7 prints a plus sign; the correction is recorded in the errata report
of `lean-DLMF`, see [Prior formalization](#prior-formalization).) The proof route is integration
by parts in 7.2 against the expansions of 3.2–3.4, or integration of the expansions
(AsymptoticExpansions §1.5).

*Needs:* 3.2–3.4, 7.2; AsymptoticExpansions §1.5.

### 7.4 Antiderivatives

DLMF 9.10.8–9.10.10 and 9.10.20–9.10.21. For every entire solution `w` of Airy's equation:
- `w′` is an antiderivative of `z w` (9.10.8), and `z w′ − w` of `z² w` (9.10.9);
- `z^{n+2} w′ − (n + 2) z^{n+1} w` is an antiderivative of `z^{n+3} w − (n + 1)(n + 2) z^n w`
  (9.10.10).

For real `x`: `∫₀^x ∫₀^v Ai(t) dt dv = x ∫₀^x Ai − Ai′(x) + Ai′(0)` (9.10.20), and the same for
`Bi` (9.10.21).

*Needs:* 1.2.

### 7.5 Laplace transforms

DLMF 9.10.13–9.10.16:
- for `Re p > 0`, `t ↦ e^{pt} Ai(t)` is integrable on `ℝ` and `∫_ℝ e^{pt} Ai(t) dt = e^{p³/3}`
  (9.10.13);
- for every `p`, `∫₀^∞ e^{−pt} Ai(t) dt` converges absolutely and equals
  `e^{−p³/3} (⅓ − 3^{−4/3} p 𝐌(⅓, 4/3, p³/3) + 3^{−5/3} p² 𝐌(⅔, 5/3, p³/3))` (9.10.14);
- for `Re p > 0`, with `w = 3 log p − log 3`, so that `e^w = p³/3` and `|Im w| < 3π/2`, and
  `Γ_L(a, w)` = `TauCeti.Complex.upperIncompleteGammaLog a w`, the integrals converge absolutely
  and (9.10.15–9.10.16; `airyAi_neg_laplace_complex`)

```text
∫₀^∞ e^{−pt} Ai(−t) dt = (e^{p³/3}/3)  (Γ_L(⅓, w)/Γ(⅓) + Γ_L(⅔, w)/Γ(⅔))
∫₀^∞ e^{−pt} Bi(−t) dt = (e^{p³/3}/√3) (Γ_L(⅔, w)/Γ(⅔) − Γ_L(⅓, w)/Γ(⅓))
```

- for real `p > 0` these read, with `Q(s, x) = 1 − TauCeti.regularizedGamma s x`,
  `∫₀^∞ e^{−pt} Ai(−t) dt = (e^{p³/3}/3) (Q(⅓, p³/3) + Q(⅔, p³/3))` (`airyAi_neg_laplace`) and
  `∫₀^∞ e^{−pt} Bi(−t) dt = (e^{p³/3}/√3) (Q(⅔, p³/3) − Q(⅓, p³/3))`.

For `|ph p| > π/3` the principal `Γ(a, p³/3)` is not the right value: `p³/3` has left the
principal sheet, and the logarithmic coordinate `w` is needed. The proof route: `L(p) =
∫₀^∞ e^{−pt} Ai(t) dt` satisfies `L′ = −p² L + Ai′(0) + p Ai(0)` by Airy's equation and two
integrations by parts, with `L(0) = ⅓`; solving this linear equation gives 9.10.14, and the same
method with `Ai(−t)` gives 9.10.15–9.10.16 for real `p > 0`. Both sides are holomorphic on
`Re p > 0`, the right sides by SpecialFunctionsEiLiErfIncompleteGamma §1.5, so the identity
theorem gives complex `p`. For 9.10.13, the contour integral 2.1 and Fubini.

*Needs:* 2.1, 3.2–3.4, 7.2; Tau Ceti `TauCeti.regularizedGamma`; Mathlib `Complex.regularizedHGFun`;
SpecialFunctionsEiLiErfIncompleteGamma §1.5.

### 7.6 Mellin and Stieltjes transforms

DLMF 9.10.17–9.10.19:
- for `Re α > 0`, `∫₀^∞ t^{α−1} Ai(t) dt = Γ(α) / (3^{(α+2)/3} Γ(α/3 + ⅔))` (9.10.17;
  `airyAi_mellin`), absolutely convergent;
- for `z ≠ 0`, `|ph z| < 2π/3` (9.10.18):

```text
Ai(z) = (3 z^{5/4} e^{−ζ}/(4π)) ∫₀^∞ t^{−3/4} e^{−(2/3)t^{3/2}} Ai(t) / (z^{3/2} + t^{3/2}) dt
```

- for `x > 0`, with `ζ = (2/3) x^{3/2}`, the principal value at `t = x` (9.10.19):

```text
Bi(x) = (3 x^{5/4} e^{ζ}/(2π)) ⨍₀^∞ t^{−3/4} e^{−(2/3)t^{3/2}} Ai(t) / (x^{3/2} − t^{3/2}) dt
```

  stated as the limit as `ε → 0+` of the integrals over `(0, x − ε) ∪ (x + ε, ∞)`.

The proof route for 9.10.17 is Fubini in 9.5.6 at real `z > 0`, two Gamma integrals, and 7.1.
For 9.10.18, Cauchy's integral formula in the variable `s = z^{3/2}` for
`G(s) = z^{−5/4} e^{ζ} Ai(z)`: `G` tends to `0` at infinity by 3.2, has an integrable
singularity at `s = 0`, and by 9.2.11 its boundary values at `z = t e^{±2πi/3}` differ by
`−i t^{−5/4} e^{−(2/3)t^{3/2}} Ai(t)`. 9.10.19 is the boundary value of 9.10.18 as
`z → x e^{±2πi/3}` from inside `|ph z| < 2π/3`, combined through 9.2.11. In the variable
`s = t^{3/2}` the integral of 9.10.18 is the Cauchy integral `∫₀^∞ φ(s)/(s − w) ds` with
`w = −z^{3/2}` and `φ(s) = (2/3) s^{−5/6} e^{−2s/3} Ai(s^{2/3})`, and `w → x^{3/2}` from one side
of the real axis. The boundary value is given by the Sokhotski–Plemelj formula on the half-line,
an owned auxiliary result (`tendsto_cauchyIntegral_Ioi`): if `s₀ > 0`,
`∫₀^∞ |φ(s)|/(1 + s) ds < ∞` and `φ` is `C¹` on a neighbourhood of `s₀`, then as `w → s₀` with
`±Im w > 0`,
`∫₀^∞ φ(s)/(s − w) ds → ⨍₀^∞ φ(s)/(s − s₀) ds ± iπ φ(s₀)`, the principal value being the limit
of the integrals over `(0, s₀ − ε) ∪ (s₀ + ε, ∞)`. The excisions in `s` and in `t` give the same
limit, since `t ↦ t^{3/2}` is `C¹` with positive derivative at `x`.

*Needs:* 1.4, 2.3, 3.2, 7.1; Mathlib Cauchy integral formula and Fubini.

### 7.7 Repeated integrals

DLMF 9.10.22. Let `I₀(t) = Ai(−t)` and `I_{n+1}(t) = ∫_t^∞ I_n` as an improper integral. For
`n ≥ 1` every `I_n` is defined, and (9.10.22; `airyAi_repeated_integral`)

```text
I_n(0) = 2 cos((n − 1)π/3) / (3^{(n+2)/3} Γ((n + 2)/3))
```

The proof route is induction on `n` with 3.4, which shows `I_n(t) = O(t^{−1/4 − n/2})` with the
oscillatory factor kept, and the values by Abelian limits `p → 0+` of
`∫₀^∞ e^{−pt} t^{n−1} Ai(−t) dt`, computed as in 7.5, together with 7.6.

*Needs:* 3.4, 7.2, 7.5–7.6.

### 7.8 Incomplete Airy functions

DLMF §9.14. For `a, z : ℂ`, the incomplete Airy function is the integral of 9.5.4 with the upper
endpoint replaced by `a` (`TauCeti.incompleteAiryAi`):

```text
Ai(a, z) = (2πi)⁻¹ ( −∫₀^∞ e^{−πi/3} f_z(r e^{−πi/3}) dr + ∫₀^1 a f_z(s a) ds ),
f_z(t) = exp(t³/3 − z t)
```

that is, along the ray from `∞ e^{−πi/3}` to `0` and the segment from `0` to `a`. Then:
- `Ai(a, z)` is entire in `a` and in `z`, with `∂_a Ai(a, z) = (2πi)⁻¹ f_z(a)`;
- `∂_z² Ai(a, z) − z Ai(a, z) = (2πi)⁻¹ f_z(a)`;
- `Ai(r e^{πi/3}, z) → Ai(z)` as `r → ∞`, and `Ai(z) = Ai(a, z) + (2πi)⁻¹ ∫_a^{∞e^{πi/3}} f_z`,
  the last integral along the segment from `a` to `0` followed by the ray to `∞ e^{πi/3}`.

*Needs:* 2.1; Mathlib parametric differentiation.

### Examples

- 9.10.17 at `α = 1` is `∫₀^∞ Ai = ⅓`, and 9.10.14 at `p = 0` is the same value.
- 7.1 at `z = ⅓` reads `Γ(⅓) Γ(⅔) = 2π/√3`.
- 9.10.22 at `n = 1` is `∫₀^∞ Ai(−t) dt = ⅔`, which is 9.10.11.

### Dependencies

Layers 1–6; Tau Ceti `TauCeti.regularizedGamma`; Mathlib Gamma, Bohr–Mollerup, Fubini and the
Cauchy integral formula; AsymptoticExpansions §1.5.

## Layer 8: products

### 8.1 The product equation

DLMF 9.11.1–9.11.2. If `f`, `g` are entire solutions of Airy's equation, then `w = f g` solves
`w‴ − 4z w′ − 2w = 0` (9.11.1). The Wronskian determinant of `Ai²`, `Ai Bi`, `Bi²`, written out
as the `3 × 3` determinant of the functions and their first two derivatives, is `2/π³`
(9.11.2; `airy_product_wronskian`). An entire solution of 9.11.1 is determined by `w(0)`,
`w′(0)` and `w″(0)`, since its Taylor coefficients satisfy
`(k + 1)(k + 2)(k + 3) a_{k+3} = (4k + 2) a_k`; this uniqueness is an owned auxiliary result
(`eq_of_productEquation`). With the nonzero Wronskian, `Ai²`, `Ai Bi`, `Bi²` match every triple
of initial values, so they form a basis of the entire solutions of 9.11.1.

*Needs:* 1.2–1.3.

### 8.2 Antiderivatives

DLMF 9.11.5–9.11.14. For entire solutions `f`, `g` of Airy's equation with Wronskian
`𝒲 = f g′ − f′ g`:
- `−f′ g′ + z f g` is an antiderivative of `f g` (9.11.5);
- `(f g + 𝒲 z)/2` of `f g′` (9.11.6);
- `(f g′ + f′ g + z f′ g′ − z² f g)/3` of `f′ g′` (9.11.7);
- `(f g′ + f′ g)/6 − (z f′ g′ − z² f g)/3` of `z f g` (9.11.8);
- `f′ g′/2 + 𝒲 z²/4` of `z f g′` (9.11.9);
- `(3/10)(−f g + z f g′ + z f′ g) + (z² f′ g′ − z³ f g)/5` of `z f′ g′` (9.11.10);
- if `𝒲 ≠ 0`, `f(z) ≠ 0` and `F` has derivative `F′` at `g(z)/f(z)`, then `F(g/f)/𝒲` has
  derivative `F′(g(z)/f(z))/f(z)²` at `z` (9.11.11);
- where `Ai(z) ≠ 0`, `π Bi/Ai` is an antiderivative of `1/Ai²` (9.11.12);
- where `Ai(z) Bi(z) ≠ 0` and `Bi(z)/Ai(z)` lies in the slit plane, `π log(Bi/Ai)` is an
  antiderivative of `1/(Ai Bi)` (9.11.13);
- where `Ai(z)² + Bi(z)² ≠ 0`, `(π/2) Bi²/(Ai² + Bi²)` is an antiderivative of
  `Ai Bi/(Ai² + Bi²)²` (9.11.14).

*Needs:* 1.2–1.3.

### 8.3 Integral representations of products

DLMF 9.11.3–9.11.4 and an auxiliary representation:
- for real `x ≥ 0`, `Ai(x)² = (4π√3)⁻¹ ∫₀^∞ J₀(t³/12 + x t) t dt` as an improper integral, with
  `J₀` Mathlib's `Complex.besselJ 0` (9.11.3; `airyAi_sq_eq_besselJ_integral`);
- for every `z`, `Ai(z)² + Bi(z)² = π^{−3/2} ∫₀^∞ exp(z t − t³/12) t^{−1/2} dt`, absolutely
  convergent (9.11.4);
- for real `x`, `Ai(x)² = 2^{2/3} π⁻¹ ∫₀^∞ Ai(2^{2/3}(x + t²)) dt` (`airyAi_sq_eq_integral`).

The proof route for 9.11.3: by 9.5.1, `Ai(x)² = (2π)^{−2} ∫∫ exp(i((u³ + v³)/3 + x(u + v)))
du dv`; with `u + v = a`, `u − v = b/√3`, the exponent is `i a ((a² + b²)/12 + x)`, and polar
coordinates in `(a, b)` with the Bessel integral `J₀(r) = (2π)⁻¹ ∫₀^{2π} e^{ir cos φ} dφ` give
the right side. The Bessel integral is an owned auxiliary result, by termwise integration of the
series of `Complex.besselJ 0`. The interchanges are justified with the factor `e^{−ε(a² + b²)}`
and `ε → 0+`, using the locally uniform convergence of 2.2. The proof route for the other two is
8.1: each right side solves 9.11.1, by differentiation under the
integral and integration by parts; for 9.11.4 the initial values at `0` are Gamma integrals, and
for the second the right side decays like `e^{−(4/3)x^{3/2}}` times a power by 3.6, so it is a
multiple of `Ai²`, fixed by the value at `0`.

*Needs:* 2.2, 3.6, 8.1; Mathlib parametric differentiation, `integral_rpow_mul_exp_neg_rpow`
and `Complex.besselJ_def`.

### 8.4 Integrals

DLMF 9.11.15–9.11.19:
- for `Re α > 0`, `∫₀^∞ t^{α−1} Ai(t)² dt = 2Γ(α) / (√π 12^{(2α+5)/6} Γ(α/3 + 5/6))` (9.11.15);
- `∫_{−∞}^{∞} Ai(t)³ dt = Γ(⅓)²/(4π²)` (9.11.16) and
  `∫_{−∞}^{∞} Ai(t)² Bi(t) dt = Γ(⅓)²/(4√3 π²)` (9.11.17), as improper integrals at `−∞`;
- `∫₀^∞ Ai(t)⁴ dt = ln 3/(24π²)` (9.11.18);
- `∫₀^∞ dt/(Ai(t)² + Bi(t)²) = ∫₀^∞ t dt/(Ai′(t)² + Bi′(t)²) = π²/6` (9.11.19).

The proof routes: 9.11.15 from the auxiliary representation of 8.3, Fubini, the Beta integral and
9.10.17; 9.11.19 from 4.1 and 4.4, since the integrals are `π (θ(0) − θ(∞))` and
`π (φ(∞) − φ(0))`; 9.11.16–9.11.18 from the auxiliary representation of 8.3 applied to one or two
squared factors, which reduces them to integrals of `Ai` against `Ai` at a scaled argument, and
the Fourier form 9.5.1 (Laurenzi 1993, Reid 1995).

*Needs:* 2.2, 4.1, 4.4, 7.6, 8.3; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral` and Fubini.

### 8.5 The Airy kernel

For real `x`, `y`, the kernel `K_Ai(x, y) = ∫₀^∞ Ai(x + t) Ai(y + t) dt` converges absolutely
(`airyKernel`), and:
- `K_Ai(x, y) = (Ai(x) Ai′(y) − Ai′(x) Ai(y))/(x − y)` for `x ≠ y`
  (`airyKernel_eq_of_ne`);
- `K_Ai(x, x) = Ai′(x)² − x Ai(x)²`;
- for every `s` there is `C` with `|Ai(x)| ≤ C e^{−x}` and `|Ai′(x)| ≤ C e^{−x}` for `x ≥ s`, and
  hence `|K_Ai(x, y)| ≤ C² e^{−x−y}` for `x, y ≥ s`.

The closed forms follow from `∂_t (Ai(x + t) Ai′(y + t) − Ai′(x + t) Ai(y + t))
= (y − x) Ai(x + t) Ai(y + t)` and from 9.11.5; the bounds from 3.5–3.6 on `[1, ∞)` and continuity
on `[s, 1]`.

*Needs:* 1.2, 3.5–3.6, 8.2.

### Examples

- 9.11.15 at `α = 1` and 8.5 at `x = 0` both give `∫₀^∞ Ai(t)² dt = Ai′(0)² = 3^{−2/3}/Γ(⅓)²`.
- 9.11.4 at `z = 0` reads `4 Ai(0)² = π^{−3/2} 12^{1/6} Γ(1/6)/3`.

### Dependencies

Layers 1–4 and 7; Mathlib Gamma, Beta, Bessel and Fubini.

## Layer 9: generalized Airy functions

Throughout, `n ≥ 1` is a natural number, `p = 1/(n + 2)` and `ζ = 2p z^{(n+2)/2}` with the
principal power (DLMF 9.13.3; `TauCeti.generalizedAiryOrder n = 1/(n + 2)`). All sectors below
lie in `|ph z| ≤ 3pπ ≤ π`; as in the Conventions, the phase of `ζ` is the lifted phase
`ph ζ = ph z/(2p)`.

### 9.1 Definitions, the equation and the Wronskian

DLMF 9.13.1–9.13.3, 9.13.5 and 9.13.8. Swanson and Headley's functions are pinned by their series
(`TauCeti.generalizedAiryA`, `TauCeti.generalizedAiryB`):

```text
A_n(z) = p^{1−p} 𝐅(1 − p, p² z^{n+2}) − p^{1+p} z 𝐅(1 + p, p² z^{n+2})
B_n(z) = p^{1/2} (p^{−p} 𝐅(1 − p, p² z^{n+2}) + p^{p} z 𝐅(1 + p, p² z^{n+2}))
```

The powers of `p` are positive real powers. Then:
- `A_n` and `B_n` are entire and solve `w″ = zⁿ w` (9.13.1; `generalizedAiryA_ode`), and
  `A₁ = Ai`, `B₁ = Bi`, since `p² z³ = z³/9` at `n = 1`;
- `A_n(0) = p^{1/2} B_n(0) = p^{1−p}/Γ(1 − p)` and `−A_n′(0) = p^{1/2} B_n′(0) = p^p/Γ(p)`
  (9.13.5);
- `A_n B_n′ − A_n′ B_n = (2/π) p^{1/2} sin(pπ)` (9.13.8; `generalizedAiry_wronskian`);
- every solution of 9.13.1 on a connected open set is the restriction of `c₁ A_n + c₂ B_n`, so
  every solution extends to an entire one (9.13.2, in a form without Bessel functions).

The proof route is that of Layer 1: the coefficient recurrence of the series, the values at `0`,
the reflection formula for the Wronskian, and AsymptoticExpansions §10.2 at a point of the open
set with the identity theorem.

*Needs:* 1.1–1.3; AsymptoticExpansions §10.2.

### 9.2 Bessel forms, reflections and rotations

DLMF 9.13.4, 9.13.6–9.13.7. Let `ω = e^{2πip}`, and `J_ν`, `I_ν` as in the Conventions.
- For real `x > 0`: `A_n(x) = p x^{1/2} (I_{−p}(ζ) − I_p(ζ))` and
  `B_n(x) = (px)^{1/2} (I_{−p}(ζ) + I_p(ζ))` (9.13.4, the first with
  `K_p = π (I_{−p} − I_p)/(2 sin pπ)` written out).
- For `n` odd and `z ≠ 0` with `|ph z| < 2pπ`: `A_n(−z) = p z^{1/2} (J_{−p}(ζ) + J_p(ζ))` and
  `B_n(−z) = (pz)^{1/2} (J_{−p}(ζ) − J_p(ζ))` (9.13.6–9.13.7).
- For `n` even and every `z`: `A_n(−z) = p^{1/2} B_n(z)` and `B_n(−z) = p^{−1/2} A_n(z)`
  (9.13.6–9.13.7).
- For every `j ∈ ℤ`, `z ↦ A_n(ω^j z)` solves 9.13.1, and for every `z` (an owned auxiliary
  result)

```text
A_n(z) = (e^{−πip} A_n(ωz) + e^{πip} A_n(ω⁻¹z)) / (2 cos pπ)
B_n(z) = i (e^{−πip} A_n(ωz) − e^{πip} A_n(ω⁻¹z)) / (2 p^{1/2} sin pπ)
```

  more generally, `A_n(z) = c₁ A_n(ω^j z) + c₂ A_n(ω^{j+1} z)` with `c₁ + c₂ = 1` and
  `c₁ ω^j + c₂ ω^{j+1} = 1`.

The proof route: the Bessel forms are the series of 9.1 rewritten, as in 1.7, the restriction
`|ph z| < 2pπ` making `(ζ/2)^{±p} = p^{±p} z^{±1/2}` with principal powers; the reflections for
even `n` and the rotation formulas compare values and derivatives at `0`, since `z^{n+2}` is
invariant under `z ↦ ωz`, and under `z ↦ −z` when `n` is even.

*Needs:* 9.1; Mathlib `Complex.besselJ_def`; Tau Ceti `Real.besselI_eq_rpow_mul`.

### 9.3 Integral representation and asymptotics

DLMF 9.13.9–9.13.12. As an owned auxiliary result, for `|ph z| < pπ`
(`generalizedAiryA_eq_integral`):

```text
A_n(z) = (2p/π) sin(pπ) z^{1/2} ∫₀^∞ e^{−ζ cosh u} cosh(pu) du
```

Then, for `δ > 0`, as `z → ∞` (`isBigO_generalizedAiryA_sub`):
- `A_n(z) − √(p/π) sin(pπ) z^{−n/4} e^{−ζ} = O(|z^{−n/4} e^{−ζ}| |ζ|^{−1})` in
  `|ph z| ≤ 3pπ − δ` (9.13.9);
- `B_n(z) − π^{−1/2} z^{−n/4} e^{ζ} = O(|z^{−n/4} e^{ζ}| |ζ|^{−1})` in `|ph z| ≤ pπ − δ`
  (9.13.11);
- for `n` odd, in `|ph z| ≤ 2pπ − δ`, with the error `O(|z^{−n/4}| e^{|Im ζ|} |ζ|^{−1})`:
  `A_n(−z) − 2 √(p/π) cos(pπ/2) z^{−n/4} cos(ζ − π/4)` and
  `B_n(−z) + (2/√π) sin(pπ/2) z^{−n/4} sin(ζ − π/4)` (9.13.10, 9.13.12);
- for `n` even: `A_n(−z) − √(p/π) z^{−n/4} e^{ζ} = O(|z^{−n/4} e^{ζ}| |ζ|^{−1})` in
  `|ph z| ≤ pπ − δ`, and `B_n(−z) − π^{−1/2} sin(pπ) z^{−n/4} e^{−ζ}
  = O(|z^{−n/4} e^{−ζ}| |ζ|^{−1})` in `|ph z| ≤ 3pπ − δ` (9.13.10, 9.13.12).

The proof route for the representation: for `z = x > 0`, the substitution `s = (ζ/2) e^u` turns
the integral into `½ (ζ/2)^{−p} ∫₀^∞ s^{p−1} e^{−s − c/s} ds` with `c = ζ²/4 = p² x^{n+2}`. Its
Mellin transform in `c` is `Γ(t) Γ(t + p)`, by Fubini; Mathlib's `mellinInv_mellin_eq` and the
line shift of AsymptoticExpansions §8.2 to the left across the simple poles `t = −k` and
`t = −p − k`, with the remainder tending to `0` by §8.6 and the reflection formula, give the
residue series `(π/ sin pπ)(𝐅(1 − p, c) − c^p 𝐅(1 + p, c))`, which is the series of 9.1. The
identity theorem extends it to `|ph z| < pπ`. For the asymptotics, `τ = cosh u − 1` gives
`e^{−ζ} ∫₀^∞ e^{−ζτ} τ^{−1/2} h(τ) dτ` with `h(τ) = cosh(p arccosh(1 + τ))/(τ + 2)^{1/2}`, which is
holomorphic in the slit plane, since `cosh(p arccosh w)` is even in `arccosh w`, and
`h(0) = 2^{−1/2}`. Watson's lemma and the rotation of the path (AsymptoticExpansions §§4.2–4.3)
give 9.13.9 for `|ph ζ| ≤ 3π/2 − δ`, that is `|ph z| ≤ 3pπ − 2pδ`. Then 9.13.11 follows from the
rotation formula of 9.2, both terms contributing at leading order as in 3.3; 9.13.10 and 9.13.12
for even `n` follow from the reflections of 9.2; and for odd `n` the general rotation formula of
9.2 with `j = −(n + 3)/2` writes `A_n(−z)` through `A_n(z e^{∓pπi})`, where `ζ` becomes `∓iζ`.

*Needs:* 9.1–9.2; AsymptoticExpansions §§4.2–4.3, 8.2, 8.6; Mathlib `mellinInv_mellin_eq` and
`Complex.Gamma_mul_Gamma_one_sub`.

### 9.4 Olver's and Smirnov's normalizations

DLMF 9.13.13–9.13.24. Let `m = n + 2 = 1/p ≥ 3` and `t = (m/2)^{−2/m} z` (9.13.14).
- **Definitions** (9.13.15–9.13.16; `TauCeti.olverAiryU`, `olverAiryVBar`, `olverAiryW`):
  `U_m(t) = √(2π) (m/2)^{(m−1)/m} csc(π/m) A_n((m/2)^{2/m} t)` for every `m`, which is DLMF's
  `V_m` for odd `m`; `V̄_m(t) = √π (m/2)^{(m−2)/(2m)} csc(π/m) B_n((m/2)^{2/m} t)` for odd `m`;
  and for even `m`, with `s = (m/2)^{2/m} t`,

```text
W_m(t) = 2^{(m+2)/(2m)} (2√π)⁻¹ ( Γ(1/m) Γ(1 − 1/m) 𝐅(1 − 1/m, −s^m/m²)
                               + Γ(−1/m) Γ(1 + 1/m) m^{−2/m} s 𝐅(1 + 1/m, −s^m/m²) )
```

  which pins Olver's `W_m` by 9.13.23–9.13.24.
- `U_m(t)`, `U_m(−t)` and, for odd `m`, `V̄_m(t)` solve `d²w/dt² = ¼ m² t^{m−2} w` (9.13.13);
  for even `m`, `U_m(−t) = √π (m/2)^{(m−2)/(2m)} csc(π/m) B_n((m/2)^{2/m} t)` (9.13.16); and for
  even `m`, `W_m(t)` and `W_m(−t)` solve `d²w/dt² = −¼ m² t^{m−2} w` (9.13.17).
- For every `j ∈ ℤ`, `t ↦ U_m(t e^{−2jπi/m})` solves 9.13.13, and it is recessive in the sector
  `(2j − 1)π/m < ph t < (2j + 1)π/m`: for `δ > 0`, as `t → ∞` in
  `|ph(t e^{−2jπi/m})| ≤ π/m − δ`, `U_m(t e^{−2jπi/m}) / B_n((m/2)^{2/m} t e^{−2jπi/m}) → 0`
  (9.13.18). DLMF prints the lower end of the sector as `−(2j − 1)π/m`; the sector here is the
  one centred on the ray where `t e^{−2jπi/m}` is positive, which at `j = 0` is `|ph t| < π/m`.
- Smirnov's functions (9.13.19–9.13.21): for real `α > −2` and `x > 0`,
  `U₁(x, α) = (α + 2)^{−1/(α+2)} Γ((α + 1)/(α + 2)) x^{1/2} J_{−1/(α+2)}((2/(α + 2)) x^{(α+2)/2})`
  and `U₂(x, α) = (α + 2)^{1/(α+2)} Γ((α + 3)/(α + 2)) x^{1/2} J_{1/(α+2)}((2/(α + 2))
  x^{(α+2)/2})` solve `w″ + x^α w = 0`.
- For even `m ≥ 4`, `α = m − 2` and `x = (m/2)^{2/m} t` with `t > 0` (9.13.22–9.13.24):
  `U₁(x, α) = π^{1/2} (W_m(t) + W_m(−t)) / (2^{(m+2)/(2m)} Γ(1/m))` and
  `U₂(x, α) = π^{1/2} m^{2/m} (W_m(t) − W_m(−t)) / (2^{(m+2)/(2m)} Γ(−1/m))`. DLMF states these
  for positive integers `α`; `W_m` is defined for even `m` only.

The proof route: the equations by the chain rule from 9.13.1 and from the series; 9.13.18 from
9.13.9 and 9.13.11; 9.13.23–9.13.24 by comparing the series through `Complex.besselJ_def`.

*Needs:* 9.1–9.3; Mathlib `Complex.besselJ_def`.

### 9.5 Reid's contour integrals

DLMF 9.13.25–9.13.37. The integrand is `t^{−p} exp(z t − t³/3)` in the logarithmic variable
`t = e^w`, with `t^{−p} = e^{−pw}` and `Im w ∈ [0, 2π]` (DLMF's branch `0 ≤ ph t < 2π`, the ray
`Im w = 2π` being the upper edge). For angles `α`, `β` let `C(α, β)` be the path that comes in
along the ray `Im w = α` from `Re w = +∞` to `w = iα`, follows `w = iθ` from `θ = α` to `θ = β`,
and goes out along `Im w = β`. On the rays `t³` is real and positive, so all integrals below
converge absolutely. Then (`TauCeti.reidAiryA`, `reidAiryB0`, `reidAiryB`, through the integrand
`reidKernel` and the path integral `reidPath`):
- `A_k(z, p) = (2πi)⁻¹ ∫_{C(α_k, β_k)}` for every `p ∈ ℂ`, with `(α₁, β₁) = (4π/3, 2π/3)`,
  `(α₂, β₂) = (2π, 4π/3)` and `(α₃, β₃) = (2π/3, 0)`, the paths `ℒ₁`–`ℒ₃` of DLMF Figure 9.13.1
  (9.13.25);
- `B₀(z, p) = (2πi)⁻¹ ∮` over the positively oriented unit circle, for `p ∈ ℤ` (9.13.26);
- `B_k(z, p) = ∫₀^{∞ e^{2(k−1)πi/3}} t^{−p} exp(z t − t³/3) dt` along the ray, for integers
  `p ≤ 0` and `k = 1, 2, 3` (9.13.27).

For these functions:
- `A₁(z, 0) = Ai(z)`, `A₂(z, 0) = e^{2πi/3} Ai(z e^{2πi/3})`,
  `A₃(z, 0) = e^{−2πi/3} Ai(z e^{−2πi/3})`, `B₀(z, 0) = 0` and `B₁(z, 0) = π Hi(z)`
  (9.13.28–9.13.30);
- each of them is entire in `z` and solves `w‴ − z w′ + (p − 1) w = 0` (9.13.31);
- `f(p) = A_k(z, p)` satisfies `f(p − 3) − z f(p − 1) + (p − 1) f(p) = 0` for every `p`, and so do
  `B₀` for `p ∈ ℤ` and `B_k` for integers `p ≤ 0` (9.13.32);
- `A₂(z, p) = e^{−2(p−1)πi/3} A₁(z e^{2πi/3}, p)` and
  `A₃(z, p) = e^{2(p−1)πi/3} A₁(z e^{−2πi/3}, p)` (9.13.33);
- `A₁ + A₂ + A₃ + B₀ = 0` for `p ∈ ℤ` (9.13.34; `reidAiry_connection_sum`);
- `B₂ − B₃ = 2πi A₁`, `B₃ − B₁ = 2πi A₂` and `B₁ − B₂ = 2πi A₃` for integers `p ≤ 0`
  (9.13.35–9.13.37).

For integers `p ≥ 1` the ray integrals of 9.13.27 diverge at `t = 0`. With a Hadamard finite part
at `0` they define functions for which 9.13.36 holds only in the form
`B₃ − B₁ = 2πi (A₂ + B₀)`; this correction is recorded in the errata report of `lean-DLMF`. The
proof route: differentiation under the integral, and `d/dt (t^{1−p} exp(z t − t³/3))
= ((1 − p) t^{−p} + z t^{1−p} − t^{3−p}) exp(z t − t³/3)`, whose integral over each path is `0`,
for 9.13.31–9.13.32 (for `B_k` the term at `t = 0` vanishes because `p ≤ 0`); the substitution
`w ↦ w ± 2πi/3` for 9.13.33; and the additivity of paths with Cauchy's theorem for 9.13.34–9.13.37,
`t^{−p}` being single valued for `p ∈ ℤ` and entire for `p ≤ 0`; for 9.13.28–9.13.30, 2.1 and
9.12.20.

*Needs:* 2.1, 6.1; Mathlib parametric differentiation and contour deformation.

### Examples

- 9.13.5 at `n = 1` gives 9.2.3–9.2.6, and 9.13.8 at `n = 1` gives
  `(2/π) 3^{−1/2} sin(π/3) = 1/π`, which is 9.2.7.
- 9.13.34 at `p = 0` is 9.2.12, since `B₀(z, 0) = 0`.
- 9.13.9 at `n = 1` is the leading term of 9.7.5, with `√(1/(3π)) sin(π/3) = 1/(2√π)`.

### Dependencies

Layers 1–3 and 6; AsymptoticExpansions §§4.2–4.3, 8.2, 8.6, 10.2; Mathlib Bessel, Mellin
inversion and contour deformation; Tau Ceti `Real.besselI`.

## Downstream consumers

- **RandomMatrices** §8.4 consumes the Airy function `TauCeti.airyAi` with Airy's equation (1.2),
  the value `Ai(0)` (1.1), the recessive characterization and tail bounds (3.5–3.6), the integral
  representations (Layer 2), the uniform expansions on the real line (3.2, 3.4) and the Airy
  kernel (8.5).
- A Bessel-function roadmap (DLMF Chapter 10) consumes `Ai`, `Bi` with their connection formulas
  and expansions for the `K`, `Y` and Hankel relations of DLMF §9.6 and the uniform expansions of
  DLMF §10.20.
- Uniform expansions in terms of Airy functions, such as the turning-point theory of DLMF
  §§2.8(iii)–(iv), the Airy-function expansions of DLMF 2.4.21 and the large-parameter expansions
  of the parabolic cylinder functions (DLMF §12.10), consume `Ai`, `Bi`, `Gi`, `Hi` and their
  expansions from here, and the multiple-turning-point theory of DLMF §2.8(v) consumes the
  generalized Airy functions of Layer 9.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.
- **Relations through `K_ν`, `Y_ν`, the Hankel, Whittaker and `U` functions and the complex
  `I_ν`**: the `K`, `H` and complex `I` forms of DLMF 9.6.2–9.6.9, the relations 9.6.15–9.6.24,
  the modulus and phase 9.8.9–9.8.12 in terms of `J` and `Y`, the Scorer integrals 9.12.22–9.12.23
  of `K_{1/3}`, and the `K` forms of 9.13.2 and 9.13.4. They belong to a Bessel-function roadmap
  (DLMF Chapter 10) and a confluent hypergeometric roadmap (DLMF Chapter 13).
- **Exponentially improved and hyperasymptotic expansions** (DLMF 9.7.20–9.7.23), which rest on
  the remainder theory of DLMF §2.11.
- **The complex zeros of the Scorer functions** and the simplicity of the complex zeros of `Gi`
  and `Hi` (DLMF §9.12(ix)).
- **Reid's functions `B_k(z, p)` for integers `p ≥ 1`**, defined by finite parts, the integrals
  with an extra factor `(ln t)^q`, and the zeros and asymptotics of the generalized Airy functions
  (DLMF §9.13, the references there).
- **Numerically satisfactory solutions** (DLMF 9.2(iii), 9.12.8–9.12.10 and the remark after
  9.13.18), which is terminology rather than theorem.
- **Applications, computation, approximations, tables and software** (DLMF §§9.15–9.20), the
  decimal initial values of §§9.2(ii), 9.12(iii) and the tables 9.7.1, 9.9.1–9.9.4.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its
directory `DLMF/Airy/` provides source material for every layer, together with the general
asymptotic library under `DLMFMathlib/Analysis/Asymptotics/` and the Liouville–Green files under
`ToMathlib/Analysis/ODE/`, which are the source counterparts of the AsymptoticExpansions targets
consumed here. That development defines `Ai`, `Bi` by their Maclaurin series and `Hi` by its
Maclaurin series; this roadmap defines `Ai`, `Bi` through Mathlib's regularized `₀F₁` and `Hi` by
its Laplace integral, with the series as theorems. Its errata report
[`reports/DLMFErrata.tex`](https://github.com/bjbraams/lean-DLMF/blob/main/reports/DLMFErrata.tex)
records, with Lean proofs, the sign correction of DLMF 9.10.7 used in 7.3 and the correction of
9.13.36 for `p ≥ 1` noted in 9.5. C. Marín's
[`airy-bouncer-lean`](https://github.com/karlesmarin/airy-bouncer-lean) (Apache-2.0) formalizes
the real Airy function from its series recurrence, its oscillation on the negative axis and a
recessive solution built by reduction of order; it is prior work for 1.1–1.2 and 3.6, with a
different normalization.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source contains both proved theorems and admitted statements, and serves as a
reference, not as a specification. The following secondary provenance map records source
counterparts; the mathematical targets and dependencies are specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1. Definitions, equation | `Airy/Basic/{Maclaurin, Properties, Connections}`, `Airy/Equation`, `Airy/Framework`, `Airy/Bessel`, `Airy/Relations`, `Airy/Relations/*` |
| 2. Integral representations | `Airy/IntegralRepresentations`, `Airy/IntegralTools` |
| 3. Asymptotics | `Airy/Asymptotics`, `Airy/Asymptotics/*`, `Airy/ErrorBoundTools` |
| 4. Modulus and phase | `Airy/Basic/ModulusPhase`, `Airy/ModulusPhase`, `Airy/ModulusPhase/{PhaseExpansions, ReciprocalExpansions, Representations}`, `Airy/ModulusTools` |
| 5. Zeros | `Airy/Zeros/{RealAndAi, ComplexBi}` |
| 6. Scorer functions | `Airy/Basic/Scorer`, `Airy/Scorer`, `Airy/Scorer/*`, `Airy/ScorerAsymptotics` |
| 7. Integrals | `Airy/Integrals`, `Airy/Integrals/{HalfLineLaplace, PrimitivesAndLaplace}`, `Airy/StieltjesForm`, `Airy/Incomplete` |
| 8. Products | `Airy/Products`, `Airy/SquareTools` |
| 9. Generalized Airy functions | `Airy/Generalized`, `Airy/GeneralizedContours`, `Airy/GeneralizedFinitePart` |

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 9 (F. W. J. Olver),
  <https://dlmf.nist.gov/9>; and §5.5(iii) for the multiplication formula.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974, Chapter 11.
- O. Vallée and M. Soares, *Airy Functions and Applications to Physics*, Imperial College Press,
  2004.
- G. Nemes, Error bounds for the large-argument asymptotic expansions of the Hankel and Bessel
  functions, *Acta Appl. Math.* 150 (2017), 141–177.
- B. J. Laurenzi, Moment integrals of powers of Airy functions, *Z. Angew. Math. Phys.* 44
  (1993), 891–908.
- W. H. Reid, Integral representations for products of Airy functions, *Z. Angew. Math. Phys.*
  46 (1995), 159–170.
- C. A. Swanson and V. B. Headley, An extension of Airy's equation, *SIAM J. Appl. Math.* 15
  (1967), 1400–1412.
- F. W. J. Olver, Connection formulas for second-order differential equations with multiple
  turning points, *SIAM J. Math. Anal.* 8 (1977), 127–154; and General connection formulae for
  Liouville–Green approximations in the complex plane, *Philos. Trans. Roy. Soc. London Ser. A*
  289 (1978), 501–548.
- A. D. Smirnov, *Tables of Airy Functions and Special Confluent Hypergeometric Functions*,
  Pergamon Press, 1960.
- W. H. Reid, Composite approximations to the solutions of the Orr–Sommerfeld equation, *Studies
  in Appl. Math.* 51 (1972), 341–368; and P. G. Drazin and W. H. Reid, *Hydrodynamic Stability*,
  Cambridge University Press, 1981, Appendix.

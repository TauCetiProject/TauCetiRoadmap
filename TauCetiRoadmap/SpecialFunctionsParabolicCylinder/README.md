# Roadmap: Parabolic cylinder functions

**Summary.** This roadmap builds the theory of the parabolic cylinder functions of Chapter 12 of
the NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. These are the solutions of Weber's equation

```text
w″ − (z²/4 + a) w = 0                                              (DLMF 12.2.2)
```

and of its oscillatory form `w″ + (z²/4 − a) w = 0` (DLMF 12.2.3). The standard solutions are
Weber's functions `U(a, z)` and `V(a, z)`, Whittaker's `D_ν(z) = U(−ν − ½, z)`, and the real
solutions `W(a, ±x)` of the oscillatory equation.

The roadmap covers:
- the definitions as entire functions of both the parameter and the variable;
- the values at the origin, the Wronskians and the connection formulas;
- the recurrences and derivative formulas;
- the Hermite and complementary error function cases;
- the integral representations;
- the asymptotic expansions for large argument;
- the classical integrals and the addition theorems;
- the real solutions `W(a, ±x)`.

The general asymptotic and contour tools are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md): the asymptotic-expansion API, Watson's
lemma in sectors and along rotated rays, the vertical-line shift with simple poles, the
pole-separated bound for `Γ` on vertical strips and the exponential Mellin inversion. This
roadmap builds the derivative, differential equation and parameter theory of the regularized
Kummer function, and the Gamma product identities, Gamma residues and Barnes kernel bounds that
the Mellin–Barnes representations need.

Suggested home: `TauCeti/Analysis/SpecialFunctions/ParabolicCylinder/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/Erf.lean` and `TauCeti/Analysis/SpecialFunctions/Hermite/`.
Layer 1 extends Tau Ceti's `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`,
and the Gamma targets of 6.6 belong in `TauCeti/Analysis/SpecialFunctions/Gamma/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The regularized Kummer function.** For Mathlib's `Complex.regularizedHGFun {a} {b}`
   (written `𝐌(a, b, z)` below): the derivative formula, Kummer's differential equation,
   Kummer's transformation, analyticity in the parameters and the regularized polynomial cases.

2. **Weber's equation.** The even and odd solutions `u₁(a, z)`, `u₂(a, z)` are entire in `a`
   and `z`. This covers their power series, their parity and Wronskian, and uniqueness of the
   solution with given initial values.

3. **`U`, `V` and `D`.** The definitions, the values at the origin, the Wronskians, the
   connection formulas of DLMF §12.2, and the reduction of the general quadratic equation
   DLMF 12.2.1.

4. **Recurrences and derivatives** (DLMF §12.8).

5. **Hermite and error function cases** (DLMF 12.7.1–12.7.7). This includes the bridge to Tau
   Ceti's `hermiteFunction` and `Real.erfc`.

6. **Integral representations** (DLMF 12.5.1–12.5.9) and the positivity of `U(a, x)` on the real
   line for `a > −½`. This includes the Gamma product identities, Gamma residues and Barnes
   kernel bounds that support the Barnes representations.

7. **Large-argument asymptotics** (DLMF 12.9.1–12.9.4), and the characterization of `U(a, ·)`
   as the recessive solution on the positive real axis.

8. **Integrals and addition theorems** (DLMF 12.12.1–12.12.4 and 12.13.1–12.13.5).

9. **The real solutions `W(a, ±x)`.** This covers DLMF 12.14.1–12.14.8, the power series and
   Bessel cases DLMF 12.14.9–12.14.16, and the large-`x` expansions DLMF 12.14.17–12.14.23.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** Weber's equation and the following DLMF formulas, with the
hypotheses and conventions specified in the layers:

| Formulas | Targets |
|---|---|
| 12.2.1–12.2.20 | Equations, initial values, Wronskians, reflections and connections (Layers 2–3). |
| 12.2.21 | The abbreviation `Ū(a, z) = Γ(½ − a) V(a, z)` used in 8.1. |
| 12.4.1–12.4.6 | Definitions and power series (Layers 2–3). |
| 12.5.1–12.5.9 | Integral representations (Layer 6). |
| 12.7.1–12.7.7 | Hermite, Dawson and repeated Gaussian integral identities; the `erfc` identities 12.7.5–12.7.6 have real argument (Layer 5). |
| 12.7.12–12.7.13 | The Kummer definitions of the even and odd solutions (Layer 2). |
| 12.8.1–12.8.12 | Recurrences and derivatives (Layer 4). |
| 12.9.1–12.9.4 | Poincaré expansions with an `O`-remainder for every truncation order (Layer 7). |
| 12.12.1–12.12.4, 12.13.1–12.13.5 | Integrals and addition theorems (Layer 8). |
| 12.14.1–12.14.23 | The real solutions `W(a, ±x)`, including the large-variable expansions of §12.14(viii) (Layer 9). |

It also owns the following auxiliary results, which the layers need and which neither Mathlib,
Tau Ceti nor a consumed roadmap provides:

| Result | Target |
|---|---|
| Kummer's derivative formula, differential equation, transformation and parameter theory for `𝐌` | Layer 1 |
| Complex Dawson's integral `F` (DLMF 7.2.5) and the repeated Gaussian integrals `Hh_n` (related by scaling to DLMF §7.18) | 5.1, 5.3 |
| The product `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)²/\|Γ(x + iy)\|²` (DLMF 5.8.3) and `\|Γ(1 + iy)\|² = πy/sinh(πy)` | 6.6(a) |
| The residues of `Γ(z)` at `−n` and of `Γ(A − 2t)` at `(A + n)/2` | 6.6(b) |
| Bounds, integrability and connector decay for the Barnes kernels of `U` and `V` | 6.6(c) |
| The application of the rotated Laplace integrals of AsymptoticExpansions §4.3 to `U` | 7.1 |

**What it does not own:**
- The general asymptotic and contour tools: asymptotic expansions, Watson's lemma, the rotation
  of Laplace integrals, the line shift with simple poles, the pole-separated Gamma bound and the
  exponential Mellin inversion. They are consumed from AsymptoticExpansions; see
  [Exact supplier contracts](#exact-supplier-contracts).
- Residues and the residue theorem, consumed from ContourIntegration.
- Kummer's second function `U(a, b, z)` and the Whittaker functions, the confluent
  hypergeometric theory of DLMF Chapter 13, beyond Layer 1.
- The complex functions `erf`, `erfc` and the Faddeeva function `w(z)` (DLMF 7.2.1–7.2.3),
  and the rest of Chapter 7 beyond the `F` and `Hh_n` theory specified in Layer 5.
- DLMF 12.13.6, which uses complex `erfc`.
- Modified Bessel functions (DLMF Chapter 10).
- The uniform asymptotic expansions for large parameter and the zeros (DLMF §§12.10, 12.11,
  12.14(ix)).
- The modulus and phase functions (DLMF 12.2.22–12.2.23, 12.14(x)); the abbreviation of
  12.2.21 is included as specified above.
- The explicit remainder bounds and re-expansions of DLMF §12.9(ii), beyond the
  `O`-remainders required in Layer 7.
- The generalized equation of DLMF §12.15.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the specified fixed-parameter Weber theory,
Kummer extensions, Gamma product identities and residues, and Barnes kernel bounds; it consumes
the general asymptotic and contour tools of AsymptoticExpansions and excludes
large-parameter turning-point analysis, Airy functions, Kummer's second function, modified
Bessel functions and complex `erf`, `erfc` and Faddeeva theory.

## Conventions

- **Names and argument order.** All functions take the parameter first:
  `parabolicCylinderU (a z : ℂ) : ℂ`, `parabolicCylinderV (a z : ℂ) : ℂ`,
  `parabolicCylinderD (ν z : ℂ) : ℂ`. They live in the namespace `TauCeti`. The real
  solutions of the oscillatory equation are `TauCeti.Real.parabolicCylinderW (a x : ℝ) : ℝ`.
  Derivatives are Mathlib's `deriv`; no separate derivative functions are introduced.
- **Auxiliary names.** Dawson's integral is `TauCeti.dawson (z : ℂ) : ℂ`, and
  `Hh_n(z)` is `TauCeti.repeatedGaussianIntegral (n : ℕ) (z : ℂ) : ℂ`.
  The real initial-value factors are `TauCeti.Real.parabolicCylinderWZero (a : ℝ) : ℝ`
  and `TauCeti.Real.parabolicCylinderWDerivZero (a : ℝ) : ℝ`, equal to `W(a, 0)` and
  `deriv (parabolicCylinderW a) 0` respectively. The continuous phase `φ₂(a)` is
  `TauCeti.Real.gammaHalfPhase (a : ℝ) : ℝ`. Their definitions are specified below and in
  Layer 5; `parabolicCylinderWDerivZero` stores the scalar initial derivative.
- **The Kummer function.** `𝐌(a, b, z)` is `Complex.regularizedHGFun {a} {b} z`, Olver's
  regularized function `M(a, b, z) / Γ(b)`, which is entire in `a`, `b` and `z`. The
  unregularized `M(a, b, z)` is written `Gamma b * 𝐌(a, b, z)` and gets no definition.
- **Even and odd solutions** (DLMF 12.7.12, 12.7.13, 12.4.3, 12.4.4):

```text
u₁(a, z) = e^{−z²/4} · Γ(½) · 𝐌(a/2 + ¼, ½, z²/2)
u₂(a, z) = z e^{−z²/4} · Γ(3/2) · 𝐌(a/2 + ¾, 3/2, z²/2)
```

  These are `TauCeti.parabolicCylinderEven` and `TauCeti.parabolicCylinderOdd`.
- **`U` and `V` by their initial values.** Both are defined as combinations of `u₁` and `u₂`,
  with the Gamma factors written as reciprocals so that they are entire in `a`:

```text
U(a, z) = √π 2^{−(a/2+¼)} Γ(¾ + a/2)⁻¹ u₁(a, z) − √π 2^{−(a/2−¼)} Γ(¼ + a/2)⁻¹ u₂(a, z)
V(a, z) = π 2^{a/2+¼} Γ(¾ − a/2)⁻² Γ(¼ + a/2)⁻¹ u₁(a, z)
        + π 2^{a/2+¾} Γ(¼ − a/2)⁻² Γ(¾ + a/2)⁻¹ u₂(a, z)
D_ν(z) = U(−ν − ½, z)
```

  Here `Γ(s)⁻¹` is `(Complex.Gamma s)⁻¹`, which is `0` at the poles. The powers of `2` are
  principal `Complex.cpow`. These are the reciprocal-Gamma initial values of
  [DLMF 12.2.6–12.2.9](https://dlmf.nist.gov/12.2#ii), proved in Layer 3 for every `a`,
  including the parameters at which a reciprocal Gamma factor vanishes.
- **Weber's equation is not a predicate.** A solution is stated with explicit hypotheses
  `Differentiable ℂ f` and `∀ z, deriv^[2] f z = (z ^ 2 / 4 + a) * f z` (respectively
  `deriv^[2] f x = (a − x ^ 2 / 4) * f x` on `ℝ` for the oscillatory equation). The Wronskian
  is written out as `f z * deriv g z − deriv f z * g z`.
- **Powers and branches.** Every complex power `z ^ c` is the principal `Complex.cpow`.
  The adjacent-sector expansions DLMF 12.9.3–12.9.4 are both written in logarithmic coordinates
  `z = exp w`: the powers are expressed as `exp (c * w)`, with `w.re → +∞` while `w.im`
  ranges over the specified closed strip. The strips for 12.9.3 can cross the negative real
  axis; `w.im` is retained there without reduction to `Complex.arg (exp w)`. The strips for
  12.9.4 lie inside `−π < w.im < π`, so those expressions agree with principal powers.
- **Sectors at infinity.** "As `z → ∞` in `|ph z| ≤ θ`" is the filter
  `Bornology.cobounded ℂ ⊓ 𝓟 {z | |Complex.arg z| ≤ θ}`, written out in each statement. No
  filter or predicate is introduced for it.
- **Asymptotic expansions** are AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion l φ c f`,
  which unfolds to "for every `N`, the remainder after `N` terms is `O(φ N)`":
  `∀ N, (fun z ↦ f z − ∑ s ∈ range N, φ s z • c s) =O[l] φ N`. The adjacent-sector expansions
  DLMF 12.9.3–12.9.4, with two exponential envelopes, are generalized expansions in that
  roadmap's sense and are written out. No further predicate is introduced.
- **The real solution `W`** (DLMF 12.14.1, 12.14.2, 12.14.8, 12.14.15, 12.14.16). For real `a`:

```text
W(a, 0)  =  2^{−3/4} |Γ(¼ + ia/2) / Γ(¾ + ia/2)|^{1/2}
W′(a, 0) = −2^{−1/4} |Γ(¾ + ia/2) / Γ(¼ + ia/2)|^{1/2}
W(a, x)  = Re( W(a, 0) u₁(−ia, e^{iπ/4} x) + W′(a, 0) e^{−iπ/4} u₂(−ia, e^{iπ/4} x) )
```

  The two functions `x ↦ u₁(−ia, e^{iπ/4}x)` and `x ↦ e^{−iπ/4} u₂(−ia, e^{iπ/4}x)` are the even
  and odd solutions of `w″ + (x²/4 − a) w = 0` with initial values `(1, 0)` and `(0, 1)`. They
  are real on `ℝ`, so the real part loses nothing; Layer 9 proves this.
- **The phase of `Γ(½ + ia)`** (DLMF 12.14.7) is `φ₂(a) = ∫₀^a Re ψ(½ + it) dt`, with Mathlib's
  `Complex.digamma`. It is the continuous branch of `ph Γ(½ + ia)` with `φ₂(0) = 0`. The
  identity `Γ(½ + ia) = |Γ(½ + ia)| e^{iφ₂(a)}` is part of Layer 9.

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

The following are consumed with the hypotheses and conventions stated there.
- The expansion notion `Asymptotics.HasAsymptoticExpansion` along a filter and an asymptotic
  scale ([its Conventions](../AsymptoticExpansions/README.md#conventions)), through which Layers 7
  and 9 state their Poincaré expansions.
- Watson's lemma on the real line and in a sector,
  [§3.3](../AsymptoticExpansions/README.md#33-watsons-lemma-on-the-real-line) and
  [§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector), and the rotation of the
  path, [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path): the integrals along
  rotated rays, written in logarithmic coordinates `z = exp ζ`, are holomorphic, agree on
  overlapping strips, and have the expansion of Watson's lemma in each closed substrip. 7.1
  applies §4.3 to the integrand of DLMF 12.5.1.
- The line shift with simple poles, vanishing horizontal connectors and its iteration over
  infinitely many lines, [§8.2](../AsymptoticExpansions/README.md#82-shifting-the-line), with each
  residue given by the holomorphic numerator `φ(p)` of `F(t) = φ(t)/(t − p)`; used for the Barnes
  integrals of 6.7.
- The pole-separated bound `|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` on vertical strips and its
  corollaries, [§8.6](../AsymptoticExpansions/README.md#86-the-gamma-function-on-vertical-strips),
  which that roadmap derives from ZerosOfLFunctions §1.3 (DLMF 5.11.9).
- The exponential Mellin inversion `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}` for `c > 0`,
  `Re w > 0`, with absolute convergence,
  [§8.7](../AsymptoticExpansions/README.md#87-exponential-mellin-inversion).

6.6 adds only what is particular to Gamma and to the Barnes kernels.

### From [ContourIntegration](../../Completed/ContourIntegration/README.md), implemented in Tau Ceti

Residues and the residue theorem, in
`TauCeti/Analysis/Contour/Residue/{Basic,SimplePole,Theorem}.lean` (Layer 2 of ContourIntegration):
`TauCeti.Contour.residue`, `TauCeti.Contour.residue_div_sub_pow_of_analyticAt`,
`TauCeti.Contour.residue_eq_of_tendsto_sub_mul` and the classical residue theorem. 6.6(b) computes
the residues of Gamma and of the Barnes kernels with this API; it defines no new residue notion.

### From Tau Ceti

- **Regularized hypergeometric series.** Tau Ceti's
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean)
  supplies the `HasSum` statement whenever `a.card ≤ b.card`, including the singleton case of 1.1.
- **Gamma.** `TauCeti/Analysis/SpecialFunctions/Gamma.lean` provides `Real.continuous_inv_Gamma`,
  `Real.exists_abs_inv_Gamma_le` and `Real.Gamma_nat_add_half_eq_factorial`, for the series and
  special-value arguments.
- **Hermite.** `Polynomial.derivative_hermite`, `Polynomial.hermite_add_two` and
  `Polynomial.hermite_aeval_neg` (`TauCeti/RingTheory/Polynomial/Hermite/Derivative.lean`), and the
  Hermite function `TauCeti.hermiteFunction n x = He_n(x√2) e^{−x²/2} / √(n! √π)`
  (`TauCeti/Analysis/SpecialFunctions/Hermite/`). Layer 5 relates them to `D_n` and changes nothing
  in them.
- **Real error function.** `TauCeti.Real.erf`, `TauCeti.Real.erfc`, with derivatives, parity and
  monotonicity (`TauCeti/Analysis/SpecialFunctions/Erf.lean`), consumed in Layer 5 and in 8.3. The
  complex error function is not built here: DLMF 12.7.5 is proved for real argument, and the
  complex form is stated through the repeated integral `Hh_n` of 5.3, which needs no error
  function.
- **Laplace transforms.**
  [`TauCeti/Analysis/Complex/LaplaceTransform.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/Complex/LaplaceTransform.lean)
  provides `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` and
  `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`, with integrability and tail estimates. The
  latter assumes a measurable, bounded kernel on `[0, ∞)`; consume it in 6.1 where those hypotheses
  hold. The Laplace integrals with an integrable singularity at zero in Layer 7 are covered by
  AsymptoticExpansions §§4.2–4.3.

### From Mathlib

- **Regularized hypergeometric series.** `Complex.regularizedHGFun`,
  `Complex.regularizedHGFunCoeff` (the coefficient `(a)_n / (n! Γ(b + n))`),
  `Complex.regularizedHGFunSeries`, `Complex.regularizedHGFun_zero`,
  `Complex.radius_regularizedHGFunSeries_eq_top`,
  `Complex.analyticOnNhd_regularizedHGFun_of_card_le`, `Complex.regularizedHGFunCoeff_add_one` and
  `Complex.regularizedHGFun_zero_zero` (`₀F₀ = exp`), in
  [`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.html).
  Mathlib proves convergence and analyticity in `z`; Layer 1 builds the Kummer derivative formula,
  differential equation and parameter theory on top.
- **Gamma.** `Complex.Gamma`, `Complex.differentiable_one_div_Gamma`,
  `Complex.Gamma_mul_Gamma_one_sub` (reflection), `Complex.Gamma_mul_Gamma_add_half`
  (duplication), `Complex.Gamma_one_half_eq`, `Complex.Gamma_conj`, `Complex.Gamma_eq_integral`,
  `Complex.GammaSeq_tendsto_Gamma`, `Complex.Gamma_add_one`,
  `Complex.tendsto_self_mul_Gamma_nhds_zero`, `Complex.digamma` (`logDeriv Gamma`), and
  `ascPochhammer`.
- **Bessel functions.** `Complex.besselJ`, for the Bessel cases DLMF 12.14.13–12.14.14 of 9.6.
- **Hermite.** The probabilists' `Polynomial.hermite` and `deriv_gaussian_eq_hermite_mul_gaussian`.
- **Integration.** `integral_gaussian_complex`, `MeasureTheory.integral` on `Set.Ioi`,
  `intervalIntegral`, `circleIntegral`, and parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).
- **Contour deformation.**
  [`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Complex/CauchyIntegral.html#Complex.integral_boundary_rect_eq_zero_of_differentiableOn)
  and the unbounded-rectangle deformation theorems in the same file, through the line shift of
  AsymptoticExpansions §8.2.
- **Mellin inversion.**
  [`mellinInv_mellin_eq`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/MellinInversion.html#mellinInv_mellin_eq),
  with `MellinConvergent` and
  [`Complex.VerticalIntegrable`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/MellinTransform.html#Complex.VerticalIntegrable),
  through the exponential Mellin inversion of AsymptoticExpansions §8.7.
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsLittleO`, `Asymptotics.IsEquivalent`,
  `Bornology.cobounded` and `Complex.arg`.

## How to read the build

Layers 1–5 are the algebraic and differential-equation theory and need no integrals beyond Gaussian
ones: the Kummer function (1) gives the even and odd solutions and their uniqueness theorem (2),
these give `U`, `V` and `D` with their initial values, Wronskians and connection formulas (3), the
recurrences (4), and the Hermite, Dawson and repeated-integral cases (5). Layer 6 starts from the
Laplace form 6.1, which rests on Layers 2–5, and 6.6 and 6.7 add the Mellin–Barnes integrals on top
of AsymptoticExpansions §§8.2, 8.6 and 8.7. Layer 7 obtains 12.9.1 for `Re a > −½` from 6.1 and
AsymptoticExpansions §4.3, extends it to all `a` by the recurrences of Layer 4, and obtains the
other sectors by the connection formulas of 3.5. Layers 8 and 9 use the Laplace form and the
expansions of Layer 7. The `### Examples` of each layer are statements to prove, and they test the
conventions on explicit parameters.

## Layer 1: the regularized Kummer function

Write `𝐌(a, b, z) = Complex.regularizedHGFun {a} {b} z`.

### 1.1 Series (consume)

Specialize Tau Ceti's `Complex.hasSum_regularizedHGFun` to singleton parameter multisets to obtain
`HasSum (fun n ↦ regularizedHGFunCoeff {a} {b} n * z ^ n) (𝐌(a, b, z))` for all `a, b, z`
with absolute convergence from the existing entire power series. The
initial value `𝐌(a, b, 0) = Γ(b)⁻¹` is Mathlib's `Complex.regularizedHGFun_zero`.

*Needs:* Tau Ceti `Complex.hasSum_regularizedHGFun`; Mathlib `Complex.regularizedHGFun_zero`.

### 1.2 Derivative

`HasDerivAt (𝐌(a, b, ·)) (a * 𝐌(a + 1, b + 1, z)) z` for all `a, b, z`
(`hasDerivAt_regularizedHGFun_singleton`). This is [DLMF 13.3.15](https://dlmf.nist.gov/13.3#E15)
divided by `Γ(b)`, extended to every `b` through the regularized series.

*Needs:* 1.1; termwise differentiation of the entire series.

### 1.3 Kummer's equation

[DLMF 13.2.1](https://dlmf.nist.gov/13.2#E1), as
`regularizedHGFun_kummer_equation`, for all `a, b, z`:

`z 𝐌″(a, b, z) + (b − z) 𝐌′(a, b, z) − a 𝐌(a, b, z) = 0`,

stated with `deriv (deriv _)` and `deriv`. The proof route is termwise differentiation of
the entire series and the coefficient recurrence `(k + 1)(b + k) c_{k+1} = (a + k) c_k` for
`c_k = regularizedHGFunCoeff {a} {b} k`. Mathlib's `regularizedHGFunCoeff_add_one` gives it
when `b + k ≠ 0`; when `b + k = 0` both sides vanish, because `Γ(0)⁻¹ = 0` gives `c_k = 0`.

*Needs:* 1.1–1.2; Mathlib `regularizedHGFunCoeff_add_one` and `Complex.Gamma_neg_nat_eq_zero`.

### 1.4 Kummer's transformation

DLMF 13.2.39: `𝐌(a, b, z) = e^z 𝐌(b − a, b, −z)` (`regularizedHGFun_singleton_eq_exp_mul`).

*Needs:* 1.1; Cauchy products of entire power series and Pochhammer identities.

### 1.5 Analyticity in the parameters

[DLMF §13.2(i)](https://dlmf.nist.gov/13.2#i),
following 13.2.4. For fixed `b, z`, `a ↦ 𝐌(a, b, z)` is entire
(`differentiable_regularizedHGFun_singleton_left`). For fixed
`a, z`, `b ↦ 𝐌(a, b, z)` is entire. The function `(a, z) ↦ 𝐌(a, b, z)` is continuous on
`ℂ × ℂ`. The proof route is locally uniform convergence of the series in `(a, b, z)`.

*Needs:* 1.1; Mathlib `TendstoLocallyUniformlyOn.differentiableOn`.

### 1.6 Polynomial cases

[DLMF §13.2(i)](https://dlmf.nist.gov/13.2#i), following 13.2.5.
For `n : ℕ` and every `b`, including nonpositive integral `b`,
`𝐌(−n, b, z) = ∑_{k≤n} (−n)_k z^k / (k! Γ(b + k))`, the finite sum of the regularized
series 13.2.3; in particular it is a polynomial in `z` of degree at most `n`.

*Needs:* 1.1; Mathlib `regularizedHGFunCoeff_eq_zero_right` and `ascPochhammer`.

### Examples

- `𝐌(a, a, z) = Γ(a)⁻¹ e^z` for every `a`, from `₀F₀ = exp`; both sides vanish at the poles
  of `Γ`. The derivative formula of 1.2 then reads `a Γ(a + 1)⁻¹ e^z = Γ(a)⁻¹ e^z`.
- `𝐌(0, b, z) = Γ(b)⁻¹`, and by the previous example at `a = b` Kummer's transformation 1.4 at
  `a = 0` reads `Γ(b)⁻¹ = e^z · Γ(b)⁻¹ e^{−z}`.
- By 1.6, `𝐌(−1, b, z) = Γ(b)⁻¹ − z Γ(b + 1)⁻¹`, which is `−z` at `b = 0`. It satisfies
  Kummer's equation with `a = −1` because `b Γ(b + 1)⁻¹ = Γ(b)⁻¹` for every `b`.

### Dependencies

Mathlib's regularized hypergeometric series (including `regularizedHGFunCoeff_add_one`),
reciprocal Gamma and Pochhammer APIs;
Tau Ceti's `Complex.hasSum_regularizedHGFun`.

## Layer 2: Weber's equation and its even and odd solutions

### 2.1 Definitions and series

`u₁ = parabolicCylinderEven` and `u₂ = parabolicCylinderOdd` as pinned. The power series DLMF
12.4.3–12.4.6 hold as `HasSum` statements for all `a, z`:
- `u₁(a, z) = e^{−z²/4} ∑ₖ (∏_{r<k} (a + ½ + 2r)) z^{2k} / (2k)!` (`hasSum_parabolicCylinderEven`);
- `u₂(a, z) = e^{−z²/4} ∑ₖ (∏_{r<k} (a + 3/2 + 2r)) z^{2k+1} / (2k+1)!`;
- `u₁(a, z) = e^{z²/4} ∑ₖ (∏_{r<k} (a − ½ − 2r)) z^{2k} / (2k)!` (12.4.5);
- `u₂(a, z) = e^{z²/4} ∑ₖ (∏_{r<k} (a − 3/2 − 2r)) z^{2k+1} / (2k+1)!` (12.4.6).

**Checks.**
- `u₁(−½, z) = e^{−z²/4}` and `u₂(−3/2, z) = z e^{−z²/4}`: the products in the first two series
  vanish from `k = 1` on; a sign error in `a + ½ + 2r` or `a + 3/2 + 2r` leaves an infinite series.
- `u₁(½, z) = e^{z²/4}`, from the third series; it fixes the sign of `a − ½ − 2r` in 12.4.5.
- `u₁(a, 0) = 1` and `u₂′(a, 0) = 1` for every `a`; they fix the factors `Γ(½)` and `Γ(3/2)` in the
  Kummer forms.

*Needs:* 1.1; the exponential series.

### 2.2 Analyticity

[DLMF §12.2(i)](https://dlmf.nist.gov/12.2#i) and
[12.7.12–12.7.13](https://dlmf.nist.gov/12.7#E12).
`u₁` and `u₂` are entire in `z` for fixed `a` and entire in `a` for fixed
`z`, and jointly continuous.

*Needs:* 1.5.

### 2.3 Weber's equation

DLMF 12.2.2. `u₁(a, ·)` and `u₂(a, ·)` solve it (`deriv_deriv_parabolicCylinderEven`,
`deriv_deriv_parabolicCylinderOdd`), with initial values
`u₁(a, 0) = 1`, `u₁′(a, 0) = 0`, `u₂(a, 0) = 0`, `u₂′(a, 0) = 1`. Parity:
`u₁(a, −z) = u₁(a, z)` and `u₂(a, −z) = −u₂(a, z)`.

*Needs:* 1.2–1.3 and the chain rule.

### 2.4 Wronskian and uniqueness

- The Wronskian of any two solutions of DLMF 12.2.2 is constant.
- `u₁ u₂′ − u₁′ u₂ = 1` (`parabolicCylinderEven_mul_deriv_sub`).
- A solution with `f 0 = 0` and `deriv f 0 = 0` is `0`.
- Hence every solution equals `f 0 · u₁(a, ·) + f′(0) · u₂(a, ·)`
  (`eq_parabolicCylinderEven_add_parabolicCylinderOdd`).

The constancy of the Wronskian is Abel's identity [DLMF 1.13.5](https://dlmf.nist.gov/1.13#E5) with
`f = 0`, and the uniqueness of the solution with prescribed `w` and `w′` at a point, with the
fundamental pair 1.13.2–1.13.3, is stated in [DLMF §1.13(i)](https://dlmf.nist.gov/1.13#i).
Differentiate the Wronskian and use the equation to show its derivative is zero. For uniqueness,
write the Taylor coefficients of a solution at zero as `c_n`; they satisfy
`(n + 2)(n + 1)c_{n+2} = a c_n + c_{n−2}/4`, where negative-index coefficients are zero. Zero
initial values force every coefficient to vanish, and the identity theorem extends the equality to
`ℂ`. This supplies a direct analytic proof without another ODE prerequisite.

*Needs:* 2.2–2.3; Mathlib analytic Taylor series and
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

### 2.5 Rotations

By the chain rule in [DLMF 12.2.2–12.2.3](https://dlmf.nist.gov/12.2#E2): if `f` solves DLMF 12.2.2
with parameter `a`, then `z ↦ f (−z)` solves it with parameter `a`, and `z ↦ f (± i z)` solves it
with parameter `−a`. The same holds for `z ↦ f (e^{±iπ/4} z)` relating DLMF 12.2.2 with parameter
`∓ia` to DLMF 12.2.3 with parameter `a`.

*Needs:* 2.3 and the chain rule.

### Examples

- At `a = −½` the third series of 2.1 gives `u₁(−½, z) = e^{z²/4} ∑ₖ (−1)^k z^{2k}/(2^k k!)`, the
  same function as the terminating first series.
- `(e^{−z²/4})″ = (z²/4 − ½) e^{−z²/4}` and `(z e^{−z²/4})″ = (z²/4 − 3/2) z e^{−z²/4}`, the
  equation 2.3 at `a = −½` and `a = −3/2`.

### Dependencies

Layer 1; Mathlib complex differentiation,
analytic Taylor series and the identity theorem. 2.3 follows by the chain rule from
1.2–1.3; 2.4 uses the initial values and the entire solutions of 2.2–2.3.

## Layer 3: `U`, `V` and `D`

### 3.1 Definitions

`parabolicCylinderU`, `parabolicCylinderV` and `parabolicCylinderD` as pinned. `U(a, ·)`, `V(a, ·)`
and `D_ν` solve DLMF 12.2.2 (DLMF 12.2.4 for
`D_ν`). All three are entire in each variable separately and jointly continuous; for `U` the two
entirety statements are `differentiable_parabolicCylinderU` and
`differentiable_parabolicCylinderU_left`.

*Needs:* 2.2–2.3; Mathlib `Complex.differentiable_one_div_Gamma`.

### 3.2 Values at the origin

DLMF 12.2.6–12.2.9. These are `U(a, 0)` (`parabolicCylinderU_zero_right`), `U′(a, 0)`, `V(a, 0)`
and `V′(a, 0)` in the pinned reciprocal-Gamma forms, valid for every `a` with Mathlib's
totalized Gamma function.

**Checks.**
- `U′(½, 0) = −1`; the opposite sign of the coefficient of `u₂` gives `+1`. (`U′(−½, 0) = 0` does
  not detect that sign, because the coefficient vanishes there.)
- `U(−½, z) = e^{−z²/4}` and `U(−3/2, z) = z e^{−z²/4}`: the coefficient of `u₂`, respectively of
  `u₁`, vanishes because `Γ(0)⁻¹ = 0`.
- `V(½, z) = √(2/π) e^{z²/4}`, since the coefficient of `u₂` contains `Γ(0)⁻² = 0`.
- `D₂(z) = (z² − 1) e^{−z²/4}`; the physicists' Hermite convention would give
  `(4z² − 2) e^{−z²/4}`.

*Needs:* 3.1 and the initial values of 2.3.

### 3.3 Wronskians

DLMF 12.2.10–12.2.12:
- `𝒲{U(a, z), V(a, z)} = √(2/π)` (`parabolicCylinderU_mul_deriv_parabolicCylinderV_sub`);
- `𝒲{U(a, z), U(a, −z)} = √(2π) / Γ(½ + a)`
  (`parabolicCylinderU_mul_deriv_parabolicCylinderU_neg_sub`);
- `𝒲{U(a, z), U(−a, ±iz)} = ∓i e^{±iπ(a/2 + ¼)}`
  (`parabolicCylinderU_mul_deriv_parabolicCylinderU_mul_I_sub` and
  `parabolicCylinderU_mul_deriv_parabolicCylinderU_mul_neg_I_sub`; see
  [DLMF 12.2.12](https://dlmf.nist.gov/12.2#E12)). In particular, the upper sign is
  `𝒲{U(a, z), U(−a, iz)} = −i e^{iπ(a/2 + ¼)}`.

Each holds for all `a` and `z`. In particular `U(a, ·)` and `V(a, ·)` are linearly
independent for every `a`.

*Needs:* 2.4, 2.5 and 3.2; Mathlib `Complex.Gamma_mul_Gamma_one_sub` and
`Complex.Gamma_mul_Gamma_add_half`.

### 3.4 Special parameters

DLMF 12.2.13, 12.2.14: `U(−n − ½, −z) = (−1)ⁿ U(−n − ½, z)` and
`V(n + ½, −z) = (−1)ⁿ V(n + ½, z)` for `n : ℕ`.

*Needs:* 2.3 and 3.2.

### 3.5 Connection formulas

[DLMF 12.2.15–12.2.20](https://dlmf.nist.gov/12.2#v). In each
formula the upper signs are chosen together, and the lower signs are chosen together.
All statements hold for every `z : ℂ`:
- **12.2.15** (`parabolicCylinderU_neg`), for every `a`:
  `U(a, −z) = −sin(πa) U(a, z) + π/Γ(½ + a) · V(a, z)`.
- **12.2.16**, for every `a`:
  `V(a, −z) = cos(πa)/Γ(½ − a) · U(a, z) + sin(πa) V(a, z)`.
- **12.2.17** (`parabolicCylinderU_connection_mul_I`), for `½ + a ∉ {0, −1, −2, …}`:
  `√(2π) U(−a, ±iz) = Γ(½ + a) (e^{∓iπ(a/2 − ¼)} U(a, z) + e^{±iπ(a/2 − ¼)} U(a, −z))`.
- **12.2.18** (`parabolicCylinderU_connection_rotations`), for `½ − a ∉ {0, −1, −2, …}`:
  `√(2π) U(a, z) = Γ(½ − a) (e^{∓iπ(a/2 + ¼)} U(−a, ±iz) + e^{±iπ(a/2 + ¼)} U(−a, ∓iz))`.
- **12.2.19** (`parabolicCylinderU_eq_neg_add_rotation`), for every `a`:
  `U(a, z) = ±i e^{±iπa} U(a, −z) + √(2π)/Γ(½ + a) · e^{±iπ(a/2 − ¼)} U(−a, ±iz)`.
- **12.2.20** (`parabolicCylinderV_eq_add_rotation`), for every `a`:
  `V(a, z) = ∓i/Γ(½ − a) · U(a, z) + √(2/π) e^{∓iπ(a/2 − ¼)} U(−a, ±iz)`.

The reciprocal-Gamma coefficients in 12.2.15, 12.2.16, 12.2.19 and 12.2.20 are interpreted
as pinned, including their zeros. The Gamma factors multiplying brackets in 12.2.17 and
12.2.18 require the stated exclusions. Their reciprocal-Gamma rearrangements are targets
for every `a, z : ℂ`, with the same correlated signs:
- `√(2π)/Γ(½ + a) · U(−a, ±iz) = e^{∓iπ(a/2 − ¼)} U(a, z) + e^{±iπ(a/2 − ¼)} U(a, −z)`
  (`parabolicCylinderU_connection_mul_I_reciprocal`);
- `√(2π)/Γ(½ − a) · U(a, z) = e^{∓iπ(a/2 + ¼)} U(−a, ±iz) + e^{±iπ(a/2 + ¼)} U(−a, ∓iz)`
  (`parabolicCylinderU_connection_rotations_reciprocal`).

These entire identities include the parameters at which the reciprocal Gamma factor vanishes.
Also prove the rearrangement of 12.2.15,
`V(a, z) = Γ(½ + a)/π · (sin(πa) U(a, z) + U(a, −z))`, for
`½ + a ∉ {0, −1, −2, …}`.

*Needs:* 2.4, 2.5 and 3.2–3.3; Mathlib Gamma reflection and duplication.

### 3.6 The general quadratic equation

DLMF 12.2.1 and the prose of §12.2(i). For `α ≠ 0`
and `s` with `s⁴ = −4α`, if `f` solves DLMF 12.2.2 with parameter `(β²/(4α) − γ)/s²`, then
`z ↦ f (s (z + β/(2α)))` solves `w″ + (αz² + βz + γ) w = 0` (`quadratic_equation_of_weber`).

*Needs:* The chain rule.

### 3.7 Oscillatory equation

DLMF 12.2.3. `z ↦ U(ia, z e^{−iπ/4})` and
`z ↦ U(−ia, z e^{iπ/4})` solve DLMF 12.2.3. In Whittaker's notation the first is
`D_{−½−ia}(z e^{−iπ/4})`.

*Needs:* 2.5 and 3.1.

### Examples

- At `a = −½`, `Γ(0)⁻¹ = 0`: 12.2.11 gives `𝒲{U(−½, z), U(−½, −z)} = 0`, as the evenness of
  `e^{−z²/4}` requires, and 12.2.15 reduces to `U(−½, −z) = U(−½, z)`, which is also 3.4 at
  `n = 0`.
- `V(½, z) = √(2/π) u₁(½, z)`, since the coefficient of `u₂` contains `Γ(0)⁻² = 0`.

### Dependencies

Layer 2; Mathlib Gamma reflection, duplication and reciprocal Gamma analyticity.

## Layer 4: recurrences and derivatives

### 4.1 `U` recurrences

DLMF 12.8.1–12.8.4, for all `a, z`:
- `z U(a, z) − U(a − 1, z) + (a + ½) U(a + 1, z) = 0` (`parabolicCylinderU_recurrence`);
- `U′(a, z) + (z/2) U(a, z) + (a + ½) U(a + 1, z) = 0` (`deriv_parabolicCylinderU`);
- `U′(a, z) − (z/2) U(a, z) + U(a − 1, z) = 0`;
- `2U′(a, z) + U(a − 1, z) + (a + ½) U(a + 1, z) = 0`.

*Needs:* 2.4 and 3.2; Mathlib `Complex.Gamma_add_one`.

### 4.2 `V` recurrences

DLMF 12.8.5–12.8.8, for all `a, z`:
- `z V(a, z) − V(a + 1, z) + (a − ½) V(a − 1, z) = 0`;
- `V′(a, z) − (z/2) V(a, z) − (a − ½) V(a − 1, z) = 0`;
- `V′(a, z) + (z/2) V(a, z) − V(a + 1, z) = 0`;
- `2V′(a, z) − V(a + 1, z) − (a − ½) V(a − 1, z) = 0`.

*Needs:* 2.4 and 3.2; Mathlib `Complex.Gamma_add_one`.

### 4.3 Iterated derivatives

DLMF 12.8.9–12.8.12. For `m : ℕ`:
- `(d/dz)^m (e^{z²/4} U(a, z)) = (−1)^m (½ + a)_m e^{z²/4} U(a + m, z)`
  (`iteratedDeriv_exp_mul_parabolicCylinderU`);
- `(d/dz)^m (e^{−z²/4} U(a, z)) = (−1)^m e^{−z²/4} U(a − m, z)`;
- `(d/dz)^m (e^{z²/4} V(a, z)) = e^{z²/4} V(a + m, z)`;
- `(d/dz)^m (e^{−z²/4} V(a, z)) = (−1)^m (½ − a)_m e^{−z²/4} V(a − m, z)`.

The Pochhammer symbol is `(ascPochhammer ℂ m).eval (½ + a)`, and the iterated derivative is
Mathlib's `iteratedDeriv`.

*Needs:* 4.1–4.2; Mathlib `iteratedDeriv_succ` and `ascPochhammer_succ_right`.

### 4.4 Whittaker's notation

The recurrences in Whittaker's notation:
`D_{ν+1}(z) − z D_ν(z) + ν D_{ν−1}(z) = 0` and `D_ν′(z) + (z/2) D_ν(z) − ν D_{ν−1}(z) = 0`.

*Needs:* 4.1.

### Examples

- At `a = −½`, with `U(−½, z) = e^{−z²/4}` and `U(−3/2, z) = z e^{−z²/4}`, the first identity of
  4.1 reads `z U(−½, z) = U(−3/2, z)`, and the third gives `U′(−½, z) = −(z/2) e^{−z²/4}`.
- The second identity of 4.3 at `m = 1`, `a = −½`: `(e^{−z²/2})′ = −z e^{−z²/2}`.
- 4.4 at `ν = 1`: `D₂ − z D₁ + D₀ = 0` is `(z² − 1) − z² + 1 = 0` after cancelling `e^{−z²/4}`.

### Dependencies

Layers 1–3; Gamma recurrence and Mathlib `iteratedDeriv`.

## Layer 5: Hermite and error function cases

### 5.1 Hermite cases

DLMF 12.7.1–12.7.4. For `n : ℕ`:
- `U(−½, z) = e^{−z²/4}` (`parabolicCylinderU_neg_one_half`);
- `D_n(z) = U(−n − ½, z) = e^{−z²/4} He_n(z)` (`parabolicCylinderD_natCast`);
- `V(n + ½, z) = √(2/π) e^{z²/4} (−i)ⁿ He_n(iz)`;
- `V(−½, z) = 2/√π · e^{z²/4} F(z/√2)` (`parabolicCylinderV_neg_one_half`).

Here `He_n(z)` is `aeval z (Polynomial.hermite n)`, and `F` is Dawson's integral
`F(z) = e^{−z²} ∫₀¹ z e^{(sz)²} ds`. This roadmap introduces `F` as `dawson`, an entire function
(`differentiable_dawson`), with `F′ = 1 − 2zF` (`hasDerivAt_dawson`) and `F(0) = 0`.

**Checks.**
- `F(z) = z − 2z³/3 + O(z⁵)` as `z → 0`.
- `F(−z) = −F(z)`.
- `F(iy) = i (√π/2) e^{y²} erf y` for real `y`, with `TauCeti.Real.erf`; this distinguishes `F` from
  `e^{z²} ∫₀^z e^{−t²} dt`.

*Needs:* 2.4, 3.2 and 4.1; Mathlib `Polynomial.hermite` and
`deriv_gaussian_eq_hermite_mul_gaussian`; Tau Ceti `Polynomial.derivative_hermite` and
`Polynomial.hermite_add_two`; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le` for `F`.

### 5.2 The Hermite function bridge

For real `x`,
`TauCeti.hermiteFunction n x = (D_n(√2 x)).re / √(n! √π)` (`hermiteFunction_eq_parabolicCylinderD`),
and `D_n(√2 x)` is real.

*Needs:* 5.1; Tau Ceti `TauCeti.hermiteFunction`.

### 5.3 The repeated Gaussian integrals

DLMF 12.7.7. The family is indexed by `n : ℕ`:
`Hh_n(z) = repeatedGaussianIntegral n z = ∫₀^∞ tⁿ/n! · e^{−(z+t)²/2} dt` for `z : ℂ`, using
`MeasureTheory.integral` over `Set.Ioi 0`. The notation `Hh_{−1}(z)` abbreviates `e^{−z²/2}`; it is
not an additional integer-indexed function. Build the following basic API:
- absolute convergence of the defining integral for every `n, z`, and entirety of `Hh_n` in `z`
  (`differentiable_repeatedGaussianIntegral`);
- `Hh₀′(z) = −e^{−z²/2}` and `Hh_{n+1}′(z) = −Hh_n(z)` for `n : ℕ`
  (the second is `hasDerivAt_repeatedGaussianIntegral_succ`);
- `Hh₁(z) = e^{−z²/2} − z Hh₀(z)` and
  `(n + 2) Hh_{n+2}(z) = Hh_n(z) − z Hh_{n+1}(z)` for `n : ℕ` (`repeatedGaussianIntegral_add_two`);
- `Hh_n(0) = 2^{(n−1)/2} Γ((n + 1)/2) / n!`, and reality and positivity of `Hh_n(x)` for real `x`
  (`repeatedGaussianIntegral_ofReal_pos`);
- `U(n + ½, z) = e^{z²/4} Hh_n(z)` for `n : ℕ` (`parabolicCylinderU_nat_add_one_half`). The
  `n = −1` case of DLMF 12.7.7 is the identity `U(−½, z) = e^{−z²/4}` in 5.1.

**Checks.**
- `Hh₀(x) = √(π/2) erfc(x/√2)` for real `x`, which fixes the sign of `z` in `(z + t)²`.
- `Hh₀(0) = √(π/2)`, `Hh₁(0) = 1` and `Hh₂(0) = √(2π)/4`; the factor `1/n!` is visible at `n = 2`.
- The first recurrence differentiates to `Hh₁′ = −Hh₀`, consistent with `Hh₀′ = −e^{−z²/2}`.

In the value at zero, `2^{(n−1)/2}` uses `Real.rpow`, with `(n−1)/2` computed after
casting `n` to `ℝ`, and the resulting real value is coerced to `ℂ`. Gaussian decay
supplies the integrability and differentiation bounds; integration by parts gives the
recurrences. Establish the bridge to `U` from these identities and the initial-value
uniqueness of Layer 2, using the initial values from Layer 3.

*Needs:* 2.4 and 3.2; Mathlib `integral_gaussian_complex`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le` and
`MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`.

### 5.4 Complementary error function

DLMF 12.7.5, 12.7.6. For real `x`:
- `U(½, x) = √(π/2) e^{x²/4} erfc(x/√2)` (`parabolicCylinderU_one_half_ofReal`);
- `U(n + ½, x) = √(π/2) (−1)ⁿ/n! · e^{−x²/4} (d/dx)ⁿ (e^{x²/2} erfc(x/√2))`.

Here `erfc` is `TauCeti.Real.erfc`, and the second statement uses `iteratedDeriv` on `ℝ`.

*Needs:* 4.3 and 5.3; Tau Ceti `TauCeti.Real.erfc`.

### Examples

- `U(½, 0) = √(π/2)`, once from 12.7.7 with `Hh₀(0)` and once from 12.7.5 with `erfc 0 = 1`.
- `TauCeti.hermiteFunction 0 x = π^{−1/4} e^{−x²/2} = D₀(√2 x)/√(√π)`.

### Dependencies

Layers 2–4; the consumed Hermite polynomial/function and real error-function APIs;
Gaussian integrability, differentiation under the integral and integration by parts from Mathlib.

## Layer 6: integral representations

### 6.1 The Laplace form

DLMF 12.5.1. For `Re a > −½` and all `z`:

`U(a, z) = e^{−z²/4} / Γ(½ + a) · ∫₀^∞ t^{a−½} e^{−t²/2 − zt} dt`,

with the integral over `Set.Ioi 0` and absolutely convergent (`parabolicCylinderU_eq_integral`).

*Needs:* 2.4 and 3.2; Tau Ceti `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`; Mathlib
`Complex.Gamma_eq_integral`.

### 6.2 Positivity

For real `a > −½` and real `x`, `U(a, x)` is real and positive (`parabolicCylinderU_ofReal_pos`).
For real `a` and real `x`, `U(a, x)` and `V(a, x)` are real.

*Needs:* 3.2 and 6.1.

### 6.3 Further real integrals

DLMF 12.5.2–12.5.4:
- For `Re a > −½`, `Re z > 0` (12.5.2):

  `U(a, z) = z e^{−z²/4} / Γ(¼ + a/2) · ∫₀^∞ t^{a/2−¾} e^{−t} (z² + 2t)^{−a/2−¾} dt`.

- For `Re a > −3/2`, `Re z > 0` (12.5.3):

  `U(a, z) = e^{−z²/4} / Γ(¾ + a/2) · ∫₀^∞ t^{a/2−¼} e^{−t} (z² + 2t)^{−a/2−¼} dt`.

- For `Re a < ½`, all `z` (12.5.4):

  `U(a, z) = √(2/π) e^{z²/4} ∫₀^∞ t^{−a−½} e^{−t²/2} cos(zt + π(a/2 + ¼)) dt`.

All three integrals converge absolutely under their stated hypotheses and are expressed
using `MeasureTheory.integral` over `Set.Ioi 0`; 12.5.4 is `parabolicCylinderU_eq_integral_cos`. In
[DLMF 12.5.4](https://dlmf.nist.gov/12.5#E4), the condition `Re a < ½` ensures
integrability at zero, and the Gaussian dominates the growth of the complex cosine at infinity.

*Needs:* 3.2 and 6.1; Mathlib changes of variables on `Set.Ioi 0` and
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 6.4 Loop integral

DLMF 12.5.5. For `a ≠ ½, 3/2, 5/2, …` and `r > 0`, put `q = a − ½` and

`L_r(a, z) = (e^{−iπq} − e^{iπq}) ∫_r^∞ s^q e^{−zs−s²/2} ds + ∫_{−π}^{π} e^{z r e^{iθ} − r² e^{2iθ}/2} r^q e^{iθq} i r e^{iθ} dθ`.

Then `U(a, z) = Γ(½ − a) e^{−z²/4} L_r(a, z) / (2πi)`, independently of `r`.
The lower lip runs from `−∞` to `−r` with phase `e^{−iπq}`; the circle runs
counterclockwise from angle `−π` to `π`; the upper lip runs from `−r` to `−∞` with phase
`e^{iπq}`. This fixes both ray signs. The circle term is the parameterized `circleIntegral`
with the principal power, split at the cut and read by its one-sided boundary values.

*Needs:* 6.1; Mathlib `circleIntegral`, `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
and Gamma reflection.

### 6.5 Straight-line contour integrals

DLMF 12.5.6, 12.5.7. For every `c > 0`:
- `U(a, z) = e^{z²/4}/√(2π) · ∫_ℝ e^{−z(c+iy)+(c+iy)²/2} (c+iy)^{−a−½} dy` (12.5.6);
- `V(a, z) = e^{−z²/4}/(2π) · ∑_{ε∈{−1,1}} ∫_ℝ e^{z(s+εic)−(s+εic)²/2} (s+εic)^{a−½} ds`
  (12.5.7).

Both hold for all `a, z`, with absolutely convergent integrals over `ℝ`.
The `U` contour is oriented upwards, with `dt = i dy` already absorbed in its prefactor.
Both `V` contours run from left to right, with `dt = ds`. All powers are principal: on
the upper line the negative-real-end argument approaches `+π`, and on the lower line it
approaches `−π`, giving respectively `e^{+iπ(a−½)}` and `e^{−iπ(a−½)}` at the cut.

*Needs:* 2.4 and 6.1; Mathlib `integral_gaussian_complex` and
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

### 6.6 Gamma identities, Gamma residues and Barnes kernel bounds

The general tools are consumed from AsymptoticExpansions: the pole-separated Gamma bound on
vertical strips (§8.6), the line shift with simple poles and its iteration (§8.2) and the
exponential Mellin inversion (§8.7). This subsection adds what is particular to Gamma and to the
Barnes kernels of 6.7.

**(a) Gamma products.** For real `x ∉ {0, −1, −2, …}`, prove convergence and the modulus identity
[DLMF 5.8.3](https://dlmf.nist.gov/5.8#E3):

`∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)² / |Γ(x + iy)|²` (`hasProd_Gamma_norm_quotient`).

Obtain it from `Complex.GammaSeq_tendsto_Gamma`. Prove its comparison in `x`, equivalently
`|Γ(x + iy)| ≤ Γ(x)/Γ(x′) · |Γ(x′ + iy)|` for `0 < x ≤ x′`, and the reflection-formula value
`|Γ(1 + iy)|² = πy / sinh(πy)` for `y ≠ 0` (`norm_Gamma_one_add_mul_I_sq`), with value `1` at
`y = 0` ([DLMF 5.4.3–5.4.4](https://dlmf.nist.gov/5.4#E3), with Gamma recurrence). The product
formula follows directly from the Euler limit; its comparison is termwise.

*Needs:* Mathlib Gamma's Euler limit, reflection and recurrence.

**(b) Gamma residues.** Prove `(z + n) Γ(z) → (−1)^n/n!` as `z → −n`, `z ≠ −n`
(`tendsto_add_nat_mul_Gamma`), and extend the numerator holomorphically by assigning it the value
`(−1)^n/n!` at `−n`. These follow from Gamma recurrence and the residue at zero already in Mathlib.
Derive the affine-chain factor for `Γ(A − 2t)` at `t = (A + n)/2`, including its factor `−½`
(`tendsto_sub_mul_Gamma_sub_two_mul`). These numerators are the local factors `φ` of the simple
poles of the Barnes kernels in the form `F(t) = φ(t)/(t − p)` required by AsymptoticExpansions §8.2,
and `φ(p)` is `TauCeti.Contour.residue F p`.

*Needs:* Mathlib `Complex.Gamma_add_one` and `Complex.tendsto_self_mul_Gamma_nhds_zero`;
ContourIntegration `TauCeti.Contour.residue_eq_of_tendsto_sub_mul`.

**(c) Bounds for the Barnes kernels.** For `B(A, z, t) = Γ(t) Γ(A − 2t) 2^t z^{2t}` and fixed
admissible `A, z, c` as in 6.7, prove a bound `C (1 + |y|)^K exp(−κ|y|)` for `|B(A, z, c + iy)|`,
with `κ = 3π/2 − 2|arg z|` (`exists_norm_barnes_kernel_le`). For the kernel multiplied by `cos(πt)`,
use `κ = π/2 − 2|arg z|` (`exists_norm_barnes_kernel_mul_cos_le`). Prove the corresponding tail
bounds uniformly when `c` ranges over a compact positive interval, and locally uniformly in the
parameters on admissible lines, using a common positive lower bound for `κ` on compact subsets of
the sector. Deduce absolute integrability on every admissible line, vanishing horizontal connector
integrals at both ends on every compact positive strip `c₁ ≤ Re t ≤ c₂`, and holomorphy of the line
integrals in `A` and `z` on their admissible open sets. These bounds discharge the integrability and
connector hypotheses of the line shift of AsymptoticExpansions §8.2 and the analytic continuation in
6.7.

**Checks.**
- `|2^{c+iy} z^{2(c+iy)}| = 2^c |z|^{2c} e^{−2y arg z}`, the source of `2|arg z|` in `κ`.
- `|Γ(c + iy)|` decays like `e^{−π|y|/2}` and `|Γ(A − 2c − 2iy)|` like `e^{−π|y|}`, up to powers of
  `|y|`, so the Gamma factors contribute `3π/2`; `|cos(π(c + iy))| ∼ e^{π|y|}/2` lowers it by `π`.
- At `A = 1` the kernel has a simple pole at `t = ½` with residue `−√(π/2) z`.

*Needs:* AsymptoticExpansions §8.6 for the two Gamma factors.

### 6.7 Mellin–Barnes integrals

[DLMF 12.5.8–12.5.9](https://dlmf.nist.gov/12.5#iii).
All statements require `z ≠ 0`. First prove the absolutely convergent straight-line forms,
oriented upwards along `t = c + iy`, `y : ℝ`:
- For `|arg z| < 3π/4` and `0 < 2c < ½ + Re a` (12.5.8):

  `U(a, z) = e^{−z²/4} z^{−a−½}/(2π Γ(½+a)) · ∫_ℝ B(½+a, z, c+iy) dy`
  (`parabolicCylinderU_eq_barnes_integral`).

- For `|arg z| < π/4` and `0 < 2c < ½ − Re a` (12.5.9):

  `V(a, z) = √(2/π) e^{z²/4} z^{a−½}/(2π Γ(½−a)) · ∫_ℝ B(½−a, z, c+iy) cos(π(c+iy)) dy`
  (`parabolicCylinderV_eq_barnes_integral`).

Here `B` is the kernel specified in 6.6(c). The factor `i` in `dt = i dy` has
already been absorbed into each prefactor.

Insert the exponential Mellin inversion of AsymptoticExpansions §8.7 into the Laplace
integral of 6.1. Prove absolute integrability of the resulting double integral to justify Fubini;
this gives 12.5.8 first for `Re z > 0`. The bounds of 6.6(c) and the identity theorem
extend it to `|arg z| < 3π/4`. Combining the two rotations of this formula with the
connection formulas of Layer 3 gives 12.5.9 in `|arg z| < π/4`.

Extend each representation to a separating contour for all its regular parameters:
`a + ½ ∉ {0, −1, −2, …}` for `U`, and `½ − a ∉ {0, −1, −2, …}` for `V`. Express that contour by a
vertical-line integral and a finite residue correction. In detail, put `A = ½ + a`, `h(t) = 1` for
`U`, and `A = ½ − a`, `h(t) = cos(πt)` for `V`. For any `c > 0` with `2c ≠ Re A + n` for every
`n : ℕ`, shifting the line by AsymptoticExpansions §8.2 with the residues of 6.6(b), subtract from
the upward line integral `2πi` times the sum of residues of `Γ(t) Γ(A − 2t) 2^t z^{2t} h(t)` at
`t = (A + n)/2` with `Re A + n < 2c`. Write the residue at that pole as
`R_n(A, z, h) = (−1)^{n+1} Γ((A + n)/2) 2^{(A+n)/2} z^{A+n} h((A + n)/2) / (2 n!)`. With
`A₊ = ½ + a` and `A₋ = ½ − a`, the complete corrected identities,
`parabolicCylinderU_eq_barnes_integral_sub_residues` and
`parabolicCylinderV_eq_barnes_integral_sub_residues`, are

`U(a, z) = e^{−z²/4} z^{−a−½}/Γ(A₊) · ((1/(2π)) ∫_ℝ B(A₊, z, c+iy) dy − ∑_{n≥0, Re A₊+n<2c} R_n(A₊, z, 1))`,

`V(a, z) = √(2/π) e^{z²/4} z^{a−½}/Γ(A₋) · ((1/(2π)) ∫_ℝ B(A₋, z, c+iy) cos(π(c+iy)) dy − ∑_{n≥0, Re A₋+n<2c} R_n(A₋, z, cos(π·)))`.

In `R_n(A₊, z, 1)`, `1` denotes the constant function. Both residue sums are finite.
Each right-hand side is independent of its admissible line and obeys the corresponding
sector restriction above. The symbols `A₊`, `A₋` and `R_n` are notation within this subsection.

*Needs:* 3.5, 6.1 and 6.6; AsymptoticExpansions §§8.2 and 8.7; Mathlib
`MeasureTheory.integral_integral_swap` and the identity theorem.

### Examples

- 6.1 at `a = ½`, `z = 0`: `U(½, 0) = ∫₀^∞ e^{−t²/2} dt = √(π/2)`, as in Layer 5.
- 12.5.4 at `a = −½`, `z = 0`: the cosine factor is `1`, and `√(2/π) · √(π/2) = 1 = U(−½, 0)`.
- 6.6(a) at `x = 1` is Euler's product `∏_{m≥1} (1 + y²/m²) = sinh(πy)/(πy)`, by the
  reflection value `|Γ(1 + iy)|² = πy/sinh(πy)`.
- 6.6(b) at `n = 0`: `(t − A/2) Γ(A − 2t) → −½` as `t → A/2`.

### Dependencies

Layers 2–5 and the integration APIs of the supplier contracts for 6.1–6.5. 6.6(a) uses Mathlib's
Gamma API; 6.6(b) consumes
[ContourIntegration Layer 2](../../Completed/ContourIntegration/README.md#layer-2-residues-the-cauchy-primitive-and-the-classical-residue-theorem);
6.6(c) uses AsymptoticExpansions §8.6. 6.7 uses 6.1 and 6.6, AsymptoticExpansions §§8.2 and 8.7, and
the connections of Layer 3.

## Layer 7: large-argument asymptotics

### 7.1 `U` in the principal sector

DLMF 12.9.1. For every `a`, every `δ ∈ (0, 3π/4)` and every
`N`, as `z → ∞` in `|ph z| ≤ 3π/4 − δ`:

`e^{z²/4} z^{a+½} U(a, z) − ∑_{s<N} (−1)^s (½ + a)_{2s} / (s! (2z²)^s) = O(|z|^{−2N})`
(`isBigO_parabolicCylinderU_sub_sum`).

That is, `HasAsymptoticExpansion (cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ 3π/4 − δ})` holds for
`z ↦ e^{z²/4} z^{a+½} U(a, z)` with the scale `z ↦ (z^{2s})⁻¹` and the coefficients
`(−1)^s (½ + a)_{2s} / (s! 2^s)`. The following identities and estimates are targets of this
subsection:
- **The Laplace integrand.** For `Re a > −½` put `q_a(t) = t^{a−½} e^{−t²/2}` (principal
  power). Verify the hypotheses of AsymptoticExpansions §4.3 for `q_a` with
  `α₁ = −π/4`, `α₂ = π/4` and `σ = 0`: `q_a` is holomorphic in `|ph t| < π/4`, bounded at
  infinity in every closed subsector, and has the convergent expansion at `0` with exponents
  `α_s = s + a + ½` and coefficients `c_{2k} = (−1)^k/(2^k k!)`, `c_{2k+1} = 0`.
- **Rotated Laplace representation** (the path-rotation argument of
  [DLMF §2.4(i)](https://dlmf.nist.gov/2.4#i) applied to 12.5.1).
  For `Re a > −½`, real `|θ| < π/4`, and every `z`,

  `Γ(½ + a) e^{z²/4} U(a, z) = e^{iθ} ∫₀^∞ e^{−z e^{iθ} r} (r e^{iθ})^{a−½} e^{−(r e^{iθ})²/2} dr`.

  This is `parabolicCylinderU_eq_rotated_integral`. The integral over `Set.Ioi 0` is absolutely
  convergent and entire in `z`. By 6.1
  the case `θ = 0` is DLMF 12.5.1; the gluing of AsymptoticExpansions §4.3 and the identity
  theorem in `z` give every `θ`.
- **The expansion for `Re a > −½`.** The expansion of AsymptoticExpansions §4.3 along each
  ray `θ ∈ (−π/4, π/4)`, in logarithmic coordinates `z = e^ζ` with `|Im ζ| < π`, is
  `Γ(½ + a) e^{z²/4} U(a, z) ∼ ∑_s Γ(2s + a + ½) (−1)^s/(2^s s!) z^{−2s−a−½}`, and
  `Γ(2s + a + ½)/Γ(½ + a) = (½ + a)_{2s}`. For every `δ ∈ (0, 3π/4)`, finitely many rays
  cover `|arg z| ≤ 3π/4 − δ`. This proves 12.9.1 for `Re a > −½`.
- **Parameter shifts.** For `z ≠ 0`, write `G(a, z) = e^{z²/4} z^{a+½} U(a, z)`.
  The algebraic recurrence of Layer 4 (DLMF 12.8.1) gives
  `G(a − 1, z) = G(a, z) + (a + ½) z^{−2} G(a + 1, z)`.
  Prove the corresponding identities for the coefficients and truncated sums, and
  propagate the remainder bounds downwards in integer shifts to every complex `a`.

*Needs:* 4.1 and 6.1; AsymptoticExpansions Layer 1 and §4.3; Mathlib's identity theorem.

### 7.2 `V` in its sector

DLMF 12.9.2. For every `a`, `δ ∈ (0, π/4)` and `N`, as `z → ∞` in
`|ph z| ≤ π/4 − δ`:

`√(π/2) e^{−z²/4} z^{−a+½} V(a, z) − ∑_{s<N} (½ − a)_{2s} / (s! (2z²)^s) = O(|z|^{−2N})`
(`isBigO_parabolicCylinderV_sub_sum`),

the corresponding `HasAsymptoticExpansion` with the scale `z ↦ (z^{2s})⁻¹`.

*Needs:* 3.5 and 7.1.

### 7.3 Adjacent sectors

[DLMF 12.9.3–12.9.4](https://dlmf.nist.gov/12.9#E3). Write
`z = exp w`. For notation within these statements, put

```text
E₋(a, w) = exp(−exp(2w)/4 − (a + ½)w)
E₊(a, w) = exp( exp(2w)/4 + (a − ½)w)
S₋(a, N, w) = ∑_{s<N} (−1)^s (½ + a)_{2s} / (s! 2^s) · exp(−2sw)
S₊(a, N, w) = ∑_{s<N}          (½ − a)_{2s} / (s! 2^s) · exp(−2sw)
C_U(a, σ) = σi √(2π) (Γ(½ + a))⁻¹ exp(−σiπa)
C_V(a, σ) = σi (Γ(½ − a))⁻¹
```

For every fixed `a : ℂ`, `σ ∈ {1, −1}`, `δ ∈ (0, π/2)` and `N : ℕ`, prove both
`Asymptotics.IsBigO` statements below. Here `σ` is real, and `comap Complex.re atTop`
expresses `w.re → +∞`; intersecting with the displayed principal filter restricts `w.im`.

**12.9.3** (the two choices of sign for `U`; `isBigO_parabolicCylinderU_adjacent_sub_sum`):

```text
(fun w : ℂ ↦ U(a, exp w) − E₋(a, w) S₋(a, N, w)
    − C_U(a, σ) E₊(a, w) S₊(a, N, w))
  =O[(comap Complex.re atTop) ⊓
    𝓟 {w : ℂ | π/4 + δ ≤ σ * w.im ∧ σ * w.im ≤ 5π/4 − δ}]
  (fun w ↦ (‖E₋(a, w)‖ + ‖E₊(a, w)‖) * Real.exp (−(2 * N : ℝ) * w.re))
```

**12.9.4** (the two choices of sign for `V`; `isBigO_parabolicCylinderV_adjacent_sub_sum`):

```text
(fun w : ℂ ↦ V(a, exp w) − √(2/π) E₊(a, w) S₊(a, N, w)
    − C_V(a, σ) E₋(a, w) S₋(a, N, w))
  =O[(comap Complex.re atTop) ⊓
    𝓟 {w : ℂ | −π/4 + δ ≤ σ * w.im ∧ σ * w.im ≤ 3π/4 − δ}]
  (fun w ↦ (‖E₋(a, w)‖ + ‖E₊(a, w)‖) * Real.exp (−(2 * N : ℝ) * w.re))
```

The comparison functions contain only the two displayed exponential envelopes and the
factor `exp(−2N w.re)`. The scalar prefactors `√(2/π)`, `C_U` and `C_V`, including their
Gamma and phase factors, are excluded from the comparison and are absorbed in the `O`
constant, which may depend on `a`, `σ`, `δ` and `N`. These statements apply at zeros of
reciprocal Gamma as well. All powers inherited from `z` are expressed in `w` as above.

*Needs:* 3.5 and 7.1–7.2.

### 7.4 Consequences on the real line

- `U(a, x) ∼ x^{−a−½} e^{−x²/4}` and `V(a, x) ∼ √(2/π) x^{a−½} e^{x²/4}` as `x → +∞`, as
  `Asymptotics.IsEquivalent` statements.
- `U(a, ·)` tends to `0` along `atTop`, and `|V(a, x)| → ∞` along `atTop`.

*Needs:* 7.1–7.2.

### 7.5 The recessive solution

If `f` solves DLMF 12.2.2 and `f(x) → 0` as `x → +∞` along the real axis, then
`f = f(0)/U(a, 0) · U(a, ·)` when `U(a, 0) ≠ 0`, and in all cases `f` is a constant multiple of
`U(a, ·)` (`exists_eq_const_mul_parabolicCylinderU`). Proof route: the Wronskian with `V(a, ·)` and
the growth of `V` from 7.4.

*Needs:* 3.3 and 7.4.

### Examples

- At `a = −½` and at `a = −3/2` the left-hand side of 12.9.1 is identically `1` and
  `(½ + a)_{2s} = 0` for `s ≥ 1`, so the remainder vanishes for every `N ≥ 1`. The same holds for
  12.9.2 at `a = ½`.
- 7.4 at `a = ½` is `U(½, x) ∼ x^{−1} e^{−x²/4}`, which by 5.4 is the classical
  `erfc t ∼ e^{−t²}/(t√π)` as `t → +∞`.
- 7.4 at `a = −½`, with 5.1, gives Dawson's asymptotic `F(t) ∼ 1/(2t)` as `t → +∞`.

### Dependencies

Layers 3–4 and the Laplace representation of 6.1; AsymptoticExpansions Layer 1 and §4.3; Mathlib's
identity theorem, finite-cover compactness and `IsBigO` calculus. 7.1 supplies the parameter shifts;
the connections of Layer 3 give 7.2–7.3; 7.4–7.5 use those expansions and the Wronskians.

## Layer 8: integrals and addition theorems

### 8.1 Integrals

DLMF 12.12.1–12.12.4:
- For every `a : ℂ` and `Re μ > 0` (12.12.1, `integral_exp_mul_cpow_mul_parabolicCylinderU`):

  `∫₀^∞ e^{−t²/4} t^{μ−1} U(a, t) dt = √π 2^{−(μ+a+½)/2} Γ(μ) / Γ((μ+a+3/2)/2)`.

- For `Re a < −½` (12.12.2, `integral_exp_three_mul_cpow_mul_parabolicCylinderU`):

  `∫₀^∞ e^{−3t²/4} t^{−a−3/2} U(a, t) dt = 2^{¼+a/2} Γ(−a−½) cos(π(a/4 + ⅛))`.

- For `Re a < ½` and real `x > 0` (12.12.3, `integral_exp_mul_cpow_mul_parabolicCylinderU_div`):

  `∫₀^∞ e^{−t²/4} t^{−a−½} U(a, t)/(x²+t²) dt = √(π/2) Γ(½−a) x^{−a−3/2} e^{x²/4} U(−a, x)`.

- For `Re a < ½` and every `z : ℂ` (12.12.4, `parabolicCylinderU_sq_add_sq_eq_integral`):

  `U(a, z)² + Ū(a, z)² = 2^{3/2}/π · Γ(½−a) · ∫₀^∞ e^{2at + z² tanh(t)/2}/√(sinh(2t)) dt`.

Here `Ū(a, z)` abbreviates `Complex.Gamma (½ − a) * V(a, z)` (12.2.21), using Mathlib's
total Gamma. It is therefore `0` at `a = ½, 3/2, …`, where DLMF leaves it undefined.
Its only target identity, 12.12.4, assumes `Re a < ½` and never meets those parameters.
It receives no separate definition. The square root in the integral is the positive real
square root for `t > 0`. All four integrals are absolutely convergent over `Set.Ioi 0`;
convergence at `∞` uses Layer 7.

*Needs:* 6.1 and 7.4; Mathlib `MeasureTheory.integral_integral_swap` and the Gamma integral.

### 8.2 Addition theorems

DLMF 12.13.1–12.13.4, for all `a, x, y`, as `HasSum` statements:
- `U(a, x + y) = e^{xy/2 + y²/4} ∑_m (−y)^m/m! · U(a − m, x)` (`hasSum_parabolicCylinderU_add`);
- `U(a, x + y) = e^{−xy/2 − y²/4} ∑_m (−1)^m (½ + a)_m y^m/m! · U(a + m, x)`;
- `V(a, x + y) = e^{xy/2 + y²/4} ∑_m (−1)^m (½ − a)_m y^m/m! · V(a − m, x)`;
- `V(a, x + y) = e^{−xy/2 − y²/4} ∑_m y^m/m! · V(a + m, x)`.

*Needs:* 4.3; Mathlib `DifferentiableOn.hasFPowerSeriesOnBall`.

### 8.3 The rotational addition theorem

DLMF 12.13.5, with the normalization below. For `a : ℂ` with `Re a ≤ −½`, real `x, y`, and
`0 ≤ t < π/4`, prove the `HasSum` identity `hasSum_parabolicCylinderU_rotational_addition`

`U(a, x cos t + y sin t) = (cos t)^{−a−½} e^{(x sin t − y cos t)²/4} ∑_{m≥0} (−1)^m (a+½)_m/m! · (tan t)^m U(a+m, x) U(−m−½, y)`.

The factor `(cos t)^{−a−½}` is required by the Hermite cases; it is absent from the
displayed DLMF formula. Its base is positive throughout `0 ≤ t ≤ π/4`.
At `t = π/4`, require absolute convergence as `HasSum` when `x > 0`, when `x = 0` and
`Re a < −½`, and for every real `x` in the terminating cases `a = −n − ½`, `n : ℕ`.
For all real `x, y`, the endpoint identity is an Abel limit: multiply the endpoint
summand by `r^m`, sum for `0 ≤ r < 1`, and take `r → 1⁻`.
Thus the closed DLMF angle range `0 ≤ t ≤ π/4` is covered with an explicit convergence
convention; an unrestricted `HasSum` at the endpoint is not asserted.

**Endpoint proof route.** For `m : ℕ` and real `y`, prove the Hermite–Gaussian Fourier identity
`D_m(y) = exp(y²/4) i^m/√(2π) · ∫_ℝ s^m exp(−s²/2 − iys) ds`
by differentiating the Gaussian Fourier integral. Taking absolute values and evaluating
the Gaussian moment then gives
`|D_m(y)|/m! ≤ exp(y²/4) 2^{−m/2}/Γ(m/2 + 1)`.
In a nonterminating case, choose an integer `M` with `Re(a + M + ½) > 0` and apply
6.1 to `U(a + m, x)` for `m ≥ M`. The Gamma coefficient cancels the
Pochhammer factor. Prove also the bound
`∑_{m≥0} (u/√2)^m/Γ(m/2 + 1) ≤ 2 exp(u²/2)` for `u ≥ 0`: the even terms sum to
`exp(u²/2)`, and the odd terms sum to `exp(u²/2) erf(u/√2) ≤ exp(u²/2)`
([DLMF 7.6.2](https://dlmf.nist.gov/7.6#E2)), since both sides vanish at `u = 0` and
satisfy the same first-order linear equation, by the derivative of `TauCeti.Real.erf`.
The bound must carry no polynomial factor in `u`: an extra factor `1 + u` would lose the
case `x = 0`, `−3/2 ≤ Re a < −½`. This bound cancels the Gaussian in the Laplace kernel, leaving
a tail majorant proportional to `u^{Re(a+½)−1} exp(−xu)` for `u ≥ 1`.
This is integrable for `x > 0`, or for `x = 0` and `Re a < −½`. At zero the choice of
`M` supplies integrability. The finitely many terms with `m < M` cause no difficulty;
terminating parameters give finite sums. For the Abel statement set `t = arctan r`
in the interior formula and let `r → 1⁻`, using continuity of its prefactor and left-hand side.

*Needs:* 5.1, 6.1 and 8.2; Mathlib `integral_gaussian_complex`; Tau Ceti `TauCeti.Real.erf`.

### Examples

- 12.12.1 at `a = −½`: both sides equal `2^{μ/2−1} Γ(μ/2)`, the right-hand side by the
  duplication formula.
- 12.13.1 at `a = −½` is the generating function `∑_m He_m(x) t^m/m! = e^{xt − t²/2}` at `t = −y`.
- 8.3 at `t = 0`: only `m = 0` contributes, and the identity reads
  `U(a, x) = e^{y²/4} U(a, x) U(−½, y)`.

### Dependencies

Layers 3–5, 6.1 and 7; entire Taylor expansion for 8.2 and the
Hermite–Gaussian Fourier representation and moment estimate proved in 8.3.

## Layer 9: the real solutions `W(a, ±x)`

Fix real `a`.

### 9.1 Definition and reality

`W(a, x) = parabolicCylinderW a x` as pinned. The complex expression inside the real part is real
for real `x`. `W(a, ·)` is smooth on `ℝ`, solves `w″ + (x²/4 − a) w = 0`
(`deriv_deriv_parabolicCylinderW`), and has the initial values DLMF 12.14.1–12.14.2,
`parabolicCylinderWZero a` and `parabolicCylinderWDerivZero a`.

**Checks.**
- `W(a, 0) > 0` and `W′(a, 0) < 0`.
- `−2 W(a, 0) W′(a, 0) = 1`, the Wronskian 12.14.3 at `x = 0`; the Gamma quotients cancel.
- `W(0, 0) = 2^{−1/2} √π / Γ(¾)`, the limit `x → 0+` of 12.14.13, by `Γ(¼) Γ(¾) = π√2`.

*Needs:* 2.2–2.5.

### 9.2 Wronskian

DLMF 12.14.3: `𝒲{W(a, x), W(a, −x)} = 1` for all `x` (`parabolicCylinderW_mul_deriv_neg_sub`).

*Needs:* 2.4 and 9.1.

### 9.3 Connection with `U`

DLMF 12.14.4–12.14.7. With
`k = √(1 + e^{2πa}) − e^{πa}`, `1/k = √(1 + e^{2πa}) + e^{πa}`, `ρ = π/8 + φ₂/2`, and `φ₂`
as pinned:

`W(a, x) = √(k/2) e^{πa/4} (e^{iρ} U(ia, x e^{−iπ/4}) + e^{−iρ} U(−ia, x e^{iπ/4}))`
(`parabolicCylinderW_eq`).

This includes `Γ(½ + ia) = |Γ(½ + ia)| e^{iφ₂(a)}` (`Gamma_one_half_add_mul_I`), with
`φ₂(a) = gammaHalfPhase a`.

**Checks** for `φ₂`.
- `φ₂(0) = 0`.
- `φ₂(−a) = −φ₂(a)`, since `Re ψ(½ − it) = Re ψ(½ + it)`.
- `φ₂′(0) = ψ(½) = −γ − 2 log 2`.

*Needs:* 3.5, 3.7 and 9.1; Mathlib `Complex.digamma` and Gamma reflection.

### 9.4 Power series

DLMF 12.14.9–12.14.12. Write
`w₁(a, x) = Re u₁(−ia, e^{iπ/4}x)` and
`w₂(a, x) = Re(e^{−iπ/4} u₂(−ia, e^{iπ/4}x))`, the rotated solutions pinned above.
Define the real coefficient sequences by

```text
α₀(a) = β₀(a) = 1,    α₁(a) = β₁(a) = a,
α_{n+2}(a) = a α_{n+1}(a) − (n+1)(2n+1) α_n(a)/2,
β_{n+2}(a) = a β_{n+1}(a) − (n+1)(2n+3) β_n(a)/2.
```

For every real `a, x`, prove absolute convergence and the `HasSum` identities
`w₁(a, x) = ∑_{n≥0} α_n(a) x^{2n}/(2n)!` and
`w₂(a, x) = ∑_{n≥0} β_n(a) x^{2n+1}/(2n+1)!`.

*Needs:* 2.1 and 9.1.

### 9.5 Kummer form

DLMF 12.14.15, 12.14.16. The even and odd solutions are
`Re(e^{−ix²/4} Γ(½) 𝐌(¼ − ia/2, ½, ix²/2))` and
`Re(x e^{−ix²/4} Γ(3/2) 𝐌(¾ − ia/2, 3/2, ix²/2))`.

*Needs:* 2.1 and 9.1.

### 9.6 The case `a = 0`

DLMF 12.14.13, 12.14.14. For `x > 0`:
- `W(0, ±x) = 2^{−5/4} √(πx) (J_{−1/4}(x²/4) ∓ J_{1/4}(x²/4))`, with Mathlib's
  `Complex.besselJ` (`parabolicCylinderW_zero_left`);
- `deriv (fun t ↦ W(0, t)) x = −2^{−9/4} x √(πx) (J_{3/4}(x²/4) + J_{−3/4}(x²/4))` (12.14.14, upper
  sign);
- `deriv (fun t ↦ W(0, −t)) x = −2^{−9/4} x √(πx) (J_{3/4}(x²/4) − J_{−3/4}(x²/4))` (12.14.14,
  lower sign).

The two derivative identities are `deriv_parabolicCylinderW_zero_left`, with `ε = 1` and `ε = −1`
selecting the upper and lower signs. These identities are read in `ℂ` after coercing their real left-hand sides
and prefactors.
The lower-sign derivative is that of the composite function `t ↦ W(0, −t)`; it equals
`−(deriv (fun t ↦ W(0, t))) (−x)`.

*Needs:* 9.4; Mathlib `Complex.besselJ`.

### 9.7 Large `x`

DLMF 12.14.17–12.14.23. For `x > 0` let
`ω = x²/4 − a log x + π/4 + φ₂/2`, and define
`s(x) = e^{−iω} (√(x/(2k)) W(a, x) + i √(kx/2) W(a, −x))`.
- The identities DLMF 12.14.17–12.14.18 hold with `s₁ = Re s` and `s₂ = Im s`.
- For every `N`, as `x → +∞` (`isBigO_parabolicCylinderW_sub_sum`):

  `s(x) − ∑_{r<N} (−i)^r (½ + ia)_{2r} / (2^r r! x^{2r}) = O(x^{−2N})`.

- Consequently `W(a, x) = √(2k/x) (cos ω + O(x^{−2}))` and
  `W(a, −x) = √(2/(kx)) (sin ω + O(x^{−2}))`.

*Needs:* 7.1 and 9.3.

### Examples

- 9.4 at `a = 0`: `α₁(0) = α₃(0) = 0` and `α₂(0) = −½`, so `w₁(0, x) = 1 − x⁴/48 + O(x⁸)`,
  consistent with `w″ = −(x²/4) w`.

### Dependencies

Layers 2–4 and 7; Mathlib `Complex.besselJ`, Gamma, digamma and real integration.
9.1–9.2 use rotated initial-value solutions; 9.3 uses their Gamma initial values and the
continuous phase; 9.4 uses the ODE coefficient recurrence; 9.7 uses the rotated `U` expansion.

## Downstream consumers

- **QuantumFoundations** consumes Kummer's equation for `𝐌` (1.3) and its polynomial cases (1.6).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.
- **Uniform expansions for large parameter** (DLMF §12.10, §12.14(ix)): Olver's expansions in
  elementary functions and in Airy functions, Temme's expansions, and their error bounds. They
  need the Airy functions (DLMF Chapter 9) and Olver's turning-point theory.
- **Zeros** (DLMF §12.11): the real and complex zeros of `U(a, z)` and their asymptotics.
- **Modulus and phase functions** (DLMF 12.2.22–12.2.23, 12.14(x)) with continuous phases.
  The abbreviation `Ū = Γ(½ − a) V` of 12.2.21 is already part of 8.1.
- **Explicit remainder bounds and re-expansions** (DLMF §12.9(ii)), including exponential
  improvement beyond the Poincaré `O`-remainders of Layer 7.
- **Relations to Kummer's `U`, the Whittaker functions and the modified Bessel functions**
  (DLMF 12.7.8–12.7.11 and 12.7.14). These belong to a confluent hypergeometric roadmap (DLMF
  Chapter 13) and a Bessel roadmap (DLMF Chapter 10).
- **The complex forms of DLMF 12.7.5–12.7.6 and the finite identity
  [12.13.6](https://dlmf.nist.gov/12.13#E6)**, which need complex `erfc`. Complex `erf`, `erfc`
  and the Faddeeva function are outside this roadmap; the `F` and `Hh_n` theory specified in
  Layer 5 is included.
- **The generalized parabolic cylinder equation** (DLMF §12.15).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its
directory `DLMF/ParabolicCylinder/` and the files `DLMF/Confluent/ParabolicCylinder/*.lean`
provide source material for each layer. Its Kummer function `kummerM` has its counterpart in
Layer 1; the Kummer targets use Mathlib's `regularizedHGFun`. Its asymptotic-expansion
library under `DLMFMathlib/Analysis/Asymptotics/`, its Gamma vertical bounds and its
contour-integration infrastructure are the source counterparts of the AsymptoticExpansions
targets consumed here.

The source's initial Barnes representation passes through Kummer's second function `U(a, b, z)`.
Here exponential Mellin inversion and the Laplace representation of 6.1 give a direct
construction, within the stated scope.

This roadmap specifies the mathematics intrinsically. It keeps that formalization's names
(`parabolicCylinderU`, `parabolicCylinderV`, `parabolicCylinderD`, argument order `(a, z)`) so
that the two developments stay interoperable. `lean-DLMF` supplies prior proofs and implementation
references; reused code carries attribution under the repository's porting guidance. The following
secondary map records source counterparts in that repository; the mathematical targets and
dependencies are those of the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1. Kummer function | `Confluent/Basic/KummerM`, `Confluent/Basic/KummerProperties` |
| 2. Weber's equation | `ParabolicCylinder/Basic/Functions`, `ParabolicCylinder/Basic/WeberEquation` |
| 3. `U`, `V`, `D` | `ParabolicCylinder/Basic/Wronskians`, `Confluent/ParabolicCylinder/WronskiansAndConnections`, `ParabolicCylinder/ElementaryProperties` |
| 4. Recurrences | `ParabolicCylinder/Basic/WeberEquation`, `ParabolicCylinder/ElementaryProperties` |
| 5. Hermite, erfc | `ParabolicCylinder/Hermite`, `ParabolicCylinder/Relations` |
| 6. Integrals | `Confluent/ParabolicCylinder/EquationAndIntegrals`, `ParabolicCylinder/IntegralTools`, `ParabolicCylinder/ContourTools`, `ParabolicCylinder/Integrals`, `ParabolicCylinder/BarnesContinuation` |
| 6.6. Gamma identities | `Gamma/Products`, `Gamma/SpecialValues`, `Gamma/VerticalBounds` |
| 6.6. Barnes residues | `DLMFMathlib/Analysis/Complex/BarnesResidue` |
| 7. Asymptotics | `ParabolicCylinder/SectorAsymptotics`, `ParabolicCylinder/AsymptoticsZeros` |
| 8. Integrals, sums | `ParabolicCylinder/Integrals`, `ParabolicCylinder/Relations` |
| 9. `W(a, ±x)` | `ParabolicCylinder/Weber/Solutions`, `ParabolicCylinder/Weber/Representations` |

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 12 (N. M. Temme), Chapter 13 (A. B.
  Olde Daalhuis), [§2.3(ii)](https://dlmf.nist.gov/2.3#ii) and
  [§2.4(i)](https://dlmf.nist.gov/2.4#i) (F. W. J. Olver, R. Wong), <https://dlmf.nist.gov/12>.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974, Chapters 3 and 7.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapter 10.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, Chapter XVI.
- J. C. P. Miller, *Tables of Weber Parabolic Cylinder Functions*, H.M. Stationery Office, 1955
  (introduction: the definitions of `U`, `V` and `W`).

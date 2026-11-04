# Parabolic cylinder functions

This roadmap builds the theory of the parabolic cylinder functions of Chapter 12 of the NIST
*Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a library.
These are the solutions of Weber's equation

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

The general infrastructure includes the derivative and differential equation of the regularized
Kummer function, Gamma bounds and contour-shift tools for Mellin–Barnes integrals, and Watson's
lemma for Laplace integrals in a sector.

The suggested home is `TauCeti/Analysis/SpecialFunctions/ParabolicCylinder/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/Erf.lean` and `TauCeti/Analysis/SpecialFunctions/Hermite/` and
Mathlib's `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`. Milestone 1 extends
Tau Ceti's existing `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`.
The general infrastructure of Milestone 7 goes in `TauCeti/Analysis/Asymptotics/Watson.lean`.
The general targets of Milestone 6.6 belong in
`TauCeti/Analysis/SpecialFunctions/Gamma/VerticalBounds.lean`,
`TauCeti/Analysis/Complex/VerticalLineShift.lean` and
`TauCeti/Analysis/Complex/MellinBarnes.lean`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti proves all of the following.

1. **The regularized Kummer function.** For Mathlib's `Complex.regularizedHGFun {a} {b}`
   (written `𝐌(a, b, z)` below): the derivative formula, Kummer's differential equation,
   Kummer's transformation and analyticity in the parameters.
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
   line for `a > −½`. This includes the Gamma estimates, residue formulas, vertical-line shifts
   and exponential Mellin inversion that support the Barnes representations.
7. **Watson's lemma** for Laplace integrals, with complex variable in a sector.
8. **Large-argument asymptotics** (DLMF 12.9.1–12.9.4), and the characterization of `U(a, ·)`
   as the recessive solution on the positive real axis.
9. **Integrals and addition theorems** (DLMF 12.12.1–12.12.4 and 12.13.1–12.13.5).
10. **The real solutions `W(a, ±x)`.** This covers DLMF 12.14.1–12.14.8, the power series and
    Bessel cases DLMF 12.14.9–12.14.16, and the large-`x` expansions DLMF 12.14.17–12.14.23.

**What this roadmap owns:** Weber's equation and the following DLMF formulas, with the
hypotheses and conventions specified in the milestones:

| Formulas | Targets |
|---|---|
| 12.2.1–12.2.20 | Equations, initial values, Wronskians, reflections and connections (Milestones 2–3). |
| 12.2.21 | The abbreviation `Ū(a, z) = Γ(½ − a) V(a, z)` used in Milestone 9. |
| 12.4.1–12.4.6 | Definitions and power series (Milestones 2–3). |
| 12.5.1–12.5.9 | Integral representations (Milestone 6). |
| 12.7.1–12.7.7 | Hermite, Dawson and repeated Gaussian integral identities; the `erfc` identities 12.7.5–12.7.6 have real argument (Milestone 5). |
| 12.7.12–12.7.13 | The Kummer definitions of the even and odd solutions (Milestone 2). |
| 12.8.1–12.8.12 | Recurrences and derivatives (Milestone 4). |
| 12.9.1–12.9.4 | Poincaré expansions with an `O`-remainder for every truncation order (Milestone 8). |
| 12.12.1–12.12.4, 12.13.1–12.13.5 | Integrals and addition theorems (Milestone 9). |
| 12.14.1–12.14.23 | The real solutions `W(a, ±x)`, including the large-variable expansions of §12.14(viii) (Milestone 10). |

It also owns the Kummer and Watson theory of Milestones 1 and 7, the basic theory of complex
Dawson's integral `F` (DLMF 7.2.5) and the repeated Gaussian integrals `Hh_n` (related by scaling
to DLMF §7.18) specified in Milestone 5, the Gamma estimates and Barnes integration tools of
Milestone 6.6, and the rotated-ray integral identities and estimates in Milestone 8.

**What it does not own:**
- Kummer's second function `U(a, b, z)` and the Whittaker functions, the confluent
  hypergeometric theory of DLMF Chapter 13, beyond Milestone 1.
- The complex functions `erf`, `erfc` and the Faddeeva function `w(z)` (DLMF 7.2.1–7.2.3),
  and the rest of Chapter 7 beyond the `F` and `Hh_n` theory specified in Milestone 5.
- DLMF 12.13.6, which uses complex `erfc`.
- Modified Bessel functions (DLMF Chapter 10).
- The uniform asymptotic expansions for large parameter and the zeros (DLMF §§12.10, 12.11,
  12.14(ix)).
- The modulus and phase functions (DLMF 12.2.22–12.2.23, 12.14(x)); the abbreviation of
  12.2.21 is included as specified above.
- The explicit remainder bounds and re-expansions of DLMF §12.9(ii), beyond the
  `O`-remainders required in Milestone 8.
- The generalized equation of DLMF §12.15.

See the last section for these.

## Ownership and dependencies

- **Tau Ceti's Hermite polynomials and Hermite functions**
  (`TauCeti/RingTheory/Polynomial/Hermite/`, `TauCeti/Analysis/SpecialFunctions/Hermite/`) are
  consumed. Milestone 5 relates them to `D_n` and changes nothing in them.
- **Tau Ceti's real error function** `TauCeti.Real.erf`, `TauCeti.Real.erfc`
  (`TauCeti/Analysis/SpecialFunctions/Erf.lean`) is consumed in Milestone 5. The complex error
  function is not built here. DLMF 12.7.5 is proved for real argument, and the complex form is
  stated through the repeated integral `Hh_n` of Milestone 5, which needs no error function.
- **[ContourIntegration](../../Completed/ContourIntegration/README.md)** owns residues and the
  classical residue theorem, implemented in `TauCeti/Analysis/Contour/Residue/`. Milestone 6.6(b)
  consumes this residue API and adds whole-line shift and contour-closing statements with decay
  hypotheses. Its numerator formulation computes those existing residues; it defines no new
  residue notion.
- **Mathlib's `Complex.besselJ`** is consumed in Milestone 10, for the Bessel cases
  DLMF 12.14.13–12.14.14.

**The boundary in one sentence:** this roadmap owns the specified fixed-parameter Weber theory,
Kummer theory, Gamma estimates, Barnes integration tools and Watson's lemma; it excludes
large-parameter turning-point analysis, Airy functions, Kummer's second function, modified
Bessel functions and complex `erf`, `erfc` and Faddeeva theory.

## Mathlib and Tau Ceti inventory

Consume these; do not rebuild them.

- **Regularized hypergeometric series.** `Complex.regularizedHGFun`,
  `Complex.regularizedHGFunCoeff` (the coefficient `(a)_n / (n! Γ(b + n))`),
  `Complex.regularizedHGFunSeries`, `Complex.regularizedHGFun_zero`,
  `Complex.radius_regularizedHGFunSeries_eq_top`,
  `Complex.analyticOnNhd_regularizedHGFun_of_card_le`, and `Complex.regularizedHGFun_zero_zero`
  (`₀F₀ = exp`). These are in
  [`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.html).
  Mathlib proves convergence and analyticity in `z`. Tau Ceti's
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean)
  supplies the `HasSum` statement whenever `a.card ≤ b.card`, including the singleton case of
  Milestone 1.1. The value at zero is also already in Mathlib. Milestone 1 consumes these results
  and builds the Kummer derivative formula, differential equation and parameter theory.
- **Gamma.** `Complex.Gamma`, `Complex.differentiable_one_div_Gamma`,
  `Complex.Gamma_mul_Gamma_one_sub` (reflection), `Complex.Gamma_mul_Gamma_add_half`
  (duplication), `Complex.Gamma_one_half_eq`, `Complex.Gamma_conj`, `Complex.Gamma_eq_integral`,
  `Complex.GammaSeq_tendsto_Gamma`, `Complex.Gamma_add_one`,
  `Complex.tendsto_self_mul_Gamma_nhds_zero`, `Complex.digamma` (`logDeriv Gamma`), and
  `ascPochhammer`. Tau Ceti's `TauCeti/Analysis/SpecialFunctions/Gamma.lean` also provides
  `Real.continuous_inv_Gamma`, `Real.exists_abs_inv_Gamma_le` and
  `Real.Gamma_nat_add_half_eq_factorial`, available for the series and special-value arguments.
- **Bessel functions.** `Complex.besselJ`.
- **Hermite.** Mathlib's probabilists' `Polynomial.hermite` and
  `deriv_gaussian_eq_hermite_mul_gaussian`. Tau Ceti adds `Polynomial.derivative_hermite`,
  `Polynomial.hermite_add_two` and `Polynomial.hermite_aeval_neg`
  (`TauCeti/RingTheory/Polynomial/Hermite/Derivative.lean`), and the Hermite function
  `TauCeti.hermiteFunction n x = He_n(x√2) e^{−x²/2} / √(n! √π)`.
- **Error function.** `TauCeti.Real.erf`, `TauCeti.Real.erfc`, with derivatives, parity and
  monotonicity.
- **Integration.** `integral_gaussian_complex`, `MeasureTheory.integral` on `Set.Ioi`,
  `intervalIntegral`, `circleIntegral`, and parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).
- **Laplace transforms.** Tau Ceti's
  [`TauCeti/Analysis/Complex/LaplaceTransform.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/Complex/LaplaceTransform.lean)
  provides `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` and
  `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`, with integrability and tail estimates.
  The latter theorem assumes a measurable, bounded kernel on `[0, ∞)`; consume it when those
  hypotheses hold in Milestones 6.1, 7 and 8. Kernels with an integrable singularity at zero or
  with the more general growth allowed in Milestone 7 still require the corresponding
  domination and truncation arguments, using the compact-interval API from this file.
- **Residues.** Consume `TauCeti.Contour.residue`,
  `TauCeti.Contour.residue_div_sub_pow_of_analyticAt`,
  `TauCeti.Contour.residue_eq_of_tendsto_sub_mul` and the classical residue theorem from
  `TauCeti/Analysis/Contour/Residue/{Basic,SimplePole,Theorem}.lean`, implementing Layer 2 of
  [ContourIntegration](../../Completed/ContourIntegration/README.md).
- **Contour deformation.** Mathlib's
  [`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Complex/CauchyIntegral.html#Complex.integral_boundary_rect_eq_zero_of_differentiableOn)
  and the unbounded-rectangle deformation theorems in the same file are consumed. Milestone
  6.6 builds whole-line shifts using these results and the existing residue API.
- **Mellin inversion.**
  [`mellinInv_mellin_eq`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/MellinInversion.html#mellinInv_mellin_eq)
  consumes `MellinConvergent`,
  [`Complex.VerticalIntegrable`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/MellinTransform.html#Complex.VerticalIntegrable)
  and continuity at the positive real evaluation point. Use
  `Complex.GammaIntegral_eq_mellin` and `Complex.Gamma_eq_integral` to identify the Mellin
  transform of `x ↦ Real.exp (-x)` with Gamma on `Re s > 0`.
  `Complex.GammaIntegral_convergent` supplies the Mellin convergence hypothesis; the Gamma
  bounds of Milestone 6.6(a) supply vertical integrability. Milestone 6.6(c) specializes this
  existing inversion formula and extends it to complex `w` with `Re w > 0`.
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsLittleO`, `Bornology.cobounded`, and
  `Complex.arg`.

**Targets not supplied by the consumed APIs:**
- parabolic cylinder functions;
- Kummer's differential equation for `regularizedHGFun`;
- the vertical Gamma decay estimates and the whole-line simple-pole shift in Milestone 6.6;
- Watson's lemma;
- a theory of asymptotic expansions in sectors.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its
directory `DLMF/ParabolicCylinder/` and the files `DLMF/Confluent/ParabolicCylinder/*.lean`
provide source material for each milestone. Its Kummer function `kummerM` and its
asymptotic-expansion library under `DLMFMathlib/Analysis/Asymptotics/` have counterparts in
the foundational targets of Milestones 1 and 7, respectively. The Kummer targets use Mathlib's
`regularizedHGFun`. The Barnes proofs also use its Gamma vertical bounds and contour-integration
infrastructure, whose required statements are targets of Milestone 6.6.

The source's initial Barnes representation passes through Kummer's second function `U(a, b, z)`.
Here exponential Mellin inversion and the Laplace representation of Milestone 6.1 give a direct
construction, within the stated scope. The targets here require finite simple-pole shifts;
the source also provides a shift across arbitrary isolated singularities. Its Mellin–Barnes
series machinery supplies counterparts for the finite-shift and contour-closing statements.

This roadmap specifies the mathematics intrinsically. It keeps that formalization's names
(`parabolicCylinderU`, `parabolicCylinderV`, `parabolicCylinderD`, argument order `(a, z)`) so
that the two developments stay interoperable. `lean-DLMF` supplies prior proofs and implementation
references; reused code carries attribution under the repository's porting guidance. The following
secondary provenance map records source counterparts (checked at commit `451f12a`). The mathematical
targets and dependencies are specified by the milestones.

| Milestone | Counterpart in `lean-DLMF` |
|---|---|
| 1. Kummer function | `Confluent/Basic/KummerM`, `Confluent/Basic/KummerProperties` |
| 2. Weber's equation | `ParabolicCylinder/Basic/Functions`, `ParabolicCylinder/Basic/WeberEquation` |
| 3. `U`, `V`, `D` | `ParabolicCylinder/Basic/Wronskians`, `Confluent/ParabolicCylinder/WronskiansAndConnections`, `ParabolicCylinder/ElementaryProperties` |
| 4. Recurrences | `ParabolicCylinder/Basic/WeberEquation`, `ParabolicCylinder/ElementaryProperties` |
| 5. Hermite, erfc | `ParabolicCylinder/Hermite`, `ParabolicCylinder/Relations` |
| 6. Integrals | `Confluent/ParabolicCylinder/EquationAndIntegrals`, `ParabolicCylinder/IntegralTools`, `ParabolicCylinder/ContourTools`, `ParabolicCylinder/Integrals`, `ParabolicCylinder/BarnesContinuation` |
| 6.6. Gamma bounds | `Gamma/Products`, `Gamma/SpecialValues`, `Gamma/VerticalBounds` |
| 6.6. Contour tools | `DLMFMathlib/Analysis/Complex/BarnesResidue`, `VerticalLineShift`, `MellinBarnesSeries` (finite simple-pole shifts and contour closing) |
| 7. Watson's lemma | `DLMFMathlib/Analysis/Asymptotics/Watson`, `WatsonSector` |
| 8. Asymptotics | `ParabolicCylinder/SectorAsymptotics`, `ParabolicCylinder/AsymptoticsZeros` |
| 9. Integrals, sums | `ParabolicCylinder/Integrals`, `ParabolicCylinder/Relations` |
| 10. `W(a, ±x)` | `ParabolicCylinder/Weber/Solutions`, `ParabolicCylinder/Weber/Representations` |

## Conventions (pinned)

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
  Milestone 5; `parabolicCylinderWDerivZero` stores the scalar initial derivative.
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
  [DLMF 12.2.6–12.2.9](https://dlmf.nist.gov/12.2#ii), proved in Milestone 3 for every `a`,
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
- **Asymptotic expansions** are stated as "for every `N`, the remainder after `N` terms is
  `O(scale N)`": `∀ N, (fun z ↦ f z − ∑ s ∈ range N, c s * φ s z) =O[l] φ N`. No predicate is
  introduced for this.
- **The real solution `W`** (DLMF 12.14.1, 12.14.2, 12.14.8, 12.14.15, 12.14.16). For real `a`:

  ```text
  W(a, 0)  =  2^{−3/4} |Γ(¼ + ia/2) / Γ(¾ + ia/2)|^{1/2}
  W′(a, 0) = −2^{−1/4} |Γ(¾ + ia/2) / Γ(¼ + ia/2)|^{1/2}
  W(a, x)  = Re( W(a, 0) u₁(−ia, e^{iπ/4} x) + W′(a, 0) e^{−iπ/4} u₂(−ia, e^{iπ/4} x) )
  ```

  The two functions `x ↦ u₁(−ia, e^{iπ/4}x)` and `x ↦ e^{−iπ/4} u₂(−ia, e^{iπ/4}x)` are the even
  and odd solutions of `w″ + (x²/4 − a) w = 0` with initial values `(1, 0)` and `(0, 1)`. They
  are real on `ℝ`, so the real part loses nothing; Milestone 10 proves this.
- **The phase of `Γ(½ + ia)`** (DLMF 12.14.7) is `φ₂(a) = ∫₀^a Re ψ(½ + it) dt`, with Mathlib's
  `Complex.digamma`. It is the continuous branch of `ph Γ(½ + ia)` with `φ₂(0) = 0`. The
  identity `Γ(½ + ia) = |Γ(½ + ia)| e^{iφ₂(a)}` is part of Milestone 10.

## Milestone 1: the regularized Kummer function

Write `𝐌(a, b, z) = Complex.regularizedHGFun {a} {b} z`.

1. **Series (consume).** Specialize Tau Ceti's `Complex.hasSum_regularizedHGFun` to singleton
   parameter multisets to obtain
   `HasSum (fun n ↦ regularizedHGFunCoeff {a} {b} n * z ^ n) (𝐌(a, b, z))` for all
   `a, b, z`, with absolute convergence from the existing entire power series. The initial
   value `𝐌(a, b, 0) = Γ(b)⁻¹` is Mathlib's `Complex.regularizedHGFun_zero`.
2. **Derivative.**
   `HasDerivAt (𝐌(a, b, ·)) (a * 𝐌(a + 1, b + 1, z)) z` for all `a, b, z`.
3. **Kummer's equation** (DLMF 13.2.1). For all `a, b, z`:

   `z 𝐌″(a, b, z) + (b − z) 𝐌′(a, b, z) − a 𝐌(a, b, z) = 0`,

   stated with `deriv` and `deriv^[2]`.
4. **Kummer's transformation** (DLMF 13.2.39): `𝐌(a, b, z) = e^z 𝐌(b − a, b, −z)`.
5. **Analyticity in the parameters.** For fixed `b, z`, `a ↦ 𝐌(a, b, z)` is entire. For fixed
   `a, z`, `b ↦ 𝐌(a, b, z)` is entire. The function `(a, z) ↦ 𝐌(a, b, z)` is continuous on
   `ℂ × ℂ`. The proof route is locally uniform convergence of the series in `(a, b, z)`.
6. **Polynomial cases.** For `n : ℕ`, `𝐌(−n, b, z)` is a polynomial in `z` of degree at most
   `n`, given by the finite sum of its series.

## Milestone 2: Weber's equation and its even and odd solutions

1. **Definitions and series.** `u₁` and `u₂` as pinned. The power series DLMF 12.4.3–12.4.6
   hold as `HasSum` statements for all `a, z`:
   - `u₁(a, z) = e^{−z²/4} ∑ₖ (∏_{r<k} (a + ½ + 2r)) z^{2k} / (2k)!`;
   - `u₂(a, z) = e^{−z²/4} ∑ₖ (∏_{r<k} (a + 3/2 + 2r)) z^{2k+1} / (2k+1)!`;
   - `u₁(a, z) = e^{z²/4} ∑ₖ (∏_{r<k} (a − ½ − 2r)) z^{2k} / (2k)!` (12.4.5);
   - `u₂(a, z) = e^{z²/4} ∑ₖ (∏_{r<k} (a − 3/2 − 2r)) z^{2k+1} / (2k+1)!` (12.4.6).
2. **Analyticity.** `u₁` and `u₂` are entire in `z` for fixed `a` and entire in `a` for fixed
   `z`, and jointly continuous.
3. **Weber's equation** (DLMF 12.2.2). `u₁(a, ·)` and `u₂(a, ·)` solve it, with initial values
   `u₁(a, 0) = 1`, `u₁′(a, 0) = 0`, `u₂(a, 0) = 0`, `u₂′(a, 0) = 1`. Parity:
   `u₁(a, −z) = u₁(a, z)` and `u₂(a, −z) = −u₂(a, z)`.
4. **Wronskian and uniqueness.**
   - The Wronskian of any two solutions of DLMF 12.2.2 is constant.
   - `u₁ u₂′ − u₁′ u₂ = 1`.
   - A solution with `f 0 = 0` and `deriv f 0 = 0` is `0`.
   - Hence every solution equals `f 0 · u₁(a, ·) + f′(0) · u₂(a, ·)`.
5. **Rotations.** If `f` solves DLMF 12.2.2 with parameter `a`, then `z ↦ f (−z)` solves it
   with parameter `a`, and `z ↦ f (± i z)` solves it with parameter `−a`. The same holds for
   `z ↦ f (e^{±iπ/4} z)` relating DLMF 12.2.2 with parameter `∓ia` to DLMF 12.2.3 with
   parameter `a`.

## Milestone 3: `U`, `V` and `D`

1. **Definitions** as pinned. `U(a, ·)`, `V(a, ·)` and `D_ν` solve DLMF 12.2.2 (DLMF 12.2.4 for
   `D_ν`). All three are entire in each variable separately and jointly continuous.
2. **Values at the origin** (DLMF 12.2.6–12.2.9). These are `U(a, 0)`, `U′(a, 0)`, `V(a, 0)`
   and `V′(a, 0)` in the pinned reciprocal-Gamma forms, valid for every `a` with Mathlib's
   totalized Gamma function.
3. **Wronskians** (DLMF 12.2.10–12.2.12):
   - `𝒲{U(a, z), V(a, z)} = √(2/π)`;
   - `𝒲{U(a, z), U(a, −z)} = √(2π) / Γ(½ + a)`;
   - `𝒲{U(a, z), U(−a, ±iz)} = ∓i e^{±iπ(a/2 + ¼)}`
     ([DLMF 12.2.12](https://dlmf.nist.gov/12.2#E12)). In particular, the upper sign is
     `𝒲{U(a, z), U(−a, iz)} = −i e^{iπ(a/2 + ¼)}`.

   Each holds for all `a` and `z`. In particular `U(a, ·)` and `V(a, ·)` are linearly
   independent for every `a`.
4. **Special parameters** (DLMF 12.2.13, 12.2.14): `U(−n − ½, −z) = (−1)ⁿ U(−n − ½, z)` and
   `V(n + ½, −z) = (−1)ⁿ V(n + ½, z)` for `n : ℕ`.
5. **Connection formulas** ([DLMF 12.2.15–12.2.20](https://dlmf.nist.gov/12.2#v)). In each
   formula the upper signs are chosen together, and the lower signs are chosen together.
   All statements hold for every `z : ℂ`:
   - **12.2.15**, for every `a`:
     `U(a, −z) = −sin(πa) U(a, z) + π/Γ(½ + a) · V(a, z)`.
   - **12.2.16**, for every `a`:
     `V(a, −z) = cos(πa)/Γ(½ − a) · U(a, z) + sin(πa) V(a, z)`.
   - **12.2.17**, for `½ + a ∉ {0, −1, −2, …}`:
     `√(2π) U(−a, ±iz) = Γ(½ + a) (e^{∓iπ(a/2 − ¼)} U(a, z) + e^{±iπ(a/2 − ¼)} U(a, −z))`.
   - **12.2.18**, for `½ − a ∉ {0, −1, −2, …}`:
     `√(2π) U(a, z) = Γ(½ − a) (e^{∓iπ(a/2 + ¼)} U(−a, ±iz) + e^{±iπ(a/2 + ¼)} U(−a, ∓iz))`.
   - **12.2.19**, for every `a`:
     `U(a, z) = ±i e^{±iπa} U(a, −z) + √(2π)/Γ(½ + a) · e^{±iπ(a/2 − ¼)} U(−a, ±iz)`.
   - **12.2.20**, for every `a`:
     `V(a, z) = ∓i/Γ(½ − a) · U(a, z) + √(2/π) e^{∓iπ(a/2 − ¼)} U(−a, ±iz)`.

   The reciprocal-Gamma coefficients in 12.2.15, 12.2.16, 12.2.19 and 12.2.20 are interpreted
   as pinned, including their zeros. The Gamma factors multiplying brackets in 12.2.17 and
   12.2.18 require the stated exclusions. Their reciprocal-Gamma rearrangements are targets
   for every `a, z : ℂ`, with the same correlated signs:
   - `√(2π)/Γ(½ + a) · U(−a, ±iz) = e^{∓iπ(a/2 − ¼)} U(a, z) + e^{±iπ(a/2 − ¼)} U(a, −z)`;
   - `√(2π)/Γ(½ − a) · U(a, z) = e^{∓iπ(a/2 + ¼)} U(−a, ±iz) + e^{±iπ(a/2 + ¼)} U(−a, ∓iz)`.

   These entire identities include the parameters at which the reciprocal Gamma factor vanishes.
   Also prove the rearrangement of 12.2.15,
   `V(a, z) = Γ(½ + a)/π · (sin(πa) U(a, z) + U(a, −z))`, for
   `½ + a ∉ {0, −1, −2, …}`.
6. **The general quadratic equation** (DLMF 12.2.1 and the prose of §12.2(i)). For `α ≠ 0`
   and `s` with `s⁴ = −4α`, if `f` solves DLMF 12.2.2 with parameter `(β²/(4α) − γ)/s²`, then
   `z ↦ f (s (z + β/(2α)))` solves `w″ + (αz² + βz + γ) w = 0`.
7. **Oscillatory equation** (DLMF 12.2.3). `z ↦ U(ia, z e^{−iπ/4})` and
   `z ↦ U(−ia, z e^{iπ/4})` solve DLMF 12.2.3. In Whittaker's notation the first is
   `D_{−½−ia}(z e^{−iπ/4})`.

## Milestone 4: recurrences and derivatives

1. **`U` recurrences** (DLMF 12.8.1–12.8.4), for all `a, z`:
   - `z U(a, z) − U(a − 1, z) + (a + ½) U(a + 1, z) = 0`;
   - `U′(a, z) + (z/2) U(a, z) + (a + ½) U(a + 1, z) = 0`;
   - `U′(a, z) − (z/2) U(a, z) + U(a − 1, z) = 0`;
   - `2U′(a, z) + U(a − 1, z) + (a + ½) U(a + 1, z) = 0`.
2. **`V` recurrences** (DLMF 12.8.5–12.8.8), for all `a, z`:
   - `z V(a, z) − V(a + 1, z) + (a − ½) V(a − 1, z) = 0`;
   - `V′(a, z) − (z/2) V(a, z) − (a − ½) V(a − 1, z) = 0`;
   - `V′(a, z) + (z/2) V(a, z) − V(a + 1, z) = 0`;
   - `2V′(a, z) − V(a + 1, z) − (a − ½) V(a − 1, z) = 0`.
3. **Iterated derivatives** (DLMF 12.8.9–12.8.12). For `m : ℕ`:
   - `(d/dz)^m (e^{z²/4} U(a, z)) = (−1)^m (½ + a)_m e^{z²/4} U(a + m, z)`;
   - `(d/dz)^m (e^{−z²/4} U(a, z)) = (−1)^m e^{−z²/4} U(a − m, z)`;
   - `(d/dz)^m (e^{z²/4} V(a, z)) = e^{z²/4} V(a + m, z)`;
   - `(d/dz)^m (e^{−z²/4} V(a, z)) = (−1)^m (½ − a)_m e^{−z²/4} V(a − m, z)`.

   The Pochhammer symbol is `(ascPochhammer ℂ m).eval (½ + a)`, and the iterated derivative is
   Mathlib's `iteratedDeriv`.
4. The recurrences in Whittaker's notation:
   `D_{ν+1}(z) − z D_ν(z) + ν D_{ν−1}(z) = 0` and `D_ν′(z) + (z/2) D_ν(z) − ν D_{ν−1}(z) = 0`.

## Milestone 5: Hermite and error function cases

1. **Hermite cases** (DLMF 12.7.1–12.7.4). For `n : ℕ`:
   - `U(−½, z) = e^{−z²/4}`;
   - `D_n(z) = U(−n − ½, z) = e^{−z²/4} He_n(z)`;
   - `V(n + ½, z) = √(2/π) e^{z²/4} (−i)ⁿ He_n(iz)`;
   - `V(−½, z) = 2/√π · e^{z²/4} F(z/√2)`.

   Here `He_n(z)` is `aeval z (Polynomial.hermite n)`, and `F` is Dawson's integral
   `F(z) = e^{−z²} ∫₀¹ z e^{(sz)²} ds`. This roadmap introduces `F` as an entire function, with
   `F′ = 1 − 2zF` and `F(0) = 0`.
2. **The Hermite function bridge.** For real `x`,
   `TauCeti.hermiteFunction n x = (D_n(√2 x)).re / √(n! √π)`, and `D_n(√2 x)` is real.
3. **The repeated Gaussian integrals** (DLMF 12.7.7). The family is indexed by `n : ℕ`:
   `Hh_n(z) = ∫₀^∞ tⁿ/n! · e^{−(z+t)²/2} dt` for `z : ℂ`, using `MeasureTheory.integral`
   over `Set.Ioi 0`. The notation `Hh_{−1}(z)` abbreviates `e^{−z²/2}`; it is not an
   additional integer-indexed function. Build the following basic API:
   - absolute convergence of the defining integral for every `n, z`, and entirety of
     `Hh_n` in `z`;
   - `Hh₀′(z) = −e^{−z²/2}` and `Hh_{n+1}′(z) = −Hh_n(z)` for `n : ℕ`;
   - `Hh₁(z) = e^{−z²/2} − z Hh₀(z)` and
     `(n + 2) Hh_{n+2}(z) = Hh_n(z) − z Hh_{n+1}(z)` for `n : ℕ`;
   - `Hh_n(0) = 2^{(n−1)/2} Γ((n + 1)/2) / n!`, and reality and positivity of
     `Hh_n(x)` for real `x`;
   - `U(n + ½, z) = e^{z²/4} Hh_n(z)` for `n : ℕ`. The `n = −1` case of DLMF 12.7.7
     is the identity `U(−½, z) = e^{−z²/4}` in step 1.

   In the value at zero, `2^{(n−1)/2}` uses `Real.rpow`, with `(n−1)/2` computed after
   casting `n` to `ℝ`, and the resulting real value is coerced to `ℂ`. Gaussian decay
   supplies the integrability and differentiation bounds; integration by parts gives the
   recurrences. Establish the bridge to `U` from these identities and the initial-value
   uniqueness of Milestone 2, using the initial values from Milestone 3.
4. **Complementary error function** (DLMF 12.7.5, 12.7.6). For real `x`:
   - `U(½, x) = √(π/2) e^{x²/4} erfc(x/√2)`;
   - `U(n + ½, x) = √(π/2) (−1)ⁿ/n! · e^{−x²/4} (d/dx)ⁿ (e^{x²/2} erfc(x/√2))`.

   Here `erfc` is `TauCeti.Real.erfc`, and the second statement uses `iteratedDeriv` on `ℝ`.

## Milestone 6: integral representations

1. **The Laplace form** (DLMF 12.5.1). For `Re a > −½` and all `z`:

   `U(a, z) = e^{−z²/4} / Γ(½ + a) · ∫₀^∞ t^{a−½} e^{−t²/2 − zt} dt`,

   with the integral over `Set.Ioi 0` and absolutely convergent.
2. **Positivity.** For real `a > −½` and real `x`, `U(a, x)` is real and positive. For real
   `a` and real `x`, `U(a, x)` and `V(a, x)` are real.
3. **Further real integrals** (DLMF 12.5.2–12.5.4):
   - For `Re a > −½`, `Re z > 0` (12.5.2):

     `U(a, z) = z e^{−z²/4} / Γ(¼ + a/2) · ∫₀^∞ t^{a/2−¾} e^{−t} (z² + 2t)^{−a/2−¾} dt`.

   - For `Re a > −3/2`, `Re z > 0` (12.5.3):

     `U(a, z) = e^{−z²/4} / Γ(¾ + a/2) · ∫₀^∞ t^{a/2−¼} e^{−t} (z² + 2t)^{−a/2−¼} dt`.

   - For `Re a < ½`, all `z` (12.5.4):

     `U(a, z) = √(2/π) e^{z²/4} ∫₀^∞ t^{−a−½} e^{−t²/2} cos(zt + π(a/2 + ¼)) dt`.

   All three integrals converge absolutely under their stated hypotheses and are expressed
   using `MeasureTheory.integral` over `Set.Ioi 0`. In
   [DLMF 12.5.4](https://dlmf.nist.gov/12.5#E4), the condition `Re a < ½` ensures
   integrability at zero, and the Gaussian dominates the growth of the complex cosine at infinity.
4. **Loop integral** (DLMF 12.5.5). For `a ≠ ½, 3/2, 5/2, …` and `r > 0`, put `q = a − ½` and

   `L_r(a, z) = (e^{−iπq} − e^{iπq}) ∫_r^∞ s^q e^{−zs−s²/2} ds
                + ∫_{−π}^{π} e^{z r e^{iθ} − r² e^{2iθ}/2} r^q e^{iθq} i r e^{iθ} dθ`.

   Then `U(a, z) = Γ(½ − a) e^{−z²/4} L_r(a, z) / (2πi)`, independently of `r`.
   The lower lip runs from `−∞` to `−r` with phase `e^{−iπq}`; the circle runs
   counterclockwise from angle `−π` to `π`; the upper lip runs from `−r` to `−∞` with phase
   `e^{iπq}`. This fixes both ray signs. The circle term is the parameterized `circleIntegral`
   with the principal power, split at the cut and read by its one-sided boundary values.
5. **Straight-line contour integrals** (DLMF 12.5.6, 12.5.7). For every `c > 0`:
   - `U(a, z) = e^{z²/4}/√(2π) · ∫_ℝ e^{−z(c+iy)+(c+iy)²/2} (c+iy)^{−a−½} dy` (12.5.6);
   - `V(a, z) = e^{−z²/4}/(2π) · ∑_{ε∈{−1,1}} ∫_ℝ e^{z(s+εic)−(s+εic)²/2} (s+εic)^{a−½} ds`
     (12.5.7).

   Both hold for all `a, z`, with absolutely convergent integrals over `ℝ`.
   The `U` contour is oriented upwards, with `dt = i dy` already absorbed in its prefactor.
   Both `V` contours run from left to right, with `dt = ds`. All powers are principal: on
   the upper line the negative-real-end argument approaches `+π`, and on the lower line it
   approaches `−π`, giving respectively `e^{+iπ(a−½)}` and `e^{−iπ(a−½)}` at the cut.
6. **Gamma estimates and Barnes integration tools.** These are general targets, built from
   the existing Gamma, Mellin, residue, integration and rectangle-Cauchy APIs listed above.
   They precede the Barnes identities in step 7.

   **(a) Vertical Gamma bounds.** For `x > 0`, prove convergence and the modulus identity

   `∏_{k≥0} (1 + y²/(x + k)²) = Γ(x)² / |Γ(x + iy)|²`.

   Obtain it from `Complex.GammaSeq_tendsto_Gamma`. Prove its comparison in `x`, equivalently
   `|Γ(x + iy)| ≤ Γ(x)/Γ(x′) · |Γ(x′ + iy)|` for `0 < x ≤ x′`, and the reflection-formula value
   `|Γ(1 + iy)|² = πy / sinh(πy)` for `y ≠ 0`, with value `1` at `y = 0`.
   Deduce the following uniform bound: for every real `u ≤ v` and `η > 0`, there are
   `C > 0` and `K : ℕ` such that

   `|Γ(x + iy)| ≤ C (1 + |y|)^K exp(−π|y|/2)`

   whenever `u ≤ x ≤ v` and `|x + iy + n| ≥ η` for every `n : ℕ`. Its corollaries include
   all heights on a positive closed strip, all heights on a fixed line `x ∉ {0, −1, −2, …}`,
   and `|y| ≥ 1` on any bounded real strip. The separation condition excludes neighborhoods
   of poles; the large-height corollary has no restriction on the real parts within the strip.
   Gamma recurrence and compactness away from poles extend the positive-real-part bounds.

   **(b) Gamma residues and vertical-line shifts.** Prove
   `(z + n) Γ(z) → (−1)^n/n!` as `z → −n`, `z ≠ −n`, and extend the numerator
   holomorphically by assigning it the value `(−1)^n/n!` at `−n`. These follow from Gamma
   recurrence and the residue at zero already in Mathlib. Derive the affine-chain factor for
   `Γ(A − 2t)` at `t = (A + n)/2`, including its factor `−½`.

   For `c₁ < c₂`, let `F` be holomorphic on the closed strip `c₁ ≤ Re t ≤ c₂` except for a
   finite set `P` of simple poles strictly inside it. Require integrability of
   `y ↦ F(c_j + iy)` on both boundary lines and
   `∫_{c₁}^{c₂} F(x + iT) dx → 0` as `T → +∞` and as `T → −∞`. Prove

   `∫_ℝ F(c₂ + iy) dy − ∫_ℝ F(c₁ + iy) dy = 2π ∑_{p∈P} Res(F, p)`.

   Here a simple pole with residue `r` is expressed by a holomorphic local numerator
   `φ(t)` in `F(t) = φ(t)/(t − p)` off `p`, with `φ(p) = r`. Include the pole-free and
   single-pole forms and the finite iteration. Identify `r` with `TauCeti.Contour.residue F p`
   using `residue_div_sub_pow_of_analyticAt` and invariance under punctured-neighborhood
   equality from [ContourIntegration](../../Completed/ContourIntegration/README.md).
   The numerator form exposes the Gamma recurrence calculation and also covers removable
   poles when `φ(p) = 0`. It is a computational interface to that residue API.
   Subtract the finite principal parts and apply rectangle Cauchy to the holomorphic
   remainder, then pass to infinite height under the stated decay assumptions. These
   whole-line conclusions extend the consumed contour theory.
   Line integrals use `dy`; the corresponding upward contour integrals use `dt = i dy` and
   have the factor `2πi`.
   For decreasing lines `c_n` with exactly one simple pole `p_n` in each intervening strip,
   under the same strip hypotheses, prove the finite partial-sum identity and the
   contour-closing corollary: if the integrals on `c_n` tend to zero, the partial residue
   sums converge to the integral on `c₀`. When the residue series is `Summable`, conclude
   `HasSum (fun n ↦ 2π Res(F, p_n)) (∫_ℝ F(c₀ + iy) dy)`.

   **(c) Exponential Mellin inversion.** For real `c > 0` and `Re w > 0`, prove absolute
   convergence as `Complex.VerticalIntegrable (fun s ↦ Γ(s) w^{−s}) c`, and

   `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}`.

   For positive real `w`, apply Mathlib's `mellinInv_mellin_eq` to
   `f(x) = Real.exp (-x)`, using `GammaIntegral_eq_mellin`, `Gamma_eq_integral`,
   `GammaIntegral_convergent` and `Complex.VerticalIntegrable Gamma c` from step (a).
   The complex extension uses the vertical Gamma bound for absolute convergence,
   locally uniform domination and the identity theorem on `Re w > 0`.

   **(d) Bounds for the Barnes kernels.** For
   `B(A, z, t) = Γ(t) Γ(A − 2t) 2^t z^{2t}` and fixed admissible `A, z, c` as in step 7,
   prove a bound `C (1 + |y|)^K exp(−κ|y|)` for `|B(A, z, c + iy)|`, with
   `κ = 3π/2 − 2|arg z|`. For the kernel multiplied by `cos(πt)`, use
   `κ = π/2 − 2|arg z|`. Prove the corresponding tail bounds uniformly when `c` ranges
   over a compact positive interval, and locally uniformly in the parameters on admissible
   lines, using a common positive lower bound for `κ` on compact subsets of the sector.
   Deduce absolute integrability, vanishing horizontal connector integrals at both
   ends, and holomorphy of the line integrals in `A` and `z` on their admissible open sets.
   These bounds discharge the hypotheses of the shifts and analytic continuation in step 7.

7. **Mellin–Barnes integrals** ([DLMF 12.5.8–12.5.9](https://dlmf.nist.gov/12.5#iii)).
   All statements require `z ≠ 0`. First prove the absolutely convergent straight-line forms,
   oriented upwards along `t = c + iy`, `y : ℝ`:
   - For `|arg z| < 3π/4` and `0 < 2c < ½ + Re a` (12.5.8):

     `U(a, z) = e^{−z²/4} z^{−a−½}/(2π Γ(½+a)) · ∫_ℝ B(½+a, z, c+iy) dy`.

   - For `|arg z| < π/4` and `0 < 2c < ½ − Re a` (12.5.9):

     `V(a, z) = √(2/π) e^{z²/4} z^{a−½}/(2π Γ(½−a))
                · ∫_ℝ B(½−a, z, c+iy) cos(π(c+iy)) dy`.

   Here `B` is the kernel specified in step 6(d). The factor `i` in `dt = i dy` has
   already been absorbed into each prefactor.

   Insert the exponential Mellin inversion from step 6(c) into the Laplace integral of
   step 1. Prove absolute integrability of the resulting double integral to justify Fubini;
   this gives 12.5.8 first for `Re z > 0`. The bounds of step 6(d) and the identity theorem
   extend it to `|arg z| < 3π/4`. Combining the two rotations of this formula with the
   connection formulas of Milestone 3 gives 12.5.9 in `|arg z| < π/4`.

   Extend each representation to a separating contour for all its regular parameters:
   `a + ½ ∉ {0, −1, −2, …}` for `U`, and `½ − a ∉ {0, −1, −2, …}` for `V`.
   Express that contour by a vertical-line integral and a finite residue correction. In detail,
   put `A = ½ + a`, `h(t) = 1` for `U`, and `A = ½ − a`, `h(t) = cos(πt)` for `V`.
   For any `c > 0` with `2c ≠ Re A + n` for every `n : ℕ`, subtract from the upward
   line integral `2πi` times the sum of residues of
   `Γ(t) Γ(A − 2t) 2^t z^{2t} h(t)` at `t = (A + n)/2` with `Re A + n < 2c`.
   Write the residue at that pole as
   `R_n(A, z, h) = (−1)^{n+1} Γ((A + n)/2) 2^{(A+n)/2} z^{A+n} h((A + n)/2) / (2 n!)`.
   With `A₊ = ½ + a` and `A₋ = ½ − a`, the complete corrected identities are

   `U(a, z) = e^{−z²/4} z^{−a−½}/Γ(A₊)
              · ((1/(2π)) ∫_ℝ B(A₊, z, c+iy) dy − ∑_{n≥0, Re A₊+n<2c} R_n(A₊, z, 1))`,

   `V(a, z) = √(2/π) e^{z²/4} z^{a−½}/Γ(A₋)
              · ((1/(2π)) ∫_ℝ B(A₋, z, c+iy) cos(π(c+iy)) dy
                 − ∑_{n≥0, Re A₋+n<2c} R_n(A₋, z, cos(π·)))`.

   In `R_n(A₊, z, 1)`, `1` denotes the constant function. Both residue sums are finite.
   Each right-hand side is independent of its admissible line and obeys the corresponding
   sector restriction above. The symbols `A₊`, `A₋` and `R_n` are notation within this step.

## Milestone 7: Watson's lemma

This milestone is general. It is stated for a function `q : ℝ → ℂ` on `(0, ∞)`, and nothing in
it refers to parabolic cylinder functions.

1. **Hypotheses.** Fix real `μ > 0` and complex `λ` with `Re λ > 0`, and coefficients
   `c : ℕ → ℂ`. Assume:
   - `q` is locally integrable on `(0, ∞)`;
   - `t ↦ e^{−σt} q(t)` is integrable on `(1, ∞)` for some real `σ`;
   - as `t → 0⁺`, for every `N`,
     `q(t) − ∑_{s<N} c_s t^{(s+λ)/μ − 1} = O(|t|^{(N+Re λ)/μ − 1})`.
2. **Conclusion.** For every `δ ∈ (0, π/2)` and every `N`, as `z → ∞` in `|ph z| ≤ π/2 − δ`:

   `∫₀^∞ e^{−zt} q(t) dt − ∑_{s<N} Γ((s+λ)/μ) c_s z^{−(s+λ)/μ} = O(|z|^{−(N+Re λ)/μ})`.

   The comparison functions use real powers; the series terms retain their complex powers.
   The Laplace integral converges absolutely for `Re z > σ`. That is eventually true in the
   sector filter.
3. **Real form.** The case of real `z → +∞` is stated separately along `atTop`, as a corollary.

## Milestone 8: large-argument asymptotics

1. **`U` in the principal sector** (DLMF 12.9.1). For every `a`, every `δ ∈ (0, 3π/4)` and every
   `N`, as `z → ∞` in `|ph z| ≤ 3π/4 − δ`:

   `e^{z²/4} z^{a+½} U(a, z) − ∑_{s<N} (−1)^s (½ + a)_{2s} / (s! (2z²)^s) = O(|z|^{−2N})`.

   The following identities and estimates are targets of this step:
   - **Rotated Laplace representation.** For `Re a > −½`, real `|θ| < π/4`, and every `z`,

     `Γ(½ + a) e^{z²/4} U(a, z) = e^{iθ} ∫₀^∞ e^{−z e^{iθ} r} (r e^{iθ})^{a−½} e^{−(r e^{iθ})²/2} dr`.

     The integral over `Set.Ioi 0` is absolutely convergent. Prove equality with the
     unrotated integral of Milestone 6, including the bounds at zero and at infinity needed
     for rotating the ray.
   - **Watson estimates on rotated rays.** For each fixed `θ` as above, verify the
     hypotheses of Milestone 7 for
     `q_θ(r) = e^{iθ} (r e^{iθ})^{a−½} e^{−(r e^{iθ})²/2}`, with `μ = 1`, `λ = a + ½`,
     and Laplace variable `z e^{iθ}`. Obtain the expansion uniformly on each closed sector
     `|arg z + θ| ≤ π/2 − ε`, `ε ∈ (0, π/2)`, within the principal argument range.
     For every `δ ∈ (0, 3π/4)`, cover `|arg z| ≤ 3π/4 − δ` by finitely many such sectors
     with fixed rotation angles. This proves the full-sector estimate for `Re a > −½`.
   - **Parameter shifts.** For `z ≠ 0`, write `G(a, z) = e^{z²/4} z^{a+½} U(a, z)`.
     The algebraic recurrence of Milestone 4 (DLMF 12.8.1) gives
     `G(a − 1, z) = G(a, z) + (a + ½) z^{−2} G(a + 1, z)`.
     Prove the corresponding identities for the coefficients and truncated sums, and
     propagate the remainder bounds downwards in integer shifts to every complex `a`.
2. **`V` in its sector** (DLMF 12.9.2). For every `a`, `δ ∈ (0, π/4)` and `N`, as `z → ∞` in
   `|ph z| ≤ π/4 − δ`:

   `√(π/2) e^{−z²/4} z^{−a+½} V(a, z) − ∑_{s<N} (½ − a)_{2s} / (s! (2z²)^s) = O(|z|^{−2N})`.
3. **Adjacent sectors** ([DLMF 12.9.3–12.9.4](https://dlmf.nist.gov/12.9#E3)). Write
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

   **12.9.3** (the two choices of sign for `U`):

   ```text
   (fun w : ℂ ↦ U(a, exp w) − E₋(a, w) S₋(a, N, w)
       − C_U(a, σ) E₊(a, w) S₊(a, N, w))
     =O[(comap Complex.re atTop) ⊓
       𝓟 {w : ℂ | π/4 + δ ≤ σ * w.im ∧ σ * w.im ≤ 5π/4 − δ}]
     (fun w ↦ (‖E₋(a, w)‖ + ‖E₊(a, w)‖) * Real.exp (−(2 * N : ℝ) * w.re))
   ```

   **12.9.4** (the two choices of sign for `V`):

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
4. **Consequences on the real line.**
   - `U(a, x) ∼ x^{−a−½} e^{−x²/4}` and `V(a, x) ∼ √(2/π) x^{a−½} e^{x²/4}` as `x → +∞`, as
     `Asymptotics.IsEquivalent` statements.
   - `U(a, ·)` tends to `0` along `atTop`, and `|V(a, x)| → ∞` along `atTop`.
5. **The recessive solution.** If `f` solves DLMF 12.2.2 and `f(x) → 0` as `x → +∞` along the
   real axis, then `f = f(0)/U(a, 0) · U(a, ·)` when `U(a, 0) ≠ 0`, and in all cases `f` is a
   constant multiple of `U(a, ·)`. Proof route: the Wronskian with `V(a, ·)` and the growth of
   `V` from step 4.

## Milestone 9: integrals and addition theorems

1. **Integrals** (DLMF 12.12.1–12.12.4):
   - For every `a : ℂ` and `Re μ > 0` (12.12.1):

     `∫₀^∞ e^{−t²/4} t^{μ−1} U(a, t) dt = √π 2^{−(μ+a+½)/2} Γ(μ) / Γ((μ+a+3/2)/2)`.

   - For `Re a < −½` (12.12.2):

     `∫₀^∞ e^{−3t²/4} t^{−a−3/2} U(a, t) dt = 2^{¼+a/2} Γ(−a−½) cos(π(a/4 + ⅛))`.

   - For `Re a < ½` and real `x > 0` (12.12.3):

     `∫₀^∞ e^{−t²/4} t^{−a−½} U(a, t)/(x²+t²) dt
        = √(π/2) Γ(½−a) x^{−a−3/2} e^{x²/4} U(−a, x)`.

   - For `Re a < ½` and every `z : ℂ` (12.12.4):

     `U(a, z)² + Ū(a, z)² = 2^{3/2}/π · Γ(½−a) · ∫₀^∞ e^{2at + z² tanh(t)/2}/√(sinh(2t)) dt`.

   Here `Ū(a, z)` abbreviates `Complex.Gamma (½ − a) * V(a, z)` (12.2.21), using Mathlib's
   total Gamma. It is therefore `0` at `a = ½, 3/2, …`, where DLMF leaves it undefined.
   Its only target identity, 12.12.4, assumes `Re a < ½` and never meets those parameters.
   It receives no separate definition. The square root in the integral is the positive real
   square root for `t > 0`. All four integrals are absolutely convergent over `Set.Ioi 0`;
   convergence at `∞` uses Milestone 8.
2. **Addition theorems** (DLMF 12.13.1–12.13.4), for all `a, x, y`, as `HasSum` statements:
   - `U(a, x + y) = e^{xy/2 + y²/4} ∑_m (−y)^m/m! · U(a − m, x)`;
   - `U(a, x + y) = e^{−xy/2 − y²/4} ∑_m (−1)^m (½ + a)_m y^m/m! · U(a + m, x)`;
   - `V(a, x + y) = e^{xy/2 + y²/4} ∑_m (−1)^m (½ − a)_m y^m/m! · V(a − m, x)`;
   - `V(a, x + y) = e^{−xy/2 − y²/4} ∑_m y^m/m! · V(a + m, x)`.
3. **The rotational addition theorem** (DLMF 12.13.5, with the normalization below).
   For `a : ℂ` with `Re a ≤ −½`, real `x, y`, and `0 ≤ t < π/4`, prove the `HasSum` identity

   `U(a, x cos t + y sin t)
      = (cos t)^{−a−½} e^{(x sin t − y cos t)²/4}
        ∑_{m≥0} (−1)^m (a+½)_m/m! · (tan t)^m U(a+m, x) U(−m−½, y)`.

   The factor `(cos t)^{−a−½}` is required by the Hermite cases; it is absent from the
   displayed DLMF formula. Its base is positive throughout `0 ≤ t ≤ π/4`.
   At `t = π/4`, require absolute convergence as `HasSum` when `x > 0`, when `x = 0` and
   `Re a < −½`, and for every real `x` in the terminating cases `a = −n − ½`, `n : ℕ`.
   For all real `x, y`, the endpoint identity is an Abel limit: multiply the endpoint
   summand by `r^m`, sum for `0 ≤ r < 1`, and take `r → 1⁻`.
   Thus the closed DLMF angle range `0 ≤ t ≤ π/4` is covered with an explicit convergence
   convention; an unrestricted `HasSum` at the endpoint is not asserted.

## Milestone 10: the real solutions `W(a, ±x)`

Fix real `a`.

1. **Definition and reality.** `W(a, x)` as pinned. The complex expression inside the real
   part is real for real `x`. `W(a, ·)` is smooth on `ℝ`, solves `w″ + (x²/4 − a) w = 0`, and
   has the initial values DLMF 12.14.1–12.14.2.
2. **Wronskian** (DLMF 12.14.3): `𝒲{W(a, x), W(a, −x)} = 1` for all `x`.
3. **Connection with `U`** (DLMF 12.14.4–12.14.7). With
   `k = √(1 + e^{2πa}) − e^{πa}`, `1/k = √(1 + e^{2πa}) + e^{πa}`, `ρ = π/8 + φ₂/2`, and `φ₂`
   as pinned:

   `W(a, x) = √(k/2) e^{πa/4} (e^{iρ} U(ia, x e^{−iπ/4}) + e^{−iρ} U(−ia, x e^{iπ/4}))`.

   This includes `Γ(½ + ia) = |Γ(½ + ia)| e^{iφ₂(a)}`.
4. **Power series** (DLMF 12.14.9–12.14.12). Write
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
5. **Kummer form** (DLMF 12.14.15, 12.14.16). The even and odd solutions are
   `Re(e^{−ix²/4} Γ(½) 𝐌(¼ − ia/2, ½, ix²/2))` and
   `Re(x e^{−ix²/4} Γ(3/2) 𝐌(¾ − ia/2, 3/2, ix²/2))`.
6. **The case `a = 0`** (DLMF 12.14.13, 12.14.14). For `x > 0`:
   - `W(0, ±x) = 2^{−5/4} √(πx) (J_{−1/4}(x²/4) ∓ J_{1/4}(x²/4))`, with Mathlib's
     `Complex.besselJ`;
   - `deriv (fun t ↦ W(0, t)) x
        = −2^{−9/4} x √(πx) (J_{3/4}(x²/4) + J_{−3/4}(x²/4))` (12.14.14, upper sign);
   - `deriv (fun t ↦ W(0, −t)) x
        = −2^{−9/4} x √(πx) (J_{3/4}(x²/4) − J_{−3/4}(x²/4))` (12.14.14, lower sign).

   These identities are read in `ℂ` after coercing their real left-hand sides and prefactors.
   The lower-sign derivative is that of the composite function `t ↦ W(0, −t)`; it equals
   `−(deriv (fun t ↦ W(0, t))) (−x)`.
7. **Large `x`** (DLMF 12.14.17–12.14.23). For `x > 0` let
   `ω = x²/4 − a log x + π/4 + φ₂/2`, and define
   `s(x) = e^{−iω} (√(x/(2k)) W(a, x) + i √(kx/2) W(a, −x))`.
   - The identities DLMF 12.14.17–12.14.18 hold with `s₁ = Re s` and `s₂ = Im s`.
   - For every `N`, as `x → +∞`:

     `s(x) − ∑_{r<N} (−i)^r (½ + ia)_{2r} / (2^r r! x^{2r}) = O(x^{−2N})`.

   - Consequently `W(a, x) = √(2k/x) (cos ω + O(x^{−2}))` and
     `W(a, −x) = √(2/(kx)) (sin ω + O(x^{−2}))`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.
- **Uniform expansions for large parameter** (DLMF §12.10, §12.14(ix)): Olver's expansions in
  elementary functions and in Airy functions, Temme's expansions, and their error bounds. They
  need the Airy functions (DLMF Chapter 9) and Olver's turning-point theory.
- **Zeros** (DLMF §12.11): the real and complex zeros of `U(a, z)` and their asymptotics.
- **Modulus and phase functions** (DLMF 12.2.22–12.2.23, 12.14(x)) with continuous phases.
  The abbreviation `Ū = Γ(½ − a) V` of 12.2.21 is already part of Milestone 9.
- **Explicit remainder bounds and re-expansions** (DLMF §12.9(ii)), including exponential
  improvement beyond the Poincaré `O`-remainders of Milestone 8.
- **Relations to Kummer's `U`, the Whittaker functions and the modified Bessel functions**
  (DLMF 12.7.8–12.7.11 and 12.7.14). These belong to a confluent hypergeometric roadmap (DLMF
  Chapter 13) and a Bessel roadmap (DLMF Chapter 10).
- **The complex forms of DLMF 12.7.5–12.7.6 and the finite identity
  [12.13.6](https://dlmf.nist.gov/12.13#E6)**, which need complex `erfc`. Complex `erf`, `erfc`
  and the Faddeeva function are outside this roadmap; the `F` and `Hh_n` theory specified in
  Milestone 5 is included.
- **The generalized parabolic cylinder equation** (DLMF §12.15).

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 12 (N. M. Temme), Chapter 13 (A. B.
  Olde Daalhuis) and §2.3 (F. W. J. Olver, R. Wong), <https://dlmf.nist.gov/12>.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974, Chapters 3 and 7.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapter 10.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, Chapter XVI.
- J. C. P. Miller, *Tables of Weber Parabolic Cylinder Functions*, H.M. Stationery Office, 1955
  (introduction: the definitions of `U`, `V` and `W`).

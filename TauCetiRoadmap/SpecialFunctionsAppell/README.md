# Roadmap: the Appell functions

**Summary.** This roadmap builds the theory of the four Appell functions `F₁`, `F₂`, `F₃`, `F₄`
of two complex variables, and of Horn's functions `G₂` and `G₃`, from Chapter 16 of the NIST
*Digital Library of Mathematical Functions* (DLMF; see [References](#references)), as a library.
The Appell functions are the double series

```text
F₁(α; β, β′; γ; x, y)     = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!) xᵐ yⁿ   (DLMF 16.13.1)
F₂(α; β, β′; γ, γ′; x, y) = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ/((γ)ₘ (γ′)ₙ m! n!) xᵐ yⁿ  (DLMF 16.13.2)
F₃(α, α′; β, β′; γ; x, y) = ∑_{m,n} (α)ₘ (α′)ₙ (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!) xᵐ yⁿ  (DLMF 16.13.3)
F₄(α, β; γ, γ′; x, y)     = ∑_{m,n} (α)_{m+n} (β)_{m+n}/((γ)ₘ (γ′)ₙ m! n!) xᵐ yⁿ    (DLMF 16.13.4)
```

on the domains `max(|x|, |y|) < 1`, `|x| + |y| < 1`, `max(|x|, |y|) < 1` and
`√|x| + √|y| < 1` respectively. Neither Mathlib nor Tau Ceti has a function of two variables of
hypergeometric type. This roadmap defines the regularized series for all complex parameters, the
principal branches of `F₁` and `F₃` on `{(x, y) | 1 − x, 1 − y ∈ ℂ \ (−∞, 0]}` and of `F₂` on the
domain of its Euler integral, and proves the theory of DLMF §§16.13–16.16 for them.

The roadmap covers:
- the four double series: convergence, holomorphy, holomorphy in the parameters, symmetries,
  derivatives, reductions to the Gauss function and the expansions in series of Gauss functions;
- the principal branches of `F₁`, `F₂` and `F₃`, their construction by the Euler integrals
  16.15.1–16.15.3 and shift relations in the parameters, and their holomorphy in all parameters
  and both variables;
- the systems of partial differential equations 16.14.1–16.14.4, and Horn's `G₂` and `G₃` with
  their systems;
- the reduction formulas 16.16.1–16.16.5 and the transformations 16.16.8–16.16.9;
- for `F₄`: the Euler integral 16.15.4, the Burchnall–Chaundy expansion 16.16.7 and its cases
  16.16.5_5 and 16.16.6, and the connection formula at infinity 16.16.10.

**This roadmap is DLMF §§16.13–16.16, not all of Chapter 16.** The formula ranges are in the table
under [Scope and ownership](#scope-and-ownership). The other 22 of the 24 double series that
DLMF §16.14(ii) counts besides the Appell functions, the
large-parameter asymptotics, the double Mellin–Barnes integrals, the quadratic transformations and
a principal branch of `F₄` in two variables are listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

The roadmap rests on Mathlib and Tau Ceti and on
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md), which is on main
and supplies the Gauss function on its cut plane, the Chu–Vandermonde sum, the Pfaff transformation
and the connection formula 15.8.2 at infinity.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Appell/`, beside the Gauss function of
SpecialFunctionsHypergeometric.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The double series** (DLMF §16.13).
2. **The principal branches of `F₁`, `F₂`, `F₃`** (DLMF 16.15.1–16.15.3).
3. **Partial differential equations** (DLMF §16.14).
4. **Reductions and transformations of `F₁`, `F₂`, `F₃`** (DLMF 16.16.1–16.16.5, 16.16.8,
   16.16.9).
5. **The function `F₄`** (DLMF 16.15.4, 16.16.5_5, 16.16.6, 16.16.7, 16.16.10).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 16.13.1–16.13.4 | The series, their domains of convergence, holomorphy, symmetries, derivatives, reductions and fibre expansions (Layer 1). |
| 16.15.1–16.15.3 | The Euler integrals, by which the principal branches of `F₁`, `F₂`, `F₃` are constructed (Layer 2). |
| 16.14.1–16.14.6 | The systems of `F₁`–`F₄`, and Horn's `G₂`, `G₃` with their systems (Layer 3). |
| 16.16.1–16.16.5, 16.16.8, 16.16.9 | Reductions and transformations of `F₁`, `F₂`, `F₃` (Layer 4). |
| 16.15.4, 16.16.5_5, 16.16.6, 16.16.7, 16.16.10 | The Euler integral, reductions, the Burchnall–Chaundy expansion and the connection at infinity of `F₄` (Layer 5). |

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti nor SpecialFunctionsHypergeometric provides:

| Result | Target |
|---|---|
| Summability of a double series over `ℕ × ℕ` from a bound on its terms, and termwise differentiation of a double power series | 1.1–1.3 |
| The shift relations of `𝐅₁`, `𝐅₂`, `𝐅₃` in their parameters | 2.2 |
| Holomorphy of the Euler integrals in the variables and the parameters on their domains | 2.3 |
| Finite identities of Pochhammer symbols for the Taylor coefficients of 16.16.4, 16.16.7 and 16.15.4, with recurrence certificates | 4.2, 5.1–5.2 |
| The fibre sum of `F₄` in Gauss functions of `y`, and its convergence for large `y` | 5.3 |

**What it does not own:**
- The Gauss function and DLMF Chapter 15 (SpecialFunctionsHypergeometric), whose results 1.2–1.4,
  4.2 and 5.1 it consumes.
- The generalized hypergeometric functions `ₚF_q` of DLMF §§16.2–16.12 and the Meijer
  `G`-function of §§16.17–16.22.
- The other Horn functions, the large-parameter asymptotics, the double Mellin–Barnes integrals,
  the inverse Laplace transforms, the expansions for large `x` or `y` other than 16.16.10, the
  quadratic transformations and the principal branch of `F₄` in two variables.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the four Appell series, the principal branches
of `F₁`, `F₂` and `F₃`, Horn's `G₂` and `G₃`, and every formula of DLMF §§16.13–16.16 stated
through them, the Gauss function, elementary functions and `Γ`; it consumes the Gauss function and
its sums and transformations from SpecialFunctionsHypergeometric.

## Conventions

- **Parameters and variables.** DLMF's `α, α′, β, β′, γ, γ′` are Lean's `a a' b b' c c' : ℂ`, in
  DLMF's order, followed by the variables `x y : ℂ`. A point of `ℂ × ℂ` is `(x, y)`.
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`. For `k : ℤ`, the symbol
  `Γ(a + k)/Γ(a)` of Horn's series is `pochZ a k = Gamma (a + k) / Gamma a`, used only where
  `a ∉ ℤ`, so that neither Gamma has a pole.
- **Regularized functions.** As in SpecialFunctionsHypergeometric, the primary objects are the
  regularized functions, with `1/Γ` of each bottom parameter in place of `1/(γ)ₖ`:

```text
𝐅₁(α; β, β′; γ; x, y)     = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ / (Γ(γ + m + n) m! n!) xᵐ yⁿ
𝐅₂(α; β, β′; γ, γ′; x, y) = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ / (Γ(γ + m) Γ(γ′ + n) m! n!) xᵐ yⁿ
𝐅₃(α, α′; β, β′; γ; x, y) = ∑_{m,n} (α)ₘ (α′)ₙ (β)ₘ (β′)ₙ / (Γ(γ + m + n) m! n!) xᵐ yⁿ
𝐅₄(α, β; γ, γ′; x, y)     = ∑_{m,n} (α)_{m+n} (β)_{m+n} / (Γ(γ + m) Γ(γ′ + n) m! n!) xᵐ yⁿ
```

  with `(Gamma ·)⁻¹`, which vanishes at the poles, so that they are defined for all parameters.
  `F₁ = Γ(γ) 𝐅₁`, `F₂ = Γ(γ) Γ(γ′) 𝐅₂`, `F₃ = Γ(γ) 𝐅₃` and `F₄ = Γ(γ) Γ(γ′) 𝐅₄`; these are `0`
  when a bottom parameter lies in `{0, −1, −2, …}`, Mathlib's junk value of `Γ`, where DLMF's
  function does not exist. Every formula is stated in regularized form for all parameters where
  that form holds, and DLMF's form in `F`, under DLMF's hypothesis that no bottom parameter lies in
  `{0, −1, −2, …}`, is stated beside it as a corollary.
- **Names.** In `Complex`: `regularizedAppellF1 a b b' c x y` for `𝐅₁` and `appellF1 a b b' c x y`
  for `F₁`; likewise `regularizedAppellF2 a b b' c c' x y` and `appellF2`,
  `regularizedAppellF3 a a' b b' c x y` and `appellF3`, `regularizedAppellF4 a b c c' x y` and
  `appellF4`; the series `regularizedAppellF1Series`, `regularizedAppellF2Series` and
  `regularizedAppellF3Series` (`𝐅₄` is its series); `hornG2 a a' b b' x y` and `hornG3 a a' x y`.
  The Gauss function is SpecialFunctionsHypergeometric's
  `Complex.regularizedGaussHypergeometric a b c z` (`𝐅(a, b; c; z)`) and
  `Complex.gaussHypergeometric a b c z` (`F(a, b; c; z)`).
- **Double series** are `tsum` over `ℕ × ℕ` of `coeff m n * x ^ m * y ^ n`, and their convergence
  is `HasSum` over `ℕ × ℕ`, which is unconditional; on the stated domains it is absolute.
- **Domains.** The series domains are
  - `appellBidisc = {(x, y) | ‖x‖ < 1 ∧ ‖y‖ < 1}` for `F₁`, `F₃` and `G₂`;
  - `appellSimplex = {(x, y) | ‖x‖ + ‖y‖ < 1}` for `F₂`;
  - `appellF4Domain = {(x, y) | √‖x‖ + √‖y‖ < 1}` for `F₄`;
  - `hornG3Domain = {(x, y) | ‖x‖ + ‖y‖ < 1/4}` for `G₃`.

  The principal domains are
  - `appellDomain1 = {(x, y) | 1 − x ∈ slitPlane ∧ 1 − y ∈ slitPlane}` for `F₁` and `F₃`;
  - `appellDomain2 = {(x, y) | ∀ u v ∈ [0, 1], 1 − u x − v y ∈ slitPlane}` for `F₂`, the set on
    which the integrand of 16.15.2 has no singularity. It is open (the square is compact),
    star-shaped about `0`, and contains `appellSimplex`.

  `appellSimplex` lies in `appellBidisc`, `appellDomain1` and `appellDomain2`, and
  `appellF4Domain` and `hornG3Domain` lie in `appellSimplex`.
- **The principal branches.** `regularizedAppellF1 a b b' c x y` is, for `(x, y) ∈ appellDomain1`,
  the value at `(x, y)` of a function analytic on `appellDomain1` that equals the series on
  `appellSimplex`. It is `Classical.choose` of the existence of such a function; 2.1 proves that
  its values on `appellDomain1` do not depend on the choice, and 2.3 that it exists. Off
  `appellDomain1` the value is `0`, a junk value that no theorem uses. `𝐅₃` on `appellDomain1` and
  `𝐅₂` on `appellDomain2` are defined in the same way. `𝐅₄` is the sum of its series, and is used
  only on `appellF4Domain` and on the sets of Layer 5 that lie in it. The construction by Euler
  integrals and shifts is a theorem (Layer 2), not the definition.
- **Holomorphy in two variables** is `AnalyticOnNhd ℂ f D` for `f : ℂ × ℂ → ℂ`; Mathlib's identity
  theorem `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` applies to it on a connected open
  set. Holomorphy in the parameters is `DifferentiableOn ℂ` of the function of all parameters and
  variables: for `𝐅₁`, the map `p ↦ 𝐅₁(p.1 0; p.1 1, p.1 2; p.1 3; p.2.1, p.2.2)` on
  `(Fin 4 → ℂ) × (ℂ × ℂ)` is `DifferentiableOn ℂ` on `univ ×ˢ appellDomain1`, and likewise with
  `Fin 5` for `𝐅₂`, `𝐅₃` and `Fin 4` for `𝐅₄` (2.4, 1.2).
- **Partial derivatives** are written with `deriv` in one variable: `∂ₓf(x, y)` is
  `deriv (fun s ↦ f s y) x` and `∂ᵧf(x, y)` is `deriv (fun t ↦ f x t) y`. `Suggested.lean`
  abbreviates them as `pdx f x y` and `pdy f x y`; these helpers are not targets.
- **Powers** are principal (`Complex.cpow`), each factor with the branch that DLMF prints, for
  instance `(1 − y)^{−α}` on `1 − y ∈ slitPlane` and `(−y)^{−α}` on `−y ∈ slitPlane`. A product of
  principal powers is not combined into one power.
- **Domains of identities.** An identity between functions of `(x, y)` is stated on
  `connectedComponentIn S (0, 0)`, where `S` is the open set, given with each formula, on which
  every function in it is evaluated inside its principal domain or series domain and every power
  is evaluated off its cut. Where `S` is itself connected, as for 16.16.4 and the first form of
  16.16.8, the identity is stated on `S`.
- **Integrals.** Single integrals are `intervalIntegral` over `0..1` in a real variable `u`, with
  `(u : ℂ)` in the integrand; the double integral over `[0, 1]²` is an iterated `intervalIntegral`;
  the triangle `Δ = {(u, v) | 0 ≤ u, 0 ≤ v, u + v ≤ 1}` of 16.15.3 is `appellTriangle : Set (ℝ × ℝ)`
  with `MeasureTheory.volume`. The Gamma prefactors are reciprocal, as in
  SpecialFunctionsHypergeometric's `eulerIntegral`. The regularized Euler integrals of
  16.15.1–16.15.4 are `appellF1EulerIntegral`, `appellF2EulerIntegral`, `appellF3EulerIntegral`
  and `appellF4EulerIntegral`.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.regularizedGaussHypergeometric a b c z` and `Complex.gaussHypergeometric a b c z`, the
  principal branches on the cut plane `1 − z ∈ slitPlane`, with the junk value `0` off it.
- Its 1.2–1.4: Euler's integral `regularizedGaussHypergeometric_eq_eulerIntegral`, the shift
  relations `regularizedGaussHypergeometric_shift_c` and `…_shift_b`, the agreement with Mathlib's
  series on the unit disk (`regularizedGaussHypergeometric_eq_regularizedGaussHGFun`), the joint
  holomorphy in `(a, b, c, z)` (`differentiableOn_regularizedGaussHypergeometric`) and the symmetry
  `regularizedGaussHypergeometric_comm`. They are the fibres of Layer 1 and the model for Layer 2.
- Its 4.2: the Chu–Vandermonde sum 15.4.24 (`ordinaryHypergeometric_neg_nat_one`), for the
  coefficient identities of 4.2.
- Its 5.1: Pfaff's transformation 15.8.1 (`regularizedGaussHypergeometric_pfaff`), for 16.16.5_5
  and the bound on the fibres near `[−2, 0]` in 5.3, and the connection formula 15.8.2 at infinity
  (`regularizedGaussHypergeometric_connection_infty`), for 16.16.10 and the bound on the fibres
  on `U`.

`Suggested.lean` imports only Mathlib, and carries roadmap-local copies of the four definitions
of SpecialFunctionsHypergeometric's `Suggested.lean` behind the Gauss function: `eulerIntegral`,
`IsEulerContinuation`, `regularizedGaussHypergeometric` and `gaussHypergeometric`.

### From Tau Ceti

- **The binomial series.** `hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`
  (`TauCeti/Analysis/Analytic/Binomial.lean`), for 16.16.2 and 16.16.3.

### From Mathlib

- **Series.** `HasSum`, `Summable.of_norm_bounded` and `HasSum.prod_fiberwise`, for the double
  series and their fibre sums; `Complex.regularizedGaussHGFun` and `ordinaryHypergeometric` (`₂F₁`)
  for the fibres on the disk.
- **Gamma and Beta.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_conj`,
  `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_mul_Gamma_one_sub`,
  `Complex.Gamma_add_nat_div_Gamma_eq`, `Complex.betaIntegral` and
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`.
- **Holomorphic functions.** `Complex.slitPlane`, `Complex.starConvex_one_slitPlane`,
  `AnalyticOnNhd`, the identity theorem `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
  `connectedComponentIn` and `IsPreconnected.prod`. Analyticity in two variables comes from the
  double power series and from the integrals, not from separate holomorphy.
- **Integration.** `intervalIntegral`, `MeasureTheory.integral` on a set, Fubini
  (`MeasureTheory.integral_prod`), dominated convergence, and parametric holomorphy of integrals
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).

## How to read the build

Layer 1 works with the double series alone. Each regularized coefficient is a ratio of Pochhammer
symbols and reciprocal Gamma functions, so the series converge absolutely on their domains for all
parameters, and their sums are analytic there and holomorphic in the parameters. Summing first
over one index writes each Appell series as a series of Gauss functions in the other variable,
which connects the Appell functions to SpecialFunctionsHypergeometric.

Layer 2 continues `𝐅₁`, `𝐅₂` and `𝐅₃` to their principal domains, as SpecialFunctionsHypergeometric
1.2 does for `𝐅`. In the parameter region of DLMF's Euler integral, the integral is analytic on
the principal domain and equals the series near the origin; shift relations of the coefficients,
one raising a bottom parameter and one raising a top parameter, express the function at any
parameters through finitely many functions in that region. Uniqueness is the identity theorem on
the connected principal domain. Layer 3 proves the systems of partial differential equations from
the coefficient recurrences, on the series domains, and extends them by the identity theorem.

Layers 4 and 5 prove identities between functions of `(x, y)`. Each is first proved near the
origin, by Euler's integral with a substitution, by the binomial series, by the fibre expansions
of Layer 1 with the transformations of the Gauss function, or by comparing Taylor coefficients;
the identity theorem then extends it to the connected component of the origin in the set where
both sides are defined. For `F₄`, the fibre sum in Gauss functions of `y` converges also for large
`y`, and the connection formula 15.8.2 applied fibre by fibre gives 16.16.10. The `**Checks.**` and
`### Examples` of each layer test the conventions on explicit values. A Check or Example that is an
exact identity or an exact value (such as `2x²/(1 − x)³`, or a junk value `0`) is a statement to
prove. A decimal value is a numerical illustration, computed with mpmath to the digits shown; it
is not a target.

## Layer 1: the double series

### 1.1 Coefficients and convergence

The regularized coefficients as pinned, `appellF1Coeff a b b' c m n` and its analogues
`appellF2Coeff`, `appellF3Coeff`, `appellF4Coeff`. Targets, for all parameters:
- **the coefficients**: when no bottom parameter lies in `{0, −1, −2, …}`, `Γ(γ)` times the
  coefficient of `𝐅₁` is DLMF's coefficient `(α)_{m+n} (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!)`, and likewise
  for `F₂`, `F₃`, `F₄` (`gamma_mul_appellF1Coeff`, …);
- **the recurrences** of the coefficients `c_{m,n}` in `m` and in `n`, for all parameters, for
  example `(m + 1)(γ + m + n) c_{m+1,n} = (α + m + n)(β + m) c_{m,n}` for `𝐅₁`, which holds at the
  poles too because `Γ(s)⁻¹ = s Γ(s + 1)⁻¹` for every `s`;
- **convergence**: the series of `𝐅₁` and `𝐅₃` converge absolutely on `appellBidisc`, that of
  `𝐅₂` on `appellSimplex`, and that of `𝐅₄` on `appellF4Domain`
  (`summable_norm_appellF1Coeff`, `summable_norm_appellF2Coeff`, `summable_norm_appellF3Coeff`,
  `summable_norm_appellF4Coeff`). The proof bounds the coefficient
  by `C (1 + m + n)^K` times `1`, `(m + n)!/(m! n!)` and `((m + n)!/(m! n!))²` respectively, and
  for `F₄` uses `(m + n)!/(m! n!) ≤ r^{−m} s^{−n}` whenever `r + s = 1`, with `r = √‖x‖/ρ`,
  `s = √‖y‖/ρ` for `ρ = √‖x‖ + √‖y‖ < 1`.

**Checks.**
- `F₁(α; β, β′; γ; x, y)` at `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `γ = 1.6`, `x = 0.2 + 0.1i`,
  `y = −0.25 + 0.15i` is `0.98534 81954 425… + 0.02596 17300 552… i`.

*Needs:* Mathlib `Summable.of_norm_bounded`, `Complex.Gamma_add_one`.

### 1.2 Holomorphy, symmetry and special values

- **Analyticity**: each regularized series is analytic on its domain as a function of `(x, y)`,
  from locally uniform convergence of the double power series; and jointly holomorphic in all
  parameters and `(x, y)` on `univ` times its domain (`differentiableOn_regularizedAppellF4` for
  `𝐅₄`).
- **Symmetries**: `𝐅₁`, `𝐅₂` and `𝐅₃` are unchanged under `(β, x) ↔ (β′, y)` (for `𝐅₃` together
  with `α ↔ α′`, for `𝐅₂` together with `γ ↔ γ′`), and `𝐅₄` under `(γ, x) ↔ (γ′, y)`; `𝐅₃` is
  symmetric in `α ↔ β` and in `α′ ↔ β′`, and `𝐅₄` in `α ↔ β`.
- **Conjugation**: each series at conjugate parameters and variables is the conjugate.
- **Values on the axes**: `𝐅₁(α; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)`,
  `𝐅₂(α; β, β′; γ, γ′; x, 0) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)`, `𝐅₃(α, α′; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)`
  and `𝐅₄(α, β; γ, γ′; x, 0) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)` on the respective domains
  (`regularizedAppellF1Series_zero` for `𝐅₁`); and
  `𝐅₁(α; β, 0; γ; x, y) = 𝐅(α, β; γ; x)`, `𝐅₃(α, α′; β, 0; γ; x, y) = 𝐅(α, β; γ; x)` on
  `appellBidisc`, since every term with `n ≥ 1` vanishes.

*Needs:* 1.1; SpecialFunctionsHypergeometric 1.3; Mathlib `Complex.Gamma_conj`.

### 1.3 Derivatives

On the series domains, for all parameters:

```text
∂ₓ 𝐅₁(α; β, β′; γ; x, y)     = α β 𝐅₁(α + 1; β + 1, β′; γ + 1; x, y)
∂ₓ 𝐅₂(α; β, β′; γ, γ′; x, y) = α β 𝐅₂(α + 1; β + 1, β′; γ + 1, γ′; x, y)
∂ₓ 𝐅₃(α, α′; β, β′; γ; x, y) = α β 𝐅₃(α + 1, α′; β + 1, β′; γ + 1; x, y)
∂ₓ 𝐅₄(α, β; γ, γ′; x, y)     = α β 𝐅₄(α + 1, β + 1; γ + 1, γ′; x, y)
```

and the `∂ᵧ` formulas by the symmetries of 1.2 (`pdx_regularizedAppellF4` for `𝐅₄`).
The proof differentiates the double power series termwise.

*Needs:* 1.1–1.2.

### 1.4 Fibre expansions

On the series domains, for all parameters, summing over `m` with `n` fixed:

```text
𝐅₁(α; β, β′; γ; x, y)     = ∑ₙ (α)ₙ (β′)ₙ / n! yⁿ 𝐅(α + n, β; γ + n; x)
𝐅₂(α; β, β′; γ, γ′; x, y) = ∑ₙ (α)ₙ (β′)ₙ / (Γ(γ′ + n) n!) yⁿ 𝐅(α + n, β; γ; x)
𝐅₃(α, α′; β, β′; γ; x, y) = ∑ₙ (α′)ₙ (β′)ₙ / n! yⁿ 𝐅(α, β; γ + n; x)
𝐅₄(α, β; γ, γ′; x, y)     = ∑ₙ (α)ₙ (β)ₙ / (Γ(γ′ + n) n!) yⁿ 𝐅(α + n, β + n; γ; x)
```

as `HasSum` over `ℕ` (`hasSum_regularizedAppellF1Series_fibre` for `𝐅₁`), with the Gauss function
of SpecialFunctionsHypergeometric, which on the unit disk is its series. The expansions summing over
`n` follow by the symmetries of 1.2. The proof is `HasSum.prod_fiberwise` on the absolutely
convergent double series.

*Needs:* 1.1–1.2; SpecialFunctionsHypergeometric 1.3.

### Examples

- `F₄(α, β; γ, γ′; x, y)` at `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.1 + 0.05i`,
  `y = 0.2 − 0.1i` is `1.07351 32898 7… − 0.01857 98829 352… i`.
- `𝐅₁(1; 1, β′; −1; x, 0) = 2x²/(1 − x)³` for `‖x‖ < 1` (by 1.2 and SpecialFunctionsHypergeometric
  1.3), while `appellF1 1 1 b' (-1) x 0 = 0`, the junk value of `Γ`; this excludes defining `𝐅₁` as
  `F₁/Γ(γ)` with Lean's junk values.

### Dependencies

Mathlib and SpecialFunctionsHypergeometric 1.3.

## Layer 2: the principal branches of `F₁`, `F₂`, `F₃`

### 2.1 The principal domains and uniqueness

- `appellDomain1` is open and connected (`isOpen_appellDomain1`, `isConnected_appellDomain1`; a
  product of two sets star-shaped about `0`, by `Complex.starConvex_one_slitPlane`); `appellDomain2`
  is open, by compactness of `[0, 1]²`, and star-shaped about `0` (`isOpen_appellDomain2`,
  `starConvex_appellDomain2`); both contain `appellSimplex`, and `appellDomain1` contains
  `appellBidisc`.
- **The identity theorem on `ℂ × ℂ`**: two functions analytic on a connected open set `D` that
  agree on a nonempty open subset agree on `D`. This is Mathlib's
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` on the normed space `ℂ × ℂ`.
- **Uniqueness**: two functions analytic on `appellDomain1` that equal the series of `𝐅₁` on
  `appellSimplex` agree on `appellDomain1` (`IsAppellContinuation.eqOn`); likewise for `𝐅₃` on
  `appellDomain1` and `𝐅₂` on `appellDomain2`.

*Needs:* Layer 1; Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

### 2.2 Shift relations

For all parameters, as identities of the series on their domains, coefficient by coefficient
(for the principal branches on their domains, see 2.4):

```text
𝐅₁(α; β, β′; γ) = (γ − α) 𝐅₁(α; β, β′; γ + 1) + α 𝐅₁(α + 1; β, β′; γ + 1)
𝐅₁(α; β, β′; γ) = 𝐅₁(α + 1; β, β′; γ) − β x 𝐅₁(α + 1; β + 1, β′; γ + 1)
                    − β′ y 𝐅₁(α + 1; β, β′ + 1; γ + 1)
𝐅₂(α; β, β′; γ, γ′) = (γ − β) 𝐅₂(α; β, β′; γ + 1, γ′) + β 𝐅₂(α; β + 1, β′; γ + 1, γ′)
𝐅₂(α; β, β′; γ, γ′) = 𝐅₂(α; β + 1, β′; γ, γ′) − α x 𝐅₂(α + 1; β + 1, β′; γ + 1, γ′)
𝐅₃(α, α′; β, β′; γ) = (γ − β − β′) 𝐅₃(α, α′; β, β′; γ + 1) + β 𝐅₃(α, α′; β + 1, β′; γ + 1)
                        + β′ 𝐅₃(α, α′; β, β′ + 1; γ + 1)
𝐅₃(α, α′; β, β′; γ) = 𝐅₃(α, α′; β + 1, β′; γ) − α x 𝐅₃(α + 1, α′; β + 1, β′; γ + 1)
```

all at `(x, y)`, with the relations in `γ′`, `β′` of `𝐅₂` and in `β′` of `𝐅₃` by the symmetries.
They follow from `1/Γ(c + k) = (c + k)/Γ(c + k + 1)` and `(a + 1)ₖ − (a)ₖ = k (a + 1)_{k−1}`.

**Checks.**
- At the parameters and point of 1.1 the two sides of each relation agree; for instance both sides
  of the first are `𝐅₁(0.3; 0.45, 0.7; 1.6; 0.2 + 0.1i, −0.25 + 0.15i)`.

*Needs:* Layer 1, 2.1.

### 2.3 The Euler integrals and existence

The regularized Euler integrals, with principal powers:

```text
E₁ = (Γ(α) Γ(γ − α))⁻¹ ∫₀¹ u^{α−1} (1 − u)^{γ−α−1} (1 − ux)^{−β} (1 − uy)^{−β′} du       (16.15.1)
E₂ = (Γ(β) Γ(β′) Γ(γ − β) Γ(γ′ − β′))⁻¹
       ∫₀¹ ∫₀¹ u^{β−1} v^{β′−1} (1 − u)^{γ−β−1} (1 − v)^{γ′−β′−1} (1 − ux − vy)^{−α} du dv
                                                                                    (16.15.2)
E₃ = (Γ(β) Γ(β′) Γ(γ − β − β′))⁻¹
       ∬_Δ u^{β−1} v^{β′−1} (1 − u − v)^{γ−β−β′−1} (1 − ux)^{−α} (1 − vy)^{−α′} du dv     (16.15.3)
```

Targets:
- **holomorphy**: `E₁` and `E₃` are analytic in `(x, y)` on `appellDomain1`, and `E₂` on
  `appellDomain2`, in the parameter regions `Re γ > Re α > 0` (`E₁`), `Re γ > Re β > 0` and
  `Re γ′ > Re β′ > 0` (`E₂`), `Re β > 0`, `Re β′ > 0` and `Re(γ − β − β′) > 0` (`E₃`), and jointly
  holomorphic in the parameters there. The points `1 − ux`, `1 − uy` lie in the cut plane for
  `u ∈ [0, 1]` when `1 − x`, `1 − y` do, since `slitPlane` is star-shaped about `1`;
- **agreement with the series** on `appellSimplex` in those regions, by termwise integration of
  the binomial series of the powers and `Complex.Gamma_mul_Gamma_eq_betaIntegral` (for `E₃`, the
  Dirichlet integral over `Δ`, reduced to two Beta integrals by `v = (1 − u) t`);
- **existence** (`exists_isAppellContinuation_F1`, `exists_isAppellContinuation_F2`,
  `exists_isAppellContinuation_F3`): the shift relations of 2.2
  express the series at any parameters, on `appellSimplex`, as a finite combination with
  polynomial coefficients in `(x, y)` of series at parameters in the Euler region. As in
  SpecialFunctionsHypergeometric 1.2, the construction with fixed shift counts is analytic on the
  principal domain where its last step lies in the Euler region, equals the series on
  `appellSimplex`, and two constructions agree where both are defined;
- **16.15.1–16.15.3**: `𝐅₁ = E₁`, `𝐅₂ = E₂`, `𝐅₃ = E₃` on the principal domains in the Euler regions
  (`regularizedAppellF1_eq_eulerIntegral`, `regularizedAppellF2_eq_eulerIntegral`,
  `regularizedAppellF3_eq_eulerIntegral`), and DLMF's forms with `Γ(γ)` (and `Γ(γ′)`) in the
  numerator;
- **agreement**: `𝐅₁` and `𝐅₃` equal their series on `appellBidisc`, and `𝐅₂` on `appellSimplex`
  (`regularizedAppellF1_eq_series`, …).

**Checks.**
- `F₁(0.3; 0.45, 0.7; 1.6; 2 + i, −3) = 0.84255 51403 357… + 0.12591 00090 747… i`, outside the
  bidisc, and its value at `(2 − i, −3)` is the conjugate. This excludes a branch continued across
  the cut `x ∈ [1, ∞)` from the lower half-plane.

*Needs:* 2.1–2.2; SpecialFunctionsHypergeometric 1.2–1.4; Mathlib
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 2.4 Holomorphy in all parameters and further properties

- **Joint holomorphy**: `(a, b, b', c, x, y) ↦ 𝐅₁(a; b, b′; c; x, y)` is holomorphic on `ℂ⁴` times
  `appellDomain1`, and likewise `𝐅₂` on `ℂ⁵ × appellDomain2` and `𝐅₃` on `ℂ⁵ × appellDomain1`
  (`differentiableOn_regularizedAppellF1`, …). Near every point it is one shift construction with
  fixed counts.
- **The shift relations of 2.2 on the principal domains** (`regularizedAppellF1_shift_c`,
  `regularizedAppellF1_shift_a`, …), since both sides are analytic there and agree on
  `appellSimplex`.
- **The properties of 1.2–1.3 on the principal domains**: the symmetries, conjugation
  (`regularizedAppellF1_conj`), the values on the axes (`𝐅₁(α; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)` for
  `1 − x ∈ slitPlane`, and so on), the reductions `𝐅₁(α; β, 0; γ; x, y) = 𝐅(α, β; γ; x)`
  (`regularizedAppellF1_zero_right`) and `𝐅₃(α, α′; β, 0; γ; x, y) = 𝐅(α, β; γ; x)` on
  `appellDomain1`, and the derivatives of 1.3, by the identity theorem. The fibre expansions of 1.4
  stay on the series domains: the identity theorem extends identities, not the convergence of a
  series. For example `(0, −2) ∈ appellDomain1` and `𝐅₁(1; 0, 1; 1; 0, −2) = 1/3`, while the fibre
  expansion there is `∑ₙ (−2)ⁿ`, because `𝐅(1 + n, 0; 1 + n; 0) = 1/n!`.

### Examples

- `F₂(0.3; 0.45, 0.7; 1.6, 1.25; 0.5 + 0.5i, −0.8) = 0.92623 8137… + 0.03619 8509… i`, where
  `|x| + |y| > 1`; the value at `(0.5 − 0.5i, −0.8)` is the conjugate.
- `F₃(0.3, 0.55; 0.45, 0.7; 1.6; 2 + i, −3) = 0.69879 3462… + 0.17627 9240… i`.
- `𝐅₁(a; b, b′; c; x, y) = 0` at `x = 1` or `x = 3`, the junk value off `appellDomain1`.

### Dependencies

Layer 1 and SpecialFunctionsHypergeometric 1.2–1.4.

## Layer 3: partial differential equations

### 3.1 The systems of `F₁`–`F₄`

DLMF 16.14.1–16.14.4, each a pair of equations, for all parameters, for `𝐅₁` and `𝐅₃` on
`appellDomain1`, for `𝐅₂` on `appellDomain2` and for `𝐅₄` on `appellF4Domain`, written with the
partial derivatives of the Conventions; for instance the first equation of 16.14.1:

```text
x(1 − x) ∂ₓ²F + y(1 − x) ∂ₓ∂ᵧF + (γ − (α + β + 1)x) ∂ₓF − β y ∂ᵧF − α β F = 0
```

(`regularizedAppellF1_pde_fst`, `regularizedAppellF1_pde_snd`, and likewise
`regularizedAppellF2_pde_fst`, `regularizedAppellF2_pde_snd`, `regularizedAppellF3_pde_fst`,
`regularizedAppellF3_pde_snd`, `regularizedAppellF4_pde_fst`, `regularizedAppellF4_pde_snd`). Each
equation is linear and homogeneous, so it holds for `F` as well. The proof: on the series domain,
the coefficient of `xᵐyⁿ` in the left side is a combination of the coefficient recurrences of 1.1;
on the principal domain, the left side is analytic and vanishes near the origin. The mixed
derivatives `∂ₓ∂ᵧF = ∂ᵧ∂ₓF` are equal on the domain, by analyticity.

*Needs:* Layers 1–2.

### 3.2 Horn's `G₂` and `G₃`

The series

```text
G₂(α, α′; β, β′; x, y) = ∑_{m,n} (α)ₘ (α′)ₙ pochZ(β, n − m) pochZ(β′, m − n) xᵐ yⁿ/(m! n!)
G₃(α, α′; x, y)        = ∑_{m,n} pochZ(α, 2n − m) pochZ(α′, 2m − n) xᵐ yⁿ/(m! n!)
```

(DLMF 16.14.5–16.14.6), with `Γ(α + m)/Γ(α) = (α)ₘ` in `G₂`, for `β, β′ ∉ ℤ` (`G₂`) and
`α, α′ ∉ ℤ` (`G₃`). Targets:
- **convergence** (`summable_hornG2`, `summable_hornG3`): absolute on `appellBidisc` for `G₂`,
  from
  `|pochZ(β, k) pochZ(β′, −k)| ≤ C (1 + |k|)^K`, which follows from the reflection formula; and on
  `hornG3Domain` for `G₃`, from
  `|pochZ(α, 2n − m) pochZ(α′, 2m − n)| ≤ C (1 + m + n)^K 4^{m+n} (m + n)!`, so that the series is
  dominated by `∑ (m + n)!/(m! n!) (4|x|)ᵐ (4|y|)ⁿ`. The bound follows from
  `|pochZ(α, k)| ≤ C (1 + |k|)^K |k|!^{±1}`, with the sign of `k`, from `a! b! ≤ (a + b)!` and from
  `(a + b)! ≤ 2^{a+b} a! b!`. Analyticity on these domains;
- **the systems**, as identities of analytic functions on those domains:

```text
ϑₓ (β + ϑᵧ − ϑₓ) G₂ = x (α + ϑₓ)(β′ + ϑₓ − ϑᵧ) G₂
ϑᵧ (β′ + ϑₓ − ϑᵧ) G₂ = y (α′ + ϑᵧ)(β + ϑᵧ − ϑₓ) G₂
ϑₓ (α + 2ϑᵧ − ϑₓ) G₃ = x (α′ + 2ϑₓ − ϑᵧ)(α′ + 2ϑₓ − ϑᵧ + 1) G₃
ϑᵧ (α′ + 2ϑₓ − ϑᵧ) G₃ = y (α + 2ϑᵧ − ϑₓ)(α + 2ϑᵧ − ϑₓ + 1) G₃
```

  with `ϑₓ = x ∂ₓ`, `ϑᵧ = y ∂ᵧ`, each a second-order equation (`hornG2_pde_fst`, `hornG2_pde_snd`,
  `hornG3_pde_fst`, `hornG3_pde_snd`). They are the
  coefficient recurrences `(m + 1)(β + n − m − 1) c_{m+1,n} = (α + m)(β′ + m − n) c_{m,n}` of `G₂`
  and `(m + 1)(α + 2n − m − 1) c_{m+1,n} = (α′ + 2m − n)(α′ + 2m − n + 1) c_{m,n}` of `G₃`, which
  follow from `Γ(z + 1) = z Γ(z)`.

**Checks.**
- `G₂(0.3, 0.55; 0.45, 0.7; 0.3, −0.4 + 0.2i) = 1.28956 88302 38… − 0.34417 52507 33… i`.
- `G₃(0.3, 0.55; 0.1, 0.05 + 0.05i) = 0.86214 41053 566… − 0.03245 47033 319… i`.

*Needs:* Layer 1 (the summability lemmas); Mathlib `Complex.Gamma_mul_Gamma_one_sub`.

### Examples

- `𝐅₂(α; β, 0; γ, γ′; x, y) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)` on `appellDomain2`, and the first equation of
  16.14.2 at `β′ = 0` is the hypergeometric equation 15.10.1 of `𝐅(α, β; γ; x)`.

### Dependencies

Layers 1–2.

## Layer 4: reductions and transformations of `F₁`, `F₂`, `F₃`

Every formula of this layer is stated in regularized form, for all parameters, on
`connectedComponentIn S (0, 0)` with `S` as given (or on `S` where it is connected), and in DLMF's
form under DLMF's hypothesis on the bottom parameters. The proof proves it near the origin and
extends it by the identity theorem; only the proof near the origin is described.

### 4.1 Transformations of `F₁` and `F₂`

- **16.16.8, first form**, on `S = appellDomain1`:
  `𝐅₁(α; β, β′; γ; x, y) = (1 − x)^{−β} (1 − y)^{−β′} 𝐅₁(γ − α; β, β′; γ; x/(x − 1), y/(y − 1))`.
  The map `(x, y) ↦ (x/(x − 1), y/(y − 1))` maps `appellDomain1` to itself, since
  `1 − x/(x − 1) = 1/(1 − x)`. Proof: Euler's integral with `u ↦ 1 − u`, in the region
  `Re γ > Re α > 0`, which is symmetric under `α ↔ γ − α`, then holomorphy in the parameters (2.4)
  (`regularizedAppellF1_transform_16_16_8`).
- **16.16.8, second form**, on `S = {(x, y) ∈ appellDomain1 | (1 − y)/(1 − x) ∈ slitPlane}`:
  `𝐅₁(α; β, β′; γ; x, y) = (1 − x)^{−α} 𝐅₁(α; γ − β − β′, β′; γ; x/(x − 1), (y − x)/(1 − x))`.
  Proof: for real `x`, `y` in `(−½, ½)`, the substitution `u = (1 − t)/(1 − tx)` in Euler's
  integral is a real change of variables on `[0, 1]`, and it gives

```text
𝐅₁(α; β, β′; γ; x, y)
    = (1 − x)^{γ−α−β} (1 − y)^{−β′} 𝐅₁(γ − α; γ − β − β′, β′; γ; x, (x − y)/(1 − y)),
```

  there; both sides are analytic near the origin, so fixing real `y` and applying the identity
  theorem in `x`, then fixing `x` and applying it in `y`, extends this to a neighbourhood of the
  origin in `ℂ × ℂ`. The first form applied to the right side gives the second
  (`regularizedAppellF1_transform_16_16_8_snd`).
- **16.16.9**, on `S = {(x, y) ∈ appellDomain2 | (x/(x − 1), y/(1 − x)) ∈ appellDomain2}`:
  `𝐅₂(α; β, β′; γ, γ′; x, y) = (1 − x)^{−α} 𝐅₂(α; γ − β, β′; γ, γ′; x/(x − 1), y/(1 − x))`.
  Proof: Euler's integral 16.15.2 with `u ↦ 1 − u`, since
  `1 − (1 − u)x − vy = (1 − x)(1 − u x/(x − 1) − v y/(1 − x))`
  (`regularizedAppellF2_transform_16_16_9`).

### 4.2 Reduction formulas

- **16.16.1**, on `S = {(x, y) ∈ appellDomain1 | (1 − x)/(1 − y) ∈ slitPlane}`:
  `𝐅₁(α; β, β′; β + β′; x, y) = (1 − y)^{−α} 𝐅(α, β; β + β′; (x − y)/(1 − y))`. Proof: the second
  form of 16.16.8 for `𝐅₁(α; β′, β; β + β′; y, x)`, whose first parameter `γ − β − β′` is then `0`,
  with the symmetry and the reduction of 1.2 (`regularizedAppellF1_reduction_16_16_1`).
- **16.16.2**, on `S = {(x, y) ∈ appellDomain2 | (1 − x − y)/(1 − y) ∈ slitPlane}`:
  `𝐅₂(α; β, β′; γ, β′; x, y) = Γ(β′)⁻¹ (1 − y)^{−α} 𝐅(α, β; γ; x/(1 − y))`. Proof: summing over `n`
  first, `∑ₙ (α + m)ₙ yⁿ/n! = (1 − y)^{−α−m}` (the binomial series)
  (`regularizedAppellF2_reduction_16_16_2`).
- **16.16.3**, on `S = {(x, y) ∈ appellDomain2 | (x, x/(1 − y)) ∈ appellDomain1}`:
  `𝐅₂(α; β, β′; γ, α; x, y) = Γ(α)⁻¹ (1 − y)^{−β′} 𝐅₁(β; α − β′, β′; γ; x, x/(1 − y))`. Proof: the
  fibre expansion `∑ₙ (β′)ₙ yⁿ/n! · F(α + n, β; γ; x)`, Euler's integral of each fibre in the region
  `Re γ > Re β > 0`, the binomial series under the integral, and
  `1 − ux − y = (1 − y)(1 − ux/(1 − y))`, which gives Euler's integral 16.15.1 of the right side
  (`regularizedAppellF2_reduction_16_16_3`).
- **16.16.4**, on `S = appellDomain1`:
  `𝐅₃(α, γ − α; β, β′; γ; x, y) = (1 − y)^{−β′} 𝐅₁(α; β, β′; γ; x, y/(y − 1))`; the map
  `y ↦ y/(y − 1)` preserves `1 − y ∈ slitPlane`. Proof: comparison of Taylor coefficients at the
  origin; the coefficient of `xᵐyⁿ` on the right is a finite sum, which the Chu–Vandermonde sum
  `₂F₁(−n, α + m; γ + m; 1) = (γ − α)ₙ/(γ + m)ₙ` evaluates to the coefficient on the left
  (`regularizedAppellF3_reduction_16_16_4`, and `appellF3_reduction_16_16_4` in DLMF's form).
- **16.16.5**, on `S = {(x, y) ∈ appellDomain1 | (1 − x)(1 − y) ∈ slitPlane}`:
  `𝐅₃(α, γ − α; β, γ − β; γ; x, y) = (1 − y)^{α+β−γ} 𝐅(α, β; γ; x + y − xy)`. Proof: 16.16.4 with
  `β′ = γ − β`, then 16.16.1 at `(x, y/(y − 1))`, since `(x − Y)/(1 − Y) = x + y − xy` for
  `Y = y/(y − 1)` (`regularizedAppellF3_reduction_16_16_5`).

**Checks.** At `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.2 + 0.1i`,
`y = −0.25 + 0.15i`, in DLMF's form:
- 16.16.1: both sides are `0.97998 88891 556… + 0.03563 40282 590… i`;
- 16.16.2: `0.94433 64431 224… + 0.04247 13862 935… i`;
- 16.16.3: `0.85292 70229 482… + 0.07865 82409 829… i`;
- 16.16.4: `0.89054 88561 402… + 0.07020 68341 135… i`;
- 16.16.5: `0.81579 75249 439… + 0.10017 75069 759… i`;
- 16.16.8, both forms: `0.98534 81954 425… + 0.02596 17300 552… i`;
- 16.16.9: `0.97539 09108 742… + 0.02959 42420 817… i`.

*Needs:* Layers 1–2; SpecialFunctionsHypergeometric 1.2–1.4, 4.2; Tau Ceti
`hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`.

### Examples

- 16.16.5 at `α = γ`: `𝐅₃(γ, 0; β, γ − β; γ; x, y) = (1 − y)^{β} 𝐅(γ, β; γ; x + y − xy)`, and both
  sides are `Γ(γ)⁻¹ (1 − x)^{−β}` near the origin.

### Dependencies

Layers 1–2 and SpecialFunctionsHypergeometric 1.2–1.4 and 4.2.

## Layer 5: the function `F₄`

The identities 16.15.4, 16.16.5_5, 16.16.6 and 16.16.7 are stated on the polydisc
`appellF4Polydisc = {(x, y) | ‖x‖ < 1/5 ∧ ‖y‖ < 1/5}`, on which `(x(1 − y), y(1 − x))` lies in
`appellF4Domain`, since `2√(0.2 · 1.2) < 1`, and every other argument lies in the series domain
of its function.

### 5.1 The Burchnall–Chaundy expansion and its cases

- **16.16.7** in regularized form, for all parameters, on `appellF4Polydisc`:

```text
𝐅₄(α, β; γ, γ′; x(1 − y), y(1 − x))
    = ∑ₖ (α)ₖ (β)ₖ (α + β − γ − γ′ + 1)ₖ / k! · xᵏ yᵏ
          · 𝐅(α + k, β + k; γ + k; x) 𝐅(α + k, β + k; γ′ + k; y)
```

  as `HasSum` over `ℕ` (`hasSum_regularizedAppellF4_burchnallChaundy`). Proof: both sides are
  analytic on the polydisc; the coefficient of `xᵐyⁿ` on each side is a finite double sum of
  Pochhammer quotients, and the target includes their equality, proved by a recurrence in `m` and
  `n` with an explicit rational certificate checked by `ring` or `field_simp`.
- **16.16.6**:
  `𝐅₄(α, β; γ, α + β − γ + 1; x(1 − y), y(1 − x)) = 𝐅(α, β; γ; x) 𝐅(α, β; α + β − γ + 1; y)`, the
  case `γ′ = α + β − γ + 1` of 16.16.7, where `(0)ₖ = 0` for `k ≥ 1`
  (`regularizedAppellF4_reduction_16_16_6`).
- **16.16.5_5**:

```text
𝐅₄(α, β; γ, β; x(1 − y), y(1 − x))
    = Γ(β)⁻¹ (1 − x)^{−α} (1 − y)^{−α} 𝐅₁(α; γ − β, α − γ + 1; γ; x/(x − 1), xy/((1 − x)(1 − y))).
```

  Proof: 16.16.7 at `γ′ = β`, where `𝐅(α + k, β + k; β + k; y) = Γ(β + k)⁻¹ (1 − y)^{−α−k}`; then
  Pfaff's transformation on each `𝐅(α + k, β + k; γ + k; x)`, and the fibre expansion of `𝐅₁` in
  its second variable (1.4) (`regularizedAppellF4_reduction_16_16_5_5`).

**Checks.** At `α = 0.3`, `β = 0.45`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.1 + 0.05i`,
`y = −0.1 + 0.05i`, a point of `appellF4Polydisc` where `√|x(1 − y)| + √|y(1 − x)| = 0.66833…`,
in DLMF's form:
- 16.16.7: both sides are `0.99900 88426 0846… + 0.00959 66916 4714… i`;
- 16.16.6: `0.92311 26866 0964… + 0.04292 54853 6748… i`;
- 16.16.5_5: `0.98044 70812 4808… + 0.01783 68312 0938… i`.

*Needs:* Layers 1–2; SpecialFunctionsHypergeometric 1.3 and 5.1.

### 5.2 The Euler integral of `F₄`

DLMF 16.15.4 on `appellF4Polydisc`, for `Re γ > Re α > 0` and `Re γ′ > Re β > 0`:

```text
𝐅₄(α, β; γ, γ′; x(1 − y), y(1 − x)) = (Γ(α) Γ(β) Γ(γ − α) Γ(γ′ − β))⁻¹
    ∫₀¹ ∫₀¹ u^{α−1} v^{β−1} (1 − u)^{γ−α−1} (1 − v)^{γ′−β−1}
        (1 − ux)^{α+1−γ−γ′} (1 − vy)^{β+1−γ−γ′} (1 − ux − vy)^{γ+γ′−α−β−1} du dv
```

(`regularizedAppellF4_eq_eulerIntegral`). The powers are evaluated where their bases have positive
real part. Proof: the right side is analytic on the polydisc; termwise integration of the
binomial series of the three powers and Beta integrals give its Taylor coefficients, and their
equality with those of the left side is a finite identity with a recurrence certificate, as in
5.1.

**Checks.**
- At `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.15 + 0.05i`, `y = −0.1 + 0.12i`, both
  sides, in DLMF's form, are `1.00621 43714 857… + 0.03076 28754 950… i`.

*Needs:* Layer 1; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`, Fubini.

### 5.3 The connection at infinity

The fibre sum

```text
Φ(α, β; γ, γ′; x, y) = ∑ₘ (α)ₘ (β)ₘ / ((γ)ₘ m!) xᵐ F(α + m, β + m; γ′; y)
```

with the Gauss function `F` of SpecialFunctionsHypergeometric on `1 − y ∈ slitPlane`
(`appellF4Fibre`). On `appellF4Domain` it is the fibre expansion of 1.4 in the variable `x`. For
large `y` it is this roadmap's reading of the left side of 16.16.10, which DLMF writes as `F₄`
without fixing a branch. Targets, for `γ, γ′ ∉ {0, −1, −2, …}`:
- **on the series domain**: `HasSum` of the fibre sum to `F₄(α, β; γ, γ′; x, y)` on
  `appellF4Domain` (`hasSum_appellF4Fibre`);
- **for large `y`**, on `U = {(x, y) | −y ∈ slitPlane ∧ √‖x‖ + 1 < √‖y‖}`: the fibre sum converges
  absolutely and is analytic in `(x, y)` (`analyticOnNhd_appellF4Fibre`), for all `α`, `β`;
- **the bridge**: the fibre sum converges locally uniformly, and so is analytic, on an open set `V`
  that contains the segment `{(0, −t) | 0 ≤ t ≤ 2}` (`exists_isOpen_analyticOnNhd_appellF4Fibre`).
  `V` meets `appellF4Domain` near `(0, 0)`, where the fibre sum is `F₄`, and meets `U` near
  `(0, −2)`; `U` is connected, since its fibre over each `y` is a disk about `x = 0` and its set of
  `y`, `{|y| > 1} \ [1, ∞)`, is connected. So on `U` the fibre sum is the analytic continuation of
  the series `F₄` from the origin along that segment, and 16.16.10 is a statement about a branch of
  the Appell germ. Proof: for `y` in a compact neighbourhood `N` of `[−2, 0]` in the cut plane,
  Pfaff's transformation (SpecialFunctionsHypergeometric 5.1) writes
  `F(α + m, β + m; γ′; y) = (1 − y)^{−α−m} F(α + m, γ′ − β − m; γ′; y/(y − 1))` with
  `|y/(y − 1)| ≤ r < 1` on `N`, and bounding the coefficients of the last series by those of
  `(1 − √r)^{−2(|α| + |γ′ − β| + m + 1)}` gives `|F(α + m, β + m; γ′; y)| ≤ C ρᵐ` on `N`, with `C`,
  `ρ` independent of `m`; so the fibre sum converges uniformly for `‖x‖ < 1/(2ρ)` and `y ∈ N`;
- **16.16.10**, for `α − β ∉ ℤ` and `(x, y) ∈ U`:

```text
Φ(α, β; γ, γ′; x, y)
    = Γ(γ′) Γ(β − α)/(Γ(γ′ − α) Γ(β)) (−y)^{−α} F₄(α, α − γ′ + 1; γ, α − β + 1; x/y, 1/y)
    + Γ(γ′) Γ(α − β)/(Γ(γ′ − β) Γ(α)) (−y)^{−β} F₄(β, β − γ′ + 1; γ, β − α + 1; x/y, 1/y)
```

  with the reciprocal Gamma factors as in the Conventions and `F₄` the series, since
  `(x/y, 1/y) ∈ appellF4Domain` (`appellF4Fibre_connection_infty`).

The proof applies 15.8.2 to each fibre, with `(−y)^{−α−m} = (−y)^{−α} (−y)^{−m}`,
`Γ(β + m) = Γ(β) (β)ₘ` and the identity of entire functions
`1/Γ(z − m) = (−1)ᵐ (1 − z)ₘ/Γ(z)` at `z = γ′ − α`, which holds for every `z` with Mathlib's `Γ`
(the quotient `Γ(z)/Γ(z − m)` is not used, since it fails at the poles: at `z = 0`, `m = 1` it is
`Γ(0)/Γ(−1) = 0`, not `−1`). It rearranges the absolutely convergent double series into
`F₄(α, α − γ′ + 1; γ, α − β + 1; x/y, 1/y)`, and likewise for `β`.

The convergence on `U` needs a bound on the fibres for all `α`, `β`, including `α − β ∈ ℤ`.
The connection formula 15.8.2 of SpecialFunctionsHypergeometric 5.1
(`regularizedGaussHypergeometric_connection_infty`), which carries the factor `sin(π(b − a))/π`
and holds for all parameters, gives for `|y| ≥ R > 1`, `−y ∈ slitPlane`,
`|F(α + m, β + m; γ′; y)| ≤ C (1 + m)^K |y|^{−m} (|y|^{−Re α} + |y|^{−Re β})` with `C`, `K` locally
uniform in `(α, β)` where `β − α` stays at distance at least `¼` from `ℤ`, since there the
reciprocal of `sin(π(β − α))` is bounded. At any other `(α, β₀)`, with `d = dist(β₀ − α, ℤ) < ¼`
and `n` the nearest integer, every `β` on the circle `|β − β₀| = ½` has `β − α` at distance at
least `½ − d > ¼` from `n` and at least `½ − d > ¼` from every other integer. The function
`β ↦ F(α + m, β + m; γ′; y)` is entire, so the maximum modulus principle on that circle bounds it
at `β₀` by the bound on the circle, where `|y|^{−Re β} ≤ |y|^{½} |y|^{−Re β₀}`: it is
`|F(α + m, β₀ + m; γ′; y)| ≤ C (1 + m)^K |y|^{−m} |y|^{½} (|y|^{−Re α} + |y|^{−Re β₀})`, with the
extra factor `|y|^{½}` independent of `m` and `C`, `K` again locally uniform. With
`(m!)⁻¹ |(α)ₘ (β)ₘ/(γ)ₘ| ≤ C′ (1 + m)^{K′}` and `√‖x‖ + 1 < √‖y‖`, so `‖x‖ < ‖y‖`, the fibre sum
converges absolutely and locally uniformly on `U`.

**Checks.** At `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, both sides of 16.16.10 are
- `0.63974 60136 565… + 0.02306 13488 454… i` at `(0.3, −6 + i)`;
- `0.64821 87377 054… + 0.42058 10020 681… i` at `(0.1 + 0.2i, 4 + 3i)`;
- `0.58084 02439 711… − 0.02930 82269 601… i` at `(−0.5, −9 − 2i)`.

*Needs:* Layer 1; SpecialFunctionsHypergeometric 1.2–1.4 and 5.1.

### Examples

- `F₄(α, β; γ, γ′; x, y)` at the parameters of 5.3 and `(x, y) = (0.1 + 0.05i, 0.2 − 0.1i)` is
  `1.07351 32898 7… − 0.01857 98829 352… i`, and the fibre sum at that point has the same value.

### Dependencies

Layers 1–2 and SpecialFunctionsHypergeometric 1.2–1.4 and 5.1.

## Downstream consumers

- A roadmap for DLMF Chapter 19 that identifies Carlson's `R_{−a}(𝐛; 𝐳)` of 19.16.9 with three
  variables and `z₃ = 1` with `F₁` consumes Layer 2.
- A roadmap for the Meijer `G`-function, whose double analogues are the Appell functions, consumes
  Layer 1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **The other Horn functions** (DLMF §16.14(ii)): of the 24 double series that §16.14(ii) counts
  besides the four Appell functions, the 22 other than `G₂` and `G₃` (which 3.2 owns), and the
  statement of §16.13 that the Appell functions are not products of two `₂F₁`
  in general.
- **Large-parameter asymptotics** of the Appell functions, which §16.13 cites.
- **Other integral representations** (DLMF §16.15, unnumbered): the double Mellin–Barnes integrals,
  the inverse Laplace transforms, and the convergent expansions for large `x`, large `y`, or both,
  other than 16.16.10.
- **Quadratic transformations** of Appell functions (Carlson 1976), and the further reduction
  formulas of Erdélyi et al. (1953a, §5.10).
- **A principal branch of `F₄`** on a domain of `ℂ × ℂ` beyond the series domain and the fibre sum
  of 5.3, and the continuation of `F₁`, `F₂`, `F₃` off their principal domains.
- **The generalized hypergeometric functions and the Meijer `G`-function** (DLMF §§16.2–16.12 and
  §§16.17–16.22), and the applications and computation sections §§16.23–16.27.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/GeneralizedHypergeometric/Appell/` provides source material for Layers 1–5: the four series
with their convergence and analyticity, the systems 16.14.1–16.14.4, Horn's `G₂` and `G₃` with
their systems, the Euler integrals 16.15.1–16.15.3, and the reductions 16.16.1–16.16.6, 16.16.8 and
16.16.9. Its statements of 16.15.4, 16.16.5_5, 16.16.7 and 16.16.10 are still `sorry`.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `GeneralizedHypergeometric/Appell/Basic/Series`, `Appell/SeriesAndDifferentialEquations` |
| 2 | `GeneralizedHypergeometric/Appell/Basic/EulerBranches`, `Appell/EulerIntegrals`, `Appell/TriangleDirichlet`, `AppellContinuation` |
| 3 | `GeneralizedHypergeometric/Appell/SeriesAndDifferentialEquations`, `Appell/HornDifferentialEquations` |
| 4 | `GeneralizedHypergeometric/Appell/GermTransformations` |
| 5 | `Hypergeometric/AppellF4`, `Hypergeometric/Basic/AppellF4`, `GeneralizedHypergeometric/AppellContinuation` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 16
  (R. A. Askey and A. B. Olde Daalhuis), <https://dlmf.nist.gov/16>. Every equation number refers
  to this release.
- P. Appell and J. Kampé de Fériet, *Fonctions hypergéométriques et hypersphériques; polynomes
  d'Hermite*, Gauthier-Villars, 1926.
- A. Erdélyi, W. Magnus, F. Oberhettinger and F. G. Tricomi, *Higher Transcendental Functions*,
  Vol. I, McGraw-Hill, 1953, §§5.7–5.10.
- J. L. Burchnall and T. W. Chaundy, Expansions of Appell's double hypergeometric functions,
  *Quart. J. Math.* 11 (1940), 249–270, and II, *Quart. J. Math.* 12 (1941), 112–128.
- B. C. Carlson, Quadratic transformations of Appell functions, *SIAM J. Math. Anal.* 7 (1976),
  291–304.

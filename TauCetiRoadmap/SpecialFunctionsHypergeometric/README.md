# Roadmap: the Gauss hypergeometric function

**Summary.** This roadmap builds the theory of the Gauss hypergeometric function of Chapter 15 of
the NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. Mathlib has the Gauss series

```text
F(a, b; c; z) = ∑ₛ (a)ₛ (b)ₛ / ((c)ₛ s!) zˢ,     𝐅(a, b; c; z) = ∑ₛ (a)ₛ (b)ₛ / (Γ(c + s) s!) zˢ
                                                                      (DLMF 15.2.1, 15.2.2)
```

on the unit disk, as `ordinaryHypergeometric` (`₂F₁`) and `Complex.regularizedGaussHGFun`. This
roadmap defines the principal branch of `𝐅` on the cut plane `ℂ \ [1, ∞)` for all complex
parameters, by Euler's integral and uniqueness, and `F = Γ(c) 𝐅`, and proves the classical theory
for them.

The roadmap covers:
- the definition of the principal branch, its existence by contiguous shifts of Euler's integral,
  its joint holomorphy in `(a, b, c, z)` and its agreement with Mathlib's series;
- the derivatives and the contiguous relations;
- the hypergeometric equation, its local solutions at `0`, `1` and `∞` including the logarithmic
  cases, their Wronskians, and Riemann's equation with its transformations;
- the elementary cases, the values at `z = 1` (Gauss, Chu–Vandermonde, Dougall), the limits at
  `z = 1` and the behaviour of the series on its circle of convergence;
- the linear transformations, Kummer's 24 solutions, the 20 connection formulas and their
  logarithmic limiting cases, and the jump across the cut;
- the Euler, loop, Mellin–Barnes and fractional integral representations;
- the quadratic and cubic transformations and the special values that follow from them;
- the Chebyshev, Legendre-polynomial and elliptic cases, the Mellin transform, the expansion
  15.15.1 and the product formulas of §15.16.

**This roadmap is most of DLMF Chapter 15, not all of it.** The formula ranges are in the table
under [Scope and ownership](#scope-and-ownership). The rest of the chapter is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement): the
continued fractions of §15.7, the relations of §15.9 to Jacobi, Gegenbauer and other orthogonal
polynomials and to the Jacobi, Gegenbauer and Legendre functions, the large-parameter
asymptotics of §15.12, the zeros of §15.13 and the applications and computation sections.

The roadmap rests on Mathlib, on Tau Ceti and, for the Mellin–Barnes integrals alone, on the
Gamma function on vertical strips from [ZerosOfLFunctions](../ZerosOfLFunctions/README.md). It
needs no other special-function roadmap: the theory of the hypergeometric equation it uses is
the elementary one of Abel's identity for Wronskians, proved here for this equation.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Hypergeometric/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definition and analytic properties** (DLMF §15.2 without the circle of convergence and
   15.2.3).
2. **Derivatives and contiguous relations** (DLMF §15.5).
3. **The hypergeometric equation and Riemann's equation** (DLMF §15.10(i), §15.11).
4. **Elementary functions and unit argument** (DLMF §15.4(i)–(ii), the circle of convergence in
   §15.2(i)).
5. **Linear transformations and connection formulas** (DLMF §15.8(i)–(ii), §15.10(ii), 15.2.3).
6. **Integral representations** (DLMF §15.6).
7. **Quadratic transformations** (DLMF §15.8(iii)–(iv), 15.4.26–15.4.30).
8. **Cubic transformations** (DLMF §15.8(v), 15.4.31–15.4.34).
9. **Polynomial and elliptic cases, integrals, sums and products** (DLMF 15.9.5–15.9.7, 15.9.26,
   §§15.14–15.16).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 15.2.1–15.2.2, 15.2.3_5, 15.2.4–15.2.6, the analytic properties of §15.2(ii) | Definition, existence, holomorphy, series and polynomial cases (Layer 1). |
| 15.6.1 | Euler's integral, which defines `𝐅` (1.2). |
| 15.5.1–15.5.16, 15.5.16_5, 15.5.17–15.5.21 | Derivatives and contiguous relations (Layer 2). |
| 15.10.1–15.10.10, 15.11.1–15.11.8 | The equation, its local solutions, Wronskians and Riemann's equation (Layer 3). |
| 15.4.1–15.4.25, the three statements on `|z| = 1` of §15.2(i) | Elementary functions, values and limits at `z = 1`, Dougall's sum, the circle of convergence (Layer 4). |
| 15.2.3, 15.8.1–15.8.12, 15.10.11–15.10.36 | Linear transformations, their limiting cases, Kummer's 24 solutions, the connection formulas, the jump across the cut (Layer 5). |
| 15.6.2, 15.6.2_5, 15.6.3–15.6.9 | Loop, half-line, Mellin–Barnes and fractional integrals (Layer 6). |
| 15.8.13–15.8.30, 15.4.26–15.4.30 | Quadratic transformations and their special values (Layer 7). |
| 15.8.31–15.8.33, 15.4.31–15.4.34 | Cubic transformations and their special values (Layer 8). |
| 15.9.5–15.9.7, 15.9.26, 15.14.1, 15.15.1, 15.16.1–15.16.5 | Chebyshev and Legendre polynomials, `D(k)`, Mellin transform, sums and products (Layer 9). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- the Gauss series on the disk: Mathlib's `ordinaryHypergeometric` and
  `Complex.regularizedGaussHGFun`, their radius of convergence, their symmetry in `a` and `b` and
  `₂F₁ = Γ(c) 𝐅` for `c ∉ {0, −1, −2, …}` (`Complex.ordinaryHypergeometric_div_Gamma_eq`);
- 15.9.24 and 15.9.25 for real `k` with `k² < 1`: Tau Ceti's
  `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric`
  (DLMF 19.5.1–19.5.2, from [EllipticIntegrals](../EllipticIntegrals/README.md)).

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti provides:

| Result | Target |
|---|---|
| Euler's integral converges for `1 − z ∈ slitPlane` and `Re c > Re b > 0`, and is holomorphic in `(a, b, c, z)` there | 1.1 |
| Uniqueness: two functions entire in `b` and in `c` at every fixed `z` of the cut plane that agree with Euler's integral where `Re c > Re b > 0` agree on the cut plane | 1.2 |
| The shift relations in `c` and in `b`, and the existence of the continuation by iterating them down to Euler's integral | 1.2 |
| The identity principle on the cut plane: an identity between functions holomorphic on the cut plane that holds on a nonempty open subset of the unit disk holds on the cut plane | 1.4 |
| Abel's identity for the hypergeometric equation, and the resulting criterion: if `f₁`, `f₂` solve 15.10.1 on a connected open set with nonvanishing Wronskian, every solution there is a combination of them | 3.1 |
| The shift construction with fixed counts: holomorphy on its region, agreement with Euler's integral, and compatibility of different counts | 1.2 |
| The logarithmic solutions continued to `slitPlane ∩ {1 − z ∈ slitPlane}` as parameter derivatives of the regularized pair | 3.3 |
| Dougall's series: convergence and holomorphy in `d`, the recurrence, the integer values, the growth bound, and the periodic Carlson lemma | 4.2 |
| The Mellin–Barnes integral of `(1 + u)^{−a}`, independence of the separating contour, and Barnes's first lemma (DLMF 5.13.3) | 6.3 |

**What it does not own:**
- The Gauss series on the disk and the facts listed above as inputs (Mathlib), and the complete
  elliptic integrals `K`, `E` with 15.9.24–15.9.25 (Tau Ceti).
- The Gamma function on vertical strips (ZerosOfLFunctions 1.3), consumed for 15.4.25 and
  15.6.6–15.6.7.
- The continued fractions of §15.7, and the relations 15.9.1–15.9.4 and 15.9.8–15.9.23 to the
  Jacobi, Gegenbauer, Krawtchouk, Meixner and Meixner–Pollaczek polynomials and to the Jacobi,
  Gegenbauer and Legendre functions.
- The large-parameter asymptotics of §15.12, the zeros of §15.13, branches off the principal
  sheet and the monodromy of §15.17(v), and the applications and computation sections.
- The formulas of other DLMF chapters through the continued Gauss function, which other
  roadmaps leave to this chapter: they belong to roadmaps that consume this one (see
  [Downstream consumers](#downstream-consumers)).

See the last section for these.

**The boundary in one sentence:** this roadmap owns the principal branch of `F` and `𝐅` on the
cut plane for all parameters and everything in DLMF Chapter 15 stated through it, elementary
functions, `Γ`, `ψ`, Mathlib's Chebyshev and Legendre polynomials and Tau Ceti's complete
elliptic integrals, except the continued fractions, the orthogonal polynomials and functions of
§15.9 beyond Chebyshev and Legendre polynomials, the large-parameter asymptotics, the zeros and
the applications; it consumes the Gamma function on vertical strips from ZerosOfLFunctions.

## Conventions

- **Names.** The functions live in `Complex`, beside Mathlib's `Complex.regularizedGaussHGFun`:
  `Complex.regularizedGaussHypergeometric a b c z` for `𝐅(a, b; c; z)` and
  `Complex.gaussHypergeometric a b c z` for `F(a, b; c; z)`, parameters first. They are the
  principal branches. Mathlib's `ordinaryHypergeometric` and `Complex.regularizedGaussHGFun` are
  the sums of the series, which outside the closed unit disk are Lean's value of a divergent
  `tsum`; this roadmap uses them only on `‖z‖ < 1`, at `z = 1` where the series converges, and in
  the terminating cases, where they are polynomials. Derivatives are Mathlib's `deriv`; no
  derivative functions are introduced. When Mathlib provides a continued Gauss function with the
  same values on the cut plane, Tau Ceti uses Mathlib's and restates the affected theorems
  against it.
- **The cut plane.** DLMF's `|ph(1 − z)| < π` is `1 − z ∈ Complex.slitPlane`; likewise
  `|ph z| < π` is `z ∈ slitPlane` and `|ph(−z)| < π` is `−z ∈ slitPlane`. The set
  `{z | 1 − z ∈ slitPlane}` is written out, not named. Off the cut plane, including at `z = 1`,
  `regularizedGaussHypergeometric a b c z = 0`, a junk value that no theorem uses. DLMF's values on
  the cut, `x ± i0` for `x > 1`, are limits from the upper and lower half-planes (5.1), and the
  values at `z = 1` are Mathlib's series at `1` (Layer 4).
- **The definition.** With Euler's integral

```text
E(a, b, c, z) = (Γ(b) Γ(c − b))⁻¹ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt      (DLMF 15.6.1)
```

  (`eulerIntegral a b c z`, an `intervalIntegral` with principal powers),
  `regularizedGaussHypergeometric a b c z` is, for `1 − z ∈ slitPlane`, the value at `(a, b, c, z)`
  of a function `G` that is entire in `b` and entire in `c` at each fixed `a`, `z` and other
  parameter and equals `E` wherever `0 < Re b < Re c` (`IsEulerContinuation G`); it is
  `Classical.choose` of the existence of such a `G`, and `0` off the cut plane. 1.2 proves that `G`
  exists and that its values on the cut plane do not depend on the choice, so the definition is the
  principal branch of DLMF §15.2. The construction by contiguous shifts is a theorem (1.2), not the
  definition.
- **`F` and `𝐅`.** `gaussHypergeometric a b c z = Γ(c) · regularizedGaussHypergeometric a b c z`.
  At `c ∈ {0, −1, −2, …}` this is `0`, Mathlib's junk value of `Γ` at its poles; DLMF's `F` does
  not exist there. A formula that DLMF prints with `F` is stated for `gaussHypergeometric` with the
  hypothesis that every third parameter of an `F` in it lies outside `{0, −1, −2, …}`; a formula
  printed with `𝐅` holds for all parameters. Mathlib's terminating `₂F₁ (−m) b c z` is DLMF's
  interpretation 15.2.5 for every `c`, including `c = −m − ℓ` (1.3), and the polynomial cases of
  DLMF are stated with it.
- **Reciprocal Gamma factors** are `(Gamma ·)⁻¹`, which vanish at the poles, so a formula with
  `Γ` only in denominators holds for all parameters. A `Γ` in a numerator carries the hypothesis
  that its argument is not a pole. In 15.8.8 and 15.8.11 DLMF's `ψ(x)/Γ(x)` is written
  `−deriv (fun y ↦ (Gamma y)⁻¹) x`, which is entire and equals DLMF's interpretation at the poles.
- **Powers** are principal (`Complex.cpow`), with the branch of each factor as DLMF prints it: for
  instance `(1 − z)^{c−a−b}` on the cut plane and `(−z)^{−a}` on `−z ∈ slitPlane`. A product
  of principal powers is not combined into one power.
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`.
- **The hypergeometric equation is not a predicate.** A solution on an open set `U` is stated with
  `DifferentiableOn ℂ w U` and the equation 15.10.1 at each point of `U`, with `deriv` and
  `deriv^[2]`. The Wronskian `𝒲{f, g}` is written out as `f z * deriv g z − deriv f z * g z`.
- **Limits.** DLMF's `z → 1−` is the real limit `x → 1` along `𝓝[<] (1 : ℝ)`. A limit "as
  `c → −n`" is along `𝓝[≠] (−n)` in `ℂ`.
- **Series on the circle.** "Converges absolutely" is `Summable` of the norms; "converges" is
  convergence of the partial sums over `Finset.range N` as `N → ∞`; "diverges" is that the
  partial sums do not converge.
- **Contours.** Each contour integral is a sum of integrals over explicit segments, rays and
  circular arcs, with the branch of every power fixed on each piece by its phase, as DLMF fixes
  it in the paragraph after 15.6.9. Mellin–Barnes integrals are along a vertical line
  `Re t = σ`, with the separating contour of DLMF written as the line integral plus finitely many
  residues (6.3).

## Exact supplier contracts

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- [§1.3 Vertical strips](../ZerosOfLFunctions/README.md#13-vertical-strips):
  `log ‖Γ(σ + it)‖ = (σ − ½) log |t| − π|t|/2 + ½ log(2π) + O(1/|t|)` uniformly for `σ` in a
  compact interval, as `|t| → ∞`. It gives the bounds for `|Γ|` and `|1/Γ|` on vertical strips of
  bounded width: the exponential decay of the integrands of 15.6.6–15.6.7 along a fixed vertical
  line, the vanishing of the horizontal sides of a rectangle between two fixed lines (6.3), and
  the growth bounds in Dougall's sum (4.2). It is not used for contours whose real part tends to
  infinity, and none is closed that way.

### From Tau Ceti

- **Gauss series.** `one_le_radius_ordinaryHypergeometricSeries` and
  `analyticOnNhd_ordinaryHypergeometric`
  (`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`).
- **Complete elliptic integrals.** `legendreK`, `legendreEc`,
  `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`), for 15.9.26 in 9.1.
- **Residues.** `TauCeti.Contour.residue` and the residue theorem
  (`TauCeti/Analysis/Contour/Residue/`, from ContourIntegration), for 6.3.

### From Mathlib

- **Gauss series.** `ordinaryHypergeometric` (notation `₂F₁`), `ordinaryHypergeometricSeries`,
  `ordinaryHypergeometric_eq_tsum`, `ordinaryHypergeometric_zero`,
  `ordinaryHypergeometricSeries_symm`, `ordinaryHypergeometricSeries_radius_eq_one`,
  `ordinaryHypergeometric_radius_top_of_neg_nat₁` (and `₂`, `₃`),
  `ordinaryHypergeometricSeries_eq_zero_of_neg_nat`
  (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`);
  `Complex.regularizedGaussHGFun`, `Complex.regularizedGaussHGFun_symm`,
  `Complex.coeff_regularizedGaussHGFunSeries`, `Complex.ordinaryHypergeometric_div_Gamma_eq`,
  `Complex.radius_regularizedGaussHGFunSeries_ge_one` and
  `Complex.radius_regularizedGaussHGFunSeries_eq_top_of_left`
  (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`).
- **Gamma, Beta and digamma.** `Complex.Gamma`, `Complex.Gamma_add_one`,
  `Complex.Gamma_neg_nat_eq_zero`, `Complex.Gamma_ne_zero`, `Complex.Gamma_conj`,
  `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_mul_Gamma_one_sub` (reflection),
  `Complex.Gamma_mul_Gamma_add_half` (duplication), `Complex.Gamma_add_nat_div_Gamma_eq`,
  `Complex.betaIntegral`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.digamma` and
  `Complex.digamma_one_sub`.
- **Polynomials.** `ascPochhammer`, `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.U`,
  `Polynomial.Chebyshev.T_complex_cos`, `Polynomial.Chebyshev.U_complex_cos` and
  `Polynomial.shiftedLegendre`.
- **Holomorphic functions.** `Complex.slitPlane`, `Complex.starConvex_one_slitPlane`,
  `DifferentiableOn.analyticOnNhd`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `IsOpen.is_const_of_deriv_eq_zero`, the
  Cauchy integral formula and `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.
- **Integration.** `intervalIntegral`, `MeasureTheory.integral` on `Set.Ioi`, Fubini, dominated
  convergence and parametric differentiation (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).
- **Asymptotics and limits.** `Asymptotics.IsBigO`, `Filter.Tendsto`, `Complex.log`,
  `Complex.arg` and `Complex.cpow`.

## How to read the build

Layer 1 defines `𝐅` by Euler's integral and uniqueness. Uniqueness is two applications of the
identity theorem in one variable: in `c` on the half-plane `Re c > Re b` at fixed `b` with
`Re b > 0`, then in `b` on the half-plane `Re b > 0`. Existence is the construction by the two
shift relations, which raise `Re b`, respectively `Re(c − b)`, by one and terminate in the
region of Euler's integral; it is assembled from constructions with fixed numbers of shifts, each
holomorphic on an open region, which agree where their regions overlap. Agreement with Mathlib's
series on the disk is termwise integration of the binomial series of `(1 − zt)^{−a}`, and every
identity proved on a piece of the disk then extends to the cut plane by the identity principle 1.4
and to all parameters by holomorphy in the parameters. This is how Layer 2 proves the contiguous
relations and Layer 3 the equation, from the series. Layer 3 also proves Abel's identity for
Wronskians, which replaces the general theory of linear differential equations: two solutions with
nonvanishing Wronskian span all solutions.
Layer 4 evaluates Euler's integral at `z = 1` (Gauss's sum) and controls the series on its circle.
Layer 5 obtains each connection formula by expanding a solution in a fundamental pair at another
singularity (Layer 3) and fixing the two coefficients by the limits at `z = 1` (Layer 4), and
composes these with the Euler and Pfaff transformations. Layers 6–9 apply Layers 1–5; the
Mellin–Barnes integrals of Layer 6 are obtained from Mellin inversion of the Beta integral on
fixed vertical lines, never by closing a contour at infinity. The
`**Checks.**` and `### Examples` of each layer are statements to prove; they test the conventions
on explicit values.

## Layer 1: definition and analytic properties

### 1.1 Euler's integral

For `1 − z ∈ slitPlane`, `t ∈ [0, 1]` gives `1 − zt ∈ slitPlane`, so `(1 − zt)^{−a}` is
holomorphic in `(a, z)` and continuous in `t`. Prove:
- for `0 < Re b < Re c`, the integrand of `E(a, b, c, z)` is integrable on `[0, 1]`;
- `(a, b, c, z) ↦ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt` is holomorphic on
  `{0 < Re b < Re c} × {1 − z ∈ slitPlane}`, as a function on `ℂ × ℂ × ℂ × ℂ`, and so is `E`
  (`differentiableOn_eulerIntegral`);
- for `0 < Re b < Re c` and `‖z‖ < 1`, `E(a, b, c, z) = 𝐅(a, b; c; z)` as Mathlib's series
  (`regularizedGaussHGFun a b c z`), by the binomial series of `(1 − zt)^{−a}`, termwise
  integration and `Complex.Gamma_mul_Gamma_eq_betaIntegral`.

*Needs:* Mathlib parametric integrals, `Complex.betaIntegral`,
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, the binomial series.

### 1.2 Definition, uniqueness and existence

`regularizedGaussHypergeometric` and `gaussHypergeometric` as pinned. The targets:
- **uniqueness** (`IsEulerContinuation.eq`): if `G₁` and `G₂` are entire in `b` and
  in `c` at each fixed `z` with `1 − z ∈ slitPlane` and the other parameters fixed, and both equal
  `E` where `0 < Re b < Re c`, then `G₁ = G₂` at every `(a, b, c, z)` with `1 − z ∈ slitPlane`;
- **the shift relations**: for all `a`, `b`, `c` and `1 − z ∈ slitPlane`,

```text
𝐅(a, b; c; z) = (c − a) 𝐅(a, b; c + 1; z) + a 𝐅(a + 1, b; c + 1; z)        (in c)
𝐅(a, b; c; z) = 𝐅(a, b + 1; c; z) − a z 𝐅(a + 1, b + 1; c + 1; z)           (in b)
```

  (the regularized forms of 15.5.15 and 15.5.16_5; `regularizedGaussHypergeometric_shift_c`,
  `regularizedGaussHypergeometric_shift_b`);
- **the shift construction with fixed counts** (`shiftConstruction p q`): for `p, q : ℕ`,
  `S_{0,0} = E`,
  `S_{0,q+1}(a, b, c, z) = (c − a) S_{0,q}(a, b, c + 1, z) + a S_{0,q}(a + 1, b, c + 1, z)`
  and `S_{p+1,q}(a, b, c, z) = S_{p,q}(a, b + 1, c, z) − a z S_{p,q}(a + 1, b + 1, c + 1, z)`, the
  right-hand sides of the shift relations. The targets are:
  - `S_{p,q}` is holomorphic in `(a, b, c, z)` on the open set
    `R_{p,q} = {Re b > −p, Re(c − b) > p − q} × {1 − z ∈ slitPlane}`
    (`differentiableOn_shiftConstruction`), by induction, since each step only reads `S_{p,q}`
    at parameters that lie in the region of the previous step;
  - `S_{p,q} = E` on the region of Euler's integral, because `E` satisfies the shift relations
    there (proved on the disk from the series, 1.3, and extended by the identity theorem);
  - compatibility: `S_{p,q} = S_{p′,q′}` on `R_{p,q} ∩ R_{p′,q′}`, by the identity theorem in `c`
    and then in `b` on the convex slices of the intersection, from their agreement with `E`;
- **existence** (`exists_isEulerContinuation`): the sets `R_{p,q}` cover `ℂ³ × {1 − z ∈ slitPlane}`
  and are open, so by compatibility `G = S_{p,q}` on `R_{p,q}` is well defined. Near every point it
  equals one `S_{p,q}` with fixed counts on a neighbourhood, so it is holomorphic in `(a, b, c, z)`
  and in particular entire in `b` and in `c`. The counts `⌈1 − Re b⌉₊` and `⌈1 + p − Re(c − b)⌉₊`
  are not locally constant, which is why the fixed-count functions and their compatibility are
  separate targets. Then `regularizedGaussHypergeometric = S_{p,q}` on `R_{p,q}`
  (`regularizedGaussHypergeometric_eq_shiftConstruction`), by uniqueness;
- `regularizedGaussHypergeometric a b c z = E(a, b, c, z)` for `0 < Re b < Re c` and
  `1 − z ∈ slitPlane` (15.6.1, `regularizedGaussHypergeometric_eq_eulerIntegral`), and
  `regularizedGaussHypergeometric a b c z = 0` when `1 − z ∉ slitPlane`.

*Needs:* 1.1; Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
`DifferentiableOn.analyticOnNhd`.

### 1.3 The series and the polynomial cases

- 15.2.2 (`regularizedGaussHypergeometric_eq_regularizedGaussHGFun`):
  `regularizedGaussHypergeometric a b c z = regularizedGaussHGFun a b c z` for every `a`, `b`, `c`
  and `‖z‖ < 1`; 15.2.1 (`gaussHypergeometric_eq_ordinaryHypergeometric`):
  `gaussHypergeometric a b c z = ₂F₁ a b c z` for `c ∉ {0, −1, −2, …}` and `‖z‖ < 1`, with the Gamma
  form on the right of 15.2.1 for `a, b ∉ {0, −1, −2, …}`;
- 15.2.3_5 (`regularizedGaussHypergeometric_neg_nat`): for every `a`, `b`, `n : ℕ` and
  `1 − z ∈ slitPlane`,
  `𝐅(a, b; −n; z) = ((a)_{n+1} (b)_{n+1}/(n + 1)!) z^{n+1} F(a + n + 1, b + n + 1; n + 2; z)`,
  and `F(a, b; c; z)/Γ(c) → 𝐅(a, b; −n; z)` as `c → −n`;
- 15.2.4: for `m : ℕ`, `F(−m, b; c; z) = ∑_{n≤m} (−1)ⁿ C(m, n) (b)ₙ/(c)ₙ zⁿ` for
  `c ∉ {0, −1, −2, …}` and every `z` in the cut plane, and `₂F₁ (−m) b c z` is this polynomial
  for every `z`;
- 15.2.5: for `m, ℓ : ℕ`, Mathlib's `₂F₁ (−m) b (−m − ℓ) z` is the iterated limit of 15.2.5, the
  inner limit `a → −m` being `₂F₁ (−m) b c z` for `c ∉ {0, −1, −2, …}`; so 15.2.4 holds at
  `c = −m − ℓ` with the interpretation 15.2.5;
- 15.2.6: for `m, ℓ : ℕ`, `a ↦ gaussHypergeometric a b (a − ℓ) z` has a limit as `a → −m`, for
  every `b` and `1 − z ∈ slitPlane`; the limit is not `₂F₁ (−m) b (−m − ℓ) z` in general (see the
  check in 4.1).

**Checks.**
- `𝐅(0.3, 0.7; −2; 0.4) = 0.14562 15017 79…` by 15.2.3_5, and `F(0.3, 0.7; c; 0.4)/Γ(c)` at
  `c = −2 + 10⁻¹²` agrees to ten digits.

*Needs:* 1.1–1.2; Mathlib `Complex.ordinaryHypergeometric_div_Gamma_eq`,
`ordinaryHypergeometric_radius_top_of_neg_nat₁`.

### 1.4 Analytic properties

DLMF §15.2(ii) for the principal branch:
- `(a, b, c, z) ↦ 𝐅(a, b; c; z)` is holomorphic on `ℂ × ℂ × ℂ × {1 − z ∈ slitPlane}`
  (`differentiableOn_regularizedGaussHypergeometric`); in particular it is entire in each
  parameter and holomorphic in `z` on the cut plane;
- `F = Γ(c) 𝐅` is holomorphic in `(a, b, c, z)` on `{c ∉ {0, −1, −2, …}}` times the cut plane,
  and as a function of `c` has at most simple poles at `c ∈ {0, −1, −2, …}`;
- symmetry `𝐅(a, b; c; z) = 𝐅(b, a; c; z)` (`regularizedGaussHypergeometric_comm`), the value
  `𝐅(a, b; c; 0) = Γ(c)⁻¹` (`regularizedGaussHypergeometric_zero`), and
  `𝐅(ā, b̄; c̄; z̄) = conj 𝐅(a, b; c; z)` (`regularizedGaussHypergeometric_conj`), so that `𝐅` is
  real for real parameters and real `z < 1`;
- the identity principle on the cut plane: if `f`, `g` are holomorphic on the cut plane and agree
  on a nonempty open subset of the unit disk, they agree on the cut plane (the cut plane is
  star-shaped about `0`).

*Needs:* 1.2–1.3; Mathlib `Complex.starConvex_one_slitPlane`, `Complex.Gamma_conj`.

### Examples

- `F(0.3, 0.7; 1.9; 2 + i) = 1.03476 57242 8… + 0.30761 56787 97… i` and
  `F(0.3, 0.7; 1.9; −3) = 0.82621 98694 88…`, outside the disk of the series.
- `𝐅(a, b; c; z) = 0` at `z = 1` and `z = 3`, the junk value off the cut plane.

### Dependencies

Mathlib only.

## Layer 2: derivatives and contiguous relations

### 2.1 Differentiation formulas

DLMF 15.5.1–15.5.10 on the cut plane, with `(z d/dz z)ⁿ` and `((1 − z) d/dz (1 − z))ⁿ` written
as iterates of the operators `w ↦ z (d/dz)(z w)` and `w ↦ (1 − z)(d/dz)((1 − z) w)`:
- 15.5.1–15.5.2 for `F` with `c ∉ {0, −1, −2, …}`, and in regularized form
  `(dⁿ/dzⁿ) 𝐅(a, b; c; z) = (a)ₙ (b)ₙ 𝐅(a + n, b + n; c + n; z)` for all parameters
  (`hasDerivAt_regularizedGaussHypergeometric` at `n = 1`);
- 15.5.3–15.5.9 as printed, with the powers `z^{a−1}`, `z^{c−1}`, `z^{c−a−1}` taken on
  `z ∈ slitPlane` and `(1 − z)^{…}` on the cut plane, and in regularized form where `c − n` is a
  nonpositive integer;
- the operator identity 15.5.10 for functions holomorphic on an open set.

*Needs:* Layer 1.

### 2.2 Contiguous relations

DLMF 15.5.11–15.5.21, including 15.5.16_5, on the cut plane, for `F` with the third parameters
outside `{0, −1, −2, …}`, and each also in the regularized form, which holds for all parameters
(for 15.5.11, `regularizedGaussHypergeometric_contiguous_15_5_11`).
Also, the reduction of integer shifts, with cleared denominators: for integers `k`, `ℓ`, `m` there
are polynomials `A`, `B`, `D` in `(a, b, c, z)` with `D` not identically zero such that

```text
D 𝐅(a + k, b + ℓ; c + m; z) = A 𝐅(a, b; c; z) + B 𝐅(a + 1, b; c; z)
```

for all parameters and `1 − z ∈ slitPlane`. The polynomials for the three generating shifts
`(1, 0, 0)`, `(0, 1, 0)`, `(0, 0, 1)` and their inverses are pinned from 15.5.11–15.5.18, and the
general case follows by induction, multiplying the denominators. Dividing by `D` gives the
rational form of DLMF only where `D ≠ 0`: the pair `𝐅(a, b; c; ·)`, `𝐅(a + 1, b; c; ·)` can
degenerate. At `a = b = c = 1` the pair is `1/(1 − z)`, `1/(1 − z)²` (times `Γ(1)⁻¹`), while
`F(1, 1; 2; z) = −z⁻¹ log(1 − z)` is no combination of them with coefficients rational in `z`, so
`D` vanishes there for the shift `(0, 0, 1)`.

*Needs:* 2.1; Layer 1.

### Examples

- 15.5.11 at `(a, b, c, z) = (0.3, 0.7, 1.9, 2 + i)`, off the disk.
- 15.5.18 at `c = 1`, where its first term vanishes and it reduces to a two-term relation.

### Dependencies

Layer 1.

## Layer 3: the hypergeometric equation and Riemann's equation

### 3.1 The equation and Abel's identity

- 15.10.1 (`regularizedGaussHypergeometric_hypergeometricEquation`): `𝐅(a, b; c; ·)` solves the
  hypergeometric equation on the cut plane for all parameters, and so does `F` for
  `c ∉ {0, −1, −2, …}`;
- Abel's identity: for solutions `f`, `g` of 15.10.1 on a connected open set `U` avoiding `0` and
  `1`, `𝒲{f, g}′ = −((c − (a + b + 1)z)/(z(1 − z))) 𝒲{f, g}`; hence on a connected open
  `U ⊆ slitPlane ∩ {1 − z ∈ slitPlane}` the Wronskian is a constant multiple of
  `z^{−c} (1 − z)^{c−a−b−1}`;
- the span criterion (`exists_eqOn_combination_of_wronskian_ne_zero`): if `f₁`, `f₂` solve 15.10.1
  on a connected open `U` and `𝒲{f₁, f₂}` has no zero on `U`, every solution on `U` is `α f₁ + β f₂`
  with constants `α`, `β` (by Abel's identity, `𝒲{w, f₂}/𝒲{f₁, f₂}` and `𝒲{f₁, w}/𝒲{f₁, f₂}` are
  constant, and a solution whose Wronskians with `f₁` and `f₂` vanish is `0`).

*Needs:* Layers 1–2; Mathlib `IsOpen.is_const_of_deriv_eq_zero`.

### 3.2 Fundamental solutions

DLMF 15.10.2–15.10.7 on `U₀ = slitPlane ∩ {1 − z ∈ slitPlane}` (for the pairs at `0` and at
`1`) and on `U∞ = {z | z ∈ slitPlane ∧ z − 1 ∈ slitPlane} = ℂ \ (−∞, 1]` (for the pair at `∞`,
with `z^{−a}`, `z^{−b}` and `(z − 1)^{c−a−b−1}` principal as printed):
- each function of the pairs 15.10.2, 15.10.4 and 15.10.6 solves 15.10.1 where its third
  parameter is not a nonpositive integer;
- their Wronskians are 15.10.3, 15.10.5 and 15.10.7, so each pair is fundamental when `c`,
  `c − a − b`, respectively `a − b`, is not an integer (for the pair at `∞` on `U∞`,
  `wronskian_gaussHypergeometric_infty`).

`U∞` is the domain of the printed powers: the principal `z^{−a}` jumps across the negative real
axis, so the pair at `∞` is not a solution on `−z ∈ slitPlane`. At `(a, b, c) = (½, 1, 3/2)` the
first function is `z^{−1/2}`, whose limits at `−2` from above and below are `∓i/√2`. On
`{−z ∈ slitPlane} ∩ {1 − z ∈ slitPlane}` the functions `(−z)^{−a} F(a, a − c + 1; a − b + 1; 1/z)`
and `(−z)^{−b} F(b, b − c + 1; b − a + 1; 1/z)` of 15.8.2 are the solutions, with Wronskian
`(b − a) (−z)^{−c} (1 − z)^{c−a−b−1}`; 5.1 and 5.3 use this form.

The pairs are also stated in regularized form (third parameters `𝐅`), which removes the
hypotheses on the third parameters; the Wronskians then carry the reciprocal Gamma factors. For
the pair at `0` the regularized Wronskian is `(sin πc/π) z^{−c} (1 − z)^{c−a−b−1}`
(`wronskian_regularizedGaussHypergeometric_zero`).

*Needs:* 3.1.

### 3.3 Logarithmic cases

DLMF 15.10.8–15.10.10 and the rules (a)–(e) after them. 15.10.8 and 15.10.9 contain power series
of radius `1`, which diverge elsewhere: in 15.10.8 at `n = 1`, `a = b = 2` the series term is
`2(k + 1) zᵏ`, which does not tend to `0` at `z = 2i ∈ U₀`, and Lean's `tsum` of a divergent
series is not a continuation. So the targets are local, with a separate continuation:
- for `c = n ∈ {1, 2, …}`, the functions 15.10.8 and 15.10.9 solve 15.10.1 on
  `U₀ ∩ {‖z‖ < 1}` under the hypotheses printed with them, and 15.10.10, whose sums are finite, on
  all of `U₀`; with `F(a, b; n; z)` each forms a fundamental pair there, with Wronskian
  `z^{−n} (1 − z)^{n−a−b−1}` times a nonzero constant computed here; the case (a) holds with the
  interpretation 15.2.5;
- the continuation to `U₀`: with the regularized pair `f₁ = 𝐅(a, b; c; ·)`,
  `f₂ = z^{1−c} 𝐅(a − c + 1, b − c + 1; 2 − c; ·)` of 3.2, and `κ(c)` such that `f₂ − κ f₁`
  vanishes at `c = n` (by 15.2.3_5), the derivative `∂_c (f₂ − κ f₁)` at `c = n` solves 15.10.1 on
  all of `U₀` (the equation depends holomorphically on `c`, and the derivative of a family of
  solutions that vanishes at `c = n` is a solution there). On `U₀ ∩ {‖z‖ < 1}` it is an explicit
  combination of 15.10.8 (or 15.10.9) and `F(a, b; n; z)`, computed here;
- the cases (c), (d), (e) at `c = 2 − n`, at `1` and at `∞`, as the corresponding transforms of
  (a) and (b), with the series on the disks `‖z‖ < 1`, `‖1 − z‖ < 1` and `‖z‖ > 1` respectively
  and the continuations obtained in the same way.

The symbols `a`, `b` are interchangeable in 15.10.9–15.10.10.

*Needs:* 3.1–3.2; Mathlib `Complex.digamma`.

### 3.4 Riemann's equation

- 15.11.1 with the condition 15.11.2 for distinct finite `α`, `β`, `γ`, on an open set avoiding
  them, and its form with `γ = ∞` (obtained as the limit of the coefficients), which at
  `(α, β) = (0, 1)` with exponents `{0, 1 − c}`, `{0, c − a − b}`, `{a, b}` is 15.10.1
  (15.11.4);
- the P-symbol 15.11.3 is the solution set; it is not given a Lean definition, and 15.11.6–15.11.8
  are stated for solutions:
  - 15.11.6: under a Möbius map `t = (κz + λ)/(μz + ν)` with `κν − λμ = 1`, `w` solves Riemann's
    equation with singular points `α, β, γ` in `z` if and only if `w ∘ (inverse map)` solves it
    with singular points the images, and the same exponents, in `t`;
  - 15.11.7: on an open set where `(z − α)/(z − γ)`, `(z − β)/(z − γ)` lie in `slitPlane`, `w`
    solves Riemann's equation if and only if
    `((z − α)/(z − γ))^{−a₁} ((z − β)/(z − γ))^{−b₁} w(z)` is `u(ζ)` with `u` a solution of 15.10.1
    with `a = a₁ + b₁ + c₁`, `b = a₁ + b₁ + c₂`, `c = 1 + a₁ − a₂` and
    `ζ = (z − α)(β − γ)/((z − γ)(β − α))`;
  - 15.11.8: on `slitPlane ∩ {1 − z ∈ slitPlane}`, multiplication by `z^λ (1 − z)^μ` maps the
    solutions with exponents `{a₁, a₂}, {b₁, b₂}, {c₁, c₂}` at `0, 1, ∞` onto those with exponents
    `{a₁ + λ, a₂ + λ}, {b₁ + μ, b₂ + μ}, {c₁ − λ − μ, c₂ − λ − μ}`.

*Needs:* 3.1.

### Examples

- `𝒲{f₁, f₂}` of 15.10.2 at `(a, b, c, z) = (0.3, 0.7, 1.9, 0.4)` equals
  `(1 − c) z^{−c} (1 − z)^{c−a−b−1}`.
- At `c = 1` the pair 15.10.2 degenerates (`f₂ = f₁`), and 15.10.8 at `n = 1` supplies the
  second solution.

### Dependencies

Layers 1–2.

## Layer 4: elementary functions and unit argument

### 4.1 Elementary functions

DLMF 15.4.1–15.4.19 as identities of principal branches. Each is proved on a neighbourhood of
`0` from the series and extended by 1.4. The domain is attached to the hypergeometric argument
`w`, not to the auxiliary variable: the identity holds where `1 − w ∈ slitPlane` and the
elementary side is holomorphic, which gives the following.
- **Argument `z`** (15.4.1, 15.4.6, 15.4.17–15.4.19): `1 − z ∈ slitPlane`.
- **Argument `z²`** (15.4.2, 15.4.4, 15.4.7, 15.4.9): `1 − z² ∈ slitPlane`, that is
  `z ∉ (−∞, −1] ∪ [1, ∞)`, where `1 ± z ∈ slitPlane` and `(1 + z)/(1 − z) ∈ slitPlane`. At
  `a = ½`, `z = −2` in 15.4.7 the argument `z² = 4` is on the cut: the left side is the junk `0`
  and the right side is `−1/3`, so the hypothesis is needed (`gaussHypergeometric_sq_15_4_7`).
- **Argument `−z²`** (15.4.3, 15.4.5, 15.4.11, 15.4.13, 15.4.15): `1 + z² ∈ slitPlane`, that is
  `z ∉ i(−∞, −1] ∪ i[1, ∞)`, where `√(1 + z²) ± z` have positive real part.
- **Trigonometric arguments** (15.4.8, 15.4.10, 15.4.12, 15.4.14, 15.4.16): on the disks
  `|z| < π/4`, respectively `|z| < π/2`, printed before 15.4.1.
- **Elementary functions.** `arctan` is Mathlib's `Complex.arctan`; `arcsin z` in 15.4.4 is
  written `−i log(iz + √(1 − z²))` (DLMF 4.23.19), and the logarithm in 15.4.5 as
  `log(z + √(1 + z²))`, with principal `log` and `√`.
- **Removable points.** Where the elementary side has a denominator that can vanish (`z` in
  15.4.1–15.4.5, `(2 − 4a)z` in 15.4.9 and 15.4.15, `(1 − 2a) sin z` in 15.4.10, `(2a − 1) sin z`
  in 15.4.16, `a` in 15.4.19), the target is the identity multiplied by that denominator, for all
  parameters and all `z` in the domain. Then the quotient form is stated where the denominator is
  nonzero, with the value at the removable point separately: `F = 1` at `z = 0`, and at
  `a = ½` in 15.4.9, 15.4.10, 15.4.15 and 15.4.16 the limit in `a` (at 15.4.9 it is 15.4.2, at
  15.4.15 it is 15.4.5). For instance 15.4.1 is `z F(1, 1; 2; z) = −log(1 − z)` on the cut plane
  (`mul_gaussHypergeometric_one_one_two`), since at `z = 0` the literal right side
  `−z⁻¹ log(1 − z)` is Lean's `0` while `F(1, 1; 2; 0) = 1`.
- **Third parameters.** In 15.4.6 and 15.4.17–15.4.19 the third parameter is outside
  `{0, −1, −2, …}`; at a nonpositive integer they hold with the interpretation 15.2.6, stated as the
  limit in the parameter.

**Checks.**
- 15.4.6 at `a = −m`: `₂F₁ (−m) b (−m) z` (interpretation 15.2.5) is the sum of the first
  `m + 1` terms of the Maclaurin series of `(1 − z)^{−b}`, not `(1 − z)^{−b}`; for `m = 1`,
  `b = 2`, `z = ½` it is `2`, against `(1 − z)^{−b} = 4`.

*Needs:* Layers 1–2.

### 4.2 Unit argument

- 15.4.20 (Gauss): for `Re(c − a − b) > 0` and `c ∉ {0, −1, −2, …}`, the series converges
  absolutely at `z = 1`, `₂F₁ a b c 1 = Γ(c) Γ(c − a − b)/(Γ(c − a) Γ(c − b))`
  (`ordinaryHypergeometric_one`), and `gaussHypergeometric a b c z` tends to this value as
  `z → 1` in the cut plane (`tendsto_gaussHypergeometric_one`); in regularized form, Mathlib's
  series satisfies `regularizedGaussHGFun a b c 1 = Γ(c − a − b)/(Γ(c − a) Γ(c − b))` for every
  `c` with `Re(c − a − b) > 0`, and `regularizedGaussHypergeometric a b c z` tends to this value
  as `z → 1` in the cut plane. The continued function itself is not evaluated at `z = 1`, where
  its value is the junk `0`;
- 15.4.21–15.4.23: the limits as `z → 1−` for `c = a + b`, for `Re(c − a − b) = 0` with
  `c ≠ a + b`, and for `Re(c − a − b) < 0`, with DLMF's right-hand sides;
- 15.4.24 (Chu–Vandermonde, `ordinaryHypergeometric_neg_nat_one`): `₂F₁ (−n) b c 1 = (c − b)ₙ/(c)ₙ`
  for `n : ℕ` and `c` with `(c)ₙ ≠ 0`;
- 15.4.25 (Dougall, `hasSum_dougall`): for `Re(c + d − a − b) > 1` and `a, b ∉ ℤ`, the
  bilateral series `∑_{n∈ℤ} Γ(a + n) Γ(b + n)/(Γ(c + n) Γ(d + n))` (reciprocal Gamma factors as
  pinned) is summable and equals
  `π²/(sin πa sin πb) · Γ(c + d − a − b − 1)/(Γ(c − a) Γ(d − a) Γ(c − b) Γ(d − b))`.

Gauss's sum is Euler's integral at `z = 1` for `0 < Re b < Re c` and `Re(c − a − b) > 0`, which is a
Beta integral, extended to the rest of `Re(c − a − b) > 0` by holomorphy of both sides in the
parameters (the series at `1` converges uniformly on compact subsets of that region).

Dougall's sum is proved as a function of `d`, for fixed `a, b ∉ ℤ` and `c`, through the following
auxiliary targets:
- **convergence and holomorphy**: `|Γ(a + n) Γ(b + n)/(Γ(c + n) Γ(d + n))| = O(|n|^{Re(a+b−c−d)})`
  as `n → ±∞` (from the Gamma ratio along the integers and, for `n → −∞`, the reflection formula),
  so the series converges absolutely and locally uniformly on `Re d > 1 + Re(a + b − c)` and is
  holomorphic in `d` there;
- **recurrence**: both sides satisfy the same first-order recurrence under `d ↦ d + 1`;
- **integer values**: at `d = m ∈ ℤ` the terms with `m + n ≤ 0` vanish, the series is a Gauss
  series at `1`, and 4.2 gives the right side;
- **growth**: on every vertical strip of width `1` in the half-plane, the difference of the two
  sides, normalized so that the recurrence makes it `1`-periodic, is bounded by
  `C (1 + |Im d|)^K e^{σ|Im d|}` with `σ < π`. This uses bounds for `|Γ|` and `|1/Γ|` on vertical
  strips: ZerosOfLFunctions 1.3 for large `|Im d|` and compactness otherwise, and
  `|sin πd| ≤ e^{π|Im d|}`;
- **the periodic Carlson lemma**: a `1`-periodic function holomorphic on a neighbourhood of
  `Re w ≥ 0`, bounded by `C (1 + |Im w|)^K e^{σ|Im w|}` with `σ < π` on `0 ≤ Re w ≤ 1` and vanishing
  at `0`, vanishes on `Re w ≥ 0` (`eq_zero_of_periodic_of_bound`). Its proof is the classical
  one: divide by `sin πw`, which is bounded below by `e^{π|Im w|}/C′` away from the integers; the
  quotient is entire, periodic and `o(1)` as `|Im w| → ∞`, hence `0` by Liouville's theorem.

The normalized difference is periodic, of type below `π` and zero at the integers, so it is `0`.

*Needs:* 4.1; Layer 1; ZerosOfLFunctions 1.3; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
`Complex.Gamma_mul_Gamma_one_sub`, `Differentiable.apply_eq_apply_of_bounded` (Liouville).

### 4.3 The circle of convergence

DLMF §15.2(i), for `a, b ∉ {0, −1, −2, …}` (otherwise the series terminates) and `|z| = 1`: the
series of `₂F₁ a b c z` (with `c ∉ {0, −1, −2, …}`) converges absolutely if `Re(c − a − b) > 0`,
converges for `z ≠ 1` but not absolutely if `−1 < Re(c − a − b) ≤ 0`, and diverges if
`Re(c − a − b) ≤ −1`. On `|z| = 1`, `z ≠ 1`, where the series converges, its sum is the limit of
`gaussHypergeometric a b c (r z)` as `r → 1−`, which is `gaussHypergeometric a b c z` (Abel's
theorem); at `z = 1` this is 4.2.

The proof uses `|(a)ₛ (b)ₛ/((c)ₛ s!)| ∼ C s^{Re(a+b−c)−1}` (from
`Complex.Gamma_add_nat_div_Gamma_eq` and the ratio of Gamma functions at large argument along the
integers) and summation by parts.

*Needs:* 4.2; Mathlib `Complex.GammaSeq_tendsto_Gamma`.

### Examples

- `F(½, ½; 2; 1) = 4/π = 1.27323 95447 4…`.
- `F(−3, 2; 5; 1) = (3)₃/(5)₃ = 2/7`.
- `₂F₁ 1 1 3 1 = 2` and `regularizedGaussHGFun 1 1 3 1 = 1 = Γ(1)/(Γ(2) Γ(2))`, while
  `regularizedGaussHypergeometric 1 1 3 1 = 0`, the junk value at `z = 1`.
- Dougall at `(a, b, c, d) = (0.3, 0.45, 1.8, 2.1)`: both sides are `20.01689 511…`.

### Dependencies

Layers 1–2.

## Layer 5: linear transformations and connection formulas

### 5.1 Linear transformations

- 15.8.1 (Euler and Pfaff; `regularizedGaussHypergeometric_euler`,
  `regularizedGaussHypergeometric_pfaff`) on the cut plane for all parameters; `z/(z − 1)` lies in
  the cut plane when `z` does;
- 15.8.4 (`regularizedGaussHypergeometric_connection_one`) on
  `slitPlane ∩ {1 − z ∈ slitPlane}`, for all parameters (the `sin` factor on the left
  makes both sides entire in the parameters);
- 15.8.2 (`regularizedGaussHypergeometric_connection_infty`) and 15.8.3 on `−z ∈ slitPlane`, and
  15.8.5 on `slitPlane ∩ {1 − z ∈ slitPlane}`, for all parameters;
- 15.2.3 (`tendsto_regularizedGaussHypergeometric_jump`): for `x > 1`,
  `𝐅(a, b; c; x + iε) − 𝐅(a, b; c; x − iε)` tends, as `ε → 0+`, to
  `2πi/(Γ(a) Γ(b)) (x − 1)^{c−a−b} 𝐅(c − a, c − b; c − a − b + 1; 1 − x)`.

15.8.4 is proved first, for `c − a − b ∉ ℤ`: `𝐅(a, b; c; ·)` solves 15.10.1, so by 3.1–3.2 it is a
combination of the pair 15.10.4; the coefficient of the first function is the limit at `z = 1` for
`Re(c − a − b) > 0` (4.2), the coefficient of the second is the same limit after the Euler
transformation, for `Re(c − a − b) < 0`, and both identities extend to all parameters by holomorphy.
15.8.3 is 15.8.4 applied to the Pfaff transform, 15.8.2 is 15.8.3 composed with 15.8.1, and 15.8.5
is 15.8.4 composed with 15.8.1. 15.2.3 is 15.8.4 at `1 − x ± iε`.

**Checks.**
- 15.2.3 at `(a, b, c, x) = (0.3, 0.7, 1.9, 2)`: both sides are `0.82726 11591 4… i`.

*Needs:* Layers 1–4.

### 5.2 Limiting cases

- 15.8.6–15.8.7 for `m : ℕ`, with `₂F₁` for the terminating functions and the proviso `m ≤ ℓ` if
  `b = −ℓ`;
- 15.8.8–15.8.9 (`b − a = m ∈ ℕ`) and 15.8.10–15.8.11 (`c − a − b = m ∈ ℕ`) on the regions printed
  with them, with `ψ(x)/Γ(x)` written as pinned; the finite sums are over `Finset.range m`,
  empty at `m = 0`; the case `b − a ∈ −ℕ` by interchanging `a` and `b`;
- 15.8.12 on the cut plane, for all parameters.

The logarithmic cases are the limits of 15.8.2 and 15.8.4 as `b − a`, respectively `c − a − b`,
tends to `m`, computed with the derivative of `1/Γ`.

*Needs:* 5.1; Mathlib `Complex.digamma`.

### 5.3 Kummer's 24 solutions

DLMF 15.10.11–15.10.16: each of `w₁, …, w₆` is given by four expressions, and these agree on the
following domains, with principal powers:
- `w₁`–`w₄`: on `slitPlane ∩ {1 − z ∈ slitPlane}`, where all the arguments `z`, `1 − z`,
  `z/(z − 1)` and `1 − 1/z` of the expressions lie in their cut planes;
- `w₅`, `w₆`: on `Im z > 0` as printed, and on `Im z < 0` with `i` replaced by `−i` in every
  factor `e^{(·)πi}`. The four printed expressions of `w₅` (and of `w₆`) do not agree on all of
  `−z ∈ slitPlane`: at `(a, b, c) = (0.3, 0.7 + 0.2i, 1.9)` and `z = 2 − i` the first and third
  expressions of `w₅` differ by `1.16…` in modulus. On `−z ∈ slitPlane`, `e^{aπi} z^{−a}` and
  `e^{−aπi} z^{−a}` are `(−z)^{−a}` on `Im z > 0` and `Im z < 0` respectively, so the first
  expression of `w₅` is `(−z)^{−a} F(a, a − c + 1; a − b + 1; 1/z)` on both half-planes.

Each `wⱼ` solves 15.10.1 on its domain, by Layer 3 and 15.8.1.

*Needs:* 5.1; Layer 3.

### 5.4 Connection formulas

DLMF 15.10.17–15.10.36, the twenty connection formulas between the principal branches of
Kummer's solutions, with the Gamma ratios as printed and the hypotheses that the arguments of the
Gamma functions in numerators are not poles:
- those between `w₁`–`w₄` (15.10.17–15.10.18, 15.10.21–15.10.22) on
  `slitPlane ∩ {1 − z ∈ slitPlane}`;
- those involving `w₅` or `w₆` on `Im z > 0` as printed, and on `Im z < 0` with `i` replaced by
  `−i` throughout, consistently with 5.3; for 15.10.25, `gaussHypergeometric_eq_w5_w6_of_im_pos`
  and `gaussHypergeometric_eq_w5_w6_of_im_neg`.

**Checks.**
- 15.10.25 at `(a, b, c) = (0.3, 0.7 + 0.2i, 1.9)`: at `z = 2 + i` and `z = −3 + 0.5i` the
  printed form holds to working precision; at `z = 2 − i` it fails by `0.918…` in modulus, and the
  form with `i` replaced by `−i` holds.

*Needs:* 5.1–5.3.

### Examples

- 15.8.4 at `c = a + b + m`, `m = 0`: the left side vanishes, and 15.8.10 at `m = 0` gives the
  logarithmic form.
- 15.8.2 at `(a, b, c, z) = (0.3, 0.7 + 0.2i, 1.9, 2 − i)` with `(−z)^{−a}`, `(−z)^{−b}`.

### Dependencies

Layers 1–4.

## Layer 6: integral representations

### 6.1 Integrals over `[0, 1]` and `[0, ∞)`

- 15.6.1 is 1.2;
- 15.6.2_5: for `0 < Re b < Re c` and `1 − z ∈ slitPlane`, the half-line integral as printed, from
  15.6.1 by `t ↦ t/(t + 1)`;
- 15.6.8 and 15.6.9 (the latter for every `λ ∈ ℂ`) for `0 < Re d < Re c` and
  `1 − z ∈ slitPlane`, with all functions in the integrands principal.

*Needs:* Layers 1, 5.

### 6.2 Loop integrals

15.6.2–15.6.5 with the contours and branches DLMF fixes after 15.6.9, written as explicit pieces
(segments along the real axis on both sides and small circles, for the loops `(1+)`, `(0+)`
around the endpoints; for 15.6.5 the Pochhammer contour `(0+, 1+, 0−, 1−)` from a point
`A ∈ (0, 1)`), with the stated hypotheses. Independence of the radii and of the point `A` is part
of each target. Each is proved by collapsing the loop onto the segment under the hypothesis of
15.6.1, which gives 15.6.1 times the factor `(1 − e^{2πi(·)})`, and then by holomorphy in the
parameters.

*Needs:* 6.1; Mathlib Cauchy integral theorem.

### 6.3 Mellin–Barnes integrals

15.6.6 on `−z ∈ slitPlane` (`regularizedGaussHypergeometric_eq_mellinBarnes`) and 15.6.7 on
`1 − z ∈ slitPlane`, with the hypotheses printed. Every contour is a vertical line `Re t = σ`
followed by finitely many residues, and no contour is closed at infinity: the supplier estimate
of ZerosOfLFunctions 1.3 is uniform only on compact intervals of real parts, which controls the
tails of a fixed line and the horizontal sides between two fixed lines, but not a vertical side
whose real part tends to infinity. The targets and their route:
- **the Mellin–Barnes integral of `(1 + u)^{−a}`**: for `0 < σ′ < Re a` and `u > 0`,
  `Γ(a) (1 + u)^{−a} = (1/2π) ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy`, the Mellin inversion
  (Mathlib `mellinInv_mellin_eq`) of the Beta integral
  `∫₀^∞ t^{s−1} (1 + t)^{−a} dt = Γ(s) Γ(a − s)/Γ(a)` (DLMF 5.12.3), with vertical integrability
  from ZerosOfLFunctions 1.3;
- **15.6.6** for `Re a, Re b > 0` on a line `−min(Re a, Re b) < σ < 0`: for `z = −x`, `x > 0`, and
  `0 < Re b < Re c`, insert the Mellin–Barnes integral of `(1 + xt)^{−a}` into Euler's integral
  (1.2), exchange the integrals by Fubini and evaluate the inner Beta integral. Both sides are
  holomorphic in `z` on `−z ∈ slitPlane` (the integrand decays like `e^{−(π − |ph(−z)|)|y|}`) and
  entire in `c` (the integrand is entire in `c`, with bounds locally uniform in `c` from the
  `|1/Γ|` bound of ZerosOfLFunctions 1.3), so the identity theorem in `z` and then in `c` gives
  15.6.6 on `−z ∈ slitPlane` for all `c`;
- **the separating contour**: for other `a`, `b` with `a, b ∉ {0, −1, −2, …}`, DLMF's contour is
  the line `Re t = σ` with `σ < 0`, `σ ∉ −a − ℕ`, `σ ∉ −b − ℕ`, plus the residues at the finitely
  many poles `t = −a − k`, `t = −b − k` with real part above `σ`; the target is that this sum does
  not depend on `σ` and continues 15.6.6 analytically in `a` and `b`. Moving the line between two
  fixed abscissae uses the rectangle form of the residue theorem and the strip estimate;
- **Barnes's first lemma** (DLMF 5.13.3, `integral_Gamma_mul_Gamma_mul_Gamma_mul_Gamma`): for
  positive real parts, `(1/2π) ∫ Γ(a + iy) Γ(b + iy) Γ(c − iy) Γ(d − iy) dy` equals
  `Γ(a + c) Γ(a + d) Γ(b + c) Γ(b + d)/Γ(a + b + c + d)`,
  proved by inserting the Mellin–Barnes integral of `(1 + u)^{−(b + d)}` into a Beta integral and
  using Fubini;
- **15.6.7** for `|z| < 1` and the line conditions printed: expand `(1 − z)^t` by the binomial
  series, integrate termwise (dominated convergence, from the decay of the integrand) and
  evaluate each term by Barnes's first lemma, which gives the Gauss series; then extend to
  `1 − z ∈ slitPlane` by 1.4, since the integral is holomorphic in `z` there.

**Checks.**
- 15.6.6 at `(a, b, c, z) = (0.6, 0.8, 1.7, −2)` on the line `Re t = −0.3`: both sides are
  `0.77812 18420 03…`.

*Needs:* 6.1; Layer 5; ZerosOfLFunctions 1.3; Tau Ceti residues.

### Examples

- 15.6.1 at `a = 0`: `𝐅(0, b; c; z) = 1/Γ(c)`, which is `B(b, c − b)/(Γ(b) Γ(c − b))`.
- 15.6.2_5 at `(a, b, c, z) = (1, 1, 2, −1)`: `∫₀^∞ (t + 1)^{−1} (2t + 1)^{−1} dt = log 2`, which is
  `F(1, 1; 2; −1)` by 15.4.1.

### Dependencies

Layers 1–5; ZerosOfLFunctions 1.3.

## Layer 7: quadratic transformations

### 7.1 Quadratic transformations

DLMF 15.8.13–15.8.28 with the regions printed with them, all functions principal, and the
hypotheses that the third parameters of every `F` are outside `{0, −1, −2, …}`. Table 15.8.1 is
not a target; the necessity of its conditions is not claimed. Each transformation is proved on a
neighbourhood of `0` (or of the point where both arguments vanish) by showing that both sides
solve the same hypergeometric equation and agree to first order there, using 3.1, and extended to
the printed region by 1.4; 15.8.24–15.8.28 follow from 15.8.13–15.8.21 and the connection
formulas of Layer 5. The Lean file states 15.8.13 as `gaussHypergeometric_quadratic_15_8_13`.

*Needs:* Layers 1–5.

### 7.2 Special quadratic transformations

DLMF 15.8.29–15.8.30, on the intersections of the regions of the transformations they compose.

*Needs:* 7.1.

### 7.3 Special values from quadratic transformations

DLMF 15.4.26–15.4.30:
- 15.4.26 (Kummer, `gaussHypergeometric_neg_one`) from 15.8.16 as `z → −1` along `(−1, 0)`, where
  its argument tends to `1`, with 4.2 and the duplication formula;
- 15.4.27 with Mathlib's `Complex.digamma`;
- 15.4.28–15.4.29 (Gauss's second theorem; 15.4.28 is `gaussHypergeometric_half`) from 15.8.18 as
  `z → ½` along `(0, ½)`;
- 15.4.30 (Bailey) from 15.8.20 as `z → ½` likewise.

Each holds under the conditions under which the right-hand side is finite and the left-hand
side is defined.

**Checks.**
- 15.4.26 at `(a, b) = (0.6, 0.25)`: both sides are `0.91945 80407 49…`.
- 15.4.28 at `(a, b) = (0.6, 1.3)`: both sides are `1.44511 78602 9…`.

*Needs:* 7.1; Layer 4; Mathlib `Complex.Gamma_mul_Gamma_add_half`.

### Examples

- 15.8.13 at `b = ½`: `F(a, ½; 1; z)` against `(1 − z/2)^{−a} F(a/2, a/2 + ½; 1; (z/(2 − z))²)` at
  `z = 0.6`.

### Dependencies

Layers 1–5.

## Layer 8: cubic transformations

### 8.1 Cubic transformations

- 15.8.31 for `Re z < 8/9` (`gaussHypergeometric_cubic_15_8_31`);
- 15.8.32 for `|z| > 1` and `|ph(−z)| < π/3`, with `ζ` as printed and all powers principal;
- 15.8.33 (Ramanujan, `gaussHypergeometric_ramanujan`) for `z` in the intersection of the disks
  `|z − ¼ ± (√3/4) i| < √3/2`, which is `|ph((1 − z)/(1 + 2z))| < π/3`.

Each is proved like 7.1: both sides solve the same equation after the cubic change of variable,
they agree to first order at a common point, and the identity extends by 1.4; for 15.8.32 the
comparison is made in `u = 1/ζ` near `u = 0` and continued through the connection formulas of
Layer 5.

*Needs:* Layers 1–5.

### 8.2 Special values from cubic transformations

DLMF 15.4.31–15.4.34, from 15.8.31 at `z = −1/3`-type points and from 15.8.32 at
`e^{iπ/3}`, with Gauss's sum 15.4.20 and the duplication formula; 15.4.33 and 15.4.34 at the
point `e^{iπ/3}` of the unit circle, which lies in the cut plane; and with the interpretation
15.2.6 at the excluded values of `a` printed after 15.4.34, stated as the limit in `a`.

*Needs:* 8.1; Layer 4.

### Examples

- 15.8.33 at `z = 0.3`: both sides of Ramanujan's transformation at the point and its image.

### Dependencies

Layers 1–5.

## Layer 9: polynomial and elliptic cases, integrals, sums and products

### 9.1 Chebyshev and Legendre polynomials; `D(k)`

- 15.9.5–15.9.6: `(T ℂ n).eval x = ₂F₁ (−n) n (½) ((1 − x)/2)` and
  `(U ℂ n).eval x = (n + 1) ₂F₁ (−n) (n + 2) (3/2) ((1 − x)/2)` for `n : ℕ` and every `x : ℂ`,
  with Mathlib's `Polynomial.Chebyshev.T` and `U` (for `T`, `chebyshevT_eq_ordinaryHypergeometric`);
- 15.9.7: the Legendre polynomial `P_n(x)` is Mathlib's `Polynomial.shiftedLegendre n` evaluated
  at `(1 − x)/2`, with no further sign, and
  `(shiftedLegendre n).eval ((1 − x)/2) = ₂F₁ (−n) (n + 1) 1 ((1 − x)/2)` for `n : ℕ` and every
  `x`; at `n = 1` both sides are `x`. Coefficientwise, `(−n)ₖ (n + 1)ₖ/(k!)²` is Mathlib's
  `(−1)ᵏ C(n, k) C(n + k, n)` (`coeff_shiftedLegendre`), so the identity holds at every argument
  (`shiftedLegendre_eval_eq_ordinaryHypergeometric`);
- 15.9.26 (`legendreD_eq_ordinaryHypergeometric`): for real `k` with `0 < k² < 1`,
  `(legendreK k − legendreEc k)/k² = (π/4) ₂F₁ (½) (3/2) 2 k²`, with `D(k) = (K(k) − E(k))/k²`
  (DLMF 19.2.6), from 15.9.24–15.9.25 and the contiguous relations.

*Needs:* Layer 2; Mathlib Chebyshev and shifted Legendre polynomials; Tau Ceti elliptic
integrals.

### 9.2 Mellin transform and the expansion 15.15.1

- 15.14.1 (`integral_cpow_mul_regularizedGaussHypergeometric_neg`): for
  `0 < Re s < min(Re a, Re b)`, `x ↦ x^{s−1} 𝐅(a, b; c; −x)` is integrable on
  `(0, ∞)` and its integral is `Γ(s) Γ(a − s) Γ(b − s)/(Γ(a) Γ(b) Γ(c − s))`, proved from 15.6.1
  and Fubini where `0 < Re b < Re c` and extended by holomorphy in `c`;
- 15.15.1 (`hasSum_regularizedGaussHypergeometric_inv`): for `z₀ ≠ 0` and
  `|z − z₀| > max(|z₀|, |z₀ − 1|)`, the series converges and equals `𝐅(a, b; c; 1/z)`, with
  `(1 − z₀/z)^{−a}` principal. The coefficients `𝐅(−s, b; c; 1/z₀)` are Mathlib's polynomial
  `regularizedGaussHGFun (−s) b c z₀⁻¹`, defined for every argument and every `c`, not the
  continued function: `1/z₀` may lie on the cut, where the continued function is the junk `0`. At
  `a = 0`, `b = c = 1`, `z₀ = ½`, `z = −1` the left side is `1`, and with continued coefficients the
  right side would be `0`. Nor are they `₂F₁ (−s) b c (1/z₀)/Γ(c)`, which loses the polynomial at
  the poles of `Γ(c)`.

**Checks.**
- 15.14.1 at `(a, b, c, s) = (1.5, 2.2, 1.1, 0.7)`: both sides are `0.61835 14093 65…`.

*Needs:* Layers 1, 5–6.

### 9.3 Products

DLMF 15.16.1–15.16.5: 15.16.1–15.16.2 (with `A_s` defined by the generating function 15.16.2) and
15.16.3 on the disks printed, 15.16.4 as an identity of power series on `|z| < 1` for
`c ∉ ℤ`, and 15.16.5 (the generalized Legendre relation) on `slitPlane ∩ {1 − z ∈ slitPlane}`
under the conditions that make its Gamma factors finite.

**Checks.**
- 15.16.4 at `(a, b, c, z) = (0.3, 0.45, 0.8, 0.35)`: the left side is `1` to working precision.

*Needs:* Layers 1–5.

### Examples

- `D(1/√2) = 1.00686 15925 1…` from 15.9.26.
- 15.9.5 at `n = 2`: `₂F₁ (−2) 2 (½) ((1 − x)/2) = 2x² − 1`.

### Dependencies

Layers 1–6; Tau Ceti elliptic integrals.

## Downstream consumers

- A roadmap for the Legendre functions (DLMF Chapter 14), whose definitions 14.3.1–14.3.10 are
  continued Gauss functions, consumes Layers 1–7; DLMF 15.9.16–15.9.23 belong there.
- The formulas that other roadmaps leave to a Chapter 15 roadmap are relations between the
  continued Gauss function and the functions of those roadmaps, and belong to roadmaps that
  consume both: DLMF 8.14.5–8.14.6, 8.17.9 and 8.19.25 outside the unit disk
  (SpecialFunctionsEiLiErfIncompleteGamma), 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9
  and 13.23.4 (SpecialFunctionsConfluent), and the formulas through the Gauss function in
  SpecialFunctionsBessel's list of DLMF 10.16.6–10.43.26.
- A roadmap for the large-parameter asymptotics of §15.12 consumes Layers 1–6 with
  AsymptoticExpansions and SpecialFunctionsBessel.
- Roadmaps for the generalized hypergeometric functions (DLMF Chapter 16) and the orthogonal
  polynomials (DLMF Chapter 18) consume Layers 1–5.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material completes DLMF Chapter 15. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

**Planned for follow-up roadmaps.**
- **Continued fractions** (DLMF §15.7, 15.7.1–15.7.6). Their convergence rests on Pincherle's
  theorem for minimal solutions of three-term recurrences, which the
  SpecialFunctionsEiLiErfIncompleteGamma roadmap (an open pull request) owns, and on the
  contiguous relations of Layer 2.
- **Orthogonal polynomials and functions of §15.9**: the Jacobi and Gegenbauer polynomials
  15.9.1–15.9.4 and the Krawtchouk, Meixner and Meixner–Pollaczek polynomials 15.9.8–15.9.10,
  for a future roadmap on the orthogonal polynomials of DLMF Chapter 18; the
  Jacobi function and transform 15.9.11–15.9.14, the Gegenbauer function 15.9.15, and the
  Legendre and Ferrers functions 15.9.16–15.9.23 (DLMF Chapter 14).
- **Large-parameter asymptotics** (DLMF §15.12): 15.12.1–15.12.13. They need the expansion API,
  Watson's lemma and the saddle-point method of
  [AsymptoticExpansions](../AsymptoticExpansions/README.md), and the Bessel-function
  approximations of §15.12(iii) need the SpecialFunctionsBessel roadmap (an open pull
  request).

**Deferred, with no planned roadmap.**
- **Zeros** (DLMF §15.13): the count 15.13.1 of the zeros in the cut plane for real parameters.
- **Other branches and monodromy**: values off the principal sheet and the monodromy groups of
  §15.17(v).
- **Applications and computation** (DLMF §§15.17–15.20), and the integrals and transforms cited
  in §15.14 beyond 15.14.1.
- **Sections with nothing to formalize**: the notation of §15.1 and the graphics of §15.3.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/Hypergeometric/` provides source material for Layers 1–5 and 7–8, with a coverage table in
`DLMF/Hypergeometric/DLMFCoverage.md`. That development defines the continued function by the
recursion of contiguous shifts ending in Euler's integral; this roadmap defines it by Euler's
integral and uniqueness, with the recursion as the existence theorem. Most of its tagged
statements are on the unit disk or on lens-shaped regions; this roadmap states them on the cut
plane or on the regions DLMF prints.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Hypergeometric/Basic/PrincipalBranch`, `Basic/CutPlane`, `Basic/GaussSeries`, `ParameterHolomorphy`, `ArgumentContinuation`, `Continuation`, `AnalyticProperties` |
| 2 | `Hypergeometric/Derivatives`, `Contiguous` |
| 3 | `Hypergeometric/Basic/GaussEquation`, `DiffEq`, `Solutions/*`, `Riemann` |
| 4 | `Hypergeometric/Basic/SpecialValues`, `Elementary/*`, `Boundary`, `Saalschutz`, `Identities/Dougall` |
| 5 | `Hypergeometric/Transformations`, `Kummer`, `ConnectionFormulas`, `LogConnectionsRecipGamma`, `Solutions/Connections` |
| 6 | `Hypergeometric/EulerIntegral`, `EulerHalfLine`, `IntegralRepresentations`, `LoopIntegral` |
| 7 | `Hypergeometric/FurtherTransformations/Quadratic`, `QuadraticConnections` |
| 8 | `Hypergeometric/FurtherTransformations/Cubic`, `CubicTools`, `Elementary/CubicValues` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 15
  (A. B. Olde Daalhuis), <https://dlmf.nist.gov/15>. Every equation number refers to this
  release.
- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapters 2 and 3.
- A. Erdélyi, W. Magnus, F. Oberhettinger and F. G. Tricomi, *Higher Transcendental Functions*,
  Vol. I, McGraw-Hill, 1953, Chapter II.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapter 5.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XIV.
- J. Dougall, On Vandermonde's theorem, and some more general expansions, *Proc. Edinburgh Math.
  Soc.* 25 (1907), 114–132.

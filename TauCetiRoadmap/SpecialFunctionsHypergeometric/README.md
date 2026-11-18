# Roadmap: the Gauss hypergeometric function

**Summary.** This roadmap builds the classical theory of the Gauss hypergeometric function as a
library: its principal branch on the cut plane for all complex parameters, the differential
equation and its solutions at the three singular points, the summation theorems at `z = 1`, the
linear, quadratic and cubic changes of variable, and the integral representations. Its
organization follows the proof dependencies of the subject rather than any one text: the
continued function is defined first, by Euler's integral, and every later identity is proved on a
piece of the unit disk and carried to the cut plane by the identity principle. The content is
drawn from Andrews–Askey–Roy (*Special Functions*, Chs. 2–3), Lebedev (*Special Functions and
Their Applications*, Ch. 9), Olver (*Asymptotics and Special Functions*, Ch. 5), Temme (*Special
Functions*, Ch. 5), Whittaker–Watson (Chs. X and XIV), Beals–Wong (*Special Functions*, Ch. 8),
Duverney (*An Introduction to Hypergeometric Functions*, Chs. 4 and 9) and the NIST *Digital
Library of Mathematical Functions* (DLMF), which is the primary locator source; each headline
cites its sources (see [References](#references)). Mathlib has the Gauss series

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
  its joint holomorphy in `(a, b, c, z)` and its agreement with Mathlib's series (Layer 1);
- the derivatives and the contiguous relations (Layer 2);
- the hypergeometric equation, its local solutions at `0`, `1` and `∞` including the logarithmic
  cases, their Wronskians, and Riemann's equation with its transformations (Layer 3);
- the elementary cases, the values at `z = 1` (Gauss, Chu–Vandermonde, Dougall), and the
  behaviour of the series on its circle of convergence (Layer 4);
- the Pfaff and Euler transformations, the connection formulas between the singular points with
  their logarithmic limiting cases, Kummer's 24 solutions, the jump across the cut and the limits
  at `z = 1` (Layer 5);
- the Euler, loop, Mellin–Barnes and fractional integral representations (Layer 6);
- the quadratic and cubic transformations and the special values that follow from them
  (Layers 7–8);
- the Chebyshev, Legendre-polynomial and elliptic cases, the Mellin transform, the expansion in
  powers of `1/z` about a point `z₀`, the product formulas with the generalized Legendre relation,
  and three integrals of incomplete Gamma, incomplete Beta and generalized exponential-integral
  type that are Gauss functions with argument off the unit disk (Layer 9).

The rest of the classical theory of `F` is outside this roadmap and listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement): the
continued fractions for ratios of contiguous functions, the relations to the Jacobi, Gegenbauer
and discrete orthogonal polynomials and to the Jacobi, Gegenbauer and Legendre functions, the
asymptotics for large parameters, the zeros, the branches off the principal sheet with the
monodromy, and the applications and numerical methods.

The roadmap rests on Mathlib and Tau Ceti, and on two roadmaps. For Dougall's sum and the
Mellin–Barnes integrals alone it consumes the Gamma function on vertical strips from
[ZerosOfLFunctions](../ZerosOfLFunctions/README.md). For the integrals of 9.4 alone it consumes
the incomplete Gamma function, the generalized exponential integral and the incomplete Beta
function from
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md).
The theory of the hypergeometric equation it uses is the elementary one of Abel's identity for
Wronskians, proved here for this equation.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Hypergeometric/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The principal branch by Euler's integral**: definition, existence, holomorphy, the series
   and the polynomial cases (1.1–1.4).
2. **Differentiation and three-term relations** (2.1–2.2).
3. **The differential equation, Wronskians and local solutions**, including the logarithmic
   cases and Riemann's equation (3.1–3.4).
4. **Elementary reductions and the series at `z = 1`**: the elementary closed forms, the sums of
   Gauss, Chu–Vandermonde and Dougall, and the circle of convergence (4.1–4.3).
5. **Pfaff–Euler identities and the connection problem**: the connection formulas and their
   logarithmic cases, Kummer's 24 solutions, the jump across the cut and the limits at `z = 1`
   (5.1–5.5).
6. **Euler, loop and Mellin–Barnes integrals** (6.1–6.3).
7. **Transformations of degree two** and the special values they give (7.1–7.3).
8. **Transformations of degree three** and the special values they give (8.1–8.2).
9. **Polynomials, the Mellin transform, products and related integrals**: the Chebyshev and
   Legendre polynomials and `D(k)`, the Mellin transform and the expansion in powers of `1/z`,
   the products, and the incomplete Gamma, incomplete Beta and exponential-integral integrals with
   argument off the unit disk (9.1–9.4).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`. Each
subsection names the DLMF equations it restates, as locators, beside the books that contain them.

**What this roadmap owns:** the statements of Layers 1–9, with the hypotheses and conventions
specified there. Cases of them that Mathlib or Tau Ceti already proves are inputs, not targets;
the targets are the remaining cases. The inputs are:
- the Gauss series on the disk: Mathlib's `ordinaryHypergeometric` and
  `Complex.regularizedGaussHGFun`, their radius of convergence, their symmetry in `a` and `b` and
  `₂F₁ = Γ(c) 𝐅` for `c ∉ {0, −1, −2, …}` (`Complex.ordinaryHypergeometric_div_Gamma_eq`);
- 15.9.24 and 15.9.25 for real `k` with `k² < 1`: Tau Ceti's
  `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric`
  (DLMF 19.5.1–19.5.2, from [EllipticIntegrals](../EllipticIntegrals/README.md)).

Two roadmaps on main own special cases of targets here. This roadmap neither consumes them nor
restates them:
- [ConformalMappingPartII](../ConformalMappingPartII/README.md) §4.1 owns 15.10.1 for Mathlib's
  series on the unit disk, and §4.6 owns 15.8.10 at `m = 0`, `b = a`,
  the continuation of `₂F₁(a, a; 2a; ·)` across the slit disk around `z = 1`. 3.1 and 5.2 are
  their general cases, on the cut plane and for all parameters.
- [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)
  owns 8.14.5–8.14.6, 8.17.9 and 8.19.25 where the hypergeometric argument lies in the unit disk
  (its 3.4, 15.2 and 7.5). 9.4 owns the rest of their range.

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti provides:

| Result | Target |
|---|---|
| Euler's integral converges for `1 − z ∈ slitPlane` and `Re c > Re b > 0`, and is holomorphic in `(a, b, c, z)` there | 1.1 |
| Uniqueness: two functions entire in `b` and in `c` at every fixed `z` of the cut plane that agree with Euler's integral where `Re c > Re b > 0` agree on the cut plane | 1.2 |
| The shift relations in `c` and in `b`, and the existence of the continuation by iterating them down to Euler's integral | 1.2 |
| The shift construction with fixed counts: holomorphy on its region, agreement with Euler's integral, and compatibility of different counts | 1.2 |
| The identity principle on the cut plane: an identity between functions holomorphic on the cut plane that holds on a nonempty open subset of the unit disk holds on the cut plane | 1.4 |
| Abel's identity for the hypergeometric equation, and the resulting criterion: if `f₁`, `f₂` solve 15.10.1 on a connected open set with nonvanishing Wronskian, every solution there is a combination of them | 3.1 |
| The logarithmic solutions continued to `slitPlane ∩ {1 − z ∈ slitPlane}` as parameter derivatives of the regularized pair | 3.3 |
| Dougall's series: convergence and holomorphy in `d`, the recurrence, the integer values, the growth bound, and the periodic Carlson lemma | 4.2 |
| The cubic transformation behind 15.4.31, which DLMF's note to 15.4.31 takes from Erdélyi et al. (1953a, Eq. 2.11(41)) | 8.1 |
| The Mellin–Barnes integral of `(1 + u)^{−a}`, independence of the separating contour, and Barnes's first lemma (DLMF 5.13.3) | 6.3 |

**What it does not own:**
- The Gauss series on the disk and the facts listed above as inputs (Mathlib), and the complete
  elliptic integrals `K`, `E` with 15.9.24–15.9.25 (Tau Ceti).
- The Gamma function on vertical strips (ZerosOfLFunctions 1.3), consumed for Dougall's sum
  (4.2) and the Mellin–Barnes integrals (6.3).
- The incomplete Gamma function `Γ(a, x)`, the generalized exponential integral `E_p(x)` and the
  incomplete Beta function `B_x(a, b)`, consumed from SpecialFunctionsEiLiErfIncompleteGamma for
  9.4, and 8.14.5–8.14.6, 8.17.9 and 8.19.25 where the hypergeometric argument lies in the unit
  disk, which that roadmap owns.
- 15.10.1 on the unit disk and 15.8.10 at `m = 0`, `b = a` in the forms of ConformalMappingPartII
  §§4.1 and 4.6.
- The continued fractions for ratios of contiguous functions (DLMF §15.7), and the expressions
  of the Jacobi, Gegenbauer, Krawtchouk, Meixner and Meixner–Pollaczek polynomials and of the
  Jacobi, Gegenbauer and Legendre functions as Gauss functions (DLMF 15.9.1–15.9.4,
  15.9.8–15.9.23).
- The asymptotics for large parameters (DLMF §15.12), the zeros (DLMF §15.13), branches off the
  principal sheet and the monodromy, and the applications and numerical methods.
- The formulas relating `F` to the Bessel and confluent hypergeometric functions through the
  continued Gauss function, which SpecialFunctionsBessel and SpecialFunctionsConfluent leave to
  a roadmap on the Gauss function. Both of those roadmaps come after this one, and the formulas
  belong to SpecialFunctionsHypergeometricPartII, which consumes all three.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the principal branch of `F` and `𝐅` on the
cut plane for all parameters and the classical theory stated through it, elementary functions,
`Γ`, `ψ`, Mathlib's Chebyshev and Legendre polynomials and Tau Ceti's complete elliptic
integrals, as listed in the layers, except the continued fractions, the orthogonal polynomials
and functions beyond Chebyshev and Legendre polynomials, the large-parameter asymptotics, the
zeros and the applications, together with three incomplete-function integrals that are Gauss
functions off the unit disk; it consumes the Gamma function on vertical strips from
ZerosOfLFunctions and the incomplete Gamma and Beta functions and `E_p` from
SpecialFunctionsEiLiErfIncompleteGamma.

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

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- [Its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions):
  `TauCeti.Complex.upperIncompleteGamma` (`Γ(a, z)`), `TauCeti.expIntegralE` (`E_p(z)`) and
  `TauCeti.incompleteBeta` (`B_x(a, b)` for `a, b > 0` and `0 ≤ x ≤ 1`, with real powers).
- Its 1.3: `Γ(a, x) = ∫_x^∞ t^{a−1} e^{−t} dt` for `x > 0`. Its 7.1 (DLMF 8.19.3):
  `E_p(x) = ∫_1^∞ e^{−xt} t^{−p} dt` for `x > 0`. 9.4 uses these forms of the integrands.
- Its 3.4, 15.2 and 7.5: 8.14.5–8.14.6, 8.17.9 and 8.19.25 where the hypergeometric argument lies
  in the unit disk, with Mathlib's `ordinaryHypergeometric`. 9.4 extends them by the identity
  theorem.

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

## Layer 1: the principal branch by Euler's integral

### 1.1 Euler's integral

For `1 − z ∈ slitPlane`, `t ∈ [0, 1]` gives `1 − zt ∈ slitPlane`, so `(1 − zt)^{−a}` is
holomorphic in `(a, z)` and continuous in `t`. Prove the following (Andrews–Askey–Roy
Theorem 2.2.1, p. 65; Lebedev (9.1.4)–(9.1.6), pp. 239–240; Olver Ch. 5 (9.09), p. 161; Temme
(5.4), p. 110; Beals–Wong Proposition 8.3.1, p. 271; Duverney (4.10), p. 107; DLMF 15.6.1):
- for `0 < Re b < Re c`, the integrand of `E(a, b, c, z)` is integrable on `[0, 1]`;
- `(a, b, c, z) ↦ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt` is holomorphic on
  `{0 < Re b < Re c} × {1 − z ∈ slitPlane}`, as a function on `ℂ × ℂ × ℂ × ℂ`, and so is `E`;
- for `0 < Re b < Re c` and `‖z‖ < 1`, `E(a, b, c, z) = 𝐅(a, b; c; z)` as Mathlib's series
  (`regularizedGaussHGFun a b c z`), by the binomial series of `(1 − zt)^{−a}`, termwise
  integration and `Complex.Gamma_mul_Gamma_eq_betaIntegral`.

*Needs:* Mathlib parametric integrals, `Complex.betaIntegral`,
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, the binomial series.

### 1.2 Definition, uniqueness and existence

`regularizedGaussHypergeometric` and `gaussHypergeometric` as pinned. The continuation by
repeated contiguous shifts down to Euler's integral is Lebedev's (9.1.7)–(9.1.8), pp. 240–241,
applied to `F/Γ(c)` in his §9.4, pp. 245–246; here it is the existence theorem. The targets:
- **uniqueness** (`IsEulerContinuation.eq`): if `G₁` and `G₂` are entire in `b` and
  in `c` at each fixed `z` with `1 − z ∈ slitPlane` and the other parameters fixed, and both equal
  `E` where `0 < Re b < Re c`, then `G₁ = G₂` at every `(a, b, c, z)` with `1 − z ∈ slitPlane`;
- **the shift relations**: for all `a`, `b`, `c` and `1 − z ∈ slitPlane`,

```text
𝐅(a, b; c; z) = (c − a) 𝐅(a, b; c + 1; z) + a 𝐅(a + 1, b; c + 1; z)        (in c)
𝐅(a, b; c; z) = 𝐅(a, b + 1; c; z) − a z 𝐅(a + 1, b + 1; c + 1; z)           (in b)
```

  (the regularized forms of 15.5.15 and 15.5.16_5, which are Lebedev (9.2.5), p. 242, and
  (9.2.13), p. 243; `regularizedGaussHypergeometric_shift_c`,
  `regularizedGaussHypergeometric_shift_b`);
- **the shift construction with fixed counts** `S_{p,q}`: for `p, q : ℕ`,
  `S_{0,0} = E`,
  `S_{0,q+1}(a, b, c, z) = (c − a) S_{0,q}(a, b, c + 1, z) + a S_{0,q}(a + 1, b, c + 1, z)`
  and `S_{p+1,q}(a, b, c, z) = S_{p,q}(a, b + 1, c, z) − a z S_{p,q}(a + 1, b + 1, c + 1, z)`, the
  right-hand sides of the shift relations. The targets are:
  - `S_{p,q}` is holomorphic in `(a, b, c, z)` on the open set
    `R_{p,q} = {Re b > −p, Re(c − b) > p − q} × {1 − z ∈ slitPlane}`, by induction, since each
    step only reads `S_{p,q}`
    at parameters that lie in the region of the previous step;
  - `S_{p,q} = E` on the region of Euler's integral, because `E` satisfies the shift relations
    there (proved on the disk from the series, 1.1, and extended by the identity theorem);
  - compatibility: `S_{p,q} = S_{p′,q′}` on `R_{p,q} ∩ R_{p′,q′}`, by the identity theorem in `c`
    and then in `b` on the convex slices of the intersection, from their agreement with `E`;
- **existence** (`exists_isEulerContinuation`): the sets `R_{p,q}` cover `ℂ³ × {1 − z ∈ slitPlane}`
  and are open, so by compatibility `G = S_{p,q}` on `R_{p,q}` is well defined. Near every point it
  equals one `S_{p,q}` with fixed counts on a neighbourhood, so it is holomorphic in `(a, b, c, z)`
  and in particular entire in `b` and in `c`. The counts `⌈1 − Re b⌉₊` and `⌈1 + p − Re(c − b)⌉₊`
  are not locally constant, which is why the fixed-count functions and their compatibility are
  separate targets. Then `regularizedGaussHypergeometric = S_{p,q}` on `R_{p,q}`, by uniqueness;
- `regularizedGaussHypergeometric a b c z = E(a, b, c, z)` for `0 < Re b < Re c` and
  `1 − z ∈ slitPlane` (15.6.1, `regularizedGaussHypergeometric_eq_eulerIntegral`), and
  `regularizedGaussHypergeometric a b c z = 0` when `1 − z ∉ slitPlane`.

**Checks.**
- `𝐅(0.3, 0.7; −1; 0.4) = 0.10640 71000 2…` by 15.2.3_5, while
  `gaussHypergeometric 0.3 0.7 (−1) 0.4 = 0`. This excludes defining `𝐅` as `F/Γ(c)` with Lean's
  junk values at the poles of `Γ`.
- `𝐅(1, −½; −½; ½) = (1 − ½)⁻¹/Γ(−½) = −0.56418 95835 4…` (15.4.6), while
  `eulerIntegral 1 (−½) (−½) ½ = 0`, since its prefactor is `(Γ(−½) Γ(0))⁻¹`. This excludes
  reading Euler's integral outside `0 < Re b < Re c` as `𝐅`.
- `F(0.3, 0.7; 1.9; 2 − i) = 1.03476 57242 8… − 0.30761 56787 97… i`, the conjugate of the value
  at `2 + i` (Layer 1 Examples). This excludes a branch continued across the cut `[1, ∞)` from
  the upper half-plane.

*Needs:* 1.1; Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
`DifferentiableOn.analyticOnNhd`.

### 1.3 The series and the polynomial cases

- 15.2.2 (`regularizedGaussHypergeometric_eq_regularizedGaussHGFun`; Olver Ch. 5 §9.1, p. 159;
  Duverney (4.6)–(4.7), p. 106):
  `regularizedGaussHypergeometric a b c z = regularizedGaussHGFun a b c z` for every `a`, `b`, `c`
  and `‖z‖ < 1`; 15.2.1 (`gaussHypergeometric_eq_ordinaryHypergeometric`):
  `gaussHypergeometric a b c z = ₂F₁ a b c z` for `c ∉ {0, −1, −2, …}` and `‖z‖ < 1`, with the Gamma
  form on the right of 15.2.1 for `a, b ∉ {0, −1, −2, …}`;
- 15.2.3_5 (`regularizedGaussHypergeometric_neg_nat`; Olver Ch. 5 §9.1, p. 159; Duverney (4.8),
  p. 106): for every `a`, `b`, `n : ℕ` and `1 − z ∈ slitPlane`,
  `𝐅(a, b; −n; z) = ((a)_{n+1} (b)_{n+1}/(n + 1)!) z^{n+1} F(a + n + 1, b + n + 1; n + 2; z)`,
  and `F(a, b; c; z)/Γ(c) → 𝐅(a, b; −n; z)` as `c → −n`;
- 15.2.4 (Temme §5.1, p. 108): for `m : ℕ`, `F(−m, b; c; z) = ∑_{n≤m} (−1)ⁿ C(m, n) (b)ₙ/(c)ₙ zⁿ`
  for `c ∉ {0, −1, −2, …}` and every `z` in the cut plane, and `₂F₁ (−m) b c z` is this polynomial
  for every `z`;
- 15.2.5 (Temme Remark 5.1, p. 109): for `m, ℓ : ℕ`, Mathlib's `₂F₁ (−m) b (−m − ℓ) z` is the
  iterated limit of 15.2.5, the inner limit `a → −m` being `₂F₁ (−m) b c z` for
  `c ∉ {0, −1, −2, …}`; so 15.2.4 holds at `c = −m − ℓ` with the interpretation 15.2.5;
- 15.2.6: for `m, ℓ : ℕ`, `a ↦ gaussHypergeometric a b (a − ℓ) z` has a limit as `a → −m`, for
  every `b` and `1 − z ∈ slitPlane`; the limit is not `₂F₁ (−m) b (−m − ℓ) z` in general (see the
  check in 4.1).

**Checks.**
- `𝐅(0.3, 0.7; −2; 0.4) = 0.14562 15017 79…` by 15.2.3_5, and `F(0.3, 0.7; c; 0.4)/Γ(c)` at
  `c = −2 + 10⁻¹²` agrees to ten digits.

*Needs:* 1.1–1.2; Mathlib `Complex.ordinaryHypergeometric_div_Gamma_eq`,
`ordinaryHypergeometric_radius_top_of_neg_nat₁`.

### 1.4 Holomorphy, symmetry and the identity principle

The analytic properties of the principal branch (Lebedev §9.4, pp. 245–246; Olver Ch. 5
Theorem 9.1, p. 160; Temme §5.1, p. 108; DLMF §15.2(ii)):
- `(a, b, c, z) ↦ 𝐅(a, b; c; z)` is holomorphic on `ℂ × ℂ × ℂ × {1 − z ∈ slitPlane}`
  (`differentiableOn_regularizedGaussHypergeometric`); in particular it is entire in each
  parameter and holomorphic in `z` on the cut plane;
- `F = Γ(c) 𝐅` is holomorphic in `(a, b, c, z)` on `{c ∉ {0, −1, −2, …}}` times the cut plane,
  and as a function of `c` has at most simple poles at `c ∈ {0, −1, −2, …}`;
- symmetry `𝐅(a, b; c; z) = 𝐅(b, a; c; z)` (`regularizedGaussHypergeometric_comm`; Lebedev (9.2.1),
  p. 241), the value `𝐅(a, b; c; 0) = Γ(c)⁻¹`, and `𝐅(ā, b̄; c̄; z̄) = conj 𝐅(a, b; c; z)`
  (`regularizedGaussHypergeometric_conj`), so that `𝐅` is real for real parameters and real `z < 1`;
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

## Layer 2: differentiation and three-term relations

### 2.1 Derivatives in the argument

DLMF 15.5.1–15.5.10 (Lebedev (9.2.2)–(9.2.3), p. 241; Olver Ch. 5 Exercise 9.3, p. 162; Temme
Exercise 5.1, p. 128; the first-order cases in Andrews–Askey–Roy (2.5.5)–(2.5.10), pp. 96–97)
on the cut plane, with `(z d/dz z)ⁿ` and `((1 − z) d/dz (1 − z))ⁿ` written
as iterates of the operators `w ↦ z (d/dz)(z w)` and `w ↦ (1 − z)(d/dz)((1 − z) w)`:
- 15.5.1–15.5.2 for `F` with `c ∉ {0, −1, −2, …}`, and in regularized form
  `(dⁿ/dzⁿ) 𝐅(a, b; c; z) = (a)ₙ (b)ₙ 𝐅(a + n, b + n; c + n; z)` for all parameters
  (`hasDerivAt_regularizedGaussHypergeometric` at `n = 1`);
- 15.5.3–15.5.9 as printed, with the powers `z^{a−1}`, `z^{c−1}`, `z^{c−a−1}` taken on
  `z ∈ slitPlane` and `(1 − z)^{…}` on the cut plane, and in regularized form where `c − n` is a
  nonpositive integer;
- the operator identity 15.5.10 for functions holomorphic on an open set.

*Needs:* Layer 1.

### 2.2 Gauss's three-term relations

Gauss's contiguous relations, DLMF 15.5.11–15.5.21 including 15.5.16_5 (Andrews–Askey–Roy §2.5,
pp. 94–97; Lebedev (9.2.4)–(9.2.15), pp. 242–243; Temme §5.7, pp. 121–122; Beals–Wong
(8.5.1)–(8.5.10), pp. 277–278; Duverney (4.19)–(4.23), pp. 108–109), on the cut plane, for `F` with
the third parameters outside `{0, −1, −2, …}`, and each also in the regularized form, which holds
for all parameters (for 15.5.11, `regularizedGaussHypergeometric_contiguous_15_5_11`). Also, the
reduction of integer shifts, with cleared denominators: for integers `k`, `ℓ`, `m` there are
polynomials `A`, `B`, `D` in `(a, b, c, z)` with `D` not identically zero such that

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
- 15.5.18 in regularized form, for all parameters (Olver Ch. 5 Exercise 9.4, p. 162; the form
  with `F` is used in Whittaker–Watson §14.11, p. 282):

```text
(z − 1) 𝐅(a, b; c − 1; z) + (c − 1 − (2c − a − b − 1) z) 𝐅(a, b; c; z)
    + (c − a)(c − b) z 𝐅(a, b; c + 1; z) = 0.
```

  At `c = 1` its first term is `(z − 1) a b z F(a + 1, b + 1; 2; z)` by 15.2.3_5, not `0`; at
  `(a, b, z) = (0.3, 0.7, 0.4)` the three terms are `−0.08819 16794 6…`, `0` and
  `0.08819 16794 6…`.

### Dependencies

Layer 1.

## Layer 3: the differential equation, Wronskians and local solutions

### 3.1 The equation and Abel's identity

- 15.10.1 (`regularizedGaussHypergeometric_hypergeometricEquation`; Andrews–Askey–Roy (2.3.5),
  p. 75; Lebedev (9.2.16), p. 243; Olver Ch. 5 (8.01), p. 156; Temme (5.8), p. 112;
  Whittaker–Watson §14.2, p. 283): `𝐅(a, b; c; ·)` solves the hypergeometric equation on the cut
  plane for all parameters, and so does `F` for
  `c ∉ {0, −1, −2, …}`;
- Abel's identity (Olver Ch. 5 (1.10), p. 142; Andrews–Askey–Roy Lemma 3.2.6, p. 136): for
  solutions `f`, `g` of 15.10.1 on a connected open set `U` avoiding `0` and
  `1`, `𝒲{f, g}′ = −((c − (a + b + 1)z)/(z(1 − z))) 𝒲{f, g}`; hence on a connected open
  `U ⊆ slitPlane ∩ {1 − z ∈ slitPlane}` the Wronskian is a constant multiple of
  `z^{−c} (1 − z)^{c−a−b−1}`;
- the span criterion (on an interval, Olver Ch. 5 Theorem 1.2, pp. 141–142): if `f₁`, `f₂` solve
  15.10.1 on a connected open `U` and `𝒲{f₁, f₂}` has no zero on `U`, every solution on `U` is
  `α f₁ + β f₂` with constants `α`, `β` (by Abel's identity, `𝒲{w, f₂}/𝒲{f₁, f₂}` and
  `𝒲{f₁, w}/𝒲{f₁, f₂}` are constant, and a solution whose Wronskians with `f₁` and `f₂` vanish is
  `0`).

*Needs:* Layers 1–2; Mathlib `IsOpen.is_const_of_deriv_eq_zero`.

### 3.2 Solution pairs at the three singular points

DLMF 15.10.2–15.10.7 (Andrews–Askey–Roy §2.3, p. 77; Lebedev (9.5.5), p. 248; Temme §5.4, p. 115;
Beals–Wong (8.2.6)–(8.2.8), pp. 268–269) on `U₀ = slitPlane ∩ {1 − z ∈ slitPlane}` (for the pairs at
`0` and at `1`) and on `U∞ = {z | z − 1 ∈ slitPlane} = ℂ \ (−∞, 1]` (for the pair at `∞`, with
`z^{−a}`, `z^{−b}` and `(z − 1)^{c−a−b−1}` principal as printed):
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
(`wronskian_regularizedGaussHypergeometric_zero`; compare Olver Ch. 5 §10.1, p. 163).

*Needs:* 3.1.

### 3.3 Logarithmic cases

DLMF 15.10.8–15.10.10 and the rules (a)–(e) after them (for `c = n`, Andrews–Askey–Roy (2.3.18),
p. 84, and Beals–Wong §8.4, pp. 274–276; for `c = 1`, Temme §5.4, p. 115). 15.10.8 and 15.10.9
contain power series of radius `1`, which diverge elsewhere: in 15.10.8 at `n = 1`, `a = b = 2` the
series term is `2(k + 1) zᵏ`, which does not tend to `0` at `z = 2i ∈ U₀`, and Lean's `tsum` of a
divergent series is not a continuation. So the targets are local, with a separate continuation:
- for `c = n ∈ {1, 2, …}`, the functions 15.10.8 and 15.10.9 solve 15.10.1 on
  `U₀ ∩ {‖z‖ < 1}` under the hypotheses printed with them (for 15.10.8,
  `hypergeometricEquation_log_solution_15_10_8`), and 15.10.10, whose sums are finite, on all of
  `U₀`; with `F(a, b; n; z)` each forms a fundamental pair there, with Wronskian
  `z^{−n} (1 − z)^{n−a−b−1}` times a nonzero constant computed here; the case (a) holds with the
  interpretation 15.2.5;
- the continuation to `U₀` (the limit `c → n` of Andrews–Askey–Roy, p. 83, and Beals–Wong
  (8.4.4), p. 275): with the regularized pair `f₁ = 𝐅(a, b; c; ·)`,
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

### 3.4 The Papperitz equation, Möbius maps and exponent shifts

- 15.11.1 (Whittaker–Watson §10.7, p. 206; Olver Ch. 5 Theorem 8.1 and (8.04), pp. 156–157; Temme
  Theorem 5.1, p. 116; Andrews–Askey–Roy Theorem 2.3.1, p. 74) with the condition 15.11.2 for
  distinct finite `α`, `β`, `γ`, on an open set avoiding them, and its form with `γ = ∞` (obtained
  as the limit of the coefficients), which at `(α, β) = (0, 1)` with exponents `{0, 1 − c}`,
  `{0, c − a − b}`, `{a, b}` is 15.10.1 (15.11.4);
- the P-symbol 15.11.3 is the solution set; it is not given a Lean definition, and 15.11.6–15.11.8
  are stated for solutions:
  - 15.11.6 (Whittaker–Watson §10.71, p. 207; Andrews–Askey–Roy (2.3.6)–(2.3.10), pp. 75–76):
    under a Möbius map `t = (κz + λ)/(μz + ν)` with `κν − λμ = 1`, `w` solves Riemann's
    equation with singular points `α, β, γ` in `z` if and only if `w ∘ (inverse map)` solves it
    with singular points the images, and the same exponents, in `t`;
  - 15.11.7 (Whittaker–Watson §10.72, p. 208; Temme, pp. 116–117): on an open set where
    `(z − α)/(z − γ)`, `(z − β)/(z − γ)` lie in `slitPlane`, `w` solves Riemann's equation if and
    only if `((z − α)/(z − γ))^{−a₁} ((z − β)/(z − γ))^{−b₁} w(z)` is `u(ζ)` with `u` a solution of
    15.10.1 with `a = a₁ + b₁ + c₁`, `b = a₁ + b₁ + c₂`, `c = 1 + a₁ − a₂` and
    `ζ = (z − α)(β − γ)/((z − γ)(β − α))`; the direction from `u` to `w` is
    `riemannEquation_of_hypergeometricEquation`;
  - 15.11.8 (Whittaker–Watson §10.71, p. 207; Temme §5.5, p. 118): on
    `slitPlane ∩ {1 − z ∈ slitPlane}`, multiplication by `z^λ (1 − z)^μ` maps the solutions with
    exponents `{a₁, a₂}, {b₁, b₂}, {c₁, c₂}` at `0, 1, ∞` onto those with exponents
    `{a₁ + λ, a₂ + λ}, {b₁ + μ, b₂ + μ}, {c₁ − λ − μ, c₂ − λ − μ}`.

*Needs:* 3.1.

### Examples

- `𝒲{f₁, f₂}` of 15.10.2 at `(a, b, c, z) = (0.3, 0.7, 1.9, 0.4)` equals
  `(1 − c) z^{−c} (1 − z)^{c−a−b−1}`.
- At `c = 1` the pair 15.10.2 degenerates (`f₂ = f₁`), and 15.10.8 at `n = 1` supplies the
  second solution.

### Dependencies

Layers 1–2.

## Layer 4: elementary reductions and the series at z = 1

### 4.1 Elementary closed forms

DLMF 15.4.1–15.4.19 as identities of principal branches. On the unit disk they are classical
(Andrews–Askey–Roy §2.1, p. 64; Lebedev §9.8, pp. 258–259; Olver Ch. 5 Exercise 9.1, p. 161; Temme
Example 5.1, p. 109, and Exercise 5.4, p. 129; Beals–Wong (8.1.6)–(8.1.7), pp. 266–267, and
(8.7.5)–(8.7.11), pp. 284–285; Duverney (4.12)–(4.15), p. 107). Each is proved on a neighbourhood of
`0` from the series and extended by 1.4. The domain is attached to the hypergeometric argument `w`,
not to the auxiliary variable: the identity holds where `1 − w ∈ slitPlane` and the elementary side
is holomorphic, which gives the following.
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

- 15.4.20 (Gauss; Andrews–Askey–Roy Theorem 2.2.2, p. 66; Whittaker–Watson §14.11, pp. 281–282;
  Lebedev (9.3.4), p. 244; Olver Ch. 5 (9.10), p. 161; Temme (5.6), p. 111; Beals–Wong (8.3.4),
  p. 272; Duverney (4.49)–(4.50), p. 120): for `Re(c − a − b) > 0` and `c ∉ {0, −1, −2, …}`, the
  series converges absolutely at `z = 1`, `₂F₁ a b c 1 = Γ(c) Γ(c − a − b)/(Γ(c − a) Γ(c − b))`
  (`ordinaryHypergeometric_one`), and `gaussHypergeometric a b c z` tends to this value as `z → 1`
  in the cut plane (`tendsto_gaussHypergeometric_one`); in regularized form, Mathlib's series
  satisfies `regularizedGaussHGFun a b c 1 = Γ(c − a − b)/(Γ(c − a) Γ(c − b))` for every `c` with
  `Re(c − a − b) > 0`, and `regularizedGaussHypergeometric a b c z` tends to this value as `z → 1`
  in the cut plane. The continued function itself is not evaluated at `z = 1`, where its value is
  the junk `0`;
- 15.4.24 (Chu–Vandermonde, `ordinaryHypergeometric_neg_nat_one`; Andrews–Askey–Roy Corollary 2.2.3,
  p. 67; Beals–Wong (8.3.5), p. 272; Duverney (4.51), p. 120): `₂F₁ (−n) b c 1 = (c − b)ₙ/(c)ₙ` for
  `n : ℕ` and `c` with `(c)ₙ ≠ 0`;
- 15.4.25 (Dougall, `hasSum_dougall`; Andrews–Askey–Roy Theorem 2.8.2, p. 110): for
  `Re(c + d − a − b) > 1` and `a, b ∉ ℤ`, the bilateral series
  `∑_{n∈ℤ} Γ(a + n) Γ(b + n)/(Γ(c + n) Γ(d + n))` (reciprocal Gamma factors as pinned) is summable
  and equals `π²/(sin πa sin πb) · Γ(c + d − a − b − 1)/(Γ(c − a) Γ(d − a) Γ(c − b) Γ(d − b))`.

Gauss's sum is, as in Andrews–Askey–Roy, p. 66, and Olver Ch. 5 §9.5, p. 161, Euler's integral
at `z = 1` for `0 < Re b < Re c` and `Re(c − a − b) > 0`, which is a
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
  at `0`, vanishes on `Re w ≥ 0`. Its proof is the classical one (compare Carlson's theorem,
  Andrews–Askey–Roy Theorem 2.8.1, p. 110, by which they prove Dougall's sum): divide by `sin πw`,
  which is bounded below by `e^{π|Im w|}/C′` away from the integers; the quotient is entire,
  periodic and `o(1)` as `|Im w| → ∞`, hence `0` by Liouville's theorem.

The normalized difference is periodic, of type below `π` and zero at the integers, so it is `0`.

*Needs:* 4.1; Layer 1; ZerosOfLFunctions 1.3; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
`Complex.Gamma_mul_Gamma_one_sub`, `Differentiable.apply_eq_apply_of_bounded` (Liouville).

### 4.3 The circle of convergence

DLMF §15.2(i) (Andrews–Askey–Roy Theorem 2.1.2, p. 62; for absolute convergence also
Whittaker–Watson §2.38, pp. 24–25), for `a, b ∉ {0, −1, −2, …}` (otherwise the series terminates)
and `|z| = 1`: the series of `₂F₁ a b c z` (with `c ∉ {0, −1, −2, …}`) converges absolutely if
`Re(c − a − b) > 0`, converges for `z ≠ 1` but not absolutely if `−1 < Re(c − a − b) ≤ 0`, and
diverges if `Re(c − a − b) ≤ −1`. On `|z| = 1`, `z ≠ 1`, where the series converges, its sum is the
limit of `gaussHypergeometric a b c (r z)` as `r → 1−`, which is `gaussHypergeometric a b c z`
(Abel's theorem); at `z = 1` this is 4.2. The three cases are `summable_norm_gaussTerm_of_re_pos`,
`tendsto_sum_gaussTerm_of_re_nonpos` (with the sum) and
`not_tendsto_sum_gaussTerm_of_re_le_neg_one`, with the terms written out.

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

Layers 1–2; ZerosOfLFunctions 1.3.

## Layer 5: Pfaff–Euler identities and the connection problem

### 5.1 Pfaff–Euler identities and the basic connection formulas

- 15.8.1 (Euler and Pfaff; `regularizedGaussHypergeometric_euler`,
  `regularizedGaussHypergeometric_pfaff`; Andrews–Askey–Roy Theorem 2.2.5, p. 68; Lebedev
  (9.5.1)–(9.5.3), pp. 247–248; Olver Ch. 5 (10.03) and (10.05)–(10.06), p. 164; Temme (5.5),
  p. 110; Beals–Wong (8.2.9)–(8.2.11), pp. 269–270; Duverney Theorem 4.8, p. 115) on the cut
  plane for all parameters; `z/(z − 1)` lies in
  the cut plane when `z` does;
- 15.8.4 (`regularizedGaussHypergeometric_connection_one`; Andrews–Askey–Roy Corollary 2.3.3,
  p. 79; Whittaker–Watson §14.53, pp. 290–291; Lebedev (9.5.7), p. 249; Olver Ch. 5
  (10.11)–(10.12), p. 166; Temme (5.10), p. 113; Beals–Wong (8.3.6), p. 272; Duverney
  Lemma 4.12, p. 123) on
  `slitPlane ∩ {1 − z ∈ slitPlane}`, for all parameters (the `sin` factor on the left
  makes both sides entire in the parameters);
- 15.8.2 (`regularizedGaussHypergeometric_connection_infty`; Andrews–Askey–Roy (2.3.12), p. 78;
  Whittaker–Watson §14.51, pp. 288–289; Lebedev (9.5.9), p. 249; Olver Ch. 5 (10.15)–(10.16),
  p. 167; Temme (5.11), p. 113) and 15.8.3 (Lebedev (9.5.8), p. 249; Temme (5.12), p. 113) on
  `−z ∈ slitPlane`, and 15.8.5 (Lebedev (9.5.10), p. 250; Temme (5.13), p. 113) on
  `slitPlane ∩ {1 − z ∈ slitPlane}`, for all parameters;
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

### 5.2 Logarithmic connection formulas

- 15.8.6–15.8.7 for `m : ℕ`, with `₂F₁` for the terminating functions and the proviso `m ≤ ℓ` if
  `b = −ℓ`;
- 15.8.8–15.8.9 (`b − a = m ∈ ℕ`; Lebedev (9.7.7), p. 257) and 15.8.10–15.8.11 (`c − a − b = m ∈ ℕ`;
  Lebedev (9.7.5), p. 257; at `m = 0` Temme (5.14), p. 114, and Duverney Lemma 4.13, p. 123) on the
  regions printed with them, with `ψ(x)/Γ(x)` written as pinned; the finite sums are over
  `Finset.range m`, empty at `m = 0`; the case `b − a ∈ −ℕ` by interchanging `a` and `b`. 15.8.10
  (`regularizedGaussHypergeometric_log_15_8_10`) is stated for `a, b ∉ {0, −1, −2, …}`, where its
  digamma terms are finite. At `a = −n` with `n ≥ m` every term of its right side carries `1/Γ(a)`
  or `1/Γ(a + m)`, so the Lean right side is `0`, while `𝐅(0, b; b; z) = 1/Γ(b)` at `n = m = 0`;
  DLMF sends these cases to 15.8.7;
- 15.8.12 on the cut plane, for all parameters.

The logarithmic cases are the limits of 15.8.2 and 15.8.4 as `b − a`, respectively `c − a − b`,
tends to `m`, computed with the derivative of `1/Γ`.

*Needs:* 5.1; Mathlib `Complex.digamma`.

### 5.3 Kummer's solutions in six groups of four

Kummer's 24 solutions (Whittaker–Watson §§14.3–14.4, pp. 283–286; Temme §5.4, p. 115; Beals–Wong
§8.2, p. 270; Duverney §4.3, pp. 109–115), in the form of DLMF 15.10.11–15.10.16: each of
`w₁, …, w₆` is given by four expressions, and these agree on the following domains, with principal
powers:
- `w₁`–`w₄`: on `slitPlane ∩ {1 − z ∈ slitPlane}`, where all the arguments `z`, `1 − z`,
  `z/(z − 1)` and `1 − 1/z` of the expressions lie in their cut planes;
- `w₅`, `w₆`: on `Im z > 0` as printed, and on `Im z < 0` with `i` replaced by `−i` in every
  factor `e^{(·)πi}`. The four printed expressions of `w₅` (and of `w₆`) do not agree on all of
  `−z ∈ slitPlane`: at `(a, b, c) = (0.3, 0.7 + 0.2i, 1.9)` and `z = 2 − i` the first and third
  expressions of `w₅` differ by `1.16…` in modulus. On `−z ∈ slitPlane`, `e^{aπi} z^{−a}` and
  `e^{−aπi} z^{−a}` are `(−z)^{−a}` on `Im z > 0` and `Im z < 0` respectively, so the first
  expression of `w₅` is `(−z)^{−a} F(a, a − c + 1; a − b + 1; 1/z)` on both half-planes.

Each `wⱼ` solves 15.10.1 on its domain, by Layer 3 and 15.8.1. The four expressions of `w₅` on
`Im z > 0` are `gaussHypergeometric_kummer_w5_of_im_pos`.

*Needs:* 5.1; Layer 3.

### 5.4 The twenty relations between Kummer's solutions

DLMF 15.10.17–15.10.36 (compare Whittaker–Watson §14.4, pp. 285–286; Andrews–Askey–Roy
Theorem 2.3.2 and Corollary 2.3.3, pp. 78–79; Olver Ch. 5 (10.13), p. 166), the twenty
connection formulas between the principal branches of
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

### 5.5 Limits at unit argument

DLMF 15.4.21–15.4.23 (Andrews–Askey–Roy Theorem 2.1.3, p. 63; Duverney Theorem 4.11,
pp. 122–123): the limits as `z → 1−` for `c = a + b`, for `Re(c − a − b) = 0` with
`c ≠ a + b`, and for `Re(c − a − b) < 0`, with DLMF's right-hand sides and with the third
parameter outside `{0, −1, −2, …}` (`tendsto_gaussHypergeometric_div_neg_log`,
`tendsto_cpow_mul_gaussHypergeometric_sub`, `tendsto_gaussHypergeometric_div_cpow_one_sub`).
The routes of 15.4.21 and 15.4.22 are those of DLMF's notes to §15.4(ii). For 15.4.23 the Euler
transformation replaces the note's 15.8.4:
- 15.4.21 is the leading term of 15.8.10 at `m = 0` (5.2), `−log(1 − z)/(Γ(a) Γ(b))`, multiplied
  by `Γ(a + b)`, for `a, b ∉ {0, −1, −2, …}`; otherwise `F` is a polynomial and both sides are `0`;
- 15.4.22 follows from 15.8.4 (5.1), where `c − a − b ∉ ℤ`, and the reflection formula: the
  coefficient of `(1 − z)^{c−a−b}` is `Γ(c) Γ(a + b − c)/(Γ(a) Γ(b))`, and the other term differs
  from its value at `z = 1` by `O(|1 − z|)`;
- 15.4.23 follows from the Euler transformation 15.8.1 (5.1) and 15.4.20 for
  `F(c − a, c − b; c; ·)`, whose parameter excess is `Re(a + b − c) > 0`. This route also covers
  integer `c − a − b < 0`, where the `sin` factor of 15.8.4 vanishes.

5.1 and 5.2 use only 15.4.20 from 4.2, so there is no cycle.

*Needs:* 4.2 (15.4.20), 5.1, 5.2; Mathlib `Complex.Gamma_mul_Gamma_one_sub`.

### Examples

- 15.8.4 at `c = a + b + m`, `m = 0`: the left side vanishes, and 15.8.10 at `m = 0` gives the
  logarithmic form.
- 15.8.2 at `(a, b, c, z) = (0.3, 0.7 + 0.2i, 1.9, 2 − i)` with `(−z)^{−a}`, `(−z)^{−b}`.

### Dependencies

Layers 1–4.

## Layer 6: Euler, loop and Mellin–Barnes integrals

### 6.1 Integrals over `[0, 1]` and `[0, ∞)`

- 15.6.1 is 1.2;
- 15.6.2_5: for `0 < Re b < Re c` and `1 − z ∈ slitPlane`, the half-line integral as printed, from
  15.6.1 by `t ↦ t/(t + 1)`;
- 15.6.8 and 15.6.9 (Andrews–Askey–Roy Theorem 2.2.4, p. 68, and Theorem 2.9.1, p. 113; the
  latter for every `λ ∈ ℂ`) for `0 < Re d < Re c` and
  `1 − z ∈ slitPlane`, with all functions in the integrands principal
  (`regularizedGaussHypergeometric_eq_integral_15_6_8`,
  `regularizedGaussHypergeometric_eq_integral_15_6_9`). For `t ∈ [0, 1)` the arguments `zt` and
  `(1 − t)z/(1 − zt)` lie in the cut plane when `z` does.

*Needs:* Layers 1, 5.

### 6.2 Loop integrals

15.6.2–15.6.5 (for 15.6.2 Temme §5.2.2, p. 111; for the Pochhammer contour of 15.6.5 Olver
Ch. 5 Exercise 9.5, p. 162, and Whittaker–Watson §§12.43 and 14.61, pp. 256 and 293) with the
contours and branches DLMF fixes after 15.6.9, written as explicit pieces
(segments along the real axis on both sides and small circles, for the loops `(1+)`, `(0+)`
around the endpoints; for 15.6.5 the Pochhammer contour `(0+, 1+, 0−, 1−)` from a point
`A ∈ (0, 1)`), with the stated hypotheses. Independence of the radii and of the point `A` is part
of each target. Each is proved by collapsing the loop onto the segment under the hypothesis of
15.6.1, which gives 15.6.1 times the factor `(1 − e^{2πi(·)})`, and then by holomorphy in the
parameters.

*Needs:* 6.1; Mathlib Cauchy integral theorem.

### 6.3 Mellin–Barnes integrals

15.6.6 on `−z ∈ slitPlane` (`regularizedGaussHypergeometric_eq_mellinBarnes`; Barnes's integral,
Andrews–Askey–Roy Theorem 2.4.1, p. 86; Whittaker–Watson §14.5, pp. 286–288; Temme (5.24),
p. 119) and 15.6.7 on `1 − z ∈ slitPlane` (Whittaker–Watson §14.53, pp. 290–291), with the
hypotheses printed. Every contour is a vertical line `Re t = σ`
followed by finitely many residues, and no contour is closed at infinity: the supplier estimate
of ZerosOfLFunctions 1.3 is uniform only on compact intervals of real parts, which controls the
tails of a fixed line and the horizontal sides between two fixed lines, but not a vertical side
whose real part tends to infinity. The targets and their route:
- **the Mellin–Barnes integral of `(1 + u)^{−a}`** (Andrews–Askey–Roy (2.4.3), p. 85;
  Whittaker–Watson §14.51, Corollary, p. 289): for `0 < σ′ < Re a` and `u > 0`,
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
- **Barnes's first lemma** (DLMF 5.13.3, `integral_Gamma_mul_Gamma_mul_Gamma_mul_Gamma`;
  Andrews–Askey–Roy Theorem 2.4.2, p. 89; Whittaker–Watson §14.52, pp. 289–290): for
  positive real parts, `(1/2π) ∫ Γ(a + iy) Γ(b + iy) Γ(c − iy) Γ(d − iy) dy` equals
  `Γ(a + c) Γ(a + d) Γ(b + c) Γ(b + d)/Γ(a + b + c + d)`,
  proved by inserting the Mellin–Barnes integral of `(1 + u)^{−(b + d)}` into a Beta integral and
  using Fubini;
- **15.6.7** (`regularizedGaussHypergeometric_eq_mellinBarnes_one_sub`, on a line `Re t = σ` with
  `max(−Re a, −Re b) < σ < min(0, Re(c − a − b))`, which separates the two families of poles)
  for `|z| < 1` and the line conditions printed: expand `(1 − z)^t` by the binomial
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

## Layer 7: transformations of degree two

### 7.1 The degree-two identities

DLMF 15.8.13–15.8.28 (Andrews–Askey–Roy §3.1, pp. 125–131, with 15.8.13 displayed on p. 130;
Lebedev §9.6, pp. 250–255; Temme §5.8, pp. 122–124, and Exercises 5.7–5.9, pp. 130–131;
Beals–Wong §8.6, pp. 278–282) with the regions printed with them, all functions principal, and the
hypotheses that the third parameters of every `F` are outside `{0, −1, −2, …}`. Table 15.8.1 is
not a target; the necessity of its conditions is not claimed. Each transformation is proved on a
neighbourhood of `0` (or of the point where both arguments vanish) by showing that both sides
solve the same hypergeometric equation and agree to first order there (the method of Lebedev,
pp. 250–251, and Temme, pp. 122–123), using 3.1, and extended to
the printed region by 1.4; 15.8.24–15.8.28 follow from 15.8.13–15.8.21 and the connection
formulas of Layer 5. The Lean file states 15.8.13 as `gaussHypergeometric_quadratic_15_8_13`.

*Needs:* Layers 1–5.

### 7.2 Special quadratic transformations

DLMF 15.8.29–15.8.30, on the intersections of the regions of the transformations they compose.

*Needs:* 7.1.

### 7.3 Special values from quadratic transformations

DLMF 15.4.26–15.4.30:
- 15.4.26 (Kummer, `gaussHypergeometric_neg_one`; Andrews–Askey–Roy Corollary 3.1.2, p. 126; Temme
  Exercise 5.5, p. 129; Duverney (4.57), p. 122) from 15.8.16 as `z → −1` along `(−1, 0)`, where its
  argument tends to `1`, with 4.2 and the duplication formula;
- 15.4.27 with Mathlib's `Complex.digamma`;
- 15.4.28–15.4.29 (Gauss's second theorem; 15.4.28 is `gaussHypergeometric_half`, Duverney
  (4.58), p. 122) from 15.8.18 as
  `z → ½` along `(0, ½)`;
- 15.4.30 (Bailey; Duverney (4.52), p. 121) from 15.8.20 as `z → ½` likewise.

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

## Layer 8: transformations of degree three

### 8.1 The degree-three identities

- 15.8.31 for `Re z < 8/9` (`gaussHypergeometric_cubic_15_8_31`);
- 15.8.32 for `|z| > 1` and `|ph(−z)| < π/3`, with `ζ` as printed and all powers principal;
- 15.8.33 (Ramanujan, `gaussHypergeometric_ramanujan`) for `z` in the intersection of the disks
  `|z − ¼ ± (√3/4) i| < √3/2`, which is `|ph((1 − z)/(1 + 2z))| < π/3`;
- the cubic transformation behind 15.4.31, for which DLMF's note to 15.4.31 cites Erdélyi et al.
  (1953a, Eq. 2.11(41)), in the form (`gaussHypergeometric_cubic_three_halves`)

```text
F(a, a + ½; 3/2 − 2a; x) = (1 − x)^{1−4a} (1 − 9x)^{2a−2/3} F(⅓ − a, 5/6 − a; 3/2 − 2a; ψ(x)),
ψ(x) = −27x (1 − x)²/(1 − 9x)²,   1 − ψ(x) = (1 + 3x)³/(1 − 9x)²,
```

  for `3/2 − 2a ∉ {0, −1, −2, …}` and `x ≠ −1/3` with `1 − 9x ∈ slitPlane` and
  `|3 arg(1 + 3x) − 2 arg(1 − 9x)| < π`, all powers principal. That set is a lens with
  vertices `−1/3` and `1/9`, symmetric about the real axis, and `ψ(x)` stays off `[1, ∞)` on it;
  its real points are the interval `(−1/3, 1/9)`, and `ψ(x) → 1` as `x → −1/3`. The proof is
  that of the other cubic transformations: in `x = 1 − z`,
  `x^{½−2a} F(a, a + ½; 3/2 − 2a; x)` is the solution with exponent `½ − 2a` at `z = 1` of the
  equation of the left side of 15.8.31 with `a − ⅙` in place of `a`, and the cubic map of
  15.8.31 carries it to the solution with that exponent at `0` of the equation of
  `F(a − ⅙, a + ⅓; 2a + ½; ·)`. The two sides agree to first order at `x = 0`, and the identity
  extends over the lens by the identity theorem.

Each is proved like 7.1: both sides solve the same equation after the cubic change of variable,
they agree to first order at a common point, and the identity extends by 1.4; for 15.8.32 the
comparison is made in `u = 1/ζ` near `u = 0` and continued through the connection formulas of
Layer 5.

*Needs:* Layers 1–5.

### 8.2 Special values from cubic transformations

DLMF 15.4.31–15.4.34, with the interpretation 15.2.6 at the excluded values of `a` printed after
15.4.34, stated as the limit in `a`:
- 15.4.31 (`gaussHypergeometric_neg_one_third`) from the cubic transformation of 8.1 as
  `x → −1/3` along `(−1/3, 0)`: its argument `ψ(x)` tends to `1` from below, and
  `F(⅓ − a, 5/6 − a; 3/2 − 2a; ·)` has `Re(c − a − b) = ⅓ > 0`, so Gauss's sum 15.4.20 (4.2)
  applies; the duplication formula 5.5.5 for `Γ(⅔ − a) Γ(7/6 − a)` gives DLMF's form;
- 15.4.32 (Andrews–Askey–Roy (3.1.17), p. 131, with `2a` in place of their `a`) from 15.8.30
  at `z = ½` (7.2), where `(z/(2 − z))² = 1/9`, and 15.4.28 (7.3), with the
  duplication and triplication formulas 5.5.5 and 5.5.6;
- 15.4.33 as the limit `z → −∞` in 15.8.32, where `ζ⁻¹ → e^{iπ/3}`, the left side tends to
  `1/(Γ(a + ⅔) Γ(⅔))`, and 5.5.5 gives DLMF's form; `e^{iπ/3}` lies in the cut plane;
- 15.4.34 from the next term of the same expansion at `z = ∞`: both sides of 15.8.32, with
  `a − ⅓` in place of `a`, are holomorphic in `u = 1/z` at `u = 0`, and their coefficients of
  `u` give the derivative of `F(a, 3a − 1; 2a; ·)` at `e^{iπ/3}`. 15.4.33 at `a − ⅓` gives its
  value, and 15.5.3 at `n = 1` with `a` and `b` interchanged,
  `(z d/dz + b) F(a, b; c; z) = b F(a, b + 1; c; z)` (2.1), combines them into 15.4.34.

*Needs:* 8.1, 7.2–7.3; Layer 4.

### Examples

- 15.8.33 at `z = 0.3`: both sides of Ramanujan's transformation at the point and its image.
- 15.4.31 at `a = 0.2`: both sides are `0.96326 23832 8…`, and so is the right side of the cubic
  transformation of 8.1 at `x = −1/3`, with Gauss's sum in place of its `F`.
- 15.4.32 at `a = 0.2`: `F(0.2, 0.7; 29/30; 1/9) = 1.01709 43121…`, which is also
  `(3/4)^{0.4} F(0.4, 7/15; 14/15; ½)` (15.8.30 at `z = ½`).

### Dependencies

Layers 1–5, 7.

## Layer 9: polynomials, the Mellin transform, products and related integrals

### 9.1 Chebyshev and Legendre polynomials; `D(k)`

- 15.9.5–15.9.6 (Duverney (9.68), p. 297, and (9.73), p. 298):
  `(T ℂ n).eval x = ₂F₁ (−n) n (½) ((1 − x)/2)` and
  `(U ℂ n).eval x = (n + 1) ₂F₁ (−n) (n + 2) (3/2) ((1 − x)/2)` for `n : ℕ` and every `x : ℂ`, with
  Mathlib's `Polynomial.Chebyshev.T` and `U` (for `T`, `chebyshevT_eq_ordinaryHypergeometric`);
- 15.9.7 (Lebedev (9.8.10), p. 260; Duverney (9.56), p. 295): the Legendre polynomial `P_n(x)` is
  Mathlib's `Polynomial.shiftedLegendre n` evaluated at `(1 − x)/2`, with no further sign, and
  `(shiftedLegendre n).eval ((1 − x)/2) = ₂F₁ (−n) (n + 1) 1 ((1 − x)/2)` for `n : ℕ` and every `x`;
  at `n = 1` both sides are `x`. Coefficientwise, `(−n)ₖ (n + 1)ₖ/(k!)²` is Mathlib's
  `(−1)ᵏ C(n, k) C(n + k, n)` (`coeff_shiftedLegendre`), so the identity holds at every argument
  (`shiftedLegendre_eval_eq_ordinaryHypergeometric`);
- 15.9.26 (`legendreD_eq_ordinaryHypergeometric`): for real `k` with `0 < k² < 1`,
  `(legendreK k − legendreEc k)/k² = (π/4) ₂F₁ (½) (3/2) 2 k²`, with `D(k) = (K(k) − E(k))/k²`
  (DLMF 19.2.6), from 15.9.24–15.9.25 and the contiguous relations.

*Needs:* Layer 2; Mathlib Chebyshev and shifted Legendre polynomials; Tau Ceti elliptic
integrals.

### 9.2 Mellin transform and the expansion 15.15.1

- 15.14.1 (`integral_cpow_mul_regularizedGaussHypergeometric_neg`; Andrews–Askey–Roy (2.4.4),
  p. 86; Temme (5.25), p. 121): for
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

### 9.3 Products of two Gauss functions

DLMF 15.16.1–15.16.5:
- 15.16.1–15.16.2 (with `A_s` defined by the generating function 15.16.2) and 15.16.3 on the
  disks printed;
- 15.16.4 on the cut plane for `c ∉ ℤ` (`gaussHypergeometric_product_15_16_4`). As in DLMF's
  note, 15.8.2 and 15.8.4, combined with 15.8.1, show that the left side continues to an entire
  function of `z`, which is constant by Liouville's theorem; its value at `z = 0` is `1`;
- 15.16.5 (the generalized Legendre relation, Elliott's identity) on
  `slitPlane ∩ {1 − z ∈ slitPlane}`, for `1 + λ + μ, 1 + ν + μ ∉ {0, −1, −2, …}`, with right
  side `Γ(1 + λ + μ) Γ(1 + ν + μ)/(Γ(λ + μ + ν + 3/2) Γ(½ + μ))`
  (`gaussHypergeometric_legendreRelation`). DLMF prints `Γ(½ + ν)` in the last factor, which is
  a misprint: the left side does not depend on `z`, and at `(λ, μ, ν) = (0, 0.3, 0)` it is
  `0.74280 22469 7…`, the value with `Γ(½ + μ)`, against `0.48790 68907 2…` with `Γ(½ + ν)`. At
  `λ = μ = ν = 0` both read `2/π`, which is Legendre's relation 19.7.1 (Andrews–Askey–Roy
  Theorem 3.2.7, p. 137).

**Checks.**
- 15.16.4 at `(a, b, c, z) = (0.3, 0.45, 0.8, 0.35)`: the left side is `1` to working precision,
  and so it is at `z = 3 + 2i`, `−5` and `2 − i`, off the disk.
- 15.16.5 at `(λ, μ, ν) = (0.3, 0.2, 0.45)`: the left side is `0.47853 63147 7…` at every `z`
  tried, which is the corrected right side.

*Needs:* 1.4; Layers 1–5; Mathlib `Differentiable.apply_eq_apply_of_bounded`.

### 9.4 Integrals of incomplete functions with argument off the unit disk

SpecialFunctionsEiLiErfIncompleteGamma states 8.14.5–8.14.6, 8.17.9 and 8.19.25 where the
hypergeometric argument lies in the unit disk, with Mathlib's series. The targets here are the
same formulas with `gaussHypergeometric` on the rest of DLMF's range, where the argument lies in
the cut plane but not in the disk. The integrals converge absolutely.
- 8.14.5 leaves nothing here: for `Re s > 0`, `|1 + s| > 1`, so `1/(1 + s)` lies in the unit disk
  on all of DLMF's range, and SpecialFunctionsEiLiErfIncompleteGamma 3.4 owns it in full.
- 8.14.6 for `Re s > −1`, `Re a > 0` and `Re(a + b) > 0`
  (`integral_cpow_mul_exp_mul_upperIncompleteGamma`):
  `∫₀^∞ x^{a−1} e^{−sx} Γ(b, x) dx = Γ(a + b)/(a (1 + s)^{a+b}) F(1, a + b; 1 + a; s/(1 + s))`.
  For `Re s > −1`, `1 − s/(1 + s) = 1/(1 + s)` has positive real part, so the argument lies in
  the cut plane; it lies in the unit disk exactly when `Re s > −½`.
- 8.17.9 for `a, b > 0` and `0 ≤ x < 1` (`incompleteBeta_eq_gaussHypergeometric`; Temme
  Exercise 5.3, p. 128):
  `B_x(a, b) = x^a (1 − x)^{b−1}/a · F(1, 1 − b; a + 1; x/(x − 1))`. The argument lies in
  `(−∞, 0]`, and in the unit disk exactly when `x < ½`.
- 8.19.25 for `Re a > −1`, `Re b > 0` and `Re(p + b) > 1`
  (`integral_exp_mul_cpow_mul_expIntegralE_of_re_gt_neg_one`):
  `∫₀^∞ e^{−at} t^{b−1} E_p(t) dt = Γ(b) (1 + a)^{−b}/(p + b − 1) F(1, b; p + b; a/(1 + a))`, with
  the hypothesis `Re b > 0` of SpecialFunctionsEiLiErfIncompleteGamma 7.5, which DLMF omits. The
  argument `a/(1 + a)` is placed as in 8.14.6.

8.17.9 is 8.17.7 composed with the Pfaff transformation 15.8.1 (5.1), and
SpecialFunctionsEiLiErfIncompleteGamma 15.2 owns 8.17.7 for `0 ≤ x < 1`. For 8.14.6 and 8.19.25
both sides are holomorphic in `s`, respectively `a`, on the half-plane `Re > −1`. The left sides
are holomorphic by differentiation under the integral sign, since `Γ(b, x)` and `E_p(x)` decay
like `e^{−x}` times a power, and the right sides by 1.4. They agree where `Re > −½`, by
SpecialFunctionsEiLiErfIncompleteGamma 3.4 and 7.5 with 1.3, and the identity theorem gives the
rest. In `Suggested.lean` the integrands are written through
`Γ(b, x) = ∫_x^∞ u^{b−1} e^{−u} du` and `E_p(t) = ∫_1^∞ e^{−tu} u^{−p} du` for real `x, t > 0`, and
`B_x(a, b)` as its defining integral, which are SpecialFunctionsEiLiErfIncompleteGamma's
definitions or theorems there.

**Checks.**
- 8.14.6 at `(a, b, s) = (1.5, 0.5, −0.7)`, where `s/(1 + s) = −7/3`: both sides are
  `2.69597 75155 3…`.
- 8.17.9 at `(a, b, x) = (0.7, 1.6, 0.8)`, where `x/(x − 1) = −4`: both sides are
  `0.94456 69837 1…`.
- 8.19.25 at `(a, b, p) = (−0.7, 1, 2)`, where `a/(1 + a) = −7/3`: both sides are
  `1.02851 59271 9…`.

*Needs:* 1.3–1.4, 5.1; SpecialFunctionsEiLiErfIncompleteGamma 1.3, 3.4, 7.1, 7.5 and 15.2.

### Examples

- `D(1/√2) = 1.00686 15925 1…` from 15.9.26.
- 15.9.5 at `n = 2`: `₂F₁ (−2) 2 (½) ((1 − x)/2) = 2x² − 1`.

### Dependencies

Layers 1–6; Tau Ceti elliptic integrals; SpecialFunctionsEiLiErfIncompleteGamma.

## Downstream consumers

- A roadmap for the Legendre functions (DLMF Chapter 14), whose definitions 14.3.1–14.3.10 are
  continued Gauss functions, consumes Layers 1–7; DLMF 15.9.16–15.9.23 belong there.
- [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) 8.2 consumes 1.2–1.4 for
  10.22.49 on its full domain: its Gauss function on `ℂ \ [1, ∞)` is
  `𝐅((μ + ν)/2, (μ + ν + 1)/2; ν + 1; ·)` of this roadmap, holomorphic there by 1.4 and equal to
  Mathlib's series on the unit disk by 1.3, and it is the only such function because the cut
  plane is connected.
- SpecialFunctionsHypergeometricPartII consumes this roadmap, SpecialFunctionsConfluent and
  SpecialFunctionsBessel. It owns the formulas that those two roadmaps leave to a roadmap on the
  Gauss function, which relate `F` to their functions: DLMF 13.4.8, 13.4.12, 13.4.15, 13.10.3,
  13.10.7, 13.16.9 and 13.23.4, and the formulas through the Gauss function in
  SpecialFunctionsBessel's list of DLMF 10.16.6–10.43.26. The Chapter 8 formulas that
  SpecialFunctionsEiLiErfIncompleteGamma leaves to this roadmap are 9.4 here.
- A roadmap for the large-parameter asymptotics (DLMF §15.12) consumes Layers 1–6 with
  AsymptoticExpansions and SpecialFunctionsBessel.
- Roadmaps for the generalized hypergeometric functions (DLMF Chapter 16) and the orthogonal
  polynomials (DLMF Chapter 18) consume Layers 1–5.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of the classical theory of the Gauss
function, and the formulas relating it to the Bessel, confluent hypergeometric and other functions.
DLMF locators are given for orientation. It is recorded only to fix the boundary. Contributors
should not attempt it under this roadmap.

- **Continued fractions** (DLMF §15.7, 15.7.1–15.7.6). Their convergence rests on Pincherle's
  theorem for minimal solutions of three-term recurrences, which
  SpecialFunctionsEiLiErfIncompleteGamma 4.1 owns, and on the contiguous relations of Layer 2.
- **Orthogonal polynomials and functions of §15.9**: the Jacobi and Gegenbauer polynomials
  15.9.1–15.9.4 and the Krawtchouk, Meixner and Meixner–Pollaczek polynomials 15.9.8–15.9.10,
  for a future roadmap on the orthogonal polynomials of DLMF Chapter 18; the
  Jacobi function and transform 15.9.11–15.9.14, the Gegenbauer function 15.9.15, and the
  Legendre and Ferrers functions 15.9.16–15.9.23 (DLMF Chapter 14).
- **Large-parameter asymptotics** (DLMF §15.12): 15.12.1–15.12.13. They need the expansion API,
  Watson's lemma and the saddle-point method of
  [AsymptoticExpansions](../AsymptoticExpansions/README.md), and the Bessel-function
  approximations of §15.12(iii) need the SpecialFunctionsBessel roadmap.
- **Formulas of DLMF Chapters 10 and 13 through the continued function**, which belong to
  SpecialFunctionsHypergeometricPartII (see [Downstream consumers](#downstream-consumers)).
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

This roadmap specifies the mathematics intrinsically. `lean-DLMF`, which itself draws on DLMF and on
the books in the References, supplies prior proofs and implementation references; reused code
carries attribution under the repository's porting guidance. The source serves as a reference, not
as a specification. The following secondary provenance map records source counterparts; the
mathematical targets and dependencies are specified by the layers.

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

Each headline names the DLMF equations it restates, as the primary locator, and beside them the
statements in the books below, with printed page numbers. The organization of the roadmap is its
own; it follows none of these sources.

- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Encyclopedia of Mathematics and its
  Applications 71, Cambridge University Press, 1999: Chapter 2 (§§2.1–2.5, 2.8–2.9: the series,
  Euler's integral, the sums of Gauss, Chu–Vandermonde and Dougall, the equation and its
  connection formulas, Barnes's integral and first lemma, contiguous relations) and Chapter 3
  (§§3.1–3.2: quadratic transformations, Kummer's sum, Legendre's relation).
- R. Beals and R. Wong, *Special Functions: A Graduate Text*, Cambridge Studies in Advanced
  Mathematics 126, Cambridge University Press, 2010, Chapter 8 (§§8.1–8.7: solutions at the
  singular points, Kummer's solutions, the sums at `z = 1`, the logarithmic cases, contiguous
  relations, quadratic transformations, elementary cases).
- J. Dougall, On Vandermonde's theorem, and some more general expansions, *Proc. Edinburgh Math.
  Soc.* 25 (1907), 114–132.
- D. Duverney, *An Introduction to Hypergeometric Functions*, Birkhäuser, 2024, Chapter 4
  (the series, Euler's integral, contiguous relations, Kummer's solutions, Euler's transformation,
  the summation formulas and the behaviour at `z = 1`) and Chapter 9 (the Legendre and Chebyshev
  polynomials).
- A. Erdélyi, W. Magnus, F. Oberhettinger and F. G. Tricomi, *Higher Transcendental Functions*,
  Vol. I, McGraw-Hill, 1953, Chapter II.
- N. N. Lebedev, *Special Functions and Their Applications*, translated by R. A. Silverman,
  Prentice-Hall, 1965; reprinted Dover, Chapter 9 (§§9.1–9.8: Euler's integral and the
  continuation in the parameters, contiguous relations, Gauss's sum, the linear and quadratic
  transformations, the logarithmic cases, elementary functions and Legendre polynomials).
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 15
  (A. B. Olde Daalhuis), <https://dlmf.nist.gov/15>, the primary locator source; also the
  equations of Chapters 5, 8 and 19 cited in the layers. Every equation number refers to this
  release.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapter 5 (§1 for Wronskians and Abel's identity, §8 for the equation with
  three regular singularities, §§9–10 for the hypergeometric function, its integral and its
  connection formulas).
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapter 5 (§§5.1–5.8 with the exercises: the series, Euler's and the
  contour integral, Gauss's sum, the equation and Kummer's solutions, the Riemann–Papperitz
  equation, Barnes's integral, contiguous relations, quadratic transformations).
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927 (reissued 1996), Chapter II (§2.38), Chapter X (§§10.7–10.72: Riemann's equation),
  Chapter XII (§12.43: Pochhammer's contour) and Chapter XIV (§§14.1–14.61: the hypergeometric
  function).

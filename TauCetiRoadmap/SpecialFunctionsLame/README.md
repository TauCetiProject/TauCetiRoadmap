# Roadmap: Lamé functions

**Summary.** This roadmap builds the theory of Lamé's equation

```text
w″ + (h − ν(ν + 1) k² sn²(z, k)) w = 0,        0 < k < 1,
```

its periodic solutions, the Lamé polynomials of integer order, Hermite's solution for arbitrary `h`,
and the ellipsoidal harmonics built from Lamé polynomials. Its organization follows the structure of
the subject rather than any one text. The equation comes first in its four classical forms (Jacobi,
algebraic, Weierstrass, and Dassios's form in the ellipsoidal coordinate). For real `ν` it is a Hill
equation of period `2K`, and the spectral theory of Hill's equation, consumed from
SpecialFunctionsMathieu, gives the four families of eigenvalues `a^m_ν`, `b^m_ν` with their
interlacing, the Lamé functions `Ec^m_ν`, `Es^m_ν` with their normalization, orthogonality, zeros
and Fourier series, and the limits `k → 0` and `k → 1`. For integer `ν = n` the eight types of Lamé
polynomials have `2n + 1` real, simple, distinct eigenvalues, which are the finite tridiagonal
eigenproblems of the polynomial coefficients; their zeros obey Stieltjes' electrostatic equations.
Hermite's product of two solutions, a polynomial of degree `n` in `℘`, carries an invariant that is
a polynomial of degree `2n + 1` in the eigenvalue; its roots are the `2n + 1` polynomial
eigenvalues, and this is the finite-gap property: all but `n` instability intervals of the Lamé
equation close. The ellipsoidal harmonics, their orthogonality, and Whittaker's integral equation
close the roadmap. The content is drawn from Whittaker–Watson (Ch. XXIII), Dassios (*Ellipsoidal
Harmonics*, Chs. 1–5 and App. E), Ronveaux (*Heun's Differential Equations*, Part A),
Gesztesy–Holden (*Soliton Equations and Their Algebro-Geometric Solutions*, Vol. I, Ch. 1),
Kristensson (*Second Order Differential Equations*, §8.6.1) and the NIST *Digital Library of
Mathematical Functions* (DLMF), and each headline cites its sources; see [References](#references).

Neither Mathlib nor Tau Ceti has any of this theory. Mathlib has Weierstrass's `℘` and `℘′` for a
period pair with the differential equation `℘′² = 4℘³ − g₂℘ − g₃`, the shifted Legendre polynomials,
characteristic polynomials and the spectral theorem for Hermitian matrices. Tau Ceti has the real
Jacobi functions `TauCeti.Real.jacobiSn`, `jacobiCn`, `jacobiDn`, `jacobiAm` with their derivatives
and real periods, the complete elliptic integral `TauCeti.Real.legendreK`, Weierstrass's zeta
function, and the period pair `UpperHalfPlane.periodPair τ` with periods `τ` and `1`.

The roadmap covers:
- Lamé's equation in Jacobi, algebraic, Weierstrass and Dassios form, its periodicity and its
  normalization as a Hill equation of period `π` (Layer 1);
- the eigenvalues `a^m_ν`, `b^m_ν` for real `ν` and `0 < k < 1`: the four boundary problems on
  `[0, K]`, their identification with the periodic and antiperiodic eigenvalues of Hill's equation,
  and the strict interlacing (Layer 2);
- the Lamé functions `Ec^m_ν`, `Es^m_ν`: normalization, parity, period, zeros, orthogonality, the
  Fourier series in `φ = π/2 − am z` with its three-term recurrence and continued fraction, and the
  limits `k → 0` and `k → 1` (Layer 3);
- Lamé polynomials for integer `ν = n`: the eight types, the count `2n + 1`, reality, simplicity and
  distinctness of the eigenvalues, the tridiagonal matrices, the zeros and Stieltjes' theorem, the
  second solution, and the duality `k ↔ k′` (Layer 4);
- Hermite's solution for arbitrary `h` and integer `n`: the product equation, Hermite's polynomial,
  its invariant as a polynomial of degree `2n + 1` whose roots are the polynomial eigenvalues, the
  Hermite–Halphen form of the solutions, coexistence and the finite-gap property (Layer 5);
- ellipsoidal coordinates, ellipsoidal harmonics, their orthogonality, and the integral equations of
  Lamé functions (Layer 6).

The roadmap rests on Mathlib, Tau Ceti, the roadmaps
[EllipticIntegrals](../EllipticIntegrals/README.md),
[AsymptoticExpansions](../AsymptoticExpansions/README.md) and
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md) (the
recessive solution of a three-term recurrence and Pincherle's theorem, for the continued fraction),
[SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md) (Ferrers functions and spherical
harmonics, for the limits) and [ModularCurvesPartII](../ModularCurvesPartII/README.md) (the
Weierstrass sigma function, for the Hermite–Halphen form), and three further roadmaps:
SpecialFunctionsMathieu (Hill's equation), SpecialFunctionsHeun (the algebraic form, Heun
polynomials and their double orthogonality) and SpecialFunctionsJacobiElliptic (the Jacobi
functions of a complex variable and their relation to `℘`).

Suggested home: `TauCeti/Analysis/SpecialFunctions/Lame/`.

## How to read the build

Layer 1 sets up the equation. Its real form, with Tau Ceti's real `sn`, is a Hill equation of period
`2K`; the rescaling `x ↦ 2Kx/π` turns it into Hill's equation with a `π`-periodic coefficient, which
is the normalization SpecialFunctionsMathieu uses. The algebraic form is the case `γ = δ = ε = ½` of
Heun's equation and is consumed from SpecialFunctionsHeun; the Weierstrass form comes from the
relation between `sn` and `℘` in SpecialFunctionsJacobiElliptic; Dassios's form is the one that the
separation of Laplace's equation in ellipsoidal coordinates produces. Layer 2 defines the
eigenvalues by four boundary problems on `[0, K]` and reads their ordering off the interlacing
theorem for Hill's equation; nothing about Hill's equation is reproved. Layer 3 builds the Lamé
functions from Layer 2 and adds their Fourier series and the limits in `k`. Layer 4 specializes to
integer `ν`: a Lamé polynomial is a solution of the form `sn^s cn^c dn^d P(sn²)`, and its eigenvalue
is among the `a^m_n`, `b^m_n` of Layer 2. Layer 5 is the analysis that holds for every `h` when `ν`
is an integer: Hermite's product, its invariant, and the consequence that the instability intervals
of Lamé's equation with integer `ν` are exactly `n` (plus the half-line below `a⁰`). Layer 5 comes
after Layer 4 because the roots of the invariant are identified with the polynomial eigenvalues.
Layer 6 uses Layer 4 for ellipsoidal harmonics and the integral equations.

The harder material is in 4.1 (distinctness of the `2n + 1` eigenvalues across the eight types),
5.1–5.2 (the degree and the roots of Hermite's invariant) and 5.3 (coexistence for `m > n`).

## Conventions

- **Names.** Everything lives in the namespace TauCeti. Functions take their parameters first and
  their variable last:

```text
lamePotential ν k x                : ℝ → ℝ → ℝ → ℝ     Q(x) = −ν(ν + 1) k² sn²(x, k)
lameScale k                        : ℝ → ℝ             (2K/π)²
lameHillPotential ν k x            : ℝ → ℝ → ℝ → ℝ     (2K/π)² Q(2Kx/π)
lameA ν k j, lameB ν k j           : ℝ → ℝ → ℕ → ℝ     a^j_ν(k²), b^j_ν(k²)
lameEcRaw ν k j x, lameEsRaw ν k j x : ℝ → ℝ → ℕ → ℝ → ℝ  unnormalized eigenfunctions
lameEc ν k j x, lameEs ν k j x     : ℝ → ℝ → ℕ → ℝ → ℝ Ec^j_ν(x, k²), Es^j_ν(x, k²)
lameAlpha ν k p, lameBeta k p, lameGamma ν k p : ℝ     α_p, β_p, γ_p of 29.3.11–29.3.12
lameUMatrix ν k n                  : Matrix (Fin (n+1)) (Fin (n+1)) ℝ   M of 29.15.2
lameTypeFactor k s c d z           : ℝ                 sn^s cn^c dn^d, s c d : Bool
lameTypeDegree s c d               : ℕ                 s + c + d
IsLamePolynomial n k h s c d P     : Prop              sn^s cn^c dn^d P(sn²) solves (ν = n)
IsLameWeierstrassSolution L n B Λ U : Prop             Λ″ = (n(n + 1)℘ + B) Λ on U
IsLameProductSolution L n B X      : Prop              X‴ − 4(n(n+1)℘ + B)X′ − 2n(n+1)℘′X = 0
lameHermitePoly L n B              : Polynomial ℂ      Hermite's F, monic of degree n
lameHermiteInvariant L n B         : ℂ                 X′² − 2XX″ + 4(n(n + 1)℘ + B)X²
IsLameStable ν k h                 : Prop              every solution is bounded on ℝ
```

  Derivatives are Mathlib's `deriv`. `sn`, `cn`, `dn`, `am` are Tau Ceti's real
  `TauCeti.Real.jacobiSn k`, `jacobiCn k`, `jacobiDn k`, `jacobiAm k`; `K = legendreK k`,
  `k′ = √(1 − k²)`, `K′ = legendreK k′`. For `0 < k < 1` these agree with the complex functions of
  SpecialFunctionsJacobiElliptic on the real axis (its 3.4).
- **The parameters.** `0 < k < 1` and `ν` real, as in DLMF 29.2.1. The equation depends on `ν` only
  through `ν(ν + 1)`, which is invariant under `ν ↦ −ν − 1` (Ronveaux Part A, p. 11), so DLMF's
  restriction `ν ≥ −½` loses nothing; statements here carry it only where the proof uses it. At
  `k = 0` the definitions still make sense (`Q = 0`, `K = π/2`) and 3.3 evaluates them there.
- **Hill's equation.** `IsHillSolution`, `hillWI`, `hillWII`, `hillDiscriminant`, `realRootCount`,
  `hillPeriodicEigenvalue`, `hillAntiperiodicEigenvalue` and `nthLeast` are
  SpecialFunctionsMathieu's (its Conventions, 1.1, 2.1, 3.1 and 3.3), copied into `Suggested.lean`
  with their bodies. Lamé's equation with eigenvalue `h` is `IsHillSolution (lamePotential ν k) h`;
  the basic solutions are `hillWI (lamePotential ν k) h` (`w(0) = 1`, `w′(0) = 0`) and
  `hillWII (lamePotential ν k) h` (`w(0) = 0`, `w′(0) = 1`). Mathieu's theorems assume a continuous
  `π`-periodic coefficient; they are applied to `lameHillPotential ν k` (1.1), never to
  `lamePotential` directly.
- **The eigenvalues.** Following DLMF Table 29.3.2, with the boundary conditions at `z = 0` and
  `z = K`:

```text
a^{2m}_ν   = nthLeast {h | w_I′(K; h) = 0} m          w′(0) = 0, w′(K) = 0
a^{2m+1}_ν = nthLeast {h | w_II′(K; h) = 0} m         w(0) = 0,  w′(K) = 0
b^{2m+1}_ν = nthLeast {h | w_I(K; h) = 0} m           w′(0) = 0, w(K) = 0
b^{2m+2}_ν = nthLeast {h | w_II(K; h) = 0} m          w(0) = 0,  w(K) = 0
```

  `lameB ν k 0 = 0` is junk; DLMF has no `b⁰`. The superscript counts zeros in `[0, 2K)`, and
  `⌊j/2⌋` (for `a^j`) or `⌊(j − 1)/2⌋` (for `b^j`) is the number of zeros in `(0, K)`. Ince (1940)
  interchanges `a^{2m+1}` and `b^{2m+1}` (DLMF §29.1, p. 684); this roadmap follows DLMF.
- **Normalization.** `Ec^j_ν` and `Es^j_ν` are the eigenfunctions of 2.1 scaled so that
  `∫₀^K dn(x) E(x)² dx = π/4`, with `Ec^j_ν(K) > 0` and `Es^j_ν′(K) < 0` (DLMF 29.3.18 and the
  sentence after it, p. 686). In `φ = π/2 − am z` the weight is `dφ = −dn dz`, so the normalization
  is `∫₀^{π/2} E² dφ = π/4`. `lameEc` and `lameEs` are built from the real parts of `hillWI`,
  `hillWII` at real `h` (the unnormalized `lameEcRaw`, `lameEsRaw`), which are real solutions;
  `Real.sign` makes the signs, and the value at a junk eigenvalue is junk.
- **Lamé polynomials.** A Lamé polynomial of order `n` is `sn^s cn^c dn^d P(sn²)` with
  `s, c, d ∈ {0, 1}`, `P ≠ 0` and `2 deg P + s + c + d = n`, solving Lamé's equation with `ν = n`.
  DLMF's eight names (Table 29.12.1, p. 691) are the types `u` (`000`), `s`, `c`, `d`, `sc`, `sd`,
  `cd`, `scd`. Whittaker–Watson's four species (§23.2, p. 537) group them by the number of factors
  (`s + c + d` = 0, 1, 2, 3), and Dassios's classes `K, L, M, N` (§3.1, (3.11)–(3.15), p. 51) by the
  factors `cn` (`L`), `dn` (`M`) and both (`N`), with `sn` absorbed into the parity in `x`.
- **The Weierstrass form.** For a period pair `L`, Lamé's equation is `Λ″ = (n(n + 1)℘_L(u) + B)Λ`,
  Whittaker–Watson's form (§23.4, pp. 554–555). DLMF 29.2.9 writes `w″ + (g − ν(ν + 1)℘(η))w = 0`,
  so `B = −g`. Gesztesy–Holden write `−y″ + n(n + 1)℘ y = z y` (Example 1.32, p. 63), so `B = −z`.
  In 1.3 and 5.2 the lattice is `UpperHalfPlane.periodPair τ` with `τ = iK′/K`, whose periods are
  `τ` and `1`; the variable is `u = (z − iK′)/(2K)` and `B = (2K)²(ν(ν + 1)(1 + k²)/3 − h)`.
- **Hermite's invariant.** `lameHermitePoly L n B` is the monic polynomial `F` of degree `n` for
  which `X = F(℘)` solves the product equation (5.1), and `0` (junk) if there is none; 5.1 proves
  that there is exactly one. `lameHermiteInvariant L n B` evaluates
  `X′² − 2XX″ + 4(n(n + 1)℘ + B)X²` at `u = ω₁/2`, which is off the lattice; 5.1 proves the
  expression constant off the lattice. In Whittaker–Watson's notation (pp. 571–572) it is `4ℭ²`,
  where the Gothic `ℭ` is half the Wronskian of their two solutions `Λ₁`, `Λ₂`
  (`Λ₁Λ₂′ − Λ₂Λ₁′ = 2ℭ`, p. 571); their `Θ` of §23.71 is Jacobi's theta function. Gesztesy–Holden
  normalize `F` to be monic in the spectral parameter `z = −B` ((1.12)–(1.14), p. 23); their `F_n`
  is `((2n − 1)!!)²` times `F(℘)` at `B = −z`, and their monic `R_{2n+1}(z)` is `−((2n − 1)!!)⁴/4`
  times the invariant.
- **The integral-equation kernel.** In DLMF 29.8.2 and 29.8.5 the kernel `P_ν` is the function
  `F(−ν, ν + 1; 1; (1 − x)/2)`, analytic for `x ∉ (−∞, −1]`; its argument ranges over an interval
  containing `1` (in 29.8.6, `y = dn(z) dn(z₁)/k′ ∈ [k′, 1/k′]`). On `(−1, 1)` it is the Ferrers
  function `𝖯_ν` that DLMF names, and on `(1, ∞)` the Legendre function `P_ν`; the roadmap reads the
  kernel as this one analytic function (SpecialFunctionsLegendre 1.1 and 4.3). For integer `n` it is
  the Legendre polynomial `P_n(y) = shiftedLegendre n ((1 − y)/2)`, which 6.3 uses.

## Layer 1: Lamé's equation and its forms

### 1.1 The Jacobi form and the Hill normalization

Sources: DLMF 29.2.1 and §29.2(i), p. 684; Whittaker–Watson §23.4, p. 555 (the Jacobian form, with
their `A = −h`); Ronveaux Part A, §1.4, (1.4.2)–(1.4.6), pp. 10–11.

Prove:
- **periodicity** (`lamePotential_periodic`): for `0 < k < 1`, `Q = lamePotential ν k` is
  continuous, `2K`-periodic, even, and even about `K`;
- **the Hill normalization** (`lameHillPotential_spec`): `Q̃(x) = (2K/π)² Q(2Kx/π)` is continuous
  and `π`-periodic, and `w` solves Lamé's equation with eigenvalue `h` if and only if `x ↦ w(2Kx/π)`
  solves Hill's equation for `Q̃` with `λ = (2K/π)² h`;
- in the complex `z`-plane the equation has regular singular points at `2pK + (2q + 1)iK′`,
  `p, q ∈ ℤ`, with exponents `−ν` and `ν + 1`, and no other singular points (DLMF §29.2(i)).

The sanity check `lamePotential_zero_modulus` records `Q = 0` at `k = 0`. Periodicity is Tau
Ceti's `jacobiSn_antiperiodic` (antiperiod `2K`), `jacobiSn_neg`, and `sn(K − x) = sn(K + x)`,
which follows from the antiperiodicity and oddness. The Hill normalization
is the chain rule. The singular points are the poles of `sn` (SpecialFunctionsJacobiElliptic 2.3),
where `k² sn²(z) = (z − z₀)⁻² + O(1)`, so the indicial equation is `ρ(ρ − 1) = ν(ν + 1)`.

**Checks.**
- `K(1/√2) = 1.85407 46773`.
- At `k² = ½`, `x = 0.3`: `sn²(x + 2K) − sn²(x) = 0` (to `10⁻¹⁶`) and `sn(x + 2K) = −sn(x)`, while
  `sn²(x + K) − sn²(x) = 0.86893`: the period of `Q` is `2K`, not `K`.
- At `ν = 1.5`, `k² = ½` the lowest periodic eigenvalue of `Q̃`, computed independently from Hill's
  matrix in the basis `e^{2ijx}`, is `(2K/π)² · 0.87010 32362`; without the factor `(2K/π)²` in `λ`
  it would be compared with `1.21223 12479`, which is `(2K/π)²a⁰` and not `a⁰`.

*Needs:* Tau Ceti `jacobiSn_antiperiodic`, `hasDerivAt_jacobiSn`; SpecialFunctionsJacobiElliptic
2.3.

### 1.2 The algebraic, trigonometric and Dassios forms

Sources: DLMF 29.2.2–29.2.5, p. 684; Whittaker–Watson §23.21, p. 540, and §23.4, p. 554; Dassios
§2.4, (2.63), p. 47, and App. E, pp. 402–404; Kristensson §8.6.1, p. 159.

Prove:
- the algebraic form: with `ξ = sn²(z, k)`, Lamé's equation becomes DLMF 29.2.2, which is Heun's
  equation with `a = k⁻²`, `q = −ah/4`, `α = −ν/2`, `β = (ν + 1)/2`, `γ = δ = ε = ½`. This is the
  Lamé bullet of SpecialFunctionsHeun 2.4, consumed and not restated;
- the trigonometric form 29.2.4 with `φ = π/2 − am(z, k)`, so that `cos φ = sn z` (29.2.5);
- **Dassios's form** (`lame_dassios_form`): if `E` is `C²` on `(−h₃, h₃)`, `0 < h₃ < h₂`, and
  satisfies Dassios's (2.63)
  `(x² − h₃²)(x² − h₂²)E″ + x(2x² − h₃² − h₂²)E′ + (−ν(ν + 1)x² + B)E = 0` there, then
  `w(z) = E(h₃ sn(z, k))` with `k = h₃/h₂` solves Lamé's equation with `h = B/h₂²` on `(−K, K)`.

The algebraic and trigonometric forms are the chain rule with `dξ/dz = 2 sn cn dn` and
`dφ/dz = −dn`. For Dassios's form: with `x = h₃ sn(z, k)`, `dx/dz = h₃ cn dn` and
`(dx/dz)² = (h₃² − x²)(h₂² − x²)/h₂²`, so the first two terms of (2.63) are `h₂² d²E/dz²` and the
last is `h₂²(h − ν(ν + 1)k² sn²)E`. Dassios's App. E gives the Jacobian form with
`A = −(1 + h₃²/h₂²)p` for `B = (h₃² + h₂²)p`, which is `h = B/h₂²` again.

**Checks.**
- Symbolically, `h₂² E_zz` equals the first two terms of (2.63) for `x = h₃ sn`, `k = h₃/h₂`, and
  `−ν(ν + 1)x² + B = h₂²(h − ν(ν + 1)k² sn²)` with `h = B/h₂²`, as identities of rational functions
  of `sn`, `cn`, `dn` modulo `cn² = 1 − sn²`, `dn² = 1 − k² sn²`.
- `ν = 0`, `B = 0`: `E = 1` solves (2.63) and `w = 1` solves Lamé's equation with `h = 0`.
- Negative control: the modulus is `h₃/h₂`, not `h₃²/h₂²`; with `k = h₃²/h₂²` the coefficient of
  `sn²` would be `ν(ν + 1)h₃⁴/h₂⁴` instead of `ν(ν + 1)h₃²/h₂²`.

*Needs:* 1.1; SpecialFunctionsHeun 2.4.

### 1.3 The Weierstrass form

Sources: DLMF 29.2.6–29.2.12, p. 685; Whittaker–Watson §23.4, pp. 554–555; Gesztesy–Holden Vol. I,
Example 1.32, (1.147), p. 63.

Let `τ = iK′/K`, `L = UpperHalfPlane.periodPair τ` (periods `τ` and `1`) and `e₁ = (2K)²(2 − k²)/3`,
`e₂ = (2K)²(2k² − 1)/3`, `e₃ = −(2K)²(1 + k²)/3`. Prove:
- `e₁ > e₂ > e₃`, `e₁ + e₂ + e₃ = 0`, `(e₂ − e₃)/(e₁ − e₃) = k²` and `e₁ − e₃ = (2K)²`, so that
  these are constants of DLMF 29.2.6 with `(e₁ − e₃)^{−1/2} = 1/(2K)`;
- a function `w` holomorphic near a point `z₀` solves the complex Lamé equation there if and only if
  `Λ(u) = w(2Ku + iK′)` satisfies `IsLameWeierstrassSolution L n B Λ` near `(z₀ − iK′)/(2K)`, with
  `B = (2K)²(ν(ν + 1)(1 + k²)/3 − h)` (for integer `ν = n`; for real `ν` the same with `ν(ν + 1)`).

The relation `(2K)⁻² ℘_L(u/(2K)) = ns²(u) − (1 + k²)/3`, with the values of `℘_L` at the half
periods, is SpecialFunctionsJacobiElliptic 7.1 (the relation between `sn` and `℘` there), and
`k² sn²(u + iK′) = ns²(u)` is its 2.1; for `τ = iK′/K` its theta modulus is `k` (its 3.4).
Substituting gives `B = −g` with `g = (e₁ − e₃)h + ν(ν + 1)e₃` of DLMF 29.2.7.

**Checks.**
- At `k = 0.3` and `k² = ½`: `e₁ + e₂ + e₃`, `(e₂ − e₃)/(e₁ − e₃) − k²` and `e₁ − e₃ − (2K)²` are
  below `10⁻¹⁵`.
- `ν = 1`: the three values `h = k², 1, 1 + k²` (the eigenvalues of `dn`, `cn`, `sn`) go to
  `B = e₁, e₂, e₃` (in units of `(2K)²`), the zeros of `4B³ − g₂B − g₃` (5.1); at `k² = 0.3`:
  `h = 0.3, 1, 1.3`.
- Negative control: with `B = +g` the images of `e₁, e₂, e₃` at `k² = 0.3` would be
  `h = 1.43333, 0.73333, 0.43333`, which are not eigenvalues for `ν = 1`.

*Needs:* 1.1; SpecialFunctionsJacobiElliptic 2.1, 3.4, 7.1; Mathlib `PeriodPair.weierstrassP`.

### Examples

- `ν = 1`, `k² = ½`: `dn`, `cn`, `sn` solve Lamé's equation with `h = ½, 1, 3/2`; in Weierstrass
  form `√(℘ − e_i)` solves `Λ″ = (2℘ + e_i)Λ`.

### Dependencies

Tau Ceti's real Jacobi functions; SpecialFunctionsHeun 2.4; SpecialFunctionsJacobiElliptic 2.1, 2.3,
3.4 and 7.1.

## Layer 2: the eigenvalues `a^m_ν`, `b^m_ν`

### 2.1 Four boundary problems on `[0, K]`

Sources: DLMF §29.3(i), Tables 29.3.1–29.3.2, pp. 685–686; Whittaker–Watson §23.5, pp. 563–564 (the
species by parity in the Jacobi variable); SpecialFunctionsMathieu 3.1 (separated problems).

Prove:
- **the four families** (`lame_boundary_eigenvalues`): for `0 < k < 1` and real `ν`, the four root
  sets of [Conventions](#conventions) are exactly `{a^{2m}}`, `{a^{2m+1}}`, `{b^{2m+1}}`,
  `{b^{2m+2}}`, and `a^j → ∞`, `b^j → ∞`;
- each root is real and simple as a root of the entire function `h ↦ w_I′(K; h)` (and so on), and
  the eigenfunction is unique up to a factor;
- by the parity of `Q` about `0` and about `K` (1.1), an eigenfunction of each family extends to a
  solution on `ℝ` with the parity and period of DLMF Table 29.3.2, and conversely every solution of
  period `4K` that is even or odd about `0` and about `K` belongs to one family.

The eigenvalues are those of the separated Sturm–Liouville problems of SpecialFunctionsMathieu 3.1
for `V = −Q` on `[0, K]`, which gives reality, simplicity, the increasing enumeration and the zero
count. The extension uses that a solution even (odd) about `0` and `K` is determined by its values
on `[0, K]` and that `Q` has these symmetries.

**Checks.**
- At `ν = 1.5`, `k² = ½`: `a⁰ = 0.87010 32362`, `b¹ = 1.22844 97466`, `a¹ = 2.16764 93363`,
  `b² = 3.90434 25823`, `a² = 3.97167 16409`, `a³ = 7.49621 53683`, `b³ = 7.49791 19816`.
- At `ν = 2`, `k² = ½`: `a⁰ = 3 − √3`, `b¹ = 3/2`, `a¹ = 3`, `b² = 9/2`, `a² = 3 + √3`, and
  `a³ = b³ = 8.13733 15032` (shooting to `10⁻¹³`).
- `a¹_{1.5}` is the first root of `w_II′(K; ·)`, not of `w_I′(K; ·)`: assigning the odd index to the
  condition `w′(0) = 0` would return `a²_{1.5} = 3.97167 16409` as `a¹`.

*Needs:* 1.1; SpecialFunctionsMathieu 3.1.

### 2.2 Hill's eigenvalues and the interlacing

Sources: DLMF 29.3.1–29.3.4, p. 685; SpecialFunctionsMathieu 3.3 (Hill's interlacing theorem);
Kristensson §8.6.1, p. 159.

Prove:
- **Hill's eigenvalues** (`hillEigenvalue_lame`): for `Q̃ = lameHillPotential ν k` and
  `s = (2K/π)²`, `λ₀ = s a⁰`, `{λ_{2m+1}, λ_{2m+2}} = s {a^{2m+2}, b^{2m+2}}` and
  `{μ_{2m+1}, μ_{2m+2}} = s {a^{2m+1}, b^{2m+1}}`, each pair in increasing order;
- **the interlacing** (`lame_interlacing`): `a^m < a^{m+1}`, `a^m < b^{m+1}`, and for `m ≥ 1`,
  `b^m < b^{m+1}` and `b^m < a^{m+1}` (DLMF 29.3.1–29.3.4).

A `π`-periodic solution of the rescaled equation is `2K`-periodic in `z`, and splits into its parts
even and odd about `0`, each of which is even or odd about `K`; this is the decomposition of
Mathieu's 3.4 for Mathieu's equation. The eigenvalue counts in Mathieu's 3.3 then place the pairs.
The interlacing follows from Mathieu's interlacing theorem (`λ₀ < μ₁ ≤ μ₂ < λ₁ ≤ λ₂ < ⋯`) and the
zero counts: `a^m < b^{m+1}` because `a^m` and `b^{m+1}` share the condition at `0` and the
eigenfunction of `b^{m+1}` has more zeros on `[0, K]`, and similarly for the others.

**Checks.**
- At `ν = 1.5`, `k² = ½`, the periodic and antiperiodic eigenvalues of Hill's matrix (dimension 81,
  independent of the shooting) divided by `s` are `0.87010 32362`, `3.90434 25823`, `3.97167 16409`,
  `12.51263 40023`, `12.51270 15724` and `1.22844 97466`, `2.16764 93363`, `7.49621 53683`,
  `7.49791 19816`, agreeing with 2.1 to `10⁻¹²`.
- The interlacing holds at `(ν, k²) = (1.5, ½), (2, ½), (−0.3, ½), (0.5, ¼)` for `a⁰, …, a⁷` and
  `b¹, …, b⁸`.
- Negative control: the interlacing does not order `a^m` against `b^m`; at `ν = 1.5`, `k² = ½`,
  `a¹ > b¹` and `a² > b²` but `a³ = 7.49621 53683 < b³ = 7.49791 19816`, so the smaller member of a
  pair is `a` or `b` depending on `m` and `ν` (5.3).

*Needs:* 1.1, 2.1; SpecialFunctionsMathieu 3.3.

### Examples

- At `ν = 2`, `k² = ½`, the five eigenvalues `a⁰ < b¹ < a¹ < b² < a²` are
  `3 − √3, 3/2, 3, 9/2, 3 + √3`, and the next pairs coincide: `a³ = b³`, `a⁴ = b⁴ = 13.13931 97882`.

### Dependencies

Layer 1; SpecialFunctionsMathieu 3.1 and 3.3.

## Layer 3: Lamé functions

### 3.1 Normalization, symmetry, zeros and orthogonality

Sources: DLMF §§29.3(iv)–29.3(vi), Table 29.3.2, 29.3.18–29.3.19, p. 686; Whittaker–Watson §23.5,
pp. 563–564.

Prove:
- **`Ec`** (`lameEc_spec`): `Ec^j_ν` is `C²`, solves Lamé's equation with `h = a^j_ν`, satisfies
  `Ec(−x) = (−1)^j Ec(x)`, `Ec(K − x) = Ec(K + x)` and `Ec(x + 2K) = (−1)^j Ec(x)`, has
  `∫₀^K dn · Ec² = π/4` and `Ec(K) > 0`, and has exactly `⌊j/2⌋` zeros in `(0, K)`;
- **`Es`** (`lameEs_spec`): for `j ≥ 1`, `Es^j_ν` solves the equation with `h = b^j_ν`, satisfies
  `Es(−x) = (−1)^{j+1} Es(x)`, `Es(K − x) = −Es(K + x)` and `Es(x + 2K) = (−1)^j Es(x)`, has
  `∫₀^K dn · Es² = π/4` and `Es′(K) < 0`, and has exactly `⌊(j − 1)/2⌋` zeros in `(0, K)`;
- **orthogonality** (`lame_orthogonal`): `∫₀^K Ec^j Ec^{j′} = 0` for `j ≠ j′` of the same parity,
  and likewise for `Es` (DLMF 29.3.19);
- each Lamé function has exactly `j` zeros in `[0, 2K)` (DLMF §29.3(iv)).

The equation and symmetries come from 2.1. The normalization is well defined: the integral is
positive, and `Ec(K) ≠ 0` (respectively `Es′(K) ≠ 0`) because the boundary condition at `K` already
fixes the other value and a solution with `w(K) = w′(K) = 0` vanishes. The zeros are the Sturm count
of SpecialFunctionsMathieu 3.1. Orthogonality is the Lagrange identity on `[0, K]` with the boundary
conditions of each family.

**Checks.**
- `ν = 1.5`, `k² = ½`: `Ec⁰(0) = 0.89904 24282`, `Ec⁰(0.7) = 0.74211 97051`,
  `Ec⁰(K) = 0.47252 63246`; `Ec²(0) = −0.89295 45435`, `Ec²(K) = 1.10139 57985`.
- `ν = 1.5`, `k² = ½`, `x = 0.37`: `Ec¹(x + 2K)/Ec¹(x) = −1`, `Es¹(x + 2K)/Es¹(x) = −1`,
  `Es²(x + 2K)/Es²(x) = 1`; `Ec¹(K − x)/Ec¹(K + x) = 1` and `Es^j(K − x)/Es^j(K + x) = −1`.
- `Ec⁰`, `Ec²`, `Ec⁴` at `ν = 1.5`, `k² = ½` have `0, 1, 2` zeros in `(0, K)`.
- Negative control: normalizing by `∫₀^K Ec² dx = π/4` without the weight `dn` gives a different
  function (the weight is `1` only at `k = 0`); DLMF's 29.3.19 orthogonality, in contrast, has no
  weight.

*Needs:* 2.1; SpecialFunctionsMathieu 3.1.

### 3.2 Fourier series and continued fractions

Sources: DLMF §29.6(i), 29.6.1–29.6.7, pp. 688–689, and §29.3(iii), 29.3.9–29.3.12, p. 685;
AsymptoticExpansions §12.1 (recessive solutions); SpecialFunctionsEiLiErfIncompleteGamma §4.1
(Pincherle's theorem).

With `φ = π/2 − am(z, k)` and `H = 2a^{2m}_ν − ν(ν + 1)k²` (29.6.2), prove:
- **the Fourier series** (`lameEc_even_fourier`): `Ec^{2m}_ν = ½A₀ + Σ_{p≥1} A_{2p} cos 2pφ`, the
  coefficients satisfy `(β₀ − H)A₀ + α₀A₂ = 0` and `γ_pA_{2p−2} + (β_p − H)A_{2p} + α_pA_{2p+2} = 0`
  with `α_p, β_p, γ_p` of 29.3.11–29.3.12, `½A₀² + Σ A_{2p}² = 1`, `½A₀ + Σ A_{2p} > 0`, and, for
  `ν ≥ −½` unless `ν = 2n` with `m ≤ n`, `A_{2p+2}/A_{2p} → k²/(1 + k′)²` (DLMF 29.6.7 under the
  standing `ν ≥ −½` of §29.2(i));
- the continued fraction 29.3.10: `H` satisfies it for every `p ≥ 0`, and conversely a real root `H`
  of 29.3.10 for which the recessive solution of the recurrence (29.6.4) with `p ≥ 1` also satisfies
  (29.6.3) gives an eigenvalue `a^{2m}` by 29.3.9;
- for `ν = 2n` and `m ≤ n` the series terminates at `p = n` (29.6.7 and the sentence after it).

The series: `Ec^{2m}` is even and `π`-periodic as a function of `φ` (2K-periodic and even in `z`),
and analytic in `φ` on a strip, so its cosine series converges absolutely; inserting it in the
trigonometric form 29.2.4 gives the recurrence. Parseval in `φ` with `dφ = dn dz` gives the
normalization, and the sign is `Ec(K) > 0` at `φ = 0`. The ratio limit: divided by `α_p`, the
recurrence is `A_{2p+2} + f(p)A_{2p} + g(p)A_{2p−2} = 0` with `f(p) = (β_p − H)/α_p` and
`g(p) = γ_p/α_p` rational in `p`, so with Poincaré expansions in `p⁻¹`, and `α_p ≠ 0`, `γ_p ≠ 0`
for large `p`. From `α_p, γ_p ~ −2k²p²` and `β_p ~ 4(2 − k²)p²`, `f₀ = −2(2 − k²)/k²` and `g₀ = 1`;
the characteristic equation `t² + f₀t + g₀ = 0` has the distinct roots `(1 ± k′)²/k²`, so
AsymptoticExpansions §12.1 (in its tail form) gives a recessive solution, unique up to a factor,
with ratio tending to the smaller root `(1 − k′)²/k² = k²/(1 + k′)²`, while every other solution
has ratio tending to the larger, which exceeds `1`. The Fourier coefficients are square-summable,
so they are the recessive solution, and the limit holds once they are not eventually `0`. If
`A_{2p} = A_{2p+2} = 0` and `γ_q ≠ 0` for `1 ≤ q ≤ p`, the recurrence run backwards makes every
coefficient `0`; `γ_q = ½(ν − 2q + 2)(ν + 2q − 1)k²` vanishes for some `q ≥ 1` only at `ν = 2n`
(`q = n + 1`) or at `ν = −2n − 1` (`q = n + 1`), the latter below `−½`. For `ν = 2n` and `m > n`
a terminating series would make `Ec^{2m}` a Lamé polynomial of type `u`, whose eigenvalue is some
`a^{2j}_{2n}` with `j ≤ n` (4.1), not `a^{2m}`. At `ν = 2n` with `m ≤ n` the series terminates
(29.6.7), and at `ν = −2n − 1`, the same equation, it can as well (Checks). The
continued fraction: a recessive solution of a recurrence with `g(p) ≠ 0` is minimal in the sense
of SpecialFunctionsEiLiErfIncompleteGamma §4.1, and its Pincherle theorem gives the convergence
of the tail of 29.3.10 to the ratio of consecutive coefficients; 29.6.3 at `p = 0` closes it. The
corresponding series for `Ec^{2m+1}`, `Es^{2m+1}`,
`Es^{2m+2}` (DLMF §29.6(ii), online only) are targets of the same form; their recurrences follow by
inserting `cos(2p + 1)φ`, `sin(2p + 1)φ`, `sin(2p + 2)φ` in 29.2.4.

**Checks.**
- At `ν = 1.5`, `k² = ½`, the lowest eigenvalues of the recurrence truncated at `p = 80` give
  `a⁰ = 0.87010 32362 18`, `a² = 3.97167 16408 51`, `a⁴ = 12.51270 15723 76`, equal to the shooting
  values of 2.1 to `10⁻¹²`, and the series reproduces `Ec⁰`, `Ec²`, `Ec⁴` at `z = 0, 0.7, K` to
  `10⁻¹²`.
- At `ν = 1.5`, `k² = ½`, `m = 0`: `β₀ − H = 0.13479 35276` and the continued fraction on the right
  of 29.3.10 with `p = 0` equals it to `10⁻¹⁵`; `k²/(1 + k′)² = 0.17157 28753`.
- Negative control: replacing `α₀ = (ν − 1)(ν + 2)k²` by the `p ≥ 1` formula at `p = 0`
  (`½(ν − 1)(ν + 2)k²`) gives the wrong value `0.90342 76823` for `a⁰_{1.5}`.
- Negative control for `ν ≥ −½`: at `ν = −1`, `m = 0`, any `0 < k < 1`, `ν(ν + 1) = 0`, so
  `a⁰ = 0`, `H = 0`, `Ec⁰ = 2^{−1/2}`, `A₀ = √2` and `A_{2p} = 0` for `p ≥ 1`; the recurrence
  (`β₀ = 0`, `γ₁ = 0`), `½A₀² = 1` and the sign hold, `ν = −1` is not of the form `2n`, but
  `A_{2p+2}/A_{2p}` is `0/0 = 0` for `p ≥ 1`, not `k²/(1 + k′)² > 0`.

*Needs:* 2.1, 3.1, 1.2, and 4.1 for `ν = 2n`, `m > n`; AsymptoticExpansions §12.1;
SpecialFunctionsEiLiErfIncompleteGamma §4.1.

### 3.3 The limits `k → 0` and `k → 1`

Sources: DLMF §29.5, 29.5.1–29.5.7, p. 688; EllipticIntegrals 2.1 and 3.1.

Prove:
- **at `k = 0`** (`lame_modulus_zero`): `a^j_ν(0) = j²`, `b^j_ν(0) = j²` (`j ≥ 1`), and the
  eigenvalues are continuous at `k = 0+` (29.5.1); `Ec⁰_ν(z, 0) = 2^{−1/2}`,
  `Ec^m_ν(z, 0) = cos m(π/2 − z)` and `Es^m_ν(z, 0) = sin m(π/2 − z)` for `m ≥ 1` (29.5.2–29.5.3);
- **as `k → 1`** (`tendsto_lame_modulus_one`): for `ν ≥ −½`, `a^m_ν` and `b^{m+1}_ν` tend to
  `ν(ν + 1) − μ²`, `μ = max(ν − m, 0)` (29.5.4);
- the eigenfunctions converge, for `ν − m ≥ 0`, to the functions of 29.5.5–29.5.6, which are
  constant multiples of the Ferrers functions `𝖯^{−μ}_ν(tanh z)` (SpecialFunctionsLegendre 1.1, with
  the hypergeometric forms of its 4.3), the bound states of `w″ + (h − ν(ν + 1) tanh² z) w = 0`;
- if `k → 0` and `ν → ∞` with `k²ν(ν + 1) = 4θ` fixed, `Ec^m_ν(z, k²) → ce_m(π/2 − z, θ)` and
  `Es^m_ν(z, k²) → se_m(π/2 − z, θ)` (29.5.7), with SpecialFunctionsMathieu's `ce`, `se` (its 4.1).

At `k = 0` the equation is `w″ + hw = 0` on `[0, π/2]`. Continuity at `0`: the boundary functions
are jointly continuous in `(h, k)` (continuous dependence on the coefficient, and `K` continuous by
EllipticIntegrals 2.1), and the roots are simple. For `k → 1`: `K → ∞` (EllipticIntegrals 3.1) and
`sn(z, k) → tanh z` at each real `z` (SpecialFunctionsJacobiElliptic 3.5), hence locally uniformly
on `ℝ`, since `|∂_z sn| = |cn dn| ≤ 1` makes the family `1`-Lipschitz; the limit problem on
`[0, ∞)` is the Pöschl–Teller equation, whose bound states are at `h = ν(ν + 1) − (ν − m)²` for
`0 ≤ m < ν` (with `x = tanh z` it is Legendre's equation of order `μ`), and the remaining
eigenvalues accumulate at the threshold `ν(ν + 1)`. The pairs `a^m`, `b^{m+1}` have the same limit
because their eigenfunctions differ only in the condition at `K → ∞`.

**Checks.**
- `ν = 1.5`, `k = 10⁻⁴`: `a⁰ … a⁵ = 0.00000, 1.00000, 4.00000, 9.00000, 16.00000, 25.00000` to
  `10⁻⁷`.
- `ν = 1.5`, `1 − k² = 10⁻¹⁰`: `a⁰ = 1.5000000`, `b¹ = 1.5000000`, `a¹ = 3.4999936`,
  `b² = 3.5000064`, against the limits `ν(ν + 1) − 1.5² = 1.5` and `ν(ν + 1) − 0.5² = 3.5`; `ν = 2`:
  `a⁰ = 2.0`, `a¹ = 5.0`, `a² = 6.0` against `2, 5, 6`.
- Negative control: for `m ≥ ν` the limit is the threshold `ν(ν + 1)` and is approached only like
  `1/log²(1/k′)`: at `ν = 1.5`, `1 − k² = 10⁻¹⁰`, `a² = 3.76425` and `a³ = 3.77411`, still above
  `3.75`; the formula `ν(ν + 1) − (ν − m)²` without the `max` would give `3.5` and `1.5` for
  `m = 2, 3`.

*Needs:* 2.1, 3.1; EllipticIntegrals 2.1, 3.1; SpecialFunctionsJacobiElliptic 3.5;
SpecialFunctionsLegendre 1.1, 4.3; SpecialFunctionsMathieu 4.1.

### 3.4 Integral equations

Sources: DLMF §29.8, 29.8.1–29.8.6, pp. 689–690; Ronveaux Part A, §6.2, pp. 67–69 (the Lambe–Ward
kernels, which for Lamé's equation are Legendre functions, p. 69); Whittaker–Watson §23.6, pp.
564–566.

Prove, with the kernel of [Conventions](#conventions):
- for any solution `w` of period `4K` and `x` of 29.8.1, 29.8.2 holds with `μ` of 29.8.3–29.8.4;
- the special case 29.8.5 for `Ec^{2m}_ν` with `y = dn(z) dn(z₁)/k′`.

The proof is Whittaker–Watson's: the kernel `P_ν(x(z, z₁, …))` is annihilated by the difference of
the Lamé operators in `z` and `z₁` (the lemma on p. 565, there for `P_n(k sn α sn θ)`), and two
integrations by parts over a period move the operator onto `w`. 6.3 is the polynomial case with a
Lean statement.

**Checks.**
- At `z = z₁ = z₂ = z₃ = 0`, `x = (1 − k²)/k′² = 1`, so the kernel is evaluated at the point where
  the Ferrers and Legendre functions meet; at `z₁ = z₂ = z₃ = K`, `x = k² sn z + k′ dn z`.
- For `Ec^{2m}_ν`, `y = dn(z) dn(z₁)/k′` ranges over `[k′, 1/k′]`, which contains `1` in its
  interior.
- The polynomial case is checked numerically in 6.3.

*Needs:* 2.1, 3.1; SpecialFunctionsLegendre 1.1, 4.3.

### Examples

- At `ν = 1.5`, `k² = ½`: `A₀ = 2(Ec⁰(K) − Σ A_{2p})`, and the Fourier coefficients of `Ec⁰` decay
  like `0.17157^p` (`A_{2p+2}/A_{2p}` is `0.15127` at `p = 12`, approaching the limit slowly).

### Dependencies

Layers 1–2, and 4.1 in 3.2; SpecialFunctionsMathieu 3.1, 4.1; EllipticIntegrals 2.1, 3.1;
AsymptoticExpansions §12.1; SpecialFunctionsEiLiErfIncompleteGamma §4.1;
SpecialFunctionsJacobiElliptic 3.5; SpecialFunctionsLegendre 1.1, 4.3.

## Layer 4: Lamé polynomials

### 4.1 The eight types and the `2n + 1` eigenvalues

Sources: Whittaker–Watson §23.2, p. 537, §§23.21–23.24, pp. 538–543, §23.41, pp. 556–558,
§§23.42–23.47, pp. 558–563; Dassios §3.1, p. 51, §§3.2–3.4, pp. 52–60, and §3.5, Lemmas 3.1–3.4 and
Table 3.1, pp. 60–63; DLMF §29.12(i), 29.12.1–29.12.8 and Table 29.12.1, pp. 690–691; Ronveaux Part
A, §1.5, pp. 11–13.

Throughout, `n ∈ ℕ` and `ν = n`. Prove:
- **the eigenvalues** (`lamePolynomial_eigenvalues`): for each type `(s, c, d)` with `s + c + d ≤ n`
  and `s + c + d ≡ n (mod 2)` there are exactly `(n − s − c − d)/2 + 1` values `h` with a Lamé
  polynomial of that type; all these values, over the eight types, are `2n + 1` distinct reals; a
  value `h` has Lamé polynomials of one type only, and of that type a single `P` up to a factor; and
  the set of all of them is `{a^j_n : 0 ≤ j ≤ n} ∪ {b^j_n : 1 ≤ j ≤ n}`;
- the correspondence of DLMF Table 29.12.1 between types and eigenvalues: for `n` even,
  `u ↔ a^{2m}`, `sc ↔ b^{2m+2}`, `sd ↔ a^{2m+1}`, `cd ↔ b^{2m+1}`; for `n` odd, `s ↔ a^{2m+1}`,
  `c ↔ b^{2m+1}`, `d ↔ a^{2m}`, `scd ↔ b^{2m+2}`; and the superscript `m` of DLMF's `uE^m_{2n}`, …
  is the number of zeros in `(0, K)`;
- Lamé polynomials extend to doubly periodic meromorphic functions of `z` with the real and
  imaginary periods of Table 29.12.1 (with SpecialFunctionsJacobiElliptic 2.2).

`lameTypeDegree s c d` is `s + c + d`, with the sanity check `lameTypeDegree_scd` for type `scd`.
The count per type: inserting `sn^s cn^c dn^d P(sn²)` in the algebraic form gives a three-term
recurrence for the coefficients of `P` whose truncation is an eigenproblem of size
`(n − s − c − d)/2 + 1` for `h`; for type `u` this is SpecialFunctionsHeun 4.1 with `α = −n/2`, and
the other types reduce to it by the F-homotopic transformations of its 4.3. Reality and simplicity:
the matrix has real diagonal and positive products of opposite off-diagonal entries
(SpecialFunctionsHeun 4.2, its reality theorem for `a > 1`, applies with `a = k⁻² > 1`, `δ = ½ > 0`,
`β = (n + 1)/2 > 0`; Whittaker–Watson's Sturm-sequence argument in §23.41, p. 557, is the same fact;
Dassios's matrix form is Remark 3.5, (3.113)–(3.118), p. 65). Distinctness across types:
Whittaker–Watson §23.47, pp. 562–563, and Dassios Lemma 3.3, p. 62: two Lamé polynomials of
different types with the same `h` would have a Wronskian that is a nonzero multiple of a
non-constant product of `sn`, `cn`, `dn` but must be constant. Identification with Layer 2: a Lamé
polynomial has the parity and period of one row of Table 29.3.2, hence is an eigenfunction there,
and its zero count fixes its index; the `2n + 1` values exhaust the `a^j_n`, `b^j_n` with `j ≤ n` by
counting.

**Checks.**
- `k² = ½`, `n = 2`: types `u` (2 values), `sc`, `sd`, `cd` (1 each); `h = 1.26794 91924 [u]`,
  `1.5 [cd]`, `3 [sd]`, `4.5 [sc]`, `4.73205 08076 [u]`, equal to `a⁰, b¹, a¹, b², a²` of 2.1.
- `k² = ½`, `n = 3`: `2.05051 02572 [d] = 9/2 − √6`, `2.12701 66538 [c] = 6 − √15`,
  `5.05051 02572 [s]`, `6 [scd]`, `6.94948 97428 [d]`, `9.87298 33462 [c]`, `9.94948 97428 [s]`,
  equal to `a⁰, b¹, a¹, b², a², b³, a³` by shooting.
- `k² = 3/10`, `n = 0, …, 4`: the counts per type are `(n − s − c − d)/2 + 1`, the totals
  `1, 3, 5, 7, 9`, and all values are real and distinct (exact determinants, roots to 30 digits).
- Negative control: `n + 1` eigenvalues for every type would give `8(n + 1)` or (with parity)
  `4(n + 1)` values, not `2n + 1`; at `n = 2` type `sc` has one value, not three.

*Needs:* 1.2, 2.1, 2.2, 3.1; SpecialFunctionsHeun 4.1–4.3; SpecialFunctionsJacobiElliptic 2.2.

### 4.2 The tridiagonal matrices

Sources: DLMF §29.15(i), 29.15.1–29.15.7, p. 692, and §29.15(ii), 29.15.43, p. 693; Dassios §3.2,
(3.19)–(3.34), pp. 52–53, and Remark 3.5, pp. 64–65; Whittaker–Watson §23.41, pp. 556–557.

Prove:
- **the matrix of type `u`** (`lameUMatrix_charpoly_roots`): for `ν = 2n`, the characteristic
  polynomial of `M` (29.15.2) has exactly the `n + 1` simple real roots
  `H_m = 2a^{2m}_{2n} − ν(ν + 1)k²`, `m = 0, …, n` (29.15.3, 29.15.7);
- the eigenvector of `H_m`, normalized by 29.15.5–29.15.6, gives the terminating Fourier series
  29.15.1 of `uE^m_{2n} = Ec^{2m}_{2n}`, and with `cos 2pφ = T_{2p}(sn z)` the Chebyshev form
  29.15.43, which determines `P`;
- for the other seven types, the analogous tridiagonal matrices of the polynomial coefficients
  (Dassios (3.31)–(3.34), p. 53, for class `K`, and §§3.3–3.4, pp. 54–60, for `L, M, N`) have real
  simple eigenvalues, which are the polynomial eigenvalues of 4.1.

The matrix: the terminating case of 3.2 (`A_{2n+2} = 0`) is exactly the eigenproblem of `M`; 4.1
gives `n + 1` distinct real eigenvalues `a^{2m}_{2n}`, and `M` has size `n + 1`.

**Checks.**
- `ν = 2`, `k² = ½`: `M = [[0, 2], [3/2, 6]]`, characteristic polynomial `H² − 6H − 3`, roots
  `3 ∓ 2√3`, so `a^{0}, a² = (H + 3)/2 = 3 ∓ √3`.
- `ν = 4`, `k² = ½`: `H = −4.42220 51`, `10`, `24.42220 51`, giving `a⁰, a², a⁴ = 2.78889 74491`,
  `10`, `17.21110 25509`, the type-`u` values of 4.1.
- Negative control: the truncation is exact only for `ν = 2n`: the equation of index `n + 1` with
  `A_{2n+2} = A_{2n+4} = 0` reads `γ_{n+1}A_{2n} = 0`, and `γ_{n+1} = ½(ν − 2n)(ν + 2n + 1)k²`
  vanishes exactly at `ν = 2n`; at `ν = 1.5`, `n = 1` the `2 × 2` matrix gives `0.87063 11079`, not
  `a⁰ = 0.87010 32362`.

*Needs:* 3.2, 4.1.

### 4.3 Zeros and Stieltjes' theorem

Sources: DLMF §§29.12(ii)–29.12(iii), 29.12.9–29.12.13, p. 691; Whittaker–Watson §23.46, pp.
560–562; Dassios §5.1, Propositions 5.1–5.3, pp. 89–93, and §5.5, Theorem 5.7, pp. 104–106.

Prove:
- **the zeros** (`lamePolynomial_zeros`): `P` has `deg P` simple real zeros, all in
  `(0, 1) ∪ (1, k⁻²)`; those in `(0, 1)` are as many as the zeros of the Lamé polynomial in
  `(0, K)`; and the zeros satisfy Stieltjes' equations 29.12.13 with `ρ = s/2`, `σ = c/2`,
  `τ = d/2`;
- the remaining zeros of `P`, `deg P` minus the number in `(0, 1)`, correspond to the zeros of the
  Lamé polynomial on the open segment from `K` to `K + iK′`, where `sn² ∈ (1, k⁻²)`;
- the function `g` of 29.12.11 on the region 29.12.12 attains its maximum exactly at the zeros
  (29.12.10–29.12.12), the electrostatic interpretation.

The zeros: a multiple zero of `P` or a zero at `0, 1, k⁻²` would be a point where the solution and
its derivative vanish or an exponent other than `0, ½` would occur (Whittaker–Watson §23.43, pp.
558–559; Dassios Propositions 5.1–5.2). Reality and location: Dassios Proposition 5.3 and
Whittaker–Watson §23.46 (Stieltjes' theorem: the `r`-th function has `r − 1` zeros in one interval
and the rest in the other). Stieltjes' equations: evaluate the algebraic form at a zero `ξ_p` of
`P`, where `P″/P′` is `Σ_{q≠p} 2/(ξ_p − ξ_q)`.

**Checks.**
- `k² = 3/10`, `n = 4`, type `u`: the three polynomials have zeros `{1.43035, 3.03206}`,
  `{0.30335, 2.91596}`, `{0.13989, 0.84506}`, all in `(0, 1) ∪ (1, 10/3)`, with `0, 1, 2` zeros in
  `(0, 1)`.
- At the same polynomials, and for type `s` with `n = 5`, the residuals of 29.12.13 are below
  `10⁻¹²`.
- Negative control: with the charges `ρ, σ, τ` in place of `ρ + ¼, σ + ¼, τ + ¼`, 29.12.13 fails at
  these zeros: the residuals for the first two type-`u` polynomials are `0.624` and `0.383`.

*Needs:* 4.1; SpecialFunctionsHeun 4.1.

### 4.4 The second solution, imaginary periods and the duality `k ↔ k′`

Sources: DLMF §29.17(i), 29.17.1, p. 693, §29.10, 29.10.1–29.10.4, p. 690, and 29.3.7–29.3.8, p.
685; Whittaker–Watson §23.47, pp. 562–563; Dassios §3.6, (3.125), p. 66.

Prove:
- the second solution: if `E` is a Lamé polynomial, `F(z) = E(z) ∫ dz/E(z)²` (on an interval where
  `E ≠ 0`, continued through the zeros of `E`) is a second solution, and it is not periodic:
  `F(z + T) − F(z)` is a nonzero multiple of `E` for the period `T` of `E`. DLMF 29.17.1 starts the
  integral at `iK′`, which is a pole of `E`; the roadmap takes any base point, which changes `F` by
  a multiple of `E`;
- the imaginary transformation 29.10.1–29.10.4: with `h′ = ν(ν + 1) − h` and `z′ = i(z − K − iK′)`,
  the equation becomes Lamé's equation with modulus `k′` (with SpecialFunctionsJacobiElliptic 4.1);
- **the duality** (`lame_eigenvalue_duality`): for `ν = n`, `a^m_n(k) + a^{n−m}_n(k′) = n(n + 1)`,
  `0 ≤ m ≤ n`, and `b^m_n(k) + b^{n−m+1}_n(k′) = n(n + 1)`, `1 ≤ m ≤ n` (29.3.7–29.3.8).

The duality follows from the imaginary transformation applied to Lamé polynomials, which are
meromorphic in `z`, with the zero counts of 4.3. For the polynomial of `a^m_n` (resp. `b^m_n`),
`r = ⌊m/2⌋` (resp. `⌊(m − 1)/2⌋`) zeros lie in `(0, K)` and `deg P − r` on the open segment from `K`
to `K + iK′`; `z ↦ z′` exchanges the two intervals, and it exchanges the type factors `sn` and `dn`
and fixes `cn` up to constants: `sn(z, k) = dn(z′, k′)/k`, `cn(z, k) = −ik′ cn(z′, k′)/k`,
`dn(z, k) = k′ sn(z′, k′)` (SpecialFunctionsJacobiElliptic 2.1 and 4.1). The transformed function is
the Lamé polynomial of modulus `k′` with `deg P − r` zeros in `(0, K′)` and the exchanged type,
which by Table 29.12.1 is the one of `a^{n−m}_n(k′)` (resp. `b^{n−m+1}_n(k′)`), with eigenvalue
`h′`.

**Checks.**
- `n = 2, 3`, `k² = 0.3`: all the sums of 29.3.7–29.3.8 equal `6` and `12` to `10⁻¹⁰`.
- `n = 1`: `a⁰(k) + a¹(k′) = k² + (1 + k′²) = 2` and `b¹(k) + b¹(k′) = 1 + 1 = 2`. The function
  of `a⁰_1(k)` is `dn`, of type `d`, with no zero in `(0, K)` and none on the open segment
  (`dn(K + it, k) = k′ cn(t, k′)/dn(t, k′)`); it goes to a multiple of `sn(z′, k′)`, type `s`,
  the function of `a¹_1(k′)`.
- Negative control: `a⁰_2(k) + a⁰_2(k′) = 2.44472 22331` at `k² = 0.3`, not `6`; the index must be
  `n − m`.

*Needs:* 4.1, 4.3; SpecialFunctionsJacobiElliptic 2.1, 4.1.

### Examples

- `n = 1`: `dn`, `cn`, `sn` with `h = k², 1, 1 + k²` (types `d`, `c`, `s`).
- `n = 2`, `k² = ½`: `uE` with `P(ξ) = 1 − (h/2)ξ`, `h = 3 ∓ √3`; `cdE = cn dn`, `sdE = sn dn`,
  `scE = sn cn` with `h = 3/2, 3, 9/2`.

### Dependencies

Layers 1–3; SpecialFunctionsHeun 4.1–4.3; SpecialFunctionsJacobiElliptic 2.1, 2.2, 4.1.

## Layer 5: Hermite's solution and the finite-gap property

### 5.1 Hermite's product and its invariant

Sources: Whittaker–Watson §23.7, pp. 570–572, and §23.71, pp. 573–575; Gesztesy–Holden Vol. I, §1.2,
(1.12)–(1.14), p. 23, Example 1.32, pp. 61–63, and §1.6, (1.293)–(1.294), pp. 107–108.

Throughout, `L` is any period pair and `n ∈ ℕ`. Prove:
- **Hermite's product** (`lame_hermite`): for every `B ∈ ℂ` there is exactly one monic `F` of degree
  `n` such that `F(℘)` solves the product equation `X‴ − 4(n(n + 1)℘ + B)X′ − 2n(n + 1)℘′X = 0`; for
  it, `X′² − 2XX″ + 4(n(n + 1)℘ + B)X²` is constant off the lattice; this constant is `R(B)` for a
  polynomial `R` of degree `2n + 1` with leading coefficient `4/((2n − 1)!!)⁴`; and `R(B) = 0` if
  and only if, on some nonempty open set off the lattice, a solution `Λ` of the Weierstrass form has
  `Λ² = F(℘)`;
- the product of any two solutions of the Weierstrass form on an open set solves the product
  equation, and for two independent solutions with product `X` the constant is `W(Λ₁, Λ₂)²`
  (Gesztesy–Holden (1.293)–(1.294), p. 107);
- **the Hermite–Halphen solutions**: if `R(B) ≠ 0`, with `ℭ² = R(B)/4`, the functions
  `Λ_± = √X exp(±ℭ ∫ du/X)` are independent solutions, and with `℘(a_r) = ξ_r` the zeros of `F`,
  `Λ_± = Π_r σ(u ± a_r)/(σ(u)σ(a_r)) · exp(∓u Σ_r ζ(a_r))` for a choice of signs of the `a_r`
  (Whittaker–Watson pp. 571–572); in Jacobi form, Hermite's `Π H(α + a_r)/Θ(α) · e^{ρα}` (§23.71).

The product equation is Whittaker–Watson's p. 570 (from the equation for products of solutions,
which Gesztesy–Holden (1.293) attribute to Appell). Existence and uniqueness of `F`: in powers of
`℘`, with `℘′² = 4℘³ − g₂℘ − g₃` and `℘″ = 6℘² − g₂/2` (Mathlib `PeriodPair.derivWeierstrassP_sq`),
the product equation is a triangular system for the coefficients (Whittaker–Watson's recurrence on
p. 571, there in powers of `℘ − e₂`), whose top equation vanishes identically. Constancy: the
derivative of the invariant is `−2X` times the left side of the product equation. Degree and leading
coefficient: the coefficient of `℘^{n−r}` in `F` is a polynomial of degree `r` in `B`; comparison
with Gesztesy–Holden's monic `F_n` and `R_{2n+1}` ((1.12)–(1.14), p. 23) gives the normalization.
The criterion for `R(B) = 0` is Whittaker–Watson's case (I) on p. 571. In the `σ`-form, `σ` is the
lattice sigma function of [ModularCurvesPartII](../ModularCurvesPartII/README.md) §1.4a, which
constructs it for any period pair by the canonical product and proves it entire and odd with
`σ′(0) = 1`, with simple zeros exactly on the lattice, and with `−(σ′/σ)′ = ℘` off the lattice. The
`σ`-form also needs `σ′/σ = ζ` off the lattice, with `ζ` Tau Ceti's `PeriodPair.weierstrassZeta`,
which §1.4a does not state; it is an auxiliary result here. Both sides are odd and have derivative
`−℘` on the complement of the lattice, which is connected (Tau Ceti
`PeriodPair.hasDerivAt_weierstrassZeta`, `PeriodPair.weierstrassZeta_neg`), so their difference is
a constant, and oddness makes it `0`.

**Checks.**
- `n = 1`: `F = ℘ − B`, `R(B) = 4B³ − g₂B − g₃`, with roots `e₁, e₂, e₃`.
- `n = 2`: `F = ℘² − (B/3)℘ + B²/9 − g₂/4` and `R(B) = (B² − 3g₂)(4B³ − 9g₂B + 27g₃)/81`, with
  leading coefficient `4/81 = 4/3⁴`; its roots are `±√(3g₂)` and `−3e_i`, Gesztesy–Holden's band
  edges `E = −B` (p. 62).
- `n = 3, 4`: `R` has degree `7` and `9` and leading coefficient `4/15⁴` and `4/105⁴`, exactly.
- Negative control: Gesztesy–Holden's `R_{2n+1}` is monic in `z = −B`; reading the leading
  coefficient as `4` for all `n` (WW's monic-in-`℘` normalization of `F` does not make `R` monic)
  fails already at `n = 2`.

*Needs:* 1.3; Mathlib `PeriodPair.weierstrassP`, `PeriodPair.derivWeierstrassP_sq`; Tau Ceti
`PeriodPair.weierstrassZeta`; ModularCurvesPartII §1.4a.

### 5.2 The roots of the invariant are the polynomial eigenvalues

Sources: Whittaker–Watson §23.7, p. 571 (case (I)); Gesztesy–Holden Vol. I, Example 1.32, pp. 61–63;
DLMF §29.12(i), p. 690, and 29.2.6–29.2.9, p. 685.

Prove:
- **the roots** (`lameHermiteInvariant_eq_zero_iff`): for `0 < k < 1`, `τ = iK′/K` and
  `L = UpperHalfPlane.periodPair τ`, the zeros of `B ↦ lameHermiteInvariant L n B` are exactly the
  `2n + 1` numbers `(2K)²(n(n + 1)(1 + k²)/3 − h)` for `h ∈ {a^j_n : j ≤ n} ∪ {b^j_n : 1 ≤ j ≤ n}`;
  in particular `R` has `2n + 1` simple real roots.

If `R(B) = 0`, 5.1 gives a solution with `Λ² = F(℘)`; by Whittaker–Watson's case (I) argument (p.
571) `F` is a square times some of `℘ − e_i`, so `Λ` is a Lamé polynomial in the variable of 1.3,
and 1.3 with 4.1 identifies `h`. Conversely a Lamé polynomial `E` gives `Λ` with `Λ² = F(℘)` (the
product `E · E`), so `R(B) = 0`. There are `2n + 1` distinct such `h` (4.1), and `R` has degree
`2n + 1`, so all roots are simple.

**Checks.**
- `n = 2`, `k² = ½` (`g₂ = (2K)⁴`, `g₃ = 0`): the roots of `R` in units of `(2K)²` are
  `−√3, −3/2, 0, 3/2, √3`; the map `h ↦ 3 − h` sends `3 − √3, 3/2, 3, 9/2, 3 + √3` (4.1) to
  `√3, 3/2, 0, −3/2, −√3`.
- `n = 1`, `k² = 0.3`: `h = 2(1 + k²)/3 − e_i/(2K)² = 0.3, 1, 1.3 = a⁰_1, b¹_1, a¹_1`.
- `n = 0`: `R(B) = 4B`, root `B = 0`, `h = 0 = a⁰_0` with `E = 1`.

*Needs:* 1.3, 4.1, 5.1.

### 5.3 Coexistence

Sources: DLMF 29.3.5–29.3.6, p. 685; Whittaker–Watson §23.7, pp. 571–572; Gesztesy–Holden Vol. I,
§1.6, p. 115 (Ince's result of 1940, that the Lamé potential is finite-band exactly for integer
order).

Prove:
- **coexistence and the sign of the gaps** (`lame_coexistence`): for `n ∈ ℕ` and `m > n`,
  `a^m_n = b^m_n` (29.3.5); and for `ν ≥ −½` not in `{0, 1, …, m − 1}`,
  `(a^m_ν − b^m_ν) · ν(ν − 1)⋯(ν − m + 1) > 0` (29.3.6);
- for `ν = n` and `m > n`, every solution with `h = a^m_n` has period `4K` (if `m` is odd) or `2K`
  (if `m` is even).

Coexistence: let `h = a^m_n` with `m > n`. By 5.2, `h` is not a polynomial eigenvalue, so `R(B) ≠ 0`
and the Hermite–Halphen solutions `Λ_±` of 5.1 are independent. On the line of 1.3 they are Floquet
solutions with multipliers `ρ^{±1}` over the real period `2K`, because `X = F(℘)` is `2K`-periodic
there. Since `h` is a periodic or antiperiodic eigenvalue (2.2), `ρ = ±1`, so both `Λ_±` are
periodic or antiperiodic and every solution is; then `h` is a double root of `Δ ∓ 2` and belongs to
both families, so `a^m_n = b^m_n` by 2.2.

The sign 29.3.6 is an adaptation; DLMF states it without proof, and the route here has three steps.
(i) *No other coexistence*: if `ν ∉ ℤ`, `a^m_ν ≠ b^m_ν` for every `m ≥ 1`. DLMF 29.3.6 contains it;
Gesztesy–Holden, p. 115, record only Ince's weaker statement that for `ν ∉ ℤ` the potential is not
finite-band, so that infinitely many of the gaps are open. In the complex plane the coefficient
`k² sn²` has the periods `2K` and `2iK′` and one singular point `iK′` per period cell (1.1), with
exponents `−ν` and `ν + 1`. The loop around the puncture of the punctured torus is the commutator of
the two period loops, so if the monodromy along `2K` is `±1` (coexistence), the local monodromy at
`iK′` is the identity; but its eigenvalues are `e^{∓2πiν}`, which are `1` only for `ν ∈ ℤ`. For
`ν = n` and `1 ≤ m ≤ n`, `a^m_n ≠ b^m_n` because both are polynomial eigenvalues and 4.1 makes them
distinct. (ii) Hence, for fixed `ν ≥ −½` outside `{0, …, m − 1}`, `a^m_ν − b^m_ν` has no zero in
`0 < k < 1`, and its sign does not depend on `k`. (iii) The sign at small `k`: at `k = 0`,
`a^m = b^m = m²` (3.3), and degenerate perturbation theory in the basis `cos mφ`, `sin mφ` of the
trigonometric form 29.2.4 splits the pair at order `k^{2m}` by
`c_m k^{2m} ∏_{i<m} (ν − i)(ν + i + 1)` with `c_m > 0` (the product of the `m` off-diagonal
couplings over the unperturbed gaps, as for Mathieu's `a_m − b_m` in SpecialFunctionsMathieu
7.1–7.2); for `ν ≥ −½` the factors `ν + i + 1` are positive. This step also uses the strict ordering
being decided at the first order where the pair splits, which is where `ν ≥ −½` enters.

**Checks.**
- `ν = 2`, `k² = ½`: `a³ − b³ = 6 · 10⁻¹⁴` and `a⁴ − b⁴ = 0` to the same accuracy; `ν = 3`:
  `a⁴ = b⁴ = 14.84551 49228`.
- `ν = 1.5`, `k² = ½`: `a¹ − b¹ = 0.939` (product `1.5`), `a² − b² = 0.0673` (product `0.75`),
  `a³ − b³ = −1.70 · 10⁻³` (product `−0.375`); the signs agree for `m = 1, …, 7`, and likewise at
  `(ν, k²) = (−0.3, ½)` and `(0.5, ¼)`.
- `c₁ = ½`: at `k = 0.05`, `(a¹ − b¹)/(½k²ν(ν + 1)) = 1.000000` for `ν = 0.5, −0.3, 1.5`; at
  `ν = −0.3`, `k² = ½` already `a¹ − b¹ = −0.0522` against `½k²ν(ν + 1) = −0.0525`.
- Negative control: without the restriction `ν ≥ −½` the factor `ν + i + 1` can be negative; at
  `ν = −1.3` (equivalent to `ν = 0.3` by `ν ↦ −ν − 1`) the product `ν` for `m = 1` is `−1.3`, while
  `a¹ − b¹` has the sign of `0.3 > 0`.

*Needs:* 2.2, 4.1, 5.1, 5.2.

### 5.4 Stability and the finite-gap property

Sources: DLMF §29.9, p. 690; Gesztesy–Holden Vol. I, §1.6, (1.295), p. 111, and p. 115 (Ince's
result); SpecialFunctionsMathieu 2.5.

Prove:
- **the instability intervals** (`lame_stability`): for `ν ∉ ℤ`, the equation has an unbounded
  solution if and only if `h ≤ a⁰_ν` or `h` lies in a closed interval with endpoints `a^m_ν`,
  `b^m_ν`, `m ≥ 1`; for `ν = n ∈ ℕ`, if and only if `h ≤ a⁰_n` or `h ∈ [b^m_n, a^m_n]` for some
  `1 ≤ m ≤ n`;
- for `ν = n`, the closure of the set of stable `h` is
  `[a⁰, b¹] ∪ [a¹, b²] ∪ ⋯ ∪ [a^{n−1}, b^n] ∪ [a^n, ∞)`: `n` bounded bands and a half-line, whose
  `2n + 1` edges are the polynomial eigenvalues (the finite-gap property, Gesztesy–Holden (1.295)
  for the Lamé potential `n(n + 1)℘(x + ω₃)`).

The stability criterion is SpecialFunctionsMathieu 2.5 for the rescaled equation (`|Δ| < 2` stable,
`|Δ| > 2` unstable), with the boundary cases: at a simple root of `Δ ∓ 2` there is an unbounded
solution, at a double root (coexistence) every solution is periodic. The intervals between `a^m` and
`b^m` are the gaps of 2.2; for `ν ∉ ℤ` they are nondegenerate by 29.3.6, and for `ν = n` they are
degenerate exactly for `m > n` by 5.3.

**Checks.**
- `ν = 2`, `k² = ½`: `Δ(1.4) = −0.5353` (band `(a⁰, b¹)`), `Δ(2) = −5.0934` (gap `(b¹, a¹)`),
  `Δ(4) = 1.4567` (band), `Δ(4.6) = 2.0175` (gap `(b², a²)`), `Δ(6) = 0.3400`, and
  `Δ(8.13733 15032) = −2.0000000000` at the closed gap `a³ = b³`, with `Δ(8.3) = −1.9859`.
- `ν = 1.5`, `k² = ½`: `Δ(7.497) = −2.0000004` between `a³ = 7.49622` and `b³ = 7.49791` (an open
  gap of width `1.7 · 10⁻³`), and `|Δ| < 2` at `7.495` and `7.499`.
- Negative control: for `ν = 2` the condition `h ≤ a⁰ ∨ h ∈ uIcc (a^m) (b^m)` with all `m ≥ 1` would
  list `h = a³ = b³` as unstable, but there every solution is bounded.

*Needs:* 2.2, 5.3; SpecialFunctionsMathieu 2.5.

### Examples

- `ν = 1`, `k² = ½`: the stable set is `(½, 1) ∪ (3/2, ∞)`; the Lamé potential `2k² sn²` has one
  gap, and `R(B) = 4B³ − g₂B − g₃` is the elliptic curve of Gesztesy–Holden's genus-one case.

### Dependencies

Layers 1–4; SpecialFunctionsMathieu 2.5; ModularCurvesPartII §1.4a; Mathlib `PeriodPair`; Tau Ceti
`PeriodPair.weierstrassZeta`.

## Layer 6: ellipsoidal harmonics and integral equations

### 6.1 Ellipsoidal coordinates and ellipsoidal harmonics

Sources: Whittaker–Watson §§23.1–23.33, pp. 536–554, and §23.5, pp. 563–564; Dassios §1.2,
(1.24)–(1.34), pp. 8–13, §2.4, pp. 45–47, §4.1, pp. 70–72, §4.3, p. 77, and §4.4, pp. 78–79; DLMF
§29.18, pp. 693–694.

Prove:
- the ellipsoidal coordinates `(ρ, μ, ν)` with `0 ≤ ν² ≤ h₃² ≤ μ² ≤ h₂² ≤ ρ²` of Dassios
  (1.24)–(1.31) are a diffeomorphism of the open first octant onto the open coordinate box, and the
  Laplacian in these coordinates separates (Dassios §2.2, p. 42, and §2.4) into three copies of
  Dassios's form 1.2 with `A = −n(n + 1)` and a common `B`;
- **the interior harmonics**: for a Lamé polynomial `E` of degree `n` in Dassios's form,
  `E(ρ)E(μ)E(ν)` is the restriction of a harmonic polynomial of degree `n` in `x₁, x₂, x₃`, and the
  `2n + 1` of them span the harmonic polynomials of degree `n` modulo those of lower degree
  (Whittaker–Watson §§23.2, 23.45, pp. 537, 560; Dassios (4.1)–(4.25), pp. 70–72);
- the exterior harmonics with the Lamé functions of the second kind of 4.4 (Dassios (4.65)–(4.68),
  p. 77);
- the sphero-conal separation of DLMF 29.18(i) and the limit `h₃, h₂ → 0` that turns ellipsoidal
  into spherical harmonics (Dassios Problem 3.3, p. 67; SpecialFunctionsLegendre 3.3).

**Checks.**
- `n = 1`: the three interior harmonics are `x₁, x₂, x₃` up to factors.
- `n = 0`: `E = 1`, `B = 0`, the constant harmonic.
- Negative control: `E(ρ)E(μ)E(ν)` with `E` of one type and the factor of another (`ρ` of class `K`,
  `μ` of class `L`) is not a polynomial in `x`.

*Needs:* 1.2, 4.1, 4.4; SpecialFunctionsLegendre 3.3.

### 6.2 Orthogonality

Sources: DLMF §29.14, 29.14.1–29.14.3, p. 692; Dassios §4.5, Theorems 4.1–4.4, pp. 79–86.

Prove:
- **the double orthogonality** (`lame_double_orthogonal`): for Lamé polynomials `P`, `P′` of type
  `u` with `(n, h) ≠ (n′, h′)`, the integral below vanishes, where `sn²(K + it, k) = dn(t, k′)⁻²`
  (DLMF 29.14.1–29.14.3);

```text
∫₀^K ∫₀^{K′} (dn(t, k′)⁻² − sn²(s, k)) P(sn² s) P(dn(t, k′)⁻²) P′(sn² s) P′(dn(t, k′)⁻²) dt ds = 0
```

- the same for each of the other seven types, with the type factors on the segment `K + it` (DLMF
  §29.14, online for the other types; Dassios Theorem 4.1);
- the surface ellipsoidal harmonics are orthogonal on each ellipsoid `ρ = const` with Dassios's
  weight `l_ρ` (Dassios Theorem 4.1, (4.87), p. 81), and complete (4.91), p. 82;
- for two Lamé functions of the same class, with separation constants `p`, `p′` (that of 1.2,
  `B = (h₃² + h₂²)p`, which is Dassios's `p_n^m` in (4.96)): if they have the same degree and
  `p ≠ p′`, then `∫_{h₃}^{h₂} E E′ /√((μ² − h₃²)(h₂² − μ²)) dμ = 0`; if they have the same
  separation constant `p = p′` and `n ≠ n′`, the same holds with the weight `μ²` (Dassios
  Theorem 4.2, (4.93)–(4.95), p. 83); and the analogues on `[0, h₃]` for the same class and parity
  (Theorem 4.3, (4.101)–(4.102), p. 84).

The double orthogonality for type `u` is the case `a = k⁻²`, `γ = δ = ε = ½` of the double
orthogonality of Heun polynomials, SpecialFunctionsHeun 6.2: with `ξ = sn²(s, k)` on `(0, 1)` and
`ξ = dn(t, k′)⁻²` on `(1, a)` its weight `ρ` gives `ρ(ξ) dξ = 2k ds` and `ρ(ξ) dξ = 2k dt`, so its
integral is `4k²` times the one displayed, and `q = −ah/4` (1.2) turns its hypothesis
`(n₁, q₁) ≠ (n₂, q₂)` into `(n, h) ≠ (n′, h′)` (Heun degree `n/2`). The statement in elliptic
variables is kept here as the form 6.1 uses. An alternative route is Green's identity for the
product `E(s)E(K + it)`, which by 1.2 is the separated form of a harmonic function on an ellipsoid
(Dassios's proof of Theorem 4.1, pp. 81–82); it also gives the other seven types.
The one-dimensional relations are the Lagrange identity on `[h₃, h₂]`, whose boundary terms vanish
for two functions of the same class (Dassios (4.98)–(4.99), p. 84).

**Checks.**
- `k² = ½`: for `uE` with `ν = 0` (`P = 1`) and `ν = 2` (`P = 1 − (h/2)ξ`, `h = 3 ∓ √3`), the three
  mixed integrals are below `3 · 10⁻¹⁵`, and the squared norms are `π`, `0.09022`, `17.50`.
- Without the weight `dn⁻² − sn²` the mixed integrals of `ν = 0` with `ν = 2` are `0.1721` and
  `2.397`.
- Negative control for the class hypothesis: on the segment (`μ = h₃/dn(t, k′)`,
  `dμ/√((μ² − h₃²)(h₂² − μ²)) = dt/h₂`), the `n = 1` functions of classes `K` (`sE`), `L` (`cE`),
  `M` (`dE`) give `∫₀^{K′} sE·cE dt = √2`, `∫₀^{K′} sE·dE dt = 1`, `∫₀^{K′} cE·dE dt = √2 − 1` at
  `k² = ½`, none zero, while the two type-`u` functions of degree `2` give `6 · 10⁻¹⁶`.
- Negative control for the hypothesis `p = p′` of the weighted relation: at `k² = ½`, the class-`K`
  functions `E = 1` (`n = 0`) and `E = 1 − (h/2)ξ` (`n = 2`, `h = 3 − √3`, `ξ = dn(t, k′)⁻²`) have
  different separation constants, and `∫₀^{K′} ξ E₀E₂ dt = 0.05982`, `∫₀^{K′} E₀E₂ dt = 0.14153`;
  only the combination `h · 0.14153 − 6k² · 0.05982` of the Lagrange identity vanishes (below
  `10⁻³⁰`).

*Needs:* 1.2, 4.1, 6.1; SpecialFunctionsHeun 6.2.

### 6.3 Whittaker's integral equation

Sources: Whittaker–Watson §23.6, pp. 564–566, and §23.61, pp. 566–567; DLMF §29.8, pp. 689–690.

Prove:
- **the integral equation** (`lame_integral_equation`): for a Lamé polynomial `E` of type `u` (`n`
  even) or `s` (`n` odd), there is `c ≠ 0` with `c E(α) = ∫_{−2K}^{2K} P_n(k sn α sn θ) E(θ) dθ` for
  all real `α`;
- the corresponding equations for the other types (Whittaker–Watson §23.61, pp. 566–567, with
  kernels in `cn`, `dn` products).

The lemma on p. 565: `P_n(k sn α sn θ)` is annihilated by `∂²_α − ∂²_θ − n(n + 1)k²(sn² α − sn² θ)`,
by Legendre's equation for `P_n`. Two integrations by parts over the period `4K` show that the
integral solves Lamé's equation in `α` with the same `h`, with the parity of `E`; by 4.1 it is a
multiple of `E`. The multiple is nonzero because `P_n` has nonzero coefficients for all powers
`≡ n (mod 2)` and `∫ sn^j E ≠ 0` for some such `j ≤ n`.

**Checks.**
- `k² = ½`: the ratio `∫ P_n(k sn α sn θ)E(θ)dθ / E(α)` at `α = 0.3, 0.9, 1.5` is `−2.43150 00100`
  for `uE` with `h = 3 − √3`, `1.05637 08600` for `h = 3 + √3`, and `2.84783 46400` for `sE₁ = sn`.
- Negative control: for `cE₁ = cn` (type `c`, not covered) the integral vanishes identically, so no
  `c ≠ 0` exists.
- Negative control: the kernel `P₁` in place of `P₂` for `uE₂` gives the zero integral.

*Needs:* 4.1; Mathlib `Polynomial.shiftedLegendre`.

### Examples

- `n = 1`: `E = sn`, `∫_{−2K}^{2K} k sn α sn² θ dθ = k sn α ∫ sn²`, so
  `c = k ∫_{−2K}^{2K} sn² θ dθ`; at `k² = ½` this is `2.84783 464`.

### Dependencies

Layers 1–5; SpecialFunctionsHeun 6.2; SpecialFunctionsLegendre 3.3.

## Downstream consumers

- Ellipsoidal wave functions (the Lamé wave equation DLMF 29.11.1) and spheroidal functions, which
  extend Layer 3 by a quartic term and would consume the Hill theory and the Lamé functions here.
- Roadmaps on finite-gap potentials and the KdV hierarchy, for which the Lamé potential `n(n + 1)℘`
  is the basic example of Layer 5.
- Boundary-value problems for Laplace's equation in ellipsoidal geometry (Dassios Chs. 6–10), which
  consume the harmonics and orthogonality of Layer 6.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Lamé's equation and its forms** (1.1–1.3).
2. **The eigenvalues** (2.1–2.2).
3. **Lamé functions** (3.1–3.4).
4. **Lamé polynomials** (4.1–4.4).
5. **Hermite's solution and the finite-gap property** (5.1–5.4).
6. **Ellipsoidal harmonics and integral equations** (6.1–6.3).

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the README
attaches to it; it is not an exhaustive acceptance test, and the other headlines are targets of the
same standing, stated in prose. The `**Checks.**` and `### Examples` of each layer are statements to
prove; they test the conventions on explicit values.

**Inputs.** Cases of the targets that Mathlib, Tau Ceti or a roadmap on main already proves are
inputs, not targets:
- the real Jacobi functions, their derivatives, real periods and values at `K`: Tau Ceti
  `TauCeti.Real.jacobiSn` and its lemmas, consumed in Layers 1–4 and 6;
- the complete integral `K` with its positivity: Tau Ceti `TauCeti.Real.legendreK`, and its
  continuity and logarithmic singularity at `k = 1`: EllipticIntegrals 2.1 and 3.1, consumed in 3.3;
- Weierstrass's `℘`, `℘′` and the differential equation: Mathlib `PeriodPair.weierstrassP`,
  `PeriodPair.derivWeierstrassP_sq`; Weierstrass's `ζ`: Tau Ceti `PeriodPair.weierstrassZeta`;
  Weierstrass's `σ`: ModularCurvesPartII §1.4a; consumed in Layer 5;
- the Ferrers and Legendre functions, their hypergeometric forms and spherical harmonics:
  SpecialFunctionsLegendre 1.1, 3.3, 4.3, consumed in 3.3, 3.4 and 6.1;
- the spectral theorem for Hermitian matrices (Mathlib `Matrix.IsHermitian.eigenvalues`) and the
  Legendre polynomials (Mathlib `Polynomial.shiftedLegendre`), consumed in 4.2 and 6.3;
- recessive solutions of three-term recurrences and Pincherle's theorem: AsymptoticExpansions §12.1
  and SpecialFunctionsEiLiErfIncompleteGamma §4.1, consumed in 3.2.

**Auxiliary results owned here**, which the layers need and which neither Mathlib, Tau Ceti nor a
consumed roadmap provides in this form:
- `sn(K − x) = sn(K + x)` for real `x`, and the reflection of solutions about `K` (1.1, 2.1);
- the Wronskian of two solutions of the Weierstrass form and Appell's equation for their products
  (5.1);
- `σ′/σ = ζ` off the lattice, for the sigma function of ModularCurvesPartII §1.4a and Tau Ceti's
  `ζ`, for the Hermite–Halphen form in 5.1;
- the monodromy of a second-order equation on a punctured torus (the loop around the puncture is the
  commutator of the period loops) and the degenerate perturbation expansion of `a^m − b^m` at
  `k = 0` (5.3).

**What it does not own:**
- *Hill's equation.* Floquet theory, the discriminant, the interlacing theorem, the separated
  Sturm–Liouville problems and the stability criterion belong to SpecialFunctionsMathieu (its 1.1,
  2.1, 2.5, 3.1, 3.3); this roadmap applies them to `lameHillPotential` and restates none of them.
- *Heun's equation.* The algebraic form of Lamé's equation as Heun's equation, the polynomial
  criterion, the reality of Heun polynomial eigenvalues and their double orthogonality belong to
  SpecialFunctionsHeun (its 2.4, 4.1–4.3, 6.2); 1.2, 4.1 and 6.2 consume them.
- *The Jacobi functions of a complex variable.* Their poles, periods, the imaginary transformation,
  the limits in `k` and the relation to `℘` belong to SpecialFunctionsJacobiElliptic (its 2.1–2.3,
  3.4–3.5, 4.1, 7.1); 1.1, 1.3, 3.3 and 4.4 consume them.
- *Weierstrass's `σ`.* The lattice sigma function, its product, oddness, normalization `σ′(0) = 1`,
  zeros and `−(σ′/σ)′ = ℘` belong to ModularCurvesPartII (its §1.4a); 5.1 consumes them.
- *Ferrers and Legendre functions, spherical harmonics.* These belong to SpecialFunctionsLegendre
  (its 1.1, 3.3, 4.3); 3.3, 3.4 and 6.1 consume them.
- *Mathieu functions.* `ce_m`, `se_m` belong to SpecialFunctionsMathieu (its 4.1); 3.3 consumes them
  in the Mathieu limit.
- *Three-term recurrences.* Recessive solutions belong to AsymptoticExpansions (its §12.1) and
  minimal solutions with Pincherle's theorem to SpecialFunctionsEiLiErfIncompleteGamma (its §4.1);
  3.2 applies them to the Fourier recurrence.
- *Spectral theory of Schrödinger operators.* The spectrum of `−d²/dx² + V` on `L²(ℝ)` for periodic
  `V` is not defined here; 5.4 states the finite-gap property through boundedness of solutions.

**The boundary in one sentence:** this roadmap owns Lamé's equation in its forms, the eigenvalues
`a^m_ν`, `b^m_ν` and the Lamé functions for real `ν`, their Fourier series and limits, the Lamé
polynomials with their counts, matrices and zeros, Hermite's product and invariant with the
finite-gap property, ellipsoidal harmonics with their orthogonality, and the integral equations; it
consumes Hill's equation from SpecialFunctionsMathieu, Heun's equation from SpecialFunctionsHeun,
the complex Jacobi functions and `℘` relation from SpecialFunctionsJacobiElliptic, Ferrers functions
and spherical harmonics from SpecialFunctionsLegendre, `σ` from ModularCurvesPartII, `K` from
EllipticIntegrals, and the recurrence theory from AsymptoticExpansions and
SpecialFunctionsEiLiErfIncompleteGamma.

## Exact supplier contracts

### From SpecialFunctionsMathieu

- Conventions and 1.1: `IsHillSolution Q λ w`, `hillWI Q λ`, `hillWII Q λ` for any `Q : ℝ → ℝ`;
  `nthLeast` (Conventions, 3.1), copied with their bodies.
- 2.1: `hillDiscriminant Q λ = w_I(π, λ) + w_II′(π, λ)`, copied.
- 2.5: for continuous `π`-periodic `Q` and real `λ`, `|Δ(λ)| < 2` implies all solutions bounded and
  `|Δ(λ)| > 2` implies all nontrivial solutions unbounded.
- 3.1 (auxiliary there): the separated Sturm–Liouville problems on `[0, L]` with the four boundary
  conditions have real simple eigenvalues increasing to `∞`, the `m`-th eigenfunction having `m`
  zeros in `(0, L)`; applied with `L = K`, `V = −Q`.
- 3.3: `realRootCount`, `hillPeriodicEigenvalue`, `hillAntiperiodicEigenvalue` (copied), and the
  interlacing theorem and the eigenvalue enumeration, with hypotheses `Continuous Q` and
  `Function.Periodic Q π`, applied to `lameHillPotential ν k` with 1.1.
- 4.1: `ce_m`, `se_m` (in prose, for 3.3).

### From SpecialFunctionsHeun

- 2.4: Lamé's equation is Heun's with `a = k⁻²`, `q = −ah/4`, `α = −ν/2`, `β = (ν + 1)/2`,
  `γ = δ = ε = ½`, under `ξ = sn²(z, k)` with Tau Ceti's real `sn` on `(0, K)`.
- 4.1: the polynomial matrix and the polynomial criterion (hypotheses `a ≠ 0`, `γ ∉ {0, −1, …}`).
- 4.2: the reality of the polynomial eigenvalues (hypotheses real `a > 1`, `δ > 0`, `β > 0`).
- 4.3: the eight classes and the F-homotopic reduction.
- 6.2: for real `a > 1` and `γ, δ, ε > 0`, Heun polynomials `w₁`, `w₂` of degrees `n₁`, `n₂`, with
  `q₁`, `q₂` eigenvalues of the matrices of its 4.1 and `(n₁, q₁) ≠ (n₂, q₂)`, satisfy
  `∫₀¹ ∫₁^a (t − s) ρ(s) ρ(t) w₁(s) w₁(t) w₂(s) w₂(t) dt ds = 0`,
  `ρ(x) = x^{γ−1}|1 − x|^{δ−1}|a − x|^{ε−1}` (for 6.2, with `γ = δ = ε = ½`).

### From SpecialFunctionsJacobiElliptic

Its Conventions apply: `sn`, `cn`, `dn` are meromorphic functions of `u` for complex `k` with the
junk values of its Conventions, and `k`, `k′` come from the theta functions; for real `0 < k < 1`
its 3.4 reconciles them with Tau Ceti's real functions.
- 2.1: the quarter-period table, in particular `k sn(u + iK′) = ns(u)`.
- 2.2: the periods `4K`, `2iK′` of `sn`.
- 2.3: the poles of `sn` at `2pK + (2q + 1)iK′` with residues.
- 3.4: the reconciliation with `TauCeti.Real.jacobiSn` for real `k`, `k² < 1`.
- 3.5: `sn(u, k) → tanh u` as `k → 1`.
- 4.1: Jacobi's imaginary transformation.
- 7.1: the relation between `sn` and `℘`: `(2K)⁻² ℘_L(u/(2K)) = ns²(u) − (1 + k²)/3` for
  `L = UpperHalfPlane.periodPair τ`, with the half-period values `(2 − k²)/3`, `(2k² − 1)/3`,
  `−(1 + k²)/3`.

### From [SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md)

- 1.1: the Ferrers function `𝖯^μ_ν` on `(−1, 1)` and the Legendre function `P^μ_ν` off `(−∞, 1]`.
- 3.3: spherical harmonics as harmonic polynomials.
- 4.3: the hypergeometric forms in other variables (for 29.5.5–29.5.6 and the kernel of 3.4).

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- §12.1 in its tail form: for `w(n + 2) + f(n)w(n + 1) + g(n)w(n) = 0` with Poincaré expansions of
  `f`, `g` in `n⁻¹`, `g₀ ≠ 0` and distinct characteristic roots `|ρ₁| < |ρ₂|`, a recessive solution
  exists, is unique up to a factor and has `w(n + 1)/w(n) → ρ₁`; every independent solution has
  ratio `→ ρ₂` (for 3.2).

### From SpecialFunctionsEiLiErfIncompleteGamma

- §4.1: minimal solutions of a three-term recurrence with nonzero `a n`, and Pincherle's theorem:
  the continued fraction converges to `−f(1)/f(0)` for the minimal solution `f` with `f(0) ≠ 0`
  (for 3.2).

### From [ModularCurvesPartII](../ModularCurvesPartII/README.md)

- §1.4a: for any period pair `L`, the lattice sigma function
  `σ(z) = z ∏ (1 − z/λ) exp(z/λ + z²/(2λ²))` over the nonzero lattice points `λ`, normally
  convergent, entire and odd, with `σ′(0) = 1`, simple zeros exactly at the lattice points, and
  `−(σ′/σ)′ = ℘` off the lattice (for 5.1).

### From [EllipticIntegrals](../EllipticIntegrals/README.md)

- 2.1: continuity of `K` on `[0, 1)`.
- 3.1: `K(k) − log(4/k′) → 0` as `k → 1⁻`.

### From Tau Ceti

- `TauCeti.Real.jacobiSn`, `jacobiCn`, `jacobiDn`, `jacobiAm`, with `jacobiSn_antiperiodic`,
  `hasDerivAt_jacobiSn`, `jacobiSn_legendreK`, `jacobiSn_zero_modulus` (hypotheses `k² < 1` where
  stated).
- `TauCeti.Real.legendreK` with `legendreK_pos` (`k² < 1`).
- `UpperHalfPlane.periodPair τ`, with periods `τ` and `1`.
- `PeriodPair.weierstrassZeta`.

### From Mathlib

- `PeriodPair.weierstrassP`, `PeriodPair.derivWeierstrassP`, `PeriodPair.derivWeierstrassP_sq`.
- `Polynomial.shiftedLegendre`, `Matrix.charpoly`, `Matrix.IsHermitian.eigenvalues`,
  `Polynomial.roots`, `Real.sign`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- *Lamé functions with imaginary periods and Lamé–Wangerin functions* (DLMF §§29.10, 29.17(iii)),
  beyond the transformation used in 4.4.
- *Algebraic Lamé functions* for half-odd-integer `ν` (DLMF §29.17(ii); Whittaker–Watson §23.7, p.
  570, on Brioschi, Halphen and Crawford).
- *Asymptotics* of the eigenvalues and functions as `ν → ∞` (DLMF §§29.7, 29.16).
- *The Lamé wave equation* and ellipsoidal wave functions (DLMF §29.11).
- *The KdV hierarchy and the isospectral torus* of the Lamé potential, and the Treibich–Verdier
  potentials (Gesztesy–Holden Vol. I, Ch. 1, §1.6).
- *Heine–Stieltjes theory* for general Fuchsian equations, of which 4.3 is the Lamé case.
- *Boundary-value problems in ellipsoidal geometry* (Dassios Chs. 6–10).

## References

- G. Dassios, *Ellipsoidal Harmonics: Theory and Applications*, Encyclopedia of Mathematics and its
  Applications 146, Cambridge University Press, 2012: §1.2, pp. 8–13; §§2.2–2.4, pp. 42–47; Ch. 3,
  pp. 49–69; Ch. 4, §§4.1–4.5, pp. 70–86; Ch. 5, §5.1, pp. 89–93, and §5.5, pp. 104–106; App. E, pp.
  402–404.
- F. Gesztesy and H. Holden, *Soliton Equations and Their Algebro-Geometric Solutions*, Vol. I,
  Cambridge Studies in Advanced Mathematics 79, Cambridge University Press, 2003: §1.2, p. 23;
  Example 1.32, pp. 61–63; §1.6, pp. 107–108, 111 and 115.
- G. Kristensson, *Second Order Differential Equations: Special Functions and Their Classification*,
  Springer, 2010, Problem 2.4, p. 26, and §8.6.1, p. 159.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 (2026-09-15), Chapter 29,
  <https://dlmf.nist.gov/29>. Equation numbers refer to this release; the 2010 printed Handbook (F.
  W. J. Olver, D. W. Lozier, R. F. Boisvert and C. W. Clark, eds., Cambridge University Press),
  Chapter 29 by H. Volkmer, pp. 683–695, has the same numbering.
- A. Ronveaux (ed.), *Heun's Differential Equations*, Oxford University Press, 1995, Part A: §1.4,
  pp. 10–11; §1.5, pp. 11–13; §6.2, pp. 67–69.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XXIII, pp. 536–577.

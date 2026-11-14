# Roadmap: Legendre and related functions

**Summary.** This roadmap builds the theory of the Legendre functions of Chapter 14 of the NIST
*Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a library.
Mathlib has the Legendre polynomials, as `Polynomial.shiftedLegendre`, and nothing of the
Legendre functions of non-integer degree or order. This roadmap defines the Ferrers functions
`𝖯^μ_ν`, `𝖰^μ_ν` and the associated Legendre functions `P^μ_ν`, `Q^μ_ν`, `𝑸^μ_ν` for all complex
degree `ν` and order `μ`, as principal branches in the complex variable, through the regularized
Gauss function `𝐅` of [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md):

```text
𝖯^μ_ν(x) = ((1 + x)/(1 − x))^{μ/2} 𝐅(ν + 1, −ν; 1 − μ; ½ − ½x)                    (DLMF 14.3.1)
P^μ_ν(x) = ((x + 1)/(x − 1))^{μ/2} 𝐅(ν + 1, −ν; 1 − μ; ½ − ½x)                    (DLMF 14.3.6)
𝑸^μ_ν(x) = π^{1/2} (x² − 1)^{μ/2} / (2^{ν+1} x^{ν+μ+1}) 𝐅(½ν + ½μ + 1, ½ν + ½μ + ½; ν + 3/2; 1/x²)
                                                                     (DLMF 14.3.7, 14.3.10)
```

The roadmap covers:
- the definitions, their holomorphy in the variable and the parameters, the Legendre and
  associated Legendre equations, the symmetries in degree and order, and Abel's identity;
- the recurrence relations and the derivatives;
- the values at `x = 0`, the alternative hypergeometric representations and the relations to
  Gegenbauer and Jacobi functions, including DLMF 15.9.16–15.9.23;
- the special values (elementary and elliptic), the integer orders and degrees with the Legendre
  polynomials, their Rodrigues formulas and generating functions, and the behaviour at the
  singularities `±1` and `∞`;
- the Wronskians, the connection formulas with Whipple's formula, and the values on the cut;
- the derivatives with respect to degree and order and the continued fractions;
- the integral representations (Mehler–Dirichlet, Laplace, Heine, Neumann), the orthogonality
  relations, the integrals of products and Barnes' integral;
- the trigonometric expansions, the addition theorems, Christoffel's formulas, Dougall's
  expansion and Heine's formula;
- the zeros on `(−1, 1)` and `(1, ∞)`;
- the toroidal and conical functions, Dunster's conical function `𝖰̂`, and the generalized
  associated Legendre equation;
- the spherical harmonics `Y_{l,m}`: orthonormality, the addition theorem, Herglotz's generating
  function, their harmonic polynomials and their completeness in `L²` of the sphere.

**This roadmap is most of DLMF Chapter 14, not all of it.** The formula ranges are in the table
under [Scope and ownership](#scope-and-ownership). The rest of the chapter is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement): the
uniform asymptotic approximations of §§14.15, 14.20(vii)–(ix) and 14.26, the generalized
Mehler–Fock transformation of §14.20(vi), the branches off the principal sheet of §14.24, the
zeros of §14.27, and the applications and computation sections.

The roadmap rests on Mathlib, Tau Ceti and two roadmaps. It consumes the principal branch of `𝐅`
and its theory from SpecialFunctionsHypergeometric, which every layer uses. For the continued
fractions alone (6.2) it consumes Pincherle's theorem from
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md).

Suggested home: `TauCeti/Analysis/SpecialFunctions/Legendre/`, beside the Gauss hypergeometric
function of SpecialFunctionsHypergeometric.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definitions, the equations and analytic properties** (DLMF §14.2(i)–(ii), §14.3(i)–(ii),
   §14.21(i), 14.3.15, 14.9.3–14.9.5, 14.9.11, 14.9.13–14.9.14).
2. **Recurrence relations and derivatives** (DLMF §14.10 for the functions of the first kind).
3. **Values at `x = 0`, alternative representations, other functions** (DLMF §14.3(iii)–(iv)
   without 14.3.15–14.3.16 and 14.3.20, §14.5(i), 15.9.16–15.9.23).
4. **Special values, integer order and degree, singularities** (DLMF §14.5(ii)–(vi),
   §§14.6–14.8).
5. **Wronskians, connection formulas and values on the cut** (DLMF §14.2(iii)–(iv), §14.9 without
   14.9.3–14.9.5, 14.9.11, 14.9.13–14.9.14, §14.21(ii)–(iii), 14.3.16, 14.3.20, 14.23.1–14.23.6,
   and 14.10.1–14.10.7 for the functions of the second kind).
6. **Derivatives with respect to degree and order, continued fractions** (DLMF §§14.11, 14.14).
7. **Integral representations and integrals** (DLMF §§14.12, 14.17, 14.25).
8. **Trigonometric expansions and sums** (DLMF §§14.13, 14.18, 14.28).
9. **Zeros** (DLMF §14.16).
10. **Toroidal and conical functions, generalizations** (DLMF §14.19, §14.20(i), (iii)–(v),
    14.23.7, §14.29).
11. **Spherical harmonics** (DLMF §14.30).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 14.3.1, 14.3.6–14.3.7, 14.3.9–14.3.10, 14.3.12–14.3.14, the statements of §§14.2(ii) and 14.21(i) | Definitions, holomorphy, reality (Layer 1). |
| 14.2.1–14.2.2, 14.21.1, the exponents of §14.2(iii) | The equations, Abel's identity (1.3). |
| 14.3.4–14.3.5, 14.3.8, 14.3.15, 14.9.3–14.9.5, 14.9.11, 14.9.13–14.9.14 | Euler-transformed forms and symmetries in degree and order (1.2, 1.4). |
| 14.10.1–14.10.7 | Recurrences and derivatives, on `(−1, 1)` and on the cut plane (Layer 2; for `𝖰^μ_ν` and `Q^μ_ν`, 5.2). |
| 14.5.1–14.5.4, 14.3.2, 14.3.11, 14.3.17–14.3.19, 14.3.21–14.3.23, 15.9.16–15.9.23 | Values at `0`, alternative hypergeometric representations, Gegenbauer and Jacobi functions (Layer 3). |
| 14.5.5–14.5.30, 14.6.1–14.6.8, 14.7.1–14.7.22, 14.8.1–14.8.16 | Special values, integer order and degree, Legendre polynomials, behaviour at the singularities (Layer 4). |
| 14.2.3–14.2.11, the statements of §§14.2(iii) and 14.21(ii)–(iii), 14.9.1–14.9.2, 14.9.6–14.9.10, 14.9.12, 14.9.15–14.9.17, 14.3.16, 14.3.20, 14.23.1–14.23.6 | Wronskians, numerically satisfactory pairs, connection formulas, Whipple, values on the cut (Layer 5). |
| 14.11.1–14.11.5, 14.14.1–14.14.4 | Parameter derivatives, continued fractions (Layer 6). |
| 14.12.1–14.12.14, 14.17.1–14.17.20, 14.25.1–14.25.2 | Integral representations, orthogonality, integrals (Layer 7). |
| 14.13.1–14.13.4, 14.18.1–14.18.9, 14.28.1–14.28.2 | Fourier series, addition theorems, sums (Layer 8). |
| 14.16.1 and the statements of §14.16(ii)–(iii) | Zeros on `(−1, 1)` and `(1, ∞)` (Layer 9). |
| 14.19.1–14.19.8, 14.20.1–14.20.10, 14.23.7, 14.29.1 | Toroidal and conical functions, `𝖰̂`, generalized equation (Layer 10). |
| 14.30.1–14.30.8, 14.30.8_5, 14.30.9–14.30.11, 14.30.11_5, 14.30.12–14.30.13 | Spherical harmonics (Layer 11). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- the Legendre polynomials: Mathlib's `Polynomial.shiftedLegendre`, its Rodrigues formula
  `Polynomial.factorial_mul_shiftedLegendre_eq`, its coefficients
  `Polynomial.coeff_shiftedLegendre` and its symmetry `Polynomial.shiftedLegendre_eval_symm`;
- 15.9.7 for `𝐅`, the terminating Gauss series of `Pₙ`, from SpecialFunctionsHypergeometric 9.1.

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti provides:

| Result | Target |
|---|---|
| Abel's identity for 14.21.1 and the span criterion: two solutions with nonvanishing Wronskian span all solutions on a connected open set | 1.3 |
| The branch identities behind the definitions: `((1 + z)/(1 − z))^{μ/2}` and `(1 − z²)^{−μ/2}` are holomorphic on the doubly cut plane, `((z + 1)/(z − 1))^{μ/2}`, `(z − 1)^{μ/2} (z + 1)^{μ/2}` and `z^{ν+μ+1}` on `ℂ \ (−∞, 1]`, and each is the principal value on the real interval | 1.1 |
| Sturm's separation and comparison theorems for `((1 − x²) y′)′ + q(x) y = 0` on an open subinterval of `(−1, 1)` or of `(1, ∞)`, and the continuity of the zeros of a solution in its parameters | 9.1 |
| Adams's linearization of `Pₘ Pₙ` in Legendre polynomials | 7.4 |
| The Abelian estimate: for `Re μ > −1` and `g` integrable on `(0, 1)` and continuous at `1`, the integral `I(σ) = ∫₀¹ x^σ (1 − x)^μ g(x) dx` exists for `σ ≥ 0` and `σ^{μ+1} I(σ) → Γ(μ + 1) g(1)` as `σ → +∞` (so `I(σ) ∼ Γ(μ + 1) g(1) σ^{−μ−1}` when `g(1) ≠ 0`). Proof: split at `1 − δ`; the part over `(0, 1 − δ)` is `O((1 − δ)^σ)`, and on `(1 − δ, 1)` the substitution `x = e^{−u/σ}` and dominated convergence give `Γ(μ + 1) g(1)` | 7.3 |

**What it does not own:**
- The principal branch of `𝐅` and its theory (SpecialFunctionsHypergeometric), the Legendre
  polynomials as polynomials (Mathlib) and the complete elliptic integrals (Tau Ceti).
- Pincherle's theorem (SpecialFunctionsEiLiErfIncompleteGamma 4.1), consumed for §14.14.
- The theory of harmonic polynomials in `n` variables (Tau Ceti's `MvPolynomial.harmonicSubmodule`
  and its decomposition) and the spectral theory of the Laplace–Beltrami operator on `Sᵐ`
  ([RiemannianGeometry](../RiemannianGeometry/README.md) R8). Layer 11 consumes the first, and
  the completeness clause of RiemannianGeometry R8.2 at `m = 2`. It owns the explicit basis
  `Y_{l,m}` of `S²` in the coordinates `(θ, φ)` and its completeness in those coordinates, which
  11.3 deduces from R8.2 by the change of variables.
- The uniform asymptotics (§§14.15, 14.20(vii)–(ix), 14.26), the generalized Mehler–Fock
  transformation (§14.20(vi)), branches off the principal sheet (§14.24), the zeros in the
  complex plane and on the left cut (§14.27), and the formulas of other chapters through Legendre
  functions. See the last section for these.

**An object defined elsewhere:** AutomorphicSpectralTheory (§§0.35–0.38 of that roadmap) defines
the Legendre function of the second kind `Q_{s−1}(t)` for `t > 1` and `Re s > 0` by Heine's
integral `∫₀^∞ (t + (t² − 1)^{1/2} cosh u)^{−s} du`, with its asymptotics as `t → 1+` and
`t → ∞`. `associatedLegendreQ ν μ` here is its continuation to all `ν`, `μ` and to `U`, and 7.2
proves that the two agree. Neither roadmap consumes the other.

**The boundary in one sentence:** this roadmap owns the principal branches of `𝖯^μ_ν`, `𝖰^μ_ν`,
`P^μ_ν`, `Q^μ_ν` and `𝑸^μ_ν` for all complex degree and order, Dunster's `𝖰̂` and the spherical
harmonics `Y_{l,m}`, and everything in DLMF Chapter 14 stated through them, `𝐅`, `Γ`, `ψ`,
elementary functions, the Legendre polynomials and the complete elliptic integrals, except the
uniform asymptotics, the Mehler–Fock transformation, the branches off the principal sheet, the
zeros of §14.27 and the applications; it consumes `𝐅` from SpecialFunctionsHypergeometric and
Pincherle's theorem from SpecialFunctionsEiLiErfIncompleteGamma.

## Conventions

- **Names.** The functions live in `Complex`, beside `Complex.regularizedGaussHypergeometric` of
  SpecialFunctionsHypergeometric, with degree first, then order, then argument:
  - `Complex.ferrersP ν μ z` for `𝖯^μ_ν(z)`;
  - `Complex.ferrersQ ν μ z` for `𝖰^μ_ν(z)`;
  - `Complex.associatedLegendreP ν μ z` for `P^μ_ν(z)`;
  - `Complex.associatedLegendreQ ν μ z` for `Q^μ_ν(z)`;
  - `Complex.olverLegendreQ ν μ z` for Olver's `𝑸^μ_ν(z)`.

  Dunster's conical function is `Real.conicalQHat μ τ x` for `𝖰̂^μ_{−½+iτ}(x)` (10.2), and the
  spherical harmonic is `sphericalHarmonic l m θ φ` for `Y_{l,m}(θ, φ)` (11.1). DLMF's
  `𝖯_ν = 𝖯^0_ν`, `𝖰_ν`, `P_ν`, `Q_ν` and `𝑸_ν` are the functions at `μ = 0`, not new
  definitions. The Legendre polynomial `Pₙ(z)` is Mathlib's `Polynomial.shiftedLegendre n`, mapped
  to `ℂ` and evaluated at `(1 − z)/2`, as in SpecialFunctionsHypergeometric 9.1. The prefix
  `legendre` is not used for these functions: Tau Ceti's `TauCeti.Real.legendreK` and its
  siblings are Legendre's elliptic integrals.

  `Suggested.lean` also uses these local names:
  - `eulerIntegral` and `IsEulerContinuation`: the supplier's construction of `𝐅`, copied
    locally;
  - `legP n z`: the Legendre polynomial `Pₙ(z)` above;
  - `cfIndex`: the index of the convergent that is read when a continued fraction terminates;
  - `sphereMeasure`: the measure `sin θ dθ dφ` on `(0, π) × (0, 2π)`.
- **Domains.** The Ferrers functions are holomorphic on the doubly cut plane
  `D = {z | 1 − z ∈ slitPlane ∧ 1 + z ∈ slitPlane} = ℂ \ ((−∞, −1] ∪ [1, ∞))`, and the associated
  Legendre functions on `U = {z | z − 1 ∈ slitPlane} = ℂ \ (−∞, 1]`. These sets are written out,
  not named. DLMF's statements on `−1 < x < 1` are the statements at `(x : ℂ)` for real `x` in
  that interval, and those on `1 < x < ∞` likewise. Off `D`, respectively `U`, the values of the
  definitions are junk that no theorem uses; DLMF's values on the cuts are limits (5.3).
  Defining the Ferrers functions on `D` rather than on `(−1, 1)` is how DLMF §14.23 extends them
  to complex argument, and it makes the identity theorem available in the variable.
- **The definitions.** With `𝐅 = Complex.regularizedGaussHypergeometric`:

```text
ferrersP ν μ z = ((1 + z)/(1 − z))^{μ/2} 𝐅(ν + 1, −ν; 1 − μ; (1 − z)/2)                       (14.3.1)
ferrersW₁ ν μ z = 2^μ Γ(½ν + ½μ + ½) Γ(½ν − ½μ + 1)⁻¹ (1 − z²)^{−μ/2} 𝐅(−½ν − ½μ, ½ν − ½μ + ½; ½; z²)
ferrersW₂ ν μ z = 2^μ Γ(½ν + ½μ + 1) Γ(½ν − ½μ + ½)⁻¹ z (1 − z²)^{−μ/2} 𝐅(½ − ½ν − ½μ, ½ν − ½μ + 1; 3/2; z²)
ferrersQ ν μ z = −½π sin(½(ν + μ)π) ferrersW₁ ν μ z + ½π cos(½(ν + μ)π) ferrersW₂ ν μ z   (14.3.12–14.3.14)
associatedLegendreP ν μ z = ((z + 1)/(z − 1))^{μ/2} 𝐅(ν + 1, −ν; 1 − μ; (1 − z)/2)            (14.3.6)
olverLegendreQ ν μ z = π^{1/2} (z − 1)^{μ/2} (z + 1)^{μ/2} (2^{ν+1} z^{ν+μ+1})⁻¹
                         𝐅(½ν + ½μ + 1, ½ν + ½μ + ½; ν + 3/2; z⁻²)                     (14.3.7, 14.3.10)
associatedLegendreQ ν μ z = e^{μπi} Γ(ν + μ + 1) olverLegendreQ ν μ z                       (14.3.10)
```

  `ferrersQ` is defined by DLMF's even–odd form 14.3.12, not by 14.3.2: 14.3.2 divides by
  `sin μπ` and DLMF takes a limit at integer `μ`, while 14.3.12 is holomorphic in `(ν, μ)` away
  from `ν + μ ∈ {−1, −2, …}`, where DLMF leaves `𝖰^μ_ν` undefined; 14.3.2 is a theorem (3.2).
  Where DLMF leaves a function undefined, the definitions take the junk value produced by
  Mathlib's `Γ` at its poles, and no theorem uses it. `P^{−μ}_ν` (14.3.9) is
  `associatedLegendreP ν (−μ)`.
- **Powers.** Every power is principal (`Complex.cpow`) and is the factor DLMF prints, with the
  continuation that DLMF §14.21(i) prescribes (principal on `(1, ∞)` and continuous on `U`).
  Each factor above is holomorphic on its domain (1.1). The one factor that is not a principal
  power of its printed base is `(z² − 1)^{μ/2}` in 14.3.7 and wherever else it occurs with `z`
  in `U`: it is `(z − 1)^{μ/2} (z + 1)^{μ/2}`. The principal `(z² − 1)^{μ/2}` jumps across the
  imaginary axis, where `z² − 1 < 0`. Likewise `(z² − 1)^{1/2}` in §§14.25 and 14.28 is
  `(z − 1)^{1/2} (z + 1)^{1/2}`. On `D`, `(1 − z²)^{−μ/2}` is the principal power, and
  `(1 − x²)^{μ/2}`, `(sin θ)^μ` and `(sinh ξ)^μ` with a positive base are the principal (real)
  powers.
- **Reciprocal Gamma factors** are `(Gamma ·)⁻¹`, which vanish at the poles, so a formula with `Γ`
  only in denominators holds for all parameters. A `Γ` in a numerator carries the hypothesis that
  its argument is not a pole. `ψ` is Mathlib's `Complex.digamma`, `ψ′` is
  `deriv Complex.digamma`, `γ` is `Real.eulerMascheroniConstant`, and `(a)ₙ` is
  `(ascPochhammer ℂ n).eval a`.
- **Equations are not predicates.** A solution of 14.21.1 on an open set `V` is stated with
  `DifferentiableOn ℂ w V` and the equation at each point of `V`, with `deriv` and `deriv^[2]`.
  On real intervals the derivative is the complex derivative of the function at the real point.
  The Wronskian `𝒲{f, g}` is written out as `f z * deriv g z − deriv f z * g z`.
- **Limits and asymptotics.** `x → 1−` is the filter `𝓝[<] 1` on `ℝ`, and `x → 1+` is `𝓝[>] 1`.
  DLMF's `f ∼ g` is `Asymptotics.IsEquivalent`, and `O(·)` is `Asymptotics.IsBigO`. A value on
  the cut, `f(x ± i0)`, is the limit of `f(x ± iε)` as `ε → 0+`, along `𝓝[>] (0 : ℝ)`.
- **Series and integrals.** An infinite sum is `HasSum` when it converges absolutely, and the limit
  of the partial sums over `Finset.range N` otherwise (the conditionally convergent Fourier series
  of 8.1). Integrals over intervals are Lebesgue integrals with an `IntegrableOn` hypothesis or
  conclusion; every integral of this chapter that the roadmap states converges absolutely under
  the hypotheses given.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.regularizedGaussHypergeometric a b c z` (`𝐅`) and `Complex.gaussHypergeometric`
  (`F = Γ(c) 𝐅`), principal branches on `1 − z ∈ slitPlane`, with the junk value `0` off it.
- 1.3: agreement with Mathlib's series on `‖z‖ < 1`, and 15.2.3_5
  (`𝐅(a, b; −n; z) = (a)ₙ₊₁ (b)ₙ₊₁ zⁿ⁺¹ 𝐅(a + n + 1, b + n + 1; n + 2; z)`), for 1.4.
- 1.4: holomorphy in `z` on the cut plane and in each parameter, the conjugation symmetry, and the
  identity principle on the cut plane. Every extension from an interval to `D` or `U` here, and
  from a parameter region to all parameters, is 1.4 with the identity theorem.
- Layer 2: the derivatives and contiguous relations 15.5.1–15.5.21, for Layer 2.
- 3.1: the hypergeometric equation 15.10.1, for 1.3; 3.4: Riemann's equation 15.11.1 and the
  transformation 15.11.8, for the exponents and the prefactor in 1.3 and for 10.3.
- 4.2: Gauss's sum and the limit of `𝐅` at `z = 1`, for Layer 4; 4.3: the series on its circle of
  convergence, for 8.1.
- Layer 5: the Euler and Pfaff transformations 15.8.1 and the jump across the cut 15.2.3 (5.1),
  the logarithmic limiting cases 15.8.8–15.8.12 (5.2) and the connection formulas
  15.10.11–15.10.36 (5.3–5.4), for 1.2, 1.4 and Layers 3–6.
- 6.1: Euler's integral 15.6.1, for 7.1–7.2.
- Layer 7: the quadratic transformations 15.8.13–15.8.30 and the values 15.4.26–15.4.30, for
  Layers 3 and 6.
- 9.1: 15.9.7, `shiftedLegendre_eval_eq_ordinaryHypergeometric`, for 4.3.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- Its Conventions and 4.1: the continued fraction `contFrac a b`, a `GenContFract ℂ` with head
  `0`, and its convergence (eventually nonzero `GenContFract.dens` and convergence of
  `GenContFract.convs`); Pincherle's theorem, as stated there: a continued fraction converges if
  and only if its three-term recurrence has a minimal solution `f` with `f(0) ≠ 0`, and its value
  is `−f(1)/f(0)` in that roadmap's normalization; the reduction-of-order criterion for minimality;
  and termination at a zero partial numerator. 6.2 applies it to 14.10.6 in the order and to
  14.10.3 in the degree.

### From [RiemannianGeometry](../RiemannianGeometry/README.md)

- R8.2 (spectral completeness and eigenspace identification), its completeness clause at `m = 2`:
  on the unit round sphere `S²` of `EuclideanSpace ℝ (Fin 3)`, with Tau Ceti's round metric
  `TauCeti.sphereRoundMetric` and its Riemannian volume, the restrictions of the harmonic
  homogeneous polynomials of all degrees (`MvPolynomial.harmonicSphereRestriction`) span a dense
  subspace of `L²(S²)`, and the spaces of different degrees are orthogonal. For 11.3. R8.2 states
  this over `ℝ`; the complex `L²` follows by taking real and imaginary parts.

### From Tau Ceti

- **Complete elliptic integrals.** `TauCeti.Real.legendreK`, `TauCeti.Real.legendreEc`,
  `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`), for 14.5.20–14.5.27 in 4.1.
- **Harmonic polynomials.** `MvPolynomial.laplacian`, `MvPolynomial.harmonicSubmodule`,
  `MvPolynomial.homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow` (the harmonic
  decomposition), `MvPolynomial.finrank_harmonicSubmodule_add_two` and
  `MvPolynomial.sphereEval` (`TauCeti/RingTheory/MvPolynomial/Harmonic.lean`,
  `TauCeti/Analysis/MvPolynomial/Sphere.lean`), for Layer 11; and Laplace's equation for the
  evaluation of a polynomial, `MvPolynomial.laplacian_eval_euclidean` and
  `MvPolynomial.harmonicOnNhd_eval_euclidean_iff`
  (`TauCeti/Analysis/MvPolynomial/Laplacian.lean`), stated for real polynomials and applied to
  the real and imaginary parts of `p_{l,m}`, for 11.3.
- **Residue theorem.** `TauCeti.Contour.classicalResidueTheorem_circle`
  (`TauCeti/Analysis/Contour/Residue/Theorem.lean`), for meromorphic functions on a closed disc,
  for Dougall's expansion in 8.3.
- **Round sphere and Riemannian volume.** `TauCeti.sphereRoundMetric`
  (`TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean`), `TauCeti.riemannianVolume` and the
  integration-in-coordinates theorem `TauCeti.setIntegral_riemannianVolume_of_subset`
  (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`), for the change of variables
  in 11.3.

### From Mathlib

- **Gamma and digamma.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_ne_zero`,
  `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_mul_Gamma_one_sub` (reflection),
  `Complex.Gamma_mul_Gamma_add_half` (duplication), `Complex.betaIntegral`,
  `Complex.digamma`, `Real.eulerMascheroniConstant`.
- **Polynomials.** `ascPochhammer`, `Polynomial.shiftedLegendre` and the lemmas listed as inputs,
  `Polynomial.derivative`, `Polynomial.iterate_derivative_mul`.
- **Holomorphic functions.** `Complex.slitPlane`, `Complex.cpow`, `Complex.log`,
  `DifferentiableOn.analyticOnNhd`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
  `IsOpen.is_const_of_deriv_eq_zero` and Cauchy's integral formula.
- **Analysis.** `intervalIntegral`, `MeasureTheory.integral` on `Set.Ioi`, Fubini, dominated
  convergence, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, the change-of-variables
  formula `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`,
  `Asymptotics.IsEquivalent`, `Asymptotics.IsBigO`, `HasSum`, `fourierBasis`, `HilbertBasis`, `Laplacian.laplacian` (`Δ`, from
  `InnerProductSpace.instLaplacian`), and
  Tannery's theorem `tendsto_tsum_of_dominated_convergence`.
- **Continued fractions.** `GenContFract`, `GenContFract.convs`, `GenContFract.dens`.

## How to read the build

Layer 1 defines the functions through `𝐅` and proves that they are holomorphic on `D` or `U` and
in the parameters, that they solve the Legendre equations, and the symmetries that follow from
the Euler transformation and from 15.2.3_5. Every identity is proved on a real interval or a disk
where the series converge, or for parameters in an open region, and then extended by the
identity theorem in the variable (1.4 of SpecialFunctionsHypergeometric) and by holomorphy in
the parameters; this is how Layer 2 proves the recurrences from the contiguous relations and
Layer 3 the alternative representations from the quadratic transformations. Abel's identity
(1.3) replaces the general theory of linear differential equations: a Wronskian is `C/(1 − z²)`,
and `C` is read off from the behaviour at a singular point (Layer 4), which gives Layer 5's
Wronskians; each connection formula then expresses a solution in a fundamental pair and fixes the
two coefficients from the values at `x = 0` (Layer 3) or the behaviour at `±1` and `∞`
(Layer 4). Layers 6–11 apply Layers 1–5. The `**Checks.**` and `### Examples` of each layer are
statements to prove; they test the conventions on explicit values. Every decimal value in them
was computed independently of the formula it checks.

## Layer 1: definitions, the equations and analytic properties

### 1.1 Definitions

The definitions of [Conventions](#conventions): `ferrersP`, `ferrersW₁`, `ferrersW₂`, `ferrersQ`,
`associatedLegendreP`, `olverLegendreQ` and `associatedLegendreQ`. The targets are that each power
in them is holomorphic on its domain and is the principal real power on the real interval:
- on `D`, `(1 + z)/(1 − z) ∈ slitPlane` (the Möbius map sends `D` onto `slitPlane`) and
  `1 − z² ∈ slitPlane`, and the arguments `(1 − z)/2` and `z²` of `𝐅` lie in its cut plane;
- on `U`, `(z + 1)/(z − 1)`, `z − 1`, `z + 1` and `z` lie in `slitPlane`, and the arguments
  `(1 − z)/2` and `z⁻²` of `𝐅` lie in its cut plane (`z⁻² ∈ [1, ∞)` only for `z ∈ [−1, 1]`).

**Checks.**
- `ferrersP`: `𝖯^0_1(z) = z` on `D` (14.5.6);
  `𝖯^{1/2}_{0.3}(cos 1) = (2/(π sin 1))^{1/2} cos 0.8 = 0.60599 70103 6…` (14.5.11);
  `𝖯^{0.4}_{0.3}(0.25) = 0.51489 44336 58…`.
- `ferrersQ`: `𝖰^0_0(0.5) = ½ ln 3 = 0.54930 61443 3…` (14.5.7); `𝖰^1_0(x) = −(1 − x²)^{−1/2}`
  on `(−1, 1)`, an integer order where 14.3.2 is `0/0` (14.6.2 with 14.5.7);
  `𝖰^{0.4}_{0.3}(0.25) = −0.99301 77856 9…`.
- `associatedLegendreP`: `P^0_1(z) = z` on `U`;
  `P^{1/2}_{0.3}(cosh 1) = (2/(π sinh 1))^{1/2} cosh 0.8 = 0.98436 60263 4…` (14.5.15);
  `P^{0.4}_{0.3}(1.5 + 0.7i) = 0.99012 91609 9… + 0.01524 91041 2… i`.
- `olverLegendreQ`: `𝑸^0_0(x) = ½ ln((x + 1)/(x − 1))` for `x > 1` (14.5.9);
  `𝑸^1_0(z) = ((z − 1)^{1/2} (z + 1)^{1/2})⁻¹` on `U` (14.6.5), which is
  `−i/√5 = −0.44721 35955 0… i` at `z = 2i` and continuous there, while the principal
  `(z² − 1)^{1/2}` would give `+i/√5` on the side `Re z < 0`; `𝑸^{0.4}_{0.3}(2) = 0.35518 67693 2…`.
- `associatedLegendreQ`: `Q^0_1(2) = ln 3 − 1 = 0.09861 22886 6…` (14.5.10, 14.3.10);
  `Q^{0.4}_{0.3}(2) = 0.09973 10496 1… + 0.30694 06095 3… i`, not real although `x > 1`
  (§14.2(ii)); at `ν + μ = −1` the value is the junk `0`.

*Needs:* SpecialFunctionsHypergeometric Conventions and 1.4.

### 1.2 Analytic properties and symmetries

- **Holomorphy** (DLMF §14.21(i) and, for the principal branches, the penultimate paragraph of
  §14.24): `ferrersP ν μ` is holomorphic on `D` and `associatedLegendreP ν μ`, `olverLegendreQ ν μ`
  on `U`; at each fixed point of the domain they are entire in `ν` and entire in `μ`
  (`differentiable_ferrersP_degree`); `ferrersQ` and `associatedLegendreQ` are holomorphic in the
  variable and in each parameter on the set where `ν + μ ∉ {−1, −2, …}`.
- **Conjugation and reality** (§14.2(ii), §14.21(i)): `ferrersP`, `ferrersQ`,
  `associatedLegendreP` and `olverLegendreQ` satisfy `f(ν̄, μ̄, z̄) = conj f(ν, μ, z)` on their
  domains (`ferrersP_conj`), so `𝖯^μ_ν(x)`, `𝖰^μ_ν(x)` are real for real `ν, μ` and
  `x ∈ (−1, 1)`, and `P^μ_ν(x)`, `𝑸^μ_ν(x)` for `x > 1`. The conical function
  `𝖯^μ_{−½+iτ}(x)` is real for real `μ, τ` and `x ∈ (−1, 1)`, by conjugation and 14.9.5.
  `Q^μ_ν(x)` is real for `x > 1` only when `e^{μπi} Γ(ν + μ + 1)` is (Check of 1.1).
- **Symmetries.** 14.9.5 and 14.9.11 (`𝖯^{±μ}_{−ν−1} = 𝖯^{±μ}_ν`, `P^{±μ}_{−ν−1} = P^{±μ}_ν`),
  from the symmetry of `𝐅` in its first two parameters; 14.9.14 (`𝑸^{−μ}_ν = 𝑸^μ_ν`,
  `olverLegendreQ_neg_order`), from the Euler transformation 15.8.1 of the `𝐅` in 14.3.7, on
  `(1, ∞)` and then on `U` by the identity theorem.

*Needs:* 1.1; SpecialFunctionsHypergeometric 1.4, 5.1.

### 1.3 The equations and Abel's identity

- 14.2.1, 14.2.2 and 14.21.1: on `D`, `ferrersP ν (±μ)` and `ferrersQ ν μ` solve 14.21.1
  (`ferrersP_legendreEquation`); on `U`, `associatedLegendreP ν (±μ)`, `olverLegendreQ ν μ`,
  `olverLegendreQ (−ν − 1) μ` and `associatedLegendreQ ν μ` do
  (`olverLegendreQ_legendreEquation`). Each is the hypergeometric equation 15.10.1 for its `𝐅`
  after the change of variable and the removal of the power prefactor (15.11.8); for `ferrersQ`
  the variable is `z²`.
- The exponents (§14.2(iii), as corrected in DLMF 1.0.22): 14.21.1 is Riemann's equation 15.11.1
  (in its form with one singular point at `∞`) with singular points `1`, `−1`, `∞` and exponent
  pairs `{½μ, −½μ}`, `{½μ, −½μ}`, `{ν + 1, −ν}`.
- Abel's identity: for solutions `f`, `g` of 14.21.1 on a connected open set `V` avoiding `±1`,
  `(1 − z²) 𝒲{f, g}(z)` is constant on `V`; and the span
  criterion: if `f₁`, `f₂` solve 14.21.1 on `V` with `𝒲{f₁, f₂}` nowhere zero, every solution on
  `V` is `α f₁ + β f₂` with constants `α`, `β`.

*Needs:* 1.1–1.2; SpecialFunctionsHypergeometric 3.1, 3.4.

### 1.4 Euler-transformed forms and integer order

- 14.3.4 and 14.3.8 for `m : ℕ` and all `ν`, from 14.3.1, respectively 14.3.6, at `μ = m` by
  15.2.3_5. The ratio `Γ(ν + m + 1)/Γ(ν − m + 1)` is written as the polynomial `(ν − m + 1)_{2m}`,
  which equals it wherever both Gamma values are defined, so that the formulas hold for every `ν`;
- 14.9.3 and 14.9.13 for `m : ℕ` and `ν ∉ {m − 1, m − 2, …, −m}`, the zeros of
  `(ν − m + 1)_{2m}`, and in the form `(ν − m + 1)_{2m} 𝖯^{−m}_ν = (−1)^m 𝖯^m_ν`
  (`ferrersP_neg_nat_order`), and likewise for `P`, for every `ν`. At the zeros the printed right
  side is a pole of `Γ` times `𝖯^m_ν = 0`, and the further target there is
  `𝖯^{−m}_ν(x) = 2^{−m} (1 − x²)^{m/2} 𝐅(ν + m + 1, m − ν; m + 1; ½ − ½x)`, valid for every `ν`,
  and likewise for `P^{−m}_ν`. Both are proved from 14.3.1 at `μ = −m` and 14.3.4, by the Euler
  transformation;
- 14.9.4 for `ν ∉ {m − 1, m − 2, …}`, from 14.3.12–14.3.14 at `μ = ±m` by the Euler
  transformation of the two `𝐅` in `z²`;
- 14.3.5, from 14.3.1 at `μ = −m` and 14.9.3;
- 14.3.15 on `U`, from 14.3.9 by the Euler transformation 15.8.1.

**Checks.**
- 14.9.3 at `(ν, m) = (2, 1)`: `𝖯^{−1}_2(x) = −(1/6) 𝖯^1_2(x) = ½ x (1 − x²)^{1/2}`.
- 14.3.4 at `m = 1`, `ν = 0`: `𝖯^1_0 = 0`, since `Γ(ν − m + 1)⁻¹ = Γ(0)⁻¹ = 0`.
- 14.3.15 and 14.3.9 at `(ν, μ, x) = (0.3, 0.4, 2)`: both give
  `P^{−0.4}_{0.3}(2) = 1.01402 04011 46…`.

*Needs:* 1.1–1.2; SpecialFunctionsHypergeometric 1.3, 5.1.

### Examples

- `𝖯^0_ν(x) → 1` as `x → 1−` for every `ν`, since `𝐅(ν + 1, −ν; 1; 0) = 1`.
- The pair `𝖯^0_{0.3}`, `𝖰^0_{0.3}` has `(1 − x²) 𝒲 = Γ(1.3)/Γ(1.3) = 1` (14.2.4, 5.1), so it
  spans the solutions of 14.2.1 on `(−1, 1)` by 1.3.

### Dependencies

SpecialFunctionsHypergeometric Layers 1, 3, 5.

## Layer 2: recurrence relations and derivatives

### 2.1 Recurrences in degree and order

DLMF §14.10 for the functions of the first kind:
- 14.10.1–14.10.5 for `𝖯^μ_ν` on `(−1, 1)`, and on `D` (`ferrersP_recurrence_14_10_3`);
- 14.10.6–14.10.7 for `P^μ_ν` on `(1, ∞)`, and on `U` with
  `(z² − 1)^{1/2} = (z − 1)^{1/2} (z + 1)^{1/2}`;
- 14.10.3–14.10.5 for `P^μ_ν` on `U` (§14.21(iii)).

They hold for all `ν`, `μ`, and they are the contiguous relations and the derivative formula of
`𝐅` (SpecialFunctionsHypergeometric Layer 2) after the substitution of 14.3.1 or 14.3.6. The same
relations for the functions of the second kind, which DLMF states after 14.10.5 and 14.10.7, are
targets of 5.2, where the connection formulas that carry them over are proved.

### 2.2 Derivatives

14.10.4–14.10.5 are the derivatives of `𝖯^μ_ν` (`hasDerivAt_ferrersP`), and the derivatives of
all five functions in the variable are holomorphic on the domains, by 1.2.

**Checks.**
- 14.10.3 at `(ν, μ, x) = (0.3, 0.4, 0.25)`:
  `1.9 𝖯^{0.4}_{2.3}(x) − 3.6x 𝖯^{0.4}_{1.3}(x) + 1.7 𝖯^{0.4}_{0.3}(x) = 0`, and the left side
  computed from the definition is `0` to working precision.
- 14.10.6 at `(ν, μ) = (1, 0)`: with `P^1_1(x) = (x² − 1)^{1/2}` (14.7.11) and `P^2_1 = 0`
  (14.7.16), it reads `0 + 2x − 2x = 0`.
- 14.10.4 at `(ν, μ) = (0, 0)`: `(1 − x²) · 0 = −𝖯_1(x) + x 𝖯_0(x) = −x + x`.

*Needs:* Layer 1; SpecialFunctionsHypergeometric Layer 2.

### Examples

- 14.10.3 at `(ν, μ) = (0, 0)`: `2𝖯₂(x) − 3x 𝖯₁(x) + 𝖯₀(x) = 0`, so `𝖯₂(x) = (3x² − 1)/2`.
- 14.10.4 at `(ν, μ) = (1, 0)`: `(1 − x²) 𝖯₁′(x) = −2𝖯₂(x) + 2x 𝖯₁(x) = 1 − x²`.

### Dependencies

Layer 1; SpecialFunctionsHypergeometric Layer 2.

## Layer 3: values at `x = 0`, alternative representations, other functions

### 3.1 Values at `x = 0`

14.5.1–14.5.4: `𝖯^μ_ν(0)`, `𝖯^μ_ν′(0)` for all `ν, μ`, and `𝖰^μ_ν(0)`, `𝖰^μ_ν′(0)` for
`ν + μ ∉ {−1, −2, −3, …}` (the constraint as corrected in DLMF 1.1.3) (`ferrersP_zero`).
14.5.1 is `𝐅(ν + 1, −ν; 1 − μ; ½)`, Bailey's value 15.4.30; 14.5.2 is 14.10.4 at `x = 0` with
14.5.1 at degree `ν + 1`; 14.5.3–14.5.4 are `w₁(ν, μ, 0)` and `w₂′(ν, μ, 0)`, read off from
14.3.13–14.3.14.

### 3.2 The even–odd representation and 14.3.2

- 14.3.11 (`ferrersP_eq_ferrersW`): `𝖯^μ_ν = cos(½(ν + μ)π) w₁ + sin(½(ν + μ)π) w₂` on `D`, for
  `ν + μ ∉ {−1, −2, …}`, where the numerator factors `Γ(½(ν + μ + 1))` of `w₁` and `Γ(½(ν + μ) + 1)`
  of `w₂` are finite. Both sides solve 14.21.1 on `D` (1.3); `w₁` is even and `w₂` odd, and `w₁(0)`,
  `w₂′(0)` are read off from 14.3.13–14.3.14. Comparing the values and derivatives at `0` with 3.1,
  through the reflection and duplication formulas of `Γ`, gives the coefficients. The span criterion
  of 1.3 then proves the identity where `𝒲{w₁, w₂} ≠ 0`, and holomorphy in the parameters extends it
  to all `ν + μ ∉ {−1, −2, …}`. At those excluded points the Lean values of `w₁`, `w₂` are Mathlib's
  junk `Γ = 0`, and the identity fails: at `(ν, μ, z) = (−1, 0, 0)` both are `0` while
  `𝖯_{−1}(0) = 1` (3.1).
- 14.3.2 (`ferrersQ_eq_div_sin`) for `μ ∉ ℤ` and `ν + μ ∉ {−1, −2, …}`, from 14.3.11 and 14.3.12
  and the same expansion of `𝖯^{−μ}_ν`; at `μ ∈ ℤ` DLMF's limit is `ferrersQ`, by holomorphy in
  `μ` (1.2).

### 3.3 Alternative hypergeometric representations

- 14.3.16 on `U`, for every `ν` (it carries `cos νπ` on the left): it is 14.9.12 written out
  through 14.3.7, and it is proved with 14.9.12 in 5.2;
- 14.3.17 on `U \ (1, ∞)`, and for `x > 1` as the limit of its right side from above and from
  below, which agree. On `U` its `𝐅(·; z²)` jumps across `(1, ∞)`, where `z²` lies on the cut of
  `𝐅`, and the two jumps cancel. The proof is a quadratic transformation of 15.8.13–15.8.21 composed
  with 14.3.9;
- 14.3.18 on `{z ∈ U | Re z > 0}`, where `1 − z⁻²` lies in the cut plane of `𝐅` and `z^{ν−μ}` is
  principal. On the imaginary axis `1 − z⁻² > 1` lies on the cut, and for `Re z < 0` the printed
  right side is a different function: at `(ν, μ) = (0.3, 0.4)` and `z = −0.5 + 0.5i`,
  `P^{−μ}_ν(z) = 0.81311 04837 0… + 0.57025 30920 8… i`, while the right side is
  `0.81005 65018 4… + 0.38835 58146 1… i`. The proof is a quadratic transformation composed with
  14.3.9;
- 14.3.19 on `U`, from 14.3.7 by the quadratic transformation 15.8.13 of `F(a, b; 2b; w)` at
  `w = 2/(1 − z)`, for which `(w/(2 − w))² = z⁻²`;
- 15.9.16–15.9.23, each on the region printed with it, with all functions principal: `𝐅` in
  terms of `P^μ_ν` (`regularizedGaussHypergeometric_eq_associatedLegendreP`). 15.9.22–15.9.23 hold
  with the upper signs for `Im z > 0` and the lower for `Im z < 0`, and there the arguments
  `±√z` and the powers `(z − 1)^{…}` are principal.

### 3.4 Gegenbauer and Jacobi functions

14.3.21–14.3.23, with the Gegenbauer function `C^{(λ)}_α(x)` and the Jacobi function
`φ^{(α,β)}_λ(t)` written out through their defining formulas 15.9.15 and 15.9.11 in terms of `F`,
not given Lean definitions. The removable singularities stated after 14.3.23 are targets: the
right sides of 14.3.21–14.3.22 extend holomorphically across `1 − 2μ ∈ {0, −1, …}` and
`ν + μ + 1 ∈ {0, −1, …}`, with the extended values equal to the left sides.

**Checks.**
- 14.5.1 at `(ν, μ) = (0.3, 0.4)`: `𝖯^{0.4}_{0.3}(0) = 0.36452 55054 05…`, both from the
  definition and from `2^μ π^{1/2}/(Γ(½ν − ½μ + 1) Γ(½ − ½ν − ½μ))`.
- 14.3.11 at `(ν, μ) = (1, 0)`: the coefficient of `w₁` is `cos(π/2) = 0`, and
  `w₂(1, 0, x) = Γ(3/2) x 𝐅(0, 3/2; 3/2; x²) = x = 𝖯_1(x)`.
- `ferrersW₁`: `w₁(ν, μ, 0) = 2^μ Γ(½ν + ½μ + ½)/(π^{1/2} Γ(½ν − ½μ + 1))`, which is
  `0.80293 64174 23…` at `(ν, μ) = (0.3, 0.4)`; `w₁(0, 0, z) = 1`; `w₁(ν, μ, −z) = w₁(ν, μ, z)`
  on `D`.
- `ferrersW₂`: `w₂(ν, μ, 0) = 0` and `w₂′(ν, μ, 0) = 2^μ Γ(½ν + ½μ + 1)/(Γ(3/2) Γ(½ν − ½μ + ½))`,
  which is `0.67416 06165 51…` at `(ν, μ) = (0.3, 0.4)`; `w₂(ν, μ, −z) = −w₂(ν, μ, z)` on `D`.
- The junk value at `ν + μ = −1`: `w₁(−1, 0, z) = w₂(−1, 0, z) = 0`, through `Γ(0) = 0` in `w₁`
  and `Γ(0)⁻¹ = 0` in `w₂`, while `𝖯_{−1}(z) = 1`, so 14.3.11 needs its hypothesis.
- 15.9.17 at `(a, c, z) = (0.3, 1.2, 0.5)`: `𝐅(0.3, 0.8; 1.2; 0.5)` and
  `2^{0.2} (0.5)^{−0.1} (0.5)^{−0.2} P^{−0.2}_{−0.6}(√2)` are both `1.24282 08654 77…`.

*Needs:* Layers 1–2; SpecialFunctionsHypergeometric Layer 7 (15.4.30, 15.8.13–15.8.21), 5.1.

### Examples

- 14.5.1 at `μ = 0`: `𝖯₁(0) = 0`, since `Γ(0)⁻¹ = 0`, and
  `𝖯₂(0) = π^{1/2}/(Γ(2) Γ(−½)) = −½`.

### Dependencies

Layers 1–2; SpecialFunctionsHypergeometric Layers 5, 7.

## Layer 4: special values, integer order and degree, singularities

### 4.1 Special values

- 14.5.5–14.5.10 and 14.5.28–14.5.30: the elementary values at `ν ∈ {0, 1, 2}`, `μ = 0`, on `D`
  and `U` with `ln` principal;
- 14.5.11–14.5.19 for `0 < θ < π` and `ξ > 0`: the half-odd orders and `μ = −ν`, with the sign of
  14.5.14 as corrected in DLMF 1.0.16;
- 14.5.20–14.5.27 for `0 < θ < π`, `ξ > 0`: the half-odd degrees through
  `TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc` at the moduli printed (DLMF's `K(k)`,
  `E(k)` of §19.2(ii)), from 14.3.1, 14.3.6, 14.3.7 and the hypergeometric forms 19.5.1–19.5.2 of
  `K` and `E` (Tau Ceti), combined with quadratic transformations
  (`ferrersP_neg_half_cos`).

### 4.2 Integer order

14.6.1–14.6.5 for `m : ℕ` (on `D` and `U`, with `(1 − z²)^{m/2}` and `(z² − 1)^{m/2}` as in
[Conventions](#conventions)), from 14.3.4, 14.3.8 and 15.5.1; 14.6.6–14.6.8 for `m ≥ 1` with the
`m`-fold iterated integrals written as nested interval integrals (14.6.6 with the Ferrers function,
as corrected in DLMF 1.0.28), from 14.6.1, 14.6.3 and 14.9.3 by induction on `m`.

### 4.3 Integer degree and Legendre polynomials

- 14.7.1 (`ferrersP_nat_eq_shiftedLegendre`): `𝖯_n(z) = P_n(z) = Pₙ(z)` for `n : ℕ` and all
  `z` in the domains, where `Pₙ` is Mathlib's polynomial as in [Conventions](#conventions), by
  15.9.7;
- 14.7.2–14.7.7: `𝖰_n` and `Q_n` with `W_{n−1}` given by 14.7.3 (14.7.2 on `(−1, 1)` is
  `ferrersQ_nat`), the identity 14.7.4 and the values 14.7.5, and `Q_n = n! 𝑸_n`;
- 14.7.8–14.7.15: the formulas of Rodrigues type, 14.7.13 being Mathlib's
  `factorial_mul_shiftedLegendre_eq` transported to `x`;
- 14.7.16 for `m > n`, and the statement before it: for even `m ≤ n`, `𝖯^m_n` and `P^m_n` are
  polynomials of degree `n`;
- 14.7.17–14.7.18, the reflections, for `n, m : ℕ` with `m ≤ n` in 14.7.18 (`𝖰^{±m}_n` defined);
- 14.7.19–14.7.22 with the conditions printed (for `−1 < x < 1`: `|h| < 1` in 14.7.19–14.7.20 and
  `|h| > 1` in 14.7.21; for `x > 1`: `|h| < x − (x² − 1)^{1/2}` in 14.7.19 and 14.7.22 and
  `|h| > x + (x² − 1)^{1/2}` in 14.7.21), and their complex forms of §14.21(iii) on `U`, with
  `|h| < min|z ± (z² − 1)^{1/2}|`, respectively `|h| > max|z ± (z² − 1)^{1/2}|`, as `HasSum`
  (`hasSum_ferrersP_nat_mul_pow`). 14.7.21, its form for `x > 1` and its complex form have the
  right side `h⁻¹ (1 − 2x h⁻¹ + h⁻²)^{−1/2}` with the principal power. It equals the printed
  `(1 − 2xh + h²)^{−1/2}` for `h > 1`. For `h < −1` the printed side has the wrong sign: the sum
  has the sign of `h` for real `h`. On `|h| > max|z ± (z² − 1)^{1/2}|` the base is
  `(1 − w/a)(1 − w/b)` with `w = h⁻¹`, `|w| < |a|, |b|` and `ab = 1`; each factor has positive real
  part, so the base never meets `(−∞, 0]` and the principal power is the continuous one.

**Checks.**
- 14.7.21 at `(x, h) = (0, −2)`: the sum `∑ 𝖯ₙ(0) (−2)^{−n−1}` is `−5^{−1/2} = −0.44721 35955 0…`,
  while the printed right side is `+5^{−1/2}`.

### 4.4 Behaviour at the singularities

14.8.1–14.8.16 with the conditions printed (14.8.1 is `ferrersP_isEquivalent_one`), as
`IsEquivalent` along `x → 1−`, `x → 1+`, `x → ∞`, and with `O(·)` as `IsBigO`; 14.8.3 and 14.8.9
with the error terms `O((1 − x) ln(1 − x))` and `O((x − 1) ln(x − 1))` as corrected in DLMF 1.1.5,
and 14.8.4–14.8.6 for `Re μ > 0`. 14.8.12–14.8.16 hold as `x → ∞` along `ℝ`, and on `U` as
`|z| → ∞` in `{Re z > 0}` (§14.21(iii)). The behaviour as `x → −1+`, which DLMF obtains from
these results and the connection formulas 14.9.8 and 14.9.10, is a target of 5.2. The proofs are:
the value of `𝐅` at argument `0` (14.8.1–14.8.2, 14.8.7–14.8.8, 14.8.15–14.8.16); its limit at
`1` (SpecialFunctionsHypergeometric 4.2 and 5.5) for 14.8.12–14.8.14 through 14.3.18, whose
argument `1 − x⁻²` tends to `1`, and for 14.8.4–14.8.6 through 14.3.2; and the logarithmic cases
15.8.8–15.8.12 for 14.8.3 and 14.8.9–14.8.10.

**Checks.**
- 14.7.5 and 14.7.2 at `n = 2`, `x = 0.3`: `W_1(0.3) = 0.45`, and `𝖰_2(0.3) = −0.56297 46555 34…`,
  which is 14.5.29.
- 14.5.21 at `θ = 1`: `𝖯_{−1/2}(cos 1) = (2/π) K(sin ½) = 1.06633 42455 7…`, and 14.5.27 at `ξ = 1`:
  `𝑸_{−1/2}(cosh 1) = 2π^{−1/2} e^{−1/2} K(e^{−1}) = 1.11448 00364 1…`, with `K(k)` Tau Ceti's
  `legendreK k` (modulus, not parameter).
- 14.8.3 at `ν = 0.3`: `𝖰_ν(x) − ½ ln(2/(1 − x)) → −γ − ψ(1.3) = −0.40802 47760 3…` as
  `x → 1−`.
- 14.7.16: `𝖯^3_2 = 0`, and 14.7.17 at `(n, m) = (3, 1)`: `𝖯^1_3(−x) = 𝖯^1_3(x)`.

*Needs:* Layers 1–3; SpecialFunctionsHypergeometric 4.2, 5.2, 5.5, 9.1; Tau Ceti elliptic integrals;
Mathlib `Polynomial.factorial_mul_shiftedLegendre_eq`.

### Examples

- `∑ₙ 𝖯_n(0.3) (0.5)ⁿ = (1 − 0.3 + 0.25)^{−1/2} = (0.95)^{−1/2}` (14.7.19).
- `P^2_2(x) = 3(x² − 1)` (14.7.15).

### Dependencies

Layers 1–3; SpecialFunctionsHypergeometric Layers 4–5, 9; Tau Ceti elliptic integrals.

## Layer 5: Wronskians, connection formulas and values on the cut

### 5.1 Wronskians and numerically satisfactory pairs

- 14.2.3–14.2.6 on `D` (on `(−1, 1)` by restriction) and 14.2.7–14.2.11 on `(1, ∞)` and on `U`
  (§14.21(iii)), for all parameters for which the functions are defined
  (`wronskian_ferrersP_ferrersQ`). Each is 1.3 with the constant computed from Layer 4 at a singular
  point, or from 3.1 at `x = 0`; 14.2.5 and 14.2.11 are 14.2.4 and 14.2.10 combined with
  14.10.4–14.10.5.
- The statements of §14.2(iii) and §14.21(ii). A solution is *recessive* at an endpoint when its
  ratio to every independent solution tends to `0` there; this is stronger than DLMF's
  "numerically satisfactory".
  - `𝖯^{−μ}_ν(x)`, `𝖯^{−μ}_ν(−x)` are linearly independent exactly when `μ − ν ∉ {0, −1, −2, …}`
    and `μ + ν ∉ {−1, −2, …}` (by 14.2.3). For `Re μ > 0`, and for `μ = 0`, the first is recessive
    at `1` and the second at `−1`: for `Re μ > 0` the exponents `∓μ/2` at `1` have different
    real parts, and at the repeated exponent `μ = 0` every independent solution has the
    logarithmic term of `𝖰_ν` (4.4). For `Re μ = 0`, `μ ≠ 0`, the exponents have equal real parts,
    no solution is recessive at `±1`, and the statement is the independence alone: at `ν = 0`,
    `μ = i`, `𝖯^{∓i}_0(x) = R^{∓i/2}/Γ(1 ± i)` with `R = (1 + x)/(1 − x)`, and their ratio has
    modulus `1` on `(−1, 1)`.
  - For `Re μ ≥ 0` and `Re ν ≥ −½`, `P^{−μ}_ν` and `𝑸^μ_ν` are independent on `(1, ∞)` and on
    `{z ∈ U | Re z ≥ 0}`. `P^{−μ}_ν` is recessive at `1` when `Re μ > 0` or `μ = 0`, and `𝑸^μ_ν` at
    `∞` when `Re ν > −½` or `ν = −½` (the repeated exponent, where `P^{−μ}_ν` carries a logarithm,
    4.4); on the boundaries `Re μ = 0`, `μ ≠ 0` at `1` and `Re ν = −½`, `ν ≠ −½` at `∞`, the
    statement is the independence alone. `P^{−μ}_ν(−x)`, `𝑸^μ_ν(−x)` likewise on `(−∞, −1)`.

### 5.2 Connection formulas

- 14.9.1–14.9.2, 14.9.6–14.9.10 on `(−1, 1)` and on `D` (`ferrersQ_connection_14_9_2`), and
  14.9.12, 14.9.15 on `(1, ∞)` and on `U` (§14.21(iii)), each for the parameters for which every
  function in it is defined, and with the left side as printed (so that, for example, 14.9.7 holds
  for all `ν, μ`);
- 14.3.16, which is 14.9.12 written out through 14.3.7, and 14.3.20, which is 14.9.15 with 14.3.6
  and 14.3.9;
- the recurrences of §14.10 for the functions of the second kind, as DLMF states them after
  14.10.5 and 14.10.7: 14.10.1–14.10.5 for `𝖰^μ_ν` on `(−1, 1)` and on `D`, and 14.10.3–14.10.7
  for `Q^μ_ν` on `(1, ∞)` and on `U`, wherever every function in them is defined. They follow from
  2.1 for `𝖯^{±μ}` and `P^{±μ}` through 14.3.2 and 14.9.15 where `μ ∉ ℤ`, and by holomorphy in `μ`
  at integer `μ`;
- Whipple's formulas 14.9.16–14.9.17 for `x > 1`, with `x (x² − 1)^{−1/2} > 1`, and on
  `{z ∈ U | Re z > 0}` with the continuations of §14.21(iii) (`olverLegendreQ_whipple`).

The behaviour of `𝖯^μ_ν(x)` and `𝖰^μ_ν(x)` as `x → −1+` is a target here, from 4.4 and 14.9.8,
14.9.10, with `IsEquivalent` along `𝓝[>] (−1)` under the hypotheses of 14.8.1–14.8.6 transported
by the formulas.

Each formula expresses a solution in a fundamental pair (1.3, 5.1), with the two coefficients
from 3.1 or from Layer 4. Whipple's formula follows from 14.3.7 and from 14.3.15 at the argument
`x (x² − 1)^{−1/2}`, by the quadratic transformation of `F(a, b; ½(a + b + 1); w)` and the Pfaff
transformation.

### 5.3 Values on the cut

14.23.1–14.23.6 for `−1 < x < 1`, with `x ± i0` the limits of [Conventions](#conventions)
(`tendsto_associatedLegendreP_cut`, `tendsto_olverLegendreQ_cut`), for all parameters for which
the functions are defined. 14.23.1 is the limit of the prefactor of 14.3.6, whose `𝐅` is
continuous across `(−1, 1)`; 14.23.2 follows from 14.23.1 and the jump 15.2.3 of the `𝐅` in
14.3.7, or from 14.9.12 and 14.23.1; 14.23.3–14.23.6 follow as DLMF's notes say. The statement
after 14.23.6 is a target: 14.23.4 and 14.23.6, with the right sides continued from `U`, recover
`ferrersP` and `ferrersQ` on `D ∩ {Im z > 0}` and on `D ∩ {Im z < 0}` as holomorphic functions.

**Checks.**
- 14.2.4 at `(ν, μ, x) = (0.3, 0.4, 0.2)`: `(1 − x²) 𝒲{𝖯, 𝖰} = Γ(1.7)/Γ(0.9) = 0.85028 47912 0…`.
- 14.9.16 at `(ν, μ, x) = (0.3, 0.4, 2)`: both sides are `0.35518 67693 2…`.
- 14.23.1 at `(ν, μ, x) = (0.3, 0.4, 0.25)`: `P^μ_ν(x + iε) → e^{−0.2πi} · 0.51489 44336 58…`.

*Needs:* Layers 1–4; SpecialFunctionsHypergeometric 5.1, 5.4, Layer 7.

### Examples

- 14.2.4 at `(ν, μ) = (1, 0)`: with `𝖯₁(x) = x` and `𝖰₁(x) = (x/2) ln((1 + x)/(1 − x)) − 1`
  (14.7.2–14.7.3), `x 𝖰₁′(x) − 𝖰₁(x) = 1/(1 − x²)`, so `(1 − x²) 𝒲{𝖯₁, 𝖰₁} = 1 = Γ(2)/Γ(2)`.

### Dependencies

Layers 1–4; SpecialFunctionsHypergeometric Layers 5, 7.

## Layer 6: derivatives with respect to degree and order, continued fractions

### 6.1 Derivatives with respect to degree or order

14.11.1–14.11.5 for `−1 < x < 1`, and their forms for `P^μ_ν` and `Q_ν` on `(1, ∞)` stated after
14.11.5, with `𝖠^μ_ν(x)` of 14.11.3 written out as a series, not given a Lean definition. The
hypotheses are those that make every term defined: `ν ∉ ℤ` in 14.11.1 (the `cot νπ` and the
`Γ(k − ν)` of 14.11.3), and in 14.11.2 also `ν + μ ∉ ℤ`; 14.11.4–14.11.5 for `ν ∉ ℤ`. The series
14.11.3 converges for `x ∈ (−1, 1)`, since `(½ − ½x)ᵏ` decays geometrically against the polynomial
growth of its Gamma ratio in `k`. 14.11.1 is the termwise `ν`-derivative of the series of 14.3.1,
which converges at `(1 − x)/2` for every `x ∈ (−1, 1)`; 14.11.4 is the `μ`-derivative of the same
series at `μ = 0`, with the series of `𝖰_ν` of Hobson (1931, §132); 14.11.2 and 14.11.5 follow from
14.9.10, 14.9.8 and 14.11.1, 14.11.4, as DLMF's notes say. 14.11.4 is
`deriv_ferrersP_order_zero`.

### 6.2 Continued fractions

- 14.14.1 as corrected (the printed left side is not the value of the fraction): for `x > 1` and
  real `ν, μ` with `x_{k+1}` and `y_k` not both zero for any `k` and `P^{1−μ}_ν(x) ≠ 0`,

```text
½ (x² − 1)^{1/2} (ν + μ)(ν − μ + 1) P^{−μ}_ν(x) / P^{1−μ}_ν(x) = x₀/(y₀ + x₁/(y₁ + x₂/(y₂ + ⋯)))
```

  with `x_k`, `y_k` of 14.14.2 (`associatedLegendreP_continuedFraction`). The fraction is the
  supplier's `contFrac` (a `GenContFract ℂ` with head `0` and `k + 1`-st partial quotient
  `x_k/y_k`), and it converges in the supplier's sense: eventually nonzero denominators and
  convergence of `GenContFract.convs`, which are ratios of continuants. If some `x_k = 0`, the
  fraction terminates there and its value is the convergent before it; nested division, with Lean's
  `a/0 = 0` at an intermediate zero, would give a different value. At `(ν, μ, x) = (5/8, −11/8, 2)`,
  `x₃ = 0`, `P^{11/8}_{5/8}(2) = 0` and the third convergent is `0` with denominator `15/32`, while
  nested division gives `27/44`. At `(ν, μ, x) = (0.3, 0.4, 1.5)` the fraction is
  `0.34516 11876 28…`, which is this left side, while DLMF's printed left side
  `½ (x² − 1)^{1/2} P^μ_ν(x)/P^{μ−1}_ν(x)` is `0.81272 07082 69…`. The fraction is that of the
  recurrence 14.10.6 in the order, whose minimal solution as the order increases is
  `k ↦ P^{−μ−k}_ν(x)`, and Pincherle's theorem gives the ratio. Minimality rests on the large-order
  estimate, at fixed `x > 1`, `Γ(μ + k + 1) ((x + 1)/(x − 1))^{(μ+k)/2} P^{−μ−k}_ν(x) → 1` as
  `k → ∞`. It follows from 14.3.9 and the Pfaff transformation 15.8.1, which write `P^{−μ−k}_ν(x)`
  as `((x − 1)/(x + 1))^{(μ+k)/2} ((x + 1)/2)^{−ν−1}` times `𝐅(ν + 1, c + ν; c; (x − 1)/(x + 1))`
  with `c = μ + k + 1` and argument in `(0, 1)`; `Γ(c)` times this `𝐅` tends to `((x + 1)/2)^{ν+1}`
  by Tannery's theorem (Mathlib `tendsto_tsum_of_dominated_convergence`). The fixed-parameter limits
  of 4.4 do not give it. With this estimate the terms `t_m` of the reduction-of-order series of the
  supplier's 4.1 satisfy `|t_{m+1}/t_m| → ∞`, since `x_m` grows like `m²` and the Gamma factor
  contributes another `m²`.
- 14.14.3 for `x > 1`, real `ν, μ` with `ν ≠ μ` and the same proviso, as printed: the recurrence
  is 14.10.3 for `Q` in the degree, whose minimal solution is `k ↦ Q^μ_{ν+k}(x)`; at
  `(0.3, 0.4, 1.5)` both sides are `−0.03374 44499 30…`. Minimality rests on the large-degree
  estimate, at fixed `x > 1` with `ζ = x − (x² − 1)^{1/2} ∈ (0, 1)`,
  `Γ(ν + k + 3/2) 𝑸^μ_{ν+k}(x) / (π^{1/2} (1 − ζ²)^{−1/2} ζ^{ν+k+1}) → 1` as `k → ∞`. It follows
  from `𝑸^μ_ν(x) = π^{1/2} (1 − ζ²)^μ ζ^{ν+1} 𝐅(μ + ½, ν + μ + 1; ν + 3/2; ζ²)`, a quadratic
  transformation of 14.3.7 (SpecialFunctionsHypergeometric Layer 7), by Tannery's theorem; at
  `(ν, μ, x) = (0.3, 0.4, 1.5)` both forms give `𝑸^μ_ν(x) = 0.58454 38365 2…`.

*Needs:* Layers 1–5; SpecialFunctionsEiLiErfIncompleteGamma 4.1 (`contFrac` and Pincherle's
theorem); SpecialFunctionsHypergeometric 5.1 (15.8.1) and Layer 7; Mathlib `Complex.digamma`,
`GenContFract`, `tendsto_tsum_of_dominated_convergence`.

### Examples

- 14.11.4 at `(ν, x) = (0.3, 0.25)`: both sides are `−0.45849 20843 78…`.

### Dependencies

Layers 1–5; SpecialFunctionsEiLiErfIncompleteGamma 4.1; SpecialFunctionsHypergeometric 5.1 and
Layer 7.

## Layer 7: integral representations and integrals

### 7.1 Integral representations on `(−1, 1)`

14.12.1 (Mehler–Dirichlet) for `0 < θ < π`, `Re μ < ½` (`ferrersP_cos_eq_integral`); 14.12.2 for
`Re μ > 0`; 14.12.3 for `0 < θ < π`, `Re μ > −½`, `Re(ν ± μ) > −1`. 14.12.1 and 14.12.3 follow
from Euler's integral 15.6.1 for the `𝐅` of 14.3.1 and 14.3.7, with substitutions; 14.12.2 from
the Riemann–Liouville form of 14.6.6 and holomorphy in `μ`.

### 7.2 Integral representations on `(1, ∞)` and on `U`

- 14.12.4 for `Re(μ − ν) > 0` and `Re(μ + ν) > −1` (the second hypothesis, which DLMF omits, is
  needed for convergence: the integrand grows like `e^{(|Re(ν + ½)| − Re μ − ½)t}`; at
  `(ν, μ) = (−1.5, 0.2)`, where DLMF's hypothesis holds, it grows like `e^{0.3t}`);
- 14.12.5 for `Re μ > 0`; 14.12.6 for `Re(ν + 1) > Re μ > −½`; 14.12.7 for `m : ℕ` and all `ν`;
  14.12.8 for `n ≥ m`; 14.12.9–14.12.12 for `m, n : ℕ`, 14.12.12 for `n ≥ m`;
- Neumann's integral 14.12.13 for `x > 1`, and on `U` (`olverLegendreQ_nat_eq_integral`), and
  Heine's integral 14.12.14;
- 14.12.6 at `μ = 0` with 14.3.10, written out: for `t > 1` and `Re s > 0`,
  `associatedLegendreQ (s − 1) 0 t = ∫₀^∞ (t + (t² − 1)^{1/2} cosh u)^{−s} du`, which is the
  definition of `Q_{s−1}(t)` in AutomorphicSpectralTheory §0.35;
- 14.25.1 for `Re μ > Re ν > −1` and 14.25.2 for `Re(ν + 1) > Re μ > −½`, on `U` with
  `(z² − 1)^{μ/2}` and `(z² − 1)^{1/2}` as in [Conventions](#conventions).

### 7.3 Indefinite integrals, Barnes' integral and orthogonality

- 14.17.1–14.17.4 as derivative identities on `(−1, 1)` (the derivative of the right side is the
  integrand), with the hypotheses printed, and with `𝖯` replaced by `𝖰` in all four and `𝖰` by
  `𝖯` in 14.17.3–14.17.4 as DLMF states;
- 14.17.5 (Barnes) for `Re σ > −1`, `Re μ > −1` (`integral_cpow_mul_ferrersP`): both sides are
  holomorphic in `σ` on `Re σ > −1`; for `Re σ > 1`, two integrations by parts in the equation of
  `(1 − x²)^{μ/2} 𝖯^{−μ}_ν(x)` (14.2.2 rewritten for this product) give a first-order recurrence
  `I(σ) = r(σ) I(σ − 2)` that the right side also satisfies, so the ratio of the two sides is
  `2`-periodic in `σ`; both sides are `∼ σ^{−μ−1}` as `σ → +∞` (the left by the Abelian estimate of
  the auxiliary table with 14.8.1 for `𝖯^{−μ}_ν` at `1`, the right by the Gamma ratio), so the ratio
  is `1` on each ray `σ₀ + 2ℕ`, hence on `(1, ∞)` and everywhere by the identity theorem;
- 14.17.6–14.17.9 (orthogonality) for `l, m, n : ℕ` with the Kronecker delta, 14.17.6–14.17.7
  for `m ≤ n` (for `m > n`, `𝖯^m_n = 0` by 14.7.16: at `l = n` both integrals vanish while the
  printed right side of 14.17.7 is `(−1)^m/(l + ½) ≠ 0`, and at `l ≠ n` 14.17.7 fails as well,
  `∫₋₁¹ 𝖯²₃ 𝖯⁻²₁ dx = −4` at `(l, m, n) = (3, 2, 1)`), 14.17.8 for
  `m > 0` and 14.17.9 for `l > 0` (`integral_ferrersP_mul_ferrersP`).

### 7.4 Definite integrals of products

14.17.10–14.17.20 with the hypotheses printed (14.17.15 for `Re ν > 0`, 14.17.18 for
`Re λ > Re ν > 0`, 14.17.19 for `Re(λ + ν) > −1`, `λ ≠ ν`, `λ, ν ∉ {−1, −2, …}`, 14.17.20 for
`Re ν > −½`). 14.17.10–14.17.15 and 14.17.18–14.17.20 are Green's identity for 14.2.1 on
`(−1, 1)`, respectively `(1, ∞)`, with the boundary values from 4.4 and 14.8.3, and the diagonal
cases as limits `λ → ν`; 14.17.16 is the case `μ = m` of the same identity.

14.17.17 for `l, m, n ≥ 1` with `|m − n| < l < m + n` (`integral_ferrersQ_mul_ferrersP_mul`): if
`l + m + n` is even the integrand is odd (14.7.17–14.7.18). If it is odd, expand
`Pₘ Pₙ = ∑ᵣ cᵣ P_{m+n−2r}` by Adams's linearization formula (auxiliary target; Adams 1878)

```text
cᵣ = A(m − r) A(r) A(n − r)/A(m + n − r) · (2m + 2n − 4r + 1)/(2m + 2n − 2r + 1),   A(r) = (½)ᵣ 2ʳ/r!,
```

for `0 ≤ r ≤ min(m, n)`; by 14.17.16 with `m = 0`, the integral is
`2 ∑ᵣ cᵣ/(λ_{m+n−2r} − λ_l)` with `λ_k = k(k + 1)`, and the remaining target is that this finite
sum of rationals vanishes for every `l` of the stated range and parity. At `(l, m, n) = (2, 1, 2)`:
`P₁P₂ = (2/5)P₁ + (3/5)P₃` and `(2/5)/(2 − 6) + (3/5)/(12 − 6) = 0`.

**Checks.**
- 14.17.5 at `(ν, μ, σ) = (0.7, −0.4, 0.6)`: both sides are `0.57409 52867 05…`.
- 14.17.6 at `l = n = 2`, `m = 1`: `∫_{−1}^1 (𝖯^1_2)² = 3!/(1! · 5/2) = 12/5`.
- 14.17.17 at `(l, m, n) = (4, 1, 2)`, outside the range: the integral is `−7/36 = −0.19444…`, not
  `0`.

*Needs:* Layers 1–5; SpecialFunctionsHypergeometric 6.1.

### Examples

- Neumann's integral 14.12.13 at `n = 0`: `½ ∫_{−1}^1 dt/(x − t) = ½ ln((x + 1)/(x − 1))`, which
  is `𝑸₀(x)` (14.5.9).
- Heine's integral 14.12.14 at `n = 0`, `x = 3`:
  `∫₀^∞ dt/(3 + 8^{1/2} cosh t) = ½ ln 2 = 0.34657 35902 7…`, which is `𝑸₀(3) = Q₀(3)` (14.5.9).

### Dependencies

Layers 1–5; SpecialFunctionsHypergeometric Layer 6.

## Layer 8: trigonometric expansions and sums

### 8.1 Trigonometric expansions

14.13.1–14.13.2 for `0 < θ < π` and `ν + μ ∉ {−1, −2, …}` (`ferrersP_cos_eq_fourier`): the
series converge absolutely when `Re μ < 0`; they converge when `0 ≤ Re μ < ½`, and for
`θ ≠ ½π` not absolutely, as corrected in DLMF 1.1.3 (Volkmer 2021). The proof is DLMF's: the
identity

```text
±½πi 𝖯^μ_ν(cos θ) + 𝖰^μ_ν(cos θ) = π^{1/2} Γ(ν + μ + 1) (2 sin θ)^μ e^{±(ν+μ+1)iθ}
                                     𝐅(ν + μ + 1, μ + ½; ν + 3/2; e^{±2iθ})
```

(a target: both sides solve 14.21.1 in `cos θ`, and they agree as `θ → 0+` by 4.4), the behaviour
of the series of `𝐅` on its circle of convergence (SpecialFunctionsHypergeometric 4.3, with
`c − a − b = ½ − μ`), and real and imaginary parts. 14.13.3–14.13.4 are the cases `ν = n`,
`μ = 0`, with conditional convergence.

### 8.2 Addition theorems

14.18.1–14.18.5 with the conditions printed (`ferrersP_addition`), and 14.28.1 for
`Re z₁, Re z₂ > 0`, `z₁, z₂ ∉ (−∞, 1]`, with `(z² − 1)^{1/2}` as in
[Conventions](#conventions). In each, the left side is a smooth function of `φ`, and the
targets are its Fourier coefficients: the `m`-th coefficient, as a function of `θ₁` (or `ξ₁`,
`z₁`), solves 14.2.2 with `μ = m`, is bounded at `θ₁ = 0`, and its leading behaviour there is
fixed by 4.4 and the value of the left side at `θ₁ = 0`. 14.18.2 follows from 14.18.1 by 14.7.16
and 14.9.3.

### 8.3 Other sums

- Christoffel's formulas 14.18.6–14.18.7 for `n : ℕ`, with `P` and `Q` at `μ = 0` on `U` and with
  the Ferrers functions on `D`;
- the zonal harmonic series 14.18.8 for `ν ∉ ℤ` and `−1 < x < 1`, as `HasSum` (the terms are
  `O(n^{−3/2})`), and at `x = −1` as the limit of the partial sums, which is Dougall's case
  `x = 1`, `μ = 0` below. At `x = 1` the series diverges: its left side `𝖯_ν(−1)` is infinite and
  every `𝖯ₙ(1) = 1`;
- Dougall's expansion 14.18.9 for `−1 < x ≤ 1`, `μ ≥ 0`, `ν ∉ ℤ`, as `HasSum` for `−1 < x < 1`
  (`hasSum_ferrersP_dougall`) and as the limit of the partial sums at `x = 1`, where for `μ = 0`
  the series `∑ (−1)ⁿ (2n + 1)/((ν − n)(ν + n + 1))` converges only conditionally: as a
  function of `ν`, `F(ν) = π 𝖯^{−μ}_ν(x)/sin νπ` has simple poles at the integers with residues
  `(−1)ⁿ 𝖯^{−μ}_n(x)` at `n` and `(−1)^{n+1} 𝖯^{−μ}_n(x)` at `−n − 1` (degree symmetry 14.9.5),
  whose principal parts combine to `(−1)ⁿ (2n + 1) 𝖯^{−μ}_n(x)/((ν − n)(ν + n + 1))`, and 14.18.9
  is its Mittag-Leffler expansion. Take the circles `C_N = {|ν + ½| = N + 1}`, which meet the real
  axis at the half-integers `N + ½` and `−N − 3/2` and avoid the poles. With `x = cos θ`,
  `0 < θ < π`, 14.12.1 (for the order `−μ ≤ 0`) gives `|𝖯^{−μ}_ν(cos θ)| ≤ C e^{|Im ν| θ}` with `C`
  independent of `ν`, and `|sin νπ| ≥ c e^{π|Im ν|}` on every `C_N` with `c > 0` independent of
  `N`. So `|F| ≤ (C/c) e^{−(π−θ)|Im ν|}` on `C_N`, and for fixed `ν₀` the integral of
  `F(ν)/(ν − ν₀)` over `C_N` is at most a constant times
  `∫₀^{2π} e^{−(π−θ)(N+1)|sin φ|} dφ`, which tends to `0` by dominated convergence;
- Heine's formula 14.28.2 for `z₁` outside and `z₂` inside two confocal ellipses with foci `±1`,
  `𝓔₂` properly inside `𝓔₁`, with uniform convergence for `z₁` on or outside `𝓔₁` and `z₂` on or
  inside `𝓔₂` (`hasSum_heine`); an ellipse with foci `±1` is a set `{z | |z − 1| + |z + 1| = 2a}`
  with `a > 1`.

**Checks.**
- 14.13.1 at `(ν, μ, θ) = (0.3, −0.2, 1)`: both sides are `0.88595 48489 2…`.
- 14.18.9 at `(ν, μ, x) = (0.3, 0.5, 0.2)`: both sides are `0.89592 59862 1…`.
- 14.18.6 at `n = 1`: `(x − y)(1 + 3xy) = 2(P₂(x)y − xP₂(y))`.

*Needs:* Layers 1–7; SpecialFunctionsHypergeometric 4.3; Tau Ceti
`TauCeti.Contour.classicalResidueTheorem_circle`.

### Examples

- 14.18.1 at `ν = 1`: with `𝖯^1_1(cos θ) = −sin θ` and `𝖯^{−1}_1(cos θ) = ½ sin θ` (14.9.3), and
  `𝖯^m_1 = 0` for `m ≥ 2`, it is the spherical law of cosines
  `cos θ₁ cos θ₂ + sin θ₁ sin θ₂ cos φ`.

### Dependencies

Layers 1–7; SpecialFunctionsHypergeometric 4.3.

## Layer 9: zeros

### 9.1 Sturm theory

Auxiliary targets, for `((1 − x²) y′)′ + q(x) y = 0` on an open subinterval `I` of `(−1, 1)` or
of `(1, ∞)` with `q` continuous and real (the method of DLMF's source for §14.16, Hobson (1931,
pp. 386–389, 399–401)). On `I` the equation is the Sturm–Liouville equation `(p y′)′ + Q y = 0`
with `p = |1 − x²| > 0`, where `Q = q` on `(−1, 1)` and `Q = −q` on `(1, ∞)`:
- the zeros of a nontrivial real solution are simple and isolated;
- Sturm's separation theorem: the zeros of two independent real solutions interlace;
- Sturm's comparison theorem: let `Q₁ ≤ Q₂` on `I` (so `q₁ ≤ q₂` on a subinterval of `(−1, 1)`
  and `q₂ ≤ q₁` on a subinterval of `(1, ∞)`), let `y₁` be a nontrivial real solution for `q₁`
  with consecutive zeros `a < b` in `I`, and let `y₂` be a real solution for `q₂`. Then `y₂` has a
  zero in `(a, b)`, unless `q₁ = q₂` on `[a, b]` and `y₂` is a multiple of `y₁`. The direction
  matters: on `(1, ∞)` the conical function `P_{−½+2i}` (`q₁ = −17/4`) has the consecutive zeros
  `1.83253…` and `8.09610…`, while `P₀ = 1` (`q₂ = 0 ≥ q₁`) has none;
- continuity of the zero count: let `t ↦ (q_t, y_t)` be a family indexed by a real interval `T`,
  with `y_t` a nontrivial real solution for `q_t` and `(t, x) ↦ y_t(x)`, `(t, x) ↦ y_t′(x)`
  continuous on `T × I`. Suppose the endpoint behaviour is fixed: for each compact `K ⊆ T` there
  are neighbourhoods of the two ends of `I` on which no `y_t` with `t ∈ K` vanishes. Then the
  number of zeros of `y_t` in `I` is finite and locally constant in `t`. In 9.2 the
  neighbourhoods come from the leading terms of 4.4 (for example 14.8.1 at `x → 1−`), which hold
  locally uniformly in the parameters.

### 9.2 Zeros on `(−1, 1)` and `(1, ∞)`

DLMF §14.16 for real `μ`. The statements on `𝖯^μ_ν` and `P^μ_ν` are for `ν ≥ −½`, which is no
loss by 14.9.5 and 14.9.11; those on `𝖰^μ_ν` assume `ν ≥ −½` (DLMF's count fails at
`(ν, μ) = (−2.3, 0.2)`, where `𝖰^μ_ν` has three zeros, near `−0.99995`, `−0.01354` and `0.99982`,
against `N₀ = 0`); those on `𝑸^μ_ν` are for all real `ν`. The notation is 14.16.1
(`μ = m + δ_μ`, `ν = n + δ_ν`, `m, n ∈ ℤ`, `δ_μ, δ_ν ∈ (0, 1)` when `μ`, respectively `ν`, is not
an integer) and `N₀ = max(⌈ν − |μ|⌉, 0)`. The zeros are counted as the cardinality of the zero
set in the open interval, which is finite. The statements are DLMF's with the restriction for
`𝖰^μ_ν` above and three corrections:
- **`𝖯^μ_ν` on `(−1, 1)`** (`ferrersP_zero_count`), when it is not identically zero there, that is,
  `𝖯^μ_ν(x) ≠ 0` for some `x ∈ (−1, 1)` (`𝖯¹₀` and `𝖯³₂` vanish identically). It has `N₀` zeros if
  `μ ≤ 0`; or `μ = m ≥ 1` is an integer; or `ν ∈ ℕ`; or `ν, μ ∉ ℤ`, `μ > 0`, and either `n ≥ m` and
  `δ_ν > δ_μ`, or `n < m` and `m − n` is odd. It has `N₀ + 1` zeros if `ν, μ ∉ ℤ`, `μ > 0`, and
  either `n ≥ m` and `δ_ν ≤ δ_μ` (DLMF prints `n > m`, which omits `n = m`;
  `ferrersP_zero_count_add_one`), or `n < m` and `m − n` is even. At `(ν, μ) = (¼, ¾)`, `(0.3, 0.3)`
  and `(1.6, 1.6)`, where `n = m`, there is one zero and `N₀ = 0`.
- **`𝖰^μ_ν` on `(−1, 1)`**, for `ν + μ ∉ {−1, −2, …}` and `Γ(ν + μ + 1)/Γ(ν − μ + 1) ≠ 0`: its
  zeros interlace those of `𝖯^μ_ν`, and their number is `N₀ + k` with `k ∈ {−1, 0, 1, 2}`; for
  `μ ≥ 0` it is even if `cos νπ` and `cos μπ` have opposite signs and odd if they have the same
  sign (DLMF states the parity for all `μ`; at `(ν, μ) = (−0.369, −0.206)` both cosines are
  positive and `𝖰^μ_ν > 0` on `(−1, 1)`); `𝖰_n` has `n + 1` zeros for `n : ℕ`.
- **`P^μ_ν` on `(1, ∞)`**, when not identically zero: exactly one zero if `μ > 0`, `μ > ν`,
  `μ ∉ ℤ` and `sin((μ − ν)π)`, `sin μπ` have opposite signs, or if `0 < μ ≤ ν`, `μ ∉ ℤ` and `⌊μ⌋`
  is odd (DLMF's second case omits `μ > 0`; at `(ν, μ) = (0.184, −0.088)`, `P^μ_ν > 0` on
  `(1, ∞)`); no zeros otherwise. `𝑸^μ_ν` has no zeros on `(1, ∞)` when `ν > −1`, and at most one
  when `ν < −1` and `𝑸^μ_ν(x) ≠ 0` for some `x > 1`: at `(ν, μ) = (−3/2, ½)` the factor
  `𝐅(½, 0; 0; x⁻²)` of 14.3.7 vanishes identically, and so does `𝑸^μ_ν`.

The proof uses 9.1 with the Wronskians 14.2.3–14.2.7 (5.1), the behaviour at `±1` and `∞` (4.4)
and, for the base counts, the polynomial cases `ν = n`, `μ = −m` (4.3).

**Checks.**
- `𝖯^{1/2}_2(cos θ)` vanishes exactly at `θ = π/5, 3π/5` (14.5.11), two zeros, `N₀ = 2`.
- `(ν, μ) = (3.3, 1.3)`: `n = 3 > m = 1`, `δ_ν = δ_μ = 0.3`, so `N₀ + 1 = 3` zeros; at
  `(2.7, 1.3)`, `δ_ν > δ_μ`, so `N₀ = 2`.
- `𝖰_0(x) = ½ ln((1 + x)/(1 − x))` has the single zero `x = 0`.

*Needs:* Layers 1–5.

### Examples

- `𝖯₃(x) = (5x³ − 3x)/2` has the three zeros `0` and `±(3/5)^{1/2}`, and `N₀ = 3` at `μ = 0`.
- `𝖯^{3/4}_{1/4}` has one zero, at `x = 0`, since 14.5.1 has the factor
  `Γ(½ − ⅛ − ⅜)⁻¹ = Γ(0)⁻¹ = 0`: the case `n = m = 0`, `δ_ν < δ_μ`, with `N₀ + 1 = 1` zero.

### Dependencies

Layers 1–5.

## Layer 10: toroidal and conical functions, generalizations

### 10.1 Toroidal functions

- 14.19.1: the toroidal coordinates, and the target that for `n : ℕ` and `m : ℤ` the function
  `(cosh η − cos θ)^{1/2} P^m_{n−½}(cosh η) cos(nθ) e^{imφ}`, written in Cartesian coordinates
  through 14.19.1, is harmonic on the open set where `η > 0`;
- 14.19.2 for `ξ > 0`, `μ ∉ {½, 3/2, …}` (as corrected in DLMF 1.0.1) and 14.19.3 for `ξ > 0`, from
  quadratic transformations (Layer 3);
- 14.19.4 for `m, n : ℕ`, 14.19.5 for `m < n + ½`, and 14.19.6 for `Re μ > −½`, `ξ > 0` and
  real `φ` with `cosh ξ ≠ cos φ` (`hasSum_olverLegendreQ_toroidal`);
- Whipple's formula for toroidal functions 14.19.7–14.19.8, from 14.9.16–14.9.17.

### 10.2 Conical functions and `𝖰̂`

- 14.20.1, which is 14.2.2 at `ν = −½ + iτ`, and the statements before 14.20.2: for `−1 < x < 1`,
  `τ > 0` and `μ ≥ 0` (DLMF's standing assumption in §14.20), `𝖯^{−μ}_{−½+iτ}(x)` and
  `𝖯^{−μ}_{−½+iτ}(−x)` are real, independent and form a numerically satisfactory pair in the sense
  of 5.1. For `μ < 0` the pair fails: at `μ = −½`, `τ = 1` the ratio of the two at `x = cos θ`
  is `cosh θ/cosh(π − θ)` (14.5.11), which tends to `1/cosh π`, not to `0`, as `θ → 0+`;
- `Real.conicalQHat μ τ x`, for real `μ, τ` and `x ∈ (−1, 1)`, is

```text
𝖰̂^μ_{−½+iτ}(x) = Re(e^{−μπi} 𝖰^μ_{−½+iτ}(x)) + ½π sin(μπ) 𝖯^μ_{−½+iτ}(x),          (14.20.2 at −μ)
```

  so that DLMF's `𝖰̂^{−μ}_{−½+iτ}` is `conicalQHat (−μ) τ x`; it solves 14.20.1, it equals
  14.20.3 (`conicalQHat_eq`) whenever `𝖰^{∓μ}_{−½+iτ}` is defined (that is, except at
  `τ = 0`, `μ ∈ ½ + ℤ`), and 14.20.4–14.20.5 are its Wronskians;
- 14.20.6 for `x > 1`, `τ ≠ 0`; 14.20.7–14.20.8 for `μ > 0`, `x → 1−`; 14.20.9 for `0 < θ < π`;
  14.20.10 for `0 ≤ θ < π` (DLMF prints `0 ≤ θ ≤ π`, but at `θ = π` the left side is
  singular, `𝖯_{−½+iτ}(x) → +∞` as `x → −1+`, and the series diverges, its terms being at least
  `((2k − 1)!!/(2k)!!)²`), with the positivity of `𝖯_{−½+iτ}(cos θ)` for `0 ≤ θ < π` stated
  after it;
- 14.23.7 as corrected (the second factor is `e^{μπi/2}`, which makes the two terms conjugate):

```text
𝖰̂^{−μ}_{−½+iτ}(x) = ½ e^{3μπi/2} Q^{−μ}_{−½+iτ}(x − i0) + ½ e^{μπi/2} Q^{−μ}_{−½−iτ}(x + i0)
```

  for `−1 < x < 1` and real `μ, τ` (`conicalQHat_eq_cut`). At `(μ, τ, x) = (0.3, 1.1, 0.4)` the
  left side is `0.34326 32456 52…`, this right side agrees, and DLMF's printed right side, with
  `e^{−3μπi/2}`, is `0.11720 71990 6… − 0.16132 18697 4… i`.

**Checks** (for `conicalQHat`).
- At `(μ, τ, x) = (−0.3, 1.1, 0.4)` the definition and 14.20.3 both give `0.34326 32456 52…`.
- At `μ = 0`: `𝖰̂^0_{−½+iτ}(x) = Re 𝖰^0_{−½+iτ}(x)`.
- `conicalQHat μ τ` solves 14.20.1 on `(−1, 1)`, and 14.20.7 holds: for `μ > 0`,
  `𝖰̂^μ_{−½+iτ}(x) ∼ ½ Γ(μ) (2/(1 − x))^{μ/2}` as `x → 1−`.

### 10.3 The generalized associated Legendre equation

14.29.1 for complex `ν, μ₁, μ₂`, with the target that

```text
w(z) = (1 − z)^{−μ₁/2} (1 + z)^{−μ₂/2} 𝐅(ν + 1 − ½(μ₁ + μ₂), −ν − ½(μ₁ + μ₂); 1 − μ₁; (1 − z)/2)
```

solves it on `D` (`generalizedLegendre_solution`), and so does the function with `μ₁` replaced
by `−μ₁`; at `μ₁ = μ₂ = μ` the equation is 14.21.1 and `w = 2^{−μ} 𝖯^μ_ν` by the Euler
transformation. The second statement after 14.29.1, on the inhomogeneous equation, refers to
Babister and has no formula; it is not a target.

**Checks.**
- 14.29.1 at `(ν, μ₁, μ₂) = (0.37, 0.6, −0.45)`, `z = 0.3 + 0.2i`: the residual of `w` is `0` to
  working precision.
- 14.20.9 at `(τ, θ) = (1, 2)`: both sides are `3.13097 65197 5…`.
- 14.19.3 at `(ν, μ) = (½, 0)`: `𝑸_0(cosh ξ) = π^{1/2} e^{−ξ} 𝐅(½, 1; 3/2; e^{−2ξ})`, and both
  sides are `ln coth(ξ/2)`, by 14.5.9 and `F(½, 1; 3/2; w²) = artanh(w)/w`.

*Needs:* Layers 1–5, 7, 8.2; SpecialFunctionsHypergeometric 3.4, 5.1, Layer 7.

### Examples

- 14.5.12 at `ν = −½ + iτ`: `𝖯^{−1/2}_{−½+iτ}(cos θ) = (2/(π sin θ))^{1/2} sinh(τθ)/τ`, real as
  10.2 says; at `(τ, θ) = (1.3, 0.9)` it is `1.00955 67436 8…`.

### Dependencies

Layers 1–5, 7–8; SpecialFunctionsHypergeometric Layers 3, 5, 7.

## Layer 11: spherical harmonics

### 11.1 Definition and basic properties

- `sphericalHarmonic l m θ φ` for `l : ℕ`, `m : ℤ`, real `θ, φ`, is 14.30.1:
  `((l − m)! (2l + 1)/(4π (l + m)!))^{1/2} e^{imφ} 𝖯^m_l(cos θ)`, with the factorials of the
  natural numbers `l ∓ m` for `|m| ≤ l`; for `|m| > l` it is `0`, and no theorem uses it. The
  surface harmonics 14.30.2 are `cos(mφ) 𝖯^m_l(cos θ)` and `sin(mφ) 𝖯^m_l(cos θ)`, not new
  definitions.
- 14.30.3 (explicit representation, from 14.7.10), 14.30.4–14.30.5 (special values, 14.30.4 for
  all `|m| ≤ l` as corrected in DLMF 1.0.25), 14.30.6 (symmetry, from 14.9.3), 14.30.7 (parity,
  from 14.7.17), for `|m| ≤ l`.

**Checks** (for `sphericalHarmonic`).
- `Y_{0,0} = (4π)^{−1/2}` and `Y_{1,0}(θ, φ) = (3/(4π))^{1/2} cos θ`.
- `Y_{1,1}(θ, φ) = −(3/(8π))^{1/2} sin θ e^{iφ}`, with the sign from `𝖯^1_1(x) = −(1 − x²)^{1/2}`
  (the Condon–Shortley phase is in the Ferrers function, not added).
- 14.30.6 at `l = m = 1`: `Y_{1,−1} = −conj Y_{1,1} = (3/(8π))^{1/2} sin θ e^{−iφ}`.

### 11.2 Orthonormality, addition theorem, generating function

- 14.30.8 (`integral_sphericalHarmonic_mul`): the integral over `[0, 2π] × [0, π]` with the weight
  `sin θ` is `δ_{l₁,l₂} δ_{m₁,m₂}`, from 14.17.6 and the orthogonality of `e^{imφ}`;
- 14.30.9, the addition theorem (`ferrersP_eq_sum_sphericalHarmonic`), from 14.18.2;
- 14.30.8_5, Herglotz's generating function, for all real `t`, `r`, `θ`, `φ` and complex
  `λ ≠ 0`, with `a` and `x` as printed, as `HasSum` over `n` of the finite inner sums.

### 11.3 Harmonic polynomials and completeness

- 14.30.10 and the paragraph before it: for `|m| ≤ l`, `ρ^l Y_{l,m}(θ, φ)` written in Cartesian
  coordinates is the evaluation of a homogeneous harmonic polynomial `p_{l,m}` of degree `l` in
  three variables with complex coefficients, an element of Tau Ceti's
  `MvPolynomial.harmonicSubmodule (Fin 3) ℂ l`; the `2l + 1` polynomials `p_{l,m}` form a basis
  of it, whose dimension `2l + 1` is `finrank_harmonicSubmodule_add_two` (and its low-degree
  cases); so `W = ρ^l Y_{l,m}` solves Laplace's equation 14.30.10 on `ℝ³`, everywhere one-valued
  and continuous;
- completeness: the functions `(θ, φ) ↦ Y_{l,m}(θ, φ)`, `|m| ≤ l`, form a Hilbert basis of
  `L²((0, π) × (0, 2π), sin θ dθ dφ)` (`sphericalHarmonic_hilbertBasis`). Orthonormality is 11.2.
  Density is RiemannianGeometry R8.2 at `m = 2` (the restrictions of `H_l`, `l ≥ 0`, span a dense
  subspace of `L²(S²)`) with two steps that are part of the target: the `p_{l,m}`, `|m| ≤ l`, are
  a basis of each `H_l` (the first bullet), and the change of variables
  `(θ, φ) ↦ (sin θ cos φ, sin θ sin φ, cos θ)` from `(0, π) × (0, 2π)` to `S²` carries
  `sin θ dθ dφ` to the Riemannian volume of the round metric, the complement of its image being
  null, so that it induces a unitary map from `L²(S²)` onto `L²((0, π) × (0, 2π), sin θ dθ dφ)`;
- 14.30.11–14.30.13 and 14.30.11_5: with `L²` and `L_z` the differential operators 14.30.12–14.30.13
  in `(θ, φ)` on `(0, π) × ℝ` and real `ħ`, `L² Y_{l,m} = ħ² l(l + 1) Y_{l,m}` and
  `L_z Y_{l,m} = ħ m Y_{l,m}` for `|m| ≤ l`, from 14.2.2 at `μ = m`.

**Checks.**
- 14.30.9 at `l = 1`:

```text
cos θ₁ cos θ₂ + sin θ₁ sin θ₂ cos(φ₁ − φ₂)
  = (4π/3) ∑_{m=−1}^{1} conj(Y_{1,m}(θ₁, φ₁)) Y_{1,m}(θ₂, φ₂)
```

- `p_{1,1} = −(3/(8π))^{1/2} (X₀ + i X₁)` in the coordinates `(x, y, z) = (X₀, X₁, X₂)`.
- 14.30.8 at `(l₁, m₁, l₂, m₂) = (1, 0, 1, 0)`: `(3/(4π)) ∫∫ cos² θ sin θ dθ dφ = 1`.

*Needs:* Layers 1, 4, 7–8; RiemannianGeometry R8.2 (completeness at `m = 2`); Tau Ceti harmonic
polynomials, `MvPolynomial.laplacian_eval_euclidean`, `TauCeti.sphereRoundMetric`,
`TauCeti.riemannianVolume` and `TauCeti.setIntegral_riemannianVolume_of_subset`; Mathlib
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`, `fourierBasis`, `HilbertBasis`.

### Examples

- `Y_{2,0}(θ, φ) = (5/(16π))^{1/2} (3 cos² θ − 1)`, from 14.30.1 and `𝖯₂(x) = (3x² − 1)/2`.
- 14.30.9 at `l = 0`: `1 = 4π |Y_{0,0}|²`.

### Dependencies

Layers 1, 4, 7–8; RiemannianGeometry R8.2; Tau Ceti
`TauCeti/RingTheory/MvPolynomial/Harmonic.lean`, `TauCeti/Analysis/MvPolynomial/Sphere.lean`,
`TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean`,
`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`; Mathlib
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`.

## Downstream consumers

- A roadmap that consumes this one and [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)
  owns the formulas of DLMF Chapter 10 through Legendre or Ferrers functions, DLMF 10.22.66,
  10.22.71, 10.22.72 and 10.43.22.
- A roadmap for the orthogonal polynomials of DLMF Chapter 18 consumes Layers 1, 4 and 7 for the
  Legendre and Gegenbauer cases.
- Roadmaps for spheroidal wave functions (DLMF Chapter 30) and for the `3j`, `6j`, `9j` symbols
  (DLMF Chapter 34) consume Layers 1, 4 and 11.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of DLMF Chapter 14, and the formulas
of other chapters that relate this chapter's functions to theirs. It is recorded only to fix the
boundary. Contributors should not attempt it under this roadmap.

- **Uniform asymptotic approximations** (DLMF §14.15, 14.15.1–14.15.31; §14.20(vii)–(ix),
  14.20.15–14.20.24; §14.26), and the Legendre example 2.10.33–2.10.36 that
  [AsymptoticExpansions](../AsymptoticExpansions/README.md) leaves to the special-function
  roadmaps. They approximate Legendre functions by Bessel functions
  (SpecialFunctionsBessel) and parabolic cylinder functions
  ([SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)), with
  the methods of AsymptoticExpansions. DLMF's
  `env` functions of 14.15.23 are degenerate at `c = 0` (the crossing point `X₀ = 0`), and the
  statement there needs `c > 0`; 14.20.17–14.20.18 need `α > 0` in the implicit relation
  14.20.21.
- **The generalized Mehler–Fock transformation** (DLMF §14.20(vi), 14.20.11–14.20.14). It needs an
  inversion theorem for the transform, with its function spaces, which DLMF does not state;
  14.20.13–14.20.14 are DLMF's special cases of it.
- **Branches off the principal sheet** (DLMF §14.24, 14.24.1–14.24.4): continuation along the
  ellipses with foci `±1` and around `1`, and the behaviour at `−1` from the left that DLMF
  derives from them. The holomorphy of the principal branches in the parameters, stated in the
  penultimate paragraph of §14.24, is 1.2.
- **Zeros in the complex plane and on the left cut** (DLMF §14.27). As printed, the rule for a
  zero of `P^μ_ν(x ± i0)` on `(−∞, −1)` is wrong: it predicts one zero at degree `ν = 1`, order
  `μ = −½`, where there is none.
- **Formulas of DLMF Chapter 10 through Legendre or Ferrers functions**: DLMF 10.22.66, 10.22.71,
  10.22.72 and 10.43.22.
- **References without formulas**: the expansion theorem of §14.18(i), the compendia of
  §14.18(iv), the Laplace and Mellin transforms of §14.17(v)–(vi), the zeros and integrals of
  §14.20(x), and the generalizations of §14.29 beyond 14.29.1.
- **Applications and computation** (DLMF §§14.31–14.34), the spheroidal harmonics of
  §14.30(i) beyond their definition as `P^m_n`, `Q^m_n` at real and imaginary argument, and the
  scaled oblate harmonics of Segura and Gil.
- **Sections with nothing to formalize**: the notation of §14.1 and the graphics of §§14.4,
  14.20(ii) and 14.22.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/Legendre/` provides source material for every layer, including the corrected statements of
14.14.1, §14.16 and 14.23.7. That development defines the Ferrers functions on the real interval
`(−1, 1)` and `𝑸^μ_ν` with the separate factors `(z − 1)^{μ/2} (z + 1)^{μ/2}` that this roadmap
also pins; this roadmap defines the Ferrers functions on the doubly cut plane `D`.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Legendre/Basic`, `Associated`, `Ferrers`, `SecondKind`, `LocalTheory`, `ParameterLimits` |
| 2 | `Legendre/Recurrences`, `AssociatedRecurrences` |
| 3 | `Legendre/Hypergeometric`, `RelatedFunctions`, `SpecialValues` |
| 4 | `Legendre/SpecialValues`, `Integer`, `IntegerTheory`, `Singularities`, `BoundaryAsymptotics`, `Series` |
| 5 | `Legendre/Connections`, `Continuation` |
| 6 | `Legendre/Series` (continued fractions), `FirstKindProperties` |
| 7 | `Legendre/IntegralRepresentations`, `Integrals`, `IntegralTools`, `Neumann`, `Laplace`, `Primitives` |
| 8 | `Legendre/FourierCoefficients`, `FourierEstimates`, `FourierTools`, `Sums`, `ZonalSeries`, `AdditionTools`, `QAdditionTools` |
| 9 | `Legendre/Zeros`, `ZeroCounts`, `ZeroTools` |
| 10 | `Legendre/Toroidal`, `Conical`, `Continuation` |
| 11 | `Legendre/Harmonics` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 14
  (T. M. Dunster), <https://dlmf.nist.gov/14>. Every equation number refers to this release.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapter 5, §§12–15.
- A. Erdélyi, W. Magnus, F. Oberhettinger and F. G. Tricomi, *Higher Transcendental Functions*,
  Vol. I, McGraw-Hill, 1953, Chapter III.
- E. W. Hobson, *The Theory of Spherical and Ellipsoidal Harmonics*, Cambridge University Press,
  1931.
- J. C. Adams, On the expression of the product of any two Legendre's coefficients by means of a
  series of Legendre's coefficients, *Proc. Roy. Soc. London* 27 (1878), 63–71.
- T. M. Dunster, Conical functions with one or both parameters large, *Proc. Roy. Soc. Edinburgh
  Sect. A* 119 (1991), 311–327.
- H. Volkmer, Fourier series representation of Ferrers function `𝖯`, 2021 (cited by DLMF §14.13
  as Volkmer (2021)).
- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapter 9 (spherical harmonics).

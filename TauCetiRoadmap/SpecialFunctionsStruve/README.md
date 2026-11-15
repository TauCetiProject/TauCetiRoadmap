# Roadmap: Inhomogeneous Bessel equations: Struve, Lommel, Anger and Weber functions

**Summary.** This roadmap builds the theory of the classical particular solutions of the
inhomogeneous Bessel equation `w″ + w′/z + (1 − ν²/z²) w = f` with power or trigonometric forcing
as a library: the Lommel functions `s_{μ,ν}`, `S_{μ,ν}` (forcing `z^{μ−1}`), the Struve functions
`𝐇_ν`, `𝐋_ν`, `𝐊_ν`, `𝐌_ν`, and the Anger, Weber and Anger–Weber functions `𝐉_ν`, `𝐄_ν`, `𝐀_ν`.
Neither Mathlib nor Tau Ceti has any of them. Its organization follows the structure of the
subject rather than any one text. Lommel's functions are the general particular integrals for
power forcing and come first; the Struve functions are the case `μ = ν`, and the Anger and Weber
functions combine the cases `μ = 0` and `μ = −1`, as Dingle (Ch. XVIII) and
Magnus–Oberhettinger–Soni (§3.10.2) arrange them. The theory is then developed across the three
families by method: the algebraic relations, the integral representations, Watson's lemma at large
argument, the integrals over the half-line, large order, and the turning point `z = ν`, where
Scorer's function enters and Olver's uniform expansion joins the regimes. The content is drawn from
Olver (*Asymptotics and Special Functions*, Chs. 3, 7 and 9), Magnus–Oberhettinger–Soni
(*Formulas and Theorems for the Special Functions of Mathematical Physics*, §3.10),
Gradshteyn–Ryzhik (*Table of Integrals, Series, and Products*, §§6.81–6.82, 8.55, 8.57–8.58),
Dingle (*Asymptotic Expansions*, Chs. VIII, XVIII–XIX), Wong (*Asymptotic Approximations of
Integrals*, Chs. II and VII), Duverney (*An Introduction to Hypergeometric Functions*, Ch. 7) and
the NIST *Digital Library of Mathematical Functions* (DLMF), and each headline cites its sources;
see [References](#references).

Mathlib has the Bessel function `Complex.besselJ` and the regularized generalized hypergeometric
series `Complex.regularizedHGFun`, which is entire when it has no more numerator than denominator
parameters. The Struve and Lommel functions are its `₁F₂` case: with
`𝐅₁₂(b₁, b₂; x) = Complex.regularizedHGFun {1} {b₁, b₂} x = ∑ₖ xᵏ/(Γ(b₁ + k) Γ(b₂ + k))`,

```text
𝐇_ν(z) = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2; −z²/4)                                   (DLMF 11.2.1)
𝐋_ν(z) = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2;  z²/4)                                   (DLMF 11.2.2)
𝐉_ν(z) = π⁻¹ ∫₀^π cos(νθ − z sin θ) dθ                                          (DLMF 11.10.1)
𝐄_ν(z) = π⁻¹ ∫₀^π sin(νθ − z sin θ) dθ                                          (DLMF 11.10.2)
```

The roadmap covers:
- the `₁F₂` series and the superposition principle; the Lommel, Struve, Anger and Weber functions,
  their holomorphy in the variable and the parameters, their equations and the general solutions
  (Layer 1);
- the relations between the families, the recurrences and derivatives, the primitives (with DLMF
  10.22.2 and 10.43.2), the elementary and Fresnel forms at half-odd orders, the expansions in
  series of Bessel functions, the relative bound and the continuation to other sheets (Layer 2);
- the Poisson integrals, the Hankel and Laplace representations of `S_{μ,ν}`, the Laplace
  integrals of `𝐊_ν`, `𝐀_ν` and `S_{0,ν}`, and the Mellin–Barnes integrals (Layer 3);
- the expansions for large argument of `S_{μ,ν}`, `𝐊_ν`, `𝐌_ν`, `𝐀_ν` and of the integrated
  Struve functions (Layer 4);
- the integrals over the half-line and the Laplace transforms (Layer 5);
- large order, at fixed argument and at argument proportional to the order (Layer 6);
- the turning point `z = ν`: Scorer's function and Olver's uniform expansion (Layer 7).

The roadmap states the corrected forms of DLMF 11.4.15, 11.7.12, 11.11.6 and 11.11.18–11.11.19
(see [Prior formalization](#prior-formalization)) and the corrected sector of 11.11.8 (6.3).

The roadmap rests on Mathlib, Tau Ceti and six roadmaps. It consumes the Bessel functions `Y_ν`,
`I_ν`, `K_ν`, the Hankel functions and their theory from
[SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md), which every layer uses; Scorer's
function `Hi` from [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md) for the turning point
(Layer 7); the Fresnel integrals from
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md) for
the half-odd orders of the Anger function (2.4); the Gauss function from
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) for the Laplace
representation of `S_{μ,ν}` (3.3); Watson's lemma, Laplace's method, the cubic normal form and the
Mellin tools from [AsymptoticExpansions](../AsymptoticExpansions/README.md); and complex Stirling
from [ZerosOfLFunctions](../ZerosOfLFunctions/README.md).

Suggested home: `TauCeti/Analysis/SpecialFunctions/Struve/`, beside the Bessel functions of
SpecialFunctionsBessel.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Inhomogeneous Bessel equations and their series solutions** (1.1–1.5).
2. **Relations, recurrences and closed forms** (2.1–2.6).
3. **Poisson, Laplace and Barnes integrals** (3.1–3.4).
4. **Large argument** (4.1–4.4).
5. **Integrals over the half-line** (5.1–5.2).
6. **Large order** (6.1–6.3).
7. **The turning point `z = ν`** (7.1–7.2).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

**Inputs.** Mathlib and Tau Ceti already prove, and the layers consume:
- that `𝐅₁₂(b₁, b₂; x)` is entire in `x` for fixed `b₁`, `b₂`: Mathlib's
  `Complex.analyticAt_regularizedHGFun_of_card_le` and
  `Complex.radius_regularizedHGFunSeries_eq_top`;
- its series as a `HasSum` statement: Tau Ceti's `Complex.hasSum_regularizedHGFun`;
- Bessel's `J_ν` with its series and holomorphy: Mathlib's `Complex.besselJ_def` and
  `Complex.analyticOnNhd_besselJ`.

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
provides:
- superposition for `w″ + w′/z + (σ − ν²/z²) w = f` on the slit plane, `σ = ±1`: every solution is
  one particular solution plus a solution of the homogeneous equation (1.1);
- the holomorphy of `𝐅₁₂(b₁, b₂; x)` in the parameters (1.1);
- the removable singularities of the Lommel function `S_{μ,ν}` and of `𝐀_ν` in the parameters
  (1.2, 1.5), and the equation of `𝐀_ν` (1.5);
- the Hankel and Laplace representations of `S_{μ,ν}` (3.2, 3.3);
- the reciprocal-Gamma bounds on the lines `Re s = N + ½`, uniform in `N`, and on the strips of
  the line shifts (3.4);
- Debye's leading term for `I_ν(λν)` with complex `ν` in `|ph ν| ≤ π/2 − δ` and fixed `λ > 0`
  (6.2);
- the power-series coefficients `c_k(λ)`, `a_k(λ)` and the saddle coefficients `b_k(λ)` of the
  scaled expansions (6.2, 6.3), and the coefficients `q_s(α)` and the shifted Scorer moments
  `Qiₛ` of the uniform expansion (7.2).

**What it does not own:**
- The Bessel and Hankel functions and their theory (SpecialFunctionsBessel), `Complex.besselJ`
  and `Complex.regularizedHGFun` (Mathlib), Scorer's functions (SpecialFunctionsAiry), the
  Fresnel integrals (SpecialFunctionsEiLiErfIncompleteGamma), the general asymptotic methods
  (AsymptoticExpansions) and complex Stirling (ZerosOfLFunctions).
- The generalized hypergeometric functions `pFq` beyond Mathlib's series, which belong to the
  roadmap for the generalized hypergeometric functions. This roadmap uses `𝐅₁₂` only as Mathlib's entire series.
- The Struve functions of argument `x e^{±3πi/4}`, the Lommel functions of two variables and the
  formulas of the Bessel theory through these functions other than DLMF 10.22.2 and 10.43.2; see
  the last section.

**The boundary in one sentence:** this roadmap owns the principal branches of `𝐇_ν`, `𝐋_ν`,
`𝐊_ν`, `𝐌_ν`, `s_{μ,ν}`, `S_{μ,ν}`, `𝐉_ν`, `𝐄_ν` and `𝐀_ν` for all complex orders, and the results
stated through them, the Bessel, Hankel, Scorer and Fresnel functions, `Γ` and elementary functions
that the layers list, together with DLMF 10.22.2 and 10.43.2; it consumes the Bessel functions
from SpecialFunctionsBessel.

## Conventions

- **Names.** The functions live in `Complex`, beside Mathlib's `Complex.besselJ` and
  SpecialFunctionsBessel's `Complex.besselY`, with the orders first, then the argument:
  - `Complex.struveH ν z` for `𝐇_ν(z)`, `Complex.struveL ν z` for `𝐋_ν(z)`;
  - `Complex.struveK ν z` for `𝐊_ν(z)`, `Complex.struveM ν z` for `𝐌_ν(z)`;
  - `Complex.lommelSmallS μ ν z` for `s_{μ,ν}(z)`, `Complex.lommelCapitalS μ ν z` for
    `S_{μ,ν}(z)`;
  - `Complex.angerJ ν z` for `𝐉_ν(z)`, `Complex.weberE ν z` for `𝐄_ν(z)`,
    `Complex.angerWeberA ν z` for `𝐀_ν(z)`.

  No real-valued copies are introduced: a statement at a real argument is the statement at
  `(x : ℂ)`, and reality is `Complex.im _ = 0`. Derivatives are Mathlib's `deriv`; no derivative
  functions are introduced.
- **The series.** `𝐅₁₂(b₁, b₂; x)` is Mathlib's `Complex.regularizedHGFun {1} {b₁, b₂} x`, entire
  in `x` for fixed `b₁`, `b₂` (Mathlib `Complex.analyticAt_regularizedHGFun_of_card_le` and the
  radius lemma `Complex.radius_regularizedHGFunSeries_eq_top`). Its holomorphy in the parameters
  is not in Mathlib; it is a target of 1.1. It is used only as this series.
- **The definitions.** With principal powers, `J_ν = Complex.besselJ`, and SpecialFunctionsBessel's
  `Y_ν = Complex.besselY`, `I_ν = Complex.besselI`:

```text
struveH ν z = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2; −z²/4)                                  (11.2.1)
struveL ν z = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2;  z²/4)                                  (11.2.2)
struveK ν z = struveH ν z − Y_ν(z),   struveM ν z = struveL ν z − I_ν(z)            (11.2.5–11.2.6)
lommelSmallS μ ν z = 2^{μ−1} Γ(a) Γ(b) (z/2)^{μ+1} 𝐅₁₂(a + 1, b + 1; −z²/4)          (11.9.3)
T μ ν z = (z/2)^{μ+1} 𝐅₁₂(a + 1, b + 1; −z²/4) + sin(½(μ − ν)π) J_ν(z) − cos(½(μ − ν)π) Y_ν(z)
lommelCapitalS μ ν z = 2^{μ−1} Γ(a) Γ(b) T μ ν z            a, b ∉ {0, −1, −2, …}   (11.9.5)
angerJ ν z = π⁻¹ ∫₀^π cos(νθ − z sin θ) dθ                                          (11.10.1)
weberE ν z = π⁻¹ ∫₀^π sin(νθ − z sin θ) dθ                                          (11.10.2)
angerWeberA ν z = (𝐉_ν(z) − J_ν(z)) / sin νπ                                ν ∉ ℤ   (11.10.15)
angerWeberA n z = (π cos nπ)⁻¹ ∂_ν(𝐉_ν(z) − J_ν(z))|_{ν=n}                  n ∈ ℤ
```

  where `a = ½(μ − ν + 1)` and `b = ½(μ + ν + 1)`; `Suggested.lean` writes
  `2^{μ−1} Γ(a) Γ(b) T μ ν z` as `lommelCapitalSFormula μ ν z`. At the exceptional parameters, where
  `a` or `b` lies in `{0, −1, −2, …}` (that is, `μ ± ν ∈ {−1, −3, −5, …}`), `lommelCapitalS μ ν z`
  is the limit of the same expression at `μ′ → μ` with `ν` fixed (`limUnder (𝓝[≠] μ)`), which exists
  (1.2); DLMF prescribes this limit. The integer case of `angerWeberA` is selected by
  `∃ n : ℤ, (n : ℂ) = ν`, and `∂_ν` is `deriv` in the order at fixed `z`; 1.5 proves that the two
  cases glue to an entire function of `ν`, which is DLMF's limit at integer order. `lommelSmallS`
  takes the junk value of Mathlib's `Γ` at the exceptional parameters, where DLMF leaves `s_{μ,ν}`
  undefined, and no theorem uses it. `lommelSmallS μ ν z` equals DLMF's series 11.9.3,
  `z^{μ+1} ∑ₖ (−1)ᵏ z^{2k}/a_{k+1}(μ, ν)`, which is a target (1.2).
- **Reciprocal Gamma factors** are `(Gamma ·)⁻¹`, which vanish at the poles, so a formula with `Γ`
  only in denominators holds for all parameters. A `Γ` in a numerator carries the hypothesis that
  its argument is not a pole. `(a)ₖ` is `(ascPochhammer ℂ k).eval a`, and `γ` is
  `Real.eulerMascheroniConstant`.
- **Branches and the cut.** All powers and logarithms are principal. The functions of `z` are
  holomorphic on `Complex.slitPlane`, except `𝐉_ν` and `𝐄_ν`, which are entire. The normalized
  functions `(z/2)^{−ν−1} 𝐇_ν(z)`, `(z/2)^{−ν−1} 𝐋_ν(z)` and `z^{−μ−1} s_{μ,ν}(z)` extend to entire
  even functions, the series cores `𝐅₁₂(3/2, ν + 3/2; −z²/4)`, `𝐅₁₂(3/2, ν + 3/2; z²/4)` and
  `¼ Γ(a) Γ(b) 𝐅₁₂(a + 1, b + 1; −z²/4)` (at regular parameters); the statements use the cores,
  which equal the products for `z ≠ 0` in the slit plane. The products themselves, with Mathlib's
  `0 ^ w`, are not continuous at `0` and are not used there. The values of the functions on
  `(−∞, 0]` are those of the principal branch and are used only where a formula of a source
  evaluates there. Statements involving `z e^{mπi}` are written for those `z` for which `z e^{mπi}`
  has principal phase `ph z + mπ`, as in SpecialFunctionsBessel; the other sheets are in the last
  section.
- **Equations are not predicates.** A solution of an inhomogeneous Bessel equation on an open set
  `U` is stated with `DifferentiableOn ℂ w U` and the equation at each point of `U`, with `deriv`
  and `deriv^[2]`.
- **Sectors at infinity.** "As `z → ∞` in `|ph z| ≤ θ`" is the filter
  `Bornology.cobounded ℂ ⊓ 𝓟 {z | |Complex.arg z| ≤ θ}`, written out in each statement, and
  likewise for a large order `ν`. "`ν` bounded away from the integers" adds
  `𝓟 {ν | ∀ n : ℤ, ε ≤ ‖ν − n‖}` for some `ε > 0`. Real limits are `atTop` on `ℝ`.
- **Asymptotic expansions** are AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion`, which
  unfolds to "for every `N`, the remainder after `N` terms is `O(φ N)`". A single-term `f ∼ g` is
  `Asymptotics.IsEquivalent`, and `O(·)` is `Asymptotics.IsBigO`. Divergent series are never
  summed. A uniform statement in a second variable is written along `l ⊓ 𝓟 {p | p.2 ∈ K}` on the
  product.
- **Integrals.** "`∫₀^∞ f = L` as an improper integral" means
  `Tendsto (fun R ↦ ∫ t in (0)..R, f t) atTop (𝓝 L)`, used for the conditionally convergent
  integrals 11.5.7, 11.7.8–11.7.11. Where an integrand is absolutely integrable, the statement uses
  the Bochner integral with an `IntegrableOn` hypothesis or conclusion. An indefinite integral
  `∫ f dz = F` is the derivative statement `HasDerivAt F (f z) z` on the slit plane.
- **Coefficients of the scaled expansions.** For `λ ∈ ℂ` with `λ ≠ 0`, `c_k(λ)` of DLMF 11.6.6
  (`struveScaledCoeff λ k`) is `λ` times the coefficient of `tᵏ` in the power series at `0` of
  `(1 + t²)^{−1/2} (t/(λt − ln(1 + t²)))^{k+1}`. For `λ ≠ −1`, `a_k(λ)` of DLMF 11.11.8
  (`angerScaledCoeff λ k`) is the coefficient of `t^{2k}` in the power series of
  `(t/(t + λ sinh t))^{2k+1}`. Both are coefficients of explicit power series with nonzero constant
  term in the denominator (`PowerSeries.coeff` of a product of inverses over `ℂ`); 6.2 and 6.3
  prove that they are the Watson's-lemma coefficients of the corresponding integrals
  (Lagrange–Bürmann) and check DLMF's printed values. The saddle coefficients `b_k(λ)` of DLMF
  11.11.11 are defined in 6.3, and the coefficients `q_s(α)` and moments `Qiₛ` of Olver's uniform
  expansion in 7.2.

## Exact supplier contracts

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- [Its Conventions](../SpecialFunctionsBessel/README.md#conventions): `Complex.besselY`,
  `Complex.hankelH1`, `Complex.hankelH2`, `Complex.besselI`, `Complex.besselK : ℂ → ℂ → ℂ`, order
  first, holomorphic on `Complex.slitPlane`, with `deriv` in the order at integer orders; the
  sector filter; and the spherical functions `Complex.sphericalBesselJ` and
  `Complex.modifiedSphericalBesselI1`, `…I2`.
- 1.1, 1.4: Bessel's equation for `J_ν`, `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, uniqueness and the span of its
  solutions on the slit plane, the connection formulas 10.4.1–10.4.8 and the Wronskians
  10.5.1–10.5.5; 1.2: holomorphy in the order. For 1.2–1.5, 2.1, 3.1–3.3 and 4.1.
- 1.5: the recurrences and derivatives 10.6.1–10.6.7, for 2.2.
- 1.3–1.4: `I_ν`, `K_ν`, their equation, connection formulas and Wronskians, for 1.4.
- Its Conventions and 2.1: the power series 10.2.2 and 10.8.1, and 2.2: the limiting forms, for
  Layers 1–2.
- 5.1: Bessel's integral 10.9.2, Poisson's integral 10.9.4 and Schläfli's integrals 10.9.6–10.9.7,
  for Layer 3 and 1.5, and the Poisson integral 10.32.2 of `I_ν`, for 6.2.
- 4.2: the multiplication and addition theorems 10.23.1–10.23.5, and 4.4: the Neumann expansion
  10.23.15 of `(z/2)^ν`, for 2.5.
- 2.3: the half-odd orders 10.16.1–10.16.2 and 10.39.1–10.39.2, for 2.4.
- 6.1–6.2: the expansions of `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `K_ν`, `J_ν`, `Y_ν` and `I_ν` for large argument,
  for Layer 4.
- Its Conventions and 9.1: the Debye polynomials `Real.debyeU k` and Debye's expansions of `I_ν`,
  `K_ν` for real large order, for the check in 6.2 and for 11.11.13_5 in 6.3.
- 11.1: the primitive 10.22.1, and 11.4: the primitive 10.43.1, for 2.3; 11.2: the Mellin
  transforms 10.22.43–10.22.44 of `J_ν` and `Y_ν`, for 3.2.
- 6.1 also for 3.2–3.3: the large-argument expansions of `H⁽¹⁾_ν`, `H⁽²⁾_ν`; and 2.1, 4.4 for 2.5.
- 3.1–3.2: the spherical functions and their explicit forms, for 2.4.

### From [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md)

- [Its Conventions](../SpecialFunctionsAiry/README.md#conventions) and 6.1: Scorer's function
  `TauCeti.scorerHi`, `Hi(z) = π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt`, entire; and 6.2: its value
  `Hi(0) = 2 Gi(0) = 2/(3^{7/6} Γ(⅔))`, with DLMF 9.12.6 for `Gi(0)`. For Layer 7.

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.gaussHypergeometric a b c z`, the principal branch on `1 − z ∈ slitPlane`, which
  `Suggested.lean` copies together with its auxiliary definitions `eulerIntegral` and
  `IsEulerContinuation`; 1.2–1.4: its series on the unit disk and its holomorphy in the parameters;
  3.1: the hypergeometric equation; 5.1: the connection formula 15.8.2 at `∞`. For the Laplace
  representation of 3.3.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- [Its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions): the Fresnel
  integrals `TauCeti.fresnelC`, `TauCeti.fresnelS` of DLMF 7.2.7–7.2.8, entire; and its 11.4:
  their series 7.6.4–7.6.7. For 2.4.

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- [Its Conventions](../AsymptoticExpansions/README.md#conventions):
  `Asymptotics.HasAsymptoticExpansion` and the sector filters.
- 1.5: integration of expansions, for 4.4.
- 4.2: Watson's lemma in a sector (`hasAsymptoticExpansion_laplace_sector`), for Layer 4, 6.2 and
  6.3; it is stated for `|ph z| ≤ π/2 − δ`.
- 4.3: rotation of the path (`hasAsymptoticExpansion_rayLaplace`), which extends Watson's lemma to
  `|ph z| ≤ π − δ`, for 3.3, Layer 4 and 6.3.
- 5.1: the coefficients `b_s`, for 6.3; 5.2, 5.4–5.5: Laplace's method on the real line and on a
  contour, and saddle points (`hasAsymptoticExpansion_laplace_method`,
  `hasAsymptoticExpansion_laplace_contour`), for 4.2, 6.2, 6.3 and 7.1.
- 6.2: stationary phase at an endpoint (`isBigO_stationaryPhase_remainder`), for 7.1.
- 7.3: the cubic normal form of Chester, Friedman and Ursell, for 7.2.
- 8.2: the line shift with simple poles (`integral_vertical_sub_eq_two_pi_mul_sum_residue`), and
  8.6: the pole-separated bound for `Γ` on vertical strips (`exists_norm_Gamma_le`), for 3.4.

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- 1.2: Stirling's formula in the sector `|ph s| ≤ π − δ` (DLMF 5.11.1), for 4.4 and 6.1.
- 1.3: `log |Γ|` on vertical strips (DLMF 5.11.9), for the reciprocal-Gamma bounds of 3.4.

### From Tau Ceti

- `Complex.hasSum_regularizedHGFun`
  (`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`): for `a.card ≤ b.card`,
  `HasSum (fun n ↦ regularizedHGFunCoeff a b n * z ^ n) (regularizedHGFun a b z)` for every `z`.
  For 1.3 and 2.1.

### From Mathlib

- **Bessel and hypergeometric series.** `Complex.besselJ` and its lemmas (`Complex.besselJ_def`,
  `Complex.analyticOnNhd_besselJ`, `Complex.besselJ_int_neg`, `Complex.two_mul_self_mul_besselJ`);
  `Complex.regularizedHGFun`, `Complex.regularizedHGFunCoeff`,
  `Complex.analyticAt_regularizedHGFun_of_card_le`, `Complex.radius_regularizedHGFunSeries_eq_top`.
- **Gamma.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_ne_zero`,
  `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_mul_Gamma_one_sub` (reflection),
  `Complex.Gamma_mul_Gamma_add_half` (duplication), `Complex.betaIntegral`,
  `Real.eulerMascheroniConstant`.
- **Holomorphic functions.** `Complex.slitPlane`, `Complex.cpow`, `Complex.log`,
  `DifferentiableOn.analyticOnNhd`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, the
  Cauchy theorem for rectangles `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.
- **Analysis.** `intervalIntegral`, `MeasureTheory.integral` on `Set.Ioi`, Fubini, dominated
  convergence, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `Asymptotics.IsEquivalent`,
  `Asymptotics.IsBigO`, `HasSum`, `PowerSeries.coeff`, `PowerSeries.inv`.

## How to read the build

Layer 1 starts from the inhomogeneous Bessel equation. Every solution is one particular solution
plus a solution of Bessel's equation (1.1), so each general-solution formula reduces to
SpecialFunctionsBessel's span of `J_ν`, `Y_ν`. The Lommel functions are the power-series
particular integrals for the forcing `z^{μ−1}` (1.2); the Struve functions are Mathlib's `₁F₂` at
the forcing `z^{ν−1}` (1.3–1.4), and the Anger and Weber functions are defined by their integrals,
whose equations follow by differentiating under the integral sign (1.5). Layer 2 is algebra on
these series: the families are tied together first (2.1), and then the recurrences, primitives,
half-odd orders, Bessel-series expansions and bounds are series manipulations. Identities between
entire or holomorphic functions are proved for a parameter region or a disc and extended by the
identity theorem, in the variable on the slit plane and in each order. Layer 3 evaluates the
integral representations, and Layers 4, 6 and 7 apply AsymptoticExpansions to the Laplace
integrals of Layer 3 and the trigonometric integrals of 1.5: Watson's lemma at large argument,
Laplace's method and saddle points at large order, and the cubic normal form at the turning point.
Layer 5 uses the large-argument behaviour of Layer 4 for the convergence of the integrals over the
half-line. The `**Checks.**` and `### Examples` of each layer are statements to prove; they test
the conventions on explicit values. Every decimal value in them was computed independently of the
formula it checks.

## Layer 1: inhomogeneous Bessel equations and their series solutions

### 1.1 The `₁F₂` series and superposition

- **Holomorphy in the parameters** (auxiliary): for fixed `x` and entire functions `b₁(w)`,
  `b₂(w)`, `w ↦ 𝐅₁₂(b₁(w), b₂(w); x)` is entire. On a compact set of `w` there is `k₀` with
  `Re bⱼ(w) + k₀ ≥ 1`, and `1/Γ(bⱼ + k) = (Γ(bⱼ + k₀) (bⱼ + k₀)_{k−k₀})⁻¹` with
  `|(bⱼ + k₀)_{k−k₀}| ≥ (k − k₀)!` bounds the terms by `C |x|ᵏ/((k − k₀)!)²`, so the series
  converges uniformly there. The holomorphy of the Lommel and Struve functions in their orders
  rests on it (Olver, Ch. 7 §15.1, p. 275, for `𝐇_ν`).
- **Superposition** (auxiliary): for `σ = ±1`, `w` holomorphic on the slit plane solves
  `w″ + w′/z + (σ − ν²/z²) w = f` if and only if `w − w₀` solves the homogeneous equation, for
  any one solution `w₀` (Dingle, Ch. XVIII §1, p. 371).

**Checks.**
- `𝐅₁₂(3/2, 3/2; 0) = Γ(3/2)⁻² = 4/π`, and `𝐅₁₂(3/2, 3/2; −1) = 0.79085 88495 08…`, which is
  `𝐇₀(2)` (1.3).
- At `b₂ = −1` the terms of `𝐅₁₂(3/2, −1; x)` with `k ≤ 1` vanish, since `(Γ(−1 + k))⁻¹ = 0` for
  `k ∈ {0, 1}`; the parameter holomorphy holds through such points, where a version with `Γ` in
  the numerator would have poles.

*Needs:* Mathlib `Complex.regularizedHGFun`, `Complex.differentiable_one_div_Gamma`.

### 1.2 Lommel's functions: the particular integrals for power forcing

The definitions of [Conventions](#conventions): `lommelSmallS`, `lommelCapitalS`, with
`a_k(μ, ν) = ∏_{m=1}^{k} ((μ + 2m − 1)² − ν²)` (11.9.4). The targets:
- the series: for `μ ± ν ∉ {−1, −3, −5, …}` and `z` in the slit plane,
  `HasSum (fun k ↦ z^{μ+1} (−1)ᵏ z^{2k}/a_{k+1}(μ, ν)) (lommelSmallS μ ν z)`, and
  `a_k(μ, ν) = 4ᵏ (a)ₖ (b)ₖ` (Magnus–Oberhettinger–Soni, §3.10.1, p. 108; Gradshteyn–Ryzhik
  8.570.1 and 8.574.3, pp. 954–955; DLMF 11.9.3–11.9.4);
- the removable singularities (auxiliary): for `z` in the slit plane and every `ν`, the function
  `μ ↦ 2^{μ−1} Γ(a) Γ(b) T μ ν z` extends holomorphically across the exceptional `μ`, including
  the points where both `a` and `b` are poles; so `μ ↦ S_{μ,ν}(z)` is entire and equals the
  formula 11.9.5 at regular parameters; likewise `ν ↦ S_{μ,ν}(z)` is entire for every `μ`
  (`differentiable_lommelCapitalS`; Magnus–Oberhettinger–Soni, §3.10.1, p. 109;
  Gradshteyn–Ryzhik 8.570.2, p. 954; DLMF 11.9.5);
- the equation: `s_{μ,ν}` (regular parameters) and `S_{μ,ν}` (all parameters) solve
  `w″ + w′/z + (1 − ν²/z²) w = z^{μ−1}` on the slit plane, and for regular parameters every
  holomorphic solution on the slit plane is `s_{μ,ν} + A J_ν + B Y_ν` (`lommelCapitalS_ode`;
  Magnus–Oberhettinger–Soni, §3.10.1, p. 108; Gradshteyn–Ryzhik 8.577, p. 956; Dingle,
  Ch. XVIII, Ex. 8, p. 378; DLMF 11.9.1–11.9.2);
- the symmetry `s_{μ,−ν} = s_{μ,ν}` and `S_{μ,−ν} = S_{μ,ν}` (Magnus–Oberhettinger–Soni,
  §3.10.1, p. 109; DLMF 11.9.6).

**Checks.**
- `s_{0.5,0.2}(1.3) = 0.58290 01516 70…` and `S_{0.5,0.2}(1.3) = 0.83162 46005 51…`.
- `S_{0,0}(1) = 0.75461 00257 70…`.
- At the doubly exceptional `μ = −1`, `ν = 0` (`a = b = 0`), `S_{−1,0}(1) = 0.44223 64520 58…`,
  the limit from both sides of `μ = −1` and also the limit `ν → 0` at `μ = −1`.

*Suggested names:* `differentiable_lommelCapitalS` (the removable singularities),
`lommelCapitalS_ode` (11.9.1 for `S_{μ,ν}`).

*Needs:* 1.1; SpecialFunctionsBessel 1.1–1.2, 1.4.

### 1.3 The Struve functions

The definitions of [Conventions](#conventions): `struveH`, `struveL`, `struveK`, `struveM`. The
targets:
- the series:
  `HasSum (fun k ↦ (−1)ᵏ (z/2)^{2k+ν+1} / (Γ(k + 3/2) Γ(k + ν + 3/2))) (struveH ν z)` on the slit
  plane, and the same without `(−1)ᵏ` for `struveL` (`hasSum_struveH`; Olver, Ch. 7 §15.1, (15.02),
  p. 275; Gradshteyn–Ryzhik 8.550.1–8.550.2, p. 951; Duverney, Ex. 7.13, (7.57), p. 220; DLMF
  11.2.1–11.2.2);
- `𝐇₀(z) = (2/π) ∑ₖ (−1)ᵏ z^{2k+1}/((2k + 1)!!)²` and the same without `(−1)ᵏ` for `𝐋₀`, for all
  `z` (DLMF 11.2.3–11.2.4);
- holomorphy: `𝐇_ν`, `𝐋_ν`, `𝐊_ν`, `𝐌_ν` are holomorphic on the slit plane; the cores
  `𝐅₁₂(3/2, ν + 3/2; ∓z²/4)` are entire and even in `z`, equal `(z/2)^{−ν−1} 𝐇_ν(z)` and
  `(z/2)^{−ν−1} 𝐋_ν(z)` for `z ≠ 0` in the slit plane, and take the value
  `(Γ(3/2) Γ(ν + 3/2))⁻¹` at `z = 0`; at each point of the slit plane all four
  are entire in `ν`; for `n ∈ {−1, 0, 1, …}`, `𝐇_n` and `𝐋_n` are entire (Olver, Ch. 7 §15.1,
  p. 275; Magnus–Oberhettinger–Soni, §3.10.3, p. 113);
- `𝐋_ν(z) = −i e^{−iνπ/2} 𝐇_ν(iz)` for `z` and `iz` in the slit plane with `ph(iz) = ph z + π/2`,
  and reality: `𝐇_ν(x)`, `𝐋_ν(x)` are real for real `ν` and `x > 0` (Gradshteyn–Ryzhik 8.550.2,
  p. 951; Dingle, Ch. XVIII, Ex. 20, p. 381).

**Checks.**
- `𝐇₀(1) = 0.56865 66270 48…`, `𝐋₀(1) = 0.71024 31859 37…`, `𝐇₁(1) = 0.19845 73362 01…`.
- `𝐇_{0.3}(2 + i) = 1.04796 05147 68… + 0.22137 05975 10… i`.
- `𝐊₀(1) = 0.48039 96628 32…` and `𝐌₀(1) = −0.55582 26918 14…`.
- At `ν = 0.3`, `z = 0.7 + 0.4i` both sides of the relation between `𝐋_ν` and `𝐇_ν` are
  `0.28667 88555 41… + 0.25469 09934 81… i`.
- `𝐇_{−3/2}` is not entire: `(z/2)^{−1/2}` is a genuine branch, while `(z/2)^{1/2} 𝐇_{−3/2}(z)`
  is entire.

*Suggested names:* `hasSum_struveH` (11.2.1).

*Needs:* 1.1; SpecialFunctionsBessel Conventions, 1.1–1.3, 2.1; Tau Ceti
`Complex.hasSum_regularizedHGFun`; Mathlib `Complex.regularizedHGFun`.

### 1.4 Struve's equations and their general solutions

- For every `ν` and `z` in the slit plane,
  `w″ + w′/z + (1 − ν²/z²) w = (z/2)^{ν−1}/(√π Γ(ν + ½))` holds for `w = 𝐇_ν` and `w = 𝐊_ν`, and
  `w″ + w′/z − (1 + ν²/z²) w = (z/2)^{ν−1}/(√π Γ(ν + ½))` for `w = 𝐋_ν` and `w = 𝐌_ν`, with
  `(Γ(ν + ½))⁻¹` so that the right side vanishes at `ν ∈ {−½, −3/2, …}` (`struveH_ode`; Olver,
  Ch. 7 §15.1, (15.01), pp. 274–275; Magnus–Oberhettinger–Soni, §3.10.3, p. 113;
  Gradshteyn–Ryzhik 8.555, p. 952; Duverney, Ex. 7.13, (7.58), p. 220; DLMF 11.2.7–11.2.10).
- A holomorphic function on the slit plane solves the first equation if and only if it is
  `𝐇_ν + A J_ν + B Y_ν`, equivalently `𝐊_ν + A J_ν + B Y_ν`, `𝐇_ν + A J_ν + B H⁽¹⁾_ν`,
  `𝐇_ν + A J_ν + B H⁽²⁾_ν` or `𝐊_ν + A H⁽¹⁾_ν + B H⁽²⁾_ν`; it solves the second if and only if
  it is `𝐋_ν + A K_ν + B I_ν`, equivalently `𝐌_ν + A K_ν + B I_ν` (`struve_general_solution`;
  Olver, Ch. 7 §15.3, pp. 276–277; DLMF 11.2.11–11.2.17).

The equations are the coefficient recurrence of `𝐅₁₂`; the general solutions are superposition
(1.1) with SpecialFunctionsBessel's span of the homogeneous solutions.

**Checks.**
- At `ν = −½` the right side of 11.2.7 is `0`, and `𝐇_{−1/2} = J_{1/2}` (2.4) solves Bessel's
  equation.
- `𝐇₀` solves `w″ + w′/z + w = 2/(πz)`.

*Suggested names:* `struveH_ode` (11.2.7), `struve_general_solution` (11.2.11).

*Needs:* 1.1, 1.3; SpecialFunctionsBessel 1.1–1.5.

### 1.5 The Anger and Weber integrals and their equations

The definitions of [Conventions](#conventions): `angerJ`, `weberE`, `angerWeberA`. The targets:
- `𝐉_ν(z)` and `𝐄_ν(z)` are entire in `(ν, z)`, and
  `π⁻¹ ∫₀^{2π} cos(νθ − z sin θ) dθ = (1 + cos 2πν) 𝐉_ν(z) + sin(2πν) 𝐄_ν(z)`
  (Gradshteyn–Ryzhik 8.580, p. 957; Magnus–Oberhettinger–Soni, §3.10.4, p. 117; Olver, Ch. 3,
  Ex. 13.2, p. 103; DLMF 11.10.1–11.10.3);
- the removable singularities (auxiliary): for `z` in the slit plane, `ν ↦ 𝐀_ν(z)` is entire, so
  that `𝐉_ν = J_ν + sin(νπ) 𝐀_ν` holds for all `ν` (`differentiable_angerWeberA`,
  `angerJ_eq_besselJ_add`; Olver, Ch. 3, Ex. 13.3, p. 103; DLMF 11.10.15);
- `𝐉_ν` and `𝐄_ν` solve the inhomogeneous Bessel equations `w″ + w′/z + (1 − ν²/z²) w = f` with
  `f = (z − ν) sin(πν)/(πz²)` and `f = −(z + ν + (z − ν) cos(πν))/(πz²)` respectively, for
  `z ≠ 0` (Gradshteyn–Ryzhik 8.584, p. 958; Magnus–Oberhettinger–Soni, §3.10.4, p. 118; Dingle,
  Ch. XVIII, Exs. 1–2, p. 376; DLMF 11.10.5–11.10.7);
- the equation of `𝐀_ν` (auxiliary): `𝐀_ν` solves the same equation with `f = (z − ν)/(πz²)` for
  `z` in the slit plane. Off the integers it is the equation of `𝐉_ν` divided by `sin νπ`, since
  `𝐉_ν − J_ν = sin(νπ) 𝐀_ν` and `J_ν` solves Bessel's equation; at integer orders it follows by
  continuity in `ν` (Dingle, Ch. XIX §3, (20), p. 387, for `π𝐀_{−p}` in his notation).

**Checks.**
- `𝐉_{1/2}(1) = 0.85516 53096 79…`, `𝐄_{1/2}(1) = 0.09950 75426 40…`,
  `𝐀_{1/2}(1) = 0.18376 86025 37…`.
- `𝐀₁(1) = 0.14678 46936 16…`, an integer order where `(𝐉_ν − J_ν)/sin νπ` is `0/0`.
- `𝐉_{0.3}(0) = π⁻¹ ∫₀^π cos(0.3θ) dθ = sin(0.3π)/(0.3π) = 0.85839 36913 34…`.

*Suggested names:* `differentiable_angerWeberA` (the gluing), `angerJ_eq_besselJ_add` (11.10.15).

*Needs:* 1.1; SpecialFunctionsBessel 1.1–1.2, 1.4, 5.1.

### Examples

- `𝐋₀(x) − I₀(x) = 𝐌₀(x) < 0` at `x = 1` (`−0.55582…`).
- For real `ν`, `𝐋_ν(x) − 𝐇_ν(x) = 2(x/2)^{ν+3}/(Γ(5/2) Γ(ν + 5/2)) + O(x^{ν+7})` as `x → 0+`,
  with `(Γ(ν + 5/2))⁻¹`: the terms of the two series agree for even `k` and are opposite for odd
  `k`. At `ν = 0` the difference is `4x³/(9π) + O(x⁷)`.
- `μ = 1`, `ν = 0`: `a = b = 1`, `s_{1,0}(z) = ∑ₖ (−1)ᵏ z^{2k+2}/(4^{k+1} ((k + 1)!)²) = 1 − J₀(z)`,
  `S_{1,0} = s_{1,0} + J₀ = 1` by 11.9.5, and `1` solves `w″ + w′/z + w = 1`.

### Dependencies

SpecialFunctionsBessel Conventions, 1.1–1.5, 2.1, 5.1; Tau Ceti
`Complex.hasSum_regularizedHGFun`; Mathlib.

## Layer 2: relations, recurrences and closed forms

### 2.1 How the families are related

- Struve as Lommel: `s_{ν,ν} = 2^{ν−1} √π Γ(ν + ½) 𝐇_ν` and `S_{ν,ν} = 2^{ν−1} √π Γ(ν + ½) 𝐊_ν`
  for `ν + ½ ∉ {0, −1, −2, …}` (Magnus–Oberhettinger–Soni, §3.10.2, pp. 111–112;
  Gradshteyn–Ryzhik 8.573.5–8.573.6, p. 955; Dingle, Ch. XVIII, Ex. 18, p. 381).
- The Anger–Weber series, with `S₁(ν, z) = 𝐅₁₂(1 + ν/2, 1 − ν/2; −z²/4)` and `S₂` the odd
  series, for all `ν`, `z` (Gradshteyn–Ryzhik 8.581, p. 957; Magnus–Oberhettinger–Soni, §3.10.4,
  p. 117; DLMF 11.10.8–11.10.11).
- The symmetries and the relations between `𝐉_ν` and `𝐄_ν`, among them
  `sin(νπ) 𝐉_ν = cos(νπ) 𝐄_ν − 𝐄_{−ν}` and `sin(νπ) 𝐄_ν = 𝐉_{−ν} − cos(νπ) 𝐉_ν`
  (Magnus–Oberhettinger–Soni, §3.10.4, p. 118; DLMF 11.10.12–11.10.14).
- The relations to the Bessel functions and `𝐀_ν` on the slit plane, and to the Lommel functions
  `s_{0,ν}`, `s_{−1,ν}` for `ν ∉ ℤ` (Gradshteyn–Ryzhik 8.574.1–8.574.2, p. 955; DLMF
  11.10.15–11.10.18).
- `𝐄_n` and `𝐄_{−n}` for `n ≥ 1` through `𝐇_{±n}` and finite sums over `0 ≤ k ≤ m₁` and
  `0 ≤ k ≤ m₂`, with `m₁ = ⌊(n − 1)/2⌋` and `m₂ = ⌈(n − 3)/2⌉`, the sum for `𝐄_{−n}` being empty
  at `n = 1` (Gradshteyn–Ryzhik 8.552.1–8.552.2, p. 952; Magnus–Oberhettinger–Soni, §3.10.3,
  p. 115; DLMF 11.10.22–11.10.24).
- The values at `z = 0`, `𝐄₀ = −𝐇₀` and `𝐄₁ = 2/π − 𝐇₁`, the order derivatives at `ν = 0`, and
  `𝐉_n = J_n` for `n ∈ ℤ` (Magnus–Oberhettinger–Soni, §3.10.4, p. 118; DLMF 11.10.25–11.10.29).

**Checks.**
- `𝐄₀(1) = −𝐇₀(1) = −0.56865 66270 48…` and `𝐄₁(1) = 2/π − 𝐇₁(1) = 0.43816 24361 65…`.
- `𝐉_{0.3}(0) = sin(0.3π)/(0.3π) = 0.85839 36913 34…` (11.10.25).
- 11.10.22 at `n = 1` has the single term `k = 0`, `π⁻¹ Γ(½)/Γ(3/2) = 2/π`, and gives
  `𝐄₁ = 2/π − 𝐇₁`, which is 11.10.26.
- `S_{0,0}(1) = (π/2) 𝐊₀(1) = 0.75461 00257 70…`.

*Needs:* Layer 1; SpecialFunctionsBessel 1.1–1.2, 1.4, 5.1; Tau Ceti
`Complex.hasSum_regularizedHGFun`.

### 2.2 Three-term recurrences and derivative identities

- Struve: on the slit plane (the last two for all `z`),
  `𝐇_{ν−1} + 𝐇_{ν+1} = (2ν/z) 𝐇_ν + (z/2)^ν/(√π Γ(ν + 3/2))`,
  `2𝐇′_ν = 𝐇_{ν−1} − 𝐇_{ν+1} + (z/2)^ν/(√π Γ(ν + 3/2))`, the same for `𝐋_ν` with the signs of
  11.4.25–11.4.26, the weighted derivatives, the iterated form with `(z⁻¹ d/dz)^m`, and
  `𝐇′₀ = 2/π − 𝐇₁`, `(z 𝐇₁)′ = z 𝐇₀` and their `𝐋` forms. Each holds with `(Γ(·))⁻¹` for all `ν`
  (`struveH_recurrence`; Gradshteyn–Ryzhik 8.553.2–8.553.5, p. 952; DLMF 11.4.23–11.4.33).
- Anger–Weber: for all `ν` and `z ≠ 0`,
  `𝐉_{ν−1} + 𝐉_{ν+1} = (2ν/z) 𝐉_ν − (2/(πz)) sin(πν)`, `2𝐉′_ν = 𝐉_{ν−1} − 𝐉_{ν+1}`, the `𝐄_ν`
  forms with `1 − cos(πν)`, and the weighted forms (Gradshteyn–Ryzhik 8.582, p. 957;
  Magnus–Oberhettinger–Soni, §3.10.4, p. 118; DLMF 11.10.32–11.10.37).
- Lommel: on the slit plane, `s_{μ+2,ν} = z^{μ+1} − ((μ + 1)² − ν²) s_{μ,ν}`,
  `s′_{μ,ν} + (ν/z) s_{μ,ν} = (μ + ν − 1) s_{μ−1,ν−1}`,
  `s′_{μ,ν} − (ν/z) s_{μ,ν} = (μ − ν − 1) s_{μ−1,ν+1}`, and the two combinations
  `(2ν/z) s_{μ,ν} = (μ + ν − 1) s_{μ−1,ν−1} − (μ − ν − 1) s_{μ−1,ν+1}` and
  `2 s′_{μ,ν} = (μ + ν − 1) s_{μ−1,ν−1} + (μ − ν − 1) s_{μ−1,ν+1}`, wherever every `s` in the
  identity has regular parameters; the same five identities for `S_{μ,ν}` at all parameters
  (Magnus–Oberhettinger–Soni, §3.10.1, p. 109; Gradshteyn–Ryzhik 8.575.1–8.575.5, p. 955). The
  identities for `S` follow at regular parameters from those for `s` and the Bessel recurrences,
  and at the exceptional ones by continuity in `μ` (1.2).

**Checks.**
- The Struve recurrence at `ν = 0` gives `𝐇₋₁ = 2/π − 𝐇₁`, and then the derivative formula at
  `ν = 0` gives `𝐇′₀ = ½(2/π − 2𝐇₁ + 2/π) = 2/π − 𝐇₁`, which is 11.4.32. With the opposite sign of
  the inhomogeneous term it would give `𝐇′₀ = −𝐇₁`, which fails at `z = 0`, where `𝐇′₀(0) = 2/π`.
- At `ν = n ∈ ℤ`, 11.10.32 is 10.6.1 for `J_n` by `𝐉_n = J_n` (2.1).
- At `μ = 0.35`, `ν = 0.72`, `z = 1.9`: `s_{μ,ν}(z) = 1.28269 53192 30…` and
  `s_{μ+2,ν}(z) = 0.70581 48348 72… = z^{μ+1} − ((μ + 1)² − ν²) s_{μ,ν}(z)`; likewise
  `S_{μ,ν}(z) = 0.66838 49030 77…` and `S_{μ+2,ν}(z) = 1.50693 70485 78…`, with the same forcing
  term `z^{μ+1}`, because the Bessel part of `S` satisfies the homogeneous recurrence.

*Suggested names:* `struveH_recurrence` (11.4.23).

*Needs:* 1.2–1.5, 2.1; SpecialFunctionsBessel 1.5.

### 2.3 Primitives

- As derivative statements on the slit plane: `(z^ν 𝐇_ν)′ = z^ν 𝐇_{ν−1}`,
  `(−z^{−ν} 𝐇_ν + 2^{−ν} z/(√π Γ(ν + 3/2)))′ = z^{−ν} 𝐇_{ν+1}`, and the `𝐋_ν` forms
  (Gradshteyn–Ryzhik 8.553.2–8.553.3, p. 952; DLMF 11.7.1–11.7.4).
- `f_ν(z) = ∫₀^z t^ν 𝐇_ν(t) dt` along the segment `[0, z]` for `Re ν > −1`, and
  `f_{ν+1}(z) = (2ν + 1) f_ν(z) − z^{ν+1} 𝐇_ν(z) + z^{2ν+2}/(2^{ν+1} (ν + 1) √π Γ(ν + 3/2))`
  (DLMF 11.7.5–11.7.6). DLMF prints the last numerator as `(z²/2)^{ν+1}`; with principal powers
  that is `exp((ν + 1) log(z²/2))`, which differs from
  `z^{2ν+2}/2^{ν+1} = exp((ν + 1)(2 log z − log 2))` where `|ph z| > π/2`, and only the second is
  correct there.
- For `ν + ½ ∉ {0, −1, −2, …}` and every cylinder function `𝒞_ν = A J_ν + B Y_ν` with `A`, `B`
  independent of `ν`, the derivative of `√π 2^{ν−1} Γ(ν + ½) z (𝒞_ν 𝐇_{ν−1} − 𝒞_{ν−1} 𝐇_ν)` is
  `z^ν 𝒞_ν(z)` (`hasDerivAt_besselJ_struveH`; DLMF 10.22.2).
- For `ν + ½ ∉ {0, −1, −2, …}` and every modified cylinder function `𝒵_ν = A I_ν + B e^{νπi} K_ν`
  with `A`, `B` independent of `z` and of `ν` (DLMF §10.25(ii)), the derivative of
  `√π 2^{ν−1} Γ(ν + ½) z (𝒵_ν 𝐋_{ν−1} − 𝒵_{ν−1} 𝐋_ν)` is `z^ν 𝒵_ν(z)` (DLMF 10.43.2).

**Checks.**
- 10.22.2 at `ν = ½`, `𝒞 = J`: with 11.4.5–11.4.6 and `J_{1/2}(z) = (2/(πz))^{1/2} sin z`,
  `J_{−1/2}(z) = (2/(πz))^{1/2} cos z`, the bracket is `(2/π)^{1/2} (1 − cos z)`, whose derivative
  `(2/π)^{1/2} sin z` is `z^{1/2} J_{1/2}(z)`.

*Suggested names:* `hasDerivAt_besselJ_struveH` (10.22.2).

*Needs:* 1.3, 2.2; SpecialFunctionsBessel 1.4–1.5, 11.1, 11.4.

### 2.4 Elementary and Fresnel forms at half-odd orders

- Struve, on the slit plane: for `n ∈ ℕ`,
  `𝐊_{n+1/2}(z) = (2/(πz))^{1/2} ∑_{m=0}^{n} (2m)! 2^{−2m} (z/2)^{n−2m} / (m! (n − m)!)`,
  `𝐋_{n+1/2}` through `I_{−n−1/2}`, `𝐇_{−n−1/2} = (−1)ⁿ J_{n+1/2}`, `𝐋_{−n−1/2} = I_{n+1/2}`, and
  the elementary forms for `±½`, `±3/2`, for example `𝐇_{1/2}(z) = (2/(πz))^{1/2} (1 − cos z)`
  (`struveH_half`; Magnus–Oberhettinger–Soni, §3.10.3, p. 115; Gradshteyn–Ryzhik
  8.552.3–8.552.7, p. 952; Olver, Ch. 7, Ex. 15.3, p. 277; DLMF 11.4.1–11.4.12).
- Anger and Weber, on the slit plane: `𝐉_{−1/2} = 𝐄_{1/2}` and `𝐉_{1/2} = −𝐄_{−1/2}` for all `z`,
  and, with `w = (2z/π)^{1/2}` and the Fresnel integrals `C`, `S` of the supplier,

```text
𝐉_{−1/2}(z) = (πz/2)^{−1/2} ((C(w) + S(w)) cos z − (C(w) − S(w)) sin z)          (11.10.19)
𝐉_{1/2}(z)  = (πz/2)^{−1/2} ((C(w) + S(w)) sin z + (C(w) − S(w)) cos z)          (11.10.20)
```

  (`angerJ_neg_half`; Magnus–Oberhettinger–Soni, §3.10.4, p. 119; DLMF 11.10.19–11.10.21).

**Checks.**
- `𝐇_{−1/2}(1) = (2/π)^{1/2} sin 1 = 0.67139 67071 41…` (11.4.6).
- `𝐋_{1/2}(1) = (2/π)^{1/2} (cosh 1 − 1) = 0.43331 56537 90…` (11.4.7).
- 11.4.1 at `n = 0`: `𝐊_{1/2}(z) = (2/(πz))^{1/2}`, so `𝐇_{1/2} − Y_{1/2} = (2/(πz))^{1/2}` and,
  with `Y_{1/2} = −(2/(πz))^{1/2} cos z`, 11.4.5.
- At `z → 0+`, `C(√(2z/π)) ∼ √(2z/π)`, and 11.10.19 gives `𝐉_{−1/2}(0) = 2/π`, which is 11.10.25.

*Suggested names:* `struveH_half` (11.4.5), `angerJ_neg_half` (11.10.19).

*Needs:* 1.3, 2.1; SpecialFunctionsBessel 2.3, 3.1–3.2; SpecialFunctionsEiLiErfIncompleteGamma
Conventions, 11.4.

### 2.5 Neumann-type series in Bessel functions

- Struve, on the slit plane, as `HasSum` (DLMF 11.4.18–11.4.22):
  - for `ν ∉ {−1, −2, …}` and `ν + ½ ∉ {0, −1, −2, …}`, in `J_{2k+ν+1}`;
  - for every `ν`, in `(z/2)ᵏ J_{k+ν+1/2}`;
  - for `ν + ½ ∉ {0, −1, −2, …}`, in `(z/2)ᵏ J_{k+1/2}`;
  - `𝐇₀(z) = (4/π) ∑ J_{2k+1}(z)/(2k + 1) = 2 ∑ (−1)ᵏ J²_{k+1/2}(z/2)`;
  - the two expansions of `𝐇₁`:

```text
𝐇₁(z) = (2/π)(1 − J₀(z)) + (4/π) ∑ J_{2k+2}(z)/(4(k + 1)² − 1)
      = 4 ∑ J_{2k+1/2}(z/2) J_{2k+3/2}(z/2).
```

- Lommel, on the slit plane, as `HasSum`, for `μ ± ν ∉ {−1, −2, −3, …}`, the first also for
  `μ ∉ {−1, −2, …}` so that `Γ(k + μ + 1)` has no pole (DLMF 11.9.7–11.9.8):

```text
s_{μ,ν}(z) = 2^{μ+1} ∑ₖ (2k + μ + 1) Γ(k + μ + 1) / (k! (2k + μ − ν + 1)(2k + μ + ν + 1))
               · J_{2k+μ+1}(z)
```

  and the second in `(z/2)ᵏ J_{k+(μ+ν+1)/2}(z)`.
- Anger and Weber: the expansions in products of Bessel functions of argument `z/2` (DLMF
  11.10.30–11.10.31).

The first Struve expansion is the power series 11.2.1 with each power `(z/2)^{ν+2m+1}` expanded in
`J_{ν+2m+1+2j}` by DLMF 10.23.15 and the absolutely convergent double sum rearranged; the Lommel
expansions are the same computation on 11.9.3.

**Checks.**
- 11.4.21 at `z → 0`: both series are `O(z)`, and the first term `(4/π) J₁(z) ∼ 2z/π` matches
  `𝐇₀(z) ∼ 2z/π` (11.2.3).
- 11.9.7 at `μ = ν` with 2.1 is 11.4.18.

*Needs:* 1.2–1.3, 2.1; SpecialFunctionsBessel 2.1, 4.2, 4.4.

### 2.6 The relative bound and other sheets

- `𝐇_ν(x) ≥ 0` for real `ν ≥ ½` and `x > 0` (DLMF 11.4.13).
- With the corrected bound 11.4.15: for `z ≠ 0` and any `d > 0` with `d ≤ |ν + 3/2 + n|` for every
  `n ∈ ℕ`, `𝐇_ν(z) = 2 (z/2)^{ν+1} (√π Γ(ν + 3/2))⁻¹ (1 + ϑ)` with
  `|ϑ| < (2/3)(exp(|z|²/(4d)) − 1)` (`struveH_relative_bound`; DLMF 11.4.14–11.4.15). DLMF prints
  `(2/3) exp(¼|z|²/|ν₀ + 3/2| − 1)`, which fails at `ν = 1000`, `z = iy`, `y²/4 = |ν + 3/2|`,
  where `|ϑ| > 0.93`.
- `𝐇_ν(z e^{mπi}) = e^{(ν+1)mπi} 𝐇_ν(z)` and the same for `𝐋_ν`, for `m ∈ ℤ` and `z` with
  `z e^{mπi}` of principal phase `ph z + mπ`. The statement for all `m` is the evenness of the
  entire factor of 1.3 (Magnus–Oberhettinger–Soni, §3.10.3, p. 115; Gradshteyn–Ryzhik 8.553.1,
  p. 952; DLMF 11.4.16–11.4.17).

**Checks.**
- `𝐇_{1/2}(3) = 0.91670 76867 56… ≥ 0`.
- The bound at `ν = 0`, `z = 1`, `d = 3/2`: `|ϑ| < (2/3)(e^{1/6} − 1) = 0.12090 69419 1…`, and
  the actual `ϑ = 𝐇₀(1) π/2 − 1 = −0.10675 62590 2…`.

*Suggested names:* `struveH_relative_bound` (11.4.14–11.4.15).

*Needs:* 1.3.

### Examples

- `𝐇_{3/2}(z) = (z/(2π))^{1/2}(1 + 2/z²) − (2/(πz))^{1/2}(sin z + cos z/z)` (11.4.9) follows from
  11.4.5 and the Struve recurrence of 2.2 at `ν = ½`.
- 11.7.6 at `ν = 0`: `f₁(z) = f₀(z) − z 𝐇₀(z) + z²/π`. Both sides have derivative `z 𝐇₁(z)`, the
  right side by 11.4.32.
- 11.10.16 at `ν = ½`, where the coefficient `cos(πν)` of `𝐀_ν` vanishes:
  `𝐀_{−1/2} = −Y_{1/2} − 𝐄_{1/2}`; at `z = 1` both sides are `0.33159 13253 78…`.

### Dependencies

Layer 1; SpecialFunctionsBessel 1.1–1.2, 1.4–1.5, 2.1, 2.3, 3.1–3.2, 4.2, 4.4, 5.1, 11.1, 11.4;
SpecialFunctionsEiLiErfIncompleteGamma Conventions, 11.4; Tau Ceti
`Complex.hasSum_regularizedHGFun`.

## Layer 3: Poisson, Laplace and Barnes integrals

### 3.1 Poisson's integrals

- For `Re ν > −½` on the slit plane,

```text
𝐇_ν(z) = 2(z/2)^ν/(√π Γ(ν + ½)) ∫₀¹ (1 − t²)^{ν−1/2} sin(zt) dt
       = 2(z/2)^ν/(√π Γ(ν + ½)) ∫₀^{π/2} sin(z cos θ) (sin θ)^{2ν} dθ,
```

  and the same with `sinh` for `𝐋_ν` (`struveH_eq_integral`; Olver, Ch. 7 §15.2, p. 276;
  Magnus–Oberhettinger–Soni, §3.10.3, p. 113; Gradshteyn–Ryzhik 8.551.1–8.551.2, p. 951;
  Duverney, Ex. 7.13, (7.59), p. 220; DLMF 11.5.1, 11.5.6).
- For `Re ν > −½`, `z` in the slit plane:
  `𝐌_ν(z) = −2(z/2)^ν/(√π Γ(ν + ½)) ∫₀¹ e^{−zt} (1 − t²)^{ν−1/2} dt`, and
  `𝐌₀(z) = −(2/π) ∫₀^{π/2} e^{−z cos θ} dθ` for all `z` (DLMF 11.5.4–11.5.5).

The route is term-by-term integration with the Beta integral, as in Olver §15.2, for the
integrals of `𝐇_ν` and `𝐋_ν`, and the substitution into the first at `iz`, collapsed onto
`[0, 1]`, for `𝐌_ν`.

**Checks.**
- At `ν = ½`: `𝐇_{1/2}(z) = (2z/π)^{1/2} ∫₀¹ sin(zt) dt = (2/(πz))^{1/2}(1 − cos z)` (11.4.5).

*Suggested names:* `struveH_eq_integral` (11.5.1).

*Needs:* 1.3, 2.4; Mathlib `Complex.betaIntegral`.

### 3.2 Variation of parameters: the Hankel representation of `S_{μ,ν}`

- **The Hankel representation** (auxiliary): for `Re(μ ± ν) > −1`, `Re μ < ½` and `x > 0`,
  `S_{μ,ν}(x) = (π/2)(J_ν(x) ∫_x^∞ t^μ Y_ν(t) dt − Y_ν(x) ∫_x^∞ t^μ J_ν(t) dt)`, with improper
  integrals, and its continuation to `|ph z| < π`, where it is `O(|z|^{Re μ−1})` on every closed
  subsector.

For `Re(μ ± ν) > −1`, variation of parameters from `0` with the Wronskian 10.5.2 gives
`s_{μ,ν}(x) = (π/2)(Y_ν(x) ∫₀^x t^μ J_ν dt − J_ν(x) ∫₀^x t^μ Y_ν dt)` (Gradshteyn–Ryzhik 8.571,
p. 955; Dingle, Ch. XVIII §1, (4), p. 371), since both sides solve the Lommel equation and are
`o(|x^{±ν}|)` at `0`. For `Re μ < ½` the Mellin transforms 10.22.43–10.22.44 (SpecialFunctionsBessel
11.2) split `∫₀^x = ∫₀^∞ − ∫_x^∞`, and the constants `∫₀^∞` give the bracket of 11.9.5. Writing
`J_ν`, `Y_ν` through `H⁽¹⁾_ν`, `H⁽²⁾_ν` and moving each path `∫_x^∞` to the ray from `x` on which
its Hankel function decays continues the representation to the slit plane with the stated bound
(SpecialFunctionsBessel 6.1).

**Checks.**
- At `μ = 0.2`, `ν = 0.3`, `x = 2` both sides are `0.53377 77881 822…`.

*Needs:* 1.2; SpecialFunctionsBessel 1.1–1.2, 1.4, 6.1, 11.2.

### 3.3 Laplace integrals

- For `Re z > 0`: `𝐊_ν(z) = 2(z/2)^ν/(√π Γ(ν + ½)) ∫₀^∞ e^{−zt} (1 + t²)^{ν−1/2} dt` for every
  `ν`, the integral absolutely convergent, and `𝐊₀(z) = (2/π) ∫₀^∞ e^{−z sinh t} dt`
  (`struveK_eq_integral`; Olver, Ch. 7 §15.2, (15.06), p. 276; Magnus–Oberhettinger–Soni,
  §3.10.3, p. 113; DLMF 11.5.2–11.5.3).
- For `Re ν < ½`, `x > 0`, as an improper integral:
  `I_{−ν}(x) − 𝐋_ν(x) = 2(x/2)^ν/(√π Γ(ν + ½)) ∫₀^∞ sin(xt) (1 + t²)^{ν−1/2} dt` (DLMF 11.5.7).
- `𝐀_ν(z) = π⁻¹ ∫₀^∞ e^{−νt − z sinh t} dt` for `Re z > 0`, and for `Re z = 0` with `Re ν > 0`,
  absolutely convergent; equivalently, for `Re z > 0`,
  `𝐉_ν = J_ν + π⁻¹ sin(νπ) ∫₀^∞ e^{−νt − z sinh t} dt` and
  `𝐄_ν = −Y_ν − π⁻¹ ∫₀^∞ (e^{νt} + e^{−νt} cos νπ) e^{−z sinh t} dt`
  (`angerWeberA_eq_integral`; Magnus–Oberhettinger–Soni, §3.10.4, p. 117; Dingle, Ch. XVIII,
  Ex. 6, p. 378; Olver, Ch. 3, Exs. 7.2 and 13.3, pp. 84, 103; DLMF 11.10.4, 11.10.15–11.10.16).
- **The Laplace representation** (auxiliary): for all `μ`, `ν` and `Re z > 0`,
  `S_{μ,ν}(z) = z^μ ∫₀^∞ e^{−zt} F(½(1 − μ + ν), ½(1 − μ − ν); ½; −t²) dt`, absolutely convergent,
  with the Gauss function `F` of SpecialFunctionsHypergeometric (`lommelCapitalS_eq_laplace`;
  Magnus–Oberhettinger–Soni, §3.10.1, p. 109). At `μ = ν` it is the integral of `𝐊_ν` above,
  since `F(½, ½ − ν; ½; −t²) = (1 + t²)^{ν−1/2}`.
- For every `ν` and `Re z > 0`: `S_{0,ν}(z) = ∫₀^∞ e^{−z sinh t} cosh(νt) dt`,
  `ν S_{0,ν}(z) = z ∫₀^∞ e^{−z sinh t} sinh(νt) cosh t dt` and
  `S_{1,ν}(z) = z ∫₀^∞ e^{−z sinh t} cosh(νt) cosh t dt`; hence `S_{0,ν} = (π/2)(𝐀_ν + 𝐀_{−ν})` on
  the slit plane (Magnus–Oberhettinger–Soni, §3.10.1, p. 111).

The routes: for `𝐊_ν`, Schläfli's integral of `Y_ν` (SpecialFunctionsBessel 5.1) and the rotation
of the path for `Re ν > −½` (Olver §15.2), then analytic continuation in `ν`, since for fixed `z`
with `Re z > 0` both sides are entire in `ν` (1.3, SpecialFunctionsBessel 1.2); for `𝐀_ν`,
Schläfli's integral of `J_ν` subtracted from the definition of `𝐉_ν`; for `S_{0,ν}` and `S_{1,ν}`,
the Laplace representation at `μ = 0, 1` after `t = sinh u`, with
`F(½(1 + ν), ½(1 − ν); ½; −sinh² u) = cosh(νu)/cosh u` and `F(ν/2, −ν/2; ½; −sinh² u) = cosh(νu)`,
and for `ν S_{0,ν}` an integration by parts.

For the Laplace representation, the right side `R` solves the Lommel equation, by differentiation
under the integral sign and integration by parts with the hypergeometric equation of the integrand
in `t`. The integrand is holomorphic for `|ph t| < π/2` and `O(|t|^K)` there (15.8.2,
SpecialFunctionsHypergeometric 5.1), so `R` continues to `|ph z| ≤ π − δ` with `R = O(|z|^{Re μ−1})`
(AsymptoticExpansions 4.3). On the parameter region of the Hankel representation (3.2),
`R − S_{μ,ν}` solves Bessel's equation and is `O(|z|^K)` on both rays `ph z = ±π/2`; a nonzero
combination of `H⁽¹⁾_ν` and `H⁽²⁾_ν` grows exponentially on one of them (SpecialFunctionsBessel
6.1), so `R = S_{μ,ν}` there. Both sides are entire in `μ` and in `ν` (1.2;
SpecialFunctionsHypergeometric 1.4 and dominated convergence for `R`), so `R = S_{μ,ν}` for all
parameters.

**Checks.**
- The integral of `𝐊_ν` at `ν = −1`, `z = 1`, outside `Re ν > −½`: both sides are
  `−0.34305 03851 34…`.
- `(2/π) ∫₀^∞ e^{−sinh t} dt = 0.48039 96628 32… = 𝐊₀(1)`, and
  `𝐀₀(1) = π⁻¹ ∫₀^∞ e^{−sinh t} dt = 0.24019 98314 16… = ½𝐊₀(1)`, by 11.10.16 and 11.10.26 at
  `ν = 0`.
- `S_{0,0.4}(1.3) = ∫₀^∞ e^{−1.3 sinh t} cosh(0.4t) dt = 0.64312 85316 93…`, which is also
  `(π/2)(𝐀_{0.4}(1.3) + 𝐀_{−0.4}(1.3))`; with `cosh(νt)` replaced by `e^{−νt}` the integral is
  `π𝐀_{0.4}(1.3)`, not `S_{0,0.4}(1.3)`.
- At `μ = 0.3 + 0.1i`, `ν = 0.2`, `z = 1.5 + 0.5i` both sides of the Laplace representation are
  `0.65107 57495 976… − 0.08109 50059 749… i`.

*Suggested names:* `struveK_eq_integral` (11.5.2), `angerWeberA_eq_integral` (11.10.4),
`lommelCapitalS_eq_laplace` (the Laplace representation).

*Needs:* 1.2–1.5, 2.1, 3.2; SpecialFunctionsBessel 1.2, 5.1, 6.1; SpecialFunctionsHypergeometric
1.2–1.4, 3.1, 5.1; AsymptoticExpansions 4.3.

### 3.4 Barnes contour integrals for `𝐇_ν` and `𝐋_ν`

- For `x > 0`, `Re ν > −1`, and `c ∈ (−1, 0)` with `Re ν + 2c > −1`,
  `∫_{c−i∞}^{c+i∞} π csc(πs) (Γ(3/2 + s) Γ(3/2 + ν + s))⁻¹ (x²/4)^s ds = −2πi (x/2)^{−ν−1} 𝐇_ν(x)`,
  absolutely convergent along the line `Re s = c`, which separates the poles `0, 1, 2, …` from
  `−1, −2, …`. The condition `Re ν + 2c > −1` is the absolute convergence of the integrand,
  `O(|Im s|^{−2−Re ν−2c})`, and for `Re ν > −1` some `c` satisfies it (`struveH_mellinBarnes`;
  DLMF 11.5.8).
- For `z ≠ 0`, `c ∈ (−1, 0)` and `h > 0`, the loop integral over the path from `R + ih` to
  `c + ih` to `c − ih` to `R − ih` of `π csc(πs) (Γ(3/2 + s) Γ(3/2 + ν + s))⁻¹ (−z²/4)^s` tends
  to `2πi (z/2)^{−ν−1} 𝐋_ν(z)` as `R → ∞`, with `(−z²/4)^s` principal (Dingle, Ch. XVIII §2,
  (8), p. 372; DLMF 11.5.9).

The first is the line shift of AsymptoticExpansions 8.2 applied to the rectangles with right sides
at `Re s = N + ½`: the residues at `s = 0, …, N` are the partial sums of 11.2.1, and the integrals
over the right sides tend to `0`. The loop form is the same with the rectangles truncated at
`Im s = ±h`. AsymptoticExpansions 8.2 assumes the integrability on both lines and the vanishing of
the horizontal edges, and 8.6 bounds `Γ` from above on one fixed strip; the reciprocal factors
need the following bounds, which this roadmap owns:
- **the right lines** (auxiliary): for `x > 0` and `N` large, on `s = N + ½ + iy`,

```text
|π csc(πs) (Γ(3/2 + s) Γ(3/2 + ν + s))⁻¹ (x²/4)^s|
    ≤ C (1 + |y|)^{−2} (x/2)^{2N+1}/(Γ(N + 2) Γ(N + 2 + Re ν))
```

  with `C` independent of `N` and `y`, so the integral over the line tends to `0`. Proof:
  `|sin(πs)| = cosh(πy)`; and `|Γ(σ + 1 + it)|/Γ(σ + 1) ≥ |Γ(σ + it)|/Γ(σ)` for `σ > 0` by
  `Γ(σ + 1 + it) = (σ + it) Γ(σ + it)`, so with `m` steps from `σ₀ ∈ [2, 3)`,
  `|Γ(σ₀ + m + it)|⁻¹ ≤ Γ(σ₀)/(Γ(σ₀ + m) |Γ(σ₀ + it)|)`, and ZerosOfLFunctions 1.3 bounds
  `|Γ(σ₀ + it)|⁻¹` by `C (1 + |t|)^{1/2−σ₀} e^{π|t|/2}` uniformly for `σ₀ ∈ [2, 3]`;
- **the strips** (auxiliary): for fixed `N`, the integrand is `O((1 + |y|)^{−2−Re ν−2 Re s})`
  uniformly for `c ≤ Re s ≤ N + ½`, from the same lower bound for `|Γ|` on the strip, which gives
  the integrability on both lines and the vanishing of the horizontal edges as `|Im s| → ∞`.

**Checks.**
- The residue of `π csc(πs)` at `s = k` is `(−1)ᵏ`. The poles `0, 1, 2, …` lie to the right of
  the line, which is clockwise around them, so the line integral is `−2πi` times
  `∑ (−1)ᵏ (x²/4)ᵏ/(Γ(3/2 + k) Γ(3/2 + ν + k)) = (x/2)^{−ν−1} 𝐇_ν(x)`. The loop is
  counterclockwise, and `(−1)ᵏ (−z²/4)ᵏ = (z²/4)ᵏ` gives 11.2.2.

*Suggested names:* `struveH_mellinBarnes` (11.5.8).

*Needs:* 1.3; AsymptoticExpansions 8.2, 8.6; ZerosOfLFunctions 1.3.

### Examples

- 11.5.4 at `ν = ½`: `𝐌_{1/2}(z) = −(2z/π)^{1/2} ∫₀¹ e^{−zt} dt`, and with 11.4.7 and
  `I_{1/2}(z) = (2/(πz))^{1/2} sinh z` both sides are `−(2/(πz))^{1/2}(1 − e^{−z})`; at `z = 1`,
  `−0.50435 92344 55…`.
- For `Re ν > 0`, `𝐀_ν(z) → 1/(πν)` as `z → 0` in `Re z > 0`: 11.10.4 at `z = 0` is
  `π⁻¹ ∫₀^∞ e^{−νt} dt = 1/(πν)`, and dominated convergence gives the limit. For `ν ∉ ℤ` this
  agrees with `(𝐉_ν(0) − J_ν(0))/sin νπ` by 11.10.25 and `J_ν(0) = 0`.

### Dependencies

Layers 1–2; SpecialFunctionsBessel 1.1–1.2, 1.4, 5.1, 6.1, 11.2; SpecialFunctionsHypergeometric
1.2–1.4, 3.1, 5.1; AsymptoticExpansions 4.3, 8.2, 8.6; ZerosOfLFunctions 1.3.

## Layer 4: large argument

### 4.1 Lommel's function `S_{μ,ν}`

For fixed `μ`, `ν` and `δ > 0`, as `z → ∞` in `|ph z| ≤ π − δ`,
`S_{μ,ν}(z) ∼ z^{μ−1} ∑ₖ (−1)ᵏ a_k(−μ, ν) z^{−2k}`; and if `μ + ν` or `μ − ν` is an odd positive
integer `2n + 1`, the sum terminates at `k = n` and equals `S_{μ,ν}(z)` exactly
(`isBigO_lommelCapitalS_sub_sum`; Magnus–Oberhettinger–Soni, §3.10.1, p. 109;
Gradshteyn–Ryzhik 8.576, p. 956; DLMF 11.9.9).

Watson's lemma with the rotation of the path (AsymptoticExpansions 4.2–4.3) applied to the
Laplace representation of 3.3, with `F(a, b; ½; −t²) = ∑ₖ (a)ₖ (b)ₖ (−t²)ᵏ/((½)ₖ k!)` and
`(2k)!/((½)ₖ k!) = 4ᵏ`, gives the expansion, since `4ᵏ (a)ₖ (b)ₖ = a_k(−μ, ν)` for
`a = ½(1 − μ + ν)`, `b = ½(1 − μ − ν)` (11.9.4). If `μ − ν = 2n + 1` then `a = −n`, the integrand
is a polynomial in `t` and the sum is exact; likewise with `b = −n` if `μ + ν = 2n + 1`.

**Checks.**
- `S_{2,1}(z) = z`: `μ − ν = 1` gives the single term `z^{μ−1}`; numerically `S_{2,1}(2) = 2`.
- At `μ = ν`, the expansion with 2.1 is 11.6.1 (4.2) multiplied by `2^{ν−1} √π Γ(ν + ½)`.

*Suggested names:* `isBigO_lommelCapitalS_sub_sum` (11.9.9).

*Needs:* 1.2, 3.3; AsymptoticExpansions 4.2–4.3.

### 4.2 The Struve functions `𝐊_ν` and `𝐌_ν`

- For every `ν` and `δ > 0`, as `z → ∞` in `|ph z| ≤ π − δ`,
  `𝐊_ν(z) ∼ π⁻¹ ∑ₖ Γ(k + ½) (z/2)^{ν−2k−1} / Γ(ν + ½ − k)` (with `(Γ(ν + ½ − k))⁻¹`), the
  remainder after `m` terms `O(z^{ν−2m−1})`; and if `ν` is real, `z > 0` and `m + ½ − ν ≥ 0`, the
  remainder has the sign of the first neglected term and is smaller in absolute value
  (`isBigO_struveK_sub_sum`; Olver, Ch. 7 §15.1, (15.03), p. 275, and Ex. 15.5, p. 277;
  Magnus–Oberhettinger–Soni, §3.10.3, p. 115; Gradshteyn–Ryzhik 8.554, p. 952; DLMF 11.6.1).
- `𝐌_ν(z) ∼ π⁻¹ ∑ₖ (−1)^{k+1} Γ(k + ½) (z/2)^{ν−2k−1} / Γ(ν + ½ − k)` as `z → ∞` in
  `|ph z| ≤ π/2 − δ` (Magnus–Oberhettinger–Soni, §3.10.3, p. 115; DLMF 11.6.2).

The first is Watson's lemma in a sector (AsymptoticExpansions 4.2) applied to the Laplace integral
of 3.3, with the rotation of the path (AsymptoticExpansions 4.3) for `|ph z| ≥ π/2`; Olver obtains
the same series as the formal solution of Struve's equation at the irregular singularity. The
second is first proved for `Re ν > −½` from the interval form of 3.1: split
`∫₀¹ e^{−zt} (1 − t²)^{ν−1/2} dt` at `t = ½`; the piece over `[½, 1]` is `O(e^{−|z| sin(δ)/2})` in
`|ph z| ≤ π/2 − δ`, and Watson's lemma (AsymptoticExpansions 4.2) at `t = 0`, with
`(1 − t²)^{ν−1/2} = ∑ₖ (−1)ᵏ C(ν − ½, k) t^{2k}`, gives the series, since
`(2k)!/k! = 4ᵏ Γ(k + ½)/√π`. It extends to all `ν` by the recurrence
`𝐌_{ν−1} = 𝐌_{ν+1} + (2ν/z) 𝐌_ν + (z/2)^ν/(√π Γ(ν + 3/2))` of 2.2, which the formal series
satisfy; each step lowers `Re ν` by `1`.

**Checks.**
- `𝐊₀(10) = 0.06307 25164 03…`. The terms are `(2/(πz))(1 − z⁻² + 9z⁻⁴ − …)`; two terms give
  `0.06302 53574 4…` and three give `0.06308 26532 4…`, which bracket it, as the sign statement
  predicts.

*Suggested names:* `isBigO_struveK_sub_sum` (11.6.1).

*Needs:* 1.3, 2.2, 3.1, 3.3; SpecialFunctionsBessel 1.4–1.5, 6.1–6.2; AsymptoticExpansions 4.2–4.3,
5.2, 5.4.

### 4.3 The Anger–Weber functions

With `F_k(ν) = (−4)ᵏ (½ − ν/2)ₖ (½ + ν/2)ₖ` and `G_k(ν) = (−4)ᵏ (1 − ν/2)ₖ (1 + ν/2)ₖ` (11.11.1),
for every `ν`, as `z → ∞` in `|ph z| ≤ π − δ`,
`𝐀_ν(z) ∼ π⁻¹ ∑ₖ (F_k(ν) z^{−2k−1} − ν G_k(ν) z^{−2k−2})`, and the corresponding expansions of
`𝐉_ν − J_ν` and `𝐄_ν + Y_ν`, which follow by 11.10.15–11.10.16 (Gradshteyn–Ryzhik 8.583, p. 958;
Magnus–Oberhettinger–Soni, §3.10.4, pp. 118–119; Dingle, Ch. XVIII, Ex. 7, p. 378; Olver, Ch. 3,
Exs. 7.2 and 13.2, pp. 84, 103, for the leading terms; DLMF 11.11.1–11.11.4). The expansion of
`𝐀_ν` is Watson's lemma (AsymptoticExpansions 4.2) for the Laplace integral of 3.3, with the
rotation of the path (AsymptoticExpansions 4.3).

**Checks.**
- `F₀ = G₀ = 1`, so `𝐀_ν(z) ∼ 1/(πz)`; at `ν = 0`, `𝐀₀ = ½𝐊₀ ∼ 1/(πz)` by 4.2.

*Needs:* 1.5, 2.1, 3.3; AsymptoticExpansions 4.2–4.3; SpecialFunctionsBessel 6.1–6.2.

### 4.4 The integrated Struve functions

As `z → ∞` in `|ph z| ≤ π − δ`, `∫₀^z 𝐊₀(t) dt − (2/π)(ln(2z) + γ)` has the expansion
`(2/π) ∑_{k≥1} (−1)^{k+1} (2k)! (2k − 1)! / ((k!)² (2z)^{2k})`, with the integral along the
segment `[0, z]`; and, as `z → ∞` in `|ph z| ≤ π/2 − δ`,
`∫₀^z 𝐌₀(t) dt + (2/π)(ln(2z) + γ) ∼ (2/π) ∑_{k≥1} (2k)! (2k − 1)! / ((k!)² (2z)^{2k})` (DLMF
11.6.3–11.6.4).

The first splits `∫₀^z = ∫₀^∞ − ∫_z^∞`, applies 4.2 with the first term extracted
(AsymptoticExpansions 1.5), and evaluates the constant by a limit; the second follows by `z ↦ iz`.

**Checks.**
- At `z = 8`, `∫₀^8 𝐌₀ + (2/π)(ln 16 + γ) = 0.00545 68877 4…`, against the first term
  `(2/π) · 2/256 = 0.00497 35919 7…`; the second term is positive.

*Needs:* 4.2; AsymptoticExpansions 1.5.

### Examples

- 11.6.1 at `ν = ½`: the series terminates after the term `k = 0`, since `(Γ(1 − k))⁻¹ = 0` for
  `k ≥ 1`, and `𝐊_{1/2}(z) = (2/(πz))^{1/2}` exactly (11.4.1).
- 11.6.2 at `ν = ½`: `𝐌_{1/2}(z) = −(2/(πz))^{1/2}(1 − e^{−z})`, whose expansion in the sector is
  the single term `−(2/(πz))^{1/2}`.
- `S_{1,0} = 1` (Layer 1) is the terminating sum of 11.9.9 at `μ + ν = 1`.

### Dependencies

Layers 1–3; SpecialFunctionsBessel 1.4–1.5, 6.1–6.2; AsymptoticExpansions 1.5, 4.2–4.3, 5.2, 5.4.

## Layer 5: integrals over the half-line

### 5.1 Mellin-type integrals of the Struve functions

- For `−3/2 < Re ν < ½` on the slit plane:
  `∫₀^{π/2} 𝐇_ν(z sin θ) (sin θ)^{ν+1} (cos θ)^{−2ν} dθ` equals
  `2^{−ν} π^{−1/2} Γ(½ − ν) z^{ν−1} (1 − cos z)` (DLMF 11.7.7).
- As improper integrals: `∫₀^∞ 𝐇₀(t) t⁻¹ dt = π/2`, `∫₀^∞ 𝐇₁(t) t⁻² dt = π/4`;
  `∫₀^∞ 𝐇_ν(t) dt = −cot(πν/2)` for `−2 < Re ν < 0`;
  `∫₀^∞ t^{−ν−1} 𝐇_ν(t) dt = π/(2^{ν+1} Γ(ν + 1))` for `Re ν > −3/2`; and the general Mellin
  transform for `|Re μ| < 1`, `Re ν > Re μ − 3/2`, with its value at `μ = 0` given by the previous
  one (Gradshteyn–Ryzhik 6.811.1 and 6.813.1–6.813.2, pp. 760–761; Magnus–Oberhettinger–Soni,
  §3.10.3, p. 116; DLMF 11.7.8–11.7.11).
- With the corrected hypotheses: for `Re(μ + ν) > 0`, `Re μ > −3/2` and `Re ν > −3/2`,

```text
∫₀^∞ t^{−μ−ν} 𝐇_μ(t) 𝐇_ν(t) dt = √π Γ(μ + ν) / (2^{μ+ν} Γ(μ + ν + ½) Γ(μ + ½) Γ(ν + ½)).
```

  (`integral_struveH_mul_struveH`; Gradshteyn–Ryzhik 6.813.3, p. 761;
  Magnus–Oberhettinger–Soni, §3.10.3, p. 116; DLMF 11.7.12). DLMF and Gradshteyn–Ryzhik print only
  `Re(μ + ν) > 0`; at `μ = 3`, `ν = −2` the integral diverges.

**Checks.**
- 11.7.10 at `ν = 0` is 11.7.8's first integral.
- 11.7.9 at `ν = −1`: `∫₀^∞ 𝐇₋₁(t) dt = −cot(−π/2) = 0`, where `𝐇₋₁ = 2/π − 𝐇₁` by 2.2.

*Suggested names:* `integral_struveH_mul_struveH` (11.7.12).

*Needs:* Layers 1–4; Mathlib `Complex.betaIntegral`.

### 5.2 Exponential-kernel transforms of `𝐇₀`, `𝐇₁`, `𝐋₀`, `𝐋₁`

The Laplace transforms of `𝐇₀`, `𝐇₁` for `Re a > 0` and of `𝐋₀`, `𝐋₁` for `Re a > 1`, with
principal square roots and logarithms, for example
`∫₀^∞ e^{−at} 𝐇₀(t) dt = (2/(π(1 + a²)^{1/2})) ln((1 + (1 + a²)^{1/2})/a)` and
`∫₀^∞ e^{−at} 𝐋₀(t) dt = (2/(π(a² − 1)^{1/2})) arcsin(1/a)` (Gradshteyn–Ryzhik
6.821.3–6.821.4, p. 762; DLMF 11.7.13–11.7.16).

**Checks.**
- 11.7.13 as `a → +∞` is `∼ 2/(πa²)`, the Laplace transform of the first term `2t/π` of 11.2.3,
  since `ln((1 + (1 + a²)^{1/2})/a) ∼ 1/a`.

*Needs:* Layers 1, 4.

### Examples

- 11.7.12 at `μ = ν = ½`: the right side is `√π Γ(1)/(2 Γ(3/2) Γ(1)²) = 1`, and with
  `𝐇_{1/2}(t) = (2/(πt))^{1/2}(1 − cos t)` the left side is
  `(2/π) ∫₀^∞ (1 − cos t)² t⁻² dt = (2/π)(π/2) = 1`.

### Dependencies

Layers 1–4; Mathlib.

## Layer 6: large order

### 6.1 Growth in the order at fixed argument

- For `z` in the slit plane and `δ > 0`, as `ν → ∞` in `|ph ν| ≤ π − δ`,
  `𝐇_ν(z) ∼ 𝐋_ν(z) ∼ (z/(πν√2)) exp(ν(1 + ln z − ln 2 − ln ν))`, which is DLMF's
  `(z/(πν√2)) (ez/(2ν))^ν` with the power written through principal logarithms (DLMF 11.6.5).
- For fixed `z` and `ε > 0`, as `ν → ∞` in `|ph ν| ≤ π` with `‖ν − n‖ ≥ ε` for all `n ∈ ℤ`,
  `𝐉_ν(z) = (sin(πν)/(πν))(1 − νz/(ν² − 1) + O(ν⁻²))` (DLMF 11.11.5).
- With the corrected error term: on the same filter,
  `𝐄_ν(z) = (2/(πν))(sin²(πν/2) + (νz/(ν² − 1)) cos²(πν/2) + O(e^{π|Im ν|} ν^{−2}))`
  (`isBigO_weberE_large_order`; DLMF 11.11.6). DLMF prints `O(ν^{−2})` in the bracket, which fails
  for complex `ν`: at `z = 1`, `ν = ½ + 10i`, the error times `|ν|²` is about `1.05 × 10¹³`.
- `𝐄_{2n}(z) ∼ 2z/((4n² − 1)π)` and `𝐄_{2n+1}(z) ∼ 2/((2n + 1)π)` as `n → ±∞` (DLMF 11.11.7).

The first is complex Stirling applied to the first term of 11.2.1–11.2.2, the rest of the series
being `O(1/ν)` times it; the Anger–Weber statements follow from the series of 2.1 (DLMF's
Sources), and 11.11.7 from 11.10.22–11.10.23 and 11.6.5.

**Checks.**
- The leading term of 11.2.1 is `(z/2)^{ν+1}/(Γ(3/2) Γ(ν + 3/2))`, and
  `Γ(ν + 3/2) ∼ (2π)^{1/2} ν^{ν+1} e^{−ν}` turns it into 11.6.5.
- 11.11.5 at `z = 0` is exact: `𝐉_ν(0) = sin(πν)/(πν)` (11.10.25).

*Suggested names:* `isBigO_weberE_large_order` (11.11.6).

*Needs:* 1.3, 2.1; ZerosOfLFunctions 1.2.

### 6.2 The Struve functions at argument proportional to the order

- For fixed `λ > 1` (`𝐊_ν`) and `λ > 0` (`𝐌_ν`), as `ν → ∞` in `|ph ν| ≤ π/2 − δ`,
  `𝐊_ν(λν) ∼ (λν/2)^{ν−1} (√π Γ(ν + ½))⁻¹ ∑ₖ k! c_k(λ) ν^{−k}` and
  `𝐌_ν(λν) ∼ −(λν/2)^{ν−1} (√π Γ(ν + ½))⁻¹ ∑ₖ k! c_k(iλ) ν^{−k}`, with `c_k` of
  [Conventions](#conventions); and the values `c₀, …, c₄`, for example `c₂(λ) = 6λ⁻⁴ − ½λ⁻²`
  (`isBigO_struveK_scaled`; DLMF 11.6.6–11.6.8).
- **Debye's leading term in a complex sector** (auxiliary): for fixed `λ > 0`, as `ν → ∞` in
  `|ph ν| ≤ π/2 − δ`, `I_ν(λν) ∼ e^{νη}/((2πν)^{1/2} (1 + λ²)^{1/4})` with
  `η = (1 + λ²)^{1/2} + ln(λ/(1 + (1 + λ²)^{1/2}))`. This is the first term of 10.41.3 for complex
  `ν` and real `λ`, which SpecialFunctionsBessel 9.1 states for real `ν`.
- For fixed `λ > 0`, `𝐋_ν(λν) ∼ I_ν(λν)` as `ν → ∞` in `|ph ν| ≤ π/2 − δ`
  (`struveL_isEquivalent_besselI`; DLMF 11.6.9).

The coefficients `c_k` are the Watson's-lemma coefficients of the Laplace integral of `𝐊_ν` (3.3)
at `z = λν` after the substitution `u = λt − ln(1 + t²)`, which is increasing for `λ > 1`, by
Lagrange–Bürmann. The expansion of `𝐌_ν` is the same method applied to the Poisson integral of
3.1 (DLMF's Sources). For `Re ν > −½`, 10.32.2 and 11.5.4 write `I_ν(λν)` and `𝐌_ν(λν)` as
`(λν/2)^ν (√π Γ(ν + ½))⁻¹` times integrals of `e^{ν(ln(1 − t²) − λt)} (1 − t²)^{−1/2}` over
`(−1, 1)` and `(0, 1)`. The phase has its maximum at a point `t₀ ∈ (−1, 0)` with a value `> 0`,
its value at `0`. Laplace's method on a contour with `p = λt − ln(1 − t²)` (AsymptoticExpansions
5.5) gives Debye's leading term, and the integral over `(0, 1)` is exponentially smaller, which
gives 11.6.9 as `𝐋_ν = I_ν + 𝐌_ν`.

**Checks.**
- `c₀ = 1` and `c₁(λ) = 2λ⁻²` from the definition: `t/(λt − ln(1 + t²)) = λ⁻¹(1 + t/λ + O(t²))`.
- Debye's leading term at real `ν` agrees with SpecialFunctionsBessel 9.1.

*Suggested names:* `isBigO_struveK_scaled` (11.6.6), `struveL_isEquivalent_besselI` (11.6.9).

*Needs:* 1.3, 3.1, 3.3, 4.2; SpecialFunctionsBessel 5.1, 9.1; AsymptoticExpansions 4.2, 5.4–5.5;
ZerosOfLFunctions 1.2; Mathlib `PowerSeries`.

### 6.3 The Anger–Weber function at argument proportional to the order

With `a_k(λ)` of [Conventions](#conventions) and, for `0 < λ < 1`,
`μ(λ) = (1 − λ²)^{1/2} − ln((1 + (1 − λ²)^{1/2})/λ)` (11.11.12):
- corrected: for fixed `λ > 0`, `𝐀_ν(λν) ∼ π⁻¹ ∑ₖ (2k)! a_k(λ) ν^{−2k−1}` as `ν → ∞` in
  `|ph ν| ≤ π − θ(λ) − δ`, where `θ(λ) = arctan(−μ(λ)/π)` for `0 < λ < 1` and `θ(λ) = 0` for
  `λ ≥ 1`; and the values `a₀, …, a₃`, for example `a₁(λ) = −λ/(2(1 + λ)⁴)`
  (`isBigO_angerWeberA_scaled`; Olver, Ch. 3, Ex. 7.2, p. 84, for the leading term at real `ν`;
  DLMF 11.11.8–11.11.9);
- for fixed `λ > 1`, `𝐀_{−ν}(λν) ∼ −π⁻¹ ∑ₖ (2k)! a_k(−λ) ν^{−2k−1}` in `|ph ν| ≤ π − δ` (Dingle,
  Ch. VIII, Ex. 11, p. 202, and Ch. XIX §3, (22), p. 387, at real `ν`; DLMF 11.11.10);
- for fixed `0 < λ < 1`, as `ν → ∞` in `|ph ν| ≤ π/2 − δ`,
  `𝐀_{−ν}(λν) ∼ (2/(πν))^{1/2} e^{−νμ(λ)} ∑ₖ (½)ₖ b_k(λ) ν^{−k}`, where
  `b_k(λ) = √2 β_{2k}` and `β_{2k}` are the coefficients of AsymptoticExpansions 5.1 (with
  `μ = 2`, `λ = 1`) for the phase `p(t) = λ sinh t − t` at its minimum
  `t₀ = arccosh(1/λ)` and `q = 1`; and the values `b₀ = (1 − λ²)^{−1/4}`, `b₁`, `b₂` (DLMF
  11.11.11–11.11.13);
- for `0 < λ < 1` and every `k`,
  `(½)ₖ b_k(λ) = (−1)ᵏ (1 − λ²)^{−1/4} U_k((1 − λ²)^{−1/2})`, with `U_k` SpecialFunctionsBessel's
  `Real.debyeU k` (cast to `ℂ` where the statement is complex) (DLMF 11.11.13_5). Route: the
  substitution `t = u + iπ/2` turns the phase `λ sinh t − t` into `iλ cosh u − u − iπ/2`, the phase
  of the integral `½ ∫_ℝ e^{−ν(z cosh u − u)} du = K_ν(νz)` at `z = iλ`. For `z > 0`, Laplace's
  method (AsymptoticExpansions 5.4) on that integral and the uniqueness of asymptotic expansions
  against 10.41.4 (SpecialFunctionsBessel 9.1) identify its saddle coefficients with
  `(−1)ᵏ U_k(p) (1 + z²)^{−1/4}`, `p = (1 + z²)^{−1/2}`, with the normalization `(½)ₖ`. Both sides
  are holomorphic in `z` along the segment from `1` to `iλ`, which avoids the branch points
  `±i`, and the identity continues to `z = iλ`, where `1 + z² = 1 − λ²`;
- the leading terms `𝐀_{−ν}(λν) ∼ 1/(πν(λ − 1))` for `λ > 1` in `|ph ν| ≤ π − δ`, and
  `∼ (2/(πν))^{1/2} e^{−νμ(λ)}/(1 − λ²)^{1/4}` for `0 < λ < 1` in `|ph ν| ≤ π/2 − δ` (Olver,
  Ch. 3, Ex. 7.2, p. 84, and Ch. 9 §12.1, p. 352, at real `ν`; DLMF 11.11.14–11.11.15).

For `Re(λν) > 0`, 11.10.4 gives `𝐀_{±ν}(λν) = π⁻¹ ∫₀^∞ e^{−ν(λ sinh t ± t)} dt`. For 11.11.8 and
11.11.10 the phase is increasing from `t = 0` and odd, so Watson's lemma after the substitution
`u = λ sinh t ± t` gives only even powers, with the coefficients `a_k` by Lagrange–Bürmann. For
11.11.11 the phase has the interior minimum `p(t₀) = μ(λ) < 0 = p(0)`, Laplace's method at `t₀`
(AsymptoticExpansions 5.5) gives the series, and the endpoint contribution is exponentially smaller.
Watson's lemma gives 11.11.8 and 11.11.10 for `|ph ν| ≤ π/2 − δ`, and the rotation of the path
(AsymptoticExpansions 4.3) extends them up to the nearest singularities of `t` as a function of `u`,
the square-root branch points at the critical values of the phase. For 11.11.10 and for 11.11.8 with
`λ ≥ 1` the critical values are imaginary (for the phase `λ sinh t ± t` they are
`u = ±i(λ sin y ± y)` at `t = ±iy` with `cos y = ∓1/λ`), and the rotation reaches `|ph ν| ≤ π − δ`.
For 11.11.8 with `0 < λ < 1` the critical points `t = arccosh(1/λ) ± πi` give the branch points
`u = −μ(λ) ± πi` with `−μ(λ) > 0`, which stop the rotation at `|ph u| = π/2 − θ(λ)` and hence at
`|ph ν| = π − θ(λ)`. Beyond it, `J_ν(λν)/sin νπ` grows like `e^{|ν|(−μ(λ) cos ψ − π |sin ψ|)}`,
`ψ = π − ph ν`, so DLMF's sector `|ph ν| ≤ π − δ` is too wide.

**Checks.**
- `a₀(λ) = 1/(1 + λ)` and `a₁(λ) = −λ/(2(1 + λ)⁴)` from the definition:
  `(t/(t + λ sinh t))³ = (1 + λ)^{−3}(1 − λt²/(2(1 + λ)) + O(t⁴))`.
- `b₀ = √2 (2p″(t₀))^{−1/2}` with `p″(t₀) = λ sinh t₀ = (1 − λ²)^{1/2}` is `(1 − λ²)^{−1/4}`.
- Outside the corrected sector (an illustration that DLMF's sector fails): at `λ = 0.1`,
  `θ(λ) = 0.56651…`, so the sector ends at `ph ν = 2.57508…`. At `ν = 20e^{2.9i}`,
  `|𝐀_ν(λν)| = 3.786… × 10⁹`, while the leading term has modulus `0.0145…`. Inside, at
  `ν = 20e^{2.4i}`, `|𝐀_ν(λν)| = 0.01447…`.

*Suggested names:* `isBigO_angerWeberA_scaled` (11.11.8).

*Needs:* 1.5, 3.3; SpecialFunctionsBessel Conventions, 9.1; AsymptoticExpansions 4.2–4.3, 5.1,
5.4–5.5; Mathlib `PowerSeries`.

### Examples

- 11.11.14 is the first term of 11.11.10: `−π⁻¹ a₀(−λ) ν⁻¹ = −1/(π(1 − λ)ν) = 1/(πν(λ − 1))`.

### Dependencies

Layers 1–4; SpecialFunctionsBessel Conventions, 5.1, 9.1; AsymptoticExpansions 4.2–4.3, 5.1,
5.4–5.5; ZerosOfLFunctions 1.2.

## Layer 7: the turning point `z = ν`

### 7.1 Scorer's function at the coalescence

- `𝐀_{−ν}(ν) ∼ 2^{4/3}/(3^{7/6} Γ(⅔) ν^{1/3})` as `ν → ∞` in `|ph ν| ≤ π − δ` (Olver, Ch. 3,
  Ex. 7.2, p. 84, and Ch. 9 §12.1, (12.03), p. 352, at real `ν`; DLMF 11.11.16).
- For every `M > 0` and `δ > 0`, as `ν → ∞` in `|ph ν| ≤ π − δ`,
  `𝐀_{−ν}(ν + aν^{1/3}) = 2^{1/3} ν^{−1/3} Hi(−2^{1/3} a) + O(ν⁻¹)` uniformly for complex `a` with
  `|a| ≤ M`, with Scorer's `Hi` and the principal `ν^{1/3}`; in Lean, along
  `comap Prod.fst (Bornology.cobounded ℂ ⊓ 𝓟 {ν | |arg ν| ≤ π − δ}) ⊓ 𝓟 {p | ‖p.2‖ ≤ M}` on
  `ℂ × ℂ` (`isBigO_angerWeberA_transition`; Olver, Ch. 9 §12.1, (12.05), p. 352, at real `ν` and
  `a`; DLMF 11.11.17).

DLMF states 11.11.16 and 11.11.17 in `|ph ν| ≤ 2π − δ`; the part `π ≤ |ph ν| ≤ 2π − δ` lies off
the principal sheet and is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).
- For real `ν → +∞` only: `𝐉_ν(ν) ∼ 2^{1/3}/(3^{2/3} Γ(⅔) ν^{1/3})` and
  `𝐄_ν(ν) ∼ 2^{1/3}/(3^{7/6} Γ(⅔) ν^{1/3})` (`angerJ_self_isEquivalent`; Wong, Ch. II §3,
  Example 5, p. 82; Olver, Ch. 3, Ex. 13.2, p. 103; DLMF 11.11.18–11.11.19). DLMF states them in
  `|ph ν| ≤ π − δ`; for non-real `ν` the term `sin(πν) 𝐀_ν(ν)` of 11.10.15 dominates, and the
  ratio is about `2.8 × 10⁶` at `ν = 20 e^{0.3i}`.

11.11.16 is Laplace's method (AsymptoticExpansions 5.2, and 5.4 with the rotation of the path off
the positive axis) for 11.10.4 at `z = ν`, `𝐀_{−ν}(ν) = π⁻¹ ∫₀^∞ e^{−ν(sinh t − t)} dt`, whose
phase is `t³/6 + O(t⁵)` at `t = 0` (`μ = 3`). For 11.11.17 the substitution
`t = (2/ν)^{1/3} s` turns `π⁻¹ ∫₀^∞ e^{−ν(sinh t − t) − aν^{1/3} sinh t} dt` into
`(2/ν)^{1/3} π⁻¹ ∫₀^∞ e^{−s³/3 − 2^{1/3} a s} ds = 2^{1/3} ν^{−1/3} Hi(−2^{1/3} a)` plus `O(ν⁻¹)`,
uniformly for `|a| ≤ M`. For non-real `ν` both arguments run on a contour (AsymptoticExpansions
5.4): by Cauchy's theorem, and the identity theorem in `ν` from `ν > 0`, the path `(0, ∞)` of
11.10.4 is replaced by a path that leaves `0` along the ray `ph t = −(ph ν)/3`, the steepest-descent
direction of `νt³/6`, and ends along the line `Im t = −ph ν`, on which `ν sinh t` has positive
real part for large `Re t`; the substitution for 11.11.17 maps the first piece onto `s ≥ 0`.
11.11.18–11.11.19 are stationary phase at an endpoint (AsymptoticExpansions 6.2) for the
definitions at `z = ν`: `𝐉_ν(ν) + i𝐄_ν(ν) = π⁻¹ ∫₀^π e^{iν(θ − sin θ)} dθ`, with the phase
`θ − sin θ = θ³/6 + O(θ⁵)` at `θ = 0` (`μ = 3`, `λ = 1`) and `1 − cos π = 2 ≠ 0` at `θ = π`, which
contributes `O(ν⁻¹)`, as in Wong's Example 5. The leading term
`π⁻¹ e^{πi/6} Γ(⅓) (6/ν)^{1/3}/3`, with `Γ(⅓) Γ(⅔) = 2π/√3`, has real part
`2^{1/3}/(3^{2/3} Γ(⅔) ν^{1/3})` and imaginary part `2^{1/3}/(3^{7/6} Γ(⅔) ν^{1/3})`.

**Checks.**
- 11.11.17 at `a = 0` is 11.11.16, since `Hi(0) = 2 Gi(0) = 2/(3^{7/6} Γ(⅔))`, with DLMF 9.12.6
  for `Gi(0)`.
- `𝐀_{−10}(10) = 0.23669 40284 75…` against the leading term `0.23974 08488 46…`.

*Suggested names:* `isBigO_angerWeberA_transition` (11.11.17), `angerJ_self_isEquivalent`
(11.11.18).

*Needs:* 1.5, 3.3; SpecialFunctionsAiry 6.1–6.2; AsymptoticExpansions 5.2, 5.4, 6.2.

### 7.2 Olver's uniform expansion through the turning point

The expansions of 6.3 for `0 < λ < 1` and of 7.1 at `λ = 1` are the limiting forms of one
expansion, uniform in `λ = sech α ∈ (0, 1]` (Olver, Ch. 9 §§12–13, pp. 352–360; Wong, Ch. VII,
Ex. 14, p. 418). The definitions, for real `α ≥ 0`:
- `ζ(α) ≥ 0` with `(2/3) ζ^{3/2} = α − tanh α` (Olver, (12.08), p. 353);
- the map `w ↦ t(α, w)`: the increasing bijection of `[0, ∞)` onto itself with
  `sech α sinh t − t = w³/3 − ζ(α) w`, `t(α, 0) = 0` and `t(α, ζ^{1/2}) = α` (Olver, (12.09),
  p. 353); `q_s(α)` is the coefficient of `(w − ζ^{1/2})^s` in the Taylor series of `∂t/∂w` at
  `w = ζ^{1/2}`, which converges near that point (Olver, (12.11), pp. 353–354);
- the shifted Scorer moments
  `Qi_s(y) = π⁻¹ ∫₀^∞ exp(−v³/3 + yv) (v − y^{1/2})^s dv` for real `y ≥ 0` (Olver, (12.14), p. 354).

The targets:
- `t(α, ·)` is well defined, strictly increasing and real analytic on `[0, ∞)`, and each `q_s` is
  continuous on `[0, ∞)`, including the coalescence `α = 0`, where `ζ = 0` (Olver, §12.3,
  pp. 354–355);
- the moments: `Qi₀ = Hi` on `[0, ∞)`, `Qi₁(y) = Hi′(y) − y^{1/2} Hi(y)`, the recurrence
  `Qi_{s+2}(y) + 2y^{1/2} Qi_{s+1}(y) = s Qi_{s−1}(y) + π⁻¹ (−y^{1/2})^s` (with `Qi_{−1} = 0`), and
  `Qi_{2s}(y) > 0` (Olver, Ex. 12.2, p. 357, for the first three);
- the uniform expansion: for every even `N ≥ 2` there is `C` such that for all `α ≥ 0` and
  `ν > 0`, with `y = ν^{2/3} ζ(α)`,

```text
| 𝐀_{−ν}(ν sech α) − ∑_{s<N} q_s(α) ν^{−(s+1)/3} Qi_s(y) |
    ≤ C (1 + ζ(α))^{(N+1)/4} ν^{−(N+1)/3} Qi_N(y)
```

  (Olver, (12.20) and (12.23), p. 356, and §13.3, p. 360).

The proof follows Olver: AsymptoticExpansions 7.3 gives the cubic normal form near the coalescence,
Olver's mapping argument (§12.3) makes it global on `[0, ∞)` for `α` in a compact interval, and the
estimates of §13 (Ursell's extension) give the uniformity on `α ∈ [α₀, ∞)`, where `ζ → ∞`.

**Checks.**
- `Qi₀(0) = Hi(0) = 0.40995 10849 64…`, `Qi₁(0) = Hi′(0) = π⁻¹ 3^{−1/3} Γ(⅔) = 0.29885 89049 02…`.
- `Qi₂(0) = π⁻¹ ∫₀^∞ v² e^{−v³/3} dv = π⁻¹ = 0.31830 98861 83…`; without the factor `π⁻¹` the
  moments would give `1`, and the leading term at `α = 0` would be `π` times 11.11.16. At `y = 1.7`,
  `Qi₂ = π⁻¹ − 2y^{1/2} Qi₁ = 0.70862 92569 71…`.
- `q₀(α) = (2ζ^{1/2}/tanh α)^{1/2}`, from the quadratic terms of both sides at `t = α`; at
  `λ = ½` (`α = arccosh 2 = 1.31695 78969 24…`, `ζ = 0.77055 18364 33…`) it is
  `1.42380 37975 26…`, and `q₀(α) → 2^{1/3}`, not `1`, as `α → 0`, so the leading term at
  `α = 0` is `2^{1/3} ν^{−1/3} Hi(0)`, which is 11.11.16.
- At `λ = ½`, `ν = 40`: `𝐀_{−40}(20) = 9.28122 71801… × 10⁶`, against the leading term
  `q₀ ν^{−1/3} Qi₀(ν^{2/3} ζ) = 9.27610 75367… × 10⁶`.

*Needs:* 1.5, 3.3, 7.1; SpecialFunctionsAiry 6.1; AsymptoticExpansions 7.3.

### Examples

- At `α = 0` the uniform expansion reduces to an expansion in powers of `ν^{−1/3}` whose first
  term is 11.11.16; for fixed `α > 0`, the large-`y` forms of `Qiₛ` (Olver, (12.15)–(12.16),
  p. 354) turn it into the expansion 11.11.11 of 6.3.

### Dependencies

Layers 1 and 3; SpecialFunctionsBessel Conventions; SpecialFunctionsAiry 6.1–6.2;
AsymptoticExpansions 5.2, 5.4, 6.2, 7.3.

## Downstream consumers

- **SpecialFunctionsBessel** sends DLMF 10.22.2 and 10.43.2 here; this roadmap proves them (2.3).
- A roadmap for the generalized hypergeometric functions can identify `𝐇_ν`,
  `𝐋_ν` and `s_{μ,ν}` with its `₁F₂` through the definitions here.
- A roadmap for the uniform expansions of the inhomogeneous Bessel equations for large order
  (Olver's treatment of the inhomogeneous modified Bessel equation) consumes the Lommel functions
  of 1.2, 3.2–3.3 and 4.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Values off the principal sheet**: the continuation formulas of 2.6 for `z e^{mπi}` outside the
  principal sheet, and the transition-region expansions of 7.1 for `π ≤ |ph ν| ≤ 2π − δ`, which
  need the functions in logarithmic coordinates.
- **Uniform expansions of the solutions of the inhomogeneous modified Bessel equation** for large
  `ν` and `μ ∈ {−1, 0, 1, 2, …}` (DLMF §11.9(iii), last paragraph, Olver 1997b), which need the
  turning-point theory that AsymptoticExpansions excludes; and the companion of 7.2 for
  `λ = sec β ≥ 1` (Olver, Ch. 9, Ex. 12.3, p. 357).
- **Loop-integral versions** of the Poisson and Laplace integrals of 3.1 and 3.3 (DLMF §11.5(ii)),
  the integrals with respect to the order (DLMF §11.7(iv)), the products of `𝐌_ν`, the sums of
  Struve and Anger functions (Magnus–Oberhettinger–Soni, §3.10.3, pp. 116–117), and the further
  integrals of Gradshteyn–Ryzhik §§6.82–6.85 and of Oberhettinger's tables.
- **Struve functions of argument `x e^{±3πi/4}`** (DLMF §11.8), the Lommel functions of two
  variables (Gradshteyn–Ryzhik 8.578–8.579, p. 956), and the Lommel functions of order derivatives
  (Magnus–Oberhettinger–Soni, §3.10.1, p. 111).
- **Physical applications, computation, tables, approximations and software**.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes special
functions on top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes),
drawing on DLMF and on books including Olver's and Duverney's. Its directory `DLMF/Struve/` provides
source material for every layer, including the corrected statements of 11.4.15, 11.7.12, 11.11.6
and 11.11.18–11.11.19, which its
[errata note](https://github.com/bjbraams/lean-DLMF/blob/main/reports/DLMFErrata.tex) records, and
Olver's uniform expansion of 7.2 (`Struve/Asymptotics/ScorerTransition`, with the moments `Qiₛ` in
`Airy/Scorer/ShiftedMoments`), whose statements it still admits. That development defines the
Struve functions by their reciprocal-Gamma series rather than through Mathlib's `₁F₂`, and the
capital Lommel function and `𝐀_ν` by limits in the parameter at every point; this roadmap pins
Mathlib's series and the derivative form at integer order for `𝐀_ν`.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Struve/Basic/Functions`, `SeriesAndEquations`, `Basic/Lommel`, `Basic/AngerWeber` |
| 2 | `Struve/Properties`, `RelativeBounds`, `SeriesAndEquations`, `Lommel`, `AngerWeber/IntegralAndSeries`, `AngerWeber/LommelConnections` |
| 3 | `Struve/Representations/PoissonAndBarnesLoop`, `BarnesAndSonine`, `BarnesTools`, `Lommel`, `AngerWeber/IntegralAndSeries` |
| 4 | `Struve/Asymptotics/Watson`, `IntegratedExpansions`, `IntegratedKernels`, `BinomialAndAnger`, `Lommel` |
| 5 | `Struve/Representations/BarnesAndSonine`, `Mellin`, `IntegralRelations` |
| 6 | `Struve/Asymptotics/LargeOrder`, `LargeOrderTools`, `AsymptoticTools`, `AngerWeberExpansions`, `ScaledExpansions`, `TurningPointEstimates`, `Coefficients` |
| 7 | `Struve/Asymptotics/ScaledExpansions`, `InnerExpansions`, `TurningTools`, `ScorerTransition`; `Airy/Scorer/ShiftedMoments` |

## References

- R. B. Dingle, *Asymptotic Expansions: Their Derivation and Interpretation*, Academic Press,
  1973, Ch. VIII (exercises), Ch. XVIII (§§1–2 and exercises) and Ch. XIX §3.
- F. Duverney, *An Introduction to Hypergeometric Functions*, Birkhäuser, 2024, Ch. 7, Ex. 7.13.
- I. S. Gradshteyn and I. M. Ryzhik, *Table of Integrals, Series, and Products*, 8th ed.,
  ed. D. Zwillinger and V. Moll, Academic Press, 2015, §§6.81–6.82, 8.55, 8.57–8.58.
- W. Magnus, F. Oberhettinger and R. P. Soni, *Formulas and Theorems for the Special Functions of
  Mathematical Physics*, 3rd ed., Grundlehren 52, Springer, 1966, §3.10.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 11
  (R. B. Paris), with Chapters 9 and 10 for the cited Scorer and Bessel formulas,
  <https://dlmf.nist.gov/11>. Equation numbers refer to this release.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Ch. 3 (Exs. 7.2, 13.2–13.3), Ch. 7 §15 and Ch. 9 §§12–13.
- R. Wong, *Asymptotic Approximations of Integrals*, Academic Press, 1989; reprinted SIAM Classics
  in Applied Mathematics 34, 2001, Ch. II §3 and Ch. VII (exercises).

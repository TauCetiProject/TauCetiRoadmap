# Roadmap: the Appell functions

**Summary.** This roadmap builds the theory of the four Appell functions `F₁`, `F₂`, `F₃`, `F₄`
of two complex variables, and of Horn's functions `G₂` and `G₃`, as a library. The Appell
functions are the double series

```text
F₁(α; β, β′; γ; x, y)     = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!) xᵐ yⁿ
F₂(α; β, β′; γ, γ′; x, y) = ∑_{m,n} (α)_{m+n} (β)ₘ (β′)ₙ/((γ)ₘ (γ′)ₙ m! n!) xᵐ yⁿ
F₃(α, α′; β, β′; γ; x, y) = ∑_{m,n} (α)ₘ (α′)ₙ (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!) xᵐ yⁿ
F₄(α, β; γ, γ′; x, y)     = ∑_{m,n} (α)_{m+n} (β)_{m+n}/((γ)ₘ (γ′)ₙ m! n!) xᵐ yⁿ
```

on the domains `max(|x|, |y|) < 1`, `|x| + |y| < 1`, `max(|x|, |y|) < 1` and
`√|x| + √|y| < 1` respectively; they are Lauricella's `F_D`, `F_A`, `F_B`, `F_C` in two variables.
The organization follows the structure of the subject rather than any one text. A first layer
treats the four series together, as series whose coefficient ratios are rational in the indices:
coefficients, convergence, holomorphy, derivatives, contiguous relations and the expansions in
Gauss functions. A second layer gives the identity theorem in two variables, which fixes the
principal branches. Then each function has its own layer, in the order `F₁`, `F₃`, `F₂`, `F₄`:
its Euler integral and principal branch, its system of partial differential equations, and its
transformations and reductions. Horn's `G₂` and `G₃` come last. The content is drawn from
Matsumoto's chapter *Appell and Lauricella hypergeometric functions* in Koornwinder–Stokman
(*Encyclopedia of Special Functions II*, Ch. 3), Aomoto–Kita (*Theory of Hypergeometric
Functions*, §3.1), Iwasaki–Kimura–Shimomura–Yoshida (*From Gauss to Painlevé*, §3.9.1), Srinivasa
Rao–Lakshminarayanan (*Generalized Hypergeometric Functions*, Ch. 7) and the NIST *Digital Library
of Mathematical Functions* (DLMF), and each headline cites its sources; see
[References](#references).

Neither Mathlib nor Tau Ceti has a function of two variables of hypergeometric type. This roadmap
defines the regularized series for all complex parameters, the principal branches of `F₁` and
`F₃` on `{(x, y) | 1 − x, 1 − y ∈ ℂ \ (−∞, 0]}` and of `F₂` on the domain of its Euler integral,
and proves their theory.

The roadmap covers:
- the four double series: coefficients and their recurrences, convergence, holomorphy in the
  variables and the parameters, symmetries, conjugation, values on the axes, derivatives,
  contiguous relations, the expansions in series of Gauss functions, and the series with all three
  index pairs coupled, which is a Gauss function of `x + y` (Layer 1);
- the principal domains and the identity theorem in two variables (Layer 2);
- `F₁`: its Euler integral and principal branch, holomorphy in all parameters, its system of three
  partial differential equations, its two transformations under `x ↦ x/(x − 1)`, and its reduction
  to the Gauss function at `γ = β + β′` (Layer 3);
- `F₃`: its Euler integral over a triangle and principal branch, its system, and its reductions to
  `F₁` and to the Gauss function (Layer 4);
- `F₂`: its Euler double integral and principal branch, its system, its transformation, and its
  reductions to the Gauss function and to `F₁` (Layer 5);
- `F₄`: its system, the Burchnall–Chaundy expansion and its cases, its Euler integral, and the
  connection formula at infinity for its sum over fibres (Layer 6);
- Horn's `G₂` and `G₃`: convergence and their systems (Layer 7).

The roadmap rests on Mathlib and Tau Ceti and on
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md), which is on main
and supplies the Gauss function on its cut plane, the Chu–Vandermonde sum, the transformations of
Euler and Pfaff and the connection formula at infinity.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Appell/`, beside the Gauss function of
SpecialFunctionsHypergeometric.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The four double series** (1.1–1.7).
2. **Analytic continuation in two variables** (2.1–2.2).
3. **The function `F₁`** (3.1–3.5).
4. **The function `F₃`** (4.1–4.3).
5. **The function `F₂`** (5.1–5.4).
6. **The function `F₄`** (6.1–6.4).
7. **Horn's `G₂` and `G₃`** (7.1–7.2).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
nor SpecialFunctionsHypergeometric provides:
- summability of a double series over `ℕ × ℕ` from a bound on its terms, and termwise
  differentiation of a double power series (1.2–1.4);
- the contiguous relations of `𝐅₁`, `𝐅₂`, `𝐅₃` in their parameters (1.6);
- holomorphy of the Euler integrals in the variables and the parameters on their domains (3.1,
  4.1, 5.1);
- finite identities of Pochhammer symbols for the Taylor coefficients of the reduction of `F₃` to
  `F₁` and of the Burchnall–Chaundy expansion (4.3, 6.2);
- the systems of second-order equations of `G₂` and `G₃` (7.2);
- the sum of `F₄` over fibres of Gauss functions of `y`, and its convergence for large `y` (6.4).

**What it does not own:**
- The Gauss function (SpecialFunctionsHypergeometric), whose results 1.2–1.4, 4.2 and 5.1 it
  consumes.
- The generalized hypergeometric functions `ₚF_q` and the Meijer `G`-function.
- The other Horn functions, the large-parameter asymptotics, the double Mellin–Barnes integrals,
  the inverse Laplace transforms, the expansions for large `x` or `y` other than the connection
  formula of 6.4, the quadratic transformations, the rank, singular locus and monodromy of the
  systems, and the principal branch of `F₄` in two variables.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the four Appell series, the principal branches
of `F₁`, `F₂` and `F₃`, Horn's `G₂` and `G₃`, and the identities, systems and integral
representations stated through them, the Gauss function, elementary functions and `Γ`, as listed
in the layers; it consumes the Gauss function and its sums and transformations from
SpecialFunctionsHypergeometric.

## Conventions

- **Parameters and variables.** The parameters `α, α′, β, β′, γ, γ′` are Lean's
  `a a' b b' c c' : ℂ`, in the order of the Summary, followed by the variables `x y : ℂ`. A point
  of `ℂ × ℂ` is `(x, y)`. Matsumoto writes `a, b₁, b₂, c₁, c₂` and `x₁, x₂` for the same
  quantities.
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
  when a bottom parameter lies in `{0, −1, −2, …}`, Mathlib's junk value of `Γ`, where the
  classical function does not exist. Every formula is stated in regularized form for all
  parameters where that form holds, and the classical form in `F`, under the hypothesis that no
  bottom parameter lies in `{0, −1, −2, …}`, is stated beside it as a corollary.
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
    which the integrand of the Euler integral of 5.1 has no singularity. It is open (the square is
    compact), star-shaped about `0`, and contains `appellSimplex`.

  `appellSimplex` lies in `appellBidisc`, `appellDomain1` and `appellDomain2`, and
  `appellF4Domain` and `hornG3Domain` lie in `appellSimplex`.
- **The principal branches.** `regularizedAppellF1 a b b' c x y` is, for `(x, y) ∈ appellDomain1`,
  the value at `(x, y)` of a function analytic on `appellDomain1` that equals the series on
  `appellSimplex`. It is `Classical.choose` of the existence of such a function; 2.2 proves that
  its values on `appellDomain1` do not depend on the choice, and 3.1 that it exists. Off
  `appellDomain1` the value is `0`, a junk value that no theorem uses. `𝐅₃` on `appellDomain1` and
  `𝐅₂` on `appellDomain2` are defined in the same way (4.1, 5.1). `𝐅₄` is the sum of its series,
  and is used only on `appellF4Domain` and on the sets of Layer 6 that lie in it. The construction
  by Euler integrals and contiguous relations is a theorem, not the definition.
- **Holomorphy in two variables** is `AnalyticOnNhd ℂ f D` for `f : ℂ × ℂ → ℂ`; Mathlib's identity
  theorem `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` applies to it on a connected open
  set. Holomorphy in the parameters is `DifferentiableOn ℂ` of the function of all parameters and
  variables: for `𝐅₁`, the map `p ↦ 𝐅₁(p.1 0; p.1 1, p.1 2; p.1 3; p.2.1, p.2.2)` on
  `(Fin 4 → ℂ) × (ℂ × ℂ)` is `DifferentiableOn ℂ` on `univ ×ˢ appellDomain1`, and likewise with
  `Fin 5` for `𝐅₂`, `𝐅₃` and `Fin 4` for `𝐅₄` (1.3, 3.2, 4.1, 5.1).
- **Partial derivatives** are written with `deriv` in one variable: `∂ₓf(x, y)` is
  `deriv (fun s ↦ f s y) x` and `∂ᵧf(x, y)` is `deriv (fun t ↦ f x t) y`. `Suggested.lean`
  abbreviates them as `pdx f x y` and `pdy f x y`; these helpers are not targets. The Euler
  operators are `ϑₓ = x ∂ₓ` and `ϑᵧ = y ∂ᵧ`.
- **Powers** are principal (`Complex.cpow`), each factor with the branch that the formula prints,
  for instance `(1 − y)^{−α}` on `1 − y ∈ slitPlane` and `(−y)^{−α}` on `−y ∈ slitPlane`. A
  product of principal powers is not combined into one power.
- **Domains of identities.** An identity between functions of `(x, y)` is stated on
  `connectedComponentIn S (0, 0)`, where `S` is the open set, given with each formula, on which
  every function in it is evaluated inside its principal domain or series domain and every power
  is evaluated off its cut. Where `S` is itself connected, as for the reduction of `F₃` to `F₁`
  and the first transformation of `F₁`, the identity is stated on `S`.
- **Integrals.** Single integrals are `intervalIntegral` over `0..1` in a real variable `u`, with
  `(u : ℂ)` in the integrand; the double integral over `[0, 1]²` is an iterated `intervalIntegral`;
  the triangle `Δ = {(u, v) | 0 ≤ u, 0 ≤ v, u + v ≤ 1}` of 4.1 is `appellTriangle : Set (ℝ × ℝ)`
  with `MeasureTheory.volume`. The Gamma prefactors are reciprocal, as in
  SpecialFunctionsHypergeometric's `eulerIntegral`. The regularized Euler integrals of 3.1, 5.1,
  4.1 and 6.3 are `appellF1EulerIntegral`, `appellF2EulerIntegral`, `appellF3EulerIntegral` and
  `appellF4EulerIntegral`.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.regularizedGaussHypergeometric a b c z` and `Complex.gaussHypergeometric a b c z`, the
  principal branches on the cut plane `1 − z ∈ slitPlane`, with the junk value `0` off it.
- Its 1.2–1.4: Euler's integral (DLMF 15.6.1), the shift relations in `c` and in `b`, the
  agreement with Mathlib's series `Complex.regularizedGaussHGFun` on the unit disk, the joint
  holomorphy in `(a, b, c, z)` and the symmetry in `a` and `b`. They are the fibres of 1.5 and the
  model for the principal branches of Layers 3–5.
- Its 4.2: the Chu–Vandermonde sum (DLMF 15.4.24), for the coefficient identities of 4.3 and 6.2.
- Its 5.1: the transformations of Euler and Pfaff (DLMF 15.8.1), for 5.4, 6.2 and the bound on
  the fibres near `[−2, 0]` in 6.4, and the connection formula at infinity (DLMF 15.8.2), in the
  form with the factor `sin(π(b − a))/π` that holds for all parameters, for 6.4.

`Suggested.lean` imports Mathlib and the one Tau Ceti module below, and carries roadmap-local
copies of the four definitions of SpecialFunctionsHypergeometric's `Suggested.lean` behind the
Gauss function: `eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric` and
`gaussHypergeometric`.

### From Tau Ceti

- **The binomial series.** `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`
  (`TauCeti/Analysis/Analytic/Binomial.lean`), for the reductions of 5.4.

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
symbols and reciprocal Gamma functions whose ratios in each index are rational, Horn's
characterization of hypergeometric series in two variables. So the series converge absolutely on
their domains for all parameters, their sums are analytic there and holomorphic in the
parameters, and differentiation, contiguous relations and the systems of differential equations
all come from the coefficient recurrences. Summing first over one index writes each Appell series
as a series of Gauss functions in the other variable, which connects the Appell functions to
SpecialFunctionsHypergeometric.

Layer 2 proves the identity theorem on the principal domains, which makes the principal branches
unique. Layers 3–5 construct them, as SpecialFunctionsHypergeometric 1.2 does for `𝐅`: in the
parameter region of the Euler integral, the integral is analytic on the principal domain and
equals the series near the origin; the contiguous relations of 1.6 express the function at any
parameters through finitely many functions in that region. Each of these layers then proves the
system of its function, on the series domain from the coefficient recurrences and on the
principal domain by the identity theorem, and its transformations and reductions. Each such
identity is first proved near the origin, by the Euler integral with a substitution, by the
binomial series, by the expansions of 1.5 with the transformations of the Gauss function, or by
comparing Taylor coefficients; the identity theorem then extends it to the connected component of
the origin in the set where both sides are defined. `F₁` comes first, because the reductions of
`F₃` and `F₂` land in `F₁`.

Layer 6 treats `F₄`, which has no principal branch here. The Burchnall–Chaundy expansion comes
from a coefficient identity, and the Euler integral of `F₄` follows from it by expanding the
integrand. The sum over fibres of Gauss functions in `y` converges also for large `y`, and the
connection formula at infinity of the Gauss function, applied fibre by fibre, gives the
connection formula of `F₄`. Layer 7 treats Horn's `G₂` and `G₃`, which need only Layer 1.

The `**Checks.**` and `### Examples` of each layer test the conventions on explicit values. A
Check or Example that is an exact identity or an exact value (such as `2x²/(1 − x)³`, or a junk
value `0`) is a statement to prove. A decimal value is a numerical illustration, computed with
mpmath to the digits shown; it is not a target.

## Layer 1: the four double series

### 1.1 Coefficients and their recurrences

The regularized coefficients as pinned, `appellF1Coeff a b b' c m n` and its analogues
`appellF2Coeff`, `appellF3Coeff`, `appellF4Coeff` (Matsumoto, Def. 3.2.1, p. 80; Aomoto–Kita,
§§3.1.2–3.1.8, pp. 104–107; Rao–Lakshminarayanan (7.12)–(7.15), pp. 7-4–7-5; DLMF
16.13.1–16.13.4). Targets, for all parameters:
- **the coefficients**: when no bottom parameter lies in `{0, −1, −2, …}`, `Γ(γ)` times the
  coefficient of `𝐅₁` is the classical coefficient `(α)_{m+n} (β)ₘ (β′)ₙ/((γ)_{m+n} m! n!)`, and
  likewise for `F₂`, `F₃`, `F₄` (`gamma_mul_appellF1Coeff`, …);
- **the recurrences** of the coefficients `c_{m,n}` in `m` and in `n`, for all parameters, for
  example `(m + 1)(γ + m + n) c_{m+1,n} = (α + m + n)(β + m) c_{m,n}` for `𝐅₁`, which holds at the
  poles too because `Γ(s)⁻¹ = s Γ(s + 1)⁻¹` for every `s`. The ratios `c_{m+1,n}/c_{m,n}` and
  `c_{m,n+1}/c_{m,n}` are rational in `m` and `n` of degree two, which is Horn's definition of a
  hypergeometric series in two variables (Matsumoto, p. 80; Aomoto–Kita, Def. 3.1, (3.1)–(3.2),
  p. 104).

**Checks.**
- `F₁(α; β, β′; γ; x, y)` at `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `γ = 1.6`, `x = 0.2 + 0.1i`,
  `y = −0.25 + 0.15i` is `0.98534 81954 425… + 0.02596 17300 552… i`.
- `F₃(α, α′; β, β′; γ; x, y)` at the same values and `α′ = 0.55` is
  `0.96168 31418 788… + 0.03844 07217 529… i`.
- Coupling the index pairs matters: with `(α)ₘ (α)ₙ` and `(γ)ₘ (γ)ₙ` in place of `(α)_{m+n}` and
  `(γ)_{m+n}`, the series of `F₁` would be `F(α, β; γ; x) F(α, β′; γ; y)`, which at the values of
  the first Check is `0.98650 59953 003… + 0.02603 34196 170… i`.

*Needs:* Mathlib `Complex.Gamma_add_one`.

### 1.2 Convergence

The series of `𝐅₁` and `𝐅₃` converge absolutely on `appellBidisc`, that of `𝐅₂` on
`appellSimplex`, and that of `𝐅₄` on `appellF4Domain`, for all parameters
(`summable_norm_appellF1Coeff`, `summable_norm_appellF2Coeff`, `summable_norm_appellF3Coeff`,
`summable_norm_appellF4Coeff`; Matsumoto, Def. 3.2.1, p. 80; for `F₁`, the case of two variables of
Iwasaki et al., Prop. 9.1.1, p. 246; DLMF 16.13.1–16.13.4). The proof bounds the coefficient by
`C (1 + m + n)^K` times `1`, `(m + n)!/(m! n!)` and `((m + n)!/(m! n!))²` respectively, and for
`F₄` uses `(m + n)!/(m! n!) ≤ r^{−m} s^{−n}` whenever `r + s = 1`, with `r = √‖x‖/ρ`,
`s = √‖y‖/ρ` for `ρ = √‖x‖ + √‖y‖ < 1`.

**Checks.**
- The domains are sharp on the diagonal: at `x = y = t > 0` the terms of the series of `F₂` with
  `α = β = β′ = γ = γ′ = 1` are `(m + n)!/(m! n!) tᵐ⁺ⁿ`, whose sum is finite exactly for `t < ½`.

*Needs:* 1.1; Mathlib `Summable.of_norm_bounded`.

### 1.3 Holomorphy, symmetry, conjugation and values on the axes

- **Analyticity**: each regularized series is analytic on its domain as a function of `(x, y)`,
  from locally uniform convergence of the double power series; and jointly holomorphic in all
  parameters and `(x, y)` on `univ` times its domain (`differentiableOn_regularizedAppellF4` for
  `𝐅₄`).
- **Symmetries**: `𝐅₁`, `𝐅₂` and `𝐅₃` are unchanged under `(β, x) ↔ (β′, y)` (for `𝐅₃` together
  with `α ↔ α′`, for `𝐅₂` together with `γ ↔ γ′`), and `𝐅₄` under `(γ, x) ↔ (γ′, y)`; `𝐅₃` is
  symmetric in `α ↔ β` and in `α′ ↔ β′`, and `𝐅₄` in `α ↔ β` (Matsumoto, p. 81, for `F_B` and
  `F_C` and the simultaneous permutations of variables and parameters).
- **Conjugation**: each series at conjugate parameters and variables is the conjugate.
- **Values on the axes**: `𝐅₁(α; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)`,
  `𝐅₂(α; β, β′; γ, γ′; x, 0) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)`, `𝐅₃(α, α′; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)`
  and `𝐅₄(α, β; γ, γ′; x, 0) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)` on the respective domains
  (`regularizedAppellF1Series_zero` for `𝐅₁`); and
  `𝐅₁(α; β, 0; γ; x, y) = 𝐅(α, β; γ; x)`, `𝐅₃(α, α′; β, 0; γ; x, y) = 𝐅(α, β; γ; x)` on
  `appellBidisc`, since every term with `n ≥ 1` vanishes.

*Needs:* 1.1–1.2; SpecialFunctionsHypergeometric 1.3; Mathlib `Complex.Gamma_conj`.

### 1.4 Derivatives

On the series domains, for all parameters (Matsumoto, Thm. 3.8.2, p. 92, at `k = (1, 0)`):

```text
∂ₓ 𝐅₁(α; β, β′; γ; x, y)     = α β 𝐅₁(α + 1; β + 1, β′; γ + 1; x, y)
∂ₓ 𝐅₂(α; β, β′; γ, γ′; x, y) = α β 𝐅₂(α + 1; β + 1, β′; γ + 1, γ′; x, y)
∂ₓ 𝐅₃(α, α′; β, β′; γ; x, y) = α β 𝐅₃(α + 1, α′; β + 1, β′; γ + 1; x, y)
∂ₓ 𝐅₄(α, β; γ, γ′; x, y)     = α β 𝐅₄(α + 1, β + 1; γ + 1, γ′; x, y)
```

and the `∂ᵧ` formulas by the symmetries of 1.3 (`pdx_regularizedAppellF4` for `𝐅₄`). In
regularized form no quotient by `(γ)₁` appears. The proof differentiates the double power series
termwise.

*Needs:* 1.1–1.3.

### 1.5 Expansions in Gauss functions

On the series domains, for all parameters, summing over `m` with `n` fixed:

```text
𝐅₁(α; β, β′; γ; x, y)     = ∑ₙ (α)ₙ (β′)ₙ / n! yⁿ 𝐅(α + n, β; γ + n; x)
𝐅₂(α; β, β′; γ, γ′; x, y) = ∑ₙ (α)ₙ (β′)ₙ / (Γ(γ′ + n) n!) yⁿ 𝐅(α + n, β; γ; x)
𝐅₃(α, α′; β, β′; γ; x, y) = ∑ₙ (α′)ₙ (β′)ₙ / n! yⁿ 𝐅(α, β; γ + n; x)
𝐅₄(α, β; γ, γ′; x, y)     = ∑ₙ (α)ₙ (β)ₙ / (Γ(γ′ + n) n!) yⁿ 𝐅(α + n, β + n; γ; x)
```

as `HasSum` over `ℕ` (`hasSum_regularizedAppellF1Series_fibre` for `𝐅₁`), with the Gauss function
of SpecialFunctionsHypergeometric, which on the unit disk is its series. The expansions summing over
`n` follow by the symmetries of 1.3. The proof is `HasSum.prod_fiberwise` on the absolutely
convergent double series.

*Needs:* 1.1–1.3; SpecialFunctionsHypergeometric 1.3.

### 1.6 Contiguous relations

For all parameters, as identities of the series on their domains, coefficient by coefficient
(Matsumoto, Remark 3.8.3, p. 92; the relations on the principal domains are in 3.2, 4.1 and 5.1):

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
The contiguity relations with first-order operators of `𝐅₁` are targets as well, on
`appellBidisc` and for all parameters (Matsumoto, Thm. 3.8.1, pp. 91–92, for `F_D`):

```text
α 𝐅₁(α + 1; β, β′; γ)  = (α + ϑₓ + ϑᵧ) 𝐅₁(α; β, β′; γ)
β 𝐅₁(α; β + 1, β′; γ)  = (β + ϑₓ) 𝐅₁(α; β, β′; γ)
𝐅₁(α; β, β′; γ − 1)    = (γ − 1 + ϑₓ + ϑᵧ) 𝐅₁(α; β, β′; γ)
```

from `α (α + 1)ₖ = (α + k)(α)ₖ` and `1/Γ(γ − 1 + k) = (γ − 1 + k)/Γ(γ + k)`; the last holds at
the poles because it is stated for `𝐅₁`.

**Checks.**
- At the parameters and point of 1.1 the two sides of each relation agree; for instance both sides
  of the first are `𝐅₁(0.3; 0.45, 0.7; 1.6; 0.2 + 0.1i, −0.25 + 0.15i)`, and both sides of the
  first operator relation, in the classical form, are `0.28222 90123 515… + 0.03217 60057 464… i`.

*Needs:* 1.1–1.4.

### 1.7 The coupled series

When all three index pairs are coupled, the double series is a Gauss function of `x + y`: for all
parameters and `(x, y) ∈ appellSimplex`,

```text
∑_{m,n} (α)_{m+n} (β)_{m+n} / (Γ(γ + m + n) m! n!) xᵐ yⁿ = 𝐅(α, β; γ; x + y)
```

as `HasSum` over `ℕ × ℕ` (`hasSum_coupled_regularizedGaussHypergeometric`;
Rao–Lakshminarayanan (7.8)–(7.11), p. 7-4). The proof groups the absolutely convergent series by
`k = m + n` and applies the binomial theorem to `∑_{m+n=k} xᵐ yⁿ k!/(m! n!) = (x + y)ᵏ`.

**Checks.**
- At `α = 0.3`, `β = 0.45`, `γ = 1.6` and the point of 1.1, both sides, in the classical form, are
  `F(α, β; γ; −0.05 + 0.25i) = 0.99411 67602 852… + 0.02014 20493 213… i`.
- On the antidiagonal `y = −x` the sum is `𝐅(α, β; γ; 0) = Γ(γ)⁻¹` for every `‖x‖ < ½`, although
  no term after the first vanishes.

*Needs:* 1.1–1.2; SpecialFunctionsHypergeometric 1.3.

### Examples

- `F₄(α, β; γ, γ′; x, y)` at `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.1 + 0.05i`,
  `y = 0.2 − 0.1i` is `1.07351 32898 7… − 0.01857 98829 352… i`.
- `𝐅₁(1; 1, β′; −1; x, 0) = 2x²/(1 − x)³` for `‖x‖ < 1` (by 1.3 and SpecialFunctionsHypergeometric
  1.3), while `appellF1 1 1 b' (-1) x 0 = 0`, the junk value of `Γ`; this excludes defining `𝐅₁` as
  `F₁/Γ(γ)` with Lean's junk values.

### Dependencies

Mathlib and SpecialFunctionsHypergeometric 1.3.

## Layer 2: analytic continuation in two variables

### 2.1 The principal domains

- `appellDomain1` is open, as the preimage of `slitPlane × slitPlane` under a continuous map, and
  connected (`isConnected_appellDomain1`; a product of two sets star-shaped about `0`, by
  `Complex.starConvex_one_slitPlane`), and it contains `appellBidisc`.
- `appellDomain2` is open, by compactness of `[0, 1]²`, and star-shaped about `0`
  (`isOpen_appellDomain2`, `starConvex_appellDomain2`), and it contains `appellSimplex`.

**Checks.**
- `(0.9, 0.9) ∈ appellDomain1` but `(0.9, 0.9) ∉ appellDomain2`, since `1 − 0.9 − 0.9 < 0`; and
  `(0, −2) ∈ appellDomain1 ∩ appellDomain2`, outside both series domains.

*Needs:* Mathlib `Complex.starConvex_one_slitPlane`, `IsPreconnected.prod`.

### 2.2 Uniqueness

- **The identity theorem on `ℂ × ℂ`**: two functions analytic on a connected open set `D` that
  agree on a nonempty open subset agree on `D`. This is Mathlib's
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` on the normed space `ℂ × ℂ`.
- **Uniqueness of the continuations**: two functions analytic on a connected open set containing
  `appellSimplex` that equal the same series on `appellSimplex` agree on that set
  (`IsAppellContinuation.eqOn`); this applies to `𝐅₁` and `𝐅₃` on `appellDomain1` and `𝐅₂` on
  `appellDomain2`.

*Needs:* 2.1; Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

### Examples

- `𝐅₁(a; b, b′; c; x, y) = 0` at `x = 1` or `x = 3`, the junk value off `appellDomain1`.

### Dependencies

Layer 1.

## Layer 3: the function `F₁`

### 3.1 Euler's integral and the principal branch

The regularized Euler integral, with principal powers (Matsumoto, Thm. 3.4.1, second
representation of `F_D`, p. 82; DLMF 16.15.1):

```text
E₁ = (Γ(α) Γ(γ − α))⁻¹ ∫₀¹ u^{α−1} (1 − u)^{γ−α−1} (1 − ux)^{−β} (1 − uy)^{−β′} du
```

Targets:
- **holomorphy**: `E₁` is analytic in `(x, y)` on `appellDomain1` in the region
  `Re γ > Re α > 0`, and jointly holomorphic in the parameters there. The points `1 − ux`, `1 − uy`
  lie in the cut plane for `u ∈ [0, 1]` when `1 − x`, `1 − y` do, since `slitPlane` is star-shaped
  about `1`;
- **agreement with the series** on `appellSimplex` in that region, by termwise integration of
  the binomial series of the powers and `Complex.Gamma_mul_Gamma_eq_betaIntegral`;
- **existence** (`exists_isAppellContinuation_F1`): the contiguous relations of 1.6 express the
  series at any parameters, on `appellSimplex`, as a finite combination with polynomial
  coefficients in `(x, y)` of series at parameters in the Euler region. As in
  SpecialFunctionsHypergeometric 1.2, the construction with fixed shift counts is analytic on
  `appellDomain1` where its last step lies in the Euler region, equals the series on
  `appellSimplex`, and two constructions agree where both are defined;
- **the Euler integral**: `𝐅₁ = E₁` on `appellDomain1` for `Re γ > Re α > 0`
  (`regularizedAppellF1_eq_eulerIntegral`), and the classical form with `Γ(γ)` in the numerator;
- **agreement**: `𝐅₁` equals its series on `appellBidisc` (`regularizedAppellF1_eq_series`).

**Checks.**
- `F₁(0.3; 0.45, 0.7; 1.6; 2 + i, −3) = 0.84255 51403 357… + 0.12591 00090 747… i`, outside the
  bidisc, and its value at `(2 − i, −3)` is the conjugate. This excludes a branch continued across
  the cut `x ∈ [1, ∞)` from the lower half-plane.

*Needs:* 1.1–1.3, 1.6, 2.1–2.2; SpecialFunctionsHypergeometric 1.2–1.4; Mathlib
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 3.2 Holomorphy in all parameters and the properties on the principal domain

- **Joint holomorphy**: `(a, b, b', c, x, y) ↦ 𝐅₁(a; b, b′; c; x, y)` is holomorphic on `ℂ⁴` times
  `appellDomain1` (`differentiableOn_regularizedAppellF1`). Near every point it is one shift
  construction with fixed counts.
- **The contiguous relations of 1.6 on `appellDomain1`** (`regularizedAppellF1_shift_c`,
  `regularizedAppellF1_shift_a`, …), since both sides are analytic there and agree on
  `appellSimplex`.
- **The properties of 1.3–1.4 on `appellDomain1`**: the symmetry, conjugation
  (`regularizedAppellF1_conj`), the values on the axes (`𝐅₁(α; β, β′; γ; x, 0) = 𝐅(α, β; γ; x)` for
  `1 − x ∈ slitPlane`), the reduction `𝐅₁(α; β, 0; γ; x, y) = 𝐅(α, β; γ; x)`
  (`regularizedAppellF1_zero_right`), and the derivatives, by the identity theorem. The expansion
  of 1.5 stays on the series domain: the identity theorem extends identities, not the convergence
  of a series. For example `(0, −2) ∈ appellDomain1` and `𝐅₁(1; 0, 1; 1; 0, −2) = 1/3`, while the
  expansion there is `∑ₙ (−2)ⁿ`, because `𝐅(1 + n, 0; 1 + n; 0) = 1/n!`.

*Needs:* 1.3–1.4, 1.6, 2.2, 3.1; SpecialFunctionsHypergeometric 1.4.

### 3.3 The system of `F₁`

For all parameters, on `appellDomain1`, written with the partial derivatives of the Conventions
(Matsumoto, Def. 3.5.1 and Table 3.1, pp. 85–86; Iwasaki et al., Prop. 9.1.2, p. 247, and
Cor. 9.1.3, pp. 248–249; DLMF 16.14.1):

```text
x(1 − x) ∂ₓ²F + y(1 − x) ∂ₓ∂ᵧF + (γ − (α + β + 1)x) ∂ₓF − β y ∂ᵧF − α β F = 0
y(1 − y) ∂ᵧ²F + x(1 − y) ∂ₓ∂ᵧF + (γ − (α + β′ + 1)y) ∂ᵧF − β′ x ∂ₓF − α β′ F = 0
(x − y) ∂ₓ∂ᵧF − β′ ∂ₓF + β ∂ᵧF = 0
```

for `F = 𝐅₁(α; β, β′; γ; ·, ·)` (`regularizedAppellF1_pde_fst`, `regularizedAppellF1_pde_snd`,
`regularizedAppellF1_pde_mixed`). Each equation is linear and homogeneous, so it holds for `F₁`
as well. The proof: on `appellBidisc`, the coefficient of `xᵐyⁿ` in the left side is a
combination of the coefficient recurrences of 1.1, for the third equation
`(n + 1)(β + m) c_{m,n+1} = (m + 1)(β′ + n) c_{m+1,n}`; on `appellDomain1`, the left side is
analytic and vanishes near the origin. The mixed derivatives `∂ₓ∂ᵧF = ∂ᵧ∂ₓF` are equal on the
domain, by analyticity. The third equation follows from the first two when `α + 1 − γ ≠ 0`, but
not in general (Matsumoto, Remark 3.5.5(1), p. 87, with the example `α = 1`, `β = 3`, `β′ = 4`,
`γ = 2`), so it is a separate target.

**Checks.**
- At the parameters and point of 1.1, in the classical form, `∂ₓF₁` is
  `0.08948 64331 171… + 0.01180 75608 174… i` and `∂ᵧF₁` is
  `0.11158 34575 754… + 0.01464 07495 265… i`, and the third equation holds; with `β` and `β′`
  exchanged in its last two terms, its left side would be
  `0.05026 74726 731… + 0.00661 20775 859… i`.

*Needs:* 1.1, 1.4, 3.1–3.2.

### 3.4 Transformations

- **The transformation under `(x, y) ↦ (x/(x − 1), y/(y − 1))`**, on `S = appellDomain1`
  (Matsumoto, Prop. 3.7.1(2), first formula, p. 90; DLMF 16.16.8, first equality):
  `𝐅₁(α; β, β′; γ; x, y) = (1 − x)^{−β} (1 − y)^{−β′} 𝐅₁(γ − α; β, β′; γ; x/(x − 1), y/(y − 1))`.
  The map `(x, y) ↦ (x/(x − 1), y/(y − 1))` maps `appellDomain1` to itself, since
  `1 − x/(x − 1) = 1/(1 − x)`. Proof: Euler's integral with `u ↦ 1 − u`, in the region
  `Re γ > Re α > 0`, which is symmetric under `α ↔ γ − α`, then holomorphy in the parameters (3.2)
  (`regularizedAppellF1_transform_16_16_8`).
- **The transformation under `(x, y) ↦ (x/(x − 1), (y − x)/(1 − x))`**, on
  `S = {(x, y) ∈ appellDomain1 | (1 − y)/(1 − x) ∈ slitPlane}` (Matsumoto, Prop. 3.7.1(2), second
  formula with `i = 1`, p. 90; DLMF 16.16.8, second equality):
  `𝐅₁(α; β, β′; γ; x, y) = (1 − x)^{−α} 𝐅₁(α; γ − β − β′, β′; γ; x/(x − 1), (y − x)/(1 − x))`.
  Proof: for real `x`, `y` in `(−½, ½)`, the substitution `u = (1 − t)/(1 − tx)` in Euler's
  integral is a real change of variables on `[0, 1]`, and it gives

```text
𝐅₁(α; β, β′; γ; x, y)
    = (1 − x)^{γ−α−β} (1 − y)^{−β′} 𝐅₁(γ − α; γ − β − β′, β′; γ; x, (x − y)/(1 − y)),
```

  there; both sides are analytic near the origin, so fixing real `y` and applying the identity
  theorem in `x`, then fixing `x` and applying it in `y`, extends this to a neighbourhood of the
  origin in `ℂ × ℂ`. The first transformation applied to the right side gives the second
  (`regularizedAppellF1_transform_16_16_8_snd`).

**Checks.** At the parameters and point of 1.1, in the classical form, all three sides are
`0.98534 81954 425… + 0.02596 17300 552… i`.

*Needs:* 3.1–3.2.

### 3.5 The reduction at `γ = β + β′`

On `S = {(x, y) ∈ appellDomain1 | (1 − x)/(1 − y) ∈ slitPlane}` (Matsumoto, §3.12, first
formula, p. 97; DLMF 16.16.1):
`𝐅₁(α; β, β′; β + β′; x, y) = (1 − y)^{−α} 𝐅(α, β; β + β′; (x − y)/(1 − y))`. Proof: the second
transformation of 3.4 for `𝐅₁(α; β′, β; β + β′; y, x)`, whose second parameter `γ − β − β′` is
then `0`, with the symmetry and the reduction of 3.2 (`regularizedAppellF1_reduction_16_16_1`).

**Checks.** At the parameters and point of 1.1 with `γ = β + β′`, in the classical form, both
sides are `0.97998 88891 556… + 0.03563 40282 590… i`.

*Needs:* 3.2, 3.4.

### Examples

- `𝐅₁(α; β, β′; γ; x, x)` is `𝐅(α, β + β′; γ; x)` on `{(x, x) | 1 − x ∈ slitPlane}`, by the
  coefficient identity `∑_{m+n=k} (β)ₘ (β′)ₙ/(m! n!) = (β + β′)ₖ/k!` and the identity theorem in
  one variable.

### Dependencies

Layers 1–2 and SpecialFunctionsHypergeometric 1.2–1.4.

## Layer 4: the function `F₃`

### 4.1 Euler's integral over a triangle and the principal branch

The regularized Euler integral over the triangle `Δ`, with principal powers (Matsumoto,
Thm. 3.4.1, the integral of `F_B` over `Δ_m`, p. 82; DLMF 16.15.3):

```text
E₃ = (Γ(β) Γ(β′) Γ(γ − β − β′))⁻¹
       ∬_Δ u^{β−1} v^{β′−1} (1 − u − v)^{γ−β−β′−1} (1 − ux)^{−α} (1 − vy)^{−α′} du dv
```

Targets, as in 3.1–3.2:
- **holomorphy** of `E₃` on `appellDomain1` in the region `Re β > 0`, `Re β′ > 0`,
  `Re(γ − β − β′) > 0`, jointly in the parameters;
- **agreement with the series** on `appellSimplex` in that region, by termwise integration and
  the Dirichlet integral over `Δ`, reduced to two Beta integrals by `v = (1 − u) t`;
- **existence** (`exists_isAppellContinuation_F3`) by the contiguous relations of 1.6;
- **the Euler integral**: `𝐅₃ = E₃` on `appellDomain1` in that region
  (`regularizedAppellF3_eq_eulerIntegral`), and the classical form;
- **the properties on `appellDomain1`**: agreement with the series on `appellBidisc`, joint
  holomorphy on `ℂ⁵ × appellDomain1`, the contiguous relations, the symmetries, conjugation, the
  values on the axes, the reduction `𝐅₃(α, α′; β, 0; γ; x, y) = 𝐅(α, β; γ; x)` and the derivatives,
  as for `𝐅₁` in 3.2.

**Checks.**
- `F₃(0.3, 0.55; 0.45, 0.7; 1.6; 2 + i, −3) = 0.69879 3462… + 0.17627 9240… i`.

*Needs:* 1.1–1.4, 1.6, 2.1–2.2; SpecialFunctionsHypergeometric 1.2–1.4; Mathlib
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

### 4.2 The system of `F₃`

For all parameters, on `appellDomain1` (Matsumoto, Table 3.1, p. 86; DLMF 16.14.3):

```text
x(1 − x) ∂ₓ²F + y ∂ₓ∂ᵧF + (γ − (α + β + 1)x) ∂ₓF − α β F = 0
y(1 − y) ∂ᵧ²F + x ∂ₓ∂ᵧF + (γ − (α′ + β′ + 1)y) ∂ᵧF − α′ β′ F = 0
```

for `F = 𝐅₃(α, α′; β, β′; γ; ·, ·)` (`regularizedAppellF3_pde_fst`,
`regularizedAppellF3_pde_snd`), proved as in 3.3.

*Needs:* 1.1, 1.4, 4.1.

### 4.3 Reductions to `F₁` and to the Gauss function

- **The reduction at `α′ = γ − α`**, on `S = appellDomain1` (DLMF 16.16.4):
  `𝐅₃(α, γ − α; β, β′; γ; x, y) = (1 − y)^{−β′} 𝐅₁(α; β, β′; γ; x, y/(y − 1))`; the map
  `y ↦ y/(y − 1)` preserves `1 − y ∈ slitPlane`. Proof: comparison of Taylor coefficients at the
  origin; the coefficient of `xᵐyⁿ` on the right is a finite sum, which the Chu–Vandermonde sum
  `₂F₁(−n, α + m; γ + m; 1) = (γ − α)ₙ/(γ + m)ₙ` evaluates to the coefficient on the left
  (`regularizedAppellF3_reduction_16_16_4`, and `appellF3_reduction_16_16_4` in the classical
  form). *Needs:* 1.1, 3.2, 4.1; SpecialFunctionsHypergeometric 4.2.
- **The reduction at `α′ = γ − α`, `β′ = γ − β`**, on
  `S = {(x, y) ∈ appellDomain1 | (1 − x)(1 − y) ∈ slitPlane}` (Matsumoto, §3.12, fourth formula,
  p. 97; DLMF 16.16.5):
  `𝐅₃(α, γ − α; β, γ − β; γ; x, y) = (1 − y)^{α+β−γ} 𝐅(α, β; γ; x + y − xy)`. Proof: the first
  reduction with `β′ = γ − β`, then 3.5 at `(x, y/(y − 1))`, since `(x − Y)/(1 − Y) = x + y − xy`
  for `Y = y/(y − 1)` (`regularizedAppellF3_reduction_16_16_5`). *Needs:* 3.5 and the first
  reduction.

**Checks.** At the parameters and point of 1.1, in the classical form:
- the first reduction: both sides are `0.89054 88561 402… + 0.07020 68341 135… i`;
- the second: `0.81579 75249 439… + 0.10017 75069 759… i`.

*Needs:* those of the two items, together: 1.1, 3.2, 3.5, 4.1; SpecialFunctionsHypergeometric 4.2.

### Examples

- The second reduction at `α = γ`:
  `𝐅₃(γ, 0; β, γ − β; γ; x, y) = (1 − y)^{β} 𝐅(γ, β; γ; x + y − xy)`, and both sides are
  `Γ(γ)⁻¹ (1 − x)^{−β}` near the origin.

### Dependencies

Layers 1–3 and SpecialFunctionsHypergeometric 1.2–1.4 and 4.2.

## Layer 5: the function `F₂`

### 5.1 Euler's double integral and the principal branch

The regularized Euler integral over the square, with principal powers (Matsumoto, Thm. 3.4.1,
first representation of `F_A`, p. 82; DLMF 16.15.2):

```text
E₂ = (Γ(β) Γ(β′) Γ(γ − β) Γ(γ′ − β′))⁻¹
       ∫₀¹ ∫₀¹ u^{β−1} v^{β′−1} (1 − u)^{γ−β−1} (1 − v)^{γ′−β′−1} (1 − ux − vy)^{−α} du dv
```

Targets, as in 3.1–3.2:
- **holomorphy** of `E₂` on `appellDomain2` in the region `Re γ > Re β > 0`,
  `Re γ′ > Re β′ > 0`, jointly in the parameters;
- **agreement with the series** on `appellSimplex` in that region, by termwise integration of the
  binomial series and two Beta integrals;
- **existence** (`exists_isAppellContinuation_F2`) by the contiguous relations of 1.6;
- **the Euler integral**: `𝐅₂ = E₂` on `appellDomain2` in that region
  (`regularizedAppellF2_eq_eulerIntegral`), and the classical form;
- **the properties on `appellDomain2`**: agreement with the series on `appellSimplex`, joint
  holomorphy on `ℂ⁵ × appellDomain2`, the contiguous relations, the symmetry, conjugation, the
  values on the axes and the derivatives, as for `𝐅₁` in 3.2.

**Checks.**
- `F₂(0.3; 0.45, 0.7; 1.6, 1.25; 0.5 + 0.5i, −0.8) = 0.92623 8137… + 0.03619 8509… i`, where
  `|x| + |y| > 1`; the value at `(0.5 − 0.5i, −0.8)` is the conjugate.

*Needs:* 1.1–1.4, 1.6, 2.1–2.2; SpecialFunctionsHypergeometric 1.2–1.4; Mathlib
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `MeasureTheory.integral_prod`.

### 5.2 The system of `F₂`

For all parameters, on `appellDomain2` (Matsumoto, Table 3.1, p. 86; DLMF 16.14.2):

```text
x(1 − x) ∂ₓ²F − x y ∂ₓ∂ᵧF + (γ − (α + β + 1)x) ∂ₓF − β y ∂ᵧF − α β F = 0
y(1 − y) ∂ᵧ²F − x y ∂ₓ∂ᵧF + (γ′ − (α + β′ + 1)y) ∂ᵧF − β′ x ∂ₓF − α β′ F = 0
```

for `F = 𝐅₂(α; β, β′; γ, γ′; ·, ·)` (`regularizedAppellF2_pde_fst`,
`regularizedAppellF2_pde_snd`), proved as in 3.3.

**Checks.**
- `𝐅₂(α; β, 0; γ, γ′; x, y) = Γ(γ′)⁻¹ 𝐅(α, β; γ; x)` on `appellDomain2`, and the first equation at
  `β′ = 0` is the hypergeometric equation of `𝐅(α, β; γ; x)` (DLMF 15.10.1).

*Needs:* 1.1, 1.4, 5.1.

### 5.3 The transformation under `(x, y) ↦ (x/(x − 1), y/(1 − x))`

On `S = {(x, y) ∈ appellDomain2 | (x/(x − 1), y/(1 − x)) ∈ appellDomain2}` (Matsumoto,
Prop. 3.7.1(1) with `I = {1}`, p. 90; DLMF 16.16.9):
`𝐅₂(α; β, β′; γ, γ′; x, y) = (1 − x)^{−α} 𝐅₂(α; γ − β, β′; γ, γ′; x/(x − 1), y/(1 − x))`.
Proof: Euler's integral of 5.1 with `u ↦ 1 − u`, since
`1 − (1 − u)x − vy = (1 − x)(1 − u x/(x − 1) − v y/(1 − x))`
(`regularizedAppellF2_transform_16_16_9`).

**Checks.** At the parameters and point of 1.1 and `γ′ = 1.25`, in the classical form, both sides
are `0.97539 09108 742… + 0.02959 42420 817… i`.

*Needs:* 5.1.

### 5.4 Reductions

- **The reduction at `γ′ = β′`**, on
  `S = {(x, y) ∈ appellDomain2 | (1 − x − y)/(1 − y) ∈ slitPlane}` (Matsumoto, §3.12, second
  formula, with the roles of the variables exchanged, p. 97; DLMF 16.16.2):
  `𝐅₂(α; β, β′; γ, β′; x, y) = Γ(β′)⁻¹ (1 − y)^{−α} 𝐅(α, β; γ; x/(1 − y))`. Proof: summing over `n`
  first, `∑ₙ (α + m)ₙ yⁿ/n! = (1 − y)^{−α−m}` (the binomial series), then the identity theorem
  (`regularizedAppellF2_reduction_16_16_2`). *Needs:* 1.1, 5.1; SpecialFunctionsHypergeometric
  1.3–1.4; Tau Ceti `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`.
- **The reduction at `γ′ = α`**, on
  `S = {(x, y) ∈ appellDomain2 | (x, x/(1 − y)) ∈ appellDomain1}` (DLMF 16.16.3):
  `𝐅₂(α; β, β′; γ, α; x, y) = Γ(α)⁻¹ (1 − y)^{−β′} 𝐅₁(β; α − β′, β′; γ; x, x/(1 − y))`. Proof: the
  expansion `∑ₙ (β′)ₙ yⁿ/n! · F(α + n, β; γ; x)`, Euler's integral of each fibre in the region
  `Re γ > Re β > 0`, the binomial series under the integral, and
  `1 − ux − y = (1 − y)(1 − ux/(1 − y))`, which gives Euler's integral of 3.1 for the right side
  (`regularizedAppellF2_reduction_16_16_3`). *Needs:* 1.5, 3.1–3.2, 5.1;
  SpecialFunctionsHypergeometric 1.2; Tau Ceti
  `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`.
- **The reduction at `γ = γ′ = α`**, on
  `S = {(x, y) ∈ appellDomain2 | 1 − xy/((1 − x)(1 − y)) ∈ slitPlane}` (Matsumoto, §3.12, third
  formula, p. 97):
  `𝐅₂(α; β, β′; α, α; x, y) = Γ(α)⁻¹ (1 − x)^{−β} (1 − y)^{−β′} 𝐅(β, β′; α; xy/((1 − x)(1 − y)))`.
  Proof: the reduction at `γ′ = α` with `γ = α` gives `𝐅₁(β; α − β′, β′; α; x, x/(1 − y))`, whose
  bottom parameter is the sum of its two middle ones, so 3.5 applies; with `Y = x/(1 − y)` it gives
  `𝐅(β, α − β′; α; −xy/(1 − x − y))`, and Pfaff's transformation turns this into
  `𝐅(β, β′; α; xy/((1 − x)(1 − y)))`; the powers combine near the origin, and the identity theorem
  extends the identity (`regularizedAppellF2_reduction_bottoms_eq_a`). *Needs:* 3.5, 5.1 and the
  previous item; SpecialFunctionsHypergeometric 5.1.

**Checks.** At the parameters and point of 1.1, with `γ′` as each reduction requires, in the
classical form:
- the reduction at `γ′ = β′`: both sides are `0.94433 64431 224… + 0.04247 13862 935… i`;
- the reduction at `γ′ = α`: `0.85292 70229 482… + 0.07865 82409 829… i`;
- the reduction at `γ = γ′ = α`, with `α = 1.25` and `β, β′` as in 1.1:
  `0.91461 37292 184… + 0.12609 69866 502… i`.

*Needs:* those of the three items, together: 1.1, 1.5, 3.1–3.2, 3.5, 5.1;
SpecialFunctionsHypergeometric 1.2–1.4 and 5.1; Tau Ceti
`TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`.

### Examples

- The reduction at `γ = γ′ = α` at `y = 0` is the value on the axis of 1.3,
  `𝐅₂(α; β, β′; α, α; x, 0) = Γ(α)⁻¹ 𝐅(α, β; α; x) = Γ(α)⁻² (1 − x)^{−β}`.

### Dependencies

Layers 1–3 and SpecialFunctionsHypergeometric 1.2–1.4 and 5.1.

## Layer 6: the function `F₄`

The identities of 6.2 and 6.3 are stated on the polydisc
`appellF4Polydisc = {(x, y) | ‖x‖ < 1/5 ∧ ‖y‖ < 1/5}`, on which `(x(1 − y), y(1 − x))` lies in
`appellF4Domain`, since `2√(0.2 · 1.2) < 1`, and every other argument lies in the series domain
of its function.

### 6.1 The system of `F₄`

For all parameters, on `appellF4Domain` (Matsumoto, Table 3.1, p. 86; DLMF 16.14.4):

```text
x(1 − x) ∂ₓ²F − 2xy ∂ₓ∂ᵧF − y² ∂ᵧ²F + (γ − (α + β + 1)x) ∂ₓF − (α + β + 1) y ∂ᵧF − α β F = 0
y(1 − y) ∂ᵧ²F − 2xy ∂ₓ∂ᵧF − x² ∂ₓ²F + (γ′ − (α + β + 1)y) ∂ᵧF − (α + β + 1) x ∂ₓF − α β F = 0
```

for `F = 𝐅₄(α, β; γ, γ′; ·, ·)` (`regularizedAppellF4_pde_fst`, `regularizedAppellF4_pde_snd`),
from the coefficient recurrences of 1.1.

*Needs:* 1.1–1.4.

### 6.2 The Burchnall–Chaundy expansion and its cases

- **The Burchnall–Chaundy expansion** in regularized form, for all parameters, on
  `appellF4Polydisc` (DLMF 16.16.7, which cites Burchnall and Chaundy (1940, 1941)):

```text
𝐅₄(α, β; γ, γ′; x(1 − y), y(1 − x))
    = ∑ₖ (α)ₖ (β)ₖ (α + β − γ − γ′ + 1)ₖ / k! · xᵏ yᵏ
          · 𝐅(α + k, β + k; γ + k; x) 𝐅(α + k, β + k; γ′ + k; y)
```

  as `HasSum` over `ℕ` (`hasSum_regularizedAppellF4_burchnallChaundy`). Proof: both sides are
  analytic on the polydisc, and the target includes the equality of their coefficients of
  `x^M y^N`: for all `M, N ≥ 0` and all parameters, with `δ = α + β − γ − γ′ + 1`,

```text
∑_{m ≤ M, n ≤ N} (−1)^{M−m+N−n} C(n, M − m) C(m, N − n)
        · (α)_{m+n} (β)_{m+n} / (Γ(γ + m) Γ(γ′ + n) m! n!)
    = ∑_{k ≤ min(M, N)} (α)ₖ (β)ₖ (δ)ₖ / k!
        · (α + k)_{M−k} (β + k)_{M−k} / (Γ(γ + M) (M − k)!)
        · (α + k)_{N−k} (β + k)_{N−k} / (Γ(γ′ + N) (N − k)!),
```

  with `C(n, j) = 0` for `j > n`; the left side is the coefficient of
  `𝐅₄(α, β; γ, γ′; x(1 − y), y(1 − x))`, from `xᵐ(1 − x)ⁿ yⁿ(1 − y)ᵐ`. Both sides are entire in
  the parameters, so it suffices to prove the identity when no bottom parameter is a pole. For
  `M ≤ N` (the other case by the symmetry of 1.3), the inner sums of the left side along
  `m + n` fixed are Chu–Vandermonde sums `(s + t)_j = ∑ C(j, i) (s)ᵢ (t)_{j−i}`, which leave a
  single sum over `t ≤ M`; up to a factor independent of `t`, that sum is the coefficient of `z^M`
  in `𝐅(α + N, β + N; N − M + 1; z) (1 − z)^{γ+γ′+M+N−2}`. Euler's transformation
  `𝐅(a, b; c; z) = (1 − z)^{c−a−b} 𝐅(c − a, c − b; c; z)` writes this product as
  `𝐅(1 − α − M, 1 − β − M; N − M + 1; z) (1 − z)^{−δ}`, and its coefficient of `z^M`, with
  `(1 − α − M)_{M−k} = (−1)^{M−k} (α + k)_{M−k}` and the same for `β`, is the right side.
- **The case `γ′ = α + β − γ + 1`**, on `appellF4Polydisc` (Matsumoto, §3.12, fifth formula,
  p. 97; DLMF 16.16.6):
  `𝐅₄(α, β; γ, α + β − γ + 1; x(1 − y), y(1 − x)) = 𝐅(α, β; γ; x) 𝐅(α, β; α + β − γ + 1; y)`, the
  case `δ = 0` of the expansion, where `(0)ₖ = 0` for `k ≥ 1`
  (`regularizedAppellF4_reduction_16_16_6`).
- **The case `γ′ = β`**, on `appellF4Polydisc` (DLMF 16.16.5_5):

```text
𝐅₄(α, β; γ, β; x(1 − y), y(1 − x))
    = Γ(β)⁻¹ (1 − x)^{−α} (1 − y)^{−α} 𝐅₁(α; γ − β, α − γ + 1; γ; x/(x − 1), xy/((1 − x)(1 − y))).
```

  Proof: the expansion at `γ′ = β`, where `𝐅(α + k, β + k; β + k; y) = Γ(β + k)⁻¹ (1 − y)^{−α−k}`;
  then Pfaff's transformation on each `𝐅(α + k, β + k; γ + k; x)`, and the expansion of `𝐅₁` in
  its second variable (1.5) (`regularizedAppellF4_reduction_16_16_5_5`).

**Checks.** At `α = 0.3`, `β = 0.45`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.1 + 0.05i`,
`y = −0.1 + 0.05i`, a point of `appellF4Polydisc` where `√|x(1 − y)| + √|y(1 − x)| = 0.66833…`,
in the classical form:
- the Burchnall–Chaundy expansion: both sides are `0.99900 88426 0846… + 0.00959 66916 4714… i`;
- the case `γ′ = α + β − γ + 1`: `0.92311 26866 0964… + 0.04292 54853 6748… i`;
- the case `γ′ = β`: `0.98044 70812 4808… + 0.01783 68312 0938… i`.
- The coefficient identity: at `M, N ≤ 5`, with `(α, β, γ, γ′)` equal to
  `(0.3, 0.85, 1.6, 1.25)` and to `(0.3, 0.45, −1, 1.25)`, the two sides agree to 45 digits.

*Needs:* 1.1–1.5, 3.2, 6.1; SpecialFunctionsHypergeometric 1.3, 4.2 and 5.1.

### 6.3 The Euler integral of `F₄`

On `appellF4Polydisc`, for `Re γ > Re α > 0` and `Re γ′ > Re β > 0` (Matsumoto, pp. 83–84, from
Burchnall and Chaundy (1940, (68)); DLMF 16.15.4):

```text
𝐅₄(α, β; γ, γ′; x(1 − y), y(1 − x)) = (Γ(α) Γ(β) Γ(γ − α) Γ(γ′ − β))⁻¹
    ∫₀¹ ∫₀¹ u^{α−1} v^{β−1} (1 − u)^{γ−α−1} (1 − v)^{γ′−β−1}
        (1 − ux)^{α+1−γ−γ′} (1 − vy)^{β+1−γ−γ′} (1 − ux − vy)^{γ+γ′−α−β−1} du dv
```

(`regularizedAppellF4_eq_eulerIntegral`). The powers are evaluated where their bases have positive
real part. Proof: with `R = ux · vy/((1 − ux)(1 − vy))` and `δ = α + β − γ − γ′ + 1`,
`1 − ux − vy = (1 − ux)(1 − vy)(1 − R)`, so the last three factors of the integrand are
`(1 − ux)^{−β} (1 − vy)^{−α} (1 − R)^{−δ}`, and `|R| < ¼` on the square for `(x, y)` in the
polydisc. Expanding `(1 − R)^{−δ}` in its binomial series and integrating term by term, the `k`-th
term is a product of two Euler integrals of SpecialFunctionsHypergeometric 1.1, and it is
`(δ)ₖ/k!` times `(α)ₖ (β)ₖ xᵏ yᵏ 𝐅(α + k, β + k; γ + k; x) 𝐅(α + k, β + k; γ′ + k; y)`: for
the factor in `u`, `∫₀¹ u^{α+k−1} (1 − u)^{γ−α−1} (1 − ux)^{−β−k} du` is
`Γ(α + k) Γ(γ − α) 𝐅(β + k, α + k; γ + k; x)`. So the right side is the Burchnall–Chaundy series
of 6.2.

**Checks.**
- At `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, `x = 0.15 + 0.05i`, `y = −0.1 + 0.12i`, both
  sides, in the classical form, are `1.00621 43714 857… + 0.03076 28754 950… i`.

*Needs:* 6.2; SpecialFunctionsHypergeometric 1.1–1.2; Mathlib
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `MeasureTheory.integral_prod`.

### 6.4 The fibre sum and the connection at infinity

The fibre sum

```text
Φ(α, β; γ, γ′; x, y) = ∑ₘ (α)ₘ (β)ₘ / ((γ)ₘ m!) xᵐ F(α + m, β + m; γ′; y)
```

with the Gauss function `F` of SpecialFunctionsHypergeometric on `1 − y ∈ slitPlane`
(`appellF4Fibre`). On `appellF4Domain` it is the expansion of 1.5 in the variable `x`. For large
`y` it is this roadmap's reading of the left side of the connection formula at infinity (DLMF
16.16.10), which DLMF writes as `F₄` without fixing a branch. Targets, for
`γ, γ′ ∉ {0, −1, −2, …}`:
- **on the series domain**: `HasSum` of the fibre sum to `F₄(α, β; γ, γ′; x, y)` on
  `appellF4Domain` (`hasSum_appellF4Fibre`);
- **for large `y`**, on `U = {(x, y) | −y ∈ slitPlane ∧ √‖x‖ + 1 < √‖y‖}`: the fibre sum converges
  absolutely and is analytic in `(x, y)` (`analyticOnNhd_appellF4Fibre`), for all `α`, `β`;
- **the bridge**: the fibre sum converges locally uniformly, and so is analytic, on an open set `V`
  that contains the segment `{(0, −t) | 0 ≤ t ≤ 2}` (`exists_isOpen_analyticOnNhd_appellF4Fibre`).
  `V` meets `appellF4Domain` near `(0, 0)`, where the fibre sum is `F₄`, and meets `U` near
  `(0, −2)`; `U` is connected, since its fibre over each `y` is a disk about `x = 0` and its set of
  `y`, `{|y| > 1} \ [1, ∞)`, is connected. So on `U` the fibre sum is the analytic continuation of
  the series `F₄` from the origin along that segment, and the connection formula is a statement
  about a branch of the Appell germ. Proof: for `y` in a compact neighbourhood `N` of `[−2, 0]` in
  the cut plane, Pfaff's transformation (SpecialFunctionsHypergeometric 5.1) writes
  `F(α + m, β + m; γ′; y) = (1 − y)^{−α−m} F(α + m, γ′ − β − m; γ′; y/(y − 1))` with
  `|y/(y − 1)| ≤ r < 1` on `N`, and bounding the coefficients of the last series by those of
  `(1 − √r)^{−2(|α| + |γ′ − β| + m + 1)}` gives `|F(α + m, β + m; γ′; y)| ≤ C ρᵐ` on `N`, with `C`,
  `ρ` independent of `m`; so the fibre sum converges uniformly for `‖x‖ < 1/(2ρ)` and `y ∈ N`;
- **the connection formula**, for `α − β ∉ ℤ` and `(x, y) ∈ U` (DLMF 16.16.10):

```text
Φ(α, β; γ, γ′; x, y)
    = Γ(γ′) Γ(β − α)/(Γ(γ′ − α) Γ(β)) (−y)^{−α} F₄(α, α − γ′ + 1; γ, α − β + 1; x/y, 1/y)
    + Γ(γ′) Γ(α − β)/(Γ(γ′ − β) Γ(α)) (−y)^{−β} F₄(β, β − γ′ + 1; γ, β − α + 1; x/y, 1/y)
```

  with the reciprocal Gamma factors as in the Conventions and `F₄` the series, since
  `(x/y, 1/y) ∈ appellF4Domain` (`appellF4Fibre_connection_infty`).

The proof applies the connection formula of the Gauss function at infinity
(SpecialFunctionsHypergeometric 5.1) to each fibre, with `(−y)^{−α−m} = (−y)^{−α} (−y)^{−m}`,
`Γ(β + m) = Γ(β) (β)ₘ` and the identity of entire functions
`1/Γ(z − m) = (−1)ᵐ (1 − z)ₘ/Γ(z)` at `z = γ′ − α`, which holds for every `z` with Mathlib's `Γ`
(the quotient `Γ(z)/Γ(z − m)` is not used, since it fails at the poles: at `z = 0`, `m = 1` it is
`Γ(0)/Γ(−1) = 0`, not `−1`). It rearranges the absolutely convergent double series into
`F₄(α, α − γ′ + 1; γ, α − β + 1; x/y, 1/y)`, and likewise for `β`.

The convergence on `U` needs a bound on the fibres for all `α`, `β`, including `α − β ∈ ℤ`.
The connection formula at infinity of SpecialFunctionsHypergeometric 5.1, in the form that
carries the factor `sin(π(b − a))/π` and holds for all parameters, writes
`F(α + m, β + m; γ′; y)` through `(−y)^{−α−m} F(α + m, α + m − γ′ + 1; α − β + 1; 1/y)` and the
term with `α` and `β` exchanged. The coefficients of the last series satisfy
`|(α + m)ₙ (α + m − γ′ + 1)ₙ/((α − β + 1)ₙ n!)| ≤ C (1 + m + n)^K ((m + n)!/(m! n!))²`, and
`∑ₙ ((m + n)!/(m! n!))² tⁿ ≤ (1 − √t)^{−2m−2}` for `0 ≤ t < 1`, since the left side is the
diagonal part of the square of `∑ₙ ((m + n)!/(m! n!)) √tⁿ = (1 − √t)^{−m−1}`; the factor
`(1 + m + n)^K` costs at most `C (1 + m)^K (1 − √t)^{−K}`, by applying `(s d/ds)^K` to one of the
two factors at `s = √t`. At `t = 1/|y|`,
`|y|^{−m} (1 − |y|^{−½})^{−2m} = (√|y| − 1)^{−2m}`. This gives, for `|y| ≥ R > 1`,
`−y ∈ slitPlane`,
`|F(α + m, β + m; γ′; y)| ≤ C (1 + m)^K (√|y| − 1)^{−2m} (|y|^{−Re α} + |y|^{−Re β})` with `C`,
`K` locally uniform in `(α, β)` where `β − α` stays at distance at least `¼` from `ℤ`, since
there the reciprocal of `sin(π(β − α))` is bounded. The factor `(√|y| − 1)^{−2m}` cannot be
replaced by `|y|^{−m}`: at `α = 0.3`, `β = 0.85`, `γ′ = 1.25`, `y = 5 + 0.1i`, the product
`|F(α + m, β + m; γ′; y)| |y|^m` is about `3.6·10³`, `3.0·10⁸`, `3.5·10¹⁸`, `8.1·10³⁸` at
`m = 10, 20, 40, 80`, while `|F(α + m, β + m; γ′; y)| (√|y| − 1)^{2m}` is about `0.025`,
`0.015`, `0.0089`, `0.0053`. At any other `(α, β₀)`, with `d = dist(β₀ − α, ℤ) < ¼` and `n` the
nearest integer, every `β` on the circle `|β − β₀| = ½` has `β − α` at distance at least
`½ − d > ¼` from `n` and at least `½ − d > ¼` from every other integer. The function
`β ↦ F(α + m, β + m; γ′; y)` is entire, so the maximum modulus principle on that circle bounds it
at `β₀` by the bound on the circle, where `|y|^{−Re β} ≤ |y|^{½} |y|^{−Re β₀}`: it is
`|F(α + m, β₀ + m; γ′; y)| ≤ C (1 + m)^K (√|y| − 1)^{−2m} |y|^{½} (|y|^{−Re α} + |y|^{−Re β₀})`,
with the extra factor `|y|^{½}` independent of `m` and `C`, `K` again locally uniform. With
`(m!)⁻¹ |(α)ₘ (β)ₘ/(γ)ₘ| ≤ C′ (1 + m)^{K′}` and `√‖x‖ + 1 < √‖y‖`, so `‖x‖ < (√‖y‖ − 1)²`, the
fibre sum converges absolutely and locally uniformly on `U`; this is why `U` has its shape.

**Checks.** At `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`, both sides of the connection formula
are
- `0.63974 60136 565… + 0.02306 13488 454… i` at `(0.3, −6 + i)`;
- `0.64821 87377 054… + 0.42058 10020 681… i` at `(0.1 + 0.2i, 4 + 3i)`;
- `0.58084 02439 711… − 0.02930 82269 601… i` at `(−0.5, −9 − 2i)`.

*Needs:* 1.1–1.5; SpecialFunctionsHypergeometric 1.2–1.4 and 5.1.

### Examples

- `F₄(α, β; γ, γ′; x, y)` at the parameters of 6.4 and `(x, y) = (0.1 + 0.05i, 0.2 − 0.1i)` is
  `1.07351 32898 7… − 0.01857 98829 352… i`, and the fibre sum at that point has the same value.

### Dependencies

Layers 1 and 3 and SpecialFunctionsHypergeometric 1.1–1.4, 4.2 and 5.1.

## Layer 7: Horn's `G₂` and `G₃`

### 7.1 The series and their convergence

The series

```text
G₂(α, α′; β, β′; x, y) = ∑_{m,n} (α)ₘ (α′)ₙ pochZ(β, n − m) pochZ(β′, m − n) xᵐ yⁿ/(m! n!)
G₃(α, α′; x, y)        = ∑_{m,n} pochZ(α, 2n − m) pochZ(α′, 2m − n) xᵐ yⁿ/(m! n!)
```

(Aomoto–Kita, §3.1.9, p. 108, for `G₃` and Horn's list; DLMF 16.14.5–16.14.6), with
`Γ(α + m)/Γ(α) = (α)ₘ` in `G₂`, for `β, β′ ∉ ℤ` (`G₂`) and `α, α′ ∉ ℤ` (`G₃`). For negative
`k`, `pochZ(a, k) = (−1)^{|k|}/(1 − a)_{|k|}` (Aomoto–Kita, Remark 3.1, (3.3), p. 104;
Rao–Lakshminarayanan (7.17)–(7.18), p. 7-5). Targets:
- **convergence** (`summable_hornG2`, `summable_hornG3`): absolute on `appellBidisc` for `G₂`,
  from `|pochZ(β, k) pochZ(β′, −k)| ≤ C (1 + |k|)^K`, which follows from the reflection formula;
  and on `hornG3Domain` for `G₃`, from
  `|pochZ(α, 2n − m) pochZ(α′, 2m − n)| ≤ C (1 + m + n)^K 4^{m+n} (m + n)!`, so that the series is
  dominated by `∑ (m + n)!/(m! n!) (4|x|)ᵐ (4|y|)ⁿ`. The bound follows from
  `|pochZ(α, k)| ≤ C (1 + |k|)^K |k|!^{±1}`, with the sign of `k`, from `a! b! ≤ (a + b)!` and from
  `(a + b)! ≤ 2^{a+b} a! b!`;
- **analyticity** on these domains.

**Checks.**
- `G₂(0.3, 0.55; 0.45, 0.7; 0.3, −0.4 + 0.2i) = 1.28956 88302 38… − 0.34417 52507 33… i`.
- `G₃(0.3, 0.55; 0.1, 0.05 + 0.05i) = 0.86214 41053 566… − 0.03245 47033 319… i`.
- `G₂(α, 0; β, β′; x, y) = F(α, β′; 1 − β; −x)` for `‖x‖ < 1`, `‖y‖ < 1`, since
  `pochZ(β, −m) = (−1)ᵐ/(1 − β)ₘ`; at `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `x = 0.3` both sides are
  `0.90520 28618 48…`. Exchanging `n − m` and `m − n` in the definition would give
  `F(α, β; 1 − β′; −x) = 0.88863 92498 57…` instead.
- The coefficient of `x` in `G₂` is `α β′/(β − 1)`, and the coefficient of `y` in `G₃` is
  `α (α + 1)/(α′ − 1)`.
- `G₃(α, α′; 0, y) = ∑ₙ (α)_{2n} (−1)ⁿ yⁿ/((1 − α′)ₙ n!)` for `‖y‖ < ¼`; at `α = 0.3`,
  `α′ = 0.55`, `y = 0.1` both sides are `0.93072 62972 35…`.
- The hypothesis `β ∉ ℤ` is needed: at `β = 1` the term `m = 1`, `n = 0` of `hornG2` is `0`,
  since `pochZ(1, −1) = Γ(0)/Γ(1) = 0` with Mathlib's `Γ`, where the series has a pole.

*Needs:* 1.2 (the summability lemmas); Mathlib `Complex.Gamma_mul_Gamma_one_sub`.

### 7.2 The systems of `G₂` and `G₃`

As identities of analytic functions on the domains of 7.1:

```text
ϑₓ (β + ϑᵧ − ϑₓ) G₂ = x (α + ϑₓ)(β′ + ϑₓ − ϑᵧ) G₂
ϑᵧ (β′ + ϑₓ − ϑᵧ) G₂ = y (α′ + ϑᵧ)(β + ϑᵧ − ϑₓ) G₂
ϑₓ (α + 2ϑᵧ − ϑₓ) G₃ = x (α′ + 2ϑₓ − ϑᵧ)(α′ + 2ϑₓ − ϑᵧ + 1) G₃
ϑᵧ (α′ + 2ϑₓ − ϑᵧ) G₃ = y (α + 2ϑᵧ − ϑₓ)(α + 2ϑᵧ − ϑₓ + 1) G₃
```

each a second-order equation (`hornG2_pde_fst`, `hornG2_pde_snd`, `hornG3_pde_fst`,
`hornG3_pde_snd`). DLMF §16.14(ii) says only that such series satisfy pairs of second-order
equations, and Matsumoto (p. 80) that Horn studied the systems of the series whose coefficient
ratios are rational of degree two; the systems are derived here. They are the coefficient
recurrences `(m + 1)(β + n − m − 1) c_{m+1,n} = (α + m)(β′ + m − n) c_{m,n}` of `G₂` and
`(m + 1)(α + 2n − m − 1) c_{m+1,n} = (α′ + 2m − n)(α′ + 2m − n + 1) c_{m,n}` of `G₃`, which follow
from `Γ(z + 1) = z Γ(z)`.

*Needs:* 1.4, 7.1.

### Examples

- `G₂(α, α′; β, β′; 0, 0) = 1` and `G₃(α, α′; 0, 0) = 1`, the term `m = n = 0`.

### Dependencies

Layer 1.

## Downstream consumers

- A roadmap for Carlson's symmetric integrals that identifies Carlson's `R_{−a}(𝐛; 𝐳)` with three
  variables and `z₃ = 1` with `F₁` consumes Layer 3.
- A roadmap for the Meijer `G`-function, whose double analogues are the Appell functions, consumes
  Layer 1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **The other Horn functions**: of the 24 double series that DLMF §16.14(ii) counts besides the
  four Appell functions, the 22 other than `G₂` and `G₃` (which Layer 7 owns), and the statement
  that the Appell functions are not products of two `₂F₁` in general.
- **Lauricella's functions** `F_A`, `F_B`, `F_C`, `F_D` in `m > 2` variables (Matsumoto, Def. 3.3.1,
  pp. 80–81; Iwasaki et al., §3.9.1), and their systems.
- **Rank, singular locus, local solutions and monodromy** of Appell's systems (Matsumoto,
  Thm. 3.5.4 and Table 3.3, p. 87, and §§3.6, 3.9–3.11), and the Pfaffian form of the systems.
- **Large-parameter asymptotics** of the Appell functions.
- **Other integral representations**: the Mellin–Barnes integrals (Matsumoto, Thm. 3.4.2, p. 84),
  the integrals over regularized cycles, Chaundy's integral of `F₄` over a curved region
  (Matsumoto, p. 83), the inverse Laplace transforms, and the convergent expansions for large `x`,
  large `y`, or both, other than the connection formula of 6.4.
- **Quadratic transformations** of Appell functions (Carlson 1976, as DLMF §16.16(ii) and
  Matsumoto, p. 91, cite it), and the further reduction formulas that DLMF and Matsumoto list.
- **A principal branch of `F₄`** on a domain of `ℂ × ℂ` beyond the series domain and the fibre sum
  of 6.4, and the continuation of `F₁`, `F₂`, `F₃` off their principal domains.
- **The generalized hypergeometric functions and the Meijer `G`-function**.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/GeneralizedHypergeometric/Appell/` provides source material for Layers 1–7: the four series
with their convergence and analyticity, the systems of 3.3 (first two equations), 4.2, 5.2 and 6.1,
Horn's `G₂` and `G₃` with their systems, the Euler integrals of 3.1, 4.1 and 5.1, the reductions
and transformations of 3.4–3.5, 4.3 and the first two items of 5.4, the Burchnall–Chaundy
expansion with its cases (6.2) and the Euler integral of `F₄` near the origin (6.3), by the routes
described there. It states the coupled series of 1.7 and the connection formula of 6.4 without
proof.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `GeneralizedHypergeometric/Appell/Basic/Series`, `Appell/SeriesAndDifferentialEquations`, `Appell/DiagonalReduction` |
| 2 | `GeneralizedHypergeometric/Appell/SeriesAndDifferentialEquations` (uniqueness of continuation) |
| 3–5 | `GeneralizedHypergeometric/Appell/Basic/EulerBranches`, `Appell/EulerIntegrals`, `Appell/TriangleDirichlet`, `Appell/GermTransformations` |
| 6 | `GeneralizedHypergeometric/Appell/ComposedF4`, `Appell/BurchnallChaundy`, `Appell/EulerF4`, `Hypergeometric/AppellF4`, `GeneralizedHypergeometric/AppellContinuation` |
| 7 | `GeneralizedHypergeometric/Appell/SeriesAndDifferentialEquations`, `Appell/HornDifferentialEquations` |

## References

- K. Aomoto and M. Kita, *Theory of Hypergeometric Functions*, Springer Monographs in Mathematics,
  Springer, 2011, §3.1 (pp. 103–108).
- K. Iwasaki, H. Kimura, S. Shimomura and M. Yoshida, *From Gauss to Painlevé: A Modern Theory of
  Special Functions*, Aspects of Mathematics E16, Vieweg, 1991, §3.9.1 (pp. 246–251).
- K. Matsumoto, Appell and Lauricella hypergeometric functions, Chapter 3 of T. H. Koornwinder and
  J. V. Stokman (eds.), *Encyclopedia of Special Functions: The Askey–Bateman Project*, Vol. II,
  *Multivariable Special Functions*, Cambridge University Press, 2020, §§3.2–3.5, 3.7, 3.8, 3.12.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 16
  (R. A. Askey and A. B. Olde Daalhuis), §§16.13–16.16, and Chapter 15 for the Gauss function,
  <https://dlmf.nist.gov/16>. Equation numbers refer to this release.
- K. Srinivasa Rao and V. Lakshminarayanan, *Generalized Hypergeometric Functions:
  Transformations and Group Theoretical Aspects*, IOP Publishing, 2018, Chapter 7, §§7.1–7.2.

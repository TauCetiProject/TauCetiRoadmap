# Roadmap: special functions on rank-one symmetric spaces: Jacobi functions and real hyperbolic space

**Summary.** This roadmap builds the harmonic analysis of the rank-one Riemannian symmetric spaces
through their special function, the Jacobi function `φ_λ^{(α,β)}(t)`, an even solution of a
second-order equation on `t > 0` with value `1` at `t = 0`, and carries it out in full on the real
hyperbolic space `ℍⁿ`. On the analytic side it develops the Jacobi function with its equation,
its elementary and polynomial cases and its identification with the matrix elements of `SU(1,1)`;
the second solution `Φ_λ` that behaves like `e^{(iλ−ρ)t}` at infinity, the Harish-Chandra
`c`-function and the connection formula `φ_λ = c(λ) Φ_λ + c(−λ) Φ_{−λ}`; the bounds
`|φ_λ| ≤ 1` for real `λ` and `|φ_λ(t)| ≤ e^{|Im λ| |t|}`, for real `α ≥ −1/2` and
`α + β + 1 ≥ 0`; Koornwinder's Laplace-type integral and
product formula; and the Jacobi transform `f ↦ ∫₀^∞ f φ_λ Δ dt` with its Paley–Wiener estimate,
its inversion formula `f = (2π)⁻¹ ∫₀^∞ f̃(λ) φ_λ |c(λ)|⁻² dλ` and Plancherel formula for real
`α > −1`, `|β| ≤ α + 1`, its unitary extension, and the discrete terms that appear when
`|β| > α + 1`. On the geometric side it builds the hyperboloid model of `ℍⁿ` with the Lorentz
group `SO₀(n, 1)`, the invariant volume in polar and horospherical coordinates, the
Laplace–Beltrami operator through the ambient wave operator, the boundary sphere with its plane
waves and Poisson integrals, and the Gel'fand pair `(SO₀(n, 1), SO(n))`. Its spherical functions
are the Jacobi functions with `(α, β) = (n/2 − 1, −1/2)`; every spherical function is one of them;
the spherical transform is a Jacobi transform and inherits inversion and Plancherel with the
constant `2^{n−1}/(2π ω_{n−1})`; it factors through the Abel transform (the horocycle integral);
and the Helgason–Fourier transform on `ℍⁿ` has an inversion formula, a Plancherel formula and
diagonalizes the Laplacian. The spherical principal series of `SO₀(n, 1)` on the sphere is the
representation-theoretic counterpart: its `SO(n)`-fixed matrix coefficient is the spherical
function.

The roadmap is a synthesis of several sources and follows none of them in its organization: it is
ordered by proof dependency, from the one-variable special function, through its transform, to the
geometry of `ℍⁿ` and the harmonic analysis on it. Its sources are Koornwinder's theory of Jacobi
functions as presented by Klimyk and Vilenkin and by Vilenkin and Klimyk, Wawrzyńczyk's harmonic
analysis on the Lobachevsky space and on symmetric spaces of noncompact type,
Heckman–Schlichtkrull's lectures on harmonic analysis on symmetric spaces, and the NIST Digital
Library of Mathematical Functions; each subsection cites several of them; see
[References](#references).

The roadmap builds on [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md),
which supplies the Gauss function on the cut plane with its elementary cases, linear and quadratic
transformations; the Jacobi function and its transform, which that roadmap leaves out, are owned
here. From SpecialFunctionsGroupModels (a roadmap of the same project) it takes Gel'fand
pairs with Gel'fand's criterion, spherical functions and their relation to unitary
representations, and multiplier representations, and it supplies the rank-one `c`-function and the
inversion of the spherical transform that that roadmap leaves out. From
SpecialFunctionsSU11MatrixElements (a roadmap of the same project) it takes the matrix elements
`𝔓^τ_{mn}` of `SU(1,1)` with their hypergeometric form, and identifies them with Jacobi functions;
that roadmap's Mehler–Fock transform is the Jacobi transform at `(α, β) = (0, −1/2)`.
[NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md) supplies the irreducibility of
the principal series of `SL(2, ℝ)` and `SL(2, ℂ)` for `n = 2, 3`;
[RealSemisimpleLieGroups](../RealSemisimpleLieGroups/README.md) supplies the general symmetric
space `G/K` and [RiemannianGeometry](../RiemannianGeometry/README.md) the hyperboloid as a
Riemannian manifold, with both of which the concrete model here is compared.
[AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md) supplies the Euclidean
Paley–Wiener theorem, which this roadmap reads on the line, and SpecialFunctionsGamma (a roadmap
of the same project) Carlson's theorem, which continues identities from integral parameters.

Layer 0 is the Jacobi function as a function of one variable, Layer 1 the Jacobi transform, Layer 2
the geometry of `ℍⁿ`, Layer 3 the spherical functions and the spherical principal series, and
Layer 4 the spherical, Abel and Helgason–Fourier transforms on `ℍⁿ`.

## How to read the build

Layers 0 and 1 are one-variable analysis. Apart from 0.5 (the `SU(1,1)` matrix elements) and the
polynomial case of 0.1 (the Jacobi polynomials), they depend only on the hypergeometric and Gamma
functions, Carlson's theorem, the Euclidean Paley–Wiener theorem on `ℝ` and, for the unitary
spectral representation of 1.2, the endpoint theory of Sturm–Liouville operators and the
self-adjoint multiplication operators of OperatorTheory/UnboundedOperators (§4.8 and Layer 1,
§1.7); their theorems hold
for general complex or real `(α, β)`, so that they serve every rank-one space. Layer 2 is the
geometry of `ℍⁿ` and depends on nothing in Layers 0–1. Layer 3 joins
them: the spherical functions of Layer 2's Gel'fand pair are the Jacobi functions of Layer 0, by the
uniqueness theorem of 0.1. Layer 4 transfers the inversion and Plancherel theorems of Layer 1 to
`ℍⁿ` through 3.1 and the polar coordinates of 2.2, and extends them to non-radial functions through
the plane waves of 2.4.

The hard theorems are the inversion and Plancherel theorems of 1.2 (Koornwinder's contour shift),
the Paley–Wiener theorem of 1.3, the classification of 3.2 and the Helgason–Fourier inversion of
4.3. The Laplace-type representation and the product formula of 0.4 are proved first for integral
parameters from a disc integral and extended by Carlson's theorem.

## Conventions

- **Jacobi function.** `φ_λ^{(α,β)}(t) = F((ρ + iλ)/2, (ρ − iλ)/2; α + 1; −sinh² t)` with
  `ρ = α + β + 1`, for complex `α, β, λ` and real `t` (`jacobiFunction`). `F = Γ(c) 𝐅` is the
  principal branch of SpecialFunctionsHypergeometric's Layer 1; the argument `−sinh² t ≤ 0` lies in
  the cut plane for every real `t`. At `α + 1 ∈ {0, −1, −2, …}` the value is Mathlib's junk value
  `Γ(α + 1) = 0`, and theorems that need `φ_λ(0) = 1` exclude those parameters. Vilenkin–Klimyk
  Vol. 2 write `𝔓_μ^{(α,β)}(cosh 2t)` for `φ_λ(t)`, with `μ = (iλ − ρ)/2`.
- **Jacobi operator.** `L u = u'' + ((2α + 1) coth t + (2β + 1) tanh t) u'`
  (`jacobiOperator`), with `L φ_λ = −(λ² + ρ²) φ_λ` on `t > 0`.
- **`c`-function.** Koornwinder's normalization
  `c(λ) = 2^{ρ−iλ} Γ(α + 1) Γ(iλ) / (Γ((iλ + ρ)/2) Γ((iλ + α − β + 1)/2))` (`cFunction`), the
  reciprocal of the Gamma factor of DLMF 15.9.13 at `iλ`; `c(−iρ) = 1`. Klimyk–Vilenkin's `𝐜(λ)`
  (EMS 59, Part II, Ch. 5, §2.4 (15), p. 233) is `2√π c(λ)/Γ(α + 1)`, by the duplication formula
  of `Γ`; with it their transform pair (13)–(14) carries the factors `√2/Γ(α + 1)`. With
  Koornwinder's `c` the Plancherel density is `(2π)⁻¹ |c(λ)|⁻²` for every `α`. Mathlib's `Γ` is `0`
  at its poles, so `c(λ) = 0` where a denominator factor has a pole; that is the true value of the
  quotient there, and only `iλ ∈ {0, −1, −2, …}` (a pole of the numerator) is junk.
- **Jacobi transform.** `f̃(λ) = ∫₀^∞ f(t) φ_λ(t) Δ(t) dt` with
  `Δ(t) = (2 sinh t)^{2α+1} (2 cosh t)^{2β+1}` (`jacobiTransform`, `jacobiWeight`), for real `α`
  and `β` (DLMF 15.9.12; Klimyk–Vilenkin's `Δ = 2^{2ρ} sinh^{2α+1} t cosh^{2β+1} t` is the same
  weight). The Plancherel measure is `(2π)⁻¹ |c(λ)|⁻² dλ` on `(0, ∞)`
  (`jacobiPlancherelMeasure`).
- **Real hyperbolic space.** `ℍⁿ` (`n ≥ 1`; most theorems take `n ≥ 2`) is the upper sheet of
  `[x, x] = 1` in `Fin (n + 1) → ℝ`, where `[x, y] = x₀ y₀ − x₁ y₁ − ⋯ − xₙ yₙ`, with index `0` the
  time coordinate (`lorentz`, `hyperboloid`). Wawrzyńczyk §11.2 (11.2.2)–(11.2.5), pp. 394–395,
  also puts the time coordinate first; Vilenkin–Klimyk Vol. 2 §9.1.1, p. 2, and Wawrzyńczyk
  §18.1, Example 1, p. 611, put it last. The base point is `o = e₀` (`basePoint`),
  `d(x, y) = arcosh [x, y]` (`hyperbolicDist`), and the radius of `x` is `t = arcosh x₀`.
- **Groups.** `G = SO₀(n, 1)` is the subgroup of `SL(n + 1, ℝ)` of matrices that preserve `[·, ·]`
  and map `ℍⁿ` onto itself (`lorentzGroup`); `K ≅ SO(n)` is the stabilizer of `o`
  (`rotationSubgroup`); `orbitMap g = g o`. The boost `a_t` acts in the `(x₀, x₁)`-plane by
  `a_t o = (cosh t, sinh t, 0, …, 0)`.
- **Volume.** `dm = dx₁ ⋯ dxₙ / x₀`, through the chart `y ↦ (√(1 + |y|²), y)`
  (`hyperboloidChart`, `hyperbolicMeasure`). In polar coordinates `dm = sinh^{n−1} t dt dω`, with
  `dω` the surface measure of `S^{n−1}`, of total mass `ω_{n−1} = 2π^{n/2}/Γ(n/2)` (`sphereArea`).
- **Laplacian.** `Δ` is the Laplace–Beltrami operator, negative semidefinite, computed as the
  ambient wave operator `∂₁² + ⋯ + ∂ₙ² − ∂₀²` applied to the extension of `f` homogeneous of degree
  `0` and evaluated on `ℍⁿ` (`hyperbolicLaplacian`), as in Wawrzyńczyk §11.5 (11.5.1)–(11.5.3),
  pp. 411–412, and Vilenkin–Klimyk Vol. 2 §9.1.8 (11)–(12), pp. 20–21. Off the cone `[y, y] > 0` the
  extension is junk; it is used only at points of `ℍⁿ`.
- **Boundary.** The boundary point over `b ∈ S^{n−1}` is `b̃ = (1, b)` (`boundaryVector`), on the
  light cone. `dσ` is the normalized rotation-invariant measure on `S^{n−1}`, used as the average
  over the surface measure (`sphereMeasure`). `G` acts on `S^{n−1}` by
  `g · b = (g b̃)'/(g b̃)₀`, where `'` drops the time coordinate.
- **Spherical functions.** `φ_λ(x) = φ_λ^{(n/2−1, −1/2)}(arcosh x₀)` (`sphericalFunction`), with
  `ρ = (n − 1)/2` and `Δ φ_λ = −(λ² + ρ²) φ_λ`.
- **Transforms on `ℍⁿ`.** `Sf(λ) = ∫ f φ_λ dm` (`sphericalTransform`),
  `f̂(λ, b) = ∫ f(x) [x, b̃]^{iλ−ρ} dm(x)` (`helgasonFourier`), and on `ℍ^{m+1}` the Abel transform
  `𝒜F(s) = e^{−ms/2} ∫_{ℝ^m} F(arcosh(cosh s + |v|² e^{−s}/2)) dv` (`abelTransform`). The constant
  of both inversion formulas on `ℍⁿ` is `C_n = 2^{n−1}/(2π ω_{n−1})` (`plancherelConstant`).
- **Powers.** Complex powers are principal. Every base raised to a complex power is positive:
  `[x, b̃] > 0` on `ℍⁿ`, `2 cosh t > 0`, `|cosh t + r e^{iψ} sinh t| > 0`.
- **Quantities that can be infinite** (polar and horospherical integrals of nonnegative
  functions) are `∫⁻` integrals in `ℝ≥0∞`. Bochner integrals are used only where the integrand is
  integrable under the stated hypotheses, or where both sides are integrals of the same function
  in two coordinate systems.

## Layer 0: Jacobi functions

### 0.1 Definition, equation, uniqueness and the polynomial case

Sources: DLMF 15.9.11; Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4 (12), p. 233; Vilenkin–Klimyk
Vol. 2 §11.4.1 (3), p. 332; Heckman–Schlichtkrull Part II, Lecture 8, Example 8.1 (8.3),
p. 171 (the radial equation of the hyperboloids, which `z = −sinh² t` turns into the
hypergeometric equation); Wawrzyńczyk §18.5, Example, (18.5.1), p. 627.

Prove:
- **Value at the origin** (`jacobiFunction_zero`): `φ_λ(0) = 1` for `α + 1 ∉ {0, −1, −2, …}`;
- **Evenness** (`jacobiFunction_neg_spectral`): `φ_{−λ} = φ_λ`;
- evenness in the radius, a sanity check of the definition (`jacobiFunction_even`):
  `φ_λ(−t) = φ_λ(t)`;
- **Holomorphy** (`differentiable_jacobiFunction`): `λ ↦ φ_λ(t)` is entire;
- **The Jacobi equation** (`jacobiOperator_jacobiFunction`): `L φ_λ = −(λ² + ρ²) φ_λ` on
  `t > 0` (at `α + 1 ∈ {0, −1, …}` both sides are `0`);
- **Uniqueness** (`eq_jacobiFunction_of_jacobiOperator`): for `Re α ≥ 0`, a function that is `C²`
  on `(0, ∞)`, continuous on `[0, ∞)` with value `1` at `0` and solves the Jacobi equation on
  `(0, ∞)` equals `φ_λ` on `[0, ∞)`;
- **The trivial spherical function** (`jacobiFunction_I_mul_rho`): `φ_{iρ} ≡ 1`, hence
  `φ_{−iρ} ≡ 1`, for `α + 1 ∉ {0, −1, …}`;
- **The polynomial case** (`jacobiFunction_eq_jacobi`): for `α + 1 ∉ {0, −1, …}`,
  `φ_{i(2k+ρ)}(t) = k!/(α + 1)_k · P_k^{(α,β)}(cosh 2t)`, with LaguerreJacobi's Jacobi polynomial;
- `t ↦ φ_λ(t)` is real analytic on `ℝ`, and `(λ, t) ↦ φ_λ(t)` is jointly continuous.

Proof route: the hypergeometric equation in `z = −sinh² t` becomes the Jacobi equation. The
indicial exponents at `t = 0` are `0` and `−2α`: the second solution behaves like `t^{−2α}`, or like
`log t` at `α = 0`, which is not continuous at `0` when `Re α ≥ 0`; hence uniqueness. At
`λ = i(2k + ρ)` the first parameter is `−k` and `F` terminates
(SpecialFunctionsHypergeometric §1.3); the explicit sum of LaguerreJacobi §3.2 expanded in powers of
`(1 − x)/2` is `P_k^{(α,β)}(x) = (α + 1)_k/k! · F(−k, k + ρ; α + 1; (1 − x)/2)` (DLMF 18.5.7), and
`(1 − cosh 2t)/2 = −sinh² t`.

**Checks.**
- `φ_{0.5}^{(1,0)}(1) = 0.60870 20756`.
- At `(α, β) = (1, 1/2)`, `t = 0.7`: `k = 1` gives
  `φ_{i(2+ρ)}(t) = 1 + (ρ + 1)/(α + 1) · sinh² t = 2.00703 61572`, and `k = 2` gives
  `φ_{i(4+ρ)}(t) = 2/((α + 1)(α + 2)) · P_2^{(1,1/2)}(cosh 1.4) = 4.95548 15522`.
- `L` applied to a constant is `0`, consistent with `φ_{iρ} ≡ 1` and `(iρ)² + ρ² = 0`.
- Negative control (uniqueness needs `Re α ≥ 0`): for `α = −1/4` the second solution behaves like
  `t^{1/2}` at `0`, so `φ_λ` plus that solution is continuous on `[0, ∞)` with value `1` at `0`,
  solves the equation, and differs from `φ_λ`.

*Needs:* SpecialFunctionsHypergeometric Layers 1 and 3, §1.3; LaguerreJacobi §3.2.

### 0.2 Elementary cases and the quadratic transformation

Sources: DLMF 15.9.11 with 15.4.11 and 15.4.15; Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4,
p. 233 (integral `α`, `β` and the zonal spherical functions of rank-one spaces); Wawrzyńczyk §11.1,
p. 392, and §11.3 (11.3.1), p. 401 (the spherical functions `sin νt/(ν sinh t)` of `ℍ³`).

Prove:
- **Fourier case** (`jacobiFunction_cos`): `φ_λ^{(−1/2,−1/2)}(t) = cos λt`;
- **The case of `ℍ³`** (`jacobiFunction_sin`): `φ_λ^{(1/2,−1/2)}(t) = sin λt/(λ sinh t)` for
  `λ ≠ 0`, `t ≠ 0`;
- **Quadratic transformation** (`jacobiFunction_quadratic`):
  `φ_λ^{(α,−1/2)}(t) = φ_{2λ}^{(α,α)}(t/2)`;
- `φ_λ^{(1/2,1/2)}(t) = 2 sin λt/(λ sinh 2t)` for `λ ≠ 0`, `t ≠ 0`.

Proof route: `F(a, −a; 1/2; −sinh² t) = cosh 2at` and
`(2 − 4a) sinh t · F(a, 1 − a; 3/2; −sinh² t) = 2 sinh((1 − 2a)t)`, which are DLMF 15.4.11 and
15.4.15 at `z = sinh t` (SpecialFunctionsHypergeometric §4.1; `1 + sinh² t = cosh² t` lies in the
cut plane for every real `t`, and `√(1 + z²) ± z = e^{±t}`). The quadratic transformation is the
one of SpecialFunctionsHypergeometric §7.1 with third parameter `c = (a + b + 1)/2`,
`F(a, b; (a + b + 1)/2; z) = F(a/2, b/2; (a + b + 1)/2; 4z(1 − z))`, read at
`z = −sinh²(t/2)`, where `4z(1 − z) = −sinh² t`. The last bullet is the quadratic transformation
applied to the case of `ℍ³` at `2λ`.

**Checks.**
- `φ_2^{(−1/2,−1/2)}(1) = cos 2 = −0.41614 68365`.
- `φ_1^{(1/2,−1/2)}(1) = sin 1/sinh 1 = 0.71602 29154`.
- Negative control (the second parameter of `ℍ³`): `φ_1^{(1/2,0)}(1) = 0.59651 55509`, not
  `sin 1/sinh 1`.
- At `α = 1.3`, `λ = 0.7 − 0.2i`, `t = 1.4` both sides of the quadratic transformation are
  `0.47391 25261 + 0.03004 53896 i`.

*Needs:* 0.1; SpecialFunctionsHypergeometric §§4.1 and 7.1.

### 0.3 The Harish-Chandra series, the `c`-function and the connection formula

Sources: DLMF 15.9.13–15.9.14; Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4 (15), p. 233;
Vilenkin–Klimyk Vol. 2 §9.4.10 (1)–(5), pp. 92–93 (the case `(n/2 − 1, −1/2)`);
Heckman–Schlichtkrull Part II, Lecture 8, Example 8.1 (8.4)–(8.5), p. 172; Wawrzyńczyk §18.5,
Example, (18.5.1)–(18.5.2), pp. 627–628; Heckman–Schlichtkrull Part I, Lemma 5.5.2, p. 85 (the
polynomial bound for `|c|⁻¹`).

`harishChandraSeries α β λ t` is
`Φ_λ(t) = (2 cosh t)^{iλ−ρ} F((ρ − iλ)/2, (α − β + 1 − iλ)/2; 1 − iλ; cosh⁻² t)` (DLMF 15.9.14),
used for `t > 0`; at `iλ ∈ {1, 2, …}` it is the junk value `0`. Prove:
- **`Φ_λ` solves the Jacobi equation** (`jacobiOperator_harishChandraSeries`) on `t > 0`;
- **Leading behaviour** (`tendsto_harishChandraSeries`): `Φ_λ(t) e^{(ρ−iλ)t} → 1` as `t → ∞`, for
  `iλ ∉ {1, 2, …}`;
- **The connection formula** (`jacobiFunction_eq_cFunction`):
  `φ_λ = c(λ) Φ_λ + c(−λ) Φ_{−λ}` on `t > 0`, for `iλ ∉ ℤ`;
- **Normalization** (`cFunction_neg_I_mul_rho`): `c(−iρ) = 1` for `α + 1, ρ ∉ {0, −1, −2, …}`;
- **Asymptotics** (`tendsto_jacobiFunction_mul_exp`): for `Im λ < 0`,
  `φ_λ(t) e^{(ρ−iλ)t} → c(λ)` as `t → ∞`;
- **Growth of the Plancherel density** (`exists_norm_cFunction_inv_sq_le`): for real `α > −1` and
  real `β`, `|c(λ)|⁻² ≤ C (1 + |λ|)^{2α+1}` for real `λ`;
- for real `α, β` with `α + 1 ∉ {0, −1, −2, …}`, `c(λ) ≠ 0` for real `λ ≠ 0`; for real
  `α, β, λ`, `c(−λ) = conj c(λ)`.

Proof route: the connection formula is DLMF 15.8.2 (SpecialFunctionsHypergeometric §5.1, valid for
all parameters on `−z ∈ slitPlane`) at `z = −sinh² t`, followed by Pfaff's transformation, which
turns `F(·, ·; ·; −sinh⁻² t)` into `(cosh t/sinh t)^{…} F(·, ·; ·; cosh⁻² t)`, and the
duplication formula of `Γ`. The asymptotics follow from the connection formula and the leading
behaviour, since `|Φ_{−λ}(t) e^{(ρ−iλ)t}| ~ e^{2 Im λ · t} → 0`; at `iλ ∈ {1, 2, …}` they follow by
continuity in `λ`. The growth bound is the asymptotics of `|Γ|` on vertical lines
(ZerosOfLFunctions §1.3) for the four Gamma factors, with `1/Γ(iλ)` cancelling the pole of the
numerator at `λ = 0`.

**Checks.**
- At `(α, β) = (1, 1/2)`: `c(−iρ) = 1`, while Klimyk–Vilenkin's `𝐜 = 2√π c/Γ(α + 1)` gives
  `𝐜(−iρ) = 2√π = 3.54490 77018` (negative control for the normalization).
- `c^{(1/2,−1/2)}(λ) = 1/(iλ)`, so `|c(λ)|⁻² = λ²` for `ℍ³`.
- `|c^{(0,−1/2)}(λ)|⁻² = πλ tanh πλ`, `3.12988 10356` at `λ = 1`; `|c^{(0,0)}(λ)|⁻² = (π/2) λ tanh(πλ/2)`.
- `c^{(−1/2,−1/2)} ≡ 1/2`, `Φ_λ(t) = e^{iλt}` there, and the connection formula is
  `cos λt = (e^{iλt} + e^{−iλt})/2`.
- The connection formula holds to working precision at `(α, β, λ, t) = (0.3, −0.8, 1.1 + 0.3i, 0.6)`
  (both sides `0.90694 62413 − 0.04335 37337 i`) and at complex `α`, `β`.
- At `(α, β) = (1.3, 0.2)`, `λ = 0.7 − 0.4i`: `c(λ) = 0.67696 96453 − 6.13818 88302 i`, and
  `φ_λ(30) e^{(ρ−iλ)30}` agrees with it to nine digits.

*Needs:* 0.1; SpecialFunctionsHypergeometric §5.1; ZerosOfLFunctions §1.3; Mathlib
`Complex.Gamma`.

### 0.4 Bounds, Laplace-type representation and product formula

Sources: Vilenkin–Klimyk Vol. 2 §11.4.6 (4)–(5), pp. 348–349 (Koornwinder's product formula and
the Laplace-type representation, with the analytic continuation in `α, β` and Carlson's theorem),
(8)–(10), pp. 349–350 (the kernel form); §11.4.1 (1), (6)–(7), pp. 332–333 (the disc integrals for
integral parameters).

Prove:
- **The energy bound** (`norm_jacobiFunction_le_one`): for real `λ`, real `α ≥ −1/2` and real `β`
  with `α + β + 1 ≥ 0`, `|φ_λ(t)| ≤ 1`;
- **The exponential bound** (`norm_jacobiFunction_le_exp`): under the same hypotheses on `α, β`
  and for complex `λ`, `|φ_λ(t)| ≤ e^{|Im λ| |t|}`;
- **Koornwinder's Laplace-type representation** (`jacobiFunction_laplace`), for real
  `α > β > −1/2`:
  `φ_λ(t) = C ∫₀^π ∫₀¹ |cosh t + r e^{iψ} sinh t|^{iλ−ρ} w(r, ψ) dr dψ` with
  `w(r, ψ) = r^{2β+1} (1 − r²)^{α−β−1} sin^{2β} ψ` and
  `C = 2Γ(α + 1)/(√π Γ(α − β) Γ(β + 1/2))`;
- **Bound by the imaginary part** (`norm_jacobiFunction_le`), for real `α ≥ β ≥ −1/2`:
  `|φ_λ(t)| ≤ φ_{i Im λ}(t)`;
- **Bounded Jacobi functions** (`bddAbove_jacobiFunction_iff`), for real `α ≥ β ≥ −1/2`: `φ_λ` is
  bounded on `ℝ` exactly when `|Im λ| ≤ ρ`;
- **Koornwinder's product formula** (`jacobiFunction_mul_jacobiFunction`), for real
  `α > β > −1/2`: `φ_λ(t₁) φ_λ(t₂) = C ∫₀^π ∫₀¹ φ_λ(t(r, ψ)) w(r, ψ) dr dψ` with
  `cosh t(r, ψ) = |cosh t₁ cosh t₂ + r e^{iψ} sinh t₁ sinh t₂|`;
- the kernel form: for `t₁, t₂ > 0`, `φ_λ(t₁) φ_λ(t₂) = ∫₀^∞ φ_λ(t) K(t₁, t₂, t) Δ(t) dt` with a
  kernel `K ≥ 0` supported in `|t₁ − t₂| ≤ t ≤ t₁ + t₂` and `∫₀^∞ K(t₁, t₂, t) Δ(t) dt = 1`, given
  for `α > β > −1/2` by Vilenkin–Klimyk's (9)–(10), p. 350.

Proof route for the energy bound: `u = φ_λ` is real for real `α, β, λ`; with
`E = u² + u'²/(λ² + ρ²)` the Jacobi equation gives
`E' = −2((2α + 1) coth t + (2β + 1) tanh t) u'²/(λ² + ρ²)`, and the coefficient is
`(2α + 1)(coth t − tanh t) + 2ρ tanh t ≥ 0` for `t > 0`, so `E` decreases from `E(0) = 1` (at
`λ = ρ = 0`, `φ_λ ≡ 1`). The exponential bound is the same Lyapunov argument for
`e^{−|Im λ| t} φ_λ`. The Laplace representation holds for integers `α > β ≥ 0` by the disc integral
of §11.4.1 and extends to real `α > β > −1/2` by Carlson's theorem in `α` and `β`
(Vilenkin–Klimyk's footnote on p. 349), applied in the form of SpecialFunctionsGamma §10.1 to the
difference of the two sides in one shifted parameter at a time, with the identity theorem for the
remaining range; that form needs holomorphy on a right half-plane, exponential type there, and
type less than `π` on the imaginary axis, which the proof must verify for both sides; the
product formula follows in the same way, and the bound
by the imaginary part from the Laplace representation since `|e^{(iλ−ρ)s}| = e^{(−Im λ−ρ)s}`, with
the cases `α = β` and `β = −1/2` by continuity. Boundedness: for `|Im λ| ≤ ρ` the bound by the
imaginary part reduces to `0 ≤ φ_{iy} ≤ 1` for `|y| ≤ ρ`; for `|Im λ| > ρ` the asymptotics of 0.3
give exponential growth.

**Checks.**
- At `(α, β) = (1.3, 0.2)`, `λ = 0.7 − 0.4i`, `t = 0.9`, both sides of the Laplace representation
  are `0.58004 53793 + 0.02910 68436 i`.
- At the same `(α, β, λ)` and `(t₁, t₂) = (0.5, 0.8)`, both sides of the product formula are
  `0.54272 90055 + 0.02975 30962 i`.
- `φ_λ^{(−1/2,−1/2)} = cos λt` satisfies the energy bound with `E ≡ 1`, and the exponential bound
  with equality at `t = 0`.
- Negative control (the hypotheses of the energy bound): at `(α, β) = (−1/4, −3/2)`,
  `ρ = −3/4 < 0`, `λ = 0.3`, `t = 3`: `|φ_λ(t)| = 5.47284 88029`.
- Negative control (the strip): at `(α, β) = (1.3, 0.2)`, `λ = 0.5 − 2.8i`, so
  `|Im λ| = ρ + 0.3`: `|φ_λ(10)| = 16.34674 48467` and `|φ_λ(20)| = 328.33314 70239`.

*Needs:* 0.1, 0.3; SpecialFunctionsGamma §10.1 (Carlson's theorem), or a direct proof for real
`α > β > −1/2`.

### 0.5 The matrix elements of `SU(1,1)`

Sources: Vilenkin–Klimyk Vol. 2 §11.4.1 (4)–(5), pp. 332–333 (the matrix elements of the
pseudo-unitary groups as Jacobi functions); SpecialFunctionsSU11MatrixElements §§1.1–1.3.

`SU11.boostMatrixElement τ m n t` is the function `𝔓^τ_{mn}(cosh t)` of
SpecialFunctionsSU11MatrixElements §1.1, the circle integral
`(2π)⁻¹ ∫₀^{2π} (cosh(t/2) + sinh(t/2) e^{iθ})^{τ+n} (cosh(t/2) + sinh(t/2) e^{−iθ})^{τ−n} e^{i(m−n)θ} dθ`,
copied verbatim. Prove:
- **`𝔓^τ_{mn}` as a Jacobi function** (`SU11.boostMatrixElement_eq_jacobiFunction`): for
  `τ ∈ ℂ`, real `m, n` with `m − n = k ∈ ℕ` and real `t`,
  `𝔓^τ_{mn}(cosh t) = (τ − m + 1)_k/k! · sinh^k(t/2) cosh^{−(m+n)}(t/2) · φ_λ^{(k, −(m+n))}(t/2)`
  with `λ = i(2τ + 1)`, so that `ρ = k − (m + n) + 1 = 1 − 2n`;
- **The zonal case** (`jacobiFunction_zero_zero_eq_boostMatrixElement`):
  `φ_λ^{(0,0)}(t) = 𝔓^{−1/2+iλ/2}_{00}(cosh 2t)`, hence, by the quadratic transformation of 0.2,
  `φ_λ^{(0,−1/2)}(t) = 𝔓^{−1/2+iλ}_{00}(cosh t)`, the conical function `P_{−1/2+iλ}(cosh t)` of
  SpecialFunctionsSU11MatrixElements §1.3.

Proof route: SpecialFunctionsSU11MatrixElements §1.2 states the `−sinh²` form
`𝔓^τ_{mn}(cosh t) = (τ − m + 1)_k/k! · sinh^k(t/2) cosh^{−(m+n)}(t/2) F(−τ − n, τ − n + 1; k + 1; −sinh²(t/2))`;
with `λ = i(2τ + 1)` and `(α, β) = (k, −(m + n))` one has `(ρ + iλ)/2 = −τ − n` and
`(ρ − iλ)/2 = τ − n + 1`, so the Gauss function is `φ_λ^{(k,−(m+n))}(t/2)` by definition. The zonal
case is `k = m = n = 0` at `2t` with `τ = −1/2 + iλ/2`, using `φ_{−λ} = φ_λ`.

**Checks.**
- At `τ = 0.23 + 0.4i`, `t = 1.3` the identity holds to working precision for
  `(m, n) = (2, −1), (0, 0), (5/2, 1/2), (3, 3), (1, 0), (1/2, −1/2), (4, 1)`; at `(2, −1)` both
  sides are `−0.01150 64149 − 0.01597 50333 i`.
- Negative control (the sign of `β`): with `φ^{(k, m+n)}` in place of `φ^{(k, −(m+n))}` the right
  side at `(m, n) = (2, −1)` is `−0.00774 60431 − 0.01075 42878 i`.
- Negative control (the half angle): with `φ_λ^{(k,−(m+n))}(t)` in place of `(t/2)` it is
  `−0.00472 65739 − 0.01024 50346 i`.
- `φ_{0.8}^{(0,0)}(0.6) = 𝔓^{−1/2+0.4i}_{00}(cosh 1.2) = 0.86545 73797`, and
  `φ_{0.8}^{(0,−1/2)}(0.9) = 𝔓^{−1/2+0.8i}_{00}(cosh 0.9) = 0.83316 90033`, the conical value of
  SpecialFunctionsSU11MatrixElements §1.3.

*Needs:* 0.1, 0.2; SpecialFunctionsSU11MatrixElements §§1.1–1.3.

### Examples

- `φ^{(−1/2,−1/2)}`, `φ^{(0,−1/2)}` and `φ^{(1/2,−1/2)}` are the spherical functions of `ℝ`, `ℍ²`
  and `ℍ³` (3.1); `φ^{(n/2−1,−1/2)}` that of `ℍⁿ`.

### Dependencies

SpecialFunctionsHypergeometric Layers 1 and 3, §§1.3, 4.1, 5.1, 7.1; LaguerreJacobi §3.2;
ZerosOfLFunctions §1.3; SpecialFunctionsSU11MatrixElements §§1.1–1.3; SpecialFunctionsGamma §10.1;
Mathlib Gamma function.

## Layer 1: the Jacobi transform

### 1.1 Definition and elementary properties

Sources: DLMF 15.9.12; Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4 (13), p. 233;
Heckman–Schlichtkrull Part I §5.4 (5.4.2), p. 83.

`jacobiWeight α β t`, `jacobiTransform α β f λ` and the measure `jacobiMeasure α β`, which is
`Δ(t) dt` on `(0, ∞)`. Prove:
- evenness, a sanity check of the definition (`jacobiTransform_neg`): `f̃(−λ) = f̃(λ)`, by 0.1;
- **Holomorphy** (`differentiable_jacobiTransform`): for real `α > −1` and continuous compactly
  supported `f`, `f̃` is entire;
- **The Paley–Wiener estimate** (`norm_jacobiTransform_le`): for real `α ≥ β ≥ −1/2` and `f`
  continuous with support in `[−R, R]`, `|f̃(λ)| ≤ C e^{R |Im λ|}`;
- **The transform diagonalizes `L`** (`jacobiTransform_jacobiOperator`): for real `α > −1` and
  smooth even compactly supported `f`, `(L f)~(λ) = −(λ² + ρ²) f̃(λ)`.

Proof route: `L` is symmetric for `Δ dt`, since `(Δ u')' = Δ L u`; the boundary terms at `0`
vanish because `f'(t) = O(t)`, `φ_λ'(t) = O(t)` and `Δ(t) = O(t^{2α+1})` with `2α + 2 > 0`. The
estimate is the exponential bound of 0.4.

**Checks.**
- `jacobiWeight (−1/2) (−1/2) ≡ 1`, so the transform is the Fourier cosine transform; for
  `f(t) = e^{−t²}`, `f̃(1.5) = (√π/2) e^{−9/16} = 0.50495 68809`.
- `jacobiWeight (1/2) (−1/2) t = 4 sinh² t` and `jacobiWeight 0 (−1/2) t = 2 sinh t`.
- Negative control (the factors `2` in the weight): with the weight `sinh^{2α+1} t cosh^{2β+1} t`
  the Plancherel density of 1.2 becomes `2^{2ρ} (2π)⁻¹ |c|⁻²`; at `(1/2, −1/2)` that is `2λ²/π`
  rather than `λ²/(2π)` (at `λ = 0.7`: `0.31194` against `0.07799`).

*Needs:* 0.1, 0.4; Mathlib integration by parts.

### 1.2 Inversion, Plancherel and the unitary extension

Sources: Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4 (13)–(16), p. 233; DLMF 15.9.12–15.9.13;
Wawrzyńczyk Theorem 18.6.1, p. 631 (the spherical case).

Prove, for real `α > −1` and `|β| ≤ α + 1`:
- **Inversion** (`jacobiTransform_inversion`): for smooth even compactly supported `f` and real
  `t`, `f(t) = (2π)⁻¹ ∫₀^∞ f̃(λ) φ_λ(t) |c(λ)|⁻² dλ`;
- **Plancherel** (`jacobiTransform_plancherel`): for the same `f`,
  `∫₀^∞ |f|² Δ dt = (2π)⁻¹ ∫₀^∞ |f̃(λ)|² |c(λ)|⁻² dλ`;
- **The unitary Jacobi transform** (`exists_jacobiTransform_linearIsometryEquiv`): a unitary
  `L²((0, ∞), Δ dt) ≅ L²((0, ∞), (2π)⁻¹ |c|⁻² dλ)` that agrees with the transform on smooth even
  compactly supported functions;
- **The Jacobi transform as a spectral representation of `L`**: the closure `L̄` in
  `L²((0, ∞), Δ dt)` of `L` on the smooth even compactly supported functions is self-adjoint; it
  is the self-adjoint realization of `L` with the boundary condition
  `lim_{t→0} Δ(t) u′(t) = 0` when `−1 < α < 1`, and needs none when `α ≥ 1`; and the unitary of
  the previous bullet carries `L̄` onto the maximal multiplication operator by `−(λ² + ρ²)` on
  `L²((0, ∞), (2π)⁻¹ |c|⁻² dλ)`.

Proof route (Koornwinder): write `f̃(λ) c(−λ)⁻¹ Φ_λ` with the connection formula, shift the contour
of the resulting integral over `ℝ` into `Im λ > 0`, where `|Φ_λ(t)| ~ e^{−(Im λ + ρ)t}` decays,
using the Paley–Wiener estimate and the asymptotics of `Φ_λ` (whose poles `λ = −ik` lie in
`Im λ < 0`); when `|β| ≤ α + 1` the function `c(−λ)⁻¹` has no poles in `Im λ > 0`
(Klimyk–Vilenkin, p. 233, state this for `|β| < α + 1`; at `|β| = α + 1` the pole of the Gamma
factor at `λ = 0` cancels against `Γ(−iλ)`), so no residues appear. Plancherel follows from
inversion and the symmetry of `L` (1.1), and gives the isometry. Surjectivity of the unitary
extension: for `α ≥ β ≥ −1/2` the range contains the Paley–Wiener space of 1.3, which is dense.
Euler's transformation (SpecialFunctionsHypergeometric §5.1, DLMF 15.8.1) gives
`φ_λ^{(α,β)} = (cosh t)^{−2β} φ_λ^{(α,−β)}`, and with `Δ_{α,β} = (2 cosh t)^{4β} Δ_{α,−β}` and
`c^{(α,β)} = 2^{2β} c^{(α,−β)}` the transform at `(α, β)` is `2^{2β}` times the transform at
`(α, −β)` of `(2 cosh t)^{2β} f`, a unitary change of function that preserves the smooth even
compactly supported functions; this carries surjectivity to `α ≥ −β ≥ −1/2`. For the remaining
parameters surjectivity comes with the spectral representation, whose route works for all
parameters of 1.2; Klimyk–Vilenkin, pp. 233–234, present (14) in this form, as the expansion in
the eigenfunctions of `Δ(t)⁻¹ (d/dt) Δ(t) (d/dt)`.

The spectral representation: `−L` is the Sturm–Liouville expression `w⁻¹(−(pu′)′ + qu)` of
OperatorTheory/UnboundedOperators §4.8 with `p = w = Δ` and `q = 0` on `(0, ∞)`. At `∞` it is
limit point: for nonreal `z = −(λ² + ρ²)` one has `Im λ ≠ 0`, and of the two solutions
`~ e^{(±iλ − ρ)t}` of `Lu = zu` exactly one is square-integrable for `Δ(t) ~ e^{2ρt}`. At `0`
the solutions of `Lu = 0` behave like `1` and `t^{−2α}` (`log t` at `α = 0`), and
`Δ(t) ~ 2^{2ρ} t^{2α+1}`, so `0` is limit circle exactly for `−1 < α < 1`, and limit point for
`α ≥ 1`. For `α ≥ 1` the minimal operator has deficiency indices `(0, 0)` and is self-adjoint, and
`L̄` lies between it and the maximal operator, so equals it. For `−1 < α < 1` the indices are
`(1, 1)`; `L̄` contains the minimal operator and the functions equal to `1` near `0`, on which the
Wronskian with `1` vanishes and that with the other solution does not, so it is a symmetric
extension by one dimension, hence self-adjoint, with the boundary condition stated (the even
functions satisfy it since `f′(t) = O(t)`). Let `U` be the isometry and `M` the multiplication by
`h(λ) = −(λ² + ρ²)` on its maximal domain, self-adjoint by Layer 1, §1.7 of that roadmap. By 1.1,
`U L f = M U f` on the core, so `U L̄ ⊆ M U`. If `g ⊥ ran U`, then for nonreal `z` and every `f` of
the core, `U (L̄ − z)⁻¹ f = (M − z)⁻¹ U f`, so `∫ f̃ ḡ (h − z)⁻¹ dμ = 0` with
`μ = (2π)⁻¹ |c|⁻² dλ`; the finite complex measure `f̃ ḡ dμ` has vanishing Stieltjes transform after
the injective map `h`, so it is zero, and as `f̃` is a nonzero entire function for `f ≠ 0`, `g = 0`.
So `U` is onto, and `U L̄ U⁻¹ ⊆ M` with both sides self-adjoint gives equality.

**Checks.**
- `(α, β) = (−1/2, −1/2)`: `(2π)⁻¹ |c|⁻² = 2/π`, the Fourier cosine inversion
  `f(t) = (2/π) ∫₀^∞ f̃(λ) cos λt dλ`.
- `(α, β) = (0, −1/2)`: `f̃(λ) = 2 ∫₀^∞ f(t) P_{−1/2+iλ}(cosh t) sinh t dt` is twice the
  Mehler–Fock transform of SpecialFunctionsSU11MatrixElements §5.2 at `ρ = λ` (by 0.5), and
  `(2π)⁻¹ |c(λ)|⁻² = (λ tanh πλ)/2`, so the inversion is that roadmap's Mehler–Fock inversion with
  density `λ tanh πλ`.
- `(α, β) = (1/2, −1/2)`: `(2π)⁻¹ |c|⁻² = λ²/(2π)`.
- At `(α, β) = (1, 1/2)` and `f(t) = e^{−t²}`, both sides of the Plancherel formula are
  `23.73871 645`, and the inversion at `t = 0.5` returns `e^{−1/4} = 0.77880 07831`.
- Negative control (the range of `β`): at `(α, β) = (0, 3/2)`, outside `|β| ≤ α + 1`, `c(−λ) = 0`
  at `λ = i/2`, so `φ_{i/2}(t) ~ c(i/2) e^{−3t}` lies in `L²(Δ dt)` (with `Δ ~ e^{5t}`); it is
  orthogonal to every `φ_λ`, `λ ∈ ℝ`, being an eigenfunction of the symmetric `L` with eigenvalue
  `−(ρ² − 1/4)` outside `(−∞, −ρ²]`, so the continuous Plancherel formula fails there.

*Needs:* inversion and Plancherel: 0.3, 0.4, 1.1. The unitary extension: these, and the
Paley–Wiener theorem of 1.3 (which does not use 1.2); SpecialFunctionsHypergeometric §5.1; Mathlib
`MeasureTheory.Lp` and `LinearIsometryEquiv`. The spectral representation, and through it the unitary extension at the
parameters the Paley–Wiener theorem and Euler's transformation do not reach: 1.1, the isometry
of the unitary extension, OperatorTheory/UnboundedOperators §4.8 (with the boundary conditions of
its §4.5) and Layer 1, §1.7.

### 1.3 Discrete terms, the Abel transform and the Paley–Wiener theorem

Sources: Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4, p. 233 (the poles of `c(−λ)⁻¹` and the
added summands, without their coefficients); Heckman–Schlichtkrull Part II, Lecture 8,
Example 8.3 (8.23)–(8.24), pp. 181–182 (the residue terms for the hyperboloids `X_{p,q}`);
Heckman–Schlichtkrull Part I §5.4, Theorem 5.4.2 and Proposition 5.4.3, pp. 83–84 (the spherical
transform through the Abel transform), and §5.5, Theorem 5.5.4, p. 86, and Corollary 5.5.6,
p. 88 (the Euclidean Paley–Wiener theorem, and the Paley–Wiener theorem for the spherical
transforms of type `χ_l` on Hermitian symmetric spaces, whose radial parts are Jacobi
transforms at group parameters); Wawrzyńczyk Theorem 18.8.1 (2), p. 645 (Helgason's theorem, the
spherical case on a symmetric space). None of these states the Paley–Wiener theorem at general
`α ≥ β ≥ −1/2`; Klimyk–Vilenkin, p. 234, refer for the general Jacobi transform to
Flensted-Jensen (1972) and Koornwinder (1975) (see [References](#references)), cited after
Klimyk–Vilenkin, p. 234, without theorem numbers. The statement is carried by the proof route
below.

Prove:
- **Discrete terms** (`jacobiTransform_inversion_discrete`): for real `α > −1` and
  `|β| > α + 1`, with `λ_j = i(|β| − α − 1 − 2j)` for the `j ∈ ℕ` with `|β| − α − 1 − 2j > 0` and
  `d(λ_j) = (∫₀^∞ φ_{λ_j}² Δ dt)⁻¹`, every smooth even compactly supported `f` satisfies
  `f(t) = (2π)⁻¹ ∫₀^∞ f̃(λ) φ_λ(t) |c(λ)|⁻² dλ + Σ_j d(λ_j) f̃(λ_j) φ_{λ_j}(t)` for real `t`;
- the `λ_j` are the poles of `c(−λ)⁻¹` in `Im λ > 0`, they are simple, `φ_{λ_j} ∈ L²(Δ dt)`,
  `d(λ_j) = −i Res_{μ=λ_j} (c(μ) c(−μ))⁻¹ > 0`, and the matching Plancherel formula holds;
- **The Abel transform of the Jacobi analysis**: for real `α ≥ β ≥ −1/2` there is a linear map
  `𝒜_{α,β}` with `f̃(λ) = ∫_ℝ (𝒜_{α,β} f)(s) e^{iλs} ds`, which maps the smooth even functions
  supported in `[−R, R]` bijectively onto themselves. For `α > β > −1/2` the Laplace
  representation of 0.4 written in the variable `s = log |cosh t + r e^{iψ} sinh t|` gives
  `φ_λ(t) = ∫_{−t}^{t} e^{iλs} k_t(s) ds` with a nonnegative kernel `k_t`, even in `s`, and
  `𝒜_{α,β} f(s) = ∫_{|s|}^∞ f(t) k_t(s) Δ(t) dt`. At `β = −1/2`, `α > −1/2` the kernel is
  `k_t(s) = (C/2) (sinh t)^{−2α} (cosh t − cosh s)^{α−1/2}` with
  `C = 2^{α+1/2} Γ(α + 1)/(√π Γ(α + 1/2))`, so
  `𝒜_{α,−1/2} f(s) = C 2^{2α} ∫_{|s|}^∞ f(t) (cosh t − cosh s)^{α−1/2} sinh t dt`, a Weyl
  fractional integral of order `α + 1/2` in `u = cosh s`. At `α = β` the map is
  `𝒜_{α,α} f(s) = 𝒜_{α,−1/2}(f(·/2))(2s)`, and at `α = β = −1/2` it is `f/2`;
- **The Paley–Wiener theorem** (`jacobiTransform_paley_wiener`): for real `α ≥ β ≥ −1/2` and
  real `R`, the Jacobi transform maps the smooth even functions supported in `[−R, R]` onto the
  even entire functions `g` with `(1 + |λ|)^N |g(λ)| ≤ C_N e^{R |Im λ|}` for every `N`.

Proof route: in the contour shift of 1.2 the poles `λ_j` are crossed and contribute their residues
`d(λ_j) = −i Res (c(μ) c(−μ))⁻¹`; the identification of `d(λ_j)` with the reciprocal norm follows
from the projection onto the eigenfunction `φ_{λ_j}`.

The Abel transform at `β = −1/2` is the limit `β → −1/2` of the Laplace representation of 0.4:
`Γ(β + 1/2)⁻¹ sin^{2β} ψ dψ` on `[0, π]` tends to half the sum of the point masses at `ψ = 0` and
`ψ = π`, which gives
`φ_λ^{(α,−1/2)}(t) = Γ(α + 1)/(√π Γ(α + 1/2)) ∫_{−1}^{1} (cosh t + r sinh t)^{iλ−ρ} (1 − r²)^{α−1/2} dr`,
and `e^s = cosh t + r sinh t` turns this into the kernel above. Write `g(u) = f(arcosh u)` and
`W^a g(c) = Γ(a)⁻¹ ∫_c^∞ g(w) (w − c)^{a−1} dw`. Then
`𝒜_{α,−1/2} f(s) = K_α W^{α+1/2} g(cosh s)` with `K_α = 2^{3α+1/2} Γ(α + 1)/√π`; the Beta
integral gives `W^a W^b = W^{a+b}`, and `−(d/du) W^{a+1} = W^a`, so with `k = ⌈α + 1/2⌉`,
`g = K_α⁻¹ (−d/du)^k W^{k−α−1/2} (𝒜_{α,−1/2} f ∘ arcosh)`, where `W⁰` is the identity (the case
of half-integer `α`, with `k = α + 1/2`). Both `W^a` and `d/du` keep the support
in `u ≤ cosh R`, and an even `f` is smooth exactly when `g` is smooth on `[1, ∞)`, since `t²` is an
analytic function of `u − 1` near `u = 1`; so `𝒜_{α,−1/2}` is the stated bijection. The case
`α = β` is the quadratic transformation of 0.2 read on the transform: `Δ_{α,α}(t) = Δ_{α,−1/2}(2t)`
gives `f̃^{(α,α)}(λ) = (1/2) (f(·/2))~^{(α,−1/2)}(λ/2)`. For `α > β > −1/2` the bijectivity is
Koornwinder's factorization of `𝒜_{α,β}` into fractional integrals with elementary kernels
(Koornwinder (1975), cited after Klimyk–Vilenkin, p. 234).

The Paley–Wiener theorem: the transform is the Euclidean Fourier transform after `𝒜_{α,β}`, the
Euclidean Paley–Wiener theorem of AutomorphicSpectralTheory §1.6 on `𝔞 = ℝ` (its transform
`ĥ(μ) = ∫ h(s) e^{−μs} ds` read at `μ = −iλ`, so that its bound `e^{R |Re μ|}` is `e^{R |Im λ|}`)
applies to `𝒜_{α,β} f`, and `𝒜_{α,β}` is a bijection of the smooth even functions supported in
`[−R, R]`. For `R < 0` both sides contain only `0` (an entire `g` with
`(1 + |λ|) |g(λ)| ≤ C e^{R |Im λ|}` is bounded and tends to `0`). On `ℍⁿ` the same factorization
is 4.2, with `𝒜 = ω_{n−1} 2^{1−n} 𝒜_{n/2−1,−1/2}`; neither of 1.3 and 4.2 uses the other.

**Checks.**
- At `(α, β) = (0, 3/2)` there is one discrete term, at `λ₀ = i/2`, with
  `d(λ₀) = −i Res (c(μ) c(−μ))⁻¹ = 1/32 = (∫₀^∞ φ_{i/2}² Δ dt)⁻¹`.
- At `(α, β) = (0, 3/2)`, `f(t) = e^{−t²}` and `t = 0.5`, the continuous part of the inversion is
  `0.07087 51680` and the discrete term `0.70792 56150`; their sum is `e^{−1/4} = 0.77880 07831`
  (negative control: the continuous part alone misses `f(t)`).
- At `(α, β) = (0, 7/2)` there are two, at `5i/2` and `i/2`.
- At `β = −1/2`, `α = 1.3`, `λ = 0.7 − 0.4i`, `t = 0.9` the kernel form and the definition of
  `φ_λ^{(α,−1/2)}(t)` are both `0.73532 20887 + 0.03706 47013 i`; for `f(t) = e^{−t²}` and
  `λ = 0.6 + 0.2i`, `f̃(λ)` and `∫_ℝ 𝒜_{1.3,−1/2} f(s) e^{iλs} ds` are both
  `11.41478 4349 − 0.91439 99970 i`.
- For `α ≥ β ≥ −1/2` there are no discrete terms, since then `|β| ≤ α + 1`.
- Negative control: `e^{−t²}` does not have compact support, and its transform
  `(√π/2) e^{−λ²/4}` in the Fourier case grows like `e^{(Im λ)²/4}` on the imaginary axis, faster
  than every `e^{R |Im λ|}`.

*Needs:* the Abel transform and the Paley–Wiener theorem: 0.2, 0.4, 1.1; Mathlib Fourier
transform; AutomorphicSpectralTheory §1.6 (the Euclidean Paley–Wiener theorem); not 1.2. The
discrete terms: 0.3 and the contour shift of 1.2.

### Examples

- The Fourier cosine transform, the Mehler–Fock transform and the radial Fourier transform of `ℍ³`
  are the Jacobi transforms at `(−1/2, −1/2)`, `(0, −1/2)` and `(1/2, −1/2)`.

### Dependencies

Layer 0; Mathlib `Lp`, Fourier analysis; AutomorphicSpectralTheory §1.6;
SpecialFunctionsHypergeometric §5.1; OperatorTheory/UnboundedOperators §§4.5, 4.8 and Layer 1,
§1.7;
SpecialFunctionsSU11MatrixElements §5.2 for a Check.

## Layer 2: real hyperbolic space

### 2.1 The hyperboloid, the Lorentz group and the distance

Sources: Wawrzyńczyk §11.2 (11.2.2)–(11.2.5), pp. 394–395, Proposition 11.2.1 and the distance,
p. 397, (11.2.9), p. 398; Vilenkin–Klimyk Vol. 2 §9.1.1, p. 2, and §9.1.5 (13), pp. 12–13 (the
Cartan decomposition `KA'K`); Wawrzyńczyk §18.1, Example 1, p. 611.

`lorentz`, `hyperboloid`, `basePoint`, `hyperbolicDist`, `lorentzGroup`, `rotationSubgroup`,
`orbitMap` as in Conventions. Prove:
- **Transitivity** (`exists_orbitMap_eq`): every `x ∈ ℍⁿ` is `g o` for some `g ∈ G`;
- invariance of the distance, a sanity check of the definition of `G` (`hyperbolicDist_mulVec`):
  `d(gx, gy) = d(x, y)` for `g ∈ G`;
- `K` is compact and isomorphic to `SO(n)`, acting on `(x₁, …, xₙ)`;
- the Cartan decomposition in coordinates: every `g ∈ G` is `k₁ a_t k₂` with `k₁, k₂ ∈ K` and
  `t = d(o, g o) ≥ 0`;
- `[x, y] ≥ 1` for `x, y ∈ ℍⁿ`, with equality only at `x = y`, and `d` is the Riemannian distance
  of RiemannianGeometry R4.7's hyperboloid model (the metric that the Lorentz form induces on the
  tangent spaces, here `−[·, ·]`, up to the order of the coordinates); in particular `d` is a
  metric on `ℍⁿ`;
- `G` is the subgroup of determinant one of R4.7's isometry group `O⁺(n, 1)`, so it acts on `ℍⁿ`
  by isometries of that model;
- `g ↦ g o` induces a `G`-equivariant diffeomorphism from RealSemisimpleLieGroups §5.2's symmetric
  space `SO₀(n, 1)/SO(n)` onto `ℍⁿ`.

Proof route: `a_t o = (cosh t, sinh t, 0, …)`; rotate `(x₁, …, xₙ)` onto the `x₁`-axis by `K`.
`[x, y] ≥ 1` is the Cauchy–Schwarz inequality for `(x₁, …, xₙ)` and `(y₁, …, yₙ)`, as in
Wawrzyńczyk, p. 397. The comparison with R4.7: by transitivity and invariance it suffices to take
`x = o`, `y = a_t o`, joined by the unit-speed geodesic `s ↦ a_s o` of length `t = arcosh [o, y]`.

**Checks.**
- `d(o, x) = arcosh x₀`, since `[o, x] = x₀`.
- `[o, o] = 1`, and `(−1, 0, …, 0)` satisfies `[x, x] = 1` but is not in `ℍⁿ` (negative control
  for the sheet).
- `d(o, (cosh 1, sinh 1, 0)) = 1`, while the Euclidean distance is `1.29461 74807`.
- `diag(−1, −1, 1)` has determinant `1` and preserves `[·, ·]` but maps `ℍ²` to the lower sheet,
  so it is not in `lorentzGroup 2` (negative control for the condition on the sheet).
- The boost `a_t` lies in `lorentzGroup n`, and the rotations of `(x₁, …, xₙ)` lie in `K`.

*Needs:* Mathlib `Matrix.SpecialLinearGroup`, `Real.arcosh`; RiemannianGeometry R4.7 for the
comparison with the Riemannian model; RealSemisimpleLieGroups §5.2 for the last bullet.

### 2.2 The invariant volume

Sources: Wawrzyńczyk §11.2 (11.2.13), p. 400 (`dm = dp₁ dp₂ dp₃/p₀`, polar and horospherical
forms); Vilenkin–Klimyk Vol. 2 §9.1.9 (8′), (11), pp. 22–23; §9.1.5 (16)–(18), p. 13 (horospherical
coordinates).

`hyperboloidChart`, `hyperbolicMeasure`, `sphereArea`. Prove:
- **Invariance** (`map_hyperbolicMeasure`): `m` is `G`-invariant;
- **Polar coordinates** (`lintegral_hyperbolicMeasure_radial`): for `n ≥ 1` and measurable
  `F ≥ 0`, `∫⁻ F(d(o, x)) dm = ω_{n−1} ∫⁻₀^∞ F(t) sinh^{n−1} t dt`, together with the full form
  `dm = sinh^{n−1} t dt dω` and the Bochner form for measurable complex `F`;
- **Horospherical coordinates** (`lintegral_hyperbolicMeasure_horospherical`): on `ℍ^{m+1}`, with
  `x(s, v) = (cosh s + |v|² e^{−s}/2, e^{−s} v, −sinh s − |v|² e^{−s}/2)` for `s ∈ ℝ`, `v ∈ ℝ^m`,
  `∫⁻ f dm = ∫⁻ ∫⁻ f(x(s, v)) e^{−ms} dv ds` for measurable `f ≥ 0`;
- `m` is the Riemannian volume of RiemannianGeometry R4.7's hyperboloid metric, which in the
  chart is `g_{ij} = δ_{ij} − y_i y_j/(1 + |y|²)`, and the image of a Haar measure of `G` under
  `g ↦ g o` is a multiple of `m`.

Proof route: invariance under `K` is invariance of the chart under rotations; under the boosts it
is a change of variables in the chart; `G = K A K`. Polar coordinates: `y = sinh t · ω` in the
chart. Horospherical coordinates: `x(s, v) = n_v a_{−s} o` for the unipotent `n_v` fixing the light
ray of `(1, 0, …, 0, −1)` (Wawrzyńczyk (11.2.10)–(11.2.11), p. 399).

**Checks.**
- `ω₀ = 2`, `ω₁ = 2π`, `ω₂ = 4π`, `ω₃ = 2π² = 19.73920 88022`.
- The hyperbolic disc of radius `1` in `ℍ²` has area `2π(cosh 1 − 1) = 3.41227 62653`; the chart
  measure `dy` without the factor `1/x₀` gives `π sinh² 1 = 4.33884 68454` (negative control).
- The ball of radius `1` in `ℍ³` has volume `π(sinh 2 − 2) = 5.11093 27057`.
- `x(s, v)` lies on `ℍ^{m+1}`: `x₀² − e^{−2s}|v|² − x_{m+1}² = 1`.
- `√det g = (1 + |y|²)^{−1/2} = 1/x₀`.

*Needs:* 2.1; Mathlib change of variables, `MeasureTheory.Measure.toSphere`; RiemannianGeometry
R4.7 for the last bullet.

### 2.3 The Laplace–Beltrami operator

Sources: Wawrzyńczyk §11.5 (11.5.1)–(11.5.3), pp. 411–412; Vilenkin–Klimyk Vol. 2 §9.1.8 (11)–(13),
pp. 20–21; Wawrzyńczyk Corollary 18.3.3, p. 622 (in rank one the invariant differential operators
are generated by the Laplace–Beltrami operator).

`hyperbolicLaplacian n f x` as in Conventions. Prove:
- **Invariance** (`hyperbolicLaplacian_comp`): `Δ(f ∘ g) = (Δf) ∘ g` on `ℍⁿ` for `C²` functions
  `f` and `g ∈ G`;
- **Radial part** (`hyperbolicLaplacian_radial`): for `F` of class `C²` on `(0, ∞)` and
  `x ∈ ℍⁿ \ {o}` with `t = d(o, x)`, `Δ(F ∘ d(o, ·))(x) = F''(t) + (n − 1) coth t F'(t)`;
- `Δ f(x)` depends only on the values of `f` on `ℍⁿ`;
- in the chart, `Δ` is the Laplace–Beltrami operator `|g|^{−1/2} ∂_i(|g|^{1/2} g^{ij} ∂_j)` of
  RiemannianGeometry R4.7's hyperboloid metric, written in the chart in 2.2; it is symmetric and
  negative semidefinite on `C_c^∞(ℍⁿ)` for `m`, and it generates the algebra of `G`-invariant
  differential operators on `ℍⁿ`.

Proof route: `g` commutes with the homogeneous extension and with the wave operator. The radial
part: the homogeneous extension of `F(arcosh x₀)` is `F(arcosh(y₀/√[y, y]))`; differentiate. More
generally, for `F` of one variable, `Δ(F([·, b]))(x) = ([x, b]² − [b, b]) F''([x, b]) + n [x, b] F'([x, b])`.

**Checks.**
- `Δ x₀ = n x₀` on `ℍⁿ` (`x₀ = cosh t`: `cosh t + (n − 1) coth t sinh t`).
- Negative control (the homogeneous extension): the wave operator applied to the linear function
  `y ↦ y₀` itself, without the extension, gives `0`, not `n x₀`.
- The radial part at `(α, β) = (n/2 − 1, −1/2)` is the Jacobi operator `L`:
  `(2α + 1) coth t + (2β + 1) tanh t = (n − 1) coth t`.

*Needs:* 2.1, 2.2; Mathlib iterated derivatives; RiemannianGeometry R4.7 for the last bullet.

### 2.4 The boundary sphere, plane waves and the Poisson kernel

Sources: Wawrzyńczyk §11.4 (11.4.3)–(11.4.5), p. 403, and Theorem 11.5.1, (11.5.5)–(11.5.8),
pp. 411–412 (`n = 3`); §18.1, Proposition 18.1.6, (18.1.12)–(18.1.15) and Lemma 18.1.7, pp. 610–611,
(18.1.16)–(18.1.18), pp. 613–614; Vilenkin–Klimyk Vol. 2 §9.2.1, pp. 25–26 (the action on the
sphere).

`boundaryVector n b = (1, b)` for `b ∈ S^{n−1}`, `sphereMeasure n`. Prove:
- **Plane waves** (`hyperbolicLaplacian_planeWave`):
  `Δ[x, b̃]^{−μ} = μ(μ − n + 1) [x, b̃]^{−μ}` on `ℍⁿ`, for every `μ ∈ ℂ`;
- **Poisson integrals are harmonic** (`hyperbolicLaplacian_poisson`): for `n ≥ 2` and continuous
  `F` on `S^{n−1}`, `Δ ∫ [x, b̃]^{1−n} F(b) dσ(b) = 0` on `ℍⁿ`;
- `[x, b̃] > 0` on `ℍⁿ`, `[g x, g y] = [x, y]`, and `g b̃ = (g b̃)₀ · (g · b)~`, so
  `[g x, b̃] = (g⁻¹ b̃)₀ [x, (g⁻¹ · b)~]`;
- the Jacobian of `b ↦ g⁻¹ · b` for `dσ` is `(g⁻¹ b̃)₀^{1−n}`:
  `∫ F(g⁻¹ · b) (g⁻¹ b̃)₀^{1−n} dσ(b) = ∫ F dσ`, and `∫ [x, b̃]^{1−n} dσ(b) = 1`.

Proof route: `[y, b̃]` is linear in `y` and `[b̃, b̃] = 0`, so the general formula of 2.3 gives
`n[x, b̃](−μ)[x, b̃]^{−μ−1} + [x, b̃]² μ(μ + 1)[x, b̃]^{−μ−2}`; the Poisson kernel is the plane wave at
`μ = n − 1`. The Jacobian is the transformation of the cone measure under `g`.

**Checks.**
- At `μ = iλ + ρ`, `μ(μ − n + 1) = −(λ² + ρ²)`.
- `[b̃, b̃] = 0` and `[o, b̃] = 1`.
- For `n = 2`, the boost `a_{0.8}` and `F(θ) = cos² θ + 0.3 sin θ`, the Jacobian identity holds
  with both sides `1/2`, while without the Jacobian factor the left side is `0.57218 06070`
  (negative control).

*Needs:* 2.3; Mathlib `MeasureTheory.Measure.toSphere`, `MeasureTheory.average`.

### 2.5 The Gel'fand pair

Sources: SpecialFunctionsGroupModels §5.1 (Gel'fand's criterion in its symmetric-pair form);
Wawrzyńczyk §11.2, p. 395 (`SO₀(3, 1)` as the image of `SL(2, ℂ)`, with the equivalent pairs
`(SL(2, ℂ), SU(2))` and `(SO₀(3, 1), SO(3))`).

Prove:
- **`(SO₀(n, 1), SO(n))` is a Gel'fand pair** (`isGelfandPair_lorentzGroup`) for every Haar
  measure of `G`, in the sense of SpecialFunctionsGroupModels §5.1, by its symmetric-pair criterion
  with the involution `θ(g) = (gᵀ)⁻¹`, which equals `J g J` on `G`, `J = diag(1, −1, …, −1)`;
- `G` is a unimodular locally compact group, `K` is compact, `θ` is a continuous involutive
  automorphism fixing `K` pointwise, and `G = K P` with `P = {p | θ p = p⁻¹}`.

Proof route: `θ(g) = (gᵀ)⁻¹ = J g J` on `G` since `gᵀ J g = J`; `θ` fixes `K` (block-diagonal with
`(1, k)`, `k ∈ SO(n)`) and inverts the boosts; `G = K P` is the Cartan decomposition
`k₁ a_t k₂ = (k₁ k₂)(k₂⁻¹ a_t k₂)` with `k₂⁻¹ a_t k₂ ∈ P`.

**Checks.**
- `θ(a_t) = a_{−t}` and `θ(k) = k` for `k ∈ K`.
- `θ(gh) = θ(g) θ(h)` and `θ² = id`.
- Negative control (the involution): `g ↦ J (gᵀ)⁻¹ J` is the identity on `G`, since
  `(gᵀ)⁻¹ = J g J`; so it sends `a_t` to `a_t`, not to `a_{−t}`, and is not the Cartan involution
  (for `n ≥ 2` it still satisfies the criterion, because `a_{−t} ∈ K a_t K`).
- Negative control: for `n ≥ 2`, `(SO₀(n, 1), {1})` is not a Gel'fand pair, since `G` is not
  abelian (for `n = 1`, `SO₀(1, 1) ≅ ℝ` is abelian and the pair is one).

*Needs:* 2.1, 2.2; SpecialFunctionsGroupModels §5.1.

### Examples

- `ℍ²` with `SO₀(2, 1) ≅ PSL(2, ℝ)` and `ℍ³` with `SO₀(3, 1) ≅ PSL(2, ℂ)` (Wawrzyńczyk §11.2).

### Dependencies

Mathlib matrices, measure theory and derivatives; SpecialFunctionsGroupModels §5.1;
RiemannianGeometry R4.7 for the comparison bullets of 2.1–2.3; RealSemisimpleLieGroups §5.2 for one
bullet of 2.1.

## Layer 3: spherical functions on `ℍⁿ`

### 3.1 Harish-Chandra's integral and the eigenvalue equation

Sources: Wawrzyńczyk §18.1, Example 1, pp. 611–613, and Theorem 18.3.5, p. 622; Vilenkin–Klimyk
Vol. 2 §9.3.2 (5)–(7), pp. 47–48; Wawrzyńczyk §11.1, p. 392, and (11.3.1), p. 401 (`n = 3`).

`sphericalFunction n λ x`. Prove:
- **Harish-Chandra's integral** (`sphericalFunction_eq_average`): for `n ≥ 2` and `x ∈ ℍⁿ`,
  `φ_λ(x) = ∫ [x, b̃]^{−(iλ+ρ)} dσ(b)`;
- **Eigenfunction** (`hyperbolicLaplacian_sphericalFunction`): `Δ φ_λ = −(λ² + ρ²) φ_λ` on `ℍⁿ`;
- `φ_λ(o) = 1`, and `φ_λ` is the unique `K`-invariant `C²` eigenfunction of `Δ` with eigenvalue
  `−(λ² + ρ²)` and value `1` at `o`.

Proof route: the integral is `K`-invariant, equals `1` at `o`, and is an eigenfunction by 2.4; its
radial part solves the Jacobi equation at `(n/2 − 1, −1/2)` (2.3) and is continuous at `0` with
value `1`; `α = n/2 − 1 ≥ 0`, so the uniqueness theorem of 0.1 identifies it with
`φ_λ^{(n/2−1,−1/2)}`. In spherical coordinates the integral is Vilenkin–Klimyk's
`(Γ(n/2)/(√π Γ((n−1)/2))) ∫₀^π (cosh t − sinh t cos θ)^{−(iλ+ρ)} sin^{n−2} θ dθ`.

**Checks.**
- `n = 3`: `φ_λ(x) = sin λt/(λ sinh t)` (0.2).
- At `λ = 0.7 + 0.2i`, `t = 0.9` both sides of Harish-Chandra's integral agree for
  `n = 2, 3, 4, 5`; for `n = 3` both are `0.82408 49752 − 0.03194 68381 i`.
- `φ_{±iρ} ≡ 1`; at `λ = iρ` the integrand is `[x, b̃]^0 = 1`.
- Negative control (the second Jacobi parameter): `(α, β) = (n/2 − 1, 0)` gives, for `n = 3`,
  `φ_1(1) = 0.59651 55509 ≠ sin 1/sinh 1`.

*Needs:* 0.1, 0.2, 2.3, 2.4.

### 3.2 Spherical functions of the Gel'fand pair

Sources: Wawrzyńczyk Theorem 18.3.5, p. 622, and Corollary 18.3.4, p. 622 (`φ_{sλ} = φ_λ` for the
Weyl group); SpecialFunctionsGroupModels §5.2; Vilenkin–Klimyk Vol. 2 §9.3.2, p. 47.

For `n ≥ 2` and a left-invariant probability measure `ν` on `K`, prove:
- **`φ_λ ∘ orbitMap` is spherical** (`isSphericalFunction_sphericalFunction`) in the sense of
  SpecialFunctionsGroupModels §5.2, for every `λ ∈ ℂ`;
- **Classification** (`isSphericalFunction_iff`): every spherical function of the pair is
  `φ_λ ∘ orbitMap` for some `λ ∈ ℂ`;
- **Parametrization** (`sphericalFunction_comp_orbitMap_eq_iff`): for `n ≥ 1`,
  `φ_λ ∘ orbitMap = φ_μ ∘ orbitMap` exactly when `μ = ±λ`.

Proof route: the functional equation from Harish-Chandra's integral, the invariance of `ν` and the
Jacobian of 2.4. Conversely a spherical function is bi-`K`-invariant, hence radial, and by the
functional equation integrated against a smooth bi-invariant approximate identity it is smooth and
an eigenfunction of every `G`-invariant differential operator (SpecialFunctionsGroupModels §5.4,
third bullet), in particular of `Δ`; 3.1's uniqueness applies. The parametrization: the eigenvalue
`−(λ² + ρ²)` determines `±λ`, and `φ_λ` determines its eigenvalue.

**Checks.**
- `φ_λ ∘ orbitMap` is bi-`K`-invariant because `d(o, k₁ g k₂ o) = d(o, g o)`.
- The eigenvalue `−(λ² + ρ²)` takes each value at exactly `±λ`.
- Negative control: `2 φ_λ` satisfies the eigenvalue equation but neither `φ(1) = 1` nor the
  functional equation.

*Needs:* 3.1; SpecialFunctionsGroupModels §§5.2, 5.4.

### 3.3 Boundedness and positive definiteness

Sources: Vilenkin–Klimyk Vol. 2 §9.2.8, pp. 39–40 (the unitary principal and complementary
series and their invariant forms); SpecialFunctionsGroupModels §5.3.

Prove, for `n ≥ 2`:
- `φ_λ` is bounded on `ℍⁿ` exactly when `|Im λ| ≤ ρ` (0.4 at `α = n/2 − 1 ≥ β = −1/2`), and then
  `|φ_λ| ≤ 1`;
- `φ_λ ∘ orbitMap` is positive definite on `G` exactly when `λ ∈ ℝ` or `λ ∈ i[−ρ, ρ]`.

Proof route: positive definite functions are bounded by their value at `1` and Hermitian; with
`φ_λ(g⁻¹ o) = φ_λ(g o)` and `conj φ_λ = φ_{λ̄}` (real parameters), Hermitian means `λ̄ = ±λ`, so
`λ ∈ ℝ ∪ iℝ`, and boundedness gives `|Im λ| ≤ ρ`. Conversely, for real `λ` and for
`λ ∈ i(−ρ, ρ)`, `φ_λ` is the `K`-fixed coefficient of the unitary principal, respectively
complementary, series of 3.4, and `φ_{±iρ} = 1`.

**Checks.**
- `n = 2`: `φ_λ(x) = P_{−1/2+iλ}(x₀)` (0.5), and for real `λ` the bound `|φ_λ| ≤ 1` is
  SpecialFunctionsSU11MatrixElements §2.1's bound `|𝔓^τ_{00}| ≤ 1` on `Re τ = −1/2`.
- `φ_{iρ} = 1` is positive definite, the coefficient of the trivial representation.
- Negative control: `φ_{i(ρ+1)}` is unbounded, hence not positive definite; `φ_{1+i/4}` is bounded
  but not Hermitian.

*Needs:* 0.4, 0.5, 3.2, 3.4; SpecialFunctionsGroupModels §5.3.

### 3.4 The spherical principal series

Sources: Vilenkin–Klimyk Vol. 2 §9.2.1, pp. 25–26, §9.2.6, p. 35 (irreducibility),
§9.2.7, pp. 36–39 (intertwining operators and equivalences), §9.2.8, pp. 39–40 (unitarity); Wawrzyńczyk §11.1 (11.1.4)–(11.1.5),
Corollaries 11.1.4–11.1.5, pp. 391–393, and Theorem 11.7.1, p. 419 (`n = 3`); Theorem 18.5.4,
p. 631.

The spherical principal series `π_λ` of `G` on `L²(S^{n−1}, dσ)`:
`(π_λ(g) F)(b) = (g⁻¹ b̃)₀^{−(iλ+ρ)} F(g⁻¹ · b)`, a multiplier representation in the sense of
SpecialFunctionsGroupModels Layer 1. Prove, for `n ≥ 2`:
- the multiplier is a multiplier cocycle, `π_λ` is a strongly continuous representation by bounded
  operators, and it is unitary exactly when `λ ∈ ℝ` (the unitarity criterion of
  SpecialFunctionsGroupModels §1.3 with the Jacobian of 2.4);
- the `K`-fixed vectors are the constants, and `⟪1, π_λ(g) 1⟫ = φ_λ(g o)`;
- `π_λ` is irreducible for `λ ∈ ℝ`, and `π_λ ≅ π_{−λ}`; for `n = 2, 3` this is the irreducibility
  and equivalence of the principal series of NoncompactQuantumSymmetry M4 and M4.Lorentz through
  `SO₀(2, 1) ≅ PSL(2, ℝ)` and `SO₀(3, 1) ≅ PSL(2, ℂ)`;
- the complementary series: for `λ ∈ i(−ρ, 0)`, `π_λ` is unitary for an invariant positive
  Hermitian form on smooth functions whose kernel is a positive multiple of
  `|b − b'|^{2(iλ−ρ)}`, integrable on `S^{n−1} × S^{n−1}` because its exponent
  `−2(ρ + Im λ)` exceeds `−(n − 1) = −2ρ`; for `λ ∈ i(0, ρ)`, the operator with the integrable
  kernel `|b − b'|^{2(−iλ−ρ)}` intertwines `π_{−λ}` with `π_λ`, so `π_λ ≅ π_{−λ}` is unitary for
  the transported form.

Proof route: the cocycle identity is the homogeneity of `b̃ ↦ (g⁻¹ b̃)₀` (2.4). The coefficient is
Harish-Chandra's integral, since `(g⁻¹ b̃)₀ = [g o, b̃]`. Irreducibility for general `n`: the
`K`-types of `L²(S^{n−1})` are the spherical harmonics of each degree, each once, and the
infinitesimal action of a boost connects neighbouring degrees with coefficients that do not vanish
for `λ ∈ ℝ` (Vilenkin–Klimyk §9.2.6). The operator `A_λ` with kernel `[b̃, b̃']^{iλ−ρ}`, a multiple
of `|b − b'|^{2(iλ−ρ)}` since `[b̃, b̃'] = |b − b'|²/2`, satisfies `A_λ π_λ(g) = π_{−λ}(g) A_λ` by
the Jacobian of 2.4 (the exponent `s` of the kernel must satisfy `s − iλ + ρ = 0`); it is an
integral operator for `Im λ < 0`, and for real `λ` the intertwiner `π_λ ≅ π_{−λ}` is its
normalized analytic continuation in `λ` (Vilenkin–Klimyk §9.2.7). For `λ ∈ i(−ρ, 0)` the form
`⟪A_λ F, G⟫` is `π_λ`-invariant, since the `L²` adjoint of `π_λ(g)` is `π_{λ̄}(g⁻¹)` and
`λ̄ = −λ`.

**Checks.**
- The multiplier at `g = a_t`, `b = (1, 0, …, 0)` is `e^{(iλ+ρ)t}`.
- Negative control (the sign of `Im λ` in the complementary series): for `n = 2` and `λ = i/4`
  the kernel `|b − b'|^{2(iλ−ρ)} = |b − b'|^{−3/2}` is not integrable on the circle, while at
  `λ = −i/4` it is `|b − b'|^{−1/2}`, which is.
- `n = 2`: `π_λ` and the principal series of SpecialFunctionsGroupModels §2.1 at
  `τ = −1/2 + iλ` (through `PSL(2, ℝ) ≅ SU(1,1)/{±1}`) are unitary and irreducible with the same
  spherical function `P_{−1/2+iλ}(cosh t)`, hence equivalent (SpecialFunctionsGroupModels §5.3).
- Negative control: with the multiplier `(g⁻¹ b̃)₀^{−iλ}` (no `ρ`) the operators are not unitary for
  real `λ`, since `|(g⁻¹ b̃)₀^{−iλ}|² = 1` differs from the Jacobian `(g⁻¹ b̃)₀^{1−n}`.

*Needs:* 2.4, 3.1; SpecialFunctionsGroupModels Layer 1, §§2.1, 5.3; NoncompactQuantumSymmetry M4,
M4.Lorentz.

### Examples

- For `n = 3`, the spherical functions `sin λt/(λ sinh t)` of `SL(2, ℂ)/SU(2)` (Wawrzyńczyk
  (11.3.1), p. 401).

### Dependencies

Layers 0 and 2; SpecialFunctionsGroupModels Layer 1 and §§2.1, 5.1–5.4; NoncompactQuantumSymmetry
M4 and M4.Lorentz; SpecialFunctionsSU11MatrixElements §2.1 for a Check.

## Layer 4: harmonic analysis on `ℍⁿ`

### 4.1 The spherical transform

Sources: Wawrzyńczyk §11.3 (11.3.2)–(11.3.4), p. 401, Theorem 11.3.1, (11.3.5)–(11.3.6), p. 402
(`n = 3`); Theorem 18.6.1 and (18.6.1), p. 631; Klimyk–Vilenkin (EMS 59) Part II, Ch. 5, §2.4,
p. 233.

`sphericalTransform n f λ`, `plancherelConstant n`. Prove:
- **The spherical transform is a Jacobi transform** (`sphericalTransform_radial`): for `n ≥ 1`,
  measurable `F` and `f = F ∘ d(o, ·)`, `Sf(λ) = ω_{n−1} 2^{1−n} F̃(λ)` at
  `(α, β) = (n/2 − 1, −1/2)`;
- **Inversion** (`sphericalTransform_inversion`): for `n ≥ 2` and `F` smooth, even and of compact
  support, `F(t) = C_n ∫₀^∞ Sf(λ) φ_λ(t) |c(λ)|⁻² dλ`;
- **Plancherel** (`sphericalTransform_plancherel`): for the same `F`,
  `∫ |f|² dm = C_n ∫₀^∞ |Sf(λ)|² |c(λ)|⁻² dλ`;
- `S(f * h) = Sf · Sh` for radial `f, h ∈ C_c(ℍⁿ)` (SpecialFunctionsGroupModels §5.2), and `S`
  extends to a unitary map from the radial part of `L²(ℍⁿ, m)` onto
  `L²((0, ∞), C_n |c(λ)|⁻² dλ)`.

Proof route: polar coordinates (2.2), `Δ(t) = 2^{n−1} sinh^{n−1} t` at `(n/2 − 1, −1/2)`, and 1.2
(where `|β| = 1/2 ≤ α + 1 = n/2`).

**Checks.**
- `C₂ = C₃ = 1/(2π²) = 0.05066 05918` and `C₄ = 2/π³ = 0.06450 30689`.
- For `n = 3`, `C₃ |c(λ)|⁻² = λ²/(2π²)`; Wawrzyńczyk's (11.3.5) has `(2/π) ν² dν` for his measure
  `sinh² t dt dk` with normalized `dk`, which is `m/(4π)`, and `(2/π)/(4π) = 1/(2π²)`.
- Negative control: the constant `(2π)⁻¹` of 1.2 in place of `C₃` multiplies the right side of the
  Plancherel formula on `ℍ³` by `2π²/(2π) = π`.

*Needs:* 1.2, 2.2, 3.1.

### 4.2 The Abel transform

Sources: Heckman–Schlichtkrull Part I §5.4 (5.4.2)–(5.4.5), Theorem 5.4.2, Proposition 5.4.3,
pp. 83–84; Wawrzyńczyk §18.7 (18.7.12), p. 640; Vilenkin–Klimyk Vol. 2 §9.1.5 (16)–(18), p. 13
(the horospheres).

`abelTransform m F s` on `ℍ^{m+1}`. Prove:
- **Evenness** (`abelTransform_neg`): `𝒜F(−s) = 𝒜F(s)`;
- **Spherical transform = Fourier ∘ Abel** (`sphericalTransform_eq_integral_abelTransform`): for
  continuous compactly supported `F`, `S(F ∘ d(o, ·))(λ) = ∫_ℝ 𝒜F(s) e^{iλs} ds`;
- **`ℍ³`** (`abelTransform_two`): `𝒜F(s) = 2π ∫_{cosh s}^∞ F(arcosh u) du`;
- for `m ≥ 1`, `𝒜F(s) = ω_{m−1} 2^{m/2−1} ∫_{cosh s}^∞ F(arcosh u) (u − cosh s)^{m/2−1} du`, and for
  even `m = 2j` (odd `n`), `F(t) = (−1)^j/(ω_{m−1} 2^{j−1} (j − 1)!) · (d/du)^j 𝒜F` at
  `u = cosh t`, with `𝒜F` read as a function of `u = cosh s`;
- `F` supported in `[0, R]` gives `𝒜F` supported in `[−R, R]` (Proposition 5.4.3), and `𝒜` is a
  bijection of the smooth even functions supported in `[−R, R]` onto themselves, read on `F` via
  `F ↦ F ∘ |·|`.

Proof route: in the horospherical coordinates of 2.2, `[x(s, v), b̃₀] = e^{−s}` for
`b̃₀ = (1, 0, …, 0, −1)`, so for radial `f` the Helgason–Fourier transform `f̂(λ, b₀)` of 4.3 is
`∫ 𝒜F(s) e^{−iλs} ds` and equals `Sf(λ)` by Harish-Chandra's integral; evenness is the substitution
`v ↦ e^{−s} v`, which also turns `e^{−iλs}` into `e^{iλs}`. The closed form is polar coordinates
in `v` with `u = cosh s + r² e^{−s}/2`. The bijection is the inversion of a Weyl fractional
integral, without the Paley–Wiener theorem: with `G(u) = F(arcosh u)` and
`W^a G(c) = Γ(a)⁻¹ ∫_c^∞ G(w) (w − c)^{a−1} dw`, the closed form reads
`𝒜F(s) = (2π)^{m/2} W^{m/2} G(cosh s)` (as `ω_{m−1} Γ(m/2) = 2π^{m/2}`). The Beta integral
`∫_c^∞ (u − c)^{a−1} ∫_u^∞ G(w) (w − u)^{b−1} dw du = B(a, b) ∫_c^∞ G(w) (w − c)^{a+b−1} dw` gives
`W^a W^b = W^{a+b}`, so for odd `m` (even `n`) one further integral of order `1/2` and
`(m + 1)/2` derivatives invert it, `G = (2π)^{−m/2} (−d/du)^{(m+1)/2} W^{1/2} (𝒜F ∘ arcosh)` (for
`m = 1`, Abel's inversion), and for even `m` the inverse above is the case without the extra
integral. `W^a` keeps the support in `u ≤ cosh R`, and an even `F` is smooth exactly when `G` is
smooth on `[1, ∞)`.

**Checks.**
- `[x(s, v), (1, 0, …, 0, −1)] = e^{−s}` on the horospherical chart.
- `F(t) = e^{−cosh t}` on `ℍ³`: `𝒜F(s) = 2π e^{−cosh s}`, so `S(F ∘ d)(λ) = 4π K_{iλ}(1)` with
  the Macdonald function `K_ν`.
- For `F(t) = e^{−cosh t}(1 + t²)` and `s = 0.7` the definition and the closed form agree for
  `m = 1, 2, 3, 4` (at `m = 2` both are `5.34822 74281`), and the inverse for `m = 4` returns
  `F(0.9)`.
- For `F(t) = e^{−1/(R² − t²)} (1 + t²)` on `[0, R)`, `R = 3/2`, the inversion through `W^{1/2}`
  returns `F(0.9) = 0.90382 67374` on `ℍ²` and `ℍ⁴` (`m = 1, 3`), as the direct inverse does on
  `ℍ³`, and `𝒜F` vanishes for `cosh s > cosh R`.
- Negative control: without the factor `e^{−ms/2}`, `𝒜F` is not even.
- `n = 2`: `𝒜F(s) = √2 ∫_{|s|}^∞ F(t) sinh t (cosh t − cosh s)^{−1/2} dt`.

*Needs:* 2.2, 3.1, 4.1, and the definition of `helgasonFourier` (4.3) with its value on radial
functions, which uses only 3.1; Mathlib Fourier transform. Not 1.3 and no theorem of 4.3.

### 4.3 The Helgason–Fourier transform

Sources: Wawrzyńczyk §18.7 (18.7.12)–(18.7.13), p. 640, Theorem 18.8.1 and (18.8.1)–(18.8.3),
pp. 644–645; Vilenkin–Klimyk Vol. 2 §10.1.4 (3), (5)–(8), pp. 166–168; Wawrzyńczyk §11.4
(11.4.1)–(11.4.5), pp. 402–403 (`n = 3`).

`helgasonFourier n f λ b`. Prove, for `n ≥ 2` and `f` smooth with compact support:
- **Inversion** (`helgasonFourier_inversion`): for `x ∈ ℍⁿ`,
  `f(x) = C_n ∫₀^∞ (∫ f̂(λ, b) [x, b̃]^{−iλ−ρ} dσ(b)) |c(λ)|⁻² dλ`;
- **Plancherel** (`helgasonFourier_plancherel`):
  `∫ |f|² dm = C_n ∫₀^∞ (∫ |f̂(λ, b)|² dσ(b)) |c(λ)|⁻² dλ`;
- **The transform diagonalizes `Δ`** (`helgasonFourier_hyperbolicLaplacian`):
  `(Δf)^(λ, b) = −(λ² + ρ²) f̂(λ, b)` for every `λ ∈ ℂ`;
- **Equivariance**: `(f ∘ g⁻¹)^(λ, b) = (g⁻¹ b̃)₀^{iλ−ρ} f̂(λ, g⁻¹ · b)`, that is
  `(f ∘ g⁻¹)^(λ, ·) = π_{−λ}(g) f̂(λ, ·)` with the representation of 3.4;
- the extension to a unitary `L²(ℍⁿ, m) ≅ L²((0, ∞) × S^{n−1}, C_n |c(λ)|⁻² dλ dσ)`;
- **The Paley–Wiener theorem**: `f ↦ f̂` maps the smooth functions supported in the ball
  `d(o, x) ≤ R` onto the functions `ψ(λ, b)`, smooth in `b` and entire in `λ`, with
  `sup_{λ, b} (1 + |λ|)^N e^{−R |Im λ|} |ψ(λ, b)| < ∞` for every `N`, such that
  `∫ [x, b̃]^{−iλ−ρ} ψ(λ, b) dσ(b)` is even in `λ` for every `x ∈ ℍⁿ`.

Proof route: for radial `f`, `f̂(λ, b) = Sf(λ)` by 3.1, and inversion is 4.1. In general apply the
radial case at each point to the radialization `y ↦ ∫_K f(g k y) dk` with `g o = x`, and use the
equivariance and Harish-Chandra's integral. The Laplacian: `Δ` is symmetric for `m` (2.3) and
`[·, b̃]^{iλ−ρ}` is the plane wave of 2.4 at `μ = ρ − iλ`, with `μ(μ − n + 1) = −(λ² + ρ²)`. The
Paley–Wiener theorem reduces to 1.3 and 4.2 through the equivariance (Wawrzyńczyk's proof).

**Checks.**
- For radial `f`, `f̂(λ, b) = Sf(λ)` for every `b`.
- `f̂(−iρ, b) = ∫ f dm` (the exponent is `0`).
- Negative control: dropping `|c(λ)|⁻²` from the inversion fails already for radial `f` on `ℍ³`,
  where `|c(λ)|⁻² = λ²`.

*Needs:* 2.3, 2.4, 3.1, 3.4, 4.1; 1.3 and 4.2 for the Paley–Wiener theorem. The order is
0.4 → 1.1 → 1.3 (Abel transform, Paley–Wiener) → 1.2 → 1.3 (discrete terms), and
2.2, 3.1, 4.1 → 4.2 → 4.3 (Paley–Wiener), with no cycle.

### 4.4 The hyperbolic plane and three-space

Sources: Wawrzyńczyk §11.3, (11.3.3)–(11.3.6), pp. 401–402; Klimyk–Vilenkin (EMS 59) Part II,
Ch. 5, §2.3, p. 232 (the Mehler–Fock transform).

Prove:
- `n = 2`: `S(F ∘ d)(λ) = 2π ∫₀^∞ F(t) P_{−1/2+iλ}(cosh t) sinh t dt`, `2π` times the Mehler–Fock
  transform of SpecialFunctionsSU11MatrixElements §5.2 at `ρ = λ`, and the inversion of 4.1 is that
  roadmap's Mehler–Fock inversion, since `C₂ |c^{(0,−1/2)}(λ)|⁻² = λ tanh(πλ)/(2π)`;
- `n = 3`: `S(F ∘ d)(λ) = (4π/λ) ∫₀^∞ F(t) sinh t sin λt dt`, with inversion
  `F(t) = (2π²)⁻¹ ∫₀^∞ S(F ∘ d)(λ) (sin λt/(λ sinh t)) λ² dλ`.

**Checks.**
- `n = 3`, `F(t) = e^{−t²}`: `∫ |f|² dm = 4π ∫₀^∞ e^{−2t²} sinh² t dt` and
  `(2π²)⁻¹ ∫₀^∞ |Sf(λ)|² λ² dλ` are both `2.55427 67443`.
- `n = 2`: `C₂ |c^{(0,−1/2)}(1.3)|⁻² = 0.20678 41277 = 1.3 tanh(1.3π)/(2π)`.
- Negative control: using `φ^{(0,0)}` for `ℍ²` without halving `t` gives the conical function of
  `cosh 2t`, not of `cosh t` (0.5).

*Needs:* 0.5, 4.1; SpecialFunctionsSU11MatrixElements §5.2.

### Examples

- Radial Gaussians on `ℍ³`, and the heat kernel of `ℍ³`,
  `(4πs)^{−3/2} (t/sinh t) e^{−s−t²/(4s)}`, whose spherical transform is `e^{−s(λ²+1)}`.

### Dependencies

Layers 1–3; Mathlib Fourier transform.

## Worked examples

- **`ℍ³` end to end.** `φ_λ(t) = sin λt/(λ sinh t)` (0.2), `c(λ) = 1/(iλ)` (0.3),
  `Sf(λ) = (4π/λ) ∫ F sinh t sin λt dt` (4.4), `𝒜F(s) = 2π ∫_{cosh s}^∞ F(arcosh u) du` (4.2), and
  the inversion constant `C₃ λ² = λ²/(2π²)` (4.1).
- **`SU(1,1)` matrix elements.** At `τ = 0.23 + 0.4i`,
  `𝔓^τ_{2,−1}(cosh 1.3) = (τ − 1)_3/3! · sinh³(0.65) cosh^{−1}(0.65) φ^{(3,−1)}_{i(2τ+1)}(0.65)`
  `= −0.01150 64149 − 0.01597 50333 i` (0.5).

## Downstream consumers

- Roadmaps on the harmonic analysis of complex, quaternionic and octonionic hyperbolic spaces,
  which use Layers 0–1 at their parameters `(α, β)`, and on the Selberg trace formula for
  hyperbolic manifolds of dimension `n ≥ 3`, which uses Layer 4; the same project plans them as
  sequels.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

0. **Jacobi functions** (0.1–0.5).
1. **The Jacobi transform** (1.1–1.3).
2. **Real hyperbolic space** (2.1–2.5).
3. **Spherical functions on `ℍⁿ`** (3.1–3.4).
4. **Harmonic analysis on `ℍⁿ`** (4.1–4.4).

The numbers are those of the layers, and `k.n` names subsection `n` of Layer `k`. `Suggested.lean`
states the headlines that carry a Lean name, each with every conclusion the README attaches to it;
it is not an exhaustive acceptance test, and the other headlines and the plain bullets of each
subsection are targets of the same standing, stated in prose. The **Checks** and Examples are
statements to prove; they test the conventions on explicit values.

**Boundary with SpecialFunctionsGroupModels.** That roadmap owns Gel'fand pairs, Gel'fand's
criterion, spherical functions with their functional equation, the spherical transform of a general
pair `(G, K)` with compact `K`, spherical functions of representations (its §§5.1–5.4) and
multiplier representations (its Layer 1). This roadmap consumes them, proves that
`(SO₀(n, 1), SO(n))` is a Gel'fand pair by the symmetric-pair criterion, and owns the rank-one
`c`-function and the inversion of the spherical transform, which that roadmap places beyond its
scope.

**Boundary with SpecialFunctionsSU11MatrixElements.** That roadmap owns the matrix elements
`𝔓^τ_{mn}` of `SU(1,1)` with their hypergeometric forms (its §§1.1–1.2), the Legendre and conical
functions as `𝔓^τ_{00}` (its §1.3), their bounds (its §2.1) and the Mehler–Fock transforms (its
§§5.2–5.3). This roadmap owns the Jacobi function for general `(α, β)` and the identification of
`𝔓^τ_{mn}` with it (0.5), the `c`-function, the general Jacobi transform, the Abel transform and
Koornwinder's product formula. It reads the Mehler–Fock transform as the instance `(0, −1/2)` of the
Jacobi transform and the spherical functions of `ℍ²` as conical functions through 0.5; it does not
reprove them.

**Boundary with [RealSemisimpleLieGroups](../RealSemisimpleLieGroups/README.md) and
[LieGroups](../RepresentationTheory/LieGroups/README.md).** Those roadmaps own the structure theory
of a general real reductive group and its symmetric space: Cartan involutions, the Iwasawa and
`KAK` decompositions (LieGroups Layer 9), the Riemannian symmetric space `G/K` (RealSemisimpleLieGroups
§§5.2–5.3) and complex hyperbolic space as geometry (its §5.7). They exclude spherical functions
and harmonic analysis on `G/K`. This roadmap builds `ℍⁿ` concretely in coordinates, with the
decompositions it needs proved by matrix computation, and records the comparison with
RealSemisimpleLieGroups §5.2 in 2.1.

**Boundary with [RiemannianGeometry](../RiemannianGeometry/README.md).** Its R4.7 owns the
hyperboloid model of hyperbolic space as a Riemannian manifold: the metric restricted from the
Lorentz form, explicit isometries, geodesics, curvature `−1`, the Riemannian distance, and the
identification of the isometry group with `O⁺(n, 1)` acting on the future unit hyperboloid. This
roadmap owns the coordinate set `ℍⁿ` with the matrix group `SO₀(n, 1)`, the formula
`d = arcosh [·, ·]`, the volume in the chart and in polar and horospherical coordinates, the
wave-operator form of the Laplacian and the harmonic analysis; it compares its distance, volume
and Laplacian with R4.7's metric in 2.1–2.3.

**Boundary with [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md).** Its M4 and
M4.Lorentz own the principal and complementary series of `SL(2, ℝ)` and `SL(2, ℂ)` with their
irreducibility and classification. This roadmap consumes them for `n = 2, 3` and owns the spherical
principal and complementary series of `SO₀(n, 1)` on `L²(S^{n−1})` for general `n`.

**Boundary with [AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md) and
[AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md).** AutomorphicSpectralTheory
§§0.35–0.37 own the Legendre function `Q_{s−1}` and point-pair invariants on the upper half-plane;
AnalyticNumberTheoryPartII §6.12c uses inverse Abel transforms for the heat-kernel trace on a
compact hyperbolic surface. Neither depends on this roadmap. This roadmap consumes from
AutomorphicSpectralTheory only the Euclidean Paley–Wiener theorem of its §1.6, on `ℝ`, and nothing
from AnalyticNumberTheoryPartII; the Abel transform of 4.2 at `n = 2` is the general object of
which their formulas are instances.

**Boundary with [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)
and [LaguerreJacobi](../LaguerreJacobi/README.md).** The first owns `F(a, b; c; z)` on the cut
plane with its continuation, elementary cases, linear and quadratic transformations, and excludes
the relations of DLMF §15.9 to the Jacobi functions (15.9.11–15.9.14), which this roadmap owns. The
second owns the Jacobi polynomials `P_k^{(α,β)}` (its §3.2), consumed in 0.1.

## Exact supplier contracts

### From Mathlib

- `Real.arcosh`, `Complex.Gamma`, `ascPochhammer`, `iteratedDeriv`,
  `Matrix.SpecialLinearGroup` with its topology, `MeasureTheory.Measure.toSphere`,
  `MeasureTheory.average`, `MeasureTheory.Lp`, `MeasureTheory.Measure.IsHaarMeasure`,
  `LinearIsometryEquiv`, the Fourier transform on `ℝ`.

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- Layer 1: the principal branches `𝐅` and `F = Γ(c) 𝐅` on the cut plane, for all parameters;
  `Suggested.lean` carries verbatim local copies of Euler's integral, the continuation predicate,
  `𝐅` and `F`. Layer 3 (the hypergeometric equation) and §1.3 (terminating series) in 0.1.
- §4.1 (DLMF 15.4.11 and 15.4.15 with argument `−z²`, on `1 + z² ∈ slitPlane`) in 0.2; §7.1 (the
  quadratic transformation with `c = (a + b + 1)/2`) in 0.2; §5.1 (DLMF 15.8.2 on
  `−z ∈ slitPlane`, and Pfaff's transformation 15.8.1) in 0.3; §5.1 (Euler's transformation
  15.8.1) in 1.2.

### From [LaguerreJacobi](../LaguerreJacobi/README.md)

- §3.2: the Jacobi polynomial `P_k^{(α,β)}` by its explicit sum (DLMF 18.5.8), in 0.1;
  `Suggested.lean` carries a verbatim local copy (`jacobi`).

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- §1.3 (the asymptotics of `log |Γ(σ + it)|` on vertical strips), in the growth bound of 0.3.

### From SpecialFunctionsGamma

- §10.1: Carlson's theorem, for `f` holomorphic on `{Re z > 0}` and continuous on `{Re z ≥ 0}`,
  with `|f(z)| ≤ C e^{τ|z|}` there and `|f(iy)| ≤ C e^{c|y|}` for real `y` with `c < π`: if
  `f(n) = 0` for every `n ∈ ℕ`, then `f = 0` on `{Re z ≥ 0}`. In 0.4, for the Laplace-type
  representation and the product formula.

### From [AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md)

- §1.6: the Euclidean Paley–Wiener theorem, on `𝔞 = ℝ` with `R ≥ 0`: the Fourier–Laplace
  transform `ĥ(μ) = ∫ h(s) e^{−μs} ds` maps the smooth functions supported in `[−R, R]` onto the
  entire functions with `sup_μ e^{−R |Re μ|} (1 + |μ|)^N |ĥ(μ)| < ∞` for every `N`, with the
  inversion formula on every vertical line. Read at `μ = −iλ` in 1.3, and through 1.3 in the
  surjectivity of 1.2 and in 4.2 and 4.3.

### From [OperatorTheory/UnboundedOperators](../OperatorTheory/UnboundedOperators/README.md)

- §4.8: for the Sturm–Liouville expression `τu = w⁻¹(−(pu′)′ + qu)` on an open interval, with
  real measurable `p, q, w`, `p, w > 0` almost everywhere and `p⁻¹, q, w` locally integrable: the
  maximal operator on `L²(w dx)`, the minimal operator (the closure on the compactly supported
  functions of the maximal domain), closed, densely defined and symmetric with the maximal
  operator as adjoint; Green's formula with the Wronskian `W_x(u, v) = p(uv′ − u′v)(x)`; Weyl's
  alternative at each endpoint (limit circle when every solution of `(τ − z)u = 0` is
  square-integrable near it, for every `z`; limit point when for every nonreal `z` those solutions
  form a line), independent of `z`; equal deficiency indices, equal to the number of limit-circle
  endpoints; and the self-adjoint boundary conditions by Wronskian boundary functionals, through
  §4.5. In the spectral representation of 1.2, with `p = w = Δ`, `q = 0` and `τ = −L`.
- Layer 1, §1.7: for a measure `μ` and a measurable `h`, the multiplication by `h` on `L²(μ)` with
  the maximal domain `{u : h u ∈ L²(μ)}` is closed and densely defined, and self-adjoint for `h`
  real almost everywhere. In the spectral representation of 1.2, with `h(λ) = −(λ² + ρ²)`.

### From SpecialFunctionsGroupModels

- §5.1: bi-invariance, convolution, Gel'fand pairs, and the symmetric-pair criterion
  (continuous involutive automorphism fixing a compact `K` with `G = K P` on a unimodular locally
  compact group), in 2.5. §5.2: spherical functions (continuous, bi-invariant, value `1` at `1`,
  the functional equation for a measure `ν` on `K`; no boundedness) and multiplicativity of the
  spherical transform, in 3.2 and 4.1. §5.3: spherical functions from representations with a
  one-dimensional `K`-fixed space and their uniqueness up to equivalence, in 3.3–3.4. §5.4: the
  spherical functions of a connected Lie group are analytic joint eigenfunctions of the invariant
  differential operators, in 3.2. `Suggested.lean` carries verbatim local copies of its definitions
  of bi-invariance, convolution, Gel'fand pairs and spherical functions.
- Layer 1: multiplier cocycles, the multiplier representation on `L²` and its unitarity criterion,
  in 3.4. §2.1: the principal series of `SU(1,1)` on the circle, in a Check of 3.4.

### From SpecialFunctionsSU11MatrixElements

- §1.1: the function `𝔓^τ_{mn}(cosh t)` as a circle integral; `Suggested.lean` carries a verbatim
  local copy. §1.2: its `−sinh²` hypergeometric form, in 0.5. §1.3: Laplace's integral, which makes
  `𝔓^τ_{00}(cosh t)` the Legendre function `P_τ(cosh t)` and at `τ = −1/2 + iρ` the conical
  function, in 0.5. §2.1: the bound `|𝔓^τ_{mn}| ≤ 1` on `Re τ = −1/2`, in a Check of 3.3. §5.2:
  the Mehler–Fock transform with the density `ρ tanh(πρ)` and its inversion, in Checks of 1.2 and
  in 4.4.

### From [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md)

- M4 and M4.Lorentz: irreducibility and equivalences of the principal series of `SL(2, ℝ)` and
  `SL(2, ℂ)`, in 3.4 for `n = 2, 3`.

### From [RealSemisimpleLieGroups](../RealSemisimpleLieGroups/README.md)

- §5.2: the symmetric space `G/K` of `G = SO₀(n, 1)`, in the last bullet of 2.1.

### From [RiemannianGeometry](../RiemannianGeometry/README.md)

- R4.7: the hyperboloid model as a Riemannian manifold (the metric restricted from the Lorentz
  form, its Riemannian distance and geodesics) and its isometry group `O⁺(n, 1)` acting on the
  future unit hyperboloid, in the comparison bullets of 2.1–2.3.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap's scope, real hyperbolic space and the
one-variable Jacobi analysis. It is recorded only to fix the boundary. Contributors should not
attempt it under this roadmap.

- **Complex, quaternionic and octonionic hyperbolic spaces** `SU(n, 1)/U(n)`,
  `Sp(n, 1)/(Sp(n) × Sp(1))` and `F₄₍₋₂₀₎/Spin(9)`: their Laplacians, spherical functions and Fourier transforms. Their
  geometry belongs to the structure theory of RealSemisimpleLieGroups (§5.7 for the complex case);
  their spherical functions are Jacobi functions with `(α, β) = (n − 1, 0)`, `(2n − 1, 1)` and
  `(7, 3)` in the radius `t`, whose radial analysis Layers 0–1 supply (for `U(n − 1, 1)`,
  Vilenkin–Klimyk Vol. 2 §11.4.1 (4)–(5), pp. 332–333).
- **Pseudo-Riemannian hyperboloids** `X_{p,q}` and their discrete series (Heckman–Schlichtkrull
  Part II, Examples 8.1 and 8.3).
- **Higher-rank spherical functions**, Harish-Chandra's `c`-function in general and the
  Gindikin–Karpelevich formula (Wawrzyńczyk §18.5).
- **Jacobi functions of the second kind** and the Jacobi transform of non-even functions.
- **Heat kernels and wave equations** on `ℍⁿ` for general `n`.

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
proves the following targets without `sorry`, against Mathlib and the lean-DLMF Jacobi function
(lean-DLMF's Jacobi function, written there as `Γ(α + 1) 𝐅(…)` with complex radius, the same
function), at commit `2a512fe`. The roadmap reuses its conventions and names; its modules are a cited
source, not the specification.

- §0.1: `jacobiFunction_zero`, `jacobiFunction_even`, `jacobiFunction_neg_spectral`,
  `jacobiFunction_I_mul_rho`, `differentiable_jacobiFunction`, `jacobiOperator_jacobiFunction`,
  and the polynomial case for lean-DLMF's Jacobi polynomial (`SFVK/RankOne/JacobiIdentities.lean`,
  definitions in `SFVK/RankOne/Basic/Jacobi.lean`).
- §0.2: `jacobiFunction_cos`, `jacobiFunction_sin`, `jacobiFunction_quadratic`
  (`SFVK/RankOne/JacobiIdentities.lean`).
- §0.3: `jacobiOperator_harishChandraSeries` (`SFVK/RankOne/HarishChandra.lean`),
  `tendsto_harishChandraSeries`, `jacobiFunction_eq_cFunction`, `tendsto_jacobiFunction_mul_exp`
  (`SFVK/RankOne/JacobiAsymptotics.lean`), `cFunction_neg_I_mul_rho`
  (`SFVK/RankOne/Basic/Jacobi.lean`), `exists_norm_cFunction_inv_sq_le`
  (`SFVK/RankOne/JacobiDensity.lean`).
- §0.4: `norm_jacobiFunction_le_one`, `norm_jacobiFunction_le_exp`, `bddAbove_jacobiFunction_iff`
  (`SFVK/RankOne/JacobiEstimates.lean`).
- §0.5: `jacobiFunction_zero_zero_eq_boostMatrixElement` (`SFVK/RankOne/JacobiIdentities.lean`).
- §1.1: `jacobiTransform_neg`, `differentiable_jacobiTransform`, `norm_jacobiTransform_le`,
  `jacobiTransform_jacobiOperator` (`SFVK/RankOne/JacobiTransform.lean`).
- §§2.1–2.4: `exists_orbitMap_eq`, `hyperbolicDist_mulVec`, `lintegral_hyperbolicMeasure_radial`,
  `hyperbolicLaplacian_radial`, `hyperbolicLaplacian_planeWave`, `hyperbolicLaplacian_poisson`
  (`SFVK/RankOne/Hyperbolic.lean`), `map_hyperbolicMeasure`, `hyperbolicLaplacian_comp`
  (`SFVK/RankOne/LorentzInvariance.lean`), `lintegral_hyperbolicMeasure_horospherical`
  (`SFVK/RankOne/Horospherical.lean`); definitions in `SFVK/RankOne/Basic/Hyperbolic.lean`.
- §§3.1–3.2, 4.1–4.2: `hyperbolicLaplacian_sphericalFunction`,
  `sphericalFunction_comp_orbitMap_eq_iff`, `sphericalTransform_radial`, `abelTransform_neg`,
  `abelTransform_two` (`SFVK/RankOne/Spherical.lean`).

## References

- M. Flensted-Jensen, Paley–Wiener type theorems for a differential operator connected with
  symmetric spaces, *Ark. Mat.* 10 (1972), 143–162, doi:10.1007/BF02384806 (cited after
  Klimyk–Vilenkin, p. 234).
- G. Heckman and H. Schlichtkrull, *Harmonic Analysis and Special Functions on Symmetric Spaces*,
  Perspectives in Mathematics 16, Academic Press, 1994: Part I §5.4, pp. 83–84, Lemma 5.5.2, p. 85;
  Part II, Lecture 8, Examples 8.1 and 8.3, pp. 171–172 and 181–182.
- A. U. Klimyk and N. Ja. Vilenkin, *Representations of Lie Groups and Special Functions*, in
  A. A. Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*,
  Encyclopaedia of Mathematical Sciences 59, Springer, 1995, Part II, Ch. 5, §§2.3–2.4,
  pp. 232–234.
- T. H. Koornwinder, A new proof of a Paley–Wiener type theorem for the Jacobi transform,
  *Ark. Mat.* 13 (1975), 145–159, doi:10.1007/BF02386203 (cited after Klimyk–Vilenkin, p. 234).
- T. H. Koornwinder, Jacobi functions and analysis on noncompact semisimple Lie groups, in
  R. A. Askey, T. H. Koornwinder and W. Schempp (eds.), *Special Functions: Group Theoretical
  Aspects and Applications*, Reidel, 1984, pp. 1–85 (the source to which DLMF 15.9(ii) and the
  books above refer; cited after them).
- NIST Digital Library of Mathematical Functions, §§15.4, 15.8, 15.9(ii),
  https://dlmf.nist.gov/15.9#ii.
- N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*, Vol. 2,
  Kluwer, 1993: §§9.1.1, 9.1.5, 9.1.8, 9.1.9, pp. 2, 12–13, 20–23; §§9.2.1, 9.2.6–9.2.8,
  pp. 25–26, 35, 39–40; §9.3.2, pp. 47–48; §9.4.10, pp. 92–93; §10.1.4, pp. 166–168; §§11.4.1 and
  11.4.6, pp. 332–333 and 348–350.
- A. Wawrzyńczyk, *Group Representations and Special Functions*, Reidel and PWN, 1984: Ch. 11,
  §§11.1–11.5, 11.7, pp. 389–419; Ch. 18, §§18.1, 18.3, 18.5–18.8, pp. 610–645.

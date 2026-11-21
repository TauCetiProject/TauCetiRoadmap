# Roadmap: matrix elements of SU(1,1), addition theorems and the Mehler–Fock transform

**Summary.** The representations of `SU(1,1)`, equivalently of `SL(2, ℝ)`, have matrix elements
that are classical functions of hypergeometric type, and the group law, unitarity and the Lie
algebra turn into identities for those functions. The central object is Vilenkin and Klimyk's
function `𝔓^τ_{mn}(cosh t)`, the matrix element of the principal series of degree `τ` between
weight vectors on the boost of rapidity `t`, defined here by a circle integral for every complex
`τ` and real weights `m`, `n` with `m − n` an integer. The roadmap proves that it is a Gauss
hypergeometric function in `tanh²(t/2)` and in `−sinh²(t/2)`, the Legendre function `P_τ(cosh t)`
when `m = n = 0`, an associated Legendre function in its first column, and a Jacobi polynomial at
integral and half-integral degree and on the discrete series. From the representation it derives
the symmetries in the indices and the degree, the unitarity relations of the principal,
complementary and discrete series, the addition and multiplication theorems with the product
formula of the triangle kernel, the generating functions and the convolution in the degree, the
first-order and three-term recurrences, the matrix elements on the other one-parameter subgroups,
and the Mehler–Fock transform with its Parseval identity and inversion, of order `0` and of every
integer order.

The nearest roadmaps are SpecialFunctionsGroupModels, which builds the function-space models of
`SU(1,1)`, the general matrix elements and their addition theorem, and which this roadmap reads in
explicit functions; SpecialFunctionsSU2MatrixElements, the compact analogue, whose functions
`d^j` are the analytic continuation of the `𝔓^ℓ` at integral and half-integral degree;
SpecialFunctionsLegendre, which owns the functions `P^μ_ν` that the first column of `𝔓^τ`
reproduces; [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) and
[LaguerreJacobi](../LaguerreJacobi/README.md), which supply the Gauss function and the Jacobi
polynomials; and [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md), which owns
the unitary dual and the Plancherel theorem of `SL(2, ℝ)` from which the Mehler–Fock transform is
deduced.

Layer 1 defines `𝔓^τ_{mn}` and proves its closed forms and symmetries. Layer 2 reads the unitary
series, Layer 3 the group law, Layer 4 the Lie algebra, and Layer 5 the other one-parameter
subgroups and the Plancherel theorem. The roadmap is a synthesis of Vilenkin and Klimyk, of
Wawrzyńczyk, of Dieudonné and of Miller; it follows none of them in its organization and orders
the material by proof dependency, and most subsections cite several of them.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines, with
their Lean names where `Suggested.lean` states them, a source locator for a headline that restates
a source result and a proof route for a corollary or an adaptation, and Checks, which are sanity
checks of the key definitions and theorems; a negative control is a case that a plausible wrong
convention or a dropped hypothesis gets wrong. `Suggested.lean` states the headlines that carry a
Lean name, each with every conclusion the README attaches to it; it is not an exhaustive
acceptance test, and the other headlines are targets of the same standing, stated in prose.

Layer 1 is the analysis of one explicit integral. The identification with the principal series
(1.1) is a change of variables on the circle; everything else in Layer 1 is classical analysis of
the integral: the binomial series gives the hypergeometric forms, the halving of the range gives
Laplace's integral, and the substitutions `θ ↦ −θ`, `θ ↦ θ + π` give the index symmetries and
parity. The symmetries that change `τ` or transpose the indices come from the hypergeometric form,
or from the Hermitian adjoint and the intertwiners of SpecialFunctionsGroupModels §2.1, extended by
holomorphy in `τ`. Layer 2 uses unitarity: the sums of squares are Parseval for unit vectors. Layer
3 uses the addition theorem of SpecialFunctionsGroupModels §3.2 on the Euler angles of a product,
and the Fourier series of the integrand of 1.1. Layer 4 differentiates the addition theorem at the
identity. Layer 5 is the hardest: the Mehler–Fock transform restricts the Plancherel theorem of
NoncompactQuantumSymmetry M4.P to one `K`-type. Within the layers: 1.2–1.5 use 1.1; 1.4 uses 1.2;
2.1 uses 1.3–1.4; 2.2 uses 1.2 and 1.4; Layer 3 uses 1.1 and 1.3; 4.1 uses 1.2 and 1.5 and 4.2
uses 1.4 and 4.1; 5.1 uses 1.1; 5.2 uses 1.3, 1.4 and 2.1, and 5.3 uses 5.2.

## Conventions

- **Groups, angles and matrix elements** are those of SpecialFunctionsGroupModels (§0.1, §3.1):
  `SU(1,1)` is the group `SU11` of matrices `[[a, b], [conj b, conj a]]` with `|a|² − |b|² = 1`;
  `g(α, t, γ) = k_α b_t k_γ` (`SU11.euler`) with `k_α = diag(e^{iα/2}, e^{−iα/2})`
  (`SU11.rotation`) and `b_t = [[cosh(t/2), sinh(t/2)], [sinh(t/2), cosh(t/2)]]` (`SU11.boost`);
  `D_{m'm}(g) = ⟪e_{m'}, U(g) e_m⟫` (`matrixElement`), conjugate-linear in the first slot.
- **The principal series** `T_{(τ,ε)} = principalSeries τ e`, `e = 2ε ∈ {0, 1}`, acts on `L²` of
  the circle `𝕋 = ℝ/2πℤ`; its weight vectors are the functions `e^{inθ}` of `fourierBasis`, of
  weight `m = n − e/2`, so that `T(k_α) e_m = e^{imα} e_m`. The indices `m`, `n` of `𝔓^τ_{mn}` are
  weights: real numbers with `m − n ∈ ℤ`, integers for `e = 0` and half-odd-integers for `e = 1`.
  Identities that hold for every real `n` with `m = n + k`, `k ∈ ℤ`, are stated so.
- **The function `𝔓^τ_{mn}(cosh t)`** is `SU11.boostMatrixElement τ m n t`, a function of `t ∈ ℝ`
  rather than of `cosh t`, defined for every `τ ∈ ℂ` and real `m`, `n` by
  `(2π)⁻¹ ∫₀^{2π} A(θ)^{τ+n} A(−θ)^{τ−n} e^{i(m−n)θ} dθ`, where
  `A(θ) = cosh(t/2) + sinh(t/2) e^{iθ}`, with principal powers. Both bases have real part at least
  `cosh(t/2) − |sinh(t/2)| > 0`, so the powers are continuous and the definition has no junk
  values. For `t ≥ 0` this is the `𝔓^τ_{mn}(cosh t)` of [VK, §6.5.4 (1), p. 314], [D, §14 (174),
  p. 50] and [W, (10.2.14), p. 357]. Identities are stated for all real `t` where they hold there;
  parity (1.1) converts `t < 0` to `t > 0`.
- **Labels of the sources.** [VK] label the basis of the circle model by `e^{−ikθ}` and write
  `T(g(φ, t, ψ))_{mn} = e^{−i(mφ+nψ)} 𝔓^τ_{mn}(cosh t)` [VK, §6.5.2 (5), p. 313]. In the labels here
  the same functions `𝔓^τ_{mn}` appear with the phase `e^{+i(m'α+mγ)}` (SpecialFunctionsGroupModels
  §3.3): the relabelling `k ↦ −k` and the reflection `θ ↦ −θ` of the integral cancel. Formulas of
  [VK] that contain the phases are transported by this rule; formulas in `𝔓^τ_{mn}` alone are used
  as printed.
- **Gamma factors.** Identities of the sources with quotients of Gamma functions are stated
  without junk values: with Mathlib's reciprocal `(Complex.Gamma x)⁻¹`, which is entire and is `0`
  at the poles, or with the Pochhammer polynomial `(x)_k`, `ascPochhammer` evaluated at `x`, in
  place of `Γ(x + k)/Γ(x)`.
- **Hypergeometric functions.** `F(a, b; c; x)` for `|x| < 1` is Mathlib's
  `ordinaryHypergeometric`; on the cut plane it is `Γ(c)` times the regularized Gauss function of
  SpecialFunctionsHypergeometric (its Layer 1). The `tanh²(t/2)` forms need only the disc.
- **Transforms** are written in the variable `t > 0` with the measure `sinh t dt`
  (`SU11.sinhMeasure`), the image of `dx` on `(1, ∞)` under `x = cosh t`, and with the spectral
  parameter `ρ > 0`, `τ = −1/2 + iρ`, and the measure `ρ tanh(πρ) dρ` (`SU11.plancherelMeasure`).
- Square brackets `[z^j] f` denote the coefficient of `z^j` in the Taylor series of `f` at `0`.

## Layer 1: the functions `𝔓^τ_{mn}`

### 1.1 Definition and the principal series

Sources: [VK, §6.5.1 (1)–(4), p. 311; §6.5.2 (1)–(5), pp. 312–313; §6.5.4 (1), p. 314];
[D, §14 (170)–(174), pp. 49–50]; [W, (10.2.13)–(10.2.15), p. 357]; [M, (5.159), p. 227;
(5.164), p. 231].

Prove:
- **Principal-series matrix elements** (`SU11.principalSeries_matrixElement_euler_eq`): for every
  `τ ∈ ℂ`, `e`, integers `n'`, `n` and real `α`, `t`, `γ`, with `m' = n' − e/2`, `m = n − e/2`,
  `D_{m'm}(g(α, t, γ)) = e^{i(m'α + mγ)} 𝔓^τ_{m'm}(cosh t)`, where `D` is
  `matrixElement (principalSeries τ e) fourierBasis` at the labels `n'`, `n`; at `α = γ = 0` this
  is `D_{m'm}(b_t) = 𝔓^τ_{m'm}(cosh t)`;
- **Value at the identity** (`SU11.boostMatrixElement_zero`): `𝔓^τ_{n+k,n}(1) = δ_{k0}` for real
  `n` and `k ∈ ℤ`;
- **Holomorphy in the degree** (`SU11.differentiable_boostMatrixElement_degree`):
  `τ ↦ 𝔓^τ_{mn}(cosh t)` is entire;
- **Real analyticity in `t`** (`SU11.contDiff_boostMatrixElement_radius`): `t ↦ 𝔓^τ_{mn}(cosh t)`
  is real analytic on `ℝ`;
- **Parity** (`SU11.boostMatrixElement_neg`): the value of `𝔓^τ_{n+k,n}` at `−t` is `(−1)^k` times
  its value at `t`;
- `𝔓^τ_{n+k,n}(cosh t)` is the `k`th Fourier coefficient of `θ ↦ A(−θ)^{τ+n} A(θ)^{τ−n}`, so the
  functions with fixed `τ`, `n`, `t` determine the integrand (3.3).

The matrix element is `(2π)⁻¹ ∫ e^{−in'θ} |u|^{2τ} (u/|u|)^e e^{inθ'} dθ` with
`u = sinh(t/2) e^{iθ} + cosh(t/2)` and `e^{iθ'} = (cosh(t/2) e^{iθ} + sinh(t/2))/u`. On the circle
`|u|² = u ū` and `cosh(t/2) e^{iθ} + sinh(t/2) = e^{iθ} ū`, and the principal powers of `u` and `ū`
multiply, their arguments lying in `(−π/2, π/2)`; so the integrand is
`(cosh(t/2) + sinh(t/2) e^{iθ})^{τ−m} (cosh(t/2) + sinh(t/2) e^{−iθ})^{τ+m} e^{i(m−m')θ}`, and the
substitution `θ ↦ −θ` gives the definition. The Euler phase is SpecialFunctionsGroupModels §3.3.
Holomorphy and analyticity are differentiation under the integral; parity is the substitution
`θ ↦ θ + π`, since `sinh(−t/2) e^{iθ} = sinh(t/2) e^{i(θ+π)}`.

**Checks.**
- `𝔓^τ_{2,−1}(cosh 1.3) = −0.01150 64149 − 0.01597 50333 i` at `τ = 0.23 + 0.4i`, and the
  circle-model matrix element `D_{2,−1}(b_{1.3})` of `principalSeries τ 0` agrees to `10⁻³⁰`; so
  do `(n', n) = (0, 0), (1, 3), (−2, 2)` for both `e`.
- The factorization holds to `10⁻³⁰` at `(α, t, γ) = (0.7, 1.3, −2.1)` for `(n', n) = (2, −1)`,
  `e = 0`, and for `(n', n) = (2, −1)`, `e = 1` (weights `3/2`, `−3/2`).
- Negative control: at `(n', n) = (2, −1)`, `e = 0`, the phase is `m'α + mγ = 3.5`, and the phase
  `e^{−i(m'α + mγ)} = −0.93646 + 0.35078 i` of [VK] read in the labels here, in place of
  `e^{i(m'α + mγ)} = −0.93646 − 0.35078 i`, breaks the factorization.
- At `τ = 1`: `𝔓^1_{00}(cosh t) = cosh t`, `𝔓^1_{10}(cosh t) = sinh t / 2`,
  `𝔓^1_{01}(cosh t) = sinh t`; at `τ = 1/2`: `𝔓^{1/2}_{1/2,1/2}(cosh t) = cosh(t/2)` and
  `𝔓^{1/2}_{−1/2,1/2}(cosh t) = sinh(t/2)`.
- The definition at non-integral `n = 0.3`, `m = 1.3` agrees with the hypergeometric form of 1.2.
- Negative control for parity: the value of `𝔓^τ_{2,−1}` at `t = −1.3` is
  `+0.01150 64149 + 0.01597 50333 i`, the negative of the value at `t = 1.3`.

*Needs:* SpecialFunctionsGroupModels §§0.1, 2.1, 3.1, 3.3; Mathlib `fourierBasis`.

### 1.2 Hypergeometric forms

Sources: [VK, §6.5.3 (1)–(3), p. 313; (1′), p. 314; §6.5.1 (5)–(7), p. 312]; [M, (5.159),
p. 227].

Prove, for real `n`, `m = n + k` and `k ∈ ℕ`:
- **The `tanh²` form** (`SU11.boostMatrixElement_eq_hypergeometric`):
  `𝔓^τ_{mn}(cosh t) = (τ − m + 1)_k / k! · cosh^{2τ}(t/2) tanh^k(t/2) F(t)` with
  `F(t) = F(−τ − n, −τ + m; k + 1; tanh²(t/2))`;
  for `m − n = −k` the sign reversal of 1.4 reduces to this case;
- **The `−sinh²` form**: `𝔓^τ_{mn}(cosh t) = (τ − m + 1)_k / k! · sinh^k(t/2) cosh^{−(m+n)}(t/2) G`
  with `G = F(−τ − n, τ − n + 1; k + 1; −sinh²(t/2))`, the Gauss function on the cut plane of
  Conventions, by Pfaff's transformation (SpecialFunctionsHypergeometric 5.1) from the `tanh²`
  form. The two upper parameters `−τ − n` and `τ − n + 1` are exchanged by `τ ↦ −τ − 1`.

The binomial series of both factors of the integrand, integrated term by term, give a double sum
whose diagonal is the hypergeometric series in `tanh²(t/2)` after Euler's transformation. The
Pochhammer factor replaces the quotient `Γ(τ − n + 1)/Γ(τ − m + 1)` of [VK] and is the polynomial
`(τ − m + 1) ⋯ (τ − n)`, so the statement has no junk at the poles.

**Checks.**
- At `τ = 0.23 + 0.4i`, `t = 1.3` the `tanh²` form agrees with the integral to `10⁻³⁰` for
  `(m, n) = (2, −1), (0, 0), (5/2, 1/2), (3, 3), (1.3, 0.3)`, and so does the `−sinh²` form; both
  agree also at `t = −1.3`.
- At `m = n = 0`: `𝔓^τ_{00}(cosh t) = cosh^{2τ}(t/2) F(−τ, −τ; 1; tanh²(t/2))`.
- Negative control: the factor `Γ(τ + m + 1)/Γ(τ + n + 1)` in place of `(τ − m + 1)_k` gives at
  `(m, n) = (2, −1)` the value `−0.00166 47647 + 0.05137 79018 i`, which is `𝔓^τ_{−1,2}`, the
  transposed element (1.4), not `𝔓^τ_{2,−1}`.

*Needs:* 1.1; Mathlib `ordinaryHypergeometric`, `ascPochhammer`;
SpecialFunctionsHypergeometric Layer 1 and 5.1.

### 1.3 Legendre and conical functions

Sources: [VK, §6.5.7 (1)–(4), pp. 322–323; §6.5.10 (1)–(2), pp. 325–326]; [D, §13 (150), p. 44;
§14 (175), p. 50]; [W, p. 357] (the Legendre function as `𝔓^ζ_{00}` and its Laplace integral).

Prove:
- **Laplace's integral** (`SU11.boostMatrixElement_zero_zero`):
  `𝔓^τ_{00}(cosh t) = π⁻¹ ∫₀^π (cosh t + sinh t cos φ)^τ dφ` for real `t`; so `𝔓^τ_{00}(cosh t)`
  is the Legendre function `P_τ(cosh t)` by SpecialFunctionsLegendre 8.2, and at `τ = −1/2 + iρ`
  the conical function `P_{−1/2+iρ}(cosh t)`;
- **Associated Legendre functions**: for an integer `m` and `t > 0`,
  `𝔓^τ_{m0}(cosh t) / Γ(τ + 1) = P^{−m}_τ(cosh t) / Γ(τ − m + 1)` with reciprocal Gamma functions,
  where `P^μ_ν` is SpecialFunctionsLegendre's function on `(1, ∞)` (its 1.1); off the poles this is
  `𝔓^τ_{m0} = Γ(τ + 1)/Γ(τ − m + 1) · P^{−m}_τ` [VK, §6.5.10 (2), p. 326];
- **Zonal and associated spherical functions**: `g ↦ 𝔓^τ_{00}(cosh t)` is the spherical function of
  `principalSeries τ 0` for `(SU(1,1), K)` in the sense of SpecialFunctionsGroupModels §5.2, and
  `g(α, t, γ) ↦ e^{imα} 𝔓^τ_{m0}(cosh t)` are its associated spherical functions.

Laplace's integral is the definition at `m = n = 0`: the product of the two conjugate factors is
`(cosh t + sinh t cos θ)^τ`, and the symmetry `θ ↦ 2π − θ` halves the range. The associated
Legendre form is the `−sinh²` form of 1.2 compared with SpecialFunctionsLegendre's hypergeometric
definition of `P^μ_ν`.

**Checks.**
- `𝔓^{−1/2+0.8i}_{00}(cosh 0.9) = 0.83316 90033`, the value of `P_{−1/2+0.8i}(cosh 0.9)`.
- At `τ = 0.23 + 0.4i`, `t = 1.3`, `m = 1, 2, −1`: the quotient `𝔓^τ_{m0}/P^{−m}_τ` is
  `0.23 + 0.4i`, `−0.3371 − 0.216i`, `0.73525 01644 − 0.23910 57445 i`, the values of
  `Γ(τ + 1)/Γ(τ − m + 1)`.
- Negative control: with `P^{m}_τ` in place of `P^{−m}_τ` the quotient at `m = 1` is
  `0.73525 01644 − 0.23910 57445 i`, not `Γ(τ + 1)/Γ(τ) = 0.23 + 0.4i`.
- `𝔓^0_{00} = 1`, and `𝔓^1_{00}(cosh t) = cosh t = P_1(cosh t)`.

*Needs:* 1.1–1.2; SpecialFunctionsLegendre 1.1 and 8.2; SpecialFunctionsGroupModels §5.2.

### 1.4 Symmetries

Sources: [VK, §6.5.5 (1)–(9), pp. 318–320]; [M, (5.161)–(5.163), pp. 228–229] (the matrix of
`g⁻¹`).

Prove, for real `n`, `m = n + k` and `k ∈ ℤ`:
- **Sign reversal** (`SU11.boostMatrixElement_neg_neg`): `𝔓^τ_{−m,−n} = 𝔓^τ_{mn}`;
- **Transposition** (`SU11.boostMatrixElement_swap`):
  `𝔓^τ_{mn} / (Γ(τ + n + 1) Γ(τ − n + 1)) = 𝔓^τ_{nm} / (Γ(τ + m + 1) Γ(τ − m + 1))`, with
  reciprocal Gamma functions;
- **Reflection of the degree** (`SU11.boostMatrixElement_reflect`):
  `𝔓^{−τ−1}_{mn} / (Γ(τ − m + 1) Γ(τ + m + 1)) = (−1)^k 𝔓^τ_{mn} / (Γ(τ − n + 1) Γ(τ + n + 1))`,
  with reciprocal Gamma functions;
- **Conjugation** (`SU11.conj_boostMatrixElement`): `conj 𝔓^τ_{mn} = 𝔓^{conj τ}_{mn}`;
- `𝔓^τ_{mn}` is real for real `τ`, and `𝔓^{−1/2+iρ}_{mm}` is real, by conjugation and reflection.

Sign reversal is `θ ↦ −θ`, and conjugation is conjugating the integrand followed by `θ ↦ −θ`.
Transposition and reflection follow from the `tanh²` form of 1.2 and Euler's transformation, or
from the inverse of SpecialFunctionsGroupModels §3.2 with the Hermitian adjoint of §2.1 and from
the intertwiner between `T_{(τ,ε)}` and `T_{(−τ−1,ε)}` [VK, §6.5.5 (3), p. 318], for `τ` off the
poles, and then everywhere by holomorphy (1.1).

**Checks.**
- At `τ = 0.23 + 0.4i`, `t = 1.3`: `𝔓^τ_{−1,2} = −0.00166 47647 + 0.05137 79018 i`, and the
  transposition with `𝔓^τ_{2,−1}` holds to `10⁻³⁰`.
- Negative control: the Gamma factors in the opposite orientation,
  `Γ(τ + m + 1)Γ(τ − m + 1)/(Γ(τ + n + 1)Γ(τ − n + 1)) · 𝔓^τ_{nm}`, give
  `0.08533 09700 − 0.10360 31521 i`, not `𝔓^τ_{mn}`.
- `𝔓^{−τ−1}_{2,−1}(cosh 1.3) = 0.00166 47647 − 0.05137 79018 i`, and the reflection holds to
  `10⁻²⁵`; negative control: without the sign `(−1)^k` the two sides differ by a factor `−1`.
- At `τ = 1`, `(m, n) = (1, 0)`: `𝔓^1_{10} / (Γ(2)Γ(2)) = sinh t / 2 = 𝔓^1_{01} / (Γ(3)Γ(1))`;
  at the pole `τ = 1`, `(m, n) = (3, 0)` both sides of the transposition are `0`.
- `𝔓^{−1/2+0.8i}_{11}(cosh 1.3)` and `𝔓^{−1/2+0.8i}_{00}(cosh 1.3)` are real to `10⁻³⁰`.

*Needs:* 1.1–1.2; SpecialFunctionsGroupModels §§2.1, 3.2.

### 1.5 Integral and half-integral degree

Sources: [VK, §6.5.6 (1)–(4), pp. 320–321; §6.5.3 (4), p. 314].

Let `ℓ = N/2` with `N ∈ ℕ`, and `m, n ∈ ℓ + ℤ`. Prove:
- **Vanishing** (`SU11.boostMatrixElement_eq_zero_of_lt`): `𝔓^ℓ_{mn}(cosh t) = 0` when
  `|n| ≤ ℓ < |m|`;
- the span of the `e_m` with `|m| ≤ ℓ` is invariant under `principalSeries ℓ e`
  (`e = N mod 2`), the representation on it has dimension `2ℓ + 1`, and for `|m|, |m'| ≤ ℓ`,
  `𝔓^ℓ_{m'm}(cosh t) = i^{m−m'} ((ℓ+m)!(ℓ−m)!/((ℓ+m')!(ℓ−m')!))^{1/2} d^ℓ_{m'm}(it)`, where
  `d^ℓ_{m'm}(it)` is SpecialFunctionsSU2MatrixElements' finite sum for `d^ℓ_{m'm}(β)` (its §2.3)
  with `cos(β/2)`, `sin(β/2)` replaced by `cosh(t/2)`, `i sinh(t/2)`;
- **Jacobi form**: for `m' ≥ |m|`,
  `𝔓^ℓ_{m'm}(cosh t) = sinh^{m'−m}(t/2) cosh^{m'+m}(t/2) P^{(m'−m, m'+m)}_{ℓ−m'}(cosh t)` with
  LaguerreJacobi's Jacobi polynomial (its Layer 3); the other cases with `|m|, |m'| ≤ ℓ` follow by
  the symmetries of 1.4.

The invariance is a degree count: for `|n| ≤ ℓ` the multiplier `|u|^{2ℓ}` times `e^{inθ'}` is a
trigonometric polynomial of degrees `−ℓ … ℓ` (`|u|² = u ū`), so its coefficients outside vanish.
The `SU(2)` formula is the continuation `β = it` of SpecialFunctionsGroupModels' Conventions applied
to the polynomial representation; the Jacobi form is the `tanh²` form of 1.2, which terminates, and
the hypergeometric form of the Jacobi polynomial.

**Checks.**
- At `ℓ = 0`: `𝔓^0_{10}(cosh t) = 0` while `𝔓^0_{01}(cosh t) = tanh(t/2) = 0.42189 90053` at
  `t = 0.9`; negative control for the orientation: the vanishing needs `|n| ≤ ℓ < |m|`, not
  `|m| ≤ ℓ < |n|`.
- At `ℓ = 1`, `t = 0.9`: `𝔓^1_{2,1} = 𝔓^1_{2,0} = 𝔓^1_{2,−1} = 0` to `10⁻³⁰`, while
  `𝔓^1_{1,2} = 1.28195 8869`; the vanishing holds for every `N ≤ 4` tested.
- At `ℓ = 1`, `t = 0.9`: the quotients `𝔓^ℓ_{m'm}/d^ℓ_{m'm}(it)` are `1`, `−1` at
  `(m', m) = (1, 1), (1, −1)`, and `√2 i`, `−i/√2` at `(0, 1)`, `(1, 0)`; at `ℓ = 3/2`,
  `(−1/2, −3/2)` gives `−√3 i`.
- The Jacobi form holds to `10⁻³⁰` in six cases with `m' ≥ |m|`; negative control: applied as
  printed at `m' < |m|`, it misses by constant factors such as `2`, `4` and `2.5`.

*Needs:* 1.1–1.2, 1.4; SpecialFunctionsSU2MatrixElements §2.3; LaguerreJacobi Layer 3;
SpecialFunctionsGroupModels Conventions.

## Layer 2: the unitary series

### 2.1 Principal and complementary series

Sources: [VK, §6.5.1 (8), p. 312]; [M, (5.161), p. 228; (5.168)–(5.170), p. 233]; [D, §13 (151),
p. 44; §14 (175), p. 50].

Prove:
- **Unitarity relations of the principal series**
  (`SU11.hasSum_norm_sq_boostMatrixElement_row`, `SU11.hasSum_norm_sq_boostMatrixElement_column`):
  for `Re τ = −1/2`, `e` and integer `n`, with `m = n − e/2`,
  `Σ_{k∈ℤ} |𝔓^τ_{m+k,m}(cosh t)|² = 1` and `Σ_{k∈ℤ} |𝔓^τ_{m,m+k}(cosh t)|² = 1`;
- **Bound** (`SU11.norm_boostMatrixElement_le_one`): `|𝔓^τ_{m'm}(cosh t)| ≤ 1` for `Re τ = −1/2`
  and weights `m'`, `m` in `−e/2 + ℤ`; in particular `|P_{−1/2+iρ}(cosh t)| ≤ 1`;
- **Complementary series** (`SU11.hasSum_complementarySeries_weighted_norm_sq`): for real
  `−1 < τ < 0` and integer `n`, with `w = complementaryWeight τ`,
  `Σ_{k∈ℤ} w(k)/w(n) · |𝔓^τ_{kn}(cosh t)|² = 1`;
- **Complementary bound**: for real `−1 < τ < 0` and integers `m`, `n`,
  `(w(m)/w(n))^{1/2} |𝔓^τ_{mn}(cosh t)| ≤ 1`;
- **Boundedness range** (`SU11.isBounded_boostMatrixElement_zero_zero_iff`):
  `t ↦ 𝔓^τ_{00}(cosh t)` is bounded on `[0, ∞)` exactly when `−1 ≤ Re τ ≤ 0`.

The principal series is unitary on `Re τ = −1/2` (SpecialFunctionsGroupModels §2.1), so the sums
are Parseval for the unit vectors `T(b_t) e_m` and `T(b_t)* e_m`, and the bound is Cauchy–Schwarz.
The complementary relations are the same argument for the complementary series of
NoncompactQuantumSymmetry M4, whose orthonormal basis is `e_n / w(n)^{1/2}`
(SpecialFunctionsGroupModels §2.2); `w(n) > 0` for `−1 < τ < 0`. The boundedness range uses the
behaviour of `P_τ` at infinity (SpecialFunctionsLegendre 4.5) and the reflection of 1.4.

**Checks.**
- At `τ = −1/2 + 0.8i`, `t = 0.9`, both sums are `1` to `10⁻²⁵` for `m = 0, 2` (`e = 0`) and
  `m = −1/2, 3/2` (`e = 1`), and the maximum of `|𝔓^τ_{m'm}|` over `|m'|, |m| ≤ 3` is
  `0.83317`, at `m' = m = 0`.
- Negative control: at `τ = 0.1`, `t = 1`, `Σ_k |𝔓^τ_{k0}|² = 1.05851 38265`.
- Complementary series at `τ = −0.3`, `t = 0.9`: the weighted sum is `1` to `10⁻²⁵` for
  `n = 0, 1, −2`, and the weighted bound is at most `0.95927` over `|m|, |n| ≤ 3`; negative control:
  the unweighted sum at `n = 0` is `0.95351 90712`.
- At `t = 5`: `𝔓^1_{00} = cosh 5 = 74.2099`, while `𝔓^0_{00} = 𝔓^{−1}_{00} = 1`, and `𝔓^{−0.3}_{00}`
  and `𝔓^{−1/2}_{00}` decrease; `Re τ = 0.2` and `τ = −1.2` grow.

*Needs:* 1.3–1.4; SpecialFunctionsGroupModels §§2.1–2.2; NoncompactQuantumSymmetry M4;
SpecialFunctionsLegendre 4.5.

### 2.2 The discrete series in the Bergman model

Sources: [VK, §6.5.6 (5)–(10), pp. 321–322; §6.7.1 (11)–(12′), p. 333]; [M, (5.171)–(5.176),
pp. 234–236; (5.178), p. 237].

For `k ≥ 2` let `C_j = C(k − 1 + j, j)` and `φ_j = C_j^{1/2} z^j`, the orthonormal basis of the
weighted Bergman space of SpecialFunctionsGroupModels §2.3; the weight of `φ_j` is `k/2 + j`.
`SU11.discreteMatrixElement k j' j g` is `⟪φ_{j'}, T(g) φ_j⟫` in `L²(bergmanMeasure k)` with
`T(g) = SU11.discreteAction k g`. Prove:
- **Discrete-series matrix elements** (`SU11.discreteMatrixElement_euler`): with `m' = k/2 + j'`,
  `m = k/2 + j`, `D_{j'j}(g(α, t, γ)) = e^{i(m'α + mγ)} (C_j/C_{j'})^{1/2} 𝔓^{−k/2}_{m'm}(cosh t)`,
  where `D_{j'j} = SU11.discreteMatrixElement k j' j`;
- **Generating function** (`SU11.discreteMatrixElement_boost_coeff`):
  `(C_{j'}/C_j)^{1/2} D_{j'j}(b_t) = [z^{j'}] B(z)`, where
  `B(z) = (cosh(t/2) z + sinh(t/2))^j (sinh(t/2) z + cosh(t/2))^{−k−j}`;
- **Unitarity** (`SU11.hasSum_norm_sq_discreteMatrixElement`): `Σ_{j'} |D_{j'j}(g)|² = 1`;
- **Jacobi polynomials**: for `j' ≥ j` the `tanh²` form of 1.2 terminates, and
  `F(−j, k + j'; j' − j + 1; x) = j!/(j' − j + 1)_j · P^{(j'−j, k−1)}_j(1 − 2x)` at
  `x = tanh²(t/2)`, with LaguerreJacobi's Jacobi polynomial; for `j' < j` the transposition of 1.4
  reduces to this case;
- the antiholomorphic discrete series of SpecialFunctionsGroupModels §2.3 has the matrix elements
  `conj D_{j'j}(g)` [M, (5.178), p. 237].

The generating function is the definition: `T(b_t) z^j = B(z)`, and
`⟪z^{j'}, z^i⟫ = δ_{j'i} C_{j'}⁻¹`.
The integral of 1.1 at `τ = −k/2`, `n = k/2 + j` is the same Taylor coefficient by Cauchy's formula
on the circle, which gives the identification; the phases are those of the rotations, which act on
`z^j` by `e^{i(k/2+j)α}`.

**Checks.**
- At `k = 2`, `t = 0.9`: `D_{2,1}(b_t) = −0.54707 15360`, `𝔓^{−1}_{3,2} = −0.67002 30580`, and
  the quotient is `(C_1/C_2)^{1/2} = (2/3)^{1/2}`; at `k = 3`, `(j', j) = (1, 3)`, the quotient is
  `(10/3)^{1/2} = 1.82574 18584`.
- Negative control: without the factor `(C_j/C_{j'})^{1/2}` the quotient at `k = 2`, `(2, 1)` would
  be `1`, not `(2/3)^{1/2}`.
- `D_{00}(b_t) = cosh^{−k}(t/2)`: `0.82200 12294` at `k = 2`, `t = 0.9`.
- `Σ_{j'} |D_{j'1}(b_{0.9})|² = 1` to `10⁻²⁵` for `k = 2, 3`.
- The Jacobi form holds to `10⁻³⁰` at `(k, j', j) = (2, 2, 1), (2, 4, 2), (3, 3, 0)`.

*Needs:* 1.1–1.2, 1.4; SpecialFunctionsGroupModels §2.3; LaguerreJacobi Layer 3.

## Layer 3: identities from the group law

### 3.1 The addition theorem

Sources: [VK, §6.6.1 (1)–(2), p. 326; §6.6.2 (1), (4), p. 327]; [M, (5.160), p. 228; (5.172),
p. 234].

Prove:
- **The Euler angles of a product** (`SU11.cosh_of_boost_mul_euler`): if
  `b_{t₁} g(φ, t₂, 0) = g(α, t, γ)`, then `cosh t = cosh t₁ cosh t₂ + sinh t₁ sinh t₂ cos φ`;
- **Addition theorem** (`SU11.hasSum_boostMatrixElement_addition`): for every `τ` and `e`, with the
  Euler angles above and weights `m'`, `m` in `−e/2 + ℤ`,
  `Σ_{k} 𝔓^τ_{m'k}(cosh t₁) e^{ikφ} 𝔓^τ_{km}(cosh t₂) = e^{i(m'α + mγ)} 𝔓^τ_{m'm}(cosh t)`,
  the sum over the weights `k ∈ −e/2 + ℤ`;
- **Legendre addition**: at `m' = m = 0`,
  `P_τ(cosh t₁ cosh t₂ + sinh t₁ sinh t₂ cos φ) = Σ_k e^{ikφ} 𝔓^τ_{0k}(cosh t₁) 𝔓^τ_{k0}(cosh t₂)`,
  and through 1.3 and 1.4 this is the addition theorem for `P_ν` of SpecialFunctionsLegendre 10.2;
  at `φ = 0`, `Σ_k 𝔓^τ_{0k}(cosh t₁) 𝔓^τ_{k0}(cosh t₂) = P_τ(cosh(t₁ + t₂))`;
- **Inverse**: at `φ = 0`, `t₂ = −t₁`, `Σ_k 𝔓^τ_{m'k}(cosh t) 𝔓^τ_{km}(cosh(−t)) = δ_{m'm}`.

The addition theorem is SpecialFunctionsGroupModels §3.2 for `principalSeries τ e` at
`g = b_{t₁}` and `h = k_φ b_{t₂}`, with 1.1 for the three matrix elements. The first bullet is the
computation of `|a|² = cosh²(t/2)` for the product; the Euler angles are `α = arg a + arg b` and
`γ = arg a − arg b`.

**Checks.**
- At `t₁ = 0.8`, `t₂ = 1.1`, `φ = 0.7`: `cosh t = 3.13878 81544`; negative control: the sign `−`
  in front of `sinh t₁ sinh t₂ cos φ` gives `1.32428 18905`.
- At these data and `τ = 0.23 + 0.4i` the addition theorem holds to `10⁻²⁴` for
  `(m', m) = (2, −1), (0, 0), (3/2, −1/2)`.
- Negative control: with `e^{−ikφ}` in place of `e^{ikφ}` the sum at `(2, −1)` is
  `−0.03727 27216 − 0.02620 76979 i`, while the right side is `−0.00777 14849 − 0.04489 65837 i`.
- The inverse holds to `10⁻²⁵` at `(m', m) = (2, −1), (1, 1)`.

*Needs:* 1.1; SpecialFunctionsGroupModels §§0.1, 3.2; SpecialFunctionsLegendre 10.2.

### 3.2 Multiplication formulas

Sources: [VK, §6.6.3 (1)–(8), pp. 327–329]; [D, §13 (151), p. 44].

Prove:
- **Fourier-coefficient form** (`SU11.boostMatrixElement_mul_boostMatrixElement`): for every
  integer `k`, with `x(φ) = cosh t₁ cosh t₂ + sinh t₁ sinh t₂ cos φ`,
  `𝔓^τ_{0k}(cosh t₁) 𝔓^τ_{k0}(cosh t₂) = (2π)⁻¹ ∫₀^{2π} e^{−ikφ} 𝔓^τ_{00}(x(φ)) dφ`, where
  `𝔓^τ_{00}(x)` is the value at `arcosh x`;
- **Mean value**: at `k = 0`, `P_τ(cosh t₁) P_τ(cosh t₂) = (2π)⁻¹ ∫₀^{2π} P_τ(x(φ)) dφ`, the mean
  of `P_τ` over the circle of radius `t₂` about a point at distance `t₁` from the origin of the
  hyperbolic plane;
- **Product formula with the triangle kernel** (`SU11.boostMatrixElement_product_kernel`): for
  `t₁, t₂ > 0`,
  `P_τ(cosh t₁) P_τ(cosh t₂) = π⁻¹ ∫_{|t₁−t₂|}^{t₁+t₂} P_τ(cosh s) sinh s Δ(s)^{−1/2} ds`, where
  `Δ(s) = (cosh(t₁ + t₂) − cosh s)(cosh s − cosh(t₁ − t₂))`;
- the general multiplication formula: `𝔓^τ_{m'k}(cosh t₁) 𝔓^τ_{km}(cosh t₂)` is the coefficient of
  `e^{ikφ}` in the right side of the addition theorem, as a function of `φ`.

The first bullet is the addition theorem of 3.1 at `m' = m = 0`, where the phase is `1`,
integrated against `e^{−ikφ}`. The kernel form is the substitution `cosh s = x(φ)` on `[0, π]`,
with `sinh t₁ sinh t₂ sin φ = Δ(s)^{1/2}`.

**Checks.**
- At `τ = 0.23 + 0.4i`, `t₁ = 0.8`, `t₂ = 1.1`: the Fourier form holds to `10⁻²⁵` for
  `k = 0, 1, 2`, and `P_τ(cosh t₁) P_τ(cosh t₂) = 1.03022 70795 + 0.26882 77410 i`.
- The kernel form gives the same value to `10⁻¹³` (quadrature with endpoint singularities).
- Negative control: the normalization `(2π)⁻¹` in the kernel form gives half the value,
  `0.51511 35398 + 0.13441 38705 i`.
- At `τ = 0` the kernel form says `π⁻¹ ∫ sinh s Δ(s)^{−1/2} ds = 1`: the kernel is a probability
  density.

*Needs:* 1.3, 3.1; Mathlib `Real.arcosh`.

### 3.3 Generating functions and the degree

Sources: [VK, §6.7.1 (6)–(13′), pp. 332–334; §6.7.3 (2)–(6), pp. 336–337] (the second for the
`SU(2)` analogue of the degree shift); [D, §14 (171)–(172), p. 49].

Prove, for real `n` and `t`:
- **Generating function** (`SU11.hasSum_boostMatrixElement_fourier`): for every real `θ`,
  `Σ_{k∈ℤ} 𝔓^τ_{n+k,n}(cosh t) e^{−ikθ} = A(θ)^{τ+n} A(−θ)^{τ−n}`, with `A` of Conventions;
- **Row sums** (`SU11.hasSum_boostMatrixElement_row`,
  `SU11.hasSum_boostMatrixElement_row_alternating`): `Σ_{k∈ℤ} 𝔓^τ_{n+k,n}(cosh t) = e^{τt}` and
  `Σ_{k∈ℤ} (−1)^k 𝔓^τ_{n+k,n}(cosh t) = e^{−τt}`;
- **Convolution in the degree** (`SU11.hasSum_boostMatrixElement_degree`): for real `n₁`, `n₂` and
  `m = n₁ + n₂ + j`, `j ∈ ℤ`,
  `𝔓^{τ₁+τ₂}_{m, n₁+n₂}(cosh t) = Σ_{k∈ℤ} 𝔓^{τ₁}_{n₁+k, n₁}(cosh t) 𝔓^{τ₂}_{m−n₁−k, n₂}(cosh t)`;
- **Shift of the degree by `1/2`** (`SU11.boostMatrixElement_degree_shift`): for
  `m = n + 1/2 + k`, `k ∈ ℤ`,
  `𝔓^{τ+1/2}_{m, n+1/2} = cosh(t/2) 𝔓^τ_{m−1/2, n} + sinh(t/2) 𝔓^τ_{m+1/2, n}`;
- at `n = 0`, `θ = ±π/2`: `Σ_k (∓i)^k 𝔓^τ_{k0}(cosh t) = cosh^τ t`, since
  `A(π/2) A(−π/2) = cosh t`; the sign `+` is [VK, §6.7.1 (10), p. 333], whose `𝔓^k_τ` is the
  associated Legendre function of 1.3.

The integrand of 1.1 is smooth and `2π`-periodic in `θ`, so its Fourier series converges
absolutely, and 1.1 says its coefficients are the `𝔓^τ_{n+k,n}`; the row sums are `θ = 0, π`. The
convolution is the product of two such series, with `Complex.cpow_add` for the bases of positive
real part. The shift is the convolution with `τ₂ = 1/2`, `n₂ = 1/2`, where the only nonzero
coefficients are `𝔓^{1/2}_{1/2,1/2} = cosh(t/2)` and `𝔓^{1/2}_{−1/2,1/2} = sinh(t/2)` (1.5).

**Checks.**
- At `τ = 0.23 + 0.4i`, `t = 1.3`: `e^{τt} = 1.17026 25152 + 0.67004 76476 i`, and both row sums
  hold to `10⁻²⁴` for `n = 0, 1/2, 2`; the generating function holds to `10⁻²⁵` at `n = 0.3`,
  `θ = 0.6`.
- Negative control: the sum over the second index, `Σ_k 𝔓^τ_{0,k}(cosh 1.3)`, is
  `4.29404 03470 + 2.45860 36000 i`, not `e^{τt}`: the row sums run over the first index.
- The convolution holds to `10⁻²⁵` at `τ₁ = 0.23 + 0.4i`, `τ₂ = −0.6 + 0.1i` for
  `(m, n₁, n₂) = (1, 0, 0), (2, 1/2, −3/2), (0, 1, 2)`.
- The shift holds to `10⁻³⁰` for `(m, n) = (3/2, 0), (1, 1/2), (−1/2, 1), (2.8, 0.3)`.
- At `θ = π/2`, `n = 0`: both sides are `1.12610 47073 + 0.31335 53931 i`.

*Needs:* 1.1, 1.5; Mathlib Fourier series on `AddCircle`.

## Layer 4: recurrences

### 4.1 Derivatives and ladder relations

Sources: [VK, §6.7.2 (8)–(13), p. 336, with the `SU(2)` analogues (2)–(7), pp. 334–335];
[D, §14 (173), p. 49] (the generator of the boosts on the weight basis).

Prove, for real `n`, `m = n + k` and `k ∈ ℤ`:
- **Derivatives** (`SU11.hasDerivAt_boostMatrixElement_left`,
  `SU11.hasDerivAt_boostMatrixElement_right`): `d/dt 𝔓^τ_{mn}(cosh t)` equals
  `½(τ − m + 1) 𝔓^τ_{m−1,n} + ½(τ + m + 1) 𝔓^τ_{m+1,n}` and equals
  `½(τ + n) 𝔓^τ_{m,n−1} + ½(τ − n) 𝔓^τ_{m,n+1}`;
- **Ladder relations** (`SU11.boostMatrixElement_ladder_lower`,
  `SU11.boostMatrixElement_ladder_raise`): for `t ≠ 0`,
  `d/dt 𝔓^τ_{mn} + (n cosh t − m)/sinh t · 𝔓^τ_{mn} = (τ + n) 𝔓^τ_{m,n−1}` and
  `d/dt 𝔓^τ_{mn} − (n cosh t − m)/sinh t · 𝔓^τ_{mn} = (τ − n) 𝔓^τ_{m,n+1}`;
- at `n = 0` and through 1.3 these are the ladder relations of `P^{−m}_τ` in `z = cosh t`
  [VK, §6.7.2 (12)–(13), p. 336], the contiguous relations of SpecialFunctionsLegendre 1.4.

The derivatives are the addition theorem of SpecialFunctionsGroupModels §3.2 for
`b_{s+t} = b_s b_t = b_t b_s`, differentiated at `s = 0`, with the generator of `s ↦ b_s` on the
weight basis read off from 1.2 at `t = 0`. The ladder relations combine the derivatives with the
generator of the rotations, in the raising and lowering operators of SpecialFunctionsGroupModels
§4.1.

**Checks.**
- Both derivative formulas and both ladder relations hold to `10⁻²⁶` at `τ = 0.23 + 0.4i`,
  `t = 1.3` for `(m, n) = (2, −1), (0, 0), (3/2, 1/2)`.
- At `(m, n) = (2, −1)` the ladder quotients `(d/dt 𝔓 ± (n cosh t − m)/sinh t · 𝔓)/𝔓^τ_{m,n∓1}`
  are `−0.77 + 0.4i = τ + n` and `1.23 + 0.4i = τ − n`.
- Negative control: the quotient of the `+` combination by `𝔓^τ_{m,n+1}` instead is
  `−0.09251 + 0.00201 i`, not a polynomial in `τ`.
- At `τ = 0`, `m = n = 0`: `d/dt 𝔓^0_{00} = 0 = ½ 𝔓^0_{−1,0} + ½ 𝔓^0_{1,0}` by 1.5.

*Needs:* 1.1–1.2, 1.5; SpecialFunctionsGroupModels §§3.2, 4.1; SpecialFunctionsLegendre 1.4.

### 4.2 Three-term recurrences and the equation in `z = cosh t`

Sources: [VK, §6.7.2 (5), p. 335; (9), p. 336]; [M, (5.159)–(5.160), pp. 227–228] (the
hypergeometric form from which the recurrences also follow).

Prove, for `t ≠ 0`, real `n`, `m = n + k` and `k ∈ ℤ`:
- **Recurrences** (`SU11.boostMatrixElement_recurrence_right`,
  `SU11.boostMatrixElement_recurrence_left`):
  `2(n cosh t − m)/sinh t · 𝔓^τ_{mn} = (τ + n) 𝔓^τ_{m,n−1} − (τ − n) 𝔓^τ_{m,n+1}` and
  `2(m cosh t − n)/sinh t · 𝔓^τ_{mn} = (τ − m + 1) 𝔓^τ_{m−1,n} − (τ + m + 1) 𝔓^τ_{m+1,n}`;
- **The equation in `z`**: `w(z) = 𝔓^τ_{mn}(z)` for `z = cosh t > 1` satisfies
  `(z² − 1) w″ + 2z w′ − (m² + n² − 2mnz)/(z² − 1) · w = τ(τ + 1) w`, SpecialFunctionsGroupModels
  §4.3's equation after the change of variable.

The first recurrence is the difference of the two ladder relations of 4.1; the second is the first
applied to the transposition of 1.4. The equation is §4.3 of SpecialFunctionsGroupModels with
`d/dt = sinh t · d/dz`.

**Checks.**
- Both recurrences hold to `10⁻²⁶` at `τ = 0.23 + 0.4i`, `t = 1.3` for
  `(m, n) = (2, −1), (0, 0), (3/2, 1/2)`, and the equation in `z` for
  `(m, n) = (2, −1), (0, 0), (3/2, −5/2)`.
- Negative control: the second recurrence with its right side negated misses by `0.229` at
  `(2, −1)` and by `1.427` at `(3/2, 1/2)`.
- At `m = n = 0` the equation is Legendre's, `(z² − 1) w″ + 2z w′ = τ(τ + 1) w`, solved by
  `P_τ(z)` (1.3).

*Needs:* 1.4, 4.1; SpecialFunctionsGroupModels §4.3.

## Layer 5: other subgroups and transforms

### 5.1 The other one-parameter subgroups

Sources: [VK, §7.7.1, pp. 434–435] (the element `g_+(t)` and its matrix elements); [M,
(5.156)–(5.158), p. 226] (the Euler coordinates read from `a`, `b`).

`SU11.parabolic s = [[1 + is/2, s/2], [s/2, 1 − is/2]]`, the conjugate in `SU(1,1)` of the
unipotent subgroup of `SL(2, ℝ)`. Prove:
- **The parabolic subgroup** (`SU11.parabolic_add`): `parabolic` is a homomorphism from `ℝ`;
- **The parabolic subgroup in Euler angles** (`SU11.parabolic_eq_euler`):
  `parabolic s = g(β, 2 arsinh(s/2), β)` with `β = arctan(s/2)`;
- **The second hyperbolic subgroup** (`SU11.principalSeries_matrixElement_boostY`):
  `D_{m'm}(boostY t) = i^{m'−m} 𝔓^τ_{m'm}(cosh t)`;
- **Matrix elements on the parabolic subgroup** (`SU11.principalSeries_matrixElement_parabolic`):
  `D_{m'm}(parabolic s) = e^{i(m'+m) arctan(s/2)} 𝔓^τ_{m'm}(cosh(2 arsinh(s/2)))`, where
  `cosh(2 arsinh(s/2)) = 1 + s²/2`.

`boostY t = k_{π/2} b_t k_{−π/2}` (SpecialFunctionsGroupModels §0.1); the parabolic element has
`a = 1 + is/2 = e^{iβ} cosh(t/2)` and `b = s/2 = sinh(t/2)` with `t = 2 arsinh(s/2)`, so it is
`g(β, t, β)`; then 1.1.

**Checks.**
- At `τ = 0.23 + 0.4i`, `t = 1.3`: both matrix-element identities hold to `10⁻²⁵` in the circle
  model for `(n', n) = (2, −1), (0, 3)` (`e = 0`) and `(1, 0)` (`e = 1`), the parabolic one at
  `s = 0.8` and `s = −1.7`.
- At `s = 0.8`, `(n', n) = (2, −1)`, `e = 0`: `D = −0.00133 70826 − 0.00458 54908 i`.
- Negative control: the factor `i^{m−m'}` in place of `i^{m'−m}` misses by `0.039` at `(2, −1)`;
  the phase `e^{−i(m'+m) arctan(s/2)}`, which is [VK]'s in their labels, misses by `0.0036` at
  `s = 0.8` and by `0.149` at `(0, 3)`.

*Needs:* 1.1; SpecialFunctionsGroupModels §§0.1, 3.3.

### 5.2 The Mehler–Fock transform

Sources: [VK, §7.8.4 (15)–(17), pp. 485–486]; [W, (10.5.11)–(10.5.12), p. 373].

With `μ = sinh t dt` and `ν = ρ tanh(πρ) dρ` on `(0, ∞)`,
`SU11.mehlerFock f ρ = ∫₀^∞ f(t) 𝔓^{−1/2+iρ}_{00}(cosh t) sinh t dt`. Prove:
- **Parseval** (`SU11.lintegral_mehlerFock`): for continuous `f` with compact support in
  `(0, ∞)`, `∫ |f|² dμ = ∫ |mehlerFock f|² dν`, as `ℝ≥0∞`-valued integrals;
- **Inversion** (`SU11.mehlerFock_inversion`): for smooth `f` with compact support in `(0, ∞)`
  and `t > 0`, `f(t) = ∫₀^∞ mehlerFock f ρ · 𝔓^{−1/2+iρ}_{00}(cosh t) ρ tanh(πρ) dρ`;
- **Unitarity** (`SU11.exists_mehlerFock_unitary`): there is a unitary `L²(μ) ≃ L²(ν)` that agrees
  with `mehlerFock` on the functions of the first bullet;
- through `x = cosh t` this is the Mehler–Fock transform `c(ρ) = ∫₁^∞ F(x) P_{−1/2+iρ}(x) dx` on
  `L²((1, ∞), dx)`, and up to the constant factor between `sinh t dt` and the image of the Haar
  measure it is the spherical transform of `(SU(1,1), K)` of SpecialFunctionsGroupModels §5.2 at
  the spherical functions `𝔓^{−1/2+iρ}_{00}`.

The proof restricts NoncompactQuantumSymmetry M4.P's Plancherel theorem for `SL(2, ℝ)` to the
bi-`K`-invariant functions, where only the spherical principal series contributes, and identifies
the spherical functions with `𝔓^{−1/2+iρ}_{00}` (1.3) and the Plancherel density with
`ρ tanh(πρ)` through the dictionary `ν = −(2τ + 1) = −2iρ` of SpecialFunctionsGroupModels §2.1 and
the radial equation of its §5.4. Inversion on smooth compactly supported functions follows from
Parseval by polarization and the continuity and bound of `ρ ↦ 𝔓^{−1/2+iρ}_{00}(cosh t)` (1.1,
2.1).

**Checks.**
- For `f(t) = e^{−cosh t}`: `mehlerFock f ρ = (2/π)^{1/2} K_{iρ}(1)`, `0.30642 19939` at
  `ρ = 0.5` and `0.10680 53193` at `ρ = 1.7` (`K` the Macdonald function).
- Parseval for `F(x) = (x − 1) e^{−x}`: `∫₁^∞ |F|² dx = e^{−2}/4 = 0.03383 38208`, and
  `∫₀^∞ |c(ρ)|² ρ tanh(πρ) dρ` agrees to `10⁻¹²`; negative control: the density `ρ dρ` without
  `tanh(πρ)` gives `0.03713`.
- Inversion for `f(t) = e^{−cosh t}` at `t = 0.7` returns `e^{−cosh 0.7} = 0.28502 76729` to
  `10⁻¹²`; negative control: the inversion constant `1/(2π²)` printed in [W, (10.5.12)] gives
  `0.01444`.

*Needs:* 1.1, 1.3, 1.4, 2.1; NoncompactQuantumSymmetry M4.P; SpecialFunctionsGroupModels §§2.1,
5.2, 5.4.

### 5.3 The Mehler–Fock transform of order `m`

Sources: [VK, §7.8.4 (1)–(11), pp. 483–484]; [M, (5.159), p. 227] (the matrix elements in the
first column, which are the kernels).

For an integer `m`,
`SU11.mehlerFockOrder m f ρ = ∫₀^∞ f(t) conj 𝔓^{−1/2+iρ}_{m0}(cosh t) sinh t dt`. Prove:
- **Parseval** (`SU11.lintegral_mehlerFockOrder`): for continuous `f` with compact support in
  `(0, ∞)`, `∫ |f|² dμ = ∫ |mehlerFockOrder m f|² dν`;
- **Inversion** (`SU11.mehlerFockOrder_inversion`): for smooth `f` with compact support in `(0, ∞)`
  and `t > 0`, `f(t) = ∫₀^∞ mehlerFockOrder m f ρ · 𝔓^{−1/2+iρ}_{m0}(cosh t) ρ tanh(πρ) dρ`;
- through 1.3 the kernel is `Γ(1/2 + iρ)/Γ(1/2 + iρ − m) · P^{−m}_{−1/2+iρ}(cosh t)`, so this is
  the generalized Mehler–Fock transform of order `−m` with the density
  `|Γ(1/2 + iρ)/Γ(1/2 + iρ − m)|² ρ tanh(πρ) = π⁻¹ |Γ(1/2 + m + iρ)|² ρ sinh(πρ)`.

The functions `e^{imα} f(t)` on `SU(1,1)/K` form the `K`-type `m` of `L²(SU(1,1)/K)`. In
NoncompactQuantumSymmetry M4.P the decomposition of `L²(SU(1,1)/K)` has only the spherical
principal series, since `Ind_K^G` of the trivial character contains no discrete series; the matrix
elements of that series on the `K`-type are `e^{imα} 𝔓^{−1/2+iρ}_{m0}(cosh t)` by 1.1, so the
transform is unitary with the density of 5.2. In [VK, §7.8.4 (8)–(11), p. 484] this is the case
of the `K`-types `(m, 0)`, where no discrete terms occur.

**Checks.**
- At `m = 0` the transform is `mehlerFock`, since the kernel is real (1.4).
- At `ρ = 0.9`, `t = 1.2`: `|𝔓^{−1/2+iρ}_{10}|² = (1/4 + ρ²) |P^{−1}_{−1/2+iρ}|² = 0.20616 43714`.
- Parseval for `F(x) = (x − 1) e^{−x}` at `m = 1, 2`: both sides are `e^{−2}/4 = 0.03383 38208`
  to `10⁻⁸`.
- Negative control: the kernel `P^{−1}_{−1/2+iρ}` with the density `ρ tanh(πρ)`, without the factor
  `|Γ(1/2 + iρ)/Γ(1/2 + iρ − m)|²`, gives `0.02467` at `m = 1`.

*Needs:* 1.1, 1.3, 5.2; NoncompactQuantumSymmetry M4.P.

## Worked examples

- `𝔓^{−1/2+0.8i}_{00}(cosh 0.9) = 0.83316 90033 = P_{−1/2+0.8i}(cosh 0.9)` (1.3).
- `𝔓^{0.23+0.4i}_{2,−1}(cosh 1.3) = −0.01150 64149 − 0.01597 50333 i`, by the integral, by the
  circle model and by both hypergeometric forms (1.1–1.2).
- At `τ = 1/2` and `e = 1` the matrix of `T(b_t)` on the weights `1/2`, `−1/2` is
  `[[cosh(t/2), sinh(t/2)], [sinh(t/2), cosh(t/2)]]`, the matrix `b_t` itself (1.5).
- At `τ = 1`: `𝔓^1_{00} = cosh t`, `𝔓^1_{10} = sinh t / 2`, `𝔓^1_{01} = sinh t`, and the row sum
  `𝔓^1_{−1,0} + 𝔓^1_{00} + 𝔓^1_{10} = e^t` (3.3).
- On the discrete series of weight `k`, `D_{00}(b_t) = cosh^{−k}(t/2)` (2.2).
- `mehlerFock (e^{−cosh t}) ρ = (2/π)^{1/2} K_{iρ}(1)` (5.2).

## Downstream consumers

- SpecialFunctionsRankOneSymmetricSpaces, on harmonic analysis on the rank-one symmetric spaces,
  consumes the definition (1.1), the `−sinh²` form (1.2), Laplace's integral and the conical
  functions (1.3), the bound of the principal series (2.1) and the Mehler–Fock transform (5.2). It
  identifies the `𝔓^τ_{mn}` with Jacobi functions, the zonal case being
  `φ^{(0,0)}_λ(t) = 𝔓^{−1/2+iλ/2}_{00}(cosh 2t)`, and reads 5.2 as the Jacobi transform at
  `(α, β) = (0, −1/2)`; that identification is its target, not this roadmap's.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- the group `SU(1,1)`, its Euler angles, its function-space models (the principal series on the
  circle, the complementary weights, the discrete series on weighted Bergman spaces), the general
  matrix elements with their addition theorem and Euler factorization, the ladder operators, the
  second-order equation, and the spherical functions and radial equation of `(SU(1,1), K)`:
  SpecialFunctionsGroupModels §§0.1, 2.1–2.3, 3.1–3.3, 4.1, 4.3, 5.2, 5.4;
- the unitary dual of `SL(2, ℝ)` (irreducibility, equivalences, exhaustion) and its Plancherel
  theorem: NoncompactQuantumSymmetry M4 and M4.P, through the dictionary of
  SpecialFunctionsGroupModels §2.1;
- the Gauss function on the cut plane and Pfaff's transformation: SpecialFunctionsHypergeometric
  Layer 1 and 5.1;
- the functions `P^μ_ν` on `(1, ∞)`, their contiguous relations, their behaviour at infinity,
  Laplace's integral and the addition theorem for general degree: SpecialFunctionsLegendre 1.1, 1.4,
  4.5, 8.2 and 10.2;
- the Jacobi polynomials: LaguerreJacobi Layer 3;
- the `SU(2)` functions `d^j_{m'm}`: SpecialFunctionsSU2MatrixElements §2.3.

Owned here:
- the functions `𝔓^τ_{mn}(cosh t)` as circle integrals, for complex degree and real weights, and
  their identification with the matrix elements of the principal series on `g(α, t, γ)`, on the
  second hyperbolic subgroup and on the parabolic subgroup;
- their hypergeometric, Legendre, associated Legendre, `SU(2)` and Jacobi-polynomial forms, and
  their symmetries, vanishing, unitarity relations and bounds;
- the discrete-series matrix elements in the Bergman model, with their generating function;
- the addition, multiplication and product formulas, the generating functions, row sums, the
  convolution and shift in the degree, the derivatives, ladder relations and three-term
  recurrences, all in the functions `𝔓^τ_{mn}`;
- the Mehler–Fock transform on `L²((0, ∞), sinh t dt)`, of order `0` and of every integer order,
  with Parseval, inversion and unitarity.

Not owned:
- the models and the general theory of matrix elements, including the addition theorem and the
  Euler factorization of a matrix element, and the second-order equation of matrix elements
  (SpecialFunctionsGroupModels); 4.2 rewrites that equation in `z = cosh t` only as a consequence;
- the representation theory of `SL(2, ℝ)`: irreducibility, equivalence, the classification and
  the Plancherel theorem (NoncompactQuantumSymmetry);
- the functions `P^μ_ν` and `Q^μ_ν` and their analytic theory, including Laplace's integral and the
  addition theorem for general degree (SpecialFunctionsLegendre); its scope leaves the Mehler–Fock
  transformation to this roadmap, and this roadmap states its results through `𝔓^τ_{mn}` and
  records the agreement with `P^μ_ν` in prose;
- the Jacobi functions `φ^{(α,β)}_λ` in general, the Harish-Chandra `c`-function and the Jacobi,
  Abel and Fourier transforms on hyperbolic spaces (SpecialFunctionsRankOneSymmetricSpaces).

Boundary in one sentence: the explicit functions that the representations of `SU(1,1)` produce in
a weight basis, and every identity among them that the group gives, are here; the models and the
representation theory are SpecialFunctionsGroupModels' and NoncompactQuantumSymmetry's, and the
functions of one variable as such are the suppliers'.

## Exact supplier contracts

### From Mathlib

- Complex powers with the principal branch and `Complex.cpow_add`; `intervalIntegral`, Bochner and
  lower Lebesgue integrals, `withDensity`, `Lp` and `LinearIsometryEquiv`.
- `ordinaryHypergeometric` (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`),
  `ascPochhammer`, `Complex.Gamma`, `Real.Gamma`, `Real.arcosh`, `Real.arsinh`, `Real.arctan`.
- `fourierBasis`, `fourierLp`, `haarAddCircle`, `HilbertBasis`, `HasSum`, `HasDerivAt`,
  `ContDiff`, `Differentiable`, `Bornology.IsBounded` and `iteratedDeriv`.

### From Tau Ceti

- `ContRepresentation` (`TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean`), the
  carrier of `principalSeries`.

### From SpecialFunctionsGroupModels

- §0.1: `su11`, `SU11`, `SU11.entryA`, `SU11.entryB`, `SU11.ofPair`, `SU11.rotation`,
  `SU11.boost`, `SU11.boostY`, `SU11.euler`, and the relation `boostY t = k_{π/2} b_t k_{−π/2}`.
- §2.1: `SU11.circleDenominator`, `SU11.circleAct`, `SU11.principalMultiplier`,
  `SU11.principalAction`, `SU11.IsPrincipalSeriesRealization`, `SU11.principalSeries`, with the
  unitarity on `Re τ = −1/2`, the Hermitian adjoint, the intertwiners and the dictionary to
  NoncompactQuantumSymmetry; the weights of `fourierBasis` (2.2 there).
- §2.2: `complementaryWeight` and the complementary series with the orthonormal basis
  `e_n / w(n)^{1/2}`.
- §2.3: `bergmanMeasure`, `SU11.diskAct`, `SU11.discreteAction`, the orthonormal basis `φ_j` and the
  antiholomorphic discrete series.
- §§3.1–3.3: `matrixElement`, the addition theorem and the inverse of matrix elements, unitarity,
  and the Euler factorization.
- §4.1: the raising and lowering operators on the weight basis.
- §4.3: the second-order equation of matrix elements.
- §5.2: the spherical functions and the spherical transform of `(SU(1,1), K)`; §5.4: the radial
  equation.

`Suggested.lean` carries verbatim local copies of the definitions above, each with a docstring
naming the owner and the section, and imports no other roadmap.

### From NoncompactQuantumSymmetry

- [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md) M4 (the unitary dual of
  `SL(2, ℝ)`: principal, complementary and discrete series, their irreducibility and equivalences),
  in 1.4 and 2.1; M4.P (the Plancherel theorem, with the decomposition of `Ind_K^G` of a character
  of `K` into principal and discrete series), in 5.2–5.3.

### From SpecialFunctionsHypergeometric

- [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) Layer 1 (the
  regularized Gauss function on the cut plane) and 5.1 (Pfaff's transformation), in 1.2.

### From SpecialFunctionsLegendre

- 1.1: `P^μ_ν` on `(1, ∞)`, in 1.3; 1.4: the contiguous relations, in 4.1; 4.5: the behaviour at
  infinity, in 2.1; 8.2: Laplace's first integral, in 1.3; 10.2: the addition theorem for general
  degree, in 3.1.

### From LaguerreJacobi

- [LaguerreJacobi](../LaguerreJacobi/README.md) Layer 3 (the Jacobi polynomials, with their
  hypergeometric form), in 1.5 and 2.2.

### From SpecialFunctionsSU2MatrixElements

- §2.3: the finite sum for `d^j_{m'm}(β)`, in 1.5.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap and is recorded to fix the boundary; each item is
material for a further roadmap built on this one.

- **The kernels in mixed and continuous bases** [VK, §§7.1–7.7]: the realizations on the line, the
  kernels between hyperbolic and parabolic bases and the Whittaker, Bessel and hypergeometric
  functions they produce, and the Kontorovich–Lebedev transform [VK, §7.8.4 (18)–(20), p. 486].
- **The transforms on `L²(SU(1,1))` of `K`-types `(k, m)` with `km > 0`**, with their
  discrete-series terms [VK, §7.8.4 (8)–(14), pp. 484–485], and the transforms of half-integral
  type.
- **The Jacobi transform** for general `(α, β)`, the `c`-function, the Abel transform and the
  Fourier transform on hyperbolic spaces, and the identification of the `𝔓^τ_{00}` with Jacobi
  functions: SpecialFunctionsRankOneSymmetricSpaces.
- **The universal covering group** of `SU(1,1)` and its matrix elements [VK, §6.4.7].
- **Asymptotics** of `𝔓^τ_{mn}(cosh t)` for large `t` or large indices beyond the boundedness
  range of 2.1.

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
proves the following targets without `sorry` at commit `2a512fe`, against Tau Ceti and the
lean-DLMF hypergeometric and Legendre functions, in the namespace `SFVK.SU11` with the names used
here. Its modules are a cited source, not the specification.

- Definitions: `boostMatrixElement`, `parabolic`, `sinhMeasure`, `plancherelMeasure`, `mehlerFock`
  and `mehlerFockOrder` (`SFVK/SU11/Basic/BoostMatrixElements.lean`), with the copies of
  SpecialFunctionsGroupModels' coordinates and circle model (`SFVK/SU11/Basic/Coordinates.lean`,
  `SFVK/SU11/Basic/CircleModel.lean`).
- 1.1: `principalSeries_matrixElement_euler_eq`, `boostMatrixElement_zero`,
  `differentiable_boostMatrixElement_degree`, `contDiff_boostMatrixElement_radius`
  (`SFVK/SU11/MatrixElements.lean`), `boostMatrixElement_neg`
  (`SFVK/SU11/MatrixElementSpecialFunctions.lean`), and the Fourier-coefficient form
  (`SFVK/SU11/MatrixElementKernels.lean`).
- 1.2: `boostMatrixElement_eq_hypergeometric`, and the `−sinh²` form with lean-DLMF's regularized
  Gauss function (`SFVK/SU11/MatrixElementSpecialFunctions.lean`).
- 1.3: `boostMatrixElement_zero_zero`, its identification with lean-DLMF's Legendre function, and
  the associated Legendre form for `m ∈ ℕ` (`SFVK/SU11/MatrixElementSpecialFunctions.lean`); the
  Mehler–Dirichlet integral of `𝔓^{−1/2+iρ}_{00}` (`SFVK/SU11/Transforms.lean`).
- 1.4–1.5: `boostMatrixElement_neg_neg`, `boostMatrixElement_swap`, `boostMatrixElement_reflect`,
  `conj_boostMatrixElement`, `boostMatrixElement_eq_zero_of_lt`
  (`SFVK/SU11/MatrixElementSpecialFunctions.lean`).
- 2.1: `hasSum_norm_sq_boostMatrixElement_row`, `hasSum_norm_sq_boostMatrixElement_column`,
  `norm_boostMatrixElement_le_one`, `hasSum_complementarySeries_weighted_norm_sq`
  (`SFVK/SU11/MatrixElements.lean`).
- 3.1–3.3: `cosh_of_boost_mul_euler`, `hasSum_boostMatrixElement_addition`,
  `boostMatrixElement_mul_boostMatrixElement`, `boostMatrixElement_product_kernel`,
  `hasSum_boostMatrixElement_fourier`, `hasSum_boostMatrixElement_row`,
  `hasSum_boostMatrixElement_row_alternating`, `hasSum_boostMatrixElement_degree`,
  `boostMatrixElement_degree_shift` (`SFVK/SU11/MatrixElements.lean`).
- 4.1–4.2: `hasDerivAt_boostMatrixElement_left`, `hasDerivAt_boostMatrixElement_right`,
  `boostMatrixElement_ladder_lower`, `boostMatrixElement_ladder_raise`,
  `boostMatrixElement_recurrence_right`, `boostMatrixElement_recurrence_left`
  (`SFVK/SU11/MatrixElementRecurrences.lean`).
- 5.1: `parabolic_add` (`SFVK/SU11/Basic/BoostMatrixElements.lean`), `parabolic_eq_euler` and
  `principalSeries_matrixElement_parabolic` (`SFVK/SU11/MatrixElements.lean`).

The statements of 5.2–5.3 are in `SFVK/SU11/Transforms.lean` with `sorry` proofs. The discrete
series (2.2), the second hyperbolic subgroup (5.1), the complementary bound and the boundedness
range (2.1) are not formalized there.

## References

- [VK] N. Ja. Vilenkin, A. U. Klimyk, *Representation of Lie Groups and Special Functions*,
  Vol. 1, Mathematics and Its Applications (Soviet Series) 72, Kluwer, 1991, Chapters 6–7.
- [W] A. Wawrzyńczyk, *Group Representations and Special Functions*, Mathematics and Its
  Applications (East European Series), Reidel / PWN, 1984, Chapter 10.
- [D] J. Dieudonné, *Special Functions and Linear Representations of Lie Groups*, CBMS Regional
  Conference Series in Mathematics 42, AMS, 1980, §§13–14.
- [M] W. Miller, Jr., *Lie Theory and Special Functions*, Mathematics in Science and Engineering
  43, Academic Press, 1968, §5-18.

Locators to [VK] are in their labels and are transported by the rule of Conventions. The following
misprints are corrected wherever the README uses those formulas:
- [VK, §6.6.1 (4), p. 326; §6.6.2, p. 327]: the factor `i` missing in the exponents `e^{−kφ}`;
- [VK, §6.6.3 (5), (7), pp. 328–329]: the constant `1/2π` for `1/π` in the kernel forms;
- [VK, §6.7.1 (8), p. 332]: `cos t` for `cosh t`;
- [VK, §6.7.1 (13′), p. 334]: the indices of the convolution in the degree, which is used in the
  form (13), p. 333;
- [W, (10.5.12), p. 373]: the inversion constant `1/(2π²)` for `1`, and `π` for `2π` before
  (10.5.11);
- [M, p. 227]: `|a| = cosh ρ` for `cosh(ρ/2)`.

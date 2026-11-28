# Roadmap: zeros of orthogonal polynomials, Stieltjes' electrostatics and the arcsine law

**Summary.** Put a charge (α+1)/2 at the point 1 and a charge (β+1)/2 at the point −1, with
α, β > −1, and let n unit charges move on the open interval (−1, 1), every pair of charges
repelling with the logarithmic interaction. Stieltjes proved in 1885 that there is exactly one
equilibrium, that it is the maximum on the cube of the product
`∏ (1 − xᵢ)^{(α+1)/2} (1 + xᵢ)^{(β+1)/2} ∏_{i<j} |xᵢ − xⱼ|`, and that its points are the zeros of
the Jacobi polynomial `Pₙ^{(α,β)}`. The same
argument places the zeros of the Hermite polynomial as the equilibrium of n unit charges on the
line in the field x²/4, and the zeros of the Laguerre polynomial as the equilibrium on the half
line with one fixed charge at 0 and a linear field. For n = 2 and α = β = 0 the equilibrium is
±1/√3, the zeros of the Legendre polynomial (3x² − 1)/2.

The second headline is the limit of large degree. For every α, β > −1 the measure that gives
mass 1/n to each zero of `Pₙ^{(α,β)}` converges weakly to the arcsine law `dx / (π √(1 − x²))` on
[−1, 1]: the limit does not depend on the two charges. More generally, if the coefficients of a
three-term recurrence `p_{n+1} = (x − αₙ) pₙ − βₙ p_{n−1}` with βₙ > 0 converge, αₙ → a and
βₙ → b², then the zeros of pₙ are distributed in the limit by the arcsine law of
[a − 2b, a + 2b]. This limit is not the limit of Gauss quadrature: quadrature weights each zero
by its Christoffel number and converges to the orthogonality measure, and for the Legendre
polynomials the two limits integrate x² to 1/3 and to 1/2.

Layer 1 proves the identity for the second derivative of a product of linear factors at one of
its nodes, defines the measure that counts the real roots of a polynomial, and states the
reality and location of the zeros of the three classical families as instances of the general
theory. Layer 2 proves the differential equations of the Jacobi and Laguerre polynomials, the
uniqueness of their polynomial solutions, Stieltjes' theorem in its two forms (critical point and
maximum) and the discriminant of the Jacobi polynomial. Layer 3 turns Chebyshev–Gauss quadrature
into an identity between the counting measure of the Chebyshev zeros and the arcsine law on
polynomials of bounded degree. Layer 4 proves the arcsine limit: for the Chebyshev zeros, as a
criterion in terms of Chebyshev coefficients, for recurrences with convergent coefficients by
traces of Jacobi matrices, and for the Jacobi polynomials.

The general theory of zeros (real, simple, interlacing, inside the interval of orthogonality) and
Gauss quadrature belong to SpecialFunctionsOrthogonalPolynomialsGeneral, and the Jacobi and
Laguerre polynomials with their weights, recurrences and derivative identities to LaguerreJacobi.
StandardDistributions owns the arcsine law on [0, 1], Equidistribution owns Weyl's criterion on
the circle, and RandomMatrices owns the spectral measure of a Hermitian matrix. This roadmap
consumes all five and restates none of their theorems.

## Conventions

- **Zeros.** The zeros of `p : ℝ[X]` are `p.roots : Multiset ℝ`, with multiplicity. A
  configuration of `n` points is `x : Fin n → ℝ`, and "the points of `x` are the zeros of `p`" is
  written `∏ i, (X - C (x i)) = C p.leadingCoeff⁻¹ * p`. No sorted-zero function is introduced:
  the ordered zeros are `zeros μ n` of SpecialFunctionsOrthogonalPolynomialsGeneral.
- **Jacobi.** `Polynomial.jacobi α β n` is the classical `Pₙ^{(α,β)}`, of leading coefficient
  `(n + α + β + 1)ₙ / (2ⁿ n!)`; it is not monic. Orthogonality is against
  `Polynomial.jacobiMeasure α β`, of density `(1 − x)^α (1 + x)^β` on `(-1, 1)`, for `α, β > -1`.
- **Charges.** The charge at `1` is `(α + 1)/2` and the charge at `-1` is `(β + 1)/2`: `α` travels
  with the endpoint `1`, as in the weight. The equilibrium condition at `xᵢ` is
  `∑_{j≠i} 1/(xᵢ − xⱼ) + ((α+1)/2)/(xᵢ − 1) + ((β+1)/2)/(xᵢ + 1) = 0`.
- **Hermite.** `Polynomial.hermite n : ℤ[X]` is Mathlib's probabilists' `Heₙ`, monic, orthogonal
  for the standard Gaussian; its equation is `y'' − x y' + n y = 0` and the equilibrium condition
  is `∑_{j≠i} 1/(xᵢ − xⱼ) = xᵢ/2`. For the physicists' `Hₙ(x) = 2^{n/2} Heₙ(√2 x)` the right-hand
  side is `xᵢ`.
- **Laguerre.** `Polynomial.laguerre α n` is `Lₙ^{(α)}`, of leading coefficient `(-1)ⁿ/n!`; its
  equation is `x y'' + (α + 1 − x) y' + n y = 0` and the equilibrium condition, for a charge
  `(α+1)/2` at `0`, is `∑_{j≠i} 1/(xᵢ − xⱼ) + ((α+1)/2)/xᵢ = 1/2`.
- **The arcsine law on `[-1, 1]`** is `π⁻¹ • Polynomial.Chebyshev.measureT`. Mathlib's `measureT`
  has total mass `π`, so the law integrates `f` to `π⁻¹ * ∫ x, f x ∂measureT`, and limits are
  stated in this form.
- **Weak convergence** of counting measures is stated on test functions:
  `Tendsto (fun n ↦ ∫ x, f x ∂rootMeasure (p n)) atTop (𝓝 (π⁻¹ * ∫ x, f x ∂measureT))` for every
  continuous `f : ℝ → ℝ`. All measures involved are carried by one compact interval, so this is
  convergence in `ProbabilityMeasure ℝ` by `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`;
  the test-function form avoids carrying a proof that `rootMeasure (p n)` is a probability measure
  inside the statement, which fails for `n = 0`.
- **Recurrences.** `Polynomial.monicThreeTerm α β` has `p₀ = 1`, `p₁ = X − α₀`,
  `p_{n+2} = (X − α_{n+1}) p_{n+1} − β_{n+1} p_n`; `β₀` is never read.
- **Names and homes.** Declarations about polynomials are in `Polynomial`, the node identity is
  in `Lagrange`, and the statements about `measureT` follow the namespace of the file that
  receives them. Homes: `TauCeti/LinearAlgebra/Lagrange.lean` (1.1);
  `TauCeti/Analysis/Polynomial/RootMeasure.lean` (1.2);
  `TauCeti/RingTheory/Polynomial/Jacobi/DifferentialEquation.lean` and
  `TauCeti/RingTheory/Polynomial/Laguerre/DifferentialEquation.lean` (2.1);
  `TauCeti/Analysis/SpecialFunctions/Jacobi/Equilibrium.lean` (2.2, 2.3);
  `TauCeti/Analysis/SpecialFunctions/Jacobi/Zeros.lean` (1.3, 4.5);
  `TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Moments.lean` (4.1) and
  `TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Arcsine.lean` (Layer 3, 4.2, 4.3);
  `TauCeti/Analysis/Polynomial/RootMeasure/ThreeTerm.lean` (4.4).

## Layer 1: nodes, the root-counting measure, the classical instances

### 1.1 The second derivative at a node

`Lagrange.eval_derivative_derivative_nodal`: over a field `K`, for `v` injective on `s` and
`i ∈ s`,

`eval (v i) (derivative (derivative (nodal s v))) = 2 * eval (v i) (derivative (nodal s v)) * ∑ j ∈ s.erase i, (v i - v j)⁻¹`.

It is the algebraic content of "the force on the charge at `xᵢ` is `f''(xᵢ) / (2 f'(xᵢ))`", and
the only point where the sums `∑_{j≠i} 1/(xᵢ − xⱼ)` meet polynomials. It holds in every
characteristic: both sides are `2 ∑_{j≠i} ∏_{k≠i,j} (v i − v k)`.

Tau Ceti's `Lagrange.sum_eval_div_sub_mul_eval_derivative_nodal` is the residue sum at a point
that is not a node; the statement here is the value at a node, where that sum is not defined.

*Needs:* Mathlib `Lagrange.derivative_nodal`, `Lagrange.eval_nodal_derivative_eval_node_eq`.

**Checks.**

- `s = {0, 1}`, `v = (a, b)`: `f = (X − a)(X − b)`, `f'' = 2`, `f'(a) = a − b`, and
  `2 (a − b) (a − b)⁻¹ = 2`.
- `f = X³ − X` at the node `1`: `f''(1) = 6`, `f'(1) = 2`, `1/(1 − 0) + 1/(1 + 1) = 3/2`.
- Negative control: without injectivity the right-hand side reads `(v i − v j)⁻¹ = 0` at a repeated
  node while `f'(v i) = 0`, so the identity would assert `f''(v i) = 0`; `f = (X − a)²` has
  `f''(a) = 2`.

### 1.2 The root-counting measure

`Polynomial.rootMeasure (p : ℝ[X]) : Measure ℝ` is
`(p.roots.card : ℝ≥0∞)⁻¹ • (p.roots.map Measure.dirac).sum`: the average of the Dirac masses at the
real roots, with multiplicity. It is `0` when `p` has no real root. API:

- `Polynomial.integral_rootMeasure`: `∫ x, f x ∂rootMeasure p = (p.roots.map f).sum / p.roots.card`;
- `Polynomial.isProbabilityMeasure_rootMeasure`: for `p.roots ≠ 0`;
- `Polynomial.rootMeasure_charpoly`: for a Hermitian `A : Matrix n n ℝ` over a nonempty index
  type, `rootMeasure A.charpoly` is the measure underlying Tau Ceti's
  `Matrix.spectralMeasure A hA`, which is the empirical measure of the eigenvalues
  (`Matrix.spectralMeasure_eq_empiricalMeasureOfFintype_eigenvalues₀`);
- invariance under scaling of `p` by a nonzero constant, and `rootMeasure (p.comp (C a * X + C b))`
  as the image under the inverse affine map, for `a ≠ 0`.

The measure is normalized by the number of real roots and not by the degree, so that it is a
probability measure whenever it is nonzero; for the real-rooted polynomials of this roadmap the
two normalizations agree.

*Needs:* Mathlib `Polynomial.roots`, `MeasureTheory.Measure.dirac`.

**Checks.**

- `rootMeasure (X ^ 2 - 1) = (1/2) δ₋₁ + (1/2) δ₁`; `rootMeasure ((X - 1) ^ 2) = δ₁`.
- `rootMeasure (X ^ 2 + 1) = 0`, and `rootMeasure (C 3) = 0`.

### 1.3 The classical families inside the general theory

- `Polynomial.isOrthogonalityMeasure_jacobiMeasure`: `IsOrthogonalityMeasure (jacobiMeasure α β)`
  for `α, β > -1`;
- `Polynomial.monic_jacobiMeasure`:
  `monic (jacobiMeasure α β) n = C (jacobi α β n).leadingCoeff⁻¹ * jacobi α β n`;
- `Polynomial.roots_jacobi`: for `α, β > -1`, `(jacobi α β n).roots` has no repetition, has `n`
  elements, and lies in `Set.Ioo (-1) 1`;
- `Polynomial.roots_laguerre`: for `α > -1`, `(laguerre α n).roots` has no repetition, has `n`
  elements, and lies in `Set.Ioi 0`;
- `Polynomial.roots_hermite`: `((hermite n).map (Int.castRingHom ℝ)).roots` has no repetition and
  has `n` elements.

Each `roots_` statement is `zeros_spec` and `zeros_mem_Ioo` of
SpecialFunctionsOrthogonalPolynomialsGeneral at the family's measure; interlacing of consecutive
degrees is `zeros_interlace` there and gets no second name here.

*Needs:* SpecialFunctionsOrthogonalPolynomialsGeneral 2.1, 2.2, 5.1; LaguerreJacobi 2.3, 4.3;
OrthogonalL2Bases Part A.

**Checks.**

- `jacobi 0 0 2 = (3X² − 1)/2` has the roots `±3^{-1/2}`; `jacobi 0 1 1 = (3X − 1)/2` has the
  root `1/3`.
- Negative control: `jacobi (-3) 0 1 = −(X + 3)/2` has its root at `-3`, outside `(-1, 1)`; the
  hypothesis `-1 < α` is used.

### Dependencies

1.1 and 1.2 need Mathlib only, and the bridge `rootMeasure_charpoly` needs Tau Ceti's spectral
measure. 1.3 needs SpecialFunctionsOrthogonalPolynomialsGeneral Layers 2 and 5 and the
orthogonality relations of LaguerreJacobi and OrthogonalL2Bases; it is the only place where the
general theory of zeros enters, and Layer 4 does not use it.

## Layer 2: Stieltjes' electrostatics

### 2.1 The differential equations

- `Polynomial.one_sub_X_sq_mul_derivative_derivative_jacobi`: over a commutative `ℚ`-algebra,
  `(1 - X ^ 2) * derivative (derivative (jacobi α β n)) + (C (β - α) - C (α + β + 2) * X) * derivative (jacobi α β n) + C (n * (n + α + β + 1)) * jacobi α β n = 0`;
- `Polynomial.X_mul_derivative_derivative_laguerre`: over a commutative `ℚ`-algebra,
  `X * derivative (derivative (laguerre α n)) + (C (α + 1) - X) * derivative (laguerre α n) + C n * laguerre α n = 0`.

They are identities of polynomials, with no hypothesis on the parameters. The Jacobi equation
follows from `Polynomial.derivative_jacobi` and Tau Ceti's raising relation
`Polynomial.X_sub_one_mul_X_add_one_mul_derivative_jacobi_add_one`; the Laguerre equation from
`Polynomial.derivative_laguerre` and `Polynomial.X_mul_derivative_laguerre_add_one`. Both are
proved at index `n + 1` and checked at index `0`, where the polynomial is `1`.

The Hermite equation `He″ₙ − X He′ₙ + n Heₙ = 0` is not a target: Tau Ceti has it over every
commutative ring as `TauCeti.hermiteHeat_ode` at `t = 1`, and `TauCeti.hermiteHeat_one_right`
identifies `hermiteHeat n 1` with the image of `Polynomial.hermite n`. 2.2 consumes it in that
form.

- `Polynomial.eq_C_mul_jacobi_of_ode`: for `-2 < α + β`, a real polynomial of degree at most `n`
  solving the Jacobi equation of index `n` is `C (p.coeff n / (jacobi α β n).coeff n) * jacobi α β n`.

The hypothesis is what separates the eigenvalues: `n(n+α+β+1) − k(k+α+β+1) = (n−k)(n+k+α+β+1)`,
which is nonzero for `k < n` when `α + β > -2`. The Hermite and Laguerre eigenvalues are `n`, so
their uniqueness statements carry no hypothesis; they are proved inside 2.2 and get no name.

*Needs:* LaguerreJacobi 1.2, 3.3, 3.4; Tau Ceti
`X_sub_one_mul_X_add_one_mul_derivative_jacobi_add_one`, `derivative_laguerre`,
`X_mul_derivative_laguerre_add_one`. *Locator:* DLMF Table 18.8.1.

**Checks.**

- `n = 2`, `α = β = 0`: `y = (3X² − 1)/2`, `(1 − X²) · 3 − 2X · 3X + 6 (3X² − 1)/2 = 0`.
- `n = 1`, general `α, β`: `y = ((α+β+2) X + α − β)/2`, and
  `(β − α − (α+β+2) X)(α+β+2)/2 + (α+β+2)((α+β+2) X + α − β)/2 = 0`.
- `laguerre α 1 = α + 1 − X`: `(α + 1 − X)(−1) + (α + 1 − X) = 0`.
- `laguerre 0 2 = (X² − 4X + 2)/2`: `X · 1 + (1 − X)(X − 2) + (X² − 4X + 2) = 0`.
- Negative control for uniqueness: at `α = β = -1`, `n = 1`, the equation is `(1 − X²) y'' = 0`,
  every polynomial of degree at most one solves it, and `jacobi (-1) (-1) 1 = 0`.

### 2.2 Equilibrium

- `Polynomial.jacobi_equilibrium_iff`: for `α, β > -1` and an injective `x : Fin n → ℝ` with values
  in `Set.Ioo (-1) 1`,

  `(∀ i, ∑ j ∈ univ.erase i, (x i - x j)⁻¹ + (α + 1) / 2 / (x i - 1) + (β + 1) / 2 / (x i + 1) = 0) ↔ ∏ i, (X - C (x i)) = C (jacobi α β n).leadingCoeff⁻¹ * jacobi α β n`;
- `Polynomial.hermite_equilibrium_iff`: for an injective `x : Fin n → ℝ`,
  `(∀ i, ∑ j ∈ univ.erase i, (x i - x j)⁻¹ = x i / 2) ↔ ∏ i, (X - C (x i)) = (hermite n).map (Int.castRingHom ℝ)`;
- `Polynomial.laguerre_equilibrium_iff`: for `α > -1` and an injective `x : Fin n → ℝ` with values
  in `Set.Ioi 0`,
  `(∀ i, ∑ j ∈ univ.erase i, (x i - x j)⁻¹ + (α + 1) / 2 / x i = 1 / 2) ↔ ∏ i, (X - C (x i)) = C (laguerre α n).leadingCoeff⁻¹ * laguerre α n`.

The proof is Stieltjes': with `f = ∏ i, (X − C (x i))`, 1.1 turns the equilibrium conditions into
the vanishing of `(1 − X²) f'' + (β − α − (α+β+2) X) f'` at the `n` roots of `f`; this polynomial
has degree at most `n`, so it is `c f`, the leading coefficients give `c = −n(n+α+β+1)`, and 2.1
identifies `f`. The converse direction evaluates the differential equation at a root, where
`f'` does not vanish by 1.3.

*Needs:* 1.1, 1.3, 2.1; Tau Ceti `hermiteHeat_ode`, `hermiteHeat_one_right`.
*Locator:* Szegő, *Orthogonal Polynomials*, §6.7; Stieltjes, *Sur certains polynômes qui
vérifient une équation différentielle linéaire du second ordre et sur la théorie des fonctions de
Lamé*, Acta Math. 6 (1885).

**Checks.**

- Jacobi, `n = 1`: the equilibrium is `x = (β − α)/(α + β + 2)`, the root of `jacobi α β 1`.
- Jacobi, `n = 2`, `α = β = 0`, `x = ±3^{-1/2}`: at `3^{-1/2}` the three terms are
  `√3/2`, `(1/2)/(3^{-1/2} − 1)` and `(1/2)/(3^{-1/2} + 1)`, of sum `√3/2 − √3/2 = 0`.
- Hermite, `n = 3`, `x = (−√3, 0, √3)`: at `√3`, `1/√3 + 1/(2√3) = √3/2`.
- Laguerre, `n = 1`: `((α+1)/2)/x = 1/2` gives `x = α + 1`, the root of `laguerre α 1`.
- Negative control: the charges `(α+1)/2`, `(β+1)/2` cannot be replaced by `α`, `β`: for
  `α = β = 0` and `n = 1` every `x` would be in equilibrium.

### 2.3 The energy maximum and the discriminant

`Polynomial.stieltjesEnergy (p q : ℝ) (y : Fin n → ℝ) : ℝ` is
`(∏ i, (1 - y i) ^ p * (1 + y i) ^ q) * ∏ i, ∏ j ∈ Ioi i, |y i - y j|`, the exponential of minus the
energy. API: it is continuous on the cube for `p, q ≥ 0`, invariant under permutations of `y`,
positive exactly at the injective configurations inside the open cube (for `p, q > 0`), and its
logarithm there has the partial derivatives that appear in 2.2.

- `Polynomial.isMaxOn_stieltjesEnergy_iff`: for `α, β > -1` and `x` in the cube
  `Set.pi univ fun _ ↦ Set.Icc (-1) 1`,

  `IsMaxOn (stieltjesEnergy ((α + 1) / 2) ((β + 1) / 2)) (Set.pi univ fun _ ↦ Set.Icc (-1) 1) x ↔ ∏ i, (X - C (x i)) = C (jacobi α β n).leadingCoeff⁻¹ * jacobi α β n`;
- `Polynomial.discr_jacobi`: for `α, β > -1`,

  `(jacobi α β n).discr = 2^{-n(n-1)} ∏_{ν=1}^{n} ν^{ν-2n+2} (ν+α)^{ν-1} (ν+β)^{ν-1} (n+ν+α+β)^{n-ν}`.

Existence of a maximum is compactness; a maximum is positive, hence injective and interior; an
interior maximum is a critical point of the logarithm, which is 2.2; so the maximum is attained
exactly on the orbit of the zeros under permutations. With `discr_eq_prod` of
SpecialFunctionsOrthogonalPolynomialsGeneral the discriminant formula gives the maximal value of
the pair interaction in closed form.

*Needs:* 2.2; Mathlib `IsCompact.exists_isMaxOn`, `IsLocalMax.deriv_eq_zero`, `Polynomial.discr`.
*Locator:* Szegő, Theorem 6.7.1 and (6.71.5).

**Checks.**

- `n = 1`: `(1 − y)^p (1 + y)^q` is maximal at `y = (q − p)/(p + q) = (β − α)/(α + β + 2)`.
- `n = 0`: both sides hold; the empty product is `1 = jacobi α β 0`.
- Discriminant, `n = 2`, `α = β = 0`: `(3X² − 1)/2` has discriminant `0 − 4 · (3/2) · (−1/2) = 3`,
  and the formula gives `2^{-2} · (1^{-1} · 3) · (2⁰ · 2 · 2 · 4⁰) = 3`.
- Negative control: at `α = -1` the charge at `1` is `0` and the maximum for `n = 1` is at the
  endpoint `y = 1`, not at a root of `jacobi (-1) β 1` in the open interval.

### Dependencies

2.1 needs the derivative identities of LaguerreJacobi and nothing from Layer 1. 2.2 needs 1.1,
1.3 and 2.1; its Hermite case needs 1.1 and Tau Ceti's Hermite equation, and no measure. 2.3 needs
2.2.

## Layer 3: the quadrature bridge

Gauss quadrature at the zeros of the `n`-th orthogonal polynomial is `gauss_quadrature` of
SpecialFunctionsOrthogonalPolynomialsGeneral, and with 1.3 it holds at `jacobiMeasure α β`:
Gauss–Jacobi quadrature needs no further statement. Its limit, `tendsto_gauss_quadrature`, says
that the zeros **weighted by the Christoffel numbers** converge to the orthogonality measure. The
counting measure weights every zero by `1/n`, and the two coincide for one Jacobi weight only.

- `Polynomial.Chebyshev.integral_eval_rootMeasure_T`: for `n ≠ 0` and `P.degree < 2 * n`,
  `∫ x, P.eval x ∂rootMeasure (T ℝ n) = π⁻¹ * ∫ x, P.eval x ∂measureT`;
- `Polynomial.Chebyshev.christoffelNumber_measureT`: `christoffelNumber measureT n i = π / n`.

The first is Mathlib's `integral_eq_sumZeroes` read through `roots_T_real`, and it is the whole
input of 4.2. The second ties Mathlib's quadrature to the general definition.

*Needs:* 1.2; Mathlib `integral_eq_sumZeroes`, `roots_T_real`;
SpecialFunctionsOrthogonalPolynomialsGeneral 5.3.

**Checks.**

- `n = 1`, `P = 1`: the root-counting measure of `T₁ = X` is `δ₀`, and `π⁻¹ · π = 1`.
- `n = 2`, `P = X²`: the roots are `±2^{-1/2}`, the average of `x²` is `1/2`, and
  `π⁻¹ ∫ x² ∂measureT = 1/2`.
- Negative control on the degree: `P = T₄`, `n = 2`: the average of `T₄` over the roots of `T₂` is
  `-1`, while `∫ T₄ ∂measureT = 0`.
- Negative control on the weight: the Gauss–Legendre weights for `n = 3` are `5/9, 8/9, 5/9`, not
  equal.

### Dependencies

1.2 and Mathlib for the first statement; SpecialFunctionsOrthogonalPolynomialsGeneral 5.3 for the
second.

## Layer 4: the arcsine law

### 4.1 The arcsine law on `[-1, 1]`

- `Polynomial.Chebyshev.integral_pow_measureT`:
  `∫ x, x ^ k ∂measureT = if Even k then π * k.choose (k / 2) / 2 ^ k else 0`;
- `Polynomial.Chebyshev.measureT_eq_smul_map_arcsineMeasure`: `measureT` is `π` times the image of
  `TauCeti.Probability.arcsineMeasure`, the arcsine law of StandardDistributions on `[0, 1]`,
  under `t ↦ 2 * t - 1`.

Integrability of the monomials is Tau Ceti's `integrable_pow_measureT`. The two statements are
equivalent given `TauCeti.Probability.integral_pow_arcsineMeasure` and the binomial theorem; the
direct route to the first is the substitution `x = cos θ` and the Wallis integrals.

*Needs:* Mathlib `integral_measureT_eq_integral_cos`, `integral_cos_pow`; Tau Ceti
`arcsineMeasure`, `integrable_pow_measureT`; StandardDistributions 10.20.

**Checks.** `k = 0`: `π`. `k = 2`: `π/2`. `k = 4`: `3π/8`. `k = 1`: `0`.

### 4.2 The Chebyshev zeros

`Polynomial.Chebyshev.tendsto_integral_rootMeasure_T`: for continuous `f : ℝ → ℝ`,

`Tendsto (fun n : ℕ ↦ ∫ x, f x ∂rootMeasure (T ℝ n)) atTop (𝓝 (π⁻¹ * ∫ x, f x ∂measureT))`.

By Layer 3 the two sides agree on polynomials from some `n` on; Weierstrass on `[-1, 1]` and the
bound `|∫ g ∂ν| ≤ sup_{[-1,1]} |g|` for both probability measures finish. This is the model of every
proof in the layer, and the only one where the equality is exact at finite `n`.

*Needs:* Layer 3; Mathlib `exists_polynomial_near_of_continuousOn`; Tau Ceti
`ae_mem_Icc_measureT`.

**Checks.**

- `f = x²`: the averages are `1/2` for every `n ≥ 2`.
- Negative control: the equally spaced points `−1 + (2i+1)/n` have the limit `∫_{-1}^{1} x²/2 = 1/3`
  for `f = x²`; equal weights alone do not give the arcsine law.

### 4.3 Weyl's criterion in Chebyshev form

`Polynomial.Chebyshev.tendsto_integral_measureT_iff`: for probability measures `μ n` on `ℝ` with
`μ n (Set.Icc (-1) 1)ᶜ = 0`,

`(∀ f, Continuous f → Tendsto (fun n ↦ ∫ x, f x ∂μ n) atTop (𝓝 (π⁻¹ * ∫ x, f x ∂measureT))) ↔ ∀ k ≠ 0, Tendsto (fun n ↦ ∫ x, (T ℝ k).eval x ∂μ n) atTop (𝓝 0)`.

The polynomials `T k` span `ℝ[X]`, and `∫ T k ∂measureT = 0` for `k ≠ 0`; the rest is the density
argument of 4.2. Under `x = cos θ` the functions `T k` are the characters `cos kθ`, so this is the
even part of Weyl's criterion on the circle, which Equidistribution owns; the statement here is the
form that a polynomial sequence can be tested against, and the proof does not pass through the
circle.

*Needs:* Mathlib `integral_eval_T_real_measureT_of_ne_zero`,
`exists_polynomial_near_of_continuousOn`.

**Checks.**

- `μ n = rootMeasure (T ℝ n)`: the average of `T k` over the roots of `T n` is `0` unless `2n ∣ k`,
  so every coefficient is eventually `0`.
- Negative control: `μ n = δ₀` has `∫ T₂ = -1` for all `n`.

### 4.4 Recurrences with convergent coefficients

`Polynomial.tendsto_integral_rootMeasure_monicThreeTerm`: for `α β : ℕ → ℝ` with `0 < β (k + 1)`
for all `k`, `Tendsto α atTop (𝓝 a)`, `Tendsto β atTop (𝓝 (b ^ 2))`, `0 ≤ b`, and continuous `f`,

`Tendsto (fun n : ℕ ↦ ∫ x, f x ∂rootMeasure (monicThreeTerm α β n)) atTop (𝓝 (π⁻¹ * ∫ x, f (a + 2 * b * x) ∂measureT))`.

The limit is the arcsine law of `[a − 2b, a + 2b]`, and `δ_a` when `b = 0`. Proof: by
`charpoly_jacobiMatrix` the polynomial is the characteristic polynomial of the symmetric
tridiagonal matrix `Jₙ` with diagonal `α` and off-diagonal `√β`, so the `k`-th moment of the
counting measure is `tr(Jₙᵏ)/n`. The diagonal entry `(Jₙᵏ)ᵢᵢ` is a fixed polynomial in the
entries of `Jₙ` within distance `k` of `i`; as `i → ∞` it converges to the corresponding entry for
the constant matrix, which is `∑_j C(k, j) a^{k−j} b^j C(j, j/2) [j even]`, the `k`-th moment of
the limit by 4.1. A Cesàro average gives the convergence of all moments; the zeros stay in a
bounded interval because the coefficients are bounded; and the moment-to-weak step is the density
argument of 4.2. The positivity of `β` is used only to make `Jₙ` symmetric, which makes all roots
real.

*Needs:* 1.2, 4.1; SpecialFunctionsOrthogonalPolynomialsGeneral 1.1, 1.3; Mathlib
`Matrix.IsHermitian.trace_eq_sum_eigenvalues`. *Locator:* Nevai, *Orthogonal Polynomials*, Mem.
AMS 213 (1979), §5, Theorem 3; Van Assche, *Asymptotics for Orthogonal Polynomials*, LNM 1265,
Theorem 2.1.

**Checks.**

- `α = 0`, `β = 1/4`: `2ⁿ monicThreeTerm = U n`, with roots `cos(jπ/(n+1))`, and the limit is the
  arcsine law of `[-1, 1]`; `a + 2 b x = x`.
- `α = 0`, `β = 0` from index `2` on is excluded by `0 < β (k + 1)`; with `β → 0` through positive
  values the limit is `δ₀`.
- Negative control: `α = 0`, `β k = k` (Hermite) is not convergent, and the roots of `hermite n`
  leave every bounded interval.

### 4.5 The Jacobi zeros

- `Polynomial.jacobi_eq_C_mul_monicThreeTerm`: for `α, β > -1`, `jacobi α β n` is its leading
  coefficient times `monicThreeTerm a c n`, with `a 0 = (β − α)/(α + β + 2)`,
  `a k = (β² − α²)/((2k+α+β)(2k+α+β+2))` for `k ≥ 1`,
  `c 1 = 4(1+α)(1+β)/((α+β+2)²(α+β+3))`, and
  `c k = 4k(k+α)(k+β)(k+α+β)/((2k+α+β)²((2k+α+β)² − 1))` for `k ≥ 2`;
- `Polynomial.tendsto_integral_rootMeasure_jacobi`: for `α, β > -1` and continuous `f`,

  `Tendsto (fun n : ℕ ↦ ∫ x, f x ∂rootMeasure (jacobi α β n)) atTop (𝓝 (π⁻¹ * ∫ x, f x ∂measureT))`.

The indices `0` and `1` are separate because the uniform formulas read `0/0` there, at
`α + β = 0` and at `α + β = -1`; the second is the Chebyshev weight. With `monic_jacobiMeasure`
(1.3) and `monic_eq_monicThreeTerm` these sequences are `alpha (jacobiMeasure α β)` and
`beta (jacobiMeasure α β)`. Since `a k → 0` and
`c k → 1/4 = (1/2)²`, 4.4 applies with centre `0` and radius parameter `b = 1/2`, which gives the
theorem; the sequence `c` here is the sequence `β` of 4.4. The proof of the limit uses the
explicit formulas and not the identification with `alpha` and `beta`.

*Needs:* 4.4; LaguerreJacobi 3.3 (`jacobi_succ_succ`). *Locator:* DLMF 18.9.2; Szegő, Theorem
12.7.2 for the limit.

**Checks.**

- `α = β = 0`: `a = 0`, `c k = k²/(4k² − 1)`, `c 1 = 1/3`, and
  `monicThreeTerm a c 2 = X² − 1/3 = (2/3) · (3X² − 1)/2`.
- `α = β = -1/2`: `c 1 = 1/2` and `c k = 1/4` for `k ≥ 2`, the recurrence of `2^{1−n} T n`.
- `f = x²`, `α = β = 0`: the average of `x²` over the roots of `Pₙ` tends to `1/2`; it is `1/3` at
  `n = 2` and `2/5` at `n = 3`.
- Negative control: the limit of `tendsto_gauss_quadrature` at `jacobiMeasure 0 0` for `f = x²` is
  `∫_{-1}^{1} x² dx = 2/3`, of normalized value `1/3`, not `1/2`.

### Dependencies

4.1 needs Mathlib and Tau Ceti's arcsine law. 4.2 needs Layer 3. 4.3 needs only Mathlib. 4.4
needs 1.2, 4.1 and the moment-to-weak step of 4.2. 4.5 needs 4.4 and LaguerreJacobi 3.3.

## Downstream consumers

- RandomMatrices: the zeros of `hermite n` are the critical configuration of the eigenvalue
  density of the Gaussian β-ensembles, by `hermite_equilibrium_iff`.
- PolynomialInterpolationAndBestApproximation: the Chebyshev and Jacobi nodes are interpolation
  nodes distributed by the arcsine law, by 4.2 and 4.5.
- SpecialFunctionsOrthogonalPolynomialsGeneral: 4.4 is a statement about its `alpha` and `beta`,
  and `discr_jacobi` evaluates its `discr_eq_prod` for the Jacobi weight.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary, and
none of its statements is specified here.

- **The Erdős–Turán discrepancy bound for zeros**: for a monic polynomial with all roots in
  `[-1, 1]` and `‖p‖_∞ ≤ A/2ⁿ` on `[-1, 1]`, the root-counting measure of any interval differs from
  its arcsine measure by at most `(8/log 3) √(log A / n)` (Erdős–Turán, Ann. of Math. 41 (1940)).
  It is the quantitative form of Layer 4. It consumes discrepancy and the Erdős–Turán inequality
  of ProbabilisticAndMetricNumberTheory and needs sup-norm estimates for the orthogonal
  polynomials that no roadmap states.
- **Potential theory of the interval**: the arcsine law as the equilibrium measure of `[-1, 1]`,
  of capacity `1/2`; Fekete points; the theorem that zeros of polynomials of asymptotically minimal
  norm are distributed by the equilibrium measure (Blatt–Saff–Simkani), and the
  Erdős–Turán-type theorems for measures with almost-everywhere positive density.
- **Varying weights**: the zeros of `hermite n` divided by `2√n` are distributed in the limit by
  the semicircle law of radius `1`, Tau Ceti's `TauCeti.Probability.semicircleMeasure`
  (`TauCeti/Probability/Distributions/Semicircle/Basic.lean`), and the rescaled Laguerre zeros by
  the Marchenko–Pastur law; these need 4.4 for coefficients that converge after a rescaling that
  depends on `n`. The semicircle law for Wigner matrices is RandomMatrices 3.3 and is a different
  theorem.
- **Asymptotics in the Nevai class**: ratio and strong asymptotics, Szegő's theory and the
  Blumenthal–Nevai theorem are outside SpecialFunctionsOrthogonalPolynomialsGeneral and outside
  this roadmap; 4.4 uses the convergence of the coefficients only through traces of powers of
  finite Jacobi matrices.
- **Heine–Stieltjes theory**: the equilibrium problem with more than two fixed charges, Van Vleck
  and Heine–Stieltjes polynomials, and the Lamé case.
- **Monotonicity of zeros in the parameters** (Markov's theorem, Szegő §6.12) and the
  Sturm-comparison bounds on the spacing of Jacobi zeros (Szegő §6.3).

## Scope and ownership

This roadmap owns:

- the identity `f''(xᵢ) = 2 f'(xᵢ) ∑_{j≠i} 1/(xᵢ − xⱼ)` for a nodal polynomial;
- the root-counting measure `Polynomial.rootMeasure` and its API;
- the differential equations of `Polynomial.jacobi` and `Polynomial.laguerre` as identities in
  `R[X]`, and the uniqueness of the polynomial solutions of the Jacobi equation;
- Stieltjes' equilibrium theorems for the three families, the energy functional
  `Polynomial.stieltjesEnergy`, and the value of the Jacobi discriminant;
- the arcsine limit of the root-counting measures: for `Chebyshev.T`, for
  `Polynomial.monicThreeTerm` with convergent coefficients, and for `Polynomial.jacobi`;
- Weyl's criterion on `[-1, 1]` in Chebyshev form.

It consumes, and cites as the owner:

- **SpecialFunctionsOrthogonalPolynomialsGeneral**, which owns `IsOrthogonalityMeasure`, `monic`,
  `zeros`, `zeros_spec`, `zeros_mem_Ioo`, `zeros_interlace`, `exists_zero_between`,
  `christoffelNumber`, `gauss_quadrature`, `tendsto_gauss_quadrature`, `discr_eq_prod`,
  `Polynomial.monicThreeTerm`, `jacobiMatrix`, `charpoly_jacobiMatrix`, `alpha`, `beta`,
  `monic_eq_monicThreeTerm` and `favard`. Reality, simplicity, location, interlacing and Gauss
  quadrature are stated here only as instances of those theorems.
- **LaguerreJacobi**, which owns `Polynomial.jacobi`, `Polynomial.laguerre`,
  `Polynomial.jacobi_succ_succ`, `Polynomial.derivative_jacobi`, `Polynomial.laguerre_succ_succ`,
  `Polynomial.derivative_laguerre`, `Polynomial.jacobiMeasure`, `Polynomial.laguerreMeasure`,
  `Polynomial.integral_jacobi_mul_jacobi_jacobiMeasure`, `Polynomial.jacobi_neg_half_neg_half_eq_T`
  and `Polynomial.jacobiMeasure_neg_half_neg_half_eq_measureT`. It does not state the differential
  equations of the polynomials; those are Layer 2 here.
- **Tau Ceti's Hermite files**, which have the differential equation of the Hermite polynomials
  (`TauCeti.hermiteHeat_ode`); it is consumed in 2.2 and is not a target.
- **OrthogonalL2Bases**, which owns the Hermite orthogonality with respect to the Gaussian measure.
- **StandardDistributions**, which owns the arcsine law on `[0, 1]` as the Beta law of parameters
  `(1/2, 1/2)`, its moments and its distribution function. Layer 4 identifies the normalized
  Chebyshev weight with its image under `t ↦ 2t − 1` and adds no new named measure.
- **Equidistribution**, which owns Weyl's criterion on `AddCircle`, the definition
  `UnifDistributed` and the sequence empirical measure. The criterion of Layer 4 is its image
  under `θ ↦ cos θ`; no circle-side statement is restated here.
- **ProbabilisticAndMetricNumberTheory**, which owns discrepancy, Koksma's inequality and the
  Erdős–Turán inequality. Nothing quantitative is a target here.
- **RandomMatrices**, which owns the spectral measure of a Hermitian matrix,
  `Matrix.spectralMeasure`, the empirical measure `TauCeti.Probability.empiricalMeasureOfFintype`
  of a finite family, and the semicircle law. `Polynomial.rootMeasure` is indexed by a multiset
  of roots and can be zero; on a characteristic polynomial it is the spectral measure, and that
  bridge is a target of Layer 1.
- **ClassicalArithmeticCompletion** and **DiophantineApproximationAndTranscendencePartII**, which
  own Fekete points, transfinite diameter, Chebyshev constants and the logarithmic energy of a
  compact set. The energy of Layer 2 is a function of finitely many points with two fixed
  charges, and no capacity is defined here.

## Exact supplier contracts

### From Mathlib

- Chebyshev polynomials: `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.U`,
  `Polynomial.Chebyshev.one_sub_X_sq_mul_derivative_derivative_T_eq_poly_in_T`
  (`Mathlib/RingTheory/Polynomial/Chebyshev.lean`); their real roots
  `Polynomial.Chebyshev.roots_T_real`, `Polynomial.Chebyshev.roots_T_real_nodup`,
  `Polynomial.Chebyshev.roots_U_real`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/RootsExtrema.lean`).
- The Chebyshev weight: `Polynomial.Chebyshev.measureT`, `integral_measureT`,
  `integral_measureT_eq_integral_cos`, `integral_eval_T_real_measureT_zero`,
  `integral_eval_T_real_measureT_of_ne_zero`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Orthogonality.lean`).
- Chebyshev–Gauss quadrature: `Polynomial.Chebyshev.sumZeroes`,
  `Polynomial.Chebyshev.integral_eq_sumZeroes`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/ChebyshevGauss.lean`).
- Hermite polynomials: `Polynomial.hermite` (`Mathlib/RingTheory/Polynomial/Hermite/Basic.lean`).
- Nodal polynomials: `Lagrange.nodal`, `Lagrange.derivative_nodal`,
  `Lagrange.eval_nodal_derivative_eval_node_eq` (`Mathlib/LinearAlgebra/Lagrange.lean`);
  `Polynomial.derivative_prod` (`Mathlib/Algebra/Polynomial/Derivative.lean`).
- Roots and factorization: `Polynomial.roots`,
  `Polynomial.prod_multiset_X_sub_C_of_monic_of_roots_card_eq`
  (`Mathlib/Algebra/Polynomial/Roots.lean`); `Polynomial.card_roots_le_derivative`
  (`Mathlib/Analysis/Calculus/LocalExtr/Polynomial.lean`).
- The discriminant: `Polynomial.discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`).
- Symmetric matrices: `Matrix.IsHermitian.trace_eq_sum_eigenvalues`
  (`Mathlib/Analysis/Matrix/Spectrum.lean`), `Matrix.trace_eq_sum_roots_charpoly`
  (`Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`).
- Extrema: `IsCompact.exists_isMaxOn` (`Mathlib/Topology/Order/Compact.lean`),
  `IsLocalMax.deriv_eq_zero` (`Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`).
- Weak convergence and approximation:
  `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`
  (`Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`),
  `exists_polynomial_near_of_continuousOn` (`Mathlib/Topology/ContinuousMap/Weierstrass.lean`).
- Wallis integrals: `integral_cos_pow`, `integral_sin_pow_even`
  (`Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean`); `Nat.centralBinom`
  (`Mathlib/Data/Nat/Choose/Central.lean`).

Mathlib has no arcsine law, no root-counting measure, and no statement on the distribution of the
zeros of a polynomial sequence.

### From Tau Ceti

Paths are relative to `TauCeti/`.

- Nodal polynomials (`LinearAlgebra/Lagrange`):
  `Lagrange.sum_eval_div_sub_mul_eval_derivative_nodal` (nodes injective on `s`, `c` not a node,
  `F.degree < #s`); the file is the home of 1.1.
- Three-term recurrences (`RingTheory/Polynomial/ThreeTermRecurrence`):
  `Polynomial.monicThreeTerm`, `Polynomial.monicThreeTerm_add_two`,
  `Polynomial.monic_monicThreeTerm`, `Polynomial.natDegree_monicThreeTerm` (nontrivial ring).
- Jacobi polynomials: `Polynomial.jacobi` (`RingTheory/Polynomial/Jacobi/Basic`);
  `Polynomial.X_sub_one_mul_X_add_one_mul_derivative_jacobi_add_one`
  (`RingTheory/Polynomial/Jacobi/Derivative`); `Polynomial.jacobiMeasure`,
  `ae_mem_Ioo_jacobiMeasure`, `isFiniteMeasure_jacobiMeasure`, `integrable_eval_jacobiMeasure`
  (`Analysis/SpecialFunctions/Jacobi/Measure`, for `α, β > -1`); `jacobi_rodrigues`
  (`Analysis/SpecialFunctions/Jacobi/Rodrigues`).
- Laguerre polynomials: `Polynomial.laguerre` (`RingTheory/Polynomial/Laguerre/Basic`);
  `Polynomial.derivative_laguerre` (at index `n + 1`), `Polynomial.laguerre_succ_succ`,
  `Polynomial.X_mul_derivative_laguerre_add_one` (`RingTheory/Polynomial/Laguerre/Recurrence`);
  `integral_laguerre_mul_laguerre_laguerreMeasure`
  (`Analysis/SpecialFunctions/Laguerre/Orthogonality`).
- Hermite polynomials: `Polynomial.derivative_hermite`, `Polynomial.iterate_derivative_hermite`,
  `Polynomial.hermite_add_two` (`RingTheory/Polynomial/Hermite/Derivative`);
  `TauCeti.hermiteHeat_ode`, `TauCeti.hermiteHeat_one_right`
  (`RingTheory/Polynomial/Hermite/Heat`, any commutative ring); the orthogonality relations of
  `Analysis/SpecialFunctions/Hermite/Orthogonality`.
- The Chebyshev weight: `integrable_pow_measureT`, `integrable_eval_measureT`
  (`Analysis/SpecialFunctions/Trigonometric/Chebyshev/Moments`); `ae_mem_Icc_measureT`,
  `chebyshevMeasureT_univ`, `integral_eval_T_real_mul_eval_T_real_measureT_eq_ite`
  (`…/Chebyshev/Measure`).
- The arcsine law on `[0, 1]`: `TauCeti.Probability.arcsineMeasure`,
  `arcsineMeasure_eq_betaMeasure`, `integral_pow_arcsineMeasure`
  (`Probability/Distributions/Arcsine/Basic`).
- Spectral and empirical measures: `Matrix.spectralMeasure`,
  `Matrix.spectralMeasure_eq_empiricalMeasureOfFintype_eigenvalues₀`
  (`Analysis/Matrix/SpectralMeasure/Basic`, Hermitian matrix, nonempty index type);
  `TauCeti.Probability.empiricalMeasureOfFintype` (`Probability/Process/EmpiricalMeasure`).

Tau Ceti has no root-counting measure of a polynomial, no differential equation for
`Polynomial.jacobi` or `Polynomial.laguerre`, no closed form for the moments of `measureT`, and no
statement on the distribution of the zeros of a polynomial sequence.

### From TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral

- 1.1 `monicThreeTerm` (definition, copied verbatim in `Suggested.lean`); 1.3 `jacobiMatrix`,
  `charpoly_jacobiMatrix`.
- 2.1–2.2 `IsOrthogonalityMeasure`, `monic`; Layer 3 `alpha`, `beta`, `monic_eq_monicThreeTerm`,
  `favard`.
- 5.1–5.6 `zeros`, `zeros_spec`, `zeros_mem_Ioo`, `zeros_interlace`, `exists_zero_between`,
  `christoffelNumber`, `gauss_quadrature`, `tendsto_gauss_quadrature`, `discr_eq_prod`.

### From TauCetiRoadmap.LaguerreJacobi

- 1.2 and 3.3–3.4 `jacobi` (definition, copied verbatim in `Suggested.lean`), `laguerre`,
  `jacobi_succ_succ`, `derivative_jacobi`, `laguerre_succ_succ`, `derivative_laguerre`.
- 2.3 and 4.3 `jacobiMeasure`, `laguerreMeasure`, `integral_jacobi_mul_jacobi_jacobiMeasure`,
  `jacobi_neg_half_neg_half_eq_T`, `jacobiMeasure_neg_half_neg_half_eq_measureT`.

### From TauCetiRoadmap.StandardDistributions

- 10.20, the arcsine law on `[0, 1]` as the Beta law of parameters `(1/2, 1/2)`.

### From TauCetiRoadmap.RandomMatrices

- 1.1, the spectral measure of a Hermitian matrix as an empirical measure.

### From Completed.OrthogonalL2Bases

- Part A, the orthogonality of the Hermite polynomials for the standard Gaussian measure.

## References

- G. Szegő, *Orthogonal Polynomials*, AMS Colloquium Publications 23, 4th ed., 1975: §4.2 (the
  differential equation), §6.7 (electrostatics), §6.71 (discriminants), §12.7 (distribution of
  zeros).
- T. J. Stieltjes, *Sur certains polynômes qui vérifient une équation différentielle linéaire du
  second ordre et sur la théorie des fonctions de Lamé*, Acta Math. 6 (1885), 321–326; *Sur les
  racines de l'équation Xₙ = 0*, Acta Math. 9 (1887), 385–400.
- P. G. Nevai, *Orthogonal Polynomials*, Mem. Amer. Math. Soc. 213, 1979.
- W. Van Assche, *Asymptotics for Orthogonal Polynomials*, Lecture Notes in Math. 1265, Springer,
  1987.
- M. E. H. Ismail, *Classical and Quantum Orthogonal Polynomials in One Variable*, Cambridge,
  2005, §3.5 and §4.
- P. Erdős, P. Turán, *On interpolation III*, Ann. of Math. 41 (1940), 510–553.
- *NIST Digital Library of Mathematical Functions*, §18.8, §18.9, §18.16.

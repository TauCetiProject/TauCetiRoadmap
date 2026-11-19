# Roadmap: polynomial interpolation and best approximation

**Summary.** This roadmap develops the classical theory of approximating a real function on a
compact interval by polynomials in the uniform norm: the error of Lagrange interpolation, the
choice of nodes, the Lebesgue constant that compares interpolation with best approximation, the
existence, uniqueness and characterization of best approximations, the inequalities of Bernstein
and Markov for derivatives of polynomials, and the rates of Jackson and of the Bernstein
polynomials in terms of the modulus of continuity. Functions are real-valued; interpolation
nodes are distinct; the uniform norm on `[a, b]` is the supremum of the absolute value there.
Every target is an identity, an inequality, a characterization or an existence statement about
these objects; no procedure for computing an interpolant or a best approximation is specified.

The headline theorems are these.

- *The interpolation error.* If `f` is `N` times continuously differentiable on `[a, b]` and `p`
  is the polynomial of degree less than `N` that agrees with `f` at `N` distinct points
  `x₁, …, x_N` of `[a, b]`, then for every `x ∈ [a, b]` there is `ξ ∈ [a, b]` with
  `f(x) − p(x) = f⁽ᴺ⁾(ξ)/N! · (x − x₁)⋯(x − x_N)`. At the `n + 1` zeros of the Chebyshev
  polynomial `T_{n+1}` the product is `T_{n+1}/2ⁿ`, and the error on `[−1, 1]` is at most
  `M/(2ⁿ (n + 1)!)` when `|f⁽ⁿ⁺¹⁾| ≤ M` there.
- *Chebyshev's alternation theorem.* For `a < b` and `f` continuous on `[a, b]` there is exactly
  one polynomial of degree at most `n` that minimizes the uniform distance to `f`, and a polynomial
  `p` of degree at most `n` is this one if and only if `f − p` attains its norm with alternating
  signs at `n + 2` increasing points of `[a, b]`.
- *Markov's inequality.* If `p` has degree at most `n` and `|p| ≤ M` on `[−1, 1]`, then
  `|p′| ≤ n² M` on `[−1, 1]`; Bernstein's inequality `√(1 − x²) |p′(x)| ≤ n M` holds there too,
  and its trigonometric form says that `|t′| ≤ n M` on `ℝ` for a trigonometric polynomial `t` of
  degree at most `n` with `|t| ≤ M`.
- *Jackson's theorem.* For `f` continuous on `[a, b]` and `n ≥ 1`, the error of best uniform
  approximation by polynomials of degree at most `n` is at most `6 ω(f, (b − a)/(2n))`, where `ω`
  is the modulus of continuity.

The roadmap builds on Mathlib's Lagrange interpolation, its Chebyshev polynomials with their
roots, their extremal leading coefficient and the bound on derivatives at the endpoint `1`, and
its Bernstein polynomials with Weierstrass' theorem, which this roadmap makes quantitative. Least
squares approximation and Gauss quadrature belong to SpecialFunctionsOrthogonalPolynomialsGeneral,
and polynomial approximation in Sobolev norms on domains of `ℝⁿ` to SobolevPolynomialApproximation;
neither is used here.

## How to read the build

Layer 1 below proves the interpolation error formula, computes the node polynomial of the Chebyshev
points and derives the error bound for interpolation there; it depends on no other layer. Layer 2
defines the error of best uniform approximation and proves de la Vallée-Poussin's lower bound, the
alternation theorem, and existence and uniqueness; it depends on no other layer. Layer 3 defines
Lebesgue functions and constants, proves Lebesgue's inequality, which uses the error of best
approximation of Layer 2, and bounds the Lebesgue constant of the Chebyshev points of Layer 1 by
`(2/π) log n + 3`. Layer 4 proves the inequalities of Bernstein and Markov and depends on no other
layer. Layer 5 defines the modulus of continuity and proves Jackson's theorem, which uses the error
of best approximation of Layer 2, and the rate of the Bernstein polynomials. Within a layer the
sections are in build order.

## Conventions

- **Nodes and interpolation.** Nodes are a finite set `s : Finset ι` with a labelling
  `v : ι → ℝ` that is injective on `s` (`Set.InjOn v s`). The interpolating polynomial of `f` is
  Mathlib's `Lagrange.interpolate s v (fun i => f (v i))`, the unique polynomial of degree less
  than `#s` that agrees with `f` at the nodes; its Lagrange basis polynomials are
  `Lagrange.basis s v i` and the node polynomial `∏ᵢ (X − v i)` is `Lagrange.nodal s v`. With
  `n + 1` nodes the interpolant has degree at most `n`.
- **Chebyshev points.** `chebyshevRoot n i = cos((2i + 1)π/(2n))`; for `i < n` these are the `n`
  zeros of `T n`, the Chebyshev points of the first kind. Trefethen calls the extreme points
  `cos(jπ/n)`, `0 ≤ j ≤ n`, of `T n` the Chebyshev points (ATAP, Chapter 2, eq. (2.2)), and these
  are Mathlib's `Polynomial.Chebyshev.node n j`; they are not used here.
- **Uniform norm and polynomials.** Functions on `[a, b]` are elements of `C(Set.Icc a b, ℝ)`,
  whose norm is the supremum of the absolute value. A real polynomial `p` acts on them as
  `p.toContinuousMapOn (Set.Icc a b)`. "Degree at most `n`" is `p.natDegree ≤ n`, which includes
  the zero polynomial. The error of best approximation `Eₙ(f)` is a distance to a nonempty set and
  is never a supremum of an unbounded set.
- **Suprema.** The Lebesgue constant and the modulus of continuity are suprema of sets of reals;
  every statement uses them for continuous functions on compact sets, where those sets are bounded.
  For `a > b` the interval is empty, every function on it is zero, and every statement about it
  holds trivially.
- **Derivatives.** Higher derivatives of a function on `[a, b]` are taken within `[a, b]`
  (`iteratedDerivWithin`), so that they are the one-sided derivatives at the endpoints.
  Derivatives of polynomials are `Polynomial.derivative`.
- **Trigonometric polynomials.** A real trigonometric polynomial of degree at most `n` is
  `θ ↦ ∑_{k ≤ n} (a_k cos kθ + b_k sin kθ)`.

## Layer 1: the interpolation error

### 1.1 The error formula

Prove `exists_sub_eval_interpolate_eq`: let the `N = #s` nodes be distinct points of `[a, b]`,
let `f` be `N` times continuously differentiable on `[a, b]` (`ContDiffOn ℝ N f (Icc a b)`) and
let `x ∈ [a, b]`. Then there is `ξ ∈ [a, b]` with
`f x − p(x) = f⁽ᴺ⁾(ξ)/N! · ∏ᵢ (x − v i)`, where `p` is the interpolating polynomial and `f⁽ᴺ⁾` is
the `N`-th derivative within `[a, b]`. The formula is due to Cauchy.

Route: if `x` is a node, both sides vanish for every `ξ`. Otherwise let `c` be the quotient of
`f(x) − p(x)` by `ω(x) = ∏ᵢ (x − v i)` and `g = f − p − c ω`. Then `g` vanishes at the `N` nodes
and at `x`, which are `N + 1` distinct points of `[a, b]`. Rolle's theorem applied between
consecutive zeros, `N` times in turn, gives a point `ξ` strictly between the least and the
greatest of these points with `g⁽ᴺ⁾(ξ) = 0`; there the derivative within `[a, b]` is the ordinary
one, `p⁽ᴺ⁾ = 0` because `p` has degree less than `N`, and `ω⁽ᴺ⁾ = N!` because `ω` is monic of
degree `N`. So `f⁽ᴺ⁾(ξ) = c N!`.

**Checks.**
- One node `x₀`: the formula is the mean value theorem, `f(x) − f(x₀) = f′(ξ)(x − x₀)`.
- No node: the interpolant is `0`, `0! = 1` and the empty product is `1`, so the formula says
  `f(x) = f(ξ)`, which `ξ = x` satisfies.
- `f = x²` with nodes `0, 1`: the interpolant is `x`, and the error `x² − x = x(x − 1)` equals
  `f″(ξ)/2! · (x − 0)(x − 1)` for every `ξ`, since `f″ = 2`. In general, for `f = x^N` the
  error is exactly the node polynomial, and for a polynomial `f` of degree less than `N` both sides
  are `0`.
- The nodes must be distinct: if two labels of `s` name the point `0`, the Lagrange basis
  polynomials vanish (a factor `X − 0` divided by `0 − 0` is `0` in Mathlib), the "interpolant" of
  `f = 1` is `0`, and the left side is `1` while the right side is `0`. The formula with repeated
  nodes counted with multiplicity is that of Hermite interpolation, which is not treated here.
- Checked numerically for `exp`, `sin` and `cos 3x` with up to eight random nodes in random
  intervals: the quotient `(f(x) − p(x)) N!/ω(x)` always lies between the least and the greatest
  value of `f⁽ᴺ⁾` on `[a, b]`.

*Needs:* Mathlib `Lagrange.interpolate`, `Lagrange.eval_interpolate_at_node`,
`Lagrange.degree_interpolate_lt`, `Lagrange.eval_nodal`, `exists_hasDerivAt_eq_zero`,
`iteratedDerivWithin`, `ContDiffOn`; Tau Ceti `TauCeti.exists_finset_deriv_eq_zero` (Rolle's
theorem for a finite set of zeros), applied `N` times. (Proved here.)

### 1.2 The node polynomial of the Chebyshev points

Define `chebyshevRoot`, with `chebyshevRoot n i = cos((2i + 1)π/(2n))`, and prove
`nodal_chebyshevRoot`: the node polynomial of the `n + 1` points `chebyshevRoot (n + 1) i`, `i ≤ n`,
is `T_{n+1}/2ⁿ`.

Route: by Mathlib, the roots of `T_{n+1}` over `ℝ` are these `n + 1` points, without repetition,
`T_{n+1}` has degree `n + 1` and leading coefficient `2ⁿ`; a polynomial with as many roots as its
degree is its leading coefficient times the product of `X − r` over its roots.

**Checks.**
- `n = 0`: the single point is `cos(π/2) = 0`, the node polynomial is `X`, and `T₁ = X`.
- `n = 1`: the points are `±1/√2`, the node polynomial is `X² − 1/2`, and `T₂/2 = (2X² − 1)/2`.
- The node polynomial of the extreme points `cos(jπ/n)`, `0 ≤ j ≤ n`, is different: for `n = 1`
  it is `X² − 1`, whose maximum of absolute value on `[−1, 1]` is `1`, not `1/2`.

*Needs:* Mathlib `Lagrange.nodal`, `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.roots_T_real`,
`Polynomial.Chebyshev.roots_T_real_nodup`, `Polynomial.Chebyshev.natDegree_T`,
`Polynomial.Chebyshev.leadingCoeff_T`, `Polynomial.C_leadingCoeff_mul_prod_multiset_X_sub_C`.
(Proved here.)

### 1.3 Interpolation at the Chebyshev points

Prove `abs_sub_eval_interpolate_chebyshevRoot_le`: if `f` is `n + 1` times continuously
differentiable on `[−1, 1]` and the `(n + 1)`-th derivative within `[−1, 1]` is bounded by `M`
there, then the interpolating polynomial `p` at the `n + 1` Chebyshev points satisfies
`|f(x) − p(x)| ≤ M/(2ⁿ (n + 1)!)` for every `x ∈ [−1, 1]`.

Route: 1.1 with `[a, b] = [−1, 1]`, 1.2, and `|T_{n+1}| ≤ 1` on `[−1, 1]`; the Chebyshev points
are distinct points of `[−1, 1]`.

**Checks.**
- `f = exp`, `M = e`, `n = 2`: the largest error on `[−1, 1]` is `0.0565` to three figures, and
  the bound is `e/24 = 0.1133`; for `n = 5` they are `5.18 · 10⁻⁵` and `1.18 · 10⁻⁴`.
- The bound is attained: for `f = x^{n+1}`, with `M = (n + 1)!`, the error is the node polynomial
  `T_{n+1}/2ⁿ`, whose largest absolute value on `[−1, 1]` is `2⁻ⁿ`. By the extremal property of
  `T_{n+1}` in the library (see Scope and ownership below), every other choice of `n + 1` nodes
  gives this `f` a larger largest error.

*Needs:* 1.1, 1.2; Mathlib `Polynomial.Chebyshev.abs_eval_T_real_le_one`,
`Polynomial.Chebyshev.roots_T_real_nodup`, `Lagrange.eval_nodal`. (Proved here.)

### Examples

Interpolation of `exp` at two and three Chebyshev points with the errors and bounds of 1.3; the
error `x(x − 1)` of interpolating `x²` at `0` and `1`.

### Dependencies

Mathlib Lagrange interpolation and node polynomials, Rolle's theorem, the Chebyshev polynomials
`T` with their real roots, degree and leading coefficient. No other layer.

## Layer 2: best uniform approximation

### 2.1 The error of best approximation

Define `polyDegLE`: `polyDegLE a b n ⊆ C([a, b], ℝ)` is the set of functions
`p.toContinuousMapOn (Icc a b)` with `p.natDegree ≤ n`. Define `bestApproxError`:
`bestApproxError a b n f`, written `Eₙ(f)`, is the distance
`Metric.infDist f (polyDegLE a b n)` in the uniform norm. The set contains `0`, so `Eₙ(f)` is a
real number at least `0` and at most `‖f‖`.

**Checks.**
- On `[−1, 1]`, `E₀(x) = 1`, `E₁(x²) = 1/2` (attained by the constant `1/2`) and
  `Eₙ(x^{n+1}) = 2⁻ⁿ`, computed for `n ≤ 4`; the last value is the extremal property of
  `T_{n+1}` again.
- `E₀(exp)` on `[−1, 1]` is `sinh 1`, attained by the constant `cosh 1`: half the difference of
  the largest and least values.
- The degree bound is `natDegree`, not `degree < n`: with the second convention `E₀` would be the
  distance to `{0}`, that is `‖f‖`, and `E₀(1) = 1` instead of `0`.

*Needs:* Mathlib `Polynomial.toContinuousMapOn`, `Metric.infDist`. (Definition.)

### 2.2 de la Vallée-Poussin's lower bound

Prove `inf'_abs_le_bestApproxError`: let `p` have degree at most `n` and let
`x₀ < x₁ < ⋯ < x_{n+1}` be points of `[a, b]` at which the values `f(x_i) − p(x_i)` alternate
strictly in sign (each product of consecutive values is negative). Then the least of the
`|f(x_i) − p(x_i)|` is at most `Eₙ(f)`. The bound is de la Vallée-Poussin's.

Route: if some `q` of degree at most `n` had `‖f − q‖` smaller than every `|f(x_i) − p(x_i)|`,
then `q − p = (f − p) − (f − q)` would have the sign of `f − p` at each `x_i`, hence a zero in each
of the `n + 1` intervals `(x_i, x_{i+1})` by the intermediate value theorem, and would be zero, a
contradiction (the argument of the sufficiency half of the proof of Sun, Theorem 3.5.1, p. 35).

**Checks.**
- On `[−1, 1]` with `n = 1`, `f = x²` and `p = 0`, the values at `−1, 0, 1` are `1, 0, 1`, which
  do not alternate strictly. With `p = 1/2` they are `1/2, −1/2, 1/2`, and the bound
  `E₁(x²) ≥ 1/2` is an equality.
- The points must be increasing: for `f = x`, `p = 0` and `n = 1`, the values at the points
  `1/2, −1, 1`, listed in this order, are `1/2, −1, 1` and alternate, their least absolute value is
  `1/2`, but `E₁(x) = 0`.
- Checked numerically on random `f`, `p` and increasing point sets on `[−1, 1]` with `n ≤ 3`,
  against `Eₙ(f)` computed by linear programming on a fine grid.

*Needs:* 2.1; Mathlib `intermediate_value_Ioo`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`, `Metric.le_infDist`. (Proved here.)

### 2.3 Chebyshev's alternation theorem

Prove `norm_sub_eq_bestApproxError_iff`: for `a < b`, `f ∈ C([a, b], ℝ)` and `p` of degree at
most `n`, `‖f − p‖ = Eₙ(f)` if and only if there are points `x₀ < ⋯ < x_{n+1}` of `[a, b]` and a
sign `σ = ±1` with `f(x_i) − p(x_i) = σ (−1)^i ‖f − p‖` for every `i` (Sun, Theorem 3.5.1, p. 35).

Route: sufficiency is 2.2 when `‖f − p‖ > 0` and trivial when it is `0`. Necessity: if `f = p` on
`[a, b]`, any `n + 2` increasing points serve (here `a < b` is used); otherwise cut `[a, b]` into
intervals on which `f − p` varies by less than half its norm (uniform continuity), group the
intervals that contain a point where `|f − p| = ‖f − p‖` into maximal runs of equal sign, and,
if there are at most `n + 1` runs, subtract a small multiple of a polynomial of degree at most `n`
with the sign of the runs and a zero between consecutive runs, which lowers the norm (Sun, Lemma
3.5.2 and the proof of Theorem 3.5.1, pp. 35–38).

**Checks.**
- `n = 0`: the best constant is `(max f + min f)/2` and `E₀(f) = (max f − min f)/2` (Sun,
  Corollary 3.5.3, p. 39); for `f = x` on `[0, 1]`, `p = 1/2` and the error takes `−1/2, 1/2` at
  `0, 1`.
- `f = x^{n+1}` on `[−1, 1]`: `p = x^{n+1} − T_{n+1}/2ⁿ`, and the error `T_{n+1}/2ⁿ` takes the
  values `±2⁻ⁿ` with alternating signs at the `n + 2` points `cos(kπ/(n + 1))`, `k = n + 1, …, 0`.
- `a < b` is needed: on `[a, a]` there are not `n + 2 ≥ 2` increasing points, so the right side is
  false, while the left side holds for `p` with `p(a) = f(a)`.
- `n + 1` alternation points are not enough: for `f = x²` on `[−1, 1]`, `n = 1` and
  `p = x/2 + 23/32`, the error reaches its norm `25/32` exactly at `−1` (value `25/32`) and at
  `1/4` (value `−25/32`), two points with alternating signs, but `E₁(x²) = 1/2 < 25/32`.

*Needs:* 2.1, 2.2; Mathlib `CompactSpace.uniformContinuous_of_continuous`,
`IsCompact.exists_isMaxOn`, `ContinuousMap.norm_le`, `Polynomial.toContinuousMapOn`.

### 2.4 Existence and uniqueness

Prove `existsUnique_bestApprox`: for `a < b`, every `n` and every `f ∈ C([a, b], ℝ)` there is
exactly one real polynomial `p` with `p.natDegree ≤ n` and `‖f − p‖ = Eₙ(f)` (Sun, Theorem 5.2.3,
p. 70, for existence in a finite-dimensional subspace; Theorem 3.5.4, p. 39, for uniqueness).

Route: existence: `polyDegLE a b n` is the image of the finite-dimensional space of polynomials
of degree at most `n` under a linear map, so its intersection with the closed ball of radius
`‖f‖` about `f` is compact and nonempty, and the distance to it is attained. Uniqueness: if `p`
and `q` are both best, so is `(p + q)/2` by the triangle inequality; at the `n + 2` points of 2.3
for `(p + q)/2` the values `f − p` and `f − q` both have absolute value at most `Eₙ(f)` and
average to `±Eₙ(f)`, so they are equal there, and `p − q`, of degree at most `n`, has `n + 2`
zeros. Since `a < b`, two polynomials equal as functions on `[a, b]` are equal.

**Checks.**
- `a < b` is needed for uniqueness: on `[a, a]` every polynomial with `p(a) = f(a)` is best,
  with error `0`.
- On `[−1, 1]` with `n = 1` and `f = x²`, the best polynomial is the constant `1/2`; the line
  `x/4 + 1/2` is at distance `3/4` and is not best.

*Needs:* 2.1, 2.3; Mathlib `IsCompact.exists_infDist_eq_dist`, `FiniteDimensional.proper`,
`Polynomial.degreeLE`, `Polynomial.toContinuousMapOnAlgHom`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`.

### Examples

`E₁(x²) = 1/2` and `E₀(exp) = sinh 1` on `[−1, 1]`, with their alternation points; `Eₙ(x^{n+1})`
for `n ≤ 4`.

### Dependencies

2.1 is the definition; 2.2 uses 2.1; 2.3 uses 2.2; 2.4 uses 2.3. Mathlib distance to a set,
compactness, uniform continuity, the intermediate value theorem and the count of roots of a
polynomial. No other layer.

## Layer 3: Lebesgue functions and constants

### 3.1 Lebesgue function and Lebesgue constant

Define `lebesgueFunction`, with `lebesgueFunction s v x = ∑_{i ∈ s} |ℓᵢ(x)|` and
`ℓᵢ = Lagrange.basis s v i`, and `lebesgueConstant`: `lebesgueConstant a b s v`, written `Λ`, is
the supremum of the Lebesgue function over `[a, b]`
(Sun, §3.7, eqs. (3.7.2)–(3.7.3), pp. 44–45).

**Checks.**
- One node: the Lebesgue function is `1` everywhere. Two nodes `±1` on `[−1, 1]`: it is
  `(1 − x)/2 + (1 + x)/2 = 1`, so `Λ = 1`.
- Three equally spaced nodes `−1, 0, 1` on `[−1, 1]`: `Λ = 5/4`, attained at `x = ±1/2`. Four
  equally spaced nodes: `Λ = 1.6311` to four places.
- For at least one node in `[a, b]` the Lebesgue constant is at least `1`, the value of the
  Lebesgue function at a node. It is not the largest of the `‖ℓᵢ‖`, which for the three nodes
  `−1, 0, 1` is `1` instead of `5/4`.

*Needs:* Mathlib `Lagrange.basis`. (Definition.)

### 3.2 Lebesgue's inequality

Prove `norm_sub_interpolate_le`: if `n + 1` distinct nodes lie in `[a, b]` and `p` is the
interpolating polynomial of `f ∈ C([a, b], ℝ)`, then `‖f − p‖ ≤ (1 + Λ) Eₙ(f)` (Sun, Theorem
3.7.1, p. 45, stated there on `[−1, 1]`).

Route: for `q` of degree at most `n`, the interpolant of `q` is `q`, so
`f − p = (f − q) − ∑ᵢ (f − q)(xᵢ) ℓᵢ` and `|f(x) − p(x)| ≤ (1 + λ(x)) ‖f − q‖` with `λ(x) ≤ Λ`
(the Lebesgue function is continuous on the compact interval, so its values are bounded by their
supremum). Take the infimum over `q`.

**Checks.**
- One node `c` and `n = 0`: `Λ = 1`, and the inequality says `‖f − f(c)‖ ≤ 2 E₀(f)`, which is
  `max f − min f`; for `f = x` on `[−1, 1]` and `c = 1` both sides are `2`.
- `f = x³` on `[−1, 1]` with `n = 2` and the nodes `−1, 0, 1`: the error is `|x³ − x|`, of norm
  `2/(3√3) = 0.3849`, and `(1 + 5/4) E₂(x³) = (9/4)(1/4) = 0.5625`.

*Needs:* 2.1, 3.1; Mathlib `Lagrange.eq_interpolate`, `Lagrange.interpolate_apply`,
`IsCompact.bddAbove_image`, `Metric.le_infDist`, `ContinuousMap.norm_le`.

### 3.3 The Lebesgue constant of the Chebyshev points

Prove `lebesgueConstant_chebyshevRoot_le`: the Lebesgue constant on `[−1, 1]` of the `n`
Chebyshev points `chebyshevRoot n i`, `i < n`, is at most `(2/π) log n + 3`. (Proved here. Sun,
Theorem 3.7.2, p. 46, states the bound with `4` in place of `3`; the route below does not use the
reduction to the point `x = 1` made in its proof.) For `n = 0` there are no nodes, the Lebesgue
function is `0`, and the statement reads `0 ≤ 3`.

Route: write `x = cos θ` with `θ ∈ [0, π]` and `θᵢ = (2i + 1)π/(2n)`. At a node the Lebesgue
function is `1`. Elsewhere `ℓᵢ(cos θ) = ± sin θᵢ cos nθ / (n (cos θ − cos θᵢ))`, because the node
polynomial is `T n/2ⁿ⁻¹` (1.2) and `T n′(cos θᵢ) = ± n/sin θᵢ`, and
`2 sin θᵢ/(cos θᵢ − cos θ) = cot((θ − θᵢ)/2) − cot((θ + θᵢ)/2)` (Sun, eqs. (3.7.10)–(3.7.11),
p. 46). The angles `±θᵢ` are, modulo `2π`, the `2n` points `φ_k = (2k + 1)π/(2n)`, `k < 2n`, so
`λ(cos θ) ≤ (|cos nθ|/(2n)) ∑_{k<2n} |cot((θ − φ_k)/2)|`, each difference taken in `(−π, π]`.
Replacing `θ` by `−θ` if necessary, let the nearest `φ_k` lie below `θ` at distance
`d ≤ π/(2n)`; then `|cos nθ| = sin nd`, the other differences are `d + jπ/n` for `1 ≤ j ≤ n − 1`
and `−((j + 1)π/n − d)` for `0 ≤ j ≤ n − 1`, and `|cot(u/2)| ≤ 2/|u|` for `0 < |u| ≤ π`. The term
of the nearest point is at most `sin(nd)/(nd) ≤ 1`, the others sum to at most
`(1/π)(H_{n−1} + 2 + ∑_{j=1}^{n−1} 1/(j + 1/2)) ≤ (2/π)(1 + H_{n−1})`, with `H_m` the harmonic
number; and `H_{n−1} ≤ 1 + log n`. So `λ ≤ 1 + 4/π + (2/π) log n < (2/π) log n + 3`.

**Checks.**
- `n = 1`: the single point `0` and Lebesgue function `1`; the bound is `3`.
- `n = 2`: the points `±1/√2` and `Λ = √2`; `n = 3`: `Λ = 5/3`; `n = 4`: `Λ = 1.8478`; `n = 7`:
  `Λ = 2.2022`, to four places, computed by maximizing the Lebesgue function on a fine grid. In
  every case computed (`n ≤ 200`) the maximum is attained at `x = ±1`, where the Lebesgue function
  is `(1/n) ∑_{i<n} cot((2i + 1)π/(4n))`; that identity for all `n` is not a target here.
- For every `n ≤ 2000` checked, that value at `x = 1` is even at most `(2/π) log n + 1`, the
  classical bound attributed to Rivlin, with equality at `n = 1`; that sharper bound is not a
  target here.
- The Lebesgue function of the Chebyshev points is not periodic in `θ` with period `π/n`: for
  `n = 3` it is `5/3` at `θ = 0` (`x = 1`) and `(2 + √3)/3 = 1.2440` at `θ = π/3` (`x = 1/2`).
- Equally spaced points (endpoints included) do better for three points, `5/4` against `5/3`
  for three Chebyshev points, but worse for seven, `4.549` against `2.202`.
- The intermediate bound `λ ≤ (|cos nθ|/(2n)) ∑_k |cot((θ − φ_k)/2)|` of the route was checked on a
  grid away from the nodes for `n ≤ 29`.

*Needs:* 1.2, 3.1; Mathlib `Polynomial.Chebyshev.T_real_cos`,
`Polynomial.Chebyshev.T_derivative_eq_U`, `Polynomial.Chebyshev.U_real_cos`, `Lagrange.basis`,
`Lagrange.basis_eq_prod_sub_inv_mul_nodal_div`, `Real.cot`, `Real.cot_eq_cos_div_sin`,
`Real.le_tan` (for `|cot(u/2)| ≤ 2/|u|`), `harmonic_le_one_add_log`, `Real.log`. (Proved here.)

### Examples

Lebesgue constants of `n ≤ 7` equally spaced points and of `n ≤ 7` Chebyshev points on `[−1, 1]`;
the inequality of 3.2 for `x³` at three equally spaced points.

### Dependencies

3.1 is the definition; 3.2 uses 2.1 and 3.1; 3.3 uses 1.2 and 3.1. Mathlib Lagrange basis
polynomials, compactness, the Chebyshev polynomials and the bound of harmonic numbers by the
logarithm.

## Layer 4: inequalities of Bernstein and Markov

### 4.1 Bernstein's inequality for trigonometric polynomials

Define `trigPoly`, with `trigPoly n a b θ = ∑_{k ≤ n} (a k cos kθ + b k sin kθ)`, and prove
`abs_deriv_trigPoly_le`: if `|trigPoly n a b θ| ≤ M` for all real `θ`, then
`|(trigPoly n a b)′(θ)| ≤ n M` for all `θ` (Sun, Theorem 2.1.1, p. 5; Shadrin, §4.1, eq. (4.3),
p. 36).

Route (Sun's): suppose `M = 1` and that the maximum of `|t′|`, attained at `θ₀`, is `nL > n`;
replacing `t` by `−t` if necessary, `t′(θ₀) = nL`, and `t″(θ₀) = 0` because `θ₀` is a critical
point of `t′`. Then `S(θ) = L sin n(θ − θ₀) − t(θ)` alternates in sign at the `2n` points
`θ₀ + (2k − 1)π/(2n)`, so it has `2n` zeros in a period; counting zeros of `S′` and `S″` with
Rolle's theorem, together with `S′(θ₀) = S″(θ₀) = 0`, forces `S″ ≡ 0`, which is impossible. A
trigonometric polynomial of degree at most `n` with more than `2n` zeros in a period vanishes:
with `z = e^{iθ}` it is `z^{−n}` times a complex polynomial of degree at most `2n`.

**Checks.**
- `t = sin nθ`, `M = 1`: `t′(0) = n`, so the inequality is an equality.
- `n = 0`: `t` is constant and `t′ = 0`.
- The degree matters: `sin 2θ` is bounded by `1` and its derivative reaches `2 > 1`, so it is
  not a trigonometric polynomial of degree at most `1`.
- Checked numerically on random trigonometric polynomials of degree at most `6`.

*Needs:* Mathlib `exists_hasDerivAt_eq_zero`, `Polynomial.card_roots'`, `Real.sin`, `Real.cos`,
`deriv`; Tau Ceti `TauCeti.exists_finset_deriv_eq_zero`. (Proved here.)

### 4.2 Bernstein's inequality for algebraic polynomials

Prove `sqrt_one_sub_sq_mul_abs_derivative_le`: if `p.natDegree ≤ n` and `|p| ≤ M` on `[−1, 1]`,
then `√(1 − x²) |p′(x)| ≤ n M` for `x ∈ [−1, 1]` (Shadrin, §4.1, eq. (4.2), p. 36). At `x = ±1`
the statement is `0 ≤ n M`; the product form avoids dividing by `√(1 − x²)`.

Route: `t(θ) = p(cos θ)` is a trigonometric polynomial of degree at most `n` with `|t| ≤ M`,
because `T k (cos θ) = cos kθ` and `p` is a combination of `T 0, …, T n`; apply 4.1 and
`t′(θ) = −sin θ · p′(cos θ)`.

**Checks.**
- `p = T n`, `n ≥ 1`, at its zero `x = cos(π/(2n))`: `√(1 − x²) |T n′(x)| = n`, an equality.
- `n` odd, `p = T n`, `x = 0`: `|T n′(0)| = n`; for `T 3 = 4x³ − 3x` it is `3`.
- Checked numerically on random polynomials of degree at most `7`.

*Needs:* 4.1; Mathlib `Polynomial.Chebyshev.T_real_cos`, `Polynomial.Chebyshev.natDegree_T`,
`Polynomial.derivative`. (Proved here.)

### 4.3 Markov's inequality

Prove `abs_derivative_le_sq_mul`: if `p.natDegree ≤ n` and `|p| ≤ M` on `[−1, 1]`, then
`|p′(x)| ≤ n² M` for every `x ∈ [−1, 1]` (Shadrin, Theorem 4.1, p. 35, due to A. A. Markov). The
library proves the endpoint case `x = 1`, comparing `p′(1)` with `T n′(1) = n²`; this target is the
inequality on the whole interval.

Route (Schur's argument): assume `n ≥ 1` and `M > 0`, and let `q = p′/(nM)`, of degree at most
`n − 1`, so that `√(1 − x²) |q(x)| ≤ 1` by 4.2. Let `x₁ = cos(π/(2n))` be the largest zero of
`T n`. For `|x| ≤ x₁`, `√(1 − x²) ≥ sin(π/(2n)) ≥ 1/n`, so `|q(x)| ≤ n`. For `x₁ < x ≤ 1`,
interpolate `q` at the `n` zeros `x_j = cos θ_j` of `T n`: the basis polynomials are
`T n(x)/((x − x_j) T n′(x_j))` with `|T n′(x_j)| = n/sin θ_j` and `|q(x_j)| ≤ 1/sin θ_j`, and all
`T n(x)/(x − x_j)` have one sign, with sum `T n′(x)`; so `|q(x)| ≤ |T n′(x)|/n ≤ T n′(1)/n = n`.
The case `x < −x₁` follows by `x ↦ −x`. When `M = 0`, `p` vanishes on `[−1, 1]` and is `0`.

**Checks.**
- `p = T n`, `x = 1`: `T n′(1) = n²`, an equality; for `T 2 = 2x² − 1`, `T 2′(1) = 4`.
- Markov's bound is not Bernstein's: at `x = cos(π/(2n))` Bernstein's bound `n/√(1 − x²)` is
  `n/sin(π/(2n))`, which is `2.83` for `n = 2` and `16.18` for `n = 5`, below `n² = 4` and `25`,
  while near `x = 1` it exceeds `n²`.
- The case `n = 0`: `p` is constant and `p′ = 0`.
- Checked numerically on random polynomials of degree at most `7`; the step "`√(1 − x²)|q| ≤ 1`
  implies `|q| ≤ n` for `q` of degree at most `n − 1`" on random `q` with `n ≤ 8`.

*Needs:* 4.2; Mathlib `Polynomial.Chebyshev.roots_T_real`,
`Polynomial.Chebyshev.abs_iterate_derivative_T_real_le`,
`Polynomial.Chebyshev.derivative_T_eval_one`, `Polynomial.Chebyshev.T_real_cos`,
`Polynomial.Chebyshev.T_derivative_eq_U`, `Polynomial.Chebyshev.U_real_cos`,
`Lagrange.eq_interpolate`, `Real.mul_le_sin`. (Proved here.)

### Examples

`T 2`, `T 3` and `x ↦ x³` with the three inequalities; `sin nθ` for 4.1.

### Dependencies

4.1 is self-contained; 4.2 uses 4.1; 4.3 uses 4.2. Mathlib Rolle's theorem, the Chebyshev
polynomials with their roots and the values of their derivatives at `1`. No other layer.

## Layer 5: moduli of continuity, Jackson's theorem and Bernstein polynomials

### 5.1 The modulus of continuity

Define `modulusOfContinuity`: for `f` on a metric space, `modulusOfContinuity f δ`, written
`ω(f, δ)`, is the supremum of `|f x − f y|` over pairs with `dist x y ≤ δ` (Sun, §2.1.3, p. 6). For
`f` continuous on a compact space the set is bounded and `ω(f, δ)` is a maximum; for `δ < 0` the set
is empty and `ω = 0`. Prove `modulusOfContinuity_mul_le`: for `f ∈ C([a, b], ℝ)` and `λ ≥ 0`,
`ω(f, λδ) ≤ (1 + λ) ω(f, δ)` (Sun, Theorem 2.1.2 (iii), p. 6, for `λ, δ > 0`; the remaining cases
hold because `ω(f, δ) = 0` for `δ ≤ 0`).

Route: for `x < y` with `y − x ≤ mδ`, `m` an integer, split `[x, y]` into `m` steps of length at
most `δ`; this gives `ω(f, mδ) ≤ m ω(f, δ)`, and `λ ≤ m = ⌊λ⌋ + 1 ≤ 1 + λ`.

**Checks.**
- `f = x` on `[0, 1]`: `ω(f, δ) = min(δ, 1)` for `δ ≥ 0`. `f = |x|` on `[−1, 1]`: `ω(f, δ) =
  min(δ, 1)` as well.
- The `1 +` cannot be dropped: for `f = √x` on `[0, 1]`, `ω(f, δ) = √δ` for `δ ≤ 1`, and with
  `λ = 1/2`, `ω(f, δ/2) = √(δ/2) > √δ/2`.
- `λ ≥ 0` is needed: with `λ = −2` and `δ = 1` for `f = x` on `[0, 1]`, the left side is
  `ω(f, −2) = 0` and the right side is `−1`.

*Needs:* Mathlib `IsCompact.bddAbove_image`, `le_csSup`, `csSup_le`. (Proved here.)

### 5.2 Jackson's theorem

Prove `bestApproxError_le_modulusOfContinuity`: for `f ∈ C([a, b], ℝ)` and `n ≥ 1`,
`Eₙ(f) ≤ 6 ω(f, (b − a)/(2n))` (Sun, Theorem 3.4.1, p. 33, with the trigonometric case Theorem
2.4.1, p. 13).

Route: put `g(θ) = f((a + b)/2 + (b − a)/2 · cos θ)`, an even `2π`-periodic function; since
`|cos u − cos v| ≤ |u − v|`, 5.1 with `λ = n|φ|` gives
`|g(θ − φ) − g(θ)| ≤ (1 + n|φ|) ω(f, (b − a)/(2n))`. Convolve `g` with the nonnegative kernel
`uₙ(θ)/π = |∑_{k ≤ n} c_k e^{−ikθ}|²/π`, `c_k = (n + 2)^{−1/2} sin((k + 1)π/(n + 2))`, whose
integral is `1` and whose first cosine moment is `cos(π/(n + 2))` (Sun, Lemma 2.4.4, p. 13). The
convolution of an even function with this even kernel is a combination of `cos kθ`, `k ≤ n`, that is
a polynomial of degree at most `n` in `cos θ`. Its distance to `g` is at most
`(1 + (nπ/√2)(1 − cos(π/(n + 2)))^{1/2}) ω(f, (b − a)/(2n))`, by the bound on `|g(θ − φ) − g(θ)|`,
the Cauchy–Schwarz inequality and `φ² ≤ (π²/2)(1 − cos φ)` on `[−π, π]` (Sun, Theorem 2.3.1, p. 11).
The factor equals `1 + nπ sin(π/(2n + 4)) < 1 + π²/2 < 6`. Substituting back
`cos θ = (2x − a − b)/(b − a)` gives a polynomial in `x`. When `a ≥ b` there is nothing to prove: `[a, b]` has
at most one point and `Eₙ(f) = 0`.

**Checks.**
- `f = |x|` on `[−1, 1]`: `ω(f, 1/n) = 1/n` and `Eₙ(|x|)` is `0.5`, `0.125`, `0.0676`, `0.0347`,
  `0.0278` for `n = 1, 2, 4, 8, 10` (computed by linear programming), far below `6/n`.
- `n ≥ 1` is needed: for `n = 0` the radius `(b − a)/0` is `0` in Lean, `ω(f, 0) = 0`, and
  `E₀(x) = 1/2 > 0` on `[0, 1]`.
- The constants of the route: `1 + nπ sin(π/(2n + 4))` stays below `5.934` for `n < 10⁴`; the
  kernel's integral and first moment were checked numerically for `n ≤ 11`.

*Needs:* 2.1, 5.1; Mathlib `Polynomial.Chebyshev.T_real_cos`, `integral_cos` and
`intervalIntegral.integral_comp_mul_left` (the mass and first moment of the kernel),
`intervalIntegral.integral_mono_on`, `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (the
Cauchy–Schwarz inequality for integrals, with exponents `2, 2`), `Metric.infDist_le_dist_of_mem`,
`ContinuousMap.norm_le`. (Proved here.)

### 5.3 The rate of the Bernstein polynomials

Prove `norm_bernsteinApproximation_sub_le`: for `f ∈ C([0, 1], ℝ)` and `n ≥ 1`,
`‖Bₙ f − f‖ ≤ (3/2) ω(f, 1/√n)`, where `Bₙ f` is Mathlib's `bernsteinApproximation n f`
(Sun, Theorem 3.6.1, p. 40). The estimate is Popoviciu's. Mathlib proves that `Bₙ f → f`
uniformly; this target is the rate.

Route: `Bₙ f(x) − f(x) = ∑_k (f(k/n) − f(x)) b_{n,k}(x)`; bound each term by
`(1 + √n |k/n − x|) ω(f, 1/√n)` (5.1), then use `∑_k b_{n,k} = 1`, the Cauchy–Schwarz inequality
and `∑_k (x − k/n)² b_{n,k}(x) = x(1 − x)/n ≤ 1/(4n)`.

**Checks.**
- `f = |x − 1/2|`, `n = 1`: `B₁ f = 1/2`, `‖B₁ f − f‖ = 1/2`, `ω(f, 1) = 1/2`, bound `3/4`.
  `n = 2`: `B₂ f(x) = 1/2 − x + x²`, error `1/4` at `1/2`, bound `3/4`.
- `n ≥ 1` is needed: `B₀ f` is the constant `f(0)`, and for `f = x` the error is `1`, while
  `1/√0 = 0` in Lean and `ω(f, 0) = 0`.
- Checked numerically for `|x − 1/2|`, `√x` and `sin 7x` with `n ≤ 32`.

*Needs:* 5.1; Mathlib `bernsteinApproximation`, `bernsteinApproximation.apply`,
`bernstein.probability`, `bernstein.variance`, `bernstein_nonneg`, `Finset.sum_mul_sq_le_sq_mul_sq`,
`ContinuousMap.norm_le`. (Proved here.)

### Examples

`Eₙ(|x|)` against `6/n`; `‖Bₙ f − f‖` for `f = |x − 1/2|` against `3/(2√n)`.

### Dependencies

5.1 is the definition and its scaling inequality; 5.2 uses 2.1 and 5.1; 5.3 uses 5.1. Mathlib
Chebyshev polynomials, interval integrals of cosines, the Cauchy–Schwarz inequality for sums and
for integrals, and the Bernstein polynomials.

## Scope and ownership

This roadmap owns the interpolation error formula and the node polynomial and interpolation bound of
the Chebyshev points (Layer 1); the error of best uniform approximation by polynomials with de la
Vallée-Poussin's bound, the alternation theorem, existence and uniqueness (Layer 2); the Lebesgue
function and constant, Lebesgue's inequality and the bound on the Lebesgue constant of the Chebyshev
points (Layer 3); Bernstein's inequalities and Markov's inequality (Layer 4); the modulus of
continuity, Jackson's theorem and the rate of the Bernstein polynomials (Layer 5).

Already in the library and therefore not targets:

- Existence and uniqueness of the interpolating polynomial (`Lagrange.interpolate`,
  `Lagrange.eq_interpolate`, `Lagrange.eval_interpolate_at_node`, `Lagrange.degree_interpolate_lt`
  in `Mathlib/LinearAlgebra/Lagrange.lean`).
- The extremal property of the Chebyshev polynomials
  (`Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one` and
  `Polynomial.Chebyshev.leadingCoeff_eq_iff_of_forall_abs_le_one` in
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Extremal.lean`). Applied to a node
  polynomial of `n + 1` points divided by its largest absolute value on `[−1, 1]`, it says that
  this value is at least `2⁻ⁿ`, with equality, when `n ≥ 1`, only at the Chebyshev points; this
  is the optimality of the Chebyshev points, used above only in Checks.
- The bound on derivatives at points `x ≥ 1`
  (`Polynomial.Chebyshev.eval_iterate_derivative_le_of_forall_abs_le_one`, same file), whose case
  `x = 1`, `k = 1` is Markov's inequality at the endpoint, and the values of derivatives of `T n`
  at `1` (`Polynomial.Chebyshev.derivative_T_eval_one`).
- Uniform convergence of the Bernstein polynomials (`bernsteinApproximation_uniform` in
  `Mathlib/Analysis/SpecialFunctions/Bernstein.lean`) and Weierstrass' theorem
  (`polynomialFunctions_closure_eq_top` in `Mathlib/Topology/ContinuousMap/Weierstrass.lean`).
- Taylor's theorem with the Lagrange remainder (`taylor_mean_remainder_lagrange`), which is the
  limiting case of 1.1 when all nodes merge; 1.1 assumes distinct nodes.

Left to other roadmaps:

- SpecialFunctionsOrthogonalPolynomialsGeneral owns least squares approximation by polynomials
  (its 2.5) and Gauss quadrature with its Christoffel numbers (its 5.3); nothing here is an `L²`
  statement or a quadrature rule.
- Completed/OrthogonalL2Bases owns the Chebyshev basis of `L²([−1, 1])` with the Chebyshev
  weight; it is not used here.
- SobolevPolynomialApproximation owns polynomial approximation in Sobolev norms on domains of
  `ℝⁿ` (averaged Taylor polynomials, Bramble–Hilbert); the one-variable uniform theory here is
  disjoint from it.
- MathematicalStatisticsNonparametric owns smoothing splines (its 5.8); splines are not treated
  here.

Not treated here: numerical quadrature (Newton–Cotes and composite rules, the Peano kernel); Hermite
interpolation and divided differences with repeated nodes; splines; rational approximation; lower
bounds for Lebesgue constants (Faber, Bernstein, Erdős) and the exponential growth of the Lebesgue
constants of equally spaced points; the location of the maximum of the Lebesgue function of the
Chebyshev points and the sharper bound `(2/π) log n + 1` for them; the inequalities of V. A. Markov
for higher derivatives; Jackson's theorems for smooth functions and the converse theorems of
Bernstein; rates for analytic functions and Chebyshev series; the Remez method, the barycentric
formula and any other procedure for computing interpolants or best approximations.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Lagrange.lean`: `Lagrange.interpolate` (for `s : Finset ι` and
  `v : ι → F` over a field, a linear map from values `ι → F` to `F[X]`) with
  `Lagrange.interpolate_apply` (it is `∑_{i ∈ s} C (r i) * Lagrange.basis s v i`),
  `Lagrange.eval_interpolate_at_node` (for `Set.InjOn v s` and `i ∈ s` its value at `v i` is
  `r i`), `Lagrange.degree_interpolate_lt` (for `Set.InjOn v s`, degree `< #s`),
  `Lagrange.eq_interpolate` (for `Set.InjOn v s`, a polynomial of degree `< #s` is the interpolant
  of its own values); `Lagrange.basis` with `Lagrange.basis_eq_prod_sub_inv_mul_nodal_div` (for
  `i ∈ s`, the basis polynomial is `(∏_{j ∈ s, j ≠ i} (v i − v j))⁻¹` times the node polynomial
  divided by `X − v i`); `Lagrange.nodal` with `Lagrange.eval_nodal` (its value at
  `x` is `∏_{i ∈ s} (x − v i)`).
- `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.C_leadingCoeff_mul_prod_multiset_X_sub_C`
  (over a domain, if the number of roots counted with multiplicity is the natural degree, the
  polynomial is its leading coefficient times the product of `X − r` over its roots);
  `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero` (a polynomial vanishing at more
  distinct points than its natural degree is `0`).
- `Mathlib/RingTheory/Polynomial/Chebyshev.lean`: `Polynomial.Chebyshev.T` (indexed by `ℤ`),
  `Polynomial.Chebyshev.natDegree_T` (natural degree `|n|` when `2 ≠ 0`),
  `Polynomial.Chebyshev.leadingCoeff_T` (leading coefficient `2^(|n| − 1)` over a domain with
  `2 ≠ 0`), `Polynomial.Chebyshev.derivative_T_eval_one` (`T n′(1) = n²`),
  `Polynomial.Chebyshev.T_derivative_eq_U` (`T n′ = n U (n − 1)`).
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Basic.lean`:
  `Polynomial.Chebyshev.T_real_cos` (`T n (cos θ) = cos (n θ)`) and
  `Polynomial.Chebyshev.U_real_cos` (`U n (cos θ) sin θ = sin ((n + 1) θ)`).
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/RootsExtrema.lean`:
  `Polynomial.Chebyshev.roots_T_real` (the real roots of `T n` are `cos((2k + 1)π/(2n))`,
  `k < n`), `Polynomial.Chebyshev.roots_T_real_nodup` (they are distinct),
  `Polynomial.Chebyshev.abs_eval_T_real_le_one` (`|T n x| ≤ 1` for `|x| ≤ 1`),
  `Polynomial.Chebyshev.abs_iterate_derivative_T_real_le` (for `|x| ≤ 1`, the absolute value of
  the `k`-th derivative of `T n` at `x` is at most its value at `1`).
- `Mathlib/Topology/ContinuousMap/Polynomial.lean`: `Polynomial.toContinuousMapOn` (a polynomial
  as a continuous function on a set) and `Polynomial.toContinuousMapOnAlgHom` (the same as an
  algebra homomorphism). `Mathlib/RingTheory/Polynomial/Basic.lean`: `Polynomial.degreeLE`.
- `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`: `Metric.infDist`,
  `Metric.infDist_le_dist_of_mem`, `Metric.le_infDist` (for a nonempty set, `r ≤ infDist x s` if
  and only if `r ≤ dist x y` for all `y ∈ s`), `IsCompact.exists_infDist_eq_dist` (the distance
  to a nonempty compact set is attained). `Mathlib/Analysis/Normed/Module/FiniteDimension.lean`:
  `FiniteDimensional.proper` (a finite-dimensional real normed space is proper).
- `Mathlib/Topology/ContinuousMap/Compact.lean`: `ContinuousMap.norm_le` (on a compact space,
  for `0 ≤ C`, `‖f‖ ≤ C` if and only if `‖f x‖ ≤ C` for all `x`).
  `Mathlib/Topology/UniformSpace/HeineCantor.lean`:
  `CompactSpace.uniformContinuous_of_continuous`. `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMaxOn`, `IsCompact.bddAbove_image`.
  `Mathlib/Topology/Order/IntermediateValue.lean`: `intermediate_value_Ioo`.
- `Mathlib/Analysis/Calculus/LocalExtr/Rolle.lean`: `exists_hasDerivAt_eq_zero` (Rolle's
  theorem). `Mathlib/Analysis/Calculus/Deriv/Basic.lean`: `deriv`.
  `Mathlib/Algebra/Polynomial/Derivative.lean`: `Polynomial.derivative`.
  `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`: `iteratedDerivWithin`;
  `ContDiffOn` (`Mathlib/Analysis/Calculus/ContDiff/Defs.lean`).
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/Bounds.lean`: `Real.mul_le_sin`
  (`2/π · x ≤ sin x` for `0 ≤ x ≤ π/2`) and `Real.le_tan` (`x ≤ tan x` for `0 ≤ x < π/2`).
  `Mathlib/NumberTheory/Harmonic/Bounds.lean`: `harmonic_le_one_add_log` (`H_n ≤ 1 + log n`).
  `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.card_roots'` (a polynomial has at most
  as many roots, counted with multiplicity, as its natural degree).
  `Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean`: `integral_cos`
  (`∫_a^b cos x dx = sin b − sin a`). `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`:
  `intervalIntegral.integral_comp_mul_left` (the substitution `x ↦ c x`, `c ≠ 0`) and
  `intervalIntegral.integral_mono_on` (monotonicity of the integral on `[a, b]`).
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder's inequality for nonnegative real
  functions). `Mathlib/Analysis/Complex/Trigonometric.lean`:
  `Real.sin`, `Real.cos`, `Real.cot` and `Real.cot_eq_cos_div_sin`.
  `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`:
  `Real.log`.
- `Mathlib/Order/ConditionallyCompleteLattice/Basic.lean`: `le_csSup` (an element of a set bounded
  above is at most its supremum) and `csSup_le` (a bound of a nonempty set bounds its supremum).
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq` (the
  Cauchy–Schwarz inequality for finite sums).
- `Mathlib/Analysis/SpecialFunctions/Bernstein.lean`: `bernsteinApproximation` (for
  `f : C(unitInterval, E)`, `∑_k b_{n,k} • f(k/n)`) with `bernsteinApproximation.apply`,
  `bernstein_nonneg`, `bernstein.probability` (`∑_k b_{n,k}(x) = 1`) and `bernstein.variance`
  (for `n ≠ 0`, `∑_k (x − k/n)² b_{n,k}(x) = x(1 − x)/n`).

### From Tau Ceti

- `TauCeti/Analysis/Calculus/LocalExtr/Rolle.lean`: `TauCeti.exists_finset_deriv_eq_zero` (if
  `f : ℝ → ℝ` is continuous between the least and the greatest point of a nonempty finite set `Z`
  and vanishes on `Z`, then `deriv f` vanishes on a finite set with one point fewer, each of whose
  points lies strictly between two points of `Z`). It is used in the routes of 1.1 and 4.1 only;
  no statement of `Suggested.lean` mentions it.

No other roadmap is consumed.

## References

- Qiyu Sun, *Elementary Approximation Theory*, lecture notes, version of August 17, 2011,
  available from the author's page at the University of Central Florida; the page numbers above
  are the printed page numbers of that version.
- Aleksei Shadrin, *Twelve proofs of the Markov inequality*, in *Approximation Theory: a volume
  dedicated to Borislav Bojanov* (D. K. Dimitrov, G. Nikolov and R. Uluchev, eds.), Marin Drinov
  Academic Publishing House, Sofia, 2004; the page numbers above are those of the author's copy
  available from his page at the University of Cambridge.
- Lloyd N. Trefethen, *Approximation Theory and Approximation Practice*, Extended Edition, SIAM,
  2019; Chapters 1–6 are available from the author's page at Oxford.
- Attributions made in prose without a locator: Augustin-Louis Cauchy (the interpolation error
  formula, 1840); Pafnuty Chebyshev (the alternation theorem and the extremal polynomials);
  Charles de la Vallée-Poussin (the lower bound of 2.2); Henri Lebesgue (the comparison of 3.2);
  Theodore J. Rivlin (the bound `(2/π) log n + 1`); Sergei Bernstein (the inequalities of 4.1 and
  4.2, 1912); Andrei A. Markov (the inequality of 4.3, 1889); Issai Schur (the route of 4.3);
  Dunham Jackson (the theorem of 5.2, 1911); Tiberiu Popoviciu (the rate of 5.3, 1935).

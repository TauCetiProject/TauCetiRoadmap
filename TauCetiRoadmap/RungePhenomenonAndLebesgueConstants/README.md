# Roadmap: Runge's phenomenon and Lebesgue constants

**Summary.** This roadmap continues the one-variable theory of polynomial interpolation on a
compact interval in three directions: the error of Hermite interpolation, where values and
derivatives are prescribed at each node; the size of Lebesgue constants for the two classical
families of nodes; and Runge's example, which shows that interpolation at equally spaced points
of a smooth function may diverge while interpolation of the same function at Chebyshev points
converges geometrically. Functions are real-valued, nodes are distinct, derivatives on `[a, b]`
are taken within `[a, b]`, and the uniform norm is the supremum of the absolute value. Every
target is an identity, an inequality or an existence statement.

The headline theorems are these.

- *The Hermite error.* Let `N = m₁ + ⋯ + m_r`, let `f` be `N` times continuously differentiable on
  `[a, b]`, and let `p` be a polynomial of degree less than `N` whose derivatives of order less
  than `mᵢ` agree with those of `f` at distinct points `xᵢ` of `[a, b]`. Then for every
  `x ∈ [a, b]` there is `ξ ∈ [a, b]` with
  `f(x) − p(x) = f⁽ᴺ⁾(ξ)/N! · (x − x₁)^{m₁} ⋯ (x − x_r)^{m_r}`.
- *Lebesgue constants.* The Lebesgue constant `Λ` of nodes in `[a, b]` is the norm of
  the interpolation operator on continuous functions. For `n ≥ 1` and the `n + 1` equally spaced
  points of `[−1, 1]` it satisfies `2ⁿ/(4n²) < Λ ≤ 2ⁿ`; for the `n` Chebyshev points it is at least
  `(2/π) log n`.
- *Runge's example.* For `f(x) = 1/(1 + 25x²)` and `n ≥ 1`, the interpolant at the `n + 1`
  equally spaced points of `[−1, 1]` misses `f` at `1 − 1/n` by at least
  `(7/5)ⁿ/(1352 n²)`, which tends to infinity, while the interpolant at the `n + 1` Chebyshev
  points is within `1/sinh((n + 1) arsinh(1/5))` of `f` on all of `[−1, 1]`.

The roadmap builds on PolynomialInterpolationAndBestApproximation, whose Lebesgue function,
Lebesgue constant and Chebyshev points it uses, whose node polynomial of the Chebyshev points
enters the Chebyshev half of Runge's example, and whose upper bound on the Lebesgue constant of
the Chebyshev points the lower bound here complements. It uses Mathlib's Lagrange interpolation
and Chebyshev polynomials and the Tau Ceti form of Rolle's theorem for finitely many zeros.

## How to read the build

Layer 1 proves Rolle's theorem for zeros counted with multiplicity and derives the Hermite error
formula from it. Layer 2 identifies the Lebesgue constant with the operator norm and bounds the
Lebesgue constants of equally spaced points from both sides and of Chebyshev points from below.
Layer 3 computes the interpolation error of the Cauchy kernel `1/(x − z)` exactly and applies it
to Runge's function at both families of nodes; its equally spaced half uses the node convention of
Layer 2. The layers use no theorem of one another; they share definitions only.

## Conventions

- **Nodes and interpolation.** Nodes are a finite set `s : Finset ι` with a labelling `v` that is
  injective on `s`. The interpolant of `f` is Mathlib's
  `Lagrange.interpolate s v (fun i => f (v i))`, of degree less than `#s`; its basis polynomials
  are `Lagrange.basis s v i`, written `ℓᵢ`, and the node polynomial `∏ᵢ (X − v i)` is
  `Lagrange.nodal s v`, written `ω`.
- **Equally spaced points.** `equispacedNode n j = −1 + 2j/n`. For `n ≥ 1` the points with
  `j ≤ n` are the `n + 1` points of `[−1, 1]` with step `2/n`; every statement about them assumes
  `n ≥ 1`, since for `n = 0` Lean's `2j/0 = 0` makes a single node `−1` that is a convention only.
- **Chebyshev points.** `chebyshevRoot n i = cos((2i + 1)π/(2n))`; for `i < n` these are the `n`
  zeros of `T n`. Interpolation "at `n + 1` Chebyshev points" uses `chebyshevRoot (n + 1) i`,
  `i ≤ n`, so that the interpolant has degree at most `n`.
- **Lebesgue function and constant.** `lebesgueFunction s v x = ∑ᵢ |ℓᵢ(x)|`, and
  `lebesgueConstant a b s v`, written `Λ`, is its supremum over `[a, b]` (a `sSup`; for continuous
  functions on a compact interval the set is bounded, and for an empty interval or no nodes `Λ` is
  `0`).
- **Uniform norm.** Functions on `[a, b]` are elements of `C(Set.Icc a b, ℝ)`; a polynomial acts
  there through `Polynomial.toContinuousMapOn`.
- **Derivatives.** Derivatives of order `k` of a function on `[a, b]` are
  `iteratedDerivWithin k f (Icc a b)`; derivatives of polynomials are `Polynomial.derivative`.
  A zero of multiplicity `μ` of `g` at `z` means that the derivatives within `[a, b]` of order
  `k < μ` vanish at `z`.
- **Runge's function** is `rungeFunction x = 1/(1 + 25x²)`. The usual form `1/(1 + x²)` on
  `[−5, 5]` is the same function after the substitution `x ↦ 5x`.

## Layer 1: Rolle's theorem with multiplicities and the Hermite error

### 1.1 Rolle's theorem with multiplicities

Prove `exists_iteratedDerivWithin_eq_zero`: if `g` is `N` times continuously differentiable on
`[a, b]` and has zeros at distinct points `zᵢ` of `[a, b]`, `i ∈ s`, of multiplicities `μᵢ` with
`∑ μᵢ = N + 1`, then `g⁽ᴺ⁾(ξ) = 0` for some `ξ ∈ [a, b]` (derivative within `[a, b]`).

Route (proved here). Show by induction on `k ≤ N` that `g` has a family of distinct points of
`[a, b]` with multiplicities `μ'` summing to `N + 1 − k` such that `g⁽ᵏ⁺ʲ⁾` vanishes at a point
of multiplicity `μ'` for every `j < μ'`. For `k = 0` take the given family without the points of
multiplicity `0`. For the step `k → k + 1 < N + 1` the total is at least `2`. If the family has
one point, lower its multiplicity by one. Otherwise `a < b`, and `h = g⁽ᵏ⁾` is continuous on
`[a, b]` (`ContDiffOn.continuousOn_iteratedDerivWithin`, as `k < N`) and vanishes on the set `Z` of
the points. Tau Ceti's Rolle theorem for finitely many zeros gives a set `Z'` with `#Z − 1`
points on which `deriv h` vanishes, with a point of `Z'` strictly between any two points of `Z`
and every point of `Z'` strictly between two points of `Z`. Counting, `Z'` has exactly one point in
each gap between consecutive points of `Z`, so it is disjoint from `Z` and lies in `(a, b)`, where
`deriv h = g⁽ᵏ⁺¹⁾` (`derivWithin_of_mem_nhds`, `iteratedDerivWithin_succ`). The new family is
`Z'` with multiplicity `1` together with the points of `Z` with multiplicity `μ' − 1`, dropping
those that reach `0`; its total is `(#Z − 1) + (N + 1 − k − #Z) = N − k`. At `k = N` the family has
one point of multiplicity `1`, a zero of `g⁽ᴺ⁾`.

**Checks.**
- `N = 0`: one zero of multiplicity `1`, and the conclusion is that zero.
- `g = (x − 1)² x` on `[0, 1]` with `μ = 2` at `1` and `1` at `0`, `N = 2`: `g″ = 6x − 4` vanishes
  at `2/3`.
- The points must be distinct: `g = x` on `[−1, 1]` with two labels at `0` of multiplicity `1`
  each gives `N = 1`, but `g′ = 1` has no zero.

*Needs:* Tau Ceti `TauCeti.exists_finset_deriv_eq_zero`; Mathlib
`ContDiffOn.continuousOn_iteratedDerivWithin`, `uniqueDiffOn_Icc`, `iteratedDerivWithin_succ`,
`derivWithin_of_mem_nhds`. (Proved here.)

### 1.2 The Hermite error formula

Prove `exists_sub_eval_eq_hermite`: let `N = ∑ mᵢ`, let the nodes `xᵢ` be distinct points of
`[a, b]`, let `f` be `N` times continuously differentiable on `[a, b]` and `p` a polynomial of
degree less than `N` with `f⁽ᵏ⁾(xᵢ) = p⁽ᵏ⁾(xᵢ)` for `k < mᵢ`. Then for every `x ∈ [a, b]` there is
`ξ ∈ [a, b]` with `f(x) − p(x) = f⁽ᴺ⁾(ξ)/N! · ∏ᵢ (x − xᵢ)^{mᵢ}`.

The case `mᵢ = 1` is PolynomialInterpolationAndBestApproximation 1.1; the theorem is the general
multiplicity form, with `ξ` in `[a, b]`.

Route (proved here). Write `Ω = ∏ᵢ (X − xᵢ)^{mᵢ}`, monic of degree `N`. If `N = 0`, then `p = 0`,
every `mᵢ` is `0`, and `ξ = x` works. If `Ω(x) = 0`, then `x = xᵢ` with `mᵢ ≥ 1`, the case
`k = 0` of the hypothesis gives `f(x) = p(x)`, both sides vanish, and `ξ = x` works. Otherwise put
`c = (f(x) − p(x))/Ω(x)` and `g = f − p − cΩ`. The point `x` and a node with `mᵢ ≥ 1` are two
points of `[a, b]`, so `a < b` and derivatives within `[a, b]` of polynomials are their
derivatives. The polynomial `Ω` has `xᵢ` as a root of multiplicity at least `mᵢ`, so `Ω⁽ᵏ⁾(xᵢ) = 0`
for `k < mᵢ` (`Polynomial.isRoot_iterate_derivative_of_lt_rootMultiplicity`); hence `g` has a
zero of multiplicity `mᵢ` at each `xᵢ` and a zero at `x`. Apply 1.1 to the family made of the nodes
with `mᵢ ≥ 1` and the point `x`, which differs from all of them as `Ω(x) ≠ 0` (it may coincide with
a node of multiplicity `0`, which is left out); the multiplicities total `N + 1`. By 1.1, `g⁽ᴺ⁾(ξ) = 0` for some `ξ ∈ [a, b]`. Since `p` has degree less than `N`, `p⁽ᴺ⁾ = 0`; since
`Ω` is monic of degree `N`, `Ω⁽ᴺ⁾ = N!`. So `f⁽ᴺ⁾(ξ) = cN!`, which is the formula.

**Checks.**
- One node `x₀` of multiplicity `N`: `p` is the Taylor polynomial of `f` at `x₀`, and the formula
  is Taylor's theorem with the Lagrange remainder (Mathlib `taylor_mean_remainder_lagrange`, with
  `ξ` between `x₀` and `x`).
- `f = eˣ` on `[0, 1]` with `m = 2` at `0` and `1` at `1`: `p = 1 + x + (e − 2)x²`, and at
  `x = 1/2` the quotient `3!(f(x) − p(x))/(x²(x − 1))` is `1.4808` to four places, inside
  `[1, e]`.
- The bound on the degree of `p` is needed: for `f = x²` on `[0, 1]`, the node `0` with `m = 1`
  and `p = x² + x` (so `p(0) = f(0)`, but `p` has degree `2 ≥ N = 1`), the left side at `x = 1` is
  `−1`, while the right side is `f′(ξ) · 1 = 2ξ ≥ 0` for every `ξ ∈ [0, 1]`.
- The nodes must be distinct: two labels at `0` with `m = 1` each give `N = 2` but only the
  condition `p(0) = f(0)`; for `f = 0` and `p = x` the left side at `x = 1` is `−1` and the right
  side is `0`.
- The same quotient for `sin 3x` (multiplicities `3, 2`), `cos 2x + x⁵` (one node of multiplicity
  `4`) and `1/(1 + x²)` (multiplicities `2, 1, 2`) on `[−1, 1]` lies between the least and the
  greatest value of `f⁽ᴺ⁾` there, at every sample point.

*Needs:* 1.1; Mathlib `Polynomial.isRoot_iterate_derivative_of_lt_rootMultiplicity`,
`Polynomial.iterate_derivative_eq_zero`, `Polynomial.iterate_derivative_X_pow_eq_smul`,
`ContDiffOn`, `iteratedDerivWithin`. (Proved here.)

### Examples

The Hermite cubic through `f(0), f′(0), f(1), f′(1)`, with error `f⁗(ξ)/24 · x²(x − 1)²`.

### Dependencies

1.2 uses 1.1. Tau Ceti's Rolle theorem for finitely many zeros; Mathlib iterated derivatives
within a set, root multiplicities and derivatives of polynomials.

## Layer 2: Lebesgue constants

### 2.1 The Lebesgue constant is the norm of interpolation

The Lebesgue function and constant, `lebesgueFunction` and `lebesgueConstant`, are copied verbatim
from PolynomialInterpolationAndBestApproximation 3.1 (see Conventions).

Prove `norm_interpolate_le_and_exists_eq`: for nodes `v i` of `[a, b]`, `i ∈ s`, every
`f ∈ C([a, b], ℝ)` has `‖p_f‖ ≤ Λ ‖f‖`, where `p_f` is its interpolant, and some `f` with `‖f‖ ≤ 1`
has `‖p_f‖ = Λ`. Trefethen and Weideman (abstract, p. 247) describe `Λ` as the supremum norm of the
interpolation operator.

Route (proved here). For `x ∈ [a, b]`, `|p_f(x)| = |∑ᵢ f(xᵢ) ℓᵢ(x)| ≤ ‖f‖ λ(x) ≤ ‖f‖ Λ`, since the
Lebesgue function `λ` is continuous on the compact interval and so bounded above
(`IsCompact.bddAbove_image`, `le_csSup`); `ContinuousMap.norm_le` gives the first part. For the
second, if `s` is empty take `f = 0` (then `Λ` is the supremum of `{0}` or of `∅`, both `0`).
Otherwise `[a, b]` is nonempty and `λ` attains its maximum `Λ` at some `x*`
(`IsCompact.exists_isMaxOn`). If a point carries two labels of `s`, the basis polynomials of
both contain the factor `basisDivisor y y = 0` and vanish. At each node point `y` put
`σ(y) = 1` if `∑_{v i = y} ℓᵢ(x*) ≥ 0` and `σ(y) = −1` otherwise; since at most one term of that
sum is nonzero, `σ(y) ∑_{v i = y} ℓᵢ(x*) = ∑_{v i = y} |ℓᵢ(x*)|`. The finite set of node points is
closed in `[a, b]` and discrete, `σ` is continuous on it with norm at most `1`, and Tietze's
theorem extends it to `f ∈ C([a, b], ℝ)` with `‖f‖ ≤ 1`. Then `p_f(x*) = λ(x*) = Λ`, so
`‖p_f‖ ≥ Λ`, and the first part gives `‖p_f‖ ≤ Λ`.

**Checks.**
- Nodes `−1, 0, 1` on `[−1, 1]`: `Λ = 5/4`, attained at `x = ±1/2`; the extension of the signs
  `−1, 1, 1` of `ℓᵢ(1/2) = −1/8, 3/4, 3/8` gives `p_f(1/2) = 5/4`.
- Repeated labels are allowed: two labels at the same point have basis polynomials `0` (a factor
  `basisDivisor y y = 0`). With labels at `0, 0, 1` on `[−1, 1]` the Lebesgue function is `x²`,
  `Λ = 1`, and `f = x` has interpolant `x²` of norm `1`.

*Needs:* Mathlib `Lagrange.interpolate_apply`, `Lagrange.basis`, `Lagrange.basisDivisor_self`,
`IsCompact.bddAbove_image`, `IsCompact.exists_isMaxOn`, `le_csSup`, `ContinuousMap.norm_le`,
`BoundedContinuousFunction.exists_extension_norm_eq_of_isClosedEmbedding`,
`Set.Finite.isClosed`. (Proved here.)

### 2.2 Equally spaced points: exponential lower bound

Define `equispacedNode` and prove `lt_lebesgueConstant_equispacedNode`: for `n ≥ 1` the Lebesgue
constant of the `n + 1` equally spaced points of `[−1, 1]` exceeds `2ⁿ/(4n²)`, that is `2ⁿ⁻²/n²`
(Trefethen–Weideman, Theorem 2, eq. (4.3), p. 255, for the points `0, 1, …, n`, eq. (2.3), p. 251;
the Lebesgue constant does not change under an affine change of variable).

Route (own organisation). Take `x₀ = −1 + 1/n`, the midpoint of the first gap. With
`xₖ = −1 + 2k/n`, `x₀ − xₖ = (1 − 2k)/n` and `xⱼ − xₖ = 2(j − k)/n`, so
`|ℓⱼ(x₀)| = P/(|2j − 1| · 2ⁿ j! (n − j)!)` with `P = ∏_{k ≤ n} |2k − 1| = (2n)!/(2ⁿ n!)`. Bounding
`|2j − 1| ≤ 2n − 1` and using `∑ⱼ 1/(j!(n − j)!) = 2ⁿ/n!`,
`λ(x₀) ≥ C(2n, n) 2ⁿ/(4ⁿ(2n − 1)) ≥ 2ⁿ/(2n(2n − 1)) > 2ⁿ/(4n²)`, by
`4ⁿ ≤ 2n C(2n, n)`. Finally `Λ ≥ λ(x₀)` because `x₀ ∈ [−1, 1]` and `λ` is bounded there.

**Checks.**
- `n = 1, 2, 3`: `Λ = 1, 5/4, 1.6311`, against the bounds `1/2, 1/4, 2/9`.
- `λ(x₀)` itself, computed exactly for `n ≤ 30`, is at least `2ⁿ/(2n(2n − 1))` in every case; for
  `n = 10` it is `24.66`, the bound `2.56`.

*Needs:* 2.1 (definitions); Mathlib `Lagrange.basis_eq_prod_sub_inv_mul_nodal_div`,
`Lagrange.eval_basis_not_at_node`, `Nat.four_pow_le_two_mul_self_mul_centralBinom`,
`Nat.sum_range_choose`, `IsCompact.bddAbove_image`, `le_csSup`.

### 2.3 Equally spaced points: upper bound

Prove `lebesgueConstant_equispacedNode_le`: for `n ≥ 1` the Lebesgue constant of the `n + 1`
equally spaced points of `[−1, 1]` is at most `2ⁿ`. Trefethen–Weideman (eq. (4.3), p. 255) prove the bound
`2ⁿ⁺³/n`, which is smaller for `n ≥ 9`.

Route (proved here). Change variable to `t = n(x + 1)/2`, which
takes the nodes to `0, 1, …, n` and leaves every `|ℓⱼ|` unchanged:
`|ℓⱼ| = ∏_{k ≠ j} |t − k| / (j! (n − j)!)`. Let `t ∈ [m, m + 1]` with `0 ≤ m ≤ n − 1`. Then
`|t − k| ≤ m + 1 − k` for `k ≤ m` and `|t − k| ≤ k − m` for `k ≥ m + 1`; each bound is at least
`1`, so omitting the factor `k = j` gives `∏_{k ≠ j} |t − k| ≤ (m + 1)! (n − m)!`. Summing,
`λ ≤ (m + 1)! (n − m)! · 2ⁿ/n! = 2ⁿ (m + 1)/C(n, m) ≤ 2ⁿ`, as `C(n, m) ≥ C(m + 1, m) = m + 1`.
Then `csSup_le` on the nonempty image.

**Checks.**
- `n = 1, …, 8`: `Λ = 1, 1.25, 1.631, 2.208, 3.106, 4.549, 6.930, 10.946` to the places shown,
  against `2, 4, …, 256`.

*Needs:* 2.1 (definitions); Mathlib `Lagrange.eval_basis_not_at_node`, `Nat.sum_range_choose`,
`Nat.choose_le_choose`, `Nat.choose_succ_self_right`, `csSup_le`.

### 2.4 Chebyshev points: the Lebesgue function at the endpoint

The Chebyshev points `chebyshevRoot` are copied verbatim from
PolynomialInterpolationAndBestApproximation 1.2. Prove `lebesgueFunction_chebyshevRoot_one`: the
Lebesgue function of the `n ≥ 1` Chebyshev points at `x = 1` is
`(1/n) ∑_{i<n} cot((2i + 1)π/(4n))` (Sun, p. 47, where the nodes are listed in the opposite order,
eq. (3.7.8), p. 46).

Route (own organisation). Let `θᵢ = (2i + 1)π/(2n) ∈ (0, π)`. The point `1` is not a
node, so `ℓᵢ(1) = ω(1)/((1 − cos θᵢ) ω′(cos θᵢ))` (`Lagrange.eval_basis_not_at_node`,
`Lagrange.nodalWeight_eq_eval_derivative_nodal`). By PolynomialInterpolationAndBestApproximation
1.2 (applied with `n − 1`), `ω = T n/2ⁿ⁻¹`, so `ω(1) = 2¹⁻ⁿ`; `T n′ = n U(n − 1)` and
`U(n − 1)(cos θ) sin θ = sin nθ`, with `sin nθᵢ = ±1`, give `|ω′(cos θᵢ)| = n/(2ⁿ⁻¹ sin θᵢ)`. Hence
`|ℓᵢ(1)| = sin θᵢ/(n(1 − cos θᵢ)) = cot(θᵢ/2)/n`.

**Checks.**
- `n = 1`: the node `0` and `cot(π/4) = 1`. `n = 2`: `(cot(π/8) + cot(3π/8))/2 = √2`.
- `n = 3`: `5/3`; `n = 7`: `2.2022`.

*Needs:* 2.1 (definitions); PolynomialInterpolationAndBestApproximation 1.2
(`nodal_chebyshevRoot`); Mathlib `Lagrange.eval_basis_not_at_node`,
`Lagrange.nodalWeight_eq_eval_derivative_nodal`, `Polynomial.Chebyshev.T_derivative_eq_U`,
`Polynomial.Chebyshev.U_real_cos`, `Polynomial.Chebyshev.T_eval_one`, `Real.cot_eq_cos_div_sin`.

### 2.5 Chebyshev points: logarithmic lower bound

Prove `two_div_pi_mul_log_le_lebesgueConstant_chebyshevRoot`: the Lebesgue constant on `[−1, 1]`
of the `n ≥ 1` Chebyshev points is at least `(2/π) log n`. With
PolynomialInterpolationAndBestApproximation 3.3 it brackets that constant between `(2/π) log n`
and `(2/π) log n + 3`.

Route (proved here). `Λ ≥ λ(1)` since `1 ∈ [−1, 1]`. On `(0, π/2]`, `cot u ≥ 1/u − u/2`: when
`u² ≤ 2` this follows from `cos u ≥ 1 − u²/2 ≥ 0` and `0 < sin u ≤ u`, and otherwise the right
side is negative. With `uᵢ = (2i + 1)π/(4n)`, 2.4 gives
`λ(1) ≥ (4/π) ∑_{i<n} 1/(2i + 1) − π/8`, because `(1/n) ∑ᵢ uᵢ/2 = π/8`. Since
`log(1 + 2/(2i + 1)) ≤ 2/(2i + 1)`, the sum telescopes to `∑_{i<n} 1/(2i + 1) ≥ log(2n + 1)/2`. So
`λ(1) ≥ (2/π) log n + (2/π) log 2 − π/8`, and `(2/π) log 2 > π/8` because
`log 2 > 0.693 > 0.621 > π²/16` (as `π < 3.15`).

**Checks.**
- `n = 1`: `0 ≤ 1`. `n = 2`: `0.4413 ≤ 1.4142`. `n = 100`: `2.9317 ≤ 3.8943`.

*Needs:* 2.4; Mathlib `Real.one_sub_sq_div_two_le_cos`, `Real.sin_le`,
`Real.log_le_sub_one_of_pos`, `Real.log_two_gt_d9`, `Real.pi_lt_d2`, `IsCompact.bddAbove_image`,
`le_csSup`. (Proved here.)

### Examples

Lebesgue constants of up to nine equally spaced and up to seven Chebyshev points.

### Dependencies

2.1 holds the copied definitions and the operator-norm theorem; 2.2 and 2.3 use the definitions
and `equispacedNode`; 2.5 uses 2.4. PolynomialInterpolationAndBestApproximation 1.2 for 2.4.
Mathlib Lagrange interpolation, Chebyshev polynomials, compactness and Tietze's theorem.

## Layer 3: the Runge example

### 3.1 Interpolation of the Cauchy kernel

Prove `X_sub_C_mul_interpolate_inv_sub`: over a field, for nodes distinct on `s` and a point `z`
that is not a node, the interpolant `p` of `x ↦ 1/(x − z)` satisfies
`(X − z) p = 1 − ω/ω(z)`. Evaluated at `x ≠ z` this is the exact error
`1/(x − z) − p(x) = ω(x)/(ω(z)(x − z))`, the polynomial counterpart of Hermite's integral formula
for the interpolation error (Bossoney–Troyanov, eqs. (4.3)–(4.4), pp. 6–7).

Route (proved here). `R = 1 − ω/ω(z)` vanishes at `z`, so `R = (X − z) q` with
`q = R /ₘ (X − z)` (`Polynomial.mul_divByMonic_eq_iff_isRoot`). If `s` is empty, `ω = 1` and
`R = 0 = q`. Otherwise `R` has degree `#s`, so `q` has degree `< #s`; at a node `R(xᵢ) = 1`, so
`q(xᵢ) = 1/(xᵢ − z)`. By `Lagrange.eq_interpolate` and `Lagrange.interpolate_eq_of_values_eq_on`,
`q` is the interpolant.

**Checks.**
- Nodes `0, 1`, `z = 3`: `p = −1/3 − x/6`, and `(x − 3)p = 1 − x(x − 1)/6`.
- No node: `p = 0` and `1 − 1/1 = 0`.
- Distinctness is needed: two labels at the point `0` make the basis polynomials `0`, so `p = 0`,
  while `1 − x²/z² ≠ 0`. The point `z` must not be a node: then `ω(z) = 0`, the right side is `1`,
  and the left side vanishes at `z`.

*Needs:* Mathlib `Lagrange.eq_interpolate`, `Lagrange.interpolate_eq_of_values_eq_on`,
`Lagrange.eval_interpolate_at_node`, `Lagrange.nodal`, `Lagrange.eval_nodal`,
`Lagrange.natDegree_nodal`, `Polynomial.mul_divByMonic_eq_iff_isRoot`,
`Polynomial.natDegree_divByMonic`. (Proved here.)

### 3.2 Divergence at equally spaced points

Define `rungeFunction` and prove `pow_div_le_abs_rungeFunction_sub_interpolate_equispaced`: for the
interpolant `pₙ` of Runge's function at the `n + 1` equally spaced points of `[−1, 1]`, `n ≥ 1`,
`|f(1 − 1/n) − pₙ(1 − 1/n)| ≥ (7/5)ⁿ/(1352 n²)`. The divergence of these interpolants near `±1` is
Runge's phenomenon (Trefethen–Weideman, p. 247); the explicit bound is proved here.

Route (proved here). Let `z = i/5`, `x* = 1 − 1/n`, and let `ω` be the node polynomial.
For real `t`, `f(t) = (1/5) Im(1/(t − z))`; the Lagrange basis polynomials of real nodes are real,
so the real interpolant of `f` is `1/5` times the imaginary part of the complex interpolant of
`1/(t − z)`, and 3.1 over `ℂ` gives `f(x) − pₙ(x) = (1/5) ω(x) Im(1/(ω(z)(x − z)))`.
The nodes are symmetric, so `ω(z)` is real when `n` is odd and imaginary when `n` is even (pairs
contribute `z² − t² = −1/25 − t²`, the node `0` contributes `z`). With
`1/(x − z) = (x + i/5)/(x² + 1/25)` this gives `|f(x*) − pₙ(x*)| = c|ω(x*)|/(5|ω(z)|(x*² + 1/25))`
with `c = 1/5` or `c = x* ≥ 1/2`; as `x*² + 1/25 ≤ 26/25`, the error is at least
`|ω(x*)|/(26|ω(z)|)`.

*The numerator.* `x* − xⱼ = (2(n − j) − 1)/n`, so `|ω(x*)| = (2n)!/(2ⁿ n! nⁿ⁺¹)`; with
`(2n)! = C(2n, n) n!²`, `C(2n, n) ≥ 4ⁿ/(2n)` and `n! ≥ nⁿ e⁻ⁿ`, `|ω(x*)| ≥ (2/e)ⁿ/(2n²)`.

*The denominator.* `log|ω(z)| = (1/2) ∑ⱼ ψ(xⱼ)` with `ψ(t) = log(t² + 1/25)`, even, increasing on
`[0, 1]` and at least `−log 25` there. The positive nodes are `1` and the points `t < 1` with
`t + 2/n` also a node; their intervals `[t, t + 2/n]` tile `[t_min, 1]` with `t_min ≤ 2/n`, and
`ψ(t) ≤ (n/2) ∫ over [t, t + 2/n] of ψ`. With `I = ∫ over [0, 1] of ψ` and
`∫ over [0, t_min] of ψ ≥ −t_min log 25`, the sum over positive nodes is at most
`ψ(1) + (n/2) I + log 25`, the node `0` (if any) contributes
`−log 25 < 0`, and `log|ω(z)| ≤ log 26 + nI/2`. The antiderivative
`t ψ(t) − 2t + (2/5) arctan(5t)` gives `I = log(26/25) − 2 + (2/5) arctan 5 ≤ log(26/25) − 2 + π/5`.

*Together*, the error is at least `ρⁿ/(1352 n²)` with
`ρ = (2/e) e^{−I/2} ≥ 2 e^{−π/10} (25/26)^{1/2}`, and `ρ² ≥ 49/25` because
`e^{π/5} < 1.88 < 2500/1274` (`Real.exp_bound`, `Real.pi_lt_d2`).

**Checks.**
- `n = 2`: error `0.6217`; `n = 20`: `39.99`; `n = 60`: `1.11 · 10⁸`, against the bounds
  `3.6 · 10⁻⁴`, `1.5 · 10⁻³`, `120.3`. The bound exceeds `1` from `n = 44` on.
- The exponential rate of the error is `ρ = 1.4901` to four places, above `7/5`.

*Needs:* 3.1; 2.2 (`equispacedNode`); Mathlib `Lagrange.interpolate_apply`, `Lagrange.basis`,
`Polynomial.map`, `Nat.four_pow_le_two_mul_self_mul_centralBinom`, `Real.pow_div_factorial_le_exp`,
`intervalIntegral.integral_mono_on`, `intervalIntegral.integral_eq_sub_of_hasDerivAt`,
`Real.arctan_lt_pi_div_two`, `Real.exp_bound`, `Real.pi_lt_d2`. (Proved here.)

### 3.3 Convergence at Chebyshev points

Prove `abs_rungeFunction_sub_interpolate_chebyshevRoot_le`: for every `n` and `x ∈ [−1, 1]`, the
interpolant of Runge's function at the `n + 1` Chebyshev points satisfies
`|f(x) − p(x)| ≤ 1/sinh((n + 1) arsinh(1/5))`. The right side is
`2/(ρⁿ⁺¹ − ρ⁻ⁿ⁻¹)` with `ρ = (1 + √26)/5 = 1.2198…`, so the error decreases geometrically. The
bound of PolynomialInterpolationAndBestApproximation 1.3 does not give this: for odd `n`,
`|f⁽ⁿ⁺¹⁾(0)| = (n + 1)! 5ⁿ⁺¹`, so that bound is at least `5ⁿ⁺¹/2ⁿ`.

Route (proved here). As in 3.2, `|f(x) − p(x)| = (1/5)|ω(x)| |Im(1/(ω(z)(x − z)))|`, which is at
most `|ω(x)|/|ω(z)|` because `|x − z| ≥ 1/5`. By PolynomialInterpolationAndBestApproximation 1.2,
`ω = T(n + 1)/2ⁿ`, and over `ℂ` the same holds (`Polynomial.Chebyshev.map_T`), so the quotient is
`|T(n + 1)(x)|/|T(n + 1)(z)| ≤ 1/|T(n + 1)(z)|`. With `y = arsinh(1/5)`,
`cos(π/2 − iy) = i sinh y = z`, so `T(n + 1)(z) = cos((n + 1)(π/2 − iy))`
(`Polynomial.Chebyshev.T_complex_cos`), and `|cos(u − iv)|² = cos² u + sinh² v ≥ sinh² v` gives
`|T(n + 1)(z)| ≥ sinh((n + 1)y) > 0`.

**Checks.**
- `n = 0`: the single node `0`, `p = 1`, largest error `25/26` at `±1`; the bound is `5`.
- `n = 10`: largest error `0.1092` (on a grid of 401 points), bound `0.2277`; `n = 40`:
  `2.89 · 10⁻⁴` and `5.80 · 10⁻⁴`.
- The interval is needed: for `n = 2` the nodes are `0, ±√3/2`, `p = 1 − (100/79)x²`, and at `x = 2`
  the error is `1/101 + 321/79 = 4.073`, above the bound `1.582`.

*Needs:* 3.1; PolynomialInterpolationAndBestApproximation 1.2 (`nodal_chebyshevRoot`); Mathlib
`Polynomial.Chebyshev.map_T`, `Polynomial.Chebyshev.T_complex_cos`,
`Polynomial.Chebyshev.abs_eval_T_real_le_one`, `Complex.cos_sub`, `Complex.cos_mul_I`,
`Complex.sin_mul_I`, `Real.sinh_arsinh`. (Proved here.)

### Examples

Runge's function at nine and seventeen equally spaced and Chebyshev points.

### Dependencies

3.2 and 3.3 use 3.1; 3.2 uses the equally spaced points of 2.2; 3.3 uses the Chebyshev points of
2.4 and PolynomialInterpolationAndBestApproximation 1.2.

## Scope and ownership

This roadmap owns Rolle's theorem with multiplicities and the Hermite error formula (Layer 1);
the identification of the Lebesgue constant with the operator norm, the two bounds for equally
spaced points and the endpoint value and lower bound for Chebyshev points (Layer 2); and the
interpolation of the Cauchy kernel with both halves of Runge's example (Layer 3).

Already in the library and therefore not targets: Lagrange interpolation and its uniqueness
(`Lagrange.interpolate`, `Lagrange.eq_interpolate`); the extremal property of the Chebyshev
polynomials (`Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one`), which applied to a node
polynomial divided by its largest absolute value on `[−1, 1]` gives the `2⁻ⁿ` optimality of the
Chebyshev points; Taylor's theorem with the Lagrange remainder (`taylor_mean_remainder_lagrange`);
Rolle's theorem for finitely many simple zeros (`TauCeti.exists_finset_deriv_eq_zero`).

Stated by other roadmaps on main:

- PolynomialInterpolationAndBestApproximation owns the interpolation error at distinct nodes (its
  1.1), the node polynomial of the Chebyshev points (1.2), the error bound at Chebyshev points
  (1.3), best uniform approximation with de la Vallée-Poussin's bound and the alternation theorem
  (Layer 2), Lebesgue's inequality (3.2) and the bound `(2/π) log n + 3` for the Chebyshev points
  (3.3). The definitions `chebyshevRoot`, `lebesgueFunction` and `lebesgueConstant` are copied
  from it; its 1.2 is used in 2.4 and 3.3.
- ArithmeticInterpolationDeterminants owns the existence and uniqueness of the Hermite
  interpolant over every field (its 1.1, `hermiteJet_bijective`, with Hasse derivatives); 1.2
  here is about any polynomial matching the data and does not use it.

Not treated here: the location of the maximum of the Lebesgue function of the Chebyshev points and
the bound `(2/π) log n + 1`; lower bounds for the Lebesgue constants of arbitrary nodes and
Faber's theorem; the asymptotics of Turetskii and Schönhage for
equally spaced points; the potential-theoretic description of the region of convergence in Runge's
example; Hermite's contour integral itself; splines; any procedure for computing interpolants.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Lagrange.lean`: `Lagrange.interpolate` with `Lagrange.interpolate_apply`
  (the sum `∑ C (r i) * Lagrange.basis s v i`), `Lagrange.eval_interpolate_at_node`,
  `Lagrange.eq_interpolate` (for `Set.InjOn v s`, a polynomial of degree `< #s` is the
  interpolant of its values), `Lagrange.interpolate_eq_of_values_eq_on`; `Lagrange.basis` with
  `Lagrange.basis_eq_prod_sub_inv_mul_nodal_div` and `Lagrange.eval_basis_not_at_node` (for `x`
  not a node, `ℓᵢ(x) = ω(x) · nodalWeight · (x − xᵢ)⁻¹`);
  `Lagrange.nodalWeight_eq_eval_derivative_nodal` (for `Set.InjOn v s` and `i ∈ s`,
  `nodalWeight = (ω′(xᵢ))⁻¹`); `Lagrange.nodal`,
  `Lagrange.eval_nodal`, `Lagrange.natDegree_nodal`.
- `Mathlib/Algebra/Polynomial/Div.lean`: `Polynomial.mul_divByMonic_eq_iff_isRoot`,
  `Polynomial.natDegree_divByMonic`. `Mathlib/Algebra/Polynomial/FieldDivision.lean`:
  `Polynomial.isRoot_iterate_derivative_of_lt_rootMultiplicity`.
  `Mathlib/Algebra/Polynomial/Derivative.lean`: `Polynomial.iterate_derivative_eq_zero` (degree
  below the order), `Polynomial.iterate_derivative_X_pow_eq_smul`.
- `Mathlib/RingTheory/Polynomial/Chebyshev.lean`: `Polynomial.Chebyshev.T_derivative_eq_U`,
  `Polynomial.Chebyshev.T_eval_one`, `Polynomial.Chebyshev.map_T`.
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Basic.lean`:
  `Polynomial.Chebyshev.T_complex_cos` (`T n (cos θ) = cos(nθ)` for complex `θ`),
  `Polynomial.Chebyshev.U_real_cos`. `…/Chebyshev/RootsExtrema.lean`:
  `Polynomial.Chebyshev.abs_eval_T_real_le_one`.
- Calculus: `ContDiffOn.continuousOn_iteratedDerivWithin` (for `k ≤ N` and a set with unique
  derivatives), `uniqueDiffOn_Icc`, `iteratedDerivWithin_succ`, `derivWithin_of_mem_nhds`,
  `taylor_mean_remainder_lagrange`; `intervalIntegral.integral_mono_on`,
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`.
- Topology and order: `IsCompact.bddAbove_image`, `IsCompact.exists_isMaxOn`, `le_csSup`,
  `csSup_le`, `ContinuousMap.norm_le`, `Set.Finite.isClosed`,
  `BoundedContinuousFunction.exists_extension_norm_eq_of_isClosedEmbedding` (Tietze's theorem
  with the norm kept).
- Numbers: `Nat.four_pow_le_two_mul_self_mul_centralBinom` (`4ⁿ ≤ 2n C(2n, n)` for `n > 0`),
  `Nat.sum_range_choose`, `Nat.choose_le_choose`, `Nat.choose_succ_self_right`,
  `Real.pow_div_factorial_le_exp`, `Real.exp_bound`, `Real.log_le_sub_one_of_pos`,
  `Real.log_two_gt_d9`, `Real.pi_lt_d2`, `Real.arctan_lt_pi_div_two`,
  `Real.one_sub_sq_div_two_le_cos`, `Real.sin_le`, `Real.cot_eq_cos_div_sin`, `Real.sinh_arsinh`,
  `Complex.cos_sub`, `Complex.cos_mul_I`, `Complex.sin_mul_I`.

### From Tau Ceti

- `TauCeti/Analysis/Calculus/LocalExtr/Rolle.lean`: `TauCeti.exists_finset_deriv_eq_zero` (for
  `f : ℝ → ℝ` continuous between the least and greatest point of a nonempty finite set `Z` on
  which it vanishes, `deriv f` vanishes on a set `Z'` with `#Z' + 1 = #Z`, every point of `Z'`
  lies strictly between two points of `Z`, and between any two points of `Z` lies a point of
  `Z'`). Used in the route of 1.1; no statement of `Suggested.lean` mentions it.

### From TauCetiRoadmap.PolynomialInterpolationAndBestApproximation

- `chebyshevRoot`, `lebesgueFunction`, `lebesgueConstant` (its 1.2 and 3.1), copied verbatim.
- 1.2 `nodal_chebyshevRoot`: the node polynomial of `chebyshevRoot (n + 1) i`, `i ≤ n`, is
  `C (2ⁿ)⁻¹ * T (n + 1)`. Used in the routes of 2.4 and 3.3.

## References

- Lloyd N. Trefethen and J. A. C. Weideman, *Two results on polynomial interpolation in equally
  spaced points*, Journal of Approximation Theory 65 (1991), 247–260; available from Trefethen's
  page at Oxford.
- Qiyu Sun, *Elementary Approximation Theory*, lecture notes, version of August 17, 2011,
  available from the author's page at the University of Central Florida; page numbers are the
  printed ones.
- Simon Bossoney and Marc Troyanov, *A direct approach to Hermite interpolation*,
  arXiv:2607.17998v4 (2026).
- Attributions made in prose without a locator: Carl Runge (the example, 1901); Charles Hermite (interpolation with derivatives and his integral formula, 1878,
  as reported by Bossoney and Troyanov).

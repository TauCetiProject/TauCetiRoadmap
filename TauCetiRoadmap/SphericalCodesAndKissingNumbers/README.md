# Roadmap: spherical codes and kissing numbers

**Summary.** A spherical code in `ℝⁿ` with inner-product bound `s` is a finite set `C` of unit
vectors with `⟨x, y⟩ ≤ s` for any two distinct points; for `s = cos θ`, `θ ∈ [0, π]`, its points
are at angular distance at least `θ`. A kissing configuration is a set of non-overlapping unit
balls touching a central unit ball; their centres, divided by two, form exactly a spherical code
with `s = 1/2`. The kissing number of `ℝⁿ` is the largest size of such a configuration. All codes
are finite, the empty code included, and the dimension is `n ≥ 2` wherever zonal polynomials
enter.

The headline theorems are these.

- *The linear programming bound* (Delsarte, Goethals and Seidel). Let `n ≥ 2` and
  `h = ∑_{k ≤ d} c_k ω_{n,k}`, where `ω_{n,k}` is the zonal (Gegenbauer) polynomial normalised by
  `ω_{n,k}(1) = 1`, with every `c_k ≥ 0`, `c_0 > 0`, and `h(t) ≤ 0` for `−1 ≤ t ≤ s`. Then every
  spherical code in `ℝⁿ` with bound `s` has at most `h(1)/c_0` points. If it has exactly
  `h(1)/c_0` points, then `h(⟨x, y⟩) = 0` for any two distinct points, and
  `∑_{y ∈ C} ω_{n,k}(⟨z, y⟩) = 0` for every unit vector `z` and every `1 ≤ k ≤ d` with `c_k > 0`.
- *Kissing numbers.* The kissing number is `6` in `ℝ²` and, by Levenshtein and by Odlyzko and
  Sloane, `240` in `ℝ⁸` and `196560` in `ℝ²⁴`: configurations of these sizes exist and none is
  larger.
- *Rigidity of the inner products.* In a spherical code of `240` points in `ℝ⁸` with bound `1/2`,
  distinct points have inner product `−1`, `−1/2`, `0` or `1/2`, and every point sees exactly
  `1`, `56`, `126`, `56` others at these values; with `196560` points in `ℝ²⁴` the values are
  `−1`, `±1/2`, `±1/4`, `0`, with counts `1`, `4600`, `47104`, `93150`, `47104`, `4600` (from
  `−1` up to `1/2`).
- *Lattices.* The minimal vectors of a positive definite integral lattice of rank `n`, realised in
  `ℝⁿ` and rescaled to unit length, form a spherical code with bound `1/2` whose size is the
  lattice kissing number.

The zonal polynomials, the zonal harmonics and their reproducing property on the sphere come from
the roadmap SpecialFunctionsHigherSpheres; the linear programming bound rests on that property.
The integral lattices of Tau Ceti supply the `E₈` and Leech lattices with their kissing numbers
`240` and `196560` and the real model of a positive definite lattice, which give the lower bounds.
The roadmap LatticePackingsAndPerfectForms treats the lattice side (Hermite constants, designs
formed by lattice shells), and the roadmap BoundsOnCodes states the analogous linear programming
bound for codes in Hamming space.

Layer 1 below defines codes and kissing configurations and turns lattice shells into codes.
Layer 2 proves the linear programming bound and its equality case. Layer 3 settles the kissing
numbers in dimensions `2`, `8` and `24` with explicit polynomials, printed with their expansions.
Layer 4 derives the inner-product counts of the codes that attain the bound.

## Conventions

- **Space.** Points live in `EuclideanSpace ℝ (Fin n)`, with inner product `⟨x, y⟩` (Lean
  `⟪x, y⟫_ℝ`) and norm `‖x‖`. For unit vectors, `‖x − y‖² = 2 − 2⟨x, y⟩` and
  `−1 ≤ ⟨x, y⟩ ≤ 1`, with `⟨x, y⟩ = −1` exactly when `y = −x`.
- **Codes.** `IsSphericalCode C s` for `C : Finset (EuclideanSpace ℝ (Fin n))` says that every
  point of `C` has norm `1` and that `⟨x, y⟩ ≤ s` for distinct `x, y ∈ C`. The literature's
  "code with minimal angle at least `θ`", for `0 ≤ θ ≤ π`, is `IsSphericalCode C (cos θ)`. The
  parameter `s` is any real number: for `s < −1` a code has at most one point, and the empty set
  is a code for every `s`.
- **Kissing configurations.** `IsKissingConfiguration C` says that every point of `C` has norm
  `2` and distinct points are at distance at least `2`: the unit balls about the points of `C`
  touch the unit ball about the origin and have disjoint interiors. The map `x ↦ x/2` is a
  bijection from kissing configurations onto spherical codes with `s = 1/2`, since for
  `‖x‖ = ‖y‖ = 2` one has `⟨x/2, y/2⟩ = (8 − ‖x − y‖²)/8`.
- **Kissing numbers.** The kissing number of `ℝⁿ` is stated through `IsGreatest` of the set of
  sizes of kissing configurations, so that "`τ` configurations of size `τ` exist and none is
  larger" is one statement and no supremum of a set of natural numbers is taken.
- **Zonal polynomials.** `zonalPolynomial n k` (`ω_{n,k}`) is the polynomial of
  SpecialFunctionsHigherSpheres 3.1, copied verbatim into `Suggested.lean`: the terminating sum
  `∑_{j ≤ k} (−k)_j (k + n − 2)_j / (((n − 1)/2)_j j!) ((1 − t)/2)^j`, with `(a)_j` the rising
  factorial. It satisfies `ω_{n,k}(1) = 1`; for `n ≥ 3` it is `C_k^{(λ)}/C_k^{(λ)}(1)` with
  `λ = (n − 2)/2` and `C_k^{(λ)}(1) = (n − 2)_k / k!` (the Gegenbauer polynomial of LaguerreJacobi
  6.2), and for `n = 2` it is the Chebyshev polynomial `T_k`. Coefficients `c_k` of `h` in the
  basis `ω_{n,k}` are called zonal coefficients; for `n ≥ 3` the Gegenbauer coefficients are
  `c_k / C_k^{(λ)}(1)`, positive exactly when `c_k` is, and the constant coefficient is the same
  in both bases, since `ω_{n,0} = C_0^{(λ)} = 1`. Cohn states the bound for an ultraspherical
  family normalised only up to positive factors (Lecture 4, §5, p. 42), which is the same
  statement.
- **Dimension.** Layers 2–4 are stated for `n ≥ 2`, the range on which `ω_{n,k}` is the
  normalised Gegenbauer polynomial (`n ≥ 3`) or the Chebyshev polynomial (`n = 2`) and on which
  SpecialFunctionsHigherSpheres states the reproducing property; for `n ≤ 1` the defining sum
  has the parameter `(n − 1)/2 ≤ 0` in a denominator.
- **Lattices.** A lattice is a `TauCeti.IntegralLattice V` on a rational vector space `V`; its
  minimum `L.minimum` and kissing number `L.kissingNumber` (the number of nonzero vectors of norm
  `L.minimum`) are Tau Ceti's. Norms of lattice vectors are squared lengths.

## Layer 1: spherical codes, kissing configurations and lattice shells

### 1.1 Spherical codes and kissing configurations

Define `IsSphericalCode` and `IsKissingConfiguration` as in the Conventions. The passage
`x ↦ x/2` between them (Conventions) is used in Layer 3; it is a computation with
`norm_sub_sq_real` and is not stated separately.

**Checks.**
- The six points `2(cos(jπ/3), sin(jπ/3))`, `j = 0, …, 5`, form a kissing configuration in `ℝ²`:
  neighbours are at distance exactly `2`, the others at `2√3` and `4`. Halved, they form a
  spherical code with `s = 1/2` whose inner products are `1/2`, `−1/2` and `−1`.
- Distance at least `2`, not more than `2`: with the strict inequality the hexagon would not be a
  kissing configuration, nor would the configurations from `E₈` and the Leech lattice used in
  Layer 3, which have pairs of touching balls (inner product `1/2` after halving).
- The bound concerns distinct points only: asking `⟨x, x⟩ ≤ s` as well would exclude every
  nonempty code for `s < 1`.
- The standard basis vectors `e_1, …, e_n` form a spherical code with `s = 0`; together with
  `−e_1, …, −e_n` they form one with `s = 0` of `2n` points (inner products `0` and `−1`).

### 1.2 The minimal vectors of a lattice

Prove `exists_isSphericalCode_card_eq_kissingNumber`: if `L` is a positive definite integral
lattice on a rational vector space `V` with `dim_ℚ V = n`, there is a spherical code in `ℝⁿ` with
bound `1/2` and exactly `L.kissingNumber` points. (Proved here.)

The statement is for positive definite lattices: their minimal shell is finite, and Tau Ceti's
real model, which the route uses, is built for them.

Route. Let `m = L.minimum` and `S` the set of nonzero vectors of norm `m`; it is finite
(`IsPosDef.finite_vectorsOfNorm`) and `L.kissingNumber = |S|` (`kissingNumber_def`). If `S` is
empty take `C = ∅`. Otherwise `m > 0`, since a nonzero vector has positive norm. For distinct
`x, y ∈ S`, `x − y` is a nonzero lattice vector, so `m ≤ N(x − y) = 2m − 2B(x, y)`
(`IsPosSemidef.minimum_le_integralNorm`), that is `B(x, y) ≤ m/2`, where `N` and `B` are the norm
and the form of `L`. The real model space of `L` is a real inner product space of dimension
`finrank ℤ L = n` (`RealModelSpace.finrank_eq`, `finrank_carrier`) in which
`⟨ι x, ι y⟩ = B(x, y)` for the injective embedding `ι = L.realModelMap hL`
(`inner_realModelMap`, `realModelMap_injective`). Compose `ι` with the linear isometry
`(stdOrthonormalBasis ℝ _).repr` onto `EuclideanSpace ℝ (Fin (finrank ℝ _))`, reindexed to
`Fin n` (`LinearIsometryEquiv.piLpCongrLeft`), and with the scaling by `1/√m`. The image of `S`
consists of unit vectors with pairwise inner products at most `1/2`, and it has `|S|` points by
injectivity (`Finset.card_image_of_injective`).

**Checks.**
- The rank-one lattice with Gram matrix `[2]`: `m = 2`, `S = {±1}`, and the code is `{1, −1}` in
  `ℝ¹`, with inner product `−1 ≤ 1/2`; the kissing number is `2`.
- `ℤ²` (Gram matrix `I₂`): `m = 1`, `S = {±e_1, ±e_2}`, a code of `4` points with inner products
  `0` and `−1`. The hexagonal lattice `A₂` (Gram matrix `[[2, 1], [1, 2]]`): `m = 2`, six minimal
  vectors, and their images are congruent to the halved hexagon of 1.1.
- `E₈` in its standard coordinates (Tau Ceti's `typeE₈RootLattice` is an isometric copy in the
  basis of simple roots): the 240 roots `±e_i ± e_j` and `(±1/2, …, ±1/2)` with an even number of
  minus signs, divided by `√2`, have
  inner products `−1`, `−1/2`, `0`, `1/2` with counts `1`, `56`, `126`, `56` from each point
  (exact enumeration).
- Rank zero: `V = 0`, `n = 0`, `L.kissingNumber = 0`, and the empty code in `ℝ⁰` is the witness.

*Needs:* 1.1; Tau Ceti `IntegralLattice.IsPosDef.finite_vectorsOfNorm`,
`IntegralLattice.kissingNumber_def`, `IntegralLattice.IsPosDef.isPosSemidef`,
`IntegralLattice.IsPosSemidef.minimum_le_integralNorm`, `IntegralLattice.inner_realModelMap`,
`IntegralLattice.realModelMap_injective`, `IntegralLattice.RealModelSpace.finrank_eq`,
`IntegralLattice.finrank_carrier`; Mathlib `stdOrthonormalBasis`,
`LinearIsometryEquiv.piLpCongrLeft`, `Finset.card_image_of_injective`.

### Examples

The hexagon, the cross polytope, the minimal vectors of `ℤ²`, `A₂` and `E₈`.

### Dependencies

1.2 uses 1.1 and Tau Ceti's integral lattices and real model.

## Layer 2: the linear programming bound

### 2.1 The bound

Prove `IsSphericalCode.card_le_eval_one_div`: let `n ≥ 2`, `d ∈ ℕ`, real numbers `c_0, …, c_d`
with `c_k ≥ 0` for `k ≤ d` and `c_0 > 0`, and `h = ∑_{k ≤ d} c_k ω_{n,k}` with `h(t) ≤ 0` for
`t ∈ [−1, s]`. Then every spherical code `C` in `ℝⁿ` with bound `s` satisfies
`|C| ≤ h(1)/c_0` (Cohn, Lecture 4, Theorem 4.1 with its proof, p. 41; the positivity of the
zonal sums is Lemma 5.3 and Corollary 5.4, p. 44).

Route. *Positivity.* Fix `1 ≤ k` and write `ω = ω_{n,k}`, `D = dim H_k` (the harmonic
polynomials of degree `k`) and `σ` for `sphereMeasure n`. For a unit vector `y` the zonal
harmonic `Z_y = zonalHarmonic n k y` lies in `H_k` (`zonalHarmonic_mem_harmonicSubmodule`) and
takes the value `ω(⟨y, x⟩)` at unit `x` (`eval_zonalHarmonic`, `sphereEval_apply`). At `x = y`
this value is `ω(1) = 1` (`SpecialFunctionsHigherSpheres.zonalPolynomial_eval_one`), so
`Z_y ≠ 0` and `D > 0`. The reproducing property (`integral_sphereEval_mul_zonalPolynomial`)
applied to `p = Z_y` gives, for unit `x`,
`∫ ω(⟨y, z⟩) ω(⟨z, x⟩) dσ(z) = ω(⟨y, x⟩)/D`. Summing over `x, y ∈ C`
(`MeasureTheory.integral_finsetSum`; the integrands are continuous on the compact sphere, and `σ`
is finite because the total mass of `toSphere` is finite and nonzero for `n ≥ 1`,
`BoundedContinuousFunction.integrable`) and writing `F(z) = ∑_{y ∈ C} ω(⟨y, z⟩)`,
`M_k = ∑_{x, y ∈ C} ω(⟨x, y⟩) = D ∫ F² dσ ≥ 0` (`MeasureTheory.integral_nonneg`). For `k = 0`,
`M_0 = |C|²`.
*The bound.* For distinct `x, y ∈ C`, `−1 ≤ ⟨x, y⟩ ≤ s` (`abs_real_inner_le_norm` and the code
condition), so `h(⟨x, y⟩) ≤ 0`; with `h(⟨x, x⟩) = h(1)`,
`|C| h(1) ≥ ∑_{x, y ∈ C} h(⟨x, y⟩) = ∑_k c_k M_k ≥ c_0 |C|²`. If `C` is empty the claim is
`0 ≤ h(1)/c_0`, true since `h(1) = ∑ c_k ≥ c_0 > 0`; otherwise divide by `c_0 |C|`.

The positivity of the zonal sums is not stated separately: it is the route above, a consequence
of the reproducing property of SpecialFunctionsHigherSpheres 4.1.

**Checks.**
- The simplex bound: `h = ω_{n,1} − s ω_{n,0} = t − s` with `s < 0` has `c_0 = −s > 0`, `c_1 = 1`
  and `h ≤ 0` on `[−1, s]`, so `|C| ≤ 1 − 1/s` (Cohn, Lecture 2, Proposition 4.1, p. 25, by the
  same inequality `|∑ x|² ≥ 0`). For `n = 3`, `s = −1/3` it gives `4`, attained by the regular
  tetrahedron, whose inner products are all `−1/3`.
- `c_0 > 0` is needed: `h = ω_{n,1} = t` with `s = 0` has `c_0 = 0`, `c_1 = 1` and `h ≤ 0` on
  `[−1, 0]`, while the standard basis is a code with `s = 0` and `n` points; the quotient `h(1)/0`
  is `0` in Lean, and `n ≤ 0` is false.
- `s ≥ 1`: the hypothesis `h(1) ≤ 0` contradicts `h(1) = ∑ c_k ≥ c_0 > 0`, so the statement is
  vacuous there. `s < −1`: the interval is empty, codes have at most one point and
  `h(1)/c_0 ≥ 1`.
- `n = 2`, `s = 1/2`, `h = (t + 1)(t + 1/2)²(t − 1/2)`: the bound is `6` (3.1).

*Needs:* 1.1; SpecialFunctionsHigherSpheres 3.1 (`zonalPolynomial`, copied;
`SpecialFunctionsHigherSpheres.zonalPolynomial_eval_one`), 3.3 (`zonalHarmonic`,
`zonalHarmonic_mem_harmonicSubmodule`, `eval_zonalHarmonic`), 1.2 (`sphereMeasure`), 4.1
(`integral_sphereEval_mul_zonalPolynomial`);
Tau Ceti `MvPolynomial.sphereEval_apply`; Mathlib `abs_real_inner_le_norm`,
`MeasureTheory.integral_finsetSum`, `MeasureTheory.integral_nonneg`,
`BoundedContinuousFunction.integrable`, `MeasureTheory.Measure.toSphere` (a finite measure) and
`MeasureTheory.Measure.toSphere_ne_zero` (so that `sphereMeasure n` is finite for `n ≥ 1`).

### 2.2 Equality

Prove `IsSphericalCode.eval_eq_zero_of_card_eq`: under the hypotheses of 2.1, if
`|C| = h(1)/c_0`, then `h(⟨x, y⟩) = 0` for all distinct `x, y ∈ C`, and
`∑_{y ∈ C} ω_{n,k}(⟨z, y⟩) = 0` for every unit vector `z` and every `1 ≤ k ≤ d` with `c_k > 0`.
(Proved here.)

Route. The statement of 2.1 is not enough here, so the route repeats its argument. With the
notation of the route of 2.1, the reproducing property applied to `Z_y` gives, for each
`1 ≤ k ≤ d`, `M_k = ∑_{x, y ∈ C} ω(⟨x, y⟩) = D ∫ F² dσ ≥ 0`, and `M_0 = |C|²`; hence
`|C| h(1) ≥ ∑_{x, y ∈ C} h(⟨x, y⟩) = ∑_k c_k M_k ≥ c_0 |C|²`. Now `|C| = h(1)/c_0 > 0`, so `C`
is nonempty and this chain is a chain of equalities.
Hence `∑_{x ≠ y} h(⟨x, y⟩) = 0` with every term `≤ 0`, so every term vanishes; and
`∑_{k ≥ 1} c_k M_k = 0` with every term `≥ 0`, so `M_k = 0` when `c_k > 0`. Then `∫ F² dσ = 0`,
since `D > 0`. Let `P = ∑_{y ∈ C} Z_y ∈ H_k`, so that `F(z) = P(z)` on the sphere. The
reproducing property gives `F(z)/D = ∫ F(x) ω(⟨x, z⟩) dσ(x)`, and by the Cauchy–Schwarz
inequality for integrals (`MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` with `p = q = 2`,
applied to `|F|` and `|ω(⟨·, z⟩)|`, after `MeasureTheory.norm_integral_le_integral_norm`) the
right side is at most `(∫ F²)^{1/2} (∫ ω(⟨x, z⟩)²)^{1/2}`
in absolute value, which is `0`. So `F(z) = 0`.

**Checks.**
- The halved hexagon with the planar `h` of 3.1: its inner products `−1`, `−1/2`, `1/2` are zeros
  of `h`, and `∑_j T_k(cos(φ + jπ/3)) = ∑_j cos(kφ + jkπ/3) = 0` for every `φ` and
  `k = 1, 2, 3, 4`, since `6` does not divide `k`.
- The `240` roots of `E₈`, normalised, with the `h` of 3.2: inner products `−1`, `−1/2`, `0`,
  `1/2` are the zeros of `h`, and at `z` a root the sums `∑_y ω_{8,k}(⟨z, y⟩)` vanish for
  `k = 1, …, 7` (exact computation); for `k = 8` the sum is `720/143`, so the vanishing does not
  extend to every degree.
- The conclusion concerns `k ≤ d` with `c_k > 0` only: for the simplex bound of 2.1 with
  `n = 3`, `s = −1/3`, `d = 1`, the tetrahedron attains `4` and `∑_y ⟨z, y⟩ = 0` (`k = 1`),
  while the degree-3 sum `∑_y ω_{3,3}(⟨z, y⟩)` at a vertex `z` is `1 + 3·(11/27) = 20/9`
  (`ω_{3,3}(t) = (5t³ − 3t)/2`, `ω_{3,3}(−1/3) = 11/27`).

*Needs:* 1.1; SpecialFunctionsHigherSpheres 3.1 (`zonalPolynomial`, copied;
`SpecialFunctionsHigherSpheres.zonalPolynomial_eval_one`), 3.3 (`zonalHarmonic`,
`zonalHarmonic_mem_harmonicSubmodule`, `eval_zonalHarmonic`), 1.2 (`sphereMeasure`), 4.1
(`integral_sphereEval_mul_zonalPolynomial`); Tau Ceti `MvPolynomial.sphereEval_apply`; Mathlib
`abs_real_inner_le_norm`, `MeasureTheory.integral_finsetSum`, `MeasureTheory.integral_nonneg`,
`BoundedContinuousFunction.integrable`, `MeasureTheory.Measure.toSphere_ne_zero`,
`MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg`, `MeasureTheory.norm_integral_le_integral_norm`.

### Examples

The simplex bound, the hexagon, the `E₈` roots.

### Dependencies

2.1 uses 1.1 and SpecialFunctionsHigherSpheres; 2.2 uses the same inputs and repeats the
argument of 2.1.

## Layer 3: the kissing numbers of `ℝ²`, `ℝ⁸` and `ℝ²⁴`

Each upper bound applies 2.1 with `s = 1/2` to the halved configuration (Conventions) and a
polynomial whose zeros are the inner products of an optimal configuration (Cohn, Lecture 4, §4,
p. 41, prints the polynomials for `ℝ⁸` and `ℝ²⁴`). Each such `h` is `≤ 0` on `[−1, 1/2]` by its
signs: the factor `t + 1` is `≥ 0`, the squared factors are `≥ 0`, and `t − 1/2 ≤ 0`. The zonal
coefficients below were computed in exact rational arithmetic from the definition of `ω_{n,k}`,
and the Gegenbauer coefficients by dividing by `C_k^{(λ)}(1) = (n − 2)_k / k!`. Cohn calls the
verification a finite calculation; it is printed here in full.

### 3.1 The plane

Prove `isGreatest_card_kissingConfiguration_two`: some kissing configuration in `ℝ²` has `6`
points and none has more (Cohn, Lecture 1, §4, p. 12, states the value; the linear programming
proof below is worked out here).

Route. The hexagon of 1.1 gives `6`. For the bound take `n = 2`, where `ω_{2,k} = T_k`
(`SpecialFunctionsHigherSpheres.zonalPolynomial_two`), and

    h(t) = (t + 1)(t + 1/2)²(t − 1/2) = t⁴ + (3/2) t³ + (1/4) t² − (3/8) t − 1/8
         = 3/8 T_0 + 3/4 T_1 + 5/8 T_2 + 3/8 T_3 + 1/8 T_4,

so `h(1) = 9/4`, `c_0 = 3/8` and `h(1)/c_0 = 6`.

**Checks.**
- With `T_2 = 2t² − 1`, `T_3 = 4t³ − 3t`, `T_4 = 8t⁴ − 8t² + 1`, the Chebyshev sum expands to the
  monomial form: `t⁴` from `T_4/8`; `(3/2) t³` from `3T_3/8`; `−1 + 5/4 = 1/4` for `t²`;
  `−9/8 + 3/4 = −3/8` for `t`; `1/8 − 5/8 + 3/8 = −1/8` for the constant.
- The cubic `(t + 1)(t + 1/2)(t − 1/2)` has the positive coefficients `1/4, 1/2, 1/2, 1/4` and
  quotient `6`, but it is positive on `(−1, −1/2)`, so it does not satisfy the hypothesis of 2.1.

*Needs:* 1.1, 2.1; SpecialFunctionsHigherSpheres 3.1
(`SpecialFunctionsHigherSpheres.zonalPolynomial_two`).

### 3.2 Dimension eight

Prove `isGreatest_card_kissingConfiguration_eight`: some kissing configuration in `ℝ⁸` has `240`
points and none has more (Cohn, Lecture 4, §4, p. 41, after Levenshtein and Odlyzko–Sloane).

Route. The lower bound is 1.2 for Tau Ceti's `E₈` root lattice (`isPosDef_typeE₈RootLattice`,
`kissingNumber_typeE₈RootLattice`, rank `8`), doubled. For the upper bound take `n = 8` and

    h(t) = (t + 1)(t + 1/2)² t² (t − 1/2) = t⁶ + (3/2) t⁵ + (1/4) t⁴ − (3/8) t³ − (1/8) t²,

with `h(1) = 9/4` and

    zonal coefficients c_0, …, c_6:
      3/320, 3/40, 15/64, 39/80, 399/640, 9/16, 33/128
    Gegenbauer coefficients (λ = 3):
      3/320, 1/80, 5/448, 39/4480, 19/3840, 1/448, 1/1792

all positive, so `h(1)/c_0 = (9/4)/(3/320) = 240`.

**Checks.**
- The zonal polynomials used, in monomials: `ω_{8,1} = t`, `ω_{8,2} = (8t² − 1)/7`,
  `ω_{8,3} = (10t³ − 3t)/7`, `ω_{8,4} = (40t⁴ − 20t² + 1)/21`,
  `ω_{8,5} = (56t⁵ − 40t³ + 5t)/21`, `ω_{8,6} = (896t⁶ − 840t⁴ + 180t² − 5)/231`.
- Leading coefficients: `c_6 ω_{8,6}` has leading coefficient `(33/128)(896/231) = 1`, as `h`
  does; at `t = 1` the zonal coefficients sum to `9/4 = h(1)`.
- Gegenbauer normalisation: `C_1^{(3)}(1) = 6` and `(3/40)/6 = 1/80`; `C_6^{(3)}(1) = 462` and
  `(33/128)/462 = 1/1792`.

*Needs:* 1.1, 1.2, 2.1; Tau Ceti `IntegralLattice.typeE₈RootLattice`,
`IntegralLattice.isPosDef_typeE₈RootLattice`, `IntegralLattice.kissingNumber_typeE₈RootLattice`.

### 3.3 Dimension twenty-four

Prove `isGreatest_card_kissingConfiguration_twentyFour`: some kissing configuration in `ℝ²⁴` has
`196560` points and none has more (Cohn, Lecture 4, §4, p. 41, after Levenshtein and
Odlyzko–Sloane).

Route. The lower bound is 1.2 for Tau Ceti's Leech lattice (`isPosDef_leechLattice`,
`kissingNumber_leechLattice`, rank `24`), doubled. For the upper bound take `n = 24` and the
polynomial of degree `10`

    h(t) = (t + 1)(t + 1/2)² (t + 1/4)² t² (t − 1/4)² (t − 1/2)
         = t¹⁰ + (3/2) t⁹ + (1/8) t⁸ − (9/16) t⁷ − (39/256) t⁶ + (27/512) t⁵
           + (17/1024) t⁴ − (3/2048) t³ − (1/2048) t²,

with `h(1) = 2025/1024` and

    zonal coefficients c_0, …, c_10:
      15/1490944, 45/186368, 3795/1949696, 10005/905216, 3983025/101384192,
      56235/487424, 2040905/8716288, 270135/661504, 16675/34816, 150075/330752,
      310155/1323008
    Gegenbauer coefficients (λ = 11):
      15/1490944, 45/4100096, 15/1949696, 435/79659008, 6927/2230452224,
      489/278806528, 17747/22435725312, 261/756760576, 5/44808192, 3/94595072,
      1/189190144

all positive, so `h(1)/c_0 = (2025/1024)(1490944/15) = 196560`.

**Checks.**
- `ω_{24,2} = (24t² − 1)/23`, `ω_{24,3} = (26t³ − 3t)/23`, `ω_{24,4} = (728t⁴ − 156t² + 3)/575`;
  the leading coefficient of `ω_{24,10}` is `1323008/310155`, and `c_10` times it is `1`.
- Gegenbauer normalisation: `C_1^{(11)}(1) = 22` and `(45/186368)/22 = 45/4100096`.
- At `t = 1` the zonal coefficients sum to `2025/1024 = h(1)`.

*Needs:* 1.1, 1.2, 2.1; Tau Ceti `leechLattice`, `isPosDef_leechLattice`,
`kissingNumber_leechLattice`.

### Examples

The hexagon, the `E₈` roots and the minimal vectors of the Leech lattice as optimal
configurations.

### Dependencies

3.1 uses 1.1 and 2.1; 3.2 and 3.3 use 1.1, 1.2 and 2.1.

## Layer 4: the inner products of the optimal codes

### 4.1 Codes of 240 points in `ℝ⁸`

Prove `IsSphericalCode.inner_of_card_eq_240`: if `C` is a spherical code in `ℝ⁸` with bound
`1/2` and `240` points, every inner product of two distinct points of `C` is `−1`, `−1/2`, `0`
or `1/2`, and for every `x ∈ C` exactly `1`, `56`, `126` and `56` points `y ∈ C` have
`⟨x, y⟩ = −1`, `−1/2`, `0` and `1/2`. In particular `−x ∈ C` for every `x ∈ C`. (Proved here.)

Route. With the `h` of 3.2, `|C| = 240 = h(1)/c_0`, so 2.2 applies. Its first clause puts every
`⟨x, y⟩`, `x ≠ y`, among the zeros `−1, −1/2, 0, 1/2` of `h`. Fix `x ∈ C` and let `a_t` count the
`y ≠ x` with `⟨x, y⟩ = t`. The second clause at `z = x` for `k = 1, 2, 3` (`c_k > 0`), after
removing the term `y = x`, which is `ω_{8,k}(1) = 1`, gives with `∑_t a_t = 239`:

    rows k = 0, 1, 2, 3; columns t = −1, −1/2, 0, 1/2:
      ω_{8,0}(t):   1     1     1     1        sum a_t ω = 239
      ω_{8,1}(t):  −1   −1/2    0    1/2       sum a_t ω = −1
      ω_{8,2}(t):   1    1/7  −1/7   1/7       sum a_t ω = −1
      ω_{8,3}(t):  −1   1/28    0  −1/28       sum a_t ω = −1

The determinant is `15/49 ≠ 0`, and the unique solution is
`(a_{−1}, a_{−1/2}, a_0, a_{1/2}) = (1, 56, 126, 56)`. A unit `y` with `⟨x, y⟩ = −1` is `−x`.

**Checks.**
- The normalised `E₈` roots give `(1, 56, 126, 56)` from every point (Check of 1.2), and the
  solution also satisfies the equations for `k = 4, 5, 6`.
- `1 + 56 + 126 + 56 = 239`.

*Needs:* 2.2; the polynomial of 3.2 with its zonal expansion, a finite computation printed there
and repeated here (the statement of 3.2 does not contain it).

### 4.2 Codes of 196560 points in `ℝ²⁴`

Prove `IsSphericalCode.inner_of_card_eq_196560`: if `C` is a spherical code in `ℝ²⁴` with bound
`1/2` and `196560` points, every inner product of two distinct points is `−1`, `−1/2`, `−1/4`,
`0`, `1/4` or `1/2`, and every `x ∈ C` has exactly `1`, `4600`, `47104`, `93150`, `47104` and
`4600` points of `C` at these inner products, in this order. (Proved here.)

Route. As in 4.1 with the `h` of 3.3, its zeros `−1, ±1/2, ±1/4, 0`, and `k = 1, …, 5`:

    columns t = −1, −1/2, −1/4, 0, 1/4, 1/2:
      ω_{24,0}:   1      1        1       1       1        1      (sum 196559)
      ω_{24,1}:  −1    −1/2     −1/4      0      1/4      1/2     (sum −1)
      ω_{24,2}:   1    5/23     1/46    −1/23    1/46     5/23    (sum −1)
      ω_{24,3}:  −1   −7/92    11/736     0    −11/736    7/92    (sum −1)
      ω_{24,4}:   1   19/1150  −5/736   3/575  −5/736   19/1150   (sum −1)
      ω_{24,5}:  −1   1/460   −1/2944     0     1/2944   −1/460   (sum −1)

The determinant is `6036849/14327859200 ≠ 0` and the unique solution is
`(1, 4600, 47104, 93150, 47104, 4600)`.

**Checks.**
- `1 + 2·4600 + 2·47104 + 93150 = 196559`.
- The solution satisfies the equations for `k = 6, …, 11` as well, and fails the one for
  `k = 12` (the sum is `14359/3596`, not `−1`).
- The `196560` minimal vectors of the Leech lattice in the standard coordinates scaled by `√8`
  (from the extended Golay code: `±2` on an octad with an even number of minus signs; `−3` in one
  coordinate and `1` in the others, with the signs changed on a codeword; `±4` in two
  coordinates), divided by `√32`, have these counts from every point and no other inner products:
  an exact integer computation from one point of each of the `1059` orbits of the sign changes
  along codewords, which preserve the set.

*Needs:* 2.2; the polynomial of 3.3 with its zonal expansion, a finite computation printed there
and repeated here (the statement of 3.3 does not contain it).

### Examples

The `E₈` roots; the minimal vectors of the Leech lattice, normalised.

### Dependencies

4.1 uses 2.2 and 3.2; 4.2 uses 2.2 and 3.3.

## Scope and ownership

This roadmap owns spherical codes and kissing configurations in `ℝⁿ`, the passage from the
minimal vectors of a positive definite integral lattice to a spherical code, the
Delsarte–Goethals–Seidel linear programming bound for spherical codes with its equality case, the
kissing numbers of `ℝ²`, `ℝ⁸` and `ℝ²⁴`, and the inner-product counts of the codes of `240` and
`196560` points with bound `1/2`.

Already in the libraries and therefore not targets: the lattice kissing numbers
`kissingNumber_typeE₈RootLattice` (`240`) and `kissingNumber_leechLattice` (`196560`), the
positive definiteness of both lattices, and the real model of a positive definite lattice, all in
Tau Ceti. Neither Mathlib nor Tau Ceti has spherical codes, kissing configurations or Gegenbauer
polynomials at the pins.

Left to other roadmaps:

- SpecialFunctionsHigherSpheres owns the zonal polynomials (3.1, copied verbatim into
  `Suggested.lean`), the zonal harmonics (3.3), the addition theorem and the reproducing property
  (4.1). Its 4.4 states in prose that the zonal spherical function is positive definite on
  `SO(n)`; the point-set inequality `∑_{x, y ∈ C} ω_{n,k}(⟨x, y⟩) ≥ 0` used in 2.1 is the same fact
  read on the sphere, and its short proof from the declared reproducing property is kept inside
  the route of 2.1 rather than stated.
- LaguerreJacobi 6.2 owns the Gegenbauer polynomials `C_k^{(λ)}`; they enter only through the
  conversion of coefficients in the Conventions and in Layer 3.
- LatticePackingsAndPerfectForms owns the lattice invariants (minimum, minimal vectors, kissing
  number of forms, the Hermite constants), spherical designs formed by lattice shells and Venkov's
  theorem (its Layer 5), including that the `E₈` roots form a 7-design. It lists the kissing
  problem for non-lattice arrangements and the Delsarte–Goethals–Seidel bounds among its explicit
  scope exclusions. The vanishing zonal sums of 2.2 concern arbitrary codes attaining the bound,
  and no statement of that roadmap is restated.

Neighbouring subjects, not treated here, and roadmaps this one does not depend on:

- BoundsOnCodes 5.1–5.2 states Delsarte's inequalities and the linear programming bound for codes
  in Hamming space, through Krawtchouk polynomials, and AssociationSchemes 4.1 the inequalities for
  an arbitrary association scheme. 2.1 is the analogue on the sphere; neither is used here.
- EquiangularLinesAndTwoGraphs states the absolute and relative bounds for equiangular lines (its
  Layer 4), and LinearAlgebraMethodInCombinatorics 3.1 Blokhuis's bound for two-distance sets;
  neither is restated or used.

Outside the scope: the kissing numbers of `ℝ³` and `ℝ⁴` (the linear programming bound is not
sharp there), the uniqueness of the optimal configurations in dimensions `8` and `24`,
semidefinite programming bounds, Levenshtein's general bounds and the Kabatiansky–Levenshtein
asymptotics, energy minimisation and universal optimality, spherical designs as a subject, and
sphere packings in `ℝⁿ`.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`, `stdOrthonormalBasis` (an
  orthonormal basis indexed by `Fin (finrank 𝕜 E)` of a finite-dimensional inner product space),
  `OrthonormalBasis.repr` (the linear isometry onto `EuclideanSpace 𝕜 ι`).
- `Mathlib/Analysis/Normed/Lp/PiLp.lean`: `LinearIsometryEquiv.piLpCongrLeft` (reindexing along
  `ι ≃ ι'`).
- `Mathlib/Analysis/InnerProductSpace/Basic.lean`: `abs_real_inner_le_norm`
  (`|⟨x, y⟩| ≤ ‖x‖ ‖y‖`), `norm_sub_sq_real` (`‖x − y‖² = ‖x‖² − 2⟨x, y⟩ + ‖y‖²`).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_nonneg`
  (`0 ≤ f → 0 ≤ ∫ f`), `MeasureTheory.integral_finsetSum` (for integrable summands),
  `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (Hölder's inequality for nonnegative
  functions in `L^p`, `L^q` with conjugate exponents),
  `MeasureTheory.norm_integral_le_integral_norm` (`‖∫ f‖ ≤ ∫ ‖f‖`).
- `Mathlib/MeasureTheory/Integral/BoundedContinuousFunction.lean`:
  `BoundedContinuousFunction.integrable` (for a finite measure).
- `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`: `MeasureTheory.Measure.toSphere`, a
  finite measure on the unit sphere.
- `Mathlib/Data/Finset/Card.lean`: `Finset.card_image_of_injective`.
- `Mathlib/Order/Bounds/Defs.lean`: `IsGreatest`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`: `TauCeti.IntegralLattice` (a full lattice
  in a rational vector space with an integral symmetric form), `IntegralLattice.finrank_carrier`
  (`finrank ℤ L = finrank ℚ V`).
- `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean`: `IntegralLattice.IsPosDef`.
- `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean`: `IntegralLattice.minimum`,
  `IntegralLattice.kissingNumber` with `kissingNumber_def` (the number of nonzero vectors of norm
  `L.minimum`, `0` on an infinite shell), `IsPosSemidef.minimum_le_integralNorm` (the minimum is at
  most the norm of every nonzero vector of a positive semidefinite lattice).
- `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean`: `IntegralLattice.IsPosDef.isPosSemidef`.
  `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean`:
  `IntegralLattice.IsPosDef.finite_vectorsOfNorm` (shells of a positive definite lattice are
  finite).
- `TauCeti/Algebra/Module/ZLattice/RealModel.lean`: `IntegralLattice.RealModelSpace` (the real
  inner product space `ℝ ⊗[ℚ] V` of a positive definite lattice), `IntegralLattice.realModelMap`,
  `IntegralLattice.inner_realModelMap` (`⟨ι x, ι y⟩ = B(x, y)`),
  `IntegralLattice.realModelMap_injective`, `IntegralLattice.RealModelSpace.finrank_eq`
  (dimension `finrank ℤ L`).
- `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/Basic.lean` and `…/TypeE/Roots.lean`:
  `IntegralLattice.typeE₈RootLattice` on `Fin 8 → ℚ`, `isPosDef_typeE₈RootLattice`,
  `kissingNumber_typeE₈RootLattice` (`= 240`).
- `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean` and
  `…/Leech/MinimalVectors.lean`: `TauCeti.leechLattice` on `Fin 24 → ℚ`,
  `isPosDef_leechLattice`, `kissingNumber_leechLattice` (`= 196560`).
- `TauCeti/Analysis/MvPolynomial/Sphere.lean`: `MvPolynomial.sphereEval` and `sphereEval_apply`
  (restriction of a polynomial to the unit sphere is evaluation at the point).
- `TauCeti/RingTheory/MvPolynomial/Harmonic.lean`: `MvPolynomial.harmonicSubmodule` (`H_k`).

### From TauCetiRoadmap.SpecialFunctionsHigherSpheres

- 3.1: the definition `zonalPolynomial n l`, copied verbatim;
  `SpecialFunctionsHigherSpheres.zonalPolynomial_eval_one` (`ω_{n,l}(1) = 1`, every `n`);
  `SpecialFunctionsHigherSpheres.zonalPolynomial_two` (`ω_{2,l} = T_l`).
- 1.2: `Sphere n` and `sphereMeasure n`, the normalised surface measure on the unit sphere of
  `ℝⁿ`.
- 3.3: `zonalHarmonic n l η`; `zonalHarmonic_mem_harmonicSubmodule` (for `n ≥ 2` and unit `η`, it
  lies in `H_l`); `eval_zonalHarmonic` (for `n ≥ 2` and unit `x`, its value at `x` is
  `ω_{n,l}(⟨η, x⟩)`).
- 4.1: `integral_sphereEval_mul_zonalPolynomial` (the reproducing property: for `n ≥ 2`,
  `p ∈ H_l` and `y` on the sphere, `∫ p(x) ω_{n,l}(⟨x, y⟩) dσ(x) = p(y) / dim H_l`).

## References

- Henry Cohn, *Packing, coding, and ground states*, lecture notes (PCMI 2014),
  arXiv:1603.05202 (version 1, read on arXiv). Lecture 1, §4, p. 12 (the known kissing numbers;
  `E₈` gives an optimal configuration); Lecture 2, Proposition 4.1 with its proof, p. 25 (the
  simplex bound); Lecture 4, §4, Theorem 4.1 with its proof and the two polynomials for `ℝ⁸` and
  `ℝ²⁴`, p. 41; Lecture 4, §5, the normalisation of the ultraspherical polynomials, p. 42, and
  Lemma 5.3 and Corollary 5.4 with their proofs, p. 44.
- P. Delsarte, J.-M. Goethals and J. J. Seidel, *Spherical codes and designs*, Geometriae
  Dedicata 6 (1977), 363–388 (the linear programming bound; attributed in prose).
- A. M. Odlyzko and N. J. A. Sloane, *New bounds on the number of unit spheres that can touch a
  unit sphere in n dimensions*, Journal of Combinatorial Theory, Series A 26 (1979), 210–214, and
  V. I. Levenshtein, *On bounds for packings in n-dimensional Euclidean space*, Soviet
  Mathematics Doklady 20 (1979), 417–421 (bibliographic data as Cohn gives them), independently:
  the kissing numbers `240` and `196560` (both attributed in prose, without locators, following
  Cohn, Lecture 4, §4).

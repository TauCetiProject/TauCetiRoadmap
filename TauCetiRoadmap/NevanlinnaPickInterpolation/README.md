# Roadmap: Nevanlinna–Pick interpolation

**Summary.** A Schur function is a holomorphic function on the open unit disc whose values have
modulus at most one. Which finite amounts of data can such a function carry? This roadmap answers
the question for prescribed values at finitely many points and for a prescribed beginning of the
Taylor series at the origin, and it develops the tool both answers rest on, the Schur algorithm.
Every statement concerns functions on the open disc and is an equality or inequality on it.

The Schur algorithm peels off one number at a time. If `f(0) = γ` with `|γ| < 1`, then
`f(z) = (γ + z f₁(z)) / (1 + conj(γ) z f₁(z))` for a second Schur function `f₁`, and repeating the
step produces the Schur parameters `γ₀, γ₁, …` of `f`, each of modulus at most one. The headline
theorems are these.

- *Schur's theorem.* Two Schur functions with the same Schur parameters are equal. Every sequence
  of points of the open disc is the sequence of Schur parameters of some Schur function, and so is
  every finite sequence whose last term has modulus one and whose other terms lie in the open disc.
  A Schur function is a finite Blaschke product with `n` zeros, counted with multiplicity, exactly
  when its parameter `γₙ` is the first of modulus one.
- *Pick's theorem.* Given points `z₁, …, zₙ` of the open disc and complex numbers `w₁, …, wₙ`,
  some Schur function takes the value `wᵢ` at `zᵢ` for every `i` if and only if the Pick matrix
  `((1 − wᵢ conj(wⱼ)) / (1 − zᵢ conj(zⱼ)))` is positive semidefinite. When the points are distinct,
  the interpolating function is unique exactly when this matrix is singular, and it is then a
  finite Blaschke product whose number of zeros is the rank of the matrix.
- *The Carathéodory–Fejér problem in Schur's form.* Some Schur function has Taylor series beginning
  `c₀ + c₁z + … + cₙzⁿ` if and only if the lower triangular Toeplitz matrix of `c₀, …, cₙ` has
  operator norm at most one, with the same description of the singular case.
- *Pick kernels.* A function on the disc is a Schur function if and only if all its Pick matrices,
  at every finite family of points, are positive semidefinite; holomorphy is not assumed.

The roadmap builds on Mathlib's Schwarz lemma, maximum modulus principle, Taylor series and
positive semidefinite matrices, and on Tau Ceti's disc automorphisms and Montel theorem. The
contraction form of the Schwarz–Pick lemma, recorded by the completed ConformalMapping roadmap, is
the necessary half of the two-point case of Pick's theorem. Finite Blaschke products are those of
ConformalMappingPartII.

Layer 1 below defines Schur functions and the Schur step. Layer 2 defines the Schur parameters and
proves Schur's theorem. Layer 3 proves Pick's theorem and its uniqueness statement and uses
Layers 1 and 2. Layer 4 solves the coefficient problem and uses Layers 1 and 2.

## Conventions

- **The disc.** `𝔻` is Mathlib's `ball 0 1` in `ℂ` and the closed disc is `closedBall 0 1`.
- **Schur functions.** A Schur function is a function `f : ℂ → ℂ` with `IsSchurFunction f`: `f` is
  holomorphic on `𝔻` (`DifferentiableOn ℂ f (ball 0 1)`) and maps `𝔻` into the closed disc. Its
  values off `𝔻` play no role, and every conclusion about such functions is an equality on `𝔻`
  (`Set.EqOn … (ball 0 1)`). These are the Schur functions of complex analysis, not the symmetric
  functions of the same name in RepresentationTheory/SchurWeyl.
- **Disc automorphisms.** For `|a| < 1`, `φₐ(w) = (w − a) / (1 − conj(a) w)` is Tau Ceti's Möbius
  factor (`TauCeti.unitDiscMoebius` on the bundled disc); it sends `a` to `0`, maps the open and the
  closed disc onto themselves, and `φ₋ₐ` is its inverse. The identity
  `|1 − conj(a) w|² − |w − a|² = (1 − |a|²)(1 − |w|²)` is used throughout.
- **Division by zero.** Lean's `x / 0 = 0` is used in two places, both stated where they occur: the
  Schur step of a function with `|f(0)| = 1` (1.2), and the Schur parameters after the first one of
  modulus one (2.1).
- **Taylor coefficients.** The coefficient of order `k` of `f` at `0` is
  `iteratedDeriv k f 0 / k!`. For a Schur function the Taylor series at `0` converges to `f` on `𝔻`
  (`Complex.taylorSeries_eq_on_ball'`).
- **Matrices.** Matrices are positive definite or semidefinite in Mathlib's sense
  (`Matrix.PosDef`, `Matrix.PosSemidef`), which includes being Hermitian; complex numbers carry the
  order of the `ComplexOrder` scope, in which `0 ≤ z` means that `z` is real and nonnegative. The
  empty matrix is positive definite. The rank is Mathlib's `Matrix.rank`.
- **Finite Blaschke products.** `IsFiniteBlaschkeProduct f n` says that on `𝔻`,
  `f(z) = c ∏_{i<n} (z − aᵢ) / (1 − conj(aᵢ) z)` with `|c| = 1` and all `|aᵢ| < 1`; `n` is its
  degree, and degree `0` means a constant of modulus one. These are the finite Blaschke products of
  ConformalMappingPartII 3.2 restricted to the disc: there a factor with a parameter on the circle
  is a constant of modulus one, so its products are exactly the functions above, and `n` is the
  number of interior zeros counted with multiplicity.

## Layer 1: Schur functions and the Schur step

### 1.1 Schur functions

Define `IsSchurFunction` as in the Conventions. (The definition is standard; Simon, (2.5), p. 3.)

- If `|f(0)| = 1` for a Schur function `f`, then `f` is constant on `𝔻`, by the maximum modulus
  principle (`Complex.eqOn_of_isPreconnected_of_isMaxOn_norm`).
- The Taylor coefficients of a Schur function have modulus at most `1`, by the Cauchy estimates on
  the circles of radius `r < 1` (`Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`).

**Checks.**
- `z ↦ z`, constants of modulus at most `1`, `z ↦ (1 + z)/2` and `z ↦ (z + 3/5)/(1 + 3z/5)` are
  Schur functions; `z ↦ 2z` is not, since its value at `3/4` is `3/2`.
- `z ↦ conj(z)` maps `𝔻` into itself and is not a Schur function: it is not holomorphic.

*Needs:* Mathlib `DifferentiableOn`, `Metric.ball`, `Metric.closedBall`,
`Complex.eqOn_of_isPreconnected_of_isMaxOn_norm`,
`Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

### 1.2 The Schur step

Define `schurStep f` as the function equal to `(f(z) − f(0)) / (z (1 − conj(f(0)) f(z)))` at
`z ≠ 0` and to `f′(0) / (1 − |f(0)|²)` at `0`. Prove `isSchurFunction_schurStep`: the Schur step
of a Schur function is a Schur function (Simon, (3.1), p. 7, for `|f(0)| < 1`; the route is the
one indicated there).

Route: let `γ = f(0)`. If `|γ| = 1`, `f` is the constant `γ` on `𝔻` (1.1); then the numerator
vanishes at every `z ≠ 0` of `𝔻`, `f′(0) = 0`, and the Schur step is `0` on `𝔻`, by the division
convention. If `|γ| < 1`, the function `h = φ_γ ∘ f` is holomorphic on `𝔻`, maps it into the closed
disc and vanishes at `0`, so `|h(z)| ≤ |z|` by Schwarz's lemma
(`Complex.norm_le_norm_of_mapsTo_ball`).
On `𝔻` the Schur step equals `dslope h 0`: at `z ≠ 0` it is `h(z)/z`, and at `0` it is
`h′(0) = f′(0) / (1 − |γ|²)` by the chain rule. This slope is holomorphic on `𝔻`
(`Complex.differentiableOn_dslope`) and bounded by `1` at every `z ≠ 0`, hence at `0` by continuity.

**Checks.**
- `f(z) = z` has Schur step `1`; a constant `c` with `|c| < 1` has Schur step `0`.
- For `a = i/2`, `f(z) = (z + a)/(1 + conj(a) z)` has Schur step `1`. The variant without the
  conjugate, `(f(z) − f(0)) / (z (1 − f(0) f(z)))`, gives `3/5 + (12i/25) z − (48/125) z² + …`,
  not a constant.
- `f(z) = (1 + z)/2` has Schur step `2/(3 − z)`.
- The value at `0` is `f′(0)/(1 − |f(0)|²)`, so the bound `|f′(0)| ≤ 1 − |f(0)|²` is the case
  `z = 0` of the statement: the derivative form of the Schwarz–Pick lemma at the origin.

*Needs:* 1.1; Mathlib `Complex.norm_le_norm_of_mapsTo_ball`, `Complex.differentiableOn_dslope`,
`dslope`; Tau Ceti `TauCeti.norm_sq_one_sub_conj_mul_sub_norm_sq_sub`,
`TauCeti.differentiableOn_unitDiscMoebiusFormula_of_norm_lt_one`.

### 1.3 The inverse step

Define `schurUnstep γ g` as `z ↦ (γ + z g(z)) / (1 + conj(γ) z g(z))`. Prove
`isSchurFunction_schurUnstep`: if `|γ| < 1` and `g` is a Schur function, then `schurUnstep γ g`
is a Schur function with value `γ` at `0`, and its Schur step equals `g` on `𝔻` (Simon, (3.1),
p. 7).

Route: `schurUnstep γ g = φ₋γ ∘ (z ↦ z g(z))`; the inner map sends `𝔻` into `𝔻` since
`|z g(z)| ≤ |z|`, and `φ₋γ` maps `𝔻` holomorphically into itself
(`TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.differentiableOn_unitDiscMoebiusFormula_of_norm_lt_one`). Since `φ_γ ∘ φ₋γ` is the identity
on `𝔻` (`TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one`), the Schur step is
`z g(z) / z = g(z)` at `z ≠ 0`, and at `0` it is `(1 − |γ|²) g(0) / (1 − |γ|²) = g(0)`.

- Conversely, for a Schur function `f` with `|f(0)| < 1`, `schurUnstep (f 0) (schurStep f)` equals
  `f` on `𝔻`: solve `w = φ_γ(f(z)) = z f₁(z)` for `f(z)`. So the Schur step and the inverse step
  are inverse bijections between Schur functions with `|f(0)| < 1` and pairs of a point `γ` of `𝔻`
  and a Schur function, functions being identified when they agree on `𝔻`.

**Checks.**
- `schurUnstep a 1` is `(z + a)/(1 + conj(a) z)` for `|a| < 1`, and `schurUnstep 0 g` is `z g(z)`.
- The hypothesis `|γ| < 1` is needed: `schurUnstep 2 0` is the constant `2`, not a Schur
  function; `schurUnstep 1 1` equals `1` on `𝔻`, whose Schur step is `0`, not `1`.

*Needs:* 1.2; Tau Ceti `TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.differentiableOn_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one`.

### Examples

`z`, `z/2`, constants, `(1 + z)/2`, the disc automorphism `(z + i/2)/(1 − (i/2) z)` and its Schur
step.

### Dependencies

Mathlib `Complex.eqOn_of_isPreconnected_of_isMaxOn_norm`,
`Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`, `Complex.norm_le_norm_of_mapsTo_ball`,
`Complex.differentiableOn_dslope`; Tau Ceti `TauCeti.norm_sq_one_sub_conj_mul_sub_norm_sq_sub`,
`TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.differentiableOn_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one`. No other layer.

## Layer 2: Schur parameters and Schur's theorem

### 2.1 Schur parameters

Define `schurParam f n`, the `n`-th Schur parameter `γₙ(f)`, as the value at `0` of the `n`-th
iterate of the Schur step, and `IsSchurSequence γ` for `γ : ℕ → ℂ`: either `|γₙ| < 1` for every
`n`, or for some `N` the terms before `N` lie in `𝔻`, `|γ_N| = 1` and every term after `N` is `0`.
Prove `isSchurSequence_schurParam`: the Schur parameters of a Schur function form a Schur
sequence (Simon, (3.2), p. 7, and the definition of the set of sequences on p. 6, where a sequence
that reaches the circle stops there).

Route: by 1.2 every iterate is a Schur function, so `|γₙ| ≤ 1`. If `|γ_N| = 1` for the first time
at `N`, the `N`-th iterate is the constant `γ_N` on `𝔻` (1.1), its Schur step is `0` on `𝔻`, and so
is every further iterate; the parameters after `N` are `0`. The zeros after `N` are the division
convention's record of the stop.

**Checks.**
- `z` has parameters `0, 1, 0, 0, …`; `z²` has `0, 0, 1, 0, …`; `z/2` has `0, 1/2, 0, 0, …`, all in
  `𝔻`; a constant `c` with `|c| < 1` has `c, 0, 0, …`.
- `(1 + z)/2` has `γ₀ = 1/2` and `γₙ = 2/(2n + 1)` for `n ≥ 1`: its `n`-th iterate is
  `2/((2n + 1) − (2n − 1) z)`.
- `(z + i/2)/(1 − (i/2) z)` has parameters `i/2, 1, 0, …`.

*Needs:* 1.1, 1.2.

### 2.2 Schur's theorem: uniqueness

Prove `eqOn_of_schurParam_eq`: two Schur functions with the same Schur parameters agree on `𝔻`
(Simon, Lemma 3.2, p. 8, with (3.6) and (3.8) on the same page).

Route: write `f = schurUnstep γ₀ f₁` on `𝔻` (1.3) and expand. If `γ₀, …, γ_{n−1}` lie in `𝔻`, the
Taylor coefficient of order `n` of `f` is `γₙ ∏_{j<n} (1 − |γⱼ|²)` plus a polynomial in
`γ₀, conj(γ₀), …, γ_{n−1}, conj(γ_{n−1})` (Simon, (3.6)). If no parameter has modulus one, the two
functions have the same Taylor coefficients and agree on `𝔻` by `Complex.taylorSeries_eq_on_ball'`.
If `γ_N` is the first of modulus one, both `N`-th iterates are the constant `γ_N` on `𝔻`, and
applying 1.3 `N` times recovers `f` and `g` from the same data.

**Checks.**
- `z/2` and `(z + z²)/2` are Schur functions with `γ₀ = 0` and `γ₁ = 1/2`; their `γ₂` are `0` and
  `2/3`, the first iterates being `1/2` and `(1 + z)/2`.

*Needs:* 1.1, 1.3, 2.1; Mathlib `Complex.taylorSeries_eq_on_ball'`.

### 2.3 Schur's theorem: existence

Prove `exists_isSchurFunction_schurParam_eq`: every Schur sequence is the sequence of Schur
parameters of a Schur function (Simon, Lemma 3.2, p. 8, and its proof with the approximants (3.9)).

Route: for a sequence that reaches the circle at `N`, start from the constant `γ_N` and apply 1.3
with `γ_{N−1}, …, γ₀`. For a sequence in `𝔻`, let `f⁽ⁿ⁾` be obtained in the same way from
`γ₀, …, γₙ` and the tail `0`; its parameters are `γ₀, …, γₙ, 0, 0, …`. By 2.2's coefficient
formula, `f⁽ⁿ⁾` and `f⁽ᵐ⁾` have the same Taylor coefficients up to order `min(n, m)`, and all their
coefficients have modulus at most `1` (1.1), so `|f⁽ⁿ⁾(z) − f⁽ᵐ⁾(z)| ≤ 2 ∑_{k > min(n,m)} |z|ᵏ`. The
`f⁽ⁿ⁾` converge locally uniformly on `𝔻` to a holomorphic function
(`TendstoLocallyUniformlyOn.differentiableOn`) bounded by `1`, whose first `n + 1` Taylor
coefficients are those of `f⁽ⁿ⁾`; by the coefficient formula its parameters are the `γₙ`.

**Checks.**
- The sequence `1/2, 2/3, 2/5, 2/7, …` gives `(1 + z)/2`, and `0, 1, 0, …` gives `z`.
- The constant sequence `1/2` is a Schur sequence of the first kind; the sequence `0, 2, 0, …` is
  not a Schur sequence, and no Schur function has `γ₁ = 2`.

*Needs:* 1.1, 1.3, 2.1, 2.2; Mathlib `TendstoLocallyUniformlyOn.differentiableOn`,
`TendstoLocallyUniformlyOn.deriv`.

### 2.4 Finite Blaschke products

Define `IsFiniteBlaschkeProduct f n` as in the Conventions. Prove
`isFiniteBlaschkeProduct_iff_schurParam`: a Schur function is a finite Blaschke product of degree
`n` if and only if `γ₀, …, γ_{n−1}` lie in `𝔻` and `|γₙ| = 1`. (Proved here; Simon, (2.9), p. 4,
names the finite Blaschke products as the Schur functions of measures with finite support.)

Route: for `n = 0` both sides say that `f` is a constant of modulus one on `𝔻` (1.1). For `n ≥ 1`,
a finite Blaschke product `B` of degree `n` has `|B(0)| < 1` (ConformalMappingPartII 3.2), and its
Schur step `φ_γ(B(z))/z` is a finite Blaschke product of degree `n − 1`. Conversely, for `|γ| < 1`
and a finite Blaschke product `B` of degree `n − 1`, `schurUnstep γ B = φ₋γ ∘ (z B)` is one of
degree `n`. Both rest on one fact: for a finite Blaschke product `B` of degree `m` and `|a| < 1`,
`φₐ ∘ B` and `B ∘ φₐ` are finite Blaschke products of degree `m`. Indeed `B(z) = a` has exactly
`m` solutions in `𝔻` with multiplicity: they are the roots of
`c ∏ (z − aᵢ) − a ∏ (1 − conj(aᵢ) z)`, a polynomial of degree `m` since `|a ∏ aᵢ| < 1 = |c|`, and
none lies off `𝔻`, where every factor of `B` has modulus at least one. So `φₐ ∘ B` is a rational
function, holomorphic near the closed disc, with these `m` zeros in `𝔻` and modulus one on the
circle; divided by the finite Blaschke product with the same zeros it has no zero in the closed
disc and modulus one on the circle, so it is a constant of modulus one by the maximum modulus
principle applied to it and to its inverse. `B ∘ φₐ` is a product of factors `bᵢ ∘ φₐ`, each a
constant of modulus one times a single factor.

**Checks.**
- `z²` has degree `2` and parameters `0, 0, 1`; `z ↦ c` with `|c| = 1` has degree `0`.
- `z/2` and `(1 + z)/2` are not finite Blaschke products: none of their parameters has modulus one.
- The hypothesis that `f` is a Schur function is needed: the function equal to `1` at `0` and to `0`
  elsewhere has `|γ₀| = 1` and is not a constant of modulus one on `𝔻`.

*Needs:* 1.1, 1.2, 1.3, 2.1; ConformalMappingPartII 3.2.

### Examples

The parameters of `z`, `z²`, `z/2`, `(z + z²)/2`, `(1 + z)/2` and of the disc automorphism with
zero `−i/2`.

### Dependencies

Layer 1. Mathlib `Complex.taylorSeries_eq_on_ball'`, `TendstoLocallyUniformlyOn.differentiableOn`,
`TendstoLocallyUniformlyOn.deriv`;
ConformalMappingPartII Layer 3, finite Blaschke products (3.2).

## Layer 3: Pick's theorem

Throughout, `z, w : Fin n → ℂ` and `n` may be `0`.

### 3.1 The Pick matrix and Pick's theorem

Define `pickMatrix z w`, the `n × n` matrix with entry `(1 − wᵢ conj(wⱼ)) / (1 − zᵢ conj(zⱼ))` in
row `i` and column `j`. Prove `exists_isSchurFunction_interpolating_iff`: if every `zᵢ` lies in
`𝔻`, some Schur function `f` has `f(zᵢ) = wᵢ` for every `i` if and only if `pickMatrix z w` is
positive semidefinite. The points need not be distinct (Sarason, §4, pp. 186–188, for distinct
points: there the criterion is that an operator on an `n`-dimensional space have norm at most one,
and the matrix form follows from the inner products `1/(1 − zᵢ conj(zⱼ))` of the Szegő kernels, as
in the computation on p. 188; the theorem is Pick's (1916), as Sarason attributes it. The route
here is the Schur algorithm, not Sarason's.)

Route, by induction on `n`; `n = 0` is trivial. Repeated points: if `zᵢ = zⱼ`, the principal
`2 × 2` minor on `{i, j}` is `−|wᵢ − wⱼ|² / (1 − |zᵢ|²)²`, so either side forces `wᵢ = wⱼ`, and
the repeated row and column may be removed from both sides. For distinct points: the diagonal entry
`(1 − |w₁|²)/(1 − |z₁|²)` is nonnegative exactly when `|w₁| ≤ 1`. If `|w₁| = 1`, either side forces
every `wⱼ` to equal `w₁` (the first row of a positive semidefinite matrix with zero diagonal entry
vanishes, and `1 − w₁ conj(wⱼ) = 0` means `wⱼ = w₁`), and `f = w₁` is the interpolant. If
`|w₁| < 1`, replace `zⱼ` by `φ_{z₁}(zⱼ)` and `wⱼ` by `φ_{w₁}(wⱼ)`: by the identity of the
Conventions the Pick matrix changes by congruence with an invertible diagonal matrix (on either
side every `|wⱼ| ≤ 1`, by the diagonal entries or by the values of `f`, so no denominator vanishes)
(`Matrix.IsUnit.posSemidef_star_left_conjugate_iff`), and `f` by `φ_{w₁} ∘ f ∘ φ₋z₁`. Now
`z₁ = w₁ = 0`, the first row of the matrix is all ones, and its Schur complement is `D Q Dᴴ`, where
`D` is the diagonal matrix of `z₂, …, zₙ` and `Q` is the Pick matrix of the points `zⱼ` and the
values `wⱼ / zⱼ` for `j ≥ 2` (`Matrix.PosDef.fromBlocks₁₁` with the `1 × 1` block `[1]`). A Schur
function with `f(0) = 0` takes the values `wⱼ` exactly when its Schur step takes the values
`wⱼ / zⱼ` (1.2, 1.3), so the induction hypothesis for `Q` closes both directions.

**Checks.**
- `n = 1`: the matrix `[(1 − |w|²)/(1 − |z|²)]` is positive semidefinite exactly when `|w| ≤ 1`,
  and the constant `w` interpolates.
- `z = (0, 1/2)`: for `w = (0, 1/2)` the matrix is all ones, singular and positive semidefinite,
  and `f(z) = z`; for `w = (0, 1/4)` it is `[[1, 1], [1, 5/4]]` with determinant `1/4`; for
  `w = (0, 3/5)` its determinant is `−11/75`, as Schwarz's lemma (`|f(1/2)| ≤ 1/2`) requires.
- Two points with values in `𝔻`: the matrix is positive semidefinite exactly when the
  pseudo-hyperbolic distance `|(w₁ − w₂)/(1 − conj(w₂) w₁)|` is at most
  `|(z₁ − z₂)/(1 − conj(z₂) z₁)|`, which is the Schwarz–Pick lemma.
- Repeated points: `z = (0, 0)` with `w = (0, 1/2)` gives `[[1, 1], [1, 3/4]]`, of determinant
  `−1/4`; with `w = (0, 0)` it gives the all-ones matrix, and `0` interpolates.

*Needs:* 1.2, 1.3; Mathlib `Matrix.PosSemidef`, `Matrix.PosDef.fromBlocks₁₁`,
`Matrix.IsUnit.posSemidef_star_left_conjugate_iff`; Tau Ceti
`TauCeti.norm_sq_one_sub_conj_mul_sub_norm_sq_sub`,
`TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one`.

### 3.2 Uniqueness of the interpolant

Prove `interpolant_unique_iff_not_posDef`: for distinct points `zᵢ` of `𝔻`, any two Schur
functions taking the values `wᵢ` at the `zᵢ` agree on `𝔻` if and only if `pickMatrix z w` is not
positive definite (Sarason, §5, Corollary, p. 189, for the direction from a singular matrix: the
interpolant of least norm is unique, and when the Pick matrix is positive semidefinite and
singular the operator (10) of §4 has norm one, so every Schur interpolant has least norm; the
converse is proved here).

Route: if the matrix is not positive semidefinite there is no interpolant (3.1). If it is positive
semidefinite and singular, follow the induction of 3.1: positive definiteness of the matrix is
equivalent to `|w₁| < 1` together with positive definiteness of `Q`, so some stage reaches a value
of modulus one, where the interpolant is a forced constant, and 1.3 recovers `f` from it. If the
matrix is positive definite, every stage keeps its value in `𝔻`; after the last point any Schur
function may be used as the final step, and the choices `0` and `1/2` give two interpolants. They
differ on `𝔻`, because the inverse step and the composition with disc automorphisms are injective
on functions on `𝔻`.

**Checks.**
- `z = (0, 1/2)`, `w = (0, 1/4)`: the matrix is positive definite and `z/2` and `z²` both
  interpolate; for `w = (0, 1/2)` only `z` does, the case of equality in Schwarz's lemma.
- `n = 0`: the empty matrix is positive definite and every Schur function interpolates.
- Distinct points are needed: `z = (0, 0)`, `w = (0, 0)` give a singular matrix, and `0` and `z/2`
  both interpolate.
- Points in `𝔻` are needed: for `n = 1`, `z₁ = 2` and `w₁ = 0` the matrix is `[−1/3]`, and `0` and
  `(z − 2)/4` both vanish at `2`.

*Needs:* 1.3, 3.1; Mathlib `Matrix.PosDef`, `Matrix.IsUnit.posDef_star_left_conjugate_iff`.

### 3.3 The singular case: Blaschke products

Prove `isFiniteBlaschkeProduct_rank_pickMatrix`: for distinct points `zᵢ` of `𝔻`, if
`pickMatrix z w` is not positive definite, every Schur function taking the values `wᵢ` is a finite
Blaschke product whose degree is the rank of `pickMatrix z w` (Sarason, §5, Corollary, p. 189, for
a rational function of constant modulus on the circle with fewer than `n` zeros; the degree is
computed here).

Route: in the induction of 3.1 the rank of the matrix is `1 + rank Q` at a stage with `|w₁| < 1`,
since the Schur complement of the entry `1` is `D Q Dᴴ` with `D` invertible
(`Matrix.rank_mul_eq_left_of_isUnit_det`, `Matrix.rank_mul_eq_right_of_isUnit_det`), and the
degree of the interpolant goes up by one at the same stage (2.4, with the composition by disc
automorphisms in its route). At the stage with `|w₁| = 1` the matrix is `0` and the interpolant a
constant of modulus one, of degree `0`.

**Checks.**
- `z = (0, 1/2)`, `w = (0, 1/2)`: rank `1`, interpolant `z`.
- For a finite Blaschke product of degree `r` and `n` distinct points, the Pick matrix of its values
  has rank `min(n, r)`; it is singular exactly when `n > r`.
- Distinct points are needed: `z = (0, 0)`, `w = (0, 0)` give rank `1`, and `z/2` interpolates and
  is not a finite Blaschke product.

*Needs:* 2.4, 3.1, 3.2; Mathlib `Matrix.rank`, `Matrix.rank_mul_eq_left_of_isUnit_det`,
`Matrix.rank_mul_eq_right_of_isUnit_det`.

### 3.4 Positive Pick kernels

Prove `isSchurFunction_iff_forall_posSemidef_pickMatrix`: a function `f : ℂ → ℂ` is a Schur
function if and only if `pickMatrix z (f ∘ z)` is positive semidefinite for every `n` and every
`z : Fin n → ℂ` with values in `𝔻`. No regularity of `f` is assumed. (Proved here.)

Route: the forward direction is 3.1. Conversely, fix a countable dense set `{d₁, d₂, …}` of `𝔻` and
a point `p` of `𝔻`. By 3.1 there is a Schur function `gₙ` equal to `f` at `p, d₁, …, dₙ`.
By Montel's theorem (`TauCeti.montel`, the `gₙ` being bounded by `1`) a subsequence converges
locally uniformly on `𝔻` to a holomorphic `g_p`, bounded by `1`, equal to `f` at `p`
and at every `dₖ`. Two such limits are continuous and agree on the dense set, so they are one
function `g`, and `f(p) = g(p)` for every `p` in `𝔻`.

**Checks.**
- `z ↦ conj(z)`: every Pick matrix at two points of `𝔻` is positive semidefinite (its off-diagonal
  entries have modulus `1`, its diagonal entries are `1`), but at `0, 1/2, i/2` the determinant is
  `−4/17`. Two points never suffice.
- `z ↦ 2z` fails at the single point `3/4`, where the entry is `(1 − 9/4)/(1 − 9/16) < 0`.

*Needs:* 3.1; Tau Ceti `TauCeti.montel`; Mathlib `TopologicalSpace.exists_countable_dense`.

### Examples

The two-point data at `0, 1/2` with values `0` and `1/2`, `1/4`, `3/5`; repeated points; the
function `conj(z)` at `0, 1/2, i/2`.

### Dependencies

Layers 1 and 2. Mathlib `Matrix.PosSemidef`, `Matrix.PosDef`, `Matrix.PosDef.fromBlocks₁₁`,
`Matrix.IsUnit.posSemidef_star_left_conjugate_iff`,
`Matrix.IsUnit.posDef_star_left_conjugate_iff`, `Matrix.rank`,
`Matrix.rank_mul_eq_left_of_isUnit_det`, `Matrix.rank_mul_eq_right_of_isUnit_det`,
`TopologicalSpace.exists_countable_dense`; Tau Ceti
`TauCeti.norm_sq_one_sub_conj_mul_sub_norm_sq_sub`,
`TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`,
`TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one`, `TauCeti.montel`.

## Layer 4: the Carathéodory–Fejér problem for Schur functions

Throughout, `c : ℕ → ℂ`, `n : ℕ`, and `T` is `coeffToeplitz c n`.

### 4.1 The coefficient criterion

Define `coeffToeplitz c n`, the `(n + 1) × (n + 1)` lower triangular Toeplitz matrix with entry
`c(i − j)` in row `i` and column `j` for `j ≤ i` and `0` above the diagonal. Prove
`exists_isSchurFunction_taylorCoeff_iff`: some Schur function has Taylor coefficients
`c₀, …, cₙ` at `0` if and only if `1 − Tᴴ T` is positive semidefinite, that is, `T` has operator
norm at most `1` (Sarason, §3, p. 186, the conclusion drawn there for bounded functions; the
problem is Carathéodory's, studied by Carathéodory and Fejér (1911) and by Schur (1917–1918), as
Sarason attributes it. The route here is the Schur algorithm.)

Route: lower triangular Toeplitz matrices of size `n + 1` multiply as power series truncated after
`zⁿ`, so if `f = schurUnstep γ g`, then `T = (γ + X)(1 + conj(γ) X)⁻¹`, where `X` is the matrix of
`z g` and `γ = c₀`. For every square `X` with `1 + conj(γ) X` invertible,
`(1 + conj(γ) X)ᴴ (1 − Tᴴ T)(1 + conj(γ) X) = (1 − |γ|²)(1 − Xᴴ X)`. The matrix `1 − Xᴴ X` is
block diagonal with blocks `1 − T_dᴴ T_d` and `[1]`, where `d₀, …, d_{n−1}` are the first Taylor
coefficients of `g`; they depend only on `c₀, …, cₙ` when `|c₀| < 1`. So for `|c₀| < 1` the
criterion for `c` is the criterion for `d` (by `Matrix.IsUnit.posSemidef_star_left_conjugate_iff`),
and 1.2, 1.3 close the induction on `n`. The entry of `1 − Tᴴ T` in row and column `0` is
`1 − |c₀|² − … − |cₙ|²`: if `|c₀| > 1` it is negative, and if `|c₀| = 1` positive semidefiniteness
forces `c₁ = … = cₙ = 0`, the data of the constant `c₀`, while a Schur function with `|f(0)| = 1`
is constant (1.1).

**Checks.**
- `n = 0`: `1 − Tᴴ T = [1 − |c₀|²]`, and a Schur function with `f(0) = c₀` exists exactly when
  `|c₀| ≤ 1`.
- `n = 1`: the determinant of `1 − Tᴴ T` is `(1 − |c₀|²)² − |c₁|²`, so the criterion is
  `|c₁| ≤ 1 − |c₀|²`, the derivative form of the Schwarz–Pick lemma at the origin.
- `c = (1/2, 1)`: `1 − Tᴴ T = [[−1/4, −1/2], [−1/2, 3/4]]`, so no Schur function has `f(0) = 1/2`
  and `f′(0) = 1`, although every `|cₖ| ≤ 1`.
- `c = (1/2, 1/2)`: `1 − Tᴴ T = [[1/2, −1/4], [−1/4, 3/4]]`, of determinant `5/16`; `(1 + z)/2`
  and `(3 + 4z)/(6 + 2z)` are two solutions.
- The upper triangular convention gives the transpose of `T`, with the same singular values, so the
  criterion and the ranks below do not depend on the convention.

*Needs:* 1.1, 1.2, 1.3; Mathlib `iteratedDeriv`, `Complex.taylorSeries_eq_on_ball'`,
`Matrix.PosSemidef`, `Matrix.IsUnit.posSemidef_star_left_conjugate_iff`.

### 4.2 Uniqueness

Prove `taylorCoeff_interpolant_unique_iff_not_posDef`: any two Schur functions with Taylor
coefficients `c₀, …, cₙ` agree on `𝔻` if and only if `1 − Tᴴ T` is not positive definite
(Sarason, §5, Corollary, p. 189, for the direction from a singular matrix, where the matrix (8)
of §3 has norm one and every solution has least norm; the converse is proved here).

Route: as in 3.2, with the induction of 4.1. Positive definiteness for `c` is equivalent to
`|c₀| < 1` together with positive definiteness for `d`, by the congruence of 4.1; when it holds at
every stage, the final step is free and the choices `0` and `1/2` give two solutions, which
differ on `𝔻` because the inverse step is injective on functions on `𝔻`.

**Checks.**
- `c = (0, 1)`: `1 − Tᴴ T = diag(0, 1)`; the only solution is `z`, by Schwarz's lemma.
- `c = (3/5, 16/25)`: `1 − Tᴴ T` is singular, and `(z + 3/5)/(1 + 3z/5)` is the only solution; for
  `c = (3/5, 13/20)` the matrix has a negative eigenvalue.
- `c = (1, 0)`: `1 − Tᴴ T = 0`, the only solution is the constant `1`; `c = (1, 1/10)` has none.

*Needs:* 1.3, 4.1; Mathlib `Matrix.PosDef`, `Matrix.IsUnit.posDef_star_left_conjugate_iff`.

### 4.3 The singular case: Blaschke products

Prove `isFiniteBlaschkeProduct_rank_coeffToeplitz`: if `1 − Tᴴ T` is not positive definite, every
Schur function with Taylor coefficients `c₀, …, cₙ` is a finite Blaschke product whose degree is the
rank of `1 − Tᴴ T` (Sarason, §5, Corollary, p. 189, for a rational function of constant modulus on
the circle with at most `n` zeros; the degree is computed here).

Route: by the congruence and the block form in 4.1 the rank goes up by one at each stage with
`|c₀| < 1`, as does the degree (2.4); at a stage with `|c₀| = 1` the matrix is `0` and the function
a constant of modulus one.

**Checks.**
- `c = (0, 1)`: rank `1`, solution `z`; `c = (1, 0)`: rank `0`, solution `1`.
- For a finite Blaschke product of degree `r`, the matrix built from its first `n + 1` Taylor
  coefficients has rank `min(n + 1, r)`.

*Needs:* 2.4, 4.1, 4.2; Mathlib `Matrix.rank`, `Matrix.rank_mul_eq_left_of_isUnit_det`,
`Matrix.rank_mul_eq_right_of_isUnit_det`.

### Examples

The data `(1/2, 1)`, `(1/2, 1/2)`, `(0, 1)`, `(3/5, 16/25)`, `(1, 0)` with their matrices and
solutions.

### Dependencies

Layers 1 and 2. Mathlib `iteratedDeriv`, `Complex.taylorSeries_eq_on_ball'`, `Matrix.PosSemidef`,
`Matrix.PosDef`, `Matrix.IsUnit.posSemidef_star_left_conjugate_iff`,
`Matrix.IsUnit.posDef_star_left_conjugate_iff`, `Matrix.rank`,
`Matrix.rank_mul_eq_left_of_isUnit_det`, `Matrix.rank_mul_eq_right_of_isUnit_det`.

## Scope and ownership

This roadmap owns Schur functions as a class, the Schur step and its inverse, Schur parameters
and Schur's theorem (Layers 1 and 2), Pick's theorem with its uniqueness and Blaschke statements
and the characterization by positive Pick kernels (Layer 3), and the Carathéodory–Fejér problem for
Schur functions with its uniqueness and Blaschke statements (Layer 4).

Already in the libraries or stated elsewhere, and therefore not targets:

- The Schwarz–Pick lemma, in contraction, derivative and rigidity form, is in Tau Ceti
  (`TauCeti.pseudoHyperbolicExpr_map_le`, `TauCeti.norm_deriv_div_one_sub_norm_sq_le` and the files
  of `TauCeti/Analysis/Complex/Conformal/SchwarzPick/`), as Completed/ConformalMapping Layer 2
  records. Its contraction form is the necessary half of the two-point case of 3.1, and the
  derivative bound at the origin is the case `n = 1` of 4.1; it is not restated.
  Schwarz's lemma is Mathlib's; the disc automorphisms and Montel's theorem are Tau Ceti's.
- Finite Blaschke products, their factors and their boundary behaviour are ConformalMappingPartII
  Layer 3 (3.1 and 3.2). The predicate `IsFiniteBlaschkeProduct` records the same functions on the
  disc with their degree, which the statements above need; 2.4 consumes 3.2's bound `|B| < 1` and
  adds the relation with Schur parameters. Mathlib's canonical factor
  `Complex.canonicalFactor 1 a` (`Mathlib/Analysis/Complex/CanonicalDecomposition.lean`) is
  `(1 − conj(a) z)/(z − a)`, the reciprocal of a Blaschke factor, used there for the canonical
  decomposition of meromorphic functions; the predicate here uses the factors themselves.
- PositiveDefiniteSequencesAndToeplitzForms, Layer 5, states the truncated trigonometric moment
  problem: its 5.1 (the Carathéodory–Fejér decomposition of a positive semidefinite Toeplitz
  section) and 5.2 (the Carathéodory–Toeplitz theorem, the moment form). Layer 4 here is the form
  for bounded functions, with the lower triangular matrix of Taylor coefficients; the two are
  related by a Cayley transform (Sarason, §3), which is not stated here, and this roadmap does not
  depend on that one.
- Tau Ceti's Pick functions (`TauCeti/Analysis/Complex/Pick/`), holomorphic functions on the upper
  half-plane with nonnegative imaginary part and their Nevanlinna representation, are a different
  object; OperatorMonotoneFunctionsAndMatrixMeans uses them for Loewner's theorem. Nothing here
  concerns them.
- OperatorTheory/ToeplitzOperators owns Toeplitz operators and multipliers on Hardy space. The
  operator-theoretic route to Pick's theorem (Sarason's commutant lifting) and the identification of
  Schur functions with contractive multipliers of Hardy space are not treated here.
- RepresentationTheory/SchurWeyl uses "Schur functions" for symmetric functions, an unrelated
  object. DiracScatteringAndNonlinearFourierTransform, 4.5, studies a Riccati equation for a
  continuous analogue; discrete scattering and the nonlinear Fourier transform are not treated here.
- Reproducing kernel Hilbert spaces are Mathlib's (`RKHS`, with `RKHS.posSemidef_kernel`, in
  `Mathlib/Analysis/InnerProductSpace/Reproducing.lean`), and `Matrix.PosSemidef` applies to
  matrices indexed by any type. The condition of 3.4 says that the Pick kernel of `f`, as a matrix
  indexed by the points of the disc, is positive semidefinite in that sense; it is stated here
  through its finite sections, and the Hilbert space of the Pick kernel is not treated.

Not treated here: orthogonal polynomials on the unit circle, Verblunsky coefficients and
Geronimus' theorem; Hankel forms and moment problems on the real line; interpolation at infinitely
many points, boundary interpolation, matrix-valued and several-variable interpolation; the
parametrization of all solutions in the positive definite case.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Complex/Schwarz.lean`: `Complex.norm_le_norm_of_mapsTo_ball` (if `f` is
  holomorphic on `ball 0 R`, maps it into `closedBall 0 R` and `f 0 = 0`, then `‖f z‖ ≤ ‖z‖` for
  `‖z‖ < R`).
- `Mathlib/Analysis/Complex/AbsMax.lean`: `Complex.eqOn_of_isPreconnected_of_isMaxOn_norm` (a
  function holomorphic on a preconnected open set whose norm has a maximum at a point of it is
  constant there).
- `Mathlib/Analysis/Complex/RemovableSingularity.lean`: `Complex.differentiableOn_dslope`
  (`dslope f c` is holomorphic on a neighbourhood `s` of `c` exactly when `f` is).
- `Mathlib/Analysis/Complex/TaylorSeries.lean`: `Complex.taylorSeries_eq_on_ball'` (a function
  holomorphic on `ball c r` is the sum of `(n!)⁻¹ * iteratedDeriv n f c * (z − c) ^ n` there).
- `Mathlib/Analysis/Complex/Liouville.lean`:
  `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Cauchy's estimate
  `‖iteratedDeriv n f c‖ ≤ n! C / Rⁿ` for `f` holomorphic on the disc and continuous on its
  closure, bounded by `C` on the circle).
- `Mathlib/Analysis/Complex/LocallyUniformLimit.lean`:
  `TendstoLocallyUniformlyOn.differentiableOn` (a locally uniform limit of holomorphic functions on
  an open set is holomorphic) and `TendstoLocallyUniformlyOn.deriv` (their derivatives converge
  locally uniformly to its derivative).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`, `Matrix.PosDef` (Hermitian, with
  `∑ᵢ ∑ⱼ star xᵢ Aᵢⱼ xⱼ` nonnegative for every finitely supported `x`, respectively positive for
  `x ≠ 0`; for a finite index type this is `star x ⬝ᵥ A *ᵥ x`, by
  `Matrix.posSemidef_iff_dotProduct_mulVec` and `Matrix.posDef_iff_dotProduct_mulVec`);
  `Matrix.IsUnit.posSemidef_star_left_conjugate_iff` and
  `Matrix.IsUnit.posDef_star_left_conjugate_iff` (for a unit `U`, `star U * A * U` is positive
  semidefinite, respectively positive definite, exactly when `A` is); `Matrix.PosDef.fromBlocks₁₁`
  (for `A` positive definite and invertible, `fromBlocks A B Bᴴ D` is positive semidefinite exactly
  when `D − Bᴴ A⁻¹ B` is).
- `Mathlib/Analysis/InnerProductSpace/Reproducing.lean`: `RKHS`, `RKHS.posSemidef_kernel`, cited
  in the scope section above and not consumed.
- `Mathlib/Analysis/Complex/CanonicalDecomposition.lean`: `Complex.canonicalFactor`, cited in the
  scope section above and not consumed.
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`, `Matrix.rank_mul_eq_left_of_isUnit_det`,
  `Matrix.rank_mul_eq_right_of_isUnit_det` (multiplying by a matrix with unit determinant keeps the
  rank).
- `TopologicalSpace.exists_countable_dense` (a separable space has a countable dense set),
  `iteratedDeriv`, `dslope`, `Metric.ball`, `Metric.closedBall`.

### From Tau Ceti

- `TauCeti/Analysis/Complex/Conformal/PseudoHyperbolic.lean`:
  `TauCeti.norm_sq_one_sub_conj_mul_sub_norm_sq_sub`
  (`‖1 − conj w * z‖² − ‖z − w‖² = (1 − ‖z‖²)(1 − ‖w‖²)` for all `z, w`).
- `TauCeti/Analysis/Complex/Conformal/Moebius.lean`: `TauCeti.unitDiscMoebius`;
  `TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one` and
  `TauCeti.differentiableOn_unitDiscMoebiusFormula_of_norm_lt_one` (for `‖a‖ < 1`, the map
  `z ↦ (z − a)/(1 − conj a * z)` sends `ball 0 1` holomorphically into itself);
  `TauCeti.leftInvOn_unitDiscMoebiusFormula_of_norm_lt_one` (the factor with centre `−a` inverts it
  on `ball 0 1`).
- `TauCeti/Analysis/Complex/Conformal/Montel/Basic.lean`: `TauCeti.montel` (a locally bounded
  sequence of holomorphic maps on an open set has a subsequence converging locally uniformly to a
  holomorphic map).
- `TauCeti/Analysis/Complex/Conformal/SchwarzPick/Basic.lean` and `SchwarzPick/Derivative.lean`:
  `TauCeti.pseudoHyperbolicExpr_map_le`, `TauCeti.norm_deriv_div_one_sub_norm_sq_le`, cited in the
  scope section above and not consumed.

### From TauCetiRoadmap.ConformalMappingPartII

- Layer 3, finite Blaschke products (3.2): a finite Blaschke product with at least one zero in the
  open disc has modulus less than one there and modulus one on the circle; with the factors of 3.1,
  a parameter on the circle contributes a constant of modulus one. Used in 2.4, and through it in
  3.3 and 4.3.

## References

- Donald Sarason, *Generalized interpolation in H∞*, Trans. Amer. Math. Soc. 127 (1967), 179–203,
  DOI 10.1090/S0002-9947-1967-0208383-8 (open archive of the AMS): §3, p. 186 (the coefficient
  problem for bounded functions and the matrix (8)); §4, pp. 186–188 (the Nevanlinna–Pick problem,
  the operator (10) and the computation with the kernels `1/(1 − conj(zₖ) z)`); §5, Corollary,
  p. 189 (uniqueness and rationality of the interpolant of least norm). Its bibliography dates
  Pick's theorem to 1916, Nevanlinna's to 1919, Carathéodory and Fejér's paper to 1911 and
  Schur's to 1917–1918.
- Barry Simon, *OPUC on one foot*, arXiv:math/0502485, version 1 (February 2005), published in
  Bull. Amer. Math. Soc. 42 (2005): (2.5), p. 3; (2.9), p. 4; the sequence space, p. 6; the Schur
  algorithm (3.1)–(3.2), p. 7; (3.6), (3.8), Lemma 3.2 and (3.9), p. 8.
- The Schur algorithm and Schur's theorem are I. Schur's (1917–1918), as Simon attributes them.

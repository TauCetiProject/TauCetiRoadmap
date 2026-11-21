# Roadmap: Fourier analysis of Boolean functions

**Summary.** This roadmap develops harmonic analysis of real functions on the discrete cube, the
group of `n`-tuples of bits with the uniform probability measure, for every finite dimension `n`
including zero. It builds the expansion of a function in the Walsh characters, the influences of
the coordinates and their sum, the noise operator and noise stability, and the hypercontractive
inequality of Bonami with its consequences for functions with values `±1`, which the roadmap
calls sign-valued. All functions are real valued and all probabilities are counting
probabilities, so no measure theory is used.

The headline theorems are these.

- *Poincaré and edge-isoperimetric inequalities.* For every real function `f` on the cube, the
  variance of `f` is at most its total influence, with equality exactly when `f` has degree at
  most one. If `f` is sign-valued and `α > 0` is the fraction of points where `f = −1`, the
  total influence is at least `2 α log₂(1/α)`.
- *Hypercontractivity.* For `1 ≤ p ≤ q` with `q > 1` and every real `ρ` with
  `ρ² ≤ (p − 1)/(q − 1)`, the noise operator with parameter `ρ` does not increase norms from
  `L^p` to `L^q` of the cube: the `q`-norm of the smoothed function is at most the `p`-norm of
  the function.
- *The theorem of Kahn, Kalai and Linial.* Every sign-valued function `f` on the cube of
  dimension `n ≥ 1` has a coordinate whose influence is at least `(1/5) Var[f] (ln n)/n`.
- *Kalai's formula and Arrow's theorem.* Let `n` voters each rank three candidates, let all
  profiles of rankings be equally likely, and let one sign-valued rule `f` decide each of the
  three pairwise contests. The probability that the three outcomes are not all equal is
  `3/4 − (3/4)` times the noise stability of `f` at `−1/3`; it equals `1` only when `f` is a
  coordinate function or the negative of one.

The roadmap builds on Mathlib's theory of additive characters of finite abelian groups, which
supplies orthogonality of characters and the normalized average of a function on a finite type.
RandomMatrices states the Efron–Stein inequality for independent coordinates and logarithmic
Sobolev inequalities on Euclidean spaces; the Poincaré inequality here is the cube case of the
former, read off the spectrum together with its equality case. BanachSpaceTheory uses Walsh
functions inside Enflo's example and owns Kahane's inequality for vector-valued sign averages.
GaussianIsoperimetryAndClusters treats the Gaussian counterpart of isoperimetry; no Gaussian
statement is made here.

## How to read the build

Layer 1 below is the Walsh expansion: characters, coefficients, Plancherel's identity,
convolution and the sign-valued functions of degree at most one. Layer 2 depends on Layer 1 and
treats influences, their spectral formulas, the Poincaré inequality and the edge-isoperimetric
inequality. Layer 3 depends on Layer 1, and on the spectral formula of Layer 2 for one identity:
the noise operator, its action on the expansion and noise stability. Layer 4 depends on Layers 1
and 3: the two-point inequality, the hypercontractive inequality, moments of functions of
bounded degree, noise sensitivity of small sets and the level inequalities. Layer 5 depends on
Layers 1, 2 and 4, and on the spectral formula 3.3 of Layer 3, and contains the theorems on
coordinates of large influence: the theorem of Kahn, Kalai and Linial and the junta theorem.
Layer 6 depends on Layers 1 and 3: the linearity test, Kalai's formula and Arrow's theorem.
Within a layer the sections are in build order.

## Conventions

- **The cube.** `ι` is a type with `[Fintype ι] [DecidableEq ι]`; `n` stands for
  `Fintype.card ι`, and `n = 0` is allowed. The cube is the additive group `ι → ZMod 2`. The
  point `Pi.single i 1` has a single nonzero entry, at `i`, and is written `e_i` in prose; adding
  it flips coordinate `i`. The point with all entries `1` is written `𝟙` in prose.
- **Signs.** The sign of `a : ZMod 2` is `(-1 : ℝ) ^ a.val`, which is `1` at `a = 0` and `−1` at
  `a = 1`. Under `x ↦ (the signs of the entries of x)` the cube becomes the set of vectors with
  entries `±1`, addition becomes the entrywise product, and `walsh S` becomes the monomial
  `∏ i ∈ S, x i`.
- **Functions.** Functions on the cube are real valued. A function is sign-valued when
  `∀ x, f x = 1 ∨ f x = -1`; this hypothesis is written out in every statement that needs it.
  The functions `walsh {i}` are the coordinate functions.
- **Averages and probabilities.** `𝔼 x, f x` is Mathlib's `Finset.expect` over the whole cube,
  the sum divided by `2 ^ n`. The probability of a set of points, or of pairs or triples of
  points, is its density `Finset.dens`, the number of its elements divided by the number of all
  points, pairs or triples.
- **Norms.** For real `p ≥ 1`, `‖f‖_p` stands for `cubeNorm p f = (𝔼 x, |f x| ^ p) ^ p⁻¹`. No
  norm with `p = ∞` is used.
- **Coefficients, weight and degree.** `f̂(S)` stands for `walshCoeff f S`. The weight of `f` on
  `S` is `f̂(S)²`. "`f` has degree at most `k`" means `∀ S, k < S.card → walshCoeff f S = 0`; no
  degree function is defined, so the zero function needs no convention.
- **The noise parameter.** `noise ρ f` is defined for every real `ρ`, and the formulas of 3.2 and
  3.3 hold for every real `ρ`. Statements that need `|ρ| ≤ 1`, `0 ≤ ρ` or a bound in terms of
  `p` and `q` say so.
- **Logarithms.** `ln` is `Real.log` and `log₂` is `Real.logb 2`. Lean's conventions
  `Real.log 0 = 0` and `0⁻¹ = 0` are used only where a statement says so.
- **Names of results.** Results are named after Bonami, Kahn, Kalai, Linial, Friedgut, Blum,
  Luby, Rubinfeld, Harper and Arrow to say which classical theorem a target is. Locators refer
  to the arXiv edition of O'Donnell's book, to de Wolf's survey and to the lecture notes of
  Garban and Steif listed under References.

## Layer 1: the Walsh expansion

### 1.1 Walsh characters

Define `walsh S x = ∏ i ∈ S, (-1 : ℝ) ^ (x i).val` for `S : Finset ι` and `x : ι → ZMod 2`. The
definition needs no finiteness of `ι`.

- `walsh S (x + y) = walsh S x * walsh S y` and `walsh S 0 = 1`, so `walsh S` is an additive
  character with values `±1`.
- `walsh S x * walsh T x = walsh (symmDiff S T) x` (O'Donnell, Fact 1.6).
- For finite `ι`, `𝔼 x, walsh S x` is `1` if `S = ∅` and `0` otherwise (O'Donnell, Fact 1.7).
- *Classification* (`existsUnique_walsh_eq_addChar`). For finite `ι`, every
  `ψ : AddChar (ι → ZMod 2) ℝ` is `walsh S` for exactly one `S`. With this, the orthonormality
  `𝔼 x, walsh S x * walsh T x = if S = T then 1 else 0` (O'Donnell, Theorem 1.5) is Mathlib's
  `AddChar.wInner_cWeight_eq_boole` read through `RCLike.wInner_cWeight_eq_expect`.

Route for the classification: `ψ x ^ 2 = ψ (x + x) = ψ 0 = 1`, so `ψ` has values `±1`; put
`S = {i | ψ (Pi.single i 1) = -1}` and write `x` as the finite sum of the points
`Pi.single i (x i)`. Uniqueness: `walsh S (Pi.single i 1) = -1` exactly when `i ∈ S`.

**Checks.**
- On `ι = Fin 2`: `walsh {0, 1}` takes the values `1, −1, −1, 1` at `(0,0), (1,0), (0,1), (1,1)`,
  and `walsh ∅ = 1`. A definition with the product over all of `ι` in place of `S` would not
  depend on `S`.
- For `ι = ℕ` the classification fails: the group has uncountably many real additive characters
  and only countably many finite sets `S`. This is why the classification assumes `[Finite ι]`.

*Needs:* Mathlib `AddChar`, `AddChar.map_add_eq_mul`, `AddChar.map_zero_eq_one`, `ZMod.val`,
`Pi.single`, `AddChar.wInner_cWeight_eq_boole`, `RCLike.wInner_cWeight_eq_expect`. (O'Donnell,
Definition 1.2 and Theorem 1.5; the classification is proved here.)

### 1.2 Coefficients and the expansion

Define `walshCoeff f S = 𝔼 x, f x * walsh S x`.

- *Expansion* (`sum_walshCoeff_mul_walsh`). `∑ S, walshCoeff f S * walsh S x = f x` for every
  `f` and `x` (O'Donnell, Theorem 1.1 and Proposition 1.8; de Wolf, equation (2.1)).
- *Uniqueness.* If `f x = ∑ S, c S * walsh S x` for all `x`, then `c S = walshCoeff f S` for all
  `S`.
- `walshCoeff` is linear in `f`; `walshCoeff (walsh T) S` is `1` if `S = T` and `0` otherwise;
  `walshCoeff f ∅ = 𝔼 x, f x` (O'Donnell, Fact 1.12).

Route: expanding the product, `∑ S, walsh S x * walsh S y = ∏ i, (1 + (-1) ^ (x i + y i).val)`,
which is `2 ^ n` if `x = y` and `0` otherwise; uniqueness is orthonormality.

**Checks.**
- On `Fin 2`, the function with `f (1,1) = −1` and `f = 1` elsewhere has coefficients
  `1/2, 1/2, 1/2, −1/2` at `∅, {0}, {1}, {0,1}`. With a sum in place of the average the first
  coefficient would be `2`.
- On `Fin 3`, the majority function (`f x = 1` when at most one entry of `x` is `1`, and `−1`
  otherwise) has coefficient `1/2` at each singleton, `−1/2` at the whole set and `0` elsewhere.
- For `n = 0` the cube is one point, the only set is `∅`, and `walshCoeff f ∅` is the value of
  `f`.

*Needs:* 1.1; Mathlib `Finset.expect`, `Fintype.expect_eq_sum_div_card`, `Fintype.card_fun`,
`ZMod.card`, `Finset.prod_add`.

### 1.3 Plancherel's identity, variance and norms

- *Plancherel* (`expect_mul_eq_sum_walshCoeff`). `𝔼 x, f x * g x = ∑ S, f̂(S) * ĝ(S)`
  (O'Donnell, §1.4, Plancherel's Theorem; de Wolf, §2.2). In particular
  `𝔼 x, f x ^ 2 = ∑ S, f̂(S)²`, and this sum is `1` for a sign-valued `f`.
- Define `variance f = 𝔼 x, (f x - 𝔼 y, f y) ^ 2`. Then
  `variance f = 𝔼 x, f x ^ 2 - (𝔼 x, f x) ^ 2`, and `variance f` is the sum of `f̂(S)²` over the
  nonempty `S` (O'Donnell, Proposition 1.13). For a sign-valued `f` with `f = −1` on a fraction
  `α` of the cube, `variance f = 4 α (1 − α)` (O'Donnell, Fact 1.14).
- Define `cubeNorm p f = (𝔼 x, |f x| ^ p) ^ p⁻¹`. For `1 ≤ p ≤ q`, `‖f‖_p ≤ ‖f‖_q`, and
  `‖f + g‖_p ≤ ‖f‖_p + ‖g‖_p`.

**Checks.**
- The two functions of 1.2 have squares of coefficients summing to `4 · (1/4) = 1`.
- The first function of 1.2 has variance `1 − 1/4 = 3/4 = 4 · (1/4) · (3/4)`.
- `cubeNorm p (walsh S) = 1` for every `p ≥ 1`; a norm with a sum in place of the average would
  give `2 ^ (n / p)`.

*Needs:* 1.1, 1.2; Mathlib `Finset.sum_comm`, `Real.inner_le_Lp_mul_Lq`, `Real.Lp_add_le`.

### 1.4 Convolution

The normalized convolution of `f` and `g` is the function `x ↦ 𝔼 y, f y * g (x - y)`; on the cube
`x - y = x + y`.

- (`walshCoeff_convolution`) Its coefficient at `S` is `f̂(S) * ĝ(S)` (O'Donnell, Theorem 1.27;
  de Wolf, §2.3).
- The convolution is commutative and associative.

**Checks.**
- The convolution of `walsh S` with itself is `walsh S`, and with `walsh T` for `T ≠ S` it is
  `0`. Without the normalization the first would be `2 ^ n • walsh S`.

*Needs:* 1.1, 1.2; Mathlib `Fintype.expect_equiv` (translation of the variable),
`Finset.expect_comm`.

### 1.5 Sign-valued functions of degree at most one

A sign-valued function of degree at most one is constant or is `walsh {i}` or `-walsh {i}` for
some `i` (O'Donnell, Exercise 1.19(a) and (b), in the form given after the Poincaré Inequality
of §2.3).

Route: write `f = a + ∑ i, b i • walsh {i}`. Since `f ^ 2 = 1`, the coefficient of `f ^ 2` at
`{i}` is `2 a (b i) = 0` and at `{i, j}` with `i ≠ j` it is `2 (b i) (b j) = 0`, so at most one
of the numbers `a`, `b i` is nonzero; by 1.3 its square is `1`.

**Checks.**
- `walsh {0} + walsh {1}` on `Fin 2` has degree one and the values `2, 0, 0, −2`: it is not
  sign-valued, and the statement says nothing about it.
- The first function of 1.2 is sign-valued of degree two and depends on both coordinates.

*Needs:* 1.1, 1.2, 1.3.

### Examples

The coordinate functions `walsh {i}`; the parity `walsh Finset.univ`; the function on `Fin 2`
with a single value `−1`; the majority function on `Fin 3`.

### Dependencies

Mathlib only: additive characters and their orthogonality, `Finset.expect`, and Hölder's and
Minkowski's inequalities for finite sums.

## Layer 2: influences and the edge boundary

### 2.1 Influences

Define `influence i f = 𝔼 x, ((f x - f (x + Pi.single i 1)) / 2) ^ 2` and
`totalInfluence f = ∑ i, influence i f`. In prose, `I[f]` is the total influence, the Laplacian
in direction `i` is `L_i f = (x ↦ (f x − f (x + e_i))/2)` and the average in direction `i` is
`f − L_i f`.

- For a sign-valued `f`, `influence i f` is the density of the set of `x` with
  `f x ≠ f (x + Pi.single i 1)` (O'Donnell, Definitions 2.13 and 2.17).
- The coefficient of `L_i f` at `S` is `f̂(S)` if `i ∈ S` and `0` otherwise, and
  `𝔼 x, f x * L_i f x = influence i f` (O'Donnell, Proposition 2.26).
- For a sign-valued `f`, `influence i f ≤ variance f` (O'Donnell, Exercise 2.8). Route: with
  `α` the density of `{f = −1}`, a flip of coordinate `i` that changes `f` has exactly one end in
  `{f = −1}` and exactly one in `{f = 1}`, so the influence is at most `2 min(α, 1 − α)`, which is
  at most `4 α (1 − α)`, the variance by 1.3.

**Checks.**
- `walsh {i}` has influence `1` at `i` and `0` at every other coordinate. Without the division
  by `2` the influence at `i` would be `4`.
- The parity `walsh Finset.univ` has all influences `1` and total influence `n`.
- The function on `Fin 2` with a single value `−1` has influences `1/2, 1/2`; the majority
  function on `Fin 3` has influences `1/2, 1/2, 1/2`.
- A constant function has all influences `0`; for `n = 0` the total influence is an empty sum.

*Needs:* 1.1, 1.2; 1.3 for the third bullet; Mathlib `Pi.single`, `Fintype.expect_equiv`.

### 2.2 Spectral formulas

- (`influence_eq_sum_sq_walshCoeff`) `influence i f` is the sum of `f̂(S)²` over the sets `S`
  containing `i` (O'Donnell, Theorem 2.20).
- (`totalInfluence_eq_sum_card_mul_sq`) `totalInfluence f = ∑ S, S.card * f̂(S)²` (O'Donnell,
  Theorem 2.38).

**Checks.**
- Majority on `Fin 3`: the sets containing `0` with nonzero coefficient are `{0}` and the whole
  set, giving `1/4 + 1/4 = 1/2`; the total is `3 · (1/4) + 3 · (1/4) = 3/2`.

*Needs:* 1.3, 2.1; Mathlib `Finset.sum_comm`.

### 2.3 The Poincaré inequality

- (`variance_le_totalInfluence`) `variance f ≤ totalInfluence f`, and equality holds if and only
  if `f` has degree at most one (O'Donnell, §2.3, the Poincaré Inequality and the sentence after
  it; Garban and Steif, Theorem I.1, for the inequality for sign-valued functions).
- If `f̂(S) = 0` for all `S` with `0 < S.card < k`, then `k * variance f ≤ totalInfluence f`;
  this compares the formulas of 1.3 and 2.2 term by term.
- For a sign-valued `f`, equality `variance f = totalInfluence f` holds exactly when `f` is
  constant or `± walsh {i}`.

**Checks.**
- `f = walsh {0} + 2 • walsh {1}`: variance `5`, total influence `5`.
- The function on `Fin 2` with a single value `−1`: `3/4 ≤ 1`. The parity on `n ≥ 1`
  coordinates: `1 ≤ n`, and `n · 1 ≤ n` in the second bullet with `k = n`.

*Needs:* 1.3, 2.2; 1.5 for the third bullet.

### 2.4 The edge-isoperimetric inequality

- (`two_mul_density_mul_logb_le_totalInfluence`) For a sign-valued `f` and
  `α = 𝔼 x, (1 - f x) / 2`, the density of the set where `f = −1`:
  `2 * α * Real.logb 2 α⁻¹ ≤ totalInfluence f`. Applied to `-f` it gives the same bound with
  `1 − α` (O'Donnell, Theorem 2.39, stated there for the smaller of the two densities; the
  inequality goes back to Harper; proved here).
- *Set form.* For a nonempty set `A` of points of the cube, the number of pairs `(x, i)` with
  `x ∈ A` and `x + e_i ∉ A` is at least `|A| (n − log₂ |A|)`; equivalently the number of
  two-element sets `{x, x + e_i}` contained in `A` is at most `(|A|/2) log₂ |A|`.

Route: prove the second form of the set statement by induction on `n`, splitting `A` along one
coordinate into parts with `a ≤ b` elements; the pairs that cross the split number at most `a`,
and `a log₂ a + b log₂ b + 2a ≤ (a + b) log₂ (a + b)`. With `t = a/(a + b) ∈ [0, 1/2]` the last
inequality says that the binary entropy at `t` is at least `2t ln 2`, which holds because the
entropy is concave, vanishes at `0` and equals `ln 2` at `1/2`. The function form follows from
`I[f] = 2 · 2^(−n) ·` (the number of pairs of the set form for `A = {f = −1}`).

**Checks.**
- If `{f = −1}` is a subcube of codimension `k`, then `α = 2^(−k)`, exactly `k` coordinates have
  influence `2^(1−k)`, and both sides equal `k · 2^(1−k)`.
- On `Fin 2`, equality holds for exactly `10` of the `16` sign-valued functions: those for
  which `{f = −1}` is empty, a point, an edge or the whole cube.
- The function on `Fin 2` with `f = 1` at a single point has `α = 3/4`, bound
  `(3/2) log₂(4/3) = 0.6226` and total influence `1`; its negative gives the bound `1`.
- For `α = 0` the left side is `0` by the conventions `0⁻¹ = 0` and `Real.logb 2 0 = 0`.

*Needs:* 2.1; Mathlib `Real.logb`, `Real.binEntropy`, `Real.strictConcave_binEntropy`,
`Real.binEntropy_zero`, `Real.binEntropy_two_inv`.

### Examples

Subcubes, for which 2.4 is an equality; the parity, for which 2.3 is far from an equality;
functions of degree one, for which 2.3 is an equality.

### Dependencies

Layer 1 (1.1, 1.2, 1.3, 1.5). Mathlib: `Pi.single`, sums over finite sets, the binary entropy
function.

## Layer 3: the noise operator

### 3.1 The operator

Define `noise ρ f x = ∑ y, (∏ i, (1 + ρ * (-1) ^ (x i + y i).val) / 2) * f y`. The factor of the
kernel at coordinate `i` is `(1 + ρ)/2` if `x i = y i` and `(1 − ρ)/2` otherwise.

- The kernel is symmetric in `x` and `y`, and its sum over `y` is `1` for every real `ρ`.
- For `|ρ| ≤ 1` the kernel is nonnegative: `noise ρ f x` is the mean of `f y` when each coordinate
  of `y` equals that of `x` with probability `(1 + ρ)/2`, independently (O'Donnell, Definitions
  2.40 and 2.46).

**Checks.**
- For `n = 1` and `ρ = 1/2` the kernel matrix has rows `(3/4, 1/4)` and `(1/4, 3/4)`.
- For `n = 1` and `ρ = 2` it has rows `(3/2, −1/2)` and `(−1/2, 3/2)`: the rows still sum to `1`
  and the formulas of 3.2 still hold, but the kernel is not a probability.
- For `n = 0` the product is empty and `noise ρ f = f` for every `ρ`.

*Needs:* Mathlib `ZMod.val`.

### 3.2 Action on the expansion

- (`walshCoeff_noise`) `walshCoeff (noise ρ f) S = ρ ^ S.card * walshCoeff f S` for every real
  `ρ` (O'Donnell, Proposition 2.47). Here `0 ^ 0 = 1`.
- `noise ρ (noise σ f) = noise (ρ * σ) f` (O'Donnell, Exercise 2.32); `noise 1 f = f`;
  `noise 0 f` is the constant `𝔼 x, f x`; `noise (-1) f x = f (x + 𝟙)`.
- `𝔼 x, g x * noise ρ f x = 𝔼 x, f x * noise ρ g x`.
- *Contraction.* For `|ρ| ≤ 1` and `p ≥ 1`, `‖noise ρ f‖_p ≤ ‖f‖_p` (O'Donnell, Exercise 2.33).

Route for the first bullet: by linearity it is enough to take `f = walsh S`; the sum over `y`
factors over the coordinates, each `i ∈ S` contributing `ρ (-1) ^ (x i).val` and each other
coordinate `1`.

**Checks.**
- `noise ρ (walsh {i}) = ρ • walsh {i}`, and `noise ρ` fixes the constants.
- `noise 2 (walsh {i}) = 2 • walsh {i}`, so the contraction fails for `ρ = 2`.

*Needs:* 1.1, 1.2, 1.3, 3.1; Mathlib `Fintype.prod_sum`, `Real.rpow_arith_mean_le_arith_mean_rpow`
(Jensen's inequality, for the contraction).

### 3.3 Noise stability

Define `noiseStability ρ f = 𝔼 x, f x * noise ρ f x`.

- (`noiseStability_eq_sum`) `noiseStability ρ f = ∑ S, ρ ^ S.card * f̂(S)²` for every real `ρ`
  (O'Donnell, Theorem 2.49).
- As a function of `ρ` it is a polynomial; its derivative at `ρ = 1` is `totalInfluence f`, and
  its derivative at `ρ = 0` is the sum of `f̂({i})²` over the coordinates (O'Donnell,
  Proposition 2.51).
- `noiseStability ρ f = ‖noise σ f‖_2 ^ 2` whenever `σ ^ 2 = ρ`.

**Checks.**
- `walsh {i}` has stability `ρ`; the parity has stability `ρ ^ n`; a constant `c` has `c²`.
- Majority on `Fin 3`: `(3/4) ρ + (1/4) ρ³`, which is `13/32` at `ρ = 1/2` and `−7/27` at
  `ρ = −1/3`.
- The function on `Fin 2` with a single value `−1`: `1/4 + ρ/2 + ρ²/4`, which is `9/16` at
  `ρ = 1/2`.

*Needs:* 1.3, 2.2, 3.2.

### 3.4 Coordinate functions maximize stability

(`noiseStability_le_of_expect_eq_zero`) Let `0 < ρ < 1` and let `f` be sign-valued with
`𝔼 x, f x = 0`. Then `noiseStability ρ f ≤ ρ`, with equality if and only if `f = walsh {i}` or
`f = -walsh {i}` for some `i` (O'Donnell, Proposition 2.50).

Route: by 3.3 and `f̂(∅) = 0`, the stability is at most `ρ ∑ S, f̂(S)² = ρ`, with equality only
if all the weight is on singletons; then 1.5 applies.

**Checks.**
- Majority on `Fin 3` at `ρ = 1/2`: `13/32 < 1/2`.
- For `ρ < 0` the bound fails: `walsh {0, 1}` has mean zero and stability `ρ² > ρ`.
- Without mean zero it fails: a constant sign has stability `1`.

*Needs:* 1.3, 1.5, 3.3.

### Examples

The kernel for `n = 1`; the coordinate functions, the parity and majority on three coordinates.

### Dependencies

Layer 1 (1.1, 1.2, 1.3, 1.5) and 2.2 for the derivative in 3.3. Mathlib: products of sums over
finite types, Jensen's inequality for powers.

## Layer 4: hypercontractivity

### 4.1 The two-point inequality

For real `a`, `b`, `ρ` and `1 ≤ p ≤ q` with `1 < q` and `ρ ^ 2 * (q - 1) ≤ p - 1`:

    ((|a + ρ b|^q + |a − ρ b|^q) / 2)^(1/q) ≤ ((|a + b|^p + |a − b|^p) / 2)^(1/p).

(O'Donnell, §10.1, the Two-Point Inequality; Theorems 9.17 and 9.18 for `p = 2` and for `q = 2`.
The inequality is due to Bonami. The sign of `ρ` plays no role because the left side is even in
`ρ`.) This is the statement of 4.2 for `n = 1` and `f = a + b • walsh {i}`.

Route: the case `p = q` is the contraction of 3.2 on the cube of dimension one. The cases with
`2 ≤ p < q` are dual to those with `1 < p < q ≤ 2`, by Hölder's inequality and the symmetry of
the kernel, and a pair `p < 2 < q` is reached through the exponent `2` by the semigroup law of
3.2. So the work is in `1 ≤ p < q ≤ 2`, where one may take `ρ² = (p − 1)/(q − 1)`, `a = 1` and
`|b| < 1`: both sides are then sums of binomial series in `b` with nonnegative even terms, the
power `p/q` of the left side is bounded with `(1 + t)^θ ≤ 1 + θ t` for `0 ≤ θ ≤ 1`, and the two
series are compared coefficient by coefficient.

**Checks.**
- `p = 2`, `q = 4`, `ρ² = 1/3`, `a = 1`: the fourth powers are `1 + 2b² + b⁴/9` and `(1 + b²)²`.
- `p = 2`, `q = 4`, `ρ² = 1/2`, `a = 1`, `b = 1/10`: `1.030025 > 1.0201`, so the bound on `ρ`
  cannot be relaxed.
- With `q = 1` allowed the hypothesis on `ρ` would read `0 ≤ 0`; at `p = q = 1`, `ρ = 2`, `a = 0`,
  `b = 1` the inequality would say `2 ≤ 1`. This is why `1 < q` is assumed; the case `p = q = 1`
  with `|ρ| ≤ 1` is the contraction of 3.2.
- `p = 1 < q` forces `ρ = 0`, and the inequality reads `|a| ≤ (|a + b| + |a − b|)/2`.

*Needs:* 3.2 for `n = 1`; Mathlib `Real.one_add_rpow_hasFPowerSeriesOnBall_zero`,
`rpow_one_add_le_one_add_mul_self`, `Real.inner_le_Lp_mul_Lq`.

### 4.2 The hypercontractive inequality

(`cubeNorm_noise_le`) For `1 ≤ p ≤ q` with `1 < q`, a real `ρ` with `ρ ^ 2 * (q - 1) ≤ p - 1`
and every `f`: `cubeNorm q (noise ρ f) ≤ cubeNorm p f` (O'Donnell, §10.1, the Hypercontractivity
Theorem, for `0 ≤ ρ`; de Wolf, Theorem 4.1; Garban and Steif, Theorem V.2 for `q = 2`).

- *Two-function form.* For `r, s ≥ 0` with `r s ≤ 1` and `0 ≤ ρ` with `ρ² ≤ r s`:
  `𝔼 x, f x * noise ρ g x ≤ ‖f‖_(1+r) * ‖g‖_(1+s)` (O'Donnell, §10.1, the Two-Function
  Hypercontractivity Theorem).

Route: 4.1 is the case `n = 1`. By Hölder's inequality the inequality for all `f` is equivalent
to its two-function form, and the two-function form passes from dimensions `m` and `1` to
`m + 1` by conditioning on one coordinate and applying the one-dimensional case to the
conditional norms (O'Donnell, §9.4, the Two-Function Hypercontractivity Induction Theorem, and
Proposition 10.4). For `ρ < 0` use `noise ρ f x = noise (-ρ) f (x + 𝟙)` from 3.2.

**Checks.**
- `n = 0`: both sides are `|f|`.
- `f = walsh S`: the left side is `|ρ| ^ S.card` and the right side is `1`.
- `f = 1 + b • walsh {i}` reproduces 4.1 with `a = 1`, including its failure when `ρ² = 1/2`,
  `p = 2`, `q = 4`.

*Needs:* 1.3, 3.1, 3.2, 4.1; Mathlib `Real.inner_le_Lp_mul_Lq`, `Real.Lp_add_le`,
`Fintype.expect_equiv`.

### 4.3 Moments of functions of bounded degree

Let `f` have degree at most `k`.

- (`cubeNorm_le_of_degree_le`) For `q ≥ 2`: `‖f‖_q ≤ (q − 1)^(k/2) ‖f‖_2` (O'Donnell, Theorem
  9.21; for `q = 4` this is `𝔼 x, f x ^ 4 ≤ 9 ^ k * (𝔼 x, f x ^ 2) ^ 2`, the Bonami Lemma of
  §9.1).
- (`cubeNorm_two_le_of_degree_le`) For `1 ≤ p ≤ 2`: `‖f‖_2 ≤ exp((2/p − 1) k) ‖f‖_p`; for `p = 1`
  the factor is `e^k` (O'Donnell, Theorem 9.22).

Route. First bullet: with `σ² = 1/(q − 1)`, `f = noise σ g` for the function `g` with
coefficients `(q − 1)^(|S|/2) f̂(S)`; apply 4.2 with `p = 2` and bound `‖g‖_2` by 1.3. Second
bullet: for `ε > 0`, Hölder's inequality between the exponents `p` and `2 + ε` and the first
bullet give `‖f‖_2 ≤ (1 + ε)^((2 − p)(2 + ε) k / (2 ε p)) ‖f‖_p`; let `ε → 0`.

**Checks.**
- `f = walsh {0} + walsh {1}` on `Fin 2`, `k = 1`, `q = 4`: `‖f‖_4 / ‖f‖_2 = 2^(1/4) = 1.189`,
  below `√3`.
- The indicator of one point of the `n`-cube has degree `n` and `‖f‖_2 / ‖f‖_1 = 2^(n/2)`, below
  `e^n`; so the factor in the second bullet must grow exponentially in `k`.
- `k = 0`: `f` is constant and both bullets are equalities.

*Needs:* 1.2, 1.3, 3.2, 4.2; Mathlib `Real.inner_le_Lp_mul_Lq`, `Real.add_one_le_exp`.

### 4.4 Small sets are noise sensitive

(`noiseStability_le_rpow`) Let `0 ≤ ρ ≤ 1` and let `f` have values in `{−1, 0, 1}`. Then
`noiseStability ρ f ≤ (𝔼 x, |f x|) ^ (2 / (1 + ρ))` (de Wolf, Corollary 4.2; O'Donnell, §9.5,
the Small-Set Expansion Theorem, for values in `{0, 1}`).

Route: by 3.3 the left side is `‖noise σ f‖_2 ^ 2` with `σ² = ρ`; apply 4.2 with exponents
`1 + ρ` and `2`, and note `|f| ^ (1 + ρ) = |f|`.

**Checks.**
- The indicator of a subcube of codimension `k`, `α = 2^(−k)`: the stability is
  `α ((1 + ρ)/2)^k`, equal to the bound `α^(2/(1+ρ))` at `ρ = 0` and at `ρ = 1`; at `ρ = 1/3`,
  `k = 1` it is `1/3` against `0.3536`.
- The hypothesis on the values is needed: for `2f` the left side is multiplied by `4` and the
  right side by `2^(2/(1+ρ)) < 4` when `ρ > 0`, so the indicator of the whole cube times `2`
  violates the inequality at `ρ = 1`.

*Needs:* 3.2, 3.3, 4.2.

### 4.5 The level inequalities

(`sum_sq_walshCoeff_le_of_card_le`) Let `f` have values in `{0, 1}` and mean `α = 𝔼 x, f x`,
and let `k ≥ 1` be a natural number with `k ≤ 2 ln(1/α)`. Then the sum of `f̂(S)²` over the sets
with `S.card ≤ k` is at most `(2 e ln(1/α) / k)^k α²` (O'Donnell, §9.5, Level-k Inequalities).

Route: for `0 < ρ ≤ 1` the sum is at most `ρ^(−k)` times the stability at `ρ`, hence at most
`ρ^(−k) α^(2/(1+ρ)) ≤ ρ^(−k) α^(2 − 2ρ)` by 4.4; take `ρ = k / (2 ln(1/α))`.

**Checks.**
- The indicator of a point of the `2`-cube: `α = 1/4`, `2 ln 4 = 2.77`, so `k ∈ {1, 2}`; for
  `k = 1` the sum is `3/16 = 0.1875` and the bound is `2 e ln 4 / 16 = 0.471`.
- For `f = 0` and for `f = 1` the hypothesis `1 ≤ k ≤ 2 ln(1/α)` has no solution (with
  `Real.log 0 = 0` in the first case), so nothing is claimed.

*Needs:* 3.3, 4.4.

### Examples

One coordinate (4.1); characters, for which 4.2 is far from sharp; indicators of subcubes and of
points.

### Dependencies

Layer 1 (1.2, 1.3) and Layer 3 (3.1, 3.2, 3.3). Mathlib: Hölder's and Minkowski's inequalities
for finite sums, the binomial series of `(1 + x)^a`, Bernoulli's inequality for exponents in
`[0, 1]`.

## Layer 5: coordinates of large influence

### 5.1 Damped weight above a coordinate

(`sum_pow_mul_sq_walshCoeff_le_influence_rpow`) Let `f` be sign-valued, `0 ≤ ρ ≤ 1` and
`i : ι`. Then the sum of `ρ ^ (S.card - 1) * f̂(S)²` over the sets `S` containing `i` is at most
`influence i f ^ (2 / (1 + ρ))` (O'Donnell, Corollary 9.25, and Corollary 9.12 for `ρ = 1/3`).

Route: `g = walsh {i} * L_i f` has values in `{−1, 0, 1}`, `𝔼 x, |g x| = influence i f`, and
its coefficient at `S` is `f̂(S ∪ {i})` when `i ∉ S` and `0` otherwise; apply 4.4 to `g`.

**Checks.**
- `f = walsh {i}`: both sides are `1`. `f` constant: both sides are `0`.
- `ρ = 0`: the left side is `f̂({i})²` (with `0 ^ 0 = 1`) and the right side is
  `influence i f ^ 2`; for majority on `Fin 3` these are both `1/4`.
- `ρ = 1`: both sides are `influence i f`, by 2.2.

*Needs:* 1.1, 2.1, 2.2, 3.3, 4.4.

### 5.2 The theorem of Kahn, Kalai and Linial: edge-isoperimetric form

(`exists_le_influence_of_totalInfluence`) Let `f` be sign-valued with `variance f ≠ 0`, and put
`r = totalInfluence f / variance f`. Then some coordinate `i` has
`influence i f ≥ (9 / r²) · 9^(−r)` (O'Donnell, §9.6, the KKL Edge-Isoperimetric Theorem, proved
there for mean zero, with Exercise 9.29 for the general case; the general case is proved here).

Route: let `M` be the largest influence. Summing 5.1 at `ρ = 1/3` over `i` and using
`influence i f ^ (3/2) ≤ M^(1/2) influence i f` gives
`∑ S, S.card * 3^(1 − S.card) * f̂(S)² ≤ M^(1/2) I[f]`. The left side is at least
`3 ∑ 3^(−S.card) f̂(S)²` over the nonempty `S`, and by convexity of `s ↦ 3^(−s)`, with weights
`f̂(S)² / variance f` on the nonempty sets, this is at least `3 variance f · 3^(−r)`. Squaring
gives the claim.

**Checks.**
- `f = walsh {i}`: `r = 1` and the bound is `9 · (1/9) = 1`, attained.
- Majority on `Fin 3`: `r = 3/2`, bound `4/27 = 0.148`, largest influence `1/2`.
- The hypothesis on the values is needed: `f = n^(−1/2) ∑ i, walsh {i}` has variance `1`, `r = 1`
  and all influences `1/n`, below the bound `1` for `n ≥ 2`.
- For `n = 0` every function is constant, so the hypothesis `variance f ≠ 0` cannot hold.

*Needs:* 1.3, 2.2, 5.1; Mathlib `ConvexOn.map_sum_le`, `convexOn_exp`.

### 5.3 The theorem of Kahn, Kalai and Linial

(`exists_log_div_le_influence`) Let `ι` be nonempty and `f` sign-valued. Then some coordinate
`i` has `influence i f ≥ (1/5) · variance f · ln n / n` (O'Donnell, §9.6, the KKL Theorem, with
an unspecified constant; Garban and Steif, Theorem I.2, for values in `{0, 1}` and also with an
unspecified constant; the constant `1/5` is proved here and is not the best possible).

Route: assume `variance f ≠ 0`, and let `r` be as in 5.2, so `r ≥ 1` by 2.3. If
`r ≥ (ln n)/5`, the mean of the influences is `r · variance f / n ≥ variance f · ln n / (5n)`.
Otherwise `ln n > 5`, and since `r ↦ (9/r²) 9^(−r)` is decreasing, 5.2 gives a coordinate of
influence at least `(225 / (ln n)²) · n^(−(ln 9)/5)`; this is at least `ln n / (5n)`, hence at
least `variance f · ln n / (5n)` because `variance f ≤ 1`, by the inequality
`(ln n)³ ≤ 1125 · n^c` with `c = 1 − (ln 9)/5`. The last inequality follows from `e^u ≥ 1 + u`:
`ln 9 = 4 ln √3 ≤ 4 (√3 − 1) < 3` gives `c ≥ 2/5`, and `(c t/3)³ ≤ e^(c t)` at `t = ln n` gives
`(ln n)³ ≤ (3/c)³ n^c ≤ 422 · n^c`.

**Checks.**
- `n = 1`: `ln 1 = 0` and the claim is `influence i f ≥ 0`.
- The function on `Fin 2` with a single value `−1`: `(1/5)(3/4)(ln 2)/2 = 0.052`, largest
  influence `1/2`.
- The hypothesis on the values is needed: `f = n^(−1/2) ∑ i, walsh {i}` with `n = 200` has
  variance `1` and all influences `0.005`, below `(ln 200)/1000 = 0.0053`.
- Split `7100` coordinates into `710` blocks of `10`, and let `f = −1` exactly when some block
  has all its entries equal to `1` (a tribes function). Each influence is
  `2^(−9) (1 − 2^(−10))^709 = 0.000977` and the bound is `0.000250`, a ratio below `4`: such
  functions have all influences of the order `ln n / n` (O'Donnell, §9.6).
- `ι` empty: there is no coordinate, which is why `[Nonempty ι]` is assumed.

*Needs:* 2.3, 5.2; Mathlib `Real.add_one_le_exp`.

### 5.4 The junta theorem

Define `influentialSet ε k f = {i | ε ^ 2 ≤ 9 ^ k * totalInfluence f ^ 2 * influence i f}`, the
coordinates of influence at least `ε² / (9^k I[f]²)`, written without division so that a constant
`f` has no influential coordinate. Let `f` be sign-valued, `ε > 0`, `k` a natural number and
`J = influentialSet ε k f`.

- (`sum_sq_walshCoeff_le_of_not_subset_influentialSet`) `J.card * ε ^ 2 ≤ 9 ^ k * I[f] ^ 3`, and
  the sum of `f̂(S)²` over the sets with `S.card ≤ k` that are not contained in `J` is at most
  `ε` (O'Donnell, Theorem 9.28, first part).
- (`exists_junta_dens_ne_le`) If moreover `I[f] ≤ ε k`, there is a sign-valued `h` with
  `h x = h y` whenever `x` and `y` agree on `J`, such that the density of `{x | f x ≠ h x}` is at
  most `2 ε` (O'Donnell, §9.6, Friedgut's Junta Theorem, which has `ε` in place of `2 ε` through
  an additional argument; the constant `2 ε` is proved here).

Route. The cardinality bound is `∑ i ∈ J, ε² ≤ 9^k I[f]² ∑ i, influence i f`. For the weight:
summing 5.1 at `ρ = 1/3` over `i ∉ J`, where `9^k I[f]² influence i f < ε²` and hence
`influence i f ^ (3/2) ≤ 3^(−k) ε influence i f / I[f]` (all influences vanish if `I[f] = 0`),
gives
`∑ S, |S \ J| · 3^(1 − S.card) · f̂(S)² ≤ 3^(−k) ε`, and each `S` with `S.card ≤ k` and `S ⊄ J`
has `|S \ J| · 3^(1 − S.card) ≥ 3^(−k)`. For the second bullet let `g` be the sum of
`f̂(S) • walsh S` over `S ⊆ J` with `S.card ≤ k`, and `h x = 1` if `g x ≥ 0` and `−1` otherwise;
`h` depends only on the coordinates in `J`, `|f x − g x| ≥ 1` where `f x ≠ h x`, and
`𝔼 x, (f x − g x)² ≤ ε + I[f]/(k + 1) ≤ 2 ε` by 1.3 and 2.2.

**Checks.**
- `f = walsh {i}`, `ε = 1`, `k = 1`: `I[f] = 1`, `J = {i}`, `1 ≤ 9`, the excluded weight is `0`,
  and `h = f`.
- `f` constant: `I[f] = 0`, `J = ∅`, and every nonempty `S` has `f̂(S) = 0`. With the threshold
  written as a quotient, division by zero would put every coordinate in `J` and the cardinality
  bound `n ε² ≤ 0` would fail.
- Parity on `n` coordinates with `ε = 1` and `k ≥ n`: `I[f] = n`, `J` is everything, and the
  cardinality bound reads `n ≤ 9^k n³`.

*Needs:* 1.2, 1.3, 2.2, 5.1.

### Examples

Coordinate functions (equality in 5.2); majority on three coordinates; the tribes functions,
which show that 5.3 has the right order; the parity, whose influences are all `1`.

### Dependencies

Layer 1 (1.1, 1.2, 1.3), Layer 2 (2.1, 2.2, 2.3), 3.3 and 4.4. Mathlib: Jensen's inequality for
the exponential and the bound `x + 1 ≤ exp x`.

## Layer 6: linearity testing and Arrow's theorem

### 6.1 The linearity test

- (`expect_mul_mul_add_eq_sum`) For all real `f`, `g`, `h`:
  `𝔼 x, 𝔼 y, f x * g y * h (x + y) = ∑ S, f̂(S) * ĝ(S) * ĥ(S)`.
- For a sign-valued `f`, the density of the pairs `(x, y)` with `f x * f y = f (x + y)` is
  `1/2 + (1/2) ∑ S, f̂(S)³` (O'Donnell, proof of Theorem 1.30, equation (1.10)).
- (`exists_walsh_dens_ne_le`) For a sign-valued `f` there is `S` such that the density of
  `{x | f x ≠ walsh S x}` is at most the density of the pairs `(x, y)` with
  `f x * f y ≠ f (x + y)` (O'Donnell, Theorem 1.30; the test is due to Blum, Luby and Rubinfeld).

Route: the first bullet is 1.3 applied to `h` and the convolution of `f` and `g`, with 1.4. For
the third, `∑ S, f̂(S)³ ≤ (max f̂) ∑ S, f̂(S)² = max f̂`, and the density of `{f ≠ walsh S}` is
`(1 − f̂(S))/2`.

**Checks.**
- `f = walsh S` satisfies `f x * f y = f (x + y)` for all pairs, and the sum of cubes is `1`.
- `f = -walsh S` fails it for all pairs; the sum of cubes is `−1`; `f` differs from every
  `walsh T` with `T ≠ S` on half of the cube (for `n ≥ 1`), and `1/2 ≤ 1`.
- The function on `Fin 2` with a single value `−1`: the sum of cubes is `1/4`, the test fails on
  `3/8` of the pairs, and the function differs from `walsh ∅` on `1/4` of the cube.

*Needs:* 1.1, 1.2, 1.3, 1.4; Mathlib `Finset.dens`.

### 6.2 Kalai's formula

Define `naeProfiles ι`, the set of triples `(x, y, z)` of points of the cube such that for no `i`
the entries `x i`, `y i`, `z i` are all equal. A voter who ranks candidates `a`, `b`, `c`
contributes the three signs "`a` above `b`", "`b` above `c`", "`c` above `a`", which are never all
equal; so the triples are the profiles of `n` rankings.

- `naeProfiles ι` has `6 ^ n` elements.
- (`card_filter_naeProfiles_div`) For a sign-valued `f`, the number of profiles `(x, y, z)` for
  which `f x`, `f y`, `f z` are not all equal, divided by the number of profiles, is
  `3/4 - 3/4 * noiseStability (-1/3) f` (O'Donnell, Theorem 2.56; the formula is Kalai's).
- This fraction is at most `7/9 + (2/9) ∑ i, f̂({i})²` (O'Donnell, Corollary 2.59).

Route: for signs `u, v, w`, the indicator that they are not all equal is
`3/4 − (uv + vw + wu)/4`. For fixed `x`, `y` the number of `z` completing a profile is `2` to
the number of coordinates where `x` and `y` differ, which is `6 ^ n / 2 ^ n` times the kernel of
3.1 at `ρ = −1/3`; so the mean of `f x * f y` over the profiles is the stability at `−1/3`, and
the same holds for the other two pairs.

**Checks.**
- Majority on `Fin 3`: the stability at `−1/3` is `−7/27` and the fraction is `17/18`.
- `f = walsh {i}`: stability `−1/3`, fraction `1`. `f` constant: stability `1`, fraction `0`.
- `n = 0`: one profile, the three values are equal, and both sides are `0`.

*Needs:* 3.1, 3.3; Mathlib `Fintype.prod_sum`.

### 6.3 Arrow's theorem

(`exists_eq_walsh_singleton_of_forall_naeProfiles`) Let `f` be sign-valued and suppose that on
every profile of `naeProfiles ι` the values `f x`, `f y`, `f z` are not all equal. Then
`f = walsh {i}` or `f = -walsh {i}` for some `i`. If moreover `f 0 = 1`, then `f = walsh {i}`
(O'Donnell, §2.5, Arrow's Theorem and its proof from Theorem 2.56). This is Arrow's theorem for
three candidates when one rule decides all three pairwise contests; the form with three
different rules is not stated.

Route: by 6.2 the stability at `−1/3` is `−1/3`, so by 3.3 the sum of
`((−1/3) ^ S.card + 1/3) f̂(S)²` vanishes; every term is nonnegative and the factor vanishes only
for singletons, so `f` has all its weight on singletons, and 1.5 applies.

**Checks.**
- Exactly the `2n` functions `± walsh {i}` satisfy the hypothesis among the sign-valued functions
  on the cubes of dimension `1` to `4`.
- Majority on `Fin 3` violates the hypothesis on `1/18` of the profiles, for instance on the
  profile of the three cyclic rankings.
- The hypothesis on the values is needed: for `n = 1`, `f 0 = 0` and `f 1 = 5` never takes three
  equal values on a profile.
- For `n = 0` the single profile has three equal points, so the hypothesis fails and there is no
  coordinate.

*Needs:* 1.3, 1.5, 3.3, 6.2.

### Examples

Characters and their negatives for the linearity test; majority on three coordinates and the
coordinate functions for Kalai's formula.

### Dependencies

Layer 1 (1.1 to 1.5) and Layer 3 (3.1, 3.3). Mathlib: `Finset.dens` and products of sums over
finite types.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the Walsh characters of
`ι → ZMod 2` and their classification, coefficients, Plancherel's identity and convolution on
the cube, influences and total influence with their spectral formulas, the Poincaré inequality
with its equality case, the edge-isoperimetric inequality in the form of 2.4, the noise
operator and noise stability, the two-point and hypercontractive inequalities on the cube, the
moment, small-set and level inequalities, the two forms of the theorem of Kahn, Kalai and
Linial, the junta theorem, the identity and soundness of the linearity test, Kalai's formula and
Arrow's theorem in the form of 6.3.

Already in the libraries and therefore not targets:

- Additive characters of finite abelian groups in Mathlib: their orthogonality for the
  normalized inner product (`AddChar.wInner_cWeight_eq_boole`), their linear independence
  (`AddChar.linearIndependent`), the bound on their number (`AddChar.card_addChar_le`) and the
  basis of complex characters (`AddChar.complexBasis`). Section 1.1 above identifies the real
  characters of the cube and then uses the first of these.
- The discrete Fourier transform on `ZMod N` (`ZMod.dft`), which concerns cyclic groups and
  complex values and is not used.
- Tau Ceti has the sign of a bit with values in the units of `ℤ`, the map `TauCeti.hilbertSign`
  from `ZMod 2` to `ℤˣ` (`TauCeti/Data/ZMod/IntUnitsPower.lean`), with `TauCeti.hilbertSign_sum`:
  the sign of a finite sum is the product of the signs. In these terms `walsh S x` is the real
  number `hilbertSign (∑ i ∈ S, x i)`; the definition of 1.1 is written directly with real values, as
  the averages of 1.2 need, and does not use it. Tau Ceti's `TauCeti.zmodPairing`
  (`TauCeti/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`) writes the circle-valued
  characters of `ZMod n` multiplicatively and is not needed for the real characters used here.
  Tau Ceti has no declaration about real functions on the cube `ι → ZMod 2`: no expansion in
  characters of the cube, no influence and no noise operator. Nothing is consumed from Tau Ceti.

Left to other roadmaps:

- RandomMatrices 2.1 states the Efron–Stein inequality for independent coordinates with
  arbitrary laws, and RandomMatrices 2.2 the Poincaré and logarithmic Sobolev inequalities for
  measures on Euclidean spaces. The inequality of 2.3 above is the case of the uniform measure
  on the cube; it is kept because it comes with the equality case and the bound with the factor
  `k`, which are spectral statements. No logarithmic Sobolev inequality on the cube is stated.
- BanachSpaceTheory B4.0 builds Walsh functions on `(ZMod 2)^(Fin (2n))` with their layers of
  degrees `n − 1` and `n + 1`, as Enflo's construction needs them; those functions are the
  characters `walsh S` of 1.1 for `ι = Fin (2n)`, and nothing of that construction is repeated.
  BanachSpaceTheory B6 owns type, cotype and Kahane's inequality. The case `k = 1` of 4.3 is a
  scalar inequality of Khintchine type with the explicit factors `(q − 1)^(1/2)` and `e`; no
  vector-valued statement is made here.
- GaussianIsoperimetryAndClusters owns the Gaussian isoperimetric theorem and, in its Layer 8,
  Bobkov's inequality. Gaussian hypercontractivity, the invariance principle and the theorem that
  majority is stablest are outside this roadmap.

Outside the scope: functions on products of general finite probability spaces and biased
measures; the theorems of Friedgut, Kalai and Naor and of Bourgain on functions with weight on
low levels; sharp thresholds; decision trees, learning, circuit classes and pseudorandomness;
the quantitative form of Arrow's theorem and its form with three rules; the sharp constants in
the theorem of Kahn, Kalai and Linial; reverse hypercontractivity; Harper's exact solution of
the edge-isoperimetric problem for sets of every size; algorithms and query complexity as such.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Algebra/BigOperators/Expect.lean`: `Finset.expect` (notation `𝔼 i ∈ s, f i` and
  `𝔼 i, f i`: the sum divided by the number of terms, for values in a module over `ℚ≥0`);
  `Fintype.expect_eq_sum_div_card` (in a semifield of characteristic zero,
  `𝔼 i, f i = (∑ i, f i) / Fintype.card ι`); `Finset.expect_comm` (two averages commute);
  `Fintype.expect_equiv` (an average is unchanged by an equivalence of the index type).
- `Mathlib/Algebra/Group/AddChar.lean`: `AddChar A M` for an additive monoid `A` and a monoid
  `M`, with `AddChar.map_zero_eq_one` (`ψ 0 = 1`) and `AddChar.map_add_eq_mul`
  (`ψ (x + y) = ψ x * ψ y`).
- `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean`: `AddChar.wInner_cWeight_eq_boole`
  (for `[AddCommGroup G] [Fintype G] [RCLike R]` and `ψ₁ ψ₂ : AddChar G R`, the normalized inner
  product of `ψ₁` and `ψ₂` is `1` if `ψ₁ = ψ₂` and `0` otherwise).
  `Mathlib/Analysis/RCLike/Inner.lean`: `RCLike.wInner_cWeight_eq_expect` (that inner product of
  `f` and `g` is `𝔼 i, inner 𝕜 (f i) (g i)`).
- `Mathlib/Data/ZMod/Basic.lean`: `ZMod.val : ZMod n → ℕ`. `Mathlib/Data/ZMod/Defs.lean`:
  `ZMod.card` (`Fintype.card (ZMod n) = n`). `Mathlib/Data/Fintype/BigOperators.lean`:
  `Fintype.card_fun` (`Fintype.card (α → β) = Fintype.card β ^ Fintype.card α`).
  `Mathlib/Algebra/Notation/Pi/Basic.lean`: `Pi.single i a`, the function with value `a` at `i`
  and `0` elsewhere, for `[DecidableEq ι]`.
- `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Finset.prod_add`
  (`∏ i ∈ s, (f i + g i) = ∑ t ∈ s.powerset, (∏ i ∈ t, f i) * ∏ i ∈ s \ t, g i`) and
  `Fintype.prod_sum` (`∏ i, ∑ j, f i j = ∑ x, ∏ i, f i (x i)`).
  `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean`: `Finset.sum_comm`.
- `Mathlib/Data/Finset/Density.lean`: `Finset.dens s : ℚ≥0`, the number of elements of `s`
  divided by `Fintype.card α`.
- `Mathlib/Analysis/MeanInequalities.lean`: `Real.inner_le_Lp_mul_Lq` (Hölder: for
  `p.HolderConjugate q`,
  `∑ i ∈ s, f i * g i ≤ (∑ i ∈ s, |f i| ^ p) ^ (1 / p) * (∑ i ∈ s, |g i| ^ q) ^ (1 / q)`) and
  `Real.Lp_add_le` (Minkowski, for `1 ≤ p`).
  `Mathlib/Analysis/MeanInequalitiesPow.lean`: `Real.rpow_arith_mean_le_arith_mean_rpow` (for
  nonnegative weights `w` summing to `1`, nonnegative `z` and `1 ≤ p`:
  `(∑ i ∈ s, w i * z i) ^ p ≤ ∑ i ∈ s, w i * z i ^ p`).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConvexOn.map_sum_le` (Jensen's inequality for finite
  convex combinations). `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `convexOn_exp`
  (`Real.exp` is convex on the whole line) and `rpow_one_add_le_one_add_mul_self` (for `-1 ≤ s`
  and `0 ≤ p ≤ 1`, `(1 + s) ^ p ≤ 1 + p * s`).
- `Mathlib/Analysis/Analytic/Binomial.lean`: `Real.one_add_rpow_hasFPowerSeriesOnBall_zero`
  (`x ↦ (1 + x) ^ a` is the sum of the binomial series on the ball of radius `1` about `0`).
- `Mathlib/Analysis/SpecialFunctions/Log/Base.lean`: `Real.logb`.
  `Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`: `Real.binEntropy`
  (`p * log p⁻¹ + (1 - p) * log (1 - p)⁻¹`), `Real.strictConcave_binEntropy` (strictly concave on
  `[0, 1]`), `Real.binEntropy_zero` and `Real.binEntropy_two_inv` (the values `0` at `0` and
  `log 2` at `1/2`).
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.add_one_le_exp` (`x + 1 ≤ Real.exp x`).

## References

- Ryan O'Donnell, *Analysis of Boolean Functions*, Cambridge University Press, 2014; the arXiv
  edition `arXiv:2105.10386v1` (May 2021), whose numbering is the one cited: Chapters 1, 2, 9
  and §10.1.
- Ronald de Wolf, *A Brief Introduction to Fourier Analysis on the Boolean Cube*, Theory of
  Computing Library, Graduate Surveys 1 (2008), 1–20; open access at `theoryofcomputing.org`.
  Sections 2.2, 2.3 and 4.1.
- Christophe Garban and Jeffrey E. Steif, *Noise sensitivity of Boolean functions and
  percolation*, `arXiv:1102.5761v3` (2012). Chapter I, Theorems I.1 and I.2, and Chapter V,
  Theorem V.2.
- The following are named for attribution and were not consulted: A. Bonami, *Étude des
  coefficients de Fourier des fonctions de `L^p(G)`*, Annales de l'Institut Fourier 20 (1970);
  J. Kahn, G. Kalai and N. Linial, *The influence of variables on Boolean functions*, FOCS 1988;
  E. Friedgut, *Boolean functions with low average sensitivity depend on few coordinates*,
  Combinatorica 18 (1998); M. Blum, M. Luby and R. Rubinfeld, *Self-testing/correcting with
  applications to numerical problems*, J. Comput. System Sci. 47 (1993); G. Kalai, *A
  Fourier-theoretic perspective on the Condorcet paradox and Arrow's theorem*, Adv. in Appl.
  Math. 29 (2002); L. H. Harper, *Optimal assignments of numbers to vertices*, J. Soc. Indust.
  Appl. Math. 12 (1964).

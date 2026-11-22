# Roadmap: combinatorial discrepancy

**Summary.** Colour the points of a finite set with two colours, `+1` and `−1`, so that every set
of a given finite family is split as evenly as possible. The discrepancy of the family is the
least, over all colourings, of the largest imbalance `|∑_{v ∈ S} x(v)|` of a set `S` of the
family. More generally, the discrepancy of a real matrix is the least sup-norm of `A x` over
sign vectors `x`; a family of sets is the case of its 0/1 incidence matrix. This roadmap proves
classical upper and lower bounds of the subject, for finite families and finite real
matrices, with explicit constants.

The main results are these.

- *Random colourings.* If a real matrix has `m` rows, each of squared Euclidean norm at most
  `s`, its discrepancy is at most `√(2 s log 2m)`. For `m` sets on `n` points the bound reads
  `√(2 n log 2m)`.
- *Beck and Fiala.* If every point lies in at most `t ≥ 1` sets of the family, the discrepancy
  is at most `2t − 1`, however many points and sets there are.
- *Lovász, Spencer and Vesztergombi.* Hereditary discrepancy is the largest discrepancy of the
  matrix restricted to a set of columns; linear discrepancy measures how well a vector of
  weights in `[−1, 1]` can be rounded to a sign vector. Linear discrepancy is at most twice
  hereditary discrepancy, and for every `k ≥ 1` and every `k × k` submatrix `B`, the hereditary
  discrepancy is at least `|det B|^(1/k) / 2`.
- *Roth.* For every `n ≥ 1`, every two-colouring of `{0, …, n − 1}` has an arithmetic
  progression in that range whose imbalance is at least `n^(1/4) / 8`.

The roadmap rests on Mathlib throughout: on its Hoeffding inequality for sums of independent
sub-Gaussian variables for the random bound, on Lebesgue measure, the change of variables by a
linear map and fundamental domains of lattices for the determinant bound, and on Dirichlet's
approximation theorem and Parseval's identity for trigonometric polynomials for Roth's theorem.
The star discrepancy of finite samples in the unit interval, treated in
ProbabilisticAndMetricNumberTheory, and the excess of one probability law over another in
FiniteSamplingDiscrepancy are different notions.

Layer 1 defines the discrepancy of a real matrix and proves the random colouring bound. Layer 2
defines the discrepancy of a family of sets and proves the Beck–Fiala theorem. Layer 3 defines
hereditary and linear discrepancy and proves the rounding theorem, the volume bound for square
matrices and the determinant lower bound. Layer 4 proves Roth's lower bound for arithmetic
progressions, with the constant `1/8`, valid for every `n`.

## Conventions

- **Matrices and families.** `A : Matrix ι V ℝ` has rows indexed by a finite type `ι` and columns
  by a finite type `V`. A family of sets is `S : ι → Finset V`, an indexed family: a set may
  occur several times, and the degree of a point `v` is the number of indices `i` with `v ∈ S i`.
  The family is identified with its incidence matrix (entry `1` when `v ∈ S i`, else `0`).
- **Colourings.** A colouring is `x : V → ℤˣ`, read as a vector of `±1` in `ℝ^V`. Zero is not
  a colour.
- **Empty cases.** Every largest value over rows is `⨆ i` in `ℝ`, which is `0` when there are no
  rows; this is also the right value, since a family with no sets is perfectly balanced. With no
  points there is exactly one colouring and every row sum is `0`. All the discrepancies below
  are then `0`.
- **Hereditary means restricting the points.** The hereditary discrepancy restricts the ground set
  (the columns) to a subset `J`, keeping every set as `S i ∩ J`. Restricting only the family
  would give nothing new, since dropping sets never increases discrepancy.
- **Linear discrepancy, `±1` form.** Weights lie in `[−1, 1]` and are rounded to colourings in
  `{−1, 1}`. In the `0/1` form (weights `y ∈ [0, 1]^V` rounded to `z ∈ {0, 1}^V`) the same
  quantity is half as large, because `w = 2y − 1` and `x = 2z − 1` double every error.
- **Arithmetic progressions** live in `{0, …, n − 1}`, identified with `Fin n`; shifting to
  `{1, …, n}` changes nothing.
- **Powers.** `r ^ (1/k)` is `Real.rpow` with exponent `(k : ℝ)⁻¹`; note that `(0 : ℝ)⁻¹ = 0`, so
  the exponent `1/0` is `0`, which is why the size `k` of a minor is assumed positive.
- **Logarithms.** `log` is the natural logarithm `Real.log`, with `log 0 = 0`; so for a matrix
  with no rows the bound `√(2 s log 2m)` of 1.2 is `0`.

## Layer 1: discrepancy and the random colouring bound

### 1.1 Discrepancy of a matrix

Define `matrixDisc A` as the infimum over colourings `x : V → ℤˣ` of `⨆ i, |∑ j, A i j * x j|`.
It is nonnegative and attained, since there are finitely many colourings.

**Checks.**
- One row of `n` ones: the discrepancy is `0` for even `n` and `1` for odd `n`.
- The matrix `[[1, 1], [1, −1]]` has discrepancy `2`: for every sign vector one of `x₁ + x₂`,
  `x₁ − x₂` is `±2`.
- A plausible wrong definition lets colourings take the value `0`; then every discrepancy is
  `0`, whereas the `1 × 1` matrix `[1]` has discrepancy `1` here.
- No rows, or no columns: the discrepancy is `0`.

*Needs:* Mathlib `Matrix`, `iInf`, `iSup`, `Units`.

### 1.2 The random colouring bound

Prove `matrixDisc_le_sqrt`: if `∑ j, A i j ^ 2 ≤ s` for every row `i`, and `m` is the number of
rows, then `matrixDisc A ≤ √(2 s log (2m))`. (Bansal–Nikolov, §1.1, p. 2, state the bound for
families of sets up to a constant factor, by Hoeffding's inequality and the union bound; the
constant here is the one the route below proves. Proved here.)

Route.

1. If `m = 0` both sides are `0` (`Real.iSup_of_isEmpty`; `log 0 = 0`). If some row is nonzero
   then `s > 0`; if every row is zero the left side is `0`. So assume `m ≥ 1` and `s > 0`, and
   put `τ = √(2 s log 2m) > 0`.
2. Take the uniform probability measure on colourings: the product
   (`MeasureTheory.Measure.pi`) of the uniform measure `ProbabilityTheory.uniformOn Set.univ`
   on `ℤˣ`. The coordinates are independent
   (`ProbabilityTheory.iIndepFun_pi`). For a row `i` the summands `A i j * x j` are independent,
   have mean `0` and lie in `[−|A i j|, |A i j|]`, so each has sub-Gaussian parameter
   `A i j ^ 2` (`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`).
3. Fix a row `i` whose squared norm `σ²` is positive (a zero row has row sum `0 ≤ τ`). The row
   sum `Y` takes finitely many values; let `τ'` be the least value of `|Y|` above `τ` (if there
   is none, the event `|Y| > τ` is empty). Hoeffding's inequality
   (`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`, applied to the
   summands and to their negatives, `ProbabilityTheory.HasSubgaussianMGF.neg`) gives
   `P(|Y| > τ) = P(|Y| ≥ τ') ≤ 2 exp(−τ'²/(2σ²)) ≤ 2 exp(−τ'²/(2s)) < 2 exp(−τ²/(2s)) = 1/m`.
4. By the union bound the event that some row exceeds `τ` has probability `< 1`, so some colouring
   has every row sum at most `τ` in absolute value.

**Checks.**
- One row of `n ≥ 1` ones (`s = n`, `m = 1`): the bound `√(2n log 2)` exceeds `1`, since
  `2 log 2 > 1` (as `e < 4`), and the discrepancy is at most `1`.
- The `2ⁿ × n` matrix whose rows are all sign vectors (`s = n`): the colouring `x` meets the row
  `x` with value `n`, so the discrepancy is `n`; the bound is `√(2n(n + 1) log 2) ≥ n`, because
  `2(n + 1) log 2 ≥ n`. The ratio of the bound to the discrepancy tends to `√(2 log 2)`, so the
  constant `2` cannot be lowered below `1/log 2`.
- The hypothesis on `s` cannot be dropped: the matrix `[1]` with `s = 0` has discrepancy `1` and
  bound `0`.

*Needs:* 1.1; Mathlib `MeasureTheory.Measure.pi`, `ProbabilityTheory.uniformOn`,
`ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`,
`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`,
`ProbabilityTheory.HasSubgaussianMGF.neg`, `MeasureTheory.measure_iUnion_le`,
`Real.iSup_of_isEmpty`.

### Examples

- For `n` sets on `n` points the bound is `√(2 n log 2n)`; Spencer's theorem improves it to a
  constant times `√n` (not treated here).

### Dependencies

1.1 uses Mathlib. 1.2 uses 1.1 and Mathlib.

## Layer 2: families of sets of bounded degree

### 2.1 Discrepancy of a family of sets

Define `setSystemDisc S` as the infimum over colourings `x : V → ℤˣ` of
`⨆ i, |∑ v ∈ S i, x v|`. It is `matrixDisc` of the incidence matrix of `S`.

**Checks.**
- The family `{{0, 1}}` has discrepancy `0` (colour the two points differently); the family
  `{{0}}` has discrepancy `1`. A plausible wrong definition takes the largest imbalance over all
  colourings instead of the least; it gives `2` for `{{0, 1}}`.
- The empty family, and the family whose only set is empty, have discrepancy `0`.

*Needs:* Mathlib `Finset.sum`, `iInf`, `iSup`.

### 2.2 The Beck–Fiala theorem

Prove `setSystemDisc_le_two_mul_sub_one`: if `t ≥ 1` and every point lies in at most `t` of the
sets (`Nat.card {i // v ∈ S i} ≤ t`), then `setSystemDisc S ≤ 2t − 1`. (Beck and Fiala 1981,
attributed. Nikolov, Prague lecture 3, Theorem 2, pp. 1–2, with proof, with `t` the maximum
degree; Bansal–Nikolov, Theorem 2.2 with Lemma 2.3, pp. 20–22. Both print the bound
`2 deg − 1` without excluding degree `0`, where it is `−1` and false; here `t ≥ 1` is assumed.)

Route (the floating-colour argument of the sources).

1. *Counting.* If `P` is a nonempty set of points, each in at most `t` sets, then fewer than
   `|P|` indices `i` have `|S i ∩ P| > t`. If there are `N ≥ 1` such indices, counting incidences
   gives `t N <` (the number of incidences in `P`) `≤ t |P|`, so `N < |P|`; if there are none,
   `0 < |P|`.
2. *Moving.* Start from `y₀ = 0 ∈ [−1, 1]^V`. At each step let `F` be the points with `y v = ±1`
   (frozen), `P` the others (nonempty until `y` is a colouring), and call `i` dangerous when
   `|S i ∩ P| > t`. By step 1 the linear
   system "`δ = 0` on `F`, `∑_{v ∈ S i} δ v = 0` for dangerous `i`" has fewer equations than
   unknowns among `P`, so it has a nonzero solution (`LinearMap.ker_ne_bot_of_finrank_lt`). Move
   `y` along `δ` until a new coordinate reaches `±1`. Frozen points stay frozen, so after at most
   `|V|` steps `y` is a colouring `x`.
3. *Bound.* A set is dangerous at an initial run of steps and never again. While dangerous its sum
   stays `0`. Consider the step at which it stops being dangerous (or the start, if it never is):
   its sum is `0` there, at most `t` of its points are still moving, and each moves by less than
   `2` afterwards. So `|∑_{v ∈ S i} x v| < 2t`, and an integer below `2t` is at most `2t − 1`.

**Checks.**
- Degree `1`: the sets are disjoint and a set of odd size has discrepancy `1 = 2 · 1 − 1`, so the
  bound is attained at `t = 1`.
- The hypothesis `t ≥ 1` cannot be dropped: the family whose only set is empty has every degree
  `0` and discrepancy `0 > 2 · 0 − 1`.
- Repeated sets count in the degree: the family `({0}, {0})` has degree `2` at `0` and
  discrepancy `1`.
- Exact computation over every family of at most 4 sets on at most 3 points and of at most 3
  sets on 4 points (9427 families, with repetitions and empty sets): the bound holds, and the
  largest discrepancy for largest degree `1, 2, 3, 4` is `1, 2, 2, 1`.

*Needs:* 2.1; Mathlib `LinearMap.ker_ne_bot_of_finrank_lt`, `Finset.card_nbij`, `Nat.card`.

### Examples

- For `t ≥ 1`, the restricted family `S i ∩ J` of a family of degree at most `t` again has degree
  at most `t`, so by 2.2 the hereditary discrepancy (3.1, below) of its incidence matrix is at
  most `2t − 1`.

### Dependencies

2.1 uses Mathlib (and agrees with 1.1 on the incidence matrix). 2.2 uses 2.1 and Mathlib.

## Layer 3: hereditary and linear discrepancy

### 3.1 Hereditary and linear discrepancy

Define

- `herdisc A`, the supremum over `J : Finset V` of `matrixDisc` of the column submatrix
  `A.submatrix id (↑) : Matrix ι J ℝ`;
- `lindisc A`, the supremum over weights `w : V → [−1, 1]` of the infimum over colourings `x` of
  `⨆ i, |∑ j, A i j * (x j − w j)|`.

The first is a maximum over finitely many sets; the second is finite, being at most
`2 max_i ∑ j |A i j|`.

**Checks.**
- The family `{{0, 1}}`: discrepancy `0`, hereditary discrepancy `1` (restrict to `{0}`), linear
  discrepancy `1` (the weight sum `w₀ + w₁` is at distance at most `1` from `{−2, 0, 2}`, with
  equality at `w = (1, 0)`). Restricting the family instead of the points would give `0`.
- The `1 × 1` matrix `[a]`: discrepancy, hereditary and linear discrepancy all equal `|a|` (for
  the last, `min (|1 − w|, |1 + w|) ≤ 1` with equality at `w = 0`). In the `0/1` form the linear
  discrepancy of `[a]` is `|a|/2`, half the value here.
- The identity matrix of size `k ≥ 1` has hereditary and linear discrepancy `1`: at `w = 0` every
  coordinate errs by `1`, and the colouring by the signs of `w` errs by at most `1`.

*Needs:* 1.1; Mathlib `Matrix.submatrix`, `Set.Icc`, `iSup`.

### 3.2 Rounding: linear discrepancy is at most twice hereditary discrepancy

Prove `lindisc_le_two_mul_herdisc`: `lindisc A ≤ 2 * herdisc A` for every real matrix. (Lovász,
Spencer and Vesztergombi 1986, attributed. In the `0/1` form, `lindisc ≤ herdisc`, with proof:
Bansal–Nikolov, Theorem 1.4, pp. 5–6, and Nikolov, Prague lecture 1, Lemma 1, p. 3; by the
Conventions this is the statement here.)

Route. Write `h = herdisc A`.

1. *Weights in `{−1, 0, 1}`.* Keep the colours `±1` where `w` is `±1` and colour the zero
   coordinates `J` by a colouring of `A(·, J)` of discrepancy at most `h`: the error is at most
   `h`.
2. *Dyadic weights.* Induct on `q` for `w ∈ [−1, 1]^V ∩ 2^(−q) ℤ^V`. Choose `y_j = 1` if
   `w_j ≥ 0` and `−1` otherwise; then `z = 2w − y` lies in `[−1, 1]^V ∩ 2^(−q+1) ℤ^V`, and by
   induction some colouring `x'` has `‖A(x' − z)‖∞ ≤ 2h`. The vector `u = (x' + y)/2` has entries
   in `{−1, 0, 1}` and `‖A(u − w)‖∞ = ‖A(x' − z)‖∞ / 2 ≤ h`. Colour the zero coordinates of `u`
   as in step 1, at a further cost of at most `h`.
3. *All weights.* For `w ∈ [−1, 1]^V` and `ε > 0` pick a dyadic `w'` in `[−1, 1]^V` with
   `‖A(w − w')‖∞ ≤ ε`; then some colouring errs by at most `2h + ε` at `w`. There are finitely
   many colourings, so one of them errs by at most `2h`.

**Checks.**
- `[a]`: `|a| ≤ 2|a|`; `{{0, 1}}`: `1 ≤ 2`.
- Exact computation on the dyadic grid of step `1/4`: for every `1 × 1` matrix with entry in
  `{−2, …, 2}` and every `2 × 2` matrix with entries in `{−1, 0, 1}` (step `1/2` for the `3 × 3`
  0/1 matrices), the largest grid value of the rounding error is at most `2 herdisc`.

*Needs:* 3.1; Mathlib `Matrix.submatrix`, `Finset.exists_min_image`.

### 3.3 The volume bound for square matrices

Prove `abs_det_rpow_le_lindisc`: for a square real matrix `B` of size `k ≥ 1` (a nonempty index
type), `|det B| ^ (1/k) ≤ lindisc B`. (Lovász, Spencer and Vesztergombi 1986, attributed.
Proved here. In the proof of Bansal–Nikolov, Lemma 7.10, pp. 113–114, a unit cube is covered by
`2^k` translates of a body `{u : ‖B u‖∞ ≤ c}` and the union bound loses a factor `2`; their
Exercise 7.12, p. 114, asks to remove that loss, and the periodic covering of the route below
does so.)

Route. Let `D = lindisc B` and `K = {u : ‖B u‖∞ ≤ D}`.

1. If `det B = 0` the left side is `0 ≤ D` (`Real.zero_rpow`; `D ≥ 0`).
2. *Covering.* Every `w ∈ ℝ^k` is `2z + w'` with `z ∈ ℤ^k` and `w' ∈ [−1, 1]^k`. Some colouring
   `x` has `‖B(x − w')‖∞ ≤ D` (the infimum over the finitely many colourings is attained), so
   `w ∈ (𝟙 + 2(z − e)) + K` with `x = 𝟙 − 2e`, `e ∈ {0, 1}^k`. Hence the translates of `𝟙 + K` by
   the lattice `2ℤ^k` cover `ℝ^k`.
3. *Volume.* For a lattice `Λ` with fundamental domain `F`, `vol(T) = ∑_{λ ∈ Λ} vol((λ + T) ∩ F)`
   (`MeasureTheory.IsAddFundamentalDomain.measure_eq_tsum`, with `ZSpan.isAddFundamentalDomain`
   for the basis `2e₁, …, 2e_k`). If the translates of `T` cover, the right side is at least
   `vol(F) = 2^k` (`MeasureTheory.measure_iUnion_le`, `ZSpan.volume_fundamentalDomain`). As
   Lebesgue measure is translation invariant, `vol(K) = vol(𝟙 + K) ≥ 2^k`.
4. If `det B ≠ 0`, `K` is the preimage of the cube `[−D, D]^k` under `B`, of volume
   `(2D)^k / |det B|` (`MeasureTheory.Measure.addHaar_preimage_linearMap`, `LinearMap.det_toLin'`,
   `Real.volume_Icc_pi`). So `(2D)^k ≥ 2^k |det B|`, that is `D ≥ |det B| ^ (1/k)`.

**Checks.**
- The identity matrix (`1 ≤ 1`) and `[a]` (`|a| ≤ |a|`) attain the bound, so the constant `1`
  in front of `|det B| ^ (1/k)` cannot be raised.
- The matrix `[[1, 1], [1, −1]]`: `|det|^(1/2) = √2`, while `w = 0` already gives `2`.
- Size `k ≥ 1` is needed: the empty `0 × 0` matrix has determinant `1` and linear discrepancy `0`.

*Needs:* 3.1; Mathlib `MeasureTheory.IsAddFundamentalDomain.measure_eq_tsum`,
`ZSpan.isAddFundamentalDomain`, `ZSpan.volume_fundamentalDomain`,
`MeasureTheory.measure_iUnion_le`, `MeasureTheory.Measure.addHaar_preimage_linearMap`,
`LinearMap.det_toLin'`, `Real.volume_Icc_pi`,
`Real.zero_rpow`.

### 3.4 The determinant lower bound

Prove `abs_det_submatrix_rpow_div_two_le_herdisc`: for `k ≥ 1` and any `f : Fin k → ι`,
`g : Fin k → V`, `|det A(f, g)| ^ (1/k) / 2 ≤ herdisc A`. (Lovász, Spencer and Vesztergombi 1986,
attributed. Bansal–Nikolov, Lemma 7.10, pp. 113–114, states it, proves the constant `1/4` and
leaves `1/2` as Exercise 7.12, p. 114; Nikolov, Prague lecture 4, Theorem 7, pp. 3–4, states
it.)

Route.

1. If `f` or `g` repeats a value, the submatrix has two equal rows or columns and determinant `0`
   (`Matrix.det_zero_of_row_eq`, `Matrix.det_zero_of_column_eq`); the left side is `0` and
   `herdisc A ≥ 0` (take `J = ∅`).
2. Otherwise `B = A(f, g)` is `A` restricted to `k` rows and `k` columns. A column restriction of
   `B` is a column restriction of `A` with fewer rows, and dropping rows does not increase the
   discrepancy, so `herdisc B ≤ herdisc A`.
3. By 3.2 and 3.3, `|det B| ^ (1/k) ≤ lindisc B ≤ 2 herdisc B`.

**Checks.**
- `k ≥ 1` is needed: for the zero matrix and `k = 0` the left side is `1/2` and `herdisc = 0`.
- `[a]` with `k = 1`: `|a|/2 ≤ |a|`; the identity of size `k`: `1/2 ≤ 1`; the matrix
  `[[1, 1], [1, −1]]`: `√2/2 ≤ 2`.

*Needs:* 3.2, 3.3; Mathlib `Matrix.submatrix`, `Matrix.det_zero_of_row_eq`,
`Matrix.det_zero_of_column_eq`, `Real.zero_rpow`.

### Examples

- For a family of sets the determinant bound applies to its incidence matrix. For the
  `2 × 2` matrix `[[1, 1], [1, −1]]`, which is not an incidence matrix, `disc = herdisc = 2`,
  `lindisc ≥ 2`, and the determinant bound gives `|det|^(1/2)/2 = √2/2`.

### Dependencies

3.1 uses 1.1 and Mathlib. 3.2 uses 3.1. 3.3 uses 3.1 and Mathlib. 3.4 uses 3.2, 3.3 and Mathlib.

## Layer 4: arithmetic progressions

### 4.1 The arithmetic progressions in an interval

Define `arithProg n`, indexed by triples `(a, d, ℓ)` with `a < n`, `d < n`, `ℓ ≤ n`: the set of
`x < n` of the form `a + k d` with `k < ℓ`. Every arithmetic progression contained in
`{0, …, n − 1}` occurs (a progression with two or more terms has difference below `n` and at most
`n` terms), and every set of the family is one (with `d = 0` it is a single point or empty).

**Checks.**
- `n = 3`: the distinct sets are `∅`, the three points, `{0, 1}`, `{1, 2}`, `{0, 2}` and
  `{0, 1, 2}`.
- Exact computation for `n ≤ 12`: the distinct nonempty sets of the family are exactly the
  arithmetic progressions in `{0, …, n − 1}`.
- `n = 0`: the index type is empty.

*Needs:* Mathlib `Fin`, `Finset.filter`, `Finset.range`.

### 4.2 Roth's lower bound

Prove `rpow_div_eight_le_setSystemDisc_arithProg`: for every natural number `n`, the discrepancy
of `arithProg n` is at least `n ^ (1/4) / 8`. (Roth 1964, a lower bound of order `n^(1/4)`,
attributed; Fox–Xu–Zhou §1, p. 1, and Li–Nikolov §1, p. 2, state it up to an unspecified
absolute constant factor. The constant `1/8` and the route are this roadmap's. Proved here.)

Route. Fix a colouring `χ` of `{0, …, n − 1}` and extend it by `0` to `ℤ`. Write `e(θ) = exp(2πiθ)`.

1. *Small `n`.* For `n = 0` both sides are `0`. For `1 ≤ n < 24` every singleton is a
   progression, so the discrepancy is at least `1 ≥ n^(1/4)/8`.
2. *Parameters.* For `n ≥ 24` put `L = ⌊√(n/2)⌋ ≥ 3` and `D = 4L − 1`. For `1 ≤ d ≤ D` and
   `a ∈ ℤ` let `S(a, d) = ∑_{k<L} χ(a + kd)`; it is the imbalance of the set
   `{a + kd : k < L} ∩ {0, …, n − 1}`, an arithmetic progression in that range (or empty), and it
   vanishes unless `−(L−1)d ≤ a ≤ n − 1`.
3. *Parseval.* With `F(θ) = ∑_x χ(x) e(xθ)` and `G_d(θ) = ∑_{k<L} e(kdθ)`,
   `∑_a S(a, d)² = ∫₀¹ |F(θ)|² |G_d(θ)|² dθ` and `∫₀¹ |F|² = n` (multiply by a power of the
   variable to make all exponents nonnegative and use
   `Polynomial.sum_sq_norm_coeff_eq_circleAverage`).
4. *Dirichlet.* For every `θ` some `1 ≤ d ≤ D` and integer `j` have `|dθ − j| ≤ 1/(4L)`
   (`Real.exists_int_int_abs_mul_sub_le` with `D + 1 = 4L`). For `φ = dθ − j` and `k < L`,
   `|2πkφ| ≤ π/2`, so `cos(2πkφ) ≥ 1 − 4k|φ|` (`Real.one_sub_mul_le_cos`), and
   `|G_d(θ)| ≥ Re G_d(θ) ≥ L − 2|φ|L(L − 1) ≥ L/2`. Hence `∑_{d ≤ D} |G_d(θ)|² ≥ L²/4` for all `θ`.
5. *Averaging.* Summing step 3 over `d ≤ D` and using step 4:
   `∑_{d ≤ D} ∑_a S(a, d)² ≥ L² n / 4`. At most `∑_{d ≤ D} (n + (L − 1)d) = (4L − 1)(n + 2L(L − 1))`
   pairs `(a, d)` have a nonzero term, so some pair has
   `S(a, d)² ≥ L² n / (4(4L − 1)(n + 2L(L − 1))) ≥ L² n / (32 L n) = L/32`, using
   `2L(L − 1) ≤ 2L² ≤ n`.
6. *Constant.* For `n ≥ 24`, `L ≥ √(n/2) − 1 ≥ √n / 2` (as `√n (1/√2 − 1/2) ≥ 1`), so
   `S(a, d)² ≥ √n / 64` and `|S(a, d)| ≥ n^(1/4)/8`.

**Checks.**
- The discrepancy of the progressions in `{0, …, n − 1}`, computed exhaustively for `n ≤ 14`, is
  `0, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3` for `n = 0, …, 14`; the bound `n^(1/4)/8` is
  below `1` for `n ≤ 4095`.
- The inequality of step 5 before the last simplification,
  `L² n / (4(4L − 1)(n + 2L(L − 1))) ≥ √n/64`, was checked in exact integer arithmetic (after
  squaring) for every `24 ≤ n ≤ 200000`.
- Steps 3–5 together (`4 ∑_{d ≤ D} ∑_a S(a, d)² ≥ L² n`, with `L = max(1, ⌊√(n/2)⌋)`) were checked
  exhaustively over all colourings for `n ≤ 13`.

*Needs:* 2.1, 4.1; Mathlib `Polynomial.sum_sq_norm_coeff_eq_circleAverage`,
`Real.exists_int_int_abs_mul_sub_le`, `Real.one_sub_mul_le_cos`.

### Examples

- The matching upper bound, a constant times `n^(1/4)` (Matoušek and Spencer), is not treated
  here; it needs the partial colouring method.

### Dependencies

4.1 uses Mathlib. 4.2 uses 2.1, 4.1 and Mathlib.

## Scope and ownership

This roadmap owns the discrepancy, hereditary discrepancy and linear discrepancy of real
matrices and of finite families of sets (1.1, 2.1, 3.1), the random colouring bound (1.2), the
Beck–Fiala theorem (2.2), the rounding theorem, the volume bound and the determinant lower bound
(3.2–3.4), and Roth's lower bound for arithmetic progressions (4.2), all stated above.

Different notions with the same name, not used here:

- ProbabilisticAndMetricNumberTheory §2.7 owns the star discrepancy of a finite real sample,
  which measures how evenly the sample fills the unit interval, together with Koksma's inequality
  and the Erdős–Turán inequality (Equidistribution cites them from there);
  DiophantineApproximationAndTranscendencePartII §3.1 defines the discrepancy of a finite tuple of
  points on the circle with respect to arcs.
- FiniteSamplingDiscrepancy calls discrepancy the excess `sup_A (μ(A) − ν(A))` of one probability
  law over another, and bounds it for sampling with and without replacement.
- The discrepancy of a two-party function with respect to rectangles, in communication
  complexity, and the maximum mean discrepancy of kernel methods are other notions; they are not
  treated here.

Not treated here: Spencer's six-standard-deviations theorem and the partial colouring method;
the upper bounds for arithmetic progressions (Beck; Matoušek and Spencer); the Beck–Fiala and
Komlós conjectures and Banaszczyk's theorem; the factorisation-norm characterisation of hereditary
discrepancy; geometric discrepancy of boxes and half-planes; algorithms that find colourings.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Moments/SubGaussian.lean`:
  `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun` (for `iIndepFun X μ` and
  `HasSubgaussianMGF (X i) (c i) μ` on `s`, and `0 ≤ ε`:
  `μ.real {ω | ε ≤ ∑ i ∈ s, X i ω} ≤ exp (−ε² / (2 ∑ c i))`);
  `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero` (a.e. measurable, values a.e.
  in `[a, b]`, mean `0`, probability measure: parameter `((b − a)/2)²`);
  `ProbabilityTheory.HasSubgaussianMGF.neg`.
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun_pi` (coordinates of
  `Measure.pi` of probability measures are independent); `Mathlib/Probability/UniformOn.lean`:
  `ProbabilityTheory.uniformOn` (a probability measure on `Set.univ` of a finite nonempty type);
  `MeasureTheory.Measure.pi`; `MeasureTheory.measure_iUnion_le` (countable subadditivity).
- `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`:
  `MeasureTheory.IsAddFundamentalDomain.measure_eq_tsum` (countable group, invariant measure:
  `μ t = ∑' g, μ ((g +ᵥ t) ∩ s)`); `Mathlib/Algebra/Module/ZLattice/Basic.lean`:
  `ZSpan.isAddFundamentalDomain` (the half-open parallelepiped of a basis is a fundamental domain
  of its integer span); `ZSpan.volume_fundamentalDomain` (for a basis `b` of `ι → ℝ`, its volume
  is `|det b|`).
- `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`:
  `MeasureTheory.Measure.addHaar_preimage_linearMap` (`det f ≠ 0`:
  `μ (f ⁻¹' s) = ofReal |(det f)⁻¹| * μ s`); `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean`:
  `Real.volume_Icc_pi`; `LinearMap.det_toLin'`.
- `Matrix.submatrix`, `Matrix.det_zero_of_row_eq`, `Matrix.det_zero_of_column_eq`;
  `LinearMap.ker_ne_bot_of_finrank_lt` (`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`);
  `Finset.card_nbij`, `Finset.exists_min_image`.
- `Mathlib/NumberTheory/DiophantineApproximation/Basic.lean`:
  `Real.exists_int_int_abs_mul_sub_le` (for real `ξ` and `0 < n`, some `0 < k ≤ n` and integer
  `j` have `|k ξ − j| ≤ 1/(n + 1)`).
- `Mathlib/Analysis/Polynomial/Fourier.lean`: `Polynomial.sum_sq_norm_coeff_eq_circleAverage`
  (Parseval for complex polynomials on the unit circle).
- `Real.one_sub_mul_le_cos` (`0 ≤ x ≤ π/2`: `1 − (2/π) x ≤ cos x`), `Real.zero_rpow`,
  `Real.iSup_of_isEmpty`.

## References

- N. Bansal and A. Nikolov, *Discrepancy Theory: An Algorithmic and Geometric Perspective*,
  arXiv:2608.00140v1 (2026): §1.1 (p. 2), Theorem 1.4 with proof (pp. 5–6), Theorem 2.2 with
  Lemma 2.3 and proof (pp. 20–22), Lemma 7.10 with proof of a weaker constant (pp. 113–114),
  Exercise 7.12 (p. 114). Printed page numbers.
- A. Nikolov, *Discrepancy Theory*, lecture notes, Prague Summer School 2018, author's page
  (`cs.toronto.edu/~anikolov/Prague18/Lectures/`): Lecture 1, Lemma 1 with proof (p. 3);
  Lecture 3, Theorem 2 with proof (pp. 1–2); Lecture 4, Theorem 7 (p. 3).
- J. Fox, M. W. Xu and Y. Zhou, *Discrepancy in modular arithmetic progressions*,
  arXiv:2104.03929v1 (2021), §1, p. 1 (statement of Roth's bound).
- L. Li and A. Nikolov, *Discrepancy of arithmetic progressions in boxes and convex bodies*,
  arXiv:2504.12598v2 (2026), §1, p. 2 (statement of Roth's bound).
- J. Beck and T. Fiala, "Integer-making" theorems, Discrete Appl. Math. 3 (1981), 1–8;
  attributed, not consulted.
- L. Lovász, J. Spencer and K. Vesztergombi, *Discrepancy of set-systems and matrices*,
  European J. Combin. 7 (1986), 151–160; attributed, not consulted.
- K. F. Roth, *Remark concerning integer sequences*, Acta Arith. 9 (1964), 257–260; attributed,
  not consulted.

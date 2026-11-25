# Roadmap: random projections and sketching

**Summary.** This roadmap develops the probability theory of random linear maps that shrink the
dimension of Euclidean space while keeping lengths, traces and least-squares residuals nearly
unchanged. A sketch is a random `k × d` matrix with a stated law: independent standard Gaussian
entries, independent random signs, independent sparse signs taking the values `±√3` with
probability `1/6` each and `0` otherwise, or the CountSketch matrix built from a random bucket and
a random sign for each column. Every target is an identity or an inequality about such a random
matrix or about a fixed matrix; no procedure or running time is specified. Throughout, `g(ε) = ε²/2 − ε³/3`.

The headline theorems are these.

- *The Johnson–Lindenstrauss lemma.* If `R` is a `k × d` matrix with independent entries, all
  standard Gaussian, all random signs or all sparse signs, then for every `x` in `ℝ^d` and every
  `ε > 0` the probability that `‖Rx‖²/k` differs from `‖x‖²` by more than `ε‖x‖²` is at most
  `2 exp(−k g(ε)/2)`. Consequently, for `n` points, `0 < ε < 1`, every `β` and
  `k ≥ (4 + 2β) log n / g(ε)`, the map `x ↦ Rx/√k` changes every squared distance between the points
  by a factor in `[1 − ε, 1 + ε]` with probability at least `1 − n^(−β)`; and for every `ε > 0`
  and `k ≥ 4 log n / g(ε)` some linear map to `ℝ^k` does so.
- *Trace estimation.* For a symmetric matrix `A` and a vector `z` of independent random signs,
  `zᵀAz` has mean `tr A` and variance `2(‖A‖_F² − ∑ᵢ Aᵢᵢ²)`. For a positive semidefinite `A` and
  `M` independent standard Gaussian vectors, the average of the `zₘᵀAzₘ` differs from `tr A` by
  more than `ε tr A` with probability at most `2 exp(−M g(ε)/2)`.
- *CountSketch.* If the buckets are uniform and pairwise independent, the signs are 4-wise
  independent random signs and the two families are independent, then `‖Sx‖²` has mean `‖x‖²`
  and variance `(2/k)(‖x‖⁴ − ∑ⱼ xⱼ⁴)`; the mean needs only pairwise independent signs.
- *Sketch and solve.* If a fixed matrix `S` multiplies every squared norm in the span of the
  columns of `A` and of `b` by a factor in `[1 − ε, 1 + ε]`, with `ε < 1`, then any minimiser of
  `‖S(Ax − b)‖²` over a set `C` has `‖Ax − b‖²` within the factor `(1 + ε)/(1 − ε)` of every
  value of `‖Ax − b‖²` on `C`.

The roadmap builds on Mathlib's Gaussian laws, independence, laws of random variables and
Chernoff bounds, and on Tau Ceti's chi-squared law with its moment generating function, its
Rademacher law, and its moment generating functions of Gaussian quadratic forms. It sits beside
two roadmaps without restating them: MathematicalStatisticsHighDimensional states chi-squared
tails in another form and the restricted isometry property of sub-Gaussian designs, and
RandomMatrices states the Hanson–Wright inequality and matrix concentration inequalities.
Random subspace embeddings are not treated here.

## How to read the build

Layer 1 below proves the chi-squared tail bounds in rate-function form and deduces the
Johnson–Lindenstrauss lemma for Gaussian matrices, in distributional form and as the existence
of an embedding of a finite set. Layer 2 defines the sparse sign law, proves the distributional
bound for sign and sparse sign matrices by comparing their moments with Gaussian ones, and proves
the finite-set lemma for all three laws; it uses the computation of 1.1 and, for the Gaussian
case of 2.3, the bound of 1.2. Layer 3 treats trace estimators: Hutchinson's identities depend on
no other layer, and the Gaussian tail bound reuses the computation of 1.1 and the estimates of the logarithm in
1.2. Layer 4, CountSketch,
and Layer 5, subspace embeddings and sketch-and-solve, depend on no other layer. Within a layer
the sections are in build order.

## Conventions

- **Vectors and norms.** A vector of `ℝ^n` is a function `Fin n → ℝ`, a `k × d` matrix is a
  `Matrix (Fin k) (Fin d) ℝ`, and `Rx` is `R *ᵥ x`. The squared Euclidean norm is
  `‖v‖² = ∑ᵢ vᵢ²`, written `v ⬝ᵥ v` in Lean; the sup norm that Mathlib puts on `Fin n → ℝ` is never
  used. `‖A‖_F² = ∑ᵢ ∑ⱼ Aᵢⱼ²` is the squared Frobenius norm.
- **Random objects.** Random vectors and matrices are functions on a probability space `(Ω, μ)`.
  `HasIIDEntries μ X ν` says that the coordinates of `X : Ω → ι → ℝ` are mutually independent
  (Mathlib's `iIndepFun`) and that each has law `ν` (Mathlib's `HasLaw`). A random matrix
  `R : Ω → Matrix (Fin k) (Fin d) ℝ` has independent entries with law `ν` when
  `HasIIDEntries μ (fun ω p ↦ R ω p.1 p.2) ν`, with `p` ranging over `Fin k × Fin d`. Probabilities
  are `μ.real`, means `μ[·]` and variances Mathlib's `Var[·; μ]`.
- **Scaling.** The sketch of `x` by `R` is `Rx/√k`, whose squared norm is `‖Rx‖²/k`, written
  `(k : ℝ)⁻¹ * ((R ω *ᵥ x) ⬝ᵥ (R ω *ᵥ x))`. For `k = 0` this is `0`, the squared norm of the only
  vector of `ℝ⁰`, and every statement below is true at `k = 0`.
- **Distortion events.** Deviations are strict: the event that `‖Rx‖²/k` differs from `‖x‖²` by
  more than `ε‖x‖²`. For `x = 0` it is empty, whereas the non-strict event would be everything.
- **The exponent.** `g(ε) = ε²/2 − ε³/3`. It is positive exactly for `0 < ε < 3/2`, and
  `g(1/2) = 1/12`.
- **Laws.** `gaussianReal 0 1` is Mathlib's standard Gaussian law; `rademacherMeasure` is Tau
  Ceti's law of a random sign, `±1` with probability `1/2` each; `chiSquaredMeasure k` is Tau Ceti's
  chi-squared law, the point mass at `0` for `k = 0`.

## Layer 1: Gaussian projections

### 1.1 Chi-squared tails in rate-function form

Let `Z` have the law `chiSquaredMeasure k` for a natural number `k`.

- `chiSquared_upper_tail`: for `β ≥ 1`, `P(Z ≥ βk) ≤ exp(−k(β − 1 − log β)/2)`.
- `chiSquared_lower_tail`: for `β ≤ 1`, `P(Z ≤ βk) ≤ exp(−k(β − 1 − log β)/2)`. For `β ≤ 0` and
  `k ≥ 1` the left side is `0`, since `Z` is almost surely nonnegative and has no atom at `0`;
  there the right side involves Mathlib's convention `log 0 = 0` and `log β = log |β|`, and the
  statement says nothing.

Route: for `0 < β`, put `s = (1 − 1/β)/2`, which is below `1/2`, nonnegative for `β ≥ 1` and
nonpositive for `β ≤ 1`. The Chernoff bounds `measure_ge_le_exp_mul_mgf` and
`measure_le_le_exp_mul_mgf` with the moment generating function `(1 − 2s)^(−k/2)` of
`mgf_id_chiSquaredMeasure` give the bound `exp(−sβk) (1 − 2s)^(−k/2)`, and at this `s` it equals
`β^(k/2) exp(−(β − 1)k/2)`, the right side. For `β ≤ 0` use `ae_nonneg_chiSquaredMeasure` and
`chiSquaredMeasure_singleton`, and for `k = 0` use `chiSquaredMeasure_zero`.

**Checks.**
- `k = 2`, `β = 2`: `χ²₂` is exponential with mean `2`, so `P(Z ≥ 4) = e^(−2) ≈ 0.135`, and the
  bound is `exp(−(1 − log 2)) = 2/e ≈ 0.736`.
- `k = 2`, `β = 1/2`: `P(Z ≤ 1) = 1 − e^(−1/2) ≈ 0.393`, and the bound is
  `exp(−(−1/2 + log 2)) = √e/2 ≈ 0.824`.
- The side conditions cannot be dropped. For `k = 50`, `β = 0.8` the upper bound would read
  `P(Z ≥ 40) ≤ exp(−25(log 1.25 − 0.2)) ≈ 0.561`, while `P(χ²₅₀ ≥ 40) ≈ 0.843`; for `k = 50`,
  `β = 1.2` the lower bound would read `P(Z ≤ 60) ≤ 0.643`, while `P(χ²₅₀ ≤ 60) ≈ 0.843`.
- `k = 0`: `Z = 0`, both events have probability `1`, and both bounds equal `1`.
- At `β = 1` both bounds equal `1`.

*Needs:* Mathlib `measure_ge_le_exp_mul_mgf`, `measure_le_le_exp_mul_mgf`; Tau Ceti
`chiSquaredMeasure`, `mgf_id_chiSquaredMeasure`, `chiSquaredMeasure_zero`,
`ae_nonneg_chiSquaredMeasure`, `chiSquaredMeasure_singleton`. (Proved here. The same optimisation
of the Chernoff bound, for the squared length of the projection of a uniform random unit vector
onto `k` coordinates, is Dasgupta–Gupta, Lemma 2.2, p. 62, proved on pp. 63–64.)

### 1.2 The distributional lemma for Gaussian matrices

Prove `gaussian_jl_tail`: if `R` is a `k × d` random matrix with independent standard Gaussian
entries, then for every `x ∈ ℝ^d` and every `ε > 0`,
`P(|‖Rx‖²/k − ‖x‖²| > ε‖x‖²) ≤ 2 exp(−k g(ε)/2)`.

Route: for `x = 0` the event is empty. Otherwise the coordinates `(Rx)ᵢ = ∑ⱼ Rᵢⱼ xⱼ` are
independent, since they are functions of disjoint sets of entries, and each has law
`gaussianReal 0 ‖x‖²`, by `gaussianReal_map_const_mul` and `gaussianReal_conv_gaussianReal`. So
`‖Rx‖²/‖x‖²` is a sum of `k` squares of independent standard Gaussians and has law
`chiSquaredMeasure k` (`iIndepFun.hasLaw_sum_sq_gaussian`). Apply 1.1 with `β = 1 + ε` and, for
`ε < 1`, with `β = 1 − ε`; for `ε ≥ 1` the lower event is empty. Finally
`ε − log(1 + ε) ≥ g(ε)` for every `ε > 0` (the difference vanishes at `0` and has derivative
`ε³/(1 + ε) ≥ 0`) and `−ε − log(1 − ε) ≥ ε²/2 ≥ g(ε)` for `0 < ε < 1`.

**Checks.**
- `k = 40`, `ε = 1/2`: the probability is `P(χ²₄₀ ≥ 60) + P(χ²₄₀ ≤ 20) ≈ 0.0253`, and the bound
  is `2 exp(−40/24) = 2e^(−5/3) ≈ 0.378`.
- For `ε ≥ 3/2`, `g(ε) ≤ 0` and the bound is at least `2`.
- For `x = 0` the strict event is empty; the non-strict event `|‖Rx‖²/k − ‖x‖²| ≥ ε‖x‖²` would
  have probability `1`, above `0.378` at `k = 40`, `ε = 1/2`.

*Needs:* 1.1; Mathlib `gaussianReal`, `gaussianReal_map_const_mul`, `gaussianReal_conv_gaussianReal`,
`iIndepFun_iff_map_fun_eq_pi_map`, `HasLaw`; Tau Ceti `iIndepFun.hasLaw_sum_sq_gaussian`. (Proved
here. The two estimates of the logarithm are the ones in the proof of Dasgupta–Gupta,
Theorem 2.1, p. 62.)

### 1.3 Embedding a finite set

Prove `exists_jl_embedding`: for `n` points `x₁, …, xₙ` of `ℝ^d`, `ε > 0` and a natural number
`k ≥ 4 log n / g(ε)`, there is a `k × d` matrix `L` with
`(1 − ε)‖xᵢ − xⱼ‖² ≤ ‖L(xᵢ − xⱼ)‖² ≤ (1 + ε)‖xᵢ − xⱼ‖²` for all `i`, `j` (Dasgupta–Gupta,
Theorem 2.1, p. 61, for `0 < ε < 1`).

Route: for `ε ≥ 1` the zero matrix works, since `1 − ε ≤ 0`; this covers `ε ≥ 3/2`, where
`g(ε) ≤ 0` and the condition on `k` holds for every `k` (at `ε = 3/2` by Mathlib's convention
`4 log n / 0 = 0`). For `0 < ε < 1` take `L = R/√k`
with `R` as in 1.2. For each of the `n(n − 1)/2` pairs the failure probability is at most
`2 exp(−k g(ε)/2) ≤ 2/n²`, so the probability that some pair fails is at most
`n(n − 1)/n² < 1`, and some outcome of `R` works. Dasgupta and Gupta project onto a uniformly
random `k`-dimensional subspace instead of using a Gaussian matrix.

**Checks.**
- `n = 1`: `log 1 = 0`, so every `k` is allowed, `k = 0` included, and the only pair is `i = j`,
  where all three quantities vanish.
- `ε = 1/2`, `n = 100`: `g = 1/12` and the condition is `k ≥ 48 log 100 ≈ 221.05`, so `k = 222`.
- For `ε ≤ 0` the statement is false: with two distinct points and `ε < 0` the two inequalities
  contradict each other, and with `ε = 0` the condition reads `k ≥ 0` (division by `g(0) = 0`)
  while no `0 × d` matrix keeps a nonzero distance.

*Needs:* 1.2. (Dasgupta–Gupta, Theorem 2.1, p. 61; the route through a Gaussian matrix is proved
here.)

### Examples

For three points of `ℝ^3` and `ε = 1/2`, `4 log 3 / g(1/2) = 48 log 3 ≈ 52.7`: a linear map to
`ℝ^53` keeps the three squared distances within a factor `[1/2, 3/2]`, which is no saving in
dimension; the lemma pays off when `log n / ε²` is much smaller than `d`.

### Dependencies

Layer 1 depends on Mathlib (Gaussian laws, independence, Chernoff bounds) and on Tau Ceti's
chi-squared law; 1.2 uses 1.1 and 1.3 uses 1.2.

## Layer 2: sign and sparse projections

### 2.1 The entry laws

Define `sparseSignMeasure`, the law with mass `1/6` at `√3`, mass `2/3` at `0` and mass `1/6` at
`−√3`, and `IsJLEntryLaw ν`: `ν` is `gaussianReal 0 1`, `rademacherMeasure` or
`sparseSignMeasure`.

- The sparse sign law is a probability measure, symmetric, with mean `0`, variance `1` and
  fourth moment `3`, the values of the standard Gaussian.
- Its even moments are `E r^(2m) = 3^(m−1)` for `m ≥ 1`; those of the Rademacher law are `1`
  (`integral_pow_rademacherMeasure`). Both are at most `(2m − 1)!!`, the even moments of the
  standard Gaussian.

**Checks.**
- `E r^6 = 9` for the sparse sign law and `15` for the standard Gaussian, so the comparison of
  moments is strict from `m = 3` on.
- The plausible variant with mass `1/6` at `±1` and `2/3` at `0` has variance `1/3`, not `1`; with
  it the sketch would estimate `‖x‖²/3` (see the Check of 2.2).

*Needs:* Mathlib `Measure.dirac`; Tau Ceti `rademacherMeasure`, `integral_pow_rademacherMeasure`.
(Proved here.)

### 2.2 The distributional lemma for sign and sparse sign matrices

Prove `sign_jl_tail`: if `R` is a `k × d` random matrix with independent entries, all with law
`rademacherMeasure` or all with law `sparseSignMeasure`, then for every `x ∈ ℝ^d` and `ε > 0`,
`P(|‖Rx‖²/k − ‖x‖²| > ε‖x‖²) ≤ 2 exp(−k g(ε)/2)`, the bound of 1.2. The theorem is due to
Achlioptas (2001), who proves the one-sided forms for unit vectors.

Route: scale to `‖x‖ = 1` (for `x = 0` the event is empty). The rows of `R` give independent
copies of `Q = ∑ⱼ rⱼxⱼ`. Expanding `E Q^(2m)` as a sum over monomials, the terms with an odd
exponent vanish by symmetry and each remaining term is at most the corresponding Gaussian term by
2.1, so `E Q^(2m) ≤ (2m − 1)!!`, the moments of a standard Gaussian. Summing the exponential series
term by term, `E exp(hQ²) ≤ (1 − 2h)^(−1/2)` for `0 ≤ h < 1/2`, and the upper tail follows as in
1.1 with `h = ε/(2(1 + ε))`, giving `exp(−k(ε − log(1 + ε))/2) ≤ exp(−k g(ε)/2)`. For the lower
tail, `e^(−u) ≤ 1 − u + u²/2` for `u ≥ 0`, together with `E Q² = 1` and `E Q⁴ ≤ 3`, gives
`E exp(−hQ²) ≤ 1 − h + 3h²/2`. With `h = ε/(2(1 + ε))` and `0 < ε < 1` the inequality
`(1 − h + 3h²/2) exp(h(1 − ε)) ≤ exp(−g(ε)/2)` holds (the logarithm of the left side minus that
of the right side is `−ε³/48 + O(ε⁴)` and stays negative on `(0, 1]`); for `ε ≥ 1` the lower event is
empty.

**Checks.**
- `d = 1`, Rademacher entries: `‖Rx‖²/k = x₁²` exactly for every `k ≥ 1`, so the probability is
  `0`, below the Gaussian probability `≈ 0.0253` at `k = 40`, `ε = 1/2`.
- With the variant law of 2.1 (`±1` with probability `1/6` each), `d = 1`, `x = 1`, `k = 40`,
  `ε = 1/2`, the sketch is `B/40` with `B` binomial with parameters `40` and `1/3`, and the
  probability of the event is `P(B < 20) ≈ 0.979`, above the bound `2e^(−5/3) ≈ 0.378`.
- `E Q⁴ = 3 − 2∑ⱼ xⱼ⁴` for Rademacher entries and `E Q⁴ = 3` for sparse sign entries, for
  `‖x‖ = 1`.

*Needs:* 1.1 (the optimisation of the Chernoff bound), 2.1; Mathlib `measure_ge_le_exp_mul_mgf`,
`measure_le_le_exp_mul_mgf`, `iIndepFun.mgf_sum`, `iIndepFun.integral_prod_comp`,
`lintegral_tsum`; Tau Ceti `integral_pow_rademacherMeasure`. (Proved here; the route follows
Achlioptas.)

### 2.3 Finite sets, for the three laws

Prove `jl_finite_set`: if `IsJLEntryLaw ν` and `R` is a `k × d` random matrix with independent
entries of law `ν`, then for `n` points `x₁, …, xₙ` of `ℝ^d`, `0 < ε < 1`, every real `β` and
`k ≥ (4 + 2β) log n / g(ε)`, the probability that
`|‖R(xᵢ − xⱼ)‖²/k − ‖xᵢ − xⱼ‖²| ≤ ε‖xᵢ − xⱼ‖²` for all `i`, `j` is at least `1 − n^(−β)`. For the
two discrete laws and `β > 0` this is Achlioptas' theorem; for `β ≤ 0` it says nothing.

Route: by 1.2 or 2.2 each pair fails with probability at most
`2 exp(−k g(ε)/2) ≤ 2 n^(−(2+β))`, and the union bound over `n(n − 1)/2` pairs gives at most
`n(n − 1) n^(−(2+β)) ≤ n^(−β)`.

**Checks.**
- `ε = 1/2`, `n = 100`, `β = 1`: the condition is `k ≥ 72 log 100 ≈ 331.6`, so `k = 332` gives
  probability at least `0.99`.
- `n = 0` and `n = 1`: there is no pair of distinct points and the event is everything; the
  bounds `1 − 0^(−β)` and `1 − 1` are at most `1`.
- The hypothesis `ε < 1` cannot be dropped: for `ε = 2`, Gaussian entries, `n = 2`, `β = 4`, the
  condition reads `k ≥ 12 log 2 / (2 − 8/3) ≈ −12.5`, so `k = 1` is allowed; the event is
  `χ²₁ ≤ 3`, of probability `≈ 0.917`, below `1 − 2^(−4) = 0.9375`.

*Needs:* 1.2, 2.1, 2.2. (Proved here; Achlioptas proves the case of the two discrete laws.)

### Examples

A `332 × d` matrix of independent random signs, divided by `√332`, keeps all squared distances
among any `100` points of `ℝ^d` within the factor `[1/2, 3/2]` with probability at least `0.99`,
whatever `d` is.

### Dependencies

2.2 uses 1.1 and 2.1; 2.3 uses 1.2, 2.1 and 2.2. Mathlib Chernoff bounds and independence; Tau
Ceti's Rademacher law.

## Layer 3: trace estimators

### 3.1 Hutchinson's identities

Let `z` be a random vector of `ℝⁿ` with independent coordinates of law `rademacherMeasure`.

- `integral_hutchinson`: for every real `n × n` matrix `A`, `E[zᵀAz] = tr A`.
- `variance_hutchinson`: if `A` is symmetric, `Var(zᵀAz) = 2(‖A‖_F² − ∑ᵢ Aᵢᵢ²)`.

(Avron–Toledo, Lemma 1, p. 2, where it is attributed to Hutchinson and stated for symmetric `A`
with `tr A ≠ 0`; the condition on the trace is not needed.)

Route: `zᵀAz = ∑ᵢ ∑ⱼ Aᵢⱼ zᵢ zⱼ` and `zᵢ² = 1`, so `zᵀAz = tr A + ∑_(i≠j) Aᵢⱼ zᵢ zⱼ`. The products
`zᵢ zⱼ` with `i ≠ j` have mean `0`, and two of them, for unordered pairs `{i, j}` and `{k, l}`, are
uncorrelated unless the pairs coincide, when the product is `1`. By symmetry of `A` each unordered
pair contributes `(2Aᵢⱼ)²`, which sums to `2(‖A‖_F² − ∑ᵢ Aᵢᵢ²)`.

For standard Gaussian `z` the mean is again `tr A` and the variance of `zᵀAz` is `2‖A‖_F²` for
symmetric `A` (Avron–Toledo, Lemma 9, p. 6). This is not a target: `zzᵀ` has the law
`wishartGramMeasure 1 1`, and Tau Ceti's `integral_trace_mul_wishartGramMeasure` and
`variance_trace_mul_wishartGramMeasure` give mean `tr A` and variance `2 tr(A²) = 2‖A‖_F²`.

**Checks.**
- `A = [[1, 1], [1, 1]]`: `zᵀAz = (z₁ + z₂)²` takes the values `4` and `0` with probability `1/2`
  each; mean `2 = tr A`, variance `4 = 2(4 − 2)`.
- For a diagonal `A` the estimator equals `tr A` and the variance is `0`.
- The all-ones `3 × 3` matrix: variance `12 = 2(9 − 3)`. With Gaussian `z` the variance of the
  same quadratic form is `2 · 9 = 18`.
- Symmetry is needed for the variance: for `A` with the single nonzero entry `A₁₂ = 1`,
  `zᵀAz = z₁z₂` has variance `1`, while the formula would give `2`. Its mean is `0 = tr A`, so the
  mean needs no symmetry.

*Needs:* Mathlib `iIndepFun`, `HasLaw`, `iIndepFun.integral_prod_comp`, `variance`; Tau Ceti
`rademacherMeasure`, `integral_pow_rademacherMeasure`. (Avron–Toledo, Lemma 1, p. 2.)

### 3.2 The Gaussian estimator of the trace of a positive semidefinite matrix

Prove `gaussian_trace_estimator_tail`: let `A` be a positive semidefinite `n × n` matrix and let
`z₁, …, z_M` be random vectors of `ℝⁿ` whose `Mn` coordinates are independent standard Gaussians.
For every `ε > 0`,
`P(|M⁻¹ ∑ₘ zₘᵀAzₘ − tr A| > ε tr A) ≤ 2 exp(−M g(ε)/2)`.

Route: let `λ₁, …, λₙ ≥ 0` be the eigenvalues of `A` and `τ = tr A = ∑ λⱼ`. The vector `zₘ` has
the law `stdGaussian` (`stdGaussian_eq_map_pi_orthonormalBasis` with the standard basis), so
`E exp(t zₘᵀAzₘ) = ∏ⱼ (1 − 2tλⱼ)^(−1/2)` on its domain
(`mgf_inner_toEuclideanLin_stdGaussian`). For numbers `aⱼ ∈ [0, 1]`,
`∏ (1 − aⱼ) ≥ 1 − ∑ aⱼ`, and for `aⱼ ≥ 0`, `∏ (1 + aⱼ) ≥ 1 + ∑ aⱼ` (induction on the number of
factors); hence `E exp(t zₘᵀAzₘ) ≤ (1 − 2tτ)^(−1/2)` for `0 ≤ t < 1/(2τ)` and
`E exp(−t zₘᵀAzₘ) ≤ (1 + 2tτ)^(−1/2)` for `t ≥ 0`. These are the moment generating functions of
`τ` times a `χ²₁` variable, and the computation of 1.1 with `M` independent probes
(`iIndepFun.mgf_sum`) and the estimates of 1.2 give the bound. If `τ = 0` then `A = 0` and the
event is empty; for `ε ≥ 1` the lower event is empty, the average being nonnegative.

For `0 < ε < 3/2`, where `g(ε) > 0`, and `δ > 0`, the bound `2 exp(−M g(ε)/2)` is at most `δ`, so
that the relative accuracy is `ε` with probability at least `1 − δ`, once
`M ≥ 2 log(2/δ)/g(ε)`; in particular once `M ≥ 12 ε⁻² log(2/δ)` for `0 < ε < 1`, since then
`g(ε) ≥ ε²/6`; Avron and Toledo prove the same conclusion for `M ≥ 20 ε⁻² log(2/δ)`
(Avron–Toledo, Theorem 10, p. 6).

**Checks.**
- Rank one, `A = e₁e₁ᵀ`: the average is `χ²_M/M` and the statement is 1.2 with `k = M`, `d = 1`;
  for `M = 40`, `ε = 1/2` the probability is `≈ 0.0253` and the bound `2e^(−5/3) ≈ 0.378`.
- Positive semidefiniteness is needed: for `A = diag(1, −1)`, `tr A = 0` and the average is a
  difference of two independent `χ²_M/M` variables, almost surely nonzero, so the event has
  probability `1`, above the bound `≈ 0.378` at `M = 40`, `ε = 1/2`.
- `M = 0`: the average is `0` and, for `tr A > 0` and `ε < 1`, the event is everything; the bound
  is `2`.

*Needs:* 1.1, 1.2; Mathlib `stdGaussian_eq_map_pi_orthonormalBasis`, `EuclideanSpace.basisFun`,
`Matrix.PosSemidef.eigenvalues_nonneg`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`iIndepFun.mgf_sum`, `measure_ge_le_exp_mul_mgf`, `measure_le_le_exp_mul_mgf`; Tau Ceti
`mgf_inner_toEuclideanLin_stdGaussian`. (Proved here; compare Avron–Toledo, Theorem 10, p. 6.)

### Examples

For the `n × n` identity matrix and a vector `z` of random signs, `zᵀz = n` and Hutchinson's
estimator is exact; for a standard Gaussian `z`, `zᵀz` has the law `χ²ₙ` and variance `2n`.

### Dependencies

3.1 depends on no other layer. 3.2 uses 1.1 and 1.2. Mathlib Gaussian laws and spectral theorem;
Tau Ceti's Rademacher law, Wishart moments (cited, not consumed by a target) and Gaussian
quadratic forms.

## Layer 4: CountSketch

### 4.1 The CountSketch matrix and its randomness

Define `countSketchMatrix h σ` for `h : Fin d → Fin k` and `σ : Fin d → ℝ`: the `k × d` matrix
whose column `j` has the single entry `σ j` in row `h j` and zeros elsewhere. So
`(Sx)ᵢ = ∑_(j : h j = i) σⱼ xⱼ`.

Define the two hypotheses on random `h : Ω → Fin d → Fin k` and `σ : Ω → Fin d → ℝ`:

- `HasKWiseIndepSigns μ σ m`: every `σ j` has law `rademacherMeasure`, and every family of at most
  `m` of the `σ j` is mutually independent.
- `HasPairwiseUniformBuckets μ h`: every `h j` has the uniform law `uniformOn Set.univ` on
  `Fin k`, and `h j`, `h l` are independent for `j ≠ l`.

These are the only properties of hash functions used here; families of hash functions with them
are not constructed.

**Checks.**
- `d = 4`, `k = 3`, `h = (1, 3, 1, 2)` (rows numbered from `1`), `σ = (1, 1, −1, −1)`: the matrix
  has rows `(1, 0, −1, 0)`, `(0, 0, 0, −1)` and `(0, 1, 0, 0)`; for `x = (1, 1, 1, 1)`,
  `Sx = (0, −1, 1)` and `‖Sx‖² = 2`, against `‖x‖² = 4`.
- `‖S eⱼ‖² = σⱼ² = 1` for every `j` and every outcome.
- Independent uniform `h` and independent signs satisfy both hypotheses for every `m`. Three
  independent signs with `σ₄ = σ₁σ₂σ₃` satisfy `HasKWiseIndepSigns μ σ 3` but not
  `HasKWiseIndepSigns μ σ 4`, since `E[σ₁σ₂σ₃σ₄] = 1`.

*Needs:* Mathlib `HasLaw`, `iIndepFun`, `IndepFun`, `uniformOn`; Tau Ceti `rademacherMeasure`.
(Proved here.)

### 4.2 The first two moments of the squared norm

- `integral_countSketch`: if `h` is almost everywhere measurable, `h` and `σ` are independent,
  and `HasKWiseIndepSigns μ σ 2`, then `E‖Sx‖² = ‖x‖²` for every `x ∈ ℝ^d`. No hypothesis on the
  law of `h` is needed.
- `variance_countSketch`: if moreover `HasPairwiseUniformBuckets μ h` and
  `HasKWiseIndepSigns μ σ 4`, then `Var ‖Sx‖² = (2/k)(‖x‖⁴ − ∑ⱼ xⱼ⁴)`, in particular at most
  `2‖x‖⁴/k`.

(Woodruff, Theorem 14, p. 23, proved on pp. 23–24, for unit vectors and in the form
`E‖Sx‖⁴ ≤ 1 + 2/k`; the identity is the last equality of the computation of `E‖Sx‖⁴` in that
proof. Woodruff attributes the statement to Thorup and Zhang. The matrix is the count sketch of
Charikar, Chen and Farach-Colton.)

Route: `‖Sx‖² = ∑ⱼ xⱼ² + ∑_(j≠l) [h j = h l] σⱼσₗ xⱼxₗ`. By independence of `h` and `σ`, the
mean of the second sum is `∑_(j≠l) P(h j = h l) E[σⱼσₗ] xⱼxₗ = 0`. For the variance, expand the
square of the second sum: `E[σⱼσₗσⱼ'σₗ']`, for `j ≠ l` and `j' ≠ l'`, is `1` when
`{j, l} = {j', l'}` and `0` otherwise (pairwise independence when the two pairs share one index,
4-wise independence when they share none), and `P(h j = h l) = 1/k` for `j ≠ l` by pairwise
independence and uniformity; so the variance is `(2/k) ∑_(j≠l) xⱼ²xₗ²`.

**Checks.**
- `x = (1, 1)`: for `k = 1`, `‖Sx‖² = (σ₁ + σ₂)²` has variance `4 = 2(4 − 2)`; for `k = 2` the
  variance is `2`.
- `x = eⱼ`: `‖Sx‖² = 1` and both sides of the variance identity are `0`.
- 4-wise independence is needed: with `d = 4`, `k = 1`, `x = (1, 1, 1, 1)` and the signs
  `σ₄ = σ₁σ₂σ₃` of 4.1, `‖Sx‖² = (σ₁ + σ₂ + σ₃ + σ₄)²` has mean `4` but variance `48`, while the
  formula gives `2(16 − 4) = 24`.
- Pairwise independence is needed for the mean: with `σ₂ = σ₁`, `d = 2`, `k = 1`,
  `x = (1, 1)`, `‖Sx‖² = 4` while `‖x‖² = 2`.
- `d = 0`: both sides are `0`.

*Needs:* 4.1; Mathlib `IndepFun.integral_mul_eq_mul_integral`, `iIndepFun.integral_prod_comp`,
`variance`; Tau Ceti `integral_pow_rademacherMeasure`. (Woodruff, Theorem 14, p. 23.)

### Examples

For `d = 3`, `x = (1, 2, 3)` and `k = 2`, `‖x‖² = 14` and `∑ xⱼ⁴ = 98`, so
`Var ‖Sx‖² = (196 − 98) = 98`, with standard deviation about `9.9`.

### Dependencies

Layer 4 depends on no other layer: Mathlib independence and uniform laws, Tau Ceti's Rademacher
law.

## Layer 5: subspace embeddings and sketch-and-solve

### 5.1 Subspace embeddings

Define `IsSubspaceEmbedding S V ε` for a `k × n` matrix `S`, a subspace `V` of `ℝⁿ` and a real
`ε`: for every `y ∈ V`, `(1 − ε)‖y‖² ≤ ‖Sy‖² ≤ (1 + ε)‖y‖²` (Woodruff, Definition 1, p. 10, for
the column space of a matrix).

**Checks.**
- The identity matrix is an `ε`-subspace embedding of every subspace for every `ε ≥ 0`; the zero
  matrix is a `1`-subspace embedding of every subspace and an `ε`-subspace embedding of no
  nonzero subspace when `ε < 1`.
- `S = [[1, 0], [0, 2]]` is a `3`-subspace embedding of `ℝ²` and a `0`-subspace embedding of the
  first axis; it is not an `ε`-subspace embedding of `ℝ²` for `ε < 3`, because of `e₂`.
- The definition bounds squared norms: `S = √2 · I` is a `1`-subspace embedding of `ℝⁿ`, while the
  same condition on norms, `‖Sy‖ ≤ (1 + ε)‖y‖`, holds with `ε = √2 − 1 ≈ 0.414`.

*Needs:* Mathlib `Submodule`, `Matrix.mulVec`, `dotProduct`. (Woodruff, Definition 1, p. 10.)

### 5.2 Sketch-and-solve

Prove `sketch_and_solve`: let `A` be an `n × p` matrix, `b ∈ ℝⁿ`, `C` a set of vectors of `ℝᵖ` and
`ε < 1`. If `S` is an `ε`-subspace embedding of the span of the columns of `A` and of `b`, and
`x̃ ∈ ℝᵖ` satisfies `‖S(Ax̃ − b)‖² ≤ ‖S(Ax − b)‖²` for every `x ∈ C`, then
`‖Ax̃ − b‖² ≤ ((1 + ε)/(1 − ε)) ‖Ax − b‖²` for every `x ∈ C`. Membership of `x̃` in `C` is not
needed; with `x̃ ∈ C` it says that `x̃` is a `(1 + ε)/(1 − ε)`-approximate minimiser of
`‖Ax − b‖²` on `C`.

Route: every `Ax − b` lies in the span, so
`(1 − ε)‖Ax̃ − b‖² ≤ ‖S(Ax̃ − b)‖² ≤ ‖S(Ax − b)‖² ≤ (1 + ε)‖Ax − b‖²`, and `1 − ε > 0`. (Woodruff,
proof of Theorem 21, p. 32, and Corollary 22, p. 32, for constrained regression. There the
conclusion is stated with the factor `1 + ε` on norms, while the embedding property gives the
factor `√((1 + ε)/(1 − ε))`, which exceeds `1 + ε` for `0 < ε < 1`, so `ε` must be rescaled; the
factor here on squared norms is the one the argument gives.)

**Checks.**
- `ε = 0` and `S` with orthonormal columns: `‖S(Ax − b)‖ = ‖Ax − b‖` and `x̃` is an exact
  minimiser.
- An example where the factor exceeds `1`: `n = 2`, `p = 1`, `A = e₁`, `b = e₂`, `C = ℝ`, and `S`
  the symmetric square root of `[[1, ε], [ε, 1]]` with `0 < ε < 1`, an `ε`-subspace embedding of
  `ℝ²`. Then `‖S(xe₁ − e₂)‖² = x² − 2εx + 1` is least at `x̃ = ε`, where `‖Ax̃ − b‖² = 1 + ε²`,
  while the least value of `‖Ax − b‖² = x² + 1` is `1`; for `ε = 1/2`, `1.25 ≤ 3`.
- `ε < 1` is needed: `S = 0` is a `1`-subspace embedding and every `x̃` minimises the sketched
  residual `0`. With `A = e₁`, `b = e₂` and `C = ℝ` the least value of `‖Ax − b‖²` is `1`, while
  `‖Ax̃ − b‖² = x̃² + 1` is unbounded in `x̃`, so no factor works; the factor `2/0` is `0` under
  Mathlib's division.

*Needs:* 5.1; Mathlib `IsMinOn`, `LinearMap.range`, `Matrix.mulVecLin`, `Submodule.span`.
(Woodruff, proof of Theorem 21, p. 32, and Corollary 22, p. 32.)

### Examples

If `S` is an `ε`-subspace embedding of the span of the columns of `A` and of `b` with `ε = 0.1`,
any minimiser of the sketched residual has squared residual within the factor `1.1/0.9 ≈ 1.222`
of the least squared residual.

### Dependencies

5.2 uses 5.1. Layer 5 depends on no other layer.

## Scope and ownership

This roadmap owns the chi-squared tail bounds in rate-function form (1.1); the distributional
and finite-set Johnson–Lindenstrauss lemmas for Gaussian, sign and sparse sign matrices and the
existence of an embedding (1.2, 1.3, 2.1–2.3); Hutchinson's identities for random signs (3.1) and
the tail bound of the Gaussian trace estimator for positive semidefinite matrices (3.2); the
CountSketch matrix, its independence hypotheses and the mean and variance of `‖Sx‖²` (Layer 4);
and subspace embeddings with the sketch-and-solve inequality (Layer 5).

Already in the libraries and therefore not targets:

- The chi-squared law with its moment generating function, its point mass at degree `0` and the
  law of a sum of squares of independent standard Gaussians (Tau Ceti
  `TauCeti/Probability/Distributions/ChiSquared/Basic.lean` and
  `TauCeti/Probability/Distributions/Gaussian/ChiSquared.lean`); the Rademacher law and its
  moments (`TauCeti/Probability/Distributions/Rademacher/Basic.lean`); the moment generating
  function of a Gaussian quadratic form
  (`TauCeti/Probability/Distributions/Gaussian/QuadraticForm.lean`).
- The mean `tr A` and variance `2‖A‖_F²` of `zᵀAz` for standard Gaussian `z` and symmetric `A`,
  and for the average over `M` probes the mean `tr A` and variance `2‖A‖_F²/M`: these are the
  trace statistics of the Wishart law `wishartGramMeasure M 1` in Tau Ceti
  (`integral_trace_mul_wishartGramMeasure`, `variance_trace_mul_wishartGramMeasure`, in
  `TauCeti/Probability/Distributions/Wishart/Moments.lean`).
- Chernoff bounds, Gaussian laws, independence and laws of random variables (Mathlib).

Stated by roadmaps on main and not restated here:

- MathematicalStatisticsHighDimensional 1.2 states chi-squared tails in the sub-gamma form `P(Z − k ≥ 2√(kt) + 2t) ≤ e^(−t)` and `P(k − Z > 2√(kt)) ≤ e^(−t)`. The
  bounds of 1.1 above are the optimised Chernoff bounds in rate-function form; they are a different
  statement and neither is derived from the other here. The sub-gamma upper tail cannot give the
  constant of 1.2 above: it bounds `P(Z ≥ (1 + ε)k)` by `exp(−k(√(1 + 2ε) − 1)²/4)`, and at
  `ε = 0.1` this exponent is `≈ 0.002277 k`, below `k g(0.1)/2 ≈ 0.002333 k`. Its 1.1 (sub-Gaussian vectors) and 2.4
  (the restricted isometry property of sub-Gaussian designs, by a union bound over supports) are
  not used.
- RandomMatrices 2.3 states the Hanson–Wright inequality for quadratic forms in independent
  sub-Gaussian coordinates, with an absolute constant; its consequences for Hutchinson's estimator
  with random signs are not stated here. RandomMatrices 2.4 (nets and norms of rectangular
  matrices) and 2.6 (matrix Bernstein and Chernoff inequalities) are not used.
- The elementary matrix concentration of OperatorTheory/MatrixSpectralStatistics, Part C, and of
  Tau Ceti's `TauCeti/Probability/Moments/MatrixConcentration.lean` is not used.

GaussianLinearModels (an open roadmap, not on main) states in its 2.2 the mean of a quadratic
form `E ⟪Y, A Y⟫ = tr (A S) + ⟪μ, A μ⟫` for a centred vector with covariance `S` shifted by `μ`.
The mean identity of 3.1 is its case `μ = 0`, `S = 1` for a vector with independent Rademacher
coordinates; it is kept here in coordinates as the first half of Hutchinson's lemma, whose
second half, the variance, is specific to Rademacher signs. This roadmap does not depend on that
one.

Not treated here: random subspace embeddings (a Gaussian matrix, a sparse embedding with
`O(d²/ε²)` rows, or leverage-score sampling as a subspace embedding of a fixed `d`-dimensional
subspace), the randomized range finder and low-rank approximation, fast Johnson–Lindenstrauss
transforms, lower bounds on the dimension `k`, sub-Gaussian entry laws in general, families of
hash functions and their constructions (universal and `m`-wise independent families), Bloom
filters, count-min sketches and the median estimator of frequencies, and any streaming model.
No algorithm, running time, storage bound or number of random bits is a target.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw X ν μ` (`X` is almost everywhere
  measurable and `μ.map X = ν`).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun` (mutual
  independence of a family of functions), `ProbabilityTheory.IndepFun`, and
  `ProbabilityTheory.iIndepFun_iff_map_fun_eq_pi_map` (for a finite family of almost everywhere
  measurable functions under a probability measure, mutual independence is equivalent to the
  joint law being the product of the marginal laws), used for functions of disjoint sets of
  entries.
- `Mathlib/Probability/Independence/Integration.lean`:
  `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral` (for two independent almost
  everywhere strongly measurable functions, the mean of the product is the product of the means)
  and `ProbabilityTheory.iIndepFun.integral_prod_comp` (for a finite independent family of almost
  everywhere measurable functions, the mean of a product of functions of its members is the
  product of the means).
- `Mathlib/Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf`;
  `ProbabilityTheory.measure_ge_le_exp_mul_mgf` (for `t ≥ 0` and `exp(tX)` integrable,
  `μ.real {ε ≤ X} ≤ exp(−tε) mgf X μ t`) and `ProbabilityTheory.measure_le_le_exp_mul_mgf` (the
  same for `t ≤ 0` and `{X ≤ ε}`, finite measure); `ProbabilityTheory.iIndepFun.mgf_sum` (for an
  independent family of measurable real variables, the moment generating function of a finite
  sum is the product of the moment generating functions; for almost everywhere measurable
  variables it is applied to measurable modifications).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`, written `Var[X; μ]`.
- `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal m v`
  (mean `m`, variance `v : ℝ≥0`); `ProbabilityTheory.gaussianReal_map_const_mul` (the image under
  `x ↦ cx` is `gaussianReal (cm) (c²v)`); `ProbabilityTheory.gaussianReal_conv_gaussianReal`
  (convolution adds means and variances).
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`:
  `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis` (the standard Gaussian of a
  finite-dimensional inner product space is the image of the product of standard Gaussian laws
  under the coordinates of any orthonormal basis); `EuclideanSpace.basisFun` (the standard
  orthonormal basis).
- `Mathlib/Probability/UniformOn.lean`: `ProbabilityTheory.uniformOn` (counting measure
  conditioned on a set).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `MeasureTheory.lintegral_tsum` (the integral
  of a countable sum of almost everywhere measurable nonnegative functions is the sum of the
  integrals).
- Matrices: `Matrix.mulVec`, `dotProduct`, `Matrix.trace`, `Matrix.IsSymm`, `Matrix.PosSemidef`,
  `Matrix.mulVecLin`; `Matrix.PosSemidef.eigenvalues_nonneg` (the eigenvalues of a positive
  semidefinite matrix are nonnegative) and `Matrix.IsHermitian.trace_eq_sum_eigenvalues`.
- `IsMinOn f C a` (`f a ≤ f x` for every `x ∈ C`), `LinearMap.range`, `Submodule.span`,
  `Measure.dirac`.

### From Tau Ceti

- `TauCeti/Probability/Distributions/ChiSquared/Basic.lean`:
  `TauCeti.Probability.chiSquaredMeasure k` (for `k > 0` the gamma law of shape `k/2` and rate
  `1/2`; `chiSquaredMeasure_zero`: the point mass at `0` for `k = 0`);
  `TauCeti.Probability.mgf_id_chiSquaredMeasure` (for `k ≥ 0` and `t < 1/2`, the moment generating
  function is `(1 − 2t)^(−k/2)`); `TauCeti.Probability.ae_nonneg_chiSquaredMeasure`;
  `TauCeti.Probability.chiSquaredMeasure_singleton` (for `k > 0`, singletons are null).
- `TauCeti/Probability/Distributions/Gaussian/ChiSquared.lean`:
  `TauCeti.Probability.iIndepFun.hasLaw_sum_sq_gaussian` (a finite sum of squares of independent
  standard Gaussian variables has the law `chiSquaredMeasure` of the number of terms, the empty
  sum included).
- `TauCeti/Probability/Distributions/Gaussian/QuadraticForm.lean`:
  `TauCeti.Probability.mgf_inner_toEuclideanLin_stdGaussian` (for a real symmetric `B` and `t` with
  `2tλ < 1` for every eigenvalue `λ`, the moment generating function of `x ↦ ⟪x, Bx⟫` under the
  standard Gaussian is `∏ⱼ (1 − 2tλⱼ)^(−1/2)`).
- `TauCeti/Probability/Distributions/Rademacher/Basic.lean`:
  `TauCeti.Probability.rademacherMeasure` (mass `1/2` at `±1`) and
  `TauCeti.Probability.integral_pow_rademacherMeasure` (the `n`th moment is `1` for even `n` and
  `0` for odd `n`).
- `TauCeti/Probability/Distributions/Wishart/Moments.lean`, cited in 3.1 and in the scope above
  and consumed by no target: `TauCeti.Probability.integral_trace_mul_wishartGramMeasure` (for
  positive semidefinite `S` and symmetric `Θ`, the mean of `tr(ΘW)` under
  `wishartGramMeasure ν S` is `ν tr(ΘS)`) and
  `TauCeti.Probability.variance_trace_mul_wishartGramMeasure` (its variance is
  `2ν tr(ΘSΘS)`).

## References

- Sanjoy Dasgupta and Anupam Gupta, *An elementary proof of a theorem of Johnson and
  Lindenstrauss*, Random Structures and Algorithms 22 (2003), 60–65; the published version,
  available from the first author's page. Page numbers are those of the journal.
- David P. Woodruff, *Sketching as a Tool for Numerical Linear Algebra*, Foundations and Trends in
  Theoretical Computer Science 10 (2014); arXiv:1411.4357, version 3 of February 2015, whose
  numbering and page numbers are used above.
- Haim Avron and Sivan Toledo, *Randomized algorithms for estimating the trace of an implicit
  symmetric positive semi-definite matrix*, Journal of the ACM 58 (2011), Article 8; the preprint
  available from the second author's page, whose numbering and page numbers are used above.
- Attributions made in prose without a locator: William B. Johnson and Joram Lindenstrauss (the
  embedding lemma, 1984); Dimitris Achlioptas, *Database-friendly random projections* (2001) and its
  journal version *Database-friendly random projections: Johnson–Lindenstrauss with binary coins*
  (2003) (sign and sparse sign matrices); Michael F.
  Hutchinson (the trace estimator, 1989); Moses Charikar, Kevin Chen and Martin Farach-Colton
  (the count sketch, 2002); Mikkel Thorup and Yin Zhang (the second moment of the sketch with
  4-wise independent signs); Tamás Sarlós (subspace embeddings for regression, 2006).

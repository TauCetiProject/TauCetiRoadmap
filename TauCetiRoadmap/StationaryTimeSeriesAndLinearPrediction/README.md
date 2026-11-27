# Roadmap: stationary time series and linear prediction

**Summary.** A time series here is a family `X : ℤ → E` of vectors in a real inner product
space, indexed by time; for centred square-integrable random variables `E` is `L²` and the inner
product is the covariance. The series is second-order stationary when `⟪X s, X t⟫` depends only
on `t - s`, and its autocovariance is `γ(h) = ⟪X 0, X h⟫`. This roadmap develops the linear
prediction theory of such series: prediction of `X t` from finitely many past values, the
recursion that computes the predictors, partial autocorrelations, autoregressive equations and
their causal solutions, and the Wold decomposition.

The headline theorems are these, each for a second-order stationary series unless said otherwise.

- *Yule–Walker equations.* A combination `∑ a_j X(t − 1 − j)` of the `n` preceding values is a
  best linear predictor of `X t` exactly when `a` solves `∑_j γ(i − j) a_j = γ(i + 1)`, also when
  that system is singular; the squared error is then `γ(0) − ∑_j a_j γ(j + 1)`. The determinant
  of the autocovariance matrix of size `n` is the product of the one-step prediction errors from
  `0, 1, …, n − 1` past values, and if `γ(0) > 0` and `γ(h) → 0` every such matrix is positive
  definite.
- *Durbin–Levinson recursion.* For any family whose autocovariance matrix of size `n + 1` is
  positive definite, the Yule–Walker coefficients of order `n + 1` and their error come from those
  of order `n` by the classical update. For a stationary series the last coefficient is the
  partial autocorrelation at lag `n + 1`, and the matrix of size `n + 2` is positive definite
  exactly when that of size `n + 1` is and this partial autocorrelation lies in `(−1, 1)`.
- *Causal autoregressions.* For white noise `Z` of positive variance in a Hilbert space and a
  real polynomial `φ`, the equation `∑_k φ_k X(t − k) = Z t` has a solution
  `X t = ∑_j ψ_j Z(t − j)` with `ψ` absolutely summable if and only if `φ` has no zero in the
  closed unit disc; then every bounded solution is this one.
- *Wold decomposition.* In a Hilbert space, if the innovation `Z t`, the part of `X t` orthogonal
  to the closed span of the past, is not zero, then `Z` is white noise and
  `X t = ∑_j ψ_j Z(t − j) + V t` with `ψ_0 = 1`, `ψ` square summable, and `V t` orthogonal to
  every innovation and lying in the closed span of the past at every time.

The roadmap builds on Mathlib's orthogonal projections, Gram matrices, Schur complements and
polynomial factorization over `ℂ`. It takes second-order stationarity in the sense of
MathematicalStatisticsFoundations, which owns the definition and the positive semidefiniteness
of autocovariance matrices. It sits beside KalmanFiltering, whose innovations come from a
state-space model.

Layer 1 treats prediction from `n` past values. Layer 2 gives the Durbin–Levinson recursion
and partial autocorrelations, on Layer 1. Layer 3 treats autoregressive equations and the Wold
decomposition, on Layer 1.

## Conventions

- `E` is a real inner product space with inner product `⟪x, y⟫`; Layer 3 assumes `E` complete
  where it says so. A time series is `X : ℤ → E`. For square-integrable real random variables of
  mean `0`, `E` is `L²` and `⟪X s, X t⟫` is the covariance.
- A combination of the `n` values before time `t` is written `∑_{j < n} a_j X(t − 1 − j)`, so the
  coefficient `a_j` multiplies the value at lag `j + 1`. Vectors of length `n` are indexed by
  `Fin n`; `rev j = n − 1 − j`.
- The autocovariance matrix `Γ_n` has entry `γ(i − j)` in row `i` and column `j`, for
  `i, j < n`; `Γ_0` is the empty matrix, positive definite with determinant `1`. Matrix inverses
  are Mathlib's, so the inverse of a singular matrix is `0`.
- For a polynomial `φ` with real coefficients `φ_k`, the equation `φ(B) X = Z` means
  `∑_{k ≤ deg φ} φ_k X(t − k) = Z t` for every `t`; `φ(z)` is its value at `z ∈ ℂ`. White noise of
  variance `σ²` is a family `Z` with `⟪Z s, Z t⟫ = σ²` if `s = t` and `0` otherwise.
- A best linear predictor from finitely many vectors is a combination of them at least as close
  to the target as every other combination. Square summable means `∑ ψ_j²` converges.

## Layer 1: prediction from finitely many past values

### 1.0 Stationarity, autocovariance and autocovariance matrices

Define `IsSecondOrderStationary X` to mean `⟪X s, X t⟫ = ⟪X 0, X (t − s)⟫` for all `s, t`, the
condition of MathematicalStatisticsFoundations §9.6; `autocov X h = ⟪X 0, X h⟫`; and
`autocovMatrix X n`, the matrix `(γ(i − j))_{i, j < n}`. For a stationary series `γ(−h) = γ(h)`
(take `s = h`, `t = 0`), and `Γ_n` is the Gram matrix of `X 0, …, X (n − 1)`, hence positive
semidefinite (Mathlib `Matrix.posSemidef_gram`; MathematicalStatisticsFoundations §9.6 states the
same for every finite set of times). Weak stationarity of a time series of random variables
(Grandell, Def. 1.4, p. 2, recalled p. 9) is this condition in `L²` for the centred variables.

**Checks.**
- For orthogonal unit vectors `A, B` and real `λ`, `X t = cos(λt) A + sin(λt) B` is stationary
  with `γ(h) = cos(λh)`. For `λ = π` it is `X t = (−1)ᵗ A`, with `γ(h) = (−1)ʰ`.
- `X t = t A` with `A ≠ 0` is not stationary: `‖X 1‖ ≠ ‖X 0‖`.

### 1.1 The Yule–Walker equations

Prove `isLeast_norm_sub_iff_yuleWalker`: let `X` be stationary, `t : ℤ`, `n : ℕ` and
`a : Fin n → ℝ`. Then `∑_j a_j X(t − 1 − j)` is a best linear predictor of `X t` from
`X(t − 1), …, X(t − n)` if and only if `∑_j γ(i − j) a_j = γ(i + 1)` for every `i < n`; and for
every such `a`, `‖X t − ∑_j a_j X(t − 1 − j)‖² = γ(0) − ∑_j a_j γ(j + 1)` (Wang, §5.2,
equation (5.2) and Properties 1–2, pp. 65–66; Grandell, Thm. 4.2, p. 32, under `γ(0) > 0` and `γ(h) → 0`).

Route: the combinations form the span `S` of the `n` past values. By Mathlib's characterization
of the nearest point of a subspace (`Submodule.norm_eq_iInf_iff_real_inner_eq_zero`), a point of
`S` is nearest to `X t` exactly when the difference is orthogonal to each spanning vector
`X(t − 1 − i)`. Expand `⟪X t − ∑_j a_j X(t − 1 − j), X(t − 1 − i)⟫` by stationarity:
`⟪X t, X(t − 1 − i)⟫ = γ(−1 − i) = γ(i + 1)` and
`⟪X(t − 1 − j), X(t − 1 − i)⟫ = γ(j − i) = γ(i − j)`, so orthogonality is the system. For the error,
write `e` for the difference; `‖e‖² = ⟪e, X t⟫` because `e` is orthogonal to `S`, and
`⟪e, X t⟫ = γ(0) − ∑_j a_j γ(j + 1)`.

**Checks.**
- `n = 0`: the only combination is `0`, the system is empty, and the error is `‖X t‖² = γ(0)`.
- For `γ(h) = 2^(−|h|)` (the autoregression `X t = X(t − 1)/2 + Z t` with `σ² = 3/4`), every
  `n ≥ 1` gives `a = (1/2, 0, …, 0)` and error `3/4`.
- Singular system: for `X t = A` with `‖A‖ = 1` and `n = 2`, both equations read `a_0 + a_1 = 1`;
  every solution predicts `A` exactly, and the error formula gives `1 − (a_0 + a_1) = 0`.
- Stationarity is needed: for `X 0 = X 1 = A` with `‖A‖ = 1`, `X 2 = 0`, `t = 2` and `n = 1`, the
  system `γ(0) a = γ(1)` gives `a = 1`, while the best predictor of `X 2 = 0` is `0 · X 1`.

*Needs:* 1.0; Mathlib `Submodule.norm_eq_iInf_iff_real_inner_eq_zero`, `Submodule.span`.

### 1.2 Determinants as products of prediction errors

Prove `det_autocovMatrix_eq_prod`: for stationary `X`, every `t` and every `n`,
`det Γ_n = ∏_{k < n} d_k²`, where `d_k` is the distance from `X t` to the span of
`X(t − 1), …, X(t − k)` (Mathlib `Metric.infDist`). (Wang, §6.5, p. 101, states
`det Γ_n = ν_0 ⋯ ν_{n − 1}` for nonsingular `Γ_n`; the singular case is proved here.)

Route: let `w_k = X(t − 1 − k)` for `k < n`. By stationarity `⟪w_i, w_j⟫ = γ(i − j)`, so `Γ_n`
is the Gram matrix of `w_0, …, w_{n−1}`. A squared distance from `u` to the span of
`v_0, …, v_{k−1}` is a function of the Gram matrix of `(u, v_0, …, v_{k−1})`: by the nearest-point
characterization used in 1.1, it is `‖u‖² − ∑_j a_j ⟪v_j, u⟫` for any solution `a` of
`∑_j ⟪v_i, v_j⟫ a_j = ⟪v_i, u⟫`. By stationarity and `γ(−h) = γ(h)`, the families
`(X t, X(t − 1), …, X(t − k))` and `(w_k, w_{k−1}, …, w_0)` have the same Gram matrix, so the
distance from `w_k` to the span of `w_0, …, w_{k−1}` is `d_k`. It remains to show that the Gram
determinant of `w_0, …, w_k` is `d_k²` times that of `w_0, …, w_{k−1}`. Write `w_k = p + r` with `p`
the nearest point of the span `S` of the earlier vectors and `r ⟂ S`, `‖r‖ = d_k`. Subtracting from
the last row and column the
combinations of the earlier rows and columns that give `p` does not change the determinant and
turns the Gram matrix into the block matrix with blocks the Gram matrix of `w_0, …, w_{k−1}` and
`⟪r, r⟫`. If `d_k = 0` both sides vanish, since then the vectors are dependent and the Gram
determinant is `0` (Mathlib `Matrix.det_gram_ne_zero_iff_linearIndependent`).

**Checks.**
- `X t = Z t + Z(t − 1)` for white noise of variance `1`: `γ = (2, 1, 0, 0, …)`,
  `det Γ_n = n + 1`, and the errors are `d_k² = (k + 2)/(k + 1)`, whose product over `k < n` is
  `n + 1`.
- The cosine series with `λ = π/3`: `γ = (1, 1/2, −1/2, −1, …)`, `det Γ_2 = 3/4 = 1 · 3/4`,
  `det Γ_3 = 0` and `d_2 = 0`, since `X t = X(t − 1) − X(t − 2)`.

*Needs:* 1.0, 1.1; Mathlib `Matrix.gram`, `Matrix.det_gram_ne_zero_iff_linearIndependent`,
`Metric.infDist`, `Submodule.norm_eq_iInf_iff_real_inner_eq_zero`.

### 1.3 Positive definiteness when the autocovariance tends to zero

Prove `posDef_autocovMatrix_of_tendsto_zero`: if `X` is stationary, `γ(0) > 0` and `γ(h) → 0` as
`h → ∞`, then `Γ_n` is positive definite for every `n` (Wang, Prop. 5.1, p. 66; Grandell, p. 32,
which states it without proof). (Proved here.)

Route: suppose some `Γ_n` is not positive definite and let `r` be the largest index with `Γ_r`
positive definite; `r ≥ 1` because `Γ_1 = (γ(0))`. As a Gram matrix (1.0), `Γ_{r+1}` is positive
semidefinite and not positive definite, so `X 0, …, X r` are linearly dependent
(`Matrix.posDef_gram_iff_linearIndependent`) while `X 0, …, X(r − 1)` are independent. Hence
`X r` lies in the span `S` of `X 0, …, X(r − 1)`. A linear relation `∑_j c_j X j = 0` persists
under every time shift, since `‖∑_j c_j X(j + s)‖² = ∑_{i,j} c_i c_j γ(j − i)` does not depend on
`s`; by induction on `m`, `X m ∈ S` for every `m ≥ 0`. Write `X m = ∑_{j < r} b_j X j`. Then
`γ(0) = ‖X m‖² = bᵀ Γ_r b ≥ λ ‖b‖²`, where `λ > 0` is the least eigenvalue of `Γ_r`, so
`‖b‖² ≤ γ(0)/λ` for every `m`. Also `γ(0) = ⟪X m, X m⟫ = ∑_j b_j γ(m − j)`, which by
Cauchy–Schwarz is at most `(γ(0)/λ)^(1/2) (∑_{j < r} γ(m − j)²)^(1/2)`. As `m → ∞` the right side
tends to `0`, contradicting `γ(0) > 0`.

**Checks.**
- `X t = Z t + Z(t − 1)`: `γ(h) = 0` for `|h| ≥ 2`, and `det Γ_n = n + 1 > 0` (1.2).
- The limit hypothesis is needed: the cosine series with `λ = π/3` has `γ(0) = 1` and `Γ_3`
  singular; its `γ(h) = cos(πh/3)` does not tend to `0`.
- `γ(0) > 0` is needed: the zero series has `γ ≡ 0` and `Γ_1 = (0)`.

*Needs:* 1.0; Mathlib `Matrix.posSemidef_gram`, `Matrix.posDef_gram_iff_linearIndependent`,
`Matrix.PosDef`.

### Examples

The autoregression with `γ(h) = 2^(−|h|)`, the series `Z t + Z(t − 1)`, the constant series
`X t = A`, and the cosine series with `λ = π/3`, with their Yule–Walker solutions, determinants
and errors.

### Dependencies

No other layer; the Mathlib declarations of the *Needs:* lines above.

## Layer 2: the Durbin–Levinson recursion and partial autocorrelations

### 2.0 Yule–Walker coefficients and partial autocorrelations

Define `predCoeff X n = Γ_n⁻¹ γ_n`, where `γ_n` has entry `γ(i + 1)` in row `i`; when `Γ_n` is
positive definite it is the unique solution of the system of 1.1, and when `Γ_n` is singular it
is `0`. Write `v_n = γ(0) − ∑_j predCoeff X n j · γ(j + 1)`. Define `pacf X n`, the partial
autocorrelation at lag `n`, as the correlation `⟪r_n, r_0⟫ / (‖r_n‖ ‖r_0‖)` of the residuals
`r_n = X n − P(X n)` and `r_0 = X 0 − P(X 0)`, where `P` is the orthogonal projection onto the
span of `X 1, …, X(n − 1)` (Mathlib `Submodule.starProjection`, for that finite-dimensional
span); it is `0` when a residual vanishes. This is Grandell's Definition 5.5, p. 41, and Wang's
definition in §5.4, p. 71, for `n ≥ 1`. At `n = 0` and `n = 1` the span is `0` and `pacf X n` is
the correlation of `X n` and `X 0`.

**Checks.**
- For stationary `X` with `γ(0) > 0`, `pacf X 1 = γ(1)/γ(0)` and `pacf X 0 = 1`; for the zero
  series every value is `0`.
- The correlation must be taken of the residuals: for the autoregression with
  `γ(h) = 2^(−|h|)`, the correlation of `X 2` and `X 0` is `1/4`, while `pacf X 2 = 0`.

### 2.1 The Durbin–Levinson recursion

Prove `predCoeff_succ`: for any `X : ℤ → E` and `n : ℕ` with `Γ_{n+1}` positive definite, let
`a = predCoeff X n` and `κ = predCoeff X (n + 1) (last)`. Then
`κ = (γ(n + 1) − ∑_j a_j γ(n − j)) / v_n`, `predCoeff X (n + 1) j = a_j − κ a_{rev j}` for
`j < n`, and `v_{n+1} = v_n (1 − κ²)` (Grandell, Thm. 4.3, p. 33; Wang, Prop. 5.3, p. 73; both
assume `γ(0) > 0` and `γ(h) → 0`; the statement here needs only `Γ_{n+1}` positive definite and
no stationarity, and is proved here).

Route: positive definiteness of `Γ_{n+1}` makes it symmetric, so `γ(h) = γ(−h)` for `|h| ≤ n`,
and its leading block `Γ_n` is positive definite (`Matrix.PosDef.submatrix`), so `Γ_n a = g`
with `g = γ_n`. Let `J` reverse the order of a vector of length `n`. Symmetry gives `J Γ_n J = Γ_n`,
hence `Γ_n J a = J g`. In block form, `Γ_{n+1}` has blocks `Γ_n`, the column `J g` (entry `γ(n − i)`
in row `i`), its transpose and `γ(0)`. Its Schur complement is
`γ(0) − (J g)ᵀ Γ_n⁻¹ J g = γ(0) − gᵀ a = v_n`, so `det Γ_{n+1} = det Γ_n · v_n`
(`Matrix.det_fromBlocks₁₁`) and `v_n > 0` (`Matrix.PosDef.det_pos`). Try `b = (a − κ J a, κ)`:
its first block equation is `Γ_n a − κ J g + κ J g = g`, and its last row is
`(J g)ᵀ a − κ gᵀ a + κ γ(0) = ∑_j a_j γ(n − j) + κ v_n`, which equals `γ(n + 1)` for the stated
`κ`. Since `Γ_{n+1}` is invertible, `b = predCoeff X (n + 1)`. Finally
`v_{n+1} = γ(0) − gᵀ (a − κ J a) − κ γ(n + 1)`, which is
`v_n − κ (γ(n + 1) − ∑_j a_j γ(n − j)) = v_n (1 − κ²)`,
using `gᵀ J a = ∑_j a_j γ(n − j)`.

**Checks.**
- `n = 0`: `κ = γ(1)/γ(0)` and `v_1 = γ(0) (1 − κ²)`.
- The autoregression `X t = X(t − 1)/2 − X(t − 2)/4 + Z t`, scaled to `γ(0) = 1`:
  `γ = (1, 2/5, −1/20, −1/8, …)`; the recursion gives `κ = 2/5, −1/4, 0, 0` at orders `1` to `4`,
  `predCoeff X 2 = (1/2, −1/4)`, and `v = 21/25, 63/80, 63/80, …`.
- `X t = Z t + Z(t − 1)/2` with `σ² = 1`: `κ = 2/5, −4/21, 8/85` and `v = 21/20, 85/84, 341/340`.
- Positive definiteness is needed: for `X t = A` with `‖A‖ = 1` and `n = 1`, `Γ_2` is singular,
  `predCoeff X 1 = (1)`, `v_1 = 0` and `predCoeff X 2 = 0`, while the update would require
  `0 = 1 − 0 · 1`.

*Needs:* 1.0; Mathlib `Matrix.det_fromBlocks₁₁`, `Matrix.PosDef.submatrix`,
`Matrix.PosDef.det_pos`, `Matrix.PosDef.isUnit`.

### 2.2 Partial autocorrelation and the last coefficient

Prove `pacf_eq_predCoeff_last`: for stationary `X` and every `n`,
`pacf X (n + 1) = predCoeff X (n + 1) (last)` (Grandell, Thm. 5.2, p. 41, under the hypotheses
of his Thm. 4.3; here with no further hypothesis, the singular case being proved here).

Route: let `K` be the span of `X 1, …, X n`, `r_0 = X 0 − P(X 0)` and `r = X(n + 1) − P(X(n + 1))`
with `P` the projection onto `K`. First, `‖r‖ = ‖r_0‖`: both are distances to `K`, and the
families `(X(n + 1), X n, …, X 1)` and `(X 0, X 1, …, X n)` have the same Gram matrix by
stationarity and `γ(−h) = γ(h)`, so 1.1 gives the same value. If `Γ_{n+1}` is positive definite,
`X 0, …, X n` are independent and `r_0 ≠ 0`. The span of `X 0, …, X n` is `K ⊕ ℝ r_0`, so the
nearest point to `X(n + 1)` in it is `P(X(n + 1)) + c r_0` with
`c = ⟪X(n + 1), r_0⟫ / ‖r_0‖² = ⟪r, r_0⟫ / ‖r_0‖²`. Expanding `r_0`, the coefficient of `X 0` in
this combination is `c`, and by independence and 1.1 it is the last Yule–Walker coefficient of
order `n + 1`; with `‖r‖ = ‖r_0‖` this is `pacf X (n + 1)`. If `Γ_{n+1}` is singular,
`predCoeff X (n + 1) = 0` (`Matrix.nonsing_inv_apply_not_isUnit`), and `pacf X (n + 1) = 0`:
take a nonzero relation `∑_{j ≤ n} c_j X j = 0` (`Matrix.posDef_gram_iff_linearIndependent`)
and the least `k` with `c_k ≠ 0`. A relation persists under time shifts, since
`‖∑_j c_j X(j + s)‖² = ∑_{i,j} c_i c_j γ(j − i)` does not depend on `s`; shifting by `−k` gives
`X 0 ∈ K`, so `r_0 = 0`.

**Checks.**
- The autoregression with `γ(h) = 2^(−|h|)`: partial autocorrelations `1/2, 0, 0, …`.
- The cosine series with `λ = π/3`: `pacf X 2 = −1 = κ` at order `2`, and
  `pacf X 3 = 0 = predCoeff X 3 (last)`, since `Γ_3` is singular.
- Stationarity is needed: with orthonormal `e₁, e₂`, `X 0 = e₁`, `X 1 = e₂`, `X 2 = 2e₁` and
  `X t = 0` otherwise, `pacf X 2 = 1`, while `Γ_2` is the identity and the last coefficient is
  `γ(2) = 2`.

*Needs:* 1.0, 1.1; Mathlib `Submodule.starProjection`, `Submodule.starProjection_inner_eq_zero`,
`Matrix.posDef_gram_iff_linearIndependent`, `Matrix.nonsing_inv_apply_not_isUnit`.

### 2.3 Positive definiteness through partial autocorrelations

Prove `posDef_autocovMatrix_succ_iff`: for stationary `X` and every `n`, `Γ_{n+2}` is positive
definite if and only if `Γ_{n+1}` is positive definite and `|pacf X (n + 1)| < 1`. (Proved here.)

Route: let `K` be the span of `X 1, …, X n`, `P` the projection onto it, `r_0 = X 0 − P(X 0)`
and `r = X(n + 1) − P(X(n + 1))`. As in 2.2, `‖r‖ = ‖r_0‖`: both are distances to `K`, and
`(X(n + 1), X n, …, X 1)` and `(X 0, X 1, …, X n)` have the same Gram matrix. By 1.2 at
`t = n + 1`, for sizes `n + 2` and `n + 1`, `det Γ_{n+2} = det Γ_{n+1} · d²`, with `d` the
distance from `X(n + 1)` to the span of `X 0, …, X n`. If `Γ_{n+1}` is positive definite, the
`X 0, …, X n` are independent, `r_0 ≠ 0`, and that span is `K ⊕ ℝ r_0` orthogonally; as `r ⟂ K`,
`d² = ‖r‖² − ⟪r, r_0⟫² / ‖r_0‖² = ‖r_0‖² (1 − pacf X (n + 1)²)`. A positive
semidefinite matrix (1.0) is positive definite exactly when its determinant is nonzero
(`Matrix.PosSemidef.posDef_iff_isUnit`). Forward: the leading block `Γ_{n+1}` of a positive
definite `Γ_{n+2}` is positive definite and `d² > 0`, so `|pacf X (n + 1)| < 1`. Backward:
`d² > 0` and `det Γ_{n+1} > 0` give `det Γ_{n+2} > 0`.

**Checks.**
- The cosine series with `λ = π/3`: `Γ_2` is positive definite and `pacf X 2 = −1`, and `Γ_3` is
  singular. The constant series: `Γ_1 = (1)`, `pacf X 1 = 1`, `Γ_2` singular.
- `X t = Z t + Z(t − 1)`: the partial autocorrelations `1/2, −1/3, 1/4, −1/5` all have modulus
  less than `1`.
- Stationarity is needed: with orthonormal `e₁, e₂`, `X 0 = e₁`, `X 1 = e₂`, `X(−1) = e₁/2`
  and `X t = 0` otherwise, `Γ_2` has rows `(1, 1/2)` and `(0, 1)`, which is not symmetric, so not
  positive definite, while `Γ_1 = (1)` and `pacf X 1 = 0`.

*Needs:* 1.0, 1.1, 1.2, 2.0; Mathlib `Matrix.PosSemidef.posDef_iff_isUnit`,
`Matrix.PosDef.submatrix`, `Matrix.PosDef.det_pos`, `Matrix.posDef_gram_iff_linearIndependent`,
`Submodule.starProjection_inner_eq_zero`.

### 2.4 Partial autocorrelations of an autoregression

Prove `pacf_eq_zero_of_lt`: let `X : ℤ → E`, `p : ℕ` and `φ : Fin p → ℝ` be such that
`X t − ∑_j φ_j X(t − 1 − j)` is orthogonal to `X s` whenever `s < t`. Then `pacf X h = 0` for
every `h > p` (Grandell, Example 5.3, p. 45, for causal autoregressions; Wang, Example 5.4,
p. 71, for `p = 1`). No stationarity is assumed. (Proved here.)

Route: fix `h > p`, so `h ≥ 1`, and let `K` be the span of `X 1, …, X(h − 1)`. Write
`X h = ∑_j φ_j X(h − 1 − j) + W` with `W ⟂ X s` for `s < h`. The indices `h − 1 − j` lie in
`[h − p, h − 1] ⊆ [1, h − 1]`, so the sum lies in `K`, and `W ⟂ K`; hence the residual of `X h` is
`W`. The residual of `X 0` lies in the span of `X 0, …, X(h − 1)`, which `W` is orthogonal to, so
the numerator of `pacf X h` is `0`.

**Checks.**
- The autoregression of order `2` of 2.1: `pacf X 3 = pacf X 4 = pacf X 5 = 0`.
- Orthogonality to the past is needed: for `p = 0` the hypothesis says that `X t ⟂ X s` for
  `s < t`; `X t = Z t + Z(t − 1)` violates it and has `pacf X 1 = 1/2`.

*Needs:* 2.0; Mathlib `Submodule.starProjection_inner_eq_zero`, `Submodule.span`.

### Examples

The autoregressions of orders `1` and `2` above, the moving averages `Z t + θ Z(t − 1)` for
`θ = 1/2` and `θ = 1`, the constant series and the cosine series, with their coefficients,
errors and partial autocorrelations.

### Dependencies

Layer 1 (1.0, 1.1, 1.2); the Mathlib declarations of the *Needs:* lines above.

## Layer 3: autoregressions, causality and the Wold decomposition

### 3.1 Absolute summability of the inverse series

Prove `summable_abs_of_convolution_eq`: if a real polynomial `φ` has no zero in the closed unit
disc and `ψ : ℕ → ℝ` satisfies `∑_{k ≤ m} φ_k ψ_{m−k} = [m = 0]` for every `m`, then
`∑ |ψ_j| < ∞`. (Proved here; Grandell, Thm. 2.3, p. 15, uses the power series of `1/φ`.)

Route: `φ(0) ≠ 0`, so `φ ≠ 0`. Over `ℂ`, `φ = φ(0) ∏_i (1 − z/ζ_i)` over its roots with
multiplicity (`Polynomial.Splits.eq_prod_roots`, `IsAlgClosed.splits`), and `|ζ_i| > 1`. The
coefficients `ζ_i^(−j)` of the series of `(1 − z/ζ_i)⁻¹` are absolutely summable, and the
Cauchy product of finitely many absolutely summable sequences is absolutely summable
(`summable_norm_sum_mul_antidiagonal_of_summable_norm`). Their product `ξ`, divided by `φ(0)`,
is a power series with `φ ξ = 1`. The hypothesis says `φ ψ = 1` as formal power series, and a
power series with nonzero constant term has one inverse, so `ψ = ξ` and `ψ` is absolutely
summable.

**Checks.**
- `φ = 1 − z/2 + z²/4` has roots `1 ± i√3` of modulus `2`;
  `ψ = (1, 1/2, 0, −1/8, −1/16, 0, 1/64, …)`
  with `ψ_{3k} = (−1/8)ᵏ`, `ψ_{3k+1} = (1/2)(−1/8)ᵏ`, `ψ_{3k+2} = 0`, and `∑ ψ_j² = 80/63`, the
  ratio `γ(0)/σ²` of the autoregression of 2.1.
- `φ = 1 − 2z` (root `1/2`): `ψ_j = 2ʲ`. `φ = 1 − z` (root `1`): `ψ_j = 1`. Neither is
  summable.

*Needs:* Mathlib `Polynomial.Splits.eq_prod_roots`, `IsAlgClosed.splits`,
`summable_norm_sum_mul_antidiagonal_of_summable_norm`, `PowerSeries`.

### 3.2 Causal autoregressions

Prove `exists_causal_solution_iff`: let `E` be complete and `Z` white noise of variance
`σ² > 0`. For a real polynomial `φ`, there is `ψ : ℕ → ℝ` with `∑ |ψ_j| < ∞` such that
`X t = ∑_j ψ_j Z(t − j)` solves `φ(B) X = Z` if and only if `φ(z) ≠ 0` for `|z| ≤ 1`
(Grandell, Def. 2.9, p. 14, and Thm. 2.3, p. 15, the case `θ = 1`; Wang, Thm. 2.5, p. 31; both
for `φ(0) = 1` and a stationary solution). (Proved here.)

Route. Backward: define `ψ` by `ψ_0 = 1/φ_0` and `ψ_m = −(1/φ_0) ∑_{1 ≤ k ≤ m} φ_k ψ_{m−k}`,
so `ψ` solves the convolution equation of 3.1 and is absolutely summable. As
`‖ψ_j Z(s − j)‖ = |ψ_j| σ`, each series `X s` converges in `E` (`Summable.of_norm`). For each `k`,
reindexing `m = j + k` writes `X(t − k)` as `∑_m ψ_{m−k} Z(t − m)` over `m ≥ k`; a finite sum of
convergent series is the series of the sums, so
`∑_k φ_k X(t − k) = ∑_m (∑_{k ≤ m} φ_k ψ_{m−k}) Z(t − m) = Z t`. Forward: the inner product is
continuous, so `⟪X(t − k), Z(t − m)⟫ = σ² ψ_{m−k}` for `m ≥ k` and `0` for `m < k`. Pairing the
equation with
`Z(t − m)` for `m ≥ 0` gives `σ² ∑_{k ≤ m} φ_k ψ_{m−k} = σ² [m = 0]`, and `σ² > 0` gives the
convolution equation. For `|z| ≤ 1` the series `Ψ(z) = ∑ ψ_j zʲ` converges absolutely, and the
product of the polynomial `φ` with it is the series of the convolution, so `φ(z) Ψ(z) = 1` and
`φ(z) ≠ 0`.

**Checks.**
- `φ = 1 − z/2`: `X t = ∑_j 2^(−j) Z(t − j)`, with `γ(h) = (4/3) σ² 2^(−|h|)`.
- `σ² > 0` is needed: for `Z = 0` and `φ = 1 − 2z`, `ψ = 0` solves the equation, and `φ` has the
  root `1/2`.
- Completeness is needed: in the incomplete space of finitely supported sequences on `ℤ` with the
  `ℓ²` inner product, let `Z t` be the unit vector at `t` and `φ = 1 − z/2`. If `ψ` has infinitely
  many nonzero terms, no series `∑_j ψ_j Z(t − j)` converges in that space, so each sum is `0` by
  Mathlib's convention and the equation reads `0 = Z t`; if `ψ` has finite support, the series
  converge and the forward argument forces `ψ_j = 2^(−j)`, which is not finitely supported.

*Needs:* 3.1; Mathlib `Summable.of_norm`, `tsum`, `HasSum`.

### 3.3 Uniqueness of the bounded solution

Prove `hasSum_of_bounded_solution`: let `φ` have no zero in the closed unit disc and `ψ` solve
`∑_{k ≤ m} φ_k ψ_{m−k} = [m = 0]`. If `X, Z : ℤ → E` satisfy `φ(B) X = Z` and `‖X t‖ ≤ C` for all
`t`, then `∑_j ψ_j Z(t − j)` converges to `X t` for every `t`; completeness of `E` is not needed
(Grandell, Thm. 2.3, p. 15, and Wang, Thm. 2.5, p. 31, state uniqueness of the stationary
solution). (Proved here.)

Route: let `d = deg φ`, `A = ∑_k |φ_k|` and `S = ∑_j |ψ_j|`, finite by 3.1. For a finite set
`F ⊆ ℕ`, substituting `Z(t − j) = ∑_{k ≤ d} φ_k X(t − j − k)` gives
`∑_{j ∈ F} ψ_j Z(t − j) = ∑_m e_F(m) X(t − m)` with `e_F(m) = ∑ φ_k ψ_{m−k}` over the
`k ≤ min(d, m)` with `m − k ∈ F`. If `F` contains `0, …, N`, then `e_F(m) = [m = 0]` for `m ≤ N`, so
the distance from the partial sum
to `X t` is at most `C ∑_{m > N} |e_F(m)| ≤ C A ∑_{j > N − d} |ψ_j|`, which tends to `0` as
`N → ∞`. This is convergence along finite sets, Mathlib's `HasSum`.

**Checks.**
- Boundedness is needed: for `φ = 1 − z/2` and `Z = 0`, `X t = 2^(−t) A` solves the equation and
  is unbounded as `t → −∞`, while the series is `0`.
- The root condition is needed: for `φ = 1 − z`, `Z = 0` and `X t = A ≠ 0`, `ψ_j = 1` solves the
  convolution equation and the series is `0`.

*Needs:* 3.1; Mathlib `HasSum`.

### 3.4 The Wold decomposition

Prove `wold_decomposition`: let `E` be complete and `X` stationary. Let `M_t` be the closed span
of the `X s` with `s ≤ t`, `Z t = X t − P_{M_{t−1}}(X t)` the innovation, `σ² = ‖Z 0‖²`, and
`ψ_j = ⟪X 0, Z(−j)⟫ / σ²`. If `σ² > 0`, then `ψ_0 = 1`, `∑ ψ_j² < ∞`, `Z` is white noise of
variance `σ²`, `Z t ∈ M_t`, and for every `t` the series `∑_j ψ_j Z(t − j)` converges and its
difference `V t` from `X t` lies in every `M_s` and is orthogonal to every `Z s` (Grandell,
Thm. 5.1, p. 39, statements (i)–(v)). (Proved here.)

Route. (a) Innovation variances and coefficients do not depend on time. For `n ≥ 1` choose a
solution `b⁽ⁿ⁾` of the system of 1.1, which depends only on `γ` and `n`, and let
`R_n(t) = X t − ∑_{j < n} b⁽ⁿ⁾_j X(t − 1 − j)`. By 1.1, `R_n(t)` is `X t` minus its projection onto
the span `F_n(t)` of `X(t − 1), …, X(t − n)`. These spans increase with `n` and the closure of
their union is `M_{t−1}`, so `R_n(t) → Z t` (`Submodule.starProjection_tendsto_closure_iSup`).
Inner products `⟪X u, R_n(t)⟫` and `‖R_n(t)‖²` are expressions in `γ` and `b⁽ⁿ⁾`, unchanged when
`u` and `t` are shifted together; passing to the limit, `‖Z t‖² = σ²` and
`⟪X t, Z(t − j)⟫ = σ² ψ_j` for every `t`. (b) White noise: `Z t ∈ M_t` because `X t ∈ M_t` and
`M_{t−1} ⊆ M_t`, and `Z t ⟂ M_{t−1}`. For `s < t`, `Z s ∈ M_s ⊆ M_{t−1}`, so `⟪Z s, Z t⟫ = 0`.
(c) `ψ_0 = ⟪Z 0 + P_{M_{−1}}(X 0), Z 0⟫ / σ² = 1`. (d) For fixed `t`, the vectors `Z(t − j)/σ`,
`j ≥ 0`, are orthonormal, and `⟪X t, Z(t − j)/σ⟫ = σ ψ_j`. Bessel's inequality
(`Orthonormal.inner_products_summable`) gives `∑ ψ_j² < ∞`, and in a complete space an
orthonormal series with square-summable coefficients converges
(`OrthogonalFamily.summable_iff_norm_sq_summable`). (e) Orthogonality: for `s = t − j ≤ t`,
`⟪Z s, V t⟫ = σ² ψ_j − σ² ψ_j = 0`; for `s > t`, `X t` and every `Z(t − j)` lie in `M_{s−1}`,
which is orthogonal to `Z s`. (f) `V t ∈ M_s`: for `s ≥ t` this holds since `M_t ⊆ M_s` is
closed. Since `X u = Z u + P_{M_{u−1}}(X u)`, `M_u` is the closure of `M_{u−1} + ℝ Z u`, which is
already closed, so `M_u = M_{u−1} ⊕ ℝ Z u`. Iterating, for `s < t`,
`M_t = M_s ⊕ span(Z(s + 1), …, Z t)` orthogonally; `V t ∈ M_t` is orthogonal to `Z(s + 1), …, Z t`
by (e), hence in `M_s`.

**Checks.**
- White noise `X = Z`: the innovation is `Z`, `ψ = (1, 0, 0, …)` and `V = 0`.
- `X t = W t + θ W(t − 1)` for white noise `W` and `|θ| < 1`: `W t = ∑_j (−θ)ʲ X(t − j)` lies in
  `M_t`, so the innovation is `W t`, `σ² = ‖W 0‖²`, `ψ = (1, θ, 0, …)` and `V = 0`.
- `X t = W t + C` with `C ≠ 0` orthogonal to every `W s`: averages of `X(t − 1), …, X(t − N)`
  tend to `C`, so `C ∈ M_s` for every `s`; the innovation is `W t`, `ψ = (1, 0, …)` and
  `V t = C`.
- The hypothesis `σ² > 0` fails for the cosine series: it satisfies
  `X t = 2 cos(λ) X(t − 1) − X(t − 2)`, so its innovations vanish.

*Needs:* 1.1; Mathlib `Submodule.topologicalClosure`, `Submodule.starProjection`,
`Submodule.starProjection_tendsto_closure_iSup`, `Orthonormal.inner_products_summable`,
`OrthogonalFamily.summable_iff_norm_sq_summable`.

### Examples

`φ = 1 − z/2 + z²/4` with its inverse series; `φ = 1 − 2z` and `φ = 1 − z`, which fail the root
condition; white noise, a moving average of order `1` and white noise plus a constant vector,
with their Wold decompositions.

### Dependencies

Layer 1 (1.1); the Mathlib declarations of the *Needs:* lines above.

## Scope and ownership

This roadmap owns the Yule–Walker characterization of best linear predictors with the error
formula, the determinant formula and the positive definiteness criterion of Layer 1; the
Durbin–Levinson recursion, the partial autocorrelation and its relations to the last coefficient
and to positive definiteness, and the vanishing of partial autocorrelations of autoregressions
(Layer 2); absolute summability of the inverse series, the causality criterion for
autoregressions, uniqueness of bounded solutions and the Wold decomposition (Layer 3). Its
definitions are `IsSecondOrderStationary`, `autocov`, `autocovMatrix`, `predCoeff` and `pacf`.

Stated by other roadmaps and not restated:

- MathematicalStatisticsFoundations, §9.6, owns second-order stationarity in an inner product
  space over `ℝ` or `ℂ`, the symmetry of the autocovariance and the positive semidefiniteness of
  its matrices, i.i.d. noise and the sample autocovariance. `IsSecondOrderStationary` is its
  condition over `ℝ`, given a name here because every theorem uses it.
- KalmanFiltering owns the orthogonality principle, one-step prediction and innovations for linear
  state-space models (its Layers 2–4); nothing there is restated.
- PositiveDefiniteSequencesAndToeplitzForms (an open roadmap, not on main) treats Toeplitz
  matrices `(φ(i − j))` of an arbitrary sequence, Sylvester's criterion and the trigonometric moment
  problem. `Γ_n` is such a matrix, but 1.2, 1.3 and 2.3 are statements about prediction errors and
  partial autocorrelations of a series in an inner product space, which that roadmap does not
  state; this roadmap does not depend on that one.

Outside the scope: complex-valued series, spectral measures and densities, and the Herglotz
representation of autocovariances; the Kolmogorov–Szegő formula and prediction from the infinite
past through spectral densities; the innovations algorithm; moving-average parts, invertibility
and mixed autoregressive moving-average equations; uniqueness of the Wold decomposition;
estimation of the coefficients from data and its asymptotics; orthogonal polynomials on the unit
circle.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`: `Matrix.gram 𝕜 v` (entry `⟪v i, v j⟫`);
  `Matrix.posSemidef_gram` (it is positive semidefinite); `Matrix.posDef_gram_iff_linearIndependent`
  (positive definite exactly for a linearly independent family);
  `Matrix.det_gram_ne_zero_iff_linearIndependent` (finite index type).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`, `Matrix.PosDef.submatrix`
  (injective reindexing), `Matrix.PosDef.isUnit`, `Matrix.PosSemidef.posDef_iff_isUnit` (a positive
  semidefinite matrix is positive definite exactly when it is invertible), `Matrix.PosDef.det_pos`.
- `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.det_fromBlocks₁₁`
  (`det (fromBlocks A B C D) = det A * det (D − C ⅟A B)` for invertible `A`).
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.nonsing_inv_apply_not_isUnit`
  (the inverse of a matrix with non-invertible determinant is `0`).
- `Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean`:
  `Submodule.norm_eq_iInf_iff_real_inner_eq_zero` (for `v ∈ K`, `‖u − v‖` is the least distance
  from `u` to `K` exactly when `u − v ⟂ K`, over `ℝ`).
- `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`: `Submodule.starProjection` (needs
  `K.HasOrthogonalProjection`, which holds for finite-dimensional `K` and for closed `K` in a
  complete space), `Submodule.starProjection_inner_eq_zero` (`v − P v ⟂ K`).
- `Mathlib/Analysis/InnerProductSpace/Projection/Submodule.lean`:
  `Submodule.starProjection_tendsto_closure_iSup` (for a monotone family of subspaces with
  orthogonal projections, whose supremum has a closure with an orthogonal projection, the
  projections converge to the projection onto that closure).
- `Mathlib/Analysis/InnerProductSpace/Orthonormal.lean`: `Orthonormal.inner_products_summable`
  (Bessel). `Mathlib/Analysis/InnerProductSpace/Subspace.lean`:
  `OrthogonalFamily.summable_iff_norm_sq_summable` (in a complete space).
- `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`: `Metric.infDist`.
- `Mathlib/Analysis/Normed/Group/InfiniteSum.lean`: `Summable.of_norm` (complete space);
  `Mathlib/Analysis/Normed/Ring/InfiniteSum.lean`:
  `summable_norm_sum_mul_antidiagonal_of_summable_norm` (Cauchy products).
- `Mathlib/Algebra/Polynomial/Splits.lean`: `Polynomial.Splits.eq_prod_roots`;
  `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`: `IsAlgClosed.splits`. `PowerSeries`,
  `Submodule.span`, `Submodule.topologicalClosure`, `tsum`, `HasSum`.

## References

- Jan Grandell, *Time series analysis*, lecture notes, KTH Royal Institute of Technology
  (open PDF on the course page, math.kth.se/matstat/gru/5b1545/ts.pdf), printed pages: Def. 1.4,
  p. 2, and p. 9 (weak stationarity); Def. 2.9, p. 14, and Thm. 2.3, p. 15 (causality); Thm. 4.2,
  p. 32 (best linear predictor, with the remark that `γ(0) > 0` and `γ(h) → 0` make `Γ_n`
  nonsingular); Thm. 4.3, p. 33
  (Durbin–Levinson); Thm. 5.1, p. 39 (Wold decomposition); Def. 5.5 and Thm. 5.2, p. 41 (partial
  autocorrelation); Example 5.3, p. 45 (autoregressions).
- Dewei Wang, *STAT 720 Time Series Analysis*, lecture notes, University of South Carolina,
  Spring 2015 (open PDF on the author's page), printed pages: Thm. 2.5, p. 31; §5.2, pp. 65–66,
  with equation (5.2), Prop. 5.1 and Properties 1–2; §5.4, p. 71, with Example 5.4; Prop. 5.3,
  p. 73; §6.5, p. 101 (`det Γ_n = ν_0 ⋯ ν_{n−1}`).
- Both sets of notes cite P. J. Brockwell and R. A. Davis, *Time Series: Theory and Methods*,
  2nd ed., Springer, 1991, as their main source. The names of Wold, Durbin and Levinson are
  attached to 3.4 and 2.1 as these notes attach them.

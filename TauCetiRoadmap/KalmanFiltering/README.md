# Roadmap: Kalman filtering

**Summary.** This roadmap develops the discrete-time Kalman filter for linear state-space models
`x(k+1) = A(k) x(k) + w(k)`, `y(k) = C(k) x(k) + v(k)` with finite-dimensional states and
observations, time-varying coefficients and observations from time `0` on. The filter is a pair
of recursions: a recursion for covariance matrices, the Riccati recursion, which does not depend
on the data, and a recursion for means, which is affine in the observations. Both are defined
explicitly, and every target is an identity or an inequality about them; no procedure or
running time is specified. In the Gaussian model the initial state is Gaussian, the process and
observation noises are centred Gaussian, and all of them are mutually independent. In the
second-order model the same variables are only square integrable and pairwise uncorrelated, with
the same means and covariances. Every theorem about the filter, the innovations, optimality and
the smoother assumes that the observation-noise covariances are positive definite.

The headline theorems are these.

- *The Kalman filter.* In the Gaussian model, the conditional law of the state at time `k`
  given the observations up to time `k` is Gaussian, with mean the filtered mean and covariance
  the filtered covariance of the recursion; the conditional law of the state at time `k + 1`
  given the same observations is Gaussian with the predicted mean and covariance.
- *Innovations.* In the Gaussian model, the innovations, each observation minus its prediction
  from the earlier ones, are independent, and the innovation at time `k` is centred Gaussian
  with covariance `C(k) P(k|k−1) C(k)ᵀ + R(k)`.
- *Optimality.* In the Gaussian model the filtered mean is the conditional expectation of the
  state given the observations, and no measurable function of the observations has smaller mean
  squared error. In the second-order model, with no distributional assumption, no affine
  function of the observations has smaller mean squared error than the filtered mean, and that
  error is the trace of the filtered covariance.
- *The Rauch–Tung–Striebel smoother.* In the Gaussian model, for `k ≤ N`, if the predicted
  covariances from time `k + 1` to `N` are positive definite, the conditional law of the state
  at time `k` given the observations up to time `N` is Gaussian, with mean and covariance given
  by a backward recursion started from the filter at time `N`.

The covariance recursion is also studied on its own as a map of positive semidefinite matrices:
it preserves positive semidefiniteness, for a positive definite observation-noise covariance it
is monotone in the Loewner order, the Kalman gain
minimizes the error covariance over all gains, and it has an information form.

The roadmap builds on Mathlib's multivariate Gaussian measures, the theorem that jointly Gaussian
uncorrelated vectors are independent, and regular conditional distributions; on the Schur
complement and positive definite matrices of Mathlib; and on Tau Ceti's affine images of
multivariate Gaussians. Conditioning one block of a Gaussian vector on another, planned in
StandardDistributions, is already in Tau Ceti and is not restated; here it appears as the case
of a single observation.

## How to read the build

Layer 1 below is matrix algebra only: the innovation covariance, the gain, the measurement and
time updates and the Riccati map, with the completion of the square, positive semidefiniteness,
monotonicity and the information form. Layer 2 depends on Layer 1: it defines the state-space
model, the filter recursion, the Gaussian and the second-order models, and proves the
orthogonality principle in the second-order model, the core of everything after it. Layer 3, the
conditional laws, depends on Layers 1 and 2. Layer 4, the innovations, depends on Layers 1 and 2.
Layer 5, optimality, depends on Layers 2 and 3. Layer 6, the smoother, depends on Layers 1 and 2.
Within a layer the sections are in build order.

## Conventions

- **Spaces and matrices.** States lie in `EuclideanSpace ℝ ι` and observations in
  `EuclideanSpace ℝ κ`, for finite types `ι` and `κ` with decidable equality; either may be
  empty. A matrix acts on vectors through `Matrix.toEuclideanLin`; `Mᵀ` is the transpose.
  Positive semidefinite and positive definite are Mathlib's `Matrix.PosSemidef` and
  `Matrix.PosDef`. The Loewner order is written out: `P ≤ P'` means that `P' − P` is positive
  semidefinite.
- **Inverses.** `M⁻¹` is Mathlib's inverse of a square matrix, which is `0` when `M` is
  singular. Every statement that uses an inverse in a way that matters assumes what makes the
  matrix invertible: the observation-noise covariances `R(k)` are positive definite, which makes
  every innovation covariance positive definite, and the smoother assumes that the predicted
  covariances it inverts are positive definite. Checks below show the junk value giving wrong
  answers when these hypotheses are dropped.
- **Time.** Time is `k : ℕ`. The first observation is `y(0)`, and the initial state `x(0)` has
  mean `m₀` and covariance `P₀`. The observations up to time `k` form the vector
  `obsWindow y k ω : Fin (k + 1) → EuclideanSpace ℝ κ`. Sources that observe from time `1` on,
  with a prior on `x(0)`, give the same recursions after a shift of index.
- **Notation.** `x̂(k|k−1)` and `P(k|k−1)` are the predicted mean and covariance (with
  `x̂(0|−1) = m₀` and `P(0|−1) = P₀`), `x̂(k|k)` and `P(k|k)` the filtered ones, `x̂(k|N)` and
  `P(k|N)` the smoothed ones. Means are functions of an observation sequence
  `ys : ℕ → EuclideanSpace ℝ κ`; the filtered mean at time `k` reads `ys j` for `j ≤ k` only and
  the predicted mean at time `k` reads `ys j` for `j < k` only. A window `t` is read as a
  sequence by `Function.extend Fin.val t 0`.
- **Conditional laws** are Mathlib's `condDistrib`, a Markov kernel defined almost everywhere
  under the law of the conditioning variable; a statement "the conditional law is `N(μ(t), S)`"
  means equality with `t ↦ multivariateGaussian (μ t) S` almost everywhere for that law.
- **Mean squared errors** are lower Lebesgue integrals `∫⁻ ω, ‖e ω‖ₑ ^ 2 ∂P` of the squared
  extended norm, so that no integrability hypothesis is needed for a competitor, and a
  competitor with infinite error is allowed.
- **Covariances of vectors** are stated through scalar covariances of inner products:
  `cov[⟪a, X⟫, ⟪b, Y⟫]` for all fixed vectors `a`, `b`. "Uncorrelated" means that all these
  vanish.

## Layer 1: the covariance recursion as a matrix map

### 1.1 The gain and the updates

For an observation matrix `C : Matrix κ ι ℝ`, an observation-noise covariance `R` and a
covariance `P`, define the innovation covariance `innovationCov C R P = C P Cᵀ + R`, the Kalman
gain `kalmanGain C R P = P Cᵀ (C P Cᵀ + R)⁻¹`, and the measurement update
`measurementUpdate C R P = P − P Cᵀ (C P Cᵀ + R)⁻¹ C P`. For a transition matrix `A` and a
process-noise covariance `Q`, define the time update `timeUpdate A Q P = A P Aᵀ + Q`, and the
Riccati map `riccatiMap A C Q R P`, the time update of the measurement update:

    riccatiMap A C Q R P = A (P − P Cᵀ (C P Cᵀ + R)⁻¹ C P) Aᵀ + Q.

These are the covariance equations of the filter (Anderson–Moore, §3.1, equations (1.9) and
(1.12), p. 39, with `F = A`, `H = Cᵀ`, `G = 1`; Särkkä, Theorem 4.2, equations (4.20) and (4.21),
p. 57). Prove:

- If `P` is positive semidefinite and `R` positive definite, `C P Cᵀ + R` is positive definite.
- If `C P Cᵀ + R` is positive definite, `measurementUpdate C R P` is the Schur complement of the
  block `C P Cᵀ + R` in the block matrix with blocks `P`, `P Cᵀ`, `C P`, `C P Cᵀ + R`. With the
  blocks indexed by `ι ⊕ κ` it is Tau Ceti's `Matrix.gaussianCondCov` of that block matrix,
  through `Matrix.gaussianCondCov_of_posDef`: the conditional covariance of the state given one
  observation. (Proved here.)

**Checks.**
- Scalar case `A = C = Q = R = P = 1`: `C P Cᵀ + R = 2`, the gain is `1/2`, the measurement
  update is `1/2` and `riccatiMap = 3/2`. Iterating the Riccati map from `1` gives
  `3/2, 8/5, 21/13, 55/34`, and the measurement updates of `1, 3/2, 8/5, 21/13` are
  `1/2, 3/5, 8/13, 21/34`.
- With `C = 0` the gain is `0`, the measurement update is `P`, and the Riccati map is the
  covariance propagation `A P Aᵀ + Q` of the state itself.
- The junk inverse: with `R = 0`, `C = 1` on `ℝ²` and `P = diag(1, 0)`, the matrix
  `C P Cᵀ + R = diag(1, 0)` is singular, its Mathlib inverse is `0`, and the measurement update
  returns `diag(1, 0)`. The conditional covariance of a state observed without noise is `0`; the
  formula is meaningful only when `C P Cᵀ + R` is invertible.

*Needs:* Mathlib `Matrix.PosSemidef.mul_mul_conjTranspose_same`, `Matrix.PosDef.add_posSemidef`;
Tau Ceti `Matrix.gaussianCondCov_of_posDef`.

### 1.2 Completion of the square

Prove `joseph_eq_measurementUpdate_add`: if `P` is positive semidefinite and `R` positive
definite, then for every gain `K : Matrix ι κ ℝ`

    (1 − K C) P (1 − K C)ᵀ + K R Kᵀ = measurementUpdate C R P + (K − K*) S (K − K*)ᵀ,

where `K* = kalmanGain C R P` and `S = C P Cᵀ + R`. The left side is the error covariance of
the estimate `x̂ + K (y − C x̂)` of a state with error covariance `P` from an observation with
noise covariance `R`. Consequences:

- for every `K` the left side minus `measurementUpdate C R P` is positive semidefinite, with
  equality exactly when `K = K*`;
- `measurementUpdate C R P` is positive semidefinite.

Route: expand the left side, use `K* S = P Cᵀ` and the symmetry of `P`, `R` and `S⁻¹`. The same
completion of the square proves Anderson–Moore, §5.2, Theorem 2.1, p. 93, for the linear minimum
variance estimator; the matrix form, without traces, is remarked there on p. 94. (Proved here.)

**Checks.**
- Scalar `P = R = C = 1`: for `K = 0` and for `K = 1` the left side is `1`, and the right side
  is `1/2 + (1/2)² · 2 = 1`; for `K = 1/2` both sides are `1/2`.
- With `C = 0` the Kalman gain is `0`, and the identity reads `P + K R Kᵀ = P + K R Kᵀ`: no gain
  improves on ignoring an observation that carries no information.

*Needs:* 1.1; Mathlib `Matrix.PosDef.isUnit`, `Matrix.PosSemidef.mul_mul_conjTranspose_same`,
`Matrix.PosSemidef.add`.

### 1.3 Positivity

Prove `riccatiMap_posSemidef`: if `P`, `Q` and `R` are positive semidefinite, so is
`riccatiMap A C Q R P`, for every `A` and `C` (Anderson–Moore, §3.1, Problem 1.2, p. 45, posed
there as an exercise). Prove also that if moreover `Q` is positive definite,
`riccatiMap A C Q R P` is positive definite.

Route: when `C P Cᵀ + R` is invertible, it is positive definite, and the measurement update is
the Schur complement of that block in the block matrix of 1.1, which is positive semidefinite as
the sum of `(1, Cᵀ)ᵀ P (1, Cᵀ)` and the block-diagonal matrix with blocks `0` and `R`; so it is
positive semidefinite by `Matrix.PosDef.fromBlocks₂₂`, and the time update adds `A (·) Aᵀ` and
`Q`. When `C P Cᵀ + R` is singular, Mathlib's inverse is `0` and the measurement update is `P`
itself, so the statement needs no hypothesis tying `R` to invertibility.

**Checks.**
- `A = 0`, `Q = 0`: the Riccati map is `0`, positive semidefinite and not positive definite;
  with `Q = 1` it is `1`.
- A Riccati map applied to a matrix that is not positive semidefinite need not be: with `C = 0`,
  `A = 1`, `Q = 0` on `ℝ¹` and `P = −1`, the value is `−1`.

*Needs:* 1.1; Mathlib `Matrix.PosDef.fromBlocks₂₂`, `Matrix.PosSemidef.posDef_iff_isUnit`,
`Matrix.PosSemidef.mul_mul_conjTranspose_same`, `Matrix.PosSemidef.add`,
`Matrix.PosDef.add_posSemidef`.

### 1.4 Monotonicity

Prove `riccatiMap_sub_posSemidef`: if `R` is positive definite, `P` is positive semidefinite and
`P ≤ P'`, then `riccatiMap A C Q R P ≤ riccatiMap A C Q R P'`, for every `A`, `C` and `Q`. The
same holds for `measurementUpdate C R`.

Route: by 1.2 with `K` the gain of `P'`,
`measurementUpdate C R P ≤ (1 − K C) P (1 − K C)ᵀ + K R Kᵀ ≤ (1 − K C) P' (1 − K C)ᵀ + K R Kᵀ`,
and the last term is `measurementUpdate C R P'`; then apply `A (·) Aᵀ`, and `Q` cancels. This
is the induction step by which Anderson–Moore, §4.4, pp. 79–80, show that solutions of the
Riccati equation started from ordered initial conditions stay ordered, there inside the
convergence argument for a time-invariant model; the step does not use time invariance.

**Checks.**
- Scalar `A = C = Q = R = 1`: `riccatiMap 0 = 1 ≤ 3/2 = riccatiMap 1`.
- Positive definiteness of `R` cannot be dropped: with `R = 0`, `C = A = 1` on `ℝ²`, `Q = 0`,
  `P = diag(1, 0)` and `P' = 1`, Mathlib's junk inverse gives `riccatiMap P = diag(1, 0)` while
  `riccatiMap P' = 0`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `Matrix.PosSemidef.mul_mul_conjTranspose_same`,
`Matrix.PosSemidef.add`.

### 1.5 The information form

Prove:

- `inv_measurementUpdate`: if `P` and `R` are positive definite,
  `(measurementUpdate C R P)⁻¹ = P⁻¹ + Cᵀ R⁻¹ C` (Anderson–Moore, §6.3, equations (3.1) and (3.3),
  p. 139).
- `kalmanGain_eq_measurementUpdate_mul`: if `P` is positive semidefinite and `R` positive
  definite, `kalmanGain C R P = measurementUpdate C R P · Cᵀ · R⁻¹`. Anderson–Moore, §6.3,
  equation (3.2), p. 139, state it assuming the inverses there exist, which includes `P`
  invertible; here `P` may be singular.
- If `P` and `R` are positive definite, `measurementUpdate C R P` is positive definite, as the
  inverse of the positive definite matrix `P⁻¹ + Cᵀ R⁻¹ C`.
- If `P` and `R` are positive definite, the filtered mean `x̂⁺ = x̂ + K* (y − C x̂)` satisfies
  `(measurementUpdate C R P)⁻¹ x̂⁺ = P⁻¹ x̂ + Cᵀ R⁻¹ y` (Anderson–Moore, §6.3, equation (3.10),
  p. 140).

Route: the first is Mathlib's Woodbury identity `Matrix.add_mul_mul_inv_eq_sub` with `A = P⁻¹`,
`U = Cᵀ`, `C = R⁻¹`, `V = C`. The second is the computation
`P⁺ Cᵀ R⁻¹ = P Cᵀ S⁻¹ (S − C P Cᵀ) R⁻¹ = P Cᵀ S⁻¹`, which uses only the invertibility of `S` and
`R`. The last two follow from the first two.

**Checks.**
- Scalar `P = R = C = 1`: the update is `1/2`, its inverse `2 = 1 + 1`, and the gain
  `1/2 = (1/2) · 1 · 1`.
- `P = 0`: the gain is `0` and so is the right side of the second identity, although `P` is
  not invertible; the first identity needs `P` invertible (with `P = 0` its left side is
  Mathlib's `0⁻¹ = 0` and its right side `Cᵀ R⁻¹ C`).

*Needs:* 1.1; Mathlib `Matrix.add_mul_mul_inv_eq_sub`, `Matrix.PosDef.isUnit`,
`Matrix.PosDef.inv`, `Matrix.PosSemidef.conjTranspose_mul_mul_same`,
`Matrix.PosDef.add_posSemidef`.

### Examples

The scalar model `A = C = Q = R = P₀ = 1` runs through every section: its predicted covariances
are `1, 3/2, 8/5, 21/13, …` and its filtered covariances `1/2, 3/5, 8/13, 21/34, …`.

### Dependencies

Mathlib `Matrix.PosSemidef.mul_mul_conjTranspose_same`, `Matrix.PosSemidef.add`,
`Matrix.PosDef.add_posSemidef`, `Matrix.PosDef.fromBlocks₂₂`, `Matrix.PosSemidef.posDef_iff_isUnit`,
`Matrix.PosSemidef.conjTranspose_mul_mul_same`, `Matrix.PosDef.isUnit`, `Matrix.PosDef.inv`,
`Matrix.add_mul_mul_inv_eq_sub`; Tau Ceti `Matrix.gaussianCondCov_of_posDef`.
No other layer.

## Layer 2: the state-space model and the orthogonality principle

### 2.1 Model data

Define `StateSpaceModel ι κ`, a structure with fields `A, Q : ℕ → Matrix ι ι ℝ`,
`C : ℕ → Matrix κ ι ℝ`, `R : ℕ → Matrix κ κ ℝ`, the initial mean `m₀ : EuclideanSpace ℝ ι` and
the initial covariance `P₀ : Matrix ι ι ℝ`. No condition is built in; each statement carries
its hypotheses.

*Needs:* nothing.

### 2.2 The filter recursion

For a model `M` define, by recursion on `k`:

- `predCov M 0 = P₀` and `predCov M (k + 1) = riccatiMap (A k) (C k) (Q k) (R k) (predCov M k)`;
- `filtCov M k = measurementUpdate (C k) (R k) (predCov M k)`;
- along a sequence `ys`, `predMean M ys 0 = m₀` and
  `predMean M ys (k + 1) = A k (x̂ + K (ys k − C k x̂))` with `x̂ = predMean M ys k` and
  `K = kalmanGain (C k) (R k) (predCov M k)`;
- `filtMean M ys k = x̂ + K (ys k − C k x̂)` with the same `x̂` and `K`.

So `predCov M (k + 1) = A k (filtCov M k) (A k)ᵀ + Q k` and
`predMean M ys (k + 1) = A k (filtMean M ys k)` by definition (Anderson–Moore, §3.1, equations
(1.6) to (1.12), pp. 38–39; Särkkä, Theorem 4.2, p. 57). Prove:

- `predMean M ys k` depends only on `ys j` for `j < k`, and `filtMean M ys k` only on `ys j`
  for `j ≤ k`; both are affine in these.
- If `P₀` and every `Q k` are positive semidefinite and every `R k` is positive definite, every
  `predCov M k` and `filtCov M k` is positive semidefinite (1.2, 1.3); if moreover every `Q k` is
  positive definite, `predCov M k` is positive definite for `k ≥ 1`.

**Checks.**
- The scalar model with `m₀ = 0`: `x̂(0|0) = y(0)/2`, `x̂(1|0) = y(0)/2` and
  `x̂(1|1) = (y(0) + 3 y(1))/5`, with `P(1|1) = 3/5`.
- Horizon `0`: `filtMean M ys 0 = m₀ + K (ys 0 − C 0 m₀)` with the gain of `P₀`, a single
  Gaussian conditioning.

*Needs:* 1.1, 1.2, 1.3.

### 2.3 The Gaussian model

Define `IsLinearGaussianModel M P x y w v` for random sequences `x, w : ℕ → Ω → EuclideanSpace ℝ ι`
and `y, v : ℕ → Ω → EuclideanSpace ℝ κ` on a measure space `(Ω, P)`: for all `k` and `ω`,
`x (k + 1) ω = A k (x k ω) + w k ω` and `y k ω = C k (x k ω) + v k ω`; `x 0`, every `w k` and
every `v k` are measurable; `P₀` and every `Q k` are positive semidefinite; `x 0` has law
`multivariateGaussian m₀ P₀`, `w k` has law `multivariateGaussian 0 (Q k)` and `v k` has law
`multivariateGaussian 0 (R k)`; and the family `x 0, w 0, v 0, w 1, v 1, …` is mutually
independent, stated as: the pairs `(w k, v k)` are independent over `k`, `w k` and `v k` are
independent for each `k`, and `x 0` is independent of the whole sequence of pairs. Define
`obsWindow y k ω`, the vector `(y 0 ω, …, y k ω)`. This is the model of Anderson–Moore, §3.1,
p. 38, with `G = 1`, and of Särkkä, equation (4.17), p. 56.

Prove: in the Gaussian model on a probability space, for all `k` and `N`, the vector made of
`x k`, `x (k + 1)` and the observations up to time `N` has a Gaussian law, since it is an affine
image of the finitely many independent Gaussian vectors `x 0`, `w j` and `v j` for
`j ≤ max k N`.

**Checks.**
- The three independence statements cannot be replaced by the first one alone: when `κ = ι`,
  `Q k = R k = 1` and `v k = w k` for all `k`, the pairs are independent over `k` but `w 0` and
  `v 0` are not independent.
- Positive semidefiniteness of `P₀` is needed by 3.1: on `ℝ¹` with `P₀ = −1`, `C 0 = 1` and
  `R 0 = 2`, the law `multivariateGaussian m₀ P₀` is the point mass at `m₀`, so `x 0 = m₀`
  almost surely; the recursion gives the gain `−1`, `x̂(0|0) = 2 m₀ − y(0)` and
  `P(0|0) = −2`, and `multivariateGaussian (2 m₀ − y(0)) (−2)` is the point mass at
  `2 m₀ − y(0)`, which differs from `m₀` whenever `y(0) ≠ m₀`, an event of probability `1`.

*Needs:* 2.1; Mathlib `multivariateGaussian`, `ProbabilityTheory.iIndepFun.hasGaussianLaw`,
`ProbabilityTheory.iIndepFun.indepFun_finset`; Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`.

### 2.4 The second-order model

Define `IsSecondOrderModel M P x y w v`: the same two recursions everywhere; `x 0`, every `w k`
and every `v k` are in `L²(P)`; `∫ x 0 = m₀`, `∫ w k = 0`, `∫ v k = 0`; the covariances are
`cov[⟪a, x 0⟫, ⟪b, x 0⟫] = ⟪a, P₀ b⟫`, `cov[⟪a, w k⟫, ⟪b, w k⟫] = ⟪a, Q k b⟫`,
`cov[⟪a, v k⟫, ⟪b, v k⟫] = ⟪a, R k b⟫`; and `x 0`, the `w j` and the `v j` are pairwise
uncorrelated (for `w` and `v` with themselves, at distinct times). This is the setting of
Anderson–Moore, §3.2, p. 46. Prove:

- If `P` is a probability measure, every `R k` is positive semidefinite and
  `IsLinearGaussianModel M P x y w v` holds, then `IsSecondOrderModel M P x y w v` holds.
- In a second-order model on a probability space, `P₀` and every `Q k` and `R k` are symmetric
  and positive semidefinite.

**Checks.**
- The hypothesis on `R k` in the first bullet is needed: if `R 0` is not positive semidefinite,
  `v 0` has the law `multivariateGaussian 0 (R 0)`, which is the point mass at `0`, and its
  covariance is `0`, not `R 0`.
- `x 0` uniform on `{−1, 1}`, every other variable as in the Gaussian model: a second-order
  model with `m₀ = 0` and `P₀ = 1` that is not Gaussian.

*Needs:* 2.1, 2.3; Mathlib `ProbabilityTheory.covarianceBilin_multivariateGaussian`,
`ProbabilityTheory.integral_id_multivariateGaussian`, `ProbabilityTheory.IsGaussian.memLp_two_id`,
`ProbabilityTheory.iIndepFun.indepFun_finset`, `ProbabilityTheory.IndepFun.covariance_eq_zero`.

### 2.5 The orthogonality principle

Prove, in a second-order model on a probability space with every `R k` positive definite:

- `filtError_orthogonal`: the filtering error `x k − x̂(k|k)` has mean zero, is uncorrelated with
  every `y i` with `i ≤ k`, and has covariance `P(k|k)`;
- `predError_orthogonal`: the prediction error `x (k + 1) − x̂(k+1|k)` has mean zero, is
  uncorrelated with every `y i` with `i ≤ k`, and has covariance `P(k+1|k)`.

Route: induction on `k`. At time `0` the prediction error is `x 0 − m₀`. Given the statement for
the prediction error `ε` at time `k`, the innovation `e = y k − C k x̂(k|k−1) = C k ε + v k` has
mean zero, covariance `S = C k P(k|k−1) (C k)ᵀ + R k`, is uncorrelated with every `y i`, `i < k`,
and has cross-covariance `P(k|k−1) (C k)ᵀ` with `ε`; the filtering error is `ε − K e` with the
gain `K`, which is uncorrelated with `e` because `K S = P(k|k−1) (C k)ᵀ`, and its covariance is
the measurement update by 1.2. The next prediction error is
`A k (x k − x̂(k|k)) + w k`, and `w k` is uncorrelated with `x k` and with every `y i`, `i ≤ k`.
This is the derivation of Anderson–Moore, §5.4, pp. 105–108, where the same equations are noted
to hold for linear minimum variance estimation without Gaussianity (p. 105), and it is the
projection theorem of Anderson–Moore, §5.2, Theorem 2.5, p. 95, applied recursively.

**Checks.**
- Scalar model, `k = 0`: `cov(x 0 − y 0/2, y 0) = 1 − 2/2 = 0` and
  `var(x 0 − y 0/2) = 1 − 1 + 2/4 = 1/2 = P(0|0)`.
- Without positive definiteness of `R`: in the model on `ℝ²` with `A = C = 1`, `Q = R = 0`,
  `P₀ = diag(1, 0)` and `m₀ = 0`, the junk inverse gives `x̂(0|0) = 0` and `P(0|0) = diag(1, 0)`,
  so the filtering error is `x 0` itself, and its cross-covariance with the observation
  `y 0 = x 0` is `diag(1, 0) ≠ 0`: the error is not uncorrelated with the observation.

*Needs:* 1.1, 1.2, 2.2, 2.4; Mathlib `ProbabilityTheory.covariance` and its bilinearity
lemmas.

### Examples

The scalar model of Layer 1 with `m₀ = 0`, `y(0)` and `y(1)` observed; the model on `ℝ²` with
an exactly observed coordinate, which shows what the junk inverse does.

### Dependencies

Layer 1 (1.1, 1.2, 1.3); Mathlib `multivariateGaussian`,
`ProbabilityTheory.covarianceBilin_multivariateGaussian`,
`ProbabilityTheory.integral_id_multivariateGaussian`, `ProbabilityTheory.IsGaussian.memLp_two_id`,
`ProbabilityTheory.iIndepFun.hasGaussianLaw`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.IndepFun.covariance_eq_zero`, `ProbabilityTheory.covariance`; Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`.

## Layer 3: the conditional laws of the state

### 3.1 The Kalman filter

Prove `condDistrib_state_obsWindow`: in the Gaussian model on a probability space with every
`R k` positive definite, for every `k`, the conditional law of `x k` given `obsWindow y k` is,
almost everywhere for the law of the window, `N(filtMean M t k, filtCov M k)` at the window `t`
read as a sequence (Anderson–Moore, §3.1, pp. 38–40, the first-principles derivation, with
equations (1.11) and (1.12); Särkkä, Theorem 4.2, p. 57).

Route: let `E = x k − x̂(k|k)` and let `Y` be the window. By 2.3, `(E, Y)` has a Gaussian law; by
2.4 and 2.5, `E` is uncorrelated with every coordinate of `Y`, so `E` and `Y` are independent
(`ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_strongDual`). The law of `E` is
Gaussian with mean `0` and covariance `P(k|k)`, which is positive semidefinite (2.2), so it is
`multivariateGaussian 0 (filtCov M k)` by `ProbabilityTheory.IsGaussian.ext_covarianceBilinDual`.
Then the joint law of `(Y, x k) = (Y, x̂(k|k)(Y) + E)` is the law of `Y` composed with the kernel
`t ↦ N(x̂(k|k)(t), P(k|k))`, measurable by `ProbabilityTheory.measurable_multivariateGaussian`,
since the image of `N(0, P)` under translation by `c` is `N(c, P)`; conclude with
`ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`.

- Prove, as part of this target, the intermediate statement of the route: the filtering error
  `x k − x̂(k|k)` is independent of `obsWindow y k` and has the law
  `multivariateGaussian 0 (filtCov M k)`; 5.3 uses it.

**Checks.**
- The scalar model at `k = 1`: the conditional law is `N((y(0) + 3 y(1))/5, 3/5)`; conditioning
  the Gaussian vector `(x 1, y 0, y 1)`, whose observation covariance is `[[2, 1], [1, 3]]` and
  whose cross-covariance is `(1, 2)`, gives the coefficients `(1/5, 3/5)` and the variance
  `2 − 7/5 = 3/5`.
- `C = 0`: the observations carry no information, the gains vanish, and the conditional law is
  the unconditional law `N(A(k−1)⋯A(0) m₀, P(k|k))` of `x k`.
- `R` positive definite cannot be dropped: in the model on `ℝ²` of the Check of 2.5,
  `x 0 = y 0` almost surely, so the conditional law of `x 0` is the point mass at `y 0`, while
  the recursion with the junk inverse gives `N(0, diag(1, 0))`.

*Needs:* 2.2, 2.3, 2.4, 2.5; Mathlib
`ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_strongDual`,
`ProbabilityTheory.IsGaussian.ext_covarianceBilinDual`, `ProbabilityTheory.measurable_multivariateGaussian`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`,
`ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`; Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`.

### 3.2 One-step prediction

Prove `condDistrib_succ_state_obsWindow`: under the same hypotheses, the conditional law of
`x (k + 1)` given `obsWindow y k` is, almost everywhere for the law of the window,
`N(predMean M t (k + 1), predCov M (k + 1))` (Anderson–Moore, §3.1, step 2 of the derivation,
p. 40; Särkkä, Theorem 4.2, p. 57).

Route: as in 3.1, with `predError_orthogonal` in place of `filtError_orthogonal`.

**Checks.**
- The scalar model at `k = 0`: the conditional law of `x 1` given `y 0` is `N(y(0)/2, 3/2)`.
- With `A k = 0` and `Q k = 1` the prediction is `N(0, 1)` whatever the observations.

*Needs:* 2.2, 2.3, 2.4, 2.5; the Mathlib and Tau Ceti declarations of 3.1.

### Examples

The scalar model at times `0` and `1`, and the degenerate cases `C = 0` and `A = 0`.

### Dependencies

Layer 1 (1.1) and Layer 2 (2.2–2.5); Mathlib
`ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_strongDual`,
`ProbabilityTheory.IsGaussian.ext_covarianceBilinDual`, `ProbabilityTheory.measurable_multivariateGaussian`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`,
`ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`; Tau Ceti
`TauCeti.Probability.map_affine_multivariateGaussian`.

## Layer 4: innovations

### 4.1 The innovation sequence

Define `innovation M y k ω = y k ω − C k (predMean M (fun j => y j ω) k)`. Prove:

- `obsWindow y k` and the vector of innovations up to time `k` are functions of each other:
  `innovation` up to time `k` is an affine function of `obsWindow y k`, and `y k` is
  `innovation M y k` plus an affine function of the innovations before time `k`, by induction
  (Anderson–Moore, §5.3, Theorem 3.1, part 2, p. 102).
- In a second-order model with every `R k` positive definite, the innovations have mean zero,
  are pairwise uncorrelated, and the innovation at time `k` has covariance
  `innovationCov (C k) (R k) (predCov M k)` (Anderson–Moore, §5.4, p. 107).

Route for the second bullet: the innovation at time `k` is `C k ε + v k` with `ε` the prediction
error of 2.5, which is uncorrelated with every `y i`, `i < k`, and therefore with every earlier
innovation, an affine function of those `y i`; `v k` is uncorrelated with `ε` and with every
earlier observation.

*Needs:* 2.2, 2.4, 2.5.

### 4.2 Independence and law

Prove, in the Gaussian model on a probability space with every `R k` positive definite:

- `iIndepFun_innovation`: the innovations are mutually independent;
- `hasLaw_innovation`: the innovation at time `k` has law
  `multivariateGaussian 0 (innovationCov (C k) (R k) (predCov M k))`.

(Anderson–Moore, §5.3, Theorem 3.1, part 1, p. 102, whiteness of the innovations of any
Gaussian sequence, which is independence by joint Gaussianity, and §5.4, p. 107,
for the covariance; Särkkä, Theorem 4.2, equation (4.19), p. 57, for the conditional law of
`y k` given the earlier observations.)

Route: any finitely many innovations are an affine function of finitely many independent Gaussian
vectors (2.3), so they are jointly Gaussian; they are pairwise uncorrelated (4.1), hence
independent by `ProbabilityTheory.HasGaussianLaw.iIndepFun_of_covariance_inner`; independence of
the whole sequence is independence of its finite subfamilies. The law of each is identified by
its mean and covariance as in 3.1.

**Checks.**
- Scalar model: the innovations `y 0` and `y 1 − y 0/2` have variances `2` and `5/2`, and
  `cov(y 0, y 1 − y 0/2) = 1 − 2/2 = 0`.
- `R` positive definite cannot be dropped for independence: in the model on `ℝ²` of the Check of
  2.5, the junk inverse gives `x̂(0|−1) = x̂(1|0) = 0`, so the first two innovations are both
  equal to `x 0`; they are not independent, although each has the law
  `multivariateGaussian 0 (diag(1, 0))` that the second bullet predicts.

*Needs:* 2.3, 2.4, 4.1; Mathlib `ProbabilityTheory.HasGaussianLaw.iIndepFun_of_covariance_inner`,
`ProbabilityTheory.iIndepFun.hasGaussianLaw`, `ProbabilityTheory.IsGaussian.ext_covarianceBilinDual`,
`ProbabilityTheory.iIndepFun_iff_finset`.

### Examples

The scalar model's first two innovations, and the exactly observed coordinate of the model on
`ℝ²`.

### Dependencies

Layer 2 (2.2–2.5); Mathlib `ProbabilityTheory.HasGaussianLaw.iIndepFun_of_covariance_inner`,
`ProbabilityTheory.iIndepFun.hasGaussianLaw`, `ProbabilityTheory.IsGaussian.ext_covarianceBilinDual`,
`ProbabilityTheory.iIndepFun_iff_finset`. Layer 1 enters through Layer 2.

## Layer 5: optimality

### 5.1 The conditional expectation

Prove `filtMean_ae_eq_condExp`: in the Gaussian model on a probability space with every `R k`
positive definite, `ω ↦ filtMean M (fun j => y j ω) k` is almost everywhere equal to the
conditional expectation of `x k` given the σ-algebra generated by `obsWindow y k`
(Anderson–Moore, §3.1, p. 37, where the filtered estimate is defined as this conditional mean).

Route: `ProbabilityTheory.condExp_ae_eq_integral_condDistrib` expresses the conditional
expectation as the mean of the conditional law, and 3.1 identifies that law; the mean of
`multivariateGaussian μ S` is `μ` (`ProbabilityTheory.integral_id_multivariateGaussian`). The
window is measurable because the primitive variables are.

**Checks.**
- Scalar model, `k = 0`: the conditional expectation of `x 0` given `y 0` is `y(0)/2`.
- In the Rademacher example of 5.2 below, which is not Gaussian, the conditional expectation of
  `x 0` given `y 0` is `tanh(4 y 0)`, not the filtered mean `(4/5) y 0`.

*Needs:* 3.1; Mathlib `ProbabilityTheory.condExp_ae_eq_integral_condDistrib`,
`ProbabilityTheory.integral_id_multivariateGaussian`.

### 5.2 The best affine estimator

Prove `lintegral_sq_error_filtMean_le_affine`: in a second-order model on a probability space
with every `R k` positive definite, for every affine map
`g : (Fin (k + 1) → EuclideanSpace ℝ κ) →ᵃ[ℝ] EuclideanSpace ℝ ι`, the mean squared error of
the filtered mean is `ENNReal.ofReal (trace P(k|k))` and is at most that of
`g (obsWindow y k)` (Anderson–Moore, §5.2, Theorem 2.1, p. 93, for one observation vector, and
§5.4, p. 105, for the filter; Anderson–Moore, §3.2, Theorem 2.1, p. 47, compares the filter only
with filters of its own recursive form).

Route: by 2.5 the error `x k − x̂(k|k)` has mean zero, covariance `P(k|k)` and is uncorrelated
with every coordinate of the window; `x̂(k|k) − g(window)` is an affine function of the window,
so the cross term vanishes and
`E‖x k − g(window)‖² = trace P(k|k) + E‖x̂(k|k) − g(window)‖²`.

**Checks.**
- Gaussianity is what makes the filtered mean optimal among all estimators, and the restriction
  to affine `g` is needed here: take `x 0` uniform on `{−1, 1}`, `C 0 = 1`, `R 0 = 1/4` and
  `v 0` Gaussian. The filtered mean `(4/5) y 0` has mean squared error `1/5`, while the
  non-affine estimator `sign(y 0)` has mean squared error `4 Φ(−2) ≈ 0.0910`, where `Φ` is the
  standard normal distribution function.
- With uniform noises of the same covariances the error is still `trace P(k|k)`: the statement
  sees second moments only.

*Needs:* 2.2, 2.4, 2.5; Mathlib `ProbabilityTheory.covariance`,
`MeasureTheory.ofReal_integral_eq_lintegral_ofReal`.

### 5.3 Minimum mean squared error

Prove `lintegral_sq_error_filtMean_le`: in the Gaussian model on a probability space with every
`R k` positive definite, for every measurable `g : (Fin (k + 1) → EuclideanSpace ℝ κ) →
EuclideanSpace ℝ ι`,
`∫⁻ ‖x k − x̂(k|k)‖ₑ² ≤ ∫⁻ ‖x k − g (obsWindow y k)‖ₑ²`. Prove also that the left side equals
`ENNReal.ofReal (trace P(k|k))`, the case of 5.2 obtained through 2.4 (Anderson–Moore, §3.1,
p. 37, and §5.2, Theorem 2.2, p. 94).

Route: if the right side is finite, `g (obsWindow y k)` is in `L²`; the error `x k − x̂(k|k)` is
independent of the window (3.1) and centred, so it is orthogonal in `L²` to
`x̂(k|k) − g(window)`, and the two squared norms add.

**Checks.**
- Scalar model at `k = 1`: the minimum is `3/5`, attained by `(y(0) + 3 y(1))/5`; the
  estimator `y 1` alone has mean squared error `var(x 1 − y 1) = var(v 1) = 1`.

*Needs:* 2.4, 3.1, 5.2.

### Examples

The scalar model; the Rademacher initial state of 5.2, the standard example separating the best
affine estimator from the conditional expectation.

### Dependencies

Layer 2 (2.2, 2.4, 2.5) and Layer 3 (3.1); Mathlib
`ProbabilityTheory.condExp_ae_eq_integral_condDistrib`,
`ProbabilityTheory.integral_id_multivariateGaussian`, `ProbabilityTheory.covariance`,
`MeasureTheory.ofReal_integral_eq_lintegral_ofReal`.

## Layer 6: the Rauch–Tung–Striebel smoother

### 6.1 The backward recursion

Define `smootherGain M k = P(k|k) (A k)ᵀ P(k+1|k)⁻¹`, and for a horizon `N`, by recursion on the
number `j` of steps back from `N`, the smoothed covariances `smoothCovBack M N` and means
`smoothMeanBack M ys N`: at `j = 0` the filtered covariance and mean at `N`; at step `j + 1`,
with `k = N − (j + 1)` and `J = smootherGain M k`,

    P(k|N) = P(k|k) + J (P(k+1|N) − P(k+1|k)) Jᵀ,
    x̂(k|N) = x̂(k|k) + J (x̂(k+1|N) − x̂(k+1|k)).

Define `smoothCov M N k = smoothCovBack M N (N − k)` and
`smoothMean M ys N k = smoothMeanBack M ys N (N − k)`, used for `k ≤ N`
(Anderson–Moore, §7.4, equations (4.5) to (4.7), p. 189; Särkkä, Theorem 8.2, p. 136).

**Checks.**
- `k = N`: the smoothed mean and covariance are the filtered ones.
- Scalar model, `N = 1`: `J = (1/2)/(3/2) = 1/3`, `x̂(0|1) = (2 y(0) + y(1))/5` and
  `P(0|1) = 1/2 + (1/9)(3/5 − 3/2) = 2/5`.

*Needs:* 2.2.

### 6.2 Orthogonality of the smoothing error

Prove, in a second-order model on a probability space with every `R k` positive definite, for
`k ≤ N` with `P(j+1|j)` positive definite for `k ≤ j < N`: the smoothing error
`x k − x̂(k|N)` has mean zero, is uncorrelated with every `y i` with `i ≤ N`, and has covariance
`P(k|N)`.

Route: backward induction from `k = N` (2.5). Write
`x k − x̂(k|N) = (x k − x̂(k|k) − J (x (k+1) − x̂(k+1|k))) + J (x (k+1) − x̂(k+1|N))`. The first
term is uncorrelated with every `y i`, `i ≤ k` (2.5), with `x (k+1) − x̂(k+1|k)` because
`J P(k+1|k) = P(k|k) (A k)ᵀ`, which is where the inverse is used, and with the later noises; every
`y i` with `k < i ≤ N` is an affine function of `y 0, …, y k`, of `x (k+1) − x̂(k+1|k)` and of
those noises. The second term is handled by the induction hypothesis. The covariance is
`P(k|k) − J P(k+1|k) Jᵀ + J P(k+1|N) Jᵀ`.

**Checks.**
- The hypothesis on the predicted covariances cannot be dropped: in the model on `ℝ²` with
  `A = 1`, `C = (1 0)`, `Q = 0`, `R = 1`, `P₀ = diag(1, 0)`, `m₀ = 0`, and observations
  `y 0 = 1`, `y 1 = 2`, the predicted covariance `P(1|0) = diag(1/2, 0)` is singular; the
  recursion with the junk inverse gives `x̂(0|1) = (1/2, 0)` and `P(0|1) = diag(1/2, 0)`, while
  conditioning the Gaussian vector directly gives `(1, 0)` and `diag(1/3, 0)`.

*Needs:* 2.2, 2.4, 2.5, 6.1.

### 6.3 The smoothed conditional law

Prove `condDistrib_state_obsWindow_smooth`: in the Gaussian model on a probability space with
every `R k` positive definite, for `k ≤ N` with `P(j+1|j)` positive definite for `k ≤ j < N`,
the conditional law of `x k` given `obsWindow y N` is, almost everywhere for the law of the
window, `N(smoothMean M t N k, smoothCov M N k)` (Anderson–Moore, §7.4, p. 189; Särkkä,
Theorem 8.2, p. 136).

Route: as in 3.1, with 6.2 in place of 2.5; `P(k|N)` is positive semidefinite as the covariance
of the smoothing error.

**Checks.**
- Scalar model, `N = 1`, `k = 0`: the conditional law of `x 0` given `(y 0, y 1)` is
  `N((2 y(0) + y(1))/5, 2/5)`; conditioning directly, the covariance of `(y 0, y 1)` is
  `[[2, 1], [1, 3]]`, the cross-covariance with `x 0` is `(1, 1)`, the coefficients are
  `(2/5, 1/5)` and the variance is `1 − 3/5 = 2/5`.
- If every `Q j` is positive definite, every `P(j+1|j)` is (2.2), and the hypothesis holds.

*Needs:* 2.3, 6.1, 6.2; the Mathlib and Tau Ceti declarations of 3.1.

### Examples

The scalar model over the horizon `N = 1`; the model on `ℝ²` with a singular predicted
covariance.

### Dependencies

Layer 2 (2.2–2.5); Mathlib and Tau Ceti as in Layer 3. Layer 1 enters through Layer 2.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the innovation covariance, the
Kalman gain, the measurement and time updates and the Riccati map as maps of matrices, with the
completion of the square, positivity, monotonicity and the information form; the state-space
model in its Gaussian and second-order forms, the filter recursion and the orthogonality
principle; the conditional laws of filtering, one-step prediction and fixed-interval smoothing;
the innovations; and the optimality theorems. The covariance recursion of Layer 1 is stated as
pure matrix algebra so that work on linear systems and control can use it without the
probabilistic layers.

Already in the libraries and therefore not targets:

- Multivariate Gaussian measures with their means and covariances, and the measurability of
  `(m, S) ↦ multivariateGaussian m S` (Mathlib); affine images of multivariate Gaussians (Tau
  Ceti `TauCeti.Probability.map_affine_multivariateGaussian`).
- Independent Gaussian vectors are jointly Gaussian, and jointly Gaussian uncorrelated vectors
  are independent (Mathlib, in
  `Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Independence.lean`).
- Conditioning one block of a Gaussian vector on another, with the pseudoinverse for a singular
  observed block (Tau Ceti `TauCeti.Probability.condDistrib_multivariateGaussian`,
  `Matrix.gaussianCondCov`, `EuclideanSpace.gaussianCondMean`), planned in StandardDistributions
  §5.4. Layer 1 compares the measurement update with `Matrix.gaussianCondCov`; the filter for a
  single time step is that theorem, and the recursion is what this roadmap adds.
- Schur complements of positive definite blocks (`Matrix.PosDef.fromBlocks₂₂`), the Woodbury
  identity (`Matrix.add_mul_mul_inv_eq_sub`), regular conditional distributions with their
  characterization by disintegration (`ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`)
  and conditional expectation as the mean of the conditional law
  (`ProbabilityTheory.condExp_ae_eq_integral_condDistrib`).

Not treated here: the behaviour of the Riccati recursion as `k → ∞` (convergence to a solution of
the algebraic Riccati equation, stability of the steady-state filter), and with it
controllability and observability Gramians, the Kalman rank condition, stabilizability and
detectability; the duality between filtering and linear-quadratic control; the Kalman–Bucy filter
in continuous time; extended, unscented and other filters for nonlinear models; correlated
process and observation noise and known inputs; fixed-point and fixed-lag smoothing; filtering of
hidden Markov models with finite state spaces; least squares and the Gauss–Markov theorem for
linear regression; square-root and other numerical forms of the recursions; and conditioning with
a singular innovation covariance, which would replace the inverse by a pseudoinverse.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef.mul_mul_conjTranspose_same`
  and `Matrix.PosSemidef.conjTranspose_mul_mul_same` (for `A` positive semidefinite, `B A Bᴴ`
  and `Bᴴ A B` are positive semidefinite, `B` rectangular);
  `Matrix.PosSemidef.posDef_iff_isUnit` (a positive semidefinite matrix is positive definite if
  and only if it is invertible);
  `Matrix.PosSemidef.add` and `Matrix.PosDef.add_posSemidef` (sums); `Matrix.PosDef.isUnit` and
  `Matrix.PosDef.inv` (a positive definite matrix is invertible, with positive definite inverse);
  `Matrix.PosDef.fromBlocks₂₂` (for `D` positive definite and invertible,
  `fromBlocks A B Bᴴ D` is positive semidefinite if and only if `A − B D⁻¹ Bᴴ` is).
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.add_mul_mul_inv_eq_sub` (for
  `A`, `C` and `C⁻¹ + V A⁻¹ U` units,
  `(A + U C V)⁻¹ = A⁻¹ − A⁻¹ U (C⁻¹ + V A⁻¹ U)⁻¹ V A⁻¹`).
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`:
  `ProbabilityTheory.multivariateGaussian m S` on
  `EuclideanSpace ℝ ι` (the point mass at `m` when `S` is not positive semidefinite);
  `ProbabilityTheory.integral_id_multivariateGaussian` (its mean is `m`, no hypothesis);
  `ProbabilityTheory.covarianceBilin_multivariateGaussian` (for `S` positive semidefinite, its
  covariance form is `(x, y) ↦ x ⬝ᵥ S y`); `ProbabilityTheory.measurable_multivariateGaussian`.
- `Mathlib/Probability/Distributions/Gaussian/CharFun.lean`:
  `ProbabilityTheory.IsGaussian.ext_covarianceBilinDual` (two Gaussian measures with equal means
  and covariance forms are equal). `Mathlib/Probability/Distributions/Gaussian/Fernique.lean`:
  `ProbabilityTheory.IsGaussian.memLp_two_id` (a Gaussian measure has finite second moment).
- `Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Independence.lean`:
  `ProbabilityTheory.iIndepFun.hasGaussianLaw` (finitely many independent Gaussian vectors are
  jointly Gaussian); `ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_strongDual` (two
  jointly Gaussian vectors in normed spaces, uncorrelated under all continuous linear functionals,
  are independent); `ProbabilityTheory.HasGaussianLaw.iIndepFun_of_covariance_inner` (the same for
  finitely many vectors in inner product spaces).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun.indepFun_finset`
  (for measurable independent variables, the families over disjoint finite index sets are
  independent); `ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map` (independence is the
  product form of the joint law); `ProbabilityTheory.iIndepFun_iff_finset` (a family is
  independent if and only if its restriction to every finite set of indices is).
- `Mathlib/Probability/Kernel/CondDistrib.lean`: `ProbabilityTheory.condDistrib`;
  `ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd` (a finite kernel `κ` with
  `law(X, Y) = law(X) ⊗ κ` agrees with `condDistrib Y X` almost everywhere for the law of `X`);
  `ProbabilityTheory.condExp_ae_eq_integral_condDistrib` (for measurable `X`, the conditional
  expectation of `f ∘ Y` given `X` is the integral of `f` against the conditional law).
- `Mathlib/Probability/Moments/Covariance.lean`: `ProbabilityTheory.covariance`, written
  `cov[X, Y; P]`, with its bilinearity; `ProbabilityTheory.IndepFun.covariance_eq_zero`
  (independent real variables in `L²` have covariance `0`).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.ofReal_integral_eq_lintegral_ofReal` (for an integrable almost everywhere
  nonnegative function, the two integrals agree).

### From Tau Ceti

- `TauCeti/Probability/Distributions/Gaussian/Affine.lean`:
  `TauCeti.Probability.map_affine_multivariateGaussian` (for `S` positive semidefinite, the image
  of `multivariateGaussian m S` under `z ↦ L z + c` is `multivariateGaussian (L m + c) (L S Lᵀ)`).
- `TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.lean`: `Matrix.gaussianCondCov_of_posDef`
  (for a positive definite observed block, the conditional covariance is the ordinary Schur
  complement), used for the comparison in 1.1.

## References

- Brian D. O. Anderson and John B. Moore, *Optimal Filtering*, Prentice-Hall, 1979; the scan of
  the book posted on John B. Moore's page at the Australian National University. Locators are
  section, equation or theorem numbers and printed pages; theorem and equation numbers restart in
  each section.
- Simo Särkkä, *Bayesian Filtering and Smoothing*, Cambridge University Press, 2013; the version
  of 11 November 2013 that the author makes available on his page at Aalto University, with the
  page numbers of the book. Its measurements start at time `1`.
- Attributions made in prose without a locator: Rudolf E. Kalman (the filter, 1960); Herbert E.
  Rauch, F. Tung and Charlotte T. Striebel (the fixed-interval smoother, 1965); Peter D. Joseph
  (the symmetric form of the covariance update in 1.2).

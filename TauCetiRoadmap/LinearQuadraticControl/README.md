# Roadmap: linear-quadratic control

**Summary.** This roadmap develops the linear-quadratic regulator in discrete time. A controller
steers the linear system `x(k+1) = A x(k) + B u(k)`, with real `n × n` and `n × m` matrices, and
pays at each step the quadratic cost `x(k)ᵀ Q x(k) + u(k)ᵀ R u(k)`, plus a terminal cost
`x(N)ᵀ S x(N)` when the horizon `N` is finite. The central object is the Riccati map
`P ↦ Aᵀ P A − Aᵀ P B (R + Bᵀ P B)⁻¹ Bᵀ P A + Q`, the covariance recursion of the Kalman filter
written for the transposed pair. Every target is an identity, an inequality or a convergence
statement about these matrices and the costs; no design procedure or numerical method is
specified.

The headline theorems are these.

- *The finite-horizon regulator.* For time-varying coefficients, symmetric `Q(k)` and `S`, and
  `R(k) + B(k)ᵀ P(k+1) B(k)` positive definite, where `P(N) = S` and `P(k)` is the Riccati map
  applied to `P(k+1)`, the least cost from `x₀` is `x₀ᵀ P(0) x₀`. It is attained exactly by the
  state feedback `u(k) = −(R(k) + B(k)ᵀ P(k+1) B(k))⁻¹ B(k)ᵀ P(k+1) A(k) x(k)`.
- *Stabilizability.* Some feedback `F` makes every eigenvalue of `A + B F` lie in the open unit
  disc if and only if `[μI − A, B]` has full rank for every complex `μ` with `|μ| ≥ 1`, if and
  only if every initial state can be steered to `0` asymptotically.
- *The infinite-horizon regulator.* If `Q` is positive semidefinite, `R` positive definite and
  `(A, B)` stabilizable, the Riccati iterates from `0` increase to the least positive
  semidefinite solution `P` of the discrete-time algebraic Riccati equation; the least
  infinite-horizon cost from `x₀` is `x₀ᵀ P x₀`, attained exactly by the stationary feedback of
  `P`. If moreover `Q = CᵀC` with `(A, C)` detectable, that solution is the only positive
  semidefinite one, the closed loop is stable, and the iterates converge to it from every positive
  semidefinite start.
- *The steady-state Kalman filter.* By duality, if the observation-noise covariance is positive
  definite, `(A, C)` is detectable and `(A, G)` stabilizable, the filter's covariance recursion
  with process-noise covariance `G Gᵀ` converges from every positive semidefinite start to the
  unique positive semidefinite fixed point, and the steady-state error dynamics are stable.

The roadmap builds on three roadmaps. KalmanFiltering supplies the Riccati map with its positivity
and monotonicity in the Loewner order. LinearSystemsAndControl supplies controllability, the
Hautus test, the Kalman decomposition, the pole-shifting theorem, Schur stable matrices and the
Stein equation. IterativeMethodsForLinearSystems supplies the convergence to zero of the powers of
a matrix whose eigenvalues lie in the open unit disc. Mathlib supplies positive definite matrices,
the continuity of the matrix inverse and the closedness of the positive semidefinite cone. Layer 1
below treats the finite horizon; Layer 2 stabilizability and detectability; Layer 3 value iteration
and the algebraic Riccati equation; Layer 4 the stabilizing solution; Layer 5 the dual statement
for the Kalman filter.

## How to read the build

Layer 1 below depends on no other layer: it defines the state of the time-varying system, the
finite-horizon cost, the cost-to-go matrices and the regulator gain, and proves the completion of
the square and the finite-horizon regulator theorem. Layer 2 depends on Layer 1 only through the
state `ltvState` of 1.1, which 2.3 uses: it defines
stabilizability and detectability in discrete time and proves their rank and trajectory
characterizations. Layer 3 depends on Layers 1 and 2: value iteration, the algebraic Riccati
equation and the infinite-horizon regulator. Layer 4 depends on Layers 1, 2 and 3: the stabilizing
solution. Layer 5 depends on Layers 2 and 4: the steady-state Kalman filter. Within a layer the
sections are in build order.

## Conventions

- **Spaces and matrices.** `n`, `m`, `p`, `q` are finite types with decidable equality (states,
  inputs, outputs, noise inputs), any of which may be empty. States are vectors `x : n → ℝ`,
  inputs `u : m → ℝ`; a matrix acts by `*ᵥ`, and `x ⬝ᵥ M *ᵥ x` is the quadratic form `xᵀ M x`.
  `Mᵀ` is the transpose. Positive semidefinite and positive definite are Mathlib's
  `Matrix.PosSemidef` and `Matrix.PosDef`, which include symmetry; symmetric is
  `Matrix.IsHermitian` over `ℝ`. The Loewner order is written out: `P ≤ P'` means that `P' − P` is
  positive semidefinite.
- **The Riccati map.** `riccatiMap A C Q R P = A (P − P Cᵀ (C P Cᵀ + R)⁻¹ C P) Aᵀ + Q` is the map
  of KalmanFiltering 1.1, copied verbatim into `Suggested.lean` with its auxiliary maps
  `innovationCov`, `kalmanGain`, `measurementUpdate` and `timeUpdate`. The control Riccati map of
  `(A, B, Q, R)` is `riccatiMap Aᵀ Bᵀ Q R`, which unfolds to
  `Aᵀ P A − Aᵀ P B (Bᵀ P B + R)⁻¹ Bᵀ P A + Q`. No new name is given to it. Its iterates are
  `(riccatiMap Aᵀ Bᵀ Q R)^[j]`.
- **Inverses.** `M⁻¹` is Mathlib's inverse of a square matrix, which is `0` when `M` is singular.
  Every statement that uses an inverse in a way that matters assumes what makes the matrix
  invertible: in Layer 1 the matrices `R(k) + B(k)ᵀ P(k+1) B(k)` are positive definite, and in
  Layers 3 to 5 the matrix `R` is positive definite. Checks below show the junk value giving
  wrong answers when these hypotheses are dropped.
- **Feedback sign.** The regulator gain is `lqrGain A B R P = −(R + Bᵀ P B)⁻¹ Bᵀ P A`, so the
  closed loop is `A + B * lqrGain A B R P`, as in LinearSystemsAndControl, where feedback `F`
  gives `A + B * F`.
- **Time.** Time is `k : ℕ`, the state at time `0` is `x₀`, inputs are sequences
  `u : ℕ → m → ℝ`. In Layer 1 the coefficients are sequences `A, Q : ℕ → Matrix n n ℝ`,
  `B : ℕ → Matrix n m ℝ`, `R : ℕ → Matrix m m ℝ`, and only their values at `k < N` matter; the
  time-invariant system is the case of constant sequences `fun _ => A`.
- **Eigenvalues and stability.** As in LinearSystemsAndControl 5.1, the eigenvalues of a real
  matrix are the elements of `spectrum ℂ (A.map (algebraMap ℝ ℂ))`, and `IsSchurStable A` means
  that all of them have modulus less than one; the definition is copied verbatim from there.
- **Infinite sums.** Infinite-horizon costs are sums in `ℝ≥0∞` of the stage costs, each sent to
  `ℝ≥0∞` by `ENNReal.ofReal`; for `Q` and `R` positive semidefinite no stage cost is truncated,
  and a cost may be `∞`.

## Layer 1: the finite-horizon regulator

### 1.1 The system, the cost and the Riccati recursion

Define:

- `ltvState`, with `ltvState A B x₀ u : ℕ → n → ℝ`, by `ltvState A B x₀ u 0 = x₀` and
  `ltvState A B x₀ u (k + 1) = A k *ᵥ ltvState A B x₀ u k + B k *ᵥ u k`. For constant
  coefficients it is LinearSystemsAndControl's `discreteState` over `ℝ` (1.3 there); the
  time-varying form is needed here.
- `lqCost`, with `lqCost A B Q R S N x₀ u : ℝ`, the sum over `k < N` of
  `x(k) ⬝ᵥ Q k *ᵥ x(k) + u k ⬝ᵥ R k *ᵥ u k` plus the terminal cost `x(N) ⬝ᵥ S *ᵥ x(N)`, where
  `x = ltvState A B x₀ u`.
- `valueMatrix`, with `valueMatrix A B Q R S N k : Matrix n n ℝ`, the cost-to-go matrices: equal
  to `S` for `k ≥ N`, and for `k < N` equal to
  `riccatiMap (A k)ᵀ (B k)ᵀ (Q k) (R k) (valueMatrix A B Q R S N (k + 1))`. We write `P(k)` for
  `valueMatrix A B Q R S N k`.
- `lqrGain`, with `lqrGain A B R P = −((R + Bᵀ P B)⁻¹ Bᵀ P A) : Matrix m n ℝ`, the regulator
  gain of a cost-to-go matrix `P`. For symmetric `P` and `R` it is `−(kalmanGain Bᵀ R P)ᵀ A`,
  the transposed Kalman gain of the dual problem followed by `A`.

Prove:

- If `S`, every `Q k` and every `R k` with `k < N` are positive semidefinite, every `P(k)` is
  positive semidefinite, by KalmanFiltering 1.3 applied to `riccatiMap (A k)ᵀ (B k)ᵀ`; if
  moreover every `R k` with `k < N` is positive definite, every `R k + (B k)ᵀ P(k+1) (B k)` with
  `k < N` is positive definite. This is the usual situation in which the hypotheses of 1.2 hold.
- For constant coefficients, `P(k) = (riccatiMap Aᵀ Bᵀ Q R)^[N − k] S` for `k ≤ N`.

(Anderson–Moore, *Optimal Control*, §2.4, equations (2.4-11) to (2.4-13), pp. 31–32, with
`F = A`, `G = B`; there the recursion is written for `P + Q` and the weights are indexed one step
later. Sontag, Exercise 8.2.7, p. 369, poses the discrete-time recursion as an exercise.)

**Checks.**
- Scalar `A = B = Q = R = 1`, `S = 0`: the control Riccati map is `P ↦ P − P²/(1 + P) + 1`, and
  the cost-to-go matrices with `N − k = 0, 1, 2, 3, 4, 5` steps to go are
  `0, 1, 3/2, 8/5, 21/13, 55/34`, the covariances of the scalar Kalman filter of
  KalmanFiltering 1.1 shifted by one step. The gains are `0` at `k = N − 1` and `−1/2` at
  `k = N − 2`.
- The transposes matter: for `A = [[0, 1], [0, 0]]`, `B = 1`, `Q = 0`, `R = 1` (all `2 × 2`) and
  `P = 1`, the control Riccati map gives `riccatiMap Aᵀ Bᵀ Q R P = Aᵀ A / 2 = diag(0, 1/2)`, while
  the filter form without transposes gives `riccatiMap A B Q R P = A Aᵀ / 2 = diag(1/2, 0)`.

*Needs:* KalmanFiltering 1.1, 1.3; Mathlib `Matrix.PosDef.add_posSemidef`,
`Matrix.PosSemidef.conjTranspose_mul_mul_same`. (Definitions; the bullets are proved here.)

### 1.2 The optimal cost and the optimal inputs

Let `S` and every `Q k` with `k < N` be symmetric, and let every
`M(k) = R k + (B k)ᵀ P(k+1) (B k)` with `k < N` be positive definite. No sign condition on `Q`,
`R` or `S` is needed beyond these hypotheses. Prove:

- `isLeast_lqCost`: `x₀ᵀ P(0) x₀` is the least value of `lqCost A B Q R S N x₀ u` over all input
  sequences `u`;
- `lqCost_eq_iff`: an input sequence attains it exactly when `u k = K(k) x(k)` for every `k < N`,
  where `x = ltvState A B x₀ u` and `K(k) = lqrGain (A k) (B k) (R k) P(k+1)`.

(Anderson–Moore, *Optimal Control*, §2.4, the finite-time regulator summarized on p. 32 with
equations (2.4-13) and (2.4-14), stated there for time-varying coefficients, nonnegative definite
weights and, in its notation, nonsingular `G(t−1)ᵀ Q(t) G(t−1) + R(t)`; here the weights need
only be symmetric, and the hypothesis is positive definiteness, which is what uniqueness needs.
Anderson–Moore derive the recursion on pp. 29–31 by minimizing one stage at a time. Sontag,
Exercise 8.2.7, p. 369.)

Route: complete the square over the horizon. By backward induction each `P(k)` is symmetric,
since `P(k+1)` and `M(k)` are. For one step, with `P = P(k+1)`, `M = M(k)`, `K = K(k)`, the
identity

    (A x + B v)ᵀ P (A x + B v) + xᵀ Q x + vᵀ R v − xᵀ P(k) x = (v − K x)ᵀ M (v − K x)

holds for all `x` and `v`, by expanding and using `M K = −Bᵀ P A` and the symmetry of `P` and
`M`; it is the completion of the square of KalmanFiltering 1.2, written in the input instead of
the gain. Summing over `k < N` telescopes to

    lqCost A B Q R S N x₀ u = x₀ᵀ P(0) x₀ + ∑_{k<N} (u k − K(k) x(k))ᵀ M(k) (u k − K(k) x(k)).

Since each `M(k)` is positive definite, every term of the sum is nonnegative and vanishes exactly
when `u k = K(k) x(k)`. The feedback input, defined by recursion on `k`, makes every term vanish.

**Checks.**
- Scalar `A = B = Q = R = 1`, `S = 0`, `N = 2`, `x₀ = 1`: `P(0) = 3/2`. The input `u = (0, 0)`
  costs `1 + 1 = 2`, and the right side of the telescoped identity is
  `3/2 + (0 + 1/2)² · 2 + 0 = 2`, with `M(0) = 1 + P(1) = 2` and `M(1) = 1`. The optimal inputs
  are `u₀ = −1/2`, then `x₁ = 1/2` and `u₁ = 0`, with cost `1 + 1/4 + 1/4 + 0 = 3/2 = P(0)`.
- `Q`, `R`, `S` need not be positive semidefinite: for `A = 0`, `B = 1`, `Q = 0`, `R = −1`,
  `S = 2` and `N = 1`, `M(0) = 1`, `P(0) = 0`, `K(0) = 0`, and the cost is `u₀²`, least at the
  feedback input `u₀ = 0`.
- Positive definiteness cannot be dropped for uniqueness: for `A = B = 1`, `Q = R = S = 0` on
  `ℝ¹` and `N = 1`, `M(0) = 0`, the junk inverse gives `K(0) = 0` and `P(0) = 0`, and every
  input costs `0`, so `u₀ = 1` is optimal without being the feedback `K(0) x₀ = 0`.
- Nor for the value: for `A = 0`, `B = 1`, `Q = S = 0`, `R = −1` and `N = 1`, `M(0) = −1`,
  `P(0) = 0`, and the cost `−u₀²` has no least value.

*Needs:* 1.1; Mathlib `Matrix.PosDef.isUnit`, `Matrix.transpose_nonsing_inv`,
`Matrix.dotProduct_mulVec`, `Matrix.PosDef.dotProduct_mulVec_pos`. (Proved here.)

### Examples

The scalar regulator `A = B = Q = R = 1` with `S = 0`, over the horizons `1` and `2`; the weights
of 1.2 that are not positive semidefinite; the degenerate problems of 1.2 with a singular or
indefinite `M(0)`.

### Dependencies

KalmanFiltering 1.1, 1.3; Mathlib `Matrix.PosDef.add_posSemidef`,
`Matrix.PosSemidef.conjTranspose_mul_mul_same`, `Matrix.PosDef.isUnit`,
`Matrix.transpose_nonsing_inv`, `Matrix.dotProduct_mulVec`, `Matrix.PosDef.dotProduct_mulVec_pos`.
No other layer.

## Layer 2: stabilizability and detectability in discrete time

### 2.1 Definitions

Define `IsSchurStabilizable`: `IsSchurStabilizable A B` means that some `F : Matrix m n ℝ`
makes `A + B * F` Schur stable. Define `IsSchurDetectable`: for `C : Matrix p n ℝ`,
`IsSchurDetectable A C` means `IsSchurStabilizable Aᵀ Cᵀ`, that is, some output injection `L`
makes `Aᵀ + Cᵀ Lᵀ`, equivalently `A + L C`, Schur stable (Sontag, Proposition 5.5.6, item 4 in
the discrete-time case, p. 213, where Schur stable matrices are called discrete-time Hurwitz;
Anderson–Moore, *Optimal Filtering*, Appendix C, §§7–8, p. 342, where detectability of `(A, C)`
is stabilizability of the transposed pair).

Prove: if `(A, B)` is controllable in the sense of LinearSystemsAndControl 1.1, it is
stabilizable, since LinearSystemsAndControl 3.3 gives `F` with characteristic polynomial
`Xᴺ` of `A + B F`, whose eigenvalues are all `0` (Sontag, Exercise 8.4.5, p. 386, posed as an
exercise). If `A` is Schur stable, every pair `(A, B)` and `(A, C)` is stabilizable and
detectable (take `F = 0`).

**Checks.**
- For `A = [[1, 1], [0, 1]]` and `B = e₂`, the pair is controllable, and `F = (−1, −2)` gives
  `A + B F = [[1, 1], [−1, −1]]`, whose square is `0`.
- With no inputs, `(A, B)` is stabilizable exactly when `A` is Schur stable; with no outputs,
  `(A, C)` is detectable exactly when `A` is Schur stable.
- For `A = [2]` and `C = [0]` the pair is not detectable, and for `A = [1/2]` and `C = [0]` it is.

*Needs:* LinearSystemsAndControl 1.1, 3.3, 5.1; Mathlib `Matrix.mem_spectrum_iff_isRoot_charpoly`.
(Definitions; the bullets are proved here.)

### 2.2 The Hautus test

Prove `isSchurStabilizable_iff_rank`: `(A, B)` is stabilizable if and only if the complex matrix
`fromCols (μ • 1 − A') B'` has rank `N = Fintype.card n` for every `μ : ℂ` with `1 ≤ ‖μ‖`, where
`A'` and `B'` are `A` and `B` with entries mapped into `ℂ` (Sontag, Proposition 5.5.6, items 3
and 4 in the discrete-time case, p. 213, whose proof is given for continuous time and declared
analogous; Exercise 5.5.7, p. 215; Lemma/Exercise 3.3.10, p. 95). Consequently, by
transposition, `(A, C)` is detectable if and only if `fromRows (μ • 1 − A') C'` has rank `N` for
every `μ` with `1 ≤ ‖μ‖`.

Route: as in LinearSystemsAndControl 5.5, with the unit disc in place of the left half-plane. By
LinearSystemsAndControl 1.6 and 1.4, the eigenvalues of `A + B F` are those of `A₁₁ + B₁ F₁`
together with those of `A₂₂`, which no feedback changes, and by the argument of
LinearSystemsAndControl 1.5 the `μ` at which the rank drops are exactly the eigenvalues of
`A₂₂`. If they all have modulus less than one, LinearSystemsAndControl 3.3 applied to the
controllable pair `(A₁₁, B₁)` and the polynomial `Xʳ` gives `F₁`, and `F = (F₁, 0)` in the
coordinates of LinearSystemsAndControl 1.6 makes `A + B F` Schur stable. The second statement
follows with `Matrix.transpose_fromRows`, `Matrix.rank_transpose` and the fact that mapping
entries commutes with transposition.

**Checks.**
- The boundary of the disc counts: for `A = diag(1/2, 1)` and `B = e₁`, the uncontrollable
  eigenvalue `1` has modulus `1`; at `μ = 1` the matrix `[[1/2, 0, 1], [0, 0, 0]]` has rank `1`,
  and no feedback stabilizes. A test with `1 < ‖μ‖` would pass.
- Complex `μ` are needed: for the rotation `A = [[0, −1], [1, 0]]` and `B = 0`, `μI − A` has
  determinant `μ² + 1 ≠ 0` for every real `μ`, but the rank drops at `μ = i`, and `A` is not
  Schur stable.
- For `A = diag(2, 1/2)` and `B = e₂` the pair is not stabilizable (rank `1` at `μ = 2`); for
  `B = e₁` it is not controllable but stabilizable, and `F = (−2, 0)` gives `diag(0, 1/2)`.

*Needs:* 2.1; LinearSystemsAndControl 1.4, 1.5, 1.6, 3.3, 5.1; Mathlib
`Matrix.charpoly_fromBlocks_zero₂₁`, `Matrix.mem_spectrum_iff_isRoot_charpoly`,
`Matrix.transpose_fromRows`, `Matrix.rank_transpose`. (Proved here, after Sontag.)

### 2.3 Asymptotic controllability

Prove `isSchurStabilizable_iff_forall_exists_tendsto`: `(A, B)` is stabilizable if and only if
for every `x₀` some input sequence `u` makes `ltvState (fun _ => A) (fun _ => B) x₀ u k → 0`
(Sontag, Proposition 5.5.6, items 1 and 4 in the discrete-time case, p. 213).

Route: if `A + B F` is Schur stable, the feedback `u k = F x(k)` gives `x(k) = (A + B F)ᵏ x₀`,
which tends to `0` by IterativeMethodsForLinearSystems 1.2. Conversely, in the coordinates of
LinearSystemsAndControl 1.6 the second block of the state evolves by `z(k+1) = A₂₂ z(k)` whatever
the input, so every free motion of `A₂₂` tends to `0`; applied to the real and imaginary parts of
an eigenvector this gives that every eigenvalue of `A₂₂` has modulus less than one, and 2.2
concludes.

**Checks.**
- For `A = [2]` and `B = [0]` the state is `2ᵏ x₀` for every input; for `A = [2]` and `B = [1]`
  the input `u k = −2 x(k)` reaches `0` in one step.
- With no states every pair is stabilizable, and the condition holds trivially.

*Needs:* 1.1 (`ltvState`), 2.1, 2.2; LinearSystemsAndControl 1.6; IterativeMethodsForLinearSystems
1.2. (Proved here, after Sontag.)

### 2.4 Detectability through free motions

Prove `isSchurDetectable_iff_tendsto`: `(A, C)` is detectable if and only if every `x₀` with
`C Aᵏ x₀ = 0` for all `k` satisfies `Aᵏ x₀ → 0` (Anderson–Moore, *Optimal Filtering*, §4.4,
Problem 4.1, p. 84, posed as an exercise: the unobservable states are asymptotically stable).

Route: the set of such `x₀` is LinearSystemsAndControl's unobservable subspace (2.1 there),
which is `A`-invariant. If `(A, C)` is detectable, an eigenvector of `A` restricted to that
subspace, over `ℂ`, has `C v = 0`, so its eigenvalue has modulus less than one by the second
statement of 2.2; hence the restriction is Schur stable and its powers tend to `0`
(IterativeMethodsForLinearSystems 1.2). Conversely, if `A v = μ v`, `C v = 0`, `v ≠ 0` and
`1 ≤ ‖μ‖`, then the real and imaginary parts of `v` have vanishing outputs, and their free
motions, the real and imaginary parts of `μᵏ v`, do not both tend to `0`.

**Checks.**
- For `A = [2]` and `C = [0]`, `x₀ = 1` has vanishing outputs and `Aᵏ x₀ = 2ᵏ`.
- For `A = [[1, 1], [0, 1]]` and `C = (1, 0)` the pair is observable, so only `x₀ = 0` has
  vanishing outputs, and the pair is detectable although `A` is not Schur stable.

*Needs:* 2.1, 2.2; LinearSystemsAndControl 2.1; IterativeMethodsForLinearSystems 1.2.
(Proved here.)

### Examples

The deadbeat feedback of the double integrator; `diag(1/2, 1)` with input `e₁`, which fails the
rank test on the unit circle; the rotation by a quarter turn; `diag(2, 1/2)` with each input
vector.

### Dependencies

LinearSystemsAndControl 1.1, 1.4, 1.5, 1.6, 2.1, 3.3, 5.1; IterativeMethodsForLinearSystems 1.2;
Mathlib `Matrix.charpoly_fromBlocks_zero₂₁`, `Matrix.mem_spectrum_iff_isRoot_charpoly`,
`Matrix.transpose_fromRows`, `Matrix.rank_transpose`; Layer 1 (1.1, the state `ltvState`, in the
statement of 2.3). No other layer.

## Layer 3: value iteration and the algebraic Riccati equation

In this layer `A`, `B`, `Q`, `R` are constant, `Q` is positive semidefinite and `R` positive
definite. The discrete-time algebraic Riccati equation is `riccatiMap Aᵀ Bᵀ Q R P = P`, that is
`P = Aᵀ P A − Aᵀ P B (R + Bᵀ P B)⁻¹ Bᵀ P A + Q`.

### 3.1 Value iteration from zero

Prove:

- `riccatiMap_iterate_zero_succ_sub_posSemidef`: the iterates `(riccatiMap Aᵀ Bᵀ Q R)^[j] 0` are
  nondecreasing in the Loewner order.
- `exists_tendsto_riccatiMap_iterate_zero`: if `(A, B)` is stabilizable, they converge.
- `dare_of_tendsto`: their limit `P`, when it exists, is positive semidefinite, solves the
  algebraic Riccati equation, and lies below every positive semidefinite solution `P'`.

(Anderson–Moore, *Optimal Filtering*, §4.4, pp. 78–80, for the filter Riccati equation, which is
this one for the transposed pair: the bound through a suboptimal stable gain, the monotonicity
from the zero initial condition, and the limit solving the steady-state equation. Sontag,
Lemma/Exercise 8.4.4, p. 385, states the limit for controllable pairs without proof.)

Route: `riccatiMap Aᵀ Bᵀ Q R 0 = Q` is positive semidefinite, and monotonicity propagates by
KalmanFiltering 1.4. For the bound, take `F` with `A + B F` Schur stable. By 1.2 with constant
coefficients and `S = 0`, `x₀ᵀ (riccatiMap Aᵀ Bᵀ Q R)^[j] 0 x₀` is at most the cost of the
feedback `u = F x` over `j` steps, which is at most `x₀ᵀ W x₀` with `W` the solution
`∑ₖ ((A + B F)ᵀ)ᵏ (Q + Fᵀ R F) (A + B F)ᵏ` of the Stein equation of LinearSystemsAndControl 5.4.
A Loewner-nondecreasing sequence bounded above converges: each `xᵀ Pⱼ x` is a bounded
nondecreasing real sequence, and the entries follow by polarization. The limit is positive
semidefinite because the cone is closed (`isClosed_setOfPred_posSemidef`); it solves the equation
because `riccatiMap Aᵀ Bᵀ Q R` is continuous at every positive semidefinite `P`, where
`R + Bᵀ P B` is positive definite and the inverse is continuous (`continuousAt_matrix_inv`). If
`P'` is a positive semidefinite solution, `0 ≤ P'` gives `(riccatiMap Aᵀ Bᵀ Q R)^[j] 0 ≤ P'` for
all `j` by KalmanFiltering 1.4.

**Checks.**
- Scalar `A = B = Q = R = 1`: the iterates `0, 1, 3/2, 8/5, 21/13, …` increase to the golden
  ratio `φ = (1 + √5)/2`, the positive root of `P² − P − 1 = 0`; the other root `−1/φ` is not
  positive semidefinite.
- Stabilizability cannot be dropped: for `A = [2]`, `B = [0]`, `Q = R = [1]` the map is
  `P ↦ 4P + 1`, and the iterates `0, 1, 5, 21, 85, 341` diverge.
- Positive definiteness of `R` cannot be dropped: for `A = [[0, 1], [1, 0]]`, `B = 1`,
  `Q = diag(1, 0)` and `R = 0`, the junk inverse gives the iterates
  `0, diag(1, 0), 1, diag(1, 0), 1, …`, which neither increase nor converge, although the pair is
  controllable.
- The limit need not be the only positive semidefinite solution: for `A = [2]`, `B = R = [1]`,
  `Q = 0` the map is `P ↦ 4P/(1 + P)`, whose fixed points are `0` and `3`; the iterates from `0`
  stay at `0`, the least of them.

*Needs:* 1.1, 1.2, 2.1; KalmanFiltering 1.3, 1.4; LinearSystemsAndControl 5.4; Mathlib
`isClosed_setOfPred_posSemidef`, `continuousAt_matrix_inv`, `Matrix.PosDef.add_posSemidef`,
`Matrix.PosSemidef.conjTranspose_mul_mul_same`, `Function.iterate_succ_apply'`. (Proved here.)

### 3.2 The infinite-horizon regulator

Define `lqCostInf`, with `lqCostInf A B Q R x₀ u : ℝ≥0∞`, the sum over all `k` of
`ENNReal.ofReal (x(k) ⬝ᵥ Q *ᵥ x(k) + u k ⬝ᵥ R *ᵥ u k)` along
`x = ltvState (fun _ => A) (fun _ => B) x₀ u`. Prove, when the iterates of 3.1 converge to `P`:

- `isLeast_lqCostInf`: `ENNReal.ofReal (x₀ᵀ P x₀)` is the least value of `lqCostInf A B Q R x₀ u`
  over all input sequences;
- `lqCostInf_eq_iff`: an input sequence attains it exactly when `u k = K x(k)` for every `k`,
  with `K = lqrGain A B R P`.

(Sontag, Lemma/Exercise 8.4.4, p. 385, for controllable pairs, stated there without proof, and
Theorem 41, p. 384, its continuous-time analogue, whose proof this follows; here only the
convergence of the iterates is assumed, which holds for stabilizable pairs by 3.1.)

Route: every input costs at least its cost over the first `j` steps, which is at least
`x₀ᵀ (riccatiMap Aᵀ Bᵀ Q R)^[j] 0 x₀` by 1.2, and these increase to `x₀ᵀ P x₀`. Since `P` solves
the algebraic Riccati equation, the one-step identity of 1.2 holds with `P(k) = P(k+1) = P` and
`M = R + Bᵀ P B`, which is positive definite; summed over `k < j` it gives
`∑_{k<j} stage costs + x(j)ᵀ P x(j) = x₀ᵀ P x₀ + ∑_{k<j} (u k − K x(k))ᵀ M (u k − K x(k))`. For
the feedback input the last sum vanishes and `x(j)ᵀ P x(j) ≥ 0`, so its cost is at most
`x₀ᵀ P x₀`. For an optimal input, the tail cost from `x(j)` is at least `x(j)ᵀ P x(j)` by the
lower bound, so every term `(u k − K x(k))ᵀ M (u k − K x(k))` vanishes.

**Checks.**
- Scalar `A = B = Q = R = 1`: the least cost from `x₀ = 1` is `φ ≈ 1.618`, the gain is
  `−φ/(1 + φ) = −1/φ ≈ −0.618`, and the closed loop `1 − 1/φ = 1/φ² ≈ 0.382` is stable.
- For `A = [2]`, `B = R = [1]`, `Q = 0` the least cost is `0`, attained only by `u = 0`, which is
  the feedback of the limit `P = 0`; the closed loop `2` is unstable. Optimality does not give
  stability without a detectability hypothesis (Layer 4).

*Needs:* 1.2, 3.1; Mathlib `ENNReal.ofReal_sum_of_nonneg`, `Matrix.PosDef.isUnit`.
(Proved here, after Sontag.)

### Examples

The scalar regulator `A = B = Q = R = 1` and its golden-ratio limit; the unstable scalar system
`A = [2]` with no input, with no state cost, and with the junk inverse of a vanishing `R`.

### Dependencies

Layers 1 (1.1, 1.2) and 2 (2.1); KalmanFiltering 1.3, 1.4; LinearSystemsAndControl 5.4;
Mathlib
`isClosed_setOfPred_posSemidef`, `continuousAt_matrix_inv`, `Matrix.PosDef.add_posSemidef`,
`Matrix.PosSemidef.conjTranspose_mul_mul_same`, `Function.iterate_succ_apply'`,
`ENNReal.ofReal_sum_of_nonneg`, `Matrix.PosDef.isUnit`.

## Layer 4: the stabilizing solution

In this layer the state weight is `Q = Cᵀ C` for some `C : Matrix p n ℝ`, and `R` is positive
definite. Every positive semidefinite `Q` has this form (with `p = n`), and `(A, C)` is
detectable exactly when `(A, Cᵀ C)` is, since `C v = 0` exactly when `Cᵀ C v = 0`.

### 4.1 Positive semidefinite solutions are stabilizing

Prove `isSchurStable_add_mul_lqrGain`: if `(A, C)` is detectable and `P` is a positive
semidefinite solution of the algebraic Riccati equation with `Q = Cᵀ C`, then `A + B K` is Schur
stable, with `K = lqrGain A B R P` (Anderson–Moore, *Optimal Filtering*, §4.4, pp. 80–81, with
equation (4.12), for the filter Riccati equation, which is this one for the transposed pair).

Route: with `M = R + Bᵀ P B` and `M K = −Bᵀ P A`, the equation can be written in closed-loop form
`P = (A + B K)ᵀ P (A + B K) + Cᵀ C + Kᵀ R K`. If `(A + B K) v = μ v` with `v ≠ 0` complex and
`1 ≤ ‖μ‖`, then `(1 − ‖μ‖²) v* P v = ‖C v‖² + v* Kᵀ R K v`; the left side is at most `0` and the
right side at least `0`, so `C v = 0` and, `R` being positive definite, `K v = 0`. Then
`A v = μ v` and `C v = 0`, which the second statement of 2.2 excludes.

**Checks.**
- Scalar `A = [2]`, `B = C = R = [1]`: the equation is `P² − 4P − 1 = 0`, with positive root
  `P = 2 + √5 ≈ 4.236`; the gain is `−2P/(1 + P)` and the closed loop is
  `2/(1 + P) = (3 − √5)/2 ≈ 0.382`.
- Detectability cannot be dropped: for `A = [2]`, `B = R = [1]`, `C = [0]`, the positive
  semidefinite solution `P = 0` has gain `0` and closed loop `2`.

*Needs:* 1.1, 2.1, 2.2; Mathlib `Matrix.PosDef.dotProduct_mulVec_pos`,
`Matrix.PosSemidef.dotProduct_mulVec_nonneg`, `Matrix.spectrum_transpose`. (Proved here, after
Anderson–Moore.)

### 4.2 Existence and uniqueness

Prove `existsUnique_posSemidef_dare`: if `(A, B)` is stabilizable and `(A, C)` detectable, the
algebraic Riccati equation with `Q = Cᵀ C` has exactly one positive semidefinite solution
(Anderson–Moore, *Optimal Filtering*, §4.4, point 2 of the main conclusions, p. 77, and "Other
solutions of the steady-state equation", p. 82, for the filter form).

Route: existence is 3.1. For uniqueness, let `P'` be any positive semidefinite solution and `P`
the limit of 3.1. By 4.1 the feedback of `P'` is stabilizing, and the telescoped identity of 3.2
written with `P'` shows that this feedback costs exactly `x₀ᵀ P' x₀`, since `x(j)ᵀ P' x(j) → 0`
(IterativeMethodsForLinearSystems 1.2); so `x₀ᵀ P x₀ ≤ x₀ᵀ P' x₀` by 3.2. Conversely the optimal
feedback of `P` is stabilizing by 4.1, and the same identity written with `P'` along it gives
`x₀ᵀ P x₀ ≥ x₀ᵀ P' x₀`. So `xᵀ (P' − P) x = 0` for every `x`, and `P' = P` by symmetry.

A converse holds by 4.1: if `(A, C)` is detectable and the equation has a positive semidefinite
solution, `(A, B)` is stabilizable.

**Checks.**
- The scalar example of 4.1: `2 + √5` is the only positive semidefinite solution; the other root
  `2 − √5` is negative.
- Detectability cannot be dropped: for `A = [2]`, `B = R = [1]`, `C = [0]`, both `0` and `3` are
  positive semidefinite solutions.

*Needs:* 2.1, 3.1, 3.2, 4.1; IterativeMethodsForLinearSystems 1.2. (Proved here, after
Anderson–Moore.)

### 4.3 Convergence from every start

Prove `tendsto_riccatiMap_iterate`: if `(A, C)` is detectable and `P` is a positive semidefinite
solution of the algebraic Riccati equation with `Q = Cᵀ C`, then
`(riccatiMap Aᵀ Bᵀ (Cᵀ C) R)^[j] S → P` for every positive semidefinite `S` (Anderson–Moore,
*Optimal Filtering*, §4.4, "Nonzero initial covariances", pp. 81–82, for the filter form). No
stabilizability hypothesis is stated, because the existence of `P` implies it (4.2).

Route: from below, `(riccatiMap Aᵀ Bᵀ (Cᵀ C) R)^[j] 0 ≤ (riccatiMap Aᵀ Bᵀ (Cᵀ C) R)^[j] S` by
KalmanFiltering 1.4, and the left side tends to `P` by 3.1 and 4.2 (the pair is stabilizable by
4.1, the feedback of `P` being stabilizing). From above, with
`K = lqrGain A B R P` and `L = A + B K`, 1.2 with constant coefficients and terminal weight `S`
bounds the `j`-step value by the cost of the feedback `K`:
`(riccatiMap Aᵀ Bᵀ (Cᵀ C) R)^[j] S ≤ (Lᵀ)ʲ S Lʲ + ∑_{i<j} (Lᵀ)ⁱ (Cᵀ C + Kᵀ R K) Lⁱ`. As `j → ∞`
the first term tends to `0` because `L` is Schur stable (4.1, IterativeMethodsForLinearSystems
1.2), and the sum tends to the solution of the Stein equation `Lᵀ X L − X = −(Cᵀ C + Kᵀ R K)`,
which is `P` by the closed-loop form of 4.1 and LinearSystemsAndControl 5.4.

**Checks.**
- Scalar `A = B = C = R = 1`, `S = 10`: the iterates are `10, 21/11, 53/32, …`, decreasing to
  `φ`, while from `S = 0` they increase to `φ`.
- Detectability cannot be dropped: for `A = [2]`, `B = R = [1]`, `C = [0]`, the iterates of
  `P ↦ 4P/(1 + P)` from `S = 0` stay at `0`, and from every `S > 0` they converge to `3`.

*Needs:* 1.2, 3.1, 4.1, 4.2; KalmanFiltering 1.3, 1.4; LinearSystemsAndControl 5.4;
IterativeMethodsForLinearSystems 1.2. (Proved here, after Anderson–Moore.)

### Examples

The unstable scalar system `A = [2]`, `B = R = [1]` with `C = [1]` (a unique stabilizing
solution `2 + √5`) and with `C = [0]` (two positive semidefinite solutions, the least one not
stabilizing).

### Dependencies

Layers 1 (1.1, 1.2), 2 (2.1, 2.2) and 3 (3.1, 3.2); KalmanFiltering 1.3, 1.4;
LinearSystemsAndControl 5.4; IterativeMethodsForLinearSystems 1.2; Mathlib
`Matrix.PosDef.dotProduct_mulVec_pos`, `Matrix.PosSemidef.dotProduct_mulVec_nonneg`,
`Matrix.spectrum_transpose`.

## Layer 5: the steady-state Kalman filter

### 5.1 Convergence and stability of the filter Riccati recursion

Prove `exists_steadyState_riccatiMap`: let `C : Matrix p n ℝ`, `G : Matrix n q ℝ` and `R`
positive definite. If `(A, C)` is detectable and `(A, G)` is stabilizable, there is a positive
semidefinite `P` with `riccatiMap A C (G Gᵀ) R P = P` such that every positive semidefinite fixed
point equals `P`, the iterates `(riccatiMap A C (G Gᵀ) R)^[k] P₀` converge to `P` for every
positive semidefinite `P₀`, and `A (1 − kalmanGain C R P · C)` is Schur stable (Anderson–Moore,
*Optimal Filtering*, §4.4, point 2 of the main conclusions with points 1(a) and 1(c), equations
(4.1) to (4.6), p. 77; the uniqueness under "Other solutions of the steady-state equation",
p. 82). For the time-invariant model of KalmanFiltering 2.1 with process-noise
covariance `G Gᵀ`, the iterates from `P₀` are the predicted covariances of KalmanFiltering 2.2,
and `A (1 − K C)` is the matrix of the error recursion of the predicted mean.

Route: duality. `riccatiMap A C Q R P` is `riccatiMap (Aᵀ)ᵀ (Cᵀ)ᵀ Q R P`, the control Riccati map
of the pair `(Aᵀ, Cᵀ)`, and `G Gᵀ = (Gᵀ)ᵀ Gᵀ`. Detectability of `(A, C)` is stabilizability of
`(Aᵀ, Cᵀ)` by definition, and stabilizability of `(A, G)` is detectability of `(Aᵀ, Gᵀ)`. So 4.2
and 4.3 give `P`, its uniqueness and the convergence, and 4.1 gives the Schur stability of
`Aᵀ + Cᵀ lqrGain Aᵀ Cᵀ R P`, which equals `(A (1 − kalmanGain C R P · C))ᵀ` because `P` and
`C P Cᵀ + R` are symmetric; a matrix and its transpose have the same spectrum.

**Checks.**
- Scalar `A = C = G = R = 1`: from `P₀ = 1` the iterates `1, 3/2, 8/5, 21/13, 55/34` of
  KalmanFiltering 1.1 converge to `φ`; the steady-state Kalman gain is `φ/(φ + 1) = 1/φ`, and
  `A (1 − K C) = 1/φ² ≈ 0.382`.
- Detectability cannot be dropped: for `A = [2]`, `C = [0]`, `G = R = [1]` the map is
  `P ↦ 4P + 1`, and the iterates diverge.
- Stabilizability of `(A, G)` cannot be dropped: for `A = [2]`, `C = R = [1]`, `G = [0]` the map
  is `P ↦ 4P/(1 + P)`, with the two positive semidefinite fixed points `0` and `3`; at `P = 0`
  the gain is `0` and `A (1 − K C) = 2`.

*Needs:* 1.1, 2.1, 4.1, 4.2, 4.3; KalmanFiltering 1.1; Mathlib `Matrix.spectrum_transpose`,
`Matrix.transpose_nonsing_inv`. (Proved here, after Anderson–Moore.)

### Examples

The scalar filter `A = C = G = R = 1` of KalmanFiltering 1.1 and its golden-ratio steady state;
the unstable scalar model without observations and without process noise.

### Dependencies

Layers 1 (1.1), 2 (2.1) and 4 (4.1–4.3); KalmanFiltering 1.1; Mathlib `Matrix.spectrum_transpose`,
`Matrix.transpose_nonsing_inv`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the time-varying discrete-time
system and its finite-horizon quadratic cost, the cost-to-go matrices and the regulator gain, the
completion of the square and the finite-horizon regulator theorem; stabilizability and
detectability in discrete time with their rank and trajectory characterizations; value iteration
for the control Riccati map, the algebraic Riccati equation and the infinite-horizon regulator;
the stabilizing solution, its uniqueness and the convergence of the iterates from every positive
semidefinite start; and the convergence and stability of the steady-state Kalman filter.

Stated by other roadmaps and not restated here:

- KalmanFiltering 1.1 defines the Riccati map, the Kalman gain and the measurement and time
  updates; they are copied verbatim into `Suggested.lean` and the control Riccati map is
  `riccatiMap Aᵀ Bᵀ`, with no new definition. KalmanFiltering 1.3 (positivity) and 1.4
  (monotonicity in the Loewner order) are used as stated. KalmanFiltering 2.2 defines the
  predicted covariances, whose limit 5.1 describes; KalmanFiltering lists the behaviour of the
  Riccati recursion as `k → ∞`, stabilizability and detectability and the duality between
  filtering and control as not treated there, and this roadmap treats them.
- LinearSystemsAndControl 5.1 defines Schur stable matrices; the definition is copied verbatim.
  LinearSystemsAndControl 1.4–1.6, 2.1, 3.3 and 5.4 (feedback invariance, the Hautus test, the
  Kalman decomposition, the unobservable subspace, the pole-shifting theorem, the Stein equation)
  are used as stated. LinearSystemsAndControl 5.5 states stabilizability for continuous time and
  Hurwitz matrices; 2.2 above is the discrete-time statement, for the unit disc, which is not
  stated there. LinearSystemsAndControl 1.3 defines `discreteState` for constant coefficients
  over any field; `ltvState` of 1.1 is its time-varying generalization over `ℝ`, needed for the
  finite-horizon theorem, and agrees with it for constant coefficients.
- IterativeMethodsForLinearSystems 1.2 owns the equivalence between the powers of a real matrix
  tending to zero and its complex spectral radius being less than one; it is used, through Schur
  stability, for the convergence of closed-loop trajectories.
- MarkovDecisionProcesses owns dynamic programming on a countable state space with
  finitely many actions and bounded rewards. The regulator problem has state space `ℝⁿ`, a
  continuum of inputs and unbounded quadratic costs, so it is not a case of that theory, and
  nothing of it is used.
- OptimalControlAndHamiltonJacobi treats continuous-time optimal control with the verification
  theorem and the Pontryagin principle, and the scalar linear-quadratic problem only as a worked
  example; it states no Riccati equation and nothing of it is used.

Already in the libraries and therefore not targets: the continuity of the matrix inverse at an
invertible matrix (`continuousAt_matrix_inv`), the closedness of the positive semidefinite cone
(`isClosed_setOfPred_posSemidef`), and the invariance of the spectrum and of the rank under
transposition (`Matrix.spectrum_transpose`, `Matrix.rank_transpose`), in Mathlib. Neither Mathlib
nor Tau Ceti has a Riccati equation of control or filtering, stabilizability or detectability at
the pins.

Not treated here: continuous-time linear-quadratic control, the Riccati differential equation and
the continuous-time algebraic Riccati equation; the Hamiltonian matrix and its invariant subspaces;
stabilizing solutions that are not positive semidefinite, and indefinite or singular input
weights in the infinite-horizon problem; cross terms between state and input in the cost;
discounted and tracking problems; stochastic linear-quadratic control, linear-quadratic-Gaussian
control and the separation principle; output feedback and observers; time-varying stabilizability
and detectability; rates of convergence of the Riccati iterates; numerical methods for Riccati
equations.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` and `Matrix.PosSemidef` (both
  include `IsHermitian`, which is symmetry over `ℝ`); `Matrix.PosDef.add_posSemidef` (positive
  definite plus positive semidefinite is positive definite);
  `Matrix.PosSemidef.conjTranspose_mul_mul_same` (for `A` positive semidefinite, `Bᴴ A B` is
  positive semidefinite, `B` rectangular); `Matrix.PosDef.isUnit` (a positive definite matrix over
  a field is invertible); `Matrix.PosSemidef.dotProduct_mulVec_nonneg` and
  `Matrix.PosDef.dotProduct_mulVec_pos` (the quadratic forms are nonnegative, resp. positive at
  nonzero vectors).
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.transpose_nonsing_inv`
  (`(A⁻¹)ᵀ = (Aᵀ)⁻¹`). `Mathlib/Data/Matrix/Mul.lean`: `Matrix.dotProduct_mulVec`
  (`v ⬝ᵥ A *ᵥ w = (v ᵥ* A) ⬝ᵥ w`).
- `Mathlib/Topology/Instances/Matrix.lean`: `continuousAt_matrix_inv` (the inverse is continuous
  at `A` when `Ring.inverse` is continuous at `det A`, as in `ℝ` at a nonzero determinant);
  `isClosed_setOfPred_posSemidef` (the positive semidefinite matrices form a closed set).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.mem_spectrum_iff_isRoot_charpoly`
  (over a field, `r ∈ spectrum K A ↔ A.charpoly.IsRoot r`) and `Matrix.spectrum_transpose`
  (`spectrum K Aᵀ = spectrum K A`). `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`:
  `Matrix.charpoly_fromBlocks_zero₂₁` (the characteristic polynomial of a block upper triangular
  matrix is the product of those of the diagonal blocks).
- `Mathlib/Data/Matrix/ColumnRowPartitioned.lean`: `Matrix.fromCols`, `Matrix.fromRows` and
  `Matrix.transpose_fromRows` (`(fromRows A₁ A₂)ᵀ = fromCols A₁ᵀ A₂ᵀ`).
  `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_transpose` (over a field,
  `Aᵀ.rank = A.rank`).
- `Mathlib/Basic/ENNReal/BigOperators.lean`: `ENNReal.ofReal_sum_of_nonneg` (`ofReal` of a
  finite sum of nonnegative reals is the sum of the `ofReal`s). `Function.iterate_succ_apply'`
  (`f^[j+1] x = f (f^[j] x)`).

### From Tau Ceti

Nothing from Tau Ceti is used.

### From TauCetiRoadmap.KalmanFiltering

- 1.1: `innovationCov`, `kalmanGain`, `measurementUpdate`, `timeUpdate` and `riccatiMap`, copied
  verbatim; no hypothesis.
- 1.3, positivity: if `P`, `Q` and `R` are positive semidefinite, so is
  `riccatiMap A C Q R P`, for every `A` and `C`. Used in 1.1 with `Aᵀ`, `Bᵀ`, and in 3.1 and 4.3
  for the positivity of the iterates.
- 1.4, monotonicity: if `R` is positive definite, `P` positive semidefinite and
  `P ≤ P'`, then `riccatiMap A C Q R P ≤ riccatiMap A C Q R P'`. Used in 3.1 and 4.3 with `Aᵀ`,
  `Bᵀ`.
- 2.1 and 2.2: the state-space model and its predicted covariances, named in 5.1 only to identify
  the iterates; nothing about them is used.

### From TauCetiRoadmap.LinearSystemsAndControl

- 1.1 `IsControllable`, 1.3 `discreteState` (compared with `ltvState` in the scope above), 1.4
  `reachableSubspace_add_mul`, 1.5 `isControllable_iff_forall_rank_fromCols` (the Hautus test
  and its argument), 1.6 `exists_kalmanDecomposition`, 2.1 `unobservableSubspace`, 3.3
  `isControllable_iff_forall_exists_charpoly` (pole shifting over any field), each as stated
  there; used in Layer 2.
- 5.1 `IsSchurStable`, copied verbatim.
- 5.4 `stein_eq_iff`: for Schur stable `A` and any `Q`, `Aᵀ P A − P = −Q` holds exactly for
  `P = ∑ₖ (Aᵀ)ᵏ Q Aᵏ`. Used in 3.1 and 4.3.

### From TauCetiRoadmap.IterativeMethodsForLinearSystems

- 1.2 `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one`: for a real square matrix `G`,
  `Gᵏ → 0` if and only if the spectral radius of its complexification is less than one; for a
  Schur stable matrix the spectral radius of the finite spectrum is less than one. Used in 2.3,
  2.4, 4.2 and 4.3.

## References

- Brian D. O. Anderson and John B. Moore, *Optimal Control: Linear Quadratic Methods*,
  Prentice-Hall, 1989 (Dover, 2007); the scan of the book posted on John B. Moore's page at the
  Australian National University, with the printed page numbers. Cited as Anderson–Moore,
  *Optimal Control*.
- Brian D. O. Anderson and John B. Moore, *Optimal Filtering*, Prentice-Hall, 1979 (Dover,
  2005); the scan posted on the same page, with the printed page numbers. Cited as Anderson–Moore,
  *Optimal Filtering*. Its observation matrix `H` is the transpose of `C` here, and its `F` is
  `A`. Its Appendix C reviews linear system theory without proofs, and the problems of §4.4 are
  exercises.
- Eduardo D. Sontag, *Mathematical Control Theory: Deterministic Finite Dimensional Systems*,
  second edition, Texts in Applied Mathematics 6, Springer, 1998; the PDF posted on the author's
  web site, whose page numbers are those of the printed book. The items Sontag labels
  Lemma/Exercise or Exercise (3.3.10, 5.5.7, 8.2.7, 8.4.4, 8.4.5) are stated there without proof,
  and for Proposition 5.5.6 only the continuous-time case is proved; the routes above are the
  roadmap's own.
- Attributions made in prose without a locator: Rudolf E. Kalman (the linear-quadratic regulator
  and its duality with filtering); Malo L. J. Hautus (the eigenvalue tests).

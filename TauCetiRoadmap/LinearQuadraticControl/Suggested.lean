import Mathlib

/-!
# Linear-quadratic control: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, Checks and proof routes are not
restated.

States are vectors `x : n → ℝ` and inputs are vectors `u : m → ℝ`, for finite index types `n` and
`m`, either of which may be empty; a matrix acts by `*ᵥ`, and `x ⬝ᵥ M *ᵥ x` is the quadratic form
of `M`. Inverses are Mathlib's `⁻¹` on square matrices, which is `0` on a singular matrix; every
statement that uses an inverse in a way that matters assumes what makes the matrix invertible.
The Riccati map of the Kalman filter, `riccatiMap`, and its four auxiliary maps are copied
verbatim from KalmanFiltering 1.1; the control Riccati map of a pair `(A, B)` is
`riccatiMap Aᵀ Bᵀ`. Schur stability, `IsSchurStable`, is copied verbatim from
LinearSystemsAndControl 5.1. Infinite-horizon costs take values in `ℝ≥0∞`.
-/

noncomputable section

open Matrix Filter Topology
open scoped ENNReal

namespace TauCetiRoadmap.LinearQuadraticControl

section KalmanFiltering

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]

/-- 1.1 (copied verbatim from KalmanFiltering 1.1) The innovation covariance `C P Cᵀ + R` of a
prior covariance `P`, an observation matrix `C` and an observation-noise covariance `R`. -/
def innovationCov (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix κ κ ℝ :=
  C * P * Cᵀ + R

/-- 1.1 (copied verbatim from KalmanFiltering 1.1) The Kalman gain `P Cᵀ (C P Cᵀ + R)⁻¹`. -/
def kalmanGain (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix ι κ ℝ :=
  P * Cᵀ * (innovationCov C R P)⁻¹

/-- 1.1 (copied verbatim from KalmanFiltering 1.1) The measurement update
`P - P Cᵀ (C P Cᵀ + R)⁻¹ C P` of a covariance. -/
def measurementUpdate (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) :
    Matrix ι ι ℝ :=
  P - kalmanGain C R P * C * P

/-- 1.1 (copied verbatim from KalmanFiltering 1.1) The time update `A P Aᵀ + Q` of a
covariance. -/
def timeUpdate (A : Matrix ι ι ℝ) (Q : Matrix ι ι ℝ) (P : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  A * P * Aᵀ + Q

/-- 1.1 (copied verbatim from KalmanFiltering 1.1) The Riccati map
`P ↦ A (P - P Cᵀ (C P Cᵀ + R)⁻¹ C P) Aᵀ + Q`: a measurement update followed by a time update.
With `Aᵀ` and `Bᵀ` in place of `A` and `C` it is the control Riccati map
`P ↦ Aᵀ P A - Aᵀ P B (R + Bᵀ P B)⁻¹ Bᵀ P A + Q`. -/
def riccatiMap (A : Matrix ι ι ℝ) (C : Matrix κ ι ℝ) (Q : Matrix ι ι ℝ) (R : Matrix κ κ ℝ)
    (P : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  timeUpdate A Q (measurementUpdate C R P)

end KalmanFiltering

variable {n m p q : Type*} [Fintype n] [DecidableEq n] [Fintype m] [DecidableEq m]
  [Fintype p] [DecidableEq p] [Fintype q]

/-- 2.1 (copied verbatim from LinearSystemsAndControl 5.1) `A` is Schur stable when every
complex eigenvalue of `A` has modulus less than one. -/
def IsSchurStable (A : Matrix n n ℝ) : Prop :=
  ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), ‖μ‖ < 1

/-! ## Layer 1: the finite-horizon regulator -/

/-- 1.1 The state of the time-varying system `x (k + 1) = A k x k + B k u k` with initial state
`x₀` and input sequence `u`. -/
def ltvState (A : ℕ → Matrix n n ℝ) (B : ℕ → Matrix n m ℝ) (x₀ : n → ℝ) (u : ℕ → m → ℝ) :
    ℕ → n → ℝ
  | 0 => x₀
  | k + 1 => A k *ᵥ ltvState A B x₀ u k + B k *ᵥ u k

/-- 1.1 The cost over the horizon `N`: the stage costs `x k ⬝ᵥ Q k x k + u k ⬝ᵥ R k u k` for
`k < N` plus the terminal cost `x N ⬝ᵥ S x N`. -/
def lqCost (A : ℕ → Matrix n n ℝ) (B : ℕ → Matrix n m ℝ) (Q : ℕ → Matrix n n ℝ)
    (R : ℕ → Matrix m m ℝ) (S : Matrix n n ℝ) (N : ℕ) (x₀ : n → ℝ) (u : ℕ → m → ℝ) : ℝ :=
  (∑ k ∈ Finset.range N,
      (ltvState A B x₀ u k ⬝ᵥ Q k *ᵥ ltvState A B x₀ u k + u k ⬝ᵥ R k *ᵥ u k)) +
    ltvState A B x₀ u N ⬝ᵥ S *ᵥ ltvState A B x₀ u N

/-- 1.1 The cost-to-go matrices of the Riccati recursion: `valueMatrix A B Q R S N k` is `S` for
`k ≥ N`, and for `k < N` it is the control Riccati map of `(A k, B k, Q k, R k)` applied to the
matrix at time `k + 1`. -/
def valueMatrix (A : ℕ → Matrix n n ℝ) (B : ℕ → Matrix n m ℝ) (Q : ℕ → Matrix n n ℝ)
    (R : ℕ → Matrix m m ℝ) (S : Matrix n n ℝ) (N k : ℕ) : Matrix n n ℝ :=
  if k < N then riccatiMap (A k)ᵀ (B k)ᵀ (Q k) (R k) (valueMatrix A B Q R S N (k + 1)) else S
termination_by N - k

/-- 1.1 The regulator gain `-(R + Bᵀ P B)⁻¹ Bᵀ P A` of a cost-to-go matrix `P`. -/
def lqrGain (A : Matrix n n ℝ) (B : Matrix n m ℝ) (R : Matrix m m ℝ) (P : Matrix n n ℝ) :
    Matrix m n ℝ :=
  -((R + Bᵀ * P * B)⁻¹ * Bᵀ * P * A)

/-- 1.2 The finite-horizon regulator: if `S` and every `Q k`, `k < N`, are symmetric and every
`R k + (B k)ᵀ P(k+1) (B k)`, `k < N`, is positive definite, the least cost from `x₀` over all
input sequences is `x₀ ⬝ᵥ P(0) x₀`. The weights need not be positive semidefinite. -/
theorem isLeast_lqCost (A : ℕ → Matrix n n ℝ) (B : ℕ → Matrix n m ℝ)
    (Q : ℕ → Matrix n n ℝ) (R : ℕ → Matrix m m ℝ) (S : Matrix n n ℝ) (N : ℕ)
    (hS : S.IsHermitian) (hQ : ∀ k < N, (Q k).IsHermitian)
    (hM : ∀ k < N, (R k + (B k)ᵀ * valueMatrix A B Q R S N (k + 1) * B k).PosDef)
    (x₀ : n → ℝ) :
    IsLeast (Set.range (lqCost A B Q R S N x₀)) (x₀ ⬝ᵥ valueMatrix A B Q R S N 0 *ᵥ x₀) := by
  sorry

/-- 1.2 Under the hypotheses of `isLeast_lqCost` an input sequence attains the least cost exactly
when it is the state feedback `u k = K k (x k)` at every time `k < N`, where `K k` is the
regulator gain of `P(k+1)`. -/
theorem lqCost_eq_iff (A : ℕ → Matrix n n ℝ) (B : ℕ → Matrix n m ℝ)
    (Q : ℕ → Matrix n n ℝ) (R : ℕ → Matrix m m ℝ) (S : Matrix n n ℝ) (N : ℕ)
    (hS : S.IsHermitian) (hQ : ∀ k < N, (Q k).IsHermitian)
    (hM : ∀ k < N, (R k + (B k)ᵀ * valueMatrix A B Q R S N (k + 1) * B k).PosDef)
    (x₀ : n → ℝ) (u : ℕ → m → ℝ) :
    lqCost A B Q R S N x₀ u = x₀ ⬝ᵥ valueMatrix A B Q R S N 0 *ᵥ x₀ ↔
      ∀ k < N, u k = lqrGain (A k) (B k) (R k) (valueMatrix A B Q R S N (k + 1)) *ᵥ
        ltvState A B x₀ u k := by
  sorry

/-! ## Layer 2: stabilizability and detectability in discrete time -/

/-- 2.1 `(A, B)` is stabilizable in discrete time when some state feedback `F` makes `A + B F`
Schur stable. -/
def IsSchurStabilizable (A : Matrix n n ℝ) (B : Matrix n m ℝ) : Prop :=
  ∃ F : Matrix m n ℝ, IsSchurStable (A + B * F)

/-- 2.1 `(A, C)` is detectable in discrete time when `(Aᵀ, Cᵀ)` is stabilizable in discrete
time, that is, when some output injection `L` makes `A + L C` Schur stable. -/
def IsSchurDetectable (A : Matrix n n ℝ) (C : Matrix p n ℝ) : Prop :=
  IsSchurStabilizable Aᵀ Cᵀ

/-- 2.2 The Hautus test for discrete-time stabilizability: `(A, B)` is stabilizable if and only
if `[μ I - A, B]` has rank `Fintype.card n` for every complex `μ` with `1 ≤ ‖μ‖`. -/
theorem isSchurStabilizable_iff_rank (A : Matrix n n ℝ) (B : Matrix n m ℝ) :
    IsSchurStabilizable A B ↔
      ∀ μ : ℂ, 1 ≤ ‖μ‖ →
        (fromCols (μ • (1 : Matrix n n ℂ) - A.map (algebraMap ℝ ℂ))
          (B.map (algebraMap ℝ ℂ))).rank = Fintype.card n := by
  sorry

/-- 2.3 `(A, B)` is stabilizable if and only if from every initial state some input sequence
drives the state of `x (k + 1) = A x k + B u k` to `0`. -/
theorem isSchurStabilizable_iff_forall_exists_tendsto (A : Matrix n n ℝ) (B : Matrix n m ℝ) :
    IsSchurStabilizable A B ↔
      ∀ x₀ : n → ℝ, ∃ u : ℕ → m → ℝ,
        Tendsto (ltvState (fun _ => A) (fun _ => B) x₀ u) atTop (𝓝 0) := by
  sorry

/-- 2.4 `(A, C)` is detectable if and only if every free motion `A ^ k x₀` whose output
`C A ^ k x₀` vanishes at every time tends to `0`. -/
theorem isSchurDetectable_iff_tendsto (A : Matrix n n ℝ) (C : Matrix p n ℝ) :
    IsSchurDetectable A C ↔
      ∀ x₀ : n → ℝ, (∀ k : ℕ, C *ᵥ (A ^ k *ᵥ x₀) = 0) →
        Tendsto (fun k : ℕ => A ^ k *ᵥ x₀) atTop (𝓝 0) := by
  sorry

/-! ## Layer 3: value iteration and the algebraic Riccati equation -/

/-- 3.2 The infinite-horizon cost of the time-invariant system from `x₀` under the input `u`:
the sum in `ℝ≥0∞` of the stage costs `x k ⬝ᵥ Q x k + u k ⬝ᵥ R u k`. -/
def lqCostInf (A : Matrix n n ℝ) (B : Matrix n m ℝ) (Q : Matrix n n ℝ) (R : Matrix m m ℝ)
    (x₀ : n → ℝ) (u : ℕ → m → ℝ) : ℝ≥0∞ :=
  ∑' k : ℕ, ENNReal.ofReal
    (ltvState (fun _ => A) (fun _ => B) x₀ u k ⬝ᵥ Q *ᵥ ltvState (fun _ => A) (fun _ => B) x₀ u k +
      u k ⬝ᵥ R *ᵥ u k)

/-- 3.1 Value iteration from `0` is nondecreasing in the Loewner order: for `Q` positive
semidefinite and `R` positive definite, each iterate of the control Riccati map started at `0`
lies below the next. -/
theorem riccatiMap_iterate_zero_succ_sub_posSemidef (A : Matrix n n ℝ) (B : Matrix n m ℝ)
    (Q : Matrix n n ℝ) (R : Matrix m m ℝ) (hQ : Q.PosSemidef) (hR : R.PosDef) (j : ℕ) :
    ((riccatiMap Aᵀ Bᵀ Q R)^[j + 1] 0 - (riccatiMap Aᵀ Bᵀ Q R)^[j] 0).PosSemidef := by
  sorry

/-- 3.1 For `Q` positive semidefinite, `R` positive definite and `(A, B)` stabilizable, value
iteration from `0` converges. -/
theorem exists_tendsto_riccatiMap_iterate_zero (A : Matrix n n ℝ) (B : Matrix n m ℝ)
    (Q : Matrix n n ℝ) (R : Matrix m m ℝ) (hQ : Q.PosSemidef) (hR : R.PosDef)
    (hs : IsSchurStabilizable A B) :
    ∃ P : Matrix n n ℝ, Tendsto (fun j => (riccatiMap Aᵀ Bᵀ Q R)^[j] 0) atTop (𝓝 P) := by
  sorry

/-- 3.1 The limit of value iteration from `0` is the least positive semidefinite solution of the
discrete-time algebraic Riccati equation `P = Aᵀ P A - Aᵀ P B (R + Bᵀ P B)⁻¹ Bᵀ P A + Q`. -/
theorem dare_of_tendsto (A : Matrix n n ℝ) (B : Matrix n m ℝ) (Q : Matrix n n ℝ)
    (R : Matrix m m ℝ) (hQ : Q.PosSemidef) (hR : R.PosDef) {P : Matrix n n ℝ}
    (hP : Tendsto (fun j => (riccatiMap Aᵀ Bᵀ Q R)^[j] 0) atTop (𝓝 P)) :
    P.PosSemidef ∧ riccatiMap Aᵀ Bᵀ Q R P = P ∧
      ∀ P' : Matrix n n ℝ, P'.PosSemidef → riccatiMap Aᵀ Bᵀ Q R P' = P' →
        (P' - P).PosSemidef := by
  sorry

/-- 3.2 The infinite-horizon regulator: if value iteration from `0` converges to `P`, the least
infinite-horizon cost from `x₀` over all input sequences is `x₀ ⬝ᵥ P x₀`. -/
theorem isLeast_lqCostInf (A : Matrix n n ℝ) (B : Matrix n m ℝ) (Q : Matrix n n ℝ)
    (R : Matrix m m ℝ) (hQ : Q.PosSemidef) (hR : R.PosDef) {P : Matrix n n ℝ}
    (hP : Tendsto (fun j => (riccatiMap Aᵀ Bᵀ Q R)^[j] 0) atTop (𝓝 P)) (x₀ : n → ℝ) :
    IsLeast (Set.range (lqCostInf A B Q R x₀)) (ENNReal.ofReal (x₀ ⬝ᵥ P *ᵥ x₀)) := by
  sorry

/-- 3.2 Under the hypotheses of `isLeast_lqCostInf`, an input sequence attains the least
infinite-horizon cost exactly when it is the stationary feedback `u k = K (x k)` with the
regulator gain `K` of `P`. -/
theorem lqCostInf_eq_iff (A : Matrix n n ℝ) (B : Matrix n m ℝ) (Q : Matrix n n ℝ)
    (R : Matrix m m ℝ) (hQ : Q.PosSemidef) (hR : R.PosDef) {P : Matrix n n ℝ}
    (hP : Tendsto (fun j => (riccatiMap Aᵀ Bᵀ Q R)^[j] 0) atTop (𝓝 P)) (x₀ : n → ℝ)
    (u : ℕ → m → ℝ) :
    lqCostInf A B Q R x₀ u = ENNReal.ofReal (x₀ ⬝ᵥ P *ᵥ x₀) ↔
      ∀ k : ℕ, u k = lqrGain A B R P *ᵥ ltvState (fun _ => A) (fun _ => B) x₀ u k := by
  sorry

/-! ## Layer 4: the stabilizing solution -/

/-- 4.1 If `R` is positive definite and `(A, C)` is detectable, every positive semidefinite
solution `P` of the algebraic Riccati equation with `Q = Cᵀ C` is stabilizing: `A + B K` is
Schur stable for the regulator gain `K` of `P`. -/
theorem isSchurStable_add_mul_lqrGain (A : Matrix n n ℝ) (B : Matrix n m ℝ)
    (C : Matrix p n ℝ) (R : Matrix m m ℝ) (hR : R.PosDef) (hd : IsSchurDetectable A C)
    {P : Matrix n n ℝ} (hP : P.PosSemidef) (hdare : riccatiMap Aᵀ Bᵀ (Cᵀ * C) R P = P) :
    IsSchurStable (A + B * lqrGain A B R P) := by
  sorry

/-- 4.2 If `R` is positive definite, `(A, B)` is stabilizable and `(A, C)` is detectable, the
algebraic Riccati equation with `Q = Cᵀ C` has exactly one positive semidefinite solution. -/
theorem existsUnique_posSemidef_dare (A : Matrix n n ℝ) (B : Matrix n m ℝ) (C : Matrix p n ℝ)
    (R : Matrix m m ℝ) (hR : R.PosDef) (hs : IsSchurStabilizable A B)
    (hd : IsSchurDetectable A C) :
    ∃! P : Matrix n n ℝ, P.PosSemidef ∧ riccatiMap Aᵀ Bᵀ (Cᵀ * C) R P = P := by
  sorry

/-- 4.3 If `R` is positive definite, `(A, C)` is detectable and `P` is a positive semidefinite
solution of the algebraic Riccati equation with `Q = Cᵀ C`, value iteration from every positive
semidefinite `S` converges to `P`. -/
theorem tendsto_riccatiMap_iterate (A : Matrix n n ℝ) (B : Matrix n m ℝ) (C : Matrix p n ℝ)
    (R : Matrix m m ℝ) (hR : R.PosDef) (hd : IsSchurDetectable A C) {P : Matrix n n ℝ}
    (hP : P.PosSemidef) (hdare : riccatiMap Aᵀ Bᵀ (Cᵀ * C) R P = P) {S : Matrix n n ℝ}
    (hS : S.PosSemidef) :
    Tendsto (fun j => (riccatiMap Aᵀ Bᵀ (Cᵀ * C) R)^[j] S) atTop (𝓝 P) := by
  sorry

/-! ## Layer 5: the steady-state Kalman filter -/

/-- 5.1 The steady-state Kalman filter: if the observation-noise covariance `R` is positive
definite, `(A, C)` is detectable and `(A, G)` is stabilizable, the filter Riccati map with
process-noise covariance `G Gᵀ` has exactly one positive semidefinite fixed point `P`; the
iterates of the filter Riccati map from every positive semidefinite `P₀` converge to `P`; and the
steady-state error dynamics `A (1 - K C)`, with `K` the Kalman gain of `P`, are Schur stable. -/
theorem exists_steadyState_riccatiMap (A : Matrix n n ℝ) (C : Matrix p n ℝ)
    (G : Matrix n q ℝ) (R : Matrix p p ℝ) (hR : R.PosDef) (hd : IsSchurDetectable A C)
    (hs : IsSchurStabilizable A G) :
    ∃ P : Matrix n n ℝ, (P.PosSemidef ∧ riccatiMap A C (G * Gᵀ) R P = P) ∧
      (∀ P' : Matrix n n ℝ, P'.PosSemidef → riccatiMap A C (G * Gᵀ) R P' = P' → P' = P) ∧
      (∀ P₀ : Matrix n n ℝ, P₀.PosSemidef →
        Tendsto (fun k => (riccatiMap A C (G * Gᵀ) R)^[k] P₀) atTop (𝓝 P)) ∧
      IsSchurStable (A * (1 - kalmanGain C R P * C)) := by
  sorry

end TauCetiRoadmap.LinearQuadraticControl

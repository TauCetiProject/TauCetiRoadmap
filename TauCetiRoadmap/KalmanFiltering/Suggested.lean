import Mathlib

/-!
# Kalman filtering: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

States live in `EuclideanSpace ℝ ι` and observations in `EuclideanSpace ℝ κ` for finite index
types `ι` and `κ`; matrices act through `Matrix.toEuclideanLin`. Gaussian laws are Mathlib's
`multivariateGaussian`. Inverses are Mathlib's `⁻¹` on square matrices, which is `0` on a singular
matrix; every statement that uses an inverse assumes what makes the matrix invertible, the
positive definiteness of the observation-noise covariances or of a predicted covariance. The model
is indexed by time `k : ℕ`, the first observation is taken at time `0`, and the observations up
to time `k` form a vector indexed by `Fin (k + 1)`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix
open scoped RealInnerProductSpace ENNReal

namespace TauCetiRoadmap.KalmanFiltering

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]

/-! ## Layer 1: the covariance recursion as a matrix map -/

/-- 1.1 The innovation covariance `C P Cᵀ + R` of a prior covariance `P`, an observation matrix
`C` and an observation-noise covariance `R`. -/
def innovationCov (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix κ κ ℝ :=
  C * P * Cᵀ + R

/-- 1.1 The Kalman gain `P Cᵀ (C P Cᵀ + R)⁻¹`. -/
def kalmanGain (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix ι κ ℝ :=
  P * Cᵀ * (innovationCov C R P)⁻¹

/-- 1.1 The measurement update `P - P Cᵀ (C P Cᵀ + R)⁻¹ C P` of a covariance. -/
def measurementUpdate (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) :
    Matrix ι ι ℝ :=
  P - kalmanGain C R P * C * P

/-- 1.1 The time update `A P Aᵀ + Q` of a covariance. -/
def timeUpdate (A : Matrix ι ι ℝ) (Q : Matrix ι ι ℝ) (P : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  A * P * Aᵀ + Q

/-- 1.1 The Riccati map
`P ↦ A (P - P Cᵀ (C P Cᵀ + R)⁻¹ C P) Aᵀ + Q`: a measurement update followed by a time update. -/
def riccatiMap (A : Matrix ι ι ℝ) (C : Matrix κ ι ℝ) (Q : Matrix ι ι ℝ) (R : Matrix κ κ ℝ)
    (P : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  timeUpdate A Q (measurementUpdate C R P)

/-- 1.2 Completion of the square (the Joseph form). For `P` positive semidefinite, `R` positive
definite and every gain `K`, the covariance `(1 - K C) P (1 - K C)ᵀ + K R Kᵀ` equals the
measurement update plus `(K - K*) S (K - K*)ᵀ`, where `K*` is the Kalman gain and `S` the
innovation covariance. In particular the Kalman gain minimizes it in the Loewner order. -/
theorem joseph_eq_measurementUpdate_add {C : Matrix κ ι ℝ} {R : Matrix κ κ ℝ}
    {P : Matrix ι ι ℝ} (hP : P.PosSemidef) (hR : R.PosDef) (K : Matrix ι κ ℝ) :
    (1 - K * C) * P * (1 - K * C)ᵀ + K * R * Kᵀ =
      measurementUpdate C R P +
        (K - kalmanGain C R P) * innovationCov C R P * (K - kalmanGain C R P)ᵀ := by
  sorry

/-- 1.3 The Riccati map preserves positive semidefiniteness: if `P`, `Q` and `R` are positive
semidefinite, so is `riccatiMap A C Q R P`, whatever `A` and `C`. -/
theorem riccatiMap_posSemidef {A : Matrix ι ι ℝ} {C : Matrix κ ι ℝ} {Q : Matrix ι ι ℝ}
    {R : Matrix κ κ ℝ} {P : Matrix ι ι ℝ} (hP : P.PosSemidef) (hQ : Q.PosSemidef)
    (hR : R.PosSemidef) : (riccatiMap A C Q R P).PosSemidef := by
  sorry

/-- 1.4 The Riccati map is monotone in the Loewner order on positive semidefinite matrices: if
`R` is positive definite, `P` is positive semidefinite and `P' - P` is positive semidefinite, then
`riccatiMap A C Q R P' - riccatiMap A C Q R P` is positive semidefinite, for every `A`, `C`
and `Q`. -/
theorem riccatiMap_sub_posSemidef {A : Matrix ι ι ℝ} {C : Matrix κ ι ℝ} {Q : Matrix ι ι ℝ}
    {R : Matrix κ κ ℝ} {P P' : Matrix ι ι ℝ} (hR : R.PosDef) (hP : P.PosSemidef)
    (hPP' : (P' - P).PosSemidef) :
    (riccatiMap A C Q R P' - riccatiMap A C Q R P).PosSemidef := by
  sorry

/-- 1.5 The information form of the measurement update: if `P` and `R` are positive definite,
the inverse of the updated covariance is `P⁻¹ + Cᵀ R⁻¹ C`. -/
theorem inv_measurementUpdate {C : Matrix κ ι ℝ} {R : Matrix κ κ ℝ} {P : Matrix ι ι ℝ}
    (hP : P.PosDef) (hR : R.PosDef) :
    (measurementUpdate C R P)⁻¹ = P⁻¹ + Cᵀ * R⁻¹ * C := by
  sorry

/-- 1.5 The Kalman gain in terms of the updated covariance: if `P` is positive semidefinite and
`R` positive definite, the gain is `P⁺ Cᵀ R⁻¹`, where `P⁺` is the measurement update of `P`. -/
theorem kalmanGain_eq_measurementUpdate_mul {C : Matrix κ ι ℝ} {R : Matrix κ κ ℝ}
    {P : Matrix ι ι ℝ} (hP : P.PosSemidef) (hR : R.PosDef) :
    kalmanGain C R P = measurementUpdate C R P * Cᵀ * R⁻¹ := by
  sorry

/-! ## Layer 2: the state-space model and the filter recursion -/

/-- 2.1 The data of a linear state-space model with states in `EuclideanSpace ℝ ι` and
observations in `EuclideanSpace ℝ κ`: transition matrices `A k`, observation matrices `C k`,
process-noise covariances `Q k`, observation-noise covariances `R k`, and the mean `m₀` and
covariance `P₀` of the initial state. -/
structure StateSpaceModel (ι κ : Type*) where
  /-- The transition matrix at time `k`. -/
  A : ℕ → Matrix ι ι ℝ
  /-- The observation matrix at time `k`. -/
  C : ℕ → Matrix κ ι ℝ
  /-- The process-noise covariance at time `k`. -/
  Q : ℕ → Matrix ι ι ℝ
  /-- The observation-noise covariance at time `k`. -/
  R : ℕ → Matrix κ κ ℝ
  /-- The mean of the initial state. -/
  m₀ : EuclideanSpace ℝ ι
  /-- The covariance of the initial state. -/
  P₀ : Matrix ι ι ℝ

/-- 2.2 The predicted covariances `P (k | k - 1)`: `P₀` at time `0`, then the Riccati map. -/
def predCov (M : StateSpaceModel ι κ) : ℕ → Matrix ι ι ℝ
  | 0 => M.P₀
  | k + 1 => riccatiMap (M.A k) (M.C k) (M.Q k) (M.R k) (predCov M k)

/-- 2.2 The filtered covariances `P (k | k)`: the measurement update of the predicted one. -/
def filtCov (M : StateSpaceModel ι κ) (k : ℕ) : Matrix ι ι ℝ :=
  measurementUpdate (M.C k) (M.R k) (predCov M k)

/-- 2.2 The predicted means `x̂ (k | k - 1)` along an observation sequence `ys`: `m₀` at time
`0`, then a measurement update with the gain of time `k` followed by the transition `A k`. It
reads `ys j` for `j < k` only. -/
def predMean (M : StateSpaceModel ι κ) (ys : ℕ → EuclideanSpace ℝ κ) :
    ℕ → EuclideanSpace ℝ ι
  | 0 => M.m₀
  | k + 1 => (M.A k).toEuclideanLin
      (predMean M ys k + (kalmanGain (M.C k) (M.R k) (predCov M k)).toEuclideanLin
        (ys k - (M.C k).toEuclideanLin (predMean M ys k)))

/-- 2.2 The filtered means `x̂ (k | k)`: the predicted mean corrected by the gain times the
innovation. It reads `ys j` for `j ≤ k` only. -/
def filtMean (M : StateSpaceModel ι κ) (ys : ℕ → EuclideanSpace ℝ κ) (k : ℕ) :
    EuclideanSpace ℝ ι :=
  predMean M ys k + (kalmanGain (M.C k) (M.R k) (predCov M k)).toEuclideanLin
    (ys k - (M.C k).toEuclideanLin (predMean M ys k))

variable {Ω : Type*} [MeasurableSpace Ω]

/-- 2.3 The linear Gaussian state-space model: `x (k + 1) = A k (x k) + w k` and
`y k = C k (x k) + v k` everywhere, `x 0 ~ N(m₀, P₀)`, `w k ~ N(0, Q k)`, `v k ~ N(0, R k)`, with
`P₀` and every `Q k` positive semidefinite, and the initial state, the process noises and the
observation noises mutually independent. Mutual independence is stated as independence of the
pairs `(w k, v k)` over `k`, independence of `w k` and `v k` for each `k`, and independence of
`x 0` from the whole noise sequence. The primitive variables are measurable. -/
structure IsLinearGaussianModel (M : StateSpaceModel ι κ) (P : Measure Ω)
    (x : ℕ → Ω → EuclideanSpace ℝ ι) (y : ℕ → Ω → EuclideanSpace ℝ κ)
    (w : ℕ → Ω → EuclideanSpace ℝ ι) (v : ℕ → Ω → EuclideanSpace ℝ κ) : Prop where
  state_succ : ∀ k ω, x (k + 1) ω = (M.A k).toEuclideanLin (x k ω) + w k ω
  obs : ∀ k ω, y k ω = (M.C k).toEuclideanLin (x k ω) + v k ω
  measurable_init : Measurable (x 0)
  measurable_w : ∀ k, Measurable (w k)
  measurable_v : ∀ k, Measurable (v k)
  posSemidef_P₀ : M.P₀.PosSemidef
  posSemidef_Q : ∀ k, (M.Q k).PosSemidef
  hasLaw_init : HasLaw (x 0) (multivariateGaussian M.m₀ M.P₀) P
  hasLaw_w : ∀ k, HasLaw (w k) (multivariateGaussian 0 (M.Q k)) P
  hasLaw_v : ∀ k, HasLaw (v k) (multivariateGaussian 0 (M.R k)) P
  iIndepFun_noise : iIndepFun (fun k ω => (w k ω, v k ω)) P
  indepFun_noise : ∀ k, IndepFun (w k) (v k) P
  indepFun_init : IndepFun (x 0) (fun ω k => (w k ω, v k ω)) P

/-- 2.3 The observations up to time `k`, as a vector indexed by `Fin (k + 1)`. -/
def obsWindow (y : ℕ → Ω → EuclideanSpace ℝ κ) (k : ℕ) (ω : Ω) :
    Fin (k + 1) → EuclideanSpace ℝ κ :=
  fun j => y j ω

/-- 2.4 The second-order model: the same recursions, with square-integrable primitive
variables of the given means and covariances that are pairwise uncorrelated, and no
distributional assumption. Covariances are stated through inner products with fixed vectors. -/
structure IsSecondOrderModel (M : StateSpaceModel ι κ) (P : Measure Ω)
    (x : ℕ → Ω → EuclideanSpace ℝ ι) (y : ℕ → Ω → EuclideanSpace ℝ κ)
    (w : ℕ → Ω → EuclideanSpace ℝ ι) (v : ℕ → Ω → EuclideanSpace ℝ κ) : Prop where
  state_succ : ∀ k ω, x (k + 1) ω = (M.A k).toEuclideanLin (x k ω) + w k ω
  obs : ∀ k ω, y k ω = (M.C k).toEuclideanLin (x k ω) + v k ω
  memLp_init : MemLp (x 0) 2 P
  memLp_w : ∀ k, MemLp (w k) 2 P
  memLp_v : ∀ k, MemLp (v k) 2 P
  integral_init : ∫ ω, x 0 ω ∂P = M.m₀
  integral_w : ∀ k, ∫ ω, w k ω ∂P = 0
  integral_v : ∀ k, ∫ ω, v k ω ∂P = 0
  cov_init : ∀ a b : EuclideanSpace ℝ ι,
    cov[fun ω => ⟪a, x 0 ω⟫, fun ω => ⟪b, x 0 ω⟫; P] = ⟪a, M.P₀.toEuclideanLin b⟫
  cov_w : ∀ k (a b : EuclideanSpace ℝ ι),
    cov[fun ω => ⟪a, w k ω⟫, fun ω => ⟪b, w k ω⟫; P] = ⟪a, (M.Q k).toEuclideanLin b⟫
  cov_v : ∀ k (a b : EuclideanSpace ℝ κ),
    cov[fun ω => ⟪a, v k ω⟫, fun ω => ⟪b, v k ω⟫; P] = ⟪a, (M.R k).toEuclideanLin b⟫
  cov_init_w : ∀ k (a b : EuclideanSpace ℝ ι),
    cov[fun ω => ⟪a, x 0 ω⟫, fun ω => ⟪b, w k ω⟫; P] = 0
  cov_init_v : ∀ k (a : EuclideanSpace ℝ ι) (b : EuclideanSpace ℝ κ),
    cov[fun ω => ⟪a, x 0 ω⟫, fun ω => ⟪b, v k ω⟫; P] = 0
  cov_w_w : ∀ j k, j ≠ k → ∀ a b : EuclideanSpace ℝ ι,
    cov[fun ω => ⟪a, w j ω⟫, fun ω => ⟪b, w k ω⟫; P] = 0
  cov_v_v : ∀ j k, j ≠ k → ∀ a b : EuclideanSpace ℝ κ,
    cov[fun ω => ⟪a, v j ω⟫, fun ω => ⟪b, v k ω⟫; P] = 0
  cov_w_v : ∀ j k (a : EuclideanSpace ℝ ι) (b : EuclideanSpace ℝ κ),
    cov[fun ω => ⟪a, w j ω⟫, fun ω => ⟪b, v k ω⟫; P] = 0

/-- 2.5 The orthogonality principle for the filtered mean. In the second-order model with
positive definite observation-noise covariances, the filtering error `x k - x̂ (k | k)` has mean
zero, is uncorrelated with every observation `y i` with `i ≤ k`, and has covariance
`P (k | k)`. -/
theorem filtError_orthogonal {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsSecondOrderModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    ∫ ω, (x k ω - filtMean M (fun j => y j ω) k) ∂P = 0 ∧
      (∀ i ≤ k, ∀ (a : EuclideanSpace ℝ ι) (b : EuclideanSpace ℝ κ),
        cov[fun ω => ⟪a, x k ω - filtMean M (fun j => y j ω) k⟫, fun ω => ⟪b, y i ω⟫; P] = 0) ∧
      ∀ a b : EuclideanSpace ℝ ι,
        cov[fun ω => ⟪a, x k ω - filtMean M (fun j => y j ω) k⟫,
          fun ω => ⟪b, x k ω - filtMean M (fun j => y j ω) k⟫; P] =
          ⟪a, (filtCov M k).toEuclideanLin b⟫ := by
  sorry

/-- 2.5 The orthogonality principle for the predicted mean. In the second-order model with
positive definite observation-noise covariances, the prediction error
`x (k + 1) - x̂ (k + 1 | k)` has mean zero, is uncorrelated with every observation `y i` with
`i ≤ k`, and has covariance `P (k + 1 | k)`. -/
theorem predError_orthogonal {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsSecondOrderModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    ∫ ω, (x (k + 1) ω - predMean M (fun j => y j ω) (k + 1)) ∂P = 0 ∧
      (∀ i ≤ k, ∀ (a : EuclideanSpace ℝ ι) (b : EuclideanSpace ℝ κ),
        cov[fun ω => ⟪a, x (k + 1) ω - predMean M (fun j => y j ω) (k + 1)⟫,
          fun ω => ⟪b, y i ω⟫; P] = 0) ∧
      ∀ a b : EuclideanSpace ℝ ι,
        cov[fun ω => ⟪a, x (k + 1) ω - predMean M (fun j => y j ω) (k + 1)⟫,
          fun ω => ⟪b, x (k + 1) ω - predMean M (fun j => y j ω) (k + 1)⟫; P] =
          ⟪a, (predCov M (k + 1)).toEuclideanLin b⟫ := by
  sorry

/-! ## Layer 3: the conditional laws of the state -/

/-- 3.1 The Kalman filter. In the linear Gaussian model with positive definite
observation-noise covariances, the conditional law of `x k` given the observations up to time
`k` is, almost surely, Gaussian with the filtered mean and the filtered covariance. -/
theorem condDistrib_state_obsWindow {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    ⇑(condDistrib (x k) (obsWindow y k) P) =ᵐ[P.map (obsWindow y k)]
      fun t => multivariateGaussian (filtMean M (Function.extend Fin.val t 0) k) (filtCov M k) := by
  sorry

/-- 3.2 One-step prediction. Under the same hypotheses, the conditional law of `x (k + 1)` given
the observations up to time `k` is, almost surely, Gaussian with the predicted mean and the
predicted covariance of time `k + 1`. -/
theorem condDistrib_succ_state_obsWindow {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    ⇑(condDistrib (x (k + 1)) (obsWindow y k) P) =ᵐ[P.map (obsWindow y k)]
      fun t => multivariateGaussian (predMean M (Function.extend Fin.val t 0) (k + 1))
        (predCov M (k + 1)) := by
  sorry

/-! ## Layer 4: innovations -/

/-- 4.1 The innovation at time `k`: the observation minus `C k` applied to the predicted mean
computed from the earlier observations. -/
def innovation (M : StateSpaceModel ι κ) (y : ℕ → Ω → EuclideanSpace ℝ κ) (k : ℕ) (ω : Ω) :
    EuclideanSpace ℝ κ :=
  y k ω - (M.C k).toEuclideanLin (predMean M (fun j => y j ω) k)

/-- 4.2 The innovations of the linear Gaussian model with positive definite observation-noise
covariances are mutually independent. -/
theorem iIndepFun_innovation {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) :
    iIndepFun (innovation M y) P := by
  sorry

/-- 4.2 The innovation at time `k` is centred Gaussian with covariance
`C k P (k | k - 1) (C k)ᵀ + R k`. -/
theorem hasLaw_innovation {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    HasLaw (innovation M y k)
      (multivariateGaussian 0 (innovationCov (M.C k) (M.R k) (predCov M k))) P := by
  sorry

/-! ## Layer 5: optimality -/

/-- 5.1 The filtered mean is the conditional expectation of the state given the observations up
to time `k`. -/
theorem filtMean_ae_eq_condExp {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) :
    (fun ω => filtMean M (fun j => y j ω) k) =ᵐ[P]
      P[x k | MeasurableSpace.comap (obsWindow y k) inferInstance] := by
  sorry

/-- 5.2 The best affine estimator. In the second-order model with positive definite
observation-noise covariances, the filtered mean has mean squared error equal to the trace of
the filtered covariance, and no affine function of the observations up to time `k` does
better. -/
theorem lintegral_sq_error_filtMean_le_affine {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsSecondOrderModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ)
    (g : (Fin (k + 1) → EuclideanSpace ℝ κ) →ᵃ[ℝ] EuclideanSpace ℝ ι) :
    ∫⁻ ω, ‖x k ω - filtMean M (fun j => y j ω) k‖ₑ ^ 2 ∂P =
        ENNReal.ofReal (filtCov M k).trace ∧
      ∫⁻ ω, ‖x k ω - filtMean M (fun j => y j ω) k‖ₑ ^ 2 ∂P ≤
        ∫⁻ ω, ‖x k ω - g (obsWindow y k ω)‖ₑ ^ 2 ∂P := by
  sorry

/-- 5.3 Minimum mean squared error: no measurable function of the observations up to time `k`
estimates `x k` with smaller mean squared error than the filtered mean. -/
theorem lintegral_sq_error_filtMean_le {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) (k : ℕ) (g : (Fin (k + 1) → EuclideanSpace ℝ κ) → EuclideanSpace ℝ ι)
    (hg : Measurable g) :
    ∫⁻ ω, ‖x k ω - filtMean M (fun j => y j ω) k‖ₑ ^ 2 ∂P ≤
      ∫⁻ ω, ‖x k ω - g (obsWindow y k ω)‖ₑ ^ 2 ∂P := by
  sorry

/-! ## Layer 6: the Rauch–Tung–Striebel smoother -/

/-- 6.1 The smoother gain at time `k`: `P (k | k) (A k)ᵀ P (k + 1 | k)⁻¹`. -/
def smootherGain (M : StateSpaceModel ι κ) (k : ℕ) : Matrix ι ι ℝ :=
  filtCov M k * (M.A k)ᵀ * (predCov M (k + 1))⁻¹

/-- 6.1 The smoothed covariances on the horizon `N`, indexed by the number `j` of steps back
from `N`: the filtered covariance at `N`, then the backward recursion at time `N - (j + 1)`. -/
def smoothCovBack (M : StateSpaceModel ι κ) (N : ℕ) : ℕ → Matrix ι ι ℝ
  | 0 => filtCov M N
  | j + 1 =>
      filtCov M (N - (j + 1)) + smootherGain M (N - (j + 1)) *
        (smoothCovBack M N j - predCov M (N - (j + 1) + 1)) * (smootherGain M (N - (j + 1)))ᵀ

/-- 6.1 The smoothed covariance `P (k | N)`. -/
def smoothCov (M : StateSpaceModel ι κ) (N k : ℕ) : Matrix ι ι ℝ :=
  smoothCovBack M N (N - k)

/-- 6.1 The smoothed means on the horizon `N`, indexed by the number `j` of steps back from `N`:
the filtered mean at `N`, then the backward recursion at time `N - (j + 1)`. -/
def smoothMeanBack (M : StateSpaceModel ι κ) (ys : ℕ → EuclideanSpace ℝ κ) (N : ℕ) :
    ℕ → EuclideanSpace ℝ ι
  | 0 => filtMean M ys N
  | j + 1 =>
      filtMean M ys (N - (j + 1)) + (smootherGain M (N - (j + 1))).toEuclideanLin
        (smoothMeanBack M ys N j - predMean M ys (N - (j + 1) + 1))

/-- 6.1 The smoothed mean `x̂ (k | N)`. -/
def smoothMean (M : StateSpaceModel ι κ) (ys : ℕ → EuclideanSpace ℝ κ) (N k : ℕ) :
    EuclideanSpace ℝ ι :=
  smoothMeanBack M ys N (N - k)

/-- 6.3 The Rauch–Tung–Striebel smoother. In the linear Gaussian model with positive definite
observation-noise covariances, for `k ≤ N`, if the predicted covariances `P (j + 1 | j)` are
positive definite for `k ≤ j < N`, the conditional law of `x k` given the observations up to time
`N` is, almost surely, Gaussian with the smoothed mean and covariance. -/
theorem condDistrib_state_obsWindow_smooth {M : StateSpaceModel ι κ} {P : Measure Ω}
    [IsProbabilityMeasure P] {x : ℕ → Ω → EuclideanSpace ℝ ι}
    {y : ℕ → Ω → EuclideanSpace ℝ κ} {w : ℕ → Ω → EuclideanSpace ℝ ι}
    {v : ℕ → Ω → EuclideanSpace ℝ κ} (h : IsLinearGaussianModel M P x y w v)
    (hR : ∀ k, (M.R k).PosDef) {N k : ℕ} (hkN : k ≤ N)
    (hpred : ∀ j, k ≤ j → j < N → (predCov M (j + 1)).PosDef) :
    ⇑(condDistrib (x k) (obsWindow y N) P) =ᵐ[P.map (obsWindow y N)]
      fun t => multivariateGaussian (smoothMean M (Function.extend Fin.val t 0) N k)
        (smoothCov M N k) := by
  sorry

end TauCetiRoadmap.KalmanFiltering

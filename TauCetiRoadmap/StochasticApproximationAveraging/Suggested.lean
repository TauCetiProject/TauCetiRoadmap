import Mathlib
import TauCeti.Probability.Moments.Covariance

/-!
# Stochastic approximation with averaging: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Vectors live in `EuclideanSpace ℝ (Fin d)` and matrices act on them through
`Matrix.toEuclideanLin`. Matrix norms are the `L²` operator norms. A matrix is positively stable
when every complex eigenvalue has positive real part. The recursion
`x (t + 1) = x t - γ t • (R (x t) + ξ t)` is a hypothesis on a sequence of random vectors, and the
averaged iterate is `t⁻¹ • ∑_{i < t} x (i + 1)`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset
open scoped Topology Matrix Matrix.Norms.L2Operator

namespace TauCetiRoadmap.StochasticApproximationAveraging

variable {d : ℕ}

/-! ## Layer 1: step sizes and the gain matrices -/

/-- 1.1 A real square matrix is positively stable when every complex eigenvalue has positive real
part. -/
def IsPositivelyStable (A : Matrix (Fin d) (Fin d) ℝ) : Prop :=
  ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), 0 < μ.re

/-- 1.1 Admissible step sizes for `A`: either a constant step `η > 0` with `‖1 - η μ‖ < 1` for
every complex eigenvalue `μ` of `A`, or positive steps tending to `0` with
`(γ t - γ (t + 1)) / γ t = o(γ t)`. -/
def IsAdmissibleStepSize (A : Matrix (Fin d) (Fin d) ℝ) (γ : ℕ → ℝ) : Prop :=
  (∃ η : ℝ, 0 < η ∧ (∀ t, γ t = η) ∧
      ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), ‖1 - (η : ℂ) * μ‖ < 1) ∨
    ((∀ t, 0 < γ t) ∧ Tendsto γ atTop (𝓝 0) ∧
      (fun t => (γ t - γ (t + 1)) / γ t) =o[atTop] γ)

/-- 1.2 `stepProduct A γ i m = (1 - γ (i + m - 1) • A) * ⋯ * (1 - γ i • A)`, the product of the
`m` step matrices starting at index `i`, later factors on the left. -/
def stepProduct (A : Matrix (Fin d) (Fin d) ℝ) (γ : ℕ → ℝ) (i : ℕ) :
    ℕ → Matrix (Fin d) (Fin d) ℝ
  | 0 => 1
  | m + 1 => (1 - γ (i + m) • A) * stepProduct A γ i m

/-- 1.2 The gain matrix `B^t_i = γ i • ∑_{j = i + 1}^{t} (1 - γ (j - 1) • A) ⋯ (1 - γ (i + 1) • A)`
with which the noise `ξ i` enters `t` times the averaged error; it is `0` for `t ≤ i`. -/
def gainMatrix (A : Matrix (Fin d) (Fin d) ℝ) (γ : ℕ → ℝ) (t i : ℕ) :
    Matrix (Fin d) (Fin d) ℝ :=
  γ i • ∑ m ∈ range (t - i), stepProduct A γ (i + 1) m

/-- 1.2 The matrix `B_t = ∑_{j = 1}^{t} (1 - γ (j - 1) • A) ⋯ (1 - γ 0 • A)` with which the initial
error enters `t` times the averaged error. -/
def initialGain (A : Matrix (Fin d) (Fin d) ℝ) (γ : ℕ → ℝ) (t : ℕ) :
    Matrix (Fin d) (Fin d) ℝ :=
  ∑ m ∈ range t, stepProduct A γ 0 (m + 1)

/-- 1.2 The Polyak–Juditsky lemma: for a positively stable `A` and admissible step sizes, the gain
matrices are uniformly bounded and tend to `A⁻¹` in Cesàro mean. -/
theorem gainMatrix_bounded_and_cesaro_tendsto (A : Matrix (Fin d) (Fin d) ℝ)
    (hA : IsPositivelyStable A) (γ : ℕ → ℝ) (hγ : IsAdmissibleStepSize A γ) :
    (∃ C, ∀ t i, ‖gainMatrix A γ t i‖ ≤ C) ∧ (∃ C, ∀ t, ‖initialGain A γ t‖ ≤ C) ∧
      Tendsto (fun t : ℕ => (t : ℝ)⁻¹ * ∑ i ∈ range t, ‖gainMatrix A γ t i - A⁻¹‖)
        atTop (𝓝 0) := by
  sorry

/-! ## Layer 2: the asymptotic linear representation of the averaged iterate -/

/-- 2.1 The averaged iterate `t⁻¹ • ∑_{i < t} x (i + 1)` (the start `x 0` is not averaged; the
value at `t = 0` is `0`). -/
def averagedIterate {Ω E : Type*} [AddCommGroup E] [Module ℝ E] (x : ℕ → Ω → E) (t : ℕ)
    (ω : Ω) : E :=
  (t : ℝ)⁻¹ • ∑ i ∈ range t, x (i + 1) ω

/-- 2.1 Asymptotic linearity (Polyak–Juditsky): for a measurable start, under martingale-difference
noise with bounded second moments and the averaged linearization condition, `√t (x̄ t - x⋆)` differs from
`-A⁻¹ t^{-1/2} ∑_{i < t} ξ i` by a term tending to `0` in probability. -/
theorem tendstoInMeasure_sqrt_smul_averagedIterate_sub_add {Ω : Type*} {m₀ : MeasurableSpace Ω}
    {P : Measure Ω} [IsProbabilityMeasure P] (ℱ : Filtration ℕ m₀)
    (A : Matrix (Fin d) (Fin d) ℝ) (hA : IsPositivelyStable A) (γ : ℕ → ℝ)
    (hγ : IsAdmissibleStepSize A γ) (R : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (xstar : EuclideanSpace ℝ (Fin d)) (x ξ : ℕ → Ω → EuclideanSpace ℝ (Fin d))
    (hx₀ : AEStronglyMeasurable (x 0) P)
    (hrec : ∀ t ω, x (t + 1) ω = x t ω - γ t • (R (x t ω) + ξ t ω))
    (hξmeas : ∀ t, StronglyMeasurable[ℱ (t + 1)] (ξ t)) (hξL2 : ∀ t, MemLp (ξ t) 2 P)
    (hξbdd : ∃ C, ∀ t, ∫ ω, ‖ξ t ω‖ ^ 2 ∂P ≤ C)
    (hmds : ∀ t, condExp (ℱ t) P (ξ t) =ᵐ[P] 0)
    (hlin : TendstoInMeasure P
      (fun (t : ℕ) ω => (Real.sqrt t)⁻¹ *
        ∑ i ∈ range t, ‖R (x i ω) - Matrix.toEuclideanLin A (x i ω - xstar)‖)
      atTop (fun _ => 0)) :
    TendstoInMeasure P
      (fun (t : ℕ) ω => Real.sqrt t • (averagedIterate x t ω - xstar) +
        (Real.sqrt t)⁻¹ • Matrix.toEuclideanLin A⁻¹ (∑ i ∈ range t, ξ i ω))
      atTop (fun _ => 0) := by
  sorry

/-! ## Layer 3: asymptotic normality with independent noise -/

/-- 3.1 The Polyak–Ruppert central limit theorem with i.i.d. additive noise: if the noise is
i.i.d., centred and square-integrable with covariance matrix `S`, the start is deterministic, `R`
is measurable and the averaged linearization condition holds, then `√t (x̄ t - x⋆)` converges in
law to `N(0, A⁻¹ S A⁻ᵀ)`. For linear `R θ = A (θ - θ⋆)` the linearization condition holds
identically. -/
theorem tendstoInDistribution_sqrt_smul_averagedIterate_sub {Ω : Type*} {m₀ : MeasurableSpace Ω}
    {P : Measure Ω} [IsProbabilityMeasure P]
    (A : Matrix (Fin d) (Fin d) ℝ) (hA : IsPositivelyStable A) (γ : ℕ → ℝ)
    (hγ : IsAdmissibleStepSize A γ) (R : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (hR : Measurable R) (xstar x₀ : EuclideanSpace ℝ (Fin d))
    (x ξ : ℕ → Ω → EuclideanSpace ℝ (Fin d))
    (hξmeas : ∀ t, Measurable (ξ t)) (hindep : iIndepFun ξ P)
    (hident : ∀ t, IdentDistrib (ξ t) (ξ 0) P P) (hL2 : MemLp (ξ 0) 2 P)
    (hmean : ∫ ω, ξ 0 ω ∂P = 0)
    (hx₀ : ∀ ω, x 0 ω = x₀) (hrec : ∀ t ω, x (t + 1) ω = x t ω - γ t • (R (x t ω) + ξ t ω))
    (hlin : TendstoInMeasure P
      (fun (t : ℕ) ω => (Real.sqrt t)⁻¹ *
        ∑ i ∈ range t, ‖R (x i ω) - Matrix.toEuclideanLin A (x i ω - xstar)‖)
      atTop (fun _ => 0))
    {Ω' : Type*} [MeasurableSpace Ω'] {P' : Measure Ω'} [IsProbabilityMeasure P']
    {Z : Ω' → EuclideanSpace ℝ (Fin d)}
    (hZ : HasLaw Z (multivariateGaussian 0
      (A⁻¹ * TauCeti.covMatrix (P.map (ξ 0)) * (A⁻¹)ᵀ)) P') :
    TendstoInDistribution (fun (t : ℕ) ω => Real.sqrt t • (averagedIterate x t ω - xstar))
      atTop Z (fun _ => P) P' := by
  sorry

/-! ## Layer 4: optimality of the averaged covariance -/

/-- 4.1 The gain comparison: if `B = Γ A - 1/2` is positively stable and `V` solves the Lyapunov
equation `B V + V Bᵀ = Γ S Γᵀ` with `S` positive semidefinite, then `V - A⁻¹ S A⁻ᵀ` is positive
semidefinite; if `S` is positive definite, `V = A⁻¹ S A⁻ᵀ` exactly when `Γ = A⁻¹`. -/
theorem posSemidef_sub_of_lyapunov (A Γ S V : Matrix (Fin d) (Fin d) ℝ) (hS : S.PosSemidef)
    (hB : IsPositivelyStable (Γ * A - (1 / 2 : ℝ) • 1))
    (hV : (Γ * A - (1 / 2 : ℝ) • 1) * V + V * (Γ * A - (1 / 2 : ℝ) • 1)ᵀ = Γ * S * Γᵀ) :
    (V - A⁻¹ * S * (A⁻¹)ᵀ).PosSemidef ∧
      (S.PosDef → (V = A⁻¹ * S * (A⁻¹)ᵀ ↔ Γ = A⁻¹)) := by
  sorry

end TauCetiRoadmap.StochasticApproximationAveraging

import Mathlib
import TauCeti.Analysis.Matrix.CovariancePseudoInverse

/-!
# Policy gradient methods for finite discounted MDPs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: the policy gradient theorem for the direct (1.2) and
the softmax (3.1) parametrizations, gradient domination (2.1), the non-uniform Łojasiewicz
inequality (3.2), the compatibility of the advantage with the Fisher matrix (4.1), natural
policy gradient as a multiplicative-weights step (4.1), the improvement lemma (4.2) and the
convergence rate of natural policy gradient (4.3). The README's Checks are not restated.

The structure `MDP` restates, with an identical body, the structure of the same name of
MarkovDecisionProcesses (Conventions and 1.1), which owns it, so that the statements can be made
here without importing another roadmap. The value, Q-function and discounted state-visitation
vector of a weight table are defined here by the matrix formulas of MarkovDecisionProcesses 1.2
(`value_eq_inverse`) and 3.3 (`occupancy_real_singleton`); at a policy they are that roadmap's
value, Q-function and occupancy measure.

Suppliers used by the README and not restated here: MarkovDecisionProcesses 1.2
(`value_eq_inverse`), 3.3 (`occupancy_real_singleton`, `performanceDifference`) and the
occupancy measure being a probability measure (3.3); MathematicalStatisticsFoundations 4.3 (the
information matrix of a square-integrable score is positive semidefinite); Mathlib
`hasFDerivAt_ringInverse`, `Matrix.linftyOpNormedRing`, `Matrix.linftyOpNormedAlgebra`,
`NormedRing.inverse_one_sub`, `HasFDerivAt.comp`, `ConcaveOn.le_map_sum`,
`strictConcaveOn_log_Ioi`, `Real.log_nonpos`, `Finset.sum_mul_sq_le_sq_mul_sq`; Tau Ceti
`Matrix.covariancePseudoInverse` and `Matrix.isMoorePenroseInverse_covariancePseudoInverse`.
-/

noncomputable section

open Finset Matrix
open scoped NNReal

namespace TauCetiRoadmap.PolicyGradientMethods

/-- 1.1: a Markov decision process with transition law `trans s a` and mean reward `reward s a`
bounded in absolute value by `rewardBound` (MarkovDecisionProcesses, Conventions). -/
structure MDP (S A : Type*) where
  trans : S → A → PMF S
  reward : S → A → ℝ
  rewardBound : ℝ
  abs_reward_le : ∀ s a, |reward s a| ≤ rewardBound

/-- 1.1: a weight table `π : S → A → ℝ` is a policy when every row is a probability vector. -/
def IsPolicy {S A : Type*} [Fintype A] (π : S → A → ℝ) : Prop :=
  ∀ s, (∀ a, 0 ≤ π s a) ∧ ∑ a, π s a = 1

/-- 3.1: the tabular softmax parametrization `π_θ (a | s) = exp (θ s a) / Σ_b exp (θ s b)`. -/
def softmax {S A : Type*} [Fintype A] (θ : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ Real.exp (θ s a) / ∑ b, Real.exp (θ s b)

/-- 3.2: the weight table of a deterministic policy `d : S → A`. -/
def detPolicy {S A : Type*} [DecidableEq A] (d : S → A) : S → A → ℝ :=
  fun s a ↦ if a = d s then 1 else 0

variable {S A : Type*} [Fintype S] [DecidableEq S] [Fintype A] [DecidableEq A]

namespace MDP

variable (M : MDP S A)

/-! ## Layer 1: values of weight tables and the direct policy gradient -/

/-- 1.1: the state transition matrix `P^π s s' = Σ_a π s a · trans s a s'` of a weight table. -/
def transMatrix (π : S → A → ℝ) : Matrix S S ℝ :=
  Matrix.of fun s s' ↦ ∑ a, π s a * (M.trans s a s').toReal

/-- 1.1: the mean reward `r^π s = Σ_a π s a · reward s a` of a weight table. -/
def meanReward (π : S → A → ℝ) : S → ℝ :=
  fun s ↦ ∑ a, π s a * M.reward s a

/-- 1.1: the value `V^π = (1 - γ P^π)⁻¹ r^π` of a weight table. -/
def policyValue (γ : ℝ≥0) (π : S → A → ℝ) : S → ℝ :=
  Ring.inverse (1 - (γ : ℝ) • M.transMatrix π) *ᵥ M.meanReward π

/-- 1.1: the Q-function `Q^π (s, a) = reward s a + γ Σ_{s'} trans s a s' · V^π s'`. -/
def policyQ (γ : ℝ≥0) (π : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ M.reward s a + γ * ∑ s', (M.trans s a s').toReal * M.policyValue γ π s'

/-- 1.1: the advantage `A^π (s, a) = Q^π (s, a) - V^π s`. -/
def advantage (γ : ℝ≥0) (π : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ M.policyQ γ π s a - M.policyValue γ π s

/-- 1.1: the discounted state-visitation vector `d^π_μ = (1 - γ) μ (1 - γ P^π)⁻¹`. -/
def visitation (γ : ℝ≥0) (μ : S → ℝ) (π : S → A → ℝ) : S → ℝ :=
  (1 - (γ : ℝ)) • (μ ᵥ* Ring.inverse (1 - (γ : ℝ) • M.transMatrix π))

/-- 1.1: the objective `V^π(μ) = Σ_s μ s · V^π s`. -/
def objective (γ : ℝ≥0) (μ : S → ℝ) (π : S → A → ℝ) : ℝ :=
  μ ⬝ᵥ M.policyValue γ π

/-- 1.2: the policy gradient theorem for the direct parametrization: at a policy `π`, the
objective is differentiable and `∂V^π(μ)/∂π(a|s) = d^π_μ s · Q^π (s, a) / (1 - γ)`. -/
theorem fderiv_objective {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) {π : S → A → ℝ}
    (hπ : IsPolicy π) :
    DifferentiableAt ℝ (M.objective γ μ) π ∧
      ∀ h : S → A → ℝ, fderiv ℝ (M.objective γ μ) π h =
        ∑ s, ∑ a, h s a * (M.visitation γ μ π s * M.policyQ γ π s a / (1 - γ)) :=
  sorry

/-! ## Layer 2: gradient domination -/

/-- 2.1: gradient domination for the direct parametrization. If `d^{π'}_ρ ≤ C μ`, then
`V^{π'}(ρ) - V^π(ρ)` is at most `C / (1 - γ)` times the directional derivative
`(π̄ - π)ᵀ ∇V^π(μ)` towards some policy `π̄`; for `C ≥ 0` this is the bound by the largest
directional derivative over policies, which is attained. -/
theorem gradientDomination {γ : ℝ≥0} (hγ : γ < 1) {μ ρ : S → ℝ} (hρ : 0 ≤ ρ)
    {π π' : S → A → ℝ} (hπ : IsPolicy π) (hπ' : IsPolicy π') {C : ℝ}
    (hC : ∀ s, M.visitation γ ρ π' s ≤ C * μ s) :
    ∃ πbar : S → A → ℝ, IsPolicy πbar ∧
      M.objective γ ρ π' - M.objective γ ρ π ≤
        C / (1 - γ) * fderiv ℝ (M.objective γ μ) π (πbar - π) :=
  sorry

/-! ## Layer 3: the softmax parametrization -/

/-- 3.1: the policy gradient theorem for the softmax parametrization:
`∂V^{π_θ}(μ)/∂θ s a = d^{π_θ}_μ s · π_θ (a | s) · A^{π_θ} (s, a) / (1 - γ)`. -/
theorem fderiv_objective_softmax {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (θ : S → A → ℝ) :
    DifferentiableAt ℝ (fun θ ↦ M.objective γ μ (softmax θ)) θ ∧
      ∀ h : S → A → ℝ, fderiv ℝ (fun θ ↦ M.objective γ μ (softmax θ)) θ h =
        ∑ s, ∑ a, h s a * (M.visitation γ μ (softmax θ) s * softmax θ s a *
          M.advantage γ (softmax θ) s a / (1 - γ)) :=
  sorry

/-- 3.1: the gradient of the softmax objective as a vector indexed by `S × A`. -/
def softmaxGrad (γ : ℝ≥0) (μ : S → ℝ) (θ : S → A → ℝ) : S × A → ℝ :=
  fun i ↦ fderiv ℝ (fun θ ↦ M.objective γ μ (softmax θ)) θ (Pi.single i.1 (Pi.single i.2 1))

/-- 3.2: the non-uniform Łojasiewicz inequality for the softmax parametrization. For a
deterministic policy `d` with `d^d_ρ ≤ C d^{π_θ}_μ`,
`min_s π_θ (d s | s) · (V^d(ρ) - V^{π_θ}(ρ)) ≤ √|S| · C · ‖∇_θ V^{π_θ}(μ)‖₂`. -/
theorem lojasiewicz_softmax [Nonempty S] {γ : ℝ≥0} (hγ : γ < 1) {μ ρ : S → ℝ} (hμ : 0 ≤ μ)
    (hρ : 0 ≤ ρ) (θ : S → A → ℝ) (d : S → A) {C : ℝ}
    (hC : ∀ s, M.visitation γ ρ (detPolicy d) s ≤ C * M.visitation γ μ (softmax θ) s) :
    (univ.inf' univ_nonempty fun s ↦ softmax θ s (d s)) *
        (M.objective γ ρ (detPolicy d) - M.objective γ ρ (softmax θ)) ≤
      Real.sqrt (Fintype.card S) * C * Real.sqrt (∑ i, M.softmaxGrad γ μ θ i ^ 2) :=
  sorry

/-! ## Layer 4: natural policy gradient -/

/-- 4.1: the Fisher matrix `F_μ(θ) = Σ_s d^{π_θ}_μ s Σ_a π_θ (a | s) ∇ log π_θ (a | s)
∇ log π_θ (a | s)ᵀ` of the softmax parametrization, indexed by `S × A`. -/
def fisher (γ : ℝ≥0) (μ : S → ℝ) (θ : S → A → ℝ) : Matrix (S × A) (S × A) ℝ :=
  Matrix.of fun i j ↦ ∑ s, ∑ a, M.visitation γ μ (softmax θ) s * softmax θ s a *
    fderiv ℝ (fun θ ↦ Real.log (softmax θ s a)) θ (Pi.single i.1 (Pi.single i.2 1)) *
    fderiv ℝ (fun θ ↦ Real.log (softmax θ s a)) θ (Pi.single j.1 (Pi.single j.2 1))

/-- 4.1: the natural policy gradient step `θ + η F_μ(θ)† ∇_θ V^{π_θ}(μ)`, with the
Moore–Penrose pseudoinverse of the positive semidefinite Fisher matrix. -/
def npgStep (γ : ℝ≥0) (μ : S → ℝ) (η : ℝ) (θ : S → A → ℝ) : S → A → ℝ :=
  θ + η • Function.curry ((M.fisher γ μ θ).covariancePseudoInverse *ᵥ M.softmaxGrad γ μ θ)

/-- 4.1: the multiplicative-weights step
`π' (a | s) = π (a | s) exp (η A^π (s, a) / (1 - γ)) / Z s`. -/
def mwStep (γ : ℝ≥0) (η : ℝ) (π : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ π s a * Real.exp (η * M.advantage γ π s a / (1 - γ)) /
    ∑ b, π s b * Real.exp (η * M.advantage γ π s b / (1 - γ))

/-- 4.1: the advantage divided by `1 - γ` solves the Fisher system `F_μ(θ) w = ∇_θ V^{π_θ}(μ)`. -/
theorem fisher_mulVec_advantage {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (θ : S → A → ℝ) :
    M.fisher γ μ θ *ᵥ (fun i ↦ M.advantage γ (softmax θ) i.1 i.2 / (1 - γ)) =
      M.softmaxGrad γ μ θ :=
  sorry

/-- 4.1: natural policy gradient is multiplicative weights: at every state visited with
positive weight, the softmax policy of the natural gradient step is the multiplicative-weights
step of `π_θ`. -/
theorem softmax_npgStep {γ : ℝ≥0} (hγ : γ < 1) {μ : S → ℝ} (hμ : 0 ≤ μ) (η : ℝ)
    (θ : S → A → ℝ) (s : S) (hs : 0 < M.visitation γ μ (softmax θ) s) :
    softmax (M.npgStep γ μ η θ) s = M.mwStep γ η (softmax θ) s :=
  sorry

/-- 4.2: the improvement lemma: the multiplicative-weights step improves the value at every
state by at least `(1 - γ) / η · log Z s ≥ 0`. -/
theorem mwStep_improvement {γ : ℝ≥0} (hγ : γ < 1) {η : ℝ} (hη : 0 < η) {π : S → A → ℝ}
    (hπ : IsPolicy π) (s : S) :
    0 ≤ Real.log (∑ b, π s b * Real.exp (η * M.advantage γ π s b / (1 - γ))) ∧
      (1 - γ) / η * Real.log (∑ b, π s b * Real.exp (η * M.advantage γ π s b / (1 - γ))) ≤
        M.policyValue γ (M.mwStep γ η π) s - M.policyValue γ π s :=
  sorry

/-- 4.3: the natural policy gradient iterates `θ₀ = 0`, `θ_{t+1} = θ_t + η F_ρ(θ_t)† ∇V(ρ)`. -/
def npgIterate (γ : ℝ≥0) (ρ : S → ℝ) (η : ℝ) : ℕ → S → A → ℝ
  | 0 => 0
  | t + 1 => M.npgStep γ ρ η (npgIterate γ ρ η t)

/-- 4.3: the convergence rate of natural policy gradient: for rewards in `[0, 1]`, a
probability vector `ρ`, `η > 0`, every policy `π'` and `T ≥ 1`,
`V^{π'}(ρ) - V^{π_T}(ρ) ≤ log |A| / (η T) + 1 / ((1 - γ)² T)`. -/
theorem npg_rate {γ : ℝ≥0} (hγ : γ < 1) (hr : ∀ s a, 0 ≤ M.reward s a ∧ M.reward s a ≤ 1)
    {ρ : S → ℝ} (hρ : 0 ≤ ρ) (hρ1 : ∑ s, ρ s = 1) {η : ℝ} (hη : 0 < η)
    {π' : S → A → ℝ} (hπ' : IsPolicy π') {T : ℕ} (hT : 1 ≤ T) :
    M.objective γ ρ π' - M.objective γ ρ (softmax (M.npgIterate γ ρ η T)) ≤
      Real.log (Fintype.card A) / (η * T) + 1 / ((1 - γ) ^ 2 * T) :=
  sorry

end MDP

end TauCetiRoadmap.PolicyGradientMethods

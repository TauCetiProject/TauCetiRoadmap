import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Moments.Covariance

/-!
# Reinforcement learning convergence: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks and proof routes are not restated.

A roadmap's Lean file never imports another roadmap, so the definitions it needs from other
roadmaps are copied verbatim, each in a section with its owner's `variable` line and with a
docstring naming the owner: `MDP`, `HistoryPolicy`, `MDP.transKernel`, `MDP.stationaryKernel` and
`MDP.trajLaw` (MarkovDecisionProcesses 1.1 and Conventions); `Reaches` and `IsIrreducible`
(MarkovChainsAndRenewal, Layer 3 signatures); `IsPositivelyStable` and `averagedIterate`
(StochasticApproximationAveraging 1.1 and 2.1); `LipschitzSmoothWith`, `gradientStep` and
`gradientDescent` (FirstOrderOptimization, Conventions and Layer 2); `softmax`, `detPolicy`,
`MDP.transMatrix`, `MDP.meanReward`, `MDP.policyValue`, `MDP.policyQ`, `MDP.visitation` and
`MDP.objective` (PolicyGradientMethods 1.1 and 3.1–3.2).

Vectors of features and parameters are functions `Fin k → ℝ`, acted on by `Matrix.mulVec`; the
Euclidean norm of a parameter vector is written through `dotProduct`. The limit law of 2.3 lives on
`EuclideanSpace ℝ (Fin k)`, reached through `WithLp.toLp 2`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset Matrix
open scoped NNReal ENNReal RealInnerProductSpace Gradient

namespace TauCetiRoadmap.ReinforcementLearningConvergence

/-! ## Layer 1: the projected Bellman equation -/

section ProjectedBellman

variable {S : Type*} [Fintype S] [DecidableEq S] {k : ℕ}

/-- 1.1: the weighted sum of squares `‖v‖²_D = Σ_s d s · v s ^ 2`. -/
def weightedSq (d v : S → ℝ) : ℝ := ∑ s, d s * v s ^ 2

/-- 1.1: the resolvent `N_λ = (1 - γ λ P)⁻¹` of TD(λ), the inverse being `Ring.inverse`. -/
def tdResolvent (P : Matrix S S ℝ) (γ : ℝ≥0) (lam : ℝ) : Matrix S S ℝ :=
  Ring.inverse (1 - ((γ : ℝ) * lam) • P)

/-- 1.1: the TD(λ) operator `T_λ v = N_λ r + γ (1 - λ) N_λ P v`. -/
def tdOperator (P : Matrix S S ℝ) (r : S → ℝ) (γ : ℝ≥0) (lam : ℝ) (v : S → ℝ) : S → ℝ :=
  tdResolvent P γ lam *ᵥ r + ((γ : ℝ) * (1 - lam)) • ((tdResolvent P γ lam * P) *ᵥ v)

/-- 1.1: the TD(λ) matrix `A_λ = Φᵀ D N_λ (1 - γ P) Φ`, with `D = diagonal d`. -/
def tdMatrix (d : S → ℝ) (P : Matrix S S ℝ) (Φ : Matrix S (Fin k) ℝ) (γ : ℝ≥0) (lam : ℝ) :
    Matrix (Fin k) (Fin k) ℝ :=
  Φᵀ * diagonal d * tdResolvent P γ lam * (1 - (γ : ℝ) • P) * Φ

/-- 1.1: the TD(λ) vector `b_λ = Φᵀ D N_λ r`. -/
def tdVector (d : S → ℝ) (P : Matrix S S ℝ) (r : S → ℝ) (Φ : Matrix S (Fin k) ℝ) (γ : ℝ≥0)
    (lam : ℝ) : Fin k → ℝ :=
  (Φᵀ * diagonal d * tdResolvent P γ lam) *ᵥ r

/-- 1.1: for a stochastic matrix `P`, a nonnegative stationary weight `d`, `γ < 1` and
`0 ≤ λ ≤ 1`, the TD(λ) operator is a contraction of `‖·‖_D` with modulus
`κ_λ = γ (1 - λ) / (1 - γ λ)`, and the value `V = (1 - γ P)⁻¹ r` is its fixed point. -/
theorem weightedSq_tdOperator_sub_le {P : Matrix S S ℝ} (hP : ∀ s s', 0 ≤ P s s')
    (hP1 : ∀ s, ∑ s', P s s' = 1) {d : S → ℝ} (hd : ∀ s, 0 ≤ d s) (hdP : d ᵥ* P = d)
    (r : S → ℝ) {γ : ℝ≥0} (hγ : γ < 1) {lam : ℝ} (hlam0 : 0 ≤ lam) (hlam1 : lam ≤ 1) :
    (∀ v w : S → ℝ, weightedSq d (tdOperator P r γ lam v - tdOperator P r γ lam w) ≤
        ((γ : ℝ) * (1 - lam) / (1 - γ * lam)) ^ 2 * weightedSq d (v - w)) ∧
      tdOperator P r γ lam (Ring.inverse (1 - (γ : ℝ) • P) *ᵥ r) =
        Ring.inverse (1 - (γ : ℝ) • P) *ᵥ r :=
  sorry

/-- 1.1: the projected Bellman equation `A_λ θ = b_λ` has a solution for every feature matrix,
all its solutions have the same value vector `Φ θ`, and that vector is within the factor
`(1 - κ_λ²)^(-1/2)` of the best approximation of `V` in the column space of `Φ`, in `‖·‖_D`. -/
theorem projectedBellman {P : Matrix S S ℝ} (hP : ∀ s s', 0 ≤ P s s')
    (hP1 : ∀ s, ∑ s', P s s' = 1) {d : S → ℝ} (hd : ∀ s, 0 < d s) (hdP : d ᵥ* P = d)
    (r : S → ℝ) {γ : ℝ≥0} (hγ : γ < 1) {lam : ℝ} (hlam0 : 0 ≤ lam) (hlam1 : lam ≤ 1)
    (Φ : Matrix S (Fin k) ℝ) :
    (∃ θ, tdMatrix d P Φ γ lam *ᵥ θ = tdVector d P r Φ γ lam) ∧
      (∀ θ θ', tdMatrix d P Φ γ lam *ᵥ θ = tdVector d P r Φ γ lam →
        tdMatrix d P Φ γ lam *ᵥ θ' = tdVector d P r Φ γ lam → Φ *ᵥ θ = Φ *ᵥ θ') ∧
      ∀ θ, tdMatrix d P Φ γ lam *ᵥ θ = tdVector d P r Φ γ lam → ∀ θ' : Fin k → ℝ,
        (1 - ((γ : ℝ) * (1 - lam) / (1 - γ * lam)) ^ 2) *
            weightedSq d (Φ *ᵥ θ - Ring.inverse (1 - (γ : ℝ) • P) *ᵥ r) ≤
          weightedSq d (Φ *ᵥ θ' - Ring.inverse (1 - (γ : ℝ) • P) *ᵥ r) :=
  sorry

end ProjectedBellman

section StochasticApproximationAveraging

variable {d : ℕ}

/-- 1.1 A real square matrix is positively stable when every complex eigenvalue has positive real
part. (Copied verbatim from StochasticApproximationAveraging 1.1.) -/
def IsPositivelyStable (A : Matrix (Fin d) (Fin d) ℝ) : Prop :=
  ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), 0 < μ.re

/-- 2.1 The averaged iterate `t⁻¹ • ∑_{i < t} x (i + 1)` (the start `x 0` is not averaged; the
value at `t = 0` is `0`). (Copied verbatim from StochasticApproximationAveraging 2.1.) -/
def averagedIterate {Ω E : Type*} [AddCommGroup E] [Module ℝ E] (x : ℕ → Ω → E) (t : ℕ)
    (ω : Ω) : E :=
  (t : ℝ)⁻¹ • ∑ i ∈ range t, x (i + 1) ω

end StochasticApproximationAveraging

section TDMatrix

variable {S : Type*} [Fintype S] [DecidableEq S] {k : ℕ}

/-- 1.2: positivity of the TD(λ) matrix. Under the hypotheses of 1.1 with `d ≥ 0`,
`xᵀ A_λ x ≥ (1 - κ_λ) ‖Φ x‖²_D` for every `x`; if moreover `d > 0` and `Φ` has full column rank,
`A_λ` is positively stable. -/
theorem tdMatrix_quadratic_ge {P : Matrix S S ℝ} (hP : ∀ s s', 0 ≤ P s s')
    (hP1 : ∀ s, ∑ s', P s s' = 1) {d : S → ℝ} (hd : ∀ s, 0 ≤ d s) (hdP : d ᵥ* P = d)
    {γ : ℝ≥0} (hγ : γ < 1) {lam : ℝ} (hlam0 : 0 ≤ lam) (hlam1 : lam ≤ 1)
    (Φ : Matrix S (Fin k) ℝ) :
    (∀ x : Fin k → ℝ, (1 - (γ : ℝ) * (1 - lam) / (1 - γ * lam)) * weightedSq d (Φ *ᵥ x) ≤
        x ⬝ᵥ (tdMatrix d P Φ γ lam *ᵥ x)) ∧
      ((∀ s, 0 < d s) → Function.Injective Φ.mulVec →
        IsPositivelyStable (tdMatrix d P Φ γ lam)) :=
  sorry

end TDMatrix

/-! ## Layer 2: linear TD(0) with independent on-policy samples -/

section LinearTD

variable {S Ω : Type*} [Fintype S] [DecidableEq S] [MeasurableSpace S]
  [MeasurableSingletonClass S] [MeasurableSpace Ω] {k : ℕ}

/-- 2: independent, identically distributed transition samples `(st t, sn t, rew t)` of the chain
`P` with state weights `d` and mean reward `r`: the pair `(st t, sn t)` has law
`d s · P s s'`, the reward has mean `r s` on `{st t = s}` and is square-integrable. -/
structure IsIIDTransitionSample (μ : Measure Ω) (d : S → ℝ) (P : Matrix S S ℝ) (r : S → ℝ)
    (st sn : ℕ → Ω → S) (rew : ℕ → Ω → ℝ) : Prop where
  measurable : ∀ t, Measurable fun ω ↦ (st t ω, sn t ω, rew t ω)
  iIndepFun : iIndepFun (fun t ω ↦ (st t ω, sn t ω, rew t ω)) μ
  identDistrib : ∀ t, IdentDistrib (fun ω ↦ (st t ω, sn t ω, rew t ω))
    (fun ω ↦ (st 0 ω, sn 0 ω, rew 0 ω)) μ μ
  law : ∀ s s', μ.real {ω | st 0 ω = s ∧ sn 0 ω = s'} = d s * P s s'
  setIntegral_reward : ∀ s, ∫ ω in {ω | st 0 ω = s}, rew 0 ω ∂μ = d s * r s
  memLp_reward : MemLp (rew 0) 2 μ

/-- 2: linear TD(0) with step sizes `α`, from `θ₀`:
`θ (t + 1) = θ t + α t (rew t + γ φ(sn t)ᵀ θ t - φ(st t)ᵀ θ t) φ(st t)`, with `φ s = Φ s`. -/
def linearTD0 (Φ : Matrix S (Fin k) ℝ) (γ : ℝ≥0) (α : ℕ → ℝ) (θ₀ : Fin k → ℝ)
    (st sn : ℕ → Ω → S) (rew : ℕ → Ω → ℝ) : ℕ → Ω → Fin k → ℝ
  | 0, _ => θ₀
  | t + 1, ω => linearTD0 Φ γ α θ₀ st sn rew t ω +
      (α t * (rew t ω + γ * (Φ (sn t ω) ⬝ᵥ linearTD0 Φ γ α θ₀ st sn rew t ω) -
        Φ (st t ω) ⬝ᵥ linearTD0 Φ γ α θ₀ st sn rew t ω)) • Φ (st t ω)

variable {μ : Measure Ω} [IsProbabilityMeasure μ]

/-- 2.1: almost-sure convergence of linear TD(0) with independent on-policy samples, full
column rank features and steps with `Σ α t = ∞`, `Σ α t ² < ∞`. -/
theorem linearTD0_ae_tendsto {P : Matrix S S ℝ} (hP1 : ∀ s, ∑ s', P s s' = 1) {d : S → ℝ}
    (hd : ∀ s, 0 < d s) (hdP : d ᵥ* P = d) {r : S → ℝ} {st sn : ℕ → Ω → S}
    {rew : ℕ → Ω → ℝ} (hsample : IsIIDTransitionSample μ d P r st sn rew) {γ : ℝ≥0}
    (hγ : γ < 1) {Φ : Matrix S (Fin k) ℝ} (hΦ : Function.Injective Φ.mulVec)
    {θstar : Fin k → ℝ} (hθ : tdMatrix d P Φ γ 0 *ᵥ θstar = tdVector d P r Φ γ 0)
    {α : ℕ → ℝ} (hα0 : ∀ t, 0 ≤ α t) (hdiv : ¬ Summable α)
    (hsq : Summable fun t ↦ α t ^ 2) (θ₀ : Fin k → ℝ) :
    ∀ᵐ ω ∂μ, Tendsto (fun t ↦ linearTD0 Φ γ α θ₀ st sn rew t ω) atTop (𝓝 θstar) :=
  sorry

/-- 2.2: the finite-time bound for the averaged iterate: for features with `‖φ s‖ ≤ 1`,
`T ≥ 64 / (1 - γ)²` and the constant step `1 / √T`,
`E ‖Φ (θ̄_T - θ⋆)‖²_D ≤ (‖θ₀ - θ⋆‖² + 2 σ²) / (√T (1 - γ))`, where `θ̄_T` averages
`θ 0, …, θ (T - 1)`
and `σ² = E ‖(rew + γ φ(sn)ᵀ θ⋆ - φ(st)ᵀ θ⋆) φ(st)‖²`. -/
theorem linearTD0_average_weightedSq_le {P : Matrix S S ℝ} (hP1 : ∀ s, ∑ s', P s s' = 1)
    {d : S → ℝ} (hdP : d ᵥ* P = d) {r : S → ℝ} {st sn : ℕ → Ω → S} {rew : ℕ → Ω → ℝ}
    (hsample : IsIIDTransitionSample μ d P r st sn rew) {γ : ℝ≥0} (hγ : γ < 1)
    {Φ : Matrix S (Fin k) ℝ} (hΦ1 : ∀ s, Φ s ⬝ᵥ Φ s ≤ 1) {θstar : Fin k → ℝ}
    (hθ : tdMatrix d P Φ γ 0 *ᵥ θstar = tdVector d P r Φ γ 0) (θ₀ : Fin k → ℝ) {T : ℕ}
    (hT : 64 / (1 - (γ : ℝ)) ^ 2 ≤ T) :
    ∫ ω, weightedSq d (Φ *ᵥ ((T : ℝ)⁻¹ • ∑ t ∈ range T,
        linearTD0 Φ γ (fun _ ↦ 1 / Real.sqrt T) θ₀ st sn rew t ω) - Φ *ᵥ θstar) ∂μ ≤
      ((θ₀ - θstar) ⬝ᵥ (θ₀ - θstar) + 2 * ∫ ω, (rew 0 ω + γ * (Φ (sn 0 ω) ⬝ᵥ θstar) -
          Φ (st 0 ω) ⬝ᵥ θstar) ^ 2 * (Φ (st 0 ω) ⬝ᵥ Φ (st 0 ω)) ∂μ) /
        (Real.sqrt T * (1 - γ)) :=
  sorry

/-- 2.2: mean-square convergence of linear TD(0) with full column rank features and steps
`α t ≥ 0` with `α t → 0` and `Σ α t = ∞`. -/
theorem linearTD0_integral_sq_tendsto {P : Matrix S S ℝ} (hP1 : ∀ s, ∑ s', P s s' = 1)
    {d : S → ℝ} (hd : ∀ s, 0 < d s) (hdP : d ᵥ* P = d) {r : S → ℝ} {st sn : ℕ → Ω → S}
    {rew : ℕ → Ω → ℝ} (hsample : IsIIDTransitionSample μ d P r st sn rew) {γ : ℝ≥0}
    (hγ : γ < 1) {Φ : Matrix S (Fin k) ℝ} (hΦ : Function.Injective Φ.mulVec)
    {θstar : Fin k → ℝ} (hθ : tdMatrix d P Φ γ 0 *ᵥ θstar = tdVector d P r Φ γ 0)
    {α : ℕ → ℝ} (hα0 : ∀ t, 0 ≤ α t) (hα : Tendsto α atTop (𝓝 0)) (hdiv : ¬ Summable α)
    (θ₀ : Fin k → ℝ) :
    Tendsto (fun t ↦ ∫ ω, (linearTD0 Φ γ α θ₀ st sn rew t ω - θstar) ⬝ᵥ
      (linearTD0 Φ γ α θ₀ st sn rew t ω - θstar) ∂μ) atTop (𝓝 0) :=
  sorry

/-- 2.3: the Polyak–Ruppert central limit theorem for linear TD(0): with steps in the decreasing
admissible regime, `√t (θ̄_t - θ⋆)` converges in law to `N(0, A₀⁻¹ Σ⋆ A₀⁻ᵀ)`, where `A₀` is the
TD(0) matrix and `Σ⋆` the covariance matrix of the update at `θ⋆`. -/
theorem linearTD0_averagedIterate_tendstoInDistribution {P : Matrix S S ℝ}
    (hP1 : ∀ s, ∑ s', P s s' = 1) {d : S → ℝ} (hd : ∀ s, 0 < d s) (hdP : d ᵥ* P = d)
    {r : S → ℝ} {st sn : ℕ → Ω → S} {rew : ℕ → Ω → ℝ}
    (hsample : IsIIDTransitionSample μ d P r st sn rew) {γ : ℝ≥0} (hγ : γ < 1)
    {Φ : Matrix S (Fin k) ℝ} (hΦ : Function.Injective Φ.mulVec) {θstar : Fin k → ℝ}
    (hθ : tdMatrix d P Φ γ 0 *ᵥ θstar = tdVector d P r Φ γ 0) {α : ℕ → ℝ}
    (hαpos : ∀ t, 0 < α t) (hα : Tendsto α atTop (𝓝 0))
    (hαo : (fun t ↦ (α t - α (t + 1)) / α t) =o[atTop] α) (θ₀ : Fin k → ℝ)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → EuclideanSpace ℝ (Fin k)}
    (hZ : HasLaw Z (multivariateGaussian 0 ((tdMatrix d P Φ γ 0)⁻¹ *
      TauCeti.covMatrix (μ.map fun ω ↦ WithLp.toLp 2 ((rew 0 ω + γ * (Φ (sn 0 ω) ⬝ᵥ θstar) -
        Φ (st 0 ω) ⬝ᵥ θstar) • Φ (st 0 ω))) * ((tdMatrix d P Φ γ 0)⁻¹)ᵀ)) μ') :
    TendstoInDistribution (fun (t : ℕ) ω ↦ WithLp.toLp 2 (Real.sqrt t •
      (averagedIterate (linearTD0 Φ γ α θ₀ st sn rew) t ω - θstar))) atTop Z (fun _ ↦ μ) μ' :=
  sorry

end LinearTD

/-! ## Layer 3: exploration -/

/-- A Markov decision process with transition law `trans s a` and mean reward `reward s a`
bounded in absolute value by `rewardBound`. (Copied verbatim from MarkovDecisionProcesses,
Conventions and 1.1.) -/
structure MDP (S A : Type*) where
  trans : S → A → PMF S
  reward : S → A → ℝ
  rewardBound : ℝ
  abs_reward_le : ∀ s a, |reward s a| ≤ rewardBound

/-- A history-dependent randomized policy: a Markov kernel `first` for the action at time `0`
and, for each `n`, a Markov kernel `next n` choosing the action at time `n + 1` from the history
up to time `n` and the state at time `n + 1`. (Copied verbatim from MarkovDecisionProcesses
1.1.) -/
structure HistoryPolicy (S A : Type*) [MeasurableSpace S] [MeasurableSpace A] where
  first : Kernel S A
  next : (n : ℕ) → Kernel ((Π _ : Iic n, S × A) × S) A
  isMarkovKernel_first : IsMarkovKernel first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

section MarkovDecisionProcesses

variable {S A : Type*} [Countable S] [Nonempty S] [MeasurableSpace S] [MeasurableSingletonClass S]
  [Fintype A] [Nonempty A]

namespace MDP

variable (M : MDP S A)

/-- 1.1: the transition kernel `(s, a) ↦ trans s a`. (Copied verbatim from
MarkovDecisionProcesses 1.1.) -/
abbrev transKernel [MeasurableSpace A] [MeasurableSingletonClass A] : Kernel (S × A) S :=
  Kernel.ofPMF fun sa ↦ M.trans sa.1 sa.2

/-- 1.1: the state kernel `s ↦ Σ a, π s a • trans s a` of a randomized stationary policy.
(Copied verbatim from MarkovDecisionProcesses 1.1.) -/
abbrev stationaryKernel (π : S → PMF A) : Kernel S S :=
  Kernel.ofPMF fun s ↦ (π s).bind (M.trans s)

section Trajectories

variable [MeasurableSpace A] [MeasurableSingletonClass A]

/-- 1.1: the trajectory law of a history-dependent policy from the state `s`, by the
Ionescu-Tulcea construction `Kernel.trajMeasure`. (Copied verbatim from
MarkovDecisionProcesses 1.1.) -/
def trajLaw (π : HistoryPolicy S A) (s : S) : Measure (ℕ → S × A) :=
  haveI := π.isMarkovKernel_first
  haveI := π.isMarkovKernel_next
  Kernel.trajMeasure (X := fun _ ↦ S × A) (Measure.dirac s ⊗ₘ π.first)
    (fun n ↦ (M.transKernel.comap (fun h ↦ h ⟨n, mem_Iic.2 le_rfl⟩)
      (measurable_pi_apply _)) ⊗ₖ π.next n)

end Trajectories

end MDP

end MarkovDecisionProcesses

section MarkovChainsAndRenewal

variable {S : Type*} [MeasurableSpace S] [Countable S]
  [MeasurableSingletonClass S] [Nonempty S]
  (κ : Kernel S S) [IsMarkovKernel κ]

/-- Reachability includes the length-zero path. (Copied verbatim from MarkovChainsAndRenewal,
Layer 3 signatures.) -/
def Reaches (x y : S) : Prop := ∃ n : ℕ, 0 < (κ ^ n) x {y}

/-- Countable-state irreducibility. (Copied verbatim from MarkovChainsAndRenewal, Layer 3
signatures.) -/
def IsIrreducible : Prop := ∀ x y : S, Reaches κ x y

end MarkovChainsAndRenewal

section Exploration

variable {S A : Type*} [Countable S] [Nonempty S] [MeasurableSpace S] [MeasurableSingletonClass S]
  [Fintype A] [Nonempty A]

/-- 3.1: exploration visits every state-action pair infinitely often. If the MDP is
communicating, in the sense that the state chain of some randomized stationary policy `π₀` is
irreducible, and the policy
gives every action, at time `n + 1` in state `s`, conditional probability at least
`c / (1 + number of visits to s up to time n)`, then almost surely every pair occurs infinitely
often along the trajectory. -/
theorem ae_frequently_eq_of_explore [Fintype S] [DecidableEq S] [MeasurableSpace A]
    [MeasurableSingletonClass A] (M : MDP S A)
    (π₀ : S → PMF A) (hM : IsIrreducible (M.stationaryKernel π₀))
    (π : HistoryPolicy S A) {c : ℝ} (hc : 0 < c)
    (hπ : ∀ (n : ℕ) (h : Π _ : Iic n, S × A) (s : S) (a : A),
      c / (1 + ((univ : Finset (Iic n)).filter fun i ↦ (h i).1 = s).card) ≤
        (π.next n (h, s) {a}).toReal)
    (s₀ : S) :
    ∀ᵐ ω ∂(M.trajLaw π s₀), ∀ sa : S × A, ∃ᶠ t in atTop, ω t = sa :=
  sorry

end Exploration

/-! ## Layer 4: the softmax policy gradient -/

section FirstOrderOptimization

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- `f` is `K`-smooth: differentiable, with first-order Taylor remainder at most
`K / 2 * dist x y ^ 2` (Mathlib PR #39574). (Copied verbatim from FirstOrderOptimization,
Conventions.) -/
structure LipschitzSmoothWith (𝕜 : Type*) [NontriviallyNormedField 𝕜] {F G : Type*}
    [NormedAddCommGroup F] [NormedSpace 𝕜 F] [NormedAddCommGroup G] [NormedSpace 𝕜 G]
    (K : ℝ≥0) (f : F → G) : Prop where
  differentiable : Differentiable 𝕜 f
  fderiv_norm_le : ∀ x y, ‖f y - f x - fderiv 𝕜 f x (y - x)‖ ≤ K / 2 * dist x y ^ 2

/-- One step of gradient descent with step size `η`. (Copied verbatim from
FirstOrderOptimization, Layer 2.) -/
def gradientStep (f : E → ℝ) (η : ℝ) (x : E) : E := x - η • ∇ f x

/-- The `k`-th iterate of gradient descent from `x₀`. (Copied verbatim from
FirstOrderOptimization, Layer 2.) -/
def gradientDescent (f : E → ℝ) (η : ℝ) (x₀ : E) (k : ℕ) : E := (gradientStep f η)^[k] x₀

end FirstOrderOptimization

/-- 3.1: the tabular softmax parametrization `π_θ (a | s) = exp (θ s a) / Σ_b exp (θ s b)`.
(Copied verbatim from PolicyGradientMethods 3.1.) -/
def softmax {S A : Type*} [Fintype A] (θ : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ Real.exp (θ s a) / ∑ b, Real.exp (θ s b)

/-- 3.2: the weight table of a deterministic policy `d : S → A`. (Copied verbatim from
PolicyGradientMethods 3.2.) -/
def detPolicy {S A : Type*} [DecidableEq A] (d : S → A) : S → A → ℝ :=
  fun s a ↦ if a = d s then 1 else 0

section PolicyGradientMethods

variable {S A : Type*} [Fintype S] [DecidableEq S] [Fintype A] [DecidableEq A]

namespace MDP

variable (M : MDP S A)

/-- 1.1: the state transition matrix `P^π s s' = Σ_a π s a · trans s a s'` of a weight table.
(Copied verbatim from PolicyGradientMethods 1.1.) -/
def transMatrix (π : S → A → ℝ) : Matrix S S ℝ :=
  Matrix.of fun s s' ↦ ∑ a, π s a * (M.trans s a s').toReal

/-- 1.1: the mean reward `r^π s = Σ_a π s a · reward s a` of a weight table. (Copied verbatim
from PolicyGradientMethods 1.1.) -/
def meanReward (π : S → A → ℝ) : S → ℝ :=
  fun s ↦ ∑ a, π s a * M.reward s a

/-- 1.1: the value `V^π = (1 - γ P^π)⁻¹ r^π` of a weight table. (Copied verbatim from
PolicyGradientMethods 1.1.) -/
def policyValue (γ : ℝ≥0) (π : S → A → ℝ) : S → ℝ :=
  Ring.inverse (1 - (γ : ℝ) • M.transMatrix π) *ᵥ M.meanReward π

/-- 1.1: the Q-function `Q^π (s, a) = reward s a + γ Σ_{s'} trans s a s' · V^π s'`. (Copied
verbatim from PolicyGradientMethods 1.1.) -/
def policyQ (γ : ℝ≥0) (π : S → A → ℝ) : S → A → ℝ :=
  fun s a ↦ M.reward s a + γ * ∑ s', (M.trans s a s').toReal * M.policyValue γ π s'

/-- 1.1: the discounted state-visitation vector `d^π_μ = (1 - γ) μ (1 - γ P^π)⁻¹`. (Copied
verbatim from PolicyGradientMethods 1.1.) -/
def visitation (γ : ℝ≥0) (μ : S → ℝ) (π : S → A → ℝ) : S → ℝ :=
  (1 - (γ : ℝ)) • (μ ᵥ* Ring.inverse (1 - (γ : ℝ) • M.transMatrix π))

/-- 1.1: the objective `V^π(μ) = Σ_s μ s · V^π s`. (Copied verbatim from PolicyGradientMethods
1.1.) -/
def objective (γ : ℝ≥0) (μ : S → ℝ) (π : S → A → ℝ) : ℝ :=
  μ ⬝ᵥ M.policyValue γ π

/-- 4.1: for rewards in `[0, 1]`, `γ < 1` and a probability vector `μ`, the softmax objective
`θ ↦ V^{π_θ}(μ)`, read on `EuclideanSpace ℝ (S × A)`, is `8 / (1 - γ)³`-smooth. -/
theorem lipschitzSmoothWith_objective_softmax {γ : ℝ≥0} (hγ : γ < 1)
    (hr : ∀ s a, 0 ≤ M.reward s a ∧ M.reward s a ≤ 1) {μ : S → ℝ} (hμ : 0 ≤ μ)
    (hμ1 : ∑ s, μ s = 1) :
    LipschitzSmoothWith ℝ (8 / (1 - γ) ^ 3)
      (fun θ : EuclideanSpace ℝ (S × A) ↦ M.objective γ μ (softmax fun s a ↦ θ (s, a))) :=
  sorry

/-- 4.2: the `O(1/t)` rate of softmax policy gradient ascent with step `(1 - γ)³ / 8`. For
rewards in `[0, 1]`, `μ > 0` and `ρ ≥ 0` probability vectors, a deterministic policy `d` greedy
for its own Q-function and `t ≥ 1`, the gap `V^d(ρ) - V^{π_{θ_t}}(ρ)` is at most
`16 |S| ‖d^d_μ / μ‖²_∞ ‖1 / μ‖_∞ / (c_t² (1 - γ)⁶ t)`, where `c_t` is the least probability of
the action `d s` in state `s` over the iterates `θ_0, …, θ_{t-1}`. -/
theorem objective_sub_le_softmaxAscent [Nonempty S] {γ : ℝ≥0} (hγ : γ < 1)
    (hr : ∀ s a, 0 ≤ M.reward s a ∧ M.reward s a ≤ 1) {μ ρ : S → ℝ} (hμ : ∀ s, 0 < μ s)
    (hμ1 : ∑ s, μ s = 1) (hρ : 0 ≤ ρ) (hρ1 : ∑ s, ρ s = 1) (d : S → A)
    (hd : ∀ s a, M.policyQ γ (detPolicy d) s a ≤ M.policyValue γ (detPolicy d) s)
    (θ₀ : EuclideanSpace ℝ (S × A)) {t : ℕ} (ht : 1 ≤ t) :
    M.objective γ ρ (detPolicy d) - M.objective γ ρ (softmax fun s a ↦
        gradientDescent (fun θ : EuclideanSpace ℝ (S × A) ↦
          -M.objective γ μ (softmax fun s a ↦ θ (s, a))) ((1 - (γ : ℝ)) ^ 3 / 8) θ₀ t (s, a)) ≤
      16 * Fintype.card S *
          (univ.sup' univ_nonempty fun s ↦ M.visitation γ μ (detPolicy d) s / μ s) ^ 2 *
          (univ.sup' univ_nonempty fun s ↦ 1 / μ s) /
        (((range t).inf' (nonempty_range_iff.2 (by omega)) fun i ↦
            univ.inf' univ_nonempty fun s ↦ softmax (fun s a ↦
              gradientDescent (fun θ : EuclideanSpace ℝ (S × A) ↦
                -M.objective γ μ (softmax fun s a ↦ θ (s, a))) ((1 - (γ : ℝ)) ^ 3 / 8) θ₀ i
                  (s, a)) s (d s)) ^ 2 * (1 - (γ : ℝ)) ^ 6 * t) :=
  sorry

end MDP

end PolicyGradientMethods

end TauCetiRoadmap.ReinforcementLearningConvergence

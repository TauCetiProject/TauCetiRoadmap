import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Markov decision processes, dynamic programming and Q-learning: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: Mathlib `ContractingWith.fixedPoint_unique'`,
`ContractingWith.tendsto_iterate_fixedPoint`, `ContractingWith.dist_fixedPoint_le`,
`ContractingWith.apriori_dist_iterate_fixedPoint_le`, `pi_norm_le_iff_of_nonneg`,
`Matrix.linftyOpNormedRing` (a `def`, used as a local instance), `NormedRing.inverse_one_sub`,
`PMF.bind`, `Kernel.compProd`, `Kernel.traj`, `Kernel.trajMeasure`,
`Kernel.integral_traj_partialTraj`, `Kernel.condDistrib_trajMeasure`, `StronglyAdapted`,
`Submartingale.exists_ae_tendsto_of_bdd`, `MeasureTheory.IsStoppingTime`,
`MeasureTheory.stoppedProcess` and `MeasureTheory.hittingAfter`; Tau Ceti `Kernel.ofPMF` (used
below for every kernel built from a family of `PMF`s), `Kernel.toMatrix`, `Kernel.toMatrix_pow`,
`Kernel.comp_apply_singleton_eq_vecMul`, `TauCeti.Probability.markovChainLaw`,
`MeasureTheory.Measure.eq_markovChainLaw`, `MeasureTheory.Measure.markovChainLaw_map_eval` and
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset Matrix
open scoped NNReal ENNReal

namespace TauCetiRoadmap.MarkovDecisionProcesses

/-- A finite Markov decision process with transition law `trans s a` and mean reward
`reward s a`. -/
structure FiniteMDP (S A : Type*) where
  trans : S → A → PMF S
  reward : S → A → ℝ

/-- A history-dependent randomized policy: a Markov kernel `first` for the action at time `0`
and, for each `n`, a Markov kernel `next n` choosing the action at time `n + 1` from the history
up to time `n` and the state at time `n + 1`. -/
structure HistoryPolicy (S A : Type*) [MeasurableSpace S] [MeasurableSpace A] where
  first : Kernel S A
  next : (n : ℕ) → Kernel ((Π _ : Iic n, S × A) × S) A
  isMarkovKernel_first : IsMarkovKernel first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

variable {S A : Type*} [Fintype S] [Nonempty S] [Fintype A] [Nonempty A]

namespace FiniteMDP

variable (M : FiniteMDP S A)

/-! ## Layer 1: MDPs, policies and Bellman operators -/

section Trajectories

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [MeasurableSpace A]
  [DiscreteMeasurableSpace A]

/-- 1.1: the transition kernel `(s, a) ↦ trans s a`. -/
abbrev transKernel : Kernel (S × A) S :=
  Kernel.ofPMF fun sa ↦ M.trans sa.1 sa.2

/-- 1.1: the history-dependent policy of a Markov policy. -/
def ofMarkov (π : ℕ → S → PMF A) : HistoryPolicy S A where
  first := Kernel.ofPMF (π 0)
  next n := Kernel.ofPMF fun hs ↦ π (n + 1) hs.2
  isMarkovKernel_first := inferInstance
  isMarkovKernel_next _ := inferInstance

/-- 1.1: the history-dependent policy of a randomized stationary policy. -/
def ofStationary (π : S → PMF A) : HistoryPolicy S A := ofMarkov fun _ ↦ π

/-- 1.1: the trajectory law of a history-dependent policy from the state `s`, by the
Ionescu-Tulcea construction `Kernel.trajMeasure`. -/
def trajLaw (π : HistoryPolicy S A) (s : S) : Measure (ℕ → S × A) :=
  haveI := π.isMarkovKernel_first
  haveI := π.isMarkovKernel_next
  Kernel.trajMeasure (X := fun _ ↦ S × A) (Measure.dirac s ⊗ₘ π.first)
    (fun n ↦ (M.transKernel.comap (fun h ↦ h ⟨n, mem_Iic.2 le_rfl⟩)
      (measurable_pi_apply _)) ⊗ₖ π.next n)

/-- 1.1: the expected discounted return. -/
def expectedReturn (γ : ℝ≥0) (π : HistoryPolicy S A) (s : S) : ℝ :=
  ∫ ω, ∑' n, (γ : ℝ) ^ n * M.reward (ω n).1 (ω n).2 ∂(M.trajLaw π s)

/-- 1.1: the `N`-step return with terminal value `g`. -/
def finiteReturn (γ : ℝ≥0) (N : ℕ) (g : S → ℝ) (π : HistoryPolicy S A) (s : S) : ℝ :=
  ∫ ω, (∑ n ∈ range N, (γ : ℝ) ^ n * M.reward (ω n).1 (ω n).2 + (γ : ℝ) ^ N * g (ω N).1)
    ∂(M.trajLaw π s)

/-- 1.1: the state kernel `s ↦ Σ a, π s a • trans s a` of a randomized stationary policy. -/
abbrev stationaryKernel (π : S → PMF A) : Kernel S S :=
  Kernel.ofPMF fun s ↦ (π s).bind (M.trans s)

/-- 1.1: under a stationary policy the state process is the Markov chain of `stationaryKernel`. -/
theorem trajLaw_ofStationary (π : S → PMF A) (s : S) :
    (M.trajLaw (ofStationary π) s).map (fun ω n ↦ (ω n).1) =
      TauCeti.Probability.markovChainLaw (Measure.dirac s) (M.stationaryKernel π) :=
  sorry

/-- 1.1: the tail bound for the discounted return. -/
theorem abs_expectedReturn_sub_finiteReturn_le {γ : ℝ≥0} (hγ : γ < 1) (π : HistoryPolicy S A)
    (s : S) {R : ℝ} (hR : ∀ s a, |M.reward s a| ≤ R) (N : ℕ) :
    |M.expectedReturn γ π s - M.finiteReturn γ N 0 π s| ≤ (γ : ℝ) ^ N * R / (1 - γ) :=
  sorry

end Trajectories

/-- 1.2: the expected next value `Σ s', trans s a s' * v s'`. -/
def expect (v : S → ℝ) (s : S) (a : A) : ℝ := ∑ s', (M.trans s a s').toReal * v s'

/-- 1.2: the Bellman evaluation operator of a randomized stationary policy. -/
def bellmanEval (γ : ℝ≥0) (π : S → PMF A) (v : S → ℝ) : S → ℝ :=
  fun s ↦ ∑ a, (π s a).toReal * (M.reward s a + γ * M.expect v s a)

/-- 1.2: the Bellman optimality operator. -/
def bellman (γ : ℝ≥0) (v : S → ℝ) : S → ℝ :=
  fun s ↦ univ.sup' univ_nonempty fun a ↦ M.reward s a + γ * M.expect v s a

/-- 1.2: the value of a randomized stationary policy, the limit of the iterates of its
evaluation operator from `0`. -/
def value (γ : ℝ≥0) (π : S → PMF A) : S → ℝ :=
  limUnder atTop fun k ↦ (M.bellmanEval γ π)^[k] 0

/-- 1.2: the optimal value, the limit of the iterates of the Bellman optimality operator
from `0`. -/
def optimalValue (γ : ℝ≥0) : S → ℝ :=
  limUnder atTop fun k ↦ (M.bellman γ)^[k] 0

/-- 1.2: the randomized policy of a deterministic one. -/
def ofDet (π : S → A) : S → PMF A := fun s ↦ PMF.pure (π s)

/-- 1.2: `π` is greedy for `v`. -/
def IsGreedy (γ : ℝ≥0) (v : S → ℝ) (π : S → A) : Prop :=
  ∀ s a, M.reward s a + γ * M.expect v s a ≤ M.reward s (π s) + γ * M.expect v s (π s)

/-- 1.2: the row-stochastic matrix of a randomized stationary policy. -/
def policyMatrix (π : S → PMF A) : Matrix S S ℝ :=
  Matrix.of fun s s' ↦ ∑ a, (π s a).toReal * (M.trans s a s').toReal

/-- 1.2: the Bellman optimality operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_bellman {γ : ℝ≥0} (hγ : γ < 1) :
    ContractingWith γ (M.bellman γ) :=
  sorry

/-- 1.2: the Bellman evaluation operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_bellmanEval {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    ContractingWith γ (M.bellmanEval γ π) :=
  sorry

/-- 1.2: the policy evaluation equation. -/
theorem bellmanEval_value {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    M.bellmanEval γ π (M.value γ π) = M.value γ π :=
  sorry

/-- 1.2: the Bellman optimality equation. -/
theorem bellman_optimalValue {γ : ℝ≥0} (hγ : γ < 1) :
    M.bellman γ (M.optimalValue γ) = M.optimalValue γ :=
  sorry

/-- 1.2: values are bounded by `R / (1 - γ)`. -/
theorem norm_value_le {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) {R : ℝ}
    (hR : ∀ s a, |M.reward s a| ≤ R) :
    ‖M.value γ π‖ ≤ R / (1 - γ) :=
  sorry

/-- 1.2: the value is `(1 - γ P^π)⁻¹ r^π`, the inverse being a Neumann series in the normed
ring `Matrix.linftyOpNormedRing`. -/
theorem value_eq_inverse [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    M.value γ π = Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π) *ᵥ
      fun s ↦ ∑ a, (π s a).toReal * M.reward s a :=
  sorry

/-- 1.3: the expected return of a stationary policy is its value. -/
theorem expectedReturn_eq_value [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A)
    (s : S) : M.expectedReturn γ (ofStationary π) s = M.value γ π s :=
  sorry

/-! ## Layer 2: finite horizon -/

/-- 2.1: backward induction. No policy has an `N`-step return above `T^N g`, and the Markov
policy that at each time `n < N` is greedy for `T^(N - n - 1) g` attains it from every state. -/
theorem backwardInduction [MeasurableSpace S] [DiscreteMeasurableSpace S] [MeasurableSpace A]
    [DiscreteMeasurableSpace A] (γ : ℝ≥0) (N : ℕ) (g : S → ℝ) :
    (∀ (π : HistoryPolicy S A) (s : S), M.finiteReturn γ N g π s ≤ (M.bellman γ)^[N] g s) ∧
      ∀ π : ℕ → S → A, (∀ n < N, M.IsGreedy γ ((M.bellman γ)^[N - n - 1] g) (π n)) →
        ∀ s, M.finiteReturn γ N g (ofMarkov fun n ↦ ofDet (π n)) s = (M.bellman γ)^[N] g s :=
  sorry

/-! ## Layer 3: optimality -/

/-- 3.1: every history-dependent policy is dominated by the optimal value. -/
theorem expectedReturn_le_optimalValue [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1)
    (π : HistoryPolicy S A) (s : S) :
    M.expectedReturn γ π s ≤ M.optimalValue γ s :=
  sorry

/-- 3.1: a policy greedy for the optimal value is optimal. -/
theorem value_eq_optimalValue_of_isGreedy {γ : ℝ≥0} (hγ : γ < 1) {π : S → A}
    (hπ : M.IsGreedy γ (M.optimalValue γ) π) :
    M.value γ (ofDet π) = M.optimalValue γ :=
  sorry

/-- 3.1: the optimal value is the largest expected return over history-dependent policies. -/
theorem optimalValue_eq_iSup_expectedReturn [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1) (s : S) :
    IsGreatest (Set.range fun π : HistoryPolicy S A ↦ M.expectedReturn γ π s)
      (M.optimalValue γ s) :=
  sorry

/-- 3.1: every randomized stationary policy is dominated by the optimal value. -/
theorem value_le_optimalValue {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    M.value γ π ≤ M.optimalValue γ :=
  sorry

/-- 3.2: the Q-Bellman operator. -/
def qBellman (γ : ℝ≥0) (q : S × A → ℝ) : S × A → ℝ :=
  fun sa ↦ M.reward sa.1 sa.2 +
    γ * ∑ s', (M.trans sa.1 sa.2 s').toReal * univ.sup' univ_nonempty (fun b ↦ q (s', b))

/-- 3.2: the optimal Q-function. -/
def optimalQ (γ : ℝ≥0) : S × A → ℝ :=
  fun sa ↦ M.reward sa.1 sa.2 + γ * M.expect (M.optimalValue γ) sa.1 sa.2

/-- 3.2: the Q-Bellman operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_qBellman {γ : ℝ≥0} (hγ : γ < 1) :
    ContractingWith γ (M.qBellman γ) :=
  sorry

/-- 3.2: the optimal Q-function is the fixed point of the Q-Bellman operator. -/
theorem qBellman_optimalQ {γ : ℝ≥0} (hγ : γ < 1) :
    M.qBellman γ (M.optimalQ γ) = M.optimalQ γ :=
  sorry

/-- 3.3: policy improvement, with strict improvement at every state where the hypothesis is
strict. -/
theorem value_le_of_improve {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A)
    (h : M.value γ π ≤ M.bellmanEval γ π' (M.value γ π)) :
    M.value γ π ≤ M.value γ π' ∧
      ∀ s, M.value γ π s < M.bellmanEval γ π' (M.value γ π) s → M.value γ π s < M.value γ π' s :=
  sorry

/-- 3.3: the discounted occupancy measure `(1 - γ) e_s (1 - γ P^π)⁻¹`. -/
def occupancy [DecidableEq S] (γ : ℝ≥0) (π : S → PMF A) (s : S) : S → ℝ :=
  (1 - (γ : ℝ)) • (Pi.single s 1 ᵥ* Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π))

/-- 3.3: the performance difference lemma. -/
theorem performanceDifference [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A) (s : S) :
    M.value γ π' s - M.value γ π s =
      1 / (1 - γ) * ∑ s', M.occupancy γ π' s s' * ∑ a, (π' s' a).toReal *
        (M.reward s' a + γ * M.expect (M.value γ π) s' a - M.value γ π s') :=
  sorry

/-! ## Layer 4: value iteration and policy iteration -/

/-- 4.1: the greedy suboptimality bound. -/
theorem value_greedy_le {γ : ℝ≥0} (hγ : γ < 1) (v : S → ℝ) {π : S → A}
    (hπ : M.IsGreedy γ v π) :
    ‖M.value γ (ofDet π) - M.optimalValue γ‖ ≤ 2 * γ / (1 - γ) * ‖v - M.optimalValue γ‖ :=
  sorry

/-- 4.1: greedy policies of value iteration are eventually optimal. -/
theorem eventually_optimal_greedy_valueIteration {γ : ℝ≥0} (hγ : γ < 1) (v₀ : S → ℝ) :
    ∀ᶠ k in atTop, ∀ π : S → A, M.IsGreedy γ ((M.bellman γ)^[k] v₀) π →
      M.value γ (ofDet π) = M.optimalValue γ :=
  sorry

/-- 4.2: policy iteration converges at least as fast as value iteration. -/
theorem policyIteration_rate {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value γ (ofDet (π k))) (π (k + 1))) (k : ℕ) :
    ‖M.value γ (ofDet (π k)) - M.optimalValue γ‖ ≤
      γ ^ k * ‖M.value γ (ofDet (π 0)) - M.optimalValue γ‖ :=
  sorry

/-- 4.2: policy iteration that keeps the action `π k s` wherever it is greedy is constant at an
optimal policy from step `|A| ^ |S|` on. -/
theorem policyIteration_terminates {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value γ (ofDet (π k))) (π (k + 1)))
    (htie : ∀ k s, (∀ a, M.reward s a + γ * M.expect (M.value γ (ofDet (π k))) s a ≤
      M.reward s (π k s) + γ * M.expect (M.value γ (ofDet (π k))) s (π k s)) →
      π (k + 1) s = π k s) :
    ∀ k ≥ Fintype.card A ^ Fintype.card S,
      π (k + 1) = π k ∧ M.value γ (ofDet (π k)) = M.optimalValue γ :=
  sorry

/-! ## Layer 5: linear programs -/

/-- 5.1: every feasible point of the primal program dominates the optimal value. -/
theorem optimalValue_le_of_feasible {γ : ℝ≥0} (hγ : γ < 1) (v : S → ℝ)
    (hv : ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) :
    M.optimalValue γ ≤ v :=
  sorry

/-- 5.1: for positive weights the optimal value is the unique minimizer of the primal program. -/
theorem optimalValue_isLeast_primal {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (hμ : ∀ s, 0 < μ s) :
    IsLeast ((fun v ↦ ∑ s, μ s * v s) ''
        {v | ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s})
      (∑ s, μ s * M.optimalValue γ s) ∧
    ∀ v, (∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) →
      ∑ s, μ s * v s = ∑ s, μ s * M.optimalValue γ s → v = M.optimalValue γ :=
  sorry

/-- 5.2: `x` is a feasible point of the dual program with right-hand side `μ`. -/
def IsFeasibleOccupancy (γ : ℝ≥0) (μ : S → ℝ) (x : S × A → ℝ) : Prop :=
  0 ≤ x ∧ ∀ s', ∑ a, x (s', a) - γ * ∑ sa : S × A, (M.trans sa.1 sa.2 s').toReal * x sa = μ s'

/-- 5.2: the state-action occupancy `x^π` of a randomized stationary policy with initial
weights `μ`. -/
def stateActionOccupancy [DecidableEq S] (γ : ℝ≥0) (μ : S → ℝ) (π : S → PMF A) : S × A → ℝ :=
  fun sa ↦ (∑ s₀, μ s₀ * (M.occupancy γ π s₀ sa.1 / (1 - γ))) * (π sa.1 sa.2).toReal

/-- 5.2: the occupancy of a policy is feasible. -/
theorem isFeasibleOccupancy_stateActionOccupancy [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1)
    {μ : S → ℝ} (hμ : 0 ≤ μ) (π : S → PMF A) :
    M.IsFeasibleOccupancy γ μ (M.stateActionOccupancy γ μ π) :=
  sorry

/-- 5.2: every feasible point is the occupancy of a randomized stationary policy. -/
theorem exists_eq_stateActionOccupancy [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1) {μ : S → ℝ}
    {x : S × A → ℝ} (hx : M.IsFeasibleOccupancy γ μ x) :
    ∃ π : S → PMF A, x = M.stateActionOccupancy γ μ π :=
  sorry

/-- 5.2: the reward of the occupancy of a policy is the `μ`-weighted value of the policy. -/
theorem stateActionOccupancy_reward [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ)
    (π : S → PMF A) :
    ∑ sa : S × A, M.reward sa.1 sa.2 * M.stateActionOccupancy γ μ π sa =
      ∑ s, μ s * M.value γ π s :=
  sorry

/-- 5.2: weak duality for feasible points of the dual program. -/
theorem occupancy_reward_le {γ : ℝ≥0} (hγ : γ < 1) {μ : S → ℝ} {x : S × A → ℝ}
    (hx : M.IsFeasibleOccupancy γ μ x) :
    ∑ sa : S × A, M.reward sa.1 sa.2 * x sa ≤ ∑ s, μ s * M.optimalValue γ s :=
  sorry

end FiniteMDP

/-! ## Layer 6: stochastic approximation and Q-learning -/

section StochasticApproximation

variable {Ω : Type*} {m₀ : MeasurableSpace Ω} {P : Measure Ω} [IsProbabilityMeasure P]

/-- 6.1: the scalar noise lemma with random step sizes and a random bound on the conditional
variance. -/
theorem ae_tendsto_zero_noise {ℱ : Filtration ℕ m₀} {α w B W : ℕ → Ω → ℝ}
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω, α t ω ∈ Set.Icc (0 : ℝ) 1)
    (hw : ∀ t, StronglyMeasurable[ℱ (t + 1)] (w t)) (hw2 : ∀ t, MemLp (w t) 2 P)
    (hmean : ∀ t, P[w t | ℱ t] =ᵐ[P] 0)
    (hvar : ∀ t, P[fun ω ↦ w t ω ^ 2 | ℱ t] ≤ᵐ[P] B t)
    (hB : ∀ᵐ ω ∂P, BddAbove (Set.range fun t ↦ B t ω))
    (hdiv : ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω)
    (hsq : ∀ᵐ ω ∂P, Summable fun t ↦ α t ω ^ 2)
    (hW : ∀ t ω, W (t + 1) ω = (1 - α t ω) * W t ω + α t ω * w t ω) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ W t ω) atTop (𝓝 0) :=
  sorry

/-- 6.2: the weighted max norm `max_i |x i| / ξ i`. -/
def weightedMaxNorm {ι : Type*} [Fintype ι] [Nonempty ι] (ξ : ι → ℝ) (x : ι → ℝ) : ℝ :=
  univ.sup' univ_nonempty fun i ↦ |x i| / ξ i

/-- 6.2: an asynchronous stochastic-approximation iteration for the map `F`: the process `x`,
the step sizes `α`, the noise `w`, the delays `τ` and the constants `A`, `B` of the variance
bound. -/
structure IsAsyncSA {ι : Type*} [Fintype ι] (P : Measure Ω) (ℱ : Filtration ℕ m₀)
    (F : (ι → ℝ) → ι → ℝ) (x α w : ℕ → Ω → ι → ℝ) (τ : ℕ → Ω → ι → ι → ℕ) (A B : ℝ) : Prop where
  adapted_x : StronglyAdapted ℱ x
  adapted_step : StronglyAdapted ℱ α
  step_mem : ∀ t ω i, α t ω i ∈ Set.Icc (0 : ℝ) 1
  step_not_summable : ∀ i, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω i
  step_sq_summable : ∀ i, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω i ^ 2
  delay_le : ∀ t ω i j, τ t ω i j ≤ t
  delay_tendsto : ∀ i j, ∀ᵐ ω ∂P, Tendsto (fun t ↦ τ t ω i j) atTop atTop
  measurable_noise : ∀ t, StronglyMeasurable[ℱ (t + 1)] (w t)
  memLp_noise : ∀ t i, MemLp (fun ω ↦ w t ω i) 2 P
  condExp_noise : ∀ t i, P[fun ω ↦ w t ω i | ℱ t] =ᵐ[P] 0
  condExp_noise_sq : ∀ t i, P[fun ω ↦ w t ω i ^ 2 | ℱ t] ≤ᵐ[P]
    fun ω ↦ A + B * ((range (t + 1)).sup' nonempty_range_add_one fun s ↦ ‖x s ω‖) ^ 2
  update : ∀ t ω i,
    x (t + 1) ω i = x t ω i + α t ω i * (F (fun j ↦ x (τ t ω i j) ω j) i - x t ω i + w t ω i)

/-- 6.2: boundedness of asynchronous stochastic approximation for a map of linear growth with
slope below one in a weighted max norm. -/
theorem ae_bddAbove_asyncSA {ι : Type*} [Fintype ι] [Nonempty ι] {ℱ : Filtration ℕ m₀}
    {ξ : ι → ℝ} (hξ : ∀ i, 0 < ξ i) {F : (ι → ℝ) → ι → ℝ} {β D : ℝ} (hβ : β < 1)
    (hF : ∀ x, weightedMaxNorm ξ (F x) ≤ β * weightedMaxNorm ξ x + D)
    {x α w : ℕ → Ω → ι → ℝ} {τ : ℕ → Ω → ι → ι → ℕ} {A B : ℝ}
    (h : IsAsyncSA P ℱ F x α w τ A B) :
    ∀ᵐ ω ∂P, BddAbove (Set.range fun t ↦ ‖x t ω‖) :=
  sorry

/-- 6.2: convergence of asynchronous stochastic approximation for a map that contracts towards
`xstar` in a weighted max norm. -/
theorem ae_tendsto_asyncSA {ι : Type*} [Fintype ι] [Nonempty ι] {ℱ : Filtration ℕ m₀}
    {ξ : ι → ℝ} (hξ : ∀ i, 0 < ξ i) {F : (ι → ℝ) → ι → ℝ} {β : ℝ} (hβ : β < 1)
    {xstar : ι → ℝ}
    (hF : ∀ x, weightedMaxNorm ξ (F x - xstar) ≤ β * weightedMaxNorm ξ (x - xstar))
    {x α w : ℕ → Ω → ι → ℝ} {τ : ℕ → Ω → ι → ι → ℕ} {A B : ℝ}
    (h : IsAsyncSA P ℱ F x α w τ A B) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ x t ω) atTop (𝓝 xstar) :=
  sorry

variable [MeasurableSpace S] [DiscreteMeasurableSpace S]

/-- 6.3: tabular Q-learning converges almost surely to the optimal Q-function. -/
theorem qLearning_ae_tendsto (M : FiniteMDP S A) {γ : ℝ≥0} (hγ : γ < 1) {ℱ : Filtration ℕ m₀}
    {α rew q : ℕ → Ω → S × A → ℝ} {snext : ℕ → Ω → S × A → S} {q₀ : S × A → ℝ} {C : ℝ}
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω sa, α t ω sa ∈ Set.Icc (0 : ℝ) 1)
    (hdiv : ∀ sa, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω sa)
    (hsq : ∀ sa, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω sa ^ 2)
    (hsn : ∀ t sa, Measurable[ℱ (t + 1)] fun ω ↦ snext t ω sa)
    (htrans : ∀ t sa s', ∀ᵐ ω ∂P, α t ω sa ≠ 0 →
      (P[((fun ω ↦ snext t ω sa) ⁻¹' {s'}).indicator 1 | ℱ t]) ω =
        (M.trans sa.1 sa.2 s').toReal)
    (hrew : ∀ t, StronglyMeasurable[ℱ (t + 1)] (rew t))
    (hrew2 : ∀ t sa, MemLp (fun ω ↦ rew t ω sa) 2 P)
    (hrmean : ∀ t sa, ∀ᵐ ω ∂P, α t ω sa ≠ 0 →
      (P[fun ω ↦ rew t ω sa | ℱ t]) ω = M.reward sa.1 sa.2)
    (hrvar : ∀ t sa, ∀ᵐ ω ∂P, α t ω sa ≠ 0 → (P[fun ω ↦ rew t ω sa ^ 2 | ℱ t]) ω ≤ C)
    (hq0 : q 0 = fun _ ↦ q₀)
    (hq : ∀ t ω sa, q (t + 1) ω sa = q t ω sa + α t ω sa *
      (rew t ω sa + γ * univ.sup' univ_nonempty (fun b ↦ q t ω (snext t ω sa, b)) - q t ω sa)) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ q t ω) atTop (𝓝 (M.optimalQ γ)) :=
  sorry

/-- 6.4: tabular TD(0) converges almost surely to the value of the policy. -/
theorem td0_ae_tendsto (M : FiniteMDP S A) {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A)
    {ℱ : Filtration ℕ m₀} {α rew v : ℕ → Ω → S → ℝ} {snext : ℕ → Ω → S → S} {v₀ : S → ℝ}
    {C : ℝ}
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω s, α t ω s ∈ Set.Icc (0 : ℝ) 1)
    (hdiv : ∀ s, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω s)
    (hsq : ∀ s, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω s ^ 2)
    (hsn : ∀ t s, Measurable[ℱ (t + 1)] fun ω ↦ snext t ω s)
    (htrans : ∀ t s s', ∀ᵐ ω ∂P, α t ω s ≠ 0 →
      (P[((fun ω ↦ snext t ω s) ⁻¹' {s'}).indicator 1 | ℱ t]) ω = M.policyMatrix π s s')
    (hrew : ∀ t, StronglyMeasurable[ℱ (t + 1)] (rew t))
    (hrew2 : ∀ t s, MemLp (fun ω ↦ rew t ω s) 2 P)
    (hrmean : ∀ t s, ∀ᵐ ω ∂P, α t ω s ≠ 0 →
      (P[fun ω ↦ rew t ω s | ℱ t]) ω = ∑ a, (π s a).toReal * M.reward s a)
    (hrvar : ∀ t s, ∀ᵐ ω ∂P, α t ω s ≠ 0 → (P[fun ω ↦ rew t ω s ^ 2 | ℱ t]) ω ≤ C)
    (hv0 : v 0 = fun _ ↦ v₀)
    (hv : ∀ t ω s, v (t + 1) ω s = v t ω s + α t ω s *
      (rew t ω s + γ * v t ω (snext t ω s) - v t ω s)) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ v t ω) atTop (𝓝 (M.value γ π)) :=
  sorry

end StochasticApproximation

end TauCetiRoadmap.MarkovDecisionProcesses

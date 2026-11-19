import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Markov decision processes, dynamic programming and Q-learning: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body, and the one-step bound
`abs_reward_add_expect_le`, which the Bellman operators need to map bounded functions to bounded
functions, is proved. Every headline theorem of the README is statable at the pins and is stated
here. The README's remaining targets, API lists and Checks are not restated.

Suppliers used by the README and not restated here: Mathlib `ContractingWith.fixedPoint_unique'`,
`ContractingWith.tendsto_iterate_fixedPoint`, `ContractingWith.dist_fixedPoint_le`,
`ContractingWith.apriori_dist_iterate_fixedPoint_le`, `lp`, `lp.completeSpace`,
`lp.norm_eq_ciSup`, `lp.norm_apply_le_norm`, `memℓp_infty`,
`norm_integral_le_of_norm_le_const`, `Matrix.linftyOpNormedRing` (a `def`, used as a local
instance), `NormedRing.inverse_one_sub`, `PMF.bind`, `Kernel.compProd`, `Kernel.traj`,
`Kernel.trajMeasure`, `Kernel.integral_traj_partialTraj`, `Kernel.condDistrib_trajMeasure`,
`Measure.sum`, `StronglyAdapted`, `Submartingale.exists_ae_tendsto_of_bdd`,
`MeasureTheory.IsStoppingTime`, `MeasureTheory.stoppedProcess` and `MeasureTheory.hittingAfter`;
Tau Ceti `Kernel.ofPMF` (used below for every kernel built from a family of `PMF`s),
`Kernel.toMatrix`, `Kernel.toMatrix_pow`, `Kernel.comp_apply_singleton_eq_vecMul`,
`TauCeti.Probability.markovChainLaw`, `MeasureTheory.Measure.eq_markovChainLaw`,
`MeasureTheory.Measure.markovChainLaw_map_eval` and
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset Matrix
open scoped NNReal ENNReal

namespace TauCetiRoadmap.MarkovDecisionProcesses

/-- A Markov decision process with transition law `trans s a` and mean reward `reward s a`
bounded in absolute value by `rewardBound`. -/
structure MDP (S A : Type*) where
  trans : S → A → PMF S
  reward : S → A → ℝ
  rewardBound : ℝ
  abs_reward_le : ∀ s a, |reward s a| ≤ rewardBound

/-- The Banach space of bounded real functions on `ι` with the sup norm. -/
abbrev BoundedFn (ι : Type*) : Type _ := lp (fun _ : ι ↦ ℝ) ∞

/-- A history-dependent randomized policy: a Markov kernel `first` for the action at time `0`
and, for each `n`, a Markov kernel `next n` choosing the action at time `n + 1` from the history
up to time `n` and the state at time `n + 1`. -/
structure HistoryPolicy (S A : Type*) [MeasurableSpace S] [MeasurableSpace A] where
  first : Kernel S A
  next : (n : ℕ) → Kernel ((Π _ : Iic n, S × A) × S) A
  isMarkovKernel_first : IsMarkovKernel first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

variable {S A : Type*} [Countable S] [Nonempty S] [MeasurableSpace S] [MeasurableSingletonClass S]
  [Fintype A] [Nonempty A]

namespace MDP

variable (M : MDP S A)

/-! ## Layer 1: MDPs, policies and Bellman operators -/

/-- 1.1: the transition kernel `(s, a) ↦ trans s a`. -/
abbrev transKernel [MeasurableSpace A] [MeasurableSingletonClass A] : Kernel (S × A) S :=
  Kernel.ofPMF fun sa ↦ M.trans sa.1 sa.2

/-- 1.1: the state kernel `s ↦ Σ a, π s a • trans s a` of a randomized stationary policy. -/
abbrev stationaryKernel (π : S → PMF A) : Kernel S S :=
  Kernel.ofPMF fun s ↦ (π s).bind (M.trans s)

section Trajectories

variable [MeasurableSpace A] [MeasurableSingletonClass A]

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

/-- 1.1: under a stationary policy the state process is the Markov chain of `stationaryKernel`. -/
theorem trajLaw_ofStationary (π : S → PMF A) (s : S) :
    (M.trajLaw (ofStationary π) s).map (fun ω n ↦ (ω n).1) =
      TauCeti.Probability.markovChainLaw (Measure.dirac s) (M.stationaryKernel π) :=
  sorry

/-- 1.1: the tail bound for the discounted return. -/
theorem abs_expectedReturn_sub_finiteReturn_le {γ : ℝ≥0} (hγ : γ < 1) (π : HistoryPolicy S A)
    (s : S) (N : ℕ) :
    |M.expectedReturn γ π s - M.finiteReturn γ N 0 π s| ≤
      (γ : ℝ) ^ N * M.rewardBound / (1 - γ) :=
  sorry

end Trajectories

/-- 1.2: the expected next value `∫ v ∂(trans s a)`. -/
def expect (v : S → ℝ) (s : S) (a : A) : ℝ := ∫ s', v s' ∂(M.trans s a).toMeasure

omit [Countable S] [Nonempty S] [MeasurableSingletonClass S] [Fintype A] [Nonempty A] in
/-- 1.2: the one-step bound that keeps the Bellman operators inside the bounded functions. -/
theorem abs_reward_add_expect_le (γ : ℝ≥0) (v : BoundedFn S) (s : S) (a : A) :
    |M.reward s a + γ * M.expect v s a| ≤ M.rewardBound + γ * ‖v‖ := by
  have h : ‖∫ s', v s' ∂(M.trans s a).toMeasure‖ ≤ ‖v‖ := by
    simpa using norm_integral_le_of_norm_le_const (μ := (M.trans s a).toMeasure)
      (ae_of_all _ fun s' ↦ lp.norm_apply_le_norm ENNReal.top_ne_zero v s')
  calc |M.reward s a + γ * M.expect v s a|
      ≤ |M.reward s a| + |(γ : ℝ) * M.expect v s a| := abs_add_le _ _
    _ ≤ M.rewardBound + γ * ‖v‖ := by
        rw [abs_mul, abs_of_nonneg γ.coe_nonneg]
        exact add_le_add (M.abs_reward_le s a) (mul_le_mul_of_nonneg_left h γ.coe_nonneg)

/-- 1.2: the Bellman evaluation operator of a randomized stationary policy. -/
def bellmanEval (γ : ℝ≥0) (π : S → PMF A) (v : BoundedFn S) : BoundedFn S :=
  ⟨fun s ↦ ∑ a, (π s a).toReal * (M.reward s a + γ * M.expect v s a),
    memℓp_infty ⟨M.rewardBound + γ * ‖v‖, by
      rintro _ ⟨s, rfl⟩
      have h1 : ∑ a, (π s a).toReal = 1 := by
        have h := (π s).tsum_coe
        rw [tsum_fintype] at h
        rw [← ENNReal.toReal_sum fun a _ ↦ (π s).apply_ne_top a, h, ENNReal.toReal_one]
      calc ‖∑ a, (π s a).toReal * (M.reward s a + γ * M.expect v s a)‖
          ≤ ∑ a, (π s a).toReal * (M.rewardBound + γ * ‖v‖) := by
            refine (norm_sum_le _ _).trans (sum_le_sum fun a _ ↦ ?_)
            rw [norm_mul, Real.norm_of_nonneg ENNReal.toReal_nonneg]
            exact mul_le_mul_of_nonneg_left (M.abs_reward_add_expect_le γ v s a)
              ENNReal.toReal_nonneg
        _ = M.rewardBound + γ * ‖v‖ := by rw [← sum_mul, h1, one_mul]⟩⟩

/-- 1.2: the Bellman optimality operator. -/
def bellman (γ : ℝ≥0) (v : BoundedFn S) : BoundedFn S :=
  ⟨fun s ↦ univ.sup' univ_nonempty fun a ↦ M.reward s a + γ * M.expect v s a,
    memℓp_infty ⟨M.rewardBound + γ * ‖v‖, by
      rintro _ ⟨s, rfl⟩
      obtain ⟨a₀⟩ := ‹Nonempty A›
      exact abs_le.2 ⟨(abs_le.1 (M.abs_reward_add_expect_le γ v s a₀)).1.trans
        (le_sup' (fun a ↦ M.reward s a + γ * M.expect v s a) (mem_univ a₀)),
        sup'_le _ _ fun a _ ↦ (abs_le.1 (M.abs_reward_add_expect_le γ v s a)).2⟩⟩⟩

/-- 1.2: the value of a randomized stationary policy, the limit of the iterates of its
evaluation operator from `0`. -/
def value (γ : ℝ≥0) (π : S → PMF A) : BoundedFn S :=
  limUnder atTop fun k ↦ (M.bellmanEval γ π)^[k] 0

/-- 1.2: the optimal value, the limit of the iterates of the Bellman optimality operator
from `0`. -/
def optimalValue (γ : ℝ≥0) : BoundedFn S :=
  limUnder atTop fun k ↦ (M.bellman γ)^[k] 0

/-- 1.2: the randomized policy of a deterministic one. -/
def ofDet (π : S → A) : S → PMF A := fun s ↦ PMF.pure (π s)

/-- 1.2: `π` is greedy for `v`. -/
def IsGreedy (γ : ℝ≥0) (v : S → ℝ) (π : S → A) : Prop :=
  ∀ s a, M.reward s a + γ * M.expect v s a ≤ M.reward s (π s) + γ * M.expect v s (π s)

/-- 1.2: the row-stochastic matrix of a randomized stationary policy on a finite state space. -/
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
theorem norm_value_le {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    ‖M.value γ π‖ ≤ M.rewardBound / (1 - γ) :=
  sorry

/-- 1.2: on a finite state space the value is `(1 - γ P^π)⁻¹ r^π`, the inverse being a Neumann
series in the normed ring `Matrix.linftyOpNormedRing`. -/
theorem value_eq_inverse [Fintype S] [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    ⇑(M.value γ π) = Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π) *ᵥ
      fun s ↦ ∑ a, (π s a).toReal * M.reward s a :=
  sorry

/-- 1.3: the expected return of a stationary policy is its value. -/
theorem expectedReturn_eq_value [MeasurableSpace A] [MeasurableSingletonClass A] {γ : ℝ≥0}
    (hγ : γ < 1) (π : S → PMF A) (s : S) :
    M.expectedReturn γ (ofStationary π) s = M.value γ π s :=
  sorry

/-! ## Layer 2: finite horizon -/

/-- 2.1: backward induction. No policy has an `N`-step return above `T^N g`, and the Markov
policy that at each time `n < N` is greedy for `T^(N - n - 1) g` attains it from every state. -/
theorem backwardInduction [MeasurableSpace A] [MeasurableSingletonClass A] (γ : ℝ≥0) (N : ℕ)
    (g : BoundedFn S) :
    (∀ (π : HistoryPolicy S A) (s : S), M.finiteReturn γ N g π s ≤ (M.bellman γ)^[N] g s) ∧
      ∀ π : ℕ → S → A, (∀ n < N, M.IsGreedy γ ((M.bellman γ)^[N - n - 1] g) (π n)) →
        ∀ s, M.finiteReturn γ N g (ofMarkov fun n ↦ ofDet (π n)) s = (M.bellman γ)^[N] g s :=
  sorry

/-! ## Layer 3: optimality -/

/-- 3.1: every history-dependent policy is dominated by the optimal value. -/
theorem expectedReturn_le_optimalValue [MeasurableSpace A] [MeasurableSingletonClass A]
    {γ : ℝ≥0} (hγ : γ < 1) (π : HistoryPolicy S A) (s : S) :
    M.expectedReturn γ π s ≤ M.optimalValue γ s :=
  sorry

/-- 3.1: a policy greedy for the optimal value is optimal. -/
theorem value_eq_optimalValue_of_isGreedy {γ : ℝ≥0} (hγ : γ < 1) {π : S → A}
    (hπ : M.IsGreedy γ (M.optimalValue γ) π) :
    M.value γ (ofDet π) = M.optimalValue γ :=
  sorry

/-- 3.1: the optimal value is the largest expected return over history-dependent policies. -/
theorem optimalValue_eq_iSup_expectedReturn [MeasurableSpace A] [MeasurableSingletonClass A]
    {γ : ℝ≥0} (hγ : γ < 1) (s : S) :
    IsGreatest (Set.range fun π : HistoryPolicy S A ↦ M.expectedReturn γ π s)
      (M.optimalValue γ s) :=
  sorry

/-- 3.1: every randomized stationary policy is dominated by the optimal value. -/
theorem value_le_optimalValue {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) (s : S) :
    M.value γ π s ≤ M.optimalValue γ s :=
  sorry

/-- 3.2: the state function `s ↦ max_b q (s, b)` of a bounded Q-function. -/
def maxQ (q : BoundedFn (S × A)) : BoundedFn S :=
  ⟨fun s ↦ univ.sup' univ_nonempty fun b ↦ q (s, b),
    memℓp_infty ⟨‖q‖, by
      rintro _ ⟨s, rfl⟩
      have h : ∀ b, |q (s, b)| ≤ ‖q‖ := fun b ↦ lp.norm_apply_le_norm ENNReal.top_ne_zero q (s, b)
      obtain ⟨b₀⟩ := ‹Nonempty A›
      exact abs_le.2 ⟨(abs_le.1 (h b₀)).1.trans (le_sup' (fun b ↦ q (s, b)) (mem_univ b₀)),
        sup'_le _ _ fun b _ ↦ (abs_le.1 (h b)).2⟩⟩⟩

/-- 3.2: the Q-Bellman operator. -/
def qBellman (γ : ℝ≥0) (q : BoundedFn (S × A)) : BoundedFn (S × A) :=
  ⟨fun sa ↦ M.reward sa.1 sa.2 + γ * M.expect (maxQ q) sa.1 sa.2,
    memℓp_infty ⟨M.rewardBound + γ * ‖maxQ q‖, by
      rintro _ ⟨sa, rfl⟩
      exact M.abs_reward_add_expect_le γ (maxQ q) sa.1 sa.2⟩⟩

/-- 3.2: the optimal Q-function, the limit of the iterates of the Q-Bellman operator from `0`. -/
def optimalQ (γ : ℝ≥0) : BoundedFn (S × A) :=
  limUnder atTop fun k ↦ (M.qBellman γ)^[k] 0

/-- 3.2: the Q-Bellman operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_qBellman {γ : ℝ≥0} (hγ : γ < 1) :
    ContractingWith γ (M.qBellman γ) :=
  sorry

/-- 3.2: the optimal Q-function is the fixed point of the Q-Bellman operator. -/
theorem qBellman_optimalQ {γ : ℝ≥0} (hγ : γ < 1) :
    M.qBellman γ (M.optimalQ γ) = M.optimalQ γ :=
  sorry

/-- 3.2: the optimal Q-function is the one-step lookahead of the optimal value. -/
theorem optimalQ_apply {γ : ℝ≥0} (hγ : γ < 1) (s : S) (a : A) :
    M.optimalQ γ (s, a) = M.reward s a + γ * M.expect (M.optimalValue γ) s a :=
  sorry

/-- 3.2: the optimal value is the maximum of the optimal Q-function over the actions. -/
theorem maxQ_optimalQ {γ : ℝ≥0} (hγ : γ < 1) :
    maxQ (M.optimalQ γ) = M.optimalValue γ :=
  sorry

/-- 3.3: policy improvement, with strict improvement at every state where the hypothesis is
strict. -/
theorem value_le_of_improve {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A)
    (h : ∀ s, M.value γ π s ≤ M.bellmanEval γ π' (M.value γ π) s) :
    (∀ s, M.value γ π s ≤ M.value γ π' s) ∧
      ∀ s, M.value γ π s < M.bellmanEval γ π' (M.value γ π) s → M.value γ π s < M.value γ π' s :=
  sorry

/-- 3.3: the discounted occupancy measure `(1 - γ) Σ n, γ ^ n • (κ^π) ^ n s`. -/
def occupancy (γ : ℝ≥0) (π : S → PMF A) (s : S) : Measure S :=
  ((1 - γ : ℝ≥0) : ℝ≥0∞) •
    Measure.sum fun n : ℕ ↦ ((γ ^ n : ℝ≥0) : ℝ≥0∞) • (M.stationaryKernel π ^ n) s

/-- 3.3: on a finite state space the occupancy measure is the row vector
`(1 - γ) e_s (1 - γ P^π)⁻¹`. -/
theorem occupancy_real_singleton [Fintype S] [DecidableEq S] {γ : ℝ≥0} (hγ : γ < 1)
    (π : S → PMF A) (s s' : S) :
    (M.occupancy γ π s).real {s'} =
      (1 - (γ : ℝ)) * (Pi.single s 1 ᵥ* Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π)) s' :=
  sorry

/-- 3.3: the performance difference lemma. -/
theorem performanceDifference {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A) (s : S) :
    M.value γ π' s - M.value γ π s =
      1 / (1 - γ) * ∫ s', ∑ a, (π' s' a).toReal *
        (M.reward s' a + γ * M.expect (M.value γ π) s' a - M.value γ π s')
          ∂(M.occupancy γ π' s) :=
  sorry

/-! ## Layer 4: value iteration and policy iteration -/

/-- 4.1: the greedy suboptimality bound. -/
theorem value_greedy_le {γ : ℝ≥0} (hγ : γ < 1) (v : BoundedFn S) {π : S → A}
    (hπ : M.IsGreedy γ v π) :
    ‖M.value γ (ofDet π) - M.optimalValue γ‖ ≤ 2 * γ / (1 - γ) * ‖v - M.optimalValue γ‖ :=
  sorry

/-- 4.1: on a finite state space, greedy policies of value iteration are eventually optimal. -/
theorem eventually_optimal_greedy_valueIteration [Fintype S] {γ : ℝ≥0} (hγ : γ < 1)
    (v₀ : BoundedFn S) :
    ∀ᶠ k in atTop, ∀ π : S → A, M.IsGreedy γ ((M.bellman γ)^[k] v₀) π →
      M.value γ (ofDet π) = M.optimalValue γ :=
  sorry

/-- 4.2: policy iteration converges at least as fast as value iteration. -/
theorem policyIteration_rate {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value γ (ofDet (π k))) (π (k + 1))) (k : ℕ) :
    ‖M.value γ (ofDet (π k)) - M.optimalValue γ‖ ≤
      γ ^ k * ‖M.value γ (ofDet (π 0)) - M.optimalValue γ‖ :=
  sorry

/-- 4.2: on a finite state space, policy iteration that keeps the action `π k s` wherever it is
greedy is constant at an optimal policy from step `|A| ^ |S|` on. -/
theorem policyIteration_terminates [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value γ (ofDet (π k))) (π (k + 1)))
    (htie : ∀ k s, (∀ a, M.reward s a + γ * M.expect (M.value γ (ofDet (π k))) s a ≤
      M.reward s (π k s) + γ * M.expect (M.value γ (ofDet (π k))) s (π k s)) →
      π (k + 1) s = π k s) :
    ∀ k ≥ Fintype.card A ^ Fintype.card S,
      π (k + 1) = π k ∧ M.value γ (ofDet (π k)) = M.optimalValue γ :=
  sorry

/-! ## Layer 5: linear programs -/

/-- 5.1: every feasible point of the primal program dominates the optimal value. -/
theorem optimalValue_le_of_feasible [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) (v : S → ℝ)
    (hv : ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) (s : S) :
    M.optimalValue γ s ≤ v s :=
  sorry

/-- 5.1: for positive weights the optimal value is the unique minimizer of the primal program. -/
theorem optimalValue_isLeast_primal [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ)
    (hμ : ∀ s, 0 < μ s) :
    IsLeast ((fun v ↦ ∑ s, μ s * v s) ''
        {v | ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s})
      (∑ s, μ s * M.optimalValue γ s) ∧
    ∀ v : S → ℝ, (∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) →
      ∑ s, μ s * v s = ∑ s, μ s * M.optimalValue γ s → v = M.optimalValue γ :=
  sorry

/-- 5.2: `x` is a feasible point of the dual program with right-hand side `μ`. -/
def IsFeasibleOccupancy [Fintype S] (γ : ℝ≥0) (μ : S → ℝ) (x : S × A → ℝ) : Prop :=
  0 ≤ x ∧ ∀ s', ∑ a, x (s', a) - γ * ∑ sa : S × A, (M.trans sa.1 sa.2 s').toReal * x sa = μ s'

/-- 5.2: the state-action occupancy `x^π` of a randomized stationary policy with initial
weights `μ`. -/
def stateActionOccupancy [Fintype S] (γ : ℝ≥0) (μ : S → ℝ) (π : S → PMF A) : S × A → ℝ :=
  fun sa ↦ (∑ s₀, μ s₀ * ((M.occupancy γ π s₀).real {sa.1} / (1 - γ))) * (π sa.1 sa.2).toReal

/-- 5.2: the occupancy of a policy is feasible. -/
theorem isFeasibleOccupancy_stateActionOccupancy [Fintype S] {γ : ℝ≥0} (hγ : γ < 1)
    {μ : S → ℝ} (hμ : 0 ≤ μ) (π : S → PMF A) :
    M.IsFeasibleOccupancy γ μ (M.stateActionOccupancy γ μ π) :=
  sorry

/-- 5.2: every feasible point is the occupancy of a randomized stationary policy. -/
theorem exists_eq_stateActionOccupancy [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) {μ : S → ℝ}
    {x : S × A → ℝ} (hx : M.IsFeasibleOccupancy γ μ x) :
    ∃ π : S → PMF A, x = M.stateActionOccupancy γ μ π :=
  sorry

/-- 5.2: the reward of the occupancy of a policy is the `μ`-weighted value of the policy. -/
theorem stateActionOccupancy_reward [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ)
    (π : S → PMF A) :
    ∑ sa : S × A, M.reward sa.1 sa.2 * M.stateActionOccupancy γ μ π sa =
      ∑ s, μ s * M.value γ π s :=
  sorry

/-- 5.2: weak duality for feasible points of the dual program. -/
theorem occupancy_reward_le [Fintype S] {γ : ℝ≥0} (hγ : γ < 1) {μ : S → ℝ} {x : S × A → ℝ}
    (hx : M.IsFeasibleOccupancy γ μ x) :
    ∑ sa : S × A, M.reward sa.1 sa.2 * x sa ≤ ∑ s, μ s * M.optimalValue γ s :=
  sorry

end MDP

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

/-- 6.3: on a finite state space, tabular Q-learning converges almost surely to the optimal
Q-function. -/
theorem qLearning_ae_tendsto [Fintype S] (M : MDP S A) {γ : ℝ≥0} (hγ : γ < 1)
    {ℱ : Filtration ℕ m₀}
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
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ q t ω) atTop (𝓝 ⇑(M.optimalQ γ)) :=
  sorry

/-- 6.4: on a finite state space, tabular TD(0) converges almost surely to the value of the
policy. -/
theorem td0_ae_tendsto [Fintype S] (M : MDP S A) {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A)
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
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ v t ω) atTop (𝓝 ⇑(M.value γ π)) :=
  sorry

end StochasticApproximation

end TauCetiRoadmap.MarkovDecisionProcesses

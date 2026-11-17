import Mathlib
import TauCeti.Probability.Process.MarkovChain

/-!
# Markov decision processes, dynamic programming and Q-learning: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`, and this file is read as suggested forms, never as a checklist. It states the named
targets of the README against the pinned Mathlib API; discharging them finishes neither a
milestone nor the roadmap. The `sorry` proofs are targets, not completed results.

Suppliers used by the README and not restated here: Mathlib `ContractingWith.fixedPoint`,
`ContractingWith.fixedPoint_isFixedPt`, `ContractingWith.fixedPoint_unique`,
`ContractingWith.dist_fixedPoint_le`, `ContractingWith.apriori_dist_iterate_fixedPoint_le`,
`pi_norm_le_iff_of_nonneg`, `Matrix.linftyOpNormedRing` (a `def`, used as a local instance),
`NormedRing.inverse_one_sub`, `PMF.toMeasure`, `Kernel.ofFunOfCountable`, `Kernel.compProd`,
`Kernel.traj`, `Kernel.trajMeasure`, `Kernel.integral_traj`, `Kernel.integral_traj_partialTraj`,
`Kernel.condDistrib_trajMeasure`, `StronglyAdapted`, `Submartingale.exists_ae_tendsto_of_bdd`,
`MeasureTheory.IsStoppingTime`, `stoppedProcess` and `hitting`; Tau Ceti
`TauCeti.Probability.markovChainLaw` and
`MeasureTheory.Measure.condExp_shift_iterate_markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset Matrix
open scoped NNReal ENNReal

namespace TauCetiRoadmap.MarkovDecisionProcesses

/-- A finite Markov decision process with deterministic rewards. -/
structure FiniteMDP (S A : Type*) where
  trans : S → A → PMF S
  reward : S → A → ℝ

/-- A history-dependent randomized policy: a Markov kernel for the first action and, for each
`n`, a Markov kernel choosing the action at time `n + 1` from the history up to time `n` and the
new state. -/
structure HistoryPolicy (S A : Type*) [MeasurableSpace S] [MeasurableSpace A] where
  first : Kernel S A
  next : (n : ℕ) → Kernel ((Π _ : Iic n, S × A) × S) A
  isMarkovKernel_first : IsMarkovKernel first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

variable {S A : Type*} [Fintype S] [Nonempty S] [Fintype A] [Nonempty A]
  [DecidableEq S] [DecidableEq A]

namespace FiniteMDP

variable (M : FiniteMDP S A)

/-! ## Layer 1: MDPs, policies and Bellman operators -/

section Trajectories

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [MeasurableSpace A]
  [DiscreteMeasurableSpace A]

/-- The transition kernel `(s, a) ↦ trans s a`. -/
def transKernel : Kernel (S × A) S :=
  Kernel.ofFunOfCountable fun sa ↦ (M.trans sa.1 sa.2).toMeasure

/-- The history-dependent policy of a Markov policy. -/
def ofMarkov (π : ℕ → S → PMF A) : HistoryPolicy S A where
  first := Kernel.ofFunOfCountable fun s ↦ (π 0 s).toMeasure
  next n := Kernel.ofFunOfCountable fun hs ↦ (π (n + 1) hs.2).toMeasure
  isMarkovKernel_first := sorry
  isMarkovKernel_next := sorry

/-- The history-dependent policy of a randomized stationary policy. -/
def ofStationary (π : S → PMF A) : HistoryPolicy S A := ofMarkov fun _ ↦ π

/-- 1.1: the trajectory law of a history-dependent policy from the state `s`. -/
def trajLaw (π : HistoryPolicy S A) (s : S) : Measure (ℕ → S × A) :=
  haveI := π.isMarkovKernel_first
  haveI := π.isMarkovKernel_next
  haveI : IsMarkovKernel M.transKernel := sorry
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

/-- 1.1: the state kernel of a randomized stationary policy. -/
def stationaryKernel (π : S → PMF A) : Kernel S S :=
  Kernel.ofFunOfCountable fun s ↦ ∑ a, (π s a).toNNReal • (M.trans s a).toMeasure

/-- 1.1: under a stationary policy the state process is the Markov chain of `stationaryKernel`. -/
theorem trajLaw_ofStationary (π : S → PMF A) (s : S) [IsMarkovKernel (M.stationaryKernel π)] :
    (M.trajLaw (ofStationary π) s).map (fun ω n ↦ (ω n).1) =
      TauCeti.Probability.markovChainLaw (Measure.dirac s) (M.stationaryKernel π) :=
  sorry

/-- 1.1: the tail bound. -/
theorem abs_expectedReturn_sub_finiteReturn_le (γ : ℝ≥0) (hγ : γ < 1) (π : HistoryPolicy S A)
    (s : S) {R : ℝ} (hR : ∀ s a, |M.reward s a| ≤ R) (N : ℕ) :
    |M.expectedReturn γ π s - M.finiteReturn γ N 0 π s| ≤ (γ : ℝ) ^ N * R / (1 - γ) :=
  sorry

end Trajectories

/-- Expected next value `Σ s', P(s' | s, a) v s'`. -/
def expect (v : S → ℝ) (s : S) (a : A) : ℝ := ∑ s', (M.trans s a s').toReal * v s'

/-- The Bellman evaluation operator of a randomized stationary policy. -/
def bellmanEval (γ : ℝ≥0) (π : S → PMF A) (v : S → ℝ) : S → ℝ :=
  fun s ↦ ∑ a, (π s a).toReal * (M.reward s a + γ * M.expect v s a)

/-- The Bellman optimality operator. -/
def bellman (γ : ℝ≥0) (v : S → ℝ) : S → ℝ :=
  fun s ↦ univ.sup' univ_nonempty fun a ↦ M.reward s a + γ * M.expect v s a

/-- 1.2: the Bellman optimality operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_bellman {γ : ℝ≥0} (hγ : γ < 1) :
    ContractingWith γ (M.bellman γ) :=
  sorry

/-- 1.2: the Bellman evaluation operator is a `γ`-contraction of the sup norm. -/
theorem contractingWith_bellmanEval {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    ContractingWith γ (M.bellmanEval γ π) :=
  sorry

/-- The optimal value: the fixed point of the Bellman optimality operator. -/
def optimalValue {γ : ℝ≥0} (hγ : γ < 1) : S → ℝ :=
  ContractingWith.fixedPoint (M.bellman γ) (M.contractingWith_bellman hγ)

/-- The value of a randomized stationary policy: the fixed point of its evaluation operator. -/
def value {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) : S → ℝ :=
  ContractingWith.fixedPoint (M.bellmanEval γ π) (M.contractingWith_bellmanEval hγ π)

/-- The randomized policy of a deterministic one. -/
def ofDet (π : S → A) : S → PMF A := fun s ↦ PMF.pure (π s)

/-- `π` is greedy for `v`. -/
def IsGreedy (γ : ℝ≥0) (v : S → ℝ) (π : S → A) : Prop :=
  ∀ s a, M.reward s a + γ * M.expect v s a ≤ M.reward s (π s) + γ * M.expect v s (π s)

/-- The row-stochastic matrix of a randomized stationary policy. -/
def policyMatrix (π : S → PMF A) : Matrix S S ℝ :=
  Matrix.of fun s s' ↦ ∑ a, (π s a).toReal * (M.trans s a s').toReal

/-- 1.2: values are bounded by `R / (1 - γ)`. -/
theorem norm_value_le {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) {R : ℝ}
    (hR : ∀ s a, |M.reward s a| ≤ R) :
    ‖M.value hγ π‖ ≤ R / (1 - γ) :=
  sorry

/-- 1.2: the value as a Neumann series, in the normed ring `Matrix.linftyOpNormedRing`. -/
theorem value_eq_inverse {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    M.value hγ π = Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π) *ᵥ
      fun s ↦ ∑ a, (π s a).toReal * M.reward s a :=
  sorry

/-- 1.3: the expected return of a stationary policy is its value. -/
theorem expectedReturn_eq_value [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A)
    (s : S) : M.expectedReturn γ (ofStationary π) s = M.value hγ π s :=
  sorry

/-! ## Layer 2: finite horizon -/

/-- 2.1: backward induction. -/
theorem backwardInduction [MeasurableSpace S] [DiscreteMeasurableSpace S] [MeasurableSpace A]
    [DiscreteMeasurableSpace A] (γ : ℝ≥0) (N : ℕ) (g : S → ℝ) (s : S) :
    IsGreatest (Set.range fun π : HistoryPolicy S A ↦ M.finiteReturn γ N g π s)
      ((M.bellman γ)^[N] g s) :=
  sorry

/-! ## Layer 3: optimality -/

/-- 3.1: every history-dependent policy is dominated by the optimal value. -/
theorem expectedReturn_le_optimalValue [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1)
    (π : HistoryPolicy S A) (s : S) :
    M.expectedReturn γ π s ≤ M.optimalValue hγ s :=
  sorry

/-- 3.1: the optimal value is the supremum of expected returns, attained. -/
theorem optimalValue_eq_iSup_expectedReturn [MeasurableSpace S] [DiscreteMeasurableSpace S]
    [MeasurableSpace A] [DiscreteMeasurableSpace A] {γ : ℝ≥0} (hγ : γ < 1) (s : S) :
    IsGreatest (Set.range fun π : HistoryPolicy S A ↦ M.expectedReturn γ π s)
      (M.optimalValue hγ s) :=
  sorry

/-- 3.1: a policy greedy for the optimal value is optimal. -/
theorem value_eq_optimalValue_of_isGreedy {γ : ℝ≥0} (hγ : γ < 1) {π : S → A}
    (hπ : M.IsGreedy γ (M.optimalValue hγ) π) :
    M.value hγ (ofDet π) = M.optimalValue hγ :=
  sorry

/-- 3.1: every randomized stationary policy is dominated by the optimal value. -/
theorem value_le_optimalValue {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A) :
    M.value hγ π ≤ M.optimalValue hγ :=
  sorry

/-- The Q-Bellman operator. -/
def qBellman (γ : ℝ≥0) (q : S × A → ℝ) : S × A → ℝ :=
  fun sa ↦ M.reward sa.1 sa.2 +
    γ * ∑ s', (M.trans sa.1 sa.2 s').toReal * univ.sup' univ_nonempty (fun b ↦ q (s', b))

/-- 3.2: the Q-Bellman operator is a `γ`-contraction. -/
theorem contractingWith_qBellman {γ : ℝ≥0} (hγ : γ < 1) :
    ContractingWith γ (M.qBellman γ) :=
  sorry

/-- 3.3: policy improvement. -/
theorem value_le_of_improve {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A)
    (h : M.value hγ π ≤ M.bellmanEval γ π' (M.value hγ π)) :
    M.value hγ π ≤ M.value hγ π' :=
  sorry

/-- 3.3: the discounted occupancy measure `(1 - γ) e_s (1 - γ P^π)⁻¹`. -/
def occupancy (γ : ℝ≥0) (π : S → PMF A) (s : S) : S → ℝ :=
  (1 - (γ : ℝ)) • (Pi.single s 1 ᵥ* Ring.inverse (1 - (γ : ℝ) • M.policyMatrix π))

/-- 3.3: the performance difference lemma. -/
theorem performanceDifference {γ : ℝ≥0} (hγ : γ < 1) (π π' : S → PMF A) (s : S) :
    M.value hγ π' s - M.value hγ π s =
      1 / (1 - γ) * ∑ s', M.occupancy γ π' s s' * ∑ a, (π' s' a).toReal *
        (M.reward s' a + γ * M.expect (M.value hγ π) s' a - M.value hγ π s') :=
  sorry

/-! ## Layer 4: algorithms -/

/-- 4.1: the greedy suboptimality bound of Singh and Yee. -/
theorem value_greedy_le {γ : ℝ≥0} (hγ : γ < 1) (v : S → ℝ) {π : S → A}
    (hπ : M.IsGreedy γ v π) :
    ‖M.value hγ (ofDet π) - M.optimalValue hγ‖ ≤ 2 * γ / (1 - γ) * ‖v - M.optimalValue hγ‖ :=
  sorry

/-- 4.1: greedy policies of value iteration are eventually optimal. -/
theorem eventually_optimal_greedy_valueIteration {γ : ℝ≥0} (hγ : γ < 1) (v₀ : S → ℝ) :
    ∀ᶠ k in atTop, ∀ π : S → A, M.IsGreedy γ ((M.bellman γ)^[k] v₀) π →
      M.value hγ (ofDet π) = M.optimalValue hγ :=
  sorry

/-- 4.2: policy iteration converges at least as fast as value iteration. -/
theorem policyIteration_rate {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value hγ (ofDet (π k))) (π (k + 1))) (k : ℕ) :
    ‖M.value hγ (ofDet (π k)) - M.optimalValue hγ‖ ≤
      γ ^ k * ‖M.value hγ (ofDet (π 0)) - M.optimalValue hγ‖ :=
  sorry

/-- 4.2: policy iteration with the tie-breaking rule terminates at an optimal policy within
`|A| ^ |S|` steps. -/
theorem policyIteration_terminates {γ : ℝ≥0} (hγ : γ < 1) (π : ℕ → S → A)
    (hπ : ∀ k, M.IsGreedy γ (M.value hγ (ofDet (π k))) (π (k + 1)))
    (htie : ∀ k s, (∀ a, M.reward s a + γ * M.expect (M.value hγ (ofDet (π k))) s a ≤
      M.reward s (π k s) + γ * M.expect (M.value hγ (ofDet (π k))) s (π k s)) →
      π (k + 1) s = π k s) :
    ∀ k ≥ Fintype.card A ^ Fintype.card S,
      π k = π (k + 1) ∧ M.value hγ (ofDet (π k)) = M.optimalValue hγ :=
  sorry

/-! ## Layer 5: linear programs -/

/-- 5.1: every feasible point of the primal program dominates the optimal value. -/
theorem optimalValue_le_of_feasible {γ : ℝ≥0} (hγ : γ < 1) (v : S → ℝ)
    (hv : ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) :
    M.optimalValue hγ ≤ v :=
  sorry

/-- 5.1: the optimal value is the unique minimizer of the primal program. -/
theorem optimalValue_isLeast_primal {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (hμ : ∀ s, 0 < μ s) :
    IsLeast ((fun v ↦ ∑ s, μ s * v s) ''
        {v | ∀ s a, M.reward s a + γ * M.expect v s a ≤ v s})
      (∑ s, μ s * M.optimalValue hγ s) ∧
    ∀ v, (∀ s a, M.reward s a + γ * M.expect v s a ≤ v s) →
      ∑ s, μ s * v s = ∑ s, μ s * M.optimalValue hγ s → v = M.optimalValue hγ :=
  sorry

/-- 5.2: weak duality for feasible occupancy measures. -/
theorem occupancy_reward_le {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (x : S × A → ℝ) (hx : 0 ≤ x)
    (hflow : ∀ s', ∑ a, x (s', a) - γ * ∑ sa : S × A, (M.trans sa.1 sa.2 s').toReal * x sa = μ s') :
    ∑ sa : S × A, M.reward sa.1 sa.2 * x sa ≤ ∑ s, μ s * M.optimalValue hγ s :=
  sorry

/-- 5.2: equality at the occupancy of an optimal policy. -/
theorem occupancy_reward_optimal {γ : ℝ≥0} (hγ : γ < 1) (μ : S → ℝ) (π : S → PMF A)
    (hπ : M.value hγ π = M.optimalValue hγ) :
    ∑ sa : S × A, M.reward sa.1 sa.2 *
        (∑ s₀, μ s₀ * (M.occupancy γ π s₀ sa.1 / (1 - γ)) * (π sa.1 sa.2).toReal) =
      ∑ s, μ s * M.optimalValue hγ s :=
  sorry

end FiniteMDP

/-! ## Layer 6: stochastic approximation -/

section StochasticApproximation

variable {Ω : Type*} {m₀ : MeasurableSpace Ω} {P : Measure Ω} [IsProbabilityMeasure P]

/-- 6.1: the scalar noise lemma with random step sizes. -/
theorem ae_tendsto_zero_noise {ℱ : Filtration ℕ m₀} {α w W : ℕ → Ω → ℝ} {C W₀ : ℝ}
    (hα : StronglyAdapted ℱ α) (hα0 : ∀ t ω, 0 ≤ α t ω) (hα1 : ∀ t ω, α t ω ≤ 1)
    (hw : ∀ t, StronglyMeasurable[ℱ (t + 1)] (w t)) (hw2 : ∀ t, MemLp (w t) 2 P)
    (hmean : ∀ t, P[w t | ℱ t] =ᵐ[P] 0) (hvar : ∀ t, P[fun ω ↦ w t ω ^ 2 | ℱ t] ≤ᵐ[P] fun _ ↦ C)
    (hdiv : ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω)
    (hsq : ∀ᵐ ω ∂P, Summable fun t ↦ α t ω ^ 2)
    (hW0 : W 0 = fun _ ↦ W₀) (hW : ∀ t ω, W (t + 1) ω = (1 - α t ω) * W t ω + α t ω * w t ω) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ W t ω) atTop (𝓝 0) :=
  sorry

/-- The weighted max norm `max_i |x i| / ξ i`. -/
def weightedMaxNorm {ι : Type*} [Fintype ι] [Nonempty ι] (ξ : ι → ℝ) (x : ι → ℝ) : ℝ :=
  univ.sup' univ_nonempty fun i ↦ |x i| / ξ i

/-- 6.2: Tsitsiklis's asynchronous stochastic approximation for weighted max-norm contractions. -/
theorem ae_tendsto_asyncSA {ι : Type*} [Fintype ι] [Nonempty ι] {ℱ : Filtration ℕ m₀}
    {ξ : ι → ℝ} (hξ : ∀ i, 0 < ξ i) {F : (ι → ℝ) → ι → ℝ} {β : ℝ} (hβ : β < 1)
    (hF : ∀ x y, weightedMaxNorm ξ (F x - F y) ≤ β * weightedMaxNorm ξ (x - y))
    {xstar : ι → ℝ} (hfix : F xstar = xstar)
    {x : ℕ → Ω → ι → ℝ} {α w : ℕ → Ω → ι → ℝ} {A B : ℝ} {x₀ : ι → ℝ}
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω i, 0 ≤ α t ω i ∧ α t ω i ≤ 1)
    (hdiv : ∀ i, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω i)
    (hsq : ∀ i, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω i ^ 2)
    (hw : ∀ t, StronglyMeasurable[ℱ (t + 1)] (w t)) (hw2 : ∀ t i, MemLp (fun ω ↦ w t ω i) 2 P)
    (hmean : ∀ t i, P[fun ω ↦ w t ω i | ℱ t] =ᵐ[P] 0)
    (hvar : ∀ t i, P[fun ω ↦ w t ω i ^ 2 | ℱ t] ≤ᵐ[P]
      fun ω ↦ A + B * weightedMaxNorm ξ (x t ω) ^ 2)
    (hx0 : x 0 = fun _ ↦ x₀)
    (hx : ∀ t ω i, x (t + 1) ω i = x t ω i + α t ω i * (F (x t ω) i - x t ω i + w t ω i)) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ x t ω) atTop (𝓝 xstar) :=
  sorry

variable [MeasurableSpace S] [DiscreteMeasurableSpace S] [MeasurableSpace A]
  [DiscreteMeasurableSpace A]

/-- 6.3: tabular Q-learning converges almost surely to the optimal Q-function. -/
theorem qLearning_ae_tendsto (M : FiniteMDP S A) {γ : ℝ≥0} (hγ : γ < 1) {ℱ : Filtration ℕ m₀}
    (st : ℕ → Ω → S) (at' : ℕ → Ω → A) (snext : ℕ → Ω → S) (α : ℕ → Ω → S × A → ℝ)
    (q : ℕ → Ω → S × A → ℝ) (q₀ : S × A → ℝ)
    (hst : ∀ t, Measurable[ℱ t] (st t)) (hat : ∀ t, Measurable[ℱ t] (at' t))
    (hsn : ∀ t, Measurable[ℱ (t + 1)] (snext t))
    (htrans : ∀ t s', P[(snext t ⁻¹' {s'}).indicator 1 | ℱ t] =ᵐ[P]
      fun ω ↦ (M.trans (st t ω) (at' t ω) s').toReal)
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω sa, 0 ≤ α t ω sa ∧ α t ω sa ≤ 1)
    (hvisit : ∀ t ω sa, sa ≠ (st t ω, at' t ω) → α t ω sa = 0)
    (hdiv : ∀ sa, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω sa)
    (hsq : ∀ sa, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω sa ^ 2)
    (hq0 : q 0 = fun _ ↦ q₀)
    (hq : ∀ t ω sa, q (t + 1) ω sa = q t ω sa + α t ω sa *
      (M.reward sa.1 sa.2 + γ * univ.sup' univ_nonempty (fun b ↦ q t ω (snext t ω, b))
        - q t ω sa)) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ q t ω) atTop
      (𝓝 (ContractingWith.fixedPoint (M.qBellman γ) (M.contractingWith_qBellman hγ))) :=
  sorry

/-- 6.4: tabular TD(0) converges almost surely to the value of the policy. -/
theorem td0_ae_tendsto (M : FiniteMDP S A) {γ : ℝ≥0} (hγ : γ < 1) (π : S → PMF A)
    {ℱ : Filtration ℕ m₀} (st : ℕ → Ω → S) (at' : ℕ → Ω → A) (snext : ℕ → Ω → S)
    (α : ℕ → Ω → S → ℝ) (v : ℕ → Ω → S → ℝ) (v₀ : S → ℝ)
    (hst : ∀ t, Measurable[ℱ t] (st t)) (hat : ∀ t, Measurable[ℱ (t + 1)] (at' t))
    (hsn : ∀ t, Measurable[ℱ (t + 1)] (snext t))
    (hlaw : ∀ t a s', P[((fun ω ↦ (at' t ω, snext t ω)) ⁻¹' {(a, s')}).indicator 1 | ℱ t] =ᵐ[P]
      fun ω ↦ (π (st t ω) a).toReal * (M.trans (st t ω) a s').toReal)
    (hα : StronglyAdapted ℱ α) (hα01 : ∀ t ω s, 0 ≤ α t ω s ∧ α t ω s ≤ 1)
    (hvisit : ∀ t ω s, s ≠ st t ω → α t ω s = 0)
    (hdiv : ∀ s, ∀ᵐ ω ∂P, ¬ Summable fun t ↦ α t ω s)
    (hsq : ∀ s, ∀ᵐ ω ∂P, Summable fun t ↦ α t ω s ^ 2)
    (hv0 : v 0 = fun _ ↦ v₀)
    (hv : ∀ t ω s, v (t + 1) ω s = v t ω s + α t ω s *
      (M.reward s (at' t ω) + γ * v t ω (snext t ω) - v t ω s)) :
    ∀ᵐ ω ∂P, Tendsto (fun t ↦ v t ω) atTop (𝓝 (M.value hγ π)) :=
  sorry

end StochasticApproximation

end TauCetiRoadmap.MarkovDecisionProcesses

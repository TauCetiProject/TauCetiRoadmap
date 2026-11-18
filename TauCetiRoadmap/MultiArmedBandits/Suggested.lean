import Mathlib

/-!
# Multi-armed bandits, regret bounds and lower bounds: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: Mathlib `Kernel.trajMeasure`,
`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`,
`Kernel.condDistrib_trajMeasure`, `MeasureTheory.IsProjectiveLimit.unique`, `Kernel.compProd`,
`Kernel.prodMkLeft`, `Kernel.ofFunOfCountable`, `Kernel.deterministic`,
`Kernel.lintegral_compProd`, `MeasureTheory.Measure.lintegral_compProd`,
`MeasureTheory.Measure.integral_compProd`, `DependsOn`, `HasSubgaussianMGF`,
`HasSubgaussianMGF.measure_ge_le`, `HasSubgaussianMGF.neg`, `HasSubgaussianMGF.integrable`,
`klDiv`, `klDiv_map_le`, `gaussianReal`,
`integral_id_gaussianReal`, `mgf_id_gaussianReal` and `Real.add_one_le_exp`; Tau Ceti
`TauCeti.klDiv_compProd_eq_add_lintegral` and `TauCeti.klDiv_compProd_right`;
MathematicalStatisticsFoundations 9.2, and MathematicalStatisticsNonparametric 1.3
(`klDiv_gaussianReal`) and 1.4 (`half_exp_neg_klDiv_le`).
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset InformationTheory Preorder
open scoped NNReal ENNReal

namespace TauCetiRoadmap.MultiArmedBandits

/-! ## Layer 1: policies, environments and regret -/

/-- 1.1: a history-dependent randomized policy on the arm set `ι` with real rewards: the law
`first` of the arm of round `0` and, for each `n`, a Markov kernel `next n` choosing the arm of
round `n + 1` from the arms and rewards of rounds `0, …, n`. -/
structure Policy (ι : Type*) [MeasurableSpace ι] where
  first : Measure ι
  next : (n : ℕ) → Kernel (Π _ : Iic n, ι × ℝ) ι
  isProbabilityMeasure_first : IsProbabilityMeasure first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

section Interaction

variable {ι : Type*} [MeasurableSpace ι]

/-- 1.1: the law on `ℕ → ι × ℝ` of the interaction of the policy `π` with the environment whose
reward in round `t` is drawn from `ρ t` at the arm played, by the Ionescu-Tulcea construction
`Kernel.trajMeasure`. -/
def envLaw (ρ : ℕ → Kernel ι ℝ) [∀ t, IsMarkovKernel (ρ t)] (π : Policy ι) :
    Measure (ℕ → ι × ℝ) :=
  haveI := π.isProbabilityMeasure_first
  haveI := π.isMarkovKernel_next
  Kernel.trajMeasure (X := fun _ ↦ ι × ℝ) (π.first ⊗ₘ ρ 0)
    (fun n ↦ π.next n ⊗ₖ (ρ (n + 1)).prodMkLeft (Π _ : Iic n, ι × ℝ))

/-- 1.1: two policies with the same first law whose kernels agree at almost every history of
the first have the same law of the interaction. -/
theorem envLaw_congr (ρ : ℕ → Kernel ι ℝ) [∀ t, IsMarkovKernel (ρ t)] {π π' : Policy ι}
    (hfirst : π.first = π'.first)
    (hnext : ∀ n, ∀ᵐ h ∂((envLaw ρ π).map (fun ω : ℕ → ι × ℝ ↦ frestrictLe n ω)),
      π.next n h = π'.next n h) :
    envLaw ρ π = envLaw ρ π' :=
  sorry

/-- 1.1: the policy `π` plays in the sets `S`: its first arm lies in `S 0 ω` and, for every
trajectory `ω`, its arm of round `n + 1` after the history `frestrictLe n ω` lies in
`S (n + 1) ω`, both with probability one. The condition is imposed at every history, reachable
or not. -/
def Policy.PlaysIn (π : Policy ι) (S : ℕ → (ℕ → ι × ℝ) → Set ι) : Prop :=
  (∀ ω, π.first (S 0 ω) = 1) ∧ ∀ n ω, π.next n (frestrictLe n ω) (S (n + 1) ω) = 1

/-- 1.1: if `π` plays in the sets `S` then, almost surely, every arm played lies in its set. No
measurability of `S` is assumed. -/
theorem ae_forall_mem_of_playsIn [Countable ι] [MeasurableSingletonClass ι]
    (ρ : ℕ → Kernel ι ℝ) [∀ t, IsMarkovKernel (ρ t)] (π : Policy ι)
    {S : ℕ → (ℕ → ι × ℝ) → Set ι} (hπ : π.PlaysIn S) :
    ∀ᵐ ω ∂(envLaw ρ π), ∀ t, (ω t).1 ∈ S t ω :=
  sorry

end Interaction

variable {ι : Type*} [MeasurableSpace ι] [MeasurableSingletonClass ι]

/-- 1.2: the reward kernel `a ↦ ν a` of a stochastic bandit. -/
def rewardKernel [Countable ι] (ν : ι → ProbabilityMeasure ℝ) : Kernel ι ℝ :=
  Kernel.ofFunOfCountable fun a ↦ (ν a : Measure ℝ)

/-- 1.2: the reward kernel of a stochastic bandit is a Markov kernel. -/
instance isMarkovKernel_rewardKernel [Countable ι] (ν : ι → ProbabilityMeasure ℝ) :
    IsMarkovKernel (rewardKernel ν) :=
  ⟨fun a ↦ (inferInstance : IsProbabilityMeasure (ν a : Measure ℝ))⟩

/-- 1.2: the law of the interaction of the policy `π` with the stochastic bandit `ν`. -/
def banditLaw [Countable ι] (ν : ι → ProbabilityMeasure ℝ) (π : Policy ι) : Measure (ℕ → ι × ℝ) :=
  envLaw (fun _ ↦ rewardKernel ν) π

/-- 1.2: the mean reward of arm `a`. -/
def mean (ν : ι → ProbabilityMeasure ℝ) (a : ι) : ℝ := ∫ x, x ∂(ν a : Measure ℝ)

/-- 1.2: the suboptimality gap of arm `a`. -/
def gap [Fintype ι] [Nonempty ι] (ν : ι → ProbabilityMeasure ℝ) (a : ι) : ℝ :=
  univ.sup' univ_nonempty (mean ν) - mean ν a

/-- 1.2: the number of rounds before `t` in which arm `a` is played. -/
def pullCount [DecidableEq ι] (a : ι) (t : ℕ) (ω : ℕ → ι × ℝ) : ℕ :=
  ((range t).filter fun s ↦ (ω s).1 = a).card

/-- 1.2: the empirical mean of the rewards of arm `a` in the rounds before `t`, with value `0`
when the arm has not been played. -/
def empMean [DecidableEq ι] (a : ι) (t : ℕ) (ω : ℕ → ι × ℝ) : ℝ :=
  (∑ s ∈ range t, if (ω s).1 = a then (ω s).2 else 0) / pullCount a t ω

/-- 1.3: the regret of `π` on `ν` after `n` rounds. -/
def regret [Fintype ι] [Nonempty ι] (ν : ι → ProbabilityMeasure ℝ) (π : Policy ι) (n : ℕ) : ℝ :=
  n * univ.sup' univ_nonempty (mean ν) - ∫ ω, ∑ t ∈ range n, (ω t).2 ∂(banditLaw ν π)

/-- 1.3: the regret decomposition. -/
theorem regret_eq_sum_gap_mul_integral_pullCount [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ)
    (hν : ∀ a, Integrable (fun x : ℝ ↦ x) (ν a : Measure ℝ)) (π : Policy ι) (n : ℕ) :
    regret ν π n = ∑ a, gap ν a * ∫ ω, (pullCount a n ω : ℝ) ∂(banditLaw ν π) :=
  sorry

/-! ## Layer 2: concentration under adaptive sampling -/

/-- 2.1: a sum of reward noises with predictable weights supported on arms whose centred laws
are `c`-sub-Gaussian is `c * V`-sub-Gaussian when the squared weights sum to at most `V`. -/
theorem hasSubgaussianMGF_weightedNoise [Countable ι]
    (ν : ι → ProbabilityMeasure ℝ) (π : Policy ι) {c : ℝ≥0}
    {s : Set ι} (hν : ∀ a ∈ s, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ))
    {g : ℕ → (ℕ → ι × ℝ) → ι → ℝ} (hg : ∀ t a, Measurable fun ω ↦ g t ω a)
    (hdep : ∀ t a, DependsOn (fun ω ↦ g t ω a) (Set.Iio t))
    (hs : ∀ t ω, ∀ a ∉ s, g t ω a = 0) (n : ℕ) {V : ℝ≥0}
    (hV : ∀ ω, ∑ t ∈ range n, g t ω (ω t).1 ^ 2 ≤ V) :
    HasSubgaussianMGF
      (fun ω ↦ ∑ t ∈ range n, g t ω (ω t).1 * ((ω t).2 - mean ν (ω t).1)) (c * V)
      (banditLaw ν π) :=
  sorry

/-- 2.2: the sum of the rewards of the first `m` plays of arm `a` among the rounds before `t`. -/
def prefixSum [DecidableEq ι] (a : ι) (m t : ℕ) (ω : ℕ → ι × ℝ) : ℝ :=
  ∑ s ∈ range t, if (ω s).1 = a ∧ pullCount a s ω < m then (ω s).2 else 0

/-- 2.2: with probability at least `1 - n * exp (-L)`, the empirical mean of an arm with
`c`-sub-Gaussian centred law plus `√(2 c L / T)` is at least its mean at every time up to `n`
at which the arm has been played. -/
theorem measureReal_exists_empMean_add_sqrt_lt_le [Countable ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ)
    (π : Policy ι) {c : ℝ≥0} (a : ι)
    (hν : HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ)) (L : ℝ) (n : ℕ) :
    (banditLaw ν π).real {ω | ∃ t ≤ n, pullCount a t ω ≠ 0 ∧
        empMean a t ω + √(2 * c * L / pullCount a t ω) < mean ν a} ≤ n * Real.exp (-L) :=
  sorry

/-! ## Layer 3: regret upper bounds -/

/-- 3.1: `π` is an explore-then-commit policy with `m` exploration plays per arm: while some arm
has fewer than `m` plays it plays such an arm, and afterwards it plays an arm whose first `m`
rewards have the largest sum. -/
def IsETC [DecidableEq ι] (m : ℕ) (π : Policy ι) : Prop :=
  π.PlaysIn fun t ω ↦ {a | pullCount a t ω < m ∨
    ((∀ b, m ≤ pullCount b t ω) ∧ ∀ b, prefixSum b m t ω ≤ prefixSum a m t ω)}

/-- 3.1: the regret of explore-then-commit on a `c`-sub-Gaussian bandit. -/
theorem etc_regret_le [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ)) (π : Policy ι)
    {m n : ℕ} (hπ : IsETC m π) (hmn : m * Fintype.card ι ≤ n) :
    regret ν π n ≤ m * ∑ a, gap ν a +
      ((n : ℝ) - m * Fintype.card ι) * ∑ a, gap ν a * Real.exp (-(m * gap ν a ^ 2) / (4 * c)) :=
  sorry

/-- 3.2: the upper confidence index of arm `a` at time `t`, with variance proxy `c` and
confidence level `δ`; it is `⊤` when the arm has not been played. -/
def ucbIndex [DecidableEq ι] (c : ℝ≥0) (δ : ℝ) (a : ι) (t : ℕ) (ω : ℕ → ι × ℝ) : EReal :=
  if pullCount a t ω = 0 then ⊤
  else ((empMean a t ω + √(2 * c * Real.log (1 / δ) / pullCount a t ω) : ℝ) : EReal)

/-- 3.2: `π` is a UCB policy: in every round it plays an arm of largest index. -/
def IsUCB [DecidableEq ι] (c : ℝ≥0) (δ : ℝ) (π : Policy ι) : Prop :=
  π.PlaysIn fun t ω ↦ {a | ∀ b, ucbIndex c δ b t ω ≤ ucbIndex c δ a t ω}

/-- 3.2: the gap-dependent regret bound of UCB with `δ = 1 / n ^ 2`. -/
theorem ucb_regret_le [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ)) (π : Policy ι)
    (n : ℕ) (hπ : IsUCB c (1 / (n : ℝ) ^ 2) π) :
    regret ν π n ≤ 3 * ∑ a, gap ν a +
      ∑ a ∈ univ.filter (fun a ↦ 0 < gap ν a), 16 * c * Real.log n / gap ν a :=
  sorry

/-- 3.3: the gap-free regret bound of UCB with `δ = 1 / n ^ 2`. -/
theorem ucb_regret_le_sqrt [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ)) (π : Policy ι)
    (n : ℕ) (hπ : IsUCB c (1 / (n : ℝ) ^ 2) π) :
    regret ν π n ≤ 8 * √(c * n * Fintype.card ι * Real.log n) + 3 * ∑ a, gap ν a :=
  sorry

/-! ## Layer 4: lower bounds -/

/-- 4.1: the divergence decomposition for the laws of the first `n` rounds. -/
theorem klDiv_map_restrict_banditLaw [Fintype ι] [DecidableEq ι] (ν ν' : ι → ProbabilityMeasure ℝ)
    (π : Policy ι) (n : ℕ) :
    klDiv ((banditLaw ν π).map (Finset.restrict (range n)))
        ((banditLaw ν' π).map (Finset.restrict (range n))) =
      ∑ a, (∫⁻ ω, (pullCount a n ω : ℝ≥0∞) ∂(banditLaw ν π)) *
        klDiv (ν a : Measure ℝ) (ν' a : Measure ℝ) :=
  sorry

/-- 4.2: the Gaussian bandit with means `μ` and common variance `v`. -/
def gaussianBandit (μ : ι → ℝ) (v : ℝ≥0) : ι → ProbabilityMeasure ℝ :=
  fun a ↦ ⟨gaussianReal (μ a) v, inferInstance⟩

/-- 4.2: the minimax lower bound for Gaussian bandits. -/
theorem exists_le_regret_gaussianBandit [Fintype ι] [Nonempty ι] (π : Policy ι) (v : ℝ≥0) {n : ℕ}
    (hn : Fintype.card ι ≤ n + 1) :
    ∃ μ : ι → ℝ, (∀ a, μ a ∈ Set.Icc 0 √(v : ℝ)) ∧
      √(v * ((Fintype.card ι : ℝ) - 1) * n) / 27 ≤ regret (gaussianBandit μ v) π n :=
  sorry

/-- 4.3: `π` is consistent over the class `E` of bandits: its regret on every member is
`o (n ^ p)` for every `p > 0`. -/
def IsConsistent [Fintype ι] [Nonempty ι]
    (E : Set (ι → ProbabilityMeasure ℝ)) (π : Policy ι) : Prop :=
  ∀ ν ∈ E, ∀ p : ℝ, 0 < p → Tendsto (fun n : ℕ ↦ regret ν π n / (n : ℝ) ^ p) atTop (𝓝 0)

/-- 4.3: the Lai-Robbins lower bound on the expected number of plays of an arm. -/
theorem lai_robbins [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) (π : Policy ι) (a : ι)
    (Q : ProbabilityMeasure ℝ)
    (hν : ∀ b, b ≠ a → Integrable (fun x : ℝ ↦ x) (ν b : Measure ℝ))
    (hQ : Integrable (fun x : ℝ ↦ x) (Q : Measure ℝ))
    (hmean : ∀ b, b ≠ a → mean ν b < ∫ x, x ∂(Q : Measure ℝ))
    (hπ : IsConsistent {Function.update ν a Q} π)
    (hkl : klDiv (ν a : Measure ℝ) (Q : Measure ℝ) ≠ ∞) {r : ℝ}
    (hr : r * (klDiv (ν a : Measure ℝ) (Q : Measure ℝ)).toReal < 1) :
    ∀ᶠ n : ℕ in atTop, r * Real.log n ≤ ∫ ω, (pullCount a n ω : ℝ) ∂(banditLaw ν π) :=
  sorry

/-! ## Layer 5: adversarial bandits -/

/-- 5.1: the regret of `π` after `n` rounds against the reward table `x`, the reward of round
`t` being `x t a` at the arm `a` played. -/
def advRegret [Fintype ι] [Nonempty ι] (x : ℕ → ι → ℝ) (π : Policy ι) (n : ℕ) : ℝ :=
  univ.sup' univ_nonempty (fun a ↦ ∑ t ∈ range n, x t a) -
    ∫ ω, ∑ t ∈ range n, (ω t).2
      ∂(envLaw (fun t ↦ Kernel.deterministic (x t) (measurable_of_countable _)) π)

/-- 5.2: the cumulative loss-based importance-weighted reward estimates of Exp3 with learning
rate `η` after the rounds before `t`. -/
def exp3Est [Fintype ι] [DecidableEq ι] (η : ℝ) : ℕ → (ℕ → ι × ℝ) → ι → ℝ
  | 0 => fun _ _ ↦ 0
  | t + 1 => fun ω a ↦ exp3Est η t ω a + 1 -
      if (ω t).1 = a then
        (1 - (ω t).2) * (∑ b, Real.exp (η * exp3Est η t ω b)) / Real.exp (η * exp3Est η t ω a)
      else 0

/-- 5.2: the sampling probability of arm `a` in round `t` under Exp3. -/
def exp3Prob [Fintype ι] [DecidableEq ι] (η : ℝ) (t : ℕ) (ω : ℕ → ι × ℝ) (a : ι) : ℝ :=
  Real.exp (η * exp3Est η t ω a) / ∑ b, Real.exp (η * exp3Est η t ω b)

/-- 5.2: `π` is the Exp3 policy with learning rate `η`. -/
def IsExp3 [Fintype ι] [DecidableEq ι] (η : ℝ) (π : Policy ι) : Prop :=
  (∀ a, π.first {a} = ENNReal.ofReal (Fintype.card ι : ℝ)⁻¹) ∧
    ∀ n ω a, π.next n (frestrictLe n ω) {a} = ENNReal.ofReal (exp3Prob η (n + 1) ω a)

/-- 5.3: the regret of Exp3 with learning rate `η > 0` against rewards in `[0, 1]`. -/
theorem exp3_advRegret_le [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (x : ℕ → ι → ℝ) (π : Policy ι) {η : ℝ} (hη : 0 < η)
    (hπ : IsExp3 η π) (n : ℕ) (hx : ∀ t < n, ∀ a, x t a ∈ Set.Icc (0 : ℝ) 1) :
    advRegret x π n ≤
      Real.log (Fintype.card ι) / η + η * n * Fintype.card ι / 2 :=
  sorry

/-- 5.3: the regret of Exp3 with the learning rate tuned to the horizon. -/
theorem exp3_advRegret_le_sqrt [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (x : ℕ → ι → ℝ) (π : Policy ι) (n : ℕ)
    (hπ : IsExp3 (√(2 * Real.log (Fintype.card ι) / (n * Fintype.card ι))) π)
    (hx : ∀ t < n, ∀ a, x t a ∈ Set.Icc (0 : ℝ) 1) :
    advRegret x π n ≤ √(2 * n * Fintype.card ι * Real.log (Fintype.card ι)) :=
  sorry

end TauCetiRoadmap.MultiArmedBandits

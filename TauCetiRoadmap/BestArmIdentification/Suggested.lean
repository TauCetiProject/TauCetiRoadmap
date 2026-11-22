import Mathlib

/-!
# Best-arm identification: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's API lists, routes and Checks are not
restated.

The bandit model is that of the roadmap MultiArmedBandits: `Policy`, `envLaw`,
`Policy.PlaysIn`, `rewardKernel` with its instance, `banditLaw`, `mean`, `gap`, `pullCount`,
`prefixSum` and `gaussianBandit` are copied verbatim from its sections 1.1, 1.2, 2.2 and 4.2,
with their `variable` lines, because a roadmap's file does not import another roadmap's module.

Suppliers used by the README and not restated here: MultiArmedBandits 1.1
(`ae_forall_mem_of_playsIn`), 2.1 (`hasSubgaussianMGF_weightedNoise`) and 4.1
(`klDiv_map_restrict_banditLaw`); MathematicalStatisticsNonparametric 1.3 (`klDiv_gaussianReal`,
`ofReal_klBin_le_klDiv`) and 1.4 (`half_exp_neg_klDiv_le`); Mathlib
`HasSubgaussianMGF.measure_ge_le`, `hasSubgaussianMGF_of_mem_Icc`, `klDiv_of_not_ac`,
`klDiv_self`, `Measure.map_apply`, `mul_meas_ge_le_lintegral₀` and `Nat.clog`; Tau Ceti
`MeasureTheory.etvDist_le_two_mul_iff`.

The guarantee of Hyperband (Li, Jamieson, DeSalvo, Rostamizadeh and Talwalkar 2018, Theorem 5)
is not a headline of this roadmap: its constant is only specified as `exp (O (max α β))` and its
rate carries unspecified polylogarithmic factors, so it has no exact statement.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset InformationTheory Preorder
open scoped NNReal ENNReal

namespace TauCetiRoadmap.BestArmIdentification

/-! ## Layer 1: the bandit model, halving schedules and uniform allocation -/

/-- 1.1: a history-dependent randomized policy on the arm set `ι` with real rewards: the law
`first` of the arm of round `0` and, for each `n`, a Markov kernel `next n` choosing the arm of
round `n + 1` from the arms and rewards of rounds `0, …, n` (copied verbatim from
MultiArmedBandits 1.1). -/
structure Policy (ι : Type*) [MeasurableSpace ι] where
  first : Measure ι
  next : (n : ℕ) → Kernel (Π _ : Iic n, ι × ℝ) ι
  isProbabilityMeasure_first : IsProbabilityMeasure first
  isMarkovKernel_next : ∀ n, IsMarkovKernel (next n)

section Interaction

variable {ι : Type*} [MeasurableSpace ι]

/-- 1.1: the law on `ℕ → ι × ℝ` of the interaction of the policy `π` with the environment whose
reward in round `t` is drawn from `ρ t` at the arm played (copied verbatim from
MultiArmedBandits 1.1). -/
def envLaw (ρ : ℕ → Kernel ι ℝ) [∀ t, IsMarkovKernel (ρ t)] (π : Policy ι) :
    Measure (ℕ → ι × ℝ) :=
  haveI := π.isProbabilityMeasure_first
  haveI := π.isMarkovKernel_next
  Kernel.trajMeasure (X := fun _ ↦ ι × ℝ) (π.first ⊗ₘ ρ 0)
    (fun n ↦ π.next n ⊗ₖ (ρ (n + 1)).prodMkLeft (Π _ : Iic n, ι × ℝ))

/-- 1.1: the policy `π` plays in the sets `S`: its first arm lies in `S 0 ω` and, for every
trajectory `ω`, its arm of round `n + 1` after the history `frestrictLe n ω` lies in
`S (n + 1) ω`, both with probability one (copied verbatim from MultiArmedBandits 1.1). -/
def Policy.PlaysIn (π : Policy ι) (S : ℕ → (ℕ → ι × ℝ) → Set ι) : Prop :=
  (∀ ω, π.first (S 0 ω) = 1) ∧ ∀ n ω, π.next n (frestrictLe n ω) (S (n + 1) ω) = 1

end Interaction

variable {ι : Type*} [MeasurableSpace ι] [MeasurableSingletonClass ι]

/-- 1.1: the reward kernel `a ↦ ν a` of a stochastic bandit (copied verbatim from
MultiArmedBandits 1.2). -/
def rewardKernel [Countable ι] (ν : ι → ProbabilityMeasure ℝ) : Kernel ι ℝ :=
  Kernel.ofFunOfCountable fun a ↦ (ν a : Measure ℝ)

/-- 1.1: the reward kernel of a stochastic bandit is a Markov kernel (copied verbatim from
MultiArmedBandits 1.2). -/
instance isMarkovKernel_rewardKernel [Countable ι] (ν : ι → ProbabilityMeasure ℝ) :
    IsMarkovKernel (rewardKernel ν) :=
  ⟨fun a ↦ (inferInstance : IsProbabilityMeasure (ν a : Measure ℝ))⟩

/-- 1.1: the law of the interaction of the policy `π` with the stochastic bandit `ν` (copied
verbatim from MultiArmedBandits 1.2). -/
def banditLaw [Countable ι] (ν : ι → ProbabilityMeasure ℝ) (π : Policy ι) : Measure (ℕ → ι × ℝ) :=
  envLaw (fun _ ↦ rewardKernel ν) π

/-- 1.1: the mean reward of arm `a` (copied verbatim from MultiArmedBandits 1.2). -/
def mean (ν : ι → ProbabilityMeasure ℝ) (a : ι) : ℝ := ∫ x, x ∂(ν a : Measure ℝ)

/-- 1.1: the suboptimality gap of arm `a` (copied verbatim from MultiArmedBandits 1.2). -/
def gap [Fintype ι] [Nonempty ι] (ν : ι → ProbabilityMeasure ℝ) (a : ι) : ℝ :=
  univ.sup' univ_nonempty (mean ν) - mean ν a

/-- 1.1: the number of rounds before `t` in which arm `a` is played (copied verbatim from
MultiArmedBandits 1.2). -/
def pullCount [DecidableEq ι] (a : ι) (t : ℕ) (ω : ℕ → ι × ℝ) : ℕ :=
  ((range t).filter fun s ↦ (ω s).1 = a).card

/-- 1.1: the sum of the rewards of the first `m` plays of arm `a` among the rounds before `t`
(copied verbatim from MultiArmedBandits 2.2). -/
def prefixSum [DecidableEq ι] (a : ι) (m t : ℕ) (ω : ℕ → ι × ℝ) : ℝ :=
  ∑ s ∈ range t, if (ω s).1 = a ∧ pullCount a s ω < m then (ω s).2 else 0

/-- 1.1: the Gaussian bandit with means `μ` and common variance `v` (copied verbatim from
MultiArmedBandits 4.2). -/
def gaussianBandit (μ : ι → ℝ) (v : ℝ≥0) : ι → ProbabilityMeasure ℝ :=
  fun a ↦ ⟨gaussianReal (μ a) v, inferInstance⟩

/-- 1.2: the number `⌈k / 2 ^ ℓ⌉` of arms left after `ℓ` halvings of `k` arms, each halving
keeping `⌈m / 2⌉` of `m` arms. -/
def halvingSize (k ℓ : ℕ) : ℕ := (k + 2 ^ ℓ - 1) / 2 ^ ℓ

/-- 1.2: the first round of phase `ℓ` of a halving schedule on `k` arms in which every arm
still present in phase `j` is played `T j` times. -/
def phaseStart (k : ℕ) (T : ℕ → ℕ) (ℓ : ℕ) : ℕ := ∑ j ∈ range ℓ, halvingSize k j * T j

/-- 1.2: the sum of the rewards of arm `a` in the rounds `u ≤ s < v`. -/
def phaseSum [DecidableEq ι] (a : ι) (u v : ℕ) (ω : ℕ → ι × ℝ) : ℝ :=
  ∑ s ∈ Ico u v, if (ω s).1 = a then (ω s).2 else 0

/-- 1.2: the number of rounds `u ≤ s < t` in which arm `a` is played. -/
def phaseCount [DecidableEq ι] (a : ι) (u t : ℕ) (ω : ℕ → ι × ℝ) : ℕ :=
  ((Ico u t).filter fun s ↦ (ω s).1 = a).card

/-- 1.2: `(π, ψ)` follows a halving schedule with `L` phases and `T ℓ` plays per arm in phase
`ℓ`, with surviving sets `A ℓ ω`: the sets start with all arms, each keeps `⌈m / 2⌉` of the `m`
arms of the previous one, namely arms whose phase sums are at least those of every eliminated
arm (ties broken in any way); membership in `A ℓ` is measurable and depends only on the rounds
before phase `ℓ`; in phase `ℓ` the policy plays only arms of `A ℓ ω` with fewer than `T ℓ` plays
in that phase; and the recommendation `ψ ω` lies in the last set. -/
structure IsSequentialHalving [Fintype ι] [DecidableEq ι] (L : ℕ) (T : ℕ → ℕ)
    (A : ℕ → (ℕ → ι × ℝ) → Finset ι) (π : Policy ι) (ψ : (ℕ → ι × ℝ) → ι) : Prop where
  first_eq : ∀ ω, A 0 ω = univ
  subset : ∀ ℓ < L, ∀ ω, A (ℓ + 1) ω ⊆ A ℓ ω
  card_succ : ∀ ℓ < L, ∀ ω, (A (ℓ + 1) ω).card = ((A ℓ ω).card + 1) / 2
  top : ∀ ℓ < L, ∀ ω, ∀ a ∈ A (ℓ + 1) ω, ∀ b ∈ A ℓ ω \ A (ℓ + 1) ω,
    phaseSum b (phaseStart (Fintype.card ι) T ℓ) (phaseStart (Fintype.card ι) T (ℓ + 1)) ω ≤
      phaseSum a (phaseStart (Fintype.card ι) T ℓ) (phaseStart (Fintype.card ι) T (ℓ + 1)) ω
  measurableSet : ∀ ℓ ≤ L, ∀ a, MeasurableSet {ω | a ∈ A ℓ ω}
  dependsOn : ∀ ℓ ≤ L, ∀ a,
    DependsOn (fun ω ↦ a ∈ A ℓ ω) (Set.Iio (phaseStart (Fintype.card ι) T ℓ))
  playsIn : π.PlaysIn fun t ω ↦ {a | ∀ ℓ < L, phaseStart (Fintype.card ι) T ℓ ≤ t →
    t < phaseStart (Fintype.card ι) T (ℓ + 1) →
      a ∈ A ℓ ω ∧ phaseCount a (phaseStart (Fintype.card ι) T ℓ) t ω < T ℓ}
  mem_last : ∀ ω, ψ ω ∈ A L ω

/-- 1.3: `(π, ψ)` is uniform allocation with `m` plays per arm: in the first `K m` rounds the
policy plays only arms with fewer than `m` plays, and `ψ` recommends an arm whose `m` rewards
have the largest sum (ties broken in any way). -/
def IsUniformAllocation [Fintype ι] [DecidableEq ι] (m : ℕ) (π : Policy ι)
    (ψ : (ℕ → ι × ℝ) → ι) : Prop :=
  π.PlaysIn (fun t ω ↦ {a | t < Fintype.card ι * m → pullCount a t ω < m}) ∧
    ∀ ω b, prefixSum b m (Fintype.card ι * m) ω ≤ prefixSum (ψ ω) m (Fintype.card ι * m) ω

/-- 1.3: the misidentification probability of uniform allocation on a `c`-sub-Gaussian bandit. -/
theorem measureReal_gap_pos_le_of_isUniformAllocation [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ))
    {m : ℕ} {π : Policy ι} {ψ : (ℕ → ι × ℝ) → ι} (h : IsUniformAllocation m π ψ) :
    (banditLaw ν π).real {ω | 0 < gap ν (ψ ω)} ≤
      ∑ a ∈ univ.filter (fun a ↦ 0 < gap ν a), Real.exp (-(m * gap ν a ^ 2) / (4 * c)) :=
  sorry

/-! ## Layer 2: sequential halving -/

/-- 2.1: the complexity `H₂ = max_i (i + 1) / Δ_i²` of a bandit on `Fin k` whose arms are
listed in decreasing order of mean; an arm of gap `0` contributes `0`. -/
def complexityH2 {k : ℕ} [NeZero k] (ν : Fin k → ProbabilityMeasure ℝ) : ℝ :=
  univ.sup' univ_nonempty fun i : Fin k ↦ ((i : ℕ) + 1 : ℝ) / gap ν i ^ 2

/-- 2.1: the misidentification probability of a halving schedule with arbitrary numbers of
plays per phase, on a `c`-sub-Gaussian bandit with `k ≤ 2 ^ L` arms in decreasing order of
mean. -/
theorem measureReal_gap_pos_le_of_isSequentialHalving {k L : ℕ} [NeZero k] (hkL : k ≤ 2 ^ L)
    (ν : Fin k → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ))
    (hmono : Antitone (mean ν)) {T : ℕ → ℕ} {A : ℕ → (ℕ → Fin k × ℝ) → Finset (Fin k)}
    {π : Policy (Fin k)} {ψ : (ℕ → Fin k × ℝ) → Fin k} (h : IsSequentialHalving L T A π ψ) :
    (banditLaw ν π).real {ω | 0 < gap ν (ψ ω)} ≤
      3 * ∑ ℓ ∈ range L, Real.exp (-((T ℓ * ((halvingSize k ℓ + 3) / 4 + 1) : ℕ) : ℝ) /
        (4 * c * complexityH2 ν)) :=
  sorry

/-- 2.2: sequential halving with budget `n` on `2 ^ L` arms, when `2 ^ L * L` divides `n`. -/
theorem measureReal_gap_pos_le_sequentialHalving {L n : ℕ} (hn : 2 ^ L * L ∣ n)
    (ν : Fin (2 ^ L) → ProbabilityMeasure ℝ) {c : ℝ≥0}
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ))
    (hmono : Antitone (mean ν)) {A : ℕ → (ℕ → Fin (2 ^ L) × ℝ) → Finset (Fin (2 ^ L))}
    {π : Policy (Fin (2 ^ L))} {ψ : (ℕ → Fin (2 ^ L) × ℝ) → Fin (2 ^ L)}
    (h : IsSequentialHalving L (fun ℓ ↦ n / (L * 2 ^ (L - ℓ))) A π ψ) :
    (banditLaw ν π).real {ω | 0 < gap ν (ψ ω)} ≤
      3 * L * Real.exp (-(n : ℝ) / (16 * c * L * complexityH2 ν)) :=
  sorry

/-! ## Layer 3: successive halving on deterministic loss sequences -/

/-- 3.1: `γ⁻¹ y`, the first index `t` with `γ t < y` (strict), and `0` if there is none. -/
def envelopeInv (γ : ℕ → ℝ) (y : ℝ) : ℕ := sInf {t | γ t < y}

/-- 3.1: successive halving with budget `B` on `n` arms with loss sequences `loss i`:
`L = ⌈log₂ n⌉` rounds; the sets start with all arms; round `j` compares the losses
`loss i r` at `r = B / (|S j| L)` and keeps `⌈|S j| / 2⌉` arms whose losses are at most those of
every discarded arm (ties broken in any way). -/
structure IsSuccessiveHalving {n : ℕ} (loss : Fin n → ℕ → ℝ) (B : ℕ) (S : ℕ → Finset (Fin n)) :
    Prop where
  first_eq : S 0 = univ
  subset : ∀ j < Nat.clog 2 n, S (j + 1) ⊆ S j
  card_succ : ∀ j < Nat.clog 2 n, (S (j + 1)).card = ((S j).card + 1) / 2
  bottom : ∀ j < Nat.clog 2 n, ∀ a ∈ S (j + 1), ∀ b ∈ S j \ S (j + 1),
    loss a (B / ((S j).card * Nat.clog 2 n)) ≤ loss b (B / ((S j).card * Nat.clog 2 n))

/-- 3.1: the guarantee of successive halving for loss sequences that converge to limits `ν` at
the rate of an antitone envelope `γ` tending to `0`: every arm of the last set has a limit within
`ε / 2` of that of arm `0`. No order of the arms is assumed; listed in increasing order of limit,
arm `0` is a best arm. -/
theorem limit_sub_le_of_isSuccessiveHalving {n : ℕ} [NeZero n] {loss : Fin n → ℕ → ℝ}
    {ν : Fin n → ℝ} {γ : ℕ → ℝ} (hγ : Antitone γ)
    (hγ0 : Tendsto γ atTop (𝓝 0)) (hdev : ∀ i t, |loss i t - ν i| ≤ γ t) {ε : ℝ} (hε : 0 < ε)
    {B : ℕ} (hB : 2 * Nat.clog 2 n * (univ.erase 0).sup (fun i : Fin n ↦
      ((i : ℕ) + 1) * (1 + envelopeInv γ (max (ε / 4) ((ν i - ν 0) / 2)))) < B)
    {S : ℕ → Finset (Fin n)} (hS : IsSuccessiveHalving loss B S) {i : Fin n}
    (hi : i ∈ S (Nat.clog 2 n)) :
    ν i - ν 0 ≤ ε / 2 :=
  sorry

/-! ## Layer 4: median elimination -/

/-- 4.1: the number of plays per arm in phase `ℓ` of median elimination with accuracy `ε`,
confidence `δ` and variance proxy `c`: `⌈(16 c / ε_ℓ²) log (3 / δ_ℓ)⌉` with
`ε_ℓ = (3/4)^ℓ ε / 4` and `δ_ℓ = δ / 2^(ℓ+1)`. -/
def medianEliminationPlays (c : ℝ≥0) (ε δ : ℝ) (ℓ : ℕ) : ℕ :=
  ⌈16 * c / ((3 / 4) ^ ℓ * ε / 4) ^ 2 * Real.log (3 * 2 ^ (ℓ + 1) / δ)⌉₊

/-- 4.1: median elimination is `(ε, δ)`-correct on a `c`-sub-Gaussian bandit with `c > 0`, and
its schedule ends after at most `(256 c 2^L / ε²)(9 log (3/δ) + 81 log 2) + 2 · 2^L` rounds,
where `L = ⌈log₂ K⌉`. -/
theorem medianElimination [Fintype ι] [Nonempty ι] [DecidableEq ι]
    (ν : ι → ProbabilityMeasure ℝ) {c : ℝ≥0} (hc : 0 < c)
    (hν : ∀ a, HasSubgaussianMGF (fun x ↦ x - mean ν a) c (ν a : Measure ℝ))
    {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) (hδ1 : δ ≤ 1) {A : ℕ → (ℕ → ι × ℝ) → Finset ι}
    {π : Policy ι} {ψ : (ℕ → ι × ℝ) → ι}
    (h : IsSequentialHalving (Nat.clog 2 (Fintype.card ι)) (medianEliminationPlays c ε δ) A π ψ) :
    (banditLaw ν π).real {ω | ε < gap ν (ψ ω)} ≤ δ ∧
      (phaseStart (Fintype.card ι) (medianEliminationPlays c ε δ)
          (Nat.clog 2 (Fintype.card ι)) : ℝ) ≤
        256 * c * 2 ^ Nat.clog 2 (Fintype.card ι) / ε ^ 2 *
            (9 * Real.log (3 / δ) + 81 * Real.log 2) + 2 * 2 ^ Nat.clog 2 (Fintype.card ι) :=
  sorry

/-! ## Layer 5: lower bounds by change of measure -/

/-- 5.1: change of measure at a fixed budget: an event of the first `n` rounds that has
probability at least `1 - δ` under `ν` and at most `δ` under `ν'`, with `δ ≤ 1/2`, forces the
expected divergence `Σ_a E_ν[T_a(n)] KL(ν a, ν' a)` to be at least
`(1 - 2δ) log ((1 - δ) / δ)`. -/
theorem ofReal_mul_log_le_sum_lintegral_pullCount_mul_klDiv [Fintype ι] [DecidableEq ι]
    (ν ν' : ι → ProbabilityMeasure ℝ) (π : Policy ι) (n : ℕ)
    {E : Set (range n → ι × ℝ)} (hE : MeasurableSet E) {δ : ℝ} (hδ : δ ≤ 1 / 2)
    (h : 1 - δ ≤ (banditLaw ν π).real (Finset.restrict (range n) ⁻¹' E))
    (h' : (banditLaw ν' π).real (Finset.restrict (range n) ⁻¹' E) ≤ δ) :
    ENNReal.ofReal ((1 - 2 * δ) * Real.log ((1 - δ) / δ)) ≤
      ∑ a, (∫⁻ ω, (pullCount a n ω : ℝ≥0∞) ∂(banditLaw ν π)) *
        klDiv (ν a : Measure ℝ) (ν' a : Measure ℝ) :=
  sorry

/-- 5.2: the fixed-budget lower bound for Gaussian bandits: for every policy and every
measurable recommendation from the first `n` rounds there is a Gaussian bandit of variance
`v > 0` whose best arm beats every other by at least `Δ > 0`, on which the recommendation is
suboptimal with probability at least `exp (-2 n Δ² / ((K - 1) v)) / 4`. -/
theorem exists_le_measureReal_gap_pos_gaussianBandit [Fintype ι] [Nonempty ι]
    (hK : 2 ≤ Fintype.card ι) (π : Policy ι) (n : ℕ) (ψ : (range n → ι × ℝ) → ι)
    (hψ : Measurable ψ) {v : ℝ≥0} (hv : v ≠ 0) {Δ : ℝ} (hΔ : 0 < Δ) :
    ∃ μ : ι → ℝ, (∃ a, ∀ b ≠ a, μ b + Δ ≤ μ a) ∧
      Real.exp (-(2 * n * Δ ^ 2) / ((Fintype.card ι - 1) * v)) / 4 ≤
        (banditLaw (gaussianBandit μ v) π).real
          {ω | 0 < gap (gaussianBandit μ v) (ψ (Finset.restrict (range n) ω))} :=
  sorry

end TauCetiRoadmap.BestArmIdentification

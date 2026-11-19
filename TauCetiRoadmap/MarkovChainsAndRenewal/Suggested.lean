import Mathlib
import TauCeti.Probability.Process.MarkovChain
import TauCeti.Probability.MarkovChain.Period
import TauCeti.Probability.Renewal.Measure
import TauCeti.Probability.Renewal.Count
import TauCeti.Probability.Renewal.Equation
import TauCeti.Probability.Renewal.Excess

/-!
# Markov chains and renewal processes: target signatures

This file is not the roadmap: the roadmap is `README.md`, which is definitive and carries every
target, its API and its Checks. This file states the roadmap's headline theorems against the
pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the few definitions they need:
the first-return time and the mean return time of a state, and lattice laws on `ℝ≥0`.

The headline theorems stated here are the ergodic theorem for occupation frequencies (§2.4),
the characterization of positive recurrence by invariant probabilities with Kac's formula, the
finite case and the singleton test for detailed balance (§3.1, §3.2), convergence to equilibrium
in total variation and the vanishing of the transition masses in the null recurrent and transient
cases (§3.5), the central limit theorem for renewal counts (§5.2), Blackwell's renewal theorem in
the lattice and the nonlattice case (§5.3, §5.4), the key renewal theorem (§6.3) and the limiting
law of the excess life (§6.4). Every headline theorem of the roadmap is statable at the pins.

The recurrence criterion by the Green function, the elementary renewal theorem and existence and
uniqueness for the renewal equation are proved at the Tau Ceti pin
(`ProbabilityTheory.Kernel.tsum_pow_apply_singleton_self_eq_top_iff`,
`MeasureTheory.Measure.tendsto_renewalFunction_div`,
`TauCeti.Probability.eq_renewalConv_renewalMeasure`) and are not restated. The connections with
the homogeneous Poisson process (Layer 7) are not headline theorems of the roadmap.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter TauCeti.Probability
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.MarkovChainsAndRenewal

/-! ## Layer 2: State classification and occupation -/

section Chains

variable {S : Type*} [MeasurableSpace S] [Countable S]
  [MeasurableSingletonClass S] [Nonempty S]
  (κ : Kernel S S) [IsMarkovKernel κ]

/-- The first return time `T_x⁺ = inf {n ≥ 1 | X n = x}` of a path to `x`, as opposed to the
entrance time at time zero; it is `⊤` when the path never returns. -/
def firstReturn (x : S) : (ℕ → S) → WithTop ℕ :=
  hittingAfter (fun n (w : ℕ → S) => w n) {x} 1

/-- The mean return time `m_x = 𝔼_x T_x⁺`, an extended expectation: a path that never returns
contributes `⊤`, so nonreturn with positive probability gives `m_x = ⊤`. -/
def meanReturn (x : S) : ℝ≥0∞ :=
  ∫⁻ w, (if h : firstReturn x w = ⊤ then ⊤
    else ((firstReturn x w).untop h : ℝ≥0∞)) ∂
    (TauCeti.Probability.markovChainLaw (Measure.dirac x) κ)

/-- **The ergodic theorem for occupation frequencies** (README §2.4). For every initial
probability `ν` and every state `y`, almost surely the fraction of the times `1, …, n` spent at
`y` tends to `(m_y)⁻¹`, read as a real number (zero when `m_y = ⊤`), on the event that the chain
reaches `y`, and to zero off it. No irreducibility or aperiodicity is assumed. -/
theorem ae_tendsto_occupation_div (ν : Measure S) [IsProbabilityMeasure ν] (y : S) :
    ∀ᵐ w ∂(markovChainLaw ν κ),
      Tendsto (fun n : ℕ =>
          (∑ k ∈ Finset.Icc 1 n, ({y} : Set S).indicator (fun _ => (1 : ℝ)) (w k)) / n)
        atTop
        (𝓝 (if hittingAfter (fun n (w : ℕ → S) => w n) {y} 0 w = ⊤ then 0
          else (meanReturn κ y)⁻¹.toReal)) := by
  sorry

/-! ## Layer 3: Equilibrium and coupling -/

/-- The singleton test for Mathlib's detailed-balance predicate on a countable state space
(README §3.1). -/
theorem isReversible_iff_singletons (π : Measure S) [IsProbabilityMeasure π] :
    κ.IsReversible π ↔ ∀ x y : S, π {x} * κ x {y} = π {y} * κ y {x} := by
  sorry

/-- **Positive recurrence and invariant probabilities** (README §3.2). An irreducible chain on a
countable state space has an invariant probability exactly when every state has finite mean
return time. -/
theorem exists_invariant_probability_iff [Kernel.IsIrreducible Measure.count κ] :
    (∃ π : Measure S, IsProbabilityMeasure π ∧ κ.Invariant π) ↔ ∀ x, meanReturn κ x < ⊤ := by
  sorry

/-- **Kac's formula** (README §3.2). An invariant probability of an irreducible chain gives each
state the reciprocal of its mean return time; no aperiodicity hypothesis is needed. -/
theorem invariant_mass_eq_inv_meanReturn (π : Measure S) [IsProbabilityMeasure π]
    [Kernel.IsIrreducible Measure.count κ] (hπ : κ.Invariant π) (x : S) :
    π {x} = (meanReturn κ x)⁻¹ := by
  sorry

/-- An irreducible chain on a finite state space has exactly one invariant probability
(README §3.2). -/
theorem existsUnique_invariant_probability [Finite S] [Kernel.IsIrreducible Measure.count κ] :
    ∃! π : Measure S, IsProbabilityMeasure π ∧ κ.Invariant π := by
  sorry

/-- **Convergence to equilibrium** (README §3.5). For an irreducible aperiodic chain with an
invariant probability `π`, the law at time `n` from any initial probability converges to `π` in
Mathlib's total variation distance, which takes values in `[0, 2]` on probability measures. -/
theorem tendsto_tvDist_comp_pow [Kernel.IsIrreducible Measure.count κ] (hκ : κ.IsAperiodic)
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (ν : Measure S) [IsProbabilityMeasure ν] :
    Tendsto (fun n : ℕ => tvDist ((κ ^ n) ∘ₘ ν) π) atTop (𝓝 0) := by
  sorry

/-- **The null recurrent and transient cases** (README §3.5). For an irreducible aperiodic chain
with no invariant probability, the probability of being at any fixed state at time `n` tends to
zero, from any initial probability. -/
theorem tendsto_comp_pow_apply_singleton_of_not_exists_invariant
    [Kernel.IsIrreducible Measure.count κ] (hκ : κ.IsAperiodic)
    (hπ : ¬ ∃ π : Measure S, IsProbabilityMeasure π ∧ κ.Invariant π)
    (ν : Measure S) [IsProbabilityMeasure ν] (y : S) :
    Tendsto (fun n : ℕ => ((κ ^ n) ∘ₘ ν) {y}) atTop (𝓝 0) := by
  sorry

end Chains

/-! ## Layer 5: Renewal limits -/

section Renewals

/-- `a` is a span of the law `μ` on `ℝ≥0`: `a > 0` and `μ` is carried by the multiples of `a`
(README §5.3). No translation is allowed, renewal processes starting at zero. -/
def IsLatticeSpan (μ : Measure ℝ≥0) (a : ℝ≥0) : Prop :=
  0 < a ∧ ∀ᵐ x ∂μ, ∃ n : ℕ, x = n * a

/-- A law on `ℝ≥0` is lattice when it has a span (README §5.3); otherwise it is nonlattice. -/
def IsLattice (μ : Measure ℝ≥0) : Prop :=
  ∃ a, IsLatticeSpan μ a

/-- **The central limit theorem for renewal counts** (README §5.2). For independent identically
distributed increments with finite second moment, mean `m` and variance `σ² > 0`, the normalized
count `(N_t - t / m) / (σ √(t / m³))` converges in distribution to a standard Gaussian as
`t → ∞`. -/
theorem tendstoInDistribution_renewalCountNat
    {Ω Ω' : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']
    (P : Measure Ω) [IsProbabilityMeasure P] (P' : Measure Ω') [IsProbabilityMeasure P']
    (T : ℕ → Ω → ℝ≥0) (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hid : ∀ n, IdentDistrib (T n) (T 0) P P)
    (h2 : MemLp (fun ω => (T 0 ω : ℝ)) 2 P)
    (hvar : 0 < variance (fun ω => (T 0 ω : ℝ)) P)
    {Z : Ω' → ℝ} (hZ : HasLaw Z (gaussianReal 0 1) P') :
    TendstoInDistribution
      (fun (t : ℝ≥0) ω =>
        ((renewalCountNat T t ω : ℝ) - t / P[fun ω => (T 0 ω : ℝ)]) /
          (Real.sqrt (variance (fun ω => (T 0 ω : ℝ)) P) *
            Real.sqrt (t / P[fun ω => (T 0 ω : ℝ)] ^ 3)))
      atTop Z (fun _ => P) P' := by
  sorry

/-- **Blackwell's renewal theorem, lattice case** (README §5.3). If `a` is the maximal span of
the increment law `μ`, the renewal function grows over `(a n, a (n + 1)]` by `a / 𝔼 μ` in the
limit, read as zero for infinite mean. -/
theorem tendsto_renewalFunction_lattice (μ : Measure ℝ≥0) [IsProbabilityMeasure μ]
    {a : ℝ≥0} (ha : IsLatticeSpan μ a) (hmax : ∀ b, IsLatticeSpan μ b → b ≤ a) :
    Tendsto (fun n : ℕ =>
        (μ.renewalFunction (a * (n + 1))).toReal - (μ.renewalFunction (a * n)).toReal)
      atTop (𝓝 (a * (∫⁻ x, (x : ℝ≥0∞) ∂μ)⁻¹.toReal)) := by
  sorry

/-- **Blackwell's renewal theorem, nonlattice case** (README §5.4). For a nonlattice increment
law `μ` and every `h ≥ 0`, the renewal function grows over `(t, t + h]` by `h / 𝔼 μ` in the
limit `t → ∞`, read as zero for infinite mean. -/
theorem tendsto_renewalFunction_add_sub (μ : Measure ℝ≥0) [IsProbabilityMeasure μ]
    (hμ : ¬ IsLattice μ) (h : ℝ≥0) :
    Tendsto (fun t : ℝ≥0 =>
        (μ.renewalFunction (t + h)).toReal - (μ.renewalFunction t).toReal)
      atTop (𝓝 (h * (∫⁻ x, (x : ℝ≥0∞) ∂μ)⁻¹.toReal)) := by
  sorry

/-! ## Layer 6: Renewal equations and excess life -/

/-- **The key renewal theorem** (README §6.3). For a nonlattice increment law `μ` with renewal
measure `U`, and a nonnegative nonincreasing Lebesgue-integrable `h` on the half-line, the
convolution of `h` with `U - δ₀ = μ ∗ U` converges to `(𝔼 μ)⁻¹ ∫₀^∞ h`, read as zero for
infinite mean. -/
theorem tendsto_renewalConv_conv_renewalMeasure (μ : Measure ℝ≥0) [IsProbabilityMeasure μ]
    (hμ : ¬ IsLattice μ) {h : ℝ≥0 → ℝ} (h0 : ∀ s, 0 ≤ h s) (hmono : Antitone h)
    (hint : IntegrableOn (fun s : ℝ => h s.toNNReal) (Set.Ici 0)) :
    Tendsto (fun t => renewalConv h (μ ∗ μ.renewalMeasure) t) atTop
      (𝓝 ((∫⁻ x, (x : ℝ≥0∞) ∂μ)⁻¹.toReal * ∫ s in Set.Ici (0 : ℝ), h s.toNNReal)) := by
  sorry

/-- **The limiting law of the excess life** (README §6.4). For independent identically
distributed increments with nonlattice law and finite mean `m`, the excess `E_t` at time `t`
satisfies `P(E_t ≤ x) → m⁻¹ ∫₀ˣ P(T > s) ds` for every `x ≥ 0`. -/
theorem tendsto_measureReal_renewalExcess_le {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (T : ℕ → Ω → ℝ≥0) (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hid : ∀ n, IdentDistrib (T n) (T 0) P P) (hlat : ¬ IsLattice (P.map (T 0)))
    (hmean : ∫⁻ ω, (T 0 ω : ℝ≥0∞) ∂P < ⊤) (x : ℝ≥0) :
    Tendsto (fun t : ℝ≥0 => P.real {ω | renewalExcess T t ω ≤ x}) atTop
      (𝓝 ((∫⁻ ω, (T 0 ω : ℝ≥0∞) ∂P).toReal⁻¹ *
        ∫ s in (0 : ℝ)..(x : ℝ), P.real {ω | s < (T 0 ω : ℝ)})) := by
  sorry

end Renewals

end TauCetiRoadmap.MarkovChainsAndRenewal

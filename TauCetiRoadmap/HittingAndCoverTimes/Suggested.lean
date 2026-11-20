import Mathlib
import TauCeti.Probability.Kernel.Matrix
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Hitting and cover times of finite Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

The chain is a Markov kernel `κ` on a type `S` with measurable singletons, its path law is Tau
Ceti's `markovChainLaw`, and hitting times are Mathlib's `hittingAfter` of the coordinate process
with start index `0`. Mean hitting and cover times are lower integrals in `ℝ≥0∞`, so a time that
is infinite with positive probability has infinite mean.

Some definitions are verbatim copies of definitions of other roadmaps, made in this namespace
because a roadmap's file cannot import another roadmap's module: the network, its walk and its
voltage (ElectricalNetworksAndRandomWalks 1.1 and 2.1), the transition matrix, the distance to
stationarity and the mixing time (MarkovChainMixing 2.1, 1.2 and 1.3), and the stationary and
fundamental matrices (MCMCAsymptoticVariance 1.1).
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability Finset
open scoped ENNReal

namespace TauCetiRoadmap.HittingAndCoverTimes

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Layer 1: mean hitting times and their linear equations -/

/-- 1.1 The mean hitting time `E_ν τ_A` of a set `A` by the chain with initial law `ν`, where
`τ_A` is the first time `n ≥ 0` with `X_n ∈ A` and `⊤` if there is none. -/
def meanHittingTime (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S) (A : Set S) : ℝ≥0∞ :=
  ∫⁻ ω, ENat.toENNReal (hittingAfter (fun n (ω : ℕ → S) => ω n) A 0 ω) ∂markovChainLaw ν κ

/-- 1.2 **Mean hitting times are the least solution of the first-step equations.** On a countable
state space, `x ↦ E_x τ_A` is the least function `h : S → ℝ≥0∞` with `h = 0` on `A` and
`h x = 1 + ∑' y, κ x {y} * h y` for `x ∉ A`. No irreducibility is assumed. -/
theorem isLeast_meanHittingTime [Countable S] (κ : Kernel S S) [IsMarkovKernel κ] (A : Set S) :
    IsLeast {h : S → ℝ≥0∞ | (∀ a ∈ A, h a = 0) ∧ ∀ x ∉ A, h x = 1 + ∑' y, κ x {y} * h y}
      (fun x => meanHittingTime κ (Measure.dirac x) A) := by
  sorry

/-- 1.3 **The linear system for mean hitting times.** On a finite state space, if `A` is
reachable from every state, every `E_x τ_A` is finite, and `x ↦ E_x τ_A` is the unique real
function vanishing on `A` with `h x = 1 + ∑ y, κ(x, y) h y` for `x ∉ A`. -/
theorem meanHittingTime_ne_top_and_eq_iff [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    (A : Set S) (hA : ∀ x, ∃ n : ℕ, 0 < (κ ^ n) x A) :
    (∀ x, meanHittingTime κ (Measure.dirac x) A ≠ ⊤) ∧
      ∀ h : S → ℝ, ((∀ a ∈ A, h a = 0) ∧ ∀ x ∉ A, h x = 1 + ∑ y, (κ x).real {y} * h y) ↔
        h = fun x => (meanHittingTime κ (Measure.dirac x) A).toReal := by
  sorry

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) A network on `V`: a symmetric
nonnegative conductance function. Loops `cond x x` are allowed; a pair `x ≠ y` with
`cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The weight
`c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The graph of the network: `x`
and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The transition law of the
walk at `x`: `y ↦ c(x, y) / c(x)` when `c(x) > 0`, and the point mass at `x` when `c(x) = 0`. -/
def walkPMF (x : V) : PMF V :=
  if hx : 0 < N.weight x then
    PMF.ofFintype (fun y => ENNReal.ofReal (N.cond x y / N.weight x)) (by
      rw [← ENNReal.ofReal_sum_of_nonneg fun y _ => div_nonneg (N.nonneg x y) hx.le,
        ← Finset.sum_div]
      exact (congrArg ENNReal.ofReal (div_self hx.ne')).trans ENNReal.ofReal_one)
  else PMF.pure x

section Walk

variable [MeasurableSpace V] [MeasurableSingletonClass V]

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The random walk of the
network, as a Markov kernel on `V`. -/
def walk : Kernel V V := Kernel.ofPMF N.walkPMF

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The walk is a Markov
kernel. -/
instance : IsMarkovKernel N.walk := by
  unfold walk
  infer_instance

end Walk

variable [DecidableEq V]

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian
`diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian with the row
and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 1.4 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The voltage of the unit
current from `a` to `z`, grounded at `z`: the column of `a` of the inverse of the grounded
Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 1.4 **The hitting time identity.** On a connected network, the mean time for the walk
started at `a` to hit `z` is `∑ x, c(x) v(x)`, where `v` is the voltage of the unit current from
`a` to `z` grounded at `z`. -/
theorem meanHittingTime_walk_eq_sum [MeasurableSpace V] [MeasurableSingletonClass V]
    (hN : N.graph.Connected) (a z : V) :
    meanHittingTime N.walk (Measure.dirac a) {z} =
      ENNReal.ofReal (∑ x, N.weight x * N.voltage a z x) := by
  sorry

end Network

/-! ## Layer 2: the fundamental matrix and stationary starts -/

/-- 2.1 (copied verbatim from MarkovChainMixing 2.1) The real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 2.1 (copied verbatim from MCMCAsymptoticVariance 1.1) The matrix `Π` all of whose rows are
the law `π`, `Π x y = π {y}`. -/
def stationaryMatrix (π : Measure S) : Matrix S S ℝ :=
  Matrix.of fun _ y ↦ π.real {y}

/-- 2.1 (copied verbatim from MCMCAsymptoticVariance 1.1) The fundamental matrix
`Z = (I − P + Π)⁻¹ − Π` of a chain with stationary law `π`. -/
def fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S) :
    Matrix S S ℝ :=
  (1 - transitionMatrix κ + stationaryMatrix π)⁻¹ - stationaryMatrix π

/-- 2.1 **The mean hitting time formula.** For an irreducible chain on a finite state space with
stationary law `π`, `π(y) E_x τ_y = Z y y − Z x y` for all states `x`, `y`; in particular every
mean hitting time is finite. The chain may be periodic. -/
theorem meanHittingTime_dirac_eq [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (x y : S) :
    meanHittingTime κ (Measure.dirac x) {y} =
      ENNReal.ofReal ((fundamentalMatrix κ π y y - fundamentalMatrix κ π x y) / π.real {y}) := by
  sorry

/-- 2.2 **Hitting from stationarity.** For an irreducible chain on a finite state space with
stationary law `π`, `π(x) E_π τ_x = Z x x`. -/
theorem meanHittingTime_stationary_eq [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (x : S) :
    meanHittingTime κ π {x} = ENNReal.ofReal (fundamentalMatrix κ π x x / π.real {x}) := by
  sorry

/-- 2.3 **The random target lemma.** For an irreducible chain on a finite state space with
stationary law `π`, the target time `∑ y, π(y) E_x τ_y` is the trace of the fundamental matrix,
whatever the starting state `x`. -/
theorem sum_mul_meanHittingTime_eq_trace [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) (x : S) :
    ∑ y, π {y} * meanHittingTime κ (Measure.dirac x) {y} =
      ENNReal.ofReal (fundamentalMatrix κ π).trace := by
  sorry

/-- 2.4 **The cycle identity.** For an irreducible chain on a finite state space, reversible with
respect to a probability `π`, `E_a τ_b + E_b τ_c + E_c τ_a = E_a τ_c + E_c τ_b + E_b τ_a`. -/
theorem meanHittingTime_cycle [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.IsReversible π) (a b c : S) :
    meanHittingTime κ (Measure.dirac a) {b} + meanHittingTime κ (Measure.dirac b) {c} +
        meanHittingTime κ (Measure.dirac c) {a} =
      meanHittingTime κ (Measure.dirac a) {c} + meanHittingTime κ (Measure.dirac c) {b} +
        meanHittingTime κ (Measure.dirac b) {a} := by
  sorry

/-! ## Layer 3: hitting times bound mixing times -/

/-- 3.1 (copied verbatim from MarkovChainMixing 1.2) The distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 3.1 (copied verbatim from MarkovChainMixing 1.3) The mixing time `t_mix(ε)`, the least `t`
with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

/-- 3.1 **Mixing is bounded by hitting from stationarity.** For a lazy chain on a finite state
space (`κ(x, {x}) ≥ 1/2` for every `x`), reversible with respect to a probability `π`,
`t_mix(1/4) ≤ 2 max_x E_π τ_x + 1`. -/
theorem mixingTime_le_of_lazy [Fintype S] [Nonempty S] (κ : Kernel S S) [IsMarkovKernel κ]
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.IsReversible π)
    (hlazy : ∀ x, 2⁻¹ ≤ κ x {x}) :
    ENat.toENNReal (mixingTime κ π (1 / 4)) ≤ 2 * (⨆ x, meanHittingTime κ π {x}) + 1 := by
  sorry

/-! ## Layer 4: cover times -/

/-- 4.1 The cover time `τ_cov^A` of a finite set `A` along a path: the first time by which every
state of `A` has been visited, that is, the largest of the hitting times of the points of `A`.
It is `0` for `A = ∅` and `⊤` if some point of `A` is never visited. -/
def coverTime (A : Finset S) (ω : ℕ → S) : WithTop ℕ :=
  A.sup fun y => hittingAfter (fun n (ω : ℕ → S) => ω n) {y} 0 ω

/-- 4.1 The mean cover time `E_ν τ_cov^A` of `A` by the chain with initial law `ν`. -/
def meanCoverTime (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S) (A : Finset S) : ℝ≥0∞ :=
  ∫⁻ ω, ENat.toENNReal (coverTime A ω) ∂markovChainLaw ν κ

/-- 4.2 **Matthews' upper bound.** On a finite state space with `n` states, from every starting
state, `E_x τ_cov ≤ t_hit (1 + 1/2 + ⋯ + 1/(n − 1))`, where `t_hit = max_{a, b} E_a τ_b`. -/
theorem meanCoverTime_le [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ] (x : S) :
    meanCoverTime κ (Measure.dirac x) univ ≤
      (⨆ a, ⨆ b, meanHittingTime κ (Measure.dirac a) {b}) *
        ENNReal.ofReal (harmonic (Fintype.card S - 1) : ℝ) := by
  sorry

/-- 4.3 **Matthews' lower bound.** On a finite state space, for every set `A` of states and every
starting state `x`, `E_x τ_cov^A ≥ t_min^A (1 + 1/2 + ⋯ + 1/(|A| − 1))`, where `t_min^A` is the
least of the `E_a τ_b` over distinct `a`, `b` in `A`. -/
theorem le_meanCoverTime [Fintype S] (κ : Kernel S S) [IsMarkovKernel κ] (x : S)
    (A : Finset S) :
    (⨅ a ∈ A, ⨅ b ∈ A, ⨅ (_ : a ≠ b), meanHittingTime κ (Measure.dirac a) {b}) *
        ENNReal.ofReal (harmonic (A.card - 1) : ℝ) ≤
      meanCoverTime κ (Measure.dirac x) A := by
  sorry

end TauCetiRoadmap.HittingAndCoverTimes

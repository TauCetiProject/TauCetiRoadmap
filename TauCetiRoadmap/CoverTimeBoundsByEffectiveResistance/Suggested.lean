import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Cover time bounds by effective resistance: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

A network on a finite type `V` is a symmetric nonnegative conductance function; loops are
allowed, the weight of a vertex counts its loop once, and connectivity is that of the simple graph
of the pairs `x ≠ y` of positive conductance. The effective resistance is read off the inverse of
the grounded Laplacian; it is `0` when its two arguments agree, and on a disconnected network it
takes the junk value `0`. Mean hitting and cover times are lower integrals in `ℝ≥0∞` of Mathlib's
`hittingAfter` of the coordinate process under Tau Ceti's `markovChainLaw`. A simple graph is a
network whose conductances off the diagonal are `0` or `1`; the statements say which of them allow
loops.

Some definitions are verbatim copies of definitions of other roadmaps, made in this namespace
because a roadmap's file cannot import another roadmap's module: the network, its walk, its
voltages and effective resistance (ElectricalNetworksAndRandomWalks 1.1 and 2.1), and mean
hitting and cover times (HittingAndCoverTimes 1.1 and 4.1). The resistance forms of Matthews'
bounds, consequences of HittingAndCoverTimes 4.2 (`meanCoverTime_le`) and the commute time
identity, are derived in the README and not restated.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability Finset
open scoped ENNReal

namespace TauCetiRoadmap.CoverTimeBoundsByEffectiveResistance

section Times

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1 (copied verbatim from HittingAndCoverTimes 1.1) The mean hitting time `E_ν τ_A` of a set
`A` by the chain with initial law `ν`, where `τ_A` is the first time `n ≥ 0` with `X_n ∈ A` and
`⊤` if there is none. -/
def meanHittingTime (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S) (A : Set S) : ℝ≥0∞ :=
  ∫⁻ ω, ENat.toENNReal (hittingAfter (fun n (ω : ℕ → S) => ω n) A 0 ω) ∂markovChainLaw ν κ

/-- 2.1 (copied verbatim from HittingAndCoverTimes 4.1) The cover time `τ_cov^A` of a finite set
`A` along a path: the first time by which every state of `A` has been visited, that is, the
largest of the hitting times of the points of `A`. It is `0` for `A = ∅` and `⊤` if some point of
`A` is never visited. -/
def coverTime (A : Finset S) (ω : ℕ → S) : WithTop ℕ :=
  A.sup fun y => hittingAfter (fun n (ω : ℕ → S) => ω n) {y} 0 ω

/-- 2.1 (copied verbatim from HittingAndCoverTimes 4.1) The mean cover time `E_ν τ_cov^A` of `A`
by the chain with initial law `ν`. -/
def meanCoverTime (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S) (A : Finset S) : ℝ≥0∞ :=
  ∫⁻ ω, ENat.toENNReal (coverTime A ω) ∂markovChainLaw ν κ

end Times

/-! ## Layer 1: hitting times through effective resistance -/

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) A network on `V`: a symmetric
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

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The weight
`c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The total weight
`c_G = ∑ x, c(x)`; on a network without loops it is twice the sum of the edge conductances. -/
def totalWeight : ℝ := ∑ x, N.weight x

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The graph of the network: `x`
and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The transition law of the
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

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The random walk of the
network, as a Markov kernel on `V`. -/
def walk : Kernel V V := Kernel.ofPMF N.walkPMF

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The walk is a Markov
kernel. -/
instance : IsMarkovKernel N.walk := by
  unfold walk
  infer_instance

end Walk

variable [DecidableEq V]

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian
`diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian with the row
and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The voltage of the unit
current from `a` to `z`, grounded at `z`: the column of `a` of the inverse of the grounded
Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The effective resistance
`R(a ↔ z)`: the voltage at `a` of the unit current from `a` to `z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

/-- 1.1 **The voltage at a third vertex.** On every network, for all vertices `a`, `z` and `x`,
the voltage at `x` of the unit current from `a` to `z`, grounded at `z`, is
`(R(a ↔ z) + R(x ↔ z) − R(a ↔ x)) / 2`. No connectivity is assumed: on a disconnected network both
sides are `0`. The route reads three resistances off the inverse of one grounded Laplacian,
through SpectralSparsification 2.1 (`dotProduct_inv_groundedLaplacian_mulVec`) and
ElectricalNetworksAndRandomWalks 2.5 (`effResistance_comm`). -/
theorem voltage_eq_effResistance (a z x : V) :
    N.voltage a z x = (N.effResistance a z + N.effResistance x z - N.effResistance a x) / 2 := by
  sorry

/-- 1.1 **Tetali's formula.** On a connected network, for all vertices `a` and `z`, the mean time
for the walk started at `a` to hit `z` is `½ ∑ x, c(x) (R(a ↔ z) + R(z ↔ x) − R(x ↔ a))`: the
voltage form of HittingAndCoverTimes 1.4 (`meanHittingTime_walk_eq_sum`) with each voltage
rewritten by `voltage_eq_effResistance`. -/
theorem meanHittingTime_walk_eq_sum_effResistance [MeasurableSpace V]
    [MeasurableSingletonClass V] (hN : N.graph.Connected) (a z : V) :
    meanHittingTime N.walk (Measure.dirac a) {z} =
      ENNReal.ofReal ((1 / 2) * ∑ x, N.weight x *
        (N.effResistance a z + N.effResistance z x - N.effResistance x a)) := by
  sorry

/-- 1.2 **The resistance of an edge from below.** On a connected network whose conductances
between distinct vertices are `0` or `1` (loops of any conductance allowed), every edge `xy`
of conductance `1` has `(c(x) + 1)⁻¹ + (c(y) + 1)⁻¹ ≤ R(x ↔ y)`, where `c(x)` is the weight, the
degree of `x` when there is no loop at `x`. The route tests Dirichlet's principle with one
function and uses the positivity `effResistance_pos` of ElectricalNetworksAndRandomWalks 2.5. -/
theorem inv_add_inv_le_effResistance (hN : N.graph.Connected)
    (hunit : ∀ x y, x ≠ y → N.cond x y = 0 ∨ N.cond x y = 1) {x y : V} (hxy : x ≠ y)
    (hc : N.cond x y = 1) :
    (N.weight x + 1)⁻¹ + (N.weight y + 1)⁻¹ ≤ N.effResistance x y := by
  sorry

/-! ## Layer 2: cover times -/

section Walk

variable [MeasurableSpace V] [MeasurableSingletonClass V]

/-- 2.1 **The spanning tree bound.** For every spanning tree `T` of the graph of a network and
every starting vertex `x`, `E_x τ_cov ≤ c_G ∑_{e ∈ T} R(e)`, the sum over the edges of `T`
written as half the sum over ordered pairs of adjacent vertices of `T`. -/
theorem meanCoverTime_le_sum_effResistance {T : SimpleGraph V} [DecidableRel T.Adj]
    (hT : T.IsTree) (hTN : T ≤ N.graph) (x : V) :
    meanCoverTime N.walk (Measure.dirac x) univ ≤
      ENNReal.ofReal (N.totalWeight *
        ((1 / 2) * ∑ a, ∑ b, if T.Adj a b then N.effResistance a b else 0)) := by
  sorry

omit [DecidableEq V] in
/-- 2.1 **The bound `c_G (n − 1)`.** On a connected network on `n` vertices whose conductances
between distinct vertices are `0` or `1` (loops of any conductance allowed), from every starting
vertex `E_x τ_cov ≤ c_G (n − 1)`; without loops `c_G = 2m` for the number `m` of edges. -/
theorem meanCoverTime_le_totalWeight_mul (hN : N.graph.Connected)
    (hunit : ∀ x y, x ≠ y → N.cond x y = 0 ∨ N.cond x y = 1) (x : V) :
    meanCoverTime N.walk (Measure.dirac x) univ ≤
      ENNReal.ofReal (N.totalWeight * ((Fintype.card V : ℝ) - 1)) := by
  sorry

omit [DecidableEq V] in
/-- 2.2 **Cover times of regular graphs.** For the simple random walk on a connected regular
graph on `n` vertices (conductances `0` or `1`, no loops, every weight equal to the same `d`),
from every starting vertex `E_x τ_cov ≤ 3n²`. -/
theorem meanCoverTime_le_three_mul_sq (hN : N.graph.Connected)
    (hunit : ∀ x y, x ≠ y → N.cond x y = 0 ∨ N.cond x y = 1) (hloop : ∀ x, N.cond x x = 0)
    {d : ℝ} (hreg : ∀ x, N.weight x = d) (x : V) :
    meanCoverTime N.walk (Measure.dirac x) univ ≤ 3 * (Fintype.card V : ℝ≥0∞) ^ 2 := by
  sorry

end Walk

end Network

end TauCetiRoadmap.CoverTimeBoundsByEffectiveResistance

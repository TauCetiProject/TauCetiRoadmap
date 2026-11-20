import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain

/-!
# Electrical networks and random walks: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

A network on a finite type `V` is a symmetric nonnegative conductance function `c : V → V → ℝ`;
loops `c x x` are allowed, edges are the pairs `x ≠ y` with `0 < c x y`, and connectivity is the
connectivity of the simple graph of these edges. The weight of a vertex is `c(x) = ∑ y, c x y`
and the total weight is `c_G = ∑ x, c(x)`. The effective resistance is read off the inverse of the
Laplacian with the row and column of `z` deleted; it is `0` when `a = z`, and on a disconnected
network it takes the junk value `0`. Most statements about it assume connectivity; the three that do
not (symmetry, the triangle inequality and the uniqueness of the minimizing flow) say why they hold
without it. The random walk
moves from `x` to `y` with probability `c x y / c(x)`, and stays put at a vertex of weight `0`. Its
path law is Tau Ceti's `markovChainLaw`, and hitting times are Mathlib's `hittingAfter` of the
coordinate process, with start index `0` for the first entrance and `1` for the first return.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability Finset
open scoped ENNReal

namespace TauCetiRoadmap.ElectricalNetworksAndRandomWalks

/-! ## Layer 1: networks, harmonic functions and the random walk -/

/-- 1.1 A network on `V`: a symmetric nonnegative conductance function. Loops `cond x x` are
allowed; a pair `x ≠ y` with `cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 1.1 The weight `c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.1 The total weight `c_G = ∑ x, c(x)`; on a network without loops it is twice the sum of
the edge conductances. -/
def totalWeight : ℝ := ∑ x, N.weight x

/-- 1.1 The graph of the network: `x` and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.1 The conductance of an unordered pair. -/
def edgeCond : Sym2 V → ℝ := Sym2.lift ⟨N.cond, N.symm⟩

/-- 1.2 `f` is harmonic at `x`: `∑ y, c(x, y) (f y − f x) = 0`, that is, `f x` is the average
of `f` over one step of the walk when `c(x) > 0`. -/
def IsHarmonicAt (f : V → ℝ) (x : V) : Prop := ∑ y, N.cond x y * (f y - f x) = 0

/-- 1.1 The transition law of the walk at `x`: `y ↦ c(x, y) / c(x)` when `c(x) > 0`, and the
point mass at `x` when `c(x) = 0`. -/
def walkPMF (x : V) : PMF V :=
  if hx : 0 < N.weight x then
    PMF.ofFintype (fun y => ENNReal.ofReal (N.cond x y / N.weight x)) (by
      rw [← ENNReal.ofReal_sum_of_nonneg fun y _ => div_nonneg (N.nonneg x y) hx.le,
        ← Finset.sum_div]
      exact (congrArg ENNReal.ofReal (div_self hx.ne')).trans ENNReal.ofReal_one)
  else PMF.pure x

section Walk

variable [MeasurableSpace V] [MeasurableSingletonClass V]

/-- 1.1 The random walk of the network, as a Markov kernel on `V`. -/
def walk : Kernel V V := Kernel.ofPMF N.walkPMF

/-- 1.1 The walk is a Markov kernel. -/
instance : IsMarkovKernel N.walk := by
  unfold walk
  infer_instance

end Walk

/-- 1.2 **The maximum principle.** On a connected network, a function harmonic at every vertex
outside a nonempty set `B` is bounded at every vertex by its value at some point of `B`. -/
theorem exists_mem_le_of_isHarmonicAt (hN : N.graph.Connected) {B : Set V} (hB : B.Nonempty)
    {f : V → ℝ} (hf : ∀ x ∉ B, N.IsHarmonicAt f x) (x : V) : ∃ b ∈ B, f x ≤ f b := by
  sorry

/-- 1.2 **The Dirichlet problem.** On a connected network, every function on a nonempty set `B`
has exactly one extension to `V` that is harmonic at every vertex outside `B`. -/
theorem existsUnique_isHarmonicAt (hN : N.graph.Connected) {B : Set V} (hB : B.Nonempty)
    (φ : V → ℝ) : ∃! f : V → ℝ, (∀ x ∈ B, f x = φ x) ∧ ∀ x ∉ B, N.IsHarmonicAt f x := by
  sorry

section Walk

variable [MeasurableSpace V] [MeasurableSingletonClass V]

/-- 1.3 **Hitting probabilities are harmonic.** The probability that the walk started at `x`
enters `A` strictly before it enters `B` is a harmonic function of `x` outside `A ∪ B`. -/
theorem isHarmonicAt_hitBefore (A B : Set V) {x : V} (hxA : x ∉ A) (hxB : x ∉ B) :
    N.IsHarmonicAt (fun y => (markovChainLaw (Measure.dirac y) N.walk).real
      {ω | hittingAfter (fun n ω => ω n) A 0 ω < hittingAfter (fun n ω => ω n) B 0 ω}) x := by
  sorry

end Walk

/-! ## Layer 2: effective resistance -/

variable [DecidableEq V]

/-- 2.1 The Laplacian `diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 2.1 The Laplacian with the row and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 2.1 The voltage of the unit current from `a` to `z`, grounded at `z`: the column of `a` of the
inverse of the grounded Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 2.1 The effective resistance `R(a ↔ z)`: the voltage at `a` of the unit current from `a` to
`z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

/-- 2.1 **Effective resistance as voltage drop over current.** On a connected network, for every
function `W` harmonic outside `{a, z}` with `W a ≠ W z`, the effective resistance is
`(W a − W z) / ∑ y, c(a, y) (W a − W y)`. -/
theorem effResistance_eq_div (hN : N.graph.Connected) {a z : V} {W : V → ℝ}
    (hW : ∀ x, x ≠ a → x ≠ z → N.IsHarmonicAt W x) (hWaz : W a ≠ W z) :
    N.effResistance a z = (W a - W z) / ∑ y, N.cond a y * (W a - W y) := by
  sorry

/-- 2.2 The Dirichlet energy `½ ∑ x, ∑ y, c(x, y) (f x − f y)²`, each edge counted once. -/
def dirichletEnergy (f : V → ℝ) : ℝ := (1 / 2) * ∑ x, ∑ y, N.cond x y * (f x - f y) ^ 2

/-- 2.2 **Dirichlet's principle.** On a connected network, for `a ≠ z`, the effective conductance
`1 / R(a ↔ z)` is the least Dirichlet energy of a function equal to `1` at `a` and `0` at `z`. -/
theorem isLeast_dirichletEnergy (hN : N.graph.Connected) {a z : V} (haz : a ≠ z) :
    IsLeast (N.dirichletEnergy '' {f | f a = 1 ∧ f z = 0}) (1 / N.effResistance a z) := by
  sorry

/-- 2.3 A unit flow from `a` to `z`: an antisymmetric function on ordered pairs, vanishing where
the conductance vanishes, with divergence `0` outside `{a, z}` and `1` at `a`. -/
structure IsUnitFlow (a z : V) (θ : V → V → ℝ) : Prop where
  /-- The flow is antisymmetric. -/
  antisymm : ∀ x y, θ y x = -θ x y
  /-- The flow vanishes on pairs of conductance `0`. -/
  support : ∀ x y, N.cond x y = 0 → θ x y = 0
  /-- Kirchhoff's node law outside `{a, z}`. -/
  node : ∀ x, x ≠ a → x ≠ z → ∑ y, θ x y = 0
  /-- The flow has strength `1`: its divergence at `a` is `1`. -/
  strength : ∑ y, θ a y = 1

/-- 2.3 The energy `½ ∑ x, ∑ y, θ(x, y)² / c(x, y)` of a flow, each edge counted once. -/
def flowEnergy (θ : V → V → ℝ) : ℝ := (1 / 2) * ∑ x, ∑ y, θ x y ^ 2 / N.cond x y

/-- 2.3 **Thomson's principle.** On a connected network, for `a ≠ z`, the effective resistance is
the least energy of a unit flow from `a` to `z`. -/
theorem isLeast_flowEnergy (hN : N.graph.Connected) {a z : V} (haz : a ≠ z) :
    IsLeast (N.flowEnergy '' {θ | N.IsUnitFlow a z θ}) (N.effResistance a z) := by
  sorry

/-- 2.3 The minimizer in Thomson's principle is the unit current flow
`(x, y) ↦ c(x, y) (v x − v y)` of the voltage `v` of 2.1: a unit flow from `a` to `z` whose
energy is `R(a ↔ z)` is that flow. No connectivity is assumed: on a disconnected network either
no unit flow from `a` to `z` exists or every one has energy above the value `0` that the
effective resistance takes there. -/
theorem eq_current_of_flowEnergy_eq {a z : V} {θ : V → V → ℝ} (hθ : N.IsUnitFlow a z θ) (hE : N.flowEnergy θ = N.effResistance a z) :
    θ = fun x y => N.cond x y * (N.voltage a z x - N.voltage a z y) := by
  sorry

/-- 2.4 **Rayleigh's monotonicity law.** Raising conductances does not raise effective
resistance: if `N` is connected and `c ≤ c'` everywhere, then `R'(a ↔ z) ≤ R(a ↔ z)`. -/
theorem effResistance_le_of_cond_le (N' : Network V) (hN : N.graph.Connected)
    (h : ∀ x y, N.cond x y ≤ N'.cond x y) (a z : V) :
    N'.effResistance a z ≤ N.effResistance a z := by
  sorry

/-- 2.5 Effective resistance is symmetric. No connectivity is assumed: on a disconnected network
every effective resistance is `0`. -/
theorem effResistance_comm (a z : V) :
    N.effResistance a z = N.effResistance z a := by
  sorry

/-- 2.5 Effective resistance between distinct vertices of a connected network is positive. -/
theorem effResistance_pos (hN : N.graph.Connected) {a z : V} (haz : a ≠ z) :
    0 < N.effResistance a z := by
  sorry

/-- 2.5 **The triangle inequality for effective resistance.** No connectivity is assumed: on a
disconnected network every effective resistance is `0`. -/
theorem effResistance_triangle (x y z : V) :
    N.effResistance x z ≤ N.effResistance x y + N.effResistance y z := by
  sorry

/-- 2.6 **The Nash-Williams inequality.** On a connected network, if `cuts k` are pairwise disjoint
sets of unordered pairs, each meeting every walk from `a` to `z` in the graph of the network, then
the sum over `k` of the inverse total conductance of `cuts k` is at most `R(a ↔ z)`. -/
theorem sum_inv_le_effResistance (hN : N.graph.Connected) {a z : V} {ι : Type*} [Fintype ι]
    (cuts : ι → Finset (Sym2 V)) (hdisj : Pairwise fun i j => Disjoint (cuts i) (cuts j))
    (hcut : ∀ i, ∀ p : N.graph.Walk a z, ∃ e ∈ p.edges, e ∈ cuts i) :
    ∑ i, (∑ e ∈ cuts i, N.edgeCond e)⁻¹ ≤ N.effResistance a z := by
  sorry

/-! ## Layer 3: escape probabilities, commute times and Foster's theorem -/

section Walk

variable [MeasurableSpace V] [MeasurableSingletonClass V]

/-- 3.1 **Escape probability.** On a connected network, for `a ≠ z`, the walk started at `a` hits
`z` before returning to `a` with probability `1 / (c(a) R(a ↔ z))`. -/
theorem escapeProb_eq (hN : N.graph.Connected) {a z : V} (haz : a ≠ z) :
    (markovChainLaw (Measure.dirac a) N.walk).real
        {ω | hittingAfter (fun n ω => ω n) {z} 0 ω < hittingAfter (fun n ω => ω n) {a} 1 ω} =
      1 / (N.weight a * N.effResistance a z) := by
  sorry

/-- 3.2 **The commute time identity.** On a connected network,
`E_a τ_b + E_b τ_a = c_G R(a ↔ b)`, where `τ_b` is the first entrance time of `b` and
`c_G = ∑ x, c(x)`. -/
theorem lintegral_hittingAfter_add_lintegral_hittingAfter (hN : N.graph.Connected) (a b : V) :
    ∫⁻ ω, ENat.toENNReal (hittingAfter (fun n ω => ω n) {b} 0 ω)
        ∂markovChainLaw (Measure.dirac a) N.walk +
      ∫⁻ ω, ENat.toENNReal (hittingAfter (fun n ω => ω n) {a} 0 ω)
        ∂markovChainLaw (Measure.dirac b) N.walk =
      ENNReal.ofReal (N.totalWeight * N.effResistance a b) := by
  sorry

end Walk

/-- 3.3 **Foster's theorem.** On a connected network on `n` vertices,
`∑ x, ∑ y, c(x, y) R(x ↔ y) = 2 (n − 1)`; each edge appears twice in the double sum, so the sum
of `c(e) R(e)` over the edges is `n − 1`. -/
theorem sum_cond_mul_effResistance (hN : N.graph.Connected) :
    ∑ x, ∑ y, N.cond x y * N.effResistance x y = 2 * ((Fintype.card V : ℝ) - 1) := by
  sorry

end Network

end TauCetiRoadmap.ElectricalNetworksAndRandomWalks

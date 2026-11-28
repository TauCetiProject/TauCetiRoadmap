import Mathlib
import TauCeti.Probability.Kernel.PMF
import TauCeti.Probability.Process.MarkovChain
import TauCeti.LinearAlgebra.ExteriorPower.Plucker

/-!
# Uniform spanning trees and transfer currents: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. The README's remarks, Examples and Checks
are not restated.

A network on a finite type `V` is a symmetric nonnegative conductance function; loops are allowed,
and connectivity is that of the simple graph of the pairs `x ≠ y` of positive conductance. The
voltage of the unit current from `a` to `z` is read off the inverse of the Laplacian grounded at
`z`; on a disconnected network every voltage takes the junk value `0`. Spanning trees are edge sets
of the graph of the network, weighted by the product of their conductances; the weighted uniform
spanning tree `ust` gives each one its weight divided by the total weight, and it is the zero
measure on a disconnected network, which has no spanning tree.

Some definitions are verbatim copies of definitions of other roadmaps, made in this namespace
because a roadmap's file cannot import another roadmap's module: the network, its walk, its
voltages and effective resistance (ElectricalNetworksAndRandomWalks 1.1 and 2.1), and spanning
trees, rooted forests and forest weights (LaplacianSpectraAndSpanningTrees 2.1). The routes of the
README rest on theorems of other roadmaps that are not restated here, among them
`effResistance_comm` (ElectricalNetworksAndRandomWalks 2.5),
`effResistance_eq_sum_rootedForests_div` (LaplacianSpectraAndSpanningTrees 3.1) and
`voltage_eq_effResistance` (CoverTimeBoundsByEffectiveResistance 1.1), and on Mathlib's
`SimpleGraph.isTree_iff_connected_and_card`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability Finset
open scoped ENNReal

namespace TauCetiRoadmap.UniformSpanningTreesAndTransferCurrents

/-! ## Local copy: LaplacianSpectraAndSpanningTrees, 2.1 -/

namespace SimpleGraph

open _root_.SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

section Layer2

variable (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

open Classical in
/-- 1.1 (copied verbatim from LaplacianSpectraAndSpanningTrees 2.1) The spanning trees of `G`, as
edge sets. -/
def spanningTrees : Finset (Finset (Sym2 V)) :=
  G.edgeFinset.powerset.filter fun F ↦ (fromEdgeSet (F : Set (Sym2 V))).IsTree

open Classical in
/-- 1.1 (copied verbatim from LaplacianSpectraAndSpanningTrees 2.1) The spanning forests rooted at
`R`: acyclic edge sets in which every vertex is joined to exactly one vertex of `R`. -/
def rootedForests (R : Finset V) : Finset (Finset (Sym2 V)) :=
  G.edgeFinset.powerset.filter fun F ↦ (fromEdgeSet (F : Set (Sym2 V))).IsAcyclic ∧
    ∀ v, ∃! r, r ∈ R ∧ (fromEdgeSet (F : Set (Sym2 V))).Reachable v r

/-- 1.1 (copied verbatim from LaplacianSpectraAndSpanningTrees 2.1) The weight `∏_{e ∈ F} w e` of
an edge set. -/
def forestWeight (w : Sym2 V → ℝ) (F : Finset (Sym2 V)) : ℝ := ∏ e ∈ F, w e

end Layer2

end SimpleGraph

/-! ## Local copy: ElectricalNetworksAndRandomWalks, 1.1 and 2.1 -/

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

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The graph of the network: `x`
and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The conductance of an
unordered pair. -/
def edgeCond : Sym2 V → ℝ := Sym2.lift ⟨N.cond, N.symm⟩

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

/-! ## Layer 1: the uniform spanning tree and the transfer-current matrix -/

open Classical in
/-- 1.1 The weighted uniform spanning tree of `N`: the measure on edge sets giving each spanning
tree `T` of the graph of `N` the mass `w(T) / ∑_{T'} w(T')`, where `w(T) = ∏_{e ∈ T} c(e)`. It is
a probability measure exactly when `N` is connected, and the zero measure otherwise. -/
def ust : Measure (Finset (Sym2 V)) :=
  ∑ T ∈ SimpleGraph.spanningTrees N.graph,
    ENNReal.ofReal (SimpleGraph.forestWeight N.edgeCond T /
      ∑ T' ∈ SimpleGraph.spanningTrees N.graph, SimpleGraph.forestWeight N.edgeCond T') •
      Measure.dirac T

/-- 1.1 The transfer current `Y(e, f)` between ordered pairs `e` and `f`: the current
`c(f) (v(f.1) − v(f.2))` across `f`, from `f.1` to `f.2`, when the unit current enters at `e.1`
and leaves at `e.2`, `v` being its voltage. -/
def transferCurrent (e f : V × V) : ℝ :=
  N.cond f.1 f.2 * (N.voltage e.1 e.2 f.1 - N.voltage e.1 e.2 f.2)

/-- 1.2 **The projection identity.** On every network, for ordered pairs `e` and `f`,
`½ ∑_{x, y} Y(e, (x, y)) Y((x, y), f) = Y(e, f)`, the sum running over all ordered pairs, so that
every edge is counted twice. No connectivity is assumed: on a disconnected network every transfer
current is `0`. -/
theorem sum_transferCurrent_mul_transferCurrent (e f : V × V) :
    (1 / 2 : ℝ) * ∑ x, ∑ y, N.transferCurrent e (x, y) * N.transferCurrent (x, y) f =
      N.transferCurrent e f := by
  sorry

/-! ## Layer 2: voltages and currents through trees -/

open Classical in
/-- 2.1 **The voltage through two-component forests.** On every network, for `a ≠ z` and every
vertex `x`, the voltage at `x` of the unit current from `a` to `z` is the weight of the spanning
forests rooted at `{a, z}` in which `x` is joined to `a`, divided by the weight of the spanning
trees. On a disconnected network both sides are `0`. -/
theorem voltage_eq_sum_rootedForests_div {a z : V} (haz : a ≠ z) (x : V) :
    N.voltage a z x =
      (∑ F ∈ (SimpleGraph.rootedForests N.graph {a, z}).filter (fun F : Finset (Sym2 V) =>
          (SimpleGraph.fromEdgeSet (F : Set (Sym2 V))).Reachable x a),
          SimpleGraph.forestWeight N.edgeCond F) /
        ∑ T ∈ SimpleGraph.spanningTrees N.graph, SimpleGraph.forestWeight N.edgeCond T := by
  sorry

open Classical in
/-- 2.2 The signed crossing of the pair `(x, y)` by the path of `T` from `a` to `z`: when
`s(x, y) ∈ T` and `T` is a tree, removing `s(x, y)` leaves two components, and the value is `1`
if `a, x` lie in one and `y, z` in the other, `-1` if `a, y` lie in one and `x, z` in the other,
and `0` otherwise; it is `0` when `s(x, y) ∉ T`. -/
def pathCrossing (T : Finset (Sym2 V)) (a z x y : V) : ℝ :=
  if s(x, y) ∈ T then
    (if (SimpleGraph.fromEdgeSet ((T.erase s(x, y) : Finset (Sym2 V)) : Set (Sym2 V))).Reachable
          a x ∧
        (SimpleGraph.fromEdgeSet ((T.erase s(x, y) : Finset (Sym2 V)) : Set (Sym2 V))).Reachable
          y z then 1 else 0) -
      (if (SimpleGraph.fromEdgeSet ((T.erase s(x, y) : Finset (Sym2 V)) : Set (Sym2 V))).Reachable
          a y ∧
        (SimpleGraph.fromEdgeSet ((T.erase s(x, y) : Finset (Sym2 V)) : Set (Sym2 V))).Reachable
          x z then 1 else 0)
  else 0

/-- 2.2 **Kirchhoff's current theorem.** On every network, for all vertices `a`, `z`, `x`, `y`,
the current across `(x, y)` of the unit current from `a` to `z` is the expected signed crossing
of `(x, y)` by the path from `a` to `z` in the weighted uniform spanning tree. No connectivity is
assumed: on a disconnected network both sides are `0`. -/
theorem transferCurrent_eq_integral_pathCrossing (a z x y : V) :
    N.transferCurrent (a, z) (x, y) = ∫ T, pathCrossing T a z x y ∂N.ust := by
  sorry

end Network

/-! ## Layer 3: determinantal formulas -/

/-- 3.1 **The determinantal identity for projections.** For a real `p × E` matrix `A` with
Plücker coordinates `pl_s(A)`, every set `S ⊆ E` and every `x : E → ℝ`,
`∑_s pl_s(A)² ∏_{e ∈ S} ([e ∈ s] + x_e) = det(A Aᵀ) · det((Aᵀ (A Aᵀ)⁻¹ A + diag x)_{S,S})`.
No hypothesis on `A`: when `A Aᵀ` is singular both sides are `0`. -/
theorem sum_plucker_sq_mul_prod_eq {E : Type*} [Fintype E] [LinearOrder E] {p : ℕ}
    (A : Matrix (Fin p) E ℝ) (S : Finset E) (x : E → ℝ) :
    ∑ s : Set.powersetCard E p,
        TauCeti.plucker A.row s ^ 2 * ∏ e ∈ S, ((if e ∈ (s : Finset E) then 1 else 0) + x e) =
      (A * A.transpose).det *
        ((A.transpose * (A * A.transpose)⁻¹ * A + Matrix.diagonal x).submatrix
          (fun e : S => (e : E)) (fun e : S => (e : E))).det := by
  sorry

namespace Network

variable {V : Type*} [Fintype V] [DecidableEq V] (N : Network V)

/-- 3.2 **The transfer-current theorem** (Burton–Pemantle). On a connected network, for ordered
pairs `e 1, …, e k` with distinct underlying unordered pairs and every `t : Fin k → ℝ`,
`E ∏_i ([s(e i) ∈ T] + t i) = det(Y_e + diag t)` with `Y_e = (Y(e i, e j))`; in particular the
probability that the weighted uniform spanning tree contains every `s(e i)` is `det Y_e`. -/
theorem integral_prod_add_eq_det_and_ust_real_eq_det (hN : N.graph.Connected) {k : ℕ}
    (e : Fin k → V × V) (he : Function.Injective fun i => s((e i).1, (e i).2)) :
    (∀ t : Fin k → ℝ,
      ∫ T, ∏ i, ((if s((e i).1, (e i).2) ∈ T then 1 else 0) + t i) ∂N.ust =
        (Matrix.of (fun i j => N.transferCurrent (e i) (e j)) + Matrix.diagonal t).det) ∧
      N.ust.real {T | ∀ i, s((e i).1, (e i).2) ∈ T} =
        (Matrix.of fun i j => N.transferCurrent (e i) (e j)).det := by
  sorry

/-- 3.3 **Negative correlation of disjoint edge sets.** On every network, for disjoint sets `S₁`,
`S₂` of unordered pairs, the probability that the weighted uniform spanning tree contains
`S₁ ∪ S₂` is at most the product of the probabilities that it contains `S₁` and that it contains
`S₂`. On a disconnected network both sides are `0`. -/
theorem ust_real_union_subset_le {S₁ S₂ : Finset (Sym2 V)} (h : Disjoint S₁ S₂) :
    N.ust.real {T | S₁ ∪ S₂ ⊆ T} ≤ N.ust.real {T | S₁ ⊆ T} * N.ust.real {T | S₂ ⊆ T} := by
  sorry

/-! ## Layer 4: the walk and the tree -/

open Classical in
/-- 4.1 One step of the rooted-tree chain: the root of the edge set `T` moves from `r` to `r'`.
If `r' = r` nothing changes; otherwise `s(r, r')` is added and the edges at `r'` whose removal
separates `r'` from `r` are deleted; when `T` is a spanning tree there is exactly one such edge,
the first edge of the path from `r'` to `r`. -/
def treeStep (T : Finset (Sym2 V)) (r r' : V) : Finset (Sym2 V) :=
  if r' = r then T
  else insert s(r, r') (T.filter fun e =>
    r' ∉ e ∨ (SimpleGraph.fromEdgeSet ((T.erase e : Finset (Sym2 V)) : Set (Sym2 V))).Reachable
      r' r)

open Classical in
/-- 4.1 **The rooted weight is stationary for the rooted-tree chain.** On every network, for every
vertex `r'` and every spanning tree `T'`, the weight `c(r) w(T)` of the rooted spanning trees
`(r, T)`, carried by one step of the chain from `r` to `r'` with conductance `c(r, r')`, adds up
at `(r', T')` to `c(r') w(T')`. -/
theorem sum_cond_mul_forestWeight_treeStep (r' : V) {T' : Finset (Sym2 V)}
    (hT' : T' ∈ SimpleGraph.spanningTrees N.graph) :
    ∑ r, ∑ T ∈ SimpleGraph.spanningTrees N.graph with treeStep T r r' = T',
        N.cond r r' * SimpleGraph.forestWeight N.edgeCond T =
      N.weight r' * SimpleGraph.forestWeight N.edgeCond T' := by
  sorry

open Classical in
/-- 4.2 The first-entrance tree of a path `ω : ℕ → V`: for every vertex `u ≠ ω 0` that the path
visits, the pair joining `u` to the state just before the first visit to `u`. -/
def firstEntranceTree (ω : ℕ → V) : Finset (Sym2 V) :=
  Finset.univ.biUnion fun u =>
    if h : ∃ n, ω n = u then (if u = ω 0 then ∅ else {s(u, ω (Nat.find h - 1))}) else ∅

/-- 4.2 **The Aldous–Broder theorem.** On a connected network, for every starting vertex `x`, the
first-entrance tree of the random walk started at `x` has the law of the weighted uniform spanning
tree. -/
theorem map_firstEntranceTree [MeasurableSpace V] [MeasurableSingletonClass V]
    (hN : N.graph.Connected) (x : V) :
    (markovChainLaw (Measure.dirac x) N.walk).map firstEntranceTree = N.ust := by
  sorry

end Network

end TauCetiRoadmap.UniformSpanningTreesAndTransferCurrents

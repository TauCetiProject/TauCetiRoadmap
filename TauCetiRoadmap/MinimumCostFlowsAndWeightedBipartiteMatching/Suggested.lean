import Mathlib
import TauCeti.Combinatorics.Network.Shift
import TauCeti.Combinatorics.Network.Augmentation

/-!
# Minimum-cost flows and weighted bipartite matching: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

Flows are Tau Ceti's arrow assignments on an explicit finite arrow family `Q : V → V → Type*`,
with lower and upper bounds `lo hi : TauCeti.Assignment Q K` and prescribed excess `b : V → K`:
the feasible ones are `TauCeti.ExcessFlow lo hi b`. Residual arrows, residual capacities,
residual updates, walks, cycles and walk assignments are Tau Ceti's. Coefficients lie in a
linearly ordered commutative ring `K`, so that a cost can multiply a flow value; `ℤ`, `ℚ` and `ℝ`
are instances. Integrality is membership in an additive subgroup `H` of `K`.

The weight of a walk and potentials are copied verbatim from SpanningTreesAndShortestPaths, 3.1
and 3.3, since a roadmap's Lean file imports no other roadmap's module.
-/

noncomputable section

open Finset TauCeti

namespace TauCetiRoadmap.MinimumCostFlowsAndWeightedBipartiteMatching

/-! ## Walk weights and potentials (copied verbatim from SpanningTreesAndShortestPaths) -/

section ShortestWalks

variable {V : Type*} {Q : V → V → Type*} {R : Type*}

/-- 1.1 The weight of a walk, the sum of the weights of the arrows it traverses, with
repetitions: Mathlib's `Quiver.Path.addWeight` for the quiver whose arrows are `Q`, abbreviated
for an arrow family in the way `TauCeti.ArrowWalk.length` abbreviates `Quiver.Path.length`.
(Copied verbatim from SpanningTreesAndShortestPaths 3.1.) -/
abbrev walkWeight [AddMonoid R] (w : Assignment Q R) {s t : V} (p : ArrowWalk Q s t) : R :=
  @Quiver.Path.addWeight V ⟨Q⟩ R _ (fun {_ _} e => w e) s t p

/-- 1.1 A potential for `w`: a function on vertices that rises along every arrow by at most the
weight of the arrow. (Copied verbatim from SpanningTreesAndShortestPaths 3.3.) -/
def IsPotential [Add R] [LE R] (w : Assignment Q R) (y : V → R) : Prop :=
  ∀ ⦃u v : V⦄ (e : Q u v), y v ≤ y u + w e

end ShortestWalks

/-! ## Layer 1: optimality of minimum-cost flows -/

section Flows

variable {V : Type*} [Fintype V] {Q : V → V → Type*} [∀ x y, Fintype (Q x y)]
variable {K : Type*} [CommRing K] [LinearOrder K] [IsStrictOrderedRing K]

/-- 1.1 The cost `∑ c e * f e` of an arrow assignment `f` for the arrow costs `c`. -/
def flowCost (c f : Assignment Q K) : K :=
  ∑ x, ∑ y, ∑ e : Q x y, c e * f e

/-- 1.1 The residual cost: the forward copy of an arrow `e` costs `c e`, its reverse copy
`-c e`. -/
def residualCost (c : Assignment Q K) : Assignment (ResidualHom Q) K :=
  fun _ _ a => Sum.elim (fun e => c e) (fun e => -c e) a

/-- 1.1 A minimum-cost flow: a feasible assignment of prescribed excess whose cost is at most the
cost of every feasible assignment with the same bounds and the same excess. -/
def IsMinCost {lo hi : Assignment Q K} {b : V → K} (c : Assignment Q K)
    (f : ExcessFlow lo hi b) : Prop :=
  ∀ g : ExcessFlow lo hi b, flowCost c f.val ≤ flowCost c g.val

/-- 1.1 The dual value of a potential `p`: `∑ v, p v * b v` plus, for every arrow `e` from `x` to
`y` with reduced cost `c e + p x - p y`, the smaller of the reduced cost times `lo e` and times
`hi e`. -/
def dualValue (lo hi c : Assignment Q K) (b : V → K) (p : V → K) : K :=
  ∑ v, p v * b v + ∑ x, ∑ y, ∑ e : Q x y,
    min ((c e + p x - p y) * lo e) ((c e + p x - p y) * hi e)

/-- 1.2 The negative-cycle criterion. A feasible assignment of prescribed excess has minimum cost
exactly when no directed cycle of residual arrows of positive residual capacity has negative
residual cost. -/
theorem isMinCost_iff_forall_isCycle {lo hi : Assignment Q K} {b : V → K} (c : Assignment Q K)
    (f : ExcessFlow lo hi b) :
    IsMinCost c f ↔ ∀ ⦃v : V⦄ (C : ArrowWalk (ResidualHom Q) v v), C.IsCycle →
      (∀ a ∈ C.arrows, 0 < residualCapacity lo hi f.val a.2.2) →
        0 ≤ walkWeight (residualCost c) C := by
  sorry

/-- 1.3 Reduced-cost optimality. A feasible assignment of prescribed excess has minimum cost
exactly when some potential `p` makes the reduced residual cost `residualCost c a + p x - p y`
nonnegative on every residual arrow `a` from `x` to `y` of positive residual capacity. -/
theorem isMinCost_iff_exists_isPotential {lo hi : Assignment Q K} {b : V → K}
    (c : Assignment Q K) (f : ExcessFlow lo hi b) :
    IsMinCost c f ↔ ∃ p : V → K,
      IsPotential (Q := PositiveHom (residualCapacity lo hi f.val))
        (fun _ _ a => residualCost c a.val) p := by
  sorry

/-- 1.4 Existence and integrality. If some assignment between `lo` and `hi` has excess `b`, and
`lo`, `hi` and `b` take values in an additive subgroup `H`, then some minimum-cost assignment
takes all its values in `H`; the costs are arbitrary. With `H = ⊤` this is the existence of a
minimum-cost flow. -/
theorem exists_isMinCost_mem {lo hi : Assignment Q K} {b : V → K} (c : Assignment Q K)
    (H : AddSubgroup K) (hlo : ∀ ⦃x y⦄ (e : Q x y), lo e ∈ H)
    (hhi : ∀ ⦃x y⦄ (e : Q x y), hi e ∈ H) (hb : ∀ v, b v ∈ H)
    (hne : Nonempty (ExcessFlow lo hi b)) :
    ∃ f : ExcessFlow lo hi b, IsMinCost c f ∧ ∀ ⦃x y⦄ (e : Q x y), f.val e ∈ H := by
  sorry

/-- 1.5 Shortest-path augmentation. Let `f` be a minimum-cost assignment of excess `b` and let
`P` be a residual path from `s` to `t` whose residual cost is at most that of every residual path
from `s` to `t` along arrows of positive residual capacity. Augmenting `f` along `P` by any
`ε ≥ 0` at most the residual capacity of each arrow of `P` gives a feasible assignment whose
excess is `b` raised by `ε` at `t` and lowered by `ε` at `s`, and it has minimum cost for that
excess. -/
theorem isMinCost_residualUpdate_walkAssignment [DecidableEq V] {lo hi : Assignment Q K}
    {b : V → K} {c : Assignment Q K} {f : ExcessFlow lo hi b} (hf : IsMinCost c f) {s t : V}
    (P : ArrowWalk (ResidualHom Q) s t) (hP : P.IsPath)
    (hshort : ∀ P' : ArrowWalk (ResidualHom Q) s t, P'.IsPath →
      (∀ a ∈ P'.arrows, 0 < residualCapacity lo hi f.val a.2.2) →
        walkWeight (residualCost c) P ≤ walkWeight (residualCost c) P')
    {ε : K} (hε : 0 ≤ ε) (hεP : ∀ a ∈ P.arrows, ε ≤ residualCapacity lo hi f.val a.2.2) :
    ∃ h : residualUpdate f.val (walkAssignment P ε) ∈ Set.Icc lo hi ∧
        excessAt (residualUpdate f.val (walkAssignment P ε)) =
          fun v => b v + (if v = t then ε else 0) - (if v = s then ε else 0),
      IsMinCost c (⟨residualUpdate f.val (walkAssignment P ε), h⟩ :
        ExcessFlow lo hi fun v => b v + (if v = t then ε else 0) - (if v = s then ε else 0)) := by
  sorry

/-- 1.6 Duality in potential form. If some assignment between `lo` and `hi` has excess `b`, the
least cost of such an assignment is the greatest dual value of a potential; and if the costs take
values in an additive subgroup `H`, the greatest dual value is attained by a potential with values
in `H`. -/
theorem isLeast_flowCost_isGreatest_dualValue {lo hi : Assignment Q K} {b : V → K}
    (c : Assignment Q K) (H : AddSubgroup K) (hc : ∀ ⦃x y⦄ (e : Q x y), c e ∈ H)
    (hne : Nonempty (ExcessFlow lo hi b)) :
    ∃ m : K, IsLeast (Set.range fun g : ExcessFlow lo hi b => flowCost c g.val) m ∧
      IsGreatest (Set.range (dualValue lo hi c b)) m ∧
      ∃ p : V → K, (∀ v, p v ∈ H) ∧ dualValue lo hi c b p = m := by
  sorry

end Flows

/-! ## Layer 2: transportation and weighted bipartite matching -/

section Bipartite

variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable {K : Type*} [CommRing K] [LinearOrder K] [IsStrictOrderedRing K]

/-- 2.1 A transportation plan from the supplies `a` to the demands `d`: a nonnegative matrix with
row sums `a` and column sums `d`. -/
def IsTransportPlan (a : ι → K) (d : κ → K) (X : ι → κ → K) : Prop :=
  (∀ i j, 0 ≤ X i j) ∧ (∀ i, ∑ j, X i j = a i) ∧ ∀ j, ∑ i, X i j = d j

/-- 2.1 The cost `∑ c i j * X i j` of a matrix `X` for the costs `c`. -/
def transportCost (c X : ι → κ → K) : K :=
  ∑ i, ∑ j, c i j * X i j

/-- 2.1 Transportation integrality and duality. If some transportation plan from `a` to `d`
exists, the least cost of a plan equals the greatest value `∑ i, a i * u i + ∑ j, d j * p j` of a
pair `(u, p)` with `u i + p j ≤ c i j` for all `i`, `j`. If `a` and `d` take values in an additive
subgroup `H₁`, the least cost is attained by a plan with entries in `H₁`; if `c` takes values in an
additive subgroup `H₂`, the greatest value is attained by a pair with values in `H₂`. -/
theorem isLeast_transportCost_isGreatest (a : ι → K) (d : κ → K) (c : ι → κ → K)
    (H₁ H₂ : AddSubgroup K) (ha : ∀ i, a i ∈ H₁) (hd : ∀ j, d j ∈ H₁)
    (hc : ∀ i j, c i j ∈ H₂) (hX : ∃ X, IsTransportPlan a d X) :
    ∃ m : K,
      IsLeast {x | ∃ X, IsTransportPlan a d X ∧ transportCost c X = x} m ∧
      IsGreatest {x | ∃ (u : ι → K) (p : κ → K), (∀ i j, u i + p j ≤ c i j) ∧
        ∑ i, a i * u i + ∑ j, d j * p j = x} m ∧
      (∃ X, IsTransportPlan a d X ∧ (∀ i j, X i j ∈ H₁) ∧ transportCost c X = m) ∧
      ∃ (u : ι → K) (p : κ → K), (∀ i j, u i + p j ≤ c i j) ∧ (∀ i, u i ∈ H₂) ∧
        (∀ j, p j ∈ H₂) ∧ ∑ i, a i * u i + ∑ j, d j * p j = m := by
  sorry

/-- 2.2 The weight of a matching `M`, a partial bijection from `ι` to `κ`: the sum of `w i j` over
its matched pairs. -/
def matchingWeight (w : ι → κ → K) (M : ι ≃. κ) : K :=
  ∑ i, ∑ j ∈ (M i).toFinset, w i j

/-- 2.2 A weighted vertex cover of `w`: nonnegative `u` on `ι` and `p` on `κ` with
`w i j ≤ u i + p j` for every pair. -/
def IsWeightCover (w : ι → κ → K) (u : ι → K) (p : κ → K) : Prop :=
  (∀ i, 0 ≤ u i) ∧ (∀ j, 0 ≤ p j) ∧ ∀ i j, w i j ≤ u i + p j

/-- 2.2 Egerváry's theorem. For weights `w` of any sign on the pairs of two finite sets, the
largest weight of a matching equals the least total `∑ i, u i + ∑ j, p j` of a weighted vertex
cover; if `w` takes values in an additive subgroup `H`, the least total is attained by a cover
with values in `H`. -/
theorem egervary (w : ι → κ → K) (H : AddSubgroup K) (hw : ∀ i j, w i j ∈ H) :
    ∃ m : K, IsGreatest (Set.range (matchingWeight w)) m ∧
      IsLeast {x | ∃ u p, IsWeightCover w u p ∧ ∑ i, u i + ∑ j, p j = x} m ∧
      ∃ u p, IsWeightCover w u p ∧ (∀ i, u i ∈ H) ∧ (∀ j, p j ∈ H) ∧
        ∑ i, u i + ∑ j, p j = m := by
  sorry

end Bipartite

end TauCetiRoadmap.MinimumCostFlowsAndWeightedBipartiteMatching

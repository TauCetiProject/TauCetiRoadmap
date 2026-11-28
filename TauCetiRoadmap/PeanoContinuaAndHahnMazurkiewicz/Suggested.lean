import Mathlib

/-!
# Peano continua and the Hahn–Mazurkiewicz theorem: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here.

The closed unit interval is Mathlib's `unitInterval`. A Peano continuum is a nonempty compact,
connected, locally connected, metrizable space; it is spelled out through Mathlib's classes
`CompactSpace`, `ConnectedSpace` (which includes nonemptiness), `LocallyConnectedSpace` and
`TopologicalSpace.MetrizableSpace` rather than given a name. Smallness of a set is stated as a
bound on the distance between any two of its points, as in Tau Ceti's
`TauCeti.IsUniformlyLocallyConnected`, so that no junk value of `Metric.diam` enters.
-/

noncomputable section

open Set Topology TopologicalSpace

namespace TauCetiRoadmap.PeanoContinuaAndHahnMazurkiewicz

/-! ## Layer 1: images, property S and the closed sine curve -/

/-- 1.1: a Hausdorff continuous image of a compact metrizable space is metrizable. -/
theorem metrizableSpace_of_continuous_surjective {X Y : Type*} [TopologicalSpace X]
    [CompactSpace X] [MetrizableSpace X] [TopologicalSpace Y] [T2Space Y] {f : X → Y}
    (hf : Continuous f) (hsurj : Function.Surjective f) : MetrizableSpace Y := by
  sorry

/-- 1.2: a pseudometric space has property S if for every `ε > 0` it is the union of finitely
many preconnected sets, any two points of each lying within `ε` of one another. -/
def HasPropertyS (X : Type*) [PseudoMetricSpace X] : Prop :=
  ∀ ε > 0, ∃ 𝒜 : Set (Set X), 𝒜.Finite ∧ ⋃₀ 𝒜 = univ ∧
    ∀ A ∈ 𝒜, IsPreconnected A ∧ ∀ x ∈ A, ∀ y ∈ A, dist x y ≤ ε

/-- 1.2: a compact pseudometric space is locally connected if and only if it has property S. -/
theorem locallyConnectedSpace_iff_hasPropertyS {X : Type*} [PseudoMetricSpace X]
    [CompactSpace X] : LocallyConnectedSpace X ↔ HasPropertyS X := by
  sorry

/-- 1.3: the closed topologist's sine curve in `ℝ × ℝ`: the graph of `x ↦ sin (1 / x)` over
`0 < x ≤ 1` together with the segment joining `(0, -1)` to `(0, 1)`. -/
def closedSineCurve : Set (ℝ × ℝ) :=
  (fun x : ℝ => (x, Real.sin x⁻¹)) '' Ioc 0 1 ∪ (fun y : ℝ => ((0 : ℝ), y)) '' Icc (-1) 1

/-- 1.3: the closed topologist's sine curve is compact and connected and is not locally
connected. -/
theorem isCompact_isConnected_not_locallyConnectedSpace_closedSineCurve :
    IsCompact closedSineCurve ∧ IsConnected closedSineCurve ∧
      ¬ LocallyConnectedSpace closedSineCurve := by
  sorry

/-! ## Layer 2: uniform local path connectedness -/

/-- 2.1: a pseudometric space is uniformly locally path connected if for every `ε > 0` there is
`δ > 0` such that any two points at distance less than `δ` are joined by a path any two of whose
points lie within `ε` of one another. -/
def IsUniformlyLocallyPathConnected (X : Type*) [PseudoMetricSpace X] : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ a b : X, dist a b < δ →
    ∃ γ : Path a b, ∀ s t, dist (γ s) (γ t) ≤ ε

/-- 2.1: a compact, locally connected metric space is uniformly locally path connected. -/
theorem isUniformlyLocallyPathConnected_of_compactSpace {X : Type*} [MetricSpace X]
    [CompactSpace X] [LocallyConnectedSpace X] : IsUniformlyLocallyPathConnected X := by
  sorry

/-! ## Layer 3: the Hahn–Mazurkiewicz theorem -/

/-- 3.1: every continuous map from a closed subset of `[0, 1]` into a path connected, uniformly
locally path connected pseudometric space extends to a continuous map on `[0, 1]`. -/
theorem exists_extend_of_isClosed {X : Type*} [PseudoMetricSpace X] [PathConnectedSpace X]
    (hX : IsUniformlyLocallyPathConnected X) {K : Set unitInterval} (hK : IsClosed K)
    (f : C(K, X)) : ∃ F : C(unitInterval, X), ∀ t : K, F t = f t := by
  sorry

/-- 3.2 (Hahn–Mazurkiewicz): a Hausdorff space is a continuous image of `[0, 1]` if and only if it
is compact, connected (in particular nonempty), locally connected and metrizable. -/
theorem exists_continuous_surjective_unitInterval_iff {X : Type*} [TopologicalSpace X]
    [T2Space X] :
    (∃ f : unitInterval → X, Continuous f ∧ Function.Surjective f) ↔
      CompactSpace X ∧ ConnectedSpace X ∧ LocallyConnectedSpace X ∧ MetrizableSpace X := by
  sorry

/-! ## Layer 4: curves onto the square -/

/-- 4.1: no continuous surjection of `[0, 1]` onto the square `[0, 1] × [0, 1]` is injective. -/
theorem not_injective_of_continuous_surjective_unitInterval_prod
    {f : unitInterval → unitInterval × unitInterval} (hf : Continuous f)
    (hsurj : Function.Surjective f) : ¬ Function.Injective f := by
  sorry

end TauCetiRoadmap.PeanoContinuaAndHahnMazurkiewicz

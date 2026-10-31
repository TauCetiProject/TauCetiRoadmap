import Mathlib

/-!
# Explicit Veronese surface ingredients

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These signatures use native Euclidean spaces and projectivization. The smooth
quotient, embedded surface classification, separation and gluing comparisons
remain required README targets.
-/

namespace TauCetiRoadmap.GeometricTopology.SurfaceModels

open scoped BigOperators

abbrev E3 := EuclideanSpace ℝ (Fin 3)
abbrev E9 := EuclideanSpace ℝ (Fin 3 × Fin 3)

/-- Symmetric trace-zero matrices, with the inherited Frobenius Euclidean structure. -/
def traceFreeSymmetric : Submodule ℝ E9 where
  carrier := {A | (∀ i j, A (i,j) = A (j,i)) ∧ ∑ i, A (i,i) = 0}
  zero_mem' := by simp
  add_mem' := by
    intro a b ha hb
    constructor
    · intro i j
      change a (i,j) + b (i,j) = a (j,i) + b (j,i)
      rw [ha.1 i j, hb.1 i j]
    · change ∑ i, (a (i,i) + b (i,i)) = 0
      rw [Finset.sum_add_distrib, ha.2, hb.2]
      norm_num
  smul_mem' := by
    intro c a ha
    constructor
    · intro i j
      change c * a (i,j) = c * a (j,i)
      rw [ha.1 i j]
    · change ∑ i, c * a (i,i) = 0
      rw [← Finset.mul_sum, ha.2, mul_zero]

/-- This formula is sphere-normalized only when the input vector has norm one. -/
noncomputable def veronese (v : E3) : E9 :=
  WithLp.toLp 2 fun ij => Real.sqrt (3 / 2) *
    (v ij.1 * v ij.2 - if ij.1 = ij.2 then (1 / 3 : ℝ) else 0)

/-- The omitted pole has distinct eigenvalues, unlike every Veronese image. -/
noncomputable def pole : E9 :=
  WithLp.toLp 2 fun ij =>
    if ij = (0,0) then 1 / Real.sqrt 2
    else if ij = (2,2) then -(1 / Real.sqrt 2) else 0

/-- The actual directional derivative on the unit sphere tangent space. -/
noncomputable def tangentMap (v h : E3) : E9 :=
  WithLp.toLp 2 fun ij => Real.sqrt (3 / 2) * (v ij.1 * h ij.2 + h ij.1 * v ij.2)

theorem veronese_geometry (v : E3) (hv : ‖v‖ = 1) :
    veronese v ∈ traceFreeSymmetric ∧ ‖veronese v‖ = 1 := by
  sorry

theorem veronese_fibres (v w : E3) (hv : ‖v‖ = 1) (hw : ‖w‖ = 1) :
    veronese v = veronese w ↔ w = v ∨ w = -v := by
  sorry

theorem veronese_tangent_injective (v h : E3) (hv : ‖v‖ = 1)
    (ht : inner ℝ v h = 0) (hz : tangentMap v h = 0) : h = 0 := by
  sorry

theorem pole_geometry : pole ∈ traceFreeSymmetric ∧ ‖pole‖ = 1 := by
  sorry

theorem omitted_pole (v : E3) (hv : ‖v‖ = 1) : veronese v ≠ pole := by
  sorry

theorem traceFreeSymmetric_finrank : Module.finrank ℝ traceFreeSymmetric = 5 := by
  sorry

/-- Antipodal invariance is an actual identity, separate from quotient smoothness. -/
theorem veronese_neg (v : E3) : veronese (-v) = veronese v := by
  ext ij
  change Real.sqrt (3 / 2) *
      ((-v ij.1) * (-v ij.2) - if ij.1 = ij.2 then (1 / 3 : ℝ) else 0) =
    Real.sqrt (3 / 2) *
      (v ij.1 * v ij.2 - if ij.1 = ij.2 then (1 / 3 : ℝ) else 0)
  ring

/-- Scale-invariant formula used for descent to the existing projectivization. -/
noncomputable def lineVeronese (L : Projectivization ℝ E3) : E9 :=
  WithLp.toLp 2 fun ij => Real.sqrt (3 / 2) *
    (L.rep ij.1 * L.rep ij.2 / ‖L.rep‖ ^ 2 -
      if ij.1 = ij.2 then (1 / 3 : ℝ) else 0)

theorem lineVeronese_mk (v : E3) (hv : v ≠ 0) :
    lineVeronese (Projectivization.mk ℝ v hv) = veronese (‖v‖⁻¹ • v) := by
  sorry

end TauCetiRoadmap.GeometricTopology.SurfaceModels

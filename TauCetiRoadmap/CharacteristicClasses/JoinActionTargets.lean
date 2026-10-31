/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Geometry.Convex.ConvexSpace.Defs
import Mathlib.Basic.Real.Basic

/-!
**This file is not the roadmap and is not exhaustive.** README.md is the
definitive specification. These algebraic maps on native finitely supported
simplexes pin C1.1b's label/action dictionary. They do not replace the native
indexed-join carrier or assert that its weak topology is the Lie-group topology.
-/

namespace TauCetiRoadmap.CharacteristicClasses

noncomputable section

open Convexity

variable {G : Type*} [Group G]

def rightLabels (g : G) (p : StdSimplex ℝ (Σ _ : ℕ, G)) :
    StdSimplex ℝ (Σ _ : ℕ, G) :=
  p.map (fun v ↦ ⟨v.1, v.2 * g⟩)

def leftLabels (g : G) (p : StdSimplex ℝ (Σ _ : ℕ, G)) :
    StdSimplex ℝ (Σ _ : ℕ, G) :=
  p.map (fun v ↦ ⟨v.1, g * v.2⟩)

def inverseLabels (p : StdSimplex ℝ (Σ _ : ℕ, G)) :
    StdSimplex ℝ (Σ _ : ℕ, G) :=
  p.map (fun v ↦ ⟨v.1, v.2⁻¹⟩)

/-- Applying right multiplication by g and then h multiplies by g*h. -/
theorem rightLabels_mul (p : StdSimplex ℝ (Σ _ : ℕ, G)) (g h : G) :
    rightLabels h (rightLabels g p) = rightLabels (g * h) p := by
  simp only [rightLabels, StdSimplex.map_map]
  congr 1
  funext v
  simp [mul_assoc]

/-- Group-label changes do not alter the total weight at an index. -/
theorem rightLabels_indexWeights (p : StdSimplex ℝ (Σ _ : ℕ, G)) (g : G) :
    (rightLabels g p).map Sigma.fst = p.map Sigma.fst := by
  simp only [rightLabels, StdSimplex.map_map]

/-- Coordinate inversion converts the native left action into the stated
right action, with the inverse group element required in the left action. -/
theorem inverseLabels_leftLabels (p : StdSimplex ℝ (Σ _ : ℕ, G)) (g : G) :
    inverseLabels (leftLabels g⁻¹ p) = rightLabels g (inverseLabels p) := by
  simp only [inverseLabels, leftLabels, rightLabels, StdSimplex.map_map]
  congr 1
  funext v
  simp

end

end TauCetiRoadmap.CharacteristicClasses

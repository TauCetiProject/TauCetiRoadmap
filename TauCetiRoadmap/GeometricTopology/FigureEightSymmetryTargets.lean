import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCetiRoadmap.GeometricTopology.FlypeDiagramTargets
import Mathlib.Tactic.Group

/-!
Suggested forms are aids, not the specification; the README is definitive.
These native braid and diagram identities do not prove the realized movies,
the trigonometric embedding or any source-picture comparison.
-/
namespace TauCetiRoadmap.GeometricTopology.FigureEightSymmetry
open TauCeti

abbrev a : BraidGroup 3 := BraidGroup.sigma 0
abbrev b : BraidGroup 3 := BraidGroup.sigma 1
def beta : BraidGroup 3 := (a * b⁻¹)^2
def mirrorBeta : BraidGroup 3 := (a⁻¹ * b)^2
def delta : BraidGroup 3 := a * b * a
def conjugator : BraidGroup 3 := a * delta

theorem delta_conj_a : delta * a * delta⁻¹ = b := by
  have h : a * b * a = b * a * b := BraidGroup.sigma_braid (Or.inl rfl)
  change (a * b * a) * a * (a * b * a)⁻¹ = b
  calc
    _ = (b * a * b) * a * (a * b * a)⁻¹ := by rw [h]
    _ = b := by group

theorem delta_conj_b : delta * b * delta⁻¹ = a := by
  have h : a * b * a = b * a * b := BraidGroup.sigma_braid (Or.inl rfl)
  change (a * b * a) * b * (a * b * a)⁻¹ = a
  calc
    _ = a * (b * a * b) * (a * b * a)⁻¹ := by group
    _ = a * (a * b * a) * (a * b * a)⁻¹ := by rw [← h]
    _ = a := by group

theorem delta_conj_mirror : delta * mirrorBeta * delta⁻¹ = (b⁻¹ * a)^2 := by
  calc
    _ = ((delta * a * delta⁻¹)⁻¹ * (delta * b * delta⁻¹))^2 := by
      dsimp [mirrorBeta]
      simp only [pow_two]
      group
    _ = (b⁻¹ * a)^2 := by rw [delta_conj_a, delta_conj_b]

theorem cyclic_conj : a * (b⁻¹ * a)^2 * a⁻¹ = beta := by
  dsimp [beta]
  simp only [pow_two]
  group

theorem mirror_conjugacy : conjugator * mirrorBeta * conjugator⁻¹ = beta := by
  calc
    _ = a * (delta * mirrorBeta * delta⁻¹) * a⁻¹ := by
      dsimp [conjugator]
      group
    _ = a * (b⁻¹ * a)^2 * a⁻¹ := by rw [delta_conj_mirror]
    _ = beta := cyclic_conj

/-- Reflect the planar chart, carrying the printed arrows and underpass data. -/
def planeReflection {n : ℕ} (D : OrientedPDCode n) : OrientedPDCode n :=
  Flyping.orientedTurnover D.mirror

@[simp] theorem planeReflection_sign {n : ℕ} (D : OrientedPDCode n) (i : Fin n) :
    (planeReflection D).crossingSign i = -D.crossingSign i := by
  simp [planeReflection]

theorem planeReflection_writhe {n : ℕ} (D : OrientedPDCode n) :
    (planeReflection D).writhe = -D.writhe := by
  simp [OrientedPDCode.writhe]

@[simp] theorem planeReflection_overPair {n : ℕ} (D : OrientedPDCode n) (i : Fin n) :
    (planeReflection D).overPair i = D.overPair i := by
  simp [planeReflection, Flyping.orientedTurnover, Flyping.turnover]

end TauCetiRoadmap.GeometricTopology.FigureEightSymmetry

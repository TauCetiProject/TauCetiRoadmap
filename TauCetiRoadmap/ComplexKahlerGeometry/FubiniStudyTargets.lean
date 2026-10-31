import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic

/-!
# Fubini–Study coordinates: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The native conjugate-linear-first inner product pins the homogeneous Hermitian
formula and its coordinate order. The CP¹ dilation computation is pointwise;
the README owns the chart, tangent, form and projective action comparisons.
-/

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry.FSCoordinates

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

/-- For z≠0 this is the normalized Hermitian form on tangent representatives.
Its totalized value at z=0 is not a geometric tangent metric. -/
def normalizedGram (z v w : E) : ℂ :=
  (inner ℂ z z * inner ℂ v w - inner ℂ v z * inner ℂ z w) /
    ((Real.pi : ℂ) * (inner ℂ z z) ^ 2)

theorem normalizedGram_radial_left (z w : E) : normalizedGram z z w = 0 := by
  simp [normalizedGram]

theorem normalizedGram_radial_right (z v : E) : normalizedGram z v z = 0 := by
  simp [normalizedGram, mul_comm]

/-- The unitary invariance is already an identity on tangent representatives. -/
theorem normalizedGram_unitary (U : E ≃ₗᵢ[ℂ] E) (z v w : E) :
    normalizedGram (U z) (U v) (U w) = normalizedGram z v w := by
  simp [normalizedGram]

theorem normalizedGram_double_velocity (z v w : E) :
    normalizedGram z ((2 : ℂ) • v) ((2 : ℂ) • w) =
      4 * normalizedGram z v w := by
  simp only [normalizedGram, inner_smul_left, inner_smul_right, map_ofNat]
  ring

section Coordinates

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- With the first slot conjugate-linear, the off-diagonal term is
z_i conj(z_j). The dw_i ∧ dbar(w_j) coefficient uses the transpose. -/
theorem normalizedGram_coordinate (z : EuclideanSpace ℂ ι) (i j : ι) :
    normalizedGram z (EuclideanSpace.single i 1) (EuclideanSpace.single j 1) =
      (inner ℂ z z * (if i = j then 1 else 0) - z i * star (z j)) /
        ((Real.pi : ℂ) * (inner ℂ z z) ^ 2) := by
  simp [normalizedGram, EuclideanSpace.inner_single_left,
    EuclideanSpace.inner_single_right, eq_comm]

end Coordinates

/-- At the affine CP¹ origin, (1,0) is the lift and (0,1) a tangent lift. -/
def cp1Origin : EuclideanSpace ℂ (Fin 2) := EuclideanSpace.single 0 1

def cp1Velocity : EuclideanSpace ℂ (Fin 2) := EuclideanSpace.single 1 1

theorem cp1_origin_gram :
    normalizedGram cp1Origin cp1Velocity cp1Velocity = 1 / (Real.pi : ℂ) := by
  norm_num [normalizedGram, cp1Origin, cp1Velocity,
    EuclideanSpace.inner_single_left, EuclideanSpace.inner_single_right]

/-- The map diag(1,2) has chart expression w↦2w and derivative 2 at zero. -/
theorem cp1_dilation_factor :
    normalizedGram cp1Origin ((2 : ℂ) • cp1Velocity) ((2 : ℂ) • cp1Velocity) =
      4 / (Real.pi : ℂ) := by
  rw [normalizedGram_double_velocity, cp1_origin_gram]
  ring

theorem cp1_dilation_changes_gram :
    normalizedGram cp1Origin ((2 : ℂ) • cp1Velocity) ((2 : ℂ) • cp1Velocity) ≠
      normalizedGram cp1Origin cp1Velocity cp1Velocity := by
  rw [cp1_dilation_factor, cp1_origin_gram]
  have hp : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  intro h
  have h' := (div_left_inj' hp).mp h
  norm_num at h'

end TauCetiRoadmap.ComplexKahlerGeometry.FSCoordinates

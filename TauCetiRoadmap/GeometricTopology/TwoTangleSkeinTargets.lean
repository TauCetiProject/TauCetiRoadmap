import TauCeti.Algebra.TemperleyLieb.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

The native algebra and finite coordinates below support the course p88 identity.
They do not define a substitute tangle carrier or assert the geometric skein comparison.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.TwoTangleSkein

open Matrix

variable {R : Type*} [CommRing R]

def coordinates (μ : R) (v : Fin 2 → R) : TauCeti.TemperleyLieb R μ 2 :=
  v 0 • 1 + v 1 • TauCeti.TemperleyLieb.e μ 0

/-- The normal form uses the actual native two-strand presentation. -/
theorem exists_coordinates_equiv (μ : R) :
    ∃ e : (Fin 2 → R) ≃ₗ[R] TauCeti.TemperleyLieb R μ 2,
      ∀ v, e v = coordinates μ v := by
  sorry

def product (μ : R) (s t : Fin 2 → R) : Fin 2 → R :=
  ![s 0 * t 0, s 0 * t 1 + s 1 * t 0 + μ * s 1 * t 1]

theorem coordinates_product (μ : R) (s t : Fin 2 → R) :
    coordinates μ (product μ s t) = coordinates μ s * coordinates μ t := by
  sorry

def closureMatrix (μ : R) : Matrix (Fin 2) (Fin 2) R := !![μ, 1; 1, μ]

def closures (μ : R) (v : Fin 2 → R) : Fin 2 → R := closureMatrix μ *ᵥ v

/-- The universal identity has no nonzero-denominator hypothesis. -/
theorem cleared_numerator (μ : R) (s t : Fin 2 → R) :
    (1 - μ ^ 2) * closures μ (product μ s t) 0 =
      closures μ s 0 * closures μ t 1 + closures μ s 1 * closures μ t 0 -
        μ * (closures μ s 0 * closures μ t 0 + closures μ s 1 * closures μ t 1) := by
  sorry

/-- Specialization can lose closure injectivity even though the coordinate module stays free. -/
theorem closures_eq_zero_iff (μ : R) (v : Fin 2 → R) :
    closures μ v = 0 ↔ ∃ a : R, v = ![a, -μ * a] ∧ (1 - μ ^ 2) * a = 0 := by
  sorry

/-- The adjacent-orientation pairing differs by a unit factor from the alternating one. -/
theorem adjacent_gram_det (l : Rˣ) (m μ : R)
    (h : μ * m = -((l : R) + ((l⁻¹ : Rˣ) : R))) :
    Matrix.det (!![μ, 1; 1,
      -((l⁻¹ : Rˣ) : R) * m - (((l⁻¹ : Rˣ) : R) ^ 2) * μ] :
      Matrix (Fin 2) (Fin 2) R) =
        (((l⁻¹ : Rˣ) : R) ^ 2) * (1 - μ ^ 2) := by
  sorry

end TauCetiRoadmap.GeometricTopology.TwoTangleSkein

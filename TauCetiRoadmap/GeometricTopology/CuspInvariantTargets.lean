import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Cusp-invariant target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification
is `README.md`. These suggested signatures concern the lattice and cusp-model
calculations; constructing their isometric, measure-preserving comparison with
native hyperbolic cusp ends and certifying finite horoball patterns are also
required targets in the README. The theorem admissions are intentional.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.CuspInvariants

open MeasureTheory Module

variable (L : Submodule ℤ ℂ) [DiscreteTopology L] [IsZLattice ℝ L]

/-- A minimizing period, without selecting a vector among ties. -/
def IsShortestPeriod (v : L) : Prop :=
  v ≠ 0 ∧ ∀ w : L, w ≠ 0 → ‖v‖ ≤ ‖w‖

theorem shortestPeriod_exists : ∃ v : L, IsShortestPeriod L v := by
  sorry

/-- The second period minimizes length among periods real-linearly independent
of the first. Both periods live in the actual lattice. -/
def IsShortestBasis (b : Basis (Fin 2) ℤ L) : Prop :=
  IsShortestPeriod L (b 0) ∧
    ∀ w : L, LinearIndependent ℝ (![(b 0 : ℂ), (w : ℂ)] : Fin 2 → ℂ) →
      ‖b 1‖ ≤ ‖w‖

theorem shortestPeriod_extends_to_shortestBasis (v : L) (hv : IsShortestPeriod L v) :
    ∃ b : Basis (Fin 2) ℤ L, b 0 = v ∧ IsShortestBasis L b := by
  sorry

/-- Euclidean area of a lattice fundamental parallelogram. -/
theorem covolume_eq_period_area (b : Basis (Fin 2) ℤ L) :
    ZLattice.covolume L = |(star (b 0 : ℂ) * (b 1 : ℂ)).im| := by
  sorry

/-- Model area at height `h`; geometry is asserted for `h > 0`. -/
def horotorusModelArea (h : ℝ) : ℝ := ZLattice.covolume L / h ^ 2

/-- Integrating the curvature-minus-one upper-half-space volume density. -/
def cuspModelVolume (h : ℝ) : ℝ :=
  ∫ t in Set.Ioi h, ZLattice.covolume L / t ^ 3

theorem cuspModelVolume_eq (h : ℝ) (hh : 0 < h) :
    cuspModelVolume L h = ZLattice.covolume L / (2 * h ^ 2) := by
  sorry

theorem cuspModelVolume_eq_half_area (h : ℝ) (hh : 0 < h) :
    cuspModelVolume L h = horotorusModelArea L h / 2 := by
  sorry

/-- The source convention: first period divided by second period. In a peripheral
meridian/longitude basis this is meridian divided by longitude. -/
def periodRatio (b : Basis (Fin 2) ℤ L) : ℂ := (b 0 : ℂ) / (b 1 : ℂ)

theorem periodRatio_im_ne_zero (b : Basis (Fin 2) ℤ L) :
    (periodRatio L b).im ≠ 0 := by
  sorry

/-- The raw fractional-linear law, before any upper-half-plane or orientation
adapter. Determinant minus one must not silently conjugate this formula. -/
theorem periodRatio_change_basis (b : Basis (Fin 2) ℤ L) (p q r s : ℤ)
    (hdet : p * s - q * r = 1 ∨ p * s - q * r = -1) :
    (((p : ℂ) * (b 0 : ℂ) + (q : ℂ) * (b 1 : ℂ)) /
      ((r : ℂ) * (b 0 : ℂ) + (s : ℂ) * (b 1 : ℂ))) =
      ((p : ℂ) * periodRatio L b + (q : ℂ)) /
        ((r : ℂ) * periodRatio L b + (s : ℂ)) := by
  sorry

theorem periodRatio_change_basis_denom_ne_zero (b : Basis (Fin 2) ℤ L)
    (p q r s : ℤ) (hdet : p * s - q * r = 1 ∨ p * s - q * r = -1) :
    (r : ℂ) * periodRatio L b + (s : ℂ) ≠ 0 := by
  sorry

end TauCetiRoadmap.GeometricTopology.CuspInvariants

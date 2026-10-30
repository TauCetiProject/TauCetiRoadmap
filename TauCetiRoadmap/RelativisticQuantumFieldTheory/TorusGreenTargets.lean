import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. These native characters and scalar mode formulas
calibrate the physical-volume normalization of RQFT7.TorusGreen. Construction
of periodic distributions and their inverse operators remains a target there.
-/

noncomputable section

open Filter
open scoped BigOperators Topology

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory.TorusGreen

abbrev Frequency (n : ℕ) := Fin n → ℤ

def mode {n : ℕ} (k : Frequency n) : C(UnitAddTorus (Fin n), ℂ) :=
  UnitAddTorus.mFourier k

def energy {n : ℕ} (L : ℝ) (k : Frequency n) : ℝ :=
  (2 * Real.pi / L) ^ 2 * ∑ i, (k i : ℝ) ^ 2

def coefficient {n : ℕ} (L m : ℝ) (k : Frequency n) : ℝ :=
  (L ^ n * (energy L k + m ^ 2))⁻¹

def reducedCoefficient {n : ℕ} (L m : ℝ) (k : Frequency n) : ℝ := by
  classical
  exact if k = 0 then 0 else coefficient L m k

theorem coefficient_equation {n : ℕ} (L m : ℝ) (hL : 0 < L) (hm : 0 < m)
    (k : Frequency n) :
    (energy L k + m ^ 2) * coefficient L m k = (L ^ n)⁻¹ := by
  sorry

theorem reduced_coefficient_tendsto {n : ℕ} (L : ℝ) (hL : 0 < L)
    (k : Frequency n) :
    Tendsto (fun m ↦ coefficient L m k -
      if k = 0 then (L ^ n * m ^ 2)⁻¹ else 0)
      (𝓝[>] (0 : ℝ)) (𝓝 (reducedCoefficient L 0 k)) := by
  sorry

theorem coefficient_remainder {n : ℕ} (L m : ℝ) (hL : 0 < L) (hm : 0 ≤ m)
    (k : Frequency n) (hk : k ≠ 0) :
    |coefficient L m k - coefficient L 0 k| ≤
      m ^ 2 / (L ^ n * energy L k ^ 2) := by
  sorry

def circleGreen (L m d : ℝ) : ℝ :=
  Real.cosh (m * (L / 2 - d)) / (2 * m * Real.sinh (m * L / 2))

theorem circle_reduced_tendsto (L d : ℝ) (hL : 0 < L)
    (hd : 0 ≤ d ∧ d ≤ L / 2) :
    Tendsto (fun m ↦ circleGreen L m d - (m ^ 2 * L)⁻¹)
      (𝓝[>] (0 : ℝ)) (𝓝 (L / 12 - d / 2 + d ^ 2 / (2 * L))) := by
  sorry

end TauCetiRoadmap.RelativisticQuantumFieldTheory.TorusGreen

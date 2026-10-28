import Mathlib.Analysis.SpecialFunctions.Sqrt

/-!
# The transverse zero mode of a two-particle spring

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
The exact scalar functions below use rest length one. The admitted identities
and limits are future targets; the geometric force and configuration comparisons
are specified in the roadmap.
-/

namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory.SpringSystems.Transverse

open Filter Topology

noncomputable def length (ε : ℝ) : ℝ := Real.sqrt (1 + 4 * ε ^ 2)

noncomputable def energy (κ ε : ℝ) : ℝ := κ / 2 * (length ε - 1) ^ 2

noncomputable def forceX (κ ε : ℝ) : ℝ := κ * (1 - 1 / length ε)

/-- Exact rationalization, valid at zero as well. -/
theorem energy_rationalized (κ ε : ℝ) :
    energy κ ε = 8 * κ * ε ^ 4 / (length ε + 1) ^ 2 := sorry

/-- The puncture is necessary: real division takes the value zero at ε=0. -/
theorem energy_quartic (κ : ℝ) :
    Tendsto (fun ε : ℝ => energy κ ε / ε ^ 4)
      (nhdsWithin 0 {0}ᶜ) (nhds (2 * κ)) := sorry

/-- Exact force detects the failure of the affine linearized motion. -/
theorem forceX_pos {κ ε : ℝ} (hκ : 0 < κ) (hε : ε ≠ 0) :
    0 < forceX κ ε := sorry

end TauCetiRoadmap.RepresentationTheory.CharacterTheory.SpringSystems.Transverse

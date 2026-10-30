/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Algebra.CentralSimple.Quaternion
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The scalar estimates support the separately specified L² evolution theorem.
-/

noncomputable section
open scoped Quaternion TensorProduct

namespace RelativisticQuantumFieldTheory

/-- The actual real-quaternion matrix model printed in Borcherds p101. -/
def quaternionPauli (q : ℍ[ℝ]) : Matrix (Fin 2) (Fin 2) ℂ :=
  !![(q.re : ℂ) + Complex.I * q.imI, (q.imJ : ℂ) + Complex.I * q.imK;
      -(q.imJ : ℂ) + Complex.I * q.imK, (q.re : ℂ) - Complex.I * q.imI]

/-- Complexifying the printed model gives the full matrix algebra. -/
theorem quaternionPauli_splitting :
    ∃ e : (ℂ ⊗[ℝ] ℍ[ℝ]) ≃ₐ[ℂ] Matrix (Fin 2) (Fin 2) ℂ,
      ∀ (z : ℂ) (q : ℍ[ℝ]), e (z ⊗ₜ[ℝ] q) = z • quaternionPauli q := by
  sorry

/-- Comparison with the existing abstract splitting is an actual inner automorphism. -/
theorem quaternionSplitting_inner
    (e : (ℂ ⊗[ℝ] ℍ[ℝ]) ≃ₐ[ℂ] Matrix (Fin 2) (Fin 2) ℂ) :
    ∃ g : (Matrix (Fin 2) (Fin 2) ℂ)ˣ, ∀ x,
      e x = (g : Matrix (Fin 2) (Fin 2) ℂ) *
        TauCeti.Quaternion.complexTensorAlgEquivMatrix x *
        (↑g⁻¹ : Matrix (Fin 2) (Fin 2) ℂ) := by
  sorry

/-- Positive KG energy after removing rest energy, in physical momentum magnitude r. -/
def kgRestSubtractedEnergy (m c r : ℝ) : ℝ :=
  Real.sqrt (m ^ 2 * c ^ 4 + c ^ 2 * r ^ 2) - m * c ^ 2

/-- The global dispersion remainder controls each finite momentum window. -/
theorem kg_energy_error (m c r : ℝ) (hm : 0 < m) (hc : 0 < c) (hr : 0 ≤ r) :
    0 ≤ r ^ 2 / (2 * m) - kgRestSubtractedEnergy m c r ∧
      r ^ 2 / (2 * m) - kgRestSubtractedEnergy m c r ≤
        r ^ 4 / (8 * m ^ 3 * c ^ 2) := by
  sorry

/-- The scalar phase estimate used under the momentum spectral integral. -/
theorem kg_phase_error (m c ℏ r t : ℝ) (hm : 0 < m) (hc : 0 < c)
    (hℏ : 0 < ℏ) (hr : 0 ≤ r) :
    ‖Complex.exp (-Complex.I * ((t * kgRestSubtractedEnergy m c r / ℏ : ℝ) : ℂ)) -
      Complex.exp (-Complex.I * ((t * r ^ 2 / (2 * m * ℏ) : ℝ) : ℂ))‖ ≤
        |t| * r ^ 4 / (8 * ℏ * m ^ 3 * c ^ 2) := by
  sorry

/-- The common mode factor is necessary when summing the two time orderings.
This rational statement is separate from the README's boundary-value theorem. -/
theorem photon_time_ordering_sum (ω r : ℂ) (hr : r ≠ 0)
    (hm : ω - r ≠ 0) (hp : ω + r ≠ 0) :
    ((ω - r)⁻¹ - (ω + r)⁻¹) / (2 * r) = (ω ^ 2 - r ^ 2)⁻¹ := by
  sorry

/-- Transverse exchange plus instantaneous Coulomb exchange for conserved currents.
The currents have complex bilinear contractions; no additional conjugation is inserted. -/
theorem coulomb_transverse_covariant (ω : ℝ) (k : Fin 3 → ℝ)
    (ρ₁ ρ₂ : ℂ) (j₁ j₂ : Fin 3 → ℂ)
    (hk : (∑ i, (k i : ℂ) ^ 2) ≠ 0)
    (hd : (ω : ℂ) ^ 2 - ∑ i, (k i : ℂ) ^ 2 ≠ 0)
    (h₁ : ∑ i, (k i : ℂ) * j₁ i = (ω : ℂ) * ρ₁)
    (h₂ : ∑ i, (k i : ℂ) * j₂ i = (ω : ℂ) * ρ₂) :
    let s : ℂ := ∑ i, (k i : ℂ) ^ 2
    let d : ℂ := (ω : ℂ) ^ 2 - s
    let transverse : Fin 3 → ℂ :=
      fun i => j₂ i - (k i : ℂ) * (∑ l, (k l : ℂ) * j₂ l) / s
    (∑ i, j₁ i * transverse i) / d + ρ₁ * ρ₂ / s =
      -(ρ₁ * ρ₂ - ∑ i, j₁ i * j₂ i) / d := by
  sorry

end RelativisticQuantumFieldTheory

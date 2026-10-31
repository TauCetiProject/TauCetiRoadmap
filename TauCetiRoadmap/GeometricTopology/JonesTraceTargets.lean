import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Jones trace and kernel: suggested native targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The source crossing is expressed in the actual unnormalized Temperley–Lieb
algebra. The positive matrix statement applies to the supplier's faithful
positive quotient; it does not assert faithfulness of a singular root algebra.
The transcendental criterion concerns the actual algebra before quotienting.
The three admitted theorems are specification targets, not implemented proofs.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.JonesTrace

open TauCeti
open scoped BigOperators

/-- The positive-loop convention; the native spin-trace parameter is `-u`. -/
def loopValue (u : ℂˣ) : ℂ := (u : ℂ) + ((u⁻¹ : ℂˣ) : ℂ)

/-- Source `g_i=u*((1+u²)*p_i-1)`, with native `e_i=δ*p_i`.
No division by `δ` is needed, so the actual algebraic crossing also covers `δ=0`.
-/
def sourceGenerator (u : ℂˣ) (n : ℕ) (i : Fin (n - 1)) :
    TemperleyLieb ℂ (loopValue u) n :=
  (u : ℂ) ^ 2 • TemperleyLieb.e (loopValue u) i - (u : ℂ) • 1

/-- The actual inverse crossing, retaining the source scalar phase. -/
def sourceInverse (u : ℂˣ) (n : ℕ) (i : Fin (n - 1)) :
    TemperleyLieb ℂ (loopValue u) n :=
  (((u⁻¹ : ℂˣ) : ℂ) ^ 2) • TemperleyLieb.e (loopValue u) i -
    ((u⁻¹ : ℂˣ) : ℂ) • 1

/-- Native unnormalized trace, with `T(1)=δ^n`. -/
def sourceTrace (u : ℂˣ) (n : ℕ) :
    TemperleyLieb ℂ (loopValue u) n →ₗ[ℂ] ℂ :=
  TemperleyLieb.markovTrace (-u) (by simp [loopValue, add_comm])

@[simp] theorem sourceTrace_one (u : ℂˣ) (n : ℕ) :
    sourceTrace u n 1 = loopValue u ^ n := by
  exact TemperleyLieb.markovTrace_one _ _

/-- Construct using the native TL crossing relations and braid-group lift.
Both signs of every generator are pinned, including the scalar phase.
-/
theorem exists_sourceRepresentation (u : ℂˣ) (n : ℕ) :
    ∃ ρ : BraidGroup n →* (TemperleyLieb ℂ (loopValue u) n)ˣ,
      (∀ i, (ρ (BraidGroup.sigma i) : TemperleyLieb ℂ (loopValue u) n) =
        sourceGenerator u n i) ∧
      (∀ i, (ρ ((BraidGroup.sigma i)⁻¹) : TemperleyLieb ℂ (loopValue u) n) =
        sourceInverse u n i) := by
  sorry

/-- A normalized strictly positive diagonal density gives trace rigidity on
unitaries. Applied blockwise with the positive block weights, this supplies
`|tr U|≤1`, its scalar equality case and `tr U=1 ↔ U=1` for the
faithful positive quotient.
-/
theorem positive_weighted_unitary_trace {ι : Type*} [Fintype ι] [DecidableEq ι]
    (w : ι → ℝ) (hw : ∀ i, 0 < w i) (hsum : ∑ i, w i = 1)
    (U : Matrix.unitaryGroup ι ℂ) :
    let τ := Matrix.trace (Matrix.diagonal (fun i ↦ (w i : ℂ)) *
      (U : Matrix ι ι ℂ))
    ‖τ‖ ≤ 1 ∧ (τ = 1 ↔ U = 1) ∧
      (‖τ‖ = 1 ↔ ∃ z : ℂ, ‖z‖ = 1 ∧
        (U : Matrix ι ι ℂ) = z • (1 : Matrix ι ι ℂ)) := by
  sorry

/-- At a transcendental half-parameter, equality with the identity trace
recognizes the Jones kernel in the whole actual finite TL algebra. The forward
proof uses the flat diagram basis, injective transcendental evaluation and
infinitely many faithful pre-singular unit-root specializations, as specified
in the README. It does not assert that the braid representation is faithful.
-/
theorem transcendental_trace_kernel (u : ℂˣ) (hu : Transcendental ℚ (u : ℂ))
    (n : ℕ) (hn : 1 ≤ n)
    (ρ : BraidGroup n →* (TemperleyLieb ℂ (loopValue u) n)ˣ)
    (hρ : ∀ i, (ρ (BraidGroup.sigma i) : TemperleyLieb ℂ (loopValue u) n) =
      sourceGenerator u n i) (b : BraidGroup n) :
    sourceTrace u n (ρ b : TemperleyLieb ℂ (loopValue u) n) = loopValue u ^ n ↔
      ρ b = 1 := by
  sorry

end TauCetiRoadmap.GeometricTopology.JonesTrace

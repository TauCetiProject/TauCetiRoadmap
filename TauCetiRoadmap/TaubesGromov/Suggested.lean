import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.Tactic.NormNum

/-!
These are suggested forms, not an exhaustive checklist. README.md is the
 definitive specification.

Local four-twist multiplicity factors in the native integral power-series ring.
The Bool parameter is true for a positive determinant sign, false for a negative
sign; Fin 4 records the number of negative nontrivial twists. This file constructs
only series data and coefficient identities, with no geometric regularity or
curve-count interpretation assumed. It introduces no Novikov completion.
-/

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.TaubesGromov

/-- The four positive factors, in the order 0,1,2,3. Division is by a unit. -/
def positiveFactor (i : Fin 4) : PowerSeries ℤ :=
  if i = 0 then PowerSeries.mk 1
  else if i = 1 then 1 + PowerSeries.X
  else if i = 2 then
    (1 + PowerSeries.X) * PowerSeries.invOfUnit (1 + PowerSeries.X ^ 2) 1
  else
    (1 + PowerSeries.X) * (1 - PowerSeries.X ^ 2) *
      PowerSeries.invOfUnit (1 + PowerSeries.X ^ 2) 1

theorem constantCoeff_positiveFactor (i : Fin 4) :
    PowerSeries.constantCoeff (positiveFactor i) = 1 := by
  by_cases h0 : i = 0
  · simp [positiveFactor, h0, PowerSeries.constantCoeff_mk]
  by_cases h1 : i = 1
  · simp [positiveFactor, h0, h1, PowerSeries.constantCoeff_X]
  by_cases h2 : i = 2 <;>
    simp [positiveFactor, h0, h1, h2, PowerSeries.constantCoeff_X]

/-- A specific unit, using the native inverse recurrence with constant unit 1. -/
def positiveUnit (i : Fin 4) : (PowerSeries ℤ)ˣ where
  val := positiveFactor i
  inv := PowerSeries.invOfUnit (positiveFactor i) 1
  val_inv := PowerSeries.mul_invOfUnit _ _ (by simpa using constantCoeff_positiveFactor i)
  inv_val := PowerSeries.invOfUnit_mul _ _ (by simpa using constantCoeff_positiveFactor i)

theorem isUnit_positiveFactor (i : Fin 4) : IsUnit (positiveFactor i) :=
  ⟨positiveUnit i, rfl⟩

/-- Negative-sign weights use the inverse of the actual positive unit. -/
def negativeFactor (i : Fin 4) : PowerSeries ℤ := ↑((positiveUnit i)⁻¹)

theorem constantCoeff_negativeFactor (i : Fin 4) :
    PowerSeries.constantCoeff (negativeFactor i) = 1 := by
  simp [negativeFactor, positiveUnit]

theorem positive_mul_negative (i : Fin 4) :
    positiveFactor i * negativeFactor i = 1 :=
  (positiveUnit i).val_inv

theorem negative_mul_positive (i : Fin 4) :
    negativeFactor i * positiveFactor i = 1 :=
  (positiveUnit i).inv_val

/-- Finite sign/index data select the local factor; no geometric label is assumed. -/
def localFactor (positive : Bool) (i : Fin 4) : PowerSeries ℤ :=
  if positive then positiveFactor i else negativeFactor i

/-- The integer multiplicity coefficient of the specified native series. -/
def multiplicityWeight (positive : Bool) (i : Fin 4) (m : ℕ) : ℤ :=
  PowerSeries.coeff m (localFactor positive i)

theorem coefficient_convolution (s t : Bool) (i j : Fin 4) (n : ℕ) :
    PowerSeries.coeff n (localFactor s i * localFactor t j) =
      ∑ p ∈ Finset.antidiagonal n,
        multiplicityWeight s i p.1 * multiplicityWeight t j p.2 :=
  PowerSeries.coeff_mul n _ _

theorem positiveZero_mul_one_sub_X :
    positiveFactor 0 * (1 - PowerSeries.X) = 1 := by
  simpa [positiveFactor] using PowerSeries.mk_one_mul_one_sub_eq_one ℤ

theorem two_positiveZero_tori_degreeTwo :
    PowerSeries.coeff 2 (positiveFactor 0 * positiveFactor 0) = 3 := by
  change PowerSeries.coeff 2
    ((PowerSeries.mk 1 : PowerSeries ℤ) * PowerSeries.mk 1) = 3
  calc
    _ = PowerSeries.coeff 2 ((PowerSeries.mk 1 : PowerSeries ℤ) ^ (1 + 1)) := by
      simp [pow_two]
    _ = PowerSeries.coeff 2
        (PowerSeries.mk fun n => (Nat.choose (1 + n) 1 : ℤ)) :=
      congrArg (PowerSeries.coeff 2) (PowerSeries.mk_one_pow_eq_mk_choose_add ℤ 1)
    _ = 3 := by norm_num [PowerSeries.coeff_mk]

end TauCetiRoadmap.TaubesGromov

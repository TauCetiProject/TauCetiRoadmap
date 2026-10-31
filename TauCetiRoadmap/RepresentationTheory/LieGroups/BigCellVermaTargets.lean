import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Nat.Factorial.Basic

/-!
Suggested rank-one forms for README.md, which is definitive. This file is not
exhaustive; the admitted identities are future targets for the stated cell action.
-/

set_option autoImplicit false
noncomputable section

namespace TauCetiRoadmap.RepresentationTheory.LieGroups.BigCellVerma

open Polynomial

def raise (p : Polynomial ℂ) : Polynomial ℂ := -p.derivative

def lower (m : ℤ) (p : Polynomial ℂ) : Polynomial ℂ :=
  X ^ 2 * p.derivative - C (m : ℂ) * X * p

def cartan (m : ℤ) (p : Polynomial ℂ) : Polynomial ℂ :=
  C (m : ℂ) * p - C 2 * X * p.derivative

/-- The signs of the infinitesimal left section action on the negative-Borel cell. -/
theorem sl2_relations (m : ℤ) (p : Polynomial ℂ) :
    raise (lower m p) - lower m (raise p) = cartan m p ∧
    cartan m (raise p) - raise (cartan m p) = 2 • raise p ∧
    cartan m (lower m p) - lower m (cartan m p) = -(2 • lower m p) := by
  sorry

/-- Evaluation against the native Verma lowering string has this factorial normalization. -/
theorem raising_iterate_eval_zero (i j : ℕ) :
    ((raise^[j]) (X ^ i)).eval (0 : ℂ) =
      if i = j then (-1 : ℂ) ^ j * (j.factorial : ℂ) else 0 := by
  sorry

end TauCetiRoadmap.RepresentationTheory.LieGroups.BigCellVerma

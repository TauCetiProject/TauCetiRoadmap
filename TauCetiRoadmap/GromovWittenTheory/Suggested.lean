import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Basic.Real.Basic

/-!
This file suggests forms for the Gromov–Witten development; the README is definitive and this file is not exhaustive.

MorseNovikov N1 owns the generic finite-below Novikov completion. This sketch does not duplicate the generic completion. It records the concrete symplectic curve-class weights and their finite-support grading interface; the README specifies how the GW operation consumes N1.
-/

namespace TauCeti.GromovWitten

/-- The two homomorphisms on integral curve classes used by the GW coefficient
specialization: symplectic area and the first Chern number. The intended carrier
is `H₂(X; ℤ)`; generic Novikov completion belongs to MorseNovikov N1. -/
structure CurveClassWeights (H : Type*) [AddCommGroup H] where
  area : H →+ ℝ
  firstChern : H →+ ℤ

namespace CurveClassWeights

variable {H : Type*} [AddCommGroup H]

/-- The grading homomorphism assigned to the monomial of curve class `A`. -/
def quantumDegreeHom (w : CurveClassWeights H) : H →+ ℤ where
  toFun A := 2 * w.firstChern A
  map_zero' := by simp
  map_add' := by
    intro A B
    rw [map_add, mul_add]

/-- The integer cohomological degree of the curve-class monomial. -/
def quantumDegree (w : CurveClassWeights H) (A : H) : ℤ :=
  w.quantumDegreeHom A

@[simp] theorem quantumDegree_add (w : CurveClassWeights H) (A B : H) :
    w.quantumDegree (A + B) = w.quantumDegree A + w.quantumDegree B := by
  exact map_add w.quantumDegreeHom A B

/-- A finite group-ring element has only finitely many monomial degrees. This
records the finite-support grading before passing to the N1 completion. -/
def finiteSupportDegrees {R : Type*} [Semiring R] [DecidableEq H]
    (w : CurveClassWeights H) (f : AddMonoidAlgebra R H) : Finset ℤ :=
  f.coeff.support.image w.quantumDegreeHom

@[simp] theorem mem_finiteSupportDegrees {R : Type*} [Semiring R] [DecidableEq H]
    (w : CurveClassWeights H) (f : AddMonoidAlgebra R H) (d : ℤ) :
    d ∈ w.finiteSupportDegrees f ↔ ∃ A, A ∈ f.coeff.support ∧ w.quantumDegree A = d := by
  simp [finiteSupportDegrees, quantumDegree]

end CurveClassWeights

end TauCeti.GromovWitten

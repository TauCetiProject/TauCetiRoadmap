/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.NoetherNormalization
import Mathlib.RingTheory.AlgebraicIndependent.Defs
import Mathlib.Data.ZMod.Basic
import TauCeti.RingTheory.KrullDimension.FiniteType

/-!
This file is not the roadmap and is not exhaustive. The README is definitive.
These targets distinguish linear normalization over an infinite field from
ordinary normalization over arbitrary fields, using the given algebra generators.
-/

noncomputable section

namespace TauCetiRoadmap.SchemeAndStackFoundations.LinearNormalization

/-- Prescribed generators admit normalization by linear combinations over an infinite field.
The algebra may be reducible or nonreduced. Finiteness is the native ring-map property. -/
theorem exists_linear_normalization {k A : Type*} [Field k] [Infinite k]
    [CommRing A] [Nontrivial A] [Algebra k A]
    {n : ℕ} (x : Fin n → A) (hx : Algebra.adjoin k (Set.range x) = ⊤) :
    ∃ (d : ℕ) (_ : d ≤ n) (C : Matrix (Fin d) (Fin n) k),
      let y : Fin d → A := fun i => ∑ j, C i j • x j
      AlgebraicIndependent k y ∧
        (MvPolynomial.aeval y : MvPolynomial (Fin d) k →ₐ[k] A).Finite ∧
        ringKrullDim A = (d : WithBot ℕ∞) := by
  sorry

abbrev F2 := ZMod 2
abbrev Plane := MvPolynomial (Fin 2) F2

def threeLineIdeal : Ideal Plane :=
  Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 *
    (MvPolynomial.X 0 + MvPolynomial.X 1)}

abbrev ThreeLines := Plane ⧸ threeLineIdeal

def x : ThreeLines := Ideal.Quotient.mk threeLineIdeal (MvPolynomial.X 0)
def y : ThreeLines := Ideal.Quotient.mk threeLineIdeal (MvPolynomial.X 1)

/-- No linear form in the displayed two generators gives a finite normalization. -/
theorem not_finite_linear_parameter (a b : F2) :
    ¬ (Polynomial.aeval (a • x + b • y) : Polynomial F2 →ₐ[F2] ThreeLines).Finite := by
  sorry

/-- A nonlinear normalization still exists, with the precise parameter from the README. -/
def nonlinearParameter : ThreeLines := x ^ 2 + x * y + y ^ 2

theorem nonlinear_parameter_injective_finite :
    Function.Injective (Polynomial.aeval nonlinearParameter :
      Polynomial F2 →ₐ[F2] ThreeLines) ∧
      (Polynomial.aeval nonlinearParameter : Polynomial F2 →ₐ[F2] ThreeLines).Finite := by
  sorry

end TauCetiRoadmap.SchemeAndStackFoundations.LinearNormalization

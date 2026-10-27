import TauCeti.RepresentationTheory.ClassicalGroups.Rational
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.MvPolynomial

/-!
# Polynomial extensions across singular matrices: suggested signature

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
The statement uses the native polynomial GL representation predicate and asks
for an actual unital monoid action, with explicit polynomial entries on all
matrices. Classification and all-linear-map Schur functor comparisons are
separate targets in the README.
-/

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups

noncomputable section

open Matrix

universe u

/-- A polynomial GL action extends across singular matrices, on the same carrier.
The finite basis below simultaneously pins the polynomial-entry conclusion. -/
theorem polynomial_monoid_extension {N : ℕ} {W : Type u}
    [AddCommGroup W] [Module ℂ W] [Module.Finite ℂ W]
    (ρ : Representation ℂ (GL (Fin N) ℂ) W) (hρ : TauCeti.IsPolynomialRep ρ)
    (b : Module.Basis (Fin (Module.finrank ℂ W)) ℂ W) :
    ∃ Φ : Representation ℂ (Matrix (Fin N) (Fin N) ℂ) W,
      (∀ g : GL (Fin N) ℂ, Φ (g : Matrix (Fin N) (Fin N) ℂ) = ρ g) ∧
      ∃ P : Fin (Module.finrank ℂ W) → Fin (Module.finrank ℂ W) →
          MvPolynomial (Fin N × Fin N) ℂ,
        ∀ (A : Matrix (Fin N) (Fin N) ℂ) (i j : Fin (Module.finrank ℂ W)),
          LinearMap.toMatrix b b (Φ A) i j =
            MvPolynomial.eval (fun p => A p.1 p.2) (P i j) := by
  sorry

end

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups

import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff

/-!
# Matrix specialization of Newton identities: suggested signature

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
The native reversed characteristic polynomial fixes all coefficient signs.
The target is integral and applies to every commutative ring, including in
positive characteristic; division enters only the separate rational formula.
-/

namespace TauCetiRoadmap.RepresentationTheory.SchurWeyl

universe u

/-- Newton's integral recurrence for det(1-tA), on the actual matrix carrier. -/
theorem matrix_trace_newton {R : Type u} [CommRing R] {d : ℕ}
    (A : Matrix (Fin d) (Fin d) R) (r : ℕ) (hr : 0 < r) :
    (r : R) * A.charpolyRev.coeff r =
      -(∑ j ∈ Finset.range r,
        A.charpolyRev.coeff (r - (j + 1)) * Matrix.trace (A ^ (j + 1))) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.SchurWeyl

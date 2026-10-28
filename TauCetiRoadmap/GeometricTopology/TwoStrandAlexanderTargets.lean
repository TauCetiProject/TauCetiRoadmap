import Mathlib

/-!
# The source155 two-strand Alexander continuants

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The matrix and polynomial targets below use native polynomial/Laurent rings.
The braid, meridional Fox and geometric-link comparisons are additional README
requirements, not supplied by an abstract recurrence.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.TwoStrandAlexander

open Polynomial LaurentPolynomial

def minor (r : ℕ) : Matrix (Fin r) (Fin r) ℤ[X] :=
  fun i j => if i = j then 1 - X
    else if i.val + 1 = j.val then X
    else if j.val + 1 = i.val then -1 else 0

def raw (n : ℕ) : ℤ[X] := ∑ j ∈ Finset.range n, (-X) ^ j

/-- The zero-sized determinant gives the one-crossing unknot branch. -/
theorem continuant_det (r : ℕ) : (minor r).det = raw (r + 1) := by
  sorry

/-- A polynomial identity, valid also at the apparent singular value X = -1. -/
theorem division_free (n : ℕ) : (1 + X) * raw n = 1 - (-X) ^ n := by
  sorry

/-- The generator of this Laurent ring is the half-variable s. -/
def normalized (n : ℕ) : ℤ[T;T⁻¹] :=
  ∑ j ∈ Finset.range n,
    (-1 : ℤ[T;T⁻¹]) ^ j * T (2 * (j : ℤ) - ((n : ℤ) - 1))

/-- The sign agrees with the README's Δ₊ - Δ₋ + z Δ₀ = 0 convention. -/
theorem normalized_recurrence (n : ℕ) :
    normalized (n + 2) = normalized n - (T 1 - T (-1)) * normalized (n + 1) := by
  sorry

end TauCetiRoadmap.GeometricTopology.TwoStrandAlexander

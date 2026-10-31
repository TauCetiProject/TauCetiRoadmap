import Mathlib
import Mathlib.Algebra.ContinuedFractions.Computation.TerminatesIffRat

/-!
# Reversed continued-fraction conventions for the course tangles

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The explicit projective arithmetic below is a convention adapter. The native
rational algorithm supplies the ordinary continued fractions; geometric tangle
classification and the marked twist/port comparison are separate README targets.
-/

namespace TauCetiRoadmap.GeometricTopology.ReversedContinuedFraction

/-- Projective reciprocal, with zero and infinity exchanged. -/
def reciprocal : WithTop ℚ → WithTop ℚ
  | none => 0
  | some q => if q = 0 then ⊤ else (q⁻¹ : ℚ)

/-- Only translation by a finite integer is used; infinity is fixed. -/
def translate (a : ℤ) : WithTop ℚ → WithTop ℚ
  | none => ⊤
  | some q => (q + a : ℚ)

/-- The source reads coefficients from the innermost to the outermost. -/
def value (w : List ℤ) : WithTop ℚ :=
  w.foldl (fun q a => translate a (reciprocal q)) ⊤

/-- Reverse the list to the usual outermost-first regular continued fraction. -/
def positiveCanonical (w : List ℤ) : Prop :=
  match w.reverse with
  | [] => False
  | [a] => 0 < a
  | a :: b :: bs => 0 ≤ a ∧ (∀ c ∈ b :: bs, 0 < c) ∧
      (∀ c ∈ (b :: bs).getLast?, 2 ≤ c)

/-- Every positive rational has exactly one expansion in the corrected domain.
An outermost zero is essential for values strictly between zero and one. -/
theorem existsUnique_positive (q : ℚ) (hq : 0 < q) :
    ∃! w : List ℤ, positiveCanonical w ∧ value w = (q : WithTop ℚ) := by
  sorry

/-- Use Mathlib's existing rational algorithm rather than a new Euclidean stream. -/
theorem native_rational_termination (q : ℚ) :
    (GenContFract.of q).Terminates := GenContFract.terminates_of_rat q

theorem source_examples :
    value [2,0] = ((1/2 : ℚ) : WithTop ℚ) ∧
    value [-2,0] = ((-1/2 : ℚ) : WithTop ℚ) ∧
    value [3,2] = ((7/3 : ℚ) : WithTop ℚ) ∧
    value [2,1,1] = ((5/3 : ℚ) : WithTop ℚ) ∧
    value [3,2,-4] = ((-25/7 : ℚ) : WithTop ℚ) ∧
    value [-3,-1,-1,-3] = ((-25/7 : ℚ) : WithTop ℚ) ∧
    value [0] = (0 : WithTop ℚ) ∧ value [0,0] = ⊤ := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.ReversedContinuedFraction

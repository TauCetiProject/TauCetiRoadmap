import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. These are the literal finite signed words and
representative native Jones targets for exercise 29. The diagram, Markov,
external table-code and named-knot comparisons remain README targets.
The three `sorry` proofs are future targets, not completed calculations.
-/

namespace TauCetiRoadmap.GeometricTopology.BraidExercise29

open TauCeti LaurentPolynomial

/-- The five-strand word, with zero-based native generator indices. -/
def fiveStrand : BraidWord 5 :=
  [(0, 1), (1, 1), (2, 1), (1, -1), (3, 1), (0, -1)]

/-- The four-strand word from 29(b), expanded into its nine crossings. -/
def stevedoreAnswer : BraidWord 4 :=
  [(0, -1), (1, 1), (2, -1), (0, -1), (1, 1), (2, -1),
   (2, 1), (2, 1), (2, 1)]

/-- The first printed 29(c) answer, retaining the negative second block. -/
def firstAnswer : BraidWord 3 :=
  [(0, -1), (0, -1), (1, -1), (1, -1), (0, -1), (1, -1)]

/-- The second printed answer, which is the valid six-three representative. -/
def secondAnswer : BraidWord 3 :=
  [(1, -1), (1, -1), (0, 1), (1, -1), (0, 1), (0, 1)]

/-- This fixes the handedness: the source word closes to the mirror of the
Atlas six-one representative in the README's fixed dictionary. -/
theorem stevedoreAnswer_jones : stevedoreAnswer.closure.jonesPolynomial =
    T (-4) - T (-2) + 2 - 2 * T 2 + T 4 - T 6 + T 8 := by
  sorry

/-- The native variable is T=t^(1/2); this doubles the conventional exponents. -/
theorem firstAnswer_jones : firstAnswer.closure.jonesPolynomial =
    T (-4) + T (-8) - T (-10) + T (-12) - T (-14) := by
  sorry

/-- The symmetric Jones polynomial of the actual second word's PD closure. -/
theorem secondAnswer_jones : secondAnswer.closure.jonesPolynomial =
    -T (-6) + 2 * T (-4) - 2 * T (-2) + 3 - 2 * T 2 + 2 * T 4 - T 6 := by
  sorry

end TauCetiRoadmap.GeometricTopology.BraidExercise29

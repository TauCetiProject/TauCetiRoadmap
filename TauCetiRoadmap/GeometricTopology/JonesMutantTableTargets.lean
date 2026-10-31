import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. Its explicit four-strand models use actual native
words and PD closures; the native Jones variable is T=t^(1/2). The source's
initial KT run remains qualified separately.
Named-knot realization and isotopy comparisons remain separate geometric targets.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.JonesMutantTable

open TauCeti LaurentPolynomial

def ktWord : BraidWord 4 :=
  [(0, 1), (0, 1), (0, 1), (2, 1), (2, 1), (1, 1), (2, -1),
    (0, -1), (0, -1), (1, 1), (0, -1), (2, -1), (1, -1)]

def conwayWord : BraidWord 4 :=
  [(1, 1), (1, 1), (1, 1), (0, 1), (2, -1), (1, -1),
    (1, -1), (0, 1), (1, -1), (0, 1), (2, -1)]

/-- The competing initial run has one additional positive first generator. -/
def ktFourWord : BraidWord 4 := (0, 1) :: ktWord

def commonJones : LaurentPolynomial ℤ :=
  -T (-8) + 2 * T (-6) - 2 * T (-4) + 2 * T (-2) + T 4 -
    2 * T 6 + 2 * T 8 - 2 * T 10 + T 12

def commonW : LaurentPolynomial ℤ :=
  T (-8) - T (-6) + T (-4) - 1 + T 2 - T 4

theorem ktFour_component_count : ktFourWord.closure.componentCount = 2 := by
  sorry

theorem ktFour_not_jones : ktFourWord.closure.jonesPolynomial ≠ commonJones := by
  sorry

theorem kt_jones : ktWord.closure.jonesPolynomial = commonJones := by
  sorry

theorem conway_jones : conwayWord.closure.jonesPolynomial = commonJones := by
  sorry

/-- The displayed quotient identity is in the native half-variable ring. -/
theorem quotient_identity :
    1 - commonJones = (1 - T 2) * (1 - T 6) * commonW := by
  sorry

end TauCetiRoadmap.GeometricTopology.JonesMutantTable

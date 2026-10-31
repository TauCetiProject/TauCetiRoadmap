import TauCeti.KnotTheory.PDCode.Jones
import TauCeti.KnotTheory.PDCode.Planar

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These native PD inputs support problem21's six prime rows. The twenty-class
geometric classification and every reduction/separation certificate remain
README targets. Two admissions give representative native interfaces only.
-/

namespace TauCetiRoadmap.GeometricTopology.TwoComponentTable

open TauCeti LaurentPolynomial

/-- A literal fixed-point-free involution supplies the existing PD matching. -/
def pairedCode {n : ℕ} (p : Fin (4*n) → Fin (4*n))
    (hi : ∀ i, p (p i) = i) (hf : ∀ i, p i ≠ i) : PDCode n where
  halfEdge := Equiv.refl _
  edgePair := PerfectMatching.mk
    { toFun := p, invFun := p, left_inv := hi, right_inv := hi } hi hf
  crossinglessComponentCount := 0
  overPair := fun _ => true

/-- Atlas L2a1: arc-label occurrences paired in crossing-slot order. -/
def l2a1 : PDCode 2 :=
  pairedCode ![7,6,5,4,3,2,1,0] (by decide +kernel) (by decide +kernel)

/-- Atlas L4a1: arc-label occurrences paired in crossing-slot order. -/
def l4a1 : PDCode 4 :=
  pairedCode ![11,14,13,8,15,10,9,12,3,6,5,0,7,2,1,4] (by decide +kernel) (by decide +kernel)

/-- Atlas L5a1: arc-label occurrences paired in crossing-slot order. -/
def l5a1 : PDCode 5 :=
  pairedCode ![11,10,5,12,13,2,9,16,17,6,1,0,3,4,19,18,7,8,15,14] (by decide +kernel) (by decide +kernel)

/-- Atlas L6a1: arc-label occurrences paired in crossing-slot order. -/
def l6a1 : PDCode 6 :=
  pairedCode ![19,22,11,16,23,18,15,20,13,12,17,2,9,8,21,6,3,10,5,0,7,14,1,4] (by decide +kernel) (by decide +kernel)

/-- Atlas L6a2: arc-label occurrences paired in crossing-slot order. -/
def l6a2 : PDCode 6 :=
  pairedCode ![19,22,21,16,15,14,17,20,23,18,13,12,11,10,5,4,3,6,9,0,7,2,1,8] (by decide +kernel) (by decide +kernel)

/-- Atlas L6a3: arc-label occurrences paired in crossing-slot order. -/
def l6a3 : PDCode 6 :=
  pairedCode ![19,18,5,4,3,2,9,8,7,6,21,20,23,22,17,16,15,14,1,0,11,10,13,12] (by decide +kernel) (by decide +kernel)

def primeCodes : List (Σ n : ℕ, PDCode n) :=
  [⟨2,l2a1⟩,⟨4,l4a1⟩,⟨5,l5a1⟩,⟨6,l6a1⟩,⟨6,l6a2⟩,⟨6,l6a3⟩]

/-- The component/face counts and planarity do not assert named-link identity. -/
theorem prime_code_checks : ∀ D ∈ primeCodes,
    D.2.componentCount = 2 ∧ D.2.faceCount = D.1 + 2 ∧ D.2.IsPlanar := by
  sorry

/-- The exact Jones monomial adapter for two orientations of one underlying code.
A single component reversal in the planar two-component case has k=-linking. -/
theorem jones_reorientation {n : ℕ} (D E : OrientedPDCode n)
    (hcode : D.toPDCode = E.toPDCode) (k : ℤ)
    (hw : E.writhe - D.writhe = 4*k) :
    E.jonesPolynomial = T (6*k) * D.jonesPolynomial := by
  sorry

end TauCetiRoadmap.GeometricTopology.TwoComponentTable

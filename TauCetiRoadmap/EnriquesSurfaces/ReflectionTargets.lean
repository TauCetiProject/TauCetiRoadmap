import TauCetiRoadmap.EnriquesSurfaces.LatticeTargets
import TauCeti.GroupTheory.Coxeter.Geometric

/-!
Suggested interfaces for EnriquesSurfaces E5; the README is definitive and this
companion is nonexhaustive. The standard real form is compared with the negative
geometric intersection form, including its factor of two. No finite-root
positive-definiteness assumption is made for this indefinite Coxeter diagram.
-/

namespace TauCetiRoadmap.EnriquesSurfaces

def t246Entries : Matrix Index Index ℕ :=
  fun i j ↦ if i = j then 1 else if adjacent i j then 3 else 2

def t246 : CoxeterMatrix Index where
  M := t246Entries
  isSymm := by decide +kernel
  diagonal i := by simp [t246Entries]
  off_diagonal i j h := by simp only [t246Entries, h, ite_false]; split_ifs <;> decide

noncomputable def realRoot (i : Index) : Index → ℝ :=
  fun j ↦ (betaCoordinates i j : ℝ)

/-- Scalar extension followed by the actual beta coordinate map. -/
noncomputable def rootMap : (Index →₀ ℝ) →ₗ[ℝ] (Index → ℝ) :=
  Finsupp.linearCombination ℝ realRoot

noncomputable def realIntersection : LinearMap.BilinForm ℝ (Index → ℝ) :=
  Matrix.toBilin (Pi.basisFun ℝ Index) (gram.map (Int.castRingHom ℝ))

noncomputable def realReflection (i : Index) : Module.End ℝ (Index → ℝ) :=
  LinearMap.id + LinearMap.smulRight (realIntersection (realRoot i)) (realRoot i)

theorem rootMap_bijective : Function.Bijective rootMap := by sorry

/-- Native standard B has diagonal 1, whereas geometric intersection has -2. -/
theorem rootMap_form (u v : Index →₀ ℝ) :
    -(realIntersection (rootMap u) (rootMap v)) = 2 * t246.geometricForm u v := by sorry

theorem rootMap_reflection (i : Index) :
    rootMap.comp (t246.geometricReflection i) = (realReflection i).comp rootMap := by sorry

end TauCetiRoadmap.EnriquesSurfaces

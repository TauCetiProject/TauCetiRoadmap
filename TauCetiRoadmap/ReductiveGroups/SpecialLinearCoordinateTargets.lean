import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic

/-!
These are suggested forms, not the roadmap or an exhaustive checklist.
The ReductiveGroups README specifies the full coordinate Hopf dictionary.
The points use the existing native determinant-kernel Hopf quotient.
-/

namespace TauCetiRoadmap.ReductiveGroups.SpecialLinearCoordinates

/-- Polynomial presentation of the determinant-one relation. -/
noncomputable def determinantRelation (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  Matrix.det (fun i j => MvPolynomial.X (i,j)) - 1

/-- Remove the redundant determinant localization from native O(SL_n). -/
noncomputable def coordinatePresentation (n : ℕ) :
    TauCeti.SpecialLinear.coordinateHopfAlgebra ℤ n ≃ₐ[ℤ]
      (MvPolynomial (Fin n × Fin n) ℤ) ⧸
        Ideal.span {determinantRelation n} := by
  sorry

#check TauCeti.SpecialLinear.pointsMulEquiv
#check TauCeti.SpecialLinear.pointsNatIso
#check TauCeti.SpecialLinear.pointsMulEquiv_mapValue
#check TauCeti.SpecialLinear.coordinateMap_determinantGroupLike

end TauCetiRoadmap.ReductiveGroups.SpecialLinearCoordinates

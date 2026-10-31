import TauCeti.KnotTheory.TristramLevine.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

Matrix targets for the signature crossing-change argument on physical pages102–103
of the course notes. The geometric comparison of the two Seifert presentations,
their integral bases, and the realized crossing-change movies belongs to GT6.
The `sorry` proofs below are future targets, not implemented estimates.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.CrossingChange

open TauCeti.KnotTheory

variable {ι : Type*} [Fintype ι]

/-- A Hermitian rank-one perturbation changes signature by at most two, including
when either form is singular. No nonsingularity or nonzero-vector assumption. -/
theorem hermitian_signature_change_le_two (A B : Matrix ι ι ℂ)
    (hA : A.IsHermitian) (hB : B.IsHermitian) (v : ι → ℂ) (c : ℝ)
    (hAB : A - B = (c : ℂ) • Matrix.vecMulVec v (star v)) :
    |hA.signature - hB.signature| ≤ 2 := by
  sorry

/-- The algebraic estimate for a symmetric rank-one change of a real Seifert
matrix. The formula is Hermitian for every complex parameter. Geometric
presentation descent in the README is restricted to unit parameters. -/
theorem tristramLevine_signature_change_le_two (V W : Matrix ι ι ℝ)
    (v : ι → ℝ) (c : ℝ)
    (hVW : V - W = c • Matrix.vecMulVec v v) (ω : ℂ) :
    |tristramLevineSignature V ω - tristramLevineSignature W ω| ≤ 2 := by
  sorry

/-- The classical estimate uses the native real matrix signature, which sees
the symmetric part of a matrix. -/
theorem classical_signature_change_le_two (V W : Matrix ι ι ℝ)
    (v : ι → ℝ) (c : ℝ)
    (hVW : V - W = c • Matrix.vecMulVec v v) :
    |Matrix.signature V - Matrix.signature W| ≤ 2 := by
  simpa only [tristramLevineSignature_neg_one] using
    tristramLevine_signature_change_le_two V W v c hVW (-1)

end TauCetiRoadmap.GeometricTopology.CrossingChange

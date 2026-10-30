import TauCetiRoadmap.OperatorTheory.ToeplitzOperators.Suggested

/-!
Suggested target forms, not an exhaustive checklist. The README is definitive.
T4: stable square compressions force ambient invertibility and give strong
inverse convergence with a quantitative solution error. These are theorem targets.
-/

noncomputable section
open Filter Topology

namespace TauCetiRoadmap.ToeplitzOperators

/-- J_n J_n† on the ambient native l² space. -/
def sectionProjection (n : ℕ) : SequenceL2 →L[ℂ] SequenceL2 :=
  (coordinateCutoff n).adjoint ∘L coordinateCutoff n

/-- Zero extension of the totalized finite inverse; only the stable tail
uses it as an actual inverse on the finite corner. -/
def extendedSectionInverse (T : SequenceL2 →L[ℂ] SequenceL2) (n : ℕ) :
    SequenceL2 →L[ℂ] SequenceL2 :=
  (coordinateCutoff n).adjoint ∘L Ring.inverse (finiteSection T n) ∘L coordinateCutoff n

/-- The second strong limit is needed for surjectivity of the limit operator. -/
theorem stableSections_isUnit_and_inverse_tendsto
    (T : SequenceL2 →L[ℂ] SequenceL2)
    (hStable : StableSections (finiteSection T)) :
    IsUnit T ∧
      (∀ x : SequenceL2,
        Tendsto (fun n => extendedSectionInverse T n x) atTop (𝓝 (Ring.inverse T x))) ∧
      (∀ x : SequenceL2,
        Tendsto (fun n => (extendedSectionInverse T n).adjoint x) atTop
          (𝓝 ((Ring.inverse T).adjoint x))) := by
  sorry

/-- A chosen actual eventual bound is inherited by the ambient inverse. -/
theorem stableSections_inverse_norm_le (T : SequenceL2 →L[ℂ] SequenceL2)
    (N : ℕ) (C : ℝ) (hC : 0 < C)
    (hTail : ∀ n ≥ N,
      IsUnit (finiteSection T n) ∧ ‖Ring.inverse (finiteSection T n)‖ ≤ C) :
    IsUnit T ∧ ‖Ring.inverse T‖ ≤ C := by
  sorry

/-- The projection tail of the exact solution controls the computed solution.
The ambient inverse is guaranteed by the same hTail, without a further assumption. -/
theorem stableSections_solution_error (T : SequenceL2 →L[ℂ] SequenceL2)
    (N : ℕ) (C : ℝ) (hC : 0 < C)
    (hTail : ∀ n ≥ N,
      IsUnit (finiteSection T n) ∧ ‖Ring.inverse (finiteSection T n)‖ ≤ C)
    (b : SequenceL2) (n : ℕ) (hn : N ≤ n) :
    ‖extendedSectionInverse T n b - Ring.inverse T b‖ ≤
      (1 + C * ‖T‖) *
        ‖Ring.inverse T b - sectionProjection n (Ring.inverse T b)‖ := by
  sorry

end TauCetiRoadmap.ToeplitzOperators

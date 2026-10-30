import TauCetiRoadmap.StochasticCalculus.Suggested

/-!
Representative normalization lemmas for the common half-line Lebesgue convention
specified by SC and PointProcesses. The README is the definitive specification;
these prototypes do not exhaust the point-process adapters.
-/

open MeasureTheory ProbabilityTheory
open scoped NNReal

namespace StochasticCalculusSuggested

theorem nnvolume_eq_comap_volume :
    nnvolume = Measure.comap ((↑) : ℝ≥0 → ℝ) volume := rfl

theorem timeMeasure_eq_comap_volume (T : ℝ≥0) :
    timeMeasure T = (Measure.comap ((↑) : ℝ≥0 → ℝ) volume).restrict (Set.Ioc 0 T) := rfl

theorem predictableMeasure_eq_comap_volume {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) (T : ℝ≥0) :
    predictableMeasure F P T =
      ((((Measure.comap ((↑) : ℝ≥0 → ℝ) volume).restrict (Set.Ioc 0 T)).prod P).trim
        (predictable_le_prod F)) := rfl

end StochasticCalculusSuggested

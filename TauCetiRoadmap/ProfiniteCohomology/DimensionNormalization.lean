import TauCetiRoadmap.ProfiniteCohomology.CohomologyUniverseComparison

/-!
# PC11.U: dimension transport after the actual cohomology comparison

The predecessor's `rfl` failed because canonical homology retains a hidden universe choice.
The coefficient carriers coincide, but this file now uses the concrete all-degree comparison
from CohomologyUniverseComparison. That producer's construction targets are honest/uncompiled.
There is no bare-sorry predicate or dimension equality and no Type-0 group restriction.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.ProfiniteCohomology

universe u

variable (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Compare the actual vanishing predicates using the same coefficient modules and the
all-degree additive equivalences, rather than identifying the canonical objects by rfl. -/
theorem cohomologicalDimensionLE_native_sameUniverse_iff (n : ℕ) :
    TauCeti.CohomologicalDimensionLE.{u} p G n ↔ CohomologicalDimensionLE p G n := by
  unfold CohomologicalDimensionLE TauCeti.CohomologicalDimensionLE
  constructor
  · intro h M _ _ _ _ _ hM i hi
    exact (UniverseComparison.canonicalCohomology_subsingleton_iff G M i).mp (h M hM i hi)
  · intro h M _ _ _ _ _ hM i hi
    exact (UniverseComparison.canonicalCohomology_subsingleton_iff G M i).mpr (h M hM i hi)

/-- Transport equality of the vanishing predicates through the existing least-bound
invariant. The mathematical dependence on the cohomology producer is explicit. -/
theorem nativeCohomologicalDimensionAt_eq_cd_p :
    TauCeti.cohomologicalDimensionAt.{u} p G = cd_p p G := by
  unfold cd_p TauCeti.cohomologicalDimensionAt
  apply congrArg TauCeti.leastENatBound
  funext n
  exact propext (cohomologicalDimensionLE_native_sameUniverse_iff p G n)

end TauCetiRoadmap.ProfiniteCohomology

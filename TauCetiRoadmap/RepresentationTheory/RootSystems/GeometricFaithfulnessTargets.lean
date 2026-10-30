import TauCeti.GroupTheory.Coxeter.Geometric

/-!
Suggested forms for RootSystems 3G; README.md is definitive and this companion
is nonexhaustive. The generic exchange, deletion, parabolic and dihedral
theorems the proof consumes are already in the pinned Tau Ceti; the native
import constructs the representation and the exact rank-two orders. The proof
route (rank-two positivity, the right-descent sign criterion) is in README 3G.
-/

namespace TauCetiRoadmap.RootSystems

theorem geometricRepresentation_injective {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) :
    Function.Injective cs.geometricRepresentation := by sorry

end TauCetiRoadmap.RootSystems

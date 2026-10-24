import TauCeti.GroupTheory.Coxeter.Geometric

/-!
Suggested forms for RootSystems 3G; README.md is definitive and this companion
is nonexhaustive. Generic exchange/deletion is commissioned in RootSystems
Layer 3 independently of finite root systems and of this representation's
faithfulness. The native import constructs the representation and rank-two
orders; the theorem below is additional future work.
-/

namespace TauCetiRoadmap.RootSystems

theorem geometricRepresentation_injective {I W : Type*} [Group W]
    {M : CoxeterMatrix I} (cs : CoxeterSystem M W) :
    Function.Injective cs.geometricRepresentation := by sorry

end TauCetiRoadmap.RootSystems

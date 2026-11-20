import Mathlib
import TauCeti.Algebra.Lie.LeviDecomposition.Solvable
import TauCeti.RepresentationTheory.Lie.NilpotentFaithful
import TauCeti.RepresentationTheory.Lie.Ado.CharacteristicZero
import TauCeti.RepresentationTheory.Lie.Ado.PositiveCharacteristic
import TauCeti.RepresentationTheory.Lie.Ado.ArbitraryField

/-!
# Ado–Iwasawa: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
names the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti.

Every headline theorem is statable at the pins, and every one is proved at the Tau Ceti pin, so
this file restates none of them and pins the library declarations instead:

* the Ado–Iwasawa theorem over an arbitrary field, `TauCeti.adoIwasawa`, its matrix form
  `TauCeti.exists_injective_lieHom_matrix` and its reading as a finite-dimensional associative
  target of the enveloping algebra, `TauCeti.exists_finiteEnvelopingTarget` (README Layer 9);
* Hochschild's strengthening over an arbitrary field, `TauCeti.exists_faithful_preserving_ad_nilpotence`,
  and its consequence for nilpotent Lie algebras,
  `TauCeti.exists_faithful_nilrepresentation_of_isNilpotent` (Layer 9);
* the two characteristic tracks: `TauCeti.adoCharZero` and
  `TauCeti.exists_faithful_preserving_ad_nilpotence_charZero` (Layer 5),
  `TauCeti.adoCharP` and `TauCeti.exists_faithful_preserving_ad_nilpotence_charP` (Layer 8);
* the characteristic-free Birkhoff theorem for nilpotent Lie algebras by a weighted PBW truncation,
  `TauCeti.exists_faithful_weightedPBWRepresentation` (Layer 2);
* Levi's theorem in its internal and its semidirect-sum form, `TauCeti.exists_leviComplement` and
  `TauCeti.exists_leviDecomposition` (Layer 5).

The targets of the README that the pins do not prove are API facts and supporting lemmas, not
headline theorems; they are stated in the README and not here.
-/

namespace TauCetiRoadmap.RepresentationTheory.AdoIwasawa

#check @TauCeti.adoIwasawa
#check @TauCeti.exists_injective_lieHom_matrix
#check @TauCeti.exists_finiteEnvelopingTarget
#check @TauCeti.exists_faithful_preserving_ad_nilpotence
#check @TauCeti.exists_faithful_nilrepresentation_of_isNilpotent
#check @TauCeti.adoCharZero
#check @TauCeti.exists_faithful_preserving_ad_nilpotence_charZero
#check @TauCeti.adoCharP
#check @TauCeti.exists_faithful_preserving_ad_nilpotence_charP
#check @TauCeti.exists_faithful_weightedPBWRepresentation
#check @TauCeti.exists_leviComplement
#check @TauCeti.exists_leviDecomposition

end TauCetiRoadmap.RepresentationTheory.AdoIwasawa

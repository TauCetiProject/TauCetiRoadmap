import Mathlib
import TauCeti.Algebra.Lie.Nilradical
import TauCeti.Algebra.Lie.Derivation.Solvable
import TauCeti.Algebra.Lie.LeviDecomposition.Solvable
import TauCeti.Algebra.Lie.UniversalEnveloping.Derivation.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.CofiniteRefinement
import TauCeti.Algebra.Lie.UniversalEnveloping.PCenter
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Embedding
import TauCeti.RepresentationTheory.Lie.FiniteTarget
import TauCeti.RepresentationTheory.Lie.NilpotentFaithful
import TauCeti.RepresentationTheory.Lie.EnvelopingExtension.Nilrepresentation
import TauCeti.RepresentationTheory.Lie.Ado.CharacteristicZero
import TauCeti.RepresentationTheory.Lie.Ado.PositiveCharacteristic
import TauCeti.RepresentationTheory.Lie.Ado.CharP
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
  `TauCeti.exists_leviDecomposition` (Layer 5);
* the deep inputs the two tracks are built on: the nilradical `TauCeti.LieAlgebra.nilradical` with
  `TauCeti.LieAlgebra.maxNilpotentIdeal_le_nilradical` and
  `TauCeti.LieAlgebra.isNilpotent_ad_of_mem_nilradical` (Layer 0); the finite-target reduction
  `TauCeti.ado_of_finiteAssociativeEmbedding`, `TauCeti.ado_of_finiteEnvelopingTarget` and
  `TauCeti.faithfulRepresentation_iff_finiteEnvelopingTarget` (Layer 0); injectivity of the
  canonical map into the enveloping algebra, `TauCeti.UniversalEnvelopingAlgebra.ι_injective`
  (Layer 1); the derivation of the enveloping algebra extending a Lie derivation,
  `TauCeti.UniversalEnvelopingAlgebra.envelopingDerivation` (Layer 3); the image of the radical
  under a derivation in characteristic zero, `LieDerivation.apply_mem_nilradical_of_mem_radical`, and
  the radical criterion `TauCeti.LieAlgebra.mem_nilradical_of_mem_radical_of_isNilpotent_ad`
  (Layers 3 and 5); the derivation-stable cofinite refinement
  `Ideal.exists_cofinite_refinement_stableDerivations_of_isSolvable` (Layer 3); the extension of
  nilrepresentations across split extensions, `TauCeti.exists_semiDirectSum_rep_of_isSolvable` and
  `TauCeti.exists_semiDirectSum_rep_of_isNilpotent` (Layer 4); and the central `p`-polynomials
  `TauCeti.UniversalEnvelopingAlgebra.exists_pCentralPolynomial` (Layer 6).

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
#check @TauCeti.LieAlgebra.nilradical
#check @TauCeti.LieAlgebra.maxNilpotentIdeal_le_nilradical
#check @TauCeti.LieAlgebra.isNilpotent_ad_of_mem_nilradical
#check @TauCeti.ado_of_finiteAssociativeEmbedding
#check @TauCeti.ado_of_finiteEnvelopingTarget
#check @TauCeti.faithfulRepresentation_iff_finiteEnvelopingTarget
#check @TauCeti.UniversalEnvelopingAlgebra.ι_injective
#check @TauCeti.UniversalEnvelopingAlgebra.envelopingDerivation
#check @LieDerivation.apply_mem_nilradical_of_mem_radical
#check @TauCeti.LieAlgebra.mem_nilradical_of_mem_radical_of_isNilpotent_ad
#check @Ideal.exists_cofinite_refinement_stableDerivations_of_isSolvable
#check @TauCeti.exists_semiDirectSum_rep_of_isSolvable
#check @TauCeti.exists_semiDirectSum_rep_of_isNilpotent
#check @TauCeti.UniversalEnvelopingAlgebra.exists_pCentralPolynomial

end TauCetiRoadmap.RepresentationTheory.AdoIwasawa

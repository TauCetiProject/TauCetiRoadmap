import Mathlib

/-!
# Schubert geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. None of the following headlines
is statable at the pins of this folder's manifest:
* S1's relative parabolic representability and Schubert/incidence comparison
  need relative parabolic and flag schemes with
  their determinantal Schubert subschemes; the native Grassmannian is a module carrier.
* S2/S5's all-word image and derived pushforward theorems need Bott–Samelson
  schemes, their multiplication maps and their associated invertible sheaves.
* S3's geometric Demazure and Weyl character theorems need those flag line bundles
  and their section representations; the Demazure operators themselves are the
  native `RootPairing.demazureOperator` of `TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/`,
  a file that the Tau Ceti revision pinned by this folder's manifest does not have.
* S4's operator-stability, component, character and tensor theorems are stated
  on `TauCeti.LSPath`, `TauCeti.PLPath.lower`, `TauCeti.NormalCrystal` and
  `RootPairing.demazureOperator` (`TauCeti/RepresentationTheory/LSPath/`,
  `TauCeti/RepresentationTheory/Crystal/`); the Tau Ceti revision pinned by this
  folder's manifest has none of these files, so they are not statable at its pins
  and are stated once the manifest pins a revision that carries them.
* S5's splitting, normality and vanishing theorems need the Schubert schemes
  and their Frobenius-module and coherent-cohomology constructions.
* S6's all-degree standard monomial theorem needs geometric path sections and
  the Schubert section ring, not just a polynomial ring with named minors.
* S7's Chevalley and cycle comparisons need Schubert cycles and their Chow classes.
* S8's flag K-ring presentation needs the flag's algebraic K-ring and characteristic map.
* S9.0's general proper coherent GAGA needs complex analytic spaces with
  nilpotents, coherent analytification and its derived exchange maps.
* S9's moment–Morse and cellular comparisons need the flag
  and word analytifications, equivariant bundles and compatible cellular maps;
  S9.8's associated-line adapter needs their tensor-compatible analytification.
-/

namespace TauCetiRoadmap.SchubertGeometry

end TauCetiRoadmap.SchubertGeometry

import Mathlib

/-!
# Schubert geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, each with `sorry`. None of the following
headlines is statable at the pins this folder's manifest fixes, so nothing is stated:
* S1's relative parabolic representability and Schubert/incidence comparison
  need relative parabolic and flag schemes with
  their determinantal Schubert subschemes; the native Grassmannian is a module carrier.
* S2/S5's all-word image and derived pushforward theorems need Bott–Samelson
  schemes, their multiplication maps and their associated invertible sheaves.
* S3's geometric Demazure and Weyl character theorems need those flag line bundles
  and their section representations; the Demazure operators themselves are the
  `RootPairing.demazureOperator` of `TauCeti/LinearAlgebra/RootSystem/Weyl/Demazure/`,
  a directory the Tau Ceti revision this folder's manifest pins does not have.
* S4's operator-stability and generation theorems (S4.2, S4.3) are statable on the
  Lakshmibai–Seshadri encodings `TauCeti.LSPath`, their realized paths
  `TauCeti.LSPath.toPLPath` and Littelmann's operators `TauCeti.PLPath.lower` and
  `TauCeti.PLPath.raise`; its character identity (S4.4) on those encodings,
  `TauCeti.weylDenominator` and `RootPairing.dotAlternatization`; its component and
  tensor theorems need in addition the crystal structure on `TauCeti.LSPath` that S4.1
  and S4.3 construct from operator stability. These carriers live in
  `TauCeti/RepresentationTheory/LSPath/`, `TauCeti/RepresentationTheory/Crystal/` and
  `TauCeti/LinearAlgebra/RootSystem/Weyl/Denominator/Integral.lean`, none of which the
  Tau Ceti revision this folder's manifest pins has.
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

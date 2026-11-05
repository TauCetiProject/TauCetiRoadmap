module

import Mathlib

/-!
# Automorphy lifting beyond the Taylor–Wiles method: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs. None of them is statable at the pins,
so the file declares nothing. Each headline theorem and the carrier it lacks:

* The corrected local-ring comparison (README §1.3; CG18 Lemma 8.2) lacks the framed local
  Galois deformation rings with fixed determinant, their Fontaine–Laffaille, unipotent and
  character-polynomial quotients, and completed tensor products of complete local rings.
* The numerical coincidence (README §1.6; CG18 Proposition 8.5) lacks the global deformation
  rings of type `S_Q`, the adjoint Selmer groups with local conditions and the big-image
  condition on finite subgroups of `GL_n` over a finite field.
* The rank-one identification of the universal unramified deformation ring with the group
  algebra of the `p`-part of the class group (README §1.8) lacks deformation rings of a
  Galois character.
* The rank-two Taylor–Wiles level comparison (README §3.5; CG18 Lemma 9.6) lacks the cohomology
  of arithmetic quotients of `Res_{F/ℚ} PGL_2` with Iwahori-character coefficients, their
  Hecke correspondences and degeneracy maps.
* The `GL_n` distinct-root comparison (README §3.6) and its `PGL_n` descent under the
  principal-series block hypothesis at every successive base level (README §3.7) lack the
  arithmetic towers, their smooth localized cohomology modules and derived continuous
  invariants of hyperspecial and parahoric subgroups.
* The two patched complexes with their maximal-depth top modules (README §§4.1–5.1) lack the
  localized Betti complexes of arithmetic quotients as perfect complexes over the group rings
  of the Taylor–Wiles covers, and the deformation-ring actions on their cohomology.
* Near faithfulness of the lowest-degree cohomology dual over the minimal deformation ring
  (README §5.4; CG18 Theorem 9.19) and minimal `R = T` with freeness (README §5.5) lack the
  minimal global deformation ring, the simultaneous Hecke image algebra and the cohomology of
  the arithmetic quotient on which both act.
* Cuspidal recognition of the degree-`q_0` eigenclasses (README §5.6) lacks cuspidal
  automorphic representations of `GL_n` over a number field and the cohomology of the locally
  symmetric space.
* The support-to-eigenclass deduction (README §5.8) and its specializations to imaginary
  quadratic fields (README §5.9) and totally real fields (README §5.10) lack the same
  deformation, cohomology and automorphic carriers.

No simple definition on native carriers supplies any of these: an arbitrary complex, a bare
numerical identity or an unspecified automorphy predicate would not be an acceptance test for
these results.
-/

namespace TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles

end TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles

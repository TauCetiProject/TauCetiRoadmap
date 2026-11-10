module

public import Mathlib

/-!
# Spin geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. At the pins it states none.

The algebraic results of Layers 1 and 2 are theorems of the pinned Tau Ceti and are
cited in the README's supplier contracts instead of being stated here: the normalized
scalar trace of a Clifford algebra with its regular-trace formula, cyclicity and
negative-metric positivity and faithfulness; Morita evaluation of an arbitrary module
over an algebra acting as a full endomorphism algebra; and the normalized complex
volume element with its square, its anticommutation with vectors and the complementary
chirality eigenspaces of every module.

The geometric headlines are not statable at the pins with a few simple definitions:
* Smooth Clifford-module and spinor-bundle comparison needs the smooth algebra-bundle
  action and associated spinor-bundle carriers of G3/G5.
* Spin obstruction/classification and skeletal-frame comparison need the principal
  Spin lift, its equivalences and the frame-section homotopy quotient of G4.
* Plane-bundle square roots need the root-isomorphism and principal-lift comparison.
* Intrinsic Dirac frame/symbol comparison, untwisted and twisted Lichnerowicz formulas,
  and curvature vanishing need smooth Clifford modules with compatible connections
  and their induced differential operator. A pointwise contraction is not that operator.
* The closed-domain and chiral-adjoint theorems need that operator's bundle Sobolev
  domains and its distributional realization.
* The de Rham/signature realization needs the smooth exterior Clifford-module and
  Hodge operator comparison; its symbol class needs the compact-support bundle triple.
* The real KO analytic index and its products need the real regular spinor bundle,
  closed Clifford-linear operator and negative-Clifford family-index comparison.
* The four-dimensional quaternionic kernel/index theorem needs the actual half-spin
  bundles, their Sobolev kernel/cokernel restrictions and KO comparison; abstract
  vector-space parity does not state this geometric result.

The comparisons that Layers 1 and 2 retain (the exterior Gram metric of the Fock
module, the two-factor odd evaluation, the forms-to-endomorphisms module equivalence
and the laws of the graded product) are stated on the exterior Gram metric, pointwise
Hodge star and graded tensor carriers of the roadmaps named in the README; those
carriers are not supplied here by ad hoc encodings.
-/

namespace TauCetiRoadmap.SpinGeometry

end TauCetiRoadmap.SpinGeometry

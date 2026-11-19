import Mathlib

/-!
# Complex manifolds — transport, quotients, bundles, and gluing: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not already prove.

Every headline theorem of the roadmap that is statable at the pins is proved there, and the README
cites each by name instead of restating it here, so this file states no theorem:

* realification (Layer 1): a complex manifold is a real manifold on the same charts,
  `IsManifold.restrictScalars`, and holomorphic maps and biholomorphisms are smooth maps and
  diffeomorphisms of it, `ContMDiff.restrictScalars` and `Diffeomorph.restrictScalars`, with
  `modelWithCornersSelf_restrictScalars` identifying the realification of `𝓘(ℂ, E)` with `𝓘(ℝ, E)`;
  atlas transport along homeomorphisms, `Homeomorph.pullback_isManifold`;
* the canonical orientation (Layer 2): `TauCeti.complexManifoldOrientation`, in the shared carrier
  `TauCeti.Manifold.Orientation` of the DifferentialGeometry roadmap, preserved by every
  biholomorphism, `Diffeomorph.isOrientationPreservingAt_complexManifoldOrientation`; the canonical
  orientation of a complex vector space is `TauCeti.complexOrientation`;
* the Riemann sphere (Layer 3): `OnePoint.instIsManifold` on Mathlib's `OnePoint ℂ`, with every
  Möbius transformation holomorphic, `OnePoint.instContMDiffConstSMul`;
* quotients (Layer 4): `TauCeti.instIsManifoldQuotient`, the orbit projection as a local
  diffeomorphism `TauCeti.isLocalDiffeomorph_quotientMk` (over `𝓘(ℂ, E)` at `∞`, for an action
  every element of which is holomorphic, a local biholomorphism), and holomorphic descent
  `TauCeti.contMDiff_orbitRelQuotientLift_iff`;
* compatible open gluing (Layer 5): `TopCat.GlueData.IsCompatible.isManifold`, unique by
  `TopCat.GlueData.IsCompatible.maximalAtlas_chartedSpace_eq`;
* glued-space topology and proper maps (Layer 6): the Hausdorff criterion per pair of pieces,
  `TopCat.GlueData.t2Space_iff_isClosed_chartRel`, and for the whole gluing relation on the
  disjoint union, Mathlib's `t2Space_iff_of_isOpenQuotientMap` applied to the open quotient map
  `TopCat.GlueData.isOpenQuotientMap_sigma_ι`; `TopCat.GlueData.secondCountableTopology`,
  `TopCat.GlueData.connectedSpace_iff_reflTransGen`, `TauCeti.t2Space_doubleGlueData_iff` and
  `TopologicalSpace.IsOpenCover.isProperMap_iff_restrictPreimage`;
* holomorphic bundles (Layer 7): the trivial-line criterion
  `ContMDiffVectorBundle.exists_trivialization_baseSet_eq_univ_iff_exists_ne_zero`, cocycle
  isomorphisms `VectorBundleCore.CoordinateHom.exists_diffeomorph_iff`, and the holomorphic normal
  bundle of an embedding `TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle`.

Three headline theorems of Layer 7 are not statable at the pins:

* the holomorphic structure of tensor, tensor-power, exterior-power and determinant bundles and of
  the canonical line bundle as the determinant of the cotangent bundle (§§7.2 and 7.5): their
  smooth carriers are targets of the SmoothBundlesConnections roadmap (§B2.1) and are not at the
  pins;
* the isomorphism between the normal bundle of a complex hypersurface and the line bundle glued
  from transverse coordinates (§7.4): that transition-cocycle model is a construction of §7.4,
  with no carrier at the pins;
* the theorem that on a compact connected Hausdorff complex manifold with a free action of a finite
  group by biholomorphisms the line bundle associated to a nontrivial character is nontrivial
  (§7.6): the associated line bundle of a character is not a carrier at the pins.
-/

namespace TauCetiRoadmap.ComplexManifolds

end TauCetiRoadmap.ComplexManifolds

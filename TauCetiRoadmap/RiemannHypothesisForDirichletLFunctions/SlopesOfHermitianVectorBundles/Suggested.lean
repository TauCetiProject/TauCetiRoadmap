import Mathlib

/-!
# Slopes of Hermitian vector bundles: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about Hermitian vector bundles over the ring of integers `O_K` of a
number field `K`: finitely generated projective `O_K`-modules with a Hermitian inner product at
every complex embedding of `K`, compatible with complex conjugation, together with their Arakelov
degree and the degrees of their sub-bundles (ArakelovGeometryAndAbelianHeights §§1.1–1.3). Neither
Mathlib nor Tau Ceti has these carriers at the pins. Tau Ceti has the height
`Submodule.subspaceHeight` of a subspace of `K^n` for the standard metrics, which gives the degrees
of the sub-bundles of the trivial bundle `Ō_K^n` only (1.1), and no height of a subspace for an
adelic presentation of a general Hermitian vector bundle.

* The Harder–Narasimhan filtration (3.2, 3.3, 3.5): every nonzero bundle has a unique filtration by
  saturated submodules with semistable subquotients of strictly decreasing slopes, its polygon is
  the least concave function above the points `(rk F, deĝ_n F̄)` of all sub-bundles, and it commutes
  with finite extension of `K`. It lacks the Hermitian vector bundle, its sub-bundles and quotients
  with their metrics, the normalised degree and the slope, and base change along `O_K → O_L`.
* Bost's slope inequality and its filtered form (2.4, 2.5): it lacks, besides these, the maximal
  and minimal slopes and the height `h(φ)` of a `K`-linear map between generic fibres, the
  normalised sum over all places of the logarithms of its operator norms for the lattice norms and
  the Hermitian norms.
* The comparison of the Harder–Narasimhan slopes with the successive minima over `K` and with the
  absolute minima over `ℚ̄` (4.2, 4.3), and the bounds for the maximal slopes of tensor and
  symmetric powers (4.4, 4.5): it lacks, besides these, the successive minima of a Hermitian vector
  bundle for its body in `(mixedSpace K)^n`, its absolute minima, and the tensor and symmetric
  powers of Hermitian vector bundles with their metrics.
* The slope inequality for a nearly tight frame (5.5): it lacks the Harder–Narasimhan steps, the
  slopes and the heights of maps above.

Over `ℚ` a Hermitian vector bundle is a Euclidean lattice (1.8), for which Mathlib has `ZLattice`
and `ZLattice.covolume`; the headlines are stated over every number field, and their case `K = ℚ`
is a weaker statement, so it is not stated either. The frame lemma 5.3 is a statement about
finite-dimensional inner-product spaces, statable in Mathlib; it is a step of the route to the
slope inequality for a nearly tight frame, not a headline, and it is not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SlopesOfHermitianVectorBundles

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SlopesOfHermitianVectorBundles

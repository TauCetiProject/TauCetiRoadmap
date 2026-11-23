import Mathlib

/-!
# Chow forms and heights of subvarieties: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline compares the height of a projective cycle over a number field `K`, an arithmetic
intersection number of the metrised line bundle `Ō(1)` on the closure of the cycle over `O_K`
(HeightsRationalPointsAndObstructions §§5.9b, 5.17a), with the spherical height of its Chow form
(AlgebraicModuliForArithmeticGeometry §1.6; SlopesOfHermitianVectorBundles §§6.6, 6.7a). Neither
Mathlib nor Tau Ceti has these carriers at the pins. Mathlib has the algebraic cycles of a scheme
(`AlgebraicGeometry.AlgebraicCycle`) and Tau Ceti their Chow groups
(`TauCeti.AlgebraicGeometry.Chow.ChowGroup`), but neither has the Chow form of a cycle in
projective space, the arithmetic intersection numbers of Hermitian line bundles on a projective
model over `O_K`, or the height of a projective cycle. The spherical height of a multihomogeneous
polynomial is a definition of SlopesOfHermitianVectorBundles §6.6, not of this roadmap.

* The comparison of the Fubini–Study height with the spherical height of the Chow form (6.1): for
  every effective `d`-cycle `Z` in `ℙ^n_K`, the Fubini–Study height of `Z` is
  `ht(F_Z) + ((d + 1)/2)·H_n·deg Z`, with `H_n = Σ_{k=1}^{n} 1/k`. It lacks the height of a
  projective cycle, the Chow form of a cycle over `K`, and the spherical height of a multiform.
* Its form over a Hermitian vector bundle (6.2 (b)): for a Hermitian vector bundle `J̄` of rank
  `N ≥ 1` over `O_K` and an effective `d`-cycle `Z` in the projective space `ℙ(J^∨)`, the height of
  `Z` for the Fubini–Study metrics of `J̄` is `ht_J̄(F_Z) + ((d + 1)/2)·H_{N−1}·deg Z`. It lacks,
  besides these, the Hermitian vector bundle over `O_K`, the model `ℙ(M_J^∨)` with its metrised
  `𝒪(1)`, and the spherical height relative to `J̄`.
* The height of the whole space (6.2 (a7)): `ℙ(J^∨)` has height `deĝ_n(J̄)` plus the height of
  `ℙ^{N−1}`, which is at most `(N/2)·log N`; the exact value `½·Σ_{m=1}^{N−1} Σ_{k=1}^{m} 1/k` of
  the height of `ℙ^{N−1}` is the published value of Bost, Gillet and Soulé. It lacks the Hermitian
  vector bundle, its normalised Arakelov degree, and the height of a cycle in `ℙ(J^∨)`.

At a `K`-rational point (`d = 0`) the left side of 6.1 is the logarithm of the Euclidean height of
a coordinate vector, which Tau Ceti has as `TauCeti.height2`, and the right side is built from
Gauss norms and from integrals over the unit sphere of `ℂ^{n+1}` for the measure that Mathlib's
`MeasureTheory.Measure.toSphere` induces; that case is a weaker statement than the headline, so it
is not stated either. Mathlib's `Polynomial.mahlerMeasure` is the Mahler measure on the unit
circle, not on spheres, and the first Check of 6.1 shows that it gives a different constant.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ChowFormsAndHeightsOfSubvarieties

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ChowFormsAndHeightsOfSubvarieties

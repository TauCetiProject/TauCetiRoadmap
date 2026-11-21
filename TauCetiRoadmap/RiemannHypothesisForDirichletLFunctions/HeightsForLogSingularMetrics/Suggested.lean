import Mathlib

/-!
# Heights for log-singular metrics: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement of Arakelov geometry over number fields. The first three are about
hermitian line bundles on projective arithmetic varieties (integral schemes, projective and flat
over `Spec ℤ`, with metrics on the line bundles over their complex points that are invariant under
complex conjugation) and their arithmetic intersection numbers (ArakelovGeometryAndAbelianHeightsPartII
§0.1, HeightsRationalPointsAndObstructions §5.17a), or about Hermitian vector bundles over a ring of
integers and their degrees and slopes (ArakelovGeometryAndAbelianHeights §§1.1–1.3). Neither
Mathlib nor Tau Ceti has these carriers at the pins. Mathlib has schemes, projective spectra and
flat and proper morphisms, but no complex points of a scheme over `ℤ` as a complex analytic space,
no metrics on line bundles over them, no Chern forms or currents, and no arithmetic intersection
numbers. Tau Ceti has line bundles on schemes with their degrees on proper curves over a field,
Grassmannians, abelian varieties over a field with their tangent spaces
(`TauCeti.AlgebraicGeometry.AbelianVariety`), and the height `Submodule.subspaceHeight` of a subspace
of `K^n` for the standard metrics; none of these carries a metric at the archimedean places of an
integral model.

* The limit intersection numbers of log-log singular metrics (0.4 (b)–(c)): for log-log singular
  semipositive hermitian line bundles `L̄₁, …, L̄_d` on a projective arithmetic variety of absolute
  dimension `d`, with regularisations on a common log-smooth model, the arithmetic intersection
  numbers of the regularisations converge to a number independent of the regularisations and of the
  model, symmetric, multilinear and with the projection formula, at the rate
  `(log log(1/t))³/log(1/t)` when the boundary rates are `O(log log(1/t)/log(1/t))`. It lacks
  projective arithmetic varieties with their complex points, log-smooth models and simple normal
  crossings boundaries, hermitian metrics and their weights and curvature forms, regularisations,
  and arithmetic intersection numbers of hermitian line bundles.
* The height of a projective bundle and the absolute Siegel lemma (4.3b (a)–(b)): for a Hermitian
  vector bundle `Ē` of rank `n` over `O_K`, `Ō(1)^n = [K:ℚ]·n·(−μ̂(Ē) + ½(H_n − 1))` on the scheme of
  lines in `E`, and for every `η > 0` some nonzero `x ∈ E ⊗ O_L` over a finite extension `L/K` has
  `mean_σ log‖x‖_σ ≤ −μ̂(Ē) + ½(H_n − 1) + η`. It lacks the Hermitian vector bundle over `O_K` with
  its Arakelov degree and slope, the projective bundle over `Spec O_K` with the induced metric on
  `O(1)`, and arithmetic intersection numbers.
* The reflection formula (14.1 (a), (c)): for a Hermitian vector bundle `V̄` of rank two on a
  projective arithmetic variety `Z`, `π : ℙ(V) → Z` with relative tangent bundle `Ξ̄` and a
  hermitian `ℚ`-line bundle `M̄` on `Z`, `(Ξ̄^{2k}·π^*M̄^{D+1−2k}) = 2κ(k)·deg(Ξ^{2k−1}·π^*M^{D+1−2k})`,
  also for the limit numbers of log-log integrable metrics that are round on almost every fibre. It
  lacks, besides the carriers of the first two bullets, Hermitian vector bundles on arithmetic
  varieties, the projective bundle `ℙ(V)` with its tautological and relative tangent bundles and
  their induced metrics, and geometric intersection numbers on the generic fibre.
* The logarithmic bound for the maximal slope of the Lie algebra (16.1): for every semi-abelian
  scheme `G` over `O_L` whose generic fibre `A` is a principally polarised abelian variety of
  dimension `g`, `μ̂_max(Lie Ḡ) ≤ C·log(2 + g + max(h(A), 0))` with an absolute constant `C`. It
  lacks semi-abelian schemes over rings of integers and their Lie algebras as `O_L`-lattices,
  principal polarisations with their Riemann forms at the complex embeddings, the Hodge inner
  product, the Hermitian vector bundle structure, the maximal slope, and the Faltings height in
  Deligne's normalisation.

Over `ℚ` a Hermitian vector bundle is a Euclidean lattice, for which Mathlib has `ZLattice` and
`ZLattice.covolume`; the projective-bundle height and the absolute Siegel lemma for `K = ℚ` still
need the arithmetic intersection number on `ℙ^{n−1}_ℤ` and vectors over every finite extension of
`ℚ`, and they are a weaker case of the headline, so they are not stated either.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HeightsForLogSingularMetrics

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HeightsForLogSingularMetrics

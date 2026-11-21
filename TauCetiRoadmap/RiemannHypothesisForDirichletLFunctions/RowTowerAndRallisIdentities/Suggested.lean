import Mathlib

/-!
# The row tower and Rallis identities: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about automorphic forms on unitary groups of a CM field `E`: cusp
forms on the indefinite unitary groups `U(Y_j)` of Hermitian spaces over `E`, with a prescribed
discrete series at every real place and prescribed levels at the finite places, algebraic forms on
definite unitary groups, and the theta lifts between them given by the Weil representation of a
unitary dual pair (MetaplecticAutomorphicForms and ThetaKernelsForUnitaryDualPairs), with the
partial `L`-functions of their Hecke eigensystems twisted by Hecke characters of `E`. Mathlib has
number fields and CM fields (`NumberField.IsCMField`), the adele ring `NumberField.AdeleRing`,
unitary matrices (`Matrix.unitaryGroup`), Haar measure (`MeasureTheory.Measure.haar`), abstract
Hecke rings (`HeckeRing`) and the `L`-functions of Dirichlet characters
(`DirichletCharacter.LFunction`). Neither Mathlib nor Tau Ceti has the unitary group of a Hermitian
space over a CM field as a group over the adeles of its totally real subfield, automorphic or cusp
forms on it with their Petersson product and Hecke operators, the discrete series of `U(p, q)`, the
Weil representation and the theta kernel of a unitary dual pair, Hecke characters of a number field
with their partial `L`-functions, or the Satake parameters of a Hecke eigensystem and their base
change.

* The Rallis identities of the descent (5.5, 5.6, 5.10): for a twisting tuple `ξ` and a Hecke
  eigensystem `𝔥` away from `S(ξ)`, under Weil's condition, the ramification conditions and the gap
  conditions of 5.5, the good descent `ι_ξ` (the composite of the theta descents of the row steps
  followed by the good idempotent) satisfies
  `ι_ξ ι_ξ^* = 𝔫₀ · ∏_j L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` on the `𝔥`-part of the good rows, with
  positive absolutely convergent Euler products and `𝔫₀` independent of `𝔥` and `ξ`, and this scalar
  is `𝔫 · ∏_j λ_j(ξ, 𝔥)` with the eigenvalues `λ_j` of the model lifts. It lacks the
  carriers above, and the formal degrees of discrete series of real unitary groups.
* The rational structure of the row space (5.8): for the grid of the chain under the conditions of
  5.8b and the size predicate of 5.8e, and a number field `𝕃` containing the numbers (L1)–(L7) that
  5.8 names, the Bessel periods of 5.8e
  define an `𝕃`-structure of the good rows containing the descent of every rational form for every
  tuple, stable under `G₀` and the Hecke operators, and the constants of the squares of the grid
  are `𝕃`-rational up to their value at the base tuple. It lacks, besides these, Bessel periods of
  automorphic forms on unitary groups, theta functions of definite Hermitian lattices with harmonic
  coefficients, and the complementary-space constants of ThetaLiftsForDefiniteUnitaryGroups.
* The descent on rational coordinates (5.12): under the hypotheses of 5.6, 5.8 and 5.9, if `𝕃`
  contains the eigenvalues of finitely many Hecke operators that separate the eigensystems of the
  good rows, then for every level `(H, χ_H)` at the type primes whose character has values in `𝕃`
  the descent `ι_ξ` maps the rational points of `ι_ξ^*(𝔼_{(H,χ_H)})` injectively onto the rational
  points of the level-`(H, χ_H)` good rows, with Gram matrix `|H| · 𝔫 · ∏_j λ_j(ξ, 𝔥) · X_ξ` on each
  eigensystem. It lacks, besides these, canonical models of automorphic vector bundles on unitary
  Shimura varieties, which give the rational structure of the model forms (5.10a).

The projector lemma 5.2a, a statement about unitary representations of a unimodular locally compact
group with an integrable square-integrable matrix coefficient, could be written with Mathlib's Haar
measure and Bochner integral on continuous unitary representations encoded by hand; it is a step of
the route (Godement's theorem), not a headline, and it is not stated here. The finite-group
statements inside 5.3 (labels of tuples of polynomials over `𝔽_q`, goodness and joint cuspidality)
are steps of the route as well.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RowTowerAndRallisIdentities

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RowTowerAndRallisIdentities

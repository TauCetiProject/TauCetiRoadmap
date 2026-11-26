import Mathlib
import TauCeti.Geometry.Toric.Analytic.Fan.Orbit.Basic

/-!
# Analytic toric geometry, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records which of the
roadmap's headline theorems can be stated against the pinned APIs.

None of the following headline theorems is statable at the pins without building
one of the substantial constructions specified in the roadmap:

* Integral monomial sections and tensor base change, invariant representatives,
  and the field-independent divisor-class presentation (Layer 0) need the
  arbitrary-coefficient finite-fan scheme, its ray divisors and Cartier modules.
  The native complex fan scheme and generic scheme Weil divisors do not supply
  these constructions.
* The unit-model analytification comparison (Layer 1) needs the toric formal
  completion, its generic fibre and the comparison map. The native category of
  adic spaces alone does not define them.
* Perfectoid toric charts and the graded divisor algebra (Layer 2) need completed
  perfected monoid algebras with their plus rings, perfectoidness and tilts.
* The five toric comparisons of Scholze Theorem 8.5, including the sharp
  projection, and the full affine-line comparison of Theorem 1.5 (Layer 3) need
  those toric spaces, their power tower, tilting, the adic small etale sites and
  the geometric morphisms of topoi. An arbitrary homeomorphism or inverse system
  does not state these results.
* The power-pullback automorphism and projection isomorphism on prime-to-p
  torsion cohomology, Scholze Proposition 8.6 (Layer 4), need the cohomology of
  those actual adic etale sites and the constructed pullback maps.
* Cofinal section tubes, homogeneous approximation with nonzero dense-field
  denominator clearing, and hypersurface approximation, Scholze Proposition 8.7
  (Layer 5), need the integral toric line bundles, their section domains, the
  homogeneous perfectoid algebra and its sharp map.
* The operational Chow / Minkowski-weight identification and fan displacement
  product (Layer 6) need the toric scheme, operational Chow groups and evaluation
  on orbit closures. A kernel of an arbitrary integer matrix states neither.
* Field-independent positive refined degree and dense-field complete-intersection
  approximation with a closed model of the specified dimension, Scholze
  Corollary 8.8 (Layer 6), need the preceding intersection theory, algebraic zero
  loci, analytification and the toric projection.

* The orbit–cone correspondence as an order isomorphism from the cones of a
  regular fan onto the order dual of the torus orbits of its complex analytic
  realization, ordered by `O ≤ O'` when `O ⊆ closure O'` (§0.7), is data and
  needs that partial order on `MulAction.orbitRel.Quotient`, which the pins lack.
  Its one missing order axiom, antisymmetry, is stated below.

All remain headline targets in README.md. There are no weakened substitute
statements, data axioms or API and boundary-case declarations here.
-/

namespace TauCetiRoadmap.AnalyticToricGeometryPartII

universe u

open Set

/-! ## Layer 0: §0.7 The orbit–cone correspondence as an order isomorphism -/

/-- **The closure order on torus orbits is antisymmetric.** For a regular fan, two torus orbits
of the analytic realization each contained in the closure of the other are equal. With
reflexivity and transitivity of `O ⊆ closure O'` this makes the closure relation a partial order
on the orbits, the order of §0.7. -/
theorem orbit_eq_of_subset_closure_of_subset_closure {N V : Type u} [AddCommGroup N]
    [AddCommGroup V] [Module ℝ V] {i : N →+ V} (Φ : TauCeti.Toric.Fan i) (hΦ : Φ.IsRegular)
    (q q' : MulAction.orbitRel.Quotient (TauCeti.Toric.ComplexTorus N)
      (Φ.analyticRealization hΦ))
    (h : q.orbit ⊆ closure q'.orbit) (h' : q'.orbit ⊆ closure q.orbit) : q = q' := by
  sorry

end TauCetiRoadmap.AnalyticToricGeometryPartII

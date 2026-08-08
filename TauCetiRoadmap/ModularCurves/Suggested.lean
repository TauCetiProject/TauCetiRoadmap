import Mathlib

/-!
# Modular curves, following Katz–Mazur: representative signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. What
is recorded here are declarations which can already be stated using Mathlib's present
algebraic-geometry and Weierstrass APIs, so that contributors and reviewers converge on names and
signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is expected in
this file — these are goals, not results — and nothing here is a `Prop`-typed placeholder standing
in for an object that does not exist yet.

The seven declarations below are unchanged from the current pull-request branch. They provide a
first check on the proposed projective Weierstrass model and its field-valued points. Further
signatures should be added as soon as the corresponding ambient types exist; the final section lists
the interfaces for which a type error or a missing hypothesis would be especially costly.
-/

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory
open scoped Classical

/-! ## The projective Weierstrass model

For `W : WeierstrassCurve R`, the projective model is the cubic

`Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³`

in `ℙ²_R`. Ellipticity is needed for smoothness, not for the construction of the closed
subscheme or its properness.
-/

/-- The projective scheme associated to a Weierstrass curve. -/
noncomputable def projModel {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Scheme.{u} :=
  sorry

/-- The structure morphism of the projective Weierstrass model. -/
noncomputable def projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModel W ⟶ Spec (CommRingCat.of R) :=
  sorry

/-- The projective Weierstrass model is proper over its base. -/
theorem isProper_projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    IsProper (projModelOver W) :=
  sorry

/-- If the discriminant is a unit, the projective model is smooth of relative dimension one. -/
theorem smoothOfRelativeDimension_one_projModelOver {R : Type u} [CommRing R]
    (W : WeierstrassCurve R) [W.IsElliptic] :
    SmoothOfRelativeDimension 1 (projModelOver W) :=
  sorry

/-- The zero section `[0 : 1 : 0]`. -/
noncomputable def projModelZero {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Spec (CommRingCat.of R) ⟶ projModel W :=
  sorry

/-- The zero section is a section of the structure morphism. -/
theorem projModelZero_comp {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModelZero W ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of R)) :=
  sorry

/-- Over a field, sections of the projective model are the usual Weierstrass points. -/
noncomputable def projModelPointsEquiv {K : Type u} [Field K] (W : WeierstrassCurve K) :
    {g : Spec (CommRingCat.of K) ⟶ projModel W //
      g ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of K))} ≃ W.toAffine.Point :=
  sorry

/-!
## Interfaces to add as their ambient types become available

The following should be tested by actual Lean declarations before their implementations begin.

1. `EllipticCurveGeom S` with the pointed local-Weierstrass condition: every local chart must carry
   the distinguished section to `[0 : 1 : 0]`; `EllipticCurve S`, base change, and uniqueness of the
   compatible commutative group structure.
2. Relative effective Cartier divisors on curves, the finite-locally-free comparison, the divisor
   of a section, and finite sums of section divisors.
3. Constant and diagonalizable finite group schemes as separate constructions, Cartier duality,
   and quotients by finite locally free subgroup schemes.
4. `[N] : E ⟶ E`, `E[N]`, locally constant degree, and `IsogenyOfDegree n`.
5. For `φ : E ⟶ E'` of constant degree `n`, a dual `φ̂ : E' ⟶ E` with both composition
   identities, followed by the endomorphism trace formula.
6. The perfect pairing `ker φ × ker φ̂ ⟶ 𝔾_m`, the induced isomorphism
   `ker φ̂ ≅ (ker φ)ᴰ`, the self-duality of `E[N]`, the Weil pairing, and its change-of-level
   formula.
7. The sibling roadmap's `CoordinatePullback`/`MapsInfinity` comparison with scheme isogenies.
8. A full set of sections with the quantifier over every base change, the reduction to the single
   universal polynomial case (the argument proving KM 1.9.1 — KM 1.8.4 is the disjoint-union
   lemma), exact-order points, cyclic subgroups, and the four Drinfeld level structures, including
   the balanced structure and its determinant.
8N. The **naive** level structures over `ℤ[1/N]` — an isomorphism `(ℤ/N)²_S ≅ E[N]`, a section of
   exact order `N`, a cyclic subgroup of order `N` — with relative representability and étaleness.
   These are what Layers 4 and 5A–5B are stated in, and they are deliberately independent of the
   Drinfeld blocks and of the Cartier-divisor strand.
9. The ambient Hom-schemes and the closed loci representing full sets, exact order, and full level.
10. Relative representability, rigidity, KM regularity, and the implication in KM 4.7.0.
11. For `N ≥ 3`, `Y_full(N)`, the determinant map to `μ_N^prim`, the fixed-pairing fibre, and
    `Y(ρ)`. The hypotheses `N ≥ 3` should be visible in the signatures.
12. For `N ≥ 3` and over `ℤ[1/N]`, the Borel quotient description of `Y₀(N)`; otherwise the coarse
    construction through a finite étale **Galois** rigidifier with its Galois group.
13. The coarse universal property of `Spec ℤ[j]` and the four deformation functors used in KM
    5.1.1.

These signatures are intended to expose typing errors, action conventions, and missing base or
rank hypotheses while the roadmap is still cheap to change.
-/

end TauCetiRoadmap.ModularCurves

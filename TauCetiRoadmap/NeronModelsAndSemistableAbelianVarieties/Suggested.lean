import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel

/-!
# Néron models and semistable abelian varieties: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements suggest Lean forms for headline results; discharging them finishes neither a
layer nor the roadmap.

`LocalExistence` (README §1.7) and `DedekindExistence` (README §1.9) state finite-type
Néron-model existence for abelian varieties over the fraction field of any DVR and over the
function field of any connected Dedekind scheme. The generic marking and the mapping property
for every smooth test scheme are expressed directly in Mathlib's `Over` category. For the
global statement, the base is integral and Noetherian of dimension one, with integrally closed
stalks; its function field and generic inclusion are Mathlib's own constructions.
`EquationGoodComparison` (README §6.5) identifies good reduction of a minimal Weierstrass
equation with smoothness of its projective integral model and with the existence of a smooth
proper geometrically connected group-scheme model of its generic fibre. These statements use
the pinned scheme and abelian-variety carriers without auxiliary definitions.

The other geometric headlines require carriers absent from the pins. The special-fibre
classification (Layer 2), semistable reduction and Grothendieck's monodromy criterion
(Layer 3), and the graph, Picard–Néron and component-cokernel comparisons (Layer 4) require
identity components of non-affine smooth groups, semi-abelian varieties, relative Picard
schemes and their geometric monodromy maps. The affine component-group and numerical Picard
group suppliers do not supply these objects. The Raynaud extension and uniformisation also
require formal abelian schemes and rigid analytic quotients by period lattices.

Néron–Ogg–Shafarevich, potential good reduction, the Frobenius, conductor and Ogg–Saito
comparisons (Layer 5), and independence, closed-point specialization and strict compatibility
(Layer 6) require the general abelian Tate-system action, its specialization maps and the
cohomological and Weil–Deligne realizations. The elliptic Tate representation alone does not
supply these general carriers. The excellent-DVR hypothesis in the good-reduction isogeny
theorem also has no predicate at the pins; existence of a good model itself is expressible as
in `EquationGoodComparison`. The period comparisons require the shared crystalline and
semistable period functors and the filtered Raynaud realization. The connected-model Kummer,
localization, isogeny-defect and cotangent theorems of §§6.4a–6.4d require the relative open
identity models, component sheaves and invariant cotangent modules. The remaining elliptic
comparisons require the minimal regular model, its Kodaira configurations and its Néron
identity fibre; the ordinary-surface and full-level curve consequences require the general
Tate systems and the curve–Jacobian comparison. These results are specified in the README;
no substitute arithmetic statements are given here.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

open CategoryTheory AlgebraicGeometry

universe u

attribute [local instance] Over.cartesianMonoidalCategory

/-- Every abelian variety over the fraction field of any DVR has a marked smooth separated
finite-type model with unique extension from every smooth test scheme
(Bosch–Lütkebohmert–Raynaud, §1.3 Corollary 2, p. 17). -/
theorem LocalExistence (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    ∃ X : Over (Spec (.of R)),
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj X ≅
        A.toOver) ∧
      Smooth X.hom ∧ IsSeparated X.hom ∧ QuasiCompact X.hom ∧
      ∀ Y : Over (Spec (.of R)), Smooth Y.hom →
        Function.Bijective (fun f : Y ⟶ X =>
          (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).map f) := by
  sorry

/-- Every abelian variety over the function field of a connected Dedekind scheme has a marked
finite-type Néron model over that scheme (Bosch–Lütkebohmert–Raynaud, §1.4, Proposition 1
and Theorem 3, pp. 18–20). Normality is expressed by integrally closed stalks. -/
theorem DedekindExistence (S : Scheme.{u}) [IsIntegral S] [IsNoetherian S]
    (hNormal : ∀ s : S, IsIntegrallyClosed (S.presheaf.stalk s))
    (hDim : topologicalKrullDim S = 1)
    (A : TauCeti.AlgebraicGeometry.AbelianVariety S.functionField) :
    ∃ X : Over S,
      Nonempty ((Over.pullback (S.fromSpecStalk (genericPoint S))).obj X ≅ A.toOver) ∧
      Smooth X.hom ∧ IsSeparated X.hom ∧ QuasiCompact X.hom ∧
      ∀ Y : Over S, Smooth Y.hom →
        Function.Bijective (fun f : Y ⟶ X =>
          (Over.pullback (S.fromSpecStalk (genericPoint S))).map f) := by
  sorry

/-- A minimal elliptic equation has good reduction exactly when its projective integral model
is smooth, and exactly when its generic fibre admits an abelian-scheme model over the DVR
(Bosch–Lütkebohmert–Raynaud, §1.5, pp. 20–23). -/
theorem EquationGoodComparison (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (W : WeierstrassCurve K) [W.IsElliptic] [WeierstrassCurve.IsMinimal R W] :
    (W.HasGoodReduction R ↔ Smooth (W.integralModel R).projModelOver) ∧
    (W.HasGoodReduction R ↔ ∃ X : Over (Spec (.of R)),
      Smooth X.hom ∧ IsProper X.hom ∧ GeometricallyConnected X.hom ∧
      Nonempty (GrpObj X) ∧
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj X ≅
        Over.mk W.projModelOver)) := by
  sorry

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

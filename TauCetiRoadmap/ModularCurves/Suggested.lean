import Mathlib
import TauCetiRoadmap.EllipticCurves.Suggested

/-!
# Modular curves, following Katz–Mazur: representative signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. What
is recorded here are declarations which can already be stated using Mathlib's present
algebraic-geometry and Weierstrass APIs, so that contributors and reviewers converge on names and
signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is expected in
this file — these are goals, not results — and nothing here is a `Prop`-typed placeholder standing
in for an object that does not exist yet.

The declarations seed the carrier and variance boundaries which control the proof: finite flat
group schemes, elliptic curves with group-scheme homomorphisms, the two dual-isogeny constructions,
the category `Ell/R` with its cartesian arrows, relative representability, Katz–Mazur quotient data
with the exact conditions Q1 and Q2, the regularity axioms Reg. 1–Reg. 4 with a stated universal
formal deformation, coarse-moduli data, and the Chapter 6 cyclicity space. Relative effective
Cartier divisors use the single carrier supplied by the Jacobian Challenge; this file deliberately
does not introduce a second one. The equation-level inputs of Layers 2A and 2E are taken from
`TauCetiRoadmap.EllipticCurves.Suggested`, and the two declarations that roadmap does not yet
export are pinned in `EllipticCurvesInterface`.
-/

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory Limits MonoidalCategory CartesianMonoidalCategory MonObj
open scoped Classical

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory
  CategoryTheory.Over.braidedCategory

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

/-- Over a field, the projective model of an elliptic Weierstrass equation is integral. -/
instance isIntegral_projModel {K : Type u} [Field K] {W : WeierstrassCurve K} [W.IsElliptic] :
    IsIntegral (projModel W) :=
  sorry

/-- The scheme function field of the projective model is the equation-level function field of
`W`; the first statement of the narrow degree bridge of Layer 2A. The equation-level pullback by
`[N]` and its degree `N²` are the Elliptic Curves roadmap's, pinned in `EllipticCurvesInterface`
below, and the comparison square is `mulByFunctionFieldPullback_eq`. -/
noncomputable def projModelFunctionFieldEquiv {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] :
    (projModel W).functionField ≃+* W.toAffine.FunctionField :=
  sorry

/-! ## Contracts consumed from the Elliptic Curves roadmap

`TauCetiRoadmap.EllipticCurves.Suggested` exports the equation-level `Isogeny` carrier with its
`degree` and `fieldPullback`, and the equation-level `weilPairing`. Multiplication by `N` as an
isogeny and the theorem `deg [N] = N²` are milestones of that roadmap's Layer 1 which have no
declaration there yet. The declarations in this namespace state them in that roadmap's own
carriers, so that the degree bridge of Layer 2A and the Weil-pairing normalization of Layer 2E
type-check against the actual composition; they are owed by the Elliptic Curves roadmap and are to
be replaced by its declarations when those land. -/

namespace EllipticCurvesInterface

open TauCetiRoadmap.EllipticCurves

/-- Multiplication by `N` on an elliptic Weierstrass equation, as an isogeny of the Elliptic
Curves roadmap. -/
noncomputable def mulByIsogeny {K : Type u} [Field K] (W : WeierstrassCurve K) [W.IsElliptic]
    (N : ℕ) [NeZero N] : Isogeny W.toAffine W.toAffine :=
  sorry

/-- The isogeny acts on points as multiplication by `N`; the integral closedness hypothesis is
the Elliptic Curves roadmap's `isIntegrallyClosed_coordinateRing`. -/
theorem mulByIsogeny_toPointHom {K : Type u} [Field K] [DecidableEq K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] [IsIntegrallyClosed W.toAffine.CoordinateRing]
    (P : W.toAffine.Point) :
    (mulByIsogeny W N).toPointHom P = N • P :=
  sorry

/-- The equation-level degree theorem `deg [N] = N²`, including the division-polynomial and
inseparable cases. -/
theorem degree_mulByIsogeny {K : Type u} [Field K] (W : WeierstrassCurve K) [W.IsElliptic]
    (N : ℕ) [NeZero N] :
    (mulByIsogeny W N).degree = N ^ 2 :=
  sorry

end EllipticCurvesInterface

/-! ## Finite flat group schemes

The relative effective Cartier-divisor carrier and its pullback are supplied once by the Jacobian
Challenge. Modular Curves adds its incidence, equality, degree, subgroup, and full-set theorems in
the shared namespace once that carrier is imported.
-/

/-- Finite locally free commutative group schemes over `S`, expressed in Mathlib's group-object
vocabulary: finite, flat, and locally of finite presentation. -/
structure FiniteFlatCommGroupScheme (S : Scheme.{u}) where
  carrier : Scheme.{u}
  structureMap : carrier ⟶ S
  grp : GrpObj (Over.mk structureMap)
  comm : letI := grp; IsCommMonObj (Over.mk structureMap)
  finite : IsFinite structureMap
  flat : Flat structureMap
  /-- Finite locally free means finite, flat, and locally of finite presentation; over a
  non-noetherian base the last condition is not implied by the first two, and it is what makes
  `Scheme.Hom.finrank` locally constant. -/
  locallyOfFinitePresentation : LocallyOfFinitePresentation structureMap

attribute [instance] FiniteFlatCommGroupScheme.finite FiniteFlatCommGroupScheme.flat
  FiniteFlatCommGroupScheme.locallyOfFinitePresentation

namespace FiniteFlatCommGroupScheme

noncomputable abbrev toOver {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Over S :=
  Over.mk G.structureMap

noncomputable instance grpObj {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :
    GrpObj G.toOver :=
  G.grp

instance isCommMonObj {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :
    IsCommMonObj G.toOver :=
  G.comm

/-- Sections of the structure morphism of a finite flat group scheme. -/
def Section {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :=
  {s : S ⟶ G.carrier // s ≫ G.structureMap = 𝟙 S}

structure Hom {S : Scheme.{u}} (G H : FiniteFlatCommGroupScheme S) where
  hom : G.toOver ⟶ H.toOver
  map_group : IsMonHom hom

structure Iso {S : Scheme.{u}} (G H : FiniteFlatCommGroupScheme S) where
  hom : Hom G H
  inv : Hom H G
  hom_inv_id : hom.hom ≫ inv.hom = 𝟙 G.toOver
  inv_hom_id : inv.hom ≫ hom.hom = 𝟙 H.toOver

noncomputable def baseChange {S T : Scheme.{u}} (G : FiniteFlatCommGroupScheme S)
    (f : T ⟶ S) : FiniteFlatCommGroupScheme T :=
  sorry

/-- Cartier duality, as an object before its contravariant functoriality is installed. -/
noncomputable def cartierDual {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :
    FiniteFlatCommGroupScheme S :=
  sorry

noncomputable def mulBy {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) (n : ℕ) : Hom G G :=
  sorry

noncomputable def zero {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Hom G G :=
  sorry

/-- Cartier duality commutes with base change through a canonical isomorphism. -/
noncomputable def cartierDualBaseChangeIso {S T : Scheme.{u}}
    (G : FiniteFlatCommGroupScheme S) (f : T ⟶ S) :
    Iso (baseChange (cartierDual G) f) (cartierDual (baseChange G f)) :=
  sorry

/-- A finite locally free commutative group scheme of constant rank `n` is killed by `n`. -/
theorem mulBy_eq_zero_of_finrank {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) (n : ℕ)
    (hrank : G.structureMap.finrank = fun _ ↦ n) :
    mulBy G n = zero G :=
  sorry

end FiniteFlatCommGroupScheme

/-- Bilinear morphisms from two finite flat commutative group schemes to `𝔾_m`. -/
noncomputable def GroupSchemePairing {S : Scheme.{u}}
    (G H : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

/-! ## Elliptic curves, torsion, and dual isogenies -/

/-- One pointed Weierstrass chart in a relative curve. -/
structure PointedWeierstrassChart {S X : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X) where
  base : Scheme.{u}
  baseMap : base ⟶ S
  baseMap_open : IsOpenImmersion baseMap
  ring : CommRingCat.{u}
  baseIso : base ≅ Spec ring
  equation : WeierstrassCurve ring
  equation_elliptic : equation.IsElliptic
  pullbackCarrier : Scheme.{u}
  toTotal : pullbackCarrier ⟶ X
  toBase : pullbackCarrier ⟶ base
  isPullback : IsPullback toTotal toBase π baseMap
  modelIso : pullbackCarrier ≅ projModel equation
  modelIso_over : modelIso.hom ≫ projModelOver equation = toBase ≫ baseIso.hom
  pulledZero : base ⟶ pullbackCarrier
  pulledZero_toBase : pulledZero ≫ toBase = 𝟙 base
  pulledZero_toTotal : pulledZero ≫ toTotal = baseMap ≫ zero
  modelIso_zero : pulledZero ≫ modelIso.hom = baseIso.hom ≫ projModelZero equation

/-- A jointly surjective family of pointed Weierstrass charts. Equations are witnesses of local
existence, not selected fields of an elliptic curve. -/
structure PointedWeierstrassAtlas {S X : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X) where
  index : Type u
  chart : index → PointedWeierstrassChart π zero
  covers : ∀ s : S, ∃ i : index, ∃ x : (chart i).base, (chart i).baseMap.base x = s

/-- **The local-model condition in readable form.** Around every point of the base there is an
affine open `U`, an elliptic Weierstrass curve `W` over `Γ(S, U)`, and an isomorphism of the curve
restricted to `U` with the projective model of `W`, compatible with the projection and with the
zero section.

This is the shape the AINTLIB modular-curves development states the condition in
(`LocallyWeierstrass`; §Provenance), and it is the form to read when checking the definition
against KM 2.2.5–2.2.6 or Deligne–Rapoport II.1.1: the quantifiers are the ones the sources use,
with no pullback square or coefficient ring carried as data. `PointedWeierstrassAtlas` is the same
condition packaged as a covering family that later layers can name and refine — Layer 1C's
Weierstrass-presentation theorem produces one — and the two agree by
`nonempty_pointedWeierstrassAtlas_iff`. ⚠ Note the open-immersion hypothesis on a chart's
`baseMap`: it is what makes both forms *Zariski*-local. Without it the atlas would ask only for a
jointly surjective family and would state an a-priori weaker étale- or fpqc-local condition. -/
def IsLocallyWeierstrass {X S : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X)
    (hzero : zero ≫ π = 𝟙 S) : Prop :=
  ∀ s : S, ∃ (U : S.affineOpens) (_ : s ∈ U.1) (W : WeierstrassCurve Γ(S, U.1)),
    W.IsElliptic ∧
      ∃ e : pullback π U.1.ι ≅ projModel W,
        e.hom ≫ projModelOver W = pullback.snd π U.1.ι ≫ U.2.isoSpec.hom ∧
        (U.2.isoSpec.inv ≫ pullback.lift (U.1.ι ≫ zero) (𝟙 _)
            (by rw [Category.assoc, hzero, Category.comp_id, Category.id_comp])) ≫ e.hom =
          projModelZero W

/-- **The migration bridge.** An atlas of pointed Weierstrass charts gives the readable local-model
condition, so a development written against the AINTLIB form consumes this roadmap's definition
without restating it.

The content is bookkeeping in three steps, none of them deep but none automatic: the range of an
open immersion out of an affine scheme is an affine open of `S`, which supplies `U`; the chart's
coefficient `ring` is carried onto `Γ(S, U)` along `baseIso`, transporting `equation` and its
ellipticity along a ring isomorphism and commuting with `projModel`; and the chart's abstract
pullback square is compared with Mathlib's chosen `pullback` through `IsPullback.isoPullback`,
which is what turns `modelIso_over` and `modelIso_zero` into the two conjuncts above. -/
theorem PointedWeierstrassAtlas.isLocallyWeierstrass {X S : Scheme.{u}} {π : X ⟶ S}
    {zero : S ⟶ X} (hzero : zero ≫ π = 𝟙 S) (A : PointedWeierstrassAtlas π zero) :
    IsLocallyWeierstrass π zero hzero :=
  sorry

/-- The converse: choosing a chart at each point of the base assembles an atlas, so the two
formulations of the local-model condition agree. Choice is used, which is why the atlas appears
under `Nonempty` in `EllipticCurveGeom` — neither form selects an equation. -/
theorem nonempty_pointedWeierstrassAtlas_iff {X S : Scheme.{u}} {π : X ⟶ S} {zero : S ⟶ X}
    (hzero : zero ≫ π = 𝟙 S) :
    Nonempty (PointedWeierstrassAtlas π zero) ↔ IsLocallyWeierstrass π zero hzero :=
  sorry

/-- Smooth proper pointed genus-one curves with the pointed local-Weierstrass condition. -/
structure EllipticCurveGeom (S : Scheme.{u}) where
  carrier : Scheme.{u}
  structureMap : carrier ⟶ S
  zero : S ⟶ carrier
  zero_comp : zero ≫ structureMap = 𝟙 S
  smooth : SmoothOfRelativeDimension 1 structureMap
  proper : IsProper structureMap
  localModel : Nonempty (PointedWeierstrassAtlas structureMap zero)

attribute [instance] EllipticCurveGeom.smooth EllipticCurveGeom.proper

namespace EllipticCurveGeom

theorem zero_comp_structureMap {S : Scheme.{u}} (E : EllipticCurveGeom S) :
    E.zero ≫ E.structureMap = 𝟙 S :=
  E.zero_comp

/-- Every elliptic curve record satisfies the readable local-model condition. This is the
declaration a migrated proof should consume when it was written against the AINTLIB form. -/
theorem isLocallyWeierstrass {S : Scheme.{u}} (E : EllipticCurveGeom S) :
    IsLocallyWeierstrass E.structureMap E.zero E.zero_comp :=
  E.localModel.elim (PointedWeierstrassAtlas.isLocallyWeierstrass E.zero_comp)

noncomputable def baseChange {S T : Scheme.{u}} (E : EllipticCurveGeom S) (f : T ⟶ S) :
    EllipticCurveGeom T :=
  sorry

end EllipticCurveGeom

/-- An elliptic curve with its canonical commutative group structure. -/
structure EllipticCurve (S : Scheme.{u}) extends EllipticCurveGeom S where
  grp : GrpObj (Over.mk structureMap)
  comm : letI := grp; IsCommMonObj (Over.mk structureMap)
  one_eq_zero :
    letI := grp
    (η[Over.mk structureMap] : _ ⟶ Over.mk structureMap).left =
      (𝟙_ (Over S)).hom ≫ zero

namespace EllipticCurve

noncomputable abbrev toGeom {S : Scheme.{u}} (E : EllipticCurve S) : EllipticCurveGeom S :=
  E.toEllipticCurveGeom

/-- An elliptic curve as an object over its base. -/
noncomputable def toOver {S : Scheme.{u}} (E : EllipticCurve S) : Over S :=
  Over.mk E.structureMap

noncomputable instance grpObj {S : Scheme.{u}} (E : EllipticCurve S) : GrpObj E.toOver :=
  E.grp

instance isCommMonObj {S : Scheme.{u}} (E : EllipticCurve S) : IsCommMonObj E.toOver :=
  E.comm

noncomputable def baseChange {S T : Scheme.{u}} (E : EllipticCurve S) (f : T ⟶ S) :
    EllipticCurve T :=
  sorry

/-- The projective model of an elliptic Weierstrass equation, with the group law of Layer 1D. -/
noncomputable def ofWeierstrass {R : Type u} [CommRing R] (W : WeierstrassCurve R)
    [W.IsElliptic] : EllipticCurve (Spec (CommRingCat.of R)) :=
  sorry

/-- Homomorphisms of elliptic curves over a fixed base are homomorphisms of commutative group
schemes; a bare pointed scheme morphism is not coerced to this type. -/
structure Hom {S : Scheme.{u}} (E E' : EllipticCurve S) where
  hom : E.toOver ⟶ E'.toOver
  map_group : IsMonHom hom

namespace Hom

noncomputable def toSchemeHom {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Hom E E') :
    E.carrier ⟶ E'.carrier :=
  f.hom.left

/-- Pullback on `Pic⁰`, transported through elliptic autoduality. -/
noncomputable def picardDual {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Hom E E') :
    Hom E' E :=
  sorry

end Hom

/-- KM 2.5.1, proved only in Layer 2D from the relative Picard theory: a scheme morphism over `S`
carrying zero to zero is uniquely a homomorphism of group schemes. It converts into `Hom`; it is
not used to define `Hom` or the multiplication maps. -/
theorem isGroupHom_of_mapsZero {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : E.carrier ⟶ E'.carrier) (hf_over : f ≫ E'.structureMap = E.structureMap)
    (hf_zero : E.zero ≫ f = E'.zero) :
    ∃! F : Hom E E', F.toSchemeHom = f :=
  sorry

/-- Multiplication by a natural number as a group-scheme homomorphism. -/
noncomputable def mulBy {S : Scheme.{u}} (E : EllipticCurve S) (n : ℕ) : Hom E E :=
  sorry

/-- KM 2.3.1, finiteness: `[N]` is finite for `N ≠ 0`. -/
theorem isFinite_mulBy {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    IsFinite (E.mulBy N).toSchemeHom :=
  sorry

/-- KM 2.3.1, flatness: `[N]` is flat for `N ≠ 0`. -/
theorem flat_mulBy {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Flat (E.mulBy N).toSchemeHom :=
  sorry

/-- `[N]` is locally of finite presentation, because its source and target are locally of finite
presentation over `S`. Together with `isFinite_mulBy` and `flat_mulBy` this is what makes its
rank locally constant. -/
theorem locallyOfFinitePresentation_mulBy {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    LocallyOfFinitePresentation (E.mulBy N).toSchemeHom :=
  sorry

/-- KM 2.3.1, the rank: `[N]` has locally constant rank `N²`, proved through the narrow
function-field degree bridge of Layer 2A. -/
theorem finrank_mulBy {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (E.mulBy N).toSchemeHom.finrank = fun _ ↦ N ^ 2 :=
  sorry

/-- Pullback of rational functions along the scheme-theoretic `[N]` on the projective model of
`W`, a finite dominant morphism of integral schemes. -/
noncomputable def mulByFunctionFieldPullback {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] :
    (projModel W).functionField →+* (projModel W).functionField :=
  sorry

/-- The comparison square of Layer 2A: through `projModelFunctionFieldEquiv`, pullback along the
scheme-theoretic `[N]` is the equation-level pullback of the Elliptic Curves roadmap's
`mulByIsogeny`. -/
theorem mulByFunctionFieldPullback_eq {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (f : (projModel W).functionField) :
    projModelFunctionFieldEquiv W (mulByFunctionFieldPullback W N f) =
      (EllipticCurvesInterface.mulByIsogeny W N).fieldPullback
        (projModelFunctionFieldEquiv W f) :=
  sorry

/-- The rank of the scheme-theoretic `[N]` on the projective model is the equation-level degree
of `mulByIsogeny`: the fibre length of a finite flat morphism of smooth projective integral
curves is the degree of the induced function-field extension. With
`EllipticCurvesInterface.degree_mulByIsogeny` this gives `finrank_mulBy` over a field. -/
theorem finrank_mulBy_ofWeierstrass {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] :
    ((ofWeierstrass W).mulBy N).toSchemeHom.finrank =
      fun _ ↦ (EllipticCurvesInterface.mulByIsogeny W N).degree :=
  sorry

/-- The finite-flat kernel `E[N]`, for nonzero `N`. -/
noncomputable def torsion {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    FiniteFlatCommGroupScheme S :=
  sorry

theorem finrank_torsion {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (FiniteFlatCommGroupScheme.structureMap (torsion E N)).finrank = fun _ ↦ N ^ 2 :=
  sorry

/-- KM 2.3.1, étaleness: `E[N]` is étale over `S` where `N` is invertible. -/
theorem etale_torsion_of_isUnit {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N]
    (hN : IsUnit ((N : ℕ) : Γ(S, ⊤))) :
    Etale (E.torsion N).structureMap :=
  sorry

/-- The inclusion `E[m] ⊆ E[n]` for `m ∣ n`. -/
noncomputable def torsionInclusion {S : Scheme.{u}} (E : EllipticCurve S) (m n : ℕ) [NeZero m]
    [NeZero n] (h : m ∣ n) :
    FiniteFlatCommGroupScheme.Hom (E.torsion m) (E.torsion n) :=
  sorry

/-- The `j`-invariant of an elliptic curve as a morphism to the `j`-line `Spec ℤ[j]`, obtained
from local Weierstrass equations and the variable-change invariance of Layer 1C. -/
noncomputable def jMap {S : Scheme.{u}} (E : EllipticCurve S) :
    S ⟶ Spec (CommRingCat.of (Polynomial (ULift.{u} ℤ))) :=
  sorry

end EllipticCurve

/-- Finite locally free surjective homomorphisms of elliptic curves. -/
structure Isogeny {S : Scheme.{u}} (E E' : EllipticCurve S)
    extends EllipticCurve.Hom E E' where
  finite : IsFinite toHom.hom.left
  flat : Flat toHom.hom.left
  surjective : Surjective toHom.hom.left

attribute [instance] Isogeny.finite Isogeny.flat Isogeny.surjective

namespace Isogeny

noncomputable def toEllipticCurveHom {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : EllipticCurve.Hom E E' :=
  f.toHom

/-- An isogeny is locally of finite presentation, because its source and target are locally of
finite presentation over `S`; hence it is finite locally free, and `Scheme.Hom.finrank` applies to
it. Registered as an instance. -/
instance locallyOfFinitePresentation {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : LocallyOfFinitePresentation f.toHom.hom.left :=
  sorry

noncomputable def kernel {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E') :
    FiniteFlatCommGroupScheme S :=
  sorry

/-- An isogeny has constant degree `n` when its kernel has constant finite-flat rank `n`. -/
def IsOfDegree {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E')
    (n : ℕ) : Prop :=
  (FiniteFlatCommGroupScheme.structureMap (kernel f)).finrank = fun _ ↦ n

/-- The dual obtained by factoring `[deg f]` through the quotient by `ker f`. -/
noncomputable def factorizationDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') (n : ℕ) (hdeg : IsOfDegree f n) : Isogeny E' E :=
  sorry

/-- The isogeny obtained by restricting the general Picard dual homomorphism. -/
noncomputable def picardDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : Isogeny E' E :=
  sorry

theorem toEllipticCurveHom_picardDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') :
    toEllipticCurveHom (picardDual f) =
      EllipticCurve.Hom.picardDual (toEllipticCurveHom f) :=
  sorry

theorem picardDual_eq_factorizationDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') (n : ℕ) (hdeg : IsOfDegree f n) :
    picardDual f = factorizationDual f n hdeg :=
  sorry

/-- The unique public dual, introduced only after the two constructions have been compared. -/
noncomputable def dual {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E') :
    Isogeny E' E :=
  picardDual f

/-- The Poincaré/Cartier–Nishi pairing for an isogeny and its dual. -/
noncomputable def kernelPairing {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : GroupSchemePairing (kernel f) (kernel (dual f)) :=
  sorry

/-- Scheme-theoretic Cartier–Nishi perfection of the kernel pairing. -/
noncomputable def kernelDualEquivCartierDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') :
    FiniteFlatCommGroupScheme.Iso (kernel (dual f))
      (FiniteFlatCommGroupScheme.cartierDual (kernel f)) :=
  sorry

end Isogeny

/-! The relative Picard object below is deliberately owned here: the current Jacobian Challenge
contract supplies the general line-bundle and cohomology foundations but its Picard-scheme endpoint
is stated only over a field. -/

/-- The degree-zero relative Picard scheme of an elliptic curve, with its structure map to `S`. -/
noncomputable def picardZero {S : Scheme.{u}} (E : EllipticCurve S) : Over S :=
  sorry

/-- Elliptic autoduality, with the sign convention fixed in the roadmap. -/
noncomputable def ellipticCurveIsoPicardZero {S : Scheme.{u}} (E : EllipticCurve S) :
    E.toOver ≅ picardZero E :=
  sorry

/-- The Weil pairing on `E[N]`, after identifying the Picard and factorisation duals. -/
noncomputable def weilPairing {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    GroupSchemePairing (E.torsion N) (E.torsion N) :=
  sorry

/-- Evaluation of a pairing on sections: a pair of sections of `G` and `H` over `S` gives a
section of `𝔾_m`, i.e. a unit of `Γ(S, 𝒪_S)`. -/
noncomputable def GroupSchemePairing.evalSection {S : Scheme.{u}}
    {G H : FiniteFlatCommGroupScheme S} (p : GroupSchemePairing G H)
    (x : G.Section) (y : H.Section) : (Γ(S, ⊤))ˣ :=
  sorry

/-- The section of `E[N]` over `Spec K` attached to an `N`-torsion point of the Weierstrass
equation, through `projModelPointsEquiv`. -/
noncomputable def torsionSectionOfPoint {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N]
    (P : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    ((EllipticCurve.ofWeierstrass W).torsion N).Section :=
  sorry

/-- The normalization comparison of Layer 2E: over a field in which `N` is invertible, the
scheme-theoretic Weil pairing evaluated on `K`-points is the equation-level Weil pairing of the
Elliptic Curves roadmap. It fixes the normalization and is not used to construct the pairing. -/
theorem weilPairing_eq_equationLevel {K : Type u} [Field K] (W : WeierstrassCurve K)
    [W.IsElliptic] (N : ℕ) [NeZero N] (hN : (N : K) ≠ 0)
    (P Q : Submodule.torsionBy ℤ W.toAffine.Point (N : ℤ)) :
    Units.map (Scheme.ΓSpecIso (CommRingCat.of K)).hom.hom.toMonoidHom
        ((weilPairing (EllipticCurve.ofWeierstrass W) N).evalSection
          (torsionSectionOfPoint W N P) (torsionSectionOfPoint W N Q)) =
      ((Additive.toMul (TauCetiRoadmap.EllipticCurves.weilPairing W N P Q) :
        rootsOfUnity N K) : Kˣ) :=
  sorry

/-! ## Drinfeld structures -/

/-- Katz–Mazur `A`-structures for a finite abelian group `A`. -/
noncomputable def AStructure {S : Scheme.{u}} (A : Type u) [Fintype A] [AddCommGroup A]
    (G : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

/-- Katz–Mazur `A`-generators. -/
noncomputable def AGenerator {S : Scheme.{u}} (A : Type u) [Fintype A] [AddCommGroup A]
    (G : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

noncomputable def GammaFullStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def GammaOneStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def BalancedGammaOneStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def GammaZeroStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

/-! ## The category `Ell/R` and moduli problems -/

/-- The category of group-scheme homomorphisms between elliptic curves over a fixed base. -/
noncomputable instance ellipticCurveCategory (S : Scheme.{u}) : Category (EllipticCurve S) :=
  sorry

/-- The groupoid of elliptic curves and isomorphisms over a fixed base. -/
abbrev EllGroupoid (S : Scheme.{u}) := Core (EllipticCurve S)

/-- An object of `Ell/R`: an `R`-scheme together with an elliptic curve over it. -/
structure EllObj (R : CommRingCat.{u}) where
  base : Scheme.{u}
  structureMap : base ⟶ Spec R
  curve : EllipticCurve base

/-- A cartesian pointed arrow in `Ell/R`: a morphism of `R`-schemes together with a morphism of
total spaces making the square cartesian and carrying zero to zero. -/
@[ext]
structure EllHom {R : CommRingCat.{u}} (X Y : EllObj R) where
  base : X.base ⟶ Y.base
  over_base : base ≫ Y.structureMap = X.structureMap
  total : X.curve.carrier ⟶ Y.curve.carrier
  cartesian : IsPullback total X.curve.structureMap Y.curve.structureMap base
  maps_zero : X.curve.zero ≫ total = base ≫ Y.curve.zero

namespace EllHom

/-- The identity arrow. -/
@[simps]
def id {R : CommRingCat.{u}} (X : EllObj R) : EllHom X X where
  base := 𝟙 X.base
  over_base := by simp
  total := 𝟙 X.curve.carrier
  cartesian := IsPullback.of_horiz_isIso ⟨by simp⟩
  maps_zero := by simp

/-- Composition of cartesian pointed arrows; cartesian squares paste. -/
@[simps]
def comp {R : CommRingCat.{u}} {X Y Z : EllObj R} (f : EllHom X Y) (g : EllHom Y Z) :
    EllHom X Z where
  base := f.base ≫ g.base
  over_base := by rw [Category.assoc, g.over_base, f.over_base]
  total := f.total ≫ g.total
  cartesian := f.cartesian.paste_horiz g.cartesian
  maps_zero := by simp [reassoc_of% f.maps_zero, g.maps_zero]

end EllHom

instance ellObjCategory (R : CommRingCat.{u}) : Category.{u} (EllObj R) where
  Hom := EllHom
  id := EllHom.id
  comp := EllHom.comp
  id_comp f := by ext <;> simp
  comp_id f := by ext <;> simp
  assoc f g h := by ext <;> simp

/-- A cartesian isomorphism in `Ell/R`: `hom`, `inv`, and the two composition identities. -/
abbrev EllIso {R : CommRingCat.{u}} (X Y : EllObj R) := X ≅ Y

/-- A groupoid-valued moduli problem before passage to isomorphism classes. -/
structure GroupoidValuedModuliProblem (R : CommRingCat.{u}) where
  functor : (EllObj R)ᵒᵖ ⥤ Grpd.{u + 1, u + 1}

/-- The set-valued problem used after taking isomorphism classes. The larger universe accommodates
level structures containing scheme and group-scheme data. -/
abbrev ModuliProblem (R : CommRingCat.{u}) := (EllObj R)ᵒᵖ ⥤ Type (u + 1)

/-- Passage from a groupoid-valued problem to its isomorphism-class functor. -/
noncomputable def GroupoidValuedModuliProblem.isomClasses {R : CommRingCat.{u}}
    (P : GroupoidValuedModuliProblem R) : ModuliProblem R :=
  sorry

/-- The trivial problem `[Γ(1)]`. -/
def ModuliProblem.trivial (R : CommRingCat.{u}) : ModuliProblem R :=
  (Functor.const _).obj PUnit.{u + 2}

/-- The simultaneous problem `(𝒫, 𝒬)`. -/
@[simps]
def ModuliProblem.simul {R : CommRingCat.{u}} (P Q : ModuliProblem R) : ModuliProblem R where
  obj X := P.obj X × Q.obj X
  map f := TypeCat.ofHom (Prod.map (P.map f) (Q.map f))

/-- The moduli problem represented by an object `X` of `Ell/R`. -/
noncomputable def EllObj.yonedaProblem {R : CommRingCat.{u}} (X : EllObj R) :
    ModuliProblem R :=
  yoneda.obj X ⋙ uliftFunctor.{u + 1}

/-- Base change of the universal curve of `X` along `T ⟶ X.base`, as a functor
`Over X.base ⥤ Ell/R`. On objects it is the base change of Layer 1A; the arrows are its cartesian
squares. -/
noncomputable def EllObj.baseChangeFunctor {R : CommRingCat.{u}} (X : EllObj R) :
    Over X.base ⥤ EllObj R where
  obj T := ⟨T.left, T.hom ≫ X.structureMap, X.curve.baseChange T.hom⟩
  map _ := sorry
  map_id := sorry
  map_comp := sorry

namespace ModuliProblem

/-- The functor `T ↦ 𝒫(E_T)` on schemes over the base of `X`. -/
noncomputable def fibre {R : CommRingCat.{u}} (P : ModuliProblem R) (X : EllObj R) :
    (Over X.base)ᵒᵖ ⥤ Type (u + 1) :=
  X.baseChangeFunctor.op ⋙ P

/-- Relative-representability data (KM 4.2): for every `X = (E/S)`, a scheme `𝒫_{E/S}` over `S`
representing `T ↦ 𝒫(E_T)`. -/
structure RelRepData {R : CommRingCat.{u}} (P : ModuliProblem R) where
  rep : ∀ X : EllObj R, Over X.base
  representableBy : ∀ X : EllObj R, (P.fibre X).RepresentableBy (rep X)

/-- A relatively representable problem is affine, finite, flat, or étale over `Ell/R` when every
representing morphism has the corresponding property. -/
def RelRepData.HasProperty {R : CommRingCat.{u}} {P : ModuliProblem R} (D : P.RelRepData)
    (Q : MorphismProperty Scheme.{u}) : Prop :=
  ∀ X : EllObj R, Q (D.rep X).hom

/-- KM 4.3: rigidity means that an automorphism of `E/S` fixing a level structure is trivial. -/
def IsRigid {R : CommRingCat.{u}} (P : ModuliProblem R) : Prop :=
  ∀ (X : EllObj R) (σ : X ≅ X), σ.hom.base = 𝟙 X.base →
    ∀ α : P.obj (Opposite.op X), P.map σ.hom.op α = α → σ = Iso.refl X

/-- Representability of `𝒫` by an object of `Ell/R`: KM's `(E_univ / 𝕄(𝒫))`. -/
structure RepresentedBy {R : CommRingCat.{u}} (P : ModuliProblem R) (X : EllObj R) where
  univ : P.obj (Opposite.op X)
  bijective : ∀ Y : EllObj R, Function.Bijective fun f : Y ⟶ X ↦ P.map f.op univ

/-- KM 4.7.0, proved in Layer 4C by the Legendre and level-three rigidifiers and the finite étale
equivalence-relation quotient of Layer 0C: a relatively representable, affine, rigid moduli
problem is representable. -/
theorem exists_representedBy_of_isRigid {R : CommRingCat.{u}} (P : ModuliProblem R)
    (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom) (hP : P.IsRigid) :
    ∃ X : EllObj R, Nonempty (P.RepresentedBy X) :=
  sorry

/-- The morphism of representing schemes induced by a morphism of problems, through Yoneda. -/
noncomputable def RelRepData.mapRep {R : CommRingCat.{u}} {P P' : ModuliProblem R}
    (D : P.RelRepData) (D' : P'.RelRepData) (q : P ⟶ P') (X : EllObj R) :
    D.rep X ⟶ D'.rep X :=
  ((D'.representableBy X).homEquiv (X := D.rep X)).symm
    (q.app _ ((D.representableBy X).homEquiv (𝟙 (D.rep X))))

/-- The action of `H` on the representing scheme `𝒫_{E/S}` induced by an action on `𝒫`,
transported through Yoneda. -/
noncomputable def RelRepData.schemeAction {R : CommRingCat.{u}} {P : ModuliProblem R}
    (D : P.RelRepData) {H : Type u} [Group H] (act : H →* Aut P) (X : EllObj R) :
    H →* Aut (D.rep X) :=
  sorry

/-- KM 4.12, in the corrected reading of the Notes Added in Proof: for every representable étale
surjective rigidifier the simultaneous scheme is non-empty, regular, and every non-empty open has
dimension two. Non-emptiness is part of the strong sense of "of dimension two"; without it the
empty scheme would satisfy the predicate. -/
def RelRepData.IsRegularOfDimTwo {R : CommRingCat.{u}} {P : ModuliProblem R}
    (D : P.RelRepData) (rigidifiers : Set (EllObj R)) : Prop :=
  ∀ X ∈ rigidifiers,
    Nonempty (D.rep X).left ∧
      (∀ x : (D.rep X).left, IsRegularLocalRing ((D.rep X).left.presheaf.stalk x)) ∧
        ∀ U : (D.rep X).left.Opens, Nonempty U → topologicalKrullDim U = 2

end ModuliProblem

/-- KM 4.6: a representable rigidifier `δ`, given by its universal object, whose represented
problem is relatively representable by étale schemes over `Ell/R`. -/
structure EtaleRigidifier (R : CommRingCat.{u}) where
  obj : EllObj R
  relRep : obj.yonedaProblem.RelRepData
  etale : relRep.HasProperty @Etale
  /-- The rigidifier covers `Ell/R` (KM p. 110 distinguishes "étale" from "étale and surjective").
  For KM 7.1.2's Q2 this loses nothing, since a non-surjective étale representable problem may be
  enlarged by a disjoint union; for KM 4.12 it is what makes the non-emptiness clause of
  `IsRegularOfDimTwo` meaningful. -/
  surjective : relRep.HasProperty @Surjective

/-- The universal objects of the representable étale rigidifiers over `R`. -/
def EtaleRigidifier.objects (R : CommRingCat.{u}) : Set (EllObj R) :=
  Set.range fun δ : EtaleRigidifier R ↦ δ.obj

/-- `q` is the categorical quotient of `X` by the action `ρ` in the category of schemes; for the
affine actions of Chapter 7 this is the invariant-ring quotient of Layer 0C. -/
def IsCategoricalQuotient {S : Scheme.{u}} {X Y : Over S} {H : Type v} [Group H]
    (ρ : H →* Aut X) (q : X ⟶ Y) : Prop :=
  (∀ h : H, (ρ h).hom ≫ q = q) ∧
    ∀ (Z : Scheme.{u}) (g : X.left ⟶ Z), (∀ h : H, (ρ h).hom.left ≫ g = g) →
      ∃! g' : Y.left ⟶ Z, q.left ≫ g' = g

/-- Data exhibiting `𝒫' = 𝒫/H` in the sense of KM 7.1.2: an `H`-invariant morphism `q`
(Q1: `H` acts trivially on `𝒫'`) such that, for every representable étale rigidifier `δ`, the
scheme quotient `𝕄(δ,𝒫)/H` exists and `q` identifies it with `𝕄(δ,𝒫')` (Q2). The categorical
universal property is a conclusion of KM 7.1.3, not part of the definition. -/
structure KatzMazurQuotientData {R : CommRingCat.{u}} (P P' : ModuliProblem R) (H : Type u)
    [Group H] [Finite H] where
  q : P ⟶ P'
  act : H →* Aut P
  relRep : P.RelRepData
  relRep' : P'.RelRepData
  q1 : ∀ h : H, (act h).hom ≫ q = q
  q2 : ∀ δ : EtaleRigidifier R,
    IsCategoricalQuotient (relRep.schemeAction act δ.obj) (relRep.mapRep relRep' q δ.obj)

namespace KatzMazurQuotientData

variable {R : CommRingCat.{u}} {P P' : ModuliProblem R} {H : Type u} [Group H] [Finite H]

/-- KM 7.1.3, existence: an affine relatively representable problem with a finite group action
has a Katz–Mazur quotient. -/
theorem exists_of_hasProperty_affine (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom)
    (act : H →* Aut P) :
    ∃ (P' : ModuliProblem R) (Q : KatzMazurQuotientData P P' H), Q.act = act ∧ Q.relRep = D :=
  sorry

/-- KM 7.1.3(1): the quotient of an affine problem is affine over `Ell/R`. -/
theorem hasProperty_affine (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) : Q.relRep'.HasProperty @IsAffineHom :=
  sorry

/-- KM 7.1.3(1), the universal property: an `H`-invariant morphism to a relatively representable
problem factors uniquely through the quotient. -/
theorem existsUnique_desc (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (P'' : ModuliProblem R) (D'' : P''.RelRepData)
    (g : P ⟶ P'') (hg : ∀ h : H, (Q.act h).hom ≫ g = g) :
    ∃! g' : P' ⟶ P'', Q.q ≫ g' = g :=
  sorry

/-- KM 7.1.3(3), the invertible-order case: `(𝒫_{E/S})/H ≅ (𝒫/H)_{E/S}` when `|H|` is invertible
on `S`. The same conclusion holds when `𝒫_{E/S} ⟶ S` is flat or when the action is free. -/
theorem isCategoricalQuotient_of_isUnit_card (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (X : EllObj R)
    (hH : IsUnit ((Nat.card H : ℕ) : Γ(X.base, ⊤))) :
    IsCategoricalQuotient (Q.relRep.schemeAction Q.act X) (Q.relRep.mapRep Q.relRep' Q.q X) :=
  sorry

/-- KM 7.1.3(4): the projection `𝒫 ⟶ 𝒫/H` is finite. -/
theorem isFinite_mapRep (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (X : EllObj R) :
    IsFinite (Q.relRep.mapRep Q.relRep' Q.q X).left :=
  sorry

/-- KM 7.1.3(2), the free case: if `H` acts freely on every `𝒫(E/S)`, the projection
`𝒫 ⟶ 𝒫/H` is an étale `H`-torsor, in particular étale and hence locally of finite presentation.
This is the general free-action case; the general projection of KM 7.1.3(4) is finite but need
not be flat or locally of finite presentation (for `R = ℤ ⋉ V` with `V` an infinite-dimensional
`𝔽₂`-vector space and `A = R[ε]/(ε²)`, `ε ↦ -ε`, the algebra `A` is finitely presented over `R`
and finite, but not finitely presented, over its invariant ring `R ⊕ Vε`). -/
theorem etale_mapRep_of_free (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom)
    (hfree : ∀ (X : EllObj R) (α : P.obj (Opposite.op X)) (h : H),
      (Q.act h).hom.app (Opposite.op X) α = α → h = 1)
    (X : EllObj R) :
    Etale (Q.relRep.mapRep Q.relRep' Q.q X).left :=
  sorry

/-- KM 7.1.3(6): if `R` is noetherian and `𝒫` is finite over `Ell/R`, so is `𝒫/H`. -/
theorem hasProperty_finite (Q : KatzMazurQuotientData P P' H) [IsNoetherianRing R]
    (hP : Q.relRep.HasProperty @IsFinite) : Q.relRep'.HasProperty @IsFinite :=
  sorry

end KatzMazurQuotientData

/-! ## Chapter 5: the regularity axioms and the Axiomatic Regularity Theorem -/

/-- An isomorphism of `p`-divisible groups `E[p^∞] ≅ E'[p^∞]`: a compatible system of
isomorphisms `E[pⁿ] ≅ E'[pⁿ]`. -/
structure PDivisibleGroupIso {S : Scheme.{u}} (E E' : EllipticCurve S) (p : ℕ) [NeZero p] where
  iso : ∀ n : ℕ, FiniteFlatCommGroupScheme.Iso (E.torsion (p ^ n)) (E'.torsion (p ^ n))
  compat : ∀ n : ℕ,
    (iso n).hom.hom ≫ (E'.torsionInclusion (p ^ n) (p ^ (n + 1)) (pow_dvd_pow p n.le_succ)).hom =
      (E.torsionInclusion (p ^ n) (p ^ (n + 1)) (pow_dvd_pow p n.le_succ)).hom ≫
        (iso (n + 1)).hom.hom

/-- Supersingularity over a field: `E[p]` is connected. Over an algebraically closed field of
characteristic `p` this is the usual notion. -/
def EllipticCurve.IsSupersingular {k : Type u} [Field k] (p : ℕ) [NeZero p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) : Prop :=
  ConnectedSpace (E.torsion p).carrier

/-- An Artinian local `W(k)`-algebra with residue field identified with `k`: a test object for the
formal deformation functor of Layer 7D. -/
structure ArtinianTestAlgebra (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] where
  A : Type u
  [commRing : CommRing A]
  [isLocalRing : IsLocalRing A]
  [isArtinianRing : IsArtinianRing A]
  algebraMap : WittVector p k →+* A
  residue : A →+* k
  residue_surjective : Function.Surjective residue
  ker_residue : RingHom.ker residue = IsLocalRing.maximalIdeal A
  residue_comp_algebraMap : residue.comp algebraMap = WittVector.constantCoeff

attribute [instance] ArtinianTestAlgebra.commRing ArtinianTestAlgebra.isLocalRing
  ArtinianTestAlgebra.isArtinianRing

section Deformations

variable (p : ℕ) [Fact p.Prime] {k : Type u} [Field k]

/-- `E₀/k` as an object of `Ell/W(k)` over the closed point of `Spec W(k)`. -/
noncomputable def EllipticCurve.specialObj (E₀ : EllipticCurve (Spec (CommRingCat.of k))) :
    EllObj (CommRingCat.of (WittVector p k)) :=
  ⟨Spec (CommRingCat.of k), Spec.map (CommRingCat.ofHom WittVector.constantCoeff), E₀⟩

/-- A deformation of `E₀` over an Artinian test algebra: a curve over `Spec A` together with a
cartesian identification of its special fibre with `E₀`. -/
structure Deformation (E₀ : EllipticCurve (Spec (CommRingCat.of k)))
    (T : ArtinianTestAlgebra p k) where
  curve : EllipticCurve (Spec (CommRingCat.of T.A))
  ident : EllHom (E₀.specialObj p)
    ⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap), curve⟩
  ident_base : ident.base = Spec.map (CommRingCat.ofHom T.residue)

/-- The universal object of a deformation over `Spec W(k)[[T]]`. -/
noncomputable def universalDeformationObj
    (E : EllipticCurve (Spec (CommRingCat.of (PowerSeries (WittVector p k))))) :
    EllObj (CommRingCat.of (WittVector p k)) :=
  ⟨Spec (CommRingCat.of (PowerSeries (WittVector p k))),
    Spec.map (CommRingCat.ofHom (algebraMap (WittVector p k) (PowerSeries (WittVector p k)))), E⟩

/-- The universal formal deformation of `E₀` over `W(k)[[T]]` (Layer 7D): a family with special
fibre `E₀` such that every deformation over an Artinian test algebra is pulled back from it along
a unique local `W(k)`-algebra map, compatibly with the identifications of special fibres. -/
structure UniversalDeformation (E₀ : EllipticCurve (Spec (CommRingCat.of k))) where
  family : EllipticCurve (Spec (CommRingCat.of (PowerSeries (WittVector p k))))
  ident : EllHom (E₀.specialObj p) (universalDeformationObj p family)
  ident_base : ident.base =
    Spec.map (CommRingCat.ofHom (WittVector.constantCoeff.comp PowerSeries.constantCoeff))
  universal : ∀ (T : ArtinianTestAlgebra p k) (D : Deformation p E₀ T),
    ∃! ψ : PowerSeries (WittVector p k) →+* T.A,
      ψ.comp (algebraMap (WittVector p k) (PowerSeries (WittVector p k))) = T.algebraMap ∧
        T.residue.comp ψ = WittVector.constantCoeff.comp PowerSeries.constantCoeff ∧
          ∃ e : EllHom ⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap),
              D.curve⟩ (universalDeformationObj p family),
            e.base = Spec.map (CommRingCat.ofHom ψ) ∧ D.ident.comp e = ident

end Deformations

/-- The ring `ℤ` at universe `u`, the coefficient ring of `Ell/ℤ`. -/
abbrev intRing : CommRingCat.{u} := CommRingCat.of (ULift.{u} ℤ)

/-- An elliptic curve over an arbitrary scheme as an object of `Ell/ℤ`. -/
noncomputable def EllObj.ofCurve {S : Scheme.{u}} (E : EllipticCurve S) :
    EllObj (intRing.{u}) :=
  ⟨S, specULiftZIsTerminal.from S, E⟩

/-- KM 5.1.1's axioms Reg. 1–Reg. 4 for a moduli problem over `Ell/ℤ` at a prime `p`, stated on
chosen relative-representability data. -/
structure RegularityAxioms {P : ModuliProblem (intRing.{u})} (D : P.RelRepData) (p : ℕ)
    [Fact p.Prime] [NeZero p] where
  /-- Reg. 1: `𝒫` is relatively representable and finite over `Ell/ℤ`. -/
  reg1 : D.HasProperty @IsFinite
  /-- Reg. 2: `𝒫 ⊗ ℤ[1/p]` is finite étale over `Ell ⊗ ℤ[1/p]`. -/
  reg2 : ∀ X : EllObj (intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) → Etale (D.rep X).hom
  /-- Reg. 3: `𝒫_{E/S}` depends only on `E[p^∞]`, as an existence statement. -/
  reg3 : ∀ (S : Scheme.{u}) (E E' : EllipticCurve S), PDivisibleGroupIso E E' p →
    Nonempty (D.rep (EllObj.ofCurve E) ≅ D.rep (EllObj.ofCurve E'))
  /-- Reg. 4A: over a supersingular curve over an algebraically closed field of characteristic
  `p`, the set `𝒫(E₀/k)` has exactly one element. -/
  reg4A : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      Nonempty (P.obj (Opposite.op (EllObj.ofCurve E₀))) ∧
        Subsingleton (P.obj (Opposite.op (EllObj.ofCurve E₀)))
  /-- Reg. 4B: over the universal formal deformation of such a curve, `𝒫_𝔈` is the spectrum of a
  two-dimensional regular local ring. -/
  reg4B : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      ∀ 𝔈 : UniversalDeformation p E₀,
        IsAffine (D.rep (EllObj.ofCurve 𝔈.family)).left ∧
          IsRegularLocalRing Γ((D.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) ∧
            ringKrullDim Γ((D.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) = 2

/-- The Axiomatic Regularity Theorem KM 5.1.1, proved in Layer 7H: Reg. 1–Reg. 4 imply that `𝒫`
is finite flat over `Ell/ℤ` of constant positive rank and regular of dimension two. -/
theorem axiomaticRegularity {P : ModuliProblem (intRing.{u})} {D : P.RelRepData} {p : ℕ}
    [Fact p.Prime] [NeZero p] (_Reg : RegularityAxioms D p) :
    D.HasProperty @Flat ∧ D.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (D.rep X).hom.finrank = fun _ ↦ n) ∧
        D.IsRegularOfDimTwo (EtaleRigidifier.objects _) :=
  sorry

/-- KM 7.5.1's hypotheses G1–G3 for a Katz–Mazur quotient at the prime `p`, on top of Reg. 1–4
for the source. -/
structure QuotientRegularityAxioms {P P' : ModuliProblem (intRing.{u})} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H) (p : ℕ) [Fact p.Prime] [NeZero p]
    where
  reg : RegularityAxioms Q.relRep p
  /-- G1: after inverting `p`, the action of `H` on `𝒫` is free. -/
  g1 : ∀ X : EllObj (intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) →
    ∀ (T : Over X.base) (t : T ⟶ Q.relRep.rep X) (h : H),
      t ≫ (Q.relRep.schemeAction Q.act X h).hom = t → h = 1
  /-- G2: the Reg. 3 comparisons induced by isomorphisms of `p`-divisible groups can be chosen
  `H`-equivariant. -/
  g2 : ∀ (S : Scheme.{u}) (E E' : EllipticCurve S), PDivisibleGroupIso E E' p →
    ∃ e : Q.relRep.rep (EllObj.ofCurve E) ≅ Q.relRep.rep (EllObj.ofCurve E'),
      ∀ h : H, (Q.relRep.schemeAction Q.act (EllObj.ofCurve E) h).hom ≫ e.hom =
        e.hom ≫ (Q.relRep.schemeAction Q.act (EllObj.ofCurve E') h).hom
  /-- G3: over a supersingular universal deformation, with `𝒫_𝔈 = Spec A`, the algebra `A` is
  generated by `|H|` elements as a module over its invariant subring `A^H`. -/
  g3 : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      ∀ 𝔈 : UniversalDeformation p E₀,
        ∃ s : Finset Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
          s.card ≤ Nat.card H ∧
            ∀ a : Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
              ∃ c : Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) →
                  Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
                (∀ x, ∀ h : H,
                  (Q.relRep.schemeAction Q.act (EllObj.ofCurve 𝔈.family) h).hom.left.appTop
                    (c x) = c x) ∧
                  a = ∑ x ∈ s, c x * x

/-- KM 7.5.1, the Axiomatic Regularity Theorem for quotients: under Reg. 1–4 and G1–G3, `𝒫/H` is
finite flat of constant positive rank and regular of dimension two, and `𝒫 ⟶ 𝒫/H` is finite
flat of degree `|H|`. -/
theorem axiomaticRegularityOfQuotients {P P' : ModuliProblem (intRing.{u})} {H : Type u}
    [Group H] [Finite H] {Q : KatzMazurQuotientData P P' H} {p : ℕ} [Fact p.Prime] [NeZero p]
    (_QR : QuotientRegularityAxioms Q p) :
    Q.relRep'.HasProperty @Flat ∧ Q.relRep'.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (Q.relRep'.rep X).hom.finrank = fun _ ↦ n) ∧
        Q.relRep'.IsRegularOfDimTwo (EtaleRigidifier.objects _) ∧
          ∀ X, IsFinite (Q.relRep.mapRep Q.relRep' Q.q X).left ∧
            Flat (Q.relRep.mapRep Q.relRep' Q.q X).left ∧
              LocallyOfFinitePresentation (Q.relRep.mapRep Q.relRep' Q.q X).left ∧
                (Q.relRep.mapRep Q.relRep' Q.q X).left.finrank = fun _ ↦ Nat.card H :=
  sorry

/-! ## Chapter 6: cyclicity, `[N-Isog]`, and `[Γ₀(N)]` -/

/-- The parameter space of all degree-`N` quotient isogenies, before cyclicity is imposed. -/
noncomputable def NIsog {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over S :=
  sorry

/-- The generator scheme `G×`. -/
noncomputable def generatorScheme {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Over S :=
  sorry

/-- A rank-`N` finite locally free subgroup of `E[N]`, the hypothesis in KM 6.1.1. -/
structure TorsionSubgroup {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] where
  group : FiniteFlatCommGroupScheme S
  inclusion : FiniteFlatCommGroupScheme.Hom group (E.torsion N)
  inclusion_isClosedImmersion : IsClosedImmersion inclusion.hom.left
  rank : group.structureMap.finrank = fun _ ↦ N

/-- Katz–Mazur cyclicity: a Drinfeld generator exists after an fppf cover. -/
def FiniteFlatCommGroupScheme.IsCyclic {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S)
    (N : ℕ) [NeZero N] : Prop :=
  ∃ (T : Scheme.{u}) (f : T ⟶ S),
    Flat f ∧ Surjective f ∧ LocallyOfFinitePresentation f ∧
      Nonempty (AGenerator (ULift.{u} (ZMod N)) (G.baseChange f))

/-- KM 6.1.1, scoped to a rank-`N` subgroup of `E[N]`. -/
theorem cyclic_iff_generatorScheme_finiteFlat_rank {S : Scheme.{u}} (E : EllipticCurve S)
    (N : ℕ) [NeZero N] (G : TorsionSubgroup E N) :
    G.group.IsCyclic N ↔
      IsFinite (generatorScheme G.group).hom ∧ Flat (generatorScheme G.group).hom ∧
        LocallyOfFinitePresentation (generatorScheme G.group).hom ∧
          (generatorScheme G.group).hom.finrank = fun _ ↦ Nat.totient N :=
  sorry

/-- KM 6.5.1: the elliptic `[N-Isog]` parameter is finite, although the generic subgroup
Grassmannian need not be. -/
theorem isFinite_nIsog {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    IsFinite (NIsog E N).hom :=
  sorry

/-- The cyclicity locus as an object over `[N-Isog]`, constructed only after KM Chapters 5–6. -/
noncomputable def cyclicityLocus {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over (NIsog E N).left :=
  sorry

/-- The cyclicity locus is a closed subscheme of `[N-Isog]`. -/
theorem isClosedImmersion_cyclicityLocus {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] : IsClosedImmersion (cyclicityLocus E N).hom :=
  sorry

/-- The relative representing scheme for `[Γ₀(N)]`, defined from `cyclicityLocus` only after
the Chapter 5 regularity theorem and Chapter 6 isomorphism theorem. -/
noncomputable def GammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over S :=
  sorry

/-- The finite part of the First Main Theorem for `[Γ₀(N)]`. -/
theorem isFinite_gammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    IsFinite (GammaZero E N).hom :=
  sorry

/-- The flat part of the First Main Theorem for `[Γ₀(N)]`. -/
theorem flat_gammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Flat (GammaZero E N).hom :=
  sorry

/-- `[Γ₀(N)]` is locally of finite presentation over `S`, so that with the previous two theorems
it is finite locally free and its rank is locally constant. -/
theorem locallyOfFinitePresentation_gammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    LocallyOfFinitePresentation (GammaZero E N).hom :=
  sorry

/-- The exact degree `N ∏_{p∣N}(1+1/p)`, written integrally. -/
def gammaZeroDegree (N : ℕ) : ℕ :=
  N * N.primeFactors.prod (fun p ↦ p + 1) / N.primeFactors.prod (fun p ↦ p)

/-- The exact-rank part of the First Main Theorem for `[Γ₀(N)]`. -/
theorem finrank_gammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (GammaZero E N).hom.finrank = fun _ ↦ gammaZeroDegree N :=
  sorry

/-- The moduli problem `[Γ₀(N)]` over `Ell/ℤ`, with `GammaZero` as its relative representing
schemes (KM 6.6.1, Layer 8D). -/
noncomputable def gammaZeroProblem (N : ℕ) [NeZero N] : ModuliProblem (intRing.{u}) :=
  sorry

/-- The relative-representability data of `[Γ₀(N)]`. -/
noncomputable def gammaZeroRelRep (N : ℕ) [NeZero N] : (gammaZeroProblem N).RelRepData :=
  sorry

theorem gammaZeroRelRep_rep (N : ℕ) [NeZero N] (X : EllObj (intRing.{u})) :
    (gammaZeroRelRep N).rep X = GammaZero X.curve N :=
  sorry

/-- The `[Γ₀(N)]` clause of the First Main Theorem, KM 5.1.1 with KM 6.6.1: finite flat of rank
`N ∏_{p∣N}(1+1/p)`, regular of dimension two, and finite étale after inverting `N`. -/
theorem firstMainTheorem_gammaZero (N : ℕ) [NeZero N] :
    (gammaZeroRelRep N).HasProperty @IsFinite ∧ (gammaZeroRelRep N).HasProperty @Flat ∧
      (gammaZeroRelRep N).HasProperty @LocallyOfFinitePresentation ∧
      (∀ X, ((gammaZeroRelRep N).rep X).hom.finrank = fun _ ↦ gammaZeroDegree N) ∧
        (gammaZeroRelRep N).IsRegularOfDimTwo (EtaleRigidifier.objects _) ∧
          ∀ X : EllObj (intRing.{u}), IsUnit ((N : ℕ) : Γ(X.base, ⊤)) →
            Etale ((gammaZeroRelRep N).rep X).hom :=
  sorry

/-! ## Chapter 8: coarse moduli schemes -/

/-- Coarse-moduli data for a moduli problem (KM 8.1.1–8.1.3.1): a scheme `M(𝒫)` over `R`, natural
classifying maps `S ⟶ M(𝒫)` for objects of `𝒫`, the universal property among such families of
maps to schemes, and the bijection on isomorphism classes over algebraically closed fields. -/
structure CoarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem R) where
  M : Scheme.{u}
  structureMap : M ⟶ Spec R
  classify : ∀ X : EllObj R, P.obj (Opposite.op X) → (X.base ⟶ M)
  classify_over : ∀ X α, classify X α ≫ structureMap = X.structureMap
  classify_natural : ∀ {X Y : EllObj R} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
    classify X (P.map f.op α) = f.base ≫ classify Y α
  universal : ∀ (Z : Scheme.{u}) (g : ∀ X : EllObj R, P.obj (Opposite.op X) → (X.base ⟶ Z)),
    (∀ {X Y : EllObj R} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
      g X (P.map f.op α) = f.base ≫ g Y α) →
      ∃! φ : M ⟶ Z, ∀ X α, classify X α ≫ φ = g X α
  surjective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (t : Spec (CommRingCat.of k) ⟶ M),
    ∃ (s : Spec (CommRingCat.of k) ⟶ Spec R) (E : EllipticCurve (Spec (CommRingCat.of k)))
      (α : P.obj (Opposite.op ⟨_, s, E⟩)), classify ⟨_, s, E⟩ α = t
  injective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (s : Spec (CommRingCat.of k) ⟶ Spec R) (E E' : EllipticCurve (Spec (CommRingCat.of k)))
    (α : P.obj (Opposite.op ⟨_, s, E⟩)) (α' : P.obj (Opposite.op ⟨_, s, E'⟩)),
    classify ⟨_, s, E⟩ α = classify ⟨_, s, E'⟩ α' →
      ∃ σ : (⟨_, s, E⟩ : EllObj R) ≅ ⟨_, s, E'⟩, σ.hom.base = 𝟙 _ ∧ P.map σ.hom.op α' = α

/-- KM 8.1.1: an affine relatively representable problem has a coarse moduli scheme, constructed
Zariski-locally on `R` from a representable finite étale Galois rigidifier and glued. -/
theorem exists_coarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem R) (D : P.RelRepData)
    (hD : D.HasProperty @IsAffineHom) : Nonempty (CoarseModuliData P) :=
  sorry

/-- KM 8.1.5: `M(𝒫)/H ≅ M(𝒫/H)`. The action of `H` on `M(𝒫)` is the one induced by the
universal property, and the comparison is compatible with classifying maps. -/
theorem coarseModuli_quotient {R : CommRingCat.{u}} {P P' : ModuliProblem R} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (M : CoarseModuliData P) (M' : CoarseModuliData P') :
    ∃ (ρ : H →* Aut (Over.mk M.structureMap)) (q : Over.mk M.structureMap ⟶ Over.mk M'.structureMap),
      (∀ (h : H) X α, M.classify X α ≫ (ρ h).hom.left = M.classify X ((Q.act h).hom.app _ α)) ∧
        (∀ X α, M.classify X α ≫ q.left = M'.classify X (Q.q.app _ α)) ∧
          IsCategoricalQuotient ρ q :=
  sorry

/-- The coarse `j`-line statement over a coefficient ring `R`: the coarse moduli scheme of
`[Γ(1)]` over `R` is `Spec R[j]`, compatibly with the `j`-invariant. -/
def IsCoarseJLine (R : CommRingCat.{u}) : Prop :=
  ∃ (M : CoarseModuliData (ModuliProblem.trivial R))
    (e : M.M ≅ Spec (CommRingCat.of (Polynomial R))),
    e.hom ≫ Spec.map (CommRingCat.ofHom Polynomial.C) = M.structureMap ∧
      ∀ (X : EllObj R) (α : (ModuliProblem.trivial R).obj (Opposite.op X)),
        M.classify X α ≫ e.hom ≫
            Spec.map (CommRingCat.ofHom (Polynomial.mapRingHom
              ((Int.castRingHom R).comp ULift.ringEquiv.toRingHom))) =
          X.curve.jMap

/-- KM 8.2.1 over `ℤ`, proved in Layer 9E steps 1–5 by the level-three invariant computation and
the Legendre section argument. -/
theorem coarseJLine_int : IsCoarseJLine intRing.{u} :=
  sorry

/-- Base change of the kernel of a linear map of flat modules over a principal ideal domain: if
the cokernel of `f` is torsion-free, then for every `D`-algebra `R` the kernel of `f ⊗ R` is the
base change of the kernel of `f`. Applied in Layer 9E to `f : A ⟶ ∏_{g∈G} A`, `a ↦ (ga − a)_g`,
whose kernel is the invariant ring `A^G`, this is the criterion under which formation of the
invariant ring commutes with every base change: it does so exactly when it commutes with
reduction modulo every maximal ideal of `D`. -/
theorem ker_baseChange_of_noZeroSMulDivisors_coker {D : Type u} [CommRing D] [IsDomain D]
    [IsPrincipalIdealRing D] {M N : Type u} [AddCommGroup M] [Module D M] [AddCommGroup N]
    [Module D N] [Module.Flat D M] [Module.Flat D N] (f : M →ₗ[D] N)
    [NoZeroSMulDivisors D (N ⧸ LinearMap.range f)] (R : Type u) [CommRing R] [Algebra D R] :
    LinearMap.ker (LinearMap.baseChange R f) =
      LinearMap.range (LinearMap.baseChange R (LinearMap.ker f).subtype) :=
  sorry

/-- KM 8.2.1 over an arbitrary ring, "well known, cf. Igusa": an independent milestone, **not**
a corollary of `coarseJLine_int`, because coarse formation does not commute with arbitrary base
change (KM 8.1.7). Layer 9E step 6 proves it from the fibrewise invariant computations at every
prime and `ker_baseChange_of_noZeroSMulDivisors_coker` applied over `ℤ[1/3]` and `ℤ[1/2]`. -/
theorem coarseJLine (R : CommRingCat.{u}) : IsCoarseJLine R :=
  sorry

/-! ## Geometric irreducibility: the algebraic reduction

Layer 5C states the geometric irreducibility of `Y(ρ)` **conditionally**, on geometric
connectedness. The two declarations below are the part this roadmap owns; the hypothesis `hconn`
is discharged by the complex-uniformisation supplier named in §Layer 5C, which is not built here.

Neither declaration mentions `Y(ρ)`: the reduction is a general fact about smooth curves, and
stating it that way keeps it usable — and checkable — before the twisted curve has a carrier.
-/

/-- **The tractable leaf.** A nonempty connected scheme, smooth of relative dimension one over an
algebraically closed field, is irreducible. Smoothness gives normality, and a connected normal
scheme is irreducible. -/
theorem irreducibleSpace_of_connectedSpace {K : Type u} [Field K] [IsAlgClosed K]
    (Y : Scheme.{u}) (sY : Y ⟶ Spec (CommRingCat.of K))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y] [ConnectedSpace Y] :
    IrreducibleSpace Y :=
  sorry

/-- **Geometric irreducibility of a smooth `ℚ`-curve, given geometric connectedness.** The base
change of a smooth morphism is smooth, so the leaf above applies over `ℚ̄` once `hconn` is
supplied.

This is the reduction Layer 5C applies to `Y(ρ)`, in the shape the AINTLIB development states it
(`yRho_geometricallyIrreducible_of_connected`; §Provenance), so that the two can be compared
without a carrier for the twisted curve on either side. ⚠ `hconn` is **not** proved here and has
no algebraic proof to schedule: Katz–Mazur Ch. 10 is the algebraic route, but its own connectedness
corollary 10.9.2 reduces to the geometric generic fibre and then invokes the transcendental
description of the complex manifold as `ℍ/Γ̃`. -/
theorem irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace
    (Y : Scheme.{0}) (sY : Y ⟶ Spec (CommRingCat.of ℚ))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y]
    (hconn : ConnectedSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ)))))) :
    IrreducibleSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ))))) :=
  sorry

/-!
## Interfaces awaiting their prerequisite carriers

The structures above expose the present variance and group-scheme choices. The following
declarations are intentionally left to the point at which their genuine carriers exist; the exact
mathematical contracts are in the README and are not represented here by opaque `Type` aliases or
vacuous proposition fields:

1. the chartwise group law and the explicit low-degree and positive-degree cohomology and
   base-change theorems built on the pointed atlas carrier above;
2. the universal properties of incidence and equality loci, proper relative divisor implies finite
   locally free, and the subgroup-divisor criterion;
3. functorial Cartier duality, the norm-linearised quotient `E/C`, the relative Poincaré line
   bundle using the shared invertible-sheaf carrier, elliptic autoduality, both dual composition
   identities, the Cartier–Nishi pairing, alternation, scheme-theoretic perfection, and change of
   level;
4. the equation-level `mulByIsogeny` and `degree_mulByIsogeny` in the Elliptic Curves roadmap
   itself, replacing the mirrored `EllipticCurvesInterface` declarations here, and the
   arbitrary-base part of KM 8.2.1 (`coarseJLine`), which is an independent milestone from
   `coarseJLine_int`;
5. exact order, its implication `[N]P=0`, cyclic subgroups, coprime product theorems for
   `A`-structures, and the balanced quotient-isogeny comparison;
6. the arrows of `EllObj.baseChangeFunctor`, the Yoneda transport in
   `RelRepData.schemeAction`, KM 7.1.3(2) and (5), the scalar-extension comparison of
   Remark 7.1.4, and all seven standard quotient isomorphisms of KM 7.4.2 by normalisation;
7. `Y₁(N)` with its visible `N≥4` hypothesis, `Y_full(N)` and `Y(ρ)` with their visible `N≥3`
   hypotheses, the determinant map and fixed-pairing fibres, and the frame-torsor construction;
8. Barsotti–Tate groups beyond the torsion-tower presentation of `PDivisibleGroupIso`, Serre–Tate
   theory, the three prime-power calculations, and the verification of Reg. 1–Reg. 4 and G1–G3
   for the standard problems;
9. the Axiomatic Isomorphism Theorem, the universal property of the cyclicity locus, and the
   finite-flat rank-`φ(N)` map `[Γ₁(N)]⟶[Γ₀(N)]`;
10. coarse base change KM 8.1.6, KM 8.2.2, and the displayed Borel-quotient chain for `Y₀(N)`;
11. Layer 10's compactified coarse curve `X_H` (the KM 8.6 normalisation of the `j`-line in
    `Y_H`), its cusp sections computed through the Tate parameter (KM 8.11), the extension of
    `Y₁(N) → Y₀(N)` to `X₁(N) → X₀(N)` with Mazur's ramification table, and the étale Shimura
    covering `X₂(N) → X₀(N)` of degree `numerator((N−1)/12)` — these wait on a normalisation
    carrier for schemes and on Layer 9's coarse `j`-line, and their exact statements are pinned
    in `README.md` §Layer 10 and §The Mazur interface.
-/

end TauCetiRoadmap.ModularCurves

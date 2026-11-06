module

public import Mathlib
public import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel
public import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Smooth
public import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Integral
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Degree
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.WeilPairing.Basic
public import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Relative
public import TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine
public import TauCeti.AlgebraicGeometry.GroupScheme.Kernel
public import TauCeti.AlgebraicGeometry.GroupScheme.KilledByRank
public import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Geom.Isogeny
public import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Geom.Torsion.Etale.Locus
public import TauCeti.AlgebraicGeometry.ModularCurve.Regular
public import TauCeti.AlgebraicGeometry.Grassmannian.Proper
public import TauCeti.AlgebraicGeometry.Grassmannian.UniversalQuotient
public import TauCeti.AlgebraicGeometry.Grassmannian.HopfIdeal
public import TauCeti.AlgebraicGeometry.Grassmannian.SubgroupScheme
public import TauCeti.AlgebraicGeometry.Grassmannian.FiniteLocallyFree
public import TauCeti.RingTheory.StrictHenselization.Henselian
public import TauCeti.RingTheory.StrictHenselization.MaximalIdeal
public import TauCeti.RingTheory.StrictHenselization.Etale
public import TauCeti.RingTheory.StrictHenselization.Lift
public import TauCeti.RingTheory.StrictHenselization.Map
public import TauCeti.CategoryTheory.EffectiveEpi.Descent
public import TauCeti.AlgebraicGeometry.Descent.Affine
public import TauCeti.AlgebraicGeometry.Descent.AffineMorphism
public import TauCeti.AlgebraicGeometry.Descent.FiniteLocallyFree
public import TauCeti.AlgebraicGeometry.Descent.MorphismProperty
public import TauCeti.AlgebraicGeometry.Descent.Proj
public import TauCeti.AlgebraicGeometry.FiniteEtale.Galois.Basic
public import TauCeti.AlgebraicGeometry.FiniteEtale.EtaleLocallySplit
public import TauCeti.AlgebraicGeometry.PicardFunctor.Relative
public import TauCeti.AlgebraicGeometry.PicardFunctor.PicZero.Fppf
public import TauCeti.AlgebraicGeometry.PicardFunctor.Abel.Fppf
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Rank

/-!
# Modular curves, following Katz–Mazur: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need. The carriers are Tau Ceti's: elliptic curves over a base are
`TauCeti.AlgebraicGeometry.EllipticCurveGeom S` with the group law `grpObj` and the commutative
group object `toCommGrp`; multiplication by `n` is `mulBy`, `E[n]` is `torsion n`; finite locally
free commutative group schemes are `FiniteFlatCommGroupScheme S`; the category `Ell/R` is
`EllObj (Spec R)`, set-valued moduli problems on it are `ModuliProblem (Spec R)`, with
relative-representability data `RelRepData`, the properties `HasProperty`, rigidity `IsRigid`,
representability `Functor.RepresentableBy`, and regularity of dimension `d` of a relatively
representable problem `RelRepData.IsRegularOfDim`; the strict henselization of a local ring is
`TauCeti.StrictHenselization.algebra R Ω` with its map `toTarget` to the separable closure. The
definitions made here are the representable étale surjective rigidifiers, the Katz–Mazur quotient
data, the regularity axioms Reg. 1–Reg. 4 and G1–G3 with the universal formal deformation they
quantify over, supersingularity, isomorphisms of `p`-divisible groups, and coarse-moduli data.

Headline theorems stated here: KM 2.5.1 (pointed morphisms are homomorphisms), KM 4.7.0
(relatively representable, affine and rigid implies representable), KM 5.1.1 (the Axiomatic
Regularity Theorem) with the ring-theoretic core of KM 5.3.4, the existence of the universal
formal deformation (Layer 7D), KM 7.1.3 (Katz–Mazur quotients), KM 7.5.1 (regularity of
quotients), KM 8.1.1 and 8.1.5 (coarse moduli schemes and their quotients), the
quotient-smoothness theorem of KM's Notes Added in Proof (Layer 9D), the base-change lemma for
invariant rings of Layer 9E, the algebraic reduction of geometric irreducibility of Layer 5C, and
the clauses of Layer 4D not at the pin (the separably closed residue field of the strict
henselization, its Noetherianity, and the completion statements). KM 2.3.1, the killed-by-rank
theorem of Layer 0B, the Galois description of finite étale schemes over a field (Layer 0D), the
affine, finite locally free and closed-subscheme cases of effective faithfully flat descent with
the descent of sections and morphisms (Layer 0E), Cartier duality over an affine base (Layer 0B),
and the relative Picard functor with its
rigidified form, its degree-zero subsheaf and the Abel–Jacobi map (Layer 2D) are proved or
constructed at the pinned Tau Ceti and are cited in `README.md`, §Exact supplier contracts, not
restated.

Headline theorems not statable at the pins, and what each lacks:

* the First Main Theorem for `[Γ(N)]`, `[Γ₁(N)]` and balanced `[Γ₁(N)]` (KM 5.1.1 applied to
  them) and for `[Γ₀(N)]` (KM 6.6.1): the Cartier-divisor sums of sections and the balanced
  and `[Γ₀(N)]` problems on a relative curve (Layers 0A and 3);
* the cyclicity theorem KM 6.1.1, the finiteness of `[N-Isog]` (KM 6.5.1) and the Axiomatic
  Isomorphism Theorem KM 6.2.1: the generator scheme `Gˣ`, the relative subgroup Grassmannian of
  Layer 0G over a non-affine base and Drinfeld generators;
* the dual isogeny, Cartier–Nishi duality and the scheme-theoretic Weil pairing (KM 2.5–2.8): the
  pullback homomorphism `Pic⁰(φ)` of degree-zero relative Picard sheaves along a homomorphism `φ`
  of elliptic curves and the normalised Poincaré bundle of Layer 2D, from which the dual, the
  Cartier–Nishi pairing and `e_N` are constructed, and Cartier duality over a non-affine base
  (Layer 0B). The relative Picard functor with its degree-zero subsheaf, Cartier duality over an
  affine base, and `𝔾_m` and `μ_N` as fpqc sheaves over any base are at the pin;
* the coarse `j`-line KM 8.2.1: the `j`-invariant of an elliptic curve over a base as a morphism
  to `Spec ℤ[j]` (Layer 1C);
* `Y₁(N)`, `Y_full(N)`, `Y(ρ)` (Layer 5) and every statement of Layer 10: the quotient curves
  `Y_H` and the projective `j`-line.
-/

@[expose] public section

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory Limits MonoidalCategory CartesianMonoidalCategory MonObj
open TauCeti.AlgebraicGeometry
open scoped Classical

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory
  CategoryTheory.Over.braidedCategory

/-! Pinned library declarations named in the supplier contracts of `README.md`. -/

#check @WeierstrassCurve.projModel
#check @WeierstrassCurve.isProper_projModelOver
#check @WeierstrassCurve.smoothOfRelativeDimension_one_projModelOver
#check @WeierstrassCurve.isIntegral_projModel
#check @TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero
#check @TauCeti.Isogeny.weilPairing
#check @TauCeti.Isogeny.weilPairing_self
#check @TauCeti.Isogeny.weilPairing_nondegenerate
#check @AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier
#check @TauCeti.AffineInvariantQuotient.quotient
#check @TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType
#check @TauCeti.GroupScheme.kernelBaseChangeIso
#check @AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank
#check @TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme
#check @TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme.pow_eq_one_of_finrank
#check @TauCeti.AlgebraicGeometry.PointedWeierstrassChart
#check @TauCeti.AlgebraicGeometry.PointedWeierstrassAtlas
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.grpObj
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.isCommMonObj
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.toCommGrp
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.mulBy
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.isIsogeny_intCast
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.degree_intCast
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.torsion
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.torsionInclusion
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.finrank_torsion_hom
#check @TauCeti.AlgebraicGeometry.EllipticCurveGeom.etale_torsion_hom_iff
#check @TauCeti.AlgebraicGeometry.EllObj
#check @TauCeti.AlgebraicGeometry.EllObj.Hom
#check @TauCeti.AlgebraicGeometry.ModuliProblem
#check @TauCeti.AlgebraicGeometry.ModuliProblem.RelRepData
#check @TauCeti.AlgebraicGeometry.ModuliProblem.RelRepData.HasProperty
#check @TauCeti.AlgebraicGeometry.ModuliProblem.IsRigid
#check @TauCeti.AlgebraicGeometry.ModuliProblem.RelRepData.IsRegularOfDim
#check @Module.Grassmannian.scheme
#check @Module.Grassmannian.toSpec
#check @Module.Grassmannian.schemeHomEquiv
#check @Module.Grassmannian.isProper_toSpec
#check @Module.Grassmannian.schemeUniversalIdeal
#check @Module.Grassmannian.schemeHopfIdealLocus
#check @Module.Grassmannian.subgroupScheme
#check @Module.Grassmannian.hopfIdealLocusEquivClosedSubgroupScheme
#check @Module.Grassmannian.schemeHopfIdealLocusFamily
#check @Module.Grassmannian.isPullback_schemeHopfIdealLocusFamilyHom
#check @TauCeti.StrictHenselization.algebra
#check @TauCeti.StrictHenselization.toTarget
#check @TauCeti.StrictHenselization.henselianLocalRing
#check @TauCeti.StrictHenselization.isLocalHom_algebraMap
#check @TauCeti.StrictHenselization.maximalIdeal_eq_map
#check @TauCeti.StrictHenselization.ker_toTarget_eq_maximalIdeal
#check @TauCeti.StrictHenselization.toTarget_surjective
#check @TauCeti.StrictHenselization.existsUnique_lift
#check @TauCeti.StrictHenselization.exists_isLocalHom_lift
#check @TauCeti.StrictHenselization.existsUnique_algHom_of_etale
#check @TauCeti.StrictHenselization.existsUnique_map
#check @AlgebraicGeometry.Scheme.fpqcTopology
#check @AlgebraicGeometry.GeometricallyConnected
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualDualIso
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso
#check @TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual
#check @TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme
#check @TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme
#check @TauCeti.ConstantGroup.cartierDualIso
#check @TauCeti.DiagonalizableGroup.cartierDualIso
#check @TauCeti.DescentDatum
#check @TauCeti.DescentDatum.baseChange
#check @TauCeti.sectionDescentEquiv
#check @TauCeti.homDescentEquiv
#check @TauCeti.DescentDatum.baseChangeHomEquiv
#check @TauCeti.DescentDatum.Hom.descendIso
#check @TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso
#check @TauCeti.DescentDatum.descended
#check @TauCeti.DescentDatum.isIso_toBaseChangeDescended_hom
#check @TauCeti.DescentDatum.isPullback_toDescended
#check @TauCeti.DescentDatum.exists_finiteLocallyFree_baseChange_hom_isIso
#check @AlgebraicGeometry.IsClosedImmersion.descendsAlong_surjective_inf_flat_inf_quasiCompact
#check @AlgebraicGeometry.IsFinite.descendsAlong_surjective_inf_flat_inf_quasiCompact
#check @TauCeti.DescentDatum.isClosedImmersion_descended_hom
#check @TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal
#check @TauCeti.FiniteEtaleScheme
#check @TauCeti.FiniteEtaleScheme.essImage_mapGrp_ι_iff
#check @TauCeti.FiniteEtaleScheme.isFinite_hom_left
#check @TauCeti.FiniteEtaleScheme.etale_hom_left
#check @AlgebraicGeometry.Scheme.Hom.exists_split_etaleLocally
#check @TauCeti.FiniteEtaleScheme.galoisEquivalence
#check @TauCeti.FiniteEtaleScheme.galoisEquivalenceGrp
#check @TauCeti.FiniteEtaleScheme.galoisEquivalenceCommGrp
#check @TauCeti.FiniteEtaleScheme.galoisEquivalenceAlternatingPairingEquiv
#check @TauCeti.AlgebraicGeometry.relativePicardPresheaf
#check @TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor
#check @TauCeti.AlgebraicGeometry.rigidifiedPicardFunctorIso
#check @TauCeti.AlgebraicGeometry.relativePicardFppfSheaf
#check @TauCeti.AlgebraicGeometry.relativePicardDegreeZeroSubfunctor
#check @TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf
#check @TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheafι
#check @TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf

universe u v

/-! ## Layer 2: pointed morphisms of elliptic curves -/

/-- KM 2.5.1, proved in Layer 2D from the relative Picard theory: a scheme morphism over `S`
carrying zero to zero is the morphism of schemes underlying a unique homomorphism of commutative
group schemes `E.toCommGrp ⟶ E'.toCommGrp`. It converts into that type; it is not used to define
it or the multiplication maps. -/
theorem isGroupHom_of_mapsZero {S : Scheme.{u}} {E E' : EllipticCurveGeom S}
    (f : E.carrier ⟶ E'.carrier) (hf_over : f ≫ E'.structureMap = E.structureMap)
    (hf_zero : E.zero ≫ f = E'.zero) :
    ∃! F : E.toCommGrp ⟶ E'.toCommGrp, F.hom.hom.hom.left = f :=
  sorry

/-! ## Layer 4: the category `Ell/R` and moduli problems

The category `Ell/R` is `EllObj (Spec R)`; set-valued moduli problems on it are
`ModuliProblem (Spec R)`, with relative representability `RelRepData`, the properties
`RelRepData.HasProperty`, rigidity `ModuliProblem.IsRigid` and representability
`Functor.RepresentableBy`, all Tau Ceti's.
-/

/-- KM 4.6: a representable rigidifier `δ`, given by its universal object `obj` with the
representing bijections, whose problem is relatively representable by étale schemes over `Ell/R`
and covers `Ell/R` (KM p. 110 distinguishes "étale" from "étale and surjective"). For KM 7.1.2's
Q2 surjectivity loses nothing, since a non-surjective étale representable problem may be enlarged
by a disjoint union; for KM 4.12 it is what makes the non-emptiness clause of
`RelRepData.IsRegularOfDim` meaningful, and it is the quantification that predicate uses. -/
structure EtaleRigidifier (R : CommRingCat.{u}) where
  /-- The moduli problem of the rigidifier. -/
  problem : ModuliProblem (Spec R)
  /-- Its universal object `(E_univ / 𝕄(δ))`. -/
  obj : EllObj (Spec R)
  /-- The universal object represents the problem. -/
  representableBy : problem.RepresentableBy obj
  /-- Relative-representability data for the problem. -/
  relRep : problem.RelRepData
  /-- The rigidifier is étale over `Ell/R`. -/
  etale : relRep.HasProperty @Etale
  /-- The rigidifier is surjective over `Ell/R`. -/
  surjective : relRep.HasProperty @Surjective

/-- KM 4.7.0, proved in Layer 4C by the Legendre and level-three rigidifiers and the finite étale
equivalence-relation quotient of Layer 0C: a relatively representable, affine, rigid moduli
problem is representable. -/
theorem exists_representableBy_of_isRigid {R : CommRingCat.{u}} (P : ModuliProblem (Spec R))
    (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom) (hP : P.IsRigid) :
    ∃ X : EllObj (Spec R), Nonempty (P.RepresentableBy X) :=
  sorry

/-- `q` is the categorical quotient of `X` by the action `ρ` in the category of schemes; for the
affine actions of Chapter 7 this is the invariant-ring quotient of Layer 0C. -/
def IsCategoricalQuotient {S : Scheme.{u}} {X Y : Over S} {H : Type v} [Group H]
    (ρ : H →* Aut X) (q : X ⟶ Y) : Prop :=
  (∀ h : H, (ρ h).asIso.hom ≫ q = q) ∧
    ∀ (Z : Scheme.{u}) (g : X.left ⟶ Z), (∀ h : H, (ρ h).asIso.hom.left ≫ g = g) →
      ∃! g' : Y.left ⟶ Z, q.left ≫ g' = g

/-- Data exhibiting `𝒫' = 𝒫/H` in the sense of KM 7.1.2: an `H`-invariant morphism `q`
(Q1: `H` acts trivially on `𝒫'`) such that, for every representable étale surjective rigidifier
`δ`, the scheme quotient `𝕄(δ,𝒫)/H` exists and `q` identifies it with `𝕄(δ,𝒫')` (Q2). The
morphisms `𝒫_{E/S} ⟶ 𝒫'_{E/S}` induced by `q` and the actions of `H` on `𝒫_{E/S}` induced by the
action on `𝒫` are recorded with the laws that characterise them through the representing
bijections of the fibres `T ↦ 𝒫(E_T/T)`. The categorical universal property is a conclusion of
KM 7.1.3, not part of the definition. -/
structure KatzMazurQuotientData {R : CommRingCat.{u}} (P P' : ModuliProblem (Spec R))
    (H : Type u) [Group H] [Finite H] where
  q : P ⟶ P'
  act : H →* Aut P
  relRep : P.RelRepData
  relRep' : P'.RelRepData
  /-- The morphism of representing schemes induced by `q`. -/
  mapRep : ∀ X : EllObj (Spec R), relRep.rep X ⟶ relRep'.rep X
  mapRep_homEquiv : ∀ (X : EllObj (Spec R)) {T : Over X.base} (t : T ⟶ relRep.rep X),
    (relRep'.representableBy X).homEquiv (t ≫ mapRep X) =
      q.app (Opposite.op (X.baseChangeFunctor.obj T)) ((relRep.representableBy X).homEquiv t)
  /-- The action of `H` on the representing scheme `𝒫_{E/S}` induced by the action on `𝒫`. -/
  schemeAction : ∀ X : EllObj (Spec R), H →* Aut (relRep.rep X)
  schemeAction_homEquiv : ∀ (X : EllObj (Spec R)) {T : Over X.base} (t : T ⟶ relRep.rep X)
    (h : H),
    (relRep.representableBy X).homEquiv (t ≫ (schemeAction X h).asIso.hom) =
      (act h).asIso.hom.app (Opposite.op (X.baseChangeFunctor.obj T))
        ((relRep.representableBy X).homEquiv t)
  q1 : ∀ h : H, (act h).asIso.hom ≫ q = q
  q2 : ∀ δ : EtaleRigidifier R, IsCategoricalQuotient (schemeAction δ.obj) (mapRep δ.obj)

namespace KatzMazurQuotientData

variable {R : CommRingCat.{u}} {P P' : ModuliProblem (Spec R)} {H : Type u} [Group H] [Finite H]

/-- KM 7.1.3, existence: an affine relatively representable problem with a finite group action
has a Katz–Mazur quotient. -/
theorem exists_of_hasProperty_affine (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom)
    (act : H →* Aut P) :
    ∃ (P' : ModuliProblem (Spec R)) (Q : KatzMazurQuotientData P P' H),
      Q.act = act ∧ Q.relRep = D :=
  sorry

/-- KM 7.1.3(1): the quotient of an affine problem is affine over `Ell/R`. -/
theorem hasProperty_affine (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) : Q.relRep'.HasProperty @IsAffineHom :=
  sorry

/-- KM 7.1.3(1), the universal property: an `H`-invariant morphism to a relatively representable
problem factors uniquely through the quotient. -/
theorem existsUnique_desc (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (P'' : ModuliProblem (Spec R))
    (D'' : P''.RelRepData) (g : P ⟶ P'') (hg : ∀ h : H, (Q.act h).asIso.hom ≫ g = g) :
    ∃! g' : P' ⟶ P'', Q.q ≫ g' = g :=
  sorry

/-- KM 7.1.3(3), the invertible-order case: `(𝒫_{E/S})/H ≅ (𝒫/H)_{E/S}` when `|H|` is invertible
on `S`. The same conclusion holds when the action is free. Flatness of `𝒫_{E/S} ⟶ S`
alone is insufficient: the action `x ↦ -x` on `ℤ[x]` acquires new invariants modulo `2`.
Flat base change in the invariant-ring theorem means that the base-change morphism is flat. -/
theorem isCategoricalQuotient_of_isUnit_card (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (X : EllObj (Spec R))
    (hH : IsUnit ((Nat.card H : ℕ) : Γ(X.base, ⊤))) :
    IsCategoricalQuotient (Q.schemeAction X) (Q.mapRep X) :=
  sorry

/-- The finite-type form of the quotient-projection finiteness statement.
The affine source must also be locally of finite type over `Ell/R`. Integrality of an
arbitrary finite-group invariant extension does not imply module-finiteness; see README 9A.
The integral level problems used later are finite over `Ell/R`, so satisfy this hypothesis. -/
theorem isFinite_mapRep (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom)
    (hP_ft : Q.relRep.HasProperty @LocallyOfFiniteType) (X : EllObj (Spec R)) :
    IsFinite (Q.mapRep X).left :=
  sorry

/-- KM 7.1.3(2), the free case: if `H` acts freely on `𝒫`, the projection
`𝒫 ⟶ 𝒫/H` is an étale `H`-torsor, in particular étale and hence locally of finite presentation.

Freeness is stated over nonempty bases only, and this is load-bearing. KM's own phrasing
("`G` operates freely on the set `𝒫(E/S)`") cannot be taken literally here: over the empty
base the standard problems have `𝒫(E/∅)` a singleton, and its unique element is fixed by all
of `H`, so the unrestricted set-level hypothesis would force `H = 1` and the theorem would be
vacuous. Restricted to `X` with nonempty base, the hypothesis is equivalent to scheme-theoretic
freeness (for every `h ≠ 1` the fixed locus of `σ_h` on each `𝒫_{E/S}` is the empty scheme),
because a fixed point of the scheme with residue field `κ` is a fixed element of `𝒫(E_κ/κ)`
over the nonempty base `Spec κ`. The étale-torsor conclusion needs no restriction: over the
empty base it holds trivially. README 9A(2) fixes this reading for the prose roadmap.

Under the finite-type hypothesis of `isFinite_mapRep`, the general quotient projection is finite
but need not be flat or locally of finite presentation (for `R = ℤ ⋉ V` with `V` an
infinite-dimensional `𝔽₂`-vector space and `A = R[ε]/(ε²)`, `ε ↦ -ε`, the algebra `A` is
finitely presented over `R` and finite, but not finitely presented, over its invariant ring
`R ⊕ Vε`). -/
theorem etale_mapRep_of_free (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom)
    (hfree : ∀ X : EllObj (Spec R), Nonempty X.base → ∀ (α : P.obj (Opposite.op X)) (h : H),
      (Q.act h).asIso.hom.app (Opposite.op X) α = α → h = 1)
    (X : EllObj (Spec R)) :
    Etale (Q.mapRep X).left :=
  sorry

/-- KM 7.1.3(6): if `R` is noetherian and `𝒫` is finite over `Ell/R`, so is `𝒫/H`. -/
theorem hasProperty_finite (Q : KatzMazurQuotientData P P' H) [IsNoetherianRing R]
    (hP : Q.relRep.HasProperty @IsFinite) : Q.relRep'.HasProperty @IsFinite :=
  sorry

end KatzMazurQuotientData

/-! ## Layer 7: the regularity axioms and the Axiomatic Regularity Theorem -/

/-- An isomorphism of `p`-divisible groups `E[p^∞] ≅ E'[p^∞]`: a compatible system of
isomorphisms of group schemes `E[pⁿ] ≅ E'[pⁿ]` (PD-1 of README 7E), compatible with the
inclusions `E[pⁿ] ⊆ E[pⁿ⁺¹]`. -/
structure PDivisibleGroupIso {S : Scheme.{u}} (E E' : EllipticCurveGeom S) (p : ℕ) [NeZero p]
    where
  iso : ∀ n : ℕ, E.torsion ((p : ℤ) ^ n) ≅ E'.torsion ((p : ℤ) ^ n)
  compat : ∀ n : ℕ,
    (iso n).hom.hom.hom ≫ E'.torsionInclusion ((p : ℤ) ^ n) p =
      E.torsionInclusion ((p : ℤ) ^ n) p ≫ (iso (n + 1)).hom.hom.hom

/-- Supersingularity over a field: `E[p]` is connected (PD-2 of README 7E). Over an
algebraically closed field of characteristic `p` this is the usual notion. -/
def IsSupersingular {k : Type u} [Field k] (p : ℕ) [NeZero p]
    (E : EllipticCurveGeom (Spec (CommRingCat.of k))) : Prop :=
  ConnectedSpace (E.torsion p).X.left

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
noncomputable def specialObj (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))) :
    EllObj (Spec (CommRingCat.of (WittVector p k))) :=
  ⟨Spec (CommRingCat.of k), Spec.map (CommRingCat.ofHom WittVector.constantCoeff), E₀⟩

/-- A deformation of `E₀` over an Artinian test algebra: a curve over `Spec A` together with a
cartesian identification of its special fibre with `E₀`, an arrow of `Ell/W(k)` over the
reduction `Spec k ⟶ Spec A`. -/
structure Deformation (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k)))
    (T : ArtinianTestAlgebra p k) where
  curve : EllipticCurveGeom (Spec (CommRingCat.of T.A))
  ident : specialObj p E₀ ⟶
    ⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap), curve⟩
  ident_base : ident.base = Spec.map (CommRingCat.ofHom T.residue)

/-- The universal object of a deformation over `Spec W(k)[[T]]`. -/
noncomputable def universalDeformationObj
    (E : EllipticCurveGeom (Spec (CommRingCat.of (PowerSeries (WittVector p k))))) :
    EllObj (Spec (CommRingCat.of (WittVector p k))) :=
  ⟨Spec (CommRingCat.of (PowerSeries (WittVector p k))),
    Spec.map (CommRingCat.ofHom (algebraMap (WittVector p k) (PowerSeries (WittVector p k)))), E⟩

/-- The universal formal deformation of `E₀` over `W(k)[[T]]` (Layer 7D): a family with special
fibre `E₀` such that every deformation over an Artinian test algebra is pulled back from it along
a unique local `W(k)`-algebra map, compatibly with the identifications of special fibres. -/
structure UniversalDeformation (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))) where
  family : EllipticCurveGeom (Spec (CommRingCat.of (PowerSeries (WittVector p k))))
  ident : specialObj p E₀ ⟶ universalDeformationObj p family
  ident_base : ident.base =
    Spec.map (CommRingCat.ofHom (WittVector.constantCoeff.comp PowerSeries.constantCoeff))
  universal : ∀ (T : ArtinianTestAlgebra p k) (D : Deformation p E₀ T),
    ∃! ψ : PowerSeries (WittVector p k) →+* T.A,
      ψ.comp (algebraMap (WittVector p k) (PowerSeries (WittVector p k))) = T.algebraMap ∧
        T.residue.comp ψ = WittVector.constantCoeff.comp PowerSeries.constantCoeff ∧
          ∃ e : (⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap),
              D.curve⟩ : EllObj (Spec (CommRingCat.of (WittVector p k)))) ⟶
                universalDeformationObj p family,
            e.base = Spec.map (CommRingCat.ofHom ψ) ∧ D.ident ≫ e = ident

/-- Layer 7D: every elliptic curve over an algebraically closed field of characteristic `p` has a
universal formal deformation over `W(k)[[T]]`. -/
theorem exists_universalDeformation [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))) :
    Nonempty (UniversalDeformation p E₀) :=
  sorry

end Deformations

/-- The ring `ℤ` at universe `u`, the coefficient ring of `Ell/ℤ`. -/
abbrev intRing : CommRingCat.{u} := CommRingCat.of (ULift.{u} ℤ)

/-- An elliptic curve over an arbitrary scheme as an object of `Ell/ℤ`. -/
noncomputable def ofCurve {S : Scheme.{u}} (E : EllipticCurveGeom S) :
    EllObj (Spec intRing.{u}) :=
  ⟨S, specULiftZIsTerminal.from S, E⟩

/-- KM 5.1.1's axioms Reg. 1–Reg. 4 for a moduli problem over `Ell/ℤ` at a prime `p`, stated on
chosen relative-representability data. -/
structure RegularityAxioms {P : ModuliProblem (Spec intRing.{u})} (D : P.RelRepData) (p : ℕ)
    [Fact p.Prime] [NeZero p] where
  /-- Reg. 1: `𝒫` is relatively representable and finite over `Ell/ℤ`. -/
  reg1 : D.HasProperty @IsFinite
  /-- Reg. 2: `𝒫 ⊗ ℤ[1/p]` is finite étale over `Ell ⊗ ℤ[1/p]`. -/
  reg2 : ∀ X : EllObj (Spec intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) →
    Etale (D.rep X).hom
  /-- Reg. 3: `𝒫_{E/S}` depends only on `E[p^∞]`, as an existence statement. -/
  reg3 : ∀ (S : Scheme.{u}) (E E' : EllipticCurveGeom S), PDivisibleGroupIso E E' p →
    Nonempty (D.rep (ofCurve E) ≅ D.rep (ofCurve E'))
  /-- Reg. 4A: over a supersingular curve over an algebraically closed field of characteristic
  `p`, the set `𝒫(E₀/k)` has exactly one element. -/
  reg4A : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))), IsSupersingular p E₀ →
      Nonempty (P.obj (Opposite.op (ofCurve E₀))) ∧
        Subsingleton (P.obj (Opposite.op (ofCurve E₀)))
  /-- Reg. 4B: over the universal formal deformation of such a curve, `𝒫_𝔈` is the spectrum of a
  two-dimensional regular local ring. -/
  reg4B : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))), IsSupersingular p E₀ →
      ∀ 𝔈 : UniversalDeformation p E₀,
        IsAffine (D.rep (ofCurve 𝔈.family)).left ∧
          IsRegularLocalRing Γ((D.rep (ofCurve 𝔈.family)).left, ⊤) ∧
            ringKrullDim Γ((D.rep (ofCurve 𝔈.family)).left, ⊤) = 2

/-- The Axiomatic Regularity Theorem KM 5.1.1, proved in Layer 7H: Reg. 1–Reg. 4 imply that `𝒫`
is finite flat over `Ell/ℤ` of constant positive rank and regular of dimension two, in Tau Ceti's
sense `RelRepData.IsRegularOfDim` (tested on every representable étale surjective rigidifier). -/
theorem axiomaticRegularity {P : ModuliProblem (Spec intRing.{u})} {D : P.RelRepData} {p : ℕ}
    [Fact p.Prime] [NeZero p] (_Reg : RegularityAxioms D p) :
    D.HasProperty @Flat ∧ D.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (D.rep X).hom.finrank = fun _ ↦ n) ∧
        D.IsRegularOfDim 2 :=
  sorry

/-- The ring-theoretic core of the rigidity engine KM 5.3.4 (Layer 7G): for a one-parameter
formal group law `G` over an arbitrary ring `R` (commutativity is not used: only the
degree-`pⁿ` part of `G(X,Y) = X + Y + …` is read), if `X^{pⁿ} = 0` cuts out a
subgroup scheme — stated universally, `G(X,Y)^{pⁿ}` lies in the ideal `(X^{pⁿ}, Y^{pⁿ})` of
`R⟦X,Y⟧` — then `p = 0` in `R`. KM's proof isolates the binomial coefficients: comparing
total-degree-`pⁿ` terms forces `(X+Y)^{pⁿ} = X^{pⁿ} + Y^{pⁿ}`, so `C(pⁿ, i) = 0` in `R` for
`0 < i < pⁿ`; `i = 1` gives `pⁿ = 0` and `i = p^{n-1}`, whose binomial coefficient is `p`
times an integer prime to `p`, gives `p = 0`. The full KM 5.3.4 additionally identifies the
subgroup with `Ker(Fⁿ)`; the scheme-level engine KM 5.3.3 and the rigidity assertions
Rigid I–III (KM 5.3.2.1–5.3.2.3) are specified in README 7G. -/
theorem formalGroup_p_eq_zero_of_pow_mem_span {R : Type u} [CommRing R]
    (F : FormalGroup R) (p : ℕ) [Fact p.Prime] {n : ℕ} (hn : 1 ≤ n)
    (h : F.toPowerSeries ^ p ^ n ∈
      Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 2) R) ^ p ^ n,
        MvPowerSeries.X 1 ^ p ^ n}) :
    (p : R) = 0 :=
  sorry

/-! ## Layer 9C: the Axiomatic Regularity Theorem for quotients -/

/-- KM 7.5.1's hypotheses G1–G3 for a Katz–Mazur quotient at the prime `p`, on top of Reg. 1–4
for the source. -/
structure QuotientRegularityAxioms {P P' : ModuliProblem (Spec intRing.{u})} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H) (p : ℕ) [Fact p.Prime] [NeZero p]
    where
  reg : RegularityAxioms Q.relRep p
  /-- G1: after inverting `p`, the action of `H` on `𝒫` is free, in the scheme-theoretic
  sense: for every `h ≠ 1` the fixed locus of `σ_h` on `𝒫_{E/S}` is the empty scheme. It is
  stated on test objects — a fixed `T`-point with `T` nonempty forces `h = 1` — which is
  equivalent, since a nonempty fixed `T` maps a point into the fixed locus, and a nonempty
  fixed locus admits a fixed field-valued point. The `Nonempty T.left` hypothesis is what
  makes this a fixed-locus condition rather than a contradiction: the empty scheme is initial,
  so its unique morphism to `𝒫_{E/S}` is fixed by every `h`, and without the restriction G1
  would force `H = 1` and `axiomaticRegularityOfQuotients` would be unsatisfiable in every
  nontrivial case. README 9C G1 fixes the same reading. -/
  g1 : ∀ X : EllObj (Spec intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) →
    ∀ T : Over X.base, Nonempty T.left →
      ∀ (t : T ⟶ Q.relRep.rep X) (h : H),
        t ≫ (Q.schemeAction X h).asIso.hom = t → h = 1
  /-- G2: the Reg. 3 comparisons induced by isomorphisms of `p`-divisible groups can be chosen
  `H`-equivariant. -/
  g2 : ∀ (S : Scheme.{u}) (E E' : EllipticCurveGeom S), PDivisibleGroupIso E E' p →
    ∃ e : Q.relRep.rep (ofCurve E) ≅ Q.relRep.rep (ofCurve E'),
      ∀ h : H, (Q.schemeAction (ofCurve E) h).asIso.hom ≫ e.hom =
        e.hom ≫ (Q.schemeAction (ofCurve E') h).asIso.hom
  /-- G3: over a supersingular universal deformation, with `𝒫_𝔈 = Spec A`, the algebra `A` is
  generated by `|H|` elements as a module over its invariant subring `A^H`. -/
  g3 : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurveGeom (Spec (CommRingCat.of k))), IsSupersingular p E₀ →
      ∀ 𝔈 : UniversalDeformation p E₀,
        ∃ s : Finset Γ((Q.relRep.rep (ofCurve 𝔈.family)).left, ⊤),
          s.card ≤ Nat.card H ∧
            ∀ a : Γ((Q.relRep.rep (ofCurve 𝔈.family)).left, ⊤),
              ∃ c : Γ((Q.relRep.rep (ofCurve 𝔈.family)).left, ⊤) →
                  Γ((Q.relRep.rep (ofCurve 𝔈.family)).left, ⊤),
                (∀ x, ∀ h : H,
                  (Q.schemeAction (ofCurve 𝔈.family) h).asIso.hom.left.appTop (c x) = c x) ∧
                  a = ∑ x ∈ s, c x * x

/-- KM 7.5.1, the Axiomatic Regularity Theorem for quotients: under Reg. 1–4 and G1–G3, `𝒫/H` is
finite flat of constant positive rank and regular of dimension two, and `𝒫 ⟶ 𝒫/H` is finite
flat of degree `|H|`. -/
theorem axiomaticRegularityOfQuotients {P P' : ModuliProblem (Spec intRing.{u})} {H : Type u}
    [Group H] [Finite H] {Q : KatzMazurQuotientData P P' H} {p : ℕ} [Fact p.Prime] [NeZero p]
    (_QR : QuotientRegularityAxioms Q p) :
    Q.relRep'.HasProperty @Flat ∧ Q.relRep'.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (Q.relRep'.rep X).hom.finrank = fun _ ↦ n) ∧
        Q.relRep'.IsRegularOfDim 2 ∧
          ∀ X, IsFinite (Q.mapRep X).left ∧ Flat (Q.mapRep X).left ∧
            LocallyOfFinitePresentation (Q.mapRep X).left ∧
              (Q.mapRep X).left.finrank = fun _ ↦ Nat.card H :=
  sorry

/-! ## Layer 9D–9E: coarse moduli schemes -/

/-- Coarse-moduli data for a moduli problem (KM 8.1.1–8.1.3.1): a scheme `M(𝒫)` over `R`, natural
classifying maps `S ⟶ M(𝒫)` for objects of `𝒫`, the universal property among such families of
maps to schemes, and the bijection on isomorphism classes over algebraically closed fields. -/
structure CoarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem (Spec R)) where
  M : Scheme.{u}
  structureMap : M ⟶ Spec R
  classify : ∀ X : EllObj (Spec R), P.obj (Opposite.op X) → (X.base ⟶ M)
  classify_over : ∀ X α, classify X α ≫ structureMap = X.structureMap
  classify_natural : ∀ {X Y : EllObj (Spec R)} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
    classify X (P.map f.op α) = f.base ≫ classify Y α
  universal : ∀ (Z : Scheme.{u})
    (g : ∀ X : EllObj (Spec R), P.obj (Opposite.op X) → (X.base ⟶ Z)),
    (∀ {X Y : EllObj (Spec R)} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
      g X (P.map f.op α) = f.base ≫ g Y α) →
      ∃! φ : M ⟶ Z, ∀ X α, classify X α ≫ φ = g X α
  surjective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (t : Spec (CommRingCat.of k) ⟶ M),
    ∃ (s : Spec (CommRingCat.of k) ⟶ Spec R) (E : EllipticCurveGeom (Spec (CommRingCat.of k)))
      (α : P.obj (Opposite.op ⟨_, s, E⟩)), classify ⟨_, s, E⟩ α = t
  injective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (s : Spec (CommRingCat.of k) ⟶ Spec R) (E E' : EllipticCurveGeom (Spec (CommRingCat.of k)))
    (α : P.obj (Opposite.op ⟨_, s, E⟩)) (α' : P.obj (Opposite.op ⟨_, s, E'⟩)),
    classify ⟨_, s, E⟩ α = classify ⟨_, s, E'⟩ α' →
      ∃ σ : (⟨_, s, E⟩ : EllObj (Spec R)) ≅ ⟨_, s, E'⟩, σ.hom.base = 𝟙 _ ∧ P.map σ.hom.op α' = α

/-- KM 8.1.1: an affine relatively representable problem has a coarse moduli scheme, constructed
Zariski-locally on `R` from a representable finite étale Galois rigidifier and glued. -/
theorem exists_coarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem (Spec R))
    (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom) : Nonempty (CoarseModuliData P) :=
  sorry

/-- KM 8.1.5: `M(𝒫)/H ≅ M(𝒫/H)`. The action of `H` on `M(𝒫)` is the one induced by the
universal property, and the comparison is compatible with classifying maps. -/
theorem coarseModuli_quotient {R : CommRingCat.{u}} {P P' : ModuliProblem (Spec R)} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (M : CoarseModuliData P) (M' : CoarseModuliData P') :
    ∃ (ρ : H →* Aut (Over.mk M.structureMap))
      (q : Over.mk M.structureMap ⟶ Over.mk M'.structureMap),
      (∀ (h : H) X α, M.classify X α ≫ (ρ h).asIso.hom.left =
        M.classify X ((Q.act h).asIso.hom.app _ α)) ∧
        (∀ X α, M.classify X α ≫ q.left = M'.classify X (Q.q.app _ α)) ∧
          IsCategoricalQuotient ρ q :=
  sorry

/-- Base change of the kernel of a linear map into a flat module over a principal ideal domain:
if the cokernel of `f` is torsion-free, then for every `D`-algebra `R` the kernel of `f ⊗ R` is
the base change of the kernel of `f`. The source `M` need not be flat: the image of `f` is a
submodule of the flat module `N`, hence torsion-free and flat, so the two short exact sequences
`0 → ker f → M → im f → 0` and `0 → im f → N → coker f → 0` stay exact after `⊗ R`. Applied
in Layer 9E to `f : A ⟶ ∏_{g∈G} A`, `a ↦ (ga − a)_g`, whose kernel is the invariant ring `A^G`,
this is the criterion under which formation of the invariant ring commutes with every base
change: it does so exactly when it commutes with reduction modulo every maximal ideal of `D`. -/
theorem ker_baseChange_of_noZeroSMulDivisors_coker {D : Type u} [CommRing D] [IsDomain D]
    [IsPrincipalIdealRing D] {M N : Type u} [AddCommGroup M] [Module D M] [AddCommGroup N]
    [Module D N] [Module.Flat D N] (f : M →ₗ[D] N)
    [NoZeroSMulDivisors D (N ⧸ LinearMap.range f)] (R : Type u) [CommRing R] [Algebra D R] :
    LinearMap.ker (LinearMap.baseChange R f) =
      LinearMap.range (LinearMap.baseChange R (LinearMap.ker f).subtype) :=
  sorry

/-! ## Layer 9D: smoothness of finite quotients

The generic theorem behind the interior smoothness of the compactified curves of README Layer 10,
stated for an arbitrary categorical quotient of a smooth affine relative curve over a locally
noetherian base with regular local rings. Its application to `Y₁(N)/ℤ[1/N]` with its diamond
action, giving the smoothness of every `Y_H`, is README Layer 9D; no modular object occurs in the
signature. -/

section Layer9D

/-- KM, Notes Added in Proof, pp. 508–509: a finite quotient of a smooth affine relative curve
over a locally noetherian base with regular local rings is again a smooth relative curve. No
invertibility of the order of `H` on the base is assumed, which is what makes the statement
usable in residue characteristics `2` and `3`. -/
theorem smoothOfRelativeDimension_one_of_isCategoricalQuotient {S Y Q : Scheme.{u}}
    [IsLocallyNoetherian S] (_hS : ∀ s : S, IsRegularLocalRing (S.presheaf.stalk s))
    (f : Y ⟶ S) [IsAffineHom f] [SmoothOfRelativeDimension 1 f] (g : Q ⟶ S)
    {H : Type u} [Group H] [Finite H] (ρ : H →* Aut (Over.mk f)) (q : Over.mk f ⟶ Over.mk g)
    (_hq : IsCategoricalQuotient ρ q) : SmoothOfRelativeDimension 1 g :=
  sorry

end Layer9D

/-! ## Layer 5C: geometric irreducibility, the algebraic reduction

The twisted-curve application is conditional on geometric connectedness. README Layer 5C
specifies an external scheme–analytic comparison contract; it is not an imported theorem or a
milestone already supplied by another roadmap. The declarations here prove only the algebraic
implication from that explicit hypothesis.
-/

/-- A nonempty connected scheme, smooth of relative dimension one over a field, is irreducible.
Smoothness over any field gives local noetherianness and regularity, hence normality; a connected
locally noetherian normal scheme is irreducible. Layer 5C applies this with `K = ℚ̄`. -/
theorem irreducibleSpace_of_connectedSpace {K : Type u} [Field K]
    (Y : Scheme.{u}) (sY : Y ⟶ Spec (CommRingCat.of K))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y] [ConnectedSpace Y] :
    IrreducibleSpace Y :=
  sorry

/-- Geometric irreducibility of a smooth `ℚ`-curve, given geometric connectedness: the base
change of a smooth morphism is smooth, so the leaf above applies over `ℚ̄` once `hconn` is
supplied. This is the reduction Layer 5C applies to `Y(ρ)`. The hypothesis `hconn` is not proved
here; the reference route described in README Layer 5C uses complex uniformisation and a
scheme–analytic connectedness comparison. -/
theorem irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace
    (Y : Scheme.{0}) (sY : Y ⟶ Spec (CommRingCat.of ℚ))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y]
    (hconn : ConnectedSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ)))))) :
    IrreducibleSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ))))) :=
  sorry

/-! ## Layer 4D: the strict henselization of a local ring

The strict henselization `R^{sh}` of a local ring `(R, 𝔪, κ)` with respect to a separable
closure `Ω` of `κ` is Tau Ceti's `TauCeti.StrictHenselization.algebra R Ω`, the filtered colimit
of the étale neighbourhoods of Stacks, Lemma 10.155.11 (04GW), pointed by an `R`-algebra map to
`Ω`, with its map `toTarget : R^{sh} →ₐ[R] Ω`. The library proves that it is henselian local, that
`R → R^{sh}` is local, that `𝔪 R^{sh}` is its maximal ideal and the kernel of `toTarget`, that
`toTarget` is surjective, the universal property of Stacks, Lemma 10.153.11 (08HQ), the Stacks-form
points of étale algebras (04GT) and functoriality (04GU); README 4D cites them. "Strictly
henselian" is `HenselianLocalRing S ∧ IsSepClosed (ResidueField S)` (Stacks, Definition 10.153.1
(04GF)); no new predicate is introduced. The two clauses below are the ones not at the pin. -/

open TauCeti.StrictHenselization in
/-- The residue field of the strict henselization is separably closed: it is `Ω` through the
surjection `toTarget` with kernel the maximal ideal. Stacks, Lemma 10.155.2 (04GP), (2). -/
@[stacks 04GP "(2), separably closed residue field"]
theorem isSepClosed_residueField_strictHenselization (R Ω : Type u) [CommRing R] [IsLocalRing R]
    [Field Ω] [Algebra R Ω] [Algebra (IsLocalRing.ResidueField R) Ω]
    [IsScalarTower R (IsLocalRing.ResidueField R) Ω]
    [IsSepClosure (IsLocalRing.ResidueField R) Ω] :
    IsSepClosed (IsLocalRing.ResidueField (algebra R Ω)) :=
  sorry

open TauCeti.StrictHenselization in
/-- **Noetherianity.** `R` is Noetherian iff `R^{sh}` is. Stacks, Lemma 15.46.3 (06LJ), the
equivalence (1) ⇔ (3); its other clauses are README targets. -/
@[stacks 06LJ "(1) iff (3)"]
theorem isNoetherianRing_strictHenselization_iff (R Ω : Type u) [CommRing R] [IsLocalRing R]
    [Field Ω] [Algebra R Ω] [Algebra (IsLocalRing.ResidueField R) Ω]
    [IsScalarTower R (IsLocalRing.ResidueField R) Ω]
    [IsSepClosure (IsLocalRing.ResidueField R) Ω] :
    IsNoetherianRing R ↔ IsNoetherianRing (algebra R Ω) :=
  sorry

/-- **Dimension of the completion.** Stacks, Lemma 15.44.1 (07NV). -/
@[stacks 07NV]
theorem ringKrullDim_adicCompletion (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A] :
    ringKrullDim (AdicCompletion (IsLocalRing.maximalIdeal A) A) = ringKrullDim A := by
  sorry

/-- **Regularity of the completion.** A Noetherian local ring is regular iff its completion is.
Stacks, Lemma 15.44.4 (07NY). -/
@[stacks 07NY]
theorem isRegularLocalRing_adicCompletion_iff (A : Type*) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] :
    IsRegularLocalRing A ↔ IsRegularLocalRing (AdicCompletion (IsLocalRing.maximalIdeal A) A) := by
  sorry

end TauCetiRoadmap.ModularCurves

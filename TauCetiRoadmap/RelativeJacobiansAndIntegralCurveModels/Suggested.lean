import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Scheme.Points

/-!
# Relative Jacobians and integral models of curves: representative target signatures

These are suggested forms, not an exhaustive checklist; `README.md` is the roadmap. It records
signatures whose carriers are available at the pinned libraries: a Dedekind-domain model, extension of its generic points,
the kernel and cokernel descriptions of the two-open cohomology sequence, strict-local fraction-field
Brauer vanishing, and torsion reduction
for separated finite-type commutative group schemes. Cohomology here
has values in `AddCommGrpCat`; the README also specifies its scalar and base-change structure.
The two inclusions into the biproduct check the order and sign of the differential.
-/

open CategoryTheory Limits AlgebraicGeometry

noncomputable section

namespace TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

universe u

/-! ## Layer 0: Dedekind models and two-chart cohomology -/

/-- A flat finitely presented model with a specified generic-fibre identification.
Properness, normality, regularity and smoothness are additional properties.
The definition also allows a field as the Dedekind base. -/
structure DedekindModel (R K : Type u) [CommRing R] [IsDedekindDomain R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) (toK : C ⟶ Spec (.of K)) where
  /-- The total space. -/
  total : Scheme.{u}
  /-- The structure morphism. -/
  toBase : total ⟶ Spec (.of R)
  /-- Flatness over the base. -/
  flat : Flat toBase
  /-- The local part of finite presentation. -/
  locallyOfFinitePresentation : LocallyOfFinitePresentation toBase
  /-- Quasi-compactness of the structure morphism. -/
  quasiCompact : QuasiCompact toBase
  /-- Quasi-separatedness of the structure morphism. -/
  quasiSeparated : QuasiSeparated toBase
  /-- The identification of the generic fibre with the fixed scheme. -/
  genericFiberIso : TauCeti.genericFiber R K toBase ≅ Over.mk toK

namespace DedekindModel

variable {R K : Type u} [CommRing R] [IsDedekindDomain R]
variable [Field K] [Algebra R K] [IsFractionRing R K]
variable {C : Scheme.{u}} {toK : C ⟶ Spec (.of K)}

attribute [instance] DedekindModel.flat DedekindModel.locallyOfFinitePresentation
  DedekindModel.quasiCompact DedekindModel.quasiSeparated

/-- Properness is a property of a model's structure morphism. -/
abbrev IsProper (M : DedekindModel R K C toK) : Prop :=
  AlgebraicGeometry.IsProper M.toBase

/-- A DVR model supplies precisely the same data over its Dedekind domain. -/
def ofModel {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    DedekindModel R K C toK where
  total := M.total
  toBase := M.toBase
  flat := M.flat
  locallyOfFinitePresentation := M.locallyOfFinitePresentation
  quasiCompact := M.quasiCompact
  quasiSeparated := M.quasiSeparated
  genericFiberIso := M.genericFiberIso

/-- The DVR comparison preserves the structure morphism. -/
theorem ofModel_toBase {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    (ofModel M).toBase = M.toBase := rfl

/-- The DVR comparison preserves the specified generic marking. -/
theorem ofModel_genericFiberIso {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra R K] [IsFractionRing R K]
    (M : TauCeti.Model R K C toK) :
    (ofModel M).genericFiberIso = M.genericFiberIso := rfl

/-- Properness agrees under the DVR comparison. -/
theorem ofModel_isProper {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    (ofModel M).IsProper ↔ M.IsProper := Iff.rfl

example (M : DedekindModel K K C toK) : Nonempty (Over.mk M.toBase ≅ Over.mk toK) := by
  have hbase : Spec.map (CommRingCat.ofHom (algebraMap K K)) = 𝟙 (Spec (.of K)) := by
    simp
  have : IsIso (Spec.map (CommRingCat.ofHom (algebraMap K K))) := by
    rw [hbase]
    infer_instance
  let e : M.total ≅ C := (asIso (TauCeti.genericFiberι K K M.toBase)).symm ≪≫
    (Over.forget _).mapIso M.genericFiberIso
  refine ⟨Over.isoMk e ?_⟩
  change inv (TauCeti.genericFiberι K K M.toBase) ≫
    M.genericFiberIso.hom.left ≫ toK = M.toBase
  have hmark : M.genericFiberIso.hom.left ≫ toK =
      (TauCeti.genericFiber K K M.toBase).hom := Over.w M.genericFiberIso.hom
  simp only [hmark]
  have hg := TauCeti.genericFiberι_toBase K K M.toBase
  rw [hbase, Category.comp_id] at hg
  rw [← hg, IsIso.inv_hom_id_assoc]

example (M : DedekindModel R K C toK) (a : Over.mk toK ≅ Over.mk toK)
    (ha : a ≠ Iso.refl _) :
    ({ M with genericFiberIso := M.genericFiberIso ≪≫ a } :
      DedekindModel R K C toK).genericFiberIso ≠ M.genericFiberIso := by
  intro h
  apply ha
  apply Iso.ext
  exact (cancel_epi M.genericFiberIso.hom).1 (by simpa using congrArg Iso.hom h)

/-- The affine scheme defined by `2x = 0` is not flat over the integers. -/
theorem nonflat_twoX :
    ¬ Flat (Spec.map (CommRingCat.ofHom
      (algebraMap ℤ
        (Polynomial ℤ ⧸ Ideal.span {(2 : Polynomial ℤ) * Polynomial.X})))) := by
  sorry

/-- The affine line over the integers is flat, finitely presented and separated, and is not
proper; the generic-fibre marking alone does not imply properness. -/
theorem affineLine_flat_separated_notProper :
    let f := Spec.map (CommRingCat.ofHom (algebraMap ℤ (Polynomial ℤ)))
    Flat f ∧ LocallyOfFinitePresentation f ∧ QuasiCompact f ∧ QuasiSeparated f ∧
      IsSeparated f ∧ ¬ AlgebraicGeometry.IsProper f := by
  sorry

/-- A point of the generic fibre of a proper Dedekind model extends uniquely to a section,
with its generic restriction expressed using the specified identification. -/
theorem existsUnique_section (M : DedekindModel R K C toK) [M.IsProper]
    (x : Spec (.of K) ⟶ C) (hx : x ≫ toK = 𝟙 _) :
    ∃! σ : Spec (.of R) ⟶ M.total, σ ≫ M.toBase = 𝟙 _ ∧
      Spec.map (CommRingCat.ofHom (algebraMap R K)) ≫ σ =
        x ≫ M.genericFiberIso.inv.left ≫ TauCeti.genericFiberι R K M.toBase := by
  sorry

end DedekindModel

namespace TwoChart

open TauCeti.AlgebraicGeometry.Scheme.Modules

variable {X : Scheme.{u}} (M : X.Modules)

/-- The ordered two-open differential is restriction from the first open minus restriction
from the second open. Its definition does not need quasi-coherence or affineness. -/
abbrev twoChartDifferential (U V : X.Opens) :
    cohomologyOn M 0 U ⊞ cohomologyOn M 0 V ⟶ cohomologyOn M 0 (U ⊓ V) :=
  biprod.desc (cohomologyOnRes M 0 (inf_le_left : U ⊓ V ≤ U))
    (-cohomologyOnRes M 0 (inf_le_right : U ⊓ V ≤ V))

example (U V : X.Opens) :
    biprod.inl ≫ twoChartDifferential M U V =
      cohomologyOnRes M 0 (inf_le_left : U ⊓ V ≤ U) := by
  simp [twoChartDifferential]

example (U V : X.Opens) :
    biprod.inr ≫ twoChartDifferential M U V =
      -cohomologyOnRes M 0 (inf_le_right : U ⊓ V ≤ V) := by
  simp [twoChartDifferential]

/-- Global sections are the kernel of the ordered two-open differential. No affine
hypothesis is needed for this degree-zero statement. -/
theorem cohomologyZero {U V : X.Opens} (hcover : U ⊔ V = ⊤) :
    ∃ e : cohomologyOn M 0 ⊤ ≅ kernel (twoChartDifferential M U V),
      e.hom ≫ kernel.ι (twoChartDifferential M U V) =
        biprod.lift (cohomologyOnRes M 0 (le_top : U ≤ ⊤))
          (cohomologyOnRes M 0 (le_top : V ≤ ⊤)) := by
  sorry

/-- For a quasi-coherent module and two affine opens with affine intersection, first
cohomology on their union is the cokernel via the Mayer–Vietoris connecting map. -/
theorem cohomologyOne [M.IsQuasicoherent] {U V : X.Opens} (hU : IsAffineOpen U)
    (hV : IsAffineOpen V) (hUV : IsAffineOpen (U ⊓ V)) :
    ∃ e : cokernel (twoChartDifferential M U V) ≅ cohomologyOn M 1 (U ⊔ V),
      cokernel.π (twoChartDifferential M U V) ≫ e.hom =
        mayerVietorisδ M U V 0 1 rfl := by
  sorry

end TwoChart

/-! ## Layer 3: strict-local fraction-field Brauer vanishing -/

/-- The fraction field of a henselian DVR with algebraically closed residue field has trivial
Brauer group. This also applies to the valuation ring in a finite purely inseparable constant
extension, whose residue field remains algebraically closed. -/
theorem brauer_fractionField_henselianDVR_algClosedResidue
    (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [HenselianLocalRing R] [IsAlgClosed (IsLocalRing.ResidueField R)]
    [Field K] [Algebra R K] [IsFractionRing R K] :
    Subsingleton (BrauerGroup.{u, u} K) := by
  sorry

/-! ## Layer 4: reduction and torsion -/

open scoped MonObj

section Reduction

variable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]

/-- Reduction of integral points is restriction along the residue-field morphism, as a group
homomorphism on the native point groups of a group scheme over `Spec R`. -/
def reductionHom (G : Over (Spec (.of R))) [GrpObj G] :
    (Over.mk (𝟙 (Spec (.of R))) ⟶ G) →*
      (Over.mk (Spec.map (CommRingCat.ofHom (IsLocalRing.residue R))) ⟶ G) :=
  let i : Over.mk (Spec.map (CommRingCat.ofHom (IsLocalRing.residue R))) ⟶
      Over.mk (𝟙 (Spec (.of R))) :=
    Over.homMk (Spec.map (CommRingCat.ofHom (IsLocalRing.residue R))) (by simp)
  ((yonedaGrpObj G).map i.op).hom

example (H : Type u) [Group H] [Finite H] (g : H) (hg : g ≠ 1) :
    let b : Over.mk (𝟙 (Spec (.of R))) ⟶ (Spec (.of R)).asOver (Spec (.of R)) :=
      Over.homMk (𝟙 _) (by
        dsimp [Scheme.asOver, OverClass.asOver]
        simp [specOverSpec_over])
    reductionHom (TauCeti.ConstantGroup.groupScheme R H).X
      (b ≫ TauCeti.ConstantGroup.groupSchemePointMulEquiv R H R
        (TauCeti.ConstantGroup.toPoints R H g)) ≠ 1 := by
  classical
  let b : Over.mk (𝟙 (Spec (.of R))) ⟶ (Spec (.of R)).asOver (Spec (.of R)) :=
    Over.homMk (𝟙 _) (by
        dsimp [Scheme.asOver, OverClass.asOver]
        simp [specOverSpec_over])
  let e := TauCeti.ConstantGroup.groupSchemePointMulEquiv R H R
  change reductionHom (TauCeti.ConstantGroup.groupScheme R H).X
    (b ≫ e (TauCeti.ConstantGroup.toPoints R H g)) ≠ 1
  have hone : reductionHom (TauCeti.ConstantGroup.groupScheme R H).X
      (b ≫ e (TauCeti.ConstantGroup.toPoints R H 1)) = 1 := by
    simp [e]
  intro h
  have hh := congrArg Over.Hom.left (h.trans hone.symm)
  change Spec.map (CommRingCat.ofHom (IsLocalRing.residue R)) ≫
      (e (TauCeti.ConstantGroup.toPoints R H g)).left =
    Spec.map (CommRingCat.ofHom (IsLocalRing.residue R)) ≫
      (e (TauCeti.ConstantGroup.toPoints R H 1)).left at hh
  simp only [e, TauCeti.ConstantGroup.groupSchemePointMulEquiv_apply_left,
    TauCeti.ConstantGroup.toPoints_apply, ← Category.assoc] at hh
  have hh' := (cancel_mono
    (eqToHom (TauCeti.ConstantGroup.groupScheme_X_left R H).symm)).1 hh
  rw [← Spec.map_comp, ← Spec.map_comp] at hh'
  have halg := Spec.map_injective hh'
  let a := (TauCeti.ConstantGroup.functionAlgEquiv R H).symm (Pi.single g 1)
  have hv := congrArg (fun f => f a) halg
  change IsLocalRing.residue R (TauCeti.ConstantGroup.functionAlgEquiv R H a g) =
    IsLocalRing.residue R (TauCeti.ConstantGroup.functionAlgEquiv R H a 1) at hv
  have hvalues : (1 : IsLocalRing.ResidueField R) = 0 := by
    simpa only [a, AlgEquiv.apply_symm_apply, Pi.single_eq_same,
      Pi.single_eq_of_ne (Ne.symm hg), map_one, map_zero] using hv
  exact one_ne_zero hvalues

example (x : (Spec (.of R)).asOver (Spec (.of R)) ⟶
    (TauCeti.DiagonalizableGroup.multiplicativeGroupScheme R).X) :
    let b : Over.mk (𝟙 (Spec (.of R))) ⟶ (Spec (.of R)).asOver (Spec (.of R)) :=
      Over.homMk (𝟙 _) (by
        dsimp [Scheme.asOver, OverClass.asOver]
        simp [specOverSpec_over])
    TauCeti.DiagonalizableGroup.multiplicativeGroupSchemePointsMulEquiv
        (R := R) (A := IsLocalRing.ResidueField R)
        (reductionHom (TauCeti.DiagonalizableGroup.multiplicativeGroupScheme R).X (b ≫ x)) =
      Units.map (IsLocalRing.residue R).toMonoidHom
        (TauCeti.DiagonalizableGroup.multiplicativeGroupSchemePointsMulEquiv
          (R := R) (A := R) x) := by
  let b : Over.mk (𝟙 (Spec (.of R))) ⟶ (Spec (.of R)).asOver (Spec (.of R)) :=
    Over.homMk (𝟙 _) (by
        dsimp [Scheme.asOver, OverClass.asOver]
        simp [specOverSpec_over])
  let φ := IsScalarTower.toAlgHom R R (IsLocalRing.ResidueField R)
  have hred : reductionHom (TauCeti.DiagonalizableGroup.multiplicativeGroupScheme R).X
        (b ≫ x) =
      (Spec.map (CommRingCat.ofHom φ.toRingHom)).asOver (Spec (.of R)) ≫ x := by
    apply Over.OverMorphism.ext
    change Spec.map (CommRingCat.ofHom (IsLocalRing.residue R)) ≫ (𝟙 _ ≫ x.left) =
      Spec.map (CommRingCat.ofHom φ.toRingHom) ≫ x.left
    erw [Category.id_comp]
    rfl
  change TauCeti.DiagonalizableGroup.multiplicativeGroupSchemePointsMulEquiv
      (R := R) (A := IsLocalRing.ResidueField R)
      (reductionHom (TauCeti.DiagonalizableGroup.multiplicativeGroupScheme R).X (b ≫ x)) = _
  rw [hred]
  exact TauCeti.DiagonalizableGroup.multiplicativeGroupSchemePointsMulEquiv_mapValue φ x

/-- A finite-order point in the reduction kernel of a separated finite-type commutative group
scheme has order a power of the residue characteristic exponent, including exponent 1 in
residue characteristic zero. -/
theorem torsionReductionKernel_pPrimary (G : Over (Spec (.of R))) [GrpObj G]
    [IsCommMonObj G] [IsSeparated G.hom] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    (p : ℕ) [ExpChar (IsLocalRing.ResidueField R) p]
    (x : Over.mk (𝟙 (Spec (.of R))) ⟶ G) (hx : IsOfFinOrder x)
    (hred : reductionHom G x = 1) :
    ∃ m : ℕ, orderOf x = p ^ m := by
  sorry

/-- Reduction is injective on torsion for a separated finite-type commutative group scheme
when the residue field has characteristic zero. -/
theorem torsionReduction_injective_of_residueCharZero (G : Over (Spec (.of R))) [GrpObj G]
    [IsCommMonObj G] [IsSeparated G.hom] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    [CharZero (IsLocalRing.ResidueField R)] :
    Set.InjOn (reductionHom G) {x | IsOfFinOrder x} := by
  sorry

/-- In mixed characteristic, reduction is injective on torsion of a separated finite-type
commutative group scheme when the normalized valuation of `p` is strictly less than `p − 1`. -/
theorem torsionReduction_injective_of_smallRamification (G : Over (Spec (.of R)))
    [GrpObj G] [IsCommMonObj G] [IsSeparated G.hom] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    [CharZero R] (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField R) p]
    (e : ℕ) (he : IsDiscreteValuationRing.addVal R (p : R) = (e : ℕ∞))
    (hsmall : e < p - 1) :
    Set.InjOn (reductionHom G) {x | IsOfFinOrder x} := by
  sorry

/-- In residue characteristic two the nonidentity unit `−1` of a characteristic-zero DVR
has exact order two and reduces to the identity. -/
theorem dyadic_negOne_reduction [CharZero R] [CharP (IsLocalRing.ResidueField R) 2] :
    (-1 : Rˣ) ≠ 1 ∧ orderOf (-1 : Rˣ) = 2 ∧
      Units.map (IsLocalRing.residue R).toMonoidHom (-1 : Rˣ) = 1 := by
  sorry

end Reduction

-- Further targets in README.md: isProper_iff_localize, normalizedProjectiveLine,
-- normalizedProjectiveLine_isModel, cohomologyOne_overlapQuotient,
-- globalFunctions_constants, FibreMultiplicityData, geometricMultiplicityGcd_realizable,
-- TotalDegreePiece, picardIdentity_iff_geometricPartialDegreesZero, curveNeronSeveri_finite,
-- Rigidificator, the rigidified Picard sheaf and its function/unit spaces,
-- rigidifiedPicard_algebraicSpace, picard_cohomologicallyFlat_algebraicSpace,
-- universalRigidifiedBundle, finiteRankHilbert_algebraicSpace, DivDegree, relativeSymmetricPower,
-- divDegree_symmetricPowerIso, symmetricQuotient_universal, symmetricPower_baseChange, abelMap_r,
-- groupSpaceQuotient, smoothSeparatedGroupSpace_isScheme, jacobian_sectionRigidified,
-- jacobian_universalBundleComparison, jacobianPoints_actualPicard, goodReductionSpecialization,
-- GenericUnitClosure, SeparatedDegreeZeroQuotient, degreeZeroQuotient_representable,
-- raynaud_normalPicard, strictLocal_genericPicardClass_representable, raynaud_regularNeron,
-- HasRationalSingularities,
-- picardNeronIdentity_iff_rational, globalPicardNeronComparison, formalKernel, identityPreimage,
-- globalTorsionReduction, ComponentLattice, the Greenberg ring spaces and functors,
-- neronComponent_multidegreeIso, specialization_componentFormula, exists_regularProperModel
-- and pointedCurve_integralSpecialization.

end TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

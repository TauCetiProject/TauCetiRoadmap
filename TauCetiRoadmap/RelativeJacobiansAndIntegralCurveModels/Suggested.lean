import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris

/-!
# Relative Jacobians and integral models of curves: representative target signatures

These are suggested forms, not an exhaustive checklist; `README.md` is the roadmap. It records
signatures whose carriers are available at the pinned libraries: a Dedekind-domain model, extension of its generic points,
and the kernel and cokernel descriptions of the two-open cohomology sequence. Cohomology here
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

example {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    (ofModel M).toBase = M.toBase := rfl

example {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    (ofModel M).genericFiberIso = M.genericFiberIso ∧
      ((ofModel M).IsProper ↔ M.IsProper) := ⟨rfl, Iff.rfl⟩

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

-- Further targets in README.md: isProper_iff_localize, normalizedProjectiveLine,
-- normalizedProjectiveLine_isModel, cohomologyOne_overlapQuotient,
-- globalFunctions_constants, FibreMultiplicityData, geometricMultiplicityGcd_realizable,
-- TotalDegreePiece, Rigidificator, the rigidified Picard sheaf and its function/unit spaces,
-- rigidifiedPicard_algebraicSpace, picard_cohomologicallyFlat_algebraicSpace,
-- universalRigidifiedBundle, finiteRankHilbert_algebraicSpace, DivDegree, abelMap_r,
-- groupSpaceQuotient, smoothSeparatedGroupSpace_isScheme, jacobian_sectionRigidified,
-- jacobian_universalBundleComparison, jacobianPoints_actualPicard, goodReductionSpecialization,
-- GenericUnitClosure, SeparatedDegreeZeroQuotient, degreeZeroQuotient_representable,
-- raynaud_normalPicard, raynaud_regularNeron, HasRationalSingularities,
-- picardNeronIdentity_iff_rational, globalPicardNeronComparison, reductionHom, formalKernel,
-- identityPreimage, torsionReductionKernel_pPrimary, torsionReduction_injective_of_smallRamification,
-- globalTorsionReduction, ComponentLattice, the Greenberg ring spaces and functors,
-- neronComponent_multidegreeIso, specialization_componentFormula, exists_regularProperModel
-- and pointedCurve_integralSpecialization.

end TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

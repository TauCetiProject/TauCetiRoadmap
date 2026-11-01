import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris

/-!
# Relative Jacobians and integral models of curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned APIs.

The statements express extension of generic points to proper Dedekind models and smoothness
along sections of regular models (§0.2), the integral-closure description of global functions
(§0.4), the canonical two-affine cokernel description of first cohomology (§0.5),
fraction-field Brauer vanishing over a henselian DVR with algebraically closed residue
field (§3.2a), and the prime-to-residue-characteristic and small-ramification torsion theorems
for arbitrary separated finite-type commutative group schemes (§4.2). Normality and regularity
are stated on the scheme's actual local rings. Reduction uses the native point groups.

The normalized projective-line model and its integral-closure chart computations (§§0.3–0.4
and 0.6) need a marked
projective-line/function-field construction, including its chart identifications; relative
normalization, Proj and sheaf cohomology alone do not supply this interface. The arbitrary-fibre
Picard representability, symmetric-power and Abel-fibre theorems (Layer 1), the relative-Jacobian
and actual-class comparisons (Layer 2), and the separated Picard quotient, Raynaud comparison
and rational-singularity criterion (Layer 3) need relative Picard sheaves, their identity
components, algebraic spaces, and Jacobian and Néron group schemes, absent at the pins.
The geometric component and vertical-correction formulas (§4.4) need those same objects and
their geometric intersection data; an abstract numerical Picard lattice does not replace them.
The global regular-model existence theorem (§5.1) also needs excellence, for which there is no
pinned predicate. The global torsion and assembled specialization theorems (§§4.3 and 5.2)
need the missing Jacobian and Néron objects. These headline signatures are omitted until their
mathematical objects can be expressed, without substituting arbitrary predicates for them.
-/

open CategoryTheory Limits AlgebraicGeometry
open TauCeti.AlgebraicGeometry.Scheme.Modules

noncomputable section

namespace TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

universe u

/-! ## Layer 0: Dedekind models and two-chart cohomology -/

/-- A generic point of a proper scheme over a Dedekind base extends uniquely to a section.
The base may be a field; no affine-base restriction is imposed. -/
theorem properModel_sections {S X : Scheme.{u}} [IsIntegral S] [IsNoetherian S]
    (hnormal : ∀ s : S, IsIntegrallyClosed (S.presheaf.stalk s))
    (hdim : topologicalKrullDim S ≤ 1) (f : X ⟶ S) [IsProper f]
    (x : Spec S.functionField ⟶ X)
    (hx : x ≫ f = S.fromSpecStalk (genericPoint S)) :
    ∃! σ : S ⟶ X, σ ≫ f = 𝟙 S ∧ S.fromSpecStalk (genericPoint S) ≫ σ = x := by
  sorry

/-- Every section of a flat finitely presented morphism from a regular scheme to a Dedekind
base lies in the smooth locus, including over imperfect residue fields. -/
theorem specializePoint_mem_smooth {S X : Scheme.{u}} [IsIntegral S] [IsNoetherian S]
    (hnormal : ∀ s : S, IsIntegrallyClosed (S.presheaf.stalk s))
    (hdim : topologicalKrullDim S ≤ 1) (f : X ⟶ S) [Flat f]
    [LocallyOfFinitePresentation f]
    (hregular : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x))
    (σ : S ⟶ X) (hσ : σ ≫ f = 𝟙 S) :
    ∀ s : S, σ s ∈ f.smoothLocus := by
  sorry

/-- On a normal integral proper flat scheme over a Dedekind domain, global functions are
exactly the elements of its function field integral over the base. For the normalized model,
this is the integral closure of the base in the algebraic constant field. -/
theorem globalFunctions_constants (R : Type u) [CommRing R] [IsDedekindDomain R]
    {X : Scheme.{u}} [IsIntegral X] (f : X ⟶ Spec (.of R)) [IsProper f] [Flat f]
    (hnormal : ∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)) :
    let g := X.presheaf.germ ⊤ (genericPoint X) (by trivial)
    letI : Algebra R X.functionField :=
      ((Scheme.ΓSpecIso (.of R)).inv ≫ f.appTop ≫ g).hom.toAlgebra
    ∀ a : X.functionField, a ∈ g.hom.range ↔ IsIntegral R a := by
  sorry

/-- The ordered restriction difference from the two degree-zero cohomology groups to the
cohomology of their overlap; the second summand has a minus sign. -/
def twoChartDifferential {X : Scheme.{u}} (M : X.Modules) (U V : X.Opens) :
    cohomologyOn M 0 U ⊞ cohomologyOn M 0 V ⟶ cohomologyOn M 0 (U ⊓ V) :=
  biprod.desc (cohomologyOnRes M 0 (inf_le_left : U ⊓ V ≤ U))
    (-cohomologyOnRes M 0 (inf_le_right : U ⊓ V ≤ V))

/-- For quasi-coherent coefficients on two affine opens with affine intersection, first
cohomology of their union is the cokernel of the restriction difference. The equation with
the Mayer–Vietoris connecting map specifies the canonical isomorphism (Stacks, tag 01XD). -/
theorem twoChart_cohomologyOne {X : Scheme.{u}} (M : X.Modules) [M.IsQuasicoherent]
    (U V : X.Opens) (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    (hInter : IsAffineOpen (U ⊓ V)) :
    ∃ e : cokernel (twoChartDifferential M U V) ≅ cohomologyOn M 1 (U ⊔ V),
      cokernel.π (twoChartDifferential M U V) ≫ e.hom =
        mayerVietorisδ M U V 0 1 rfl := by
  sorry

/-! ## Layer 3: Separated Picard quotients and Néron comparison -/

/-- The fraction field of a henselian DVR with algebraically closed residue field has trivial
Brauer group. This also applies to the valuation ring in a finite purely inseparable constant
extension, whose residue field remains algebraically closed. -/
theorem brauer_fractionField_henselianDVR_algClosedResidue
    (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [HenselianLocalRing R] [IsAlgClosed (IsLocalRing.ResidueField R)]
    [Field K] [Algebra R K] [IsFractionRing R K] :
    Subsingleton (BrauerGroup.{u, u} K) := by
  sorry

/-! ## Layer 4: Reduction, torsion and normalized multidegrees -/

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

/-- In mixed characteristic, reduction is injective on torsion of a separated finite-type
commutative group scheme when the normalized valuation of `p` is strictly less than `p − 1`. -/
theorem torsionReduction_injective_of_smallRamification (G : Over (Spec (.of R)))
    [GrpObj G] [IsCommMonObj G] [IsSeparated G.hom] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    [CharZero R] (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField R) p]
    (e : ℕ) (he : IsDiscreteValuationRing.addVal R (p : R) = (e : ℕ∞))
    (hsmall : e < p - 1) :
    Set.InjOn (reductionHom G) {x | IsOfFinOrder x} := by
  sorry

end Reduction

end TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

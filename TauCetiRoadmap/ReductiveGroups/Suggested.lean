import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic
import Mathlib
import Mathlib.GroupTheory.GroupExtension.Basic

/-!
# Reductive algebraic groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The three synchronized models, prerequisite order, examples, and references
are in `README.md`.

The declarations below are two native signature examples only: the global-sections Hopf
instance and the group object on `Spec`. They do not prototype the anti-equivalence,
the `Γ(Spec A) ≃ A` and `Spec Γ(G) ≃ G` identifications, or the third model. Those complete
Layer 0 targets, including the Yoneda component convention, are specified in `README.md`.
Mathlib's `hopfSpec.fullyFaithful` and `essImage_hopfSpec` and Tau Ceti's point functors are
the interfaces to consume. The finite-dimensional induction example remains a specialization,
not the general coefficient-ring adapter.
-/

open CategoryTheory AlgebraicGeometry CommRingCat Scheme Opposite Spec

namespace TauCetiRoadmap.ReductiveGroups

universe u

variable (R : Type u) [CommRing R]

/-- Native global-section Hopf structure of an affine group scheme over Spec R. -/
noncomputable abbrev globalSectionsHopfAlgebra (G : Scheme.{u})
    [G.Over (Spec (CommRingCat.of R))]
    [GrpObj (G.asOver (Spec (CommRingCat.of R)))] [IsAffine G] :
    HopfAlgebra R Γ(G, ⊤) :=
  AlgebraicGeometry.instHopfAlgebraCarrierObjOppositeOpensCarrierCarrierCommRingCatPresheafOpOpensTopOfGrpObjOverSchemeSpecAsOverOfIsAffine
    (R := CommRingCat.of R)

/-- Native group object on Spec of a commutative Hopf algebra. -/
noncomputable abbrev specGroupObject (A : Type u) [CommRing A] [HopfAlgebra R A] :
    GrpObj ((Spec (CommRingCat.of A)).asOver (Spec (CommRingCat.of R))) := inferInstance

end TauCetiRoadmap.ReductiveGroups

universe u₁ v₁ w₁

namespace TauCetiRoadmap.ReductiveGroups.FiniteHC

variable {k : Type u₁} {G : Type v₁} {L : Type w₁}
variable [Field k] [Group G] [Group L]

/-- Finite-group induction of the inflated L-module along P ≤ G. -/
noncomputable def indFromProjectedLevi (P : Subgroup G) [P.FiniteIndex]
    (π : P →* L) (M : FDRep k L) : FDRep k G :=
  TauCeti.indFDRep (FDRep.of (M.ρ.comp π))

/-- Its dimension is the subgroup index times the dimension of the Levi module. -/
theorem finrank_indFromProjectedLevi (P : Subgroup G) [P.FiniteIndex]
    (π : P →* L) (M : FDRep k L) :
    Module.finrank k (indFromProjectedLevi P π M) = P.index * Module.finrank k M := by
  change Module.finrank k (TauCeti.indFDRep (FDRep.of (M.ρ.comp π))) = _
  exact TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))

end TauCetiRoadmap.ReductiveGroups.FiniteHC
/- Further nonexhaustive integral PBW and rational-distribution target forms are in
IntegralRationalTargets.lean, which imports this file and the native supplier modules. -/

/- Signed ADE root-cover, integral bracket and full-Cartan comparison target forms
are in SignedADETargets.lean, which imports IntegralRationalTargets.lean. -/

/- Fixed-Lie, signed-orbit, folded Serre and full-Y kernel target forms are in
FoldingADETargets.lean, which imports SignedADETargets.lean. This pointer adds no import. -/

/- Lie-algebra spectral quotients, finite Weyl arrangements and based monodromy
are prototyped in SpectralWeylTargets.lean. That companion imports this file;
this comment adds no reverse import or dependency on Layer11. -/

/-! ## Kernel-fixing lifts of an actual central extension

These generic definitions use native GroupExtension. The ADE existence/Lie action
is in CoverLiftTargets, importing the actual lower signed carrier without a cycle. -/
namespace TauCetiRoadmap.ReductiveGroups.CoverLifts

universe uC vC wC
variable {E : Type uC} {Q : Type vC} {A : Type wC} [Group E] [Group Q] [Group A]

def liftSubgroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    Subgroup (MulAut E × A) where
  carrier := {p | (∀ s, p.1 (S.inl s) = S.inl s) ∧
    ∀ e, S.rightHom (p.1 e) = ρ p.2 (S.rightHom e)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

abbrev LiftGroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) := liftSubgroup S ρ

def projection (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    LiftGroup S ρ →* A where
  toFun l := l.val.2
  map_one' := rfl
  map_mul' _ _ := rfl

def coverAutomorphism (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    LiftGroup S ρ →* MulAut E where
  toFun l := l.val.1
  map_one' := rfl
  map_mul' _ _ := rfl

def coverAction (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (l : LiftGroup S ρ) (e : E) : E := coverAutomorphism S ρ l e

theorem coverAction_projection (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (l : LiftGroup S ρ) (e : E) :
    S.rightHom (coverAction S ρ l e) = ρ (projection S ρ l) (S.rightHom e) := l.property.2 e

/-- Actual character twist; only the group laws use centrality. -/
def characterTwist (S : GroupExtension ℤˣ E Q)
    (hc : ∀ s e, S.inl s * e = e * S.inl s) (χ : Q →* ℤˣ) : MulAut E where
  toFun e := S.inl (χ (S.rightHom e)) * e
  invFun e := S.inl (χ (S.rightHom e))⁻¹ * e
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

def characterInclusion (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (hc : ∀ s e, S.inl s * e = e * S.inl s) : (Q →* ℤˣ) →* LiftGroup S ρ where
  toFun χ := ⟨(characterTwist S hc χ, 1), by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Honest whole family: neither extension, action nor centrality inputs are erased. -/
noncomputable def characterKernelEquiv : (S : GroupExtension ℤˣ E Q) →
    (ρ : A →* MulAut Q) → (hc : ∀ s e, S.inl s * e = e * S.inl s) →
    (Q →* ℤˣ) ≃* (projection S ρ).ker := by sorry

theorem characterKernelEquiv_value (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (hc : ∀ s e, S.inl s * e = e * S.inl s) (χ : Q →* ℤˣ) (e : E) :
    coverAction S ρ (characterKernelEquiv S ρ hc χ).val e =
      S.inl (χ (S.rightHom e)) * e := by sorry

def liftableExtension (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q)
    (hc : ∀ s e, S.inl s * e = e * S.inl s) :
    GroupExtension (Q →* ℤˣ) (LiftGroup S ρ) (projection S ρ).range where
  inl := characterInclusion S ρ hc
  rightHom := (projection S ρ).rangeRestrict
  inl_injective := by sorry
  range_inl_eq_ker_rightHom := by sorry
  rightHom_surjective := by sorry

end TauCetiRoadmap.ReductiveGroups.CoverLifts

/- The actual signed ADE instantiation, root-line and native Lie action are in
CoverLiftTargets.lean. This file stays below IntegralRational/SignedADETargets. -/

/- Generic algebraic actions, orbit boundaries, closed projective orbits and
complex-point comparisons are prototyped in OrbitGeometryTargets.lean.
That companion imports this file; no reverse import is introduced. -/

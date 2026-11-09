import Mathlib
import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. The three synchronized models,
prerequisite order, examples, and references are in `README.md`.

The declarations below are written against the pinned Mathlib and Tau Ceti APIs. The first two
are native signature examples for Layer 0: the global-sections Hopf instance and the group
object on `Spec`. They do not prototype the anti-equivalence, the `Γ(Spec A) ≃ A` and
`Spec Γ(G) ≃ G` identifications, or the third model; those Layer 0 targets, including the
Yoneda component convention, are specified in `README.md`. Mathlib's `hopfSpec.fullyFaithful`
and `essImage_hopfSpec` and Tau Ceti's point functors are the interfaces to consume. The
finite-dimensional induction example of Layer 7c is a specialization, not the general
coefficient-ring adapter.

The last block is the carrier of Layer 9A.1a-L: for a central extension `ℤˣ → E → Q` and an
action `ρ : A →* MulAut Q`, the subgroup of `MulAut E × A` of the pairs `(φ, a)` with `φ` fixing
the kernel `ℤˣ` pointwise and covering `ρ a`, with its projection to `A`. The identification of
the kernel of that projection with the character group `Hom(Q, ℤˣ)` is a README target.
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

/-! ## Layer 9A.1a-L: kernel-fixing lifts of a central extension -/

namespace TauCetiRoadmap.ReductiveGroups.CoverLifts

universe uC vC wC
variable {E : Type uC} {Q : Type vC} {A : Type wC} [Group E] [Group Q] [Group A]

/-- The kernel-fixing lifts of an action on the quotient of an extension `ℤˣ → E → Q`. For
`ρ : A →* MulAut Q`, this is the subgroup of `MulAut E × A` of the pairs `(φ, a)` with
`φ (ι s) = ι s` for every `s ∈ ℤˣ` and `π (φ e) = ρ a (π e)` for every `e ∈ E`, where `ι` and
`π` are the inclusion and projection of the extension. -/
def liftSubgroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    Subgroup (MulAut E × A) where
  carrier := {p | (∀ s, p.1 (S.inl s) = S.inl s) ∧
    ∀ e, S.rightHom (p.1 e) = ρ p.2 (S.rightHom e)}
  one_mem' := ⟨fun _ => rfl, fun e => by simp⟩
  mul_mem' := by
    rintro ⟨φ, a⟩ ⟨ψ, b⟩ ⟨hφ, hφπ⟩ ⟨hψ, hψπ⟩
    dsimp only at hφ hφπ hψ hψπ
    refine ⟨fun s => ?_, fun e => ?_⟩
    · change φ (ψ (S.inl s)) = S.inl s
      rw [hψ, hφ]
    · change S.rightHom (φ (ψ e)) = ρ (a * b) (S.rightHom e)
      rw [hφπ, hψπ, _root_.map_mul, MulAut.mul_apply]
  inv_mem' := by
    rintro ⟨φ, a⟩ ⟨hφ, hφπ⟩
    dsimp only at hφ hφπ
    refine ⟨fun s => ?_, fun e => ?_⟩
    · change φ.symm (S.inl s) = S.inl s
      conv_lhs => rw [← hφ s]
      exact φ.symm_apply_apply _
    · change S.rightHom (φ.symm e) = ρ a⁻¹ (S.rightHom e)
      have h := hφπ (φ.symm e)
      rw [MulEquiv.apply_symm_apply] at h
      rw [h, _root_.map_inv, MulAut.inv_apply, MulEquiv.symm_apply_apply]

/-- The group of kernel-fixing lifts, `liftSubgroup S ρ` with its subgroup group structure. -/
abbrev LiftGroup (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) := liftSubgroup S ρ

/-- The projection `(φ, a) ↦ a` from the kernel-fixing lifts to `A`. -/
def projection (S : GroupExtension ℤˣ E Q) (ρ : A →* MulAut Q) :
    LiftGroup S ρ →* A where
  toFun l := l.val.2
  map_one' := rfl
  map_mul' _ _ := rfl

end TauCetiRoadmap.ReductiveGroups.CoverLifts

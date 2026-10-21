import TauCetiRoadmap.ReductiveGroups.SignedADETargets

/-! Nonexhaustive target forms for RG9A.1a-L. The README is definitive.
Actual operations are defined; admitted laws/comparisons remain honest targets.
No compact normalizer or VOA theorem is assumed. -/

noncomputable section
namespace TauCetiRoadmap.ReductiveGroups.ADECoverLifts
open SignedADE
universe u
variable {I : Type u} [Fintype I] [DecidableEq I]

def isometryGroup (D : Datum I) : Subgroup (SignedADE.Lattice I ≃ₗ[ℤ] SignedADE.Lattice I) where
  carrier := {f | ∀ a b, pairing D (f a) (f b) = pairing D a b}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def isometryMulAction (D : Datum I) : isometryGroup D →*
    MulAut (Multiplicative (SignedADE.Lattice I)) where
  toFun f :=
    { toFun := fun a => Multiplicative.ofAdd (f.val a.toAdd)
      invFun := fun a => Multiplicative.ofAdd (f.val.symm a.toAdd)
      left_inv := by sorry
      right_inv := by sorry
      map_mul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

abbrev LiftGroup (o : LinearOrder I) (D : Datum I) :=
  CoverLifts.LiftGroup (extension o D) (isometryMulAction D)

theorem isometryGroup_finite (D : Datum I) : Finite (isometryGroup D) := by sorry

theorem liftGroup_finite (o : LinearOrder I) (D : Datum I) : Finite (LiftGroup o D) := by sorry

theorem projection_surjective (o : LinearOrder I) (D : Datum I) :
    Function.Surjective (CoverLifts.projection (extension o D) (isometryMulAction D)) := by sorry

def rootEquiv (o : LinearOrder I) (D : Datum I) (l : LiftGroup o D) : Root D ≃ Root D where
  toFun a := ⟨l.val.2.val a.val, by sorry⟩
  invFun a := ⟨l.val.2.val.symm a.val, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry

def sectionSign (o : LinearOrder I) (D : Datum I) (l : LiftGroup o D)
    (a : SignedADE.Lattice I) : ℤˣ :=
  (l.val.1 (sectionLift o D a)).sign

/-- The monomial basis map is literal; inverse uses the actual inverse lift. -/
def carrierEquiv (o : LinearOrder I) (D : Datum I) (l : LiftGroup o D) :
    Carrier D ≃ₗ[ℤ] Carrier D where
  toFun z := (l.val.2.val z.1,
    z.2.sum fun a n => Finsupp.single (rootEquiv o D l a) ((sectionSign o D l a.val : ℤ) * n))
  invFun z := (l.val.2.val.symm z.1,
    z.2.sum fun a n => Finsupp.single (rootEquiv o D l⁻¹ a)
      ((sectionSign o D l⁻¹ a.val : ℤ) * n))
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

def lieEquiv (o : LinearOrder I) (D : Datum I) (l : LiftGroup o D) :
    letI := SignedADE.lieRing o D
    letI := SignedADE.lieAlgebra o D
    Carrier D ≃ₗ⁅ℤ⁆ Carrier D := by
  letI := SignedADE.lieRing o D
  letI := SignedADE.lieAlgebra o D
  exact { carrierEquiv o D l with map_lie' := by sorry }

theorem carrierEquiv_rootVector (o : LinearOrder I) (D : Datum I)
    (l : LiftGroup o D) (a : Root D) :
    carrierEquiv o D l (rootVector D a) =
      (sectionSign o D l a.val : ℤ) • rootVector D (rootEquiv o D l a) := by sorry

theorem carrierEquiv_mul (o : LinearOrder I) (D : Datum I)
    (l m : LiftGroup o D) (z : Carrier D) :
    carrierEquiv o D (l*m) z = carrierEquiv o D l (carrierEquiv o D m z) := by sorry

theorem faithful_integral_action (o : LinearOrder I) (D : Datum I)
    (l : LiftGroup o D) (h : ∀ z : Carrier D, carrierEquiv o D l z = z) : l = 1 := by sorry

end TauCetiRoadmap.ReductiveGroups.ADECoverLifts

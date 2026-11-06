import TauCetiRoadmap.ReductiveGroups.Suggested
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.BaseChange
import TauCeti.Algebra.Coalgebra.Comodule.Convolution
import TauCeti.Algebra.Coalgebra.Comodule.Weight.Space
import Mathlib.LinearAlgebra.RootSystem.Base
import Mathlib.LinearAlgebra.RootSystem.Chain
import Mathlib.LinearAlgebra.TensorProduct.Basis

/-!
# Integral and rational reductive targets

Suggested target forms, not an exhaustive checklist. The README is definitive.
Unproved construction targets use `sorry` honestly. Native root data, Kostant
subrings, tensor base change and right
comodules are reused. The full cocharacter basis includes the central torus.

The realization witness below is the full-root/full-Y adapter in RG9A, not a new
semisimple root-system owner. The native `IsChevalleySystem` supplies normalized
root brackets on its nondegenerate-Killing semisimple input; transporting these
along the actual root datum and adjoining the full toral lattice is part of RG9A.
No nondegenerate Killing form is imposed on the whole reductive Lie algebra.
-/

noncomputable section
open scoped TensorProduct

namespace TauCetiRoadmap.ReductiveGroups.IntegralRational

section Integral

variable {m r : ℕ} {X Y L : Type*}
variable [AddCommGroup X] [AddCommGroup Y]
variable [LieRing L] [LieAlgebra ℚ L]
variable (P : RootPairing (Fin m) ℤ X Y) [P.IsCrystallographic]

/-- A concrete rational realization of the full integral reductive datum.
Every field is actual data or a specified equation, not an unspecified Prop.
Finite roots and toral bases are enumerated; arbitrary finite orders transport
by reindexing. Empty root sets and rank-zero cases are included. -/
structure ReductiveChevalleyFrame where
  reduced : P.IsReduced
  toralBasis : Module.Basis (Fin r) ℤ Y
  cartan : Y →ₗ[ℤ] L
  rootVector : Fin m → L
  ambientBasis : Module.Basis (Fin r ⊕ Fin m) ℚ L
  basis_toral (j : Fin r) : ambientBasis (Sum.inl j) = cartan (toralBasis j)
  basis_root (i : Fin m) : ambientBasis (Sum.inr i) = rootVector i
  toral_commute (y z : Y) : ⁅cartan y, cartan z⁆ = 0
  toral_root (y : Y) (i : Fin m) :
    ⁅cartan y, rootVector i⁆ = ((P.toLinearMap (P.root i) y : ℤ) : ℚ) • rootVector i
  opposite_root (i j : Fin m) (hij : P.root j = -P.root i) :
    ⁅rootVector i, rootVector j⁆ = cartan (P.coroot i)
  rootConstant : Fin m → Fin m → ℤ
  root_sum (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = (rootConstant i j : ℚ) • rootVector k
  root_constant_size (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    Int.natAbs (rootConstant i j) = P.chainBotCoeff i j + 1
  root_zero (i j : Fin m) (hne : P.root i + P.root j ≠ 0)
      (hnot : ∀ k : Fin m, P.root k ≠ P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = 0

variable {P}

/-- Native integral subring, using every root and the full Y basis. -/
def integralSubring (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    Subring (UniversalEnvelopingAlgebra ℚ L) :=
  TauCeti.UniversalEnvelopingAlgebra.kostantForm D.rootVector
    (fun j => D.cartan (D.toralBasis j))

abbrev IntegralForm (D : ReductiveChevalleyFrame (r := r) (L := L) P) :=
  ↥(integralSubring D)

/-- Actual native divided-power value and its native membership proof. -/
def rootDividedPower (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (i : Fin m) (a : ℕ) : IntegralForm D :=
  ⟨TauCeti.Associative.dividedPower a (UniversalEnvelopingAlgebra.ι ℚ (D.rootVector i)),
    TauCeti.UniversalEnvelopingAlgebra.dividedPower_mem_kostantForm _ _ i a⟩

attribute [local instance] TauCeti.moduleNNRat

/-- Full toral binomial, including central cocharacters. -/
def toralBinomial (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (j : Fin r) (a : ℕ) : IntegralForm D :=
  ⟨Ring.choose (UniversalEnvelopingAlgebra.ι ℚ (D.cartan (D.toralBasis j))) a,
    TauCeti.UniversalEnvelopingAlgebra.ringChoose_mem_kostantForm _ _ j a⟩

/-- Finite multi-exponents for negative roots, every toral direction, positive roots. -/
abbrev PBWExponent (base : P.Base) :=
  ({i : Fin m // ¬base.IsPos i} → ℕ) × (Fin r → ℕ) ×
    ({i : Fin m // base.IsPos i} → ℕ)

/-- The ordered product itself, not an arbitrary admitted label for a monomial. -/
def orderedIntegralMonomial (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    PBWExponent (r := r) base → IntegralForm D := by
  classical
  intro a
  let neg := ((Finset.univ : Finset {i : Fin m // ¬base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.1 i))
  let tor := ((Finset.univ : Finset (Fin r)).sort (· ≤ ·)).map
    (fun j => toralBinomial D j (a.2.1 j))
  let pos := ((Finset.univ : Finset {i : Fin m // base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.2.2 i))
  exact neg.prod * tor.prod * pos.prod

/-- The integral PBW theorem as an actual basis, with the whole realization as input. -/
def integralPBWBasis (base : P.Base) :
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) →
      Module.Basis (PBWExponent (r := r) base) ℤ (IntegralForm D) := by sorry

/-- The basis is the specified ordered product, not only a cardinality assertion. -/
theorem integralPBWBasis_apply (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (a : PBWExponent (r := r) base) :
    integralPBWBasis base D a = orderedIntegralMonomial base D a := by sorry

/-- Arbitrary commutative-ring specialization uses native tensor basis base change. -/
def specializedPBWBasis (A : Type*) [CommRing A] (base : P.Base) :
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) →
      Module.Basis (PBWExponent (r := r) base) A (A ⊗[ℤ] IntegralForm D) :=
  fun D => (integralPBWBasis base D).baseChange A

theorem specializedPBWBasis_apply (A : Type*) [CommRing A] (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (a : PBWExponent (r := r) base) :
    specializedPBWBasis A base D a = 1 ⊗ₜ[ℤ] orderedIntegralMonomial base D a := by sorry

/-- Actual structure coefficients in the actual integral basis. -/
def integralProductCoefficients (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    PBWExponent (r := r) base → PBWExponent (r := r) base →
      (PBWExponent (r := r) base →₀ ℤ) :=
  fun a b => (integralPBWBasis base D).repr
    (orderedIntegralMonomial base D a * orderedIntegralMonomial base D b)

/-- Recover the product as its finite integral linear combination. -/
theorem integralProductCoefficients_spec (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (a b : PBWExponent (r := r) base) :
    orderedIntegralMonomial base D a * orderedIntegralMonomial base D b =
      (integralProductCoefficients base D a b).sum
        (fun c z => z • orderedIntegralMonomial base D c) := by sorry

/-- The ambient basis proves that roots and full torus generate L. -/
theorem frame_lie_generates (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    LieSubalgebra.lieSpan ℚ L (Set.range D.rootVector ∪
      Set.range (fun j => D.cartan (D.toralBasis j))) = ⊤ := by sorry

/-- Consume the native rational comparison; do not recreate it by an admission. -/
def rationalFormComparison (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    ℚ ⊗[ℤ] IntegralForm D ≃ₐ[ℚ] UniversalEnvelopingAlgebra ℚ L :=
  TauCeti.UniversalEnvelopingAlgebra.kostantFormBaseChange D.rootVector
    (fun j => D.cartan (D.toralBasis j)) (frame_lie_generates D)

end Integral

section Distributions

variable (k C : Type*) [Field k] [CommRing C] [HopfAlgebra k C]

/-- Actual identity ideal of the coordinate Hopf algebra. -/
def identityIdeal : Ideal C := RingHom.ker (Bialgebra.counitAlgHom k C).toRingHom

/-- Finite-order identity-supported linear functionals, in the native convolution ring.
The proofs below are the definite augmentation-filtration closure targets. -/
def finiteOrderDistributions : Subalgebra k (WithConv (C →ₗ[k] k)) where
  carrier := {f | ∃ n : ℕ, ∀ x ∈ (identityIdeal k C)^(n+1), f.ofConv x = 0}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  algebraMap_mem' := by sorry

/-- A finite jet dual; no finite-dimensionality claim is imposed without smooth/finite-type hypotheses. -/
abbrev JetDual (n : ℕ) := Module.Dual k (C ⧸ (identityIdeal k C)^(n+1))

/-- Pull back a jet functional along the actual quotient map. -/
def jetDualToDistributions (n : ℕ) :
    JetDual k C n →ₗ[k] finiteOrderDistributions k C where
  toFun φ := ⟨WithConv.toConv
    (φ.comp (Ideal.Quotient.mkₐ k ((identityIdeal k C)^(n+1))).toLinearMap), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem jetDualToDistributions_apply (n : ℕ) (φ : JetDual k C n) (x : C) :
    (jetDualToDistributions k C n φ).val.ofConv x =
      φ (Ideal.Quotient.mkₐ k ((identityIdeal k C)^(n+1)) x) := rfl

theorem jetDualToDistributions_injective (n : ℕ) :
    Function.Injective (jetDualToDistributions k C n) := by sorry

theorem exists_jetDual_preimage (f : finiteOrderDistributions k C) :
    ∃ n : ℕ, ∃ φ : JetDual k C n, jetDualToDistributions k C n φ = f := by sorry

variable (M : Type*) [AddCommGroup M] [Module k M] [TauCeti.Comodule k C M]

/-- Restrict the already-native convolution action to the actual distribution carrier. -/
def rationalDistributionAction :
    finiteOrderDistributions k C →ₐ[k] Module.End k M :=
  (TauCeti.Comodule.convolutionAction (R := k) (C := C) (M := M)).comp
    (finiteOrderDistributions k C).val

/-- The action is coefficient contraction of the original right coaction. -/
theorem rationalDistributionAction_apply (f : finiteOrderDistributions k C) (m : M) :
    rationalDistributionAction k C M f m =
      LinearMap.tensorComponent (f.val.ofConv)
        (TauCeti.Comodule.coact (R := k) (C := C) (M := M) m) := by sorry

/-- A genuine rational character weight is acted on by evaluation at that character. -/
theorem rationalDistributionAction_on_weight (c : GroupLike k C) (m : M)
    (hm : m ∈ GroupLike.weightSpace (M := M) c)
    (f : finiteOrderDistributions k C) :
    rationalDistributionAction k C M f m = f.val.ofConv c.val • m := by sorry

end Distributions

end TauCetiRoadmap.ReductiveGroups.IntegralRational

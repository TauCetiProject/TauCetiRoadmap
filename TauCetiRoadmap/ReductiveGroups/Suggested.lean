import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.BaseChange
import TauCeti.Algebra.Coalgebra.Comodule.Convolution
import TauCeti.Algebra.Coalgebra.Comodule.Weight.Space
import TauCeti.Algebra.Lie.Presentation.Serre
import TauCeti.Algebra.Lie.Presentation.Serre.Automorphism
import TauCeti.LinearAlgebra.IntegralLattice.Rationalization
import TauCeti.LinearAlgebra.RootSystem.GeckConstruction.Symmetry
import TauCeti.LinearAlgebra.RootSystem.DiagramPermutations
import TauCeti.LinearAlgebra.RootSystem.BaseChange
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Presentation
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Tangent
import TauCeti.Algebra.AlgebraicGroup.Tangent.Lie
import TauCeti.Algebra.AlgebraicGroup.Tangent.CounitPoints
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.AlgebraicTopology.FundamentalGroup.BasepointChange
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

The first declarations below are two native signature examples only: the global-sections
Hopf instance and the group object on `Spec`. They do not prototype the anti-equivalence,
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
/- Further nonexhaustive integral PBW and rational-distribution target forms are in the
`IntegralRational` section below, which consumes the native supplier modules. -/

/- Signed ADE root-cover, integral bracket and full-Cartan comparison target forms
are in the `SignedADE` section below, which consumes the `IntegralRational` section. -/

/- Fixed-Lie, signed-orbit, folded Serre and full-Y kernel target forms are in the
`FoldingADE` section below, which consumes the `SignedADE` section. -/

/- Lie-algebra spectral quotients, finite Weyl arrangements and based monodromy
are prototyped in the `Spectral` section below; it adds no dependency on Layer11. -/

/-! ## Kernel-fixing lifts of an actual central extension

These generic definitions use native GroupExtension. The ADE existence/Lie action
is in the `ADECoverLifts` section below, on the actual lower signed carrier. -/
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

/- The actual signed ADE instantiation, root-line and native Lie action are in the
`ADECoverLifts` section below, above the `IntegralRational` and `SignedADE` sections. -/

/- Generic algebraic actions, orbit boundaries, closed projective orbits and
complex-point comparisons are prototyped in the `OrbitGeometry` section below. -/

/-! ## Target forms by layer

The sections below give nonexhaustive native target forms for the integral and rational
reductive layer, the signed ADE presentation, its cover lifts and folding, the Bruhat
coordinate conventions, generic orbit geometry and the spectral Weyl monodromy. Each section
keeps the namespace of its target family. -/

namespace TauCetiRoadmap.ReductiveGroups

noncomputable section
universe u v w

section IntegralRational

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

open scoped TensorProduct

namespace IntegralRational

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

end IntegralRational

end IntegralRational

section SignedADE

/-!
# Signed ADE presentation: native target forms for RG9A.1

This nonexhaustive prototype accompanies the definitive README. The matrix,
vertex order, actual group operations, root vectors and bracket are data.
Admitted laws and comparisons are construction targets, not implemented proofs.
The full cocharacter lattice is represented separately from the root lattice.
No VOA proof, integral Serre injectivity or group comparison is assumed here.
-/

open scoped TensorProduct

namespace SignedADE

variable {I : Type u} [Fintype I] [DecidableEq I]

abbrev Lattice (I : Type u) := I → ℤ

/-- Finite ADE Gram data; disconnected and empty diagrams are included.
These are specified matrix equations and native positive definiteness. -/
structure Datum (I : Type u) [Fintype I] where
  gram : Matrix I I ℤ
  symmetric : ∀ i j, gram i j = gram j i
  diagonal : ∀ i, gram i i = 2
  off_diagonal : ∀ i j, i ≠ j → gram i j = 0 ∨ gram i j = -1
  positive : (gram.map (Int.castRingHom ℚ)).PosDef

/-- The integral Gram pairing, with no half-norm polarization convention. -/
def pairing (D : Datum I) (a b : Lattice I) : ℤ :=
  ∑ i, ∑ j, a i * D.gram i j * b j

/-- The actual finite-sum pairing as a native bilinear form. -/
def latticeForm (D : Datum I) : LinearMap.BilinForm ℤ (Lattice I) where
  toFun a :=
    { toFun := pairing D a
      map_add' := by sorry
      map_smul' := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

theorem latticeForm_symmetric (D : Datum I) : (latticeForm D).IsSymm := by sorry

/-- Use the native rationalized embedded lattice, rather than a second lattice object. -/
def integralLattice (D : Datum I) : TauCeti.IntegralLattice (ℚ ⊗[ℤ] Lattice I) :=
  TauCeti.IntegralLattice.ofIntegralForm (latticeForm D) (latticeForm_symmetric D)

/-- Explicit ordered exponent: only strictly lower-triangular bonds contribute. -/
def exponent (o : LinearOrder I) (D : Datum I) (a b : Lattice I) : ℤ := by
  letI := o
  exact ∑ i, ∑ j, if j < i then (-D.gram i j) * a i * b j else 0

def epsilon (o : LinearOrder I) (D : Datum I) (a b : Lattice I) : ℤˣ :=
  (-1 : ℤˣ) ^ exponent o D a b

theorem epsilon_cocycle (o : LinearOrder I) (D : Datum I) (a b c : Lattice I) :
    epsilon o D a b * epsilon o D (a + b) c =
      epsilon o D b c * epsilon o D a (b + c) := by sorry

theorem epsilon_commutator (o : LinearOrder I) (D : Datum I) (a b : Lattice I) :
    epsilon o D a b * (epsilon o D b a)⁻¹ = (-1 : ℤˣ) ^ pairing D a b := by sorry

/-- The order and Gram data remain parameters of the cover carrier. -/
structure Cover (o : LinearOrder I) (D : Datum I) where
  lattice : Lattice I
  sign : ℤˣ

instance (o : LinearOrder I) (D : Datum I) : Mul (Cover o D) :=
  ⟨fun e f => ⟨e.lattice + f.lattice,
    e.sign * f.sign * epsilon o D e.lattice f.lattice⟩⟩
instance (o : LinearOrder I) (D : Datum I) : One (Cover o D) := ⟨⟨0, 1⟩⟩
instance (o : LinearOrder I) (D : Datum I) : Inv (Cover o D) :=
  ⟨fun e => ⟨-e.lattice, e.sign * epsilon o D e.lattice (-e.lattice)⟩⟩

/-- Operations are defined above; only their laws are admitted. -/
instance coverGroup (o : LinearOrder I) (D : Datum I) : Group (Cover o D) :=
  Group.ofLeftAxioms (by sorry) (by sorry) (by sorry)

def tau (o : LinearOrder I) (D : Datum I) : Cover o D := ⟨0, -1⟩
def sectionLift (o : LinearOrder I) (D : Datum I) (a : Lattice I) : Cover o D := ⟨a, 1⟩

def signInclusion (o : LinearOrder I) (D : Datum I) : ℤˣ →* Cover o D where
  toFun s := ⟨0, s⟩
  map_one' := by sorry
  map_mul' := by sorry

def projection (o : LinearOrder I) (D : Datum I) : Cover o D →* Multiplicative (Lattice I) where
  toFun e := Multiplicative.ofAdd e.lattice
  map_one' := by sorry
  map_mul' := by sorry

/-- Native exact sequence; centrality is a separate theorem. -/
def extension (o : LinearOrder I) (D : Datum I) :
    GroupExtension ℤˣ (Cover o D) (Multiplicative (Lattice I)) where
  inl := signInclusion o D
  rightHom := projection o D
  inl_injective := by sorry
  range_inl_eq_ker_rightHom := by sorry
  rightHom_surjective := by sorry

theorem signInclusion_central (o : LinearOrder I) (D : Datum I)
    (s : ℤˣ) (e : Cover o D) : signInclusion o D s * e = e * signInclusion o D s := by sorry

theorem sectionLift_inverse (o : LinearOrder I) (D : Datum I) (a : Lattice I) :
    (sectionLift o D a)⁻¹ =
      signInclusion o D (epsilon o D a (-a)) * sectionLift o D (-a) := by sorry

abbrev Root (D : Datum I) := {a : Lattice I // pairing D a a = 2}
theorem root_finite (D : Datum I) : Finite (Root D) := by sorry

def simpleReflection (D : Datum I) (i : I) (a : Lattice I) : Lattice I :=
  a - pairing D a (Pi.single i 1) • Pi.single i 1

/-- Norm2 is the actual finite Weyl-generated shell, not an unexplained root label. -/
theorem root_generated (D : Datum I) (a : Root D) :
    ∃ i : I, ∃ word : List I,
      word.foldr (simpleReflection D) (Pi.single i 1) = a.val := by sorry

abbrev LiftedRoot (o : LinearOrder I) (D : Datum I) :=
  {e : Cover o D // pairing D e.lattice e.lattice = 2}

/-- Multiplication by tau leaves the underlying root unchanged. -/
def tauRoot (o : LinearOrder I) (D : Datum I) (e : LiftedRoot o D) : LiftedRoot o D :=
  ⟨⟨e.val.lattice, -e.val.sign⟩, e.property⟩

def signRelations (o : LinearOrder I) (D : Datum I) :
    Submodule ℤ (LiftedRoot o D →₀ ℤ) :=
  Submodule.span ℤ (Set.range fun e : LiftedRoot o D =>
    Finsupp.single (tauRoot o D e) 1 + Finsupp.single e 1)

/-- Whole-family admitted comparison; no admitted fixed value per order/diagram. -/
def rootLineQuotientEquiv : (o : LinearOrder I) → (D : Datum I) →
    ((LiftedRoot o D →₀ ℤ) ⧸ signRelations o D) ≃ₗ[ℤ] (Root D →₀ ℤ) := by sorry

theorem rootLineQuotientEquiv_generator (o : LinearOrder I) (D : Datum I)
    (e : LiftedRoot o D) :
    rootLineQuotientEquiv o D (Submodule.Quotient.mk (Finsupp.single e 1)) =
      Finsupp.single ⟨e.val.lattice, e.property⟩ (e.val.sign : ℤ) := by sorry

abbrev Carrier (D : Datum I) := Lattice I × (Root D →₀ ℤ)
def cartan (D : Datum I) (a : Lattice I) : Carrier D := (a, 0)
def rootVector (D : Datum I) (a : Root D) : Carrier D := (0, Finsupp.single a 1)

/-- All root/root cases, including the section-dependent opposite coefficient. -/
def rootBracket (o : LinearOrder I) (D : Datum I) (a b : Root D) : Carrier D := by
  classical
  exact if h : pairing D (a.val + b.val) (a.val + b.val) = 2 then
    (0, Finsupp.single ⟨a.val + b.val, h⟩ (epsilon o D a.val b.val : ℤ))
  else if a.val + b.val = 0 then
    ((epsilon o D a.val b.val : ℤ) • a.val, 0)
  else 0

/-- Bilinear extension given by actual finite sums; no bracket data is admitted. -/
def bracket (o : LinearOrder I) (D : Datum I) (z w : Carrier D) : Carrier D :=
  (w.2.sum fun b n => (0, Finsupp.single b (n * pairing D z.1 b.val))) -
  (z.2.sum fun a n => (0, Finsupp.single a (n * pairing D w.1 a.val))) +
  (z.2.sum fun a m => w.2.sum fun b n => (m * n) • rootBracket o D a b)

/-- This native Lie structure uses exactly the preceding defined bracket. -/
@[instance_reducible]
def lieRing (o : LinearOrder I) (D : Datum I) : LieRing (Carrier D) :=
  { (inferInstance : AddCommGroup (Carrier D)) with
    bracket := bracket o D
    add_lie := by sorry
    lie_add := by sorry
    lie_self := by sorry
    leibniz_lie := by sorry }

@[instance_reducible]
def lieAlgebra (o : LinearOrder I) (D : Datum I) :
    letI := lieRing o D
    LieAlgebra ℤ (Carrier D) := by
  letI := lieRing o D
  exact { (inferInstance : Module ℤ (Carrier D)) with lie_smul := by sorry }

theorem bracket_jacobi (o : LinearOrder I) (D : Datum I) (x y z : Carrier D) :
    bracket o D x (bracket o D y z) + bracket o D y (bracket o D z x) +
      bracket o D z (bracket o D x y) = 0 := by sorry

theorem neg_root_norm (D : Datum I) (a : Root D) : pairing D (-a.val) (-a.val) = 2 := by sorry
def negRoot (D : Datum I) (a : Root D) : Root D := ⟨-a.val, neg_root_norm D a⟩

theorem bracket_opposite (o : LinearOrder I) (D : Datum I) (a : Root D) :
    bracket o D (rootVector D a) (rootVector D (negRoot D a)) =
      (epsilon o D a.val (-a.val) : ℤ) • cartan D a.val := by sorry

/-- Choose inverse lifts for negative roots, retaining simple positive pinning. -/
def normalizationSign (o : LinearOrder I) (D : Datum I) (a : Root D) : ℤˣ := by
  classical
  exact if ∀ i, 0 ≤ a.val i then 1 else epsilon o D (-a.val) a.val

def normalizedRootVector (o : LinearOrder I) (D : Datum I) (a : Root D) : Carrier D :=
  (normalizationSign o D a : ℤ) • rootVector D a

theorem normalized_opposite (o : LinearOrder I) (D : Datum I) (a : Root D) :
    bracket o D (normalizedRootVector o D a) (normalizedRootVector o D (negRoot D a)) =
      cartan D a.val := by sorry

/-- Integral basis, not merely a rational spanning family. -/
def integralBasis (D : Datum I) : Module.Basis (I ⊕ Root D) ℤ (Carrier D) :=
  (Pi.basisFun ℤ I).prod Finsupp.basisSingleOne

theorem integralBasis_cartan (D : Datum I) (i : I) :
    integralBasis D (Sum.inl i) = cartan D (Pi.single i 1) := by sorry

theorem integralBasis_root (D : Datum I) (a : Root D) :
    integralBasis D (Sum.inr a) = rootVector D a := by sorry

/-- Actual target of an integral unit diagonal change of basis. -/
def normalizationEquiv : (o : LinearOrder I) → (D : Datum I) → Carrier D ≃ₗ[ℤ] Carrier D := by sorry

theorem normalizationEquiv_apply (o : LinearOrder I) (D : Datum I) (z : Carrier D) :
    normalizationEquiv o D z =
      (z.1, z.2.sum fun a n => Finsupp.single a (n * (normalizationSign o D a : ℤ))) := by sorry

/-- Full Cartan data, including central cocharacters; not a split center assumption. -/
structure FullCartanData (D : Datum I) (Y : Type v) [AddCommGroup Y] where
  rootWeight : Lattice I →ₗ[ℤ] Y →ₗ[ℤ] ℤ
  coroot : Lattice I →ₗ[ℤ] Y
  compatibility : ∀ a b, rootWeight a (coroot b) = pairing D a b

abbrev FullCarrier (D : Datum I) (Y : Type v) := Y × (Root D →₀ ℤ)

/-- The full-Y bracket transports the actual coroot vector, not a chosen summand. -/
def fullBracket {Y : Type v} [AddCommGroup Y] (o : LinearOrder I) (D : Datum I)
    (C : FullCartanData D Y) (z w : FullCarrier D Y) : FullCarrier D Y :=
  (w.2.sum fun b n => (0, Finsupp.single b (n * C.rootWeight b.val z.1))) -
  (z.2.sum fun a n => (0, Finsupp.single a (n * C.rootWeight a.val w.1))) +
  (z.2.sum fun a m => w.2.sum fun b n =>
    (m * n) • (C.coroot (rootBracket o D a b).1, (rootBracket o D a b).2))

@[instance_reducible]
def fullLieRing {Y : Type v} [AddCommGroup Y] (o : LinearOrder I) (D : Datum I)
    (C : FullCartanData D Y) : LieRing (FullCarrier D Y) :=
  { (inferInstance : AddCommGroup (FullCarrier D Y)) with
    bracket := fullBracket o D C
    add_lie := by sorry
    lie_add := by sorry
    lie_self := by sorry
    leibniz_lie := by sorry }

section FrameComparison
open IntegralRational
variable {m r : ℕ} {X Y : Type v} {L : Type w}
variable [AddCommGroup X] [AddCommGroup Y] [LieRing L] [LieAlgebra ℚ L]
variable (P : RootPairing (Fin m) ℤ X Y) [P.IsCrystallographic]

/-- Defined comparison with any actual frame, with its full toral and root data. -/
def fullFrameMap (D : Datum I) (F : ReductiveChevalleyFrame (r := r) (L := L) P)
    (index : Root D ≃ Fin m) (signs : Root D → ℤˣ) : FullCarrier D Y →ₗ[ℤ] L where
  toFun z := F.cartan z.1 + z.2.sum fun a n => (n * (signs a : ℤ)) • F.rootVector (index a)
  map_add' := by sorry
  map_smul' := by sorry

/-- Existence of the integral signed comparison, rather than assuming its sign equations.
Its range is the actual integral lattice span; rational bijectivity is insufficient. -/
theorem exists_full_frame_comparison (o : LinearOrder I) (D : Datum I)
    (C : FullCartanData D Y) (F : ReductiveChevalleyFrame (r := r) (L := L) P)
    (index : Root D ≃ Fin m) (rootMap : Lattice I →ₗ[ℤ] X)
    (hroot : ∀ a : Root D, P.root (index a) = rootMap a.val)
    (hcoroot : ∀ a : Root D, P.coroot (index a) = C.coroot a.val)
    (hweight : ∀ a y, C.rootWeight a y = P.toLinearMap (rootMap a) y) :
    ∃ signs : Root D → ℤˣ,
      Function.Injective (fullFrameMap P D F index signs) ∧
      (fullFrameMap P D F index signs).range =
        Submodule.span ℤ (Set.range F.cartan ∪ Set.range F.rootVector) ∧
      ∀ z w, fullFrameMap P D F index signs (fullBracket o D C z w) =
        ⁅fullFrameMap P D F index signs z, fullFrameMap P D F index signs w⁆ := by sorry

end FrameComparison
end SignedADE

end SignedADE

section ADECoverLifts

/-! Nonexhaustive target forms for RG9A.1a-L. The README is definitive.
Actual operations are defined; admitted laws/comparisons remain honest targets.
No compact normalizer or VOA theorem is assumed. -/

namespace ADECoverLifts

open SignedADE
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

end ADECoverLifts

end ADECoverLifts

section FoldingADE

/-!
# Fixed Lie algebras and signed ADE folding: target forms for RG9A.1b

**This section is not the roadmap and is not exhaustive.** README.md is definitive.
These declarations suggest native interfaces. Defined finite sums and maps retain
the actual diagram, order and action. Admitted laws, spanning and comparisons
are construction targets, not implemented proofs. In particular the integral
fixed basis and a normalized rational folded frame are different objects.
-/

open scoped TensorProduct

namespace FoldingADE


section FixedLie
variable (R : Type u) (L : Type v) [CommRing R] [LieRing L] [LieAlgebra R L]

/-- Native fixed submodule with its single additional bracket-closure field. -/
def fixedLieSubalgebra (φ : L ≃ₗ⁅R⁆ L) : LieSubalgebra R L where
  toSubmodule := φ.toLinearMap.fixedSubmodule
  lie_mem' := by
    intro x y hx hy
    change φ ⁅x, y⁆ = ⁅x, y⁆
    change φ x = x at hx
    change φ y = y at hy
    rw [φ.map_lie, hx, hy]

@[simp] theorem mem_fixedLieSubalgebra (φ : L ≃ₗ⁅R⁆ L) (x : L) :
    x ∈ fixedLieSubalgebra R L φ ↔ φ x = x := Iff.rfl

theorem fixedLieSubalgebra_toSubmodule (φ : L ≃ₗ⁅R⁆ L) :
    (fixedLieSubalgebra R L φ).toSubmodule =
      LinearMap.ker (φ.toLinearMap - LinearMap.id) :=
  LinearMap.fixedSubmodule_eq_ker φ.toLinearMap

/-- Restrict an actual intertwining homomorphism, including native pinning comparisons. -/
def mapFixed {M : Type w} [LieRing M] [LieAlgebra R M]
    (φ : L ≃ₗ⁅R⁆ L) (ψ : M ≃ₗ⁅R⁆ M) (f : L →ₗ⁅R⁆ M)
    (hf : ∀ x, f (φ x) = ψ (f x)) :
    fixedLieSubalgebra R L φ →ₗ⁅R⁆ fixedLieSubalgebra R M ψ where
  toFun x := ⟨f x.val, by
    change ψ (f x.val) = f x.val
    rw [← hf]
    exact congrArg f x.property⟩
  map_add' := by intro x y; apply Subtype.ext; exact f.map_add x.val y.val
  map_smul' := by intro t x; apply Subtype.ext; exact f.toLinearMap.map_smul t x.val
  map_lie' := by intro x y; apply Subtype.ext; exact f.map_lie x.val y.val
end FixedLie

open SignedADE
variable {I : Type u} [Fintype I] [DecidableEq I]

/-- Forward permutation of simple-root coordinates. -/
def permQ (σ : Equiv.Perm I) : SignedADE.Lattice I ≃ₗ[ℤ] SignedADE.Lattice I :=
  LinearEquiv.funCongrLeft ℤ ℤ σ.symm

theorem pairing_perm (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a b : SignedADE.Lattice I) :
    pairing D (permQ σ a) (permQ σ b) = pairing D a b := by sorry

/-- Actual root-index equivalence, not an unsigned action on root vectors. -/
def rootAction (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Equiv.Perm (Root D) where
  toFun a := ⟨permQ σ a.val, by rw [pairing_perm D σ hσ]; exact a.property⟩
  invFun a := ⟨permQ σ.symm a.val, by
    rw [pairing_perm D σ.symm (TauCeti.submatrix_perm_symm hσ)]
    exact a.property⟩
  left_inv := by sorry
  right_inv := by sorry

/-- Exactly the bond edges whose order is reversed by σ contribute. -/
def reversalExponent (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (a : SignedADE.Lattice I) : ℤ := by
  letI := o
  exact ∑ i, ∑ j, if i < j ∧ σ j < σ i then (-D.gram i j) * a i * a j else 0

def actionSign (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (a : SignedADE.Lattice I) : ℤˣ := (-1 : ℤˣ) ^ reversalExponent o D σ a

theorem epsilon_action (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a b : SignedADE.Lattice I) :
    epsilon o D a b * actionSign o D σ (a+b) =
      actionSign o D σ a * actionSign o D σ b *
        epsilon o D (permQ σ a) (permQ σ b) := by sorry

def coverLift (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (e : Cover o D) : Cover o D :=
  ⟨permQ σ e.lattice, e.sign * actionSign o D σ e.lattice⟩

theorem coverLift_mul (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (e f : Cover o D) :
    coverLift o D σ (e*f) = coverLift o D σ e * coverLift o D σ f := by sorry

theorem coverLift_simple (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I) (i : I) :
    coverLift o D σ (sectionLift o D (Pi.single i 1)) =
      sectionLift o D (Pi.single (σ i) 1) := by sorry

theorem coverLift_comp (o : LinearOrder I) (D : Datum I) (σ τ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram)
    (hτ : D.gram.submatrix τ τ = D.gram) (e : Cover o D) :
    coverLift o D σ (coverLift o D τ e) = coverLift o D (σ * τ) e := by sorry

theorem coverLift_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (k : ℕ) (hk : σ^k = 1) :
    (coverLift o D σ)^[k] = id := by sorry

/-- Defined signed forward action on the actual integral carrier. -/
def signedLinearMap (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Carrier D →ₗ[ℤ] Carrier D where
  toFun z := (permQ σ z.1, z.2.sum fun a n =>
    Finsupp.single (rootAction D σ hσ a) (n * (actionSign o D σ a.val : ℤ)))
  map_add' := by sorry
  map_smul' := by sorry

def signedLinearEquiv (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Carrier D ≃ₗ[ℤ] Carrier D :=
  { signedLinearMap o D σ hσ with
    invFun := signedLinearMap o D σ.symm (TauCeti.submatrix_perm_symm hσ)
    left_inv := by sorry
    right_inv := by sorry }

theorem signedLinearMap_root (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) :
    signedLinearMap o D σ hσ (rootVector D a) =
      (actionSign o D σ a.val : ℤ) • rootVector D (rootAction D σ hσ a) := by sorry

theorem signedLinearMap_bracket (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (x y : Carrier D) :
    signedLinearMap o D σ hσ (bracket o D x y) =
      bracket o D (signedLinearMap o D σ hσ x) (signedLinearMap o D σ hσ y) := by sorry

def signedLieEquiv (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) :
    letI := lieRing o D
    letI := lieAlgebra o D
    Carrier D ≃ₗ⁅ℤ⁆ Carrier D := by
  letI := lieRing o D
  letI := lieAlgebra o D
  exact { signedLinearEquiv o D σ hσ with
    map_lie' := by intro x y; exact signedLinearMap_bracket o D σ hσ x y }

theorem signedLinearMap_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (k : ℕ) (hk : σ^k = 1) :
    (signedLinearMap o D σ hσ : Carrier D → Carrier D)^[k] = id := by sorry

abbrev VertexOrbit (σ : Equiv.Perm I) :=
  MulAction.orbitRel.Quotient (Subgroup.zpowers σ) I

def orbitVertices (σ : Equiv.Perm I) (O : VertexOrbit σ) : Finset I :=
  (Set.toFinite O.orbit).toFinset

abbrev RootOrbit (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) :=
  MulAction.orbitRel.Quotient (Subgroup.zpowers (rootAction D σ hσ)) (Root D)

def cycleCoefficient (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) (r : ℕ) : ℤˣ :=
  ∏ j ∈ Finset.range r, actionSign o D σ (((rootAction D σ hσ)^[j]) a).val

theorem cycleCoefficient_succ (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) (r : ℕ) :
    cycleCoefficient o D σ hσ a (r+1) = cycleCoefficient o D σ hσ a r *
      actionSign o D σ (((rootAction D σ hσ)^[r]) a).val := by sorry

def monodromy (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ) : ℤˣ :=
  cycleCoefficient o D σ hσ C.out (Nat.card C.orbit)

def orbitRootVector (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ) : Carrier D :=
  ∑ r ∈ Finset.range (Nat.card C.orbit),
    (cycleCoefficient o D σ hσ C.out r : ℤ) • rootVector D (((rootAction D σ hσ)^[r]) C.out)

/-- All data-bearing inputs are inside this admitted whole function family. -/
def fixedIntegralBasis : {I : Type u} → [Fintype I] → [DecidableEq I] →
    (o : LinearOrder I) → (D : Datum I) → (σ : Equiv.Perm I) →
    (hσ : D.gram.submatrix σ σ = D.gram) →
    Module.Basis (VertexOrbit σ ⊕ {C : RootOrbit D σ hσ // monodromy o D σ hσ C = 1}) ℤ
      (signedLinearMap o D σ hσ).fixedSubmodule := by sorry

theorem fixedIntegralBasis_cartan (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O : VertexOrbit σ) :
    (fixedIntegralBasis o D σ hσ (Sum.inl O) : Carrier D) =
      ∑ i ∈ orbitVertices σ O, cartan D (Pi.single i 1) := by sorry

theorem fixedIntegralBasis_root (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ)
    (hC : monodromy o D σ hσ C = 1) :
    (fixedIntegralBasis o D σ hσ (Sum.inr ⟨C,hC⟩) : Carrier D) =
      orbitRootVector o D σ hσ C := by sorry

/-- A generic signed permutation module, using its actual native fixed submodule. -/
def signedPermutation {J : Type v} [Fintype J] (A : Type w) [CommRing A]
    (ρ : Equiv.Perm J) (s : J → ℤˣ) : (J → A) →ₗ[A] (J → A) where
  toFun f j := ((s (ρ.symm j) : ℤ) : A) * f (ρ.symm j)
  map_add' := by intros; ext; simp [mul_add]
  map_smul' := by intros; ext; simp [mul_left_comm]

theorem signedPermutation_fixed_iff {J : Type v} [Fintype J]
    (A : Type w) [CommRing A] (ρ : Equiv.Perm J) (s : J → ℤˣ) (f : J → A) :
    f ∈ (signedPermutation A ρ s).fixedSubmodule ↔
      ∀ j, f (ρ j) = ((s j : ℤ) : A) * f j := by sorry

def cycleDefect {J : Type v} [Fintype J] (A : Type w) [CommRing A]
    (s : J → ℤˣ) : A := ((((∏ j, s j) : ℤˣ) : ℤ) : A) - 1

/-- For one actual orbit, evaluation at j₀ identifies fixed tuples with its monodromy kernel. -/
def signedCycleEquiv : {J : Type v} → [Fintype J] →
    (A : Type w) → [CommRing A] → (ρ : Equiv.Perm J) → (s : J → ℤˣ) →
    (j₀ : J) → (htrans : ∀ j, ∃ r : ℕ, (ρ^[r]) j₀ = j) →
    (signedPermutation A ρ s).fixedSubmodule ≃ₗ[A]
      LinearMap.ker (cycleDefect A s • (LinearMap.id : A →ₗ[A] A)) := by sorry

theorem signedCycleEquiv_eval {J : Type v} [Fintype J]
    (A : Type w) [CommRing A] (ρ : Equiv.Perm J) (s : J → ℤˣ)
    (j₀ : J) (htrans : ∀ j, ∃ r : ℕ, (ρ^[r]) j₀ = j)
    (f : (signedPermutation A ρ s).fixedSubmodule) :
    (signedCycleEquiv A ρ s j₀ htrans f : A) = f.val j₀ := by sorry

def orbitD (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : ℤ :=
  ∑ j ∈ orbitVertices σ O, D.gram j O.out

def orbitFactor (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : ℤ :=
  if orbitD D σ O = 2 then 1 else 2

def foldedCartan (D : Datum I) (σ : Equiv.Perm I) : Matrix (VertexOrbit σ) (VertexOrbit σ) ℤ :=
  fun O P => orbitFactor D σ O * ∑ i ∈ orbitVertices σ O, D.gram i P.out

theorem orbitD_eq_one_or_two (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O : VertexOrbit σ) :
    orbitD D σ O = 1 ∨ orbitD D σ O = 2 := by sorry

def simpleRoot (D : Datum I) (i : I) : Root D := ⟨Pi.single i 1, by sorry⟩

def foldedH (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  orbitFactor D σ O • ∑ i ∈ orbitVertices σ O, cartan D (Pi.single i 1)

def foldedE (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  ∑ i ∈ orbitVertices σ O, rootVector D (simpleRoot D i)

def foldedF (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  orbitFactor D σ O • ∑ i ∈ orbitVertices σ O, rootVector D (negRoot D (simpleRoot D i))

theorem folded_HE (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O P : VertexOrbit σ) :
    bracket o D (foldedH D σ O) (foldedE D σ P) =
      foldedCartan D σ O P • foldedE D σ P := by sorry

section Rational
variable [o : LinearOrder I] (D : Datum I)
local instance : LieRing (Carrier D) := lieRing o D
local instance : LieAlgebra ℤ (Carrier D) := lieAlgebra o D

def rationalLieEquiv (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    (ℚ ⊗[ℤ] Carrier D) ≃ₗ⁅ℚ⁆ (ℚ ⊗[ℤ] Carrier D) :=
  { (signedLinearEquiv o D σ hσ).baseChange ℤ ℚ (Carrier D) (Carrier D) with
    map_lie' := by sorry }

abbrev FixedQ (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :=
  ↥(fixedLieSubalgebra ℚ (ℚ ⊗[ℤ] Carrier D) (rationalLieEquiv (o := o) D σ hσ))

def fixedH (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedH D σ O, by sorry⟩
def fixedE (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedE D σ O, by sorry⟩
def fixedF (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedF D σ O, by sorry⟩

local instance (σ : Equiv.Perm I) : DecidableEq (VertexOrbit σ) := Classical.decEq _

theorem foldedSystem (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    TauCeti.IsSerreSystem ℚ (foldedCartan D σ)
      (fixedH (o := o) D σ hσ) (fixedE (o := o) D σ hσ) (fixedF (o := o) D σ hσ) := by sorry

/-- Actual native universal map from the established generator system. -/
def foldedMap (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Matrix.ToLieAlgebra ℚ (foldedCartan D σ) →ₗ⁅ℚ⁆ FixedQ (o := o) D σ hσ :=
  TauCeti.serreLift (foldedSystem (o := o) D σ hσ)

theorem foldedMap_E (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreE ℚ (foldedCartan D σ) O) = fixedE (o := o) D σ hσ O :=
  TauCeti.serreLift_serreE (foldedSystem (o := o) D σ hσ) O

theorem foldedMap_H (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreH ℚ (foldedCartan D σ) O) = fixedH (o := o) D σ hσ O :=
  TauCeti.serreLift_serreH (foldedSystem (o := o) D σ hσ) O

theorem foldedMap_F (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreF ℚ (foldedCartan D σ) O) = fixedF (o := o) D σ hσ O :=
  TauCeti.serreLift_serreF (foldedSystem (o := o) D σ hσ) O

/-- Uniform matrix and exceptional exact-word certificates are required by this target. -/
theorem foldedMap_surjective (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Function.Surjective (foldedMap (o := o) D σ hσ) := by sorry

/-- Uses constructed Cartan/Killing/triangular/simple components and LHW7, not surjectivity alone. -/
theorem foldedMap_injective (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Function.Injective (foldedMap (o := o) D σ hσ) := by sorry

def foldedEquiv (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Matrix.ToLieAlgebra ℚ (foldedCartan D σ) ≃ₗ⁅ℚ⁆ FixedQ (o := o) D σ hσ :=
  LieEquiv.ofBijective (foldedMap (o := o) D σ hσ)
    ⟨foldedMap_injective (o := o) D σ hσ, foldedMap_surjective (o := o) D σ hσ⟩
end Rational

section FullCartan
variable {Y : Type v} [AddCommGroup Y] [Module ℤ Y]

def fixedCartan (γY : Y ≃ₗ[ℤ] Y) : Submodule ℤ Y := γY.toLinearMap.fixedSubmodule

theorem fixedCartan_eq_kernel (γY : Y ≃ₗ[ℤ] Y) :
    fixedCartan γY = LinearMap.ker (γY.toLinearMap - LinearMap.id) :=
  LinearMap.fixedSubmodule_eq_ker γY.toLinearMap

/-- Defined full action; the bracket's pairing/coroot data occurs in the covariance theorem. -/
def fullAction (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y) :
    FullCarrier D Y →ₗ[ℤ] FullCarrier D Y where
  toFun z := (γY z.1, z.2.sum fun a n =>
    Finsupp.single (rootAction D σ hσ a) (n * (actionSign o D σ a.val : ℤ)))
  map_add' := by sorry
  map_smul' := by sorry

theorem fullAction_bracket (o : LinearOrder I) (D : Datum I) (C : FullCartanData D Y)
    (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y)
    (hc : ∀ a, γY (C.coroot a) = C.coroot (permQ σ a))
    (hw : ∀ a y, C.rootWeight (permQ σ a) (γY y) = C.rootWeight a y)
    (x y : FullCarrier D Y) :
    fullAction o D σ hσ γY (fullBracket o D C x y) =
      fullBracket o D C (fullAction o D σ hσ γY x) (fullAction o D σ hσ γY y) := by sorry

theorem fullAction_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y)
    (k : ℕ) (hQ : σ^k = 1) (hY : (γY : Y → Y)^[k] = id) :
    (fullAction o D σ hσ γY : FullCarrier D Y → FullCarrier D Y)^[k] = id := by sorry
end FullCartan

/-- Singular maps included; the diagonal is not claimed canonically ordered. -/
theorem exists_map_diagonalization (n : ℕ) (S : Matrix (Fin n) (Fin n) ℤ) :
    ∃ (U V : Matrix.GeneralLinearGroup (Fin n) ℤ) (d : Fin n → ℤ),
      (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d := by sorry

/-- All zero diagonal positions remain present; no ordered invariant-factor claim is assumed. -/
def smithKernelEquiv : (A : Type v) → [CommRing A] → (n : ℕ) →
    (S : Matrix (Fin n) (Fin n) ℤ) →
    (U V : Matrix.GeneralLinearGroup (Fin n) ℤ) → (d : Fin n → ℤ) →
    (h : (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d) →
    LinearMap.ker (S.map (Int.castRingHom A)).mulVecLin ≃ₗ[A]
      ((i : Fin n) → LinearMap.ker ((d i : A) • (LinearMap.id : A →ₗ[A] A))) := by sorry

theorem smithKernelEquiv_reconstruct (A : Type v) [CommRing A] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) ℤ) (U V : Matrix.GeneralLinearGroup (Fin n) ℤ)
    (d : Fin n → ℤ) (h : (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d)
    (x : LinearMap.ker (S.map (Int.castRingHom A)).mulVecLin) :
    Matrix.mulVec ((V : Matrix (Fin n) (Fin n) ℤ).map (Int.castRingHom A))
      (fun i => (smithKernelEquiv A n S U V d h x i : A)) = x.val := by sorry

end FoldingADE

end FoldingADE

section BruhatCoordinates

/-! Representative native forms accompanying the definitive Layer7C programme.
The finite A2 formulas below test the order of actual factors. They do not
implement generic reductive root groups or the contraction/cover proof. -/

namespace BruhatCoordinates

/-- Positive type-A roots are actual ordered pairs. -/
def positivePair (n : ℕ) := {p : Fin n × Fin n // p.1 < p.2}

/-- The source's retained-positive convention, with LEFT Weyl action. -/
def retained {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) : Prop :=
  w.symm p.val.1 < w.symm p.val.2

def inverted {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) : Prop :=
  w.symm p.val.2 < w.symm p.val.1

theorem retained_or_inverted {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) :
    retained w p ∨ inverted w p := by
  have hne : w.symm p.val.1 ≠ w.symm p.val.2 := fun h =>
    (ne_of_lt p.property) (w.symm.injective h)
  exact lt_or_gt_of_ne hne

theorem not_both {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) :
    ¬ (retained w p ∧ inverted w p) := by
  exact fun h => (not_lt_of_gt h.1) h.2

def s1 : Equiv.Perm (Fin 3) := Equiv.swap 0 1
def longest : Equiv.Perm (Fin 3) := Equiv.swap 0 2
def alpha1 : positivePair 3 := ⟨(0,1), by decide⟩
def alpha2 : positivePair 3 := ⟨(1,2), by decide⟩

theorem wrong_left_complement_overlaps :
    retained s1 alpha2 ∧ retained (longest * s1) alpha2 := by
  unfold retained s1 longest alpha2
  decide

theorem correct_right_complement_contains_alpha1 :
    inverted s1 alpha1 ∧ retained (s1 * longest) alpha1 := by
  unfold inverted retained s1 longest alpha1
  decide

section Matrix
variable {K : Type*} [CommRing K]

/-- Upper-unitriangular coordinates: the third parameter is the matrix13 entry. -/
def upper3 (a b c : K) : Matrix (Fin 3) (Fin 3) K :=
  !![1,a,c; 0,1,b; 0,0,1]

theorem upper3_mul (a b c a' b' c' : K) :
    upper3 a b c * upper3 a' b' c' =
      upper3 (a+a') (b+b') (c+c'+a*b') := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [upper3, Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

def stabilizerS1 (b c : K) := upper3 0 b c
def complementS1 (a : K) := upper3 a 0 0

/-- A right-coset coordinate uses complement FIRST. -/
theorem complement_first (a b c : K) :
    complementS1 a * stabilizerS1 b (c-a*b) = upper3 a b c := by
  simp [complementS1, stabilizerS1, upper3_mul]

theorem stabilizer_first (a b c : K) :
    stabilizerS1 b c * complementS1 a = upper3 a b c := by
  simp [complementS1, stabilizerS1, upper3_mul]

def recoverComplementFirst (a b c : K) : K × (K × K) := (a,b,c-a*b)
def assembleComplementFirst (a : K) (h : K × K) : K × (K × K) :=
  (a,h.1,h.2+a*h.1)

theorem recover_assemble (a : K) (h : K × K) :
    recoverComplementFirst (assembleComplementFirst a h).1
      (assembleComplementFirst a h).2.1 (assembleComplementFirst a h).2.2 = (a,h) := by
  rcases h with ⟨b,c⟩
  simp [recoverComplementFirst, assembleComplementFirst]

theorem assemble_recover (a b c : K) :
    assembleComplementFirst (recoverComplementFirst a b c).1
      (recoverComplementFirst a b c).2 = (a,b,c) := by
  simp [recoverComplementFirst, assembleComplementFirst]

/-- The other A2 stabilizer U_alpha2 is not normal in the whole Uplus. -/
theorem nonnormal_conjugation :
    upper3 (1:K) 0 0 * upper3 0 1 0 * upper3 (-1) 0 0 = upper3 0 1 1 := by
  simp [upper3_mul]

end Matrix

section Covering
variable {E X : Type*} [TopologicalSpace E] [TopologicalSpace X]
variable [PreconnectedSpace E] [SimplyConnectedSpace X] [LocallyPathConnectedSpace X]

/-- The exact connected-cover step: the TOTAL space need not be assumed simply connected.
The chosen e0 ensures a nonempty total space and fixes the actual inverse lift. -/
noncomputable def coveringHomeomorph (p : E → X) (hp : IsCoveringMap p) (e0 : E) : E ≃ₜ X := by
  classical
  let ex := hp.existsUnique_continuousMap_lifts (ContinuousMap.id X) (p e0) e0 rfl
  let s := Classical.choose ex
  have hs := (Classical.choose_spec ex).1
  have hs_right : ∀ x, p (s x) = x := fun x => congrFun hs.2 x
  have hs_left : s ∘ p = id := by
    exact hp.eq_of_comp_eq (s.continuous.comp hp.continuous) continuous_id
      (by funext e; exact hs_right (p e)) e0 hs.1
  exact
    { toEquiv :=
        { toFun := p
          invFun := s
          left_inv := fun e => congrFun hs_left e
          right_inv := hs_right }
      continuous_toFun := hp.continuous
      continuous_invFun := s.continuous }

theorem coveringHomeomorph_apply (p : E → X) (hp : IsCoveringMap p) (e0 e : E) :
    coveringHomeomorph p hp e0 e = p e := by
  rfl

end Covering

end BruhatCoordinates

end BruhatCoordinates

section OrbitGeometry

/-!
# Generic algebraic orbit geometry: illustrative targets

README Layer3A is definitive and not exhausted by this section. Native ModObj,
group objects, schemes, their points, immersions and Krull dimension are used
directly. No quotient-representability or reductive-classification premise is
used. Every sorry below is a proof target, not an implemented theorem.
The concrete point-topology formula below is the affine-chart presentation to
compare with ComplexComparisonPartII C−1.1, not a new analytification engine.
-/

open CategoryTheory MonoidalCategory CartesianMonoidalCategory AlgebraicGeometry
open scoped CategoryTheory.MonObj
open Topology

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace OrbitGeometry


section Cartesian
variable {C : Type u} [Category.{v} C] [CartesianMonoidalCategory C]

abbrev Points (X : C) := (𝟙_ C ⟶ X)

def constant (Y : C) {X : C} (x : Points X) : Y ⟶ X := toUnit Y ≫ x

variable (G X : C) [GrpObj G] [ModObj G X]

def orbitMorphism (x : Points X) : G ⟶ X :=
  lift (𝟙 G) (constant G x) ≫ γ[G, X]

def translation (g : Points G) : X ⟶ X :=
  lift (constant X g) (𝟙 X) ≫ γ[G, X]

theorem point_orbitMorphism (x : Points X) (g : Points G) :
    g ≫ orbitMorphism G X x = g • x := by sorry

theorem translation_inverse (g : Points G) :
    translation G X g ≫ translation G X g⁻¹ = 𝟙 X := by sorry

theorem translation_point (g : Points G) (x : Points X) :
    x ≫ translation G X g = g • x := by sorry
end Cartesian

section Algebraic
variable {k : Type u} [Field k]
variable (G X : Over (Spec (CommRingCat.of k))) [GrpObj G] [ModObj G X]

noncomputable def pointLocation (x : Points X) : X.left :=
  x.left (IsLocalRing.closedPoint k)

def geometricOrbit (x : Points X) : Set X.left :=
  Set.range fun z : G.left => (orbitMorphism G X x).left z

def orbitClosure (x : Points X) : Set X.left := closure (geometricOrbit G X x)

def orbitBoundary (x : Points X) : Set X.left :=
  orbitClosure G X x \ geometricOrbit G X x

noncomputable def orbitDimension (x : Points X) : WithBot ℕ∞ :=
  topologicalKrullDim (geometricOrbit G X x)


/-- New finite-type-to-orbit-map adapter; Chevalley itself is already native. -/
theorem orbitMorphism_finitePresentation
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    LocallyOfFinitePresentation (orbitMorphism G X x).left ∧
      QuasiCompact (orbitMorphism G X x).left := by sorry

/-- Exact point-image dictionary, using closed-point fibres over algebraically closed k. -/
theorem point_mem_geometricOrbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x y : Points X) :
    pointLocation X y ∈ geometricOrbit G X x ↔ ∃ g : Points G, g • x = y := by sorry

theorem orbit_open_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsOpen ((Subtype.val : orbitClosure G X x → X.left) ⁻¹'
      geometricOrbit G X x) := by sorry

theorem orbit_locallyClosed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsLocallyClosed (geometricOrbit G X x) := by sorry

/-- Actual reduced scheme model; no arbitrary carrier or quotient data assumed. -/
theorem exists_reduced_orbit_model
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ (O : Over (Spec (CommRingCat.of k))) (i : O ⟶ X),
      AlgebraicGeometry.IsReduced O.left ∧ IsImmersion i.left ∧
      Set.range i.left = geometricOrbit G X x := by sorry

theorem orbit_dimension_finite
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ d : ℕ, orbitDimension G X x = (d : WithBot ℕ∞) := by sorry

/-- Full finite-component case: no ConnectedSpace G or irreducible-closure premise. -/
theorem boundary_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    topologicalKrullDim (orbitBoundary G X x) < orbitDimension G X x := by sorry

theorem boundary_orbit_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x y : Points X)
    (hy : pointLocation X y ∈ orbitBoundary G X x) :
    orbitDimension G X y < orbitDimension G X x := by sorry

theorem exists_closed_orbit_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) ∧
      geometricOrbit G X y ⊆ orbitClosure G X x := by sorry

theorem exists_closed_orbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (hx : Nonempty (Points X)) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) := by sorry

theorem minimal_dimension_orbit_closed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X)
    (hmin : ∀ y : Points X, orbitDimension G X x ≤ orbitDimension G X y) :
    IsClosed (geometricOrbit G X x) := by sorry

end Algebraic

section ComplexPoints

noncomputable def affinePointEval (Y : Over (Spec (CommRingCat.of ℂ))) (y : Points Y)
    (f : Γ(Y.left, ⊤)) : ℂ :=
  (Scheme.ΓSpecIso (CommRingCat.of ℂ)).hom.hom (y.left.appTop.hom f)

/-- Affine open chart images of inverse images of complex-open sets by regular functions. -/
def classicalPointSubbasis (X : Over (Spec (CommRingCat.of ℂ))) : Set (Set (Points X)) :=
  {U | ∃ (Y : Over (Spec (CommRingCat.of ℂ))) (j : Y ⟶ X), IsOpenImmersion j.left ∧ IsAffine Y.left ∧
    ∃ (f : Γ(Y.left, ⊤)) (W : Set ℂ), IsOpen W ∧
      U = {x | ∃ y : Points Y, y ≫ j = x ∧ affinePointEval Y y f ∈ W}}

@[instance_reducible] def classicalPointTopology (X : Over (Spec (CommRingCat.of ℂ))) : TopologicalSpace (Points X) :=
  TopologicalSpace.generateFrom (classicalPointSubbasis X)

/-- The actual properness-to-compactness comparison cut of CC C−1.1. -/
theorem compact_complexPoints (X : Over (Spec (CommRingCat.of ℂ)))
    [IsProper X.hom] :
    @CompactSpace (Points X) (classicalPointTopology X) := by sorry

theorem hausdorff_complexPoints (X : Over (Spec (CommRingCat.of ℂ)))
    [LocallyOfFiniteType X.hom] [IsSeparated X.hom] :
    @T2Space (Points X) (classicalPointTopology X) := by sorry

/-- Proper ambient space plus a closed geometric orbit; no claim for an open projective orbit. -/
theorem compact_closed_orbit_points (G X : Over (Spec (CommRingCat.of ℂ))) [GrpObj G] [ModObj G X]
    [IsAffine G.left] [Smooth G.hom] [QuasiCompact G.hom]
    [IsProper X.hom]
    (x : Points X) (hclosed : IsClosed (geometricOrbit G X x)) :
    @IsCompact (Points X) (classicalPointTopology X)
      {y | pointLocation X y ∈ geometricOrbit G X x} := by sorry

end ComplexPoints
end OrbitGeometry

end OrbitGeometry

section Spectral

/-!
# Spectral quotients and finite Weyl monodromy: selected target forms

This section is not the roadmap and is not exhaustive. README.md Layer11 is definitive.
These are suggested interfaces, not implementations of the spectral or arrangement theorems.
In particular an admitted continuous map/equivalence below remains a construction target.
Every admitted data family keeps its mathematical inputs after the result-type colon.
The concrete Hopf points, tangent Lie algebra, torus subgroup, root pairings, Artin groups,
configurations and fundamental groups are the existing native carriers or explicit subtypes
and quotients of them. IG.5.1 supplies the generic configuration/disc comparison; the plane
interfaces below are its specified application and do not introduce a second braid engine.
-/

open scoped Topology BigOperators Matrix
open CategoryTheory

namespace Spectral


/-! ## Type A configurations and explicit centering -/

abbrev OrderedPlane (n : ℕ) := {z : Fin n → ℂ // Function.Injective z}

/-- Left permutation action, with inverse on the coordinate index. -/
def permute {n : ℕ} (σ : Equiv.Perm (Fin n)) (z : OrderedPlane n) : OrderedPlane n :=
  ⟨fun i => z.1 (σ⁻¹ i), z.property.comp σ.symm.injective⟩

instance planePermutationAction (n : ℕ) : MulAction (Equiv.Perm (Fin n)) (OrderedPlane n) where
  smul := permute
  one_smul z := Subtype.ext (by funext i; rfl)
  mul_smul σ τ z := Subtype.ext (by funext i; rfl)

abbrev UnorderedPlane (n : ℕ) :=
  Quotient (MulAction.orbitRel (Equiv.Perm (Fin n)) (OrderedPlane n))

def forgetOrder {n : ℕ} (z : OrderedPlane n) : UnorderedPlane n := Quotient.mk _ z

def planeBase (n : ℕ) : OrderedPlane n :=
  ⟨fun i => (i.val : ℂ), by
    intro i j h
    apply Fin.ext
    change (i.val : ℂ) = (j.val : ℂ) at h
    exact_mod_cast h⟩

def centroid {n : ℕ} (z : Fin n → ℂ) : ℂ := (n : ℂ)⁻¹ * ∑ i, z i

abbrev CenteredPlane (n : ℕ) := {z : OrderedPlane n // ∑ i, z.1 i = 0}

/-- Explicit translation and centering; the hypothesis excludes reciprocal zero. -/
noncomputable def centerHomeomorph : ∀ (n : ℕ), 0 < n →
    OrderedPlane n ≃ₜ ℂ × CenteredPlane n := sorry

theorem centerHomeomorph_fst (n : ℕ) (hn : 0 < n) (z : OrderedPlane n) :
    (centerHomeomorph n hn z).1 = centroid z.1 := sorry

theorem centerHomeomorph_snd (n : ℕ) (hn : 0 < n) (z : OrderedPlane n) (i : Fin n) :
    (centerHomeomorph n hn z).2.1.1 i = z.1 i - centroid z.1 := sorry

theorem centerHomeomorph_symm (n : ℕ) (hn : 0 < n) (c : ℂ)
    (z : CenteredPlane n) (i : Fin n) :
    ((centerHomeomorph n hn).symm (c,z)).1 i = z.1.1 i + c := sorry

/-- Plane/disc and actual basepoint transports followed by the IG.5.1 comparison. -/
noncomputable def planeBraidEquiv : ∀ n : ℕ,
    FundamentalGroup (UnorderedPlane n) (forgetOrder (planeBase n)) ≃*
      TauCeti.BraidGroup n := sorry

noncomputable def planePureEquiv : ∀ n : ℕ,
    FundamentalGroup (OrderedPlane n) (planeBase n) ≃*
      TauCeti.BraidGroup.pureSubgroup n := sorry

theorem continuous_forgetOrder (n : ℕ) :
    Continuous (forgetOrder : OrderedPlane n → UnorderedPlane n) := sorry

def orderedCover (n : ℕ) : C(OrderedPlane n, UnorderedPlane n) :=
  ⟨forgetOrder, continuous_forgetOrder n⟩

theorem orderedCover_pi1 (n : ℕ)
    (γ : FundamentalGroup (OrderedPlane n) (planeBase n)) :
    planeBraidEquiv n (FundamentalGroup.map (orderedCover n) (planeBase n) γ) =
      (planePureEquiv n γ : TauCeti.BraidGroup n) := sorry

/-- The covering permutation, with inverse-endpoint convention fixed in the README. -/
def planeMonodromy (n : ℕ) :
    FundamentalGroup (UnorderedPlane n) (forgetOrder (planeBase n)) →*
      Equiv.Perm (Fin n) :=
  (TauCeti.BraidGroup.permHom n).comp (planeBraidEquiv n).toMonoidHom

theorem planeMonodromy_endpoint (n : ℕ) (σ : Equiv.Perm (Fin n))
    (γ : Path (forgetOrder (planeBase n)) (forgetOrder (planeBase n)))
    (η : Path (planeBase n) (σ • planeBase n))
    (hη : ∀ t, forgetOrder (η t) = γ t) :
    planeMonodromy n (FundamentalGroup.fromPath ⟦γ⟧) = σ⁻¹ := sorry

theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := sorry

/-! ## Actual type-A spectral polynomial, without a private eigenvalue carrier -/

abbrev SimpleSpectrum (n : ℕ) :=
  {A : Matrix (Fin n) (Fin n) ℂ // A.charpoly.Separable}

/-- The unordered roots of the actual separable characteristic polynomial. -/
noncomputable def matrixSpectrum : ∀ n : ℕ, SimpleSpectrum n → UnorderedPlane n := sorry

theorem matrixSpectrum_charpoly (n : ℕ) (A : SimpleSpectrum n) (z : OrderedPlane n)
    (hz : matrixSpectrum n A = forgetOrder z) :
    A.1.charpoly = ∏ i, (Polynomial.X - Polynomial.C (z.1 i)) := sorry

theorem continuous_matrixSpectrum (n : ℕ) : Continuous (matrixSpectrum n) := sorry

/-! ## Actual complex reductive-group carriers -/

abbrev Coordinate := TauCeti.FiniteTypeCommHopfAlgCat.{0,0} ℂ
abbrev PointGroup (H : Coordinate) := WithConv (H →ₐ[ℂ] ℂ)
abbrev TangentLie (H : Coordinate) :=
  Derivation ℂ H (TauCeti.Bialgebra.CounitAlgebra ℂ H ℂ)

/-- Evaluation topology of the actual affine complex points. The finite-type analytic
comparison, rather than a new choice of topology, is a target of the lower FCO dictionary. -/
instance pointTopology (H : Coordinate) : TopologicalSpace (PointGroup H) :=
  TopologicalSpace.induced (fun g : PointGroup H => fun a : H => g.ofConv a) inferInstance

instance tangentTopology (H : Coordinate) : TopologicalSpace (TangentLie H) :=
  TopologicalSpace.induced
    (fun d : TangentLie H => fun a : H =>
      TauCeti.Bialgebra.CounitAlgebra.algEquivSelf ℂ H ℂ (d a)) inferInstance

/-- Reuse the native convolution adjoint representation, transported to ordinary complex points. -/
def adjoint (H : Coordinate) : Representation ℂ (PointGroup H) (TangentLie H) :=
  (Derivation.adRepresentation (R := ℂ) (A := H) ℂ).comp
    (TauCeti.Bialgebra.CounitAlgebra.pointsMulEquiv ℂ H ℂ).symm.toMonoidHom

instance adjointAction (H : Coordinate) : MulAction (PointGroup H) (TangentLie H) where
  smul g x := adjoint H g x
  one_smul x := by
    change (adjoint H 1) x = x
    rw [map_one]
    rfl
  mul_smul g h x := by
    change (adjoint H (g*h)) x = (adjoint H g) ((adjoint H h) x)
    rw [map_mul]
    rfl

abbrev TorusLie (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  TauCeti.HopfIdeal.lieSubalgebra (B := ℂ) I

abbrev TorusPoints (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of ℂ ℂ)

abbrev FlagCoset (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  PointGroup H ⧸ TorusPoints H I

/-- The regular Cartan criterion uses the actual torus Lie subalgebra and ambient bracket. -/
abbrev TorusRegular (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {t : TorusLie H I // ∀ x : TangentLie H,
    ⁅(t : TangentLie H), x⁆ = 0 ↔ x ∈ TorusLie H I}

/-- Actual adjoint translates. Equivalence with the usual regular-semisimple condition,
independence of the maximal torus and agreement of analytic topologies are Layer11C targets. -/
abbrev RegularSemisimple (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {x : TangentLie H // ∃ g : PointGroup H, ∃ t : TorusRegular H I,
    adjoint H g t.1.1 = x}

abbrev AdjointQuotient (H : Coordinate) :=
  Quotient (MulAction.orbitRel (PointGroup H) (TangentLie H))

abbrev SpectralBase (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {q : AdjointQuotient H // ∃ x : RegularSemisimple H I, Quotient.mk _ x.1 = q}

def spectralProjection (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (x : RegularSemisimple H I) : SpectralBase H I :=
  ⟨Quotient.mk _ x.1, x, rfl⟩

def torusInclusion (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (t : TorusRegular H I) : RegularSemisimple H I :=
  ⟨t.1.1, 1, t, by simp [adjoint]⟩

/-- This is the actual pullback of the specified spectral projection. -/
abbrev Cameral (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H) :=
  {p : RegularSemisimple H I × TorusRegular H I //
    spectralProjection H I p.1 = spectralProjection H I (torusInclusion H I p.2)}

theorem continuous_spectralProjection (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    Continuous (spectralProjection H I) := sorry

def spectralContinuousMap (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    C(RegularSemisimple H I, SpectralBase H I) :=
  ⟨spectralProjection H I, continuous_spectralProjection H I hG hT⟩

/-- Hard geometric family: the actual product-to-pullback homeomorphism. -/
noncomputable def cameralEquiv : ∀ (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H),
    TauCeti.reductiveCommHopfAlgProperty ℂ H →
    TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I →
    FlagCoset H I × TorusRegular H I ≃ₜ Cameral H I := sorry

theorem cameralEquiv_apply (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (g : PointGroup H) (t : TorusRegular H I) :
    ((cameralEquiv H I hG hT (QuotientGroup.mk g, t)).1.1 : TangentLie H) =
      adjoint H g t.1.1 := sorry

theorem cameralEquiv_second (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (p : FlagCoset H I × TorusRegular H I) :
    (cameralEquiv H I hG hT p).1.2 = p.2 := sorry

theorem simplyConnected_flagCoset (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I) :
    SimplyConnectedSpace (FlagCoset H I) := sorry

/-- Its underlying homomorphism is required below to be the actual induced map of χ. -/
noncomputable def spectralFundamentalEquiv : ∀ (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (x : RegularSemisimple H I),
    FundamentalGroup (RegularSemisimple H I) x ≃*
      FundamentalGroup (SpectralBase H I) (spectralProjection H I x) := sorry

theorem spectralFundamentalEquiv_toMonoidHom (H : Coordinate) (I : TauCeti.HopfIdeal ℂ H)
    (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus ℂ H.obj I)
    (x : RegularSemisimple H I) :
    (spectralFundamentalEquiv H I hG hT x).toMonoidHom =
      FundamentalGroup.map (spectralContinuousMap H I hG hT) x := sorry

/-! ## A genuine real root pairing, its native complex base change and finite arrangement -/

section Arrangement
variable {ι κ : Type} [Finite ι] [Fintype κ]

abbrev ComplexPairing (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  TauCeti.rootPairingBaseChange ℂ P hP

abbrev RegularArrangement (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  {z : κ → ℂ // ∀ i : ι, (ComplexPairing P hP).coroot' i z ≠ 0}

/-- Restriction of the actual Weyl action; preservation of the complement is part of
this target, and the value equation prevents an unrelated action from satisfying it. -/
noncomputable def arrangementAction :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y),
      MulAction (ComplexPairing P hP).weylGroup (RegularArrangement P hP) := sorry

instance arrangementMulAction (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :
    MulAction (ComplexPairing P hP).weylGroup (RegularArrangement P hP) :=
  arrangementAction P hP

theorem arrangement_smul_coe (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y)
    (w : (ComplexPairing P hP).weylGroup) (z : RegularArrangement P hP) :
    (w • z).1 = w • z.1 := sorry

abbrev ArrangementBase (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) :=
  Quotient (MulAction.orbitRel (ComplexPairing P hP).weylGroup (RegularArrangement P hP))

def arrangementProjection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y)
    (z : RegularArrangement P hP) : ArrangementBase P hP := Quotient.mk _ z

noncomputable def arrangementArtinEquiv :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ)) [P.IsCrystallographic] [P.IsReduced]
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
      (z : RegularArrangement P hP),
      FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) ≃*
        TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b) := sorry

/-- This is the existing native presentation map, not a private Weyl-group presentation. -/
def artinWeylProjection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] (b : P.Base) :
    TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b) →* P.weylGroup :=
  (TauCeti.weylCoxeterHom P b).comp
    (TauCeti.ArtinGroup.toCoxeterGroup (TauCeti.coxeterMatrixOfBase P b).toCoxeterSystem)

/-- Native complexification on standard coordinates still needs the explicit Weyl comparison. -/
noncomputable def baseChangeWeylEquiv :
    ∀ (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
      (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y),
      P.weylGroup ≃* (ComplexPairing P hP).weylGroup := sorry

theorem baseChangeWeylEquiv_reflection (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (i : ι) :
    baseChangeWeylEquiv P hP (RootPairing.weylGroup.ofIdx P i) =
      RootPairing.weylGroup.ofIdx (ComplexPairing P hP) i := sorry

def arrangementMonodromy (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) :
    FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) →*
      (ComplexPairing P hP).weylGroup :=
  (baseChangeWeylEquiv P hP).toMonoidHom.comp
    ((artinWeylProjection P b).comp (arrangementArtinEquiv P hP b z).toMonoidHom)

theorem arrangementMonodromy_endpoint
    (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ)) [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) (w : (ComplexPairing P hP).weylGroup)
    (γ : Path (arrangementProjection P hP z) (arrangementProjection P hP z))
    (η : Path z (w • z))
    (hη : ∀ t, arrangementProjection P hP (η t) = γ t) :
    arrangementMonodromy P hP b z (FundamentalGroup.fromPath ⟦γ⟧) = w⁻¹ := sorry

/-- Concrete root-index transport through the actual Weyl permutation representation. -/
def rootMonodromy (P : RootPairing ι ℝ (κ → ℝ) (κ → ℝ))
    [P.IsCrystallographic] [P.IsReduced]
    (hP : ∀ x y, P.toLinearMap x y = x ⬝ᵥ y) (b : P.Base)
    (z : RegularArrangement P hP) :
    FundamentalGroup (ArrangementBase P hP) (arrangementProjection P hP z) →* Equiv.Perm ι :=
  (ComplexPairing P hP).weylGroupToPerm.comp (arrangementMonodromy P hP b z)

end Arrangement
end Spectral

end Spectral

end

end TauCetiRoadmap.ReductiveGroups

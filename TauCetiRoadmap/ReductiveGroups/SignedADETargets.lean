import TauCetiRoadmap.ReductiveGroups.IntegralRationalTargets
import TauCeti.Algebra.Lie.Presentation.Serre
import TauCeti.LinearAlgebra.IntegralLattice.Rationalization
import Mathlib.GroupTheory.GroupExtension.Defs
import Mathlib.Algebra.Group.MinimalAxioms
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.Finsupp.VectorSpace
import Mathlib.LinearAlgebra.Basis.Prod
import Mathlib.LinearAlgebra.StdBasis

/-!
# Signed ADE presentation: native target forms for RG9A.1

This nonexhaustive prototype accompanies the definitive README. The matrix,
vertex order, actual group operations, root vectors and bracket are data.
Admitted laws and comparisons are construction targets, not implemented proofs.
The full cocharacter lattice is represented separately from the root lattice.
No VOA proof, integral Serre injectivity or group comparison is assumed here.
-/

noncomputable section
open scoped TensorProduct
namespace TauCetiRoadmap.ReductiveGroups.SignedADE

universe u v w
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
end TauCetiRoadmap.ReductiveGroups.SignedADE

import TauCetiRoadmap.McKaySkewGroup.Suggested
import Mathlib.RingTheory.IntegralDomain
import Mathlib.RepresentationTheory.FDRep
import Mathlib.CategoryTheory.Preadditive.Biproducts
import Mathlib.Analysis.Matrix.PosDef
import TauCeti.RepresentationTheory.CharacterTable.Degree
import TauCeti.RepresentationTheory.Quiver.PathAlgebra.Basic
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.PositiveSemidefinite

/-!
These are suggested interfaces, not an exhaustive checklist or proof implementations.
README.md is definitive. Existing native matrix groups, FDRep, simple classes, tensor powers,
path algebras and affine types are used directly. New hard constructions are honest targets.
Every admitted data family quantifies its meaningful arguments INSIDE the admitted type.
-/

namespace TauCetiRoadmap.McKaySkewGroup

open CategoryTheory
open scoped Matrix MatrixGroups MonoidalCategory Quaternion Classical ComplexOrder
universe u v w

/-! ## Native canonical simple models and named-coordinate transports -/

abbrev CanonicalIndex (G : Type v) [Group G] := Fin (Nat.card (ConjClasses G))

noncomputable abbrev canonicalSimple (G : Type v) [Group G] [Fintype G]
    (i : CanonicalIndex G) : FDRep ℂ G := FDRep.of (TauCeti.irreducibleRepresentation ℂ i)

instance canonicalSimple_simple (G : Type v) [Group G] [Fintype G] (i : CanonicalIndex G) :
    Simple (canonicalSimple G i) := by
  apply (FDRep.simple_iff_isIrreducible (canonicalSimple G i)).mpr
  change Representation.IsIrreducible (TauCeti.irreducibleRepresentation ℂ i)
  infer_instance

/-- Assembly of the native complete character-table family with the native simple-object skeleton.
No new irreducible quotient or independent completeness premise is introduced. -/
noncomputable def canonicalClassEquiv : ∀ (G : Type v) [Group G] [Fintype G],
    CanonicalIndex G ≃ TauCeti.SimpleFDRepClasses ℂ G := sorry

theorem canonicalClassEquiv_apply (G : Type v) [Group G] [Fintype G]
    (i : CanonicalIndex G) : canonicalClassEquiv G i =
      TauCeti.SimpleFDRepClasses.mk (canonicalSimple G i) := sorry

noncomputable def canonicalTrivialIndex : ∀ (G : Type v) [Group G] [Fintype G],
    CanonicalIndex G := sorry

theorem canonicalTrivialIndex_iso (G : Type v) [Group G] [Fintype G] :
    Nonempty (canonicalSimple G (canonicalTrivialIndex G) ≅ trivialFDRep ℂ G) := sorry

/-- Explicit finite coordinate models used by the old named families. -/
instance cyclicSU2_finite (n : ℕ) : Finite (cyclicSU2 n) := by sorry
noncomputable instance cyclicSU2_fintype (n : ℕ) : Fintype (cyclicSU2 n) := Fintype.ofFinite _

noncomputable def canonicalIrrepFamily (G : Type v) [Group G] [Fintype G] : IrrepFamily ℂ G where
  ι := ULift.{v} (CanonicalIndex G)
  rep := fun i => canonicalSimple G i.down
  simple := fun _ => inferInstance
  classEquiv := Equiv.ulift.trans (canonicalClassEquiv G)
  class_eq := fun i => (canonicalClassEquiv_apply G i.down).symm
  trivial := ULift.up (canonicalTrivialIndex G)
  trivial_is_one := canonicalTrivialIndex_iso G

/-- Named families are coordinate presentations of these same classes. -/
noncomputable def namedCanonicalIndex {G : Type v} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) : D.ι ≃ CanonicalIndex G :=
  D.classEquiv.trans (canonicalClassEquiv G).symm

theorem namedCanonicalIndex_iso {G : Type v} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) (i : D.ι) :
    Nonempty (D.rep i ≅ canonicalSimple G (namedCanonicalIndex D i)) := sorry

/-- Native FDRep finite products supply biproducts in its existing preadditive category. -/
local instance fdRepFiniteBiproducts (G : Type v) [Group G] :
    Limits.HasFiniteBiproducts (FDRep ℂ G) :=
  Limits.HasFiniteBiproducts.of_hasFiniteProducts

/-- The actual finite biproduct, with arbitrary-universe labels reindexed by their finite
coordinate equivalence. No arbitrary carrier or action is admitted. -/
noncomputable def finiteMultiplicityBiproduct {G : Type v} [Group G]
    {I : Type w} [Fintype I] (X : I → FDRep ℂ G) (m : I → ℕ) : FDRep ℂ G := by
  classical
  let e : I ≃ Fin (Fintype.card I) := Fintype.equivFin I
  exact Limits.biproduct (fun j : Fin (Fintype.card I) =>
    Limits.biproduct (fun _ : Fin (m (e.symm j)) => X (e.symm j)))

theorem named_tensor_decomposition {G : Type v} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) (U : FDRep ℂ G) (i : D.ι) :
    Nonempty (U ⊗ D.rep i ≅ finiteMultiplicityBiproduct D.rep
      (fun j => D.mckayMatrix U j i)) := sorry

theorem named_native_marks {G : Type v} [Group G]
    {D : IrrepFamily ℂ G} {U : FDRep ℂ G} {t : NamedAffineADE}
    (M : NamedMcKayIdentification D U t) (i : D.ι) :
    (D.dimension i : ℤ) = t.native.marks (t.nativeIndex (M.relabel i)) := M.marks_eq i

/-! ## Actual rotation cover and finite pole data -/

abbrev SO3 := Matrix.specialOrthogonalGroup (Fin 3) ℝ
abbrev SL2 := Matrix.SpecialLinearGroup (Fin 2) ℂ
abbrev RealVector3 := Fin 3 → ℝ

def rotate (g : SO3) (p : RealVector3) : RealVector3 :=
  (g : Matrix (Fin 3) (Fin 3) ℝ) *ᵥ p

def imaginaryQuaternion (p : RealVector3) : ℍ[ℝ] :=
  (Quaternion.equivTuple ℝ).symm ![0, p 0, p 1, p 2]

/-- The callable quaternion dictionary for LieGroups' double-cover construction target. -/
noncomputable def rotationCover : TauCeti.SU2 →* SO3 := sorry

theorem rotationCover_quaternion (q : UnitQuaternion) (p : RealVector3) :
    Quaternion.equivTuple ℝ (q.val * imaginaryQuaternion p * q⁻¹.val) =
      ![0, rotate (rotationCover (unitQuaternionEquivSU2 q)) p 0,
        rotate (rotationCover (unitQuaternionEquivSU2 q)) p 1,
        rotate (rotationCover (unitQuaternionEquivSU2 q)) p 2] := sorry

theorem rotationCover_surjective : Function.Surjective rotationCover := sorry

theorem rotationCover_kernel (g : TauCeti.SU2) :
    rotationCover g = 1 ↔ g = 1 ∨ g = unitQuaternionEquivSU2 minusOneUnitQuaternion := sorry

theorem su2_square_eq_one (g : TauCeti.SU2) (h : g ^ 2 = 1) :
    g = 1 ∨ g = unitQuaternionEquivSU2 minusOneUnitQuaternion := sorry

def poleSet (K : Subgroup SO3) : Set RealVector3 :=
  {p | (∑ i, p i ^ 2) = 1 ∧ ∃ g : K, g ≠ 1 ∧ rotate g.val p = p}

def poleOrbit (K : Subgroup SO3) (p : RealVector3) : Set RealVector3 :=
  {q | ∃ g : K, rotate g.val p = q}

def poleStabilizer (K : Subgroup SO3) (p : RealVector3) : Subgroup K where
  carrier := {g | rotate g.val p = p}
  one_mem' := by simp [rotate]
  mul_mem' := by
    intro g h hg hh
    change (g.val : Matrix (Fin 3) (Fin 3) ℝ) *ᵥ p = p at hg
    change (h.val : Matrix (Fin 3) (Fin 3) ℝ) *ᵥ p = p at hh
    change ((g.val : Matrix (Fin 3) (Fin 3) ℝ) *
      (h.val : Matrix (Fin 3) (Fin 3) ℝ)) *ᵥ p = p
    rw [← Matrix.mulVec_mulVec, hh, hg]
  inv_mem' := by
    intro g hg
    sorry

theorem nonidentity_rotation_poles (g : SO3) (h : g ≠ 1) :
    ∃ p : RealVector3, (∑ i, p i ^ 2) = 1 ∧
      ∀ q : RealVector3, ((∑ i, q i ^ 2) = 1 ∧ rotate g q = q) ↔ q = p ∨ q = -p := sorry

theorem poleSet_finite (K : Subgroup SO3) [Finite K] : (poleSet K).Finite := sorry

noncomputable def poleOrbits (K : Subgroup SO3) [Finite K] : Finset (Set RealVector3) := by
  classical
  exact (poleSet_finite K).toFinset.image (poleOrbit K)

noncomputable def poleOrbitRepresentative : ∀ (K : Subgroup SO3) [Finite K]
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}),
    {p : RealVector3 // p ∈ poleSet K ∧ poleOrbit K p = o.val} := sorry

noncomputable def poleStabilizerOrder (K : Subgroup SO3) [Finite K]
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}) : ℕ :=
  Nat.card (poleStabilizer K (poleOrbitRepresentative K o).val)

theorem poleOrbit_contains_self (K : Subgroup SO3) (p : RealVector3) : p ∈ poleOrbit K p := by
  refine ⟨1, ?_⟩
  simp [rotate]

theorem poleOrbit_eq_of_mem (K : Subgroup SO3) (p q : RealVector3)
    (h : q ∈ poleOrbit K p) : poleOrbit K q = poleOrbit K p := sorry

noncomputable def poleStabilizerConjugate : ∀ (K : Subgroup SO3) (g : K) (p : RealVector3),
    poleStabilizer K p ≃* poleStabilizer K (rotate g.val p) := sorry

theorem finiteCircle_cyclic (C : Subgroup Circle) [Finite C] : IsCyclic C := by
  apply isCyclic_of_injective_ringHom (Circle.coeHom.comp C.subtype)
  intro a b h
  apply Subtype.ext
  apply Subtype.ext
  exact h

noncomputable def poleStabilizerCircleEmbedding : ∀ (K : Subgroup SO3) (p : RealVector3),
    p ∈ poleSet K → {f : poleStabilizer K p →* Circle // Function.Injective f} := sorry

theorem poleStabilizer_cyclic (K : Subgroup SO3) [Finite K] (p : RealVector3)
    (hp : p ∈ poleSet K) : IsCyclic (poleStabilizer K p) := sorry

theorem poleStabilizerOrder_ge_two (K : Subgroup SO3) [Finite K]
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}) : 2 ≤ poleStabilizerOrder K o := sorry

/-- Actual double count, not an assumed spherical-orbifold classification. -/
theorem pole_double_count (K : Subgroup SO3) [Finite K] :
    ∑ o : {o : Set RealVector3 // o ∈ poleOrbits K},
      (1 - (poleStabilizerOrder K o : ℚ)⁻¹) = 2 - 2 / (Nat.card K : ℚ) := sorry

noncomputable def poleSignature (K : Subgroup SO3) [Finite K] : Multiset ℕ :=
  Multiset.ofList ((poleOrbits K).attach.toList.map (poleStabilizerOrder K))

theorem pole_signature_complete (K : Subgroup SO3) [Finite K] :
    (K = ⊥ ∧ poleSignature K = 0) ∨
    (2 ≤ Nat.card K ∧ poleSignature K = {Nat.card K, Nat.card K}) ∨
    (∃ n : ℕ, 2 ≤ n ∧ Nat.card K = 2 * n ∧ poleSignature K = {2, 2, n}) ∨
    (Nat.card K = 12 ∧ poleSignature K = {2, 3, 3}) ∨
    (Nat.card K = 24 ∧ poleSignature K = {2, 3, 4}) ∨
    (Nat.card K = 60 ∧ poleSignature K = {2, 3, 5}) := sorry

/-- Antipodes remain in the UNIQUE six-point order-four pole orbit; this precedes its frame. -/
theorem octahedral_pole_antipodes (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 4})
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}) (ho : poleStabilizerOrder K o = 4) :
    (∀ p ∈ o.val, -p ∈ o.val) ∧ o.val.ncard = 6 := sorry

/-- The equatorial four-cycle has zero latitude by its centroid; output is an actual SO3 frame. -/
theorem octahedral_pole_frame (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 4})
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}) (ho : poleStabilizerOrder K o = 4) :
    ∃ R : SO3, o.val = Set.range (fun ib : Fin 3 × Bool =>
      rotate R ((if ib.2 then (-1 : ℝ) else 1) • Pi.single ib.1 1)) := sorry

/-- The four order-three poles have regular-tetrahedron Gram matrix and centroid zero. -/
theorem tetrahedral_pole_frame (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 3})
    (o : {o : Set RealVector3 // o ∈ poleOrbits K}) (ho : poleStabilizerOrder K o = 3) :
    ∃ p : Fin 4 → RealVector3, Function.Injective p ∧ Set.range p = o.val ∧
      (∑ i, p i) = 0 ∧ ∀ i j, dotProduct (p i) (p j) = if i = j then 1 else -(1 / 3 : ℝ) := sorry

/-- Actual conjugacy-class counts used BEFORE A5 identification. -/
theorem icosahedral_class_sizes (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 5}) :
    ∃ e : Fin 5 ≃ ConjClasses K,
      ∀ i, Nat.card (ConjClasses.carrier (e i)) = ![1, 15, 20, 12, 12] i := sorry

noncomputable def icosahedralA5Equiv : ∀ (K : Subgroup SO3) [Finite K],
    poleSignature K = {2, 3, 5} → K ≃* alternatingGroup (Fin 5) := sorry

/-- The comparison is on the actual real rotation action, allowing the two order-five classes.
The intertwiner is orthogonal by polar normalization, with determinant adjusted to one. -/
theorem icosahedral_rotation_conjugacy (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 5}) :
    ∃ R : SO3, K.map (MulAut.conj R).toMonoidHom = binaryIcosahedralSU2.map rotationCover := sorry

noncomputable def so3ToGL : SO3 →* GL (Fin 3) ℝ :=
  (Units.map (Submonoid.subtype _)).comp toUnits.toMonoidHom

noncomputable def rotationRepresentation (K : Subgroup SO3) : Representation ℝ K RealVector3 :=
  (TauCeti.stdRep ℝ 3).comp (so3ToGL.comp K.subtype)

theorem icosahedral_rotation_trace_values (K : Subgroup SO3) [Fintype K]
    (hsig : poleSignature K = {2, 3, 5}) :
    Finset.univ.image (fun g : K => Matrix.trace (g.val : Matrix (Fin 3) (Fin 3) ℝ)) =
      {3, -1, 0, goldenRatio, 1 - goldenRatio} := sorry

/-- Native complex character recognition after real-to-complex matrix extension. -/
theorem complexRotationIntertwiner_of_trace {G : Type v} [Group G] [Fintype G]
    (ρ σ : G →* SO3) (htrace : ∀ g,
      Matrix.trace (ρ g : Matrix (Fin 3) (Fin 3) ℝ) =
        Matrix.trace (σ g : Matrix (Fin 3) (Fin 3) ℝ)) :
    ∃ T : Matrix (Fin 3) (Fin 3) ℂ, T.det ≠ 0 ∧ ∀ g,
      T * (ρ g : Matrix (Fin 3) (Fin 3) ℝ).map Complex.ofReal =
        (σ g : Matrix (Fin 3) (Fin 3) ℝ).map Complex.ofReal * T := sorry

/-- A nonzero real/imaginary part is invertible by real irreducibility; normalize by
(TᵀT)^(-1/2) and fix determinant sign. No spherical-conjugacy theorem is assumed. -/
theorem realPolarRotationIntertwiner {G : Type v} [Group G]
    (ρ σ : G →* SO3)
    (hρ : Representation.IsIrreducible
      ((TauCeti.stdRep ℝ 3).comp (so3ToGL.comp ρ)))
    (T : Matrix (Fin 3) (Fin 3) ℂ) (hdet : T.det ≠ 0)
    (hT : ∀ g, T * (ρ g : Matrix (Fin 3) (Fin 3) ℝ).map Complex.ofReal =
      (σ g : Matrix (Fin 3) (Fin 3) ℝ).map Complex.ofReal * T) :
    ∃ R : SO3, ∀ g, (R : Matrix (Fin 3) (Fin 3) ℝ) * (ρ g : Matrix (Fin 3) (Fin 3) ℝ) =
      (σ g : Matrix (Fin 3) (Fin 3) ℝ) * (R : Matrix (Fin 3) (Fin 3) ℝ) := sorry

/-! ## Full binary lifts, conjugacy and finite SL2 unitarization -/

/-- Classification labels only; all groups and representations remain the actual native ones. -/
inductive FiniteSU2Model
  | cyclic (n : ℕ) (positive : 1 ≤ n)
  | dihedral (n : ℕ) (atLeastTwo : 2 ≤ n)
  | tetrahedral | octahedral | icosahedral

noncomputable def FiniteSU2Model.subgroup : FiniteSU2Model → Subgroup TauCeti.SU2
  | .cyclic 1 _ => ⊥
  | .cyclic n _ => cyclicSU2 n
  | .dihedral n _ => binaryDihedralSU2 n
  | .tetrahedral => binaryTetrahedralSU2
  | .octahedral => binaryOctahedralSU2
  | .icosahedral => binaryIcosahedralSU2

inductive FiniteRotationModel
  | cyclic (n : ℕ) (positive : 1 ≤ n)
  | dihedral (n : ℕ) (atLeastTwo : 2 ≤ n)
  | tetrahedral | octahedral | icosahedral

noncomputable def FiniteRotationModel.subgroup : FiniteRotationModel → Subgroup SO3
  | .cyclic n _ => (cyclicSU2 (2 * n)).map rotationCover
  | .dihedral n _ => (binaryDihedralSU2 n).map rotationCover
  | .tetrahedral => binaryTetrahedralSU2.map rotationCover
  | .octahedral => binaryOctahedralSU2.map rotationCover
  | .icosahedral => binaryIcosahedralSU2.map rotationCover

theorem cyclic_pole_conjugacy (K : Subgroup SO3) [Finite K]
    (hn : 2 ≤ Nat.card K) (hsig : poleSignature K = {Nat.card K, Nat.card K}) :
    ∃ R : SO3, K.map (MulAut.conj R).toMonoidHom =
      (cyclicSU2 (2 * Nat.card K)).map rotationCover := sorry

theorem dihedral_pole_conjugacy (K : Subgroup SO3) [Finite K]
    (n : ℕ) (hn : 2 ≤ n) (hsig : poleSignature K = {2, 2, n}) :
    ∃ R : SO3, K.map (MulAut.conj R).toMonoidHom = (binaryDihedralSU2 n).map rotationCover := sorry

theorem tetrahedral_pole_conjugacy (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 3}) :
    ∃ R : SO3, K.map (MulAut.conj R).toMonoidHom = binaryTetrahedralSU2.map rotationCover := sorry

theorem octahedral_pole_conjugacy (K : Subgroup SO3) [Finite K]
    (hsig : poleSignature K = {2, 3, 4}) :
    ∃ R : SO3, K.map (MulAut.conj R).toMonoidHom = binaryOctahedralSU2.map rotationCover := sorry

noncomputable def finiteSO3Classification : ∀ (K : Subgroup SO3) [Finite K],
    {mc : FiniteRotationModel × SO3 //
      K.map (MulAut.conj mc.2).toMonoidHom = mc.1.subgroup} := sorry

theorem finiteRotationModel_unique (a b : FiniteRotationModel)
    (h : ∃ g : SO3, a.subgroup.map (MulAut.conj g).toMonoidHom = b.subgroup) : a = b := sorry

theorem cyclic_one_eq_bot : cyclicSU2 1 = ⊥ := sorry

theorem binary_full_preimage (H : Subgroup TauCeti.SU2)
    (hminus : unitQuaternionEquivSU2 minusOneUnitQuaternion ∈ H) :
    (H.map rotationCover).comap rotationCover = H := sorry

theorem odd_order_of_no_minus (H : Subgroup TauCeti.SU2) [Finite H]
    (hminus : unitQuaternionEquivSU2 minusOneUnitQuaternion ∉ H) : Odd (Nat.card H) := sorry

/-- Exhaustiveness is a subgroup equality under an ACTUAL SU2 conjugation. -/
noncomputable def finiteSU2Classification : ∀ (H : Subgroup TauCeti.SU2) [Finite H],
    {mc : FiniteSU2Model × TauCeti.SU2 //
      H.map (MulAut.conj mc.2).toMonoidHom = mc.1.subgroup} := sorry

theorem finiteSU2Model_unique (a b : FiniteSU2Model)
    (h : ∃ g : TauCeti.SU2, a.subgroup.map (MulAut.conj g).toMonoidHom = b.subgroup) : a = b := sorry

noncomputable def averagedHermitian (H : Subgroup SL2) [Fintype H] :
    Matrix (Fin 2) (Fin 2) ℂ :=
  (Nat.card H : ℂ)⁻¹ • ∑ h : H,
    star (h.val : Matrix (Fin 2) (Fin 2) ℂ) * (h.val : Matrix (Fin 2) (Fin 2) ℂ)

theorem averagedHermitian_posDef (H : Subgroup SL2) [Fintype H] :
    (averagedHermitian H).PosDef := sorry

theorem averagedHermitian_invariant (H : Subgroup SL2) [Fintype H] (h : H) :
    star (h.val : Matrix (Fin 2) (Fin 2) ℂ) * averagedHermitian H *
      (h.val : Matrix (Fin 2) (Fin 2) ℂ) = averagedHermitian H := sorry

noncomputable def finiteSL2Unitarizer : ∀ (H : Subgroup SL2) [Fintype H],
    {B : GL (Fin 2) ℂ // ∀ h : H,
      star ((B * h.val.toGL * B⁻¹ : GL (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ) *
        ((B * h.val.toGL * B⁻¹ : GL (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ) = 1} := sorry

theorem finiteSL2Classification (H : Subgroup SL2) [Finite H] :
    ∃ (a : FiniteSU2Model) (B : GL (Fin 2) ℂ),
      (H.map Matrix.SpecialLinearGroup.toGL).map (MulAut.conj B).toMonoidHom =
        a.subgroup.map TauCeti.SU2.toGL := sorry

theorem polar_conjugacy_improvement (H K : Subgroup TauCeti.SU2)
    (h : ∃ B : GL (Fin 2) ℂ,
      (H.map TauCeti.SU2.toGL).map (MulAut.conj B).toMonoidHom = K.map TauCeti.SU2.toGL) :
    ∃ g : TauCeti.SU2, H.map (MulAut.conj g).toMonoidHom = K := sorry

theorem binaryIcosahedral_perfect :
    _root_.commutator binaryIcosahedralSU2 =
      (⊤ : Subgroup binaryIcosahedralSU2) := sorry

theorem binaryIcosahedral_oneDimensional {W : Type*} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ binaryIcosahedralSU2 W)
    (hd : Module.finrank ℂ W = 1) : ∀ g, ρ g = LinearMap.id := sorry

/-! ## Generic natural-valued McKay matrix on native canonical irreducibles -/

section GenericMcKay
variable {G : Type v} [Group G] [Fintype G]

noncomputable def sourceFirstMcKay (U : FDRep ℂ G) :
    Matrix (CanonicalIndex G) (CanonicalIndex G) ℕ :=
  fun i j => Module.finrank ℂ (canonicalSimple G j ⟶ U ⊗ canonicalSimple G i)

noncomputable def canonicalDimensions (G : Type v) [Group G] [Fintype G] : CanonicalIndex G → ℕ :=
  fun i => Module.finrank ℂ (canonicalSimple G i)

theorem sourceFirstMcKay_transpose (D : IrrepFamily ℂ G) (U : FDRep ℂ G) (i j : D.ι) :
    D.mckayMatrix U j i = sourceFirstMcKay U (namedCanonicalIndex D i) (namedCanonicalIndex D j) := sorry

theorem sourceFirstMcKay_symmetric (U : FDRep ℂ G) (h : Nonempty (U ≅ dualFDRep U)) :
    ∀ i j, sourceFirstMcKay U i j = sourceFirstMcKay U j i := sorry

theorem sourceFirstMcKay_dimension (U : FDRep ℂ G) (hd : Module.finrank ℂ U = 2) :
    ∀ i, ∑ j, sourceFirstMcKay U i j * canonicalDimensions G j = 2 * canonicalDimensions G i := sorry

/-- Actual direct-sum target: no equality of characters is silently treated as an isomorphism. -/
theorem sourceFirstMcKay_tensor_decomposition (U : FDRep ℂ G) (i : CanonicalIndex G) :
    Nonempty (U ⊗ canonicalSimple G i ≅
      finiteMultiplicityBiproduct (canonicalSimple G) (fun j => sourceFirstMcKay U i j)) := sorry

theorem sourceFirstMcKay_power (U : FDRep ℂ G) (n : ℕ) (i j : CanonicalIndex G) :
    (sourceFirstMcKay U ^ n) i j =
      Module.finrank ℂ (canonicalSimple G j ⟶
        (RepresentationTheory.CharacterTheory.FaithfulTensor.tensorPowerFDRep U n) ⊗
          canonicalSimple G i) := sorry

/-- This is the existing CT theorem applied to the actual native simple, not a second proof. -/
theorem canonicalSimple_occurs (U : FDRep ℂ G) (hU : Function.Injective U.ρ)
    (j : CanonicalIndex G) : ∃ n : ℕ,
      n < RepresentationTheory.CharacterTheory.FaithfulTensor.characterValueCount U ∧
      0 < Module.finrank ℂ (canonicalSimple G j ⟶
        RepresentationTheory.CharacterTheory.FaithfulTensor.tensorPowerFDRep U n) :=
  RepresentationTheory.CharacterTheory.FaithfulTensor.exists_pos_finrank_hom_tensorPower
    U hU (canonicalSimple G j)

noncomputable def offDiagonalMcKay (U : FDRep ℂ G) : SimpleGraph (CanonicalIndex G) :=
  SimpleGraph.fromRel fun i j => i ≠ j ∧ 0 < sourceFirstMcKay U i j

theorem offDiagonalMcKay_connected (U : FDRep ℂ G) (hU : Function.Injective U.ρ) :
    (offDiagonalMcKay U).Connected := sorry

end GenericMcKay

/-- Weighted identity includes diagonal entries in M, which cancel using Mδ=2δ. -/
theorem weightedMcKay_square_sum {I : Type*} [Fintype I] [DecidableEq I]
    (M : Matrix I I ℝ) (δ x : I → ℝ) (hs : M.IsSymm)
    (hn : ∀ i j, 0 ≤ M i j) (hp : ∀ i, 0 < δ i) (he : M *ᵥ δ = 2 • δ) :
    dotProduct x ((2 • (1 : Matrix I I ℝ) - M) *ᵥ x) =
      (1 / 2 : ℝ) * ∑ i, ∑ j,
        M i j * δ i * δ j * (x i / δ i - x j / δ j) ^ 2 := sorry

/-- Loop cancellation in the quadratic identity does not assert loop-freeness. -/
theorem weightedMcKay_kernel {I : Type*} [Fintype I] [DecidableEq I] [Nonempty I]
    (M : Matrix I I ℝ) (δ : I → ℝ) (hs : M.IsSymm)
    (hn : ∀ i j, 0 ≤ M i j) (hp : ∀ i, 0 < δ i) (he : M *ᵥ δ = 2 • δ)
    (hc : (SimpleGraph.fromRel fun i j => i ≠ j ∧ 0 < M i j).Connected) :
    LinearMap.ker (Matrix.mulVecLin (2 • (1 : Matrix I I ℝ) - M)) = Submodule.span ℝ {δ} := sorry

section SubgroupMcKay
variable (H : Subgroup TauCeti.SU2) [Fintype H]

noncomputable def subgroupMcKay : Matrix (CanonicalIndex H) (CanonicalIndex H) ℕ :=
  sourceFirstMcKay (FDRep.of (definingRepresentation H))

noncomputable def subgroupCartan : Matrix (CanonicalIndex H) (CanonicalIndex H) ℤ := by
  classical
  exact fun i j => 2 * (if i = j then 1 else 0) - (subgroupMcKay H i j : ℤ)

theorem subgroupDimensions_pos (i : CanonicalIndex H) : 0 < canonicalDimensions H i :=
  by simpa [canonicalDimensions, canonicalSimple] using TauCeti.characterDegree_pos ℂ i

theorem subgroupDimensions_trivial : canonicalDimensions H (canonicalTrivialIndex H) = 1 := sorry

theorem subgroupMcKay_conjugacy (g : TauCeti.SU2) :
    letI : Fintype (H.map (MulAut.conj g).toMonoidHom) :=
      Fintype.ofEquiv H ((MulAut.conj g).subgroupMap H).toEquiv
    ∃ e : CanonicalIndex H ≃ CanonicalIndex (H.map (MulAut.conj g).toMonoidHom),
      ∀ i j, subgroupMcKay H i j =
        subgroupMcKay (H.map (MulAut.conj g).toMonoidHom) (e i) (e j) := sorry

/-- Actual −I membership, distinct from a noncyclic family label. -/
theorem subgroup_binary_iff_even :
    unitQuaternionEquivSU2 minusOneUnitQuaternion ∈ H ↔ Even (Nat.card H) := sorry

theorem subgroupMcKay_no_loops (hn : 1 < Nat.card H) : ∀ i, subgroupMcKay H i i = 0 := sorry

theorem subgroupMcKay_binary_bipartite
    (hm : unitQuaternionEquivSU2 minusOneUnitQuaternion ∈ H) :
    ∃ parity : CanonicalIndex H → Bool,
      ∀ i j, 0 < subgroupMcKay H i j → parity i ≠ parity j := sorry

/-- Native matrix/index/mark output; A1 is kept as a double edge, never encoded by SimpleGraph. -/
noncomputable def genericMcKayAffine : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    1 < Nat.card H →
    {te : Σ t : TauCeti.AffineDynkinType, CanonicalIndex H ≃ Fin t.nodes //
      te.1.Valid ∧ te.2 (canonicalTrivialIndex H) = te.1.affineNode ∧
      (∀ i j, subgroupCartan H i j = te.1.cartanMatrix (te.2 i) (te.2 j)) ∧
      (∀ i, (canonicalDimensions H i : ℤ) = te.1.marks (te.2 i))} := sorry

/-- Delete the actual trivial coordinate, construct θ there, and compare its marked extension.
This supplies a finite Gram witness independently of arbitrary affine-converse classification. -/
theorem deletedMcKay_positiveDefinite :
    let J := {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H}
    Matrix.PosDef (fun i j : J => (subgroupCartan H i.val j.val : ℝ)) := sorry

theorem markedMcKay_integer_kernel :
    ∀ x : CanonicalIndex H → ℤ, subgroupCartan H *ᵥ x = 0 ↔
      x ∈ Submodule.span ℤ {fun i => (canonicalDimensions H i : ℤ)} := sorry

noncomputable def markedMcKay_deleteTrivial : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    ((CanonicalIndex H → ℤ) ⧸ Submodule.span ℤ {fun i => (canonicalDimensions H i : ℤ)}) ≃ₗ[ℤ]
      ({i : CanonicalIndex H // i ≠ canonicalTrivialIndex H} → ℤ) := sorry

theorem markedMcKay_deleteTrivial_mk (x : CanonicalIndex H → ℤ)
    (i : {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H}) :
    markedMcKay_deleteTrivial H (Submodule.Quotient.mk x) i =
      x i.val - x (canonicalTrivialIndex H) * (canonicalDimensions H i.val : ℤ) := sorry

end SubgroupMcKay

/-- The two cyclic congruences are counted separately, retaining their coincidences at n=1,2. -/
def cyclicMcKayMultiplicity (n : ℕ) [NeZero n] (i j : ZMod n) : ℕ :=
  (if j = i + 1 then 1 else 0) + (if j = i - 1 then 1 else 0)

theorem cyclicMcKayMultiplicity_one (i j : ZMod 1) : cyclicMcKayMultiplicity 1 i j = 2 := by
  have h1 : j = i + 1 := Subsingleton.elim _ _
  have h2 : j = i - 1 := Subsingleton.elim _ _
  calc
    cyclicMcKayMultiplicity 1 i j = 1 + 1 := by
      rw [cyclicMcKayMultiplicity, if_pos h1, if_pos h2]
    _ = 2 := rfl

theorem cyclicMcKayMultiplicity_two :
    ∀ i j : ZMod 2, cyclicMcKayMultiplicity 2 i j = if i = j then 0 else 2 := sorry

theorem cyclicMcKayMultiplicity_actual (n : ℕ) [NeZero n] :
    ∃ e : CanonicalIndex (cyclicSU2 n) ≃ ZMod n,
      ∀ i j, subgroupMcKay (cyclicSU2 n) i j = cyclicMcKayMultiplicity n (e i) (e j) := sorry

/-! ## Characterizing equations for retained lifted actions -/

theorem symmetricAlgebraAction_ι {k Γ V : Type*} [Field k] [Group Γ]
    [AddCommGroup V] [Module k V] (ρ : Representation k Γ V) (g : Γ) (v : V) :
    letI := symmetricAlgebraAction k Γ V ρ
    g • SymmetricAlgebra.ι k V v = SymmetricAlgebra.ι k V (ρ g v) := sorry

theorem exteriorAlgebraAction_ι {k Γ V : Type*} [Field k] [Group Γ]
    [AddCommGroup V] [Module k V] (ρ : Representation k Γ V) (g : Γ) (v : V) :
    letI := exteriorAlgebraAction k Γ V ρ
    g • ExteriorAlgebra.ι k v = ExteriorAlgebra.ι k (ρ g v) := sorry

theorem skewDegreeOne_left_single {k Γ V : Type u} [Field k] [Group Γ]
    [AddCommGroup V] [Module k V] (ρ : Representation k Γ V) (g h : Γ) (v : V) :
    letI := skewDegreeOneLeftModule k Γ V ρ
    (MonoidAlgebra.single h (1 : k)) • (Finsupp.single g v : SkewDegreeOne Γ V) =
      Finsupp.single (h * g) (ρ h v) := sorry

theorem skewDegreeOne_right_single {k Γ V : Type u} [Field k] [Group Γ]
    [AddCommGroup V] [Module k V] (ρ : Representation k Γ V) (g h : Γ) (v : V) :
    letI := skewDegreeOneRightModule k Γ V ρ
    MulOpposite.op (MonoidAlgebra.single h (1 : k)) •
      (Finsupp.single g v : SkewDegreeOne Γ V) = Finsupp.single (g * h) v := sorry

theorem rightDualRightModule_apply {k S W : Type u} [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] (a : S) (f : RightBimoduleDual S W) (w : W) :
    letI := rightDualRightModule k S W
    (MulOpposite.op a • f) w = f (a • w) := sorry

/-! ## Equivariant MODULE CATEGORY, with semilinear group action -/

attribute [instance] EquivariantLeftModuleData.addCommGroup EquivariantLeftModuleData.module
  EquivariantLeftModuleData.action

@[ext] structure EquivariantModuleHom {A Γ : Type u} [Ring A] [Group Γ]
    [MulSemiringAction Γ A] (X Y : EquivariantLeftModuleData A Γ) where
  hom : X.carrier →ₗ[A] Y.carrier
  equivariant : ∀ (g : Γ) (m : X.carrier), hom (g • m) = g • hom m

instance equivariantModuleCategory {A Γ : Type u} [Ring A] [Group Γ]
    [MulSemiringAction Γ A] : Category (EquivariantLeftModuleData A Γ) where
  Hom := EquivariantModuleHom
  id X := ⟨LinearMap.id, fun _ _ => rfl⟩
  comp f g := ⟨g.hom ∘ₗ f.hom, by intro h m; simp [f.equivariant, g.equivariant]⟩

/-- The group maps need not be A-linear. Morphisms are A-linear AND Γ-equivariant. -/
noncomputable def skewModuleCategoryEquivalence : ∀ (A Γ : Type u) [Ring A] [Group Γ]
    [MulSemiringAction Γ A],
    ModuleCat (SkewGroupAlgebra A Γ) ≌ EquivariantLeftModuleData A Γ := sorry

/-! ## Literal cyclic exterior and polynomial presentations -/

/-- Actual directed doubled cycle, including distinct X/Y arrows when n=2. -/
structure DoubledCycleVertex (n : ℕ) where
  index : ZMod n

deriving instance DecidableEq for DoubledCycleVertex

instance (n : ℕ) [NeZero n] : Fintype (DoubledCycleVertex n) :=
  Fintype.ofEquiv (ZMod n)
    { toFun := DoubledCycleVertex.mk, invFun := DoubledCycleVertex.index,
      left_inv := by intro; rfl, right_inv := by intro x; cases x; rfl }

instance (n : ℕ) : Quiver (DoubledCycleVertex n) where
  Hom i j := {b : Bool // j.index = if b then i.index + 1 else i.index - 1}

noncomputable def cycleX (n : ℕ) (i : ZMod n) :
    TauCeti.pathAlgebra ℂ (DoubledCycleVertex n) :=
  TauCeti.PathAlgebra.ofArrow (⟨true, by simp⟩ :
    (DoubledCycleVertex.mk i) ⟶ DoubledCycleVertex.mk (i + 1))

noncomputable def cycleY (n : ℕ) (i : ZMod n) :
    TauCeti.pathAlgebra ℂ (DoubledCycleVertex n) :=
  TauCeti.PathAlgebra.ofArrow (⟨false, by simp⟩ :
    (DoubledCycleVertex.mk i) ⟶ DoubledCycleVertex.mk (i - 1))

/-- Sign −1 is part of the ACTUAL relation ideal, not an arbitrary-algebra record. -/
noncomputable def cyclicExteriorIdeal (n : ℕ) [NeZero n] :
    TwoSidedIdeal (TauCeti.pathAlgebra ℂ (DoubledCycleVertex n)) :=
  TwoSidedIdeal.span
    {r | ∃ i : ZMod n,
      r = cycleX n (i + 1) * cycleX n i ∨
      r = cycleY n (i - 1) * cycleY n i ∨
      r = cycleY n (i + 1) * cycleX n i + cycleX n (i - 1) * cycleY n i}

noncomputable abbrev CyclicExteriorPresentation (n : ℕ) [NeZero n] :=
  TauCeti.pathAlgebra ℂ (DoubledCycleVertex n) ⧸ (cyclicExteriorIdeal n).asIdeal

noncomputable def cyclicExteriorPresentationEquiv : ∀ (n : ℕ) [NeZero n], 3 ≤ n →
    CyclicExteriorPresentation n ≃ₐ[ℂ]
      ExteriorSkewAlgebra ℂ (cyclicSubgroup n) (Fin 2 → ℂ)
        (unitQuaternionDefiningRepresentation (cyclicSubgroup n)) := sorry

noncomputable def cyclicExteriorBasis : ∀ (n : ℕ) [NeZero n], 3 ≤ n →
    Module.Basis (Fin 4 × ZMod n) ℂ (CyclicExteriorPresentation n) := sorry

/-- Vertex, X, Y, and xy at i are the four specified basis blocks. -/
theorem cyclicExteriorBasis_vertex (n : ℕ) [NeZero n] (hn : 3 ≤ n) (i : ZMod n) :
    cyclicExteriorBasis n hn (0, i) = Submodule.Quotient.mk
      (TauCeti.PathAlgebra.vertexIdempotent ℂ (DoubledCycleVertex.mk i)) := sorry

theorem cyclicExteriorBasis_X (n : ℕ) [NeZero n] (hn : 3 ≤ n) (i : ZMod n) :
    cyclicExteriorBasis n hn (1, i) = Submodule.Quotient.mk (cycleX n i) := sorry

theorem cyclicExteriorBasis_Y (n : ℕ) [NeZero n] (hn : 3 ≤ n) (i : ZMod n) :
    cyclicExteriorBasis n hn (2, i) = Submodule.Quotient.mk (cycleY n i) := sorry

theorem cyclicExteriorBasis_xy (n : ℕ) [NeZero n] (hn : 3 ≤ n) (i : ZMod n) :
    cyclicExteriorBasis n hn (3, i) = Submodule.Quotient.mk (cycleX n (i - 1) * cycleY n i) := sorry

theorem cyclicExterior_finrank (n : ℕ) [NeZero n] (hn : 3 ≤ n) :
    Module.finrank ℂ (CyclicExteriorPresentation n) = 4 * n := sorry

theorem cyclicExterior_three_arrows_zero (n : ℕ) [NeZero n] (hn : 3 ≤ n)
    (i j k : ZMod n) (a b c : Bool) :
    let arrow := fun d l => if d then cycleX n l else cycleY n l
    (Submodule.Quotient.mk (arrow a i * arrow b j * arrow c k) :
      CyclicExteriorPresentation n) = 0 := sorry

/-- Impossible odd-cycle gauge equations. No claim of an ordinary odd-cycle zigzag equivalence. -/
theorem odd_cycle_backtrack_gauge_impossible (n : ℕ) (hn : Odd n) :
    ¬ ∃ a : ZMod n → ℂ, (∀ i, a i ≠ 0) ∧ ∀ i, a (i + 1) = -a i := sorry

noncomputable def evenCyclicExteriorEquivZigzag : ∀ (n : ℕ) [NeZero n], 4 ≤ n → Even n →
    CyclicExteriorPresentation n ≃ₐ[ℂ]
      ZigzagPreprojective.zigzagAlgebra ℂ (SimpleGraph.cycleGraph n) := sorry

/-- The polynomial relation is the DIFFERENCE of backtracks; repeated same-direction paths stay. -/
noncomputable def cyclicPolynomialIdeal (n : ℕ) [NeZero n] :
    TwoSidedIdeal (TauCeti.pathAlgebra ℂ (DoubledCycleVertex n)) :=
  TwoSidedIdeal.span {r | ∃ i : ZMod n,
    r = cycleY n (i + 1) * cycleX n i - cycleX n (i - 1) * cycleY n i}

noncomputable abbrev CyclicPolynomialPresentation (n : ℕ) [NeZero n] :=
  TauCeti.pathAlgebra ℂ (DoubledCycleVertex n) ⧸ (cyclicPolynomialIdeal n).asIdeal

noncomputable def cyclicPolynomialPresentationEquiv : ∀ (n : ℕ) [NeZero n], 3 ≤ n →
    CyclicPolynomialPresentation n ≃ₐ[ℂ]
      SymmetricSkewAlgebra ℂ (cyclicSubgroup n) (Fin 2 → ℂ)
        (unitQuaternionDefiningRepresentation (cyclicSubgroup n)) := sorry

end TauCetiRoadmap.McKaySkewGroup

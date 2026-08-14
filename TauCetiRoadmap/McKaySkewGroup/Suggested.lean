import Mathlib
import TauCetiRoadmap.RepresentationTheory.CharacterTheory.Suggested
import TauCetiRoadmap.RepresentationTheory.QuiverRepresentations.Suggested
import TauCetiRoadmap.DGAInfinity.Suggested
import TauCetiRoadmap.StablePeriodicCurved.Suggested
import TauCetiRoadmap.ZigzagPreprojective.Suggested

/-!
# McKay correspondence and skew-group algebras: target signatures

**This file is not the roadmap and is not exhaustive.**  `README.md` is definitive.  These
declarations pin concrete carriers, multiplication, handedness, equations, and three integration
targets.  `sorry` is allowed in this human-owned roadmap library: these are goals, not proofs.
-/

namespace TauCetiRoadmap.McKaySkewGroup

open CategoryTheory
open scoped Matrix MatrixGroups MonoidalCategory Quaternion

universe u v

/-! ## Explicit unit-quaternion subgroups -/

/-- Unit quaternions as a concrete carrier. -/
structure UnitQuaternion where
  val : ℍ[ℝ]
  normSq_eq_one : Quaternion.normSq val = 1

namespace UnitQuaternion

@[ext] theorem ext {a b : UnitQuaternion} (h : a.val = b.val) : a = b := by
  cases a; cases b; simp_all

/-- The unit quaternions are a group under multiplication, with inverse the conjugate.  This is
proved rather than assumed: a `sorry`-ed instance would be supplied silently to every subgroup
and representation below. -/
noncomputable instance : Group UnitQuaternion where
  mul a b := ⟨a.val * b.val, by
    simp only [map_mul, a.normSq_eq_one, b.normSq_eq_one, one_mul]⟩
  one := ⟨1, by simp⟩
  inv a := ⟨star a.val, by rw [Quaternion.normSq_star]; exact a.normSq_eq_one⟩
  mul_assoc a b c := UnitQuaternion.ext (mul_assoc _ _ _)
  one_mul a := UnitQuaternion.ext (one_mul _)
  mul_one a := UnitQuaternion.ext (mul_one _)
  inv_mul_cancel a := UnitQuaternion.ext (by
    show star a.val * a.val = 1
    rw [Quaternion.star_mul_self, a.normSq_eq_one]
    simp)

@[simp] theorem val_mul (a b : UnitQuaternion) : (a * b).val = a.val * b.val := rfl
@[simp] theorem val_one : (1 : UnitQuaternion).val = 1 := rfl
@[simp] theorem val_inv (a : UnitQuaternion) : a⁻¹.val = star a.val := rfl

end UnitQuaternion

/-- The standard quaternion/matrix identification, with all signs fixed by the displayed matrix in
the roadmap. -/
noncomputable def unitQuaternionEquivSU2 :
    UnitQuaternion ≃* Matrix.specialUnitaryGroup (Fin 2) ℂ := sorry

/-- The determinant-one inclusion `SU(2) → SL₂(ℂ)`. -/
def su2ToSL2 : Matrix.specialUnitaryGroup (Fin 2) ℂ →*
    Matrix.SpecialLinearGroup (Fin 2) ℂ := sorry

/-- A unit quaternion with prescribed coordinates satisfying the unit-sphere equation. -/
noncomputable def unitQuaternionOfCoords (x : Fin 4 → ℝ)
    (hx : ∑ i, x i ^ 2 = 1) : UnitQuaternion := sorry

/-- The exact coordinate predicate for the 24 Hurwitz units. -/
def IsHurwitz24 (x : Fin 4 → ℝ) : Prop :=
  (∃ i, (x i = 1 ∨ x i = -1) ∧ ∀ j, j ≠ i → x j = 0) ∨
    ∀ i, x i = 1 / 2 ∨ x i = -1 / 2

/-- The extra 24 points in the binary octahedral group. -/
def IsOctahedral24 (x : Fin 4 → ℝ) : Prop :=
  (Finset.univ.filter fun i ↦ x i ≠ 0).card = 2 ∧
    ∀ i, x i ≠ 0 → x i = 1 / Real.sqrt 2 ∨ x i = -1 / Real.sqrt 2

/-- Golden ratio used in the 600-cell coordinates. -/
noncomputable def goldenRatio : ℝ := (1 + Real.sqrt 5) / 2

/-- The extra 96 vertices of the 600-cell: even coordinate permutations of
`(0, ±1, ±φ, ±φ⁻¹)/2`. -/
def IsGolden96 (x : Fin 4 → ℝ) : Prop :=
  ∃ (σ : Equiv.Perm (Fin 4)) (sign : Fin 4 → ℝ),
    Equiv.Perm.sign σ = 1 ∧
      (∀ i, sign i = 1 ∨ sign i = -1) ∧
      x = fun i ↦ sign i * ![0, 1 / 2, goldenRatio / 2, goldenRatio⁻¹ / 2] (σ i)

/-- The explicit `2T` carrier is closed under quaternion multiplication and inversion. -/
noncomputable def binaryTetrahedral : Subgroup UnitQuaternion where
  carrier := {q | IsHurwitz24 (Quaternion.equivTuple ℝ q.val)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The explicit `2O` carrier. -/
noncomputable def binaryOctahedral : Subgroup UnitQuaternion where
  carrier := {q | IsHurwitz24 (Quaternion.equivTuple ℝ q.val) ∨
    IsOctahedral24 (Quaternion.equivTuple ℝ q.val)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The explicit `2I` carrier, equal to the 120 vertices of the unit 600-cell. -/
noncomputable def binaryIcosahedral : Subgroup UnitQuaternion where
  carrier := {q | IsHurwitz24 (Quaternion.equivTuple ℝ q.val) ∨
    IsGolden96 (Quaternion.equivTuple ℝ q.val)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

theorem card_binaryTetrahedral : Nat.card binaryTetrahedral = 24 := sorry
theorem card_binaryOctahedral : Nat.card binaryOctahedral = 48 := sorry
theorem card_binaryIcosahedral : Nat.card binaryIcosahedral = 120 := sorry

/-- A quaternion on the complex circle, of angle `2π/n`. -/
noncomputable def cyclicGenerator (n : ℕ) : UnitQuaternion :=
  unitQuaternionOfCoords
    ![Real.cos (2 * Real.pi / n), Real.sin (2 * Real.pi / n), 0, 0] (by sorry)

/-- A quaternion on the complex circle, of angle `π/n`. -/
noncomputable def binaryDihedralRotation (n : ℕ) : UnitQuaternion :=
  unitQuaternionOfCoords
    ![Real.cos (Real.pi / n), Real.sin (Real.pi / n), 0, 0] (by sorry)

/-- The quaternion `j`, corresponding to `!![0,1;-1,0]`. -/
noncomputable def binaryDihedralReflection : UnitQuaternion :=
  unitQuaternionOfCoords ![0, 0, 1, 0] (by sorry)

/-- The central unit quaternion `-1`. -/
noncomputable def minusOneUnitQuaternion : UnitQuaternion :=
  unitQuaternionOfCoords ![-1, 0, 0, 0] (by sorry)

noncomputable def cyclicSubgroup (n : ℕ) : Subgroup UnitQuaternion :=
  Subgroup.zpowers (cyclicGenerator n)

noncomputable def binaryDihedral (n : ℕ) : Subgroup UnitQuaternion :=
  Subgroup.closure {binaryDihedralRotation n, binaryDihedralReflection}

theorem card_cyclicSubgroup (n : ℕ) (hn : 2 ≤ n) : Nat.card (cyclicSubgroup n) = n := sorry
theorem card_binaryDihedral (n : ℕ) (hn : 2 ≤ n) : Nat.card (binaryDihedral n) = 4 * n := sorry

theorem binaryDihedral_relations (n : ℕ) (hn : 2 ≤ n) :
    binaryDihedralRotation n ^ (2 * n) = 1 ∧
      binaryDihedralReflection ^ 2 = binaryDihedralRotation n ^ n ∧
      binaryDihedralRotation n ^ n = minusOneUnitQuaternion ∧
      binaryDihedralReflection * binaryDihedralRotation n * binaryDihedralReflection⁻¹ =
        (binaryDihedralRotation n)⁻¹ := sorry

/-- The concrete subgroup of `SU(2)` associated to a unit-quaternion subgroup. -/
noncomputable def subgroupSU2 (H : Subgroup UnitQuaternion) :
    Subgroup (Matrix.specialUnitaryGroup (Fin 2) ℂ) :=
  H.map unitQuaternionEquivSU2.toMonoidHom

noncomputable def subgroupSL2 (H : Subgroup UnitQuaternion) :
    Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℂ) :=
  (subgroupSU2 H).map su2ToSL2

noncomputable abbrev cyclicSU2 (n : ℕ) := subgroupSU2 (cyclicSubgroup n)
noncomputable abbrev binaryDihedralSU2 (n : ℕ) := subgroupSU2 (binaryDihedral n)
noncomputable abbrev binaryTetrahedralSU2 := subgroupSU2 binaryTetrahedral
noncomputable abbrev binaryOctahedralSU2 := subgroupSU2 binaryOctahedral
noncomputable abbrev binaryIcosahedralSU2 := subgroupSU2 binaryIcosahedral

noncomputable abbrev cyclicSL2 (n : ℕ) := subgroupSL2 (cyclicSubgroup n)
noncomputable abbrev binaryDihedralSL2 (n : ℕ) := subgroupSL2 (binaryDihedral n)
noncomputable abbrev binaryTetrahedralSL2 := subgroupSL2 binaryTetrahedral
noncomputable abbrev binaryOctahedralSL2 := subgroupSL2 binaryOctahedral
noncomputable abbrev binaryIcosahedralSL2 := subgroupSL2 binaryIcosahedral

/-- The defining two-dimensional representation, restricted to a concrete subgroup. -/
noncomputable def definingRepresentation
    (H : Subgroup (Matrix.specialUnitaryGroup (Fin 2) ℂ)) :
    Representation ℂ H (Fin 2 → ℂ) := sorry

theorem definingRepresentation_faithful
    (H : Subgroup (Matrix.specialUnitaryGroup (Fin 2) ℂ)) :
    Function.Injective (definingRepresentation H) := sorry

/-- The determinant form identifying the defining representation with its dual. -/
def standardAlternatingForm (x y : Fin 2 → ℂ) : ℂ := x 0 * y 1 - x 1 * y 0

theorem definingRepresentation_preserves_alternating
    (H : Subgroup (Matrix.specialUnitaryGroup (Fin 2) ℂ)) (g : H) (x y : Fin 2 → ℂ) :
    standardAlternatingForm (definingRepresentation H g x) (definingRepresentation H g y) =
      standardAlternatingForm x y := sorry

/-- The determinant pairing is nondegenerate, so it gives the promised concrete self-duality. -/
noncomputable def standardAlternatingDualEquiv :
    (Fin 2 → ℂ) ≃ₗ[ℂ] Module.Dual ℂ (Fin 2 → ℂ) := sorry

@[simp] theorem standardAlternatingDualEquiv_apply (x y : Fin 2 → ℂ) :
    standardAlternatingDualEquiv x y = standardAlternatingForm x y := sorry

/-- Invariance of the determinant pairing is upgraded to equivariance of the nondegenerate map
`V ≃ V∗`; later quadratic duality uses this equivalence rather than an implicit identification. -/
theorem standardAlternatingDualEquiv_equivariant
    (H : Subgroup (Matrix.specialUnitaryGroup (Fin 2) ℂ)) (g : H) (x : Fin 2 → ℂ) :
    standardAlternatingDualEquiv (definingRepresentation H g x) =
      Representation.dual (definingRepresentation H) g (standardAlternatingDualEquiv x) := sorry

/-- The defining representation pulled directly to a unit-quaternion subgroup. -/
noncomputable def unitQuaternionDefiningRepresentation (H : Subgroup UnitQuaternion) :
    Representation ℂ H (Fin 2 → ℂ) := sorry

/-! ## Irreducibles, McKay matrix, and the regular vector -/

/-- The one-dimensional trivial finite representation. -/
noncomputable abbrev trivialFDRep (k : Type u) (G : Type v) [Field k] [Group G] : FDRep k G :=
  FDRep.of (Representation.trivial k G k)

/-- A duplicate-free exhaustive family of simple finite-dimensional representations. -/
structure IrrepFamily (k : Type u) (G : Type v) [Field k] [Group G] where
  ι : Type v
  [fintypeι : Fintype ι]
  rep : ι → FDRep k G
  simple : ∀ i, Simple (rep i)
  pairwise : ∀ i j, Nonempty (rep i ≅ rep j) → i = j
  exhaustive : ∀ (W : FDRep k G), Simple W → ∃ i, Nonempty (rep i ≅ W)
  trivial : ι
  trivial_is_one : Nonempty (rep trivial ≅ trivialFDRep k G)

attribute [instance] IrrepFamily.fintypeι

noncomputable def cyclicIrreps (n : ℕ) : IrrepFamily ℂ (cyclicSubgroup n) := sorry
noncomputable def binaryDihedralIrreps (n : ℕ) : IrrepFamily ℂ (binaryDihedral n) := sorry
noncomputable def binaryTetrahedralIrreps : IrrepFamily ℂ binaryTetrahedral := sorry
noncomputable def binaryOctahedralIrreps : IrrepFamily ℂ binaryOctahedral := sorry
noncomputable def binaryIcosahedralIrreps : IrrepFamily ℂ binaryIcosahedral := sorry

namespace IrrepFamily

variable {k : Type u} {G : Type v} [Field k] [Group G]

noncomputable def dimension (D : IrrepFamily k G) (i : D.ι) : ℕ :=
  Module.finrank k (D.rep i)

/-- `a_ji = dim Hom(ρ_j, V ⊗ ρ_i)`: the row is the target vertex. -/
noncomputable def mckayMatrix (D : IrrepFamily k G) (V : FDRep k G) : Matrix D.ι D.ι ℕ :=
  fun j i ↦ Module.finrank k (D.rep j ⟶ (V ⊗ D.rep i))

noncomputable def affineCartan (D : IrrepFamily k G) (V : FDRep k G) : Matrix D.ι D.ι ℤ :=
  by
    classical
    exact fun j i ↦ 2 * (if j = i then 1 else 0) - (D.mckayMatrix V j i : ℤ)

/-- The regular-representation dimension vector. -/
noncomputable def regularDimensionVector (D : IrrepFamily k G) : D.ι → ℤ :=
  fun i ↦ D.dimension i

theorem affineCartan_mul_regularDimensionVector [Fintype G]
    (D : IrrepFamily k G) (V : FDRep k G)
    (hTensorDimension : ∀ i,
      ∑ j, D.mckayMatrix V j i * D.dimension j = 2 * D.dimension i) :
    D.affineCartan V *ᵥ D.regularDimensionVector = 0 := sorry

theorem sum_sq_regularDimensionVector [Fintype G] [IsAlgClosed k]
    [Invertible (Nat.card G : k)] (D : IrrepFamily k G) :
    ∑ i, (D.dimension i) ^ 2 = Nat.card G := sorry

end IrrepFamily

/-- Names only the simple-graph affine families used below.  Cyclic `n=2` is deliberately absent:
its `Ã₁` McKay matrix has a double edge and remains a matrix-level target. -/
inductive NamedAffineADE
  | cyclic (n : ℕ) (atLeastThree : 3 ≤ n)
  | binaryDihedral (n : ℕ) (atLeastTwo : 2 ≤ n)
  | E6 | E7 | E8

namespace NamedAffineADE

/-- Exactly the affine tags arising from the binary (noncyclic) subgroups. -/
def IsBinary : NamedAffineADE → Prop
  | .cyclic _ _ => False
  | .binaryDihedral _ _ | .E6 | .E7 | .E8 => True

def vertexCount : NamedAffineADE → ℕ
  | .cyclic n _ => n
  | .binaryDihedral n _ => n + 3
  | .E6 => 7
  | .E7 => 8
  | .E8 => 9

/-- The standard affine graph is determined by the ADE tag and parameter.  The exceptional
numberings are star-shaped; `Ẽ₈` is definitionally the sibling roadmap's pinned graph. -/
def standardGraph : (t : NamedAffineADE) → SimpleGraph (Fin t.vertexCount)
  | .cyclic n _ => SimpleGraph.cycleGraph n
  | .binaryDihedral n _ => SimpleGraph.fromRel fun i j ↦
      (i.1 = 0 ∧ j.1 = 2) ∨ (i.1 = 1 ∧ j.1 = 2) ∨
      (2 ≤ i.1 ∧ i.1 < n ∧ j.1 = i.1 + 1) ∨
      (i.1 = n ∧ j.1 = n + 1) ∨ (i.1 = n ∧ j.1 = n + 2)
  | .E6 => SimpleGraph.fromRel fun i j ↦
      (i.1, j.1) = (0, 1) ∨ (i.1, j.1) = (1, 2) ∨
      (i.1, j.1) = (0, 3) ∨ (i.1, j.1) = (3, 4) ∨
      (i.1, j.1) = (0, 5) ∨ (i.1, j.1) = (5, 6)
  | .E7 => SimpleGraph.fromRel fun i j ↦
      (i.1, j.1) = (0, 1) ∨ (i.1, j.1) = (0, 2) ∨
      (i.1, j.1) = (2, 3) ∨ (i.1, j.1) = (3, 4) ∨
      (i.1, j.1) = (0, 5) ∨ (i.1, j.1) = (5, 6) ∨
      (i.1, j.1) = (6, 7)
  | .E8 => ZigzagPreprojective.affineE8Graph

/-- The distinguished affine vertex; in the pinned `Ẽ₈` numbering this is vertex `8`. -/
def affineVertex : (t : NamedAffineADE) → Fin t.vertexCount
  | .cyclic _ h => ⟨0, by simpa [vertexCount] using lt_of_lt_of_le (by omega : 0 < 3) h⟩
  | .binaryDihedral _ _ => ⟨0, by simp [vertexCount]⟩
  | .E6 => ⟨2, by decide⟩
  | .E7 => ⟨4, by decide⟩
  | .E8 => ⟨8, by decide⟩

noncomputable def standardCartan (t : NamedAffineADE) :
    Matrix (Fin t.vertexCount) (Fin t.vertexCount) ℤ :=
  by
    classical
    exact fun i j ↦ 2 * (if i = j then 1 else 0) -
      (if t.standardGraph.Adj i j then 1 else 0)

end NamedAffineADE

/-- The finite-dimensional contragredient representation. -/
noncomputable def dualFDRep {k : Type u} {G : Type v} [Field k] [Group G]
    (V : FDRep k G) : FDRep k G :=
  FDRep.of (Representation.dual V.ρ)

/-- A named identification can no longer carry an arbitrary labelled matrix: its graph and Cartan
matrix are computed from `tag`.  The hypotheses which force a one-dimensional affine radical are
stored explicitly, while completeness is already part of `D`. -/
structure NamedMcKayIdentification {G : Type v} [Group G]
    (D : IrrepFamily ℂ G) (V : FDRep ℂ G) (tag : NamedAffineADE) where
  defining_dimension : Module.finrank ℂ V = 2
  defining_faithful : Function.Injective V.ρ
  defining_selfDual : Nonempty (V ≅ dualFDRep V)
  standard_connected : tag.standardGraph.Connected
  relabel : D.ι ≃ Fin tag.vertexCount
  trivial_vertex : relabel D.trivial = tag.affineVertex
  mckay_adjacent : ∀ j i,
    tag.standardGraph.Adj (relabel j) (relabel i) ↔ D.mckayMatrix V j i = 1
  mckay_nonadjacent : ∀ j i,
    ¬tag.standardGraph.Adj (relabel j) (relabel i) → D.mckayMatrix V j i = 0

namespace NamedMcKayIdentification

theorem cartan_eq_standard {G : Type v} [Group G] {D : IrrepFamily ℂ G}
    {V : FDRep ℂ G} {tag : NamedAffineADE}
    (M : NamedMcKayIdentification D V tag) :
    D.affineCartan V = tag.standardCartan.submatrix M.relabel M.relabel := sorry

/-- The radical theorem is intentionally available only from exact connected standard affine ADE
data, never for an arbitrary representation. -/
theorem affineCartan_kernel_eq_regularLine {G : Type v} [Group G]
    {D : IrrepFamily ℂ G} {V : FDRep ℂ G} {tag : NamedAffineADE}
    (M : NamedMcKayIdentification D V tag) :
    ∀ x : D.ι → ℤ,
      D.affineCartan V *ᵥ x = 0 ↔ x ∈ Submodule.span ℤ {D.regularDimensionVector} := sorry

end NamedMcKayIdentification

noncomputable def cyclicMcKayA (n : ℕ) (hn : 3 ≤ n) :
    NamedMcKayIdentification (cyclicIrreps n)
      (FDRep.of (unitQuaternionDefiningRepresentation (cyclicSubgroup n))) (.cyclic n hn) := sorry

noncomputable def binaryDihedralMcKayD (n : ℕ) (hn : 2 ≤ n) :
    NamedMcKayIdentification (binaryDihedralIrreps n)
      (FDRep.of (unitQuaternionDefiningRepresentation (binaryDihedral n)))
      (.binaryDihedral n hn) := sorry

noncomputable def binaryTetrahedralMcKayE6 :
    NamedMcKayIdentification binaryTetrahedralIrreps
      (FDRep.of (unitQuaternionDefiningRepresentation binaryTetrahedral)) .E6 := sorry

noncomputable def binaryOctahedralMcKayE7 :
    NamedMcKayIdentification binaryOctahedralIrreps
      (FDRep.of (unitQuaternionDefiningRepresentation binaryOctahedral)) .E7 := sorry

noncomputable def binaryIcosahedralMcKayE8 :
    NamedMcKayIdentification binaryIcosahedralIrreps
      (FDRep.of (unitQuaternionDefiningRepresentation binaryIcosahedral)) .E8 := sorry

/-- The exceptional `C₂` case stays at the matrix layer: tensoring either character by the
defining representation has multiplicity two, so its affine `Ã₁` graph is not a `SimpleGraph`. -/
theorem cyclicTwo_mckayMatrix :
    ∃ e : (cyclicIrreps 2).ι ≃ Fin 2,
      ∀ i j, (cyclicIrreps 2).mckayMatrix
        (FDRep.of (unitQuaternionDefiningRepresentation (cyclicSubgroup 2)))
        (e.symm i) (e.symm j) = if i = j then 0 else 2 := sorry

/-- In the sibling affine-`E₈` numbering, vertex 8 is affine/trivial. -/
def affineE8RegularVector : Fin 9 → ℤ := ![6, 3, 4, 2, 5, 4, 3, 2, 1]

theorem affineE8RegularVector_sum_sq : ∑ i, (affineE8RegularVector i) ^ 2 = 120 := by
  native_decide

theorem affineE8RegularVector_kernel :
    (fun i j ↦ 2 * (if i = j then 1 else 0) -
      (if ZigzagPreprojective.affineE8Graph.Adj i j then 1 else 0)) *ᵥ
        affineE8RegularVector = 0 := by
  native_decide

theorem binaryIcosahedral_regularVector_eq_E8 :
    binaryIcosahedralIrreps.regularDimensionVector ∘ binaryIcosahedralMcKayE8.relabel.symm =
      affineE8RegularVector := sorry

theorem binaryIcosahedral_trivial_vertex_E8 :
    binaryIcosahedralMcKayE8.relabel binaryIcosahedralIrreps.trivial = (8 : Fin 9) :=
  by simpa [NamedAffineADE.affineVertex, NamedAffineADE.vertexCount] using
    binaryIcosahedralMcKayE8.trivial_vertex

theorem binaryIcosahedral_affineCartan_kernel_eq_regularLine :
    ∀ x : binaryIcosahedralIrreps.ι → ℤ,
      binaryIcosahedralIrreps.affineCartan
          (FDRep.of (unitQuaternionDefiningRepresentation binaryIcosahedral)) *ᵥ x = 0 ↔
        x ∈ Submodule.span ℤ {binaryIcosahedralIrreps.regularDimensionVector} :=
  binaryIcosahedralMcKayE8.affineCartan_kernel_eq_regularLine

/-! ## Representation ring and the integral affine-to-finite quotient -/

open TauCetiRoadmap.RepresentationTheory.CharacterTheory

/-- The canonical class map missing from the bounded character-theory prototype. -/
noncomputable def representationClass (k : Type u) (G : Type v) [Field k] [CharZero k]
    [Group G] [Fintype G] : FDRep k G → repRing k G := sorry

theorem representationClass_tensor (k : Type u) (G : Type v) [Field k] [CharZero k]
    [Group G] [Fintype G] (V W : FDRep k G) :
    representationClass k G (V ⊗ W) = representationClass k G V * representationClass k G W := sorry

/-- The left regular finite-dimensional representation. -/
noncomputable def regularFDRep (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    FDRep k G := sorry

theorem representationClass_mckay_product {G : Type v} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) (V : FDRep ℂ G) (i : D.ι) :
    representationClass ℂ G V * representationClass ℂ G (D.rep i) =
      ∑ j, (D.mckayMatrix V j i : ℤ) • representationClass ℂ G (D.rep j) := sorry

theorem representationClass_regular_decomposition {G : Type v} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) :
    representationClass ℂ G (regularFDRep ℂ G) =
      ∑ i, (D.dimension i : ℤ) • representationClass ℂ G (D.rep i) := sorry

theorem representationClass_tensor_regular {G : Type v} [Group G] [Fintype G]
    (V : FDRep ℂ G) :
    representationClass ℂ G V * representationClass ℂ G (regularFDRep ℂ G) =
      (Module.finrank ℂ V : ℤ) • representationClass ℂ G (regularFDRep ℂ G) := sorry

/-- The affine lattice modulo the regular-representation vector `δ`. -/
abbrev AffineRootQuotient {G : Type v} [Group G] (D : IrrepFamily ℂ G) :=
  (D.ι → ℤ) ⧸ Submodule.span ℤ {D.regularDimensionVector}

/-- Deleting the trivial node gives integral coordinates for the quotient because `δ_trivial=1`. -/
noncomputable def affineRootQuotientEquivFinite {G : Type v} [Group G]
    (D : IrrepFamily ℂ G) :
    AffineRootQuotient D ≃+ ({i : D.ι // i ≠ D.trivial} → ℤ) := sorry

/-! ## The pinned left skew-product convention -/

/-- `A ⋊ Γ` specializes Mathlib's finitely supported skew-monoid algebra. -/
abbrev SkewGroupAlgebra (A Γ : Type*) [Zero A] := SkewMonoidAlgebra A Γ

/-- A bundled left module, used to state the skew/equivariant equivalence without choosing a
second module handedness. -/
structure LeftModuleData (R : Type*) [Ring R] where
  carrier : Type u
  [addCommGroup : AddCommGroup carrier]
  [module : Module R carrier]

/-- A left `A`-module with a compatible semilinear `Γ`-action. -/
structure EquivariantLeftModuleData (A Γ : Type*) [Ring A] [Group Γ]
    [MulSemiringAction Γ A] where
  carrier : Type u
  [addCommGroup : AddCommGroup carrier]
  [module : Module A carrier]
  [action : DistribMulAction Γ carrier]
  compat : ∀ (g : Γ) (a : A) (m : carrier),
    (g • (a • m) : carrier) = (g • a) • (g • m)

/-- Left modules over the pinned skew product are exactly equivariant left `A`-modules. -/
noncomputable def skewModuleEquivEquivariant (A Γ : Type*) [Ring A] [Group Γ]
    [MulSemiringAction Γ A] :
    LeftModuleData (SkewGroupAlgebra A Γ) ≃ EquivariantLeftModuleData A Γ := sorry

theorem skew_single_mul_single
    {k A Γ : Type*} [Field k] [Ring A] [Algebra k A] [Group Γ]
    [MulSemiringAction Γ A] [SMulCommClass Γ k A] (a b : A) (g h : Γ) :
    (SkewMonoidAlgebra.single g a : SkewGroupAlgebra A Γ) *
        SkewMonoidAlgebra.single h b =
      SkewMonoidAlgebra.single (g * h) (a * g • b) :=
  SkewMonoidAlgebra.single_mul_single

/-- The representation action lifted functorially to the symmetric algebra. -/
@[instance_reducible] noncomputable def symmetricAlgebraAction
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : MulSemiringAction Γ (SymmetricAlgebra k V) := sorry

/-- The lifted action fixes scalars.  This is stated separately because it is exactly the
hypothesis used by Mathlib's `Algebra k (SkewMonoidAlgebra _ _)` instance. -/
@[instance_reducible] noncomputable def symmetricAlgebraAction_smulComm
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := symmetricAlgebraAction k Γ V Vρ
    SMulCommClass Γ k (SymmetricAlgebra k V) := sorry

/-- The representation action lifted functorially to the exterior algebra. -/
@[instance_reducible] noncomputable def exteriorAlgebraAction
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : MulSemiringAction Γ (ExteriorAlgebra k V) := sorry

@[instance_reducible] noncomputable def exteriorAlgebraAction_smulComm
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := exteriorAlgebraAction k Γ V Vρ
    SMulCommClass Γ k (ExteriorAlgebra k V) := sorry

noncomputable def SymmetricSkewAlgebra
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : AlgCat k := by
  letI := symmetricAlgebraAction k Γ V Vρ
  letI := symmetricAlgebraAction_smulComm k Γ V Vρ
  exact AlgCat.of k (SkewGroupAlgebra (SymmetricAlgebra k V) Γ)

noncomputable def ExteriorSkewAlgebra
    (k Γ V : Type*) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : AlgCat k := by
  letI := exteriorAlgebraAction k Γ V Vρ
  letI := exteriorAlgebraAction_smulComm k Γ V Vρ
  exact AlgCat.of k (SkewGroupAlgebra (ExteriorAlgebra k V) Γ)

/-! ## Actual relative quadratic and Koszul carriers -/

/-- A finite-dimensional separable semisimple algebra.  Separability is projectivity over the
enveloping algebra, which applies to the noncommutative group algebra. -/
structure SeparableSemisimpleBase (k S : Type u) [Field k] [Ring S] [Algebra k S] : Prop where
  finiteDimensional : Module.Finite k S
  semisimple : IsSemisimpleRing S
  separable :
    letI : Module (TensorProduct k S (MulOpposite S)) S := TensorProduct.Algebra.module
    Module.Projective (TensorProduct k S (MulOpposite S)) S

/-- Finiteness and projectivity of the generator as a module over `S ⊗ Sᵐᵖᵖ`. -/
structure FiniteProjectiveBimodule (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] : Prop where
  finite :
    letI : Module (TensorProduct k S (MulOpposite S)) W := TensorProduct.Algebra.module
    Module.Finite (TensorProduct k S (MulOpposite S)) W
  projective :
    letI : Module (TensorProduct k S (MulOpposite S)) W := TensorProduct.Algebra.module
    Module.Projective (TensorProduct k S (MulOpposite S)) W

/-- Relations imposing the balanced tensor square `W ⊗_S W` on the ordinary `k`-tensor square. -/
noncomputable def relativeBalanceSubmodule
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
  [SMulCommClass S (MulOpposite S) W] : Submodule k (TensorProduct k W W) :=
  Submodule.span k {x | ∃ (s : S) (w₁ w₂ : W),
    x = (MulOpposite.op s • w₁) ⊗ₜ[k] w₂ - w₁ ⊗ₜ[k] (s • w₂)}

noncomputable abbrev BalancedTensorSquare
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :=
  (TensorProduct k W W) ⧸ relativeBalanceSubmodule k S W

/-- A concrete presentation of `T_S(W)`: start with the ordinary tensor algebra on `S ⊕ W`
and impose multiplication in `S`, its scalar map, and both bimodule actions. -/
noncomputable def relativeTensorRelators
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] : Set (TensorAlgebra k (S × W)) :=
  {x | (∃ s t : S, x = TensorAlgebra.ι k (s, 0) * TensorAlgebra.ι k (t, 0) -
        TensorAlgebra.ι k (s * t, 0)) ∨
      x = TensorAlgebra.ι k (1, 0) - 1 ∨
      (∃ r : k, x = TensorAlgebra.ι k (algebraMap k S r, 0) - algebraMap k _ r) ∨
      (∃ (s : S) (w : W), x = TensorAlgebra.ι k (0, s • w) -
        TensorAlgebra.ι k (s, 0) * TensorAlgebra.ι k (0, w)) ∨
      (∃ (s : S) (w : W), x = TensorAlgebra.ι k (0, MulOpposite.op s • w) -
        TensorAlgebra.ι k (0, w) * TensorAlgebra.ι k (s, 0))}

noncomputable def relativeTensorIdeal
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] : TwoSidedIdeal (TensorAlgebra k (S × W)) :=
  TwoSidedIdeal.span (relativeTensorRelators k S W)

noncomputable abbrev RelativeTensorAlgebra
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :=
  TensorAlgebra k (S × W) ⧸ (relativeTensorIdeal k S W).asIdeal

/-- The degree-two word map is defined on the balanced square, not on an unrelated generator
space. -/
noncomputable def relativeQuadraticWord
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :
    BalancedTensorSquare k S W →ₗ[k] RelativeTensorAlgebra k S W := sorry

noncomputable def relativeQuadraticIdeal
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    TwoSidedIdeal (RelativeTensorAlgebra k S W) :=
  TwoSidedIdeal.span (Set.range fun r : R ↦ relativeQuadraticWord k S W r.1)

noncomputable abbrev RelativeQuadraticAlgebra
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :=
  RelativeTensorAlgebra k S W ⧸ (relativeQuadraticIdeal k S W R).asIdeal

noncomputable def relativeQuadraticBaseMap
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    S →ₐ[k] RelativeQuadraticAlgebra k S W R := sorry

/-- The augmentation kills `W` and is the identity on the actual degree-zero copy of `S`. -/
noncomputable def relativeQuadraticAugmentation
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    RelativeQuadraticAlgebra k S W R →ₐ[k] S := sorry

theorem relativeQuadraticAugmentation_base
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    (relativeQuadraticAugmentation k S W R).comp (relativeQuadraticBaseMap k S W R) =
      AlgHom.id k S := sorry

/-- The right bimodule dual `Wᵛ = Hom_{Sᵐᵖᵖ}(W,S)`. -/
abbrev RightBimoduleDual (S W : Type u) [Ring S] [AddCommGroup W]
    [Module (MulOpposite S) W] :=
  W →ₗ[MulOpposite S] S

/-- The reversed right action on the right dual is induced by precomposition with the left action
on `W`; the `k`- and left-`S` actions are the canonical linear-map instances. -/
@[instance_reducible] noncomputable def rightDualRightModule
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :
    Module (MulOpposite S) (RightBimoduleDual S W) := sorry

@[instance_reducible] noncomputable def rightDualScalarTowerRight
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :
    letI := rightDualRightModule k S W
    IsScalarTower k (MulOpposite S) (RightBimoduleDual S W) := sorry

@[instance_reducible] noncomputable def rightDualActionsCommute
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :
    letI := rightDualRightModule k S W
    SMulCommClass S (MulOpposite S) (RightBimoduleDual S W) := sorry

/-- Evaluation descends through both balancing relations.  Its restriction to `R` defines the
actual relative annihilator in `Wᵛ ⊗_S Wᵛ`. -/
noncomputable def rightDualBalancedQuadraticPairing
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W] :
    letI := rightDualRightModule k S W
    letI := rightDualScalarTowerRight k S W
    letI := rightDualActionsCommute k S W
    BalancedTensorSquare k S (RightBimoduleDual S W) →ₗ[k]
      Module.Dual k (BalancedTensorSquare k S W) := sorry

noncomputable def rightDualOrthogonalRelations
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    letI := rightDualRightModule k S W
    letI := rightDualScalarTowerRight k S W
    letI := rightDualActionsCommute k S W
    Submodule k (BalancedTensorSquare k S (RightBimoduleDual S W)) :=
  { carrier := {f | ∀ r : R, rightDualBalancedQuadraticPairing k S W f r.1 = 0}
    zero_mem' := by simp
    add_mem' := by intro f g hf hg r; simp [hf r, hg r]
    smul_mem' := by intro c f hf r; simp [hf r] }

/-- The right relative quadratic dual is the fixed quotient `T_S(Wᵛ)/(R⊥)`. -/
noncomputable def RelativeQuadraticDualAlgebra
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) : AlgCat k := by
  letI := rightDualRightModule k S W
  letI : IsScalarTower k (MulOpposite S) (RightBimoduleDual S W) :=
    rightDualScalarTowerRight k S W
  letI : SMulCommClass S (MulOpposite S) (RightBimoduleDual S W) :=
    rightDualActionsCommute k S W
  exact AlgCat.of k (RelativeQuadraticAlgebra k S (RightBimoduleDual S W)
    (rightDualOrthogonalRelations k S W R))

/-- The terms below are fixed balanced terms `B ⊗_S K_n`, where `K_n` is the standard
intersection of `W`-tensor powers determined by `R`; the carrier is a definition, not a field of
the resolution package. -/
noncomputable def relativeKoszulTerm
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) (n : ℕ) :
    ModuleCat.{u} (RelativeQuadraticAlgebra k S W R) := sorry

/-- `S` as the augmentation module over `T_S(W)/(R)`. -/
noncomputable def relativeAugmentationModule
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) :
    ModuleCat.{u} (RelativeQuadraticAlgebra k S W R) := sorry

/-- An honest linear projective resolution of the fixed augmentation module by the fixed Koszul
terms.  No arbitrary algebra, term carrier, or augmentation is stored here. -/
structure RelativeLinearKoszulResolution
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (R : Submodule k (BalancedTensorSquare k S W)) where
  d : ∀ n, relativeKoszulTerm k S W R (n + 1) →ₗ[RelativeQuadraticAlgebra k S W R]
    relativeKoszulTerm k S W R n
  d_squared : ∀ n, (d n).comp (d (n + 1)) = 0
  augmentation : relativeKoszulTerm k S W R 0 →ₗ[RelativeQuadraticAlgebra k S W R]
    relativeAugmentationModule k S W R
  augmentation_d : augmentation.comp (d 0) = 0
  exact_positive : ∀ n, Function.Exact (d (n + 1)) (d n)
  exact_zero : Function.Exact (d 0) augmentation
  projective : ∀ n, Module.Projective (RelativeQuadraticAlgebra k S W R)
    (relativeKoszulTerm k S W R n)

/-! ### Polynomial/exterior skew algebras as the fixed relative example -/

abbrev SkewDegreeOne (Γ V : Type*) [Zero V] := Γ →₀ V

@[instance_reducible] noncomputable def skewDegreeOneLeftModule
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : Module (MonoidAlgebra k Γ) (SkewDegreeOne Γ V) := sorry

@[instance_reducible] noncomputable def skewDegreeOneRightModule
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    Module (MulOpposite (MonoidAlgebra k Γ)) (SkewDegreeOne Γ V) := sorry

@[instance_reducible] noncomputable def skewDegreeOneScalarTowerLeft
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    IsScalarTower k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V) := sorry

@[instance_reducible] noncomputable def skewDegreeOneScalarTowerRight
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := skewDegreeOneRightModule k Γ V Vρ
    IsScalarTower k (MulOpposite (MonoidAlgebra k Γ)) (SkewDegreeOne Γ V) := sorry

@[instance_reducible] noncomputable def skewDegreeOneActionsCommute
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    letI := skewDegreeOneRightModule k Γ V Vρ
    SMulCommClass (MonoidAlgebra k Γ) (MulOpposite (MonoidAlgebra k Γ))
      (SkewDegreeOne Γ V) := sorry

noncomputable def polynomialSkewRelations
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    letI := skewDegreeOneRightModule k Γ V Vρ
    letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
    letI := skewDegreeOneScalarTowerRight k Γ V Vρ
    letI := skewDegreeOneActionsCommute k Γ V Vρ
    Submodule k (BalancedTensorSquare k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V)) := sorry

noncomputable def PolynomialRelativeAlgebra
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : AlgCat k := by
  letI := skewDegreeOneLeftModule k Γ V Vρ
  letI := skewDegreeOneRightModule k Γ V Vρ
  letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
  letI := skewDegreeOneScalarTowerRight k Γ V Vρ
  letI := skewDegreeOneActionsCommute k Γ V Vρ
  exact AlgCat.of k (RelativeQuadraticAlgebra k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V)
    (polynomialSkewRelations k Γ V Vρ))

theorem groupAlgebra_separableSemisimple
    (k Γ : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] :
    SeparableSemisimpleBase k (MonoidAlgebra k Γ) := sorry

theorem skewDegreeOne_finiteProjective
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    letI := skewDegreeOneRightModule k Γ V Vρ
    letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
    letI := skewDegreeOneScalarTowerRight k Γ V Vρ
    letI := skewDegreeOneActionsCommute k Γ V Vρ
    FiniteProjectiveBimodule k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V) := sorry

theorem rightDual_finiteProjective
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (hW : FiniteProjectiveBimodule k S W) :
    letI := rightDualRightModule k S W
    letI := rightDualScalarTowerRight k S W
    letI := rightDualActionsCommute k S W
    FiniteProjectiveBimodule k S (RightBimoduleDual S W) := sorry

noncomputable def polynomialSkew_relativePresentation
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    PolynomialRelativeAlgebra k Γ V Vρ ≃ₐ[k] SymmetricSkewAlgebra k Γ V Vρ := sorry

noncomputable def polynomialSkew_relativeKoszul
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    letI := skewDegreeOneRightModule k Γ V Vρ
    letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
    letI := skewDegreeOneScalarTowerRight k Γ V Vρ
    letI := skewDegreeOneActionsCommute k Γ V Vρ
    RelativeLinearKoszulResolution k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V)
      (polynomialSkewRelations k Γ V Vρ) := sorry

/-- The actual right-dual quotient attached to the polynomial skew presentation. -/
noncomputable def PolynomialSkewQuadraticDualAlgebra
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) : AlgCat k := by
  letI := skewDegreeOneLeftModule k Γ V Vρ
  letI := skewDegreeOneRightModule k Γ V Vρ
  letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
  letI := skewDegreeOneScalarTowerRight k Γ V Vρ
  letI := skewDegreeOneActionsCommute k Γ V Vρ
  exact RelativeQuadraticDualAlgebra k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V)
    (polynomialSkewRelations k Γ V Vρ)

/-- With the pinned left convention `T_{k[Γ]}(Wᵛ)/(R⊥)` is the exterior skew algebra on
`V∗`.  The source is the fixed right-dual quotient above, not another symmetric algebra. -/
noncomputable def polynomialSkew_quadraticDualEquiv
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    PolynomialSkewQuadraticDualAlgebra k Γ V Vρ ≃ₐ[k]
      ExteriorSkewAlgebra k Γ (Module.Dual k V) (Representation.dual Vρ) := sorry

noncomputable def polynomialQuadraticDualGrading
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    ℕ → Submodule k
      (PolynomialSkewQuadraticDualAlgebra k Γ V Vρ) := sorry

noncomputable def exteriorSkewGrading
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    ℕ → Submodule k
      (ExteriorSkewAlgebra k Γ (Module.Dual k V) (Representation.dual Vρ)) := sorry

theorem polynomialSkew_quadraticDualEquiv_preserves_grading
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ]
    [Invertible (Nat.card Γ : k)] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) (n : ℕ) :
    Submodule.map (polynomialSkew_quadraticDualEquiv k Γ V Vρ).toLinearMap
        (polynomialQuadraticDualGrading k Γ V Vρ n) =
      exteriorSkewGrading k Γ V Vρ n := sorry

/-! ## Literal full-idempotent corners -/

/-- An idempotent together with the equation needed to form its corner. -/
abbrev Idempotent (B : Type*) [Ring B] := {e : B // IsIdempotentElem e}

/-- The corner carrier `eBe`, with its defining equation visible. -/
def Corner (B : Type*) [Ring B] (e : Idempotent B) :=
  {x : B // (e : B) * x * (e : B) = x}

noncomputable instance cornerRing (B : Type*) [Ring B] (e : Idempotent B) :
    Ring (Corner B e) := sorry

noncomputable instance cornerAlgebra (k B : Type*) [Field k] [Ring B] [Algebra k B]
    (e : Idempotent B) : Algebra k (Corner B e) := sorry

/-- Primitive means that the idempotent has no nontrivial orthogonal idempotent decomposition;
this is the matrix-idempotent condition, not central primitivity. -/
def IsPrimitiveMatrixIdempotent {B : Type*} [Ring B] (e : B) : Prop :=
  IsIdempotentElem e ∧ e ≠ 0 ∧
    ∀ f g : B, IsIdempotentElem f → IsIdempotentElem g →
      f * g = 0 → g * f = 0 → e = f + g → f = 0 ∨ g = 0

/-- One literal primitive matrix idempotent in each irreducible Wedderburn block. -/
structure PrimitiveMatrixIdempotents (k G : Type*) [Field k] [Group G]
    (D : IrrepFamily k G) where
  e : D.ι → MonoidAlgebra k G
  primitive : ∀ i, IsPrimitiveMatrixIdempotent (e i)
  orthogonal : ∀ i j, i ≠ j → e i * e j = 0
  chosen_column : ∀ i,
    Module.finrank k (LinearMap.range (Representation.asAlgebraHom (D.rep i).ρ (e i))) = 1
  other_blocks_zero : ∀ i j, i ≠ j →
    Representation.asAlgebraHom (D.rep j).ρ (e i) = 0

noncomputable def PrimitiveMatrixIdempotents.sum {k G : Type*} [Field k] [Group G]
    {D : IrrepFamily k G} (E : PrimitiveMatrixIdempotents k G D) : MonoidAlgebra k G :=
  ∑ i, E.e i

theorem PrimitiveMatrixIdempotents.sum_idempotent {k G : Type*} [Field k] [Group G]
    {D : IrrepFamily k G} (E : PrimitiveMatrixIdempotents k G D) :
    IsIdempotentElem E.sum := sorry

/-- The actual degree-`d`, `(e_j,e_i)` corner inside `B`. -/
def GradedCorner (k B : Type*) [Field k] [Ring B] [Algebra k B]
    (piece : Submodule k B) (eⱼ eᵢ : Idempotent B) :=
  {x : B // x ∈ piece ∧ (eⱼ : B) * x * (eᵢ : B) = x}

noncomputable instance gradedCornerAddCommGroup (k B : Type*) [Field k] [Ring B] [Algebra k B]
    (piece : Submodule k B) (eⱼ eᵢ : Idempotent B) :
    AddCommGroup (GradedCorner k B piece eⱼ eᵢ) := sorry

noncomputable instance gradedCornerModule (k B : Type*) [Field k] [Ring B] [Algebra k B]
    (piece : Submodule k B) (eⱼ eᵢ : Idempotent B) :
    Module k (GradedCorner k B piece eⱼ eᵢ) := sorry

/-- Mathlib does not yet derive Morita equivalence from a full idempotent; this is the honest
missing theorem, with the target fixed to the literal corner. -/
noncomputable def moritaEquivalenceOfFullIdempotent
    (k B : Type u) [Field k] [Ring B] [Algebra k B]
    (e : Idempotent B) (full : TwoSidedIdeal.span ({(e : B)} : Set B) = ⊤) :
    MoritaEquivalence k B (Corner B e) := sorry

noncomputable instance cornerFiniteDimensional
    (k B : Type u) [Field k] [Ring B] [Algebra k B] [FiniteDimensional k B]
    (e : Idempotent B) : FiniteDimensional k (Corner B e) := sorry

noncomputable def groupBasicIdempotent
    (k G : Type u) [Field k] [Group G] {D : IrrepFamily k G}
    (E : PrimitiveMatrixIdempotents k G D) : Idempotent (MonoidAlgebra k G) :=
  ⟨E.sum, E.sum_idempotent⟩

/-- The degree-zero corner selected by the actual one-per-block matrix system is basic in the
existing quiver-roadmap sense. -/
theorem groupAlgebraCorner_isBasic
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] (D : IrrepFamily k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    TauCetiRoadmap.RepresentationTheory.QuiverRepresentations.IsBasic k
      (Corner (MonoidAlgebra k G) (groupBasicIdempotent k G E)) := sorry

noncomputable def symmetricSkewGrading
    (k G : Type u) [Field k] [Group G] (V : FDRep k G) :
    ℕ → Submodule k (SymmetricSkewAlgebra k G V V.ρ) := sorry

noncomputable def symmetricGroupAlgebraMap
    (k G : Type u) [Field k] [Group G] (V : FDRep k G) :
    MonoidAlgebra k G →ₐ[k] SymmetricSkewAlgebra k G V V.ρ := sorry

noncomputable def symmetricVertexIdempotent
    (k G : Type u) [Field k] [Group G] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) (i : D.ι) :
    Idempotent (SymmetricSkewAlgebra k G V V.ρ) :=
  ⟨symmetricGroupAlgebraMap k G V (E.e i), by
    simpa using (E.primitive i).1.map (symmetricGroupAlgebraMap k G V).toRingHom⟩

noncomputable def symmetricBasicIdempotent
    (k G : Type u) [Field k] [Group G] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    Idempotent (SymmetricSkewAlgebra k G V V.ρ) :=
  ⟨symmetricGroupAlgebraMap k G V E.sum, by
    simpa using E.sum_idempotent.map (symmetricGroupAlgebraMap k G V).toRingHom⟩

theorem symmetricBasicIdempotent_full
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    TwoSidedIdeal.span ({(symmetricBasicIdempotent k G V E :
      SymmetricSkewAlgebra k G V V.ρ)} : Set _) = ⊤ := sorry

/-- The arrow space is now literally `e_j B₁ e_i`, with the later-factor-first order visible in
the subtype and no arbitrary replacement carrier. -/
noncomputable def symmetricMcKayArrowEquiv
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] (D : IrrepFamily k G) (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) (j i : D.ι) :
    GradedCorner k (SymmetricSkewAlgebra k G V V.ρ) (symmetricSkewGrading k G V 1)
        (symmetricVertexIdempotent k G V E j) (symmetricVertexIdempotent k G V E i) ≃ₗ[k]
      (D.rep j ⟶ (V ⊗ D.rep i)) := sorry

noncomputable def exteriorSkewGradingByDegree
    (k G : Type u) [Field k] [Group G] (V : FDRep k G) :
    ℕ → Submodule k (ExteriorSkewAlgebra k G V V.ρ) := sorry

noncomputable def exteriorGroupAlgebraMap
    (k G : Type u) [Field k] [Group G] (V : FDRep k G) :
    MonoidAlgebra k G →ₐ[k] ExteriorSkewAlgebra k G V V.ρ := sorry

noncomputable def exteriorBasicIdempotent
    (k G : Type u) [Field k] [Group G] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    Idempotent (ExteriorSkewAlgebra k G V V.ρ) :=
  ⟨exteriorGroupAlgebraMap k G V E.sum, by
    simpa using E.sum_idempotent.map (exteriorGroupAlgebraMap k G V).toRingHom⟩

theorem exteriorBasicIdempotent_full
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    TwoSidedIdeal.span ({(exteriorBasicIdempotent k G V E :
      ExteriorSkewAlgebra k G V V.ρ)} : Set _) = ⊤ := sorry

noncomputable instance exteriorSkewFiniteDimensional
    (k G : Type u) [Field k] [Group G] [Fintype G] (V : FDRep k G) :
    FiniteDimensional k (ExteriorSkewAlgebra k G V V.ρ) := sorry

/-- The finite-dimensional exterior corner, rather than merely its degree-zero group-algebra
subcorner, is basic in the existing quiver-roadmap sense. -/
theorem exteriorSkewCorner_isBasic
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    TauCetiRoadmap.RepresentationTheory.QuiverRepresentations.IsBasic k
      (Corner (ExteriorSkewAlgebra k G V V.ρ) (exteriorBasicIdempotent k G V E)) := sorry

/-- These are the Morita equivalences *derived* from the two fullness theorems. -/
noncomputable def symmetricSkew_moritaBasicCorner
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    MoritaEquivalence k (SymmetricSkewAlgebra k G V V.ρ)
      (Corner (SymmetricSkewAlgebra k G V V.ρ) (symmetricBasicIdempotent k G V E)) :=
  moritaEquivalenceOfFullIdempotent k _ _ (symmetricBasicIdempotent_full k G V E)

noncomputable def exteriorSkew_moritaBasicCorner
    (k G : Type u) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {D : IrrepFamily k G} (V : FDRep k G)
    (E : PrimitiveMatrixIdempotents k G D) :
    MoritaEquivalence k (ExteriorSkewAlgebra k G V V.ρ)
      (Corner (ExteriorSkewAlgebra k G V V.ρ) (exteriorBasicIdempotent k G V E)) :=
  moritaEquivalenceOfFullIdempotent k _ _ (exteriorBasicIdempotent_full k G V E)

/-- A fixed orientation of each standard affine ADE graph, chosen by the vertex numbering. -/
abbrev StandardADEOrientation (tag : NamedAffineADE) := Fin tag.vertexCount

instance standardADEOrientationQuiver (tag : NamedAffineADE) :
    Quiver (StandardADEOrientation tag) where
  Hom i j := PLift (i.1 < j.1 ∧ tag.standardGraph.Adj i j)

noncomputable instance standardADEOrientationHomFintype (tag : NamedAffineADE)
    (i j : StandardADEOrientation tag) : Fintype (i ⟶ j) := by
  classical
  exact PLift.fintypeProp _

/-- Huerfano--Khovanov's binary-subgroup exterior corner, on the literal full corner.  The
`IsBinary` hypothesis excludes all cyclic cases, including the double-edge `C₂` matrix. -/
noncomputable def binaryExteriorCornerEquivZigzag
    {G : Type} [Group G] [Fintype G] (D : IrrepFamily ℂ G) (V : FDRep ℂ G)
    {tag : NamedAffineADE} (M : NamedMcKayIdentification D V tag)
    (binary : tag.IsBinary) (E : PrimitiveMatrixIdempotents ℂ G D) :
    Corner (ExteriorSkewAlgebra ℂ G V V.ρ) (exteriorBasicIdempotent ℂ G V E) ≃ₐ[ℂ]
      ZigzagPreprojective.zigzagAlgebra ℂ tag.standardGraph := sorry

/-- The companion relation-level polynomial corner is the additive preprojective algebra in the
pinned later-factor-first path convention. -/
noncomputable def binarySymmetricCornerEquivPreprojective
    {G : Type} [Group G] [Fintype G] (D : IrrepFamily ℂ G) (V : FDRep ℂ G)
    {tag : NamedAffineADE} (M : NamedMcKayIdentification D V tag)
    (binary : tag.IsBinary) (E : PrimitiveMatrixIdempotents ℂ G D) :
    Corner (SymmetricSkewAlgebra ℂ G V V.ρ) (symmetricBasicIdempotent ℂ G V E) ≃ₐ[ℂ]
      ZigzagPreprojective.preprojectiveAlgebra ℂ (StandardADEOrientation tag) := sorry

/-- The Crawley--Boevey--Holland relator in Tau Ceti's path convention. -/
noncomputable def deformedPreprojectiveRelator (k : Type*) (Q : Type u)
    [Field k] [Quiver Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → k) :
    TauCeti.pathAlgebra k (Quiver.Symmetrify Q) :=
  ZigzagPreprojective.preprojectiveRelator k Q -
    ∑ i, weight i • TauCeti.PathAlgebra.vertexIdempotent k
      (show Quiver.Symmetrify Q from i)

noncomputable def deformedPreprojectiveIdeal (k : Type*) (Q : Type u)
    [Field k] [Quiver Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → k) :
    TwoSidedIdeal (TauCeti.pathAlgebra k (Quiver.Symmetrify Q)) :=
  TwoSidedIdeal.span ({deformedPreprojectiveRelator k Q weight} : Set _)

noncomputable abbrev DeformedPreprojectiveAlgebra (k : Type*) (Q : Type u)
    [Field k] [Quiver Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → k) :=
  TauCeti.pathAlgebra k (Quiver.Symmetrify Q) ⧸ (deformedPreprojectiveIdeal k Q weight).asIdeal

theorem deformedPreprojective_zero (k : Type*) (Q : Type u)
    [Field k] [Quiver Q] [Fintype Q] [∀ i j : Q, Fintype (i ⟶ j)] :
    Nonempty (DeformedPreprojectiveAlgebra k Q 0 ≃ₐ[k]
      ZigzagPreprojective.preprojectiveAlgebra k Q) := sorry

/-- The relative tensor algebra underlying the CBH deformation, before the commutator relation. -/
noncomputable def PolynomialRelativeTensorAlgebra
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) : AlgCat k := by
  letI := skewDegreeOneLeftModule k Γ V Vρ
  letI := skewDegreeOneRightModule k Γ V Vρ
  letI := skewDegreeOneScalarTowerLeft k Γ V Vρ
  letI := skewDegreeOneScalarTowerRight k Γ V Vρ
  letI := skewDegreeOneActionsCommute k Γ V Vρ
  exact AlgCat.of k (RelativeTensorAlgebra k (MonoidAlgebra k Γ) (SkewDegreeOne Γ V))

/-- The canonical degree-zero group-algebra map and degree-one generator of `T_{k[Γ]}(W)`. -/
noncomputable def cbhGroupAlgebraMap
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    MonoidAlgebra k Γ →ₐ[k] PolynomialRelativeTensorAlgebra k Γ V Vρ := sorry

noncomputable def cbhDegreeOneGenerator
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) :
    V →ₗ[k] PolynomialRelativeTensorAlgebra k Γ V Vρ := sorry

/-- The CBH sign is pinned literally: the sole relation is `[x,y]-z`, not `[x,y]+z` and not a
vertexwise relation with a hidden order normalization. -/
noncomputable def cbhRelator
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) (x y : V) (z : MonoidAlgebra k Γ) :
    PolynomialRelativeTensorAlgebra k Γ V Vρ :=
  cbhDegreeOneGenerator k Γ V Vρ x * cbhDegreeOneGenerator k Γ V Vρ y -
    cbhDegreeOneGenerator k Γ V Vρ y * cbhDegreeOneGenerator k Γ V Vρ x -
      cbhGroupAlgebraMap k Γ V Vρ z

noncomputable def cbhIdeal
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) (x y : V) (z : MonoidAlgebra k Γ) :
    TwoSidedIdeal (PolynomialRelativeTensorAlgebra k Γ V Vρ) :=
  TwoSidedIdeal.span ({cbhRelator k Γ V Vρ x y z} : Set _)

noncomputable def CBHSkewDeformation
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) (x y : V) (z : MonoidAlgebra k Γ) : AlgCat k :=
  AlgCat.of k (PolynomialRelativeTensorAlgebra k Γ V Vρ ⧸
    (cbhIdeal k Γ V Vρ x y z).asIdeal)

/-- CBH's vertex parameter: the scalar by which the central element `z` acts on `ρ_i`.  Dividing
the trace by `dim ρ_i` is not a rescaling, it is the definition -- cutting `[x,y]-z` down to a
primitive matrix idempotent gives `e_i z e_i = λ_i e_i`, and `Tr_{ρ_i}(z) = λ_i · dim ρ_i`.  The
trace and the scalar agree only when `ρ_i` is one-dimensional, so they agree throughout the cyclic
families and differ for binary dihedral and for `Ẽ₆`, `Ẽ₇`, `Ẽ₈`. -/
noncomputable def cbhVertexWeight {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G) : D.ι → ℂ :=
  fun i ↦ LinearMap.trace ℂ (D.rep i) (Representation.asAlgebraHom (D.rep i).ρ z) /
    (D.dimension i : ℂ)

/-- The characterizing property: on a simple module a central element acts by its weight.  This is
the equation the corner comparison uses, and it is what fails for the trace normalization. -/
theorem cbhVertexWeight_asAlgebraHom {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G)
    (hz : z ∈ Subalgebra.center ℂ (MonoidAlgebra ℂ G)) (i : D.ι) :
    Representation.asAlgebraHom (D.rep i).ρ z = cbhVertexWeight D z i • LinearMap.id := sorry

/-- The block-scalar description of the center, of which the weight is the `i`th coordinate. -/
noncomputable def centerEquivWeights {G : Type u} [Group G] [Finite G]
    (D : IrrepFamily ℂ G) :
    Subalgebra.center ℂ (MonoidAlgebra ℂ G) ≃ₐ[ℂ] (D.ι → ℂ) := sorry

/-- A genuinely reversed orientation, kept on a distinct vertex type so the two quiver instances
cannot be confused by typeclass inference. -/
structure ReversedADEOrientation (tag : NamedAffineADE) where
  val : Fin tag.vertexCount

instance (tag : NamedAffineADE) : Fintype (ReversedADEOrientation tag) :=
  Fintype.ofEquiv (Fin tag.vertexCount)
    { toFun := ReversedADEOrientation.mk
      invFun := ReversedADEOrientation.val
      left_inv := by intro; rfl
      right_inv := by intro x; cases x; rfl }

instance reversedADEOrientationQuiver (tag : NamedAffineADE) :
    Quiver (ReversedADEOrientation tag) where
  Hom i j := PLift (j.val.1 < i.val.1 ∧ tag.standardGraph.Adj i.val j.val)

noncomputable instance reversedADEOrientationHomFintype (tag : NamedAffineADE)
    (i j : ReversedADEOrientation tag) : Fintype (i ⟶ j) := by
  classical
  exact PLift.fintypeProp _

/-- Reversing every arrow and multiplying the chosen reverse arrows by `-1` transports the
later-factor-first relation without changing `λ`. -/
noncomputable def deformedPreprojective_reverseOrientation
    (k : Type*) [Field k] (tag : NamedAffineADE) (weight : Fin tag.vertexCount → k) :
    DeformedPreprojectiveAlgebra k (StandardADEOrientation tag) weight ≃ₐ[k]
      DeformedPreprojectiveAlgebra k (ReversedADEOrientation tag)
        (fun i ↦ weight i.val) := sorry

noncomputable def cbhQuotientGroupAlgebraMap
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) (x y : V) (z : MonoidAlgebra k Γ) :
    MonoidAlgebra k Γ →ₐ[k] CBHSkewDeformation k Γ V Vρ x y z := sorry

noncomputable def cbhBasicIdempotent
    (k Γ V : Type u) [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (Vρ : Representation k Γ V) (x y : V) (z : MonoidAlgebra k Γ)
    {D : IrrepFamily k Γ} (E : PrimitiveMatrixIdempotents k Γ D) :
    Idempotent (CBHSkewDeformation k Γ V Vρ x y z) :=
  ⟨cbhQuotientGroupAlgebraMap k Γ V Vρ x y z E.sum, by
    simpa using E.sum_idempotent.map
      (cbhQuotientGroupAlgebraMap k Γ V Vρ x y z).toRingHom⟩

/-- Coordinate vectors for the determinant-one ordered basis used in the CBH commutator. -/
def standardCoordinateVector (i : Fin 2) : Fin 2 → ℂ := Pi.single i 1

theorem standardCoordinateVector_alternating :
    standardAlternatingForm (standardCoordinateVector 0) (standardCoordinateVector 1) = 1 := by
  simp [standardCoordinateVector, standardAlternatingForm]

theorem cbhBasicIdempotent_full
    {G : Type} [Group G] [Fintype G]
    (D : IrrepFamily ℂ G) (Vρ : Representation ℂ G (Fin 2 → ℂ))
    (E : PrimitiveMatrixIdempotents ℂ G D) (z : MonoidAlgebra ℂ G) :
    TwoSidedIdeal.span ({(cbhBasicIdempotent ℂ G (Fin 2 → ℂ) Vρ
      (standardCoordinateVector 0) (standardCoordinateVector 1) z E :
        CBHSkewDeformation ℂ G (Fin 2 → ℂ) Vρ
          (standardCoordinateVector 0) (standardCoordinateVector 1) z)} : Set _) = ⊤ := sorry

/-- The concrete CBH full-corner comparison uses the standard ordered coordinate basis, whose
determinant pairing is exactly one.  Thus `central` and `λ_i = Tr_{ρ_i}(z)` are the only
deformation data; there is no hidden rescaling by a freely chosen pair `x,y`. -/
noncomputable def cbhCornerEquivDeformedPreprojective
    {G : Type} [Group G] [Fintype G] (D : IrrepFamily ℂ G)
    (Vρ : Representation ℂ G (Fin 2 → ℂ))
    {tag : NamedAffineADE} (M : NamedMcKayIdentification D (FDRep.of Vρ) tag)
    (binary : tag.IsBinary) (E : PrimitiveMatrixIdempotents ℂ G D)
    (z : MonoidAlgebra ℂ G) (central : ∀ a, z * a = a * z) :
    Corner (CBHSkewDeformation ℂ G (Fin 2 → ℂ) Vρ
        (standardCoordinateVector 0) (standardCoordinateVector 1) z)
      (cbhBasicIdempotent ℂ G (Fin 2 → ℂ) Vρ
        (standardCoordinateVector 0) (standardCoordinateVector 1) z E) ≃ₐ[ℂ]
      DeformedPreprojectiveAlgebra ℂ (StandardADEOrientation tag)
        (fun i ↦ cbhVertexWeight D z (M.relabel.symm i)) := sorry

/-! ## FKS algebra-valued curvature and Weyl reflection formula -/

/-- The graded-algebra laws which are not contained in `InternalGrading` itself. -/
structure FKSGradedAlgebra (k A : Type*) [CommRing k] [Ring A] [Algebra k A] where
  grading : DGAInfinity.InternalGrading k A
  one_degree : grading.IsHomogeneous 0 1
  mul_degree : ∀ p q a b, grading.IsHomogeneous p a → grading.IsHomogeneous q b →
    grading.IsHomogeneous (p + q) (a * b)

/-- An algebra-valued potential is central and genuinely homogeneous of degree two. -/
structure CentralDegreeTwo {k A : Type*} [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) where
  val : A
  degree : B.grading.IsHomogeneous 2 val
  central : ∀ a, val * a = a * val

/-- A graded left FKS complex.  The action degree, scalar compatibility, degree-one differential,
square, and homogeneous supercommutation are all part of the interface. -/
structure FKSComplex (k A M : Type*) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M] [Module k M] [Module A M]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) where
  grading : DGAInfinity.InternalGrading k M
  scalar_tower : ∀ (r : k) (a : A) (m : M), (r • a) • m = r • (a • m)
  action_degree : ∀ p q a m, B.grading.IsHomogeneous p a → grading.IsHomogeneous q m →
    grading.IsHomogeneous (p + q) (a • m)
  d : M →ₗ[k] M
  d_degree : DGAInfinity.LinearHasDegree grading grading 1 d
  d_sq : ∀ m, d (d m) = c.val • m
  supercommutes : ∀ p a m, B.grading.IsHomogeneous p a →
    d (a • m) = (((p.negOnePow : ℤ) : k) • (a • d m))

/-- The parity version retains genuine internal gradings and degree-one maps; it is not merely a
pair of modules with two unconstrained arrows. -/
structure FKSDuplex (k A M₀ M₁ : Type*) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M₀] [Module k M₀] [Module A M₀]
    [AddCommGroup M₁] [Module k M₁] [Module A M₁]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) where
  grading₀ : DGAInfinity.InternalGrading k M₀
  grading₁ : DGAInfinity.InternalGrading k M₁
  scalar_tower₀ : ∀ (r : k) (a : A) (m : M₀), (r • a) • m = r • (a • m)
  scalar_tower₁ : ∀ (r : k) (a : A) (m : M₁), (r • a) • m = r • (a • m)
  action_degree₀ : ∀ p q a m, B.grading.IsHomogeneous p a → grading₀.IsHomogeneous q m →
    grading₀.IsHomogeneous (p + q) (a • m)
  action_degree₁ : ∀ p q a m, B.grading.IsHomogeneous p a → grading₁.IsHomogeneous q m →
    grading₁.IsHomogeneous (p + q) (a • m)
  dEven : M₀ →ₗ[k] M₁
  dOdd : M₁ →ₗ[k] M₀
  dEven_degree : DGAInfinity.LinearHasDegree grading₀ grading₁ 1 dEven
  dOdd_degree : DGAInfinity.LinearHasDegree grading₁ grading₀ 1 dOdd
  odd_even : ∀ m, dOdd (dEven m) = c.val • m
  even_odd : ∀ m, dEven (dOdd m) = c.val • m
  supercommutes_even : ∀ p a m, B.grading.IsHomogeneous p a →
    dEven (a • m) = (((p.negOnePow : ℤ) : k) • (a • dEven m))
  supercommutes_odd : ∀ p a m, B.grading.IsHomogeneous p a →
    dOdd (a • m) = (((p.negOnePow : ℤ) : k) • (a • dOdd m))

/-- A graded bimodule kernel from source curvature `c` to target curvature `c'`.  Its square is
exactly `l(c') - r(c)`, fixing the sign which tensoring needs. -/
structure FKSBimoduleDuplex (k A M₀ M₁ : Type*) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M₀] [Module k M₀] [Module A M₀] [Module Aᵐᵒᵖ M₀]
    [AddCommGroup M₁] [Module k M₁] [Module A M₁] [Module Aᵐᵒᵖ M₁]
    (B : FKSGradedAlgebra k A) (target source : CentralDegreeTwo B) where
  grading₀ : DGAInfinity.InternalGrading k M₀
  grading₁ : DGAInfinity.InternalGrading k M₁
  scalar_tower_left₀ : ∀ (r : k) (a : A) (m : M₀), (r • a) • m = r • (a • m)
  scalar_tower_left₁ : ∀ (r : k) (a : A) (m : M₁), (r • a) • m = r • (a • m)
  scalar_tower_right₀ : ∀ (r : k) (a : A) (m : M₀),
    MulOpposite.op (r • a) • m = r • (MulOpposite.op a • m)
  scalar_tower_right₁ : ∀ (r : k) (a : A) (m : M₁),
    MulOpposite.op (r • a) • m = r • (MulOpposite.op a • m)
  left_action_degree₀ : ∀ p q a m, B.grading.IsHomogeneous p a →
    grading₀.IsHomogeneous q m → grading₀.IsHomogeneous (p + q) (a • m)
  left_action_degree₁ : ∀ p q a m, B.grading.IsHomogeneous p a →
    grading₁.IsHomogeneous q m → grading₁.IsHomogeneous (p + q) (a • m)
  right_action_degree₀ : ∀ p q a m, B.grading.IsHomogeneous p a →
    grading₀.IsHomogeneous q m →
      grading₀.IsHomogeneous (q + p) (MulOpposite.op a • m)
  right_action_degree₁ : ∀ p q a m, B.grading.IsHomogeneous p a →
    grading₁.IsHomogeneous q m →
      grading₁.IsHomogeneous (q + p) (MulOpposite.op a • m)
  actions_commute₀ : ∀ (a b : A) (m : M₀),
    a • (MulOpposite.op b • m) = MulOpposite.op b • (a • m)
  actions_commute₁ : ∀ (a b : A) (m : M₁),
    a • (MulOpposite.op b • m) = MulOpposite.op b • (a • m)
  dEven : M₀ →ₗ[k] M₁
  dOdd : M₁ →ₗ[k] M₀
  dEven_degree : DGAInfinity.LinearHasDegree grading₀ grading₁ 1 dEven
  dOdd_degree : DGAInfinity.LinearHasDegree grading₁ grading₀ 1 dOdd
  odd_even : ∀ m, dOdd (dEven m) = target.val • m - MulOpposite.op source.val • m
  even_odd : ∀ m, dEven (dOdd m) = target.val • m - MulOpposite.op source.val • m
  supercommutes_left_even : ∀ p a m, B.grading.IsHomogeneous p a →
    dEven (a • m) = (((p.negOnePow : ℤ) : k) • (a • dEven m))
  supercommutes_left_odd : ∀ p a m, B.grading.IsHomogeneous p a →
    dOdd (a • m) = (((p.negOnePow : ℤ) : k) • (a • dOdd m))
  supercommutes_right_even : ∀ p a m, B.grading.IsHomogeneous p a →
    dEven (MulOpposite.op a • m) =
      (((p.negOnePow : ℤ) : k) • (MulOpposite.op a • dEven m))
  supercommutes_right_odd : ∀ p a m, B.grading.IsHomogeneous p a →
    dOdd (MulOpposite.op a • m) =
      (((p.negOnePow : ℤ) : k) • (MulOpposite.op a • dOdd m))

/-- FKS's stable quotient is the sibling roadmap's actual factor-through-projectives ideal. -/
noncomputable def fksProjectiveIdeal (C : Type u) [Category.{v} C] [Preadditive C] :
    StablePeriodicCurved.MorphismIdeal C :=
  StablePeriodicCurved.MorphismIdeal.factorIdeal fun X ↦ Projective X

/-- The left/right comparison explicitly consumes the stable prerequisite's right-curved model. -/
noncomputable def fksOppositeRightCurvedAlgebra
    (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) :
    StablePeriodicCurved.RightCurvedDGAlgebra k Aᵐᵒᵖ := sorry

/-- Coefficients of the FKS reflection `s_a(c)` in the degree-two center basis. -/
def reflectCenterParameter {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (a : V) (c : V → k) : V → k :=
  fun v ↦ c v + c a * ((if G.Adj a v then 1 else 0) - if a = v then 2 else 0)

@[simp] theorem reflectCenterParameter_at {k V : Type*} [CommRing k]
    (G : SimpleGraph V) [DecidableEq V] [DecidableRel G.Adj] (a : V) (c : V → k) :
    reflectCenterParameter G a c a = -c a := sorry

/-- Literal principal left and right corner modules. -/
def LeftVertexProjective (A : Type*) [Ring A] (e : Idempotent A) :=
  {x : A // x * (e : A) = x}

def RightVertexProjective (A : Type*) [Ring A] (e : Idempotent A) :=
  {x : A // (e : A) * x = x}

noncomputable instance (A : Type*) [Ring A] (e : Idempotent A) :
    AddCommGroup (LeftVertexProjective A e) := sorry
noncomputable instance (k A : Type*) [Field k] [Ring A] [Algebra k A] (e : Idempotent A) :
    Module k (LeftVertexProjective A e) := sorry
noncomputable instance (A : Type*) [Ring A] (e : Idempotent A) :
    Module A (LeftVertexProjective A e) := sorry
noncomputable instance (A : Type*) [Ring A] (e : Idempotent A) :
    AddCommGroup (RightVertexProjective A e) := sorry
noncomputable instance (k A : Type*) [Field k] [Ring A] [Algebra k A] (e : Idempotent A) :
    Module k (RightVertexProjective A e) := sorry
noncomputable instance (A : Type*) [Ring A] (e : Idempotent A) :
    Module Aᵐᵒᵖ (RightVertexProjective A e) := sorry

/-- The actual vertex idempotent in the sibling zigzag algebra. -/
noncomputable def zigzagVertexIdempotent
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    Idempotent (ZigzagPreprojective.zigzagAlgebra k G) := sorry

abbrev ZigzagReflectionTensor
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :=
  TensorProduct k
    (LeftVertexProjective (ZigzagPreprojective.zigzagAlgebra k G)
      (zigzagVertexIdempotent k G a))
    (RightVertexProjective (ZigzagPreprojective.zigzagAlgebra k G)
      (zigzagVertexIdempotent k G a))

noncomputable instance zigzagReflectionTensorLeftModule
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    Module (ZigzagPreprojective.zigzagAlgebra k G) (ZigzagReflectionTensor k G a) := sorry

noncomputable instance zigzagReflectionTensorRightModule
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    Module (ZigzagPreprojective.zigzagAlgebra k G)ᵐᵒᵖ
      (ZigzagReflectionTensor k G a) := sorry

/-- `m_a : Ae_a ⊗ e_aA → A` is literal multiplication. -/
noncomputable def zigzagVertexMultiplication
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    ZigzagReflectionTensor k G a →ₗ[k] ZigzagPreprojective.zigzagAlgebra k G := sorry

@[simp] theorem zigzagVertexMultiplication_tmul
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V)
    (x : LeftVertexProjective (ZigzagPreprojective.zigzagAlgebra k G)
      (zigzagVertexIdempotent k G a))
    (y : RightVertexProjective (ZigzagPreprojective.zigzagAlgebra k G)
      (zigzagVertexIdempotent k G a)) :
    zigzagVertexMultiplication k G a (x ⊗ₜ[k] y) = x.1 * y.1 := sorry

/-- `Δ_a` is the Frobenius coevaluation for the sibling roadmap's pinned trace. -/
noncomputable def zigzagVertexComultiplication
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V)
    (connected : G.Connected) (nontrivial : 1 < Fintype.card V) (a : V) :
    ZigzagPreprojective.zigzagAlgebra k G →ₗ[k] ZigzagReflectionTensor k G a := sorry

noncomputable def zigzagFKSGradedAlgebra
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) :
    FKSGradedAlgebra k (ZigzagPreprojective.zigzagAlgebra k G) := sorry

/-- The degree-two volume basis element `X_a` in the actual zigzag algebra. -/
noncomputable def zigzagVolumeClass
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    ZigzagPreprojective.zigzagAlgebra k G := sorry

theorem zigzagVolumeClass_degree_two
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    (zigzagFKSGradedAlgebra k G).grading.IsHomogeneous 2 (zigzagVolumeClass k G a) := sorry

theorem zigzagVolumeClass_central
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (a : V) :
    ∀ x, zigzagVolumeClass k G a * x = x * zigzagVolumeClass k G a := sorry

noncomputable def zigzagCenterParameter
    (k : Type*) [Field k] {V : Type u} [Fintype V] (G : SimpleGraph V) (c : V → k) :
    CentralDegreeTwo (zigzagFKSGradedAlgebra k G) where
  val := ∑ v, c v • zigzagVolumeClass k G v
  degree := sorry
  central := sorry

/-- The concrete reflection kernel `C_{a,-x_a}`.  Its maps alternate `Δ_a` and
`-x_a m_a`, and its two square fields state `l(s_a(c))-r(c)` verbatim. -/
noncomputable def fksReflectionKernel
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (a : V) (c : V → k) :
    FKSBimoduleDuplex k (ZigzagPreprojective.zigzagAlgebra k G)
      (ZigzagPreprojective.zigzagAlgebra k G) (ZigzagReflectionTensor k G a)
      (zigzagFKSGradedAlgebra k G)
      (zigzagCenterParameter k G (reflectCenterParameter G a c))
      (zigzagCenterParameter k G c) := by
  refine
    { grading₀ := (zigzagFKSGradedAlgebra k G).grading
      grading₁ := ?_
      scalar_tower_left₀ := ?_
      scalar_tower_left₁ := ?_
      scalar_tower_right₀ := ?_
      scalar_tower_right₁ := ?_
      left_action_degree₀ := ?_
      left_action_degree₁ := ?_
      right_action_degree₀ := ?_
      right_action_degree₁ := ?_
      actions_commute₀ := ?_
      actions_commute₁ := ?_
      dEven := zigzagVertexComultiplication k G connected nontrivial a
      dOdd := (-c a) • zigzagVertexMultiplication k G a
      dEven_degree := ?_
      dOdd_degree := ?_
      odd_even := ?_
      even_odd := ?_
      supercommutes_left_even := ?_
      supercommutes_left_odd := ?_
      supercommutes_right_even := ?_
      supercommutes_right_odd := ?_ }
  all_goals sorry

/-- Objects of the actual FKS homotopy category at fixed curvature. -/
structure FKSObject (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) where
  carrier : ModuleCat.{0} A
  complex :
    letI : Module k carrier := Module.compHom carrier (algebraMap k A)
    FKSComplex k A carrier B c

/-- The homotopy category is built from the preceding fixed objects, shifts, cones and the
sibling curved-duplex boundary formula. -/
noncomputable def FKSComplexHomotopyCategory
    (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) : Type (max u 1) := FKSObject k A B c

noncomputable instance fksComplexHomotopyCategory
    (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) :
    Category.{max u 1} (FKSComplexHomotopyCategory k A B c) := sorry

noncomputable instance fksComplexHomotopyPreadditive
    (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) :
    Preadditive (FKSComplexHomotopyCategory k A B c) := sorry

abbrev FKSStableCategory
    (k A : Type u) [CommRing k] [Ring A] [Algebra k A]
    (B : FKSGradedAlgebra k A) (c : CentralDegreeTwo B) : Type (max u 1) :=
  CategoryTheory.Quotient
    (StablePeriodicCurved.MorphismIdeal.rel
      (fksProjectiveIdeal (FKSComplexHomotopyCategory k A B c)))

/-- Tensoring with the literal kernel above, followed by the sibling factor-ideal quotient. -/
noncomputable def fksReflectionTensorFunctor
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (a : V) (c : V → k) :
    FKSStableCategory k _ (zigzagFKSGradedAlgebra k G) (zigzagCenterParameter k G c) ⥤
      FKSStableCategory k _ (zigzagFKSGradedAlgebra k G)
        (zigzagCenterParameter k G (reflectCenterParameter G a c)) := sorry

theorem fksReflectionTensorFunctor_isEquivalence
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (a : V) (c : V → k) (ha : c a ≠ 0) :
    CategoryTheory.Functor.IsEquivalence
      (fksReflectionTensorFunctor k G connected nontrivial a c) := sorry

/-- The reflection orbit and the exact genericity condition used in FKS's Weyl-action theorem. -/
inductive ReflectionReachable {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (c : V → k) : (V → k) → Prop
  | base : ReflectionReachable G c c
  | reflect {c'} : ReflectionReachable G c c' → (a : V) →
      ReflectionReachable G c (reflectCenterParameter G a c')

def FKSGeneric {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (c : V → k) : Prop :=
  ∀ c', ReflectionReachable G c c' → ∀ a, c' a ≠ 0

/-- The orbit Grothendieck category packages all curvature fibres, so the braid statements below
are natural isomorphisms between endofunctors rather than ill-typed maps between different fibres. -/
noncomputable def FKSOrbitStableCategory
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) : Type u := sorry

noncomputable instance fksOrbitStableCategory
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) :
    Category (FKSOrbitStableCategory k G connected nontrivial c) := sorry

noncomputable def fksOrbitReflectionFunctor
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) (a : V) :
    FKSOrbitStableCategory k G connected nontrivial c ⥤
      FKSOrbitStableCategory k G connected nontrivial c := sorry

noncomputable def fksReflection_commutes
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) (a b : V) (hab : ¬ G.Adj a b) :
    fksOrbitReflectionFunctor k G connected nontrivial c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c b ≅
      fksOrbitReflectionFunctor k G connected nontrivial c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c a := sorry

noncomputable def fksReflection_braid
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) (a b : V) (hab : G.Adj a b) :
    fksOrbitReflectionFunctor k G connected nontrivial c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c a ≅
      fksOrbitReflectionFunctor k G connected nontrivial c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial c b := sorry

theorem fksOrbitReflection_isEquivalence_of_generic
    (k : Type*) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (connected : G.Connected)
    (nontrivial : 1 < Fintype.card V) (c : V → k) (generic : FKSGeneric G c) (a : V) :
    CategoryTheory.Functor.IsEquivalence
      (fksOrbitReflectionFunctor k G connected nontrivial c a) := sorry

/-- The flagship `Ẽ₈` target uses the concrete nine-vertex sibling graph and kernel. -/
noncomputable def affineE8FKSReflectionKernel (a : Fin 9) (c : Fin 9 → ℂ) :
    FKSBimoduleDuplex ℂ (ZigzagPreprojective.zigzagAlgebra ℂ
        ZigzagPreprojective.affineE8Graph)
      (ZigzagPreprojective.zigzagAlgebra ℂ ZigzagPreprojective.affineE8Graph)
      (ZigzagReflectionTensor ℂ ZigzagPreprojective.affineE8Graph a)
      (zigzagFKSGradedAlgebra ℂ ZigzagPreprojective.affineE8Graph)
      (zigzagCenterParameter ℂ ZigzagPreprojective.affineE8Graph
        (reflectCenterParameter ZigzagPreprojective.affineE8Graph a c))
      (zigzagCenterParameter ℂ ZigzagPreprojective.affineE8Graph c) :=
  fksReflectionKernel ℂ ZigzagPreprojective.affineE8Graph
    (by native_decide) (by native_decide) a c

/-! ## Executable integration checks -/

theorem cyclic_three_regular_sum_sq : ∑ _i : Fin 3, (1 : ℕ) ^ 2 = 3 := by native_decide

theorem binaryDihedral_regular_sum_sq (n : ℕ) (hn : 2 ≤ n) :
    4 * 1 ^ 2 + (n - 1) * 2 ^ 2 = 4 * n := by omega

theorem affineE8_zigzag_dimension :
    2 * 9 + 2 * ZigzagPreprojective.affineE8Graph.edgeFinset.card = 34 :=
  ZigzagPreprojective.zigzagDimension_affineE8

end TauCetiRoadmap.McKaySkewGroup

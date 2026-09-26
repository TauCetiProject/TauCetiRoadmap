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
  /-- The representation lands in `SL₂`, equivalently preserves a nondegenerate alternating form.

  ⚠ Self-duality and the graph tag do **not** imply this, and `IsBinary` is a condition on the tag,
  not on the supplied representation.  The ordinary dihedral group of order eight has the faithful
  representation generated by `r = diag(i, −i)` and `s = [[0,1],[1,0]]`; it is self-dual and has
  exactly the affine `D₄` McKay graph and dimensions `(1,1,1,1,2)` of `Q₈`, since tensoring its
  two-dimensional irreducible with any character returns that irreducible and its tensor square is
  the sum of the four characters.  But `det s = −1`, and the relations change: the top exterior
  power is the nontrivial determinant character, so the degree-two exterior corner connects a
  vertex to its determinant twist rather than giving the required loop at every vertex, and in the
  CBH target with
  `z = 1`, conjugation by `s` exchanges `x` and `y`, so `[x,y] = 1` also gives `−[x,y] = 1` and
  forces `1 = 0` over `ℂ`.  See `exists_dihedralEight_selfDual_mcKay_not_det_one`. -/
  defining_det_one : ∀ g : G, LinearMap.det (V.ρ g) = 1
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

/-- **The negative test for `defining_det_one`.** The ordinary dihedral group of order eight has a
faithful, self-dual two-dimensional representation with exactly the affine `D₄` McKay graph of
`Q₈`, containing an element of determinant `−1`.  It must therefore fail
`NamedMcKayIdentification`, and so must not reach the corner or CBH theorems, which is what the
determinant hypothesis buys. -/
theorem exists_dihedralEight_selfDual_mcKay_not_det_one :
    ∃ (D : IrrepFamily ℂ (DihedralGroup 4)) (V : FDRep ℂ (DihedralGroup 4))
      (e : D.ι ≃ Fin (NamedAffineADE.binaryDihedral 2 (by norm_num)).vertexCount),
      Module.finrank ℂ V = 2 ∧ Function.Injective V.ρ ∧ Nonempty (V ≅ dualFDRep V) ∧
        (∀ j i, (NamedAffineADE.binaryDihedral 2 (by norm_num)).standardGraph.Adj (e j) (e i) ↔
          D.mckayMatrix V j i = 1) ∧
        ∃ g : DihedralGroup 4, LinearMap.det (V.ρ g) = -1 :=
  sorry

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

/-- ⚠ The separable-semisimple base hypothesis is load-bearing, and this statement is **false** for
an arbitrary `k`-algebra `S`.  Take `k = ℚ`, `S = ℚ[t]` and `W = S ⊗_ℚ S` with its outer bimodule
actions.  Then `W` is free of rank one over `S ⊗ Sᵐᵒᵖ`, so it is a finite projective bimodule.  But
as a right `S`-module it is free on the countably many vectors `tⁿ ⊗ 1`, and each of them can
independently be sent to `0` or `1` by a right-`S`-linear map to `S`, so `Hom_{Sᵐᵒᵖ}(W, S)` is
uncountable, whereas `S ⊗ Sᵐᵒᵖ ≅ ℚ[x, y]` is countable and every finitely generated module over a
countable ring is countable.  So the conclusion cannot hold there.

The group-algebra application is unaffected: `groupAlgebra_separableSemisimple` supplies the
hypothesis for `k[Γ]` whenever `|Γ|` is invertible in `k`. -/
theorem rightDual_finiteProjective
    (k S W : Type u) [Field k] [Ring S] [Algebra k S]
    [AddCommGroup W] [Module k W] [Module S W] [Module (MulOpposite S) W]
    [IsScalarTower k S W] [IsScalarTower k (MulOpposite S) W]
    [SMulCommClass S (MulOpposite S) W]
    (hS : SeparableSemisimpleBase k S)
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

/-- The degree-one bimodule isomorphism which fixes the handedness of the quadratic dual:
`Wᵛ ≃ V∗ ⊗ k[Γ]`, `f ↦ Σ_h (h·φ_h) # h` where `f(v # 1) = Σ_h φ_h(v) h`.  Here `Wᵛ` carries
`(s·f)(w) = s f(w)` and `(f·t)(w) = f(t w)`; the formula intertwines both `k[Γ]`-actions with the
left skew-product convention, so the dual is `Λ(V∗) ⋊ Γ` itself rather than its opposite. -/
noncomputable def polynomialSkewRightDualDegreeOneEquiv
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V) :
    letI := skewDegreeOneLeftModule k Γ V Vρ
    letI := skewDegreeOneRightModule k Γ V Vρ
    RightBimoduleDual (MonoidAlgebra k Γ) (SkewDegreeOne Γ V) ≃+
      SkewDegreeOne Γ (Module.Dual k V) := sorry

theorem polynomialSkewRightDualDegreeOneEquiv_apply
    (k Γ V : Type u) [Field k] [Group Γ] [Fintype Γ] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Vρ : Representation k Γ V)
    (f : letI := skewDegreeOneRightModule k Γ V Vρ
      RightBimoduleDual (MonoidAlgebra k Γ) (SkewDegreeOne Γ V)) (h : Γ) (v : V) :
    polynomialSkewRightDualDegreeOneEquiv k Γ V Vρ f h v =
      (f (Finsupp.single 1 (Vρ h⁻¹ v))).coeff h := sorry

/-- With the pinned left convention `T_{k[Γ]}(Wᵛ)/(R⊥)` is the exterior skew algebra on
`V∗` itself, not its opposite.  In degree one the equivalence is the bimodule isomorphism
`Wᵛ ≃ V∗ ⊗ k[Γ]`, `f ↦ Σ_h (h·φ_h) # h` where `f(v ⊗ 1) = Σ_h φ_h(v) h`, which fixes the
handedness.  The source is the fixed right-dual quotient above, not another symmetric algebra. -/
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

/-- The **block scalar** `f_i` by which the central element `z` acts on the simple `ρ_i`.

⚠ This is *not* the CBH parameter of the standard deformed preprojective relation; see
`cbhVertexWeight`, which is the trace.  The name says which one it is on purpose: the primitive
corner identity `e_i z e_i = f_i e_i` below is true, but it does not say that the corner of
`∑_a [a, a*]` is the already-normalized preprojective relation, and the relation comparison
contributes a factor `dim ρ_i`.  The block scalars are what the *centre's algebra* equivalence
`centerEquivBlockScalars` uses, because the trace-coordinate map is only linear once some
`dim ρ_i > 1`. -/
noncomputable def cbhCentralScalar {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G) : D.ι → ℂ :=
  fun i ↦ LinearMap.trace ℂ (D.rep i) (Representation.asAlgebraHom (D.rep i).ρ z) /
    (D.dimension i : ℂ)

/-- The characterizing property of the block scalar: on a simple module a central element acts by
it. -/
theorem cbhCentralScalar_asAlgebraHom {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G)
    (hz : z ∈ Subalgebra.center ℂ (MonoidAlgebra ℂ G)) (i : D.ι) :
    Representation.asAlgebraHom (D.rep i).ρ z = cbhCentralScalar D z i • LinearMap.id := sorry

/-- **CBH's vertex parameter** for the standard deformed preprojective relation: the trace
`λ_i = Tr_{ρ_i}(z) = δ_i · f_i`, not the block scalar `f_i`.

Sources: Crawley-Boevey, *Preprojective algebras, differential operators and a Conze embedding*,
printed p. 3 (immediately before Theorem 0.9); Tikaradze, `arXiv:2204.13647`, §2, printed p. 4.

⚠ Cyclic examples cannot distinguish the two normalizations, because all their `δ_i` are one.  The
test that can is `Γ = Q₈`; see `cbhCornerEquivDeformedPreprojective_scalar_weights_false`. -/
noncomputable def cbhVertexWeight {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G) : D.ι → ℂ :=
  fun i ↦ LinearMap.trace ℂ (D.rep i) (Representation.asAlgebraHom (D.rep i).ρ z)

/-- The missing dimension factor, stated so it cannot be lost between the corner identity and the
relation comparison. -/
theorem cbhVertexWeight_eq_dimension_mul_cbhCentralScalar {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G) (i : D.ι) :
    cbhVertexWeight D z i = (D.dimension i : ℂ) * cbhCentralScalar D z i := sorry

/-- The two parameters agree exactly on the one-dimensional irreducibles. -/
theorem cbhVertexWeight_eq_cbhCentralScalar_iff {G : Type u} [Group G]
    (D : IrrepFamily ℂ G) (z : MonoidAlgebra ℂ G) (i : D.ι)
    (hz : cbhCentralScalar D z i ≠ 0) :
    cbhVertexWeight D z i = cbhCentralScalar D z i ↔ D.dimension i = 1 := sorry

/-- The block-scalar description of the center.  ⚠ This is an **algebra** equivalence, so it has to
use the scalars: `z ↦ (Tr_{ρ_i}(z))_i` is linear but is not multiplicative once some
`dim ρ_i > 1`. -/
noncomputable def centerEquivBlockScalars {G : Type u} [Group G] [Finite G]
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
determinant pairing is exactly one.  Thus `central` and the **trace** parameter
`λ_i = Tr_{ρ_i}(z) = δ_i · f_i` are the only deformation data; there is no hidden rescaling by a
freely chosen pair `x,y`, and no hidden renormalization of `λ` either.  Using the block scalars
`cbhCentralScalar` here instead would be false; see
`cbhCornerEquivDeformedPreprojective_scalar_weights_false`. -/
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

/-- **The test that separates the two normalizations.** No such equivalence exists with the block
scalars `cbhCentralScalar` in place of the trace parameter.

For `Γ = Q₈` the affine `D₄` graph has four dimension-one leaves and a dimension-two centre.  Give
the corresponding blocks of `z` the scalar eigenvalues `1` at a leaf and `−1` at the centre.  The
standard preprojective algebra with those *scalar* vertex weights has a representation of dimension
one at each of those two vertices: take the two opposite-arrow maps to be nonzero scalars whose
product realizes the two signed vertex relations.  A vertex-compatible corner equivalence with the
scalar weights would push it back to a CBH module whose underlying `Γ`-representation is one copy of
each irreducible; but then `Tr([x,y]) = 0` while `Tr(z) = 1·1 + 2·(−1) = −1`.

⚠ Cyclic examples cannot detect this, because all their `δ_i` are one. -/
theorem cbhCornerEquivDeformedPreprojective_scalar_weights_false :
    ¬ ∀ (G : Type) (_ : Group G) (_ : Fintype G) (D : IrrepFamily ℂ G)
        (Vρ : Representation ℂ G (Fin 2 → ℂ)) (tag : NamedAffineADE)
        (M : NamedMcKayIdentification D (FDRep.of Vρ) tag) (_binary : tag.IsBinary)
        (E : PrimitiveMatrixIdempotents ℂ G D) (z : MonoidAlgebra ℂ G)
        (_central : ∀ a, z * a = a * z),
      Nonempty
        (Corner (CBHSkewDeformation ℂ G (Fin 2 → ℂ) Vρ
            (standardCoordinateVector 0) (standardCoordinateVector 1) z)
          (cbhBasicIdempotent ℂ G (Fin 2 → ℂ) Vρ
            (standardCoordinateVector 0) (standardCoordinateVector 1) z E) ≃ₐ[ℂ]
          DeformedPreprojectiveAlgebra ℂ (StandardADEOrientation tag)
            (fun i ↦ cbhCentralScalar D z (M.relabel.symm i))) :=
  sorry

/-! ## FKS: gradings, curved complexes and duplexes, and the curved extension algebra

Frenkel--Khovanov--Schiffmann work with two gradings at once: `ℤ` for `(A,c)`-complexes (FKS §2)
and its parity `ℤ/2` for `(A,c)`-duplexes (FKS §3).  Everything below is stated once for a degree
ring `ι` together with a parity `π : FKSParity ι`, an additive map to `ZMod 2` sending `1` to `1`,
giving the Koszul signs; the two cases are `FKSParity.int` and `FKSParity.zmod2`.  Gradings are
internal direct sums of additive subgroups, so no scalar ring has to be threaded through the
module categories; `FKSGrading.ofInternal` reads one off the DGA roadmap's `InternalGrading`. -/

/-- A grading of an additive group by `ι`, as an internal direct sum of additive subgroups. -/
structure FKSGrading (ι M : Type*) [AddCommGroup ι] [DecidableEq ι] [AddCommGroup M] where
  piece : ι → AddSubgroup M
  isInternal : DirectSum.IsInternal piece

namespace FKSGrading

variable {ι M : Type*} [AddCommGroup ι] [DecidableEq ι] [AddCommGroup M]

/-- The DGA roadmap's `ℤ`-grading of a `k`-module, with scalars forgotten. -/
def ofInternal {k : Type*} [CommRing k] [Module k M] (G : DGAInfinity.InternalGrading k M) :
    FKSGrading ℤ M where
  piece p := (G.piece p).toAddSubgroup
  isInternal := sorry

/-- Collapse along a homomorphism of degree groups: the new `q`-piece is the sum of the old
pieces whose degree maps to `q`.  Along `Int.castAddHom (ZMod 2)` this is FKS's passage from
`ℤ`-graded to `ℤ/2`-graded objects (FKS §5.1, "collapse the grading"). -/
noncomputable def collapse {ι' : Type*} [AddCommGroup ι'] [DecidableEq ι'] (π : ι →+ ι')
    (G : FKSGrading ι M) : FKSGrading ι' M where
  piece q := ⨆ (p : ι) (_ : π p = q), G.piece p
  isInternal := sorry

/-- The shift `(M[n])ᵖ = Mᵖ⁺ⁿ` of FKS §2.1. -/
def shift (G : FKSGrading ι M) (n : ι) : FKSGrading ι M where
  piece p := G.piece (p + n)
  isInternal := sorry

end FKSGrading

/-- A parity on a degree ring: an additive map to `ZMod 2` under which the differential's degree
`1` is odd.  Oddness of `1` is what makes the total differential of a tensor product square
correctly. -/
structure FKSParity (ι : Type*) [AddCommGroupWithOne ι] where
  hom : ι →+ ZMod 2
  map_one : hom 1 = 1

/-- The parity of an integer degree. -/
def FKSParity.int : FKSParity ℤ := ⟨Int.castAddHom (ZMod 2), by simp⟩

/-- The identity parity of a `ℤ/2` degree. -/
def FKSParity.zmod2 : FKSParity (ZMod 2) := ⟨AddMonoidHom.id _, rfl⟩

/-- The Koszul sign `(-1)ᵖ` of a degree, read through its parity. -/
def fksSign {ι : Type*} [AddCommGroupWithOne ι] (π : FKSParity ι) (R : Type*) [Ring R] (p : ι) :
    R :=
  (-1) ^ (π.hom p).val

/-- A graded ring: the grading is internal and multiplicative. -/
structure FKSGradedAlgebra (ι A : Type*) [AddCommGroup ι] [DecidableEq ι] [Ring A] where
  grading : FKSGrading ι A
  one_mem : (1 : A) ∈ grading.piece 0
  mul_mem : ∀ {p q : ι} {a b : A}, a ∈ grading.piece p → b ∈ grading.piece q →
    a * b ∈ grading.piece (p + q)

namespace FKSGradedAlgebra

variable {ι A : Type*} [AddCommGroup ι] [DecidableEq ι] [Ring A]

/-- The collapsed grading is again multiplicative. -/
noncomputable def collapse {ι' : Type*} [AddCommGroup ι'] [DecidableEq ι'] (π : ι →+ ι')
    (B : FKSGradedAlgebra ι A) : FKSGradedAlgebra ι' A where
  grading := B.grading.collapse π
  one_mem := sorry
  mul_mem := sorry

/-- A ring concentrated in degree zero, as in the disk and dual-number examples below. -/
noncomputable def concentrated (ι A : Type*) [AddCommGroup ι] [DecidableEq ι] [Ring A] :
    FKSGradedAlgebra ι A where
  grading :=
    { piece := fun p ↦ if p = 0 then ⊤ else ⊥
      isInternal := sorry }
  one_mem := sorry
  mul_mem := sorry

/-- The parity involution `σ(a) = Σₚ (-1)ᵖ aₚ`.  It is what makes `d a = σ(a) d` in the curved
extension algebra and what twists the left action on a shifted bimodule. -/
noncomputable def parityInvolution {ι A : Type*} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
    (π : FKSParity ι) (B : FKSGradedAlgebra ι A) : A ≃+* A :=
  sorry

theorem parityInvolution_of_mem {ι A : Type*} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
    (π : FKSParity ι) (B : FKSGradedAlgebra ι A) {p : ι} {a : A}
    (ha : a ∈ B.grading.piece p) : B.parityInvolution π a = fksSign π A p * a := sorry

end FKSGradedAlgebra

/-- A curvature: a central element of degree two (FKS §2.1; in the parity setting of FKS §3.1
degree two is degree zero). -/
structure FKSCurvature {ι A : Type*} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
    (B : FKSGradedAlgebra ι A) where
  val : A
  mem : val ∈ B.grading.piece 2
  central : ∀ a, val * a = a * val

/-- The zero curvature. -/
def FKSCurvature.zero {ι A : Type*} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
    (B : FKSGradedAlgebra ι A) : FKSCurvature B where
  val := 0
  mem := zero_mem _
  central := by simp

/-- The same central element, for the parity-collapsed grading: degree two is even. -/
noncomputable def FKSCurvature.collapse {A : Type*} [Ring A] {B : FKSGradedAlgebra ℤ A}
    (c : FKSCurvature B) : FKSCurvature (B.collapse (Int.castAddHom (ZMod 2))) where
  val := c.val
  mem := sorry
  central := c.central

section CurvedModules

variable {ι : Type*} {A : Type u} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
variable (π : FKSParity ι) (B : FKSGradedAlgebra ι A) (c : FKSCurvature B)
include π B c

/-- FKS Definition 1 (for `ι = ℤ`, an `(A,c)`-complex) and FKS §3.1 (for `ι = ZMod 2`, an
`(A,c)`-duplex): a graded left `A`-module with a degree-one additive `d`, `d² = c`, and
`d(a m) = (-1)^|a| a d(m)`.  For `ι = ZMod 2` this is one module `M = M⁰ ⊕ M¹` on which odd
elements of `A` exchange the two components (`smul_mem`), not a pair of `A`-modules. -/
structure FKSCurvedModule (M : Type u) [AddCommGroup M] [Module A M] where
  grading : FKSGrading ι M
  smul_mem : ∀ {p q : ι} {a : A} {m : M}, a ∈ B.grading.piece p → m ∈ grading.piece q →
    a • m ∈ grading.piece (p + q)
  d : M →+ M
  d_mem : ∀ {p : ι} {m : M}, m ∈ grading.piece p → d m ∈ grading.piece (p + 1)
  d_d : ∀ m, d (d m) = c.val • m
  d_smul : ∀ {p : ι} {a : A} (m : M), a ∈ B.grading.piece p →
    d (a • m) = (fksSign π A p * a) • d m

/-- Objects of `Com(A,c)` (`ι = ℤ`) or `Com₂(A,c)` (`ι = ZMod 2`). -/
structure FKSCurvedObject where
  carrier : ModuleCat.{u} A
  str : FKSCurvedModule π B c carrier

namespace FKSCurvedObject

variable {π B c}

/-- A morphism of `(A,c)`-complexes or duplexes: a degree-zero `A`-linear map commuting with `d`
(FKS §2.1, §3.1). -/
@[ext] structure Hom (X Y : FKSCurvedObject π B c) where
  hom : X.carrier →ₗ[A] Y.carrier
  mem : ∀ {p : ι} {m : X.carrier}, m ∈ X.str.grading.piece p → hom m ∈ Y.str.grading.piece p
  comm : ∀ m, hom (X.str.d m) = Y.str.d (hom m)

instance : Category (FKSCurvedObject π B c) where
  Hom := Hom
  id X := ⟨LinearMap.id, fun h ↦ h, fun _ ↦ rfl⟩
  comp f g := ⟨g.hom ∘ₗ f.hom, fun h ↦ g.mem (f.mem h), fun m ↦ by simp [f.comm, g.comm]⟩

/-- The pointwise additive structure on morphisms. -/
noncomputable instance : Preadditive (FKSCurvedObject π B c) := sorry

/-- FKS §2.2 and §3.2: `f` is null-homotopic when `f = h d + d h` for an `A`-map
`h : M → N[-1]`.  Since `N[-1]` carries the sign-twisted action `a ∘ n = (-1)^|a| a n`, this is an
additive map lowering degree by one with `h(a m) = (-1)^|a| a h(m)`. -/
def IsNullHomotopic {X Y : FKSCurvedObject π B c} (f : X ⟶ Y) : Prop :=
  ∃ h : X.carrier →+ Y.carrier,
    (∀ {p : ι} {m : X.carrier}, m ∈ X.str.grading.piece p → h m ∈ Y.str.grading.piece (p - 1)) ∧
    (∀ {p : ι} {a : A} (m : X.carrier), a ∈ B.grading.piece p →
      h (a • m) = (fksSign π A p * a) • h m) ∧
    ∀ m, Hom.hom f m = h (X.str.d m) + Y.str.d (h m)

end FKSCurvedObject

/-- Null-homotopic morphisms form a two-sided ideal (FKS Propositions 2.1 and 3.1). -/
def fksHomotopyIdeal : StablePeriodicCurved.MorphismIdeal (FKSCurvedObject π B c) where
  hom X Y :=
    { carrier := {f | FKSCurvedObject.IsNullHomotopic f}
      add_mem' := sorry
      zero_mem' := sorry
      neg_mem' := sorry }
  comp_left := sorry
  comp_right := sorry

/-- The homotopy category `K(A,c)` (`ι = ℤ`) or `K₂(A,c)` (`ι = ZMod 2`): the curved objects
with morphisms modulo null-homotopy, as the sibling roadmap's ideal quotient. -/
abbrev FKSHomotopyCategory := (fksHomotopyIdeal π B c).Quotient

/-- `Com(A,c)` is abelian (FKS §2.1, §3.1), with kernels and cokernels computed on carriers. -/
noncomputable instance : Abelian (FKSCurvedObject π B c) := sorry

/-- The carrier of the shift `X[1]`: the same group, with the action twisted by the parity
involution, `a ∘ m = (-1)^|a| a m` (FKS §2.1).  Pinned by `fksShift_smul`. -/
def FKSShiftCarrier (X : FKSCurvedObject π B c) := X.carrier

instance (X : FKSCurvedObject π B c) : AddCommGroup (FKSShiftCarrier π B c X) :=
  inferInstanceAs (AddCommGroup X.carrier)

noncomputable instance (X : FKSCurvedObject π B c) : Module A (FKSShiftCarrier π B c X) := sorry

theorem fksShift_smul (X : FKSCurvedObject π B c) (a : A) (m : FKSShiftCarrier π B c X) :
    a • m = (show FKSShiftCarrier π B c X from
      (B.parityInvolution π a • (show X.carrier from m) : X.carrier)) := sorry

/-- The shift `X[1]`: `(X[1])ᵖ = Xᵖ⁺¹`, `d[1] = -d`, twisted action. -/
noncomputable def FKSCurvedObject.shift (X : FKSCurvedObject π B c) : FKSCurvedObject π B c where
  carrier := ModuleCat.of A (FKSShiftCarrier π B c X)
  str :=
    { grading := X.str.grading.shift 1
      smul_mem := sorry
      d := -X.str.d
      d_mem := sorry
      d_d := sorry
      d_smul := sorry }

/-- The shift functor on `Com(A,c)`, the identity on underlying maps. -/
noncomputable def fksShiftFunctor : FKSCurvedObject π B c ⥤ FKSCurvedObject π B c where
  obj X := X.shift
  map f := ⟨{ toFun := f.hom, map_add' := f.hom.map_add, map_smul' := sorry }, sorry, sorry⟩
  map_id := sorry
  map_comp := sorry

/-- The mapping cone of `f : X ⟶ Y`: carrier `Y ⊕ X[1]`, `d(y, x) = (d y + f x, -d x)`. -/
noncomputable def FKSCurvedObject.cone {X Y : FKSCurvedObject π B c} (f : X ⟶ Y) :
    FKSCurvedObject π B c where
  carrier := ModuleCat.of A (Y.carrier × FKSShiftCarrier π B c X)
  str :=
    { grading :=
        { piece := fun p ↦ (Y.str.grading.piece p).prod (X.str.grading.piece (p + 1))
          isInternal := sorry }
      smul_mem := sorry
      d :=
        { toFun := fun v ↦ (Y.str.d v.1 + f.hom (show X.carrier from v.2),
            show FKSShiftCarrier π B c X from -X.str.d (show X.carrier from v.2))
          map_zero' := sorry
          map_add' := sorry }
      d_mem := sorry
      d_d := sorry
      d_smul := sorry }

/-- The curved extension algebra `Ã_c = A ⊗ ℤ[d]/(d² - c)`, `d a = (-1)^|a| a d`, `deg d = 1`
(FKS §2.1).  Every element is uniquely `a + b d`; the carrier records the pair `(a, b)`. -/
@[ext] structure FKSCurvedExtension {ι : Type*} {A : Type u} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
    (_π : FKSParity ι) (B : FKSGradedAlgebra ι A) (_c : FKSCurvature B) where
  const : A
  dCoeff : A

namespace FKSCurvedExtension

variable {π B c}

/-- Addition, zero, negation and scalars are componentwise; multiplication is `mul_def`. -/
noncomputable instance : Ring (FKSCurvedExtension π B c) := sorry

/-- `(a + b d)(a' + b' d) = (a a' + b σ(b') c) + (a b' + b σ(a')) d`, using `d a' = σ(a') d` and
`d² = c`. -/
theorem mul_def (x y : FKSCurvedExtension π B c) :
    x * y =
      ⟨x.const * y.const + x.dCoeff * B.parityInvolution π y.dCoeff * c.val,
        x.const * y.dCoeff + x.dCoeff * B.parityInvolution π y.const⟩ := sorry

theorem add_def (x y : FKSCurvedExtension π B c) :
    x + y = ⟨x.const + y.const, x.dCoeff + y.dCoeff⟩ := sorry

theorem one_def : (1 : FKSCurvedExtension π B c) = ⟨1, 0⟩ := sorry

end FKSCurvedExtension

/-- The inclusion `A → Ã_c`, `a ↦ a + 0 d`. -/
noncomputable def fksExtensionInclusion : A →+* FKSCurvedExtension π B c := sorry

theorem fksExtensionInclusion_apply (a : A) :
    fksExtensionInclusion π B c a = ⟨a, 0⟩ := sorry

/-- The generator `d = 0 + 1 d`. -/
def fksExtensionD : FKSCurvedExtension π B c := ⟨0, 1⟩

theorem fksExtensionD_mul_self :
    fksExtensionD π B c * fksExtensionD π B c = fksExtensionInclusion π B c c.val := sorry

theorem fksExtensionD_mul (a : A) :
    fksExtensionD π B c * fksExtensionInclusion π B c a =
      fksExtensionInclusion π B c (B.parityInvolution π a) * fksExtensionD π B c := sorry

/-- The grading of `Ã_c`: `(a + b d)` has degree `p` when `a` has degree `p` and `b` degree
`p - 1`. -/
noncomputable def fksExtensionGradedAlgebra : FKSGradedAlgebra ι (FKSCurvedExtension π B c) where
  grading :=
    { piece := fun p ↦
        { carrier := {x | x.const ∈ B.grading.piece p ∧ x.dCoeff ∈ B.grading.piece (p - 1)}
          add_mem' := sorry
          zero_mem' := sorry
          neg_mem' := sorry }
      isInternal := sorry }
  one_mem := sorry
  mul_mem := sorry

/-- `Ã_c` is free of rank two as a left `A`-module, on `1` and `d`.  This is what makes restriction
of scalars send projective `Ã_c`-modules to projective `A`-modules (FKS §4.1). -/
theorem fksExtension_free_rank_two :
    letI : Module A (FKSCurvedExtension π B c) :=
      Module.compHom _ (fksExtensionInclusion π B c)
    ∃ b : Module.Basis (Fin 2) A (FKSCurvedExtension π B c),
      b 0 = 1 ∧ b 1 = fksExtensionD π B c := sorry

end CurvedModules

/-! ### Graded modules and the stable category of FKS §4 -/

section StableCategories

variable {ι : Type*} {R : Type u} [AddCommGroup ι] [DecidableEq ι] [Ring R]

/-- A graded left module over a graded ring. -/
structure FKSGradedModule (B : FKSGradedAlgebra ι R) where
  carrier : ModuleCat.{u} R
  grading : FKSGrading ι carrier
  smul_mem : ∀ {p q : ι} {a : R} {m : carrier}, a ∈ B.grading.piece p →
    m ∈ grading.piece q → a • m ∈ grading.piece (p + q)

namespace FKSGradedModule

variable {B : FKSGradedAlgebra ι R}

/-- Degree-zero module maps. -/
@[ext] structure Hom (X Y : FKSGradedModule B) where
  hom : X.carrier →ₗ[R] Y.carrier
  mem : ∀ {p : ι} {m : X.carrier}, m ∈ X.grading.piece p → hom m ∈ Y.grading.piece p

instance : Category (FKSGradedModule B) where
  Hom := Hom
  id X := ⟨LinearMap.id, fun h ↦ h⟩
  comp f g := ⟨g.hom ∘ₗ f.hom, fun h ↦ g.mem (f.mem h)⟩

/-- The pointwise additive structure on morphisms. -/
noncomputable instance : Preadditive (FKSGradedModule B) := sorry

/-- The graded module category is abelian, so `CategoryTheory.Projective` there is the honest
notion of a projective graded module. -/
noncomputable instance : Abelian (FKSGradedModule B) := sorry

/-- FKS §4.1: maps factoring through a projective graded module. -/
noncomputable def projectiveIdeal (B : FKSGradedAlgebra ι R) :
    StablePeriodicCurved.MorphismIdeal (FKSGradedModule B) :=
  StablePeriodicCurved.MorphismIdeal.factorIdeal (fun P ↦ Projective P)

/-- The stable module category `Mod(R)` of graded `R`-modules. -/
abbrev StableCategory (B : FKSGradedAlgebra ι R) := (projectiveIdeal B).Quotient

end FKSGradedModule

end StableCategories

section StableComparison

variable {ι : Type*} {A : Type u} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
variable (π : FKSParity ι) (B : FKSGradedAlgebra ι A) (c : FKSCurvature B)

/-- The FKS stable category `Mod(Ã_c)` (`ι = ℤ`) or `Mod₂(Ã_c)` (`ι = ZMod 2`): graded
`Ã_c`-modules modulo maps factoring through projective graded `Ã_c`-modules.  This is a quotient of
the module category, not of the homotopy category. -/
abbrev FKSStableCategory :=
  FKSGradedModule.StableCategory (fksExtensionGradedAlgebra π B c)

/-- `Mod(Ã_c) ≃ Com(A,c)`: restrict scalars along `A → Ã_c` and let `d` act as the element
`fksExtensionD`.  The carrier, grading and underlying maps are unchanged. -/
noncomputable def fksExtensionModuleToCurved :
    FKSGradedModule (fksExtensionGradedAlgebra π B c) ⥤ FKSCurvedObject π B c where
  obj X :=
    { carrier := (ModuleCat.restrictScalars (fksExtensionInclusion π B c)).obj X.carrier
      str :=
        { grading := X.grading
          smul_mem := sorry
          d := DistribSMul.toAddMonoidHom X.carrier (fksExtensionD π B c)
          d_mem := sorry
          d_d := sorry
          d_smul := sorry } }
  map f :=
    { hom :=
        { toFun := f.hom
          map_add' := f.hom.map_add
          map_smul' := fun a m ↦ f.hom.map_smul (fksExtensionInclusion π B c a) m }
      mem := f.mem
      comm := fun m ↦ f.hom.map_smul (fksExtensionD π B c) m }
  map_id := sorry
  map_comp := sorry

noncomputable instance : (fksExtensionModuleToCurved π B c).Additive := sorry

instance fksExtensionModuleToCurved_isEquivalence :
    (fksExtensionModuleToCurved π B c).IsEquivalence := sorry

/-- FKS Lemma 4.1: a projective graded `Ã_c`-module is contractible as a curved object, since each
indecomposable projective is `Ã_c ⊗_A P' ≅ P' ⊕ P'[-1]` with `d` an isomorphism between the two
summands. -/
theorem fksExtension_projective_isZero (P : FKSGradedModule (fksExtensionGradedAlgebra π B c))
    (hP : Projective P) :
    Limits.IsZero
      ((fksHomotopyIdeal π B c).quotientFunctor.obj
        ((fksExtensionModuleToCurved π B c).obj P)) := sorry

theorem fksExtension_kills_projectiveIdeal :
    (FKSGradedModule.projectiveIdeal (fksExtensionGradedAlgebra π B c)).Kills
      (fksExtensionModuleToCurved π B c ⋙ (fksHomotopyIdeal π B c).quotientFunctor) := sorry

/-- The canonical functor `Φ₂ : Mod(Ã_c) → K(A,c)` of FKS (4.1), induced from
`Mod(Ã_c) ≃ Com(A,c) → K(A,c)`.  It goes from the stable category to the homotopy category and is
not an equivalence in general: see `fksDisk_stable_not_isZero`. -/
noncomputable def fksStableToHomotopy : FKSStableCategory π B c ⥤ FKSHomotopyCategory π B c :=
  StablePeriodicCurved.MorphismIdeal.lift _
    (fksExtensionModuleToCurved π B c ⋙ (fksHomotopyIdeal π B c).quotientFunctor)
    (fksExtension_kills_projectiveIdeal π B c)

end StableComparison

/-- For duplexes the shift is `2`-periodic, `[2] ≅ Id` (FKS §3.1). -/
noncomputable def fksDuplexShiftTwoIso {A : Type u} [Ring A] (B : FKSGradedAlgebra (ZMod 2) A)
    (c : FKSCurvature B) :
    fksShiftFunctor FKSParity.zmod2 B c ⋙ fksShiftFunctor FKSParity.zmod2 B c ≅ 𝟭 _ := sorry

/-- Folding a complex to a duplex: the same module and differential, with the `ℤ`-grading
collapsed to its parity (FKS §3.1, §5.1).  This is the comparison between the complex model of
FKS §2 and the duplex model of FKS §3 on which the Weyl functors act. -/
noncomputable def fksFold {A : Type u} [Ring A] (B : FKSGradedAlgebra ℤ A) (c : FKSCurvature B) :
    FKSCurvedObject FKSParity.int B c ⥤
      FKSCurvedObject FKSParity.zmod2 (B.collapse (Int.castAddHom (ZMod 2)))
        (c.collapse) where
  obj X :=
    { carrier := X.carrier
      str :=
        { grading := X.str.grading.collapse (Int.castAddHom (ZMod 2))
          smul_mem := sorry
          d := X.str.d
          d_mem := sorry
          d_d := X.str.d_d
          d_smul := sorry } }
  map f := ⟨f.hom, sorry, f.comm⟩
  map_id := sorry
  map_comp := sorry

/-! ### Stable-category acceptance tests -/

/-- The carrier `ℚ ⊕ ℚ d` of the disk `Ã_0 ⊗_A (A/(t))` over `A = ℚ[t]/(t²)`. -/
def FKSDiskCarrier := ℚ × ℚ

instance : AddCommGroup FKSDiskCarrier := inferInstanceAs (AddCommGroup (ℚ × ℚ))

/-- `A = ℚ[t]/(t²)` acts through `A/(t) = ℚ`.  Pinned by `fksDisk_smul`. -/
noncomputable instance : Module (DualNumber ℚ) FKSDiskCarrier := sorry

theorem fksDisk_smul (a : DualNumber ℚ) (v : FKSDiskCarrier) :
    a • v = (show FKSDiskCarrier from (a.fst * (show ℚ × ℚ from v).1,
      a.fst * (show ℚ × ℚ from v).2)) := sorry

/-- The disk as an `(A,0)`-complex: `ℚ` in degree `0`, `ℚ d` in degree `1`, `d(x, y) = (0, x)`. -/
noncomputable def fksDisk :
    FKSCurvedObject FKSParity.int (FKSGradedAlgebra.concentrated ℤ (DualNumber ℚ))
      (FKSCurvature.zero _) where
  carrier := ModuleCat.of (DualNumber ℚ) FKSDiskCarrier
  str :=
    { grading :=
        { piece := fun p ↦
            if p = 0 then ((⊤ : AddSubgroup ℚ).prod ⊥ : AddSubgroup (ℚ × ℚ))
            else if p = 1 then ((⊥ : AddSubgroup ℚ).prod ⊤ : AddSubgroup (ℚ × ℚ)) else ⊥
          isInternal := sorry }
      smul_mem := sorry
      d :=
        { toFun := fun v ↦ (show FKSDiskCarrier from ((0 : ℚ), (show ℚ × ℚ from v).1))
          map_zero' := rfl
          map_add' := sorry }
      d_mem := sorry
      d_d := sorry
      d_smul := sorry }

/-- The disk is contractible, so zero in `K(A,0)`. -/
theorem fksDisk_homotopy_isZero :
    Limits.IsZero ((fksHomotopyIdeal FKSParity.int _ _).quotientFunctor.obj fksDisk) := sorry

/-- The disk is not projective over `Ã_0` (its restriction to `A` is `A/(t) ⊕ A/(t)`), so it is
nonzero in `Mod(Ã_0)`.  With `fksDisk_homotopy_isZero`, `Φ₂` kills a nonzero object: the stable
category is not a further quotient of the homotopy category, and `Φ₂` is not an equivalence. -/
theorem fksDisk_stable_not_isZero :
    ¬ Limits.IsZero ((FKSGradedModule.projectiveIdeal _).quotientFunctor.obj
      ((fksExtensionModuleToCurved FKSParity.int _ _).inv.obj fksDisk)) := sorry

/-- `ℚ[u, u⁻¹]` with `u` in degree two. -/
noncomputable def laurentFKSGradedAlgebra : FKSGradedAlgebra ℤ (LaurentPolynomial ℚ) where
  grading :=
    { piece := fun p ↦
        (Submodule.span ℚ {LaurentPolynomial.T n | (n : ℤ) (_ : 2 * n = p)}).toAddSubgroup
      isInternal := sorry }
  one_mem := sorry
  mul_mem := sorry

/-- The invertible curvature `u`. -/
noncomputable def laurentCurvature : FKSCurvature laurentFKSGradedAlgebra where
  val := LaurentPolynomial.T 1
  mem := sorry
  central := fun a ↦ mul_comm _ a

/-- Negative test (FKS §3.2, Remark): with invertible curvature every object is contractible, via
`h = (1/2) u⁻¹ d`, so `K(A,c)` is the zero category. -/
theorem laurentCurvature_homotopy_isZero
    (X : FKSHomotopyCategory FKSParity.int laurentFKSGradedAlgebra laurentCurvature) :
    Limits.IsZero X := sorry

/-- `(A, 0, w)` as a zero-differential right curved DG algebra of the stable prerequisite, for a
central degree-two `w` and a `k`-linear grading inducing `B`. -/
noncomputable def fksRightCurvedAlgebra (k : Type u) {A : Type u} [CommRing k] [Ring A]
    [Algebra k A] {B : FKSGradedAlgebra ℤ A} (G : DGAInfinity.InternalGrading k A)
    (hG : FKSGrading.ofInternal G = B.grading) (w : A) (hw : w ∈ B.grading.piece 2)
    (central : ∀ a, w * a = a * w) : StablePeriodicCurved.RightCurvedDGAlgebra k A where
  grading := G
  one_degree := sorry
  mul_degree := sorry
  d := 0
  curvature := w
  d_degree := sorry
  curvature_degree := sorry
  leibniz := sorry
  d_sq := sorry
  d_curvature := rfl

/-- The complex model of FKS §2 is the zero-differential, central-curvature case of the stable
prerequisite's right curved modules: a left `(A,c)`-complex is a right module over the graded
opposite by `m · op a = (-1)^(|a||m|) a m`, and the graded opposite of `(A, 0, -c)` has right
curvature `op c`.  This equivalence is how `K(A,c)` inherits the prerequisite's triangulation. -/
noncomputable def fksHomotopyEquivRightCurved (k : Type u) {A : Type u} [CommRing k] [Ring A]
    [Algebra k A] {B : FKSGradedAlgebra ℤ A} (G : DGAInfinity.InternalGrading k A)
    (hG : FKSGrading.ofInternal G = B.grading) (c : FKSCurvature B) :
    letI O := StablePeriodicCurved.RightCurvedDGAlgebra.gradedOpposite
      (fksRightCurvedAlgebra k G hG (-c.val) (neg_mem c.mem)
        (fun a ↦ by rw [neg_mul, mul_neg, c.central]))
    letI := O.ring
    letI := O.algebra
    FKSHomotopyCategory FKSParity.int B c ≌ O.opposite.HomotopyCategory := sorry

/-! ### Curved bimodules and tensoring (FKS §2.3--2.4, §3.3) -/

section Bimodules

variable {ι : Type*} {A : Type u} [AddCommGroupWithOne ι] [DecidableEq ι] [Ring A]
variable (π : FKSParity ι) (B : FKSGradedAlgebra ι A)

/-- An `(A, target, -source)`-complex or duplex of bimodules in the sense of FKS §2.4: `d` has
degree one, `d² = l(target) - r(source)`, `d` supercommutes with the left action and **commutes**
with the right action.  Tensoring with it sends curvature `source` to curvature `target`. -/
structure FKSCurvedBimodule (target source : FKSCurvature B) (N : Type u) [AddCommGroup N]
    [Module A N] [Module Aᵐᵒᵖ N] where
  grading : FKSGrading ι N
  smul_mem_left : ∀ {p q : ι} {a : A} {n : N}, a ∈ B.grading.piece p →
    n ∈ grading.piece q → a • n ∈ grading.piece (p + q)
  smul_mem_right : ∀ {p q : ι} {a : A} {n : N}, a ∈ B.grading.piece p →
    n ∈ grading.piece q → MulOpposite.op a • n ∈ grading.piece (q + p)
  actions_commute : ∀ (a b : A) (n : N),
    a • (MulOpposite.op b • n) = MulOpposite.op b • (a • n)
  d : N →+ N
  d_mem : ∀ {p : ι} {n : N}, n ∈ grading.piece p → d n ∈ grading.piece (p + 1)
  d_d : ∀ n, d (d n) = target.val • n - MulOpposite.op source.val • n
  d_smul_left : ∀ {p : ι} {a : A} (n : N), a ∈ B.grading.piece p →
    d (a • n) = (fksSign π A p * a) • d n
  d_smul_right : ∀ (a : A) (n : N), d (MulOpposite.op a • n) = MulOpposite.op a • d n

/-- The balanced tensor product `N ⊗_A M` of a right and a left `A`-module. -/
abbrev FKSBalancedTensor (A N M : Type u) [Ring A] [AddCommGroup N] [Module Aᵐᵒᵖ N]
    [AddCommGroup M] [Module A M] :=
  TensorProduct ℤ N M ⧸ Submodule.span ℤ
    {x | ∃ (a : A) (n : N) (m : M), x = (MulOpposite.op a • n) ⊗ₜ m - n ⊗ₜ (a • m)}

/-- The left action on `N ⊗_A M` through `N`; it descends because the two actions on `N` commute. -/
noncomputable instance fksBalancedTensorModule (A N M : Type u) [Ring A] [AddCommGroup N]
    [Module A N] [Module Aᵐᵒᵖ N] [SMulCommClass A Aᵐᵒᵖ N] [AddCommGroup M] [Module A M] :
    Module A (FKSBalancedTensor A N M) := sorry

theorem fksBalancedTensor_smul (A N M : Type u) [Ring A] [AddCommGroup N]
    [Module A N] [Module Aᵐᵒᵖ N] [SMulCommClass A Aᵐᵒᵖ N] [AddCommGroup M] [Module A M] (a : A) (n : N) (m : M) :
    a • (Submodule.Quotient.mk (n ⊗ₜ[ℤ] m) : FKSBalancedTensor A N M) =
      Submodule.Quotient.mk ((a • n) ⊗ₜ[ℤ] m) := sorry

variable {π B}

/-- `N ⊗_A M` with the total grading and `d(n ⊗ m) = dn ⊗ m + (-1)^|n| n ⊗ dm` (FKS §2.3).  Its
square is `l(target)`: the `r(source)` term cancels against `d²m = source · m` by balancing. -/
noncomputable def FKSCurvedBimodule.tensorObj {target source : FKSCurvature B} {N : Type u}
    [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N] (K : FKSCurvedBimodule π B target source N)
    (X : FKSCurvedObject π B source) : FKSCurvedObject π B target where
  carrier :=
    letI : SMulCommClass A Aᵐᵒᵖ N := ⟨fun a b n ↦ K.actions_commute a b.unop n⟩
    ModuleCat.of A (FKSBalancedTensor A N X.carrier)
  str := sorry

theorem FKSCurvedBimodule.tensorObj_d {target source : FKSCurvature B} {N : Type u}
    [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N] (K : FKSCurvedBimodule π B target source N)
    (X : FKSCurvedObject π B source) {p : ι} (n : N) (hn : n ∈ K.grading.piece p)
    (m : X.carrier) :
    (K.tensorObj X).str.d
        (Submodule.Quotient.mk (n ⊗ₜ[ℤ] m) : FKSBalancedTensor A N X.carrier) =
      Submodule.Quotient.mk (K.d n ⊗ₜ[ℤ] m) +
        fksSign π ℤ p • Submodule.Quotient.mk (n ⊗ₜ[ℤ] X.str.d m) := sorry

/-- Tensoring with a curved bimodule, `Com(A, source) ⥤ Com(A, target)` (FKS §2.4, §3.3); on
morphisms it is `id ⊗ f`. -/
noncomputable def FKSCurvedBimodule.tensorFunctor {target source : FKSCurvature B} {N : Type u}
    [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N] (K : FKSCurvedBimodule π B target source N) :
    FKSCurvedObject π B source ⥤ FKSCurvedObject π B target where
  obj := K.tensorObj
  map := sorry
  map_id := sorry
  map_comp := sorry

theorem FKSCurvedBimodule.tensorFunctor_map {target source : FKSCurvature B} {N : Type u}
    [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N] (K : FKSCurvedBimodule π B target source N)
    {X Y : FKSCurvedObject π B source} (f : X ⟶ Y) (n : N) (m : X.carrier) :
    FKSCurvedObject.Hom.hom (K.tensorFunctor.map f)
        (Submodule.Quotient.mk (n ⊗ₜ[ℤ] m) : FKSBalancedTensor A N X.carrier) =
      (Submodule.Quotient.mk (n ⊗ₜ[ℤ] FKSCurvedObject.Hom.hom f m) :
        FKSBalancedTensor A N Y.carrier) := sorry

noncomputable instance FKSCurvedBimodule.tensorFunctor_additive {target source : FKSCurvature B}
    {N : Type u} [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N]
    (K : FKSCurvedBimodule π B target source N) : K.tensorFunctor.Additive := sorry

/-- Tensoring preserves null-homotopy, so it descends to the homotopy categories. -/
theorem FKSCurvedBimodule.tensorFunctor_kills {target source : FKSCurvature B} {N : Type u}
    [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N] (K : FKSCurvedBimodule π B target source N) :
    (fksHomotopyIdeal π B source).Kills
      (K.tensorFunctor ⋙ (fksHomotopyIdeal π B target).quotientFunctor) := sorry

noncomputable def FKSCurvedBimodule.homotopyFunctor {target source : FKSCurvature B}
    {N : Type u} [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N]
    (K : FKSCurvedBimodule π B target source N) :
    FKSHomotopyCategory π B source ⥤ FKSHomotopyCategory π B target :=
  StablePeriodicCurved.MorphismIdeal.lift _
    (K.tensorFunctor ⋙ (fksHomotopyIdeal π B target).quotientFunctor) K.tensorFunctor_kills

end Bimodules

/-! ## FKS Weyl functors on zigzag duplexes

FKS §5.1 use the orientation-signed algebra `A(Q)`, which is isomorphic to the ordinary zigzag
algebra exactly when `Q` is bipartite.  This layer is stated for **bipartite** connected graphs,
which covers every binary-group McKay graph (the trees `D̃`, `Ẽ` and the even cycles `Ã_(2m-1)`;
FKS §8.1 assume `-1 ∈ Γ`).  A chosen two-colouring `col` transports FKS's data to the ordinary
zigzag algebra: FKS's degree-two basis element at `a` is `ε_a` times the ordinary backtrack class,
and FKS's `Δ_a` is `ε_a` times the ordinary coevaluation, where `ε_a = -1` on one colour class and
`1` on the other.  With these signs the reflection formula below is FKS's
`s_a(c) = c + x_a (Σ_(a--b) X_b - 2 X_a)`. -/

/-- Coefficients of the FKS reflection `s_a(c)` in FKS's degree-two center basis. -/
def reflectCenterParameter {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (a : V) (c : V → k) : V → k :=
  fun v ↦ c v + c a * ((if G.Adj a v then 1 else 0) - if a = v then 2 else 0)

@[simp] theorem reflectCenterParameter_at {k V : Type*} [CommRing k]
    (G : SimpleGraph V) [DecidableEq V] [DecidableRel G.Adj] (a : V) (c : V → k) :
    reflectCenterParameter G a c a = -c a := sorry

/-- Each `s_a` is an involution. -/
@[simp] theorem reflectCenterParameter_reflectCenterParameter {k V : Type*} [CommRing k]
    (G : SimpleGraph V) [DecidableEq V] [DecidableRel G.Adj] (a : V) (c : V → k) :
    reflectCenterParameter G a (reflectCenterParameter G a c) = c := sorry

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

/-- The subtype inclusions, as `k`-linear maps. -/
noncomputable def leftVertexProjectiveSubtype (k A : Type*) [Field k] [Ring A] [Algebra k A]
    (e : Idempotent A) : LeftVertexProjective A e →ₗ[k] A := sorry

theorem leftVertexProjectiveSubtype_apply (k A : Type*) [Field k] [Ring A] [Algebra k A]
    (e : Idempotent A) (x : LeftVertexProjective A e) :
    leftVertexProjectiveSubtype k A e x = x.1 := sorry

noncomputable def rightVertexProjectiveSubtype (k A : Type*) [Field k] [Ring A] [Algebra k A]
    (e : Idempotent A) : RightVertexProjective A e →ₗ[k] A := sorry

theorem rightVertexProjectiveSubtype_apply (k A : Type*) [Field k] [Ring A] [Algebra k A]
    (e : Idempotent A) (x : RightVertexProjective A e) :
    rightVertexProjectiveSubtype k A e x = x.1 := sorry

/-- The strict zigzag algebra of a connected graph with an edge. -/
abbrev ZigzagAlg (k : Type*) [Field k] {V : Type u} [Finite V] (G : SimpleGraph V) :=
  ZigzagPreprojective.nonisolatedZigzagQuotient k G

section ZigzagFKS

variable (k : Type u) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
variable (G : SimpleGraph V) [DecidableRel G.Adj]
variable (connected : G.Connected) (nontrivial : 1 < Fintype.card V)

/-- The vertex idempotent `e_a`, the sibling basis vector of index `Sum.inl a`. -/
noncomputable def zigzagVertexIdempotent (a : V) : Idempotent (ZigzagAlg k G) :=
  ⟨ZigzagPreprojective.zigzagBasis k G connected nontrivial (Sum.inl a), sorry⟩

/-- The arrow `i ⟶ j` for `G.Adj i j`, the sibling basis vector of index `⟨i, j, h⟩`. -/
noncomputable def zigzagArrow (i j : V) (h : G.Adj i j) : ZigzagAlg k G :=
  ZigzagPreprojective.zigzagBasis k G connected nontrivial (Sum.inr (Sum.inl ⟨i, j, ⟨h⟩⟩))

/-- The ordinary backtrack class `Y_a` at `a`, the sibling basis vector of index `Sum.inr (Sum.inr a)`,
on which the sibling trace is one. -/
noncomputable def zigzagBacktrack (a : V) : ZigzagAlg k G :=
  ZigzagPreprojective.zigzagBasis k G connected nontrivial (Sum.inr (Sum.inr a))

/-- The path-length `ℤ`-grading of the sibling roadmap, with vertices, arrows and backtracks in
degrees `0`, `1`, `2`. -/
noncomputable def zigzagFKSGradedAlgebra : FKSGradedAlgebra ℤ (ZigzagAlg k G) := sorry

theorem zigzagArrow_mem (i j : V) (h : G.Adj i j) :
    zigzagArrow k G connected nontrivial i j h ∈
      (zigzagFKSGradedAlgebra k G).grading.piece 1 := sorry

theorem zigzagBacktrack_mem (a : V) :
    zigzagBacktrack k G connected nontrivial a ∈
      (zigzagFKSGradedAlgebra k G).grading.piece 2 := sorry

/-- Its parity collapse, the grading used by duplexes. -/
noncomputable def zigzagParityAlgebra : FKSGradedAlgebra (ZMod 2) (ZigzagAlg k G) :=
  (zigzagFKSGradedAlgebra k G).collapse (Int.castAddHom (ZMod 2))

/-- The colour sign `ε_a`. -/
def bipartiteSign (col : G.Coloring Bool) (a : V) : k := if col a then -1 else 1

/-- FKS's degree-two basis element `X_a = ε(h) h h̄` (FKS §5.1), transported to the ordinary zigzag
algebra: `ε_a Y_a`. -/
noncomputable def fksVolumeClass (col : G.Coloring Bool) (a : V) : ZigzagAlg k G :=
  bipartiteSign k G col a • zigzagBacktrack k G connected nontrivial a

theorem fksVolumeClass_central (col : G.Coloring Bool) (a : V) (x : ZigzagAlg k G) :
    fksVolumeClass k G connected nontrivial col a * x =
      x * fksVolumeClass k G connected nontrivial col a := sorry

/-- The center parameter `c = Σ_b x_b X_b` as a duplex curvature. -/
noncomputable def zigzagCenterParameter (col : G.Coloring Bool) (c : V → k) :
    FKSCurvature (zigzagParityAlgebra k G) where
  val := ∑ v, c v • fksVolumeClass k G connected nontrivial col v
  mem := sorry
  central := sorry

abbrev ZigzagReflectionTensor (a : V) :=
  TensorProduct k
    (LeftVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a))
    (RightVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a))

noncomputable instance zigzagReflectionTensorLeftModule (a : V) :
    Module (ZigzagAlg k G) (ZigzagReflectionTensor k G connected nontrivial a) := sorry

noncomputable instance zigzagReflectionTensorRightModule (a : V) :
    Module (ZigzagAlg k G)ᵐᵒᵖ (ZigzagReflectionTensor k G connected nontrivial a) := sorry

/-- The tensor grading on `P_a ⊗_k {}_aP`, collapsed to parity. -/
noncomputable def zigzagReflectionTensorGrading (a : V) :
    FKSGrading (ZMod 2) (ZigzagReflectionTensor k G connected nontrivial a) := sorry

theorem zigzagReflectionTensorGrading_tmul (a : V) {p q : ZMod 2}
    (x : LeftVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a))
    (y : RightVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a))
    (hx : x.1 ∈ (zigzagParityAlgebra k G).grading.piece p)
    (hy : y.1 ∈ (zigzagParityAlgebra k G).grading.piece q) :
    x ⊗ₜ[k] y ∈ (zigzagReflectionTensorGrading k G connected nontrivial a).piece (p + q) := sorry

/-- `m_a : P_a ⊗ {}_aP → A` is literal multiplication; it is a bimodule map. -/
noncomputable def zigzagVertexMultiplication (a : V) :
    ZigzagReflectionTensor k G connected nontrivial a →ₗ[k] ZigzagAlg k G := sorry

@[simp] theorem zigzagVertexMultiplication_tmul (a : V)
    (x : LeftVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a))
    (y : RightVertexProjective (ZigzagAlg k G) (zigzagVertexIdempotent k G connected nontrivial a)) :
    zigzagVertexMultiplication k G connected nontrivial a (x ⊗ₜ[k] y) = x.1 * y.1 := sorry

/-- The ordinary Frobenius coevaluation `A → P_a ⊗ {}_aP` for the sibling roadmap's symmetric
trace; it is a bimodule map. -/
noncomputable def zigzagVertexComultiplication (a : V) :
    ZigzagAlg k G →ₗ[k] ZigzagReflectionTensor k G connected nontrivial a := sorry

/-- The coevaluation on `1`, pushed into `A ⊗_k A`: `Y_a ⊗ e_a + e_a ⊗ Y_a + Σ_(a--b) (a⟶b) ⊗ (b⟶a)`
(the first factor starts at `a`, the second ends at `a`, in the later-factor-first convention). -/
theorem zigzagVertexComultiplication_one (a : V) :
    TensorProduct.map
        (leftVertexProjectiveSubtype k (ZigzagAlg k G)
          (zigzagVertexIdempotent k G connected nontrivial a))
        (rightVertexProjectiveSubtype k (ZigzagAlg k G)
          (zigzagVertexIdempotent k G connected nontrivial a))
        (zigzagVertexComultiplication k G connected nontrivial a 1) =
      zigzagBacktrack k G connected nontrivial a ⊗ₜ[k]
          (zigzagVertexIdempotent k G connected nontrivial a : ZigzagAlg k G) +
        (zigzagVertexIdempotent k G connected nontrivial a : ZigzagAlg k G) ⊗ₜ[k]
          zigzagBacktrack k G connected nontrivial a +
        ∑ b : V, if h : G.Adj a b then
          zigzagArrow k G connected nontrivial a b h ⊗ₜ[k]
            zigzagArrow k G connected nontrivial b a h.symm else 0 := sorry

/-- FKS's `Δ_a = ε_a · coevaluation` (FKS §6.1, transported through the colouring). -/
noncomputable def fksComultiplication (col : G.Coloring Bool) (a : V) :
    ZigzagAlg k G →ₗ[k] ZigzagReflectionTensor k G connected nontrivial a :=
  bipartiteSign k G col a • zigzagVertexComultiplication k G connected nontrivial a

/-- The carrier `A ⊕ (P_a ⊗ {}_aP)[1]` of the reflection duplex `C_{a,x}` (FKS (6.1)): the
unshifted summand `A` and the shifted summand `P_a ⊗ {}_aP`. -/
@[ext] structure FKSReflectionKernel (a : V) where
  unshifted : ZigzagAlg k G
  shifted : ZigzagReflectionTensor k G connected nontrivial a

/-- The underlying pair. -/
def FKSReflectionKernel.equivProd (a : V) :
    FKSReflectionKernel k G connected nontrivial a ≃
      ZigzagAlg k G × ZigzagReflectionTensor k G connected nontrivial a where
  toFun v := (v.unshifted, v.shifted)
  invFun p := ⟨p.1, p.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

noncomputable instance (a : V) : AddCommGroup (FKSReflectionKernel k G connected nontrivial a) :=
  (FKSReflectionKernel.equivProd k G connected nontrivial a).addCommGroup

/-- The left action; on the shifted summand it is twisted by the parity involution, as for any
shift (FKS §2.1: `a ∘ m = (-1)^|a| a m` on `M[1]`).  Pinned by `fksReflectionKernel_smul`. -/
noncomputable instance (a : V) :
    Module (ZigzagAlg k G) (FKSReflectionKernel k G connected nontrivial a) := sorry

/-- The right action is untwisted.  Pinned by `fksReflectionKernel_op_smul`. -/
noncomputable instance (a : V) :
    Module (ZigzagAlg k G)ᵐᵒᵖ (FKSReflectionKernel k G connected nontrivial a) := sorry

theorem fksReflectionKernel_smul (a : V) (x : ZigzagAlg k G)
    (v : FKSReflectionKernel k G connected nontrivial a) :
    x • v = ⟨x * v.unshifted,
      (zigzagParityAlgebra k G).parityInvolution FKSParity.zmod2 x •
        v.shifted⟩ := sorry

theorem fksReflectionKernel_op_smul (a : V) (x : ZigzagAlg k G)
    (v : FKSReflectionKernel k G connected nontrivial a) :
    MulOpposite.op x • v = ⟨v.unshifted * x, MulOpposite.op x • v.shifted⟩ := sorry

/-- The reflection kernel `C_{a,-x_a}` of FKS (6.1): the parity-graded bimodule
`A ⊕ (P_a ⊗ {}_aP)[1]`, with `d(u, t) = (-x_a m_a(t), Δ_a(u))`.  Its square is
`l(s_a(c)) - r(c)` (FKS (6.3)--(6.4)), so tensoring sends curvature `c` to `s_a(c)`. -/
noncomputable def fksReflectionKernel (col : G.Coloring Bool) (a : V) (c : V → k) :
    FKSCurvedBimodule FKSParity.zmod2 (zigzagParityAlgebra k G)
      (zigzagCenterParameter k G connected nontrivial col (reflectCenterParameter G a c))
      (zigzagCenterParameter k G connected nontrivial col c)
      (FKSReflectionKernel k G connected nontrivial a) where
  grading :=
    { piece := fun p ↦
        { carrier := {v | v.unshifted ∈ (zigzagParityAlgebra k G).grading.piece p ∧
              v.shifted ∈ (zigzagReflectionTensorGrading k G connected nontrivial a).piece (p + 1)}
          add_mem' := sorry
          zero_mem' := sorry
          neg_mem' := sorry }
      isInternal := sorry }
  smul_mem_left := sorry
  smul_mem_right := sorry
  actions_commute := sorry
  d :=
    { toFun := fun v ↦
        ⟨(-c a) • zigzagVertexMultiplication k G connected nontrivial a v.shifted,
          fksComultiplication k G connected nontrivial col a v.unshifted⟩
      map_zero' := sorry
      map_add' := sorry }
  d_mem := sorry
  d_d := sorry
  d_smul_left := sorry
  d_smul_right := sorry

/-- The duplex stable category `Mod₂(Ã_c)` of the zigzag algebra at center parameter `c`. -/
abbrev ZigzagDuplexStable (col : G.Coloring Bool) (c : V → k) :=
  FKSStableCategory FKSParity.zmod2 (zigzagParityAlgebra k G)
    (zigzagCenterParameter k G connected nontrivial col c)

/-- The duplex homotopy category `K₂(A,c)`. -/
abbrev ZigzagDuplexHomotopy (col : G.Coloring Bool) (c : V → k) :=
  FKSHomotopyCategory FKSParity.zmod2 (zigzagParityAlgebra k G)
    (zigzagCenterParameter k G connected nontrivial col c)

/-- The inverse of `fksExtensionModuleToCurved`, fixed once for the zigzag duplexes. -/
noncomputable def zigzagCurvedToExtensionModule (col : G.Coloring Bool) (c : V → k) :
    FKSCurvedObject FKSParity.zmod2 (zigzagParityAlgebra k G)
        (zigzagCenterParameter k G connected nontrivial col c) ⥤
      FKSGradedModule (fksExtensionGradedAlgebra FKSParity.zmod2
        (zigzagParityAlgebra k G)
        (zigzagCenterParameter k G connected nontrivial col c)) :=
  (fksExtensionModuleToCurved _ _ _).inv

noncomputable instance (col : G.Coloring Bool) (c : V → k) :
    (zigzagCurvedToExtensionModule k G connected nontrivial col c).Additive := sorry

/-- FKS Lemma 6.1: tensoring with `C_{a,-x_a}` sends projective `Ã_c`-modules to objects that are
zero in `Mod₂(Ã_(s_a c))`, so it descends to the stable categories. -/
theorem fksReflection_kills_projectiveIdeal (col : G.Coloring Bool) (a : V) (c : V → k) :
    (FKSGradedModule.projectiveIdeal (fksExtensionGradedAlgebra FKSParity.zmod2
        (zigzagParityAlgebra k G)
        (zigzagCenterParameter k G connected nontrivial col c))).Kills
      (fksExtensionModuleToCurved _ _ _ ⋙
        (fksReflectionKernel k G connected nontrivial col a c).tensorFunctor ⋙
        zigzagCurvedToExtensionModule k G connected nontrivial col (reflectCenterParameter G a c) ⋙
        (FKSGradedModule.projectiveIdeal _).quotientFunctor) := sorry

/-- The reflection functor `R_a : Mod₂(Ã_c) → Mod₂(Ã_(s_a c))`, obtained from tensoring with the
literal kernel through `Mod₂(Ã) ≃ Com₂(A, -)`. -/
noncomputable def fksReflectionStableFunctor (col : G.Coloring Bool) (a : V) (c : V → k) :
    ZigzagDuplexStable k G connected nontrivial col c ⥤
      ZigzagDuplexStable k G connected nontrivial col (reflectCenterParameter G a c) :=
  StablePeriodicCurved.MorphismIdeal.lift _
    (fksExtensionModuleToCurved _ _ _ ⋙
      (fksReflectionKernel k G connected nontrivial col a c).tensorFunctor ⋙
      zigzagCurvedToExtensionModule k G connected nontrivial col (reflectCenterParameter G a c) ⋙
      (FKSGradedModule.projectiveIdeal _).quotientFunctor)
    (fksReflection_kills_projectiveIdeal k G connected nontrivial col a c)

/-- The stable and homotopy reflection functors agree through `Φ₂`. -/
noncomputable def fksReflectionStableFunctor_comp_stableToHomotopy (col : G.Coloring Bool) (a : V)
    (c : V → k) :
    fksReflectionStableFunctor k G connected nontrivial col a c ⋙ fksStableToHomotopy _ _ _ ≅
      fksStableToHomotopy _ _ _ ⋙
        (fksReflectionKernel k G connected nontrivial col a c).homotopyFunctor := sorry

/-- FKS Proposition 6.1: for `x_a ≠ 0` the reflection functor is an equivalence. -/
theorem fksReflectionStableFunctor_isEquivalence (col : G.Coloring Bool) (a : V) (c : V → k)
    (ha : c a ≠ 0) :
    (fksReflectionStableFunctor k G connected nontrivial col a c).IsEquivalence := sorry

/-- The augmentation character at a vertex: `e_a ↦ 1` and every other basis vector `↦ 0`. -/
noncomputable def zigzagVertexCharacter (a : V) : ZigzagAlg k G →ₐ[k] k := sorry

theorem zigzagVertexCharacter_basis_self (a : V) :
    zigzagVertexCharacter k G a
      (ZigzagPreprojective.zigzagBasis k G connected nontrivial (Sum.inl a)) = 1 := sorry

theorem zigzagVertexCharacter_basis_ne (a : V) (i : ZigzagPreprojective.ZigzagBasisIndex G)
    (hi : i ≠ Sum.inl a) :
    zigzagVertexCharacter k G a
      (ZigzagPreprojective.zigzagBasis k G connected nontrivial i) = 0 := sorry

/-- The carrier of the simple module `S_a`: a copy of `k`, on which `A` acts through the vertex
character. -/
@[nolint unusedArguments]
def ZigzagVertexSimple (_connected : G.Connected) (_nontrivial : 1 < Fintype.card V) (_a : V) :=
  k

instance (a : V) : AddCommGroup (ZigzagVertexSimple k G connected nontrivial a) :=
  inferInstanceAs (AddCommGroup k)

noncomputable instance (a : V) : Module (ZigzagAlg k G) (ZigzagVertexSimple k G connected nontrivial a) :=
  Module.compHom k (zigzagVertexCharacter k G a).toRingHom

/-- `S_a` in even parity with zero differential, a duplex of curvature `0` since the degree-two
center acts by zero on it. -/
noncomputable def zigzagVertexSimpleDuplex (col : G.Coloring Bool) (a : V) :
    FKSCurvedObject FKSParity.zmod2 (zigzagParityAlgebra k G)
      (zigzagCenterParameter k G connected nontrivial col 0) where
  carrier := ModuleCat.of _ (ZigzagVertexSimple k G connected nontrivial a)
  str :=
    { grading :=
        { piece := fun p ↦ if p = 0 then ⊤ else ⊥
          isInternal := sorry }
      smul_mem := sorry
      d := 0
      d_mem := sorry
      d_d := sorry
      d_smul := sorry }

/-- Positive acceptance test: `S_a` with zero differential is nonzero in `K₂(A,0)`, since a
null-homotopy of its identity would give `1 = h d + d h = 0`. -/
theorem zigzagVertexSimpleDuplex_homotopy_not_isZero (col : G.Coloring Bool) (a : V) :
    ¬ Limits.IsZero ((fksHomotopyIdeal _ _ _).quotientFunctor.obj
      (zigzagVertexSimpleDuplex k G connected nontrivial col a)) := sorry

/-- Hence its preimage is a nonzero object of `Mod₂(Ã_0)`. -/
theorem zigzagVertexSimpleDuplex_stable_not_isZero (col : G.Coloring Bool) (a : V) :
    ¬ Limits.IsZero ((FKSGradedModule.projectiveIdeal _).quotientFunctor.obj
      ((fksExtensionModuleToCurved _ _ _).inv.obj
        (zigzagVertexSimpleDuplex k G connected nontrivial col a))) := sorry

end ZigzagFKS

/-- The reflection orbit and the exact genericity condition used in FKS's Weyl-action theorem. -/
inductive ReflectionReachable {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (c : V → k) : (V → k) → Prop
  | base : ReflectionReachable G c c
  | reflect {c'} : ReflectionReachable G c c' → (a : V) →
      ReflectionReachable G c (reflectCenterParameter G a c')

def FKSGeneric {k V : Type*} [CommRing k] (G : SimpleGraph V)
    [DecidableEq V] [DecidableRel G.Adj] (c : V → k) : Prop :=
  ∀ c', ReflectionReachable G c c' → ∀ a, c' a ≠ 0

/-- The reflection orbit of `c`. -/
abbrev FKSOrbit {k V : Type*} [CommRing k] (G : SimpleGraph V) [DecidableEq V]
    [DecidableRel G.Adj] (c : V → k) :=
  {c' : V → k // ReflectionReachable G c c'}

def FKSOrbit.reflect {k V : Type*} [CommRing k] {G : SimpleGraph V} [DecidableEq V]
    [DecidableRel G.Adj] {c : V → k} (a : V) (c' : FKSOrbit G c) : FKSOrbit G c :=
  ⟨reflectCenterParameter G a c'.1, c'.2.reflect a⟩

section Orbit

variable (k : Type u) [Field k] {V : Type u} [Fintype V] [DecidableEq V]
variable (G : SimpleGraph V) [DecidableRel G.Adj]
variable (connected : G.Connected) (nontrivial : 1 < Fintype.card V)
variable (col : G.Coloring Bool) (c : V → k)

/-- The orbit category: the disjoint union of the curvature fibres `Mod₂(Ã_c')` over the orbit of
`c`, with fibre inclusions `CategoryTheory.Sigma.incl`. -/
abbrev FKSOrbitStableCategory :=
  Σ c' : FKSOrbit G c, ZigzagDuplexStable k G connected nontrivial col c'.1

/-- The orbit reflection functor sends the fibre over `c'` to the fibre over `s_a c'` by
`fksReflectionStableFunctor`. -/
noncomputable def fksOrbitReflectionFunctor (a : V) :
    FKSOrbitStableCategory k G connected nontrivial col c ⥤
      FKSOrbitStableCategory k G connected nontrivial col c :=
  CategoryTheory.Sigma.desc fun c' ↦
    fksReflectionStableFunctor k G connected nontrivial col a c'.1 ⋙
      CategoryTheory.Sigma.incl
        (C := fun c'' : FKSOrbit G c ↦ ZigzagDuplexStable k G connected nontrivial col c''.1)
        (c'.reflect a)

/-- Restricted to each fibre, the orbit functor is tensoring with the literal kernel. -/
noncomputable def fksOrbitReflectionFunctor_incl (a : V) (c' : FKSOrbit G c) :
    CategoryTheory.Sigma.incl c' ⋙ fksOrbitReflectionFunctor k G connected nontrivial col c a ≅
      fksReflectionStableFunctor k G connected nontrivial col a c'.1 ⋙
        CategoryTheory.Sigma.incl
        (C := fun c'' : FKSOrbit G c ↦ ZigzagDuplexStable k G connected nontrivial col c''.1)
        (c'.reflect a) :=
  CategoryTheory.Sigma.inclDesc _ c'

noncomputable def fksReflection_commutes (a b : V) (hab : ¬ G.Adj a b) :
    fksOrbitReflectionFunctor k G connected nontrivial col c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c b ≅
      fksOrbitReflectionFunctor k G connected nontrivial col c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c a := sorry

noncomputable def fksReflection_braid (a b : V) (hab : G.Adj a b) :
    fksOrbitReflectionFunctor k G connected nontrivial col c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c a ≅
      fksOrbitReflectionFunctor k G connected nontrivial col c b ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c b := sorry

/-- The Coxeter relation `R_a ∘ R_a ≅ Id` on a generic orbit (FKS Proposition 6.1 on each fibre,
using `reflectCenterParameter_reflectCenterParameter`).  With the commuting and braid relations
this makes the `R_a` a Weyl group action (FKS Theorem 1). -/
noncomputable def fksReflection_square (generic : FKSGeneric G c) (a : V) :
    fksOrbitReflectionFunctor k G connected nontrivial col c a ⋙
        fksOrbitReflectionFunctor k G connected nontrivial col c a ≅ 𝟭 _ := sorry

theorem fksOrbitReflection_isEquivalence_of_generic (generic : FKSGeneric G c) (a : V) :
    (fksOrbitReflectionFunctor k G connected nontrivial col c a).IsEquivalence := sorry

end Orbit

/-- The flagship `Ẽ₈` target uses the concrete nine-vertex sibling graph and kernel, for any
two-colouring of the tree. -/
noncomputable def affineE8FKSReflectionKernel
    (col : ZigzagPreprojective.affineE8Graph.Coloring Bool) (a : Fin 9) (c : Fin 9 → ℂ) :=
  fksReflectionKernel ℂ ZigzagPreprojective.affineE8Graph
    (by native_decide) (by native_decide) col a c

/-! ## Executable integration checks -/

theorem cyclic_three_regular_sum_sq : ∑ _i : Fin 3, (1 : ℕ) ^ 2 = 3 := by native_decide

theorem binaryDihedral_regular_sum_sq (n : ℕ) (hn : 2 ≤ n) :
    4 * 1 ^ 2 + (n - 1) * 2 ^ 2 = 4 * n := by omega

theorem affineE8_zigzag_dimension :
    2 * 9 + 2 * ZigzagPreprojective.affineE8Graph.edgeFinset.card = 34 :=
  ZigzagPreprojective.zigzagDimension_affineE8

end TauCetiRoadmap.McKaySkewGroup

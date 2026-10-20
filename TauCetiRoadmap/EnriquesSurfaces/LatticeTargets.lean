import TauCeti.LinearAlgebra.IntegralLattice.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
Illustrative targets for EnriquesSurfaces E5. The README is definitive; these
signatures are suggestions, not an exhaustive specification. The integral
carrier and its pairing come from the native embedded integral lattice API.
The ordered coordinates are f₁,…,f₉,δ, with geometric intersection signs.
-/

open scoped BigOperators
open Module

namespace TauCetiRoadmap.EnriquesSurfaces

abbrev Index := Fin 10
abbrev Ambient := Index → ℚ

/-- Intersection matrix on the ordered integral basis f₁,…,f₉,δ. -/
def gram : Matrix Index Index ℤ := fun i j ↦
  if i = 9 then (if j = 9 then 10 else 3)
  else if j = 9 then 3 else if i = j then 0 else 1

theorem gram_isSymm : gram.IsSymm := by decide +kernel

/-- The actual integral lattice in a fixed rational ambient space. -/
noncomputable def model : TauCeti.IntegralLattice Ambient :=
  TauCeti.IntegralLattice.ofGramMatrix (Pi.basisFun ℚ Index) gram gram_isSymm

noncomputable def modelBasis : Basis Index ℤ model :=
  TauCeti.IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ Index) gram gram_isSymm

/-- Coordinates are integral combinations of the native carrier basis. -/
noncomputable def vector (v : Index → ℤ) : model := ∑ i, v i • modelBasis i

def f10Coordinates : Index → ℤ := fun i ↦ if i = 9 then 3 else -1

def betaCoordinates (i : Index) : Index → ℤ :=
  if i = 0 then fun j ↦ if j = 9 then 1 else if j.val < 4 then -1 else 0
  else if i = 9 then Pi.single 8 1 - f10Coordinates
  else Pi.single ⟨i.val - 1, by omega⟩ 1 - Pi.single i 1

def rCoordinates : Index → ℤ := Pi.single 9 1 - 2 • f10Coordinates

noncomputable def beta (i : Index) : model := vector (betaCoordinates i)
noncomputable def r : model := vector rCoordinates

/-- The parity map uses the integral pairing on M, not rational membership tests. -/
noncomputable def parity : model →ₗ[ℤ] ZMod 2 where
  toFun x := (model.integralForm r x : ZMod 2)
  map_add' x y := by simp
  map_smul' n x := by simp

/-- R lives as a submodule of the same rational ambient as M. -/
noncomputable def reyeCarrier : Submodule ℤ Ambient :=
  parity.ker.map model.carrier.subtype

/-- The beta span is specified independently of the parity kernel. -/
noncomputable def betaSpan : Submodule ℤ Ambient :=
  Submodule.span ℤ (Set.range fun i ↦ (beta i : Ambient))

/-- A square minus two root acts by x ↦ x + (β,x)β. -/
noncomputable def simpleReflection (i : Index) : Module.End ℤ model :=
  LinearMap.id + LinearMap.smulRight (model.integralForm (beta i)) (beta i)

def adjacent (i j : Index) : Prop :=
  (i.val > 0 ∧ j.val > 0 ∧ (i.val + 1 = j.val ∨ j.val + 1 = i.val)) ∨
  (i = 0 ∧ j = 4) ∨ (i = 4 ∧ j = 0)

instance (i j : Index) : Decidable (adjacent i j) := by
  unfold adjacent
  infer_instance

/-- The ambient unimodular model is not the index two root sublattice. -/
theorem gram_det : gram.det = -1 := by sorry

theorem beta_pairing (i j : Index) :
    model.integralForm (beta i) (beta j) =
      if i = j then -2 else if adjacent i j then 1 else 0 := by sorry

theorem r_square : model.integralForm r r = -2 := by sorry

theorem r_beta_pairing (i : Index) :
    model.integralForm r (beta i) = if i = 9 then -2 else 0 := by sorry

/-- Proving inclusion alone does not establish the index or equality. -/
theorem betaSpan_eq_reyeCarrier : betaSpan = reyeCarrier := by sorry

theorem parity_surjective : Function.Surjective parity := by sorry

theorem simpleReflection_involutive (i : Index) :
    Function.Involutive (simpleReflection i) := by sorry

theorem simpleReflection_isometry (i : Index) (x y : model) :
    model.integralForm (simpleReflection i x) (simpleReflection i y) =
      model.integralForm x y := by sorry

theorem simpleReflection_preserves_parity (i : Index) (x : model) :
    parity (simpleReflection i x) = parity x := by sorry

end TauCetiRoadmap.EnriquesSurfaces

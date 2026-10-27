/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.CategoryTheory.Monoidal.Rigid.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The prototypes give actual dagger, Q-system, and splitting equations over native
categories and monoid objects. Banach/predual structure and analytic positivity
are the constructions of the README, rather than empty proposition fields.
-/

universe v u
open CategoryTheory MonoidalCategory
namespace CategoricalOperatorAlgebras

variable (C : Type u) [Category.{v} C]

/-- An involution reverses arrows; it is chosen data on the native category. -/
class Dagger where
  map : {X Y : C} → (X ⟶ Y) → (Y ⟶ X)
  map_id : ∀ X, map (𝟙 X) = 𝟙 X
  map_comp : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    map (f ≫ g) = map g ≫ map f
  involutive : ∀ {X Y : C} (f : X ⟶ Y), map (map f) = f

variable {C} [Dagger C]
def dagger {X Y : C} (f : X ⟶ Y) : Y ⟶ X := Dagger.map f

@[simp] theorem dagger_dagger {X Y : C} (f : X ⟶ Y) :
    dagger (dagger f) = f := Dagger.involutive f

@[simp] theorem dagger_comp {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    dagger (f ≫ g) = dagger g ≫ dagger f := Dagger.map_comp f g

/-- The analytic category proves these equations characterize unitary arrows. -/
def IsUnitary {X Y : C} (f : X ⟶ Y) : Prop :=
  f ≫ dagger f = 𝟙 X ∧ dagger f ≫ f = 𝟙 Y

theorem IsUnitary.dagger {X Y : C} {f : X ⟶ Y} (h : IsUnitary f) :
    IsUnitary (dagger f) := by
  simpa only [IsUnitary, dagger_dagger] using And.intro h.2 h.1

section Linear
variable [Preadditive C] [Linear ℂ C]

/-- The dagger on an analytic category conjugates complex scalars. -/
class LinearDagger : Prop where
  map_add : ∀ {X Y : C} (f g : X ⟶ Y), dagger (f + g) = dagger f + dagger g
  map_smul : ∀ {X Y : C} (z : ℂ) (f : X ⟶ Y),
    dagger (z • f) = star z • dagger f

variable [LinearDagger (C := C)]

theorem dagger_smul {X Y : C} (z : ℂ) (f : X ⟶ Y) :
    dagger (z • f) = star z • dagger f := LinearDagger.map_smul z f

end Linear

section Monoidal
variable [MonoidalCategory C]

/-- Extra dagger compatibility for the native monoidal structure. -/
class MonoidalDagger : Prop where
  tensor : ∀ {X Y X' Y' : C} (f : X ⟶ Y) (g : X' ⟶ Y'),
    dagger (f ⊗ₘ g) = dagger f ⊗ₘ dagger g
  associator : ∀ X Y Z : C, IsUnitary (α_ X Y Z).hom
  leftUnitor : ∀ X : C, IsUnitary (λ_ X).hom
  rightUnitor : ∀ X : C, IsUnitary (ρ_ X).hom

/-- Algebraic Q-system axioms in the separable convention μμ†=1.
The multiplication/unit are supplied by Mathlib's `MonObj`, not restated. -/
class QSystem (Q : C) [MonObj Q] : Prop where
  special : dagger (MonObj.mul (X := Q)) ≫ MonObj.mul = 𝟙 Q
  frobenius_left : MonObj.mul (X := Q) ≫ dagger MonObj.mul =
    (𝟙 Q ⊗ₘ dagger MonObj.mul) ≫ (α_ Q Q Q).inv ≫ (MonObj.mul ⊗ₘ 𝟙 Q)
  frobenius_right : MonObj.mul (X := Q) ≫ dagger MonObj.mul =
    (dagger MonObj.mul ⊗ₘ 𝟙 Q) ≫ (α_ Q Q Q).hom ≫ (𝟙 Q ⊗ₘ MonObj.mul)

variable (Q : C) [MonObj Q] [QSystem Q]

/-- The multiplication has its dagger as a specified section. -/
def multiplicationSplitEpi : SplitEpi (MonObj.mul (X := Q)) where
  section_ := dagger MonObj.mul
  id := QSystem.special


/-- A chosen symmetric self-duality, stated using explicit native pairings.
`φ` is the component of the pivotal comparison, which the README constructs. -/
structure SymmetricSelfDuality (X D DD : C) [ExactPairing X D]
    [ExactPairing D DD] (φ : X ≅ DD) where
  iso : X ≅ D
  unitary : IsUnitary iso.hom
  symmetric : (iso.hom ⊗ₘ 𝟙 X) ≫ ε_ X D =
    (φ.hom ⊗ₘ iso.hom) ≫ ε_ D DD

/-- Transport a real pointing along a unitary change of the underlying object.
Mathlib's exactPairingCongrLeft transports the evaluation; Tau Ceti supplies its evaluation lemma. -/
def SymmetricSelfDuality.transport {X X' D DD : C} [ExactPairing X' D]
    [ExactPairing D DD] (φ : X' ≅ DD) (i : X ≅ X') (hi : IsUnitary i.hom)
    (S : SymmetricSelfDuality X' D DD φ) :
    letI : ExactPairing X D := exactPairingCongrLeft i
    SymmetricSelfDuality X D DD (i ≪≫ φ) := by
  letI : ExactPairing X D := exactPairingCongrLeft i
  refine { iso := i ≪≫ S.iso, unitary := ?_, symmetric := ?_ }
  · simp only [IsUnitary, Iso.trans_hom, dagger_comp, Category.assoc]
    exact ⟨by rw [reassoc_of% S.unitary.1, hi.1], by rw [reassoc_of% hi.2, S.unitary.2]⟩
  · rw [TauCeti.exactPairingCongrLeft_evaluation]
    simp only [Iso.trans_hom]
    calc ((i.hom ≫ S.iso.hom) ⊗ₘ 𝟙 X) ≫ D ◁ i.hom ≫ ε_ X' D
        = (i.hom ⊗ₘ i.hom) ≫ (S.iso.hom ⊗ₘ 𝟙 X') ≫ ε_ X' D := by
          rw [← id_tensorHom, tensorHom_comp_tensorHom_assoc,
            tensorHom_comp_tensorHom_assoc]
          simp
      _ = (i.hom ⊗ₘ i.hom) ≫ (φ.hom ⊗ₘ S.iso.hom) ≫ ε_ D DD := by rw [S.symmetric]
      _ = ((i.hom ≫ φ.hom) ⊗ₘ (i.hom ≫ S.iso.hom)) ≫ ε_ D DD := by
          rw [tensorHom_comp_tensorHom_assoc]

/-- Representative equations for the actions in a Q-system bimodule.
The Frobenius and coisometry conditions are actual equations. -/
structure QSystemBimodule (P Q X : C) [MonObj P] [MonObj Q]
    [QSystem P] [QSystem Q] where
  left : P ⊗ X ⟶ X
  right : X ⊗ Q ⟶ X
  left_unit : (MonObj.one ⊗ₘ 𝟙 X) ≫ left = (λ_ X).hom
  right_unit : (𝟙 X ⊗ₘ MonObj.one) ≫ right = (ρ_ X).hom
  commute : (left ⊗ₘ 𝟙 Q) ≫ right =
    (α_ P X Q).hom ≫ (𝟙 P ⊗ₘ right) ≫ left
  left_assoc : (MonObj.mul ⊗ₘ 𝟙 X) ≫ left =
    (α_ P P X).hom ≫ (𝟙 P ⊗ₘ left) ≫ left
  right_assoc : (right ⊗ₘ 𝟙 Q) ≫ right =
    (α_ X Q Q).hom ≫ (𝟙 X ⊗ₘ MonObj.mul) ≫ right
  left_frobenius₁ : left ≫ dagger left =
    (𝟙 P ⊗ₘ dagger left) ≫ (α_ P P X).inv ≫ (MonObj.mul ⊗ₘ 𝟙 X)
  left_frobenius₂ : left ≫ dagger left =
    (dagger MonObj.mul ⊗ₘ 𝟙 X) ≫ (α_ P P X).hom ≫ (𝟙 P ⊗ₘ left)
  right_frobenius₁ : right ≫ dagger right =
    (dagger right ⊗ₘ 𝟙 Q) ≫ (α_ X Q Q).hom ≫ (𝟙 X ⊗ₘ MonObj.mul)
  right_frobenius₂ : right ≫ dagger right =
    (𝟙 X ⊗ₘ dagger MonObj.mul) ≫ (α_ X Q Q).inv ≫ (right ⊗ₘ 𝟙 Q)
  left_special : dagger left ≫ left = 𝟙 X
  right_special : dagger right ≫ right = 𝟙 X


/-- The actual balanced projector, including the unit insertion and reassociations. -/
def balancedProjector (P Q R X Y : C) [MonObj P] [MonObj Q] [MonObj R]
    [QSystem P] [QSystem Q] [QSystem R]
    (B : QSystemBimodule P Q X) (D : QSystemBimodule Q R Y) : X ⊗ Y ⟶ X ⊗ Y :=
  ((ρ_ X).inv ⊗ₘ 𝟙 Y) ≫
    ((𝟙 X ⊗ₘ (MonObj.one (X := Q) ≫ dagger MonObj.mul)) ⊗ₘ 𝟙 Y) ≫
    ((α_ X Q Q).inv ⊗ₘ 𝟙 Y) ≫ (α_ (X ⊗ Q) Q Y).hom ≫
    (B.right ⊗ₘ D.left)

variable [MonoidalDagger (C := C)]

theorem balancedProjector_selfAdjoint (P Q R X Y : C)
    [MonObj P] [MonObj Q] [MonObj R] [QSystem P] [QSystem Q] [QSystem R]
    (B : QSystemBimodule P Q X) (D : QSystemBimodule Q R Y) :
    dagger (balancedProjector P Q R X Y B D) = balancedProjector P Q R X Y B D := by
  sorry

theorem balancedProjector_idempotent (P Q R X Y : C)
    [MonObj P] [MonObj Q] [MonObj R] [QSystem P] [QSystem Q] [QSystem R]
    (B : QSystemBimodule P Q X) (D : QSystemBimodule Q R Y) :
    balancedProjector P Q R X Y B D ≫ balancedProjector P Q R X Y B D =
      balancedProjector P Q R X Y B D := by
  sorry

section Rescaling
variable [Preadditive C] [Linear ℂ C] [MonoidalPreadditive C] [MonoidalLinear ℂ C]

noncomputable def scaledUnit (d : ℝ) (Q : C) [MonObj Q] : 𝟙_ C ⟶ Q :=
  (Real.sqrt d : ℂ) • MonObj.one

noncomputable def scaledMultiplication (d : ℝ) (Q : C) [MonObj Q] : Q ⊗ Q ⟶ Q :=
  ((Real.sqrt d)⁻¹ : ℂ) • MonObj.mul

noncomputable def scaledAlgebraMorphism (d₁ d₂ : ℝ) {Q₁ Q₂ : C} (f : Q₁ ⟶ Q₂) : Q₁ ⟶ Q₂ :=
  (Real.sqrt (d₂ / d₁) : ℂ) • f

theorem scaledAlgebraMorphism_unit (d₁ d₂ : ℝ) (h₁ : 0 < d₁) (h₂ : 0 < d₂)
    {Q₁ Q₂ : C} [MonObj Q₁] [MonObj Q₂] (f : Q₁ ⟶ Q₂)
    (hf : MonObj.one ≫ f = MonObj.one) :
    scaledUnit d₁ Q₁ ≫ scaledAlgebraMorphism d₁ d₂ f = scaledUnit d₂ Q₂ := by
  sorry

theorem scaledAlgebraMorphism_mul (d₁ d₂ : ℝ) (h₁ : 0 < d₁) (h₂ : 0 < d₂)
    {Q₁ Q₂ : C} [MonObj Q₁] [MonObj Q₂] (f : Q₁ ⟶ Q₂)
    (hf : MonObj.mul ≫ f = (f ⊗ₘ f) ≫ MonObj.mul) :
    scaledMultiplication d₁ Q₁ ≫ scaledAlgebraMorphism d₁ d₂ f =
      (scaledAlgebraMorphism d₁ d₂ f ⊗ₘ scaledAlgebraMorphism d₁ d₂ f) ≫
        scaledMultiplication d₂ Q₂ := by
  sorry

end Rescaling

end Monoidal

/-- A unitary splitting of a self-adjoint idempotent, with actual range object. -/
structure UnitarySplitting {X : C} (p : X ⟶ X) where
  image : C
  inclusion : image ⟶ X
  projection : X ⟶ image
  adjoint : dagger inclusion = projection
  range : projection ≫ inclusion = p
  identity : inclusion ≫ projection = 𝟙 image

/-- The range idempotent is self-adjoint by the splitting equations. -/
theorem UnitarySplitting.selfAdjoint {X : C} {p : X ⟶ X}
    (S : UnitarySplitting p) : dagger p = p := by
  rw [← S.range, dagger_comp, ← S.adjoint, dagger_dagger]

theorem UnitarySplitting.idempotent {X : C} {p : X ⟶ X}
    (S : UnitarySplitting p) : p ≫ p = p := by
  rw [← S.range]
  rw [Category.assoc, ← Category.assoc S.inclusion S.projection S.inclusion,
    S.identity, Category.id_comp]


/-- A real structure with the double-conjugation comparison explicitly typed. -/
structure RealStructure (J : C ⥤ C) (ν : 𝟭 C ⟶ J ⋙ J) (X : C) where
  iso : X ≅ J.obj X
  unitary : IsUnitary iso.hom
  real : iso.hom ≫ J.map iso.hom = ν.app X

/-- Transport of real structures along a pointing/conjugacy comparison. -/
def PreservesRealStructure (J : C ⥤ C) (ν : 𝟭 C ⟶ J ⋙ J)
    (F : C ⥤ C) {X Y : C} (rX : RealStructure J ν X)
    (rY : RealStructure J ν Y) (χ : F.obj (J.obj X) ⟶ J.obj (F.obj X))
    (h : F.obj X ≅ Y) : Prop :=
  h.hom ≫ rY.iso.hom = F.map rX.iso.hom ≫ χ ≫ J.map h.hom

section Bicategorical
universe w
variable {B : Type u} [Bicategory.{w, v} B]
variable [∀ a b : B, Dagger (a ⟶ b)]
open Bicategory

/-- EndMonoidal uses the bicategory's chosen hom-category dagger. -/
abbrev QSystemAt (b : B) [MonoidalDagger (C := EndMonoidal b)]
    (Q : EndMonoidal b) [MonObj Q] :=
  QSystem Q

/-- Cross-object action data; the monoidal QSystemBimodule above is the one-object case.
The README also requires the associativity, Frobenius and specialness 2-cell equations. -/
structure BimoduleActions {a b : B} (P : a ⟶ a) (Q : b ⟶ b) (X : a ⟶ b)
    [MonObj P] [MonObj Q] where
  left : (P ≫ X) ⟶ X
  right : (X ≫ Q) ⟶ X
  left_unit : (MonObj.one ▷ X) ≫ left = (Bicategory.leftUnitor X).hom
  right_unit : (X ◁ MonObj.one) ≫ right = (Bicategory.rightUnitor X).hom
  commute : (left ▷ Q) ≫ right = (Bicategory.associator P X Q).hom ≫ (P ◁ right) ≫ left

end Bicategorical

end CategoricalOperatorAlgebras

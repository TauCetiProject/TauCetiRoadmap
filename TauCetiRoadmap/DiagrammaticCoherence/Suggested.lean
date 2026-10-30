/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.CategoryTheory.Monoidal.Free.Coherence

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

The prototype fixes C0's arbitrary-arity signature, raw terms and syntactically generated
monoidal congruence against Mathlib's existing object-generated structural category. The
geometric categories, their independently defined isotopies, and the five duality/braiding
extensions are targets of the README, not uninterpreted `Prop` fields in this prototype.
-/

@[expose] public section

namespace DiagrammaticCoherence

open CategoryTheory MonoidalCategory

universe u v w w'

/-- Coupon boundaries are actual tensor expressions, not independent names for such expressions.
The formal unit admits coupons with no input or no output. -/
structure TensorSignature where
  Obj : Type u
  Gen : Type v
  source : Gen → FreeMonoidalCategory Obj
  target : Gen → FreeMonoidalCategory Obj

abbrev Object (sig : TensorSignature.{u, v}) := FreeMonoidalCategory sig.Obj

/-- The structural arrows reuse native Mac Lane coherence. Arbitrary coupon arrows are new. -/
inductive Raw (sig : TensorSignature.{u, v}) : Object sig → Object sig → Type (max u v)
  | structural {X Y} (f : X ⟶ Y) : Raw sig X Y
  | coupon (g : sig.Gen) : Raw sig (sig.source g) (sig.target g)
  | comp {X Y Z} (f : Raw sig X Y) (g : Raw sig Y Z) : Raw sig X Z
  | tensor {X X' Y Y'} (f : Raw sig X X') (g : Raw sig Y Y') :
      Raw sig (X ⊗ Y) (X' ⊗ Y')

/-- Interpret object generators and coupons in an arbitrary, possibly non-strict target. -/
structure Interpretation (sig : TensorSignature.{u, v}) (C : Type w)
    [Category.{w'} C] [MonoidalCategory C] where
  obj : sig.Obj → C
  map (g : sig.Gen) : FreeMonoidalCategory.projectObj obj (sig.source g) ⟶
    FreeMonoidalCategory.projectObj obj (sig.target g)

namespace Interpretation

variable {sig : TensorSignature.{u, v}} {C : Type w} [Category.{w'} C] [MonoidalCategory C]

abbrev evalObj (I : Interpretation sig C) : Object sig → C :=
  FreeMonoidalCategory.projectObj I.obj

def eval (I : Interpretation sig C) : {X Y : Object sig} → Raw sig X Y →
    (I.evalObj X ⟶ I.evalObj Y)
  | _, _, .structural f => (FreeMonoidalCategory.project I.obj).map f
  | _, _, .coupon g => I.map g
  | _, _, .comp f g => I.eval f ≫ I.eval g
  | _, _, .tensor f g => I.eval f ⊗ₘ I.eval g

end Interpretation

/-- The monoidal relations are syntax, independent of interpretations or geometric isotopy.
The native structural category supplies its own associator/unit coherence; the last three
constructors impose their naturality with respect to the new coupon terms. -/
inductive MonoidalRel (sig : TensorSignature.{u, v}) :
    {X Y : Object sig} → Raw sig X Y → Raw sig X Y → Prop
  | refl {X Y} (f : Raw sig X Y) : MonoidalRel sig f f
  | symm {X Y} {f g : Raw sig X Y} : MonoidalRel sig f g → MonoidalRel sig g f
  | trans {X Y} {f g h : Raw sig X Y} :
      MonoidalRel sig f g → MonoidalRel sig g h → MonoidalRel sig f h
  | comp {X Y Z} {f f' : Raw sig X Y} {g g' : Raw sig Y Z} :
      MonoidalRel sig f f' → MonoidalRel sig g g' →
        MonoidalRel sig (.comp f g) (.comp f' g')
  | tensor {X X' Y Y'} {f f' : Raw sig X X'} {g g' : Raw sig Y Y'} :
      MonoidalRel sig f f' → MonoidalRel sig g g' →
        MonoidalRel sig (.tensor f g) (.tensor f' g')
  | id_comp {X Y} (f : Raw sig X Y) :
      MonoidalRel sig (.comp (.structural (𝟙 X)) f) f
  | comp_id {X Y} (f : Raw sig X Y) :
      MonoidalRel sig (.comp f (.structural (𝟙 Y))) f
  | assoc {X Y Z W} (f : Raw sig X Y) (g : Raw sig Y Z) (h : Raw sig Z W) :
      MonoidalRel sig (.comp (.comp f g) h) (.comp f (.comp g h))
  | structural_comp {X Y Z} (f : X ⟶ Y) (g : Y ⟶ Z) :
      MonoidalRel sig (.comp (.structural f) (.structural g)) (.structural (f ≫ g))
  | structural_tensor {X X' Y Y'} (f : X ⟶ X') (g : Y ⟶ Y') :
      MonoidalRel sig (.tensor (.structural f) (.structural g)) (.structural (f ⊗ₘ g))
  | tensor_comp {X X' X'' Y Y' Y''}
      (f : Raw sig X X') (f' : Raw sig X' X'')
      (g : Raw sig Y Y') (g' : Raw sig Y' Y'') :
      MonoidalRel sig (.tensor (.comp f f') (.comp g g'))
        (.comp (.tensor f g) (.tensor f' g'))
  | associator_naturality {X X' Y Y' Z Z'}
      (f : Raw sig X X') (g : Raw sig Y Y') (h : Raw sig Z Z') :
      MonoidalRel sig
        (.comp (.tensor (.tensor f g) h) (.structural (α_ X' Y' Z').hom))
        (.comp (.structural (α_ X Y Z).hom) (.tensor f (.tensor g h)))
  | leftUnitor_naturality {X Y} (f : Raw sig X Y) :
      MonoidalRel sig
        (.comp (.tensor (.structural (𝟙 (𝟙_ (Object sig)))) f)
          (.structural (λ_ Y).hom))
        (.comp (.structural (λ_ X).hom) f)
  | rightUnitor_naturality {X Y} (f : Raw sig X Y) :
      MonoidalRel sig
        (.comp (.tensor f (.structural (𝟙 (𝟙_ (Object sig)))))
          (.structural (ρ_ Y).hom))
        (.comp (.structural (ρ_ X).hom) f)

/-- C0 soundness in a genuinely non-strict target. Completeness with respect to the independent
geometric relation is a further target; it is not the definition of `MonoidalRel`. -/
theorem eval_eq_of_monoidalRel {sig : TensorSignature.{u, v}} {C : Type w}
    [Category.{w'} C] [MonoidalCategory C] (I : Interpretation sig C)
    {X Y : Object sig} {f g : Raw sig X Y} (h : MonoidalRel sig f g) :
    I.eval f = I.eval g := by
  sorry

/-- Rigid boundary normal forms retain the integer number of dual operations. -/
abbrev WindingWord (A : Type u) := List (A × ℤ)

def rightDualWord {A : Type u} (w : WindingWord A) : WindingWord A :=
  w.reverse.map (fun p => (p.1, p.2 + 1))

def leftDualWord {A : Type u} (w : WindingWord A) : WindingWord A :=
  w.reverse.map (fun p => (p.1, p.2 - 1))

/-- Mixed dual cancellation is already a word identity. Same-handed double duals are not. -/
theorem leftDualWord_rightDualWord {A : Type u} (w : WindingWord A) :
    leftDualWord (rightDualWord w) = w := by
  sorry

end DiagrammaticCoherence

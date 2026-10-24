import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Split
import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.Data.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.Algebra.Ring.Subring.Basic

/-!
The README is the definitive specification. These suggested forms illustrate native
carriers and are not an exhaustive checklist. Admissions are mathematical targets,
not implemented proofs. No topological K-group is used as an algebraic stand-in.
-/

namespace TauCetiRoadmap.AlgebraicKTheory

open Matrix
universe u v w

variable {R : Type u} [Ring R]

/-- The existing finite-projective full subcategory, with right-module convention. -/
abbrev FiniteProjectiveRight (R : Type u) [Ring R] :=
  (TauCeti.finiteProjectiveModules Rᵐᵒᵖ).FullSubcategory

/-- The existing categorical split K₀, without a duplicate presentation engine. -/
abbrev KZero (R : Type u) [Ring R] :=
  TauCeti.SplitK0.{u} (FiniteProjectiveRight R)

/-- Elementary subgroup on the actual native matrix-unit group. Generalize the
native transvection API to noncommutative rings with this same matrix formula. -/
def elementary (n : Type v) [Fintype n] [DecidableEq n] :
    Subgroup (Matrix.GeneralLinearGroup n R) :=
  Subgroup.closure {g | ∃ (i j : n) (_ : i ≠ j) (a : R),
    (g : Matrix n n R) = 1 + Matrix.single i j a}

/-- Padding by the identity on the extra coordinates. -/
noncomputable def stabilize (n m : ℕ) (h : n ≤ m) :
    Matrix.GeneralLinearGroup (Fin n) R →*
      Matrix.GeneralLinearGroup (Fin m) R := by
  sorry

/-- Pins the convention omitted from the implementation of the suggested map. -/
theorem stabilize_apply (n m : ℕ) (h : n ≤ m)
    (g : Matrix.GeneralLinearGroup (Fin n) R) (i j : Fin m) :
    (stabilize n m h g : Matrix (Fin m) (Fin m) R) i j =
      if hi : i.val < n then
        if hj : j.val < n then (g : Matrix (Fin n) (Fin n) R) ⟨i.val, hi⟩ ⟨j.val, hj⟩
        else 0
      else if i = j then 1 else 0 := by
  sorry

instance stabilizationSystem :
    DirectedSystem (fun n : ℕ => Matrix.GeneralLinearGroup (Fin n) R)
      (fun n m h => stabilize n m h (R := R)) := by
  sorry

/-- Native directed colimit of actual invertible matrices. -/
abbrev StableGL (R : Type u) [Ring R] :=
  DirectLimit (fun n : ℕ => Matrix.GeneralLinearGroup (Fin n) R)
    (fun n m h => stabilize n m h (R := R))

/-- The stable elementary subgroup retains actual finite-stage witnesses. -/
noncomputable def stableElementary (R : Type u) [Ring R] : Subgroup (StableGL R) :=
  Subgroup.closure {g | ∃ (n : ℕ) (u : Matrix.GeneralLinearGroup (Fin n) R),
    u ∈ elementary (R := R) (Fin n) ∧ g = ⟦⟨n, u⟩⟧}

/-- Whitehead's lemma identifies the two concrete subgroup presentations. -/
theorem whitehead : stableElementary R = commutator (StableGL R) := by
  sorry

/-- Algebraic K₁ uses the stable group abelianization. -/
abbrev KOne (R : Type u) [Ring R] := Abelianization (StableGL R)

/-- Coordinate-free finite block factorization, with the actual inverse unit. -/
theorem diagonal_inverse_elementary (n : Type v) [Fintype n] [DecidableEq n]
    (g : Matrix.GeneralLinearGroup n R) :
    ∃ U : Matrix.GeneralLinearGroup (n ⊕ n) R,
      (U : Matrix (n ⊕ n) (n ⊕ n) R) =
        Matrix.fromBlocks (g : Matrix n n R) 0 0 (↑(g⁻¹) : Matrix n n R) ∧
      U ∈ elementary (R := R) (n ⊕ n) := by
  sorry

/-- Surjectivity lifts elementary products, not arbitrary invertibles. -/
theorem elementary_lift {S : Type w} [Ring S] (f : S →+* R)
    (hf : Function.Surjective f) (n : Type v) [Fintype n] [DecidableEq n]
    (g : Matrix.GeneralLinearGroup n R) (hg : g ∈ elementary (R := R) n) :
    ∃ h : Matrix.GeneralLinearGroup n S,
      h ∈ elementary (R := S) n ∧
        Units.map (f.mapMatrix.toMonoidHom) h = g := by
  sorry

/-- The pair condition is a native subring of a product of arbitrary rings. -/
def pullbackRing {A₁ : Type u} {A₂ : Type v} {Q : Type w}
    [Ring A₁] [Ring A₂] [Ring Q] (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q) :
    Subring (A₁ × A₂) where
  carrier := {x | π₁ x.1 = π₂ x.2}
  zero_mem' := by simp
  one_mem' := by simp
  add_mem' := by
    intro a b ha hb
    change π₁ (a.1 + b.1) = π₂ (a.2 + b.2)
    simp only [map_add]
    rw [ha, hb]
  neg_mem' := by
    intro a ha
    change π₁ (-a.1) = π₂ (-a.2)
    simp only [map_neg]
    rw [ha]
  mul_mem' := by
    intro a b ha hb
    change π₁ (a.1 * b.1) = π₂ (a.2 * b.2)
    simp only [map_mul]
    rw [ha, hb]

/-- The matrix used for the Milnor boundary is idempotent, with no adjoint
condition. The quotient identity follows from a lift of diag(u,u⁻¹). -/
theorem boundary_idempotent {A : Type u} {Q : Type v} [Ring A] [Ring Q]
    (π : A →+* Q) (n : Type w) [Fintype n] [DecidableEq n]
    (u : Matrix.GeneralLinearGroup n Q)
    (X : Matrix.GeneralLinearGroup (n ⊕ n) A)
    (hX : Units.map (π.mapMatrix.toMonoidHom) X =
      (show Matrix.GeneralLinearGroup (n ⊕ n) Q from
        { val := Matrix.fromBlocks (u : Matrix n n Q) 0 0 (↑(u⁻¹) : Matrix n n Q)
          inv := Matrix.fromBlocks (↑(u⁻¹) : Matrix n n Q) 0 0 (u : Matrix n n Q)
          val_inv := by simp [Matrix.fromBlocks_multiply]
          inv_val := by simp [Matrix.fromBlocks_multiply] })) :
    let e : Matrix (n ⊕ n) (n ⊕ n) A := Matrix.fromBlocks 1 0 0 0
    let p := (X : Matrix (n ⊕ n) (n ⊕ n) A) * e * (↑(X⁻¹) : Matrix (n ⊕ n) (n ⊕ n) A)
    p * p = p ∧ π.mapMatrix p = Matrix.fromBlocks 1 0 0 0 := by
  sorry


/-! The balanced tensor and pure-tensor laws are specified in the README.
These are honest whole-function construction families over arbitrary rings;
they do not reassert the commutative native extension as a general construction.
-/
open CategoryTheory

noncomputable def noncommutativeExtendScalars :
    ∀ {R₀ : Type u} {S₀ : Type v} [Ring R₀] [Ring S₀] (f : R₀ →+* S₀),
      ModuleCat.{max u v w} R₀ ⥤ ModuleCat.{max u v w} S₀ := by
  sorry

noncomputable def noncommutativeExtendRestrictAdj :
    ∀ {R₀ : Type u} {S₀ : Type v} [Ring R₀] [Ring S₀] (f : R₀ →+* S₀),
      noncommutativeExtendScalars.{u, v, w} f ⊣
        ModuleCat.restrictScalars.{max u v w, u, v} f := by
  sorry

end TauCetiRoadmap.AlgebraicKTheory

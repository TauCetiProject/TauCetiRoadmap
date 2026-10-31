import Mathlib

/-!
# Checkerboard cofactor comparisons: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
The finite algebra below does not supply the geometric checkerboard signs or
identify native half-edge arcs with undercrossing-cut Fox arcs by assumption.
-/
noncomputable section
namespace CheckerboardCofactorTargets
open Matrix

def reducedA {R : Type*} {n : ℕ} (A : Matrix (Fin (n+1)) (Fin (n+1)) R)
    (i j : Fin (n+1)) : Matrix (Fin n) (Fin n) R :=
  A.submatrix i.succAbove j.succAbove

theorem signed_cofactor_constant {n : ℕ}
    (A : Matrix (Fin (n+1)) (Fin (n+1)) ℤ) (ε : Fin (n+1) → ℤˣ)
    (hrow : A.mulVec (fun _ ↦ 1) = 0)
    (hcol : Matrix.vecMul (fun i ↦ (ε i : ℤ)) A = 0) :
    ∃ κ : ℤ, ∀ i j, (-1 : ℤ)^(i.val+j.val) * (reducedA A i j).det = (ε i : ℤ)*κ := by
  sorry

theorem reduced_unimodular_equivalence {n : ℕ}
    (A : Matrix (Fin (n+1)) (Fin (n+1)) ℤ) (ε : Fin (n+1) → ℤˣ)
    (hrow : A.mulVec (fun _ ↦ 1) = 0)
    (hcol : Matrix.vecMul (fun i ↦ (ε i : ℤ)) A = 0)
    (i j k l : Fin (n+1)) :
    ∃ P Q : Matrix (Fin n) (Fin n) ℤ,
      IsUnit P.det ∧ IsUnit Q.det ∧ reducedA A k l = P * reducedA A i j * Q := by
  sorry

def zeroAt {R : Type*} [CommRing R] {n : ℕ} (j : Fin (n+1)) :
    Submodule R (Fin (n+1) → R) :=
  (LinearMap.proj j : (Fin (n+1) → R) →ₗ[R] R).ker

def basedKernel {R : Type*} [CommRing R] {n : ℕ}
    (A : Matrix (Fin (n+1)) (Fin (n+1)) R) (j : Fin (n+1)) :
    Submodule R (Fin (n+1) → R) :=
  A.mulVecLin.ker ⊓ zeroAt j

theorem coordinate_deletion {R : Type*} [CommRing R] {n : ℕ} (j : Fin (n+1)) :
    ∃ e : zeroAt (R := R) j ≃ₗ[R] (Fin n → R),
      (∀ x k, e x k = (x : Fin (n+1) → R) (j.succAbove k)) ∧
      (∀ v, (e.symm v : Fin (n+1) → R) = Fin.insertNth j 0 v) := by
  sorry

theorem omitted_row_equations {R : Type*} [CommRing R] {n : ℕ}
    (A : Matrix (Fin (n+1)) (Fin (n+1)) ℤ) (ε : Fin (n+1) → ℤˣ)
    (hcol : Matrix.vecMul (fun i ↦ (ε i : ℤ)) A = 0)
    (i j : Fin (n+1)) (x : Fin (n+1) → R) (hx : x j = 0) :
    (A.map (Int.castRingHom R)).mulVec x = 0 ↔
      ((reducedA A i j).map (Int.castRingHom R)).mulVec (fun k ↦ x (j.succAbove k)) = 0 := by
  sorry

theorem based_kernel_change {R : Type*} [CommRing R] {n : ℕ}
    (A : Matrix (Fin (n+1)) (Fin (n+1)) R)
    (hrow : A.mulVec (fun _ ↦ 1) = 0) (j l : Fin (n+1)) :
    ∃ e : basedKernel A j ≃ₗ[R] basedKernel A l,
      ∀ x p, (e x : Fin (n+1) → R) p = (x : Fin (n+1) → R) p - (x : Fin (n+1) → R) l := by
  sorry

theorem one_row_zero_cofactor :
    (reducedA (0 : Matrix (Fin 1) (Fin 1) ℤ) 0 0).det = 1 := by simp [reducedA]

/-- Coincident over/under arc occurrences add their coefficients; they are not overwritten. -/
def coincidentArcRow : Matrix (Fin 1) (Fin 1) ℤ :=
  fun _ _ ↦ 2 - 1 - 1

theorem coincidentArcRow_zero : coincidentArcRow = 0 := by
  ext i j
  norm_num [coincidentArcRow]

end CheckerboardCofactorTargets

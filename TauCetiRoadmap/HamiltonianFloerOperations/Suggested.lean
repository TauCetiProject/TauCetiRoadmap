import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.LinearAlgebra.BilinearMap
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Ring

/-!
# Hamiltonian Floer operations: selected algebraic interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
These samples describe bilinear components and finite reference-orbit matrices;
they do not construct geometric Floer complexes, counts, orientations or PSS.

The integer-graded `CochainProductComponents` interface applies to the c1-zero
lane, or another lane where the coefficient ring has degree zero. A coefficient
ring whose monomials change integer degrees does not act on each integer
homogeneous component. The README retains its graded Laurent, completed residue
and general rational virtual constructions.
-/

namespace TauCetiRoadmap.HamiltonianFloerOperations

universe u v

section Components

variable {R : Type u} [CommRing R]

/-- Actual bilinear maps between homogeneous components of three supplied
integer-graded cochain complexes over a degree-zero coefficient ring. -/
abbrev CochainProductComponents
    (C₁ C₂ C₀ : CochainComplex (ModuleCat.{v} R) ℤ) : Type _ :=
  ∀ i j : ℤ, C₁.X i →ₗ[R] C₂.X j →ₗ[R] C₀.X (i + j)

end Components

section Matrices

variable {R : Type u} [CommRing R] {r₁ r₂ r₀ : ℕ}

/-- Coefficients in chosen finite reference-orbit bases. The ring may be the
actual supported Novikov ring after its geometric support theorem. -/
abbrev ProductMatrix (R : Type u) (r₁ r₂ r₀ : ℕ) :=
  Fin r₁ → Fin r₂ → Fin r₀ → R

/-- The finite-reference product determined by its supplied coefficient matrix. -/
def matrixProduct (M : ProductMatrix R r₁ r₂ r₀)
    (a : Fin r₁ → R) (b : Fin r₂ → R) : Fin r₀ → R :=
  fun z => ∑ x, ∑ y, a x * b y * M x y z

theorem matrixProduct_add_left (M : ProductMatrix R r₁ r₂ r₀)
    (a a' : Fin r₁ → R) (b : Fin r₂ → R) :
    matrixProduct M (a + a') b = matrixProduct M a b + matrixProduct M a' b := by
  funext z
  simp only [matrixProduct, Pi.add_apply, add_mul, Finset.sum_add_distrib]

theorem matrixProduct_smul_left (M : ProductMatrix R r₁ r₂ r₀)
    (c : R) (a : Fin r₁ → R) (b : Fin r₂ → R) :
    matrixProduct M (c • a) b = c • matrixProduct M a b := by
  funext z
  simp only [matrixProduct, Pi.smul_apply, smul_eq_mul, Finset.mul_sum, mul_assoc]

theorem matrixProduct_add_right (M : ProductMatrix R r₁ r₂ r₀)
    (a : Fin r₁ → R) (b b' : Fin r₂ → R) :
    matrixProduct M a (b + b') = matrixProduct M a b + matrixProduct M a b' := by
  funext z
  simp only [matrixProduct, Pi.add_apply, mul_add, add_mul, Finset.sum_add_distrib]

theorem matrixProduct_smul_right (M : ProductMatrix R r₁ r₂ r₀)
    (c : R) (a : Fin r₁ → R) (b : Fin r₂ → R) :
    matrixProduct M a (c • b) = c • matrixProduct M a b := by
  funext z
  simp only [matrixProduct, Pi.smul_apply, smul_eq_mul]
  calc
    (∑ x, ∑ y, a x * (c * b y) * M x y z) =
        ∑ x, ∑ y, c * (a x * b y * M x y z) := by
          apply Finset.sum_congr rfl
          intro x _
          apply Finset.sum_congr rfl
          intro y _
          ring
    _ = c * (∑ x, ∑ y, a x * b y * M x y z) := by
          simp only [Finset.mul_sum]

/-- The actual bilinear map on finite free coefficient modules. -/
def productBilinear (M : ProductMatrix R r₁ r₂ r₀) :
    (Fin r₁ → R) →ₗ[R] (Fin r₂ → R) →ₗ[R] (Fin r₀ → R) :=
  LinearMap.mk₂ R (matrixProduct M)
    (matrixProduct_add_left M) (matrixProduct_smul_left M)
    (matrixProduct_add_right M) (matrixProduct_smul_right M)

@[simp] theorem productBilinear_apply (M : ProductMatrix R r₁ r₂ r₀)
    (a : Fin r₁ → R) (b : Fin r₂ → R) (z : Fin r₀) :
    productBilinear M a b z = ∑ x, ∑ y, a x * b y * M x y z := rfl

/-- Basis evaluation recovers every entry, including its supplied matrix data. -/
@[simp] theorem productBilinear_single (M : ProductMatrix R r₁ r₂ r₀)
    (x : Fin r₁) (y : Fin r₂) (z : Fin r₀) :
    productBilinear M (Pi.single x 1) (Pi.single y 1) z = M x y z := by
  classical
  simp [productBilinear_apply, Pi.single_apply, ite_mul, mul_ite]

/-- The coefficient matrix is determined by its bilinear operation. -/
theorem productBilinear_injective :
    Function.Injective (productBilinear (R := R) (r₁ := r₁) (r₂ := r₂) (r₀ := r₀)) := by
  intro M N h
  funext x y z
  have hxy := congrArg (fun f => f (Pi.single x 1) (Pi.single y 1) z) h
  simpa only [productBilinear_single] using hxy

end Matrices

end TauCetiRoadmap.HamiltonianFloerOperations

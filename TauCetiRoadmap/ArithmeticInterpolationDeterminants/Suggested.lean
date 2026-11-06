import Mathlib
import TauCeti.RingTheory.MvPolynomial.Kronecker
import TauCeti.RingTheory.MvPolynomial.HasseDeriv.Taylor
import TauCeti.LinearAlgebra.Matrix.AbsoluteValue

/-!
# Polynomial interpolation and arithmetic determinants: representative interfaces

The roadmap is `README.md`. This file gives a selection of suggested interfaces,
not an exhaustive checklist. Admitted proofs are roadmap targets. Every definition
below has an explicit mathematical body; no field assumes the desired conclusions.
-/

noncomputable section

set_option autoImplicit false

open Polynomial Module
open scoped BigOperators NumberField

namespace TauCetiRoadmap.ArithmeticInterpolationDeterminants

section Substitution

variable {R : Type*} [CommRing R]

/-- The native evaluation homomorphism, with variables `0 = Z` and `1 = W`. -/
def powerSubstitution (B : ℕ) : MvPolynomial (Fin 2) R →ₐ[R] R[X] :=
  MvPolynomial.aeval (fun i => if i = 0 then X else X ^ B)

theorem powerSubstitution_injOn (B : ℕ) (hB : 0 < B) :
    Set.InjOn (powerSubstitution (R := R) B)
      {f : MvPolynomial (Fin 2) R | f.degreeOf 0 < B} := by
  sorry

theorem iterate_derivative_powerSubstitution {p : ℕ} [Fact p.Prime] [CharP R p]
    (k : ℕ) (f : MvPolynomial (Fin 2) R) :
    (Polynomial.derivative^[k]) (powerSubstitution p f) =
      powerSubstitution p ((MvPolynomial.pderiv (0 : Fin 2))^[k] f) := by
  sorry

theorem hasseDeriv_powerSubstitution {p : ℕ} [Fact p.Prime] [CharP R p]
    (k : ℕ) (hk : k < p) (f : MvPolynomial (Fin 2) R) :
    Polynomial.hasseDeriv k (powerSubstitution p f) =
      powerSubstitution p (MvPolynomial.hasseDeriv (Finsupp.single 0 k) f) := by
  sorry

end Substitution

section Hermite

variable {K : Type*} [Field K] {r : ℕ}

/-- Finite Hasse jets, restricted to the native degree submodule. -/
def hermiteJet (a : Fin r → K) (m : Fin r → ℕ) :
    Polynomial.degreeLT K (∑ i, m i) →ₗ[K] (∀ i, Fin (m i) → K) where
  toFun f i k := (Polynomial.hasseDeriv (k : ℕ) (f : K[X])).eval (a i)
  map_add' := by sorry
  map_smul' := by sorry

theorem hermiteJet_bijective (a : Fin r → K) (ha : Function.Injective a)
    (m : Fin r → ℕ) : Function.Bijective (hermiteJet a m) := by
  sorry

/-- Kernel on all polynomials; this is not the kernel on `degreeLT`. -/
theorem all_jets_vanish_iff_dvd (a : Fin r → K) (ha : Function.Injective a)
    (m : Fin r → ℕ) (f : K[X]) :
    (∀ i (k : Fin (m i)), (Polynomial.hasseDeriv (k : ℕ) f).eval (a i) = 0) ↔
      (∏ i, (X - C (a i)) ^ m i) ∣ f := by
  sorry

end Hermite

section Minors

theorem exists_full_row_minor {K : Type*} [Field K] {m n : ℕ}
    (A : Matrix (Fin m) (Fin n) K) (hA : LinearIndependent K A) :
    ∃ c : Fin m → Fin n, Function.Injective c ∧ (A.submatrix id c).det ≠ 0 := by
  sorry

theorem lift_nonzero_minor {R S : Type*} [CommRing R] [CommRing S] {m n : ℕ}
    (f : R →+* S) (A : Matrix (Fin m) (Fin n) R) (c : Fin m → Fin n)
    (h : ((A.map f).submatrix id c).det ≠ 0) : (A.submatrix id c).det ≠ 0 := by
  sorry

theorem coordinates_mem_extended_ideal {R A ι : Type*} [CommRing R] [CommRing A]
    [Algebra R A] [Fintype ι] (b : Basis ι R A) (J : Ideal R) (a : A) :
    a ∈ J.map (algebraMap R A) ↔ ∀ i, b.repr a i ∈ J := by
  sorry

end Minors

section Divisibility

variable {R : Type*} [CommRing R]

theorem det_mem_prod_row_ideals {n : ℕ} (A : Matrix (Fin n) (Fin n) R)
    (J : Fin n → Ideal R) (h : ∀ i j, A i j ∈ J i) :
    A.det ∈ ∏ i, J i := by
  sorry

theorem unitriangular_mul_minor {m n : ℕ} (U : Matrix (Fin m) (Fin m) R)
    (hdiag : ∀ i, U i i = 1) (htri : ∀ i j, i < j → U i j = 0)
    (A : Matrix (Fin m) (Fin n) R) (c : Fin m → Fin n) :
    ((U * A).submatrix id c).det = (A.submatrix id c).det := by
  sorry

theorem derivative_prod_mem_ideal_pow {ι : Type*} [Fintype ι]
    (f : ι → R[X]) (g : R[X]) (a : R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K → ((Polynomial.derivative^[k]) (f i)).eval a ∈ J) :
    ∀ k, k ≤ K → ((Polynomial.derivative^[k]) (g * ∏ i, f i)).eval a ∈
      J ^ Fintype.card ι := by
  sorry

theorem hasseDeriv_prod_mem_ideal_pow {ι : Type*} [Fintype ι]
    (f : ι → R[X]) (g : R[X]) (a : R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K → (Polynomial.hasseDeriv k (f i)).eval a ∈ J) :
    ∀ k, k ≤ K → (Polynomial.hasseDeriv k (g * ∏ i, f i)).eval a ∈
      J ^ Fintype.card ι := by
  sorry

theorem pderiv_prod_mem_ideal_pow {ι : Type*} [Fintype ι]
    (f : ι → MvPolynomial (Fin 2) R) (g : MvPolynomial (Fin 2) R)
    (a : Fin 2 → R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K →
      MvPolynomial.eval a ((MvPolynomial.pderiv (0 : Fin 2))^[k] (f i)) ∈ J) :
    ∀ k, k ≤ K →
      MvPolynomial.eval a ((MvPolynomial.pderiv (0 : Fin 2))^[k] (g * ∏ i, f i)) ∈
        J ^ Fintype.card ι := by
  sorry

end Divisibility

section Size

theorem norm_det_le_factorial_prod {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (B : Fin n → ℝ) (hB : ∀ i, 0 ≤ B i) (hA : ∀ i j, ‖A i j‖ ≤ B i) :
    ‖A.det‖ ≤ (n.factorial : ℝ) * ∏ i, B i := by
  sorry

theorem norm_hasseDeriv_eval_le (f : ℂ[X]) (d k : ℕ) (hd : f.natDegree ≤ d)
    (H A : ℝ) (hH : 0 ≤ H) (hA : 1 ≤ A)
    (hcoeff : ∀ j, ‖f.coeff j‖ ≤ H) (a : ℂ) (ha : ‖a‖ ≤ A) :
    ‖(Polynomial.hasseDeriv k f).eval a‖ ≤
      H * ∑ j ∈ Finset.Icc k d, (Nat.choose j k : ℝ) * A ^ (j - k) := by
  sorry

theorem integral_norm_scalar_pow_dvd {K : Type*} [Field K] [NumberField K]
    (a b : 𝓞 K) (m : ℤ) (e : ℕ) (h : a = (m : 𝓞 K) ^ e * b) :
    m ^ (Module.finrank ℚ K * e) ∣ Algebra.norm ℤ a := by
  sorry

theorem log_divisor_le_log_abs (z : ℤ) (hz : z ≠ 0) (P : Finset ℕ)
    (e : ℕ → ℕ) (hP : ∀ p ∈ P, p.Prime)
    (hdiv : (∏ p ∈ P, (p : ℤ) ^ e p) ∣ z) :
    ∑ p ∈ P, (e p : ℝ) * Real.log p ≤ Real.log |(z : ℝ)| := by
  sorry

end Size

/-- Hasse and ordinary derivatives differ by the factorial in integral examples. -/
example : Polynomial.hasseDeriv 3 (X ^ 3 : ℤ[X]) = 1 ∧
    (Polynomial.derivative^[3]) (X ^ 3 : ℤ[X]) = C 6 := by sorry

example : (X : (ZMod 3)[X]) ^ 3 ≠ 0 ∧
    Polynomial.derivative ((X : (ZMod 3)[X]) ^ 3) = 0 := by sorry

end TauCetiRoadmap.ArithmeticInterpolationDeterminants

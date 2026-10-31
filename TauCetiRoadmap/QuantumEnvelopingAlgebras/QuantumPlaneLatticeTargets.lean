/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots

/-!
**This file is not the roadmap and is not exhaustive.** The README is the
specification. These native matrices illustrate QEA8.1–8.2; they do not assume
that the future integral quantum algebra or its modules have been constructed.
The full divided-power, toral, Hopf-dual and exact-sequence comparisons remain
README targets. The admitted theorems here are targets, not proved results.
-/

noncomputable section

namespace QuantumEnvelopingAlgebras.QuantumPlaneLattice

open LaurentPolynomial

abbrev A := LaurentPolynomial ℤ

/-- Symmetric Gaussian polynomial by the denominator-free Pascal recurrence.
The exponent subtraction is in ℤ, including when the lower index is too large. -/
def gaussian : ℕ → ℕ → A
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, j + 1 =>
      T (-(j + 1 : ℤ)) * gaussian n (j + 1) +
        T ((n : ℤ) - (j : ℤ)) * gaussian n j

/-- Column j is the image of the jth divided-power Weyl vector. -/
def comparison (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  Matrix.diagonal fun j => gaussian n j.val

def monomialE (n r : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  fun i j => if j.val = i.val + r then gaussian j.val r else 0

def monomialF (n r : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  fun i j => if i.val = j.val + r then gaussian (n - j.val) r else 0

def weylE (n r : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  fun i j => if j.val = i.val + r then gaussian (n - j.val + r) r else 0

def weylF (n r : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  fun i j => if i.val = j.val + r then gaussian (j.val + r) r else 0

def torus (n : ℕ) (sign : ℤ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  Matrix.diagonal fun j => T (sign * ((n : ℤ) - 2 * (j.val : ℤ)))

/-- All divided-power intertwiners, including r = 0 and r > n. -/
theorem comparison_intertwines (n r : ℕ) :
    comparison n * weylE n r = monomialE n r * comparison n ∧
    comparison n * weylF n r = monomialF n r * comparison n ∧
    comparison n * torus n 1 = torus n 1 * comparison n := by
  sorry

/-- Injectivity is an integral assertion; it is not asserted after arbitrary base change. -/
theorem comparison_injective (n : ℕ) :
    Function.Injective (comparison n).mulVecLin := by
  sorry

/-- Coordinates in the dual Weyl basis, with QEA1's actual antipode. -/
def hopfDualComparison (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  fun i j => if i.val + j.val = n then
    (-1 : A) ^ j.val * T ((j.val : ℤ) * ((j.val : ℤ) + 1 - (n : ℤ))) else 0

/-- E and F on the left Hopf dual are transposes of the actual antipode matrices. -/
def dualE (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  (-(torus n (-1) * weylE n 1)).transpose

def dualF (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) A :=
  (-(weylF n 1 * torus n 1)).transpose

theorem hopfDualComparison_bijective (n : ℕ) :
    Function.Bijective (hopfDualComparison n).mulVecLin := by
  sorry

theorem hopfDualComparison_intertwines (n : ℕ) :
    hopfDualComparison n * monomialE n 1 = dualE n * hopfDualComparison n ∧
    hopfDualComparison n * monomialF n 1 = dualF n * hopfDualComparison n ∧
    hopfDualComparison n * torus n 1 =
      (torus n (-1)).transpose * hopfDualComparison n := by
  sorry

section Specialization

variable {k : Type*} [Field k] [CharZero k]

/-- Laurent evaluation requires a unit, so inverses survive scalar extension. -/
def specialize (z : kˣ) : A →+* k :=
  LaurentPolynomial.eval₂ (Int.castRingHom k) z

def specializedComparison (n : ℕ) (z : kˣ) :
    Matrix (Fin (n + 1)) (Fin (n + 1)) k :=
  fun i j => specialize z (comparison n i j)

theorem gaussian_at_one (n j : ℕ) :
    specialize (1 : kˣ) (gaussian n j) = (Nat.choose n j : k) := by
  sorry

theorem gaussian_first_root (ell : ℕ) (hell : 3 ≤ ell) (hodd : Odd ell)
    (z : kˣ) (hz : IsPrimitiveRoot (z : k) ell) (j : Fin (ell + 1)) :
    specialize z (gaussian ell j.val) =
      if j.val = 0 ∨ j.val = ell then 1 else 0 := by
  sorry

/-- Actual kernel and range, expressed in the native coordinate module.
The endpoint spans remain distinct from the interior kernel. -/
theorem specializedComparison_ker_range (ell : ℕ) (hell : 3 ≤ ell)
    (hodd : Odd ell) (z : kˣ) (hz : IsPrimitiveRoot (z : k) ell) :
    LinearMap.ker (specializedComparison ell z).mulVecLin =
      Submodule.span k {f | ∃ j : Fin (ell + 1),
        0 < j.val ∧ j.val < ell ∧ f = Pi.single j 1} ∧
    LinearMap.range (specializedComparison ell z).mulVecLin =
      Submodule.span k {f | ∃ j : Fin (ell + 1),
        (j.val = 0 ∨ j.val = ell) ∧ f = Pi.single j 1} := by
  sorry

end Specialization

end QuantumEnvelopingAlgebras.QuantumPlaneLattice

import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones
import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.LinearAlgebra.Matrix.Signature
import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The braid, consecutive-band pairs, linking-entry table and inertia are finite
native calculations. Their marked surface, push-offs and named-knot comparisons
remain geometric targets. A table lookup is not a signature proof.
-/

namespace TauCetiRoadmap.GeometricTopology.MirrorBlindChirality
open TauCeti LaurentPolynomial

/-- Knot Atlas's literal four-strand word, with zero-based native indices. -/
def word : BraidWord 4 :=
  [(0,1),(0,1),(0,1),(1,-1),(0,-1),(0,-1),(2,1),(1,-1),(2,1)]

def letter (i : Fin 9) : Fin 3 × ℤˣ := word.get i

def basisPairs : Fin 6 → Fin 9 × Fin 9 := ![(0,1),(1,2),(2,4),(3,7),(4,5),(6,8)]

/-- These are all consecutive occurrences in each generator column. -/
theorem basisPairs_exact : ∀ i j : Fin 9,
    (i < j ∧ (letter i).1 = (letter j).1 ∧
      ∀ k : Fin 9, i < k ∧ k < j → (letter k).1 ≠ (letter i).1) ↔
    ∃ a : Fin 6, basisPairs a = (i,j) := by decide +kernel

def forwardEntries (a b : Fin 6) : ℤ × ℤ :=
  let i := (basisPairs a).1
  let hi := (basisPairs a).2
  let j := (basisPairs b).1
  let hj := (basisPairs b).2
  if hi > hj ∨ hi < j then (0,0)
  else if hi = j then (if (letter j).2 = 1 then (0,1) else (-1,0))
  else if (letter i).1.val + 1 = (letter j).1.val then (1,0)
  else if (letter j).1.val + 1 = (letter i).1.val then (0,-1)
  else (0,0)

def entry (a b : Fin 6) : ℤ :=
  if a = b then
    if (letter (basisPairs a).1).2 = (letter (basisPairs a).2).2 then
      -((letter (basisPairs a).1).2 : ℤ) else 0
  else if a < b then (forwardEntries a b).1 else (forwardEntries b a).2

def matrix : Matrix (Fin 6) (Fin 6) ℤ :=
  !![-1,0,0,0,0,0; 1,-1,0,0,0,0; 0,1,0,1,-1,0;
     0,0,0,1,0,1; 0,0,0,0,1,0; 0,0,0,0,0,-1]

theorem entry_matrix : ∀ a b : Fin 6, matrix a b = entry a b := by
  intro a b
  fin_cases a <;> fin_cases b <;> rfl

theorem skew_determinant : (matrix - matrix.transpose).det = 1 := by decide +kernel

theorem word_permutation : ∀ i : Fin 4,
    BraidGroup.permHom 4 word.toBraid i = (![1,3,0,2] : Fin 4 → Fin 4) i := by
  simp only [word, BraidWord.toBraid, List.map_cons, List.map_nil, List.prod_cons,
    List.prod_nil, map_mul, map_zpow, BraidGroup.permHom_sigma]
  decide +kernel

def congruenceQ : Matrix (Fin 6) (Fin 6) ℚ :=
  !![1,0,0,0,0,0; 1/2,1,0,0,0,0; 1/3,2/3,1,0,0,0;
     -1/2,-1,-3/2,1,0,0; 2,4,6,-3,1,0; -1/2,-1,-3/2,1/4,-3/4,1]

def pivots : Fin 6 → ℚ := ![-2,-3/2,2/3,1/2,-4,-7/4]

theorem congruenceQ_det : congruenceQ.det = 1 := by decide +kernel

theorem congruenceQ_eq :
    congruenceQ * (matrix.map (Int.castRingHom ℚ) +
      (matrix.map (Int.castRingHom ℚ)).transpose) * congruenceQ.transpose =
      Matrix.diagonal pivots := by decide +kernel

def realMatrix : Matrix (Fin 6) (Fin 6) ℝ := matrix.map (Int.castRingHom ℝ)
noncomputable def congruenceR : Matrix (Fin 6) (Fin 6) ℝ := congruenceQ.map (Rat.castHom ℝ)

theorem congruenceR_det : congruenceR.det = 1 := by
  change ((Rat.castHom ℝ).mapMatrix congruenceQ).det = 1
  rw [← RingHom.map_det, congruenceQ_det]
  simp

set_option maxHeartbeats 2000000 in
theorem congruenceR_eq :
    congruenceR * (realMatrix + realMatrix.transpose) * congruenceR.transpose =
      Matrix.diagonal (pivots · : Fin 6 → ℝ) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [congruenceR, congruenceQ, realMatrix, matrix, pivots,
      Matrix.mul_apply, Fin.sum_univ_succ, Matrix.diagonal]

theorem real_signature : Matrix.signature realMatrix = -2 := by
  rw [← Matrix.signature_add_transpose realMatrix,
    Matrix.signature_eq_of_congr_diagonal
      (show IsUnit congruenceR.det from congruenceR_det ▸ isUnit_one) congruenceR_eq]
  norm_num [pivots, Fin.sum_univ_succ]

abbrev LCoeff := LaurentPolynomial ℤ
abbrev RhoCoeff := Polynomial LCoeff

noncomputable def rho : RhoCoeff :=
  Polynomial.C (-2 * T (-2) - 3 - 2 * T 2) +
    Polynomial.C (T (-2) + 4 + T 2) * Polynomial.X ^ 2 - Polynomial.X ^ 4

noncomputable def rhoMirror : RhoCoeff →+* RhoCoeff :=
  Polynomial.mapRingHom LaurentPolynomial.invert.toRingHom

theorem rho_mirror : rhoMirror rho = rho := by
  norm_num [rhoMirror, rho, map_ofNat]
  ring

/-- The same source formula in L=l² and M=m². -/
def evenExpression {R : Type*} [CommRing R] (a : Rˣ) (b : R) : R :=
  -2 * ((a⁻¹ : Rˣ) : R) - 3 - 2 * (a : R) +
    (((a⁻¹ : Rˣ) : R) + 4 + (a : R)) * b - b^2

theorem evenExpression_inv {R : Type*} [CommRing R] (a : Rˣ) (b : R) :
    evenExpression a⁻¹ b = evenExpression a b := by
  simp [evenExpression]
  ring

theorem conway_specialization {R : Type*} [CommRing R] (z : R) :
    evenExpression (-1 : Rˣ) (-z^2) = 1 - 2*z^2 - z^4 := by
  simp [evenExpression]
  ring

noncomputable def alexander : LCoeff := -T 2 + 2*T 1 - 1 + 2*T (-1) - T (-2)

theorem native_alexander : KnotTheory.alexander matrix = alexander := by
  sorry

noncomputable def jones : LCoeff := T 6 - T 4 + T 2 - 1 + T (-2) - T (-4) + T (-6)

theorem jones_mirror : LaurentPolynomial.invert jones = jones := by
  simp [jones]
  ring

/-- The Jones variable here is s=t^(1/2). -/
theorem native_jones : word.closure.jonesPolynomial = jones := by
  sorry

end TauCetiRoadmap.GeometricTopology.MirrorBlindChirality

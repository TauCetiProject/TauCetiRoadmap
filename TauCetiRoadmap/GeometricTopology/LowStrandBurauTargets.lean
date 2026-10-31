import TauCeti.KnotTheory.Burau.Reduced.Basic
import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones
import Mathlib.Analysis.SpecialFunctions.Complex.Circle

/-!
# Low-strand Burau and Jones target signatures

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These suggested native interfaces fix the determinant normalization and the
counterexample to the printed threshold 6.5. All geometric realization,
trace/block and positive-Hermitian-form comparisons specified there remain
required targets; elaborating these statements does not prove them.

The Laurent variable here is `u=t^(1/2)`, as in the native Jones polynomial.
The native Burau parameter is `t=u^2`. A polynomial `D` satisfying the displayed
normalization equation is the symmetric Alexander polynomial evaluated at `u^2`.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.LowStrandBurau

open TauCeti LaurentPolynomial

abbrev Coeff := LaurentPolynomial ℤ

def exponent (n : ℕ) (w : BraidWord n) : ℤ :=
  (w.map fun x ↦ (x.2 : ℤ)).sum

def reducedMatrix (n : ℕ) (w : BraidWord n) :
    Matrix (Fin (n - 1)) (Fin (n - 1)) Coeff :=
  (KnotTheory.reducedBurauCol n (isUnit_T (R := ℤ) 2).unit w.toBraid :
    Matrix (Fin (n - 1)) (Fin (n - 1)) Coeff)

def denominator (n : ℕ) : Coeff := ∑ j ∈ Finset.range n, T (2 * (j : ℤ))

def numerator (n : ℕ) (w : BraidWord n) : Coeff :=
  T ((n : ℤ) - 1 - exponent n w) * (1 - reducedMatrix n w).det

def signedPhase (e : ℤ) : Coeff :=
  (((-(isUnit_T (R := ℤ) 1).unit) ^ e : Coeffˣ) : Coeff)

def evaluate (z : ℂˣ) : Coeff →+* ℂ :=
  LaurentPolynomial.eval₂ (Int.castRingHom ℂ) z

/-- Existence and uniqueness are targets, rather than assumptions that a
geometric closure already has the desired normalized determinant quotient. -/
theorem normalizedAlexander_exists_unique (n : ℕ) (w : BraidWord n) (hn : 1 ≤ n)
    (hknot : w.closure.componentCount = 1) :
    ∃! D : Coeff, denominator n * D = numerator n w := by
  sorry

/-- This comparison includes the disconnected closures as well as knots. -/
theorem three_strand_trace (w : BraidWord 3) :
    w.closure.jonesPolynomial = signedPhase (exponent 3 w) *
      (T 2 + T (-2) + (reducedMatrix 3 w).trace) := by
  sorry

theorem three_strand_jones_alexander (w : BraidWord 3)
    (hknot : w.closure.componentCount = 1) (D : Coeff)
    (hD : denominator 3 * D = numerator 3 w) :
    w.closure.jonesPolynomial = T (exponent 3 w) *
      (T 2 + T (-2) + 1 + T (2 * exponent 3 w) -
        T (exponent 3 w - 2) * (1 + T 2 + T 4) * D) := by
  sorry

theorem four_strand_reciprocal (w : BraidWord 4)
    (hknot : w.closure.componentCount = 1) (D : Coeff)
    (hD : denominator 4 * D = numerator 4 w) :
    T (-2 * exponent 4 w) * w.closure.jonesPolynomial +
      T (2 * exponent 4 w) * invert w.closure.jonesPolynomial =
        (T (-3) + T (-1) + T 1 + T 3) *
          (T (exponent 4 w) + T (-exponent 4 w)) -
        (T (-4) + T (-2) + 2 + T 2 + T 4) * D := by
  sorry

def fifthRoot : ℂˣ :=
  Units.mk0 (Complex.exp (((2 * Real.pi / 5 : ℝ) : ℂ) * Complex.I))
    (Complex.exp_ne_zero _)

theorem three_strand_root_bound (w : BraidWord 3)
    (hknot : w.closure.componentCount = 1) (D : Coeff)
    (hD : denominator 3 * D = numerator 3 w) (u : ℂˣ)
    (hu : (u : ℂ) ^ 2 = Complex.I) :
    ‖evaluate u D‖ ≤ 3 := by
  sorry

/-- Since D is in the half variable, evaluate at a square root of ζ_5. -/
theorem four_strand_root_bound (w : BraidWord 4)
    (hknot : w.closure.componentCount = 1) (D : Coeff)
    (hD : denominator 4 * D = numerator 4 w) (u : ℂˣ)
    (hu : (u : ℂ) ^ 2 = (fifthRoot : ℂ)) :
    ‖evaluate u D‖ ≤ 8 := by
  sorry

/-- The signed one-based word in the README, in native zero-based indices. -/
def thresholdCounterexample : BraidWord 4 :=
  [(1, 1), (1, 1), (2, -1), (1, 1), (2, 1), (0, 1), (1, 1),
    (1, 1), (0, 1), (2, 1), (0, -1), (2, 1), (1, 1), (1, 1),
    (0, 1), (1, -1), (2, -1), (2, -1), (0, 1)]

def counterexampleAlexander : Coeff :=
  27 - 17 * (T 2 + T (-2)) + (T 4 + T (-4)) +
    5 * (T 6 + T (-6)) - 3 * (T 8 + T (-8)) + (T 10 + T (-10))

theorem counterexample_is_knot : thresholdCounterexample.closure.componentCount = 1 := by
  sorry

theorem counterexample_determinant :
    denominator 4 * counterexampleAlexander = numerator 4 thresholdCounterexample := by
  sorry

theorem counterexample_fifth_root (u : ℂˣ) (hu : (u : ℂ) ^ 2 = (fifthRoot : ℂ)) :
    evaluate u counterexampleAlexander = ((36 - 13 * Real.sqrt 5 : ℝ) : ℂ) ∧
      (13 : ℝ) / 2 < (evaluate u counterexampleAlexander).re := by
  sorry

end TauCetiRoadmap.GeometricTopology.LowStrandBurau

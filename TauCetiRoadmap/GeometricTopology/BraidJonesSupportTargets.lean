import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones

/-!
# Signed braid words and Jones support: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document
is `README.md`. These suggested forms use native braid words, closures, state
loops and Laurent coefficients. The geometric chirality/orientation comparisons
and the separate positive-braid signature theorem remain required README targets.
The Laurent variable is `u=t^(1/2)`. The theorem admissions are intentional.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.BraidJonesSupport

open TauCeti LaurentPolynomial

abbrev Coeff := LaurentPolynomial ℤ

def positiveCount (n : ℕ) (w : BraidWord n) : ℕ :=
  (w.filter fun x ↦ x.2 = 1).length

def negativeCount (n : ℕ) (w : BraidWord n) : ℕ :=
  (w.filter fun x ↦ x.2 = -1).length

def lowerBound (n : ℕ) (w : BraidWord n) : ℤ :=
  positiveCount n w - 3 * (negativeCount n w : ℤ) - (n : ℤ) + 1

def upperBound (n : ℕ) (w : BraidWord n) : ℤ :=
  3 * (positiveCount n w : ℤ) - negativeCount n w + (n : ℤ) - 1

def changedPositive (n : ℕ) (w : BraidWord n) (s : Fin w.length → Bool) : ℕ :=
  (Finset.univ.filter fun j : Fin w.length ↦ w[j.1].2 = 1 ∧ s j = false).card

def changedNegative (n : ℕ) (w : BraidWord n) (s : Fin w.length → Bool) : ℕ :=
  (Finset.univ.filter fun j : Fin w.length ↦ w[j.1].2 = -1 ∧ s j = true).card

theorem counts_sum (n : ℕ) (w : BraidWord n) :
    positiveCount n w + negativeCount n w = w.length := by
  sorry

/-- A one-sided Lipschitz bound, valid for arbitrary native codes and states. -/
theorem stateLoopCount_le_add_hamming {m : ℕ} (D : PDCode m)
    (s r : Fin m → Bool) :
    D.stateLoopCount s ≤ D.stateLoopCount r +
      (Finset.univ.filter fun j : Fin m ↦ s j ≠ r j).card := by
  sorry

/-- The vertical state retains the strands that encounter no crossing. -/
theorem vertical_state_loops (n : ℕ) (w : BraidWord n) :
    w.closure.stateLoopCount w.closure.overPair = n := by
  sorry

theorem state_weight (n : ℕ) (w : BraidWord n) (s : Fin w.length → Bool) :
    w.closure.jonesStateWeight s = (-1 : Coeff) ^ w.length *
      T ((positiveCount n w : ℤ) - negativeCount n w +
        changedPositive n w s - changedNegative n w s) := by
  sorry

theorem state_loops_bound (n : ℕ) (w : BraidWord n) (s : Fin w.length → Bool) :
    w.closure.stateLoopCount s ≤ n + changedPositive n w s + changedNegative n w s := by
  sorry

theorem jones_support_bounds (n : ℕ) (w : BraidWord n) (hn : 1 ≤ n)
    (k : ℤ) (hk : k ∈ w.closure.jonesPolynomial.coeff.support) :
    lowerBound n w ≤ k ∧ k ≤ upperBound n w := by
  sorry

theorem jones_ne_zero (n : ℕ) (w : BraidWord n) (hn : 1 ≤ n) :
    w.closure.jonesPolynomial ≠ 0 := by
  sorry

/-- The polynomial obstruction. Its unoriented-link scope needs the geometric
orientation analysis in the README, rather than a new private link predicate. -/
theorem signed_word_obstruction (n : ℕ) (w : BraidWord n) (hn : 1 ≤ n)
    (hpos : 0 < lowerBound n w) :
    w.closure.jonesPolynomial ≠ invert w.closure.jonesPolynomial ∧
      w.closure.jonesPolynomial ≠ 1 := by
  sorry

def positiveHopfWord : BraidWord 2 := [(0, 1), (0, 1)]

theorem positive_hopf_calibration :
    positiveHopfWord.closure.componentCount = 2 ∧
      positiveHopfWord.closure.jonesPolynomial = -T 1 - T 5 ∧
      lowerBound 2 positiveHopfWord = 1 := by
  sorry

end TauCetiRoadmap.GeometricTopology.BraidJonesSupport

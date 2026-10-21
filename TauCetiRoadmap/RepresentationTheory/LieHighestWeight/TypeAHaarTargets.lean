import Mathlib
import TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight
import TauCeti.LinearAlgebra.Basis.DiagonalTorus.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.Weight.Decomposition
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Bialternant

/-!
# Integral type-A character precursor: suggested interfaces

This file is not the roadmap and is not exhaustive. The definitive document is
`README.md`. These formulas and target signatures supplement the precursor to
Layer 6; `sorry` marks mathematical proof targets, not established results.
The native Schur polynomial is defined by tableaux. Its bialternant theorem
does not identify it with a group character. No Weyl-character module is imported.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight.TypeAHaar

open scoped BigOperators
open Finset

noncomputable section

abbrev Weight (n : ℕ) := Fin n → ℤ
abbrev Laurent (n : ℕ) := AddMonoidAlgebra ℤ (Weight n)

def rho (n : ℕ) : Weight n := fun i => (n : ℤ) - 1 - i.val

def permute {n : ℕ} (w : Equiv.Perm (Fin n)) (β : Weight n) : Weight n :=
  fun i => β (w⁻¹ i)

def monomial {n : ℕ} (β : Weight n) : Laurent n := AddMonoidAlgebra.single β (1 : ℤ)

def denominator (n : ℕ) : Laurent n :=
  ∏ ij ∈ (Finset.univ : Finset (Fin n × Fin n)).filter (fun ij => ij.2 < ij.1),
    (1 - monomial (Pi.single ij.1 1 - Pi.single ij.2 1))

def alternant {n : ℕ} (β : Weight n) : Laurent n :=
  ∑ w : Equiv.Perm (Fin n), (Equiv.Perm.sign w : ℤ) • monomial (permute w β)

def numerator {n : ℕ} (l : TauCeti.DominantWeight n) : Laurent n :=
  monomial (-rho n) * alternant (l.1 + rho n)

/-- The actual polynomial-to-Laurent homomorphism sends X_i to its weight monomial. -/
def polynomialToLaurent (n : ℕ) : MvPolynomial (Fin n) ℤ →+* Laurent n :=
  MvPolynomial.eval₂Hom (Int.castRingHom (Laurent n)) (fun i => monomial (Pi.single i 1))

/-- The determinant shift is the native accessor, including its n=0 convention. -/
def candidate {n : ℕ} (l : TauCeti.DominantWeight n) : Laurent n :=
  monomial (fun _ => l.detShift) *
    polynomialToLaurent n (TauCeti.diagramSchurPoly n ℤ l.detShiftShape)

/-- Evaluation consumes the actual native split-torus character. -/
def evaluate {n : ℕ} (p : Laurent n) (t : Fin n → ℂˣ) : ℂ :=
  p.coeff.sum fun β c => (c : ℂ) * ((TauCeti.weightChar ℂ β t : ℂˣ) : ℂ)

def score {n : ℕ} (x : Fin n → ℝ) (l : Weight n) : ℝ :=
  ∑ i, x i * (l i : ℝ)

def centralDegree {n : ℕ} (l : Weight n) : ℤ := ∑ i, l i

def dominanceLE {n : ℕ} (μ l : Weight n) : Prop :=
  centralDegree μ = centralDegree l ∧
    ∀ k : Fin (n + 1),
      (∑ i : Fin n, if i.val < k.val then μ i else 0) ≤
      ∑ i : Fin n, if i.val < k.val then l i else 0

/-- Distinct orbit weights occur once; stabilizers do not multiply the orbit sum. -/
def orbitSum {n : ℕ} (l : TauCeti.DominantWeight n) : Laurent n :=
  ∑ β ∈ (Finset.univ : Finset (Equiv.Perm (Fin n))).image
    (fun w => permute w l.1), monomial β

/-- The actual GL_n torus character retains the full integer central degree.
It is not a Killing-semisimple Lie-algebra character of gl_n. -/
def groupWeightCharacter {n : ℕ} {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (r : Representation ℂ (Matrix.GeneralLinearGroup (Fin n) ℂ) V) :
    Laurent n :=
  AddMonoidAlgebra.ofCoeff (Finsupp.ofSupportFinite
    (fun β => (Module.finrank ℂ (TauCeti.weightSpace r β) : ℤ)) (by
      apply (TauCeti.finite_setOf_weightSpace_ne_bot TauCeti.weightChar_injective r).subset
      intro β hβ hbot
      apply hβ
      simp [hbot]))

/-- Rationality supplies the trace dictionary independently of the Schur character theorem. -/
theorem evaluate_groupWeightCharacter {n : ℕ} {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (r : Representation ℂ (Matrix.GeneralLinearGroup (Fin n) ℂ) V)
    (hr : TauCeti.IsRationalRep r) (t : Fin n → ℂˣ) :
    evaluate (groupWeightCharacter r) t = r.character (TauCeti.diagGL t) := by
  sorry

/-- The group-level triangular adapter consumes the actual top line, cone and Weyl invariance.
ClassicalGroups Layer 3 supplies these hypotheses for its irreducible of highest weight l. -/
theorem group_character_eq_orbit_add_lower {n : ℕ} {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (r : Representation ℂ (Matrix.GeneralLinearGroup (Fin n) ℂ) V)
    (l : TauCeti.DominantWeight n)
    (htop : Module.finrank ℂ (TauCeti.weightSpace r l.1) = 1)
    (hcone : ∀ β, TauCeti.weightSpace r β ≠ ⊥ → dominanceLE β l.1)
    (hweyl : ∀ w β, Module.finrank ℂ (TauCeti.weightSpace r (permute w β)) =
      Module.finrank ℂ (TauCeti.weightSpace r β)) :
    ∃ c : TauCeti.DominantWeight n →₀ ℕ,
      (∀ μ ∈ c.support, dominanceLE μ.1 l.1 ∧ μ ≠ l) ∧
      groupWeightCharacter r = orbitSum l + c.sum (fun μ a => a • orbitSum μ) := by
  sorry

/-- Each bounded-score, fixed-central-degree dominant lattice slice is finite.
No rational independence is required for this conclusion. -/
theorem finite_dominant_score_sublevel {n : ℕ} (x : Fin n → ℝ) (hx : StrictAnti x)
    (S : ℤ) (B : ℝ) :
    Set.Finite {l : TauCeti.DominantWeight n |
      centralDegree l.1 = S ∧ score x l.1 ≤ B} := by
  sorry

/-- The concrete properness identity uses n+1 coordinates, so the denominator is nonzero. -/
theorem score_eq_gap_sum {n : ℕ} (x : Fin (n + 1) → ℝ) (l : Weight (n + 1)) :
    score x l = ((centralDegree l : ℝ) / (n + 1)) * (∑ i, x i) +
      ∑ j : Fin n,
        ((∑ i : Fin (n + 1), if i.val ≤ j.val then x i else 0) -
          (((j.val + 1 : ℕ) : ℝ) / (n + 1)) * (∑ i, x i)) *
          ((l j.castSucc - l j.succ : ℤ) : ℝ) := by
  sorry

theorem finite_dominance_ideal {n : ℕ} (l : TauCeti.DominantWeight n) :
    Set.Finite {μ : TauCeti.DominantWeight n | dominanceLE μ.1 l.1} := by
  sorry

/-- The Vandermonde identity with the specified permutation and negative-root conventions. -/
theorem staircase_alternant (n : ℕ) :
    alternant (rho n) = monomial (rho n) * denominator n := by
  sorry

/-- Integer Laurent polynomiality is supplied before any character identification. -/
theorem candidate_mul_denominator {n : ℕ} (l : TauCeti.DominantWeight n) :
    candidate l * denominator n = numerator l := by
  sorry

theorem candidate_top_coefficient {n : ℕ} (l : TauCeti.DominantWeight n) :
    (candidate l).coeff l.1 = 1 := by
  sorry

theorem candidate_support_dominated {n : ℕ} (l : TauCeti.DominantWeight n)
    (β : Weight n) (hβ : (candidate l).coeff β ≠ 0) : dominanceLE β l.1 := by
  sorry

/-- Coefficients of the alternating numerator have squared sum n!: the finite Fourier step. -/
theorem numerator_coefficient_norm {n : ℕ} (l : TauCeti.DominantWeight n) :
    (numerator l).coeff.sum (fun _ c => c * c) = Nat.factorial n := by
  sorry

theorem evaluate_mul {n : ℕ} (p q : Laurent n) (t : Fin n → ℂˣ) :
    evaluate (p * q) t = evaluate p t * evaluate q t := by
  sorry

end
end TauCetiRoadmap.RepresentationTheory.LieHighestWeight.TypeAHaar

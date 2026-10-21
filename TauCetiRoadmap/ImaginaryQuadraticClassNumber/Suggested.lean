import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.NumberTheory.FundamentalDiscriminant
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.Algebra.QuadraticAlgebra.Basic
import TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers

/-!
Suggested forms only. README.md is the definitive specification, and these signatures
are not an exhaustive checklist. Unproved targets use `sorry` honestly.
The concrete quadratic model uses native QuadraticAlgebra, following the Qsqrtd
shape of Mathlib PR36347; its nonsquare field adapter uses native inference.
-/

noncomputable section
open scoped NumberField
open Polynomial

namespace TauCetiRoadmap.ImaginaryQuadraticClassNumber

universe u v

abbrev QuadraticModel (d : ℚ) := QuadraticAlgebra ℚ d 0

def radicandDiscriminant (d : ℤ) : ℤ := if d % 4 = 1 then d else 4 * d

def heegnerRadicands : Finset ℤ := {-1, -2, -3, -7, -11, -19, -43, -67, -163}
def heegnerDiscriminants : Finset ℤ := {-3, -4, -7, -8, -11, -19, -43, -67, -163}
def classNumberOneOrderDiscriminants : Finset ℤ :=
  {-3, -4, -7, -8, -11, -12, -16, -19, -27, -28, -43, -67, -163}

/-- The full model construction also supplies its field, embedding, scalar-parent,
number-field, trace/norm, integral-basis and isomorphism APIs; this is only its field form. -/
@[instance_reducible]
def quadraticModelField (d : ℚ) (hd : ¬ IsSquare d) : Field (QuadraticModel d) := by
  letI : Fact (¬ IsSquare d) := ⟨hd⟩
  exact inferInstance

variable (K : Type u) [Field K] [NumberField K]

/-- Intrinsic imaginary quadratic fields have a negative squarefree integral presentation. -/
theorem exists_negative_squarefree_presentation [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) :
    ∃ (d : ℤ) (θ : 𝓞 K), d < 0 ∧ Squarefree d ∧
      minpoly ℤ θ = X ^ 2 - C d ∧ Algebra.adjoin ℚ {(θ : K)} = ⊤ := by
  sorry

/-- Class-number transport must arise from the actual ring-of-integers/ideal maps. -/
theorem classNumber_congr (L : Type v) [Field L] [NumberField L] (e : K ≃ₐ[ℚ] L) :
    NumberField.classNumber K = NumberField.classNumber L := by
  sorry

/-- The uniform real-character lower bound is not native individual nonvanishing. -/
theorem quadratic_LFunction_siegel (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
        c * Real.rpow (q : ℝ) (-ε) ≤ (DirichletCharacter.LFunction χ 1).re := by
  sorry

/-- Uniformity is over every imaginary quadratic field, not over one fixed class group. -/
theorem imaginary_classNumber_lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ (L : Type u) [Field L] [NumberField L]
      [NumberField.IsTotallyComplex L], Module.finrank ℚ L = 2 →
      c * Real.rpow (|NumberField.discr L| : ℝ) (1 / 2 - ε) ≤
        (NumberField.classNumber L : ℝ) := by
  sorry

/-- A discriminant bound gives parameter/isomorphism finiteness through H1 and Hermite. -/
theorem imaginary_discr_bounded_of_classNumber_le (B : ℕ) :
    ∃ C : ℝ, ∀ (L : Type u) [Field L] [NumberField L]
      [NumberField.IsTotallyComplex L], Module.finrank ℚ L = 2 →
      NumberField.classNumber L ≤ B → (|NumberField.discr L| : ℝ) ≤ C := by
  sorry

/-- Actual level2 product convention; all convergence and modular/CM properties are targets. -/
def siegelHalf (τ : UpperHalfPlane) : ℂ :=
  2 * Complex.I * Complex.exp ((Real.pi : ℂ) * Complex.I * (τ : ℂ) / 6) *
    ∏' n : ℕ, (1 + Complex.exp
      (2 * (Real.pi : ℂ) * Complex.I * (τ : ℂ) * (n + 1))) ^ 2

def gammaTwo (τ : UpperHalfPlane) : ℂ := (siegelHalf τ ^ 12 + 16) / siegelHalf τ ^ 4

def cmTau (D : ℤ) (hD : D < 0) : UpperHalfPlane :=
  ⟨if D % 4 = 0 then Complex.I * Real.sqrt (|D| : ℝ) / 2
    else (3 + Complex.I * Real.sqrt (|D| : ℝ)) / 2, by
      sorry⟩

/-- This includes a globally exhaustive integer-equation proof and its full effective floor. -/
theorem heegner_quartic_iff (u y : ℤ) :
    y ^ 2 = 2 * u * (u ^ 3 + 1) ↔
      ((u = -1 ∨ u = 0) ∧ y = 0) ∨
      (u = 1 ∧ (y = 2 ∨ y = -2)) ∨
      (u = 2 ∧ (y = 6 ∨ y = -6)) := by
  sorry

/-- Newton identities and the preceding quartic, before any CM classification is used. -/
theorem cubic_coefficient_triples (a b c : ℤ) (hc : c = 2 ∨ c = -2)
    (htrace : a ^ 4 - 4 * a ^ 2 * b + 2 * b ^ 2 + 4 * a * c = 0) :
    (a, b, c) ∈ ({(-4,28,2), (-4,4,2), (-2,8,2), (-2,0,2), (0,0,2), (2,4,2),
      (-2,4,-2), (0,0,-2), (2,8,-2), (2,0,-2), (4,28,-2), (4,4,-2)} :
        Finset (ℤ × ℤ × ℤ)) := by
  sorry

/-- The exact field theorem is a separate target from the uniform finite-family theorem. -/
theorem classNumber_eq_one_iff_discr_mem [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) :
    NumberField.classNumber K = 1 ↔ NumberField.discr K ∈ heegnerDiscriminants := by
  sorry

/-- A presentation-free statement does not identify nonsquarefree radicands as different fields. -/
theorem classNumber_eq_one_iff_negative_squarefree_mem [NumberField.IsTotallyComplex K]
    (hdeg : Module.finrank ℚ K = 2) (d : ℤ) (θ : 𝓞 K) (hd : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    NumberField.classNumber K = 1 ↔ d ∈ heegnerRadicands := by
  sorry

end TauCetiRoadmap.ImaginaryQuadraticClassNumber

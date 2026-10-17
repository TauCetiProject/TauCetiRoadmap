/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import Mathlib.Analysis.Complex.Order
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.Star.Basic
import Mathlib.RingTheory.TwoSidedIdeal.Basic
import Mathlib.RingTheory.Congruence.Basic
import Mathlib.CategoryTheory.Linear.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The native presentation and Markov trace are used directly. The synonym
carries the conjugate-linear adjoint, distinct from coefficient-fixing
algebraic reflection. Target theorem `sorry`s do not assert implemented proofs.
-/

noncomputable section

open scoped ComplexOrder

namespace TemperleyLiebOperatorAlgebras

/-- A real parameter allows an adjoint within the same complex algebra fiber. -/
def AnalyticTL (δ : ℝ) (n : ℕ) := TauCeti.TemperleyLieb ℂ (δ : ℂ) n

instance (δ : ℝ) (n : ℕ) : Semiring (AnalyticTL δ n) :=
  inferInstanceAs (Semiring (TauCeti.TemperleyLieb ℂ (δ : ℂ) n))
instance (δ : ℝ) (n : ℕ) : Ring (AnalyticTL δ n) :=
  inferInstanceAs (Ring (TauCeti.TemperleyLieb ℂ (δ : ℂ) n))
instance (δ : ℝ) (n : ℕ) : Algebra ℂ (AnalyticTL δ n) :=
  inferInstanceAs (Algebra ℂ (TauCeti.TemperleyLieb ℂ (δ : ℂ) n))

def generator (δ : ℝ) {n : ℕ} (i : Fin (n - 1)) : AnalyticTL δ n :=
  TauCeti.TemperleyLieb.e (δ : ℂ) i

/-- Descend word reversal and coefficient conjugation through the native relations.
The implementation target is explicit; no choice of an arbitrary involution is used. -/
def adjoint (δ : ℝ) (n : ℕ) : AnalyticTL δ n → AnalyticTL δ n := by
  sorry

theorem adjoint_involutive (δ : ℝ) (n : ℕ) :
    Function.Involutive (adjoint δ n) := by sorry

theorem adjoint_add (δ : ℝ) (n : ℕ) (x y : AnalyticTL δ n) :
    adjoint δ n (x + y) = adjoint δ n x + adjoint δ n y := by sorry

theorem adjoint_mul (δ : ℝ) (n : ℕ) (x y : AnalyticTL δ n) :
    adjoint δ n (x * y) = adjoint δ n y * adjoint δ n x := by sorry

instance (δ : ℝ) (n : ℕ) : StarRing (AnalyticTL δ n) where
  star := adjoint δ n
  star_involutive := adjoint_involutive δ n
  star_add := adjoint_add δ n
  star_mul := adjoint_mul δ n

@[simp] theorem adjoint_algebraMap (δ : ℝ) (n : ℕ) (c : ℂ) :
    star (algebraMap ℂ (AnalyticTL δ n) c) =
      algebraMap ℂ (AnalyticTL δ n) (star c) := by sorry

@[simp] theorem adjoint_generator (δ : ℝ) {n : ℕ} (i : Fin (n - 1)) :
    star (generator δ i) = generator δ i := by sorry

instance (δ : ℝ) (n : ℕ) : StarModule ℂ (AnalyticTL δ n) where
  star_smul c x := by
    rw [Algebra.smul_def, star_mul, adjoint_algebraMap, Algebra.smul_def]
    exact (Algebra.commutes (star c) (star x)).symm

/-- Every real loop fiber has a unit quantum parameter for the signed native trace. -/
theorem exists_loop_parameter (δ : ℝ) :
    ∃ q : ℂˣ, (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)) := by
  sorry

/-- Choose a loop parameter only to access the existing spin implementation.
The following comparison theorem makes the resulting trace independent of it. -/
def closureTrace (δ : ℝ) (n : ℕ) : AnalyticTL δ n →ₗ[ℂ] ℂ :=
  TauCeti.TemperleyLieb.markovTrace (exists_loop_parameter δ).choose
    (exists_loop_parameter δ).choose_spec

theorem closureTrace_eq_markovTrace (δ : ℝ) (q : ℂˣ)
    (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ))) (n : ℕ) :
    closureTrace δ n = TauCeti.TemperleyLieb.markovTrace q hq := by sorry

@[simp] theorem closureTrace_one (δ : ℝ) (n : ℕ) :
    closureTrace δ n 1 = (δ : ℂ) ^ n :=
  TauCeti.TemperleyLieb.markovTrace_one _ _

theorem closureTrace_mul_comm (δ : ℝ) (n : ℕ) (x y : AnalyticTL δ n) :
    closureTrace δ n (x * y) = closureTrace δ n (y * x) :=
  TauCeti.TemperleyLieb.markovTrace_mul_comm _ _ x y

/-- The statement quantifies over every level and requires a positive real parameter. -/
theorem closureTrace_positive_iff (δ : ℝ) (hδ : 0 < δ) :
    (∀ n : ℕ, ∀ x : AnalyticTL δ n, 0 ≤ closureTrace δ n (star x * x)) ↔
      2 ≤ δ ∨ ∃ m : ℕ, 3 ≤ m ∧ δ = 2 * Real.cos (Real.pi / (m : ℝ)) := by
  sorry

/-- A trace radical uses the entire bilinear pairing, not just a vanishing scalar trace. -/
def traceRadical (δ : ℝ) (n : ℕ) :
    TwoSidedIdeal (AnalyticTL δ n) :=
  TwoSidedIdeal.mk' {x | ∀ y, closureTrace δ n (x * y) = 0}
    (by simp)
    (by
      intro x y hx hy z
      change ∀ w, closureTrace δ n (x * w) = 0 at hx
      change ∀ w, closureTrace δ n (y * w) = 0 at hy
      simp only [add_mul, map_add, hx z, hy z, add_zero])
    (by
      intro x hx y
      change ∀ w, closureTrace δ n (x * w) = 0 at hx
      simp only [neg_mul, map_neg, hx y, neg_zero])
    (by
      intro a x hx y
      have hcomm := closureTrace_mul_comm δ n a (x * y)
      have hz : closureTrace δ n ((x * y) * a) = 0 := by
        simpa only [mul_assoc] using hx (y * a)
      simpa only [mul_assoc] using hcomm.trans hz)
    (by
      intro x a hx y
      simpa only [mul_assoc] using hx (a * y))

/-- Positivity identifies the bilinear trace radical with the Hermitian null space. -/
theorem mem_traceRadical_iff (δ : ℝ) (n : ℕ)
    (hpos : ∀ y : AnalyticTL δ n, 0 ≤ closureTrace δ n (star y * y))
    (x : AnalyticTL δ n) :
    x ∈ traceRadical δ n ↔ closureTrace δ n (star x * x) = 0 := by
  sorry

/-- Uniform quotient carrier, even when the radical is zero. -/
abbrev JonesQuotient (δ : ℝ) (n : ℕ) := (traceRadical δ n).ringCon.Quotient

def quotientMap (δ : ℝ) (n : ℕ) : AnalyticTL δ n →+* JonesQuotient δ n :=
  (traceRadical δ n).ringCon.mk'

theorem traceRadical_adjoint (δ : ℝ) (n : ℕ) (x : AnalyticTL δ n)
    (hx : x ∈ traceRadical δ n) : star x ∈ traceRadical δ n := by sorry

/-- The quotient adjoint is the representative-independent descended adjoint. -/
def quotientAdjoint (δ : ℝ) (n : ℕ) : JonesQuotient δ n → JonesQuotient δ n := by
  sorry

theorem quotientAdjoint_mk (δ : ℝ) (n : ℕ) (x : AnalyticTL δ n) :
    quotientAdjoint δ n (quotientMap δ n x) = quotientMap δ n (star x) := by sorry

section DaggerInterface
open CategoryTheory
variable (C : Type*) [Category C] [Preadditive C] [Linear ℂ C]

/-- Apply to the negligible quotient diagram category on wrapped objects.
The Hom adjoint has explicit laws and does not inherit the algebraic End star. -/
structure ConjugateDagger where
  adj : ∀ {X Y : C}, (X ⟶ Y) → (Y ⟶ X)
  involutive : ∀ {X Y : C} (f : X ⟶ Y), adj (adj f) = f
  map_id : ∀ X : C, adj (𝟙 X) = 𝟙 X
  map_comp : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    adj (f ≫ g) = adj g ≫ adj f
  map_add : ∀ {X Y : C} (f g : X ⟶ Y), adj (f + g) = adj f + adj g
  map_smul : ∀ {X Y : C} (c : ℂ) (f : X ⟶ Y), adj (c • f) = star c • adj f

end DaggerInterface
end TemperleyLiebOperatorAlgebras

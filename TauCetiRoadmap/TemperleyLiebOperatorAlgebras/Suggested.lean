/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace

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

/-- Coefficient conjugation on a free complex algebra, through its monoid-algebra model on the
free monoid of words. -/
def freeConj (X : Type) : FreeAlgebra ℂ X →+* FreeAlgebra ℂ X :=
  (FreeAlgebra.equivMonoidAlgebraFreeMonoid (R := ℂ) (X := X)).symm.toRingEquiv.toRingHom.comp
    ((MonoidAlgebra.mapRingHom (FreeMonoid X) (starRingEnd ℂ)).comp
      (FreeAlgebra.equivMonoidAlgebraFreeMonoid (R := ℂ) (X := X)).toRingEquiv.toRingHom)

/-- Coefficient conjugation fixes the free generators. -/
theorem freeConj_ι (X : Type) (x : X) : freeConj X (FreeAlgebra.ι ℂ x) = FreeAlgebra.ι ℂ x := by
  simp [freeConj, FreeAlgebra.equivMonoidAlgebraFreeMonoid, MonoidAlgebra.of_apply,
    MonoidAlgebra.mapRingHom_single]

/-- Coefficient conjugation conjugates scalars. -/
theorem freeConj_algebraMap (X : Type) (c : ℂ) :
    freeConj X (algebraMap ℂ (FreeAlgebra ℂ X) c) =
      algebraMap ℂ (FreeAlgebra ℂ X) (starRingEnd ℂ c) := by
  simpa [freeConj, AlgEquiv.commutes] using
    (FreeAlgebra.equivMonoidAlgebraFreeMonoid (R := ℂ) (X := X)).symm.commutes (starRingEnd ℂ c)

/-- Word reversal composed with coefficient conjugation, as a ring map from the free algebra to
the opposite of the analytic fiber; it respects the native relations because `δ` is real. -/
def adjointLift (δ : ℝ) (n : ℕ) : FreeAlgebra ℂ (Fin (n - 1)) →+* (AnalyticTL δ n)ᵐᵒᵖ :=
  (RingHom.op (RingQuot.mkRingHom (TauCeti.TemperleyLieb.Rel ℂ (δ : ℂ) n))).comp
    ((starRingEquiv : FreeAlgebra ℂ (Fin (n - 1)) ≃+* _).toRingHom.comp (freeConj _))

/-- The reversed conjugate of each native defining relation is again a relation, because the
loop value is real and the distant-commutation relation is symmetric in its indices. -/
theorem adjointLift_rel (δ : ℝ) (n : ℕ) ⦃x y : FreeAlgebra ℂ (Fin (n - 1))⦄
    (h : TauCeti.TemperleyLieb.Rel ℂ (δ : ℂ) n x y) : adjointLift δ n x = adjointLift δ n y := by
  have hrel := fun {a b} (r : TauCeti.TemperleyLieb.Rel ℂ (δ : ℂ) n a b) =>
    RingQuot.mkRingHom_rel r
  have key : ∀ z, adjointLift δ n z =
      MulOpposite.op (RingQuot.mkRingHom _ (star (freeConj _ z))) := fun _ => rfl
  rw [key, key]
  refine congrArg MulOpposite.op ?_
  cases h with
  | mul_self i =>
    have h1 : star (freeConj _ (FreeAlgebra.ι ℂ i * FreeAlgebra.ι ℂ i)) =
        FreeAlgebra.ι ℂ i * FreeAlgebra.ι ℂ i := by
      simp only [map_mul, freeConj_ι, star_mul, FreeAlgebra.star_ι]
    have h2 : star (freeConj _ ((δ : ℂ) • FreeAlgebra.ι ℂ i)) = (δ : ℂ) • FreeAlgebra.ι ℂ i := by
      rw [Algebra.smul_def, map_mul, freeConj_ι, freeConj_algebraMap, Complex.conj_ofReal,
        star_mul, FreeAlgebra.star_ι, FreeAlgebra.star_algebraMap, ← Algebra.commutes,
        ← Algebra.smul_def]
    rw [h1, h2]
    exact hrel (.mul_self i)
  | @adjacent i j hij =>
    have h1 : star (freeConj _ (FreeAlgebra.ι ℂ i * FreeAlgebra.ι ℂ j * FreeAlgebra.ι ℂ i)) =
        FreeAlgebra.ι ℂ i * FreeAlgebra.ι ℂ j * FreeAlgebra.ι ℂ i := by
      simp only [map_mul, freeConj_ι, star_mul, FreeAlgebra.star_ι, mul_assoc]
    rw [h1, freeConj_ι, FreeAlgebra.star_ι]
    exact hrel (.adjacent hij)
  | distant hij =>
    simp only [map_mul, freeConj_ι, star_mul, FreeAlgebra.star_ι]
    simpa only [map_mul] using hrel (.distant hij.symm)

/-- The conjugate-linear adjoint: reverse words and conjugate coefficients, descended through
the native relations. -/
def adjoint (δ : ℝ) (n : ℕ) (x : AnalyticTL δ n) : AnalyticTL δ n :=
  MulOpposite.unop (RingQuot.lift ⟨adjointLift δ n, adjointLift_rel δ n⟩ x)

theorem adjoint_involutive (δ : ℝ) (n : ℕ) :
    Function.Involutive (adjoint δ n) := by sorry

theorem adjoint_add (δ : ℝ) (n : ℕ) (x y : AnalyticTL δ n) :
    adjoint δ n (x + y) = adjoint δ n x + adjoint δ n y := by
  exact congrArg MulOpposite.unop
    ((RingQuot.lift ⟨adjointLift δ n, adjointLift_rel δ n⟩).map_add x y)

theorem adjoint_mul (δ : ℝ) (n : ℕ) (x y : AnalyticTL δ n) :
    adjoint δ n (x * y) = adjoint δ n y * adjoint δ n x := by
  exact congrArg MulOpposite.unop
    ((RingQuot.lift ⟨adjointLift δ n, adjointLift_rel δ n⟩).map_mul x y)

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
  obtain ⟨s, hs⟩ := IsAlgClosed.exists_pow_nat_eq ((δ : ℂ) ^ 2 - 4) (n := 2) (by norm_num)
  have hu : ((-(δ : ℂ) + s) / 2) * ((-(δ : ℂ) - s) / 2) = 1 := by
    linear_combination (-1 / 4 : ℂ) * hs
  refine ⟨⟨_, _, hu, by rw [mul_comm]; exact hu⟩, ?_⟩
  show (δ : ℂ) = -((-(δ : ℂ) + s) / 2 + (-(δ : ℂ) - s) / 2)
  ring

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
def quotientAdjoint (δ : ℝ) (n : ℕ) : JonesQuotient δ n → JonesQuotient δ n :=
  Quotient.map' (s₁ := (traceRadical δ n).ringCon.toSetoid)
    (s₂ := (traceRadical δ n).ringCon.toSetoid) (fun x => star x) (by
      intro x y hxy
      change (traceRadical δ n).ringCon x y at hxy
      change (traceRadical δ n).ringCon (star x) (star y)
      rw [TwoSidedIdeal.rel_iff] at hxy ⊢
      rw [← star_sub]
      exact traceRadical_adjoint δ n _ hxy)

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

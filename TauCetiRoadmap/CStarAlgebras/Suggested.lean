/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.CStarAlgebra.ApproximateUnit
import Mathlib.Analysis.CStarAlgebra.CStarMatrix
import Mathlib.Analysis.CStarAlgebra.CompletelyPositiveMap
import Mathlib.Analysis.CStarAlgebra.ContinuousFunctionalCalculus.Isometric
import Mathlib.Analysis.CStarAlgebra.ContinuousLinearMap
import Mathlib.Analysis.CStarAlgebra.Unitization
import Mathlib.Analysis.InnerProductSpace.StarOrder
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.PosPart.Basic
import Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.Rpow.Order
import Mathlib.RingTheory.TwoSidedIdeal.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The operator-space and completed C*-tensor interfaces are specified there;
the definitions below use actual matrix norms and finite CP factorizations.
-/

noncomputable section
open Filter Topology
open scoped CStarAlgebra ComplexOrder

namespace CStarAlgebras

variable {A B : Type*} [NonUnitalCStarAlgebra A] [NonUnitalCStarAlgebra B]

/-- C1 consumes the native C*-algebra left-regular norm theorem. -/
theorem norm_leftMultiplication (a : A) :
    ‖ContinuousLinearMap.mul ℂ A a‖ = ‖a‖ :=
  ContinuousLinearMap.opNorm_mul_apply ℂ A a

/-- C1 also consumes the native right-regular norm theorem. -/
theorem norm_rightMultiplication (a : A) :
    ‖(ContinuousLinearMap.mul ℂ A).flip a‖ = ‖a‖ :=
  ContinuousLinearMap.opNorm_mul_flip_apply ℂ a

/-- C1: nonunitality is actual absence of a two-sided identity. -/
theorem scalar_norm_le_unitizationLeftAction
    (hA : ¬ ∃ e : A, ∀ b : A, e * b = b ∧ b * e = b)
    (c : ℂ) (a : A) :
    ‖c‖ ≤ ‖c • ContinuousLinearMap.id ℂ A + ContinuousLinearMap.mul ℂ A a‖ := by
  sorry

/-- C1: compare the native C*-unitization norm with the left-action norm. -/
theorem unitization_norm_eq_leftAction
    (hA : ¬ ∃ e : A, ∀ b : A, e * b = b ∧ b * e = b)
    (x : Unitization ℂ A) :
    ‖x‖ = ‖x.fst • ContinuousLinearMap.id ℂ A +
      ContinuousLinearMap.mul ℂ A x.snd‖ := by
  sorry

variable [PartialOrder A] [StarOrderedRing A] [PartialOrder B] [StarOrderedRing B]

/-- The order condition for a hereditary C*-subalgebra; closedness is separate. -/
def IsHereditary (S : NonUnitalStarSubalgebra ℂ A) : Prop :=
  ∀ ⦃a b : A⦄, 0 ≤ a → a ≤ b → b ∈ S → a ∈ S

/-- A uniform matrix norm bound, using the C*-norm rather than the entrywise matrix norm. -/
def IsCompletelyBounded (φ : A →ₗ[ℂ] B) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ (n : ℕ) (x : CStarMatrix (Fin n) (Fin n) A),
    ‖x.map φ‖ ≤ C * ‖x‖

/-- Point-norm approximation of a CP map through finite full matrix algebras. -/
def IsNuclearContraction (φ : A →CP B) : Prop :=
  ∀ (F : Finset A) (ε : ℝ), 0 < ε →
    ∃ (n : ℕ) (α : A →CP CStarMatrix (Fin n) (Fin n) ℂ)
      (β : CStarMatrix (Fin n) (Fin n) ℂ →CP B),
      (∀ a, ‖α a‖ ≤ ‖a‖) ∧ (∀ x, ‖β x‖ ≤ ‖x‖) ∧
      ∀ a ∈ F, ‖β (α a) - φ a‖ < ε

/-- Positive contractive approximate units for closed ideals can be made quasicentral. -/
theorem exists_quasicentral_approximateUnit (I : TwoSidedIdeal A)
    (hI : IsClosed (I : Set A)) :
    ∃ l : Filter A, l.NeBot ∧ (∀ᶠ e in l, e ∈ I ∧ 0 ≤ e ∧ ‖e‖ ≤ 1) ∧
      (∀ a ∈ I, Tendsto (fun e ↦ e * a) l (𝓝 a)) ∧
      (∀ a ∈ I, Tendsto (fun e ↦ a * e) l (𝓝 a)) ∧
      (∀ a : A, Tendsto (fun e ↦ e * a - a * e) l (𝓝 0)) := by
  sorry

theorem closed_ideal_isHereditary (I : TwoSidedIdeal A)
    (hI : IsClosed (I : Set A)) {a b : A} (ha : 0 ≤ a) (hab : a ≤ b)
    (hb : b ∈ I) : a ∈ I := by
  sorry

/-- Automatic continuity and the common amplification bound for a CP map. -/
theorem completelyPositive_isCompletelyBounded (φ : A →CP B) :
    IsCompletelyBounded φ.toLinearMap := by
  sorry

section Unital

variable {D E : Type*} [CStarAlgebra D] [CStarAlgebra E]
  [PartialOrder D] [StarOrderedRing D] [PartialOrder E] [StarOrderedRing E]

theorem completelyPositive_matrix_bound (φ : D →CP E) (n : ℕ)
    (x : CStarMatrix (Fin n) (Fin n) D) :
    ‖x.map φ‖ ≤ ‖φ 1‖ * ‖x‖ := by
  sorry

theorem schwarz (φ : D →CP E) (hφ : φ 1 = 1) (a : D) :
    star (φ a) * φ a ≤ φ (star a * a) := by
  sorry

/-- Both Schwarz equalities are needed for the self-adjoint multiplicative domain. -/
theorem multiplicativeDomain_iff (φ : D →CP E) (hφ : φ 1 = 1) (a : D) :
    (φ (star a * a) = star (φ a) * φ a ∧
      φ (a * star a) = φ a * star (φ a)) ↔
    ∀ b : D, φ (a * b) = φ a * φ b ∧ φ (b * a) = φ b * φ a := by
  sorry

theorem multiplicativeDomain_isClosedStarSubalgebra (φ : D →CP E) (hφ : φ 1 = 1) :
    ∃ S : StarSubalgebra ℂ D, IsClosed (S : Set D) ∧
      ∀ a : D, a ∈ S ↔
        φ (star a * a) = star (φ a) * φ a ∧
        φ (a * star a) = φ a * star (φ a) := by
  sorry

/-- The bundled multiplicative domain, selected with its defining membership theorem. -/
def multiplicativeDomain (φ : D →CP E) (hφ : φ 1 = 1) : StarSubalgebra ℂ D :=
  (multiplicativeDomain_isClosedStarSubalgebra φ hφ).choose

theorem isClosed_multiplicativeDomain (φ : D →CP E) (hφ : φ 1 = 1) :
    IsClosed (multiplicativeDomain φ hφ : Set D) :=
  (multiplicativeDomain_isClosedStarSubalgebra φ hφ).choose_spec.1

@[simp] theorem mem_multiplicativeDomain (φ : D →CP E) (hφ : φ 1 = 1) (a : D) :
    a ∈ multiplicativeDomain φ hφ ↔
      φ (star a * a) = star (φ a) * φ a ∧
      φ (a * star a) = φ a * star (φ a) :=
  (multiplicativeDomain_isClosedStarSubalgebra φ hφ).choose_spec.2 a

end Unital

section RadonNikodym

variable {D H K : Type*} [CStarAlgebra D] [PartialOrder D] [StarOrderedRing D]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- CP order has an actual CP difference; minimality gives uniqueness in the commutant. -/
theorem cp_radonNikodym (φ ψ : D →CP (H →L[ℂ] H))
    (π : D →⋆ₐ[ℂ] (K →L[ℂ] K)) (V : H →L[ℂ] K)
    (hφ : ∀ a, φ a = V.adjoint.comp ((π a).comp V))
    (hminimal : (Submodule.span ℂ
      {x : K | ∃ (a : D) (ξ : H), x = π a (V ξ)}).topologicalClosure = ⊤)
    (hdom : ∃ θ : D →CP (H →L[ℂ] H), ∀ a, φ a = ψ a + θ a) :
    ∃! T : K →L[ℂ] K, 0 ≤ T ∧ T ≤ 1 ∧ (∀ a, Commute T (π a)) ∧
      ∀ a, ψ a = V.adjoint.comp (T.comp ((π a).comp V)) := by
  sorry

end RadonNikodym

section MatrixOrder

-- Match the scalar restriction used by the native real continuous functional calculus.
attribute [local instance 1100] Module.complexToReal Algebra.complexToReal

namespace MatrixOrderExamples

local notation "M₂" => CStarMatrix (Fin 2) (Fin 2) ℂ

def swap : M₂ := CStarMatrix.ofMatrix !![0, 1; 1, 0]

def swapPositive : M₂ := CStarMatrix.ofMatrix !![1/2, 1/2; 1/2, 1/2]

def diagonal (s t : ℝ) : M₂ := CStarMatrix.ofMatrix !![(s : ℂ), 0; 0, (t : ℂ)]

def firstProjection : M₂ := CStarMatrix.ofMatrix !![1, 0; 0, 0]

/-- The positive part is a rank-one projection. -/
theorem swap_posPart : swap⁺ = swapPositive ∧ swapPositive ^ 2 = swapPositive := by
  sorry

/-- The full positive-quadrant region, including zero boundary parameters. -/
theorem swap_le_diagonal (s t : ℝ) (hs : 0 ≤ s) (ht : 0 ≤ t) :
    swap ≤ diagonal s t ↔ 1 ≤ s * t := by
  sorry

/-- All principal-minor conditions are retained for the shifted matrix. -/
theorem positivePart_le_diagonal (s t : ℝ) :
    swapPositive ≤ diagonal s t ↔
      1/2 ≤ s ∧ 1/2 ≤ t ∧ 1/4 ≤ (s - 1/2) * (t - 1/2) := by
  sorry

/-- Positive-part order and squaring both have concrete noncommuting obstructions. -/
theorem order_counterexamples :
    (swap ≤ diagonal (1/2) 3 ∧ ¬ swapPositive ≤ diagonal (1/2) 3) ∧
    (swapPositive ≤ diagonal (5/8) 5 ∧
      ¬ swapPositive ^ 2 ≤ (diagonal (5/8) 5) ^ 2) := by
  sorry

/-- Compressing a positive projection need not give an operator below it. -/
theorem compression_counterexample :
    ¬ firstProjection * swapPositive * firstProjection ≤ swapPositive := by
  sorry

end MatrixOrderExamples

/-- The valid replacement for the unrestricted compression inequality. -/
theorem compression_le_iff_commute {D : Type*} [CStarAlgebra D]
    [PartialOrder D] [StarOrderedRing D] (p T : D)
    (hp : IsStarProjection p) (hT : 0 ≤ T) :
    p * T * p ≤ T ↔ Commute p T := by
  sorry

end MatrixOrder
end CStarAlgebras

import Mathlib
import TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Realization
import TauCeti.NumberTheory.QuadraticOrder.PrimeIdeal
import TauCeti.NumberTheory.QuadraticOrder.Embedding
import TauCeti.NumberTheory.QuadraticOrder.Split.Basic
import TauCeti.NumberTheory.NumberField.Quadratic.Frobenius

/-!
# Quadratic characters and reduction: representative interfaces

The roadmap is `README.md`. This file is a selection of suggested interfaces,
not an exhaustive checklist or an implementation. Proposed proofs use `sorry`.
The character, coefficient maps, quadratic algebra, conjugation, norm, and bases
are the native Mathlib and Tau Ceti constructions.
-/

noncomputable section

set_option autoImplicit false

namespace TauCetiRoadmap.QuadraticCharactersAndReduction

open Polynomial

/-! ## Q0–Q2: character classification -/

theorem real_iff_isQuadratic {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    (∀ a, (χ a).im = 0) ↔ χ.IsQuadratic := by
  sorry

theorem odd_prime_power_conductor {p k : ℕ} (hp : p.Prime) (hp2 : p ≠ 2)
    (hk : 0 < k) (χ : DirichletCharacter ℂ (p ^ k)) (hχ : χ.IsQuadratic) :
    χ.conductor = 1 ∨ χ.conductor = p := by
  sorry

theorem two_power_conductor (k : ℕ) (χ : DirichletCharacter ℂ (2 ^ k))
    (hχ : χ.IsQuadratic) : χ.conductor ∈ ({1, 4, 8} : Finset ℕ) := by
  sorry

/-- Integer evaluations avoid the dependent transport of the equality of levels.
The principal primitive character corresponds to `D = 1`. -/
theorem exists_unique_fundamental_discriminant {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hprim : χ.IsPrimitive) (hreal : χ.IsQuadratic) :
    ∃! D : ℤ, ∃ hD : Int.IsFundamentalDiscr D,
      D.natAbs = q ∧ ∀ n : ℤ,
        χ n = TauCeti.Multiquadratic.fundamentalDiscriminantCharCast ℂ D hD n := by
  sorry

theorem exists_squarefree_radicand {D : ℤ} (hD : Int.IsFundamentalDiscr D)
    (hD1 : D ≠ 1) :
    ∃ d : ℤ, Squarefree d ∧ d ≠ 1 ∧
      D = (if d % 4 = 1 then d else 4 * d) ∧ d.natAbs ≤ D.natAbs := by
  sorry

/-! ## Q3: native coefficient reduction -/

theorem reduction_kernel (a b : ℤ) (m : ℕ) :
    RingHom.ker (QuadraticAlgebra.mapRingHom (Int.castRingHom (ZMod m)) a b) =
      Ideal.span ({(m : QuadraticAlgebra ℤ a b)} : Set (QuadraticAlgebra ℤ a b)) := by
  sorry

theorem reduction_quotient_equiv (a b : ℤ) (m : ℕ) :
    Nonempty ((QuadraticAlgebra ℤ a b ⧸ Ideal.span {(m : QuadraticAlgebra ℤ a b)}) ≃+*
      QuadraticAlgebra (ZMod m) (a : ZMod m) (b : ZMod m)) := by
  sorry

theorem card_reduction_quotient (a b : ℤ) (m : ℕ) (hm : 0 < m) :
    Nat.card (QuadraticAlgebra ℤ a b ⧸ Ideal.span {(m : QuadraticAlgebra ℤ a b)}) =
      m ^ 2 := by
  sorry

theorem mem_scalar_ideal_iff (a b : ℤ) (m : ℕ) (z : QuadraticAlgebra ℤ a b) :
    z ∈ Ideal.span {(m : QuadraticAlgebra ℤ a b)} ↔
      (m : ℤ) ∣ z.re ∧ (m : ℤ) ∣ z.im := by
  sorry

/-! ## Q4: finite Frobenius, then its integral congruence -/

theorem pow_card_eq_star {F : Type*} [Field F] [Fintype F]
    (hodd : Odd (Fintype.card F)) {r : F} (hr : ¬ IsSquare r)
    (z : QuadraticAlgebra F r 0) : z ^ Fintype.card F = star z := by
  sorry

theorem pow_card_eq_self_of_square {F : Type*} [Field F] [Fintype F]
    (hodd : Odd (Fintype.card F)) {r : F} (hr : IsSquare r) (hr0 : r ≠ 0)
    (z : QuadraticAlgebra F r 0) : z ^ Fintype.card F = z := by
  sorry

theorem frobenius_congruence (r : ℤ) {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2)
    (hr : ¬ IsSquare (r : ZMod p)) (z : QuadraticAlgebra ℤ r 0) :
    z ^ p - star z ∈ Ideal.span {(p : QuadraticAlgebra ℤ r 0)} := by
  sorry

/-! ## Q5: embeddings and arbitrary coordinate sets -/

theorem norm_embedding_le (r : ℚ)
    (σ : QuadraticAlgebra ℚ r 0 →ₐ[ℚ] ℂ) (z : QuadraticAlgebra ℚ r 0) :
    ‖σ z‖ ≤ |(z.re : ℝ)| + |(z.im : ℝ)| * Real.sqrt |(r : ℝ)| := by
  sorry

theorem reduction_injOn_coordinates (a b : ℤ) (m : ℕ) (U V : Set ℤ)
    (hU : Set.InjOn (fun u : ℤ => (u : ZMod m)) U)
    (hV : Set.InjOn (fun v : ℤ => (v : ZMod m)) V) :
    Set.InjOn (QuadraticAlgebra.mapRingHom (Int.castRingHom (ZMod m)) a b)
      {z : QuadraticAlgebra ℤ a b | z.re ∈ U ∧ z.im ∈ V} := by
  sorry

/-- `m` successive integers fit in the residue system, including both boundary cases. -/
theorem reduction_injOn_Ico (a : ℤ) (m : ℕ) (hm : 0 < m) :
    Set.InjOn (fun u : ℤ => (u : ZMod m)) (Set.Ico a (a + m)) := by
  sorry

example : (1 : ℤ).IsFundamentalDiscr := by sorry

example : Nat.card (QuadraticAlgebra ℤ 5 0 ⧸
    Ideal.span {(2 : QuadraticAlgebra ℤ 5 0)}) = 4 := by sorry

example (z : QuadraticAlgebra ℤ (-1) 0) :
    z ^ 3 - star z ∈ Ideal.span {(3 : QuadraticAlgebra ℤ (-1) 0)} := by sorry

end TauCetiRoadmap.QuadraticCharactersAndReduction

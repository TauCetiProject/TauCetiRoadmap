import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are actual native braid words and coefficients in Mathlib's free algebra.
The geometric deletion, based longitude, Milnor indeterminacy and source-picture
comparisons are separate README targets, not consequences of these algebraic checks.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.Brunnian
open TauCeti

/-- Right-nested, with the specified empty and one-term conventions. -/
def rightCommutator {G : Type*} [Group G] : List G → G
  | [] => 1
  | [a] => a
  | a :: b :: tail =>
    a * rightCommutator (b :: tail) * a⁻¹ * (rightCommutator (b :: tail))⁻¹

/-- Native zero-based generator for the pure braid A_(i+1,n). -/
def lastPureGenerator {n : ℕ} (i : Fin (n-1)) : BraidGroup n :=
  let c := (((List.finRange (n-1)).reverse.filter fun j => i < j).map BraidGroup.sigma).prod
  c * BraidGroup.sigma i ^ 2 * c⁻¹

def beta (n : ℕ) : BraidGroup n :=
  rightCommutator ((List.finRange (n-1)).map lastPureGenerator)

theorem beta_pure (n : ℕ) : beta n ∈ BraidGroup.pureSubgroup n := by
  sorry

/-- Conjugacy gives the actual Borromean closure comparison after geometric realization. -/
theorem beta_three :
    beta 3 = BraidGroup.sigma (1 : Fin 2) *
      (BraidGroup.sigma (0 : Fin 2) * (BraidGroup.sigma (1 : Fin 2))⁻¹)^3 *
        (BraidGroup.sigma (1 : Fin 2))⁻¹ := by
  sorry

/-- The noncommuting Lie polynomial that occurs as the first positive Magnus degree. -/
def rightLie {R : Type*} [Ring R] : List R → R
  | [] => 0
  | [a] => a
  | a :: b :: tail => a * rightLie (b :: tail) - rightLie (b :: tail) * a

def liePolynomial (r : ℕ) : FreeAlgebra ℤ (Fin r) :=
  rightLie ((List.finRange r).map (FreeAlgebra.ι ℤ))

def orderedWord (r : ℕ) : FreeMonoid (Fin r) :=
  ((List.finRange r).map FreeMonoid.of).prod

def coefficient {ι : Type*} (p : FreeAlgebra ℤ ι) (w : FreeMonoid ι) : ℤ :=
  (FreeAlgebra.equivMonoidAlgebraFreeMonoid p).coeff w

/-- The unsigned coefficient is one; the pullback anti-homomorphism supplies the sign. -/
theorem leading_coefficient {r : ℕ} (hr : 0 < r) :
    coefficient (liePolynomial r) (orderedWord r) = 1 ∧
    ∀ k : ℤ, coefficient ((k * (-1 : ℤ)^(r-1)) • liePolynomial r) (orderedWord r) =
      k * (-1 : ℤ)^(r-1) := by
  sorry

end TauCetiRoadmap.GeometricTopology.Brunnian

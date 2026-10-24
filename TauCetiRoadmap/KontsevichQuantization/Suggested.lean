import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Algebra.Algebra.Bilinear

/-!
# Formal deformation and admissible graph interfaces

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations suggest Lean forms for the coefficient algebra of Layer 0
and the finite graphs of Layer 4. Discharging them completes neither the roadmap nor
Kontsevich's theorem. The four `sorry` proofs are targets, not established results.

The algebraic floor works over a commutative ring. Differentiality and the geometric
formality morphism are separate constructions in the README, not unnamed proposition fields.
-/

noncomputable section

namespace TauCetiRoadmap.KontsevichQuantization

open scoped BigOperators

variable (k A : Type*) [CommRing k] [CommRing A] [Algebra k A]

/-- Coefficients of a unital associative formal deformation of a commutative algebra. -/
structure FormalProduct where
  coeff : ℕ → A →ₗ[k] A →ₗ[k] A
  coeff_zero : ∀ a b, coeff 0 a b = a * b
  unit_left : ∀ n a, coeff (n + 1) 1 a = 0
  unit_right : ∀ n a, coeff (n + 1) a 1 = 0
  assoc_coeff : ∀ n a b c,
    (∑ ij ∈ Finset.antidiagonal n, coeff ij.1 (coeff ij.2 a b) c) =
      ∑ ij ∈ Finset.antidiagonal n, coeff ij.1 a (coeff ij.2 b c)

variable {k A}

/-- The deformed multiplication on the existing formal power series carrier. -/
def FormalProduct.mul (B : FormalProduct k A) (f g : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk fun n =>
    ∑ ri ∈ Finset.antidiagonal n, ∑ jl ∈ Finset.antidiagonal ri.2,
      B.coeff ri.1 (PowerSeries.coeff jl.1 f) (PowerSeries.coeff jl.2 g)

/-- Antisymmetrization of the first coefficient; no division by two is required. -/
def FormalProduct.firstBracket (B : FormalProduct k A) (a b : A) : A :=
  B.coeff 1 a b - B.coeff 1 b a

/-- The coefficient identities imply associativity on arbitrary formal series. -/
theorem FormalProduct.mul_assoc (B : FormalProduct k A) (f g h : PowerSeries A) :
    B.mul (B.mul f g) h = B.mul f (B.mul g h) := by
  sorry

/-- The first commutator is a derivation in its second argument. -/
theorem FormalProduct.firstBracket_leibniz (B : FormalProduct k A) (a b c : A) :
    B.firstBracket a (b * c) =
      B.firstBracket a b * c + b * B.firstBracket a c := by
  sorry

/-- Associativity to second order gives Jacobi over every commutative base ring. -/
theorem FormalProduct.firstBracket_jacobi (B : FormalProduct k A) (a b c : A) :
    B.firstBracket a (B.firstBracket b c) +
      B.firstBracket b (B.firstBracket c a) +
      B.firstBracket c (B.firstBracket a b) = 0 := by
  sorry

/-- A formal equivalence with constant term the identity, oriented from `B` to `C`. -/
structure FormalEquivalence (B C : FormalProduct k A) where
  coeff : ℕ → A →ₗ[k] A
  coeff_zero : coeff 0 = LinearMap.id
  unit_coeff : ∀ n, coeff (n + 1) 1 = 0
  intertwine : ∀ n a b,
    (∑ ij ∈ Finset.antidiagonal n, coeff ij.1 (B.coeff ij.2 a b)) =
      ∑ ri ∈ Finset.antidiagonal n, ∑ jl ∈ Finset.antidiagonal ri.2,
        C.coeff ri.1 (coeff jl.1 a) (coeff jl.2 b)

/-- Equivalence preserves the bracket on the undeformed commutative algebra. -/
theorem FormalEquivalence.firstBracket_eq {B C : FormalProduct k A}
    (T : FormalEquivalence B C) (a b : A) :
    B.firstBracket a b = C.firstBracket a b := by
  sorry

/-- First-type vertices have ordered outgoing slots; second-type vertices have no outgoing
edges. Distinct targets at a fixed source exclude repeated edges. -/
structure AdmissibleGraph (n m : ℕ) (outDegree : Fin n → ℕ) where
  target : (i : Fin n) → Fin (outDegree i) → Fin n ⊕ Fin m
  no_loop : ∀ i e, target i e ≠ Sum.inl i
  distinct_targets : ∀ i, Function.Injective (target i)

/-- Graphs contributing to an `L∞` Taylor component have the configuration-space dimension. -/
def HasWeightDegree {n m : ℕ} {outDegree : Fin n → ℕ}
    (_Γ : AdmissibleGraph n m outDegree) : Prop :=
  2 ≤ 2 * n + m ∧ ∑ i, outDegree i = 2 * n + m - 2

end TauCetiRoadmap.KontsevichQuantization

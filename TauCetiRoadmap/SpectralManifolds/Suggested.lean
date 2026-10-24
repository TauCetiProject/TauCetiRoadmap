/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCetiRoadmap.NoncommutativeGeometry.Suggested
import Mathlib.Analysis.InnerProductSpace.TensorProduct
import Mathlib.Analysis.Normed.Operator.LinearIsometry
import Mathlib.LinearAlgebra.Matrix.ConjTranspose

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms; README.md is the definitive specification.
The existing NCG prototype supplies its spectral core. The structures below
state actual domain, commutator, antiunitary and projection equations.
The full geometric reconstruction theorem needs the new axiom/module/smooth
algebra interfaces in the README. Those unavailable premises are omitted here,
not represented by arbitrary Prop fields or definitions with sorry bodies.
The parameter Q in CommutatorTower is instantiated by N5's |D| calculus;
there is no assertion that an arbitrary Q equals |D|.
-/

namespace SpectralManifolds

universe u v

section Operators
variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable [CompleteSpace H]

/-- A bounded extension of a commutator includes the exact domain obligation. -/
structure BoundedCommutator (D : H →ₗ.[ℂ] H) (T : H →L[ℂ] H) where
  value : H →L[ℂ] H
  invariant : ∀ ξ : D.domain, T (ξ : H) ∈ D.domain
  equation : ∀ ξ : D.domain,
    D ⟨T (ξ : H), invariant ξ⟩ - T (D ξ) = value ξ

/-- Iterated bounded commutators on the native partial-operator domain. -/
structure CommutatorTower (Q : H →ₗ.[ℂ] H) (T : H →L[ℂ] H) where
  term : ℕ → H →L[ℂ] H
  zero_eq : term 0 = T
  invariant : ∀ (n : ℕ) (ξ : Q.domain), term n (ξ : H) ∈ Q.domain
  equation : ∀ (n : ℕ) (ξ : Q.domain),
    Q ⟨term n (ξ : H), invariant n ξ⟩ - term n (Q ξ) = term (n + 1) ξ

/-- A parity operator acts on the actual unbounded domain. -/
structure Grading (D : H →ₗ.[ℂ] H) where
  value : H →L[ℂ] H
  self_adjoint : star value = value
  square : value * value = 1
  invariant : ∀ ξ : D.domain, value (ξ : H) ∈ D.domain
  odd : ∀ ξ : D.domain,
    D ⟨value (ξ : H), invariant ξ⟩ = -value (D ξ)

/-- KO signs are integer signs. The conventional table is in the README. -/
structure RealStructure (D : H →ₗ.[ℂ] H) (ε ε' : ℤ) where
  J : H ≃ₗᵢ⋆[ℂ] H
  sign_square : ∀ ξ : H, J (J ξ) = (ε : ℂ) • ξ
  invariant : ∀ ξ : D.domain, J (ξ : H) ∈ D.domain
  commutes : ∀ ξ : D.domain,
    J (D ξ) = (ε' : ℂ) • D ⟨J (ξ : H), invariant ξ⟩

/-- A real even structure has an additional, explicit chirality equation. -/
def HasRealGrading {D : H →ₗ.[ℂ] H} {ε ε' : ℤ}
    (R : RealStructure D ε ε') (G : Grading D) (ε'' : ℤ) : Prop :=
  ∀ ξ : H, R.J (G.value ξ) = (ε'' : ℂ) • G.value (R.J ξ)

/-- Equality on a dense domain determines a bounded commutator extension. -/
theorem BoundedCommutator.value_unique {D : H →ₗ.[ℂ] H}
    (hdense : Dense (D.domain : Set H)) {T : H →L[ℂ] H}
    (B C : BoundedCommutator D T) : B.value = C.value := by
  sorry

/-- The operator is still the native partial map: no total unbounded surrogate. -/
theorem Grading.domain_iff {D : H →ₗ.[ℂ] H} (G : Grading D) (ξ : H) :
    G.value ξ ∈ D.domain ↔ ξ ∈ D.domain := by
  sorry

end Operators

section Represented
variable {A : Type u} [Ring A] [Algebra ℂ A] [StarRing A]
variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable [CompleteSpace H] [SecondCountableTopology H]
variable (π : A →⋆ₐ[ℂ] (H →L[ℂ] H))

abbrev Core := NoncommutativeGeometry.SpectralTriple π

/-- Ordinary commutative first order is a fixed equation, not an opaque flag. -/
def HasCommutativeFirstOrder (S : Core π) : Prop :=
  ∀ a b : A, S.commutator a * π b = π b * S.commutator a

/-- An even represented core, including representation/grading compatibility. -/
structure EvenCore (S : Core π) where
  grading : Grading S.D
  representation_even : ∀ a : A, grading.value * π a = π a * grading.value

/-- The opposite action written as a function, with no unprovided tensor norm. -/
def oppositeApply (S : Core π) {ε ε' : ℤ} (R : RealStructure S.D ε ε')
    (b : A) (ξ : H) : H :=
  R.J (π (star b) (R.J.symm ξ))

/-- Order zero uses the actual J-conjugated opposite action. -/
def HasOrderZero (S : Core π) {ε ε' : ℤ} (R : RealStructure S.D ε ε') : Prop :=
  ∀ (a b : A) (ξ : H),
    π a (oppositeApply π S R b ξ) = oppositeApply π S R b (π a ξ)

/-- Real first order is an explicit bounded commutator equation. -/
def HasRealFirstOrder (S : Core π) {ε ε' : ℤ} (R : RealStructure S.D ε ε') : Prop :=
  ∀ (a b : A) (ξ : H),
    S.commutator a (oppositeApply π S R b ξ) =
      oppositeApply π S R b (S.commutator a ξ)

/-- Faithfulness is a separate hypothesis: the NCG core does not hide it. -/
theorem commutator_leibniz (S : Core π) (a b : A) :
    S.commutator (a * b) = S.commutator a * π b + π a * S.commutator b := by
  sorry

/-- Antiunitary conjugation gives a complex-linear opposite action. -/
theorem oppositeApply_smul (S : Core π) {ε ε' : ℤ}
    (R : RealStructure S.D ε ε') (b : A) (z : ℂ) (ξ : H) :
    oppositeApply π S R b (z • ξ) = z • oppositeApply π S R b ξ := by
  sorry

/-- Reversing products is precisely the opposite-algebra convention. -/
theorem oppositeApply_mul (S : Core π) {ε ε' : ℤ}
    (R : RealStructure S.D ε ε') (a b : A) (ξ : H) :
    oppositeApply π S R (a * b) ξ =
      oppositeApply π S R b (oppositeApply π S R a ξ) := by
  sorry

/-- A single Hochschild word, before taking the native chain-complex quotient. -/
def orientationWord (S : Core π) (p : ℕ) (a : Fin (p + 1) → A) : H →L[ℂ] H :=
  π (a 0) * (List.ofFn fun j : Fin p => S.commutator (a j.succ)).prod

omit [SecondCountableTopology H] in
/-- The core's domain really is dense by native self-adjointness. -/
theorem Core.dense_domain (S : Core π) : Dense (S.D.domain : Set H) :=
  S.selfAdjoint.dense_domain

end Represented

section Projection
variable {A : Type u} [CommRing A] [StarRing A]

/-- Projection matrices are the actual finite-projective/Hermitian models. -/
structure HermitianProjection (n : ℕ) where
  matrix : Matrix (Fin n) (Fin n) A
  idempotent : matrix * matrix = matrix
  hermitian : matrix.conjTranspose = matrix

variable [Algebra ℂ A]
variable {E : Type v} [AddCommGroup E] [Module A E]

/-- An honest finite-projective presentation by the range of an idempotent. -/
structure ProjectivePresentation where
  rank_bound : ℕ
  projection : Module.End A (Fin rank_bound → A)
  idempotent : projection.comp projection = projection
  realization : E ≃ₗ[A] projection.range

end Projection

section AbsoluteContinuity
variable {A : Type u} [CommRing A] [Algebra ℂ A] [StarRing A]
variable {E : Type v} [AddCommGroup E] [Module ℂ E]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- This identity is a concrete adapter. τ must be the supplied singular-trace
functional in a geometric application; arbitrary τ alone gives no reconstruction. -/
def AbsoluteContinuityIdentity (π : A →⋆ₐ[ℂ] (H →L[ℂ] H))
    (ι : E →ₗ[ℂ] H) (h : E → E → A) (τ : A →ₗ[ℂ] ℂ) : Prop :=
  ∀ (a : A) (ξ η : E), inner ℂ (ι ξ) (π a (ι η)) = τ (a * h ξ η)

end AbsoluteContinuity

/-- Both KO sign types are explicit data; no metric dimension is inferred. -/
def epsilon (n : Fin 8) : ℤ := ![1, 1, -1, -1, -1, -1, 1, 1] n
def epsilonPrime (n : Fin 8) : ℤ := ![1, -1, 1, 1, 1, -1, 1, 1] n

theorem epsilon_square (n : Fin 8) : epsilon n * epsilon n = 1 := by
  fin_cases n <;> norm_num [epsilon]

theorem epsilonPrime_square (n : Fin 8) : epsilonPrime n * epsilonPrime n = 1 := by
  fin_cases n <;> norm_num [epsilonPrime]

end SpectralManifolds

/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Spectral manifolds and reconstruction: target signatures

This file is not the roadmap: README.md is. It states, against the pinned
Mathlib, the domain, commutator, grading, real-structure and projection
equations on which the roadmap's axiom packages are built.
The spectral core itself (self-adjoint `D` with compact resolvent) is owned by
NoncommutativeGeometry N5 and is not restated here; the declarations below take
the native partial operator `D` and its bounded commutators as explicit data.

Not statable at the pins: the commutative reconstruction theorem (SM6), its
bundle/metric/spin-c refinements (SM7–SM8), the duality axiom (SM9) and the
geometric product comparisons (SM10). They need the Hochschild orientation
cycle, the Dixmier trace and the regularity calculus of NoncommutativeGeometry
N1, N4 and N5, and the KK classes of OperatorKTheory K5–K6, none of which exist
at the pinned Mathlib or Tau Ceti.

Real structures are indexed by their KO-dimension `n mod 8`: the signs `ε`,
`ε′` are read from the conventional table, and a grading with its sign `ε″`
is part of the data exactly when `n` is even. The metric dimension is a
separate datum and is not inferred from `n`.
-/

namespace TauCetiRoadmap.SpectralManifolds

universe u v

/-- The sign `ε(n)` in `J² = ε` for KO-dimension `n mod 8` (conventional table). -/
def epsilon (n : Fin 8) : ℤ := ![1, 1, -1, -1, -1, -1, 1, 1] n

/-- The sign `ε′(n)` in `JD = ε′DJ` for KO-dimension `n mod 8` (conventional table). -/
def epsilonPrime (n : Fin 8) : ℤ := ![1, -1, 1, 1, 1, -1, 1, 1] n

/-- The sign `ε″(2k)` in `Jγ = ε″γJ` for even KO-dimension `n = 2k`: `+1, −1, +1, −1`
for `n = 0, 2, 4, 6`. Odd KO-dimensions have no `ε″`. -/
def epsilonDoublePrime (k : Fin 4) : ℤ := ![1, -1, 1, -1] k

/-- The even KO-dimension `2k mod 8`. -/
def evenKO (k : Fin 4) : Fin 8 := ⟨2 * k.val, by omega⟩

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

/-- The antiunitary part of a real structure of KO-dimension `n mod 8`. Its signs are
`ε(n)` and `ε′(n)` from the conventional table, so they cannot be chosen independently
of `n`. For odd `n` this is the whole real structure and no grading is part of it. -/
structure RealStructure (D : H →ₗ.[ℂ] H) (n : Fin 8) where
  J : H ≃ₗᵢ⋆[ℂ] H
  sign_square : ∀ ξ : H, J (J ξ) = (epsilon n : ℂ) • ξ
  invariant : ∀ ξ : D.domain, J (ξ : H) ∈ D.domain
  commutes : ∀ ξ : D.domain,
    J (D ξ) = (epsilonPrime n : ℂ) • D ⟨J (ξ : H), invariant ξ⟩

/-- A real structure of even KO-dimension `2k mod 8`: the triple is even, with grading
`γ`, and `Jγ = ε″(2k) γJ`. The grading here is the spectral grading; it need not be the
volume/orientation operator, and the metric dimension may be odd (Hodge–de Rham). -/
structure EvenRealStructure (D : H →ₗ.[ℂ] H) (k : Fin 4)
    extends RealStructure D (evenKO k) where
  grading : Grading D
  grading_sign : ∀ ξ : H,
    J (grading.value ξ) = (epsilonDoublePrime k : ℂ) • grading.value (J ξ)

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
variable [CompleteSpace H]
variable (π : A →⋆ₐ[ℂ] (H →L[ℂ] H)) (D : H →ₗ.[ℂ] H)

/-- Ordinary commutative first order is a fixed equation, not an opaque flag:
every bounded commutator `[D, π a]` commutes with every `π b`. -/
def HasCommutativeFirstOrder (C : ∀ a : A, BoundedCommutator D (π a)) : Prop :=
  ∀ a b : A, (C a).value * π b = π b * (C a).value

/-- An even represented core, including representation/grading compatibility. -/
structure EvenCore where
  grading : Grading D
  representation_even : ∀ a : A, grading.value * π a = π a * grading.value

/-- The opposite action `b° = J π(b*) J⁻¹`, written as a function. -/
def oppositeApply {n : Fin 8} (R : RealStructure D n) (b : A) (ξ : H) : H :=
  R.J (π (star b) (R.J.symm ξ))

/-- Order zero uses the actual J-conjugated opposite action: `[π a, b°] = 0`. -/
def HasOrderZero {n : Fin 8} (R : RealStructure D n) : Prop :=
  ∀ (a b : A) (ξ : H),
    π a (oppositeApply π D R b ξ) = oppositeApply π D R b (π a ξ)

/-- Real first order is an explicit bounded commutator equation: `[[D, π a], b°] = 0`. -/
def HasRealFirstOrder (C : ∀ a : A, BoundedCommutator D (π a)) {n : Fin 8}
    (R : RealStructure D n) : Prop :=
  ∀ (a b : A) (ξ : H),
    (C a).value (oppositeApply π D R b ξ) = oppositeApply π D R b ((C a).value ξ)

/-- The Leibniz rule `[D, π(ab)] = [D, π a] π b + π a [D, π b]` for the bounded
extensions; the self-adjointness of `D` supplies the dense domain fixing them. -/
theorem commutator_leibniz (hD : IsSelfAdjoint D) (C : ∀ a : A, BoundedCommutator D (π a))
    (a b : A) :
    (C (a * b)).value = (C a).value * π b + π a * (C b).value := by
  sorry

/-- Antiunitary conjugation gives a complex-linear opposite action. -/
theorem oppositeApply_smul {n : Fin 8} (R : RealStructure D n) (b : A) (z : ℂ) (ξ : H) :
    oppositeApply π D R b (z • ξ) = z • oppositeApply π D R b ξ := by
  sorry

/-- Reversing products is precisely the opposite-algebra convention: `(ab)° = b° a°`. -/
theorem oppositeApply_mul {n : Fin 8} (R : RealStructure D n) (a b : A) (ξ : H) :
    oppositeApply π D R (a * b) ξ =
      oppositeApply π D R b (oppositeApply π D R a ξ) := by
  sorry

/-- A single Hochschild word `π(a₀)[D, π a₁]⋯[D, π a_p]`, before taking the chain-complex
quotient of NoncommutativeGeometry N1. -/
def orientationWord (C : ∀ a : A, BoundedCommutator D (π a)) (p : ℕ) (a : Fin (p + 1) → A) :
    H →L[ℂ] H :=
  π (a 0) * (List.ofFn fun j : Fin p => (C (a j.succ)).value).prod

end Represented

section Projection
variable {A : Type u} [CommRing A] [StarRing A]

variable {E : Type v} [AddCommGroup E] [Module A E]

/-- A finite projective presentation in the commutative column model of SM3: a native
star projection `f ∈ M_N(A)` (`f² = f = f*`) and an `A`-linear isomorphism of `E` with the
column module `f A^N`. Over the represented row module `A^N e` of SM2 one takes `f = eᵀ`. -/
structure ProjectivePresentation where
  rank_bound : ℕ
  projection : Matrix (Fin rank_bound) (Fin rank_bound) A
  isStarProjection : IsStarProjection projection
  realization : E ≃ₗ[A] LinearMap.range projection.mulVecLin

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

end TauCetiRoadmap.SpectralManifolds

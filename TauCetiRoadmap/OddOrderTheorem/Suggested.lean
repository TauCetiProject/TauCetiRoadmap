import Mathlib.GroupTheory.Sylow
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.Algebra.CharP.Algebra
import Mathlib.GroupTheory.Solvable
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.SetTheory.Cardinal.Finite
import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter

/-!
# The odd order theorem: suggested interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive;
these are suggested forms for selected targets, not a complete checklist.
Every `sorry` is a mathematical target.
-/

namespace TauCetiRoadmap.OddOrderTheorem

variable (G : Type*) [Group G] [Finite G]

/-- The explicit minimal-counterexample assumptions; none of the local conclusions is a field. -/
structure IsMinimalOddSimple : Prop where
  odd : Odd (Nat.card G)
  simple : IsSimpleGroup G
  nonabelian : ¬ IsMulCommutative G
  proper_solvable : ∀ H : Subgroup G, H ≠ ⊤ → Group.IsSolvable H

theorem not_isMinimalOddSimple : ¬ IsMinimalOddSimple G := sorry

theorem isSolvable_of_odd_natCard (hG : Odd (Nat.card G)) :
    Group.IsSolvable G := sorry

theorem even_natCard_of_nonabelian_simple [IsSimpleGroup G]
    (hG : ¬ IsMulCommutative G) : Even (Nat.card G) := sorry

section Dade

variable {G}
open scoped Pointwise

/-- Centralizer-complement data used in the Dade extension theorem. -/
structure DadeDatum (L : Subgroup G) (A : Set G) (H : G → Subgroup G) : Prop where
  subset : A ⊆ (L : Set G) \ {1}
  invariant : ∀ a ∈ A, ∀ l ∈ L, l * a * l⁻¹ ∈ A
  fusion : ∀ a ∈ A, ∀ b ∈ A, IsConj a b → ∃ l ∈ L, l * a * l⁻¹ = b
  centralizer : ∀ a ∈ A, H a ≤ Subgroup.centralizer {a}
  normal : ∀ a ∈ A, ((H a).subgroupOf (Subgroup.centralizer {a})).Normal
  disjoint : ∀ a ∈ A, H a ⊓ (L ⊓ Subgroup.centralizer {a}) = ⊥
  product : ∀ a ∈ A,
    (H a : Set G) * ((L ⊓ Subgroup.centralizer {a} : Subgroup G) : Set G) =
      (Subgroup.centralizer {a} : Set G)
  coprime : ∀ a ∈ A, ∀ b ∈ A,
    Nat.Coprime (Nat.card (H a))
      (Nat.card ↥(L ⊓ Subgroup.centralizer {b} : Subgroup G))

/-- The native class functions whose support is contained in the specified subset. -/
def supportedClassFunctions (L : Subgroup G) (A : Set G) :
    Submodule ℂ (TauCeti.ClassFunction ℂ L) where
  carrier := {f | ∀ x : L, (x : G) ∉ A → f.val x = 0}
  zero_mem' := by intro x _; rfl
  add_mem' := by
    intro f h hf hh x hx
    change f.val x + h.val x = 0
    rw [hf x hx, hh x hx, add_zero]
  smul_mem' := by
    intro c f hf x hx
    change c * f.val x = 0
    rw [hf x hx, mul_zero]

open scoped Pointwise in
theorem exists_dadeExtension [Fintype G] (L : Subgroup G) [Fintype L]
    (A : Set G) (H : G → Subgroup G) (hD : DadeDatum L A H) :
    ∃ T : supportedClassFunctions L A →ₗ[ℂ] TauCeti.ClassFunction ℂ G,
      (∀ f h, (Nat.card G : ℂ)⁻¹ * ∑ g : G, (T f).val g * starRingEnd ℂ ((T h).val g) =
        (Nat.card L : ℂ)⁻¹ * ∑ l : L, f.val.val l * starRingEnd ℂ (h.val.val l)) ∧
      (∀ f a (ha : a ∈ A) u, u ∈ H a → ∀ g : G,
        (T f).val (g⁻¹ * (a * u) * g) = f.val.val ⟨a, (hD.subset ha).1⟩) ∧
      (∀ f, (f.val : L → ℂ) ∈ TauCeti.virtualCharacters ℂ L →
        (T f : G → ℂ) ∈ TauCeti.virtualCharacters ℂ G) := sorry

/-- The full integral span, without imposing a degree-zero condition. -/
def familySpan (L : Subgroup G) (S : Set (TauCeti.ClassFunction ℂ L)) :=
  Submodule.span ℤ S

/-- The intersection on which a coherent extension must agree with the Dade map. -/
def coherenceDomain (L : Subgroup G) (A : Set G)
    (S : Set (TauCeti.ClassFunction ℂ L)) :=
  familySpan L S ⊓ (supportedClassFunctions L A).restrictScalars ℤ

/-- Coherence is existence of an integral isometry extending the specified map. -/
def IsCoherent [Fintype G] (L : Subgroup G) [Fintype L] (A : Set G)
    (S : Set (TauCeti.ClassFunction ℂ L))
    (τ : coherenceDomain L A S →+ TauCeti.ClassFunction ℂ G) : Prop :=
  ∃ ν : familySpan L S →+ TauCeti.ClassFunction ℂ G,
    (∀ f, (ν f).val ∈ TauCeti.virtualCharacters ℂ G) ∧
    (∀ f h, (Nat.card G : ℂ)⁻¹ * ∑ g : G, (ν f).val g * starRingEnd ℂ ((ν h).val g) =
      (Nat.card L : ℂ)⁻¹ * ∑ l : L, f.val.val l * starRingEnd ℂ (h.val.val l)) ∧
    ∀ f : coherenceDomain L A S, ν ⟨f.val, f.property.1⟩ = τ f

end Dade

/-- The Sylow-normalizer definition of the sigma primes, independent of core implementation. -/
def sigmaPrimes (M : Subgroup G) : Set ℕ :=
  {p | p.Prime ∧ p ∣ Nat.card M ∧ ∃ P : Sylow p M,
    Subgroup.normalizer (((P : Subgroup M).map M.subtype : Subgroup G) : Set G) ≤ M}

/-- Appendix C's comparison. The roots form the norm-one subgroup of the finite field. -/
theorem appendixC_prime_le {F : Type*} [Field F] [Finite F] {p q : ℕ}
    [CharP F p] [Algebra (ZMod p) F]
    (hp : p.Prime) (hq : q.Prime) (hcard : Nat.card F = p ^ q)
    (hcop : Nat.Coprime ((p ^ q - 1) / (p - 1)) (p - 1))
    (P U Q : Subgroup G) (Pe : Multiplicative F ≃* P)
    (Ue : rootsOfUnity ((p ^ q - 1) / (p - 1)) F ≃* U)
    (hPU : P ⊓ U = ⊥)
    (hact : ∀ (z : F) (w : rootsOfUnity ((p ^ q - 1) / (p - 1)) F),
      (Ue w : G)⁻¹ * (Pe (Multiplicative.ofAdd z) : G) * (Ue w : G) =
        (Pe (Multiplicative.ofAdd (z * ((w : Fˣ) : F))) : G))
    (hQab : ∀ x ∈ Q, ∀ z ∈ Q, x * z = z * x)
    (hQp : Nat.Coprime (Nat.card Q) p)
    (hQnorm : ∀ r : ZMod p,
      (Pe (Multiplicative.ofAdd (algebraMap (ZMod p) F r)) : G) ∈
        Subgroup.normalizer (Q : Set G))
    (y : Q) (hUnorm : ∀ r : ZMod p,
      (y : G)⁻¹ * (Pe (Multiplicative.ofAdd (algebraMap (ZMod p) F r)) : G) * (y : G) ∈
        Subgroup.normalizer (U : Set G)) : p ≤ q := sorry

end TauCetiRoadmap.OddOrderTheorem

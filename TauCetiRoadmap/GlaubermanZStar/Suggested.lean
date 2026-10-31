import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter
import Mathlib.GroupTheory.Sylow
import Mathlib.GroupTheory.SpecificGroups.Quaternion
import Mathlib.SetTheory.Cardinal.Finite

/-!
# Glauberman's Z* theorem: suggested interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive;
these are suggested forms for selected targets, not a complete checklist.
Every `sorry` is a mathematical target. The existential statements avoid
restating the shared prime-set core from the local finite-group roadmap.
-/

namespace TauCetiRoadmap.GlaubermanZStar

universe u

variable {G : Type u} [Group G] [Finite G]

theorem glauberman_zStar (t : G) (ht : orderOf t = 2)
    (hisolated : ∀ g : G,
      (g * t * g⁻¹) * t = t * (g * t * g⁻¹) → g * t * g⁻¹ = t) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

theorem glauberman_zStar_sylow (S : Sylow 2 G) (t : G)
    (htS : t ∈ (S : Subgroup G)) (ht : orderOf t = 2)
    (hclosed : ∀ g : G, g⁻¹ * t * g ∈ (S : Subgroup G) → g⁻¹ * t * g = t) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

theorem brauer_suzuki (S : Sylow 2 G) (n : ℕ) (hn : 3 ≤ n)
    (hS : Nonempty ((S : Subgroup G) ≃* QuaternionGroup (2 ^ (n - 2))))
    (t : G) (htS : t ∈ (S : Subgroup G)) (ht : orderOf t = 2) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

/-- Concrete endpoint used in the induction interface. -/
def ZStarConclusion (t : G) : Prop :=
  ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
    ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N

/-- Central-character congruence with the trivial character, compared with M4's
principal block. This is a suggested comparison criterion, not a second block API. -/
def InPrincipalTwoBlock (m : Ideal (integralClosure ℤ ℂ)) (χ : G → ℂ) : Prop :=
  χ ∈ TauCeti.irreducibleCharacters ℂ G ∧ ∀ g : G,
    ∃ z : integralClosure ℤ ℂ,
      (z : ℂ) = (Nat.card (ConjClasses.mk g).carrier : ℂ) * χ g / χ 1 ∧
      z - (Nat.card (ConjClasses.mk g).carrier : integralClosure ℤ ℂ) ∈ m

theorem principalBlock_involution_section_constancy
    (m : Ideal (integralClosure ℤ ℂ)) (hm : m.IsMaximal) (h2 : (2 : integralClosure ℤ ℂ) ∈ m)
    (χ : G → ℂ) (hχ : InPrincipalTwoBlock m χ)
    (s : G) (hs : orderOf s = 2)
    (N : Subgroup (Subgroup.centralizer {s})) (hN : N.Normal)
    (hodd : Odd (Nat.card N)) (v : N) :
    χ (s * ((v : Subgroup.centralizer {s}) : G)) = χ s := sorry

theorem principalBlock_character_alternative
    (m : Ideal (integralClosure ℤ ℂ)) (hm : m.IsMaximal) (h2 : (2 : integralClosure ℤ ℂ) ∈ m)
    (χ : G → ℂ) (hχ : InPrincipalTwoBlock m χ) (hne : χ ≠ 1)
    (t : G) (ht : orderOf t = 2)
    (hisolated : ∀ g : G,
      (g * t * g⁻¹) * t = t * (g * t * g⁻¹) → g * t * g⁻¹ = t)
    (hgen : Subgroup.normalClosure ({t} : Set G) = ⊤)
    (ih : ∀ (K : Type u) [Group K] [Finite K], Nat.card K < Nat.card G →
      ∀ u : K, orderOf u = 2 →
        (∀ k : K, (k * u * k⁻¹) * u = u * (k * u * k⁻¹) → k * u * k⁻¹ = u) →
        ZStarConclusion u)
    (s : G) (hs : orderOf s = 2) (hst : s * t = t * s) (hst_ne : s ≠ t) :
    ZStarConclusion t ∨ χ s = 0 ∨ χ t = -χ 1 := sorry

end TauCetiRoadmap.GlaubermanZStar

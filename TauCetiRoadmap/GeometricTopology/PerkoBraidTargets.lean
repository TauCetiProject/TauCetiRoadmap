import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import Mathlib.Tactic.Group
import Mathlib.Tactic.NormNum

/-! Representative native braid calculations, not an exhaustive checklist.
The README is definitive. These identities do not identify any pictured knot
with a braid closure or certify the historical Perko labels. -/

namespace TauCetiRoadmap.GeometricTopology.PerkoBraid

open TauCeti

abbrev a : BraidGroup 3 := BraidGroup.sigma 0
abbrev b : BraidGroup 3 := BraidGroup.sigma 1

/-- The first word on course physical page 206. -/
def sourceWord : BraidGroup 3 := b ^ (-2 : ℤ) * a ^ (-3 : ℤ) * b⁻¹ * a * b⁻¹ * a ^ (-2 : ℤ)

/-- Change every crossing sign while preserving word order. -/
def reflectedWord : BraidGroup 3 := b ^ 2 * a ^ 3 * b * a⁻¹ * b * a ^ 2

/-- The first printed alpha line; its outer exponents are negative. -/
def printedAlpha : BraidGroup 3 := b ^ (-2 : ℤ) * a ^ 3 * b * a⁻¹ * b * a ^ (-2 : ℤ)

/-- The final word, also written beside the other pictured knot. -/
def finalWord : BraidGroup 3 := b ^ 2 * a ^ 3 * b ^ 2 * a * b⁻¹ * a

abbrev exponent (x : BraidGroup 3) : ℤ :=
  Multiplicative.toAdd (ArtinGroup.exponentSum _ x)

theorem source_exponent : exponent sourceWord = -8 := by
  norm_num [exponent, sourceWord, a, b, map_mul, map_zpow, map_inv,
    BraidGroup.exponentSum_sigma]

theorem reflected_exponent : exponent reflectedWord = 8 := by
  norm_num [exponent, reflectedWord, a, b, map_mul, map_pow, map_inv,
    BraidGroup.exponentSum_sigma]

theorem printed_exponent : exponent printedAlpha = 0 := by
  norm_num [exponent, printedAlpha, a, b, map_mul, map_pow, map_zpow, map_inv,
    BraidGroup.exponentSum_sigma]

theorem reflected_eq_final : reflectedWord = finalWord := by
  have h : a * b * a = b * a * b := BraidGroup.sigma_braid (Or.inl rfl)
  have hc : a⁻¹ * b * a = b * a * b⁻¹ := by
    calc
      a⁻¹ * b * a = a⁻¹ * (b * a * b) * b⁻¹ := by group
      _ = a⁻¹ * (a * b * a) * b⁻¹ := by rw [← h]
      _ = b * a * b⁻¹ := by group
  calc
    reflectedWord = (b ^ 2 * a ^ 3) * b * (a⁻¹ * b * a) * a := by
      simp [reflectedWord, pow_two, mul_assoc]
    _ = (b ^ 2 * a ^ 3) * b * (b * a * b⁻¹) * a := by rw [hc]
    _ = finalWord := by
      simp [finalWord, pow_two, mul_assoc]

theorem printed_ne_reflected : printedAlpha ≠ reflectedWord := by
  intro h
  have hh := congrArg exponent h
  rw [printed_exponent, reflected_exponent] at hh
  norm_num at hh

theorem printed_ne_final : printedAlpha ≠ finalWord := by
  rw [← reflected_eq_final]
  exact printed_ne_reflected

end TauCetiRoadmap.GeometricTopology.PerkoBraid

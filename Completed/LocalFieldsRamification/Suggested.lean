import Mathlib
import TauCeti.NumberTheory.LocalField.RamificationGroup
import TauCeti.NumberTheory.LocalField.RamificationIndex

/-!
# Local fields and ramification: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, as the acceptance test of
the finished roadmap.

The headline theorem still open at the pins is Sen's congruence for the lower breaks of a totally
ramified cyclic extension of degree `p ^ r` in residue characteristic `p` (README, Layer 1). It
is statable there on Tau Ceti's lower index `TauCeti.IsLocalRing.lowerIndex`, so nothing is
declared beyond it.

Every other headline of the roadmap is a theorem of the pinned Tau Ceti and is consumed there by
name (README, Exact supplier contracts): among them `TauCeti.ramificationIndex_mul_inertiaDegree`,
`TauCeti.card_powerClasses`, `TauCeti.isOpen_range_powMonoidHom`,
`TauCeti.existsUnique_isUnramified_finrank_eq`,
`TauCeti.isTotallyRamified_iff_exists_eisenstein_generator`,
`TauCeti.exists_integerRing_adjoin_eq_top`,
`TauCeti.LocalFieldsRamification.herbrand_tower`,
`Subgroup.upperRamificationGroup_fixedField`,
`TauCeti.map_normUnits_unitFiltration_psiNat_le`, `TauCeti.normGradedMap_at_break`,
`TauCeti.differentExponent_eq_finsum_lowerRamificationGroup`,
`TauCeti.isProPSylow_wildInertiaSubgroup`, `TauCeti.eq_tameQuotientEquiv` and the Hasse–Arf
theorem `TauCeti.LocalFieldsRamification.hasseArf` (README, Layer 2). No headline of the roadmap is
unstatable at the pins.

This file's admitted target is not a completion certificate. The current-source implementation review
is in `COMPLETION.md`.
-/

namespace TauCetiRoadmap.LocalFieldsRamification

open ValuativeRel

/-! ## Layer 1: Sen's congruence for cyclic `p`-power extensions -/

/-- **Sen's congruence for lower breaks.** Let `L/K` be a totally ramified cyclic extension of
nonarchimedean local fields of degree `p ^ r`, where `p` is the residue characteristic, and let
`σ` generate `Gal(L/K)`. For `j + 1 < r` write the lower indices of the nontrivial elements
`σ ^ p ^ j` and `σ ^ p ^ (j + 1)` as `b₀ + 1` and `b₁ + 1`, so that `b₀` and `b₁` are consecutive
lower breaks. Then `p ^ (j + 1)` divides `b₁ - b₀`. Here `lowerIndex 𝒪[L] τ` is Serre's
`i(τ) = min v_L(τ x - x)`, and `b = i(τ) - 1` is the valuation of `τ(π)/π - 1` for a uniformizer
`π` of `L`. Fesenko–Vostokov, *Local Fields and Their Extensions*, 2nd ed., III (4.3), the
Proposition after Sh. Sen, part (3), pp. 92–93. -/
theorem pow_succ_dvd_lowerIndex_sub
    (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    (p r : ℕ) (hp : ringChar 𝓀[K] = p) (htr : TauCeti.IsTotallyRamified K L)
    (hdeg : Module.finrank K L = p ^ r) (σ : L ≃ₐ[K] L) (hσ : Subgroup.zpowers σ = ⊤)
    (j : ℕ) (hj : j + 1 < r) (b₀ b₁ : ℕ)
    (h₀ : TauCeti.IsLocalRing.lowerIndex 𝒪[L] (σ ^ p ^ j) = (b₀ + 1 : ℕ))
    (h₁ : TauCeti.IsLocalRing.lowerIndex 𝒪[L] (σ ^ p ^ (j + 1)) = (b₁ + 1 : ℕ)) :
    (p : ℤ) ^ (j + 1) ∣ (b₁ : ℤ) - b₀ :=
  sorry

end TauCetiRoadmap.LocalFieldsRamification

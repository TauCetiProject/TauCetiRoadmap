import Mathlib
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.RamificationIndex

/-!
# The field of norms: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins the carrier of the field of norms (Layer 1): the norm-compatible families
`(α_E)_E` over the finite subextensions `E` of `L/K`, as a submonoid `fieldOfNorms K L` of the
product `∏_E E` under termwise multiplication, with zero the only family having a zero
coordinate. It states, at finite level against the pinned Tau Ceti, the norm estimate that drives
the construction (Layer 1.3), in the Galois case, and the norm identity behind the cyclotomic
worked example.

The rest is stated in `README.md` only. Arithmetically profinite extensions, `ψ_{L/K}` and the
additive structure of `X_K(L)` are defined through the absolute upper filtration of
TauCetiProject/TauCetiRoadmap#1410 §4a.1 and the filtered groups of the filtered local Galois
groups roadmap (TauCetiProject/TauCetiRoadmap#1795), which have no declaration at the pins.

Suggested home: `TauCeti/NumberTheory/LocalField/FieldOfNorms/`.
-/

namespace TauCetiRoadmap.FieldOfNorms

/-! ## Layer 1.1: the carrier -/

section Carrier

variable (K L : Type*) [Field K] [Field L] [Algebra K L]

/-- The **finite subextensions** of `L/K`, the index category `𝓔_{L/K}` of the inverse limit;
ordered by inclusion, and directed. -/
abbrev FiniteSubextension : Type _ :=
  {E : IntermediateField K L // FiniteDimensional K E}

/-- `α : ∏_E E` is **norm-compatible** if `N_{E'/E}(α_{E'}) = α_E` whenever `E ≤ E'`. The norm
is that of `E'` viewed as an extension of `E`, `IntermediateField.extendScalars`. -/
def IsNormCompatible (α : ∀ E : FiniteSubextension K L, E.1) : Prop :=
  ∀ (E E' : FiniteSubextension K L) (h : E.1 ≤ E'.1),
    Algebra.norm E.1
        (⟨(α E' : L), (IntermediateField.mem_extendScalars h).2 (α E').2⟩ :
          IntermediateField.extendScalars h) = α E

/-- The **field of norms** `X_K(L)` as a multiplicative monoid [Wintenberger 1983, 2.1.1]: the
norm-compatible families under termwise multiplication. Its additive structure is Layer 1.5. -/
def fieldOfNorms : Submonoid (∀ E : FiniteSubextension K L, E.1) where
  carrier := {α | IsNormCompatible K L α}
  mul_mem' := sorry
  one_mem' := sorry

/-- **Zero is the only family with a zero coordinate**: `X_K(L) = X_K(L)^* ∪ {0}`, where
`X_K(L)^* = lim E^*`. -/
theorem eq_zero_or_forall_ne_zero {α : ∀ E : FiniteSubextension K L, E.1}
    (hα : α ∈ fieldOfNorms K L) : α = 0 ∨ ∀ E, α E ≠ 0 :=
  sorry

end Carrier

/-! ## Layer 1.3: the norm estimate, Galois case -/

section NormEstimate

open ValuativeRel IsLocalRing TauCeti TauCeti.LocalFieldsRamification

variable (p : ℕ) [Fact p.Prime] {K L : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
  [IsGalois K L]

/-- **The norm is additive to high order** [Wintenberger 1983, Prop. 2.2.1(i)], for `L/K` finite
Galois, totally ramified, of `p`-power degree, with `Gal(L/K)^i = Gal(L/K)`:
`v_K(N(α + β) - N(α) - N(β)) ≥ (p - 1) i / p` for `α, β ∈ 𝒪_L`. The README states it for finite
separable `L/K`, with `i = i(L/K)` read through `ψ_{L/K}`. -/
theorem norm_add_sub_norm_sub_norm_mem (hp : CharP (ResidueField 𝒪[K]) p) (r : ℕ)
    (hdeg : Module.finrank K L = p ^ r) (htot : IsTotallyRamified K L) (i : ℝ) (hi : 0 ≤ i)
    (htop : upperRamificationGroup K L ⟨i, le_trans (by norm_num) hi⟩ = ⊤) (α β : 𝒪[L]) :
    Algebra.norm 𝒪[K] (α + β) - Algebra.norm 𝒪[K] α - Algebra.norm 𝒪[K] β ∈
      𝓂[K] ^ ⌈((p : ℝ) - 1) * i / p⌉₊ :=
  sorry

/-- **Almost every integer is a norm** [Wintenberger 1983, Prop. 2.2.1(ii)], same hypotheses:
every `a ∈ 𝒪_K` is within `(p - 1) i / p` of `N(α)` for some `α ∈ 𝒪_L`. -/
theorem exists_norm_sub_mem (hp : CharP (ResidueField 𝒪[K]) p) (r : ℕ)
    (hdeg : Module.finrank K L = p ^ r) (htot : IsTotallyRamified K L) (i : ℝ) (hi : 0 ≤ i)
    (htop : upperRamificationGroup K L ⟨i, le_trans (by norm_num) hi⟩ = ⊤) (a : 𝒪[K]) :
    ∃ α : 𝒪[L], Algebra.norm 𝒪[K] α - a ∈ 𝓂[K] ^ ⌈((p : ℝ) - 1) * i / p⌉₊ :=
  sorry

end NormEstimate

/-! ## Worked example: the cyclotomic norm identity -/

/-- If `x` generates `E'/E` with minimal polynomial `X^n - a`, then `N_{E'/E}(1 - x) = 1 - a`.
With `x = ζ_{p^{n+1}}` and `a = ζ_{p^n}`, the family `(1 - ζ_{p^n})_n` is norm-compatible. -/
theorem norm_one_sub_of_minpoly_eq {E E' : Type*} [Field E] [Field E'] [Algebra E E'] (n : ℕ)
    (x : E') (a : E) (hx : IntermediateField.adjoin E {x} = ⊤)
    (hmin : minpoly E x = Polynomial.X ^ n - Polynomial.C a) :
    Algebra.norm E (1 - x) = 1 - a :=
  sorry

end TauCetiRoadmap.FieldOfNorms

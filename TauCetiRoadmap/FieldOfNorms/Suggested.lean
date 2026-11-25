module

public import Mathlib
public import TauCeti.NumberTheory.LocalField.Herbrand.Basic
public import TauCeti.NumberTheory.LocalField.RamificationIndex

/-!
# The field of norms: target signatures

The roadmap is `README.md`; this file is not the roadmap, and it is not exhaustive. These are
suggested forms. The README carries every target and Check.

Stated here:

* the carrier of the field of norms (README 1.1): the finite subextensions `FiniteSubextension K L`
  of `L/K`, the predicate `IsNormCompatible` on families `(α_E)_E` with `α_E ∈ E`, and the
  submonoid `fieldOfNorms K L` of `∏_E E` of norm-compatible families under termwise
  multiplication, with zero the only family having a zero coordinate;
* the norm estimates that drive the construction (README 1.3), at finite level and in the Galois
  case, against the pinned Tau Ceti upper ramification groups.

Not statable at the pins, with the carrier each lacks:

* the fixing-subgroup model `G_L ≃ₜ* L.fixingSubgroup` for infinite algebraic `L` (README 0.0) is
  data, and is not stated with `sorry`;
* APF extensions and their Herbrand functions (README 0.1–0.6) need the absolute upper filtration
  `G_K^u` of RamificationOfCompleteDiscretelyValuedFields §4a.1 and the filtered groups of
  FilteredLocalGaloisGroups Layers 1–2;
* the field-of-norms isomorphism `ι_{L/K} : G_L ≃ₜ* G_{X_K(L)}` (README 2.2) needs `X_K(L)` as a
  field, whose addition is README 1.5;
* the reading of the upper filtration above `L` (README 3.3) needs `G_K^u` and `ι_{L/K}`;
* full faithfulness and the lifting of isomorphisms (README 4.2–4.3) need the categories `ΓEXT`
  and `ΓAUT` of README 4.1, built on the field `X_K(L)`;
* the comparison with tilting (README 5.2–5.4) needs the embedding `Λ_{L/K}` of README 5.1.

Suggested home: `TauCeti/NumberTheory/LocalField/FieldOfNorms/`.
-/

@[expose] public section

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
  mul_mem' {a b} ha hb E E' h := by
    have := congrArg₂ (· * ·) (ha E E' h) (hb E E' h)
    rw [← map_mul] at this
    exact this
  one_mem' E E' h := map_one (Algebra.norm E.1)

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

end TauCetiRoadmap.FieldOfNorms

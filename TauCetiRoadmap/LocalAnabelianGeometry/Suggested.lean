module

public import Mathlib
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Cyclotomic.Character
public import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
public import TauCeti.NumberTheory.LocalField.DeepUnits.Basic
public import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
public import TauCeti.NumberTheory.LocalField.WildInertia

/-!
# Anabelian geometry of `p`-adic local fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements suggest Lean forms for headline milestones; discharging them finishes neither a
layer nor the roadmap.

Stated here, against the pinned Mathlib and Tau Ceti: the logarithm on principal units and the
spanning lemma (0.5–0.6), the unfiltered recovery of the numerical invariants (Layer 1), of inertia
and wild inertia (Layer 3) and of the cyclotomic character (Layer 2) in their `G_K` forms, and
uniformizing characters with their existence (7.1–7.2), with the one predicate those need.

Not stated here:

* 0.1–0.3, the `p`-adic model, the continuous transfer of an open subgroup and its reciprocity
  form: they are constructions of data (an isomorphism of topological groups and a continuous
  homomorphism of topological abelianizations), specified in `README.md` with their defining
  properties.
* 0.4 and every filtered statement: the upper filtration of `G_K` and of its quotients, the solvable
  quotients `G_K^m`, filtered isomorphisms and `Out_Filt` are those of FilteredLocalGaloisGroups,
  and the absolute upper filtration of ClassFieldTheory Layer 7 has no declaration at the pin.
* the `m`-step forms of Layers 1–4, which need `G_K^m`, and Layers 5, 6, 7.3–7.4 and 8, which
  further need the Galois action on `ℂ_p` of PadicPeriodRings §1.1 and the Hodge–Tate weights of
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1, neither declared at the pins.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/`.
-/

@[expose] public section

open ValuativeRel IsNonarchimedeanLocalField NormedSpace TauCeti TauCeti.ClassFieldTheory

namespace TauCetiRoadmap.LocalAnabelianGeometry

/-! ## Layers 0.5–0.6: the logarithm and the spanning lemma -/

section Units

variable {p : ℕ} [Fact p.Prime] {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [hK : FinitePadicExtension K p]

include hK

/-- **The logarithm is a homomorphism on `U(K,1)`**, reduced to the deep case
`log_mul_of_mem_unitFiltration` by a `p`-power. -/
theorem log_mul_of_mem_unitFiltration_one {u w : Kˣ} (hu : u ∈ unitFiltration K 1)
    (hw : w ∈ unitFiltration K 1) :
    log ((u : K) * w) = log (u : K) + log (w : K) :=
  sorry

/-- The kernel of the logarithm on `U(K,1)` is the group of `p`-power roots of unity. -/
theorem log_eq_zero_iff {u : Kˣ} (hu : u ∈ unitFiltration K 1) :
    log (u : K) = 0 ↔ ∃ n : ℕ, u ^ p ^ n = 1 :=
  sorry

/-- **An open subgroup of units spans** [Mochizuki 1997, Lem. 4.1]. -/
theorem span_units_eq_top (I : Subgroup 𝒪[K]ˣ) (hI : IsOpen (I : Set 𝒪[K]ˣ)) :
    Submodule.span ℚ_[p] ((fun u : 𝒪[K]ˣ => ((u : 𝒪[K]) : K)) '' I) = ⊤ :=
  sorry

/-- Two `ℚ_p`-algebra homomorphisms agreeing on an open subgroup of units are equal. -/
theorem algHom_ext_of_eqOn_units {Ω : Type*} [Field Ω] [Algebra ℚ_[p] Ω]
    (I : Subgroup 𝒪[K]ˣ) (hI : IsOpen (I : Set 𝒪[K]ˣ)) (f g : K →ₐ[ℚ_[p]] Ω)
    (hfg : ∀ u ∈ I, f ((u : 𝒪[K]) : K) = g ((u : 𝒪[K]) : K)) : f = g :=
  sorry

/-- **Ring homomorphisms between finite extensions of `ℚ_p` are `ℚ_p`-linear.** -/
theorem algebraMap_comp_ringHom {K' : Type*} [Field K'] [ValuativeRel K'] [TopologicalSpace K']
    [IsNonarchimedeanLocalField K'] [FinitePadicExtension K' p] (f : K →+* K') :
    f.comp (algebraMap ℚ_[p] K) = algebraMap ℚ_[p] K' :=
  sorry

end Units

/-! ## Layers 1–3: unfiltered recovery -/

section Recovery

variable {p p' : ℕ} [Fact p.Prime] [Fact p'.Prime]
  {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [hK : FinitePadicExtension K p]
  {K' : Type} [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
  [hK' : FinitePadicExtension K' p']

include hK hK'

/-- **The numerical invariants from `G^ab`** [Hyeon 2025, Prop. 3.1]: the residue characteristic,
the degree, the residue field size, the absolute ramification index and the number of `p`-power
roots of unity. -/
theorem eq_of_continuousMulEquiv_abelianization
    (α : Field.absoluteGaloisGroupAbelianization K ≃ₜ* Field.absoluteGaloisGroupAbelianization K') :
    p = p' ∧ Module.finrank ℚ_[p] K = Module.finrank ℚ_[p'] K' ∧
      Nat.card 𝓀[K] = Nat.card 𝓀[K'] ∧
      absoluteRamificationIndex K p = absoluteRamificationIndex K' p' ∧
      Nat.card {ζ : Kˣ // ∃ n : ℕ, ζ ^ p ^ n = 1} =
        Nat.card {ζ : K'ˣ // ∃ n : ℕ, ζ ^ p' ^ n = 1} :=
  sorry

/-- **Inertia is recovered from `G_K`** [Mochizuki 1997, Cor. 1.3], through the `m`-step form
[Hyeon 2025, Lem. 4.1]. -/
theorem map_inertiaSubgroup (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (inertiaSubgroup K).map α.toMulEquiv.toMonoidHom = inertiaSubgroup K' :=
  sorry

theorem map_wildInertiaSubgroup
    (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (wildInertiaSubgroup K).map α.toMulEquiv.toMonoidHom = wildInertiaSubgroup K' :=
  sorry

end Recovery

section Cyclotomic

variable {p : ℕ} [Fact p.Prime]
  {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [hK : FinitePadicExtension K p]
  {K' : Type} [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
  [hK' : FinitePadicExtension K' p]

include hK hK'

/-- **The `ℓ`-adic cyclotomic character is recovered from `G_K`** for every prime `ℓ`
[Mochizuki 1997, Prop. 1.1], through `G_K^2` [Hyeon 2025, Prop. 3.2]. The common residue
characteristic is forced by `eq_of_continuousMulEquiv_abelianization`. -/
theorem localCyclotomicCharacter_comp_continuousMulEquiv (ℓ : ℕ) [Fact ℓ.Prime]
    (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (localCyclotomicCharacter ℓ K').comp α.toMulEquiv.toMonoidHom = localCyclotomicCharacter ℓ K :=
  sorry

end Cyclotomic

/-! ## Layer 7: uniformizing characters -/

section Uniformizing

variable (p : ℕ) [Fact p.Prime]
  (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [FinitePadicExtension K p]
  (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  [FinitePadicExtension E p]

/-- A character `ρ : G_K^ab → Eˣ` is **uniformizing** [Hyeon 2025, §5; Mochizuki 1997, Def. 3.2]
if it is continuous and on an open subgroup of units it is a field embedding read through the
Artin map. -/
def IsUniformizing (ρ : Field.absoluteGaloisGroupAbelianization K →* Eˣ) : Prop :=
  Continuous ρ ∧ ∃ I : Subgroup 𝒪[K]ˣ, IsOpen (I : Set 𝒪[K]ˣ) ∧ ∃ ι : K →ₐ[ℚ_[p]] E, ∀ u ∈ I,
    (ρ (artinMap K (Units.map (algebraMap 𝒪[K] K).toMonoidHom u)) : E) = ι ((u : 𝒪[K]) : K)

/-- **Existence** [Hyeon 2025, Ex. 5.4]: for `K ⊆ E`, the transfer to `G_E^ab`, the projection to
the image of inertia, and `Art_E⁻¹` give a continuous character equal to the inclusion on all of
`𝒪_K^×`. -/
theorem exists_isUniformizing [Algebra K E] [IsScalarTower ℚ_[p] K E] :
    ∃ ρ : Field.absoluteGaloisGroupAbelianization K →* Eˣ, IsUniformizing p K E ρ ∧ ∀ u : 𝒪[K]ˣ,
        (ρ (artinMap K (Units.map (algebraMap 𝒪[K] K).toMonoidHom u)) : E) =
          algebraMap K E ((u : 𝒪[K]) : K) :=
  sorry

end Uniformizing

end TauCetiRoadmap.LocalAnabelianGeometry

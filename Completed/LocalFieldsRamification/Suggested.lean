import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.AlgebraicExtension.Tower
import TauCeti.NumberTheory.LocalField.DeepUnits.Basic
import TauCeti.NumberTheory.LocalField.Different.AlgEquiv
import TauCeti.NumberTheory.LocalField.Different.Basic
import TauCeti.NumberTheory.LocalField.Different.Wild
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Eisenstein.PowerBasis
import TauCeti.NumberTheory.LocalField.Eisenstein.TotallyRamified
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.InertiaDegree
import TauCeti.NumberTheory.LocalField.Monogenic
import TauCeti.NumberTheory.LocalField.NatCastValuation
import TauCeti.NumberTheory.LocalField.Norm.Unramified.Basic
import TauCeti.NumberTheory.LocalField.PowerSubgroup.Basic
import TauCeti.NumberTheory.LocalField.PowerSubgroup.Open
import TauCeti.NumberTheory.LocalField.RamificationGroup
import TauCeti.NumberTheory.LocalField.RamificationIndex
import TauCeti.NumberTheory.LocalField.ResidueCorrespondence
import TauCeti.NumberTheory.LocalField.Squares
import TauCeti.NumberTheory.LocalField.Tame.Presentation
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.UnitFiltration.Map
import TauCeti.NumberTheory.LocalField.UnitFiltration.RamificationGroup
import TauCeti.NumberTheory.LocalField.UnitsDecomposition
import TauCeti.NumberTheory.LocalField.WildInertia
import TauCeti.Topology.Algebra.Group.Profinite.Presentation.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# Local fields and ramification: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, as the acceptance test of
the finished roadmap.

The headline theorem still open at the pins is Sen's congruence for the lower breaks of a totally
ramified cyclic extension of degree `p ^ r` in residue characteristic `p` (README, Layer 1). It
is statable there on Tau Ceti's lower index `TauCeti.IsLocalRing.lowerIndex`, so it is the only
target declared here.

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

The second part of the file keeps the names that other roadmaps import from this one (README,
*Names imported by other roadmaps*). Each is an abbreviation of a Tau Ceti declaration, a
definition read off one, or a theorem closed by Tau Ceti's theorem, so a consumer's statement is
about Tau Ceti's object; none of them is admitted.

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

/-! ## Names imported by other roadmaps -/

/- `ClassFieldTheory`, `LocalGaloisGroups`, `MassFormula`, `QuadraticFormInvariants`,
`OrthogonalSpinGroups` and `NumberFieldArithmetic` cite the names below as this roadmap's. Each
docstring names the Tau Ceti declaration, and says how the hypotheses are adapted where Tau Ceti
packages them differently. -/

section Consumers

universe u v

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type v) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ### Valuations, `e` and `f` -/

/-- The normalized valuation `v_K`, with `v_K(π) = 1` on a uniformizer, valued in
`Multiplicative ℤ`: Tau Ceti's `TauCeti.normalizedValuation`. -/
noncomputable abbrev normalizedValuation : Kˣ →* Multiplicative ℤ :=
  TauCeti.normalizedValuation K

/-- The normalized valuation is surjective: Tau Ceti's `TauCeti.normalizedValuation_surjective`. -/
theorem normalizedValuation_surjective : Function.Surjective (normalizedValuation K) :=
  TauCeti.normalizedValuation_surjective

/-- `v_K(x) = 0` exactly when `x` is a unit of `𝒪[K]`: Tau Ceti's
`TauCeti.normalizedValuation_eq_one_iff`. -/
theorem normalizedValuation_eq_one_iff (x : Kˣ) :
    normalizedValuation K x = 1 ↔ valuation K (x : K) = 1 :=
  TauCeti.normalizedValuation_eq_one_iff x

/-- `v_K(π) = 1` for a uniformizer `π`: Tau Ceti's `TauCeti.normalizedValuation_irreducible`, with
the nonvanishing proof taken as an argument. -/
theorem normalizedValuation_irreducible (π : 𝒪[K]) (hπ : Irreducible π) (hπ0 : (π : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (π : K) hπ0) = Multiplicative.ofAdd 1 :=
  TauCeti.normalizedValuation_irreducible hπ

/-- The spectral-norm structure on a finite intermediate field `M` of `Ω/K`: Tau Ceti's
`TauCeti.finiteIntermediateFieldNormedField`. -/
noncomputable abbrev finiteIntermediateFieldNormedField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : NormedField M :=
  TauCeti.finiteIntermediateFieldNormedField K Ω M

/-- The valuative relation on a finite intermediate field: Tau Ceti's
`TauCeti.finiteIntermediateFieldValuativeRel`. -/
noncomputable abbrev finiteIntermediateFieldValuativeRel
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : ValuativeRel M :=
  TauCeti.finiteIntermediateFieldValuativeRel K Ω M

/-- The topology on a finite intermediate field: Tau Ceti's
`TauCeti.finiteIntermediateFieldTopology`. -/
noncomputable abbrev finiteIntermediateFieldTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : TopologicalSpace M :=
  TauCeti.finiteIntermediateFieldTopology K Ω M

/-- The intermediate-field structure extends that of `K`: Tau Ceti's
`TauCeti.finiteIntermediateField_valuativeExtension`. -/
theorem finiteIntermediateField_valuativeExtension
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    letI := finiteIntermediateFieldValuativeRel K Ω M
    ValuativeExtension K M :=
  TauCeti.finiteIntermediateField_valuativeExtension K Ω M

/-- The intermediate-field topology is the valuative one: Tau Ceti's
`TauCeti.finiteIntermediateField_isValuativeTopology`. -/
theorem finiteIntermediateField_isValuativeTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsValuativeTopology M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  TauCeti.finiteIntermediateField_isValuativeTopology K Ω M

/-- A finite intermediate field is a nonarchimedean local field: Tau Ceti's
`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`. -/
theorem finiteIntermediateField_isNonarchimedeanLocalField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsNonarchimedeanLocalField M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K Ω M

/-- The ramification index `e(L/K)`: Tau Ceti's `TauCeti.ramificationIndex`. -/
noncomputable abbrev ramificationIndex [Algebra K L] : ℕ :=
  TauCeti.ramificationIndex K L

/-- The residue degree `f(L/K)`: Tau Ceti's `TauCeti.inertiaDegree`. -/
noncomputable abbrev inertiaDegree [Algebra K L] [ValuativeExtension K L] : ℕ :=
  TauCeti.inertiaDegree K L

/-- Total ramification, `e(L/K) = [L : K]`: Tau Ceti's `TauCeti.IsTotallyRamified`. Tau Ceti
describes the tamely ramified ones as radical extensions
(`TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_of_isTamelyRamified`,
`TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_and_autEquivRootsOfUnity`). -/
abbrev IsTotallyRamified [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] : Prop :=
  TauCeti.IsTotallyRamified K L

/-- `v_L` restricted to `K` is `e(L/K) · v_K`: Tau Ceti's `TauCeti.normalizedValuation_algebraMap`. -/
theorem normalizedValuation_algebraMap [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (x : Kˣ) :
    normalizedValuation L (Units.map (algebraMap K L : K →* L) x)
      = normalizedValuation K x ^ ramificationIndex K L :=
  TauCeti.normalizedValuation_algebraMap x

/-- `#𝓀[L] = #𝓀[K] ^ f(L/K)`: Tau Ceti's `TauCeti.natCard_residueField`. -/
theorem card_residueField [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ inertiaDegree K L :=
  TauCeti.natCard_residueField K L

/-- `e · f = [L : K]`: Tau Ceti's `TauCeti.ramificationIndex_mul_inertiaDegree`. -/
theorem ramificationIndex_mul_inertiaDegree [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    ramificationIndex K L * inertiaDegree K L = Module.finrank K L :=
  TauCeti.ramificationIndex_mul_inertiaDegree K L

/-- Total ramification is `f(L/K) = 1`: Tau Ceti's
`TauCeti.isTotallyRamified_iff_inertiaDegree_eq_one`. -/
theorem isTotallyRamified_iff_inertiaDegree_eq_one [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    IsTotallyRamified K L ↔ inertiaDegree K L = 1 :=
  TauCeti.isTotallyRamified_iff_inertiaDegree_eq_one K L

/-- The valuation `v_K(n)` of a nonzero natural-number cast: Tau Ceti's `TauCeti.natCastValuation`. -/
noncomputable abbrev natCastValuation (n : ℕ) (hn : (n : K) ≠ 0) : ℕ :=
  TauCeti.natCastValuation K n hn

/-- The defining equation of `natCastValuation`: Tau Ceti's `TauCeti.normalizedValuation_natCast`. -/
theorem normalizedValuation_natCast (n : ℕ) (hn : (n : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (n : K) hn)
      = Multiplicative.ofAdd (natCastValuation K n hn : ℤ) :=
  TauCeti.normalizedValuation_natCast K n hn

/-- `v_K(n) = 0` exactly when `n` is a unit of `𝒪[K]`: Tau Ceti's
`TauCeti.natCastValuation_eq_zero_iff`. -/
theorem natCastValuation_eq_zero_iff (n : ℕ) (hn : (n : K) ≠ 0) :
    natCastValuation K n hn = 0 ↔ IsUnit (n : ↥𝒪[K]) :=
  TauCeti.natCastValuation_eq_zero_iff K n hn

/-- The absolute ramification index `e(K/ℚ_p)` of a finite extension of `ℚ_p`: Tau Ceti's
`TauCeti.absoluteRamificationIndex`, whose class `TauCeti.FinitePadicExtension K p` is found from the
three instances taken here. -/
noncomputable abbrev absoluteRamificationIndex (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K] : ℕ :=
  TauCeti.absoluteRamificationIndex K p

/-- `e(K/ℚ_p) = v_K(p)`: Tau Ceti's `TauCeti.absoluteRamificationIndex_eq_natCastValuation`, with
the nonvanishing proof taken as an argument. -/
theorem absoluteRamificationIndex_eq_natCastValuation (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (hp : (p : K) ≠ 0) :
    absoluteRamificationIndex K p = natCastValuation K p hp :=
  TauCeti.absoluteRamificationIndex_eq_natCastValuation K p

/-! ### Units and power classes -/

/-- The unit filtration, `U(K,0) = 𝒪[K]ˣ` and `U(K,i) = 1 + 𝓂[K]^i` for `i ≥ 1`: Tau Ceti's
`TauCeti.unitFiltration`. -/
noncomputable abbrev unitFiltration (i : ℕ) : Subgroup Kˣ :=
  TauCeti.unitFiltration K i

/-- Membership at depth `0`: Tau Ceti's `TauCeti.mem_unitFiltration_zero`. -/
theorem mem_unitFiltration_zero (x : Kˣ) :
    x ∈ unitFiltration K 0 ↔ valuation K (x : K) = 1 :=
  TauCeti.mem_unitFiltration_zero x

/-- Membership at positive depth, as a congruence: Tau Ceti's
`TauCeti.mem_unitFiltration_succ_congr`. -/
theorem mem_unitFiltration_succ_congr (i : ℕ) (u : (↥𝒪[K])ˣ) :
    Units.map (Subring.subtype 𝒪[K]).toMonoidHom u ∈ unitFiltration K (i + 1) ↔
      (u : ↥𝒪[K]) - 1 ∈ 𝓂[K] ^ (i + 1) :=
  TauCeti.mem_unitFiltration_succ_congr i u

/-- Membership at positive depth, against a uniformizer: Tau Ceti's
`TauCeti.mem_unitFiltration_succ_valuation`. -/
theorem mem_unitFiltration_succ_valuation (i : ℕ) (x : Kˣ) (π : 𝒪[K]) (hπ : Irreducible π) :
    x ∈ unitFiltration K (i + 1) ↔
      valuation K ((x : K) - 1) ≤ valuation K ((π : K) ^ (i + 1)) :=
  TauCeti.mem_unitFiltration_succ_valuation i x π hπ

/-- The unit filtration is decreasing: Tau Ceti's `TauCeti.unitFiltration_antitone`. -/
theorem unitFiltration_antitone : Antitone (unitFiltration K) :=
  TauCeti.unitFiltration_antitone

/-- The unit filtration separates points: Tau Ceti's `TauCeti.iInf_unitFiltration`. -/
theorem iInf_unitFiltration : ⨅ i, unitFiltration K i = ⊥ :=
  TauCeti.iInf_unitFiltration

/-- The graded piece `U(K,i)/U(K,i+1)`: Tau Ceti's `TauCeti.UnitFiltrationGraded`. -/
abbrev UnitFiltrationGraded (i : ℕ) : Type u :=
  TauCeti.UnitFiltrationGraded K i

/-- The Teichmüller section `𝓀[K]ˣ →* 𝒪[K]ˣ`: Tau Ceti's `TauCeti.teichmuller 𝒪[K]`. -/
noncomputable abbrev teichmuller : (𝓀[K])ˣ →* (↥𝒪[K])ˣ :=
  TauCeti.teichmuller 𝒪[K]

/-- The Teichmüller map is a section of reduction: Tau Ceti's
`TauCeti.unitsMap_residue_teichmuller`. -/
theorem teichmuller_section (x : (𝓀[K])ˣ) :
    Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (teichmuller K x) = x :=
  TauCeti.unitsMap_residue_teichmuller 𝒪[K] x

/-- The deep-unit exponential `𝓂[K]^i ≃ U(K,i)` for `e(K/ℚ_p) < (p − 1) i`: the inverse of Tau
Ceti's logarithm `TauCeti.deepUnitExpLogEquiv`. -/
noncomputable def deepUnitExpLogEquiv (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Multiplicative ↥(𝓂[K] ^ i) ≃* unitFiltration K i :=
  (TauCeti.deepUnitExpLogEquiv K hi).symm.toMulEquiv

/-- `#(Kˣ/(Kˣ)^n) = n · #μ_n(K)` when `n` is a unit of `𝒪[K]`: Tau Ceti's
`TauCeti.card_powerClasses_of_isUnit`. -/
theorem card_powerClasses_of_isUnit (n : ℕ) (_hn : n ≠ 0) (hn' : IsUnit (n : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K) :=
  TauCeti.card_powerClasses_of_isUnit hn'

/-- `#(Kˣ/(Kˣ)^n) = n · #μ_n(K) · q ^ v_K(n)` for `K/ℚ_p` finite: Tau Ceti's
`TauCeti.card_powerClasses`. -/
theorem card_powerClasses_mixed (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) (hnK : (n : K) ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K)
        * Nat.card 𝓀[K] ^ natCastValuation K n hnK :=
  TauCeti.card_powerClasses hnK

/-- The `n`-th powers are open in `Kˣ` for `K/ℚ_p` finite and `n ≠ 0`: Tau Ceti's
`TauCeti.isOpen_range_powMonoidHom`, since `n ≠ 0` in a field of characteristic zero. -/
theorem isOpen_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[p] K).injective
  TauCeti.isOpen_range_powMonoidHom (Nat.cast_ne_zero.mpr _hn)

/-- `#(Kˣ/(Kˣ)²) = 4` away from residue characteristic `2`: Tau Ceti's
`TauCeti.card_squareClasses_of_isUnit`. -/
theorem card_squareClasses_of_isUnit (h2 : IsUnit (2 : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range) = 4 :=
  TauCeti.card_squareClasses_of_isUnit h2

/-- `#(Kˣ/(Kˣ)²) = 4 · q ^ e(K/ℚ_2)` for `K/ℚ_2` finite: Tau Ceti's `TauCeti.card_squareClasses`,
read through `absoluteRamificationIndex_eq_natCastValuation`. -/
theorem card_squareClasses_dyadic [Algebra ℚ_[2] K] [ValuativeExtension ℚ_[2] K]
    [Module.Finite ℚ_[2] K] :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range)
      = 4 * Nat.card 𝓀[K] ^ absoluteRamificationIndex K 2 := by
  have : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[2] K).injective
  have h2 : ((2 : ℕ) : K) ≠ 0 := Nat.cast_ne_zero.mpr two_ne_zero
  rw [absoluteRamificationIndex_eq_natCastValuation K 2 h2]
  exact TauCeti.card_squareClasses (K := K) (by exact_mod_cast h2)

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
/-- Mathlib's `Subgroup.square` is the range of the squaring map: Tau Ceti's
`TauCeti.square_eq_range_powMonoidHom`. -/
theorem square_eq_range_powMonoidHom :
    Subgroup.square Kˣ = (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  TauCeti.square_eq_range_powMonoidHom

/-- The local square theorem `U(K, 2e + 1) ⊆ (Kˣ)²` for `K/ℚ_2` finite: Tau Ceti's
`TauCeti.unitFiltration_le_range_powMonoidHom_two`, read through
`TauCeti.absoluteRamificationIndex_eq_natCastValuation`. -/
theorem unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    unitFiltration K (2 * absoluteRamificationIndex K 2 + 1)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range := by
  rw [absoluteRamificationIndex, TauCeti.absoluteRamificationIndex_eq_natCastValuation K 2]
  exact TauCeti.unitFiltration_le_range_powMonoidHom_two _

/-- The depth `2e + 1` of the local square theorem is sharp: Tau Ceti's
`TauCeti.not_unitFiltration_le_range_powMonoidHom_two`. -/
theorem not_unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    ¬ unitFiltration K (2 * absoluteRamificationIndex K 2)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range := by
  rw [absoluteRamificationIndex, TauCeti.absoluteRamificationIndex_eq_natCastValuation K 2]
  exact TauCeti.not_unitFiltration_le_range_powMonoidHom_two _

/-! ### Unramified extensions and norms -/

/-- The arithmetic Frobenius of a finite unramified Galois extension: Tau Ceti's
`TauCeti.frobeniusAlgEquiv`, whose class `TauCeti.IsUnramified K L` is supplied from `e(L/K) = 1`
by `TauCeti.isUnramified_iff_ramificationIndex_eq_one`. -/
noncomputable abbrev frobeniusAlgEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] (h : ramificationIndex K L = 1) : L ≃ₐ[K] L :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.frobeniusAlgEquiv (K := K) (L := L)

/-- The norm group `N_{L/K}(Lˣ)`: Tau Ceti's `TauCeti.normGroup`. -/
noncomputable abbrev normGroup [Algebra K L] [Module.Finite K L] : Subgroup Kˣ :=
  TauCeti.normGroup K L

/-- Unramified norms of units, `N(𝒪[L]ˣ) = 𝒪[K]ˣ`: Tau Ceti's
`TauCeti.map_normUnits_unitFiltration` at depth `0`, with `TauCeti.IsUnramified K L` supplied as for
`frobeniusAlgEquiv`. -/
theorem map_norm_unitFiltration_zero [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (h : ramificationIndex K L = 1) :
    Subgroup.map (TauCeti.Algebra.normUnits K : Lˣ →* Kˣ) (unitFiltration L 0) =
      unitFiltration K 0 :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.map_normUnits_unitFiltration K L 0

/-- For unramified `L/K`, `x` is a norm exactly when `f(L/K) ∣ v_K(x)`: Tau Ceti's
`TauCeti.mem_normGroup_iff_dvd_normalizedValuation`. -/
theorem mem_normGroup_iff_dvd_normalizedValuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (h : ramificationIndex K L = 1) (x : Kˣ) :
    x ∈ normGroup K L ↔
      (inertiaDegree K L : ℤ) ∣ Multiplicative.toAdd (normalizedValuation K x) :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.mem_normGroup_iff_dvd_normalizedValuation

/-! ### Ramified extensions, the different and the discriminant -/

/-- The lower ramification groups `G_i`, `i : ℤ`, of a finite Galois extension: Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroup`. -/
noncomputable abbrev lowerRamificationGroup [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) : Subgroup (L ≃ₐ[K] L) :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i

/-- Tame ramification, `p ∤ e(L/K)`: Tau Ceti's `TauCeti.IsTamelyRamified`. -/
abbrev IsTamelyRamified [Algebra K L] : Prop :=
  TauCeti.IsTamelyRamified K L

/-- Wild ramification, `p ∣ e(L/K)`: Tau Ceti's `TauCeti.IsWildlyRamified`. -/
abbrev IsWildlyRamified [Algebra K L] : Prop :=
  TauCeti.IsWildlyRamified K L

/-- Local monogenicity, `𝒪[L] = 𝒪[K][x]`: Tau Ceti's `TauCeti.exists_integerRing_adjoin_eq_top`. -/
theorem exists_integerRing_adjoin_eq_top [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] :
    ∃ x : 𝒪[L], Algebra.adjoin 𝒪[K] {x} = ⊤ :=
  TauCeti.exists_integerRing_adjoin_eq_top K L

/-- Total ramification is generation of `𝒪[L]` by a root of an Eisenstein polynomial: Tau Ceti's
`TauCeti.isTotallyRamified_iff_exists_eisenstein_integral_generator`. -/
theorem isTotallyRamified_iff_exists_eisenstein_generator
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    IsTotallyRamified K L ↔
      ∃ (f : Polynomial 𝒪[K]) (ξ : 𝒪[L]),
        f.IsEisensteinAt 𝓂[K] ∧
          (f.map (algebraMap 𝒪[K] 𝒪[L])).IsRoot ξ ∧
            Algebra.adjoin 𝒪[K] {ξ} = ⊤ :=
  TauCeti.isTotallyRamified_iff_exists_eisenstein_integral_generator K L

/-- The valuation of a combination of powers of an Eisenstein generator is the minimum of the
values of its terms: Tau Ceti's `TauCeti.addVal_sum_eisenstein_powerBasis`, whose generation
hypothesis `K⟮ξ⟯ = ⊤` follows from `𝒪[K][ξ] = 𝒪[L]`. -/
theorem addVal_sum_eisenstein_powerBasis [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L]
    (f : Polynomial 𝒪[K]) (hf : f.IsEisensteinAt 𝓂[K])
    (ξ : 𝒪[L]) (hroot : (f.map (algebraMap 𝒪[K] 𝒪[L])).IsRoot ξ)
    (hgen : Algebra.adjoin 𝒪[K] {ξ} = ⊤) (c : Fin f.natDegree → 𝒪[K]) :
    IsDiscreteValuationRing.addVal 𝒪[L]
        (∑ i, algebraMap 𝒪[K] 𝒪[L] (c i) * ξ ^ (i : ℕ)) =
      ⨅ i, ramificationIndex K L • IsDiscreteValuationRing.addVal 𝒪[K] (c i) + (i : ℕ) :=
  TauCeti.addVal_sum_eisenstein_powerBasis f hf ξ hroot
    (by simpa [Algebra.algebraMap_ofSubsemiring_apply] using
      TauCeti.IntermediateField.adjoin_eq_top_of_algebra_adjoin_eq_top (K := K) (L := L) hgen) c

/-- The local different exponent `d(L/K)`: Tau Ceti's `TauCeti.differentExponent`. -/
noncomputable abbrev differentExponent [Algebra K L] [ValuativeExtension K L] : ℕ :=
  TauCeti.differentExponent K L

/-- The local discriminant ideal: Tau Ceti's `TauCeti.discriminantIdeal`. -/
noncomputable abbrev localDiscriminantIdeal [Algebra K L] [ValuativeExtension K L] :
    Ideal 𝒪[K] :=
  TauCeti.discriminantIdeal K L

/-- The local discriminant exponent `δ(L/K)`: Tau Ceti's `TauCeti.discriminantExponent`. -/
noncomputable abbrev discriminantExponent [Algebra K L] [ValuativeExtension K L]
    [Algebra.IsSeparable K L] : ℕ :=
  TauCeti.discriminantExponent K L

/-- `δ(L/K) = f(L/K) · d(L/K)`: Tau Ceti's
`TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`. -/
theorem discriminantExponent_eq_inertiaDegree_mul_differentExponent
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    discriminantExponent K L = inertiaDegree K L * differentExponent K L :=
  TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent K L

/-- The different exponent is invariant under `K`-isomorphism: Tau Ceti's
`TauCeti.differentExponent_eq_of_algEquiv`. -/
theorem differentExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : differentExponent K L = differentExponent K M :=
  TauCeti.differentExponent_eq_of_algEquiv K L M e

/-- The discriminant exponent is invariant under `K`-isomorphism: Tau Ceti's
`TauCeti.discriminantExponent_eq_of_algEquiv`. -/
theorem discriminantExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : discriminantExponent K L = discriminantExponent K M :=
  TauCeti.discriminantExponent_eq_of_algEquiv K L M e

/-- `d(L/K) = e(L/K) − 1` exactly in the tame case: Tau Ceti's
`TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`. -/
theorem differentExponent_eq_ramificationIndex_sub_one_iff [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    differentExponent K L = ramificationIndex K L - 1 ↔ IsTamelyRamified K L :=
  TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff K L

/-- The wild bounds `e ≤ d(L/K) ≤ e − 1 + v_L(e)`: Tau Ceti's
`TauCeti.differentExponent_bounds_of_wild`. -/
theorem differentExponent_bounds_of_wild [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] (hwild : IsWildlyRamified K L)
    (he : (ramificationIndex K L : L) ≠ 0) :
    ramificationIndex K L ≤ differentExponent K L ∧
      differentExponent K L ≤ ramificationIndex K L - 1 +
        natCastValuation L (ramificationIndex K L) he :=
  TauCeti.differentExponent_bounds_of_wild hwild he

/-! ### Inertia, wild inertia and the tame quotient -/

/-- The maximal unramified extension `K^ur` inside `AlgebraicClosure K`: Tau Ceti's
`TauCeti.maximalUnramifiedExtension`. -/
noncomputable abbrev maximalUnramified : IntermediateField K (AlgebraicClosure K) :=
  TauCeti.maximalUnramifiedExtension K (AlgebraicClosure K)

/-- Inertia `I_K = Gal(K^al/K^ur)`: Tau Ceti's `TauCeti.inertiaSubgroup`. -/
noncomputable abbrev inertia : Subgroup (Field.absoluteGaloisGroup K) :=
  TauCeti.inertiaSubgroup K

/-- Arithmetic Frobenius lifts: Tau Ceti's `TauCeti.IsArithFrobeniusLift`. Protected, so that a
consumer opening both `TauCeti` and this namespace reads the short name as Tau Ceti's. -/
protected abbrev IsArithFrobeniusLift (σ : Field.absoluteGaloisGroup K) : Prop :=
  TauCeti.IsArithFrobeniusLift K σ

/-- Arithmetic Frobenius lifts exist: Tau Ceti's `TauCeti.exists_isArithFrobeniusLift`. -/
theorem exists_isArithFrobeniusLift :
    ∃ σ : Field.absoluteGaloisGroup K, TauCeti.IsArithFrobeniusLift K σ :=
  TauCeti.exists_isArithFrobeniusLift K

/-- Wild inertia `P_K = Gal(K^al/K^t)`: Tau Ceti's `TauCeti.wildInertiaSubgroup`. -/
noncomputable abbrev wildInertia : Subgroup (Field.absoluteGaloisGroup K) :=
  TauCeti.wildInertiaSubgroup K

/-- Wild inertia is normal: Tau Ceti's `TauCeti.wildInertiaSubgroup_normal`. -/
instance wildInertia_normal : (wildInertia K).Normal :=
  TauCeti.wildInertiaSubgroup_normal K

/-- Wild inertia is pro-`p` for the residue characteristic `p`: Tau Ceti's
`TauCeti.isProP_wildInertiaSubgroup`. -/
theorem wildInertia_isProP (p : ℕ) (hp : ringChar 𝓀[K] = p) :
    TauCeti.IsProP p (wildInertia K) :=
  have : CharP 𝓀[K] p := hp ▸ ringChar.charP 𝓀[K]
  TauCeti.isProP_wildInertiaSubgroup K p

/-- The tame quotient `G_K/P_K`: Tau Ceti's `TauCeti.tameQuotient`. -/
abbrev tameQuotient : Type u :=
  TauCeti.tameQuotient K

/-- Tame inertia `I_K/P_K`, the image of inertia in the tame quotient: Tau Ceti's
`TauCeti.tameInertia`. -/
noncomputable abbrev tameInertia : Subgroup (tameQuotient K) :=
  TauCeti.tameInertia K

/-- The class of `τ ∈ I_K` topologically generates tame inertia exactly when its tame character
topologically generates `Ẑ^{(p')}(1)`, because Tau Ceti's `TauCeti.tameInertiaHom` is an injective
continuous map from a compact group onto tame inertia. -/
private theorem topologicalClosure_zpowers_mk_eq_tameInertia_iff
    (τ : TauCeti.inertiaSubgroup K) :
    (Subgroup.zpowers (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K) :
        tameQuotient K)).topologicalClosure = tameInertia K ↔
      (Subgroup.zpowers (TauCeti.inertiaTameCharacter K τ)).topologicalClosure = ⊤ := by
  have hmap : ((Subgroup.zpowers (TauCeti.inertiaTameCharacter K τ)).topologicalClosure).map
      (TauCeti.tameInertiaHom K).toMonoidHom =
      (Subgroup.zpowers (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K) :
        tameQuotient K)).topologicalClosure := by
    rw [MonoidHom.map_topologicalClosure _ (TauCeti.tameInertiaHom K).continuous _
      (Subgroup.isClosed_topologicalClosure _).isCompact, MonoidHom.map_zpowers]
    simp [TauCeti.tameInertiaHom_inertiaTameCharacter, TauCeti.toTameQuotient_apply]
  have hrange : (⊤ : Subgroup _).map (TauCeti.tameInertiaHom K).toMonoidHom = tameInertia K := by
    rw [← MonoidHom.range_eq_map]
    exact TauCeti.range_tameInertiaHom K
  rw [← hmap, ← hrange]
  exact (Subgroup.map_injective (TauCeti.tameInertiaHom_injective K)).eq_iff

/-- Tame inertia is topologically generated by the class of an element of inertia: Tau Ceti's
`TauCeti.exists_topologicalClosure_zpowers_inertiaTameCharacter_eq_top`, read in the tame
quotient. -/
theorem exists_topologicalClosure_zpowers_eq_tameInertia :
    ∃ τ : Field.absoluteGaloisGroup K, τ ∈ TauCeti.inertiaSubgroup K ∧
      (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
        tameInertia K := by
  obtain ⟨τ, hτ⟩ := TauCeti.exists_topologicalClosure_zpowers_inertiaTameCharacter_eq_top K
  exact ⟨τ, τ.2, (topologicalClosure_zpowers_mk_eq_tameInertia_iff K τ).2 hτ⟩

/-- A `τ` whose class topologically generates tame inertia lies in inertia, since tame inertia is
the image of inertia and wild inertia lies in inertia (Tau Ceti's
`TauCeti.toTameQuotient_mem_tameInertia_iff`). -/
private theorem mem_inertiaSubgroup_of_topologicalClosure_zpowers_eq_tameInertia
    {τ : Field.absoluteGaloisGroup K}
    (hτ : (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
      tameInertia K) :
    τ ∈ TauCeti.inertiaSubgroup K := by
  have h : (QuotientGroup.mk τ : tameQuotient K) ∈ tameInertia K := by
    rw [← hτ]
    exact Subgroup.le_topologicalClosure _ (Subgroup.mem_zpowers _)
  rw [← TauCeti.toTameQuotient_apply] at h
  exact TauCeti.toTameQuotient_mem_tameInertia_iff.1 h

/-- The Iwasawa group `⟨σ, τ | σ τ σ⁻¹ = τ^q⟩`: Tau Ceti's `TauCeti.IwasawaGroup`. -/
abbrev IwasawaGroup : Type u :=
  TauCeti.IwasawaGroup K

/-- The marked generator `σ` of the Iwasawa group: Tau Ceti's `TauCeti.iwasawaSigma`. -/
noncomputable abbrev iwasawaSigma : IwasawaGroup K :=
  TauCeti.iwasawaSigma K

/-- The marked generator `τ` of the Iwasawa group: Tau Ceti's `TauCeti.iwasawaTau`. -/
noncomputable abbrev iwasawaTau : IwasawaGroup K :=
  TauCeti.iwasawaTau K

/-- The marked Iwasawa presentation `G_K/P_K ≃ₜ* ⟨σ, τ | σ τ σ⁻¹ = τ^q⟩` for an arithmetic
Frobenius lift `σ` and a `τ` whose class topologically generates tame inertia: Tau Ceti's
`TauCeti.tameQuotientEquiv`, whose hypotheses `τ ∈ I_K` and the generation of `Ẑ^{(p')}(1)` by the
tame character of `τ` follow from `hτ`. -/
noncomputable def tameQuotientEquiv (σ τ : Field.absoluteGaloisGroup K)
    (hσ : TauCeti.IsArithFrobeniusLift K σ)
    (hτ : (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
      tameInertia K) :
    tameQuotient K ≃ₜ* IwasawaGroup K :=
  TauCeti.tameQuotientEquiv hσ
    ⟨τ, mem_inertiaSubgroup_of_topologicalClosure_zpowers_eq_tameInertia K hτ⟩
    ((topologicalClosure_zpowers_mk_eq_tameInertia_iff K _).1 hτ)

section Marked

variable {K} {σ τ : Field.absoluteGaloisGroup K} {hσ : TauCeti.IsArithFrobeniusLift K σ}
  {hτ : (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
    tameInertia K}

/-- The marked isomorphism sends `σ` to `iwasawaSigma`: Tau Ceti's
`TauCeti.tameQuotientEquiv_toTameQuotient_frobenius`. -/
@[simp]
theorem tameQuotientEquiv_mk_frobenius :
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk σ) = iwasawaSigma K := by
  rw [← TauCeti.toTameQuotient_apply]
  exact TauCeti.tameQuotientEquiv_toTameQuotient_frobenius hσ _

/-- The marked isomorphism sends `τ` to `iwasawaTau`: Tau Ceti's
`TauCeti.tameQuotientEquiv_toTameQuotient_tameGenerator`. -/
@[simp]
theorem tameQuotientEquiv_mk_tameGenerator :
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk τ) = iwasawaTau K := by
  rw [← TauCeti.toTameQuotient_apply]
  exact TauCeti.tameQuotientEquiv_toTameQuotient_tameGenerator hσ _

end Marked

end Consumers

end TauCetiRoadmap.LocalFieldsRamification

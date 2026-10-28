import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.DeepUnits.Basic
import TauCeti.NumberTheory.LocalField.Different.Hilbert
import TauCeti.NumberTheory.LocalField.Different.Wild
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Eisenstein.PowerBasis
import TauCeti.NumberTheory.LocalField.Eisenstein.TotallyRamified
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.NumberTheory.LocalField.FiniteExtension.Tower
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.Herbrand.UpperQuotient
import TauCeti.NumberTheory.LocalField.InertiaDegree
import TauCeti.NumberTheory.LocalField.NatCastValuation
import TauCeti.NumberTheory.LocalField.Norm.AfterBreak
import TauCeti.NumberTheory.LocalField.Norm.Graded
import TauCeti.NumberTheory.LocalField.Norm.Herbrand
import TauCeti.NumberTheory.LocalField.Norm.Unramified.Basic
import TauCeti.NumberTheory.LocalField.PowerSubgroup.Basic
import TauCeti.NumberTheory.LocalField.PowerSubgroup.Open
import TauCeti.NumberTheory.LocalField.RamificationGroup
import TauCeti.NumberTheory.LocalField.RamificationIndex
import TauCeti.NumberTheory.LocalField.ResidueCorrespondence
import TauCeti.NumberTheory.LocalField.SquareClass
import TauCeti.NumberTheory.LocalField.Squares
import TauCeti.NumberTheory.LocalField.Tame.Character
import TauCeti.NumberTheory.LocalField.Tame.Geometric
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.NumberTheory.LocalField.UnitFiltration.Conjugation
import TauCeti.NumberTheory.LocalField.UnitFiltration.Map
import TauCeti.NumberTheory.LocalField.UnitFiltration.ProP
import TauCeti.NumberTheory.LocalField.UnitFiltration.RamificationGroup
import TauCeti.NumberTheory.LocalField.UnitsDecomposition
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Finite
import TauCeti.NumberTheory.LocalField.Unramified.Maximal
import TauCeti.NumberTheory.LocalField.Unramified.ZHat
import TauCeti.RingTheory.DiscreteValuationRing.Monogenic
import TauCeti.Topology.Algebra.Group.Profinite.Presentation.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Conjugacy
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# Local fields and ramification: target signatures

The normative roadmap is `README.md`. This companion file pins representative Lean-facing
signatures for the local-field and ramification layers only. Class field theory, local
reciprocity, Tate duality, and the arithmetic structure of `G_K(p)` are owned by their
supplier roadmaps and do not appear here. These signatures are suggested forms, not an exhaustive
checklist.

The abstract profinite group theory is imported from Tau Ceti's implementation of the
ProfiniteProPGroups contract: `TauCeti.IsProP`, `TauCeti.IsProPSylow` and its normal-Sylow
uniqueness theorem. Free profinite groups, profinite presentations and the profinite integers
also use Tau Ceti's carriers. The arithmetic statements below apply those APIs directly.
The maximal pro-`p` quotient and its Demushkin presentation belong to LocalGaloisGroups.

The maximal unramified extension, inertia and wild inertia, arithmetic Frobenius lifts,
deep-unit logarithm/exponential equivalence, graded norm maps and marked tame presentation
are imported from Tau Ceti. The maximal unramified, inertia, Frobenius-lift, tame-character
and Iwasawa APIs use the native declarations directly. The marked presentation adapter
`markedTameQuotientEquiv` makes the base field and the two marked elements explicit.
Product coordinates on the tame Tate module require choices; the Tate-module-valued tame character itself is choice-independent.

The local-field objects that the pinned Tau Ceti implements are **consumed, not restated**: the
normalized valuation and the valuation of a natural-number cast (`TauCeti.normalizedValuation`,
`TauCeti.natCastValuation`), the ramification index, the residue degree, the total, tame and wild
predicates and the absolute ramification index (`TauCeti.ramificationIndex`,
`TauCeti.inertiaDegree`, `TauCeti.IsTotallyRamified`, `TauCeti.IsTamelyRamified`, `TauCeti.IsWildlyRamified`,
`TauCeti.absoluteRamificationIndex`), the unit filtration and its graded pieces
(`TauCeti.unitFiltration`, `TauCeti.UnitFiltrationGraded`), the Teichmüller lift
(`TauCeti.teichmuller`), the spectral-norm construction of the local-field structure on a finite
extension and on a finite intermediate field (`TauCeti.finiteExtensionValuativeRel`,
`TauCeti.finiteIntermediateFieldValuativeRel` and their companions), the integer-ring and
residue-field algebra structures (`TauCeti.integerRingAlgebra`, `TauCeti.residueFieldAlgebra`), the
Frobenius of an unramified extension and the norm group (`TauCeti.frobeniusAlgEquiv`,
`TauCeti.normGroup`), the lower ramification groups, the Herbrand function, its inverse and the
upper ramification groups (`TauCeti.LocalFieldsRamification.lowerRamificationGroup`,
`herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `upperRamificationGroup`), and the different
exponent, the discriminant ideal and the discriminant exponent (`TauCeti.differentExponent`,
`TauCeti.discriminantIdeal`, `TauCeti.discriminantExponent`). Native exports preserve the
finite-extension carriers without introducing declarations. The remaining roadmap theorems retain explicit
argument lists. The five adapters sharing a native short name are protected, so opening both
namespaces exposes the native declaration; qualified references retain the adapted signatures.
The Frobenius adapter turns a ramification-index equality into the native unramifiedness instance. Implemented milestones use the native theorems, and the remaining
milestones are stated about these objects.

Wild inertia is Tau Ceti's canonical subgroup: it consists of elements of `G_K` whose restriction to
every finite Galois subextension lies in the first lower ramification group of that subextension,
whose local-field structure is built from `K`'s. The maximal tamely ramified extension, the tame
quotient and the marked Iwasawa presentation are built from wild inertia, so each of them depends
on the valuation and topology of `K` through its definition.

Layers 3a and 4a of `README.md` extend the ramification package to complete discretely valued
fields whose residue field need not be finite. Tau Ceti's Herbrand function, its inverse, `psiNat`
and the upper numbering assume `IsNonarchimedeanLocalField` on both fields, and the pinned
revisions have neither a Herbrand function on the local-ring filtration
`TauCeti.IsLocalRing.ramificationGroupReal` nor an absolute upper filtration. The general Herbrand
functions and upper numbering, the absolute upper filtration, the open-subgroup identity and the
completed maximal unramified comparison are therefore `README.md` targets, because their carriers
are missing. The named README contract `perfectResidueHerbrand` comprises §§3a.1–3a.3 and
§§4a.1–4a.3. Integral monogenicity, the lower-index computation and Hilbert's different formula
are stated below on existing DVR carriers. Full Hasse–Arf needs no generalized upper filtration
in Serre's lower-numbering form, and is stated as `hasseArf_dvd_sum_card_ramificationGroup`.
-/

namespace TauCetiRoadmap.LocalFieldsRamification

open ValuativeRel
open TauCeti

/- Native exports preserve qualified references without introducing new declarations. -/
export TauCeti (
  integerRingAlgebra residueFieldAlgebra natCastValuation_eq_zero_iff
  unitFiltration_le_range_powMonoidHom_two
  finiteIntermediateField_valuativeExtension finiteIntermediateField_isNonarchimedeanLocalField
  normalizedValuation normalizedNormedField normalizedNormedFieldTopology
  finiteExtensionNormedField finiteExtensionNormedFieldTopology finiteExtensionValuativeRel
  finiteIntermediateFieldNormedField finiteIntermediateFieldValuativeRel finiteIntermediateFieldTopology
  ramificationIndex inertiaDegree natCastValuation
  IsTotallyRamified isTotallyRamified_iff_inertiaDegree_eq_one
  absoluteRamificationIndex unitFiltration normGroup
  UnitFiltrationGraded normGradedMap IsTamelyRamified
  IsWildlyRamified differentExponent discriminantExponent)
export TauCeti.LocalFieldsRamification (
  RamificationIndexDomain
  lowerRamificationGroup lowerRamificationGroupReal herbrandOrderIso
  herbrand inverseHerbrand upperRamificationGroup
  psiNat UpperJump)
open scoped WithZero

universe u v w

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type v) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ## Layer 0: local fields and their finite extensions -/

/-- **Layer 0.** `v_K^×(x) = 1` says the additive value is `0`, that is, `x` is a unit of
`𝒪[K]`. This is the equation reserved for the kernel condition; the uniformizer equation is
the next theorem, and the two must not be conflated. This adapter makes the base field
explicit in Tau Ceti's
`TauCeti.normalizedValuation_eq_one_iff`. -/
protected theorem normalizedValuation_eq_one_iff (x : Kˣ) :
    normalizedValuation K x = 1 ↔ valuation K (x : K) = 1 :=
  TauCeti.normalizedValuation_eq_one_iff x

/-- **Layer 0.** For a uniformizer the Lean-facing equation is
`v_K^×(π) = Multiplicative.ofAdd 1`, equivalently `v_K(π) = 1` after decoding with
`Multiplicative.toAdd`. Tau Ceti's `TauCeti.normalizedValuation_irreducible`; the nonvanishing
proof is an argument here so that the unit is written `Units.mk0 (π : K) hπ0` by the caller. -/
protected theorem normalizedValuation_irreducible (π : 𝒪[K]) (hπ : Irreducible π) (hπ0 : (π : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (π : K) hπ0) = Multiplicative.ofAdd 1 :=
  TauCeti.normalizedValuation_irreducible hπ

omit [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- **Layer 0.II, corollary: Galois invariance of the valuation.** Every `K`-algebra
automorphism of a finite extension `L/K` of local fields preserves the canonical valuation.
This is what makes `Gal(L/K)` act on `𝒪[L]`, `𝓂[L]`, and the residue field, and Layers 2
and 3 use it constantly. Tau Ceti's `AlgEquiv.valuation_eq`. -/
theorem valuation_algEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (σ : L ≃ₐ[K] L) (x : L) :
    valuation L (σ x) = valuation L x :=
  AlgEquiv.valuation_eq σ x

omit [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- **Layer 0.III, torsion-freeness of the integer-ring extension.** This is the ring-level
hypothesis used by Mathlib's `differentIdeal`; it holds for every compatible extension, and is
found by instance search. -/
theorem integerRingTorsionFree [Algebra K L] [ValuativeExtension K L] :
    Module.IsTorsionFree 𝒪[K] 𝒪[L] :=
  inferInstance

/-- **Layer 0, the characteristic property of `f`.** Tau Ceti's `TauCeti.natCard_residueField`. -/
theorem card_residueField [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ inertiaDegree K L :=
  TauCeti.natCard_residueField K L

/-! ## Layer 1: units, the filtration, and the multiplicative group -/

/-- **Layer 1, the Teichmüller section**: the canonical multiplicative section of reduction,
characterized by `teichmuller_section` below together with the uniqueness statement that it is
the only multiplicative section (`TauCeti.eq_teichmuller`) and that its image is the
`(q−1)`-torsion of `𝒪[K]ˣ`, that is `μ_{q−1}(K)` (`TauCeti.range_teichmuller`). Tau Ceti's
`TauCeti.teichmuller 𝒪[K]` (`TauCeti/RingTheory/Henselian/Teichmuller.lean`), the lift of a
Henselian local ring with finite residue field, consumed by reducible alias; `𝒪[K]` is Henselian by
Tau Ceti's instance `TauCeti.henselianLocalRing_integer`, which is where the topology and the
local-field hypothesis of `K` enter. Its zero-preserving extension `𝓀[K] →*₀ 𝒪[K]` is Tau Ceti's
`TauCeti.teichmullerLift`, which agrees with it on units (`TauCeti.coe_teichmuller_apply`). -/
noncomputable abbrev localTeichmuller : (𝓀[K])ˣ →* (↥𝒪[K])ˣ :=
  TauCeti.teichmuller 𝒪[K]

/-- **Layer 1.** The Teichmüller map is a section of reduction. Tau Ceti's
`TauCeti.unitsMap_residue_teichmuller`. -/
theorem teichmuller_section (x : (𝓀[K])ˣ) :
    Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (localTeichmuller K x) = x :=
  TauCeti.unitsMap_residue_teichmuller 𝒪[K] x

/-- **Layer 1, the local exponential.** Mathlib's evaluated exponential series on the
local field's given topology, used by Tau Ceti's deep-unit API. -/
noncomputable abbrev localExponential (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] : K → K :=
  NormedSpace.exp

/-- **Layer 1, the local logarithm.** Mathlib's evaluated logarithm series on the
local field's given topology, used by Tau Ceti's deep-unit API. -/
noncomputable abbrev localLogarithm (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] : K → K :=
  NormedSpace.log

/-- **Layer 1, the deep-unit exponential as an isomorphism of topological groups.**
This adapter is the inverse of `TauCeti.deepUnitExpLogEquiv`; the strict depth inequality
excludes torsion. -/
noncomputable abbrev deepUnitExponentialEquiv (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Multiplicative ↥(𝓂[K] ^ i) ≃ₜ* unitFiltration K i :=
  (TauCeti.deepUnitExpLogEquiv K hi).symm

/-- **Layer 1, evaluation of the deep-unit exponential.** -/
theorem coe_deepUnitExponentialEquiv_apply (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (x : Multiplicative ↥(𝓂[K] ^ i)) :
    ((deepUnitExponentialEquiv K p i hi x : Kˣ) : K) =
      localExponential K ((x.toAdd : 𝒪[K]) : K) :=
  TauCeti.coe_deepUnitExpLogEquiv_symm_apply hi x

/-- **Layer 1, evaluation of the inverse as the deep-unit logarithm.** -/
theorem coe_deepUnitExponentialEquiv_symm_apply (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (u : unitFiltration K i) :
    (((deepUnitExponentialEquiv K p i hi).symm u).toAdd : K) =
      localLogarithm K ((u : Kˣ) : K) :=
  TauCeti.coe_deepUnitExpLogEquiv_apply hi u

/-- **Layer 1, the logarithm inverts the exponential on the strict deep domain.** -/
theorem localLogarithm_localExponential (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (x : ↥(𝓂[K] ^ i)) :
    localLogarithm K (localExponential K (((x : 𝒪[K]) : K))) = ((x : 𝒪[K]) : K) :=
  TauCeti.log_exp_of_mem_maximalIdeal_pow hi x

/-- **Layer 1, the exponential inverts the logarithm on the strict deep domain.** -/
theorem localExponential_localLogarithm (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (u : unitFiltration K i) :
    localExponential K (localLogarithm K (((u : Kˣ) : K))) = ((u : Kˣ) : K) :=
  TauCeti.exp_log_of_mem_unitFiltration hi u.2

/-- **Layer 1, continuity of exponential on the strict deep domain.** -/
theorem continuous_localExponential_deep (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Continuous (fun x : ↥(𝓂[K] ^ i) => localExponential K (((x : 𝒪[K]) : K))) :=
  TauCeti.continuous_exp_maximalIdeal_pow hi

/-- **Layer 1, continuity of logarithm on the strict deep-unit domain.** -/
theorem continuous_localLogarithm_deep (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Continuous (fun u : unitFiltration K i => localLogarithm K (((u : Kˣ) : K))) :=
  TauCeti.continuous_log_unitFiltration p (by nlinarith : 1 ≤ i)

/-- **Layer 1, power classes in the mixed-characteristic regime.** For `K/ℚ_p` finite the same
formula holds for every `n ≠ 0`, including `p ∣ n`, with the extra factor
`q ^ natCastValuation K n = ‖n‖_K⁻¹`. The nonzero cast is explicit rather than hidden behind a
junk-valued definition. ⚠ This must not be generalized to equal characteristic: at
`K = 𝔽_q((t))` and `n = p` the left-hand side is infinite. -/
theorem card_powerClasses_mixed (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) (hnK : (n : K) ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K)
        * Nat.card 𝓀[K] ^ natCastValuation K n hnK :=
  TauCeti.card_powerClasses hnK

/-- **Layer 1, openness of the power subgroup away from the residue characteristic.** Openness
comes from the explicit deep subgroup contained in the range
(`TauCeti.unitFiltration_one_le_range_powMonoidHom_of_isUnit`); no finite-index implication is
used. Tau Ceti's `TauCeti.isOpen_range_powMonoidHom`, which needs only `(n : K) ≠ 0`. -/
theorem isOpen_range_powMonoidHom_of_isUnit (n : ℕ) (_hn : n ≠ 0)
    (hn' : IsUnit (n : ↥𝒪[K])) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  TauCeti.isOpen_range_powMonoidHom fun h ↦ hn'.ne_zero (Subtype.ext (by simpa using h))

/-- **Layer 1, openness of the power subgroup in mixed characteristic.** This adapter to
`TauCeti.isOpen_range_powMonoidHom` supplies the nonzero-cast proof from the explicit
mixed-characteristic hypotheses and `n ≠ 0`. -/
protected theorem isOpen_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[p] K).injective
  TauCeti.isOpen_range_powMonoidHom (Nat.cast_ne_zero.mpr _hn)

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
/-- **Layer 1, the two spellings of the square classes.** Mathlib's `Subgroup.square Kˣ` is the
subgroup of squares, and the counts above are stated at the range of `powMonoidHom`. This is the
identification at `n = 2`, and it is what lets a consumer read the count of this layer, and
`ProfiniteCohomology.kummerIso`, on `Subgroup.square Kˣ`. Tau Ceti's
`TauCeti.square_eq_range_powMonoidHom`, for any commutative group. -/
protected theorem square_eq_range_powMonoidHom :
    Subgroup.square Kˣ = (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  TauCeti.square_eq_range_powMonoidHom

/-! ### The dyadic statements, indexed uniformly

The mixed-characteristic dyadic count uses `absoluteRamificationIndex K 2`, whose instance
requires a finite compatible extension of `ℚ_[2]`. In odd residue characteristic the intended
reading of `e = v_K(2)` is `0`, which the natural-cast valuation expresses in both characteristics. The uniform forms below are indexed by `natCastValuation K 2`,
which is defined for every nonarchimedean local field in which `2` is nonzero and vanishes exactly
when the residue characteristic is odd. The two local square theorems among them are Tau Ceti's
(`TauCeti/NumberTheory/LocalField/Squares.lean`), which also proves the two-sided form
`TauCeti.unitFiltration_le_range_powMonoidHom_two_iff`. In mixed characteristic `2` the two
indexings agree, by `absoluteRamificationIndex_eq_natCastValuation`, so these are generalizations
rather than a second convention. -/

/-- **Layer 1, the local square theorem, uniformly indexed** (O'Meara 63:1). Tau Ceti's
`TauCeti.unitFiltration_le_range_powMonoidHom_two`. -/
theorem unitFiltration_natCastValuation_le_range_powMonoidHom_two
    (h2 : ((2 : ℕ) : K) ≠ 0) :
    unitFiltration K (2 * natCastValuation K 2 h2 + 1)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  TauCeti.unitFiltration_le_range_powMonoidHom_two h2

/-- **Layer 1, sharpness, uniformly indexed.** ⚠ In odd residue characteristic the exponent is
`0`, and the statement says that `U(K,0) = 𝒪[K]ˣ` is not contained in the squares — which is
true, and is the odd-residue-characteristic content that the `ℚ_2`-indexed version cannot
express at all. Tau Ceti's `TauCeti.not_unitFiltration_le_range_powMonoidHom_two`. -/
theorem not_unitFiltration_natCastValuation_le_range_powMonoidHom_two
    (h2 : ((2 : ℕ) : K) ≠ 0) :
    ¬ unitFiltration K (2 * natCastValuation K 2 h2)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  TauCeti.not_unitFiltration_le_range_powMonoidHom_two h2

/-- **Layer 1, the square-class count, uniformly indexed**: `#(Kˣ/(Kˣ)²) = 4 · q^{v_K(2)}`.
At odd residue characteristic the exponent is `0` and this is the familiar `4`; over a finite
extension of `ℚ_2` of degree `N` it is `2^{N+2}`. One statement, both branches. -/
theorem card_squareClasses_natCastValuation (h2 : ((2 : ℕ) : K) ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range)
      = 4 * Nat.card 𝓀[K] ^ natCastValuation K 2 h2 :=
  TauCeti.card_squareClasses h2

/-- **Layer 1, worked example: the dyadic deep-square bound.** Units of `ℤ_2` congruent to
`1 mod 8` are squares (`U(K, 2e+1) ⊆ (Kˣ)²` at `K = ℚ_2`, `e = 1`), and `1 + 4ℤ_2` are not, so
the threshold is sharp there. -/
theorem padicUnit_square_of_eight_dvd_sub_one (u : ℤ_[2]ˣ) (_hu : (8 : ℤ_[2]) ∣ ((u : ℤ_[2]) - 1)) : IsSquare u :=
  sorry

/-! ## Layer 2: unramified extensions and Frobenius -/

/-- **Layer 2, the Frobenius element** of a finite unramified extension: the preimage of the
arithmetic Frobenius `x ↦ x^q` of the residue extension under the residue correspondence
`Gal(L/K) ≃* Gal(𝓀[L]/𝓀[K])`. It generates `Gal(L/K)`, which is cyclic of order `f`. The
unramifiedness hypothesis is `ramificationIndex K L = 1`; separability of the residue extension,
which the general definition of an unramified extension of valued fields also carries, is
automatic here because `𝓀[K]` is finite. `IsGalois K L` is likewise automatic for an unramified
`L/K`, which is generated over `K` by the `(q^f − 1)`-st roots of unity and so is the splitting
field of a separable polynomial; it is carried because the residue correspondence is stated for
a Galois extension. ⚠ Arithmetic, never geometric: the inverse `(frobeniusAlgEquiv K L h)⁻¹` is
the geometric Frobenius, and no statement of this roadmap uses the unqualified word for it.
Tau Ceti's `TauCeti.frobeniusAlgEquiv`
(`TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean`), which asks for the class
`TauCeti.IsUnramified K L`; this adapter supplies it from `h` by
`TauCeti.isUnramified_iff_ramificationIndex_eq_one`, and the class is a proposition, so the value
does not depend on the proof. Tau Ceti also proves that it generates `Gal(L/K)` and has order `f`
(`TauCeti.zpowers_frobeniusAlgEquiv`, `TauCeti.orderOf_frobeniusAlgEquiv`), that it is the only
automorphism with the congruence below
(`TauCeti.eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one`), and that it restricts to Frobenius
in a tower (`TauCeti.frobeniusAlgEquiv_restrictNormal`). -/
protected noncomputable abbrev frobeniusAlgEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] (h : ramificationIndex K L = 1) : L ≃ₐ[K] L :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.frobeniusAlgEquiv (K := K) (L := L)

/-- **Layer 2, norms of units from an unramified extension.** `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`, written
on the depth-zero step of the unit filtration, which `mem_unitFiltration_zero` identifies with
the units of the valuation ring. In a ramified extension surjectivity on units can fail:
for `ℚ_2(√2)/ℚ_2` the image has index `2` in `ℤ_2ˣ`. The ramified cubic
`ℚ_2(∛2)/ℚ_2` has surjective unit norm, so no universal properness is asserted. Tau Ceti's `TauCeti.map_normUnits_unitFiltration` at `i = 0`
(`TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean`), under the same adaptation of `h` as
`frobeniusAlgEquiv`. -/
theorem map_norm_unitFiltration_zero [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (h : ramificationIndex K L = 1) :
    Subgroup.map (TauCeti.Algebra.normUnits K : Lˣ →* Kˣ) (unitFiltration L 0) =
      unitFiltration K 0 :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.map_normUnits_unitFiltration K L 0

/-- **Layer 2, worked example: the unramified quadratic extension of `ℚ_2`.** The adjoined set
is *all* cube roots of unity, so the intermediate field is the splitting field of `X³ − 1`
over `ℚ_2` and no primitive root is chosen; it equals `ℚ_2(√5) = ℚ_2(√−3)` and has residue
field `𝔽_4`. The general milestone is `[K(μ_{q^f−1}) : K] = f` with `Gal` isomorphic to the
Galois group of the residue extension, generated by arithmetic Frobenius. -/
theorem unramifiedQuadratic_finrank :
    Module.finrank ℚ_[2]
      (IntermediateField.adjoin ℚ_[2] {x : AlgebraicClosure ℚ_[2] | x ^ 3 = 1}) = 2 :=
  sorry

/-- **Layer 2, worked example: units of `ℚ_2` are norms from the unramified quadratic
extension** (`u = x² − 5y²` solvable over `ℤ_2`; norm surjectivity on units, Serre LF V §2,
the input to the fundamental-class layer). -/
theorem unramifiedQuadratic_unit_norm (u : ℤ_[2]ˣ) : ∃ x y : ℤ_[2], (u : ℤ_[2]) = x ^ 2 - 5 * y ^ 2 :=
  sorry

/-- **Layer 2, worked example: `2` is *not* a norm from the unramified quadratic extension**
(`N(ℚ_2(√5)ˣ) = ⟨4⟩ × ℤ_2ˣ` has index `2`; a uniformizer detects the unramified norm
group). -/
theorem two_not_norm_unramifiedQuadratic : ¬ ∃ x y : ℚ_[2], (2 : ℚ_[2]) = x ^ 2 - 5 * y ^ 2 :=
  sorry

/-! ## Layer 3: ramification, the lower filtration, and the local different -/

/-- **Layer 3, the quotient filtration attached to a normal subgroup.** The use of
`QuotientGroup.mk'` pins the direction of the map. -/
noncomputable abbrev upperRamificationGroupQuotient [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (H : Subgroup (L ≃ₐ[K] L)) [H.Normal] (u : RamificationIndexDomain) :
    Subgroup ((L ≃ₐ[K] L) ⧸ H) :=
  H.upperRamificationGroupQuotient u

/-- **Layer 3, abstract quotient compatibility.** -/
theorem upperRamificationGroup_quotient [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (H : Subgroup (L ≃ₐ[K] L)) [H.Normal] (u : RamificationIndexDomain) :
    Subgroup.map (QuotientGroup.mk' H) (upperRamificationGroup K L u) =
      upperRamificationGroupQuotient K L H u :=
  rfl

/-- **Layer 3, field-theoretic quotient compatibility through Mathlib's actual restriction
equivalence.** The fixed field and `IsGalois.normalAutEquivQuotient` are named in the type, so a
consumer cannot silently reverse the quotient map. -/
theorem upperRamificationGroup_fixedField [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (H : Subgroup (L ≃ₐ[K] L)) [H.Normal]
    [ValuativeRel (IntermediateField.fixedField H)]
    [TopologicalSpace (IntermediateField.fixedField H)]
    [IsNonarchimedeanLocalField (IntermediateField.fixedField H)]
    [ValuativeExtension K (IntermediateField.fixedField H)]
    (u : RamificationIndexDomain) :
    Subgroup.map (IsGalois.normalAutEquivQuotient H).toMonoidHom
        (upperRamificationGroupQuotient K L H u) =
      upperRamificationGroup K (IntermediateField.fixedField H) u :=
  H.upperRamificationGroup_fixedField u

/-- **Layer 3, the Herbrand-shifted norm inclusion.** -/
theorem map_norm_unitFiltration_psiNat_le [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℕ) :
    Subgroup.map (Units.map (Algebra.norm K : L →* K))
        (unitFiltration L (psiNat K L i)) ≤ unitFiltration K i :=
  TauCeti.map_normUnits_unitFiltration_psiNat_le K L i

/-- **Layer 3, the successor-depth inclusion needed for descent of the graded norm.** -/
theorem map_norm_unitFiltration_psiNat_add_one_le [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℕ) :
    Subgroup.map (Units.map (Algebra.norm K : L →* K))
        (unitFiltration L (psiNat K L i + 1)) ≤ unitFiltration K (i + 1) :=
  TauCeti.map_normUnits_unitFiltration_psiNat_add_one_le K L i

/-- **Layer 3, the failure of an unshifted norm inclusion.** In every totally ramified quadratic
extension of `ℚ_3`, the scalar `4` has depth `2`, but its norm `16` has depth `1`.
The degree and ramification-index hypotheses make this independent of a chosen field model. -/
theorem tameQuadratic_norm_counterexample [Algebra ℚ_[3] L] [ValuativeExtension ℚ_[3] L]
    [Module.Finite ℚ_[3] L] (hdeg : Module.finrank ℚ_[3] L = 2)
    (he : ramificationIndex ℚ_[3] L = 2) (x : Lˣ) (hx : (x : L) = 4) :
    x ∈ unitFiltration L 2 ∧
      TauCeti.Algebra.normUnits ℚ_[3] x ∉ unitFiltration ℚ_[3] 2 :=
  sorry

/-- **Layer 3, total ramification is equivalent to an Eisenstein generator.** The generator is
integral, is a root after mapping coefficients to `𝒪[L]`, and generates the entire integer ring.
This is arithmetic of one extension; `MassFormula` may install the intermediate-field
adapters and consume this theorem when constructing a family. -/
theorem isTotallyRamified_iff_exists_eisenstein_generator
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    IsTotallyRamified K L ↔
      ∃ (f : Polynomial 𝒪[K]) (ξ : 𝒪[L]),
        f.IsEisensteinAt 𝓂[K] ∧
          (f.map (algebraMap 𝒪[K] 𝒪[L])).IsRoot ξ ∧
            Algebra.adjoin 𝒪[K] {ξ} = ⊤ :=
  TauCeti.isTotallyRamified_iff_exists_eisenstein_integral_generator K L

/-- **Layer 3, the local discriminant ideal** `𝔩(L/K)`, the relative norm to `𝒪[K]` of the local
different (`TauCeti.discriminantIdeal_def`). It is distinct from the different ideal, which is an
ideal of `𝒪[L]`, and from the global relative discriminant package owned by Number-Field Arithmetic. Tau Ceti's
`TauCeti.discriminantIdeal` (`TauCeti/NumberTheory/LocalField/Discriminant.lean`), consumed by
reducible alias. -/
noncomputable abbrev localDiscriminantIdeal [Algebra K L] [ValuativeExtension K L] :
    Ideal 𝒪[K] :=
  TauCeti.discriminantIdeal K L

/-- **Layer 3, worked example: a totally ramified quadratic extension.** `ℚ_2(√2)/ℚ_2` has
degree `2` (Eisenstein `X² − 2`); the general milestone is the totally-ramified ↔ Eisenstein
correspondence. -/
theorem ramifiedQuadratic_finrank :
    Module.finrank ℚ_[2]
      (IntermediateField.adjoin ℚ_[2] {x : AlgebraicClosure ℚ_[2] | x ^ 2 = 2}) = 2 :=
  sorry

/-- **Layer 3, worked example: the dyadic cyclotomic tower is totally ramified.**
`[ℚ_2(μ_8) : ℚ_2] = φ(8) = 4`. Its ramification filtration `G = G_0 = G_1 ⊋ G_2 = G_3 ⊋
G_4 = 1`, the resulting Herbrand jumps, and the failure of lower-numbering quotient
compatibility that it witnesses are the README's Layer-3 acceptance computations, stated once
the filtration exists. -/
theorem dyadicCyclotomic_finrank :
    Module.finrank ℚ_[2]
      (IntermediateField.adjoin ℚ_[2] {x : AlgebraicClosure ℚ_[2] | x ^ 8 = 1}) = 4 :=
  sorry

/-! ### Layer 3: equivariance of the tame character

Stated against Tau Ceti's tame character `TauCeti.tameCharacter hϖ : G_0 →* 𝓀[L]ˣ` of a group `G`
acting on `L` and preserving `𝒪[L]`, where `G_0 = TauCeti.IsLocalRing.ramificationGroup G 𝒪[L] 0`
and `ϖ` is a uniformizer. An element of `G` acts on `𝓀[L]` by Mathlib's induced action on the
residue field (`IsLocalRing.ResidueField.residue_smul`). -/

section TameCharacter

variable {L}

/-- **Layer 3, `G`-equivariance of the tame character**: `θ_0(g σ g⁻¹) = ḡ(θ_0 σ)`, where `ḡ` is
the automorphism of `𝓀[L]` induced by `g`. The tame character does not depend on the uniformizer
(`TauCeti.tameCharacter_eq_of_irreducible`), and computing it at `g ϖ` gives the formula.
⚠ This is not the action formula `θ_i(σ τ σ⁻¹) = θ_0(σ)^i · θ_i(τ)`: there `σ ∈ G_0`, which acts
trivially on `𝓀[L]`. -/
theorem finiteTameCharacter_conj {G : Type w} [Group G] [MulSemiringAction G L]
    [IsInvariantSubring G 𝒪[L]] {ϖ : 𝒪[L]} (hϖ : Irreducible ϖ) (g σ : G)
    (hσ : σ ∈ TauCeti.IsLocalRing.ramificationGroup G 𝒪[L] (0 : ℤ)) :
    (TauCeti.tameCharacter (G := G) hϖ
        ⟨g * σ * g⁻¹, Subgroup.Normal.conj_mem inferInstance σ hσ g⟩ : 𝓀[L]) =
      g • (TauCeti.tameCharacter (G := G) hϖ ⟨σ, hσ⟩ : 𝓀[L]) :=
  by
    have hconj : MulAut.conjNormal g
        (⟨σ, hσ⟩ : TauCeti.IsLocalRing.ramificationGroup G 𝒪[L] 0) =
        ⟨g * σ * g⁻¹, Subgroup.Normal.conj_mem inferInstance σ hσ g⟩ := by
      apply Subtype.ext
      simp only [MulAut.conjNormal_apply]
    simpa only [hconj] using TauCeti.tameCharacter_conj hϖ g ⟨σ, hσ⟩

/-- **Layer 3, the finite-level form of the Frobenius twist**: when `g` acts on `𝓀[L]` as
`x ↦ x ^ q`, `θ_0(g σ g⁻¹) = θ_0(σ) ^ q`. For `G = Gal(L/K)` and `q = #𝓀[K]` the hypothesis holds
for every `g` restricting to the arithmetic Frobenius of the maximal unramified subextension, and
the conclusion is the relation `σ τ σ⁻¹ = τ ^ q` of Layer 4 read in a finite quotient. A closed
proof from `finiteTameCharacter_conj`. -/
theorem tameCharacter_conj_of_smul_eq_pow {G : Type w} [Group G] [MulSemiringAction G L]
    [IsInvariantSubring G 𝒪[L]] {ϖ : 𝒪[L]} (hϖ : Irreducible ϖ) (g σ : G)
    (hσ : σ ∈ TauCeti.IsLocalRing.ramificationGroup G 𝒪[L] (0 : ℤ)) {q : ℕ}
    (hg : ∀ x : 𝓀[L], g • x = x ^ q) :
    TauCeti.tameCharacter (G := G) hϖ
        ⟨g * σ * g⁻¹, Subgroup.Normal.conj_mem inferInstance σ hσ g⟩ =
      TauCeti.tameCharacter (G := G) hϖ ⟨σ, hσ⟩ ^ q :=
  Units.ext <| by rw [finiteTameCharacter_conj hϖ g σ hσ, hg, Units.val_pow_eq_pow_val]

end TameCharacter

/-! ## Layer 3a: ramification over a complete discretely valued field

Stated on Mathlib's discrete valuation rings, a finite group acting with invariants
(`Algebra.IsInvariant`), and Tau Ceti's lower filtration of a group acting on a local ring
(`TauCeti.IsLocalRing.ramificationGroup`), none of which assumes a finite residue field. -/

/-- **Layer 3a, integral monogenicity and the lower index.** A finite faithful extension of
discrete valuation rings with separable residue extension has a generator at which every lower
index is computed (Serre, *Local Fields*, III §6, Proposition 12, and IV §1, Proposition 1).
The action fixes the base ring; completeness and residue finiteness are unnecessary. -/
theorem exists_generator_lowerIndex_eq_addVal
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [Module.Finite A B] [FaithfulSMul A B] [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [MulSemiringAction G B] [SMulCommClass G A B] :
    ∃ x : B, Algebra.adjoin A {x} = ⊤ ∧ ∀ σ : G,
      TauCeti.IsLocalRing.lowerIndex B σ = IsDiscreteValuationRing.addVal B (σ • x - x) := by
  obtain ⟨x, hx⟩ := TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top (R := A) (S := B)
  exact ⟨x, hx, fun σ ↦
    TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top hx σ⟩

/-- **Layer 3a, Hilbert's different formula.** For a finite extension of complete DVRs with
separable residue extension and a faithful finite Galois action with invariants the base ring,
the different ideal is the power of the maximal ideal with exponent `∑ (|G_i| - 1)`
(Serre, *Local Fields*, IV §1, Proposition 4). The sum is finite because the lower groups
are eventually trivial. No residue-finiteness or commutativity of the Galois group is required. -/
theorem differentIdeal_eq_pow_maximalIdeal_of_separable_residue
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [Module.Finite A B] [FaithfulSMul A B] [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] :
    differentIdeal A B = IsLocalRing.maximalIdeal B ^
      (∑ᶠ i : ℕ, (Nat.card (TauCeti.IsLocalRing.ramificationGroup G B (i : ℤ)) - 1)) :=
  sorry

/-- **Layer 3a, Hasse–Arf without residue finiteness**, in Serre's lower-numbering form
(Serre, *Local Fields*, V §7, Theorem 1). `A` is a complete discrete valuation ring and `B` a
discrete valuation ring on which a finite abelian group `G` acts faithfully by `A`-algebra
automorphisms with invariants `A`, so that `Frac B / Frac A` is Galois with group `G`, and the
residue extension is separable. If `G_j ≠ G_(j+1)` for a natural number `j`, then
`φ(j) = (#G_1 + ⋯ + #G_j) / #G_0` is an integer, that is, every upper jump is integral. The upper
numbering itself on this carrier is a `README.md` target. -/
theorem hasseArf_dvd_sum_card_ramificationGroup
    (A B : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Algebra A B]
    [IsLocalHom (algebraMap A B)]
    [Algebra.IsSeparable (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField B)]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G B] [SMulCommClass G A B]
    [Algebra.IsInvariant A B G] [FaithfulSMul G B] [IsMulCommutative G] (j : ℕ)
    (hj : TauCeti.IsLocalRing.ramificationGroup G B (j : ℤ) ≠
      TauCeti.IsLocalRing.ramificationGroup G B ((j : ℤ) + 1)) :
    Nat.card (TauCeti.IsLocalRing.ramificationGroup G B 0) ∣
      ∑ i ∈ Finset.Icc 1 j, Nat.card (TauCeti.IsLocalRing.ramificationGroup G B (i : ℤ)) :=
  sorry

/-- **Layer 3a, finite-local-field Hasse–Arf.** Every upper jump of a finite abelian Galois
extension is integral. Specializing `hasseArf_dvd_sum_card_ramificationGroup` to the integer
rings gives divisibility at every nonnegative lower jump; the finite-sum formula and agreement
of the filtrations give this upper-numbering conclusion. The residue extension is separable
because the residue fields are finite, and a jump at `-1` is already integral. -/
theorem hasseArf [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (hcomm : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ)
    (u : RamificationIndexDomain) (hu : UpperJump K L u) :
    ∃ z : ℤ, (u : ℝ) = (z : ℝ) :=
  sorry

/-! ## Layer 4: the absolute Galois group, wild inertia, and the tame quotient

⚠ Profinite Sylow theory, free profinite groups and profinite presentations are **not** restated
here in Galois vocabulary: the Sylow theory uses Tau Ceti’s implementation of
`ProfiniteProPGroups`, and free
profinite groups and presentations from Tau Ceti (`TauCeti.freeProfiniteGroup`,
`TauCeti.presentedProfiniteGroup`). What this roadmap owns is the identification of the abstract
objects with the Galois-theoretic ones. -/

section Layer4

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 4, the maximal unramified extension** `K^ur = ⋃ K_n` inside the fixed ambient
algebraic closure: `maximalUnramifiedExtension` of Layer 2 at `Ω = AlgebraicClosure K`, under the
name `ClassFieldTheory` consumes. This adapter wraps `TauCeti.maximalUnramifiedExtension`
at `AlgebraicClosure K`. Layer 2's finite unramified extensions are its finite subextensions. -/
noncomputable abbrev maximalUnramified : IntermediateField K (AlgebraicClosure K) :=
  maximalUnramifiedExtension K (AlgebraicClosure K)

/-! ### The finite levels

A finite Galois subextension `L` of `K^al/K` is a Mathlib `FiniteGaloisIntermediateField`, and
`G_K` maps onto `Gal(L/K)` by `AlgEquiv.restrictNormalHom L`. The local-field structure of `L` is the
one Layer 0.III builds from `K`'s, installed locally, so that the ramification filtration of each
finite level is the canonical `lowerRamificationGroup` of Layer 3 and depends on the valuation and
topology of `K`. -/

/-- **Layer 4, the lower ramification groups of a finite Galois subextension** `L` of `K^al/K`:
`lowerRamificationGroup K L i` for the local-field structure that Layer 0.III installs on a finite
intermediate field (`finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`).
This adapts the intermediate-field carrier to the local-field carrier of Layer 3; no second
filtration is defined. -/
noncomputable def finiteGaloisLowerRamificationGroup
    (L : FiniteGaloisIntermediateField K (AlgebraicClosure K)) (i : ℤ) :
    Subgroup (L ≃ₐ[K] L) :=
  letI := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) L.toIntermediateField
  letI := finiteIntermediateFieldTopology K (AlgebraicClosure K) L.toIntermediateField
  haveI := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
    L.toIntermediateField
  haveI := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) L.toIntermediateField
  lowerRamificationGroup K L i

/-- **Layer 4.** Each finite-level lower ramification group is normal, by Tau Ceti's
`TauCeti.LocalFieldsRamification.instNormalLowerRamificationGroup`. -/
instance finiteGaloisLowerRamificationGroup_normal
    (L : FiniteGaloisIntermediateField K (AlgebraicClosure K)) (i : ℤ) :
    (finiteGaloisLowerRamificationGroup K L i).Normal :=
  letI := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) L.toIntermediateField
  letI := finiteIntermediateFieldTopology K (AlgebraicClosure K) L.toIntermediateField
  haveI := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
    L.toIntermediateField
  haveI := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) L.toIntermediateField
  TauCeti.LocalFieldsRamification.instNormalLowerRamificationGroup K L i

/-! ### Canonical inertia and arithmetic Frobenius lifts -/

/-- **Layer 4, the canonical inertia subgroup under the name used by ClassFieldTheory.**
This adapter wraps `TauCeti.inertiaSubgroup`. -/
noncomputable abbrev inertia : Subgroup (Field.absoluteGaloisGroup K) :=
  TauCeti.inertiaSubgroup K

/-- **Layer 4, inertia maps onto the depth-zero lower group at every finite Galois level.** -/
theorem map_restrictNormalHom_inertia
    (L : FiniteGaloisIntermediateField K (AlgebraicClosure K)) :
    (inertia K).map (AlgEquiv.restrictNormalHom L) = finiteGaloisLowerRamificationGroup K L 0 := by
  let := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) L.toIntermediateField
  let := finiteIntermediateFieldTopology K (AlgebraicClosure K) L.toIntermediateField
  have := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
    L.toIntermediateField
  have := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) L.toIntermediateField
  exact TauCeti.map_inertiaSubgroup_restrictNormalHom L.toIntermediateField

/-- **Layer 4.** The unramified quotient is `Ẑ`. The isomorphism is marked: it is
`quotientInertiaSubgroupEquiv` followed by `maximalUnramifiedGaloisGroupEquivZHat`, which sends the
arithmetic Frobenius to `TauCeti.zHat.gen`, and this existence statement is its closed corollary.
⚠ The identification is with Tau Ceti's `TauCeti.zHat`: this roadmap builds no second profinite
completion of `ℤ`. -/
theorem unramifiedQuotient_equiv_zhat :
    Nonempty (unramifiedQuotient K ≃ₜ* TauCeti.zHat.{u}) :=
  ⟨(quotientInertiaSubgroupEquiv K).trans
    (maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K))⟩

/-! ### Wild inertia and the maximal tamely ramified extension -/

/-- **Layer 4, wild inertia** `P_K`: the elements of `G_K` whose restriction to every finite Galois
subextension `L` of `K^al/K` lies in its first lower ramification group `G_1(L/K)`, that is, the
inverse limit of the finite-level wild inertia groups. It depends on the valuation and topology of
`K` through `finiteGaloisLowerRamificationGroup`. `fixingSubgroup_maximalTame` identifies it with
`Gal(K^al/K^t)`. This adapter wraps `TauCeti.wildInertiaSubgroup`. -/
noncomputable abbrev wildInertia : Subgroup (Field.absoluteGaloisGroup K) :=
  TauCeti.wildInertiaSubgroup K

/-- **Layer 4, wild inertia is characterized by its images at finite Galois levels.** -/
theorem mem_wildInertia_iff (σ : Field.absoluteGaloisGroup K) :
    σ ∈ wildInertia K ↔ ∀ L : FiniteGaloisIntermediateField K (AlgebraicClosure K),
      AlgEquiv.restrictNormalHom L σ ∈ finiteGaloisLowerRamificationGroup K L 1 :=
  sorry

/-- **Layer 4, wild inertia at a finite level.** The image of `P_K` in `Gal(L/K)` is all of
`G_1(L/K)`, not merely contained in it: restriction maps `G_1` of a larger finite level onto `G_1`
of a smaller one, because `G_1` is the unique `p`-Sylow subgroup of `G_0` and restriction maps `G_0`
onto `G_0` (`map_restrictNormalHom_inertia`), and compactness passes to the limit. -/
theorem map_restrictNormalHom_wildInertia
    (L : FiniteGaloisIntermediateField K (AlgebraicClosure K)) :
    (wildInertia K).map (AlgEquiv.restrictNormalHom L) = finiteGaloisLowerRamificationGroup K L 1 :=
  by
    let := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) L.toIntermediateField
    let := finiteIntermediateFieldTopology K (AlgebraicClosure K) L.toIntermediateField
    have := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      L.toIntermediateField
    have := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) L.toIntermediateField
    exact TauCeti.map_wildInertiaSubgroup_restrictNormalHom L.toIntermediateField

/-- **Layer 4.** `P_K` is normal in `G_K`, so the tame quotient below is a group. A closed proof:
each `G_1(L/K)` is normal, and preimages and intersections of normal subgroups are normal. -/
instance wildInertia_normal : (wildInertia K).Normal :=
  TauCeti.wildInertiaSubgroup_normal K

/-- **Layer 4.** `P_K` is closed. This is what makes the tame quotient Hausdorff
(`QuotientGroup.instT3Space`), hence profinite, so that the topological isomorphisms below are
statements about a profinite group. A closed proof: every restriction map is continuous
(`InfiniteGalois.restrictNormalHom_continuous`) into a finite discrete group. -/
theorem wildInertia_isClosed : IsClosed (wildInertia K : Set (Field.absoluteGaloisGroup K)) :=
  TauCeti.isClosed_wildInertiaSubgroup K

/-- **Layer 4, the canonical maximal tamely ramified extension** `K^t`.
It is the separable part of the fixed field of wild inertia. `maximalTame_eq_maximalUnramified_sup_adjoin` identifies it with
`⋃_{p ∤ m} K^ur(π^{1/m})`, and `le_maximalTame_iff` with the compositum of the finite tamely
ramified subextensions. ⚠ The intersection with the separable closure is part of the definition:
in positive characteristic the fixed field of every subgroup of `G_K` contains the purely
inseparable closure of `K` (Tau Ceti's `TauCeti.mem_perfectClosure_iff_fixed`), while `K^t` is
separable over `K`. In characteristic `0` it changes nothing. This adapter wraps
`TauCeti.maximalTameExtension` at `AlgebraicClosure K`. -/
noncomputable abbrev maximalTame : IntermediateField K (AlgebraicClosure K) :=
  TauCeti.maximalTameExtension K (AlgebraicClosure K)

/-- **Layer 4, wild inertia fixes precisely the maximal tame extension inside the
separable closure.** The fixing-subgroup equality is Tau Ceti's defining characterization. -/
theorem fixingSubgroup_maximalTame : (maximalTame K).fixingSubgroup = wildInertia K :=
  (TauCeti.wildInertiaSubgroup_def K).symm

/-- **Layer 4, the finite levels of `K^t`.** A finite Galois subextension lies in `K^t` exactly
when its first lower ramification group is trivial, that is, by Layer 3 (`G_1` is the `p`-Sylow
subgroup of `G_0`, and `#G_0 = e`), exactly when it is tamely ramified. So `K^t` is the compositum
of the finite tamely ramified subextensions. -/
theorem le_maximalTame_iff (L : FiniteGaloisIntermediateField K (AlgebraicClosure K)) :
    L.toIntermediateField ≤ maximalTame K ↔ finiteGaloisLowerRamificationGroup K L 1 = ⊥ :=
  by
    let := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) L.toIntermediateField
    let := finiteIntermediateFieldTopology K (AlgebraicClosure K) L.toIntermediateField
    have := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      L.toIntermediateField
    have := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) L.toIntermediateField
    exact (TauCeti.le_maximalTameExtension_iff L.toIntermediateField).trans
      (TauCeti.LocalFieldsRamification.lowerRamificationGroup_one_eq_bot_iff_isTamelyRamified
        K L).symm

/-- **Layer 4, the classical description** `K^t = K^ur(π^{1/m} : p ∤ m)`, for any uniformizer `π`,
where `p = ringChar 𝓀[K]` is the residue characteristic. Adjoining all `m`-th roots of `π` rather
than one of them changes nothing, because the `m`-th roots of unity lie in `K^ur` for `p ∤ m`. -/
theorem maximalTame_eq_maximalUnramified_sup_adjoin (π : Kˣ)
    (hπ : TauCeti.IsUniformizer K π) :
    maximalTame K = maximalUnramified K ⊔ IntermediateField.adjoin K
      {x : AlgebraicClosure K | ∃ m : ℕ, ¬ ringChar 𝓀[K] ∣ m ∧
        x ^ m = algebraMap K (AlgebraicClosure K) π} :=
  TauCeti.maximalTameExtension_eq_sup_adjoin hπ

/-- **Layer 4.** Wild inertia sits inside inertia: `G_1 ≤ G_0` at every finite level, and `I_K` is
closed with finite-level images `G_0` (`map_restrictNormalHom_inertia`). Equivalently,
`K^ur ⊆ K^t`. -/
theorem wildInertia_le_inertia : wildInertia K ≤ inertia K :=
  TauCeti.wildInertiaSubgroup_le_inertiaSubgroup K

/-- **Layer 4.** `I_K` is compact, as a closed subgroup (`isClosed_inertiaSubgroup`) of the compact
group `G_K`; with the next statement this is the profiniteness of `I_K` in the form the supplier's
Sylow theorems ask for. -/
theorem inertia_compactSpace : CompactSpace (inertia K) :=
  isCompact_iff_compactSpace.1 (isClosed_inertiaSubgroup K).isCompact

/-- **Layer 4.** `I_K` is totally disconnected, as a subspace of `G_K`. -/
theorem inertia_totallyDisconnectedSpace : TotallyDisconnectedSpace (inertia K) :=
  inferInstance

/-- **Layer 4.** `P_K` is normal in `I_K`, because it is normal in `G_K` (`wildInertia_normal`).
Normality inside `I_K` is what the supplier's uniqueness theorem consumes, and it is an
`instance` because the tame quotient `I_K/P_K` of `tameInertiaEquiv` has no group structure
without it. A closed proof. -/
instance wildInertia_subgroupOf_normal : ((wildInertia K).subgroupOf (inertia K)).Normal :=
  inferInstance

omit [Fact p.Prime] in
/-- **Layer 4, wild inertia is pro-`p`.** Stated separately from the Sylow identification below,
because it is the hypothesis that identification consumes and a consumer may need it alone. -/
theorem wildInertia_isProP (hp : ringChar 𝓀[K] = p) :
    TauCeti.IsProP p (wildInertia K) :=
  by
    have : CharP 𝓀[K] p := (ringChar.eq_iff).1 hp
    exact TauCeti.isProP_wildInertiaSubgroup K p

/-- **Layer 4.** The primes other than the residue characteristic: the index set of the
prime-to-`p` Tate module. -/
abbrev PrimesAway (p : ℕ) : Type := {ℓ : Nat.Primes // (ℓ : ℕ) ≠ p}

/-- ⚠ Mathlib carries `Fact p.1.Prime` for a bundled `p : Nat.Primes` only as a `local instance`
in one file, so `ℤ_[ℓ]` does not elaborate for a bundled prime without this. -/
local instance factPrimePrimesAway {p : ℕ} (ℓ : PrimesAway p) :
    Fact ((ℓ : Nat.Primes) : ℕ).Prime :=
  ⟨(ℓ : Nat.Primes).2⟩

/-- **Layer 4, product coordinates on tame inertia.** Choosing compatible generators
of the prime-power roots of unity identifies the canonical Tate module with the product of
`ℤ_ℓ` for `ℓ ≠ p`. The character and its Tate-module quotient equivalence are choice-independent. -/
theorem tameInertiaEquiv (hp : ringChar 𝓀[K] = p) :
    Nonempty ((inertia K) ⧸ ((wildInertia K).subgroupOf (inertia K)) ≃ₜ*
      Multiplicative (∀ ℓ : PrimesAway p, ℤ_[(ℓ : Nat.Primes)])) :=
  sorry

omit [Fact p.Prime] in
/-- **Layer 4, the Sylow identification.** `P_K` is *the* pro-`p` Sylow subgroup of `I_K`, with `p`
the residue characteristic. This is the one theorem of the layer that is about wild inertia rather
than about profinite groups; conjugacy, existence and the containment theorem are the supplier's
(`exists_isProPSylow`, `IsProP.exists_le_isProPSylow`, `IsProPSylow.map_of_surjective`) and are not
restated. -/
theorem wildInertia_isProPSylow (hp : ringChar 𝓀[K] = p) :
    TauCeti.IsProPSylow p ((wildInertia K).subgroupOf (inertia K)) :=
  by
    have : CharP 𝓀[K] p := (ringChar.eq_iff).1 hp
    exact TauCeti.isProPSylow_wildInertiaSubgroup K p

/-- **Layer 4, acceptance: the uniqueness of `P_K` is the supplier's theorem, applied.** A closed
proof, so the contract is type-checked rather than promised: any pro-`p` Sylow subgroup of `I_K`
equals wild inertia. If `IsProPSylow.eq_of_normal` changes its name, argument order or hypotheses,
this breaks. -/
theorem wildInertia_eq_of_isProPSylow (hp : ringChar 𝓀[K] = p) (Q : Subgroup (inertia K))
    (hQ : TauCeti.IsProPSylow p Q) :
    (wildInertia K).subgroupOf (inertia K) = Q := by
  have := inertia_compactSpace K
  have := inertia_totallyDisconnectedSpace K
  exact TauCeti.IsProPSylow.eq_of_normal p _ _ _
    (wildInertia_isProPSylow K p hp) hQ (wildInertia_subgroupOf_normal K)

/-! ### The tame quotient and the twist -/

/- The native declaration also serves the qualified spelling used by local Galois groups. -/
export TauCeti (tameQuotient)

/-- **Layer 4, tame inertia** `I_K/P_K`, as the image of `I_K` in the tame quotient. The first
isomorphism theorem (`QuotientGroup.quotientKerEquivRange`), for the quotient map restricted to
`I_K`, compares it with the carrier `inertia K ⧸ (wildInertia K).subgroupOf (inertia K)` of
`tameInertiaEquiv`. -/
noncomputable abbrev tameInertia : Subgroup (tameQuotient K) :=
  (inertiaSubgroup K).map (QuotientGroup.mk' (wildInertia K))

/-- **Layer 4, tame inertia is abelian**, as the image of the canonical Tate module. -/
instance tameInertia_isMulCommutative : IsMulCommutative (tameInertia K) :=
  by
    change IsMulCommutative ((TauCeti.inertiaSubgroup K).map
      (TauCeti.toTameQuotient K).toMonoidHom)
    rw [← TauCeti.range_tameInertiaHom]
    infer_instance

/-- **Layer 4, the Frobenius twist, intrinsic form.** Conjugation by an arithmetic Frobenius lift
is the `q`-th power map on tame inertia, `q = #𝓀[K]`. It is stated in `G_K/P_K` and needs no tame
character: under any isomorphism `t` of `I_K/P_K` with `Ẑ^{(p')}(1)` it reads
`t (φ x φ⁻¹) = t x ^ q`, which is the `(1)` of the notation. With abelianness and the topological
generation of `G_K` by `φ` and `I_K`, it determines the conjugation action of all of `G_K` on tame
inertia. Its finite-level form is `tameCharacter_conj_of_smul_eq_pow`. -/
theorem tameQuotient_mk_conj_of_isArithFrobeniusLift {φ x : Field.absoluteGaloisGroup K}
    (hφ : IsArithFrobeniusLift K φ) (hx : x ∈ inertiaSubgroup K) :
    (QuotientGroup.mk (φ * x * φ⁻¹) : tameQuotient K) =
      (QuotientGroup.mk x : tameQuotient K) ^ Nat.card 𝓀[K] :=
  by
    simpa only [TauCeti.toTameQuotient_apply, QuotientGroup.mk_mul, QuotientGroup.mk_inv] using
      TauCeti.IsArithFrobeniusLift.toTameQuotient_mul_toTameQuotient_mul_inv hφ hx

/-- **Layer 4, tame inertia is procyclic**, topologically generated by the class of an element of
inertia: some `τ ∈ I_K` has a class that topologically generates `I_K/P_K`. The membership is part
of the statement. It holds because `I_K/P_K` is the image of `I_K`, so a generator has a lift in
`I_K`, and two lifts of one class differ by an element of `P_K ≤ I_K` (`wildInertia_le_inertia`).
No canonical `τ` is intended; `τ` is the generator the Iwasawa presentation is marked by. -/
theorem exists_topologicalClosure_zpowers_eq_tameInertia :
    ∃ τ : Field.absoluteGaloisGroup K, τ ∈ inertiaSubgroup K ∧
      (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
        tameInertia K :=
  sorry

/-! ### The Iwasawa presentation, marked -/

/-- **Layer 4.** The coordinate sends `σ` to the canonical generator of `Ẑ`. A closed proof from
Tau Ceti’s canonical coordinate computation rules. -/
@[simp]
theorem iwasawaCoordinate_sigma : iwasawaCoordinate K (iwasawaSigma K) = TauCeti.zHat.gen :=
  TauCeti.iwasawaCoordinate_iwasawaSigma K

/-- **Layer 4.** The coordinate kills `τ`. A closed proof from
Tau Ceti’s canonical coordinate computation rules. -/
@[simp]
theorem iwasawaCoordinate_tau : iwasawaCoordinate K (iwasawaTau K) = 1 :=
  TauCeti.iwasawaCoordinate_iwasawaTau K

/-- **Layer 4, acceptance: the two rules determine the coordinate.** A closed proof through Tau
Ceti's `TauCeti.presentedProfiniteGroup.hom_ext_of`. -/
theorem iwasawaCoordinate_unique (χ : IwasawaGroup K →ₜ* TauCeti.zHat.{u}) (h₀ : χ (iwasawaSigma K) = TauCeti.zHat.gen)
    (h₁ : χ (iwasawaTau K) = 1) : χ = iwasawaCoordinate K := by
  refine presentedProfiniteGroup.hom_ext_of fun x => ?_
  rcases x with ⟨i⟩
  fin_cases i
  · exact h₀.trans (iwasawaCoordinate_sigma K).symm
  · exact h₁.trans (iwasawaCoordinate_tau K).symm

/-- **Layer 4, the Iwasawa presentation, marked.** For an arithmetic Frobenius lift `σ` and a `τ`
whose class topologically generates tame inertia, the topological isomorphism
`G_K/P_K ≃ₜ* ⟨σ, τ | σ τ σ⁻¹ = τ^q⟩` sending `σ̄ ↦ of 0` and `τ̄ ↦ of 1` (Iwasawa; NSW (7.5.3)).
The two computation rules below and the uniqueness theorem determine it, so nothing
about it is a choice beyond `σ` and `τ`. This adapter wraps `TauCeti.tameQuotientEquiv`,
with `K`, `σ` and `τ` explicit. -/
noncomputable abbrev markedTameQuotientEquiv (σ : Field.absoluteGaloisGroup K) (τ : inertia K)
    (hσ : IsArithFrobeniusLift K σ)
    (hτ : (Subgroup.zpowers (inertiaTameCharacter K τ)).topologicalClosure = ⊤) :
    tameQuotient K ≃ₜ* IwasawaGroup K :=
  TauCeti.tameQuotientEquiv hσ τ hτ

section Marked

variable {K} {σ : Field.absoluteGaloisGroup K} {τ : inertia K}
  {hσ : IsArithFrobeniusLift K σ}
  {hτ : (Subgroup.zpowers (inertiaTameCharacter K τ)).topologicalClosure = ⊤}

/-- **Layer 4.** The marked isomorphism sends the Frobenius lift `σ` to `of 0`. -/
@[simp]
theorem tameQuotientEquiv_mk_frobenius :
    markedTameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk σ) = iwasawaSigma K :=
  TauCeti.tameQuotientEquiv_toTameQuotient_frobenius hσ hτ

/-- **Layer 4.** The marked isomorphism sends the tame inertia generator `τ` to `of 1`. -/
@[simp]
theorem tameQuotientEquiv_mk_tameGenerator :
    markedTameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K)) = iwasawaTau K :=
  TauCeti.tameQuotientEquiv_toTameQuotient_tameGenerator hσ hτ

/-- **Layer 4, acceptance: the two rules determine the marked isomorphism.** A closed proof through
Tau Ceti's `TauCeti.presentedProfiniteGroup.hom_ext_of`, applied to the inverses, which are
continuous homomorphisms into the tame quotient, Hausdorff by `wildInertia_isClosed`. -/
theorem tameQuotientEquiv_unique (e : tameQuotient K ≃ₜ* IwasawaGroup K) (he₀ : e (QuotientGroup.mk σ) = iwasawaSigma K)
    (he₁ : e (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K)) = iwasawaTau K) : e = markedTameQuotientEquiv K σ τ hσ hτ := by
  have := wildInertia_isClosed K
  have h : (e.symm : IwasawaGroup K →ₜ* tameQuotient K) =
      ((markedTameQuotientEquiv K σ τ hσ hτ).symm : IwasawaGroup K →ₜ* tameQuotient K) := by
    refine presentedProfiniteGroup.hom_ext_of fun x => ?_
    rcases x with ⟨i⟩
    fin_cases i
    · change e.symm (iwasawaSigma K) = (markedTameQuotientEquiv K σ τ hσ hτ).symm (iwasawaSigma K)
      rw [(ContinuousMulEquiv.symm_apply_eq e).2 he₀.symm,
        (ContinuousMulEquiv.symm_apply_eq _).2
          (tameQuotientEquiv_mk_frobenius (hσ := hσ) (hτ := hτ)).symm]
    · change e.symm (iwasawaTau K) = (markedTameQuotientEquiv K σ τ hσ hτ).symm (iwasawaTau K)
      rw [(ContinuousMulEquiv.symm_apply_eq e).2 he₁.symm,
        (ContinuousMulEquiv.symm_apply_eq _).2
          (tameQuotientEquiv_mk_tameGenerator (hσ := hσ) (hτ := hτ)).symm]
  refine ContinuousMulEquiv.ext fun x => ?_
  have hx := DFunLike.congr_fun h (e x)
  simp only [ContinuousMonoidHom.coe_coe, ContinuousMulEquiv.symm_apply_apply] at hx
  exact (ContinuousMulEquiv.symm_apply_eq _).1 hx.symm

/-- **Layer 4, choice-free consequence: the image of tame inertia** is the closed normal closure
of `of 1`, whatever the choices of `σ` and `τ`. -/
theorem map_tameInertia_tameQuotientEquiv :
    (tameInertia K).map (markedTameQuotientEquiv K σ τ hσ hτ).toMulEquiv.toMonoidHom =
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  TauCeti.map_tameQuotientEquiv_inertiaSubgroup hσ hτ

/-- **Layer 4, choice-free consequence: every arithmetic Frobenius lift** lands in the coset
`of 0 · ⟨⟨of 1⟩⟩`, whatever the choices of `σ` and `τ`; the membership is spelled as in
`TauCeti.IsArithFrobeniusLift.isArithFrobeniusLift_iff_inv_mul_mem`. -/
theorem tameQuotientEquiv_mk_of_isArithFrobeniusLift {φ : Field.absoluteGaloisGroup K}
    (hφ : IsArithFrobeniusLift K φ) :
    (iwasawaSigma K)⁻¹ * markedTameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk φ) ∈
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  TauCeti.IsArithFrobeniusLift.inv_iwasawaSigma_mul_tameQuotientEquiv_mem hσ hτ hφ

/-- **Layer 4, the coordinate is the unramified coordinate of Layer 2.** Through the marked
isomorphism, `iwasawaCoordinate` is restriction to `K^ur` followed by
`maximalUnramifiedGaloisGroupEquivZHat`, which sends the arithmetic Frobenius to
`TauCeti.zHat.gen`. Both sides are continuous homomorphisms `G_K → Ẑ` that agree at `σ` and are
trivial on `I_K`, and `σ` and `I_K` generate `G_K` topologically
(`TauCeti.IsArithFrobeniusLift.topologicalClosure_zpowers_sup_inertiaSubgroup`). -/
theorem iwasawaCoordinate_tameQuotientEquiv_mk (g : Field.absoluteGaloisGroup K) :
    iwasawaCoordinate K (markedTameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk g)) =
      maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)
        (restrictMaximalUnramifiedHom K g) :=
  by
    rw [TauCeti.iwasawaCoordinate_tameQuotientEquiv hσ hτ]
    exact TauCeti.tameQuotientToZHat_toTameQuotient g

end Marked

/-- **Layer 4, the Iwasawa presentation, unmarked.** `G_K^t` is the profinite group presented by
`iwasawaRelator`. A closed corollary of `markedTameQuotientEquiv`, with a Frobenius lift from
`exists_isArithFrobeniusLift` and a tame generator from
`exists_topologicalClosure_zpowers_eq_tameInertia`. ⚠ Theorems about the presentation are stated
against `markedTameQuotientEquiv`: this statement alone cannot tell the arithmetic relator
from the geometric one, which presents an isomorphic group. -/
theorem tameQuotientPresentation :
    Nonempty (tameQuotient K ≃ₜ*
      TauCeti.presentedProfiniteGroup (ULift.{u} (Fin 2)) {iwasawaRelator K}) :=
  TauCeti.nonempty_continuousMulEquiv_iwasawaGroup K

/-! ### The geometric form -/

/-- **Layer 4.** The geometric translation sends `σ` to the inverse of the geometric generator. -/
@[simp]
theorem iwasawaGeometricEquiv_sigma :
    iwasawaGeometricEquiv K (iwasawaSigma K) = (iwasawaSigmaGeometric K)⁻¹ :=
  TauCeti.iwasawaGeometricEquiv_iwasawaSigma K

/-- **Layer 4.** The geometric translation fixes the tame generator. -/
@[simp]
theorem iwasawaGeometricEquiv_tau :
    iwasawaGeometricEquiv K (iwasawaTau K) = iwasawaTauGeometric K :=
  TauCeti.iwasawaGeometricEquiv_iwasawaTau K

/-- **Layer 4, the coordinate of the geometric generator** is `TauCeti.zHat.gen⁻¹`: in the geometric
presentation the arithmetic Frobenius is the inverse of the marked generator. A closed proof from
the computation rules. -/
theorem iwasawaCoordinate_iwasawaGeometricEquiv_symm_sigmaGeometric :
    iwasawaCoordinate K ((iwasawaGeometricEquiv K).symm (iwasawaSigmaGeometric K)) =
      TauCeti.zHat.gen⁻¹ := by
  rw [← inv_inv (iwasawaSigmaGeometric K), ← iwasawaGeometricEquiv_sigma, map_inv,
    ContinuousMulEquiv.symm_apply_apply, map_inv, iwasawaCoordinate_sigma]

end Layer4

end TauCetiRoadmap.LocalFieldsRamification

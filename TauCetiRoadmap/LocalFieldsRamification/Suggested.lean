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
are imported from Tau Ceti. The names below are reducible aliases or adapters, and supplied
results are closed applications of those declarations. Product coordinates on the tame Tate
module require choices; the Tate-module-valued tame character itself is choice-independent.

The local-field objects that the pinned Tau Ceti implements are **consumed, not restated**: the
normalized valuation and the valuation of a natural-number cast (`TauCeti.normalizedValuation`,
`TauCeti.natCastValuation`), the ramification index, the residue degree, the tame and wild
predicates and the absolute ramification index (`TauCeti.ramificationIndex`,
`TauCeti.inertiaDegree`, `TauCeti.IsTamelyRamified`, `TauCeti.IsWildlyRamified`,
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
`TauCeti.discriminantIdeal`, `TauCeti.discriminantExponent`). This file's names for them are
reducible aliases; `frobeniusAlgEquiv` and `absoluteRamificationIndex` adapt the hypotheses, as
their docstrings say. The milestones about them that Tau Ceti proves are closed proofs of Tau
Ceti's theorems, and the remaining milestones are stated about these objects.

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
open scoped WithZero

universe u v w

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type v) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-! ## Layer 0: local fields and their finite extensions -/

/-- **Layer 0, the normalized valuation.** The valuation of a local field, written
additively but encoded as a homomorphism to `Multiplicative ℤ`: `WithZero.log` of Mathlib's
canonical valuation transported along `valueGroupWithZeroIsoInt`. Tau Ceti's
`TauCeti.normalizedValuation` (`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean`),
consumed by reducible alias; its body uses the valuation, the topology and the local-field
hypothesis of `K`, which are therefore parameters of this definition. ⚠ Sign trap: Mathlib's
multiplicative convention has `valuation K π = exp (−1) < 1` on uniformizers, so the additive
normalization carries a minus sign, confined to Tau Ceti's single translation lemma
`TauCeti.toAdd_normalizedValuation_eq_neg_log`. -/
noncomputable abbrev normalizedValuation : Kˣ →* Multiplicative ℤ :=
  TauCeti.normalizedValuation K

/-- **Layer 0.** The normalized valuation is surjective: the value group is all of `ℤ`. Tau
Ceti's `TauCeti.normalizedValuation_surjective`. -/
theorem normalizedValuation_surjective : Function.Surjective (normalizedValuation K) :=
  TauCeti.normalizedValuation_surjective

/-- **Layer 0.** `v_K^×(x) = 1` says the additive value is `0`, that is, `x` is a unit of
`𝒪[K]`. This is the equation reserved for the kernel condition; the uniformizer equation is
the next lemma, and the two must not be conflated. Tau Ceti's
`TauCeti.normalizedValuation_eq_one_iff`. -/
theorem normalizedValuation_eq_one_iff (x : Kˣ) :
    normalizedValuation K x = 1 ↔ valuation K (x : K) = 1 :=
  TauCeti.normalizedValuation_eq_one_iff x

/-- **Layer 0.** For a uniformizer the Lean-facing equation is
`v_K^×(π) = Multiplicative.ofAdd 1`, equivalently `v_K(π) = 1` after decoding with
`Multiplicative.toAdd`. Tau Ceti's `TauCeti.normalizedValuation_irreducible`; the nonvanishing
proof is an argument here so that the unit is written `Units.mk0 (π : K) hπ0` by the caller. -/
theorem normalizedValuation_irreducible (π : 𝒪[K]) (hπ : Irreducible π) (hπ0 : (π : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (π : K) hπ0) = Multiplicative.ofAdd 1 :=
  TauCeti.normalizedValuation_irreducible hπ

/-- **Layer 0.I, bridge to the analytic API.** The normalized absolute value attached to the
canonical valuative relation supplies the normed-field structure used by
`spectralNorm`. This is a named value rather than a global instance, so installing it is always
local and cannot create a topology diamond. Tau Ceti's `TauCeti.normalizedNormedField`
(`TauCeti/NumberTheory/LocalField/NormedField.lean`), consumed by reducible alias. -/
noncomputable abbrev normalizedNormedField : NormedField K :=
  TauCeti.normalizedNormedField K

/-- **Layer 0.I, the topology carried by `normalizedNormedField`.** Naming it separately makes
all later comparisons explicit. Tau Ceti's `TauCeti.normalizedNormedFieldTopology`. -/
noncomputable abbrev normalizedNormedFieldTopology : TopologicalSpace K :=
  TauCeti.normalizedNormedFieldTopology K

/-- **Layer 0.I, compatibility of the analytic and valuative topologies on the base.** Tau Ceti's
`TauCeti.normalizedNormedField_topology_eq`. -/
theorem normalizedNormedField_topology_eq :
    normalizedNormedFieldTopology K = (inferInstance : TopologicalSpace K) :=
  TauCeti.normalizedNormedField_topology_eq K

/-- **Layer 0.I, the spectral-norm structure on a bare finite algebra.** Completeness and
ultrametricity come from `normalizedNormedField`; no topology or valuation on `M` is assumed.
Tau Ceti's `TauCeti.finiteExtensionNormedField`
(`TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean`), consumed by reducible alias. -/
noncomputable abbrev finiteExtensionNormedField (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : NormedField M :=
  TauCeti.finiteExtensionNormedField K M

/-- **Layer 0.I, the topology induced by the spectral norm.** Tau Ceti's
`TauCeti.finiteExtensionNormedFieldTopology`. -/
noncomputable abbrev finiteExtensionNormedFieldTopology (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : TopologicalSpace M :=
  TauCeti.finiteExtensionNormedFieldTopology K M

/-- **Layer 0.I, constructing the valuative structure on a finite extension.** The spectral
norm supplies a `ValuativeRel M`; a particular `Valuation M ℤᵐ⁰` is an implementation witness,
not a second public carrier. This is a definition rather than a global instance, avoiding a
diamond when `M` already has a valuative structure. Tau Ceti's
`TauCeti.finiteExtensionValuativeRel`, consumed by reducible alias. -/
noncomputable abbrev finiteExtensionValuativeRel (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : ValuativeRel M :=
  TauCeti.finiteExtensionValuativeRel K M

/-- **Layer 0.I, compatibility of the constructed structure with the base field.** Tau Ceti's
`TauCeti.finiteExtension_valuativeExtension`. -/
theorem finiteExtension_valuativeExtension (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    letI := finiteExtensionValuativeRel K M
    ValuativeExtension K M :=
  TauCeti.finiteExtension_valuativeExtension K M

/-- **Layer 0.I, the constructed topology is valuative for the constructed relation.** This is
the missing bridge from the spectral norm to the public valuative carrier. Tau Ceti's
`TauCeti.finiteExtension_isValuativeTopology`. -/
theorem finiteExtension_isValuativeTopology (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    @IsValuativeTopology M _ (finiteExtensionValuativeRel K M)
      (finiteExtensionNormedFieldTopology K M) :=
  TauCeti.finiteExtension_isValuativeTopology K M

/-- **Layer 0.III, a bare finite algebra is a local field with the structures just constructed.**
Unlike the compatibility example below, this theorem assumes no topology or valuative relation
on `M`; it closes the construction consumed by every later layer. Tau Ceti's
`TauCeti.finiteExtension_isNonarchimedeanLocalField`. -/
theorem finiteExtension_isNonarchimedeanLocalField (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    @IsNonarchimedeanLocalField M _ (finiteExtensionValuativeRel K M)
      (finiteExtensionNormedFieldTopology K M) :=
  TauCeti.finiteExtension_isNonarchimedeanLocalField K M

/-- **Layer 0.II, comparison with an already topologized compatible extension.** Uniqueness of
the extended valuation identifies the spectral-norm topology with the pre-existing valuative
topology. Tau Ceti's `TauCeti.finiteExtensionNormedFieldTopology_eq`. -/
theorem finiteExtensionNormedFieldTopology_eq (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] [ValuativeRel M] [TopologicalSpace M] [IsValuativeTopology M]
    [ValuativeExtension K M] :
    finiteExtensionNormedFieldTopology K M = (inferInstance : TopologicalSpace M) :=
  TauCeti.finiteExtensionNormedFieldTopology_eq K M

/-- **Layer 0.II, uniqueness.** Any two valuations on a finite extension `M/K` restricting to
the valuation class of `K` are equivalent. (Completeness of `K` is what makes this true, and
it is part of `IsNonarchimedeanLocalField K`.) Tau Ceti's
`TauCeti.finiteExtensionValuation_isEquiv`. -/
theorem finiteExtensionValuation_isEquiv (M : Type v) [Field M] [Algebra K M] [Module.Finite K M]
    {Γ₁ Γ₂ : Type*} [LinearOrderedCommGroupWithZero Γ₁] [LinearOrderedCommGroupWithZero Γ₂]
    (w₁ : Valuation M Γ₁) (w₂ : Valuation M Γ₂)
    (h₁ : (w₁.comap (algebraMap K M)).IsEquiv (valuation K))
    (h₂ : (w₂.comap (algebraMap K M)).IsEquiv (valuation K)) :
    w₁.IsEquiv w₂ :=
  TauCeti.finiteExtensionValuation_isEquiv h₁ h₂

/-- **Layer 0.II, the constructed relation agrees with any compatible existing relation.** Tau
Ceti's `TauCeti.finiteExtensionValuativeRel_eq`. -/
theorem finiteExtensionValuativeRel_eq (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] [ValuativeRel M] [ValuativeExtension K M] :
    finiteExtensionValuativeRel K M = (inferInstance : ValuativeRel M) :=
  TauCeti.finiteExtensionValuativeRel_eq K M

omit [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- **Layer 0.II, corollary: Galois invariance of the valuation.** Every `K`-algebra
automorphism of a finite extension `L/K` of local fields preserves the canonical valuation.
This is what makes `Gal(L/K)` act on `𝒪[L]`, `𝓂[L]`, and the residue field, and Layers 2
and 3 use it constantly. Tau Ceti's `AlgEquiv.valuation_eq`. -/
theorem valuation_algEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (σ : L ≃ₐ[K] L) (x : L) :
    valuation L (σ x) = valuation L x :=
  AlgEquiv.valuation_eq σ x

/-- **Layer 0.III, integer rings in an extension.** The compatible valuation makes the map
`K → L` restrict to `𝒪[K] → 𝒪[L]`. The instance is Tau Ceti's `TauCeti.integerRingAlgebra`
(`TauCeti/RingTheory/Valuation/ValuativeRel/Extension.lean`), which every statement below uses;
this reducible alias names it for the local package consumed by the monogenicity and different
milestones below, and is not a second instance. -/
noncomputable abbrev integerRingAlgebra [Algebra K L] [ValuativeExtension K L] :
    Algebra 𝒪[K] 𝒪[L] :=
  TauCeti.integerRingAlgebra

/-- **Layer 0.III, residue fields in an extension.** The reduction of the integer-ring algebra
is the canonical `𝓀[K]`-algebra structure on `𝓀[L]`. The instance is Tau Ceti's
`TauCeti.residueFieldAlgebra`; this reducible alias names it and is not a second instance. -/
noncomputable abbrev residueFieldAlgebra [Algebra K L] [ValuativeExtension K L] :
    Algebra 𝓀[K] 𝓀[L] :=
  TauCeti.residueFieldAlgebra

omit [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- **Layer 0.III, torsion-freeness of the integer-ring extension.** This is the ring-level
hypothesis used by Mathlib's `differentIdeal`; it holds for every compatible extension, and is
found by instance search. -/
theorem integerRingTorsionFree [Algebra K L] [ValuativeExtension K L] :
    Module.IsTorsionFree 𝒪[K] 𝒪[L] :=
  inferInstance

/-- **Layer 0.III, finiteness of the integer-ring extension.** Tau Ceti's instance
`TauCeti.integerRingModuleFinite` (`TauCeti/NumberTheory/LocalField/IntegerRing.lean`). -/
theorem integerRingModuleFinite [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] : Module.Finite 𝒪[K] 𝒪[L] :=
  TauCeti.integerRingModuleFinite K L

/-- **Layer 0.III, finite freeness of the integer-ring extension.** Tau Ceti's instance
`TauCeti.integerRingModuleFree`. -/
theorem integerRingModuleFree [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] : Module.Free 𝒪[K] 𝒪[L] :=
  TauCeti.integerRingModuleFree K L

omit [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
/-- **Layer 0.III, comparison with integral closure.** Tau Ceti's
`TauCeti.integerRing_eq_integralClosure`, read on carriers. -/
theorem integerRing_eq_integralClosure [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    (𝒪[L] : Set L) = integralClosure 𝒪[K] L :=
  congrArg (fun S : Subring L => (S : Set L)) (TauCeti.integerRing_eq_integralClosure K L)

/-- **Layer 0.III, compatibility of the constructed topology in a finite tower.** Tau Ceti's
`TauCeti.finiteExtensionNormedFieldTopology_tower`. -/
theorem finiteExtensionNormedFieldTopology_tower
    (M : Type w) [Field M] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra L M] [Module.Finite L M] [Algebra K M] [Module.Finite K M]
    [IsScalarTower K L M] :
    finiteExtensionNormedFieldTopology K M = finiteExtensionNormedFieldTopology L M :=
  TauCeti.finiteExtensionNormedFieldTopology_tower K L M

/-- **Layer 0.III, compatibility of the constructed valuative relation in a finite tower.** Tau
Ceti's `TauCeti.finiteExtensionValuativeRel_tower`. -/
theorem finiteExtensionValuativeRel_tower
    (M : Type w) [Field M] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra L M] [Module.Finite L M] [Algebra K M] [Module.Finite K M]
    [IsScalarTower K L M] :
    finiteExtensionValuativeRel K M = finiteExtensionValuativeRel L M :=
  TauCeti.finiteExtensionValuativeRel_tower K L M

/-- **Layer 0.III, adapter for a finite intermediate-field carrier.** This is the exact entry
point required by Counting Totally Ramified Extensions: its intermediate field acquires the
spectral-norm structure without first postulating topology or valuation instances. Tau Ceti's
`TauCeti.finiteIntermediateFieldNormedField`
(`TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean`), consumed by reducible
alias. -/
noncomputable abbrev finiteIntermediateFieldNormedField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : NormedField M :=
  TauCeti.finiteIntermediateFieldNormedField K Ω M

/-- **Layer 0.III, valuative relation on a finite intermediate-field carrier.** Tau Ceti's
`TauCeti.finiteIntermediateFieldValuativeRel`, consumed by reducible alias. -/
noncomputable abbrev finiteIntermediateFieldValuativeRel
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : ValuativeRel M :=
  TauCeti.finiteIntermediateFieldValuativeRel K Ω M

/-- **Layer 0.III, spectral-norm topology on a finite intermediate-field carrier.** Tau Ceti's
`TauCeti.finiteIntermediateFieldTopology`, consumed by reducible alias. -/
noncomputable abbrev finiteIntermediateFieldTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : TopologicalSpace M :=
  TauCeti.finiteIntermediateFieldTopology K Ω M

/-- **Layer 0.III, compatibility of the intermediate-field adapter with the base valuation.** Tau
Ceti's `TauCeti.finiteIntermediateField_valuativeExtension`. -/
theorem finiteIntermediateField_valuativeExtension
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    letI := finiteIntermediateFieldValuativeRel K Ω M
    ValuativeExtension K M :=
  TauCeti.finiteIntermediateField_valuativeExtension K Ω M

/-- **Layer 0.III, the intermediate-field adapter carries the valuative topology.** Tau Ceti's
`TauCeti.finiteIntermediateField_isValuativeTopology`. -/
theorem finiteIntermediateField_isValuativeTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsValuativeTopology M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  TauCeti.finiteIntermediateField_isValuativeTopology K Ω M

/-- **Layer 0.III, local-field theorem for a finite intermediate-field carrier.** Tau Ceti's
`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`. -/
theorem finiteIntermediateField_isNonarchimedeanLocalField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsNonarchimedeanLocalField M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K Ω M

/-- **Layer 0, the ramification index**, defined without choosing a uniformizer: the index in
`Multiplicative ℤ` of the image of `Kˣ` under the normalized valuation of `L`. For a compatible
extension this image is the subgroup of multiples of `e`, and `e` is the positive integer by which
the map of normalized value groups multiplies; its characteristic property is
`normalizedValuation_algebraMap` below. Tau Ceti's `TauCeti.ramificationIndex`
(`TauCeti/NumberTheory/LocalField/RamificationIndex.lean`), consumed by reducible alias. Its body
reads only the normalized valuation of `L` and the algebra map, so those are its parameters; every
theorem about it assumes `ValuativeExtension K L`. -/
noncomputable abbrev ramificationIndex [Algebra K L] : ℕ :=
  TauCeti.ramificationIndex K L

/-- **Layer 0, the residue degree**, the dimension of the residue-field extension supplied by
`residueFieldAlgebra`. Tau Ceti's `TauCeti.inertiaDegree`
(`TauCeti/NumberTheory/LocalField/InertiaDegree.lean`), consumed by reducible alias. -/
noncomputable abbrev inertiaDegree [Algebra K L] [ValuativeExtension K L] : ℕ :=
  TauCeti.inertiaDegree K L

/-- **Layer 0, total ramification.** This is the canonical one-extension predicate consumed by
Counting Totally Ramified Extensions. An intermediate-field family wrapper must compare to it and must not contain an independent
definition of total ramification. -/
def IsTotallyRamified [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] : Prop :=
  ramificationIndex K L = Module.finrank K L

/-- **Layer 0, the characteristic property of `e`.** The normalized valuation of `L`
restricted along `K` is the `e`-th power of that of `K`. Stated for all `x`, so no uniformizer
is chosen; specializing to a uniformizer of `K` gives `v_L(π_K) = e`
(`TauCeti.normalizedValuation_algebraMap_irreducible`). Tau Ceti's
`TauCeti.normalizedValuation_algebraMap`; `TauCeti.ramificationIndex_eq_iff` says that `e` is the
only exponent with this property. -/
theorem normalizedValuation_algebraMap [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (x : Kˣ) :
    normalizedValuation L (Units.map (algebraMap K L : K →* L) x)
      = normalizedValuation K x ^ ramificationIndex K L :=
  TauCeti.normalizedValuation_algebraMap x

/-- **Layer 0, the characteristic property of `f`.** Tau Ceti's `TauCeti.natCard_residueField`. -/
theorem card_residueField [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ inertiaDegree K L :=
  TauCeti.natCard_residueField K L

/-- **Layer 0, `e · f = n`.** With positivity of both factors (`TauCeti.ramificationIndex_pos`,
`TauCeti.inertiaDegree_pos`) and multiplicativity in towers (`TauCeti.ramificationIndex_tower`,
`TauCeti.inertiaDegree_tower`), this is the fundamental identity of the layer. Tau Ceti's
`TauCeti.ramificationIndex_mul_inertiaDegree`, proved through the reconciliation with the
Dedekind-level pair (`TauCeti.ramificationIndex_eq_ramificationIdx`,
`TauCeti.inertiaDegree_eq_inertiaDeg`, and `TauCeti.primesOver_maximalIdeal_eq_singleton`: at a
local field `𝓂[K]` has the single prime `𝓂[L]` above it). -/
theorem ramificationIndex_mul_inertiaDegree [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    ramificationIndex K L * inertiaDegree K L = Module.finrank K L :=
  TauCeti.ramificationIndex_mul_inertiaDegree K L

/-- **Layer 0, residue-degree characterization of total ramification.** This is the stable
one-extension bridge consumed by `MassFormula`; a family-level intermediate-field wrapper
must compare to this theorem rather than define a second ramification predicate. No dependency on
the consumer roadmap is introduced here. A closed proof from `e · f = n` and `0 < e`. -/
theorem isTotallyRamified_iff_inertiaDegree_eq_one [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    IsTotallyRamified K L ↔ inertiaDegree K L = 1 := by
  have h := ramificationIndex_mul_inertiaDegree K L
  have he : 0 < ramificationIndex K L := TauCeti.ramificationIndex_pos
  refine ⟨fun ht => Nat.eq_of_mul_eq_mul_left he ?_, fun hf => ?_⟩
  · rw [mul_one]
    exact h.trans ht.symm
  · rw [hf, mul_one] at h
    exact h

/-- **Layer 0, the valuation of a natural-number cast.** The nonzero proof is part of the input;
there is no equal-characteristic junk branch. This is the general quantity in power-class
formulas and wild-different bounds: the decoded normalized valuation `v_K((n : K))`. Tau Ceti's
`TauCeti.natCastValuation` (`TauCeti/NumberTheory/LocalField/NatCastValuation.lean`), consumed by
reducible alias. -/
noncomputable abbrev natCastValuation (n : ℕ) (hn : (n : K) ≠ 0) : ℕ :=
  TauCeti.natCastValuation K n hn

/-- **Layer 0, the characteristic property of `natCastValuation`.** Its value is a natural
number, so the equation also records that the natural-number cast lies in `𝒪[K]`. Tau Ceti's
`TauCeti.normalizedValuation_natCast`. -/
theorem normalizedValuation_natCast (n : ℕ) (hn : (n : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (n : K) hn)
      = Multiplicative.ofAdd (natCastValuation K n hn : ℤ) :=
  TauCeti.normalizedValuation_natCast K n hn

/-- **Layer 0, the vanishing criterion for a natural-number cast.** Tau Ceti's
`TauCeti.natCastValuation_eq_zero_iff`. -/
theorem natCastValuation_eq_zero_iff (n : ℕ) (hn : (n : K) ≠ 0) :
    natCastValuation K n hn = 0 ↔ IsUnit (n : ↥𝒪[K]) :=
  TauCeti.natCastValuation_eq_zero_iff K n hn

/-- **Layer 0, the absolute ramification index.** This name is reserved for a finite
mixed-characteristic extension `K/ℚ_p`; definitionally it is the relative ramification index
`ramificationIndex ℚ_[p] K`. Tau Ceti's `TauCeti.absoluteRamificationIndex`
(`TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean`), which bundles the three
instances below as `TauCeti.FinitePadicExtension K p`; the instance
`TauCeti.FinitePadicExtension.ofInstances` supplies it from them, so this adapter takes them
separately, as every statement of this roadmap does. -/
noncomputable abbrev absoluteRamificationIndex (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K] : ℕ :=
  TauCeti.absoluteRamificationIndex K p

/-- **Layer 0, comparison with the valuation of the residue prime.** Tau Ceti's
`TauCeti.absoluteRamificationIndex_eq_natCastValuation`; the nonvanishing proof is an argument
here, and any two proofs of it give the same value. -/
theorem absoluteRamificationIndex_eq_natCastValuation (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (hp : (p : K) ≠ 0) :
    absoluteRamificationIndex K p = natCastValuation K p hp :=
  TauCeti.absoluteRamificationIndex_eq_natCastValuation K p

/-! ## Layer 1: units, the filtration, and the multiplicative group -/

/-- **Layer 1, the unit filtration** as an object: `U(K,0) = 𝒪[K]ˣ` and
`U(K,i) = 1 + 𝓂[K]^i` for `i ≥ 1`, a decreasing family of open compact subgroups of `Kˣ`
indexed by `ℕ`. The depth-zero branch is part of the definition, not a special case bolted on
afterwards. Tau Ceti's `TauCeti.unitFiltration`
(`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`), consumed by reducible alias. -/
noncomputable abbrev unitFiltration (i : ℕ) : Subgroup Kˣ :=
  TauCeti.unitFiltration K i

/-- **Layer 1, membership at depth `0`:** the units of `𝒪[K]` inside `Kˣ`. Tau Ceti's
`TauCeti.mem_unitFiltration_zero`. -/
theorem mem_unitFiltration_zero (x : Kˣ) :
    x ∈ unitFiltration K 0 ↔ valuation K (x : K) = 1 :=
  TauCeti.mem_unitFiltration_zero x

/-- **Layer 1, membership at positive depth, congruence form:** `x ≡ 1 mod 𝓂[K]^i` for a unit
`x` of `𝒪[K]`. Tau Ceti's `TauCeti.mem_unitFiltration_succ_congr`. -/
theorem mem_unitFiltration_succ_congr (i : ℕ) (u : (↥𝒪[K])ˣ) :
    Units.map (Subring.subtype 𝒪[K]).toMonoidHom u ∈ unitFiltration K (i + 1) ↔
      (u : ↥𝒪[K]) - 1 ∈ 𝓂[K] ^ (i + 1) :=
  TauCeti.mem_unitFiltration_succ_congr i u

/-- **Layer 1, membership at positive depth, valuation form:** an inequality on `x − 1`,
measured against a uniformizer. Both forms get used; they are proved equivalent once. Tau Ceti's
`TauCeti.mem_unitFiltration_succ_valuation`. -/
theorem mem_unitFiltration_succ_valuation (i : ℕ) (x : Kˣ) (π : 𝒪[K]) (hπ : Irreducible π) :
    x ∈ unitFiltration K (i + 1) ↔
      valuation K ((x : K) - 1) ≤ valuation K ((π : K) ^ (i + 1)) :=
  TauCeti.mem_unitFiltration_succ_valuation i x π hπ

/-- **Layer 1, the filtration is decreasing.** Tau Ceti's `TauCeti.unitFiltration_antitone`. -/
theorem unitFiltration_antitone : Antitone (unitFiltration K) :=
  TauCeti.unitFiltration_antitone

/-- **Layer 1, covariant unit-filtration map.** The algebra map scales depth by the
ramification index. This is distinct from the contravariant, Herbrand-shifted norm theorem
`map_norm_unitFiltration_psiNat_le` in Layer 3. Tau Ceti's `TauCeti.map_unitFiltration_le`
(`TauCeti/NumberTheory/LocalField/UnitFiltration/Map.lean`). -/
theorem map_unitFiltration_le [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (i : ℕ) :
    Subgroup.map (Units.map (algebraMap K L : K →* L)) (unitFiltration K i)
      ≤ unitFiltration L (ramificationIndex K L * i) :=
  TauCeti.map_unitFiltration_le K L i

/-- **Layer 1, the filtration separates points**, which with openness makes it a neighborhood
basis of `1` in `Kˣ`. Tau Ceti's `TauCeti.iInf_unitFiltration`. -/
theorem iInf_unitFiltration : ⨅ i, unitFiltration K i = ⊥ :=
  TauCeti.iInf_unitFiltration

/-- **Layer 1, the Teichmüller section**: the canonical multiplicative section of reduction,
characterized by `teichmuller_section` below together with the uniqueness statement that it is
the only multiplicative section (`TauCeti.eq_teichmuller`) and that its image is the
`(q−1)`-torsion of `𝒪[K]ˣ`, that is `μ_{q−1}(K)` (`TauCeti.range_teichmuller`). Tau Ceti's
`TauCeti.teichmuller 𝒪[K]` (`TauCeti/RingTheory/Henselian/Teichmuller.lean`), the lift of a
Henselian local ring with finite residue field, consumed by reducible alias; `𝒪[K]` is Henselian by
Tau Ceti's instance `TauCeti.henselianLocalRing_integer`, which is where the topology and the
local-field hypothesis of `K` enter. Its zero-preserving extension `𝓀[K] →*₀ 𝒪[K]` is Tau Ceti's
`TauCeti.teichmullerLift`, which agrees with it on units (`TauCeti.coe_teichmuller_apply`). -/
noncomputable abbrev teichmuller : (𝓀[K])ˣ →* (↥𝒪[K])ˣ :=
  TauCeti.teichmuller 𝒪[K]

/-- **Layer 1.** The Teichmüller map is a section of reduction. Tau Ceti's
`TauCeti.unitsMap_residue_teichmuller`. -/
theorem teichmuller_section (x : (𝓀[K])ˣ) :
    Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (teichmuller K x) = x :=
  TauCeti.unitsMap_residue_teichmuller 𝒪[K] x

/-- **Layer 1, the multiplicative decomposition.** A choice of uniformizer `π`, an element of
normalized valuation one, splits `Kˣ ≅ ℤ × U(K,0)`: every element of `Kˣ` is uniquely `π^n · u`
with `u ∈ U(K,0) = 𝒪[K]ˣ`. Tau Ceti's `TauCeti.existsUnique_eq_zpow_mul`, the uniqueness in the
topological isomorphism `TauCeti.unitsEquivIntProd`. (With the Teichmüller milestone this refines
to `Kˣ ≅ π^ℤ × μ_{q−1} × U(K,1)`, which is Tau Ceti's `TauCeti.unitFiltrationZeroEquivProd` on the
second factor, and `U(K,1)` is pro-`p`, in the quotient form that `TauCeti.IsProP`
unfolds to.) -/
theorem existsUnique_eq_zpow_mul (π : Kˣ) (hπ : normalizedValuation K π = Multiplicative.ofAdd 1) (x : Kˣ) :
    ∃! p : ℤ × unitFiltration K 0, x = π ^ p.1 * p.2 :=
  TauCeti.existsUnique_eq_zpow_mul hπ x

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
The inverse of Tau Ceti's logarithmic equivalence; the strict depth inequality excludes torsion. -/
noncomputable abbrev deepUnitExpLogEquiv (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Multiplicative ↥(𝓂[K] ^ i) ≃ₜ* unitFiltration K i :=
  (TauCeti.deepUnitExpLogEquiv K hi).symm

/-- **Layer 1, evaluation of the deep-unit exponential.** -/
theorem coe_deepUnitExpLogEquiv_apply (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (x : Multiplicative ↥(𝓂[K] ^ i)) :
    ((deepUnitExpLogEquiv K p i hi x : Kˣ) : K) =
      localExponential K ((x.toAdd : 𝒪[K]) : K) :=
  TauCeti.coe_deepUnitExpLogEquiv_symm_apply hi x

/-- **Layer 1, evaluation of the inverse as the deep-unit logarithm.** -/
theorem coe_deepUnitExpLogEquiv_symm_apply (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (u : unitFiltration K i) :
    (((deepUnitExpLogEquiv K p i hi).symm u).toAdd : K) =
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

/-- **Layer 1, power classes in the prime-to-residue-characteristic regime.** If `n` is a unit
in the valuation ring, the count is exact and holds in either characteristic: the factor
`q ^ natCastValuation K n` of the general formula is `1`
(`TauCeti.natCastValuation_eq_zero_of_isUnit`), which is where the hypothesis is used. Tau Ceti's
`TauCeti.card_powerClasses_of_isUnit` (`TauCeti/NumberTheory/LocalField/PowerSubgroup.lean`). -/
theorem card_powerClasses_of_isUnit (n : ℕ) (_hn : n ≠ 0) (hn' : IsUnit (n : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K) :=
  TauCeti.card_powerClasses_of_isUnit hn'

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

/-- **Layer 1, openness of the power subgroup in mixed characteristic.** Tau Ceti's
`TauCeti.isOpen_range_powMonoidHom`, since `n ≠ 0` in a field of characteristic zero. -/
theorem isOpen_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[p] K).injective
  TauCeti.isOpen_range_powMonoidHom (Nat.cast_ne_zero.mpr _hn)

/-- **Layer 1, finite index away from the residue characteristic.** This is derived from
`card_powerClasses_of_isUnit`, independently of the openness proof. Tau Ceti's
`TauCeti.finiteIndex_range_powMonoidHom_of_isUnit`. -/
theorem finiteIndex_range_powMonoidHom_of_isUnit (n : ℕ) (_hn : n ≠ 0)
    (hn' : IsUnit (n : ↥𝒪[K])) :
    (powMonoidHom n : Kˣ →* Kˣ).range.FiniteIndex :=
  TauCeti.finiteIndex_range_powMonoidHom_of_isUnit hn'

/-- **Layer 1, finite index in mixed characteristic.** This is derived from
`card_powerClasses_mixed`, not from openness. -/
theorem finiteIndex_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    (powMonoidHom n : Kˣ →* Kˣ).range.FiniteIndex :=
  have : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[p] K).injective
  TauCeti.finiteIndex_range_powMonoidHom (Nat.cast_ne_zero.mpr _hn)

/-- **Layer 1, the square classes away from residue characteristic `2`.** The specialization of
`card_powerClasses_of_isUnit` at `n = 2`: the hypothesis makes `2` invertible in `𝒪[K]`, hence
in `K`, so `μ_2(K) = {±1}` has order `2` and the count is `2 · 2 · 1`. Tau Ceti's
`TauCeti.card_squareClasses_of_isUnit`. -/
theorem card_squareClasses_of_isUnit (h2 : IsUnit (2 : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range) = 4 :=
  TauCeti.card_squareClasses_of_isUnit h2

/-- **Layer 1, the square classes at residue characteristic `2`, in the `4 · q^e` form.** The
specialization of `card_powerClasses_mixed` at `p = n = 2`, with `q = Nat.card 𝓀[K]` and
`e = absoluteRamificationIndex K 2`. It is `2 · #μ_2(K) · q^e` with `#μ_2(K) = 2`, and
`q ^ e = Nat.card (𝒪[K] ⧸ 2𝒪[K])`. For `K/ℚ_2` of degree `N` it reads `2 ^ (N + 2)`, and at
`K = ℚ_2` it reads `8`. ⚠ The factor `q ^ e` is not `1` here, so this is not the count of
`card_squareClasses_of_isUnit` with a different proof; the two hypotheses are exclusive. -/
theorem card_squareClasses_dyadic [Algebra ℚ_[2] K] [ValuativeExtension ℚ_[2] K]
    [Module.Finite ℚ_[2] K] :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range)
      = 4 * Nat.card 𝓀[K] ^ absoluteRamificationIndex K 2 :=
  TauCeti.card_squareClasses_dyadic

omit [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] in
/-- **Layer 1, the two spellings of the square classes.** Mathlib's `Subgroup.square Kˣ` is the
subgroup of squares, and the counts above are stated at the range of `powMonoidHom`. This is the
identification at `n = 2`, and it is what lets a consumer read the count of this layer, and
`ProfiniteCohomology.kummerIso`, on `Subgroup.square Kˣ`. Tau Ceti's
`TauCeti.square_eq_range_powMonoidHom`, for any commutative group. -/
theorem square_eq_range_powMonoidHom :
    Subgroup.square Kˣ = (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  TauCeti.square_eq_range_powMonoidHom

/-- **Layer 1, worked example: `ℚ_2ˣ/(ℚ_2ˣ)²` has order 8** (the classes of `−1, 2, 5`
generate). The odd-`p` count is `4`; this factor-of-two dyadic difference is why no layer may
assume `p ≠ 2`. -/
theorem card_squareClasses_padic_two : Nat.card (ℚ_[2]ˣ ⧸ (powMonoidHom 2 : ℚ_[2]ˣ →* ℚ_[2]ˣ).range) = 8 :=
  TauCeti.card_squareClasses_padic_two

/-- **Layer 1, the local square theorem, sharp form.** For `K/ℚ_2` finite and
`e = absoluteRamificationIndex K 2`, every unit of depth `2e+1` is a square. ⚠ This is **not** an
instance of the counts above, which decide how many square classes there are and not which
subgroup lies inside the squares. The mixed-characteristic hypothesis is part of the type; there
is no equal-characteristic value of `absoluteRamificationIndex`. A closed proof: Tau Ceti's
`TauCeti.unitFiltration_le_range_powMonoidHom_two`, read through
`absoluteRamificationIndex_eq_natCastValuation`. -/
theorem unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    unitFiltration K (2 * absoluteRamificationIndex K 2 + 1)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range := by
  rw [absoluteRamificationIndex, TauCeti.absoluteRamificationIndex_eq_natCastValuation K 2]
  exact TauCeti.unitFiltration_le_range_powMonoidHom_two _

/-- **Layer 1, sharpness of the local square theorem.** The threshold `2e+1` cannot be lowered,
over any finite extension of `ℚ_2` and not only over `ℚ_2`: `U(K, 2e)` always meets the
complement of the squares. The obstruction is the Artin–Schreier map `t ↦ t² + t` of `𝓀[K]`,
which is `𝔽_2`-linear with kernel `𝔽_2` and therefore has image of index `2`; since
`𝓂[K]^{2e} = 4 · 𝒪[K]`, a unit `1 + 4c` is a square exactly when the residue of `c` is in that
image, so any `c` outside it is a witness. A closed proof: Tau Ceti's
`TauCeti.not_unitFiltration_le_range_powMonoidHom_two`, read through
`absoluteRamificationIndex_eq_natCastValuation`. -/
theorem not_unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    ¬ unitFiltration K (2 * absoluteRamificationIndex K 2)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range := by
  rw [absoluteRamificationIndex, TauCeti.absoluteRamificationIndex_eq_natCastValuation K 2]
  exact TauCeti.not_unitFiltration_le_range_powMonoidHom_two _

/-! ### The dyadic statements, indexed uniformly

⚠ The three theorems above are stated for a finite extension of `ℚ_2`, because
`absoluteRamificationIndex K 2` is reserved for that case — its signature demands
`[Algebra ℚ_[2] K]`. That makes them **unusable in odd residue characteristic**, where the
intended reading of `e = v_K(2)` is simply `0`: a consumer splitting on `e = 0` versus `e ≠ 0`
cannot even write the hypothesis. The uniform forms below are indexed by `natCastValuation K 2`,
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
noncomputable abbrev frobeniusAlgEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] (h : ramificationIndex K L = 1) : L ≃ₐ[K] L :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.frobeniusAlgEquiv (K := K) (L := L)

/-- **Layer 2, the characteristic property of Frobenius:** `σ(y) ≡ y^q mod 𝓂[L]` on `𝒪[L]`,
with `q = Nat.card 𝓀[K]`. This is the equation that fixes `frobeniusAlgEquiv`, and it is stated
on the valuation rather than on the residue field so that it needs no separate name for the
induced action on `𝓀[L]`; `valuation L x < 1` is membership in `𝓂[L]`. Tau Ceti's
`TauCeti.valuation_frobeniusAlgEquiv_sub_pow`. -/
theorem valuation_frobeniusAlgEquiv_sub_pow [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (h : ramificationIndex K L = 1) (y : ↥𝒪[L]) :
    valuation L (frobeniusAlgEquiv K L h (y : L) - (y : L) ^ Nat.card 𝓀[K]) < 1 :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.valuation_frobeniusAlgEquiv_sub_pow y

/-- **The norm group** `N_{L/K}(Lˣ) : Subgroup Kˣ`, the image of the field norm on units. Layer 2
computes it for `L/K` unramified; `ClassFieldTheory.normResidue` and `conductorExponent` consume it
for finite abelian extensions. Tau Ceti's `TauCeti.normGroup`
(`TauCeti/RingTheory/Norm/Units.lean`), the range of `TauCeti.Algebra.normUnits K`, consumed by
reducible alias. -/
noncomputable abbrev normGroup [Algebra K L] [Module.Finite K L] : Subgroup Kˣ :=
  TauCeti.normGroup K L

/-- **Layer 2, the normalized valuation of a norm for every finite compatible extension.**
The residue degree multiplies the additive normalized valuation, independently of ramification. -/
theorem normalizedValuation_norm [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (x : Lˣ) :
    normalizedValuation K (TauCeti.Algebra.normUnits K x) =
      normalizedValuation L x ^ inertiaDegree K L :=
  TauCeti.normalizedValuation_norm x

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

/-- **Layer 2, the unramified norm group in norm-equation form.** `N_{L/K}(Lˣ) = π^{fℤ} × 𝒪[K]ˣ`,
stated as the solvability criterion for the norm equation `N_{L/K}(y) = x`: with `e = 1` the
valuation of a norm is `f · v_L(y)` (`TauCeti.normalizedValuation_norm`), and units are norms by
the milestone above, so `x` is a norm exactly when `f` divides `v_K(x)`. ⚠ `f` here is
`inertiaDegree K L`, the residue degree of Layer 0, and never a conductor. Tau Ceti's
`TauCeti.mem_normGroup_iff_dvd_normalizedValuation`. -/
theorem mem_normGroup_iff_dvd_normalizedValuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (h : ramificationIndex K L = 1) (x : Kˣ) :
    x ∈ normGroup K L ↔
      (inertiaDegree K L : ℤ) ∣ Multiplicative.toAdd (normalizedValuation K x) :=
  haveI := (TauCeti.isUnramified_iff_ramificationIndex_eq_one K L).2 h
  TauCeti.mem_normGroup_iff_dvd_normalizedValuation

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

/-! ### Layer 2: the canonical maximal unramified extension -/

/-- **Layer 2, the maximal unramified extension** inside `Ω`, as an intermediate field. -/
noncomputable abbrev maximalUnramifiedExtension (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (Ω : Type v) [Field Ω] [Algebra K Ω] :
    IntermediateField K Ω :=
  TauCeti.maximalUnramifiedExtension K Ω

/-- **Layer 2, the arithmetic Frobenius of the maximal unramified extension.** -/
noncomputable abbrev maximalUnramifiedFrobenius (Ω : Type v) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] : Gal(maximalUnramifiedExtension K Ω/K) :=
  TauCeti.maximalUnramifiedFrobenius K Ω

/-- **Layer 2, the canonical topological identification of the unramified Galois group
with the profinite integers in the matching universe.** -/
noncomputable abbrev maximalUnramifiedGaloisGroupEquivZHat (Ω : Type v) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] : Gal(maximalUnramifiedExtension K Ω/K) ≃ₜ* TauCeti.zHat.{max u v} :=
  TauCeti.maximalUnramifiedGaloisGroupEquivZHat K Ω

/-- **Layer 2, arithmetic Frobenius maps to the canonical generator of the profinite integers.** -/
@[simp]
theorem maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius (Ω : Type v) [Field Ω]
    [Algebra K Ω] [IsSepClosed Ω] :
    maximalUnramifiedGaloisGroupEquivZHat K Ω (maximalUnramifiedFrobenius K Ω) =
      TauCeti.zHat.gen :=
  TauCeti.maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius K Ω

/-! ## Layer 3: ramification, the lower filtration, and the local different -/

/-- **Layer 3, the canonical lower-numbering filtration**
`G_i = {σ | ∀ x ∈ 𝒪[L], σ x − x ∈ 𝓂[L]^{i+1}}`. The integer-indexed family is total; the theorem
below fixes the convention at negative indices. Number-Field Arithmetic imports this
definition for its global/local comparison rather than defining a second filtration. Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroup`
(`TauCeti/NumberTheory/LocalField/RamificationGroup.lean`), consumed by reducible alias; Tau Ceti
defines it for every finite `L/K`, and this roadmap states it for `L/K` Galois. -/
noncomputable abbrev lowerRamificationGroup [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) : Subgroup (L ≃ₐ[K] L) :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i

/-- **Layer 3, the negative-index convention.** `G_i = G` for every `i ≤ -1`. Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroup_eq_top_of_le_neg_one`. -/
theorem lowerRamificationGroup_eq_top_of_le_neg_one [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) (hi : i ≤ -1) :
    lowerRamificationGroup K L i = ⊤ :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroup_eq_top_of_le_neg_one K L hi

/-- **Layer 3, the lower filtration is decreasing.** Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroup_antitone`. -/
theorem lowerRamificationGroup_antitone [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    Antitone (lowerRamificationGroup K L) :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroup_antitone K L

/-- **Layer 3, real indexing for Herbrand theory**, `G_u = G_{⌈u⌉}`. The ceiling convention makes
the step family constant on `(i-1,i]`, hence left-continuous in the usual informal sense. We pin
the interval identity below rather than assert a topological continuity theorem on subgroup
values. Tau Ceti's `TauCeti.LocalFieldsRamification.lowerRamificationGroupReal`, consumed by
reducible alias. -/
noncomputable abbrev lowerRamificationGroupReal [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : ℝ) : Subgroup (L ≃ₐ[K] L) :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroupReal K L u

/-- **Layer 3, agreement of integer and real indexing.** Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroupReal_intCast`. -/
theorem lowerRamificationGroupReal_intCast [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) :
    lowerRamificationGroupReal K L (i : ℝ) = lowerRamificationGroup K L i :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroupReal_intCast K L i

/-- **Layer 3, the interval selected by ceiling indexing.** Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroupReal_eq_of_sub_one_lt_of_le`. -/
theorem lowerRamificationGroupReal_eq_of_sub_one_lt_of_le [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    (i : ℤ) (u : ℝ) (hleft : (i : ℝ) - 1 < u) (hright : u ≤ (i : ℝ)) :
    lowerRamificationGroupReal K L u = lowerRamificationGroup K L i :=
  TauCeti.LocalFieldsRamification.lowerRamificationGroupReal_eq_of_sub_one_lt_of_le K L hleft
    hright

/-- **Layer 3, the genuine domain of Herbrand theory.** Keeping `[-1,∞)` in the type prevents
global-function equalities from making accidental claims about arbitrary values below `-1`. Tau
Ceti's `TauCeti.LocalFieldsRamification.RamificationIndexDomain`
(`TauCeti/NumberTheory/LocalField/Herbrand.lean`), consumed by reducible alias. -/
abbrev RamificationIndexDomain : Set ℝ :=
  TauCeti.LocalFieldsRamification.RamificationIndexDomain

/-- **Layer 3, Herbrand and inverse Herbrand as one order isomorphism.** Its forward map is
`φ_{L/K}(u) = ∫_0^u dt/[G_0 : G_t]` (`TauCeti.LocalFieldsRamification.coe_herbrand`) and its
inverse is `ψ_{L/K}`. Tau Ceti's `TauCeti.LocalFieldsRamification.herbrandOrderIso`, built from the
lower ramification groups above, consumed by reducible alias. -/
noncomputable abbrev herbrandOrderIso [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain ≃o RamificationIndexDomain :=
  TauCeti.LocalFieldsRamification.herbrandOrderIso K L

/-- **Layer 3, the Herbrand function on its mathematical domain**, the forward map of
`herbrandOrderIso`. Tau Ceti's `TauCeti.LocalFieldsRamification.herbrand`, consumed by reducible
alias; Tau Ceti proves that it is continuous, strictly increasing and concave, the identity on
`[-1, 0]`, and given at integers by the finite-sum formula
(`TauCeti.LocalFieldsRamification.coe_herbrand_of_coe_eq_natCast`). -/
noncomputable abbrev herbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain → RamificationIndexDomain :=
  TauCeti.LocalFieldsRamification.herbrand K L

/-- **Layer 3, the inverse Herbrand function on its mathematical domain**, the inverse of
`herbrandOrderIso`. Tau Ceti's `TauCeti.LocalFieldsRamification.inverseHerbrand`, consumed by
reducible alias. -/
noncomputable abbrev inverseHerbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain → RamificationIndexDomain :=
  TauCeti.LocalFieldsRamification.inverseHerbrand K L

/-- **Layer 3, `φ (ψ u) = u`.** Tau Ceti's
`TauCeti.LocalFieldsRamification.herbrand_inverseHerbrand`. -/
theorem herbrand_inverseHerbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    herbrand K L (inverseHerbrand K L u) = u :=
  TauCeti.LocalFieldsRamification.herbrand_inverseHerbrand K L u

/-- **Layer 3, `ψ (φ u) = u`.** Tau Ceti's
`TauCeti.LocalFieldsRamification.inverseHerbrand_herbrand`. -/
theorem inverseHerbrand_herbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    inverseHerbrand K L (herbrand K L u) = u :=
  TauCeti.LocalFieldsRamification.inverseHerbrand_herbrand K L u

/-- **Layer 3, the upper-numbering filtration** `G^u = G_{ψ(u)}`. Tau Ceti's
`TauCeti.LocalFieldsRamification.upperRamificationGroup`, consumed by reducible alias; Tau Ceti
proves `G^{φ(u)} = G_u` (`TauCeti.LocalFieldsRamification.upperRamificationGroup_herbrand`),
antitonicity and normality. -/
noncomputable abbrev upperRamificationGroup [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    Subgroup (L ≃ₐ[K] L) :=
  TauCeti.LocalFieldsRamification.upperRamificationGroup K L u

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

/-- **Layer 3, tower transitivity for Herbrand.** The order is
`φ_{M/K} = φ_{L/K} ∘ φ_{M/L}`. -/
theorem herbrand_tower
    (M : Type w) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra L M] [ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]
    [IsScalarTower K L M] :
    herbrandOrderIso K M = (herbrandOrderIso L M).trans (herbrandOrderIso K L) :=
  TauCeti.LocalFieldsRamification.herbrand_tower K L M

/-- **Layer 3, tower transitivity for inverse Herbrand.** Inversion reverses the composite:
`ψ_{M/K} = ψ_{M/L} ∘ ψ_{L/K}`. -/
theorem inverseHerbrand_tower
    (M : Type w) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra L M] [ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]
    [IsScalarTower K L M] :
    (herbrandOrderIso K M).symm =
      (herbrandOrderIso K L).symm.trans (herbrandOrderIso L M).symm :=
  TauCeti.LocalFieldsRamification.inverseHerbrand_tower K L M

/-- **Layer 3, integral inverse-Herbrand depth**: `ψℕ_{L/K}(n) = ⌊ψ_{L/K}(n)⌋₊`, read on the
canonical `inverseHerbrand`. The floor only moves the value into `ℕ`; the milestone is
`coe_psiNat`, that `ψ_{L/K}(n)` is already a natural number, so that nothing is rounded. -/
noncomputable abbrev psiNat [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (n : ℕ) : ℕ :=
  TauCeti.LocalFieldsRamification.psiNat K L n

/-- **Layer 3, characterization of the integral inverse-Herbrand depth**: `ψ_{L/K}(n)` is a
natural number, equal to `psiNat K L n`. -/
theorem coe_psiNat [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (n : ℕ) :
    (psiNat K L n : ℝ) =
      (inverseHerbrand K L
        ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩ : ℝ) :=
  TauCeti.LocalFieldsRamification.coe_psiNat K L n

/-- **Layer 3, tower transitivity for integral depths.** -/
theorem psiNat_tower
    (M : Type w) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra L M] [ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]
    [IsScalarTower K L M] :
    psiNat K M = psiNat L M ∘ psiNat K L :=
  TauCeti.LocalFieldsRamification.psiNat_tower K L M

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

/-- **Layer 3, a graded piece of the unit filtration**, `U(K,i)/U(K,i+1)`. Tau Ceti's
`TauCeti.UnitFiltrationGraded`, consumed by reducible alias. -/
abbrev UnitFiltrationGraded (i : ℕ) : Type u :=
  TauCeti.UnitFiltrationGraded K i

/-- **Layer 3, the norm on Herbrand-shifted graded pieces.** -/
noncomputable abbrev normGradedMap [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (v : ℕ) :
    UnitFiltrationGraded L (psiNat K L v) →* UnitFiltrationGraded K v :=
  TauCeti.normGradedMap K L v

/-- **Layer 3, the graded norm sends a unit class to the class of its field norm.** -/
theorem normGradedMap_mk [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] {v : ℕ}
    (x : unitFiltration L (psiNat K L v)) :
    normGradedMap K L v (QuotientGroup.mk x) =
      QuotientGroup.mk ⟨TauCeti.Algebra.normUnits K (x : Lˣ),
        map_norm_unitFiltration_psiNat_le K L v (Subgroup.mem_map_of_mem _ x.2)⟩ :=
  TauCeti.normGradedMap_mk x

/-- **Layer 3, tame ramification.** The residue characteristic does not divide `e(L/K)`
(`TauCeti.isTamelyRamified_iff`). Tau Ceti's `TauCeti.IsTamelyRamified`
(`TauCeti/NumberTheory/LocalField/RamificationIndex.lean`), consumed by reducible alias. -/
abbrev IsTamelyRamified [Algebra K L] : Prop :=
  TauCeti.IsTamelyRamified K L

/-- **Layer 3, wild ramification.** The residue characteristic divides `e(L/K)`
(`TauCeti.isWildlyRamified_iff`), that is, `L/K` is not tamely ramified
(`TauCeti.not_isTamelyRamified_iff`). Tau Ceti's `TauCeti.IsWildlyRamified`, consumed by reducible
alias. -/
abbrev IsWildlyRamified [Algebra K L] : Prop :=
  TauCeti.IsWildlyRamified K L

/-- **Layer 3, an upper-numbering jump**: `u` is a jump of the upper filtration when
`G^v ≠ G^u` for every `v > u` (Serre LF IV §3). The upper filtration is antitone, so this says
that the group drops immediately after `u`. A nontrivial unramified extension has its only jump
at `-1`. -/
abbrev UpperJump [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) : Prop :=
  TauCeti.LocalFieldsRamification.UpperJump K L u

/-- **Layer 3, the tame prime-degree break at zero.** In a totally ramified Galois extension
of prime degree, the graded norm at the tame break is the `ℓ`-th power map on residue units.
Its kernel and cokernel both have order `ℓ`; this is deliberately separate from the positive
wild-break theorem below. -/
theorem normGradedMap_tame_break_zero [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (_htame : IsTamelyRamified K L)
    (_ht : UpperJump K L ⟨0, by norm_num⟩) :
    Nat.card (normGradedMap K L 0).ker = ℓ ∧
      Nat.card (UnitFiltrationGraded K 0 ⧸ (normGradedMap K L 0).range) = ℓ :=
  by
    have h := TauCeti.normGradedMap_tame_break_zero (K := K) (L := L) _htr _htame
    simpa only [_hdegree, Subgroup.index_eq_card] using h

/-- **Layer 3, depth zero before a positive prime-degree break.** The graded norm is residue
Frobenius and hence bijective. -/
theorem normGradedMap_zero_before_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (t : ℕ) (_htpos : 0 < t)
    (_ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Function.Bijective (normGradedMap K L 0) :=
  TauCeti.normGradedMap_zero_before_break (K := K) (L := L)
    (by simpa only [_hdegree] using (Fact.out : ℓ.Prime)) _htpos _ht

/-- **Layer 3, a positive depth strictly before a positive prime-degree break.** The graded
norm is additive residue Frobenius and hence bijective. -/
theorem normGradedMap_positive_before_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (v t : ℕ) (_hvpos : 0 < v) (_hvt : v < t)
    (_ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Function.Bijective (normGradedMap K L v) :=
  TauCeti.normGradedMap_positive_before_break (K := K) (L := L)
    (by simpa only [_hdegree] using (Fact.out : ℓ.Prime)) _hvt _ht

/-- **Layer 3, the positive prime-degree break calculation.** Here `IsGalois K L` and prime
degree supply cyclicity, while total ramification, `0 < t`, and the `UpperJump` witness exclude
the unramified and tame counterexamples. Only in this regime do the kernel and cokernel of the
graded norm both have order `ℓ`. -/
theorem normGradedMap_at_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (t : ℕ) (_htpos : 0 < t)
    (_ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Nat.card (normGradedMap K L t).ker = ℓ ∧
      Nat.card (UnitFiltrationGraded K t ⧸ (normGradedMap K L t).range) = ℓ :=
  by
    have h := TauCeti.normGradedMap_at_break (K := K) (L := L)
      (by simpa only [_hdegree] using (Fact.out : ℓ.Prime)) _htpos _ht
    simpa only [_hdegree, Subgroup.index_eq_card] using h

/-- **Layer 3, above a prime-degree break the graded norm is the trace on principal
units and is bijective.** This supplies the graded steps for successive approximation. -/
theorem normGradedMap_after_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (hdegree : Module.finrank K L = ℓ)
    (v t : ℕ) (hvt : t < v)
    (ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Function.Bijective (normGradedMap K L v) :=
  TauCeti.normGradedMap_after_break (K := K) (L := L)
    (by simpa only [hdegree] using (Fact.out : ℓ.Prime)) hvt ht

/-- **Layer 3, Hasse–Arf.** Every upper jump of a finite abelian Galois extension is integral. -/
theorem hasseArf [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (hcomm : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ)
    (u : RamificationIndexDomain) (hu : UpperJump K L u) :
    ∃ z : ℤ, (u : ℝ) = (z : ℝ) :=
  sorry

/-- **Layer 3, local monogenicity at the integer-ring level.** A finite separable extension of
local fields has `𝒪[L] = 𝒪[K][x]` for one integral element `x`. This is the exported form needed
by the different calculation and by the completed integer-ring comparison in Number-Field Arithmetic. -/
theorem exists_integerRing_adjoin_eq_top [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] :
    ∃ x : 𝒪[L], Algebra.adjoin 𝒪[K] {x} = ⊤ :=
  TauCeti.exists_integerRing_adjoin_eq_top K L

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

/-- **Layer 3, orthogonality of an Eisenstein power basis.** For an Eisenstein generator, the
values of the nonzero terms are distinct modulo the ramification index, so the valuation of the
sum is their minimum. In the totally ramified situation supplied by the Eisenstein hypotheses,
the ramification index is `f.natDegree`. This export is consumed by `MassFormula`, which owns
the coordinate-box and measure consequences. No dependency on that roadmap is introduced here. -/
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

/-- **Layer 3, the local different exponent** `d(L/K)`: the multiplicity of the maximal ideal of
`𝒪[L]` in Mathlib's relative different ideal `differentIdeal 𝒪[K] 𝒪[L]`; it is a local invariant,
not the global relative discriminant owned by Number-Field Arithmetic. Tau Ceti's
`TauCeti.differentExponent` (`TauCeti/NumberTheory/LocalField/Different/Basic.lean`), consumed by
reducible alias. It is defined for every compatible extension, and every theorem about it assumes
`Algebra.IsSeparable K L`: for `L/K` separable, `differentIdeal 𝒪[K] 𝒪[L] = 𝓂[L] ^ d(L/K)`
(`TauCeti.differentIdeal_eq_maximalIdeal_pow`). -/
noncomputable abbrev differentExponent [Algebra K L] [ValuativeExtension K L] : ℕ :=
  TauCeti.differentExponent K L

/-- **Layer 3, the local discriminant ideal** `𝔩(L/K)`, the relative norm to `𝒪[K]` of the local
different (`TauCeti.discriminantIdeal_def`). It is distinct from the different ideal, which is an
ideal of `𝒪[L]`, and from the global relative discriminant package owned by Number-Field Arithmetic. Tau Ceti's
`TauCeti.discriminantIdeal` (`TauCeti/NumberTheory/LocalField/Discriminant.lean`), consumed by
reducible alias. -/
noncomputable abbrev localDiscriminantIdeal [Algebra K L] [ValuativeExtension K L] :
    Ideal 𝒪[K] :=
  TauCeti.discriminantIdeal K L

/-- **Layer 3, the local discriminant exponent** `δ(L/K)`, the multiplicity of the maximal ideal of
the base in `localDiscriminantIdeal K L` (`TauCeti.discriminantExponent_def`), so that
`𝔩(L/K) = 𝓂[K] ^ δ(L/K)` (`TauCeti.discriminantIdeal_eq_maximalIdeal_pow`). Tau Ceti's
`TauCeti.discriminantExponent`, consumed by reducible alias; separability is an argument of the
definition. -/
noncomputable abbrev discriminantExponent [Algebra K L] [ValuativeExtension K L]
    [Algebra.IsSeparable K L] : ℕ :=
  TauCeti.discriminantExponent K L

/-- **Layer 3, comparison of local discriminant and different exponents**,
`δ(L/K) = f(L/K) · d(L/K)`. Tau Ceti's
`TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`. -/
theorem discriminantExponent_eq_inertiaDegree_mul_differentExponent
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    discriminantExponent K L = inertiaDegree K L * differentExponent K L :=
  TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent K L

/-- **Layer 3, invariance of the different exponent under a `K`-isomorphism.** The unique
extension of the valuation makes every `K`-algebra equivalence compatible with the maximal
ideals and the trace different. -/
theorem differentExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : differentExponent K L = differentExponent K M :=
  TauCeti.differentExponent_eq_of_algEquiv K L M e

/-- **Layer 3, invariance of the local discriminant exponent under a `K`-isomorphism.** This
export is consumed by `MassFormula`, which derives invariance of its mass-formula weight from
it. No dependency on that roadmap is introduced here. -/
theorem discriminantExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : discriminantExponent K L = discriminantExponent K M :=
  TauCeti.discriminantExponent_eq_of_algEquiv K L M e

/-- **Layer 3, Hilbert's local different formula.** The sum is finite because the lower
ramification groups are trivial at sufficiently large indices. -/
theorem differentExponent_eq_finsum_lowerRamificationGroup [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra.IsSeparable K L] :
    differentExponent K L =
      ∑ᶠ i : ℕ, (Nat.card (lowerRamificationGroup K L (i : ℤ)) - 1) :=
  TauCeti.differentExponent_eq_finsum_lowerRamificationGroup K L

/-- **Layer 3, the sharp lower bound and its equality criterion.** For a finite separable local
extension, `e(L/K) - 1 ≤ d(L/K)` (`TauCeti.ramificationIndex_sub_one_le_differentExponent`), with
equality exactly in the tame case; hence wild ramification forces `e(L/K) ≤ d(L/K)`
(`TauCeti.ramificationIndex_le_differentExponent_iff`). Tau Ceti's
`TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`. -/
theorem differentExponent_eq_ramificationIndex_sub_one_iff [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    differentExponent K L = ramificationIndex K L - 1 ↔ IsTamelyRamified K L :=
  TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff K L

/-- **Layer 3, wild different bounds.** The lower bound holds for every finite separable wild
extension, and is Tau Ceti's `TauCeti.ramificationIndex_le_differentExponent_iff`. The upper
bound uses the nonvanishing of `e` in `L`, excluding the equal-characteristic
case where its valuation is not finite. -/
theorem differentExponent_bounds_of_wild [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] (hwild : IsWildlyRamified K L)
    (he : (ramificationIndex K L : L) ≠ 0) :
    ramificationIndex K L ≤ differentExponent K L ∧
      differentExponent K L ≤ ramificationIndex K L - 1 +
        natCastValuation L (ramificationIndex K L) he :=
  TauCeti.differentExponent_bounds_of_wild hwild he

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
theorem tameCharacter_conj {G : Type w} [Group G] [MulSemiringAction G L]
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
proof from `tameCharacter_conj`. -/
theorem tameCharacter_conj_of_smul_eq_pow {G : Type w} [Group G] [MulSemiringAction G L]
    [IsInvariantSubring G 𝒪[L]] {ϖ : 𝒪[L]} (hϖ : Irreducible ϖ) (g σ : G)
    (hσ : σ ∈ TauCeti.IsLocalRing.ramificationGroup G 𝒪[L] (0 : ℤ)) {q : ℕ}
    (hg : ∀ x : 𝓀[L], g • x = x ^ q) :
    TauCeti.tameCharacter (G := G) hϖ
        ⟨g * σ * g⁻¹, Subgroup.Normal.conj_mem inferInstance σ hσ g⟩ =
      TauCeti.tameCharacter (G := G) hϖ ⟨σ, hσ⟩ ^ q :=
  Units.ext <| by rw [tameCharacter_conj hϖ g σ hσ, hg, Units.val_pow_eq_pow_val]

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

/-! ## Layer 4: the absolute Galois group, wild inertia, and the tame quotient

⚠ Profinite Sylow theory, free profinite groups and profinite presentations are **not** restated
here in Galois vocabulary: the Sylow theory uses Tau Ceti’s implementation of
`ProfiniteProPGroups`, and free
profinite groups and presentations from Tau Ceti (`TauCeti.freeProfiniteGroup`,
`TauCeti.presentedProfiniteGroup`). What this roadmap owns is the identification of the abstract
objects with the Galois-theoretic ones. -/

section Layer4

/- The local spellings below are reducible aliases or adapters to the canonical declarations. -/
open TauCeti

variable (p : ℕ) [Fact p.Prime]

omit [Fact p.Prime] in
/-- **Layer 1, `U(K,1)` is pro-`p`**, stated in exactly the supplier's quotient form: every
continuous finite quotient of the depth-one unit group is a `p`-group. ⚠ This is the same
statement as "`U(K,1)` is the inverse limit of the `p`-groups `U(K,1)/U(K,i)`", not a rephrasing
of it, which is why it is stated against `TauCeti.IsProP` and not against a local
predicate. `p` is the residue characteristic. -/
theorem unitFiltration_one_isProP (hp : ringChar 𝓀[K] = p) :
    TauCeti.IsProP p (unitFiltration K 1) :=
  TauCeti.unitFiltration_one_isProP (K := K) p hp

/-- **Layer 4, the maximal unramified extension** `K^ur = ⋃ K_n` inside the fixed ambient
algebraic closure: `maximalUnramifiedExtension` of Layer 2 at `Ω = AlgebraicClosure K`, under the
name `ClassFieldTheory` consumes. Layer 2's finite unramified extensions are its finite
subextensions. -/
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

/-- **Layer 4, the inertia subgroup fixing the maximal unramified extension.** -/
noncomputable abbrev inertiaSubgroup (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Subgroup (Field.absoluteGaloisGroup K) :=
  TauCeti.inertiaSubgroup K

/-- **Layer 4, inertia is closed in the Krull topology.** -/
theorem isClosed_inertiaSubgroup :
    IsClosed (inertiaSubgroup K : Set (Field.absoluteGaloisGroup K)) :=
  TauCeti.isClosed_inertiaSubgroup K

/-- **Layer 4, inertia is normal.** -/
instance inertiaSubgroup_normal : (inertiaSubgroup K).Normal :=
  TauCeti.inertiaSubgroup_normal K

/-- **Layer 4, the canonical inertia subgroup under the name used by ClassFieldTheory.** -/
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

/-- **Layer 4, restriction to the maximal unramified extension.** -/
noncomputable abbrev restrictMaximalUnramifiedHom :
    Field.absoluteGaloisGroup K →* Gal(maximalUnramifiedExtension K (AlgebraicClosure K)/K) :=
  TauCeti.restrictMaximalUnramifiedHom K

/-- **Layer 4, an arithmetic Frobenius lift restricts to the canonical arithmetic Frobenius.** -/
abbrev IsArithFrobeniusLift (σ : Field.absoluteGaloisGroup K) : Prop :=
  TauCeti.IsArithFrobeniusLift K σ

/-- **Layer 4, arithmetic Frobenius lifts exist.** -/
theorem exists_isArithFrobeniusLift :
    ∃ σ : Field.absoluteGaloisGroup K, IsArithFrobeniusLift K σ :=
  TauCeti.exists_isArithFrobeniusLift K

/-- **Layer 4, the canonical unramified quotient.** -/
abbrev unramifiedQuotient : Type u :=
  TauCeti.unramifiedQuotient K

/-- **Layer 4, the canonical quotient map to the unramified quotient.** -/
noncomputable abbrev unramifiedDegree :
    Field.absoluteGaloisGroup K →* unramifiedQuotient K :=
  TauCeti.unramifiedDegree K

/-- **Layer 4, restriction identifies the unramified quotient with the unramified Galois group.** -/
noncomputable abbrev quotientInertiaSubgroupEquiv :
    unramifiedQuotient K ≃ₜ* Gal(maximalUnramifiedExtension K (AlgebraicClosure K)/K) :=
  TauCeti.quotientInertiaSubgroupEquiv K

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
`Gal(K^al/K^t)`. -/
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
separable over `K`. In characteristic `0` it changes nothing. -/
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

/-- **Layer 4, the canonical tame character into the prime-to-residue-characteristic
Tate module.** It is independent of the uniformizer and of every choice of roots. -/
noncomputable abbrev inertiaTameCharacter :
    inertia K →ₜ* TauCeti.PrimeToPTateModule (ringChar 𝓀[K]) (AlgebraicClosure K) :=
  TauCeti.inertiaTameCharacter K

/-- **Layer 4, the tame character at a finite level is the uniformizer-root ratio.** -/
theorem coe_proj_inertiaTameCharacter_apply {σ : Field.absoluteGaloisGroup K}
    (hσ : σ ∈ inertia K) {π : Kˣ} (hπ : TauCeti.IsUniformizer K π)
    (m : {m : ℕ // m ≠ 0 ∧ m.Coprime (ringChar 𝓀[K])})
    {α : AlgebraicClosure K} (hα : α ^ (m : ℕ) = algebraMap K (AlgebraicClosure K) π) :
    ((TauCeti.PrimeToPTateModule.proj m (inertiaTameCharacter K ⟨σ, hσ⟩) :
      (AlgebraicClosure K)ˣ) : AlgebraicClosure K) = DFunLike.coe (F := Gal(AlgebraicClosure K/K)) σ α / α :=
  TauCeti.coe_proj_inertiaTameCharacter_apply hσ hπ m hα

/-- **Layer 4, the tame character identifies inertia modulo wild inertia with the Tate module.** -/
noncomputable abbrev quotientWildInertiaSubgroupEquiv :
    inertia K ⧸ (wildInertia K).subgroupOf (inertia K) ≃ₜ*
      TauCeti.PrimeToPTateModule (ringChar 𝓀[K]) (AlgebraicClosure K) :=
  TauCeti.quotientWildInertiaSubgroupEquiv K

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

/-- **Layer 4, the tame quotient** `G_K^t = G_K / P_K`. -/
abbrev tameQuotient : Type u :=
  Field.absoluteGaloisGroup K ⧸ wildInertia K

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

/-- **Layer 4, the Iwasawa relator** `σ τ σ⁻¹ τ^{−q}` in Tau Ceti's free profinite group on two
generators, with `q = #𝓀[K]` and `σ = of 0` the **arithmetic** Frobenius. ⚠ Writing `σ τ σ⁻¹ τ^q`
presents a different group, and writing `σ⁻¹ τ σ τ^{−q}` presents the geometric form
`iwasawaRelatorGeometric` below. The index type is `ULift (Fin 2)`, not `Fin 2`:
`TauCeti.freeProfiniteGroup X` lives in `X`'s universe and `G_K^t` lives in `K`'s. -/
noncomputable abbrev iwasawaRelator : TauCeti.freeProfiniteGroup (ULift.{u} (Fin 2)) :=
  TauCeti.iwasawaRelator K

/-- **Layer 4, the Iwasawa group** `⟨σ, τ | σ τ σ⁻¹ = τ^q⟩`: the **profinite** group presented by
`iwasawaRelator`, that is, the quotient of Tau Ceti's free profinite group by the *closed* normal
closure of the relator. ⚠ The presented pro-`p` group of the same shape is a different group: it
forgets the prime-to-`p` tame inertia this presentation is about. -/
abbrev IwasawaGroup : Type u :=
  TauCeti.IwasawaGroup K

/-- **Layer 4.** The marked generator `σ = of 0` of `IwasawaGroup K`, the image of the arithmetic
Frobenius. -/
noncomputable abbrev iwasawaSigma : IwasawaGroup K :=
  TauCeti.iwasawaSigma K

/-- **Layer 4.** The marked generator `τ = of 1` of `IwasawaGroup K`, the image of the tame
inertia generator. -/
noncomputable abbrev iwasawaTau : IwasawaGroup K :=
  TauCeti.iwasawaTau K

/-- **Layer 4, the canonical unramified coordinate of the Iwasawa presentation.**
It sends the Frobenius generator to `1 ∈ Ẑ` and the tame generator to zero. -/
noncomputable abbrev iwasawaCoordinate : IwasawaGroup K →ₜ* TauCeti.zHat.{u} :=
  TauCeti.iwasawaCoordinate K

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

/-- **Layer 4, the kernel of the unramified coordinate** is the closed normal closure of
the tame generator, by Tau Ceti's canonical presentation theorem. -/
theorem ker_iwasawaCoordinate :
    (iwasawaCoordinate K).toMonoidHom.ker =
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  TauCeti.ker_iwasawaCoordinate K

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
about it is a choice beyond `σ` and `τ`. -/
noncomputable abbrev tameQuotientEquiv (σ : Field.absoluteGaloisGroup K) (τ : inertia K)
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
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk σ) = iwasawaSigma K :=
  TauCeti.tameQuotientEquiv_toTameQuotient_frobenius hσ hτ

/-- **Layer 4.** The marked isomorphism sends the tame inertia generator `τ` to `of 1`. -/
@[simp]
theorem tameQuotientEquiv_mk_tameGenerator :
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K)) = iwasawaTau K :=
  TauCeti.tameQuotientEquiv_toTameQuotient_tameGenerator hσ hτ

/-- **Layer 4, acceptance: the two rules determine the marked isomorphism.** A closed proof through
Tau Ceti's `TauCeti.presentedProfiniteGroup.hom_ext_of`, applied to the inverses, which are
continuous homomorphisms into the tame quotient, Hausdorff by `wildInertia_isClosed`. -/
theorem tameQuotientEquiv_unique (e : tameQuotient K ≃ₜ* IwasawaGroup K) (he₀ : e (QuotientGroup.mk σ) = iwasawaSigma K)
    (he₁ : e (QuotientGroup.mk (τ : Field.absoluteGaloisGroup K)) = iwasawaTau K) : e = tameQuotientEquiv K σ τ hσ hτ := by
  have := wildInertia_isClosed K
  have h : (e.symm : IwasawaGroup K →ₜ* tameQuotient K) =
      ((tameQuotientEquiv K σ τ hσ hτ).symm : IwasawaGroup K →ₜ* tameQuotient K) := by
    refine presentedProfiniteGroup.hom_ext_of fun x => ?_
    rcases x with ⟨i⟩
    fin_cases i
    · change e.symm (iwasawaSigma K) = (tameQuotientEquiv K σ τ hσ hτ).symm (iwasawaSigma K)
      rw [(ContinuousMulEquiv.symm_apply_eq e).2 he₀.symm,
        (ContinuousMulEquiv.symm_apply_eq _).2
          (tameQuotientEquiv_mk_frobenius (hσ := hσ) (hτ := hτ)).symm]
    · change e.symm (iwasawaTau K) = (tameQuotientEquiv K σ τ hσ hτ).symm (iwasawaTau K)
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
    (tameInertia K).map (tameQuotientEquiv K σ τ hσ hτ).toMulEquiv.toMonoidHom =
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  TauCeti.map_tameQuotientEquiv_inertiaSubgroup hσ hτ

/-- **Layer 4, choice-free consequence: every arithmetic Frobenius lift** lands in the coset
`of 0 · ⟨⟨of 1⟩⟩`, whatever the choices of `σ` and `τ`; the membership is spelled as in
`TauCeti.IsArithFrobeniusLift.isArithFrobeniusLift_iff_inv_mul_mem`. -/
theorem tameQuotientEquiv_mk_of_isArithFrobeniusLift {φ : Field.absoluteGaloisGroup K}
    (hφ : IsArithFrobeniusLift K φ) :
    (iwasawaSigma K)⁻¹ * tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk φ) ∈
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  TauCeti.IsArithFrobeniusLift.inv_iwasawaSigma_mul_tameQuotientEquiv_mem hσ hτ hφ

/-- **Layer 4, the coordinate is the unramified coordinate of Layer 2.** Through the marked
isomorphism, `iwasawaCoordinate` is restriction to `K^ur` followed by
`maximalUnramifiedGaloisGroupEquivZHat`, which sends the arithmetic Frobenius to
`TauCeti.zHat.gen`. Both sides are continuous homomorphisms `G_K → Ẑ` that agree at `σ` and are
trivial on `I_K`, and `σ` and `I_K` generate `G_K` topologically
(`TauCeti.IsArithFrobeniusLift.topologicalClosure_zpowers_sup_inertiaSubgroup`). -/
theorem iwasawaCoordinate_tameQuotientEquiv_mk (g : Field.absoluteGaloisGroup K) :
    iwasawaCoordinate K (tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk g)) =
      maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K)
        (restrictMaximalUnramifiedHom K g) :=
  by
    rw [TauCeti.iwasawaCoordinate_tameQuotientEquiv hσ hτ]
    exact TauCeti.tameQuotientToZHat_toTameQuotient g

end Marked

/-- **Layer 4, the Iwasawa presentation, unmarked.** `G_K^t` is the profinite group presented by
`iwasawaRelator`. A closed corollary of `tameQuotientEquiv`, with a Frobenius lift from
`exists_isArithFrobeniusLift` and a tame generator from
`exists_topologicalClosure_zpowers_eq_tameInertia`. ⚠ Theorems about the presentation are stated
against the marked `tameQuotientEquiv`: this statement alone cannot tell the arithmetic relator
from the geometric one, which presents an isomorphic group. -/
theorem tameQuotientPresentation :
    Nonempty (tameQuotient K ≃ₜ*
      TauCeti.presentedProfiniteGroup (ULift.{u} (Fin 2)) {iwasawaRelator K}) :=
  TauCeti.nonempty_continuousMulEquiv_iwasawaGroup K

/-! ### The geometric form -/

/-- **Layer 4, the geometric relator** `σ⁻¹ τ σ τ^{−q}`: the image of `iwasawaRelator` under
`σ ↦ σ⁻¹`, `τ ↦ τ`. -/
noncomputable abbrev iwasawaRelatorGeometric : TauCeti.freeProfiniteGroup (ULift.{u} (Fin 2)) :=
  TauCeti.iwasawaRelatorGeometric K

/-- **Layer 4, the geometric Iwasawa group** `⟨σ', τ | σ'⁻¹ τ σ' = τ^q⟩`, whose marked generator
`σ' = of 0` is the image of the geometric Frobenius. -/
abbrev IwasawaGroupGeometric : Type u :=
  TauCeti.IwasawaGroupGeometric K

/-- **Layer 4.** The marked generator `σ' = of 0` of `IwasawaGroupGeometric K`. -/
noncomputable abbrev iwasawaSigmaGeometric : IwasawaGroupGeometric K :=
  TauCeti.iwasawaSigmaGeometric K

/-- **Layer 4.** The marked generator `τ = of 1` of `IwasawaGroupGeometric K`. -/
noncomputable abbrev iwasawaTauGeometric : IwasawaGroupGeometric K :=
  TauCeti.iwasawaTauGeometric K

/-- **Layer 4, the geometric translation** `σ ↦ σ⁻¹`, `τ ↦ τ`: Tau Ceti's
`TauCeti.presentedProfiniteGroup.congr` applied to the involution of the free profinite group that
inverts `of 0` and fixes `of 1`, which carries `iwasawaRelator` to `iwasawaRelatorGeometric`.
Composed with `tameQuotientEquiv`, it sends the class of the geometric Frobenius `σ⁻¹` to
`iwasawaSigmaGeometric`. -/
noncomputable abbrev iwasawaGeometricEquiv : IwasawaGroup K ≃ₜ* IwasawaGroupGeometric K :=
  TauCeti.iwasawaGeometricEquiv K

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

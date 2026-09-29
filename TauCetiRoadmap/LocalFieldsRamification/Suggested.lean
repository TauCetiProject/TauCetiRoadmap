import Mathlib
import TauCeti.NumberTheory.LocalField.UnitFiltration.RamificationGroup
import TauCeti.Topology.Algebra.Group.Profinite.Presentation
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic
import TauCetiRoadmap.ProfiniteProPGroups.Suggested

set_option autoImplicit false

/-!
# Local fields and ramification: target signatures

The normative roadmap is `README.md`. This companion file pins representative Lean-facing
signatures for the local-field and ramification layers only. Class field theory, local
reciprocity, Tate duality, and the arithmetic structure of `G_K(p)` are owned by their new
supplier roadmaps and do not appear here.

The abstract profinite group theory this roadmap consumes is **imported, not restated**. The
Layer 1 and Layer 4 pro-`p` statements use `TauCetiRoadmap.ProfiniteProPGroups`' `IsProP` and its
four profinite-Sylow theorems by name; the Iwasawa presentation uses Tau Ceti's free profinite
groups and profinite presentations (`TauCeti.freeProfiniteGroup`, `TauCeti.presentedProfiniteGroup`)
and its profinite integers `TauCeti.zHat`; and the finite-level twist uses Tau Ceti's tame
character `TauCeti.tameCharacter`. Several uses are closed proofs — among them the Sylow uniqueness
of wild inertia, and the uniqueness of the marked Iwasawa presentation and of its coordinate — so a
change of name, carrier or hypothesis in a supplier breaks this build rather than being absorbed
silently. No `Supplied.*` alias and no local replacement carrier exists for any of them. What this
roadmap does **not** consume is the maximal pro-`p` quotient, the free pro-`p` group, or the
generator-rank declarations: `G_K(p)`, its rank and its Demushkin presentation belong to
`LocalGaloisGroups`.

Tau Ceti's maximal unramified extension, inertia subgroup and arithmetic Frobenius lifts
(`TauCeti.maximalUnramifiedExtension`, `TauCeti.inertiaSubgroup`, `TauCeti.IsArithFrobeniusLift`,
and the API used with them) are newer than the Tau Ceti revision this library is pinned to. Each
is stated here once, under its Tau Ceti name and with its Tau Ceti signature, and its docstring says
so. Layer 4 opens `TauCeti`, so deleting these statements when the pin moves makes every use resolve
to Tau Ceti's declaration.
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

/-- **Layer 0, non-vacuity: `ℚ_p` is a nonarchimedean local field.** The pin has
`ValuativeRel ℚ_[p]` (via `Padic.mulValuation`) but neither `IsValuativeTopology ℚ_[p]` nor
this instance; producing them, with the metric/valuative uniformity compatibility as a
lemma rather than an accident, is the first milestone. The milestone is the general `p`;
`p = 2` is the case every downstream consumer of this roadmap uses. -/
example (p : ℕ) [Fact p.Prime] : IsNonarchimedeanLocalField ℚ_[p] :=
  sorry

/-- **Layer 0, the normalized valuation.** The valuation of a local field, written
additively but encoded as a homomorphism to `Multiplicative ℤ`. This is `WithZero.log` of
Mathlib's canonical valuation transported along `valueGroupWithZeroIsoInt`. ⚠ Sign trap:
Mathlib's multiplicative convention has `valuation K π = exp (−1) < 1` on uniformizers, so
the additive normalization carries a minus sign; keep that translation in one named lemma. -/
noncomputable def normalizedValuation : Kˣ →* Multiplicative ℤ :=
  sorry

/-- **Layer 0.** The normalized valuation is surjective: the value group is all of `ℤ`. -/
theorem normalizedValuation_surjective : Function.Surjective (normalizedValuation K) :=
  sorry

/-- **Layer 0.** `v_K^×(x) = 1` says the additive value is `0`, that is, `x` is a unit of
`𝒪[K]`. This is the equation reserved for the kernel condition; the uniformizer equation is
the next lemma, and the two must not be conflated. -/
theorem normalizedValuation_eq_one_iff (x : Kˣ) :
    normalizedValuation K x = 1 ↔ valuation K (x : K) = 1 :=
  sorry

/-- **Layer 0.** For a uniformizer the Lean-facing equation is
`v_K^×(π) = Multiplicative.ofAdd 1`, equivalently `v_K(π) = 1` after decoding with
`Multiplicative.toAdd`. -/
theorem normalizedValuation_irreducible (π : 𝒪[K]) (_hπ : Irreducible π) (hπ0 : (π : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (π : K) hπ0) = Multiplicative.ofAdd 1 :=
  sorry

/-- **Layer 0, uniformizers generate the value group.** Any irreducible element of the
(discrete valuation) ring `𝒪[K]` has valuation a generator: every nonzero value is an
integer power of it. -/
example (π : 𝒪[K]) (_hπ : Irreducible π) :
    ∀ γ : (ValueGroupWithZero K)ˣ,
      ∃ n : ℤ, (γ : ValueGroupWithZero K) = valuation K (π : K) ^ n :=
  sorry

/-- **Layer 0.I, bridge to the analytic API.** The normalized absolute value attached to the
canonical valuative relation supplies the normed-field structure used by
`spectralNorm`. This is a named value rather than a global instance, so installing it is always
local and cannot create a topology diamond. -/
@[implicit_reducible]
noncomputable def normalizedNormedField : NormedField K :=
  sorry

/-- **Layer 0.I, the topology carried by `normalizedNormedField`.** Naming it separately makes
all later comparisons explicit. -/
@[implicit_reducible]
noncomputable def normalizedNormedFieldTopology : TopologicalSpace K := by
  letI := normalizedNormedField K
  exact inferInstance

/-- **Layer 0.I, compatibility of the analytic and valuative topologies on the base.** -/
theorem normalizedNormedField_topology_eq :
    normalizedNormedFieldTopology K = (inferInstance : TopologicalSpace K) :=
  sorry

/-- **Layer 0.I, the spectral-norm structure on a bare finite algebra.** Completeness and
ultrametricity come from `normalizedNormedField`; no topology or valuation on `M` is assumed. -/
@[implicit_reducible]
noncomputable def finiteExtensionNormedField (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : NormedField M :=
  sorry

/-- **Layer 0.I, the topology induced by the spectral norm.** -/
@[implicit_reducible]
noncomputable def finiteExtensionNormedFieldTopology (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : TopologicalSpace M := by
  letI := finiteExtensionNormedField K M
  exact inferInstance

/-- **Layer 0.I, constructing the valuative structure on a finite extension.** The spectral
norm supplies a `ValuativeRel M`; a particular `Valuation M ℤᵐ⁰` is an implementation witness,
not a second public carrier. This is a definition rather than a global instance, avoiding a
diamond when `M` already has a valuative structure. -/
@[implicit_reducible]
noncomputable def finiteExtensionValuativeRel (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] : ValuativeRel M :=
  sorry

/-- **Layer 0.I, compatibility of the constructed structure with the base field.** -/
theorem finiteExtension_valuativeExtension (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    letI := finiteExtensionValuativeRel K M
    ValuativeExtension K M :=
  sorry

/-- **Layer 0.I, the constructed topology is valuative for the constructed relation.** This is
the missing bridge from the spectral norm to the public valuative carrier. -/
theorem finiteExtension_isValuativeTopology (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    @IsValuativeTopology M _ (finiteExtensionValuativeRel K M)
      (finiteExtensionNormedFieldTopology K M) :=
  sorry

/-- **Layer 0.III, a bare finite algebra is a local field with the structures just constructed.**
Unlike the compatibility example below, this theorem assumes no topology or valuative relation
on `M`; it closes the construction consumed by every later layer. -/
theorem finiteExtension_isNonarchimedeanLocalField (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] :
    @IsNonarchimedeanLocalField M _ (finiteExtensionValuativeRel K M)
      (finiteExtensionNormedFieldTopology K M) :=
  sorry

/-- **Layer 0.II, comparison with an already topologized compatible extension.** Uniqueness of
the extended valuation identifies the spectral-norm topology with the pre-existing valuative
topology. -/
theorem finiteExtensionNormedFieldTopology_eq (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] [ValuativeRel M] [TopologicalSpace M] [IsValuativeTopology M]
    [ValuativeExtension K M] :
    finiteExtensionNormedFieldTopology K M = (inferInstance : TopologicalSpace M) :=
  sorry

/-- **Layer 0.II, uniqueness.** Any two valuations on a finite extension `M/K` restricting to
the valuation class of `K` are equivalent. (Completeness of `K` is what makes this true, and
it is part of `IsNonarchimedeanLocalField K`.) -/
theorem finiteExtensionValuation_isEquiv (M : Type v) [Field M] [Algebra K M] [Module.Finite K M]
    {Γ₁ Γ₂ : Type*} [LinearOrderedCommGroupWithZero Γ₁] [LinearOrderedCommGroupWithZero Γ₂]
    (w₁ : Valuation M Γ₁) (w₂ : Valuation M Γ₂)
    (_h₁ : (w₁.comap (algebraMap K M)).IsEquiv (valuation K))
    (_h₂ : (w₂.comap (algebraMap K M)).IsEquiv (valuation K)) :
    w₁.IsEquiv w₂ :=
  sorry

/-- **Layer 0.II, the constructed relation agrees with any compatible existing relation.** -/
theorem finiteExtensionValuativeRel_eq (M : Type v) [Field M] [Algebra K M]
    [Module.Finite K M] [ValuativeRel M] [ValuativeExtension K M] :
    finiteExtensionValuativeRel K M = (inferInstance : ValuativeRel M) :=
  sorry

/-- **Layer 0.II, corollary: Galois invariance of the valuation.** Every `K`-algebra
automorphism of a finite extension `L/K` of local fields preserves the canonical valuation.
This is what makes `Gal(L/K)` act on `𝒪[L]`, `𝓂[L]`, and the residue field, and Layers 2
and 3 use it constantly. -/
theorem valuation_algEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (σ : L ≃ₐ[K] L) (x : L) :
    valuation L (σ x) = valuation L x :=
  sorry

/-- **Layer 0.III, consequences.** Once the compatible valuation class and the valuative
topology are in place, a finite extension of a nonarchimedean local field is a nonarchimedean
local field. ⚠ This statement hypothesizes the structure, so it prototypes step III only;
steps I and II are the two milestones above. -/
example (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsValuativeTopology M] [Algebra K M] [ValuativeExtension K M]
    [Module.Finite K M] :
    IsNonarchimedeanLocalField M :=
  sorry

/-- **Layer 0.III, integer rings in an extension.** The compatible valuation makes the map
`K → L` restrict to `𝒪[K] → 𝒪[L]`. This named instance is part of the local package consumed by
the monogenicity and different milestones below. -/
noncomputable instance integerRingAlgebra [Algebra K L] [ValuativeExtension K L] :
    Algebra 𝒪[K] 𝒪[L] :=
  sorry

/-- **Layer 0.III, residue fields in an extension.** The reduction of the integer-ring algebra
is the canonical `𝓀[K]`-algebra structure on `𝓀[L]`. -/
noncomputable instance residueFieldAlgebra [Algebra K L] [ValuativeExtension K L] :
    Algebra 𝓀[K] 𝓀[L] :=
  sorry

/-- **Layer 0.III, torsion-freeness of the integer-ring extension.** This is the ring-level
hypothesis used by Mathlib's `differentIdeal`. -/
noncomputable instance integerRingTorsionFree [Algebra K L] [ValuativeExtension K L] :
    Module.IsTorsionFree 𝒪[K] 𝒪[L] :=
  sorry

/-- **Layer 0.III, finiteness of the integer-ring extension.** -/
noncomputable instance integerRingModuleFinite [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] : Module.Finite 𝒪[K] 𝒪[L] :=
  sorry

/-- **Layer 0.III, finite freeness of the integer-ring extension.** -/
noncomputable instance integerRingModuleFree [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] : Module.Free 𝒪[K] 𝒪[L] :=
  sorry

/-- **Layer 0.III, comparison with integral closure.** -/
theorem integerRing_eq_integralClosure [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    (𝒪[L] : Set L) = integralClosure 𝒪[K] L :=
  sorry

/-- **Layer 0.III, compatibility of the constructed topology in a finite tower.** -/
theorem finiteExtensionNormedFieldTopology_tower
    (M : Type w) [Field M] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra L M] [Module.Finite L M] [Algebra K M] [Module.Finite K M]
    [IsScalarTower K L M] :
    finiteExtensionNormedFieldTopology K M = finiteExtensionNormedFieldTopology L M :=
  sorry

/-- **Layer 0.III, compatibility of the constructed valuative relation in a finite tower.** -/
theorem finiteExtensionValuativeRel_tower
    (M : Type w) [Field M] [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [Algebra L M] [Module.Finite L M] [Algebra K M] [Module.Finite K M]
    [IsScalarTower K L M] :
    finiteExtensionValuativeRel K M = finiteExtensionValuativeRel L M :=
  sorry

/-- **Layer 0.III, adapter for a finite intermediate-field carrier.** This is the exact entry
point required by Counting Totally Ramified Extensions #226: its intermediate field acquires the
spectral-norm structure without first postulating topology or valuation instances. -/
@[implicit_reducible]
noncomputable def finiteIntermediateFieldNormedField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : NormedField M :=
  finiteExtensionNormedField K M

/-- **Layer 0.III, valuative relation on a finite intermediate-field carrier.** -/
@[implicit_reducible]
noncomputable def finiteIntermediateFieldValuativeRel
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : ValuativeRel M :=
  finiteExtensionValuativeRel K M

/-- **Layer 0.III, spectral-norm topology on a finite intermediate-field carrier.** -/
@[implicit_reducible]
noncomputable def finiteIntermediateFieldTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] : TopologicalSpace M :=
  finiteExtensionNormedFieldTopology K M

/-- **Layer 0.III, compatibility of the intermediate-field adapter with the base valuation.** -/
theorem finiteIntermediateField_valuativeExtension
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    letI := finiteIntermediateFieldValuativeRel K Ω M
    ValuativeExtension K M :=
  finiteExtension_valuativeExtension K M

/-- **Layer 0.III, the intermediate-field adapter carries the valuative topology.** -/
theorem finiteIntermediateField_isValuativeTopology
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsValuativeTopology M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  finiteExtension_isValuativeTopology K M

/-- **Layer 0.III, local-field theorem for a finite intermediate-field carrier.** -/
theorem finiteIntermediateField_isNonarchimedeanLocalField
    (Ω : Type v) [Field Ω] [Algebra K Ω]
    (M : IntermediateField K Ω) [Module.Finite K M] :
    @IsNonarchimedeanLocalField M _ (finiteIntermediateFieldValuativeRel K Ω M)
      (finiteIntermediateFieldTopology K Ω M) :=
  sorry

/-- **Layer 0, the ramification index**, defined without choosing a uniformizer: the positive
integer by which the map of normalized value groups multiplies. Its characteristic property
is `normalizedValuation_algebraMap` below. -/
noncomputable def ramificationIndex [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    ℕ :=
  sorry

/-- **Layer 0, the residue degree.** This is definitionally the dimension of the residue-field
extension supplied by `residueFieldAlgebra`. -/
noncomputable def inertiaDegree [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    ℕ := Module.finrank 𝓀[K] 𝓀[L]

/-- **Layer 0, total ramification.** This is the canonical one-extension predicate consumed by
#226. An intermediate-field family wrapper must compare to it and must not contain an independent
definition of total ramification. -/
def IsTotallyRamified [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] : Prop :=
  ramificationIndex K L = Module.finrank K L

/-- **Layer 0, the characteristic property of `e`.** The normalized valuation of `L`
restricted along `K` is the `e`-th power of that of `K`. Stated for all `x`, so no uniformizer
is chosen; specializing to a uniformizer of `K` gives `v_L(π_K) = e`. -/
theorem normalizedValuation_algebraMap [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (x : Kˣ) :
    normalizedValuation L (Units.map (algebraMap K L : K →+* L).toMonoidHom x)
      = normalizedValuation K x ^ ramificationIndex K L :=
  sorry

/-- **Layer 0, the characteristic property of `f`.** -/
theorem card_residueField [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ inertiaDegree K L :=
  sorry

/-- **Layer 0, `e · f = n`.** With positivity of both factors, and multiplicativity in towers,
this is the fundamental identity of the layer. The reconciliation with the Dedekind-level
`Ideal.ramificationIdx`/`Ideal.inertiaDeg` (at a local field `𝓂[K]` has the single prime
`𝓂[L]` above it) is a separate named milestone. -/
theorem ramificationIndex_mul_inertiaDegree [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    ramificationIndex K L * inertiaDegree K L = Module.finrank K L :=
  sorry

/-- **Layer 0, residue-degree characterization of total ramification.** This is the stable
one-extension bridge consumed by `TotallyRamified`; a family-level intermediate-field wrapper
must compare to this theorem rather than define a second ramification predicate. No dependency on
the consumer roadmap is introduced here. -/
theorem isTotallyRamified_iff_inertiaDegree_eq_one [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] :
    IsTotallyRamified K L ↔ inertiaDegree K L = 1 :=
  sorry

/-- **Layer 0, the valuation of a natural-number cast.** The nonzero proof is part of the input;
there is no equal-characteristic junk branch. This is the general quantity in power-class
formulas and wild-different bounds. -/
noncomputable def natCastValuation (n : ℕ) (hn : (n : K) ≠ 0) : ℕ :=
  (Multiplicative.toAdd (normalizedValuation K (Units.mk0 (n : K) hn))).toNat

/-- **Layer 0, the characteristic property of `natCastValuation`.** Its value is a natural
number, so the equation also records that the natural-number cast lies in `𝒪[K]`. -/
theorem normalizedValuation_natCast (n : ℕ) (hn : (n : K) ≠ 0) :
    normalizedValuation K (Units.mk0 (n : K) hn)
      = Multiplicative.ofAdd (natCastValuation K n hn : ℤ) :=
  sorry

/-- **Layer 0, the vanishing criterion for a natural-number cast.** -/
theorem natCastValuation_eq_zero_iff (n : ℕ) (hn : (n : K) ≠ 0) :
    natCastValuation K n hn = 0 ↔ IsUnit (n : ↥𝒪[K]) :=
  sorry

/-- **Layer 0, the absolute ramification index.** This name is reserved for a finite
mixed-characteristic extension `K/ℚ_p`; definitionally it is the relative ramification index. -/
noncomputable def absoluteRamificationIndex (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K] : ℕ :=
  ramificationIndex ℚ_[p] K

/-- **Layer 0, comparison with the valuation of the residue prime.** -/
theorem absoluteRamificationIndex_eq_natCastValuation (p : ℕ) [Fact p.Prime]
    [Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (hp : (p : K) ≠ 0) :
    absoluteRamificationIndex K p = natCastValuation K p hp :=
  sorry

/-! ## Layer 1: units, the filtration, and the multiplicative group -/

/-- **Layer 1, the unit filtration** as an object: `U(K,0) = 𝒪[K]ˣ` and
`U(K,i) = 1 + 𝓂[K]^i` for `i ≥ 1`, a decreasing family of open compact subgroups of `Kˣ`
indexed by `ℕ`. The depth-zero branch is part of the definition, not a special case bolted on
afterwards. -/
def unitFiltration (i : ℕ) : Subgroup Kˣ :=
  sorry

/-- **Layer 1, membership at depth `0`:** the units of `𝒪[K]` inside `Kˣ`. -/
theorem mem_unitFiltration_zero (x : Kˣ) :
    x ∈ unitFiltration K 0 ↔ valuation K (x : K) = 1 :=
  sorry

/-- **Layer 1, membership at positive depth, congruence form:** `x ≡ 1 mod 𝓂[K]^i` for a unit
`x` of `𝒪[K]`. -/
theorem mem_unitFiltration_succ_congr (i : ℕ) (u : (↥𝒪[K])ˣ) :
    Units.map (Subring.subtype 𝒪[K]).toMonoidHom u ∈ unitFiltration K (i + 1) ↔
      (u : ↥𝒪[K]) - 1 ∈ 𝓂[K] ^ (i + 1) :=
  sorry

/-- **Layer 1, membership at positive depth, valuation form:** an inequality on `x − 1`,
measured against a uniformizer. Both forms get used; they are proved equivalent once. -/
theorem mem_unitFiltration_succ_valuation (i : ℕ) (x : Kˣ) (π : 𝒪[K]) (_hπ : Irreducible π) :
    x ∈ unitFiltration K (i + 1) ↔
      valuation K ((x : K) - 1) ≤ valuation K ((π : K) ^ (i + 1)) :=
  sorry

/-- **Layer 1, the filtration is decreasing.** -/
theorem unitFiltration_antitone : Antitone (unitFiltration K) :=
  sorry

/-- **Layer 1, covariant unit-filtration map.** The algebra map scales depth by the
ramification index. This is distinct from the contravariant, Herbrand-shifted norm theorem
`map_norm_unitFiltration_psiNat_le` in Layer 3. -/
theorem map_unitFiltration_le [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (i : ℕ) :
    Subgroup.map (Units.map (algebraMap K L : K →+* L).toMonoidHom) (unitFiltration K i)
      ≤ unitFiltration L (ramificationIndex K L * i) :=
  sorry

/-- **Layer 1, the filtration separates points**, which with openness makes it a neighborhood
basis of `1` in `Kˣ`. -/
theorem iInf_unitFiltration : ⨅ i, unitFiltration K i = ⊥ :=
  sorry

/-- **Layer 1, reduction is surjective on units**, the depth-`0` graded piece
`𝒪[K]ˣ ↠ 𝓀[K]ˣ` of the unit filtration, whose kernel is `U(K,1)`. The deeper pieces
`U(K,i)/U(K,i+1) ≅ 𝓀[K]⁺` are stated once the quotient API is in `TauCeti/`. -/
example :
    Function.Surjective
      (Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom : (↥𝒪[K])ˣ →* (𝓀[K])ˣ) :=
  sorry

/-- **Layer 1, the Teichmüller section**: the canonical multiplicative section of reduction,
characterized by `teichmuller_section` below together with the uniqueness statement that its
image is the `(q−1)`-torsion of `𝒪[K]ˣ`, that is `μ_{q−1}(K)`. Whether the construction goes
through `Perfection.teichmuller₀` or through Hensel applied to `X^(q−1) − 1` is an
implementation note. -/
noncomputable def teichmuller : (𝓀[K])ˣ →* (↥𝒪[K])ˣ :=
  sorry

/-- **Layer 1.** The Teichmüller map is a section of reduction. -/
theorem teichmuller_section (x : (𝓀[K])ˣ) :
    Units.map (IsLocalRing.residue 𝒪[K]).toMonoidHom (teichmuller K x) = x :=
  sorry

/-- **Layer 1, the multiplicative decomposition.** A choice of uniformizer splits
`Kˣ ≅ ℤ × 𝒪[K]ˣ`: every element of `Kˣ` is uniquely `π^n · u` with `u ∈ 𝒪[K]ˣ`. (With the
Teichmüller milestone this refines to `Kˣ ≅ π^ℤ × μ_{q−1} × U(K,1)`, and `U(K,1)` is pro-`p`,
in the quotient form that `ProfiniteProPGroups.IsProP` unfolds to.) -/
example (π : 𝒪[K]) (_hπ : Irreducible π) (x : Kˣ) :
    ∃! p : ℤ × (↥𝒪[K])ˣ, (x : K) = (π : K) ^ p.1 * ((p.2 : ↥𝒪[K]) : K) :=
  sorry

/-- **Layer 1, the local exponential.** At this pin the implementation starts from
`NormedSpace.expSeries`/`NormedSpace.exp` after locally installing `normalizedNormedField`; it is
named here because Mathlib has no ready-made `p`-adic-field exponential/logarithm equivalence. -/
noncomputable def localExponential : K → K :=
  sorry

/-- **Layer 1, the local logarithm.** This is the evaluated series
`PowerSeries.log = X - X²/2 + X³/3 - ⋯` on its nonarchimedean convergence domain. Constructing
this function, its convergence theorem, and continuity is an explicit milestone. -/
noncomputable def localLogarithm : K → K :=
  sorry

/-- **Layer 1, the sharp deep-unit exponential/logarithm equivalence.** The strict inequality is
part of the data; at equality logarithm may converge without being injective because of torsion. -/
noncomputable def deepUnitExpLogEquiv (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (_hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Multiplicative ↥(𝓂[K] ^ i) ≃* unitFiltration K i :=
  sorry

/-- **Layer 1, `log (exp x) = x` on the sharp deep additive domain.** -/
theorem localLogarithm_localExponential (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (x : ↥(𝓂[K] ^ i)) :
    localLogarithm K (localExponential K (((x : 𝒪[K]) : K))) = ((x : 𝒪[K]) : K) :=
  sorry

/-- **Layer 1, `exp (log u) = u` on the sharp deep multiplicative domain.** -/
theorem localExponential_localLogarithm (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (hi : absoluteRamificationIndex K p < (p - 1) * i)
    (u : unitFiltration K i) :
    localExponential K (localLogarithm K (((u : Kˣ) : K))) = ((u : Kˣ) : K) :=
  sorry

/-- **Layer 1, continuity of exponential on the sharp deep domain.** -/
theorem continuous_localExponential_deep (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (_hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Continuous (fun x : ↥(𝓂[K] ^ i) => localExponential K (((x : 𝒪[K]) : K))) :=
  sorry

/-- **Layer 1, continuity of logarithm on the sharp deep-unit domain.** -/
theorem continuous_localLogarithm_deep (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (i : ℕ) (_hi : absoluteRamificationIndex K p < (p - 1) * i) :
    Continuous (fun u : unitFiltration K i => localLogarithm K (((u : Kˣ) : K))) :=
  sorry

/-- **Layer 1, power classes in the prime-to-residue-characteristic regime.** If `n` is a unit
in the valuation ring, the count is exact and holds in either characteristic: the factor
`q ^ natCastValuation K n` of the general formula is `1`, which is where the hypothesis is used. -/
theorem card_powerClasses_of_isUnit (n : ℕ) (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K) :=
  sorry

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
  sorry

/-- **Layer 1, openness of the power subgroup away from the residue characteristic.** Openness
comes from the explicit deep subgroup contained in the range; no finite-index implication is used. -/
theorem isOpen_range_powMonoidHom_of_isUnit (n : ℕ) (_hn : n ≠ 0)
    (_hn' : IsUnit (n : ↥𝒪[K])) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  sorry

/-- **Layer 1, openness of the power subgroup in mixed characteristic.** -/
theorem isOpen_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range : Set Kˣ) :=
  sorry

/-- **Layer 1, finite index away from the residue characteristic.** This is derived from
`card_powerClasses_of_isUnit`, independently of the openness proof. -/
theorem finiteIndex_range_powMonoidHom_of_isUnit (n : ℕ) (_hn : n ≠ 0)
    (_hn' : IsUnit (n : ↥𝒪[K])) :
    (powMonoidHom n : Kˣ →* Kˣ).range.FiniteIndex :=
  sorry

/-- **Layer 1, finite index in mixed characteristic.** This is derived from
`card_powerClasses_mixed`, not from openness. -/
theorem finiteIndex_range_powMonoidHom (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (n : ℕ) (_hn : n ≠ 0) :
    (powMonoidHom n : Kˣ →* Kˣ).range.FiniteIndex :=
  sorry

/-- **Layer 1, the square classes away from residue characteristic `2`.** The specialization of
`card_powerClasses_of_isUnit` at `n = 2`: the hypothesis makes `2` invertible in `𝒪[K]`, hence
in `K`, so `μ_2(K) = {±1}` has order `2` and the count is `2 · 2 · 1`. -/
theorem card_squareClasses_of_isUnit (_h2 : IsUnit (2 : ↥𝒪[K])) :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range) = 4 :=
  sorry

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
  sorry

/-- **Layer 1, the two spellings of the square classes.** Mathlib's `Subgroup.square Kˣ` is the
subgroup of squares, and the counts above are stated at the range of `powMonoidHom`. This is the
identification at `n = 2`, and it is what lets a consumer read the count of this layer, and
`ProfiniteCohomology.kummerIso`, on `Subgroup.square Kˣ`. -/
theorem square_eq_range_powMonoidHom :
    Subgroup.square Kˣ = (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  sorry

/-- **Layer 1, worked example: `ℚ_2ˣ/(ℚ_2ˣ)²` has order 8** (the classes of `−1, 2, 5`
generate). The odd-`p` count is `4`; this factor-of-two dyadic difference is why no layer may
assume `p ≠ 2`. -/
example : Nat.card (ℚ_[2]ˣ ⧸ (powMonoidHom 2 : ℚ_[2]ˣ →* ℚ_[2]ˣ).range) = 8 :=
  sorry

/-- **Layer 1, the local square theorem, sharp form.** For `K/ℚ_2` finite and
`e = absoluteRamificationIndex K 2`, every unit of depth `2e+1` is a square. ⚠ This is **not** an
instance of the counts above, which decide how many square classes there are and not which
subgroup lies inside the squares. The mixed-characteristic hypothesis is part of the type; there
is no equal-characteristic value of `absoluteRamificationIndex`. -/
theorem unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    unitFiltration K (2 * absoluteRamificationIndex K 2 + 1)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  sorry

/-- **Layer 1, sharpness of the local square theorem.** The threshold `2e+1` cannot be lowered,
over any finite extension of `ℚ_2` and not only over `ℚ_2`: `U(K, 2e)` always meets the
complement of the squares. The obstruction is the Artin–Schreier map `t ↦ t² + t` of `𝓀[K]`,
which is `𝔽_2`-linear with kernel `𝔽_2` and therefore has image of index `2`; since
`𝓂[K]^{2e} = 4 · 𝒪[K]`, a unit `1 + 4c` is a square exactly when the residue of `c` is in that
image, so any `c` outside it is a witness. -/
theorem not_unitFiltration_le_range_powMonoidHom_two [Algebra ℚ_[2] K]
    [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    ¬ unitFiltration K (2 * absoluteRamificationIndex K 2)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  sorry

/-! ### The dyadic statements, indexed uniformly

⚠ The three theorems above are stated for a finite extension of `ℚ_2`, because
`absoluteRamificationIndex K 2` is reserved for that case — its signature demands
`[Algebra ℚ_[2] K]`. That makes them **unusable in odd residue characteristic**, where the
intended reading of `e = v_K(2)` is simply `0`: a consumer splitting on `e = 0` versus `e ≠ 0`
cannot even write the hypothesis, and `QuadraticFormInvariants` had to restate all three
locally. The uniform forms below are indexed by `natCastValuation K 2`, which is defined for
every nonarchimedean local field in which `2` is nonzero and vanishes exactly when the residue
characteristic is odd. In mixed characteristic `2` the two agree, by
`absoluteRamificationIndex_eq_natCastValuation`, so these are generalizations rather than a
second convention. -/

/-- **Layer 1, the local square theorem, uniformly indexed** (O'Meara 63:1). -/
theorem unitFiltration_natCastValuation_le_range_powMonoidHom_two
    (h2 : ((2 : ℕ) : K) ≠ 0) :
    unitFiltration K (2 * natCastValuation K 2 h2 + 1)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  sorry

/-- **Layer 1, sharpness, uniformly indexed.** ⚠ In odd residue characteristic the exponent is
`0`, and the statement says that `U(K,0) = 𝒪[K]ˣ` is not contained in the squares — which is
true, and is the odd-residue-characteristic content that the `ℚ_2`-indexed version cannot
express at all. -/
theorem not_unitFiltration_natCastValuation_le_range_powMonoidHom_two
    (h2 : ((2 : ℕ) : K) ≠ 0) :
    ¬ unitFiltration K (2 * natCastValuation K 2 h2)
      ≤ (powMonoidHom 2 : Kˣ →* Kˣ).range :=
  sorry

/-- **Layer 1, the square-class count, uniformly indexed**: `#(Kˣ/(Kˣ)²) = 4 · q^{v_K(2)}`.
At odd residue characteristic the exponent is `0` and this is the familiar `4`; over a finite
extension of `ℚ_2` of degree `N` it is `2^{N+2}`. One statement, both branches. -/
theorem card_squareClasses_natCastValuation (h2 : ((2 : ℕ) : K) ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom 2 : Kˣ →* Kˣ).range)
      = 4 * Nat.card 𝓀[K] ^ natCastValuation K 2 h2 :=
  sorry

/-- **Layer 1, worked example: the dyadic deep-square bound.** Units of `ℤ_2` congruent to
`1 mod 8` are squares (`U(K, 2e+1) ⊆ (Kˣ)²` at `K = ℚ_2`, `e = 1`), and `1 + 4ℤ_2` are not, so
the threshold is sharp there. -/
example (u : ℤ_[2]ˣ) (_hu : (8 : ℤ_[2]) ∣ ((u : ℤ_[2]) - 1)) : IsSquare u :=
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
the geometric Frobenius, and no statement of this roadmap uses the unqualified word for it. -/
noncomputable def frobeniusAlgEquiv [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    [IsGalois K L] (_h : ramificationIndex K L = 1) : L ≃ₐ[K] L :=
  sorry

/-- **Layer 2, the characteristic property of Frobenius:** `σ(y) ≡ y^q mod 𝓂[L]` on `𝒪[L]`,
with `q = Nat.card 𝓀[K]`. This is the equation that fixes `frobeniusAlgEquiv`, and it is stated
on the valuation rather than on the residue field so that it needs no separate name for the
induced action on `𝓀[L]`; `valuation L x < 1` is membership in `𝓂[L]`. -/
theorem valuation_frobeniusAlgEquiv_sub_pow [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (h : ramificationIndex K L = 1) (y : ↥𝒪[L]) :
    valuation L (frobeniusAlgEquiv K L h (y : L) - (y : L) ^ Nat.card 𝓀[K]) < 1 :=
  sorry

/-- **The norm group** `N_{L/K}(Lˣ) : Subgroup Kˣ`, the image of the field norm. Layer 2 computes
it for `L/K` unramified; `ClassFieldTheory.normResidue` and `conductorExponent` consume it for
finite abelian extensions. It is a definition and not a placeholder. -/
noncomputable def normGroup [Algebra K L] [Module.Finite K L] : Subgroup Kˣ :=
  (Units.map (Algebra.norm K : L →* K)).range

/-- **Layer 2, norms of units from an unramified extension.** `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`, written
on the depth-zero step of the unit filtration, which `mem_unitFiltration_zero` identifies with
the units of the valuation ring. ⚠ *False generalization:* for a ramified extension the norm of
a unit is still a unit, but the image is a proper subgroup; at `L = ℚ_2(√2)` it has index `2` in
`ℤ_2ˣ`. -/
theorem map_norm_unitFiltration_zero [Algebra K L] [ValuativeExtension K L] [Module.Finite K L]
    (_h : ramificationIndex K L = 1) :
    Subgroup.map (Units.map (Algebra.norm K : L →* K)) (unitFiltration L 0) = unitFiltration K 0 :=
  sorry

/-- **Layer 2, the unramified norm group in norm-equation form.** `N_{L/K}(Lˣ) = π^{fℤ} × 𝒪[K]ˣ`,
stated as the solvability criterion for the norm equation `N_{L/K}(y) = x`: with `e = 1` the
valuation of a norm is `f · v_L(y)`, and units are norms by the milestone above, so `x` is a norm
exactly when `f` divides `v_K(x)`. ⚠ `f` here is `inertiaDegree K L`, the residue degree of
Layer 0, and never a conductor. -/
theorem mem_normGroup_iff_dvd_normalizedValuation [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] (_h : ramificationIndex K L = 1) (x : Kˣ) :
    x ∈ normGroup K L ↔
      (inertiaDegree K L : ℤ) ∣ Multiplicative.toAdd (normalizedValuation K x) :=
  sorry

/-- **Layer 2, worked example: the unramified quadratic extension of `ℚ_2`.** The adjoined set
is *all* cube roots of unity, so the intermediate field is the splitting field of `X³ − 1`
over `ℚ_2` and no primitive root is chosen; it equals `ℚ_2(√5) = ℚ_2(√−3)` and has residue
field `𝔽_4`. The general milestone is `[K(μ_{q^f−1}) : K] = f` with `Gal` isomorphic to the
Galois group of the residue extension, generated by arithmetic Frobenius. -/
example :
    Module.finrank ℚ_[2]
      (IntermediateField.adjoin ℚ_[2] {x : AlgebraicClosure ℚ_[2] | x ^ 3 = 1}) = 2 :=
  sorry

/-- **Layer 2, worked example: units of `ℚ_2` are norms from the unramified quadratic
extension** (`u = x² − 5y²` solvable over `ℤ_2`; norm surjectivity on units, Serre LF V §2,
the input to the fundamental-class layer). -/
example (u : ℤ_[2]ˣ) : ∃ x y : ℤ_[2], (u : ℤ_[2]) = x ^ 2 - 5 * y ^ 2 :=
  sorry

/-- **Layer 2, worked example: `2` is *not* a norm from the unramified quadratic extension**
(`N(ℚ_2(√5)ˣ) = ⟨4⟩ × ℤ_2ˣ` has index `2`; a uniformizer detects the unramified norm
group). -/
example : ¬ ∃ x y : ℚ_[2], (2 : ℚ_[2]) = x ^ 2 - 5 * y ^ 2 :=
  sorry

/-! ### Layer 2: the maximal unramified extension, from Tau Ceti

Tau Ceti's maximal unramified extension, its arithmetic Frobenius and its identification with `Ẑ`
are newer than the Tau Ceti revision this library is pinned to, so they are stated here once,
under their Tau Ceti names and with their Tau Ceti signatures. -/

/-- **Layer 2, the maximal unramified extension** `K^{ur}` of `K` inside `Ω`: the union of the
unramified extensions of all finite degrees. Tau Ceti's `TauCeti.maximalUnramifiedExtension`
(`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`); stated here because the pinned Tau
Ceti revision predates it; replaced by the import when the pin moves. -/
noncomputable def maximalUnramifiedExtension (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (Ω : Type*) [Field Ω] [Algebra K Ω] :
    IntermediateField K Ω :=
  sorry

/-- **Layer 2, the arithmetic Frobenius of `K^{ur}/K`**, for `Ω` separably closed: the unique
automorphism raising every root of every `X^{q^f} − X`, `f ≠ 0`, to the `q`-th power. Tau Ceti's
`TauCeti.maximalUnramifiedFrobenius` (`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`);
stated here because the pinned Tau Ceti revision predates it; replaced by the import when the pin
moves. -/
noncomputable def maximalUnramifiedFrobenius (Ω : Type*) [Field Ω] [Algebra K Ω] [IsSepClosed Ω] :
    Gal(maximalUnramifiedExtension K Ω/K) :=
  sorry

/-- **Layer 2, `Gal(K^{ur}/K) ≅ Ẑ`**, carrying the arithmetic Frobenius to the canonical generator
(the next statement). Tau Ceti's `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`
(`TauCeti/NumberTheory/LocalField/Unramified/ZHat.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. ⚠ Tau Ceti's target is the
universe-polymorphic `zHat.{max u v}`; the pinned `TauCeti.zHat` lives in `Type`, and the target
here is that one. -/
noncomputable def maximalUnramifiedGaloisGroupEquivZHat (Ω : Type*) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] : Gal(maximalUnramifiedExtension K Ω/K) ≃ₜ* TauCeti.zHat :=
  sorry

/-- **Layer 2.** The identification with `Ẑ` sends the arithmetic Frobenius to the canonical
generator `TauCeti.zHat.gen`. Tau Ceti's
`TauCeti.maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius`
(`TauCeti/NumberTheory/LocalField/Unramified/ZHat.lean`); stated here because the pinned Tau Ceti
revision predates it; replaced by the import when the pin moves. -/
@[simp]
theorem maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius (Ω : Type*) [Field Ω]
    [Algebra K Ω] [IsSepClosed Ω] :
    maximalUnramifiedGaloisGroupEquivZHat K Ω (maximalUnramifiedFrobenius K Ω) =
      TauCeti.zHat.gen :=
  sorry

/-! ## Layer 3: ramification, the lower filtration, and the local different -/

/-- **Layer 3, the canonical lower-numbering filtration.** The integer-indexed family is total;
the theorem below fixes the convention at negative indices. Number-Field Arithmetic #191 imports
this definition for its global/local comparison rather than defining a second filtration. -/
noncomputable def lowerRamificationGroup [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) : Subgroup (L ≃ₐ[K] L) :=
  sorry

/-- **Layer 3, the negative-index convention.** `G_i = G` for every `i ≤ -1`. -/
theorem lowerRamificationGroup_eq_top_of_le_neg_one [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) (hi : i ≤ -1) :
    lowerRamificationGroup K L i = ⊤ :=
  sorry

/-- **Layer 3, the lower filtration is decreasing.** -/
theorem lowerRamificationGroup_antitone [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    Antitone (lowerRamificationGroup K L) :=
  sorry

/-- **Layer 3, real indexing for Herbrand theory.** The ceiling convention makes the step family
constant on `(i-1,i]`, hence left-continuous in the usual informal sense. We pin the interval
identity below rather than assert a topological continuity theorem on subgroup values. -/
noncomputable def lowerRamificationGroupReal [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : ℝ) : Subgroup (L ≃ₐ[K] L) :=
  lowerRamificationGroup K L ⌈u⌉

/-- **Layer 3, agreement of integer and real indexing.** -/
theorem lowerRamificationGroupReal_intCast [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℤ) :
    lowerRamificationGroupReal K L (i : ℝ) = lowerRamificationGroup K L i :=
  sorry

/-- **Layer 3, the interval selected by ceiling indexing.** -/
theorem lowerRamificationGroupReal_eq_of_sub_one_lt_of_le [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    (i : ℤ) (u : ℝ) (hleft : (i : ℝ) - 1 < u) (hright : u ≤ (i : ℝ)) :
    lowerRamificationGroupReal K L u = lowerRamificationGroup K L i :=
  sorry

/-- **Layer 3, the genuine domain of Herbrand theory.** Keeping `[-1,∞)` in the type prevents
global-function equalities from making accidental claims about arbitrary values below `-1`. -/
abbrev RamificationIndexDomain := Set.Ici (-1 : ℝ)

/-- **Layer 3, Herbrand and inverse Herbrand as one order isomorphism.** Its forward map is
`φ_{L/K}` and its inverse is `ψ_{L/K}`. -/
noncomputable def herbrandOrderIso [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain ≃o RamificationIndexDomain :=
  sorry

/-- **Layer 3, the Herbrand function on its mathematical domain.** -/
noncomputable def herbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain → RamificationIndexDomain :=
  herbrandOrderIso K L

/-- **Layer 3, the inverse Herbrand function on its mathematical domain.** -/
noncomputable def inverseHerbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] :
    RamificationIndexDomain → RamificationIndexDomain :=
  (herbrandOrderIso K L).symm

/-- **Layer 3, `φ (ψ u) = u`.** -/
theorem herbrand_inverseHerbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    herbrand K L (inverseHerbrand K L u) = u :=
  sorry

/-- **Layer 3, `ψ (φ u) = u`.** -/
theorem inverseHerbrand_herbrand [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    inverseHerbrand K L (herbrand K L u) = u :=
  sorry

/-- **Layer 3, the upper-numbering filtration.** -/
noncomputable def upperRamificationGroup [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) :
    Subgroup (L ≃ₐ[K] L) :=
  lowerRamificationGroupReal K L (inverseHerbrand K L u : ℝ)

/-- **Layer 3, the quotient filtration attached to a normal subgroup.** The use of
`QuotientGroup.mk'` pins the direction of the map. -/
noncomputable def upperRamificationGroupQuotient [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (H : Subgroup (L ≃ₐ[K] L)) [H.Normal] (u : RamificationIndexDomain) :
    Subgroup ((L ≃ₐ[K] L) ⧸ H) :=
  Subgroup.map (QuotientGroup.mk' H) (upperRamificationGroup K L u)

omit [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [TopologicalSpace L] [IsNonarchimedeanLocalField L] in
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
  sorry

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
  sorry

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
  sorry

/-- **Layer 3, integral inverse-Herbrand depth.** -/
noncomputable def psiNat [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] : ℕ → ℕ :=
  sorry

/-- **Layer 3, characterization of the integral inverse-Herbrand depth.** -/
theorem coe_psiNat [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (n : ℕ) :
    (psiNat K L n : ℝ) =
      (inverseHerbrand K L
        ⟨(n : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg n)⟩ : ℝ) :=
  sorry

/-- **Layer 3, tower transitivity for integral depths.** -/
theorem psiNat_tower
    (M : Type w) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra L M] [ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]
    [IsScalarTower K L M] :
    psiNat K M = psiNat L M ∘ psiNat K L :=
  sorry

/-- **Layer 3, the Herbrand-shifted norm inclusion.** -/
theorem map_norm_unitFiltration_psiNat_le [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (i : ℕ) :
    Subgroup.map (Units.map (Algebra.norm K : L →* K))
        (unitFiltration L (psiNat K L i)) ≤ unitFiltration K i :=
  sorry

/-- **Layer 3, a graded piece of the unit filtration.** -/
abbrev UnitFiltrationGraded (i : ℕ) :=
  unitFiltration K i ⧸ (unitFiltration K (i + 1)).subgroupOf (unitFiltration K i)

/-- **Layer 3, the norm on Herbrand-shifted graded pieces.** -/
noncomputable def normGradedMap [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (v : ℕ) :
    UnitFiltrationGraded L (psiNat K L v) →* UnitFiltrationGraded K v :=
  sorry

/-- **Layer 3, tame ramification.** The residue characteristic does not divide `e(L/K)`. -/
def IsTamelyRamified [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] : Prop :=
  ¬ ringChar 𝓀[K] ∣ ramificationIndex K L

/-- **Layer 3, wild ramification.** The residue characteristic divides `e(L/K)`. -/
def IsWildlyRamified [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] : Prop :=
  ringChar 𝓀[K] ∣ ramificationIndex K L

/-- **Layer 3, predicate for an upper-numbering jump.** -/
def UpperJump [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (u : RamificationIndexDomain) : Prop :=
  sorry

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
  sorry

/-- **Layer 3, depth zero before a positive prime-degree break.** The graded norm is residue
Frobenius and hence bijective. -/
theorem normGradedMap_zero_before_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (t : ℕ) (_htpos : 0 < t)
    (_ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Function.Bijective (normGradedMap K L 0) :=
  sorry

/-- **Layer 3, a positive depth strictly before a positive prime-degree break.** The graded
norm is additive residue Frobenius and hence bijective. -/
theorem normGradedMap_positive_before_break [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (ℓ : ℕ) [Fact ℓ.Prime] (_hdegree : Module.finrank K L = ℓ)
    (_htr : IsTotallyRamified K L) (v t : ℕ) (_hvpos : 0 < v) (_hvt : v < t)
    (_ht : UpperJump K L
      ⟨(t : ℝ), le_trans (by norm_num : (-1 : ℝ) ≤ 0) (Nat.cast_nonneg t)⟩) :
    Function.Bijective (normGradedMap K L v) :=
  sorry

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
  sorry

/-- **Layer 3, Hasse–Arf.** Every upper jump of a finite abelian Galois extension is integral. -/
theorem hasseArf [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (hcomm : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ)
    (u : RamificationIndexDomain) (hu : UpperJump K L u) :
    ∃ z : ℤ, (u : ℝ) = (z : ℝ) :=
  sorry

/-- **Layer 3, local monogenicity at the integer-ring level.** A finite separable extension of
local fields has `𝒪[L] = 𝒪[K][x]` for one integral element `x`. This is the exported form needed
by the different calculation and by the completed integer-ring comparison in #191. -/
theorem exists_integerRing_adjoin_eq_top [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] :
    ∃ x : 𝒪[L], Algebra.adjoin 𝒪[K] {x} = ⊤ :=
  sorry

/-- **Layer 3, total ramification is equivalent to an Eisenstein generator.** The generator is
integral, is a root after mapping coefficients to `𝒪[L]`, and generates the entire integer ring.
This is arithmetic of one extension; `TotallyRamified` may install the intermediate-field
adapters and consume this theorem when constructing a family. -/
theorem isTotallyRamified_iff_exists_eisenstein_generator
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] :
    IsTotallyRamified K L ↔
      ∃ (f : Polynomial 𝒪[K]) (ξ : 𝒪[L]),
        f.IsEisensteinAt 𝓂[K] ∧
          (f.map (algebraMap 𝒪[K] 𝒪[L])).IsRoot ξ ∧
            Algebra.adjoin 𝒪[K] {ξ} = ⊤ :=
  sorry

/-- **Layer 3, orthogonality of an Eisenstein power basis.** For an Eisenstein generator, the
values of the nonzero terms are distinct modulo the ramification index, so the valuation of the
sum is their minimum. In the totally ramified situation supplied by the Eisenstein hypotheses,
the ramification index is `f.natDegree`. This export is consumed by `TotallyRamified`, which owns
the coordinate-box and measure consequences. No dependency on that roadmap is introduced here. -/
theorem addVal_sum_eisenstein_powerBasis [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L]
    (f : Polynomial 𝒪[K]) (hf : f.IsEisensteinAt 𝓂[K])
    (ξ : 𝒪[L]) (hroot : (f.map (algebraMap 𝒪[K] 𝒪[L])).IsRoot ξ)
    (hgen : Algebra.adjoin 𝒪[K] {ξ} = ⊤) (c : Fin f.natDegree → 𝒪[K]) :
    IsDiscreteValuationRing.addVal 𝒪[L]
        (∑ i, algebraMap 𝒪[K] 𝒪[L] (c i) * ξ ^ (i : ℕ)) =
      ⨅ i, ramificationIndex K L • IsDiscreteValuationRing.addVal 𝒪[K] (c i) + (i : ℕ) :=
  sorry

/-- **Layer 3, the local different exponent.** This is the multiplicity of the maximal ideal in
Mathlib's relative different ideal; it is a local invariant, not the global relative
discriminant owned by Number-Field Arithmetic #191. -/
noncomputable def differentExponent [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] : ℕ :=
  multiplicity 𝓂[L] (differentIdeal 𝒪[K] 𝒪[L])

/-- **Layer 3, the local discriminant ideal.** This is the relative norm to `𝒪[K]` of the local
different. It is distinct from the different ideal and from the global relative discriminant
package owned by #191. -/
noncomputable def localDiscriminantIdeal [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] : Ideal 𝒪[K] :=
  sorry

/-- **Layer 3, the local discriminant exponent** at the unique maximal ideal of the base. -/
noncomputable def discriminantExponent [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] : ℕ :=
  multiplicity 𝓂[K] (localDiscriminantIdeal K L)

/-- **Layer 3, comparison of local discriminant and different exponents.** -/
theorem discriminantExponent_eq_inertiaDegree_mul_differentExponent
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    discriminantExponent K L = inertiaDegree K L * differentExponent K L :=
  sorry

/-- **Layer 3, invariance of the different exponent under a `K`-isomorphism.** The unique
extension of the valuation makes every `K`-algebra equivalence compatible with the maximal
ideals and the trace different. -/
theorem differentExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : differentExponent K L = differentExponent K M :=
  sorry

/-- **Layer 3, invariance of the local discriminant exponent under a `K`-isomorphism.** This
export is consumed by `TotallyRamified`, which derives invariance of its mass-formula weight from
it. No dependency on that roadmap is introduced here. -/
theorem discriminantExponent_eq_of_algEquiv
    (M : Type v) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    [Algebra K M] [ValuativeExtension K M] [Module.Finite K M] [Algebra.IsSeparable K M]
    (e : L ≃ₐ[K] M) : discriminantExponent K L = discriminantExponent K M :=
  sorry

/-- **Layer 3, Hilbert's local different formula.** The sum is finite because the lower
ramification groups are trivial at sufficiently large indices. -/
theorem differentExponent_eq_finsum_lowerRamificationGroup [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [Algebra.IsSeparable K L] :
    differentExponent K L =
      ∑ᶠ i : ℕ, (Nat.card (lowerRamificationGroup K L (i : ℤ)) - 1) :=
  sorry

/-- **Layer 3, the sharp lower bound and its equality criterion.** For a finite separable local
extension, `d(L/K) = e(L/K) - 1` exactly in the tame case; hence wild ramification forces
`e(L/K) ≤ d(L/K)`. -/
theorem differentExponent_eq_ramificationIndex_sub_one_iff [Algebra K L]
    [ValuativeExtension K L] [Module.Finite K L] [Algebra.IsSeparable K L] :
    differentExponent K L = ramificationIndex K L - 1 ↔ IsTamelyRamified K L :=
  sorry

/-- **Layer 3, wild different bounds.** The lower bound holds for every finite separable wild
extension. The upper bound uses the nonvanishing of `e` in `L`, excluding the equal-characteristic
case where its valuation is not finite. -/
theorem differentExponent_bounds_of_wild [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [Algebra.IsSeparable K L] (hwild : IsWildlyRamified K L)
    (he : (ramificationIndex K L : L) ≠ 0) :
    ramificationIndex K L ≤ differentExponent K L ∧
      differentExponent K L ≤ ramificationIndex K L - 1 +
        natCastValuation L (ramificationIndex K L) he :=
  sorry

/-- **Layer 3, worked example: a totally ramified quadratic extension.** `ℚ_2(√2)/ℚ_2` has
degree `2` (Eisenstein `X² − 2`); the general milestone is the totally-ramified ↔ Eisenstein
correspondence. -/
example :
    Module.finrank ℚ_[2]
      (IntermediateField.adjoin ℚ_[2] {x : AlgebraicClosure ℚ_[2] | x ^ 2 = 2}) = 2 :=
  sorry

/-- **Layer 3, worked example: the dyadic cyclotomic tower is totally ramified.**
`[ℚ_2(μ_8) : ℚ_2] = φ(8) = 4`. Its ramification filtration `G = G_0 = G_1 ⊋ G_2 = G_3 ⊋
G_4 = 1`, the resulting Herbrand jumps, and the failure of lower-numbering quotient
compatibility that it witnesses are the README's Layer-3 acceptance computations, stated once
the filtration exists. -/
example :
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
  sorry

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

/-! ## Layer 4: the absolute Galois group, wild inertia, and the tame quotient

⚠ Profinite Sylow theory, free profinite groups and profinite presentations are **not** restated
here in Galois vocabulary: the Sylow theory is imported from `ProfiniteProPGroups`, and free
profinite groups and presentations from Tau Ceti (`TauCeti.freeProfiniteGroup`,
`TauCeti.presentedProfiniteGroup`). What this roadmap owns is the identification of the abstract
objects with the Galois-theoretic ones. -/

section Layer4

/- A declaration below that carries a Tau Ceti name shadows the opened namespace; deleting it when
the pin moves makes each of its uses resolve to Tau Ceti's declaration. -/
open TauCeti

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 1, `U(K,1)` is pro-`p`**, stated in exactly the supplier's quotient form: every
continuous finite quotient of the depth-one unit group is a `p`-group. ⚠ This is the same
statement as "`U(K,1)` is the inverse limit of the `p`-groups `U(K,1)/U(K,i)`", not a rephrasing
of it, which is why it is stated against `ProfiniteProPGroups.IsProP` and not against a local
predicate. `p` is the residue characteristic. -/
theorem unitFiltration_one_isProP (hp : ringChar 𝓀[K] = p) :
    ProfiniteProPGroups.IsProP p (unitFiltration K 1) :=
  sorry

/-- **Layer 4, the maximal unramified extension** `K^ur = ⋃ K_n` inside the fixed ambient
algebraic closure: `maximalUnramifiedExtension` of Layer 2 at `Ω = AlgebraicClosure K`, under the
name `ClassFieldTheory` consumes. Layer 2's finite unramified extensions are its finite
subextensions. -/
noncomputable abbrev maximalUnramified : IntermediateField K (AlgebraicClosure K) :=
  maximalUnramifiedExtension K (AlgebraicClosure K)

/-- **Layer 4, the maximal tamely ramified extension** `K^t = ⋃_{p ∤ m} K^ur(π^{1/m})`. -/
noncomputable def maximalTame : IntermediateField K (AlgebraicClosure K) :=
  sorry

/-! ### Inertia and arithmetic Frobenius lifts, from Tau Ceti

Tau Ceti's inertia subgroup and arithmetic Frobenius lifts are newer than the Tau Ceti revision
this library is pinned to, so they are stated here once, under their Tau Ceti names and with their
Tau Ceti signatures. -/

/-- **Layer 4, inertia** `I_K = Gal(K^al/K^ur)`, the fixing subgroup of
`maximalUnramifiedExtension K (AlgebraicClosure K)`. Tau Ceti's `TauCeti.inertiaSubgroup`
(`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`); stated here because the pinned Tau
Ceti revision predates it; replaced by the import when the pin moves. -/
noncomputable def inertiaSubgroup (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Subgroup (Field.absoluteGaloisGroup K) :=
  sorry

/-- **Layer 4.** Inertia is closed in the Krull topology. Tau Ceti's
`TauCeti.isClosed_inertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`);
stated here because the pinned Tau Ceti revision predates it; replaced by the import when the pin
moves. -/
theorem isClosed_inertiaSubgroup :
    IsClosed (inertiaSubgroup K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

/-- **Layer 4.** Inertia is normal, because `K^ur/K` is normal. Tau Ceti's
`TauCeti.inertiaSubgroup_normal` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`);
stated here because the pinned Tau Ceti revision predates it; replaced by the import when the pin
moves. -/
instance inertiaSubgroup_normal : (inertiaSubgroup K).Normal :=
  sorry

/-- **Layer 4, inertia under the name `ClassFieldTheory` states against**: a reducible alias of
Tau Ceti's `TauCeti.inertiaSubgroup`, so that a statement about `inertia K` is a statement about
it. -/
noncomputable abbrev inertia : Subgroup (Field.absoluteGaloisGroup K) :=
  inertiaSubgroup K

/-- **Layer 4, restriction to `K^ur`**, `G_K →* Gal(K^ur/K)`: a continuous surjection with kernel
`I_K`, which with `maximalUnramifiedGaloisGroupEquivZHat` is the exact sequence
`1 → I_K → G_K → Ẑ → 1`. Tau Ceti's `TauCeti.restrictMaximalUnramifiedHom`
(`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`); stated here because the pinned Tau
Ceti revision predates it; replaced by the import when the pin moves. -/
noncomputable def restrictMaximalUnramifiedHom :
    Field.absoluteGaloisGroup K →* Gal(maximalUnramifiedExtension K (AlgebraicClosure K)/K) :=
  sorry

/-- **Layer 4, arithmetic Frobenius lifts**: the elements of `G_K` restricting to the arithmetic
Frobenius of `K^ur`. They form a left coset of `I_K`
(`TauCeti.IsArithFrobeniusLift.setOf_eq_leftCoset`), and each of them generates `G_K`
topologically together with `I_K`
(`TauCeti.IsArithFrobeniusLift.topologicalClosure_zpowers_sup_inertiaSubgroup`). Tau Ceti's
`TauCeti.IsArithFrobeniusLift` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`), with
its Tau Ceti body; stated here because the pinned Tau Ceti revision predates it; replaced by the
import when the pin moves. -/
def IsArithFrobeniusLift (σ : Field.absoluteGaloisGroup K) : Prop :=
  restrictMaximalUnramifiedHom K σ = maximalUnramifiedFrobenius K (AlgebraicClosure K)

/-- **Layer 4.** Arithmetic Frobenius lifts exist, because restriction to `K^ur` is surjective.
Tau Ceti's `TauCeti.exists_isArithFrobeniusLift`
(`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`); stated here because the pinned Tau
Ceti revision predates it; replaced by the import when the pin moves. -/
theorem exists_isArithFrobeniusLift :
    ∃ σ : Field.absoluteGaloisGroup K, IsArithFrobeniusLift K σ :=
  sorry

/-- **Layer 4, the unramified quotient** `G_K/I_K`. Tau Ceti's `TauCeti.unramifiedQuotient`
(`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`), with its Tau Ceti body; stated here
because the pinned Tau Ceti revision predates it; replaced by the import when the pin moves.
⚠ Named, because `ClassFieldTheory` Layer 9 defines the local Weil group through the map to it,
and a nameless quotient cannot be the subject of that definition. -/
abbrev unramifiedQuotient : Type u :=
  Field.absoluteGaloisGroup K ⧸ inertiaSubgroup K

/-- **Layer 4, the unramified degree map** `G_K ↠ G_K/I_K`, the quotient map. Tau Ceti's
`TauCeti.unramifiedDegree` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`), with its
Tau Ceti body; stated here because the pinned Tau Ceti revision predates it; replaced by the
import when the pin moves. -/
noncomputable def unramifiedDegree :
    Field.absoluteGaloisGroup K →* unramifiedQuotient K :=
  QuotientGroup.mk' (inertiaSubgroup K)

/-- **Layer 4.** Restriction to `K^ur` identifies the unramified quotient with `Gal(K^ur/K)` as a
topological group. Tau Ceti's `TauCeti.quotientInertiaSubgroupEquiv`
(`TauCeti/NumberTheory/LocalField/Unramified/Inertia.lean`); stated here because the pinned Tau
Ceti revision predates it; replaced by the import when the pin moves. -/
noncomputable def quotientInertiaSubgroupEquiv :
    unramifiedQuotient K ≃ₜ* Gal(maximalUnramifiedExtension K (AlgebraicClosure K)/K) :=
  sorry

/-- **Layer 4.** The unramified quotient is `Ẑ`. The isomorphism is marked: it is
`quotientInertiaSubgroupEquiv` followed by `maximalUnramifiedGaloisGroupEquivZHat`, which sends the
arithmetic Frobenius to `TauCeti.zHat.gen`, and this existence statement is its closed corollary.
⚠ The identification is with Tau Ceti's `TauCeti.zHat`: this roadmap builds no second profinite
completion of `ℤ`. -/
theorem unramifiedQuotient_equiv_zhat :
    Nonempty (unramifiedQuotient K ≃ₜ* TauCeti.zHat) :=
  ⟨(quotientInertiaSubgroupEquiv K).trans
    (maximalUnramifiedGaloisGroupEquivZHat K (AlgebraicClosure K))⟩

/-! ### Wild inertia -/

/-- **Layer 4, wild inertia** `P_K = Gal(K^al/K^t)`, the fixing subgroup of `maximalTame`. -/
noncomputable def wildInertia : Subgroup (Field.absoluteGaloisGroup K) :=
  sorry

/-- **Layer 4.** Wild inertia sits inside inertia, because `K^ur ⊆ K^t`. -/
theorem wildInertia_le_inertia : wildInertia K ≤ inertia K :=
  sorry

/-- **Layer 4.** `I_K` is compact, as a closed subgroup (`isClosed_inertiaSubgroup`) of the compact
group `G_K`; with the next statement this is the profiniteness of `I_K` in the form the supplier's
Sylow theorems ask for. -/
theorem inertia_compactSpace : CompactSpace (inertia K) :=
  sorry

/-- **Layer 4.** `I_K` is totally disconnected, as a subspace of `G_K`. -/
theorem inertia_totallyDisconnectedSpace : TotallyDisconnectedSpace (inertia K) :=
  sorry

/-- **Layer 4.** `P_K` is normal in `I_K` — it is even normal in `G_K`, since `K^t/K` is Galois.
Normality inside `I_K` is what the supplier's uniqueness theorem consumes, and it is an
`instance` because the tame quotient `I_K/P_K` of `tameInertiaEquiv` has no group structure
without it. -/
instance wildInertia_subgroupOf_normal : ((wildInertia K).subgroupOf (inertia K)).Normal :=
  sorry

/-- **Layer 4, wild inertia is pro-`p`.** Stated separately from the Sylow identification below,
because it is the hypothesis that identification consumes and a consumer may need it alone. -/
theorem wildInertia_isProP (hp : ringChar 𝓀[K] = p) :
    ProfiniteProPGroups.IsProP p (wildInertia K) :=
  sorry

/-- **Layer 4.** The primes other than the residue characteristic: the index set of the
prime-to-`p` Tate module. -/
abbrev PrimesAway (p : ℕ) : Type := {ℓ : Nat.Primes // (ℓ : ℕ) ≠ p}

/-- ⚠ Mathlib carries `Fact p.1.Prime` for a bundled `p : Nat.Primes` only as a `local instance`
in one file, so `ℤ_[ℓ]` does not elaborate for a bundled prime without this. -/
local instance factPrimePrimesAway {p : ℕ} (ℓ : PrimesAway p) :
    Fact ((ℓ : Nat.Primes) : ℕ).Prime :=
  ⟨(ℓ : Nat.Primes).2⟩

/-- **Layer 4, the tame character.** `I_K/P_K ≅ Ẑ^{(p')}(1)`, the prime-to-`p` Tate module of
`μ`, by `σ ↦ (σ(π^{1/m})/π^{1/m})_m`; as a profinite group it is `∏_{ℓ ≠ p} ℤ_ℓ`.
⚠ The isomorphism depends on the choice of a uniformizer and of a compatible system of roots, and
independence of those choices is a separate milestone of this layer. The Frobenius twist, which is
what the `(1)` in the notation records, is stated intrinsically, without the isomorphism, by
`tameQuotient_mk_conj_of_isArithFrobeniusLift`. -/
theorem tameInertiaEquiv (hp : ringChar 𝓀[K] = p) :
    Nonempty ((inertia K) ⧸ ((wildInertia K).subgroupOf (inertia K)) ≃ₜ*
      Multiplicative (∀ ℓ : PrimesAway p, ℤ_[(ℓ : Nat.Primes)])) :=
  sorry

/-- **Layer 4, the Sylow identification.** `P_K` is *the* pro-`p` Sylow subgroup of `I_K`, with `p`
the residue characteristic. This is the one theorem of the layer that is about wild inertia rather
than about profinite groups; conjugacy, existence and the containment theorem are the supplier's
(`exists_isProPSylow`, `IsProP.exists_le_isProPSylow`, `IsProPSylow.map_of_surjective`) and are not
restated. -/
theorem wildInertia_isProPSylow (hp : ringChar 𝓀[K] = p) :
    ProfiniteProPGroups.IsProPSylow p ((wildInertia K).subgroupOf (inertia K)) :=
  sorry

/-- **Layer 4, acceptance: the uniqueness of `P_K` is the supplier's theorem, applied.** A closed
proof, so the contract is type-checked rather than promised: any pro-`p` Sylow subgroup of `I_K`
equals wild inertia. If `IsProPSylow.eq_of_normal` changes its name, argument order or hypotheses,
this breaks. -/
example (hp : ringChar 𝓀[K] = p) (Q : Subgroup (inertia K))
    (hQ : ProfiniteProPGroups.IsProPSylow p Q) :
    (wildInertia K).subgroupOf (inertia K) = Q := by
  have := inertia_compactSpace K
  have := inertia_totallyDisconnectedSpace K
  exact ProfiniteProPGroups.IsProPSylow.eq_of_normal p _ _ _
    (wildInertia_isProPSylow K p hp) hQ (wildInertia_subgroupOf_normal K)

/-- **Layer 4.** `P_K` is normal in `G_K`, so the tame quotient below is a group. -/
instance wildInertia_normal : (wildInertia K).Normal :=
  sorry

/-- **Layer 4.** `P_K` is closed, as the fixing subgroup of `K^t`. This is what makes the tame
quotient Hausdorff (`QuotientGroup.instT3Space`), hence profinite, so that the topological
isomorphisms below are statements about a profinite group. -/
theorem wildInertia_isClosed : IsClosed (wildInertia K : Set (Field.absoluteGaloisGroup K)) :=
  sorry

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

/-- **Layer 4.** Tame inertia is abelian: `tameInertiaEquiv` identifies it with `Ẑ^{(p')}(1)`. -/
instance tameInertia_isMulCommutative : IsMulCommutative (tameInertia K) :=
  sorry

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
  sorry

/-- **Layer 4, tame inertia is procyclic**: some `τ` has a class that topologically generates
`I_K/P_K`. Such a `τ` lies in `I_K`, since `P_K ≤ I_K`, and it is the generator the Iwasawa
presentation is marked by. -/
theorem exists_topologicalClosure_zpowers_eq_tameInertia :
    ∃ τ : Field.absoluteGaloisGroup K,
      (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
        tameInertia K :=
  sorry

/-! ### The Iwasawa presentation, marked -/

/-- **Layer 4, the Iwasawa relator** `σ τ σ⁻¹ τ^{−q}` in Tau Ceti's free profinite group on two
generators, with `q = #𝓀[K]` and `σ = of 0` the **arithmetic** Frobenius. ⚠ Writing `σ τ σ⁻¹ τ^q`
presents a different group, and writing `σ⁻¹ τ σ τ^{−q}` presents the geometric form
`iwasawaRelatorGeometric` below. The index type is `ULift (Fin 2)`, not `Fin 2`:
`TauCeti.freeProfiniteGroup X` lives in `X`'s universe and `G_K^t` lives in `K`'s. -/
noncomputable def iwasawaRelator : TauCeti.freeProfiniteGroup (ULift.{u} (Fin 2)) :=
  TauCeti.freeProfiniteGroup.of (ULift.up 0) * TauCeti.freeProfiniteGroup.of (ULift.up 1) *
      (TauCeti.freeProfiniteGroup.of (ULift.up 0))⁻¹ *
    TauCeti.freeProfiniteGroup.of (ULift.up 1) ^ (-(Nat.card 𝓀[K] : ℤ))

/-- **Layer 4, the Iwasawa group** `⟨σ, τ | σ τ σ⁻¹ = τ^q⟩`: the **profinite** group presented by
`iwasawaRelator`, that is, the quotient of Tau Ceti's free profinite group by the *closed* normal
closure of the relator. ⚠ The presented pro-`p` group of the same shape is a different group: it
forgets the prime-to-`p` tame inertia this presentation is about. -/
abbrev IwasawaGroup : Type u :=
  TauCeti.presentedProfiniteGroup (ULift.{u} (Fin 2)) {iwasawaRelator K}

/-- **Layer 4.** The marked generator `σ = of 0` of `IwasawaGroup K`, the image of the arithmetic
Frobenius. -/
noncomputable abbrev iwasawaSigma : IwasawaGroup K :=
  TauCeti.presentedProfiniteGroup.of {iwasawaRelator K} (ULift.up 0)

/-- **Layer 4.** The marked generator `τ = of 1` of `IwasawaGroup K`, the image of the tame
inertia generator. -/
noncomputable abbrev iwasawaTau : IwasawaGroup K :=
  TauCeti.presentedProfiniteGroup.of {iwasawaRelator K} (ULift.up 1)

/-- **Layer 4, the coordinate of the Iwasawa group**: `σ ↦ TauCeti.zHat.gen` and `τ ↦ 1`. It kills
the relator, since `gen * 1 * gen⁻¹ * 1 = 1`, and the two rules below determine it (the acceptance
example after them). -/
noncomputable def iwasawaCoordinate : IwasawaGroup K →ₜ* TauCeti.zHat :=
  sorry

/-- **Layer 4.** The coordinate sends `σ` to the canonical generator of `Ẑ`. -/
@[simp]
theorem iwasawaCoordinate_sigma : iwasawaCoordinate K (iwasawaSigma K) = TauCeti.zHat.gen :=
  sorry

/-- **Layer 4.** The coordinate kills `τ`. -/
@[simp]
theorem iwasawaCoordinate_tau : iwasawaCoordinate K (iwasawaTau K) = 1 :=
  sorry

/-- **Layer 4.** The kernel of the coordinate is the closed normal closure of `τ`. -/
theorem ker_iwasawaCoordinate :
    (iwasawaCoordinate K).toMonoidHom.ker =
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  sorry

/-- **Layer 4, acceptance: the two rules determine the coordinate.** A closed proof through Tau
Ceti's `TauCeti.presentedProfiniteGroup.hom_ext_of`. -/
example (χ : IwasawaGroup K →ₜ* TauCeti.zHat) (h₀ : χ (iwasawaSigma K) = TauCeti.zHat.gen)
    (h₁ : χ (iwasawaTau K) = 1) : χ = iwasawaCoordinate K := by
  refine presentedProfiniteGroup.hom_ext_of fun x => ?_
  rcases x with ⟨i⟩
  fin_cases i
  · exact h₀.trans (iwasawaCoordinate_sigma K).symm
  · exact h₁.trans (iwasawaCoordinate_tau K).symm

/-- **Layer 4, the Iwasawa presentation, marked.** For an arithmetic Frobenius lift `σ` and a `τ`
whose class topologically generates tame inertia, the topological isomorphism
`G_K/P_K ≃ₜ* ⟨σ, τ | σ τ σ⁻¹ = τ^q⟩` sending `σ̄ ↦ of 0` and `τ̄ ↦ of 1` (Iwasawa; NSW (7.5.3)).
The two computation rules below determine it (the acceptance example after them), so nothing
about it is a choice beyond `σ` and `τ`. -/
noncomputable def tameQuotientEquiv (σ τ : Field.absoluteGaloisGroup K)
    (hσ : IsArithFrobeniusLift K σ)
    (hτ : (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
      tameInertia K) :
    tameQuotient K ≃ₜ* IwasawaGroup K :=
  sorry

section Marked

variable {K} {σ τ : Field.absoluteGaloisGroup K} {hσ : IsArithFrobeniusLift K σ}
  {hτ : (Subgroup.zpowers (QuotientGroup.mk τ : tameQuotient K)).topologicalClosure =
    tameInertia K}

/-- **Layer 4.** The marked isomorphism sends the Frobenius lift `σ` to `of 0`. -/
@[simp]
theorem tameQuotientEquiv_mk_frobenius :
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk σ) = iwasawaSigma K :=
  sorry

/-- **Layer 4.** The marked isomorphism sends the tame inertia generator `τ` to `of 1`. -/
@[simp]
theorem tameQuotientEquiv_mk_tameGenerator :
    tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk τ) = iwasawaTau K :=
  sorry

/-- **Layer 4, acceptance: the two rules determine the marked isomorphism.** A closed proof through
Tau Ceti's `TauCeti.presentedProfiniteGroup.hom_ext_of`, applied to the inverses, which are
continuous homomorphisms into the tame quotient, Hausdorff by `wildInertia_isClosed`. -/
example (e : tameQuotient K ≃ₜ* IwasawaGroup K) (he₀ : e (QuotientGroup.mk σ) = iwasawaSigma K)
    (he₁ : e (QuotientGroup.mk τ) = iwasawaTau K) : e = tameQuotientEquiv K σ τ hσ hτ := by
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
  sorry

/-- **Layer 4, choice-free consequence: every arithmetic Frobenius lift** lands in the coset
`of 0 · ⟨⟨of 1⟩⟩`, whatever the choices of `σ` and `τ`; the membership is spelled as in
`TauCeti.IsArithFrobeniusLift.isArithFrobeniusLift_iff_inv_mul_mem`. -/
theorem tameQuotientEquiv_mk_of_isArithFrobeniusLift {φ : Field.absoluteGaloisGroup K}
    (hφ : IsArithFrobeniusLift K φ) :
    (iwasawaSigma K)⁻¹ * tameQuotientEquiv K σ τ hσ hτ (QuotientGroup.mk φ) ∈
      (Subgroup.normalClosure {iwasawaTau K}).topologicalClosure :=
  sorry

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
  sorry

end Marked

/-- **Layer 4, the Iwasawa presentation, unmarked.** `G_K^t` is the profinite group presented by
`iwasawaRelator`. A closed corollary of `tameQuotientEquiv`, with a Frobenius lift from
`exists_isArithFrobeniusLift` and a tame generator from
`exists_topologicalClosure_zpowers_eq_tameInertia`. ⚠ Theorems about the presentation are stated
against the marked `tameQuotientEquiv`: this statement alone cannot tell the arithmetic relator
from the geometric one, which presents an isomorphic group. -/
theorem tameQuotientPresentation :
    Nonempty (tameQuotient K ≃ₜ*
      TauCeti.presentedProfiniteGroup (ULift.{u} (Fin 2)) {iwasawaRelator K}) := by
  obtain ⟨σ, hσ⟩ := exists_isArithFrobeniusLift K
  obtain ⟨τ, hτ⟩ := exists_topologicalClosure_zpowers_eq_tameInertia K
  exact ⟨tameQuotientEquiv K σ τ hσ hτ⟩

/-! ### The geometric form -/

/-- **Layer 4, the geometric relator** `σ⁻¹ τ σ τ^{−q}`: the image of `iwasawaRelator` under
`σ ↦ σ⁻¹`, `τ ↦ τ`. -/
noncomputable def iwasawaRelatorGeometric : TauCeti.freeProfiniteGroup (ULift.{u} (Fin 2)) :=
  (TauCeti.freeProfiniteGroup.of (ULift.up 0))⁻¹ * TauCeti.freeProfiniteGroup.of (ULift.up 1) *
      TauCeti.freeProfiniteGroup.of (ULift.up 0) *
    TauCeti.freeProfiniteGroup.of (ULift.up 1) ^ (-(Nat.card 𝓀[K] : ℤ))

/-- **Layer 4, the geometric Iwasawa group** `⟨σ', τ | σ'⁻¹ τ σ' = τ^q⟩`, whose marked generator
`σ' = of 0` is the image of the geometric Frobenius. -/
abbrev IwasawaGroupGeometric : Type u :=
  TauCeti.presentedProfiniteGroup (ULift.{u} (Fin 2)) {iwasawaRelatorGeometric K}

/-- **Layer 4.** The marked generator `σ' = of 0` of `IwasawaGroupGeometric K`. -/
noncomputable abbrev iwasawaSigmaGeometric : IwasawaGroupGeometric K :=
  TauCeti.presentedProfiniteGroup.of {iwasawaRelatorGeometric K} (ULift.up 0)

/-- **Layer 4.** The marked generator `τ = of 1` of `IwasawaGroupGeometric K`. -/
noncomputable abbrev iwasawaTauGeometric : IwasawaGroupGeometric K :=
  TauCeti.presentedProfiniteGroup.of {iwasawaRelatorGeometric K} (ULift.up 1)

/-- **Layer 4, the geometric translation** `σ ↦ σ⁻¹`, `τ ↦ τ`: Tau Ceti's
`TauCeti.presentedProfiniteGroup.congr` applied to the involution of the free profinite group that
inverts `of 0` and fixes `of 1`, which carries `iwasawaRelator` to `iwasawaRelatorGeometric`.
Composed with `tameQuotientEquiv`, it sends the class of the geometric Frobenius `σ⁻¹` to
`iwasawaSigmaGeometric`. -/
noncomputable def iwasawaGeometricEquiv : IwasawaGroup K ≃ₜ* IwasawaGroupGeometric K :=
  sorry

/-- **Layer 4.** The geometric translation sends `σ` to the inverse of the geometric generator. -/
@[simp]
theorem iwasawaGeometricEquiv_sigma :
    iwasawaGeometricEquiv K (iwasawaSigma K) = (iwasawaSigmaGeometric K)⁻¹ :=
  sorry

/-- **Layer 4.** The geometric translation fixes the tame generator. -/
@[simp]
theorem iwasawaGeometricEquiv_tau :
    iwasawaGeometricEquiv K (iwasawaTau K) = iwasawaTauGeometric K :=
  sorry

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

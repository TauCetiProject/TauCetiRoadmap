# Roadmap: ramification of complete discretely valued fields

**Summary.** This roadmap continues
[LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md) past the
nonarchimedean local fields it treats. It builds the finite ramification package over every
field complete for a discrete valuation, in equal and mixed characteristic and with a residue
field that need not be finite: the integral closure as a complete discrete valuation ring, on
which Tau Ceti's lower filtration and lower index apply, the graded embeddings of the lower
filtration, Hilbert's different formula, the Herbrand functions and the upper numbering, with
Herbrand's quotient theorem and tower transitivity for separable residue extension, and the
Hasse–Arf theorem for abelian extensions with separable residue extension, together with the
residue-enlargement, proalgebraic-unit and graded-norm targets its proof needs. Over a perfect
residue field it then builds the absolute upper filtration of the absolute Galois group, with
inertia and wild inertia as its terms at `0` and `0+`, the transition function `ψ_(L/K)` of a
finite separable extension with the open-subgroup identity, and the comparison with the
completed maximal unramified extension. On a nonarchimedean local field each object is the
completed roadmap's, and the agreement is a target here. The package is the ramification theory
that `p`-adic Hodge theory, integral `p`-adic Hodge theory, the conductors of Galois
representations and the unit-filtration form of local class field theory consume over bases such
as `F̄_p((t))` and `Frac W(F̄_p)`.

| Layer | Title | What it builds |
|---|---|---|
| 3a | Ramification over complete discretely valued fields | integer rings and the lower filtration on the local-ring carrier, the lower index and Hilbert's formula, Herbrand functions and the upper numbering, Hasse–Arf with its residue-enlargement, proalgebraic-unit and graded-norm inputs, the finite-local-field agreement |
| 4a | The absolute upper filtration over a perfect residue field | `G_K^u` with its finite projections, inertia and wild inertia, `ψ_(L/K)` and the open-subgroup identity, completed maximal unramified base change |

Layers 3a and 4a, and every section number of the form §3a.x or §4a.x, are this roadmap's own.
The completed roadmap is cited through the Tau Ceti declarations that prove its results, by name
and by file under `TauCeti/NumberTheory/LocalField/`, as listed in the supplier contract below,
and not by its layer numbers; everything consumed from it here is proved in the pinned Tau Ceti.

## Scope and ownership

This roadmap owns, over an arbitrary complete discretely valued field `K` with integer ring `A`
and residue field `k`:

- 3a: the identification of the integral closure `B` of `A` in a finite Galois extension `L` as
  a complete discrete valuation ring free over `A`, with the valuation of `L` the unique
  prolongation of that of `K`; the graded embeddings of `G_0/G_1` and `G_i/G_(i+1)` on Tau Ceti's
  local-ring carrier and their consequences for `G_0` and `G_1`; Hilbert's different formula;
  the Herbrand functions `φ`, `ψ`
  and the upper groups of a finite group acting on a local ring, with their analytic properties
  and the correspondence of jumps, and, for separable residue extension, Herbrand's theorem,
  tower transitivity and the intersection formula; Hasse–Arf for abelian `G` and separable
  residue extension, with the residue-enlargement construction, the proalgebraic unit groups
  with their norm-kernel components, and the graded norms with filtered norm-kernel components,
  all over an algebraically closed residue field; and
  the agreement of every one of these objects with the completed roadmap's on a nonarchimedean
  local field.
- 4a: over a perfect residue field, the absolute upper filtration `G_K^u` and `G_K^(u+)` of
  `Field.absoluteGaloisGroup K`, defined relative to a valuation subring of `AlgebraicClosure K`,
  its closedness, normality, antitonicity, finite projections and separation, the identification
  of `G_K^0` with inertia (for every field and every valuation subring) and of `G_K^(0+)` with wild
  inertia, and,
  on a nonarchimedean local field, of the finite images of `G_K^u` with the completed roadmap's
  upper groups; the transition function `ψ_(L/K)` of a finite separable extension, its
  independence of the Galois closure, the tower law, the open-subgroup identity
  `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` and the integral formula, each also in its finite-level form at
  every finite Galois `M ⊇ L`; the completion `K′` of the maximal unramified extension, the
  equivalence of finite separable extensions of `K^ur` and of `K′`, the isomorphism
  `G_(K′) ≅ I_K`, and the preservation of `e`, the different, the lower and upper groups and the
  absolute upper groups under base change to `K′`.

The completed roadmap owns everything on nonarchimedean local fields: the normalized valuation,
`e` and `f`, the unit filtration, unramified extensions and Frobenius, the lower and upper
ramification groups, Herbrand functions and the different there, wild inertia, the tame
character and the Iwasawa presentation of the tame quotient. Among these is the Hasse–Arf theorem
for finite abelian extensions of nonarchimedean local fields, Tau Ceti's
`TauCeti.LocalFieldsRamification.hasseArf`; this roadmap owns its generalization to every
complete discretely valued field with separable residue extension (§3a.3). This roadmap defines
its objects on the general carrier and proves that they restrict to those; it defines nothing a
second time on local fields.

The following belong elsewhere and are consumed, where needed, under their owners' names.
Mathlib's `Ideal.sum_ramification_inertia_eq_card` gives `[L : K] = #G = ef` once `B` is a
discrete valuation ring finite and flat over `A`: its sum over the primes of `B` above `𝔪_A`
has the single term `𝔪_B`. Tau Ceti proves on its local-ring carrier, without completeness or
residue finiteness, integral monogenicity
(`TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top`), the lower index at a generator
(`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`), `G_i = G` for `i ≤ −1`
(`TauCeti.IsLocalRing.ramificationGroup_eq_top_of_le_neg_one`), normality
(`TauCeti.IsLocalRing.instNormalRamificationGroup`), antitonicity
(`TauCeti.IsLocalRing.ramificationGroup_antitone`), `G_0` as the kernel of the action on the
residue field (`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut`), eventual
triviality (`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`) and `H_i = H ∩ G_i`
(`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`).

ClassFieldTheory owns local reciprocity, local duality, finite-group Tate cohomology and the
reciprocity–filtration compatibilities. LocalGaloisGroups owns the maximal pro-`p` quotient of the
absolute Galois group and its presentation. ProfiniteProPGroups owns pro-`p` groups, whose
predicate is Tau Ceti's `TauCeti.IsProP`. EtaleCohomologyFoundations §F.3a owns, for every
henselian discrete valuation ring with residue characteristic `p ≥ 0`, the inertia group `I` in
the absolute Galois group of its fraction field, the wild inertia `P` as the inverse limit of the
finite wild inertia groups, the tame character `t_ℓ : I → ℤ_ℓ(1)` for primes `ℓ ≠ p` and the tame
quotient `I/P ≅ ∏_(ℓ ≠ p) ℤ_ℓ(1)`. This roadmap consumes nothing from that section and states
neither the tame character nor the tame quotient: §3a.1 stays at the finite-level embedding of
`G_0/G_1` in the residue units, and of inertia and wild inertia §4a.1 states their identification
with the filtration terms `G_K^0` and `G_K^(0+)`, for `I_K` and `P_K` as in the Conventions, and
that `P_K` is pro-`p`, or trivial in residue characteristic zero. ReductiveGroups Layer 3 owns
finite-type algebraic groups, their closed subgroups, normal quotients and identity components;
SchemeAndStackFoundations §0.24 owns perfection in characteristic `p`; AdicSpacesPartII §R0.19.9
owns the generic pro-category with its limit–colimit Hom formula. PadicPeriodRings owns the
geometric reciprocity construction on the proalgebraic unit groups built in §3a.3, with its
finite-isogeny fundamental group, reciprocity map and Sen tower estimates. ReductiveGroupsPartII
§RG2.0.4 owns the completed maximal unramified extension `Breve E` of a nonarchimedean local field
`E`, its extended arithmetic Frobenius and its fixed-field results; §4a.3 proves that this
roadmap's `K′` is `Breve E` on such a field.

Two objects of nonarchimedean local fields are this roadmap's, because the completed roadmap stops
at finite Galois levels and at the tame quotient. The absolute upper ramification groups `G_K^u`
of a nonarchimedean local field, at every real depth `u ≥ −1` and in particular at the integers,
are §4a.1's; §4a.1 proves that their image at each finite Galois level `M` is the completed
roadmap's `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u`. The function `ψ_(L/K)`
of a finite separable, not necessarily Galois, extension of nonarchimedean local fields, with its
independence of the Galois closure, its tower law, the finite-level subgroup identity and the
integral formula, is §4a.2's, read through §3a.2's agreement. A roadmap that uses either object
on local fields cites §4a.1 or §4a.2 and does not define it a second time.

## Conventions

Throughout, `A` is a complete discrete valuation ring (`IsDiscreteValuationRing A` and
`IsAdicComplete (IsLocalRing.maximalIdeal A) A`) with fraction field `K` and residue field
`k = IsLocalRing.ResidueField A`; `L/K` is a finite Galois extension with group `G`; and `B` is
the integral closure of `A` in `L`, on which `G` acts by `A`-algebra automorphisms with
`Algebra.IsInvariant A B G`. Valuations are normalized additively by `v_K(Kˣ) = v_L(Lˣ) = ℤ`,
`e = e(L/K)` is the ramification index and `f = f(L/K)` the residue degree. The residue
extension `IsLocalRing.ResidueField B / k` is assumed separable wherever a statement says so;
this holds for every `L` when `k` is perfect, and Layer 4a assumes `k` perfect throughout.

The lower filtration is Tau Ceti's filtration of a group acting on a local ring:
`TauCeti.IsLocalRing.ramificationGroup G B i` for `i : ℤ`, equal to
`Ideal.ramificationGroup G (IsLocalRing.maximalIdeal B) i` for `i ≥ 0`
(`TauCeti.IsLocalRing.ramificationGroup_natCast`), its real-indexed form
`TauCeti.IsLocalRing.ramificationGroupReal G B u`, which is `G_(⌈u⌉)`, and the lower index
`TauCeti.IsLocalRing.lowerIndex B σ = min_x v_L(σx − x)`. Upper numbering is the one functorial
under quotients, `G^(φ(u)) = G_u`, and jumps are the `u` with `G^v ≠ G^u` for every `v > u`.
Arithmetic Frobenius is primary and geometric Frobenius is its inverse. `G_K` is Mathlib's
`Field.absoluteGaloisGroup K` with the Krull topology, and its finite levels are the
`M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`. `K^ur` is the compositum of the finite
subextensions of the algebraic closure with `e = 1`, `I_K` its fixing subgroup and `P_K` the
inverse limit of the finite groups `G_1`; `K′` is the completion of `K^ur`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `IsDiscreteValuationRing`, `IsDiscreteValuationRing.addVal`, `IsAdicComplete`,
`Algebra.IsInvariant`, the fixed subring `FixedPoints.subalgebra` with the action of `G ⧸ H` on
the fixed ring of a normal subgroup `H` and its invariants `A` (both instances in
`Mathlib/RingTheory/Invariant/Basic.lean`), `QuotientGroup.mk'`, `differentIdeal` and
`conductor_mul_differentIdeal`, `Ideal.sum_ramification_inertia_eq_card` (whose `IsGaloisGroup`
hypothesis bundles `FaithfulSMul G B`, `SMulCommClass G A B` and `Algebra.IsInvariant A B G`),
`Polynomial.IsEisensteinAt` with its irreducibility criterion, adic completion of a Noetherian
local ring, `intervalIntegral`, `IsGalois.normalAutEquivQuotient`, `Field.absoluteGaloisGroup`
with its Krull topology and `Subgroup.topologicalClosure`,
`Field.absoluteGaloisGroup.mapOfAlgebra` (the continuous map `G_L → G_K` given by restriction
along an embedding of algebraic closures over `K`, supplied as an `Algebra` instance with
`IsScalarTower`; it assumes nothing more of that embedding),
`IsAlgClosed.algebraMap_bijective_of_isIntegral`, `ValuationSubring.comap`,
`ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup` (the stabilizer
of a valuation subring and the kernel of its action on the residue field, over an arbitrary
field), `PerfectField`, `FiniteGaloisIntermediateField`, `IntermediateField.fixingSubgroup`,
`IntermediateField.restrict` (an intermediate field `F ≤ E` read inside `E`),
`AlgEquiv.restrictNormalHom` with `AlgEquiv.restrictNormalHom_surjective`,
`InfiniteGalois.restrictNormalHom_continuous`, `UniformSpace.Completion` and
`IsKrasner.of_completeSpace_of_normal` (Krasner's lemma for a complete ultrametric base and a
normal extension).

Use Tau Ceti `TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.ramificationGroupReal`,
`TauCeti.IsLocalRing.lowerIndex`, `TauCeti.IsLocalRing.ramificationGroup_natCast`,
`TauCeti.IsLocalRing.ramificationGroup_eq_top_of_le_neg_one`,
`TauCeti.IsLocalRing.instNormalRamificationGroup`, `TauCeti.IsLocalRing.ramificationGroup_antitone`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup` (the zeroth group of the
decomposition group of a valuation subring is Mathlib's `ValuationSubring.inertiaSubgroup`),
`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`,
`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`,
`TauCeti.IsLocalRing.sum_addVal_smul_sub_eq_finsum_card_ramificationGroup_sub_one`,
`TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`,
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top` and
`TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top`. These are the carriers on which Layer 3a
is stated; none of them assumes a finite residue field, and the local-field objects below are
their instances. Layer 4a also uses, from Tau Ceti's
`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean` and for every field `K`, with no
valuation involved: `TauCeti.fixingSubgroup_fixedField` (a closed subgroup of the Galois group of
a normal extension is the fixing subgroup of its fixed field);
`TauCeti.absoluteGaloisGroupRestrictEquiv`, the isomorphism of topological groups from
`Field.absoluteGaloisGroup K` onto `TauCeti.AbsoluteGaloisGroup K`, the Galois group of the
separable closure `separableClosure K (AlgebraicClosure K)`, with
`TauCeti.absoluteGaloisGroupRestrictEquiv_apply` (its forward map is restriction,
`AlgEquiv.restrictNormalHom`); and the instance `CompactSpace (Field.absoluteGaloisGroup K)`.
From `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean` it uses
`TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes`: the embedding of algebraic closures carries
`Field.absoluteGaloisGroup.mapOfAlgebra K L g` applied to `x` to `g` applied to the image of `x`.
For the agreements of §4a.1 and §4a.3 on a local field, use Tau Ceti's local-field declarations
listed below, among them `TauCeti.inertiaSubgroup`, `TauCeti.maximalUnramifiedExtension` and
`IntermediateField.le_maximalUnramifiedExtension_iff`; these assume `IsNonarchimedeanLocalField`.

### From TauCetiRoadmap.LocalFieldsRamification

The completed roadmap supplies, on nonarchimedean local fields, the following, each through
declarations proved in the pinned Tau Ceti; the file paths are relative to
`TauCeti/NumberTheory/LocalField/`.

- Finite extensions and `e`, `f` (`FiniteExtension/`, `AlgebraicExtension/Basic.lean`,
  `RamificationIndex.lean`, `InertiaDegree.lean`): the local-field, integer-ring and
  residue-field structures of a finite extension and of a finite intermediate field
  (`TauCeti.finiteExtension_isNonarchimedeanLocalField`,
  `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`,
  `TauCeti.finiteIntermediateField_valuativeExtension`,
  `TauCeti.integerRing_eq_integralClosure`), with `TauCeti.ramificationIndex` and
  `TauCeti.inertiaDegree`.
- Unramified extensions (`Unramified/Maximal.lean`):
  `TauCeti.maximalUnramifiedExtension` with `IntermediateField.le_maximalUnramifiedExtension_iff`.
- Monogenicity, the lower numbering, the Herbrand functions, the upper numbering and the
  different (`Monogenic.lean`, `RamificationGroup.lean`,
  `UnitFiltration/RamificationGroup.lean`, `Herbrand/` and `Different/`): local monogenicity
  `TauCeti.exists_integerRing_adjoin_eq_top`; the lower ramification groups
  `TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i`, defined as
  `TauCeti.IsLocalRing.ramificationGroup (L ≃ₐ[K] L) 𝒪[L] i`; the quotient embeddings of
  `G_0/G_1` and `G_i/G_(i+1)`, `TauCeti.tameCharacter` and
  `TauCeti.ramificationGroupGradedToResidueField`; the Herbrand objects
  `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `herbrand`, `inverseHerbrand`, `psiNat` with
  `coe_psiNat` and `psiNat_tower`, and `TauCeti.LocalFieldsRamification.upperRamificationGroup`
  with `UpperJump` and its compatibility with restriction in a Galois tower,
  `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`; and the
  different exponent `TauCeti.differentExponent` with Hilbert's formula
  `TauCeti.differentExponent_eq_finsum_lowerRamificationGroup`.
- The absolute Galois group (`Unramified/Inertia/`, `WildInertia.lean` and
  `Tame/Quotient.lean`): the ambient model `Field.absoluteGaloisGroup K` on
  `AlgebraicClosure K`, with `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`, their
  finite images `TauCeti.map_inertiaSubgroup_restrictNormalHom` (`G_0`) and
  `TauCeti.map_wildInertiaSubgroup_restrictNormalHom` (`G_1`), their closedness
  `TauCeti.isClosed_inertiaSubgroup` and `TauCeti.isClosed_wildInertiaSubgroup`, the normality
  instance `TauCeti.inertiaSubgroup_normal`, the inclusion
  `TauCeti.wildInertiaSubgroup_le_inertiaSubgroup`, the theorem that wild inertia is pro-`p` for
  the residue characteristic `p` (`TauCeti.isProP_wildInertiaSubgroup`, under `CharP 𝓀[K] p` for
  the residue field `𝓀[K]`), and `TauCeti.tameQuotient`.

Those Herbrand objects assume `IsNonarchimedeanLocalField` on both fields,
`ValuativeExtension K L`, `Module.Finite K L` and `IsGalois K L`; §3a.2 builds the same functions
on the local-ring carrier and proves that they agree with these under those hypotheses, and §4a.1
proves that the finite images of `G_K^u` are these upper groups there and that `G_K^0` and
`G_K^(0+)` are `TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup`. Hasse–Arf on
nonarchimedean local fields is Tau Ceti's `TauCeti.LocalFieldsRamification.hasseArf` (every
`UpperJump K L u` of a finite abelian Galois extension of nonarchimedean local fields is an
integer), owned by the completed roadmap and consumed here, not restated: §3a.3 proves its
generalization without residue finiteness and records in a Check that, through §3a.2's
agreement, it recovers `TauCeti.LocalFieldsRamification.hasseArf`.

### From TauCetiRoadmap.ProfiniteProPGroups

The completed roadmap [ProfiniteProPGroups](../../Completed/ProfiniteProPGroups/README.md)
supplies the pro-`p` predicate through Tau Ceti's `TauCeti.IsProP p G`, in
`TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`: every quotient of the topological
group `G` by an open normal subgroup is a `p`-group. §4a.1 uses it, for the subspace topology, to
say that wild inertia is pro-`p`. The predicate does not include compactness, which `P_K` has as a
closed subgroup of the compact group `G_K`, and for `p = 0` it holds for every group, since
`g^(0^1) = 1`; §4a.1 therefore states residue characteristic zero separately, as `P_K = 1`.

### From ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII

ReductiveGroups Layer 3 supplies finite-type closed subgroups, normal quotients and identity
components of algebraic groups; SchemeAndStackFoundations §0.24 supplies perfection in
characteristic `p`; AdicSpacesPartII §R0.19.9 supplies the generic pro-category and its
limit–colimit Hom formula. §3a.3's proalgebraic unit groups are pro-objects in the category of
perfect quasialgebraic groups built from these three suppliers; the finite-stage subgroup,
quotient and component constructions of §3a.3 are the supplied ones.

ReductiveGroupsPartII §RG2.0.4 supplies, for a nonarchimedean local field `E`, the completed
maximal unramified extension `Breve E`, the uniform completion of
`TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)` for its unique extended valuation,
with its discreteness, its algebraically closed residue field, the preservation of uniformizers
of `E`, the extended arithmetic Frobenius and its fixed field `E`. §4a.3 consumes the field and
proves that its own `K′` is `Breve E` on such a field; the Frobenius and fixed-field results
stay that roadmap's.

## How to read the build

Layer 3a is stated for a finite group acting on a local ring and specialized to the integral
closure `B` of `A` in `L`; each section ends with its *Needs* and with Checks that distinguish
the general statement from its local-field instance, usually on `F̄_p((t))` or `Frac W(F̄_p)`,
where the residue field is infinite, and on `ℚ_2(ζ_8)/ℚ_2`, where the completed roadmap already
fixes the answer. Layer 4a assumes a perfect residue field and works in `Field.absoluteGaloisGroup K`
through its finite levels. `Suggested.lean` states the Layer 3a headlines on the general
carriers: Hilbert's different formula, the Herbrand function with its inverse and the upper
numbering, Herbrand's quotient theorem, tower transitivity and the lower-numbering Hasse–Arf. It
states §4a.1 on Mathlib's valuation subrings: the absolute upper filtration relative to a
valuation subring `O` of `AlgebraicClosure K`, computed at each finite level on the valuation
subring `O ∩ M` of `M`, which Mathlib makes a local ring, with its decomposition group; its term
at `0` as Mathlib's inertia; its finite projections; and its term at `0+` as the inverse limit of
the finite `G_1`. It states §4a.2's finite-level subgroup identity, which holds for every subgroup
of a finite group acting on a local ring, and its open-subgroup identity, with `G_L` Mathlib's
`Field.absoluteGaloisGroup L` mapped into `G_K` by `Field.absoluteGaloisGroup.mapOfAlgebra K L`
along an embedding of algebraic closures over `L`. §4a.3 needs a maximal unramified extension,
which the pinned libraries provide only for nonarchimedean local fields; it is a README target,
and the module docstring of `Suggested.lean` says what it lacks.

## Layer 3a: ramification over complete discretely valued fields

The congruence definitions of the completed roadmap's lower numbering (Tau Ceti's
`TauCeti.LocalFieldsRamification.lowerRamificationGroup`) need neither local compactness nor a
finite residue field. This layer builds the finite ramification package over
every field complete for a discrete valuation, in equal and mixed characteristic, in the setting
of the Conventions. Tau Ceti's Herbrand objects do not extend as they stand: they assume
`IsNonarchimedeanLocalField` on both fields, which forces local compactness and a finite residue
field, although their definitions use only the cardinalities of the lower groups. §3a.2 builds
them on the local-ring filtration, and the local-field functions are its instance
`G = L ≃ₐ[K] L`, `B = 𝒪[L]`.

**The perfect-residue Herbrand package.** For complete DVR fraction
fields with perfect residue field, this is the package of §§3a.1–3a.3 and §§4a.1–4a.3, in both
characteristics, including their comparisons with the finite-local-field API. Its sources are
Serre, *Local Fields*, IV §§1–3 and V §7, Theorem 1; Serre 1961, n° 3.1 and n° 3.4–3.5; and
Brinon–Conrad, Exercise 1.4.4(3), with the equal-characteristic argument in §4a.3. Its absolute
group is Mathlib's `Field.absoluteGaloisGroup`. The section numbers specify the named package.

| Export | Sections |
|---|---|
| integer rings, lower filtration, lower index and different | §3a.1 |
| finite Herbrand functions, upper numbering, quotients and towers | §3a.2 |
| full Hasse–Arf | §3a.3 |
| absolute upper filtration, finite projections, inertia and wild inertia | §4a.1 |
| finite separable transition functions and open-subgroup identity | §4a.2 |
| completed maximal unramified comparison | §4a.3 |

**Checks.**

- Over `F̄_p((t))`, `y^p − y = t⁻¹` has lower and upper break `1` and different `2(p − 1)`.
- Over `Frac W(F̄_p)`, for odd `p`, adjoining `ζ_p` has degree `p − 1`, lower and upper break
  `0`, and different `p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2`, the package gives lower jumps `1, 3` and upper jumps `1, 2`, agreeing with
  the completed roadmap's lower and upper numbering rather than identifying the two numberings.

### 3a.1 Integer rings, the lower filtration and the different

`B` is a complete discrete valuation ring, free of rank `[L : K]` over `A`, and the valuation of
`L` is the unique one extending that of `K`, with `v_L = e·v_K` on `K`. On such a `B` the
following are proved in the pinned Mathlib and Tau Ceti, without completeness or residue
finiteness, and are cited here, not restated. Mathlib's `Ideal.sum_ramification_inertia_eq_card`, whose sum over the
primes above `𝔪_A` has the single term `𝔪_B`, gives `[L : K] = #G = ef`. For separable residue
extension some `x ∈ B` has `Algebra.adjoin A {x} = ⊤`
(`TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top`), and for every such `x` and `σ ∈ G`,
with or without separability, `lowerIndex B σ = v_L(σx − x)`
(`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`). By Tau Ceti's
`TauCeti.IsLocalRing.instNormalRamificationGroup`, `TauCeti.IsLocalRing.ramificationGroup_antitone`
and `TauCeti.IsLocalRing.ramificationGroup_eq_top_of_le_neg_one`, the groups `G_i` are normal in
`G`, antitone in `i` and equal to `G` for `i ≤ −1`; by
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut`, `G_0` is the inertia group, the
kernel of the action on `IsLocalRing.ResidueField B`; by
`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`, which uses that `B` is Noetherian
and that the finite group `G` acts faithfully, `G_i = 1` for all large `i`; and by
`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`, `H_i = H ∩ G_i` for a subgroup
`H = Gal(L/K′)`. For separable residue extension and a uniformizer `π_L`, reduction of
`σ(π_L)/π_L` embeds `G_0/G_1` in `(IsLocalRing.ResidueField B)ˣ`, and for `i ≥ 1` reduction of
`(σ(π_L) − π_L)/π_L^(i+1)` embeds `G_i/G_(i+1)` in the additive residue field. The ratio first
gives a uniformizer-independent map to `U(L,i)/U(L,i+1)`, where `U(L,i) = 1 + 𝔪_B^i`; identifying
that quotient with the additive residue field uses `π_L`. Hence `G_0/G_1` is cyclic of order prime to the residue
characteristic, `G_1` is the Sylow `p`-subgroup of `G_0` when the residue characteristic is
`p > 0`, and `G_1 = 1` when it is zero. Hilbert's formula holds: the different exponent `d(L/K)`,
the `v_L`-valuation of Mathlib's `differentIdeal A B`, is `Σ_(i ≥ 0) (#G_i − 1)`. Its
ideal-valued form, `differentIdeal A B = 𝔪_B^(Σ_(i ≥ 0) (#G_i − 1))`, is
`differentIdeal_eq_pow_maximalIdeal_of_separable_residue` in `Suggested.lean`. There it is
stated for a discrete valuation ring `B` on which `G` acts faithfully with invariants a discrete
valuation ring `A`, without completeness of `A`: `Algebra.IsInvariant` makes `B` integral over
`A`, so `B`, being integrally closed, is the integral closure of `A` in `Frac B`, which is finite
Galois over `Frac A` with group `G`, and `B` is finite over `A`.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), II §2, Proposition 3; III §6,
Proposition 12; IV §1, Propositions 2 and 4.) (Jean-Pierre Serre, [Sur les corps locaux à corps
résiduel algébriquement clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos),
n° 3.1, Proposition 1 with its Corollaries 1 and 2, and Proposition 2, printed pp. 126–127, for
totally ramified `L/K`.)

*Proof.* Completeness of `A` gives the unique prolongation of the valuation and makes `B` a
complete discrete valuation ring, finite over `A` because `L/K` is separable and free over it
because `A` is a principal ideal domain and `B` is torsion-free; in particular `B` is flat over
`A`, as the cited `Ideal.sum_ramification_inertia_eq_card` requires. The graded embeddings are
the quotient embeddings `TauCeti.tameCharacter` and
`TauCeti.ramificationGroupGradedToResidueField` of the completed roadmap
(`TauCeti/NumberTheory/LocalField/UnitFiltration/RamificationGroup.lean`), whose proofs use only
the residue field of `B`; a
finite subgroup of `(IsLocalRing.ResidueField B)ˣ` is cyclic of order prime to `p`, and the
additive group is killed by `p`, or torsion-free in residue characteristic zero. For Hilbert's
formula, Mathlib's `conductor_mul_differentIdeal` at a generator `x` (whose conductor is `⊤`)
gives `differentIdeal A B = (f′(x))` for the minimal polynomial `f` of `x`, and
`v_L(f′(x)) = Σ_(σ ≠ 1) v_L(σx − x) = Σ_(i ≥ 0) (#G_i − 1)` by the counting identity
`TauCeti.IsLocalRing.sum_addVal_smul_sub_eq_finsum_card_ramificationGroup_sub_one`.

*Needs:* Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`, `Algebra.IsInvariant`,
`Ideal.sum_ramification_inertia_eq_card`, `differentIdeal` and `conductor_mul_differentIdeal`;
Tau Ceti `TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.lowerIndex`, the
local-ring and monogenicity results cited in the statement, and the counting identity above; the
completed roadmap's Tau Ceti declarations for the local-field instance: local monogenicity
`TauCeti.exists_integerRing_adjoin_eq_top`, the quotient embeddings `TauCeti.tameCharacter` and
`TauCeti.ramificationGroupGradedToResidueField`, and the different `TauCeti.differentExponent`.

**Checks.**

- For every perfect `k` of characteristic `p`, including `k = F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has `v_L(y) = −1`, the uniformizer `y⁻¹`, and a generator `σ` with
  `σ(y) = y + 1` moves it by `−1/(y(y + 1))`, of valuation `2`. So `G_0 = G_1 = G`, `G_2 = 1` and
  `d = 2(p − 1)`, over an infinite residue field when `k = F̄_p`. At level `1`, the additive
  graded character of this generator is `−1`, since
  `(σ(y⁻¹) − y⁻¹)/(y⁻¹)² = −y/(y + 1)`; the unscaled ratio instead reduces to `1`.
- For odd `p` and `K = Frac W(F̄_p)`, `((X + 1)^p − 1)/X` is Eisenstein, so `K(ζ_p)/K` is totally
  and tamely ramified of degree `p − 1`, with `G_0 = G`, `G_1 = 1` and `d = p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2` the groups are the completed roadmap's lower groups, `#G_0 = #G_1 = 4`,
  `#G_2 = #G_3 = 2`, `G_4 = 1`, and `d = 3 + 3 + 1 + 1 = 8`. A finite unramified `L/K` has
  `G_0 = 1` and `d = 0`.
- The separability hypothesis cannot be dropped. Over `K = F_p(s)((t))`, let `L = K(y)` with
  `y^p − y = s·t^(−p)` and put `z = ty`, so `z^p − t^(p−1) z = s`. The residue extension
  `F_p(s^(1/p))/F_p(s)` is purely inseparable of degree `p`, `e = 1`, `B = A[z]`, and the generator
  with `σ(z) = z + t` lies in `G_0` but not in `G_1`: `G_0/G_1` has order `p`, and `#G_0 ≠ e`.
- Monogenicity needs separability too. Over `K = F_p(s, u)((t))`, adjoin roots of
  `y₁^p − y₁ = s·t^(−p)` and `y₂^p − y₂ = u·t^(−p)`. For `(i, j) ∈ F_p² ∖ {0}`, the element
  `(is + ju)·t^(−p)` is not of the form `a^p − a` with `a ∈ K`: such an `a` has valuation `−1`,
  and `is + ju` would be the `p`-th power of its leading coefficient, which it is not in
  `F_p(s, u)`. So `L/K` is Galois with group `C_p × C_p`. The elements `z_i = t·y_i`
  satisfy `z₁^p − t^(p−1) z₁ = s` and `z₂^p − t^(p−1) z₂ = u`, so the residue field of `B` is
  `F_p(s^(1/p), u^(1/p))`, `f = p²` and `e = 1`. Every element of that residue field has its
  `p`-th power in `F_p(s, u)`, so it is not generated by one element, and no `x ∈ B` has
  `Algebra.adjoin A {x} = ⊤`.

### 3a.2 Herbrand functions and the upper numbering

For a group `G` acting on a local ring `S`, define the Herbrand function
`herbrandFun G S u = ∫_0^u #G_t / #G_0 dt` for real `u`, with `G_t = ramificationGroupReal G S t`;
its inverse `inverseHerbrandFun G S v`, the least `u` with `v ≤ herbrandFun G S u`; and the upper
groups `upperRamificationGroup G S v = G_(ψ(v))`, writing `φ` and `ψ` for the first two. Only their
values on `[−1, ∞)` carry meaning. For finite `G`, prove that `φ` is continuous, strictly
increasing, piecewise linear and concave, the identity on `[−1, 0]`, with
`φ(m) = (#G_1 + ⋯ + #G_m)/#G_0` at every integer `m ≥ 0`; that it restricts to an order
automorphism of `TauCeti.LocalFieldsRamification.RamificationIndexDomain`, the interval `[−1, ∞)`,
with inverse `ψ`; that `ψ(n)` is a natural number for every natural number `n`; the two inverse
identities; and `G^(φ(u)) = G_u`. In the setting of 3a.1, with `S = B` and `φ_(L/K)`, `ψ_(L/K)`
for these functions, prove:

- `ψ` carries the jumps of the upper filtration to those of the lower one;
- when the residue extension of `L/K` is separable (a hypothesis the residue extensions of
  `L/K′` and `K′/K` inherit for every intermediate field `K′`), Herbrand's theorem: for `H`
  normal in `G` and `v ≥ −1`, `(G/H)^v = G^v H/H`, and its field form through Mathlib's
  `IsGalois.normalAutEquivQuotient` for `K′ = L^H`. Here `G/H` acts by Mathlib's quotient action
  on the fixed ring `B^H = FixedPoints.subalgebra A B H`, the integer ring of `K′`. It is a
  discrete valuation ring: by 3a.1 for the Galois extension `K′/K`, and, without completeness, as
  the valuation ring of the restriction of `v_L` to `K′`, whose value group is a nonzero subgroup
  of `ℤ`. The statement is `upperRamificationGroup_quotient_eq_map` in `Suggested.lean`, for
  discrete valuation rings `A` and `B` with `Algebra.IsInvariant A B G`, `FaithfulSMul G B` and
  separable residue extension, without completeness of `A`; the local-ring structure of `B^H`,
  which the pinned libraries do not infer, is a hypothesis there and is discharged by the
  preceding sentence;
- under the same separability hypothesis, tower transitivity: for `M/K` finite Galois with
  separable residue extension and `L` intermediate with `L/K` Galois,
  `φ_(M/K) = φ_(L/K) ∘ φ_(M/L)` and `ψ_(M/K) = ψ_(M/L) ∘ ψ_(L/K)` on `[−1, ∞)`. The first is
  `herbrandFun_tower` in `Suggested.lean`, in the setting of the preceding statement with
  `G = Gal(M/K)` acting on the integer ring of `M`, `H = Gal(M/L)` acting on it by restriction and
  `G/H` acting on its fixed ring; the second follows by inverting;
- for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^(ψ_(L/K)(v))` for `v ≥ −1`;
- agreement: for nonarchimedean local fields, `G = L ≃ₐ[K] L` and `S = 𝒪[L]`, these are
  `TauCeti.LocalFieldsRamification.herbrandOrderIso K L`,
  `TauCeti.LocalFieldsRamification.herbrand K L`,
  `TauCeti.LocalFieldsRamification.inverseHerbrand K L`,
  `TauCeti.LocalFieldsRamification.psiNat K L` and
  `TauCeti.LocalFieldsRamification.upperRamificationGroup K L` of the completed roadmap, in Tau
  Ceti's `TauCeti/NumberTheory/LocalField/Herbrand/`.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), IV §3, Propositions 14 and 15.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1, formula
(5) with properties a–d′ of the functions φ and ψ, printed p. 127, and Propositions 3 and 4,
printed p. 128, for totally ramified `L/K`.)

*Proof.* The analytic facts are Tau Ceti's proofs in
`TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean`: the integrand is the antitone step function
`#G_t/#G_0`, equal to `1` on `(−1, 0]` and bounded below by `1/#G_0`. This positive lower bound
makes the integral tend to infinity for every finite action. Eventual equality with `1/#G_0`
holds for the faithful separated DVR action of 3a.1. These arguments carry over to the
local-ring carrier, and agreement holds because
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` is defined as the local-ring filtration.
Integrality of `ψ(n)` is the finite-sum formula together with Lagrange's theorem, as in
`TauCeti.LocalFieldsRamification.coe_psiNat`. For Herbrand's theorem, the lower index of a class
`s ∈ G/H` is `(1/e(L/K′)) Σ_(σ ∈ s) lowerIndex B σ`, computed at generators of `B` over `A` and
of the integer ring of `K′` over `A`, which exist because the residue extensions are separable
(3a.1); this is where the separability hypothesis enters, and the Check below shows the class
formula and all three statements fail without it. The truncated count
`TauCeti.IsLocalRing.sum_min_lowerIndex_natCast` turns this into Herbrand's lemma
`(G/H)_(φ_(L/K′)(u)) = G_u H/H`. Comparing the slopes of both sides of the lemma gives tower
transitivity, and the lemma with transitivity gives the theorem in upper numbering. The
intersection formula follows from `H_i = H ∩ G_i` of 3a.1 and transitivity.

*Needs:* 3a.1; Mathlib `intervalIntegral`, `IsGalois.normalAutEquivQuotient`,
`FixedPoints.subalgebra` with its quotient action, and `QuotientGroup.mk'`; Tau Ceti
`TauCeti.IsLocalRing.ramificationGroupReal` and `TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`;
the completed roadmap's Herbrand objects in Tau Ceti's `TauCeti/NumberTheory/LocalField/Herbrand/`
(for the local-field instance).

**Checks.**

- For the Artin–Schreier extension `y^p − y = t⁻¹` of `k((t))`, `k` perfect, `φ(u) = u` for
  `−1 ≤ u ≤ 1` and `φ(u) = 1 + (u − 1)/p` for `u ≥ 1`; the only upper jump is `1`, and
  `ψ(2) = p + 1`.
- For `K(ζ_p)/K` with `K = Frac W(F̄_p)` and `p` odd, `φ(u) = u/(p − 1)` for `u ≥ 0`, and
  `ψ(1) = p − 1` is an integer although `φ(1) = 1/(p − 1)` is not.
- If `G_0 = 1`, then `φ` and `ψ` are the identity on `[−1, ∞)` and `G^v = 1` for every `v > −1`.
- Below `−1` the functions leave the identity. For a finite unramified quadratic `L/K`, the
  integrand is `#G/#G_0 = 2` on `(−2, −1]` and `1` on `(−1, 0]`, so `φ(−2) = −3` and
  `ψ(−2) = −3/2`; every statement is therefore made for arguments `≥ −1`, where `ψ(−1) = −1` and
  `G^(−1) = G`.
- For the trivial action of `C_2` on `ℤ_2`, all lower groups are `C_2` and the density is
  constantly `1`, not eventually `1/2`; nevertheless `φ` and `ψ` are the identity.
- On `ℚ_2(ζ_8)/ℚ_2`, `G^v` is `G` for `−1 ≤ v ≤ 1`, `{1, 5}` for `1 < v ≤ 2` and trivial for
  `v > 2`, while the lower group `G_3` is still `{1, 5}`: reading `G^v` as `G_v` fails at `v = 3`.
  For `H = {1, 7} = Gal(ℚ_2(ζ_8)/ℚ_2(√2))`, the image of `G^2 = {1, 5}` in `G/H` is all of `G/H`,
  and so is `(G/H)^2 = (G/H)_2`, since the generator of `Gal(ℚ_2(√2)/ℚ_2)` moves `√2` by `−2√2`,
  of valuation `3`.
- For `M = ℚ_2(ζ_8)` and `L = ℚ_2(√2)` over `K = ℚ_2`, `ψ_(L/K)(3) = 4` and
  `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`, while `ψ_(L/K)(ψ_(M/L)(3)) = ψ_(L/K)(5) = 8`: composing in the
  other order is wrong.
- Separability of the residue extension cannot be dropped from Herbrand's theorem, tower
  transitivity or the intersection formula. Over `K = F_2(s)((t))`, let `M = K(y, w)` with
  `y² − y = s·t^(−2)` and `w² − w = t^(−1)`. The classes `t^(−1)`, `s·t^(−2)` and their sum are
  not of the form `a² − a` with `a ∈ K` (the first has odd valuation; for the other two, `a`
  would have valuation `−1` and leading coefficient squaring to `s`), so `G = C_2 × C_2`. Put
  `L₁ = K(y)`, the inseparable-residue extension of the 3a.1 Check, `H = Gal(M/L₁)`,
  `π₀ = 1/w` and `z = t·y`. Then `π₀` is a root of the Eisenstein polynomial `X² + tX − t` over
  `A`, `z² − tz = s`, and the integer ring of `M` is `A[π₀, z]`, with residue field
  `F_2(s^(1/2))`, `e(M/K) = 2` and `v_M(t) = 2`; it is not generated over `A` by one element,
  since every element of `A[π₀, z]/(t)` has its square in `F_2(s)`. The element with
  `y ↦ y + 1` fixes `π₀` and moves `z` by `t`; the element with `w ↦ w + 1` fixes `z` and moves
  `π₀` by `−π₀²/(1 + π₀)`; both displacements have valuation `2`, so every nontrivial element of
  `G` has lower index `2`, `G_0 = G_1 = G`, `G_2 = 1`, and `G^v = G` for `v ≤ 1`. In the
  quotient `Gal(L₁/K)`, the generator moves `z` by `t`, of `v_(L₁)`-valuation `1`, so
  `(G/H)_1 = 1`, `φ_(L₁/K)(u) = u/2` for `u ≥ 0` and `(G/H)^(1/2) = 1`, whereas
  `G^(1/2)H/H = G/H`. Likewise `φ_(M/K)(1) = 1` but `φ_(L₁/K)(φ_(M/L₁)(1)) = φ_(L₁/K)(1) = 1/2`,
  since `M/L₁` has `H_0 = H_1 = H`, `H_2 = 1`; and `H ∩ G^1 = H` but
  `H^(ψ_(L₁/K)(1)) = H^2 = H_(ψ_(M/L₁)(2)) = H_3 = 1`. The class formula of the proof would give
  `(2 + 2)/2 = 2` for the lower index of the generator of `Gal(L₁/K)`, whose value is `1`. The
  subgroup formula `H_i = H ∩ G_i` of 3a.1 does hold here, with `H_1 = H` and `H_2 = 1`.

### 3a.3 Hasse–Arf over a separable residue extension

If `G` is abelian, every jump of the upper filtration `upperRamificationGroup G B` of §3a.2,
that is every `u ≥ −1` with `G^v ≠ G^u` for all `v > u`, is an integer. A jump other than `−1` is
`φ(j)` for an integer `j ≥ 0` with `G_j ≠ G_(j+1)`, so by the finite-sum formula of 3a.2 this
says: whenever `G_j ≠ G_(j+1)` for an integer `j ≥ 0`, `#G_0` divides `#G_1 + ⋯ + #G_j`. That
lower-numbering form is stated in `Suggested.lean` as `hasseArf_dvd_sum_card_ramificationGroup`,
on Mathlib's discrete valuation rings with `Algebra.IsInvariant A B G` and Tau Ceti's
`TauCeti.IsLocalRing.ramificationGroup`, without completeness of `A`. No finiteness of the
residue field is assumed. On a nonarchimedean local field the theorem is Tau Ceti's
`TauCeti.LocalFieldsRamification.hasseArf`, which the completed roadmap owns and this section
consumes, not restates; this section owns the generalization, and the Checks record how it
recovers `TauCeti.LocalFieldsRamification.hasseArf`.

(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), V §7, Theorem 1.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.4,
Propositions 6 and 7, printed pp. 132–134, and n° 3.5, Proposition 8 with its Corollary 1, printed
pp. 135–136, for totally ramified abelian `L/K` with algebraically closed residue field.)
(Alexander Grothendieck, [Éléments de géométrie algébrique III, première
partie](#source-grothendieck-éléments-de-géométrie-algébrique-iii-première-partie), Chapitre 0,
(10.3.1) and the completion remark after its proof, printed pp. 20–23, for the extension of the
residue field.)

The following prerequisites are targets of this section.

**Residue enlargement and preservation of ramification.** For a complete DVR `R` with residue
field `κ` and a specified algebraic closure `κ̄/κ`, construct a faithfully flat local map
`R → R′` to a complete DVR with residue field `κ̄` and `𝔪_(R′) = 𝔪_R R′`. Every uniformizer of
`R` stays a uniformizer. For a totally ramified finite Galois extension `E/Frac R` with group
`H`, a uniformizer `π_E` with Eisenstein polynomial `f` gives a field
`E′ = (Frac R′)[X]/(f)` of the same degree, integral closure `R′[π_E]`, and the same Galois group.
Prove that the normalized values of `σπ_E − π_E`, the lower groups, and the Herbrand functions
are preserved: the Eisenstein generator remains a uniformizer, and expansion in its integral
power basis preserves the valuation of each displacement. Sources: EGA III, Chapitre 0,
(10.3.1), its associated-graded formula (10.3.1.5) and completion remark, printed pp. 20–23;
§3a.1's monogenic lower-index formula (Serre, *Local Fields*, IV §1, Proposition 1).

**Checks.**

- For algebraically closed `κ`, `R′ = R` satisfies the target.
- For `R = κ[[t]]`, the map to `κ̄[[t]]` keeps the uniformizer `t`; in characteristic `p`, the
  Artin–Schreier extension of §3a.1 keeps its lower break `1` and different `2(p − 1)`.
- A totally ramified tame extension of degree `e` retains `G_0` of order `e` and `G_1 = 1`;
  an unramified extension of degree greater than one splits after this base change, so the
  field-and-degree assertion requires total ramification.

**Proalgebraic units and norm-kernel components.** For a complete discretely valued field `F`
with algebraically closed residue field `κ`, construct the commutative proalgebraic unit group
`U_F` from the unit groups of its truncated valuation rings, using their perfect
quasialgebraic structures in positive residue characteristic. In residue characteristic zero,
construct a coefficient-field section `κ → 𝒪_F` and use its induced section in each finite
extension `E`. Construct closed principal-unit subgroups, kernels, images, quotients and identity
components `H⁰`, with component group `π₀(H) = H/H⁰`. Supply right exactness of `π₀` and its
compatibility with inverse limits. The unit groups and all principal-unit subgroups are
connected. For finite Galois `E/F` with group `H`, the norm is a surjective proalgebraic morphism
`U_E → U_F`. Put `V = ker N` and `I_H U_E = ⟨σ(a)/a : σ ∈ H, a ∈ U_E⟩`. Prove `V⁰ = I_H U_E` and
the canonical isomorphism `H/[H,H] ≅ π₀(V)`, sending `σ` to the component of `σ(π_E)/π_E`,
independently of `π_E`. Sources: Serre 1961, §1, n° 1.1–1.6, printed pp. 106–113, and §2,
n° 2.1–2.3, especially Propositions 2–3 and their corollaries, printed pp. 118–120, for the unit
groups, the norm and its kernel. This target includes the specialized quasialgebraic and
proalgebraic group and component-group theory used by those statements, which Serre 1961 takes
from Serre, [Groupes proalgébriques](#source-serre-groupes-proalgébriques): quasialgebraic
groups with their induced and quotient structures (n° 1.2, Definition 2, printed p. 8); perfect
groups as quasialgebraic groups (n° 1.4, Proposition 10, printed p. 11); closed subgroups,
kernels, images and quotients in the abelian category of proalgebraic groups (n° 2.4,
Propositions 6–7, printed pp. 17–18); the exactness of projective limits and their
compatibility with images (n° 2.5, Proposition 10 with Corollaries 1 and 2, printed p. 19); and
the identity component `H⁰`, the component group `π₀(H) = H/H⁰`, the right exactness of `π₀` and
the commutation of `π₀` and of `H ↦ H⁰` with projective limits (n° 5.1, Propositions 1–2,
printed p. 35). Use ReductiveGroups Layer 3 for finite-type closed subgroups, normal
quotients and identity components; SchemeAndStackFoundations §0.24 for perfection in
characteristic `p`; and AdicSpacesPartII §R0.19.9 for the generic pro-category and its
limit–colimit Hom formula. Identify perfect quasialgebraic groups with the perfections of the
relevant smooth finite-type groups, and realize the proalgebraic unit groups as pro-objects in
that category. The finite-stage subgroup, quotient and component constructions must agree with
the supplied ones, and the principal-unit filtration must agree with the kernels of the
truncation maps. The exactness and inverse-limit assertions for components above belong to this
specialized package. These comparisons do not require geometric reciprocity, which
PadicPeriodRings builds on these unit groups.

**Checks.**

- For `E = F`, `V = 1` and `π₀(V) = 1`; the constant pro-object has the supplied finite-type
  component group, and the identity perfection comparison is the identity.
- For `F = κ((t))`, `U_F/U_F¹ ≅ κˣ` and `U_Fⁿ/U_F^(n+1) ≅ (κ,+)` for `n ≥ 1` are connected,
  although a norm kernel can be disconnected.
- In characteristic `p`, for `E/F` given by `y^p − y = t⁻¹`, `π₀(V) ≅ C_p`: connectedness of
  `U_E` and `U_F` does not imply connectedness of the norm kernel.

**Graded norms and filtered norm-kernel components.** Keep the preceding algebraically closed
residue field and a finite Galois `E/F` with group `H`, without assuming `H` abelian. Write
`U_Eⁿ = 1 + 𝔪_Eⁿ` for `n ≥ 1` and `U_E⁰ = U_E`. For every integer `s ≥ 0`, prove
`N(U_E^(ψ(s))) = U_Fˢ` and `N(U_E^(ψ(s)+1)) = U_F^(s+1)`, and exactness as quasialgebraic groups of
`1 → H_(ψ(s))/H_(ψ(s)+1) → U_E^(ψ(s))/U_E^(ψ(s)+1) → U_Fˢ/U_F^(s+1) → 1`,
where the first map is the uniformizer ratio and the second is induced by the norm.
Put `V_s = V ∩ U_E^(ψ(s))`. Construct the exact sequence of quasialgebraic groups
`1 → U_E^(ψ(s)+1)/U_E^(ψ(s+1)) → V_s/V_(s+1) → H_(ψ(s))/H_(ψ(s)+1) → 1`:
the first map lifts a unit by multiplying by an element of `U_E^(ψ(s+1))` to make its norm
one, and the last map uses the preceding graded norm kernel. Prove
`π₀(V_s/V_(s+1)) ≅ H_(ψ(s))/H_(ψ(s)+1)`, the bound
`#π₀(V_s) ∣ ∏_(n ≥ s) [H_(ψ(n)) : H_(ψ(n)+1)]` (only finitely many factors differ from one),
and the surjection `δ_s : H_(ψ(s)) → π₀(V_s)` given by `σ(π_E)/π_E`.
For abelian `H`, prove `H_(ψ(s)+1) = H_(ψ(s+1))`, that `δ_s` is an isomorphism, and that
`π₀(V_s) → π₀(V)` is injective. Sources: Serre 1961, n° 3.4, Propositions 6–7 with their
corollaries, printed pp. 132–135, and n° 3.5, Proposition 8(i)–(iii), printed p. 135.

**Checks.**

- For `E = F`, every graded norm is the identity and all `V_s` are trivial.
- For a tame cyclic extension of degree `e`, the depth-zero norm has kernel `μ_e`, while every
  positive-depth graded norm is bijective; `π₀(V_0) ≅ C_e` and `π₀(V_s) = 1` for `s ≥ 1`.
- In characteristic `p`, for `y^p − y = t⁻¹`, the depth-one graded norm has kernel `C_p`;
  `π₀(V_1) ≅ C_p` and `π₀(V_2) = 1`. With the uniformizers `y⁻¹` of `E` and `t` of `F`, the
  conjugates `y + i`, `i ∈ F_p`, give `N(y + λ) = t⁻¹ + λ^p − λ`, so `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`
  for `λ ∈ κ`, and the graded norm is `λ ↦ λ^p − λ`. Its kernel `F_p` is the image of `G_1/G_2`
  under the graded character of §3a.1, which sends the generator to `−1`. It is surjective for
  `κ = F̄_p`; for `κ = F_p` that kernel is all of `κ`, so the graded norm is zero there and misses
  the `p − 1` nonzero classes. The failure comes from where the kernel lies, not from its order:
  an additive polynomial over `F_p` acts on `F_p` as multiplication by the sum of its
  coefficients, so over `F_3` the polynomial `λ³ − 2λ`, whose kernel `{0, ±√2}` in `F̄_3` has
  order `3`, acts on `F_3` as `λ ↦ −λ`, a bijection.

*Proof.* Completeness of `A` may be assumed: `B` is finite over `A` (§3a.1) and local, so
`B ⊗_A Â` is the completion `B̂`, again a discrete valuation ring; `G` acts on it with invariants
`Â` because `Â` is flat over `A`, and `B̂/𝔪_(B̂)^(i+1) = B/𝔪_B^(i+1)` keeps the residue fields and
every `G_i`. A jump at `−1` is an integer. For `v ≥ 0` the upper groups of `G` are those of its
inertia group `G_0 = Gal(L/K_0)`, where `K_0` is the maximal unramified subextension: both have
the same lower groups `G_i`, `i ≥ 0`, hence the same Herbrand function on `[0, ∞)`. Because the
residue extension is separable, `L/K_0` is totally ramified, so `L = K_0(π_L)` for a root `π_L` of
an Eisenstein polynomial. Let `A′` be the completion of a flat local `A_0`-algebra, `A_0` the
integer ring of `K_0`, whose maximal ideal is generated by `𝔪_(A_0)` and whose residue field is
an algebraic closure of `k`; it exists by EGA (10.3.1) and is a complete discrete valuation ring
with the same uniformizer. The Eisenstein polynomial stays Eisenstein over `A′`, so
`L′ = K′(π_L)` is a totally ramified Galois extension of `K′ = Frac A′` with group `G_0`, integer
ring `A′[π_L]` and the same values `v_L(σπ_L − π_L)`: the lower filtration, hence the upper one,
is unchanged. The proalgebraic and graded-norm targets give `π₀(V) ≅ G_0` in the abelian case.
Its order, together with the bound on `#π₀(V_0)`, forces `G_(ψ(s)+1) = G_(ψ(s+1))` for every
integer `s ≥ 0`: a strict inclusion would make the product of graded indices smaller than `#G_0`.
A lower jump `m` with nonintegral `φ(m)` would lie between `ψ(s)` and `ψ(s+1)` and contradict
that equality (Serre 1961, n° 3.5, Corollary 1 to Proposition 8).

*Needs:* 3a.1; 3a.2; this section's residue-enlargement, proalgebraic-unit and filtered
norm-kernel targets; Mathlib `Polynomial.IsEisensteinAt` and its irreducibility criterion, and
adic completion of a Noetherian local ring.

**Checks.**

- On `ℚ_2(ζ_8)/ℚ_2` the lower jumps are `1` and `3`, with `φ(1) = 4/4 = 1` and
  `φ(3) = (4 + 2 + 2)/4 = 2`. At the non-jump `j = 2` the quotient `(4 + 2)/4` is not an integer:
  divisibility is asserted only at jumps.
- For every perfect `k` of characteristic `p`, including `F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has its single upper jump at the integer `1`.
- A tamely ramified `L/K` with `G_0 ≠ 1` has its only nonnegative jump at `0`, and `L = K` has
  none.
- Commutativity cannot be dropped: for the quaternion extension of Serre's *Local Fields*, IV §3,
  Exercise 3, the upper jumps are not all integers.
- On a nonarchimedean local field, with `A = 𝒪[K]`, `B = 𝒪[L]` and `G = Gal(L/K)`, the residue
  extension is separable because the residue fields are finite; at each nonnegative lower jump `j`
  the divisibility statement and the finite-sum formula `φ(j) = (#G_1 + ⋯ + #G_j)/#G_0` make the
  corresponding upper jump integral, the jump at `−1` is integral already, and §3a.2's agreement
  of filtrations turns this into `TauCeti.LocalFieldsRamification.hasseArf`. For
  `ℚ_2(ζ_8)/ℚ_2` the lower jumps `1, 3` give the upper jumps `1, 2`.
- The abstract filtration on `C_9` with `G_0 = G_1 = C_9`, `G_2 = ⋯ = G_5 = C_3` and `G_6 = 1`
  has `φ(5) = 1 + 4/3 = 7/3`, although the subgroup and Herbrand quotient have integral breaks
  `5` and `1`. It cannot be the ramification filtration of an abelian local-field extension:
  at the lower jump `5`, the sum `9 + 3 + 3 + 3 + 3 = 21` is not divisible by `#G_0 = 9`.
  Prime-degree integrality and tower transitivity alone do not imply Hasse–Arf.

### Examples

The two fields with infinite residue field `F̄_p` that run through the layer: the
Artin–Schreier extension `y^p − y = t⁻¹` of `F̄_p((t))`, with its break at `1` and different
exponent `2(p − 1)`, and the tame extension `Frac W(F̄_p)(ζ_p)` of `Frac W(F̄_p)`, with its break
at `0` and different exponent `p − 2`; and `ℚ_2(ζ_8)/ℚ_2`, on which every general statement must
return the completed roadmap's values.

### Dependencies

Mathlib and Tau Ceti as in the supplier contracts; the completed roadmap, through the Tau Ceti
declarations on finite extensions, monogenicity, the lower numbering, the Herbrand functions and
the different listed under From TauCetiRoadmap.LocalFieldsRamification above, for the local-field
instances, and Tau Ceti's `TauCeti.LocalFieldsRamification.hasseArf`;
ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24 and AdicSpacesPartII §R0.19.9 for
§3a.3's proalgebraic targets.

## Layer 4a: the absolute upper filtration over a perfect residue field

Keep the setting of Layer 3a and assume the residue field `k` perfect, of characteristic `p ≥ 0`,
so that every finite extension of `K` has separable residue extension. `G_K` is
`Field.absoluteGaloisGroup K` with the Krull topology, the ambient model of the completed
roadmap's absolute Galois group. Its finite levels are the
`M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`, each with integer ring the integral closure of `A` in `M` and with the filtrations of Layer 3a.

### 4a.1 The absolute upper filtration, inertia and wild inertia

For a field `K`, a valuation subring `O` of `AlgebraicClosure K` and real `u`, define
`absoluteUpperRamificationGroup K O u`, the group `G_K^u` relative to `O`, as the set of `σ ∈ G_K`
whose restriction to every finite Galois `M/K` inside `AlgebraicClosure K` lies in the image in
`Gal(M/K)` of the upper group `upperRamificationGroup D_M (O ∩ M) u` of §3a.2. Here `O ∩ M` is the
valuation subring `O.comap (algebraMap M (AlgebraicClosure K))` of `M`, a local ring, and `D_M` is
its decomposition group `ValuationSubring.decompositionSubgroup K (O ∩ M)`, acting on `O ∩ M`. Put
`G_K^(u+) = closure(⋃_(w > u) G_K^w)` in the Krull topology. In the setting of this layer, where
`O ∩ K = A`, `O` is the integral closure of `A` in `AlgebraicClosure K` and the only valuation
subring lying over `A`, every `D_M` is all of `Gal(M/K)` and `O ∩ M` is the integer ring of `M`, so
`G_K^u` is the set of `σ` whose restriction to every `M` lies in `Gal(M/K)^u`. Prove:

- for every field `K` and every valuation subring `O` of `AlgebraicClosure K`, `G_K^0` is the image
  in `G_K` of Mathlib's `ValuationSubring.inertiaSubgroup K O`, the elements of
  `ValuationSubring.decompositionSubgroup K O` acting trivially on the residue field of `O`
  (`absoluteUpperRamificationGroup_zero`);
- when `O ∩ K` is a complete discrete valuation ring with perfect residue field
  (`IsDiscreteValuationRing`, `IsAdicComplete` of its maximal ideal and `PerfectField` of its
  residue field), restriction maps `G_K^u` onto `Gal(M/K)^u` for every finite Galois `M` and every
  `u ≥ −1` (`map_restrictNormalHom_absoluteUpperRamificationGroup`), and `G_K^(0+)` is wild inertia
  `P_K`, the set of `σ` whose restriction to every `M` lies in the first lower group `G_1` of `D_M`
  acting on `O ∩ M`, that is the inverse limit of the finite `G_1`
  (`topologicalClosure_iSup_absoluteUpperRamificationGroup`);
- in the setting of this layer, each `G_K^u` is a closed normal subgroup, the family is antitone,
  `G_K^(u+) ⊆ G_K^u` for every `u`, in particular `G_K^(0+) ⊆ G_K^0`, `G_K^(−1) = G_K`, and the
  intersection of all `G_K^u` is trivial; the decomposition group of `O` is all of `G_K`, and
  `G_K^0` is inertia `I_K`, the fixing subgroup of the maximal unramified extension `K^ur`; when
  `p > 0`, `P_K` is pro-`p`, `TauCeti.IsProP p P_K` for the subspace topology, and when `p = 0`,
  `P_K` is trivial;
- on a nonarchimedean local field `K`, with each finite level `M` carrying the local-field
  structure of `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`, the image of `G_K^u`
  in `Gal(M/K) = M ≃ₐ[K] M` is `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u` for
  every `u ≥ −1`, so `G_K^u` is the set of `σ` whose every finite restriction lies in the
  completed roadmap's upper group; and `G_K^0` and `G_K^(0+)` are Tau Ceti's
  `TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup`, so that there the following
  statements of the third bullet are the completed roadmap's theorems, which the general
  statements recover: `G_K^0` is closed and normal (`TauCeti.isClosed_inertiaSubgroup`,
  `TauCeti.inertiaSubgroup_normal`), `G_K^(0+) ⊆ G_K^0`
  (`TauCeti.wildInertiaSubgroup_le_inertiaSubgroup`), and, the residue field being finite of
  characteristic `p > 0`, `P_K` is pro-`p` (`TauCeti.isProP_wildInertiaSubgroup`).

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1, the
paragraph after Proposition 3, printed p. 128, which defines the upper filtration of an infinite
Galois extension as the limit of the finite ones, for totally ramified extensions.) (Jean-Pierre
Serre, [Local Fields](#source-serre-local-fields), IV §3, Proposition 14, for the restriction maps
between finite levels on which the finite projections rest.)

*Proof.* Restriction `G_K → Gal(K^s/K)` to the separable closure is Tau Ceti's isomorphism of
topological groups `TauCeti.absoluteGaloisGroupRestrictEquiv`, whose forward map is restriction
(`TauCeti.absoluteGaloisGroupRestrictEquiv_apply`): `AlgebraicClosure K` is purely inseparable over
`K^s`, so an automorphism that is trivial on `K^s` is trivial. Hence `G_K` is compact (Tau Ceti's
instance `CompactSpace (Field.absoluteGaloisGroup K)`) and is the inverse limit of the `Gal(M/K)`,
all finite levels lying in `K^s`. When `O ∩ K` is a complete discrete valuation ring with perfect
residue field, every residue extension is separable and, for `M ⊆ M′`, `O ∩ M` is the fixed ring of
`Gal(M′/M)` in `O ∩ M′`, so Herbrand's theorem (3a.2) says that restriction maps `Gal(M′/K)^u` onto
`Gal(M/K)^u`. Hence `G_K^u` is the inverse limit of these nonempty finite sets along surjections; it
is closed, and, `G_K` being compact and mapping onto each `Gal(M′/K)`
(`AlgEquiv.restrictNormalHom_surjective`), it maps onto each of them. Normality and antitonicity
hold at every finite level. For `w > u` the subgroup `G_K^u` contains `G_K^w`, and it is closed,
so it contains the closure `G_K^(u+)` of their union. A `σ ≠ 1` is nontrivial on `K^s`, so it
moves an element of some finite `M`, and `Gal(M/K)^u = 1` for large `u`.

For `G_K^0`, at every level `ψ(0) = 0`, since `φ` is the identity on `[−1, 0]` and positive on
`(0, ∞)`, so the upper group at `0` is `G_0`, which
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup` identifies with Mathlib's inertia of
`O ∩ M` inside `D_M`. Every `x ∈ O` has a power `y = x^q` in `K^s`, hence in some finite level, with
`q = 1` in characteristic `0` and `q` a power of `p` in characteristic `p`; then `σ(x)^q = σ(y)` and
`(σx − x)^q = σy − y`, and a valuation subring and its maximal ideal contain an element of
`AlgebraicClosure K` as soon as they contain its `q`-th power. So `σ` stabilizes `O` and acts
trivially on its residue field exactly when every restriction of `σ` stabilizes `O ∩ M` and acts
trivially on the residue field of `O ∩ M`, which is `absoluteUpperRamificationGroup_zero`, with no
hypothesis on `O`. In the setting of this layer the valuation of `K` has a unique prolongation to
every finite extension, so `O` is unique and every `σ ∈ G_K` carries it to itself: its
decomposition group is `⊤`. As `k` is perfect, `Gal(M/K)^0` is the inertia group of `M/K`, whose
fixed field is the maximal unramified subextension of `M`, so `σ ∈ G_K^0` exactly when `σ` fixes
every finite unramified subextension, that is `G_K^0 = I_K`.

For `G_K^(0+)`, at every level and for every `w > 0`, `ψ(w) > 0`, so `Gal(M/K)^w = G_(ψ(w))` lies in
`G_1`, with equality once `ψ(w) ≤ 1`. The set `P_K` is closed, an intersection of preimages of
subgroups of finite discrete groups under the continuous restrictions
(`InfiniteGalois.restrictNormalHom_continuous`), so `G_K^(0+) ⊆ P_K` for every `O`. Conversely, a
neighbourhood of `σ ∈ P_K` contains the coset of the fixing subgroup of some finite Galois `M`; for
small `w > 0`, `σ|_M ∈ G_1 = Gal(M/K)^w`, and the finite projections give `τ ∈ G_K^w` with
`τ|_M = σ|_M`. Each `G_1` is a `p`-group by 3a.1, and trivial when `p = 0`. An open normal
subgroup of `P_K` contains `P_K ∩ G_M` for the fixing subgroup `G_M` of some finite Galois `M`,
and `P_K ∩ G_M` is the kernel of restriction from `P_K` to `Gal(M/K)`, whose image lies in `G_1`;
so every quotient of `P_K` by an open normal subgroup is a quotient of a subgroup of a `p`-group,
which is `TauCeti.IsProP p P_K`, and `P_K = 1` when `p = 0`, an element trivial on every finite
level being trivial.

On a nonarchimedean local field, a finite level `M` is a local field valuatively over `K`
(`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`,
`TauCeti.finiteIntermediateField_valuativeExtension`) whose integer ring `𝒪[M]` is the integral
closure of `𝒪[K]` (`TauCeti.integerRing_eq_integralClosure`), hence `O ∩ M`, so §3a.2's agreement,
applied to `M ≃ₐ[K] M` acting on `𝒪[M]`, identifies `Gal(M/K)^u` with
`TauCeti.LocalFieldsRamification.upperRamificationGroup K M u`, and the finite projections give the
first agreement; the compatibility of these groups between finite levels is then also Tau Ceti's
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`.
`TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup` are fixing subgroups, hence closed
(`TauCeti.isClosed_inertiaSubgroup`, `TauCeti.isClosed_wildInertiaSubgroup`),
with images `G_0` and `G_1` in every finite quotient
(`TauCeti.map_inertiaSubgroup_restrictNormalHom`,
`TauCeti.map_wildInertiaSubgroup_restrictNormalHom`), so the same argument identifies them with
`G_K^0` and `G_K^(0+)`.

*Needs:* 3a.1; 3a.2; Mathlib `Field.absoluteGaloisGroup` with its Krull topology,
`Subgroup.topologicalClosure`, `FiniteGaloisIntermediateField`, `AlgEquiv.restrictNormalHom`,
`AlgEquiv.restrictNormalHom_surjective`, `InfiniteGalois.restrictNormalHom_continuous`,
`ValuationSubring.comap`, `ValuationSubring.decompositionSubgroup`,
`ValuationSubring.inertiaSubgroup`, `IsAdicComplete` and `PerfectField`; Tau Ceti
`TauCeti.absoluteGaloisGroupRestrictEquiv` with `TauCeti.absoluteGaloisGroupRestrictEquiv_apply`,
the instance `CompactSpace (Field.absoluteGaloisGroup K)`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup`, and, for the pro-`p` statement
on `P_K`, ProfiniteProPGroups' predicate `TauCeti.IsProP`; for the local-field agreements,
§3a.2's agreement of filtrations and the completed roadmap's Tau Ceti declarations
`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`,
`TauCeti.finiteIntermediateField_valuativeExtension`, `TauCeti.integerRing_eq_integralClosure`,
`TauCeti.LocalFieldsRamification.upperRamificationGroup`,
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`, and
`TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup` with their finite images and their
closedness `TauCeti.isClosed_inertiaSubgroup` and `TauCeti.isClosed_wildInertiaSubgroup`; for the
recovered statements there, `TauCeti.inertiaSubgroup_normal`,
`TauCeti.wildInertiaSubgroup_le_inertiaSubgroup` and `TauCeti.isProP_wildInertiaSubgroup`.

**Checks.**

- The image of `G_(ℚ_2)^u` in `Gal(ℚ_2(ζ_8)/ℚ_2) = (ℤ/8)ˣ` is everything for `u ≤ 1`, `{1, 5}` for
  `1 < u ≤ 2`, and trivial for `u > 2`. With `ψ(1) = 1`, `ψ(2) = 3` and `ψ(3) = 7`, it is `G_1 = G`,
  `G_3 = {1, 5}` and `G_7 = 1` at `u = 1, 2, 3`, the completed roadmap's upper groups of this
  extension, as the local-field agreement requires; reading the lower group `G_3 = {1, 5}` at
  `u = 3` instead would not.
- Perfectness cannot be dropped from the finite projections. Over `K = F_2(s)((t))`, with
  `M = K(y, w)` and `L₁ = K(y)` as in the 3a.2 Check, every element of `G_K^(1/2)` restricts into
  `Gal(L₁/K)^(1/2) = 1` on `L₁`, so the image of `G_K^(1/2)` in `Gal(M/K)` lies in `Gal(M/L₁)`, of
  order `2`, whereas `Gal(M/K)^(1/2) = G_1 = Gal(M/K)` has order `4`.
- The term at `0` needs no hypothesis on `O`. For `O = AlgebraicClosure K`, the trivial valuation
  subring, each `O ∩ M` is the field `M`, on which `Gal(M/K)` acts faithfully, so every `G_0` is
  trivial and `G_K^0 = 1`; Mathlib's inertia of `O` is trivial too, since `σ` acts on the residue
  field `AlgebraicClosure K` as itself.
- Outside the henselian case the decomposition groups are needed. For `K = ℚ`, `O` over `ℤ_(5)`
  and `M = ℚ(i)`, in which `5 = (2 + i)(2 − i)` splits, complex conjugation exchanges the two
  valuation subrings of `M` over `ℤ_(5)`, so it does not act on `O ∩ M`, `D_M` is trivial, and
  every `G_K^u` lies in the decomposition group of `O`.
- The separable closure matters in equal characteristic. For `K = F̄_p((t))`, `x = t^(1/p)` lies in
  `AlgebraicClosure K` and is inseparable over `K`; for `σ ∈ G_K`, `σ(x)^p = t = x^p` forces
  `σ(x) = x`, so `σ` is determined by its restriction to `K^s`, as the isomorphism
  `TauCeti.absoluteGaloisGroupRestrictEquiv` asserts.
- If `k` is algebraically closed, as for `K = Frac W(F̄_p)`, then `K^ur = K`, every `σ ∈ G_K`
  acts trivially on the residue field `k` of `O`, and `G_K = G_K^0 = I_K` is all of the image of
  `ValuationSubring.inertiaSubgroup K O`.
- For `K = ℚ_p`, a lift to `G_K` of the arithmetic Frobenius acts on the residue field `F̄_p` of
  `O` by `x ↦ x^p`, so it lies outside the image of `ValuationSubring.inertiaSubgroup K O`, and
  outside `I_K`, since it moves the unramified `ζ_(p²−1)` to `ζ_(p²−1)^p`.
- For odd `p` and `K = Frac W(F̄_p)`, the tame extension `K(ζ_p)/K` shows that the inclusion
  `G_K^(0+) ⊆ G_K^0` can be strict: `I_K` maps onto `Gal(K(ζ_p)/K)`, of order `p − 1`, while
  `P_K` maps to `G_1 = 1`.
- Being pro-`p` separates wild inertia from inertia. For `K = ℚ_3` and `M = ℚ_3(ζ_9)`,
  `Gal(M/K) ≅ (ℤ/9)ˣ` has `#G_0 = 6` and `G_1 = {1, 4, 7}`: the quotient of `P_K` by its open
  normal subgroup `P_K ∩ G_M` is `G_1`, of order `3`, while the quotient of `I_K` by `I_K ∩ G_M`
  is all of `(ℤ/9)ˣ`, of order `6`, so `I_K` is not pro-`3`.
- In residue characteristic zero the predicate says nothing. For `K = ℂ((t))`, whose residue
  field is algebraically closed, `I_K = G_K`, and `TauCeti.IsProP 0 I_K` holds as it does for
  every group; what the target asserts there is `P_K = 1`, every finite level being tame with
  `G_1 = 1`.

### 4a.2 Finite separable extensions: ψ_(L/K) and the open-subgroup identity

For a finite separable `L/K` inside `AlgebraicClosure K` and a finite Galois `M/K` containing
`L`, define `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)` on `[−1, ∞)` and `φ_(L/K)` its inverse. The absolute
Galois group `G_L` is Mathlib's `Field.absoluteGaloisGroup L`, acting on `AlgebraicClosure L`, and
is read inside `G_K` through `Field.absoluteGaloisGroup.mapOfAlgebra K L`, restriction along an
embedding `ι` of `AlgebraicClosure K` in `AlgebraicClosure L` over `L`; since its target is
algebraic over its algebraically closed source, `ι` is onto, so this map is injective with image
the open subgroup of `G_K` fixing `L`. The valuation subring `O′` of `AlgebraicClosure L` lying
over `O` is `ι(O)`, and `G_L^v` is the absolute filtration of 4a.1 for `L` relative to `O′`.
Prove:

- `ψ_(L/K)` does not depend on `M`, agrees with 3a.2 when `L/K` is Galois (so that, on
  nonarchimedean local fields, it is then `TauCeti.LocalFieldsRamification.inverseHerbrand K L` by
  §3a.2's agreement), is continuous, strictly increasing, piecewise linear and the identity on
  `[−1, 0]`, and `ψ_(N/K) = ψ_(N/L) ∘ ψ_(L/K)` for every finite separable `N ⊇ L`;
- the finite-level subgroup identity: for every finite Galois `M/K` containing `L`,
  `Gal(M/L) ∩ Gal(M/K)^u = Gal(M/L)^(ψ_(L/K)(u))` for `u ≥ −1`. With `ψ_(L/K)` written as
  `φ_(M/L) ∘ ψ_(M/K)`, this holds for every subgroup `H` of a finite group `G` acting on a local
  ring, normal or not and with no hypothesis on the residue extension: it is
  `subgroupOf_upperRamificationGroup` in `Suggested.lean`, for `G = Gal(M/K)` and `H = Gal(M/L)`
  acting on the integer ring of `M`;
- the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` for every `u ≥ −1`: when `O ∩ K`
  is a complete discrete valuation ring with perfect residue field, for every `L` contained in a
  finite Galois `M/K`, every embedding `ι` over `L` and every valuation subring `O′` of
  `AlgebraicClosure L` with `ι⁻¹(O′) = O`, the preimage of `G_K^u` under
  `Field.absoluteGaloisGroup.mapOfAlgebra K L` is `G_L^(ψ_(L/K)(u))`, with `ψ_(L/K)` computed at
  `M` and `Gal(M/L)` the fixing subgroup of `L` in `Gal(M/K)`
  (`comap_mapOfAlgebra_absoluteUpperRamificationGroup`);
- the integral formula at every such finite level,
  `ψ_(L/K)(u) = (1/f) ∫_0^u [Gal(M/K) : Gal(M/K)^t Gal(M/L)] dt` for `u ≥ 0`, with `f = f(L/K)`,
  and its absolute form `ψ_(L/K)(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt`.

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#source-serre-sur-les-corps-locaux-à-corps-résiduel-algébriquement-clos), n° 3.1,
Proposition 4 and the Remarque after it, printed p. 128, for totally ramified extensions.)
(Jean-Pierre Serre, [Local Fields](#source-serre-local-fields), IV §1, Proposition 2.)

*Proof.* For `M ⊆ M′` both Galois over `K`, tower transitivity (3a.2) for `M′ ⊇ M ⊇ L` and for
`M′ ⊇ M ⊇ K` gives
`φ_(M′/L) ∘ ψ_(M′/K) = φ_(M/L) ∘ φ_(M′/M) ∘ ψ_(M′/M) ∘ ψ_(M/K) = φ_(M/L) ∘ ψ_(M/K)`, and
any two choices of `M` lie in a common one; the other properties follow from those of the
Galois functions. At a finite level `M`, the subgroup formula of 3a.1 (Tau Ceti's
`TauCeti.IsLocalRing.subgroupOf_ramificationGroupReal`) gives
`Gal(M/K)^u ∩ Gal(M/L) = Gal(M/L)_(ψ_(M/K)(u))`, which is `Gal(M/L)^(ψ_(L/K)(u))` because
`ψ_(M/L) ∘ φ_(M/L)` is the identity. For the open-subgroup identity, Tau Ceti's
`TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes` says that `ι` intertwines `g ∈ G_L` with its
image in `G_K`; `ι` is onto by Mathlib's `IsAlgClosed.algebraMap_bijective_of_isIntegral`, so the
map is injective, and its image is the subgroup fixing `L` because `ι` is `L`-linear. The field
`ι(M′)`, for `M′ ⊇ L` finite Galois over `K`, is finite Galois over `L`, these fields are cofinal
among the finite Galois extensions of `L` inside `AlgebraicClosure L`, and `ι` carries `O ∩ M′`
onto `O′ ∩ ι(M′)`. The ring `O′ ∩ L = O ∩ L` is the integer ring of `L`, a complete discrete
valuation ring (3a.1) whose residue field is finite over `k`, hence perfect, so the finite
projections of 4a.1 hold over `L` as over `K`; with Herbrand's theorem (3a.2) between finite
levels, membership in `G_L^v` and in `G_K^u` is decided at the levels `M′ ⊇ L`. There the finite
identity, with `φ_(M′/L) ∘ ψ_(M′/K) = ψ_(L/K)`, matches the two conditions. For the
integral formula, write `G = Gal(M/K)` and `H = Gal(M/L)`: by the identity
`G^t ∩ H = H^(ψ_(L/K)(t))`, away from the finitely many jumps the derivative of
`φ_(M/L) ∘ ψ_(M/K)` at `t` is `[G^0 : G^t] · #H^(ψ_(L/K)(t)) / #H^0`, which equals
`[G : G^t H]/f` because `#G^0/#H^0 = e(L/K) = [L : K]/f`. As `G_K^t` maps onto `G^t` (4a.1) and
the kernel `G_M` of restriction to `M` lies in `G_L`, the preimage of `G^t H` in `G_K` is
`G_K^t G_L`, so the two indices agree and the absolute form follows.

*Needs:* 4a.1 (the absolute filtration and its finite projections, over `K` and over `L`); 3a.1;
3a.2 (Herbrand's theorem and tower transitivity), with its agreement of filtrations for the
local-field reading; Mathlib `IntermediateField.fixingSubgroup`, `IntermediateField.restrict`,
`Field.absoluteGaloisGroup.mapOfAlgebra`, `IsAlgClosed.algebraMap_bijective_of_isIntegral` and
`ValuationSubring.comap`; Tau Ceti `TauCeti.fixingSubgroup_fixedField`,
`TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes` and
`TauCeti.IsLocalRing.subgroupOf_ramificationGroupReal`; the completed roadmap's
`TauCeti.LocalFieldsRamification.inverseHerbrand`, for the local-field reading.

**Checks.**

- For finite unramified `L/K`, `ψ_(L/K)(u) = u` and `G_K^u ∩ G_L = G_L^u`.
- For totally tamely ramified `L/K` of degree `e`, `ψ_(L/K)(u) = eu` for `u ≥ 0`, so
  `G_K^u ∩ G_L = G_L^(eu)`; for `L = K` both sides are `G_K^u`.
- For `K = ℚ_3` and `L = ℚ_3(ζ_3)`, `ψ_(L/K)(u) = 2u` for `u ≥ 0`. The extension
  `ℚ_3(ζ_9)/ℚ_3(ζ_3)` is cyclic of order `3` with upper jump `2`, so the image of `G_K^(3/2) ∩ G_L`
  in its Galois group is trivial while that of `G_L^(3/2)` is the whole group: the identity needs
  the shifted index `G_L^3`. At the finite level `M = ℚ_3(ζ_9)`, with `#G_0 = 6`,
  `#G_1 = #G_2 = 3` and `G_3 = 1` for `G = Gal(M/K)`, and `H_0 = H_1 = H_2 = H`, `H_3 = 1` for
  `H = Gal(M/L)`: `ψ_(M/K)(1) = 2`, so `G^1 ∩ H = G_2 ∩ H = H = H_2 = H^2`; `ψ_(M/K)(3/2) = 5`, so
  `G^(3/2) ∩ H = G_5 ∩ H = 1 = H_5 = H^3`. For `t > 0`, `G^t ⊆ G_1 = H`, so
  `[G : G^t H] = [G : H] = 2` and, with `f = 1`, the integral formula returns `2u`.
- `L/K` need not be Galois. In `M = ℚ_3(ζ_3, ∛3)` over `K = ℚ_3`, with `G = S_3`, `G_0 = S_3`,
  `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`, let `L = ℚ_3(∛3)`, so `H = Gal(M/L)` has order `2`,
  `H_0 = H` and `H_1 = 1`. Then `ψ_(L/K)(u) = u` on `[0, 3/2]` and `3u − 3` after: its slope
  `[G : G^t H]/f` is `1` while `G^t = C_3`, since `C_3 H = G`, and `3 = e(L/K)` once `G^t = 1`.
  At `u = 1`, `G^1 ∩ H = C_3 ∩ H = 1` and `H^1 = H_2 = 1`.
- The filtration of `L` must be taken relative to the valuation subring `ι(O)` over `O`. For
  `K = Frac W(F̄_p)` and any finite `L` in a finite Galois `M`, inertia is everything, so
  `G_K^0 = G_K` and the preimage of `G_K^0` is all of `G_L`, while `ψ_(L/K)(0) = 0`. Relative to
  `ι(O)`, `G_L^0` is the inertia of `L`, again all of `G_L`, since the residue field of `L` is
  `F̄_p`. Relative to the trivial valuation subring `AlgebraicClosure L`, which does not lie over
  `O`, each finite level is a field on which its Galois group acts faithfully, every `G_0` is
  trivial, and the filtration of `L` is trivial at `0`: the identity fails.

### 4a.3 Completed maximal unramified base change

Let `K′` be the completion of `K^ur` for the unique extension of the valuation. Then `K′` is
complete for a discrete valuation with `e(K′/K) = 1` and residue field an algebraic closure of
`k`. Prove that `L₀ ↦ L₀ ⊗_(K^ur) K′` is an equivalence from finite separable extensions of `K^ur`
to finite separable extensions of `K′`, so that restriction is a topological isomorphism
`G_(K′) ≅ I_K`. For a finite separable `L/K` and an embedding of `L` in a separable closure of
`K′`, put `L′ = LK′`; prove `e(L′/K′) = e(L/K)` and `d(L′/K′) = d(L/K)`, so the normalized
differents `d/e` agree. For `L/K` Galois, `Gal(L′/K′)` is identified with the inertia group
`G_0(L/K)`, with `G_i(L′/K′) = G_i(L/K)` for `i ≥ 0` and `G^v(L′/K′) = G^v(L/K)` for `v ≥ 0`;
under `G_(K′) ≅ I_K`, `G_(K′)^v` corresponds to `G_K^v` for every `v ≥ 0`. This holds in both
characteristics. The residue degree and the full Galois group of `L/K` are not preserved.

(Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](#source-brinonconrad-cmi-summer-school-notes-on-p-adic-hodge-theory), Exercise 1.4.4(3),
printed p. 10, and the proof of Lemma 13.1.6, printed p. 201, in mixed characteristic.)

*Proof.* `K^ur` carries the unique prolongation of the valuation (3a.1), so it is henselian, and it
is dense in `K′`. Krasner's lemma (Mathlib's `IsKrasner.of_completeSpace_of_normal`, applied in
a finite Galois extension of `K′` containing a primitive element of the given extension and the
roots of a nearby polynomial over `K^ur`, which supplies its `Normal` hypothesis) shows that a
finite separable extension of `K′` is generated by a root of a separable polynomial over `K^ur`
close to a defining polynomial, so the functor is essentially surjective; henselianity makes `K^ur`
separably closed in `K′`, so it is fully faithful. The argument uses only separability and
completeness, so it applies in equal characteristic as well. For `L/K` Galois with
`K_0 = L ∩ K^ur`, `L/K_0` is totally ramified, `L = K_0(π_L)` for an Eisenstein `π_L`, and the
Eisenstein polynomial stays Eisenstein over the integer ring of `K′` because `e(K′/K_0) = 1`.
Hence the integer ring of `L′` is generated by `π_L`, the values `v_L(σπ_L − π_L)` are unchanged,
and the lower filtration of `G_0(L/K) = Gal(L/K_0) ≅ Gal(L′/K′)`, the Herbrand function on
`[0, ∞)`, the upper groups at `v ≥ 0` and, by Hilbert's formula, the different agree. A finite
separable `L` is handled through a Galois closure, and the absolute statement is the limit over
`M`, by 4a.1.

*Needs:* 3a.1; 3a.2; 4a.1; Mathlib `UniformSpace.Completion`, `IsKrasner.of_completeSpace_of_normal`,
`Polynomial.IsEisensteinAt` and `differentIdeal`.

**Checks.**

- Completed maximal unramified base change of `ℚ_3(ζ_9)/ℚ_3` keeps `e = 6`, the lower groups
  `#G_0 = 6`, `#G_1 = #G_2 = 3`, `G_3 = 1`, the different `d = 9`, the normalized different
  `d/e = 3/2` and the upper jumps `0` and `1`.
- A finite unramified `L/K` becomes trivial over `K′`, keeping `G_0 = 1` and `d = 0`, while its
  Galois group and its residue degree are lost.
- For a finite residue field `K^ur` is not complete (Brinon–Conrad, Exercise 1.4.4(2), printed
  p. 10), so the comparison is made with `K′`, not with `K^ur`.

**Agreement with `Breve E` on a local field.** Let `E` be a nonarchimedean local field. Prove that
this roadmap's `K^ur` for `E` is `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, the
union of the unramified extensions of every degree of the completed roadmap, and that
`K′` is ReductiveGroupsPartII §RG2.0.4's `Breve E` as a valued field: both are the uniform
completion of that intermediate field for the unique extension of the valuation of `E`. Under this
identification the discreteness of the valuation of `K′`, the algebraic closedness of its residue
field and `e(K′/E) = 1`, proved above on the general perfect-residue domain, are that section's
statements that the valuation of `Breve E` is discrete, that its residue field is algebraically
closed and that a uniformizer of `E` remains one of `Breve E`. This section owns the completed
field and these properties on the general domain; the Frobenius of `Breve E` and its fixed field
stay that roadmap's and are not used here.

(Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](#source-brinonconrad-cmi-summer-school-notes-on-p-adic-hodge-theory), Exercise 1.4.4(2)
and (3), printed p. 10, in mixed characteristic: `K^un` as the compositum of the finite unramified
subextensions with its unique valuation, and its completion as a complete discretely valued field
whose residue field is an algebraic closure of `k`.)

*Proof.* The residue field of `E` is finite, hence perfect, so a finite subextension of
`AlgebraicClosure E` has `e = 1` over `E` exactly when it is unramified. With the local-field
structure that the completed roadmap puts on a finite intermediate field
(`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`), Tau Ceti's
`IntermediateField.le_maximalUnramifiedExtension_iff` says that such a subextension of a separably
closed field lies in `TauCeti.maximalUnramifiedExtension` exactly when it is unramified. Every
element of either compositum lies in a finite unramified subextension, so the two fields coincide.
Both constructions give this field the unique valuation extending that of `E` (3a.1), so the
uniform structures, the completions and the three properties agree. Nothing in the argument
depends on the characteristic of `E`.

*Needs:* the preceding target of this section (valuation, residue field and `e(K′/K) = 1` of
`K′`); 3a.1 (unique prolongation of the valuation); the completed roadmap's Tau Ceti declarations
`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField` (the local-field structure of a finite
extension) and `TauCeti.maximalUnramifiedExtension`; Tau Ceti
`IntermediateField.le_maximalUnramifiedExtension_iff`; ReductiveGroupsPartII §RG2.0.4 (`Breve E`);
Mathlib `UniformSpace.Completion`.

**Checks.**

- For `E = ℚ_p`, `K′` is `Breve ℚ_p = W(F̄_p)[1/p]`: the uniformizer `p` of `ℚ_p` stays a
  uniformizer and the residue field is `F̄_p`.
- For `E = F_q((t))`, `K^ur` is the union of the fields `F_(q^n)((t))` and `K′ = F̄_q((t))`, with
  uniformizer `t` and residue field `F̄_q`. A Laurent series whose coefficients generate extensions
  of `F_q` of unbounded degree lies in `K′` but in no `F_(q^n)((t))`, so the identification is with
  the completion, not with `K^ur`, in equal characteristic as well.
- `√p ∉ Breve ℚ_p`: its valuation `1/2` is outside the value group `ℤ` of a field with
  `e(K′/ℚ_p) = 1`. The Eisenstein polynomial `X² − p` stays irreducible over `Breve ℚ_p` and gives
  a quadratic extension with `e = 2`, as the base change of this section requires.

### Examples

`ℚ_2` and `ℚ_3` with their cyclotomic extensions, on which the absolute filtration
and `ψ_(L/K)` must return the completed roadmap's finite-level values; `Frac W(F̄_p)`, where
`K^ur = K` and inertia is everything; and `ℚ_3(ζ_9)/ℚ_3` under base change to `K′`.

### Dependencies

Layer 3a; the completed roadmap, through the Tau Ceti declarations for the local-field structure
of finite extensions, `TauCeti.maximalUnramifiedExtension`, `TauCeti.inertiaSubgroup` and
`TauCeti.wildInertiaSubgroup` with the closedness, normality, inclusion and pro-`p` theorems
listed in the supplier contract; Tau Ceti's restriction isomorphism
`TauCeti.absoluteGaloisGroupRestrictEquiv`, the compactness of `Field.absoluteGaloisGroup K` and
`TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes`; the completed roadmap ProfiniteProPGroups,
through its pro-`p` predicate `TauCeti.IsProP`; ReductiveGroupsPartII §RG2.0.4 for
`Breve E`; Mathlib's absolute Galois group with `Field.absoluteGaloisGroup.mapOfAlgebra`,
valuation subrings with their decomposition and inertia subgroups, finite Galois intermediate
fields, uniform completion and Krasner's lemma.

## Dependency order

The external dependency order is
**[LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md) → this roadmap**,
with ReductiveGroups, SchemeAndStackFoundations and AdicSpacesPartII supplying
§3a.3's proalgebraic inputs, the completed roadmap
[ProfiniteProPGroups](../../Completed/ProfiniteProPGroups/README.md) supplying, through Tau Ceti's
`TauCeti.IsProP`, the pro-`p` predicate of §4a.1's wild inertia, and ReductiveGroupsPartII
§RG2.0.4 supplying the field `Breve E` of §4a.3's agreement. Within this roadmap the order is
§3a.1 → §3a.2 → §3a.3 (its three prerequisite targets, then the theorem) → §4a.1 → §4a.2 →
§4a.3.

## Downstream consumers

PadicPeriodRings consumes §§3a.1–3a.3 (the lower numbering, Herbrand functions and Hasse–Arf
over a general complete discretely valued field with perfect residue field, and the proalgebraic
unit groups of §3a.3 on which it builds geometric reciprocity) and §§4a.1–4a.3 (the absolute
upper filtration with inertia, the transition functions `ψ_(L/K)` of finite separable extensions
and the completed maximal unramified base change) for its eventual upper-break spacing, Sen tower
estimates and completed unramified descent. ArithmeticGaloisRepresentations consumes §§3a.1–3a.3
and 4a.1–4a.3 directly (Hilbert's different formula, Herbrand functions and tower transitivity,
Hasse–Arf, the absolute upper filtration with `G_K^0` inertia and `G_K^(0+)` wild inertia, the
transition functions on open subgroups and the completed maximal unramified comparison) for
representation breaks and Swan conductors over complete discretely valued fields with arbitrary
perfect residue field, in both characteristics. ClassFieldTheory consumes §4a.1 (the absolute
upper filtration with its finite projections) for the reciprocity–filtration compatibilities over
a perfect residue field. PadicExtensionFamilies consumes §4a.2 (`ψ_(L/K)` of a finite separable
extension of nonarchimedean local fields, with its independence of the Galois closure, tower law,
finite-level subgroup identity and integral formula) for the breaks of a separable extension in
its Layer 2 and its polygon-to-break theorem. FilteredLocalGaloisGroups and FieldOfNorms consume
§§4a.1–4a.2 on nonarchimedean local fields (the absolute upper filtration with its finite
projections and inertia, `ψ_(L/K)` with its tower law, the open-subgroup identity
`G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` and the integral formula), the first for the upper filtration of
the absolute Galois group and of its solvable quotients, the second for arithmetically profinite
extensions and their fields of norms. Integral `p`-adic Hodge theory reaches the package through
PadicPeriodRings.

## References

The mathematical spine is Serre, *Local Fields*; the sources cited by number follow.

### Source: Serre, *Local Fields*

Jean-Pierre Serre, *Local Fields*, Graduate Texts in Mathematics 67, Springer, 1979, the
translation of *Corps locaux*, Hermann, 1962. Located by chapter, section and statement number.

### Source: Serre, *Sur les corps locaux à corps résiduel algébriquement clos*

Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](http://www.numdam.org/item?id=BSMF_1961__89__105_0), Bulletin de la Société Mathématique de
France 89 (1961), 105–154. Located by numbered paragraph and printed page; its n° 3.1 treats
totally ramified extensions of an arbitrary complete discretely valued field, and from n° 3.2 on
it assumes an algebraically closed residue field.

### Source: Serre, *Groupes proalgébriques*

Jean-Pierre Serre, [Groupes proalgébriques](http://www.numdam.org/item?id=PMIHES_1960__7__5_0),
Publications mathématiques de l'IHÉS 7 (1960), 5–67, reference [21] of the 1961 article. Located
by numbered paragraph and printed page; it builds quasialgebraic and proalgebraic groups over an
algebraically closed field, their abelian category, connected components and homotopy groups.

### Source: Grothendieck, *Éléments de géométrie algébrique III, première partie*

Alexander Grothendieck, [Éléments de géométrie algébrique : III. Étude cohomologique des faisceaux
cohérents, première partie](http://www.numdam.org/item?id=PMIHES_1961__11__5_0), Publications
mathématiques de l'IHÉS 11 (1961), 5–167. Located by the numbering of Chapitre 0 and printed page.

### Source: Brinon–Conrad, *CMI summer school notes on p-adic Hodge theory*

Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](https://math.stanford.edu/~conrad/papers/notes.pdf), 2009, the authors' posted notes.
Located by exercise or lemma number and printed page.

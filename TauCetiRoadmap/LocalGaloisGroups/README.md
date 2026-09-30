# Roadmap: local Galois groups of p-adic fields

This roadmap determines the absolute Galois group and the maximal pro-`p` Galois group of a
finite extension `K/ℚ_p` at the level visible to generators, cohomology, roots of unity,
cyclotomic orientation, and marked presentations. Its central dichotomy is Shafarevich–Demushkin:

```text
μ_p ⊄ K  =>  G_K(p) is free pro-p of rank [K : ℚ_p] + 1,
μ_p ⊆ K  =>  G_K(p) is Demushkin of rank [K : ℚ_p] + 2.
```

It also proves the distinct theorem `d(G_K) = [K : ℚ_p] + 2` for the **full** absolute Galois
group in both cases, identifies the Demushkin orientation with the descended cyclotomic
character, selects which of the imported marked Labute normal forms applies from the roots of
unity in `K` and the image of that orientation, and culminates in the marked isomorphism

```text
G_{ℚ₂}(2) ≃ D₀ = ⟨A, S, Y | A²S⁴(S,Y)⟩.
```

The abstract group `D₀`, its generators and its standard orientation are not defined here. They
are supplied by **ProfiniteProPGroups**. This roadmap owns the arithmetic theorem identifying
the local Galois group with that marked abstract group.

## Scope and ownership

The roadmap owns:

- `G_K(p)` as the specialization of the supplier's maximal pro-`p` quotient to
  `Field.absoluteGaloisGroup K`;
- comparison of continuous cohomology across `G_K -> G_K(p)` in the degrees used here, with trivial
  and with twisted coefficients;
- finite generation and exact generator ranks of `G_K(p)`;
- the free and Demushkin cases;
- the group `pPowerRootsOfUnity p K` of `p`-power roots of unity of `K`, its finiteness, the
  invariant `q(K)` read off its order, and the equality of that invariant with the Demushkin `q`;
- the local cyclotomic character, the irreducibility of `Φ_{p^n}` over `ℚ_p` and the resulting
  surjectivity of the character of `G_{ℚ_p}`, its descent to `G_K(p)`, the computation of its image,
  and its identification with the canonical Demushkin character through Kummer theory and
  inflation with twisted coefficients;
- marked local presentations and the three arithmetic acceptance examples;
- the completed multiplicative module `A(L) = lim_m Lˣ/(Lˣ)^(p^m)` with its integral
  `ℤ_p[Gal(L/K)]`-module structure, its torsion, and its free quotient;
- integral cancellation over `ℤ_p[G]` for a finite group `G` — Krull-Schmidt-Azumaya, the
  detection of projectives by their rationalization and by their reduction modulo `p`, the
  passage from a stable isomorphism to an isomorphism, and the torsion criterion for stable
  isomorphism of modules of projective dimension one — which is what turns the rational
  decomposition of `A(L)` into an integral statement, and which no supplier in the dependency
  list provides;
- the Tate module of a finite tame layer, its integral decomposition against the tame-frame
  module, Lyndon's identification of the relation module with `R^ab(p)`, and the resulting
  relation-module surjection onto `A(L)` and its lift to group extensions;
- the exact finite generator rank of the full `G_K`.

It does not rebuild abstract profinite or pro-`p` group theory, continuous-cohomology operations,
ramification theory, Kummer theory, local reciprocity, or local Tate duality. In particular it
defines no copy of `IsDemushkin`, no second cup product, no second prescription predicate, no
second Tate dual, no second local Artin map, and no private input record standing in for supplier
theorems. There is no `LocalFieldInputs`, `ProPOps`, or `ProPRankInputs` structure in this
roadmap. Each proof consumes the named supplier declarations directly.

Labute's abstract classification of Demushkin groups stays in **ProfiniteProPGroups**, together
with the three relator words and the two even-rank families. This roadmap computes the three
invariants `demushkinRank`, `demushkinQ` and `demushkinCharacter` for `G_K(p)` and then applies
the supplier's marked theorems with those values substituted. No presentation theorem is restated
with local-field hypotheses appended, and no second normal form is introduced.

## Conventions

- `p : ℕ` is prime and `K` is a finite extension of `ℚ_p`.
- `G_K` means Mathlib's `Field.absoluteGaloisGroup K`.
- `G_K(p)` means exactly
  `ProfiniteProPGroups.maximalProPQuotient p (Field.absoluteGaloisGroup K)` and is named
  `absoluteGaloisGroupProP`. No second quotient carrier is permitted.
- `N` always means `Module.finrank ℚ_[p] K`. The letter `d` denotes a generator rank, never a
  field degree.
- `μ_p ⊆ K` is written intrinsically as `∃ ζ : K, IsPrimitiveRoot ζ p`; there is no wrapper
  predicate whose only purpose is to carry this proposition.
- The `p`-power roots of unity of `K` are a **subgroup of `Kˣ`**, namely Mathlib's
  `CommGroup.primaryComponent Kˣ p`, and not a subtype of `K`. Closure under multiplication and
  inverse is part of the object.
- The local `q` is the **order of that group**, and the accessor `localRootOfUnityOrder` takes
  the finiteness proof as an argument, exactly as the supplier's `topologicalGeneratorRankNat`
  takes finite generation. ⚠ `Nat.card` is total and returns `0` on an infinite group, and `0` is
  also the supplier's meaningful torsion-free value of `demushkinQ`; an ungated accessor would let
  `q(K) = 0` be derived for `K = ℚ_p(μ_{p^∞})` and then read as that value. For a `p`-adic field
  `q(K)` is a positive power of `p`.
- Arithmetic reciprocity is normalized so a uniformizer maps to arithmetic Frobenius. For a
  unit `u`, the cyclotomic character satisfies
  `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. The inverse is load-bearing.
- Relators use Labute's commutator `(x,y) = x⁻¹y⁻¹xy`, the convention of
  `ProfiniteProPGroups.demushkinWordNeTwo`, `demushkinWordTwoOdd`, and
  `demushkinWordTwoEven`.
- A presentation is a quotient by the **closed** normal closure of its relator.
- A marked isomorphism records the orientation, not merely the underlying topological group.

## Exact supplier contracts

All names in this section are part of the dependency contract. Their namespaces are shown in
the table; subject descriptions without an exact declaration are not dependencies.

### From `TauCetiRoadmap.ProfiniteProPGroups`

| Use here | Exact declarations |
|---|---|
| maximal pro-`p` quotient | `proPKernel`, `maximalProPQuotient`, `IsProP`, `topAbelianization` |
| generation and rank | `IsTopologicallyFinitelyGenerated`, `topologicalGeneratorRank`, `topologicalGeneratorRankNat`, `topologicalGeneratorRank_le_of_surjective`, `topologicalGeneratorRankNat_le_of_isOpen`, `topologicallyGenerates_iff_frattiniQuotient` |
| free case | `freeProP`, `isFree_of_cd_p_le_one` |
| Demushkin theory | `trivialFp`, `cohomFp`, `fpPairing`, `fpPairing_bil`, `cupFp`, `cupFp_gradedComm`, `IsDemushkin`, `demushkinRank`, `demushkinQ`, `demushkinCharacter`, `demushkinCharacter_unique` |
| marked classification | `presentedProP`, `freeProPGen`, `presentedProPGen`, `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoEven`, `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd`, `isDemushkin_marked_of_q_two_even` |
| marked dyadic target | `demushkinD0`, `d0A`, `d0S`, `d0Y`, `standardD0Orientation`, `standardD0Orientation_d0A`, `standardD0Orientation_d0S`, `standardD0Orientation_d0Y`, `standardD0Orientation_surjective` |
| closed subgroups of `ℤ₂ˣ` | `unitsPrincipal`, `unitsPlusMinus`, `procyclicClosure` |
| the pro-`p` kernel has no `p`-quotient (Layer 2, twisted inflation) | `proPKernel_proPKernel_eq_top` |
| lifting along an extension class (Layer 7, Step 5) | `ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`, `ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`, `GroupExtension.surjective_of_comp_inl_eq` |

The supplier owns the definitions and all abstract classification theorems. This roadmap applies
them; it does not restate them with local-field hypotheses appended. In the Demushkin row,
`cupFp_gradedComm` makes one-sided nondegeneracy of the cup square enough, and `fpPairing` with its
defining equation `fpPairing_bil` is the multiplication pairing that the chosen-root dictionary
compares with the Kummer pairing (Layer 1). The supplier's `HasPrescriptionProperty` is Tau Ceti's
`HasPrescriptionProperty` by reducible alias and `demushkinCharacter hG` is a continuous character,
so `demushkinCharacter_unique` takes the Tau Ceti predicate of this roadmap's continuous orientation
directly (Layer 5), and no second prescription predicate is involved.

### From `TauCetiRoadmap.ProfiniteCohomology`

| Use here | Exact declarations |
|---|---|
| quotient comparison | `quotientToInvariants`, `quotientToInvariantsι`, `infl`, `explicitIso_infl` |
| five-term argument | `transgression`, `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`, `transgression_explicitResConj1`, `explicitInfl2_transgression` |
| coefficient maps and cup compatibility | `coeffMap`, `cup`, `degreeCast`, `cup_infl`, `cup_coeffMap`, `cup_add_left`, `cup_add_right`, `cup_gradedComm` |
| cohomological dimension | `cd_p`, `scd_p`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent` |
| the class module, used at `G_K` (PC Layer 11; NSW (3.6.4)(iii) at `G = G_K`, `V = G_L`, `L/K` finite Galois) | `abelianizationProP`, `abelianizationProPFactorSet`, `abelianizationProPClass`, `abelianizationProPClass_generates` |

The comparison is always with Mathlib's `continuousCohomology`; this roadmap has no cohomology
carrier of its own. `cd_p` and `scd_p` are Tau Ceti's `cohomologicalDimensionAt` and
`strictCohomologicalDimensionAt` by reducible alias. The hypothesis of
`abelianizationProPClass_generates` is `scd_p p G ≤ 2`; at `G = G_K` it is ClassFieldTheory's
`scd_p_absoluteGaloisGroup_eq_two`, a statement about the same invariant, so no comparison enters.
Layer 1 carries the Kummer cup square to the cup square of `𝔽_p` with `cup_coeffMap`. Layer 7
also reads the carrier `abelianizationProP`, with its conjugation action, and the class
`abelianizationProPClass` at the relation subgroup `R` of a free profinite group, for Lyndon's
theorem and the extension `E_top` of Step 5; the generation theorem is used only at `G_K`. The
class takes the openness of the subgroup: `G_L` is open, and so is `R`, the kernel of a
presentation of the finite group `Gal(L/K)`.

### From `TauCetiRoadmap.LocalFieldsRamification`

| Use here | Exact declarations |
|---|---|
| normalized local-field arithmetic | `normalizedValuation`, `natCastValuation`, `absoluteRamificationIndex`, `absoluteRamificationIndex_eq_natCastValuation`, `inertiaDegree`, `card_residueField`, `ramificationIndex_mul_inertiaDegree` |
| units and power classes | `unitFiltration`, `mem_unitFiltration_zero`, `card_powerClasses_mixed`, `card_squareClasses_dyadic` |
| norms | `normGroup`, `mem_normGroup_iff_dvd_normalizedValuation` |
| deep units | `deepUnitExpLogEquiv`, `localLogarithm`, `localExponential` |
| tame frame | `wildInertia`, `wildInertia_isProP`, `wildInertia_normal`, `tameQuotient`, `tameInertia`, `tameInertiaEquiv`, `IsArithFrobeniusLift`, `exists_isArithFrobeniusLift`, `exists_topologicalClosure_zpowers_eq_tameInertia` |
| the marked tame presentation | `IwasawaGroup`, `iwasawaSigma`, `iwasawaTau`, `tameQuotientEquiv`, `tameQuotientEquiv_mk_frobenius`, `tameQuotientEquiv_mk_tameGenerator` |

These declarations supply the field-arithmetic count behind `H¹`, the cyclotomic filtration, the
deep-unit logarithm behind the rational decomposition of `A(L)`, and the tame/wild frame used in
the upper bound for the full `G_K`. Ramification filtrations and the tame quotient remain owned by
that roadmap even when used in the proof here; in particular Layer 7 uses `tameQuotient`,
`wildInertia` and the marked isomorphism `tameQuotientEquiv` as imported objects, takes its tame
generator from `exists_topologicalClosure_zpowers_eq_tameInertia`, which puts it in inertia, and
defines no second tame or wild carrier and no second Iwasawa presentation. `wildInertia K` is built
from the lower ramification groups of the finite Galois layers of `K`, and `normalizedValuation K`
is Tau Ceti's normalized valuation, so both depend on the valuation and topology of `K`. Every
statement here that mentions wild inertia, the tame quotient or tame inertia therefore carries
`[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, the quotient-generation
statements of Layer 7 Step 5 included.

### From `TauCetiRoadmap.ClassFieldTheory`

| Use here | Exact declarations |
|---|---|
| coefficient objects and Kummer theory | `GalRep`, `H`, `muNRep`, `kummerEquiv_mixed` |
| degree two and local duality | `finite_H`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `tateDual`, `tateDualityPairing`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp` |
| the chosen-root comparison of the cup square with duality | `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerCupPairing`, `kummerCupPairing_bil`, `localSymbol`, `muNRepToTateDual`, `bijective_muNRepToTateDual`, `tateDualityPairing_muNRepToTateDual` |
| reciprocity and orientation | `artinMap`, `restrictAbsolute`, `artinMap_restrict`, `absoluteGaloisGroupExtend`, `artinMap_norm`, `denseRange_artinMap`, `localArtinMap`, `normResidue`, `unramifiedCoordinate`, `unramifiedCoordinate_artinMap`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic` |
| class formation and Tate's theorem | `ClassFormation` (Tau Ceti's, re-exported), `tateTheorem`, `artinMap_conj` |
| strict cohomological dimension of `G_K` | `scd_p_absoluteGaloisGroup_eq_two` |

The `h2MuEquivZMod_mixed` theorem is the mixed-characteristic result valid at `n = p`; the
away-from-`p` theorem with `IsUnit (n : 𝒪[K])` cannot replace it. Likewise,
`h2FpEquivZMod_of_mu` carries a chosen primitive root and a coefficient identification. Omitting
that identification makes the statement false. `tateDual A` is Tau Ceti's internal hom
`Hom(A, μ_n)` with its conjugation action, and `tateDualityPairing` is evaluation followed by an
invariant `H²(G_K, μ_n) ≃ ℤ/n`. After a primitive root `ζ ∈ K` is chosen, `muNRepToTateDual ζ`
identifies `μ_p` with `Hom(μ_p, μ_p)`, and `tateDualityPairing_muNRepToTateDual` turns the `(1, 1)`
duality pairing at `A = μ_p` into the Hilbert pairing `localSymbol (kummerCupPairing ζ)`. Layer 1
reads that pairing on `H¹(G_K, 𝔽_p)` through the chosen-root dictionary.

`cyclotomicCharacter_artinMap` and `cyclotomicCharacter_artinMap_padic` are proved in
ClassFieldTheory's Layer 11, from global reciprocity over `ℚ`, so every statement here that
consumes them depends on ClassFieldTheory Layers 10 and 11;
`localCyclotomicCharacter_artinMap_padic_uniformizer` (Layer 5) does not.

### From Tau Ceti

Several targets of the supplier roadmaps are landed in Tau Ceti at this repository's pin. This
roadmap consumes those declarations directly, as `TauCeti.*`, and `Suggested.lean` imports the
modules of those that its statements and closed proofs use. The Krull–Schmidt theorem is used only
in the proof route of a target, and is cited there by name.

| Use here | Exact declarations |
|---|---|
| twisted coefficients and the prescription property | `ZModTwist`, `ZModTwist.reduce`, `ZModTwist.isProP_multiplicative`, `HasPrescriptionProperty`, `hasPrescriptionProperty_iff` |
| explicit low-degree cohomology | `ContCohomology.explicitInfl1`, `ContCohomology.explicitInfl1_injective`, `ContCohomology.explicitInfRes_exact`, `ContCohomology.explicitInfl1_eq_explicitMap1`, `ContCohomology.explicitMap1_comp`, `ContCohomology.explicitRes1`, `ContCohomology.explicitCoeff1`, `ContCohomology.explicitCoeff1Equiv`, `ContCohomology.H1EquivOfSmulEqSelf`, `ContCohomology.explicitH2IsoGroupCohomology` |
| Kummer theory on the explicit model | `kummerIsoTransport`, `kummerMap_surjective`, `kummerMap_eq_kummerCocycleClass`, `absoluteGaloisGroupRestrictEquiv` |
| trivial coefficients and coefficient maps | `trivialFpEquiv`, `trivialFp_ρ_apply_apply`, `ContinuousCohomology.coeffMap_comp`, `ContinuousCohomology.coeffMap_id` |
| continuous quotient maps | `ContinuousMonoidHom.quotientMk`, `ContinuousMonoidHom.quotientLift` |
| free profinite groups and extensions | `freeProfiniteGroup`, `freeProfiniteGroup.lift`, `freeProfiniteGroup.hom_ext`, `freeProfiniteGroup.dense_closure_range_of`, `ProfiniteGroupExtension`, `GroupExtension.contCohomologyClass_factorSet_eq` |
| class formations | `ClassFieldTheory.ClassFormation.fundamentalClass`, `ClassFieldTheory.ClassFormation.fundamentalClass_generates` |
| group algebras and cancellation | `MonoidAlgebra.augmentation`, `MonoidAlgebra.ker_augmentation_eq_span`, `exists_equiv_linearEquiv_of_isLocalRing_end` |
| local fields | `FinitePadicExtension`, `galoisSubgroup`, `galoisSubgroup_index`, `galoisSubgroupEquiv_apply_separableClosureRingEquiv`, `isProP_units_padicInt_two` |

Tau Ceti's `localCyclotomicCharacter` landed after this repository's Tau Ceti pin; this roadmap's
`localCyclotomicCharacter` has the same values and is replaced by it when the pin moves.

## How to read the build

`README.md` is normative. `Suggested.lean` pins central names and useful target signatures but is
not exhaustive. Source-extraction records are maintained in the private migration and provenance
ledger and are not prerequisites.

In the layers below, `M` denotes Mathlib, `TC` denotes Tau Ceti at this repository's pin, `PPG`
denotes `ProfiniteProPGroups`, `PC` denotes `ProfiniteCohomology`, `LFR` denotes
`LocalFieldsRamification`, and `CFT` denotes `ClassFieldTheory`. Every dependency points to one of
those suppliers or an earlier layer here.

## Layer 0: the arithmetic carrier and intrinsic invariants

- Define `absoluteGaloisGroupProP p K` as a reducible abbreviation for
  `PPG.maximalProPQuotient p (Field.absoluteGaloisGroup K)`. Prove the quotient is profinite and
  pro-`p`, assembling supplier quotient instances and closedness of `proPKernel`.
  *Needs:* PPG `proPKernel`, `maximalProPQuotient`; M `Field.absoluteGaloisGroup`.
- Define `pPowerRootsOfUnity p K : Subgroup Kˣ` as Mathlib's `CommGroup.primaryComponent Kˣ p`,
  the units killed by some power of `p`, and prove the membership criterion
  `x ∈ pPowerRootsOfUnity p K ↔ ∃ n, x ^ p ^ n = 1` and the description
  `pPowerRootsOfUnity p K = ⨆ n, rootsOfUnity (p^n) K`. Because it is a subgroup, closure under
  multiplication and inverse is part of the object rather than a lemma.
- Prove `finite_pPowerRootsOfUnity`: the group is finite for `K/ℚ_p`. Prove
  `isCyclic_pPowerRootsOfUnity`. **Only then** define
  `localRootOfUnityOrder p K h : ℕ`, where `h` is the finiteness proof, as the order of that
  group, and prove `localRootOfUnityOrder_isPow`, `localRootOfUnityOrder_pos`, and that it is the
  largest `p^n` for which `K` contains a primitive `p^n`-th root.
  *Needs:* LFR unit filtration and power-class theory.
- Define `localCyclotomicCharacter p K : G_K -> ℤ_pˣ` **with a body**, as Mathlib's
  `cyclotomicCharacter (AlgebraicClosure K) p` restricted along `AlgEquiv.toRingEquiv`, pin the
  defining equation in `localCyclotomicCharacter_apply`, and prove continuity. A character left as
  an unpinned `sorry` would make every later statement about it vacuous. Its bundled form
  `continuousLocalCyclotomicCharacter : G_K →ₜ* ℤ_pˣ` is the one TC's `ZModTwist` and
  `HasPrescriptionProperty` take. TC's `localCyclotomicCharacter`, with the same values, landed
  after this repository's Tau Ceti pin, and replaces this one when the pin moves.
  *Needs:* M `cyclotomicCharacter`.
- Prove `irreducible_cyclotomic_prime_pow_ratPadic`: `Φ_{p^{n+1}}` is irreducible over `ℚ_p`, for
  every prime `p` and every `n`. `Φ_{p^{n+1}}(X + 1)` is Eisenstein at `(p)` over `ℤ_p` (M
  `cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`, read in `ℤ_[p]` coefficientwise, the ideal
  being `PadicInt.maximalIdeal_eq_span_p`), hence irreducible over `ℤ_p`
  (`IsEisensteinAt.irreducible`; a monic polynomial is primitive), hence over `ℚ_p`
  (`Monic.irreducible_iff_irreducible_map_fraction_map`, `PadicInt.isFractionRing`); and `X ↦ X + 1`
  is a ring automorphism of `ℚ_p[X]`. Then prove
  `surjective_toZModPow_localCyclotomicCharacter_ratPadic`: for every `n` the reduction of
  `localCyclotomicCharacter p ℚ_[p]` modulo `p^n` is onto `(ℤ/p^n)ˣ`, since restriction
  `G_{ℚ_p} ↠ Gal(ℚ_p(μ_{p^n})/ℚ_p)` followed by `IsCyclotomicExtension.autEquivPow`, an isomorphism
  by irreducibility, is the reduced character
  (`IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`, `cyclotomicCharacter.toZModPow`). Then
  prove `surjective_localCyclotomicCharacter_ratPadic`: the image is compact, hence closed, and maps
  onto every finite level, hence is `ℤ_pˣ` (`PadicInt.ext_of_toZModPow`); record
  `range_localCyclotomicCharacter_ratPadic`. ⚠ Surjectivity is a statement at `ℚ_p` only: over
  `ℚ₂(i)` the image is `1 + 4ℤ₂`, and the image for a general `K` is the Layer 5 milestone
  `range_localCyclotomicCharacter`.
  *Needs:* M `cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`, `IsEisensteinAt.irreducible`,
  `Monic.irreducible_iff_irreducible_map_fraction_map`, `IsCyclotomicExtension.autEquivPow`,
  `cyclotomicCharacter.toZModPow`, `AlgEquiv.restrictNormalHom_surjective`,
  `PadicInt.ext_of_toZModPow`.
- Compare `G_K` with `G_{ℚ_p}`. For a `ℚ_p`-embedding `ι : K → ℚ_pˢ`,
  `CFT.absoluteGaloisGroupExtend ℚ_[p] K ι` realizes `G_K` as the open subgroup
  `TC.galoisSubgroup ℚ_[p] K ι` of `G_{ℚ_p}`, of index `N` (`TC.galoisSubgroup_index`), and the
  cyclotomic character of `G_K` is that of `G_{ℚ_p}` read along it
  (`localCyclotomicCharacter_absoluteGaloisGroupExtend`), because both are read off the action on
  the same `p`-power roots of unity. Hence `range_localCyclotomicCharacter_le_ratPadic`: the image
  of `G_K` is a subgroup of the image of `G_{ℚ_p}` of index dividing `N` (M
  `Subgroup.index_map_dvd`).
  *Needs:* CFT `absoluteGaloisGroupExtend`; TC `galoisSubgroup`, `galoisSubgroup_index`,
  `galoisSubgroupEquiv_apply_separableClosureRingEquiv`; M `cyclotomicCharacter.spec`,
  `IsSepClosed.lift`.

Basic API for the roots-of-unity group includes the inclusions as `n` increases, invariance under
field isomorphism over `ℚ_p`, behavior in finite towers, the equivalence
`primitiveRoot_iff_dvd_localRootOfUnityOrder` between `p ∣ q(K)` and
`∃ ζ : K, IsPrimitiveRoot ζ p`, the implication `prime_eq_two_of_localRootOfUnityOrder_eq_two`,
and the dyadic criterion `localRootOfUnityOrder_ne_two_iff`: at `p = 2`, `q(K) ≠ 2` holds exactly
when `K` contains a primitive fourth root of unity. That last equivalence is what makes the
fourth-roots condition of Layer 6 a provable predicate rather than a row of a table.

## Layer 1: local cohomology with trivial coefficients

Fix `T = PPG.trivialFp p G_K`. The statements of this layer are at `Type`, as the CFT suppliers
are, and take the finite `ℚ_p`-structure of `K` as the instance `TC.FinitePadicExtension K p`.
Prove, by the CFT coefficient dictionary rather than by defining a new representation, the
following exact statements:

- `H⁰(G_K, 𝔽_p)` is finite-dimensional of dimension `1`.
- `H¹(G_K, 𝔽_p)` and `H²(G_K, 𝔽_p)` are finite-dimensional. Finiteness is a separate theorem
  from each finrank calculation: `Module.finrank` alone is `0` on an infinite-dimensional module.
- The chosen-root dictionary `muNRepIsoTrivialFp n K ζ : μ_n ≅ ℤ/n`, a construction, for
  `n ≠ 0` and a primitive `n`-th root of unity `ζ ∈ K`; at `n = p` it identifies `μ_p` with `T`.
  Its underlying map is CFT's coordinate `muNRepEquivZMod ζ`, `ζ^x ↦ x`, followed by TC's
  `trivialFpEquiv` (`trivialFpEquiv_muNRepIsoTrivialFp_hom_apply`). It is a morphism of
  coefficient objects in both directions because `G_K` fixes `μ_n(Kˢ)` pointwise when `ζ ∈ K`
  (CFT `muNRep_ρ_eq_self`) and acts trivially on `ℤ/n` (TC `trivialFp_ρ_apply_apply`). It carries
  CFT's Kummer pairing `kummerCupPairing ζ`, `(x, y) ↦ log_ζ(x) · y` (`kummerCupPairing_bil`), to
  PPG's multiplication pairing `fpPairing` (`fpPairing_bil`):
  `muNRepIsoTrivialFp_hom_kummerCupPairing`, a closed proof. Neither statement uses the valuation
  or topology of `K`, or the primality of `n`.
- If `μ_p ⊆ K`, then `H²(G_K, 𝔽_p) ≃ 𝔽_p` (`nonempty_cohomFp_two_addEquiv_of_mu`), which is
  `CFT.h2FpEquivZMod_of_mu` at `T` through the dictionary.
- If `μ_p ⊄ K`, then `H²(G_K, 𝔽_p)` actually vanishes. State `Subsingleton`, not merely
  `finrank = 0`.
- When `μ_p ⊆ K`, `dim H¹(G_K, 𝔽_p) = N + 2` by Kummer theory alone (`finrank_cohomFp_one_of_mu`):
  the dictionary identifies `H¹(G_K, 𝔽_p)` with `H¹(G_K, μ_p)`, which `CFT.kummerEquiv_mixed` at
  `n = p` identifies with `Kˣ/(Kˣ)^p`, and `LFR.card_powerClasses_mixed` at `n = p` counts it:
  `p · #μ_p(K) · #𝓀[K]^{v_K(p)} = p^{N+2}`, since `#μ_p(K) = p` (M
  `IsPrimitiveRoot.card_rootsOfUnity`) and `#𝓀[K]^{v_K(p)} = p^{e·f} = p^N`
  (`LFR.absoluteRamificationIndex_eq_natCastValuation`, `LFR.card_residueField`,
  `LFR.ramificationIndex_mul_inertiaDegree`). At `p = 2` the count is
  `LFR.card_squareClasses_dyadic`. This is the count the Demushkin rank of Layer 5 rests on, and it
  does not consume the Euler characteristic.
- The Euler characteristic gives `dim H¹ = 1 + dim H² + N` (`finrank_cohomFp_one`, from
  `CFT.eulerCharacteristic_finrank_fp`), and with the vanishing of `H²` the count `N + 1` when
  `μ_p ⊄ K` (`finrank_cohomFp_one_of_not_mu`). When `μ_p ⊆ K` it agrees with the Kummer count.
- When `μ_p ⊆ K`, the cup square on `H¹(G_K, 𝔽_p)` is nondegenerate on both sides
  (`cupFp_nondegenerate_of_mu`). Left nondegeneracy (`cupFp_left_nondegenerate_of_mu`) is local
  duality at `A = μ_p` and `(i, j) = (1, 1)`, read through the dictionary, in five steps, and it is
  a closed proof:
  1. the dictionary carries a class `a ≠ 0` of `H¹(G_K, 𝔽_p)` to a class `x ≠ 0` of
     `H¹(G_K, μ_p)`, since coefficient maps along an isomorphism are inverse to each other (PC
     `coeffMap`, TC `ContinuousCohomology.coeffMap_comp` and `coeffMap_id`);
  2. CFT's `muNRepToTateDual ζ : μ_p → Hom(μ_p, μ_p)`, `x ↦ (y ↦ log_ζ(x) · y)`, is bijective
     (`bijective_muNRepToTateDual`), hence an isomorphism of coefficient objects, so the image `x'`
     of `x` in `H¹(G_K, Hom(μ_p, μ_p))` is nonzero;
  3. the first half of `CFT.tateDualityPairing_perfect_mixed`, with an invariant
     `tr : H²(G_K, μ_p) ≃ ℤ/p` from `CFT.h2MuEquivZMod_mixed`, gives `y` with `⟨x', y⟩ ≠ 0`;
  4. `CFT.tateDualityPairing_muNRepToTateDual` identifies `⟨x', y⟩` with the Hilbert pairing
     `localSymbol (kummerCupPairing ζ) tr x y`, which is `tr` of the cup of `x` and `y` along
     `kummerCupPairing ζ`, so that cup is nonzero;
  5. PC `cup_coeffMap`, at the compatibility `muNRepIsoTrivialFp_hom_kummerCupPairing`, carries that
     cup to `cupFp a b` for `b` the image of `y`, and the dictionary is injective on `H²`.

  One side suffices: the other follows from the graded commutativity `PPG.cupFp_gradedComm`, a
  closed proof. Do not introduce an untyped assertion that “local duality holds.”

*Needs:* CFT `finite_H`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `tateDual`,
`tateDualityPairing`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp`,
`kummerEquiv_mixed`, `muNRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerCupPairing`,
`kummerCupPairing_bil`, `localSymbol`, `muNRepToTateDual`, `bijective_muNRepToTateDual`,
`tateDualityPairing_muNRepToTateDual`; LFR `card_powerClasses_mixed`, `card_squareClasses_dyadic`,
`absoluteRamificationIndex_eq_natCastValuation`, `card_residueField`,
`ramificationIndex_mul_inertiaDegree`; PPG `trivialFp`, `cohomFp`, `fpPairing`, `fpPairing_bil`,
`cupFp`, `cupFp_gradedComm`; PC `coeffMap`, `cup_coeffMap`; TC `FinitePadicExtension`,
`trivialFpEquiv`, `trivialFp_ρ_apply_apply`, `ContinuousCohomology.coeffMap_comp`,
`ContinuousCohomology.coeffMap_id`; M `IsPrimitiveRoot.card_rootsOfUnity`.

## Layer 2: inflation from the maximal pro-p quotient

Let `R = PPG.proPKernel p G_K`.

- Prove `R` acts trivially on `𝔽_p`, identify the quotient coefficient object
  `PC.quotientToInvariants R T` with `PPG.trivialFp p G_K(p)`, and pin the comparison. This
  coefficient isomorphism is the only adapter; it is not a new coefficient carrier.
- Prove `inflH1AbsoluteGaloisProP`, the degree-one inflation isomorphism
  `H¹(G_K(p),𝔽_p) ≃ H¹(G_K,𝔽_p)`.
- Prove `explicitInfl1_zModTwist_bijective`, degree-one inflation with **twisted** coefficients, on
  TC's explicit model. For a continuous character `χ : G_K(p) →ₜ* ℤ_pˣ`, the quotient map
  `π : G_K → G_K(p)` (`absoluteGaloisGroupProPMk`, TC `ContinuousMonoidHom.quotientMk`) and every
  `i`, with `I(χ)/pⁱ` TC's `ZModTwist χ i`, the inflation
  `H¹(G_K/R, (I(χ∘π)/pⁱ)^R) → H¹(G_K, I(χ∘π)/pⁱ)` (TC `ContCohomology.explicitInfl1`) is bijective.
  Injectivity and exactness at `H¹(G_K, -)` are TC `explicitInfl1_injective` and
  `explicitInfRes_exact`. The third term vanishes: `R` acts trivially (`proPKernel_smul_zModTwist`),
  so `H¹(R, I(χ∘π)/pⁱ)` is the group of continuous homomorphisms `R → ℤ/pⁱ`
  (TC `H1EquivOfSmulEqSelf`), and each of them is trivial, since its kernel is an open normal
  subgroup of `R` with `p`-group quotient and `R` has none but itself
  (PPG `proPKernel_proPKernel_eq_top`). The coefficient adapter `zModTwistFixedPointsEquiv`
  identifies the `R`-invariants, which are everything, with `I(χ)/pⁱ` on `G_K(p)`; it is the
  identity of `ZMod (p^i)` and is `G_K(p)`-equivariant (`zModTwistFixedPointsEquiv_smul`), a
  coefficient adapter of the same kind as the `trivialFp` one. `explicitInfl1ZModTwist` is the
  inflation read through the adapter, bijective by the above, and it commutes with the reductions
  `I(χ)/pⁱ → I(χ)/pʲ` (`explicitInfl1_zModTwist_reduce`), because inflation is the pullback along a
  compatible pair (TC `explicitInfl1_eq_explicitMap1`) and pullbacks commute with coefficient maps
  (TC `explicitMap1_comp`). All of these are closed proofs in `Suggested.lean`.
- Prove degree-two inflation `inflH2AbsoluteGaloisProPMap` is injective from the five-term
  sequence (`inflH2AbsoluteGaloisProP_injective`). Name the transgression and exactness steps
  used; do not appeal to a generic spectral sequence without constructing the maps.
- Prove degree-two inflation is surjective in the two arithmetic cases
  (`inflH2AbsoluteGaloisProP_surjective`). When `μ_p ⊄ K`, the target vanishes. When `μ_p ⊆ K`,
  use cup compatibility and nondegeneracy to exhibit a nonzero class, then use
  one-dimensionality. The degree-two inflation isomorphism `inflH2AbsoluteGaloisProP`, in the form
  consumed by the Demushkin construction, is the inflation map made an equivalence by these two
  theorems, so it is the inflation map by construction, and the local-field structure of `K`
  enters it through the surjectivity theorem.
- Transport the `H¹` dimension, `H²` vanishing or dimension-one result, and cup
  nondegeneracy to `G_K(p)`.

*Needs:* L1; PC `infl`, `explicitIso_infl`, the five-term declarations, and `cup_infl`; PPG
`proPKernel`, `maximalProPQuotient`, `proPKernel_proPKernel_eq_top`; TC `ZModTwist`,
`ZModTwist.reduce`, `ZModTwist.isProP_multiplicative`, `ContinuousMonoidHom.quotientMk`,
`ContCohomology.explicitInfl1`, `explicitInfl1_injective`, `explicitInfRes_exact`,
`explicitInfl1_eq_explicitMap1`, `explicitMap1_comp`, `explicitRes1`, `explicitCoeff1`,
`explicitCoeff1Equiv`, `H1EquivOfSmulEqSelf`.

The degree-two proof is deliberately split into injectivity and surjectivity. A five-term
sequence supplies the first; it does not by itself supply the second.

## Layer 3: finite generation and generator ranks of `G_K(p)`

- Prove `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP` from the finite-dimensional
  `H¹` comparison and the pro-`p` Burnside basis theorem. Do not use finite generation of the
  full `G_K`; that theorem comes later.
- Prove
  `topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_mu`:
  `d(G_K(p)) = N + 2` when `μ_p ⊆ K`.
- Prove
  `topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_not_mu`:
  `d(G_K(p)) = N + 1` when `μ_p ⊄ K`.

*Needs:* L2; PPG `topologicallyGenerates_iff_frattiniQuotient`,
`topologicalGeneratorRankNat`.

## Layer 4: the Shafarevich-Demushkin dichotomy

- **Free case.** If `μ_p ⊄ K`, prove `cd_p G_K(p) <= 1` by dévissage from the degree-two
  vanishing, then apply `PPG.isFree_of_cd_p_le_one`. The marked rank statement is
  `absoluteGaloisGroupProP_iso_freeProP_of_not_mu`, an isomorphism with
  `freeProP p (Fin (N+1))`.
- **Demushkin case.** If `μ_p ⊆ K`, construct
  `isDemushkin_absoluteGaloisGroupProP_of_mu` using the supplier's exact `IsDemushkin` fields:
  pro-`p`, finite `H¹`, one-dimensional `H²`, and left and right nondegeneracy of cup.
- Recover the rank results of L3 from the two structural theorems and prove their compatibility
  with the independently computed `H¹` dimensions.

*Needs:* L2–L3; PPG `isFree_of_cd_p_le_one`, `IsDemushkin` and its finite-generation theorem;
PC cohomological-dimension reductions.

## Layer 5: roots of unity, q, and cyclotomic orientation

- Prove `demushkinQ_absoluteGaloisGroupProP`: the supplier's abstract `demushkinQ` of `G_K(p)`
  equals `localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K)`, written `q(K)` below. The
  proof identifies torsion in the topological abelianization through local reciprocity; it does
  not store the equality as input data.
- Prove `demushkinRank_absoluteGaloisGroupProP`: the supplier's `demushkinRank` is `N + 2`. This
  is the bridge that licenses substituting the arithmetic rank into the imported marked theorems.
- Prove `proPKernel_le_ker_localCyclotomicCharacter`: when `μ_p ⊆ K` the image of
  `localCyclotomicCharacter p K` is pro-`p` (for odd `p` it lies in `1 + pℤ_p`, since `G_K` fixes a
  primitive `p`-th root of unity, and `ℤ₂ˣ` is pro-`2`, TC `isProP_units_padicInt_two`), so
  `proPKernel p G_K` lies in its kernel. The character therefore descends to the named
  `cyclotomicOrientation p K hmu : G_K(p) →ₜ* ℤ_pˣ`, a continuous homomorphism defined by TC
  `ContinuousMonoidHom.quotientLift` of `continuousLocalCyclotomicCharacter`, whose roots-of-unity
  witness is an explicit argument. It is bundled because TC's `ZModTwist` and
  `HasPrescriptionProperty` take a continuous character. No unconditional descent of the full
  character is exported: for odd `p` and `K = ℚ_p`, its generally nontrivial mod-`p` component is a
  prime-to-`p` obstruction.
- Pin the descent pointwise in `cyclotomicOrientation_mk` and along `G_K → G_K(p)` in
  `cyclotomicOrientation_comp_absoluteGaloisGroupProPMk`, and prove `cyclotomicOrientation_range`,
  that orientation and character have the same image; all three are closed proofs.
- Prove `cyclotomicOrientation_hasPrescriptionProperty`, TC's `HasPrescriptionProperty` of the
  orientation, from Kummer theory and Layer 2. The cyclotomic character of `G_K` has the property by
  Kummer theory alone (`continuousLocalCyclotomicCharacter_hasPrescriptionProperty`, for any field
  in which `p` is invertible). For `i ≥ 1`, a primitive `pⁱ`-th root of unity `ζ` of the separable
  closure identifies `I(χ_cyc)/pⁱ` with `μ_{pⁱ}` as a Galois module, `x ↦ ζ^x` (M
  `cyclotomicCharacter.spec`), and `ζ^{p^{i-1}}` does the same at level `1`, so the reduction
  `I(χ_cyc)/pⁱ → I(χ_cyc)/p` becomes the `p^{i-1}`-th power map `μ_{pⁱ} → μ_p`. Through TC's Kummer
  isomorphism `kummerIsoTransport`, read on `Field.absoluteGaloisGroup K` through TC
  `absoluteGaloisGroupRestrictEquiv`, that map sends the Kummer class of `a ∈ Kˣ` computed by a root
  `α` (TC `kummerMap_eq_kummerCocycleClass`) to the Kummer class of `a` at level `p`, computed by
  the root `α^{p^{i-1}}`, and every class at level `p` is a Kummer class (TC
  `kummerMap_surjective`). So the reduction on `H¹` is onto, as `Kˣ/(Kˣ)^{pⁱ} → Kˣ/(Kˣ)^p` is. The
  orientation pulls back to `χ_cyc`, so twisted inflation at the levels `i` and `1`, bijective and
  compatible with the reduction (`explicitInfl1ZModTwist_bijective`,
  `explicitInfl1_zModTwist_reduce`), carries the surjectivity to `G_K(p)`; that last step is a
  closed proof. Local duality is not used.
- PPG's `HasPrescriptionProperty` is TC's `HasPrescriptionProperty` by reducible alias, and
  `PPG.demushkinCharacter_unique` takes a continuous character with that property, so it applies to
  the orientation and `cyclotomicOrientation_hasPrescriptionProperty` directly:
  `demushkinCharacter_absoluteGaloisGroupProP`, the equation
  `demushkinCharacter = cyclotomicOrientation p K hmu` of continuous homomorphisms, is a closed
  proof.

### The exact comparison

The marked presentation depends on four separate conventions agreeing, and the roadmap type-checks
their comparison rather than describing it. The four are Mathlib's `cyclotomicCharacter`, the
orientation `PPG.demushkinCharacter` extracted from the dualizing module, the reciprocity image of
`Kˣ` under `CFT.artinMap`, and the arithmetic-Frobenius normalization of that map. They are tied
together by exactly these declarations:

- `localCyclotomicCharacter_apply`, which pins the Galois character to Mathlib's;
- `demushkinCharacter_absoluteGaloisGroupProP`, which identifies the dualizing-module orientation
  with the descended character;
- `localCyclotomicCharacter_artinMap_unit`, a **closed proof** consuming
  `CFT.cyclotomicCharacter_artinMap`, which computes `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` for a
  unit `u`, and `localCyclotomicCharacter_artinMap_padic`, its `ℚ_p` specialization. Both are
  closed proofs so that a change of normalization in the supplier breaks this build rather than
  silently changing a relator. CFT proves `cyclotomicCharacter_artinMap` and its `ℚ_p` form in its
  Layer 11, from global reciprocity over `ℚ`, so these two theorems, and every image computation
  below that consumes them, depend on CFT Layers 10 and 11;
- `localCyclotomicCharacter_artinMap_padic_uniformizer`, the value at the uniformizer `p` of
  `ℚ_p`: `χ_cyc(Art_{ℚ_p}(p)) = 1`. Its proof is elementary once `Φ_{p^n}` is irreducible over
  `ℚ_p` (`irreducible_cyclotomic_prime_pow_ratPadic`, Layer 0): `p = N(1 − ζ_{p^n})` for every `n`
  (M `IsPrimitiveRoot.norm_sub_one_of_prime_ne_two`, `IsPrimitiveRoot.norm_sub_one_two`), so
  `Art_{ℚ_p}(p)` lies in every cyclotomic norm group, which the finite Artin map kills
  (`CFT.normResidue`, `CFT.artinMap_restrict`), and acts trivially on `μ_{p^∞}`. It consumes no
  cyclotomic normalization of the unit map, and does not depend on CFT Layers 10 and 11;
- `localCyclotomicCharacter_artinMap_uniformizer`, the value at a uniformizer `π` of `K`:
  `χ_cyc(Art_K(π)) · N_{K/ℚ_p}(π) = p^f`, with `f = f(K/ℚ_p) = LFR.inertiaDegree ℚ_[p] K`. Write
  `N_{K/ℚ_p}(π) = u · p^f` with `u ∈ ℤ_pˣ`. Norm functoriality `CFT.artinMap_norm` over `ℚ_p` makes
  the image of a lift of `Art_K(π)` under `CFT.absoluteGaloisGroupExtend` a lift of
  `Art_{ℚ_p}(u) · Art_{ℚ_p}(p)^f`, the character of `G_K` is that of `G_{ℚ_p}` read along that map
  (`localCyclotomicCharacter_absoluteGaloisGroupExtend`), and the two previous items give
  `χ_cyc(Art_K(π)) = u⁻¹`. Through `localCyclotomicCharacter_artinMap_padic` it depends on CFT
  Layers 10 and 11.

⚠ The inverse is where an error is invisible. With the geometric normalization the right-hand
sides above are `N_{K/ℚ_p}(u)` and `u`, the orientation is replaced by its inverse, and the marked
`ℚ₂` generator values become `(-1, 1, -3)` instead of `(-1, 1, (-3)⁻¹)` — a statement that still
type-checks and is still a Demushkin presentation, but of the wrong marked group.

### The image of the orientation

The even-degree dyadic branch of Layer 6 is selected by the image of the orientation, so that
image is a milestone and not a remark:

- Prove `range_localCyclotomicCharacter`: the image is the closed subgroup generated by the values
  of `χ_cyc` on the reciprocity image of `Kˣ`. This is density of the image of `CFT.artinMap`
  (`CFT.denseRange_artinMap`) together with continuity of `χ_cyc` and compactness of `G_K`.
- The generators are then computed by the two evaluation theorems above: the unit norms give
  `N_{K/ℚ_p}(𝒪[K]ˣ)`, and the uniformizer supplies the one further generator.
- ⚠ **The uniformizer value is not redundant, because `K(μ_{p^n})/K` need not be totally
  ramified.** For `p = 3` and `K = ℚ_3(√3)`, `K(μ_3) = K(√-3) = K(√-1)` is *unramified* over `K`;
  there `χ_cyc(G_K)` is all of `ℤ_3ˣ`, while the unit norms `a² - 3b²` fill only the index-two
  subgroup `1 + 3ℤ_3`. The phenomenon survives `μ_p ⊆ K`: over `K' = ℚ_3(μ_3)`, take the
  compositum of the ramified cubic `K'(ζ_9)` with the unramified cubic extension of `K'` and let
  `K` be either diagonal cubic subfield; then `K(μ_9)/K` is unramified. Any argument that computes
  the image from the unit norms alone is therefore wrong, and the acceptance examples of Layer 8
  do not detect the error because both of them are totally ramified over `ℚ₂`.
- The verification of the arithmetic in the two dyadic acceptance examples uses only the unit
  norms plus the uniformizer value: for `ℚ₂` the norm is the identity and the image is `ℤ₂ˣ`, which
  `range_localCyclotomicCharacter_ratPadic` also gives without reciprocity; for
  `ℚ₂(√-2)` the uniformizer `√-2` has norm `2`, contributing `χ = 1`, and the unit norms
  `a² + 2b²` with `a` odd are exactly the classes `1, 3 mod 8`, so the image is
  `closure⟨3⟩ = U^[2]`.

*Needs:* L0–L4; CFT `artinMap`, `denseRange_artinMap`, `artinMap_restrict`, `artinMap_norm`,
`absoluteGaloisGroupExtend`, `normResidue`, `cyclotomicCharacter_artinMap`,
`cyclotomicCharacter_artinMap_padic`; LFR `normGroup`, `unitFiltration`, `inertiaDegree`; M
`IsPrimitiveRoot.norm_sub_one_of_prime_ne_two`, `IsPrimitiveRoot.norm_sub_one_two`,
`cyclotomicCharacter.spec`; PPG `demushkinQ`, `demushkinRank`, `demushkinCharacter`,
`demushkinCharacter_unique`; TC `ContinuousMonoidHom.quotientLift`, `HasPrescriptionProperty`,
`hasPrescriptionProperty_iff`, `kummerIsoTransport`, `kummerMap_surjective`,
`kummerMap_eq_kummerCocycleClass`, `absoluteGaloisGroupRestrictEquiv`,
`isProP_units_padicInt_two`.

The orientation proof must keep two directions distinct: the quotient map is composed with the
descended character to recover `χ_cyc` on `G_K`, while a marked isomorphism to a presented group
pulls the standard orientation back to `G_K(p)`.

## Layer 6: arithmetic marked presentations

Apply the supplier's marked classification only after L5 has computed `q`, rank, and the
orientation image.

### The branch predicates

The cases are **Lean predicates on the arithmetic of `K`**, not rows of a table, so that
disjointness and exhaustiveness are theorems:

| Predicate | Definition |
|---|---|
| `IsFreeCase p K` | `¬ ∃ ζ : K, IsPrimitiveRoot ζ p` |
| `IsQNeTwoCase p K` | `μ_p ⊆ K` and `q(K) ≠ 2` |
| `IsDyadicOddCase K` | `q(K) = 2` and `Odd N` |
| `IsDyadicEvenPlusMinusCase K` | `q(K) = 2`, `Even N`, and `-1 ∈ Im χ` |
| `IsDyadicEvenPrincipalCase K` | `q(K) = 2`, `Even N`, and `-1 ∉ Im χ` |

- Prove `dyadic_markedCase_exists_unique`: at `p = 2` the free case never occurs, and exactly one
  of the four remaining predicates holds. Prove `odd_markedCase_exists_unique`: at odd `p` exactly
  one of `IsFreeCase` and `IsQNeTwoCase` holds, `q = 2` being impossible because `q` is a power of
  `p` (`prime_eq_two_of_localRootOfUnityOrder_eq_two`).
- `q(K) = 2` implies `p = 2` (`prime_eq_two_of_localRootOfUnityOrder_eq_two`); the converse is
  false — `K = ℚ₂(i)` has `p = 2` and `q(K) = 4` — and is not claimed. At `p = 2` the dyadic
  criterion is separate: `q(K) = 2 ↔ μ₄ ⊄ K`, the negation of `localRootOfUnityOrder_ne_two_iff`,
  which says `q(K) ≠ 2 ↔ μ₄ ⊆ K`. Both are theorems of L0, so no branch is selected by an
  unrecorded convention.
- ⚠ The two even branches share `q`, the rank and the relator shape. `-1 ∈ Im χ` is what separates
  them: `U^[f] = closure⟨-1 + 2^f⟩` is torsion-free, while `{±1} × U^(f)` contains `-1`. Selecting
  a branch from `q` alone is not possible, and the `ℚ₂(√-2)` example of L8 exists to detect the
  loss of `U^[f]`.

### The marked theorems

- `absoluteGaloisGroupProP_marked_of_q_ne_two`, under `IsQNeTwoCase`: the marked normal form
  `x₁^q(x₁,x₂)(x₃,x₄)...` on `N+2` generators, with the supplier's character values recorded,
  not just an unmarked isomorphism.
- `range_localCyclotomicCharacter_of_degree_odd`, under `IsDyadicOddCase`: the cyclotomic image is
  all of `ℤ₂ˣ`, hence the parameter is `f=2`; then
  `absoluteGaloisGroupProP_two_marked_of_degree_odd` gives `x₁²x₂⁴(x₂,x₃)(x₄,x₅)...`. The image is
  everything because `χ(G_K) ⊆ χ(G_{ℚ₂}) = ℤ₂ˣ` (`range_localCyclotomicCharacter_ratPadic` at
  `p = 2`) has index dividing `N` (`range_localCyclotomicCharacter_le_ratPadic`), and it is a
  closed subgroup of finite index, hence open, in the pro-`2` group `ℤ₂ˣ`
  (TC `isProP_units_padicInt_two`); so that index is a power of `2` dividing an odd number, hence
  `1`. The equality `χ(G_{ℚ₂}) = ℤ₂ˣ` is an input of this theorem, not a consequence of
  `q(K) = 2`. Conversely the full image forces `q(K) = 2`, since `i ∈ K` would put `χ(G_K)` inside
  `1 + 4ℤ₂`, so at odd `N` the case hypothesis carries no information beyond the parity.
- `range_localCyclotomicCharacter_of_degree_even_plusMinus` and
  `range_localCyclotomicCharacter_of_degree_even_principal` compute the image as
  `PPG.unitsPlusMinus f` and as `PPG.procyclicClosure u` with `(u : ℤ₂) = -1 + 2^k`
  respectively. The branch is selected from the image, never from `q`.
- The two **marked** even theorems take the image equation as a hypothesis, so that the
  supplier's parameters are pinned by the arithmetic and not re-chosen, and record the supplier's
  generator values under the isomorphism, as the odd theorem does:
  - `absoluteGaloisGroupProP_two_marked_of_degree_even_plusMinus`, under
    `IsDyadicEvenPlusMinusCase` and `Im χ = {±1} × U^(f)`: the relator is the supplier's even word
    at `a = 0`, `x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, with `χ(x₂) = -1`, `χ(x₄)(1 - 2^f) = 1` and `χ = 1`
    on the other generators.
  - `absoluteGaloisGroupProP_two_marked_of_degree_even_principal`, under
    `IsDyadicEvenPrincipalCase` and `Im χ = U^[k] = closure⟨-1 + 2^k⟩`: the relator is the
    supplier's even word at `a = 2^k` and any `f > k`, `x₁^{2+2^k}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, with
    `χ(x₂)(1 + 2^k) = -1`, `χ(x₄)(1 - 2^f) = 1` and `χ = 1` elsewhere. The equation on `x₂` is
    solvable in `U^[k]` exactly when `v₂(a) = k`, which is what pins `a`; ⚠ `f` is **not** an
    invariant in this branch, since `(1 - 2^f)⁻¹ ∈ U^(f) ⊆ U^[k]` for every `f > k`, and the
    presented groups for the different `f > k` are pairwise isomorphic by Labute's classification,
    all of them Labute's `x₁^{2+2^k}(x₁,x₂)(x₃,x₄)⋯`, the value `f = ∞` that the supplier's word
    cannot spell with a natural number.
- The local even-degree rank is `N+2 ≥ 4`, since `N` is even and positive, so the fourth marked
  generator whose value both theorems record exists; the supplier's abstract even theorem states
  that value only for rank at least `4`, because its rank-two family `⟨x₁,x₂ ∣ x₁^{2+α}(x₁,x₂)⟩`
  has no fourth generator, and the supplier contract cites it in that form.
- `absoluteGaloisGroupProP_two_of_degree_even`, the unmarked statement — some supplier even word
  with `f ≥ 2`, `4 ∣ a` presents `G_K(2)` — is a corollary of the two marked theorems and the two
  image computations, with a closed proof. It carries no orientation data and does not discharge
  the marked milestone.
- Prove functoriality of each marked result under an isomorphism of local fields over `ℚ_p` and
  compatibility with finite extensions.

Each of these theorems is the corresponding supplier theorem — `isDemushkin_marked_of_q_ne_two`,
`isDemushkin_marked_of_q_two_odd`, `isDemushkin_marked_of_q_two_even` — after the L5 computations
`demushkinRank = N+2`, `demushkinQ = q(K)` and `demushkinCharacter = χ_cyc` have been substituted.
Its proof rewrites along those three equations and applies the supplier; it does not reprove a
presentation.

*Needs:* L5; L0 `range_localCyclotomicCharacter_ratPadic`,
`range_localCyclotomicCharacter_le_ratPadic`; PPG three marked classification theorems, their
relator words, `unitsPlusMinus` and `procyclicClosure`; LFR unit filtration; CFT cyclotomic
normalization, through the image computations of L5, which depend on CFT Layers 10 and 11; TC
`isProP_units_padicInt_two`.

## Layer 7: exact rank of the full absolute Galois group

This layer proves topological finite generation before computing the exact rank. Strict
cohomological dimension enters only once, and only at `G_K`: in
`contCohomologyClass_absoluteGaloisGroup_generates` of Step 3, NSW (3.6.4)(iii) for `G = G_K` and
`V = G_L`, whose input is `scd_p(G_K) ≤ 2` at the residue prime `p`, in PC's convention `scd_p`,
which is TC's `strictCohomologicalDimensionAt` (`CFT.scd_p_absoluteGaloisGroup_eq_two`).
Conventions for strict cohomological dimension differ, and no statement in another convention is
an input. The lift of Step 5 is the extension dictionary, not (3.6.4), and no statement about the
strict cohomological dimension of a free profinite group is used.

⚠ **A rational identity is not an integral bound.** The reciprocity-side computation of this layer
produces `A(L) ⊗ ℚ_p ≃ ℚ_p[Gal(L/K)]^N ⊕ ℚ_p`. That equality of `ℚ_p[G]`-modules cannot by itself
determine a minimal number of *integral* topological generators: two finitely generated
`ℤ_p[G]`-modules with isomorphic rationalizations need not be isomorphic, and the number of
generators is not a rational invariant. The chain below is the integral one, in six named steps.

- **Degree-one counts at every prime.** Compute
  `dim_{𝔽_ℓ} H¹(G_K,𝔽_ℓ)` for every prime `ℓ`: it is
  `N+1+dim H⁰(G_K,μ_p)` at `ℓ=p` and at most `2` for `ℓ!=p`. These counts feed the generation
  argument but do not prove it alone. The profinite group `∏_ℕ A₅` has trivial degree-one
  cohomology at every prime and is not topologically finitely generated.
  *Needs:* L1; CFT Kummer and duality; LFR power classes.

### Step 1: the integral lattice

- Define the tower `padicCompletionTransition` and the completed multiplicative module
  `padicCompletionUnits p L`, that is `A(L) = lim_m Lˣ/(Lˣ)^(p^m)`, as the subgroup of the product
  of the finite levels cut out by the transition maps, together with the canonical map
  `padicCompletionUnitsOf : Lˣ → A(L)`. This carrier is **data**: a `sorry`-bodied definition
  would make every statement below untypeable.
- Give `A(L)` its `ℤ_p`-module structure (`padicCompletionUnitsPadicModule`, with
  `padicCompletionUnits_natCast_smul` pinning it to the intrinsic `ℕ`-action), the Galois action
  `padicCompletionUnitsAut` with its defining equation `padicCompletionUnitsAut_of` on the image of
  `Lˣ`, and the resulting `ℤ_p[Gal(L/K)]`-module structure
  `padicCompletionUnitsModule`, pinned on group elements by `padicCompletionUnits_single_smul`.
- Prove `padicCompletionUnits_module_finite`: `A(L)` is a finitely generated
  `ℤ_p[Gal(L/K)]`-module. Every cancellation theorem of Step 3 has this as a hypothesis and none
  of them holds without it.
- Prove `A(L) ≃ G_L^ab(p)` through local reciprocity. Here `G_L` is the open normal subgroup `V`
  of `G_K` fixing `L` (along a `K`-embedding of `L` into `Kˢ`, TC `galoisSubgroup`) and
  `G_L^ab(p)` is PC's `abelianizationProP p G_K V`, and the identification is equivariant for
  `Gal(L/K) ≅ G_K ⧸ V`, acting on `A(L)` by `padicCompletionUnitsAut` and on `V^ab(p)` by PC's
  conjugation action (`CFT.artinMap_conj`). This identification is a theorem, not the definition of
  the carrier; the class-module statements of Steps 3 and 5 are read through it.
  *Needs:* CFT local existence/reciprocity, `artinMap_conj`; PC `abelianizationProP` (the
  class-module row); TC `galoisSubgroup`.

### Step 2: control of the torsion

- Prove `torsion_padicCompletionUnits`: the torsion subgroup of `A(L)` is exactly the image of
  `pPowerRootsOfUnity p L`, and `card_torsion_padicCompletionUnits`: it is finite of order `q(L)`.
- Prove `mem_torsion_padicCompletionUnits_iff`: Mathlib's `Submodule.torsion ℤ_[p]` of `A(L)` is
  the additive form of that group torsion. `A(L)` is pro-`p`, so being killed by a nonzero `p`-adic
  integer is having finite order. This is the submodule the free quotient is taken by.
- Prove `padicCompletionUnits_quotient_torsion_linearEquiv`: modulo its `ℤ_p`-torsion, `A(L)` is
  `ℤ_p`-free of rank `[L:ℚ_p]+1`, the `[L:ℚ_p]` from the principal units and the `1` from the
  valuation. It is stated as a `ℤ_p`-linear isomorphism with `ℤ_p^{[L:ℚ_p]+1}`: an additive
  isomorphism would not see the `ℤ_p`-structure and would not say the quotient is free, and a
  `finrank` equation would be `0` on a module that is not finite free and would hide exactly the
  failure the statement excludes.
- The decomposition of this layer is algebraic at every finite layer. No topology on `A(L)` or on
  its free quotient is consumed anywhere in Steps 3-5; the only topological statement about `A(L)`
  is its reciprocity identification with `G_L^{ab}(p)` in Step 1, and the topology of `G_K` enters
  only through the compactness argument of Step 5.
- ⚠ Without this step the phrase "the rank of `A(L)`" has no content: `A(L)` has a finite cyclic
  summand precisely when `μ_p ⊆ L`, and that summand is the one carrying `q`.
  *Needs:* LFR deep units and unit filtration; L0 roots-of-unity theory.

### Step 3: the Tate module of a tame layer and its integral decomposition

This step is the proof of NSW (7.4.1), with each object named. Throughout, `L/K` is a finite
Galois layer with group `G = Gal(L/K)`, and `N = [K:ℚ_p]`. From the rational decomposition
onwards that is a **Lean hypothesis**, bound once in `section FiniteGaloisLayer` of
`Suggested.lean` as `[IsScalarTower ℚ_[p] K L] [IsGalois K L] [FiniteDimensional K L]` — the
tower makes `[L:ℚ_p] = [K:ℚ_p]·[L:K]`, and the Galois hypotheses make `L ≃ₐ[K] L` the group
`Gal(L/K)` of order `[L:K]` — and not a reading convention. ⚠ Finiteness of `L ≃ₐ[K] L` is not a
substitute for `L/K` Galois: for the non-Galois cubic `ℚ₅(∛5)/ℚ₅` the automorphism group is
trivial, and the rational decomposition would assert an isomorphism between `ℚ₅`-vector spaces of
dimensions `[L:ℚ₅]+1 = 4` and `N·#Aut_K(L)+1 = 2`. Rationalization is `M ⊗[ℤ_p] ℚ_p` with
Mathlib's left-factor `ℤ_p[G]`-structure; a `ℤ_p[G]`-linear isomorphism between `ℚ_p`-vector
spaces is automatically `ℚ_p[G]`-linear, so no second module structure is installed on the
rationalization.

- **The group-algebra objects.** The augmentation ideal `augmentationIdeal p G` is the kernel of
  TC's augmentation `MonoidAlgebra.augmentation ℤ_[p] G`, `g ↦ 1`, and TC's
  `MonoidAlgebra.ker_augmentation_eq_span` gives its generators `g - 1`
  (`augmentationIdeal_eq_span`, a closed proof); TC's `Rep.augmentationIdeal` is the same kernel as
  an object of the representation category, and this roadmap uses it as a left ideal of `ℤ_p[G]`.
  Define `relationModule p G g` for a family `g : Fin n → G`, the kernel of `ℤ_p[G]^n → ℤ_p[G]`,
  `e_i ↦ g_i - 1`, which is `R^ab(p)` for the presentation of `G` on the `g_i` by Lyndon's theorem
  (NSW (5.6.6)), the milestone `relationModule_linearEquiv_abelianizationProP` below, with
  `range_linearCombination_eq_augmentationIdeal` supplying the other half of the
  exact sequence `0 → R^ab(p) → ℤ_p[G]^n → I_G → 0` when the `g_i` generate; and the
  **tame-frame module** `tameFrameModule p G σ τ a b`, that is
  `M₀ = ℤ_p[G]²/ℤ_p[G]·(σ - a, τ - b)`, for two elements `σ, τ` and two exponents `a, b`.
- **The rational decomposition** `padicCompletionUnits_tensor_ratPadic`:
  `A(L)⊗ℚ_p ≃ ℚ_p[G]^N ⊕ ℚ_p`, from the `p`-adic logarithm on the deep units and the normal
  basis theorem (NSW (7.4.4)(i)), stated as a `ℤ_p[G]`-linear isomorphism against the rationalized
  `ℤ_p[G]/I_G`, over the finite Galois layer of the section. The normal basis theorem is where
  `L/K` Galois is consumed and the dimension count `N·[L:K]+1 = [L:ℚ_p]+1` is where the tower is.
  A `ℚ_p`-linear statement would be a dimension count and would carry none of the
  representation-theoretic content the decomposition acts on.
  *Needs:* LFR deep units and ramification; M normal basis; CFT reciprocity.
- **Rejection test for the Galois hypothesis** `not_nonempty_tensor_ratPadic_of_card_lt`: over a
  finite layer of `p`-adic fields with `#Aut_K(L) < [L:K]`, the decomposition is false, by the
  dimension count `[L:ℚ_p]+1` (Step 2) against `N·#Aut_K(L)+1`. Its instance is the non-Galois
  cubic: `NonGaloisCubic = AdjoinRoot (X³ - 5)` over `ℚ₅`, with `finrank_nonGaloisCubic` (a closed
  proof, degree `3`), `nonGaloisCubic_card_algEquiv_lt` (trivial automorphism group),
  `not_isGalois_nonGaloisCubic`, and `not_nonempty_tensor_ratPadic_nonGaloisCubic`, a closed proof
  applying the abstract test to the instance. The same hypotheses propagate to
  `nonempty_tateModule`, `tateModule_linearEquiv` and `exists_relationModule_surjective`, which
  consume the decomposition; ⚠ on the cubic a `TateModule` exists — `G` is trivial, `I_G = 0` and
  `A(L)` has projective dimension one over `ℤ₅` — so the decomposition theorem is false there
  too, not merely vacuous.
- **The compatibility of the two module structures** `padicCompletionUnits_isScalarTower`: the
  `ℤ_p`-structure of `A(L)` is the restriction of the `ℤ_p[G]`-structure. Without it the torsion of
  Step 2 cannot be read inside the group-algebra module and the rationalization carries no
  `ℤ_p[G]`-structure.
- **Coinvariants under the finite quotient.** The norm kills the augmentation ideal, so it factors
  through the coinvariants: `padicCompletionUnitsOf_norm_algEquiv` states
  `N_{L/K}(σ x) = N_{L/K}(x)` in `A(K)`. The other half of the step is that the cokernel of the
  norm is exactly the pro-`p` abelianized Galois group, which is the `p`-completion of
  `CFT.normResidue : Kˣ ⧸ N(Lˣ) ≃* Gal(L/K)^ab`; no second norm group is introduced, `LFR.normGroup`
  is the one used.
- **Sharp exponents** `exists_tameFrame_exponents`: for a **generating pair** `σ, τ` of `G`
  (`Subgroup.closure {σ, τ} = ⊤`) with `τ` of order prime to `p`, there are natural numbers `a, b`
  through which `σ, τ` act on `μ_{p^∞}(L)` such that the left ideal `J = (σ - a, τ - b)` of
  `ℤ_p[G]` is the annihilator of `μ_{p^∞}(L)` itself, the kernel of the ring map
  `ℤ_p[G] → ℤ/q(L) = End(μ_{p^∞}(L))` through which `G` acts. Both halves are pinned in the
  statement: the quotient `ℤ_p[G]/J` has order `q(L)`, and it is isomorphic as a left
  `ℤ_p[G]`-module to the `p`-power torsion of `A(L)`, which is `μ_{p^∞}(L)` with its Galois
  action (Step 2). This is the exact sequence `(∗)` in the proof of NSW (7.4.1).
  - ⚠ Dual convention: with the contragredient action `(gφ)(ζ) = φ(g⁻¹ζ)` on the Pontryagin dual,
    the annihilator of `μ_{p^∞}(L)^∨` is `(σ - a⁻¹, τ - b⁻¹)`, not `J`. The dual appears in the
    torsion statement below, where `E¹(M₀) = μ_{p^∞}(L)^∨` with `σ, τ` acting through
    `a⁻¹, b⁻¹`, and not here.
  - ⚠ Generation is load-bearing. When `σ, τ` generate, `ℤ_p[G]/J` is cyclic over `ℤ_p`,
    equal to `ℤ_p/(χ(r) - 1 : r ∈ R)` for the character `x ↦ a, y ↦ b` of the free group on two
    letters and `R` the relations of `G`; it maps onto `ℤ/q(L)` because `a, b` lift the action,
    and moving `b` by a multiple of `q(L)` along `τ^{orderOf τ} = 1` — possible because
    `p ∤ orderOf τ` — makes `v_p(b^{orderOf τ} - 1)` exactly `v_p(q(L))`. When `σ, τ` generate a
    proper subgroup `H`, the quotient is `(ℤ_p[H]/J_H)^{[G:H]}`, of order at least
    `q(L)^{[G:H]} > q(L)` whenever `q(L) > 1`, and no exponents are sharp.
  - ⚠ Not every lift works: `a = b = 1` gives `ℤ_p[G]/I_G ≅ ℤ_p`, infinite, whose `Nat.card` is
    `0`, and a tame-frame module with the wrong torsion.
- **Rejection test for the generating hypothesis** `not_exists_tameFrame_exponents_one_one`: at
  `p = 2`, on any layer with `q(L) = 2` and a nontrivial automorphism group, the identity pair
  `σ = τ = 1` — which satisfies `¬ 2 ∣ orderOf τ` — admits no sharp exponents: `-1 ∈ μ_{2^∞}(L)`
  forces `a, b` odd, so `(1 - a, 1 - b) ⊆ 2ℤ₂[G]` and the quotient maps onto `𝔽₂[G]`, of order
  `2^{#G} ≥ 4` or infinite. Its instance is the unramified quadratic extension
  `UnramifiedQuadratic = AdjoinRoot (X² + X + 1)` over `ℚ₂`, with
  `localRootOfUnityOrder_two_unramifiedQuadratic`, `nontrivial_algEquiv_unramifiedQuadratic`, and
  `not_exists_tameFrame_exponents_one_one_unramifiedQuadratic`, a closed proof applying the
  abstract test to the instance.
- **The tame-frame module** under the sharpness condition:
  `tameFrameModule_tensorRat_linearEquiv`, `M₀ ⊗ ℚ_p ≃ ℚ_p[G]`, because `1 ↦ (σ - a, τ - b)` is
  injective; and `tameFrameModule_torsion_linearEquiv`, the `p`-power torsion of `M₀` is
  `μ_{p^∞}(L)` as a `ℤ_p[G]`-module, the same module as the torsion of `A(L)`. The second is the
  arithmetic input of the comparison below: `E¹(M₀) = μ_{p^∞}(L)^∨` with `σ, τ` acting through
  `a⁻¹, b⁻¹`, which is NSW's `M₀ ≃ D(μ_{p^∞}(L)^∨)`.
- **The Tate module** `TateModule p L K`: a finitely generated `ℤ_p[G]`-module `Y` of projective
  dimension at most one, an extension `0 → A(L) → Y → I_G → 0` of the augmentation ideal by
  `A(L)`. This is NSW's `Y = I_{G_K}/I_{G_L} I_{G_K}` ((5.6.5)); projective dimension at most one
  is cohomological triviality, which is Tate's theorem for the fundamental class of the layer
  carried to `A(L)` along the reciprocity identification of Step 1. Prove `nonempty_tateModule`.
  *Needs:* CFT `ClassFormation` (Tau Ceti's, re-exported), `tateTheorem`; TC
  `ClassFieldTheory.ClassFormation.fundamentalClass`,
  `ClassFieldTheory.ClassFormation.fundamentalClass_generates`; NSW (3.1.5); Step 1.
- **The integral decomposition** `tateModule_linearEquiv`: `Y ≃ M₀ ⊕ ℤ_p[G]^N` as
  `ℤ_p[G]`-modules, the isomorphism `(∗∗)` in the proof of NSW (7.4.1). This is the theorem the
  cancellation lemmas are applied to: `exists_projective_prod_linearEquiv_of_torsion` gives
  `Y ⊕ P ≃ M₀ ⊕ Q` with `P, Q` projective, because both modules have projective dimension at most
  one and `p`-power torsion `μ_{p^∞}(L)`; the rational decomposition,
  `tameFrameModule_tensorRat_linearEquiv` and `I_G ⊗ ℚ_p ⊕ ℚ_p ≃ ℚ_p[G]` give
  `Y ⊗ ℚ_p ≃ (M₀ ⊕ ℤ_p[G]^N) ⊗ ℚ_p`; and `linearEquiv_prod_free_of_stable` concludes. It is an
  integral statement about `A(L)`: `Y` is generated by `N+2` elements because `M₀` is a quotient
  of `ℤ_p[G]²`, and no such count is visible rationally.
- **The relation module is independent of the generating family**
  `relationModule_linearEquiv_of_closure`: two generating families of the same size have
  `ℤ_p[G]`-isomorphic relation modules, by Schanuel's lemma on Lyndon's sequence and Krull–Schmidt
  cancellation of the free summand. This is what lets the two surjection theorems quantify over
  every generating family while constructing `β` for one.
- **The relation-module surjection on a tame layer**
  `exists_relationModule_surjective_of_tameFrame`: on a layer with a generating tame frame
  `σ, τ` — a generating pair with `p ∤ orderOf τ`, which `exists_tameFrame_quotient` supplies on
  the layers through which wild inertia dies — and for every generating family `g` of `G` of size
  `N+2`, `R^ab_{N+2}(p) = relationModule p G g` surjects `G`-equivariantly onto `A(L)` with kernel
  free of rank one. It is derived from `tateModule_linearEquiv` at the frame:
  `ℤ_p[G]^{N+2} = ℤ_p[G]² ⊕ ℤ_p[G]^N` maps onto `Y ≃ M₀ ⊕ ℤ_p[G]^N` over `I_G` with kernel
  `ℤ_p[G]`, and restricting to the kernels of the two maps to `I_G` gives `β`. This is the first
  half of the proof of NSW (7.4.1), and it is the **only** relation-module input of Step 5.
  - ⚠ The route needs the two-element frame and does not cover an arbitrary finite Galois layer:
    for `p = 3`, `K = ℚ₃(μ₃)`, and the layer with group `(ℤ/3)³` cut out by the elementary
    abelian quotient of `G_K(3)` (generator rank `4` by L3), no pair generates, every prime-to-`3`
    element is the identity, and with `q(L) > 1` no pair of lifts is sharp. The unrestricted
    statement is Step 7 below, after the rank theorem it is derived from.
- **Lyndon's theorem for the relation module** `relationModule_linearEquiv_abelianizationProP`.
  For a finite group `G` and a generating family `g : Fin n → G`, let `F_n` be TC's free profinite
  group on `n` generators and `R` the kernel of `presentationHom G g : F_n → G`, the continuous
  homomorphism sending the generators to the `g_i` (TC `freeProfiniteGroup.lift`). Then `R^ab(p)`,
  which is PC's `abelianizationProP p F_n R` with PC's conjugation action of `F_n ⧸ R = G`, is
  isomorphic to `relationModule p G g` by an additive isomorphism equivariant for the two actions
  of `G`: NSW (5.6.5) for `1 → R → F_n → G → 1` gives (5.6.6), and the isomorphism sends the class
  of `r ∈ R` to its vector of Fox derivatives, read in `ℤ_p[G]`. Additive and equivariant is
  `ℤ_p[G]`-linear here, since an additive map between finitely generated `ℤ_p`-modules carries
  `p^k M` into `p^k N` and is therefore `ℤ_p`-linear. This theorem is what lets a module map out of
  `relationModule` act on the kernel of the extension `F_n ⧸ ⁅R, R⁆R(p) → G`; without it the
  description of `relationModule` above is a definition and nothing more.
  *Needs:* TC `freeProfiniteGroup`, `freeProfiniteGroup.lift`; PC `abelianizationProP` with its
  conjugation action (the class-module row); `range_linearCombination_eq_augmentationIdeal`.
- **The class of the arithmetic extension generates**
  `contCohomologyClass_absoluteGaloisGroup_generates`. For an open normal subgroup `V` of `G_K`,
  the class `u_{G_K/V}(p)` (PC `abelianizationProPClass`, built on `abelianizationProPFactorSet`)
  of the extension `1 → V^ab(p) → G_K ⧸ ⁅V, V⁆V(p) → G_K ⧸ V → 1` generates
  `H²(G_K ⧸ V, V^ab(p))`, which is cyclic of order the `p`-part of `#(G_K ⧸ V)`. At `V = G_L`, read
  through Step 1, this says that the class of `1 → G_L^ab(p) → G_K/⁅G_L, G_L⁆G_L(p) → Gal(L/K) → 1`
  generates `H²(Gal(L/K), A(L))`. It is NSW (3.6.4)(iii) at `G = G_K`: PC's
  `abelianizationProPClass_generates` at `G = G_K`, whose hypothesis `PC.scd_p p G_K ≤ 2` is
  `CFT.scd_p_absoluteGaloisGroup_eq_two` at `ℓ = p`, a statement about the same invariant.
  `Suggested.lean` records it as a closed proof. This is the one place strict cohomological
  dimension enters this roadmap.
  *Needs:* PC `abelianizationProP`, `abelianizationProPFactorSet`, `abelianizationProPClass`,
  `abelianizationProPClass_generates` (the class-module row), `scd_p`; CFT
  `scd_p_absoluteGaloisGroup_eq_two`; Step 1.
- **The `H²`-compatibility of `β`**, for the tame-frame `β`. Prove that `β` induces an
  isomorphism `H²(G, R^ab_{N+2}(p)) ≃ H²(G, A(L))`, both cyclic of order the `p`-part of `#G`;
  this is what Step 5a uses to lift `β` to a homomorphism of group extensions. `β` is surjective
  with kernel `ℤ_p[G]` (`exists_relationModule_surjective_of_tameFrame`), and `ℤ_p[G]` is induced,
  so `Hⁱ(G, ℤ_p[G]) = 0` for `i ≥ 1` (Shapiro's lemma, M `groupCohomology.coindIso`); the long
  exact sequence of `0 → ℤ_p[G] → R^ab(p) → A(L) → 0` (M `groupCohomology.mapShortComplex₂_exact`,
  `mapShortComplex₃_exact`) makes `β` an isomorphism on `H¹` and `H²`. Both groups are cyclic of the
  stated order by the previous item, read through Step 1. The cohomology is that of the finite
  group `G`, on which every cochain is continuous, so PC's explicit `H²`, in which the class module
  is stated, is Mathlib's group cohomology there (TC `ContCohomology.explicitH2IsoGroupCohomology`);
  `R^ab(p)` is read through Lyndon's theorem.
  *Needs:* PC explicit `H²` (the class-module row); Step 3
  `relationModule_linearEquiv_abelianizationProP`, `exists_relationModule_surjective_of_tameFrame`,
  `contCohomologyClass_absoluteGaloisGroup_generates`; M `groupCohomology.coindIso`,
  `groupCohomology.mapShortComplex₂_exact`, `groupCohomology.mapShortComplex₃_exact`; TC
  `ContCohomology.explicitH2IsoGroupCohomology`.

The integral cancellation library over `ℤ_p[G]`, for a finite group `G`, is owned here; no
supplier in the dependency list has integral representation theory over a complete discrete
valuation ring, and the `RepresentationTheory` roadmap's Krull-Schmidt is for quiver
representations over a field, which is a different theorem. TC's module-theoretic Krull–Schmidt
theorem in Azumaya's form is consumed, not restated, by the first item below.

- **Krull-Schmidt cancellation** `linearEquiv_of_prod_linearEquiv`: finitely generated
  `ℤ_p[G]`-modules cancel (NSW (5.6.10)(i)). The exchange argument is TC's Krull–Schmidt theorem
  in Azumaya's form, `exists_equiv_linearEquiv_of_isLocalRing_end`, which needs local endomorphism
  rings on one side only; the input particular to `ℤ_p[G]` is that a finitely generated
  indecomposable `ℤ_p[G]`-module has a local endomorphism ring, a finite `ℤ_p`-algebra with no
  nontrivial idempotents over the complete local ring `ℤ_p`. ⚠ The corresponding statement over
  `ℤ[G]` fails in general — Swan's stably free, non-free modules over integral group rings of
  generalized quaternion groups — so completeness of `ℤ_p` is doing real work and the theorem may
  not be weakened to a general Dedekind base.
- **Detection of projectives rationally** `linearEquiv_of_projective_of_tensorRat`: two finitely
  generated projective `ℤ_p[G]`-modules with isomorphic rationalizations are isomorphic
  (NSW (5.6.10)(ii), Swan). This is the lemma that upgrades a rational identity to an integral
  one.
- **Detection of projectives modulo `p`** `linearEquiv_of_projective_of_reduction`: two finitely
  generated projective `ℤ_p[G]`-modules with isomorphic reductions modulo `p` are isomorphic
  (NSW (5.6.10)(iii)), the companion of the rational detection.
- **From a stable isomorphism to an isomorphism** `linearEquiv_prod_free_of_stable`
  (NSW (5.6.11), finite-group form): `M ⊕ P ≃ N ⊕ Q` with `P, Q` projective and
  `M ⊗ ℚ_p ≃ (N ⊕ ℤ_p[G]^m) ⊗ ℚ_p` give `M ≃ N ⊕ ℤ_p[G]^m`, by cancellation rationally, the
  rational detection to identify `Q ≃ P ⊕ ℤ_p[G]^m`, and cancellation integrally.
- **The stable class of a module of projective dimension one is its torsion**
  `exists_projective_prod_linearEquiv_of_torsion` (NSW (5.4.11) with (5.6.9)): for finitely
  generated `ℤ_p[G]`-modules presented as a free module modulo a projective kernel,
  `E¹(M) = Ext¹_{ℤ_p[G]}(M, ℤ_p[G])` is the Pontryagin dual of the `p`-power torsion of `M`, and on
  such modules `E¹` is the transpose `D`, a duality on the homotopy category; so isomorphic
  `p`-power torsion submodules give `M ⊕ P ≃ N ⊕ Q` with `P, Q` finitely generated projective.

The chain of Step 3 consumes `exists_projective_prod_linearEquiv_of_torsion` and
`linearEquiv_prod_free_of_stable`; the latter is proved from `linearEquiv_of_prod_linearEquiv`
and `linearEquiv_of_projective_of_tensorRat`. The mod-`p` detection is part of the same library.

### Step 4: the tame frame and the relative Frattini reduction

- **The tame frame.** The frame is LFR's: an arithmetic Frobenius lift `σ`
  (`LFR.exists_isArithFrobeniusLift`) and a tame generator `τ`, whose class topologically generates
  tame inertia and which lies in inertia (`LFR.exists_topologicalClosure_zpowers_eq_tameInertia`).
  The marked isomorphism `LFR.tameQuotientEquiv K σ τ hσ hτ` carries their classes to the
  generators `LFR.iwasawaSigma`, `LFR.iwasawaTau` of the Iwasawa group
  (`LFR.tameQuotientEquiv_mk_frobenius`, `LFR.tameQuotientEquiv_mk_tameGenerator`), which generate
  it topologically because the free generators do (TC `freeProfiniteGroup.dense_closure_range_of`).
  Prove from this `isTopologicallyFinitelyGenerated_tameQuotient` and
  `topologicalGeneratorRankNat_tameQuotient_le_two`. This is the `2` of `N+2`. No second Iwasawa
  presentation is written here.
- **The frame on a finite tame layer** `exists_tameFrame_quotient`: every finite quotient `G_K/U`
  through which wild inertia dies is generated by the images `σ, τ` of the frame, and `τ`, the image
  of the tame inertia generator, has order prime to `p`: the classes of `σ, τ` generate `G_K/P_K`
  through `LFR.tameQuotientEquiv`, hence every finite quotient of it, and the class of `τ` lies in
  tame inertia, whose finite quotients have order prime to `p` (`LFR.tameInertiaEquiv`). These are
  the `σ, τ` and the hypothesis `¬ p ∣ orderOf τ` that `exists_tameFrame_exponents` consumes at the
  layer `L = fixed field of P_K U`, under the identification of `Gal(L/K)` with `G_K/(P_K U)`
  through `IntermediateField.fixedField` and `IntermediateField.restrictNormalHom_ker`.
  *Needs:* LFR `IsArithFrobeniusLift`, `exists_isArithFrobeniusLift`,
  `exists_topologicalClosure_zpowers_eq_tameInertia`, `tameInertia`, `tameInertiaEquiv`,
  `IwasawaGroup`, `iwasawaSigma`, `iwasawaTau`, `tameQuotientEquiv`,
  `tameQuotientEquiv_mk_frobenius`, `tameQuotientEquiv_mk_tameGenerator`, `wildInertia`,
  `wildInertia_isProP`; TC `freeProfiniteGroup.dense_closure_range_of`; PPG rank API; M infinite
  Galois correspondence.
- **The relative Frattini reduction** `topologicalClosure_eq_top_of_sup_wildInertiaCommutator`: a
  set that generates `G_K` modulo `⁅P_K, P_K⁆` already generates `G_K`, because wild inertia is
  pro-`p` and `⁅P_K, P_K⁆ ≤ Φ(P_K)` (NSW (3.9.1), the Frattini argument). Its proof consumes
  exactly `LFR.wildInertia_isProP` and `PPG.topologicallyGenerates_iff_frattiniQuotient`; the
  abstract pro-`p` Frattini theory stays with the supplier.

### Step 5: from finite quotients to the profinite group

Generation is stated for **tuples** `Fin (N+2) → G`, in which repetitions are allowed, never for
finsets of cardinality exactly `N+2`. ⚠ The finset form is false: for `U = G_K`, which is open,
normal and contains `⁅P_K, P_K⁆`, the quotient is trivial and has no finset of size `N+2 ≥ 2`.
`not_forall_exists_finset_card_generating_quotient` records this witness as a closed proof.

- **The finite level** `exists_generating_tuple_quotient`: every finite continuous quotient
  `G_K/U` through which `⁅P_K, P_K⁆` dies is generated by an `(N+2)`-tuple. This is where Step 3
  is used, as in the proof of NSW (7.4.1). With `L` the fixed field of `P_K U`, a finite tamely
  ramified Galois layer with group `G_K/(P_K U)`: `exists_tameFrame_quotient` supplies the
  generating pair `σ, τ`, which is the hypothesis `exists_tameFrame_exponents` needs for the sharp
  exponents; `nonempty_tateModule` and
  `tateModule_linearEquiv` the decomposition `Y ≃ M₀ ⊕ ℤ_p[G]^N`;
  `exists_relationModule_surjective_of_tameFrame`, at that frame and for a generating family of
  size `N+2`, the surjection `β : R^ab_{N+2}(p) ↠ A(L)` with kernel `ℤ_p[G]` (the unrestricted
  Step 7 theorem is not consumed here; it is derived from the rank theorem, and using it would be
  circular). The lift of `β` to group extensions is the extension dictionary:
  1. Put `V = G_L = P_K U`, `G = Gal(L/K) ≅ G_K ⧸ V`, `F = F_{N+2}` with `presentationHom G g` for
     the generating family `g` of size `N+2` at which `β` is taken, and `R` its kernel.
     `E_top = F ⧸ ⁅R, R⁆R(p)` and `E_bot = G_K ⧸ ⁅V, V⁆V(p)` are extensions of `G` by `R^ab(p)` and
     by `V^ab(p)`, profinite since the kernels of `R → R^ab(p)` and `V → V^ab(p)` are closed, so TC
     `ProfiniteGroupExtension`s once `F ⧸ R` and `G_K ⧸ V` are identified with `G`. Their classes
     are PC's `abelianizationProPClass` at `(F, R)` and at `(G_K, V)`, the class of an extension
     being that of the factor set of any continuous section (TC
     `GroupExtension.contCohomologyClass_factorSet_eq`) and PC's factor set being that of the
     section `q ↦ q.out` (`abelianizationProPFactorSet`).
  2. Through Lyndon (`relationModule_linearEquiv_abelianizationProP`) and the reciprocity
     identification of Step 1, `β` becomes a surjection `f : R^ab(p) ↠ V^ab(p)`, additive,
     `G`-equivariant, with kernel `ℤ_p[G]`, and an isomorphism on `H²` (the `H²`-compatibility of
     Step 3). It is continuous: `R^ab(p)` and `V^ab(p)` are compact and finitely generated as
     `ℤ_p`-modules (by Lyndon and by Step 2), so `p^k` times either group is closed of finite index,
     hence open, and `f(p^k x) = p^k f(x)`.
  3. Lifts of the `g_i` to `E_bot` give a continuous `ψ : F → E_bot` (TC `freeProfiniteGroup.lift`)
     over `G` (TC `freeProfiniteGroup.hom_ext`), which carries `R` into the abelian pro-`p` group
     `V^ab(p)` and so descends to a continuous homomorphism `E_top → E_bot` over `G`. By
     `PPG.ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom` its
     restriction to the kernels carries the class of `E_top` to the class of `E_bot`, which
     generates (`contCohomologyClass_absoluteGaloisGroup_generates`). So the map it induces on `H²`
     is onto a cyclic group of the same order as its source, hence bijective, and the class of
     `E_top` generates as well.
  4. So `f` carries the class of `E_top` to `c` times the class of `E_bot`, for an integer `c` prime
     to `p`. Rescaled by `c⁻¹ ∈ ℤ_pˣ`, `f` is still a continuous equivariant surjection, and it now
     carries the class of `E_top` to that of `E_bot`, so
     `PPG.ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq` lifts
     it to a continuous homomorphism `E_top → E_bot` over `G`, surjective because `f` is
     (`PPG.GroupExtension.surjective_of_comp_inl_eq`).
  5. `G_K/U` is a quotient of `E_bot`, because `V/U = P_K U/U` is an abelian `p`-group, so the
     images of the `N+2` free generators generate it.

  *Needs:* Steps 1, 3 and 4; PPG
  `ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`,
  `ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`,
  `GroupExtension.surjective_of_comp_inl_eq` (the lifting row); PC `abelianizationProP`,
  `abelianizationProPFactorSet`, `abelianizationProPClass` (the class-module row); TC
  `ProfiniteGroupExtension`, `GroupExtension.contCohomologyClass_factorSet_eq`,
  `freeProfiniteGroup.lift`, `freeProfiniteGroup.hom_ext`.
- **The tuple sets** `generatingTuples p K U`: for an open normal `U`, the set `X_U` of
  `(N+2)`-tuples of `G_K` whose images generate `G_K/U`. Prove `isClosed_generatingTuples`
  (membership depends only on the image in the discrete quotient `(G_K/U)^{N+2}`),
  `generatingTuples_nonempty` for `U ⊇ ⁅P_K, P_K⁆` (lift the tuple of the finite level), and
  `generatingTuples_antitone` (`X_{U'} ⊆ X_U` for `U' ≤ U`).
- **Compactness** `iInter_generatingTuples_nonempty`: the closed sets `X_U`, over the admissible
  `U`, have the finite intersection property — finitely many admissible `U` are replaced by their
  intersection, again open, normal and containing `⁅P_K, P_K⁆` — and `G_K^{N+2}` is compact, so
  their intersection is nonempty. One tuple works in every quotient; no compatibility between
  independently chosen generating sets is needed.
- **Passage to the profinite group** `exists_tuple_generating_mod_wildInertiaCommutator`: a tuple
  in every `X_U` generates `G_K` modulo `⁅P_K, P_K⁆`, since the closed subgroup it generates
  together with `⁅P_K, P_K⁆` maps onto every finite quotient of `G_K/⁅P_K, P_K⁆`. Step 4 then
  removes the commutator.
- `isTopologicallyFinitelyGenerated_absoluteGaloisGroup` follows. It is named separately so the
  natural-valued rank accessor is never applied before its hypothesis is available.

### Step 6: matching the two bounds

Prove the public theorem `rank_absoluteGaloisGroup` directly, with no anonymous or unconstructed
package hypothesis:

```text
d(G_K) = [K : ℚ_p] + 2.
```

Its Lean form says that `N+2` is the least cardinality of a finite subset whose generated subgroup
is dense, and it is the conjunction of two separately named theorems.

- **Upper bound** `topologicalGeneratorRankNat_absoluteGaloisGroup_le`, from the tuple of Step 5
  and the Frattini reduction of Step 4, which is the generator count of NSW (7.4.1).
- **Lower bound** `le_topologicalGeneratorRankNat_absoluteGaloisGroup`:
  - if `μ_p ⊆ K`, use the continuous surjection `G_K -> G_K(p)` and L3;
  - if `μ_p ⊄ K`, put `L = K(μ_p)` and `m=[L:K]`. Then `m | p-1` and `m ≥ 2`, L3 gives
    `d(G_L(p))=mN+2`, monotonicity gives that as a lower bound for `d(G_L)`, and the supplier's
    Schreier bound `d(G_L) ≤ 1 + m(d(G_K)-1)` for the open subgroup `G_L <= G_K` forces
    `d(G_K) ≥ N+1+1/m`, hence `d(G_K) >= N+2`.

The count `N+1` belongs only to the free pro-`p` quotient. No theorem may state it for the full
absolute Galois group. In particular the abelianization is not enough for the lower bound: for
`K = ℚ_p` with `p` odd, `G_K^ab ≃ ℤ̂ × ℤ/(p-1) × ℤ_p` needs only two generators while
`d(G_{ℚ_p}) = 3`.

### Step 7: the relation-module sequence on an arbitrary finite Galois layer

- **The unrestricted surjection** `exists_relationModule_surjective`, NSW (7.4.2)(i) at a finite
  layer: for every finite Galois layer `L/K` and every generating family `g` of `G` of size `N+2`,
  `R^ab_{N+2}(p)` surjects `G`-equivariantly onto `A(L)` with kernel `ℤ_p[G]`. ⚠ **It is proved
  after Step 6 and consumes the rank theorem**, as in NSW: `rank_absoluteGaloisGroup` gives
  `π : F_{N+2} ↠ G_K`; with `R = π⁻¹(G_L)` and `N = ker π`, `R^ab(p)` is the relation module of the
  family induced by the free generators (`relationModule_linearEquiv_abelianizationProP`), `R ↠ G_L`
  induces `β : R^ab(p) ↠ A(L)`, its kernel is the image of `N`, projective (NSW (5.6.7)) with
  rationalization `ℚ_p[G]` by the dimension count `ℚ_p ⊕ ℚ_p[G]^{N+1}` against `ℚ_p[G]^N ⊕ ℚ_p`,
  hence `ℤ_p[G]` by `linearEquiv_of_projective_of_tensorRat`;
  `relationModule_linearEquiv_of_closure` transports `β` to every other generating family. Its Lean
  statement carries the local-field hypotheses of `rank_absoluteGaloisGroup` for that reason. The
  tame-frame surjection of Step 3 is what Step 5 consumes; this theorem is a consequence of the rank
  theorem and is not an input to it, and no proof of Step 5 may cite it.
  *Needs:* Step 6; Step 3 cancellation library and `relationModule_linearEquiv_abelianizationProP`;
  NSW (5.6.7); TC `freeProfiniteGroup`, `freeProfiniteGroup.lift`.

*Needs:* L3-L4; PPG `topologicalGeneratorRank_le_of_surjective`,
`topologicalGeneratorRankNat_le_of_isOpen` and the lifting row; PC the class-module row; LFR
tame/wild ramification theory and the marked tame presentation; CFT reciprocity, Euler
characteristic and `scd_p_absoluteGaloisGroup_eq_two`; TC free profinite groups and profinite
group extensions.

## Layer 8: marked arithmetic acceptance instances

- **`K=ℚ₂`.** Prove `localRootOfUnityOrder_two_ratPadic` (`q(ℚ₂) = 2`),
  `isDyadicOddCase_ratPadic`, rank `3`, and
  the marked theorem `absoluteGaloisGroupProP_two_ratPadic_marked`:
  there is `e : G_{ℚ₂}(2) ≃ D₀` such that
  `standardD0Orientation ∘ e = cyclotomicOrientation 2 ℚ_[2] ratPadicTwo_hasPrimitiveRoot`,
  and this character is
  surjective. By the supplier's named value theorems, the pulled-back marked generators have
  values `(-1, 1, (-3)⁻¹)`. The unmarked isomorphism is a corollary of this theorem, not a
  separate classification choice.
- **`K=ℚ₂(√-2)`**, as `RatPadicSqrtNegTwo = AdjoinRoot (X² + 2)` over `ℚ₂`. Prove
  `finrank_ratPadicSqrtNegTwo` (degree `2`, a closed proof from the power basis),
  `localRootOfUnityOrder_two_ratPadicSqrtNegTwo` (`q=2`), and
  `range_localCyclotomicCharacter_ratPadicSqrtNegTwo`: the cyclotomic image is
  `U^[2]=closure⟨3⟩ = PPG.procyclicClosure (-negThreeUnit)`, of index `2` in `ℤ₂ˣ`, because the
  uniformizer `√-2` has norm `2` and contributes `χ = 1`, while the unit norms `a²+2b²` with `a`
  odd are exactly the classes `1, 3 mod 8` and `-1` is not among them; the generator is `-1 + 2²`
  by the closed proof `negThreeUnit_neg_coe`, which is what fixes `k = 2`. Hence
  `isDyadicEvenPrincipalCase_ratPadicSqrtNegTwo`. Then the marked theorem
  `absoluteGaloisGroupProP_two_ratPadicSqrtNegTwo_marked`: an isomorphism
  `G_{ℚ₂(√-2)}(2) ≃ ⟨x₁,x₂,x₃,x₄ | x₁⁶(x₁,x₂)x₃⁸(x₃,x₄)⟩`, the supplier's even word at `a = 4`,
  `f = 3`, under which `χ(x₂)(1+4) = -1`, `χ(x₄)(1-8) = 1` and `χ(x₁) = χ(x₃) = 1`. This is
  `absoluteGaloisGroupProP_two_marked_of_degree_even_principal` at `N=2`, `k=2`, `u=3`, `f=3`;
  the relator is Labute-isomorphic to his `x⁶(x,y)(z,w)`, the same group with `f = ∞`. The
  unmarked `absoluteGaloisGroupProP_two_ratPadicSqrtNegTwo` is a corollary with a closed proof.
  This example detects loss of the `U^[f]` family, and it detects a marked theorem that forgets
  its marking: an unmarked isomorphism type cannot tell `k = 2` from any other `k`.
- **`K=ℚ_p(μ_p)`, `p` odd.** Prove degree `p-1`, `q=p`, rank `p+1`, and the marked normal form
  `x₁^p(x₁,x₂)(x₃,x₄)...(x_p,x_{p+1})`.

Each acceptance result must pass through the arithmetic invariant computations and the supplier's
marked theorem. A direct unmarked existence proof does not discharge the milestone.

## Ordering and parallel work

L0 and L1 can begin independently once the supplier declarations exist. L2 depends on both. L3
then feeds two branches: L4–L6, the maximal pro-`p` classification, and L7, the full-group rank.
L8 joins those arithmetic computations at the end. Within L6 the `q != 2`, odd dyadic, and even
dyadic presentation cases can be developed in parallel after L5.

Inside L7, Steps 1–2 (the lattice and its torsion), the integral cancellation library of Step 3
and Step 4 (the tame frame and the Frattini reduction) are independent of one another and can be
developed in parallel; the arithmetic part of Step 3 (sharp exponents, the Tate module, its
decomposition and the tame-frame relation-module surjection) needs Steps 1–2 and the cancellation
library; Step 5 needs Steps 3 and 4; Step 6 needs Step 5 together with L3; and Step 7, the
relation-module sequence on an arbitrary finite Galois layer, comes last, since it consumes
Step 6.

## Acceptance checklist

- There is exactly one definition of `G_K(p)`, reducibly specialized from the supplier.
- No private structure collects arithmetic facts already exported by CFT, LFR, PC, or PPG.
- `pPowerRootsOfUnity` is a subgroup of `Kˣ`, its finiteness is a theorem, and
  `localRootOfUnityOrder` takes that finiteness proof as an argument.
- `H²=0` in the free case is actual vanishing, not only `finrank=0`.
- Degree-two inflation has separate injectivity and surjectivity proofs.
- `localCyclotomicCharacter` has a body and a pinned defining equation; the reciprocity comparison
  is a closed proof against the supplier, not a restatement.
- The cyclotomic character of `G_{ℚ_p}` is surjective by a named theorem, from the irreducibility
  of `Φ_{p^n}` over `ℚ_p`, and the value `χ_cyc(Art_{ℚ_p}(p)) = 1` is proved from the same
  irreducibility, without the cyclotomic normalization of the Artin map on units.
- `cyclotomicOrientation` is a continuous homomorphism with a body, and its prescription property
  is proved from Kummer theory and twisted inflation, not from local duality. It is TC's
  `HasPrescriptionProperty`, the predicate PPG's `demushkinCharacter_unique` takes, so the
  identification with the Demushkin orientation is a closed proof with no comparison of predicates.
- The chosen-root dictionary `μ_p ≅ 𝔽_p` is a construction through CFT's coordinate
  `muNRepEquivZMod`, and left nondegeneracy of the cup square is a closed proof from CFT's
  chosen-root comparison `tateDualityPairing_muNRepToTateDual` and perfect local duality.
- The degree-two inflation isomorphism is the inflation map, made an equivalence by named
  injectivity and surjectivity theorems.
- Strict cohomological dimension enters only at `G_K`, in
  `contCohomologyClass_absoluteGaloisGroup_generates`, and Lyndon's identification of
  `relationModule` with `R^ab(p)` is a named theorem, not a reading of the definition.
- `d(G_K)` is `N+2` in both roots-of-unity cases; `N+1` appears only for `G_K(p)`.
- The upper bound for `d(G_K)` rests on the integral chain of L7 Steps 1–5. No theorem derives a
  generator count from a rational `ℚ_p[G]`-isomorphism alone.
- The torsion of `A(L)` is a `ℤ_p`-submodule and its free quotient is a `ℤ_p`-linear isomorphism
  with `ℤ_p^{[L:ℚ_p]+1}`, not an additive one.
- The integral decomposition `Y ≃ M₀ ⊕ ℤ_p[G]^N` of the Tate module and the tame-frame
  relation-module surjection `R^ab_{N+2}(p) ↠ A(L)` are named theorems, and the finite-level
  generation theorem consumes them; the relation-module sequence on an arbitrary finite Galois
  layer (NSW (7.4.2)(i)) is stated after the rank theorem and is not an input to Step 5.
- Generation at finite levels and in the limit is stated for tuples `Fin (N+2) → G`; the
  finset-cardinality form is refuted by a closed proof.
- The cyclotomic formula contains the field norm for general `K` and an inverse for the
  arithmetic Artin convention.
- The five branch cases are Lean predicates with a proved disjointness-and-exhaustiveness theorem,
  not a prose table.
- The `q=2` even-rank branch is selected from the orientation image, not from `q` alone, and
  both even marked theorems take the image equation as a hypothesis and record the supplier's
  generator values; the unmarked even statement is a closed-proof corollary.
- The finite-layer module contracts of L7 Step 3 — the rational decomposition, the Tate module,
  its decomposition and the relation-module surjection — carry `IsScalarTower ℚ_[p] K L`,
  `IsGalois K L` and `FiniteDimensional K L` as Lean hypotheses, and the non-Galois cubic
  `ℚ₅(∛5)` is a named rejection test.
- `exists_tameFrame_exponents` takes a generating pair, pins both the order and the
  `ℤ_p[G]`-module structure of `ℤ_p[G]/(σ - a, τ - b)`, and the identity pair on `ℚ₂(ζ₃)` is a
  named rejection test.
- `D₀` and its standard orientation are imported from PPG; only the marked local isomorphism is
  proved here.
- The `ℚ₂` theorem preserves the values `(-1,1,(-3)⁻¹)` and surjectivity; the `ℚ₂(√-2)` theorem
  records `χ(x₂)(1+4) = -1`, `χ(x₄)(1-8) = 1` and the image `closure⟨3⟩` with `3 = -1 + 2²`.

## References

- J. P. Labute, *Classification of Demushkin groups*, Canad. J. Math. 19 (1967), 106–132,
  especially §5 and Theorems 7–9 for local fields, the marked cases, and the
  `ℚ₂(√-2)` example.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., VII
  (7.5.11) for the free/Demushkin dichotomy and (7.5.12) for explicit presentations; VII
  (7.4.1), whose proof is the chain of Layer 7 Steps 3–5 (the tame-frame module, the Tate module
  `Y`, the isomorphism `Y ≃ M₀ ⊕ ℤ_p[G]^N`, the surjection `β` and its lift to group extensions),
  (7.4.2)(i) for the relation-module sequence `0 → ℤ_p[G] → R^ab(p) → A(L) → 0`, and (7.4.4)(i)
  for the rational decomposition of `A(L)`; V (5.6.5) and (5.6.6) for the Tate module and
  Lyndon's sequence, (5.6.9) for `E¹(Y) = μ_{p^∞}(L)^∨`, (5.4.2) and (5.4.11) for homotopy
  equivalence and the transpose, (5.6.10)(i)–(iii) and (5.6.11) for the integral cancellation
  that upgrades the rational decomposition; III (3.1.5) for Tate's theorem behind the
  cohomological triviality of `Y`, (3.6.4)(iii), at `G_K` only, for the class of the arithmetic
  extension `1 → G_L^ab(p) → G_K/⁅G_L, G_L⁆G_L(p) → Gal(L/K) → 1`, with (7.2.5) for `scd_p G_K = 2`,
  and (3.9.1) for the Frattini argument used along wild inertia; I §5 Exercise 4 for the lift of
  `β` to group extensions.
- K. Iwasawa, *On Galois groups of local fields*, Trans. Amer. Math. Soc. 80 (1955), 448–469, for
  the Galois module structure of the principal units, the source of the rational decomposition.
- I. R. Shafarevich, *On p-extensions*, Mat. Sb. 20 (1947), 351–363; English translation,
  AMS Transl. Ser. 2, 4 (1956), 59–72, for the free case.
- M. Jarden and A. Shusterman, *The absolute Galois group of a p-adic field*, Theorem 2.1,
  for the exact generator rank of the full absolute Galois group.
- J.-P. Serre, *Galois Cohomology*, I §§3–4 and II §5, for pro-`p` cohomological dimension,
  Demushkin groups, and local duality.
- H. Koch, *Galois Theory of p-Extensions*, Chapters 4, 6, and 10, for free pro-`p` groups,
  generator/relation ranks, and arithmetically normalized local presentations.

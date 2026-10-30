# Roadmap: profinite and pro-`p` groups

**Archived, declared complete 2026-10-08.** `Suggested.lean` states the milestones below, each now
discharged by the Tau Ceti (or Mathlib) declaration that realizes it, with no `sorry`. Eight
statements of this document were found to be mathematically wrong at archiving; they are corrected
in the closing section *Errata, corrected at archiving*. The first is an edge-case remark; for
the other seven `Suggested.lean` certifies the corrected forms.

**Summary.** This roadmap develops the abstract group theory used throughout the arithmetic portfolio:
profinite foundations, supernatural order and Sylow theory, Frattini quotients and generator
rank, free pro-`p` groups, cohomological dimension, lower `p`-series, completed group algebras,
one-relator theory, and the classification of finite-rank Demushkin groups.

It does not identify the maximal pro-`p` quotient of a local absolute Galois group. That
arithmetic application, including roots of unity, rank formulas, Kummer orientations, and the
explicit local presentation, belongs to the **LocalGaloisGroups** roadmap, which consumes the
abstract exports here together with `LocalFieldsRamification` and `ClassFieldTheory`.

The **LocalFieldsRamification** roadmap is a separate arithmetic consumer of the abstract
contracts here. It uses profinite Sylow theory to identify wild inertia inside inertia and uses
the free-profinite and presented-profinite universal properties to identify the tame quotient.
Those arithmetic identifications belong there; the reusable Sylow and presentation carriers and
theorems belong here.

Three generic constructions that downstream roadmaps ask for are **deliberately not owned
here**, and have one exact owner: a focused successor roadmap, **`ProfiniteArithmetic`**. They
are the profinite integers as a topological commutative *ring*; the profinite power `x ^ᶻ a`
with a `ℤ̂` exponent on an arbitrary profinite group, together with its comparison against the
`ℤ_ℓ`-power on a maximal pro-`ℓ` quotient; and the continuous automorphism and outer-automorphism
groups of a profinite group, with the quotient topology on the latter. What stays here is
strictly less: `zHat` as a profinite *group* (Layer 4), the identification of its maximal pro-`p`
quotient with `ℤ_p`, and the `ℤ_p`-module structure of an abelian pro-`p` group (Layer 4) — the
three facts this roadmap's own Sylow, free-object and rank milestones consume. `BelyiMaps`
Layers 12–13 are the first consumer of the deferred three; they import them from
`ProfiniteArithmetic`, not from here and not from a Belyi-local copy.

## Scope and ownership

The roadmap exports canonical carriers and universal properties for free profinite and free
pro-`p` groups, pro-`p` Sylow theory, the Frattini subgroup and generator-rank comparison,
cohomological criteria for freeness, the lower `p`-series and finite-quotient determinacy,
completed group algebras and relation modules, and the classification interface for abstract
Demushkin groups. It consumes continuous cohomology only from the accepted **Profinite
Cohomology** roadmap. The extension dictionary with compact kernel is consumed from Tau Ceti,
whose `TauCeti.ProfiniteGroupExtension` takes its classes in that roadmap's explicit `H²`.

**One implementation.** Tau Ceti implements the foundational layers of this roadmap, and the
roadmap consumes that implementation. Each carrier Tau Ceti provides is exported here under the
roadmap's name as a reducible alias of the Tau Ceti declaration, so that a statement about the
roadmap name is a statement about the Tau Ceti object and every Tau Ceti lemma applies to it:

| Roadmap name | Tau Ceti (or Mathlib) declaration |
|---|---|
| `IsProP`, `proPKernel`, `maximalProPQuotient`, `IsProPSylow` | `TauCeti.IsProP`, `TauCeti.proPKernel`, `TauCeti.maximalProPQuotient`, `TauCeti.IsProPSylow` |
| `IsTopologicallyFinitelyGenerated`, `ConvergesToOne`, `topologicalGeneratorRank`, `topologicalGeneratorRankNat` | the `TauCeti` declarations of the same names |
| `proPFrattini`, `pLowerCentralStep`, `pLowerCentralSeries` | the `TauCeti` declarations of the same names |
| `Supernatural`, `profiniteOrder`, `profiniteIndex` | `TauCeti.Supernatural`, `TauCeti.profiniteOrder`, `Subgroup.profiniteIndex` |
| `FiniteGroupClass`, `finiteGroupClassP`, `proCKernel`, `IsProC` | the `TauCeti` declarations of the same names |
| `freeProfiniteGroup`, `freeProC`, `freeProP`, each with `of` | the `TauCeti` declarations of the same names |
| `presentedProfiniteGroup`, `presentedProP`, each with the continuous projection `mk` | the `TauCeti` declarations of the same names |
| `zHat`, `unitsPrincipal`, `unitsPlusMinus`, `IsFiniteContinuousQuotient` | `TauCeti.zHat`, `TauCeti.unitsPrincipal 2`, `TauCeti.unitsPlusMinus`, `TauCeti.IsFiniteContinuousQuotient` |
| `topAbelianization` | Mathlib's `TopologicalAbelianization` |
| `trivialFp`, `cohomFp` | `TauCeti.trivialFp`, `TauCeti.cohomFp` |
| `HasPrescriptionProperty` | `TauCeti.HasPrescriptionProperty`, on continuous characters `G →ₜ* ℤ_[p]ˣ` |
| `demushkinQ` | `TauCeti.demushkinQ` |
| `labuteRelatorClass`, `demushkinRelatorCharacter` | `TauCeti.labuteRelatorClass`, with values in `TauCeti.labuteE χ`, and `TauCeti.demushkinRelatorCharacter` |
| `labuteComm`, `freeProPGen`, `presentedProPGen` | the `TauCeti` declarations of the same names |
| `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoOddTop`, `demushkinWordTwoEven`, `demushkinWordTwoRankTwo` | the `TauCeti` declarations of the same names |
| `demushkinD0`, `d0A`, `d0S`, `d0Y`, `negThreeUnit`, `standardD0Orientation` | the `TauCeti` declarations of the same names |
| `completedGroupAlgebra p Γ`, `IsCompactModule p Γ M` | `TauCeti.completedGroupAlgebra ℤ_[p] Γ`, and `TauCeti.IsCompactModule` over it |

Every headline theorem stated in `Suggested.lean` is proved in Tau Ceti at the pin, so each is a
closed proof there whose body is the Tau Ceti theorem, and the file carries no `sorry`. Every
other milestone that Tau Ceti proves is cited by its Tau Ceti name in the milestone below. The universal
properties of the free and presented objects are used directly under their Tau Ceti names, and so
are the Tau Ceti objects that no downstream roadmap cites under a roadmap spelling: the finite
embedding problems and projectivity (Layer 5), the graded pieces of the lower `p`-series with their
bracket and `p`-power operator (Layer 8), the projections, coordinates and functoriality of the
completed group algebra and the module structure on Labute's relation module (Layer 9), and the
free pro-`C` groups on pointed spaces (Layer 10).

The frozen downstream surface includes:

| Topic | Exact declarations |
|---|---|
| pro-`p` carriers | `IsProP`, `proPKernel`, `maximalProPQuotient`, `IsProPSylow` |
| the pro-`p` kernel | `proPKernel_proPKernel_eq_top` |
| profinite Sylow interface | `exists_isProPSylow`, `IsProP.exists_le_isProPSylow`, `IsProPSylow.eq_of_normal`, `IsProPSylow.map_of_surjective`, `IsProPSylow.not_dvd_index_of_le` |
| finite generation | `IsTopologicallyFinitelyGenerated`, `topologicalGeneratorRank`, `topologicalGeneratorRankNat`, `topologicalGeneratorRank_le_of_surjective`, `topologicalGeneratorRankNat_le_of_isOpen`, `topologicallyGenerates_iff_frattiniQuotient`, `proPFrattini` |
| free objects and presentations | `freeProfiniteGroup`, `freeProfiniteGroup.of`, `freeProC`, `freeProC.of`, `freeProP`, `freeProP.of`, `presentedProfiniteGroup`, `presentedProfiniteGroup.mk`, `presentedProP`, `presentedProP.mk` |
| their universal properties | `freeProfiniteGroup.existsUnique_lift`, on morphisms of `ProfiniteGrp`; and, as continuous homomorphisms, Tau Ceti's `TauCeti.freeProfiniteGroup.lift`, `TauCeti.freeProfiniteGroup.hom_ext`, `TauCeti.freeProC.lift`, `TauCeti.freeProC.hom_ext`, `TauCeti.freeProP.lift`, `TauCeti.freeProP.hom_ext`, `TauCeti.presentedProfiniteGroup.lift`, `TauCeti.presentedProfiniteGroup.hom_ext`, `TauCeti.presentedProP.lift`, `TauCeti.presentedProP.hom_ext` |
| lifting along an extension class | `ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`, `ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`, `GroupExtension.surjective_of_comp_inl_eq` |
| embedding problems and projectivity | `IsProC`; Tau Ceti's `TauCeti.FiniteEmbeddingProblem`, `TauCeti.FiniteEmbeddingProblem.IsSolution`, `TauCeti.HasElementaryAbelianSolutions`, `TauCeti.HasPGroupSolutions`, `TauCeti.levelProblem`, `TauCeti.IsProjective`; `hasPGroupSolutions_of_isProjective`, `isProjective_iff_hasPGroupSolutions` |
| `cd_p` of a Sylow subgroup | `res_injective_of_isProPSylow`, `cd_p_eq_of_isProPSylow` |
| Demushkin invariants | `trivialFp`, `cohomFp`, `fpPairing`, `cupFp`, `cupFp_gradedComm`, `IsDemushkin`, `demushkinRank`, `demushkinQ`, `demushkinCharacter`, `demushkinCharacter_unique`, `HasPrescriptionProperty`; the defining equation of `fpPairing` is Tau Ceti's `TauCeti.fpPairing_bil_apply` |
| marked classification | `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoOddTop`, `demushkinWordTwoEven`, `demushkinWordTwoRankTwo`, `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd`, `isDemushkin_marked_of_q_two_even`, `isDemushkin_marked_of_q_two_rank_two`, `isDemushkin_marked_of_q_two_odd_top`, `isDemushkin_marked_of_q_two_even_top`; which pairs occur: `exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even`, `exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd` |
| standard dyadic group | `demushkinD0`, `d0A`, `d0S`, `d0Y`, `standardD0Orientation`, `standardD0Orientation_surjective`, `standardD0Orientation_unique`; the values on `A`, `S`, `Y` and on the relator are Tau Ceti's `TauCeti.standardD0Orientation_d0A`, `TauCeti.standardD0Orientation_d0S`, `TauCeti.standardD0Orientation_d0Y`, `TauCeti.standardD0Orientation_relator` |

The orientation is a continuous character: `demushkinCharacter hG : G →ₜ* ℤ_[p]ˣ`, and
`demushkinCharacter_unique` identifies it with any continuous character that has Tau Ceti's
prescription property. A consumer proves `TauCeti.HasPrescriptionProperty χ` for its own
character `χ` and applies `demushkinCharacter_unique`; no second prescription predicate, and no
comparison between two of them, exists in this roadmap.

Four of these rows have named arithmetic consumers. `LocalGaloisGroups` uses
`proPKernel_proPKernel_eq_top` for degree-one inflation from the maximal pro-`p` quotient of an
absolute Galois group with twisted coefficients, the extension-lifting row to lift a surjection of
relation modules to a surjective morphism of group extensions, and `demushkinCharacter_unique` to
identify the orientation of `G_K(p)` with the descended cyclotomic character. It also reads the
cup square `cupFp` through `fpPairing` and its defining equation `TauCeti.fpPairing_bil_apply`, to compare it with the Kummer cup
product after a choice of primitive root.
`ClassFieldTheory` uses `cd_p_eq_of_isProPSylow` to compute the cohomological dimension of a
local absolute Galois group from that of its Sylow subgroups.

## Conventions

Theorems use the unbundled profinite type-class stack except where a categorical limit or
completion genuinely needs `ProfiniteGrp`. Pro-`p` (`IsProP`) means that every quotient by an
open normal subgroup is a `p`-group; on a profinite group these are exactly the continuous finite
quotients. The predicate makes sense on any topological group and does not imply compactness or
total disconnectedness, so every theorem about pro-`p` or Demushkin groups carries
`[CompactSpace G] [TotallyDisconnectedSpace G]` as separate hypotheses. Orders and closed-subgroup indices take supernatural values;
generator rank is cardinal-valued in general and has a separate natural-number accessor
under topological finite generation. Presentations always quotient by a **closed** normal
closure. The Demushkin cup product is Tau Ceti's `TauCeti.cupFp`, the bidegree-`(1, 1)` case of the
cup product whose general construction `ProfiniteCohomology` plans in Layer 12, and the
commutator convention in relator words is Labute's `(x,y) = x⁻¹y⁻¹xy`.
The cup matrix of a relator `r` reads `H²(G, 𝔽_p)` as `𝔽_p` through the trace
`tr(c) = φ(r)`, where `φ : F → 𝔽_p` is a cochain with `(δφ)(g, h) = φ(g) + φ(h) - φ(gh)` equal
to the inflation of `c`; with it the relator `(x₁, x₂)` has `tr(χ₁ ∪ χ₂) = -1` (Layer 9).
Symplectic bases follow Mathlib's `Matrix.J = fromBlocks 0 (-1) 1 0`.

## Exact supplier contracts

**From Mathlib** (at the repository pin). The profinite carriers `ProfiniteGrp`,
`ProfiniteGrp.profiniteCompletion` with `ProfiniteGrp.ProfiniteCompletion.lift`,
`OpenNormalSubgroup`, `OpenSubgroup`, `ClosedSubgroup` and `Subgroup.topologicalClosure`; finite
group theory through `Subgroup.index`, `IsPGroup`, `Sylow`, `frattini`,
`IsPGroup.isCoatom_iff_index_eq_prime` and `IsPGroup.isNilpotent`; `FreeGroup`; `PadicInt` with
`PadicInt.toZModPow`; `TopologicalAbelianization`; the cohomology carrier
`continuousCohomology` on `TopRep`, valued in `TopModuleCat`; `Module.finrank`; `Matrix.J`;
`MonoidAlgebra`, `PowerSeries` and `PowerSeries.aeval`. Each is used with exactly the hypotheses
of its Mathlib statement; in particular `continuousCohomology` is the homogeneous-cochain
construction, and nothing here assumes it agrees with discrete `groupCohomology` beyond the
comparisons ProfiniteCohomology proves.

**From Tau Ceti** (at the repository pin). The carriers of the alias table in the scope section,
each consumed by reducible alias, so that every Tau Ceti lemma about them applies unchanged; the
extension dictionary `TauCeti.ProfiniteGroupExtension`, with classes in the explicit `H²`; the
cup square `TauCeti.cupFp` on `TauCeti.TopPairing`; the cohomological dimension
`TauCeti.cohomologicalDimensionAt`, at the coefficient universe of `G`; and, milestone by
milestone, the declarations named on each *In Tau Ceti:* line, read at their stated hypotheses.

**From TauCetiRoadmap.ProfiniteCohomology** (on main), cited as `PC-<layer>`:
- Layer 1: the carrier interface `TopRep`, `res`, `infl`, `coeffMap`, `ofDiscreteModule`,
  `ofDiscreteModule_isSmoothDiscrete` and `ofDiscreteModuleRes`;
- Layers 2 and 3: the explicit `H⁰`, `H¹`, `H²` and the comparisons
  `explicitH1IsoContinuousCohomology` and `explicitH2IsoContinuousCohomology`;
- Layer 5: the low-degree long exact sequence (`explicitDelta0`, `explicitDelta1`) and the
  five-term sequence (`transgression`, `fiveTerm_exact_H2Q`), in degrees `≤ 2` only;
- Layer 7: `Coind` and the explicit Shapiro isomorphisms `explicitShapiro0`, `explicitShapiro1`,
  `explicitShapiro2`, in degrees `≤ 2` only;
- Layer 10: the all-degree long exact sequence `delta`, `longExact_exact`, filtered colimits
  `continuousCohomology_preservesFilteredColimits`, Shapiro in every degree `shapiroIso`,
  dimension shifting `coindEmbedding`, `dimensionShiftQuotient`, `coindAcyclic`,
  `dimensionShiftIso`, corestriction `corestriction`, `corestriction_comp_res`, and the descent
  `exists_openSubgroup_res_eq_zero_of_res_eq_zero`;
- Layer 11: `IsPPrimaryTorsion`, `isPPrimaryTorsion_continuousCohomology`, `cd_p`,
  `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`, `cd_p_le_of_isClosed` and
  `cd_p_eq_of_index_not_dvd`;
- Layer 12: the graded cup product `cup` and its agreement `explicitIso_cup` with the explicit
  bidegree-`(1, 1)` cup, which `TauCeti.cupFp` must match.

Any statement in every degree uses the Layer 10 exports; the Layer 5 and Layer 7 exports are used
only in degrees `≤ 2`.

## How to read the build

`README.md` is the roadmap; `Suggested.lean` is its acceptance test, stating the headline
theorems against the pinned Mathlib and Tau Ceti with the few definitions they need. In prerequisite
annotations, `M` means Mathlib at the repository pin, `TC` means Tau Ceti at that pin, `L0`
through `L10` mean an earlier layer here, and `PC-<layer>` means an export of
`ProfiniteCohomology`. No milestone depends on a branch, an unmerged external project,
`LocalFieldsRamification`, or `ClassFieldTheory`. An *In Tau Ceti:* line names an available
source declaration and the milestone component it supports.

## The build, in layers

### Layer 0: profinite foundations

- **The instance chain.** A totally disconnected topological group is T1, because its
  components are closed, hence T2, hence T3. Prove the missing glue instances once, so that
  no statement carries `[T2Space G]`.
  *Needs:* M `TotallyDisconnectedSpace`, M `IsTopologicalGroup`.
- **Quotients by closed normal subgroups.** For `G` profinite and `N` a closed normal
  subgroup, `G ⧸ N` is profinite. The missing ingredient is
  `TotallyDisconnectedSpace (G ⧸ N)`, by the clopen-image argument; package it with the
  compactness and topological-group instances, which exist.
  *Needs:* M `QuotientGroup.instTopologicalSpace`, M `IsTopologicalGroup`.
  *In Tau Ceti:* the instance `TauCeti.QuotientGroup.instTotallyDisconnectedSpace`.
  ⚠ Closedness of `N` is a hypothesis, not decoration. A quotient by a non-closed subgroup
  is not T1. Example: `ℤ̂ ⧸ ℤ` with `ℤ` dense.
- **Closed and open subgroups.** A closed subgroup of a profinite group is profinite:
  assemble the instances. An element that lies in every open normal subgroup is `1`. A
  subgroup is open if and only if it is closed of finite index. Open normal subgroups of
  `G ⧸ N` correspond to open normal subgroups of `G` above `N`.
  *Needs:* M `ProfiniteGrp.closedSubgroup_eq_sInf_open`, M `ClosedSubgroup`, M `OpenSubgroup`.
- **Inverse limits, unbundled.** Restate the limit description for consumers outside the
  category: a compatible family of elements of the finite quotients of `G` comes from a
  unique element. Prove the compactness lemma in the form that Layer 8 uses: a directed
  family of nonempty closed subsets of a profinite set has nonempty intersection. Its inverse
  system forms are: an inverse system of nonempty compact Hausdorff spaces, or of nonempty finite
  sets, over a directed index has a compatible family, in the general and in the sequential
  indexing; and a compatible family in a tower of `T1` spaces lifts along a levelwise surjective
  continuous map from a tower of compact Hausdorff spaces, with no surjectivity asked of the
  transition maps.
  *Needs:* M `ProfiniteGrp.toLimit_surjective`, M `ProfiniteGrp.toLimit_injective`, M
  `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`.
  *In Tau Ceti:* `TauCeti.exists_forall_map_eq_of_compact_t2`,
  `TauCeti.exists_forall_map_eq_of_finite`, `TauCeti.exists_forall_map_succ_eq_of_compact_t2`,
  `TauCeti.exists_forall_map_succ_eq_of_finite`,
  `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`.
  *Source:* Ribes–Zalesskii Prop. 1.1.4 for the compactness lemma.
  ⚠ The separation hypotheses of the lifting statement are needed. With `ℤ` indiscrete in every
  degree upstairs and identity transitions, `ℤ/2^k` indiscrete downstairs with the reductions, and
  the quotient maps between them, the compatible residues of `-1/3` modulo `2^k` come from no
  single integer.
- **Profinite completion.** Consume `ProfiniteGrp.ProfiniteCompletion`. Add the unbundled
  universal property: continuous homomorphisms from the completion to a profinite `P`
  correspond to abstract homomorphisms from `G`. Add that the unit is bijective on a finite
  group.
  *Needs:* M `ProfiniteGrp.profiniteCompletion`, M `ProfiniteGrp.ProfiniteCompletion.lift`.
  *In Tau Ceti:* `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`,
  `TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite`.
  ⚠ An abstract homomorphism out of a profinite group need not be continuous, so the
  completion of the underlying abstract group of a profinite group is in general larger.
  That subject (Nikolov–Segal) is outside this roadmap.
  ⚠ No milestone of this roadmap assumes second countability. The absolute Galois group of a
  general field is not second countable. Where a later theorem wants a countable
  neighbourhood basis, it carries "countably many open normal subgroups" as a hypothesis,
  which Layer 3 discharges for topologically finitely generated groups.

#### Examples

- `S₃` with the discrete topology is profinite; the discrete group `ℤ` is not compact, and its
  profinite completion is `ℤ̂`, with completion map injective.
- `ℤ̂ / ℤ` by the dense subgroup `ℤ` is not `T1`, so the quotient theorems need a closed normal
  subgroup; `C₄ / C₂` is the discrete `C₂`.
- In `ℤ₂`, the residues of `-1/3` modulo `2^k` lift to the single element `-1/3`.

#### Dependencies

Mathlib's profinite carriers, `OpenNormalSubgroup`, the quotient topology and
`ProfiniteGrp.profiniteCompletion`. No earlier layer.

### Layer 1: supernatural order and index

- **Supernatural numbers.** `Supernatural`, the exponent functions `Nat.Primes → ℕ∞` as a
  separate type (Tau Ceti's `TauCeti.Supernatural`), with:
  - divisibility as pointwise `≤`, and multiplication as pointwise `+`;
  - the lattice operations as pointwise `⊔` and `⊓`;
  - the embedding of `ℕ+` by prime factorization;
  - the predicate "is a natural number";
  - the `p`-primary part and the prime-to-`p` part.
  *Needs:* M `padicValNat`, M `Nat.Primes`, M `ℕ∞`.

  API checklist for `Supernatural`:
  - Constructors: the embedding `ofNat : ℕ+ → Supernatural`; the constant `1`; `p ^ ∞`.
  - Examples: the order of `ℤ_p` is `p^∞`; the order of `ℤ̂` is `∏_ℓ ℓ^∞`.
  - Morphisms: the order-preserving embedding of `ℕ+`, and the projection to the `ℓ`-adic
    exponent.
  - Functoriality: none; this is an order-theoretic object.
  - Comparison lemmas: `ofNat` is multiplicative and injective, and it takes `Nat.gcd` and
    `Nat.lcm` to `⊓` and `⊔`.
  - Naturality: divisibility, product and lattice operations agree with the `ℕ+` ones under
    `ofNat`.
  - Edge cases: the value `0` at a prime, and the value `∞`; the theorem that a supernatural
    number is a natural number if and only if it has finite support and finite values.
  - Downstream interfaces: `profiniteOrder`, `profiniteIndex`, and the condition
    `¬ p ∣ profiniteIndex P G` in the Sylow definition of Layer 2.
  **Checks.**
  - The exponent vector of `12` is `(v₂, v₃) = (2, 1)` and `0` elsewhere; that of `18` is
    `(1, 2)`. Their product is `(3, 3)`, which is `216 = 12 · 18`; reading multiplication as
    pointwise `max` would give `36`.
  - `12 ⊓ 18` is the pointwise minimum `(1, 1)`, that is `gcd(12, 18) = 6`, and `12 ⊔ 18` is the
    pointwise maximum `(2, 2)`, that is `lcm(12, 18) = 36`; swapping the two operations would
    send `gcd` to `36`.
  - The supernatural number with exponent `1` at every prime has finite values and infinite
    support, and `2^∞` has finite support and an infinite value: neither is a natural number,
    so the predicate needs both clauses. All exponents `0` is the natural number `1`.
  - Divisibility: `2 ∣ 2^∞` and `2^∞ ∤ 2^5`, while `3 ∤ 2^∞`; `p^∞ · p = p^∞`, so
    multiplication is not cancellative at infinite exponents.
- **The order of a profinite group.** `profiniteOrder G : Supernatural` takes at each prime
  the supremum of the valuations of the orders of the finite quotients. On a finite discrete
  group it is the factorization of `Nat.card G`.
  *Needs:* L1 `Supernatural`, M `Nat.card`, M `OpenNormalSubgroup`.
  *In Tau Ceti:* `TauCeti.profiniteOrder`, `TauCeti.profiniteOrder_apply_of_finite`.
- **The index of a closed subgroup.** The definition is primewise through the finite
  quotients: `profiniteIndex H G ℓ = ⨆_N v_ℓ ([G/N : HN/N])`, the supremum over open normal
  `N ≤ G`. Both groups live in the same universe. The definition is written for an arbitrary
  subgroup; closedness of `H` is a hypothesis of the theorems.
  **Theorem.** For closed `H`, `profiniteIndex H G = ⨆ {U : OpenSubgroup G // H ≤ U}, [G : U]`
  in the supernatural lattice. This is the description that the literature uses.
  *Needs:* L1 `Supernatural`, L0 closed-subgroup theory, M `Subgroup.index`.
  *In Tau Ceti:* `Subgroup.profiniteIndex`, `Subgroup.profiniteIndex_apply_eq_iSup_openSubgroup`,
  which holds for every `H` by the closure invariance below.
  *Source:* Ribes–Zalesskii §2.3.
  Both sides depend only on the closure of `H`, so two further statements come first:
  `profiniteIndex H G = profiniteIndex (closure H) G`, and
  `profiniteIndex H G = 1 ↔ closure H = ⊤`. For closed `H` the second is
  `profiniteIndex H G = 1 ↔ H = ⊤`.
  ⚠ Closedness is a hypothesis of Lagrange and of every statement that treats `H` as a
  profinite group in its own right. It is not needed for the two statements just above, and
  a dense proper subgroup is not a counterexample to them: its image in every finite
  quotient is everything, so both sides are `1`.
- **Index API.** All of the following, which later layers use:
  - invariance under a topological isomorphism of the pair;
  - `profiniteIndex H G = 1` if and only if `H = ⊤`, for closed `H`;
  - multiplicativity in a tower of closed subgroups;
  - the image formula under a continuous surjection;
  - Lagrange: `profiniteOrder G = profiniteOrder H * profiniteIndex H G`;
  - agreement with `Subgroup.index` for open `H`, as
    `profiniteIndex H G = ofNat (H.index)`.
  *Needs:* L1 the two definitions above; M `Subgroup.index_mul_card`.
  *In Tau Ceti:* `Subgroup.profiniteIndex_topologicalClosure`, `Subgroup.profiniteIndex_eq_one_iff`,
  `Subgroup.profiniteOrder_eq_mul_profiniteIndex`, `OpenSubgroup.profiniteIndex_eq_ofNat_index`.
  *Source:* Ribes–Zalesskii §2.3, Prop. 2.3.2 for Lagrange.
  **Checks.**
  - `profiniteOrder C₆` has exponents `(v₂, v₃) = (1, 1)`, the factorization of `6`; a
    definition by the supremum of the orders themselves agrees here but has no value on `ℤ_p`,
    whose order is `p^∞` (exponent `∞` at `p`, `0` elsewhere).
  - `profiniteOrder ℤ̂ = ∏_ℓ ℓ^∞` has infinite support, so a definition valued in `ℕ`, or in
    finitely supported exponent vectors, cannot express it.
  - `profiniteIndex (2ℤ₂) ℤ₂ = 2 = Subgroup.index`, while `profiniteIndex 1 ℤ₂ = 2^∞`, where
    `Subgroup.index` returns its junk value `0`; and the dense subgroup `ℤ ≤ ℤ₂` has
    `profiniteIndex = 1`, since its image in every finite quotient is everything.
  - Lagrange for `C₃ ≤ S₃`: exponents `(1, 1) = (0, 1) + (1, 0)`, that is `6 = 3 · 2`.
- **Pro-`p` in supernatural terms.** `G` is pro-`p` if and only if `profiniteOrder G` is
  supported at `p`. `H` is open if and only if it is closed of
  natural-number index.
  *Needs:* L1 order and index; L0 open-versus-closed.
  *In Tau Ceti:* `TauCeti.isProP_iff_profiniteOrder_apply_eq_zero`.

#### Examples

- `profiniteOrder C₆ = 2 · 3`, `profiniteOrder ℤ_p = p^∞`, `profiniteOrder ℤ̂ = ∏_ℓ ℓ^∞`.
- `profiniteIndex (2ℤ₂) ℤ₂ = 2`, `profiniteIndex 1 ℤ₂ = 2^∞`, and the dense `ℤ ≤ ℤ₂` has index `1`.

#### Dependencies

Layer 0 (closed subgroups, quotients); Mathlib `Nat.card`, `Subgroup.index`, `OpenNormalSubgroup`;
Tau Ceti `TauCeti.Supernatural`.

### Layer 2: profinite Sylow theory

- **Definition.** `IsProPSylow p P` says that `P` is closed, is pro-`p` in the subspace
  topology, and has index prime to `p`, in the per-quotient form of Tau Ceti's definition. The
  supernatural form `¬ p ∣ profiniteIndex P G` is proved equivalent to it here.
  *Needs:* L1 index, L0 closed subgroups, M `IsPGroup`.
  *In Tau Ceti:* `TauCeti.IsProPSylow`, with `TauCeti.isProPSylow_iff`, the projections
  `TauCeti.IsProPSylow.isClosed`, `isProP` and `not_dvd_index`,
  `TauCeti.isProPSylow_iff_isClosed_and_isProP_and_not_dvd_profiniteIndex`, and
  `TauCeti.isProPSylow_iff_exists_sylow_eq` on a finite group.

  API checklist for `IsProPSylow`:
  - Constructors: from a compatible family of Sylow subgroups of the finite quotients; from
    a maximal closed pro-`p` subgroup.
  - Examples: `P = ⊤` when `G` is pro-`p`; the `p`-Sylow subgroup of `ℤ̂`, which is `ℤ_p`.
  - Morphisms: the inclusion `P ≤ G` as a closed embedding of profinite groups.
  - Functoriality: the image under a continuous surjection is `p`-Sylow.
  - Comparison lemmas: the per-quotient form and the supernatural form agree; on a finite
    group the predicate agrees with Mathlib's `Sylow`.
  - Naturality: conjugation by `g` takes `p`-Sylow subgroups to `p`-Sylow subgroups, and the
    correspondence commutes with continuous surjections.
  - Edge cases: `p` not dividing the order, where `P = 1`; the trivial group.
  - Downstream interfaces: the abstract existence, conjugacy, containment, uniqueness, and
    surjective-image theorems; `LocalGaloisGroups` is an arithmetic consumer.

  **Checks.**
  - `S₃` at `p = 2`: `C₂ = ⟨(12)⟩` is closed, a `2`-group, of index `3`, so it is `2`-Sylow,
    with three conjugates. A definition that drops the index condition also accepts `1`.
  - `S₃` at `p = 3`: `C₃` has index `2`, is normal, and is the unique `3`-Sylow subgroup.
  - `1 ≤ S₃` at `p = 2` is pro-`2` of index `6`, divisible by `2`: not Sylow. At `p = 5` the
    same subgroup has index `6`, prime to `5`, and is the `5`-Sylow subgroup, the absent-prime
    case; in the trivial group `1` is `p`-Sylow for every `p`.
  - In `ℤ̂ = ∏_ℓ ℤ_ℓ`, the factor `ℤ_p` has index `∏_{ℓ ≠ p} ℓ^∞`, prime to `p`, so it is
    `p`-Sylow; `ℤ̂` itself is not pro-`p`, and `pℤ_p × ∏_{ℓ ≠ p} ℤ_ℓ` has index `p`.
- **Existence.** Every profinite group has a `p`-Sylow subgroup. Route: the sets of Sylow
  `p`-subgroups of the finite quotients form a surjective inverse system of nonempty finite
  sets, so the Layer 0 compactness lemma applies.
  *Needs:* L0 compactness lemma; M `Sylow.exists_subgroup_card_pow_prime`, M `Sylow`.
  *In Tau Ceti:* `TauCeti.exists_isProPSylow`.
  *Source:* Ribes–Zalesskii Cor. 2.3.6.
- **Conjugacy and the poset.** Any two `p`-Sylow subgroups are conjugate, by the same
  inverse-limit argument over the finite sets of conjugating elements. Every closed pro-`p`
  subgroup lies in a `p`-Sylow subgroup. A pro-`p` subgroup of index prime to `p` is maximal
  pro-`p`, and a maximal closed pro-`p` subgroup is `p`-Sylow. A normal `p`-Sylow subgroup
  is unique.
  *Needs:* L2 existence; L0 compactness lemma; M `Sylow.isPretransitive_of_finite` (Sylow's second
  theorem on each finite quotient).
  *In Tau Ceti:* `TauCeti.IsProPSylow.exists_map_conj_eq`, `TauCeti.IsProP.exists_le_isProPSylow`
  (with no closedness hypothesis), `TauCeti.IsProPSylow.eq_of_le`,
  `TauCeti.isProPSylow_iff_isProP_and_maximal`, `TauCeti.IsProPSylow.eq_of_normal`.
  *Source:* Ribes–Zalesskii §2.3.
- **Functoriality.** The image of a `p`-Sylow subgroup under a continuous surjection is
  `p`-Sylow. The `p`-Sylow subgroup of an inverse limit is the inverse limit of `p`-Sylow
  subgroups. Both statements are intrinsic to profinite groups. `LocalGaloisGroups` may
  consume them when assembling its arithmetic examples.
  *Needs:* L2 existence and conjugacy; L0 inverse limits.
  *In Tau Ceti:* `TauCeti.IsProPSylow.map_of_surjective`, `TauCeti.SylowFamily.equivIsProPSylow`.
- **Open subgroups above a Sylow subgroup.** An open subgroup `U` that contains a `p`-Sylow
  subgroup `P` has index prime to `p` (`IsProPSylow.not_dvd_index_of_le`). For an open normal
  `N ≤ U`, `[G : U] = [G/N : U/N]` divides `[G/N : PN/N]`, which is prime to `p` by the
  per-quotient clause `TauCeti.IsProPSylow.not_dvd_index`. Layer 6 feeds these indices to
  `cor ∘ res = [G : U]`.
  *Needs:* L2 definition; M `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one`,
  M `Subgroup.index_map_eq`, M `Subgroup.index_dvd_of_le`.
- **Worked instances.** Every `p`-Sylow subgroup of `ℤ̂` is
  topologically isomorphic to `ℤ_p`. This is stated here and proved in Layer 4, where the
  universal properties it
  uses are available. Its proof does **not** use a product decomposition `ℤ̂ ≅ ∏_ℓ ℤ_ℓ`,
  which is not a target of this roadmap.
  *Needs:* L2 existence; L4 the rank-one identification chain.
  *In Tau Ceti:* `TauCeti.IsProPSylow.continuousMulEquivPadicInt`.

#### Examples

- `S₃`: the `2`-Sylow subgroups are the three `⟨(ij)⟩`, the `3`-Sylow subgroup is `A₃`, and the
  `5`-Sylow subgroup is `1`.
- `ℤ̂`: the `p`-Sylow subgroup is `ℤ_p`, unique because `ℤ̂` is abelian.

#### Dependencies

Layers 0 and 1; Mathlib `IsPGroup`, `Sylow`. The worked instance on `ℤ̂` also uses the rank-one
identification of Layer 4; no other statement of this layer does.

### Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation

- **The `IsProP` API.** Stability under closed subgroups, under quotients by closed normal
  subgroups, under finite products, under inverse limits, and under extensions: a compact group
  that maps onto a Hausdorff pro-`p` group by a continuous surjection with pro-`p` kernel is
  pro-`p` (TC `TauCeti.IsProP.of_ker_isProP`), because the image of an open normal subgroup is
  open and each finite quotient is then an extension of finite `p`-groups. The equivalence
  milestone: a profinite group is pro-`p` if and only if it is continuously isomorphic to a
  limit of finite `p`-groups.
  *Needs:* M `IsPGroup`, M `IsPGroup.comap_of_ker_isPGroup`, M `ProfiniteGrp.ofFiniteGrp`, M
  `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor`; L0 quotients.
  *In Tau Ceti:* `TauCeti.IsProP` with `TauCeti.isProP_iff`, `IsPGroup.isProP`,
  `TauCeti.IsProP.of_surjective`, `TauCeti.IsProP.quotient`, `TauCeti.IsProP.subgroup`,
  `TauCeti.IsProP.prod`, `TauCeti.IsProP.pi`, `TauCeti.IsProP.limit`,
  `TauCeti.isProP_iff_exists_continuousMulEquiv_limit`, `TauCeti.IsProP.of_ker_isProP`,
  `TauCeti.isProP_congr`, `TauCeti.isProP_iff_isPGroup`.

  API checklist for `IsProP`:
  - Constructors: from the quotient form; from a presentation as a limit of finite
    `p`-groups; from `IsPGroup` on a finite discrete group.
  - Examples: `ℤ_p`; `ℤ/p^n`; `freeProP p (Fin n)`; `D₀` of Layer 6.
  - Morphisms: continuous homomorphisms between pro-`p` groups; no extra structure.
  - Functoriality: the property passes to closed subgroups, to quotients by closed normal
    subgroups, to finite products, to limits and to extensions.
  - Comparison lemmas: pro-`p` if and only if the supernatural order is a power of `p`
    (Layer 1); pro-`p` if and only if `proPKernel p G = ⊥`.
  - Naturality: the property is invariant under topological isomorphism.
  - Edge cases: the trivial group is pro-`p` for every `p`; a finite discrete `p`-group is
    pro-`p`; a profinite group that is pro-`p` for two different primes is trivial. Without
    compactness this fails: the connected group `ℝ` has no proper open subgroup, so it is
    pro-`p` for every `p`.
  - Downstream interfaces: closed-subgroup and quotient constructions in later layers.

  **Checks.**
  - `C₄` at `p = 2`: its quotients by open normal subgroups are `C₄`, `C₂`, `1`, all
    `2`-groups, so it is pro-`2`; `C₆` has the quotient `C₃` and is not.
  - `ℤ_p` is pro-`p`; `ℤ̂` is not, because of the quotient `ℤ/ℓ` for `ℓ ≠ p`.
  - The discrete direct sum `⊕_ℕ C₂` satisfies the predicate and is not compact, so the
    predicate does not imply profiniteness; the compact product `∏_ℕ C₂` is pro-`2` and
    profinite.
- **The maximal pro-`p` quotient.** `proPKernel p G` is the intersection of the open normal
  subgroups with `p`-group quotient. It is closed, normal, characteristic for continuous
  automorphisms, and preserved by continuous homomorphisms. Then
  `maximalProPQuotient p G := G ⧸ proPKernel p G`, which is pro-`p`, by the compactness
  argument that an open normal subgroup containing the kernel already contains a member of
  the defining family. State its quotient map, its universal property, its idempotence on
  pro-`p` groups, and its functoriality once, here.
  *Needs:* L0 quotients and closed subgroups; M `OpenNormalSubgroup`; M `IsPGroup`.
  *In Tau Ceti:* `TauCeti.proPKernel`, `TauCeti.maximalProPQuotient` with `mk`, `map`, `lift`,
  `equivOfIsProP` and `idempotentEquiv`; `TauCeti.isClosed_proPKernel`,
  `TauCeti.map_proPKernel_eq`, `TauCeti.isProP_maximalProPQuotient`,
  `TauCeti.existsUnique_continuousMonoidHom_maximalProPQuotient`,
  `TauCeti.proPKernel_eq_bot_iff`, `TauCeti.proPKernel_eq_top_iff`.

  API checklist for `maximalProPQuotient`:
  - Constructors: the quotient map `G ↠ G(p)`; the induced map for a continuous
    homomorphism.
  - Examples: `maximalProPQuotient p ℤ̂ ≅ ℤ_p` (Layer 4); `maximalProPQuotient p G = G` for
    pro-`p` `G`.
  - Morphisms: continuous homomorphisms to a pro-`p` group factor uniquely through it.
  - Functoriality: functorial in `G` for continuous homomorphisms; idempotent.
  - Comparison lemmas: `proCKernel (finiteGroupClassP p) G = proPKernel p G` (Layer 4).
  - Naturality: the factorization is natural in both the source and the target.
  - Edge cases: `proPKernel p G = ⊤` when `G` has no `p`-group quotient, so `G(p)` is
    trivial; a prime that does not divide the order.
  - Downstream interfaces: `LocalGaloisGroups` applies this universal quotient to an
    absolute Galois group; the resulting arithmetic carrier is defined there.

  **Checks.**
  - `S₃` at `p = 2`: `proPKernel = C₃` and the quotient is `C₂`; at `p = 3`: `proPKernel = S₃`
    and the quotient is `1`, because the abelianization of `S₃` is `C₂`. Reading `G(p)` as a
    Sylow subgroup gives `C₂` and `C₃` instead.
  - `ℤ̂` at `p`: the kernel is `∏_{ℓ ≠ p} ℤ_ℓ` and the quotient is `ℤ_p`.
  - `A₅` is perfect, so `proPKernel p A₅ = A₅` and `A₅(p) = 1` for every `p`, although each of
    `2, 3, 5` divides `60`; for `ℤ_p`, `proPKernel p ℤ_p = 1`.
- **The pro-`p` kernel has no `p`-quotient.** For profinite `G` and `N = proPKernel p G`, the
  maximal pro-`p` quotient of `N` is trivial: `proPKernel p N = ⊤`
  (`proPKernel_proPKernel_eq_top`). Equivalently, `N` has no nontrivial continuous finite
  `p`-group quotient; in particular it admits no continuous surjection onto `ℤ/p`. The open
  normal subgroups of `N` need not come from open normal subgroups of `G`, so this is a theorem
  and not the definition. `Suggested.lean` proves it from Tau Ceti's API in three steps:
  1. `K = proPKernel p N` is closed in `N`, hence in `G`, and every continuous endomorphism of
     `N` carries it into itself (`TauCeti.map_proPKernel_le`); conjugation by an element of `G`
     restricts to a continuous endomorphism of the normal subgroup `N`, so `K` is normal in `G`;
  2. `G ⧸ K` is profinite (`TauCeti.QuotientGroup.instTotallyDisconnectedSpace`) and maps onto
     the pro-`p` group `G ⧸ N = maximalProPQuotient p G`, with kernel the image of `N`. That
     image is a continuous image of the pro-`p` group `N ⧸ K = maximalProPQuotient p N`, hence
     pro-`p` (`TauCeti.IsProP.of_surjective`). By closure under extensions
     (`TauCeti.IsProP.of_ker_isProP`), `G ⧸ K` is pro-`p`;
  3. the universal property of the maximal pro-`p` quotient, applied to `G → G ⧸ K`, gives
     `N = proPKernel p G ≤ K`, that is `K = ⊤` in `N`.

  `LocalGaloisGroups` applies it to an absolute Galois group, where it kills `H¹` of the kernel
  with finite `p`-primary coefficients on which the kernel acts trivially.
  *Needs:* L0 closed subgroups and quotients; L3 the `IsProP` API, including closure under
  extensions, and the maximal pro-`p` quotient: closedness, functoriality, pro-`p`-ness and
  the universal property; TC `TauCeti.IsProP.of_ker_isProP`, `TauCeti.IsProP.of_surjective`,
  `TauCeti.isClosed_proPKernel`, `TauCeti.map_proPKernel_le`,
  `TauCeti.QuotientGroup.instTotallyDisconnectedSpace`, `TauCeti.isProP_maximalProPQuotient`,
  `TauCeti.proPKernel_le_ker`.
- **Topological generation and rank.** First the generation API through
  `Subgroup.topologicalClosure`, the predicate `IsTopologicallyFinitelyGenerated`, and the
  statement that generation passes along continuous surjections. Then the convergence
  predicate `ConvergesToOne`, with:
  - finite sets converge to `1`;
  - a subset of a converging set converges to `1`;
  - a continuous image of a converging set converges to `1`;
  - **every profinite group has a generating set that converges to `1`**, so that
    `topologicalGeneratorRank` is an infimum over a nonempty family.

  Then the rank itself, with:
  - monotonicity under continuous surjections out of a profinite group;
  - invariance under topological isomorphism;
  - finiteness of the cardinal exactly under `IsTopologicallyFinitelyGenerated`;
  - the accessor `topologicalGeneratorRankNat G h`, with
    `(topologicalGeneratorRankNat G h : Cardinal) = topologicalGeneratorRank G`, and proof
    irrelevance in `h`.
  *Needs:* L0 open normal subgroups; M `Subgroup.topologicalClosure`; M `Cardinal`.
  *In Tau Ceti:* `TauCeti.IsTopologicallyFinitelyGenerated` with
  `TauCeti.IsTopologicallyFinitelyGenerated.of_surjective`, `TauCeti.ConvergesToOne`,
  `TauCeti.exists_convergesToOne_topologicallyGenerates`, `TauCeti.topologicalGeneratorRank`,
  `TauCeti.topologicalGeneratorRankNat`, `TauCeti.topologicalGeneratorRank_le_of_surjective`,
  `TauCeti.topologicalGeneratorRank_congr`, `TauCeti.topologicalGeneratorRank_lt_aleph0_iff`,
  `TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank`.
  *Source:* Ribes–Zalesskii Prop. 2.6.2 for the existence of a converging generating set.
  ⚠ Monotonicity needs a profinite source. For a group with no generating set converging to
  `1` the infimum defining the rank is empty and the rank is `0`, so the identity from `ℚ` with
  the discrete topology onto `ℚ` with the real topology, a continuous surjection from a group of
  rank `0` onto one of rank `ℵ₀`, is a counterexample to the unrestricted statement.

  API checklist for `topologicalGeneratorRank`:
  - Constructors: from a converging generating set; from the finite accessor.
  - Examples: `d(ℤ_p) = 1`; `d(freeProP p (Fin n)) = n`; `d(∏_{i ∈ ℕ} ℤ/p) = ℵ₀`.
  - Morphisms: continuous surjections do not raise the rank.
  - Functoriality: monotone under continuous surjections; invariant under topological
    isomorphism.
  - Comparison lemmas: agreement with `topologicalGeneratorRankNat`; agreement with
    `Group.rank` on a finite discrete group; the identity with `dim_{𝔽_p} Hom_cont(G, 𝔽_p)`
    for pro-`p` `G`.
  - Naturality: the rank of a quotient is at most the rank of the group, compatibly with
    composition of surjections.
  - Edge cases: the trivial group has rank `0`; an infinite-rank group, where the accessor
    is unavailable; the difference from the unrestricted notion, which the convention above
    records.
  - Downstream interfaces: the Schreier bound below and the Euler formulas of Layers 6 and 7.

  **Checks.**
  - `d(C_p × C_p) = 2 = dim_{𝔽_p} Hom_cont(C_p², 𝔽_p)`, and `d(1) = 0`.
  - `d(ℤ_p) = 1`, while `ℤ_p` as an abstract group is uncountable and needs uncountably many
    generators: a definition by abstract generation gets the wrong value.
  - `d(∏_ℕ C_p) = ℵ₀`, the coordinate vectors converging to `1`; a `ℕ`-valued definition has no
    value, which is why `topologicalGeneratorRankNat` needs finite generation.
- **Open subgroups of each index, and countability.** A topologically finitely generated
  profinite group has finitely many open subgroups of each index, because it has finitely
  many continuous maps to each finite group. Four consequences are proved here:
  - the set of open subgroups is countable;
  - the set of open normal subgroups is countable;
  - there is a descending sequence `(N_k)` of open normal subgroups, cofinal among them;
  - hence the sequential form of the Layer 0 compactness lemma holds.

  Layer 8 uses the sequential form. Prefer the general form wherever it is enough.
  *Needs:* L3 `IsTopologicallyFinitelyGenerated`; L0 compactness lemma.
  *In Tau Ceti:* `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq`,
  `countable_openSubgroup`, `countable_openNormalSubgroup` and
  `exists_antitone_openNormalSubgroup_cofinal`, in that namespace.
- **The Schreier bound.** An open subgroup `U` of a topologically finitely generated
  profinite group is topologically finitely generated, with
  `d(U) ≤ 1 + [G : U](d(G) - 1)` in natural numbers.
  *Needs:* L3 rank; M `Subgroup.index`.
  *In Tau Ceti:* `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup`,
  `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`.
  ⚠ Compactness of `G` is used: it makes the index finite. In `ℤ³` with the discrete topology,
  `ℤ² × 0` is open of infinite index, whose natural-number index is `0`, and needs two generators.
  *Source:* Ribes–Zalesskii Cor. 3.6.3. Layer 6 proves equality in the free case.
- **Hopf property.** A continuous surjective endomorphism of a topologically finitely
  generated profinite group is an isomorphism. This is the last step of
  every two-sided comparison in Layer 8.
  *Needs:* L3 finitely many open subgroups of each index; L0 compactness.
  *In Tau Ceti:* `TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective`.
  *Source:* Ribes–Zalesskii Prop. 2.5.2.
  ⚠ False without finite generation: an infinite product of copies of a finite group admits
  a continuous surjective endomorphism that is not injective, namely the shift.
- **Gaschütz lifting.** Along a continuous surjection of profinite groups, an `n`-tuple that
  topologically generates the target lifts to an `n`-tuple that topologically generates the
  source, provided the source is topologically generated by `n` elements. Corollary: for a quotient map whose kernel lies in `Φ(G)`, generators
  lift.
  *Needs:* L3 generation API; L0 compactness lemma.
  *In Tau Ceti:* `TauCeti.exists_comp_eq_and_topologicalClosure_closure_range_eq_top`.
  *Source:* Ribes–Zalesskii Prop. 2.5.4.
- **Frattini theory for pro-`p` groups.** For pro-`p` `G`, a maximal open subgroup is normal
  of index `p`; the finite input is that a maximal subgroup of a finite `p`-group is normal
  of index `p`. `proPFrattini p G`, in the index-`p` form, is closed, normal and
  characteristic, and it equals both the intersection of the maximal open subgroups and
  `closure (Gᵖ[G,G])`. The Frattini quotient `G/Φ(G)` is elementary
  abelian, hence an `𝔽_p`-vector space.
  *Needs:* M `frattini`, M `IsPGroup.isCoatom_iff_index_eq_prime` (a maximal subgroup of a
  finite `p`-group has index `p`, under `Group.IsNilpotent`, which M `IsPGroup.isNilpotent`
  supplies) and the finite Frattini lemmas; L3 `IsProP` API; L0 quotients.
  *In Tau Ceti:* `TauCeti.proPFrattini` with `TauCeti.isClosed_proPFrattini`,
  `ContinuousMulEquiv.map_proPFrattini_eq`, `TauCeti.proPFrattini_eq_topologicalClosure`,
  `TauCeti.IsProP.proPFrattini_eq_iInf_isCoatom`, `TauCeti.IsProP.normal_of_isCoatom`,
  `IsPGroup.proPFrattini_eq_frattini`.

  API checklist for `proPFrattini`:
  - Constructors: the index-`p` definition; the verbal description `closure (Gᵖ[G,G])`.
  - Examples: `Φ(ℤ_p) = pℤ_p`; `Φ(freeProP p (Fin n))` with quotient `(ℤ/p)^n`;
    `Φ((ℤ/p)^n) = 1`.
  - Morphisms: the quotient map to the Frattini quotient, as a map of `𝔽_p`-vector spaces.
  - Functoriality: a continuous surjection sends `Φ(G)` onto `Φ(H)`; every continuous
    endomorphism preserves `Φ(G)`.
  - Comparison lemmas: the two descriptions agree; on a finite `p`-group the object agrees
    with Mathlib's `frattini`.
  - Naturality: the Frattini quotient functor commutes with continuous surjections.
  - Edge cases: `Φ(G) = G` is impossible for nontrivial pro-`p` `G`; the abstract `frattini`
    differs when `G` is not finitely generated.
  - Downstream interfaces: Burnside below and the abstract rank formulas.

  **Checks.**
  - `Q₈`: the three index-`2` subgroups `⟨i⟩, ⟨j⟩, ⟨k⟩` meet in `{±1}`, so `Φ(Q₈) = {±1}` and
    `Q₈/Φ = C₂²`, rank `2`. The commutator-only model `closure [G, G]` also gives `{±1}` here
    and is separated on `C₄` below.
  - `C₄`: `Φ = 2C₄ = C₂` from both the index-`2` form and the verbal form `Gᵖ[G,G]`; the
    commutator-only model gives `1`.
  - `ℤ_p`: `Φ = pℤ_p`, the unique open subgroup of index `p`; `C_p^n`: `Φ = 1`.
- **Burnside basis theorem.** A subset generates `G` topologically if and only if its image
  generates `G/Φ(G)` topologically. The closure on the quotient side is needed: at infinite
  rank the image of a generating set spans only a dense subspace. Two further forms:
  - a closed subgroup that lies in no open normal subgroup of index `p` is the whole group;
  - a continuous homomorphism that is surjective onto every index-`p` quotient is
    surjective.

  The rank identity is proved first as an identity of cardinals, with no finiteness
  hypothesis, against the discrete dual:
  `topologicalGeneratorRank G = Module.rank (ZMod p) (Hom_cont(G/Φ(G), 𝔽_p))`, where
  `Hom_cont(G/Φ(G), 𝔽_p) = Hom_cont(G, 𝔽_p)` is a discrete `𝔽_p`-vector space. Then `G` is
  topologically finitely generated if and only if `G/Φ(G)` is finite, and in that case
  `topologicalGeneratorRankNat G h = Module.finrank (ZMod p) (G/Φ(G))`.
  *Needs:* L3 Frattini theory, L3 rank and `ConvergesToOne`; M `Module.rank`, M
  `Module.finrank`.
  *In Tau Ceti:* `TauCeti.topologicallyGenerates_iff_frattiniQuotient`,
  `TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq`,
  `TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq`,
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`,
  `TauCeti.IsProP.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini`,
  `TauCeti.IsProP.topologicalGeneratorRankNat_eq_finrank_quotient_proPFrattini`,
  `TauCeti.IsProP.natCard_quotient_proPFrattini`.
  *Source:* Ribes–Zalesskii Prop. 2.8.7 and §2.8; NSW (3.9.1).
  Proof note for the cardinal identity. A continuous functional vanishes on all but finitely
  many members of a converging set. So restriction embeds the dual in the finitely supported
  functions on that set, which bounds the dimension of the dual by the cardinality of the
  set. The dual basis of a converging basis gives the other inequality.
  ⚠ **Abstract generation and topological generation are different.** Every statement here
  is about topological generation, and the two do not agree numerically: `ℤ_p` is
  topologically generated by `1`, but it is uncountable, so it is not finitely generated as an
  abstract group. What the Frattini quotient gives is the identity of the topological generator
  rank with the dimension of the continuous dual `Hom_cont(G, 𝔽_p)`, and with
  `dim_{𝔽_p} G/Φ(G)` when that quotient is finite; for a finite `p`-group, where topological and
  abstract generation coincide, this is Burnside's basis theorem.

#### Examples

- `S₃(2) = C₂`, `S₃(3) = 1`, `ℤ̂(p) = ℤ_p`, `A₅(p) = 1` for every `p`.
- `Φ(Q₈) = {±1}`, `d(Q₈) = 2`; `d(ℤ_p) = 1`; `d(∏_ℕ C_p) = ℵ₀`.

#### Dependencies

Layers 0 to 2; Mathlib `frattini`, `IsPGroup.isCoatom_iff_index_eq_prime`, `IsPGroup.isNilpotent`;
the Tau Ceti carriers of the alias table.

### Layer 4: free pro-`p` and pro-`C` groups on finite sets

- **The class `C` as a structure.** `FiniteGroupClass` with the fields listed in the
  conventions, the derived theorem on finite products, and the `Shrink` resizing policy.
  From it: `proCKernel C G`, which is closed, normal and characteristic, with the API of
  `proPKernel`; `proCCompletion C G := G ⧸ proCKernel C G` with its universal property; and
  the instantiation `finiteGroupClassP p`, with
  `proCKernel (finiteGroupClassP p) G = proPKernel p G`. Every pro-`C` statement below is
  about this structure, and there is no per-class construction.
  *Needs:* L3 `proPKernel` API; M `Shrink`; M `IsPGroup`.
  *In Tau Ceti:* `TauCeti.FiniteGroupClass` with `TauCeti.FiniteGroupClass.MemFinite`,
  `TauCeti.finiteGroupClassP`, `TauCeti.proCKernel`, `TauCeti.IsProC`, `TauCeti.proCCompletion`,
  `TauCeti.isProC_finiteGroupClassP_iff`, `TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel`.

  API checklist for `FiniteGroupClass`:
  - Constructors: `finiteGroupClassP p`; the class of all finite groups; the class of finite
    solvable groups. ⚠ The class of finite nilpotent groups is **not** an example: it is not
    closed under extensions, because `1 → C₃ → S₃ → C₂ → 1` has nilpotent kernel and
    quotient while `S₃` is not nilpotent.
  - Examples: finite `p`-groups, where `proCCompletion` is `maximalProPQuotient`.
  - Morphisms: none between classes is needed; inclusion of classes is a predicate on `mem`.
  - Functoriality: `proCKernel C` is preserved by continuous homomorphisms, and
    `proCCompletion C` is functorial and idempotent.
  - Comparison lemmas: `mem_congr` transports membership along a group isomorphism;
    `Shrink` transports it between universes; `proCKernel (finiteGroupClassP p) = proPKernel p`.
  - Naturality: the universal property of `proCCompletion` is natural in `G`.
  - Edge cases: the class that contains only the trivial group, where the completion is
    trivial; a class that is not closed under extensions, which is why that field exists.
  - Downstream interfaces: `freeProC`, and Layer 10's free object on a profinite space.

  **Checks.**
  - `finiteGroupClassP 2` contains `C₄` and `Q₈` and not `C₃` or `S₃`.
  - The finite nilpotent groups contain `C₃` and `C₂` but not their extension `S₃`, so a
    structure without the extension field would admit them as a class.
  - For the class `{1}` the completion of `ℤ̂` is `1`; for the class of all finite groups the
    completion of the discrete group `ℤ` is `ℤ̂`; for `finiteGroupClassP p` it is `ℤ_p`.
- **Construction of the free objects.**
  - `freeProfiniteGroup X := profiniteCompletion (FreeGroup X)`, the free profinite group,
    with its generators and its universal property;
  - `presentedProfiniteGroup X rels`, the quotient of `freeProfiniteGroup X` by the closed
    normal closure of a set of relators;
  - `freeProC C X := proCCompletion C (freeProfiniteGroup X)`;
  - `freeProP p X := maximalProPQuotient p (freeProfiniteGroup X)`.

  The pro-`p` quotient is taken directly, because `proPKernel` and
  `proCKernel (finiteGroupClassP p)` are cut out by different index sets and agree by a
  short theorem, not by unfolding. That theorem,
  `freeProC (finiteGroupClassP p) X ≅ freeProP p X`, is the first milestone here, and after
  it no statement has to choose between the two constructions. The profinite objects
  `freeProfiniteGroup` and `presentedProfiniteGroup` remain part of the abstract exported
  presentation API.
  *Needs:* M `ProfiniteGrp.profiniteCompletion`, M `FreeGroup`; L3 `maximalProPQuotient`;
  L4 `FiniteGroupClass`.
  *In Tau Ceti:* `TauCeti.freeProfiniteGroup`, `TauCeti.freeProC`, `TauCeti.freeProP`, each with
  `of`; `TauCeti.presentedProfiniteGroup` and `TauCeti.presentedProP`, each with `mk` and `of`;
  `TauCeti.freeProC.equivFreeProP`.

  API checklist for `freeProP`:
  - Constructors: `freeProP.of` on generators; the lift of a map `X → P` into a pro-`p`
    group `P`.
  - Examples: `freeProP p (Fin 0) ≅ 1`; `freeProP p (Fin 1) ≅ ℤ_p`; `freeProP 2 (Fin 3)`,
    the source of the relator `A²S⁴(S,Y)`.
  - Morphisms: continuous homomorphisms out of it are exactly maps on generators; the
    quotient maps to presented groups.
  - Functoriality: a map `X → Y` induces a continuous homomorphism, functorially; a
    surjection of generating sets gives a surjection of groups.
  - Comparison lemmas: agreement with `freeProC (finiteGroupClassP p) X`; agreement with the
    pro-`p` completion of the discrete free group; `FreeGroup X → freeProP p X` is
    injective.
  - Naturality: the universal property is natural in `X` and in the target.
  - Edge cases: the empty generating set; a one-element generating set, which gives `ℤ_p`;
    an infinite generating set, where the rank is **not** `#X` and Layer 10 applies.
  - Downstream interfaces: presentations in Layer 5, the tower of Layer 8, the normal forms
    of Layer 9.

  **Checks.**
  - Continuous homomorphisms `freeProP 2 (Fin 2) → C₂` number `2² = 4`, one per assignment of
    the generators; to `C₃` there is only the trivial one, while the free profinite group on two
    generators has `3² = 9`.
  - `freeProP p (Fin 1) ≅ ℤ_p`; the free profinite group on one generator is `ℤ̂`, so the wrong
    construction is detected already in rank one.
  - `freeProP p (Fin n)` has Frattini quotient `(ℤ/p)^n`, so `d = n`, and `H²(−, 𝔽_p) = 0`.
- **Universal property.** A map `X → P` into a profinite group `P` in the class `C` extends
  uniquely to a continuous homomorphism. The free object is unique up to unique isomorphism,
  and it is functorial in `X`. The universal properties are used under their Tau Ceti names, as
  continuous homomorphisms into a target in the universe of the generators;
  `freeProfiniteGroup.existsUnique_lift` states the free profinite one on morphisms of
  `ProfiniteGrp`.
  *Needs:* L4 construction; M `ProfiniteGrp.ProfiniteCompletion.lift`.
  *In Tau Ceti:* `TauCeti.freeProfiniteGroup.lift`, `lift_of`, `lift_unique`, `existsUnique_lift`,
  `hom_ext`, `map` and `existsUnique_continuousMulEquiv`, and the same names in the namespaces
  `TauCeti.freeProC` and `TauCeti.freeProP`.
- **Basics.** `freeProP p X` is pro-`p`. For finite `X` it is topologically finitely
  generated, of rank `#X`, through the Frattini quotient `(ℤ/p)^X` of
  Layer 3, with the natural-number form
  `topologicalGeneratorRankNat (freeProP p (Fin n)) h = n`. The generators are a basis: free
  groups are residually `p`, so `FreeGroup X → freeProP p X` is injective.
  *Needs:* L3 Burnside; L4 universal property; M `FreeGroup`.
  *In Tau Ceti:* `TauCeti.isProP_freeProP`, `TauCeti.isTopologicallyFinitelyGenerated_freeProP`,
  `TauCeti.topologicalGeneratorRank_freeProP`, `TauCeti.topologicalGeneratorRankNat_freeProP`,
  `TauCeti.freeProP.fromFreeGroup_injective`.
  *Source:* the residual `p`-finiteness of free groups; the argument uses the finite
  upper-triangular representations, or the lower `p`-series of the discrete free group.
  ⚠ For infinite `X` the rank of `freeProP p X` is **not** `#X`. Its continuous characters
  are all maps `X → 𝔽_p`, so the rank is `p^{#X}` by the Erdős–Kaplansky theorem. Layer 10
  states the free objects on infinite bases, on a profinite space.
- **Rank one and `ℤ_p`.** `freeProP p (Fin 0) ≅ 1`, and the rank-one identification is a
  chain of universal properties, each step a named theorem, with no product decomposition of
  `ℤ̂` anywhere:
  1. `maximalProPQuotient p (profiniteCompletion ℤ) ≅ lim_n ℤ/p^nℤ` as topological groups,
     because the open normal subgroups of `ℤ̂` with `p`-group quotient are the `p^nℤ̂`;
  2. `lim_n ℤ/p^nℤ ≅ ℤ_p`: Mathlib's `ℤ_[p]` with its `toZModPow` system is that inverse
     limit as a topological ring, hence as a topological group;
  3. `freeProP p (Fin 1) ≅ Multiplicative ℤ_[p]`: both objects represent the same functor,
     because a continuous homomorphism from either to a pro-`p` group `P` is an element of
     `P`, so the uniqueness of the free object gives the isomorphism;
  4. a closed subgroup `P ≤ ℤ̂` is `p`-Sylow if and only if
     `P ↪ ℤ̂ ↠ maximalProPQuotient p ℤ̂` is a topological isomorphism, which with steps 1
     and 2 proves the Layer 2 instance.

  Step 3 is what every later `ℤ_p`-coefficient argument cites, in particular the
  identification of the characters `Hom_cont(G, ℤ_pˣ)` in Layer 7.
  *Needs:* L3 `maximalProPQuotient`; L4 universal property; M `PadicInt.toZModPow`.
  *In Tau Ceti:* `TauCeti.zHat`, `TauCeti.zHat.maximalProPQuotientEquivPadicInt`,
  `TauCeti.zHat.maximalProPQuotientEquivZModPowLimit`, `TauCeti.freeProP.equivPadicInt`,
  `TauCeti.IsProPSylow.continuousMulEquivPadicInt`.

#### Finitely generated abelian pro-`p` groups

This subsection mentions no Demushkin group. Layer 7 cannot define `q(G)` without it, and
several Layer 9 module arguments use it. Ribes–Zalesskii §4.3 is the source of record.

- **Exponentiation by `ℤ_p`.** For abelian pro-`p` `A`, the continuous action
  `ℤ_p × A → A`, `(λ, a) ↦ a^λ`, is the inverse limit of exponentiation in the finite
  abelian `p`-quotients, where `ℤ_p` acts through `ℤ/p^n`. Well-definedness is the
  compatibility of those actions, and continuity is the limit topology.
  *Needs:* L0 inverse limits; L3 `IsProP` API; M `ZMod.intCast_cast` and `PadicInt.toZModPow`.
  *In Tau Ceti:* `TauCeti.IsProP.padicPow`, on every pro-`p` group, with `padicPow_one`,
  `padicPow_add`, `padicPow_mul`, `padicPow_natCast` and `continuous_padicPow`.
  On a nonabelian pro-`p` group it is the power of a single element, inside the procyclic
  closure of that element (`padicPow_mem`), natural under continuous homomorphisms
  (`map_padicPow`), and not a scalar action on the group. The `q = 2` normal-form words of
  Layer 9 use it in the free pro-`2` group, for their exponents `2 + α` with `α ∈ 4ℤ₂` and `2^f`
  with `f = ∞` allowed.
- **The `ℤ_p`-module structure.** `A` becomes a topological `ℤ_p`-module, functorially in
  continuous homomorphisms of abelian pro-`p` groups. Closed subgroups and quotients are
  submodules and quotient modules. A continuous group homomorphism between abelian pro-`p`
  groups is automatically `ℤ_p`-linear.
  *Needs:* L4 exponentiation; M `Module`.
- **Compact `ℤ_p`-modules.** A topologically finitely generated abelian pro-`p` group is a
  finitely generated `ℤ_p`-module, and the two notions of generation agree. The full
  equivalence of categories is not a target.
  *Needs:* L4 module structure; L3 rank.
- **Structure theorem.** `A ≅ ℤ_p^r × T` as topological `ℤ_p`-modules, with `T` a finite
  abelian `p`-group. The number `r` and the elementary divisors of `T` are unique. `T` is
  the torsion subgroup of `A`; it is closed always, and open when `r = 0`.
  *Needs:* L4 compact modules; M the structure theorem for finitely generated modules over a
  principal ideal domain, `Module.equiv_free_prod_directSum` and the `ℤ_[p]` PID instance.
  *In Tau Ceti:* `TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`.
  *Source:* Ribes–Zalesskii §4.3.
  ⚠ The theorem needs topological finite generation. `∏_{i ∈ ℕ} ℤ/p` is abelian pro-`p` and
  is not of this shape.
- **The pro-`p` completion of `ℤ`, as a module statement.** The universal-property proof
  that `freeProP p (Fin 1)`, `maximalProPQuotient p (profiniteCompletion ℤ)` and
  `Multiplicative ℤ_[p]` agree is the rank-one item above. Here it is restated as the fact
  that `ℤ_p` is the free `ℤ_p`-module of rank 1, and that the two notions of rank agree.
  *Needs:* L4 rank-one chain, L4 module structure.

#### Examples

- `freeProP p (Fin 0) = 1`, `freeProP p (Fin 1) ≅ ℤ_p`, and `freeProP 2 (Fin 3)`, the source of
  `A²S⁴(S,Y)`.
- `ℤ_p × ℤ/p²` has free rank `1` and torsion `ℤ/p²`; `∏_ℕ C_p` is not topologically finitely
  generated, and the structure theorem does not apply to it.

#### Dependencies

Layers 0 and 3; Mathlib `FreeGroup`, `ProfiniteGrp.profiniteCompletion`, `PadicInt`.

### Layer 5: presentations, extensions, and the rank interpretations

#### The coefficient objects, over the imported carrier

**The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's.** At the
pin, `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` defines `continuousCohomology n`
in every degree, as the homology of homogeneous cochains of a topological representation. That
object is the carrier of every cohomological statement in this roadmap. This roadmap defines no
second cohomology theory and no second cohomological operation: a private carrier would admit
terms that satisfy its signatures without satisfying the exactness and pairing laws that the
later layers use, and a private operation would need an unproved comparison with the one that
already exists.

What this layer introduces is the coefficient object the pro-`p` theory computes with, and nothing
about the substrate.

- **The coefficient object.** `trivialFp p G` is the trivial `𝔽_p`-representation of `G`, an
  object of Mathlib's `TopRep (ZMod p) G` (the category `ProfiniteCohomology.TopRep` names), and `cohomFp p G n` is its cohomology,
  `continuousCohomology n (trivialFp p G)`. Both are Tau Ceti's. Mathlib places
  the coefficients in the universe of `G`, so the trivial module is `ULift (ZMod p)`, identified
  with `ZMod p` by `TauCeti.trivialFpEquiv`. Every dimension count in this roadmap is about
  `cohomFp`. The other coefficient systems used below are `I(χ)/p^i`, Tau Ceti's
  `TauCeti.ZModTwist χ i`, and `𝔽_p[G/U]` for `U` open.
  *Needs:* PC-1 `TopRep`, M `continuousCohomology`, M `TopModuleCat`, M `Action`.
  *In Tau Ceti:* `TauCeti.trivialFp`, `TauCeti.cohomFp`, `TauCeti.trivialFpEquiv`,
  `TauCeti.trivialFp_ρ_apply_apply`, `TauCeti.isSmoothDiscrete_trivialFp`,
  `TauCeti.trivialFpResMap`.
- **The multiplication pairing and the cup square.** `fpPairing p G` is Tau Ceti's
  `TauCeti.fpPairing`, the `TauCeti.TopPairing` on `trivialFp p G` given by multiplication in
  `ZMod p`; it is `ZMod p`-bilinear, continuous because the coefficients are discrete, and
  equivariant because the action is trivial. `cupFp p G a b` is Tau Ceti's `TauCeti.cupFp`, which
  is `(TauCeti.fpPairing p G).cup 1 1` (`TauCeti.cupFp_def`) and lands in degree `2` directly.
  This is the cup square `H¹(G, 𝔽_p) × H¹(G, 𝔽_p) → H²(G, 𝔽_p)` that the Demushkin predicate is
  stated against, and it is the only cup product in this roadmap; the general cup product of
  ProfiniteCohomology Layer 12 must restrict to it at this pairing. Its graded commutativity,
  `cupFp a b = - cupFp b a`, is Tau Ceti's `TauCeti.cupFp_gradedComm`, whose input is that the
  opposite pairing of `fpPairing` is itself because multiplication in `ZMod p` is commutative. Graded commutativity turns right nondegeneracy of a
  cup pairing into a consequence of left nondegeneracy, so Layer 7 cites only this result.
  *Needs:* TC `TauCeti.TopPairing`, `TauCeti.fpPairing`, `TauCeti.cupFp`, `TauCeti.cupFp_gradedComm`.
  *Source:* NSW I §1.4 for the cochain formula.

  API checklist for the coefficient objects:
  - Constructors: `trivialFp`; `fpPairing` from multiplication on `ZMod p`; the class of a
    cocycle, through the imported comparison isomorphisms.
  - Examples: `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p)`; `H²(ℤ/2, 𝔽₂)` is one-dimensional, generated by
    the class of the extension `ℤ/4`; `H²(F, 𝔽_p) = 0` for `F` free pro-`p` of finite rank.
  - Morphisms: inflation, restriction, corestriction, the connecting map, and the maps induced
    by a map of coefficients, all imported.
  - Functoriality: contravariant in the group, covariant in the coefficients, both imported.
  - Comparison lemmas: the defining equation of the pairing, Tau Ceti's
    `TauCeti.fpPairing_bil_apply`, read through `TauCeti.trivialFpEquiv`: at `p = 3`,
    `a = b = 2`, the pairing value and the product are both `1`; the imported `explicitIso_cup` relating the canonical cup to the
    explicit `(1,1)` shape.
  - Naturality: `cup_res`, `cup_infl`, `cup_coeffMap` and `cup_projection`, all imported.
  - Edge cases: the trivial group, where `H^n` vanishes for `n ≥ 1`; a finite group, where the
    imported comparison with discrete `groupCohomology` applies; coefficients with a nontrivial
    action, where `H⁰` is not all of `M`, which is the `I(χ)/p^i` system of Layer 7.
  - Downstream interfaces: cohomological dimension in Layer 6, the Demushkin predicate in
    Layer 7, and the rank interpretations below.

  **Checks.**
  - `G = C_p²`: `finrank H¹ = 2` and `finrank H² = 3`; for `G = ℤ_p`: `1` and `0`.
  - At `p = 2`, `G = ℤ/2`: the cup square of the generator of `H¹` is the nonzero class of the
    extension `ℤ/4`; for `G = ℤ/4` the cup square of the generator of `H¹` is `0`, since the
    character lifts to `ℤ/4`. The zero pairing gets the first wrong; an alternating pairing gets
    the first wrong at `p = 2`.
  - `G = ℤ_p²` with dual basis `χ₁, χ₂`: `χ₂ ∪ χ₁ = -(χ₁ ∪ χ₂) ≠ 0`, and with the trace of the
    conventions `tr(χ₁ ∪ χ₂) = -1`; for odd `p`, `χ₁ ∪ χ₁ = 0`.

#### Presentations

- **Presented pro-`p` groups.** `presentedProP p X rels` is the free pro-`p` group modulo
  the closed normal closure of the relators. Every topologically finitely generated pro-`p`
  group has a presentation by a free pro-`p` group of finite rank, and has a minimal one,
  with `topologicalGeneratorRankNat F = topologicalGeneratorRankNat G`, characterized by
  `R ≤ Φ(F)`.
  *Needs:* L4 free objects; L3 Burnside and Gaschütz.
  *In Tau Ceti:* `TauCeti.presentedProP` with `mk`, `of`, `lift`, `hom_ext_of`, `map`,
  `congr`, `isProP` and `isTopologicallyFinitelyGenerated`;
  `TauCeti.IsProP.exists_surjective_freeProP`; `Profinite/ProP/MinimalPresentation.lean`.
  ⚠ A presentation of an arbitrary pro-`p` group needs free objects on an infinite basis
  that converges to `1`, which is Layer 10. The arbitrary-rank presentation theorem is
  stated there.

  API checklist for `presentedProP`:
  - Constructors: the quotient map from the free pro-`p` group; the induced map out of a
    presented group, given that the relators die in the target.
  - Examples: `D₀` at `p = 2`; `presentedProP p X ∅ ≅ freeProP p X`; the normal forms of
    Layer 9.
  - Morphisms: continuous homomorphisms out of it are maps on generators that kill the
    relators.
  - Functoriality: a map of presentations, that is of generator sets and relator sets,
    induces a continuous homomorphism.
  - Comparison lemmas: agreement with `freeProP p X ⧸ R` for `R` the closed normal closure;
    the profinite version `presentedProfiniteGroup` maps onto it.
  - Naturality: the universal property is natural in the target.
  - Edge cases: an empty relator set; a relator set whose closed normal closure is
    everything, where the presented group is trivial; the difference between the algebraic
    and the closed normal closure.
  - Downstream interfaces: minimal presentations, the relation rank below, and the Layer 9
    normal forms.

  **Checks.**
  - `⟨x ∣ x⁴⟩` at `p = 2` is `C₄`, with `2` homomorphisms to `C₂`; `⟨x ∣ x³⟩` at `p = 2` is
    trivial, because `3` is a unit of `ℤ₂`. The quotient of the discrete free group would give
    `C₃`, which is not a `2`-group.
  - `⟨x ∣ ∅⟩ = ℤ_p` and `⟨x₁, x₂ ∣ (x₁, x₂)⟩ = ℤ_p²`, with `d = 2` and one relation.
  - In `freeProP p (Fin 1) = ℤ_p`, the algebraic normal closure of `x^p` is `pℤ`, dense in
    `pℤ_p` and not closed; the quotient by it is not Hausdorff, which is why the closed normal
    closure is used.
- **Non-vacuity, with the map named.** `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩`, Tau Ceti's
  `TauCeti.demushkinD0`, is nontrivial, pro-`2` and topologically finitely generated. The proof
  is not "map it onto some finite `2`-group". The map is `φ : freeProP 2 (Fin 3) → ℤ/2` with
  `φ(A) = 0`, `φ(S) = 1`, `φ(Y) = 0`, given by the universal property of Layer 4. The
  relator maps to `0·2 + 1·4 + 0 = 0`, because the commutator vanishes in an abelian group,
  so
  `φ` factors through `D₀`, and `D₀ ↠ ℤ/2` is surjective. Therefore `D₀` is nontrivial.
  *Needs:* L4 universal property; L5 presentations.
  *In Tau Ceti:* `TauCeti.demushkinD0`, `TauCeti.d0Relator`, `TauCeti.d0FreeCharacter` with
  `d0FreeCharacter_d0Relator` and `d0FreeCharacter_surjective`, `TauCeti.d0Character` with
  `d0Character_surjective`, and the `Nontrivial` instance on `TauCeti.demushkinD0`.

#### Continuous extensions and finite `p`-embedding problems

- **The extension object.** For profinite `G` and a finite discrete abelian `p`-primary
  `G`-module `M`, an extension is a short exact sequence `1 → M → E → G → 1` of topological
  groups such that:
  - `E` is profinite;
  - `M → E` is injective onto a **closed** normal subgroup;
  - `E → G` is a continuous surjection whose kernel is that subgroup;
  - conjugation of `E` on `M` induces the given action.

  A finite subgroup of a profinite group is closed and carries the discrete topology, so the
  injection is a topological embedding. Morphisms are the continuous homomorphisms that fix
  `M` and cover the identity of `G`. Every such morphism is an isomorphism.
  *Needs:* L0 profinite foundations.
  ⚠ Do **not** ask `M` to be open in `E`. An open `M` makes `G` finite, and the groups this
  dictionary is used on are infinite.
- **Continuous sections along a finite kernel.** If `E` is profinite and `N ≤ E` is a finite
  normal subgroup, then `E ↠ E/N` has a continuous set-theoretic section that sends `1` to
  `1`. The proof has three steps. First, `E` has an open normal subgroup `U` with
  `U ∩ N = 1`; intersect the open normal subgroups that separate the finitely many
  nontrivial elements of `N` from `1`. Second, `U` maps isomorphically onto an open subgroup
  of `E/N`, which has finite index. Third, finitely many coset translates of that local
  section give a section over a clopen partition of `E/N`.
  *Needs:* L0 open normal subgroups.
  *In Tau Ceti:* `TauCeti.exists_continuous_section`, for an arbitrary closed subgroup of a
  profinite group, of which this is the finite case.
  ⚠ A surjection of profinite **spaces** need not have a continuous section, so no statement
  here uses one. For profinite groups with an arbitrary closed kernel a section does exist
  (Ribes–Zalesskii Prop. 2.2.2); that is the Tau Ceti theorem, and the finite-kernel case is all
  that this layer uses.
- **Cocycles and extensions.** From a continuous normalized `2`-cocycle build the extension
  on `M × G` with the twisted multiplication, and check that the product topology makes it
  profinite. From a continuous normalized section build a continuous normalized cocycle. The
  two constructions are mutually inverse up to equivalence of extensions.
  *Needs:* PC-2 the explicit low degrees; L5 sections.
- **The bijection.** Equivalence classes of extensions correspond to `H²(G, M)`, with the
  trivial class corresponding to the semidirect product, naturally in `M`. State it as a
  bijection of sets. The Baer sum is not needed and is not a target.
  *Needs:* L5 cocycles and extensions.
- **Splitting.** An extension has a continuous group-theoretic section if and only if its
  class in `H²(G, M)` is zero.
  *Needs:* L5 the bijection.
- **Lifting along the class** (NSW I §5 Exercise 4(i), at `ϕ = id`). Let `G` be profinite, let
  `f : M → N` be a continuous `G`-equivariant homomorphism from a compact abelian group `M` to a
  profinite abelian group `N`, both with continuous `G`-action, and let `X` and `Y` be extensions
  of `G` by `M` and by `N`. The kernels are compact rather than finite, so the milestone is stated
  against Tau Ceti's dictionary, which allows compact kernels: `X` and `Y` are
  `TauCeti.ProfiniteGroupExtension`s, with profinite total group, continuous inclusion and
  projection, inducing the given action; `contCohomologyClass` is the class in the continuous
  `H²`; and `X.map f` is the pushforward of `X` along `f`, whose class is the image of the class
  of `X` under the coefficient map of `f` (`contCohomologyClass_map`). The milestone is three
  statements:
  1. `ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`: if
     `(X.map f).contCohomologyClass = Y.contCohomologyClass`, then `f` is the restriction to the
     kernels of a continuous homomorphism `X.E → Y.E` over the identity of `G`. The
     classification `exists_equiv_continuous_iff_contCohomologyClass_eq` gives a continuous
     equivalence of `X.map f` with `Y` that fixes `N` and covers `G`. Precompose it with the
     homomorphism `X.E → (X.map f).E`, `e ↦ (f (inl⁻¹ (e · σ(π e)⁻¹)), π e)`, where `σ` is the
     continuous normalized section of `X` from which `X.map f` is built. It is multiplicative
     because the factor set of the pushforward is `f` applied to the factor set of `σ` and `f`
     is equivariant, and continuous because `factorSetContinuousMulEquiv` identifies `X.E` with
     the twisted product homeomorphically;
  2. `ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`, the converse:
     if `φ : X.E → Y.E` is a continuous homomorphism over the identity of `G` that restricts to
     `f`, then `φ ∘ σ` is a continuous normalized section of `Y` whose factor set is `f` applied
     to that of `σ`, so `(X.map f).contCohomologyClass = Y.contCohomologyClass`;
  3. `GroupExtension.surjective_of_comp_inl_eq`: a homomorphism of extensions over the identity
     of `G` whose restriction to the kernels is surjective is itself surjective, since it meets
     every fibre of the projection and, within a fibre, every translate of the kernel.

  `LocalGaloisGroups` uses the three together to lift a surjection of relation modules to a
  surjective morphism of group extensions.
  ⚠ Finite kernels do not suffice for that consumer: the maximal abelian pro-`p` quotient of an
  open subgroup of a free profinite group of finite rank is a free `ℤ_p`-module of finite rank.
  *Needs:* TC `TauCeti.ProfiniteGroupExtension`, `TauCeti.ProfiniteGroupExtension.map`,
  `TauCeti.ProfiniteGroupExtension.contCohomologyClass_map`,
  `TauCeti.ProfiniteGroupExtension.exists_equiv_continuous_iff_contCohomologyClass_eq`,
  `TauCeti.GroupExtension.exists_continuous_section`,
  `TauCeti.GroupExtension.factorSetContinuousMulEquiv`, `GroupExtension.contCohomologyClass_eq`,
  `TauCeti.FactorSet.contCohomologyClass_map`.
  *Source:* NSW I §5 Exercise 4.

The passage from the extension dictionary to projectivity is six statements, and each one is a
milestone of its own below rather than a line in a proof of the last. All six are Tau Ceti's, used
under their Tau Ceti names, and `Suggested.lean` states the converse, 5.7, which needs a pro-`p`
hypothesis, as a closed proof from Tau Ceti's API.

- **5.1 The finite embedding problem.** A finite embedding problem for `G` is a continuous
  surjection `π : G ↠ Q` onto a finite group together with a surjection `α : E ↠ Q` of finite
  groups; a solution is a continuous `β : G → E` with `α ∘ β = π`. A surjection `φ : E ↠ F` of
  finite groups and a homomorphism `β : G → F` with open kernel cut out the problem whose
  solutions are the lifts of `β` through `φ`.
  *Needs:* L0 profinite foundations; L5 extensions.
  *In Tau Ceti:* `TauCeti.FiniteEmbeddingProblem` and `TauCeti.FiniteEmbeddingProblem.IsSolution`
  with `isSolution_iff`; `TauCeti.FiniteEmbeddingProblem.ofSurjective` with
  `isSolution_ofSurjective_iff`.
  ⚠ Continuity of a homomorphism into a finite discrete group is openness of its kernel, and that
  is how both are written; no field of the problem carries a topology, exactly as in
  `IsFiniteContinuousQuotient`.
  ⚠ A solution cannot be made surjective in general, and no statement here says otherwise. With
  `G = C_p`, `Q = 1` and `E = C_p × C_p`, the unique maps form an embedding problem whose
  solutions are the homomorphisms `C_p → C_p × C_p`, none of which is surjective. The Burnside
  criterion certifies that a map already surjective on the Frattini quotient is surjective; it
  cannot supply a missing generator. Everything below needs only the weak form.
- **5.2 Solvability with elementary abelian kernel.** The predicate
  `HasElementaryAbelianSolutions p G`: every finite embedding problem for `G` whose kernel
  `N = ker α` is commutative and killed by `p` has a solution. This is the single step that
  consumes cohomology. Conjugation makes `N` a `Q`-module, the pullback of the extension
  `1 → N → E → Q → 1` along `π` has a class in `H²(G, N)`, and the vanishing of that class is
  exactly solvability. If `H²(G, M) = 0` for every finite discrete `G`-module `M` killed by `p`,
  the predicate holds.
  *Needs:* L5 the bijection; L5 splitting.
  *In Tau Ceti:* `TauCeti.HasElementaryAbelianSolutions`; the obstruction
  `TauCeti.FiniteEmbeddingProblem.obstruction` with `exists_isSolution_iff_obstruction_eq_zero`;
  `TauCeti.hasElementaryAbelianSolutions_of_subsingleton_continuousCohomology_two`.
- **5.3 The lower `p`-central reduction.** A finite `p`-group kernel `N` is filtered by
  `λ_0(N) = N` and `λ_{k+1}(N) = λ_k(N)^p [λ_k(N), N]`, a chain that reaches `1` in finitely many
  steps and whose factors are elementary abelian.
  *Needs:* M `IsPGroup` and the finite lower `p`-central series.
  *In Tau Ceti:* `Subgroup.exists_pLowerCentral_filtration_of_isPGroup`, for the series
  `Subgroup.pLowerCentralSeries p N` of `GroupTheory/PLowerCentralSeries.lean`.
  ⚠ Characteristicity is what makes the reduction work: each `λ_k(N)` is characteristic in `N`,
  hence normal in `E`, which is what makes each factor a `Q`-module. An arbitrary central series
  of `N` need not be stable under conjugation by `E`.
- **5.4 Solvability with `p`-group kernel.** The predicate `HasPGroupSolutions p G`, and the
  induction that derives it from 5.2 by climbing the filtration of 5.3, one extension of the kind
  in the dictionary per step. 5.3 is used here and nowhere else, which is why it is stated
  separately.
  *Needs:* L5.1, L5.2, L5.3.
  *In Tau Ceti:* `TauCeti.HasPGroupSolutions`,
  `TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions`.
- **5.5 Compatible systems of finite solutions.** Let `α : A ↠ B` be a continuous surjection from
  a profinite pro-`p` group onto a Hausdorff group, let `f : G → B` be continuous, and let
  `U ≤ A` be open normal. The level problem `levelProblem α hα f U` is `A/U → B/α(U)` restricted
  to the preimage of the image of `G` in `B/α(U)`; its solutions are the continuous lifts of `f`
  modulo `U`. Under 5.4 every level problem is solvable, the transition maps between the levels
  are surjective, and there is a compatible family of level solutions. The compactness argument
  runs on the fibres in `A` of a minimal closed relation between `A` and `G`, and not on the level
  solution sets, so it needs no finiteness.
  *Needs:* L5.4; L0 open normal subgroups and the compactness lemma.
  *In Tau Ceti:* `TauCeti.levelProblem`, `TauCeti.LevelSolution`, `TauCeti.levelSolutionEquiv`,
  `TauCeti.nonempty_isSolution_levelProblem`, `TauCeti.levelSolutionMap_surjective`,
  `TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions`,
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_levelSolution`.
  ⚠ The level problem must be cut down to the image of `f`, because the map `G → B/α(U)` that `f`
  induces need not be surjective. With `G = 1`, `A = B = C_p`, `α = id`, `U = 1` and `f` trivial
  it is `1 → C_p`, so `E = A/U`, `Q = B/α(U)` is not an embedding problem at all.
  ⚠ The level solution sets need not be finite. For `G` free pro-`p` on an infinite basis,
  `A = C_p`, `B = 1` and `U = 1`, the solutions are the continuous homomorphisms `G → C_p`, and
  there are infinitely many. They are finite when `G` is topologically finitely generated, which
  is the only case in which a finite-set compactness argument applies to them.
- **5.6 Inverse-limit lifting: projectivity.** The predicate `IsProjective p G`, that every
  continuous homomorphism into a quotient of a profinite pro-`p` group lifts continuously, and
  the theorem that 5.4 implies it, with no finite-generation hypothesis: the compatible level
  solutions of 5.5 assemble into one continuous lift. This is the projectivity statement Layer 6
  consumes.
  *Needs:* L0 compactness lemma; L5.5.
  *In Tau Ceti:* `TauCeti.IsProjective` with `IsProjective.exists_continuous_lift` and
  `IsProjective.of_equiv`, `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`,
  `TauCeti.isProjective_of_hasPGroupSolutions`.
- **5.7 The converse, for pro-`p` groups.** A projective pro-`p` group solves every finite
  embedding problem with `p`-group kernel (`hasPGroupSolutions_of_isProjective`), so for pro-`p`
  `G` projectivity and 5.4 are equivalent (`isProjective_iff_hasPGroupSolutions`). `Q` is a
  continuous finite quotient of the pro-`p` group `G`, hence a `p`-group; so `E`, an extension of
  `Q` by the `p`-group `ker α`, is a finite `p`-group, hence pro-`p`, and the problem is a lifting
  problem against `α`. `Suggested.lean` proves both statements from Tau Ceti's API.
  *Needs:* L5.6; L3 the `IsProP` API; M `IsPGroup.of_subgroup_of_quotient`.
  ⚠ The pro-`p` hypothesis is needed, and a `p`-group kernel does not make `E` and `Q`
  `p`-groups. `G = PSL₂(𝔽₅)` is perfect, so every continuous homomorphism from it to a pro-`2`
  group is trivial and `G` is projective at `p = 2`. But `SL₂(𝔽₅) ↠ G`, with kernel `C₂` and
  `π = id`, has no solution: the only involution of `SL₂(𝔽₅)` is `-1`, while `G` has involutions.
- **`H²` of a free pro-`p` group vanishes.** For `F` free pro-`p` of finite rank and `M`
  finite discrete `p`-primary, `H²(F, M) = 0`. Proof: by the dictionary a class is an
  extension `1 → M → E → F → 1`, and the universal property of `F` lifts a generating tuple
  through `E ↠ F`, which produces a continuous group-theoretic section, so the class is
  zero. This theorem is proved here, because the relation-rank theorem below uses it. Layer
  6 restates it as `cd_p F ≤ 1` and proves the converse.
  *Needs:* L5 the dictionary; L4 universal property.
  *In Tau Ceti:* `TauCeti.freeProP.subsingleton_continuousCohomology_two`, and
  `TauCeti.hasPGroupSolutions_freeProP`, the same lifting argument read as 5.4.
  *Source:* Serre, *Galois Cohomology* I §3.4; Koch Ch. 4.12.

#### Rank interpretations

- **`H¹` interpretation.** `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p) ≅ (G/Φ(G))^∨`, so
  `dim_{𝔽_p} H¹(G, 𝔽_p) = topologicalGeneratorRankNat G h` for topologically finitely
  generated pro-`p` `G`. The cardinal form without finiteness is the Layer 3 identity: that
  identity is already stated against the discrete dual, so this layer only identifies the
  dual with `H¹(G, 𝔽_p)`.
  *Needs:* L5 the coefficient objects; PC-3 the degree-one comparison; L3 Burnside.
  *Source:* Labute §1.3; Serre, *Galois Cohomology* I §4.2; NSW (3.9.1).
- **`H²` interpretation.** For a minimal presentation `1 → R → F → G → 1` of a topologically
  finitely generated pro-`p` group, transgression `H¹(R, 𝔽_p)^F → H²(G, 𝔽_p)` is an
  isomorphism, by the five-term sequence and the vanishing theorem above. The space
  `H¹(R, 𝔽_p)^F` is dual to `R/Rᵖ[R,F]`, whose dimension is the least number of
  generators of `R` as a closed normal subgroup. Hence `r(G) = dim H²(G, 𝔽_p)` counts
  relations, and does not depend on the minimal presentation. This is the
  presentation-independence theorem.
  *Needs:* PC-5 the five-term sequence; L5 vanishing theorem; L5 presentations.
  *In Tau Ceti:* `TauCeti.transgression_bijective_of_le_proPFrattini` (`ProP/Transgression.lean`);
  `TauCeti.presentedProP.natCard_H2`, `TauCeti.presentedProP.natCard_H2_le_pow_iff`,
  `TauCeti.presentedProP.finite_H2_iff` and
  `TauCeti.presentedProP.topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq`
  (`ProP/Relation/Rank.lean`).
  *Source:* Labute §1.4; NSW (3.9.5).
- **Deficiency and one-relator groups.** For pro-`p` `G` that is topologically finitely
  generated with `H²(G, 𝔽_p)` finite-dimensional, both `d(G)` and `r(G)` are natural
  numbers, and `def(G) : ℤ` is defined by `d(G) = def(G) + r(G)`, so that no truncated
  natural subtraction occurs. A finite relation system exists if and only if `H²` is finite,
  and then every finite presentation satisfies `#S - #R ≤ d(G) - r(G)` as an inequality in
  `ℤ`, with equality for minimal presentations, those with `#S = d(G)` and `#R = r(G)`. Sanity
  check: adding a redundant relator lowers the left side and leaves the right side alone, so
  `⟨x | x^p, x^{p²}⟩` presents `C_p` with `#S - #R = -1 < 0 = d(C_p) - r(C_p)`. The case
  `r(G) = 1` is the one-relator case, and a Demushkin group is a one-relator pro-`p` group
  with relator in `Fᵖ[F,F]`, which is the input to Layer 7.
  *Needs:* L5 rank interpretations.
  *Source:* NSW (3.9.4).
- **The Golod–Shafarevich inequality.** For a nontrivial finite `p`-group, `4 r(G) > d(G)²`,
  stated in that form over `ℕ`
  (`sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two`, closed by Tau Ceti's
  `IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two`). It is the classical result on deficiency, and it explains
  why a finite `p`-group needs many relations.
  *Needs:* L5 rank interpretations.
  *Source:* NSW (3.9.7); Ribes–Zalesskii Thm. 7.8.5.
- **Sanity example.** `d((ℤ/p)ⁿ) = n` and `r((ℤ/p)ⁿ) = n(n+1)/2`. This count detects a wrong
  normalization of `H²`.
  *Needs:* L5 rank interpretations.

#### Examples

- `d(C_p^n) = n` and `r(C_p^n) = n(n + 1)/2`; `(d, r) = (2, 0)` for the free group of rank `2`.
- `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩` with its orientation `A ↦ -1`, `S ↦ 1`, `Y ↦ (-3)⁻¹`.

#### Dependencies

Layers 0, 3 and 4; ProfiniteCohomology Layers 1, 2, 3 and 5 (degrees `≤ 2`); Mathlib
`continuousCohomology`, `TopModuleCat`; Tau Ceti `TauCeti.ProfiniteGroupExtension`,
`TauCeti.cupFp`.

### Layer 6: cohomological dimension of pro-`p` groups

`cd_p G` is `ProfiniteCohomology.cd_p p G`: the infimum, in `ℕ∞`, of the `n` for which
`H^m(G, M)` vanishes for every `m > n` and every discrete `p`-primary torsion `G`-module `M`.
That declaration belongs to the Profinite Cohomology roadmap (Layer 11), where for `G : Type u`
it is Tau Ceti's `TauCeti.cohomologicalDimensionAt.{u} p G`, with coefficients in the universe of
the group, characterized by `TauCeti.cohomologicalDimensionAt_le_iff` through the vanishing
predicate `TauCeti.CohomologicalDimensionLE`; this roadmap defines no second cohomological
dimension. Tau Ceti's theorems about `cd_p` (of free pro-`p` groups, of Demushkin groups, Serre's
theorem) are stated at the same universe, so they are statements about `cd_p` itself. For the
groups `freeProP p (Fin n)` and their closed subgroups, which live in `Type`, `cd_p` is
`TauCeti.cohomologicalDimensionAt.{0}`.
Three reduction theorems say when a smaller test suffices, and none of them is the definition:

- testing only the **finite** discrete `p`-primary modules gives the same predicate, by
  compatibility with filtered colimits of coefficients. This is
  `ProfiniteCohomology.cd_p_le_iff_finite_pPrimary`, which is cited and not restated;
- testing only the modules of **bounded exponent** gives the same predicate, for the same
  reason. This is `ProfiniteCohomology.cd_p_le_iff_boundedExponent`;
- for a pro-`p` group, testing the single module `𝔽_p` gives the same predicate, by the
  dévissage below. This one is owned here, as `cd_p_le_iff_elementaryAbelian_of_isProP`,
  because its proof is the pro-`p` trivial-filtration theorem of this layer.

Writing the elementary abelian test as the definition would make the dévissage vacuous and
would not agree with the standard `cd_p`.

- **The trivial-filtration theorem.** For pro-`p` `G`, a nonzero finite discrete `p`-primary
  `G`-module has nonzero invariants: the action factors through a finite `p`-quotient, and a
  finite `p`-group acting on a nonzero finite `p`-group fixes a nonzero element. Iterating,
  every such `M` has a `G`-stable filtration whose factors are one-dimensional with trivial
  action. Hence a `ℤ`-valued function of the coefficients that is additive along short exact
  sequences takes the value `length M` times its value at `𝔽_p`, where
  `length M = padicValNat p (Nat.card M)` is the composition length.
  *Needs:* M `IsPGroup.card_modEq_card_fixedPoints`; L3 `IsProP` API.
  *In Tau Ceti:* `TauCeti.exists_ne_zero_invariant_of_isProP`,
  `TauCeti.exists_addSubgroup_natCard_eq_invariant_of_isProP`, `Profinite/ProP/Filtration.lean`.
  ⚠ Do not write `dim_{𝔽_p} M` here. A finite `p`-primary module is not an `𝔽_p`-vector
  space in general, and `ℤ/p²` is the smallest counterexample. The two agree exactly when
  `M` is killed by `p`. That is the case the Euler formulas use, since they take
  `M = 𝔽_p[G/U]`, where `length = dim_{𝔽_p} = [G : U]`.
- **Dévissage.** For a pro-`p` group, vanishing on the finite discrete elementary abelian
  `p`-primary modules in one degree gives vanishing on all finite discrete `p`-primary
  modules in that degree. Route: the trivial-filtration theorem above, and the long exact
  sequence in that degree.
  *Needs:* L6 trivial filtration; PC-10 `delta`, `longExact_exact` (the long exact sequence in
  every degree; PC-5 covers only degrees `≤ 2`).
  *In Tau Ceti:* `TauCeti.IsProP.forall_subsingleton_continuousCohomology_iff`, in each degree.
  *Source:* Serre, *Galois Cohomology* I §3.
- **Vanishing in one degree gives vanishing above it.** If `H²(G, M) = 0` for every finite
  discrete `p`-primary `G`-module `M`, and `G` is pro-`p`, then `H^n(G, M) = 0` for every
  `n ≥ 2` and every such `M`. Route: dimension shifting through `Coind_1^G M`, which uses
  Shapiro for the **closed** trivial subgroup, the long exact sequence for coefficients that
  are not finite, and the dévissage above. This is the theorem that turns the Layer 5
  vanishing theorem for free pro-`p` groups into `cd_p ≤ 1`.
  *Needs:* L6 dévissage; PC-7 `Coind`; PC-10 `shapiroIso` for a closed subgroup, `coindEmbedding`,
  `dimensionShiftQuotient`, `coindAcyclic`, `dimensionShiftIso`, `longExact_exact`, and
  `continuousCohomology_preservesFilteredColimits` (the quotient `Coind_1^G M / M` is discrete
  `p`-primary but not finite, so its `H²` is the colimit over its finite submodules).
  Check at degree `3`: for `G = ℤ_p`, `H³(G, 𝔽_p) = 0` and `H²(G, Coind_1^G 𝔽_p / 𝔽_p) = 0`, and
  the shift identifies them; for `G = C_p`, `H³(G, 𝔽_p) = 𝔽_p ≠ 0`, and the premise fails
  already in degree two, `H²(C_p, 𝔽_p) = 𝔽_p`.
  *Source:* Serre, *Galois Cohomology* I §3.1; Ribes–Zalesskii 7.7.4.
- **Free implies `cd ≤ 1`.** Layer 5's theorem `H²(F, M) = 0`, for `F` free pro-`p` of
  finite rank and `M` finite discrete `p`-primary, restated as `cd_p F ≤ 1`
  (`cd_p_freeProP_le_one`). Dévissage
  changes the coefficients and the vanishing theorem above changes the degree, so the proof
  needs both.
  *Needs:* L5 vanishing theorem; L6 dévissage; L6 vanishing in one degree gives vanishing
  above it; TC `TauCeti.freeProP.subsingleton_continuousCohomology_two`, which is the Layer 5
  theorem.
- **Serre's theorem: `cd_p G ≤ 1` implies free pro-`p`,** for topologically finitely
  generated `G` (`isFree_of_cd_p_le_one`). The route has four steps:
  1. `cd_p G ≤ 1` gives the projectivity property of Layer 5;
  2. a minimal generating tuple gives a continuous surjection `φ : F ↠ G`, from the free
     pro-`p` group on `Fin (topologicalGeneratorRankNat G h)`;
  3. projectivity gives a continuous homomorphic section `s : G → F`;
  4. the image `s(G)` is closed and maps onto `F/Φ(F)` by minimality, so `s(G) = F` by
     Burnside, and `φ` is an isomorphism.
  *Needs:* L5 projectivity; L3 Burnside; L4 free objects.
  *In Tau Ceti:* `TauCeti.CohomologicalDimensionLE.isProjective` (step 1) and
  `TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one`, the
  theorem itself, for a generating type of cardinality `d(G)` in the universe of `G`.
  `isFree_of_cd_p_le_one` is that theorem read at the generating type `Fin d(G)`, which lives in
  `Type`.
  *Source:* NSW III §5; Serre, *Galois Cohomology* I §4.2; Ribes–Zalesskii Ch. 7.
  ⚠ The version without finite generation is a different theorem with a different proof. It
  is stated in Layer 10, once free objects on a basis that converges to `1` exist.
- **`cd` of open subgroups.** For `U` open in pro-`p` `G` with `cd_p G < ∞`,
  `cd_p U = cd_p G` (`cd_p_eq_of_isOpen`).
  ⚠ The imported `ProfiniteCohomology.cd_p_eq_of_index_not_dvd` is the case of an open subgroup
  of index **prime to `p`**, which for pro-`p` `G` means `U = G`. It does not prove this
  milestone.
  *Needs:* PC-11 `cd_p_le_of_isClosed`; PC-10 `shapiroIso` (Shapiro in every degree); L6
  dévissage.
  *Source:* Serre, *Galois Cohomology* I §3.3.
- **Restriction to a Sylow subgroup is injective.** For a `p`-Sylow subgroup `P` of a profinite
  `G`, a discrete `p`-primary torsion `G`-module `M` and every `n`, restriction
  `Hⁿ(G, M) → Hⁿ(P, M)` is injective (`res_injective_of_isProPSylow`). Restriction is additive,
  so it is enough that `res_P x = 0` forces `x = 0`, and each of the five steps below rests on
  named declarations:
  1. `P` is closed (`TauCeti.IsProPSylow.isClosed`), so the imported descent
     `ProfiniteCohomology.exists_openSubgroup_res_eq_zero_of_res_eq_zero`, at the smooth discrete
     object `ofDiscreteModule G M` (`ProfiniteCohomology.ofDiscreteModule_isSmoothDiscrete`),
     gives an open subgroup `U ⊇ P` with `res_U x = 0`;
  2. `ProfiniteCohomology.corestriction_comp_res` at `U`, evaluated at `x`
     (`ConcreteCategory.congr_hom`), gives `((U.toSubgroup.index : ℕ) : ℤ) • x = cor (res_U x) = 0`,
     an integer multiple because that theorem's scalar is `(U.toSubgroup.index : ℤ)`;
  3. `ProfiniteCohomology.isPPrimaryTorsion_continuousCohomology`, which is Tau Ceti's
     `TauCeti.isPPrimaryTorsion_continuousCohomology` read through the coefficient dictionary,
     puts `x` in the `p`-primary component, that is, `p ^ k • x = 0` for some `k : ℕ`
     (`AddCommGroup.mem_primaryComponent`). This is a natural-number multiple, equal to
     `((p ^ k : ℕ) : ℤ) • x` by `natCast_zsmul`;
  4. `U.toSubgroup.index` is prime to `p` by `IsProPSylow.not_dvd_index_of_le`, hence coprime to
     `p ^ k` (`Nat.Prime.coprime_iff_not_dvd`, `Nat.Coprime.pow_left`);
  5. Bézout in `ℤ` (`Nat.gcd_eq_gcd_ab` with `Nat.Coprime.gcd_eq_one`): for
     `a = Nat.gcdA (p ^ k) U.toSubgroup.index` and `b = Nat.gcdB (p ^ k) U.toSubgroup.index`,
     `((p ^ k : ℕ) : ℤ) * a + ((U.toSubgroup.index : ℕ) : ℤ) * b = 1`, so
     `x = a • (((p ^ k : ℕ) : ℤ) • x) + b • (((U.toSubgroup.index : ℕ) : ℤ) • x) = 0`
     (`one_zsmul`, `add_zsmul`, `mul_zsmul`).

  *Needs:* L2 `IsProPSylow`, `IsProPSylow.not_dvd_index_of_le`; PC-1 `res`, `ofDiscreteModule`,
  `ofDiscreteModule_isSmoothDiscrete`; PC-10 `exists_openSubgroup_res_eq_zero_of_res_eq_zero`,
  `corestriction`, `corestriction_comp_res`; PC-11 `IsPPrimaryTorsion`,
  `isPPrimaryTorsion_continuousCohomology`; TC `TauCeti.IsProPSylow.isClosed`,
  `TauCeti.isPPrimaryTorsion_continuousCohomology`; M `injective_iff_map_eq_zero`,
  `ConcreteCategory.congr_hom`, `AddCommGroup.mem_primaryComponent`, `natCast_zsmul`,
  `Nat.Prime.coprime_iff_not_dvd`, `Nat.Coprime.pow_left`, `Nat.gcd_eq_gcd_ab`,
  `Nat.Coprime.gcd_eq_one`, `one_zsmul`, `add_zsmul`, `mul_zsmul`.
  *Source:* NSW (1.6.10), whose proof is this argument for any closed subgroup of index prime to
  `p`, with (1.5.1) for a subgroup that is not open.
- **The Sylow equality.** Let `G` be profinite, and let `G_p` be a `p`-Sylow subgroup of `G`,
  from Layer 2. Then `cd_p G = cd_p G_p` (`cd_p_eq_of_isProPSylow`). The inequality
  `cd_p G_p ≤ cd_p G` is the imported monotonicity `ProfiniteCohomology.cd_p_le_of_isClosed`,
  `G_p` being closed. For `cd_p G ≤ cd_p G_p`, suppose `cd_p G_p ≤ n`, and let `M` be a discrete
  `p`-primary torsion `G`-module and `i > n`. Restricted to `G_p`, `M` is a discrete `p`-primary
  torsion `G_p`-module (`ProfiniteCohomology.ofDiscreteModuleRes`), so `Hⁱ(G_p, M) = 0`, and
  injectivity of restriction gives `Hⁱ(G, M) = 0`; by `TauCeti.cohomologicalDimensionAt_le_iff`,
  read through the alias `ProfiniteCohomology.cd_p`, this is `cd_p G ≤ n`. This is the one
  milestone here about `cd_p` of a group that need not be pro-`p`. `ClassFieldTheory` consumes
  it for the cohomological dimension of a local absolute Galois group. The statement asks
  nothing of `G_p` beyond `IsProPSylow`: being closed in the compact `G`, it is compact, and
  that instance is supplied inside the statement, while total disconnectedness passes to the
  subspace by instance.
  ⚠ A `p`-Sylow subgroup is closed and, unless it is open, is not covered by the imported
  `ProfiniteCohomology.cd_p_eq_of_index_not_dvd`, which is the open prime-to-`p`-index case of
  the same corestriction argument. The imported descent
  `ProfiniteCohomology.exists_openSubgroup_res_eq_zero_of_res_eq_zero`, step 1 of the injectivity
  above, is what reaches the closed case.
  *Needs:* L2 `IsProPSylow`; L6 `res_injective_of_isProPSylow`; PC-1 `ofDiscreteModuleRes`;
  PC-11 `cd_p`, `cd_p_le_of_isClosed`; TC `TauCeti.cohomologicalDimensionAt_le_iff`,
  `TauCeti.CohomologicalDimensionLE`, `TauCeti.IsProPSylow.isClosed`; M `IsClosed.isCompact`,
  `isCompact_iff_compactSpace`, `Subtype.totallyDisconnectedSpace`.
  *Source:* NSW (3.3.5)(i) and (3.3.6); Serre, *Galois Cohomology* I §3.3.
- **The two-term Euler formula.** Let `G` be a topologically finitely generated pro-`p`
  group with `cd_p G ≤ 1`, and let `U ≤ G` be open. Then the four spaces
  `H^i(G, 𝔽_p)` and `H^i(U, 𝔽_p)`, for `i = 0, 1`, are finite-dimensional, and in `ℤ`

  > `finrank H⁰(U, 𝔽_p) - finrank H¹(U, 𝔽_p)
  >   = [G : U] · (finrank H⁰(G, 𝔽_p) - finrank H¹(G, 𝔽_p))`.

  Subtraction is in `ℤ` throughout, and no symbol `χ` is introduced. Finite-dimensionality
  is part of the theorem: it follows from topological finite generation of `U`, by Layer 3
  and the `H¹` interpretation of Layer 5. The proof uses Shapiro for `U`, the identification
  `Coind_U^G 𝔽_p ≅ 𝔽_p[G/U]`, the long exact sequence, the trivial-filtration theorem, and
  additivity of `finrank` along a finite exact sequence of finite-dimensional vector spaces.
  *Needs:* PC-7 Shapiro; PC-5 the long exact sequence; L6 trivial filtration; L3 Schreier bound;
  M `Module.finrank`.
- **Pro-`p` Nielsen–Schreier for open subgroups.** An open subgroup `U` of index `m` in a
  free pro-`p` group `F` of finite rank `n ≥ 1` is free pro-`p` of rank `1 + m(n - 1)`
  (`nonempty_continuousMulEquiv_freeProP_of_openSubgroup`). The route is cohomological: freeness from `cd_p U ≤ cd_p F ≤ 1` and
  Serre's theorem; the rank from the two-term Euler formula with `finrank H⁰ = 1`,
  `finrank H¹(F, 𝔽_p) = n` and `finrank H¹(U, 𝔽_p) = d(U)`, which gives
  `1 - d(U) = m(1 - n)` in `ℤ`, hence `d(U) = 1 + m(n-1)` in `ℕ`. The last rearrangement is
  a separate small lemma, because that is where the natural-number statement is recovered.
  *Needs:* L6 Euler formula, L6 Serre's theorem, L6 `cd` of open subgroups.
  *Source:* Koch Example 6.3, derived the same way from his §5.4. The alternative in the
  literature is Ribes–Zalesskii Thm. 3.6.2, a Schreier-transversal argument through the
  pro-`C` completion of the abstract theorem, for extension-closed varieties. This roadmap
  takes the cohomological route, because Layers 5 to 7 build its ingredients anyway, and
  because the closed-subgroup case in Layer 10 is cohomological in any treatment.
  ⚠ Closed subgroups that are not open are Layer 10. Such a subgroup is free pro-`p` of
  possibly infinite rank, and the statement needs bases that converge to `1`. Do not state a
  truncated finite-rank version here.

#### Examples

- `cd_p ℤ_p = 1`, `cd_p (ℤ_p²) = 2`, `cd_p C_p = ∞` since `H^{2k}(C_p, 𝔽_p) ≠ 0`.
- For `S₃` at `p = 3`, restriction to `A₃` is injective on `H*(−, 𝔽₃)`.

#### Dependencies

Layers 2 to 5; ProfiniteCohomology Layers 1, 5 and 7 in degrees `≤ 2`, Layer 10 in every
degree, and Layer 11 (`cd_p`); Tau Ceti `TauCeti.cohomologicalDimensionAt`.

### Layer 7: Demushkin groups, their invariants, and the orientation

- **The predicate.** `IsDemushkin p G` has the fields given in the conventions: `IsProP p G`,
  finite-dimensionality of `H¹(G, 𝔽_p)`, `finrank H²(G, 𝔽_p) = 1`, and nondegeneracy of
  the cup pairing on each side. Four things are derived at once:
  - `G` is topologically finitely generated, from the first two fields and Burnside;
  - the rank `n(G) := topologicalGeneratorRankNat G h`, which `Suggested.lean` packages as
    `demushkinRank`;
  - the identity `n(G) = finrank H¹(G, 𝔽_p)`;
  - `G` is a one-relator pro-`p` group, with relator in `Fᵖ[F,F]`.

  `IsDemushkin` is Tau Ceti's `TauCeti.IsDemushkin`. Like that predicate it is defined on every
  topological group, with no compactness or total-disconnectedness binder. Its `IsProP` field
  says only that every quotient by an open normal subgroup is a `p`-group, so it does not make
  `G` profinite: the discrete direct sum of countably many copies of `C₂` satisfies it and is not
  compact, while the product of those copies is compact. Every theorem about Demushkin groups
  below therefore assumes `[CompactSpace G] [TotallyDisconnectedSpace G]` alongside the
  predicate. Also proved here: `IsDemushkin` is
  invariant under topological isomorphism. Every numerical statement below is about
  `demushkinRank`.
  *Needs:* L5 the coefficient objects and `cupFp`; L5 rank interpretations; L3 Burnside.
  *Source:* Labute p. 106.

  API checklist for `IsDemushkin`:
  - Constructors: from the four fields and from the recognition criteria below.
  - Examples: `ℤ/2` at `p = 2`; `ℤ_p × ℤ_p` with `q = 0`; `D₀` at `p = 2` with `n = 3`; the
    non-examples `1`, `ℤ_p` and every free pro-`p` group.
  - Morphisms: topological isomorphisms transport the predicate; open subgroups inherit it,
    which is the open-subgroup theorem below.
  - Functoriality: the invariants `demushkinRank` and `Im (demushkinCharacter)` are
    invariant under topological isomorphism.
  - Comparison lemmas: the recognition criteria below give equivalent conditions for a
    one-relator group; the definition agrees with Labute's and with NSW (3.9.9).
  - Naturality: restriction of the canonical character to an open subgroup is the canonical
    character of that subgroup.
  - Edge cases: rank 1, where only `ℤ/2` occurs; `q = 2`, where `(n, q)` is not a complete
    invariant; finite Demushkin groups, where only `ℤ/2` occurs.
  - Downstream interfaces: the classification of Layer 9 and `LocalGaloisGroups`.

  **Checks.**
  - `ℤ/2` at `p = 2`: `finrank H¹ = finrank H² = 1` and `χ ∪ χ ≠ 0`, so it is Demushkin with
    `n = 1` and `q = 2`.
  - `ℤ/4` at `p = 2`: `finrank H¹ = finrank H² = 1`, but `χ ∪ χ = 0`, so it is not Demushkin; a
    definition that keeps only the two dimension conditions accepts it. `ℤ_p` (`H² = 0`) and
    `C_p²` (`finrank H² = 3`) fail the dimension condition.
  - `ℤ_p²`: `finrank H¹ = 2`, `finrank H² = 1`, `χ₁ ∪ χ₂ ≠ 0`, so it is Demushkin with `q = 0`;
    `⟨x₁, x₂ ∣ x₁^{p²}(x₁, x₂)⟩` has abelianization `ℤ/p² × ℤ_p`, so `q = p²`.
- **First examples and non-examples.** `ℤ/2` is Demushkin at `p = 2`, is the unique finite
  one, and is the unique one of rank 1; the cup square of the generator of `H¹(ℤ/2, 𝔽₂)`
  is the class of the extension `ℤ/4`. A free pro-`p` group is not Demushkin, because its
  its `H²` vanishes; this covers `1` and `ℤ_p`. The group `ℤ_p × ℤ_p` is Demushkin with
  `q = 0`, with the surface relation `(x₁, x₂)`. For odd `p` there is no Demushkin group of
  rank 1.
  *Needs:* L7 the predicate; L5 the coefficient objects.
  *Source:* Labute p. 106; Serre, *Galois Cohomology* I §4.5.
- **The abelianization structure theorem.** For Demushkin `G`,
  `G^{ab} ≅ ℤ_p^{n-1} × ℤ_p/qℤ_p`, proved from the Layer 4 structure theorem applied to
  `topAbelianization G`, together with the one-relator presentation. The torsion subgroup is
  finite and cyclic, which is what makes `demushkinQ G` well defined from the predicate
  alone: it is `0` when the torsion is trivial, and the order of the torsion otherwise.
  Worked instance: `D₀^{ab} ≅ ℤ₂² × ℤ/2`, its torsion is finite, and `q(D₀) = 2`.
  That instance is a computation with the presentation, and it does not
  use the classification; it is Tau Ceti's `TauCeti.d0AbelianizationEquiv` and
  `TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0`. `topAbelianization` is
  Mathlib's `TopologicalAbelianization`.
  *Needs:* L4 structure theorem; L5 presentations; L7 the predicate.
  *Source:* Labute p. 106.
- **The standard orientation of `D₀`.** `standardD0Orientation : D₀ →ₜ* ℤ₂ˣ` is the continuous
  character with values `-1`, `1` and `(-3)⁻¹` on the marked generators `d0A`, `d0S`, `d0Y`,
  where `-3` is the unit `negThreeUnit`. Prove that it is onto (`standardD0Orientation_surjective`:
  `-1` and `-3` topologically generate `ℤ₂ˣ`) and that it is the only continuous character
  with these three values (`standardD0Orientation_unique`: the marked generators topologically
  generate `D₀`). The values themselves, and the vanishing on the relator that lets the
  character descend from the free pro-`2` group, are Tau Ceti's.
  *Needs:* L5 presentations and `D₀`; L7 the subgroups of `ℤ₂ˣ`.
  *In Tau Ceti:* `TauCeti.standardD0Orientation`, `TauCeti.standardD0Orientation_d0A`,
  `TauCeti.standardD0Orientation_d0S`, `TauCeti.standardD0Orientation_d0Y`,
  `TauCeti.standardD0Orientation_relator`, `TauCeti.isUnit_neg_three`,
  `TauCeti.negThreeUnit_coe` (`Demushkin/Orientation.lean`).
  **Checks.**
  - The values are `χ(A) = -1`, `χ(S) = 1`, `χ(Y) = -1/3`, and the relator `A²S⁴(S,Y)` maps to
    `(-1)² · 1⁴ · 1 = 1`; the trivial character also kills the relator, so the relator alone does
    not pin `χ`, and uniqueness needs all three values.
  - With `χ(A) = 1` instead, the image is topologically generated by `-3` alone, which is
    `U^(2) = 1 + 4ℤ₂` of index 2, so surjectivity fails: the sign on `A` is what makes the image
    `ℤ₂ˣ`.
  - `χ(Y) = (-3)⁻¹ = (1 - 2²)⁻¹` is the value `(1 - 2^f)⁻¹` of the odd-rank marked
    classification at `f = 2`; since `-3 ≡ 5 mod 8` topologically generates `U^(2)`, the image is
    `{±1} × U^(2) = ℤ₂ˣ`, matching level `f = 2`, and not `f = 3`, where `(1 - 8)⁻¹ = -1/7`.
- **The prescription property.** For a continuous character `χ : G →ₜ* ℤ_pˣ`, write
  `I(χ)/p^i` for `ℤ/p^i` with action `g · x = χ(g)x`; this is Tau Ceti's twisted module
  `TauCeti.ZModTwist χ i`, placed in the universe of `G`, with the scalar
  `TauCeti.charScalar χ i` and the reductions `TauCeti.ZModTwist.reduce`. When
  `dim H¹(G, 𝔽_p) < ∞`, the following three conditions are equivalent; Labute Prop. 6 proves
conditions 1 and 3 equivalent (his (1) and (3), through his intermediate prescription condition
modulo `p^i`), and condition 2 is Tau Ceti's reformulation of condition 1:
  1. the reduction map `H¹(G, I(χ)/p^i) → H¹(G, I(χ)/p)` is surjective for every
     `i ≥ 1`;
  2. for every `i ≥ 1`, the map `H²(G, I(χ)/p^i) → H²(G, I(χ)/p^{i+1})` induced by the
     coefficient inclusion `×p : I(χ)/p^i → I(χ)/p^{i+1}` is injective, equivalently the
     connecting map `H¹(G, I(χ)/p) → H²(G, I(χ)/p^i)` of the short exact sequence
     `0 → I(χ)/p^i --×p→ I(χ)/p^{i+1} → I(χ)/p → 0` is zero. This is not the injectivity of
     the reduction `H²(G, I(χ)/p^{i+1}) → H²(G, I(χ)/p^i)`, which can fail: for `G = C₂` with
     its sign character, `H²(G, I(χ)/2^i) = (I(χ)/2^i)[2]`, and the reduction from level 2 to
     level 1 kills the class of `2 mod 4`, although the prescription property holds;
  3. for a minimal generating tuple `g₁, …, g_n` and every
     `(c₁, …, c_n) ∈ ℤ_p^n`, there is a compatible inverse system of continuous crossed
     homomorphisms to `I(χ)/p^i` taking `g_j` to `c_j mod p^i`.

  `HasPrescriptionProperty` is condition 1, and it is Tau Ceti's
  `TauCeti.HasPrescriptionProperty χ`, stated on the explicit model of continuous cohomology,
  with its cochain criterion `TauCeti.hasPrescriptionProperty_iff`. The equivalence of
  conditions 1 and 2 is Tau Ceti's
  `TauCeti.hasPrescriptionProperty_iff_forall_explicitDelta1_eq_zero` (the connecting-map form)
  and `TauCeti.hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow` (the form with
  `explicitCoeff2` of `TauCeti.ZModTwist.mulPow`, the coefficient map `×p`); condition 3,
  and the lifting of a class through every level
  (`TauCeti.HasPrescriptionProperty.surjective_explicitCoeff1_reduce`) that it rests on, is the
  milestone here. The finite coefficient modules are primary; a crossed homomorphism valued
  directly in `I(χ)` is introduced only after constructing the inverse limit. This equivalence
  is the bridge from Kummer-compatible finite coefficients in downstream arithmetic
  applications to the marked character values used by the abstract classification. A
  downstream application proves `TauCeti.HasPrescriptionProperty` for its own continuous
  character and hands it to the uniqueness theorem below; there is no second prescription
  predicate and no comparison between two of them.
  *Needs:* L5 coefficient objects; PC-5 connecting maps and exactness; TC
  `TauCeti.ZModTwist`, `TauCeti.HasPrescriptionProperty`, `TauCeti.hasPrescriptionProperty_iff`.
  *Source:* Labute Prop. 6 for 1 ⟺ 3; Tau Ceti, as cited above, for 1 ⟺ 2.
- **The canonical character.** For `dim H¹(G, 𝔽_p) < ∞` the three prescription conditions
  above are equivalent, and a free pro-`p` group satisfies them for every `χ`
  (`TauCeti.freeProP.hasPrescriptionProperty`).
  **Theorem.** A Demushkin group has exactly one continuous character `χ : G →ₜ* ℤ_pˣ` with the
  prescription property (`existsUnique_hasPrescriptionProperty`). Define `demushkinCharacter G`,
  a continuous homomorphism, to be that character; `demushkinCharacter_unique` says that any
  continuous character with the prescription property is it. Prove that its image is closed,
  and that it is invariant under topological isomorphism; the second statement is the
  transport lemma that the acceptance instances use. Prove `Im χ = 1 + q(G)ℤ_p` only in the
  case `q(G) ≠ 2`. For `q(G) = 2` keep `Im χ` as a separate invariant, and do not recover `q`
  from a containment.
  *Needs:* L5 the coefficient objects; PC-1 `coeffMap`; L7 the predicate; L4 `ℤ_p` chain; TC
  `TauCeti.HasPrescriptionProperty`.
  *Source:* Labute Prop. 6 and Thm 4.
  **Checks.**
  - `G = ℤ/2`, `χ` trivial: `H¹(G, ℤ/2^i) = Hom(C₂, ℤ/2^i)` is generated by `2^{i-1}`, which
    reduces to `0` in `H¹(G, ℤ/2)` for `i ≥ 2`, so the prescription property fails. With the
    sign character, crossed homomorphisms are all `a ∈ ℤ/2^i` and coboundaries are `2ℤ/2^i`,
    so `H¹ = ℤ/2`, generated by `1`, reduces onto `H¹(G, ℤ/2)`: the canonical character is the
    sign, with image `{±1}`. The model "χ is always trivial" fails here.
  - `G = ℤ_p²`: the trivial character has the property, so `Im χ = 1 = 1 + qℤ_p` with `q = 0`.
  - `G = ⟨x₁, x₂ ∣ x₁^p(x₁, x₂)⟩`, `p` odd, `q = p`: the marked theorem
    `isDemushkin_marked_of_q_ne_two` gives `χ(x₁) = 1` and `χ(x₂)(1 - p) = 1`, so
    `Im χ` is the closed subgroup generated by `(1 - p)⁻¹`, which is `1 + pℤ_p`. The trivial character, which works for
    `ℤ_p²`, is excluded here because `q ≠ 0` forces `Im χ = 1 + qℤ_p ≠ 1`.
- **The closed subgroups of `ℤ₂ˣ`.** This item is `ℤ_pˣ`-theory, with no cohomology. Named
  definitions first, for `f : ℕ∞` with `f ≥ 2`:
  - `U^(f) := 1 + 2^f ℤ₂`, with `U^(∞) = {1}`;
  - `V^(f) := {±1} × U^(f)`, the subgroup generated by `-1` and `U^(f)`, with
    `V^(∞) = {±1}`;
  - `U^[f] := closure ⟨-1 + 2^f⟩` for `2 ≤ f < ∞`.

  Then:
  - **Exhaustiveness and uniqueness.** Every nontrivial closed subgroup of `ℤ₂ˣ` is exactly
    one of `U^(f)` for `2 ≤ f < ∞`, `V^(f)` for `2 ≤ f ≤ ∞`, and `U^[f]` for `2 ≤ f < ∞`,
    and no two entries of that list are equal. `U^(∞) = {1}` is trivial, so it is not in the
    list, although it is a legitimate value of the `f = ∞` convention elsewhere: it is the
    image of `χ` for a free pro-`2` group. Route: `ℤ₂ˣ = {±1} × (1 + 4ℤ₂)`, with
    `1 + 4ℤ₂ ≅ ℤ₂` through the logarithm, so the closed subgroups of the second factor are
    the `1 + 2^fℤ₂`; the three families are the three ways a closed subgroup sits over
    `{±1}`. The families are indexed by `f : ℕ`, and the members at
    `f = ∞` are written separately, because an `ℕ∞`-indexed definition would carry a junk
    value at `∞`.
  - **Procyclicity.** `U^(f)` and `U^[f]` are procyclic. `V^(f)` with `f < ∞` is not,
    because its Frattini quotient is `(ℤ/2)²`. Equivalently, a closed subgroup is procyclic
    if and only if it does not contain `-1` together with a nontrivial element of `1 + 4ℤ₂`;
    that is the form Tau Ceti states.
  - **Indices and intersections.** `profiniteIndex U^(f) ℤ₂ˣ = 2^{f-1}`,
    `profiniteIndex V^(f) ℤ₂ˣ = 2^{f-2}`, `profiniteIndex U^[f] ℤ₂ˣ = 2^{f-1}`, and
    `U^[f] ∩ (1 + 4ℤ₂) = U^(f+1)`. For the last one, the generator `g = -1 + 2^f` has
    `g² = 1 - 2^{f+1}u` with `u = 1 - 2^{f-1}` odd, so the even powers of `g` are exactly
    `U^(f+1)`, and that intersection is what gives the index. In the notation of Layer 8,
    `(A : A²) = 2` for `U^(f)` and for `U^[f]`, and `(A : A²) = 4` for `V^(f)` with
    `f < ∞`. Check these at `f = 2, 3, 4` by squaring: a shift of one in this exponent
    changes the parametrization of the whole `q = 2` classification.
  - **Odd `p`.** For odd `p`, `ℤ_pˣ ≅ μ_{p-1} × (1 + pℤ_p)`, and the closed subgroups of
    `1 + pℤ_p` are exactly the `1 + p^fℤ_p`. The proof uses the `p`-adic logarithm with its
    domain restricted to `1 + pℤ_p`, where it is an isomorphism of topological groups onto
    `pℤ_p`. The restriction of the domain is part of the statement: the logarithm does not
    converge on all of `ℤ_pˣ`.
  - **Which subgroups occur as images.** For each normal form of Layer 9, the closed
    subgroup generated by the character values on the normal-form basis, computed
    explicitly. The marked classification reads its values from this table.

  *Needs:* L1 index; M `PadicInt`, M `PadicInt.toZModPow`, M the `p`-adic logarithm.
  *In Tau Ceti:* `TauCeti.unitsPrincipal` and `TauCeti.unitsPlusMinus`, with
  `TauCeti.closedSubgroup_units_two_classification`, `TauCeti.unitsPrincipal_inj`,
  `TauCeti.unitsPlusMinus_inj`, `TauCeti.unitsPrincipal_ne_unitsPlusMinus` and its companions,
  `TauCeti.exists_topologicalClosure_zpowers_eq_of_isClosed_of_neg_one_notMem`,
  `TauCeti.not_exists_topologicalClosure_zpowers_eq_unitsPlusMinus`,
  `TauCeti.index_unitsPrincipal_two`, `TauCeti.index_unitsPlusMinus`,
  `TauCeti.relIndex_map_powMonoidHom_two_eq_one_or_two_or_four`. In `Suggested.lean`, `{±1}` is
  `Subgroup.zpowers (-1)` and `U^[f]` is `procyclicClosure u = (Subgroup.zpowers u).topologicalClosure`
  at `u = -1 + 2^f`, the forms Tau Ceti's classification uses.
  *Source:* the remark after the corollary to Labute Thm 4.
  **Checks.**
  - `f = 2`: `U^(2) = 1 + 4ℤ₂` has index `2`; `V^(2) = ℤ₂ˣ` has index `1 = 2⁰`; `U^[2]` is
    the closure of `⟨3⟩`, with `3² = 9 = 1 + 8`, a generator of `U^(3)`, so
    `U^[2] ∩ U^(2) = U^(3)` and `U^[2]` has index `2`.
  - `f = 3`: `U^[3]` is the closure of `⟨7⟩`, with `7² = 49 = 1 + 16 · 3`, so
    `U^[3] ∩ U^(2) = U^(4)` and the index is `4 = 2²`; an off-by-one parametrization would give
    `U^(3)` or index `2`.
  - `(A : A²)`: `2` for `U^(f)`, `U^[f]` and `{±1}`; `4` for `V^(f)` with `f < ∞`, whose
    Frattini quotient is `C₂²`, so `V^(f)` is not procyclic.

#### Demushkin duality, concretely

A general theory of profinite duality groups, dualizing modules and `PD^n` is not built
here, and the terms do not occur in any milestone. What Layer 9 uses is a small
package of statements about finite discrete modules, and that package is stated here.

- **Dimension two.** An infinite Demushkin group has `cd_p G = 2`
  (`cd_p_eq_two_of_isDemushkin`). The lower bound `2 ≤ cd_p G` follows from
  `H²(G, 𝔽_p) ≠ 0`, which is part of the definition. For the upper bound, first prove the
  finite-module Tate duality target below for every finite discrete `𝔽_p[G]`-module, with
  `α₂ : H²(G, M) → Hom(H⁰(G, M^∨), H²(G, 𝔽_p))` the cup-evaluation map. Its bijectivity is the
  hypothesis of Tau Ceti's `TauCeti.IsProP.cohomologicalDimensionAt_le_two_of_forall_dualityMap2_bijective`;
  that criterion obtains right exactness of `H²` on finite modules and then `cd_p G ≤ 2`.
  The one-relator presentation and five-term sequence alone are not this upper-bound argument.
  *Needs:* L6 `cd_p`; L7 finite-module Tate duality; L7 the predicate.
  *In Tau Ceti:* `TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two` and
  `TauCeti.IsProP.cohomologicalDimensionAt_le_two_of_forall_dualityMap2_bijective`.
  *Source:* Tate, in Serre, *Structure de certains pro-p-groupes*, §9.1.
- **The trace isomorphism.** Fix the isomorphism `tr : H²(G, 𝔽_p) ≅ 𝔽_p` determined by a
  choice of nonzero element. The choice is unique up to `𝔽_pˣ`; name a generator, and record
  that the statements below do not change under rescaling. Every pairing below is normalized
  through `tr`.
  *Needs:* L7 the predicate.
- **Tate duality on every finite `𝔽_p[G]`-module.** For an infinite Demushkin group `G` and
  every finite discrete `G`-module `M` killed by `p`, let
  `M^∨ = Hom_{𝔽_p}(M, 𝔽_p)` with its contragredient action. Define the three cup-evaluation maps
  `α_j(M) : H^j(G,M) → Hom_{𝔽_p}(H^{2-j}(G,M^∨), H²(G,𝔽_p))`, for `j = 0,1,2`, and prove each
  bijective. State the evaluation pairing and module action explicitly; this is the finite-module
  Tate theorem needed by `cd_p`, not only duality for the special twists `I(χ)/p^i`.
  The proof order is fixed: use the trivial-module cup pairing as the `α₁` base case, one-dimensional `H²` for `α₀`, and the
  universal degree-two scalar map for `α₂`; pass through finite-module filtrations by trivial
  `𝔽_p` factors using the exact-sequence duality lemmas. For infinite `G`, include the
  co-effacement argument that gives injectivity of `α₀` and the finite-cardinality/double-dual
  argument that makes `α₂` surjective. Only after all finite modules are covered may the
  right-exactness criterion in the dimension-two target be applied.
  *Needs:* L5 the coefficient and cup maps; L6 finite-module filtrations and exact sequences; L7
  the predicate.
  *In Tau Ceti:* `TauCeti.IsDemushkin.dualityMap0_bijective`,
  `TauCeti.IsDemushkin.dualityMap1_bijective`, `TauCeti.IsDemushkin.dualityMap2_bijective`,
  and `TauCeti.IsProP.cohomologicalDimensionAt_le_two_of_forall_dualityMap2_bijective`.
- **The perfect pairings that are used.** For an **infinite** Demushkin group `G`, for every
  `i ≥ 1` and every finite discrete `G`-module `M` annihilated by `p^i`, the cup pairing
  `H^j(G, M) × H^{2-j}(G, M^∨(χ)) → H²(G, I(χ)/p^i) ≅ ℤ/p^i` is perfect for
  `j = 0, 1, 2`, where `M^∨(χ) := Hom(M, I(χ)/p^i)` carries the diagonal action. This is the
  all-finite-module scope of Tau Ceti's `TauCeti.IsDemushkin.dualityMap0_zModTwist_bijective`,
  `TauCeti.IsDemushkin.dualityMap1_zModTwist_bijective`, and
  `TauCeti.IsDemushkin.dualityMap2_zModTwist_bijective` results; it is not restricted to rank-one
  twists. Finite discrete `p`-primary modules are covered because each is
  annihilated by some `p^i`.
  *Needs:* L5 the coefficient objects and `cupFp`; L7 trace and canonical character.
  *Source:* Serre, *Structure de certains pro-p-groupes*, §9.
  This infinite-group hypothesis is essential. The finite rank-one group `C₂` remains in the
  programme through its period-two resolution: for the sign module `I(χ)/2^i = ℤ/2^i`,
  `H^{2k}(C₂, I(χ)/2^i) ≅ (I(χ)/2^i)[2] ≅ ℤ/2` for `k ≥ 1`, and
  `H^{2k+1}(C₂, I(χ)/2^i) ≅ (I(χ)/2^i)/2(I(χ)/2^i) ≅ ℤ/2` for `k ≥ 0`.
  In particular `H²` has order two, not `2^i`; these finite calculations are separate targets,
  not instances of this infinite-group perfect-duality theorem.
- **Naturality.** Compatibility of the pairings with restriction to an open subgroup and
  with corestriction, in the form `⟨res a, b⟩_U = ⟨a, cor b⟩_G`. These are the two
  compatibilities that the open-subgroup theorem uses.
  *Needs:* L5 change-of-group maps; L7 the pairings.
- **The role of the character.** For `i ≤ i'` the transition maps of the system
  `(I(χ)/p^i)_i` are `G`-equivariant, and the induced action on the compatible system of
  duals `Hom(𝔽_p, I(χ)/p^i)` is by `χ` modulo `p^i`. This is the precise sense in which `χ`
  controls the duality. The direct limit of the `ℤ/p^i` along the inclusions `×p`, which is
  `ℚ_p/ℤ_p`, is not a coefficient module of any statement here; the inverse limit of the same
  modules along the reductions is `ℤ_p`.
  *Needs:* L7 canonical character; L5 the coefficient objects.
- **The three-term Euler formula.** For `G` topologically finitely generated pro-`p` with
  `cd_p G ≤ 2`, **with `H^i(G, 𝔽_p)` finite-dimensional for `i = 0, 1, 2`**, and `U ≤ G`
  open: the six spaces are finite-dimensional and, in `ℤ`, the alternating sum
  `Σ_{i=0}^{2} (-1)^i finrank H^i(U, 𝔽_p)` equals
  `[G : U] · Σ_{i=0}^{2} (-1)^i finrank H^i(G, 𝔽_p)`.
  The proof has the shape of the two-term case, one degree longer, with the same inputs:
  Shapiro, the long exact sequence, and the trivial-filtration theorem of Layer 6.
  Finiteness for `U` is part of the conclusion and follows from the hypothesis for `G`
  through Shapiro; finiteness for `G` is a hypothesis, and not a consequence. Substituting
  `finrank H⁰ = finrank H² = 1` for a Demushkin group gives the rank formula.
  ⚠ Topological finite generation bounds `H⁰` and `H¹` only. It does not bound `H²`, whose
  dimension is the relation rank, so the finiteness hypothesis is not redundant: a
  topologically finitely generated pro-`p` group need not be finitely presented. For a
  Demushkin group the hypothesis holds, since `dim H² = 1` is part of the definition, and
  that is the case the open-subgroup theorem uses.
  *Needs:* PC-7 Shapiro in degrees `≤ 2`; PC-5 the long exact sequence through `H²`; PC-10
  `delta`, `longExact_exact` for the connecting map into `H³`, which vanishes because
  `cd_p G ≤ 2` and makes the last map in degree two surjective; L6 trivial filtration.
- **The open-subgroup theorem.** For `G` infinite Demushkin and `U ≤ G` open: `U` is
  Demushkin (`IsDemushkin.openSubgroup`); `n(U) - 2 = [G : U](n(G) - 2)` in `ℤ`
  (`IsDemushkin.demushkinRank_openSubgroup_sub_two`); and
  `demushkinCharacter U = (demushkinCharacter G) ∘ (inclusion U)`
  (`IsDemushkin.demushkinCharacter_openSubgroup`). Each is closed by the Tau Ceti theorem of the
  same name in the namespace `TauCeti.IsDemushkin`. Use the actual finite-index
  coinduced module `Coind_U^G 𝔽_p`: it is finite discrete, its dual is identified with the same
  permutation module, and Shapiro identifies its cohomology with that of `U`. The bijective
  `α₂` pairing computes `H²(U, 𝔽_p)` from `H⁰(U, 𝔽_p) = 𝔽_p`; the bijective `α₁` pairing and
  the Shapiro/cup projection formula transport nondegeneracy of the cup product to `U`.
  The rank formula then uses the three-term Euler formula below after `cd_p G ≤ 2`. For the
  character, for every `i ≥ 1` use the finite discrete module
  `Coind_U^G(I(χ|_U)/p^i)`. It is annihilated by `p^i`, hence also by `p^(i+1)`. Apply the
  all-finite-module twisted theorem at exponent `i+1`: its `α₂` map has source coefficients this
  coinduced module and value coefficients `I(χ)/p^(i+1)`. Restricting the value module
  `I(χ)/p^(i+1)` from `G` to `U` identifies it with `I(χ|_U)/p^(i+1)`. Shapiro is applied
  separately to this `α₂` map with its coinduced input, and descends injectivity to the map for
  `U` at level `i+1`, on the input `I(χ|_U)/p^i`. This is
  exactly the exponent shift used by Tau Ceti's proof of
  `TauCeti.IsDemushkin.demushkinCharacter_openSubgroup`. The
  coinduced module need not be cyclic: for `G = ℤ_p²`, index-`p` `U`, and trivial `χ`, it is
  additively `(ℤ/p^i)^p`. Merely proving rank-one twisted duality or restricting the
  trivial-coefficient pairing is not enough.
  *Needs:* L6 `cd` of open subgroups; L7 pairings and naturality; L7 Euler formula.
  *Source:* Serre, *Structure de certains pro-p-groupes*, §9.2.
  ⚠ The hypothesis "infinite" is used: `ℤ/2` is Demushkin and finite, and its proper open
  subgroup `1` is not Demushkin, since `H²(1, 𝔽₂) = 0`. The numerical rank formula happens to
  hold there (`0 - 2 = 2 · (1 - 2)`), so it is the Demushkin conclusion, not the formula, that
  fails.
- **Recognition criteria.** For a topologically finitely generated one-relator pro-`p` group
  `G` with `n(G) > 1`, the following are equivalent:
  1. `G` is Demushkin;
  2. `cd_p G = 2` and `finrank H²(N, 𝔽_p) = 1` for every open normal `N ≤ G`;
  3. `cd_p G = 2` and `n(N) - 2 = [G : N](n(G) - 2)` in `ℤ` for every open normal `N ≤ G`.

  The sharpened forms, in which `N` ranges only over the open normal subgroups of index `p`,
  are separate statements with the same proof. These are exported as abstract recognition
  criteria for downstream consumers.
  *Needs:* L7 open-subgroup theorem; L6 `cd`.
  *Source:* NSW (3.9.15), due to Andozhskii and to Dummit–Labute. NSW also lists an
  equivalent condition phrased through a dualizing module; that formulation needs vocabulary
  this roadmap does not define, so it is not among the equivalences here.

#### Examples

- `ℤ/2` (`n = 1`, `q = 2`), `ℤ_p²` (`n = 2`, `q = 0`), `D₀` (`n = 3`, `q = 2`).
- Non-examples: `1`, `ℤ_p`, `ℤ/4`, `C_p²`.

#### Dependencies

Layers 1 and 3 to 6; ProfiniteCohomology Layers 1, 5, 7 and 10; Tau Ceti
`TauCeti.IsDemushkin`, `TauCeti.HasPrescriptionProperty`, `TauCeti.ZModTwist`.

### Layer 8: the central-tower comparison method and finite-quotient determinacy

This layer states the classification method as a theorem about a finite inverse system, and
not as a description of a technique. Two pro-`p` groups are compared through the finite
quotients of the lower `p`-series, and the comparison is then assembled. Nothing in this
layer is cohomological.

#### Notation, fixed for Layers 8 and 9

Every symbol used in the two hardest layers is declared here. Where Labute's indexing
differs, the translation is stated once.

- `λ_k := pLowerCentralSeries p G k`, 0-based: `λ_0 = G` and
  `λ_{k+1} = closure (λ_kᵖ ⬝ [λ_k, G])`. Labute's `F_i` is 1-based with `F_1 = F`, so his
  `F_i` is our `λ_{i-1}`, and his `F_3`, the modulus of the normal-form congruences, is our
  `λ_2`. Every Labute index below is translated in place.
- `gr_k(G) := λ_k / λ_{k+1}`, a profinite elementary abelian `p`-group, that is a profinite
  `𝔽_p`-vector space, written additively. It is Tau Ceti's `TauCeti.gradedPiece p G k`, the
  `Additive` of the group quotient, so that the additive notation of this layer is the Lean
  notation too; the class of an element of `λ_k` is `TauCeti.gradedMk`, and the `𝔽_p`-module
  structure is `TauCeti.instModuleZModGradedPiece`. `gr(G) := ⨁_{k ≥ 0} gr_k(G)`.
  ⚠ `gr_k(G)` is **finite** only under topological finite generation, and that is a theorem,
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_gradedPiece`, proved from openness of
  `λ_{k+1}`. Without it the statement is false, since `G = ∏_I C_p` with `I` infinite has
  `λ_1(G) = 1` and `gr_0(G) = G`. Every span statement, basis correction and dimension count
  below is therefore stated for a free pro-`p` group of finite rank, or for another group
  that is explicitly topologically finitely generated.
- The **bracket** `gr_j × gr_k → gr_{j+k+1}`, induced by the group commutator, is Tau Ceti's
  biadditive `TauCeti.gradedBracket`, with its `𝔽_p`-bilinear form
  `TauCeti.gradedBracketLinear`; the degree shifts by one because the indexing is 0-based, since
  `[λ_j, λ_k] ≤ λ_{j+k+1}`. The **`p`-power operator** `π : gr_k → gr_{k+1}`,
  `π(x λ_{k+1}) = x^p λ_{k+2}`, is `TauCeti.gradedPow`. Both are named maps and not existence
  statements, and each carries its defining equation on classes, `TauCeti.gradedBracket_gradedMk`
  and `TauCeti.gradedPow_gradedMk`; the two degree-raising membership statements
  `TauCeti.commutator_mem_pLowerCentralSeries` and `TauCeti.pow_mem_pLowerCentralSeries` are what
  make them well defined. The bracket is alternating (`TauCeti.gradedBracket_self`) and satisfies
  the Jacobi identity (`TauCeti.gradedBracket_jacobi`); `π` is additive in every degree `k ≥ 1`
  (`TauCeti.gradedPow_add_of_one_le`) and, for odd `p`, in degree zero too
  (`TauCeti.gradedPow_add_zero_of_odd`); it commutes with `𝔽_p`-scalars in every degree
  (`TauCeti.gradedPow_smul`). A continuous homomorphism induces `TauCeti.gradedMap`, compatible with both
  operations by `TauCeti.gradedMap_gradedBracket` and `TauCeti.gradedMap_gradedPow`, and
  surjective in each degree for a continuous surjection (`TauCeti.gradedMap_surjective`).
  *Source:* Labute Prop. 1 and Prop. 2, in our indexing.
  *In Tau Ceti:* `Topology/Algebra/Group/LowerCentralSeries/Graded/Basic.lean`.
- **`π` against the bracket, and the dyadic failure.** For every `p` the bracket is
  `π`-bilinear away from degree zero: `π[x, y] = [πx, y]` for `x ∈ gr_j` with `j ≥ 1`, and
  `π[x, y] = [x, πy]` for `y ∈ gr_k` with `k ≥ 1`, all three terms lying in `gr_{j+k+2}`
  (`TauCeti.gradedPow_gradedBracket_left`, `TauCeti.gradedPow_gradedBracket_right`). The group
  identities behind this, for `[x, y] = x⁻¹y⁻¹xy` and `x ∈ λ_j`, `y ∈ λ_k`, are the exact
  conjugation identities `[x², y] = [x, y]^x [x, y]` and `[x, y²] = [x, y] [x, y]^y`, with
  `[x, y]^z = [x, y]·[[x, y], z]`. Hence `[x, y²] = [x, y]²·[[x, y], y]` exactly, and
  `[x², y] = [x, y]²·[[x, y], x]` modulo the commutator of `[[x, y], x]` with `[x, y]`, which lies
  in `λ_{3j+2k+4}`. The correction terms `[[x, y], x]` and `[[x, y], y]` lie in `λ_{2j+k+2}` and
  `λ_{j+2k+2}`, so they vanish in `gr_{j+k+2}` unless the corresponding argument has degree
  zero. For odd `p` the operator `π` is
  additive as well, because the Hall–Petrescu corrections carry coefficients `binom(p, i)` that
  are divisible by `p`, and the degree-zero corrections vanish too
  (`TauCeti.gradedPow_gradedBracket_left_of_odd` and its mirror image); hence `gr(G)` is a graded
  Lie algebra over `𝔽_p[π]`, with `π` of degree one.
  **For `p = 2` additivity fails in degree zero.** The exact failure is
  `π(x + y) = π(x) + π(y) + [x, y]` in `gr_1(G)`, for `x, y ∈ gr_0(G)`, which is the
  `binom(2, 2)` term of the Hall–Petrescu expansion (`TauCeti.gradedPow_add_zero_of_two`, the
  case `p = 2` of `TauCeti.gradedPow_add_zero`). In degree zero the bracket identities also
  acquire the correction `[πx, y] = π[x, y] + [[x, y], x]`, and its mirror image
  (`TauCeti.gradedBracket_gradedPow_zero_left_of_two`,
  `TauCeti.gradedBracket_gradedPow_zero_right_of_two`). So `gr(F)` for free pro-`2` `F` is not an
  `𝔽_2[π]`-Lie algebra. The failure is not vacuous: in `F` free pro-`2` of rank 2,
  `[x̄₁, x̄₂] ≠ 0` in `gr_1(F)` (`TauCeti.gradedBracket_freeProP_two_ne_zero`), so `π` is not
  additive on `gr_0(F)` (`TauCeti.gradedPow_freeProP_two_not_additive`). Every `q = 2` argument
  downstream has this shape.
  *Needs:* L8 the graded object; M the commutator identities.
  *In Tau Ceti:* `Topology/Algebra/Group/LowerCentralSeries/Graded/Basic.lean` and `Pow.lean`;
  `Topology/Algebra/Group/Profinite/Free/Graded.lean`.
- **Openness and cofinality.** In a topologically finitely generated
  pro-`p` group every `λ_k` is open, by induction, and the series is a neighbourhood basis
  of `1`, so `G ≅ lim_k G/λ_k` with finite `p`-group levels and any comparison runs level by
  level. Each `λ_k` is closed, normal and characteristic, with `λ_{k+1} ≤ λ_k`. A continuous
  homomorphism satisfies `f(λ_k(G)) ≤ λ_k(H)`, with equality when `f` is surjective.
  *Needs:* L3 Frattini theory and finite generation; L0 inverse limits.
  *In Tau Ceti:* `TauCeti.pLowerCentralSeries`, `TauCeti.isClosed_pLowerCentralSeries`,
  `TauCeti.pLowerCentralSeries_normal`, `TauCeti.pLowerCentralSeries_antitone`,
  `MonoidHom.map_pLowerCentralSeries_le`, `MonoidHom.map_pLowerCentralSeries_eq_of_surjective`,
  `ContinuousMulEquiv.map_pLowerCentralSeries_eq`,
  `TauCeti.IsTopologicallyFinitelyGenerated.isOpen_pLowerCentralSeries`,
  `TauCeti.IsProP.exists_pLowerCentralSeries_le`, `TauCeti.pLowerCentralSeries_one_eq_proPFrattini`.
  *Source:* Ribes–Zalesskii Prop. 2.8.13 states the same for the iterated Frattini series;
  prove it for both series, because they interleave.
- **`δ_j`, the basis-modification maps.** Let `F = freeProP p (Fin n)` with basis
  `x_1, …, x_n`, and let `r ∈ λ_1(F)` be a relator; `R` is the closed normal subgroup
  generated by `r`, and `R_j := R ∩ λ_j(F)`. Modifying the basis by `x_i ↦ x_i w_i` with
  `w_i ∈ λ_{j-1}(F)`, for `j ≥ 1`, moves `r` inside its coset by an element of `λ_j(F)`
  whose class in `gr_j(F)` depends only on the classes `w̄_i ∈ gr_{j-1}(F)`. That map is
  `δ_j : gr_{j-1}(F)^{⊕ n} → gr_j(F)`. Write
  `r̄ = Σ_i c_i π(x̄_i) + Σ_{i<k} a_{ik} [x̄_i, x̄_k]` in the standard basis of `gr_1(F)`, where
  `r̄` is the class of the relator, `x̄_i ∈ gr_0(F)` is the class of `x_i`, `c_i ∈ 𝔽_p` is the
  coefficient of `x_i^p` in the `p`-power part and `a_{ik} ∈ 𝔽_p` that of `[x̄_i, x̄_k]` in the
  commutator part, and let `∂_i r̄ = Σ_{k>i} a_{ik} x̄_k - Σ_{k<i} a_{ki} x̄_k ∈ gr_0(F)`, so that
  `Σ_i [w̄_i, ∂_i r̄] = Σ_{i<k} a_{ik} ([w̄_i, x̄_k] + [x̄_i, w̄_k])`. Then
  - for `j ≥ 2`,
    `δ_j(w̄_1, …, w̄_n) = Σ_i [w̄_i, ∂_i r̄] + Σ_i c_i (π(w̄_i) + binom(p, 2) [w̄_i, x̄_i])`;
  - for `j = 1`, modifying both entries of a commutator contributes the bracket of the two
    modifications as well, which lands in `gr_1(F)` only when both lie in `gr_0(F)`:
    `δ_1(w̄_1, …, w̄_n)` is the sum of `Σ_i [w̄_i, ∂_i r̄] + Σ_{i<k} a_{ik} [w̄_i, w̄_k]` and
    `Σ_i c_i (π(w̄_i) + binom(p, 2) [w̄_i, x̄_i])`.

  Every term lands in `gr_j(F)`: the brackets raise the degree by `0 + (j - 1) + 1`, the bracket
  `[w̄_i, w̄_k]` by `(j - 1) + (j - 1) + 1`, which is `j` exactly when `j = 1`, and `π` raises it
  by one. The term `binom(p, 2) [w̄_i, x̄_i]` vanishes for odd `p`; at `p = 2` it is
  `c_i [w̄_i, x̄_i]`, because `(x_i w_i)² = x_i² w_i² [w_i, x_i]` modulo `λ_{j+1}(F)`, and it is
  the trace, in every degree, of the failure of additivity of `π` on `gr_0(F)` (Labute's
  `[τ₁, ξ₁]` on p. 124). ⚠ The `j ≥ 2` formula is false at `j = 1`, for every `p`: at `p = 3`,
  for `r = (x₁, x₂)` and the continuous automorphism `x_i ↦ x_i²` (its Frattini matrix is
  `2I`, so it is one by Burnside), the relator class goes to `4 r̄`, a deviation of
  `3 r̄ = 0`, while the `j ≥ 2` formula gives `2 r̄ ≠ 0`; the missing term is
  `a_{12} [x̄₁, x̄₂] = r̄`. The image `Im δ_j ≤ gr_j(F)` is the subspace in the span statements
  of Layer 9, which use `δ_j` only for `j ≥ 2`; the degree-one basis change is the cup-form
  argument of Layer 9 instead. Linearity holds exactly in those degrees:
  - for `j ≥ 2` the map `δ_j` is `𝔽_p`-linear, because `π` is additive above degree zero and
    every term is linear in `w̄`;
  - for `j = 1` the map `δ_1` is quadratic, and it fails to be additive as soon as some
    `a_{ik} ≠ 0`, for every `p`, or `p = 2`, the rank `n` is at least two and some `c_i ≠ 0`,
    because `π(x + y) = π(x) + π(y) + [x, y]` on `gr_0(F)`. The rank condition is needed: in
    rank one `gr_0(F) = 𝔽_p ξ₁` has zero bracket, and for `r = x₁²` at `p = 2` the map
    `δ_1 = π` is additive. For a Demushkin relator of rank at least two one of these conditions
    holds, because the cup form is nondegenerate (the rank-two relator `x₁²x₂²` at `p = 2` has
    every `a_{ik} = 0` and `c₁ = c₂ = 1`).
    Its polarization is
    `δ_1(v + w) - δ_1(v) - δ_1(w)`, which is the sum of
    `Σ_{i<k} a_{ik} ([v_i, w_k] + [w_i, v_k])` and `binom(p, 2) Σ_i c_i [w_i, v_i]`,
    so for odd `p` only the commutator part of `r̄` contributes, and at `p = 2` the `p`-power
    part adds `Σ_i c_i [v_i, w_i]`. Every statement that uses `δ_1` is stated against this
    map, and not against the `j ≥ 2` formula.

  The milestones are well-definedness of `δ_j`, linearity for `j ≥ 2`, the formula and the
  polarization identity at `j = 1`, and the explicit formula at a relator in normal form. For
  `j ≥ 2` Tau Ceti has the first two and the formula, in the standard basis of `gr_1(F)`:
  `δ_j` is the bilinear map `TauCeti.freeProP.basisModificationDelta`, stated for
  modifications by elements of `λ_m(F)` with `m ≥ 1`, the class of `r⁻¹ θ_w(r)` is its value
  (`TauCeti.freeProP.gradedMk_inv_mul_basisModification`), and `basisModificationDelta_apply`
  is the `j ≥ 2` formula above. For the `j = 1` formula and its polarization identity, consume
  `Free/BasisModification/LevelZero.lean`, which supplies
  `TauCeti.freeProP.basisModificationDeltaZero`, `basisModificationDeltaZero_apply`, and
  `basisModificationDeltaZero_add` at the repository pin. Prove the explicit comparisons with
  the displayed formula and polarization using those native declarations and their hypotheses.
  *Needs:* L8 the graded object; L4 free objects.
  *In Tau Ceti:* `TauCeti.freeProP.basisModification`, `TauCeti.freeProP.basisModificationDelta`,
  `TauCeti.freeProP.gradedMk_inv_mul_basisModification`,
  `TauCeti.freeProP.basisModificationDelta_apply`, and the graded deviation
  `TauCeti.gradedDeviation` of `Graded/Deviation.lean` that they rest on.
  *Source:* Labute Prop. 5, in our indexing, and the formula on p. 124.
  API checklist for `pLowerCentralSeries` and `gr`:
  - Constructors: the series itself; the class of an element in `gr_k`; the bracket and the
    operator `π`.
  - Examples: `λ_1(G) = Φ(G)` (`TauCeti.pLowerCentralSeries_one_eq_proPFrattini`);
    `gr_0(G) = G/Φ(G)` (`TauCeti.gradedPieceZeroEquiv`); `gr(F)` for `F` free pro-`p` of rank
    `n`, where `gr_1(F) ≅ Λ²(𝔽_p^n) ⊕ 𝔽_p^n` with basis the classes `π x̄_i` and `[x̄_i, x̄_k]`
    for `i < k` (`TauCeti.freeProP.degreeOneBasis`, `TauCeti.freeProP.finrank_gradedPiece_one`).
  - Morphisms: a continuous homomorphism induces a graded map; a continuous surjection
    induces a surjection in each degree (`TauCeti.gradedMap_surjective`).
  - Functoriality: `f(λ_k(G)) ≤ λ_k(H)`, with equality for a continuous surjection; each
    `λ_k` is characteristic.
  - Comparison lemmas: the interleaving with the iterated Frattini series; agreement with
    Mathlib's `lowerCentralSeries` on the commutator part.
  - Naturality: bracket and `π` commute with the induced maps.
  - Edge cases: `p = 2` in degree zero, where `π` is not additive; a group that is not
    topologically finitely generated, where `λ_k` need not be open.
  - Downstream interfaces: `δ_j` and `T_j` below; the comparison schema; the span statements
    of Layer 9.

  **Checks.**
  - `C₄` at `p = 2`: `λ₀ = C₄`, `λ₁ = C₂`, `λ₂ = 1`, so `gr₀ = gr₁ = 𝔽₂` and `π : gr₀ → gr₁` is
    the squaring isomorphism; the lower central series (commutators only) gives `λ₁ = 1`.
  - `ℤ_p`: `λ_k = p^kℤ_p` and every `gr_k` is `𝔽_p`; a `1`-based reading would put `λ₁ = ℤ_p`.
  - `F` free pro-`p` of rank `2`: `finrank gr₁(F) = 1 + 2 = 3`, the bracket `[x̄₁, x̄₂]` and
    `π x̄₁, π x̄₂`; `Q₈` at `p = 2` has `λ₁ = {±1}` and `λ₂ = 1`.

- **The tails `T_j`.** For `p = 2` the span statements use one further subspace. `T_j` is
  spanned by the iterated `p`-powers `π^j(x̄_i) ∈ gr_j(F)`, over the indices `i` with
  `c_i = 0`, that is over the generators whose exponent in the `p`-power part of the relator
  is not exactly `p`, and which therefore contribute no `π`-term to `δ_j`. For
  `r = x₁²x₂^{2^f}(x₂, x₃)⋯` with `f ≥ 2` these are `x₂, …, x_n`, because `π^f(w̄)` lands in
  `gr_{j+f-1}`, which is above the relevant degree. ⚠ This is the tail of the odd-rank span
  statement only. The even-rank `q = 2` statement uses `⟨π^j x̄_i : i ≠ 2⟩` instead, and the
  character-preserving iteration uses tails inside `gr(X)`; both are in Layer 9.
  *Needs:* L8 the graded object and `δ_j`.
- **`(A : A²)` and the parameters of the normal forms.** `A ≤ ℤ_pˣ` always denotes a closed
  subgroup, `A²` the closed subgroup of squares, and `(A : A²)` the index
  `profiniteIndex A² A`, which is `1`, `2` or `4` for the closed subgroups of `ℤ₂ˣ`, proved
  from the Layer 7 trichotomy. The parameters of the normal forms are these:
  - `n ≥ 1` is the rank;
  - `f` ranges over `2 ≤ f < ∞` together with `f = ∞`, encoded as `f : ℕ∞` with
    `U^(∞) = {1}` and `2^∞ = 0` in the exponent, so that `x^{2^f}` means `x^0 = 1` at
    `f = ∞`;
  - `α ∈ 4ℤ₂` is a `2`-adic integer with `v₂(α) ≥ 2`, where `α = 0` is allowed and
    `v₂(0) = ∞`;
  - `N` is `n/2`, the number of commutator pairs in an even-rank form.

  Each classification statement repeats the ranges that it uses.
  *Needs:* L7 the trichotomy; L1 index.

#### Finite-quotient determinacy

- **Occurring as a quotient.** `IsFiniteContinuousQuotient G Q`, for a finite group `Q`,
  says that there is a surjection `f : G →* Q` with open kernel. Phrasing
  it through the kernel, and not through a topology on `Q`, lets statements quantify over
  `Q` bundled as a `FiniteGrp`, and not over arbitrary types with an unspecified topology.
  For a finite discrete `Q` the two conditions agree, and that agreement is a lemma here.
  Also proved here: the predicate depends only on the isomorphism class of `Q`, and only on
  the topological isomorphism class of `G`.
  *Needs:* L0 open subgroups; M `FiniteGrp`.
  *In Tau Ceti:* `TauCeti.IsFiniteContinuousQuotient`, on an unbundled finite group, with
  `TauCeti.isFiniteContinuousQuotient_iff_exists_continuous`,
  `TauCeti.isFiniteContinuousQuotient_congr_left` and `TauCeti.isFiniteContinuousQuotient_congr_right`;
  `IsFiniteContinuousQuotient G Q` here is that predicate at the underlying group of `Q`.
- **Two epimorphisms.** If `G` is topologically finitely generated, and `G` and `H` have the
  same continuous finite quotients, then there are continuous surjections `G ↠ H` and
  `H ↠ G`. The route has five steps:
  1. `H` is topologically finitely generated, because each of its finite quotients is a
     finite quotient of `G` and so needs at most `d(G)` generators;
  2. for each open normal `N ≤ G` the set `E(N)` of continuous surjections `H ↠ G/N` is
     nonempty, by hypothesis, and finite, by step 1;
  3. for `N' ≤ N` let `E(N', N) ⊆ E(N)` be the image of `E(N')` under composition with
     `G/N' ↠ G/N`; these decrease as `N'` decreases, and each is nonempty and finite, so
     they stabilize at a nonempty set `E∞(N)`;
  4. the `E∞(N)` form an inverse system whose bonding maps **are** surjective, by
     construction, and each is a nonempty finite set;
  5. the Layer 0 compactness lemma gives a compatible family, hence the surjection `H ↠ G`;
     the other direction is symmetric once step 1 is available.

  *Needs:* L0 compactness lemma; L3 finite generation and the Burnside rank bound.
  *In Tau Ceti:* `TauCeti.IsTopologicallyFinitelyGenerated.of_forall_isFiniteContinuousQuotient`,
  `TauCeti.exists_surjective_and_exists_surjective_of_forall_isFiniteContinuousQuotient_iff`.
  ⚠ The raw bonding maps on `E(N)` are **not** surjective, so step 3 is not decoration.
  Counterexample: `H = C₄ × C₂` surjects onto `C₂` by the second projection, and that
  surjection does not factor through `C₄ ↠ C₂`, although `H` does surject onto `C₄`.
- **The isomorphism theorem, sharp form.** If `G` is topologically finitely generated, and
  `G` and `H` have the same continuous finite quotients, then `G ≅ H` as topological groups,
  with **no finite-generation hypothesis on `H`**. The route has three steps:
  1. the two epimorphisms give `φ : G ↠ H` and `ψ : H ↠ G`;
  2. `ψ ∘ φ : G ↠ G` is surjective, hence an isomorphism by the Hopf property of Layer 3,
     which needs finite generation of `G` only;
  3. therefore `φ` is injective, and a continuous bijection of compact Hausdorff groups is a
     topological isomorphism.

  Finite generation of `H` is a conclusion, and not a hypothesis. If the two-epimorphism step is
  easier with both hypotheses, state that weaker lemma first, and then the argument that
  removes the second hypothesis. The statement is
  `nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`, quantified over bundled
  finite groups `Q : FiniteGrp`, with both groups compact, totally disconnected and in one
  universe.
  *Needs:* L8 two epimorphisms; L3 Hopf property.
  *In Tau Ceti:* `TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`.
  **Checks.**
  - `G = H = C₂`: the continuous finite quotients of both are `1` and `C₂`, the hypothesis
    holds, and the conclusion is the identity isomorphism.
  - `G = C₂`, `H = C₄`: `C₄` is a quotient of `H` and not of `G`, so the hypothesis fails; a
    version that compared only the quotients of `G` (one inclusion of the two lists) would
    wrongly identify them, since `C₂` is a quotient of both.
  - `G = ℤ_p`, `H = ℤ_p × ℤ_p`: `C_p × C_p` is a quotient of `H` and not of `G`, so the
    hypothesis fails, as it must since the generator ranks are `1` and `2`.
  - The finite-generation hypothesis on `G` cannot be dropped: for `G = ∏_{n ≥ 1} C_{pⁿ}` and
    `H = G × ℤ_p` every finite abelian `p`-group is a continuous quotient of both, and only
    those, but `H` projects onto `ℤ_p` while every continuous homomorphism `G → ℤ_p` is zero,
    since it kills the dense torsion subgroup `⊕ C_{pⁿ}`.
  *Source:* Fried–Jarden; Ribes–Zalesskii Thm. 3.2.9.
- **Corollary.** Finitely generated abstract groups with the same finite quotients have
  topologically isomorphic profinite completions.
  *Needs:* L8 the isomorphism theorem; M `ProfiniteGrp.profiniteCompletion`.
  *Source:* Dixon–Formanek–Poland–Ribes 1982; Ribes–Zalesskii Cor. 3.2.8.

#### The levelwise comparison schema

The reusable form of the tower method. The data are:

- topologically finitely generated pro-`p` groups `G` and `H`;
- for each `k : ℕ`, a **finite** type `S k` of level-`k` comparison data;
- realization maps `ρ_k : S k → (G/λ_k → H/λ_k)`, landing in continuous surjective
  homomorphisms;
- bonding maps `β_k : S (k+1) → S k`, each surjective, with each `S k` nonempty;
- compatibility: for every `s : S (k+1)` the square built from `ρ_{k+1} s`, `ρ_k (β_k s)`
  and the two projections commutes.

**Theorem.** Under these hypotheses there is a continuous surjection `Φ : G ↠ H`, and an
element `s∞` of `lim_k S k`, such that `Φ` induces `ρ_k (s∞)_k` on each level. Proof: the
inverse limit of a system of nonempty finite sets with surjective bonding maps is nonempty,
by Layer 0; compatibility makes the induced level maps assemble; surjectivity passes to the
limit by compactness.

*Needs:* L0 compactness lemma; L8 openness and cofinality of the lower `p`-series.

The side conditions of an application, such as prescribed values on marked generators or a
constraint from a character, are carried in the type `S k` itself. An application chooses
`S k` to be the set of level-`k` comparisons that satisfy the conditions, so the hypotheses
to discharge are nonemptiness and surjectivity of the bonding maps. A predicate on the
inverse limit may be imposed as an extra hypothesis, in which case it must be given as a
compatible family of predicates on the `S k`.

Two applications are immediate corollaries:

- the two-sided version, where data in both directions, together with the Hopf property,
  give `G ≅ H`;
- the specialization used in Layer 9, where `S k` is the set of level-`k` basis changes that
  carry one Demushkin relator to another and respect the character.

#### Examples

- `λ_k(ℤ_p) = p^kℤ_p`; `λ₁(C₄) = C₂`; `finrank gr₁(F) = 3` for `F` free of rank `2`.
- `ℤ_p` and `ℤ_p × ℤ_p` are told apart by the finite quotient `C_p²`, and `C₄` and `C₂²` by
  `C₄`.

#### Dependencies

Layers 0, 1, 3, 4 and 7; Mathlib `PadicInt`; Tau Ceti graded pieces of the lower `p`-series.

### Layer 9: the classification of Demushkin groups

The layer opens with its prerequisites: the normal forms of bilinear forms over `𝔽_p`, which
Tau Ceti supplies and this layer only applies to the cup matrix of a relator, and the completed
group algebra of the orientation image, with Labute's relation module and the
character-preserving iteration built on it.

#### Bilinear forms over `𝔽_p`, including the characteristic-two nonalternating case

Index conventions:

- `V` is a finite-dimensional `𝔽_p`-vector space;
- `b : V →ₗ[𝔽_p] V →ₗ[𝔽_p] 𝔽_p` is a bilinear form, written `b x y`;
- matrices are taken with respect to an ordered basis `e` by `B_{ij} = b (e i) (e j)`, so a
  change of basis `e' = e ⬝ P` acts by `B' = Pᵀ B P`.

- **Supplied normal forms.** The two normal forms the classification needs are consumed from
  Tau Ceti, for `B : LinearMap.BilinForm K V` with `K` a field and `V` finite-dimensional:
  - `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`
    (`LinearAlgebra/BilinearForm/SymplecticBasis.lean`): a nondegenerate alternating form has a
    basis indexed by `Fin m ⊕ Fin m` in which its matrix is Mathlib's `Matrix.J (Fin m) K`, so
    `dim V = 2m` (`LinearMap.BilinForm.IsAlt.even_finrank`). It holds in every characteristic,
    `p = 2` included.
  - `LinearMap.BilinForm.IsSymm.exists_basis_toMatrix_eq_one` and the dichotomy
    `LinearMap.BilinForm.Nondegenerate.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one`
    (`LinearAlgebra/BilinearForm/Diagonalization.lean`): over a field in which every element is
    a square, a nondegenerate form that is alternating or symmetric is either alternating with
    the matrix `J`, or not alternating with the identity matrix in some basis. The squares
    hypothesis holds over `𝔽₂` (Mathlib's `isSquare_of_charTwo'`).
  Mathlib's `Matrix.J l K` is `fromBlocks 0 (-1) 1 0`: for the basis `(e_i)_{inl} ∪ (f_i)_{inr}`
  it says `b(e_i, f_i) = -1` and `b(f_i, e_i) = 1`. That is the sign the application below is
  matched against. Expanding `b(x + y, x + y) = 0` shows that alternating implies skew-symmetric
  in every characteristic; at `p = 2` skew-symmetric is symmetric, and for odd `p` a symmetric
  alternating form is zero. The forms that occur at odd `p` are alternating, since the cup
  pairing on `H¹(G, 𝔽_p)` is graded-commutative. Nondegenerate symmetric nonalternating forms in
  odd characteristic occur for no Demushkin group and are not used.
  *Needs:* TC the two files above; M `Matrix.J`, M `isSquare_of_charTwo'`.
  **Checks.**
  - Over `𝔽₂`, `J = [[0,1],[1,0]]` and `I₂` are both nondegenerate; `J` is alternating and takes
    the first branch with `m = 1`, `I₂` is not (its diagonal is `1`) and takes the second.
  - The zero space carries the empty alternating form, which takes the first branch with
    `m = 0`; `I₁` on `𝔽₂` takes the second, and has odd dimension, which the first branch
    excludes.
  - Over `𝔽₃` the form `I₂` is symmetric and not alternating, but `2` is not a square in
    `𝔽₃`, so the dichotomy's squares hypothesis fails; this is why the identity branch is used
    only at `p = 2`.
- **From the relator to the cup matrix, and back.** Let `r ∈ λ_1(F)` be a relator for
  `F = freeProP p (Fin n)`, with class `r̄ = Σ_i c_i π(ξ_i) + Σ_{i<k} a_{ik} [ξ_i, ξ_k]` in the
  standard basis of `gr_1(F) ≅ Λ²(𝔽_p^n) ⊕ 𝔽_p^n`. The direction that holds is from the relator
  to the cup matrix. Identify `H²(G, 𝔽_p)` with `𝔽_p` through `r`: for a 2-cocycle `c` on `G`,
  its inflation to `F` is `δφ` for a cochain `φ : F → 𝔽_p`, with
  `(δφ)(g, h) = φ(g) + φ(h) - φ(gh)`, and `tr(c) := φ(r)`. In the dual basis `χ_1, …, χ_n` of
  `H¹(G, 𝔽_p)` the cup matrix `B_{ik} = tr(χ_i ∪ χ_k)` then has `B_{ik} = -a_{ik}` for `i < k`,
  `B_{ki} = a_{ik}`, and diagonal `-binom(p, 2) c_i` (NSW Prop. 3.9.13, with its `q` equal to
  `p` because the filtration here is the lower `p`-series). Witness for the sign: for
  `r = (x₁, x₂) = x₁⁻¹x₂⁻¹x₁x₂` map `F` to the Heisenberg group of triples `(a, b, z)` with
  `(a, b, z)(a', b', z') = (a + a', b + b', z + z' + ab')`, `x₁ ↦ (1, 0, 0)`, `x₂ ↦ (0, 1, 0)`;
  then `φ = -z` satisfies `δφ = χ₁ ∪ χ₂`, and `r ↦ (0, 0, 1)`, so `B_{12} = φ(r) = -1`, and
  `B_{21} = 1`. That is exactly `Matrix.J (Fin 1)` on the basis `(χ₁; χ₂)`, so the surface
  relator `(x₁,x₂)⋯(x_{n-1},x_n)` has cup matrix `J` on the basis `(χ₁, χ₃, …; χ₂, χ₄, …)`
  with no sign change. For the diagonal, `r = x₁²` at `p = 2`: `φ(g) = -χ₁(g)(χ₁(g) - 1)/2`
  computed with integer exponent sums gives `φ(x₁²) = -1 = 1` in `𝔽₂`. The opposite trace
  convention `tr(c) = -φ(r)` negates every entry; at `p = 2` it changes nothing. At `p = 2` the diagonal entry is `c_i`; at odd
  `p` it is `0` whatever `c_i` is. So the cup matrix determines the commutator coordinates
  `a_{ik}` for every `p`, and the `p`-power coordinates `c_i` only at `p = 2`. A basis change
  `P` acts on the cup matrix by `B ↦ PᵀBP`, so a normal form for `B` makes the commutator part
  of `r̄`, and at `p = 2` all of `r̄`, equal to that of the normal-form word. At odd `p` the
  vector `(c_i)` is normalized separately. Every exponent sum of `r ∈ Φ(F)` is divisible by
  `p`, and `c_i` is the reduction modulo `p` of the `i`-th exponent sum divided by `p` in
  `ℤ_p` (TC `TauCeti.freeProP.degreeOneBasis_repr_gradedMk_inl`, in
  `Free/DegreeOneForm.lean`); reducing the exponent sums themselves gives `0` for every
  relator. At `p = 3` the exponent vectors `(0, 0)`, `(3, 0)`, `(9, 0)` give
  `c = (0, 0), (1, 0), (0, 0)`, the three branches `q = 0`, `q = p`, `p² ∣ q`. The
  exponent-vector normalization of the Layer 9 successive approximation
  carries `(c_i)` to `e₁` when `q = p` and to `0` when `q = 0` or `p² ∣ q`.
  ⚠ Counterexample to reading the cup matrix as the full set of coordinates: at odd `p`,
  `r = x₁^p(x₁, x₂)` has `c₁ = 1`, so `r̄ ≠ [ξ₁, ξ₂]`, while its cup matrix is that of
  `(x₁, x₂)`, with zero diagonal.
  The hypotheses of the supplied dichotomy are the two cases above: `B` is alternating
  exactly when the diagonal entries all vanish, which is automatic for odd `p`, and which at
  `p = 2` holds exactly when every `c_i` is even, that is when `q ≠ 2`; so the symmetric
  nonalternating case is exactly `p = 2` with `q = 2`.
  *Needs:* TC `LinearMap.BilinForm.Nondegenerate.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one`;
  L8 the graded object; L5 `cupFp`.
  *Source:* Labute Prop. 3; NSW Prop. 3.9.13.

#### The completed group algebra of the orientation image

Labute's §1.5 and §4 arguments run over `Λ = ℤ_p[[Γ]]` for `Γ = Im χ`. Two shapes of `Γ`
occur in the dyadic classification, and both are needed:

- `Γ` procyclic, which covers `Im χ = 1 + qℤ_p` for `q ≠ 2` and the branch `Im χ = U^[f]`;
- `Γ ≅ C₂ × ℤ₂`, which is the branch `Im χ = V^(f) = {±1} × U^(f)` with `f < ∞`, and which
  Layer 7 proves is not procyclic.

The package below is stated for the procyclic case first, and then extended to the second
shape. Citing the procyclic package for `V^(f)` is the mistake to avoid: that branch is one
of the two even-rank families in the abstract classification.

- **The algebra.** For a profinite group `Γ` and a prime `p`,
  `completedGroupAlgebra p Γ := lim_U ℤ_p[Γ/U]` over the open **normal** subgroups `U ≤ Γ`,
  with the inverse-limit topology; the subgroups are normal because `Γ/U` has to be a group for
  `ℤ_p[Γ/U]` to be a group algebra. It is Tau Ceti's `TauCeti.completedGroupAlgebra ℤ_[p] Γ`,
  aliased under the roadmap's name. It is a compact topological `ℤ_p`-algebra: the `Ring`,
  `Algebra ℤ_[p]`, `TopologicalSpace`, `IsTopologicalRing`, `CompactSpace` and
  `TotallyDisconnectedSpace` instances are Tau Ceti's. **It is commutative exactly when `Γ` is
  abelian** (`TauCeti.completedGroupAlgebra.isMulCommutative_iff`), which is the case in every use
  below, since `Γ = Im χ ≤ ℤ_pˣ`; the `CommRing` structure for abelian `Γ` extends the ring
  structure rather than adding a second one. The finite-level projections
  `TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U` land in the group algebra of `Γ/U` and are
  surjective, and an element is determined by its projections, which together are the
  inverse-limit description. The group elements sit inside `Λ` through
  `TauCeti.completedGroupAlgebra.of ℤ_[p] Γ : Γ →* Λ`, which is continuous and, for profinite `Γ`,
  injective. Functoriality is `TauCeti.completedGroupAlgebra.map` with `map_id`, `map_comp`,
  `map_of` and `map_surjective`, and a topological isomorphism induces `domCongr`.
  *Needs:* L0 inverse limits; M `MonoidAlgebra`, M `PadicInt`.
  *In Tau Ceti:* `TauCeti.completedGroupAlgebra` with `proj`, `proj_surjective`, `ext`, `of`,
  `proj_of`, `continuous_of`, `of_injective`, `isMulCommutative_iff`, `lift` and `algHom_ext`
  (`CompletedGroupAlgebra/Basic.lean`); `map`, `map_of`, `map_id`, `map_comp`, `map_surjective`
  and `domCongr` (`CompletedGroupAlgebra/Map.lean`).

  API checklist for `completedGroupAlgebra`:
  - Constructors: the limit definition; `of` on a group element; the structure map from `ℤ_p`;
    `lift` from a compatible family of algebra homomorphisms into the levels.
  - Examples: `Γ = ℤ_p`, where the algebra is `ℤ_p[[T]]`; `Γ` finite, where it is the finite
    group algebra, which `proj` at `U = 1` records.
  - Morphisms: continuous `ℤ_p`-algebra homomorphisms; evaluation at an element of the
    maximal ideal.
  - Functoriality: `map` for a continuous homomorphism, surjective for a surjection.
  - Comparison lemmas: the power-series coordinate below; `proj_of` at each finite level.
  - Naturality: the power-series coordinate depends on the chosen topological generator, and
    the dependence is the substitution recorded below.
  - Edge cases: the trivial group, where the kernel is `(T)` and both algebras are `ℤ_p`; a
    finite cyclic `p`-group `Γ` with chosen generator `γ`, where `γ - 1` is topologically
    nilpotent, evaluation at `γ - 1` is onto `ℤ_p[Γ]` with kernel `((1 + T)^|Γ| - 1)`, and which
    the classification does not use (for `Γ = C₃`, `p = 3` the polynomial `T³ + 3T² + 3T` is
    distinguished of degree 3, matching rank 3); any other finite group, where the algebra is the
    ordinary group algebra and has no power-series coordinate (for `Γ = C₂`, `p = 3`,
    `(1 + T)² - 1 = T(2 + T)` with `2 + T` a unit, so the quotient `ℤ₃[[T]]/(T)` has rank 1
    against rank 2 for `ℤ₃[C₂]`, and `γ - 1` is not topologically nilpotent since
    `(γ - 1)ⁿ = (-2)ⁿ⁻¹(γ - 1)` with `2` a unit of `ℤ₃`); a non-abelian `Γ`, where the algebra is not commutative and the
    coordinate does not apply.
  - Downstream interfaces: the module statements of Labute Thms 5 and 6, used in Layer 9.

  **Checks.**
  - `Γ = 1`: `Λ = ℤ_p`; `Γ = C₂`, `p = 2`: `Λ = ℤ₂[C₂]`, free of rank `2` over `ℤ₂`.
  - `Γ = ℤ_p`: `Λ ≅ ℤ_p[[T]]` with `T = γ - 1` topologically nilpotent; the uncompleted group
    ring `ℤ_p[ℤ]` is not compact and `γ - 1` is not topologically nilpotent in it.
  - `Γ = S₃`: `Λ = ℤ_p[S₃]`, where `(12)(13) ≠ (13)(12)`, so `Λ` is not commutative.
- **Compact modules.** `IsCompactModule p Γ M` is the predicate on a topological `Λ`-module
  saying that it is a topological additive group with continuous scalar action, compact and
  totally disconnected: Tau Ceti's `TauCeti.IsCompactModule` at the ring `Λ`. Over the compact
  ring `Λ` its open submodules form a basis of neighbourhoods of `0`, which gives separatedness,
  and a compatible family of elements of its quotients by the open submodules comes from exactly
  one element, which is the inverse-limit description. The predicate passes to quotients by closed
  submodules. The exactness statement that lets module statements be checked level by level is
  the lifting lemma for towers of Layer 0: a compatible family downstairs lifts along a levelwise
  surjective continuous map from a tower of compact Hausdorff spaces to a tower of `T1` spaces.
  A compact module is Hausdorff, so towers of compact modules satisfy its hypotheses.
  *Needs:* L9 the algebra; L0 inverse limits and the lifting lemma.
  *In Tau Ceti:* `TauCeti.IsCompactModule` with `isLinearTopology`,
  `eq_zero_of_forall_mem_of_isOpen`, `existsUnique_forall_mkQ_eq`, `quotient` and `t2Space`
  (`Topology/Algebra/Module/Compact.lean`); `TauCeti.IsCompactModule.completedGroupAlgebraModule`,
  the `Λ`-module structure on a compact `ℤ_p`-module with a continuous `Γ`-action
  (`CompletedGroupAlgebra/Module.lean`); `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`.
  ⚠ The lifting lemma needs its separation hypotheses, and not surjectivity of the transition
  maps, which it does not use. With `A_k = ℤ` indiscrete and identity transitions, `B_k = ℤ/2^k`
  indiscrete with the reductions, and the quotient maps between them, every other hypothesis
  holds, but the compatible residues of `-1/3` modulo `2^k` come from no single integer, since
  `2^k ∣ 3a + 1` for all `k` has no solution.
  **Checks.**
  - `Λ` itself and `ℤ_p` with the trivial action are compact modules; `ℚ_p` is not compact, and
    neither is `ℤ` with its `p`-adic topology, which is not complete.
  - The quotient `ℤ_p / pℤ_p = 𝔽_p` by a closed submodule is a compact module; the quotient
    `ℤ_p / ℤ` by the dense submodule `ℤ` is indiscrete and not Hausdorff, so closedness is
    needed for the quotient statement.
  - In `ℤ₂`, the residues of `-1/3` modulo `2^k` come from the single element `-1/3 ∈ ℤ₂`, the
    positive instance of the uniqueness statement that fails for `ℤ` above.
- **Power-series coordinates.** For a topological generator `γ` of an infinite commutative
  pro-`p` group `Γ`, so that `Γ ≅ ℤ_p`, the assignment `T ↦ γ - 1` extends to an isomorphism of
  `ℤ_p`-algebras `ℤ_p[[T]] ≅ completedGroupAlgebra p Γ`, Tau Ceti's
  `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, with its defining value
  `powerSeriesCoordinate_X`. `ℤ_p[[T]]` carries the coefficientwise topology
  (`PowerSeries.WithPiTopology`), which is compact, and the coordinate is a homeomorphism for it
  and the inverse-limit topology on `Λ`. The finite levels are principal: through the coordinate,
  the kernel of the projection to the level `U` is generated by `ω_U = (1 + T)^[Γ : U] - 1`, so the
  levels of `Λ` are the ideals `(ω_m)`, `ω_m = (1 + T)^(p^m) - 1`, of Iwasawa theory. The
  dependence on `γ` is part of the statement: a different generator changes the isomorphism by
  the substitution `T ↦ (1 + T)^u - 1` with `u ∈ ℤ_pˣ`, and every statement below is invariant
  under it.
  *Needs:* L9 the algebra; M `PowerSeries`, M `PowerSeries.aeval`, M Weierstrass division.
  *In Tau Ceti:* `TauCeti.completedGroupAlgebra.powerSeriesCoordinate` with
  `powerSeriesCoordinate_X`, `powerSeriesCoordinate_one_add_X`, `continuous_powerSeriesCoordinate`,
  `continuous_powerSeriesCoordinate_symm`, `powerSeriesCoordinate_binomialSeries` and
  `exists_isUnit_powerSeriesCoordinate_eq_subst` (`CompletedGroupAlgebra/PowerSeries.lean`);
  `ker_proj_comp_powerSeriesCoordinate`, `proj_powerSeriesCoordinate_eq_zero_iff`,
  `powerSeriesLevelEquiv` and `ker_proj` (`CompletedGroupAlgebra/Filtration.lean`).
  *Source:* Labute §1.5; Washington, *Introduction to Cyclotomic Fields*, §7.1.
  ⚠ The finite levels are **not** the `T`-adic filtration. At `m = 0`, `ω₀ = T` and `(ω₀) = (T)`,
  the kernel of the projection to the trivial quotient of `Γ`. For `m ≥ 1`, `ω_m` has `T`-order
  one and `ω_m / T` has constant coefficient `p^m`, a non-unit, so `(ω_m)` is no power of `(T)`:
  not `(T)`, since `ω_m / T` is not a unit, not `(T^k)` with `k ≥ 2`, by the `T`-order, and not
  the unit ideal, since `ω_m` is not a unit. At `p = 2`, `ω₁ = T(2 + T)`; at `p = 3`,
  `ω₁ = T(3 + 3T + T²)`. No level is the whole algebra, since every projection is onto a nonzero
  ring.
- **Evaluation.** For `ψ ∈ ℤ_p[[T]]` and `c` with `v_p(c) ≥ 1`, the point `c` is topologically
  nilpotent in `ℤ_p`, so Mathlib's `PowerSeries.aeval` evaluates `ψ` at `c`, as a continuous
  `ℤ_p`-algebra homomorphism with `X ↦ c`. The convergence hypothesis `v_p(c) ≥ 1` is carried in
  every statement, as the proof of `PowerSeries.HasEval c`.
  *Needs:* M `PowerSeries.aeval`, M `PadicInt` completeness.
  *In Tau Ceti:* `TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd`,
  `PowerSeries.aeval_X`, `PowerSeries.aeval_C`.
- **Division.** For `ψ ∈ ℤ_p[[T]]` and `c` with `v_p(c) ≥ 1`, `(T - c) ∣ ψ` in `ℤ_p[[T]]` if
  and only if `ψ(c) = 0`, in both directions, with the quotient given by the explicit
  series `PowerSeries.divXSubC`. This is the special case of Weierstrass division that
  Labute uses on p. 122; the general Weierstrass preparation theorem is not a target.
  ⚠ Division gives the quotient series, and with it scalar membership of the relator class; it
  is not by itself the basis correction of Layer 9. What makes the quotient usable as a new
  generator is its constant term: if `ψ = (T - c) φ` then `ψ(0) = -c · φ(0)`, so
  `v_p(ψ(0)) = v_p(c) + v_p(φ(0))` in `ℕ ∪ {∞}`, and for `c ≠ 0` this reads
  `v_p(φ(0)) = v_p(ψ(0)) - v_p(c)`. The subtractive form needs `c ≠ 0`: at `p = 2`, `c = 0` the
  pairs `(ψ, φ) = (T, 1)` and `(2T, 2)` have `v_2(φ(0)) = 0` and `1` while the right side is
  `∞ - ∞` in both; the additive form reads `∞ = ∞ + 0` and `∞ = ∞ + 1`, and at `c = -6`,
  `φ = 1` the subtractive form reads `0 = 1 - 1`. Every use of the constant-term computation goes through the
  additive form, which holds for every `c`; division by `T` itself (`c = 0`) is unaffected. Without that
  computation the step is false: in `ℤ₂[[T]]²` the vector `(2, T)` has no nonunit common divisor
  and lies in no basis, since its coordinate ideal `(2, T)` is proper.
  *Needs:* L9 evaluation.
  *In Tau Ceti:* `PadicInt.X_sub_C_dvd_iff_aeval_eq_zero` and `PadicInt.X_sub_C_mul_divXSubC`
  (`NumberTheory/Padics/PowerSeries.lean`).
  *Source:* Labute §4, p. 122.
- **The dyadic branch `Γ ≅ C₂ × ℤ₂`.** The same package for the second shape, by either of
  two routes, and the roadmap takes the first:
  1. *Direct.* For `e : Γ ≃ₜ* C₂ × ℤ₂`, `completedGroupAlgebra 2 Γ ≅ ℤ₂[C₂][[T]]`, with
     `T = γ - 1` for the generator `γ = e⁻¹(1, ofAdd 1)` of the `ℤ₂`-factor and `σ ∈ C₂` going to
     `e⁻¹(σ, 1)`: Tau Ceti's `TauCeti.completedGroupAlgebra.dyadicCoordinate e`, the product
     coordinate `prodPowerSeriesCoordinate` transported along `e`. The coefficient ring is the
     group ring of `C₂` over `ℤ₂`, and `C₂` is `Multiplicative (ZMod 2)`, a genuine cyclic group.
     ⚠ It is **not** `ZMod 2` read as a multiplicative monoid, whose monoid algebra is a
     different ring.
  2. *By descent.* Restrict to the open procyclic subgroup `U^(f) ≤ Γ` of index 2, apply the
     procyclic package there, and descend along the `C₂`-action.

  The topological half is the finite levels, as in the procyclic case. For the open normal
  subgroup `U_m = e⁻¹({1} × 2^m ℤ₂)`, the kernel of the projection to `U_m`, read through the
  dyadic coordinate, is generated by `(1 + T)^(2^m) - 1` in `ℤ₂[C₂][[T]]`
  (`TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff`, with `U_m` the level
  `TauCeti.completedGroupAlgebra.dyadicLevel e m`, and in ideal form
  `TauCeti.completedGroupAlgebra.ker_proj_comp_dyadicCoordinate`), because `ℤ₂[C₂]` is free over `ℤ₂`
  on `1` and `σ` and the procyclic kernel formula applies in each coordinate; and every open
  normal subgroup contains some `U_m` (`TauCeti.completedGroupAlgebra.exists_dyadicLevel_le`). At `m = 0`
  the kernel is `(T)`. The inverse-limit topology of `Λ` is then the one whose basic
  neighbourhoods of `0` are the ideals `(2^s, (1 + T)^(2^m) - 1)`. ⚠ The ideals
  `((1 + T)^(2^m) - 1)` alone do not define it: each level keeps its `2`-adic topology, and
  without the `2^s` the coefficient ring `ℤ₂[C₂]` would be discrete in a compact `Λ`. After
  inverting `2` the group ring splits into the two eigenspaces of the involution, through the
  idempotents `(1 ± σ)/2`, and each eigenspace of the power-series ring over it is again a
  power-series ring; the splitting is Tau Ceti's
  `TauCeti.monoidAlgebraRatPadicCyclicTwoEquiv`. ⚠ **There is no integral splitting.** The
  idempotents use `1/2`, so `ℤ₂[C₂]` does not decompose: its only idempotents are `0` and `1`
  (`TauCeti.monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff`). Claiming a direct product
  decomposition over `ℤ₂` is the error that statement rules out. Labute's basis corrections in
  this branch are computed integrally (§4.2, the lemma on p. 127); an argument that reads the
  coefficients in the `ℚ₂`-eigenspaces has to clear the denominators afterwards. The coordinate
  ring is not a domain: `(1 - S)(1 + S) = 1 - S² = 0` with both factors nonzero, so the procyclic argument, which cancels a common factor,
  does not transfer. Since `ℤ₂[C₂][[T]]` is free over `ℤ₂[[T]]` on `1, S`, divisibility by an
  element of the base such as `2^f + T` is coordinatewise divisibility in the domain `ℤ₂[[T]]`:
  `2^f + T` divides `ψ₀ + S ψ₁` in `ℤ₂[C₂][[T]]`, for `ψ₀, ψ₁ ∈ ℤ₂[[T]]`, exactly when it divides
  both `ψ₀` and `ψ₁` in `ℤ₂[[T]]`, and that is where the one division of this branch happens.
  *Needs:* L9 the procyclic package; L7 the closed subgroups of `ℤ₂ˣ`; L1 index.
  *In Tau Ceti:* `TauCeti.completedGroupAlgebra.dyadicCoordinate` with `dyadicCoordinate_X`,
  `dyadicCoordinate_C_single`, the values of its inverse, the levels `dyadicLevel`, their kernels
  `proj_dyadicCoordinate_eq_zero_iff` and `ker_proj_comp_dyadicCoordinate`, and their cofinality
  `exists_dyadicLevel_le` (`CompletedGroupAlgebra/DyadicCoordinate.lean`); `prodPowerSeriesCoordinate`
  (`CompletedGroupAlgebra/ProductCoordinate.lean`); `TauCeti.monoidAlgebraRatPadicCyclicTwoEquiv`
  and `TauCeti.monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff`.
  *Source:* Labute §4, p. 122, where the two even-rank families are treated separately.

#### Labute's relation module

The module Labute's Thms 5 and 6 work with is **not** the abelianized relation module. His §4
Definition, on p. 121, sets `X = ker(χ)`, `E = X/(X, X)`, `Γ = F/X` and `Λ = Z₂(Γ)`, and makes
`E` a topological `Γ`-module by `α·ξ = ` the class of `y⁻¹xy` for `ξ = x̄` and `α = ȳ`. Every
piece of that structure is an existing declaration, and this roadmap builds no second action and
no second scalar multiplication. The points that fix the object are these.

1. **The object.** `E = X/(X, X)`, the topological abelianization of `X = ker χ`: Mathlib's
   `TopologicalAbelianization χ.ker`, written additively. It is pro-`p` when `F` is
   (`TauCeti.IsProP.topologicalAbelianization`).
2. **Its construction from `1 → R → F → G → 1`.** `χ` is the canonical character of `G`
   composed with `F ↠ G`, regarded as a character **on the free group** `F`
   (`demushkinRelatorCharacter`); `X = ker(χ : F → Γ)` contains `R`
   (Tau Ceti's `TauCeti.demushkinRelatorCharacter_mem_ker`); and `Γ = F/X ≅ Im χ`, Mathlib's
   `QuotientGroup.quotientKerEquivRange`.
3. **What it is not.** It is neither `R/[R, R]` nor `R/[F, R]`. Those are quotients of the
   relation subgroup, while `E` is built from the whole of `ker χ`. The relator enters through
   its class `r̄ ∈ E` (`labuteRelatorClass`), which makes sense because `r ∈ R ⊆ X`.
4. **The map from the full relation module.** The inclusion `R ⊆ X` induces `R^{ab} → E`,
   `TopologicalAbelianization.map` of the inclusion, which intertwines the actions of `F/R` and
   of `Γ` (`TopologicalAbelianization.map_inclusion_quotient_smul`). The proofs use only the image
   of the relator under it, which is why `R^{ab}` carries no milestone of its own here.
5. **The acting algebra.** `Λ = completedGroupAlgebra p Γ` with `Γ = Im χ`. For `Γ ≅ ℤ₂` it is
   `ℤ₂[[T]]` with the generator going to `1 + T`, and for `Γ ≅ C₂ × ℤ₂` it is
   `ℤ₂[C₂] ⊗ ℤ₂[[T]]` (Labute p. 122). Those are the two shapes of the previous subsection.
6. **The theorem connecting the action to `χ`.** The conjugation action of `F` on `E` factors
   through `Γ = F/ker(χ) ≅ Im χ`, because inner automorphisms by elements of `X` act trivially
   on `X/(X, X)` (`TopologicalAbelianization.toConjAct_smul_eq_self_of_mem`). That is the whole of
   the connection. The resulting action of `Γ` is Tau Ceti's jointly continuous instance
   `TopologicalAbelianization.instMulDistribMulActionQuotient`, and it extends to the
   `Λ`-module structure `TauCeti.IsProP.completedGroupAlgebraModule`, continuous, in which a group
   element acts as it does on `E`.
   ⚠ **The action is conjugation by `Γ`, and not multiplication by the scalar `χ(g)`.** For
   `ℤ_p² = ⟨x, y ∣ (x, y)⟩`, Demushkin with trivial orientation, the two readings agree on `E`:
   `X = F`, `Γ = 1` and `E = F^{ab}` with trivial action. They separate on the full relation
   module `R^{ab} = R/(R, R)` of that presentation, `R` the closed normal subgroup generated by
   `r = (x, y)`, on which `F/R` acts by conjugation: `x⁻¹ r x = r ((x, y), x)`, and `((x, y), x)`
   is nontrivial modulo the closed `γ₄(F)`, which contains `(R, R)` because `R ≤ γ₂(F)`. So `x`
   acts nontrivially on `R^{ab}` although `χ = 1`.
7. **The convention.** Tau Ceti's action is Mathlib's, `ȳ • x̄ = ` the class of `yxy⁻¹`
   (`TopologicalAbelianization.mk_smul_mk`), and Labute's is its composite with the inversion of
   `Γ`: his `ȳ · x̄`, the class of `y⁻¹xy`, is `ȳ⁻¹ • x̄`
   (`TopologicalAbelianization.mk_inv_smul_mk`). `Γ` is commutative, so inversion is a continuous
   automorphism of it, `TauCeti.completedGroupAlgebra.map` turns it into an involution `ι` of `Λ`,
   and Labute's scalar action is `l · ξ = ι(l) • ξ`. The two structures have the same submodules,
   spans and generating sets, and a coefficient that Labute writes with `T = γ - 1` is written
   with `γ⁻¹ - 1` here. The statements below are in Tau Ceti's convention.
8. **The hypotheses.** `r` is a Demushkin relator with the §4 normalizations: `q = 2` and `n`
   even. Labute's Thm 5 is the branch `Im χ = U₂[f]` with `f ≠ ∞`, and his Thm 6 the branch
   `Im χ = {±1} × U₂(f)` with `2 ≤ f < ∞`.

The milestones are the existing structure, proved in Tau Ceti and Mathlib: the action in Labute's form, the module structure with its
continuity, the map from `R^{ab}`, and finite generation of `E` over `Λ` by the classes of finitely
many elements of `X`, for `F` topologically finitely generated pro-`p` and `χ` continuous. The
roadmap names here are `demushkinRelatorCharacter` and the relator class `labuteRelatorClass`,
aliases of the Tau Ceti declarations of the same names; that the relator lies in `ker χ` is Tau
Ceti's `TauCeti.demushkinRelatorCharacter_mem_ker`.
*Needs:* L5 presentations; L7 canonical character; L9 the algebra and its compact modules; L4
abelian pro-`p` structure theory.
*In Tau Ceti:* `TopologicalAbelianization.instMulDistribMulActionQuotient`, `mk_smul_mk`,
`mk_inv_smul_mk`, `toConjAct_smul_eq_self_of_mem`, `map` and `map_inclusion_quotient_smul`
(`Topology/Algebra/Group/TopologicalAbelianization.lean`); `TauCeti.IsProP.completedGroupAlgebraModule`
with `completedGroupAlgebraModule_of_smul` and `continuousSMul_completedGroupAlgebraModule`
(`ProP/CompletedGroupAlgebraModule.lean`);
`TauCeti.IsProP.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top`
and `module_finite_completedGroupAlgebraModule_topologicalAbelianization_ker`
(`ProP/Relation/Module.lean`).
*Source:* Labute §4 Definition, p. 121.

#### The module statements that the classification uses

With `E`, `Γ` and `Λ` as above, these are the statements Labute's Theorems 5 and 6 run on. The two
branch statements carry Labute's hypotheses: `F` is free pro-`2` of even rank `n`,
`r ∈ F²(F, F)` is a Demushkin relation, `χ` is its associated character, and `Im χ` is in the
branch named. Labute's hypothesis `q = 2` follows and is not assumed: either branch puts a unit
`≡ 3 mod 4` into `Im χ`, while for `q ≠ 2` the image is `U^(f)` with `2^f = q ≥ 4`, or trivial.

- **The relator class in a spanning family.** If finitely many `b_i` span `E` over `Λ`, then `r̄`
  is a `Λ`-combination of them (Mathlib's `Submodule.mem_span_range_iff_exists_fun`). ⚠ The spanning hypothesis is needed: with no
  generators, `F ≅ ℤ_p`, `χ` trivial and `r` a generator, the nonzero `r̄` is not the empty sum.
  Labute's content is the explicit coefficients in a normalized basis. In the branch
  `Im χ = U^[f]` (§4.1) the normal form `r = w₁^{2+α}(w₁, w₂)w₃^{2^g}(w₃, w₄)⋯`, with
  `f = v₂(α) < g`, becomes a basis `y` with `χ(y₁) = 1`, `χ(y₂) = -(1 + 2^f)^{-1}` and `χ(y_i) = 1`
  for `i > 2`, through `y₂ = w₂^{a⁻¹}` and `y₄ = w₄ w₂^{-b}` where `(1 + 2^f)^a = 1 + α` and
  `(1 + α)^b = 1 - 2^g`; in it, in Labute's convention with `T = γ - 1` for the class `γ` of `y₂`
  in `Γ`, `r̄ = (1 + α + (1 + T)^a) ȳ₁ + (2^g + (1 + T)^{ab} - 1) ȳ₃`, where `ȳ_i` is the class
  of `y_i` in `E`.
- **The branch `Im χ = U^[f]`, `2 ≤ f < ∞` (Theorem 5).** There is `z ∈ E` with
  `r̄ = ((1 + 2^f) + ȳ) z` for any `y ∈ F` with `χ(y) = -(1 + 2^f)`
  (`exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure`). In Labute's convention this
  is `r̄ = (2 + 2^f + T) z̄₁` (p. 123): both coefficients above vanish at `T = -2 - 2^f`, so the
  division criterion factors `2 + 2^f + T` out of each, and `z` is the corresponding combination
  of `ȳ₁` and `ȳ₃`. This is scalar membership of `r̄`, and nothing more; the change of generators
  is the basis correction below.
- **The branch `Im χ = {±1} × U^(f)`, `2 ≤ f < ∞` (Theorem 6).** There are `z₁, z₃ ∈ E` with
  `r̄ = (1 + s̄) z₁ + ((2^f - 1) + ȳ) z₃` for any `s, y ∈ F` with `χ(s) = -1` and
  `χ(y) = 1 - 2^f` (`exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus`). In
  Labute's convention, over `Λ ≅ ℤ₂[S] ⊗ ℤ₂[[T]]`, this is `r̄ = (1 + S) z̄₁ + (2^f + T) z̄₃`
  (p. 127). In his normalized basis `r̄ = (1 + α + S(1 + T)^b) ȳ₁ + (2^f + T) ȳ₃`, and the division
  criterion at `T = -2^f` gives an element `φ` of `Λ`, a multiple of `S`, with
  `(1 + α + S(1 + T)^b)(1 + α)^{-1} + (2^f + T) φ = 1 + S`. The procyclic statement does not
  apply here, because `{±1} × U^(f)` is not procyclic (Layer 7).
- **The basis corrections.** What the successive approximation consumes is a change of
  generators, and the two statements above do not provide one: they return some `z` with `r̄` a
  multiple of it, and the `(2, T)` example under Division shows that factoring out a common
  divisor does not produce a basis vector in general. So each branch has its own correction,
  starting from the relator in the even normal form `x₁^{2+α}(x₁,x₂)x₃^{2^g}(x₃,x₄)⋯` in the
  standard basis, with `χ` taking the values of Labute's Theorem 4 there, and returning a new basis
  `z`, the values of `χ` on it, the relator read in `z` up to an error in `(X, X) ∩ F₃` (Labute's
  `F₃` is `λ₂`), and `r̄` with its coefficients pinned to the corrected generators. A basis is
  recorded as the image of the standard generators under a continuous automorphism of `F`. Two
  criteria make a family a basis: an `n`-tuple that topologically generates the free pro-`p` group
  of rank `n` is one, by the Hopf property, and so is a family congruent to a basis modulo
  `Φ(F)`, by Burnside.
  - *The branch `Im χ = U^[f]`* (Labute §4.1, pp. 122–123). Here `f = v₂(α)` and `2 ≤ f < g ≤ ∞`, and the rank is even and at least
    two; at rank two the fourth generator is `1` and the character values force `g = ∞`. The
    result: `z ≡ x` modulo `Φ(F)`, `χ(z₂)(1 + 2^f) = -1` and `χ(z_i) = 1` otherwise,
    `r = z₁^{2+2^f}(z₁,z₂)(z₃,z₄)⋯ · e` with `e ∈ (X, X) ∩ F₃`, and `r̄ = (2 + 2^f + T) z̄₁` with
    `T` read from the class of `z₂`. The congruence comes from the constant terms, not from the
    divisibility: with `c = -(2 + 2^f)`, `v₂(c) = 1`, `ψ₁(0) = 2 + α` has valuation `1` and
    `ψ₂(0) = 2^g` has valuation `g ≥ 3` (it is `0` at `g = ∞`), so the quotients have `φ₁(0)` a
    unit and `φ₂(0) ∈ 2ℤ₂`, whence `z₁ ≡ y₁` modulo `Φ(F)`.
    ⚠ The coefficient is indexed by `f = v₂(α)`, the level of the image, and not by the exponent
    `g` of the third generator. At `n = 4`, `α = 4`, `g = ∞`, with `χ(x₂) = -1/5`, the relator is
    `x₁⁶(x₁,x₂)(x₃,x₄)` and the coefficient is `6 + T`. The `g`-indexed `2 + 2^∞ + T`, which is
    `1 + γ` for every topological generator `γ`, is false there: the map onto the dihedral group
    of order `16` sending `x₁ ↦ t`, `x₂ ↦ s` and `x₃, x₄ ↦ 1` induces `ℓ : E → ℤ/8` on which every
    topological generator acts by `-1`, so `ℓ((1 + γ) z) = 0` for every `z`, while `ℓ(r̄) = 4`.
    The correct coefficient passes the same test, since `ℓ((5 + γ) x̄₁) = 4`.
  - *The branch `Im χ = {±1} × U^(f)`* (Labute §4.2, pp. 126–128). Here `2 ≤ f < ∞`, `2^f ∣ α`, and the rank is even and at least four. The
    result: `χ(z₂) = -1`, `χ(z₄)(1 - 2^f) = 1` and `χ(z_i) = 1` otherwise,
    `r = z₁²(z₁,z₂)z₃^{2^f}(z₃,z₄)⋯ · e` with `e ∈ (X, X) ∩ F₃`, and
    `r̄ = (1 + S) z̄₁ + (2^f + T) z̄₃` with `S` the class of `z₂` and `1 + T` that of `z₄`. The
    argument divides in the base, as in the dyadic bullet above; the change of basis is lower
    triangular over `Λ` with unit diagonal. It leaves an error `(z₁, z₃)^a e'` with `a ∈ ℤ₂`
    arbitrary and `e' ∈ (X, X) ∩ F₃`, and Labute's last step `z₂ ↦ z₂ z₃^{-a}` (p. 128), which
    keeps `χ(z₂)` because `χ(z₃) = 1`, turns it into `(z₁, z₃)^{2a} e''`. That lies in
    `(X, X) ∩ F₃` because `z₁, z₃ ∈ X` and the square of a commutator lies in `λ₂`. The corrected
    family is a basis by the generation criterion. ⚠ It need not be congruent to the original
    basis modulo `Φ(F)`: when `f = v₂(α)` the normalization of `χ(z₂)` uses an odd power of the
    fourth generator, which changes the Frattini class of the second, and so does the last step
    when `a` is odd.

  These two corrections are where the Division milestone above is used. They are initial
  corrections only: the error `e ∈ (X, X) ∩ F₃` that they leave is removed by the
  character-preserving iteration of the next subsection, and not by the unrestricted `δ_j` of
  Layer 8.

⚠ The hypotheses of the two branch statements are Labute's and are not decoration. Without them,
at `F = ℤ₂`, `χ` trivial, `Γ = 1` and `r` a generator, the procyclic statement would ask for
`1 = (2 + 2^f) z`, impossible modulo `2`.
⚠ Do not phrase these criteria through the annihilator of `E` as a `Λ`-module. In the procyclic
branch `E` is free over `Λ` of rank `n - 1`, whatever the relator, so its annihilator is zero and
carries no information about `r`.
*Needs:* L9 Labute's relation module, L9 power-series coordinates, L9 evaluation, L9 division;
L9 the normal forms and character values; L7 the closed subgroups of `ℤ₂ˣ`; L3 Burnside's basis
theorem and the Hopf property; L4 exponentiation by `ℤ_p`.
*Source:* Labute §4.1 and §4.2, the computations on pp. 122–123 and 126–128.

#### The character-preserving iteration after the basis corrections

The two basis corrections leave `r = r₀(z) · e` with `e ∈ (X, X) ∩ λ₂`, where `r₀` is the target
word of the branch: `r₀(x) = x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯` for `Im χ = U^[f]`, and
`r₀(x) = x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` for `Im χ = {±1} × U^(f)`. This subsection removes `e`.
Transported along the automorphism that the correction returns, everything is stated in the
standard basis `x`, with `χ` taking the corrected values there:

- branch `U^[f]`, `2 ≤ f < ∞`: `χ(x₂)(1 + 2^f) = -1` and `χ(x_i) = 1` for `i ≠ 2`;
- branch `{±1} × U^(f)`, `2 ≤ f < ∞`, `n ≥ 4`: `χ(x₂) = -1`, `χ(x₄)(1 - 2^f) = 1` and
  `χ(x_i) = 1` for `i ≠ 2, 4`.

`X = ker χ`, `ξ_i ∈ gr_0(F)` is the class of `x_i`, and `ρ ∈ gr_1(F)` is the class of `r₀(x)`,
which is also the class of `r`.
⚠ The unrestricted `δ_j` of Layer 8 does not do this step. A correction `x_i ↦ x_i w_i` with
`w_i ∉ X` changes `χ(x_i)`, so it leaves the branch. A span statement `gr_j(F) = Im δ_j + T_j` is
an identity of subspaces and gives no information on the tail component of the particular error.
The comparison schema assumes that compatible corrections exist and lift; it does not construct
them. Labute's argument (§4.1, pp. 123–126, and §4.2, pp. 128–130) replaces `gr(F)` by the graded
pieces of `X`, and identifies the image of the restricted `δ` inside them by crossed
homomorphisms. These are the milestones.

- **The filtered kernel.** `X_k := X ∩ λ_k(F)` and `gr_k(X) := X_k / X_{k+1}`. Because
  `X_k ∩ λ_{k+1}(F) = X_{k+1}`, the inclusion identifies `gr_k(X)` with the image of `X_k` in
  `gr_k(F)` (Tau Ceti's `TauCeti.gradedPieceOf`, `TauCeti.mem_gradedPieceOf_iff`), which is how
  Labute uses it (p. 123). It
  is an ideal of `gr(F)` for the bracket, and `π` maps `gr_k(X)` into `gr_{k+1}(X)`. Its
  complement is one-dimensional (Labute's Lemma 1 in §4.1 and in §4.2):
  `gr_k(F) = gr_k(X) ⊕ 𝔽₂ π^k ξ₂` for every `k ≥ 0` in the branch `U^[f]`, and
  `gr_k(F) = gr_k(X) ⊕ 𝔽₂ π^k ξ₄` for every `k ≥ 1` in the split branch. Route: `X` is the kernel
  of `φ : F → 2ℤ₂` with `φ(x₂) = 2` and `φ(x_i) = 0` otherwise, respectively of
  `φ : F → ℤ/2 × 2ℤ₂` with `φ(x₂) = (1, 0)`, `φ(x₄) = (0, 2)` and `φ(x_i) = 0` otherwise, because
  `χ(x₂)`, respectively `χ(x₄)`, has infinite order and `-1 ∉ U^(f)`; and `φ(λ_k(F))` is
  `2^{k+1}ℤ₂`, respectively `{0} × 2^{k+1}ℤ₂` for `k ≥ 1`.
- **The restricted modification map `δ_j^X`.** For `j ≥ 2` and `w_i ∈ X_{j-1}`, the
  modification `θ_w : x_i ↦ x_i w_i` does not change `χ(x_i)`, so `r₀(x)⁻¹ r₀(θ_w x)` lies in
  `X_j`, and its class is `δ_j(w̄)`. Hence `δ_j` maps `gr_{j-1}(X)^{⊕ n}` into `gr_j(X)`, for every
  continuous `χ` and every `ρ`. The restriction
  is the linear map `δ_j^X : gr_{j-1}(X)^{⊕ n} → gr_j(X)`, given by the `j ≥ 2` formula of
  Layer 8.
- **The span statement in `gr(X)`** (Labute's Lemmas 2 and 3). For every `j ≥ 2`:
  - branch `U^[f]`: `gr_j(X) = Im δ_j^X + ⟨π^j ξ_i : i ≠ 2⟩`;
  - split branch: `gr_j(X) = Im δ_j^X + ⟨π^j ξ_i : i ≠ 2, 4⟩ + 𝔽₂ π^{j-1}[ξ₂, ξ₄]`.

  The mixed vector `π^{j-1}[ξ₂, ξ₄]` is the class of `(x₂, x₄)^{2^{j-1}}`. It lies in `gr_j(X)`
  because `χ((x₂, x₄)) = 1`, although `x₂, x₄ ∉ X`, and it is not a `π`-power of a generator
  class, so no pure-power tail covers it. ⚠ Neither tail is the Layer 8 `T_j`: in the branch
  `U^[f]` the tail contains `π^j ξ₁` although `c₁ ≠ 0`. Labute proves the split statement at
  `n = 4` and reduces to `n = 4` by an earlier remark; the statement above is the one for every
  even `n ≥ 4`. Route: `gr_j(X)` is generated by the `π τ` and `[τ, ξ_k]` with
  `τ ∈ gr_{j-1}(X)` (Lemma 2, from the complement above), and an induction on `j` using
  `δ_{j+1}^X ∘ π = π ∘ δ_j^X` and the Jacobi identity in degree two (Lemma 3).
- **The detectors** (Labute's Lemma 4). `I(χ)` is `ℤ₂` with `F` acting through `χ`, and a
  continuous crossed homomorphism `D : F → I(χ)` satisfies `D(gh) = D(g) + χ(g) D(h)`. Then
  `2^k ∣ D(g)` for every `g ∈ λ_k(F)` (Tau Ceti's
  `TauCeti.IsCrossedHom.pow_dvd_apply_of_mem_pLowerCentralSeries`), because
  `D(g²) = (1 + χ(g)) D(g)` with `1 + χ(g)` even, and
  `D((g, h)) = χ(g)⁻¹χ(h)⁻¹ ((χ(g) - 1) D(h) - (χ(h) - 1) D(g))` exactly, for
  `(g, h) = g⁻¹h⁻¹gh`, with the unit prefactor `χ(g)⁻¹χ(h)⁻¹` and `χ(λ_k(F)) ⊆ 1 + 2^{k+1}ℤ₂`. So
  `Δ_k(D) : gr_k(F) → 𝔽₂`, the class of `g` going to `(D(g)/2^k) mod 2`, is a well-defined
  `𝔽₂`-linear functional. Labute takes `D` with values in
  `2I(χ)`, and his `Δ` lands in `2^{k+1}I / 2^{k+2}I`; that is the same functional after
  dividing by `2`. The continuous crossed homomorphisms are determined by their values on the
  basis, and every family of values occurs (Tau Ceti's `TauCeti.freeProP.crossedHom`); `D_i` is
  the one
  with `D_i(x_k) = δ_{ik}`. The statements, for `j ≥ 2`:
  1. `Δ_j(D) ∘ δ_j^X = 0` for every `D`. Indeed `D(r₀(y)) = 0` for every tuple `y` on which `χ`
     takes the values above (Labute pp. 126 and 129), `θ_w` preserves those values, and `D` is
     additive on `X`.
  2. `Δ_j(D_i)(π^j ξ_k) = δ_{ik}` for every `k` with `χ(x_k) = 1`, since `D(x_k^{2^j}) = 2^j D(x_k)`
     there. In the split branch `Δ_j(D₄)(π^{j-1}[ξ₂, ξ₄]) = 1` and `Δ_j(D_i)` vanishes on it for
     `i ≠ 4`, by the commutator formula above with `χ(x₂) - 1 = -2` and `2^f ∣ χ(x₄) - 1`, and
     because `(x₂, x₄) ∈ X`, so that `D((x₂, x₄)^{2^{j-1}}) = 2^{j-1} D((x₂, x₄))`. Witness:
     `D₄((x₂, x₄)) = χ(x₂)⁻¹χ(x₄)⁻¹ (χ(x₂) - 1) = (-1)(1 - 2^f)(-2) = 2(1 - 2^f)`, which is `-6`
     at `f = 2`: twice a unit, not `±2`, and its half is odd, which is all the argument uses.
  3. **The image theorem.** `Im δ_j^X` is the set of `v ∈ gr_j(X)` with `Δ_j(D)(v) = 0` for every
     continuous crossed homomorphism `D`, and already the set of those with `Δ_j(D_i)(v) = 0`
     for every `i ≠ 2`. Proof: write `v`
     by the span statement; the `Δ_j(D_i)`, `i ≠ 2`, read off the tail coefficients by 2, and
     vanish on `Im δ_j^X` by 1.
- **The one-step correction** (Labute's induction, p. 126 and pp. 129–130). Let `j ≥ 2`, let `y`
  be a basis with `y_i ∈ x_i (X ∩ λ_1(F))` for every `i`, and let `r = r₀(y) e` with
  `e ∈ X ∩ λ_j(F)`. Then there are `t_i ∈ X ∩ λ_{j-1}(F)` such that `z_i = y_i t_i` gives
  `r = r₀(z) e'` with `e' ∈ X ∩ λ_{j+1}(F)`. The new
  family again has `z_i ∈ x_i (X ∩ λ_1(F))`, so `χ(z_i) = χ(x_i)`; it is congruent to `y` modulo
  `λ_{j-1}(F) ≤ Φ(F)`, so it is a basis by the Frattini-congruence criterion. Proof: every
  continuous crossed homomorphism `D` kills `r`: `D(r₀(x)) = 0` as in 1 above, and `D` kills
  the initial error, which lies in the closed commutator subgroup of `X`, because `D` restricts
  to a continuous homomorphism from `X` to the abelian group `ℤ₂`. It kills `r₀(y)` too, so it
  kills `e`, and the class of `e` lies in `Im δ_j^X` by the image theorem, read in the basis `y`
  through the automorphism `x_i ↦ y_i`, which preserves `χ` and so each `X ∩ λ_k(F)`. Lift a
  preimage to the `t_i`.
  Labute's invariant `D(e) = 0`, his condition (ii), therefore needs no separate bookkeeping.
- **The limit, through the Layer 8 comparison schema.** Take `G = H = F`. Let `S k` be the set of
  reductions modulo `λ_k(F)` of the families `y` with `y_i ∈ x_i (X ∩ λ_1(F))` and
  `r₀(y)⁻¹ r ∈ λ_{k+1}(F)`, and let `ρ_k` send such a reduction to the endomorphism of
  `F/λ_k(F)` induced by `x_i ↦ y_i`, which is well defined and surjective because `y` is a basis.
  The hypotheses of the schema hold:
  - `S k` is finite, as a subset of `(F/λ_k(F))^n`;
  - `S 1` contains the reduction of `x`, by the output of the initial correction, and `S 0` is a
    point;
  - the reduction `S (k+1) → S k` is surjective: for `k ≥ 1` the one-step correction at
    `j = k + 1` changes `y` by elements of `λ_k(F)` only, and `S 1 → S 0` is onto a point; in
    particular every `S k` is nonempty;
  - compatibility holds by construction.

  The schema returns a continuous surjection `Φ : F ↠ F` with `Φ(x_i) ≡ y_i^{(k)}` modulo
  `λ_k(F)` for a compatible choice of families `y^{(k)}`. Changing the generators by elements of
  `λ_k(F)` changes `r₀` by an element of `λ_{k+1}(F)`, so `r₀(Φ(x)) ≡ r` modulo every
  `λ_{k+1}(F)`, and `Φ(r₀(x)) = r`. `Φ` is an automorphism by the Hopf property, and
  `Φ(x_i) ∈ x_i (X ∩ λ_1(F))` because that set is closed. This is the relator form of Labute's
  Theorems 5 and 6: composed with the initial
  corrections, an automorphism of `F` carries `r₀(x)` to the given relator and preserves the
  marked values of `χ`. It is what the even-rank marked statement
  `isDemushkin_marked_of_q_two_even` consumes in these two branches.

Tau Ceti at the repository pin supplies the graded pieces of a subgroup,
`TauCeti.gradedPieceOf`
(`LowerCentralSeries/Graded/Subgroup.lean`); the graded functional of a crossed homomorphism,
`TauCeti.IsCrossedHom.gradedFunctional` with `pow_dvd_apply_of_mem_pLowerCentralSeries`
(`ProP/CrossedHom.lean`); the crossed homomorphisms of a free pro-`p` group with prescribed
values, `TauCeti.freeProP.crossedHom` (`Free/Prescription.lean`); for the branch `U^[f]` the span
statement `gradedPieceOf_exponentSumKer_demushkinWordNeTwo_eq_map_basisModificationDelta_sup`
(`Demushkin/NormalForm/Kernel/Span.lean`), the image theorem
`mem_map_basisModificationDelta_iff_forall_gradedFunctional_crossedHom_eq_zero`
(`Demushkin/NormalForm/GradedFunctional.lean`) and the limit
`exists_continuousMulEquiv_apply_demushkinWordNeTwo_eq_of_crossedHom_single_eq_zero`
(`Demushkin/NormalForm/Kernel/Approximation.lean`); and for the split branch
`gradedPieceOf_exponentSumKer_demushkinWordTwoEven_eq_map_basisModificationDelta_sup` and
`mem_map_basisModificationDelta_demushkinWordTwoEven_iff_forall_gradedFunctional_eq_zero`
(`Demushkin/NormalForm/Two/Even/KernelSpan.lean`) and
`exists_continuousMulEquiv_apply_demushkinWordTwoEven_zero_eq_of_forall_crossedHom_eq_zero`
(`Demushkin/NormalForm/Two/Even/Approximation.lean`), all in the namespace `TauCeti.freeProP`.
The constrained-span and iteration declarations take `X` to be the kernel of the specified
exponent sum, which is `ker χ` here, respectively its intersection with `λ_1(F)`, by the complement
computation above. These Tau Ceti declarations take the iteration's hypotheses in their own
form (a relator in the class of `r₀(x)` modulo `λ₂(F)`, lying in `X`, and killed by the `D_i`
for `i ≠ 2`), which
the basis corrections above put the relator into; the milestones of this subsection are the route
to `isDemushkin_marked_of_q_two_even` and are not separate headline theorems.
*Needs:* L9 the basis corrections; L8 `δ_j`, the comparison schema, openness and cofinality;
L3 Burnside's basis theorem and the Hopf property; L4 free objects.
*Source:* Labute §4.1, Lemmas 1–4 and the proof of Theorem 5 (pp. 123–126); §4.2, Lemmas 1–4
and the proof of Theorem 6 (pp. 128–130).

#### The classification

The full Demushkin–Serre–Labute classification, after the Layer 8 method, because its proofs
are successive-approximation arguments along the lower `p`-series, and after the two
prerequisites. Source of record: Labute, *Classification of Demushkin groups*, Canad. J.
Math. 19 (1967), 106–132; modern statements in NSW III §9. The notation is the one fixed in
Layer 8.

- **Cup-form normal forms.** The image of the relator in `gr_1(F)` computes the cup product,
  as in the prerequisite above: `-a_{ik}` above the diagonal and `-binom(p, 2) c_i` on it, for
  the trace convention fixed there. Feeding
  the matrix through the supplied normal-form dichotomy brings the commutator part of `r̄` to that of
  `(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, with `n` even, when the form is alternating. At odd `p` the
  cup matrix does not see the `p`-power part, and the congruence
  `r ≡ x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)` modulo `λ_2(F)` needs, in addition, the exponent-vector
  normalization of step 1 of the successive approximation below, which first carries the
  exponent vector to `q e₁` and then reaches the cup-form normal form by a basis change fixing
  `x₁`; at `p = 2` with `q ≠ 2` every `c_i` is already `0`. The nonalternating case, which is exactly `p = 2` with `q = 2`, splits by the
  parity of `n`:
  - `r ≡ x₁²(x₂,x₃)(x₄,x₅)⋯(x_{n-1},x_n)` modulo `λ_2(F)` if `n` is odd;
  - `r ≡ x₁²(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)` modulo `λ_2(F)` if `n` is even.

  The odd-rank word is the wrong congruence in even rank: it leaves `x_n` unpaired, and the
  cup form is degenerate. At `n = 2` the word `x₁²(x₁,x₂)` has cup matrix `[[1, 1], [1, 0]]`
  over `𝔽₂`, of determinant `1`, and `x₁²` has `[[1, 0], [0, 0]]`, of determinant `0`. Both
  congruences agree with the exact normal forms below, whose factors `x₁^α` with `α ∈ 4ℤ₂`
  and `x_k^{2^f}` with `f ≥ 2` lie in `λ_2(F)`.
  *Needs:* L9 prerequisites; L8 notation; L7 the predicate.
  *Source:* Labute Prop. 3, Prop. 4 and their corollary.
- **The successive-approximation argument.** Start from the cup-form normal form, so that `r`
  and the normal-form word `r₀` have the same class `ρ` in `gr_1(F)`. Which span statement drives
  the approximation depends on `q` and `p`, and `q ≠ 2` is not a single case. Each limit is taken
  through the Layer 8 comparison schema, with `S k` the reductions modulo `λ_k(F)` of the
  admissible bases `y` with `r₀(y)⁻¹ r ∈ λ_{k+1}(F)`, exactly as in the character-preserving
  iteration of the Layer 9 prerequisites; what changes from case to case is which bases are
  admissible and which span statement makes the bonding maps surjective.
  - *`q = p` with `p` odd.* `ρ` has the nonzero `p`-power part `π ξ₁`, and
    `gr_j(F) = Im δ_j` for every `j ≥ 2`. Every basis is admissible, and a correction is any
    family in `λ_{j-1}(F)`.
  - *`q = 0` or `p² ∣ q`, for every `p`, including `p = 2`.* Every exponent sum of `r` is
    divisible by `p²`, so `ρ` has no `p`-power part, `Im δ_j` consists of brackets, and
    `Im δ_j ≠ gr_j(F)`.
    ⚠ Counterexample to the full span: `p = 3`, `F` free on `x₁, x₂` and `r = (x₁, x₂)`, so
    `G = ℤ₃²` and `q = 0`. The graded map induced by `F → F^{ab} ≅ ℤ₃²` kills every bracket,
    hence `Im δ_j`, and sends `π^j ξ₁`, the class of `x₁^{3^j}`, to the nonzero class of
    `3^j e₁` in `3^jℤ₃² / 3^{j+1}ℤ₃²`. For `r = x₁^{p²}(x₁, x₂)` the class `π^j ξ₂` is missed in
    the same way.
    The approximation therefore runs with the exponent vector of `r` in `ℤ_p^n` held fixed:
    1. a continuous automorphism carries that vector to `q e₁`, by elementary automorphisms and
       a dilation `x₁ ↦ x₁^u` with `u ∈ ℤ_pˣ`, since the vector has content `q` because
       `G^{ab} ≅ ℤ/q × ℤ_p^{n-1}`; a second automorphism, fixing `x₁` and hence the vector,
       brings `r` to the cup-form normal form modulo `λ₂`, so that `r` and
       `r₀ = x₁^q(x₁,x₂)⋯` have the same class and the same exponent vector;
    2. the error space in degree `j` is the bracket span `C_j(F) = [gr_{j-1}(F), gr_0(F)]`,
       which contains the class of every element of `λ_j(F) ∩ K`, with `K` the closed
       commutator subgroup of `F`; once the exponent vectors agree the error lies in `K`;
    3. `Im δ_j = C_j(F)` for every `j ≥ 2`, because the `∂_i ρ` span `gr_0(F)`, and every
       element of `Im δ_j` is `δ_j(w̄)` with `w₁ ∈ K`, so the correction keeps the exponent
       vector.

    The admissible bases are those with `y₁ ∈ x₁ K` when `q ≠ 0`, and all bases when `q = 0`.
    The identity `gr_j(F) = Im δ_j + T_j`, with `T_j` spanned by all the `π^j ξ_i`, is true here
    too, but it does not replace step 2: a decomposition of the space says nothing about the
    tail component of a given error.
  - *`q = 2`.* `gr_j(F) = Im δ_j + T'_j` for every `j ≥ 2`, and the approximation with tails
    returns `r` up to factors `t_i ∈ λ₂(F)` in the closed procyclic subgroups `⟨x_i⟩` of the
    tail generators. For odd `n` the tail is the Layer 8 one, `T'_j = T_j = ⟨π^j ξ_i : i ≥ 2⟩`,
    and the result is `x₁²(x₂,x₃)⋯(x_{n-1},x_n) · x₂^{α₂}⋯x_n^{α_n}`. For even `n` the tail is
    `T'_j = ⟨π^j ξ_i : i ≠ 2⟩` (Labute Prop. 5), and the result is
    `x₁^{2+α}(x₁,x₂) · (x₃,x₄)⋯(x_{n-1},x_n) x₃^{α₃}⋯x_n^{α_n}`. All the exponents are
    `2`-adic integers divisible by `4`. ⚠ The even-rank tail is not the Layer 8 `T_j`, which is
    spanned over the indices with `c_i = 0`, that is `i ≠ 1`: the vector
    `π^j ξ₂ = δ_j(π^{j-1}ξ₂, π^{j-1}ξ₂, 0, …, 0)` already lies in `Im δ_j`, and at `n = 2`,
    `j = 2` the sum `Im δ₂ + T₂` misses `π²ξ₁`. In both parities the factor after `x₁²`,
    respectively after `x₁^{2+α}(x₁,x₂)`, is a relator in the remaining generators with the
    class of `(x₂,x₃)⋯`, respectively `(x₃,x₄)⋯`, so it presents a Demushkin group with
    `q' = 0` or `q' = 2^f`, `f ≥ 2`, and the previous case normalizes it.

  The conclusion: a Demushkin group with `q(G) = q` has a basis in which
  - `r = x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, if `q ≠ 2`;
  - `r = x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯` with `2 ≤ f ≤ ∞`, if `q = 2` and `n` is odd;
  - `r = x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` with `2 ≤ f ≤ ∞` and `α ∈ 4ℤ₂`, if `q = 2` and `n`
    is even.

  In the even case the pair `(α, f)` is not yet determined by `G`. When `Im χ = {±1}` the image
  table forces `α = 0` and `f = ∞`. In the branches `U^[f]` and `{±1} × U^(f)` with `f < ∞` the
  basis corrections and the character-preserving iteration of the Layer 9 prerequisites bring
  `r` to the normal form of the branch. Implement every limit through the schema, and do not
  re-derive a limit argument.
  For the case `q = p`, consume the repository-pin native declarations
  `TauCeti.freeProP.range_basisModificationDelta_eq_top_of_odd` and
  `exists_continuousMulEquiv_apply_eq_demushkinWordNeTwo_of_odd`
  (`Demushkin/NormalForm/OddPrime.lean`). For the fixed-exponent-vector case, consume
  `exists_continuousMulEquiv_toAdd_exponentSum_eq_single`,
  `range_basisModificationDelta_eq_span_of_repr_inl_eq_zero`,
  `gradedMk_mem_range_basisModificationDelta_of_mem_topologicalClosure_commutator`,
  `exists_apply_mem_commutator_basisModificationDelta_eq_of_mem_range` and
  `exists_continuousMulEquiv_apply_eq_of_exponentSum_eq`, assembled in
  `exists_continuousMulEquiv_apply_eq_demushkinWordNeTwo_of_demushkinQ_ne`
  (`Demushkin/NormalForm/NeTwo.lean`, whose header explains why full surjectivity fails). For the
  dyadic span statements, consume
  `range_basisModificationDelta_sup_basisModificationTail_eq_top_demushkinWordTwoOdd` and
  `range_basisModificationDelta_sup_gradedPowIterSpan_eq_top_demushkinWordTwoEven`, all in the
  namespace `TauCeti.freeProP`. Prove the explicit comparison and consumption milestones with
  these APIs' hypotheses and carriers stated.
  *Needs:* L8 comparison schema, L8 `δ_j` and `T_j`; L9 cup-form normal forms; L4 free objects
  and their abelianization.
  *Source:* Labute Prop. 5 and Thm 3, and the proof of Thm 3 on pp. 118–119.
- **Character values in normal form.** Existence of `χ` by explicit values on the
  normal-form basis:
  - case `q ≠ 2`: `χ(x₂) = (1-q)^{-1}`, and `1` on the other generators;
  - case `q = 2` with `n` odd: `χ(x₁) = -1`, `χ(x₃) = (1-2^f)^{-1}`, and `1` otherwise;
  - case `q = 2` with `n` even: `χ(x₂) = -(1+α)^{-1}`, `χ(x₄) = (1-2^f)^{-1}`, and `1`
    otherwise.

  Uniqueness follows from the forced computation on a derivation. The image table is
  `1 + qℤ_p`; `{±1} × U^(f)`; and, for `n` even, `{±1} × U^(f)` if `v₂(α) ≥ f`, and
  `U^[f']` with `f' = v₂(α)` if `f' < f`.
  *Needs:* L7 canonical character; L9 normal forms; L7 the subgroups of `ℤ₂ˣ`.
  *Source:* Labute Thm 4 and its corollary.
- **The marked classification.** For each normal-form family, the classification is stated in
  marked form: a continuous isomorphism from the Demushkin group onto
  `presentedProP p (Fin n) {r}` for the normal-form relator `r`, under which the canonical
  character takes the values of the table above on the marked generators. The six statements
  are `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd` for `n ≥ 3` and
  finite level, `isDemushkin_marked_of_q_two_even` for `n ≥ 4` and finite level,
  `isDemushkin_marked_of_q_two_rank_two` for `n = 2` and image `U^[v₂(α)]`, and, for the image
  `{±1}` (the level `f = ∞`), `isDemushkin_marked_of_q_two_odd_top` for every odd `n` and
  `isDemushkin_marked_of_q_two_even_top` for every even `n`. The last two have the relators
  `x₁²(x₂,x₃)⋯(xₙ₋₁,xₙ)` (the word `demushkinWordTwoOddTop`) with `χ(x₁) = -1`, and
  `x₁²(x₁,x₂)(x₃,x₄)⋯` (the word `demushkinWordNeTwo` at `q = 2`) with `χ(x₂) = -1`, and `χ = 1`
  on every other marked generator. Together the six cover every Demushkin group: for
  `⟨x, y ∣ x²(x,y)⟩`, with `n = 2`, `q = 2` and `Im χ = {±1}`, only the even `{±1}` statement
  applies and gives `χ(x) = 1`, `χ(y) = -1`; for `⟨x₁, x₂, x₃ ∣ x₁²(x₂,x₃)⟩` only the odd one
  applies and gives `(-1, 1, 1)`. The `q ≠ 2` statement carries no rank hypothesis, because the one Demushkin group
  of rank `1`, `ℤ/2` at `p = 2`, has `q = 2`; the three `q = 2` statements do not assume `q = 2`,
  because their image equation puts `-1` or a unit `≡ 3 mod 4` into `Im χ`, which forces it. The
  relator words are the named terms `demushkinWordNeTwo`,
  `demushkinWordTwoOdd`, `demushkinWordTwoOddTop`, `demushkinWordTwoEven` and
  `demushkinWordTwoRankTwo`, each written on
  a tuple of group elements so that the same word can be read in `F` and in `G`. Their
  parameters are natural numbers, which is all the marked statements need, since the image
  equation pins the parameters and natural representatives exist. The `q = 2` words with the
  genuine parameters `α ∈ 4ℤ₂` and `f : ℕ∞` (with `2^∞ = 0`) of the successive-approximation
  conclusion are read in the free pro-`2` group through Tau Ceti's `p`-adic power
  `TauCeti.IsProP.padicPow`, and agree with the natural-parameter words at natural parameters,
  by `TauCeti.IsProP.padicPow_natCast`. A natural number
  does not stand for a general `α`: the word in the nonabelian group `F` depends on the actual
  exponent, not on its residue at one finite level. The character
  values are stated as equations in `ℤ_p`, for instance `χ(x₂)(1 - q) = 1` in place of
  `χ(x₂) = (1-q)^{-1}`, so that no unit has to be constructed in order to state them. The
  unmarked isomorphism statements are corollaries, obtained by forgetting the character
  clause. The marked form supplies the normalization consumed by `LocalGaloisGroups`.
  ⚠ In the two `q = 2` statements the normal-form parameters are pinned to `G` by the **image
  equation** of the table above — `Im χ = {±1} × U^(f)` for `n` odd, and for `n` even either
  `2^f ∣ α` with `Im χ = {±1} × U^(f)` or `v₂(α) < f` with `Im χ = U^[v₂(α)]` — taken as a
  hypothesis, which is why they are stated at the literal prime `2`. The weaker condition that
  the character value the conclusion prescribes is attained does not pin `f`: it is monotone in
  `f`, since `(1 - 2^f)^{-1} ∈ U^(f) ⊆ U^(f₀)` for `f ≥ f₀`, so a statement resting on it would
  assert marked isomorphisms onto presented groups of every level `f ≥ f₀`, which have pairwise
  distinct orientation images, and would be false for every level but the true one. In the
  even case with `v₂(α) < f` the parameter `f` is genuinely free above `v₂(α)`: those presented
  groups are all Labute's `x₁^{2+α}(x₁,x₂)(x₃,x₄)⋯`, the value `f = ∞`.
  ⚠ The words are read on tuples whose out-of-range generators are `1`, so a marking clause on
  a generator that does not exist at the given rank is not vacuous but false: at `n = 2` the
  fourth generator is `1`, a clause `χ(x₄)(1 - 2^f) = 1` reads `1 - 2^f = 1` in `ℤ₂`, and the
  remaining hypotheses of the even statement are met there, by `⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩` with
  `α = 4`, `f = 3` and image `U^[2]`. That failure is why the even statement carries `n ≥ 4` and
  the odd one `n ≥ 3`.
  Rank two is its own statement: the relator is `x₁^{2+α}(x₁,x₂)`, the word
  `demushkinWordTwoRankTwo` with no level `f`, the marking is `χ(x₁) = 1` and
  `χ(x₂)(1 + α) = -1`, and the image is `U^[v₂(α)]`, which pins `v₂(α)` and leaves `α` free
  within its valuation. The other even branch does not occur at rank two: a rank-two image is
  procyclic, generated by `χ(x₂)`, and `{±1} × U^(f)` with `f < ∞` is not. This is the `N ≥ 1`
  against `N ≥ 2` of the even-rank bullet below.
  *Needs:* L9 normal forms and character values; L9 Labute Thm 2 in marked form; L5
  presentations.
  *Source:* Labute Thms 1, 2 and 4.
- **The `q = 2` even-rank case.** The arguments over `Λ = ℤ₂[[Γ]]` with `Γ = Im χ`, acting on
  Labute's module `E = ker(χ)/(ker χ, ker χ)` and not on `R^{ab}`, using the completed-algebra
  prerequisite, that is the power-series coordinate, evaluation, and the division criterion. Two even-rank families, with `N = n/2` and `(A : A²)` as declared in
  Layer 8:
  - `r = x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯` realizes `Im χ = U^[f]`, where `(A : A²) = 2`, for
    `N ≥ 1` and `2 ≤ f < ∞`. ⚠ The endpoint `f = ∞` is a separate statement,
    `isDemushkin_marked_of_q_two_even_top`, because `U^[f] = closure ⟨-1 + 2^f⟩` is defined
    only for finite `f`. At `f = ∞` the relator is `x₁²(x₁,x₂)(x₃,x₄)⋯` and the image is
    `{±1} = V^(∞)`;
  - `r = x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` realizes `Im χ = {±1} × U^(f)`, where `(A : A²) = 4`,
    for `N ≥ 2` and `2 ≤ f < ∞`, and `f = ∞` is excluded.

  Each statement carries the restrictions on `N` and `f` as hypotheses. The proofs are the basis
  corrections followed by the character-preserving iteration of the Layer 9 prerequisites.
  *Needs:* L9 completed group algebra; L9 the basis corrections and the character-preserving
  iteration; L9 character values; L8 comparison schema.
  *Source:* Labute Thm 1, through Thms 5 and 6.
  ⚠ Cite Labute, and not NSW, for completeness. NSW (3.9.19) states only the existence of
  the `q = 2` normal forms; which pairs `(α, f)` give isomorphic groups is Labute Thms 1, 2,
  4, 5 and 6.
  ⚠ NSW print the second even form as `x₂²(x₁,x₂)x₃^{2^f}⋯` on page 417 of the second
  edition, where Labute has `x₁²(x₁,x₂)x₃^{2^f}⋯`. The two are equivalent under a basis
  change; quote the exact form of each source.
- **The classification theorems.**
  - *Uniqueness:* two Demushkin groups with the same `n` and the same `Im χ` are isomorphic.
  - *Uniqueness, marked form (Labute Thm 2, p. 107).* If `r, r' ∈ F` present Demushkin groups
    `F/(r)` and `F/(r')` with the same orientation image, a continuous automorphism `φ` of `F`
    has `φ(r) = r'` (`exists_continuousMulEquiv_map_demushkinRelator`). Labute assumes
    `r, r' ∈ Fᵖ[F, F]`; that is implied, because a relator outside `Φ(F)` is part of a basis by
    Burnside, and then the quotient is free pro-`p` with `H² = 0`. This is a milestone in its own right, and not a remark, because it is what
    turns "isomorphic" into "isomorphic by a basis change" and so makes the marked normal forms
    below a normalization rather than a choice.
  - *Existence:* let `A` be a closed subgroup of `ℤ_pˣ` that is **pro-`p`**. Then `(n, A)`
    is realized in exactly three situations:
    1. `n` is even and `p^n > (A : A^p)`;
    2. `n` is odd and `n ≥ 3`, so `p = 2`, and `A = {±1} × U^(f)` with `f ≥ 2` or `f = ∞`;
    3. `n = 1` and `A = {±1}`.

    Realized means: there is a relator `r` in the free pro-`p` group on `n` generators with
    `F/(r)` Demushkin of rank `n` and orientation image `A`. The statement is two equivalences,
    one per parity of `n`: `exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even`, for every
    `p`, with `(A : A^p) < p^n` as supernatural numbers, and
    `exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd`, at `p = 2`, with `A = {±1}` for
    every odd `n` or `n ≥ 3` and `A = {±1} × U^(f)` with `f ≥ 2`; situation 3 is the instance
    `n = 1` of the odd one. Both directions are part of the statement, necessity for every `q`
    including `q = 2`, and neither assumes a Demushkin group is given.
    **Checks.**
    - `(p, n, A) = (3, 2, 1)`: `(A : A³) = 1 < 9`, realized by `ℤ₃² = ⟨x₁, x₂ ∣ (x₁, x₂)⟩`.
    - `(2, 2, ℤ₂ˣ)`: `ℤ₂ˣ = {±1} × U^(2)` has `(A : A²) = 4`, and `4 < 4` fails, so no
      Demushkin group of rank `2` has image `ℤ₂ˣ`; `(2, 4, ℤ₂ˣ)` has `4 < 16` and is realized
      by `x₁²(x₁,x₂)x₃⁴(x₃,x₄)`.
    - `(2, 1, {±1})` is realized by `C₂ = ⟨x₁ ∣ x₁²⟩`; `(2, 1, {±1} × U^(2))` is not, since the
      odd family needs `n ≥ 3`.
    - `n = 0` never occurs: `(A : A^p) ≥ 1 = p⁰`.

    ⚠ The hypothesis that `A` is pro-`p` is part of the statement, because `A` is the image
    of a pro-`p` group under a continuous homomorphism. Without it the numerical condition
    admits impossible pairs: at `p = 3` and `n = 2`, the subgroup `A = ℤ₃ˣ` has
    `(A : A³) = 3 < 9`, and it contains `{±1}`, so it is not pro-`3`. For odd `p` the
    condition is `A ≤ 1 + pℤ_p`. For `p = 2` every closed subgroup of `ℤ₂ˣ` is pro-`2`, so
    the three families of Layer 7 are all admissible.

  The small-rank cases are part of the statement. For the odd case Serre's Thm 3.2 covers
  `n = 2m + 1` with `m ≥ 1`; handle `n = 1` through NSW (3.9.10) and Labute Remark 2(iii).
  *Needs:* L9 normal forms and character values; L8 comparison schema; L3 Hopf property.
  *In Tau Ceti:* `TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even`
  (`Demushkin/NormalForm/Two/Even/Image.lean`) and
  `TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd`
  (`Demushkin/NormalForm/Two/Odd/Image.lean`); the realization families are in
  `Demushkin/NormalForm/Existence.lean`.
  *Source:* Labute Thms 1 and 2, and Remark 2.
- **Consequences.** The open-subgroup theorem was proved in Layer 7 from the duality
  package. Here it acquires its classification content: for `U` open in an infinite
  Demushkin `G`, the invariants of `U` are `n(U) = 2 + [G : U](n(G) - 2)` and
  `Im(χ|_U) = χ(U)`, so the classification identifies `U` up to isomorphism.
  *Needs:* L7 open-subgroup theorem; L9 classification.
  *Source:* Serre, *Structure de certains pro-p-groupes*, Thm 9.2.
  ⚠ At `n = 2` the rank formula gives `n(U) = 2` for every `U`, so the rank-2 groups with
  `q ≠ 2`, which are `ℤ_p ⋊ ℤ_p`, are the case to check first.

#### Examples

- `ℤ_p² = ⟨x₁, x₂ ∣ (x₁, x₂)⟩` (`q = 0`), `⟨x₁, x₂ ∣ x₁^p(x₁, x₂)⟩` (`q = p`, `Im χ = 1 + pℤ_p`).
- At `p = 2`: `x₁²(x₁,x₂)` (`Im χ = {±1}`), `x₁⁶(x₁,x₂)` (`Im χ = U^[2]`), and `D₀` (`n = 3`).

#### Dependencies

Layers 0, 1, 3, 4, 5, 7 and 8; Mathlib `PowerSeries`, `PowerSeries.aeval`, `MonoidAlgebra`;
Tau Ceti `LinearMap.BilinForm.Nondegenerate.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one` and
the Demushkin normal-form files.

### Layer 10: free pro-`C` groups on profinite spaces

This layer is the home of the infinite-rank theory. Its free object is Tau Ceti's
`TauCeti.freeProCPointed C x₀`, used under that name; this roadmap builds no second free object on
a space.

- **Construction and universal property.** `F_C(X, ∗)` on a pointed profinite space, with a
  basis that converges to `1`: continuous maps `X → P` that send `∗` to `1` correspond to
  continuous homomorphisms into a profinite `P` in the class `C`. It is the quotient of
  `freeProC C X` by the intersection of the open normal subgroups through which the generator
  map is continuous and kills `∗`, and nothing in the construction uses compactness of `X`. It
  recovers the Layer 4 object for discrete `X`: there it is the free pro-`C` group on
  `X ∖ {∗}`. For an infinite discrete set `S` there are two candidate objects:
  - `freeProC C S`, the Layer 4 construction, whose universal property quantifies over all
    maps `S → P`;
  - `F_C(S⁺, ∗)` on the one-point compactification, whose universal property quantifies
    over maps that converge to `1`.

  The inclusion `S → S⁺` induces a continuous surjection `freeProC C S ↠ F_C(S⁺, ∗)`, and the
  images of the points of `S` converge to `1` in the target. The theorem to prove is that **at
  `C = finiteGroupClassP p`** this map is not injective for infinite `S`
  (`not_injective_fromFreeProC_finiteGroupClassP`). The witness is a computation of ranks, and
  not a description of the kernel by generators, which this roadmap does not claim: the
  continuous characters of the source are all maps `S → 𝔽_p`, a product of dimension `p^{#S}` by
  the Erdős–Kaplansky theorem, while those of the target are the finitely supported maps, of
  dimension `#S`.
  ⚠ The statement is false for an arbitrary class. If `C` contains only the trivial group,
  both objects are trivial and the map is injective. Do not state it for `FiniteGroupClass`
  when the proof is specific to pro-`p`.
  Never write "the free pro-`C` group on `S`" without saying which object is meant.
  *Needs:* L4 free objects and `FiniteGroupClass`; L3 rank.
  *In Tau Ceti:* `TauCeti.freeProCPointed` with `of`, `continuous_of`, `of_basePoint`, `lift`,
  `lift_of`, `lift_unique`, `existsUnique_lift`, `hom_ext` and
  `topologicalClosure_closure_range_of_eq_top`, and `TauCeti.isProC_freeProCPointed`;
  `TauCeti.freeProCPointed.equivFreeProC` for discrete `X`; `TauCeti.freeProCPointed.fromFreeProC`
  with `fromFreeProC_surjective`, `tendsto_of_coe_cofinite_nhds_one` and
  `convergesToOne_range_of_coe` (`Free/Pointed/Basic.lean`).
  *Source:* Ribes–Zalesskii §3.3.
- **Bases and rank.** Three statements:
  - existence of bases that converge to `1`, and uniqueness of their cardinality;
  - invariance of `topologicalGeneratorRank` under topological isomorphism, as a cardinal
    and with no finiteness hypothesis;
  - the infinite-rank Frattini argument in the form proved in Layer 3, that is
    `topologicalGeneratorRank G = dim_{𝔽_p} Hom_cont(G, 𝔽_p)`.

  The rank of `F_C(X, ∗)` at `C = ` finite `p`-groups is the `𝔽_p`-dimension of the space of
  continuous functions `X → 𝔽_p` that vanish at `∗`, which for `X = S⁺` is `#S`.
  *Needs:* L3 rank and Burnside; L10 construction.
  *In Tau Ceti:* `TauCeti.topologicalGeneratorRank_congr`,
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`, and the bound
  `TauCeti.topologicalGeneratorRank_freeProPInsertOne_le` of the rank of the free pro-`p` group on
  `(insert 1 s, 1)` by `#s`.
- **Presentations at arbitrary rank.** Every pro-`p` group has a presentation by a free
  pro-`p` group on a profinite space, and has a minimal one. This is the general statement
  that Layer 5 does not make. The presentation on a subset `s ⊆ G` converging to `1` is the
  continuous homomorphism `F_p(insert 1 s, 1) → G` extending the inclusion; it is surjective
  exactly when `s` generates `G` topologically, and for a dual family of a basis of the continuous
  `𝔽_p`-dual of `G` its kernel lies in the Frattini subgroup and it preserves the rank.
  *Needs:* L10 construction; L3 Burnside.
  *In Tau Ceti:* `TauCeti.freeProPInsertOne`, `TauCeti.IsProP.presentation` with
  `presentation_surjective_iff`, `exists_convergesToOne_presentation_surjective` and
  `exists_convergesToOne_presentation_surjective_ker_le_proPFrattini`
  (`Free/Pointed/Presentation.lean`).
- **Serre's theorem in full generality.** `cd_p G ≤ 1` if and only if `G` is free pro-`p`,
  with no finite generation, which is the Layer 6 proof upgraded with bases that converge to
  `1`. The forward implication, and the equivalence of projectivity with freeness for pro-`p`
  groups, are Tau Ceti's. The converse runs through projectivity: an extension of a projective
  pro-`p` group by a finite `p`-group splits continuously, so `H²` vanishes on finite
  `p`-primary coefficients, and Layer 6 turns that vanishing into `cd_p ≤ 1`. Closed subgroups
  of free pro-`p` groups are free pro-`p`, which is the full pro-`p` Nielsen–Schreier theorem.
  The equivalence is `cd_p_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation`:
  for compact, totally disconnected `G` with `IsProP p G`, `cd_p G ≤ 1` if and only if some
  `s ⊆ G` converging to `1` has its presentation `F_p(insert 1 s, 1) → G` a topological
  isomorphism.
  *Needs:* L6 Serre's theorem; L10 bases and presentations.
  **Checks.**
  - `G = 1`: `cd_p = 0 ≤ 1`, and `s = ∅` gives `F_p({1}, 1) = 1`.
  - `G` the free pro-`p` group on the one-point compactification `ℕ⁺` of a countable discrete
    set: rank `ℵ₀`, `cd_p = 1`, and the image of `ℕ` is a set converging to `1` whose
    presentation is an isomorphism; no finite-rank statement applies to it.
  - `G = ℤ/p`: `cd_p = ∞`, and no presentation is an isomorphism, since a free pro-`p` group
    on a nonempty set is torsion-free; the negative control.
  - `G = ℤ_p × ℤ_p`: `cd_p = 2`, and the abelian group is not free pro-`p` of rank 2, whose
    abelianization would be the same but whose `H²(−, 𝔽_p)` is `0` against dimension 1.
  *In Tau Ceti:*
  `TauCeti.IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`,
  `TauCeti.IsProP.isProjective_iff_exists_convergesToOne_continuousMulEquiv_presentation`,
  `TauCeti.isProjective_freeProCPointed` and `TauCeti.hasPGroupSolutions_freeProCPointed`
  (`Free/Pointed/Serre.lean`, `Free/Pointed/EmbeddingProblem.lean`).
  *Source:* Ribes–Zalesskii Cor. 7.7.5.
- Nothing later in this roadmap uses this layer, because Layer 9 needs only finite
  rank. Without it the theory is truncated.

#### Examples

- The free pro-`p` group on the one-point compactification of `ℕ`, with `∞` as base point, has
  rank `ℵ₀`; on a finite pointed space of `n + 1` points it is `freeProP p (Fin n)`.
- `ℤ_p × ℤ_p` has `cd_p = 2` and is not free.

#### Dependencies

Layers 3, 4 and 6; Tau Ceti `TauCeti.freeProCPointed` and the pointed Serre theorem.

## Worked examples

Acceptance examples include free pro-`p` groups at finite rank, finite cyclic and elementary
abelian pro-`p` groups, standard one-relator Demushkin presentations, and the abstract dyadic
group `D₀ = ⟨A,S,Y ∣ A²S⁴(S,Y)⟩`. These test the abstract classification and comparison APIs;
identifying `D₀` with a local Galois group is deliberately downstream.

## Dependency order

Layers 0–3 establish the profinite and generator-rank substrate; Layers 4–6 construct free
objects and cohomological freeness; Layers 7–8 control one-relator quotients and finite
approximations; Layers 9–10 complete the Demushkin classification and arbitrary-rank theory.

## Downstream consumers

The arithmetic of `G_K(p)`—finite generation, the `[K : ℚ_p] + 2` dichotomy, roots of unity,
the canonical orientation, and the local Demushkin presentation—belongs to
`LocalGaloisGroups`. No theorem in this roadmap depends on a local field, and the
`LocalGaloisGroups`, `LocalFieldsRamification` and `ClassFieldTheory` dependencies are one-way:
they import this roadmap, while this roadmap imports none of them.

## References

The mathematical spine is Serre, *Galois Cohomology*; Ribes–Zalesskii, *Profinite Groups*;
Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*; and the classification work of
Demushkin, Labute, and Serre. The classification is cited from J. P. Labute, *Classification of
Demushkin groups*, Canad. J. Math. 19 (1967), 106–132, and from J.-P. Serre, *Structure de
certains pro-p-groupes (d'après Demuškin)*, Séminaire Bourbaki, exposé 252 (1962/63).

## Errata, corrected at archiving

- **Layer 3, Frattini edge case.** "the abstract `frattini` differs when `G` is not finitely
  generated" should read *can differ*: for `G = (ℤ/p)^ℕ`, which is not finitely generated, both the
  abstract Frattini subgroup and `proPFrattini p G` are trivial.
- **Layer 5, deficiency.** The inequality goes the other way: `#S - #R ≤ d - r` in `ℤ` for every
  finite presentation (adding a redundant relator lowers `#S - #R` and leaves `d - r` unchanged).
  Equality holds exactly when the number of relators is the least number of normal generators of
  the relation subgroup, `d(R ⧸ Rᵖ[R, F])`; a minimal generating set alone does not give it.
- **Layer 7, the prescription connecting map.** Condition 2 uses the upward map on `H²`
  induced by multiplication by `p`, from level `i` to level `i + 1`, not downward reduction.
  Its connecting map is `H¹(G, I(χ)/p) → H²(G, I(χ)/p^i)` for
  `0 → I(χ)/p^i → I(χ)/p^{i+1} → I(χ)/p → 0`.
- **Layer 7, duality needs an infinite group.** The identification `H²(G, I(χ)/pⁱ) ≅ ℤ/pⁱ` and
  the perfect pairings into it hold for *infinite* Demushkin groups. `ℤ/2` is Demushkin at `p = 2` with `χ` the sign, and `H²(ℤ/2, I(χ)/4)` has
  order `2`, not `4`. The trace isomorphism `H²(G, 𝔽_p) ≅ 𝔽_p` holds for every Demushkin group.
- **Layer 8, `δ_1`.** The formula for `δ_j` at `j = 1` omits the quadratic commutator terms
  `Σ_{i<k} a_{ik} [w̄_i, w̄_k]`, and the polarization identity omits their polarization
  `Σ_{i<k} a_{ik} ([v_i, w_k] + [w_i, v_k])`. So `δ_1` is not additive at any `p` once the relator
  has a commutator part. The identity `δ_1(v + w) - δ_1(v) - δ_1(w) = Σ_i c_i [v_i, w_i]` holds at
  `p = 2` only when every commutator coordinate `a_{ik}` vanishes. The polarization identity is not
  a remaining milestone: Tau Ceti proves the corrected form.
- **Layer 9, span statements for `q ≠ 2`.** "`gr_j(F) = Im δ_j` for every `j ≥ 2`" holds when the
  relator class has a nonzero `p`-power part, that is for `q = p` at odd `p`. For `q = 0` or `q` a
  higher power of `p` the class of the relator has no `p`-power part, so `Im δ_j` consists of
  brackets and misses the classes `π^j x̄_i`; the statement then reads `gr_j(F) = Im δ_j + T_j`,
  with the Layer 8 tail `T_j`, here spanned by all the `π^j x̄_i`. The successive approximation
  can also run inside the kernel `X` of the exponent sum at `x₂`, with
  `gr_{m+1}(X) = δ(gr_m(X)^n) + T'_{m+1}`, where the constrained tail `T'_{m+1}` is spanned by the
  `π^{m+1} x̄_i` with `i ≠ 2` only; it is not the Layer 8 tail, which contains `π^{m+1} x̄₂`.
- **Layer 9, the even-rank dyadic tail.** For the even-rank `q = 2` normal form
  `x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` the span statement is `gr_j(F) = Im δ_j + ⟨π^j x̄_i : i ≠ 2⟩`
  (Labute Prop. 5). Its tail contains `π^j x̄₁`, although `c₁ ≠ 0`, and omits `π^j x̄₂`, so it is
  not the Layer 8 tail `T_j`, which is spanned over the indices with `c_i = 0`. The odd-rank tail is
  the Layer 8 one, as stated.
- **Layer 9, nonalternating normal form.** In the nonalternating case the normal form modulo
  `λ_2(F)` is `x₁²(x₂,x₃)(x₄,x₅)⋯` only for odd `n`. For even `n` that word omits `x_n`, so its cup
  form is degenerate; the even-rank normal form is `x₁²(x₁,x₂)(x₃,x₄)⋯`, Labute's.

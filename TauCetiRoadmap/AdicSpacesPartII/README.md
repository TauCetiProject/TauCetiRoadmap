# Roadmap: foundations of adic spaces, part II — morphisms and analytification

**Summary.** Part II turns the adic spaces of [AdicSpaces](../AdicSpaces/README.md) into a
geometry of morphisms. It proves Huber's sheafiness theorem for rings of noetherian type, builds
completed tensor products and fibre products, and develops the morphism classes of adic spaces:
adic and finite-type morphisms, separated, proper and partially proper morphisms with their
valuative criteria, finite and quasi-finite morphisms, continuous differentials, and flat,
unramified, smooth and étale morphisms with their local structure. It then compares adic spaces
with the classical theories: Tate's `K`-affinoid algebras and rigid-analytic spaces, the
analytification `X ↦ X^ad` of schemes locally of finite type over a complete nonarchimedean field,
Huber's comparison functor from rigid to adic spaces, and analytic groups. These are the
foundations on which the étale cohomology of adic spaces, formal models, coherent sheaves and GAGA,
families and dagger geometry, and the perfectoid and Shimura-variety parts of the programme (the
analytifications of modular curves and Shimura varieties, their étale covers and proper maps) are
built. It also supplies adic-ring completion, locally spectral topology, cofiltered spectral
limits, generic Pro categories, qcqs objects in sheaf topoi and non-analytic adic tilde-limits.

This roadmap develops morphisms and admissible affinoid products, classical `K`-affinoid
algebras, analytification and algebraic correspondences on the adic spaces of
[TauCetiRoadmap.AdicSpaces](../AdicSpaces/README.md).
Part II supplies the morphism and analytification interfaces for
[part III](../AdicSpacesPartIII/README.md), which owns formal geometry and coherent sheaves,
and [part IV](../AdicSpacesPartIV/README.md), which owns site applications, families and dagger geometry.

| Layer | Title | What it builds |
|---|---|---|
| R0 | Morphisms and admissible affinoid products | affinoid algebras, completed tensor products, fibre products, the morphism classes, differentials, smooth and étale morphisms; spectral and Pro foundations, qcqs topoi and tilde-limits |
| R1 | Analytification and algebraic correspondences | `X ↦ X^ad`, rigid spaces and affinoid subdomains, the rigid–adic comparison, analytic groups |

## Scope and ownership

The roadmap owns, layer by layer:

- R0: adic rings of finite ideal type and noetherian adic completions; locally spectral
  spaces and maps; constructible topology, spectral limits, spectra of Tate-pair colimits,
  finite-stage opens, generic Pro categories and the finite-T₀ spectral equivalence, qcqs
  sheaf-topos objects and morphisms, and adic tilde-limits with their affinoid and base-change
  criteria; Huber rings of noetherian type, Huber's standing class of f-adic rings, and adic
  homomorphisms; Huber's sheafiness theorem for rings
  with a noetherian ring of definition (the Tate-ring case is Tau Ceti's); the completed tensor
  product of Huber pairs with its topology, plus ring and universal property, uniformisation and the
  uniform completed tensor product, completed tensor products of Banach modules; the carrier of
  classical `K`-affinoid algebras; adic
  morphisms, weak and plus weak finite type, finite presentation and
  their comparisons with AdicSpaces §5.2, locally noetherian and locally Huber-standard adic
  spaces, fibre products, the ideal-sheaf description of closed subspaces using AdicSpaces §5.1,
  and the diagonal; separated, universally closed, proper and partially
  proper morphisms with the valuative criteria; finite and quasi-finite morphisms; continuous
  differentials; flat, unramified, smooth and étale morphisms, the local structure theorems and
  étale affinoid morphisms over a field; Huber's predicate "analytic adic space", stated in R0
  as `AdicSpace.IsAnalytic` and consumed by AdicEtaleGeometry layer A0. Where a target specialises to Tate
  rings the library's theorem is cited in its text and the target is the non-Tate case; the
  algebraic noetherian completion statement is R0.1b's
  `isNoetherianRing_of_isAdicComplete` and `IsAdicRing.adicCompletion`; the Huber-ring
  completion statement is R0's `Huber.IsNoetherianType.completion` and R0 applies it, and
  R0 uses Mathlib's spectral and constructible topologies for its pro-constructible statements.
- R1: Huber's fibre product of a scheme with an adic space, the analytification functor over `K`
  and its compatibilities, local rings, constructible sets and connectedness, separatedness and
  properness of analytifications, the universal property of the rigid–adic comparison, and
  analytic groups and invariant differentials.

Classical rigid geometry (the theory of `K`-affinoid algebras, affinoid subdomains, Tate
acyclicity, rigid-analytic spaces, the rigid analytification with its reducedness and normality,
the dimension of affinoid domains, the identity principle, constructible density of classical
points, and Huber's functor with its full faithfulness, essential image and equivalence on
quasi-separated objects) is RigidAnalyticGeometry's,
and the norm of a Tate ring and bases of Banach spaces of countable type are
PadicFunctionalAnalysis's; the supplier table identifies the sections and contracts used here.

AdicSpaces owns the underlying adic-space foundations, including the category, open immersions
and quotient Huber pairs, and it specifies closed immersions (its §5.1) and topological finite
type of complete pairs and morphisms locally of finite type (its §5.2). Part II states these
predicates, `AdicSpace.IsClosedImmersion`, `AdicSpace.IsTopologicallyFiniteTypePair` and
`AdicSpace.LocallyOfFiniteType`, on Tau Ceti's `TauCeti.AdicSpace`; their signatures in this
folder's `Suggested.lean` record those supplier contracts, and the further theory of them
(comparisons, fibre products, closure properties, properness) is R0's. Existing Mathlib and Tau Ceti
APIs are used directly; cited roadmap suppliers own the contracts below. Tau Ceti follows
Mathlib's API decisions and builds every needed target here without waiting for upstream work.

The shared geometric predicates have the namespace
`TauCetiRoadmap.AdicSpacesPartII.AdicSpace`: `IsLocallyNoetherian`, `IsLocallyHuberStandard`,
`IsAnalytic`, `IsAdic`,
`LocallyOfWeaklyFiniteType`, `LocallyOfPlusWeaklyFiniteType`, `Flat`, `IsClosedImmersion`,
`IsSeparated`, `IsPartiallyProper`, `IsProper`, `IsFinite`, `Unramified`, `Smooth` and `Etale`.
Consumers import `TauCetiRoadmap.AdicSpacesPartII.Suggested` and use these declarations
on `TauCeti.AdicSpace`. Their affinoid presentations are `AdicSpace.Affinoid`, `Chart`
and `HomChart` in this namespace. `IsClosedImmersion`, `IsTopologicallyFiniteTypePair` and
`LocallyOfFiniteType` are stated in the same namespace on these shared carriers, following the
specifications of AdicSpaces §§5.1–5.2.

The R0 étale affinoid factorisations supply
[AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md),
which owns *etale-morphisms-local-description-and-comparison*.
The R1 comparison of differentials on analytification charts supplies
[AdicSpacesPartIII](../AdicSpacesPartIII/README.md), whose R3
*sheaf-of-continuous-differentials* owns the gluing to a sheaf comparison.

## Conventions

1. **Huber pairs** are Tau Ceti's `Huber.Pair A`: the plus ring is explicit data. Morphisms are
   `Huber.Pair.Hom` (continuous, carrying `A⁺` into `B⁺`). Pairs of definition are
   `Huber.PairOfDefinition`.
2. **Complete includes Hausdorff**, as in AdicSpaces; every statement about complete rings, modules
   or pairs carries both.
3. **Adic spaces** are the objects of AdicSpaces' category (`TauCeti.AdicSpace`): locally
   `Spa(A, A⁺)` for sheafy complete Huber pairs. A point is *analytic* if it has an open
   neighbourhood whose ring of sections has a topologically nilpotent unit. A Huber ring is *of
   noetherian type* if it has a noetherian ring of definition or is a strongly noetherian Tate
   ring; an adic space is *locally noetherian* if it is locally `Spa` of such a ring. Huber's
   standing class (Huber96 (1.1.1)) is narrower: a noetherian ring of definition over which the
   ring is finitely generated, a strongly noetherian Tate ring, or a discrete ring; an adic space
   is *locally Huber-standard* if it is locally `Spa` of a ring in the class. Sheafiness (R0.2)
   needs only noetherian type; the unramified, smooth and étale theory (R0.16–R0.17) carries the
   standing class on every space, and local finite presentation asks for its witness charts in
   the class (R0.6).
4. **The base field.** `K` is complete for a nontrivial rank-one nonarchimedean absolute value,
   `O_K = K°`, `ϖ` a pseudouniformiser, `Spa K = Spa(K, K°)`. `O_K` is noetherian exactly when `K` is
   discretely valued; no statement assumes this unless it says so.
5. **Completed tensor products** `B ⊗̂_A C` are formed only along adic structure maps, with the
   topology from rings and ideals of definition, plus ring the integral closure of the image of
   `B⁺ ⊗_{A⁺} C⁺`, then completion. They are neither uniform nor sheafy in general; every fibre
   product carries its own existence and sheafiness hypotheses.
6. **Fibre products** are taken in AdicSpaces' category and exist under Huber's hypotheses (R0); the
   map from `|X ×_Z Y|` to the fibre product of the underlying sets is surjective when
   `X → Z` is locally of weakly finite type and `Y → Z` is adic, with the stable-chart
   hypotheses of R0.6. It need not be injective.
7. **Rigid spaces** are Tate's, as constructed in RigidAnalyticGeometry §6.2 (cited in R1).
   `X^an` is the rigid and `X^ad` the adic analytification; they are identified only through
   Huber's functor `r_K`.
8. **Names.** Declarations live under `TauCetiRoadmap.AdicSpacesPartII`, at the roadmap root and in `Huber`, `AdicSpace`, `RigidSpace`, `Pro`, `SpectralSpace` and `Topos`.
9. **Targets.** Each target below is a definition, construction, theorem or comparison, written
   with its hypotheses in the sentence, its source locator in parentheses (short keys are resolved
   in the References), its API as named lemmas (suggested names for the formalisation) and its
   unit tests as `Checks`. A target's `Lean:` line names the declarations of `Suggested.lean` that
   carry it, or says that it is a README target, specified here only. `Suggested.lean` states the
   definitions that are a few lines over Tau Ceti's carriers and the headline theorems about them,
   with a selection of the Checks as `example`s; it is read as suggested forms, not as a
   checklist. Later targets and the Lean file refer to each target by its italicized label.
10. **Affinoid morphisms.** A morphism of affinoid charts is recorded together with the morphism
   of Huber pairs it induces on global sections (`AdicSpace.Affinoid.IsInducedBy`); Tau Ceti has
   the presheaf map of `Spa(φ)` but not yet the morphism of adic spaces, which is an R0 target.

## Exact supplier contracts

| R0 supplier | Exact file | Contract used |
|---|---|---|
| `CategoryTheory.Mono`; `TauCeti.AdicSpace` | `Mathlib/CategoryTheory/Category/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` | The monomorphism case of *immersion-unramified* uses `Mono f.hom` in the category of pre-adic spaces and Part II's `LocallyOfFiniteType f`. Cancellation applies to spectra of non-sheafy test pairs as well as to adic spaces. |
| `Algebra.FiniteType`, `Algebra.FiniteType.isNoetherianRing`; `TauCeti.Huber.PairOfDefinition` | `Mathlib/RingTheory/FiniteType.lean`; `TauCeti/RingTheory/Huber/Basic.lean` | Clause (a) of `Huber.IsHuberStandard` (Huber's standing class) uses the supplied finite-type algebra predicate for the inclusion of a noetherian ring of definition. The Hilbert basis theorem implies noetherianness of the ambient ring in this clause; discreteness is a separate clause (Huber96 (1.1.1), p. 37). `Huber.IsNoetherianType` asks only for a noetherian ring of definition, without finite generation. |
| `TauCeti.IsProConstructible`, `TauCeti.IsSpectralMap.continuous_constructibleTopology` | `TauCeti/Topology/Spectral/ProConstructible.lean`; [AdicSpaces §1.3](../AdicSpaces/README.md#13-pro-constructible-subspaces) | Pro-constructibility and continuity for the constructible topologies, used in R0's spectral-map image theorem. |
| `TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`, `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean`; [AdicSpaces §2.1](../AdicSpaces/README.md#21-huber-pairs-and-spa) | Pro-constructibility and spectrality of the supplied affinoid spectrum. |
| `LinearMap.isStrictMap_of_module_finite` | `TauCeti/RingTheory/Huber/StrictMorphism.lean` | Tau Ceti supplies strictness over a complete Hausdorff Tate ring with countably generated uniformity, for a finite source module and a noetherian target module, both complete Hausdorff with countably generated uniformity and continuous scalar multiplication. The declaration is in the root `LinearMap` namespace. R0 adds the noetherian-ring-of-definition case. |
| `TauCeti.ValuationSpectrum.IsAnalyticPoint`, `spaAnalytic`, `isAnalyticPoint_of_isTateRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean`; [AdicSpaces](../AdicSpaces/README.md), layer 5 | These supply analytic points and the affinoid analytic locus. R0 states the space predicate `AdicSpace.IsAnalytic` on complete sheafy Tate charts of the supplied `TauCeti.AdicSpace`; AdicEtaleGeometry A0 consumes that predicate and constructs the analytic open subspace. |
| `TauCeti.AdicSpace`; `TauCeti.ValuationSpectrum.closedPolydisc` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; [AdicSpaces](../AdicSpaces/README.md), §§0.5, 2.4, 5.1 | The properness Checks use the supplied adic category and disc ring. Part II’s `Affinoid.spa` supplies its complete sheafy presentation, the open disc is specified by its image in that disc, and the analytification of `ℙ¹_K` (R1.3) supplies the projective line. |
| `TauCeti.PreAdicSpace.Hom.residueFieldMap`, `Hom.valuation_eq_comap`; `residueFieldMap_id`, `residueFieldMap_comp` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`; AdicSpaces §5 | The pushforward of valuation rings along a morphism (R0.11) contracts the refining valuation ring along the supplied residue-field map. The affinoid field of a valuation ring (R0.11) completes the supplied stalk residue field in its original valuation topology and closes the refining plus ring. |
| `TauCeti.Huber.PairOfDefinition.locUniformSpace`, `toCompletionLoc` | `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean`; AdicSpaces §§0.4, 3.1 | The localisation comparison of continuous differentials (R0.15) uses this completed localization and its coefficient map. A continuous ring equivalence with continuous inverse identifies the target algebra with that completion over the source. |
| `TauCeti.PreAdicSpace.Hom.stalkMap`, `TauCeti.PreAdicSpace.valuation`; `TopCat.Presheaf.stalkSpecializes`, `IsLocalRing.residue`; `TauCeti.ValuationSpectrum.gaussPoint` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `Mathlib/Topology/Sheaves/Stalks.lean:356`; `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean:36`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean`; AdicSpaces §§2.3, 5 | R0.11 uses the supplied residue valuations and structural stalk maps. Its centre condition fixes the induced residue map by the specialization map; the Gauss-point Check pulls back the supplied point along the Tate-algebra completion map. |
| `TauCeti.reesAlgebra.grade` | `TauCeti/RingTheory/ReesAlgebra/Grading.lean` | `submoduleBlowup.gradedRing_eq_reesAlgebra` compares the images of the two degree-n submodules in the same polynomial ring; `reesRing_eq_reesAlgebra` separately identifies the underlying subalgebras. |
| `AddMonoidAlgebra`, `RingNorm.toNormedRing`, `UniformSpace.Completion`; `smoothingFun` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`; `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:272`; `Mathlib/Topology/UniformSpace/Completion.lean`; `Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean:100`; AdicSpaces §0.3 | `rootedPolynomial` specializes the monoid algebra to nonnegative p-power exponents and `PerfectoidDisc` takes its Gauss completion. `weightedSeries` uses the degree weight n + 1, unlike the supplier's finite family of variable weights. Both norms use the supplied norm-to-topology construction; the Banach uniformization comparison uses the supplied spectral root limit. |
| `TauCeti.ValuationSpectrum.closedPolydisc`, `TauCeti.Huber.weightedRestrictedSubring`, `weightedX` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; AdicSpaces §§0.4–0.5 | The p-adic blow-up charts use this disc ring and its power-bounded subring. The uniformization of degree-weighted series is compared with this same ordinary disc carrier. |
| `TauCeti.Huber.Pair.quotientHom`, `TauCeti.Huber.Pair.Hom.toRingHom_quotientHom`; `PadicInt.toZMod`; `reesAlgebra` | `TauCeti/RingTheory/Huber/Pair.lean`; `Mathlib/NumberTheory/Padics/RingHoms.lean:300`; `Mathlib/RingTheory/ReesAlgebra.lean:40`; AdicSpaces §§0.3, 2.4 | The quotient-pair and reduction Checks use the supplied maps and separated completions. The integer Rees Check computes the degree-one coefficient restriction in the supplied polynomial carrier. Disc Checks use the restricted-series and polydisc suppliers below. |
| `TauCeti.Huber.PairOfDefinition.adic`, `PadicInt.isAdic_maximalIdeal`, `PairOfDefinition.weighted`, `PairOfDefinition.locTopology` | `TauCeti/RingTheory/Huber/Adic.lean`; `TauCeti/RingTheory/Huber/Padic/Basic.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/PairOfDefinition.lean`; `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean`; AdicSpaces §0.4 | The Čech Checks use the supplied unit-weight series ring over `ℤ_p`, its pair of definition `(ℤ_p⟨T⟩, (p))`, and the uncompleted rational-localization topology. The carrier is the same unit-weight series ring used by `TauCeti.ValuationSpectrum.closedPolydisc` in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`. |
| `TauCeti.Huber.Pair`, `Pair.powerBounded`, `TauCeti.Huber.Pair.powerBounded_plus`; `weightedC`, `weightedX` | `TauCeti/RingTheory/Huber/Pair.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; AdicSpaces §§0.4–0.5, 2.1 | The tensor Checks use the supplied Huber pair and restricted-series carrier. `padicDiscSmallPair` specifies a proper ring of integral elements on that carrier; the quadratic Check uses `Pair.powerBounded` on each field. |
| `Ideal.adicTopology`, `WithIdeal`; `Submodule.fg_span_singleton` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean:91,237`; `Mathlib/RingTheory/Finiteness/Basic.lean:39` | The `(p)`-adic topology on `ℤ`, its additive uniformity, and finite generation of the principal ideal used by `adicCompletion_padicIntegers`. |
| `TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `TauCeti.Huber.restrictedMvPowerSeriesCompletionEquiv`; `TauCeti.ValuationSpectrum.closedPolydisc` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Complete.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; AdicSpaces §§0.5, 2.4 | The Tate-algebra Checks use the supplied restricted-series carrier at weights `{1}`, or its separated completion. The supplied equivalence identifies these carriers over a complete Hausdorff nonarchimedean field; the supplied polydisc is their spectrum with the power-bounded plus ring. In `completedTensor_test_polydisc`, both coordinates are completion images of the supplied `weightedX`. The subdomain spectrum and restriction Checks in R1.1 use this same completion and the polynomial inclusion `Huber.TateAlgebra.ofMvPolynomial`; their disc presentation adds the equation `T ↦ cS` and computes contractions of principal maximal ideals. |
| `CategoryTheory.Limits.pullback`, `CategoryTheory.Limits.pullback.fst`; `TauCeti.Huber.restrictedMvPowerSeriesCompletion`; `TauCeti.ValuationSpectrum.closedPolydisc` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean:96,112`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; AdicSpaces §§0.5, 2.4 | R1.7 uses `RigidSpace.hasPullbacks` (RigidAnalyticGeometry §6.2), `Sp` and `Affinoid.polydisc` to form the relative rigid polydisc as `Sp A ×_{Sp K} Sp K⟨T₁,…,Tₙ⟩`. `RigidSpace.IsSmooth` adds the admissible affinoid étale-chart condition, using these supplied series and categorical carriers. |
| `TauCeti.Huber.IsUniform`, `TauCeti.Huber.isUniform_iff_isBounded_powerBoundedSubring`, `TauCeti.Huber.IsUniform.isBounded_powerBoundedSubring` | `TauCeti/RingTheory/Huber/Uniform.lean`; AdicSpaces §4.2 | Uniformity uses `IsUniform X`. For a commutative nonarchimedean ring this is equivalent to boundedness of `powerBoundedSubring X`; the supplied equivalence converts between the two statements. Spectral topology, uniformization, uniform completed tensors and reduced affinoids use this predicate on their own carriers. |
| `TauCeti.Huber.powerBoundedSubring` | `TauCeti/RingTheory/Huber/PowerBounded.lean`; AdicSpaces §0.1 | In the quadratic ring-of-definition Check, the image of the supplied power-bounded subring of `ℚ_p⟨T,S⟩` is the integral model `B`; power-boundedness in its quotient uses the same supplied predicate. |
| `TauCeti.Huber.IsHuberRing`, `TauCeti.Huber.PairOfDefinition` | `TauCeti/RingTheory/Huber/Basic.lean`; `TauCetiRoadmap/AdicSpaces/README.md`, §0.2 | The Huber-ring and pair-of-definition carriers for the open-subring spectrum comparison and for the comparison of algebraically finite type with Huber's definition (*algebraically-finite-type-ring-map*). The latter uses these same pairs on the ambient rings and on the induced topologies of the plus and open subrings; no completeness or noetherian hypothesis is imposed. |
| `AlgebraicGeometry.Spec.map`, `AlgebraicGeometry.Spec.map_apply`, `AlgebraicGeometry.morphismRestrict` | `Mathlib/AlgebraicGeometry/Scheme.lean:537`; `Mathlib/AlgebraicGeometry/Restrict.lean:569` | The inclusion induces the actual scheme morphism, whose underlying map contracts prime ideals; its restriction has source the inverse-image open subscheme. The open-subring spectrum comparison (*open-subring-spec-isomorphism*) asserts that this restriction is an isomorphism. |
| `AlgebraicGeometry.IsZariskiLocalAtTarget.iff_of_iSup_eq_top` | `Mathlib/AlgebraicGeometry/Morphisms/Basic.lean:154` | Isomorphisms can be checked on an open covering of the target; the open-subring comparison uses the basic opens of topologically nilpotent elements. |
| `TauCeti.Huber.IsStablySheafyRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean`; [AdicSpaces §3.4](../AdicSpaces/README.md#34-pre-adic-spaces) | The ring predicate used by `HasStablySheafyCharts`. R0.10 adds geometric separatedness, universal closedness and universal specialization on the supplied `TauCeti.AdicSpace` category, retaining local weak finite type and, for separatedness, the source chart condition. |
| `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.IsOpenImmersion` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/OpenImmersion.lean` | AdicSpaces §5 supplies the category and open immersions. R0.6 uses these carriers through complete sheafy `Affinoid` presentations and commuting `HomChart`s. |
| `TauCeti.ValuationSpectrum.comap`, `TauCeti.ValuationSpectrum.spa`, `TauCeti.Huber.Pair.Hom.spaComap` | `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`; AdicSpaces §§1.1, 2.1 | Pullback of valuation classes and the actual continuous bounded points of a Huber pair. Field amalgamation and geometric point lifting use these carriers. |
| `ValuationSubring.comap`, `Ideal.ResidueField` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean:854`; `Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean:33` | Restriction of valuation rings and the residue field at a prime of the tensor product; its two canonical maps from the factor fields are embeddings agreeing on the base. |
| `TauCeti.Huber.PairOfDefinition.HasDenominatorPower`, `hasDenominatorPower_of_isOpen_span`, `locTopology` | `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean` | The denominator-power condition and uncompleted rational topology from [AdicSpaces §0.4](../AdicSpaces/README.md#04-weighted-restricted-series-and-topological-localisation). `NoetherianCech.hasDenominatorPower` specializes the open-span theorem to products from a unit-ideal generating family; `termTopology` uses this topology directly. |
| `Ideal.span_range_pow_eq_top` | `Mathlib/RingTheory/Ideal/Basic.lean:185` | Powers of a unit-ideal generating set still generate the unit ideal. The constant tuples among the Čech numerator products give these powers. |
| `LocalizedModule.lift`, `IsLocalizedModule.map_units`; `Fin.strictMono_succAbove`, `Fin.prod_univ_succAbove` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean:665,537`; `Mathlib/Order/Fin/Basic.lean:191`; `Mathlib/Algebra/BigOperators/Fin.lean:68` | Restriction from a face localization to the full intersection, and the increasing tuple obtained by deleting a vertex. `cechLocalizationDifferential` sums these restrictions with alternating signs on the algebraic module localizations, before the topological localization and completion of AdicSpaces §0.4. |
| `TauCeti.Huber.IsTateRing`; `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom` | `TauCeti/RingTheory/Huber/Basic.lean`; `TauCeti/RingTheory/Huber/Pair.lean` | The Tate hypothesis and Huber-pair carriers of AdicSpaces Layer 0, used directly in `IsAlgebraicallyFiniteType.exists_fg_plus`. |
| `TauCeti.Huber.PairOfDefinition`, `PairOfDefinition.idealImage`, `TauCeti.Huber.PairOfDefinition.coe_idealImage` | `TauCeti/RingTheory/Huber/Basic.lean` | The pair carrier of AdicSpaces §0.2 and the image of its ideal powers in the ambient ring. `SpectralTop.pairOfDefinition_ideal` specifies the first-power image for the spectral pair chosen from a Tate norm datum. |
| `TauCeti.Huber.weightedPolynomials`, `TauCeti.Huber.weightedPolynomialsEquiv` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean` | The polynomial subring with its induced weighted topology and its ring equivalence with `MvPolynomial`; `Pair.polynomialWeighted` equips this carrier with its plus ring. |
| `TauCeti.Huber.PadicInt.isHuberRing`, `TauCeti.Huber.PadicInt.not_isTateRing` | `TauCeti/RingTheory/Huber/Padic/Basic.lean` | The non-Tate Huber ring `ℤ_p` used in `IsAlgebraicallyFiniteType_padicIntegers`. |
| `TauCeti.Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom`, `TauCeti.Huber.Pair.Hom.range_spaComap_quotientHom` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean` | For any Huber pair `S` on a commutative topological Huber ring `A` and any ideal `J`, `(S.quotientHom J).spaComap` is a closed embedding with range the valuations whose support contains `J`. Neither closedness of `J` nor sheafiness or completeness is required for these spectrum statements. |
| `TauCeti.Huber.Pair.Hom.spaComap`, `TauCeti.Huber.Pair.Hom.continuous_spaComap`, `spaComap_comp` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`; `TauCetiRoadmap/AdicSpaces/README.md`, §§3.3–3.4, 5 | Contravariant maps of spectra and the affinoid-space interpretation of pair morphisms. The perturbation target *etale-presentation-perturbation* specifies the pullback isomorphism over the coefficient ring, continuous in both directions and carrying the quotient plus ring onto the original one. |
| `TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, `presentationLimitPresheafComap` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Comap.lean` | Completion preserves the spectrum; continuous plus-preserving maps carrying open ideals to open ideals induce maps of structure presheaves when the target-ring spectrum is sheafy. The perturbation pullback is a topological-ring isomorphism, so it preserves open ideals in both directions. |
| `hI.isAdicComplete_iff` for `hI : IsAdic I` | `Mathlib/RingTheory/AdicCompletion/Topology.lean:76` | For an adic topology, ideal-adic completeness is equivalent to topological completeness and Hausdorffness. |
| Mathlib's valuative criterion for separated morphisms of schemes (the equation of `AlgebraicGeometry.IsSeparated` with the uniqueness criterion) | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:319` | Scheme separatedness is the uniqueness part of the valuative criterion together with quasi-separatedness. |
| `Huber.PairOfDefinition.flat_toCompletionLoc` | `TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Flat.lean` | In namespace `TauCeti`, flatness of completed rational localization for a complete separated strongly noetherian Tate ring, with `HasDenominatorPower` for the presentation. |
| `TauCeti.Huber.IsTopologicallyFiniteType` | `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean` | The analytic coordinate map has the finite-type condition in addition to R0's formal lifting condition. |
| `TauCeti.Huber.PairOfDefinition`, `PairOfDefinition.completion`, `completionRingOfDefinition`, `completionIdeal`, `mem_completionIdeal_iff` | `TauCeti/RingTheory/Huber/Basic.lean`; `TauCeti/RingTheory/Huber/Completion.lean` | The pair carrier and its completion construction from [AdicSpaces §0.3](../AdicSpaces/README.md#03-completion). R0 specializes the closure and generated-ideal formulas to the tensor subring determined by the input pairs; it does not introduce another general completion construction. |
| `UniformSpace.Completion.coeRingHom`, `UniformSpace.Completion.continuous_coeRingHom` | `Mathlib/Topology/Algebra/UniformRing.lean` | The elementary ring map to the Hausdorff completion and its continuity; `Pair.completedTensor.tmul` uses this map for the tensor uniformity. |
| `TopologicalSpace` complete lattice, `NonarchimedeanAddGroup`, `moduleTopology` | `Mathlib/Topology/Order.lean:195`; `Mathlib/Topology/Algebra/Nonarchimedean/Basic.lean:35`; `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:128` | `banachTensorTopology` takes the infimum of the nonarchimedean group topologies with continuous scalar action and elementary tensor map. Unlike `moduleTopology`, it constrains continuity using both factor topologies. |
| `TensorProduct.mk`, `UniformSpace.Completion.coe'` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean:372`; `Mathlib/Topology/UniformSpace/Completion.lean:308` | `BanachModule.CompletedTensor.tmul` composes the algebraic elementary tensor with the canonical completion map for `banachTensorUniformSpace`. The Tate-ring and pair-of-definition carriers are those of AdicSpaces §0.3, supplied by `TauCeti/RingTheory/Huber/Basic.lean`. |
| `TauCeti.Huber.weightedX`, `TensorProduct.lift`, `TensorProduct.lift.tmul` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:122,126` | R0.5 uses the supplied coordinates at weights `{1}` in the completed restricted-series carrier of AdicSpaces §0.5. The finite-extension Check uses the linear extension of `BanachModule.CompletedTensor.tmul`, so it tests the canonical completion map on the algebraic tensor product. |
| `UniformSpace.Completion.extension` | `Mathlib/Topology/UniformSpace/Completion.lean` | Extend a uniformly continuous real function to the completion; `CompletedTensor.productNorm` applies it to the nonarchimedean product seminorm. |
| `TauCeti.ValuationSpectrum.spaRationalFamily`, `isTopologicalBasis_spaRationalFamily`, `spaComap_preimage_mem_spaRationalFamily` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.lean` | The rational-subset carrier, basis and pullback API; the local factorisation of étale maps through open embeddings and finite étale maps (R0.17) requires the same finite family of charts to have rational images in both the source and its finite étale extension. |
| `TauCeti.Huber.PairOfDefinition.Presentation`, `locUniformSpace`, `toCompletionLoc`, `completedPlusSubring`, `isRingOfIntegralElements_completedPlusSubring`; `TauCeti.ValuationSpectrum.spaCompletedLocalizationHomeomorph`, `bijOn_preimage_spaCompletedLocalizationHomeomorph_spaRationalFamily` | `TauCeti/RingTheory/Huber/LocalizationTopology/Presentation.lean`, `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean`, `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/CompletedHomeomorph.lean`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/CompletedRationalSubset.lean` | AdicSpaces §3.1 supplies rational localisations and their plus rings, spectra, and rational-subset correspondence. `Pair.completedTensorRationalEquiv` compares their completed tensor product over a rational localisation of the base; it uses these carriers and the tensor product defined here. |
| `TauCeti.Huber.weightedMapCompletion`, `weightedMapCompletion_coe` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean` | Coefficientwise extension on completed weighted series and its value on uncompleted series; used to specify the restricted-series tensor comparison. |
| `TauCeti.Huber.weightedRestrictedSubring`, `weightedX`, `PairOfDefinition.weighted`, `Pair.quotient`, `TauCeti.Huber.Pair.quotient_plus` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/PairOfDefinition.lean`; `TauCeti/RingTheory/Huber/Pair.lean`; `TauCetiRoadmap/AdicSpaces/README.md`, §§0.4, 3.1 | Use the existing weighted carrier, topology, completion and quotient pair. `Pair.weightedRestricted` supplies its finite-weight plus ring; the tensor comparison uses the supplier's quotient plus ring. |
| `Ideal.map`, `Ideal.closure`; `TauCeti.Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom` | `Mathlib/RingTheory/Ideal/Maps.lean:43`; `Mathlib/Topology/Algebra/Ring/Ideal.lean:29`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean` | The extended kernel, its topological closure and the existing quotient-spectrum comparison; no new quotient carrier or spectrum is introduced. |
| `TauCeti.PreAdicSpace.toPresheafedSpace`; `TauCeti.TopCommRingCat.uniformSpace`, `isUniformAddGroup`; `TauCeti.CompleteSeparatedTopCommRingCat` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.lean` | The structure presheaf in AdicSpaces §§3.2–3.4 takes values in complete separated topological rings. Open the supplier's uniformity scope for `sectionRing`; its completeness and Hausdorff instances supply the inputs to continuous differentials on neighbourhoods. |
| `Ideal.Cotangent`, `Ideal.toCotangent` | `Mathlib/RingTheory/Ideal/Cotangent.lean:40,52` | The carrier `I/I²`, its additive and module structures, and its quotient map. `ContinuousKaehlerDifferential` uses this carrier for the kernel of completed multiplication; its `B`-action is restricted along the left inclusion. |
| `TensorProduct.AlgebraTensorModule.cancelBaseChange`, `LinearMap.baseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean:435,657` | Reassociate scalar extension to the stalk, then extend `ContinuousKaehlerDifferential.map` to define the full restriction map in `differentialNeighbourhoodDiagram`. |
| `Algebra.TensorProduct.lid` | `Mathlib/RingTheory/TensorProduct/Maps.lean` | The algebraic unit equivalence `A ⊗_A B ≃ B`. R0's field-unit Check compares its transported topology and uniformity with the tensor construction. |
| `Algebra.TensorProduct.rid`, `Algebra.TensorProduct.rid_tmul` | `Mathlib/RingTheory/TensorProduct/Maps.lean:274,284` | The algebraic right unit equivalence sends `b ⊗ a` to `a • b`. `Pair.uniformCompletedTensor.unitIso` extends this unit map through the tensor completion and uniformization; `unitIso_tmul` and `isHomeomorph_unitIso` specify its value and topology. |
| `PiTensorProduct.projectiveSeminormAux` | `Mathlib/Analysis/Normed/Module/PiTensorProduct/ProjectiveSeminorm.lean` | Uses sums of tensor-presentation costs. R0's nonarchimedean `productSeminorm` uses maxima, as in KL15 Definition 2.1.10; the existing construction is not duplicated. |
| `AdicCompletion.eval`, `AdicCompletion.eval_of`, `AdicCompletion.eval_surjective` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Evaluation in degree n is surjective onto M₀/IⁿM₀ and sends a lattice element to its residue class. |
| `AdicCompletion.pow_smul_top_eq_ker_eval` | `Mathlib/RingTheory/AdicCompletion/Completeness.lean` | For finitely generated I, the kernel of evaluation is Iⁿ times the completed module. With the R0 lattice comparison this identifies the completion modulo Iⁿ with M₀/IⁿM₀; no new algebraic quotient theorem is needed. |
| `KaehlerDifferential.map`, `KaehlerDifferential.mapBaseChange` | `Mathlib/RingTheory/Kaehler/Basic.lean` | Change of coefficient ring and scalar extension of algebraic differentials. Their composite with R0's `ContinuousKaehlerDifferential.fromKaehler` is the analytic chart comparison. |
| `AlgebraicGeometry.Proj.toSpecZero`, `Proj.fromOfGlobalSections`, `Proj.fromOfGlobalSections_toSpecZero` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean:151,442,514` | R0 applies these constructors to `submoduleBlowup.gradedRing`: the projection uses the coefficient map to degree zero, and the source map uses evaluation at one followed by `Scheme.ΓSpecIso.inv`. |
| `MvPowerSeries.IsRestricted.subring`, `isRestricted_monomial`; `MvPowerSeries.instNormedRingIsRestrictedSubring`, `instNormedCommRingIsRestrictedSubring`, `instNormedAlgebraIsRestrictedSubring`, `norm_coeff_mul_prod_le` | `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107,44`; `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` | The countable-variable Check uses this existing carrier and its Gauss norm and completeness instance (line 151), with variable type `ℕ`. Restrictedness means coefficient decay along the cofinite filter. The finite-dimensional polydisc carrier of AdicSpaces §2.4 and `TauCeti.ValuationSpectrum.closedPolydisc` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`) remains the supplier for finite-dimensional discs; no new series carrier is introduced. |
| `AlgebraicGeometry.Proj.basicOpenIsoSpec`, `Proj.awayι`, `Proj.awayι_toSpecZero`; `HomogeneousLocalization.Away`, `HomogeneousLocalization.Away.mk` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean:161,186,206`; `Mathlib/RingTheory/GradedAlgebra/HomogeneousLocalization.lean:599,607` | The homogeneous-localization chart, its open immersion and structure map, and its homogeneous fractions. R0 identifies that chart with the fraction subalgebra `C[F/S]`, requires the same structure-map equation and fixes each generator by `submoduleBlowup.basicOpenIsoSpec_hom_generator`; R1 uses the coordinate charts of polynomial Proj to fix the relative unit-polydisc maps. |
| `TauCeti.ValuationSpectrum.gaussPoint`, `gaussPoint_val`, `rationalSubset`, `mem_rationalSubset_iff` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean`; AdicSpaces §§2.1, 2.4 | Use the supplied Gauss point and rational loci. The squaring Checks count fibres of `Affinoid.map` over its rank-two specializations; the discrete covering Check exhibits a missing valuation. |

| R1 supplier | Exact file | Contract used |
|---|---|---|
| `KaehlerDifferential.subsingleton_of_surjective` | `Mathlib/RingTheory/Kaehler/Basic.lean:275` | A surjective structural map has zero algebraic differentials; the identity of `K` supplies `Ω[K/K] = 0`. R1.8's trivial-group Check instead concerns `continuousDifferentialFibre` at the unit of the analytified group, on the supplied `TauCeti.AdicSpace` carrier (AdicSpaces §5). |
| `CategoryTheory.Functor.grpObjObj`, `Functor.mapGrp`, `Functor.obj.ι_def`, `Functor.obj.μ_def`, `Functor.obj.η_def`; `CategoryTheory.Hom.one_def`, `Hom.mul_def`, `Hom.inv_def` | `Mathlib/CategoryTheory/Monoidal/Grp.lean:578,599,591`; `Mathlib/CategoryTheory/Monoidal/Mon.lean:842,839`; `Mathlib/CategoryTheory/Monoidal/Cartesian/Mon.lean:236,238`; `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:69` | R1.8 uses `Functor.obj.ι_def`, `Functor.obj.μ_def` and `Functor.obj.η_def` with `F = AdicSpace.analytificationLftFunctor K` for the inverse, multiplication and unit of the analytified group. Its identity, inverse and composition Checks use the supplied group structure on morphisms into that group. The functor is Part II's mixed-fibre-product analytification into locally finite-type objects over the supplied `TauCeti.AdicSpace` carrier (AdicSpaces §5); its unit and multiplication use the finite-product comparison. |
| `TauCeti.ValuationSpectrum.rationalSubset`, `mem_rationalSubset_iff`, `isIso_toPresentationLimit_top`; `TauCeti.Huber.weightedRestrictedSubring`, `mem_weightedRestrictedSubring` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/GlobalSections.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; [AdicSpaces §5.4](../AdicSpaces/README.md#54-examples) | R1.3 uses the supplied rational subsets, affinoid coefficient-to-section map and weighted-series subrings. The chart statement of *analytic-affine-space* identifies their increasing union with affine-space analytification, and its section statement identifies sections with the intersection of these subrings. Rational numerators include `1`, so they generate the unit ideal even in dimension zero. |
| `TauCeti.PreAdicSpace.isAdic_restrict`, `TauCeti.PreAdicSpace.IsOpenImmersion.isoOfRangeEq` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/OpenImmersion.lean`; AdicSpaces §5.1 | R1.2 uses the supplied open adic subspaces and their comparison by equal images. `schemePullback.isoOpenSubscheme` adds the mixed scheme projection and identifies the inverse image under it. |
| `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.IsOpenImmersion`, `IsOpenImmersion.isoOfRangeEq`; `TauCeti.Huber.Pair.quotient`; `TauCeti.ValuationSpectrum.closedPolydisc` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/OpenImmersion.lean`; `TauCeti/RingTheory/Huber/Pair.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; AdicSpaces §§2.4, 5.1, 5.3 | R1.3 uses the supplied category, open subspaces, quotient pairs and polydisc. `analytification.chartAffinoid` equips the weighted quotient ring with its complete sheafy presentation; `analytification.affineChart` identifies those charts inside the mixed fibre product. |
| `TauCeti.PreAdicSpace.toRingPresheafedSpace`, `PreAdicSpace.Hom.stalkMap`, `PreAdicSpace.Hom.residueFieldMap`, `PreAdicSpace.restrict`; `IsLocalRing.residue`; `RingHom.Finite` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Restrict.lean`; `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean:36`; `Mathlib/RingTheory/Finiteness/Defs.lean:174`; AdicSpaces §§3.4, 5.1 | R1.7 uses the existing adic spaces, local stalks, restrictions and structural section maps. The rigid-to-adic comparison identifies the ringed sites; the classical-point predicate is finiteness of the structural map into the stalk residue field. |
| `CategoryTheory.Functor.mapGrp`, `Functor.mapCommGrp`, `Hom.group`; `TauCeti.AdicSpace`, `PreAdicSpace.stalkValuation`; `TauCeti.AlgebraicGeometry.AbelianVariety.isCommMonObj` | `Mathlib/CategoryTheory/Monoidal/Grp.lean:599`; `Mathlib/CategoryTheory/Monoidal/CommGrp_.lean:199`; `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`; AdicSpaces §5.1 | R1.8 uses the supplied group objects, hom-set groups, adic-space carrier and valuations. The comparisons concern mixed analytification and its projections. The additive Check uses the polynomial presentation with primitive coordinate; `TauCeti.AdditiveGroup.groupScheme` and `schemePointsMulEquiv` in `TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Scheme.lean` supply the algebraic group and its points. |
| `TauCeti.PreAdicSpace.toRingPresheafedSpace`; `Ideal.Cotangent`, `Ideal.toCotangent`, `IsLocalRing.CotangentSpace`; `LinearMap.baseChange` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `Mathlib/RingTheory/Ideal/Cotangent.lean:40,50,297`; `Mathlib/LinearAlgebra/TensorProduct/Tower.lean:657`; AdicSpaces §5 | Use the supplied local stalks, maximal-ideal cotangent quotient, and extension of scalars. R0.15's `continuousDifferentialFibre` tensors the existing continuous stalk with its residue field. |
| Schemes over the field affinoid, the field affinoid `Spa(K, K°)` itself, and the affine scheme of a `K`-algebra (targets of this roadmap) | this README, R0.18 (the field affinoid) and R1.3 | `K`-schemes are schemes over `Spec K`, taken in Mathlib's `CategoryTheory.Over`, and `Spa(K, K°)` is the explicit `AdicSpace.Affinoid` with ring `K` and plus ring `K°`. Rigid and adic analytification share one affine scheme `Spec R` of a `K`-algebra `R`, built from Mathlib’s `Spec.algebraMap K R`, so that their objects and morphisms agree definitionally. |
| `WeierstrassCurve.Affine.invariantDifferential` | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean` | Tau Ceti supplies the algebraic differential `dx/(2y + a₁x + a₃)` in the function-field Kähler module. R1 compares its analytification with the invariant analytic differential. |
| `TauCeti.Huber.Pair.powerBounded`, `TauCeti.Huber.isPowerBounded_iff_norm_le_one` | `TauCeti/RingTheory/Huber/Pair.lean`; `TauCeti/RingTheory/Huber/Normed.lean`; AdicSpaces §§0.1, 2.1 | The supplied pair has the closed unit ball as its plus ring over a normed field. `chartIndex_test_nonzero_tuple` applies this criterion to the scaled coordinate `ϖ^k ϖ⁻¹`. |
| `TauCeti.Huber.Pair.Hom`, `TauCeti.Huber.Pair.powerBounded`; `TauCeti.ValuationSpectrum.evalAtHom`, `evalAtHom_mem_powerBoundedSubring` | `TauCeti/RingTheory/Huber/Pair.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; [AdicSpaces §2.4](../AdicSpaces/README.md#24-quotients-and-classical-affinoids) | Continuous, plus-preserving pair maps and evaluation on the unit polydisc. The chart-membership Check uses these pair carriers for the completed weighted charts, with the polynomial evaluation equation fixing both constants and the coordinate. |
| `TauCeti.ValuationSpectrum.closedPolydisc`, `gaussPoint`, `supp_gaussPoint`, `gaussPoint_inj`; `TauCeti.Huber.weightedPolynomialHom`; `TauCeti.ValuationSpectrum.residueFieldValuation` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/ResidueField/Basic.lean`; AdicSpaces §§2.4, 3.4, 5.1 | R1.2 uses the supplied disc points, Gauss valuations, polynomial inclusion and residue valuation. `analytification.unitDisc` only adds the complete sheafy affinoid presentation; `gauss_rankTwo_generic` identifies the Gauss point and its rank-two refinement under the mixed scheme projection. |
| `TauCeti.Huber.Pair.powerBounded`; `TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, `spaCompletionHomeomorph_apply` | `TauCeti/RingTheory/Huber/Pair.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.lean`; AdicSpaces §§2.1, 2.4 | R0 constructs the full power-bounded pair in `ofRigidAffinoid`; R1.7 uses it and the supplied completion comparison. Its disc Checks identify points by restriction along `UniformSpace.Completion.coeRingHom`, using the supplied `closedPolydisc` and `gaussPoint` carriers. |
| `TauCeti.Huber.PairOfDefinition`, `PairOfDefinition.weighted`, `PairOfDefinition.completion`, `PairOfDefinition.completionIdeal`; `TauCeti.Huber.IsStrictlyTopologicallyFiniteType`; `TauCeti.ValuationSpectrum.residueFieldValuation`, `TauCeti.ValuationSpectrum.continuous_algebraMap_residueFieldValuation`; `NormedField.exists_norm_lt_one` | `TauCeti/RingTheory/Huber/Basic.lean`; `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/PairOfDefinition.lean`; `TauCeti/RingTheory/Huber/Completion.lean`; `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/ResidueField/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/ResidueField/Valued.lean`; `Mathlib/Analysis/Normed/Field/Basic.lean:238`; AdicSpaces §§0.2–0.4 | `Affinoid.completedResidue` applies the supplied completion construction to the residue valuation ring and the ideal generated by the source ideal of definition. `fieldAffinoid` specifies `(K°, ϖK°)`; `ofRigidAffinoid` maps the supplied completed series ring of definition through its chosen strict presentation and uses the principal scalar ideal. `analytification.unitDisc` uses `weighted` at unit weights directly; `schemePullback.chartAffinoid` and `analytification.chartAffinoid` map the completed weighted defining subring and ideal through the specified quotient map. |
| `Subring.map`, `Subring.topologicalClosure`, `Ideal.map`, `Ideal.Quotient.mk` | `Mathlib/Algebra/Ring/Subring/Basic.lean:193`; `Mathlib/Topology/Algebra/Ring/Basic.lean:497`; `Mathlib/RingTheory/Ideal/Maps.lean:43`; `Mathlib/RingTheory/Ideal/Quotient/Defs.lean:83` | The chart bases use the quotient image subring and the ideal generated by the image of the completed weighted defining ideal. `ValuationRing.affinoidField` uses the closure of the refining valuation ring and a principal pseudo-uniformizer ideal in that closure. |
| `TauCeti.PreAdicSpace.Hom.residueFieldMap`; `IsLocalRing.ResidueField.map`; `RingHom.Finite`; `RingEquiv.ofBijective`; `topologicalKrullDim` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`; `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean:95`; `Mathlib/RingTheory/Finiteness/Defs.lean:174`; `Mathlib/Algebra/Ring/Equiv.lean:446`; `Mathlib/Topology/KrullDimension.lean:37`; AdicSpaces §5.1 | The R1.2 point comparison uses the actual structural residue map and the residue map induced by `snd`, finite module extensions, and the supplied topological dimension. |
| `TauCeti.Huber.Pair.quotient`, `TauCeti.Huber.Pair.quotient_plus` | `TauCeti/RingTheory/Huber/Pair.lean` | The quotient pair and its plus ring as the integral closure of the image. R1's `chartPair` only applies this constructor to the specified polynomial relation ideal. |
| `TauCeti.Huber.weightMul` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean` | Additive subgroup generated by products of weights with coefficients; R1 uses it for the coefficient condition defining the integral series. |
| `PresheafOfModulesOfCommRing.Monoidal.tensorObj`, `PresheafOfModules.sheafification` | `Mathlib/Algebra/Category/ModuleCat/Presheaf/Monoidal.lean`, `Mathlib/Algebra/Category/ModuleCat/Presheaf/Sheafification.lean` | Sectionwise tensors and module sheafification; `AdicSpace.tensorModules` composes these on locally ringed spaces. |
| `TauCeti.SheafOfModules.monoidalClosed` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean` | Tau Ceti supplies the closed monoidal structure on `SheafOfModules (TauCeti.SheafOfModules.ringCatSheaf R)` for a commutative-ring sheaf `R` on a small site `(C, J)`, assuming `J.HasSheafCompose (forget₂ CommRingCat RingCat)`, `HasWeakSheafify J AddCommGrpCat` and `J.WEqualsLocallyBijective AddCommGrpCat`. |
| `SheafOfModules.Submodule`, `SheafOfModules.Submodule.ι`, `AlgebraicGeometry.tilde`, `AlgebraicGeometry.tilde.map`, `AlgebraicGeometry.tildeSelf` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean`, `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | Ideal inclusions and algebraic associated module sheaves in analytification. |
| `TauCeti.SheafOfModules.monoidalCategory`, `SheafOfModules.tensorUnderlyingIso` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Monoidal.lean` | The monoidal tensor of module sheaves and its canonical identification with the sheafification used by `tensorModules`. |
| `TauCeti.SheafOfModules.pullbackOplaxMonoidal`, `TauCeti.SheafOfModules.pullback_δ` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Pushforward.lean` | The canonical tensor comparison of module pullback, constructed as the adjoint of the pushforward tensor map; `analytification.modules_tensorIso` asserts invertibility of this supplied map. |
| `SheafOfModules.pullbackPushforwardAdjunction` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean:60` | Its unit sends an algebraic section to its pullback section and fixes the germ formula for `analytification.stalkComparison`. |
| `SheafOfModules.pullbackComp`, `SheafOfModules.pullbackObjUnitToUnit` and Mathlib's unit map from the structure sheaf to the pushforward of the unit module | `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean` | Composition and the canonical structure-sheaf maps; the analytification statements specialize these maps. |
| `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.toRingPresheafedSpaceHom` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`, `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`; [Foundations of adic spaces](../AdicSpaces/README.md), §5 | Adic carriers and their ringed morphisms underlying R1 module pullback and `AdicSpace.rigidToAdic.analytification_iso`. The comparison uses these supplied section maps and the existing `snd`, `rho`, `sections` and `RigidSpace.analytification.toScheme`. |
| `SheafOfModules`, `PresheafOfModules.map` | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean`, `Mathlib/Algebra/Category/ModuleCat/Presheaf.lean` | The actual module sheaf and its restrictions in R1's vector-bundle identity principle. |
| `constructibleTopology`; `Topology.IsConstructible` | Mathlib `Topology/Spectral/ConstructibleTopology.lean`; `Topology/Constructible.lean` | The constructible topology and constructible subsets of the valuation spectrum and its `Spa` subspace; used directly in R1 classical density. |
| `CommAlgCat.FiniteEtale`, `CommAlgCat.FiniteEtale.of`, `CommAlgCat.FiniteEtale.ofHom` | `Mathlib/RingTheory/Etale/Finite.lean` | The category of finite étale algebras and its algebra morphisms; `Etale.finiteEtaleEquiv` compares it with this file’s finite étale adic spaces, and `Etale.finiteEtaleFunctor` is the inverse functor. |
| `CategoryTheory.ObjectProperty.FullSubcategory`, `AlgebraicGeometry.LocallyOfFiniteType` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`, `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean` | The full category of schemes locally of finite type over `Spec K`. |
| `CategoryTheory.Limits.PreservesPullback.iso` | `Mathlib/CategoryTheory/Limits/Preserves/Shapes/Pullbacks.lean` | The canonical pullback comparison isomorphism once preservation by rigid analytification is established. |
| `TauCeti.Huber.IsWeightFamily.of_exists_isUnit` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean` | A unit in each weight set suffices. Apply to `ϖ^k ∈ {ϖ}^k`; the open-ideal case remains a distinct target. |
| `TauCeti.Huber.restrictedMvPowerSeriesCompletionFinZeroEquiv` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean` | The completed zero-variable Tate algebra is isomorphic to `Completion A`, hence to `A` for a complete Hausdorff base. |

`instIsModuleTopology` in `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:146`
supplies `IsModuleTopology A C` for `moduleTopology A C`; R0's finite-algebra
construction uses this instance directly.
`AdicCompletion.isAdicComplete` in `Mathlib/RingTheory/AdicCompletion/Completeness.lean`
supplies algebraic adic completeness for a finitely generated ideal. R0's
`isAdicComplete_completion_of_isAdic` additionally identifies the uniform completion
with this completion and uses the extended ideal in the completed ring.

`smoothingSeminorm`, `tendsto_smoothingFun_of_map_one_le_one`,
`isPowMul_smoothingFun` and `smoothingFun_le_self` in
`Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean` supply the smoothing
construction and its generic API. The abbreviation `spectralSeminorm d` fixes a
Tate norm datum; the additional targets identify its topology, kernel and behaviour
under changes of that datum.

`TauCeti.PreAdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`
and `TauCeti.AdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`
supply the carriers and categories for R0's geometric morphisms. The latter is the full
subcategory defined by `TauCeti.PreAdicSpace.isAdic`; it is not a new carrier of R0.
`TauCeti.Huber.IsSheafyRing` and `TauCeti.Huber.IsStablySheafyRing` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean` supply the
sheafiness predicates. R0 adds the noetherian-ring-of-definition case;
`TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/StronglyNoetherian.lean`
already supplies the complete strongly noetherian Tate case.

`TauCeti.Huber.IsBounded.image` in `TauCeti/RingTheory/Huber/Bounded.lean` requires
continuity at zero and images of zero-neighbourhoods to be zero-neighbourhoods. It does
not supply boundedness for an arbitrary continuous ring map. R0's adic-map theorem
uses adicness instead. `TauCeti.Huber.exists_pairOfDefinition_le_le` in
`TauCeti/RingTheory/Huber/RingOfDefinition.lean` places a bounded subring inside a ring
of definition contained in a prescribed open subring; R0 applies it to that bounded image.

### Foundations owned here

| Targets | Owning sections | Interfaces |
|---|---|---|
| *locally-spectral-space* | R0.0 | `IsLocallySpectralSpace`, `IsLocallySpectralMap`, their spectral comparisons and local API |
| *adic-ring*, *adic-completion-noetherian* | R0.1a–R0.1b | `IsAdicRing`, chosen ideals, Huber instance, noetherian completion criteria |
| Constructible and pro-constructible topology, generalizing quotients | R0.19.1–R0.19.4 | profiniteness, closure by specializations and generalizing quotient criterion |
| Spectral limits, Tate-pair colimit spectra and finite-stage opens | R0.19.5–R0.19.8 | spectral projections and detection, completed colimit spectra and descent of opens |
| Generic Pro categories and qcqs topoi | R0.19.9–R0.19.10 | double-limit Hom formula, finite-T₀ spectral equivalence, object and morphism qcqs API |
| Adic tilde-limits | R0.20.1–R0.20.2 | `AdicSpace.IsTildeLimit`, affinoid/completed criterion and base change |

### From Mathlib and Tau Ceti

Schemes, algebraic differentials, adic completion, finite modules, flatness, spectral spaces,
nonarchimedean fields and tensor products use the library APIs named in the targets.
Tau Ceti supplies Huber pairs and pairs of definition, weighted restricted power series,
rational localization, valuation spectra, the category `TauCeti.AdicSpace`, and sheafiness
for strongly noetherian and stably uniform Tate rings. The tables above specify the additional
contracts; a library declaration is applied directly whenever it already gives the assertion.

R0.19.9 uses the definitional carrier `(Ind Cᵒᵖ)ᵒᵖ`. The instance
`CategoryTheory.Limits.has_cofiltered_limits_op_of_has_filtered_colimits` in
`Mathlib/CategoryTheory/Limits/Shapes/Opposites/Filtered.lean` gives its cofiltered limits
from the filtered-colimit instance of `Ind Cᵒᵖ`. `CategoryTheory.Ind.lim` and the
filtered-colimit and colimit instances in `Mathlib/CategoryTheory/Limits/Indization/Category.lean`,
together with `CategoryTheory.Limits.hasFiniteLimits_opposite` in
`Mathlib/CategoryTheory/Limits/Opposites.lean`, supply the corresponding pro-category limits.

### From TauCetiRoadmap.AdicSpaces

`TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.IsOpenImmersion` and
`TauCeti.Huber.Pair.quotient` supply the adic carriers, open immersions and
quotient pairs used in AdicSpaces §5.1. AdicSpaces §§5.1–5.2 specify closed immersions,
topological finite type of complete pairs and morphisms locally of finite type; Part II states
them as `AdicSpace.IsClosedImmersion`, `AdicSpace.IsTopologicallyFiniteTypePair` and
`AdicSpace.LocallyOfFiniteType` on its `AdicSpace.Affinoid`, `AdicSpace.Chart` and
`AdicSpace.HomChart` carriers.

### From TauCetiRoadmap.ModularCurves

Layer 2B supplies quotients of elliptic curves by finite subgroup schemes, used by R1
(*analytification-finite-quotient*); layer 0E is not used.

### From the analytic suppliers

[RigidAnalyticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/88df2d0b5104d7c8a159cf0def4677a8c97c8a70/TauCetiRoadmap/RigidAnalyticGeometry/README.md),
[PadicFunctionalAnalysis](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f255de3d9ad6c27bc603f65e604108ee024c4400/TauCetiRoadmap/PadicFunctionalAnalysis/README.md) and
[RestrictedPowerSeries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md)
are external supplier specifications for the section-level contracts below.
RigidAnalyticGeometry Convention 3 uses the proposition `IsAffinoidAlgebra K A` on a bare
`K`-algebra; §1.1 constructs its presentation-independent topology. R0.9 transports this
interface to the complete topological algebras used here. The table cites README contracts;
it specifies declaration names only where the supplier explicitly retains them.

| Consumed interface | Supplier section and scope |
|---|---|
| *tate-ring-norm* | PadicFunctionalAnalysis §0.4; `tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow` |
| *banach-countable-type-orthogonal-basis* | PadicFunctionalAnalysis §§2.2, 2.4 |
| *tate-algebra-gauss-norm-attained* | RestrictedPowerSeries §2.4; RigidAnalyticGeometry §0.1 consumes it |
| *affinoid-noether-normalisation* | RigidAnalyticGeometry §1.2; §1.1, `isClosedEmbedding_of_finite_injective` |
| *affinoid-residue-fields-finite* | RigidAnalyticGeometry §1.2 |
| *affinoid-jacobson* | RigidAnalyticGeometry §1.1 |
| *tate-algebra-maximal-ideals-polynomial* | RestrictedPowerSeries §5.2, transported by §6.2; RigidAnalyticGeometry §0.1 consumes it; Part II identifies triangular generators |
| *affinoid-supremum-seminorm* | RigidAnalyticGeometry §§2.1–2.2; powers of positive exponent include the zero algebra |
| *affinoid-maximum-modulus* | RigidAnalyticGeometry §2.2, for nonzero affinoids |
| *affinoid-power-bounded-iff-sup* | RigidAnalyticGeometry §2.2 |
| *reduced-affinoid-supremum-norm* | RigidAnalyticGeometry §§2.1–2.2 |
| *affinoid-homomorphism-continuous* | RigidAnalyticGeometry §1.1 |
| *affinoid-power-bounded-integral* | RigidAnalyticGeometry §2.3, including nonreduced affinoids |
| *affinoid-reduction-finite* | RigidAnalyticGeometry §2.3 |
| *reduced-reduction-ring-of-definition* | RigidAnalyticGeometry §2.3, “Reduced quotient of a ring of definition” |
| *affinoid-subdomain* | RigidAnalyticGeometry §1.4 and Layers 3–4 |
| *affinoid-subdomain-flat* | RigidAnalyticGeometry Layers 3–4, including faithful flatness of finite covers |
| *gerritzen-grauert* | RigidAnalyticGeometry Layers 3–4, finite rational decomposition and ambient-cover refinement |
| *affinoid-covering-tate-acyclicity* | RigidAnalyticGeometry Layer 5, for every algebraic module |
| *rigid-local-ring-completion* | RigidAnalyticGeometry Layers 3–4, local rings, finite-order quotients and completions |
| *rigid-analytic-space* | RigidAnalyticGeometry §§6.1–6.3; closed immersions in Layers 3–4 |
| *rigid-analytification* | RigidAnalyticGeometry §8.1 |
| *analytification-connected* | RigidAnalyticGeometry §8.1 |
| *rigid-adic-comparison-functor* | RigidAnalyticGeometry §§8.2–8.3 for the functor, products and section comparison; Part II supplies ringed-site finality |
| *rigid-adic-quasi-separated-equivalence* | RigidAnalyticGeometry §8.3, full faithfulness, local image, quasi-separated equivalence and affinoid detection |
| *rigid-adic-topos-equivalence* | RigidAnalyticGeometry §8.3, the ringed-topos comparison |
| *proper-separated-comparisons* | RigidAnalyticGeometry §6.3 supplies the classical predicates; Part II supplies their adic comparisons |
| *affinoid-domain-equidimensional* | RigidAnalyticGeometry §1.2, `height_eq_ringKrullDim_of_isDomain` |
| *rigid-identity-principle* | RigidAnalyticGeometry Layers 3–4 (affinoid domains) and §7.3 (connected normal spaces and finite locally free sheaves) |
| *max-rational-covering-refinement* | RigidAnalyticGeometry Layer 5 supplies covering refinement; Part II specifies its standard-cover form in R1.9 |
| *rigid-gamma-spec* | RigidAnalyticGeometry §8.1, affine analytification universal property |
| *classical-points-constructible-density* | RigidAnalyticGeometry §8.2, rational traces, finite covers and constructible closure |
| *rigid-analytification-normal-reduced* | RigidAnalyticGeometry §8.1, stalk and global comparisons |
| *rigid-analytification-connected* | RigidAnalyticGeometry §8.1, connectedness and reduced irreducible components |

These supplied assertions are used through the carrier bridges below; they are not independent
proof targets of Part II. Part II owns the additional finality and morphism comparisons,
its explicit standard-cover refinement, and the general Tate-ring targets outside the suppliers'
field-affinoid scope.

**Local restatements.** `Suggested.lean` restates no supplied declaration. The README keeps the
following local names for supplied objects, read through the carrier bridge of R0.9, so that the
targets using them keep their notation; these are carrier bridges to the named supplier contracts, without a second local owner.

- `Huber.TateNormDatum A` and `Huber.tateNorm d` (*tate-ring-norm*): PadicFunctionalAnalysis
  §0.4, the gauge at `a = r⁻¹`; used by *spectral-seminorm*, *spectral-topology* and
  *completed-tensor-banach-module*. Its functoriality `tateNorm_map_le` is stated here.
- `RigidSpace K` (`Rig_K`), `RigidSpace.Sp`, `RigidSpace.IsAdmissibleOpen`,
  `RigidSpace.IsAdmissibleCover`, `RigidSpace.hasPullbacks`, `RigidSpace.IsClosedImmersion`,
  `RigidSpace.IsSeparated`, `RigidSpace.IsQuasiSeparated` and `RigidSpace.IsProper`
  (*rigid-analytic-space*): RigidAnalyticGeometry §§6.1–6.3 and Layers 3–4.
- `RigidSpace.analytification` (`X^an`, with `i_X` its `toScheme`) and
  `RigidSpace.analytificationFunctor` (*rigid-analytification*): RigidAnalyticGeometry §8.1.
- `AdicSpace.rigidToAdic` (`r_K`), `rigidToAdic_Sp` and `rigidToAdic.classicalPointsEquiv`
  (*rigid-adic-comparison-functor*): RigidAnalyticGeometry §§8.2–8.3.

## How to read the build

R0 develops the ring-level inputs, completed tensor products and adic morphisms;
R1 develops analytification and algebraic correspondences on the rigid spaces of
RigidAnalyticGeometry. R0 proves the ring-level completion, finite-module and Čech estimates used by
its
noetherian-ring-of-definition sheafiness theorem. F0 in Part III applies these
results to formal schemes.
A target's `*Needs:*` clause names its prerequisites. Within a layer the subsections follow
the mathematics; supporting results shared by several targets may occur in that layer's
last subsections.

`Suggested.lean` carries the definitions that are a few lines over Tau Ceti's carriers (noetherian
type, Huber's standing class, adic homomorphisms, affinoid charts, the morphism classes,
the polynomial inclusion into Tau Ceti's Tate algebras) and the headline theorems about them.
The completed tensor product, the spectral seminorm and uniformization, Banach-module tensor
products, continuous differentials, the analytification functor and analytic groups are README
targets, specified in the text below. The Lean section headers name the labels each block carries:

| Subsection | Lean section | Declarations and Checks |
|---|---|---|
| R0.0 | locally spectral spaces and maps | `IsLocallySpectralSpace`, `IsLocallySpectralMap`, their spectral comparisons and generic Checks. |
| R0.1a–R0.1b | adic rings and noetherian completions | `IsAdicRing`, its chosen ideal, Huber instance and completion; `isNoetherianRing_of_isAdicComplete`; p-adic, discrete, field and nonnoetherian Checks. |
| R0.19 | constructible topology and spectral closure | `WithConstructibleTopology.t2Space_totallyDisconnectedSpace`, closure and generalizing-subset formulas, `isQuotientMap_of_generalizingMap`; the Sierpiński and finite-residue Checks. Generic spectral-limit, Pro and topos interfaces are README targets. |
| R0.20 | adic tilde-limits | `AdicSpace.IsTildeLimit`, `.affinoid`, `.baseChange`; constant and noninjective-cone Checks. |
| R0.1–R0.2 | rings of noetherian type and sheafiness | `Huber.IsNoetherianType` with its constructors, its completion, ascent along topological finite type, closedness of ideals and stable sheafiness; `PairOfDefinition.isSheafyRing`; the discrete-polynomial, `ℂ_p` and indiscrete-topology Checks. |
| R0.1 | Huber's standing class | `Huber.IsHuberStandard`, `IsHuberStandard.isNoetherianType`; the discrete-ring and `ℚ_p` Checks. |
| R0.1 | adic homomorphisms | `Huber.IsAdicHom` and its basic API, `IsTopologicallyFiniteType.isAdicHom`, the analytic-point characterisation; the Checks `ℤ_p → ℚ_p` (adic) and `ℤ → ℤ_p` (continuous, not adic). |
| R0.13 | finite morphisms of Huber pairs | `Huber.Pair.Hom.IsFinite` and the enlarged-plus-ring Check. |
| R0.9 | the polynomial inclusion into Tate algebras | `TateAlgebra.ofMvPolynomial`. |
| R0.7 | valuations on tensor products | `ValuationSpectrum.exists_amalgamation`. |
| R0.6, R0.16 | affinoid-level cores | `LocallyOfPlusWeaklyFiniteType_affinoid`; the lifting tests `Unramified_affinoid`, `Smooth_affinoid`, `Etale_affinoid` with the identity, square-zero quotient and disc Checks. |
| R0.6 | charts and finiteness classes | `AdicSpace.Affinoid`, `Affinoid.ofSheafyCompletion` (the completion adapter used in R1.2), `Chart`, `HomChart`, the space predicates (locally noetherian, locally Huber-standard, analytic, stably sheafy charts) and morphism predicates (adic, weak, plus weak and topological finite type, finite presentation), and their comparison theorems. |
| R0.7–R0.8 | fibre products, closed immersions and the diagonal | `hasPullback_of_finiteType`, `exists_pullback_point`, the base-change theorems, `IsClosedImmersion`, `IsLocallyClosedImmersion`, `diagonal_locallyClosed`. |
| R0.10, R0.12 | separated, universally closed, partially proper and proper morphisms | the four predicates, the properness comparison, the diagonal criterion, composition and base change of proper maps, properness of closed immersions. |
| R0.11 | valuation rings and the valuative criteria | `AdicSpace.ValuationRing` with its topology and centres, spectrality, and the three valuative criteria. |
| R0.13–R0.14 | finite and quasi-finite morphisms | `IsFinite`, `LocallyQuasiFinite` and their criteria. |
| R0.16–R0.17 | flat, unramified, smooth and étale morphisms | `Flat`, `Unramified`, `Smooth`, `Etale` and the theorems of the package, the ring-level part of *etale-standing-class-control*, and the disc Checks (`T ↦ T²`, `T ↦ ϖT`, `T ↦ T^p`, the closed and the open disc). |
| R1.1 | plus rings of affinoid algebras | `Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType`. |

In the text, R0's field and affinoid carriers, differential stalks and cotangent fibres precede
its geometric targets and Checks. In particular, the toric-chart target *smooth-toric-chart*
uses the field affinoid `Spa(K, K°)` of R0.18, and the relative dimension of a smooth morphism
uses the fibres of continuous differentials at points (R0.15). R1 begins with the
affinoid-chart form of local finite type over a noetherian-type target and uses these R0
constructions. The three projective-line Checks of R0.10–R0.12 (`ℙ¹ → Spa(K, K°)` is proper; the
disc inside `ℙ¹` is not universally specializing; proper implies partially proper on `ℙ¹`)
belong to R1's Examples because they use the analytification of projective space.

Ring-level properties (`Huber.IsNoetherianType`, `Huber.IsHuberStandard`, `Huber.IsAdicHom`)
are Prop-valued classes; space- and morphism-level properties are definitions applied to explicit
hypotheses, and no global instances of them are registered. Ring, module, topology and category
structures remain data instances. Properties proved by the imported libraries, including
completeness of their completion carriers, use those library proofs.

The local geometric predicates `AdicSpace.IsLocallyNoetherian`, `IsLocallyHuberStandard`, `IsAdic`,
`LocallyOfWeaklyFiniteType`, `LocallyOfPlusWeaklyFiniteType`, `Flat`,
`IsClosedImmersion`, `IsSeparated`, `IsPartiallyProper` and `IsProper` use actual
adic spaces. `HomChart` records the source and target charts, the morphism between them, the
morphism of Huber pairs it induces on global sections (`Affinoid.IsInducedBy`) and the
commuting chart square. Partial properness uses universal specialization
under adic base change from spaces with stably sheafy charts; properness uses quasi-compactness
and universal closedness
(Huber96, Definitions 1.3.2–1.3.3, pp. 52–53; Proposition 1.3.4).

**Checks for the geometric predicates.**

- Locally noetherian: the empty space, strongly noetherian Tate affinoids and discrete
  affinoids (every discrete ring has its prime subring as a noetherian ring of definition).
- Adic: identities and open immersions are adic; a chart map that fails the
  ideal-of-definition condition is excluded.
- Locally of weakly finite type, and locally of plus weakly finite type: identities, open
  immersions and the disc projection.
- Flat: the finite flat squaring map, the nonflat origin inclusion and agreement with
  coefficient-ring flatness.
- Closed immersion: identities, empty sources and quotient affinoids.
- Separated: the disc, the nonseparated disc with doubled origin and the defining diagonal
  condition.
- Partially proper: the identity and the contrasting boundary behaviour of closed and open discs.
- Proper: identities, empty sources and closed affinoid immersions.

The morphism of affinoid adic spaces induced by a morphism of Huber pairs (an R0 target, suggested
name `Affinoid.map`; the Lean records it through `Affinoid.IsInducedBy`) is characterized on
valuations by
`spaComap` and on global functions by the continuous homomorphism of Huber pairs.
`IsTopologicallyFiniteTypePair` requires a finite weighted restricted-series presentation
and the integral closure of its generated plus ring. `LocallyOfFiniteType` and
`LocallyOfFinitePresentation` apply this condition on morphism charts; finite presentation
asks the witness target chart to be in Huber's standing class and adds algebraic finite
presentation on discrete target charts. `Unramified`, `Smooth` and
`Etale` combine those finiteness conditions with the square-zero lifting predicates of
AdicSpacesPartII on a morphism chart at each point (Huber96, Definitions 1.2.1, 1.6.5 and 1.7.1).

**Checks for the affine maps and finiteness predicates.**

- The identity pair map gives the identity space map.
- Composition of pair maps reverses the order of space maps.
- Pullback on global functions is the specified coefficient homomorphism.
- An identity has a zero-variable presentation.
- A finite continuous homomorphism with its integral plus ring gives a finite-type pair map.
- The disc projection has its standard restricted-series presentation.
- The identity of a locally Huber-standard space is locally of finite type, locally of finite
  presentation, unramified, smooth and étale.
- The disc over `Spa(K, K°)` is finitely presented and smooth; the positive-dimensional
  projection is neither unramified nor étale.
- Every open immersion into a locally Huber-standard space is locally of finite type, locally of
  finite presentation, unramified, smooth and étale.

The completed tensor product of affinoids is their fibre product, by *affinoid-fibre-product*; its
comparison preserves both structural homomorphisms and the integral plus ring (Huber96,
Proposition 1.2.2). An étale affinoid map over a base in Huber's standing class has a global
standard presentation, with a unit Jacobian and the integral plus ring of that same
presentation (`Etale.exists_standardPresentation`), and conversely every such presentation is
étale; a smooth map factors locally as an étale map to a relative polydisc. Smoothness and
étaleness of a map between smooth affinoids are tested by split injectivity, respectively
bijectivity, of the continuous differential map
(Huber96, Proposition 1.6.9, Corollary 1.6.10 and Proposition 1.7.1).

## Layer R0: morphisms and admissible affinoid products

R0 uses the adic-space foundations of AdicSpaces and the ring and module contracts in R0.1–R0.3.

### R0.0 Locally spectral spaces and locally spectral maps

This section supplies the locally spectral space and map predicates used by the morphism theory.
R0.19 develops their constructible topology, pro-constructible subsets and inverse limits.

**Locally spectral spaces and locally spectral maps.** (*locally-spectral-space*) A spectral space
is a quasicompact topological space with a basis of quasicompact open subsets stable under finite
intersection in which every irreducible closed subset has a unique generic point; Mathlib's
`SpectralSpace` (T0, compact, quasi-sober, quasi-separated and prespectral) is exactly this
predicate, and `IsSpectralMap` is stated for arbitrary topological spaces, so the absolute
spectral-map notion is available and only the locally spectral notion and the relative map condition
are added. A locally spectral space is a space admitting an open cover by spectral subspaces ([ECD]
Definition 2.1, p. 10). A map `f : X → Y` of spectral spaces is spectral if it is continuous and the
preimage of every quasicompact open is quasicompact open; a continuous map of locally spectral
spaces is locally spectral if for every spectral open `U` of `X` mapping into a spectral open `V` of
`Y` the restriction `U → V` is spectral, which is what [ECD] Definition 2.1 calls a spectral map of
locally spectral spaces. The relative definition quantifies over all pairs `(U, V)` of spectral
opens, not over a chosen cover, so a formulation through a single cover is proved independent of the
cover. It is a local condition and differs from Mathlib's global `IsSpectralMap` (preimages of
quasicompact opens are quasicompact), which is kept unchanged. The inclusion of an open subset `U`
of a spectral space is always locally spectral; its domain need not itself be spectral, and it is an
absolute spectral map exactly when `U` is quasicompact (`Subtype.val : U → X` is `IsSpectralMap`
exactly when `U` is quasicompact: Mathlib `IsRetrocompact_iff_isSpectralMap_subtypeVal` with
`QuasiSeparatedSpace.isRetrocompact_iff_isCompact`, not restated); so a non-quasicompact open
inclusion is locally spectral and not an absolute spectral map. Define `IsLocallySpectralSpace` as
the predicate that a topological space admits an open cover by subspaces that are spectral, and
`IsLocallySpectralMap` as the predicate that a continuous map is spectral in the relative sense of
[ECD] 2.1: for all open `U ⊆ X` and `V ⊆ Y` that are spectral with `f(U) ⊆ V`, the restriction
`U → V` is `IsSpectralMap`. Prove `spectralSpace_iff_isLocallySpectralSpace` (a space is spectral
iff it is locally spectral, quasicompact and quasiseparated, [KL15] §8.1, text after Definition
8.1.1, p. 157; in particular every spectral space is locally spectral); that a locally spectral
space has a basis of quasicompact opens and is sober and locally quasiseparated (the suggested Lean
form states the
basis, quasi-sobriety and T0, which together are sobriety, and local quasiseparatedness is the
statement that each member of the spectral cover is quasiseparated; the basis, quasi-sobriety and T0
clauses are assembled from Mathlib's `PrespectralSpace.of_isOpenCover`, `quasiSober_of_open_cover`
and `T0Space.of_open_cover` applied to the spectral cover); that an open subspace of a locally
spectral space is locally spectral (Mathlib's `Topology.IsOpenEmbedding.spectralSpace` needs a
compact ambient space and is applied to the quasicompact opens of each member of the spectral
cover); that it suffices to check the relative condition on the members of one cover of the source
by spectral opens mapping into spectral opens of the target;
`isLocallySpectralMap_iff_isSpectralMap` (for a map of spectral spaces the relative notion agrees
with Mathlib's `IsSpectralMap`); and that composites of locally spectral maps of locally spectral
spaces are locally spectral ([ECD] §2, Def. 2.1, p. 10; [ECD] §2, Def. 2.1, second paragraph, p. 10,
the relative condition). *Needs:* Mathlib `SpectralSpace`, `IsSpectralMap`, `Topology.IsOpenEmbedding.spectralSpace`,
`QuasiSeparatedSpace`, `PrespectralSpace.of_isOpenCover`, `quasiSober_of_open_cover`,
`T0Space.of_open_cover`, `IsRetrocompact_iff_isSpectralMap_subtypeVal`,
`QuasiSeparatedSpace.isRetrocompact_iff_isCompact`; Tau Ceti
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

**Checks.**

- `s0_1_qcqs_affinoid_is_spectral` — `Spa(A, A⁺)` of a Huber pair with a pair of definition is spectral
  (Tau Ceti's `spectralSpace_spa_of_pairOfDefinition`), hence locally spectral; a definition that
  does not accept it is wrong.
- `s0_1_disjoint_union_of_spectral_is_locally_spectral_not_spectral` (non-example) — an infinite disjoint
  union of nonempty spectral spaces is locally spectral and not quasicompact, so it is locally
  spectral but not spectral: the two predicates must not coincide.
- `s0_1_empty_and_point` (degenerate cases) — the empty space and the one-point space are spectral, hence
  locally spectral; the empty cover witnesses the predicate on the empty space, and every map out of
  the empty space is spectral in both senses.
- `s0_1_composite_needs_locally_spectral_middle` — let `X` be the one-point compactification of
  discrete `ℕ`, send its extra point to `0` and `n` to `1/(n+1)` in `ℝ`, and map `ℝ` to the
  Sierpiński space by positivity. Both maps are locally spectral, vacuously, because `ℝ` has no
  nonempty spectral open. Their composite `x ↦ (x ≠ ∞)` is a continuous map of spectral spaces that
  is not locally spectral: the open singleton of the true point has inverse image `ℕ`, which is not
  compact in `X`. So composition needs a locally spectral middle space.

- `s0_1_locally_spectral_agreement` — on spectral source and target the relative predicate equals
  Mathlib's absolute spectral-map predicate.
- `s0_1_locally_spectral_noncompact_projection` — the projection `ℕ × ℕ → ℕ` of discrete spaces is
  locally spectral but not an absolute spectral map: a singleton has a noncompact inverse image.
- `s0_1_one_point_compactification_inclusion` — the inclusion of discrete `ℕ` into its one-point
  compactification is locally spectral (the spectral opens of `ℕ` are its finite subsets) and not
  `IsSpectralMap` (the preimage of the whole space is `ℕ`), so the agreement needs a spectral source
  even over a spectral target.
- `s0_1_locally_spectral_empty_map` — every map from the empty space is spectral in both senses.

**`IsLocallySpectralSpace`.** Local spectrality allows infinitely many disjoint spectral opens.

**Checks.**

- `definition_IsLocallySpectralSpace_1` — Discrete ℕ is locally spectral although it is not compact.
- `definition_IsLocallySpectralSpace_2` — The empty space is locally spectral.
- `definition_IsLocallySpectralSpace_3` — The real line is not locally spectral: no nonempty open
  neighbourhood is compact.

**`IsLocallySpectralMap`.** The relative spectral-map condition tests spectral open subspaces.

**Checks.**

- `definition_IsLocallySpectralMap_1` — The map from discrete ℕ to a point is locally spectral,
  without being globally spectral.
- `definition_IsLocallySpectralMap_2` — The identity of the one-point space is locally spectral.
- `definition_IsLocallySpectralMap_3` — The characteristic function of {0} on ℝ is not locally
  spectral, since it is discontinuous.

Lean: `IsLocallySpectralSpace`, `spectralSpace_iff_isLocallySpectralSpace`, `IsLocallySpectralMap`
and `isLocallySpectralMap_iff_isSpectralMap`, with the Checks `definition_IsLocallySpectralSpace_1`,
`definition_IsLocallySpectralSpace_2`, `definition_IsLocallySpectralSpace_3`,
`definition_IsLocallySpectralMap_1`, `definition_IsLocallySpectralMap_2`,
`definition_IsLocallySpectralMap_3`, `s0_1_locally_spectral_noncompact_projection`,
`s0_1_one_point_compactification_inclusion`, `s0_1_composite_needs_locally_spectral_middle` and
`s0_1_locally_spectral_empty_map` as examples. The rest of this subsection is specified in the
README only (no Lean declaration).

### R0.1a adic rings of finite ideal type

**Adic rings of finite ideal type and their ideals of definition.** (*adic-ring*) Let `A` be a
commutative ring with a topology making it a topological ring (Mathlib `IsTopologicalRing`). An
ideal `J` of `A` is an ideal of definition when `J` is open and every neighbourhood of `0` contains
`J^n` for some `n ≥ 1` (EGA I Ch. 0, 7.1.2 Définition, p. 60). The ring `A` is an adic ring of
finite ideal type, written `IsAdicRing A`, when there is a finitely generated ideal `I` of `A`
(Mathlib `Ideal.FG`) such that the topology of `A` is the `I`-adic topology (Mathlib `IsAdic I`:
the powers `I^n` are open and form a basis of neighbourhoods of `0`) and `A` is `I`-adically
separated and complete (Mathlib `IsAdicComplete I A`) (EGA I Ch. 0, 7.1.9 Définition, p. 62). An
adic noetherian ring is an adic ring of finite ideal type whose underlying ring is noetherian
(Mathlib `IsNoetherianRing`); then every ideal of definition is finitely generated. Conventions:
completeness always includes separatedness; the topology is part of the data, so `k⟦t⟧` with the
discrete topology and `k⟦t⟧` with the `t`-adic topology are different adic rings; morphisms of
adic rings are continuous ring homomorphisms. For `I` as above, an ideal `J` is an ideal of
definition if and only if `IsAdic J` holds, if and only if `J` is open and `J^n ⊆ I` for some `n`
(EGA I Ch. 0, 7.1.4(i); 7.1.9, p. 62: the adic topology does not depend on the ideal of
definition), so every statement about these rings may use any ideal of definition. The class
`IsAdicRing` bundles Mathlib's `IsAdic` (with `isAdic_iff` and `is_ideal_adic_pow`) and
`IsAdicComplete` (with `IsAdic.isAdicComplete_iff`). SchemeAndStackFoundations §4.7
records the same complete adic-ring data as `Formal.AdicRing`. Three facts about adic rings are library theorems and are used, not restated: `J ≤ (⊥ : Ideal
A).jacobson` for an ideal of definition `J` of a complete ring, hence `a ∈ A` is a unit iff its
image in `A ⧸ J` is (Mathlib `IsAdicComplete.le_jacobson_bot`; EGA I Ch. 0, 7.1.10 Proposition,
p. 62; 7.1.11–7.1.12); `IsTopologicallyNilpotent a ↔ IsNilpotent (Ideal.Quotient.mk I a)` for
`IsAdic I` (Tau Ceti `IsAdic.isTopologicallyNilpotent_iff_mem_radical`; EGA I Ch. 0, 7.1.3); and
the Huber-ring instance `TauCeti.Huber.isHuberRing_of_isAdic I hI hfg`, obtained from the pair of
definition `PairOfDefinition.adic` with ring of definition `⊤` and ideal of definition `I`. Define
`IsAdicRing`, with field `IsAdicRing.exists_isAdic` (`∃ I : Ideal A, I.FG ∧ IsAdic I ∧
IsAdicComplete I A`), a chosen ideal of definition `IsAdicRing.ideal` with `IsAdicRing.ideal_spec`,
and the instance `IsAdicRing.isHuberRing`; prove: if `IsAdic I` then for every ideal `J`,
`IsAdic J ↔ (IsOpen (J : Set A) ∧ ∃ n, J ^ n ≤ I)`; if `IsAdicRing A` and `IsAdic J` then
`IsAdicComplete J A` (completeness does not depend on the ideal of definition, since `J` and the
chosen `I` define the same topology, hence the same Cauchy sequences and limits, and
`J^{nk} ⊆ I^k` gives `⋂_n J^n ⊆ ⋂_k I^k = 0`); if `IsAdicRing A`, `A` noetherian and `IsAdic I`,
then `IsAdic I.radical` and `I.radical` is the largest ideal of definition: every `J` with
`IsAdic J` satisfies `J ≤ I.radical` (EGA I Ch. 0, 7.1.6–7.1.7); for `IsAdicRing A`,
`IsAdicRing B` with ideals of definition `I`, `J` and a ring homomorphism `φ : A →+* B`, `φ` is
continuous iff `φ(I) ⊆ J.radical`, iff each `φ(a)`, `a ∈ I`, is topologically nilpotent (the "if"
half is Tau Ceti `IsAdic.continuous_of_map_le_radical`, and the equivalence is what gives automatic
continuity of morphisms of formal schemes); if `IsAdicRing A` and `A` is noetherian then for
every ideal `𝔞` the quotient `A ⧸ 𝔞` with the quotient topology is an adic noetherian ring with
ideal of definition `I·(A ⧸ 𝔞)`, and every ideal of `A` is closed
(the quotient and closedness consequences use R0.2's *noetherian-type-ideals-closed*
at the ring of definition `A₀ = A`) (EGA I Ch. 0,
7.3.5); a complete noetherian local ring with the `maximalIdeal`-adic topology,
`IsAdic (maximalIdeal A)` and `IsAdicComplete (maximalIdeal A) A`, is an adic noetherian ring;
R0.1b supplies the completion consequence `IsAdicRing.adicCompletion`: for a noetherian
ring `R` and an ideal `I`, `AdicCompletion I R` with the adic topology of its ideal `I·R̂`
is an adic noetherian ring (*adic-completion-noetherian*). `ℤ_p` with
the `p`-adic topology, `k⟦t₁,…,t_n⟧` with the `(t₁,…,t_n)`-adic topology and every complete
noetherian local ring with the maximal-ideal-adic topology are adic noetherian rings; every ring
with the discrete topology is adic with `I = 0`; `ℚ_p` is not an adic ring, since its only open
ideal is `ℚ_p` itself, whose powers do not tend to `0`; and `O_K⟨X⟩` for a complete rank-one
valuation ring `O_K` with pseudo-uniformiser `ϖ`, with the `ϖ`-adic topology, is an adic ring of
finite ideal type which is not noetherian when the value group is not discrete, which is the
setting of the formal schemes of type (S), a downstream application in
AdicSpacesPartIII R2.2.
*Needs:* Mathlib `IsAdic`,
`isAdic_iff`, `is_ideal_adic_pow`, `IsAdicComplete`, `IsAdic.isAdicComplete_iff`,
`IsAdicComplete.le_jacobson_bot`, `Ideal.FG`, `IsNoetherianRing`, `IsTopologicalRing`; Tau Ceti
`TauCeti.Huber.IsHuberRing`, `TauCeti.Huber.PairOfDefinition`,
`TauCeti.Huber.PairOfDefinition.adic`, `TauCeti.Huber.isHuberRing_of_isAdic`,
`TauCeti.IsAdic.isTopologicallyNilpotent_iff_mem_radical`,
`TauCeti.IsAdic.continuous_of_map_le_radical`. Lean: `IsAdicRing` (with its field
`exists_isAdic`), `IsAdicRing.ideal`, `IsAdicRing.ideal_spec`, the instance
`IsAdicRing.isHuberRing` (the completion theorem is in R0.1b), with the first, second, third and sixth
Checks below as examples; the other clauses are specified in this README only.

**Checks.**

- (computation) — `ℤ_[p]` with its `p`-adic topology satisfies `IsAdicRing`
  and `IsNoetherianRing`, and the ideal `span {p}` is an ideal of definition:
  `IsAdic (Ideal.span {(p : ℤ_[p])})`.
- (degenerate, discrete) — every commutative ring with the discrete topology
  satisfies `IsAdicRing` with the zero ideal as ideal of definition (`⊥` is finitely generated,
  `IsAdic ⊥` is the discrete topology, `IsAdicComplete ⊥ A` holds by Mathlib `IsAdicComplete.bot`).
- (non-example, `ℚ_p`) — `ℚ_[p]` with its valuation topology does not satisfy
  `IsAdicRing`; a tempting wrong definition ("complete topological ring with an open ideal")
  accepts `ℚ_[p]`, because `ℚ_[p]` itself is an open ideal.
- (non-example, incomplete) — `k[X]` with the `(X)`-adic topology is not an
  adic ring (not complete), while its completion `k⟦X⟧` with the `(X)`-adic topology is;
  completeness is not implied by `IsAdic`.
- (degenerate, unit ideal) — the zero ring is an adic ring (every
  ideal is an ideal of definition); conversely, if `IsAdic (⊤ : Ideal A)` and `IsAdicComplete ⊤ A`
  then `A` is the zero ring, since separatedness forces `⋂_n ⊤^n = ⊤ = 0`. The unit ideal is an
  ideal of definition only of the zero ring, so `Spf A = ∅` exactly when `A = 0`.
- (degenerate, field) — a field `k` is an adic ring iff its
  topology is discrete: its only ideals are `0` and `k`, and `k` is excluded by the previous
  bullet, so `I = 0`. Thus `Spf k = Spec k` is one point, and a field with a nondiscrete ring
  topology (`ℚ_[p]`, `ℝ`) is never adic.
- (non-example for the radical clause) — for `O_C` with the
  `p`-adic topology and `I = (p)`, `√I = 𝔪_C` satisfies `𝔪_C² = 𝔪_C`, so its powers do not tend to
  `0` and `IsAdic 𝔪_C` fails: without noetherianity the radical of an ideal of definition need not
  be one, and no largest ideal of definition exists. Stated in general, the check assumes a
  rank-one valuation domain and `ϖ ≠ 0`.
- (negative control) — in a nonfield valuation domain,
  `√(0) = 0 ≠ 𝔪`; allowing the zero parameter would invalidate `√(ϖ) = 𝔪`.

- (degenerate) — the chosen ideal `IsAdicRing.ideal` in the zero ring is zero.
- (degenerate) — the chosen ideal in an adic field is zero.
- (computation) — every chosen ideal of definition of `ℤ_[p]`
  has radical `(p)`; no canonical exponent is asserted.

### R0.1b noetherianity of adic completions

**Noetherianity of adically complete rings and of adic completions.**
(*adic-completion-noetherian*) Let `R` be a commutative ring and `I` a finitely generated ideal.
Prove that (i) if `R` is `I`-adically complete (`IsAdicComplete I R`) and `R ⧸ I` is noetherian,
then `R` is noetherian (EGA I Ch. 0, 7.2.6 Corollaire, p. 64: an admissible ring complete for `I`
is noetherian iff `A/I` is noetherian and `I/I²` finite); and (ii) if `R` is noetherian, then
`R̂ := AdicCompletion I R` is noetherian, it is `I·R̂`-adically separated and complete, `I^n·R̂` is
the kernel of `R̂ → R ⧸ I^n`, and `R̂ ⧸ I^n·R̂ ≅ R ⧸ I^n` for all `n`; consequently
`AdicCompletion I R` with its `I·R̂`-adic topology is an adic noetherian ring (EGA I Ch. 0,
7.2.12; 7.3.1, p. 66). In (ii) the completeness of `R̂` is Mathlib's `AdicCompletion.isAdicComplete`
and the kernel and quotient statements are `AdicCompletion.pow_smul_top_eq_ker_eval` with
`AdicCompletion.surjective_evalₐ`; the noetherianity in (i) and (ii) is the content of this
target, and R0.1's *noetherian-adic-completion* is its application to the ring of definition
of a Huber ring. The base cases are `ℤ_p = AdicCompletion (p) ℤ` and
`k⟦t⟧ = AdicCompletion (t) k[t]`; for `R = k[t₂, t₃, …]⟦t₁⟧`, which is complete for the finitely
generated `I = (t₁)`, `R ⧸ I = k[t₂, t₃, …]` is not noetherian and neither is `R`, so that
hypothesis cannot be dropped; more simply, `k[X₀, X₁, …]` is complete for `I = 0` and is not
noetherian (here `R ⧸ I = R`).
*Needs:* R0.1a *adic-ring*; Mathlib `AdicCompletion`, `AdicCompletion.isAdicComplete`,
`AdicCompletion.pow_smul_top_eq_ker_eval`, `AdicCompletion.surjective_evalₐ`, `IsAdicComplete`,
`MvPolynomial.isNoetherianRing`, `IsNoetherianRing`, `Ideal.FG`. Lean: (i) is
`isNoetherianRing_of_isAdicComplete` and (ii) is `IsAdicRing.adicCompletion`, with the
`k[X₀, X₁, …]` Check as an example.

**Checks.**

- The completion `AdicCompletion (p) ℤ = ℤ_p` is noetherian and its quotients modulo `p^n`
  are `ℤ/p^nℤ`, including the zero quotient at `n = 0`.
- For a field `k`, `AdicCompletion (t) k[t] = k⟦t⟧` is noetherian, with quotient
  `k[t]/(t^n)` at each precision.
- The ring `k[X₀, X₁, …]` is complete for the finitely generated ideal `0` but is not
  noetherian; the noetherian quotient hypothesis in (i) is necessary (Lean `example`).

### R0.1 ring-level inputs

**Huber rings of noetherian type (Huber's noetherian hypothesis).** (*noetherian-type-huber-ring*)
Let `A` be a commutative topological ring which is a Huber ring (Tau Ceti `IsHuberRing A`). `A` is
*of noetherian type* if one of the following holds: (i) `A` admits a pair of definition `(A₀, I)`
(Tau Ceti `PairOfDefinition A`) whose ring of definition `A₀` is a noetherian ring; (ii) `A` is a
Tate ring (`IsTateRing A`) and strongly noetherian in Tau Ceti's sense (`IsStronglyNoetherian A`:
every completed restricted power-series ring `A⟨X₁,…,X_k⟩`, `k ≥ 0`, is a noetherian ring). These
are the two cases of Huber's sheafiness theorem (Huber94 §2, Theorem 2.2, p. 524). For
non-complete `A`, clause (i) is imposed on `A` itself, whereas Huber's theorem asks for a
noetherian ring of definition of the Hausdorff completion `Â`; `IsNoetherianType.completion`
supplies the condition on `Â`. The two formulations are not identified for non-complete `A`; for
complete Hausdorff `A` they agree, as in Huber94 §3, Propositions 3.6–3.8, pp. 535–536. Huber's
standing class (Huber96 §1.1, (1.1.1), p. 37), which also asks `A` to be finitely generated over
its noetherian ring of definition and admits discrete rings separately, is narrower; it is the
separate target *huber-standing-class* below.
Conventions: the predicate concerns the topological ring only (no plus ring); completeness is
not part of it, and every result that needs a complete ring assumes completeness and the
Hausdorff property separately. Clause (i) does not say that `A` is a noetherian ring: every
discrete ring is of noetherian type, because its prime subring (the image of `ℤ`) is an open
noetherian subring with ideal of definition `0`, even when the ring is not finitely generated
over its prime subring. For a Tate ring clause (i) implies clause (ii) (a Tate ring with a
noetherian ring of definition is strongly noetherian), and the zero ring is strongly noetherian.
Thus on Tate rings the predicate is exactly strong noetherianness (Wedhorn §6.7, Rem. 6.37(3),
p. 54). The converse implication fails: `ℂ_p` is strongly noetherian but has no noetherian ring of
definition (a ring of definition `A₀ ⊆ O_{ℂ_p}` contains some `p^N·O_{ℂ_p}`, and the `A₀`-ideal
`p^N·𝔪_{ℂ_p}` is not finitely generated). In `Huber`, define `IsNoetherianType A` as the
Prop-valued class
`(∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) ∨ (IsTateRing A ∧ IsStronglyNoetherian A)`;
prove `isNoetherianType_iff` (the unfolding theorem, where the `NonarchimedeanRing` instance needed by
`IsStronglyNoetherian` is Tau Ceti's `IsHuberRing.toNonarchimedeanRing`),
`IsNoetherianType.of_pairOfDefinition` (if `P : PairOfDefinition A` and `P.ringOfDefinition` is a
noetherian ring, then `A` is of noetherian type), `IsNoetherianType.of_isStronglyNoetherian` (if `A`
is a Tate ring and `IsStronglyNoetherian A`, then `A` is of noetherian type), the discrete case
(every discrete Huber ring is of noetherian type, through its prime subring with ideal of
definition `0`), `IsNoetherianType.isStronglyNoetherian` (for a Tate ring
`A`, `IsNoetherianType A ↔ IsStronglyNoetherian A`), the noetherian-ring consequence for Tate
rings (a complete Hausdorff Tate ring of noetherian type is a noetherian ring, by Tau Ceti
`isNoetherianRing_of_isStronglyNoetherian`), `IsNoetherianType.completion` (a theorem: the
Hausdorff completion `Â` (Tau Ceti `IsHuberRing.completion`) of a ring of noetherian type is of
noetherian type — clause (i) by *noetherian-adic-completion*, clause (ii) by preservation of
strong noetherianness under completion (AdicSpaces §4.1)),
`IsNoetherianType.of_isTopologicallyFiniteType` (the statement of
*topologically-finite-type-noetherian-type*: if `A → B` is topologically of finite type, `B` complete
Hausdorff and `A` complete of noetherian type, then `B` is of noetherian type),
`IsNoetherianType.isClosed_ideal` (the statement of *noetherian-type-ideals-closed*: every ideal of a
complete Hausdorff ring of noetherian type is closed), `IsNoetherianType.isStablySheafy` (the
statement of *noetherian-type-stably-sheafy*: a complete Hausdorff ring of noetherian type is stably
sheafy in AdicSpaces' sense) and invariance under a ring isomorphism that is a homeomorphism.
*Needs:* *noetherian-adic-completion*; Tau Ceti `TauCeti.Huber.IsHuberRing`,
`TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.IsStronglyNoetherian`,
`TauCeti.Huber.isNoetherianRing_of_isStronglyNoetherian`, `TauCeti.Huber.IsHuberRing.completion`,
`TauCeti.Huber.isStronglyNoetherian_congr`,
`TauCeti.Huber.PairOfDefinition.weighted`, `TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.IsPseudoUniformizer.eventually_pow_mem_ringOfDefinition`; Mathlib
`MvPolynomial.isNoetherianRing`, `IsLocalization.isNoetherianRing`.
Lean: `Huber.IsNoetherianType`, `IsNoetherianType.of_pairOfDefinition`,
`IsNoetherianType.of_isStronglyNoetherian`, `IsNoetherianType.isStronglyNoetherian`; the
discrete-polynomial and `ℂ_p` Checks are `example`s.

**Checks.**

- Non-example: the discrete ring `ℤ[T₁, T₂, …]` (countably many variables) is of noetherian type
  by clause (i), its prime subring being an open noetherian ring of definition with ideal `0`, but
  it is not a noetherian ring; a definition "`A` is a noetherian ring" fails this test. It is not a
  Tate ring either (a topologically nilpotent element of a discrete ring is nilpotent, and a
  nilpotent unit forces `1 = 0`), so clause (ii) does not apply and a definition "strongly
  noetherian Tate ring" fails it too. Being discrete, it lies in Huber's standing class
  (*huber-standing-class*, clause (c)); the square-zero extension in the last Check below
  separates noetherian type from that class.
- Computation: `ℤ_p⟦T⟧` with the `(p, T)`-adic topology is of noetherian type through the pair of
  definition `(ℤ_p⟦T⟧, (p, T))`, over which it is generated by the empty set, and has no
  topologically nilpotent unit, so clause (ii) does not apply.
- Non-example: for a perfectoid field `K`, the Tate ring `K⟨T^{1/p^∞}⟩` is not of noetherian
  type: it is not a noetherian ring (the ideal generated by all `T^{1/p^n}` is not finitely
  generated), so it is not strongly noetherian, and a noetherian ring of definition `A₀` would make
  `A = A₀[1/ϖ]` noetherian.
- The Tate hypothesis in `IsNoetherianType.isStronglyNoetherian` is essential: with the discrete
  topology, `ℤ[X₀, X₁, …]` is of noetherian type but is not strongly noetherian.
- Degenerate: the zero ring is of noetherian type.
- Non-example: `ℂ_p` is of noetherian type by clause (ii) (strongly noetherian,
  Bosch–Güntzer–Remmert 5.2.6), but no ring of definition of `ℂ_p` is noetherian: every ring of
  definition `A₀` satisfies `p^N·O_{ℂ_p} ⊆ A₀ ⊆ O_{ℂ_p}`, and the `A₀`-ideal `p^N·𝔪_{ℂ_p}` is not
  finitely generated. A definition by clause (i) alone ("has a noetherian ring of definition")
  fails this test even among Tate rings.
- A pair of definition with noetherian ring of definition supplies clause (i) through
  `IsNoetherianType.of_pairOfDefinition`, with no finite-generation assumption on `A`.
- Any discrete Huber ring supplies clause (i) through its prime subring, with no
  finite-generation assumption on the ring.
- A strongly noetherian Tate ring supplies clause (ii), without choosing a noetherian ring of
  definition.
- For any prime `p`, let `M = ⊕_ℕ 𝔽_p` and `A = TrivSqZeroExt ℤ_p M`, with `ℤ_p` acting through
  `𝔽_p` and the product of the p-adic and discrete topologies. The subring `ℤ_p ⊕ 0` is a
  noetherian ring of definition, so `A` is of noetherian type by clause (i), although `A` is not
  a noetherian ring (its square-zero ideal `M` is not finitely generated). This ring lies outside
  Huber's standing class (*huber-standing-class*).

For prime p and a complete nontrivially normed nonarchimedean field K, the ultrametric and Tate
properties of the finite-sum Gauss norm construction below are stated for the rooted polynomial
ring (`rootedPolynomial.isUltrametricDist`, `rootedPolynomial.isTateRing`).
The Tate property uses a constant pseudouniformiser from K (AdicSpaces §0.3).

The perfectoid-disc non-example uses the explicit carrier
`PerfectoidDisc p K`: the completion of `rootedPolynomial p K = K[ℕ[1/p]]`
for `rootedPolynomialNorm`, the maximum coefficient norm. Here `ℕ[1/p]` is the
additive submonoid of `ℚ` generated by `p⁻ⁿ`, `p` is prime and `K` is any complete
nontrivially normed nonarchimedean field. Thus the statement includes perfectoid
fields without requiring perfectoidness. Its second conclusion says that the ideal
generated by all root monomials is not finitely generated: each finite subset is
contained in some `(T^(1/pⁿ))`, whereas the next root lies outside that ideal.
The complete Tate-ring implication used here is the noetherian-ring consequence of
*noetherian-type-huber-ring* (Wedhorn §6.7, Remark 6.37(3)).
PerfectoidSpaces P1 treats the multivariable integral-completion construction
over general perfectoid rings. These carriers are README targets.

Checks:

- Zero has empty support and norm zero.
- The constant a has coefficient a at zero and norm |a|.
- The monomial T^(1/pⁿ) has its indicated coefficient equal to one and norm one.
- The completion map preserves zero.
- The completion preserves the norm of every constant.
- Successive roots satisfy tₙ₊₁ᵖ = tₙ and (tₙ) is strictly contained in (tₙ₊₁).

**Huber's standing class.** (*huber-standing-class*) A Huber ring `A` is in Huber's standing class
if (a) some pair of definition `(A₀, I)` has `A₀` noetherian and `A` finitely generated as an
`A₀`-algebra (Mathlib `Algebra.FiniteType A₀ A`, using the subring inclusion), or (b) `A` is a
strongly noetherian Tate ring, or (c) `A` is discrete (Huber96 §1.1, (1.1.1), p. 37, where (a) is
asked of the completion; chart rings here are complete). Huber96 imposes this on every f-adic ring
and proves the unramified, smooth and étale theory of §§1.6–1.7 under it. Prove: every ring in the
class is of noetherian type (in (c) the prime subring with ideal `0` is a noetherian ring of
definition); in case (a) `A` is noetherian, by the Hilbert basis theorem; the class is stable
under rational localisation and topologically finite type extensions (in case (a), each element
of the completed algebra is a polynomial in finitely many fixed elements plus a tail in the
completed ring of definition, so the completed algebra is finitely generated over that
noetherian ring); for complete `A` the two readings of (a), on `A` and on `Â`, agree. Clause (c)
includes arbitrary discrete rings, even those not finitely generated over their prime subrings.
For a Tate ring (a) implies (b), and a nonzero Tate ring cannot be discrete. The inclusion in
noetherian type is strict: noetherian type does not ask `A` to be finitely generated over its
ring of definition. Checks: discrete rings, e.g. `ℤ[T₁, T₂, …]`, are in the class by (c) though
not noetherian; `ℚ_p` is in it by (b) and `ℤ_p⟦T⟧` (`(p, T)`-adic) by (a); the ring
`A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control* (R0.16) is of noetherian type (open
noetherian ring of definition `ℤ_p`) but outside the class, since its ideal `J` of finitely
supported sequences is not finitely generated, so `A` is not finitely generated over `ℤ_p` (nor
noetherian, so no other ring of definition serves), and it is neither Tate nor discrete; for the
same reason the square-zero extension `TrivSqZeroExt ℤ_p (⊕_ℕ 𝔽_p)` of the last Check above is of
noetherian type and outside the class (its ideal `⊕_ℕ 𝔽_p` is not finitely generated, the embedded
`ℤ_p` excludes discreteness, and the projection to `ℤ_p` excludes a topologically nilpotent
unit). Lean: `Huber.IsHuberStandard`, `IsHuberStandard.isNoetherianType`; the discrete and `ℚ_p`
Checks are `example`s.

**A noetherian ring of definition stays noetherian under completion.** (*noetherian-adic-completion*)
Let `A` be a Huber ring with a pair of definition `(A₀, I)` (Tau Ceti `PairOfDefinition`, `I`
finitely generated), and let `(Â₀, Î)` be the pair of definition of the completion `Â` given by Tau
Ceti `PairOfDefinition.completion` (`Â₀` the closure of the image of `A₀`, `Î` the ideal of `Â₀`
generated by the image of `I`). Apply R0.1b *adic-completion-noetherian*
to the `I`-adic ring `A₀`. Its algebraic noetherian criterion and `IsAdicRing.adicCompletion`
depend only on Mathlib's adic-completion API. When `A₀` is noetherian, its `I`-adic completion
`Â₀` is noetherian, `Î`-adically complete and separated with `A₀/Iⁿ ≅ Â₀/Îⁿ` for every `n`
(EGA I Ch. 0, §7.3, (7.3.1), p. 66). Since `Î` is finitely generated, `Â₀` is noetherian as
soon as `Â₀/Î ≅ A₀/I` is (EGA I Ch. 0, §7.2, (7.2.6), p. 64).
The comparison identifies Tau Ceti's `PairOfDefinition.completion` with that adic
completion, so that the completion statement applies to the pair of definition of `Â` (Wedhorn §6.6,
proof of Prop. 6.35, p. 54, for its use in the topologically-finite-type stability of noetherian
rings of definition). For instance `ℤ_p`, the completion of `ℤ` at `(p)`, and `ℤ_p⟦T⟧`, the
completion of `ℤ_p[T]` at `(p, T)`, are noetherian; for `A₀ = ℤ[T₁, T₂, …]` and `I = (p)` the
completion `Â₀` is not noetherian.
More generally, for a ring `R` with an `I`-adic topology (`IsAdic I`) and `I` finitely generated
(`I.FG`), the uniform completion is complete for the ideal generated by the image of `I`
([Stacks, Lemma 10.96.3, Tag 05GG](https://stacks.math.columbia.edu/tag/05GG)).
Finite generation cannot be omitted, even for a separated adic topology.

**Checks.**

- For `I = 0` the topology is discrete and the
  completion is the original ring, complete for the zero ideal. Apply the adic-completeness
  statement above to the given `IsAdic (⊥ : Ideal R)` and finite generation of the zero ideal.
- For prime `p`, give `ℤ` the `(p)`-adic topology
  using Mathlib's `Ideal.adicTopology` and its additive uniformity. Apply the
  adic-completeness statement with `I = Ideal.span {(p : ℤ)}`
  and `Submodule.fg_span_singleton`: the uniform completion is complete for the
  extended ideal `(p)`. This is the nonzero proper-ideal case of the theorem; instance
  synthesis alone does not prove its conclusion.
- For `I = R` the topology is indiscrete and the
  Hausdorff completion is the zero ring, which is complete for the extended unit ideal.
- For `R = ℚ[X₀, X₁, …]` and
  `I = (X₀, X₁, …)`, the uniform completion is not complete for `I·R̂`.
  The series `Σₙ Xₙ^{n+1}` belongs to the closure of `I` but not to `I·R̂`:
  a finite sum of multiples of variables cannot contain all its monomials.
  This distinguishes the limit topology from the extended-ideal topology
  ([Stacks, §110.7, Tag 05JA](https://stacks.math.columbia.edu/tag/05JA)).

*Needs:* R0.1b *adic-completion-noetherian*,
`TauCetiRoadmap.AdicSpacesPartII.isNoetherianRing_of_isAdicComplete` and
`TauCetiRoadmap.AdicSpacesPartII.IsAdicRing.adicCompletion`; Mathlib `AdicCompletion.isAdicComplete`,
`AdicCompletion.eval_surjective`, `AdicCompletion.pow_smul_top_eq_ker_eval`; Tau Ceti
`TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.Huber.PairOfDefinition.isOpen_completionRingOfDefinition`,
`TauCeti.Huber.PairOfDefinition.isAdic_completionIdeal`,
`TauCeti.Huber.PairOfDefinition.completionIdeal_pow`,
`TauCeti.Huber.PairOfDefinition.fg_completionIdeal`,
`UniformSpace.Completion.isOpen_closure_image_coe`,
`UniformSpace.Completion.preimage_closure_image_coe`; Mathlib `hI.isAdicComplete_iff` (for
`hI : IsAdic I`), `UniformSpace.Completion`.
The named comparisons are `Huber.isNoetherianRing_completion_of_isAdic`: for a
noetherian commutative ring `R` with compatible additive uniformity, `IsAdic I` and `I.FG`,
its separated uniform completion is noetherian; and `Huber.PairOfDefinition.isNoetherianRing_completion`:
for a Huber ring `A` with compatible additive uniformity and a pair of definition `P` whose
ring is noetherian, `P.completion.ringOfDefinition` is noetherian.

Lean: `IsNoetherianType.completion`; the adic-completeness statement and its Checks are README
targets.

**Adic homomorphisms of Huber rings.** (*adic-ring-homomorphism*) Let `A` and `B` be Huber rings
(Tau Ceti `IsHuberRing`) and `φ : A →+* B` a ring homomorphism. `φ` is *adic* if there exist a pair
of definition `(A₀, I)` of `A` and a ring of definition `B₀` of `B` such that `φ(A₀) ⊆ B₀` and the
ideal `φ(I)·B₀` of `B₀` is an ideal of definition of `B₀` (it is finitely generated, and the subspace
topology of `B₀` is the `φ(I)B₀`-adic topology); equivalently, there is a Tau Ceti pair of definition
`Q` of `B` with `φ(P.ringOfDefinition) ⊆ Q.ringOfDefinition` and `Q.idealOfDefinition` equal to the
ideal of `Q.ringOfDefinition` generated by `φ(P.idealOfDefinition)`. Every adic homomorphism is
continuous. Huber94 recalls this definition from Huber93; Wedhorn records it as Definition 6.23
(Huber94 §3, paragraph before the Def. of adic morphisms, p. 532; Wedhorn §6.5, Def. 6.23, p. 51). In
`Huber`, define `IsAdicHom φ` as the Prop
`∃ (P : PairOfDefinition A) (Q : PairOfDefinition B), φ(P.A₀) ⊆ Q.A₀ ∧ Q.I = Ideal.span (φ(P.I))`;
prove `IsAdicHom.continuous` (an adic homomorphism is continuous), `IsAdicHom.comp` (if `φ : A → B`
and `ψ : B → C` are adic then `ψ ∘ φ` is adic; Wedhorn 6.26(1)), the cancellation statement (if
`φ` is continuous, `ψ` is continuous and `ψ ∘ φ` is adic, then `ψ` is adic; Wedhorn 6.26(2)),
`IsAdicHom.id`
(the identity is adic), `IsAdicHom.of_isTateRing` (a theorem with a continuity hypothesis, not an
instance: every continuous ring homomorphism from a Tate ring to a Huber ring is adic, and its
target is Tate; Wedhorn Prop. 6.25),
the radical criterion (if `(A₀, I)`, `(B₀, J)` are pairs of definition with `φ(A₀) ⊆ B₀`,
`φ(I) ⊆ J` and `√(φ(I)B₀) = √J`, then `φ` is adic, since `J` finitely generated gives
`Jⁿ ⊆ φ(I)B₀ ⊆ J`), the discrete case (from a discrete ring, a homomorphism is adic iff
the target is discrete), adicness of completion (the completion map `A → Â` is adic, with the pair
of definition given by Tau Ceti `PairOfDefinition.completion`),
adicness of restricted series (the structure map `A → A⟨X⟩_T` is adic for every
weight family `T`; this is a restatement, through the definition of `IsAdicHom`, of Tau Ceti's
`PairOfDefinition.weighted` with `mem_weighted_idealOfDefinition`, which say that the ideal of
definition of `A₀⟨X⟩_T` is generated by `I`), stability under open quotients (if `φ` is adic and
`π : B → C` is a surjective continuous open ring homomorphism, then `π ∘ φ` is adic, because `π`
maps rings and ideals of definition to rings and ideals of definition) and
`IsTopologicallyFiniteType.isAdicHom`
(the statement of *topologically-finite-type-is-adic*). Tau Ceti has no predicate of adic
homomorphisms; its pairs of definition `PairOfDefinition.weighted` and the rational localisation's
`mem_completionLocalization_idealOfDefinition` are the data from which the examples below are read
off. *Needs:* Tau Ceti
`TauCeti.Huber.IsHuberRing`, `TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.IsTateRing`,
`TauCeti.Huber.PairOfDefinition.completion`, `TauCeti.Huber.PairOfDefinition.weighted`,
`TauCeti.Huber.PairOfDefinition.mem_weighted_idealOfDefinition`,
`TauCeti.Huber.PairOfDefinition.mem_completionLocalization_idealOfDefinition`.
`Huber.IsAdicHom.of_discrete_iff` states that a ring homomorphism from a discrete
Huber ring to a Huber ring is adic exactly when the target is discrete; no continuity
hypothesis is needed in this discrete-source statement (Wedhorn, Definition 6.23).

Lean: `Huber.IsAdicHom`, `IsAdicHom.continuous`, `IsAdicHom.id`, `IsAdicHom.of_isTateRing`; the
Checks `ℤ_p → ℚ_p` and `ℤ → ℤ_p` are `example`s.

**Checks.**

- *Computation.* The inclusion `ℤ_p → ℚ_p` is adic: `A₀ = B₀ = ℤ_p`,
  `I = pℤ_p`, and `pℤ_p` is an ideal of definition of `ℤ_p`.
- *Non-example.* The inclusion `ℤ_p → ℤ_p⟦T⟧` with the `p`-adic
  topology on `ℤ_p` and the `(p, T)`-adic topology on `ℤ_p⟦T⟧` is continuous but not adic:
  `p·ℤ_p⟦T⟧` contains no power of `(p, T)` (Morel §II.3.2, Ex. II.3.2.2). A definition "adic =
  continuous" fails this test.
- *Characterisation.* For a discrete ring `A` and a Huber ring `B`, a
  ring homomorphism `A → B` is adic iff `B` is discrete (Wedhorn Ex. 6.24); in particular `ℤ → ℤ_p`
  is continuous and not adic.
- *Compatibility.* For a Huber ring `A` the completion map `A → Â` is
  adic, with the pair of definition of `Â` given by Tau Ceti `PairOfDefinition.completion` (`Â₀` the
  closure of the image of `A₀`, `Î` generated by the image of `I`).
- *Degenerate.* The identity of a Huber ring is adic.
- *Degenerate.* Every ring homomorphism from a Huber ring to the zero
  ring is adic: `B₀ = 0` and `φ(I)·B₀ = 0` is the (only) ideal of definition of the zero ring.
- *Non-example.* The cancellation statement concludes that `ψ` is
  adic, not `φ`: for `φ : ℤ → ℤ_p` and `ψ : ℤ_p → 𝔽_p` (both continuous, `𝔽_p` discrete) the
  composite `ℤ → 𝔽_p` is adic (discrete to discrete) and `ψ` is adic (`B₀ = 𝔽_p`,
  `ψ(pℤ_p)·𝔽_p = 0`), but `φ` is not adic because `ℤ_p` is not discrete.

**Topologically-finite-type homomorphisms are adic.** (*topologically-finite-type-is-adic*) Let `A`
be a Huber ring, `B` a complete Hausdorff Huber ring and `φ : A → B` a ring homomorphism which is
topologically of finite type in Tau Ceti's sense (`IsTopologicallyFiniteType φ`: there are `k`,
finite weights `T₁,…,T_k ⊆ A` forming a weight family, and an open quotient map `π` from the
completion of `A⟨X₁,…,X_k⟩_T` onto `B` with `π ∘ (structure map) = φ`). Prove that `φ` is adic
(*adic-ring-homomorphism*); more precisely, for every pair of definition `(A₀, I)` of `A`,
`B₀ := π(closure of A₀⟨X⟩_T)` is a ring of definition of `B` and `φ(I)·B₀` is an ideal of definition
of `B₀` (Huber94 §3, Lem. 3.3(ii), condition (b), p. 533; Wedhorn §8.5, Rem. 8.49(2), p. 88). In
particular the rational localisation `A → A⟨T/s⟩` (Tau Ceti `completionLocalization`) is adic —
its ideal of definition is generated by the image of `I` by Tau Ceti's
`mem_completionLocalization_idealOfDefinition` — and
`A → A⟨X₁,…,X_n⟩/𝔞` is adic for every closed ideal `𝔞`. Contrapositively, `ℤ_p⟦T⟧` with the
`(p, T)`-adic topology is not topologically of finite type over `ℤ_p`, since `ℤ_p → ℤ_p⟦T⟧` is not
adic (the second Check of *adic-ring-homomorphism*), whereas `ℤ_p⟨T⟩` with the `p`-adic topology is. *Needs:* *adic-ring-homomorphism*; Tau
Ceti `TauCeti.Huber.IsTopologicallyFiniteType`, `TauCeti.Huber.PairOfDefinition.weighted`,
`TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.Huber.PairOfDefinition.exists_sum_weightedRingOfDefinitionC_mul`,
`TauCeti.Huber.PairOfDefinition.fg_weightedIdeal_one`; Mathlib `IsOpenQuotientMap`.
Lean: `IsTopologicallyFiniteType.isAdicHom`.

**Rings topologically of finite type over a ring of noetherian type are of noetherian type.**
(*topologically-finite-type-noetherian-type*) Let `A` be a complete Hausdorff Huber ring of
noetherian type (*noetherian-type-huber-ring*) and `φ : A → B` a ring homomorphism to a complete
Hausdorff Huber ring `B` with `IsTopologicallyFiniteType φ` (Tau Ceti). Prove that `B` is of
noetherian type; more precisely: (i) if `A` has a noetherian ring of definition `A₀`, then
`π(Â₀⟨X⟩_T)` is a noetherian ring of definition of `B`, and if `A` is moreover finite type over
`A₀` then `B` is finite type over `π(Â₀⟨X⟩_T)` (the stability of *huber-standing-class*)
(Huber94 §3, Cor. 3.4(iii), p. 534; Wedhorn Prop.
6.35); (ii) if `A` is a strongly noetherian Tate ring, then `B` is a strongly noetherian Tate ring
(Huber94 §3, Cor. 3.4(ii); Wedhorn §6.7, Rem. 6.37(1), p. 54); (iii) if `A` is discrete (a case of
(i), through its prime subring), adicness makes `B` discrete. Clause (ii) for strict presentations
(`IsStrictlyTopologicallyFiniteType φ`) is Tau Ceti's
`IsStrictlyTopologicallyFiniteType.isStronglyNoetherian`; what remains is clause (i) and the
weighted presentations of clause (ii), whose weighted-to-strict step over a Tate base is Wedhorn
§6.6, Prop. 6.34, p. 54. In particular every rational localisation of a strongly noetherian Tate
ring is strongly noetherian — this instance is Tau Ceti's
`TauCeti.Huber.PairOfDefinition.isStronglyNoetherian_completion` — and every rational localisation of `ℤ_p⟨T⟩`
has a noetherian ring of definition. *Needs:* *noetherian-type-huber-ring*;
*noetherian-adic-completion*; *adic-ring-homomorphism*; *topologically-finite-type-is-adic*; Tau
Ceti `TauCeti.Huber.IsTopologicallyFiniteType`,
`TauCeti.Huber.IsStrictlyTopologicallyFiniteType.isStronglyNoetherian`,
`TauCeti.Huber.PairOfDefinition.isStronglyNoetherian_completion`,
`TauCeti.Huber.PairOfDefinition.weighted`, `TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.Huber.weightedRestrictedSubring`, `TauCeti.Huber.IsWeightedRestricted`,
`TauCeti.Huber.weightMul`; Mathlib `MvPolynomial.isNoetherianRing`.
Lean: `IsNoetherianType.of_isTopologicallyFiniteType`.

**Ideals of complete rings of noetherian type are closed.** (*noetherian-type-ideals-closed*) Let
`A` be a complete Hausdorff Huber ring of noetherian type, `J` an ideal of `A` and `A⁺` a ring of
integral elements. Prove that every ideal `J ⊆ A` is closed, and that `A/J` with the quotient
topology is a complete Hausdorff Huber ring of noetherian type; the quotient pair `(A/J, integral
closure of the image of A⁺)` (Tau Ceti `Pair.quotient`) is a complete Huber pair and the quotient map
is a quotient mapping in Huber's sense. Closedness of the ideals is not new: in the
noetherian-ring-of-definition case it is *noetherian-rod-module-complete* with `M = A` (Huber94 §2,
Lem. 2.3(ii), p. 525), and for `A₀ = A` an adic noetherian ring it is the quotient clause of
this target (EGA I Ch. 0, §7.3, Cor. (7.3.6), p. 68); in the
strongly noetherian Tate case it is Tau Ceti's `isClosed_of_isNoetherian` together with
`Ideal.isClosed_weightedRestrictedSubring_one_weight`, and the closed embedding of the quotient
pair is Tau Ceti's `Pair.quotient` with `isClosedEmbedding_spaComap_quotientMk`. What this target
adds is the quotient ring being of noetherian type, complete and Hausdorff, in both cases of the
disjunction (with a noetherian ring of definition `A₀`, the image `A₀/(J ∩ A₀)` is a noetherian ring
of definition of `A/J`). For instance in `ℚ_p⟨T⟩` every ideal, e.g. `(T)`, is closed, and in `ℤ_p⟦T⟧` every ideal is
closed; outside the hypothesis the statement fails: in the Tate ring `C(ℤ_p, ℚ_p)` of continuous
functions with the supremum norm, the ideal of functions vanishing on a neighbourhood of `0` is not
closed (its closure is the ideal of functions vanishing at `0`, which contains `x ↦ x`). The
Hausdorff hypothesis is used already for `J = 0`: `ℤ` with the indiscrete topology, pair of
definition `(ℤ, (1))`, is a Huber ring of noetherian type in which every Cauchy filter converges
but which is not Hausdorff (the closure of `0` is `ℤ`), so it is not complete in the sense of
Convention 2 and `J = 0` is not closed. For `J = A` the quotient is the zero ring, complete,
Hausdorff and of noetherian type. *Needs:* *noetherian-type-huber-ring*;
*topologically-finite-type-noetherian-type*; *noetherian-rod-module-complete*; Tau Ceti `TauCeti.Huber.isClosed_of_isNoetherian`,
`TauCeti.Huber.Ideal.isClosed_weightedRestrictedSubring_one_weight`, `TauCeti.Huber.Pair.quotient`,
`TauCeti.ValuationSpectrum.isClosedEmbedding_spaComap_quotientMk`,
`TauCeti.Huber.isStrictlyTopologicallyFiniteType_quotientMk_algebraMap`,
`TauCeti.Huber.IsStrictlyTopologicallyFiniteType.isStronglyNoetherian`; Mathlib
`IsHausdorff.of_le_jacobson`, `IsAdicComplete.le_jacobson_bot`, `hI.isAdicComplete_iff` (for
`hI : IsAdic I`), `QuotientGroup.completeSpace_right`.
`Huber.IsNoetherianType.completeSpace_quotient` states that for a complete Hausdorff
Huber ring `A` of noetherian type and any ideal `J`, `A/J` with its quotient topology and
compatible additive uniformity is complete and Hausdorff. The ideal is closed by this
target and completeness follows from the quotient of a complete first-countable group.

Lean: `IsNoetherianType.isClosed_ideal`; the indiscrete-topology Check is an `example`.

**Check (non-example).** With the indiscrete
topology and its additive uniformity on `ℤ`, the zero ideal is not closed.
Thus convergence of Cauchy filters alone does not supply the Hausdorff hypothesis
in `IsNoetherianType.isClosed_ideal`.

**Check (non-example).** For each ring of
definition `A₀` of `ℂ_p` and `N` with `pᴺO_{ℂ_p} ⊆ A₀`, the `A₀`-ideal
`pᴺ𝔪_{ℂ_p}` is not finitely generated. This gives the ideal obstruction behind the
preceding class-level Check. The strongly noetherian Tate alternative
cannot be replaced by the noetherian-ring-of-definition alternative (Conrad seminar,
[Lecture 13, §13.3, p. 4](https://math.stanford.edu/~conrad/Perfseminar/Notes/L13.pdf),
the paragraph following Example 13.3.2, specialized to zero variables).

### R0.2 sheafiness of rings of noetherian type

This subsection proves Huber94 Theorem 2.2 in Case I, the case of a complete Huber ring with a
noetherian ring of definition; the Tate-ring case (Case II, strongly noetherian Tate rings) is Tau
Ceti's `TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian`. The route is Huber's: the algebraic Čech complex of
localisations is exact; completion preserves strict exactness; finite modules over a ring with a
noetherian ring of definition have strict linear maps, are complete, and complete to the base change;
the submodule blow-up `Proj(⊕ Jⁿ)` with its Artin–Rees statements makes the algebraic complex strict;
and the standard rational coverings refine every open covering.

**Exactness of the extended Čech complex of localisations.** (*localization-cech-complex-exact*) Let
`R` be a commutative ring, `f₁, …, fₙ ∈ R` elements generating the unit ideal and `M` an `R`-module.
Define the extended alternating Čech complex
`0 → M → ∏_{i₀} M_{f_{i₀}} → ∏_{(i₀,i₁)} M_{f_{i₀}f_{i₁}} → ⋯`, with products over strictly increasing tuples
`1 ≤ i₀ < ⋯ < i_p ≤ n`, differential `(ds)_{i₀…i_{p+1}} = Σ_j (−1)^j s_{i₀…î_j…i_{p+1}}`
(mapped to `M_{f_{i₀}⋯f_{i_{p+1}}}`) and augmentation `m ↦ (m/1)_{i₀}`; the complex itself is a new
construction, Mathlib having no Čech complex of localisations. Prove that it is exact (Stacks Tag
01X9, Lem. 30.2.1, whose proof is the module statement: the Čech complex of `M̃` is the complex of
localisations `M_{f_{i₀}⋯f_{i_p}}`; Huber94 §2, proof of (1.3), p. 527, which uses exactness of the
algebraic Čech complex (**) of the localisations before completing). This is the form used in
*noetherian-rod-laurent-cech-strict*, with terms `cechLocalizationTerm`, augmentation
`cechLocalizationAugmentation`, differential `cechLocalizationDifferential`, and exactness
`cechComplexLocalization_exact`. In every degree `p : ℕ`, the differential deletes position
`k : Fin (p + 2)` using `Fin.succAbove` and sums the corresponding localization maps with
coefficient `(−1)^k`. Each restriction is `LocalizedModule.lift` of the canonical map from
`M`: the product on the deleted face is a factor of the full product, so its powers act
invertibly on the target. This formula needs no unit-ideal hypothesis; that hypothesis is
used for exactness. For `R = K[T]`, `f₁ = T`,
`f₂ = 1 − T` and `M = R` the alternating complex `0 → R → R_T × R_{1−T} → R_{T(1−T)} → 0` is exact.
For `n = 0` the
hypothesis forces `R = 0` and every term vanishes; for `n = 1` and `f₁` a unit the alternating
complex is `0 → M → M_{f₁} → 0`. The sheaf form of this exactness — acyclicity of quasi-coherent
sheaves on affine schemes — is Tau Ceti's
`Scheme.Modules.subsingleton_cohomology_succ_of_isQuasicoherent`, with the Čech-to-derived
framework `quasiIso_cechAugmentation_iff`, and JacobianChallenge layer B states the Čech form on
schemes; Mathlib has only `exact_of_localized_span`. The module-level complex and its exactness,
needed before completion, are what this target states. *Needs:* Mathlib `exact_of_localized_span`,
`IsLocalizedModule.map_exact`, `IsLocalization.Away`, `LocalizedModule`; Tau Ceti
`TauCeti.AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_succ_of_isQuasicoherent`,
`TauCeti.quasiIso_cechAugmentation_iff`.
Lean: README target.

**Checks.** These test `cechLocalizationTerm`, `cechLocalizationAugmentation` and
`cechLocalizationDifferential`, with the increasing-tuple convention.

- *Negative control.* For the empty family over `ℤ`, every
  nonaugmented term is zero and the differential is zero, but the augmentation from `ℤ` is not
  injective. The unit-ideal hypothesis is essential.
- *Compatibility.* The one-element family `(1)` gives
  `0 → ℤ → ℤ → 0`, with bijective augmentation and zero differential.
- *Sign computation.* For `(1,1)`, the differential sends
  `(2,5)` to `5 − 2 = 3`; it sends the augmentation `(7,7)` to zero.
- For `(1,1,1)`, the degree-one
  cochain with values `s₀₁ = 2`, `s₀₂ = 5`, `s₁₂ = 7` maps to `7 − 5 + 2 = 4`.
- For `(1,1,1,1)`, the degree-two
  cochain with values `s₀₁₂ = 2`, `s₀₁₃ = 5`, `s₀₂₃ = 7`, `s₁₂₃ = 11` maps to
  `11 − 7 + 5 − 2 = 7`.
- For any commutative ring,
  module and `n`-element family, `n ≤ p + 1` makes the degree-`p` differential zero,
  since its target has no increasing `(p + 2)`-tuples.

**Completion of a strict exact complex is strict exact.** (*strict-complex-completion-exact*) Let
`C⁰ → C¹ → ⋯` be a complex of abelian topological groups, not necessarily Hausdorff, each with a
countable fundamental system of neighbourhoods of `0` consisting of open subgroups, and with
continuous differentials. Prove that if the complex is exact and every differential is strict
(continuous, and open onto its image with the subspace topology), then the complex `Ĉ⁰ → Ĉ¹ → ⋯` of
Hausdorff completions (Mathlib `UniformSpace.Completion` for the group uniformity) is exact and its
differentials are strict; `StrictComplex.range_completion_eq_closure` identifies the image
of `d̂` with the closure in the completed target of the original image. This is Bourbaki, *Commutative Algebra*, Ch. III, §2, no. 12, Lemma 2 (Huber’s reference [B2]) (Huber94 §2, proof of (1.3), p. 527). The Hausdorff
hypothesis is not needed and is not assumed: the terms to which this is applied in
*noetherian-rod-module-completion-tensor* and *noetherian-rod-laurent-cech-strict* are modules over
possibly non-Hausdorff Huber rings, and can be indiscrete or non-separated. The strict exact complex
`0 → B → B_f × B_g → B_{fg} → 0` of localisations with adic topologies completes to the exact complex
of completed localisations used in Huber's (1.3). An indiscrete term completes to `0`, so the
hypotheses on the uncompleted complex (exact, strict) cannot be weakened to hypotheses on the
completed one.
*Needs:* Mathlib `UniformSpace.Completion`; Tau
Ceti `UniformSpace.Completion.isOpen_closure_image_coe`.
Lean: README target.

**Linear maps of finite modules over a Huber ring with a noetherian ring of definition are strict.**
(*noetherian-rod-module-topology-strict*) Let `A` be a Huber ring with a pair of definition
`(A₀, I)` (Tau Ceti `PairOfDefinition A`) such that `A₀` is a noetherian ring; completeness is not
assumed. For a finitely generated `A`-module `M`, the natural topology of `M` is the module topology
(Mathlib `IsModuleTopology A M`: the finest topology making `M` a topological `A`-module); for every
finitely generated `A₀`-submodule `M₀ ⊆ M` generating `M` over `A`, the subgroups `IⁿM₀` (`n ≥ 0`)
form a fundamental system of open neighbourhoods of `0` (Huber94 §2, before Lem. 2.3, p. 524); this
description of the natural topology needs no noetherian hypothesis (two such `M₀`, `M₀'` satisfy
`I^k M₀ ⊆ M₀'` for some `k`), and is recorded as a neighbourhood-basis statement for the
natural topology. Prove
that for finitely generated `A`-modules `M` and `N` with their natural topologies, every `A`-linear
map `u : M → N` is strict: it is continuous, and `u : M → u(M)` is open for the subspace topology on
`u(M) ⊆ N` (Huber94 §2, Lem. 2.3(i), p. 525; Huber94 §2, proof of Lem. 2.3, p. 525, reducing (i) to
the noetherian adic case by the Artin–Rees argument; EGA I Ch. 0, §7.3, Thm (7.3.2), p. 66, Krull and
Artin–Rees: the `I`-adic topology of a finite module induces the `I`-adic topology on a submodule).
For `A = ℤ_p⟨T⟩` (ring of definition itself, ideal `(p)`) the inclusion of the ideal `(T)` into `A`
is strict: the subspace topology on `(T)` is the `p`-adic topology of `(T) ≅ A`. Outside the
hypothesis the statement fails: for the Tate ring `A = C(ℤ_p, ℚ_p)` (supremum norm, ring of
definition the functions with values in `ℤ_p`, not noetherian), multiplication by the function
`x ↦ x` is an `A`-linear map `A → A` with non-closed image, hence not strict (a strict map of
complete metrisable groups has complete, hence closed, image). The Tate case is Tau Ceti's
`LinearMap.isStrictMap_of_module_finite`, whose hypotheses are a complete T0 countably generated
Tate ring `A`, a finite complete first-countable `M` and `IsNoetherian A N` on the target module —
no noetherian hypothesis on the ring and no continuity of `u`; this target is the
noetherian-ring-of-definition case, where `A` need be neither Tate nor complete. For `A₀ = A` an
adic noetherian ring the continuity of `u` is clause (i) of *noetherian-rod-module-topology-strict*. *Needs:* Tau Ceti
`TauCeti.Huber.PairOfDefinition`, `LinearMap.isStrictMap_of_module_finite`; Mathlib `IsModuleTopology`,
`IsModuleTopology.continuous_of_linearMap`, `Ideal.exists_pow_inf_eq_pow_smul`,
`IsModuleTopology.isOpenQuotientMap_of_surjective`, `IsModuleTopology.instPi`.
`Huber.PairOfDefinition.isStrictMap_of_isNoetherianRing` carries `P : PairOfDefinition A`,
`IsNoetherianRing P.ringOfDefinition`, finite `A`-modules `M`, `N` and their natural module
topologies, and concludes `IsStrictMap u` for every `A`-linear `u : M →ₗ[A] N`.
The Artin–Rees proof precedes finite-module completeness.

**Checks.**

- Multiplication by `T` on the uncompleted `ℤ_p[T]` with its `p`-adic topology is strict;
  finite-module completeness is not available or needed.
- The inclusion `(T) → ℤ_p⟨T⟩` is strict for the `p`-adic natural topology.
- On `C(ℤ_p,ℚ_p)`, multiplication by `x ↦ x` has non-closed image and is not strict,
  distinguishing the noetherian-ring-of-definition hypothesis.

Lean: README target.

**Finite modules over a complete Huber ring with a noetherian ring of definition are complete, with
closed submodules.** (*noetherian-rod-module-complete*) Let `A` be a complete Hausdorff Huber ring
with a pair of definition `(A₀, I)` such that `A₀` is noetherian, and let `M` be a finitely generated
`A`-module with its natural topology (*noetherian-rod-module-topology-strict*). Prove that `M` is
complete and Hausdorff, and that every `A`-submodule of `M` is closed in `M`; and that for every
finitely generated `A₀`-submodule `M₀ ⊆ M` generating `M`, `M₀` is open in `M` and `I`-adically
complete and separated (Huber94 §2, Lem. 2.3(ii), p. 525; Huber94 §2, proof of Lem. 2.3, p. 525,
the reduction to finite modules over noetherian adic rings; EGA I Ch. 0, §7.3, Cor. (7.3.6), p. 68,
finite modules over a noetherian adic ring are separated and complete). For `A = ℤ_p⟦T⟧`
(`(p, T)`-adic) every ideal is closed and `A/(pT)` is complete; `M = ℤ_p⟨T⟩/(T − p) ≅ ℤ_p` over
`A = ℤ_p⟨T⟩` is complete, and its submodule `pM` is closed. The strongly noetherian Tate case is
Tau Ceti's `completeSpace_moduleTopology`, `IsTateRing.t2Space_moduleTopology` and
`isClosed_of_isNoetherian`; for `A₀ = A` an adic noetherian ring the completeness is Tau Ceti's
`IsAdicComplete.of_finite` (recorded, not restated, in *noetherian-rod-module-complete*)
and the closedness of submodules follows from it with Artin–Rees. This target is the
noetherian-ring-of-definition case for
a Huber ring that need not be Tate. *Needs:*
*noetherian-rod-module-topology-strict*; Tau Ceti
`TauCeti.completeSpace_moduleTopology`, `TauCeti.Huber.IsTateRing.t2Space_moduleTopology`,
`TauCeti.Huber.isClosed_of_isNoetherian`; Mathlib `hI.isAdicComplete_iff` (for `hI : IsAdic I`),
`IsAdicComplete.le_jacobson_bot`, `IsHausdorff.of_le_jacobson`,
`IsModuleTopology.isOpenQuotientMap_of_surjective`, `IsModuleTopology.instPi`,
`QuotientGroup.completeSpace_right`, `AdicCompletion.of_bijective_iff`,
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`.
`Huber.PairOfDefinition.completeSpace_isClosed_of_isNoetherianRing` carries a complete
Hausdorff Huber ring `A`, a pair `P` with noetherian ring of definition and a finite
`A`-module `M` with its natural topology: `M` is complete Hausdorff and every submodule is
closed. `Huber.PairOfDefinition.isOpen_isAdicComplete_of_isNoetherianRing` adds a finite
`P.ringOfDefinition`-submodule `M₀ ⊆ M` generating `M` over `A`, and states that `M₀` is open
and `IsAdicComplete P.idealOfDefinition M₀`. Deduce these from strictness and completeness
of the base, with the induced topology on `M₀`.

**Checks.**

- `ℤ_p⟦T⟧/(pT)` is complete and its submodule generated by `p` is closed.
- For `M = ℤ_p⟨T⟩/(T-p) ≅ ℤ_p`, the submodule `pM` is closed and complete.
- For the uncompleted `A = ℤ` with its `p`-adic topology, the finite module `M = A`
  is not complete; completeness of the base cannot be omitted.

Lean: README target.

**Completion of a finite module over a Huber ring with a noetherian ring of definition is base
change to `Â`.** (*noetherian-rod-module-completion-tensor*) Let `A` be a Huber ring with a pair of
definition `(A₀, I)` such that `A₀` is noetherian, `Â` its completion (Tau Ceti
`IsHuberRing.completion`), and `M` a finitely generated `A`-module with its natural topology.
`PairOfDefinition.completionTensorEquiv` requires both `[Module.Finite A M]` and
`[IsModuleTopology A M]`, as well as uniform continuity of scalar multiplication.
Prove that the canonical map `M ⊗_A Â → M̂` to the Hausdorff completion of `M` is an isomorphism of
topological `Â`-modules, where `M ⊗_A Â` carries its natural `Â`-module topology; in particular
`M ⊗_A Â` is complete and Hausdorff (Huber94 §2, Lem. 2.3(iii), p. 525; Huber94 §2, proof of Lem.
2.3, p. 525: "(iii) is a consequence of (ii)"). For `A = ℤ_p[T]` with the `p`-adic topology and
`M = A/(T)`, `M ⊗_A Â = ℤ_p⟨T⟩/(T) = ℤ_p = M̂`. For the uncompleted rational localisation `B(F/f)`
(ring `B_f` with ring of definition `C[F/f]`) and a finite `B`-module `P`,
`(P ⊗_B B_f) ⊗ B⟨F/f⟩` is the completion of `P_f`; this identifies Huber's completed complex (**)^
with (*). The Hausdorff property is not part of the hypotheses: for `A = ℤ` with the `p`-adic
topology and `M = ℤ/ℓ` (`ℓ ≠ p`), `M` is indiscrete (`p` acts invertibly), so `M̂ = 0 = M ⊗_ℤ ℤ_p`,
and `0 → ℓℤ → ℤ → ℤ/ℓ → 0` is strict but not a sequence of Hausdorff groups.
*Needs:*
*noetherian-rod-module-topology-strict*; *noetherian-rod-module-complete*;
*strict-complex-completion-exact*; *noetherian-adic-completion*; Tau Ceti
`TauCeti.Huber.IsHuberRing.completion`; Mathlib `IsModuleTopology`,
`IsModuleTopology.isOpenQuotientMap_of_surjective`, `IsModuleTopology.isQuotientMap_of_surjective`,
`IsModuleTopology.instPi`.
Lean: README target.

**Spec of a Huber ring and of an open subring agree away from the open primes.**
(*open-subring-spec-isomorphism*) Let `A` be a Huber ring and `B ⊆ A` an open subring. Let
`T ⊆ Spec B` be the set of open prime ideals of `B` (a closed subset) and `f : Spec A → Spec B` the
morphism induced by the inclusion. Prove that `f⁻¹(T)` is the set of open prime ideals of `A`, and
that `f` restricts to an isomorphism of schemes `Spec A ∖ f⁻¹(T) → Spec B ∖ T`. Concretely, for every
topologically nilpotent `s ∈ B` the map of localisations `B_s → A_s` is bijective (`sⁿa ∈ B` because
`B` is open), and the open sets `D(s) ⊆ Spec B` for such `s` cover `Spec B ∖ T`. For `B = A₀` a ring
of definition with ideal of definition `I` this reads `Spec A ∖ V(I·A) ≅ Spec A₀ ∖ V(I)` (Huber93 §3,
Lem. 3.7, p. 469, and its proof; Huber94 §2, proof of (1.3.1)(i), p. 528, for the use in Case I).
For `A = ℚ_p⟨T⟩` and `B = A₀ = ℤ_p⟨T⟩`: `T = V(p)`, `f⁻¹(T) = ∅` and
`Spec ℚ_p⟨T⟩ ≅ Spec ℤ_p⟨T⟩ ∖ V(p)`, i.e. `A = A₀[1/p]`; for a discrete ring `A` and `B` its prime
subring every prime is open and both complements are empty. *Needs:* Tau Ceti
`TauCeti.Huber.IsHuberRing`, `TauCeti.Huber.PairOfDefinition`,
`TauCeti.Huber.PairOfDefinition.isTopologicallyNilpotent_of_mem_idealOfDefinition`; Mathlib
`IsLocalization.Away`, `AlgebraicGeometry.Spec`, `PrimeSpectrum.basicOpen`,
`AlgebraicGeometry.morphismRestrict`, `AlgebraicGeometry.IsZariskiLocalAtTarget.iff_of_iSup_eq_top`.

For every Huber ring `A` and open subring `B`, with the induced topology on `B`, the target
consists of three statements: `T` is Zariski closed; the displayed inverse-image equality holds
for `Spec.map B.subtype`; and the `morphismRestrict` of `Spec.map B.subtype` to the open
complement of `T` is an isomorphism (`IsIso`). Its source is therefore exactly
the open subscheme on the non-open primes of `A`. These statements require neither
completeness nor noetherianity (Huber93, Lemma 3.7, p. 469). Lean: README target.

Checks:

- For discrete `A`, every prime of `A` and of any
  subring `B` is open, so both complements are empty.
- For Tate `A` and open `B`, the inverse image of
  `T` is empty; the source of the restricted morphism is all of `Spec A`, even
  when `T` is nonempty as for the ring of definition `ℤ_p⟨T⟩` above.
- For the full subring `B = A`, the restricted
  inclusion is an isomorphism on the complement of the open primes.

**The blow-up scheme `Proj(⊕ Jⁿ)` of a finitely generated submodule.** (*submodule-blow-up*) Let
`φ : C → B` be a ring homomorphism, `F = {f₀, …, fₙ} ⊆ B` a finite subset and `J ⊆ B` the
`C`-submodule generated by `F`. Let `R(J) := ⊕_{n≥0} Jⁿ·Tⁿ ⊆ B[T]` (`J⁰ := φ(C)`; for `n ≥ 1`, `Jⁿ`
is the additive subgroup generated by the products `j₁⋯jₙ`, `j_i ∈ J`), an `ℕ`-graded ring (Mathlib
`GradedAlgebra`) generated over `R(J)₀ = φ(C)` by the degree-one elements `f·T`, `f ∈ F`. Put
`Y := Proj R(J)` with `g : Y → Spec C` the composite of Mathlib's `Proj.toSpecZero` and
`Spec(C → φ(C))`. `R(J)`, `Y`, `g`, the covering in (a) and the chart rings in (b) need no hypothesis
on `F` (Huber's (1.1) allows any `C`-submodule `J`). Assume now that `F` generates the unit ideal of
`B` (`F·B = B`). The evaluation `R(J) → B`, `T ↦ 1`, maps the irrelevant ideal onto an ideal
containing `F`, hence onto `B`, and so defines `s : X := Spec B → Y` (Mathlib
`Proj.fromOfGlobalSections`) with `g ∘ s = Spec φ`; this is Huber's diagram (1.1) in the case
`I := J·B = B`, where `X = Proj(⊕ Iⁿ) = Spec B` (Huber94 §2, proof of Thm 2.5, Case I, (1.1),
p. 526). Properties (Huber (1.2)(i),(ii)): (a) the opens `D₊(f·T)`, `f ∈ F`, cover `Y` and
`s⁻¹(D₊(f·T)) = D(f)`, so `s` is affine (Huber94 §2, (1.2)(i), p. 526); (b) for a nonempty `S ⊆ F`
with product `t = ∏_{f∈S} f`, the open `U = D₊(t·T^{|S|})` is affine with
`O_Y(U) = C[f/f' : f ∈ F, f' ∈ S] ⊆ B_t` (the `φ(C)`-subalgebra of the localisation `B_t` generated
by these fractions) and `O_X(s⁻¹U) = B_t` (Huber94 §2, (1.2)(ii), p. 526); (c) `g` is projective,
hence proper and separated, and `Y` is noetherian when `C` is. The hypothesis `F·B = B` is used
exactly for the morphism `s` and every statement involving it (`s⁻¹(D₊(f·T)) = D(f)`, `s` affine,
`g ∘ s = Spec φ`, `O_X(s⁻¹U) = B_t`). The case `C = B` with `J` an ideal is Tau Ceti's: the graded
ring is `reesAlgebra.grade`/`reesAlgebra.gradedAlgebra` with
`irrelevant_eq_span_monomialDegreeOne`, the covering (a) is `affineBlowupι`,
`opensRange_affineBlowupι` and `iSup_opensRange_affineBlowupι`, and the chart (b) for `|S| = 1` is
`reesAlgebra.awayEquivAffineBlowup`; StableReduction layer 4 states the ideal blow-up as a relative
Proj with the same affine charts. This target is the case of a finitely generated `C`-submodule
`J ⊆ B` over a ring map `φ`, which Huber's (1.1) needs because `C` is a ring of definition of the
Huber ring `B`, and it specialises to those declarations. In `AlgebraicGeometry`, define `submoduleBlowup φ F` as the scheme
`Y = Proj R(J)` (no hypothesis on `F`), `submoduleBlowup.gradedRing` as the graded ring
`R(J) = ⊕ Jⁿ·Tⁿ ⊆ B[T]` with its `GradedAlgebra` structure, generated in degree one by `F·T`,
`submoduleBlowup.toSpec` as the composite
`Proj.toSpecZero (submoduleBlowup.gradedRing C F) ≫ Spec.map (algebraMap C (R(J)₀))`
and `submoduleBlowup.fromSpec` as `s : Spec B → Y`, constructed by
`Proj.fromOfGlobalSections` from evaluation `T ↦ 1` on `R(J)` followed by
`Scheme.ΓSpecIso.inv : B → Γ(Spec B, ⊤)`, taking the hypothesis `Ideal.span F = ⊤` in
`B`; prove `submoduleBlowup.fromSpec_toSpec` (`s ≫ g = Spec φ`),
`submoduleBlowup.fromSpec_preimage_basicOpen` (`s⁻¹(D₊(f·T)) = D(f)` for `f ∈ F`),
`submoduleBlowup.iSup_basicOpen_eq_top` (the `D₊(f·T)`, `f ∈ F`, cover `Y`),
`submoduleBlowup.isAffineHom_fromSpec` (a theorem: `s` is an affine morphism),
`submoduleBlowup.basicOpenIsoSpec` (for nonempty `S ⊆ F` with product `t`,
`D₊(t·T^{|S|}) ≅ Spec C[f/f' : f ∈ F, f' ∈ S]`, the subring of `B_t`; no hypothesis on `F`),
and `submoduleBlowup.basicOpenIsoSpec_inv_comp`: with `e` this isomorphism and
`U = D₊(t·T^{|S|})`, prove
`e.inv ≫ U.ι ≫ submoduleBlowup.toSpec C F = Spec.map (algebraMap C C[F/S])`.
This equality uses the specified coefficient map into the fraction subalgebra, for arbitrary
commutative `C`-algebras `B` and nonempty `S ⊆ F` (Huber94 §2, proof of Thm 2.5,
Case I, (1.2)(ii), p. 526). For the same hypotheses, prove
`submoduleBlowup.basicOpenIsoSpec_hom_generator`: for every `f ∈ F` and `f′ ∈ S`,
pullback by `e.hom`, expressed through Mathlib's `Proj.basicOpenIsoSpec` and
`Scheme.ΓSpecIso`, sends `f/f′` to the homogeneous fraction `(fT)/(f′T)`.
Writing `a = ∏_{g∈S} gT`, this is `HomogeneousLocalization.Away.mk` with denominator
`a` and numerator `(fT) ∏_{g∈S.erase f′} gT`, both of degree `|S|`.
Together with the coefficient equation, these generator values determine the chart
ring map (Huber94 §2, proof of Thm 2.5, Case I, (1.2)(ii), p. 526). Also prove
`submoduleBlowup.isProper_toSpec` (a theorem: `g` is proper, indeed projective, and `Y` is
noetherian when `C` is), `submoduleBlowup.reesRing_eq_reesAlgebra` (for `B = C`, `φ = id` and
`𝔞 = span F`, equality with Mathlib's `reesAlgebra 𝔞`),
`submoduleBlowup.gradedRing_eq_reesAlgebra` (for every degree n, the images of
`gradedRing C F n` and `TauCeti.reesAlgebra.grade 𝔞 n` in C[T] are equal;
the formal right-hand side is their common ambient submodule `{aTⁿ : a ∈ 𝔞ⁿ}`) and `submoduleBlowup.isIso_toSpec_restrict`
(the statement of *submodule-blow-up-isomorphism-away*: `g` is an isomorphism over `Spec C ∖ V(H)`
under Huber's hypothesis (1.2)(iii)). For `C = ℤ_p⟨T⟩ ⊆ B = ℚ_p⟨T⟩` and `F = {p, T}` (`p` is a unit
of `B`), `J = (p, T)` is an ideal of `C`, `R(J)` is the Rees algebra of `(p, T)` and `Y` is the
blow-up of `Spec ℤ_p⟨T⟩` in `(p, T)`, with the two charts `Spec ℤ_p⟨T⟩[T/p]` and `Spec ℤ_p⟨T⟩[p/T]`;
`s` maps `Spec ℚ_p⟨T⟩` into the complement of the exceptional divisor. Huber's construction is
recovered: the charts `C[F/f]` are the rings of definition of the rational localisations `B(F/f)`
used in *blow-up-cech-filtration-neighbourhoods*. *Needs:* Mathlib `GradedAlgebra`,
`AlgebraicGeometry.Proj.toSpecZero`, `AlgebraicGeometry.Proj.fromOfGlobalSections`,
`AlgebraicGeometry.Proj.fromOfGlobalSections_preimage_basicOpen`,
`AlgebraicGeometry.Proj.fromOfGlobalSections_toSpecZero`,
`AlgebraicGeometry.Proj.iSup_basicOpen_eq_top`, `AlgebraicGeometry.Proj.basicOpenIsoSpec`,
`HomogeneousLocalization.Away`, `AlgebraicGeometry.Proj.isSeparated`,
`AlgebraicGeometry.Proj.valuativeCriterion_existence`, `AlgebraicGeometry.IsAffineHom`,
`AlgebraicGeometry.IsProper`, `reesAlgebra`, Mathlib's closed immersion `Spec` of a surjection,
`AlgebraicGeometry.LocallyOfFiniteType.isLocallyNoetherian`, `AlgebraicGeometry.IsNoetherian`; Tau
Ceti `TauCeti.reesAlgebra.grade`, `TauCeti.reesAlgebra.gradedAlgebra`,
`TauCeti.irrelevant_eq_span_monomialDegreeOne`, `TauCeti.reesAlgebra.awayEquivAffineBlowup`,
`TauCeti.AlgebraicGeometry.affineBlowupι`, `TauCeti.AlgebraicGeometry.opensRange_affineBlowupι`,
`TauCeti.AlgebraicGeometry.iSup_opensRange_affineBlowupι`.
Lean: README target.

**Checks.**

- *Degenerate.* For `F = {1}` (so `J = φ(C)`), `R(J) = φ(C)[T]`,
  `Y ≅ Spec φ(C)` and `s = Spec(φ : C → B)` corestricted; `g` is the closed immersion
  `Spec φ(C) → Spec C`.
- *Computation.* For `C = ℤ_p⟨T⟩ ⊆ B = ℚ_p⟨T⟩` and
  `F = {p, T}`, `O_Y(D₊(pT')) = ℤ_p⟨T⟩[T/p]` and `O_Y(D₊(TT')) = ℤ_p⟨T⟩[p/T]` inside `ℚ_p⟨T⟩` and
  `ℚ_p⟨T⟩_T` respectively (`T'` the grading variable).
- For `C = B = ℤ` and `F = {2}`, the Rees ring contains `2T` and excludes `T`: its degree-one coefficients are even.
- For `C = B = ℤ` and `F = {0, 1}`, the inverse image of `D₊(0T)` is empty and that of `D₊(1T)` is all of `Spec ℤ`.
- *Non-example.* For `C = B = ℤ_p⟨T⟩` and `F = {p, T}`,
  `F·B ≠ B` and there is no morphism `s : Spec B → Y` with `s⁻¹(D₊(f·T)) = D(f)` for `f ∈ F`: the
  prime `(p, T)` of `B` lies in no `D(f)`, `f ∈ F`.

**The submodule blow-up is an isomorphism away from the centre.**
(*submodule-blow-up-isomorphism-away*) In the situation of *submodule-blow-up* (`φ : C → B`, `F ⊆ B`
finite with `F·B = B`, `J = ∑_{f∈F} C·f`, `Y = Proj R(J)`, `g : Y → Spec C`), let `H ⊆ C` be an ideal
such that `Spec φ` restricts to an isomorphism `Spec B ∖ V(H·B) → Spec C ∖ V(H)`. Prove that `g`
restricts to an isomorphism `g⁻¹(Spec C ∖ V(H)) → Spec C ∖ V(H)`. In particular, if `B` is a Huber
ring, `C ⊆ B` a ring of definition with ideal of definition `I` and `φ` the inclusion, then `g` is an
isomorphism over `Spec C ∖ V(I)` (Huber94 §2, (1.2)(iii), p. 526; Huber94 §2, proof of (1.3.1)(i),
p. 528, its application with `H = I`). For `C = ℤ_p⟨T⟩ ⊆ B = ℚ_p⟨T⟩`, `F = {p, T}` and
`H = I = (p)`: over `Spec ℤ_p⟨T⟩[1/p] = Spec ℚ_p⟨T⟩` the blow-up of `(p, T)` is an isomorphism, since
`(p, T)` becomes the unit ideal after inverting `p`. The hypothesis `F·B = B` is used: for
`C = B = k[x, y]`, `F = {x, y}` and `H = C` (so `Spec φ = id` and `V(H) = ∅`), `Y` is the blow-up of
the plane at the origin and `g` is not an isomorphism, its fibre over `(x, y)` being `ℙ¹_k`; over
`D(h) ⊆ Spec C ∖ V(H)` the proof uses that `J_h = F·B_h = B_h`, whose Rees algebra is `B_h[T]`. For
`C = B` and `J` an ideal this is the behaviour of the ideal blow-up away from its centre, read off
Tau Ceti's charts `affineBlowupι` and stated as such by StableReduction layer 4; the submodule
case over a ring map is new.
*Needs:* *submodule-blow-up*;
*open-subring-spec-isomorphism*; Mathlib `AlgebraicGeometry.Proj.basicOpenIsoSpec`,
`IsLocalization.Away`.
Lean: README target.

**Deep Čech cocycles are coboundaries from a fixed level.** (*blow-up-cech-artin-rees*) Let `B` be a
Huber ring with a pair of definition `(C, I)` such that `C` is noetherian (`I` finitely generated),
let `F = {f₀, …, fₙ} ⊆ B` generate the unit ideal, `J = ∑ C·f_i`, and let `g : Y = Proj R(J) → Spec C`
and `s : Spec B → Y` be as in *submodule-blow-up*. Let `P` be a finitely generated `B`-module and
`N ⊆ P` a finitely generated `C`-submodule generating `P` over `B`; let `𝒢 ⊆ s_*(P̃)` be the image of
the morphism `σ : g*(Ñ) → s_*(P̃)` adjoint to `Ñ → g_*s_*(P̃) = (P as a C-module)~` induced by
`N ⊆ P`, a coherent `O_Y`-module (Huber94 §2, proof of (1.3), p. 527). For `i ≥ 1` let `K_i^•` be the
augmented Čech complex of `Iⁱ𝒢` for the affine open covering `𝔘 = {D₊(f₀T), …, D₊(fₙT)}` of `Y`
(degree `−1`: global sections), and let `K_0^•` be that of `s_*(P̃)`; since
`s_*(P̃) ⊇ 𝒢 ⊇ I𝒢 ⊇ I²𝒢 ⊇ ⋯` these are subcomplexes `K_0 ⊇ K_1 ⊇ K_2 ⊇ ⋯`, and `K_0^•` is the
augmented Čech complex (**) `0 → P → ∏ P_{f_{i₀}} → ∏ P_{f_{i₀}f_{i₁}} → ⋯` of `P̃` for the covering
`D(f₀), …, D(fₙ)` of `Spec B` (`s⁻¹D₊(f_iT) = D(f_i)`). Write `d_i^p : K_i^p → K_i^{p+1}` for the
differentials. Prove that for every `p ∈ ℤ` and every `u ≥ 1` there is `v ≥ u` with
`ker(d_v^{p+1}) ⊆ im(d_u^p) = d^p(K_u^p)` (Huber94 §2, (1.3.1)(i), p. 527: "Given `p ∈ ℤ` and
`u ∈ ℕ` there exists `v ∈ ℕ₀` with `im(d_u^p) ⊇ ker(d_v^{p+1})`"; Huber94 §2, proof of (1.3.1)(i),
p. 528: Čech cohomology of the complexes `K_i` is the sheaf cohomology of `Iⁱ𝒢`, and the torsion
statement (2) comes from the vanishing of `R^{p+1}g_*` off `V(I)`; EGA III₁ Ch. III, (3.3.2) Cor.,
p. 118, finiteness of `⊕ H^p(X, m^k F)` over the Rees algebra, used for Huber's (1)). For
`B = ℤ_p⟨T⟩` (`C = B`, `I = (p)`), `F = {1, T}` and `P = B`: `J = C`, `Y = Spec C`, `g = id`,
`𝒢 = O_Y` and the complexes `K_i` are the Čech complexes of `pⁱO_Y` for the covering
`{D(1), D(T)} = {Spec C, D(T)}`, which are exact in positive degrees; the claim holds with `v = u`.
For `p = −1` the claim reads `Γ(Y, I^v𝒢) ⊆ Γ(Y, I^u𝒢)` and holds with `v = u`. For `p = −2` the
term `K_u^{−2}` is zero but `K_v^{−1}` is not: the claim says that the augmentation
`Γ(Y, I^v𝒢) → K_v^0` is injective, which is the sheaf property of `I^v𝒢` on the covering `𝔘`, so
it holds with `v = u`. For `p ≤ −3` all terms vanish. `NoetherianCech.ker_le_range` states the nonnegative-degree case, with `N`
a finite set of `B`-module generators of `P` and the corresponding `C`-submodule its `C`-span. *Needs:* *submodule-blow-up*;
*submodule-blow-up-isomorphism-away*;
*open-subring-spec-isomorphism*; *localization-cech-complex-exact*;
the proper coherent direct-image finiteness theorem (StableReduction layer 2), applied to the Rees algebra on the projective blow-up; Tau Ceti
`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`; Mathlib `AlgebraicGeometry.Scheme.Modules`,
`AlgebraicGeometry.tilde`, `Module.support_eq_zeroLocus`, `Ideal.exists_pow_le_of_le_radical_of_fg`.
Lean: README target.

**The Čech complexes of `Iⁱ𝒢` form a neighbourhood basis in the natural topology.**
(*blow-up-cech-filtration-neighbourhoods*) In the situation of *blow-up-cech-artin-rees* (`B` a Huber
ring with noetherian ring of definition `C` and ideal of definition `I`, `F = {f₀, …, fₙ}` generating
the unit ideal, `J = ∑ C·f_i`, `g : Y = Proj R(J) → Spec C`, `s : Spec B → Y`, `P` a finitely
generated `B`-module, `N ⊆ P` a finitely generated `C`-submodule generating `P`, `𝒢 ⊆ s_*(P̃)` the
image of `σ : g*(Ñ) → s_*(P̃)`, `K_i^•` the augmented Čech complexes of `Iⁱ𝒢` for
`𝔘 = {D₊(f₀T), …, D₊(fₙT)}` and `K_0^•` that of `s_*(P̃)`, with `K_0 ⊇ K_1 ⊇ K_2 ⊇ ⋯` and `K_0^•` the
augmented Čech complex (**) of `P̃` for the covering `D(f₀), …, D(fₙ)` of `Spec B`), give `P` its
natural topology as a `B`-module and, for `S = {f_{i₀}, …, f_{i_p}} ⊆ F` with product `t`, give
`P_t = P ⊗_B B_t` its natural topology over the Huber ring `B(F/S)` (the uncompleted rational
localisation: the ring `B_t` with ring of definition `C[f/f' : f ∈ F, f' ∈ S]` and ideal of
definition `I·C[f/f']`, Tau Ceti `PairOfDefinition.locSubring`, `PairOfDefinition.locIdeal`), and
`K_0^p` the product topology. Prove that for every `p ∈ ℤ` the subgroups `K_i^p` (`i ≥ 1`) form a
fundamental system of neighbourhoods of `0` in `K_0^p` (Huber94 §2, (1.3.1)(ii), p. 527; Huber94 §2,
proof of (1.3.1)(ii), p. 528: the case `p ≥ 0` from the chart description (1.2)(ii), the case
`p = −1` from EGA III 3.3.2). For `B = ℤ_p⟨T⟩`, `F = {1, T}`, `P = N = B`: `K_i^{−1} = pⁱB` and
`K_i^0 = pⁱB × pⁱ·B[1/T]`, the `p`-adic neighbourhood bases of `B` and of `B_T = B[1/T]` (ring of
definition `C[F/T] = B[1/T]`). *Needs:* *submodule-blow-up*;
*noetherian-rod-module-topology-strict*; *blow-up-cech-artin-rees*; Tau Ceti
`TauCeti.Huber.PairOfDefinition.locSubring`, `TauCeti.Huber.PairOfDefinition.locIdeal`; Mathlib
`Algebra.FiniteType.isNoetherianRing`, `AlgebraicGeometry.Proj.basicOpenIsoSpec`.
Lean: README target.

For any pair of definition `P` of a commutative topological ring `B`, assume
`hf : Ideal.span (Set.range f) = ⊤` for `f : Fin n → B`. Prove
`NoetherianCech.hasDenominatorPower`: for each degree `p : ℕ` and increasing face `S`,
the numerator set `T = {∏ k, f (j k) | j : Fin (p + 1) → Fin n}` and denominator
`t = ∏ k, f (S k)` satisfy `P.HasDenominatorPower T t (Localization.Away t)`.
Indeed `T` includes every `fᵢ^(p+1)`, so its span is the unit ideal and hence open;
apply the supplier `TauCeti.Huber.PairOfDefinition.hasDenominatorPower_of_isOpen_span` above.
This constructs the topology needed for Huber94 §2, (1.3.1)(ii), pp. 527–528.
`NoetherianCech.termTopology`, `termUniformSpace` and `termUniformAdd` all take `hf`;
no noetherian or finite-module assumption is needed for these constructions.

For the Čech complex, under `hf : Ideal.span (Set.range f) = ⊤`,
`Huber.NoetherianCech.termTopology` is the product of the natural module topologies on
the uncompleted rational localizations; `termUniformSpace` is its additive uniformity
and the theorem `NoetherianCech.termUniformAdd` proves `IsUniformAddGroup` for it. All three take `hf`, using
`NoetherianCech.hasDenominatorPower` for each face. `filtration_hasBasis` and `augmentation_hasBasis` identify the
powers-of-definition filtrations with the zero-neighbourhood bases under the finite-module,
noetherian-ring-of-definition and unit-cover hypotheses. `completed_exact_strict` states
exactness and strictness of the separated completed augmented complex (Huber94, §2,
(1.3) and (1.3.1)).

**Checks on the integral disc.** Fix a prime `p`, let `B = ℤ_p⟨T⟩` be
`weightedRestrictedSubring` at unit weight, and take the supplied pair of definition
obtained by applying `PairOfDefinition.weighted` to `(ℤ_p, (p))`.
Use the ordered family `(1, T)`, module `B`, and generator set `{1}`.
Degree zero of `cechLocalizationTerm` identifies with `E = B × B[1/T]` by the
canonical localization maps, carrying the augmentation to `b ↦ (b, b/1)`.
The chart rings of definition are respectively `B` and `B[1/T]`.

- For every `i ≥ 0`, membership
  in `NoetherianCech.filtration` becomes `(a, b) ∈ pⁱB × pⁱB[1/T]` under a
  `B`-linear equivalence with the specified augmentation. This computes `K_i⁰`.
- The augmentation of `pⁱ`
  belongs to `K_i⁰` and does not belong to `K_{i+1}⁰`, including `i = 0`.
- The sets `pⁱE`, `i ≥ 1`,
  form a zero-neighbourhood basis for `termTopology`.
- This topology is
  not discrete, and the nonzero augmentations of `pⁱ` converge to zero.
- The sets
  `{(x, y) | x − y ∈ pⁱE}`, `i ≥ 1`, form an entourage basis for `termUniformSpace`.
- This uniform
  space is Hausdorff and not complete. In the second factor the partial sums of
  `Σ_{j≥0} pʲT^{−j−1}` are Cauchy, but their limit has negative exponents with no
  lower bound and cannot lie in `B[1/T]`. Completion gives `ℤ_p⟨T, T⁻¹⟩` in that factor.

**Check (non-example).** The singleton
`X` in `ℤ[X]` does not generate the unit ideal. The same obstruction excludes the family
`(X)` in `B = ℤ_p⟨X⟩`. For the pair of definition `(B, (p))`, degree zero would require
`p^N/X` in the image of `B` in `B_X` for some `N`, since `B[X/X]` is that image.
Evaluation at `X = 0` shows that `X` cannot divide `p^N`, so the denominator-power
condition fails; the Check asserts `¬ P.HasDenominatorPower {T} T (Localization.Away T)`
for this supplied pair of definition. The Check also asserts that the Čech augmentation for the singleton family `(X)`
in `ℤ[X]` is not surjective: the section `1/X` has no polynomial preimage.

**Strict Čech exactness for standard rational coverings when `B` has a noetherian ring of
definition.** (*noetherian-rod-laurent-cech-strict*) Let `B` be a complete Hausdorff Huber ring with
a noetherian ring of definition `C` (ideal of definition `I ⊆ C`), `B⁺` a ring of integral elements,
`f₀, …, fₙ ∈ B` elements generating the unit ideal, and `P` a finitely generated `B`-module. Put
`U_i = R(f₀, …, fₙ / f_i) ⊆ Spa(B, B⁺)` and, for `i₀ < ⋯ < i_p`,
`U_{i₀…i_p} = U_{i₀} ∩ ⋯ ∩ U_{i_p}` (rational, with `𝒪(U_{i₀…i_p})` the completion
`B⟨F/f_{i₀}, …, F/f_{i_p}⟩` of the uncompleted rational localisation `B(F/f_{i₀}, …, F/f_{i_p})`,
whose ring is `B_{f_{i₀}⋯f_{i_p}}`). Give each `P ⊗_B 𝒪(U_{i₀…i_p})` its natural topology. Prove
that the augmented Čech complex (*)
`0 → P → ∏_{i₀} P ⊗_B 𝒪(U_{i₀}) → ∏_{i₀<i₁} P ⊗_B 𝒪(U_{i₀i₁}) → ⋯` is exact and all its
differentials are strict. This is Huber's (1.3) for `𝓕 = P ⊗ 𝒪_B`, stated with the terms written
out; the case `P = B` is the structure sheaf (Huber94 §2, proof of Thm 2.5, Case I, p. 526, which
introduces (1.3); Huber94 §2, (1.3), p. 526, hypotheses — `B` affinoid with noetherian ring of
definition, `f_i` generating the unit ideal, `P` finite — and conclusion — exactness and strictness
of the Čech complex of `P ⊗ 𝒪_B`; Huber94 §2, proof of (1.3), p. 527, the reduction to strictness of
the algebraic complex (**); Huber94 §2, end of the proof of (1.3), p. 528, strictness from
(1.3.1)(i),(ii)). For `B = ℤ_p⟨T⟩` with ring of definition `ℤ_p⟨T⟩` (`p`-adic) and `f₀ = 1`,
`f₁ = T` the covering `{|T| ≤ 1}`, `{|T| ≥ 1}` of `Spa(B, B)` gives an exact strict complex
`0 → B → B × ℤ_p⟨T, T⁻¹⟩ → ℤ_p⟨T, T⁻¹⟩ → 0`. Two degenerate charts show why the uncompleted terms
may be non-Hausdorff: for `B = C = ℤ_p`, `I = pℤ_p`, `F = {p, 1}`, the chart with denominator `p` has
algebraic ring `ℚ_p` with ring of definition `ℚ_p` and neighbourhoods `p^nℚ_p = ℚ_p`, so it is
indiscrete and its separated completion is `0` (the rational set `|1| ≤ |p| ≠ 0` is empty); for
`B = C = ℤ_p × ℤ_p`, `I = pB`, `f₀ = (p, 1)`, `f₁ = (1, 1)`, the chart at `f₀` has ring `ℚ_p × ℤ_p`
with neighbourhoods `ℚ_p × p^nℤ_p`, separation kernel `ℚ_p × {0}` and separated completion `ℤ_p`; the
chart is the nonempty second component `Spa(ℤ_p, ℤ_p)`. *Needs:* *localization-cech-complex-exact*;
*strict-complex-completion-exact*; *noetherian-rod-module-completion-tensor*; *submodule-blow-up*;
*blow-up-cech-artin-rees*; *blow-up-cech-filtration-neighbourhoods*; Tau Ceti
`TauCeti.Huber.PairOfDefinition.locSubring`, `TauCeti.Huber.PairOfDefinition.completionLocObj`;
Mathlib `IsModuleTopology.continuous_of_linearMapₛₗ`.
Lean: README target.

**Huber pairs with a noetherian ring of definition are sheafy (Huber94 Theorem 2.2, Case I).**
(*noetherian-rod-sheafy*) Let `(A, A⁺)` be a Huber pair with `A` complete and Hausdorff and having a
noetherian ring of definition (`A` is not assumed Tate), `A⁺` a ring of integral elements, and
`X = Spa(A, A⁺)`. Prove: (a) for every rational subset `U ⊆ X` the complete ring `𝒪_X(U)` has a
noetherian ring of definition (Huber94 §2, proof of Thm 2.5, Case I, p. 529); (b) for every finitely
generated `A`-module `M`, every rational subset `U` and every `g₀, …, g_m ∈ 𝒪_X(U)` generating the
unit ideal, the augmented Čech complex of the standard rational covering `{V_j = U ∩ R(g/g_j)}` of
`U` with terms `M ⊗_A 𝒪_X(V_{j₀} ∩ ⋯ ∩ V_{j_p})` (natural topologies) is exact with strict
differentials; (c) every open covering of a rational subset `U` has a refinement by such a standard
rational covering (Huber94 §2, (1.5), p. 529, for (b) and (c); Wedhorn §7.6, Lem. 7.54, p. 70,
Huber's Lemma 2.6 as stated by Wedhorn, AdicSpaces layer 2); (d) the structure presheaf `𝒪_X` is a
sheaf of complete topological rings, i.e. `(A, A⁺)` is sheafy (AdicSpaces'
`Huber.IsSheafyForEveryPresentation`) (Huber94 §2, Thm 2.2, p. 524; Huber94 §2, end of the proof of
Case I, p. 529, by EGA 0.3.2.2 and reduction to a refinement; EGA I Ch. 0, §3.2, (3.2.2), p. 26,
sheaves on a basis of open sets). The ring-level statement is
`Huber.PairOfDefinition.isSheafyRing`; it uses the given noetherian ring
of definition and completeness of its Huber ring. Sheaf-cohomology vanishing is *noetherian-rod-acyclicity-finite-modules*
(AdicSpacesPartIII layer R3). Tau Ceti's `TauCeti.Huber.isSheafyRing_of_isStronglyNoetherian` is Case II (strongly noetherian Tate
rings, AdicSpaces layer 4.1); this is Case I. For instance `Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)` and
`Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` are sheafy although neither ring is Tate; the only non-analytic point of the
latter is the trivial valuation with support `(p, T)`. For `M = A` and the covering `{|T| ≤ 1}`,
`{|T| ≥ 1}` of `Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)` the complex
`0 → ℤ_p⟨T⟩ → ℤ_p⟨T⟩ × ℤ_p⟨T, T⁻¹⟩ → ℤ_p⟨T, T⁻¹⟩ → 0` is exact and strict. For `A = 0` the space
`X` is empty and every clause holds. The ring-level localisation conclusion is
`exists_noetherianPairOfDefinition_completionLocObj`.
*Needs:*
*noetherian-rod-laurent-cech-strict*; *noetherian-rod-module-complete*;
*noetherian-adic-completion*; Tau Ceti `TauCeti.Huber.PairOfDefinition.locSubring`,
`TauCeti.Huber.PairOfDefinition.completionLocObj`,
`TauCeti.Huber.PairOfDefinition.completionLocalization`,
`TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover`; Mathlib
`Algebra.FiniteType.isNoetherianRing`.
Lean: `PairOfDefinition.isSheafyRing` (clause (d)); clauses (a)–(c) are README targets.

**Discrete Huber pairs are sheafy with Čech-acyclic rational coverings.**
(*discrete-huber-pair-sheafy*) A ring `A` with the discrete topology (any commutative ring) with an
integrally closed subring `A⁺ ⊆ A` is a complete Huber pair with pair of definition `(A, 0)`, and
its prime subring is a noetherian ring of definition with ideal of definition `0`; so its sheafiness
is the case of *noetherian-rod-sheafy* in which no completion occurs, and it is case (N) of
*noetherian-type-stably-sheafy*. What is added for discrete pairs is the elementary form of the
Čech statement, for an arbitrary `A`-module `M` rather than a finitely generated one: for every
rational subset `U = R(T/s)`, `𝒪(U) = A_s` with the discrete topology, and for every finite
covering `(U_j = R(T_j/s_j))` of `U` by rational subsets the augmented Čech complex
`0 → M_s → ∏ M_{s_{j₀}} → ∏ M_{s_{j₀}s_{j₁}} → ⋯` with coefficients `M ⊗_A 𝒪` is exact in all
degrees, because the `s_j` generate the unit ideal of `A_s` (Wedhorn §8.2, Thm 8.28, p. 81, case
(c), and its proof in the discrete case: reduction to principal open coverings of `Spec A` and the
structure sheaf pulled back from `Spec A` along the support map); `𝒪(W)` is discrete for
quasi-compact open `W` and, for non-quasi-compact `W`, the complete limit of the discrete rings
`𝒪(V)`, `V ⊆ W` rational. The covering hypothesis is what makes the `s_j` generate the unit ideal
of `A_s`: for `A = k[T]`, `A⁺ = k`, `U = Spa(A, A⁺)` and the single subset
`U₁ = R(1, T / T) = {|T| ≥ 1}`, the trivial valuation with support `(T)` lies in `U ∖ U₁`, `T` does
not generate the unit ideal of `A`, and `0 → k[T] → k[T, T⁻¹] → 0` is not exact. The algebraic consequence
`span_eq_top_of_discrete_rational_cover` states that the `s_j` generate the unit ideal of `A_s`.
**Check.** For discrete `k[T]` with plus
ring `k`, a valuation in `R(1/1)` lies outside `R(1,T/T)` (take support `(T)`),
and the localized denominator ideal is not the unit ideal. The uncovered point
and the ideal obstruction are asserted together. *Needs:* *noetherian-rod-sheafy*;
*localization-cech-complex-exact*; Tau Ceti
`TauCeti.Huber.PairOfDefinition.locSubring`, `TauCeti.Huber.PairOfDefinition.locIdeal`,
`TauCeti.ValuationSpectrum.rationalSubset`,
`TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover`.
Lean: README target.

**Complete rings of noetherian type are stably sheafy.** (*noetherian-type-stably-sheafy*) Let `A` be
a complete Hausdorff Huber ring of noetherian type. `IsNoetherianType.isStablySheafy` states that
`A` is stably sheafy in Tau Ceti's
sense (`TauCeti.Huber.IsStablySheafyRing A`; Wedhorn §8.2, Def. 8.26, p. 81): for every complete
Hausdorff Huber ring `B` and every ring homomorphism `φ : Â → B` topologically of finite type (Tau
Ceti `IsTopologicallyFiniteType`; here `Â = A`), `B` is a sheafy ring (`IsSheafyRing B`: for every
ring of integral elements `B⁺` of `B`, the structure presheaf of `Spa(B, B⁺)` is a sheaf of complete
topological rings) (Huber94 §2, Thm 2.2, p. 524, sheafiness in both cases). Three cases occur: (T) `B`
Tate — `B` is strongly noetherian and the AdicSpaces layer 4.1 theorem applies, with all-degree
exactness of augmented Čech complexes on finite rational covers of rational subsets; (N) `B` is
endowed with a noetherian ring of definition (for instance `ℤ_p⟨T⟩`, `ℤ_p⟦T⟧`) — Huber94 Theorem 2.2, Case I
(*noetherian-rod-sheafy*), with exact strict Čech complexes on standard rational covers of rational
subsets, which refine every open cover; (D) `B` discrete — *discrete-huber-pair-sheafy*, with
all-degree Čech exactness on finite rational covers. Case (D) is contained in case (N), through
the prime subring as noetherian ring of definition; it is listed separately for its all-degree
Čech exactness. Wedhorn proves only
the Tate and discrete cases (Wedhorn §8.2, Thm 8.28, p. 81); the noetherian-ring-of-definition case
is Huber's Case I. For instance `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and all its rational localisations are sheafy
(case T); `Spa(ℤ_p⟨T⟩, ℤ_p⟨T⟩)` and `Spa(ℤ_p⟦T⟧⟨X⟩, ℤ_p⟦T⟧⟨X⟩)` are sheafy (case N);
`Spa(𝔽_p[T], 𝔽_p)` is sheafy (case D). *Needs:* *noetherian-type-huber-ring*;
*topologically-finite-type-noetherian-type*; *noetherian-rod-sheafy*; *discrete-huber-pair-sheafy*;
Tau Ceti `TauCeti.Huber.IsTopologicallyFiniteType`.
Lean: `IsNoetherianType.isStablySheafy`.

*Checks for `NoetherianCech.filtration`:*
- *Degenerate.* An empty module-generator set gives
  the zero subgroup in every degree and at every filtration level.
- *Degenerate.* For an `n`-element cover, degree
  `p ≥ n` has no increasing `(p+1)`-tuple, so its term is zero and its filtration is the
  whole (zero) group. This tests alternating, rather than repeated-index, Čech terms.
- *Computation.* For the single cover element `1`
  and module-generator set `{1}`, level `i` in degree zero is exactly the image of `Iⁱ`
  in the localization at `1`; no extra powers of a denominator occur.

*Checks for `PairOfDefinition.completionTensorEquiv`:*
The completed-scalar and topological statement is
`PairOfDefinition.completionTensorHomeomorph`: under the same noetherian defining-ring
hypothesis and uniform continuity of scalar multiplication on M, the action of A on M̂
extends to a continuous Â-action, and Â ⊗ₐ M with its natural Â-module topology is
Â-linearly homeomorphic to M̂. Its value on a ⊗ m agrees with
`completionTensorEquiv` on m ⊗ a. For a finitely generated defining lattice M₀
spanning M, the lattice comparison of this target identifies its uniform
completion with Mathlib's `AdicCompletion I M₀`, sending each lattice element to
its compatible residue classes. The ideal-adic comparison is on M₀, where I acts
as an ideal of A₀. Evaluation `AdicCompletion.eval` is surjective, sends m to
its residue class (`eval_of`), and has kernel Iⁿ times the completed lattice
(`pow_smul_top_eq_ker_eval`, using the finite generation of I). These exact supplier
contracts give the modulo-Iⁿ comparison for every n, including n = 0.

- *Computation.*
  `m ⊗ a + n ⊗ b` maps to the completion image of `am + bn` for `a,b ∈ A`.
- *Compatibility.* For `M = A`, the image of
  `a ⊗ b` is the completion image of `ab`, agreeing with multiplication.
- *Degenerate.* For the rank-zero free module,
  every tensor maps to zero.

- *Degenerate.* For the empty generating set in C,
  the Rees subalgebra consists of constants and its degree-one piece is zero.
- *Computation.* For the generating set {1} in C,
  the Rees subalgebra is C[T], and T² is in its degree-two piece. Together with
  `submoduleBlowup_reesAlgebra_compat`, these test the Rees-ring constructor.
- *Non-example.* The degree-two piece for
  a square-zero generator x is zero, including when x itself is nonzero.
- *Degenerate.* The empty generator set gives
  the empty Proj; its structural morphism is injective on points.
- *Compatibility.* For C = B and F = {1},
  the structural morphism is an isomorphism and its composite with `fromSpec`
  in the other order is the identity. The origin blow-up
  `submoduleBlowup_isIso_test_origin_blowup` supplies the non-isomorphism control.
- *Non-example.* For ℤ → ℚ and F = {1},
  the source morphism Spec ℚ → Proj ℤ[T] is not surjective. Along with
  `submoduleBlowup_fromSpec_preimage` and the unit section, this distinguishes the
  source morphism from the structural morphism.

The chart maps of `submoduleBlowup.basicOpenIsoSpec` are tested after composing
with the chart inclusion and the projection to Spec C. Each Check asserts the exact equality
`e.inv ≫ U.ι ≫ toSpec = Spec.map (algebraMap C C[F/S])` from
`submoduleBlowup.basicOpenIsoSpec_inv_comp`, together with the property below
(Huber94 §2, proof of Theorem 2.5, Case I, (1.2)(ii), printed p. 526).

- *`submoduleBlowup.basicOpenIsoSpec_unit`.* For B = C and F = S = {1}, the chart-to-base map is an isomorphism.
- *`submoduleBlowup.basicOpenIsoSpec_nilpotent`.* For nonzero C and F = S = {x} with x nilpotent, the chart is empty and the chart-to-base map is not surjective.
- *`submoduleBlowup.basicOpenIsoSpec_exceptional`.* For C = K[X,Y], F = {X,Y} and S = {X}, the chart-to-base map is not injective: its exceptional affine line contains distinct primes (X,Y/X) and (X,Y/X−1) over the origin.
- For a field K,
  C = K, B = K[x], F = {1,x} and S = {1}, the chart pullback sends x/1 to
  q = (xT)/T and not to q + 1. Thus the K-automorphism x ↦ x + 1 does not satisfy
  `submoduleBlowup.basicOpenIsoSpec_hom_generator`, although it preserves the map to Spec K.

### R0.3 the completed tensor product

For commutative topological rings with the two algebra structures,
`Huber.CompletedTensor.isUniformAddGroup` and `Huber.CompletedTensor.isTopologicalRing`
assert compatibility of the completed tensor uniformity and ring operations.
`Huber.CompletedTensor.isHuberRing` assumes both structure maps are adic and asserts
that this completed ring is Huber (Huber96, proof of Proposition 1.2.2(1), p. 47).

**The completed tensor product of Huber pairs along adic homomorphisms.** (*completed-tensor-product*)
Let `(A, A⁺)`, `(B, B⁺)`, `(C, C⁺)` be Huber pairs (Tau Ceti `Pair`; none of `A`, `B`, `C` need be complete) and `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)` morphisms of Huber pairs (Tau Ceti
`Pair.Hom`) whose underlying ring homomorphisms are adic (*adic-ring-homomorphism*). Choose a pair
of definition `(A₀, I)` of `A` and rings of definition `B₀ ⊆ B⁺`, `C₀ ⊆ C⁺` with `f(A₀) ⊆ B₀`,
`g(A₀) ⊆ C₀` such that `f(I)B₀` and `g(I)C₀` are ideals of definition. Let `E := B ⊗_A C` (Mathlib
`Algebra.TensorProduct`, `B` and `C` being `A`-algebras through `f` and `g`), let `F ⊆ E` be the
image of `B₀ ⊗_{A₀} C₀` (a subring), and give `E` the group topology for which `{Iⁿ·F : n ≥ 0}` is a
fundamental system of neighbourhoods of `0`, where `Iⁿ·F` is the additive subgroup generated by the
products of images of elements of `Iⁿ` with elements of `F`. Then `E` is a Huber ring with pair of
definition `(F, I·F)`, the maps `inl : b ↦ b ⊗ 1` and `inr : c ↦ 1 ⊗ c` are adic, the topology does
not depend on the choice of `(A₀, I, B₀, C₀)`, and `E⁺ :=` the integral closure in `E` of the image
of `B⁺ ⊗_{A⁺} C⁺` is a ring of integral elements of `E` (Huber94 §3, proof of Lem. 3.9(i), p. 537,
the topology `{Iⁿ·F}` on `E^▷ = B^▷ ⊗ C^▷` and the plus ring; Morel §II.3.2, Prop. II.3.2.1, the
Huber-ring structure and adicness of `inl`, `inr`). The *completed tensor product* is the complete
Hausdorff Huber pair `B ⊗̂_A C := (Ê, Ê⁺)`, where `Ê` is the Hausdorff completion of `E` (Tau Ceti
`IsHuberRing.completion`) and `Ê⁺` is the closure of the image of `E⁺`; it carries the morphisms of
Huber pairs `inl : (B, B⁺) → B ⊗̂_A C`, `inr : (C, C⁺) → B ⊗̂_A C` with `inl ∘ f = inr ∘ g` (Huber94
§3, proof of Lem. 3.9(i), p. 537, the completion of `(E^▷, E⁺)`; Hübner §9, proof of Thm 9.2, p. 41;
Huber96 §1.2, proof of Prop. 1.2.2, part 1, p. 47, where Huber takes arbitrary rings of definition
with `φ(A₀) ⊆ B₀`, `ψ(A₀) ⊆ C₀`, which is legitimate by the choice-independence of
*adic-hom-choice-independence*). It is a Tate ring whenever `B` or `C` is. Fixed conventions:
`B ⊗̂_A C` always means this completed pair; the plus ring is the integral closure of the image of
`B⁺ ⊗_{A⁺} C⁺` (not the image itself), then closed up in the completion; no uniformisation is
performed; the construction is not defined unless both `f` and `g` are adic. This target owns the
completed tensor product: the adic-ring comparison of *completed-tensor-product*
identifies its special case for adic rings `A`, `B`, `C` with
finitely generated ideals of definition and adic structure maps, where `AdicCompletion J (B ⊗_A C)`
for `J` generated by the images of the ideals of definition carries exactly this topology and the
plus rings are the whole rings; and the ring case of *mixed-completed-tensor* in AdicSpacesPartIV layer R5 (`V°`
`ϖ`-adically complete, `M = R` a small `O`-algebra) coincides with that special case. In `Huber.Pair`, define
`completedTensor f g hf hg` as the complete Hausdorff Huber pair `B ⊗̂_A C` (data: the ring, its
topology, its plus ring), `completedTensor.inl` as the morphism of Huber pairs
`(B, B⁺) → B ⊗̂_A C`, `b ↦ b ⊗ 1`, `completedTensor.inr` as `(C, C⁺) → B ⊗̂_A C`, `c ↦ 1 ⊗ c`, and
`completedTensor.tmul` as the ring homomorphism `B ⊗[A] C → B ⊗̂_A C` from Mathlib's algebraic
tensor product, with `tmul (b ⊗ₜ c) = inl b * inr c` (simp); prove `completedTensor.inl_comp`
(`inl ∘ f = inr ∘ g` as morphisms of Huber pairs), `completedTensor.denseRange_tmul` (`tmul` has dense
range, and its kernel is the closure of `0` in `B ⊗_A C`), `completedTensor.pairOfDefinition`
(the pair determined by explicit compatible pairs `P`, `Q`, `R` and restricted structure maps,
with ring and ideal specified below; `hasBasis_tensorTopology` gives the same topology for
all such choices), `completedTensor.isAdicHom_inl` (`inl` and `inr` are
adic), `completedTensor.plus_eq` (the plus ring is the closure of the integral closure of the image of
`B⁺ ⊗_{A⁺} C⁺`; it contains the image of every `b ⊗ c` with `b ∈ B⁺`, `c ∈ C⁺`),
`completedTensor.lift` (with `[IsAdicHom (algebraMap A B)]` and
`[IsAdicHom (algebraMap A C)]`, and with `R` carrying `[CommRing R]`, `[UniformSpace R]`,
`[IsUniformAddGroup R]`, `[NonarchimedeanRing R]`, `[CompleteSpace R]` and `[T2Space R]`,
for continuous ring homomorphisms `φ : B → R`, `ψ : C → R` with `φ ∘ f = ψ ∘ g`, the induced ring homomorphism
`B ⊗̂_A C → R`; `completedTensor.continuous_lift` proves its continuity;
Huber94, proof of Proposition 3.7, p. 536, and Wedhorn §8.6, proof of Theorem 8.56, p. 90),
`completedTensor.existsUnique_lift` (if `R⁺` is a closed subring integrally closed in `R` and
`φ(B⁺) ⊆ R⁺`, `ψ(C⁺) ⊆ R⁺`, there is exactly one continuous ring homomorphism extending
`φ`, `ψ` and carrying `(B ⊗̂_A C)⁺` into `R⁺`, as in
*completed-tensor-product-universal-property*), `completedTensor.lift_comp_inl`
(`(lift φ ψ h) ∘ inl = φ`, with the right equality retained in this conjunction),
`completedTensor.lift_comp_inr` (`(lift φ ψ h) ∘ inr = ψ`), `completedTensor.hom_ext` (two continuous
morphisms out of `B ⊗̂_A C` agreeing after `inl` and after `inr` are equal), `completedTensor.map`
(morphisms `(B, B⁺) → (B', B'⁺)`, `(C, C⁺) → (C', C'⁺)` over `(A, A⁺) → (A', A'⁺)` with all structure
maps adic induce `B ⊗̂_A C → B' ⊗̂_{A'} C'`; `map_id`, `map_comp`), `completedTensor.comm`
(`B ⊗̂_A C ≅ C ⊗̂_A B` for Huber rings with adic `A → B` and `A → C`, exchanging
`inl` and `inr`), `completedTensor.cancelBaseChange` (for Huber rings `A`, `B`, `C`, `C'`
with adic `A → B`, `A → C`, `A → C'` and `C → C'`, and compatible `A → C → C'`:
`(B ⊗̂_A C) ⊗̂_C C' ≅ B ⊗̂_A C'`, transitivity of base change, from the universal
property), `completedTensor.isTateRing` (`B ⊗̂_A C` is Tate if `B` or `C` is Tate; the instance
`completedTensor.instIsTateRing` of *uniform-completed-tensor-product* is the case `A` Tate) and
the adic-ring comparison of *completed-tensor-product* (if `A`, `B`, `C` are adic rings with finitely generated ideals of
definition and `A → B`, `A → C` are adic, then the completed tensor product of the Huber pairs
`(A, A)`, `(B, B)`, `(C, C)` is the pair `(B ⊗̂_A C, B ⊗̂_A C)` whose ring is the completed tensor
product of adic rings, with the same structure maps).
The precise conclusion of the adic-ring comparison is a ring equivalence
from `CompletedTensor A B C` to Mathlib's `AdicCompletion J (B ⊗[A] C)`, where
J is the sum of the extended defining ideals of B and C. It is a homeomorphism
for the topology defined by the extended J on the completion, carries `tmul z`
to the canonical image of z, and the completed tensor plus ring is the full ring.
The hypotheses specify finitely generated defining ideals of A, B and C, adic
structure maps and full input plus rings (Huber96 §1.2, Proposition 1.2.2(1), p. 47).
Thus the adic-ring tensor product has carrier `AdicCompletion J (B ⊗[A] C)`,
identified with `Huber.CompletedTensor A B C` by the adic-ring comparison.
`Huber.isTopologicalRing_tensorTopology` carries Huber rings `A`, `B`, `C` with
both structure maps adic and concludes that the tensor topology specified above makes
`B ⊗[A] C` a topological ring.
`Huber.completedTensor_adicRing` is the displayed homeomorphic ring equivalence with
`AdicCompletion J (B ⊗[A] C)` for adic rings, finitely generated ideals of definition,
adic structure maps and full input plus rings, fixing both coefficient maps and carrying
the completed plus ring to the full ring.
`Huber.Pair.completedTensor.tmul_tmul`, with the same adic Huber-ring structure maps,
states `tmul (b ⊗ₜ c) = inl b * inr c` for all `b : B`, `c : C`.

Lean: README target.

Further examples: `(ℤ_p⟨T⟩, ℤ_p⟨T⟩) ⊗̂_{ℤ_p} (ℚ_p, ℤ_p) ≅ (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and
`(ℤ_p⟨T⟩, ℤ_p⟨T⟩) ⊗̂_{ℤ_p} (𝔽_p, 𝔽_p) ≅ (𝔽_p[T], 𝔽_p[T])` discrete (Hübner Examples 9.4, 9.5), and
the polydisc example below is Hübner Example 9.3. Degenerate instances: for `B = 0` or `C = 0`
the completed tensor product is the zero pair; for `A = B = C` with identity structure maps it is
`(Â, closure of A⁺)`.
*Needs:* *adic-ring-homomorphism*;
*adic-hom-choice-independence*; Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`,
`TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.IsHuberRing.completion`,
`TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.Huber.Pair.isRingOfIntegralElements_integralClosure`, `TauCeti.Huber.IsTateRing`,
`TauCeti.Huber.IsTateRing.completion`; Mathlib `Algebra.TensorProduct.includeLeft`,
`Algebra.TensorProduct.includeRight`, `integralClosure`.

For each prime `p`, define `padicDiscSmallPair p` on the supplied carrier
`A = ℚ_p⟨T⟩` with `S.plus = ℤ_p + pℤ_p⟨T⟩ = ℤ_p + A°°`: the constant coefficient
has norm at most one, and every nonconstant coefficient has norm less than one.
This subring is open and closed, and integrally closed in `A`: reduction modulo
`pA°` reduces the last claim to the fact that the elements of `𝔽_p[T]` algebraic
over `𝔽_p` are constants. For identity structure maps,
`Pair.completedTensor.padicDiscSmallPair_plus_ne` states that the plus ring of
`Pair.completedTensor S S S` differs from `powerBoundedSubring (CompletedTensor A A A)`;
its witness is `tmul (T ⊗ 1)`, which is power-bounded and outside the plus ring.
Indeed the self-tensor identifies with `A`, retaining the closed subring `S.plus`
under the integral-closure-and-completion construction (Huber96 §1.2, proof of
Proposition 1.2.2(1), p. 47). The following are computations for this construction.

**Checks.**

- A constant `a : ℚ_p` belongs to the plus ring
  exactly when `‖a‖ ≤ 1`, including `a = 0` and excluding `a = p⁻¹`.
- `pT` belongs to the plus ring.
- `T` is power-bounded but outside the plus ring.
- The identity self-tensor with this specified plus ring
  has plus ring strictly smaller than its power-bounded subring.
- *Computation.* For a complete nonarchimedean field `K`:
  `(K⟨T⟩, K°⟨T⟩) ⊗̂_{(K,K°)} (K⟨S⟩, K°⟨S⟩)` is isomorphic, compatibly with `inl` and `inr`, to
  `(K⟨T, S⟩, K°⟨T, S⟩)` with `T ↦ T ⊗ 1` and `S ↦ 1 ⊗ S`.
  On the completed restricted-series carriers supplied by AdicSpaces §§0.5, 2.4,
  the continuous `K`-algebra equivalence `e` satisfies `e(inl(T)) = T` and
  `e(inr(S)) = S`, and maps the tensor plus ring onto the bidisc's power-bounded
  subring. More generally `e(tmul(Tᵐ ⊗ Sⁿ)) = TᵐSⁿ` for all `m,n : ℕ`;
  `(0,0)`, `(1,0)` and `(0,1)` fix the constant and distinguish the two coordinates.
  The formal statement's field has `NontriviallyNormedField`, `IsUltrametricDist`, `CompleteSpace`
  and `IsTateRing`, as in the base-field convention; its continuous coefficient
  map into the disc is adic. This is Hübner Example 9.3.
- *Non-example.* For `K = ℚ_p` and `L = ℚ_p(√p)`:
  `(L, O_L) ⊗̂_K (L, O_L) ≅ (L × L, O_L × O_L)`, and the idempotent `(1, 0)` lies in the plus ring
  but not in the image of `O_L ⊗_{ℤ_p} O_L` (that image is `O_L[Y]/(Y² − p)` embedded by
  `Y ↦ (√p, −√p)`, i.e. the pairs `(a + b√p, a − b√p)` with `a, b ∈ O_L`): `(1, 0)` would need
  `a = 1/2` and `b = 1/(2√p)`; for `p` odd `b ∉ O_L`, for `p = 2` already `a ∉ ℤ_2`. In both cases
  `O_L = ℤ_p[√p]` (`√p` is a uniformiser), the ring of definition `F` is the image of
  `O_L ⊗_{ℤ_p} O_L`, open and bounded in `L × L`, so the topology is the product topology and `E`
  is already complete. A definition taking the plus ring to be the image of `B⁺ ⊗ C⁺` fails.
  Formally, take a complete nonarchimedean normed `ℚ_p`-algebra field `L` of dimension two,
  with `ϖ² = p` and its compatible Huber topology. The Check supplies the conjugation `σ`
  and a homeomorphic ring equivalence `e : CompletedTensor ℚ_p L L ≃+* L × L`, fixed by
  `e (tmul (b ⊗ c)) = (bc, bσ(c))`. It states that `e` maps the tensor plus ring onto
  `O_L × O_L`, that `e⁻¹(1,0)` belongs to that plus ring, and that it does not belong to
  `tmul` of the subring generated by `O_L ⊗ 1` and `1 ⊗ O_L`. This subring is precisely
  the image of `O_L ⊗_{ℤ_p} O_L`. The arithmetic obstruction is also retained as
  `completedTensor_test_plus_not_image_arithmetic`: for a square-root-closed subring
  `O_L`, if `1/2` or `1/(2ϖ)` is outside it, no `a,b ∈ O_L` give `(a+bϖ,a−bϖ)=(1,0)`.
- *Non-example.* For `A = ℤ_p` (`p`-adic), `B = ℤ_p⟦X⟧`
  (`(p, X)`-adic), `C = ℚ_p`: `A → B` is not adic, and there is no Huber-ring topology on
  `B ⊗_A C = ℤ_p⟦X⟧[1/p]` making `B → B ⊗_A C` and `C → B ⊗_A C` continuous with `ℤ_p⟦X⟧` open (Morel
  Ex. II.3.2.2): continuity forces `X` topologically nilpotent and `p` a pseudouniformiser, so
  `X^n/p ∈ E₀` for a ring of definition `E₀` and some `n`, while `p^m E₀ ⊆ ℤ_p⟦X⟧` would give
  `p^{m−k} X^{nk} ∈ ℤ_p⟦X⟧` for all `k`. The openness clause is needed: the `p`-adic topology with
  ring of definition `ℤ_p⟦X⟧[X/p]` makes both maps continuous (`(p, X)^m ⊆ p^m·ℤ_p⟦X⟧[X/p]`), but
  `ℤ_p⟦X⟧` is not open in it. The construction requires adicness of both maps.
- *Degenerate.* For `g = id`: `(B, B⁺) ⊗̂_A (A, A⁺) ≅ (B̂, closure of
  B⁺)` via `inl`, and for complete `B` this is `(B, B⁺)`.
- *Compatibility.* Take all three pairs to be
  `(ℚ₂, ℤ₂)` and both structure maps to be the identity. The product seminorm of
  `z ∈ ℚ₂ ⊗_{ℚ₂} ℚ₂` is `|mul(z)|₂`; in particular its value on
  `2 ⊗ 3 − 7 ⊗ 1` is `1`. Multiplication extends to a homeomorphic ring
  equivalence from the completed tensor product to `ℚ₂`, carrying the completed
  plus ring to `ℤ₂` (KL15 Definitions 2.1.10, p. 27, and 2.4.1, p. 38).
- *Non-example.* In a normed `A`-algebra,
  if `‖a‖ > 1` and `b ≠ 0`, then `‖a • b‖ ≠ √‖a‖ · ‖b‖`.
  Thus the square root of the Gauss norm on `ℚ_p⟨S⟩` cannot be used with the usual
  norm on `ℚ_p`: take `a = p⁻¹`, `b = 1`.
- For `A = B = C = ℚ_p`, the canonical completion map has zero kernel and sends `2 ⊗ 3 − 7 ⊗ 1` to `−1`.

The Banach comparison of *completed-tensor-product* assumes `NontriviallyNormedField A`,
`NormedAlgebra A B` and `NormedAlgebra A C`; all three rings are complete,
ultrametric and Tate, and both structure maps are bounded, adic and preserve the
specified plus rings. In particular, `‖a • b‖ = ‖a‖‖b‖` and
`‖a • c‖ = ‖a‖‖c‖`. These identities allow scalar powers to rebalance tensor
presentations relative to the unit balls. Bounded structure maps alone do not
give this comparison of topologies. The theorem explicitly defines the product seminorm by the infimum of
`maxᵢ ‖bᵢ‖‖cᵢ‖` over all finite presentations `z = ∑ᵢ bᵢ ⊗ cᵢ`; its positive
balls form the zero-neighbourhood basis of `tensorTopology`. Thus its separated
completion is `CompletedTensor`, including the zero tensor product. The second
conclusion identifies the plus ring with the closure of the image of the integral
closure in the algebraic tensor product (KL15 §2.1, Definition 2.1.10, p. 27;
§2.4, Definition 2.4.1, p. 38). `completedTensor_test_banach` computes the seminorm
and the completed plus ring for ℚ₂.

**Universal property of the completed tensor product.**
(*completed-tensor-product-universal-property*) Let `f : (A, A⁺) → (B, B⁺)` and
`g : (A, A⁺) → (C, C⁺)` be morphisms of Huber pairs with adic underlying ring homomorphisms, and let
`D = B ⊗̂_A C` with `inl`, `inr` (*completed-tensor-product*). Let `R` be a complete Hausdorff
nonarchimedean topological commutative ring (open additive subgroups form a basis of neighbourhoods
of `0`) and `R⁺ ⊆ R` a closed subring integrally closed in `R` (for instance a complete Huber pair,
or `(O_X(X), O_X⁺(X))` for an adic space `X`). Prove `Pair.completedTensor.existsUnique_lift`:
for all continuous ring homomorphisms
`φ : B → R`, `ψ : C → R` with `φ(B⁺) ⊆ R⁺`, `ψ(C⁺) ⊆ R⁺` and `φ ∘ f = ψ ∘ g`, there is exactly one
continuous ring homomorphism `χ : D → R` with `χ(D⁺) ⊆ R⁺`, `χ ∘ inl = φ` and `χ ∘ inr = ψ`. In
particular the square of `f`, `g`, `inl`, `inr` is cocartesian in the category of complete Hausdorff
Huber pairs (Huber94 §3, proof of Prop. 3.7, p. 536; Morel §II.3.2, Prop. II.3.2.1, the uncompleted
universal property for arbitrary nonarchimedean targets, whose printed condition `u ∘ f = v ∘ g` is
a misprint for `u′ ∘ f = v′ ∘ g` and whose continuity argument is corrected in the proof; Wedhorn
§8.6, proof of Thm 8.56, p. 90, where the universal property is the input to the geometric fibre
product). If moreover `R` is Huber and `φ` is adic, then `χ` is adic. No adicness of `φ` or `ψ` is
needed. For `K⟨T⟩` and `K⟨S⟩` over `K`, the unique map `K⟨T⟩ ⊗̂_K K⟨S⟩ → K⟨T, S⟩` given by the two
inclusions is an isomorphism (both represent pairs of power-bounded elements);
`Hom(B ⊗̂_A C, R) ≅ Hom(B, R) ×_{Hom(A, R)} Hom(C, R)` for `R = O_X(X)` of any adic space `X` is the
form used in *affinoid-fibre-product*; and without adicness of `f` the statement fails: for
`ℤ_p → ℤ_p⟦X⟧` and `ℤ_p → ℚ_p` no Huber topology on the tensor product makes the structure maps
continuous with `ℤ_p⟦X⟧` open (Morel Ex. II.3.2.2; the clause "open" is needed, see
`completedTensor_test_not_adic`). *Needs:* *completed-tensor-product*; *adic-ring-homomorphism*;
*adic-hom-choice-independence*; Mathlib `Algebra.TensorProduct.lift`, `Algebra.TensorProduct.ext`,
`UniformSpace.Completion.extensionHom`, `UniformSpace.Completion.extensionHom_coe`.
Lean: README target.

**Base change of weighted restricted power series and of their quotients.**
(*completed-tensor-restricted-power-series*) Let `λ : (A, A⁺) → (B, B⁺)` be a morphism of Huber
pairs whose ring homomorphism is adic, and let `M = (M₁,…,M_n)` be finite subsets of `A` with every
`M_i·A` open in `A`. Prove: (a) every `λ(M_i)·B` is open in `B`, so the weighted restricted
power-series pair `B⟨X⟩_{λ(M)} = B⟨X₁,…,X_n⟩_{λ(M₁),…,λ(M_n)}` is defined (Huber's plus ring: the
integral closure of `{∑ b_ν X^ν : b_ν ∈ λ(M)^ν·B⁺ for all ν}`) (Huber94 §3, proof of Prop. 3.7,
pp. 535–536: adicness makes `λ(M_i)·B^▷` open); (b) the morphism `A⟨X⟩_M ⊗̂_A B → B⟨X⟩_{λ(M)}`
induced by the natural extension `λ' : A⟨X⟩_M → B⟨X⟩_{λ(M)}` of `λ` (`X_i ↦ X_i`) and by the
structure map `B → B⟨X⟩_{λ(M)}` is an isomorphism of complete Huber pairs (Huber94 §3, Lem. 3.5(i),
p. 534, the pair-level universal property of `A⟨X⟩_M`); (c) if `σ : A⟨X⟩_M → (C, C⁺)` is a quotient
mapping of complete Huber pairs (surjective, continuous and open, `C⁺` the integral closure of
`σ(A⟨X⟩_M⁺)`) with kernel `𝔞`, then `C ⊗̂_A B ≅ B⟨X⟩_{λ(M)}/𝔟` with `𝔟` the closure of
`λ'(𝔞)·B⟨X⟩_{λ(M)}`, quotient topology and plus ring the integral closure of the image of
`B⟨X⟩⁺_{λ(M)}`; if `B` is complete of noetherian type then `𝔟 = λ'(𝔞)·B⟨X⟩_{λ(M)}` (Huber94 §3,
proof of Prop. 3.7, p. 536, the quotient `D^▷` of `E^▷ = B⟨X⟩_{λ(M)}` by the ideal generated by
`λ'(ker σ)` with the quotient topology; Hübner §9, proof of Thm 9.2(iii), p. 42, where in general the
closure of the extended ideal is needed; Huber96 §1.2, proof of Prop. 1.2.2, part 2), p. 48, which
takes the closure of the extended ideal as in (c)). Consequently `B → C ⊗̂_A B` is topologically of
finite type as a morphism of Huber pairs (a quotient mapping out of `B⟨X⟩_{λ(M)}`) and as a ring
homomorphism (Tau Ceti `IsTopologicallyFiniteType`). (d) Ring-level presentations: if `μ : A → C` is
only topologically of finite type as a ring homomorphism (Tau Ceti `IsTopologicallyFiniteType μ`,
presented by a surjective continuous open ring homomorphism `σ : Â⟨X⟩_M → C` with `σ ∘ h = μ`,
finite weights `M_i` with `M_i·A` open) and `C⁺` is any ring of integral elements of `C` with
`μ(A⁺) ⊆ C⁺` (`μ` adic by *topologically-finite-type-is-adic*), then the topological ring underlying
`C ⊗̂_A B` is still `B⟨X⟩_{λ(M)}/𝔟` as in (c), its plus ring is the closure of the integral closure
of the image of `C⁺ ⊗_{A⁺} B⁺`, and `inr : B → C ⊗̂_A B` (the structure map of the right factor,
suggested name `Pair.completedTensor.isTopologicallyFiniteType_inr`) is topologically of finite type as a ring
homomorphism. This is the form used for morphisms locally of weakly finite type (case (b) of
*fibre-products-existence*, and *completed-tensor-noetherian-stability*). For instance
`K⟨X⟩ ⊗̂_K L ≅ L⟨X⟩` for a complete extension `L/K` of nonarchimedean fields;
`ℤ_p⟨X⟩_{p}/(pX − 1) = ℚ_p` (this pins the direction of the weights: `ℤ_p⟨X⟩_{p}` consists of
the series `∑ a_ν X^ν` with `a_ν/p^ν → 0`, so `X` is not power-bounded, `pX` is, and `X ↦ 1/p`
sends `∑ a_ν X^ν` to the convergent sum `∑ a_ν p^{−ν}`; with weight `1` instead,
`ℤ_p⟨X⟩_{1}/(pX − 1) = ℤ_p⟨X⟩/(pX − 1) = 0` since `pX − 1` is a unit of `ℤ_p⟨X⟩`), and
`ℚ_p ⊗̂_{ℤ_p} ℤ_p⟨T⟩ ≅ ℤ_p⟨T⟩⟨X⟩_{p}/(pX − 1) ≅ ℚ_p⟨T⟩` (Hübner Ex. 9.4). Without adicness the
statement fails: for `λ : ℤ_p → ℤ_p⟦T⟧` and `M = {p}`, `λ(M)·B = p·ℤ_p⟦T⟧` is not open, so
`B⟨X⟩_{λ(M)}` is not defined; this is why *fibre-product-along-finite-type* enlarges the weights by
powers of an ideal of definition. *Needs:* *completed-tensor-product*;
*completed-tensor-product-universal-property*; *adic-ring-homomorphism*;
*noetherian-type-ideals-closed*; *topologically-finite-type-noetherian-type*;
*topologically-finite-type-is-adic*; Tau Ceti `TauCeti.Huber.weightedRestrictedSubring`,
`TauCeti.Huber.IsWeightFamily`, `TauCeti.Huber.weightedMapCompletion`,
`TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`,
`TauCeti.Huber.Pair.quotient`, `TauCeti.Huber.Pair.Hom.quotientLift`,
`TauCeti.Huber.IsTopologicallyFiniteType.comp_isOpenQuotientMap`,
`TauCeti.Huber.isWeightBounded_of_isWeightedVarPowerBounded`,
`TauCeti.Huber.IsTopologicallyFiniteType`.
`Huber.IsAdicHom.isWeightFamily_image` carries the adic pair map `λ`, finite weight
family `M` with each generated ideal open, and concludes `IsWeightFamily (fun i ↦ λ '' M i)`;
the image sets remain finite.

Lean: README target.

The plus ring in (b) is `Pair.weightedRestricted S M hMf hM`: on the supplied
`Completion (weightedRestrictedSubring M hM)`, take the integral closure of the closure of the
subring generated by `A⁺` and the elements `mXᵢ`, `m ∈ Mᵢ`. This is the coefficient-bound
construction above (Huber94 §3, p. 534). Integral constants map into this plus ring, and the
coefficient map `A → A⟨X⟩_M` (completed) is adic, by weighted pairs of definition and completion.
Mapping the tensor plus ring through `Pair.completedTensorRestrictedEquiv` gives exactly the
weighted-series plus ring over `B`; together with the statement that this equivalence is a
homeomorphism, this gives (b) on Huber pairs.

For (c) and (d), `Pair.completedTensorRestrictedQuotient` takes an open quotient
`A`-algebra homomorphism `σ` from completed weighted series to a complete Hausdorff Huber ring
`C`, an adic `A → B`, an adic `A → C`, and compatible plus rings `A⁺`, `B⁺`, `C⁺`.
Adicness of `A → C` follows from the coefficient-map theorem and the stability of adicness under
open quotients (*adic-ring-homomorphism*); it imposes no extra restriction on these presentations.
Writing `J = (ker σ).map λ'`, the theorem gives a ring equivalence
`e : C ⊗̂_A B ≃ B⟨X⟩_{λ(M)}/J.closure`, a homeomorphism for the quotient topology, and
`e(σ(f) ⊗ b) = [λ'(f)·b]`. It identifies the transported plus ring with the closure of the
image of the integral closure of `C⁺ ⊗_{A⁺} B⁺` taken in `C ⊗_A B`. If additionally
`C⁺` is the integral closure of `σ(A⟨X⟩_M⁺)`, the same theorem identifies this plus ring with
the plus ring of `Pair.quotient` applied to the weighted-series pair over `(B, B⁺)` and
`J.closure`. These are precisely the
ring-level and pair-level presentations, respectively (Huber96 §1.2, proof of Prop. 1.2.2,
pp. 47–48; [Huber94, proof of Prop. 3.7, p. 536](https://math.stanford.edu/~conrad/Perfseminar/refs/Huberformalrigid.pdf)).
The closedness clause of this presentation proves `J.closure = J` when `B` is of
noetherian type, including the complete case in (c); for noncomplete `B` this uses invariance
of noetherian type under completion and closedness of ideals in completed weighted series.

**Checks.**

- With no variables the plus ring is the closure of
  the image of `A⁺` in the completed coefficient ring.
- Every `mXᵢ`, for `m ∈ Mᵢ`, belongs to the
  plus ring; the weight multiplies the coordinate.
- Over `(ℚ_p, ℤ_p)` at weight one, `X` lies in the
  plus ring and `p⁻¹X` does not, for every prime including two.
- Extending and closing the unit ideal gives a zero
  quotient, independently of the weights.
- Extending and closing the zero ideal gives zero in
  the Hausdorff completed series ring; the ring presentation reduces to (b).

**Completed base change along a topologically-finite-type map preserves noetherian type and
sheafiness.** (*completed-tensor-noetherian-stability*) Let `λ : (A, A⁺) → (B, B⁺)` and
`μ : (A, A⁺) → (C, C⁺)` be morphisms of complete Hausdorff Huber pairs with `λ` adic and `μ`
topologically of finite type as a ring homomorphism (Tau Ceti `IsTopologicallyFiniteType`; then `μ`
is adic by *topologically-finite-type-is-adic*), and let `B` be of noetherian type
(*noetherian-type-huber-ring*). Prove that `inl : B → B ⊗̂_A C` is topologically of finite type,
that `B ⊗̂_A C` is a complete Hausdorff Huber ring of noetherian type, and that `B ⊗̂_A C` (with its
plus ring, or with any other ring of integral elements) is sheafy — indeed stably sheafy
(*noetherian-type-stably-sheafy*); if `μ` is topologically of finite type as a morphism of pairs,
`inl` is so as a morphism of pairs (Huber94 §3, proof of Prop. 3.7, p. 536: `D^▷` has a noetherian
ring of definition or is a strongly noetherian Tate ring, so `Spa D` is an adic space; Wedhorn §8.6,
proof of Thm 8.56(ii), p. 90, the same argument in the stably-sheafy formulation; HK §7, Rem. 7.2,
p. 25: completed tensor products are not automatically uniform, and no property beyond noetherian
type is claimed here). For instance `Spa(ℚ_p⟨T⟩) ×_{Spa ℚ_p} Spa(ℚ_p⟨S⟩) = Spa(ℚ_p⟨T, S⟩)` is
sheafy. No sheafiness is asserted for completed tensor products of rings not of noetherian type (for
instance of two perfectoid rings over a non-perfectoid base); those cases are PerfectoidSpaces layer
P2 and AdicSpacesPartIV layer R5. For `C = A` (`μ = id`) the statement reduces to `B ⊗̂_A A = B`; for `B = 0` the
tensor product is the zero ring, of noetherian type and sheafy on the empty space. *Needs:*
*completed-tensor-restricted-power-series*;
*topologically-finite-type-noetherian-type*; *noetherian-type-stably-sheafy*;
*topologically-finite-type-is-adic*; *noetherian-type-huber-ring*; Tau Ceti
`TauCeti.Huber.IsTopologicallyFiniteType`.
Lean: README target.

**Rational localisation commutes with completed tensor products.**
(*completed-tensor-rational-localisation*) Let `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)` be
morphisms of complete Hausdorff Huber pairs with adic ring homomorphisms, `D = B ⊗̂_A C`, and
`p_B = Spa(inl) : Spa D → Spa B`, `p_C = Spa(inr)` (Tau Ceti `Pair.Hom.spaComap`). Let
`U = R(T/s) ⊆ Spa B`, `V = R(T'/s') ⊆ Spa C`, `W = R(T''/s'') ⊆ Spa A` be rational subsets (`T·B`
open, etc.) with `Spa(f)(U) ⊆ W` and `Spa(g)(V) ⊆ W`, and let `O(U) = B⟨T/s⟩` etc. denote the
rational localisations as complete Huber pairs (AdicSpaces layer 3.1; Tau Ceti
`completionLocalization`). The preimage statement of this target gives the
intersection formula in (1); `Pair.completedTensorRationalEquiv` states (2) and (3), including
adicness of both maps out of `O(W)`. Prove: (1) `p_B⁻¹(U) = R(inl(T)/inl(s))` and
`p_C⁻¹(V) = R(inr(T')/inr(s'))` are rational, and `p_B⁻¹(U) ∩ p_C⁻¹(V)` is the rational subset
`R(inl(T ∪ {s})·inr(T' ∪ {s'}) / inl(s)inr(s'))` (Wedhorn §7.5, Lem. 7.46(3), p. 68, preimages of
rational subsets under adic maps are rational); (2) the maps `O(W) → O(U)`, `O(W) → O(V)` are adic
and the canonical morphism `O(U) ⊗̂_{O(W)} O(V) → O_D(p_B⁻¹(U) ∩ p_C⁻¹(V))` is an isomorphism of
complete Huber pairs (KL15 §2.4, after Def. 2.4.12, p. 41, the statement for adic Banach rings over
a common base: the completed tensor product of two rational localisations is the rational
localisation of the intersection; for general Huber pairs, apply the geometric universal
property in Wedhorn §8.1, Lem. 8.1, p. 74, together with the completed tensor universal
property); (3) consequently `Spa(O(U) ⊗̂_{O(W)} O(V)) → Spa D` is a
homeomorphism onto `p_B⁻¹(U) ∩ p_C⁻¹(V)` matching rational subsets (Huber94 §1, Lem. 1.5(ii),
p. 518, Spa of a rational localisation is the rational subset, with rational subsets matched). For
`X = Spa(ℚ_p⟨T⟩)`, `Y = Spa(ℚ_p⟨S⟩)` over `Spa ℚ_p`, `U = R(T/p) = {|T| ≤ |p|} ⊆ X` and
`V = R(1/S) = {|S| = 1} ⊆ Y`: `p_X⁻¹(U) ∩ p_Y⁻¹(V) = {|T| ≤ |p|, |S| = 1}` in the bidisc
`Spa(ℚ_p⟨T, S⟩)`, and `ℚ_p⟨T/p⟩ ⊗̂_{ℚ_p} ℚ_p⟨S, S⁻¹⟩ ≅ ℚ_p⟨T, S⟩⟨T/p, 1/S⟩`. Degenerate instances:
`U = Spa B` (`T = {1}`, `s = 1`) gives `p_B⁻¹(U) ∩ p_C⁻¹(V) = p_C⁻¹(V)` and
`B ⊗̂_{O(W)} O(V)`; `s = 0` gives the empty rational subset and the zero ring on both sides. *Needs:*
*completed-tensor-product*; *completed-tensor-product-universal-property*;
*topologically-finite-type-is-adic*; *adic-ring-homomorphism*; Tau Ceti
`TauCeti.Huber.Pair.Hom.spaComap`, `TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`TauCeti.ValuationSpectrum.rationalSubset`, `TauCeti.Huber.PairOfDefinition.completionLocalization`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`TauCeti.ValuationSpectrum.spaCompletedLocalizationHomeomorph`,
`TauCeti.ValuationSpectrum.bijOn_preimage_spaCompletedLocalizationHomeomorph_spaRationalFamily`.
`Huber.Pair.completedTensorRationalEquiv_preimage` carries the complete pairs, adic maps
and rational presentations of this target, and gives both rational preimage formulas and
the intersection formula (1), without assuming sheafiness.

Lean: README target.

In `Pair.completedTensorRationalEquiv`, choose pairs of definition with their rings contained
in the corresponding plus rings, and presentations `a`, `b`, `c` for `W`, `U`, `V` whose
numerators generate open ideals. The hypotheses `hf`, `hg` express the two image containments.
The presentation `d` has open numerator ideal and represents exactly `p_B⁻¹(U) ∩ p_C⁻¹(V)`;
(1) supplies such a presentation. All four localised rings are the supplier's separated
completions of `Localization.Away` with `locUniformSpace`, and their plus rings are
`completedPlusSubring`. The conclusion constructs the adic pair maps from `O(W)` and a ring
equivalence `e` that is a homeomorphism and maps the tensor plus ring onto the localised plus
ring. Its coefficient formula is `e(ρ_B(b) ⊗ ρ_C(c)) = ρ_D(b ⊗ c)`. The homeomorphism `H` in
(3) pulls valuations back along `e⁻¹ ∘ ρ_D`, and its inverse-image operation bijects rational
subsets of `Spa D` contained in the intersection with rational subsets of the tensor spectrum
(Wedhorn §8.1, Prop. 8.2(2), pp. 74–75). No sheafiness hypothesis is needed: `O` here denotes
the rational-localisation pairs of the structure presheaf.

AdicEtaleGeometry A0.4's `Huber.Pair.completedTensor.rationalLocalizationIso`, coefficient
equation, homeomorphism and plus-ring transport specialize this comparison: take `C = A`,
`g = id`, `U = Spa B`, `W = Spa A` and `V = R(T/s) ⊆ Spa A`, and use the unit comparison
`B ⊗̂_A A ≅ B`. The coefficient equation becomes `b ⊗ a ↦ b·φ(a)`, with the localized
coefficient maps understood. Those convenience interfaces adapt this theorem; their site and
geometric applications belong to AdicEtaleGeometry A0.4.

`Huber.tensorTopology`, the statement that it is a ring topology, its canonical uniformity
and `Huber.CompletedTensor` require `[IsHuberRing A]`, `[IsHuberRing B]`, `[IsHuberRing C]`,
`[IsAdicHom (algebraMap A B)]` and `[IsAdicHom (algebraMap A C)]`.
Its neighbourhood-basis statement fixes this ring topology using any compatible pairs of
definition: in the subring `F` generated by the images of `B₀` and `C₀`, let `J` be generated by
the image of `I`; the images of `Jⁿ` in `B ⊗_A C` form a neighbourhood basis at zero.
The definition `Pair.completedTensor.pairOfDefinition A B C P Q R f g hf hg hIf hIg`
takes precisely this datum: `P`, `Q`, `R` are pairs of definition, `f : P.ringOfDefinition →+*
Q.ringOfDefinition` and `g : P.ringOfDefinition →+* R.ringOfDefinition` agree with the two
`algebraMap`s after inclusion (`hf`, `hg`), and the images of `P.idealOfDefinition` define
the topologies on the two target rings of definition (`hIf`, `hIg`). No completeness of the
input rings is required. `Pair.completedTensor.pairOfDefinition_ringOfDefinition` states
that its ring is `(F.map tmul).topologicalClosure`, and
`Pair.completedTensor.pairOfDefinition_idealOfDefinition` states that its ideal is the span,
inside that closed subring, of the image of `P.idealOfDefinition` under the completed
structural map. These are equations for the chosen data, which can vary even though the
tensor topology does not. The tensor subring is the construction in Huber96 §1.2, proof of
Proposition 1.2.2(1), p. 47; its completion uses AdicSpaces §0.3 and the supplied
`TauCeti.Huber.PairOfDefinition.completion` (Wedhorn Remark 6.8).

*Checks for the specified pair of definition:*

- For complete Hausdorff `A`
  and identity structure maps with `P = Q = R`, a scalar maps into the chosen ring exactly
  when it lies in `P.ringOfDefinition`. In particular, a proper ring of definition stays
  proper under the identification `A ⊗̂_A A ≅ A`.
- Under the same hypotheses,
  an element of `P.ringOfDefinition` maps into the chosen ideal exactly when it lies in
  `P.idealOfDefinition`. Thus choosing `(p)` or `(p²)` in `ℤ_p` gives distinct ideals,
  despite defining the same topology.
- For any compatible datum
  with `P.idealOfDefinition = 0`, the resulting ideal is exactly zero, not just nilpotent.

`Pair.completedTensor.comm` and `Pair.completedTensor.comm_tmul` use the same Huber-ring
and adic-structure-map hypotheses: symmetry exchanges the generators, and `comm_mem_plus`
states that it identifies the two plus rings. The symmetry follows from the completed
cocartesian construction (Huber96 §1.2, proof of Proposition 1.2.2(1), p. 47).

*Checks for the tensor symmetry:*
- *Compatibility.* Exchanging the factors twice
  fixes every completed tensor.
- *Computation.* Symmetry takes
  `b₁ ⊗ c₁ − b₂ ⊗ c₂` to `c₁ ⊗ b₁ − c₂ ⊗ b₂`, without reversing the subtraction.
- *Degenerate.* If the left factor is the zero ring,
  the completed tensor is zero and symmetry sends every element to zero.

*Checks for the tensor topology and its uniformity:*
- *Degenerate.* Three discrete rings give the discrete
  tensor topology and the principal uniformity on the diagonal.
- *Compatibility.* Multiplication
  `ℚ_p ⊗_{ℚ_p} ℚ_p ≅ ℚ_p` identifies both the tensor topology and its uniformity with the
  usual p-adic ones.
- *Non-example.* Neither of those p-adic
  structures is discrete; the diagonal alone is not an entourage.
- *Degenerate.* Tensoring with the zero ring has
  zero separated completion. Together with `completedTensor_test_polydisc` and
  `completedTensor_test_unit`, this tests the completed tensor carrier itself.

The elementary tensor homomorphism is Mathlib's `UniformSpace.Completion.coeRingHom`
for `tensorUniformSpace`. For commutative diagrams of Huber-pair maps with adic structure
maps, `Pair.completedTensor.map_tmul`, `map_id` and `map_comp` specify its functoriality.
For Huber rings `A`, `B`, `C`, `C'`, assume adic `A → B`, `A → C`, `A → C'`
and `C → C'`, with `[IsScalarTower A C C']`. The right inclusion `C → B ⊗̂_A C`
is adic by `Pair.completedTensor.isAdicHom_inl`, so the iterated tensor is defined.
The cancellation comparison is a homeomorphism (`cancelBaseChange_homeomorph`);
`cancelBaseChange_tmul` sends `(b ⊗ c) ⊗ d` to `b ⊗ (g(c)d)`.
For finite weight families and an adic coefficient map, `completedTensorRestrictedEquiv_tmul`
sends `f ⊗ b` to `weightedMapCompletion(f) · b`, and
`completedTensorRestrictedEquiv_homeomorph` identifies the topologies.
These equations use the completed cocartesian ring construction of Huber96 §1.2,
proof of Proposition 1.2.2(1), p. 47; the restricted-series comparison has the hypotheses
of Huber94 Lemma 3.5 already specified above.

*Checks for the comparison maps and their structures:*

- For complete Hausdorff A, the elementary map kills a ⊗ b − ab ⊗ 1.
- For complete Hausdorff A, the elementary map A ⊗ₐ A → A ⊗̂ₐ A is bijective.
- For the zero base ring its value on every tensor is zero.
- For compatible pairs and a zero factor the chosen ring of definition is the whole zero ring and its ideal is zero.
- For compatible pairs in discrete A, B, C the chosen ideal of definition in the completed tensor is nilpotent.
- For nondiscrete complete Hausdorff A and the same pair P on all three copies, no power of the ideal of definition in A ⊗̂ₐ A is zero; a zero-ideal construction would give the wrong topology.
- With C = 0, both inclusions send 1 to 0.
- The two inclusions send (ab,c) and (b,ac) to the same product, so their difference is zero.
- The left and right images of every base scalar coincide.
- For complete Hausdorff A and three identical pairs, both inclusions are bijections.
- With C = 0 the plus ring is the whole completed tensor ring.
- Every nilpotent of the completed tensor lies in its plus ring, whether or not it is an elementary tensor.
- Every idempotent of the completed tensor lies in its plus ring. The ramified quadratic Check above additionally separates the plus ring from the tensor image.
- The induced map sends b₁ ⊗ c₁ − b₂ ⊗ c₂ to φ(b₁)ψ(c₁) − φ(b₂)ψ(c₂).
- For a zero target ring the induced map is zero on the entire completion.
- Over complete Hausdorff A, composing the lift of two identity maps with the elementary tensor map is Mathlib’s algebraic tensor unit map.
- Lifting a base scalar through the left factor gives its prescribed image through the right factor.
- On an identity diagram, the induced map sends the image of `2 ⊗ 3 − 7 ⊗ 1` to `−1` in the completed tensor ring.
- A diagram map sends b₁ ⊗ c₁ − b₂ ⊗ c₂ to f(b₁) ⊗ g(c₁) − f(b₂) ⊗ g(c₂).
- A diagram whose right target factor is zero induces the zero map.
- Cancellation sends (b₁ ⊗ c₁) ⊗ d₁ − (b₂ ⊗ c₂) ⊗ d₂ to b₁ ⊗ g(c₁)d₁ − b₂ ⊗ g(c₂)d₂.
- When B = 0, cancellation sends every completed tensor to zero.
- The inverse cancellation sends b ⊗ d to (b ⊗ 1) ⊗ d.
- Weighted-series base change sends X₀² ⊗ b − X₁³ ⊗ c to bX₀² − cX₁³.
- With no variables, the comparison sends 1 ⊗ b to the constant b in the completed coefficient ring.
- With zero target coefficient ring, the restricted-series comparison sends every element to zero.

### R0.4 the spectral seminorm, uniformization and the uniform completed tensor product

**The norm of a Tate ring attached to a ring of definition, a pseudouniformiser and a radius.**
(*tate-ring-norm*) For a Tate ring `A` with a ring of definition `A₀`, a pseudouniformiser `ϖ ∈ A₀`
and `0 < r < 1`, the gauge `α(x) = inf{rⁿ : n ∈ ℤ, ϖ⁻ⁿx ∈ A₀}` is a nonarchimedean ring seminorm
defining the topology of `A` and vanishing exactly on the closure of `{0}`; it changes by a bounded
factor when `A₀` changes and by a real power when `r` changes. Supplied by PadicFunctionalAnalysis
§0.4. The supplier normalises the gauge by a radius `a > 1` with values `a^{−n}` and states the norm for
Hausdorff `A` and the seminorm without that hypothesis; this roadmap uses the seminorm at `a = r⁻¹`
and packages its inputs as a *norm datum* `d = (A₀, ϖ, r)`, in `Huber` the structure
`TateNormDatum A` (a Tau Ceti `PairOfDefinition A`, a pseudouniformiser `ϖ` in its ring of
definition and `r ∈ (0, 1)`), with `tateNorm d = α_d : RingSeminorm A`. For the chosen source
and target data, this roadmap supplies the functoriality adapter `tateNorm_map_le`: for a
continuous ring homomorphism `φ : A → B` of Tate rings, a datum `d` on `A` and the datum
`d' = (B₀, φ(ϖ), r)` on `B` with `φ(A₀) ⊆ B₀`, `α_{d'}(φ x) ≤ α_d(x)`.
Lean: README target.

The carrier-bridge names `Huber.tateNorm_apply`, `Huber.tateNorm_pseudoUniformizer_mul`
and `Huber.tateNorm_hasBasis_nhds_zero` refer to PadicFunctionalAnalysis §0.4,
not to a second gauge construction. For a Tate norm datum `d = (A₀,ϖ,r)` with
`ϖ ∈ A₀`, they respectively give the displayed infimum formula for every `x`,
`α_d(ϖx) = r α_d(x)`, and the zero-neighbourhood basis `{x | α_d(x) < ε}`, `ε > 0`.
The first is `tateGauge` at `a = r⁻¹`; the basis is `exists_tateSeminorm`;
the scaling equality follows by shifting the integer in the infimum.

**Checks.**

- *Convention.* For `A = ℚ_p` with `A₀ = ℤ_p`, `ϖ = p` and `r = 1/p`, `α_d(x) = |x|_p` for every
  `x`; this is the supplier's gauge at `a = p`, which fixes `a = r⁻¹`.

- With `ϖ = p²`, `r = 1/p` and `A₀ = ℤ_p`, the gauge at `p` is `1` and at `p²`
  is `1/p`; its scaling law holds although the gauge is not multiplicative.
- On the zero ring the gauge is zero and every positive-radius ball is the whole ring.

**The spectral seminorm of a Tate ring.** (*spectral-seminorm*) Let `A` be a Tate ring with a norm
datum `d = (A₀, ϖ, r)` and norm `α_d` (*tate-ring-norm*, PadicFunctionalAnalysis §0.4). The
*spectral seminorm* of `(A, d)` is
`|x|_sp := lim_{n→∞} α_d(xⁿ)^{1/n} = inf_{n≥1} α_d(xⁿ)^{1/n}` (KL15 §2.1, Def. 2.1.9, p. 27, the
smoothing of a submultiplicative seminorm; the limit exists by Fekete's lemma), which is Mathlib's
`smoothingSeminorm α_d` (defined because `α_d(1) ≤ 1` and `α_d` is nonarchimedean). It is a
power-multiplicative nonarchimedean ring seminorm (Mathlib `IsPowMul`: `|xⁿ|_sp = |x|_spⁿ` for
`n ≥ 1`) with `|x|_sp ≤ α_d(x)`. It does not change when `A₀` is replaced by another ring of
definition containing `ϖ` (equivalent norms have the same spectral seminorm; KL15 §2.1, Def. 2.1.9,
p. 27), and replacing `r` by `r'` raises it to the power `log r'/log r`. Intrinsic properties:
`|x|_sp < 1` iff `x` is topologically nilpotent; `|x|_sp ≤ 1` for every power-bounded `x`; the kernel
`{x : |x|_sp = 0}` is the ideal `⋂ₙ ϖⁿ·A°°` (`A°°` the topologically nilpotent elements), it
contains the nilradical and the closure of `{0}`; `|1|_sp = 1` if `A` is Hausdorff and nonzero (HK
§2, paragraph after Def. 2.10, p. 5, the same formula and its use for uniformity). Functoriality: if
`φ : A → B` is a continuous ring homomorphism of Tate rings and `B` carries a datum `(B₀, φ(ϖ), r)`
with `φ(A₀) ⊆ B₀` (such `B₀` exists because `φ` is adic), then `|φ(x)|_sp ≤ |x|_sp`. Fixed
convention: the Gel'fand-spectrum formula `|x|_sp = max_{β ∈ M(A)} β(x)` (Berkovich) is not part of
this statement; it is the input of *uniform-spectral-seminorm* in AdicSpacesPartIII layer R3. In `Huber`, define
`spectralSeminorm d` as the power-multiplicative ring seminorm `|·|_sp : RingSeminorm A`,
`smoothingSeminorm (tateNorm d)`. The abbreviation fixes the Tate norm datum;
Mathlib's `tendsto_smoothingFun_of_map_one_le_one`, `isPowMul_smoothingFun` and
`smoothingFun_le_self` supply convergence, power multiplicativity and the upper bound.
Prove `spectralSeminorm_eq_of_ringOfDefinition` (two data differing only in the ring of
definition have the same spectral seminorm), `spectralSeminorm_rpow` (changing `r` to `r'`:
`|x|_sp' = |x|_sp ^ (log r' / log r)`), `spectralSeminorm_lt_one_iff`
(`|x|_sp < 1 ↔ IsTopologicallyNilpotent x`), `spectralSeminorm_le_one_of_isPowerBounded`
(`IsPowerBounded x → |x|_sp ≤ 1`), `spectralSeminorm_eq_zero_iff` (`|x|_sp = 0 ↔ ∀ n, ϖ⁻ⁿx` is
topologically nilpotent; the kernel is an ideal containing the nilradical and the closure of `{0}`),
`spectralSeminorm_one` (simp: `|1|_sp = 1` if `A` is Hausdorff and nontrivial),
`spectralSeminorm_map_le` (for continuous `φ : A → B` of Tate rings with a datum `(B₀, φ(ϖ), r)`,
`φ(A₀) ⊆ B₀`: `|φ x|_sp ≤ |x|_sp`) and `spectralSeminorm_eq_spectralNorm` (for a finite extension
`L/K` of a complete nonarchimedean field with the unit-ball datum: `|·|_sp = spectralNorm K L`).
*Needs:* *tate-ring-norm* (PadicFunctionalAnalysis §0.4); *adic-ring-homomorphism*; Mathlib
`smoothingSeminorm`,
`isPowMul_smoothingFun`, `smoothingFun_le_self`, `smoothingFun_le`,
`tendsto_smoothingFun_of_map_one_le_one`, `IsPowMul`, `IsTopologicallyNilpotent`, `spectralNorm`,
`spectralNorm_unique`; Tau Ceti `TauCeti.Huber.IsPowerBounded`,
`TauCeti.Huber.isPowerBounded_iff_norm_le_one`, `TauCeti.Huber.IsUniform.of_normedDivisionRing`.
The smoothing construction and the finite-extension case are Mathlib's (`smoothingSeminorm`,
`spectralNorm`, `spectralNorm_unique`); the degenerate case of a normed division ring is Tau Ceti's
(`isPowerBounded_iff_norm_le_one`, `IsUniform.of_normedDivisionRing`); what is new is the seminorm
attached to a norm datum of an arbitrary Tate ring, its independence of the ring of definition, and
its intrinsic characterisations.
Lean: README target.

**Checks.**

- *Computation.* For a prime `p`, take `A = ℚ_p⟨T⟩` with
  `A₀ = ℤ_p⟨T⟩`, `ϖ ∈ ℤ_p`, `0 < |ϖ|_p < 1` and `r = |ϖ|_p`:
  `|Σ aₙTⁿ|_sp = sup |aₙ|_p` (the Gauss norm).
- *Non-example.* For a prime `p`, take `A = ℚ_p[ε]/(ε²)`
  with `A₀ = ℤ_p ⊕ ℤ_pε`, `ϖ = p` and `r = 1/p`:
  `|ε|_sp = 0` while `α_d(ε) = 1`; a definition taking `|·|_sp` to be the norm `α_d`, or claiming it
  is always a norm, fails.
- On `ℚ_p`, choose the ring of definition `ℤ_p`, `ϖ = p` and `r = 1/p`. Both `spectralSeminorm d` and Mathlib’s `spectralNorm ℚ_p ℚ_p` take the value `1/p` at `p`.
- *Characterisation.* In `ℚ_p⟨T⟩`: `|pT|_sp < 1` and `pT` is
  topologically nilpotent, while `|T|_sp = 1` and `T` is power-bounded but not topologically
  nilpotent.
- *Degenerate.* On the zero ring `|·|_sp = 0`; on a Hausdorff nonzero
  `A`, `|1|_sp = 1`. Both hypotheses are used: `|1|_sp ∈ {0, 1}` by power-multiplicativity, and
  `|1|_sp = 0` iff `1 ∈ ⋂ₙ ϖⁿA₀ = closure {0}`; for `ℤ` with the indiscrete topology (a Tate ring
  with `A₀ = ℤ`, `ϖ = 1`, every unit being topologically nilpotent) `α_d ≡ 0` and `|1|_sp = 0`
  although the ring is nonzero.

For a Tate ring A, `SpectralTop.isUniformAddGroup` and
`SpectralTop.isTopologicalRing` assert compatibility of the spectral uniformity with
addition and multiplication. Together with `SpectralTop.isTateRing`, these are
property theorems for the topology of KL15, Remark 2.3.11(c).

**The spectral topology of a Tate ring.** (*spectral-topology*) Let `A` be a Tate ring (Tau Ceti
`IsTateRing`). The *spectral topology* on `A` is the topology defined by a spectral seminorm
`|·|_sp` (*spectral-seminorm*): the ring topology whose neighbourhoods of `0` are generated by the
balls `{x : |x|_sp < ε}`, `ε > 0` (KL15 §2.3, Rem. 2.3.11(c), p. 36: a separate topology on `A`,
coarser and in general not complete). For every pseudouniformiser `ϖ` of `A` the sets `ϖⁿ·A°°`
(`n ≥ 0`; `A°°` the ideal of topologically nilpotent elements) form a basis of neighbourhoods of `0`
for it; in particular it does not depend on the norm datum. Write `A_sp` for `A` with this topology.
Then: (i) the identity `A → A_sp` is continuous; (ii) `A_sp` is a Tate ring with pseudouniformiser
`ϖ` and pair of definition `(A_sp,≤1, ϖ·A_sp,≤1)`, where `A_sp,≤1 = {x : |x|_sp ≤ 1}`; (iii) the
topologically nilpotent elements of `A_sp` are those of `A`, and `A_sp° = {x : |x|_sp ≤ 1}` is
bounded, so `A_sp` is uniform (HK §2, Def. 2.3, p. 3; the AdicSpaces layer 4.2 predicate); (iv) every
ring of integral elements `A⁺` of `A` is a ring of integral elements of `A_sp`, giving a Tau Ceti
`Pair` on `A_sp` and a morphism of Huber pairs `(A, A⁺) → (A_sp, A⁺)`; (v) every continuous ring
homomorphism `φ : A → B` of Tate rings is continuous as a map `A_sp → B_sp`; (vi) the identity
`A → A_sp` is a homeomorphism iff `A°` is bounded, i.e. iff `A` is uniform (HK §2, Rem. 2.11, p. 5;
the form of uniformity used is condition (d) of KL15 §2.8, Def. 2.8.1(b),(d), p. 59, `A°` bounded,
whose equivalence with the norm-theoretic forms (a)–(c) holds for the norms `α_d` of
*tate-ring-norm* (PadicFunctionalAnalysis §0.4; use `Huber.SpectralTop.homeomorph_of_isBounded`
below to compare the spectral topology) but not for every norm,
contrary to the source (KL16, Appendix A)). In `Huber`, define `SpectralTop A` as the type synonym
`SpectralTop A := A` with the ring structure of `A` and the topology of `|·|_sp`, with the ring
equivalence `toSpectralTop : A ≃+* SpectralTop A`; prove `SpectralTop.hasBasis_nhds_zero` (for a
pseudouniformiser `ϖ`, the sets `toSpectralTop '' (ϖⁿ • A°°)` form a basis of `𝓝 0` in
`SpectralTop A`), `SpectralTop.nhds_zero_eq_seminorm` (for every norm datum `d`, the topology of
`SpectralTop A` is the topology of `spectralSeminorm d`, independent of `d`),
`SpectralTop.continuous_toSpectralTop` (`toSpectralTop : A → SpectralTop A` is continuous),
`SpectralTop.isTateRing` (a theorem: `SpectralTop A` is a Tate ring, with pseudouniformiser `ϖ`),
`SpectralTop.pairOfDefinition` (the pair of definition `({|x|_sp ≤ 1}, ϖ·{|x|_sp ≤ 1})`),
`SpectralTop.isTopologicallyNilpotent_iff` (simp: `toSpectralTop x` is topologically nilpotent iff
`x` is), `SpectralTop.powerBoundedSubring_eq` (`(SpectralTop A)° = {x : |x|_sp ≤ 1}`),
`SpectralTop.isBounded_powerBoundedSubring` (the conclusion
`IsUniform (SpectralTop A)`), `SpectralTop.pair` (a Huber pair `(A, A⁺)` gives the Huber pair
`(SpectralTop A, A⁺)` and the morphism `Pair.Hom (A, A⁺) (SpectralTop A, A⁺)` with underlying map
`toSpectralTop`), `SpectralTop.map` (a continuous `φ : A →+* B` of Tate rings induces a continuous
`SpectralTop A →+* SpectralTop B`; `map_id`, `map_comp`) and `SpectralTop.homeomorph_of_isBounded`
(`IsUniform A ↔ IsHomeomorph toSpectralTop`). *Needs:* *spectral-seminorm*; *tate-ring-norm*
(PadicFunctionalAnalysis §0.4); *adic-ring-homomorphism*; Tau Ceti
`TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition`,
`TauCeti.Huber.powerBoundedSubring`, `TauCeti.Huber.IsUniform`,
`TauCeti.Huber.IsPseudoUniformizer.hasBasis_nhds_zero`,
`TauCeti.Huber.IsRingOfIntegralElements.mem_of_isTopologicallyNilpotent`,
`TauCeti.Huber.topologicallyNilpotentIdeal`, `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`; Mathlib
`IsTopologicallyNilpotent`.
Lean: README target.

**Checks.**

For a complete nontrivially normed nonarchimedean field K,
`weightedSeries.isUltrametricDist`, `weightedSeries.completeSpace` and
`weightedSeries.isTateRing` state the ultrametric inequality, completeness and
Tate property for the degree-weighted norm used below (KL15, Remark 2.3.11(c)).

The carriers in the weighted-series Checks are `weightedSeries K`, the subalgebra
of `PowerSeries K` satisfying `‖aₙ‖(n+1) → 0`, and `weightedSeriesNorm K`, whose
value is `supₙ ‖aₙ‖(n+1)`. K is a complete nontrivially normed nonarchimedean field.
`weightedSeries_spectralTopology` states that `‖fⁿ‖^(1/n)` tends to the Gauss norm,
that T becomes power-bounded in the spectral topology, and that this topology is
Hausdorff but incomplete. The spectral root limit is KL15 §2.1, Definition 2.1.9,
p. 27; here the coefficient calculation supplies the example.

- The zero series belongs and has norm zero.
- The constant a belongs and has norm |a|.
- Tⁿ belongs and has norm n+1, including n = 0; thus the weighted norm is not power-multiplicative.

- *Degenerate.* For a prime `p` and `A = ℚ_p⟨T⟩`, the identity
  `ℚ_p⟨T⟩ → SpectralTop ℚ_p⟨T⟩` is a homeomorphism (`ℤ_p⟨T⟩ = A°` is bounded).
- *Computation.* For a prime `p`, take `A = ℚ_p[ε]/(ε²)` with the topology of a finite free
  `ℚ_p`-module. The closure of `{0}` in `SpectralTop A` is `ℚ_p·ε`, so `SpectralTop A` is not Hausdorff
  while `A` is.
- *Non-example.* Take the weighted-series ring over
  `ℚ₂` and the polynomials `s_N = Σ_{k<N} 2ᵏT^(2ᵏ)`. Their images in `SpectralTop`
  form a Cauchy sequence with no limit there. The coefficientwise limit has Gauss
  tails tending to zero, but at degree `2ᵏ` its weighted coefficient norm is
  `2^(−k)(2ᵏ+1) = 1 + 2^(−k)`, which does not tend to zero. Thus the spectral
  topology is incomplete despite being Hausdorff (the Gauss-norm calculation in
  `weightedSeries_spectralTopology`; KL15 Definition 2.1.9, p. 27).
- For `A = ℚ_p[ε]/(ε²)` with its product topology, every `cε` is power-bounded in `SpectralTop A`, which is not Hausdorff. Uniformity does not imply separation.

**The spectral topology has the same continuous valuations, adic spectrum and rational subsets.**
(*spectral-topology-cont-eq*) Let `A` be a Tate ring, `A⁺` a ring of integral elements of `A`, and
`A_sp = SpectralTop A` (*spectral-topology*). Prove that a valuation on `A` is continuous for the
topology of `A` iff it is continuous for the spectral topology: `Cont(A_sp) = Cont(A)` as subsets of
`Spv(A)` (Tau Ceti `ValuationSpectrum.cont`). Consequently, for every ring of integral elements `A⁺`
of `A`, `Spa(A_sp, A⁺) = Spa(A, A⁺)` as subspaces of `Spv(A)` (Tau Ceti
`ValuationSpectrum.spa A⁺` for the two topologies), and for every finite `T ⊆ A` and `s ∈ A` the
rational subsets `R(T/s)` (Tau Ceti `ValuationSpectrum.rationalSubset A⁺ T s`) of the two spectra are
equal; a finite subset generates an open ideal of `A` iff it generates an open ideal of `A_sp` (in
both Tate rings: iff it generates the unit ideal) (KL15 §2.8, Def. 2.8.13, p. 63, the claim at the
level of `A_sp`, for which Kedlaya–Liu give no proof; KL15 §2.4, Def. 2.4.3 and the paragraph after
it, pp. 38–39: `Spa` depends on the topology only through continuity of valuations). For
`A = K[ε]/(ε²)` with `A⁺ = K° + Kε` and `K = ℚ_p`, `Spa(A_sp, A⁺) = Spa(A, A⁺)` is a single point,
the valuation `a + bε ↦ |a|_p`; for uniform `A` the statement is the identity (`A_sp = A` by clause
(vi) of *spectral-topology*). *Needs:* *spectral-topology*; Tau Ceti
`TauCeti.ValuationSpectrum.cont`, `TauCeti.ValuationSpectrum.spa`,
`TauCeti.ValuationSpectrum.spa_def`, `TauCeti.ValuationSpectrum.rationalSubset`,
`Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent`,
`Valuation.exists_pow_lt_of_isTopologicallyNilpotent`,
`TauCeti.Huber.IsTateRing.isOpen_iff_eq_top`.
Lean: README target.

**The uniformization of a Tate Huber pair.** (*uniformization*) Let `(A, A⁺)` be a Huber pair (Tau
Ceti `Pair`) with `A` a Tate ring. Its *uniformization* is the Huber pair `(A^u, A^{u+})` where `A^u`
is the Hausdorff completion of `A_sp = SpectralTop A` (*spectral-topology*; Tau Ceti
`IsHuberRing.completion`, `IsTateRing.completion`), i.e. the separated completion of `A` for its
spectral seminorm, and `A^{u+}` is the closure of the image of `A⁺` in `A^u` (KL15 §2.8, Def.
2.8.13, p. 63, the ring `A^u` and the plus ring). It comes with the morphism of Huber pairs
`ι : (A, A⁺) → (A^u, A^{u+})`, the composite of the continuous identity `A → A_sp` and the completion
map. Properties: (a) `(A^u, A^{u+})` is a complete Hausdorff Huber pair, `A^u` is a Tate ring, and
`A^u` is uniform (`A^{u°}` is bounded; the continuous extension of `|·|_sp` to `A^u` is a
power-multiplicative norm defining its topology); (b) `ι` has dense image and kernel
`{x : |x|_sp = 0}`; (c) for every complete Hausdorff Huber pair `(B, B⁺)` with `B°` bounded and
every morphism of Huber pairs `φ : (A, A⁺) → (B, B⁺)` there is exactly one morphism
`φ^u : (A^u, A^{u+}) → (B, B⁺)` with `φ^u ∘ ι = φ`, so uniformization is left adjoint to the
inclusion of complete Hausdorff uniform Tate Huber pairs into Tate Huber pairs (KL15 §2.8, Def.
2.8.13, p. 63, the universal property); (d) `Spa(ι) : Spa(A^u, A^{u+}) → Spa(A, A⁺)` is a
homeomorphism under which rational subsets correspond to rational subsets (KL15 §2.8, Def. 2.8.13,
p. 63); (e) if `A` is complete, Hausdorff and uniform, `ι` is an isomorphism. A use of the
construction is HK §6, proof of Prop. 6.7, p. 17. Fixed conventions: morphisms are Tau Ceti
`Pair.Hom` (continuous, plus rings respected), which for Banach rings are the bounded morphisms (HK
Rem. 2.11); the plus ring is the closure of the image of `A⁺`, not the image. In `Huber.Pair`, define
`uniformization` as the complete Hausdorff Huber pair `(A^u, A^{u+})` on
`Completion (SpectralTop A)` with plus ring the closure of the image of `A⁺`, and `toUniformization`
as the morphism of Huber pairs `ι : (A, A⁺) → (A^u, A^{u+})`; prove `uniformization.isTateRing` (an
instance: `A^u` is a complete Hausdorff Tate ring), `uniformization.isBounded_powerBoundedSubring`
(the conclusion `IsUniform (Uniformization A)`, using AdicSpaces §4.2),
`uniformization.lift` (for a Huber pair `(B, B⁺)` with `[UniformSpace B]`,
`[IsUniformAddGroup B]`, `[CompleteSpace B]`, `[T2Space B]`, `hB : IsUniform B` and
`φ : Pair.Hom (A, A⁺) (B, B⁺)`, the morphism `φ^u : Pair.Hom (A^u, A^{u+}) (B, B⁺)`;
the additive uniformity agrees with the ring topology, and the target is complete and
Hausdorff, as in KL15 Definition 2.8.13, p. 63),
`uniformization.lift_comp_toUniformization` (`(lift φ).comp ι = φ`), `uniformization.hom_ext` (two
morphisms out of `(A^u, A^{u+})` that agree after composing with `ι` are equal),
`uniformization.map` (a morphism of Tate Huber pairs induces a morphism of uniformizations commuting
with `ι`; `map_id`, `map_comp`), `uniformization.denseRange_toUniformization` (`ι` has dense range,
and `ι x = 0 ↔ |x|_sp = 0`), `uniformization.plus_eq_closure` (`A^{u+}` is the closure of `ι(A⁺)`),
`uniformization.extendSpectralSeminorm` (`|·|_sp` extends continuously to a power-multiplicative norm
on `A^u` defining its topology), `uniformization.spaComap_homeomorph`
(`Spa(ι) : Spa(A^u, A^{u+}) → Spa(A, A⁺)` is a homeomorphism),
`uniformization.spaComap_preimage_rationalSubset` (`Spa(ι)⁻¹(R(T/s)) = R(ι(T)/ι(s))`, and every
rational subset of `Spa(A^u, A^{u+})` is of this form) and `uniformization.isIso_of_isUniform` (if
`A` is complete and Hausdorff and `hb : IsUniform A`, `ι` is an isomorphism of Huber pairs). *Needs:*
*spectral-topology*; *spectral-topology-cont-eq*; *spectral-seminorm*; *adic-ring-homomorphism*;
Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`, `TauCeti.Huber.Pair.Hom.spaComap`,
`TauCeti.Huber.IsHuberRing.completion`, `TauCeti.Huber.IsTateRing.completion`,
`TauCeti.Huber.PairOfDefinition.completion`,
`TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`; Mathlib `UniformSpace.Completion`,
`UniformSpace.Completion.denseRange_coe`, `UniformSpace.Completion.extensionHom`,
`UniformSpace.Completion.extensionHom_coe`.
Lean: README target.

**Checks.**

- *Computation.* For a prime `p` and
  `(A, A⁺) = (ℚ_p[ε]/(ε²), ℤ_p + ℚ_pε)`: `(A, A⁺)^u ≅ (ℚ_p, ℤ_p)` with `ι(a + bε) = a`.
- *Non-example.* For the weighted-series ring
  over `ℚ₂`, take `A⁺ = A°`. Under the coefficient-preserving homeomorphic ring
  equivalence `A^u ≅ ℚ₂⟨T⟩`, the series `Σ_{k≥0} 2ᵏT^(2ᵏ)` is an element of the
  uniformization outside the image of `A`. Its coefficient at degree `2ᵏ` is
  `2ᵏ`, and every other coefficient is zero. The weighted decay calculation in
  `spectralTop_weightedSeries` excludes it from `A`, so a Hausdorff quotient alone
  cannot supply this completion (KL15 Definition 2.8.13, p. 63).
- *Degenerate.* For a prime `p`,
  `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)^u ≅ (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` via `ι`, which is bijective;
  the uniformization of the zero pair is the zero pair.
- *Characterisation.* For a prime `p`, take
  `(A, A⁺) = (ℚ_p[ε]/(ε²), ℤ_p + ℚ_pε)` and the uniform pair `(ℚ_p, ℤ_p)`.
  The morphism `a + bε ↦ a` factors uniquely through `ι`. More generally, for every
  morphism `φ` to a complete Hausdorff uniform pair, the specified
  `Pair.uniformization.lift` sends `ι(a + bε)` to `φ(a)`, for all `a,b ∈ ℚ_p`,
  and is the unique pair map whose composite with `ι` is `φ`; also `φ(ε) = 0`.
- *Compatibility.* For `(A, A⁺) = (ℚ₂, ℤ₂)`, the spectral
  seminorm of `2` is `1/2`. The canonical map identifies the uniformization
  homeomorphically with `ℚ₂` and its plus ring with `ℤ₂`: the image of `2` belongs
  to the plus ring, while the image of `1/2` does not
  (KL15 Definitions 2.1.9, p. 27, and 2.8.13, p. 63).


`weightedSeries_uniformization` gives a ring equivalence and homeomorphism
from `Uniformization (weightedSeries K)` to the supplied unit-weight restricted-series
ring in one variable over the same complete nonarchimedean field K. Its coefficient
formula identifies the image of every weighted series, and the canonical map is
injective but not surjective. This is the completion step in KL15 §2.8,
Definition 2.8.13, p. 63, applied to the preceding Gauss-norm calculation.
`Pair.uniformization.banach` gives the general comparison for a complete
nonarchimedean normed commutative Tate ring A: the balls of
`smoothingFun (normRingNorm A).toRingSeminorm` generate `SpectralTop A`, and
`Pair.uniformization S` has plus ring the closure of the canonical image of S.plus.
Since `Uniformization A` is by definition the separated completion of `SpectralTop A`,
this specifies both the ring topology and the plus ring; `uniformization_banach`
computes them for ℚ₂
(KL15 Definitions 2.1.9 and 2.8.13).

`Pair.completedTensor.instIsTateRing` is a theorem: if A is Tate, B and C are
Huber A-algebras and both structure maps are adic, then `CompletedTensor A B C`
is Tate. The image of a pseudouniformiser of A supplies one in the tensor product
(Wedhorn, Proposition 6.25; Huber96, proof of Proposition 1.2.2(1), p. 47).

**The uniform completed tensor product of Tate Huber pairs.** (*uniform-completed-tensor-product*)
Let `(A, A⁺)`, `(B, B⁺)`, `(C, C⁺)` be Huber pairs with `A` a Tate ring, and
`f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)` morphisms of Huber pairs (Tau Ceti `Pair.Hom`; `f`
and `g` are adic and `B`, `C` are Tate by Wedhorn Prop. 6.25). The *uniform completed tensor product*
is `B ⊗̂ᵘ_A C := (B ⊗̂_A C)^u`, the uniformization (*uniformization*) of the completed tensor
product (*completed-tensor-product*), with `inlᵘ := ι ∘ inl` and `inrᵘ := ι ∘ inr` (KL15 §2.8,
sentence before Def. 2.8.13, p. 63, where Kedlaya–Liu introduce the uniformization precisely for
completed tensor products; HK §7, Rem. 7.2, p. 25, uniform completion of a completed tensor product
and its limitation; HK §10, Ex. 10.5, p. 37, a use of it). Properties: (a) it is a complete
Hausdorff uniform Tate Huber pair and `inlᵘ ∘ f = inrᵘ ∘ g`; (b) it has the following universal
property with respect to complete Hausdorff uniform Tate Huber pairs: for every such `(R, R⁺)` and morphisms
`φ : (B, B⁺) → (R, R⁺)`, `ψ : (C, C⁺) → (R, R⁺)` with `φ ∘ f = ψ ∘ g` there is exactly one morphism
`χ : B ⊗̂ᵘ_A C → (R, R⁺)` with `χ ∘ inlᵘ = φ` and `χ ∘ inrᵘ = ψ`; (c) the canonical morphism
`ι : B ⊗̂_A C → B ⊗̂ᵘ_A C` induces a homeomorphism of adic spectra identifying rational subsets;
(d) `ι` is an isomorphism iff `B ⊗̂_A C` is uniform (for instance `K⟨T⟩ ⊗̂_K K⟨S⟩ = K⟨T, S⟩`), and
it is not an isomorphism in general: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not uniform (KL15 §2.8, Rem. 2.8.5,
p. 60: completed tensor products of uniform rings need not be uniform, the reason for the
construction and the non-example). No sheafiness of `B ⊗̂ᵘ_A C` and no fibre-product property of
its `Spa` is claimed. Degenerate instances: `B = 0` gives the zero pair; `B = C = A` with identity
maps gives `A^u`. If the three input pairs are themselves complete, Hausdorff and uniform,
property (b) makes this a pushout in that category; in general it is the pushout of their
uniformizations. In `Huber.Pair`, define `uniformCompletedTensor f g` as the complete Hausdorff
uniform Tate Huber pair `(B ⊗̂_A C)^u`, `uniformCompletedTensor.inl` as
`inlᵘ : Pair.Hom (B, B⁺) (B ⊗̂ᵘ_A C)` and `uniformCompletedTensor.inr` as
`inrᵘ : Pair.Hom (C, C⁺) (B ⊗̂ᵘ_A C)`; prove `uniformCompletedTensor.inl_comp`
(`inlᵘ ∘ f = inrᵘ ∘ g`), `uniformCompletedTensor.lift` (for `(R, R⁺)` with
`[IsUniformAddGroup R] [CompleteSpace R] [T2Space R]`, `hR : IsUniform R` and `φ`, `ψ`
with `φ ∘ f = ψ ∘ g`: the morphism `χ : B ⊗̂ᵘ_A C → (R, R⁺)`; the additive uniformity
agrees with the ring topology, and the target is complete and Hausdorff, as required by
the uniformization adjunction of KL15 §2.8, Def. 2.8.13, p. 63),
`uniformCompletedTensor.lift_comp_inl` (`lift ∘ inlᵘ = φ` and `lift ∘ inrᵘ = ψ`),
`uniformCompletedTensor.hom_ext` (morphisms out of `B ⊗̂ᵘ_A C` agreeing after `inlᵘ` and `inrᵘ` are
equal), `uniformCompletedTensor.isBounded_powerBoundedSubring` (the conclusion
`IsUniform (Uniformization (CompletedTensor A B C))`), `uniformCompletedTensor.fromCompletedTensor` (the morphism `ι` from
`Pair.completedTensor f g`, with `fromCompletedTensor_isIso_iff`: it is an isomorphism iff `B ⊗̂_A C`
satisfies `IsUniform (CompletedTensor A B C)`), `uniformCompletedTensor.spaHomeomorph` (`Spa(B ⊗̂ᵘ_A C) ≅ Spa(B ⊗̂_A C)`, identifying
rational subsets), `uniformCompletedTensor.map` (morphisms of the diagrams induce morphisms of
uniform completed tensor products; `map_id`, `map_comp`), `uniformCompletedTensor.comm`
(`B ⊗̂ᵘ_A C ≅ C ⊗̂ᵘ_A B` exchanging `inlᵘ` and `inrᵘ`) and `uniformCompletedTensor.unitIso`
(`B ⊗̂ᵘ_A A ≅ B^u`). *Needs:* *completed-tensor-product*;
*completed-tensor-product-universal-property*; *uniformization*; *adic-ring-homomorphism*; Tau
Ceti `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`.
Lean: README target.

For Tate rings `A`, `B` with an adic `A`-algebra structure on `B`,
`Pair.uniformCompletedTensor.isHomeomorph_unitIso` states that this unit equivalence
is a homeomorphism. For Huber pairs `S` on `A` and `T` on `B` with the structure map
sending `S.plus` into `T.plus`, `Pair.uniformCompletedTensor.unitIso_tmul` specifies
`unitIso (ι (tmul (b ⊗ a))) = ι_B (b * algebraMap A B a)` for every `b : B`, `a : A`.
Here `tmul` is `Pair.completedTensor.tmul`, `ι` is
`Pair.uniformCompletedTensor.fromCompletedTensor S T S`, and `ι_B` is
`Pair.toUniformization T`. Neither input ring is required to be complete, Hausdorff
or uniform. These are the unit identities from the tensor universal property and
uniformization's universal property ([KL15, Definition 2.8.13, printed p. 63](https://arxiv.org/pdf/1301.0792v5#page=63)).

**Checks.**

- *Computation.* For a complete nonarchimedean field `K`:
  `(K⟨T⟩, K°⟨T⟩) ⊗̂ᵘ_{(K,K°)} (K⟨S⟩, K°⟨S⟩) ≅ (K⟨T, S⟩, K°⟨T, S⟩)`, and `ι` from the completed
  tensor product is an isomorphism.
- *Non-example.* For `A = ℚ_p` and `B = C = ℂ_p` the canonical
  morphism `ℂ_p ⊗̂_{ℚ_p} ℂ_p → ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p` is not an isomorphism, because
  `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not uniform; a definition that omits the uniformization is not a pushout
  among uniform pairs.
- For `A = ℚ_p[ε]/(ε²)`, the unit comparison `A ⊗̂ᵘ_A A → Aᵘ` sends the image of `ε ⊗ 1` to zero, although `ε ≠ 0` in `A`.
- *Characterisation.* For a finite Galois extension `L/K` of
  complete nonarchimedean fields: `L ⊗̂ᵘ_K L ≅ ∏_{σ ∈ Gal(L/K)} L` via `x ⊗ y ↦ (x·σ(y))_σ`, the
  `σ`-component being `lift (id_L, σ)`.
  The ring equivalence `e` is a homeomorphism and satisfies
  `e(q(tmul(x ⊗ y)))(σ) = x·σ(y)`, where `tmul` is `Pair.completedTensor.tmul`
  and `q` is `Pair.toUniformization` on the completed tensor carrier.
  Thus the first inclusion is diagonal and the second has coordinates `σ(y)`;
  for `L = K` the formula is multiplication. The formal statement uses the compatible normed
  `K`-algebra structure on `L`, completeness and ultrametric norms on both fields,
  their Tate structures and the adic coefficient map, together with
  `FiniteDimensional K L` and `IsGalois K L`.
- For `A = B = C = ℚ_p` with plus ring `ℤ_p`, the canonical projection to the uniform tensor has zero kernel and sends the image of `p ⊗ p⁻¹` to `1`.

`SpectralTop.map_comp` states equality of ring homomorphisms for two continuous
maps of Tate rings. `Pair.uniformization.map_comp` states equality of pair morphisms
for two composable morphisms of Tate Huber pairs; the canonical completion maps fix
the order of composition (KL15 §2.8, Definition 2.8.13, p. 63).

`SpectralTop.map_apply` and `Pair.uniformization.map_comp_toUniformization` pin the two
functorial constructions to the original ring homomorphism.

*Checks for functoriality and the degenerate uniformization:*
- *Compatibility.* The identity ring map induces the
  identity on the spectral topology.
- *Degenerate.* A map into the zero Tate ring stays zero.
- *Computation.* The induced map takes `a² − b` to
  `φ(a)² − φ(b)` under the two canonical identifications.
- *Degenerate.* The uniformization of the zero ring is
  the zero ring, and its canonical map is bijective. Together with
  `uniformization_dualNumbers` and `uniformization_tateAlgebra`, this tests the carrier and
  the canonical map in the zero, nonreduced and complete uniform cases.
- *Compatibility.* Uniformizing the identity pair
  map gives the identity pair map.
- *Degenerate.* The induced map into the
  uniformization of the zero ring kills every element of the completed source.
- *Computation.* The image of `ι(a² − b)` is
  `ι(φ(a))² − ι(φ(b))`.

The spectral-pair equations are `SpectralTop.pair_plus`,
`SpectralTop.toPairHom_apply`, `SpectralTop.pairOfDefinition_ring` and
`SpectralTop.pairOfDefinition_ideal`. For any topological commutative Tate ring `A`
and `d : TateNormDatum A`, the last equation identifies
`(SpectralTop.pairOfDefinition d).idealImage 1` with
`toSpectralTop '' (d.ϖ · {a : spectralSeminorm d a ≤ 1})`.
Here `idealImage 1` is the image of the ideal under the inclusion of the ring of
definition, so this equality determines the ideal itself. Its generator is the
pseudouniformiser in `d`; the ring equation alone does not determine this choice.
This specifies the chosen pair for the spectral topology using the Tate-ring
construction of KL15 Remark 2.4.4, p. 39, and the pair-of-definition convention of
AdicSpaces §0.2. No completeness or Hausdorff hypothesis is imposed.

- *Degenerate.* For a zero ring,
  the ideal of definition is both the zero ideal and the whole ring of definition.
- *Computation.* For any norm
  datum on ℚₚ with `ϖ = p`, the ideal image contains p and excludes 1.
- *Non-example.* For any
  norm datum on ℚₚ with `ϖ = p²`, the ideal image contains p² and excludes p;
  the closed spectral unit ball remains ℤₚ. Both p-adic checks include p = 2.

- *Degenerate.* Over the zero ring, both spectral
  integral subrings are the whole ring and the pair morphism is the unique ring map.
- *Non-example.* In ℚₚ, the image of p belongs to the
  spectral ring of definition, whereas p⁻¹ belongs to neither that ring nor the
  spectral pair's plus ring; the pair morphism still sends p⁻¹ to p⁻¹.
- *Computation.* The spectral pair of the dual
  numbers retains the nonzero element ε. It lies in both integral subrings; the
  spectral pair morphism and `toSpectralTop` retain ε, before Hausdorff completion.
- *Degenerate.* The plus ring of the uniformized
  zero ring is the whole ring.
- *Compatibility.* For a complete Hausdorff
  uniform Tate pair, pulling the uniformized plus ring back along ι gives exactly A⁺.
- *Computation.* For
  (ℚₚ[ε]/ε², ℤₚ + ℚₚε), the isomorphism of its uniformization with ℚₚ sends the plus
  ring to ℤₚ and sends ι(a + bε) to a.
- *Degenerate.* The lifted map into a zero
  ring sends every element to zero.
- *Compatibility.* For a complete
  Hausdorff uniform Tate pair, lifting the identity is inverse to ι on the whole
  uniformization. The computation `uniformization_lift_dualNumbers` evaluates
  the specified lift on every ι(a + bε), including nonzero scalars, and asserts uniqueness.

For diagrams with Tate base rings and adic structure maps,
`Pair.uniformCompletedTensor.map_tmul`, `map_id` and `map_comp` specify the induced maps.
`comm_inclusions` exchanges the two inclusions; `comm_topology_plus` asserts that the
exchange is a homeomorphism and preserves plus-ring membership in both directions.
The following computations use uniformization of the completed ring, including its
Hausdorff quotient: nilpotents disappear even if the original completed tensor is nonzero.
This is the universal uniform completion of KL15 §2.8, Definition 2.8.13; the
`ℂ_p ⊗̂_{ℚ_p} ℂ_p` failure of uniformity is KL15 Remark 2.8.5, printed p. 60.

*Checks for the comparison maps and their structures:*

- The induced uniform tensor map sends the difference of two products of inclusions to the corresponding difference for the image factors.
- A zero target factor makes the induced map zero on the whole uniform completion.
- On an identity diagram, the induced map sends the uniformized image of `2 ⊗ 3 − 7 ⊗ 1` to `−1`.
- Nilpotent elements in either input factor have zero image under its inclusion.
- A zero factor makes the plus ring the whole zero ring, both inclusions zero, and the map from the ordinary completed tensor zero.
- Every idempotent belongs to the plus ring of the uniform completed tensor.
- For `A = B = C = ℚ_p⟨T⟩`, identity maps and
  `S = padicDiscSmallPair p`, the uniform completed tensor also has plus ring different
  from its power-bounded subring. The image of `T` under `inlᵘ` is power-bounded and
  outside the plus ring: `A` is already complete, Hausdorff and uniform, so uniformization
  retains the specified `ℤ_p + pℤ_p⟨T⟩`.
- The projection from the ordinary completed tensor kills every nilpotent, including mixed nilpotents.
- Exchanging factors sends inl(b₁)inr(c₁) − inl(b₂)inr(c₂) to inl(c₁)inr(b₁) − inl(c₂)inr(b₂).
- Exchanging factors twice fixes all elements of the uniform completion.
- When a factor is zero, the exchange sends every element to zero.
- The universal map evaluates two products of inclusions as φ(b₁)ψ(c₁) − φ(b₂)ψ(c₂).
- For a zero complete uniform target, the universal map is zero.
- The universal map kills the inclusion of a nilpotent input, consistent with its reduced uniform target.
- For complete Hausdorff uniform A, both inclusions into A ⊗̂ᵘₐ A are bijective.
- For complete Hausdorff uniform A, an element lies in A⁺ exactly when its image lies in the plus ring of A ⊗̂ᵘₐ A.
- For complete Hausdorff uniform A, the projection A ⊗̂ₐ A → A ⊗̂ᵘₐ A is a homeomorphism.
- The unit comparison sends inl(a)inr(b) − inl(c)inr(d) to the image of ab − cd in Aᵘ.
- The unit comparison sends the inclusion of a nilpotent to zero in Aᵘ.
- For A = 0, every value of the unit comparison is zero.
- For general B over A, the image of b₁ ⊗ a₁ − b₂ ⊗ a₂
  under completion, uniformization and the unit comparison is
  ι_B(b₁ · algebraMap A B a₁ − b₂ · algebraMap A B a₂).
- If b in B is nilpotent, the unit comparison sends
  the image of b ⊗ a to zero for every a in A.
- For B = 0 over any Tate base A, the unit comparison
  sends every element of the uniform completed tensor to zero.

### R0.5 completed tensor products of Banach modules

**Completed tensor products of Banach modules over complete Tate rings.**
The underlying construction also has a fixed meaning outside the Banach case:
`banachTensorTopology A V W` is the finest nonarchimedean additive group topology
on `V ⊗[A] W` making the `A`-action and `(v, w) ↦ v ⊗ w` continuous. Here `A` is a
commutative topological ring and `V`, `W` are `A`-modules with given topologies.
It is defined as the infimum of these topologies in Mathlib's order on topologies;
the indiscrete topology belongs to this set. This definition uses no chosen lattice.
`isTopologicalAddGroup_banachTensorTopology` supplies the additive group topology,
and `banachTensorUniformSpace` is its canonical uniformity. The `Module` instance,
`BanachModule.CompletedTensor.isUniformAddGroup`, `continuousSMul`, `tmul`,
`tmul_eq_coe`, continuity of `tmul`, `lift`, `lift_tmul`, continuity of `lift`, `ext`,
`map`, `map_tmul`, `map_id`, `map_comp` and `exact_of_split` use this construction
for arbitrary such factors. The lift's target is a complete Hausdorff nonarchimedean
additive uniform module with continuous scalar action; extensionality requires a
Hausdorff target and continuous linear maps; split exactness requires the continuous
retraction, section and splitting identity stated below. For Banach modules over a
complete Hausdorff Tate ring, `hasBasis_banachTensorTopology_lattice` identifies this
construction with the lattice and product-seminorm description of KL15 Definitions
2.1.10 and 2.2.7, pp. 27 and 31.

`BanachModule.CompletedTensor.isUniformAddGroup` and
`BanachModule.CompletedTensor.continuousSMul` assert compatibility with addition
and continuity of the A-action for the completion of `banachTensorUniformSpace A V W`.
The module construction uses its own additive uniform structure and scalar action;
its declarations require no instances from the ring construction `Huber.CompletedTensor`.
For Banach modules, the normed formulation is KL15, Definitions 2.1.10 and 2.2.7,
pp. 27 and 31.

(*completed-tensor-banach-module*) Let `A` be a complete Tate ring (Tau Ceti `IsTateRing`, complete
and Hausdorff) with a norm datum `d = (A₀, ϖ, r)` and norm `α_d` (*tate-ring-norm*,
PadicFunctionalAnalysis §0.4); for instance
`A = L` a complete nonarchimedean field with its absolute value. A Banach `A`-module is a complete
Hausdorff topological `A`-module `V` whose topology is defined by an additive subgroup `V₀` stable
under `A₀` with `V = ⋃ₙ ϖ⁻ⁿV₀`, the `ϖⁿV₀` forming a basis of neighbourhoods of `0`; equivalently,
an `A`-module complete for a norm `|·|` with `|av| ≤ c·α_d(a)·|v|` (KL15 §2.2, Def. 2.2.7, p. 31),
a lattice being the `A₀`-submodule generated by `{|·| ≤ 1}` (which is `{|·| ≤ 1}` itself when
`c ≤ 1`). For Banach `A`-modules `V`, `W` the completed tensor product `V ⊗̂_A W` is the Hausdorff
completion of `V ⊗_A W` for the tensor topology, in which the images of `ϖⁿ·(V₀ ⊗_{A₀} W₀)`,
`n ≥ 0`, form a basis of neighbourhoods of `0`. Equivalently it is the completion for the product
seminorm `|x| = inf max_i |v_i|·|w_i|` over presentations `x = Σ v_i ⊗ w_i` (KL15 §2.1, Def.
2.1.10, p. 27, stated there for rings; the same formula on modules defines `V ⊗̂_A W`). It is a
Banach `A`-module whose lattice is the closure of the image of `V₀ ⊗ W₀`; up to equivalence of norms
it does not depend on the lattices. (a) Universal property: `(v, w) ↦ v ⊗ w` is a continuous
`A`-bilinear map whose image spans a dense submodule. Every continuous `A`-bilinear map
`β : V × W → M` into a complete Hausdorff topological `A`-module `M` whose topology has a basis of
neighbourhoods of `0` consisting of open subgroups (for instance `A₀`-submodules, or a Banach
`A`-module with lattice `M₀`, for which continuity of `β` is equivalent to boundedness:
`β(V₀ × W₀) ⊆ ϖ⁻ᵏM₀` for some `k`) factors uniquely as `β = β̂ ∘ ⊗` with `β̂ : V ⊗̂_A W → M`
continuous and `A`-linear; the subgroup hypothesis is what turns `β(ϖⁿV₀ × ϖⁿW₀) ⊆ U` into
`β̂(ϖ²ⁿ·(V₀ ⊗ W₀)) ⊆ U` for finite sums, as required by the universal property of `BanachModule.CompletedTensor.lift`. (b)
Functoriality: continuous `A`-linear `f : V → V'` and `g : W → W'` induce `f ⊗̂ g`, compatibly with
identities and composition, and `A ⊗̂_A V ≅ V`. (c) Compatibility: if `V = B` and `W = C` are
complete Huber `A`-algebras (adic structure maps; `B₀`, `C₀` rings of definition containing the
images of `A₀`), then `V ⊗̂_A W` is `B ⊗̂_A C` of *completed-tensor-product* as a topological
`A`-module, and its multiplication is the continuous extension of that of `B ⊗_A C`. (d) Exactness:
`− ⊗̂_A W` carries a topologically split short exact sequence of Banach `A`-modules (continuous maps
with a continuous retraction and a continuous section) to a topologically split short exact
sequence. The field statements of KL15 Lemma 2.2.9 (cross norm, kernels and strictness of `f ⊗̂ X`)
are stated and proved as *banach-completed-tensor-field-exactness*, from (f) and the existence of
`t`-orthogonal bases (*banach-countable-type-orthogonal-basis*, PadicFunctionalAnalysis
§§2.2, 2.4); the field API below separates injectivity, the kernel image and strictness. (e)
Finite
projective modules: for a
finite projective `A`-module `P` with its natural topology (a finite Banach module, KL15 §2.2, Lem.
2.2.12(a), p. 32: direct summands of `Rⁿ`), `P ⊗_A W → P ⊗̂_A W` is an isomorphism. (f) Orthonormal
and weighted orthogonal bases: let `A = L` be a complete nonarchimedean field and let `E`, `V` be complete ultrametric
normed `L`-spaces, with `‖av‖ = |a|‖v‖`. Suppose `V` has an orthonormal basis
`(e_i)_{i∈I}`: every `v ∈ V` is uniquely `Σ c_i e_i` with `c_i → 0` along the cofinite filter, and
`|v| = sup |c_i|`. Then `E ⊗̂_L V ≅ c₀(I, E)`, the Banach module of
`I`-indexed families in `E` tending to `0` with the supremum norm, via
`x ⊗ Σ c_i e_i ↦ (c_i x)_i`, isometrically (CHJ §2, Lem. 2.23(2), p. 19, and its proof,
p. 20, the orthonormal description of `A ⊗̂ V` as opposed to the pseudobasis description of
the mixed tensor product by bounded families).
For a `t`-orthogonal Schauder basis `(e_i)`, `0 < t ≤ 1`, use the weighted convention of
PadicFunctionalAnalysis §2.2: `w_i = ‖e_i‖ > 0`, and every finite sum satisfies
`t·max_i(|c_i|w_i) ≤ ‖Σ c_i e_i‖ ≤ max_i(|c_i|w_i)`; expansions require
`|c_i|w_i → 0` cofinitely. Construct the weighted coefficient space
`c₀(I, E; w) = {(x_i) : ‖x_i‖w_i → 0 cofinitely}`, with coordinatewise operations and
`‖(x_i)‖_w = sup_i ‖x_i‖w_i` (the empty supremum is zero). It is a complete ultrametric
normed `L`-space, its finite-support families are dense, and a family supported at `i`
has norm `‖x_i‖w_i`. The same coefficient map is a topological linear equivalence
`E ⊗̂_L V ≅ c₀(I, E; w)` with `t‖(x_i)‖_w ≤ |Σ x_i ⊗ e_i|_π ≤ ‖(x_i)‖_w`.
These estimates extend the finite-support comparison by completion: the coordinate
functional at `i` has bound `1/(t w_i)`, giving the lower tensor bound, while the displayed
tensor presentation gives the upper bound (KL15 §2.2, proof of Lem. 2.2.9, p. 31,
the Schauder-basis argument). Unit weights and `t = 1` recover the orthonormal isometry.
A Schauder basis satisfying the additional normalized finite-sum estimates
`t·max_i |c_i| ≤ ‖Σ c_i e_i‖ ≤ max_i |c_i|` instead gives the ordinary `c₀(I, E)`
comparison with these constants. This normalized hypothesis is separate from the
weighted basis existence theorem. (g) Base change: for a continuous homomorphism `A → A'` of complete
Tate rings, `A' ⊗̂_A V` is a Banach `A'`-module, and `A'' ⊗̂_{A'} (A' ⊗̂_A V) ≅ A'' ⊗̂_A V` for
`A → A' → A''`. In particular `M ⊗̂_A A⟨T/s⟩` is defined for a Banach `A`-module `M` and a rational
localisation `A → A⟨T/s⟩`; it equals `M ⊗_A A⟨T/s⟩` when `M` is finite projective (e) or finite over
a strongly noetherian `A` (Huber94 Lem. 2.4(ii)). The open mapping theorem used in the proof
(continuous surjections of complete Banach modules are open) is Berkeley Lecture 4, Prop. 4.3.4,
p. 34, which cites it as [Hub93, Lemma 2.4(i)] although it is Huber94 Lemma 2.4(i), stated for rings
with a null sequence of units, i.e. Tate rings. Conventions: the orthonormal description uses null
families (`c₀`), not bounded families: `E ⊗̂_L c₀(I, L) = c₀(I, E)`, whereas the mixed completed
tensor product of *mixed-completed-tensor* in AdicSpacesPartIV layer R5 with the profinite flat module `∏_I O` gives
bounded families. The existence of an orthonormal basis is a hypothesis of the isometric
special case of (f). For spaces of countable type, the weighted `t`-orthogonal basis is
supplied by *banach-countable-type-orthogonal-basis* (PadicFunctionalAnalysis
§§2.2, 2.4). The topological identification with ordinary `c₀`
(Bosch–Güntzer–Remmert 2.7.2/3, cited by HK §7, Rem. 7.8, p. 26, whose
"countable product" with the supremum norm must be read as the space `c₀` of null sequences, not
the bounded families) uses scalar rescaling with fixed comparison constants, as specified
in that supplier contract in R0.18. It does not supply the normalized estimates for every
prescribed `t` in the original norm. In `Huber`, define
`IsBanachModule` as the structure "`V` is a Banach module over the complete Tate ring `A`: a complete
Hausdorff topological `A`-module with a lattice `V₀` stable under `A₀`, `V = ⋃ ϖ⁻ⁿV₀`, the `ϖⁿV₀` a
basis of neighbourhoods of `0`", `BanachModule.CompletedTensor` as `V ⊗̂_A W`, the Hausdorff
completion of `V ⊗[A] W` for the tensor topology (equivalently the product seminorm), and
`BanachModule.CompletedTensor.tmul` as the continuous `A`-bilinear map `(v, w) ↦ v ⊗ w` into
`V ⊗̂_A W`, whose image spans a dense submodule; prove `BanachModule.CompletedTensor.lift` (a
continuous `A`-bilinear `β : V × W → M` into a complete Hausdorff nonarchimedean topological
`A`-module (with continuous scalar action) induces the continuous
`A`-linear `β̂ : V ⊗̂_A W → M`), `BanachModule.CompletedTensor.lift_tmul` (simp:
`lift β (v ⊗ w) = β v w`), `BanachModule.CompletedTensor.ext` (continuous `A`-linear maps out of
`V ⊗̂_A W` into a Hausdorff module agreeing on all `v ⊗ w` are equal),
`BanachModule.CompletedTensor.map` (`f ⊗̂ g` for continuous `A`-linear `f : V → V'`, `g : W → W'`,
with `map_id` and `map_comp`), `BanachModule.CompletedTensor.lid` (`A ⊗̂_A V ≅ V` for a Banach
`A`-module `V`), `BanachModule.CompletedTensor.equivCompletedTensor` (for complete Huber
`A`-algebras `B`, `C` with adic structure maps: `B ⊗̂_A C` as Banach modules is isomorphic to the
completed tensor product of *completed-tensor-product* as topological `A`-modules),
`BanachModule.CompletedTensor.exact_of_split` (`− ⊗̂_A W` carries topologically split short exact
sequences to split short exact sequences),
`BanachModule.CompletedTensor.injective_tensorProduct_of_field` (over a complete nonarchimedean
field, `V ⊗_L W → V ⊗̂_L W` is injective; KL15 Lem. 2.2.9(a)),
`BanachModule.CompletedTensor.ker_map_of_field` (over a field, the image of `ker(f) ⊗̂ X`
is `ker(f ⊗̂ X)`), `BanachModule.CompletedTensor.injective_kerMap_of_field` (this kernel map is
injective) and `BanachModule.CompletedTensor.isStrictMap_map_of_field` (`f ⊗̂ X` is strict when
`f` is), for arbitrary Banach `X` (KL15 Lem. 2.2.9(b),(c)),
`BanachModule.CompletedTensor.finiteProjectiveEquiv` (for a finite projective `A`-module `P` with
its natural topology, `P ⊗_A W ≅ P ⊗̂_A W`), `BanachModule.CompletedTensor.orthonormalEquiv` (for complete
ultrametric normed `L`-spaces `E`, `V`, if `V` has an orthonormal basis `(e_i)_{i∈I}`,
`E ⊗̂_L V ≅ c₀(I, E)` isometrically,
`x ⊗ Σ c_i e_i ↦ (c_i x)_i`), `BanachModule.CompletedTensor.orthogonalEquiv` (for a `t`-orthogonal
basis of the same complete spaces in the weighted convention, `0 < t ≤ 1`,
`w_i = ‖e_i‖ > 0`, `E ⊗̂_L V ≅ c₀(I, E; w)` topologically,
with `t‖·‖_w ≤ |·|_π ≤ ‖·‖_w`),
`BanachModule.CompletedTensor.baseChange` (for a continuous `A → A'` of complete Tate rings, the
Banach `A'`-module `A' ⊗̂_A V`, e.g. `M ⊗̂_A A⟨T/s⟩` for a rational localisation) and
`BanachModule.CompletedTensor.cancelBaseChange` (`A'' ⊗̂_{A'} (A' ⊗̂_A V) ≅ A'' ⊗̂_A V` for
`A → A' → A''`). Further examples: `K⟨T⟩ ⊗̂_K K⟨S⟩ ≅ K⟨T, S⟩` via `Tᵐ ⊗ Sⁿ ↦ TᵐSⁿ` (orthonormal
bases of monomials), agreeing with the completed tensor product of Huber pairs; and
`Σ pⁿTⁿSⁿ ∈ ℚ_p⟨T, S⟩` is not in the image of the algebraic tensor product `ℚ_p⟨T⟩ ⊗ ℚ_p⟨S⟩`, since
the coefficient matrix of an element of that image has finite rank. *Needs:* *tate-ring-norm*
(PadicFunctionalAnalysis §0.4);
*completed-tensor-product*; Tau Ceti `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition`;
Mathlib `TensorProduct`, `TensorProduct.lift`, `UniformSpace.Completion`,
`UniformSpace.Completion.extension`, `NormedSpace`, `IsUltrametricDist`,
`ZeroAtInftyContinuousMap`, `Module.Projective`, `IsModuleTopology`.

The canonical map is fixed by `BanachModule.CompletedTensor.tmul_eq_coe`:
`tmul v w = ↑(v ⊗ₜ[A] w)` in the completion for `banachTensorUniformSpace`.
Its underlying function is the composite of Mathlib's `TensorProduct.mk` and
`UniformSpace.Completion.coe'` (KL15 Definition 2.1.10, p. 27).
For complete Hausdorff Tate `A`, Banach modules `V`, `W`, and a common norm datum `d`,
`hasBasis_banachTensorTopology_lattice` states the basis `ϖⁿ · image(V₀ ⊗_{A₀} W₀)`
for any `A₀`-stable absorbing lattices whose `ϖ`-powers give the two module topologies.
Formally the image is the additive subgroup generated by the elementary tensors of
lattice elements: `AddSubgroup.closure` is algebraic subgroup generation here, with no
topological closure. This is the module lattice formulation of KL15 Definitions
2.1.10 and 2.2.7, pp. 27 and 31.

**Checks.**

- *Computation.* For discrete `ℤ`,
  `ℤ ⊗[ℤ] ℤ` has the discrete topology transported along `TensorProduct.lid ℤ ℤ`.
- *Degenerate.* `(Fin 0 → ℤ) ⊗[ℤ] ℤ`
  is a singleton, so its tensor topology is the discrete topology `⊥`.
- *Non-example.* For every prime `p`,
  the topology on `ℚ_p ⊗[ℤ] ℚ_p` is nondiscrete and its linear multiplication map
  to `ℚ_p` is continuous. Thus the construction specifies a topology even though
  the discrete scalar ring `ℤ` is not Tate.
- *Compatibility.* For arbitrary `v`, `w`,
  the elementary tensor equals their algebraic tensor's canonical completion image.
- *Degenerate.* A zero first factor maps to zero.
- *Computation.* The difference of two
  elementary tensors is the completion image of `v₁ ⊗ w₁ − v₂ ⊗ w₂`, with the same signs.
- *Non-example.* In `ℚ_p`, `−1` has norm one,
  but negating the completed tensor `1 ⊗ 1` changes it, including when `p = 2`.
- *Computation.* `ℚ_p` is a Banach module over itself:
  use the lattice `ℤ_p`, pseudouniformiser `p`, and neighbourhoods `pⁿℤ_p`.
- *Degenerate.* The zero space `Fin 0 → ℚ_p` is Banach,
  with zero lattice; absorption and the neighbourhood condition both hold.
- *Non-example.* `∏_ℕ ℚ_p` with its product topology is
  complete and Hausdorff, but is not a Banach module. An open lattice leaves all but finitely
  many coordinates unrestricted; every scalar multiple still leaves them unrestricted and
  cannot be contained in a neighbourhood restricting one additional coordinate.
- *Computation.* `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ ≅ ℚ_p⟨T, S⟩` as
  Banach `ℚ_p`-modules for every prime `p`: a continuous linear equivalence sends
  the canonical completed tensor `Tᵐ ⊗ Sⁿ` to `TᵐSⁿ` for all `m, n : ℕ`.
  Both coordinates are the completion images of Tau Ceti's `weightedX` at weights `{1}`;
  in particular `(m,n) = (0,0), (1,0), (0,1)` fixes the constant and each coordinate.
  This is the null-coefficient description of the Tate algebra (KL15 Definition 2.2.15,
  p. 33) with the product seminorm of Definition 2.1.10, p. 27.
- *Non-example.* The map
  `ℚ_p⟨T⟩ ⊗_{ℚ_p} ℚ_p⟨S⟩ → ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩` is injective but not surjective: `Σ pⁿTⁿSⁿ` is
  not in its image. The uncompleted tensor product is the wrong object.
- For `V = ℚ_p × ℚ_p`, the canonical unit comparison sends `2 ⊗ (3, 5) − 1 ⊗ (7, 4)` to `(−1, 6)`.
- *Characterisation.* With the standard orthonormal
  basis of `c₀(ℕ, ℚ_p)`, `ℂ_p ⊗̂_{ℚ_p} c₀(ℕ, ℚ_p) ≅ c₀(ℕ, ℂ_p)`. The bounded sequence `(1, 1, …)` is
  not in it, whereas the mixed completed tensor product of AdicSpacesPartIV layer R5 with `∏_ℕ ℤ_p` contains it: a
  definition by bounded families fails.
  The continuous `ℚ_p`-linear equivalence `e` is fixed by
  `e(BanachModule.CompletedTensor.tmul x f)(n) = f(n) • x` for every `x : ℂ_p`,
  null sequence `f : c₀(ℕ, ℚ_p)` and `n : ℕ`. The exclusion is on this same map:
  there is no `z` in the completed tensor with `e(z)(n) = 1` for every `n`.
  This is the orthonormal coordinate description in part (f) above (CHJ §2,
  proof of Lemma 2.23, p. 20).
- *Compatibility.* For a finite extension `L/K` of
  complete nonarchimedean normed fields, with `K` nontrivially normed and Tate,
  `L` a normed `K`-algebra, and `V` a complete ultrametric normed `K`-space,
  `TensorProduct.lift (BanachModule.CompletedTensor.tmul K L V)` is bijective.
  Thus the canonical map `L ⊗_K V → L ⊗̂_K V`, sending `l ⊗ v` to its completion image,
  is an isomorphism (`L` is finite free over `K`, part (e); KL15 Lemma 2.2.12(a), p. 32).

The functor is pinned by `BanachModule.CompletedTensor.map_tmul`, `map_id` and `map_comp`.
The ring comparison is pinned by `equivCompletedTensor_tmul` and is a homeomorphism by the
continuity of the comparison and of its inverse.

*Checks for `BanachModule.CompletedTensor.map`:*
- For the scalar modules `A` and `A`, tensoring the identity maps sends `2 ⊗ 3 − 7 ⊗ 1` to `1 ⊗ (−1)` in the completion.
- *Degenerate.* Tensoring a zero map with the identity is the
  zero map on the entire completion.
- *Computation.* Negating both factors sends `v ⊗ w` back to
  `v ⊗ w`; the two signs cancel.

The generator equations `CompletedTensor.lid_tmul` and
`CompletedTensor.finiteProjectiveEquiv_tmul` in `Huber.BanachModule` hold over a
Tate ring `A` for a complete Hausdorff nonarchimedean additive uniform `A`-module `W`
with continuous scalar action (`NonarchimedeanAddGroup W`). The latter also assumes
`P` finite projective with `IsModuleTopology A P`.
They send `a ⊗ w` to `a • w` and `p ⊗ w` to its canonical completion image,
respectively. These are the tensor unit identity and the finite-summand consequence of
KL15 Lemma 2.2.12(a), p. 32, with the completion convention of Definition 2.1.10, p. 27.
The unit and finite-projective Checks below use complete Hausdorff Tate rings and
complete Hausdorff nonarchimedean modules with continuous scalar action. The topology
and lift Checks use complete nonarchimedean fields L and Banach spaces W.

- *Compatibility.* The tensor topology and
  uniformity on L ⊗ W are the pullbacks of those on W along Mathlib's tensor unit map.
- *Degenerate.* With a zero-dimensional first
  factor the tensor carrier is a singleton, with its unique topology and uniformity.
- *Non-example.* L ⊗ L has nondiscrete tensor
  topology and nondiscrete tensor uniformity when L is nontrivially valued.
- *Computation.* The completed tensor unit
  map sends a ⊗ v − b ⊗ w to av − bw.
- *Compatibility.* Its inverse sends w to
  1 ⊗ w; together with `banachCompletedTensor_test_notAlgebraic`, these computations
  test the elementary tensor map as well as the unit comparison.
- *Degenerate.* For W = 0, every completed tensor
  and its image under the unit map are zero.
- *Degenerate.* The rank-zero comparison
  sends its only algebraic tensor to zero.
- *Compatibility.* In rank one, following
  the comparison by the completed unit map agrees with Mathlib's algebraic unit map.
- *Computation.* The rank-two comparison
  sends e₀ ⊗ v − e₁ ⊗ w to the same two completed elementary tensors with their signs.
- *Computation.* Lifting scalar
  multiplication sends a ⊗ b − c ⊗ d to ab − cd.
- *Degenerate.* The zero bilinear form induces
  the zero map on the whole completion.
- *Non-example.* An alternating bilinear
  form kills v ⊗ w + w ⊗ v, also in characteristic two.

For complete nonarchimedean fields L and complete ultrametric normed L-spaces V, W,
`BanachModule.CompletedTensor.productNorm` is the continuous extension of the
finite-presentation maximum seminorm. `productNorm_structure` requires nonnegativity,
definiteness, the ultrametric inequality, `|az| = |a||z|`, and the norm-ball basis
for the completion topology. `productNorm_coe` fixes its values on the algebraic
tensor product. These are the module form of KL15 Definition 2.1.10, p. 27, with
definiteness supplied by Lemma 2.2.9(a), p. 31. `productNorm_unitVector` gives
`|v ⊗ w − v' ⊗ w| = |v − v'|` when `|w| = 1`.
Both coordinate equivalences require `[CompleteSpace X] [CompleteSpace V]`, where
`X` is the coefficient space denoted by `E` above; their coordinate formulas and Checks
use the same hypotheses. Completeness of `X` is essential: for `L = V = ℚ_p` and
`X = ℚ_p[T]` with the Gauss norm, `c₀(Unit, X) ≅ X` is incomplete, whereas
`X ⊗̂_L V` is complete. The Banach-space orthonormal comparison is used in CHJ §2,
Lemma 2.23(2), p. 19, and its proof, p. 20.
`orthonormalEquiv_productNorm` is the isometry to null families; for a
`t`-orthogonal basis with weights `w_i = ‖e_i‖ > 0`, `orthogonalEquiv_productNorm`
gives the bounds `t‖·‖_w ≤ |·|_π ≤ ‖·‖_w` on the weighted null-family space.
Both coordinate maps send `x ⊗ eᵢ − y ⊗ eⱼ` to the family with entries x at i
and −y at j, for distinct i and j.

For continuous homomorphisms of complete Hausdorff Tate rings A → A′ → A″ and
an `IsBanachModule A V`, `CompletedTensor.baseChange_smul` fixes the extended A′-action
by `a · (b ⊗ v) = ab ⊗ v`; `isBanachModule_baseChange` asserts the Banach property.
`cancelBaseChange` is an A″-linear homeomorphism, and `cancelBaseChange_tmul`
sends `a ⊗ (b ⊗ v)` to `a·g(b) ⊗ v`. These contracts use the lattice tensor
topology and completed universal property in (a) and (g) above; they do not assume
that V is finite or countable-dimensional.

*Checks for the comparison maps and their structures:*

- For complete Huber algebras with adic structure maps, the Banach-to-ring comparison preserves b₁ ⊗ c₁ − b₂ ⊗ c₂.
- For a zero ring factor, every image under the Banach-to-ring comparison is zero.
- Over a complete Hausdorff Tate ring, the ring comparison followed by the lifted multiplication is the Banach tensor unit map on the entire completion.
- The Banach-to-ring comparison kills ab ⊗ c − b ⊗ ac, agreeing with algebraic scalar balancing.
- For a scalar first factor, |a ⊗ w| = |a|·|w| on the completion.
- A zero-dimensional first factor gives norm zero for every completed tensor.
- In L ⊗̂ₗ L the norm of 1 ⊗ a + b ⊗ 1 is |a+b|; it need not equal max(|a|,|b|).
- For distinct indices i,j, x ⊗ eᵢ − y ⊗ eⱼ has coordinates x and −y.
- For an empty basis the image of every completed tensor is the zero null family.
- At coordinate i, ax ⊗ eᵢ − x ⊗ beᵢ gives (a−b)x.
- For a t-orthogonal basis and distinct i,j, x ⊗ eᵢ − y ⊗ eⱼ has coordinates x and −y.
- For an empty t-orthogonal basis every completed tensor maps to the zero weighted null family.
- The t-orthogonal comparison sends ax ⊗ eᵢ − x ⊗ beᵢ to (a−b)x in coordinate i.
- *Weighted-null control.* For `V = c₀(ℕ, ℚ₂)` with its supremum norm and
  `e_n = 2ⁿδ_n`, the basis is orthogonal with `w_n = 2⁻ⁿ`. The tensor-unit comparison
  identifies `1 ⊗ (2ⁿ)_n` with the coefficients `(1)_n` in `c₀(ℕ, ℚ₂; w)`, of weighted
  norm one. These coefficients are outside ordinary `c₀(ℕ, ℚ₂)`.
- *Normalized non-example.* On `V = ℚ₂` with `‖x‖_V = (3/4)|x|₂`, any nonzero
  singleton is a weighted orthogonal basis. Its nonzero norm values `(3/4)2^ℤ`
  miss `[7/8, 1]`, so no basis satisfies the normalized estimates for `t = 7/8`.
- The extended scalar action sends a·(b ⊗ v − c ⊗ w) to ab ⊗ v − ac ⊗ w.
- An A-scalar acting through A′ on b ⊗ v agrees with b ⊗ av.
- For V = 0, every scalar multiple of every completed tensor is zero.
- Transitivity sends a ⊗ (b ⊗ v) − c ⊗ (d ⊗ w) to ag(b) ⊗ v − cg(d) ⊗ w.
- For V = 0, the transitivity homeomorphism sends every element to zero.
- The inverse transitivity map sends a ⊗ v to a ⊗ (1 ⊗ v).

### R0.6 adic morphisms, finiteness classes and locally noetherian spaces

**Affinoid presentations and geometric morphisms.** In `AdicSpace`, `Affinoid` retains a
complete Hausdorff Huber ring, its plus ring, a pair of definition inside that plus ring,
and sheafiness of the supplied presentation. `Affinoid.spa` uses that presentation;
`Affinoid.coeff` is its canonical global-section map. A morphism `g : Spa(B, B⁺) → Spa(A, A⁺)` is
induced by a morphism of Huber pairs `φ : (A, A⁺) → (B, B⁺)` (`Affinoid.IsInducedBy g φ`) if the
pullback of global sections along `g` is `φ` on coefficients. The construction of the morphism
`Spa(φ)` of adic spaces from `φ`, determined on points by `spaComap` and on coefficients by `φ`,
is an R0 target (README only; Tau Ceti supplies its presheaf half). `Chart` is an open affinoid
immersion, and `HomChart` consists of source and target charts, a morphism `map` between their
affinoids induced by its pair homomorphism `ringHom`, and the equation
`source.ι ≫ f = map ≫ target.ι`. These are presentations in the supplied
category of adic spaces (Huber94, §1 and Theorem 2.2), rather than a second category.
Lean: `AdicSpace.Affinoid`, `Affinoid.spa`, `Affinoid.coeff`, `Affinoid.IsInducedBy`,
`AdicSpace.Chart`, `AdicSpace.HomChart`.

All geometric predicates below are on morphisms of the supplied `TauCeti.AdicSpace`
category. `Affinoid` retains the complete sheafy pair; `Chart` includes its open
immersion, and `HomChart` includes the equation relating the pair homomorphism to
the geometric morphism. The predicates use explicit proof arguments. In particular,
`IsWeaklyFiniteType f := LocallyOfWeaklyFiniteType f ∧ QuasiCompact f` and
`IsPlusWeaklyFiniteType f := LocallyOfPlusWeaklyFiniteType f ∧ QuasiCompact f`.
Quasi-compactness tests inverse images of compact open subsets, as in Huber96
Definition 1.2.1(iv), p. 46.

`IsLocallyNoetherian`, `IsLocallyHuberStandard`, `IsAnalytic` and `HasStablySheafyCharts` quantify over these actual
charts. `IsAdic`, the three local finite-type conditions and `LocallyOfFinitePresentation`
quantify over `HomChart`. `IsTopologicallyFiniteTypePair` includes both a weighted
polynomial quotient presentation and the integral-closure equation for the plus ring.
`IsFinite` and `IsClosedImmersion` require a single chart for the **whole inverse image**
of each target chart; the latter uses an open quotient map and its integral quotient
plus ring. `Flat` uses the actual stalk maps. The definitions of `Unramified`, `Smooth`
and `Etale` combine these finiteness conditions with the affinoid infinitesimal criteria on a
morphism chart at each point (Huber96, Definitions 1.2.1, 1.4.1 and 1.6.5). `LocallyQuasiFinite`
uses discrete fibres. `QuasiCompact` uses inverse images of quasi-compact opens; `IsSeparated` uses
the actual diagonal. `UniversallyClosed` and `UniversallySpecializing` quantify over pullback
squares along adic maps from spaces with stably sheafy charts. The conjunctions defining `IsProper`
and `IsPartiallyProper` are those of Huber96, Definitions 1.3.2–1.3.3, including the plus weak
finite-type hypothesis.

The three restriction theorems `LocallyOfWeaklyFiniteType.restrict`,
`LocallyOfPlusWeaklyFiniteType.restrict` and `LocallyOfFinitePresentation.restrict`
use open immersions `i : U → X`, `j : V → Y` and a map `g : U → V` satisfying
`i ≫ f = g ≫ j`; each transfers its property from `f` to `g`.
The composition theorems of these same three namespaces require the property for
both factors (Huber96, paragraph following Definition 1.2.1, p. 46); for finite presentation the
spaces involved are locally Huber-standard.
The affinoid comparisons for discrete rings (local weak finite type iff `RingHom.FiniteType`,
local finite presentation iff `RingHom.FinitePresentation`)
require discrete complete sheafy rings and the full plus rings `A⁺ = A`, `B⁺ = B`.
The noetherian comparison of local finite presentation with local finite type assumes that the
target is locally Huber-standard and that every
complete affinoid chart of the target with discrete coordinate ring has a
noetherian coordinate ring; this is stronger than the noetherian-type condition.
These comparisons use Huber96 Definition 1.2.1(i),(v), p. 46 and Wedhorn
Example 6.32(1), p. 53.

**Checks for the quasi-compact predicates.**

- The identity on every adic space is of weakly finite type and of plus weakly finite type,
  including on a non-quasi-compact space; quasi-compactness here is a property of the map.
- Every map from the empty adic space satisfies both predicates.
- The closed unit disc over `Spa(ℚ_p, ℤ_p)` satisfies both predicates.
- A map from a noncompact adic space to a compact adic space satisfies neither
  predicate, even when it is locally of finite type, as for the open disc.

**Adic morphisms of adic spaces.** (*adic-morphism*) A morphism `f : X → Y` of adic spaces (the
category of the Foundations of adic spaces roadmap (AdicSpaces), layer 5) is *adic* if every `x ∈ X`
has an open affinoid neighbourhood `U` and there is an open affinoid `V ⊆ Y` with `f(U) ⊆ V` such
that the ring homomorphism `O_Y(V) → O_X(U)` induced by `f` is adic (*adic-ring-homomorphism*)
(Huber94 §3, Def. of adic morphisms, p. 532). Equivalently (*adic-iff-analytic-locus*) `f` maps
analytic points to analytic points, and then the ring maps `O_Y(V) → O_X(U)` are adic for all open
affinoids with `f(U) ⊆ V` (Huber96 §1.2, p. 46). Here a point is analytic if it has an open
neighbourhood `U` whose ring `O_X(U)` contains a topologically nilpotent unit; on `Spa(A, A⁺)` this
means that its support is not open (Tau Ceti `ValuationSpectrum.IsAnalyticPoint`; Huber94 §3, Def.
of analytic points, p. 532). An adic space `X` is *analytic* if every point of `X` is analytic
(Huber96 §1.1, p. 39); the analytic points form an open subset `X_a` of `X`, and `X` is analytic
iff it is locally `Spa(A, A⁺)` with `A` a Tate ring. R0 states this predicate as
`TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsAnalytic` on its complete sheafy `AdicSpace.Chart`s
in [Suggested.lean](Suggested.lean). AdicEtaleGeometry layer A0 imports this declaration
(*analytic-locus-restriction*) and supplies `AdicSpace.analyticLocus`
for `X_a`. Every morphism into an
analytic adic space is adic. In `AdicSpace`,
define `IsAdic f` as this `MorphismProperty` of AdicSpaces' category (affinoid-local); the predicate
is on morphisms and is named `AdicSpace.IsAdic` here because Tau Ceti's `PreAdicSpace.isAdic` is the object
property. The characterisations of adic morphisms by analytic points — `IsAdic f ↔ f(X_a) ⊆ Y_a`,
adicness of `O_Y(V) → O_X(U)` for all open affinoids with `f(U) ⊆ V`, and `f(X_na) ⊆ Y_na` for every
morphism — are the three clauses of *adic-iff-analytic-locus* and are stated there. Prove
`IsAdic.of_isAnalytic` (an instance: if `Y` is analytic, every
`f : X → Y` is adic), `IsAdic.comp` (composites of adic morphisms are adic and identities are adic:
the property is multiplicative), the cancellation statement (if `g ∘ f` is adic then `f` is adic,
since a non-analytic image `f(x)` would give a non-analytic `g(f(x))`), `IsAdic.of_isOpenImmersion`
(an instance: open immersions are adic), `IsAdic.iff_isAdicHom` (for affinoids, a morphism induced
by `φ` is adic iff `φ` is), and `IsAdic.baseChange` (the base change of an adic
morphism with stably sheafy source along a morphism locally of weakly finite type is adic; clause
(v) of *base-change-stability*). *Needs:*
*adic-ring-homomorphism*; Tau Ceti `TauCeti.ValuationSpectrum.IsAnalyticPoint`.
Lean: `AdicSpace.IsAnalytic`, `AdicSpace.IsAdic`, `IsAdic.iff_isAdicHom`, `IsAdic.of_isAnalytic`.

**Checks.**

- *Computation.* The structure morphism of the closed unit disc
  `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) → Spa(ℚ_p, ℤ_p)` is adic (`ℚ_p` is Tate).
- *Non-example.* `Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧) → Spa(ℤ_p, ℤ_p)`
  (`(p, T)`-adic over `p`-adic) is not adic: the point given by the `T`-adic valuation of `𝔽_p((T))`
  is analytic (support `(p)` not open) and maps to the non-analytic point of `Spa ℤ_p` with support
  `(p)`. A definition "adic = continuous on rings" fails.
- *Characterisation.* Every morphism `X → Spa(ℚ_p, ℤ_p)` is adic,
  because `Spa(ℚ_p, ℤ_p)` is analytic.
- *Compatibility* (`IsAdic.iff_isAdicHom`). For a morphism of complete Huber pairs
  `φ : (A, A⁺) → (B, B⁺)` (Tau Ceti `Pair.Hom`) with sheafy pairs, a morphism `Spa(B, B⁺) →
  Spa(A, A⁺)` induced by `φ` is adic iff the ring homomorphism of `φ` is adic (`Huber.IsAdicHom`).
- *Degenerate.* Identities and open immersions are adic.

**A morphism is adic exactly when it preserves analytic points.** (*adic-iff-analytic-locus*) Let
`f : X → Y` be a morphism of adic spaces. Prove: (i) if `f` is adic, then for all open affinoid
`U ⊆ X` and `V ⊆ Y` with `f(U) ⊆ V` the ring homomorphism `O_Y(V) → O_X(U)` is adic; (ii) `f` is
adic iff `f(X_a) ⊆ Y_a`; (iii) `f(X_na) ⊆ Y_na`. In particular every morphism to an analytic adic
space is adic (Huber94 §3, Prop. 3.2(ii), p. 532, statement (ii); Wedhorn §7.5, Lem. 7.46(2), p. 68,
the affinoid converse used for (i) and (ii); Wedhorn §8.4, Prop. 8.39, p. 86, the geometric
statement). `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` is not adic (the second Check of *adic-morphism*); every
morphism of analytic adic spaces is adic.
*Needs:* *adic-morphism*; *adic-ring-homomorphism*; *spa-comap-analytic-locus*; Tau Ceti
`TauCeti.ValuationSpectrum.IsAnalyticPoint`, `TauCeti.ValuationSpectrum.isAnalyticPoint_of_isTateRing`.
Lean: `IsAdic.of_isAnalytic` (the last clause); the affinoid core is
`IsAdicHom.spaComap_analytic` with `isAdicHom_of_spaComap_analytic`.

**Morphisms locally of weakly finite type and the finite-type hierarchy.**
(*finite-type-morphism-classes*) A morphism `f : X → Y` of adic spaces is *locally of weakly finite
type* if every `x ∈ X` has an open affinoid neighbourhood `U` and there is an open affinoid `V ⊆ Y`
with `f(U) ⊆ V` such that the ring homomorphism `O_Y(V) → O_X(U)` is topologically of finite type
(Tau Ceti `IsTopologicallyFiniteType`, which is Huber94's and Wedhorn 6.29(i)'s notion; no condition
on the plus rings); `f` is *of weakly finite type* if moreover `f` is quasi-compact (Wedhorn §8.5,
Def. 8.48(1), p. 88, the two affinoid-local definitions). Hierarchy (Huber96 §1.2, Def. 1.2.1 and
the following remarks, pp. 45–47): locally of finite presentation (*locally-finite-presentation*)
⇒ locally of finite type ⇒ locally of +weakly finite type (*plus-weakly-finite-type*) ⇒ locally of
weakly finite type ⇒ adic (*adic-morphism*). Here "locally of finite type" is the notion of
AdicSpaces §5.2, stated in Part II: the ring map `(O_Y(V), O_Y⁺(V)) → (O_X(U), O_X⁺(U))` is topologically of finite type as
a map of pairs, i.e. presented by a quotient mapping out of a weighted restricted power-series pair
`A⟨X₁,…,X_n⟩_M` — which is exactly Huber94's Definition following Lemma 3.5 (Huber94 §3, Def. of
morphisms locally of finite type, p. 535; Wedhorn §8.5, Defs. 8.42 and 8.48(1), pp. 87–88).
`Suggested.lean` states `AdicSpace.IsTopologicallyFiniteTypePair` and
`AdicSpace.LocallyOfFiniteType` on the shared carriers, following AdicSpaces §5.2; independence
under rational localisation and refinement is part of this target.
Comparison with Tau Ceti: the ring-level condition is Tau Ceti's `IsTopologicallyFiniteType`, whose weight families
satisfy `IsWeightFamily`, equivalent for Huber rings to Huber's "`M_i·A` open" by Huber94 Lemma 1.1
= Wedhorn Lemma 6.20 (the AdicSpaces layer 0.4 equivalence), and whose completeness hypothesis on the
target is automatic here since `O_X(U)` is complete. Local weak finite type is not a global
condition on affinoids: an affinoid morphism of weakly finite type need not have a
topologically-finite-type global ring map (Wedhorn §8.5, Rem. 8.52, p. 89). In `AdicSpace`, define
`LocallyOfWeaklyFiniteType f` as the morphism property (affinoid-local, ring-level
`IsTopologicallyFiniteType`) and `IsWeaklyFiniteType f` as locally of weakly finite type and
quasi-compact; prove `LocallyOfWeaklyFiniteType.isAdic` (locally weakly finite type implies adic),
`LocallyOfFiniteType.locallyOfWeaklyFiniteType` (AdicSpaces' locally finite type implies locally
weakly finite type: the ring part of a pair-level topologically-finite-type map is topologically of
finite type), `LocallyOfPlusWeaklyFiniteType.locallyOfWeaklyFiniteType` (locally +weakly finite type
implies locally weakly finite type), `LocallyOfWeaklyFiniteType.comp` (composites are locally of
weakly finite type; identities are), cancellation (if `g ∘ f` is locally of
weakly finite type then `f` is; Wedhorn 6.33(2)), `LocallyOfWeaklyFiniteType.restrict` (restrictions
`U' → V'` to open subspaces with `f(U') ⊆ V'` are locally of weakly finite type; Wedhorn 8.50),
`LocallyOfWeaklyFiniteType.of_isOpenImmersion` (an instance: open immersions are locally of weakly
finite type; Wedhorn 8.49(1)), the discrete affinoid comparison (for discrete rings: locally of
weakly finite type iff `RingHom.FiniteType`) and `LocallyOfWeaklyFiniteType.baseChange`
(stable under base change along adic morphisms from spaces with `HasStablySheafyCharts`; clause
(ii) of *base-change-stability*). Every open
immersion is locally of finite type, and the closed unit disc over `ℚ_p` is of finite type over
`Spa ℚ_p`. *Needs:* *topologically-finite-type-is-adic*; *adic-morphism*; Tau Ceti
`TauCeti.Huber.IsTopologicallyFiniteType`; Mathlib `RingHom.FiniteType`.
Lean: `AdicSpace.LocallyOfWeaklyFiniteType`, `QuasiCompact`, `IsTopologicallyFiniteTypePair`,
`LocallyOfFiniteType`, `LocallyOfWeaklyFiniteType.isAdic`,
`LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType`.

**Checks.**

- *Computation.* `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) → Spa(ℚ_p, ℤ_p)` is
  locally of finite type, hence locally of weakly finite type.
- *Non-example.* The check under
  *plus-weakly-finite-type* separates local +weak finite type from local finite type.
- With discrete topologies, `ℤ → ℤ/6ℤ` is topologically of finite type, whereas `ℤ → ℤ[X₀, X₁, …]` is not. These are the ring-level values for the corresponding affine maps.
- *Degenerate.* Identities and open immersions are locally of
  weakly finite type.
- *Non-example.* `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` is not locally of
  weakly finite type: it is not adic.
- *Degenerate.* For the zero ring, `Spa(0, 0) = ∅`: every morphism
  `∅ → Y` is locally of finite presentation, hence in every class of the hierarchy, and a morphism
  `X → ∅` exists only for `X = ∅`.
- *Characterisation.* For discrete rings `A → B` and the pairs
  `(A, A)`, `(B, B)`, the five classes collapse to three: `Spa(B, B) → Spa(A, A)` is locally of
  finite presentation iff `A → B` is finitely presented, it is locally of finite type iff locally of
  +weakly finite type iff locally of weakly finite type iff `A → B` is of finite type
  (`A⟨X⟩_M = A[X]` for every weight family since the only neighbourhood of `0` is `{0}`, the plus
  ring of the presentation is the integral closure of `A[X]`'s image, which is `B`, and `E` can be
  taken to be the images of the variables), and it is adic for every `A → B`, `B` being discrete.

**Morphisms locally of +weakly finite type.** (*plus-weakly-finite-type*) A morphism `f : X → Y` of
adic spaces is *locally of +weakly finite type* if every `x ∈ X` has an open affinoid neighbourhood
`U` and there is an open affinoid `V ⊆ Y` with `f(U) ⊆ V` such that `O_Y(V) → O_X(U)` is
topologically of finite type (Tau Ceti `IsTopologicallyFiniteType`) and there is a finite set
`E ⊆ O_X(U)` (necessarily contained in `O_X⁺(U)`) such that `O_X⁺(U)` is the smallest ring of
integral elements of `O_X(U)` containing `E` and the image of `O_Y⁺(V)`, i.e. the integral closure
in `O_X(U)` of the subring generated by the image of `O_Y⁺(V)`, `E` and the topologically nilpotent
elements `O_X(U)°°` (Huber96 §1.2, Def. 1.2.1(ii), p. 46). It is *of +weakly finite
type* if moreover quasi-compact. This is the finiteness condition in Huber's definitions of proper
morphisms (proper = of +weakly finite type, separated, universally closed; Huber96 §1.3, Def.
1.3.2(ii), p. 51) and of partially proper morphisms (locally of +weakly finite type, separated,
universally specializing; Huber96 §1.3, Def. 1.3.3(ii), p. 51); its place in the hierarchy is
Huber96 §1.2, after Def. 1.2.1, p. 46. In `AdicSpace`, define `LocallyOfPlusWeaklyFiniteType f` as
the morphism property and `IsPlusWeaklyFiniteType f` as locally of +weakly finite type and
quasi-compact; prove `LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType` (AdicSpaces' locally finite
type implies locally +weakly finite type, with `E` the images of the weighted variables),
`LocallyOfPlusWeaklyFiniteType.locallyOfWeaklyFiniteType` (locally +weakly finite type implies
locally weakly finite type), `LocallyOfPlusWeaklyFiniteType.comp` (composites are locally of +weakly
finite type: the union of the finite sets `E`, images of `E` under the second map),
`LocallyOfPlusWeaklyFiniteType.restrict` (restriction to open subspaces; for rational localisations
`O(W)⁺` is the integral closure of the image of `O⁺` and the fractions `t/s`),
`LocallyOfPlusWeaklyFiniteType.baseChange` (stable under base change along adic morphisms from
spaces with `HasStablySheafyCharts`; clause (iii) of *base-change-stability*) and
`IsPlusWeaklyFiniteType.isWeaklyFiniteType` (+weakly finite type implies weakly finite type).
*Needs:* *finite-type-morphism-classes*; Tau Ceti `TauCeti.Huber.IsTopologicallyFiniteType`.
Lean: `LocallyOfPlusWeaklyFiniteType_affinoid`, `AdicSpace.LocallyOfPlusWeaklyFiniteType`.

**Checks.**

- *Computation.* `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) → Spa(ℚ_p, ℤ_p)` is of
  +weakly finite type with `E = {T}`: `ℤ_p⟨T⟩` is integral over `ℤ_p[T] + ℚ_p⟨T⟩°°`.
- *Non-example.* `Spa(K⟨T⟩, O_K + K⟨T⟩°°) → Spa(K, O_K)`
  is of +weakly finite type with `E = ∅` but not locally of finite type (Huber94 Lem. 4.4; the plus ring `O_K + K⟨T⟩°°` gives the closure of the closed unit disc in the adic affine line over `K`, adding the rank-two point with `|T| > 1` infinitesimally (Berkeley Lecture 4, §4.1, p. 28)).
- *Characterisation.* Over `Spa(k, k°)` for a
  complete nonarchimedean field `k`: a +weakly-finite-type affinoid `Spa(A, A⁺)` with `A⁺ = A°` is
  locally of finite type (Huber94 Lem. 4.4).
- *Degenerate.* Identities are of +weakly finite type (`E = ∅`).

**Morphisms locally of finite presentation.** (*locally-finite-presentation*) A morphism
`f : X → Y` of adic spaces is *locally of finite presentation* if every `x ∈ X` has an open affinoid
neighbourhood `U` and there is an open affinoid `V ⊆ Y` with `f(U) ⊆ V`, whose ring `O_Y(V)` is in
Huber's standing class (*huber-standing-class*), such that
`(O_Y(V), O_Y⁺(V)) → (O_X(U), O_X⁺(U))` is topologically of finite type as a morphism of pairs
(Part II `AdicSpace.LocallyOfFiniteType`) and, whenever `O_Y(V)` carries the discrete topology, `O_X(U)` is a finitely
presented `O_Y(V)`-algebra (Mathlib `RingHom.FinitePresentation`). This is Huber96 §1.2, Def.
1.2.1(v), p. 46, read inside Huber's standing class: Huber's definition ranges over the affinoid
charts of his adic spaces, all of whose rings are in the class (1.1.1), and asking the witness
chart `V` to be in the class keeps that reading on spaces outside it. Without this requirement the
discrete clause can be switched off by a chart that is neither discrete nor standard. On
`Spa(ℤ_p × E) = Spa(ℤ_p) ⊔ Spa(E)`, `E` the ring of eventually constant `𝔽_p`-sequences
(*etale-standing-class-product-control*), the whole space is such a chart, and through it the map
`Spa(𝔽_p) → Spa(ℤ_p × E)` given by the eventual value after the second projection would pass the
finite-presentation test with a zero-variable presentation, and every square-zero lifting test as
well, although its base change to `Spa(E)` is not locally of finite presentation and its image is
the non-open point `∞` of `Spa(E) = ℕ ∪ {∞}`. With the requirement, the standard charts around `∞`
are the discrete charts inside `Spa(E)`, so finite presentation is demanded there, and it fails.
Huber96 develops the étale and smooth theory on this notion only for rings of the standing class;
over a target of noetherian type outside the class, Huber's printed form of the notion no longer
controls base change or openness (*etale-standing-class-control*), so the theorems of R0.16–R0.17
carry the class on every space as well. The discrete case is the only one in which the condition adds anything to local
finite type on a standard chart (Wedhorn §6.6, Ex. 6.32(1), p. 53: over discrete rings
topologically of finite type is finite type, so the extra condition is finite presentation), and
locally of finite presentation is the smallest class in Huber's hierarchy (Huber96 §1.2, after Def.
1.2.1, p. 46). Consequences: over an analytic, locally noetherian `Y` (for analytic spaces the same
as locally Huber-standard), locally of finite presentation = locally of finite type; over a
locally Huber-standard `Y` whose discrete affinoid rings are noetherian rings (for instance `t(𝔜)`
for a locally noetherian formal scheme `𝔜`) the two notions agree as well; they differ over
discrete non-noetherian affinoids, and near a point of `Y` without a chart in the standing class
(*locally-huber-standard*) no morphism into `Y` is locally of finite presentation. Warning: unlike
local finite type, local finite presentation is not stable under arbitrary base change (a
non-discrete base chart imposes nothing, a discrete chart after base change does); clause (iv) of
*base-change-stability* gives the correct hypotheses. (Huber96 Corollary 1.2.3(i) states
unconditional stability under the book's standing hypothesis (1.1.1), which excludes such examples.)
In `AdicSpace`, define `LocallyOfFinitePresentation f` as the morphism property; prove
`LocallyOfFinitePresentation.locallyOfFiniteType` (locally of finite presentation implies locally of
finite type), `locallyOfFinitePresentation_iff_of_isAnalytic` (over analytic, locally Huber-standard
`Y`: locally of finite presentation iff locally of finite type), the noetherian comparison (if `Y`
is locally Huber-standard and every discrete `O_Y(V)` is a noetherian ring: locally of finite
presentation iff locally of finite type), `LocallyOfFinitePresentation.comp` (composites of
morphisms between locally Huber-standard spaces are locally of finite presentation; identities of
locally Huber-standard spaces are), `LocallyOfFinitePresentation.restrict` (restriction to open
subspaces), `LocallyOfFinitePresentation.of_isOpenImmersion` (open immersions into locally
Huber-standard spaces are locally of finite presentation), the discrete affinoid comparison
(for discrete rings: locally of finite presentation iff `RingHom.FinitePresentation`) and
`LocallyOfFinitePresentation.of_comp` (for `f : X → Y`, `g : Y → Z` with all three
spaces locally Huber-standard, `LocallyOfFinitePresentation (f ≫ g)` and
`LocallyOfFiniteType g` imply `LocallyOfFinitePresentation f`; Huber96 Proposition 1.6.7(iii),
p. 79, and [Stacks Lemma 29.22.11(1), Tag 02FV](https://stacks.math.columbia.edu/tag/02FV)), and
`LocallyOfFinitePresentation.baseChange` (the base change of a
locally-finite-presentation morphism is locally of finite presentation when the target of the base
change is locally Huber-standard and either analytic or such that `f` has charts `O_S(W)⟨X⟩_M/𝔞`
with `𝔞` finitely generated — automatic when `O_S(W)⟨X⟩_M` is noetherian or over a locally
discretely ringed base — clause (iv) of *base-change-stability*; local finite presentation is not a
`MorphismProperty.IsStableUnderBaseChange` in general, by the square-zero base-change Check below).
The analytic alternative also has a specialized statement for an analytic, locally noetherian
target of the base change. In the base-change statement, the other alternative specifies a
`HomChart` at every source point and an open quotient from a finite weighted
restricted series completion, commuting with the chart’s coefficient map and
having finitely generated kernel (Huber96 Corollary 1.2.3(i) and its construction
in Proposition 1.2.2, pp. 47–49). `Spa(K⟨T⟩/(f)) → Spa K` is locally of finite
presentation for every `f`. *Needs:* *finite-type-morphism-classes*; *adic-iff-analytic-locus*;
*huber-standing-class*; Mathlib `RingHom.FinitePresentation`,
`Algebra.FinitePresentation.of_finiteType`.
Lean: `AdicSpace.LocallyOfFinitePresentation`, `LocallyOfFinitePresentation.locallyOfFiniteType`,
`locallyOfFinitePresentation_iff_of_isAnalytic`, `LocallyOfFinitePresentation.of_comp`.

**Checks.**

- Cancellation through the identity on a locally Huber-standard target returns the
  given locally finite-presentation map.
- The origin `Spa K → D` followed by `D → Spa K` has composite the identity;
  cancellation gives local finite presentation of the origin, without making it smooth.
- Over discrete rings, cancellation for `ℤ → ℤ[T] → ℤ` is finite presentation of the
  evaluation map, with kernel `(T)`.
- *Computation.*
  `Spa(ℚ_p⟨T, S⟩/(TS − p)) → Spa(ℚ_p)` is locally of finite presentation (`ℚ_p` is a strongly
  noetherian Tate ring, so in the standing class).
- *Compatibility.* For discrete rings `A → B`,
  `Spa(B, B) → Spa(A, A)` is locally of finite presentation iff `A → B` is finitely presented
  (Mathlib `RingHom.FinitePresentation`; discrete rings are in the standing class), matching
  `AlgebraicGeometry.LocallyOfFinitePresentation` for `Spec B → Spec A`.
- *Non-example.* For the discrete ring
  `A = ℤ[T₁, T₂, …]` and the ideal `𝔞 = (T₁, T₂, …)`, `Spa(A/𝔞) → Spa(A)` is locally of finite type
  (a quotient mapping) but not locally of finite presentation; so "locally of finite presentation =
  locally of finite type on locally noetherian spaces" fails, even though every discrete ring is
  of noetherian type and in Huber's standing class.
- *Characterisation.* If `Y` is analytic and locally noetherian, `f` is
  locally of finite presentation iff it is locally of finite type.
- *Degenerate.* Identities and open immersions of locally Huber-standard spaces are locally of
  finite presentation.
- *Non-example.* For `A = ℤ_p ⊕ M`
  (`M = ⊕_{i∈ℕ} 𝔽_p·e_i`, `M² = 0`, ring of definition `ℤ_p ⊕ 0` with its `p`-adic topology; `A` is
  of noetherian type but outside Huber96's standing hypothesis (1.1.1)), `Spa(ℤ_p, ℤ_p) → Spa(A, A)`
  (from `(a, m) ↦ a`) satisfies Def. 1.2.1(v) as printed, through the zero-variable presentation on
  the non-discrete chart `Spa(A, A)`, but its base change along the adic morphism
  `Spa(A/pA, A/pA) → Spa(A, A)` is `Spa(𝔽_p, 𝔽_p) → Spa(𝔽_p ⊕ M, 𝔽_p ⊕ M)`, which is not locally of
  finite presentation (the target is discrete and the kernel `M` of `𝔽_p ⊕ M → 𝔽_p` is not finitely
  generated). A definition requiring finite presentation only at discrete charts, with no condition
  on the non-discrete witness chart, cannot be base-change stable; an implementation claiming
  `IsStableUnderBaseChange` for it fails this test. The predicate above excludes the first map: the
  only rational neighbourhood of the closed point of `Spa(A, A)` is the whole space, whose ring is
  not in the standing class.
- *Non-example.* The quotient `Spa ℤ_p → Spa(A, A)` of *etale-standing-class-control* likewise
  satisfies Def. 1.2.1(v) as printed, although its kernel is not finitely generated, because the
  ring of the chart `Spa(A, A)` is not discrete; it is not locally of finite presentation in the
  sense above, since no chart of `Spa(A, A)` around the image `∞` of the closed point of `Spa ℤ_p`
  is in the standing class.
- *Non-example.* The map `Spa(𝔽_p) → Spa(ℤ_p × E)` of *etale-standing-class-product-control* is
  not locally of finite presentation: the standard charts around its image `∞` are discrete charts
  inside `Spa(E)`, on each of which the kernel of the map to `𝔽_p` is a non-finitely-generated
  ideal of finitely supported sequences; through the non-standard chart `Spa(ℤ_p × E)` it would
  pass.

**Locally noetherian adic spaces (Huber's noetherian hypothesis).** (*locally-noetherian-adic-space*)
An adic space `X` (AdicSpaces' category, layer 5) is *locally noetherian* if every `x ∈ X` has an
open affinoid neighbourhood `U` whose complete Hausdorff ring `O_X(U)` is of noetherian type
(*noetherian-type-huber-ring*): it has a noetherian ring of definition or is strongly noetherian
Tate. These are the ring hypotheses of Huber94 Propositions 3.6–3.8, and every discrete ring
qualifies through its prime subring as a noetherian ring of definition. Asking the charts to be in
Huber's standing class (Huber96 §1.1, (1.1.1), p. 37) gives the narrower notion
*locally-huber-standard*. This is the roadmap's noetherian-type chart convention; Wedhorn Corollary 8.35(a)–(b)
gives the underlying class and its stable sheafiness. Zavyalov24 §5 uses the analytic
specialization; Hübner §9, Definition 9.1, p. 41 supplies the distinct stable-sheafiness predicate. The condition places no restriction on plus rings.
Conventions: a locally noetherian analytic adic space is one locally of the form `Spa(A, A⁺)` with
`A` a complete strongly noetherian Tate ring (the setting of Zavyalov's foundational results);
because every discrete ring is of noetherian type, every discretely ringed adic space is locally
noetherian in this sense, and results that need honest noetherian rings (for instance on coherent
sheaves) must add that hypothesis. In `AdicSpace`, define the predicate `IsLocallyNoetherian X` as
`∀ x, ∃ U` open affinoid `∋ x` with `IsNoetherianType (O_X(U))`; prove
the affinoid form (every point has an affinoid neighbourhood of noetherian
type), `IsLocallyNoetherian.spa` (an instance: `Spa(A, A⁺)` with `A` complete of noetherian type, and
sheafy, is locally noetherian), the basis statement (the open affinoids of
noetherian type form a basis of the topology, rational localisations being topologically of finite
type), `IsLocallyNoetherian.of_isOpenImmersion` (an instance: open subspaces of locally noetherian
spaces are locally noetherian), `IsLocallyNoetherian.of_locallyOfWeaklyFiniteType` (an instance: if
`f : X → Y` is locally of weakly finite type and `Y` is locally noetherian, `X` is locally
noetherian; *topologically-finite-type-noetherian-type*), `IsLocallyNoetherian.of_isClosedImmersion`
(an instance: closed adic subspaces of locally noetherian spaces are locally noetherian;
*closed-adic-subspaces-and-embeddings*), `IsLocallyNoetherian.isStablySheafy` (every affinoid of
noetherian type is stably sheafy (*noetherian-type-stably-sheafy*), so `X` is a stable adic space in
Wedhorn's sense, Definition 8.54), the analytic characterisation (the analytic case:
locally `Spa` of complete strongly noetherian Tate rings) and `pullback_locallyNoetherian` (an
existing fibre products `X ×_S Y`, with `Y` locally noetherian and either `f : X → S`
locally of finite type or `f` locally of weakly finite type and `g : Y → S` adic,
are locally noetherian; Huber96 Proposition 1.2.2 and Corollary 1.2.3, pp. 47–49). Closed discs and polydiscs over `ℚ_p`, `Spa(ℤ_p⟦T⟧)`, and all rigid-analytic
varieties over a complete nonarchimedean field (viewed as adic spaces locally of finite type over
`Spa(k, k°)`) are locally noetherian. *Needs:* *noetherian-type-huber-ring*;
*topologically-finite-type-noetherian-type*.
`AdicSpace.IsLocallyNoetherian.affinoid_basis` carries `hX : IsLocallyNoetherian X`:
for every `x ∈ U`, `U` open, there is a `Chart X` containing `x`, with image contained
in `U` and coordinate ring of noetherian type.

Lean: `AdicSpace.IsLocallyNoetherian`, `AdicSpace.HasStablySheafyCharts`, `IsLocallyNoetherian.spa`,
`IsLocallyNoetherian.of_locallyOfWeaklyFiniteType`, `IsLocallyNoetherian.isStablySheafy`.

**Checks.**

- `IsLocallyNoetherian` holds for
  `Spa(ℚ_p⟨T⟩, ℚ_p⟨T⟩°)`, and its coordinate `T` is neither nilpotent nor a unit.
  An affinoid presentation is identified with this disc by a topological ring
  isomorphism preserving the plus ring.
- *Computation.* `Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` with the `(p, T)`-adic
  topology is locally noetherian and not analytic.
- *Non-example.* For a perfectoid field `K` with
  pseudouniformiser `ϖ = (ϖ^♭)^♯`, `X = Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩)` (sheafy, perfectoid) is
  not locally noetherian: let `x₀` be the point `f ↦ |f(0)|`. For every open affinoid `U ∋ x₀`, the
  points `y_c` (`T^{1/pⁿ} ↦ c^{1/pⁿ}`, `c = ((ϖ^♭)^m)^♯`) lie in `U` for `m ≫ 0`, and in the Tate
  ring `O_X(U)` the ideals `(T^{1/pⁿ})` form a strictly increasing chain:
  `T^{1/p^{n+1}} = g·T^{1/pⁿ}` would give `|c|^{1/p^{n+1} − 1/pⁿ} ≤ sup_U |g| < ∞` for all such
  `c`. So `O_X(U)` is not noetherian, hence not of noetherian type, because a Tate ring of
  noetherian type is strongly noetherian, in particular noetherian. A definition "`X` is covered by
  sheafy affinoids" would accept `X`.
- For discrete `A = ℤ[X₀, X₁, …]`,
  `IsLocallyNoetherian Spa(A,A)` holds, but the coordinate ideal `(X₀,X₁,…)`
  is not finitely generated. The Check asserts the geometric predicate on
  an affinoid presentation of this pair.
- *Characterisation.* An analytic adic space is locally
  noetherian iff it is covered by `Spa(A, A⁺)` with `A` a complete strongly noetherian Tate ring
  (analytic points have Tate rational neighbourhoods, AdicSpaces layer 2.3; Tate + noetherian ring
  of definition ⇒ strongly noetherian).
- *Non-example.* `Spa(A, A)` for the ring `A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control*
  is locally noetherian (open noetherian ring of definition `ℤ_p`) and sheafy, although `A` is
  outside Huber's standing class.

**Locally Huber-standard adic spaces.** (*locally-huber-standard*) `X` is locally Huber-standard
if every point has an affinoid chart whose coordinate ring is in Huber's standing class
(*huber-standing-class*; Huber96 §1.1, (1.1.1), p. 37). Such `X` is locally noetherian, hence has
stably sheafy charts, and `Spa(A, A⁺)` qualifies, through its identity chart, when `A` is in the
class. For analytic `X` it is the same as being locally noetherian (both say: locally `Spa` of
complete strongly noetherian Tate rings). It is the hypothesis that every theorem of R0.16–R0.17
places on each space it involves, in place of Huber's book-wide convention, and local finite
presentation (*locally-finite-presentation*) asks its witness charts to be of this kind. Prove
also that open subspaces of locally Huber-standard spaces and spaces locally of finite type over
them are locally Huber-standard (the class is stable under rational localisation and topologically
finite type extensions, *huber-standing-class*). Checks: `Spa(ℤ_p⟦T⟧)` and every discretely ringed
space qualify. `Spa(A, A)` for `A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control* is locally
noetherian but not locally Huber-standard at the point `∞` of `V(p) = Spa(E, E)`: every chart
around `∞` meets cofinitely many coordinate points, so its ring contains infinitely many nonzero
orthogonal idempotents and is not noetherian, which rules out (a) and (b); and `∞` specialises the
analytic point of `Spa(ℤ_p, ℤ_p) ⊆ Spa(A, A)`, so no chart around it is discrete. For the direct
product `ℤ_p × E` of *etale-standing-class-product-control*, `Spa(ℤ_p × E) = Spa(ℤ_p) ⊔ Spa(E)` is
locally Huber-standard (its points have the charts `Spa(ℤ_p)` and discrete charts inside `Spa(E)`)
although its global ring is not in the class. Lean: `AdicSpace.IsLocallyHuberStandard`,
`IsLocallyHuberStandard.isLocallyNoetherian`, `IsLocallyHuberStandard.spa`, and the proved
`example` after `LocallyOfFinitePresentation` that `LocallyOfFinitePresentation (𝟙 S)` implies
`IsLocallyHuberStandard S`.

The geometric Checks are stated with morphisms induced by pair morphisms
(`Affinoid.IsInducedBy`) and the predicates above. In
the hypersurface Check, the continuous open quotient
`ℚ_p⟨T,S⟩ → A` has kernel `(TS − p)`, preserves scalars, and has target plus ring
`A°`. In the formal power-series Check, homeomorphic ring equivalences identify
the source ring with `(p,T)`-adic `ℤ_p⟦T⟧` and the base with `ℤ_p`; both plus
rings are full. The displayed coordinate equation fixes the structure map.
The discrete non-finite-presentation Check similarly fixes the quotient map by
ring equivalences, so it tests a geometric morphism rather than just its ring map.

For the square-zero base-change Check, the statement identifies
all four coordinate rings and all four maps of the square. It gives the square-zero
summand `M = ℕ →₀ 𝔽_p` the discrete topology and `ℤ_p ⊕ M` the product topology,
asserts `IsPullback` for the induced geometric square, and tests local finite
presentation on both vertical morphisms: Huber's printed condition holds for the first and fails
for the second, and the predicate of *locally-finite-presentation* fails for both. No
finite-presentation hypothesis is assumed for the projection. For the perfectoid non-example, the
signature covers the completed root disc over any complete nontrivially valued
nonarchimedean field: elements `tₙ` satisfy `tₙ₊₁^p = tₙ`, their polynomial
subalgebras have dense union, and the coordinate topology is specified by the
Gauss norm on every such polynomial subalgebra. The plus ring is the full
power-bounded ring. This includes the perfectoid-field example above without
requiring a second perfectoid-ring predicate here.

**Check (non-example).**
`ℤ_p → ℤ_p⟦T⟧` with target topology `(p,T)`-adic is not of +weakly finite type for any
compatible choices of plus rings: its ring map is not adic. Together with the disc computation and
the identity case of *plus-weakly-finite-type*, this gives the non-example,
computed disc case and degenerate identity case for `LocallyOfPlusWeaklyFiniteType_affinoid`.

### R0.7 fibre products

Fibre products of adic spaces do not exist in general. This subsection builds them where they do:
over an affinoid base along adic maps the fibre product is `Spa` of the completed tensor product;
along a morphism locally of finite type and an arbitrary (non-adic) affinoid base change it is an
ascending union of affinoids which need not be affinoid; and these local models glue to the
existence theorem under the two hypotheses Huber uses. The remaining targets describe the points
of a fibre product and the classes of morphisms that base change preserves.

**Valuations agreeing on a common subring extend jointly to the tensor product.**
(*valuation-amalgamation*) Let `A → B` and `A → C` be commutative ring homomorphisms and let
`y ∈ Spv B`, `x ∈ Spv C` be valuations (points of `Spv`) whose pullbacks to `A` agree as points of
`Spv A` (Tau Ceti `ValuationSpectrum.comap`). The theorem
`ValuationSpectrum.exists_amalgamation` asserts that there is a valuation `v` on `B ⊗_A C` whose
pullbacks along `inl : B → B ⊗_A C` and `inr : C → B ⊗_A C` are `y` and `x` (Huber94 §3, proof of
Lem. 3.9(i), pp. 537–538; Wedhorn §8.7, proof of Prop. 8.63, p. 92, the analogous existence of an
extending valuation in the scheme case). The field form of the target is: for field extensions `K₁, K₂`
of `K₀` and valuation rings `V_i ⊆ K_i` with `V₁ ∩ K₀ = V₂ ∩ K₀`, there are a field `L` (a residue
field of `K₁ ⊗_{K₀} K₂`), `K₀`-embeddings `K₁ → L`, `K₂ → L` and a valuation ring `W ⊆ L` with
`W ∩ K₁ = V₁` and `W ∩ K₂ = V₂` (Huber96 §1.1, (1.1.14)(f), p. 45, recorded by Huber among the
simple properties of valuations used freely, without proof). For `K₀ = ℚ_p` and
`K₁ = K₂ = ℚ_p(√p)` with their `p`-adic valuations, `L` can be taken to be `K₁` itself (either factor
of `K₁ ⊗ K₂ ≅ K₁ × K₁`, the isomorphism being `a ⊗ b ↦ (ab, a b̄)` with `b̄` the conjugate), and
there are two different choices; this is the non-injectivity in *fibre-product-points*. The
hypothesis is not vacuous and not redundant: for `A = ℤ`, `B = 𝔽_2`, `C = 𝔽_3` the ring
`B ⊗_A C = 0` has no valuations, and correspondingly the trivial valuations of `𝔽_2` and `𝔽_3`
pull back to the two different points of `Spv ℤ` with supports `(2)` and `(3)`; for `B = C = 𝔽_2`
the trivial valuation of `𝔽_2 ⊗_ℤ 𝔽_2 = 𝔽_2` is the amalgam. The proof reduces to the field form
through the residue fields `k(supp y)`, `k(supp x)` over `k(supp y ∩ A)`, where the two
valuation rings restrict to the same valuation ring because `y` and `x` have the same pullback;
in the field form `V₁ ⊗_{V₀} V₂` is `V₀`-torsion-free, hence flat, hence a subring of
`K₁ ⊗_{K₀} K₂`, which is its localisation at the nonzerodivisors `b₁ ⊗ b₂` (`b_i ∈ V_i ∖ 0`), and a
minimal prime `𝔭` of `V₁ ⊗_{V₀} V₂` below a prime containing `𝔪₁ ⊗ V₂ + V₁ ⊗ 𝔪₂` (which is a
proper ideal, the quotient being `k₁ ⊗_{k₀} k₂ ≠ 0`) gives `L = Frac(V₁ ⊗ V₂ / 𝔭)`, a residue
field of `K₁ ⊗_{K₀} K₂`, and `W` any valuation ring of `L` dominating the local ring at that
prime; `W ∩ K_i` contains `V_i` and its maximal ideal contains `𝔪_i`, so `W ∩ K_i = V_i`.
*Needs:* Tau Ceti `ValuationSpectrum.comap`; Mathlib's criterion that a module over a Bézout
domain is flat iff it is torsion-free, `Ideal.exists_le_maximal`,
`Ideal.exists_minimalPrimes_le`, `Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes`,
`LocalSubring.exists_le_valuationSubring`, `ValuationSubring.isMax_toLocalSubring`.
Lean: `ValuationSpectrum.exists_amalgamation`; the field form is a README target.

**Checks for valuation amalgamation.**

- *Non-example.* Any valuations on
  `𝔽₂` and `𝔽₃` pull back to different points of `Spv ℤ`, with supports `(2)`
  and `(3)`. Their tensor product over `ℤ` is the zero ring and has no valuations.
- *Non-example.* For prime `p`,
  a degree-two field extension `L/ℚ_p` and a point `y ∈ Spv L` fixed by every
  `ℚ_p`-automorphism of `L`, there are distinct points of `Spv(L ⊗_{ℚ_p} L)`
  whose restrictions along both tensor inclusions are `y`. Compatibility of
  restrictions gives existence without uniqueness.

**Checks for the field form.**

- Take `K₀ = K₁ = K₂ = ℚ₂`
  and the valuation subring `ℤ₂`. The prime is explicitly the zero ideal of
  `ℚ₂ ⊗_{ℚ₂} ℚ₂`. Its residue field is identified with `ℚ₂` by `a ⊗ b ↦ ab`;
  pulling `ℤ₂` back through this equivalence gives a valuation subring whose
  restrictions through both tensor inclusions are `ℤ₂`
  (Huber96, (1.1.14)(f), p. 45).
- Two distinct valuation
  subrings of the same field cannot be restrictions of one valuation subring along
  two equal embeddings. Agreement on the base is essential, even for identity extensions.

**Spa of a sheafy completed tensor product is the fibre product.** (*affinoid-fibre-product*) Let
`f : (A, A⁺) → (B, B⁺)` and `g : (A, A⁺) → (C, C⁺)` be morphisms of complete Hausdorff Huber pairs
with adic ring homomorphisms, such that `Spa A`, `Spa B`, `Spa C` are adic spaces (their pairs are
sheafy), and let `D = B ⊗̂_A C` (*completed-tensor-product*). Prove that if `D` is sheafy (AdicSpaces'
`Huber.IsSheafyForEveryPresentation`), then `Spa D` with the morphisms `Spa(inl) : Spa D → Spa B`
and `Spa(inr) : Spa D → Spa C` is a fibre product of `Spa B → Spa A ← Spa C` in the category of
adic spaces: for every adic space `X` and morphisms `a : X → Spa B`, `b : X → Spa C` with
`Spa(f) ∘ a = Spa(g) ∘ b` there is a unique morphism `X → Spa D` composing to `a` and `b` (Huber94
§3, proof of Prop. 3.7, p. 536, Huber's deduction of the fibre product from the cocartesian square;
Huber94 §2, Prop. 2.1(i), p. 522, morphisms between affinoid adic spaces are continuous ring
homomorphisms; Huber96 §1.2, Prop. 1.2.2 and proof part 1), p. 47, the adic case on affinoids).
Sheafiness of `D` is an explicit hypothesis. R0 establishes it in the noetherian case
using *completed-tensor-noetherian-stability*. PerfectoidSpaces P2 and P3.17a.3
apply this conditional fibre-product theorem after establishing sheafiness for their
perfectoid and sousperfectoid inputs. Huber needs no sheafiness hypothesis
only because of his standing convention (Huber96 §1.1, (1.1.1), p. 37): every f-adic ring is assumed
to have a completion finitely generated over a noetherian ring of definition, or to be strongly
noetherian Tate, or to be discrete; the statement here replaces this by the explicit hypothesis that
`D` is sheafy. Worked instances: `Spa(K⟨T⟩) ×_{Spa K} Spa(K⟨S⟩) = Spa(K⟨T, S⟩)` (Hübner §9, Ex. 9.3);
`Spa(ℤ_p⟨T⟩) ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p) = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, the closed unit disc over `ℚ_p`
(Hübner §9, Ex. 9.4), and `Spa(ℤ_p⟨T⟩) ×_{Spa ℤ_p} Spa(𝔽_p) = Spa(𝔽_p[T])` with the discrete
topology (Hübner §9, Ex. 9.5); and `Spa(L, O_L) ×_{Spa ℚ_p} Spa(L, O_L) = Spa(L × L, O_L × O_L)`
for `L = ℚ_p(√p)` (for every `p`, including `p = 2`): `L ⊗_{ℚ_p} L = L[x]/(x² − p) ≅ L × L` via
`x ↦ ±√p`, the plus ring is the integral closure of the image of `O_L ⊗ O_L`, which is
`O_L × O_L` because `O_L ⊗ O_L → O_L × O_L` is finite, and `Spa(L × L, O_L × O_L)` is the
disjoint union of two copies of the one-point space `Spa(L, O_L)` (a continuous valuation of `L`
with `|O_L| ≤ 1` has valuation ring `O_L` (the overrings of the rank-one valuation ring `O_L` are
`O_L` and `L`, and continuity, `|p| < 1`, excludes `L`)). Degenerate instances: for `B = 0`
(or `C = 0`), `D = 0` and `Spa D = ∅ = ∅ ×_{Spa A} Spa C`; for `B = C = A` with the identities,
`D = A` and the fibre product is `Spa A`. The structure maps of all four worked instances are adic:
`K → K⟨T⟩`, `K → K⟨S⟩` and `ℚ_p → L` are continuous maps of Tate rings, `ℤ_p → ℚ_p` sends the ideal
of definition `pℤ_p` to `pℤ_p ⊆ ℤ_p`, and `ℤ_p → 𝔽_p` sends it to
`0`, the ideal of definition of a discrete ring. *Needs:* *completed-tensor-product*;
*completed-tensor-product-universal-property*; Tau Ceti `Huber.Pair.Hom.spaComap`.
`AdicSpace.affinoid_isPullback` carries complete sheafy affinoids `A`, `B`, `C`,
adic pair maps `A → B`, `A → C`, and sheafiness of their specified completed tensor pair.
It states `IsPullback` for the square of the induced Spa morphisms, using the two
coefficient inclusions; the topology and plus-ring comparisons are part of that square.

Lean: README target.

**Fibre products along a finite-type morphism over an arbitrary affinoid base change.**
(*fibre-product-along-finite-type*) Let `S = Spa(A, A⁺)`, `X = Spa(C, C⁺)`, `Y = Spa(B, B⁺)` be
affinoid adic spaces with complete Hausdorff pairs, `B` stably sheafy (AdicSpaces'
`Huber.IsStablySheafyRing`), `f : X → S` given by a morphism `μ : (A, A⁺) → (C, C⁺)` topologically of
finite type as a morphism of pairs (Part II `AdicSpace.IsTopologicallyFiniteTypePair`), presented by a quotient mapping
`σ : A⟨X₁,…,X_n⟩_M → (C, C⁺)` with kernel `𝔞`, and `g : Y → S` given by an arbitrary morphism of
Huber pairs `λ : (A, A⁺) → (B, B⁺)`, not assumed adic. Let `L ⊆ B` be a finite set generating an
ideal of definition of a ring of definition of `B`. For `m ≥ 1` put
`M_{L,m} := (λ(M₁) ∪ Lᵐ, …, λ(M_n) ∪ Lᵐ)` (each `λ(M_i) ∪ Lᵐ` generates an open ideal of `B`), and
`W_m := Spa(B⟨X⟩_{M_{L,m}}/J_m)` with `J_m` the closure of the ideal generated by `λ'(𝔞)` and the
integral-closure plus ring. Prove: (1) each `W_m` is an affinoid adic space topologically of finite
type over `Y`; (2) for `m ≤ m'` the restriction `B⟨X⟩_{M_{L,m'}}/J_{m'} → B⟨X⟩_{M_{L,m}}/J_m`
identifies `W_m` with the rational subset `{w ∈ W_{m'} : w(ℓ·X_i) ≤ 1 for all ℓ ∈ Lᵐ and all i}` of
`W_{m'}`; (3) the adic space `W := ⋃_m W_m` obtained by gluing along these open embeddings, with
its maps to `X` and `Y`, is a fibre product `X ×_S Y` in the category of adic spaces; (4) if `λ` is
adic then `W = W_∞ := Spa(B⟨X⟩_{λ(M)}/J) = Spa(C ⊗̂_A B)` is affinoid; in general `W` is not
quasi-compact (Huber96 §1.2, proof of Prop. 1.2.2, part 2), pp. 47–48 — the weights enlarged by
`Lᵐ`, the closures `J_m`, and the transition maps as open embeddings onto rational subsets, with
the universal property checked on p. 49 for affinoid test objects; Hübner §9, proof of
Thm 9.2(iii), p. 42; Huber94 §3, proof of Prop. 3.8, p. 537, the same technique; Berkeley
Lecture 4, §4.1, p. 28). Worked instance: for `S = Spa(ℤ_p, ℤ_p)`,
`X = Spa(ℚ_p, ℤ_p) = Spa(ℤ_p⟨X⟩_{p}/(pX − 1))`, `Y = Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` with the `(p, T)`-adic
topology and `L = {p, T}`, one has `W_m = {|T|ᵐ ≤ |p| ≠ 0}` and `X ×_S Y = ⋃_m W_m` is the open
unit disc over `ℚ_p`, which is not affinoid (Hübner §9, Ex. 9.4; Berkeley Lecture 4, §4.1, p. 28,
the open unit disc as a generic fibre of `Spa ℤ⟦T⟧`); if instead `Y = Spa(ℤ_p⟨T⟩)` (`λ` adic) then
`X ×_S Y = Spa(ℚ_p⟨T⟩)` is affinoid. *Needs:* *completed-tensor-restricted-power-series*; Tau Ceti
`Huber.Pair.Hom.quotientLift`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`Huber.weightedRestrictedSubring`.
`AdicSpace.fibreProduct_weighted_exhaustion` carries the finite-type pair map
`A → B`, an arbitrary pair map `A → C`, and a complete stably sheafy `C`.
For a finite weighted presentation of `B` and a finite generating set `E` of an ideal
of definition of `C`, the charts obtained by adjoining the image weights together with
`E^k` cover the fibre product. Their inclusions for increasing `k` are open immersions,
the coordinate maps fix coefficients and variables, and the union represents the
compatible pairs of morphisms in the fibre-product universal property.

Lean: README target.

**Existence of fibre products of adic spaces.** (*fibre-products-existence*) Let `f : X → S` and
`g : Y → S` be morphisms of adic spaces (the category of the Foundations of adic spaces roadmap
(AdicSpaces), layer 5). Assume that `Y` is covered by open affinoids `Spa(B, B⁺)` with `B` complete
and stably sheafy (AdicSpaces' `Huber.IsStablySheafyRing`) — for instance `Y` locally noetherian
(*locally-noetherian-adic-space*, by *noetherian-type-stably-sheafy*) — and that one of the
following holds: (a) `f` is locally of finite type (Part II `AdicSpace.LocallyOfFiniteType`, Huber's notion);
(b) `f` is locally of weakly finite type (*finite-type-morphism-classes*) and `g` is adic
(*adic-morphism*). Prove that the fibre product `X ×_S Y` exists in the category of adic spaces
(Mathlib `CategoryTheory.Limits.HasPullback f g` for that category), and that its projections
`p : X ×_S Y → X` and `q : X ×_S Y → Y` satisfy: `q` is locally of finite type in case (a), and
locally of weakly finite type (locally of finite type if `f` is) in case (b); `p` is adic whenever
`g` is adic. The global form of (b) holds only with quasi-compactness: if in (b) `f` is moreover
quasi-compact, `q` is quasi-compact by *base-change-stability* (vi), so of weakly finite type.
`X ×_S Y` is covered by stably sheafy affinoids, and is locally noetherian if `Y` is.
Local form: over affinoid `S = Spa A`, `X = Spa C`, `Y = Spa B` with `g` adic,
`X ×_S Y = Spa(C ⊗̂_A B)` (*affinoid-fibre-product*); with `g` not adic, `X ×_S Y` is the ascending
union of affinoids of *fibre-product-along-finite-type* and need not be affinoid. Nothing is
asserted outside these hypotheses: fibre products of adic spaces do not exist in general (Huber94
§3, Prop. 3.7, p. 535, existence and the projection properties; Huber96 §1.2, Prop. 1.2.2 and
proof, pp. 47–49, the two cases; Huber96 §1.2, Cor. 1.2.3(i), (iii)(a), p. 49, the properties of
the projections `q` (Huber's `u`) and `p` (Huber's `v`); Wedhorn §8.6, Thm 8.56, p. 89, the
stably-sheafy formulation of the hypothesis on `Y`, and Rem. 8.57, p. 90, the local projection
properties; Berkeley Lecture 4, §4.1, p. 28, where no
unrestricted existence statement is made). Huber works under the standing convention (Huber96
§1.1, (1.1.1), p. 37), which is why no sheafiness hypothesis appears in his statement; the
hypothesis on `Y` follows Wedhorn. For `S` analytic every morphism is adic
(*adic-iff-analytic-locus*; Huber96 §1.2, p. 46), so fibre products over an analytic base exist as
soon as `f` is locally of weakly finite type and `Y` is locally noetherian; Huber94 Prop. 3.7 is the
special case (a) with `g` adic; `Spa(ℤ_p⟦T⟧) ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p)` exists and is the
non-affinoid open unit disc over `ℚ_p`. Outside the hypotheses, `Spa(ℤ[T₁, T₂, …], ℤ) × Spa K` is
not representable (Berkeley Lecture 4, §4.1, p. 28); there `f` is not locally of finite type.
Check: for `f : ∐_{n ≥ 0} Spa(K, K°) → Spa(K, K°)` and `g = id` (all charts strongly noetherian
Tate, `g` adic) the base change is `f` itself: locally of finite type, not quasi-compact, so not of
weakly finite type; a finite disjoint union is of finite type.
*Needs:* *affinoid-fibre-product*; *fibre-product-along-finite-type*;
*completed-tensor-restricted-power-series*; *topologically-finite-type-is-adic*;
*adic-iff-analytic-locus*; *finite-type-morphism-classes*; *adic-morphism*;
*topologically-finite-type-noetherian-type*; *noetherian-type-stably-sheafy*;
*locally-noetherian-adic-space*; *completed-tensor-product*;
*completed-tensor-rational-localisation*; Mathlib `CategoryTheory.Limits.HasPullback`.
Lean: existence `hasPullback_of_finiteType`; the local conclusion of (b) is
`LocallyOfWeaklyFiniteType.baseChange`.

**Points of a fibre product surject onto compatible pairs, not injectively.**
(*fibre-product-points*) In the situation of *fibre-products-existence* with `g` adic (case (b),
`f` locally of weakly finite type and `Y` with stably sheafy charts; this includes
case (a) when `g` is adic), let `Z = X ×_S Y` with
projections `p : Z → X`, `q : Z → Y`. The theorem `AdicSpace.exists_pullback_point`,
on `TauCeti.AdicSpace` and an `IsPullback` square, asserts that for all `x ∈ X` and
`y ∈ Y` with `f(x) = g(y)`
there is `z ∈ Z` with `p(z) = x` and `q(z) = y`; that is, the map `|Z| → |X| ×_{|S|} |Y|` of
underlying sets is surjective (Huber94 §3, Lem. 3.9(i), p. 537; Huber94 §3, proof of Lem. 3.9(i),
p. 538, where the restricted valuation `w` is a point of `Spa E`; Huber96 §1.2, Cor. 1.2.3(iii)(d),
p. 49, stated only under "`f` locally of weakly finite type and `g` adic", with the proof "cf. proof
of [Hu, 3.9.i]"). It is not injective in general: for `L = ℚ_p(√p)`, `X = Y = Spa(L, O_L)` and
`S = Spa(ℚ_p, ℤ_p)`, the spaces `|X|`, `|Y|`, `|S|` are single points and
`|Z| = |Spa(L × L, O_L × O_L)|` has two points (Conrad-AWS §5.2, p. 49, non-injectivity from
completed tensor products of field extensions); and over the pair of Gauss points of two closed
unit discs over `ℚ_p` there are infinitely many points of the bidisc (the Gauss point and, for every
`0 < r < 1`, the point `f ↦ sup{|f(T, S)| : |T| ≤ 1, |T − S| ≤ r}`). Without adicness of `g`
surjectivity fails, even in case (a): take `S = Spa(ℤ_p, ℤ_p)` with `ℤ_p` discrete,
`X = Spa(ℤ_p[T], ℤ_p[T])` discrete (`f` locally of finite type) and `Y = Spa(ℤ_p⟦U⟧, ℤ_p⟦U⟧)` with
the `U`-adic topology (`g` not adic), so that `X ×_S Y = Spa(ℤ_p⟦U⟧⟨T⟩)` with the `U`-adic
topology; the rank-2 valuation `x` of `ℤ_p[T]` with `|p| < 1` and `0 < |T| < |p|ⁿ` for all `n`
(values in `ℝ_{>0} × ℝ_{>0}` ordered lexicographically with `|a| = (1, |a|_p)` for `a ∈ ℤ_p` and
`|T| = (1/2, 1)`, so `|Σ a_i T^i| = max_i |a_i| |T|^i` is a valuation with `|T| < (1, p^{-n}) = |p|ⁿ`;
every valuation of the discrete ring `ℤ_p[T]` is continuous, and `|ℤ_p[T]| ≤ 1`) and
the Gauss point `y` of radius `|p|^{1/2}` of `ℤ_p⟦U⟧` (`|Σ b_j U^j| = max_j |b_j|_p p^{-j/2}`,
continuous for the `U`-adic topology since `|U|^n = p^{-n/2} → 0`) both restrict to the
`p`-adic valuation of `ℤ_p`, but a valuation `z` over both has `|U|^{2n} = |p|^n > |T| ≠ 0` for
all `n`, so `|U|` is not cofinal and `z` is not continuous for the `U`-adic topology of
`ℤ_p⟦U⟧⟨T⟩`: no point of `X ×_S Y` lies over `(x, y)`. A statement claiming
surjectivity whenever the fibre product exists fails this example. The étale-site coverings of
AdicEtaleGeometry A1.6 are jointly surjective families; their base changes
along adic morphisms are again jointly surjective by this lemma, while base change along non-adic
morphisms needs a separate argument (for instance that residue value groups of étale maps are
torsion over the base). *Needs:* *fibre-products-existence*; *affinoid-fibre-product*;
*fibre-product-along-finite-type*; *valuation-amalgamation*; Tau Ceti `ValuationSpectrum.spa`,
`ValuationSpectrum.comap`.
Lean: `exists_pullback_point`; the identity base-change Check is an `example`.

**Checks for geometric point lifting.**

- Base change by the identity has a unique
  point above each compatible pair. This uses the geometric pullback and needs no
  finiteness hypothesis.
- A pullback with an empty first factor is empty.
- For every prime `p`, including
  `p = 2`, take a complete normed quadratic extension `L/ℚ_p` with an element `θ`
  satisfying `θ² = p`. The self-product of `Spa(L, O_L)` over `Spa(ℚ_p, ℤ_p)` exists,
  has exactly two points, and its map to the product of the two singleton point sets
  is not injective. The coefficient homomorphism is explicitly `algebraMap ℚ_[p] L`.
- The discrete `ℤ_p` and `ℤ_p[T]` affinoids
  and the `U`-adic `ℤ_p⟦U⟧` affinoid above have the full rings as plus rings. The
  geometric pullback exists, the polynomial projection is locally of finite type,
  and the power-series projection is not adic. There are compatible points with
  the usual `p`-adic comparisons on constants, `0 < |T| < |p|ⁿ` for every `n`, and
  `|U|² = |p|`, with no point above them. The ring identifications and the topology
  of each affinoid are hypotheses of this Check; the pullback and obstructed
  pair are its conclusions.

**Stability of adicness and of the finite-type classes under base change.**
(*base-change-stability*) Let the cartesian square `Z = X ×_S Y` (`p : Z → X`, `q : Z → Y`) be as in
*fibre-products-existence*, `q` being the base change of `f` along `g` and `p` the base change of
`g` along `f`. Prove: (i) if `f` is locally of finite type (Part II `AdicSpace.LocallyOfFiniteType`), so is `q`; (ii) if
`f` is locally of weakly finite type and `g` is adic, `q` is locally of weakly finite type and `p`
is adic; (iii) if `f` is locally of +weakly finite type (*plus-weakly-finite-type*) and `g` is adic,
`q` is locally of +weakly finite type; (iv) if `f` is locally of finite presentation
(*locally-finite-presentation*), then `q` is locally of finite type by (i), and `q` is locally of
finite presentation provided that `Y` is locally Huber-standard (*locally-huber-standard*; for
analytic `Y` the same as locally noetherian) and either `Y` is analytic or every point of `X` has a
chart of `f` —
open affinoids `U ⊆ X`, `W ⊆ S` with `f(U) ⊆ W` and `(O_S(W), O_S⁺(W)) → (O_X(U), O_X⁺(U))`
topologically of finite type — with a presentation `O_X(U) ≅ O_S(W)⟨X₁,…,X_n⟩_M/𝔞` whose kernel `𝔞`
is a finitely generated ideal (automatic when `O_S(W)⟨X₁,…,X_n⟩_M` is a noetherian ring, or when
`O_S(W)` is discrete, in particular when every point of `S` has an open affinoid neighbourhood with
discrete ring of functions). The second condition holds when `S` is locally Huber-standard, in
particular for the witness charts of *locally-finite-presentation*: for `O_S(W)` in classes (a),
(b) of *huber-standing-class* the ring `O_S(W)⟨X⟩_M` is noetherian, and in class (c) `f` is
finitely presented on the chart. Without either condition (iv) fails for Huber's printed
Def. 1.2.1(v), even for adic `g` and `S` of noetherian type (the non-example below, and
*etale-standing-class-control*); (v) if `g` is adic, `p` is adic (*adic-morphism*); (vi) if
`g` is adic and `f` is quasi-compact (resp. quasi-separated), `q` is quasi-compact (resp.
quasi-separated); if `g` is adic and quasi-compact (resp. quasi-separated), `p` is quasi-compact
(resp. quasi-separated) (Wedhorn §8.6, Rem. 8.57, p. 90, the adic, weakly-finite-type and
quasi-compact clauses, case (b); Huber94 §3, Prop. 3.7, p. 535, the locally-finite-type clause: the
projection to `Y` is locally of finite type and the projection to `X` adic; Huber96 §1.2,
Cor. 1.2.3, p. 49, where Huber's `u` is `q` and `v` is `p`: his (i) gives (i) and (iv), his (ii) is
(iii), his (iii)(a) is (ii) and (v), his (iii)(b),(c) are (vi), and his (iii)(d) is
*fibre-product-points*). Huber96 Cor. 1.2.3(i) asserts the stability of local finite presentation
without qualification; this is correct under the book's standing hypothesis (Huber96 §1.1,
(1.1.1), p. 37: every f-adic ring has a completion finitely generated over a noetherian ring of
definition, or is a strongly noetherian Tate ring, or is discrete, so that `O_S(W)⟨X⟩_M` is
noetherian or `O_S(W)` is discrete and `𝔞` is finitely generated), but not in the generality of
this lemma, whose clause (iv) therefore carries the extra hypothesis. Quasi-compactness is not
preserved by base change along a non-adic `g`: the base change of the quasi-compact morphism
`Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` along `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` is the open unit disc over `ℚ_p`,
whose projection to `Spa(ℤ_p⟦T⟧)` is not quasi-compact. The base change of the closed unit disc
`Spa(ℚ_p⟨T⟩) → Spa ℚ_p` along `Spa ℂ_p → Spa ℚ_p` is the closed unit disc over `ℂ_p`, locally of
finite type over `Spa ℂ_p`. Non-example for (iv) without its extra hypothesis: let
`M = ⊕_{i∈ℕ} 𝔽_p·e_i` and `A = ℤ_p ⊕ M` with `M² = 0` (`ℤ_p` acting on `M` through `𝔽_p`),
topologised so that `pⁿℤ_p ⊕ 0` (`n ≥ 0`) is a fundamental system of neighbourhoods of `0`; then
`ℤ_p ⊕ 0` is a noetherian ring of definition, so `Spa(A, A)` is an adic space
(*noetherian-rod-sheafy*; Huber94 §2, Thm 2.2). The morphism `f : Spa(ℤ_p, ℤ_p) → Spa(A, A)`
induced by the quotient mapping
`(a, m) ↦ a` satisfies Def. 1.2.1(v) as printed because `A` is not discrete (it fails the
standing-class requirement of *locally-finite-presentation*, since the only open affinoid
neighbourhood of the closed point of `Spa(A, A)` is the whole space, whose ring is outside the
class);
`g : Spa(A/pA, A/pA) → Spa(A, A)` with `A/pA = 𝔽_p ⊕ M` discrete is adic (`pA ↦ 0`, an ideal of
definition of a discrete ring). The fibre product is `Spa(𝔽_p, 𝔽_p)` and `q` is induced by
`𝔽_p ⊕ M → 𝔽_p`, whose kernel `M` is not finitely generated; `Spa(𝔽_p ⊕ M, 𝔽_p ⊕ M)` is a single
point whose only open affinoid neighbourhood has the discrete ring `𝔽_p ⊕ M`, so `q` is not
locally of finite presentation. This `A` lies outside Huber96's standing hypothesis (1.1.1), since
`A = Â` is not finitely generated over its noetherian ring of definition `ℤ_p ⊕ 0`, so it does not
contradict Huber's Cor. 1.2.3(i). The base-change properties of separated, proper, finite, étale
and smooth morphisms are stated with those notions (*proper-base-change*,
*closed-embedding-proper*, *smooth-etale-base-change*) and are not part of this lemma. *Needs:*
*fibre-products-existence*; *completed-tensor-restricted-power-series*;
*fibre-product-along-finite-type*; *completed-tensor-product*; *affinoid-fibre-product*;
*finite-type-morphism-classes*; *plus-weakly-finite-type*; *locally-finite-presentation*;
*adic-morphism*; Mathlib `Algebra.FinitePresentation.baseChange`,
`Algebra.FinitePresentation.quotient`, `Algebra.FinitePresentation.ker_fG_of_surjective`.
Lean: `IsAdic.baseChange` (v, under the hypotheses of *fibre-products-existence*),
`LocallyOfWeaklyFiniteType.baseChange` (ii); the identity base-change Check is an `example`.

### R0.8 closed subspaces and the diagonal

Closed subspaces of an adic space are adic spaces cut out by admissible ideal sheaves, never
closed subsets. R0 states the closed-immersion predicate specified by AdicSpaces §5.1, identifies it
with the ideal-sheaf construction and defines locally closed embeddings. The diagonal of
a morphism locally of weakly finite type is a locally closed embedding, which is the input for
separatedness.

**Closed adic subspaces cut out by ideal sheaves; closed, open and locally closed embeddings.**
(*closed-adic-subspaces-and-embeddings*) Let `X` be an adic space (the category of AdicSpaces).
(1) Affinoid model: for a complete Hausdorff sheafy Huber pair `(A, A⁺)` and a closed ideal `J ⊆ A`
with `A/J` sheafy, the quotient pair `A/J := (A/J, integral closure of the image of A⁺)` (Tau Ceti
`Pair.quotient`; Huber's `(A^▷/J, (A⁺/(J ∩ A⁺))^c)`) gives `Spa(A/J) → Spa(A)`, a homeomorphism
onto the closed set `{v : J ⊆ supp v}` (Tau Ceti `TauCeti.Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom`,
`range_spaComap_quotientHom`). (2) `AdmissibleIdealSheaf X` bundles an ideal sheaf `𝓘 ⊆ O_X` (a sheaf of ideals of the underlying
sheaf of rings), which is *admissible* if `X` has a cover by open affinoids `U = Spa(A, A⁺)` such that
`J_U := 𝓘(U)` is a closed ideal of `A`, `A/J_U` is sheafy, and for every rational `W ⊆ U` the ideal
`𝓘(W)` is the kernel of `O_X(W) → O_{Spa(A/J_U)}(W ∩ V(J_U))`.
The structure records restriction and local membership for the section ideals, and identifies
its stalk ideal with the ideal generated by their germs. Its `closed`, `quotient` and
`kernel_on_opens` fields express the three admissibility conditions: the quotient is a complete
sheafy `Affinoid`, its coordinate map is a continuous open surjection with kernel `J_U`, and its
plus ring is the integral closure of the image. The kernel equality is recorded on every open
inside the chosen chart; this is equivalent to the rational-basis condition because both sides
are sheaves. The *closed adic subspace* `V(𝓘)` is
`(Z, O_Z, (v_z))` with `Z = {x ∈ X : 𝓘_x ≠ O_{X,x}}`, `O_Z = (O_X/𝓘)|_Z` topologised on each such
`U` as the structure sheaf of `Spa(A/J_U)` (so `O_X(U) → O_Z(U ∩ Z)` is continuous and open), and
`v_z` induced through `O_{X,z} → O_{X,z}/𝓘_z`; it is an adic space with `V(𝓘) ∩ U ≅ Spa(A/J_U)` over
`U`, and the inclusion `ι : V(𝓘) → X` is a morphism of adic spaces. `V(𝓘)` is retained as an adic
space (a ringed space with valuations), never replaced by the closed subset `Z`. (3) A morphism
`h : T → X` is a *closed embedding* if it is isomorphic over `X` to `ι : V(𝓘) → X` for an
admissible `𝓘`; an *open embedding* if it is an isomorphism onto an open subspace; a *locally
closed embedding* if it factors as a closed embedding into an open subspace `U ⊆ X` followed by
the inclusion of `U`. Closed embeddings are exactly the closed immersions of AdicSpaces §5.1, stated
here as `AdicSpace.IsClosedImmersion` (affinoid-locally `Spa(A/J) → Spa(A)` with `J` closed and `A/J` sheafy), with
`𝓘 = ker(O_X → h_*O_T)`; this target adds the ideal-sheaf description, the universal property and
locally closed embeddings. `Suggested.lean` states `AdicSpace.IsClosedImmersion` on the shared
carriers, as the supplier contract of AdicSpaces §5.1 rather than an R0 target. R0 uses that
predicate in the ideal-sheaf comparison. On a locally noetherian `X`
every ideal of an affinoid ring of noetherian type is closed and `A/J` is of noetherian type, hence
sheafy (*noetherian-type-ideals-closed*, *noetherian-type-stably-sheafy*). On a locally noetherian
analytic `X` (charts `Spa(A, A⁺)` with `A` complete strongly noetherian Tate, the convention of
*locally-noetherian-adic-space*) the admissible ideals are exactly the coherent ideals: closed adic
subspaces correspond to coherent ideals there (AdicSpacesPartIII layer R3,
*coherent-ideal-closed-subspace*). On a general locally noetherian, or locally Huber-standard, `X`
only the admissible-ideal description is asserted; the kernel of a closed embedding need not be of
finite type, hence need not be coherent (the square-zero Check below). The affinoid model is
AdicSpaces layer 5.1 and Tau Ceti's `Huber.Pair.quotient` with
`TauCeti.Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom` (the
unbundled form on `ValuationSpectrum` is `isClosedEmbedding_spaComap_quotientMk`); AdicSpaces
layer 5.1 also owns the independence of the closed immersion from the chosen affinoid cover and
its factorisation property, which this target uses and does not restate. Huber takes
`𝓘` quasi-coherent under his standing hypothesis (Huber96 §1.1, (1.1.1), p. 37), where every ideal
of an affinoid ring is closed and every quotient is sheafy and every adic space is locally of
noetherian type, hence stable (Wedhorn Cor. 8.35), so that all fibre products used in these
definitions exist; the admissible ideal sheaf (closed `J_U`, sheafy `A/J_U`, kernel condition on
rational subsets) is the replacement that makes the construction meaningful for arbitrary adic
spaces, and agrees with Huber's notion in his setting. For an affinoid algebra `A` over `k` and any
ideal `J`, `A/J = (A/J, (A/J)°)` (Huber96 §1.4, (1.4.1), p. 60, with Bosch–Güntzer–Remmert 6.3.4
Prop. 1; the plus-ring identity is in layer R1 via Huber94 §4, Lem. 4.4). In `AdicSpace`, define
`closedSubspace 𝓘` as the closed adic subspace `V(𝓘)` of an admissible ideal sheaf and
`IsLocallyClosedImmersion` as the structure "closed embedding into an open subspace followed by the
inclusion"; construct `closedSubspace.ι` (the inclusion morphism `V(𝓘) → X`), `closedSubspace.range_ι`
(the underlying set of `V(𝓘)` is the closed set `{x : 𝓘_x ≠ O_{X,x}}`), `closedSubspace.affinoidIso`
(`V(𝓘) ∩ U ≅ Spa(A/𝓘(U))` over `U` for any admissible affinoid chart `U`,
expressed as an isomorphism from the categorical pullback commuting with its projection; the factorisation of a morphism
`g : T → X` with `g♯(𝓘)·O_T = 0` uniquely through `ι` is the factorisation property of AdicSpaces
layer 5.1, transported along `IsClosedImmersion.isoClosedSubspace` below), `closedSubspace.isClosedImmersion_ι` (`ι` is a closed immersion in the sense of AdicSpaces
layer 5.1), `IsClosedImmersion.isoClosedSubspace` (every closed immersion `h : T → X` of AdicSpaces
is `X`-isomorphic to `ι` for `𝓘 = ker(O_X → h_*O_T)`, which is admissible), `closedSubspace.pullback`
(for `g : Y → X` with `Y` covered by stably sheafy affinoids, `V(𝓘) ×_X Y = V(𝓘·O_Y)`,
affinoid-locally `(A/J) ⊗̂_A B = B/(closure of J·B)`, by *completed-tensor-restricted-power-series*
with `n = 0`), `IsLocallyClosedImmersion.of_isOpenImmersion` and
`IsLocallyClosedImmersion.of_isClosedImmersion` (open embeddings and closed embeddings
are locally closed embeddings), `IsLocallyClosedImmersion.comp` (composites of locally closed
embeddings are locally closed embeddings; closedness is local on the target),
`closedSubspace.isLocallyNoetherian` (closed subspaces of locally noetherian spaces are locally
noetherian) and `closedSubspace.locallyOfFiniteType_ι` (`ι` is locally of finite type, a quotient
mapping from `A = A⟨⟩`) (Huber96 §1.4, (1.4.1), p. 60, the affinoid model (1), the construction (2)
with the same `Z`, `O_Z`, `v_z` and topology, the definition (3) of closed, open and locally closed
embeddings, and the rigid comparison consumed by layer R1; Zavyalov24 §5, Def. 5.1, p. 8, the
ideal-sheaf description in the locally noetherian analytic case; Conrad-AWS §3.1, Ex. 3.1.5, p. 24,
the rigid-analytic bijection between closed immersions and ideal sheaves). *Needs:* Tau Ceti
`Huber.Pair.quotient`, `Huber.Pair.quotientHom`, `Huber.Pair.Hom.quotientLift`,
`Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom`,
`Huber.Pair.Hom.range_spaComap_quotientHom`; *noetherian-type-ideals-closed*;
*noetherian-type-stably-sheafy*; *completed-tensor-restricted-power-series*.
Lean: `IsClosedImmersion` (the AdicSpaces §5.1 contract), `IsLocallyClosedImmersion`; the Check that
a map identifying two points is not locally closed and the ring-level part of the square-zero
Check are `example`s; the ideal-sheaf construction is a README target.

The theorem `closedSubspace.kernel_ι` identifies the kernel on every open with `𝓘`;
`closedSubspace.stalk_quotient` identifies the stalk of `V(𝓘)` with `O_{X,x}/𝓘_x`, with the
quotient map equal to the structural stalk map. These fix the sheaf and its nilpotents, beyond
the point-set assertion (Huber96 §1.4, (1.4.1), p. 60). In `closedSubspace.pullback`,
`𝓘·O_Y` means the least admissible ideal containing the sectionwise image of `𝓘`.
It includes topological closure on affinoids; it need not equal the algebraically generated
ideal before completion. For a map of complete affinoids `A → B` with `B` stably sheafy and `𝓘` the kernel
sheaf of a continuous open quotient `A → C` of complete sheafy pairs with the quotient plus ring,
`closedSubspace.pullback_affinoid` identifies the global ring of that pullback with
`B/closure(J·B)`, where `J = 𝓘(Spa A)`; the square and the structural coefficient map are
part of the statement (*completed-tensor-restricted-power-series*, the zero-variable case;
Huber96 §1.2, proof of Prop. 1.2.2, pp. 47–49).

**Checks.**

- The zero section ideals are admissible
  and their inclusion is an isomorphism; this is the geometric zero-ideal Check.
- The unit section
  ideals are admissible and their closed subspace is empty.
- A continuous open surjection of
  complete sheafy affinoid pairs with the quotient plus ring gives an admissible kernel sheaf;
  its closed subspace is the source affinoid, over the target (`closedSubspace.affinoidIso`).
- The identity factors with both immersions identities.
- Every inclusion of an admissible closed subspace is locally closed.
- A map identifying two distinct points cannot be locally closed.
- *Computation.* For `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and `𝓘 = T·O_X`,
  `V(𝓘) ≅ Spa(ℚ_p, ℤ_p)`, the inclusion of the origin, with `O(V(𝓘)) = ℚ_p⟨T⟩/(T) = ℚ_p`.
- *Non-example.* For `X` as above, `V(T²·O_X)` and `V(T·O_X)`
  have the same underlying closed set `{origin}` but different rings (`ℚ_p[T]/(T²)` has a nonzero
  nilpotent); a definition by closed subsets identifies them and fails.
- *Non-example.* For the Tate ring `A = C(ℤ_p, ℚ_p)`
  (supremum norm) and the non-closed ideal `J` of functions vanishing near `0`, `Spa(A/J)` and
  `Spa(A/J̄)` have the same underlying space but `A/J` is not Hausdorff; `J·O` is not admissible,
  and `J̄ = {f : f(0) = 0}` defines the corresponding closed subspace.
- *Non-example (coherence needs analytic charts).* Let `A = 𝔽_p ⊕ M` be the discrete
  square-zero extension with `M = ⊕_ℕ 𝔽_p` (Mathlib `TrivSqZeroExt`), with `A⁺ = A`. It is in
  Huber's standing class (discrete) and of noetherian type (ring of definition `𝔽_p`, ideal `0`),
  so `X = Spa(A, A)` is locally noetherian and locally Huber-standard. It is one point: every
  valuation kills the nilpotent ideal `M` and is trivial on the finite field `𝔽_p`. A rational
  subset with denominator outside `M` is `X` with ring `A` (the denominator is a unit), and one
  with denominator in `M` is empty, so `A` is sheafy. The projection `A → 𝔽_p` is a continuous
  open surjection with kernel `M` and quotient pair `(𝔽_p, 𝔽_p)`, so its kernel sheaf `𝓘` is
  admissible and `Spa(𝔽_p, 𝔽_p) → X` is a closed embedding. The only stalk of `𝓘` is `M`, an
  infinite-dimensional `𝔽_p`-vector space on which `A` acts through `𝔽_p`, so it is not a finitely
  generated `A`-module; `𝓘` is not of finite type and so not coherent (Stacks Tag 01BV (Modules,
  Def. 17.12.1)). For the finite square-zero extension `𝔽_p[ε]/(ε²)` the kernel `𝔽_p·ε` is
  finitely generated over a noetherian ring and its kernel sheaf is coherent, as is `T·O_X` on the
  disc of the *Computation* above.
- *Compatibility.* For a complete Hausdorff sheafy Huber pair
  `(A, A⁺)` and a closed ideal `J` with `A/J` sheafy, `closedSubspace.affinoidIso` identifies
  `V(𝓘_J)` over `Spa(A, A⁺)` with the spectrum of Tau Ceti's quotient pair. The inclusion on
  points is `(Pair.quotientHom _ J).spaComap`; its image is `{v : J ⊆ supp v}` by
  `TauCeti.Huber.Pair.Hom.range_spaComap_quotientHom`
  (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`).
- *Degenerate.* `V(0) = X` and `V(O_X) = ∅`: for `𝓘 = 0`, `J_U = 0`
  is closed, `A/0 = A` is sheafy and `Z = {x : 0 ≠ O_{X,x}} = X` since every stalk of a nonempty
  adic space is a nonzero local ring; for `𝓘 = O_X`, `J_U = A` is closed, `A/A = 0` is sheafy
  (`Spa 0 = ∅`) and `Z = {x : O_{X,x} ≠ O_{X,x}} = ∅`. Affinoid form: `Spa(A/0) → Spa A` is
  surjective and `Spa(A/A) = Spa 0 = ∅`.
- *Non-example.* In `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` the origin
  `V(T·O_X) → X` is a closed embedding and not an open embedding: `{origin}` is not open, every
  rational neighbourhood `{|f_i| ≤ |g| ≠ 0}` of the origin containing the classical points
  `T = c` with `|c|` small. Conversely the rational subset `U = {|T| ≤ |p|}` is an open embedding
  and not a closed embedding: `U` is not closed, its closure containing the rank-2 point `x` with
  `|T|(x) = |p|·γ`, `γ > 1` infinitesimal (the specialisation of the Gauss point `ξ` of radius
  `|p|`, `ξ ∈ U`, with `|T − a|(x) = |p|γ` for all `|a| ≤ |p|`); `x ∉ U` since `|T|(x) > |p|`,
  and `x ∈ closure{ξ} ⊆ closure U`. So "closed embedding" and "open embedding" are not
  interchangeable, and neither is "closed subset of `|X|`".

**The diagonal of a morphism locally of weakly finite type is a locally closed embedding.**
(*diagonal-locally-closed*) Let `f : X → Y` be a morphism of adic spaces that is locally of weakly
finite type (hence adic), with `X` covered by open affinoids whose rings are complete and stably
sheafy (for instance `X` locally noetherian). Then `X ×_Y X` exists (*fibre-products-existence*,
case (b)). Prove that the diagonal `Δ_f : X → X ×_Y X` is a locally closed embedding
(*closed-adic-subspaces-and-embeddings*): with `W` the union of the open subspaces
`U ×_V U ⊆ X ×_Y X` over all open affinoids `U ⊆ X`, `V ⊆ Y` with `f(U) ⊆ V` and `O_Y(V) → O_X(U)`
topologically of finite type, `W` is open, contains `Δ_f(X)`, and `Δ_f : X → W` is a closed
embedding; over `U ×_V U = Spa(O_X(U) ⊗̂_{O_Y(V)} O_X(U))` it is `Spa` of the multiplication map
`m : O_X(U) ⊗̂_{O_Y(V)} O_X(U) → O_X(U)`, a quotient mapping with closed kernel (Zavyalov-Q
Appendix B.7, Lem. B.7.3 and its proof, pp. 57–58 — the lemma itself in the locally strongly
noetherian analytic case with the same proof: `∪ V_ij ×_{U_i} V_ij` is an open subset of
`X ×_Y X` containing `Δ(X)`, the question reduces to affinoids since closed immersions are local on
the target, and `Δ` is `Spa` of the multiplication `m : B ⊗̂_A B → B`, a closed immersion by his
Lem. B.6.6 with `I = ker m`; here extended to `f` locally of weakly finite type with `X` stable;
Zavyalov24 §5, proof of Cor. 5.11, p. 12, the closed case for separated morphisms of locally
noetherian analytic spaces; Conrad-AWS §3.1, Def. 3.1.6, p. 24, separatedness formulated with the
diagonal as an immersion-type map; Conrad-AWS §5.2, p. 49, the caution that the immersion property
is not formal and needs this proof in the adic setting). Separatedness (*separated-morphism*) is
the condition that `Δ_f` be a closed embedding into all of `X ×_Y X`. For the closed disc
`D = Spa(ℚ_p⟨T⟩)` over `ℚ_p`, `W = D ×_{ℚ_p} D` and `Δ` is the closed embedding cut out by
`T ⊗ 1 − 1 ⊗ T` in `ℚ_p⟨T, S⟩`; for the line `X = D₁ ∪_{D°} D₂` obtained by gluing two closed
discs `D_i = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` along the identity of the open unit subdisc
`D° = ⋃_m {|T|^m ≤ |p|}` (a non-separated space), `Δ` is a closed embedding into the open
`W ⊊ X ×_{ℚ_p} X` but not a closed embedding into `X ×_{ℚ_p} X`. Computed witness: let `x ∈ D` be
the rank-2 point with `|T|(x) = γ`, `γ < 1` infinitesimal (`|Σ a_n T^n|(x) = |a_{n₀}| γ^{n₀}`,
`n₀` the least index attaining `max |a_n|`), a specialisation of the Gauss point; `x ∉ D°` since
`γ^m > |p|` for all `m`, but `x ∈ closure(D°)`: a rational neighbourhood `{|f_i| ≤ |g| ≠ 0}` of
`x` contains the Gauss points of radius `r ∈ p^ℚ`, `r < 1`, for `r` close to `1`, which lie in
`D°`. In the chart `D₁ ×_{ℚ_p} D₂ ≅ D × D` of `X ×_{ℚ_p} X`, `Δ(X) ∩ (D₁ × D₂) = Δ_D(D°)`, whose
closure contains `Δ_D(x) = (x₁, x₂)` (`Δ_D` is continuous), with `x₁ ∈ D₁ ∖ D°`, `x₂ ∈ D₂ ∖ D°`
distinct points of `X`; so `(x₁, x₂) ∈ closure(Δ(X)) ∖ Δ(X)`, and `(x₁, x₂) ∉ W` (an affinoid
open containing `x₁` and `x₂` would have a closed diagonal and force `x₁ = x₂`). By contrast the
Gauss point `η` of `D` is not in the closure of `D°`: `{1 ≤ |T|} ∩ D = {|T| = 1}` is a rational
neighbourhood of `η` disjoint from `D°`; the witness has to be the rank-2 point. The scheme analogue is Mathlib
`AlgebraicGeometry.isClosedImmersion_diagonal_restrict_diagonalCoverDiagonalRange` (the diagonal is
a closed immersion into the open `diagonalCoverDiagonalRange`). *Needs:* *fibre-products-existence*;
*affinoid-fibre-product*; *completed-tensor-product-universal-property*;
*completed-tensor-restricted-power-series*; *finite-type-morphism-classes*;
*closed-adic-subspaces-and-embeddings*; *completed-tensor-product*; Tau Ceti `Huber.Pair.quotient`,
`Huber.Pair.Hom.quotientLift`, `Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom`.
Lean: `diagonal_locallyClosed`.

### R0.9 classical K-affinoid algebras

Throughout this subsection `K` is a field complete for a nontrivial nonarchimedean absolute value
`|·|` of rank one, `K°` its valuation ring, `ϖ ∈ K` a pseudo-uniformiser, and a *`K`-affinoid
algebra* is a commutative `K`-algebra `A` with a complete Hausdorff first-countable ring topology for
which `K → A` is strictly topologically of finite type (Tau Ceti
`IsStrictlyTopologicallyFiniteType (algebraMap K A)`: a continuous open surjection of `K`-algebras
`K⟨X₁,…,X_n⟩ = restrictedMvPowerSeriesCompletion n K → A`; Wedhorn §5.7, Def. 5.57). `Max A` is the
set of maximal ideals of `A` (Mathlib `MaximalSpectrum A`).

The theory of these algebras is RigidAnalyticGeometry's. Its carrier is the `Prop` `IsAffinoidAlgebra K A` on a bare
`K`-algebra, with the topology derived from a presentation, and its normed statements hold for every
complete `K`-algebra norm. *Carrier bridge.* A `K`-affinoid algebra in the sense above satisfies
`IsAffinoidAlgebra K A` through a strict presentation, the Tau Ceti Tate algebra
`restrictedMvPowerSeriesCompletion n K` being identified with the supplier's in AdicSpaces §0.5; its
topology is the supplier's affinoid topology (RigidAnalyticGeometry §1.1); and where a supplied
statement asks for a norm, this roadmap takes the residue norm of a strict presentation, a complete
`K`-algebra norm defining that topology (RigidAnalyticGeometry §1.1).
`Huber.TateAlgebra.ofMvPolynomial` is the canonical polynomial homomorphism
`A[X₁,…,X_n] → A⟨X₁,…,X_n⟩` into Tau Ceti's separated completion of restricted series.
`Huber.TateAlgebra.ofMvPolynomial_injective` makes it an inclusion when `A` is Hausdorff;
the disc Checks of R0.16–R0.17 use it. These maps use arbitrary nonarchimedean coefficient rings,
without completeness or a norm. RestrictedPowerSeries §6.2 supplies the normed, complete-coefficient
comparison; the general polynomial map here composes Tau Ceti’s `weightedPolynomialHom`
with its completion map.

**Noether normalisation for K-affinoid algebras.** (*affinoid-noether-normalisation*) A nonzero
`K`-affinoid algebra is a finite extension of a Tate algebra `K⟨T₁,…,T_d⟩` embedded into it, and
every finite injective homomorphism of `K`-affinoid algebras is a homeomorphism onto a closed
subspace. Supplied by RigidAnalyticGeometry §1.2 and §1.1 (`isClosedEmbedding_of_finite_injective`). The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap
applies it through the carrier bridge above.

**Residue fields of K-affinoid algebras at maximal ideals are finite over K.**
(*affinoid-residue-fields-finite*) For a maximal ideal `m` of a `K`-affinoid algebra `A` the field
`A/m` is a finite extension of `K`, so every homomorphism `φ : A → B` of `K`-affinoid algebras
induces `Max(φ) : Max B → Max A`. Supplied by RigidAnalyticGeometry §1.2. The supplier's carrier is
`IsAffinoidAlgebra K A`; this roadmap applies it through the carrier bridge above.

**K-affinoid algebras are Jacobson rings.** (*affinoid-jacobson*) A `K`-affinoid algebra is a
Jacobson ring, so its nilradical is the intersection of its maximal ideals. Supplied by
RigidAnalyticGeometry §1.1. The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap applies it through the
carrier bridge above.

**Maximal ideals of Tate algebras are generated by polynomials.**
(*tate-algebra-maximal-ideals-polynomial*) Every maximal ideal `m` of `K⟨X₁,…,X_n⟩` is generated by
`n` polynomials, the minimal polynomials of the coordinates of a point after a triangular change of
generators, so that `m = (m ∩ K[X])·K⟨X⟩`. Consume polynomial generation and finite
residue fields from RestrictedPowerSeries §§5.2, 6.2, also used by RigidAnalyticGeometry §0.1.
The adapter to `restrictedMvPowerSeriesCompletion n K` uses the R0.9 carrier bridge.
The triangular choice follows in the polynomial ring by taking the minimal polynomial of
each successive coordinate over the field generated by the preceding ones; its quotient is
the given finite residue field (BGR §7.1.1). No separability hypothesis is required.
Lean: supplier README contract with the triangular-generator adapter specified here.

**Checks.**

- For `n=0`, the zero maximal ideal of `K` has the empty generating tuple.
- At a `K`-rational tuple `(a_i)` with `|a_i|≤1`, the generators are `X_i−a_i`.
- For `K=𝔽_p((t))`, the maximal ideal `(T^p−t)` of `K⟨T⟩` has purely inseparable
  residue field of degree `p`; a linear generator is not required.

**The supremum seminorm of a K-affinoid algebra.** (*affinoid-supremum-seminorm*) For `f` in a
`K`-affinoid algebra `A`, `|f|_sup = sup_{x ∈ Max A} |f(x)|`, with `|f(x)|` the spectral norm of the
residue class of `f` in `A/x` and `|f|_sup = 0` on the zero algebra, is a `K`-algebra seminorm bounded by every complete `K`-algebra norm and contracted by
homomorphisms. Its power formula is `|fⁿ|_sup = |f|_supⁿ` for `n ≥ 1`; exponent zero also
holds when `A ≠ 0`.
Supplied by RigidAnalyticGeometry §§2.1–2.2. The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap
applies it through the carrier bridge above.

**Maximum modulus principle for K-affinoid algebras.** (*affinoid-maximum-modulus*) On a nonzero
`K`-affinoid algebra the supremum seminorm of every element is attained at a point of `Max A`.
Supplied by RigidAnalyticGeometry §2.2. The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap
applies it through the carrier bridge above.

**Power-bounded elements of K-affinoid algebras are those of supremum seminorm at most one.**
(*affinoid-power-bounded-iff-sup*) In a `K`-affinoid algebra `f` is power-bounded iff `|f|_sup ≤ 1`
and topologically nilpotent iff `|f|_sup < 1`, so `A° = {|f|_sup ≤ 1}` and `A°° = {|f|_sup < 1}`.
Supplied by RigidAnalyticGeometry §2.2. The supplier measures power-boundedness by boundedness of the
powers for a complete `K`-algebra norm on its carrier `IsAffinoidAlgebra K A`; for the residue norm
of the carrier bridge above this is membership in Tau Ceti's `powerBoundedSubring`, which is how
this roadmap reads it.

**On a reduced K-affinoid algebra the supremum norm defines the topology.**
(*reduced-affinoid-supremum-norm*) On a reduced `K`-affinoid algebra `|·|_sup` is a norm equivalent
to every complete `K`-algebra norm, in particular to every residue norm, so `A°` is bounded and `A`
is uniform. Supplied by RigidAnalyticGeometry §§2.1–2.2. The supplier's carrier is
`IsAffinoidAlgebra K A`; this roadmap applies it through the carrier bridge above.

**Homomorphisms of K-affinoid algebras are continuous.** (*affinoid-homomorphism-continuous*) Every
`K`-algebra homomorphism between `K`-affinoid algebras is continuous, so the topology of a
`K`-affinoid algebra is determined by its `K`-algebra structure. Supplied by RigidAnalyticGeometry
§1.1. The supplier states it for complete `K`-algebra norms on its carrier `IsAffinoidAlgebra K A`; with the
residue norms of the carrier bridge above it is continuity for the topologies of this roadmap.

**Power-bounded elements are integral over the image of the unit ball of a Tate algebra.**
(*affinoid-power-bounded-integral*) For a surjection `π : K⟨X₁,…,X_n⟩ → A` onto a `K`-affinoid
algebra, `A°` is the integral closure in `A` of `π(K°⟨X⟩)`, with no reducedness hypothesis. Supplied
by RigidAnalyticGeometry §2.3. The supplier states it as "`|a|_sup ≤ 1` iff `a` is integral over
`π(K°⟨X⟩)`" on its carrier `IsAffinoidAlgebra K A`; this roadmap reads `|a|_sup ≤ 1` as membership
in `powerBoundedSubring` by *affinoid-power-bounded-iff-sup* and applies it through the carrier
bridge above.

The bridge name `Huber.Affinoid.powerBoundedSubring_eq_integralClosure` refers to
RigidAnalyticGeometry §2.3’s integral-closure theorem: for every strict
surjection `K⟨T₁,…,Tₙ⟩ → A` onto a `K`-affinoid algebra, `A°` is the integral closure
in `A` of the image of the Gauss unit ball, including nonreduced `A`.

**Finite homomorphisms of K-affinoid algebras induce finite maps of reductions.**
(*affinoid-reduction-finite*) A finite homomorphism `φ : A → B` of `K`-affinoid algebras maps `A°`
into `B°` and `A°°` into `B°°`, and the induced map of reductions `A°/A°° → B°/B°°` is finite; in
particular the reduction of `A` is a finitely generated algebra over the residue field of `K`.
Supplied by RigidAnalyticGeometry §2.3. The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap applies it through the
carrier bridge above.

**A ring of definition with reduced reduction is the ring of power-bounded elements.**
(*reduced-reduction-ring-of-definition*) For an open bounded subring `A₀` of a `K`-affinoid algebra
`A` and a topologically nilpotent unit `ϖ ∈ A₀` of `A` with `A₀/ϖA₀` reduced, `A₀ = A°`. Supplied
by RigidAnalyticGeometry §2.3, “Reduced quotient of a ring of definition”. The supplier states it on its carrier `IsAffinoidAlgebra K A`
with `{|f|_sup ≤ 1}` in place of `A°`, and not for other Tate rings; this roadmap applies it through
the carrier bridge above, reads `{|f|_sup ≤ 1}` as `powerBoundedSubring` by
*affinoid-power-bounded-iff-sup*, and makes no statement for Tate rings that are not `K`-affinoid.

*Checks for the polynomial inclusion:*
- *Degenerate.* For `n = 0`, every polynomial maps to
  the image of its constant coefficient in `K⟨⟩`.
- *Computation.* The images of `X₀` and `X₁`
  in `K⟨X₀,X₁⟩` differ. These distinguish the polynomial inclusion and the zero-variable
  convention.
- Over `ℚ_p`, the image of `X₀² − X₁³` is nonzero and is the difference of the squares
  and cubes of the corresponding Tate coordinates.
- For `n = 0` and `A = ℤ` with the indiscrete topology, the completed map identifies
  `0` and `1`; Hausdorffness is necessary for injectivity.

### R0.10 separated, universally closed, proper and partially proper morphisms

The morphisms of this subsection are morphisms of adic spaces in the category of the Foundations of
adic spaces roadmap (AdicSpaces), layer 5. Huber states Definitions 1.3.1–1.3.3 under his standing
hypothesis (1.1.1) (Huber96 §1.1, (1.1.1), p. 37), which makes every adic space locally of noetherian
type, hence stable (Wedhorn Cor. 8.35), so that all fibre products used in these definitions exist;
here the existence of the fibre products is carried as an explicit hypothesis: the relevant space is
covered by open affinoids `Spa(A, A⁺)` with `A` complete and stably sheafy (AdicSpaces'
`Huber.IsStablySheafyRing`), which holds for locally noetherian spaces
(*locally-noetherian-adic-space* with *noetherian-type-stably-sheafy*) and, by Wedhorn §8.6, Rem.
8.55(2), p. 89, for every space locally of weakly finite type over such a space. In the checks of
this subsection and the next, `K` is a complete nonarchimedean field with nontrivial rank-one
valuation, `K°` its valuation ring, `K̃ = K°/K°°` its residue field, `ϖ` a pseudo-uniformiser,
`D = Spa(K⟨T⟩, K°⟨T⟩)` the closed unit disc and `B = ⋃_n {|T|^n ≤ |ϖ|} ⊆ D` the open unit disc, as
in AdicSpaces layer 5.4; `P¹` is glued
from `D₀ = Spa(K⟨T⟩, K°⟨T⟩)` and `D_∞ = Spa(K⟨S⟩, K°⟨S⟩)` along `{|T| = 1} ≅ {|S| = 1}`, `S = T⁻¹`
(AdicSpaces layer 5.3).

**Separated morphism of adic spaces.** (*separated-morphism*) Let `f : X → Y` be a morphism of adic
spaces that is locally of weakly finite type (*finite-type-morphism-classes*), with `X` covered by
open affinoids `Spa(A, A⁺)` with `A` complete and stably sheafy (automatic if `Y` is so covered,
Wedhorn §8.6, Rem. 8.55(2), p. 89, and for `X` locally noetherian). Such an `f` is adic, so the fibre
product `X ×_Y X` exists in the category of adic spaces (*fibre-products-existence*, case (b) with
`g = f`, the second factor `X` being covered by stably sheafy affinoids) and the diagonal
`Δ_f : X → X ×_Y X` is the morphism with both projections equal to the identity. The morphism `f` is
*separated* if the image `Δ_f(|X|)` is a closed subset of the underlying space `|X ×_Y X|` of the
adic fibre product (Huber96 §1.3, Def. 1.3.1, p. 51; Zavyalov-Q Appendix B.7, Def. B.7.1 and Rem.
B.7.2, p. 57, for the same definition in the locally strongly noetherian analytic case, the finiteness
hypothesis being what makes `X ×_Y X` exist). Conventions: (1) `X ×_Y X` is the fibre product of adic
spaces, never the topological fibre product `|X| ×_{|Y|} |X|`; the comparison map
`|X ×_Y X| → |X| ×_{|Y|} |X|` is surjective and in general not injective (*fibre-product-points*).
(2) Separatedness is only defined for morphisms locally of weakly finite type whose source is
covered by stably sheafy affinoids. `IsSeparated f` includes both conditions as conjuncts,
so it is false outside that class. Huber states Definition 1.3.1 without the second condition (his standing hypothesis (1.1.1),
as in the preamble of this subsection); without it `X ×_Y X` need not exist. (3) By
*diagonal-locally-closed* the diagonal is a locally closed
embedding, so a separated `f` has `Δ_f` a closed embedding (closed adic subspace in the sense of
*closed-adic-subspaces-and-embeddings*) under the hypotheses of this definition, by *separated-diagonal-closed-embedding* (Zavyalov-Q Appendix B.7, Cor. B.7.4, p. 58, treats locally strongly noetherian analytic spaces).
Separatedness is the second of the three conditions of properness (Huber96 §1.3, Def. 1.3.2(ii),
p. 51). In `AdicSpace`, define `IsSeparated f` as the conjunction of
`LocallyOfWeaklyFiniteType f`, `HasStablySheafyCharts X`, and existence of the self-product
with closed diagonal range in `|X ×_Y X|`; prove the closed-diagonal statement (if `IsSeparated f` then `Set.range |Δ_f|` is
closed in `|X ×_Y X|`), `IsSeparated.hasPullback` (extracting existence of the self-product
from separatedness, Huber96 Def. 1.3.1, p. 51), `IsSeparated.iff_closedImmersion_diagonal` (the statement of
*separated-diagonal-closed-embedding*), the affinoid case (a morphism locally of weakly finite type
between affinoid adic spaces `Spa(B, B⁺) → Spa(A, A⁺)` with `B` stably sheafy is separated: the
diagonal is the closed subspace cut out by the kernel of the multiplication `B ⊗̂_A B → B`),
`IsSeparated.comp` (if `f : X → Y` and `g : Y → Z` are separated and locally of weakly finite type
then `g ∘ f` is separated), cancellation (if `g ∘ f` is separated and `f`, `g` are locally
of weakly finite type then `f` is separated), `IsSeparated.baseChange` (separatedness is stable
under base change along adic morphisms from a space with `HasStablySheafyCharts`,
*proper-base-change*), `IsSeparated.of_isOpenImmersion`
(an open embedding `U → X` with `U` covered by complete stably sheafy affinoids is separated: `U ×_X U = U` and its diagonal is an isomorphism),
`IsSeparated.of_isClosedImmersion` (a closed embedding `Z → X` in the sense of
*closed-adic-subspaces-and-embeddings*, with `X` covered by complete stably sheafy affinoids,
is separated: it is a monomorphism, so `Z ×_X Z = Z` and
the diagonal is again an isomorphism; this is the separatedness half of *closed-embedding-proper*),
the intersection statement (given any two `Chart X`, it produces a third whose image is
the intersection; if
`Y = Spa(A, A⁺)` is a strongly noetherian Tate affinoid and `f : X → Y` is separated and locally of
topologically finite type, then the intersection of two open affinoids of `X` is affinoid,
Zavyalov-Q B.7.5) and `IsSeparated.iff_valuativeCriterion` (the statement of
*valuative-criterion-separated*). *Needs:* *finite-type-morphism-classes*; *adic-morphism*;
*fibre-products-existence*; *fibre-product-points*; *diagonal-locally-closed*;
*closed-adic-subspaces-and-embeddings*; Mathlib `AlgebraicGeometry.IsSeparated`.
Lean: `AdicSpace.IsSeparated`; the Check that separatedness includes local weak finite type and
the closed-disc Check are `example`s.

**Checks.**

- The doubled-origin disc described below is locally
  of weakly finite type but its structure morphism is not separated: finiteness alone does not suffice.
- The same doubled-origin disc has stably sheafy
  charts, yet is not separated: the chart condition alone does not suffice.
- For the closed disc, the geometric diagonal is closed
  and the structure morphism is separated, whereas the ordinary topological diagonal is not
  closed. The source also has stably sheafy charts (Huber96 Def. 1.3.1, p. 51).
- *Characterisation.* The structure morphism `D → Spa(K, K°)` is
  separated: `D ×_K D` is the closed bidisc `Spa(K⟨T₁,T₂⟩, K°⟨T₁,T₂⟩)` and `Δ(D) = V(T₁ − T₂)` is
  closed. At the same time the diagonal of `|D|` is not closed in the product of topological spaces
  `|D| × |D|`, because `|D|` is not Hausdorff (the Gauss point has proper specialisations); a
  definition testing closedness in `|X| ×_{|Y|} |X|` would wrongly declare `D` non-separated.
- *Non-example.* Let `0 ∈ D` be the point `V(T)` (a closed point)
  and let `X` be obtained by gluing two copies `D₁`, `D₂` of `D` along the open subspace `D ∖ {0}`
  (AdicSpaces layer 5.3). Then `X → Spa(K, K°)` is locally of finite type but not separated: the point
  `(0₁, 0₂)` of the open subspace `D₁ ×_K D₂` of `X ×_K X` lies in the closure of `Δ(D ∖ {0})` but not
  in `Δ(X)`. This `X` is not quasi-separated (`D₁ ∩ D₂ = D ∖ {0} = ⋃_n {|ϖ|ⁿ ≤ |T|}` is not
  quasi-compact), so it lies outside the valuative criterion *valuative-criterion-separated*, whose
  uniqueness condition it satisfies; the quasi-separated non-separated witness is the disc doubled
  along `{|ϖ| ≤ |T|}`, given there.
- *Degenerate.* For `X` covered by complete stably sheafy affinoids,
  the identity of `X` and every open embedding `U → X` are separated (their diagonals are isomorphisms).
- *Compatibility.* For `f` locally of topologically
  finite type between locally strongly noetherian analytic adic spaces, `AdicSpace.IsSeparated f`
  holds if and only if `Δ_f` is a closed embedding in the sense of
  *closed-adic-subspaces-and-embeddings*; this is the shape of Mathlib's
  `AlgebraicGeometry.IsSeparated` (diagonal a closed immersion) for schemes.

The disc Check identifies its geometric self-product with the bidisc and its
diagonal with the zero locus of `T₁ − T₂`, while testing that the ordinary topological
diagonal is not closed. The doubled-origin Check uses two open immersions covering
`X`, identifies their points exactly on `T ≠ 0`, and fixes both structure maps over
`K`; it asserts failure of separatedness and of quasi-compactness of the diagonal.
These are the diagonal computations of Huber96 §1.3, pp. 51–53.

**Universally closed morphism of adic spaces.** (*universally-closed-morphism*) Let `f : X → Y` be a
morphism of adic spaces that is locally of weakly finite type. The morphism `f` is *universally
closed* if, for every adic morphism `g : Y' → Y` from an adic space `Y'` covered by open affinoids
with complete stably sheafy rings and every pullback square of `f` along `g` in the category of
adic spaces, with base change `f' : X' → Y'`, the continuous map `|f'| : |X'| → |Y'|` is a closed
map (Huber96 §1.3, Def. 1.3.2(i), p. 51, under (1.1.1); Wedhorn §8.6, Def. 8.54, p. 89, the
stable test spaces; Berkeley Lecture 17, Def. 17.4.5, p. 156, for the same notion, closed after
every pullback, in the v-sheaf setting, the adic definition restricting the pullbacks to adic
morphisms from stable spaces). Such pullbacks exist whenever `Y'` is covered by open affinoids
with complete stably sheafy rings (*fibre-products-existence*, case (b)), in particular always
under Huber's standing hypothesis (1.1.1); the pullback along `g = id_Y` always exists
(`X' = X`), so a universally closed `f` whose target `Y` is covered by such affinoids has `|f|`
closed. The condition is independent of
the choice of pullback (pullbacks are unique up to unique isomorphism), so quantifying over
pullback squares (the shape of Mathlib's `MorphismProperty.universally`) is the same as quantifying
over the base changes `X ×_Y Y'` that exist. Convention: base change is only taken along adic
morphisms from spaces covered by complete stably sheafy affinoids, which is the class along which
Huber's fibre product (b) exists and is known to be the categorical one; over an analytic `Y` every
morphism is adic (*adic-iff-analytic-locus* (iii)), so there the condition is "closed after every
base change from a stable space".
`UniversallyClosed.hasPullback` supplies `HasPullback f g` for a universally closed `f`
and an adic `g : Z → Y` with `HasStablySheafyCharts Z`, by Huber96 Prop. 1.2.2(b),
pp. 47–49. Thus every adic base change from a stably sheafy source has a pullback on
which the closedness condition applies.
Universal closedness is the third condition of properness (Huber96 §1.3, Def. 1.3.2(ii), p. 51). In
`AdicSpace`, define `UniversallyClosed f` as the class: `f` locally of weakly finite type and `|f'|`
closed for every base change `f'` of `f` along an adic morphism `g : Y' → Y` with
`HasStablySheafyCharts Y'`; prove `UniversallyClosed.isClosedMap` (`UniversallyClosed f →
IsClosedMap |f|` for `Y` with stably sheafy charts, base change along the identity),
`UniversallyClosed.baseChange` (`UniversallyClosed f → UniversallyClosed f'` for the base change
`f'` along any adic `g : Y' → Y` with `HasStablySheafyCharts Y'`, since fibre products compose),
`UniversallyClosed.comp` (composites of universally closed morphisms are universally closed),
`UniversallyClosed.universallySpecializing` (`UniversallyClosed f → UniversallySpecializing f`,
closed maps being specializing), the converse under quasi-compactness (a
quasi-compact universally specializing morphism is universally closed, Huber 1.3.4,
*proper-iff-partially-proper-quasi-compact*) and `UniversallyClosed.of_isClosedImmersion` (closed
embeddings are universally closed: directly, as in *closed-embedding-proper*, or over analytic
targets through *closed-embedding-finite* and *finite-morphisms*). Every finite morphism to an
analytic adic space is universally
closed (*finite-morphisms*); the closed unit disc `D → Spa(K, K°)` is not. *Needs:*
*finite-type-morphism-classes*; *adic-morphism*; *fibre-products-existence*; Mathlib
`AlgebraicGeometry.UniversallyClosed`, `SpecializingMap`, `IsClosedMap.specializingMap`.
Lean: `AdicSpace.UniversallyClosed`; the closed-disc Check is an `example`.

**Checks.**

- The identity of the closed disc is locally
  of weakly finite type and universally closed.
- The closed disc's structure morphism is
  locally of weakly finite type but is not universally closed.
- The closed disc's structure map is closed,
  but is not universally closed; an adic base change exists whose projection is not closed.
  These distinguish closedness from universal closedness on the concrete disc
  (Huber96 Def. 1.3.2, p. 51; Prop. 1.3.8, pp. 53–54).
- *Degenerate.* The identity of any adic space, and every closed
  embedding, is universally closed.
- *Non-example.* The morphism `D → Spa(K, K°)` is
  quasi-compact, separated and of +weakly finite type but not universally closed: it is not
  universally specializing, since for the Gauss point `x ∈ D` and the valuation ring `A ⊊ k(x)⁺` of
  `k(x)` that is the preimage of the valuation ring of the residue field `K̃(T)` at `T = ∞`, the
  pair `(x, A)` has a centre on `Spa(K, K°)` but none on `D` (`T ∈ K°⟨T⟩` would have to lie in `A`).
  A definition requiring only that `|f|` itself be closed would accept `D`, since
  `|D| → |Spa(K, K°)|` (a point) is trivially closed.
- *Compatibility.* If `f` is universally closed then every base change of `|f|` along an adic
  morphism from a space with stably sheafy charts is a specializing map in the sense of
  Mathlib's `SpecializingMap`; this mirrors Mathlib's
  `AlgebraicGeometry.universallyClosed_eq_universallySpecializing` for schemes, whose other half
  (quasi-compact plus universally specializing implies universally closed) is
  *proper-iff-partially-proper-quasi-compact* here.

**Proper morphism of adic spaces.** (*universally-closed-and-proper-morphism*) A morphism `f : X → Y`
of adic spaces is *proper* if it is of +weakly finite type (quasi-compact and locally of +weakly
finite type, *finite-type-morphism-classes*; Huber96 §1.2, Def. 1.2.1(iv), p. 46), separated
(*separated-morphism*) and universally closed (*universally-closed-morphism*) (Huber96 §1.3, Def.
1.3.2(ii), p. 51). Conventions: (1) the finiteness condition is "+weakly finite type", which includes
quasi-compactness and the plus-ring condition `O_X⁺(U) =` integral closure of
`O_Y⁺(V)[E ∪ O_X(U)°°]` for a finite `E` (Huber96 §1.2, Def. 1.2.1(ii), p. 46); it is neither
"locally of finite type" (Mathlib's `IsProper` for schemes) nor "weakly finite type". (2) Properness
of rigid analytic varieties in Kiehl's sense (Conrad-AWS §3.2, Def. 3.2.3, p. 27: relative compactness
of affinoid covers) is a different definition, not a transcription of this one; the comparison is
made in layer R1. (3) Because separatedness (*separated-morphism*) needs `X ×_Y X` to exist, the
predicate is stated for `X` covered by open affinoids with complete stably sheafy rings (automatic
under Huber's standing hypothesis (1.1.1), where every adic space is locally of noetherian type). In
`AdicSpace`, define `IsProper f` as the class: of +weakly finite type, `IsSeparated` and
`UniversallyClosed`; prove `IsProper.toIsSeparated` (`IsProper f → IsSeparated f`),
`IsProper.toUniversallyClosed` (`IsProper f → UniversallyClosed f`), `IsProper.quasiCompact`
(`IsProper f → f` is quasi-compact), `IsProper.comp` (composites of proper morphisms are proper),
`IsProper.baseChange` (proper morphisms are stable under base change along adic morphisms
from spaces covered by complete stably sheafy affinoids,
*proper-base-change*), `IsProper.iff_isPartiallyProper_and_quasiCompact` (the statement of
*proper-iff-partially-proper-quasi-compact*), `IsProper.iff_valuativeCriterion` (the properness
clause of *separated-proper-partially-proper*), `IsFinite.isProper` (finite morphisms to analytic adic spaces with a stably sheafy
affinoid cover are proper, *finite-morphisms*), the finiteness criterion (for `f` locally of finite
type between analytic adic spaces with locally noetherian target, proper and locally quasi-finite
implies finite by the reverse direction of `IsFinite.iff_isProper_and_quasiFinite`,
*quasi-finite-and-finiteness-criteria*) and `IsProper.isClosedMap` (a proper morphism has closed
underlying map). Every finite morphism to an analytic adic space with a stably sheafy affinoid cover is proper
(*finite-morphisms*);
proper equals partially proper and quasi-compact (*proper-iff-partially-proper-quasi-compact*); the
projective line over `K` is proper over `Spa(K, K°)` and the closed unit disc is not. *Needs:*
*finite-type-morphism-classes*; *separated-morphism*; *universally-closed-morphism*; Mathlib
`AlgebraicGeometry.IsProper`.
Lean: `AdicSpace.IsProper`, `IsProper.comp`, `IsProper.baseChange`; the closed- and open-disc Checks
are `example`s.

**Checks.**

- *Non-example.* `D → Spa(K, K°)` is quasi-compact, separated, of
  +weakly finite type, and `|D|` is quasi-compact; nevertheless it is not proper
  (the closed-disc Check of *universally-closed-morphism*). A definition "quasi-compact, separated, with closed
  underlying map" would wrongly make it proper.
- *Non-example.* The open unit disc `B → Spa(K, K°)` is partially proper
  but not quasi-compact, hence not proper.
- *Degenerate.* Over an analytic target covered by complete stably sheafy
  affinoids, the identity and every closed embedding are proper; so is
  `Spa(L, L°) → Spa(K, K°)` for a finite extension `L/K`.
- *Computation.* Over a complete nontrivially normed
  nonarchimedean field `K`, take `D = Spa(K⟨T⟩, K⟨T⟩°)` and `0 < |ϖ| < 1`.
  Present `D` and `Spa(K, K°)` by topological ring isomorphisms preserving their plus
  rings, and require the pair homomorphism to be the scalar inclusion. For an open
  immersion `j : B → D` with image `⋃_{n>0} {|T|ⁿ ≤ |ϖ|}`, compute both structure maps:
  `D` is quasi-compact, not partially proper and not proper; `B` is partially proper,
  not quasi-compact and not proper. Thus neither conjunct in Huber96 §1.3,
  Lem. 1.3.4, p. 51 suffices by itself. The carriers are `Affinoid.spa` and a morphism induced by
  the pair homomorphism (`Affinoid.IsInducedBy`) in the supplied `TauCeti.AdicSpace` category; the
  closed- and open-disc cases are `example`s.

**Universally specializing morphism of adic spaces.** (*universally-specializing-morphism*) Let
`f : X → Y` be a morphism of adic spaces. For `x ∈ X`, `f` is *specializing at `x`* if for every
specialization `y'` of `f(x)` (that is, `y' ∈ closure{f(x)}` in `|Y|`) there is a specialization `x'`
of `x` with `f(x') = y'`. If `f` is locally of weakly finite type, `f` is *universally specializing
at `x₀ ∈ X`* if for every adic morphism `g : Y' → Y` from an adic space `Y'` covered by open
affinoids with complete stably sheafy rings, every pullback square of `f` along `g` in the category
of adic spaces with base change `f' : X' → Y'` and projection `p : X' → X`, and every point
`x₀' ∈ X'` with `p(x₀') = x₀`, the base change `f'` is specializing at `x₀'`; `f` is *universally
specializing* if it is so at every point (Huber96 §1.3, Def. 1.3.3(i), p. 51, under (1.1.1), with
the same lifting argument, with the fibre-product existence made explicit; Wedhorn §8.6, Def. 8.54,
p. 89, the stable test spaces; the definition itself has no analyticity hypothesis, which
enters only with the valuative criterion, Huber96 §1.3, before Def. 1.3.5, p. 52). Such pullbacks
exist whenever `Y'` is covered by complete stably sheafy affinoids (*fibre-products-existence* (b)),
in particular always under Huber's standing hypothesis (1.1.1). Convention: "`f` specializing at every
point" is exactly Mathlib's `SpecializingMap` for the continuous map `|f|`. In the v-sheaf analogue,
partial properness (the specialization-lifting condition) together with quasi-compactness gives
properness, which is the role universal specialization plays here (Berkeley Lecture 17, Cor. 17.4.8,
p. 157). In `AdicSpace`, define `SpecializingAt f x` (`f` is specializing at `x`: every
specialization of `f(x)` is the image of a specialization of `x`), `UniversallySpecializingAt f x₀`
(all base changes along adic morphisms `g : Y' → Y` with `HasStablySheafyCharts Y'` are
specializing at all points over `x₀`) and `UniversallySpecializing f` (local weak finite type
together with `SpecializingMap` for every base change along an adic morphism `g : Y' → Y` with
`HasStablySheafyCharts Y'`, equivalently `UniversallySpecializingAt f x` for every `x`); prove
`specializingAt_forall_iff` (`(∀ x, SpecializingAt f x) ↔ SpecializingMap |f|`),
`UniversallySpecializing.baseChange` (stable under base change along adic morphisms from spaces
with stably sheafy charts),
`UniversallySpecializing.comp` (stable under composition), 
`UniversallySpecializingAt.iff_valuativeCriterion` (for `f` locally of weakly finite type between
analytic adic spaces, the valuative characterisation at `x₀`, *valuative-criterion-specializing*).
`UniversallySpecializing.hasPullback` supplies `HasPullback f g` for universally specializing
`f` and adic `g : Z → Y` with `HasStablySheafyCharts Z` (Huber96 Prop. 1.2.2(b),
pp. 47–49; Def. 1.3.3(i), p. 51). Specialization lifting therefore applies to an existing
pullback for each such base change.
Closed maps are specializing, so universally closed morphisms are universally specializing; for the
inclusion `D ⊆ P¹` of the closed disc into the projective line, the specialization of the Gauss point
in the direction `|T| > 1` does not lift, so this open embedding is not specializing. *Needs:*
*finite-type-morphism-classes*; *fibre-products-existence*; Mathlib `SpecializingMap`.
Lean: `AdicSpace.UniversallySpecializing`.

**Checks.**

- The identity of the closed disc is
  locally of weakly finite type and universally specializing.
- The closed disc's structure morphism
  is locally of weakly finite type but is not universally specializing.
- The closed disc's structure map
  is specializing, but is not universally specializing; an adic base change exists whose
  projection fails to lift specializations (Huber96 Def. 1.3.3, p. 51; Prop. 1.3.8,
  pp. 53–54). Thus testing only the original map would accept this non-example.
- *Degenerate.* Identities and closed embeddings are
  universally specializing (their base changes are closed maps, hence specializing).
- *Compatibility.* `f` is specializing at every point
  iff Mathlib's `SpecializingMap` holds for the continuous map `|f| : |X| → |Y|`.
- *Computation.* The open unit disc `B → Spa(K, K°)` is
  universally specializing (*separated-proper-partially-proper*: every `(x, A)` with `x ∈ B` has its
  centre in `B`). The reason is not the inequality `|T(x)| < 1` alone, which a type-5 specialisation
  `η'` of the Gauss point `η` also satisfies although `η' ∉ B`; it is that `x ∈ B` means
  `|T(x)|ⁿ ≤ |ϖ|` for some `n`, hence `|T(x)|^{2n} ≤ |ϖ|² < |ϖ|`, and a strict inequality
  `|a(x)| < |ϖ(x)|` is inherited by every specialisation `x'` of `x` in the analytic space `B`,
  where `v_x` is the quotient of `v_{x'}` by a convex subgroup (`|a(x')| < |ϖ(x')|`), so the centre
  `x'` lies in `{|T|^{2n} ≤ |ϖ|} ⊆ B`. With `B` replaced by the set `{|T| < 1}` of all points with
  `|T(x)| < 1` (which contains `η'` and is not open) the computation is meaningless.

The projective-line Check uses the existing `projectiveSpace` analytification and
an open immersion of the closed disc over `K`; it produces a specialization outside
the disc's image. The disjoint-union Check in R0.14 specifies countably many pairwise
disjoint open copies of `Spa(ℚ_p, ℤ_p)` covering the source, with the structure map
restricting to the identity on every copy. Thus its infinite fibre is part of the
conclusion, not an assumption about an unrelated topological space.

**Partially proper morphism of adic spaces.** (*partially-proper-morphism*) A morphism `f : X → Y` of
adic spaces is *partially proper* if it is locally of +weakly finite type
(*finite-type-morphism-classes*), separated (*separated-morphism*) and universally specializing
(*universally-specializing-morphism*) (Huber96 §1.3, Def. 1.3.3(ii), p. 51). Conventions: partial
properness is a relative notion for morphisms; an open subspace `U ⊆ X` is partially proper over `X`
only in special cases (the inclusion of the open unit disc into the closed disc is, the inclusion of
the closed disc into `P¹` is not). The Kedlaya–Liu notion of a partially proper open subset (inverse
image of an open subset of the real quotient) is a different definition, compared only through its
uses. In `AdicSpace`, define `IsPartiallyProper f` as the class: locally of +weakly finite type,
separated, universally specializing; prove `IsPartiallyProper.toIsSeparated`
(`IsPartiallyProper f → IsSeparated f`), `IsPartiallyProper.universallySpecializing`
(`IsPartiallyProper f → UniversallySpecializing f`), `IsPartiallyProper.comp` (composites of
partially proper morphisms are partially proper), `IsPartiallyProper.baseChange` (stable under base
change along adic morphisms from spaces with `HasStablySheafyCharts`;
Huber96 Definitions 1.3.1 and 1.3.3, p. 51), `IsProper.isPartiallyProper` (proper morphisms are partially proper),
the converse (a quasi-compact partially proper morphism is proper;
the reverse direction of `IsProper.iff_isPartiallyProper_and_quasiCompact`, with no analyticity
hypothesis; both implications are Huber96 §1.3, Lem. 1.3.4, p. 51), `IsPartiallyProper.iff_valuativeCriterion` (the
partial-properness clause of *separated-proper-partially-proper*) and
the closure statement (if `Y` is quasi-compact quasi-separated, closures of
quasi-compact subsets of `X` are quasi-compact, *partially-proper-closure-quasi-compact*). Proper
equals partially proper plus quasi-compact (*proper-iff-partially-proper-quasi-compact*; Berkeley
Lecture 17, Cor. 17.4.8, p. 157, for the same relation in the v-sheaf setting); the open unit disc is
partially proper and not proper over `Spa(K, K°)`. *Needs:* *finite-type-morphism-classes*;
*separated-morphism*; *universally-specializing-morphism*.
Lean: `AdicSpace.IsPartiallyProper`.

**Checks.**

- *Computation.* `B → Spa(K, K°)` is partially proper and not
  quasi-compact.
- *Non-example.* `D → Spa(K, K°)` is not partially proper (the
  pair `(x, A)` at the Gauss point in the direction `T = ∞` has no centre on `D`).
- *Degenerate.* Identities and closed embeddings with target covered
  by complete stably sheafy affinoids are partially proper
  (they are proper, *closed-embedding-proper*); the open embedding of the closed unit disc `D` into
  the projective line `P¹` over `Spa(K, K°)` is not partially proper (the type-5 point of `D`'s Gauss
  point in the direction `T = ∞` lies in `P¹ ∖ D`).

### R0.11 valuation rings, centres and the valuative criteria

**Valuation rings of an analytic adic space and their centres.** (*adic-valuation-rings-and-centres*)
Let `X` be an analytic adic space (every point analytic). For `x ∈ X` let `k(x)` be the residue field
of the local ring `O_{X,x}`, `k(x)⁺ ⊆ k(x)` the valuation ring of the valuation `v_x`, and
`κ(x) = (k(x)^∧, k(x)⁺^∧)` the completed residue affinoid field with its canonical morphism
`ι_x : Spa κ(x) → X` (AdicSpaces layer 5). A *valuation ring of `X`* is a pair `(x, A)` with `x ∈ X`
and `A` a valuation ring of the field `k(x)` such that `A ⊆ k(x)⁺` — `A` ranges over the valuation
rings of `k(x)` contained in `k(x)⁺`, not over all valuation rings of `k(x)`; `X_v` denotes the set
of valuation rings of `X` (Huber96 §1.3, Def. 1.3.5, p. 52). Since `A ⊆ k(x)⁺` are valuation rings of
the same field, `A` contains the maximal ideal of `k(x)⁺`, so `A` is open in `k(x)` and its closure
`Â` in `k(x)^∧` is a valuation ring making `(k(x)^∧, Â)` an affinoid field (Hübner §2, before
Exercise 2.2, p. 3) with a canonical morphism `j : Spa κ(x) → Spa(k(x)^∧, Â)`. For a morphism
`g : Spa κ(x) → Z` to an adic space `Z`, a point `z ∈ Z` is a *centre of `(x, A)` on `Z` with respect
to `g`* if there is a morphism `c : Spa(k(x)^∧, Â) → Z` with `c ∘ j = g` and `c(s) = z`, `s` the closed
point of `Spa(k(x)^∧, Â)` (the morphism formulation of Huber96 §1.3, Lem. 1.3.10, p. 55). A centre of
`(x, A)` on `X` means a centre with respect to `ι_x`; for a morphism `f : X → Y`, a centre of `(x, A)`
on `Y` means a centre with respect to `f ∘ ι_x`. Huber's pointwise definition — a specialization `y`
of `x` with `k(y)⁺ = i⁻¹(A)` for `i : k(y) → k(x)` — is proved equivalent to the morphism formulation.
Topology: `X_v` carries the topology generated by the sets
`D(U, h) = {(x, A) ∈ X_v : x ∈ U, h(x) ∈ A}` for `U ⊆ X` open and `h ∈ O_X(U)`, `h(x)` the image of
`h` in `k(x)`; these are exactly Huber's subbasic sets (Huber96 §1.3, (1.3.11), p. 55). In
`AdicSpace`, define `ValuationRing X` as the type of pairs `(x, A)` with `x ∈ X` and `A` a valuation
ring of `k(x)` with `A ⊆ k(x)⁺`, `ValuationRing.affinoidField` as the affinoid field `(k(x)^∧, Â)`
attached to `(x, A)` with the canonical morphism `j : Spa κ(x) → Spa(k(x)^∧, Â)`,
`ValuationRing.IsCentre` as the relation "`z` is a centre of `(x, A)` on `Z` with respect to
`g : Spa κ(x) → Z`", and `ValuationRing.instTopologicalSpace` as the topology on `X_v` generated by
the sets `D(U, h)`; prove `ValuationRing.IsCentre.specializes` (a centre `z` of `(x, A)` with respect
to `g` is a specialization of `g(η)`, `η` the point of `Spa κ(x)`),
the affinoid criterion (for analytic `X`, `r : ValuationRing X` and
`f : X → Spa(B, B⁺)` with analytic target, a unique centre exists iff every `b ∈ B⁺` maps into `r.ring`
under the coefficient map, germ, structural stalk map and residue map; this is equivalent
to `φ(B⁺) ⊆ Â` after completion; Huber96 §1.3, Lem. 1.3.6, p. 52), `ValuationRing.map` (`f_v : X_v → Y_v`,
`(x, A) ↦ (f(x), A ∩ k(f(x)))`, compatible with centres: the image under `f` of a centre on `X` is a
centre on `Y`; Huber96 §1.3, the paragraph after the proof of Lem. 1.3.6, p. 52),
the trivial centre (`x` is a centre of `(x, k(x)⁺)` on `X`), continuity of the projection
(the projection `X_v → X`, `(x, A) ↦ x`, is continuous), the specialization criterion
(`z` is a centre of `(x, A)` on `X` with respect to `ι_x` iff `z` is a specialization of `x` and
`k(z)⁺ = i⁻¹(A)` for `i : k(z) → k(x)`, Huber96 §1.3, Def. 1.3.5, p. 52; similarly on `Y` with
`f_v(x, A) = (f(x), A ∩ k(f(x)))`) and the existence of refining rings (for `x ≻ y` in an
analytic adic space there is a unique `A` with `(x, A) ∈ X_v` having `y` as a centre; Huber96 §1.3,
Lem. 1.3.6(i), p. 52). The pair `(x, k(x)⁺)` has exactly one centre on `X`, namely `x` itself; on `D`,
at the Gauss point `x_G`, the valuation ring `A_a` (preimage of the valuation ring of `K̃(T)` at
`T = a`, `a ∈ K̃`) has exactly one centre, the type-5 point in direction `a`, while `A_∞` has none.
*Needs:* Mathlib `ValuationRing`.
`AdicSpace.ValuationRing_affinoid` carries an analytic `X`, `r : ValuationRing X`,
a complete sheafy Tate affinoid `B` and a morphism `f : X → B.spa`. It states that
`∃! y : B.spa.obj, r.IsCentre f y` iff every element of `B.pair.plus` belongs to `r.ring`
after applying `B.coeff`, the germ at `f(r.pt)`, the structural stalk map and the residue
map. This is the affinoid centre criterion above (Huber96, Lemma 1.3.6, p. 52),
with no rank-one restriction.

Lean: `AdicSpace.ValuationRing`, `ValuationRing.basicOpen`, `ValuationRing.IsCentre` (pointwise
form).

`ValuationRing` consists of a point and a valuation subring of its residue field contained
in the point's valuation ring. `ValuationRing.basicOpen U h` consists of refinements
containing the residue of the germ of h; these sets generate its topology.
`ValuationRing.IsCentre` uses the specialization map on stalks and equality of the
comapped residue valuation ring (Huber96, Definitions 1.3.5–1.3.6).

**Checks.**

- *Degenerate.* For every `x ∈ X`, `(x, k(x)⁺) ∈ X_v` and `x` is its
  unique centre on `X` (take `c = ι_x`, since then `Â = k(x)⁺^∧` and `j` is the identity).
- *Computation.* With `x_G ∈ D` the
  Gauss point (`|Σ aₙTⁿ| = max |aₙ|`), whose residue field `k(x_G)⁺/𝔪` is `K̃(T)`: for `a ∈ K̃` let
  `A_a ⊆ k(x_G)⁺` be the preimage of the valuation ring of `K̃(T)` at `T = a`, and `A_∞` the
  preimage of the valuation ring at `T = ∞`. Then `(x_G, A_a)` has exactly one centre on `D`, the
  type-5 point of direction `a`, and `(x_G, A_∞)` has no centre on `D` because `T ∈ K°⟨T⟩ = O_D⁺(D)`
  has image outside `A_∞`; both have a unique centre on `Spa(K, K°)`.
- *Non-example.* On the closed disc over `ℚ_p`,
  the Gauss point `g` has a specialization `y` in direction zero with `|T(y)| < 1`
  and `|p(y)| < |T(y)|ⁿ` for every natural number `n`. Contract the Gauss valuation
  ring along the residue-field map `k(y) → k(g)` induced by specialization to obtain
  `V`. Then `k(y)⁺ ⊊ V` and `T(y)⁻¹ ∈ V`, but there is no `r : ValuationRing D`
  supported at `y` with ring `V`. The rank-one coarsening is therefore excluded
  from the actual `ValuationRing D` carrier
  (Huber96 Def. 1.3.5 and Lem. 1.3.6, p. 52).
- *Characterisation.* For `X = Spa(B, B⁺)` affinoid and `(x, A) ∈ X_v`, `(x, A)` has a centre on
  `X` if and only if the image of `B⁺` in `k(x)` lies in `A`, and the centre is then unique (Huber
  1.3.6).

The Gauss-point Check takes `K = ℚ_p` and the finite direction
`a = 0`. It fixes the point by Tau Ceti's `gaussPoint`, constructs the two refining
valuation rings over it, and asserts uniqueness of the finite-direction centre,
nonexistence of the infinity-direction centre, and uniqueness of both centres on
`Spa(ℚ_p, ℤ_p)`. The image of `T` is explicitly excluded from the infinity ring.
The affinoid-centre Check tests both existence and uniqueness, whereas the trivial
Check tests equality with the original point. These use Huber96 1.3.6, p. 52.

The completion in `ValuationRing.affinoidField` uses the valuation topology of
`k(x)⁺`, even when the refining ring `A` is smaller. Its plus ring is the closure
of the image of `A` in that completion. The pair of definition uses this same
closed image as its defining subring, so `basis.ringOfDefinition = pair.plus`,
as for `Affinoid.completedResidue`. Its defining ideal is the principal ideal generated by the
image of a chosen pseudo-uniformizer of `k(x)` lying in `A`. Analyticity supplies
such an element; the defining ideal is nonzero and proper, even when the valuation
is not discrete. This uses Wedhorn, Remark 5.42, p. 40, Example 6.12, p. 48,
and Proposition 6.14, p. 49. Its underlying ring is a field, and it is Tate for analytic `X`.
The identity ring map goes from this pair to the pair for `(x,k(x)⁺)`; contravariance gives the
canonical map `j` of spectra. A centre `z` of `r` on `X` maps to a centre `f(z)` of `r.map f` on
`Y`. These statements use Huber96
§1.3, Lemma 1.3.10, p. 55, and the paragraph following Lemma 1.3.6, p. 52.

**Checks.**

- The defining subring equals the plus ring
  by the construction, as for the completed residue affinoid field.
- The defining subring is the closure
  of the image of the refining valuation ring, with the original valuation topology.
- The defining ideal is generated by
  the completed image of a pseudo-uniformizer in the refining valuation ring.
- This ideal is neither zero nor the unit ideal.
- The completion at an analytic point has `0 ≠ 1`.
- For `A = k(x)⁺`, the plus ring is exactly
  the closure of the original valuation ring in its completion.
- An element outside `A` remains outside
  the completed plus ring; closing the plus ring does not erase its refinement.
- Contraction along the identity fixes `(x,A)`.
- Successive contractions agree with contraction
  along the composite morphism.
- For the closed disc over `ℚ_p`, every refining
  valuation ring contracts under the structure map to the valuation ring of the
  unique point of `Spa(ℚ_p, ℤ_p)`. The residue of the scalar `p` belongs to the
  contracted ring and its inverse does not. No exclusion is assumed in the Check;
  it computes the contraction, using that `𝔽_p` has no nontrivial valuation
  (Huber96 §1.3, the map on valuation rings following Lem. 1.3.6, p. 52).

**Valuative criterion for separatedness (Huber 1.3.7).** (*valuative-criterion-separated*) Let
`f : X → Y` be a morphism of analytic adic spaces which is quasi-separated (equivalently, the
diagonal `Δ_f` is quasi-compact) and locally of weakly finite type, and assume `X` is covered by
open affinoids with complete stably sheafy rings (for instance `X` locally noetherian), so that
`X ×_Y X` and the affinoid products `U₁ ×_V U₂` exist (*fibre-products-existence* (b),
*diagonal-locally-closed*). Prove that `f` is separated if and only if for every `(x, A) ∈ X_v`
(*adic-valuation-rings-and-centres*) and every `y ∈ Y` there is at most one centre `z` of `(x, A)`
on `X` with `f(z) = y`; equivalently, at most one centre over each centre `y` of `(x, A)` on `Y`
(Huber96 §1.3, Prop. 1.3.7, pp. 52–53; the proof of (⇐) on p. 53 uses Lem. 1.3.6(i), the closedness
of `Δ(X) ∩ (U ×_V U)` in `U ×_V U`, and Stacks Tag 0903, Lem. 5.23.6: a pro-constructible subset
stable under specialization is closed). Witness of the criterion: glue two copies `D₁`, `D₂` of the
closed unit disc along the rational subset `U = {|ϖ| ≤ |T|}` (the disc minus the open disc of
radius `|ϖ|`); the result `X' → Spa(K, K°)` is quasi-separated (`D₁ ∩ D₂ = U` is quasi-compact)
and locally of finite type, and it is not separated. Let `x₁ ∈ U` be the Gauss point of the disc of
radius `|ϖ|` (`|T(x₁)| = |ϖ|`) and `A ⊊ k(x₁)⁺` the preimage of the valuation ring of the residue
field `K̃(T/ϖ)` at `T/ϖ = 0`: the pair `(x₁, A)` has the two centres `z₁ ∈ D₁ ∖ U` and `z₂ ∈ D₂ ∖ U`
(the type-5 specialisation of `x₁` with `|T| < |ϖ|` infinitesimally, once in each copy) over the
single centre of `(x₁, A)` on `Spa(K, K°)`, so uniqueness fails, matching non-separatedness (the
point `(z₁, z₂)` of `D₁ ×_K D₂` lies in the closure of `Δ(U)` but not in `Δ(X')`). The
quasi-separatedness hypothesis cannot be dropped: for the unit disc with doubled origin
`X → Spa(K, K°)` (the doubled-origin Check of *separated-morphism*, glued along `D ∖ {0}`, which
is not quasi-compact, so `X` is not quasi-separated) every pair `(x, A) ∈ X_v` has at most one
centre on `X` — the centres of `(x, A)` are specialisations of `x`, which stay in `D ∖ {0}` when
`x ≠ 0ᵢ`, because the classical point `0` has rank one, so no point other than `0ᵢ` specialises
to `0ᵢ`; and `(0ᵢ, K°)` has only the centre `0ᵢ`, because `0ᵢ` is closed — although `X` is not
separated. Existence fails for
`(x_G, A_∞)` in both copies, since `T ∉ A_∞`; uniqueness here does not assert existence. Mathlib's
valuative criterion for separated morphisms of schemes (in `AlgebraicGeometry.ValuativeCriterion`)
is the scheme analogue (separated = uniqueness part of the
valuative criterion + quasi-separated), with the same role for quasi-separatedness. *Needs:*
*separated-morphism*;
*adic-valuation-rings-and-centres*; *fibre-products-existence*; *affinoid-fibre-product*;
*fibre-product-points*; *diagonal-locally-closed*;
*spectral-map-image-proconstructible*; Tau Ceti `TauCeti.IsProConstructible`,
`IsClosed.isProConstructible`.
Lean: `IsSeparated.iff_valuativeCriterion`.

**Valuative criterion for universal specialization (Huber 1.3.8).**
(*valuative-criterion-specializing*) Let `f : X → Y` be a morphism of analytic adic spaces, locally
of weakly finite type, and `x₀ ∈ X`. Prove that `f` is universally specializing at `x₀`
(*universally-specializing-morphism*) if and only if, for every valuation ring `A` of `k(x₀)` with
`A ⊆ k(x₀)⁺`, every centre of `(x₀, A)` on `Y` is the image of a centre of `(x₀, A)` on `X` (Huber96
§1.3, Prop. 1.3.8, p. 53; the (⇐) direction, p. 54, chooses `A'` by extension of valuation
rings and lifts the centre through the affinoid fibre product). The criterion is pointwise. For the
closed disc `D → Spa(K, K°)` the criterion fails at the Gauss point with `A = A_∞`
(the Gauss-point Check of *adic-valuation-rings-and-centres*), so `D → Spa(K, K°)` is not universally specializing at `x_G`; at
a rank-two point it can hold: for `K = ℚ_p` and `x₀ = η'` a type-5 specialisation of the Gauss point,
the residue field of `k(η')⁺` is finite (`𝔽_p` or a finite extension), whose only valuation ring
is itself, so the only pair is `(η', k(η')⁺)`, with centre `η'` on `D`, and `D → Spa(ℚ_p, ℤ_p)` is
universally specializing at `η'`. Analyticity of `Y` cannot be dropped: for the open embedding
`f : Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` with `x₀` the analytic point, the only pair is `(x₀, ℤ_p)`,
whose unique centre `x₀` on `Y` is the image of its centre on `X`, so the criterion holds, but the
closed non-analytic point `s = (p)` of `Spa(ℤ_p, ℤ_p)` is a specialisation of `f(x₀)` with no
preimage, so `f` is not specializing at `x₀` (`s` is no centre of `(x₀, ℤ_p)`: there is no map
`k(s) = 𝔽_p → k(x₀) = ℚ_p`). Mathlib's `AlgebraicGeometry.universallyClosed_eq_universallySpecializing` and
`ValuativeCriterion.Existence` are the scheme analogues. *Needs:* *universally-specializing-morphism*;
*adic-valuation-rings-and-centres*;
*fibre-products-existence*; *fibre-product-points*; *adic-morphism*; *affinoid-fibre-product*;
*completed-tensor-product*; AdicSpaces layers 0.5 and 4.1 (affinoid fields are stably sheafy);
Mathlib `LocalSubring.exists_le_valuationSubring`.
Lean: `UniversallySpecializing.iff_valuativeCriterion` (all points at once).

**Valuative criterion for partial properness and properness of analytic adic spaces (Huber 1.3.9).**
(*separated-proper-partially-proper*) Let `f : X → Y` be a morphism of analytic adic spaces which is
quasi-separated and locally of +weakly finite type, with `X` covered by open affinoids with complete
stably sheafy rings (for instance `X` locally noetherian; needed for `X ×_Y X`, as in
*valuative-criterion-separated*). Prove that `f` is partially proper (*partially-proper-morphism*)
if and only if for every `(x, A) ∈ X_v` and every centre `y` of `(x, A)` on `Y` there is exactly one
centre `z` of `(x, A)` on `X` with `f(z) = y`. If moreover `f` is of +weakly finite type (in
particular quasi-compact), the same condition is equivalent to `f` being proper
(*universally-closed-and-proper-morphism*) (Huber96 §1.3, Cor. 1.3.9, pp. 54–55, both parts, with
Huber's hypotheses: quasi-separated; locally of +weakly finite type, resp. of +weakly finite type;
analytic — the source proves the criterion only for analytic spaces). Huber's Lemma 1.3.10 (Huber96
§1.3, Lem. 1.3.10, p. 55) rephrases the condition as the unique extension of morphisms along
`Spa(K, K⁺) → Spa(K, K'⁺)` for affinoid fields `(K, K⁺)`, `(K, K'⁺)` sharing the field `K`; the `X_v`
form stated here is the declaration (Berkeley Lecture 17, Cor. 17.4.8, p. 157, has the same shape —
valuative criterion with unique lifts, proper = partially proper + quasi-compact — for v-sheaves).
Every finite morphism to an analytic adic space satisfies existence and uniqueness of centres,
because integral plus rings are contained in every valuation ring containing the base plus ring
(*finite-morphisms*); hence finite implies proper, and quasi-compact partially proper equals proper
(Huber 1.3.4). Concretely, the closed unit disc `D → Spa(K, K°)` fails existence at `(x_G, A_∞)`; the
projective line `P¹ → Spa(K, K°)` satisfies existence and uniqueness; the open unit disc satisfies
both and is partially proper but not quasi-compact. *Needs:* *valuative-criterion-separated*;
*valuative-criterion-specializing*; *partially-proper-morphism*;
*universally-closed-and-proper-morphism*; *proper-iff-partially-proper-quasi-compact*;
*adic-valuation-rings-and-centres*.
Lean: `IsPartiallyProper.iff_valuativeCriterion` (partially proper half; the properness half is a
README target).

**Proper equals partially proper and quasi-compact (Huber 1.3.4).**
(*proper-iff-partially-proper-quasi-compact*) Let `f : X → Y` be any morphism of adic spaces (no
analyticity hypothesis). Prove that `f` is proper if and only if it is partially proper and
quasi-compact, universal closedness and universal specialization being tested on base changes along
adic morphisms from spaces with stably sheafy charts (*universally-closed-morphism*,
*universally-specializing-morphism*) (Huber96 §1.3, Lem. 1.3.4 and proof, pp. 51–52, under
(1.1.1), the statement and the route of (⇐); Wedhorn §8.6, Def. 8.54 and Rem. 8.55(2), p. 89, the
stable test spaces, whose base changes along `f` are again stable; Stacks Tag 0903, Lem. 5.23.6,
for the closedness step for pro-constructible images; Stacks Tag 0A2S, Lem. 5.23.3, images of
spectral maps are pro-constructible; Berkeley Lecture 17, Cor. 17.4.8, p. 157, the same statement
in the v-sheaf setting). Open unit disc: partially proper, not quasi-compact, not
proper; closed unit disc: quasi-compact, not partially proper, not proper; `P¹`: proper. The scheme
analogue is Mathlib's `AlgebraicGeometry.universallyClosed_eq_universallySpecializing` (universally closed =
universally specializing + quasi-compact). *Needs:* *universally-closed-and-proper-morphism*;
*partially-proper-morphism*; *universally-closed-morphism*; *universally-specializing-morphism*;
*finite-type-morphism-classes*; *fibre-products-existence*; *adic-ring-homomorphism*;
*base-change-stability*;
*spectral-map-image-proconstructible*; Mathlib `IsClosedMap.specializingMap`; Tau Ceti
`TauCeti.IsProConstructible`, `IsClosed.isProConstructible`, `Set.Finite.isProConstructible_biUnion`.
Lean: `IsProper.iff_isPartiallyProper_and_quasiCompact`.

**The space of valuation rings of a qcqs analytic adic space is spectral (Huber 1.3.12).**
(*valuation-ring-space-spectral*) Let `X` be a quasi-compact quasi-separated analytic adic space.
Prove that `X_v`, with the topology generated by the sets `D(U, h)`
(*adic-valuation-rings-and-centres*), is a spectral space, and that for every quasi-compact open
`U ⊆ X` and every `h ∈ O_X(U)` the subset `D(U, h)` of `X_v` is quasi-compact (Huber96 §1.3, (1.3.11)
and Lem. 1.3.12, p. 55; the proof, pp. 55–57, including Huber's description (2) of `p(D(L; U, E, F))`
on p. 56, is the route followed). Consequently the projection `p : X_v → X`, `(x, A) ↦ x`, is a
spectral map (`p⁻¹(U) = D(U, 1)`). The quasi-compactness of `D(U, h)` is used by
*partially-proper-closure-quasi-compact* and *partially-proper-quasi-finite-local-finiteness*. For
`X = Spa(K, K°)` with `K` a rank-one field and residue field `K̃`, `X_v` is the Riemann–Zariski
space of valuation rings of `K̃` (with the generic point the trivial valuation ring `K̃`), which is
spectral. *Needs:* *adic-valuation-rings-and-centres*; Mathlib `SpectralSpace`,
`LocalSubring.exists_le_valuationSubring`; Tau Ceti `TauCeti.IsProConstructible`,
`TauCeti.spectralSpace_of_isClopen_generateFrom`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.
Lean: `ValuationRing.spectralSpace` (spectrality).

**Closures of quasi-compact sets under partially proper morphisms (Huber 1.3.13).**
(*partially-proper-closure-quasi-compact*) Let `f : X → Y` be a partially proper morphism of
analytic adic spaces with `Y` quasi-compact and quasi-separated, `X` being covered by open affinoids
with complete stably sheafy rings (for instance `X` locally noetherian; the setting in which
`X ×_Y X` is built). Prove that the closure in `X` of every quasi-compact subset of `X` is
quasi-compact (Huber96 §1.3, Lem. 1.3.13 and proof, p. 57, whose hypotheses match). For the open unit
disc `B → Spa(K, K°)` and `C = {|T| ≤ |ϖ|}`, the closure of `C` in `B` is `C` together with its
specializations and is quasi-compact. *Needs:* *valuation-ring-space-spectral*;
*separated-proper-partially-proper*; *partially-proper-morphism*;
*adic-valuation-rings-and-centres*; *diagonal-locally-closed*; *plus-weakly-finite-type*;
compactness of the constructible topology and the specialization criterion in R0.12.
Lean: README target.

The affinoid residue-field structure of a valuation ring of a point keeps the
refining valuation subring as data: it can be strictly smaller than the valuation ring
of the point. These are algebraic Checks on this structure; the space of valuations
and its topology use the geometric construction of Huber96 §1.3, Definition 1.3.5,
printed p. 52.

- The zero Huber ring has no such pairs, since its adic spectrum is empty.
- Over a discrete finite field every refining valuation ring is the whole residue field: every nonzero element has finite multiplicative order.
- At the trivial point of discrete ℚ, a p-adic refinement contains p but not p⁻¹, although the point's own valuation ring is the whole residue field. Replacing the refining subring by the point's valuation ring loses these pairs.

### R0.12 closure properties of separated, universally closed and proper morphisms

Throughout this subsection all adic spaces involved are covered by open affinoids `Spa(B, B⁺)` with
`B` complete and stably sheafy (for instance locally noetherian adic spaces,
*locally-noetherian-adic-space* with *noetherian-type-stably-sheafy*), so that the fibre products
used exist by *fibre-products-existence*. Huber's definition of properness (Huber96 §1.3, Defs.
1.3.1–1.3.3, p. 51) has three clauses, which are treated separately in each proof; closed embeddings
are proper by *closed-embedding-proper*.

**The diagonal of a separated morphism is a closed embedding.**
(*separated-diagonal-closed-embedding*) Let `f : X → Y` be a morphism of adic spaces that is locally
of weakly finite type (*finite-type-morphism-classes*), with `X` covered by open affinoids
`Spa(B, B⁺)` with `B` complete and stably sheafy (for instance `X` locally noetherian), so that
`X ×_Y X` exists (*fibre-products-existence*, case (b); `f` is adic). Prove that `f` is separated
(*separated-morphism*: the image of `Δ_f` is closed) if and only if the diagonal
`Δ_f : X → X ×_Y X` is a closed embedding (*closed-adic-subspaces-and-embeddings*). The key step is
general: a locally closed embedding `h : T → Z` of adic spaces whose image `h(|T|)` is closed in `|Z|`
is a closed embedding (Zavyalov-Q Appendix B.6, Lem. B.6.14, p. 57, stated for analytic adic spaces
with coherent ideal sheaves, whose gluing of the ideal sheaf over the open cover by `U` and the
complement of the image, in the proof on p. 57, applies to admissible ideal sheaves;
Zavyalov-Q Appendix B.7, Cor. B.7.4, p. 58, for the conclusion for separated morphisms of locally
strongly noetherian analytic adic spaces, deduced from B.6.14 and the locally closed diagonal B.7.3).
For the closed unit disc `X = Spa(K⟨T⟩, K°⟨T⟩)` over `Spa(K, K°)`, `Δ_X` is the closed embedding of
`X` into the closed bidisc cut out by the ideal `(T ⊗ 1 − 1 ⊗ T)` of `K⟨T₁, T₂⟩`; for the closed disc
with doubled origin, `Δ` is a locally closed embedding whose image is not closed, it is not a closed
embedding, and the space is not separated. *Needs:* *separated-morphism*; *diagonal-locally-closed*;
*closed-adic-subspaces-and-embeddings*; *fibre-products-existence*;
*finite-type-morphism-classes*.
Lean: `IsSeparated.iff_closedImmersion_diagonal`.

**Universally closed, separated and proper morphisms are stable under adic base change.**
(*proper-base-change*) Let `f : X → Y` be a morphism of adic spaces locally of weakly finite type and
`g : Y' → Y` an adic morphism (*adic-morphism*), and let `f' : X' = X ×_Y Y' → Y'` be the base change
(*fibre-products-existence*, case (b)). For the separatedness and properness conclusions, assume
`Y'` is covered by complete stably sheafy affinoids, so the base-changed source has such charts.
Prove that if `f` is universally closed (resp. separated,
resp. quasi-compact, resp. proper), then so is `f'` (*universally-closed-morphism*,
*separated-morphism*, *universally-closed-and-proper-morphism*) (Stacks Tag 01W4 (Morphisms, Lem.
29.42.5), the scheme statement, the adic proof restricting base change to adic morphisms, along which
Huber's fibre products exist: Huber96 §1.2, Prop. 1.2.2 and proof, pp. 47–49, case b)). The closed
unit disc `Spa(K⟨T⟩, K°⟨T⟩) → Spa(K, K°)` is separated and quasi-compact, and its base change along
`Spa(L, L°) → Spa(K, K°)` for a complete extension `L/K` is `Spa(L⟨T⟩, L°⟨T⟩) → Spa(L, L°)`, again
separated and quasi-compact. Adicness of `g` is needed: the base change of the quasi-compact
`Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` along the non-adic `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` is not quasi-compact (*base-change-stability*). *Needs:*
*universally-closed-morphism*; *separated-morphism*; *universally-closed-and-proper-morphism*;
*base-change-stability*; *adic-morphism*; *fibre-products-existence*;
*separated-diagonal-closed-embedding*; *closed-adic-subspaces-and-embeddings*; Mathlib
`CategoryTheory.IsPullback.paste_horiz`, `CategoryTheory.IsPullback.of_right`.
Lean: `IsProper.baseChange` (proper case).

**Composites of universally closed, separated and proper morphisms.** (*proper-comp*) Let
`f : X → Y` and `g : Y → Z` be morphisms of adic spaces locally of weakly finite type. Prove that if
`f` and `g` are universally closed (resp. separated, resp. quasi-compact, resp. proper), then so is
`g ∘ f` (Stacks Tag 01W3 (Morphisms, Lem. 29.42.4), whose proof — closedness after base change via
pasting of fibre products — transfers to adic base change). For a finite extension `L/K` and a
closed embedding `X → Spa(L, L°)` (for instance the point itself), `X → Spa(L, L°) → Spa(K, K°)` is
proper: a closed embedding followed by the finite, hence proper, `Spa(L, L°) → Spa(K, K°)`
(*finite-morphisms*). The converse fails: the origin `Spa(K, K°) → D` of the closed unit disc `D` is
proper, `D → Spa(K, K°)` is not, and the composite is the identity of `Spa(K, K°)`, which is proper.
*Needs:* *finite-type-morphism-classes*; *plus-weakly-finite-type*; *universally-closed-morphism*;
*separated-morphism*; *universally-closed-and-proper-morphism*; *base-change-stability*;
*fibre-products-existence*; *separated-diagonal-closed-embedding*;
*closed-adic-subspaces-and-embeddings*; Mathlib `CategoryTheory.IsPullback.paste_horiz`,
`CategoryTheory.IsPullback.of_right`.
Lean: `IsProper.comp` (proper case; no hypothesis on `Z`: `IsSeparated` gives `X` and `Y` stably
sheafy charts, and `UniversallyClosed` tests only base changes from spaces with stably sheafy
charts).

**Cancellation: `g ∘ h` proper and `g` separated imply `h` proper.** (*proper-of-comp-separated*)
Let `h : X → Y` and `g : Y → Z` be morphisms of adic spaces with `g ∘ h` locally of weakly finite type
and `g` separated (*separated-morphism*; in particular `g` is locally of weakly finite type). Prove
that if `g ∘ h` is universally closed (resp. proper), then `h` is universally closed (resp. proper);
in particular `h(|X|)` is closed in `|Y|`. This is the adic form of Stacks Tag 01W6 (Morphisms, Lem.
29.42.7, with `Y` separated over `S`; its proof is the graph factorisation), Mathlib's
cancellation statement for proper morphisms of schemes (in `AlgebraicGeometry.IsProper`). A section `s : Y → X` of a separated morphism
`p : X → Y` is proper, since `p ∘ s = id_Y` is proper, and it is a closed embedding, being the base
change of the closed embedding `Δ_p` (*separated-diagonal-closed-embedding*) along
`(id_X, s ∘ p) : X → X ×_Y X` (the zero section of the closed disc over `Spa(K, K°)` is the origin).
Separatedness of `g` is needed: let `Y` be the adic projective line over `K` (two closed unit discs
glued along the unit circle) with its classical point `∞` doubled, and `h` the inclusion of one copy
of the projective line; then `g ∘ h` is the proper structure map of the projective line, but
`h(|X|) = |Y| ∖ {∞₂}` is not closed, so `h` is not universally closed. *Needs:*
*finite-type-morphism-classes*; *plus-weakly-finite-type*; *separated-morphism*;
*universally-closed-morphism*; *universally-closed-and-proper-morphism*;
*separated-diagonal-closed-embedding*; *closed-adic-subspaces-and-embeddings*;
*closed-embedding-proper*; *proper-base-change*; *proper-comp*; *fibre-products-existence*; Mathlib
`CategoryTheory.IsPullback.paste_horiz`, `CategoryTheory.IsPullback.of_right`.
Lean: README target.

**Universal closedness descends along surjections.** (*universally-closed-of-surjective*) Let `S` be
an adic space, `p : X → S` and `q : Y → S` morphisms locally of weakly finite type and `π : X → Y` a
morphism surjective on underlying points with `q ∘ π = p`. Prove that if `p` is universally closed
(*universally-closed-morphism*), then `q` is universally closed; if moreover `q` is separated,
quasi-compact and locally of +weakly finite type, then `q` is proper
(*universally-closed-and-proper-morphism*) (Stacks Tag 03GN (Morphisms, Lem. 29.42.9), with the image
computation of its proof; Zavyalov-Q §5.1, proof of Prop. 5.1.1, p. 34, for the descent step as used
for quotient maps, and Zavyalov-Q §5.3, proof of Prop. 5.3.1, p. 36, transferring the scheme argument,
including this descent, to adic spaces). Surjectivity of `π` need not be assumed after base change:
it is preserved by every adic base change. The Chow's-lemma step of the analytification comparison
in layer R1 is an instance: `X'^ad → Y^ad` proper and `π^ad : X'^ad → X^ad` surjective give
`X^ad → Y^ad` universally closed. Surjectivity is needed: the empty adic space is proper over
`Spa(K, K°)` and maps to the closed disc, which is not universally closed over `Spa(K, K°)`.
*Needs:* *universally-closed-morphism*; *universally-closed-and-proper-morphism*;
*fibre-products-existence*; *fibre-product-points*; *base-change-stability*;
*finite-type-morphism-classes*; *adic-morphism*; Mathlib `CategoryTheory.IsPullback.paste_horiz`,
`CategoryTheory.IsPullback.of_right`, `Set.image_preimage_eq`.
Lean: README target.

The statements are `IsProper.comp`, `IsProper.baseChange` (both in `Suggested.lean`), and the
cancellation statements for proper and universally closed morphisms (README targets). In the
first and third, the source chart condition is inherited
from properness of `f` and of `f ≫ g`, respectively. The cancellation statement also takes
`LocallyOfPlusWeaklyFiniteType f`. For base change, `IsAdic g` and
`HasStablySheafyCharts Z` ensure that the new source has stably sheafy charts by
`pullback_stablySheafy`. For surjective descent, the conclusion retains the explicit
`LocallyOfWeaklyFiniteType g` hypothesis. The three resulting proper morphisms have
self-products by `IsSeparated.hasPullback`; the descended universally closed morphism
has every adic pullback from a space with stably sheafy charts by
`UniversallyClosed.hasPullback` (Huber96 Prop. 1.2.2(b), pp. 47–49).

**Checks.**

The following four Checks use the split degree-two cover
`f : B = Spa(ℚ₂ × ℚ₂, ℤ₂ × ℤ₂) → A = Spa(ℚ₂, ℤ₂)`, induced by the diagonal
ring map `a ↦ (a,a)`. Thus `A` has one point, `B` has two points, and
`B ×_A B` has four points (Huber96 Proposition 1.2.2, pp. 47–49, and
Definitions 1.3.1–1.3.2, p. 51).

- `f`, `id_A` and `f ≫ id_A` are proper, and the
  self-product of the composite has four points.
- The second projection `q : B ×_A B → B`
  is proper, its source has stably sheafy charts, and its self-product exists.
  Its source has four points and each fibre has two points.
- The proper composite `f ≫ id_A`, separated
  second factor `id_A` and local plus weak finite type of `f` give a proper
  first factor whose self-product has four points.
- `f` is surjective and `f ≫ id_A`
  is universally closed, as is `id_A`. Base changing `id_A` along `f` gives an
  isomorphic projection `A ×_A B → B`, with two points in its source.


**Closed embeddings are proper.** (*closed-embedding-proper*) Let `i : Z → X` be a closed embedding
of adic spaces (*closed-adic-subspaces-and-embeddings*), with `X` covered by open affinoids with
complete stably sheafy rings. Prove `IsClosedImmersion.isProper`: `i` is proper
(*universally-closed-and-proper-morphism*):
it is quasi-compact and locally of +weakly finite type (*plus-weakly-finite-type*), separated
(*separated-morphism*) and universally closed (*universally-closed-morphism*); for every adic
morphism `g : X' → X` from an adic space `X'` covered by open affinoids with complete stably sheafy
rings, the base change `Z ×_X X' → X'` is the closed embedding `V(𝓘·O_{X'}) → X'` (Stacks Tag 01W5
(Morphisms, Lem. 29.42.6), the scheme statement, whose proof — closed immersions are stable under
base change, separated and of finite type — is followed clause by clause; Zavyalov-Q Appendix B.6,
Cor. B.6.10(1), p. 56, base change of closed immersions of locally strongly noetherian adic spaces,
the input of universal closedness; Huber96 §1.4, Lem. 1.4.5, pp. 61–62, Huber's route through
finite morphisms). No analyticity of `X` is assumed: Huber's route (closed embeddings are finite,
finite morphisms are proper, his 1.4.5(ii),(iii)) is available here over analytic targets through
*closed-embedding-finite* and *finite-morphisms*. The origin `Spa(K, K°) → Spa(K⟨T⟩, K°⟨T⟩)`, cut
out by `(T)`, is proper, and so is the non-reduced point `V(T²)`; the open embedding of the open
unit disc into the closed unit disc is not proper, being neither quasi-compact nor of closed
image. A locally closed embedding is proper exactly when it is a closed embedding (a proper one has
closed image, *separated-diagonal-closed-embedding*). *Needs:*
*closed-adic-subspaces-and-embeddings*; *universally-closed-and-proper-morphism*;
*separated-morphism*; *universally-closed-morphism*; *plus-weakly-finite-type*;
*finite-type-morphism-classes*; *fibre-products-existence*; Tau Ceti `Huber.Pair.quotient`;
Mathlib `CategoryTheory.IsKernelPair.id_of_mono`.
Lean: `IsClosedImmersion.isProper`.

### R0.13 finite morphisms

In the checks of this subsection `K` is a complete nonarchimedean field with nontrivial rank-one
valuation, `K°` its valuation ring, `ϖ` a pseudo-uniformiser, `K⟨T⟩` the Tate algebra with plus ring
`K°⟨T⟩` and `D = Spa(K⟨T⟩, K°⟨T⟩)`.

**Finite morphism of complete Huber pairs.** (*finite-huber-pair-hom*) Let `(A, A⁺)` and `(B, B⁺)` be
complete Huber pairs (Tau Ceti `Huber.Pair` on complete Hausdorff Huber rings `A`, `B`) and
`φ : (A, A⁺) → (B, B⁺)` a morphism of Huber pairs (Tau Ceti `Huber.Pair.Hom`: continuous,
`φ(A⁺) ⊆ B⁺`). The morphism `φ` is *finite* if it is of topologically finite type as a morphism of
affinoid rings (Huber94 §3: `φ` factors through a quotient mapping `A⟨X₁,…,Xₙ⟩_M → B`, i.e. a
surjective continuous open ring map with `B⁺` the integral closure of the image of the plus ring)
and the ring maps `A → B` and `A⁺ → B⁺` are integral (Huber96 §1.4, (1.4.2), p. 61; Zavyalov-Q
Appendix B.2, Def. B.2.6 and Rem. B.2.7, p. 45, for the public form in the Tate case and its
equivalence with Huber's). Consequences: `B⁺` is the integral closure of `φ(A⁺)` in `B` (always); `B`
is a finite `A`-module carrying the natural `A`-module topology when `A` is Tate (Zavyalov-Q Appendix
B.2, Lem. B.2.9, p. 45; Zavyalov-Q Appendix B.3, Lem. B.3.4, p. 48). Huber (1.4.2) states these
consequences under his standing noetherian assumption (1.1.1), referring to his habilitation [Hu4, 3.12.10]
(*Bewertungsspektrum und rigide Geometrie*, Regensburger Math. Schriften 23, 1993); outside
the Tate case they are not claimed here. For complete Tate pairs, `φ` is finite if and only if
`A → B` is module-finite (Mathlib `RingHom.Finite`) and `A⁺ → B⁺` is integral (Zavyalov-Q Appendix
B.2, Lems. B.2.8–B.2.9, p. 45). In `Huber.Pair.Hom`, define `IsFinite φ` as the predicate:
topologically finite type (Huber94) with `A → B` and `A⁺ → B⁺` integral; prove `IsFinite.finite` (for
`A` Tate, `IsFinite φ → φ.toRingHom.Finite`: `B` is a finite `A`-module, Zavyalov-Q B.2.9),
`IsFinite.isIntegral_plus` (`IsFinite φ → A⁺ → B⁺` integral), the plus-ring formula
(`IsFinite φ → B⁺ =` integral closure of `φ(A⁺)` in `B`), `IsFinite.isModuleTopology` (`IsFinite φ`
with `A` Tate: the topology of `B` is the natural `A`-module topology, Mathlib `IsModuleTopology`),
the Tate characterisation (for complete Tate pairs,
`IsFinite φ ↔ RingHom.Finite φ ∧ A⁺ → B⁺` integral), `IsFinite.isTopologicallyFiniteType`
(`IsFinite φ → TauCeti.Huber.IsTopologicallyFiniteType φ.toRingHom`), `IsFinite.id` (the identity is
finite), `IsFinite.comp` (composites of finite morphisms are finite), `IsFinite.quotientHom`
(`(A, A⁺) → Pair.quotient J` is finite for `J` closed) and the isomorphism criterion (a finite
morphism of
complete Tate pairs bijective on rings is an isomorphism of pairs, Zavyalov-Q B.2.11).
`(ℚ_p, ℤ_p) → (ℚ_p(√p), ℤ_p[√p])` is finite; `(K, K⁺) → (K, K°)` with `K⁺ ⊊ K°` is not finite although
`K → K` is. Degenerate instances: for the zero pair, `(A, A⁺) → (0, 0)` is finite (`0` is a finite
`A`-module and the quotient of `A = A⟨⟩` by the unit ideal, which is closed), so the empty adic
space is finite over everything; the identity is finite. The plus-ring consequence
`B⁺ = integral closure of φ(A⁺)` is purely algebraic: `B⁺ ⊇ φ(A⁺)` is integrally closed in `B`,
so it contains the integral closure, and `A⁺ → B⁺` integral gives the reverse inclusion; in
particular a pair `(L, L⁺)` over `(K, K°)` with `L/K` finite always has `L⁺ ⊇ L°`, and the
non-example above necessarily has the smaller plus ring on the source. *Needs:*
*finite-type-morphism-classes*;
Tau Ceti `TauCeti.Huber.Pair`,
`TauCeti.Huber.Pair.Hom`, `TauCeti.Huber.IsRingOfIntegralElements`,
`TauCeti.Huber.IsTopologicallyFiniteType`, `TauCeti.Huber.IsTateRing.isModuleTopology`,
`TauCeti.Huber.Pair.quotient`; Mathlib `RingHom.Finite`, `Algebra.IsIntegral`.
Lean: `Huber.Pair.Hom.IsFinite`.

**Checks.**

- *Computation.* For `p` prime,
  `(ℚ_p, ℤ_p) → (ℚ_p(√p), ℤ_p[√p])` is finite: `ℚ_p(√p) = ℚ_p ⊕ ℚ_p√p` and `√p` is integral over
  `ℤ_p`.
- *Non-example.* Let `K` be a complete rank-one
  nonarchimedean field whose residue field `k` carries a rank-one valuation ring `R ⊊ k` (for
  instance `K` the completion of `ℚ_p(t)` for the Gauss norm, `k = 𝔽_p(t)`, `R = 𝔽_p[t]_{(t)}`),
  and `K⁺ ⊊ K°` the preimage of `R`. Then `id : (K, K⁺) → (K, K°)` is not finite: `K → K` is finite
  but `K°` is not integral over the integrally closed `K⁺ ≠ K°`. A definition that tests only the
  underlying ring map would accept it; the corresponding `Spa(K, K°) → Spa(K, K⁺)` is an open,
  non-closed embedding (`Spa(K, K⁺) = {η, s}` with `{η} = {|a| ≤ 1}` for `a ∈ K°` lifting `t⁻¹`;
  for `R` of infinite rank without a minimal nonzero prime the point `η` is no longer open, which
  is why `R` is taken of rank one).
- *Non-example.* The structure map
  `(ℚ_p, ℤ_p) → (ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, for a prime `p`, is of topologically finite type but not finite
  (`T` is not integral over `ℚ_p`).
- For a nonzero complete Hausdorff Huber ring `A`, the quotient pair map for the unit ideal is finite, has kernel `⊤`, and is not injective.
- The diagonal `(ℚ_p, ℤ_p) → (ℚ_p × ℚ_p, ℤ_p × ℤ_p)` is finite both as a pair map and in Mathlib’s ring-map sense; `(1, 0)` is outside its image.
- *Degenerate.* For any complete
  Hausdorff Huber ring `A`, a pair `S` on `A`, and a pair `Z` on the zero ring
  `PUnit`, every pair morphism `S → Z` satisfies `Pair.Hom.IsFinite`. On spectra
  its source is empty.

**Finite morphism of adic spaces.** (*finite-morphism*) A morphism `f : X → Y` of adic spaces is
*finite* if every `y ∈ Y` has an open affinoid neighbourhood `V ⊆ Y` such that `f⁻¹(V)` is affinoid
and the induced morphism of complete Huber pairs
`(O_Y(V), O_Y⁺(V)) → (O_X(f⁻¹V), O_X⁺(f⁻¹V))` is finite (*finite-huber-pair-hom*) (Huber96 §1.4,
(1.4.4), p. 61; Zavyalov-Q Appendix B.2, Def. B.2.12, p. 46, for the public statement of the local
definition in the analytic case). Huber states that then `f⁻¹(V)` is affinoid and finite over `V`
for every open affinoid `V ⊆ Y` ([Hu4, 3.6.20, 3.12.12]); that global form is proved here for
`V = Spa(A, A⁺)` with `A` a strongly noetherian complete Tate ring (Zavyalov-Q Appendix B.2, Thm
B.2.18, p. 47), and nothing is asserted beyond that case (Zavyalov-Q Appendix B.2, Rem. B.2.19,
p. 47). In `AdicSpace`, define `IsFinite f` as the class: affinoid-locally on the target, a finite
morphism of Huber pairs; prove the affinoid case (`Spa` of a finite morphism of complete sheafy
Huber pairs is finite), the global form (for `V = Spa(A, A⁺) ⊆ Y` open with `A`
strongly noetherian Tate, `f⁻¹(V)` is affinoid and finite over `V`, Zavyalov-Q B.2.18),
`IsFinite.quasiCompact` (finite morphisms are quasi-compact), `IsFinite.comp` (composites of finite
morphisms are finite), `IsFinite.baseChange` (for a cartesian square `W = X ×_Y Z` with `f`
finite and `Z` covered by open affinoids with complete stably sheafy rings, the square of
*fibre-products-existence* (a) (`f` is locally of finite type), the projection `W → Z` is finite;
Huber 1.4.5(i). Affinoid
formula: if `V = Spa(A, A⁺) ⊆ Y` with `f⁻¹(V) = Spa(B, B⁺)`, and `Spa(C, C⁺) ⊆ Z` maps into `V`
through an adic `A → C`, its preimage in `W` is `Spa(B ⊗̂_A C)`, the completed pair of
*completed-tensor-product* with its specified plus ring (*affinoid-fibre-product*). For `A` and
`C` complete Tate, `B ⊗̂_A C` is the quotient of `B ⊗_A C` by the closure of `0`
(*finite-algebra-tensor-complete* (i)), and it is `B ⊗_A C` itself, with the integral closure of
the image of `C⁺ ⊗ B⁺`, when `A` and `C` are noetherian or `B` is a finite projective `A`-module
(*finite-algebra-tensor-complete* (ii)); otherwise `B ⊗_A C` need not be Hausdorff, as in the
`C(ℤ_p, ℚ_p)` Check of *finite-algebra-tensor-complete*),
`IsFinite.of_isClosedImmersion` (closed embeddings are finite, *closed-embedding-finite*),
`IsFinite.isProper` (finite morphisms to analytic adic spaces covered by stably sheafy
affinoids, for instance locally noetherian ones, are proper, *finite-morphisms*),
`IsFinite.iff_isProper_and_quasiFinite` (for `f` locally of finite type between analytic adic
spaces with `Y` locally noetherian, finite iff proper and quasi-finite,
*quasi-finite-and-finiteness-criteria*; its right-hand side is
`IsProper f ∧ LocallyQuasiFinite f`, since properness supplies quasi-compactness),
`IsFinite.quasiFinite` (finite morphisms locally of weakly finite type are quasi-finite,
*quasi-finite-morphism*) and
faithfully flat descent (finiteness descends along finite faithfully flat affinoid
covers, *finiteness-faithfully-flat-descent*). `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T²`, is finite; closed
embeddings are finite (*closed-embedding-finite*); finite morphisms to analytic spaces with a
stably sheafy
affinoid cover are proper
(*finite-morphisms*). The rigid-analytic definition (Conrad-AWS §3.1, Def. 3.1.6) is compared through
the rigid–adic comparison functor of layer R1. *Needs:* *finite-huber-pair-hom*;
*fibre-products-existence*; *affinoid-fibre-product*; *completed-tensor-product*;
*finite-algebra-tensor-complete*.
Lean: `AdicSpace.IsFinite`.

**Checks.**

- *Computation.*
  `Spa(K⟨T⟩, K°⟨T⟩) → Spa(K⟨S⟩, K°⟨S⟩)`, `S ↦ T²`, is finite: `K⟨T⟩ = K⟨S⟩ ⊕ K⟨S⟩·T` is free of rank
  `2` and `K°⟨T⟩` is integral over `K°⟨S⟩`. No hypothesis on `2` is needed for finiteness or
  flatness (the splitting into even and odd powers holds in every characteristic); `2 ∈ K^×` matters
  only for the étaleness of the restriction to `{|T| = 1}` (R0.16).
- *Degenerate.* The empty adic space `∅ → Y` is finite over every `Y`:
  over an affinoid `V = Spa(A, A⁺)` the preimage is `Spa(0, 0)` and `(A, A⁺) → (0, 0)` is finite.
- *Non-example.* The rational embedding
  `{|T| ≤ |ϖ|} ⊆ Spa(K⟨T⟩, K°⟨T⟩)` is an open embedding, quasi-finite, with affinoid source, but not
  finite (its image is not closed; `K⟨T, T/ϖ⟩` is not a finite `K⟨T⟩`-module).
- *Non-example.* For `K⁺ ⊊ K°` as in the enlarged-plus-ring Check of *finite-huber-pair-hom*,
  `Spa(K, K°) → Spa(K, K⁺)` is not finite: it is an open
  embedding onto the generic point (not closed), although both sides have the same ring `K`.
- *Degenerate.* Identities and closed embeddings
  (*closed-embedding-finite*) are finite.
- *Compatibility.* For complete strongly noetherian Tate pairs,
  `Spa φ : Spa(B, B⁺) → Spa(A, A⁺)` is finite iff `φ` is finite in the sense of
  *finite-huber-pair-hom*; and a morphism of rigid spaces is finite in Conrad's sense (Conrad-AWS
  §3.1, Def. 3.1.6) iff its adic counterpart is (Huber 1.4.5(iv), via the comparison functor of
  layer R1).

**The Huber pair of a finite algebra over a noetherian affinoid ring.**
(*finite-algebra-over-affinoid*) Let `(A, A⁺)` be a complete Huber pair such that `A` is a complete
noetherian Tate ring or has a noetherian ring of definition (for instance `A` strongly noetherian
Tate, or an affinoid algebra over a complete nonarchimedean field). Let `ψ : A → C` be a finite
`A`-algebra (`C` commutative and finitely generated as an `A`-module). Equip `C` with the natural
`A`-module topology (the finest topology making `C` a topological `A`-module; Mathlib
`moduleTopology A C`; Huber94 p. 524) and let `C⁺` be the integral closure of `ψ(A⁺)` in `C`. Then:
(i) `C` is a complete Hausdorff Huber ring, Tate if `A` is, every `A`-submodule of `C` is closed, and
`ψ` is continuous (Huber94 §2, Lem. 2.4(ii), printed p. 525, completeness and strictness of the
natural topology in the noetherian Tate case; Huber94 §2, Lem. 2.3, printed p. 525, the case of a
noetherian ring of definition and the closedness of submodules; Morel §II.4.2, Prop. II.4.2.2, the
canonical topology on finite modules over a complete noetherian Tate ring); (ii) `C⁺` is a ring of
integral elements, so `(C, C⁺)` is a complete Huber pair; (iii) `ψ` is a finite morphism of Huber
pairs (*finite-huber-pair-hom*); (iv) universal property: for every complete Huber pair `(D, D⁺)`
with a morphism `χ : (A, A⁺) → (D, D⁺)`, morphisms of Huber pairs `(C, C⁺) → (D, D⁺)` under
`(A, A⁺)` are exactly the `A`-algebra maps `C → D`; (v) if `A` is strongly noetherian Tate, so is
`C`; (vi) if `A` is of noetherian type (*noetherian-type-huber-ring*: a noetherian ring of
definition, or strongly noetherian Tate), then so is `C`, by (iii), `IsFinite.isTopologicallyFiniteType`
and `IsNoetherianType.of_isTopologicallyFiniteType` (*topologically-finite-type-noetherian-type*), so
`A` and `C` are stably sheafy by `IsNoetherianType.isStablySheafy`
(*noetherian-type-stably-sheafy*), `Spa(A, A⁺)` and `Spa(C, C⁺)` are adic spaces, and
`Spa(C, C⁺) → Spa(A, A⁺)` is a finite morphism of adic spaces (the affinoid case of
*finite-morphism*); for `A` strongly noetherian Tate every finite morphism `X → Spa(A, A⁺)` is
isomorphic over `Spa(A, A⁺)` to one of this form, with `C = O_X(X)` (Zavyalov-Q Appendix B.2, Thm
B.2.18, p. 47) (Huber96 §1.4, (1.4.2), p. 61, the construction itself, stated by Huber under his
standing noetherian assumption (1.1.1)). For a complete noetherian Tate ring that is not strongly
noetherian, (i)–(iv) hold and (vi) asserts nothing: completeness of finite modules does not make
`Spa(A, A⁺)` an adic space, and a noetherian Tate ring need not be strongly noetherian
(Kedlaya-CM §11.1, Ex. 11.1.4: `A⟨T⟩` can fail to be noetherian for noetherian `A`).
Convention: the noetherian hypothesis is part of the construction; for a non-noetherian complete
Tate ring `A` a finite `A`-algebra `C = A/J` with `J` not closed has a non-Hausdorff natural
topology, so no complete Huber pair structure exists on `C` itself (Zavyalov-Q Appendix B.3, Rem.
B.3.3, p. 48). In the Tate case the module topology, completeness and closedness of submodules of
clause (i) are Tau Ceti's `IsTateRing.isModuleTopology`, `completeSpace_moduleTopology` and
`isClosed_of_isNoetherian`, which this construction consumes; the new content is the pair
`(C, C⁺)` and the noetherian-ring-of-definition case. In `Huber.Pair`, define `finiteAlgebra` as the
complete Huber pair `(C, C⁺)` on a finite algebra `C` over a complete Huber pair `(A, A⁺)` with `A` as above, with the natural topology; prove `finiteAlgebra_plus` (`(finiteAlgebra C).plus =` integral
closure of `ψ(A⁺)` in `C`), `finiteAlgebra.completeSpace` (`C` is complete and Hausdorff),
`finiteAlgebra.isClosed_submodule` (every `A`-submodule, in particular every ideal, of `C` is closed),
`finiteAlgebra.isTateRing` (`C` is Tate if `A` is), `finiteAlgebra.isStronglyNoetherian` (`C` is
strongly noetherian if `A` is), `finiteAlgebra.algebraMap_isFinite` (`(A, A⁺) → (C, C⁺)` is finite,
*finite-huber-pair-hom*), `finiteAlgebra.homEquiv` (morphisms of Huber pairs `(C, C⁺) → (D, D⁺)`
under `(A, A⁺) ≃` `A`-algebra maps `C → D`), `finiteAlgebra.map` (an `A`-algebra map `C → C'` of
finite `A`-algebras induces a morphism of Huber pairs; `map_id` and
`Pair.finiteAlgebra.map_comp`, the equality for two composable A-algebra maps
between finite algebras with their natural topologies under the same noetherian
hypothesis on the complete base A),
`finiteAlgebra_quotient` (for a closed ideal `J` of `A`, `finiteAlgebra (A ⧸ J) = Pair.quotient J`),
the finite morphism of (vi) (for `A` of noetherian type, `Spa (finiteAlgebra C) → Spa(A, A⁺)` is a
finite morphism of adic spaces) and the description of finite spaces over affinoids (every finite `X → Spa(A, A⁺)`, `A` strongly noetherian
Tate, is `Spa (finiteAlgebra O_X(X))` over `Spa(A, A⁺)`, Zavyalov-Q B.2.18). `C = A` gives back
`(A, A⁺)`; `C = K⟨T⟩[U]/(U² − T)` over `A = K⟨T⟩` gives `(K⟨U⟩, K°⟨U⟩)` in every characteristic;
PerfectoidTowers layer P8 takes "`A` finite over `A^G`" to produce the affinoid structure on `A`
from that of `A^G`. *Needs:* *finite-huber-pair-hom*; *finite-morphism*;
*noetherian-rod-module-complete*; *noetherian-type-huber-ring*;
*topologically-finite-type-noetherian-type*; *noetherian-type-stably-sheafy*; Tau Ceti
`TauCeti.Huber.Pair`, `TauCeti.Huber.IsTateRing.t2Space_moduleTopology`,
`TauCeti.completeSpace_moduleTopology`, `TauCeti.Huber.isClosed_of_isNoetherian`,
`TauCeti.Huber.IsTateRing.isModuleTopology`,
`TauCeti.Huber.Pair.isRingOfIntegralElements_integralClosure`, `TauCeti.Huber.IsStronglyNoetherian`;
Mathlib `moduleTopology`, `IsModuleTopology.isTopologicalRing`,
`IsModuleTopology.continuous_of_linearMap`.
Lean: README target.

Both `Huber.Pair.finiteAlgebra` and its structure morphism
`Huber.Pair.finiteAlgebra.algebraHom` take the chosen `[Algebra A C]`,
`[Module.Finite A C]` and `[IsModuleTopology A C]` as parameters. The plus ring is
the integral closure of the image under this chosen algebra map, and the structure
morphism has that same underlying map (`finiteAlgebra.algebraHom_toRingHom`);
changing the algebra structure can change the plus ring (Huber96 §1.4, (1.4.2),
printed p. 61).

**Checks.**

- *Degenerate.* For `C = A` (`ψ = id`), `Huber.Pair.finiteAlgebra`
  returns `(A, A⁺)`: the natural topology of `A` over itself is its own topology and `A⁺` is
  integrally closed in `A`.
- *Degenerate.* For `A` of noetherian type and `C = A`, clause (vi) passes through
  `TauCeti.AdicSpace`: `IsNoetherianType.isStablySheafy` makes `Spa(A, A⁺)` an adic space,
  `Spa (finiteAlgebra A)` is that adic space, and the morphism of (vi) is its identity, which is
  finite. For `A` only complete noetherian Tate, the same instance of (vi) would already assert
  that `Spa(A, A⁺)` is an adic space; this is why (vi) requires noetherian type.
- *Computation.* For a prime `p`, take `A = ℚ_p⟨T⟩`,
  `A⁺ = ℤ_p⟨T⟩` and `C = A[U]/(U² − T)` with its natural finite-module topology.
  The pair `(C, C⁺)` is isomorphic to `(ℚ_p⟨U⟩, ℤ_p⟨U⟩)` with `T ↦ U²`.
- *Non-example.* For a complete Hausdorff Huber ring `A`
  and a nonclosed ideal `J`, the quotient topology on the finite algebra `A/J` is not Hausdorff.
  The countable-variable example below shows why the noetherian hypothesis is needed.
- *Non-example.* Realize `K⟨X₀, X₁, …⟩` on
  `MvPowerSeries.IsRestricted.subring (R := K) (fun _ : ℕ ↦ 1)`, with the supplied Gauss norm,
  for a complete nontrivially normed ultrametric field `K` and `0 < ‖ϖ‖ < 1`.
  Index variables by `ℕ`, let `J` be their algebraic ideal, and put `f = Σₙ ϖⁿXₙ`.
  This ring is complete and Tate, the sum converges in its Gauss norm, and the coefficient
  of `Xₙ` is `ϖⁿ`. Finite partial sums lie in `J`. Every element of `J` belongs to
  an ideal generated by finitely many variables; its linear coefficients outside those
  variables vanish. All linear coefficients of `f` are nonzero, so `f ∈ closure J ∖ J`.
  Thus the cyclic, hence finite, algebra `R/J` has a non-Hausdorff quotient topology.
  The general implication for a nonclosed ideal remains `finiteAlgebra_test_nonClosedIdeal`.
- *Computation.* For a nonzero complete Huber ring `A` satisfying
  the construction's noetherian hypothesis, give `C = A × A` the natural finite-module
  topology and the diagonal `A`-algebra structure. Its plus ring is `A⁺ × A⁺`.
  The idempotent `(1, 0)` lies in this plus ring but outside the diagonal image of `A⁺`:
  it satisfies the monic polynomial `Z² − Z`. This distinguishes the integral closure
  from the image of the base plus ring, even though the underlying ring is unchanged.
- *Compatibility.* For `A` as above and `J ⊆ A` a closed ideal (every ideal is closed in the noetherian Tate case), `Huber.Pair.finiteAlgebra (A ⧸ J)` agrees with Tau Ceti
  `Huber.Pair.quotient`: same topology (quotient = natural topology) and same plus ring (integral
  closure of the image of `A⁺`).
- *Characterisation.* For `(D, D⁺)` a complete Huber pair over
  `(A, A⁺)`, `Hom_{(A,A⁺)}((C, C⁺), (D, D⁺)) ≃ (C →ₐ[A] D)`.

**Finiteness from monic relations with topologically nilpotent values (Huber 1.4.3).**
(*finiteness-criterion-monic-relations*) Let `(A, A⁺) → (B, B⁺)` be a morphism of complete Tate Huber
pairs which is of topologically finite type, presented by a quotient mapping `A⟨T₁,…,Tₙ⟩ → B` with
images `t₁,…,tₙ ∈ B⁺`. Prove that the morphism is finite (*finite-huber-pair-hom*) if and only if for
each `i` there is a monic polynomial `pᵢ ∈ A⁺[X]` such that `pᵢ(tᵢ)` is topologically nilpotent in
`B` (Huber96 §1.4, Lem. 1.4.3 and proof, p. 61; the reduction-mod-`ϖ` and completeness argument that
the criterion refines is Zavyalov-Q Appendix B.2, Lem. B.2.9, p. 45). For `A = K`,
`B = K⟨T⟩/(T² − ϖ)` with `t = T`: `p(X) = X²` gives `p(t) = ϖ` topologically nilpotent, so `B` is
finite over `K` (indeed of dimension `2`). For `B = K⟨T⟩` itself (`t = T`) no monic `p ∈ K°[X]`
works: `p(T)` has Gauss norm `1` (its leading coefficient), so `p(T) ∉ K⟨T⟩°°`, matching the
non-finiteness of `K → K⟨T⟩`; for `n = 0` the condition is empty and `B` is a quotient of `A`,
finite. The polynomials are required to have coefficients in `A⁺`, as in Huber's statement: the
direction (⇒) produces them because `B⁺` is integral over `A⁺` (*finite-huber-pair-hom*). The
Nakayama step of the direction (⇐) — a matrix with topologically
nilpotent entries expressing generators in terms of themselves forces them to vanish — is Tau Ceti
`eq_zero_of_isTopologicallyNilpotent_entries_of_forall_eq_sum_smul`. *Needs:* *finite-huber-pair-hom*;
Tau Ceti `TauCeti.Huber.IsTopologicallyFiniteType`, `TauCeti.Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.eq_zero_of_isTopologicallyNilpotent_entries_of_forall_eq_sum_smul`;
Mathlib `surjective_of_mkQ_comp_surjective`.
Lean: README target.

**Check (non-example).** Let `K`
be a complete nontrivially normed nonarchimedean field. For every monic
`q ∈ K°[X]`, its value at the supplied coordinate `T` of
`restrictedMvPowerSeriesCompletion 1 K` is not topologically nilpotent.
Thus the disc coordinate cannot satisfy the monic-relation condition above.

**Finite morphisms are proper (Huber 1.4.5(ii)).** (*finite-morphisms*) Let `f : X → Y` be a finite
morphism of adic spaces (*finite-morphism*) with `Y` analytic and covered by open affinoids with
complete stably sheafy rings (for instance `Y` locally noetherian; then so is `X`, its affinoid rings
being topologically of finite type over those of `Y`). Prove that `f` is proper
(*universally-closed-and-proper-morphism*) (Huber96 §1.4, (1.4.4) and Lem. 1.4.5(ii) with proof,
pp. 61–62, with Huber's remark that over an analytic base it follows from the valuative criterion
1.3.9, Huber96 §1.3, Cor. 1.3.9, pp. 54–55, applied in the last step). The analyticity of `Y` is
needed by this route through the valuative criterion (`X` is then analytic), and the stably sheafy
cover by `X ×_Y X` and the criterion as stated in *separated-proper-partially-proper*; Huber states
1.4.5(ii) for arbitrary adic spaces, deducing the specializing property from Huber–Knebusch [HuKn,
2.1.2, 2.1.6], and that general case is not asserted here. `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T²`, is
proper; closed embeddings into analytic spaces are proper (with *closed-embedding-finite*); the
scheme analogue is Mathlib's characterisation of finite morphisms of schemes as proper affine
morphisms (in `AlgebraicGeometry.IsFinite`). *Needs:*
*finite-morphism*; *finite-huber-pair-hom*; *separated-proper-partially-proper*;
*adic-valuation-rings-and-centres*; *universally-closed-and-proper-morphism*;
*finite-type-morphism-classes*.
Lean: `IsFinite.isProper`.

**Closed embeddings are finite (Huber 1.4.5(iii)).** (*closed-embedding-finite*) Let `i : Z → X` be a
closed embedding of adic spaces in the sense of Huber96 (1.4.1) — a closed adic subspace cut out by
an ideal sheaf, retained as a ringed space (*closed-adic-subspaces-and-embeddings*). Prove that `i`
is a finite morphism (*finite-morphism*) (Huber96 §1.4, (1.4.1) and Lem. 1.4.5(iii), pp. 60–62, with
the affinoid description `Spa A/J` of closed adic subspaces, `A/J := (A^▷/J, (A⁺/J ∩ A⁺)^c)` with the
integral closure, used in the proof; Zavyalov-Q Appendix B.6, Cor. B.6.9, p. 55, the affinoid form of
closed immersions in the strongly noetherian Tate case, and proof of Cor. B.6.10, p. 56, closed
immersions are finite). The origin `Spa(K, K°) → Spa(K⟨T⟩, K°⟨T⟩)`, `T ↦ 0`, is finite (and proper,
*finite-morphisms*). No noetherian or sheafiness hypothesis is added here because the definition
of a closed embedding already carries what the proof uses: the ideal sheaf is admissible, so on an
affinoid cover `U = Spa(A, A⁺)` the ideal `J_U` is closed and `A/J_U` is sheafy, and
`(A, A⁺) → (A/J_U, (A⁺/(J_U ∩ A⁺))^c)` is finite (`A/J_U` is the quotient of `A = A⟨⟩` by a closed
ideal, `A → A/J_U` is integral, and `(A/J_U)⁺` is by definition the integral closure of the image
of `A⁺`); for a closed ideal `J` with `A/J` not sheafy there is no closed adic subspace to speak
of. *Needs:* *closed-adic-subspaces-and-embeddings*; *finite-morphism*;
*finite-huber-pair-hom*; Tau Ceti `TauCeti.Huber.Pair.quotient`.
Lean: `IsFinite.of_isClosedImmersion`.

**Topological nilpotence in a fibre spreads to a rational neighbourhood (Huber 1.4.8).**
(*fibre-nilpotence-spreading*) Let `(A, A⁺) → (B, B⁺)` be a morphism of complete Tate Huber pairs
with `B` topologically of finite type over `A` as pairs (Huber's hypothesis; for affinoids of finite
type over a strongly noetherian base this follows from Zavyalov-Q B.2.17),
`g = Spa(φ) : Spa(B, B⁺) → Spa(A, A⁺)`, `x ∈ Spa(A, A⁺)`, and `B ⊗̂_A k(x)` the completion of
`B ⊗_A k(x)`, `k(x)` the fraction field of `A/supp(x)` with the valuation topology of `x` (so that
`B ⊗̂_A k(x)` is the ring of global sections of the fibre `Spa(B) ×_{Spa A} Spa κ(x)`). Let `b ∈ B`
be an element whose image in `B ⊗̂_A k(x)` is topologically nilpotent. Prove that there is a
rational subset `U ⊆ Spa(A, A⁺)` containing `x` such that the image of `b` in
`O(g⁻¹(U)) = B ⊗̂_A O(U)` is topologically nilpotent (Huber96 §1.4, Lem. 1.4.8, p. 63, and its proof, pp. 63–64). For `g` the identity of
`Spa(A, A⁺)` and `b ∈ A` with `b(x) = 0` in `k(x)^∧`, `b` is topologically nilpotent on the rational
neighbourhood `{|b| ≤ |ϖ|}` of `x`, where `ϖ` is a pseudo-uniformiser of `A`. *Needs:*
*completed-tensor-product*; *completed-tensor-rational-localisation*; *affinoid-fibre-product*.
Lean: README target.

**Finiteness near a point with proper fibre (Huber 1.4.6–1.4.7).** (*finite-from-proper-fibre*) Let
`f : X = Spa(B, B⁺) → Y = Spa(A, A⁺)` be a morphism of finite type between analytic affinoid adic
spaces whose ring map `(A, A⁺) → (B, B⁺)` is topologically of finite type (automatic when `A` is a
strongly noetherian Tate ring, Zavyalov-Q B.2.17; Huber (1.2.1) under his standing assumption).
Prove that for every `y ∈ Y` such that the fibre `X ×_Y Spa κ(y) → Spa κ(y)` (*fibre-over-point*) is
proper, there is an open neighbourhood `U` of `y` such that `f⁻¹(U) → U` is finite; in particular, if
`f` is proper then `f` is finite, and together with *finite-morphisms*, `f` is proper iff finite
(Huber96 §1.4, Prop. 1.4.6 and Lem. 1.4.7, p. 62, with the proof of Lem. 1.4.7, pp. 62–63; the transfer
of the valuative criterion from `f_y` to the scheme morphism `g` refers to [Hu4, 3.12.5]). For
`K = ℂ_p`, the morphism `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T²` (finite) has proper fibres; conversely a
proper morphism of finite type between affinoid rigid spaces is finite (the classical statement for
affinoids, via the comparison functor of layer R1). *Needs:* *fibre-nilpotence-spreading*;
*finiteness-criterion-monic-relations*; *affinoid-fibre-product*; *completed-tensor-product*;
*finite-morphism*; *universally-closed-and-proper-morphism*; *proper-base-change*;
*fibre-over-point*; AdicSpaces layers 0.5 and 4.1 (affinoid fields are stably sheafy); Mathlib
the valuative criterion for proper morphisms of schemes and the characterisation of finite
morphisms of schemes as proper affine morphisms (in `AlgebraicGeometry.ValuativeCriterion` and
`AlgebraicGeometry.IsFinite`).
Lean: README target.

**Finiteness descends along finite faithfully flat affinoid covers (Huber 1.4.9).**
(*finiteness-faithfully-flat-descent*) Let `T = Spa(A, A⁺)` be an affinoid adic space with `A` a
complete strongly noetherian Tate ring (Huber: `T` affinoid under his noetherian standing
assumption; the strongly noetherian Tate case is the one used, in
*quasi-finite-and-finiteness-criteria*), `h : T' → T` a finite morphism such that `O_{T'}(T')` is
faithfully flat over `A`, and `f : S → T` a morphism of adic spaces locally of finite type, with
`S' = S ×_T T' → T'` its base change (*fibre-products-existence* (a)). Prove that if `S' → T'` is
finite, then `f` is finite (Huber96 §1.4, Lem. 1.4.9 and proof, p. 65; Zavyalov-Q Appendix B.4, Lem.
B.4.10, p. 51, descent of isomorphy of finite morphisms along surjective flat maps of strongly
noetherian Tate affinoids, the last step; Zavyalov-Q Appendix B.3, Lem. B.3.4, p. 48, the descended
algebra carries the natural topology). The module-theoretic core — a module is finite if it becomes
finite after a faithfully flat base change — is Mathlib
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`; what is proved here is its adic
packaging: that the descended `O_S`-algebra is the one with the natural topology and that
`S → T` is finite as a morphism of adic spaces. The finite faithfully flat cover `W → V` used in the
proof of Huber 1.5.5 (to make residue fields purely inseparable) is an instance of `h`. *Needs:*
*finite-morphism*; *finite-huber-pair-hom*; *finite-algebra-over-affinoid*;
*fibre-products-existence*; *completed-tensor-product*; *base-change-stability*;
*finite-algebra-tensor-complete*; *affinoid-fibre-product*; *fibre-product-points*;
*finite-morphisms*; Mathlib `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`.
Lean: README target.

**Base change of a finite algebra over a complete Tate ring needs no completion when the rings
are noetherian or the algebra is finite projective.**
(*finite-algebra-tensor-complete*) Let `ψ : (A, A⁺) → (B, B⁺)` be a finite morphism of complete Tate
Huber pairs (*finite-huber-pair-hom*) and `φ : A → C` a continuous homomorphism to a complete Tate
ring `C`. Give `B ⊗_A C` the tensor-product topology (the topology of *completed-tensor-product*
before completion). Prove: (i) this is the natural `C`-module topology of the finite `C`-module
`B ⊗_A C` (Mathlib `moduleTopology`) (Zavyalov-Q Appendix B.3, Lem. B.3.5, p. 48); hence the
completed tensor product `B ⊗̂_A C` is the quotient of `B ⊗_A C` by the closure of `0`, a finite
`C`-algebra with its natural topology (a finite module over the complete first-countable ring `C`
is a quotient of `Cⁿ` with the quotient topology, and `Cⁿ` modulo a closed submodule is complete and
Hausdorff), while `B ⊗_A C` itself need not be Hausdorff (Zavyalov-Q Appendix B.3, Rem. B.3.3 and
the paragraph before Lem. B.3.5, p. 48; the first Check below); (ii) if `A` and
`C` are noetherian, or if `B` is a finite projective `A`-module, then `B ⊗_A C` is complete and
Hausdorff, so the canonical map `B ⊗_A C → B ⊗̂_A C` to the completed tensor product is an
isomorphism of topological rings, and `(C, C⁺) → (B ⊗_A C, integral closure of the image of C⁺ ⊗ B⁺)`
is a finite morphism of complete Huber pairs (Zavyalov-Q Appendix B.3, Lem. B.3.6 and its proof,
pp. 48–49, for the noetherian case; Zavyalov-Q §5.3, footnote 24, p. 36, for the finite flat
(projective) case; KL15 §2.2, Lem. 2.2.12(a), p. 32: finite projective modules over a Banach ring are
closed direct summands of free modules with the natural topology); (iii) consequently, if `A` is
strongly noetherian or `B` is a finite projective `A`-module, then for `f₁, …, f_n, g ∈ A` generating
the unit ideal the map `B ⊗_A A⟨f/g⟩ → B⟨ψ(f)/ψ(g)⟩` is an isomorphism of topological rings: the
preimage of the rational subset `V = R(f/g)` under `Spa(B, B⁺) → Spa(A, A⁺)` is the rational subset
`R(ψ(f)/ψ(g))`, with ring `B ⊗_A O(V)` (Zavyalov-Q Appendix B.3, Cor. B.3.7, p. 49). No claim is
made that `f⁻¹(Spa A)` is affinoid for a finite morphism `f` of adic spaces over a non-noetherian
sheafy `Spa(A, A⁺)` (Zavyalov-Q Rem. B.2.19). For `A = ℚ_p⟨T⟩`, `B = A[S]/(S² − T)` and
`V = {|T| ≤ |p|}`, `B ⊗_A A⟨T/p⟩ = ℚ_p⟨T/p⟩[S]/(S² − T)` is already complete, and the preimage of
`V` in `Spa B` is `{|S²| ≤ |p|}`. The finiteness hypothesis cannot be dropped: for `B = A⟨X⟩`
(topologically of finite type, not finite) the tensor product `A⟨X⟩ ⊗_A C` is not complete in
general and must be completed to `C⟨X⟩`. The module-theoretic inputs of (ii) are the library's:
completeness and Hausdorffness of finite modules over a complete noetherian Tate ring in the module
topology (Tau Ceti `completeSpace_moduleTopology`, `IsTateRing.t2Space_moduleTopology`) and the
finiteness and projectivity of base changes (Mathlib `Module.Finite.base_change`,
`Module.Projective.tensorProduct`); what is proved here is the identification of the two topologies
in (i), the Huber-pair structure and the rational-preimage formula (iii). *Needs:*
*finite-huber-pair-hom*; *completed-tensor-product*; *completed-tensor-rational-localisation*; Tau
Ceti `TauCeti.completeSpace_moduleTopology`, `TauCeti.Huber.IsTateRing.t2Space_moduleTopology`;
Mathlib `moduleTopology`, `IsModuleTopology.isOpenQuotientMap_of_surjective`,
`Module.Projective.tensorProduct`, `Module.Finite.base_change`.
`Huber.Pair.Hom.IsFinite.isModuleTopology_tensorTopology` carries the complete Tate
pairs, finite `ψ` and continuous `A → C` of this target and identifies the tensor topology
on `B ⊗_A C` with its natural `C`-module topology.
`Huber.Pair.Hom.IsFinite.bijective_completedTensor_tmul` adds either noetherianness of
both `A`, `C` or finite projectivity of `B` over `A`, and concludes bijectivity of the
canonical `completedTensor.tmul`, which is then a homeomorphic ring isomorphism.

Lean: README target.

**Checks.** For a prime `p` let `A = ℚ_p⟨T⟩`, `A⁺ = ℤ_p⟨T⟩` and `B = A/(T) = ℚ_p`, so that
`(A, A⁺) → (ℚ_p, ℤ_p)` is finite.

- *Non-example.* Let `D = C(ℤ_p, ℚ_p)` with the supremum norm, `D⁺ = C(ℤ_p, ℤ_p)`, and `A → D`
  the continuous map `T ↦ h`, `h(x) = x`. Then `B ⊗_A D = D/hD`, and `hD` is not closed: for
  `u(x) = p^{⌊v_p(x)/2⌋}` (`u(0) = 0`) the truncations `u_N = u·1_{ℤ_p ∖ p^N ℤ_p}` lie in `hD` and
  converge uniformly to `u`, while `|u(pⁿ)/pⁿ| = p^{n − ⌊n/2⌋}` is unbounded, so `u ∉ hD`. The
  closure of `hD` is the kernel of evaluation at `0`, so `B ⊗_A D` is not Hausdorff and
  `B ⊗̂_A D = ℚ_p` through evaluation at `0`. Neither hypothesis of (ii) holds: `D` has infinitely
  many idempotents, so it is not noetherian, and `B` is a torsion `A`-module, so it is not projective.
- *Computation.* With the noetherian `C = ℚ_p⟨U⟩` and `T ↦ U²`, `B ⊗_A C = ℚ_p[U]/(U²)` is
  finite-dimensional, hence complete, as (ii) predicts.
- *Computation.* With the free `A`-algebra `B' = A[S]/(S² − T)` in place of `B`, `B' ⊗_A D = D ⊕ D·S`
  is complete over the non-noetherian `D` of the non-example, by the finite projective case of (ii).

The finite-algebra maps have characteristic equations
`Pair.finiteAlgebra.algebraHom_toRingHom`, `homEquiv_apply` and `map_toRingHom`:
continuity and integrality change no underlying element map.

- *Degenerate.* The finite-algebra structure map
  for C = A is the identity ring homomorphism.
- *Computation.* For C = A/J its kernel is J.
- *Non-example.* For nonzero A and C = A × A
  with the natural topology, the structure map is a ↦ (a,a), and is not surjective.
- *Degenerate.* The identity algebra map gives
  the identity of the associated finite Huber pair.
- *Compatibility.* An involutive algebra
  automorphism remains involutive as a morphism of finite Huber pairs.
- *Computation.* An A-algebra endomorphism f
  sends a·x² − b·y³ to a·f(x)² − b·f(y)³ through `finiteAlgebra.map`.

The finite-algebra comparison `Pair.finiteAlgebra.homEquiv` forgets continuity to
an algebra homomorphism and recovers it from the finite natural topology. Its inverse
therefore preserves the entire underlying function, including its kernel (Huber96
§1.4, (1.4.2), printed p. 61, with the completeness and noetherian-type assumptions above).

*Checks for the comparison maps and their structures:*

- Recovering a continuous map from an algebra homomorphism evaluates ax²−by³ as a·f(x)²−b·f(y)³.
- The recovered continuous pair map has exactly the kernel of the given algebra homomorphism.
- For zero target algebra, the recovered map has the whole source as kernel.

### R0.14 quasi-finite morphisms

**Locally quasi-finite and quasi-finite morphisms of adic spaces.** (*quasi-finite-morphism*) A
morphism `f : X → Y` of adic spaces is locally quasi-finite if it is locally of weakly finite type
(*finite-type-morphism-classes*) and for every `y ∈ Y` the fibre `f⁻¹(y)` is a discrete subspace of
`|X|`; it is quasi-finite if moreover it is quasi-compact (Huber96 §1.5, Def. 1.5.1, p. 66).
Conventions: discreteness is of the fibre with the subspace topology of `|X|` (not of the fibre adic
space `X ×_Y Spa κ(y)`); for `f` of weakly finite type between analytic adic spaces, quasi-finite is
equivalent to finiteness of all fibres (*quasi-finite-fibre-criteria*; Huber96 §1.5, Lem. 1.5.2,
p. 66, conditions (b) and (f)). Zavyalov-Q §5.3, proof of Prop. 5.3.1, p. 36, uses Huber's Prop. 1.5.5
(for quotients of adic spaces by finite groups) as the adic replacement of Zariski's main theorem.
In `AdicSpace`, define `LocallyQuasiFinite f` as the class: locally of weakly finite type with
discrete fibres, and `QuasiFinite f` as `LocallyQuasiFinite f ∧ QuasiCompact f`; prove
discreteness of fibres (each fibre `f⁻¹{y}` is discrete in `|X|`),
`QuasiFinite.finite_preimage_singleton` (every fibre of a quasi-finite morphism is finite,
without analyticity assumptions, Huber96 Lemma 1.5.2(a)–(b) and the sentence following its
conditions, p. 66),
`LocallyQuasiFinite.comp`
(composites of locally quasi-finite morphisms are locally quasi-finite),
`LocallyQuasiFinite.baseChange` (stable under base change when `f` is locally of finite type or `g`
is adic, Huber 1.5.3), `IsFinite.quasiFinite` (finite morphisms locally of weakly finite type are
quasi-finite), `LocallyQuasiFinite.of_isOpenImmersion` (open embeddings are locally quasi-finite),
the stalk criterion (the statement of *quasi-finite-stalk-criterion*),
using `IsFinite.iff_isProper_and_quasiFinite` from
*quasi-finite-and-finiteness-criteria* and `Unramified.locallyQuasiFinite` from
*unramified-locally-quasi-finite*. *Needs:* *finite-type-morphism-classes*; Mathlib
`AlgebraicGeometry.LocallyQuasiFinite`.
Lean: `AdicSpace.LocallyQuasiFinite`, `LocallyQuasiFinite.iff_finite_fibres`.

**Checks.**

- The identity of every adic space is quasi-finite.
- A morphism with empty source is quasi-finite, including its
  quasi-compactness condition.
- A locally quasi-finite morphism which is not
  quasi-compact is not quasi-finite; discreteness of fibres alone does not suffice.
- *Computation.* With `2 ∈ K^×`, `Spa(K⟨T⟩) → Spa(K⟨S⟩)`,
  `S ↦ T²`, is quasi-finite: the fibre over the Gauss point is the Gauss point, and over the
  classical point `S = a` it consists of the points `T = ±√a` (one point if `a = 0`, and a single
  point with residue field `K(√a)` if `a` is not a square in `K`). Over a rank-two point the fibre
  is still discrete: for the type-5 point `y` specialising the Gauss point of the `S`-disc in the
  direction `S = 0` (the valuation ring of `k(T)` at `T = 0` on the residue field `k(S)`,
  `S = T²`), the fibre is the single type-5 point of the `T`-disc in the direction `T = 0`
  (`T = 0` is the only place of `k(T)` over `S = 0` in `k(S)`, totally ramified of degree `2`), and
  for the direction `S = a` with `a ∈ k^×` a square the fibre has two points `T = ±√a`
  when the residue characteristic is not `2`. In residue characteristic `2` these coincide:
  `T² − 1 = (T − 1)²` over `𝔽₂`, even when `2` is invertible in `K = ℚ₂`.
- *Negative control.* For the squaring
  map of closed discs over `ℚ₂`, `LocallyQuasiFinite` holds and the fibre over
  the rank-two specialization of the Gauss point in direction `S = 1` has
  exactly one point. This is the direction `T = 1`, since `T² − 1 = (T − 1)²` over `𝔽₂`.
- *Computation.* The same map over `ℚ₃`
  is locally quasi-finite and this fibre has exactly two points, in directions
  `T = 1` and `T = −1`. In both Checks the target point specializes the
  supplied radius-one Gauss point and satisfies `|S − 1| < 1`; these conditions
  specify the rank-two point, rather than a classical point inside that residue disc.
  The ring isomorphisms identifying the two affinoid presentations with Tate
  algebras preserve topology and plus rings, and the pair map is fixed on all polynomials.
- *Non-example.* The projection of the closed bidisc
  `Spa(K⟨T₁,T₂⟩) → Spa(K⟨T₁⟩)` is not locally quasi-finite: its fibres are discs, which are not
  discrete.
- *Non-example.* The disjoint union of countably
  many copies of `Spa(K, K°)`, mapped to `Spa(K, K°)`, is locally quasi-finite (fibres discrete) but
  not quasi-finite (not quasi-compact; the fibre is infinite): "finite fibres" is the wrong
  definition of local quasi-finiteness.
- *Degenerate.* Open embeddings and identities are locally
  quasi-finite; affinoid open embeddings are quasi-finite.
- *Compatibility.* For a finite morphism of complete Tate
  pairs `φ : (A, A⁺) → (B, B⁺)`, `Spa φ` is quasi-finite and `φ` is quasi-finite in Mathlib's sense
  (`Algebra.QuasiFinite`, which a module-finite algebra satisfies); for schemes Mathlib's
  `AlgebraicGeometry.LocallyQuasiFinite` is likewise equivalent to discrete fibres for morphisms
  locally of finite type.

**Fibre criteria for quasi-finiteness (Huber 1.5.2).** (*quasi-finite-fibre-criteria*) Let
`f : X → Y` be a morphism of weakly finite type (quasi-compact and locally of weakly finite type)
between analytic adic spaces. Prove that the following are equivalent: (a) `f` is quasi-finite; (b)
`f⁻¹(y)` is finite for every `y ∈ Y`; (c) `f⁻¹(y)` is finite for every maximal point `y ∈ Y`; (d)
`k(x)^∧` is a finite extension of `k(f(x))^∧` for every `x ∈ X`; (e) the same for every maximal
point `x ∈ X`; (f) for every maximal point `y` of `Y`, `X ×_Y Spa κ(y) → Spa κ(y)` is finite.
(Huber96 §1.5, Lem. 1.5.2 and proof, p. 66; the book treats the analytic case via BGR 6.1.2 Cor. 2
and 6.3.4 Prop. 1). Huber's statement adds that (a), (b), (d) are equivalent without the analyticity
hypothesis; his proof covers only the analytic case, and that extension is not part of this target
(the direction (a) ⇒ (b) is general: `f⁻¹(y)` is pro-constructible in the quasi-compact `f⁻¹(V)`
for an affinoid `V ∋ y`, hence quasi-compact for the constructible topology, and a quasi-compact
discrete space is finite; the direction (b) ⇒ (a) uses that the residue field extensions of a
finite fibre are algebraic, which is where analyticity enters). For `S ↦ T²` on discs every fibre
has at most two points and all residue field extensions have degree `≤ 2`, so all six conditions
hold; the projection of the closed bidisc `Spa K⟨T₁, T₂⟩ → Spa K⟨T₁⟩ = D` is not quasi-finite at any
point, its fibres being discs (it fails (b), (c), (d), (e), (f) alike). *Needs:*
*quasi-finite-morphism*;
*finite-morphism*;
*fibre-products-existence*; *fibre-product-points*; *finite-type-morphism-classes*;
*affinoid-noether-normalisation* (RigidAnalyticGeometry §1.2); *affinoid-power-bounded-integral*
(RigidAnalyticGeometry §2.3); *fibre-over-point*; Mathlib
`exists_finite_inj_algHom_of_fg`.
Lean: (a) ⇔ (b) `LocallyQuasiFinite.iff_finite_fibres`.

**Check (compatibility).**
if `X` is spectral and `E ⊆ X` is pro-constructible in Tau Ceti's sense, and
the subspace topology on `E` is discrete, then `E` is finite. This tests the
topological implication used for quasi-finite fibres; discreteness refers to
the original subspace topology.

**Stalk criterion for local quasi-finiteness (Huber 1.5.4).** (*quasi-finite-stalk-criterion*) Let
`f : X → Y` be a morphism locally of weakly finite type between analytic adic spaces. Prove that `f`
is locally quasi-finite if and only if for every maximal point `x ∈ X` the local ring `O_{X,x}` is a
finite `O_{Y,f(x)}`-module; if `f` is locally of finite type, this is further equivalent to: every
maximal point `x ∈ X` has open neighbourhoods `U ∋ x`, `V ⊇ f(U)` with `f|_U : U → V` finite (Huber96
§1.5, Prop. 1.5.4 and proof, p. 68). For `S ↦ T²` the stalk of the source at `T = 0` is a free module
of rank `2` over the stalk of the target at `S = 0`. *Needs:* *quasi-finite-fibre-criteria*;
*fibre-nilpotence-spreading*; *finite-morphism*; *quasi-finite-morphism*.
Lean: README target.

**Quasi-finite and proper equals finite (Huber 1.5.5).** (*quasi-finite-and-finiteness-criteria*)
Let `f : X → Y` be a morphism locally of finite type between analytic adic spaces, with `Y` locally
noetherian (*locally-noetherian-adic-space*; for analytic `Y`: locally `Spa` of strongly noetherian
Tate rings, which is Huber's standing assumption (1.1.1) for analytic spaces, and is needed by
*finiteness-faithfully-flat-descent* and the valuative criterion). Prove that `f` is finite
(*finite-morphism*) if and only if `f` is quasi-finite (*quasi-finite-morphism*) and proper
(*universally-closed-and-proper-morphism*; properness in the sense of Huber 1.3.2: +weakly finite
type, separated, universally closed) (Huber96 §1.5, Prop. 1.5.5 and proof, pp. 68–70; Zavyalov-Q
§5.3, proof of Prop. 5.3.1, p. 36, for its use as the adic replacement of Zariski's main theorem in
proving that quotients by finite groups are finite). `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T²`, is proper,
quasi-finite and finite; the rational embedding `{|T| ≤ |ϖ|} ⊆ D` is quasi-finite and not proper
(not partially proper), hence not finite; the open unit disc `B ⊆ D` is locally quasi-finite and
partially proper but not quasi-compact, hence not finite. Mathlib's characterisation of finite
morphisms of schemes as proper locally quasi-finite morphisms (in `AlgebraicGeometry.IsFinite`) is
the scheme analogue. *Needs:*
*quasi-finite-morphism*; *finite-morphism*; *finite-morphisms*;
*universally-closed-and-proper-morphism*; *quasi-finite-fibre-criteria*;
*finite-from-proper-fibre*; *finiteness-faithfully-flat-descent*;
*adic-valuation-rings-and-centres*; *valuative-criterion-separated*; *fibre-product-points*;
*base-change-stability*; *locally-noetherian-adic-space*.
Lean: `IsFinite.iff_isProper_and_quasiFinite`.

**Partially proper locally quasi-finite morphisms are finite near closures of points (Huber
1.5.6).** (*partially-proper-quasi-finite-local-finiteness*) Let `f : X → Y` be a morphism locally
of finite type between analytic adic spaces, with `X` quasi-separated, `Y` quasi-compact and
quasi-separated, and `Y` locally noetherian (Huber's standing assumption (1.1.1); needed by
*quasi-finite-and-finiteness-criteria*). Prove that `f` is locally quasi-finite and partially proper
if and only if every `x ∈ X` has open subspaces `U ⊇ closure{x}` and `V ⊇ closure{f(x)}` with
`f(U) ⊆ V` and `f|_U : U → V` finite (Huber96 §1.5, Prop. 1.5.6 and proof, pp. 70–71). For the open
embedding of the open unit disc `B` into the closed unit disc `D` (partially proper and locally
quasi-finite), choose `n ≥ 1` with `|T(x)|ⁿ ≤ |ϖ|`. The condition holds with
`U = V = {|T|^{2n} ≤ |ϖ|}`: `|T(x)|^{2n} ≤ |ϖ|² < |ϖ|`, and the strict inequality
persists at specializations. No density of `|K^×|` is needed.
This proposition is the input of Huber's
Lemma 1.5.9 (Huber96 §1.5, Lem. 1.5.9, pp. 73–75, owned by layer R1), comparing rigid and adic
partial properness for locally quasi-finite maps without discreteness of the valuation, proved from
it and Lemma 1.5.10 (*maximal-point-closure-rational*). *Needs:* *valuation-ring-space-spectral*;
*partially-proper-closure-quasi-compact*; *separated-proper-partially-proper*;
*quasi-finite-and-finiteness-criteria*; *finite-morphisms*; *quasi-finite-morphism*;
*partially-proper-morphism*; *quasi-finite-stalk-criterion*; *adic-valuation-rings-and-centres*;
*locally-noetherian-adic-space*; Mathlib `compactSpace_withConstructibleTopology`.
Lean: README target.

**Checks.**

- *Two-term radius computation.* For `0 < |ϖ| < 1`
  and `n > 0` on the closed adic disc, the closure of `{|T|ⁿ ≤ |ϖ|}` lies in
  `{|T|^{2n} < |ϖ|}`, which lies in the open disc. The latter is represented by
  an open immersion with image `⋃_{m>0}{|T|ᵐ ≤ |ϖ|}`, and its structure map
  satisfies `IsPartiallyProper`. The inequalities use each adic point’s valuation,
  including points of higher rank.

### R0.15 continuous differentials

**Module of continuous differentials of a topologically finite type map.**
(*continuous-differentials*) Let `φ : A → B` be a continuous homomorphism of complete Huber rings
(complete Hausdorff f-adic rings) which is topologically of finite type (Tau Ceti
`TauCeti.Huber.IsTopologicallyFiniteType`), with `A` of noetherian type
(*noetherian-type-huber-ring*: a noetherian ring of definition, or strongly noetherian Tate; this
includes every ring of Huber's standing class, finite type over a noetherian ring of definition,
strongly noetherian Tate, or discrete — Huber96 (1.1.1)(a)–(c), p. 37, *huber-standing-class*);
then `B` and `B ⊗̂_A B` are of noetherian type
(*topologically-finite-type-noetherian-type*, *completed-tensor-noetherian-stability*), their ideals
are closed (*noetherian-type-ideals-closed*) and finite modules with the natural topology are
complete and Hausdorff — in the noetherian-ring-of-definition case by
*noetherian-rod-module-complete*, in the strongly noetherian Tate case by Tau Ceti
`completeSpace_moduleTopology`, `IsTateRing.t2Space_moduleTopology` and
`isClosed_of_isNoetherian`, and in the discrete case because the module topology is discrete. Let
`m : B ⊗̂_A B → B` be the continuous extension of `b ⊗ b' ↦ bb'` to the completed tensor product
(*completed-tensor-product*) and `I = ker m`. The *module of continuous differentials* is
`Ωᶜ_{B/A} := I/I²`, a `B`-module via `(B ⊗̂_A B)/I ≅ B`, with the natural `B`-module topology, and
`d = d_{B/A} : B → Ωᶜ_{B/A}`, `d(b) =` class of `1 ⊗ b − b ⊗ 1` (Huber96 §1.6, Def. 1.6.1 and the
paragraph after it, p. 76; Huber96 §1.6, (1.6.2) and its proof, pp. 76–77, for the definition
`Ωᶜ = I/I²` and properties (a), (c), (d), the closedness of the ideal being where the noetherian
hypothesis enters, through Huber94 Lemmas 2.3–2.4; Conrad-AWS §3.1, Ex. 3.1.4, for the
completed-diagonal definition for affinoid algebras and the fact that `I/I²` is finite and differs
from the algebraic Kähler differentials; FK Ch. I, §5.1(a), for continuous derivations). Properties:
(a) for every finite `N ⊆ B` with `A[N]` dense in `B`, `I` is generated by the `1 ⊗ n − n ⊗ 1`
(`n ∈ N`); hence `Ωᶜ_{B/A}` is a finitely generated `B`-module generated by `d(N)` (FK Ch. I,
§5.1(d), Cor. 5.1.11, the formal analogue). (b) `d` is a continuous `A`-derivation and is universal:
for every complete Hausdorff topological `B`-module `M` and every continuous `A`-derivation
`D : B → M` there is a unique continuous `B`-linear `u : Ωᶜ_{B/A} → M` with `u ∘ d = D`. (c) If
`A⟨X₁,…,Xₙ⟩_M → B` is a quotient mapping with kernel `𝔞`, then
`Ωᶜ_{B/A} ≅ (⊕ᵢ B dXᵢ)/(B-span of Σᵢ (∂P/∂Xᵢ) dXᵢ, P ∈ 𝔞)`, where `∂/∂Xᵢ` are the termwise partial
derivatives (which preserve `A⟨X⟩_M`); in particular `Ωᶜ_{A⟨X⟩_M/A}` is free with basis
`dX₁,…,dXₙ` (FK Ch. I, §5.1(d), Prop. 5.1.10, the formal analogue for `A⟨⟨X₁,…,Xₙ⟩⟩`; Zavyalov24 §5,
proof of Lem. 5.9, for the public use of the presentation formula). (d) If `B` is a finite
`A`-module, the canonical `B`-linear map `Ω[B⁄A] → Ωᶜ_{B/A}` from Mathlib's `KaehlerDifferential`
(induced by `d`) is an isomorphism. Under the noetherian hypothesis `Ωᶜ_{B/A}` is complete and
Hausdorff; without it (non-noetherian `A`) the ideal generated by the `1 ⊗ n − n ⊗ 1` need not be
closed and none of (a)–(d) is asserted. The coherent sheaf `Ω¹_{X/Y}` on a locally noetherian
analytic adic space is glued from these modules by the localisation compatibility
(`ContinuousKaehlerDifferential.localizationEquiv`). In `Huber`, define `ContinuousKaehlerDifferential A B` as
`Ωᶜ[B⁄A] := I/I²`, `I = ker(B ⊗̂_A B → B)`, for complete Hausdorff Huber rings
`A`, `B` with an `A`-algebra structure on `B` and
`[IsAdicHom (algebraMap A B)]`. This hypothesis also applies to `D`, `fromKaehler`
and their module instances and Checks. For the finite-type statements it follows from
`IsTopologicallyFiniteType.isAdicHom`; it ensures that the completed diagonal has
the specified tensor topology. The multiplication map is
`Pair.completedTensor.lift (RingHom.id B) (RingHom.id B) continuous_id continuous_id rfl`.
Define `ContinuousKaehlerDifferential.D` as the derivation `d : B → Ωᶜ[B⁄A]`,
`b ↦ [1 ⊗ b − b ⊗ 1]`; prove `ContinuousKaehlerDifferential.continuous_D` (`d` is continuous for the
natural topology, for `A` of noetherian type and `A → B` topologically of finite type), `ContinuousKaehlerDifferential.lift` (for `M` complete Hausdorff and `D` a
continuous `A`-derivation `B → M`, the continuous `B`-linear `u : Ωᶜ[B⁄A] → M` with `u ∘ d = D`),
`ContinuousKaehlerDifferential.lift_comp_D` (`(lift D) ∘ d = D`),
`ContinuousKaehlerDifferential.hom_ext` (two continuous `B`-linear maps out of `Ωᶜ[B⁄A]` agreeing
on `d(B)` are equal), `ContinuousKaehlerDifferential.fg` (`Ωᶜ[B⁄A]` is a finitely generated
`B`-module, generated by `d(N)` for any finite `N` with `A[N]` dense),
`ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis` (the basis `(dXᵢ)` of
`Ωᶜ[A⟨X⟩_M⁄A]`), `ContinuousKaehlerDifferential.presentationEquiv`
(`Ωᶜ[B⁄A] ≅ (⊕ B dXᵢ)/⟨dP : P ∈ 𝔞⟩` for a presentation `B = A⟨X⟩_M/𝔞`),
`ContinuousKaehlerDifferential.fromKaehler` (the surjective `B`-linear map `Ω[B⁄A] → Ωᶜ[B⁄A]`
induced by the derivation `d`), `ContinuousKaehlerDifferential.fromKaehler_bijective_of_finite` (if
`B` is a finite `A`-module, `fromKaehler` is bijective, Huber (1.6.2)(iii)),
`ContinuousKaehlerDifferential.t2Space_of_isNoetherianRing` (if `B` is noetherian, `Ωᶜ[B⁄A]` is
complete and Hausdorff), `ContinuousKaehlerDifferential.map` (a commutative square with
adic coefficient maps `A → B`, `A' → B'`
induces `B' ⊗_B Ωᶜ[B⁄A] → Ωᶜ[B'⁄A']`, with `map_id` and
`ContinuousKaehlerDifferential.map_comp`: for two composable continuous squares
of complete Hausdorff Huber rings with adic coefficient maps and compatible scalar towers, the iterated map
on b″ ⊗ (b′ ⊗ ω) equals the composite-square map on b″f(b′) ⊗ ω, for every ω),
`ContinuousKaehlerDifferential.baseChangeEquiv` (for `A → A'` adic with `A'` complete
Hausdorff and of noetherian type,
`Ωᶜ[(B ⊗̂_A A')⁄A'] ≅ (B ⊗̂_A A') ⊗_B Ωᶜ[B⁄A]`, Huber 1.6.3) and
`ContinuousKaehlerDifferential.localizationEquiv` (for a rational localisation `B → B⟨T/s⟩`,
`Ωᶜ[B⟨T/s⟩⁄A] ≅ B⟨T/s⟩ ⊗_B Ωᶜ[B⁄A]`, Huber 1.6.3; this is the gluing datum for the sheaf
`Ω¹_{X/Y}` of AdicSpacesPartIII layer R3). `Ωᶜ_{K⟨T⟩/K}` is free of rank `1` on `dT`, and
Mathlib's `Ω[K⟨T⟩⁄K]` need not agree with it: for `K = ℚ_p` it is not finitely generated (the
non-example below), while for `K` perfect of characteristic `p` it is also free on `dT` (the
positive control below). *Needs:*
*completed-tensor-product*;
*completed-tensor-product-universal-property*; *noetherian-type-huber-ring*;
*topologically-finite-type-noetherian-type*; *completed-tensor-noetherian-stability*;
*noetherian-type-ideals-closed*; *noetherian-rod-module-complete*; Tau Ceti
`TauCeti.Huber.IsTopologicallyFiniteType`, `TauCeti.Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.isClosed_of_isNoetherian`, `TauCeti.completeSpace_moduleTopology`,
`TauCeti.Huber.IsTateRing.t2Space_moduleTopology`; Mathlib `KaehlerDifferential`,
`KaehlerDifferential.D`, `Derivation`, `moduleTopology`,
`KaehlerDifferential.submodule_span_range_eq_ideal`.
`Huber.ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis_apply` carries a
complete Hausdorff standing-class Huber ring `A` and a finite weight family `M`, with
`B = A⟨X₁,…,Xₙ⟩_M` and its adic coefficient map. For each `i : Fin n`, the differential
basis of `Ωᶜ_{B/A}` evaluates to `dXᵢ`, where `Xᵢ` is the completed polynomial coordinate.

Lean: README target.

**Checks.** (`K` a complete nonarchimedean field with nontrivial rank-one valuation, `K°` its
valuation ring, `K⟨T⟩` the Tate algebra.)

- *Computation.* `Ωᶜ_{K⟨T⟩/K}` is free of rank `1`
  with basis `dT ≠ 0`, and `d(Σ aₙTⁿ) = (Σ n aₙTⁿ⁻¹) dT`. The Check specializes
  to `K = ℚ_p`, for every prime `p`, including `2`. For every sequence `a : ℕ → ℚ_p`
  tending to zero, it asserts convergence of both series as well as the identity.
  `ContinuousKaehlerDifferential.D_tateVariable` gives the coordinate `1` of `dT`
  in `restrictedMvPowerSeriesBasis` and its nonvanishing;
  `ContinuousKaehlerDifferential.D_tateSeries` gives convergence and the formula
  on `restrictedMvPowerSeriesCompletion 1 ℚ_[p]` (Huber96 (1.6.2)(i)–(ii), p. 76).
  The derivative is indexed as `Σₙ (n+1)aₙ₊₁Tⁿ`, so the constant coefficient
  contributes zero without a negative exponent. Both sums use the Tate-algebra
  topology, and `d` is the completed-diagonal derivation defined above.
- *Non-example.* For `K = ℚ_p`, Mathlib's
  `Ω[ℚ_p⟨T⟩⁄ℚ_p]` is not a finitely generated `ℚ_p⟨T⟩`-module (the fraction field of `ℚ_p⟨T⟩` has
  uncountable transcendence degree over `ℚ_p`, e.g. the `exp(p c T)`, `c ∈ ℤ_p`, `p` odd, are
  algebraically independent for `ℚ`-linearly independent `c`), while
  `Ωᶜ_{ℚ_p⟨T⟩/ℚ_p} ≅ ℚ_p⟨T⟩`: defining `Ωᶜ` as algebraic Kähler differentials is wrong.
- *Positive control.* The non-example depends on the characteristic. Let `K` be perfect of
  characteristic `p`, for instance the completed perfection of `𝔽_p((t))`. Every
  `f = Σ aₙTⁿ ∈ K⟨T⟩` equals `Σ_{i=0}^{p−1} Tⁱ gᵢ^p` with `gᵢ = Σ_m a_{pm+i}^{1/p} T^m`: the
  coefficients `a^{1/p}` exist, still tend to zero, and Frobenius is additive and continuous. A
  `K`-derivation kills every `p`-th power, so `Ω[K⟨T⟩⁄K]` is generated by `dT`, and termwise
  differentiation, a `K`-derivation with `T ↦ 1`, shows that `dT` is free. Thus
  `Ω[K⟨T⟩⁄K] ≅ K⟨T⟩·dT`, and `ContinuousKaehlerDifferential.fromKaehler` is bijective here.
- *Compatibility.* Assume `2 ∈ K^×`. For
  `A = K⟨S⟩ → B = K⟨T⟩`, `S ↦ T²` (finite), the map `Ω[B⁄A] → Ωᶜ_{B/A}` is an isomorphism and both
  are `B/(2T)·dT`.
- *Degenerate.* If `A → B` is surjective (a quotient
  mapping), `Ωᶜ_{B/A} = 0`; in particular `Ωᶜ_{A/A} = 0`, `Ωᶜ_{0/A} = 0`, and for `n = 0` the basis
  of `Ωᶜ_{A⟨⟩/A} = Ωᶜ_{A/A}` is empty.
- *Computation.* Assume `2 ∈ K^×`. For
  `A = K⟨T⟩` and `B = A[U]/(U² − (1 + ϖT))`, where `0 < |ϖ| < 1`, the algebra is
  finite and étale since `1 + ϖT` is a unit of `A`. The Check gives bijectivity of `ContinuousKaehlerDifferential.fromKaehler`,
  `Subsingleton (ContinuousKaehlerDifferential A B)` and `dU = 0`. It presents
  the complete Huber `A`-algebra by the basis `(1,U)`, the displayed quadratic
  relation and a continuous structure map. Thus `Ωᶜ_{B/A} = Ω[B⁄A] = B/(2U)·dU = 0`:
  `U` is a unit of `B` (`U² = 1 + ϖT ∈ A^×`) and so is `2`. By
  contrast `B' = A[U]/(U² − T)` is finite but not étale and `Ωᶜ_{B'/A} = B'/(2U)·dU ≠ 0`
  (`ContinuousKaehlerDifferential_test_finite`).
- *Computation.* For every complete Huber ring
  `A` of noetherian type, `Ωᶜ_{A⟨X⟩/A}` is free of rank `1` on `dX` (`restrictedMvPowerSeriesBasis`
  with `n = 1`, `M = {1}`), and `d(Σ aₙXⁿ) = (Σ n aₙXⁿ⁻¹) dX`; the same holds for the weighted
  `A⟨X⟩_M`.
- *Characterisation.* Continuous `K`-derivations
  `K⟨T⟩ → K⟨T⟩` are exactly `g·d/dT` for `g ∈ K⟨T⟩`, i.e.
  `Hom_{K⟨T⟩}(Ωᶜ_{K⟨T⟩/K}, K⟨T⟩) ≅ K⟨T⟩` via `u ↦ u(dT)`.
  The Check takes `K = ℚ_p` and asserts bijectivity of this evaluation
  map on linear maps out of `ContinuousKaehlerDifferential`.

In `ContinuousKaehlerDifferential_test_relativeDisc`, the weighted variable has
basis vector `dX`, every differential has a unique scalar coordinate, and
`d(aX² − bX³) = (2aX − 3bX²)dX`. This includes characteristic two and three without
cancelling either integer. The infinite-series equality is stated for convergent
series and convergent termwise derivative series using `HasSum`; for unweighted
restricted series these convergence statements follow from the coefficient condition.
The basis formulation also applies to the zero ring (Huber96 (1.6.2), p. 76).

For `ContinuousKaehlerDifferential.localizationEquiv`, let `A → B` be
topologically of finite type with `A` of noetherian type, and let `B → C` be
continuous, with all three rings complete Hausdorff Huber rings and compatible
`A`-algebra structures. The formal statements carry `[IsAdicHom (algebraMap A C)]`,
which follows from finite type of `A → B` and the rational localisation. Specify `C`
by a topological ring isomorphism from the supplied completion of `B[1/s]` for a rational presentation `(T,s)` whose numerators generate an open ideal, commuting
with the coefficient maps. The result is the `C`-linear equivalence
`Ωᶜ[C/A] ≃ C ⊗_B Ωᶜ[B/A]`. Its inverse is the canonical functorial map
(`ContinuousKaehlerDifferential.localizationEquiv_symm`), and
`ContinuousKaehlerDifferential.localizationEquiv_D` sends `d(b|C)` to `1 ⊗ db`
(Huber96 Proposition 1.6.3(iv), p. 77). Together with
`ContinuousKaehlerDifferential.map_comp`, this fixes both the restriction maps
and their cocycle law for Part III R3's differential sheaf.

**Checks.** The following use the same rational presentation and coefficient map.

- The differential
  of an element of the base ring maps to zero.
- When `C = 0`, every
  differential and its image are zero, including an empty rational domain.
- If `s t = 1` in `C`,
  then `dt` maps to `−t² ⊗ ds`; the minus sign is retained in every characteristic.

**First fundamental exact sequence of continuous differentials (Huber 1.6.3).**
(*first-fundamental-sequence*) Let `A → B → C` be continuous homomorphisms of complete Huber rings,
with `A` of noetherian type (as in *continuous-differentials*, so that finite `C`-modules are
complete Hausdorff with closed submodules), `B` topologically of finite type over `A` and `C`
topologically of finite type over `B` (so `C` is topologically of finite type over `A`, Huber94 Lem.
3.3(iv)). Prove that the sequence of `C`-modules `C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A} → Ωᶜ_{C/B} → 0` is exact,
the maps being induced by functoriality (*continuous-differentials*) (Huber96 §1.6, Prop. 1.6.3(i),
p. 77; FK Ch. I, §5.1(d), Thm 5.1.12(1), printed p. 339, the formal-geometry analogue, also
under a noetherian hypothesis). For `A = K`, `B = K⟨S⟩`, `C = K⟨T⟩` with `S ↦ T²` (`2 ∈ K^×`):
`C·dS → C·dT`, `dS ↦ 2T dT`, has cokernel `C/(2T)·dT = Ωᶜ_{C/B}`; the first map is not injective in
general (for `C = B/J` a quotient, `Ωᶜ_{C/B} = 0` and `C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A}` has kernel the image
of `J/J²`, *conormal-sequence*), so the sequence is right exact only. *Needs:*
*continuous-differentials*;
*noetherian-type-ideals-closed*; *noetherian-rod-module-complete*; Tau Ceti
`TauCeti.Huber.IsTopologicallyFiniteType`; Mathlib `KaehlerDifferential.exact_mapBaseChange_map`.
Lean: README target.

**Conormal exact sequence for quotient mappings (Huber 1.6.3).** (*conormal-sequence*) Let `A → B`
be a continuous homomorphism of complete Huber rings, topologically of finite type, with `A` of
noetherian type (as in *continuous-differentials*), and `J ⊆ B` an ideal (closed, `B` being of
noetherian type) with quotient mapping `B → C = B/J` (`C` with the quotient topology, `B → C` open and
surjective). Prove that the sequence of `C`-modules `J/J² → C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A} → 0`, with
first map `j ↦ 1 ⊗ dj`, is exact (Huber96 §1.6, Prop. 1.6.3(ii), p. 77; FK Ch. I, §5.1(d),
Thm 5.1.12(2), printed p. 339, and proof of Cor. 5.1.11, the presentation of the differentials of a
quotient `R/𝔞` by the image of `𝔞`; Zavyalov24 §5, proof of Lem. 5.9, uses the Jacobian criterion
1.6.9(ii), which rests on this sequence). For `A = K`, `B = K⟨T⟩`, `J = (T²)` with `2 ∈ K^×`:
`C = K[T]/(T²)`, `J/J²` is generated by the class of `T²`, which maps to `2T·dT` in `C·dT`; the
cokernel `C·dT/(2T·dT)` is `Ωᶜ_{C/K} = Ω[C⁄K]` (finite case of *continuous-differentials* (d)); the
first map `J/J² → C ⊗ Ωᶜ_{B/A}` is not injective in general: for `J = (T)` it is an isomorphism
`K·T̄ → K·dT`, but for `J = (T²)` the class of `T²` is nonzero in `J/J² = K[T]/(T²)·T²` while
`T·T²` maps to `2T²dT = 0` in `C·dT`, so the kernel is nonzero. *Needs:* *continuous-differentials*;
*noetherian-type-ideals-closed*;
*noetherian-rod-module-complete*; Mathlib
`KaehlerDifferential.exact_kerCotangentToTensor_mapBaseChange`.
Lean: README target.

**Stalks of continuous differentials of locally quasi-finite morphisms (Huber 1.6.4(i)).**
(*quasi-finite-stalk-differentials*) Let `f : X → Y` be a locally quasi-finite morphism between
locally noetherian analytic adic spaces (*quasi-finite-morphism*, *locally-noetherian-adic-space*;
the setting in which *continuous-differentials* yields finite modules with the natural topology) and
`x ∈ X` a maximal point, `y = f(x)`. Prove that `O_{X,x}` is a finite `O_{Y,y}`-algebra
(*quasi-finite-stalk-criterion*), and that the stalk
`Ωᶜ_{X/Y,x} := colim Ωᶜ_{O_X(U)/O_Y(V)}` (over affinoid neighbourhoods `U ∋ x`, `V ⊇ f(U)`
with adic section maps, as holds here by local finite type; well
defined by the localisation compatibility of *continuous-differentials*) is canonically isomorphic,
compatibly with the derivations, to Mathlib's `Ω[O_{X,x}⁄O_{Y,y}]` (Huber96 §1.6, Lem. 1.6.4(i) and
the definition of `Ω_{X/Y}` before it, p. 78: Huber's `(Ω_{X/Y})_x` is this colimit of `Ωᶜ` over
affinoid charts, by the description of `Ω_{X/Y}|U` on p. 78; the lemma combines (1.6.2)(iii) with
the fibre finiteness of Huber96 §1.5, Lem. 1.5.2, p. 66). For `S ↦ T²` at the maximal point `T = 0`
(over `S = 0`): `O_{X,0}` is free of rank `2` over `O_{Y,0}` and `Ωᶜ_{X/Y,0} ≅ O_{X,0}/(2T)·dT`.
*Needs:* *quasi-finite-stalk-criterion*; *continuous-differentials*; *quasi-finite-morphism*;
*locally-noetherian-adic-space*; Mathlib `KaehlerDifferential`,
`KaehlerDifferential.tensorKaehlerEquiv`. The target
`AdicSpace.LocallyQuasiFinite.differentialStalk` and its neighbourhood diagram and
comparison-map Checks belong to R0.15.
Lean: README target.

For differential germs, `sectionRing X U` retains the topology of the supplied section
ring. The scoped uniformity and completeness and Hausdorff instances of Tau Ceti's
`CompleteSeparatedTopCommRingCat` apply to these section rings directly.
`DifferentialNeighbourhood f x` consists of affinoid opens U and V with x ∈ U and
f(U) ⊆ V and adic restricted section map `O_Y(V) → O_X(U)`, ordered by inclusion.
Its `ringHom` is this restricted sheaf map. Adicness supplies the completed diagonal
in each differential module; for locally finite-type morphisms it follows from
topological finite type on affinoid charts (Huber96, §1.2, p. 47).
`DifferentialNeighbourhood.sourceHuber` and `DifferentialNeighbourhood.targetHuber`
assert that the section rings on these affinoid opens are Huber rings
(Huber96, §1.1, the affinoid charts).
`differentialNeighbourhoodDiagram` sends this pair to
`O_{X,x} ⊗_{O_X(U)} Ω^cont_{O_X(U)/O_Y(V)}`. For a refinement `(U', V') ⊆ (U, V)`,
put `B = O_X(U)`, `B' = O_X(U')` and `S = O_{X,x}`. Define its restriction map as
`S ⊗_B Ωᶜ → S ⊗_{B'} (B' ⊗_B Ωᶜ) → S ⊗_{B'} Ωᶜ'`: the first arrow is
Mathlib's inverse `TensorProduct.AlgebraTensorModule.cancelBaseChange`, and the second
is `LinearMap.baseChange S` of `Huber.ContinuousKaehlerDifferential.map` for the
commuting square of section restrictions. Thus every cotangent class `ω` maps by
`a ⊗ ω ↦ a ⊗ map(1 ⊗ ω)`, without noetherian hypotheses or a claim that the `db`
generate. The theorem `differentialNeighbourhoodDiagram.map_tmul_D` specializes this
formula to `a ⊗ db ↦ a ⊗ d(b|U')`. The completed-diagonal construction is Huber96,
(1.6.2)(ii), pp. 76–77; its finite-type sheaf interpretation is on p. 78.
`continuousDifferentialStalk` is the colimit of this diagram,
and `fromKaehlerStalk_germ` identifies the comparison on differentials of section germs.
For locally quasi-finite morphisms between analytic locally noetherian spaces, the comparison
is bijective at maximal points (Huber96, Lemma 1.6.4(i)).

The completed-diagonal convention is specified by
`ContinuousKaehlerDifferential.completedDiagonal_equiv` (Huber96 (1.6.2), printed p. 76).
For complete Hausdorff Huber rings `A`, `B` with adic `algebraMap A B`, the equivalence with Mathlib's
`Ideal.Cotangent` is the identity on the defined carrier. Its compatibility with the
`B`-action through `b ↦ b ⊗ 1` and the formula `db = [1 ⊗ b − b ⊗ 1]` are definitional.
The `A`-action is the restriction along `algebraMap A B`; the scalar tower follows
from this restriction. These constructions, `fromKaehler`, `map`, `map_tmul_D` and
`map_id` use complete Hausdorff source and target rings, without noetherian-type
or finite-type hypotheses. The universal property, finiteness, and continuity
assertions retain the hypotheses of (a)–(d). `map_tmul_D` and `map_id` describe the
functorial map on elementary tensors with exact differentials and on the identity square.

*Checks for the carrier and its defining derivation:*

- *Computation.* On `ℚ_p⟨T⟩` relative to `ℚ_p`, `dT` is nonzero and is a basis of `Ωᶜ`.
- *Computation.* Multiplying
  a class by `b : B` is the cotangent action of the image of `b ⊗ 1`.
- *Degenerate.* If `B` is the zero
  ring, the differential module is a singleton.
- *Computation.* For `K⟨S⟩ → B = K⟨T⟩`, `S ↦ T²`,
  `Ωᶜ = B/(2T)·dT`; over `ℚ_p` it is supported at the origin, while in
  characteristic two it is the free module `B·dT`.
- *Degenerate.* `D 1 = 0`.
- *Computation.*
  `D(b − c) = D b − D c`, with the subtraction sign preserved.

*Checks for the derivation and the comparison with algebraic differentials:*
- *Degenerate.* Every differential relative to the same base
  is zero: `d_{A/A}(a) = 0`.
- *Computation.* `d(b² − c³) = 2b db − 3c² dc`;
  both the coefficient and the subtraction sign are fixed.
- *Non-example.* In characteristic `p`, `d(b^p) = 0`,
  even if `b^p` is not a scalar.
- *Computation.* The algebraic differential of
  `b² − c³` maps to `2b db − 3c² dc`.
- *Degenerate.* The relative identity algebra has zero
  algebraic differential and its image is zero.
- *Non-example.* On `ℚ_p⟨T⟩`, the canonical
  derivation differs from the zero derivation, since `dT ≠ 0`.
- *Computation.* The algebraic `dT` maps to
  the continuous `dT`, and this image is nonzero.
- *Convention.* On `ℚ_p⟨T⟩`, the coordinate
  of `d(T² − T³)` is `2T − 3T²`, and the differential is nonzero, also for `p = 2`
  and `p = 3`; the coefficient field has characteristic zero.
Together with `ContinuousKaehlerDifferential_test_finite`, which tests bijectivity for a finite
algebra, these Checks test the algebraic comparison map itself.

- *Computation.* Under a continuous square,
  1 ⊗ d(b² − c³) maps to 2f(b)d(f(b)) − 3f(c)²d(f(c)), with the minus sign retained.
- On `D = ℚ_p⟨T⟩`, the identity square sends `1 ⊗ dT` to the nonzero element `dT`, and sends `1 ⊗ d(p)` to zero. Both assertions use the completed-diagonal differential carrier.
- *Degenerate.* After changing the base from A
  to B along an adic map, the image of 1 ⊗ db in Ωᶜ[B/B] is zero.
- *Computation.* For the topologically
  finite type map `ℚ_p → ℚ_p⟨T⟩`, there exists a continuous derivation `δ` with
  `δ(T) = 1`, and its universal lift sends `dT` to `1`.
- *Computation.* Over `ℚ_p`, the
  one-variable basis sends `dT` to the coordinate `1`.
- *Degenerate.* Lifting the zero derivation gives
  the zero continuous linear map.
- *Computation.* The lift of δ applied to
  d(b² − c³) is 2bδ(b) − 3c²δ(c).
- *Non-example.* In characteristic p, that
  lift vanishes on d(bᵖ), for every continuous derivation δ.
- *Degenerate.* The coordinate map for the
  empty-variable differential basis sends every differential to the zero vector.
- *Computation.* In the two-variable
  restricted series algebra, d(X₀² − X₁³) has coordinates (2X₀, −3X₁²).
- *Non-example.* In characteristic p, all
  coordinates of d(Xᵖ) vanish; its exponent cannot be treated as invertible.

For a finite weighted presentation π : A⟨X⟩ₘ → B that is an open quotient over A,
`ContinuousKaehlerDifferential.presentationEquiv_D` sends `d(π(P))` to the class
of `(π(∂P/∂Xᵢ))ᵢ` in the quotient by the derivatives of ker π.
Here A and B are complete Hausdorff Huber rings and A is of noetherian type
(Huber96 (1.6.2)(i), printed p. 76).
For complete noetherian-type A′ and an adic A → A′, write B′ = B ⊗̂ₐ A′.
`baseChangeEquiv_D` sends `d(b ⊗ a′)` to `(1 ⊗ a′) ⊗ db`, with B acting
through the left inclusion and A′ through the right inclusion
(Huber96 Proposition 1.6.3(iii), printed p. 77). The A-action on Ωᶜ is the
restriction of its B-action along `algebraMap A B`.

*Checks for the comparison maps and their structures:*

- With zero presentation variables, every differential has zero image in the presentation quotient.
- For two variables the presentation comparison sends d(x₀²−x₁³) to the class of (2x₀,−3x₁²).
- In characteristic p, the presentation comparison sends d(bᵖ) to zero; the formal exponent p does not survive as a nonzero coefficient.
- The base-change comparison sends d(inl(b²−c³)) to 1 ⊗ (2b·db−3c²·dc).
- Differentials of all elements from the new base A′ map to zero, including nonzero new scalars.
- For B = 0, the base-change comparison sends every differential to zero.

The cotangent fibre `AdicSpace.continuousDifferentialFibre K f x ε` is
`K ⊗[O_{X,x}] continuousDifferentialStalk f x`, with scalars induced by the
residue map ε. Its differential `continuousDifferentialFibre.d` sends a germ b to
`1 ⊗ fromKaehlerStalk f x (D b)`. These constructions belong to R0; R1.8 uses
them at the unit of an analytic group.
`continuousDifferentialFibre.fromKaehler_bijective` assumes a locally finite-type
map between locally noetherian analytic spaces, `ker ε = 𝔪_x`, and a bijective
composite of ε with the base stalk map. The algebraic-to-continuous comparison
becomes bijective after tensoring with K (Huber96, (1.6.2), pp. 76–78).

**Checks for the fibre and its differential.**
`continuousDifferentialFibre_trivial` and `continuousDifferentialFibre.d_trivial`
give zero for an identity structure map.
`continuousDifferentialFibre_additive` and `continuousDifferentialFibre.d_additive`
compute `d(a+b)=da+db` and `d(ab)=ε(a)db+ε(b)da` in the fibre.
`continuousDifferentialFibre_multiplicative` and
`continuousDifferentialFibre.d_multiplicative` compute
`d(ab)/ε(ab)=da/ε(a)+db/ε(b)` for units `a,b`.


### R0.16 flat, unramified, smooth and étale morphisms

In this subsection `Ω_{X/Y}` abbreviates the family of modules `Ωᶜ_{O_X(U)/O_Y(V)}` over affinoid
charts with their stalks (*quasi-finite-stalk-differentials*); the sheaf is AdicSpacesPartIII layer R3's
(*sheaf-of-continuous-differentials*). Huber's unramified, smooth and étale morphisms are defined by
infinitesimal lifting (Huber96 §1.6, Def. 1.6.5, p. 78): for every affinoid ring `A` (not
necessarily complete or sheafy), every ideal `I` of `A` with `I² = 0` and every `Spa A → Y`, the
restriction `Hom_Y(Spa A, X) → Hom_Y(Spa(A/I), X)` is injective, surjective or bijective. The test
objects here are fixed once for the three definitions: `A` ranges over complete Huber pairs
`(A, A⁺)` (Tau Ceti `Huber.Pair` on complete Hausdorff rings), `Spa A` is the affinoid pre-adic
space of AdicSpaces layer 3.4 (`A` need not be sheafy), and morphisms `Spa A → Y` are morphisms of
pre-adic spaces; `I ⊆ A` is a closed ideal with `I² = 0` and `A/I` is the quotient Huber pair (Tau
Ceti `Huber.Pair.quotient`), whose plus ring is `A⁺/I` because `I ⊆ A°° ⊆ A⁺`. This is the
complete-pair, closed-ideal specialisation of Huber's test, and by itself it loses nothing:
Huber's `Spa A` and `Spa(A/I)` are formed from `Â` and from `Â` modulo the closure of `IÂ`, an
ideal that is still square-zero, so an arbitrary test is represented by its completion with the
closure of the ideal. The restriction is kept because Tau Ceti's quotient by a non-closed ideal is
not Hausdorff, and ring maps into it are not morphisms to Huber's `Spa(A/I)`. The morphism
`Spa(A/I) → Spa A` is a homeomorphism. The Lean lifting predicates `Unramified_affinoid`,
`Smooth_affinoid` and `Etale_affinoid` test a single morphism of complete pairs; the
chart-level predicates `Unramified`, `Smooth` and `Etale` ask each point for a chart of `f` with
the lifting property. Agreement with Huber's definition is the separate target
*lifting-test-agreement*, through which Huber's results transfer to the Lean predicates (or their
proofs are adapted directly); since the completion step loses nothing, what that target has to
prove concerns the passage between chart-local and global lifting, the finite-presentation
interface and standard presentations. Huber96 proves the results of §§1.6–1.7 under the standing
assumption (1.1.1); here every theorem of R0.16–R0.17 asks each space it involves to be locally
Huber-standard (*locally-huber-standard*), which for analytic spaces is the same as locally
noetherian, and local finite presentation asks for witness charts in the class
(*locally-finite-presentation*). Without the class the package fails
(*etale-standing-class-control*, *etale-standing-class-product-control*). Huber gives no proof of Propositions 1.6.7–1.6.9 beyond "can
be proved similarly as for schemes" (Huber96 §1.6, before Prop. 1.6.7, p. 79); the proofs here are
the scheme arguments (EGA IV §17) transported. In the checks of this subsection `K` is a complete
nonarchimedean field with nontrivial rank-one valuation, `K°` its valuation ring, `ϖ` a
pseudo-uniformiser, `K⟨T⟩` the Tate algebra and `D = Spa(K⟨T⟩, K°⟨T⟩)`.

**Flat morphism of adic spaces.** (*flat-morphism*) A morphism `f : X → Y` of adic spaces is *flat*
if for every `x ∈ X` the local homomorphism of stalks `O_{Y,f(x)} → O_{X,x}` is flat (Mathlib
`Module.Flat`) (Zavyalov-Q Appendix B.4, Def. B.4.1, p. 49; Huber96 §1.7, Prop. 1.7.5, p. 87, uses
the same stalkwise notion). Stalks are colimits of rings, with no topology (AdicSpaces layer 3.3).
Conventions: flatness is stalkwise; for morphisms of strongly noetherian Tate affinoids it implies
flatness of `O_Y(Y) → O_X(X)` (Zavyalov-Q Appendix B.4, Lem. B.4.3, p. 50), and for affinoids of
topologically finite type over a nonarchimedean field the two are equivalent (Zavyalov-Q B.4.3,
B.4.6); in general the converse is not known (Zavyalov-Q Appendix B.4, Rem. B.4.9, p. 51) and is not
asserted. In `AdicSpace`, define `Flat f` as the class: every stalk map `O_{Y,f(x)} → O_{X,x}` is
flat; prove the stalkwise statement (`Flat f → Module.Flat O_{Y,f(x)} O_{X,x}`), `Flat.comp` (composites
of flat morphisms are flat), `Flat.of_isOpenImmersion` (open embeddings are flat),
the global-sections statement (for strongly noetherian Tate affinoids,
`Flat f → Module.Flat O_Y(Y) O_X(X)`, Zavyalov-Q B.4.3), the converse over a field (for affinoids
topologically of finite type over a nonarchimedean field, a flat ring map gives a flat morphism,
Zavyalov-Q B.4.6), `Flat.baseChange` (a flat locally quasi-finite morphism `X → Y` of
analytic adic spaces, with `Y` locally noetherian, stays flat after base change along
`Y' → Y` with `Y'` analytic and locally noetherian, Huber 1.6.4(ii),
*flat-quasi-finite-base-change*).
The theorem `Etale.flat` is supplied by *etale-flat-unramified* and `Smooth.flat` by
*smooth-morphism*. Open embeddings are flat; the closed
embedding of the origin into the closed disc is not. *Needs:* Mathlib `Module.Flat`,
`AlgebraicGeometry.Flat`.
`AdicSpace.Flat.flat_stalkMap` carries `hf : Flat f` and `x : X` and concludes
flatness of `O_{Y,f(x)} → O_{X,x}`.
`AdicSpace.Flat.flat_appTop_of_isStronglyNoetherian` carries complete strongly noetherian
Tate affinoids `A`, `B`, a pair map `φ : A → B`, its induced morphism `f : Spa B → Spa A`
and `Flat f`, and concludes `φ.toRingHom.Flat` (Zavyalov-Q, Lemma B.4.3).

Lean: `AdicSpace.Flat`; the identity, open-embedding, origin and squaring Checks are
`example`s.

**Checks.**

- *Degenerate.* Open embeddings are flat (stalk maps are isomorphisms),
  and so are identities.
- *Non-example.* The closed embedding `Spa(K, K°) → Spa(K⟨T⟩, K°⟨T⟩)` of the
  origin is not flat: `T` is a nonzerodivisor of `O_{D,0}` that becomes `0` in `K`.
- *Computation.* `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T²`, is flat:
  `K⟨T⟩` is free over `K⟨S⟩`, hence the morphism is flat by Zavyalov-Q B.4.6.
- *Compatibility.* For `f : Spa(B, B°) → Spa(A, A°)` between affinoids
  topologically of finite type over `K`: `AdicSpace.Flat f ↔ Module.Flat A B` (Zavyalov-Q B.4.3 and
  B.4.6); this matches Mathlib's `AlgebraicGeometry.Flat`, which is also stalkwise flatness for
  schemes.

**Unramified morphism of adic spaces.** (*unramified-morphism*) A morphism `f : X → Y` of adic
spaces is *unramified* if it is locally of finite type (*finite-type-morphism-classes*) and for every
complete Huber pair `A`, every closed ideal `I ⊆ A` with `I² = 0` and every morphism `Spa A → Y`, the
restriction map `Hom_Y(Spa A, X) → Hom_Y(Spa(A/I), X)` is injective (Huber96 §1.6, Def. 1.6.5, p. 78),
with the test objects fixed above. In `AdicSpace`, define `Unramified f` as the class: locally of
finite type and every point has a `HomChart` of `f` whose pair map satisfies `Unramified_affinoid`;
the global Hom-test form of Def. 1.6.5(i) is *lifting-test-agreement*; prove
uniqueness of lifts (two `Y`-morphisms `Spa A → X` agreeing on `Spa(A/I)`, `I² = 0`, are equal),
`Unramified.comp` (composites of unramified morphisms are unramified, *etale-smooth-composition*),
cancellation (if `g ∘ f` is unramified then `f` is unramified, *etale-smooth-cancellation*),
`Unramified.baseChange` (stable under base change along any morphism for which the fibre product
exists, *smooth-etale-base-change*), the immersion case (locally closed embeddings are
unramified, *immersion-unramified*), the differential criterion (for locally
Huber-standard source and target and a locally finite-type morphism, each point admits a
`HomChart` with standing-class target and zero continuous differential module) and
the diagonal criterion (with the same hypotheses and an existing self-product,
the diagonal is an open immersion iff the morphism is unramified; these are the clauses
(a) ⇔ (b) and (a) ⇔ (c) of *infinitesimal-criteria*),
`Unramified.locallyQuasiFinite` (unramified morphisms of locally Huber-standard adic spaces are locally
quasi-finite, *unramified-locally-quasi-finite*) and the finite comparison
(for finite morphisms of noetherian Tate affinoids, unramified iff Mathlib
`Algebra.FormallyUnramified`). The ring-level predicates `Unramified_affinoid`, `Smooth_affinoid`,
`Etale_affinoid` are the lifting conditions for a morphism of Huber pairs alone; the classes add the
finite-type, resp. finite-presentation, clause.
For a finite morphism of complete Hausdorff Huber pairs over a noetherian Tate ring `A`,
`Unramified_affinoid` is `Algebra.FormallyUnramified A B`; and unique lifting is the conjunction
of existence and uniqueness of lifts over the same universe of complete Huber test pairs.
Monomorphisms locally of finite type (in particular
locally closed embeddings) are unramified (*immersion-unramified*); unramified iff `Ω_{X/Y} = 0` iff
`Δ_f` open embedding (*infinitesimal-criteria*). *Needs:* *finite-type-morphism-classes*; Tau Ceti
`TauCeti.Huber.Pair.quotient`; Mathlib `Algebra.FormallyUnramified.iff_comp_injective`.
Lean: `AdicSpace.Unramified_affinoid` (complete-pair, closed-ideal test), `AdicSpace.Unramified`;
the identity, square-zero-quotient and disc Checks of the lifting tests are `example`s.

The uniqueness statement takes a continuous open quotient of complete sheafy
pairs with square-zero kernel and the quotient plus ring. Two maps from the
thickening agree if they agree over the base and after restriction to the
quotient. `Unramified.baseChange` applies to any specified categorical pullback.
For locally Huber-standard source and target, the forward implication of the diagonal criterion
(the diagonal of an unramified morphism is an open immersion) retains
the existence of the self-product (Huber96 Definition 1.6.5 and Proposition 1.6.8,
pp. 78–79).

**Checks.**

- *Non-example.* The closed embedding of the origin `Spa(K, K°) → D` is
  unramified but not étale (not flat), and the squaring map `T ↦ T²` restricted to the rational
  subset `{|T| = 1}` (`2 ∈ K^×`) is unramified, indeed étale, but not injective on points:
  unramifiedness is neither étaleness nor injectivity.
- *Computation.* Assume `2 ∈ K^×`. For `f : D → D`, `S ↦ T²`,
  `Ωᶜ = K⟨T⟩/(2T)·dT`, so `f` is unramified exactly on the complement of the origin: its restriction
  to the rational subset `{|T| = 1}` is unramified and `f` itself is not.
- *Degenerate.* Identities and open embeddings are unramified.
- *Computation.* For finite affinoid maps over
  `Spa(K,K°)`, compare the scalar-compatible algebras `K[ε]/(ε²)` and `K × K`.
  The first map is not unramified and retains a nonzero square-zero element; the
  second is unramified, over every complete nontrivially normed nonarchimedean `K`.
  The general comparison is the finite comparison above;
  the concrete distinction follows from the differentials of these two finite algebras
  (Conrad-IC, Theorem A.2.1(1), p. 33; *continuous-differentials* (d)).

**Smooth morphism of adic spaces.** (*smooth-morphism*) A morphism `f : X → Y` of adic spaces is
*smooth* if it is locally of finite presentation (*locally-finite-presentation*; over an analytic,
locally Huber-standard `Y` this is the same as locally of finite type) and for every complete Huber pair `A`, every closed
ideal `I ⊆ A` with `I² = 0` and every morphism `Spa A → Y`, the restriction map
`Hom_Y(Spa A, X) → Hom_Y(Spa(A/I), X)` is surjective (Huber96 §1.6, Def. 1.6.5, p. 78), with the test
objects fixed above. For `X` and `Y` locally Huber-standard (*locally-huber-standard*, where
*continuous-differentials* applies), the *relative dimension* of `f` at `x` is the rank of the
locally free (*smooth-differentials-locally-free*) module of continuous differentials near `x`; no
relative dimension is attached to a smooth morphism outside the locally Huber-standard case. In
`AdicSpace`, define `Smooth f` as the class: locally of finite presentation and every point has a
`HomChart` of `f` whose pair map satisfies `Smooth_affinoid` (the global Hom-test form of
Def. 1.6.5(i) is *lifting-test-agreement*), and, for locally Huber-standard `X`, `Y`,
`Smooth.relativeDimension` as the locally constant function `x ↦` rank of `Ω_{X/Y}` near `x`; prove
existence of lifts (every `Y`-morphism `Spa(A/I) → X`
extends to `Spa A → X`; the signature uses complete sheafy `Affinoid` presentations
and a continuous open quotient of pairs with square-zero kernel and the quotient plus ring,
and requires both triangles of the lift to commute), `Smooth.comp` (composites of smooth morphisms are smooth,
*etale-smooth-composition*), `Smooth.baseChange` (stable under base change when the spaces of the
square are locally Huber-standard, *smooth-etale-base-change*),
smoothness of relative polydiscs (`A` complete and in Huber's standing class,
`Spa A⟨X⟩_M → Spa A` is smooth, *restricted-power-series-smooth*),
local freeness of differentials (for locally Huber-standard source and target, every point lies
in a `HomChart` with standing-class target and a finite basis of the continuous differential
module, with scalars induced by the chart map; Huber96 §1.6, Prop. 1.6.9, pp. 79–80),
the local structure (the statement of *smooth-local-structure*),
`Smooth.isOpenMap` (smooth morphisms between locally Huber-standard spaces are open,
*smooth-morphism-open*) and `Smooth.flat` (for `Smooth f`, with analytic and locally Huber-standard
source and target, `Flat f`; these are locally strongly noetherian analytic spaces,
Zavyalov-Q Remark B.4.7, p. 51). BHW §3,
proof of Cor. 3.4, uses the smooth local structure for products of perfectoid and smooth rigid
spaces. *Needs:* *locally-finite-presentation*; *finite-type-morphism-classes*; Tau Ceti
`TauCeti.Huber.Pair.quotient`; Mathlib `Algebra.FormallySmooth.iff_comp_surjective`.
Lean: `AdicSpace.Smooth_affinoid`, `AdicSpace.Smooth`; the disc Check of the lifting test is an
`example`.

**Checks.**

- *Computation.* `Spa(K⟨T₁,…,Tₙ⟩, K°⟨T₁,…,Tₙ⟩) → Spa(K, K°)` is smooth of
  relative dimension `n` (`Ωᶜ` free on `dT₁,…,dTₙ`).
- *Non-example.* `Spa(K⟨T₁,T₂⟩/(T₁T₂)) → Spa(K, K°)` is not smooth:
  `Ωᶜ = (C dT₁ ⊕ C dT₂)/(T₂dT₁ + T₁dT₂)` is not locally free at the origin.
- *Non-example.* `D → Spa(K, K°)` is smooth, but Mathlib's
  `Algebra.Smooth K K⟨T⟩` is false (`K⟨T⟩` is not even of finite type as a `K`-algebra); defining
  smoothness as algebraic smoothness of coordinate rings is wrong.
- *Degenerate.* Identities and open embeddings of locally Huber-standard spaces are smooth (they
  are étale, *open-embedding-etale*).
- *Compatibility.* Over a discrete base (Huber 1.6.6(i)): for `A`, `B`
  discrete noetherian rings with `B` of finite presentation over `A` and `B⁺` the integral
  closure in `B` of a finitely generated `A⁺`-subalgebra, `Spa(B, B⁺) → Spa(A, A⁺)` is smooth
  iff Mathlib's `Algebra.Smooth A B`. The plus-ring hypothesis holds in particular for
  `A⁺ = A`, `B⁺ = B`.
- *Non-example.* Give `F = Frac(𝔽₂[tᵢ : i ∈ ℤ])` the discrete topology and the monomial
  valuation with value group `⊕ᵢ∈ℤ ℤ`, ordered lexicographically by the least nonzero index,
  with `v(tᵢ) = eᵢ`. For its valuation ring `V`, the identity coefficient homomorphism
  `(F, V) → (F, F)` is algebraically smooth, but its adic morphism is not smooth.
  For any finite set of field elements, choose `j` smaller than every index in their values.
  The coarsened valuation retaining coordinates of index at most `j` has a proper valuation
  ring containing `V` and those elements, but excluding `tⱼ⁻¹`. This integrally closed ring
  contains the integral closure of the generated `V`-subalgebra, so that closure cannot be `F`.

The discrete comparison and failure of smoothness when no finite plus-ring generating set
exists are `example`s in [Suggested.lean](Suggested.lean).

For locally Huber-standard source and target, `Smooth.relativeDimension` is the
locally constant natural-number-valued function obtained by taking the dimension
of the continuous cotangent fibre over the residue field at each point.
The rank formula computes it as `n` on any finite-type
`HomChart` with standing-class target and a basis of `n` continuous differentials.
The base-change formula identifies the dimension after a specified
pullback with its value at the image point, provided all four spaces are locally
Huber-standard. In this case finite generation of chart kernels supplies smoothness
of the pullback without requiring the new base to be analytic
(Huber96 Proposition 1.6.7(iv), Proposition 1.6.9 and Corollary 1.6.10, pp. 79–80).

**Checks.**

- Every point of the identity morphism has dimension zero.
- Every point of an étale morphism has dimension zero.
- Every point of the closed `n`-polydisc
  over a complete nontrivially valued nonarchimedean field has relative dimension
  `n`, including `n = 0` and `n = 1`.

**Étale morphism of adic spaces.** (*differentials-unramified-smooth-etale*) A morphism `f : X → Y`
of adic spaces is *étale* if it is locally of finite presentation (*locally-finite-presentation*)
and for every complete Huber pair `A`, every closed ideal `I ⊆ A` with `I² = 0` and every morphism
`Spa A → Y`, the restriction map `Hom_Y(Spa A, X) → Hom_Y(Spa(A/I), X)` is bijective (Huber96 §1.6,
Def. 1.6.5, p. 78), with the test objects fixed above; equivalently, `f` is smooth
(*smooth-morphism*) and unramified (*unramified-morphism*). Conventions: this is Huber's
infinitesimal definition, mirroring the scheme definition of finite presentation plus infinitesimal
lifting (KL15 §1.2, Def. 1.2.1); the Kedlaya–Liu and Scholze–Weinstein definition ("locally an open
immersion followed by a finite étale map"), designed to agree with Huber's (KL15 §8.2, before Def.
8.2.16), does agree with it for locally Huber-standard analytic adic spaces (AdicEtaleGeometry layer A1,
*etale-morphisms-local-description-and-comparison*, from Huber's Lemma 2.2.8,
*etale-local-open-finite-etale-factorisation*), and the algebraic notion `Algebra.Etale` of Mathlib
applied to coordinate rings does not (a rational embedding is étale but its ring map is not of
finite type). The étale site of AdicEtaleGeometry A1.6 is built on this definition (Huber96 §2.1, p. 109). In `AdicSpace`, define `Etale f` as
the class: locally of finite presentation and every point has a `HomChart` of `f` whose pair map
satisfies `Etale_affinoid`; the global Hom-test form of Def. 1.6.5(i) is *lifting-test-agreement*;
prove the equivalence with smooth and unramified (`Etale f ↔ Smooth f ∧ Unramified f`),
`Etale.lift` (existence and uniqueness of the extension `Spa A → X` of a
`Y`-morphism `Spa(A/I) → X`, `I² = 0`; as for existence of lifts of smooth morphisms, the signature
specifies a continuous open quotient of complete sheafy pairs, its quotient plus
ring, and both commuting triangles),
`Etale.comp` (composites of étale morphisms are étale, *etale-smooth-composition*),
`Etale.baseChange` (stable under base change when all four spaces of the square are locally
Huber-standard, *smooth-etale-base-change*), cancellation (if `g ∘ f` is étale and `g` unramified
then `f` is étale, *etale-smooth-cancellation*), `Etale.of_isOpenImmersion` (open embeddings of
locally Huber-standard spaces are étale, *open-embedding-etale*), `Etale.exists_standardPresentation`
(the statement of *etale-local-structure*), `Etale.iff_flat_and_unramified` and the stalk
criterion (the equivalences in *etale-flat-unramified*), `Etale.flat` (étale morphisms between analytic spaces with locally Huber-standard target are
stalkwise flat, Huber96 Proposition 1.7.5, p. 87), `Etale.locallyQuasiFinite` (étale
morphisms with locally Huber-standard target are locally quasi-finite,
*unramified-locally-quasi-finite*), `Etale.isOpenMap` (étale morphisms with locally Huber-standard
target are open, Huber96 Proposition 1.7.8, p. 88, *smooth-morphism-open*) and `Etale.finiteEtaleEquiv` (the statement of
*finite-etale-algebra-comparison*); the local description of étale morphisms as open embeddings into
finite étale spaces is AdicEtaleGeometry layer A1
(*etale-morphisms-local-description-and-comparison*), from Huber's Lemma 2.2.8
(*etale-local-open-finite-etale-factorisation*). Open embeddings are étale (*open-embedding-etale*);
étale affinoid maps are standard étale (*etale-local-structure*); étale iff flat and unramified for
analytic spaces (*etale-flat-unramified*). *Needs:* *locally-finite-presentation*;
*finite-type-morphism-classes*; *smooth-morphism*; *unramified-morphism*; Tau Ceti
`TauCeti.Huber.Pair.quotient`; Mathlib `Algebra.FormallyEtale.iff_comp_bijective`, `Algebra.Etale`.
Lean: `AdicSpace.Etale_affinoid`, `AdicSpace.Etale`; the Checks `T ↦ ϖT` (étale, not finite) and
`T ↦ T^p` (not étale) are `example`s.

**Checks.**

- *Computation.* Let `n ∈ K^×` (as an integer) and `T^±` denote the annulus
  `Spa(K⟨T, T⁻¹⟩, K°⟨T, T⁻¹⟩)`. The map `T^± → T^±`, `S ↦ Tⁿ`, is finite and étale: it is the standard
  presentation `K⟨S^±⟩⟨T⟩/(Tⁿ − S)` with Jacobian `nTⁿ⁻¹` a unit (*etale-local-structure*).
- *Non-example.* For `K = ℚ_p` the rational embedding
  `{|T| ≤ |p|} → D` is étale (an open embedding), but `ℚ_p⟨T⟩ → ℚ_p⟨T, T/p⟩` is not of finite type as
  an algebra (injectivity puts the generic point in the image of `Spec`; a constructible subset
  containing that point in the one-dimensional irreducible noetherian `Spec ℚ_p⟨T⟩` is cofinite,
  but the image omits infinitely many closed points `(T − t)` with `t ∈ ℚ_p` and
  `|p| < |t| ≤ 1`, contradicting Chevalley's theorem, EGA IV₁, Cor. 1.8.5, p. 239),
  so it is not `Algebra.Etale`: "étale" cannot be defined as Mathlib's
  `Algebra.Etale` on coordinate rings.
- *Non-example.* Let `K` have characteristic `p`. Then
  `Spa(K⟨T⟩) → Spa(K⟨S⟩)`, `S ↦ T^p`, is finite, flat (`K⟨T⟩` is free on `1, T, …, T^{p−1}` over
  `K⟨T^p⟩`) and bijective on points, but not étale: `Ωᶜ = K⟨T⟩·dT ≠ 0` (the derivative `pT^{p−1}`
  vanishes), so it is not unramified.
- *Degenerate.* Identities and open embeddings of locally Huber-standard spaces are étale
  (*open-embedding-etale*).
- *Compatibility.* Take the diagonal extension
  `ℚ₂ → ℚ₂ × ℚ₂`, with plus rings `ℤ₂` and `ℤ₂ × ℤ₂`. It is finite and
  algebraically étale, and its induced adic morphism is étale with a two-point
  source. The nonzero idempotents `(1,0)` and `(0,1)` multiply to zero, so this
  instance also covers disconnected finite étale algebras. The general comparison
  is `Etale.iff_ringHom_etale_of_finite` (Huber96 Example 1.6.6(ii), p. 78,
  and Corollary 1.7.3(iii), p. 86); for affinoid `Y`, the standard presentations
  of *etale-local-structure* are the adic counterpart of Mathlib's characterisation of étale
  algebras as standard smooth algebras of relative dimension zero (in `Algebra.Etale`).

**Agreement with Huber's lifting test.** (*lifting-test-agreement*) For `f : X → Y` between locally
Huber-standard spaces, locally of finite type (for smooth and étale: locally of finite
presentation, with witness charts in Huber's standing class as in *locally-finite-presentation*),
`f` satisfies `AdicSpace.Unramified` (`AdicSpace.Smooth`, `AdicSpace.Etale`) iff it is unramified
(smooth, étale) in the sense of Huber96 §1.6, Def. 1.6.5, p. 78, with arbitrary affinoid test rings
and arbitrary ideals of square zero. The completeness and closed-ideal restriction of the Lean tests
loses nothing by itself: Huber's `Spa A` and `Spa(A/I)` are formed from `Â` and from `Â` modulo the
closure of `IÂ`, an ideal that still has square zero, so every test is represented by its
completion with the closure of the ideal. What is to be proved is therefore the comparison at the
finite-presentation interface (Huber's Def. 1.2.1(v) on his charts, all of which are in the
standing class, against the chart-restricted predicate) and the passage between chart-local and
global lifting through *etale-smooth-locality* and the standard presentations of
*etale-local-structure*. Lean: README target.

**Open embeddings are étale (Huber 1.6.7).** (*open-embedding-etale*) Prove that every open
embedding `j : U → X` of locally Huber-standard adic spaces (an isomorphism onto an open adic
subspace, AdicSpaces layer 5.1) is étale (*differentials-unramified-smooth-etale*) (Huber96 §1.6,
Prop. 1.6.7(i), p. 79, first clause). The hypothesis is needed for the finite-presentation clause:
local finite presentation asks for witness charts in Huber's standing class, so the identity of a
space that is not locally Huber-standard, such as `Spa(A, A)` for `A = ℤ_p ×_{𝔽_p} E` of
*etale-standing-class-control*, is not étale. The rational embedding
`{|T| ≤ |p|} ⊆ Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is étale. *Needs:*
*differentials-unramified-smooth-etale*; *locally-finite-presentation*; *locally-huber-standard*.
Lean: `Etale.of_isOpenImmersion` (source and target locally Huber-standard).

**Locally closed embeddings are unramified (Huber 1.6.7).** (*immersion-unramified*) Prove that
every morphism `f : X → Y` of locally Huber-standard adic spaces with `LocallyOfFiniteType f` and
`Mono f.hom` is unramified. Here the monomorphism is in the category of pre-adic
spaces: cancellation gives uniqueness of lifts even for spectra of non-sheafy Huber pairs
(Huber96, Definition 1.6.5(i), p. 78). In particular, closed embeddings
(`IsClosedImmersion.unramified`) and locally closed embeddings
(*closed-adic-subspaces-and-embeddings*) are unramified (*unramified-morphism*)
(Huber96 §1.6, Prop. 1.6.7(i), p. 79, second clause, generalised), all spaces locally
Huber-standard. The origin `Spa(K, K°) → D` is unramified; it is not étale
(the first Check of *unramified-morphism*). *Needs:* *unramified-morphism*;
*closed-adic-subspaces-and-embeddings*; *finite-type-morphism-classes*.
Lean: closed case `IsClosedImmersion.unramified` (source and target locally Huber-standard).

**Relative polydiscs are smooth (Huber 1.6.7).** (*restricted-power-series-smooth*) Let `(A, A⁺)` be
a complete Huber pair with `A` in Huber's standing class (*huber-standing-class*) and
`M₁,…,Mₙ` finite subsets of `A` with each `MᵢA` open. Prove that the
structure morphism `Spa A⟨X₁,…,Xₙ⟩_M → Spa A` (Huber94 §3: plus ring the integral closure of the
series with coefficients in `M^ν·A⁺`) is smooth (*smooth-morphism*) of relative dimension `n`
(Huber96 §1.6, Prop. 1.6.7(i), p. 79, third clause, under (1.1.1), p. 37;
the lift uses the universal property of `A⟨X⟩_M`, Huber94 §3, Lem. 3.5(i), printed p. 534). `Spa(K⟨T₁,…,Tₙ⟩) → Spa(K, K°)` is smooth;
this is the model in *smooth-local-structure*; the scheme analogue is Mathlib
`Algebra.FormallySmooth.polynomial`. *Needs:* *smooth-morphism*; *locally-finite-presentation*;
*continuous-differentials*; Tau Ceti `TauCeti.Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.Pair.quotient`, `TauCeti.Huber.weightedRestrictedSubring`; Mathlib
`Algebra.FormallySmooth.polynomial`.
Lean: README target; the closed `ℚ_p`-disc Check of the lifting tests is an `example`.

**Checks.**

- The zero-variable polydisc over `ℤ_p` is the smooth identity of relative dimension zero.
- The `n`-polydisc over `ℚ_p` is smooth, with differential basis `dX₁,…,dXₙ`.
- With zero variables over `A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control*,
  the map is the identity of `Spa(A,A)`, which is not smooth: local finite presentation
  would imply local Huber-standardness at `∞`.

**Composites of unramified, smooth and étale morphisms (Huber 1.6.7).** (*etale-smooth-composition*)
Let `f : X → Y` and `g : Y → Z` be morphisms of adic spaces. Prove that if `f` and `g` are unramified
(resp. smooth, resp. étale), so is `g ∘ f` (Huber96 §1.6, Prop. 1.6.7(ii), p. 79). The proof is
formal: a lift along `g ∘ f` is a lift along
`g` followed by a lift along `f`, and uniqueness composes; the only non-formal inputs are
`LocallyOfFiniteType.comp` and `LocallyOfFinitePresentation.comp` (*finite-type-morphism-classes*,
*locally-finite-presentation*), the latter for spaces whose finite-presentation witnesses lie in
Huber's standing class, so no sheafiness hypothesis is needed. The composite
of the rational embedding `{|T| = 1} → D` and of `D → Spa(K, K°)` is smooth; the composite of the
closed embedding of the origin (unramified, not étale) with `D → Spa(K, K°)` (smooth) is the
identity of `Spa(K, K°)`, étale, so the converse of the composition rule fails. *Needs:*
*unramified-morphism*; *smooth-morphism*; *differentials-unramified-smooth-etale*;
*finite-type-morphism-classes*; *locally-finite-presentation*.
Lean: étale case `Etale.comp` (all three spaces locally Huber-standard).

**Cancellation for unramified, smooth and étale morphisms (Huber 1.6.7).**
(*etale-smooth-cancellation*) Let `f : X → Y` and `g : Y → Z` be morphisms of adic spaces. Prove: (i)
if `g ∘ f` is unramified, then `f` is unramified (no hypothesis on `g`); (ii) if `g ∘ f` is smooth
(resp. étale) and `g` is unramified (hence locally of finite type), then `f` is smooth (resp. étale)
(Huber96 §1.6, Prop. 1.6.7(iii), p. 79). The lifting part is formal (for `a : Spa A → Y` over `Z`
and `b : Spa(A/I) → X` with `f ∘ b = a|_{Spa(A/I)}`, a lift `c : Spa A → X` of `b` along `g ∘ f` has
`f ∘ c = a` by the unramifiedness of `g`, the two agreeing modulo `I`); the finiteness clauses use
the cancellation statement for local finite type and, for (ii), the cancellation "`g ∘ f` locally of finite
presentation and `g` locally of finite type imply `f` locally of finite presentation"
(`LocallyOfFinitePresentation.of_comp`, *locally-finite-presentation*, the adic form of
[Stacks Lemma 29.22.11(1), Tag 02FV](https://stacks.math.columbia.edu/tag/02FV)), which is the only input beyond the
definitions. The hypothesis on `g` in (ii) cannot be dropped: the origin `Spa(K, K°) → D` composed
with the smooth `D → Spa(K, K°)` is the identity, smooth and étale, while the origin is not smooth
(the first Check of *unramified-morphism*); here `g = D → Spa(K, K°)` is not unramified. If `U → D` is étale over
`D` and `D → Spa(K, K°)` is smooth, the composite is smooth; conversely a morphism between étale
`D`-spaces is étale. *Needs:* *unramified-morphism*; *smooth-morphism*;
*differentials-unramified-smooth-etale*; *finite-type-morphism-classes*;
*locally-finite-presentation*.
Lean: README target.

**Unramified, smooth and étale are local on the source (Huber 1.6.7).** (*etale-smooth-locality*)
Let `f : X → Y` be a morphism of adic spaces and `X = ⋃ᵢ Uᵢ` an open cover. Prove that if each
`f|_{Uᵢ}` is unramified (resp. étale, resp. smooth), then `f` is unramified (resp. étale, resp.
smooth) (Huber96 §1.6, Prop. 1.6.7(v) and Def. 1.6.5(ii), pp. 78–79, the statement with the
pointwise notion it uses). For the unramified and étale cases the proof is formal: two lifts
`Spa A → X` agreeing modulo `I` have the same underlying map (`Spa(A/I) → Spa A` is a
homeomorphism), so they agree on a rational cover of `Spa A` refining the preimage of `(Uᵢ)`, and
morphisms out of a pre-adic space are determined by their restrictions to an open cover; for étale
the local lifts are unique, hence glue. For the smooth case the local lifts need not agree on
overlaps, and the proof is the one for schemes (Stacks Tags 00TM and 031I: formal smoothness is
equivalent to the split injectivity of `J/J² → Ωᶜ_{A⟨X⟩_M/A} ⊗ B` for one presentation, a condition
that is local), which uses *conormal-sequence* and *smooth-differentials-locally-free*; for that
case `X` and `Y` are taken locally Huber-standard (*locally-huber-standard*), as in Huber's
standing hypothesis (1.1.1). `X = D` covered by `{|T| ≤ |ϖ|}` and `{|ϖ| ≤ |T|}`: each piece is
smooth over `Spa(K, K°)`, and so is `D`. *Needs:* *unramified-morphism*; *smooth-morphism*;
*differentials-unramified-smooth-etale*; *finite-type-morphism-classes*;
*locally-finite-presentation*.
Lean: README target.

**Unramified morphisms are locally quasi-finite (Huber 1.7.4).**
(*unramified-locally-quasi-finite*) Prove that every unramified morphism `f : X → Y` of locally
Huber-standard adic spaces (*locally-huber-standard*) is locally quasi-finite
(*quasi-finite-morphism*); in particular étale morphisms are locally quasi-finite
(Huber96 §1.7, Cor. 1.7.4, p. 86, with Huber's proof — 1.6.8 plus the algebraic model 1.7.3(iii),
the standard étale presentation of Huber96 §1.7, Prop. 1.7.1, p. 80, producing the algebraic model
through 1.7.2–1.7.3). Assuming `2 ∈ K^×`, the squaring map restricted to `{|T| = 1}` is finite
étale with fibres of cardinality at most `2`, the `n = 2` case of the annulus Check of
*differentials-unramified-smooth-etale*. *Needs:* *infinitesimal-criteria*; *etale-local-structure*; *quasi-finite-morphism*;
*unramified-morphism*; *closed-adic-subspaces-and-embeddings*; *fibre-products-existence*;
*etale-algebraic-model*; *etale-presentation-perturbation*.

**Checks.**

- *Computation.* If `2 ∈ K^×`, put `A = K⟨S,S⁻¹⟩`, `B = K⟨T,T⁻¹⟩` and `S ↦ T²`, with
  their usual integral plus rings. The basis `1,T` makes `B` finite free of rank two over `A`,
  and the Jacobian `2T` is a unit, so the annulus map is finite étale and locally quasi-finite.
- *Boundary.* The same map over `ℚ₂` is finite étale: invertibility of `2` in the field is
  sufficient even though its residue characteristic is two.
- *Non-example.* Over `K = 𝔽₂((u))`, the same annulus map has
  `Ωᶜ_{B/A} = B·dT ≠ 0`, so it is neither unramified nor étale. In the complete square-zero
  extension `B[ε]/(ε²)` the continuous pair maps `T ↦ T` and `T ↦ T + ε` agree over `A`
  and modulo `ε` but are distinct; both coordinates remain invertible. This is the annulus
  specialization of the characteristic-`p` Frobenius Check of *differentials-unramified-smooth-etale*.

Lean: README target.

**Characterisations of unramified morphisms (Huber 1.6.8).** (*infinitesimal-criteria*) Let
`f : X → Y` be a morphism of locally Huber-standard adic spaces (continuous differentials and closedness
of `I²` need this), locally of finite type. Prove that the following are equivalent: (a) `f` is
unramified (*unramified-morphism*); (b) `Ω_{X/Y} = 0`, i.e. `Ωᶜ_{O_X(U)/O_Y(V)} = 0` for all
affinoid opens `U ⊆ X`, `V ⊆ Y` with `f(U) ⊆ V` (equivalently, for the members of one such affinoid
cover, by the localisation compatibility of *continuous-differentials*); (c) the diagonal
`Δ_f : X → X ×_Y X` is an open embedding; (d) every `x ∈ X` has an open neighbourhood `U` such that
`f|_U` factors as a closed embedding `U → Z` followed by an étale morphism `Z → Y` (Huber96 §1.6, Prop.
1.6.8, p. 79; Huber's condition (d) is the stronger "for every open affinoid `U` with `f(U)` inside an
open affinoid of `Y`, `f|_U` factors through a closed embedding into an affinoid `Z` étale over
`Y`"; the local form is what is proved and used, and it is equivalent to (a); the proof transports
EGA IV 17.4.1–17.4.2). The squaring map `D → D` (`2 ∈ K^×`) has `Ωᶜ = K⟨T⟩/(2T)·dT`, supported at the
origin, and is unramified exactly on the complement of the origin. Scheme analogues: Mathlib
`Algebra.FormallyUnramified` (defined by `Ω = 0`), `Algebra.FormallyUnramified.iff_comp_injective`,
and the instance `Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul` (the diagonal of a
formally unramified finite-type map is an open immersion). *Needs:* *unramified-morphism*;
*continuous-differentials*; *conormal-sequence*; *jacobian-criterion-closed-subspace*;
*etale-smooth-composition*; *differentials-unramified-smooth-etale*; *open-embedding-etale*;
*diagonal-locally-closed*; *completed-tensor-product*; *etale-smooth-locality*;
*locally-huber-standard*; Mathlib `Algebra.FormallyUnramified`,
`Algebra.FormallyUnramified.iff_comp_injective`.
Lean: README target.

`AdicSpace.Unramified.iff_openImmersion_diagonal` carries locally Huber-standard `X`,
`Y`, a locally finite-type `f : X → Y` and its pullback with itself, and states (a) iff (c).
`AdicSpace.Unramified.iff_closed_etale_factorisation` carries the same spaces and
finite-type hypothesis, and states (a) iff (d), with the commuting factorisation on an
open neighbourhood of every source point.

**Continuous differentials of a smooth morphism are locally free (Huber 1.6.9(i)).**
(*smooth-differentials-locally-free*) Let `f : X → Y` be a smooth morphism of locally Huber-standard
adic spaces (*smooth-morphism*; locally Huber-standard as required by *continuous-differentials*).
Prove that `Ω_{X/Y}` is locally free of finite rank: every `x ∈ X` has affinoid neighbourhoods
`U ∋ x`, `V ⊇ f(U)` such that `Ωᶜ_{O_X(U)/O_Y(V)}` is a finite free `O_X(U)`-module (Huber96 §1.6,
Prop. 1.6.9(i), p. 79; Zavyalov24 §5, proof of Lem. 5.9, for the public use: `Ω` of a smooth
morphism is locally free, coherent). For `D → Spa(K, K°)` the module `Ωᶜ` is free of rank `1`; for
the node `Spa(K⟨T₁,T₂⟩/(T₁T₂))` it is not locally free at the origin, so that space is not smooth.
The scheme analogue is Mathlib `Algebra.FormallySmooth` (`Ω` projective and `H¹` of the cotangent
complex zero). *Needs:* *smooth-morphism*; *conormal-sequence*; *continuous-differentials*;
*locally-finite-presentation*; *locally-huber-standard*; Mathlib `Algebra.FormallySmooth`,
`Module.Projective`.
Lean: README target.

`AdicSpace.Smooth.differentials_projective` carries smoothness, locally Huber-standard
source and target, and a finite-type affinoid `HomChart`; its continuous differential
module is finite projective over the source coordinate ring. After shrinking about a
specified point it is finite free, as above (Huber96, Proposition 1.6.9(i)).

**Jacobian criterion for closed subspaces of smooth spaces (Huber 1.6.9(ii)).**
(*jacobian-criterion-closed-subspace*) Let `g : Z → Y` be a smooth morphism of locally Huber-standard
adic spaces, `X ⊆ Z` a closed adic subspace with a locally finitely generated ideal sheaf `J`
(*closed-adic-subspaces-and-embeddings*), and `x ∈ X`. In the formal statement, finite generation is required
explicitly for each affinoid ideal `J.ideal z`.
Prove that `X → Y` is étale (resp. smooth) on an open neighbourhood of `x` if and only if there are
sections `g₁,…,g_r` of `J` on a neighbourhood of `x` generating `J` there such that `dg₁,…,dg_r`
form a basis (resp. part of a basis) of the free module `Ω_{Z/Y}` near `x`
(*smooth-differentials-locally-free*) (Huber96 §1.6, Prop. 1.6.9(ii), p. 79, stated there — with
Huber's `X` the smooth `Z` here and vice versa — with generators of the stalk `J_x` whose
differentials form (resp. extend to) a basis of the stalk `(Ω_{Z/Y})_x`; the two forms agree after
shrinking, the modules being of finite presentation; Zavyalov24 §5, proof of Lem. 5.9, for the public
use: generators of the ideal whose differentials extend to a basis).
These equivalences are stated using `AdmissibleIdealSheaf.stalk`, `continuousDifferentialStalk`,
and `fromKaehlerStalk`; an affinoid chart containing `x` expresses the open neighbourhood.
The generators are existential: redundant generators need not have independent differentials.
For a finite weighted polynomial presentation over an affinoid ring in Huber's standing class,
with the quotient topology, the stated kernel and the integral plus ring, a unit `r × r` minor
gives smoothness, and a unit Jacobian determinant gives étaleness in the square case `r = n`
(Huber96, Prop. 1.7.1, p. 80). For `Z = D` over `Spa(K, K°)`
and `X = V(T² − a)` with `a ∈ K^×`, `|a| ≤ 1`, `2 ∈ K^×`: `d(T² − a) = 2T dT` is a basis on `X` (`T`
is a unit there, `T² = a`), so `X → Spa(K, K°)` is étale; for `|a| > 1`, `T² − a` is a unit of
`K⟨T⟩` and `X = ∅`. The criterion reads the determinant in `O_X`, not in `O_Z`: `2T` is not a unit
of `K⟨T⟩`, yet it is one on `X`. With `p = 2` and `K = ℚ_2`, `a = 3`: `2 ∈ ℚ_2^×`, so `2T` is a unit
on `X = Spa(ℚ_2(√3))` and `X → Spa(ℚ_2, ℤ_2)` is étale although `ℤ_2[√3]` is ramified over `ℤ_2`;
étaleness tests the ring map `ℚ_2 → ℚ_2(√3)`, not the plus rings. If the determinant is not a unit
the conclusion fails: for `a = 0`, `X = V(T²)`, `d(T²) = 2T dT` with `2T` nilpotent on `X`, and
`X → Spa(K, K°)` is not étale, not even unramified (`Ω_{X/K} = K[T]/(T²)·dT/(2T dT) ≠ 0`).
The Check `jacobianCriterion_test_nilpotent_determinant` uses `DualNumber K`
with its product topology and the scalar pair map: `Unramified_affinoid` fails,
`ContinuousKaehlerDifferential.D K (DualNumber K) ε ≠ 0`, and `2ε` is not a unit,
including in characteristic two. For
`g = T(T − a)` with `a ∈ K°`, `a ≠ 0`, `dg = (2T − a) dT` and `2T − a` takes the values `−a`, `a`
at the two points of `X = V(g)`, a unit, so `X`, two copies of `Spa(K, K°)`, is étale. *Needs:*
*smooth-morphism*;
*differentials-unramified-smooth-etale*; *conormal-sequence*; *smooth-differentials-locally-free*;
*closed-adic-subspaces-and-embeddings*; *continuous-differentials*;
*locally-huber-standard*.
Lean: README target.

- *Degenerate.* With no equations the
  empty minor has determinant `1`; this gives smoothness, and gives étaleness when
  there are also no variables. A positive-dimensional polydisc is smooth but not étale.
- *Computation.* The equation `T = 0`
  in one variable has Jacobian determinant `1`, giving an étale copy of the base.
- *Negative control.* The equations
  `(T₁, T₁)` generate the same ideal as `T₁` in `ℚ[T₁,T₂]`, but their square
  Jacobian has determinant `0`. Their closed subspace is smooth of relative dimension
  one; the converse chooses `T₁` alone, whose differential extends to a basis.

**Differential criterion for étale and smooth morphisms between smooth spaces (Huber 1.6.9(iii)).**
(*differential-criterion-morphism*) Let `X` and `X'` be locally Huber-standard adic spaces smooth over
`Y` (`Y` locally Huber-standard) and `h : X → X'` a `Y`-morphism, `x ∈ X`. Prove that `h` is étale on a
neighbourhood of `x` if and only if the canonical map `O_{X,x} ⊗ Ωᶜ_{X'/Y,h(x)} → Ωᶜ_{X/Y,x}` is
bijective at `x` (on the stalk, equivalently after `⊗ k(x)`), and that `h` is smooth on a
neighbourhood of `x` if and only if this map is injective with a left inverse (split injective) near
`x` (Huber96 §1.6, Prop. 1.6.9(iii), p. 79, which states this with `X` smooth over `Y` and `X' = Z`
only locally of finite type over `Y`; `X'` smooth is the case used downstream and the hypothesis EGA
IV 17.11.2 needs in the étale direction). The map `U → D^d` of Zavyalov24 §5, proof of Lem. 5.9,
sending `Tᵢ` to functions `gᵢ` with `dgᵢ` a basis of `Ω`, is étale; this is the step used in
*smooth-local-structure*. On complete sheafy affinoids with coefficient maps `A → B → C`,
where `A` is in Huber's standing class and both `Spa(B) → Spa(A)` and `Spa(C) → Spa(A)` are smooth,
étaleness of `Spa(C) → Spa(B)` is bijectivity of `C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A}`, and smoothness is the
existence of a `C`-linear left inverse. The algebra structures
form a scalar tower and agree with the continuous pair homomorphisms. These affinoid criteria
apply after shrinking around the point (Huber96, Prop. 1.6.9(iii), p. 79).
*Needs:* *smooth-morphism*; *differentials-unramified-smooth-etale*;
*smooth-differentials-locally-free*; *first-fundamental-sequence*; *etale-smooth-composition*;
*etale-smooth-cancellation*; *locally-huber-standard*.
`AdicSpace.smooth_iff_split_differentials` carries the three locally Huber-standard
spaces, both smooth structure maps to `Y`, the commuting `Y`-morphism and the point `x`;
it states the smoothness equivalence with a locally split injective differential map above.
The affinoid version carries the adic maps and scalar tower `A → B → C` and gives the
existence of a `C`-linear left inverse after shrinking around `x`.

Lean: README target.

**Base change of unramified, smooth and étale morphisms.** (*smooth-etale-base-change*) Let
`f : X → S` and `g : Y → S` be morphisms of adic spaces, `g` not necessarily adic, with `X`, `S`,
`Y` and `X ×_S Y` locally Huber-standard. The fibre product exists by
*fibre-products-existence*, case (a) (`f` is locally of finite type, and `Y`, being locally
noetherian, is covered by open affinoids `Spa(B, B⁺)` with `B` complete and stably sheafy), and the
class on `S` gives the finite-relation condition of clause (iv) of *base-change-stability*, so local
finite presentation passes to the projection. Let `Z = X ×_S Y` with projections
`p : Z → X` and `q : Z → Y`. Prove that if `f` is unramified (*unramified-morphism*), resp. smooth
(*smooth-morphism*), resp. étale (*differentials-unramified-smooth-etale*), then `q` is unramified,
resp. smooth, resp. étale, of the same relative dimension. The unramified assertion needs neither
the standing class nor analyticity. A pullback square alone does not suffice: over a base of
noetherian type outside the class even an adic base change of an étale map can fail to be étale
(*etale-standing-class-control*). For `X`, `Y` and `S` locally Huber-standard, finite generation of chart kernels gives the
alternative of clause (iv) that needs no analyticity; the relative-dimension statement asserts that if `f` is smooth of
relative dimension `n` at `p(z)`, then `q` is smooth of relative dimension `n` at `z`, with
affinoid-locally `Ωᶜ_{Z/Y} ≅ O_Z ⊗ Ωᶜ_{X/S}`
(*continuous-differentials*) (Huber96 §1.6, Def. 1.6.5, p. 78, the lifting conditions whose
stability under base change is asserted; Huber96 §1.6, Prop. 1.6.7(iv), p. 79, the statement, for
base change along an arbitrary morphism with the fibre product existing by his Prop. 1.2.2(a),
which Huber proves only by "can be proved similarly as for schemes"; KL15 §8.2, Def. 8.2.16 and
Lem. 8.2.17(c), p. 162, stability of Kedlaya–Liu's étale morphisms — locally an open immersion
followed by a finite étale morphism followed by an open immersion — under fibre products, which for
locally Huber-standard analytic adic spaces are Huber's étale morphisms by AdicEtaleGeometry layer A1
(*etale-morphisms-local-description-and-comparison*, from Huber's Lemma 2.2.8,
*etale-local-open-finite-etale-factorisation*); DLLZ-A §3.3, Rem. 3.3.12(1), p. 37, the
infinitesimal lifting conditions for trivial log structures are stable under base change whenever
the fibre product is defined; Huber94 §2, Prop. 2.1(i), p. 522, morphisms from `Spa` of a complete
pair into an affinoid are continuous ring homomorphisms; Wedhorn §8.1, Prop. 8.19, p. 79, the same
bijection in the category of pre-adic spaces, where `Spa B` need not be sheafy, which covers
Huber's test objects; Stacks Tag 02GO (Lem. 29.37.4), Tag 01VB (Lem. 29.35.5) and Tag 02GA
(Lem. 29.36.5), the scheme models of the étale, smooth and unramified cases). Every unramified,
smooth or étale morphism is locally of finite type, so the fibre product exists for every such
`g`. The lifting conditions are Huber's (Def. 1.6.5) with the test objects of this layer: `Spa T`
for complete Huber pairs `(T, T⁺)`, not necessarily sheafy, and closed ideals `I ⊆ T` with
`I² = 0`. Flatness is not part of this lemma: base change of flat morphisms is stated only for
locally quasi-finite ones (*flat-morphism*; Huber96 §1.6, 1.6.4(ii)), and étale morphisms of
analytic adic spaces are flat by *etale-flat-unramified*. For a complete extension `L/K` of
nonarchimedean fields, the base change of the étale Kummer map on the unit annulus
`Spa(K⟨T^{±1}⟩) → Spa(K⟨S^{±1}⟩)`, `S ↦ Tⁿ` (`n ∈ K^×`), along `Spa(L, L°) → Spa(K, K°)` is the
Kummer map on the unit annulus over `L`, again étale; the relative polydisc
`Spa A⟨X₁,…,Xₙ⟩ → Spa A` pulled back along an adic `Spa B → Spa A` is `Spa B⟨X₁,…,Xₙ⟩ → Spa B`,
smooth, of relative dimension `n` when `B` is in Huber's standing class (*restricted-power-series-smooth*);
and for non-adic `g`, the open embedding `Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)`, which is étale, pulled
back along `Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧) → Spa(ℤ_p, ℤ_p)` is the open embedding of the open unit disc over
`ℚ_p` (the locus `{|p| ≠ 0}` of `Spa ℤ_p⟦T⟧`, a proper open subset of its analytic locus, which
also contains the points with `|p| = 0 ≠ |T|`), étale and not quasi-compact
(*base-change-stability*), all four spaces being locally Huber-standard. *Needs:*
*unramified-morphism*; *smooth-morphism*; *differentials-unramified-smooth-etale*;
*base-change-stability*; *fibre-products-existence*; *affinoid-fibre-product*;
*fibre-product-along-finite-type*; *completed-tensor-product-universal-property*;
*continuous-differentials*; *smooth-differentials-locally-free*; *restricted-power-series-smooth*;
*etale-local-open-finite-etale-factorisation*; *flat-morphism*; *etale-flat-unramified*;
*locally-huber-standard*; Tau Ceti
`Huber.Pair.quotient`, `Huber.restrictedMvPowerSeriesCompletion`, `Huber.weightedRestrictedSubring`.
Lean: étale case `Etale.baseChange`, with all four spaces locally Huber-standard; the existence of
the square under these hypotheses is an `example` derived from `hasPullback_of_finiteType`.

*Checks for the three affinoid infinitesimal lifting predicates:*
- *Degenerate.* The identity pair map satisfies
  all three predicates; the required lift is the given structure map.
- *Non-example.* For a nonzero closed
  square-zero ideal `I`, `A → A/I` is formally unramified, but neither formally smooth
  nor formally étale. The identity diagram with test algebra `A` obstructs existence.
- *Computation.* The structure map of the closed
  `ℚ_p`-disc is formally smooth but neither formally unramified nor formally étale;
  its coordinate can be changed by a square-zero infinitesimal.
These Checks concern `Unramified_affinoid`, `Smooth_affinoid` and `Etale_affinoid` themselves.
The geometric predicates additionally impose the finiteness and local conditions above.

**The standing class is needed.** (*etale-standing-class-control*) Fix a prime `p`. Let `E` be the
ring of eventually constant sequences in `∏_{i ≥ 0} 𝔽_p`, `ε : E → 𝔽_p` the eventual value and
`J = ker ε` the ideal of finitely supported sequences, spanned by the orthogonal idempotents `e_i`;
`J` is not finitely generated, since finitely many finitely supported sequences generate only
sequences supported in their joint support. Put `A = ℤ_p ×_{𝔽_p} E` (reduction and `ε`), embed `ℤ_p`
diagonally, and take the images of `pⁿℤ_p`, `n ≥ 1`, as basic neighbourhoods of `0`; additively
`A = ℤ_p ⊕ J` with `J` discrete and `pJ = 0`. Then `A` is complete Hausdorff with open noetherian
ring of definition `ℤ_p` and ideal of definition `(p)`, so it is of noetherian type, `(A, A)` is a
sheafy Huber pair (every element is power-bounded, as `pⁿA = pⁿℤ_p`) and `Spa(A, A)` is locally
noetherian; but `A` is outside Huber's standing class (*huber-standing-class*), and `Spa(A, A)` is
not locally Huber-standard at the point `∞` below (*locally-huber-standard*). Let
`π : (A, A) → (B, B)`, `B = ℤ_p`, be the first projection: a continuous open surjection with closed
kernel `J`, finite as a morphism of pairs, with `A/pA ≅ E` discrete. (i) `Spa(π)` satisfies Huber's
Def. 1.2.1(v) as printed, with the zero-variable presentation on the chart `Spa(A, A)`, because the
ring `A` of that chart is not discrete; it satisfies the lifting test of `Etale_affinoid`, because
in a lifting problem each `e_i` goes to an idempotent lying in a square-zero ideal, hence to `0`, so
the given map out of `A` kills `J` and factors uniquely, continuously and compatibly with plus rings
through `B`. With the printed definition `Spa(π)` would therefore be étale and smooth. (ii) Its adic
base change along `A → A/pA = E` is `Spa(𝔽_p, 𝔽_p) → Spa(E, E)`; here `Spa(E, E)` is `ℕ ∪ {∞}`
with isolated coordinate points, and the image is `∞`. Every chart around `∞` has a discrete ring
whose kernel onto `𝔽_p` is again a non-finitely-generated ideal of finitely supported sequences, so
the base change is not locally of finite presentation and not étale. (iii) The image of `Spa(π)`
meets the closed subspace `V(p) = Spa(E, E)` in `{∞}`, which is not open there, so with the printed
definition `Spa(π)` would be a smooth map with non-open image over a locally noetherian target.
(iv) The ring map `A → B` is finite but not finitely presented (its kernel is `J`), so not
`RingHom.Etale`, although `Spa(π)` passes the printed tests; and a standard presentation of `π`,
reduced modulo `p`, would finitely present `E → 𝔽_p`. These four failures refute the broad forms of
`Etale.baseChange`, `Smooth.isOpenMap`, `Etale.iff_ringHom_etale_of_finite` and
`Etale.exists_standardPresentation` for Huber's printed definition over a base of noetherian type.
The Lean statements exclude the example twice: their hypotheses fail, since `Spa(A, A)` is not
locally Huber-standard and `A` is neither noetherian nor in the standing class; and `Spa(π)` is not
`LocallyOfFinitePresentation`, hence not `Etale`, since no chart of `Spa(A, A)` around `∞` is in the
standing class. Lean: the ring-level part, that `ker ε` is not finitely generated, is an `example`;
the adic part is this README Check.

**The standing class is needed on the witness charts.** (*etale-standing-class-product-control*)
Keep `p`, `E`, `ε` and `J` as in *etale-standing-class-control*. Let `P = ℤ_p × E` with the product
topology (`ℤ_p` `p`-adic, `E` discrete). It is a complete Huber ring with ring of definition
`{(a, ā·1) : a ∈ ℤ_p} ≅ ℤ_p` (`ā` the residue of `a`) and ideal of definition generated by `(p, 0)`;
`(P, P)` is a sheafy Huber pair (every element is power-bounded), and
`Spa(P, P) = Spa(ℤ_p, ℤ_p) ⊔ Spa(E, E)` with `Spa(E, E) = ℕ ∪ {∞}` as above. `P` is of noetherian
type but outside Huber's standing class: it is not finitely generated over that ring of definition
(`E` is not finitely generated over `𝔽_p`, its finitely generated subalgebras being finite), it is
not Tate (its projection to the discrete `E` is not) and it is not discrete. Unlike `Spa(A, A)` in
*etale-standing-class-control*, `Spa(P, P)` is locally Huber-standard: the points of `Spa(ℤ_p)`
have the chart `Spa(ℤ_p)`, and the points of `Spa(E, E)`, including `∞`, have discrete charts
inside `Spa(E, E)`. Let `σ : P → 𝔽_p` be the second projection followed by `ε`, and
`Spa(σ) : Spa(𝔽_p, 𝔽_p) → Spa(P, P)` the induced morphism, with image `{∞}`. (i) Through the chart
`Spa(P, P)` itself, whose ring is neither discrete nor in the standing class, `Spa(σ)` passes
Def. 1.2.1(v) as printed (zero-variable presentation; `σ` is a continuous open surjection) and
every square-zero lifting test: `ker σ = ℤ_p × J` is generated by the idempotents `(1, 0)` and
`(0, e_i)`, which a lifting problem sends into a square-zero ideal, hence to `0`, so the map factors
uniquely through `σ`. (ii) Its base change along the open and closed immersion
`Spa(E, E) → Spa(P, P)` (adic, `(p, 0) ↦ 0`) is `Spa(𝔽_p) → Spa(E, E)`, which is not locally of
finite presentation: every chart around `∞` is discrete, with a non-finitely-generated kernel onto
`𝔽_p`. (iii) The image `{∞}` is open neither in `Spa(E, E)` nor in `Spa(P, P)`. All four spaces of
this base-change square are locally Huber-standard, so with Huber's printed definition the example
would refute `Etale.baseChange` and `Smooth.isOpenMap` even under their standing-class hypotheses.
The requirement of *locally-finite-presentation* that the witness chart lie in Huber's standing
class excludes it: the standard charts around `∞` are the discrete charts inside `Spa(E, E)`, where
finite presentation is demanded and fails, so `Spa(σ)` is not `LocallyOfFinitePresentation` and
neither smooth nor étale. Lean: the ring-level part is the `example` of
*etale-standing-class-control*; the adic part is this README Check.

### R0.17 local structure of étale and smooth morphisms; étale affinoid morphisms over a field

The results of this subsection are stated for a Huber pair `A = (A, A⁺)` which need not be complete
but whose completion `Â` is in Huber's standing class (*huber-standing-class*; Huber96 §1.1,
(1.1.1), p. 37, Huber's standing assumption), so that every affinoid ring topologically of finite
type over `A` is again in the class and of noetherian type (*huber-standing-class*,
*topologically-finite-type-noetherian-type*); this does not imply a noetherian ring of definition
in the strongly noetherian Tate case (for example `ℂ_p`). `Spa` of a non-complete pair means `Spa`
of its completion. The spaces involved are locally Huber-standard, as in R0.16. In the checks `K`
is a complete nonarchimedean field with nontrivial rank-one valuation, `K°` its valuation ring, `ϖ` a
pseudo-uniformiser and `D = Spa(K⟨T⟩, K°⟨T⟩)`.

**Finite étale adic spaces over a noetherian affinoid are finite étale algebras (Huber 1.6.6(ii)).**
(*finite-etale-algebra-comparison*) Let `(A, A⁺)` be a complete Huber pair whose ring `A` is
noetherian and in Huber's standing class (Huber96 §1.6, Ex. 1.6.6(ii), pp. 78–79, is stated for
noetherian complete f-adic rings, under the standing assumption (1.1.1)). A complete strongly
noetherian Tate ring is noetherian (`TauCeti.Huber.isNoetherianRing_of_isStronglyNoetherian`) and in the class,
so the strongly noetherian Tate case is a special case; in that case the construction
*finite-algebra-over-affinoid* and Zavyalov-Q B.2.18 are available. Prove that `C ↦ Spa(C, C⁺)`,
`C` with its natural module topology and `C⁺` the integral closure of `A⁺`, is an equivalence from
finite étale `A`-algebras to spaces finite étale over `Spa(A, A⁺)`, with inverse `X ↦ O_X(X)`; at
the level of a single finite morphism of affinoids, adic étaleness agrees with algebraic
étaleness of the ring map. For strongly noetherian Tate `A`, prove that the contravariant functor
`Etale.finiteEtaleFunctor`,
`C ↦ Spa(Huber.Pair.finiteAlgebra C)` (*finite-algebra-over-affinoid*), from finite
étale `A`-algebras (Mathlib `Algebra.Etale A C` with `C` a finite `A`-module) and `A`-algebra maps, to
adic spaces `X` with a finite (*finite-morphism*) and étale (*differentials-unramified-smooth-etale*)
morphism `X → Spa(A, A⁺)` and `Spa(A, A⁺)`-morphisms, is an equivalence of categories, with
quasi-inverse `X ↦ O_X(X)`. The theorem `Etale.finiteEtaleEquiv` states the
contravariant equivalence between the full subcategory of `Over A.spa` cut out by
`IsFinite` and `Etale`, and Mathlib’s `(CommAlgCat.FiniteEtale A.ring)ᵒᵖ`. Its
ring isomorphisms with global sections respect the coefficient maps and are
natural for every morphism over `A.spa`; the plus ring of the adic space attached to `C` is the integral closure
of `A⁺` in `C` (Huber96 §1.6, Ex. 1.6.6(ii), pp. 78–79, which Huber states for any noetherian complete
f-adic `A`; beyond the strongly noetherian Tate case the essential surjectivity rests on Huber's
[Hu4], finite morphisms to noetherian affinoids being affinoid there; Zavyalov-Q Appendix B.2, Thm B.2.18, p. 47: finite morphisms to strongly
noetherian Tate affinoids are affinoid; KL15 §8.2, Lem. 8.2.17(a), for the analogous equivalence for
Kedlaya–Liu's finite étale morphisms, and KL15 §8.2, Rem. 8.2.18, for why `A` is taken strongly
noetherian, so that `Spa` of a finite étale algebra is an adic space). For `A = K` a complete
nonarchimedean field, finite étale adic spaces over `Spa(K, K°)` are the finite disjoint unions of
`Spa(L, L°)` for `L/K` finite separable (Mathlib's description of étale algebras over a field as
finite products of finite separable extensions, in `Algebra.Etale`); for adic Banach rings, Kedlaya–Liu's finite étale morphisms to `Spa(A, A⁺)` (in their ad hoc
sense) form `FÉt(A)`, and this statement identifies Huber's finite étale morphisms with the same
category in the strongly noetherian case. AdicEtaleGeometry layer A1 consumes this comparison.
Checks: `ℚ_p` and `ℤ_p⟦T⟧` are noetherian and in the class. The ring `A = ℤ_p ×_{𝔽_p} E` of
*etale-standing-class-control* is neither, and there the comparison fails for Huber's printed
definition: `Spa ℤ_p → Spa(A, A)` is finite and passes the printed étale tests, while `A → ℤ_p` is
not étale; in the sense of R0.16 `Spa ℤ_p → Spa(A, A)` is not étale (no chart around `∞` in the
standing class). Likewise for the direct product `ℤ_p × E` of
*etale-standing-class-product-control*: `Spa 𝔽_p → Spa(ℤ_p × E)` is finite, passes the printed
tests, and `ℤ_p × E → 𝔽_p` is not étale (not finitely presented). Lean: affinoid core
`Etale.iff_ringHom_etale_of_finite` (finite `φ`, `A.ring` noetherian and in Huber's standing class).

The equivalence property of this named functor holds, the functor being defined as the inverse in
`Etale.finiteEtaleEquiv`. Under the same strongly noetherian Tate hypotheses, the functor is
identified
naturally with finite affinoid presentations: for each finite étale algebra C,
a finite pair map A → B(C) and a ring isomorphism C ≃ B(C) respecting A give an
isomorphism over Spa(A) from the functor's value to Spa(B(C)). For every algebra
map C → D and pair map B(C) → B(D) representing it, these isomorphisms intertwine
the functor's arrow with the induced morphism of affinoids in the reversed direction. Taking B(C)
from `Pair.finiteAlgebra` supplies the specified topology and integral plus ring;
`Pair.finiteAlgebra.homEquiv` supplies its arrows and the description of finite spaces over
strongly noetherian Tate affinoids (*finite-algebra-over-affinoid*) supplies essential surjectivity. These are the
object and morphism identifications in Huber96, Example 1.6.6(ii), pp. 78–79;
KL15, Lemma 8.2.17(a) and Remark 8.2.18, p. 162, give the global-sections
comparison and its sheafiness qualification in their setting.

**Checks for `Etale.finiteEtaleFunctor`** (A strongly noetherian Tate):

- The algebra A gives the identity object of `Over A.spa`.
- The empty product `Fin 0 → A` gives the empty adic space.
- When A is nonzero, evaluation at the two
  coordinates of `Fin 2 → A` gives distinct arrows from Spa(A) to its split double cover.
- For C → D → E, the induced arrow from
  Spa(E) to Spa(C) is the composite through Spa(D), in that order.

*Needs:* *finite-algebra-over-affinoid*; *finite-morphism*;
*differentials-unramified-smooth-etale*; *infinitesimal-criteria*; *continuous-differentials*;
*etale-flat-unramified*; *etale-ring-flatness*; Mathlib `Algebra.Etale`,
`Algebra.FormallyEtale.iff_comp_bijective`, Mathlib's criterion that a flat formally unramified
algebra of finite presentation is étale (in `Algebra.Etale`); Tau Ceti
`TauCeti.Huber.IsStronglyNoetherian`; *huber-standing-class*.

**Morphisms of Huber pairs of algebraically finite type.** (*algebraically-finite-type-ring-map*)
Let `(A, A⁺)` be a Huber pair (not necessarily complete). For finite subsets `M₁,…,Mₙ ⊆ A` with each
`MᵢA` open, let `A[X₁,…,Xₙ]_M` be the polynomial ring `A[X]` with the subspace topology of `A⟨X⟩_M`
(Huber94 §3; for Tate `A` and `Mᵢ = {1}` the Gauss-norm topology) and plus ring the integral closure
of `A⁺[m·Xᵢ : m ∈ Mᵢ, 1 ≤ i ≤ n]`. A morphism of Huber pairs `φ : (A, A⁺) → (B, B⁺)` is *of
algebraically finite type* if it factors through a quotient mapping `A[X₁,…,Xₙ]_M → B`, i.e. a
surjective, continuous, open ring homomorphism with `B⁺` the integral closure of the image of the
plus ring (Huber94 §3, before Lem. 3.5, printed p. 534, Huber's definition of quotient mappings of
affinoid rings, used with the polynomial ring in place of `A⟨X⟩_M`). This is the polynomial
analogue of Huber's topologically finite type. Prove the comparison with Huber's definition,
identifying this presentation with Huber96 §1.2,
Def. 1.2.5(i)–(ii), p. 50: `A → B` is adic and of finite type, some rings of definition
`A₀ → B₀` give a finite-type map, and `B⁺` is the integral closure of an open subring `D`
containing the image of `A⁺`. The restricted map `A⁺ → D`, with the induced topologies, must
also be adic and of finite type and admit rings of definition on which it is of finite type.
The comparison uses the finite generators in Huber96 Rem. 1.2.6(ii)–(iii), p. 50, to choose
weighted polynomial presentations. Corollary 1.7.3(iii), p. 86, uses this notion; the geometric
definition is Def. 1.2.5(iii), p. 50, with its scheme-model characterization on p. 51 after
(1.2.7). The completion of such a `φ` is topologically of finite type by Rem. 1.2.6(i), p. 50,
and the AdicSpaces completion comparison gives `Spa B ≅ Spa B̂`. In
`Huber.Pair.Hom`, define `IsAlgebraicallyFiniteType φ` as the predicate: `φ` factors through a
quotient mapping `A[X₁,…,Xₙ]_M → B`, and `Huber.Pair.polynomialWeighted` as the Huber pair
`A[X₁,…,Xₙ]_M` with the induced topology and plus ring the integral closure of `A⁺[m·Xᵢ]`.
Lean: README target.

`Pair.polynomialWeighted.isHuberRing` states that the supplied weighted polynomial
carrier is Huber for a finite weight family over a Huber ring
(Huber94, Definition 3.6(i)); its ring and topology are those of
`TauCeti.Huber.weightedPolynomials`.

Prove
`IsAlgebraicallyFiniteType.finiteType` (the underlying ring map is `Algebra.FiniteType`),
`IsAlgebraicallyFiniteType.completion` (the completed morphism `Â → B̂` is topologically of finite
type, and `Spa B ≅ Spa B̂`), and
`IsAlgebraicallyFiniteType.exists_fg_plus_ringOfDefinition`: for any such morphism of Huber
pairs, a single finite subset `L ⊆ B` gives `B⁺` as the integral closure of `A⁺[L]`, and
`A₀[L]` is a ring of definition of `B` for every ring of definition `A₀` of `A`
(Huber96 Rem. 1.2.6(iii), p. 50). Prove `IsAlgebraicallyFiniteType.exists_fg_plus` under the
additional hypothesis that `A` is Tate: the same finitely generated `A⁺`-subalgebra `B₁⁺`
satisfies `A·B₁⁺ = B`. To deduce this span assertion, choose `A₀ ⊆ A⁺` and rescale each
element of `B` into `A₀[L]` by a power of a topologically nilpotent unit of `A`.
This is the additional Tate argument used by Scholze13 §6,
[proof of 6.12, p. 38](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf#page=38).
Prove `IsAlgebraicallyFiniteType.comp` (composites
are of algebraically finite type), `IsAlgebraicallyFiniteType.id` (the identity is of algebraically
finite type), `IsAlgebraicallyFiniteType.localizationAway` (`A → A[1/g]` with plus ring the integral
closure of `A⁺[m/g]`, for a finite `M` with `MA` open, is of algebraically finite type; used to
invert a Jacobian) and `isAlgebraicallyFiniteType_iff_huber` (`φ` is of algebraically finite type
iff it satisfies all the ring and plus-ring conditions of Huber96 Def. 1.2.5(i)–(ii) stated
above, without completeness or Tate hypotheses). For the `p`-adic Huber pair
`(W(κ)[1/p][T^{±1}], W(κ)[T^{±1}]) → (R₀, R₀⁺)` of Scholze13 §6, Lem. 6.12, `(R₀, R₀⁺)` is of
algebraically finite type and its completion is the étale affinoid `(R, R⁺)`. *Needs:*
*finite-type-morphism-classes*; Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`,
`TauCeti.Huber.IsTopologicallyFiniteType`; Mathlib `Algebra.FiniteType`.

**Checks.**

- *Computation.* For a prime `p` and `κ = 𝔽_p`, take
  `A = (ℚ_p, ℤ_p) = (W(𝔽_p)[1/p], W(𝔽_p))` with the `p`-adic topology and
  `B = (ℚ_p[T^{±1}], integral closure of ℤ_p[T^{±1}])`. Then `A → B` is of
  algebraically finite type (quotient of `A[X, Y]` by `(XY − 1)`, `Mᵢ = {1}`), and its completion is
  the torus `(ℚ_p⟨T^{±1}⟩, ℤ_p⟨T^{±1}⟩)`.
- *Non-example.* `(ℚ_p, ℤ_p) → (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is
  topologically of finite type but not of algebraically finite type (`ℚ_p⟨T⟩` is not a finitely
  generated `ℚ_p`-algebra).
- *Degenerate.* The identity of a Huber pair and the quotient
  maps `(A, A⁺) → (A/J, integral closure)` are of algebraically finite type (`n = 0`).
- Reduction `ℤ_p → 𝔽_p`, as a map of Huber pairs, is algebraically of finite type and is a finite-type ring map. Its map on completions sends `p` to zero and `1` to a nonzero element.
- *Non-example.* Take `S = (ℤ_p, ℤ_p)`,
  one variable, weight `{p}`, and `T = Pair.polynomialWeighted S M`. The constant inclusion
  `φ : S → T` is of algebraically finite type, with the identity as its quotient presentation.
  Its plus ring is the integral closure of `ℤ_p[pX]` in `ℤ_p[X]`, and excludes `X`:
  substituting `X` into a monic integral relation of degree `d` gives coefficient `1` at `X^d`
  from the monic term, while every other contribution to that coefficient is divisible by `p`.
  For any finite `s` giving this integral closure, `R = ℤ_p[s]` lies in `T.plus` and its
  `ℤ_p`-span is `R`, so that span cannot be all of `ℤ_p[X]`. Thus the Tate hypothesis in
  `IsAlgebraicallyFiniteType.exists_fg_plus` is essential.

**Standard étale presentation of étale affinoid maps (Huber 1.7.1).** (*etale-local-structure*) Let
`A = (A, A⁺)` be a Huber pair (not necessarily complete) whose completion is in Huber's standing
class (including the discrete case; the class is used in point (3) of Huber's proof) and
`s : X → Y = Spa A` a morphism of adic spaces with
`X` affinoid. Prove that the following are equivalent: (i) `s` is étale
(*differentials-unramified-smooth-etale*); (ii) there are `n ≥ 0`, finite subsets `T₁,…,Tₙ ⊆ A` with
each `TᵢA` open, and `f₁,…,fₙ ∈ B := A⟨X₁,…,Xₙ⟩_{T₁,…,Tₙ}` such that, with `I = (f₁,…,fₙ) ⊆ B`, the
image of `det(∂fᵢ/∂Xⱼ)` in `B/I` is a unit and `X` is `Y`-isomorphic to `Spa(B/I)`; (iii) the same
with `f₁,…,fₙ ∈ A[X₁,…,Xₙ]` (Huber96 §1.7, Prop. 1.7.1, p. 80, with its proof, pp. 81–85: (i) ⇒ (ii)
via the conormal sequence and 1.6.8–1.6.9, (ii) ⇒ (iii) via points (1)–(4), point (3) using the
noetherian standing assumption, (iii) ⇒ (i) via 1.6.7(i) and 1.6.9). Here `B/I` is the quotient Huber
pair (plus ring the integral closure of the image), and `Spa(B/I)` is `Spa` of its completion. The
number of equations equals the number of variables. If `A` is Tate, the presentation in (iii) can be
chosen with `T₁ = … = Tₙ = {1}`, so `X ≅ Spa(A⟨X₁,…,Xₙ⟩/(f₁,…,fₙ))` with unit Jacobian (Huber96 §1.7,
Cor. 1.7.2(ii), p. 85).
On the complete sheafy carriers `A B : AdicSpace.Affinoid`, assume that `A.ring` and `B.ring` are in
Huber's standing class (`Huber.IsHuberStandard`) and fix `φ : Pair.Hom A.pair B.pair`.
`AdicSpace.Etale.exists_standardPresentation` gives (i) ⇒ (iii), and
the converse statement gives (iii) ⇒ (i), hence applies directly to the
Kummer presentation; the restricted form states (i) ⇔ (ii),
using the coordinates of `ContinuousKaehlerDifferential.D` in
`ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis` for the partial derivatives.
Each presentation includes a continuous open quotient map onto `B.ring`, agreement with `φ`
on coefficients, the kernel generated by the displayed equations, and equality of the
integral plus ring. With `IsTateRing A.ring`, the Tate form supplies the polynomial
presentation with every weight equal to `{1}`, under the same standing-class hypothesis.
The completion convention identifies these signatures with the formulation over a
not necessarily complete Huber pair above.
For `n ∈ K^×`, the Kummer cover of the annulus is
`Spa(K⟨S^{±1}⟩⟨T⟩/(Tⁿ − S))` with Jacobian `nTⁿ⁻¹` a unit. The unit condition is read in `B/I`: for
`A = K⟨S⟩` (the closed disc) and `f = X² − S`, `∂f/∂X = 2X` is a unit of `K⟨S⟩⟨X⟩/(X² − S)` only if
`S` is a unit of `A`, which fails on the disc, and indeed `S ↦ T²` is not étale at the origin
(the squaring Check of *unramified-morphism*); over the annulus `K⟨S^{±1}⟩` it is a unit (`2 ∈ K^×`).
In characteristic `p` with `f = X^p − S` the derivative is `0` for every `A` and no standard
presentation exists, matching the Frobenius Check of *differentials-unramified-smooth-etale*. For
`n = 0`, (ii) reads `B = A`, `I = 0`, the empty Jacobian determinant is `1`, and `X = Y` with the
identity, étale. Without the standing class (i) ⇒ (iii) fails (*etale-standing-class-control*). The
scheme analogue is Mathlib's characterisation of étale algebras as those with a submersive
presentation with as many relations as generators (standard smooth of relative dimension zero, in
`Algebra.Etale`); Mathlib's single-variable `Algebra.IsStandardEtale` (with
`StandardEtalePair`) is the case `n = 1`, and the ring-level local structure theorems
`Algebra.IsEtaleAt.exists_isStandardEtale` and
`Algebra.IsUnramifiedAt.exists_hasStandardEtaleSurjectionOn` are the scheme analogues of this
statement; the Huber-pair version, with the weighted restricted power series `A⟨X⟩_T` in place of
polynomial rings, is what is proved here. *Needs:* *differentials-unramified-smooth-etale*;
*conormal-sequence*;
*infinitesimal-criteria*; *jacobian-criterion-closed-subspace*; *continuous-differentials*;
*restricted-power-series-smooth*; *open-embedding-etale*; *etale-presentation-perturbation*;
*locally-finite-presentation*; *finite-type-morphism-classes*; *noetherian-type-huber-ring*;
*huber-standing-class*; Tau
Ceti `TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `TauCeti.Huber.weightedRestrictedSubring`;
Mathlib `Algebra.Etale`, `Algebra.SubmersivePresentation`, `StandardEtalePair`, `Algebra.IsStandardEtale`,
`Algebra.IsEtaleAt.exists_isStandardEtale`,
`Algebra.IsUnramifiedAt.exists_hasStandardEtaleSurjectionOn`.
Lean: `Etale.exists_standardPresentation` ((i) ⇒ (iii), complete base, the rings of `Spa A` and `X`
in Huber's standing class).

**Stability of standard étale presentations under perturbation (Huber 1.7.2).**
(*etale-presentation-perturbation*) Let `A` be a Huber pair whose completion is in Huber's standing
class (including the discrete case), let each `Tᵢ ⊆ A` be finite with `TᵢA` open, and put
`B = A⟨X₁,…,Xₙ⟩_{T₁,…,Tₙ}`. Let `f₁,…,fₙ ∈ B` have `det(∂fᵢ/∂Xⱼ)` a unit in
`B/(f₁,…,fₙ)` (the setting of Huber 1.7.1(ii)). Prove that for every neighbourhood `V` of `0` in
`B/(f)` there is a neighbourhood `S` of `0` in `B` such that for all `f'₁,…,f'ₙ` with `f'ᵢ − fᵢ ∈ S`,
the Jacobian of `(f')` is a unit in `B/(f')` and there is a `Spa A`-isomorphism
`e : Spa(B/(f)) → Spa(B/(f'))` with `e*(x̄'ᵢ) ∈ x̄ᵢ + V` (`x̄ᵢ`, `x̄'ᵢ` the images of `Xᵢ`) (Huber96
§1.7, Cor. 1.7.2(i) and proof, p. 85, resting on the points (1)–(4) of the proof of Prop. 1.7.1,
pp. 81–84, point (3) being where the noetherian standing assumption enters).
The affinoid form states both conclusions on the completed weighted-series carrier. Its parameter `P : Pair A` retains the base plus ring; it represents
`e` by its pullback `eStar : B/(f') ≃ₐ[A] B/(f)`, with continuity of `eStar` and its inverse,
equality of the plus rings under `eStar`, and `eStar(x̄'ᵢ) − x̄ᵢ ∈ V` for every coordinate.
The quotient pairs are Tau Ceti's `Pair.quotient` applied to `Huber.Pair.weightedRestricted`.
The `A`-algebra condition makes the isomorphism lie over `Spa A`; the topology and plus-ring
conditions make it an isomorphism of affinoid pairs, hence of their adic spaces. The formal base
is complete and in Huber's standing class, including discrete bases; the statement for an incomplete
base uses its completion and the completion-invariance of the weighted series and spectrum
(AdicSpaces §§0.3–0.4 and Tau Ceti's `ValuationSpectrum.spaCompletionHomeomorph`). The Tate refinement
`Tᵢ = {1}` (Cor. 1.7.2(ii)) is stated in *etale-local-structure*. Over `K`:
`Spa(K⟨T⟩/(T² − a − ε)) ≅ Spa(K⟨T⟩/(T² − a))` for `a ∈ K` with `|a| = 1`, `2 ∈ K^×`, and `|ε|` small
(a Krasner-type perturbation). *Needs:* *noetherian-type-huber-ring*; Tau Ceti
`TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `TauCeti.Huber.weightedRestrictedSubring`;
`Huber.Pair.weightedRestricted`; Tau Ceti `TauCeti.Huber.Pair.quotient`;
AdicSpaces §§3.3–3.4, 5; *huber-standing-class*.
Lean: README target.

**Checks.**

- With no variables or equations,
  the equation ideal is zero and the empty Jacobian determinant is `1`; the presentation is
  unchanged and the coordinate condition is empty.
- For `f' = f`, the identity pullback
  has coordinate difference zero, belonging to every prescribed zero neighbourhood `V`.
- For `B = A⟨X⟩`, `f = X` and
  `f' = X − c`, every `A`-algebra pullback `B/(X − c) ≃ₐ[A] B/(X)` sends the new coordinate
  to the image of `c`. Its difference from the old coordinate is `c`, fixing the direction
  and sign of the bound; if that image is outside `V`, no such pullback satisfies the bound.

**Algebraic models of affinoid étale maps (Huber 1.7.3(iii)).** (*etale-algebraic-model*) Let
`A = (A, A⁺)` be a Huber pair (not necessarily complete; for instance the `p`-adic pair
`(W(κ)[1/p][T^{±1}], W(κ)[T^{±1}])`) whose completion is in Huber's standing class (*huber-standing-class*) (as in
*etale-local-structure*) and `Y → Spa A` a morphism with `Y` affinoid. Prove that `Y → Spa A` is
étale if and only if `Y` is `Spa A`-isomorphic to `Spa B` for a morphism of Huber pairs `A → B` of
algebraically finite type (*algebraically-finite-type-ring-map*) whose underlying ring map `A → B` is
étale (Mathlib `Algebra.Etale`) (Huber96 §1.7, Cor. 1.7.3(iii) and its proof, p. 86; the setting of
Cor. 1.7.3, pp. 85–86, whose parts (i)–(ii) concern `X^ad` and belong to layer R1). Scholze13 §6,
Lem. 6.12, and its proof use this corollary for affinoids étale over the torus: for
`U = Spa(R, R⁺)` affinoid of finite type over `Spa(W(κ)[1/p], W(κ))` with an étale map `U → Tⁿ`, apply
it with `A = (W(κ)[1/p][T^{±1}], W(κ)[T^{±1}])` (`Spa A = Tⁿ`) to get `(R₀, R₀⁺)` with `R₀` étale over
`W(κ)[1/p][T^{±1}]` and completion `(R, R⁺)`; Huber's Rem. 1.2.6(iii), p. 50 gives a finitely
generated plus subalgebra and a ring of definition (the finite-generation statement of
*algebraically-finite-type-ring-map*). Inverting the topologically nilpotent unit `p` gives the
spanning conclusion of that statement; excellence of `W(κ)` then gives `R₀⁺` finitely generated
with `R⁺` its `p`-adic completion. *Needs:* *etale-local-structure*;
*algebraically-finite-type-ring-map*; *differentials-unramified-smooth-etale*;
*noetherian-type-ideals-closed*; *noetherian-type-huber-ring*; *huber-standing-class*; Mathlib
`Algebra.Etale` (with its standard smooth characterisation), `Algebra.SubmersivePresentation`.
Lean: README target.

**Smooth morphisms are locally étale over relative polydiscs (Huber 1.6.10).**
(*smooth-local-structure*) Let `(A, A⁺)` be a Huber pair whose completion is in Huber's standing
class, discrete rings included (continuous differentials, *smooth-differentials-locally-free*), and
`f : X → Spa A` a
morphism of adic spaces. Prove that `f` is smooth if and only if every `x ∈ X` has an open
neighbourhood `U` for which there are `n ≥ 0`, finite subsets `M₁,…,Mₙ ⊆ A` with each `MᵢA` open, and
an étale morphism `g : U → Spa A⟨X₁,…,Xₙ⟩_M` with `f|_U` equal to the composite of `g` and the
structure morphism (Huber's diagram (*)); if `A` is Tate and `f` is smooth, one can take
`M₁ = … = Mₙ = {1}`, i.e. `g : U → Spa A⟨X₁,…,Xₙ⟩` étale (Huber96 §1.6, Cor. 1.6.10 and proof, p. 80,
the full statement, of which the Tate sentence is the special case; Zavyalov24 §5, Rem. 5.10, for the
public statement of the same local structure for locally Huber-standard analytic adic spaces: smooth
maps factor locally as an étale map to `Dᵈ_S` followed by the projection). BHW §3, proof of Cor. 3.4,
uses the Tate case over `Spa(L', L'°)`: a smooth rigid space `Y` over a perfectoid extension `L'` of
`L` is covered by opens étale over discs `Spa(L'⟨X₁,…,Xₙ⟩)` (products with smooth weight spaces,
AdicSpacesPartIV layer R5); Scholze13 §5, Lem. 5.2, uses the Tate case with the neighbourhood chosen to contain the
closure of `x` (*smooth-toric-chart*). The ring-level analogue — a smooth algebra is locally
standard étale over a polynomial ring — is Mathlib
`Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial`; the adic statement replaces the
polynomial ring by `A⟨X₁,…,Xₙ⟩_M`. *Needs:* *smooth-morphism*;
*smooth-differentials-locally-free*; *differential-criterion-morphism*;
*restricted-power-series-smooth*; *continuous-differentials*; *etale-smooth-composition*;
*etale-smooth-locality*; *differentials-unramified-smooth-etale*; *locally-huber-standard*;
Tau Ceti `TauCeti.Huber.restrictedMvPowerSeriesCompletion`,
`TauCeti.Huber.weightedRestrictedSubring`; Mathlib
`Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial`.
`AdicSpace.Smooth.exists_etale_polydisc` carries a complete standing-class pair `A`,
a locally Huber-standard `X`, `f : X → Spa A`, `Smooth f` and `x : X`.
It supplies the open neighbourhood, finite open weights and commuting étale factorisation
through the relative polydisc above; if `A` is Tate the weights can all be `{1}`.

Lean: README target.

**Étale morphisms of affinoids over a field embed locally into finite étale covers (de Jong–van der
Put 3.1.4).** (*etale-affinoid-finite-etale-embedding*) Let `K` be a complete nonarchimedean field
with a nontrivial rank-one valuation and `f : Y → X` an étale morphism
(*differentials-unramified-smooth-etale*) of affinoid adic spaces locally of finite type over
`Spa(K, K°)`, `X = Spa(A, A°)` and `Y = Spa(B, B°)` with `A`, `B` `K`-affinoid algebras. (i) For
every rank-one point `a ∈ X` there are a rational subset `U ⊆ X` containing the closure of `{a}`,
a `K`-affinoid algebra `C` that is finite étale over `O_X(U)` (so that `g : Z = Spa(C, C°) → U` is
finite and étale, *finite-etale-algebra-comparison*) and an open embedding `h : f⁻¹(U) → Z` with
`f|_{f⁻¹(U)} = g ∘ h`: this is the `K`-affinoid case of *etale-local-open-finite-etale-factorisation*
(a) and (b), rank-one points being the maximal points, and is not restated. Prove (ii): `X` is
covered by finitely many such rational subsets
`U_1, …, U_m`, and each `f⁻¹(U_j)` is covered by finitely many subsets `T'` that are rational in `Y`
and (via `h_j`) in `Z_j`; on each `T'` the morphism `f` is the composite of a rational embedding
`T' ⊆ Z_j`, the finite étale `Z_j → U_j` and the rational embedding `U_j ⊆ X` (dJvdP §3.1, Prop. 3.1.4,
p. 20, the statement for affinoid rigid varieties, whose proof reduces to a wide neighbourhood of
each analytic (rank-one) point, which is (i); KL15 §8.2, proof of Lem. 8.2.17, p. 162, for the
transfer of de Jong–van der Put's affinoid results to adic spaces by reduction to classical affinoid
spaces). The formal statement also covers arbitrary complete strongly noetherian Tate affinoids,
by Huber96 Lem. 2.2.8, pp. 116–117, and rational refinement. For each `U_j`, its charts `d k`
cover the whole inverse image; their images under the maps to `Y` and `Z_j` belong to
`TauCeti.ValuationSpectrum.spaRationalFamily`, which includes the open numerator-ideal condition.
The equation on each chart identifies the composite with the restriction of `f`. To obtain the
simultaneous refinement, first choose rational neighbourhoods in `Z_j` inside the open image,
then rational neighbourhoods in `Y` inside their inverse images. Pullback and transitivity of
rational subsets give rationality in `Z_j`; quasi-compactness gives finitely many charts.
The Kummer map `f : Y = {|T| = 1} → X = {|T| = 1}`, `T ↦ Tⁿ`, on the unit circle over `K` of
characteristic prime to `n` is finite étale, and (ii) holds with the single piece `U = X`, `Z = Y`,
`h = id`; the rational embedding `Y = {|T| ≤ |ϖ|} ⊆ X = Spa(K⟨T⟩, K°⟨T⟩)` is étale and not finite,
and (ii) holds with `Z = U = X` and `h` the inclusion, so the finite étale factor can be trivial.
Scholze13 §9, proof of Prop. 9.2, p. 54, reduces the étale base change of proper coherent cohomology
by (ii) to rational embeddings and finite étale maps; dJvdP's sheaf criterion 3.2.2 rests on Prop.
3.1.4 and Prop. 3.1.7. *Needs:* *etale-local-open-finite-etale-factorisation*;
*differentials-unramified-smooth-etale*; *finite-etale-algebra-comparison*; *affinoid-fibre-product*;
*finite-morphism*; *maximal-point-closure-rational*.
Lean: README target.

**Étale maps are locally open embeddings into finite étale covers (Huber 2.2.8).**
(*etale-local-open-finite-etale-factorisation*) (a) Let `f : X → Y` be an étale morphism between
analytic affinoid adic spaces with noetherian (strongly noetherian Tate) coordinate rings. Prove that
every `y ∈ Y` has an open neighbourhood `U` such that `f⁻¹(U) → U` factors as an open embedding
`f⁻¹(U) → Z` followed by a finite étale morphism `Z → U` (Huber96 §2.2, Lem. 2.2.8 and proof,
pp. 116–117; Berkeley Lecture 7, after Def. 7.5.1: étale maps of analytic adic spaces are locally an
open embedding followed by a finite étale map). (b) If `y` is a maximal point, `U` can be taken to be
a rational subset containing the closure of `{y}` (Scholze13 §5, proof of Lem. 5.2, "with similar
analysis of its proof": for `f : V → Bⁿ` étale with `V` affinoid and `y ∈ Bⁿ` with closure `N`, there
is a rational `W ⊆ Bⁿ` containing `N` such that `f⁻¹(W) → W` factors as an open embedding into `Z`
followed by a finite étale `Z → W`). The characterisation that follows from (a) — a morphism of
locally Huber-standard analytic adic spaces is étale (*differentials-unramified-smooth-etale*) iff it
is locally on the source an open embedding followed by a finite étale morphism followed by an open
embedding, the definition of Kedlaya–Liu (KL15 §8.2, Def. 8.2.16) and of Scholze–Weinstein for
perfectoid spaces (Berkeley Def. 7.5.1), with KL15 §8.2, Lem. 8.2.17(b) — is AdicEtaleGeometry layer
A1 (*etale-morphisms-local-description-and-comparison*), which consumes (a) and (b) and is used
here with the hypotheses of (a). *Needs:*
*differentials-unramified-smooth-etale*; *finite-morphism*; *infinitesimal-criteria*;
*unramified-locally-quasi-finite*; *quasi-finite-stalk-criterion*; *etale-local-structure*;
*etale-ring-flatness*; *locally-huber-standard*; *etale-algebraic-model*;
*finite-algebra-over-affinoid*; *maximal-point-closure-rational*; *quasi-finite-fibre-criteria*;
*spectral-map-image-proconstructible*; Mathlib
`Algebra.QuasiFiniteAt.exists_fg_and_exists_notMem_and_awayMap_bijective`.
Lean: README target.

**Étale toric charts on smooth affinoids (Scholze 2013, Lemma 5.2).** (*smooth-toric-chart*) Let
`K` be a complete nonarchimedean field (rank one), `V` an affinoid adic space smooth over
`Spa(K, K°)`, and `x ∈ V` with closure `M = closure{x} ⊆ V`. Prove that there is a rational subset
`U ⊆ V` containing `M` together with an étale morphism
`U → Tⁿ = Spa(K⟨T₁^{±1},…,Tₙ^{±1}⟩, K°⟨T₁^{±1},…,Tₙ^{±1}⟩)` which factors as a composite of rational
embeddings and finite étale maps (Scholze13 §5, Lem. 5.2, and its proof, p. 28, which uses Huber
1.6.10 with the neighbourhood containing the closure `M` of `x` and the strengthened form of Huber
2.2.8; the closure step is correct for maximal `x` (Huber 1.5.10, *maximal-point-closure-rational*)
and for non-maximal `x` the proof reduces to the maximal generalisation). For `V = Tⁿ` and any `x`,
`U = V` and the chart is the identity. For `V = Bⁿ` (the closed unit polydisc, coordinates `Tᵢ`)
and any `x`, `U = V` also works: `Sᵢ ↦ 1 + ϖTᵢ` identifies `Bⁿ` with the rational subset
`{|Sᵢ − 1| ≤ |ϖ|}` of `Tⁿ` (coordinates `Sᵢ`), so the chart is a rational embedding; the identity
coordinates go the other way, `Tⁿ = {|Tᵢ| = 1}` being a rational subset of `Bⁿ`, and do not give a
chart `Bⁿ → Tⁿ`. Scholze13 Lemmas 4.5, 5.3 and §6, and
through them the `p`-adic Hodge theory roadmaps, consume these charts, where étale maps `V → Tⁿ`
that are composites of rational embeddings and finite étale maps are the input to the perfectoid
tower `V ×_{Tⁿ} T̃ⁿ`. *Needs:*
*smooth-local-structure*; *etale-local-open-finite-etale-factorisation*;
*maximal-point-closure-rational*; *etale-affinoid-finite-etale-embedding*;
*etale-smooth-composition*; *open-embedding-etale*; *differential-criterion-morphism*.
Lean: README target.

**Étale equals flat and unramified for analytic adic spaces (Huber 1.7.5).** (*etale-flat-unramified*)
Let `f : X → Y` be a morphism locally of finite type between analytic, locally Huber-standard adic
spaces (for analytic spaces the same as locally noetherian; Huber's standing assumption (1.1.1),
needed by Lemma 1.7.6, *etale-ring-flatness*).
Prove that the following are equivalent: (a) `f` is étale; (b) `f` is flat (*flat-morphism*) and
unramified (*unramified-morphism*); (c) for every maximal point `x ∈ X`, `O_{X,x}` is flat over
`O_{Y,f(x)}` and `O_{X,x}/𝔪_{f(x)}O_{X,x}` is a finite separable field extension of the residue field
of `O_{Y,f(x)}` (Huber96 §1.7, Prop. 1.7.5 and proof, p. 87).
`Etale.iff_flat_and_unramified` states (a) ⇔ (b), and the stalk criterion states (a) ⇔ (c), with
the same
analyticity, local Huber-standardness and local finite-type hypotheses. Here maximal means that
`z ⤳ x` implies `z = x`. The stalk criterion uses
`𝔪_{f(x)}O_{X,x} = 𝔪_x` to make the residual fibre a field, together with
`Module.Finite` and `Algebra.IsSeparable` for the residue-field algebra induced by
`IsLocalRing.ResidueField.map` of the actual stalk map.
The closed embedding of the origin into
`D` is unramified but not flat, hence not étale; the Frobenius `S ↦ T^p` in characteristic `p` is
flat but not unramified, hence not étale. The scheme analogue is Mathlib's characterisation of
étale morphisms of schemes as flat and formally unramified ones (in `AlgebraicGeometry.Etale`),
the ring analogue its criterion that a flat formally unramified algebra of finite presentation is
étale (in `Algebra.Etale`). *Needs:* *differentials-unramified-smooth-etale*;
*flat-morphism*; *unramified-morphism*; *unramified-locally-quasi-finite*;
*quasi-finite-stalk-criterion*; *quasi-finite-stalk-differentials*; *quasi-finite-fibre-criteria*;
*etale-local-structure*; *infinitesimal-criteria*; *open-embedding-etale*;
*etale-smooth-composition*; *etale-ring-flatness*; *etale-smooth-locality*;
*flat-quasi-finite-base-change*; *locally-huber-standard*; Mathlib `AlgebraicGeometry.Etale`,
`Algebra.Etale`.
Lean: `Etale.iff_flat_and_unramified` ((a) ⇔ (b); `X`, `Y` analytic and locally Huber-standard).

**Flatness of the ring map of an étale affinoid morphism (Huber 1.7.6).** (*etale-ring-flatness*)
Let `s : X → Y` be an étale morphism between affinoid adic spaces, `Y = Spa(A, A⁺)` with `A`
complete Hausdorff and in Huber's standing class (*huber-standing-class*): finite type over a
noetherian ring of definition, strongly noetherian Tate, or discrete (Huber96 (1.1.1)(a)–(c), p. 37).
Prove that `O_Y(Y) → O_X(X)` is flat (Huber96 §1.7, Lem. 1.7.6 and proof,
pp. 87–88). The proof has two branches, although the standing hypothesis has three clauses:
clause (a) supplies a noetherian ring of definition; clause (c) supplies one via the prime
subring; clause (b) uses strong noetherianness. Using the prime subring in the flatness proof
does not assert finite generation over it. Zavyalov-Q Appendix B.4, Rem. B.4.4, p. 50, explains
the limitation beyond the strongly noetherian setting; Rem. B.4.7, p. 51, uses Huber 1.7.6 for
flatness of smooth maps. For `A = K` a field
every module is flat; for the rational embedding `{|T| ≤ |ϖ|} ⊆ D`, `K⟨T⟩ → K⟨T, T/ϖ⟩` is flat (also
Tau Ceti `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc` for rational localisations). *Needs:*
*etale-local-structure*; *etale-algebraic-model*; *differentials-unramified-smooth-etale*; Tau Ceti
`TauCeti.Huber.IsStronglyNoetherian`; Mathlib `Module.Flat`, `AdicCompletion.flat_of_isNoetherian`;
*huber-standing-class*.
Lean: README target.

**Smooth and étale morphisms are open (Huber 1.7.7–1.7.9).** (*smooth-morphism-open*) Let `X` and
`Y` be locally Huber-standard adic spaces (*locally-huber-standard*: covered by `Spa` of pairs whose
completions are in Huber's standing class (*huber-standing-class*), Huber's standing hypothesis
(1.1.1)). Prove that every smooth morphism `f : X → Y` is an open map `|X| → |Y|`; in particular étale
morphisms are open (Huber96 §1.7, (1.7.7), Prop. 1.7.8 and Lem. 1.7.9, pp. 88–89, the statement
(1.7.8) and the two steps of its proof; the proof of 1.7.9 cites [HuKn, 2.1.4]; KL15 §8.2, Lem.
8.2.17(b)
and §9, consume the openness of étale maps through the factorisation through the open image). The
noetherian hypothesis is the one under which Huber states 1.7.8 and under which the two inputs of
the proof are available: the local structure *smooth-local-structure* (reducing to étale maps to
relative polydiscs) and the algebraic model *etale-algebraic-model* (reducing the étale case to
the openness of étale morphisms of schemes and of `Spa` of an algebraically finite type map, [HuKn,
2.1.4]); nothing is asserted outside the class. A locally noetherian target does not suffice: the
smooth `Spa ℤ_p → Spa(A, A)` of *etale-standing-class-control* (smooth for Huber's printed
definition) has non-open image, and so has `Spa 𝔽_p → Spa(ℤ_p × E)` of
*etale-standing-class-product-control* over a locally Huber-standard target, which the
standing-class witness charts of *locally-finite-presentation* exclude. The squaring map on `{|T| = 1}` (étale) is
open; the identity and every open embedding are open; the closed embedding of the origin is not
open (not smooth); the finite flat Frobenius `S ↦ T^p` in characteristic `p` is open (a
homeomorphism) without being étale, so openness does not characterise étaleness. *Needs:*
*locally-huber-standard*; *smooth-morphism*; *smooth-local-structure*; *etale-algebraic-model*;
*algebraically-finite-type-ring-map*; *differentials-unramified-smooth-etale*.
Lean: `Smooth.isOpenMap` (`X`, `Y` locally Huber-standard).

- *Degenerate.* With no variables,
  the constant polynomial a lies in the weighted polynomial plus ring exactly when
  a ∈ A⁺.
- *Non-example.* With unit weight over
  (ℚₚ,ℤₚ), X lies in the plus ring but p⁻¹X does not. The two-variable torus
  computation of *algebraically-finite-type-ring-map* supplies the quotient comparison.
- *Computation.* Over `(ℤ_p, ℤ_p)`,
  with one variable and weight `{p}`, `pX` belongs to the plus ring and `X` does
  not. The plus ring is the integral closure of `ℤ_p[pX]` in `ℤ_p[X]`.
  If `X` satisfied a monic relation over `ℤ_p[pX]`, reduction modulo `p` would
  make the polynomial variable over `𝔽_p` integral over `𝔽_p`, which is impossible.

### R0.18 supporting results

**Complete field and affinoid algebra carriers.** R0 uses `RigidSpace.Affinoid K`
for a complete Hausdorff strictly affinoid K-algebra, including the zero algebra.
`RigidSpace.Affinoid.point`, `.empty` and `.polydisc` give K, the zero algebra and
the completed Tate algebra in n variables. R1 reads the rigid spaces of
RigidAnalyticGeometry §6.2 on these same algebras through the carrier bridge of R0.9
(Conrad-AWS, §1.2, Definition 1.2.1, p. 4).

`fieldAffinoid K` uses the given topology and the full power-bounded subring K°.
Its pair of definition is `(K°, ϖK°)`, where ϖ is selected from Mathlib's
`NormedField.exists_norm_lt_one K`, so `0 < ‖ϖ‖ < 1`. The construction applies also
to nondiscretely valued K (Wedhorn, Proposition and Definition 6.1, p. 46,
and Example 6.5(3), p. 47).

`ofRigidAffinoid` equips a rigid affinoid algebra with its full power-bounded plus ring.
Choose the strict quotient presentation `π : K⟨X₁,…,Xₙ⟩ → A` from `A.finiteType`.
Its ring of definition is `A₀ = π(K°⟨X₁,…,Xₙ⟩)`, obtained by applying the supplied
`PairOfDefinition.weighted` at unit weights and `PairOfDefinition.completion` to the
field basis. Its ideal is `(π(ϖ))A₀`, with the same choice of ϖ as `fieldAffinoid`;
for the zero algebra this is the zero ideal (Wedhorn, Definition 6.28, p. 52,
and Remark 6.8, p. 48).
`ofRigidAffinoid.scalars` is the given K-algebra homomorphism.

**On a Tate algebra the Gauss norm is the maximum of `|f(x)|` over `Max K⟨X⟩`.**
(*tate-algebra-gauss-norm-attained*) For `f ∈ K⟨X₁,…,X_n⟩`, `|f(y)| ≤ ‖f‖` at every point `y` of
`Max K⟨X⟩` and equality holds at some point, so the supremum seminorm of a Tate algebra is its Gauss
norm and is attained. Supplied by RigidAnalyticGeometry §0.1 (consuming RestrictedPowerSeries §2.4). The supplier states it for Mathlib's restricted
power series, which the carrier bridge of R0.9 identifies with
`restrictedMvPowerSeriesCompletion n K`.

**Adic homomorphisms are bounded and adic for every choice of rings of definition.**
(*adic-hom-choice-independence*) Let `φ : A → B` be an adic ring homomorphism of Huber rings
(*adic-ring-homomorphism*). Prove: (i)
`φ` is bounded: `φ(T)` is bounded in `B` for every bounded `T ⊆ A`; (ii) for all rings of definition
`A₀` of `A` and `B₀` of `B` with `φ(A₀) ⊆ B₀` and every ideal of definition `I` of `A₀`, the ideal
`φ(I)·B₀` is an ideal of definition of `B₀`; (iii) for every ring of definition `A₀` of `A` and every
open subring `B′` of `B` with `φ(A₀) ⊆ B′` there is a ring of definition `B₀` of `B` with
`φ(A₀) ⊆ B₀ ⊆ B′` (apply Tau Ceti `exists_pairOfDefinition_le_le` to the bounded image of `A₀`,
using (i)) (Huber93 §1, Lem. 1.8 and proof, p. 459, whose proof of
(ii) passes through `A₂ = A₀·A₁`, `B₂ = B₀·B₁`; Huber96 §1.2, opening paragraph, printed pp. 45–46,
for part (ii) recalled with the definition of adic homomorphisms). The new statements are (i) and
(ii); (iii) is the cited bounded-subring extension theorem applied to (i). For the adic inclusion
`ℤ_p → ℚ_p` with rings of definition `A₀ = B₀ = ℤ_p` and the ideal of definition `I = p²ℤ_p`,
`φ(I)B₀ = p²ℤ_p` is an ideal of definition although the adicness witness used `I = pℤ_p`; for the
non-adic `ℤ_p → ℤ_p⟦T⟧` (`(p, T)`-adic) conclusion (ii) fails for every choice: `p·B₀` never contains
a power of `T`. *Needs:* *adic-ring-homomorphism*; Tau Ceti `TauCeti.Huber.PairOfDefinition`,
`TauCeti.Huber.IsHuberRing`, `TauCeti.Huber.IsBounded.image`,
`TauCeti.Huber.exists_pairOfDefinition_le_le`.
Lean: README target.

**Checks.**

- *Negative control.* The identity
  from discrete `ℚ_p` to usual `ℚ_p` is continuous, and its source is bounded in itself, but its
  image is not bounded. A nonzero neighbourhood in usual `ℚ_p` multiplied by all of `ℚ_p` is
  all of `ℚ_p`, so it cannot lie in `ℤ_p`. Continuity cannot replace adicness in (i) or (iii).

**Spa of a continuous homomorphism and the analytic locus (affinoid adicness criterion).**
(*spa-comap-analytic-locus*) Let `(A, A⁺)`, `(B, B⁺)` be Huber pairs, `φ : A → B` a continuous ring
homomorphism with `φ(A⁺) ⊆ B⁺`, and `g = Spa(φ) : X := Spa(B, B⁺) → Y := Spa(A, A⁺)` (Tau Ceti
`ValuationSpectrum.spaComap`). Write `X_a`, `Y_a` for the analytic loci (Tau Ceti
`ValuationSpectrum.spaAnalytic`: points whose support is not open) and `X_na`, `Y_na` for their
complements. Prove (the second and third statements being `Huber.IsAdicHom.spaComap_analytic` and
`Huber.isAdicHom_of_spaComap_analytic`): (1) `g(X_na) ⊆ Y_na`, and if `φ` is adic
(*adic-ring-homomorphism*) then `g(X_a) ⊆ Y_a`; (2) if `B` is complete (and Hausdorff) and
`g(X_a) ⊆ Y_a`, then `φ` is adic (Wedhorn §7.5, Lem. 7.46(1),(2), p. 68, with the same hypotheses;
Wedhorn §7.5, Lem. 7.45, p. 67, the existence input of (2), applied to a prime of `B₀`; Huber94 §3,
Prop. 3.2 and the sentence before it, printed p. 532, where Huber derives the global statement from
this affinoid fact and Remark 3.1). `ℤ_p → ℤ_p⟦T⟧` with the `p`-adic and `(p, T)`-adic topologies is
not adic, and indeed the `T`-adic valuation of `𝔽_p((T))` is an analytic point of `Spa ℤ_p⟦T⟧`
(support `(p)` not open) mapping to the non-analytic point of `Spa ℤ_p`; for `φ : ℚ_p → ℚ_p⟨T⟩` both
spectra are analytic and `φ` is adic. *Needs:* *adic-ring-homomorphism*; Tau Ceti
`TauCeti.ValuationSpectrum.spaComap`, `TauCeti.ValuationSpectrum.spaAnalytic`,
`TauCeti.ValuationSpectrum.IsAnalyticPoint`,
`TauCeti.ValuationSpectrum.isAnalyticPoint_iff_exists_mem_extendedIdealOfDefinition_notMem_supp`.
Lean: `IsAdicHom.spaComap_analytic`, `isAdicHom_of_spaComap_analytic`.

**Banach spaces of countable type have t-orthogonal Schauder bases.**
(*banach-countable-type-orthogonal-basis*) A Banach space of countable type over a field complete
for a nontrivial nonarchimedean absolute value, with an exactly homogeneous ultrametric norm,
has a `t`-orthogonal Schauder basis for every `0 < t < 1`. Countable type means a dense
subspace spanned by finitely or countably many vectors. The basis uses the original norm:
`w_i = ‖e_i‖ > 0`, `t·max_i(|c_i|w_i) ≤ ‖Σ c_i e_i‖ ≤ max_i(|c_i|w_i)` for finite sums,
and the unique expansions have `|c_i|w_i → 0` cofinitely. Its coefficient space is
`c₀(I, K; w)` from (f) of *completed-tensor-banach-module*, with `I` finite or `ℕ`.
For a fixed `π ∈ K` with `0 < q = |π| < 1`, choose scalar powers `λ_i` of `π` so that
`q < |λ_i|w_i ≤ 1`. Then `b_i = λ_i e_i` has the estimates
`tq·sup_i |d_i| ≤ ‖Σ d_i b_i‖ ≤ sup_i |d_i|`, and `d_i = c_i/λ_i` are ordinary-null
coefficients. This gives a topological isomorphism with ordinary `c₀(I, K)` with
constants `tq` and `1`; it does not give the normalized lower constant `t` for the original norm.
Supplied by PadicFunctionalAnalysis §§2.2, 2.4 (the supplier contract above; HK §7, Rem. 7.8, p. 26, cites
Bosch–Güntzer–Remmert 2.7.2/3 for the Schauder-basis description).
Lean: supplier README target.

**Checks.**

- *Computation.* The coordinate vectors of `c₀(ℕ, ℚ₂)` have weights one, and the
  coefficient norm is the usual supremum norm; this orthonormal basis works for every `0 < t < 1`.
- *Degenerate.* The zero space has the empty basis and zero weighted coefficient norm.
- *Normalized non-example.* For `V = ℚ₂` with `‖x‖_V = (3/4)|x|₂`, `e = 1` is a
  weighted orthogonal singleton. Every nonzero vector has norm in `(3/4)2^ℤ`, which misses
  `[7/8, 1]`; hence normalized basis existence for `t = 7/8` fails.
- *Weighted-null control.* The basis `e_n = 2ⁿδ_n` of `c₀(ℕ, ℚ₂)` has weights `2⁻ⁿ`.
  Its vector `(2ⁿ)_n` has constant coefficients one: weighted-null, but not ordinary-null.
  Taking `λ_n = 2⁻ⁿ` recovers the coordinate basis and ordinary-null coefficients `(2ⁿ)_n`.

**Completed tensor products over a nonarchimedean field: cross norm, injectivity, kernels and
strictness (Kedlaya–Liu Lemma 2.2.9).** (*banach-completed-tensor-field-exactness*) Let `K` be a
field complete for a nontrivial nonarchimedean absolute value and `V`, `W`, `X` complete
ultrametric normed `K`-spaces (so `‖av‖ = |a|‖v‖`),
with the completed tensor product of *completed-tensor-banach-module* (`A = K`). Prove
`Huber.BanachModule.CompletedTensor.norm_tmul`, `injective_tensorProduct_of_field`,
`ker_map_of_field` and `isStrictMap_map_of_field`: (a) the product seminorm is a cross norm,
`|v ⊗ w| = ‖v‖·‖w‖`, and `V ⊗_K W → V ⊗̂_K W` is injective; in particular, for `w ∈ W` with `‖w‖ = 1`
(e.g. `w = 1` in a complete field extension `W = L` of `K`), the map `X → W ⊗̂_K X`, `x ↦ w ⊗ x`, is an
isometric (hence strict) injection for every such Banach `K`-space `X`; (b) if `f : V → W` is a bounded `K`-linear map, the natural map `ker(f) ⊗̂_K X → ker(f ⊗̂ X)` is a
topological isomorphism; (c) if moreover `f` is strict, so is `f ⊗̂ X` (KL15 §2.2, Lem. 2.2.9(b),
p. 31, with parts (a) and (c) stated alongside it on the same page; KL15 §2.2, proof of Lem. 2.2.9,
p. 31: reduction to separable modules and Schauder bases). Use the weighted estimates of
*completed-tensor-banach-module* (f) on countable-type subspaces, without changing the original
norms. For each algebraic presentation `v ⊗ w = Σ v_j ⊗ w_j`, a weighted `t`-orthogonal
basis of the finite-dimensional span of `w` and the `w_j` gives
`t‖v‖‖w‖ ≤ max_j ‖v_j‖‖w_j‖`. Taking the infimum over presentations and then `t → 1`
proves the exact cross-norm equality. For kernels and strictness, the weighted coefficient
map makes `f ⊗̂ X` act coordinatewise on countable-type `X`; the countable-type reduction
of KL15 handles arbitrary `X`. Thus countable type is part of the proof, not an extra hypothesis,
and equivalent renorming is not used to infer the numerical identities.
Degenerate instances: `V = 0` or `W = 0` give `V ⊗̂ W = 0` and
(a)–(c) read `0 = 0`; for `f = 0`, `ker f = V` and (b) says `V ⊗̂ X → V ⊗̂ X` is the identity; for
`w = 0` the map `x ↦ w ⊗ x` is zero, which is why `‖w‖ = 1` is required for the isometry. For
`K = ℚ_p`, `L = ℚ_p(√p)` and `X = ℚ_p⟨T⟩`, the map `X → L ⊗̂_K X` is the isometric inclusion
`ℚ_p⟨T⟩ → L⟨T⟩`; for `f : ℚ_p⟨T⟩ → ℚ_p⟨T⟩`, `g ↦ Tg` (strict, injective) and `X = ℂ_p`, `f ⊗̂ X` is
multiplication by `T` on `ℂ_p⟨T⟩`, again injective and strict. PerfectoidSpaces layer P4 (P4.5a)
cites this statement for the kernels and strictness of completed tensor products over a
nonarchimedean field. *Needs:* *completed-tensor-banach-module*;
*banach-countable-type-orthogonal-basis* (PadicFunctionalAnalysis §§2.2, 2.4); Mathlib
`NormedSpace`,
`TensorProduct`,
`ZeroAtInftyContinuousMap`.
Lean: README target.

**Checks.**

- *Original-norm computation.* For `K = ℚ₂`, `V = K` with `‖x‖_V = (3/4)|x|₂`
  and `W = K` with its usual norm, `|1 ⊗ 1|_π = 3/4`. The weighted singleton basis
  proves this equality despite the failure of normalized basis existence at `t = 7/8`.
- *Degenerate.* For `X = 0`, both sides of the kernel comparison vanish and the induced map is strict.
- *Compatibility.* For `X = c₀(ℕ, ℚ₂)` and its weighted basis `2ⁿδ_n`,
  the scalar unit map `X → ℚ₂ ⊗̂_{ℚ₂} X` remains isometric; the image of `(2ⁿ)_n`
  has weighted coefficients `(1)_n` and norm one.

`Huber.BanachModule.productSeminorm` uses the infimum of finite-presentation maxima;
`hasBasis_banachTensorTopology` identifies its positive-radius balls with a neighbourhood basis
for the algebraic tensor topology. The empty presentation has maximum zero. This is the
nonarchimedean maximum formula of KL15 Definition 2.1.10, rather than the sum formula for the
projective seminorm in Mathlib's `PiTensorProduct`.

*Checks for `Huber.BanachModule.productSeminorm`:*
- In `L ⊗_L L`, the product seminorm of `2 ⊗ 3 − 7 ⊗ 1` is `1`, including in residue characteristics two and three.
- *Degenerate.* Tensoring the zero space `K^(Fin 0)`
  gives seminorm zero everywhere.
- *Computation.* In `K ⊗_K K`,
  `|1 ⊗ c + d ⊗ 1| = |c+d|`; for `d = −c` the value is zero even when the displayed
  two-term presentation has positive maximum.

**The fibre of a morphism over a point (Huber (1.2.4)).** (*fibre-over-point*) Let `f : X → Y` be a
morphism of adic spaces locally of weakly finite type and `y ∈ Y` arbitrary (analytic or not), with
`κ(y) = (k(y)^∧, k(y)⁺^∧)` the completed residue affinoid field and `ι_y : Spa κ(y) → Y` the canonical
morphism (Huber (1.1.8)). Prove that `ι_y` is adic, `Spa κ(y)` is covered by a stably sheafy affinoid
(AdicSpaces layers 0.5 and 4.1: complete rank-one fields are strongly noetherian and stably sheafy;
`k(y)` is discrete if `y` is not analytic), so the fibre
`X_y := X ×_Y Spa κ(y)` exists (*fibre-products-existence* (b)); if `X = Spa(B, B⁺)`, `Y = Spa(A, A⁺)`
with `(A, A⁺) → (B, B⁺)` topologically of finite type, `X_y = Spa(B ⊗̂_A κ(y))`
(*affinoid-fibre-product*, *completed-tensor-noetherian-stability*). Let `G ⊆ Y` be the set of
secondary generalizations of `y` (all generalizations of `y` when `y` is analytic). Then the
projection `p : X_y → X` induces a homeomorphism from `|X_y|` onto the subspace `f⁻¹(G)` of `|X|`, and
for every `z ∈ X_y` the image of `k(p(z))` is dense in `k(z)` (Huber96 §1.2, (1.2.4), pp. 49–50,
Huber gives no proof in the book). For `f = id_Y`, `X_y = Spa κ(y)` maps homeomorphically
onto `G`, the secondary generalizations of `y`; for the closed unit disc `D → Spa(K, K°)` and `y`
the unique point, `X_y = D` and `G = {y}`. *Needs:* *fibre-products-existence*;
*affinoid-fibre-product*; *completed-tensor-noetherian-stability*; *fibre-product-points*;
*adic-morphism*; *finite-type-morphism-classes*; AdicSpaces layers 0.5 and 4.1.
Lean: README target.

`Affinoid.completedResidue` completes the residue field for the valuation uniformity at
an analytic point and the discrete uniformity otherwise; its plus ring is the closure
of the residue valuation ring. Its ring of definition is this same closure. Before completion,
the ideal is generated in the residue valuation ring by the image of `A.basis.idealOfDefinition`;
`PairOfDefinition.completion` extends it to the closure. This is zero at nonanalytic points
and nonzero and proper at analytic points. A maximal ideal cannot serve uniformly here:
for a nondiscrete rank-one valuation it need not be finitely generated.
`Affinoid.toCompletedResidue` is the coefficient map followed by completion
(Huber96, (1.1.8), (1.2.4); Wedhorn, Remark 6.8).

**Flat locally quasi-finite morphisms stay flat after base change (Huber 1.6.4(ii)).**
(*flat-quasi-finite-base-change*) Let `f : X → Y` be a locally quasi-finite morphism between
analytic adic spaces which is flat (*flat-morphism*: every stalk map `O_{Y,f(x)} → O_{X,x}` is flat),
with `Y` locally noetherian. Let `g : Y' → Y` be a morphism with `Y'` analytic and locally
noetherian. These noetherian hypotheses use *locally-noetherian-adic-space*, matching Huber96's
standing convention (1.1.1), p. 37. In particular, `Y'` has complete stably sheafy affinoid charts
by `IsLocallyNoetherian.isStablySheafy`, so that `X' = X ×_Y Y'` exists
(*fibre-products-existence* (b)); `g` is adic since `Y` is analytic.
Prove `AdicSpace.Flat.baseChange`: the projection `f' : X' → Y'` is flat (Huber96 §1.6,
Lemma 1.6.4(ii) and proof, p. 78). Étale morphisms of analytic adic spaces with locally
noetherian target (flat and locally quasi-finite by *etale-flat-unramified* and
*unramified-locally-quasi-finite*) stay flat after base change to an analytic locally
noetherian space; this is
the input of the (b) ⇒ (a) step of *etale-flat-unramified*. *Needs:* *flat-morphism*;
*quasi-finite-morphism*; *quasi-finite-stalk-criterion*; *fibre-products-existence*;
*affinoid-fibre-product*; *locally-noetherian-adic-space*; Mathlib `Module.Flat`.
Lean: README target.

**The closure of a maximal point is the intersection of the rational subsets containing it (Huber
1.5.10).** (*maximal-point-closure-rational*) Let `(A, A⁺)` be a Huber pair with `A` a Tate ring,
`X = Spa(A, A⁺)` and `x ∈ X` a maximal (rank-one) point with closure `M = closure{x}`. Let `𝒩` be the
set of rational subsets of `X` containing `M`. Prove that `M = ⋂_{N ∈ 𝒩} N = ⋂_{N ∈ 𝒩} closure(N)`;
consequently every open subset of `X` containing `M` contains a rational subset containing `M`
(compactness in the constructible topology, the rational subsets being constructible) (Huber96 §1.5,
Lem. 1.5.10 and proof, pp. 75–76, following Huber's proof via (1.a) and (1.b); Scholze13 §5,
proof of Lem. 5.2, p. 28, uses it, correctly only for maximal `x`). For a non-maximal point `x` the
intersection of the rational subsets containing `closure{x}` also contains the generalisations of
`x`, so the statement fails; one applies it to the maximal generalisation of `x`, whose closure
contains `closure{x}`. For the Gauss point `x` of the closed unit disc `D` over `K`, with residue
field `k̃`, `M` is `x` together with the type-5 points around it inside `D`; the rational
neighbourhoods `{|P_iⁿ| ≥ |ϖ| for i = 1, …, k}`, where `P_1, …, P_k ∈ K°[T]` are monic lifts of
finitely many monic irreducible polynomials of `k̃[T]` at a time (written with `P_iⁿ`, since
`|ϖ|^{1/n}` need not be an absolute value of an element of `K`), shrink to `M` as `n` and the set
of residue polynomials grow. Indeed a rank-one point `y ≠ x` of `D` reduces to the closed point of
`A¹_{k̃}` cut out by some monic irreducible `P̄`; for a lift `P` of `P̄`, `|P(y)| < 1`, so for
large `n` both `y` and its specializations satisfy `|Pⁿ| < |ϖ|` and leave the neighbourhood
once `P` is among the `P_i`. When `k̃` is algebraically closed (for instance
`K = ℂ_p`), the linear lifts `T − c`, `c ∈ K°`, suffice. Over `K = ℚ_3` they do not: the
classical point `a` with `a² + 1 = 0` has residue in `𝔽_9 \ 𝔽_3`, so `|a − c| = 1` for every
`c ∈ ℤ_3` and `a` lies in every `{|(T − c_i)ⁿ| ≥ |3|}`; yet `a ∉ M`, since the rational subset
`{|T² + 1| ≤ |3|}` contains `a` and not the Gauss point, and the lift `T² + 1` of the irreducible
`T² + 1 ∈ 𝔽_3[T]` excludes `a` from `{|(T² + 1)ⁿ| ≥ |3|}`. For a non-maximal `x` (a type-5
point), every rational subset containing `x` contains its rank-one generalisation, so the
intersection is strictly larger than `closure{x}`. *Needs:* Mathlib `SpectralSpace`, `Topology.ConstructibleTopology`; 
Tau Ceti `TauCeti.IsProConstructible`; Mathlib `compactSpace_withConstructibleTopology`.
Lean: README target.

**Affinoid fields are stably sheafy (AdicSpaces).** A complete nonarchimedean field `K` in Huber's sense (a
complete topological field whose topology is induced by a valuation of rank one, Huber96 §1.1, Def.
1.1.3, p. 39) is a strongly noetherian Tate ring, hence of noetherian type
(*noetherian-type-huber-ring*) and stably sheafy: this is AdicSpaces layer 0.5 (BGR 5.2.6, strong
noetherianness of complete rank-one fields) with layer 4.1 (Corollary 8.35), cited and not
restated. Consequently, for every affinoid field `(K, K⁺)` (`K⁺ ⊆ K°` an open valuation ring, of
any rank) with `K` complete nonarchimedean, and for every affinoid field with discrete topology
(`TauCeti.Huber.IsStronglyNoetherian.of_discreteTopology`), `Spa(K, K⁺)` is an affinoid adic space
covered by a stably sheafy affinoid; in particular `Spa κ(y) → Y` (`κ(y)` the completed residue
affinoid field, Huber96 §1.1, Defs. 1.1.3–1.1.7, pp. 39–40) satisfies the hypothesis on the second
factor of *fibre-products-existence*, which is how *valuative-criterion-specializing*,
*finite-from-proper-fibre* and *fibre-over-point* use it.

**Pro-constructible subsets of spectral spaces.** The two facts about pro-constructible subsets
(`TauCeti.IsProConstructible`: closed in the constructible topology) that the valuative criteria and
Huber 1.3.4, 1.3.13, 1.5.6 and 1.5.10 use are stated with Mathlib's `Topology.ConstructibleTopology`: the closure of a
pro-constructible subset `E` of a spectral space is its set of specializations, so that `E` is
closed iff it is stable under specialization (Stacks Tag 0903, 5.23.6), and the image of
a pro-constructible subset under a spectral map between spectral spaces is pro-constructible, the
map being continuous for the constructible topologies (Stacks Tag 0A2S, 5.23.3; Tau Ceti
`TauCeti.IsSpectralMap.continuous_constructibleTopology`). They are used here on spectral opens of
adic spaces, with `E` a pro-constructible subset of `Spa(A, A⁺)` or the image of one.
Related statements are in [R0.19.2–R0.19.3](#r0192-pro-constructible-subsets).
The topology and affinoid carriers used here come from
Mathlib, Tau Ceti and AdicSpaces §§1.3, 2.1, as specified in the supplier table.

**Images of pro-constructible sets under quasi-compact spectral maps of locally spectral spaces.**
(*spectral-map-image-proconstructible*) Let `f : X → Y` be a quasi-compact locally spectral map between
locally spectral spaces, using R0.0 `IsLocallySpectralSpace` and
`IsLocallySpectralMap`. Prove that `f(T)` is pro-constructible in `Y` for every pro-constructible
`T ⊆ X`; on locally spectral spaces pro-constructibility is tested on spectral opens
(Huber96 §1.1, (1.1.13), p. 44, as used in Huber's proofs of 1.3.4, 1.3.7 and 1.5.6).
Part II owns both the spectral case `isProConstructible_image` and this locally spectral
corollary. For spectral `X` and `Y` and an `IsSpectralMap f`, prove the spectral case from
`TauCeti.IsSpectralMap.continuous_constructibleTopology`: `T` is closed in the compact
constructible topology of `X`, hence compact in that topology; its continuous image is compact
in the Hausdorff constructible topology of `Y`, hence closed and pro-constructible.
For this separation step, distinct points of a spectral space are separated by a quasicompact
open and its complement, both open in the constructible topology, using `T0Space` and the
quasicompact-open basis (Mathlib `IsCompact.isClopen_constructibleTopology_of_isOpen`).
This argument uses the library basis directly
(Stacks Tags 0901, Lem. 5.23.2, and 0A2S, Lem. 5.23.3).
Deduce the locally spectral corollary over a cover of `Y` by spectral opens `V`.
Quasi-compactness of `f` gives a finite cover of `f⁻¹(V)` by spectral opens `Uᵢ ⊆ X`.
Each restriction `Uᵢ → V` is spectral by `IsLocallySpectralMap`, and `T ∩ Uᵢ` is
pro-constructible in `Uᵢ`. Apply the owned spectral theorem to each restriction and take
the finite union of the images in `V` to obtain `f(T) ∩ V` pro-constructible.
*Needs:* R0.0 (`IsLocallySpectralSpace`, `IsLocallySpectralMap`); Mathlib `IsCompact.isClopen_constructibleTopology_of_isOpen`,
`compactSpace_withConstructibleTopology`, `IsClosed.isCompact`,
`IsCompact.image`, `IsCompact.isClosed`; Tau Ceti
`TauCeti.IsSpectralMap.continuous_constructibleTopology`, `TauCeti.IsProConstructible`,
`TauCeti.isProConstructible_iff_isClosed`, `Set.Finite.isProConstructible_biUnion`.

**Checks.**

- An identity of a locally spectral space preserves every locally pro-constructible subset.
- The image of the empty subset is empty and pro-constructible, including for an empty source.
- The image of `Spec ℚ → Spec ℤ` is pro-constructible but not constructible.
- For a quasi-compact open inclusion into a spectral space, a pro-constructible subset
  of the open has pro-constructible image in the ambient space; the quasi-compactness
  assumption is needed for this reduction to a finite cover of spectral opens.

Lean: `isProConstructible_image` (the spectral case); the locally spectral corollary is a README target.

### R0.19 spectral, categorical and topos foundations

### R0.19.1 The constructible topology is profinite

**The constructible topology of a spectral space is profinite.**
(*constructible-topology-profinite*) Let `X` be a spectral space. A subset `T ⊆ X` is constructible
if it lies in the Boolean algebra generated by the quasicompact open subsets, and the constructible
topology is the topology generated by the constructible subsets; this convention agrees with
Mathlib's `constructibleTopology`. Prove that `X` with its constructible topology is a profinite
set, that is, compact Hausdorff and totally disconnected, and that if `X = lim X_i` is a cofiltered
inverse limit of finite T0 spaces along spectral maps then `X` with the constructible topology is
the inverse limit of the `X_i` with the discrete topology ([ECD] §2, paragraph after Thm 2.2, p. 10,
which every quasicompactness argument of [ECD] §§2, 7, 9, 11 and 13 uses). Mathlib has the
constructible topology and its quasicompactness — `compactSpace_withConstructibleTopology`, whose
hypotheses `CompactSpace`, `QuasiSober`, `PrespectralSpace` and `QuasiSeparatedSpace` are supplied
by `SpectralSpace`. The theorem `WithConstructibleTopology.t2Space_totallyDisconnectedSpace` states
`T2Space (WithConstructibleTopology X) ∧ TotallyDisconnectedSpace (WithConstructibleTopology X)`
under `[TopologicalSpace X]` and `[SpectralSpace X]`; with Mathlib's
`compactSpace_withConstructibleTopology` this is the full profiniteness statement. For Hausdorffness
and total disconnectedness, use the quasicompact-open basis and `T0Space X` to separate distinct
points by a quasicompact open. This set and its complement are open in the constructible topology,
giving total separatedness and hence `TotallySeparatedSpace.totallyDisconnectedSpace`. Mathlib
supplies the clopen step as `IsCompact.isClopen_constructibleTopology_of_isOpen`
(`Mathlib/Topology/Spectral/ConstructibleTopology.lean:88`). Its Hausdorff-prespectral instance
(`Mathlib/Topology/Spectral/Prespectral.lean:55`) requires prespectrality of the space with the new
topology; `PrespectralSpace X` alone does not supply that hypothesis.
`SpectralSpace.FiniteTZeroPresentation.constructible_isLimit` gives a limit cone for the discretized
finite-stage diagram, a homeomorphism of its vertex with the constructible space, and equality of
its coordinate maps with the original presentation projections. The limit assertion is conditional
on a given cofiltered presentation with spectral transition maps; the presentation itself comes
afterwards from the pro-category equivalence of R0.19.9, which rests on this subsection and not
conversely, so the compactness argument does not depend on that equivalence. *Needs:* Mathlib
`WithConstructibleTopology`, `compactSpace_withConstructibleTopology`,
`constructibleTopology_eq_generateFrom_isConstructible`, `Topology.IsConstructible`, `Profinite`,
`TotallyDisconnectedSpace`, `TotallySeparatedSpace.totallyDisconnectedSpace`, `Profinite.asLimit`.

**Checks.**

- `s0_2_empty_and_point` — The empty space and the point have discrete constructible topology; the point remains compact.
- `s0_2_spec_dvr` — for `X = Spec` of a discrete valuation ring, the Sierpiński space with generic point
  `η` open and closed point `s`, the quasicompact opens are `∅`, `{η}` and `X`; the constructible
  topology is generated by these and their complements, so it is the discrete topology on two
  points.
- `s0_2_product_of_fields` — for `X = Spec A` with `A` a product of countably many fields, `X` is already
  Hausdorff and `X_cons = X` is the Stone space of the Boolean algebra of subsets of the index set.
- `s0_2_not_compact_without_spectral` (non-example) — on the discrete space `ℕ`, which is locally
  spectral but not spectral, every singleton is constructible and the constructible topology is
  discrete, hence not compact: the spectral hypothesis cannot be weakened to locally spectral.

**Checks.**

- `constructibleTopologyProfinite_empty` — The constructible topology on the empty space is compact, Hausdorff and totally disconnected.
- `constructibleTopologyProfinite_point` — The constructible topology on a one-point space is compact, Hausdorff and totally disconnected.

Lean: `WithConstructibleTopology.t2Space_totallyDisconnectedSpace`, with the Check `s0_2_spec_dvr`
as an example on the Sierpiński space `Prop` and `s0_2_empty_and_point` as an example on `Empty` and
`PUnit`. The rest of this subsection is specified in the README only (no Lean declaration).

### R0.19.2 Pro-constructible subsets

**Pro-constructible subsets: closedness in the constructible topology.**
(*pro-constructible-subsets*) Tau Ceti's `TauCeti.IsProConstructible` is closedness in
`WithConstructibleTopology`; its compactness, intersections, inverse images and induced
spectral-space structures are imported, never rebuilt. Let `X` be spectral.
That a subset of `X` is pro-constructible iff it is an intersection of constructible
subsets is read off from Mathlib's `constructibleTopology_eq_generateFrom_isConstructible` and its
closedness criterion `isClosed_iff` for `WithConstructibleTopology`, constructible subsets being
closed under complement and finite unions and intersections ([ECD] §2, Lem. 2.3 with proof, p. 10);
the imported clauses are
`TauCeti.IsProConstructible.preimage`, `.isCompact`, `.spectralSpace` and
`.isSpectralMap_subtypeVal`. Spectral images use
`isProConstructible_image` and its quasi-compact locally spectral
corollary from [R0.18](#r018-supporting-results),
with the hypotheses in Exact supplier contracts. On a
locally spectral space the predicate is checked on spectral opens. The image of `Spa(K, O_K)` in `Spa(K, K⁺)`, for `K` a
nonarchimedean field and `K⁺ ⊆ O_K` an open bounded valuation subring, is the rank-one point; it is
pro-constructible and generalizing, and when `K⁺ ≠ O_K` it is not closed. When `K⁺ = O_K` it is the
whole one-point space. When `K⁺ ≠ O_K`, it is open exactly when the valuation ring `K⁺/√(ϖK⁺)` of
the residue field of `O_K` has a height-one prime: `Spa(K, K⁺)` is homeomorphic to `Spec(K⁺/√(ϖK⁺))`
with the rank-one point as generic point, so for `K⁺` of rank two it is the Sierpiński space with
the rank-one point open, and the rank-one point fails to be open only for `K⁺` of infinite rank with
no height-one prime over `√(ϖK⁺)`. The set of rank-one points of a spectral space need not be
pro-constructible, which is why ECD never asserts it. *Needs:* R0.19.1; R0.18's
*spectral-map-image-proconstructible*; Mathlib
`Topology.IsConstructible`, `Topology.IsLocallyConstructible`, `IsRetrocompact`,
`WithConstructibleTopology`, `constructibleTopology_eq_generateFrom_isConstructible`, and its
`isClosed_iff`; Tau Ceti `TauCeti.IsProConstructible` with `.preimage`, `.isCompact`,
`.spectralSpace`, `.isSpectralMap_subtypeVal`,
`TauCeti.IsSpectralMap.continuous_constructibleTopology`,
`TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`.

**Checks.**

- `s0_3_empty_and_whole` (degenerate cases) — `∅` and `X` are pro-constructible (closed in any topology),
  and are the images of `∅` and of `X` under the identity.
- `s0_3_rank_two_point_is_open` (non-example for "not open") — for `K⁺` of rank two, `Spa(K, K⁺)` is the
  Sierpiński space `{η, s}` with `η` the rank-one point: `{η} = D(f)` for `f` in the height-one
  prime of `K⁺/√(ϖK⁺)`, so the image of `Spa(K, O_K)` is open; a statement that this image is never
  open for `K⁺ ≠ O_K` is wrong.
- `s0_3_closed_point_is_pro_constructible_not_generalizing` — in the same space `{s}` is closed, hence
  pro-constructible, and not generalizing.
- `s0_3_image_under_patch_identity` — the identity `X_cons → X` is spectral and the image of a
  pro-constructible subset of `X_cons` (every closed subset) is pro-constructible in `X`: the image
  statement is consistent with closed sets of `X_cons` being exactly the pro-constructible sets of
  `X`.

**Checks.**

- `generalizing_subset_of_a_chain` — In the Sierpiński space, the open singleton is pro-constructible and generalizing; the closed singleton is pro-constructible but not generalizing.

Lean: this subsection uses R0.18's `isProConstructible_image`; the two Sierpiński
generalization Checks are anonymous examples. Its other clauses are README targets.

### R0.19.3 Closure of a pro-constructible subset

**The closure of a pro-constructible subset is its set of specializations.**
(*closure-of-pro-constructible*) Let `X` be a spectral space and `S ⊆ X` pro-constructible. Prove
`closure_eq_setOf_specializes_of_isProConstructible`: the closure of `S` in `X` is exactly the set
of specializations of points of `S` ([ECD] §2, Lem. 2.4 with proof, pp. 10–11); the quasicompactness
step is where the profinite constructible topology is used ([ECD] §2, proof of Lem. 2.4, p. 11). In
particular a pro-constructible subset stable under specialization is closed, and, by compactness in
the constructible topology applied to the family of quasicompact open neighbourhoods, a
pro-constructible generalizing subset of a spectral space is an intersection of quasicompact open
subsets, as stated by `eq_sInter_of_isProConstructible_of_stableUnderGeneralization` ([ECD] proof of
Lem. 2.7, p. 12, dual of Lem. 2.4); this dual form is the one used repeatedly in [ECD] §§7, 9 and
11. The irreducible-closure case — the generic point of the closure of a pro-constructible subset
lies in it — is Tau Ceti's `TauCeti.IsProConstructible.mem_of_isGenericPoint`, and the inclusion of
the specializations in the closure is `specializes_iff_mem_closure` with `closure_mono`; the new
content is the reverse inclusion for a general pro-constructible `S` and the corollary on
generalizing subsets. Mathlib has `StableUnderSpecialization` and `StableUnderGeneralization` but no
statement of this kind; for `S` a single point the conclusion is the standard description of the
closure of a point in a sober space. *Needs:* R0.19.2; Mathlib `StableUnderSpecialization`,
`StableUnderGeneralization`, `specializes_iff_mem_closure`; Tau Ceti
`TauCeti.IsProConstructible.mem_of_isGenericPoint`.

**Checks.**

- `s0_4_single_point` — In the Sierpiński topology the closure of `{true}` is the whole space, while the closure of `{false}` is `{false}`.
- `s0_4_generic_point_of_dvr` — for `X = Spec` of a discrete valuation ring and `S = {η}` the generic
  point, `S` is constructible and its closure is `X = {η, s}`, the set of specializations of `η`;
  the dual form says that `{η}`, which is generalizing, is the quasicompact open `{η}` itself.
- `s0_4_not_pro_constructible_fails` (non-example) — on the ordinary closed unit disc over `C`, the set `S` of
  rank-one points is generalizing with closure the whole space, while `S` is not an intersection of
  quasicompact opens, so the dual form needs pro-constructibility and does not hold for arbitrary
  generalizing subsets.

- `s0_4_closed_point_closure` (computation and supplier agreement) — in `{η ⤳ s}`, the singleton `{s}` is
  `TauCeti.IsProConstructible` and its closure is `{s}`; `{η}` instead has closure `{η,s}`. This
  fixes the specialization direction in both two-point cases.

Lean: `closure_eq_setOf_specializes_of_isProConstructible` and
`eq_sInter_of_isProConstructible_of_stableUnderGeneralization`, with the Check `s0_4_single_point`
as an example. The rest of this subsection is specified in the README only (no Lean declaration).

### R0.19.4 Generalizing surjections are quotient maps

**A surjective generalizing spectral map is a quotient map.**
(*generalizing-surjection-is-quotient*) Let `f : Y → X` be a surjective, generalizing spectral map
of spectral spaces, where generalizing means that every generalization of a point in the image
lifts, Mathlib's `GeneralizingMap`. Prove `isQuotientMap_of_generalizingMap`: `f` is a quotient map
([ECD] §2, Lem. 2.5 with proof, p. 11). The companion criterion with no spectrality — a continuous
surjection from a quasicompact space onto a compact Hausdorff space is a quotient map ([ECD] §2,
Lem. 2.6, p. 11) — is reused from Mathlib as `Topology.IsQuotientMap.of_surjective_continuous`
(compact source, Hausdorff target), equivalently `Continuous.isClosedMap` composed with
`Topology.IsClosedMap.isQuotientMap`, and is not restated; DiamondsAndVStacks D5.13–D5.14 use it for Berkovich
quotients ([ECD] Props. 13.9 and 13.11). The generalizing criterion is used
constantly because all maps of analytic adic spaces are generalizing. The generalizing hypothesis
cannot be dropped from the first: a bijective continuous spectral map need not be a homeomorphism,
and ECD uses the hypothesis in every application (Lem. 2.11, Lem. 7.13, Lem. 7.14, Cor. 8.6, Lem.
9.8, Prop. 10.11, Prop. 11.13, Prop. 11.20). The proof is the specialization-stability of `X ∖ U`
for `f⁻¹(U)` open: `X ∖ U` is the image of the closed set `f⁻¹(X ∖ U)`, pro-constructible by R0.19.2,
and a generalization of a point of `U` lifts into the open `f⁻¹(U)`, so `X ∖ U` is stable under
specialization and closed by R0.19.3. *Needs:* R0.19.3 and R0.19.2; Mathlib `GeneralizingMap`,
`Topology.IsQuotientMap`, `IsCompact.image`, `Continuous.isClosedMap`,
`Topology.IsClosedMap.isQuotientMap`, and `PrimeSpectrum.isQuotientMap_of_generalizingMap` (the
`Spec` case, for `comap` of a ring map).

**Checks.**

- `s0_7_identity_and_empty` — For the relation on discrete `Bool × Bool` defined by equality of first coordinates, the quotient map has two fibres: `(true,false)` and `(true,true)` have the same image, distinct from the image of `(false,true)`.
- `s0_7_patch_identity_not_quotient` (non-example) — for `X = Spec` of a discrete valuation ring the
  identity `X_cons → X` is a continuous bijective spectral map (every subset of the discrete
  `X_cons` is quasicompact open) which is not generalizing (`η ⤳ s` in `X` has no lift, `X_cons`
  being discrete) and not a quotient map (`{s}` has open preimage and is not open).

- The identity of a spectral space is surjective, generalizing and spectral, hence a
  quotient map; the empty spectral space satisfies the same assertion.

Lean: `isQuotientMap_of_generalizingMap`, with the Check `s0_7_patch_identity_not_quotient` as an
example. The rest of this subsection is specified in the README only (no Lean declaration).

### R0.19.5 the spectral-limit lemma

**Cofiltered inverse limits of spectral spaces are spectral.** (*spectral-limit-lemma*)
Let `I` be a small nonempty cofiltered category and `i ↦ X_i` a diagram of spectral
spaces with spectral transition maps. Give `X = lim_i X_i` the topology of the compatible
locus in `∏ i, X_i`. Prove that `X` is spectral and every projection `X → X_i` is spectral
([ECD] §2, Lemma 2.11, p. 13). The spectral product calculus gives the compatible locus;
compactness in the constructible topologies supplies the inverse-limit compactness argument.
*Needs:* Mathlib `SpectralSpace`, `IsSpectralMap`, `WithConstructibleTopology`,
`CategoryTheory.IsCofiltered`, compact inverse limits and Tychonoff; Tau Ceti
`TauCeti.IsProConstructible.prod`, `TauCeti.IsProConstructible.pi`, `TauCeti.isSpectralMap_eval`.

**Checks.**

- A diagram on the one-object identity category has limit `X_i` and identity projection.
- A constant spectral tower over `ℕᵒᵖ` with identity transitions has its original space as limit.
- The constant discrete Boolean tower has exactly two limit points, each singleton clopen.
- The empty index has a one-point limit, which is spectral; it is excluded by
  `IsCofiltered`'s nonempty-index hypothesis.

Lean: none; this subsection is specified in the README only.

### R0.19.6 Cofiltered limits of spectral spaces

**Cofiltered inverse limits of spectral spaces along spectral maps.**
(*cofiltered-limits-of-spectral-spaces*) Let `(X_i)_{i ∈ I}` be a cofiltered inverse system of
spectral spaces along spectral maps, with inverse limit `X`. Import R0.19.5's
spectral-limit lemma: `X` is spectral and each projection `X → X_i` is spectral. Prove that a
continuous map `Y → X` from a spectral space `Y` is spectral iff every composite `Y → X_i` is;
prove further that a spectral map `Y → X` all of whose composites `Y → X_i` are generalizing is
itself generalizing, and that it is a
quotient map when it is moreover surjective ([ECD] §2, Lem. 2.11 with proof, pp. 13–14, with the
generalizing addendum in the same lemma). The limit is constructed as the compatible locus in the
product; the imported pro-constructible product calculus (`TauCeti.IsProConstructible.prod`,
`TauCeti.IsProConstructible.pi` and `TauCeti.isSpectralMap_eval`) is applied to the compatibility
equations; generalizations are lifted by compactness in the constructible topologies, using
Tychonoff ([ECD] §2, proof of Lem. 2.11, p. 14); and the generalizing quotient criterion of R0.19.4
gives the final assertion. Prove the detection and generalizing clauses directly on the compatible locus,
before the pro-category equivalence of R0.19.9. *Needs:* R0.19.5 *spectral-limit-lemma*; R0.19.1, R0.19.2, R0.19.4; Mathlib `SpectralSpace`, `IsSpectralMap`,
`CategoryTheory.IsCofiltered`, `GeneralizingMap`; Tau Ceti `TauCeti.IsProConstructible.prod`,
`TauCeti.IsProConstructible.pi`, `TauCeti.isSpectralMap_eval`.

**Checks.**

- `s0_10_single_object` (degenerate case) — over an index category with one object and its identity the
  limit is `X_i` itself and the projection is the identity.
- `s0_10_empty_index` (degenerate case) — over the empty index category the limit is the terminal
  space, a point, which is spectral; Mathlib's `IsCofiltered` requires a nonempty index category, so
  the supplied cofiltered-limit statement excludes this case and it is covered by the point
  being spectral.
- `s0_10_profinite_limit` — The constant discrete Boolean tower has a limit with exactly two points, each singleton clopen.
- `s0_10_constant_tower` — for a constant diagram over `ℕᵒᵖ` with identity transitions the limit is `X`
  and the statement is the identity.

The projection clause belongs to the supplied spectral-limit lemma. The additional detection and
generalizing clauses have the suggested signatures `spectral_limit_map` and
`generalizing_limit_map` (README only), each retaining spectrality of all transition maps.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### R0.19.7 spectra of filtered colimits of Tate pairs

**The adic spectrum of a completed direct limit of Tate pairs.**
(*spa-of-filtered-colimit-of-tate-pairs*) Let `I` be small
cofiltered and `(A_i, A_i⁺)_{i ∈ I}` an `Iᵒᵖ`-indexed diagram of Tate Huber pairs (Tau Ceti
`Huber.Pair`, `Huber.IsTateRing`; complete or not) with continuous morphisms of pairs, together with
`i₀`, a pseudouniformiser `ϖ ∈ A_{i₀}⁺` and rings of definition `A_{i,0} ⊆ A_i⁺` (`i ∈ I/i₀`)
containing the image of `ϖ` with `φ_a(A_{i,0}) ⊆ A_{j,0}` (for uniform `A_i` take `A_{i,0} = A_i⁺`;
the rings of definition must be chosen compatibly, and the `ϖ`-adic topology on their colimit is the
colimit topology of [KL15] and of [Sch12] Lem. 6.13(ii)). Let `L := colim A_i`, `L⁺ := colim A_i⁺`
and `L_0 := colim A_{i,0}`, with the topology on `L` in which `L_0` is an open subring with its
`ϖ`-adic topology, and `(L̂, L̂⁺)` the completion. Prove that (a) `(L, L⁺)` is a Tate Huber pair and
the maps `(A_i, A_i⁺) → (L, L⁺)` are morphisms of pairs; (b) the map
`Spa(L, L⁺) → lim_i Spa(A_i, A_i⁺)` given by the Tau Ceti maps `Huber.Pair.Hom.spaComap` is a
homeomorphism onto the inverse limit in topological spaces ([KL15] §2.6, Rem. 2.6.3, p. 53;
[Wedhorn] §7.2, Rem. 7.11(1), p. 59); (c) every rational subset of `Spa(L, L⁺)` is the preimage of a
rational subset `R(T_i/s_i)` of some `Spa(A_i, A_i⁺)`, with `T_i` a finite set generating the unit
ideal of `A_i` ([KL15] §2.6, Rem. 2.6.3, p. 53); (d) composing with the homeomorphism
`Spa(L̂, L̂⁺) ≅ Spa(L, L⁺)` matching rational subsets (Tau Ceti
`TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, pullback along `L → L̂`; [Wedhorn] §7.5,
Prop. 7.48, p. 68; AdicSpaces layer 2), (b) and (c) hold
for the completed direct limit;
the limit is a spectral space and the projections are spectral (R0.19.5 *spectral-limit-lemma*).
For a profinite `S` with a cofinal sequence of finite quotients `S_n` and a complete rank-one
field `K`, `|Spa(C^0(S, K), C^0(S, O_K))| = S × |Spa(K, O_K)| = lim_n S_n × |Spa(K, O_K)|` ([Sch12] §6, proof of
Lem. 6.13(ii), p. 37). *Needs:* Tau Ceti `TauCeti.ValuationSpectrum`, `TauCeti.ValuationSpectrum.comap`,
`TauCeti.ValuationSpectrum.spa`, `TauCeti.ValuationSpectrum.mem_spa_iff`,
`TauCeti.ValuationSpectrum.rationalSubset`, `TauCeti.Huber.Pair.Hom.spaComap`,
`TauCeti.Huber.Pair.Hom.continuous_spaComap`, `TauCeti.Huber.Pair.Hom.spaComap_comp`,
`TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `TauCeti.Huber.IsTateRing`,
`TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.IsPseudoUniformizer.hasBasis_nhds_zero`;
R0.19.5 *spectral-limit-lemma*.

**Checks.**

- A constant complete Tate pair recovers its own spectrum and the identity projections.
- For finite quotients `S_n` of a profinite set `S` and a complete rank-one field `K`,
  the finite-product Tate pairs yield
  `Spa(C^0(S, K), C^0(S, O_K)) = S × Spa(K, O_K)` with its profinite-product topology.
- A rational subset at a finite stage pulls back to the corresponding rational subset
  of the colimit spectrum and of its completion; completion preserves the same rational traces.

Lean: none; this subsection is specified in the README only.

### R0.19.8 finite-stage detection of opens

**Quasicompact opens, constructible sets and clopen sets descend to a finite stage.**
(*quasicompact-opens-in-limits-of-spectral-spaces*) let `I` be a small
cofiltered category, `i ↦ S_i` a diagram of spectral spaces with spectral transition maps
`f_a : S_j → S_i` (Mathlib `SpectralSpace`, `IsSpectralMap`), and `S = lim_i S_i` with projections
`p_i`. Prove that (a) every quasicompact open `U ⊆ S` equals `p_i⁻¹(U_i)` for some `i` and some
quasicompact open `U_i ⊆ S_i`, and every constructible subset of `S` is the preimage of a
constructible subset of some `S_i` ([Stacks] Tag 0A30, Lem. 5.24.6; [Stacks] Tag 0A2Y, Lem. 5.24.4);
(b) if `U_i, U_i' ⊆ S_i` are quasicompact opens with `p_i⁻¹(U_i) ⊆ p_i⁻¹(U_i')` (resp. `=`), there is
`a : j → i` with `f_a⁻¹(U_i) ⊆ f_a⁻¹(U_i')` (resp. `=`); in particular if `p_i⁻¹(U_i) = S` then
`f_a⁻¹(U_i) = S_j` for some `a` ([Sch12] §6, Lem. 6.13(iv), p. 37), and if `p_i⁻¹(U_i) = ∅` then
`f_a⁻¹(U_i) = ∅` for some `a`; (c) finite unions and intersections of such identities hold at a
common finite stage; (d) if `U_i ⊆ S_i` is a quasicompact open and `p_i⁻¹(U_i)` is open and closed
in `S`, then `f_a⁻¹(U_i)` is open and closed in `S_j` for some `a : j → i` ([ECD] §6, proof of
Prop. 6.4(iii), p. 28; [Berkeley] Lecture 8, proof of Lem. 8.2.4, printed p. 58). For the Cantor set
`S = lim_n {0,1}^n` the clopen subsets are exactly the preimages of subsets of some `{0,1}^n`, while
the open `S ∖ {s}` is not quasicompact and is the preimage of no open of any finite stage, so
quasicompactness is needed in (a). The inverse-system compactness lemma behind (b) is Tau Ceti's
`exists_forall_map_eq_of_compact_t2`. *Needs:* R0.19.5 *spectral-limit-lemma*; Mathlib
`SpectralSpace`, `IsSpectralMap`, `WithConstructibleTopology`,
`TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`; Tau Ceti `TauCeti.IsProConstructible`,
`TauCeti.IsProConstructible.isCompact`, `TauCeti.exists_forall_map_eq_of_compact_t2`.

**Checks.**

- In `S = lim_n {0,1}^n`, every clopen subset is pulled back from a finite Boolean stage.
- For `s ∈ S`, the open `S ∖ {s}` is not quasicompact and does not descend to a finite stage.
- Equality, containment, emptiness and a finite collection of unions and intersections of
  finite-stage quasicompact opens are detected after passage to a common stage.

Lean: none; this subsection is specified in the README only.

### R0.19.9 Pro-categories and spectral spaces

**Pro-categories, and spectral spaces as the pro-category of finite T0 spaces.**
(*pro-category-of-finite-t0-spaces*) For a category `C`, the pro-category `Pro(C)` has as objects
cofiltered diagrams in `C` and `Hom(lim Y_i, lim Z_j) = lim_j colim_i Hom(Y_i, Z_j)`. The
construction is carried out for a small category `C`, or at least one essentially small on the
relevant slices, as in ECD's affine étale categories. Mathlib has `Ind`
but no `Pro`; the carrier is `Pro(C) = Ind(Cᵒᵖ)ᵒᵖ`. Suggested names in this paragraph lie in
`TauCetiRoadmap.AdicSpacesPartII`. Define `Pro` as the pro-category of `C`, with objects
cofiltered diagrams and the double-limit Hom formula, and `Pro.mk` (a cofiltered diagram in `C`
determines an object of `Pro(C)`); construct `Pro.homEquiv` (`Hom_{Pro C}(lim Y_i, lim Z_j)` is
naturally `lim_j colim_i Hom_C(Y_i, Z_j)`). Prove `Pro.homEquiv_stage`: for small cofiltered
diagrams `Y : I ⥤ C`, `Z : J ⥤ C`, a pro-morphism `f : Pro.mk Y ⟶ Pro.mk Z`, and `g : Y_i ⟶ Z_j`, if
`f ≫ π_j = π_i ≫ const(g)`, then the `j`-coordinate of `Pro.homEquiv Y Z f` is
`colimit.ι (Pro.homStage Y Z j) (op i) g`. Here `π_i` is the opposite of
`colimit.ι (Y.op ⋙ Ind.yoneda) (op i)` and `const(g) = (Ind.yoneda.map g.op).op`; these are the
canonical maps of the chosen Ind presentation. This specifies the Hom comparison on every stage
representative ([ECD] Proposition 7.10, proof, p. 33). Prove `Pro.homEquiv_naturality`: for natural
transformations `a : Y′ → Y` and `b : Z → Z′`, precomposition and postcomposition on pro-morphisms
become the stage map `h ↦ a_i ≫ h ≫ b_j` on the double-limit side. Cofiltered limits and, when `C` has finite limits, finite
limits use the existing opposite-category instances listed in the supplier contracts. For a fixed
small cofiltered index `I`, flattening a diagram `I ⥤ Pro(C)` is its limit, using Mathlib
`CategoryTheory.Limits.lim`, `limit.π`, `limit.lift` and `limit.isLimit` in
`Mathlib/CategoryTheory/Limits/HasLimits.lean`. The cone, rather than an unconstrained functor
`Pro(Pro(C)) → Pro(C)`, specifies the flattening used in [ECD] Lemma 7.11(i). Prove
`SpectralSpace.equivProFiniteTZero` (the category of spectral spaces with spectral maps is
equivalent to `Pro(finite T0 spaces)`, with finite T0 spaces and spectral maps, not arbitrary finite
Hausdorff spaces) and `SpectralSpace.asProLimit` (every spectral space admits a presentation as the
inverse limit of finite T0 spectral quotients) ([ECD] §2, Thm 2.2, p. 10; [ECD] §7, Prop. 7.10 and
proof of Lem. 7.11, pp. 33–34, which is why the general pro-category and not only the profinite case
is needed). The finite T0 quotients are constructed from finite distributive sublattices of the
lattice of quasicompact opens; refinement defines the cofiltered diagram, and quasicompact opens
descend to finite quotients, which proves the Hom formula and the equivalence; finite T0 spaces are
identified with finite partial orders through Mathlib's `Specialization` (a `PartialOrder` under
`T0Space`, with `homeoWithUpperSetTopologyorderIso` for Alexandrov-discrete spaces), which serves
for the finite-stage quotients in place of a new category of finite T0 spaces. *Needs:* R0.19.1; R0.19.6;
Mathlib `CategoryTheory.Ind`, `CategoryTheory.IsCofiltered`, `CategoryTheory.Limits.HasLimits`,
`Profinite`, `Profinite.asLimit`, `Specialization`.

**Checks.**

- `s0_13_pro_flatten_projection` — On the constant Boolean pro-object tower, the cone induced by Boolean negation lifts to a map whose stage-two projection is negation, distinct from the identity.
- `s0_13_pro_flatten_constant` — The limit of the constant Boolean pro-object tower has exactly four maps to the constant Boolean pro-object.
- `s0_13_pro_flatten_unique` — There are two distinct maps from the constant Boolean pro-object into its constant tower limit, and the stage-zero projection distinguishes them.
- `s0_13_pro_homStage_precomposition` — Precomposing the identity of `ℤ/2ℤ` with reduction from `ℤ/4ℤ` sends `2` to `0`.
- `s0_13_pro_homDiagram_postcomposition` — For `p = 2` and a constant one-point source, the target transition from precision two to one sends the class of `3` to a class different from that of `0`.

- `s0_13_profinite_case` — `Pro(finite sets)` is equivalent to the category of profinite sets, compatibly
  with Mathlib's `Profinite.asLimit`; the equivalence restricts to the standard one.
- `s0_13_constant_diagram` — for the terminal category (one object and its identity morphism only),
  `Pro(C)` is equivalent to `C`; this is not asserted for a general one-object monoid category.
- `s0_13_spec_is_spectral` — under the equivalence, `Spec` of a ring goes to the system of its finite T0
  quotients; a construction that does not reproduce `PrimeSpectrum`'s spectral structure is wrong.
- `s0_13_hom_is_not_the_naive_limit` — For `Y = Pro.residueSystem p` and prime `p`, the `j`-coordinate of `Pro.homEquiv Y Y (𝟙 _)` is the colimit class of `𝟙 (Y.obj j)`. No fixed source stage admits a compatible family of maps to all target stages representing those coordinates. Thus the identity lies in `lim colim` but not in the image of `colim lim`.
- `s0_13_finite_t0_is_constant` (degenerate case) — a finite T0 space, such as the Sierpiński space or a
  point, is spectral and is presented by the constant diagram on itself; under the equivalence it
  goes to the corresponding constant pro-object, and `Hom` between two finite T0 spaces is the set
  of continuous maps, every continuous map between finite spaces being spectral.
- `s0_13_empty_space` (degenerate case) — the empty space is spectral and is the constant pro-object on
  the empty finite T0 space; `Hom(∅, Z) = lim_j Hom(∅, Z_j)` is a point.

The suggested carrier `Pro.mk` allows a category with a large object type and small Hom types;
this includes the category of finite T0 spaces. Its cofiltered indexing categories remain small.

**`FiniteTZero`.** Finite T₀ spaces include non-Hausdorff chains.

**Checks.**

- `definition_FiniteTZero_1` — The two-point chain is an object.
- `definition_FiniteTZero_2` — The empty space is an object.
- `definition_FiniteTZero_3` — An indiscrete two-point space cannot be an object.

**`finiteTZeroToTopCat`.** The inclusion retains the original topology.

**Checks.**

- `definition_finiteTZeroToTopCat_1` — The explicitly bundled Sierpiński object has exactly the opens `∅`, `{true}` and the whole space after inclusion.
- `definition_finiteTZeroToTopCat_2` — On the discrete Boolean object, the included negation morphism sends `true` to `false` and `false` to `true`.
- `definition_finiteTZeroToTopCat_3` — Boolean negation is not continuous on the included Sierpiński object.

**`SpectralCat`.** The objects retain spectral, potentially non-Hausdorff topology.

**Checks.**

- `definition_SpectralCat_1` — The two-point specialization chain is an object.
- `definition_SpectralCat_2` — The empty space is an object.
- `definition_SpectralCat_3` — Discrete ℕ is not an object: local spectrality alone is insufficient.

**`SpectralCat.Hom`.** Morphisms respect specialization and quasi-compact opens.

**Checks.**

- `definition_Hom_1` — A map from a point to either point of the chain is spectral.
- `definition_Hom_2` — There is exactly one map from an empty spectral space to any spectral space.
- `definition_Hom_3` — The order-reversing swap of the two-point chain is not a morphism.

**`SpectralSpace.FiniteTZeroPresentation`.** A presentation realizes the topology as well as the point set.

**Checks.**

- `definition_FiniteTZeroPresentation_1` — The two-point specialization chain has a finite-T₀
  presentation.
- `definition_FiniteTZeroPresentation_2` — The empty space has a presentation.
- `definition_FiniteTZeroPresentation_3` — Discrete ℕ has no such presentation, since a cofiltered
  limit of finite spectral spaces is compact.

**`SpectralSpace.asProLimit`.** The chosen diagram must recover each input space.

**Checks.**

- `definition_asProLimit_1` — For a finite two-point space the chosen diagram is the constant two-point diagram, not merely some pro-presentation.
- `definition_asProLimit_2` — The empty space uses the constant empty diagram on the one-object category.
- `definition_asProLimit_3` — The chosen finite two-point diagram is not the constant one-point diagram.

**`Pro`.** The opposite Ind carrier retains the ordinary maps between constant finite objects.

**Checks.**

- `Pro_two_to_three_hom_card` — Between constant two- and three-element sets the Hom set has nine elements.
- `Pro_empty_to_point_unique` — The constant empty object has exactly one map to the constant point.
- `Pro_point_to_empty_no_map` — There is no map from the constant point to the constant empty object, excluding reversal of arrows.

**`Pro.mk`.** A constant finite diagram retains its finite-set mapping behaviour.

**Checks.**

- `Pro_mk_bool_endomorphisms` — A constant two-point object has four endomorphisms.
- `Pro_mk_empty_endomorphism` — The constant empty object has a unique endomorphism.
- `Pro_mk_bool_not_iso_point` — The constant two-point object is not isomorphic to the constant point.

**`Pro.residueSystem`.** For a prime `p`, use the finite sets `ℤ/pⁿℤ` with the
ring reduction maps as a diagram on `ℕᵒᵖ`. This is the nonconstant finite-set system
in the double-limit Hom computation; it uses `ZMod.castHom`, rather than a chosen
function between equally sized carriers.

**Checks.**

- `residueSystem_reduction` — Reduction from `ℤ/4ℤ` to `ℤ/2ℤ` sends `3` to `1`.
- `residueSystem_zero_precision` — For `p = 2`, precision zero has one element and precision two has four.
- `residueSystem_collision` — Reduction sends the nonzero element `2` modulo `4` to `0` modulo `2`.
- `residueSystem_prime_three` — For `p = 3`, precision two has nine elements and reduction from
  `ℤ/9ℤ` to `ℤ/3ℤ` sends `3` to `0`; both computations differ from the `p = 2` Checks.

The Check `residueSystem_prime_three` is an anonymous Lean example using `ZMod.castHom`.

**`Pro.homStage`.** The source variable is contravariant; its transition acts by precomposition.

**Checks.**

- `Pro_homStage_two_to_three` — A constant two-point source and three-point target give nine stage maps.
- `Pro_homStage_empty_source` — A constant empty source gives exactly one map to a point.
- `Pro_homStage_residue_precomposition` — The source transition from precision one to two sends the identity map of `ℤ/2ℤ` to a function taking `3` to `1`.

**`Pro.homDiagram`.** The inner colimit uses precomposition and the outer diagram uses postcomposition.

**Checks.**

- `Pro_homDiagram_two_to_three` — A constant two-point source and three-point target give nine morphisms at a stage.
- `Pro_homDiagram_empty_source` — An empty constant source gives a unique stage morphism.
- `Pro_homDiagram_residue_postcomposition` — For a constant one-point source, reduction sends the colimit class of `3` modulo `4` to the class of `1` modulo `2`.

**`Pro.homEquiv`.** The double-limit comparison sends a morphism represented at a target
stage by `g : Y_i ⟶ Z_j` to the colimit class of that same `g`, as specified by
`Pro.homEquiv_stage`. In particular it preserves identity germs and distinguishes the
two constant endomorphisms of a constant Boolean diagram.

**Checks.**

- `Pro_homEquiv_identity_coordinate` — The j-coordinate of the identity pro-morphism is the colimit class of the identity at j.
- `Pro_homEquiv_constant_identity` — For a constant one-stage diagram the identity is still the identity germ.
- `Pro_homEquiv_nonidentity_coordinate` — A compatible family with a nonidentity coordinate is not the image of the identity.
- `Pro_homEquiv_constant_false` — On the one-stage Boolean diagram, the morphism induced by the constant-false map has the constant-false germ.
- `Pro_homEquiv_constant_true` — On the same diagram, the morphism induced by the constant-true map has the constant-true germ.
- `Pro_homEquiv_constants_not_swapped` — The constant-false morphism does not have the constant-true germ, excluding an equivalence that swaps these maps while fixing the identity.

**`SpectralSpace.equivProFiniteTZero`.** The equivalence sends finite spectral spaces to their
constant pro-objects; it retains specialization topology rather than just the finite underlying set.
`SpectralSpace.equivProFiniteTZeroFunctorObjIso X` identifies its value on every `X : SpectralCat`,
including infinite spaces, with `Pro.mk (asProLimit X.toTop).diagram`. Prove
`SpectralSpace.equivProFiniteTZero_functor_obj_naturality`: for each spectral map `f : X ⟶ Y` and
each target stage `j`, there are a source stage `i` and a continuous finite-stage map
`g : P_i ⟶ Q_j` such that `π_j ∘ Q.isoLimit ∘ f = g ∘ π_i ∘ P.isoLimit` and the `j`-coordinate of
`Pro.homEquiv` applied to `e_X.inv ≫ equivProFiniteTZero.functor.map f ≫ e_Y.hom` is the colimit
class of `g`. Here `P = asProLimit X.toTop`, `Q = asProLimit Y.toTop`, and `e` is the object
comparison. This states naturality through the presentation coordinates and specifies the action on
every morphism. `SpectralSpace.equivProFiniteTZeroInverseObjIso F` identifies the inverse value on
`Pro.mk F` with the spectral space whose underlying space is `limit (F ⋙ finiteTZeroToTopCat)`, for
every small cofiltered diagram `F` of finite T₀ spaces. These are the object and map comparisons of
[ECD] Theorem 2.2, p. 10; the spectral structure on the limit is supplied by R0.19.6.

**Checks.**

- `equivProFiniteTZero_finite_constant` — A finite spectral space is sent to the constant diagram of that exact finite topological space.
- `equivProFiniteTZero_empty` — The empty spectral space gives the constant empty pro-object.
- `equivProFiniteTZero_sierpinski_not_discrete` — The Sierpiński space is not sent to the constant discrete two-point space; forgetting specialization would fail.
- `equivProFiniteTZero_functor_obj_cantor` (also `equivProFiniteTZeroFunctorObjIso_cantor`) — The infinite product `ℕ → Bool` with
  its product topology is sent to its chosen finite-T₀ presentation.
- `equivProFiniteTZero_functor_obj_constant_false` (also `equivProFiniteTZeroFunctorObjIso_constant_false`) — After the object comparison,
  the constant-false Boolean endomorphism has at each stage the germ of the
  constant map to the coordinate of `false`.
- `equivProFiniteTZero_functor_obj_constant_true` (also `equivProFiniteTZeroFunctorObjIso_constant_true`) — The constant-true endomorphism
  instead has the germ of the constant map to the coordinate of `true`; the
  projections separate these two points, excluding a swap of the constant maps.
- `equivProFiniteTZero_inverse_obj_empty` (also `equivProFiniteTZeroInverseObjIso_empty`) — The inverse value on the constant
  empty diagram is empty.
- `equivProFiniteTZero_inverse_obj_sierpinski` (also `equivProFiniteTZeroInverseObjIso_sierpinski`) — The inverse value on the constant
  Sierpiński diagram has two points and is not Hausdorff.
- `equivProFiniteTZero_inverse_obj_cantor` (also `equivProFiniteTZeroInverseObjIso_cantor`) — The inverse value on the chosen
  presentation of `ℕ → Bool` is homeomorphic to that infinite product.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### R0.19.10 Quasicompact and quasiseparated objects; algebraic topoi

This section supplies the qcqs vocabulary for objects and morphisms in ordinary sheaf topoi.

**Quasicompact and quasiseparated objects and morphisms in a topos; algebraic topoi.**
(*quasicompact-objects-in-a-topos*) Work in the Grothendieck topos `T = Sheaf J (Type u)` on a site
`C : Type u` with `Category.{u} C` and `J : GrothendieckTopology C`. The site is small in universe
`u`, and sheaves take values in that same universe. The notions use effective-epimorphic families,
colimits and pullbacks. An object `X` is quasicompact if every jointly surjective family of maps
`X_i → X` has a finite jointly surjective subfamily; `X` is quasiseparated if for all quasicompact
`Y`, `Z` over `X` the fibre product `Y ×_X Z` is quasicompact; a map `f : Y → X` is quasicompact if
for all quasicompact `Z` over `X` the fibre product `Z ×_X Y` is quasicompact, and quasiseparated if
its diagonal is quasicompact; `T` is algebraic if there is a generating full subcategory `C` of qcqs
objects, stable under fibre products, such that `X → *` is quasiseparated for every `X` in `C`; the
suggested Lean form `IsAlgebraic` quantifies over this generating object property, includes its
fibre-product closure, and requires effective-epimorphic generating families for every sheaf. Object
quasicompactness is kept separate from quasicompactness of the map `X → *`: when the final object is
not quasiseparated, as on the big perfectoid site, the two differ, and every later qcqs statement
depends on this distinction ([ECD] §8, recollection of SGA 4 VI, p. 40; [ECD] §8, p. 40, the
definition of an algebraic topos and the standing hypothesis of [ECD] §§8–13; [ECD] §8, warning, p.
41; [SGA 4 VI] Exp. VI §§1–2, Defs. 1.1, 1.7, 1.13, 2.3 and Cors. 1.17, 2.6, 2.8, transcription pp.
121–142 (PDF pp. 127–148), the original marginal pagination being separate). Here the suggested
namespace `Topos` is `TauCetiRoadmap.AdicSpacesPartII.Topos`, with `J : GrothendieckTopology C`
and objects in `Sheaf J (Type u)`. Define `Topos.IsQuasicompact` (an object of a category of sheaves
is quasicompact), `Topos.IsQuasiseparated` (an object is quasiseparated), `Topos.Hom.IsQuasicompact`
(a morphism is quasicompact, defined by pullback along maps from quasicompact objects),
`Topos.Hom.IsQuasiseparated` (its diagonal is quasicompact), and `Topos.IsAlgebraic` (a generating
full subcategory of qcqs objects, closed under fibre products, whose structural maps are
quasiseparated); prove `Topos.Hom.isQuasiseparated_iff_diagonal` (a sheaf morphism is quasiseparated
exactly when for every sheaf `H` and map `H → G`, the diagonal of `F ×_G H → H` is quasicompact;
this includes stability of the diagonal condition under arbitrary base change),
`Topos.Hom.isQuasicompact_comp` and `Topos.Hom.isQuasicompact_pullback` (quasicompact morphisms are
stable under composition and base change), `Topos.Hom.isQuasiseparated_comp` and
`Topos.Hom.isQuasiseparated_pullback` (the corresponding stability statements for quasiseparated
morphisms), `Topos.isQuasiseparated_iff_of_cover` (if `J` is algebraic and `G_i → F` is an
effective-epimorphic family of qcqs sheaves, then `F` is quasiseparated exactly when every
`G_i ×_F G_j` is quasicompact; SGA 4 VI Cors. 1.17, 2.6 and 2.8) and
`Topos.isQuasicompact_of_isQuasicompact_terminal` (if the terminal object is quasicompact and
`X → *` is a quasicompact morphism then `X` is quasicompact). The terminal-object hypothesis is
essential: the identity of a non-quasicompact terminal object is a quasicompact morphism, and the
converse needs the relevant assumptions on the final object. For the topos of sheaves on a spectral
space the terminal object is qcqs and the object and terminal-map notions agree, but merely having a
terminal object in a site does not ensure this: in sheaves on discrete `ℕ`, which is algebraic with
the representable singletons as generators, a sheaf `(A_n)` is quasicompact exactly when `∑_n |A_n|`
is finite, so the terminal object `(*)_n` is covered by its singleton opens with no finite subcover
while its identity is a quasicompact morphism; this refutes the unconditional implication from
"`X → *` quasicompact" to "`X` quasicompact" (take `X = *`), and it shows that for quasicompact `Y`
the projection `X × Y → X` need not be an epimorphism (take `Y` a representable singleton, whose map
to `*` is not an epimorphism). *Needs:* Mathlib `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Sheaf`, `CategoryTheory.Limits.HasLimits`,

`CategoryTheory.EffectiveEpiFamily`.

**Checks.**

- `s0_17_algebraic_point` (computation) — sets form an algebraic topos, generated by finite sets.
- `s0_17_algebraic_discrete_infinite` (non-example to compactness) — sheaves on discrete `ℕ` form an
  algebraic topos although the terminal sheaf is not quasicompact; finite-support finite families
  give the generators, closed under fibre products.
- `s0_17_nonalgebraic_real_line` (non-example) — sheaves on `ℝ` are not an algebraic topos. A nonempty
  quasicompact sheaf would have a nonempty quasicompact open image in `ℝ`, which has no such open.

- `s0_17_Topos_IsQuasicompact_finite_coproduct` — A finite coproduct of quasicompact sheaves is quasicompact.
- `s0_17_Topos_IsQuasicompact_infinite_coproduct_failure` — An infinite coproduct of noninitial sheaves
  is not quasicompact.
- `s0_17_agrees_with_topological_qcqs` — for sheaves on a topological space the notions agree with
  quasicompactness and quasiseparatedness of the corresponding open set.
- `s0_17_point_topos` (degenerate case) — in the topos of a point, `Set`, an object is quasicompact
  exactly when it is finite (the cover by singletons of an infinite set has no finite subfamily),
  every object is quasiseparated, the terminal object is quasicompact, and the two quasicompactness
  notions agree; the empty sheaf is quasicompact in every topos, by the empty family.
- `s0_17_terminal_map_of_qc_object` (non-example) — in sheaves on discrete `ℕ` the terminal object is not
  quasicompact, and for the representable singleton `Y = {n}` the map `Y → *` is quasicompact and
  quasiseparated but not an epimorphism.

- `s0_17_qc_identity_noncompact` — the identity of the terminal sheaf on discrete `ℕ` is a
  quasicompact map although that sheaf is not a quasicompact object.
- `s0_17_qc_empty` — the initial sheaf is quasicompact, witnessed by the empty covering family.
- `s0_17_qs_identity` — identity maps are quasiseparated, including on a non-quasiseparated object.
- `s0_17_qs_point_topos` — every map in the point topos is quasiseparated.

The map interfaces include `Topos.Hom.isQuasicompact_pullback`,
`Topos.Hom.isQuasiseparated_comp` and `Topos.Hom.isQuasiseparated_pullback` with the stated
quasicompactness or quasiseparatedness hypothesis on the original maps.

**`Topos.IsQuasicompact`.** Quasi-compactness detects finite support of a covering family.

**Checks.**

- `definition_IsQuasicompact_1` — A sheaf with exactly two elements on the point site is
  quasi-compact.
- `definition_IsQuasicompact_2` — The initial sheaf is quasi-compact on every site.
- `definition_IsQuasicompact_3` — The terminal sheaf on discrete ℕ is not quasi-compact.

**`Topos.IsAlgebraic`.** An algebraic topos has compact generators; its terminal object need not be compact.

**Checks.**

- `definition_IsAlgebraic_1` — Sheaves on discrete ℕ form an algebraic topos although the terminal
  object is not compact.
- `definition_IsAlgebraic_2` — The topos of a point is algebraic.
- `definition_IsAlgebraic_3` — Sheaves on the real line do not form an algebraic topos.

**`Topos.IsQuasiseparated`.** Quasi-separatedness detects noncompact intersections of compact pieces.

**Checks.**

- `Topos_IsQuasiseparated_naturals_not_quasicompact` — In the point topos the infinite constant natural-number sheaf is quasi-separated, though it is not quasi-compact.
- `Topos_IsQuasiseparated_initial` — The initial sheaf is quasi-separated.
- `Topos_IsQuasiseparated_doubled_limit_point_failure` — Doubling the limit point of the convergent sequence produces two compact opens with noncompact intersection ℕ; its terminal sheaf is not quasi-separated.

**`Topos.Hom.IsQuasicompact`.** Relative quasi-compactness tests the fibres over quasi-compact objects.

**Checks.**

- `Topos_Hom_IsQuasicompact_bool_to_point` — On the point site, a map from Bool to a point is quasi-compact.
- `Topos_Hom_IsQuasicompact_noncompact_identity` — The identity on the noncompact terminal sheaf over discrete ℕ is quasi-compact.
- `Topos_Hom_IsQuasicompact_naturals_to_point_failure` — On the point site, a map from ℕ to a point is not quasi-compact.

**`Topos.Hom.IsQuasiseparated`.** Quasi-separatedness of a map is tested on its diagonal, without a compactness requirement on its fibres.

**Checks.**

- `Topos_Hom_IsQuasiseparated_naturals_not_quasicompact` — An infinite set over the point is quasi-separated but its projection is not quasi-compact.
- `Topos_Hom_IsQuasiseparated_identity` — Every identity map is quasi-separated, even on an object which is not quasi-separated.
- `Topos_Hom_IsQuasiseparated_terminal_projection_failure` — An object with non-quasi-compact diagonal over a quasi-separated terminal object has a projection which is not quasi-separated.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### R0.20 tilde-limits of adic spaces

### R0.20.1 tilde-limits of adic spaces

**Tilde-limits and the affinoid criterion.** (*tilde-limits-affinoid-criterion*) Huber's relation
`X ∼ lim X_i` — `|X| → lim |X_i|` a homeomorphism, and `X` covered by open affinoids `Spa(A, A⁺)`
in which the colimit of the rings of the affinoid opens of the `X_i` through which they factor is
dense — the affinoid criterion for it (a compatible direct system of complete Huber pairs
with sheafy levels and sheafy separated completion gives an adic tilde-limit, under the
definition-ring hypotheses below), and its stability under open immersions and under fibre products with a
fixed space over the system are the contracts of this section: the relation `AdicSpace.IsTildeLimit`,
its affinoid criterion `AdicSpace.IsTildeLimit.affinoid`, the completed-direct-limit criterion
below, and base change `AdicSpace.IsTildeLimit.baseChange` (*tilde-limit-base-change*, stated in
R0.20.2). The spaces are quasi-compact
and quasi-separated, and transition morphisms are adic; analyticity is not
required. The affinoid proof uses compatible rings of definition and their
finitely generated ideals, with density in the completed direct limit
(Scholze–Weinstein 2013 Definition 2.4.1 and Proposition 2.4.2; Huber96 §2.4,
Definition 2.4.2). PerfectoidSpaces P7 specializes this relation to analytic
towers and is not an input. *Needs:* *affinoid-fibre-product*, *fibre-products-existence*,
*base-change-stability* (R0.7). Lean: `AdicSpace.IsTildeLimit`,
`AdicSpace.IsTildeLimit.affinoid` (which keeps the point-space homeomorphism as a hypothesis); the
completed-direct-limit criterion is specified in this README only.

For the completed-direct-limit criterion, take a filtered direct system of complete Huber
pairs `(A_i, A_i⁺)` with rings of definition `A_{i,0} ⊆ A_i⁺` preserved by transition maps
and finitely generated ideals of definition `I_i` with `I_j = I_i A_{j,0}` for `j ≥ i`.
Fix finite generators at one stage and restrict to its cofinal tail. Put `A = colim_i A_i`,
`A_0 = im(colim_i A_{i,0} → A)` and `I = I_i A_0`, and require finite-stage detection:
if the image of `a ∈ A_{i,0}` lies in `I^n`, it lies in `I_j^n` at some `j ≥ i`.
Give `A` the ring topology with open subring `A_0` and neighbourhoods `I^n`; put
`A⁺ = integral closure in A of im(colim_i A_i⁺ → A)`. Form the separated completion
`Â` and let `Â⁺` be the closure of the image of `A⁺` in `Â`.
Prove that this is a complete Huber pair, that restriction of valuations gives a
homeomorphism `Spa(Â, Â⁺) ≅ lim_i Spa(A_i, A_i⁺)`, and that the stage-ring images have
dense union in `Â`. These conclusions concern valuation spectra without assuming sheafiness.
If every level pair and `(Â, Â⁺)` are sheafy, conclude that the corresponding adic spaces
form a tilde-limit. Perfectoidness of `Â` supplies the latter hypothesis in perfectoid
applications (PerfectoidSpaces P3.10, *perfectoid-stably-uniform-and-sheafy*).
The construction and valuation argument are Scholze–Weinstein 2013 Proposition 2.4.2,
p. 20; its adic conclusion here uses the sheafy-pair convention of AdicSpacesPartII.

**Checks.**

- A constant complete sheafy pair gives its own completion and the identity tilde-limit.
- A constant zero pair gives empty valuation spectra and an empty adic tilde-limit.
- Sheafiness of the levels alone does not suffice: in HK Example 6.28, pp. 24–25,
  truncate the displayed generators of the definition ring at `n ≤ N`, complete
  `X₂`-adically and invert `X₂`. Each stage is noetherian and sheafy, but their
  completed colimit is the nonsheafy Huber–Rost ring. Its nonzero `X₃` vanishes
  on both rational domains `|X₁| ≤ 1` and `|X₁| ≥ 1`, so the adic conclusion fails.

### R0.20.2 base change of tilde-limits

**Tilde-limits are stable under base change along morphisms locally of weakly finite type.** (*tilde-limit-base-change*) Let `I` be a cofiltered category with a final object `j`, `(X_i)_{i∈I}`
a system of quasi-compact quasi-separated adic spaces with adic transition morphisms, and `X` a
quasi-compact quasi-separated adic space with compatible adic morphisms `φ_i : X → X_i` such that
`X ∼ lim_i X_i` (Huber Definition 2.4.2; `AdicSpace.IsTildeLimit` in R0.20.1). Let `f : Y → X_j` be
an adic morphism of quasi-compact quasi-separated adic spaces that is locally of weakly finite type, and
assume that the fibre products `Y ×_{X_j} X` and `Y ×_{X_j} X_i` exist in adic spaces and are
affinoid-locally `Spa` of completed tensor products (*affinoid-fibre-product*, AdicSpacesPartII layer R0); the
existence of the fibre products is a hypothesis, supplied by *fibre-products-existence* (R0.7)
in the stably sheafy case. AdicSpacesPartIV R5.5 develops the
perfectoid-times-smooth specialization as a downstream application. Prove
that `Y ×_{X_j} X ∼ lim_i Y ×_{X_j} X_i` (Huber96 §2.4, Rem. 2.4.3(ii), p. 126; Huber96 §2.4, (2.4.1), p. 125 (tilde-limits
are defined for qcqs spaces with adic morphisms)). The case of an étale `f` and a perfectoid
tilde-limit `X` is PerfectoidSpaces layer P7 (P7.12c, Scholze–Weinstein 2013 Prop. 2.4.3); this
target is the case of a morphism locally of weakly finite type over quasi-compact quasi-separated
adic `X`, perfectoid or not. For `Y = X_j` the statement is the hypothesis;
BHW Corollary 3.5 is the case `Y = X_1 ×_L U` for a smooth `U`
(the downstream application AdicSpacesPartIV R5.5 *perfectoid-times-smooth-tilde-limit*).
*Needs:* R0.20.1 `AdicSpace.IsTildeLimit.affinoid`,
*tilde-limits-affinoid-criterion*; *fibre-products-existence*, *affinoid-fibre-product*,
*base-change-stability* (R0.7). Lean: `AdicSpace.IsTildeLimit.baseChange`,
with the fibre products given as pullback squares and `f` locally of weakly finite type in the sense
of `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.LocallyOfWeaklyFiniteType`.

**Checks.**

- For `Y = X_j` and `f = id`, the pullback system and its tilde-limit recover the original cone.
- A constant complete sheafy pair with identity projections remains its own tilde-limit
  under the stated base changes; the resulting diagram is constant on the pullback.
- A diagram of empty spaces has empty base change and the empty tilde-limit.
- A proposed cone projection identifying distinct points cannot be a tilde-limit, even
  for a constant diagram; the homeomorphism requirement is independent of the density clause.


### Examples

**Checks for the shared field, affinoid and locally ringed space carriers.**

- `K`-affinoid algebras: `K` has one maximal ideal, the zero algebra none, and the bidisc algebra
  `K⟨T₁, T₂⟩` has dimension two.
- An empty adic space remains empty after forgetting to a locally ringed space.
- The underlying rings of sections are preserved, and the forgetful functor preserves identity maps.
- An adic open immersion gives an open embedding on underlying locally ringed spaces.
- For the field affinoid `Spa(K, K°)`: the ring of definition is K°, with its given subspace topology.
- For the field affinoid: the ideal of definition is generated by the selected element with norm
  strictly between zero and one.
- For the field affinoid: the ideal of definition is neither zero nor the unit ideal.
- For the field affinoid: if `u² = ϖ`, then `‖u‖ < 1` but `u ∉ ϖK°`; the maximal ideal and the principal ideal of definition differ in this case.
- Spa(K,K°) has exactly one point.
- For the field affinoid: membership in the specified plus ring is exactly the inequality ‖a‖ ≤ 1.
- For the field affinoid: the coefficient section of 1 is nonzero.
- For the adic space of a `K`-affinoid algebra: the ring of definition is exactly the image of the completed integral series under the selected strict presentation.
- For the adic space of a `K`-affinoid algebra: the ideal of definition is generated by the image of the same scalar ϖ used for the field basis.
- On the zero affinoid algebra the specified ideal is zero.
- The disc has its full power-bounded plus ring, and its scalar homomorphism from K is not surjective.

The quotient by `(T − c)` strictly decreases the supremum seminorm of `T − c`;
reduction modulo `p²` shows that a ring of definition can equal the power-bounded
subring even when its reduction is not reduced.

- For a complete nontrivially normed ultrametric field K and c with ‖c‖ ≤ 1, T − c has supremum seminorm 1 in K⟨T⟩ and its image in K⟨T⟩/(T − c) has supremum seminorm 0.
- For every prime p and the ring of definition ℤ_p in ℚ_p, reduction modulo p² is not reduced, although this ring of definition equals the power-bounded subring.

**Checks for these carriers and constructions.** The unqualified geometric names below
are in `AdicSpace`; the Čech names are in `Huber`. K has the standing complete rank-one
nonarchimedean hypotheses. Every Čech topology and uniformity Check assumes that `f`
generates the unit ideal, including the singleton unit cover. Each item is one Check.

- Čech terms: the zero module gives a discrete singleton in every degree.
- Čech terms: for the one-element cover by 1, the augmentation identifies degree zero homeomorphically with the natural module topology.
- Čech terms: with n generators, degree p ≥ n is a compact singleton.
- Čech terms: the additive uniformity induces precisely the natural product topology.
- Čech terms: the unit cover recovers the original finite module homeomorphically.
- Separated completion of a zero Čech term is still zero.
- Affinoid presentations: a zero coefficient ring gives an empty spectrum and the zero ring of global sections.
- Affinoid presentations: the coefficient map is bijective; points are exactly the supplied valuation spectrum of the specified plus ring.
- Affinoid presentations: the resulting adic space is affinoid and its coefficient map is injective.
- Induced morphisms of affinoids: the identity pair homomorphism induces the identity geometric map.
- Induced morphisms of affinoids: a composite ψ ∘ φ induces Spa(ψ) followed by Spa(φ).
- Induced morphisms of affinoids: equal geometric maps give equal coefficient homomorphisms.
- Valuation rings of points: for the zero section on U, the subbasic set is the inverse image of U under the point projection.
- Valuation rings of points: a section over the empty open gives the empty subbasic set.
- Valuation rings of points: if a section has valuation greater than 1 at every point of U, its subbasic set is empty.
- Identity morphisms of spaces covered by complete stably sheafy affinoids are adic, locally of weakly, plus weakly and topologically finite type, unramified, locally quasi-finite, quasi-compact, closed immersions, separated, universally closed, universally specializing and proper; identities of locally Huber-standard spaces are moreover locally of finite presentation, smooth and étale.
- Every open immersion whose source is covered by complete stably sheafy affinoids is adic, locally of weakly, plus weakly and topologically finite type, unramified, locally quasi-finite and separated; open immersions into locally Huber-standard spaces are moreover locally of finite presentation, smooth and étale.
- The empty adic space is locally noetherian, analytic and covered by stably sheafy affinoids.
- A complete strongly noetherian Tate affinoid satisfies all three conditions.
- A nonempty discrete noetherian affinoid is locally noetherian and stably sheafy, but is not analytic.
- A pair map from a discrete ring to a nonzero Tate ring does not induce an adic morphism.
- A map with empty source is closed, proper, quasi-compact, universally closed, universally specializing, separated and locally quasi-finite.
- An open quotient of complete sheafy affinoid rings with stably sheafy coefficient ring and the integral quotient plus ring induces a closed, proper, quasi-compact, universally closed and universally specializing morphism.
- The identity pair map is topologically of finite type, including its plus-ring condition.
- A finite pair homomorphism is topologically of finite type.
- Charts: an affinoid has its identity chart, retaining both its ring and its geometric map.
- Charts: every adic space has an empty affinoid chart.
- Charts: a chart map is injective on points.
- Charts of morphisms: the identity of an affinoid has a chart with equal source and target embeddings and full image.
- Charts of morphisms: a map induced by a pair homomorphism admits a chart with both images equal to the whole affinoids.
- Charts of morphisms: the chart square commutes on every valuation point.
- Centres: the original point is a centre for the identity exactly when the refinement is the original valuation ring.
- Centres: a strictly smaller residue valuation ring does not have the original point as an identity centre.
- Centres: any centre y of a refinement at x satisfies f(x) specializing to y.
- Completed residue fields: the specified ring of definition equals the closure used as the plus ring.
- Completed residue fields: at a nonanalytic point the specified ideal of definition is zero, even when the residue valuation is nontrivial.
- Completed residue fields: at an analytic point the specified ideal is nonzero and proper.
- Completed residue fields: at a nonanalytic point the residue uniformity and its completed field are discrete.
- Completed residue fields: at an analytic point the residue uniformity is the valuation uniformity and its completed field is Tate.
- Completed residue fields: the residue uniformity is separated and its completed field has 0 ≠ 1.
- Completed residue fields: the kernel of the coefficient map to the completed residue field is the support of the valuation.
- Completed residue fields: a coefficient becomes a unit exactly when it lies outside the support.
- For a complete Tate field affinoid, the map to its completed residue field is bijective.
- Section rings: the supplier's additive uniformity induces the original section topology.
- Section rings: subtraction on sections is uniformly continuous for that uniformity.
- Section rings: the section ring on the empty open is a complete singleton.
- Sections over the empty open form the zero ring.
- Global sections of a complete sheafy affinoid recover its coefficient ring.
- Sections on the union of two disjoint opens are the product of their section rings.
- Differential neighbourhoods: for the identity map and equal source and target opens, the neighbourhood ring map is bijective.
- Differential neighbourhoods: if the target neighbourhood ring is a field, its map to a neighbourhood containing x is injective.
- Differential neighbourhoods: shrinking both neighbourhoods commutes with the section homomorphism.
- Restriction of cotangent classes: identity restriction fixes every class in the scalar-extended cotangent module, without a noetherian hypothesis.
- Restriction of cotangent classes: two successive refinements agree with the direct restriction on every class, including classes not assumed to be generated by exact differentials.
- Restriction of cotangent classes: every restriction sends the zero cotangent class to zero.
- The continuous differential stalk of an identity morphism and the comparison map to it are zero.
- An unramified morphism between locally noetherian spaces has zero continuous differential stalks and zero comparison maps.
- Differential neighbourhoods: every point of an adic morphism has an affinoid neighbourhood pair.
- Two such pairs admit a common smaller pair.
- The target open in a neighbourhood pair contains f(x).
- The closed unit disc over K is topologically of finite type with the required plus ring, locally of finite presentation and smooth, but its structure map is neither étale nor unramified.
- In characteristic 2, at a maximal point the disc map T ↦ T² has a bijective Kähler comparison and a free continuous differential stalk of rank one, so vanishing would incorrectly identify a purely inseparable map as unramified.

The chart, centre, empty-section, disjoint-open section, finite-pair, open-quotient and
disc structure-map Checks are `example`s on the declared carriers in
[Suggested.lean](Suggested.lean).

The worked examples of this layer are the checks above. On the ring level: the discrete ring
`ℤ[T₁, T₂, …]`, `ℤ_p⟦T⟧` and `ℂ_p` against the two clauses of noetherian type and the three clauses
of Huber's standing class, with the perfectoid disc `K⟨T^{1/p^∞}⟩` as the non-example; the ring
`ℤ_p ×_{𝔽_p} E` built from eventually constant sequences, of noetherian type but outside Huber's
standing class, whose quotient `Spa ℤ_p` passes Huber's printed étale tests while base change,
openness and the finite-étale comparison fail for it, and the direct product `ℤ_p × E`, which
shows that the witness charts of local finite presentation must lie in the class; `ℤ_p → ℚ_p` adic against `ℤ_p → ℤ_p⟦T⟧` continuous but not adic,
and the same pair read on the analytic loci of the spectra; the blow-up of a unit ideal, of the
`p`-adic Laurent ring and of a non-unit ideal; the completed tensor products of the polydisc, of a
unit, of an algebraic tensor product, of Banach modules and of a non-adic pair with a plus ring that
is not the image; the Banach completed tensor products of null sequences, of `K⟨T⟩`, of a finite
extension and of a non-algebraic module, with the spectral seminorm `< 1` criterion. On
`K`-affinoid algebras: the annulus `K⟨X, Y⟩/(XY − 1)` for Noether normalisation, `(T² − c)` with
residue field `K(√c)`, the dual numbers `K⟨T⟩/(T²)` whose supremum seminorm is not a norm, the Gauss
norm on `K⟨T⟩`, `ℚ_p⟨T⟩/(T² − p)` with `|T|_sup = |p|^{1/2}`, `T^p − T` whose supremum is not attained
at `ℤ_p`-points, `ℤ_p⟨T⟩` as `ℚ_p⟨T⟩°` against `ℤ_p⟨T⟩[S]/(S² − p²T)`. On spaces: the closed unit disc
`D` for the finite-type classes, local noetherianity and the hypersurface presentation; the origin
`V(T)` against `V(T²)` and the non-closed ideal of `C(ℤ_p, ℚ_p)` for closed subspaces; the closed
bidisc as `D ×_K D`, the disc with doubled origin (not quasi-separated) for separatedness and the
disc doubled along `{|ϖ| ≤ |T|}` (quasi-separated) for the valuative criterion; `D` quasi-compact,
separated
and not universally closed against `P¹` proper and the open disc `B` partially proper but not
quasi-compact; the valuation rings `A_a` and `A_∞` at the Gauss point and their centres;
`(ℚ_p, ℤ_p) → (ℚ_p(√p), ℤ_p[√p])` finite against `(K, K⁺) → (K, K°)` and the Tate algebra; the squaring
map `S ↦ T²` as the running finite, quasi-finite, flat, proper morphism whose differentials
`K⟨T⟩/(2T)·dT` locate the unramified locus; the Frobenius `S ↦ T^p` flat and not étale; the Kummer
cover `S ↦ Tⁿ` of the annulus as a standard étale presentation; `K⟨X₁, X₂, …⟩/(X_i)` as the finite
algebra without a Hausdorff natural topology; `K⟨T₁,…,Tₙ⟩` smooth of relative dimension `n` against
the node `T₁T₂ = 0`; the rational embedding `{|T| ≤ |p|}` étale but not `Algebra.Etale`; the torus
`(W(κ)[1/p][T^{±1}], W(κ)[T^{±1}])` of algebraically finite type; and the countable disjoint union of
points, locally quasi-finite but not quasi-finite.

### Dependencies

The Foundations of adic spaces roadmap (AdicSpaces): layer 0 (Huber rings, rings of definition,
quotient maps, 0.4 and 0.6), layer 2 (2.3), layer 3 (3.3 stalks as colimits of rings, 3.4 affinoid
pre-adic spaces `Spa A` for non-sheafy `A`), layer 4 (4.1 completion preserves strong
noetherianness, 4.2) and layer 5 (the category of adic spaces, 5.1 open and closed immersions, 5.2
morphisms locally of finite type, 5.3 gluing, 5.4 the closed and open unit discs, the completed
residue affinoid fields `κ(x)` and `ι_x : Spa κ(x) → X`, the sheafiness predicates
`Huber.IsStablySheafyRing` and `Huber.IsSheafyForEveryPresentation`); internal R0.1a–R0.1b
(*adic-ring*, *adic-completion-noetherian*) and R0.1–R0.3. R0.19's spectral and ordinary-topos
foundations use Mathlib and Tau Ceti; R0.20's tilde-limit criteria use R0.7's fibre products. RigidAnalyticGeometry supplies the theory of classical
`K`-affinoid algebras of R0.9 and PadicFunctionalAnalysis the norm of a Tate ring and bases of
Banach spaces of countable type. Continuous differentials (R0.15) and the lifting definitions
(R0.16) lead to the local structure theory (R0.17), all under Huber's standing class
(*huber-standing-class*, R0.1) in its space-level form (*locally-huber-standard*, R0.6). The theorem *affinoid-fibre-product* assumes sheafiness explicitly; this layer
establishes that hypothesis in the noetherian case. PerfectoidSpaces P2 and P3.17a.3
are downstream applications that establish the hypothesis for perfectoid and sousperfectoid inputs. From Mathlib it uses `MaximalSpectrum`, `IsJacobsonRing`,
`spectralNorm_unique`, `MvPowerSeries.gaussNorm`, `Module.Finite`, `RingHom.Finite`,
`RingHom.FiniteType`, `RingHom.FinitePresentation`, `Algebra.IsIntegral`, `integralClosure`,
`moduleTopology` and `IsModuleTopology`, `UniformSpace.Completion`, `IsAdicComplete`,
`Algebra.TensorProduct`, `KaehlerDifferential` and `Derivation`, `Module.Flat`, `Module.Projective`,
`Algebra.FormallyUnramified`, `Algebra.FormallySmooth`, `Algebra.FormallyEtale`, `Algebra.Etale`,
`Algebra.SubmersivePresentation`, `Algebra.QuasiFinite`, `AlgebraicGeometry.IsSeparated`,
`AlgebraicGeometry.UniversallyClosed`, `AlgebraicGeometry.IsProper`,
`AlgebraicGeometry.LocallyQuasiFinite`, `AlgebraicGeometry.Flat`, `SpecializingMap`,
`SpectralSpace`, `IsSpectralMap`, `compactSpace_withConstructibleTopology`, `ValuationRing`,
`LocalSubring.exists_le_valuationSubring`, `CategoryTheory.Limits.HasPullback`,
`CategoryTheory.IsPullback`, `GradedAlgebra`, `Proj.fromOfGlobalSections`, `NormedSpace`,
`IsUltrametricDist`, `ZeroAtInftyContinuousMap`; from Tau Ceti it uses `TauCeti.Huber.IsHuberRing`,
`TauCeti.Huber.PairOfDefinition` (with `completion` and `weighted`), `TauCeti.Huber.IsTateRing`
(with `isModuleTopology`, `t2Space_moduleTopology`), `TauCeti.Huber.IsPseudoUniformizer`,
`TauCeti.Huber.IsStronglyNoetherian`, `TauCeti.Huber.isNoetherianRing_of_isStronglyNoetherian`,
`TauCeti.Huber.isClosed_of_isNoetherian`, `TauCeti.completeSpace_moduleTopology`,
`TauCeti.Huber.IsTopologicallyFiniteType`, `TauCeti.Huber.IsStrictlyTopologicallyFiniteType`,
`TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `TauCeti.Huber.weightedRestrictedSubring`,
`TauCeti.Huber.powerBoundedSubring`, `TauCeti.Huber.isIntegrallyClosedIn_powerBoundedSubring`,
`TauCeti.Huber.Pair`, `TauCeti.Huber.Pair.Hom`, `TauCeti.Huber.Pair.quotient` and `quotientHom`,
`TauCeti.Huber.IsRingOfIntegralElements`,
`TauCeti.Huber.Pair.isRingOfIntegralElements_integralClosure`, `TauCeti.ValuationSpectrum.spaComap`,
`TauCeti.ValuationSpectrum.spaAnalytic`, `TauCeti.ValuationSpectrum.IsAnalyticPoint`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `TauCeti.IsProConstructible`,
`TauCeti.isProConstructible_iff_isClosed`, `TauCeti.spectralSpace_of_isClopen_generateFrom`,
`TauCeti.IsSpectralMap.continuous_constructibleTopology`, `LinearMap.isStrictMap_of_module_finite`,
`TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`.

## Layer R1: analytification and algebraic correspondences

This layer builds on layer R0. It takes affinoid subdomains of `Max A` for a `K`-affinoid algebra
`A`, the Gerritzen–Grauert theorem, Tate's acyclicity theorem, Tate's rigid-analytic spaces
`Rig_K` and their rigid analytification `X ↦ X^an` from RigidAnalyticGeometry (R1.1). It
constructs Huber's fibre product `X ×_Y S` of a scheme locally
of finite type with an adic space covered by stably sheafy affinoid charts (in particular, a
locally noetherian adic space), specialises it to the adic
analytification functor `X ↦ X^ad = X ×_{Spec K} Spa(K, K°)` over a complete rank-one field `K`
with its universal property, and proves its compatibilities with fibre products, open and closed
immersions, finite and finite locally free morphisms, flatness of `q_X`, analytified modules and
ideal sheaves, continuous differentials, and étale, smooth and unramified morphisms. Local rings at
classical points, constructible sets and connectedness are compared on `X` and `X^ad`;
separatedness, properness, finiteness, closed immersions, étaleness and smoothness of `f` are shown
to be detected on `f^ad`. Huber's functor `r_K` from rigid spaces to adic spaces locally of finite
type over `Spa(K, K°)`, supplied with its full faithfulness, essential image and equivalence on
quasi-separated objects by RigidAnalyticGeometry, is given its universal property, equivalence of
ringed topoi, the comparison `r_K(X^an) ≅ X^ad`, and the
agreement of the rigid and adic notions of separated, partially proper, proper, étale, unramified
and smooth morphisms. Group schemes, finite locally free group schemes, abelian varieties and
isogenies are analytified to analytic groups with their quotients and invariant differentials. The
layer closes with the ring-level and point-level lemmas (weight families from open ideals, valuation
extension in the divisible hull, fibre products of locally ringed spaces, flatness of restricted
power series over polynomials, and topological finite type of affinoid opens over a noetherian-type
base) that the comparisons use; the dimension of affinoid domains, the identity principle, standard
rational refinements, Conrad's `Γ`–`Spec` lemma, constructible density of classical points, and
connectedness, reducedness and normality of the rigid analytification are RigidAnalyticGeometry's.

### R1.1 affinoid subdomains and rigid-analytic spaces

**The plus ring of a `K`-affinoid algebra is its power-bounded subring.**
(*tft-plus-ring-power-bounded*) Let `K` be a complete rank-one nonarchimedean field and `A` a Tate
ring topologically of finite type over `K` (a `K`-affinoid algebra: a quotient of some
`K⟨T₁,…,Tₙ⟩` by a continuous open surjection, Wedhorn Definition 5.57). Among the rings of integral
elements `A⁺` of `A` containing the image of `K°`, exactly one makes the morphism of affinoid rings
`(K, K°) → (A, A⁺)` topologically of finite type, namely `A⁺ = A°` (Huber94 §4, Lem. 4.4, p. 543;
Wedhorn §7.7, Def. 7.56, p. 71, where the conclusion `A⁺ = A°` is built into the definition of a
tft affinoid algebra). The description of `A°` as the integral closure of `g(K°⟨T₁,…,Tₙ⟩)` for a
continuous open surjection `g : K⟨T₁,…,Tₙ⟩ → A` is *affinoid-power-bounded-integral*
(RigidAnalyticGeometry §2.3) and
is used here, not restated. The pair `(A, A°)` is Tau Ceti's `Huber.Pair.powerBounded A`, the pair
with the largest ring of integral elements, which the Foundations of adic spaces roadmap, layer 2.4,
attaches to every Huber ring; the content of this target is that no smaller `A⁺` makes the
structure morphism topologically of finite type. The ring-level assertion
`Huber.Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType`
quantifies over continuous open quotient ring presentations; the equality `A⁺ = A°` does not
depend on the choice of the resulting `K`-algebra structure. For `A = K⟨T⟩` one gets `A° = K°⟨T⟩`, the plus
ring of the closed polydisc of the Foundations of adic spaces roadmap (Tau Ceti
`TauCeti.ValuationSpectrum.closedPolydisc`). *Needs:* *affinoid-power-bounded-integral*
(RigidAnalyticGeometry §2.3);
Tau Ceti `TauCeti.Huber.Pair.powerBounded`, `TauCeti.Huber.powerBoundedSubring`,
`TauCeti.Huber.IsTopologicallyFiniteType`.
Lean: `Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType`.

**Affinoid subdomains of the maximal spectrum of a `K`-affinoid algebra.** (*affinoid-subdomain*) A
subset `U ⊆ Max A` of a `K`-affinoid algebra is an affinoid subdomain when a homomorphism of
`K`-affinoid algebras `A → A_U` with `Max A_U` landing in `U` is universal for this property; the
coordinate ring `A_U` is unique up to unique isomorphism, `Max A_U → U` is a bijection, affinoid
subdomains are stable under transitivity, preimages and finite intersections, with the affinoid
tensor products as coordinate rings, and for `f₁,…,f_m, g` generating the unit ideal the rational
subdomain `X(f/g) = {x : |f_j(x)| ≤ |g(x)| for all j}` is an affinoid subdomain with coordinate ring
`A⟨f/g⟩ = A⟨T⟩/(gT_j − f_j)`, Tau Ceti's completed rational localisation. Supplied by
RigidAnalyticGeometry §1.4 and Layers 3–4. The supplier's carrier is `IsAffinoidAlgebra K A`
and its affinoid subdomain bundles the representing algebra as data; this roadmap applies it through
the carrier bridge of R0.9.

**Coordinate rings of affinoid subdomains are flat.** (*affinoid-subdomain-flat*) For an affinoid
subdomain `U ⊆ Max A` the restriction `A → A_U` is flat, and for a finite covering of `Max A` by
affinoid subdomains `A → ∏_i A_{U_i}` is faithfully flat. Supplied by RigidAnalyticGeometry Layers 3–4. The supplier's carrier
is `IsAffinoidAlgebra K A`; this roadmap applies it through the carrier bridge of R0.9.

**The Gerritzen–Grauert theorem.** (*gerritzen-grauert*) For an affinoid subdomain `U ⊆ Max A` there
is a finite covering of `Max A` by rational subdomains `V_i` with each `U ∩ V_i` a rational
subdomain of `V_i`; in particular `U` is a finite union of rational subdomains. Supplied by
RigidAnalyticGeometry Layers 3–4. The ambient-cover refinement is applied on the supplier’s carrier
`IsAffinoidAlgebra K A` through the carrier bridge of R0.9, reading `{V_i}` as a rational covering
of `Spa(A, A°)` by RigidAnalyticGeometry §8.2.

**Tate's acyclicity theorem for finite coverings by affinoid subdomains.**
(*affinoid-covering-tate-acyclicity*) For a finite covering of `Max A` by affinoid subdomains `U_i`
and any `A`-module `M`, the augmented Čech complex
`0 → M → ∏_i M ⊗_A A_{U_i} → ∏_{i<j} M ⊗_A A_{U_i ∩ U_j} → ⋯` is exact; in particular `U ↦ A_U` is a
sheaf for finite affinoid coverings, with vanishing higher Čech cohomology. Supplied by
RigidAnalyticGeometry Layer 5. The supplier's carrier is `IsAffinoidAlgebra K A` and its Čech
complex is Mathlib's `cechComplexFunctor`; this roadmap applies it through the carrier bridge of
R0.9.

**Local rings of affinoid spaces at points are noetherian with the algebraic completion.**
(*rigid-local-ring-completion*) For `x ∈ Max A` with maximal ideal `m`, the stalk
`O_x = colim_{U ∋ x} A_U` over the affinoid subdomains containing `x` is a noetherian local ring
with maximal ideal `m·O_x`, and `A_m → O_x` is injective and induces an isomorphism of `m`-adic
completions. Supplied by RigidAnalyticGeometry Layers 3–4. The supplier's carrier is `IsAffinoidAlgebra K A`;
this roadmap applies it through the carrier bridge of R0.9.

The bridge `RigidSpace.stalk_completion_equiv` is RigidAnalyticGeometry Layers 3–4:
for a `K`-affinoid `A` and `x ∈ Max A`, completion of the rigid local ring at its maximal
ideal is canonically the completion of `A_x`, compatibly with the maps from `A`.

**Rigid-analytic spaces over `K` in the sense of Tate.** (*rigid-analytic-space*) Affinoid spaces
`Sp(A) = Max A` with the strong G-topology and Tate's structure sheaf, and rigid-analytic spaces
over `K` (locally G-ringed `K`-spaces satisfying `(G0)`–`(G2)` with an admissible covering by
affinoid spaces) form a category `Rig_K` with open subspaces, gluing along admissible opens and
fibre products. Supplied by RigidAnalyticGeometry §§6.1–6.2. The supplier builds its
affinoid spaces on `IsAffinoidAlgebra K A`; this roadmap reaches them from its affinoid carrier
through the carrier bridge of R0.9, and writes `RigidSpace K` (`Rig_K`), `RigidSpace.Sp`,
`RigidSpace.IsAdmissibleOpen`, `RigidSpace.IsAdmissibleCover` and `RigidSpace.hasPullbacks` for
these objects and `RigidSpace.IsClosedImmersion`, `RigidSpace.IsSeparated`,
`RigidSpace.IsQuasiSeparated` and `RigidSpace.IsProper` (Kiehl-proper) for the morphism classes of
RigidAnalyticGeometry §6.3 and Layers 3–4, which R1 uses.

`RigidSpace.Sp_toLocallyGRingedSpace`, `RigidSpace.Sp.sectionsEquiv` and
`RigidSpace.Sp.map_sections` are carrier bridges to RigidAnalyticGeometry §6.2 and Layers 3–4:
for a `K`-affinoid `A`, `Sp A` has the supplied locally G-ringed carrier, its global
sections are canonically `A`, and for an affinoid algebra homomorphism `φ : A → B`,
pullback of global sections along `Sp B → Sp A` is exactly `φ`. These are supplied
constructions, not independent local targets.

**Rigid analytification `X ↦ X^an` of schemes locally of finite type over `K`.**
(*rigid-analytification*) A `K`-scheme `X` locally of finite type has a rigid analytification
`i_X : X^an → X`, final among rigid spaces over `K` with a morphism to `X` and functorial in `X`; it
is a bijection onto the closed points of `X` with the same residue fields, it is compatible with
open and closed immersions and fibre products, and `O_{X,i_X(x)} → O_{X^an,x}` induces an
isomorphism of completions. Supplied by RigidAnalyticGeometry §8.1. The supplier takes Mathlib's schemes locally
of finite type over `Spec K`, the objects of `RigidSpace.KScheme K` below, and its rigid varieties,
which this roadmap writes `RigidSpace K` (*rigid-analytic-space*); `RigidSpace.analytification`
(`X^an`, with `i_X` its `toScheme`) and `RigidSpace.analytificationFunctor` are this roadmap's names
for the supplied analytification.

`RigidSpace.KScheme K` abbreviates `AdicSpace.SchemeOver (AdicSpace.fieldAffinoid K)`,
the full subcategory of Mathlib schemes over `Spec K` whose structure map is locally of finite
type. Both analytification functors use this same category, including its morphisms. The formal
field parameters include the compatible `TauCeti.Huber.IsHuberRing K` structure.
`RigidSpace.KScheme.hasPullbacks` states that this category has pullbacks over the same complete nonarchimedean field K: locally of finite type
morphisms are stable under base change ([Stacks Tag 01T4](https://stacks.math.columbia.edu/tag/01T4)).
The shared constructor `AdicSpace.analytification.affineScheme K R` uses `Spec` of a
finitely generated `K`-algebra `R` (Conrad-IC, Appendix A.1, Lemma A.1.1, p. 31).

**Checks for the common scheme category.** `KScheme_carrier` is definitional equality
with `AdicSpace.SchemeOver (AdicSpace.fieldAffinoid K)`. The shared affine constructor
has an isomorphic structure map for `K` (`KScheme_field`), empty spectrum for the zero
algebra (`KScheme_empty`), and a non-isomorphic structure map for `K[T]`
(`KScheme_line`).

### R1.2 Huber's fibre product of a scheme and an adic space

**The affine chart of `X ×_Y S`: the increasing union of the affinoids `Spa(A_k, A_k⁺)` and its
universal property on affinoid test objects.** (*affine-chart-analytification*) Let `λ : B → A` be
a ring homomorphism, where `(A, A⁺)` is a complete Huber pair such that `A` has a noetherian ring of
definition or is a strongly noetherian Tate ring (Huber's hypotheses of Proposition 3.8 at an
affinoid chart), and let `C = B[T₁,…,Tₙ]/I` be a finitely generated `B`-algebra. Choose a finite
set `E` of topologically nilpotent elements of `A` with `E·A` open, and put
`E(k) = {e₁⋯e_k : eᵢ ∈ E}` for `k ≥ 0` (so `E(0) = {1}`, the unit-polydisc chart, as in the formal
`chartSeries A n k E hE` with weight `E ^ k`). Let `A(k) = A⟨T₁,…,Tₙ⟩_{E(k),…,E(k)}` be Huber's
restricted power-series ring with weights `E(k)` (the separated completion of the weighted
restricted series
ring, with plus ring the integral closure of the series whose `ν`-th coefficient lies in
the additive subgroup generated by `E(k)^{|ν|}·A⁺`), let `λ_k : B[T] → A(k)` extend `λ` by `Tᵢ ↦ Tᵢ`, let `A_k = A(k)/λ_k(I)·A(k)`
with the quotient topology, `A_k⁺` the integral closure in `A_k` of the image of `A(k)⁺`, and
`R_k = Spa(A_k, A_k⁺)`. Prove: (i) `A_k` is complete Hausdorff and satisfies
`Huber.IsNoetherianType A_k`, hence `TauCeti.Huber.IsStablySheafyRing A_k` by
*noetherian-type-stably-sheafy*, and `R_k` is an affinoid adic space; (ii) for
`k ≤ h` the continuous `A`-algebra map `A_h → A_k` with `Tᵢ ↦ Tᵢ` induces an isomorphism of `R_k`
onto the rational subset `{x ∈ R_h : |e·Tᵢ|_x ≤ 1 for all e ∈ E(k), i = 1,…,n}` of `R_h`; (iii) the
adic space `R = ⋃_k R_k` (increasing union along (ii)), with `p : R → Spa(A, A⁺)` and the morphism
of locally ringed spaces `q : R_ → Spec C` induced by the ring maps `C → A_k`, satisfies: for every
complete affinoid adic space `U = Spa(D, D⁺)` over `Spa(A, A⁺)` (structure map given by
`μ : A → D`), the map `w ↦ q ∘ w_` is a bijection from `Hom_{Spa(A,A⁺)}(U, R)` to the set of
`B`-algebra homomorphisms `C → D` (`B` acting on `D` through `μ ∘ λ`), equivalently to
`Hom_{LRS/Spec B}(U_, Spec C)`. For a Tate ring `A` with pseudo-uniformizer `ϖ` one may take
`E = {ϖ}`, so `A(k) = A⟨ϖ^k T₁,…,ϖ^k Tₙ⟩` (the relative closed polydisc of radius `|ϖ|^{-k}`). The
result does not depend on `E`, by the universal property; the test objects in (iii) are affinoid
adic spaces `Spa(D, D⁺)` with `D` complete, the general test object being handled in
*scheme-fibre-product-analytification* by gluing (Huber94 §3, proof of Prop. 3.8, p. 537, the chart
rings `A_k` — noetherian ring of definition or strongly noetherian Tate, plus ring the integral
closure of the image of `A(k)⁺` — and `R` as the inductive limit of the `R_k` along the rational
embeddings `φ_kh`, which for `k ≤ h` is an isomorphism of `R_k` onto
`{x ∈ R_h | v_x(eπ_h(X_i)) ≤ 1 for every e ∈ E(k)}`; Hübner §10, proof of Prop. 10.2, p. 46, the
key step of the universal property in the Tate case `E = {ϖ}`; Wedhorn §8.7, proof of Prop. and
Def. 8.61, p. 91, sheafiness of the chart rings in the stably sheafy version of the same
construction). For `A = K` a complete rank-one field, `E = {ϖ}`, `B = K`, `C = K[T]`:
`A_k = K⟨ϖ^k T⟩`, `A_k⁺ = K°⟨ϖ^k T⟩`, `R_k` is the closed disc of radius `|ϖ|^{-k}`, and
`R_k ⊆ R_{k+1}` is the rational subset `{|ϖ^k T| ≤ 1}` (Hübner Example 4.3); for `D = K` and
`φ(T) = ϖ^{-3}`, the map `Spa(K, K°) → R` factors through `R_3` but not through `R_2`. *Needs:*
*locally-noetherian-adic-space*, *topologically-finite-type-noetherian-type*,
*noetherian-type-ideals-closed*, *noetherian-type-stably-sheafy* (all layer R0);
*open-ideal-weight-family*; Tau Ceti `TauCeti.Huber.weightedRestrictedSubring`,
`TauCeti.Huber.IsWeightFamily`, `TauCeti.Huber.IsWeightFamily.of_exists_isUnit`,
`TauCeti.Huber.IsTopologicallyFiniteType`,
`TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`,
`TauCeti.ValuationSpectrum.rationalSubset`,
`TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`,
`TauCeti.Huber.Pair`, `TauCeti.Huber.IsStronglyNoetherian`; Mathlib
`AlgebraicGeometry.ΓSpec.locallyRingedSpaceAdjunction`.
Lean: README target.

The ring constructions `chartSeries`, `ofPolynomial`, `baseMap` and `chartRing` are defined
for any nonarchimedean commutative topological ring `A` and any supplied weight family;
completeness and Huber's noetherian hypotheses enter the geometric assertions above.

**Checks.** The chart constructions `chartSeries`, `chartSeries.ofPolynomial`,
`chartSeries.baseMap`, `chartRing` and `analytification.affineChart_ring` use the following
computations, with suggested names for the Checks.

- With no variables, a chart over a complete Hausdorff
  ring `A` is `A`, for every index and weight family.
- For `A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control*, take `B = C = A`,
  `λ = id`, no variables, `I = 0` and weight set `{p}`. Here `pA = pℤ_p` is open,
  and at every index `(A_k, A_k⁺) = (A, A)`. The chart is complete and of noetherian
  type, but fails `Huber.IsHuberStandard`: the infinitely many orthogonal idempotents
  make `A` nonnoetherian, and `A` is neither discrete nor Tate. The construction
  preserves this standing-class failure.
- Index `0` has weight `{1}` and gives the ordinary
  completed Tate algebra in `n` variables.
- For `K` and a pseudo-uniformizer `ϖ`, the isomorphism
  `K⟨ϖ^k T⟩ ≅ K⟨S⟩` sends `ϖ^k T` to `S`, fixing the inverse-radius convention.
- The polynomial map sends
  `a` to the completed constant series and `a + T_i` to that constant plus the completed
  variable. Together with `chartSeries_test_scaled_coordinate` these test its generators.
- `λ_k(b) = λ(b)`, `λ_k(T_i) = T_i`, and the identity base map gives the polynomial map.
- The unit
  ideal gives the zero ring, the zero ideal gives the chart series ring, and the image of a
  defining polynomial `f` is zero in `chartRing lam n k E hE (Ideal.span {f})`, under the
  canonical quotient map applied to `chartSeries.baseMap lam n k E hE f`.
- `affineChart_test_unit_ideal`, `affineChart_test_zero_variables`, `affineChart_test_dual_numbers`
  — the absolute charts of the empty scheme, `Spec K` and `Spec K[T]/(T²)` are respectively
  `0`, `K` and `K[ε]/(ε²)`, at every index.
- `E^0 = {1}`, even for `E = ∅`,
  and the zero tuple lies in every chart.
- Over a complete nontrivially normed ultrametric field
  `K` with compatible nonarchimedean and Huber ring structures, take `0 < |ϖ| < 1`,
  `E = {ϖ}`, `Q = Pair.powerBounded K` and `μ = id`. The nonzero one-coordinate tuple
  `x = (ϖ⁻¹)` satisfies the plus-ring condition of the chart-index statement of this target
  exactly when `1 ≤ k`: at index `1`, `ϖx = 1 ∈ K°`; at index `0`,
  `|x| = |ϖ|⁻¹ > 1`, so `x ∉ K°` (Huber94, proof of Proposition 3.8, p. 537).
- The two successive points `ϖ⁻²` and `ϖ⁻³`
  over a complete nontrivially normed ultrametric field `K`, with compatible Huber and
  nonarchimedean ring structures and `0 < |ϖ| < 1`, admit evaluation morphisms of Huber
  pairs from `chartPair (Pair.powerBounded K) (RingHom.id K) 1 m {ϖ} hE ⊥` for `m = 2, 3`,
  respectively, and no such morphism from chart `m - 1`. The composite with the polynomial
  inclusion is evaluation at `T = ϖ⁻ᵐ`, fixing all constants. The same Check tests the
  plus-ring condition of the chart-index statement with `D = K`, `μ = id`
  and that one-coordinate tuple: every `e ∈ {ϖ}^m` gives `eϖ⁻ᵐ ∈ K°`, whereas the
  condition fails at `m - 1`. The scaled values are `1` and `ϖ⁻¹`, respectively, with
  norms `1` and `|ϖ|⁻¹ > 1` (Huber94, proof of Proposition 3.8, p. 537).

`Huber.chartIntegralSeries` is the subring given by this coefficient condition, expressed
with the pinned `weightMul`; `chartSeriesPair` takes the integral closure of its image in
`chartSeries`. These definitions assume a complete Hausdorff Huber ring `A`, its compatible additive
uniformity and nonarchimedean ring topology, a Huber pair `P`, and the finite weight family.
Boundedness of `A°` is not assumed. Prove that the coefficient subring is open and
consists of power-bounded elements, and that its integral closure is a ring of integral
elements in this generality
(Huber94 §3, definition before Lemma 3.5, p. 534).
`chartPair P λ n k E hE I` applies `TauCeti.Huber.Pair.quotient` to this pair and the ideal
`I.map (chartSeries.baseMap λ n k E hE)`. Thus its plus ring is exactly the integral closure
of the image, including all nilpotent elements (Huber94 §3, p. 534, definition before
Lemma 3.5; Proposition 3.8, proof p. 537). The coefficient and quotient constructions do not
require the noetherian hypothesis. Under (i) the quotient itself is complete Hausdorff;
over a merely stably sheafy base its separated completion supplies the complete affinoid
carrier in *scheme-fibre-product-analytification*.

`Huber.chartTransition` is a morphism of these specified Huber pairs for `k ≤ h`, assuming
each element of `E` is topologically nilpotent. `chartTransition_polynomial` fixes every
polynomial in the unnormalised variables, including base coefficients;
`chartTransition_comp` gives restriction from index `j` to `h` to `k` as restriction from
`j` to `k`. The pair morphism includes continuity and preservation of the specified plus rings.

The zero-variable identity mixed chart over `A = ℚ_p[ε]/(ε²)` with
`P = (A, ℤ_p + ℚ_p ε)`, `λ = id` and relation ideal zero recovers `(A,P.plus)` at every
index. In particular `ε ≠ 0` survives. This base is strongly noetherian and stably sheafy,
but not uniform: all `cε` are power-bounded and their set is unbounded.

**Checks for the integral series.** `relativeIntegralSeries_test_zeroVariables` reduces the
coefficient condition to membership in `A⁺`. `relativeIntegralSeries_test_scaled` puts
`ϖ^k T` both in the coefficient subring and in the chart plus ring;
`relativeIntegralSeries_test_unscaled` excludes `T` from both for the radius `|ϖ|⁻¹ > 1`.
`relativeSeriesPair_test_field` identifies the zero-variable series pair with `(K,K°)`.
Together the field, scaled-coordinate and unscaled-coordinate Checks discriminate the
series pair itself, before taking a quotient.

**Checks for plus rings, transitions and gluing.** `relativePlus_test_field` gives `A_k⁺ = K°`
when there are no variables and no relation; `relativePlus_test_empty` gives the zero plus ring
for the unit ideal; `relativePlus_test_nilpotent` gives `K° + Kε` in `K[ε]/(ε²)`, since every
multiple of `ε` is integral. `relativeTransition_test_identity` gives the identity for equal
indices; `relativeTransition_test_zeroVariables` gives `K → K` at all indices;
`relativeTransition_test_scaled` sends the normalised variable `S_h = ϖ^h T` to
`ϖ^(h-k) S_k` for `k ≤ h`, although the unnormalised `T` is unchanged. Its two-term
computation is `a+bS_h ↦ a+bϖ^(h-k)S_k`, for arbitrary `a,b ∈ K`. It also constructs
`f = ∑_{m≥0}(ϖ^(h+1)T)^m` in the larger chart, proves that it is not a polynomial,
and computes its restriction as the sum of the same series in the smaller chart.
Thus the Check tests completion and restriction beyond polynomial identities
(Conrad-AWS, Example 2.4.3, pp. 19–20; Wedhorn, Proposition 8.61, p. 91).
All six plus-ring and transition Checks are examples on `chartPair` and `chartTransition`.
`relativeGlue_test_empty`, `relativeGlue_test_point` and `relativeGlue_test_line` give,
respectively, the empty space, `Spa K`, and the non-quasi-compact union of the expanding discs.

**Huber's fibre product `X ×_Y S` of a scheme locally of finite type with an adic space over a
scheme.** (*scheme-fibre-product-analytification*) Let `f : X → Y` be a morphism of schemes locally
of finite type, `S` an adic space covered by open affinoid charts `Spa(A, A⁺)` with `A` complete
and stably sheafy (`HasStablySheafyCharts S`; Wedhorn §8.7, Proposition and Definition 8.61,
p. 91). This includes the locally noetherian case: every point has such a chart with `A` of
noetherian type (*locally-noetherian-adic-space*), in particular Huber's case, where `A` is
finite type over a noetherian ring of definition, strongly noetherian Tate, or discrete
(*huber-standing-class*); `IsLocallyNoetherian.isStablySheafy` supplies the required
chart hypothesis. Let `g : S_ → Y` be a morphism of
locally ringed spaces, where `S_ = (|S|, O_S)` is the underlying locally ringed space of `S`
(forgetting the topology of `O_S` and the valuations; no topology on `O_Y` enters). Then there are
an adic space `R = X ×_Y S`, a morphism of adic spaces `p : R → S` and a morphism of locally ringed
spaces `q : R_ → X` with `g ∘ p_ = f ∘ q`, such that for every adic space `U`, every morphism of
adic spaces `u : U → S` and every morphism of locally ringed spaces `v : U_ → X` with
`g ∘ u_ = f ∘ v` there is a unique morphism of adic spaces `w : U → R` with `p ∘ w = u` and
`q ∘ w_ = v`. The morphism `p` is locally of finite type (*finite-type-morphism-classes*) and `R`
has stably sheafy charts; it also satisfies Huber's noetherian-type condition when `S` does.
Over an affine open `Spec B ⊆ Y`, an affine open
`Spec C ⊆ f⁻¹(Spec B)` with `C = B[T₁,…,Tₙ]/I` and an open affinoid `Spa(A, A⁺) ⊆ g⁻¹(Spec B)`,
the open subspace `p⁻¹(Spa(A,A⁺)) ∩ q⁻¹(Spec C)` of `R` is the increasing union
of the completed quotient charts below; when `A` is of noetherian type these are
`⋃_k Spa(A_k, A_k⁺)` of *affine-chart-analytification*. A `Y`-morphism `h : X₁ → X₂` of
`Y`-schemes locally of finite type induces `h_S : X₁ ×_Y S → X₂ ×_Y S`; this is functorial, and the
triple `(R, p, q)` is unique up to unique isomorphism, so the construction is independent of the
charts, presentations and sets `E` chosen (Huber94 §3, Prop. 3.8, p. 536, the hypotheses, the
universal property, `p` locally of finite type, and the name and notation of the construction;
Huber96 §1.2, (1.2.7), p. 50, where the book restates the construction and imports it from
Huber94 §3.8; Hübner §10, Prop. 10.2, p. 44, the restatement for stable adic spaces with the chart
proof). In `AdicSpace`, `schemePullback f S hS g` constructs a `SchemePullback f S g`
when `f` is locally of finite type and `hS : HasStablySheafyCharts S`. Its fields
`SchemePullback.space`, `.fst`, `.snd` and `.condition` give `R`, `p`, `q` and the commuting
square. The field `SchemePullback.universal` states existence and uniqueness of `w` together
with both projection equations; these are the lifting and extensionality API.
`SchemePullback.existsUnique_iso` identifies any two such representing objects, respecting
both projections.
Lean: the mixed fibre product is a README target; `Affinoid.ofSheafyCompletion` packages
the sheafy quotient's separated completion on the shared `Affinoid` carrier.

Define `schemePullback.map P Q h hh` for any two representing objects over the same `S → Y`
and a scheme morphism `h` with `hh : h ≫ f₂ = f₁`. The theorem
`schemePullback.map_projections` fixes its composites with both projections;
`schemePullback.map_id` and `schemePullback.map_comp` give the identity and composition laws
(Wedhorn §8.7, Remark 8.62, p. 92). These statements use the universal fields of `P` and `Q`,
so no further existence hypotheses are needed. Prove
`schemePullback.locallyOfFiniteType_fst` for the object constructed over a stably sheafy base,
and `schemePullback.isLocallyNoetherian` when the base also satisfies `IsLocallyNoetherian`.

The comparison theorems below use Huber94 §3, Proposition 3.8, pp. 536–537 and its universal
property. `schemePullback.isoOpenSubscheme` takes a scheme open immersion `i : X' → X` and
an adic open immersion `j : V → P.space` whose image is `q⁻¹(image i)`; it gives the unique
isomorphism `X' ×_Y S ≅ V` whose composite with `j` is the induced map.
`schemePullback.trans` takes representing objects for `X ×_Y S`, `X' ×_Y S` and
`X ×_{X'} (X' ×_Y S)` and gives their unique comparison isomorphism, fixing the map to
`X' ×_Y S` and the scheme projection to `X`. When `X` and `X'` are locally of finite
type over `Y`, these objects are constructed by `schemePullback`.
`schemePullback.baseChangeIso` takes `u : S' → S`, the two mixed representing objects and
any adic pullback square for `p` and `u`. It gives the unique isomorphism
`(X ×_Y S) ×_S S' ≅ X ×_Y S'` fixing the projection to `S'` and the scheme projection to `X`.
The existence hypotheses are stable sheafy charts on the bases and local finite type of `f`;
the adic pullback exists by *fibre-products-existence* since `p` is locally of finite type.

For a complete Hausdorff affinoid base `A` with
`hStable : TauCeti.Huber.IsStablySheafyRing A.ring`, form the quotient Huber pair
`Q_k = Huber.chartPair A.pair λ n k E hE I` on `chartRing λ n k E hE I` with its
quotient topology, without assuming that the relation ideal is closed. Give this ring
the additive uniformity of its topological additive group. Its separated completion
has plus ring `TauCeti.ValuationSpectrum.completionPlus Q_k.plus`, the closure of the
image of `Q_k.plus`; completion preserves its property of being a ring of integral
elements. The quotient image of `(A.basis.weighted hE).completion` supplies a pair of
definition before completing it once more. Its completed defining subring is the
closure of that image, and its defining ideal is generated by the image of the quotient
defining ideal (Wedhorn, Remarks 6.7–6.8, p. 48, Lemma 7.47 and Proposition 7.48,
pp. 68–69).

The composite coefficient map from `A.ring` to this separated completion is
topologically of finite type: it is presented by the completed weighted series ring
modulo the closure of the relation ideal. Stable sheafiness of `A.ring` therefore
gives sheafiness of the completion. It also gives stable sheafiness of the completion,
by transitivity of topological finite type (Wedhorn, Proposition 6.33, pp. 53–54,
Definition 8.26, p. 81, and proof of Proposition and Definition 8.61, p. 91).
`schemePullback.completedChartAffinoid A hStable λ n k E hE I` applies
`Affinoid.ofSheafyCompletion` to this quotient pair and its quotient pair of definition;
sheafiness of the quotient ring follows from sheafiness of its completion by Tau Ceti
`TauCeti.Huber.isSheafyRing_completion_iff`. The adapter takes a Huber pair `Q : Pair R`,
a pair of definition `P` with `P.ringOfDefinition ≤ Q.plus`, and
`hR : TauCeti.Huber.IsSheafyRing R`; its carrier is exactly `UniformSpace.Completion R`,
its pair has plus ring `completionPlus Q.plus`, and its basis is `P.completion`.
The coefficient and polynomial maps are the original quotient maps followed by the
completion map.

`schemePullback.chartAffinoid A hA λ n k E hE I` packages the complete quotient ring
`chartRing λ n k E hE I` with exactly `Huber.chartPair A.pair λ n k E hE I` as its pair.
Its pair of definition starts with `(A.basis.weighted hE).completion`: the defining
subring is its image under the quotient map, and the defining ideal is the ideal
generated by the image of its ideal of definition inside that image subring.
These are the completion and quotient constructions of Wedhorn, Remarks 6.7–6.8,
p. 48, applied to Proposition 6.21, pp. 50–51.
Here `hA : Huber.IsNoetherianType A.ring`, and `hE` asserts the weight-family condition at
index `k`. Under `hA` the relation ideal is closed and the quotient is complete
Hausdorff; the canonical completion isomorphism identifies `completedChartAffinoid`
with `chartAffinoid`, including its plus ring. `schemePullback.affineChart` uses
`completedChartAffinoid` under `hStable` and takes open immersions `Spa A → S`, `Spec B → Y`
and `Spec(B[T]/I) → X`, with their two commuting base squares and topologically nilpotent
`E` satisfying the weight-family condition at every index. It identifies
`p⁻¹(Spa A) ∩ q⁻¹(Spec(B[T]/I))` with the union of open images of these affinoids.
The statement fixes the coefficient and polynomial maps and both projection equations;
for `k ≤ h`, extend `Huber.chartTransition … k h …` to the separated completions;
composition with its `Affinoid.map` identifies the `k`th embedding with its embedding
through the `h`th chart. These extended transitions preserve the completed plus rings
and satisfy the same polynomial and composition equations. The transition image is
exactly `{x : |e Tᵢ(x)| ≤ 1 for e ∈ E(k), i ∈ Fin n}`, so the union is increasing.
The completion comparison commutes with both coefficient and polynomial maps, every
transition and both projections, and hence with the mixed universal maps. Completion
invariance identifies its spectrum with `Spa(Q_k)` (Tau Ceti
`TauCeti.ValuationSpectrum.spaCompletionHomeomorph`); the structure-presheaf comparison
supplies the same identification as adic spaces. This is the stable-base construction
of Wedhorn, Proposition and Definition 8.61, pp. 91–92, and its noetherian-type
specialization is Huber94 §3, proof of Proposition 3.8, p. 537.
*Needs:* *affine-chart-analytification*;
*locally-noetherian-adic-space*, *finite-type-morphism-classes*,
*completed-tensor-noetherian-stability*, *fibre-products-existence* (all layer R0); Mathlib
`AlgebraicGeometry.Scheme`, `AlgebraicGeometry.LocallyOfFiniteType`,
`AlgebraicGeometry.LocallyRingedSpace`, `AlgebraicGeometry.Scheme.forgetToLocallyRingedSpace`,
`AlgebraicGeometry.ΓSpec.locallyRingedSpaceAdjunction`.

**Checks for the completed quotient charts.**

- With no variables and zero relation ideal, `completedChartAffinoid` is the base
  affinoid at every index via the canonical completion comparison, fixing the coefficient
  map and plus ring. This includes the non-Huber-standard base in the preceding Check.
- The unit relation ideal gives the zero ring and zero plus ring after completion,
  with empty adic spectrum and the unique coefficient, projection and transition maps.
- Over a base of noetherian type, the comparison with `chartAffinoid` fixes every
  polynomial coefficient and coordinate and intertwines all transitions and universal
  maps. For `A = K`, `I = 0`, `n = 1` and `E = {ϖ}`, it identifies the same discs of
  radius `|ϖ|⁻ᵏ`, with `ϖ^h T ↦ ϖ^(h-k)(ϖ^k T)` for `k ≤ h`.
- If the relation ideal `J_k` in the completed series ring is not closed, the map
  from its ordinary quotient to the complete chart has kernel `closure(J_k)/J_k`.
  Thus the completed carrier kills this kernel; stable sheafiness alone supplies no
  identification with the ordinary quotient as a Hausdorff ring.

**Checks.**

- *Computation.* For `Y = Spec K`, `X = Spec K[T]` and
  `S = Spa(K, K°)`, morphisms `Spa(D, D⁺) → X ×_Y S` over `S` correspond to elements of `D` (not of
  `D⁺`): the element `ϖ^{-1} ∈ K` gives a `K`-point lying in the chart `R_1` but not in `R_0`.
- *Degenerate.* For `X = Y` and `f = id`, `p : X ×_Y S → S` is an
  isomorphism and `q = g ∘ p_`.
- *Degenerate.* For `X = ∅` the adic space `X ×_Y S` is empty.
- *Non-example.* For `X = Spec K[T]` over `Y = Spec K`, the
  single affinoid `Spa(K⟨T⟩, K°⟨T⟩)` with its evident maps does not satisfy the universal property:
  the morphism `Spa(K,K°)_ → Spec K[T]` given by `T ↦ ϖ^{-1}` does not factor through it. Hence a
  definition taking only the unit-polydisc chart is wrong.
- *Compatibility.* For `C` finite over `B` and `S = Spa(A, A⁺)` with `A` complete and of
  noetherian type (*noetherian-type-huber-ring*), `Spec C ×_{Spec B} S` is the affinoid
  `Spa(C ⊗_B A, integral closure of the image of A⁺)` with the finite-module topology, as
  constructed in *finite-algebra-over-affinoid* (layer R0); its clause (vi) makes this an adic space
  finite over `S`. Noetherian type is the hypothesis under which that construction supplies both
  the complete pair and its adic spectrum.

**Checks for `schemePullback.chartAffinoid`.**
`schemePullback.chartAffinoid_basis_image` fixes the quotient image of the completed
weighted defining subring; `schemePullback.chartAffinoid_basis_ideal` fixes the
mapped ideal in that subring. `schemePullback.chartAffinoid_basis_empty` gives the
zero defining ideal when the relation ideal is the unit ideal.
`schemePullback.chartAffinoid_empty` gives an empty adic spectrum for the unit relation ideal;
`schemePullback.chartAffinoid_zeroVariables` identifies the zero-variable, zero-ideal chart
with `Spa A` at every index. `schemePullback.chartAffinoid_unboundedCoordinate` uses a
nonzero base `A` with pseudo-uniformizer `ϖ`, `E = {ϖ}`, `n = 1`, `k = 1` and `I = 0`:
the unscaled coordinate `T` is outside the specified plus ring. For `A = K` this is the
disc of radius `|ϖ|⁻¹`.

**Checks for `schemePullback.map`.** `schemePullback.map_identity` gives the identity adic
map; `schemePullback.map_empty` gives empty image when the source scheme is empty;
`schemePullback.map_twoTerms` is the computation `a ↦ b + a²` in
`relativeMaps_test_twoTerms` below.

**Checks for the projections and universal maps.** `relativeMaps_test_identity` identifies
the isomorphism `p : Y ×_Y S → S`, the equation `q = g ∘ p_`, and the unique map
specified by `SchemePullback.universal` with composites `u` and `g ∘ u_`.
`relativeMaps_test_empty` gives the unique projections and universal map from the empty test space.
`relativeMaps_test_twoTerms` uses `X = A¹_K`: for a point with coordinate `a`, the scheme
projection is evaluation at `a`, the adic projection is its structural map, and the pullback
of the scheme map `T ↦ b + T²` sends that point to `b + a²`. These three computations also
fix `schemePullback.map`. Their carrier is the mixed representing object with its two
projections of different kinds, and the forgetful functor from `TauCeti.AdicSpace` to locally
ringed spaces.

**Points of `X ×_Y S` and of `X^ad`: surjectivity onto compatible pairs; classical points
correspond to closed points; `q_X` is not injective.** (*analytification-points*) (i) In the
situation of *scheme-fibre-product-analytification* (only Huber's hypotheses of 3.8 are needed),
for every `x ∈ X` and `s ∈ S` with `f(x) = g(s)` there is `r ∈ X ×_Y S` with `q(r) = x` and
`p(r) = s`. In particular `q_X : X^ad → X` is surjective onto the set of all points of `X`, closed
and non-closed. (ii) For `K` complete of rank one and `X` locally of finite type over `K`, call
`x ∈ X^ad` classical if its residue field `k(x) = O_{X^ad,x}/m_x` is finite over `K`. Then `q_X`
restricts to a bijection from the classical points of `X^ad` onto the closed points of `X`; for a
closed point `x₀`, `q_X⁻¹(x₀)` consists of exactly one point, it is classical, and `q_X` induces
`k(x₀) ≅ k(x)`. (iii) If `dim X ≥ 1`, `q_X` is not injective: the fibre over the generic point of
a positive-dimensional irreducible component is infinite; for `X = A¹_K` the fibre over the generic
point contains every non-classical point, among them the Gauss point of each disc `|T| ≤ |ϖ|^{-k}`
and the rank-2 points (Huber94 §3, Lem. 3.9(ii), p. 537; Wedhorn §8.7, Prop. 8.63, p. 92, the
restatement with proof; Conrad-AWS §2.4, Ex. 2.4.6, rigid analytification is a bijection onto the
closed points; Wedhorn §7.7, Ex. 7.58, p. 72, classical points of an affinoid adic space are its
maximal ideals). Classical points of `(A¹_K)^ad` are in bijection with the closed points of
`A¹_K`: over an algebraically closed `K` with `K` itself; over general `K` with the
`Aut(K̄/K)`-orbits in an algebraic closure `K̄`, i.e. with the monic irreducible polynomials in
`K[T]` (for imperfect `K` the inseparable ones have no roots in the separable closure); the Gauss
point of the unit disc maps to the generic point of `A¹_K`. *Needs:*
*scheme-fibre-product-analytification*; *analytification-functor*; *analytification-immersions*;
*analytic-affine-space*; *valuation-extension-divisible-hull*; Mathlib
`AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType`,
`AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`,
`AlgebraicGeometry.Scheme.Pullback.exists_preimage_pullback`, `exists_finite_inj_algHom_of_fg`;
Tau Ceti `TauCeti.ValuationSpectrum.classicalPoint_injective_of_isField` (Tau Ceti's
`classicalPoint` is the evaluation point of the closed unit polydisc at a tuple of power-bounded
elements, the `K`-rational points of `D_0` only; the classical points in the sense of (ii), with
`k(x)` finite over `K` and lying in any chart, are this target's notion, and the two agree on the
`K`-rational points of `D_0`).
Lean: README target.

For `X : AdicSpace.SchemeOver (AdicSpace.fieldAffinoid K)`, the formal statements are
`AdicSpace.analytification.bijOn_classicalPoints`,
`AdicSpace.analytification.unique_point_over_closed` and
`AdicSpace.analytification.residueFieldMap_bijective`. The first uses `Set.BijOn` for
`snd.base`, with `RingHom.Finite` applied to the structural map `K → k(x)` obtained
from `fst`, the coefficient germ and the residue map. The second asserts uniqueness
in the **whole** fibre over a closed point. The third says that the residue map
induced by `snd.stalkMap` is bijective, so `RingEquiv.ofBijective` gives the claimed
isomorphism with that very underlying homomorphism. Here K has a complete,
nontrivial rank-one nonarchimedean norm; X need only be locally of finite type.
These statements combine the classical affinoid description (Wedhorn, Example 7.58,
p. 72) with the analytification comparison (Conrad-AWS, Example 2.4.6, p. 21).

`AdicSpace.analytification.infinite_fibre_generic` states the infinite-fibre assertion
for an irreducible component Z with `1 ≤ topologicalKrullDim Z` and its generic point.
`AdicSpace.analytification.not_injective_of_one_le_dim` states non-injectivity when
`1 ≤ topologicalKrullDim X.obj.left`. On a reduced affine open in Z, Noether
normalization supplies a generically finite map to positive-dimensional affine
space; varying Gauss radii and extending valuations gives infinitely many points
over its generic point. The extension and analytic-lift argument is the one in
Wedhorn, Proposition 8.63, p. 92; no reducedness assumption on X is needed.

`AdicSpace.analytification.unitDisc` equips the supplied weighted restricted-series
ring at weight one, with its supplied topology and power-bounded plus ring, with
a complete sheafy `Affinoid` presentation. Its pair of definition is exactly
`(fieldAffinoid K).basis.weighted isWeightFamily_one_weight`, with defining
subring `K°⟨T⟩` and the ideal extended from the chosen principal defining ideal
of `K°` (Wedhorn, Example 6.5(4), p. 47, and Proposition 6.21, pp. 50–51).
Its valuation points are precisely
`TauCeti.ValuationSpectrum.closedPolydisc 1 K`.
`AdicSpace.analytification.gauss_rankTwo_generic` supplies an open immersion of this
disc into the analytification of `Spec K[T]`, with the scheme projection fixed by
`weightedPolynomialHom`. The supplied `gaussPoint` at radius one and a rank-two
specialization in the direction T = 0 have distinct images, and both images under
`snd.base` have prime ideal zero. Rank two means Krull dimension two of the valuation
ring on the affinoid residue field; the specialization satisfies `|T| < 1`.
This is the Gauss valuation and its refinement from Wedhorn, Example 7.57(2),(5),
pp. 71–72, applied to the analytification of Definition 8.64, p. 92. The construction
at radius one works over any of the stated complete fields, without algebraic closure.

**Checks.** Each name below is a suggested name for the Check.

- The basis equals the supplied unit-weight construction applied to `fieldAffinoid K`.
- A constant lies in the defining ideal exactly when its norm is at most the norm of the pseudo-uniformizer chosen by `fieldAffinoid K`.
- T lies in the defining subring but outside its defining ideal.
- The supplied Gauss points of distinct positive radii at most one give infinitely many disc points.
- T is nonzero, is not a unit, and belongs to the plus ring.
- A constant a belongs to the plus ring exactly when `‖a‖ ≤ 1`; a pseudo-uniformizer belongs and its inverse does not.
- An empty scheme has empty image under the analytic projection.
- For `Spec K` the projection is bijective.
- For `Spec K[T]/(T²)` the projection is still bijective: nilpotents do not add points.
- For `Spec K[T]` the projection is not injective.

### R1.3 the analytification functor over `K`

**The adic analytification `X ↦ X^ad = X ×_{Spec K} Spa(K, K°)` of schemes locally of finite type
over `K`.** (*analytification-functor*) Fix a field `K` complete for a nontrivial nonarchimedean
absolute value `|·|` of rank one, its valuation ring `K° = {|x| ≤ 1}`, a pseudo-uniformizer `ϖ`
(`0 < |ϖ| < 1`), and `Spa K := Spa(K, K°)`, a one-point adic space; the construction itself only
uses that `K` is a complete Tate field that is strongly noetherian, which the Foundations of adic
spaces roadmap, layer 0.5, proves for complete rank-one fields. The identity of `K`
defines a morphism of locally ringed spaces `c_K : (Spa K)_ → Spec K`. For a scheme `X` locally of
finite type over `K`, with no separatedness or quasi-compactness assumption, its analytification is
`X^ad := X ×_{Spec K} Spa K` (*scheme-fibre-product-analytification*), an adic space locally of
finite type over `Spa K`, with the morphism of locally ringed spaces `q_X : X^ad_ → X` lying over
`c_K`; a `K`-morphism `h : X₁ → X₂` gives `h^ad := h_{Spa K}`. This defines a functor
`(·)^ad : Sch^{lft}_K → Adic^{lft}_K` from `K`-schemes locally of finite type to adic spaces locally
of finite type over `Spa K`, and `q` is a natural transformation `(·)^ad_ → (·)` of functors to
locally ringed spaces over `Spec K`. For `X = Spec K[T₁,…,Tₙ]/I`,
Lean: README target.

```text
X^ad = ⋃_{k≥0} Spa(A_k, A_k°),   A_k = K⟨ϖ^k T₁,…,ϖ^k Tₙ⟩ / I·K⟨ϖ^k T⟩
```

(functions on the closed polydisc of radius `|ϖ|^{-k}` modulo `I`), glued along the rational
embeddings `Spa(A_k, A_k°) = {|ϖ^k Tᵢ| ≤ 1 for all i} ⊆ Spa(A_h, A_h°)` for `k ≤ h`; the plus ring
of each chart is its power-bounded subring (*tft-plus-ring-power-bounded*). The result does not
depend on `ϖ` or on the presentation, up to unique isomorphism over `Spa K` compatible with `q`
(Wedhorn §8.7, Def. 8.64, p. 92; Hübner §10, Def. 10.3, p. 46, the same definition over an
affinoid field; Huber94 §4, Rem. 4.6(i), p. 543, Huber's original construction of
`X ×_{Spec k} Spa(k, k°)` from Proposition 3.8; Huber96 §1.7, Cor. 1.7.3, pp. 85–86,
`X^ad := X ×_{Spec D} Spa A` locally of finite type over `Spa A`). In `AdicSpace`, `SchemeOver (fieldAffinoid K)` is the category of schemes locally of
finite type over `K`. `analytification (fieldAffinoid K) (fieldAffinoid_stablySheafy K) X`
is a `SchemePullback`: its `.space` is `X^ad`, `.snd` is the locally ringed map `q_X`,
and `.fst` is the structure morphism to `Spa K`. Thus the structural projections have
the same names as in the mixed fibre product. `analytificationFunctor` lands in
`Over (fieldAffinoid K).spa`; `analytification.locallyOfFiniteType` supplies the local
finite-type condition for every object. The functor laws are `map_id` and `map_comp`,
and `analytificationFunctor.map_snd` states naturality of `q`.
`analytification.hom_bijective` gives the displayed Hom equivalence by composing with
`.snd`; the codomain consists of morphisms satisfying the equation over `Spec K`.

`AdicSpace.analytification.affineScheme K R` packages `Spec R → Spec K` for a finite-type
`K`-algebra and is also the affine constructor for `RigidSpace.KScheme K`. For a polynomial
quotient, `analytification.chartAffinoid K hϖ n k I` retains `affineChart_ring` with its quotient topology, additive uniformity and the
exact plus ring `Huber.chartPair`. Its defining subring is the quotient image of
`((fieldAffinoid K).basis.weighted hE).completion.ringOfDefinition`, where `hE`
is the weight family with weights `{ϖ}^k`; its ideal is generated by the image
of that completed pair's defining ideal. The radius parameter `ϖ` need not be
the pseudo-uniformizer selected for `fieldAffinoid K`. The construction uses
Wedhorn, Remarks 6.7–6.8, p. 48, and Proposition 6.21, pp. 50–51.
The theorem `analytification.affineChart` gives
open immersions of these affinoids into the analytification of `Spec K[T]/I`,
whose images cover it, and identifies every chart plus ring with its power-bounded
subring. Its equation with `.snd` identifies the polynomial
coefficient map; for `k ≤ h`, composition with `Affinoid.map (Huber.chartTransition …)`
is the smaller chart inclusion. The image inside the larger chart is precisely
`{|ϖ^k Tᵢ| ≤ 1 for every i}`. This is an identification of open adic spaces with
specified restrictions, including when `I = ⊤`. These are the affine charts in Huber94, proof of Proposition 3.8,
pp. 536–537, and Wedhorn §8.7, proof of Proposition and Definition 8.61, pp. 91–92.

`SchemePullback.existsUnique_iso` expresses independence of presentations and
pseudo-uniformizers: any two constructions satisfying the mixed universal property
are uniquely isomorphic with both projections fixed. `analytificationSpecIso`
identifies `(Spec K)^ad` with `Spa K`, including the equations for `.fst` and `.snd`.
`analytification.isoOpenSubscheme` identifies the analytification of an open immersion
`U → X` with any open subspace of `X^ad` having image `q_X⁻¹(U)`; its isomorphism is
unique over `X^ad`. `analytification.baseFieldIso` takes a complete rank-one extension
`L/K`, a continuous pair map whose ring map is `algebraMap K L`, and an algebraic
base-change square. It supplies the analytic map with its equation on `.snd` and
proves that its square over `Spa(L, L°) → Spa(K, K°)` is a pullback. This characterizes
the canonical isomorphism `(X ×_K L)^ad ≅ X^ad ×_{Spa K} Spa(L, L°)` without assuming
that `L/K` is finite. These comparisons follow from the same universal property
(Huber94, Proposition 3.8; Wedhorn §8.7, Proposition and Definition 8.61 and Definition 8.64, pp. 91–92).
`analytification.isLocallyNoetherian` states local noetherianity for every
`X : SchemeOver (fieldAffinoid K)` (Huber94, Proposition 3.8, its locally finite-type
projection, and §4, Remark 4.6(i), p. 543).
`(A¹_K)^ad` is the adic affine line
`⋃_k Spa(K⟨ϖ^k T⟩, K°⟨ϖ^k T⟩)` (Hübner Example 10.4), not the closed unit disc
(*analytic-affine-space*), and `(Spec L)^ad = Spa(L, L°)` (one point) for every finite extension
`L/K`. *Needs:* *scheme-fibre-product-analytification*; *affine-chart-analytification*;
*tft-plus-ring-power-bounded*; *fibre-products-existence* (layer R0); Mathlib
`AlgebraicGeometry.LocallyOfFiniteType`; Tau Ceti
`TauCeti.Huber.IsStronglyNoetherian`, `TauCeti.Huber.Pair.powerBounded`,
`TauCeti.ValuationSpectrum.closedPolydisc`.

**Checks.**

- `analytification.affineScheme_field`, `analytification.affineScheme_empty`,
  `analytification.affineScheme_line` — the structural map of `Spec K` is an
  isomorphism, the unit-ideal quotient has empty spectrum, and the affine line's
  structural map is not an isomorphism.
- `analytification.chartAffinoid_basis_image` fixes the quotient image of the completed
  weighted defining subring; `analytification.chartAffinoid_basis_ideal` fixes its
  mapped defining ideal; `analytification.chartAffinoid_basis_empty` gives the zero
  ideal for the unit relation ideal.
- `analytification.chartAffinoid_empty`, `analytification.chartAffinoid_point`,
  `analytification.chartAffinoid_dualNumbers` — the unit ideal gives an empty chart,
  zero variables and zero ideal give `Spa K`, and `I = (T²)` gives a one-point
  chart whose ring is not reduced, at every radius.
- The two-term polynomial `1 − ϖT`
  restricts unchanged from radius `|ϖ|⁻¹` to radius `1`. Its inverse exists on
  the smaller disc and is outside the image of that restriction map: the zero
  `T = ϖ⁻¹` on the larger disc prevents extension. This detects the radius and
  the direction of restriction (Conrad-AWS, Example 2.4.3, pp. 19–20).


- *Degenerate.* `(Spec K)^ad ≅ Spa(K, K°)`, a single point, and `q`
  is `c_K`; the empty scheme analytifies to the empty adic space.
- *Computation.* For a finite field extension `L/K`,
  `(Spec L)^ad ≅ Spa(L, L°)`, a single point whose residue field is `L`.
- *Non-example.* `(A¹_K)^ad` is not affinoid; in particular it
  is not `Spa(K⟨T⟩, K°⟨T⟩)`, which is the open subspace `{|T| ≤ 1}`, and it is not `Spa` of the
  completion of `K[T]` for any adic topology. For each `a ∈ K` with `‖a‖ > 1`,
  the Check constructs a `Spa K`-point over the base whose pullback of `T`
  is the constant `a`; its stalk valuation satisfies `|T| > 1`
  (Conrad-AWS, Examples 2.4.3 and 2.4.6, pp. 19–21).
- *Compatibility.* For `X = A^n_K` the chart `k = 0` of
  `X^ad` is the closed polydisc `Spa(K⟨T₁,…,Tₙ⟩, K°⟨T₁,…,Tₙ⟩)` of the Foundations of adic spaces
  roadmap (Tau Ceti `TauCeti.ValuationSpectrum.closedPolydisc` after completion), with plus ring
  Tau Ceti `TauCeti.Huber.Pair.powerBounded`. Its open immersion `j` satisfies
  `forget(j) ≫ P.snd = D.toSpec ≫ Spec(c)`, where `c` is the polynomial map
  into the completed chart followed by its zero-ideal quotient. Thus the chart
  preserves the unscaled coordinates, as in the chart statement of *analytic-affine-space*
  (Conrad-AWS, Example 2.4.3, pp. 19–20).
- The ring comparison
  identifies the zero-radius-exponent chart series with the supplied completed
  restricted-series ring; `analytification_test_chart_polydisc` also tests the
  open immersion into the analytification, its valuation-space homeomorphism
  with the supplied closed polydisc, and the power-bounded plus ring.
- *Characterisation.* For a finite `K`-algebra `L`
  that is a field, morphisms `Spa(L, L°) → X^ad` over `Spa K` correspond to
  `X(L) = Hom_K(Spec L, X)`. The bijection `e` is fixed by
  `forget(w) ≫ P.snd = (fieldAffinoid L).toSpec ≫ (e w).toLRSHom` for every `w`:
  composition with the scheme projection gives exactly the corresponding scheme map
  (Conrad-IC, Appendix A.1, Lemma A.1.1, p. 31, and Lemma A.1.2(1), p. 32).

**Universal property of `X^ad`: morphisms from adic spaces over `Spa K` into `X^ad` are morphisms
of locally ringed spaces into `X`.** (*analytification-universal-property*) Let `X` be a scheme
locally of finite type over `K` (`K` complete, rank one) and `Y` an arbitrary adic space over
`Spa K` with structure morphism `π : Y → Spa K`, with no finiteness hypothesis on `Y`. The
bijection

Lean: README target.

```text
Hom_{Spa K}(Y, X^ad) → Hom_{LRS/Spec K}(Y_, X),   w ↦ q_X ∘ w_,
```

onto the set of morphisms of locally ringed spaces `v : Y_ → X` whose composite with `X → Spec K`
is `c_K ∘ π_` is the universal property of *scheme-fibre-product-analytification* at `Y = Spec K`,
`S = Spa K`, `g = c_K`, and is not restated; this target proves that it is natural in `Y` and in
`X` (for `h : X₁ → X₂` and `u : Y' → Y` over `Spa K`, `q_{X₂} ∘ (h^ad ∘ w ∘ u)_ = h ∘ (q_{X₁} ∘ w_) ∘ u_`)
and records its instances. In particular, for an affinoid `Y = Spa(D, D⁺)` over `Spa K` with `D` complete and
an affine `X = Spec C`, `Hom_{Spa K}(Y, X^ad) ≅ Hom_{K-alg}(C, D) = X(D)`; for `X = A^n_K` this is
`D^n`; and for a finite field extension `L/K`, `Hom_{Spa K}(Spa(L, L°), X^ad) = X(L)`
(Zavyalov24 §6, Def. 6.1, p. 12, the universal property defining relative analytification;
Zavyalov24 §6, Rem. 6.2, p. 13, existence from Huber94 3.8 and uniqueness from the universal
property; Conrad-AWS §2.4, Ex. 2.4.6, the rigid analogue; Conrad-MR §1.3, Notation and
terminology, p. 2, points over finite algebras in rigid form; Stacks Tag 01I1 (Schemes,
Lem. 26.6.4), morphisms of locally ringed spaces into an affine scheme are ring maps on global
sections). `(A¹_K)^ad` represents `Y ↦ O_Y(Y)` on adic spaces over `Spa K`, while the closed unit
disc represents `Y ↦ O⁺_Y(Y)` (Berkeley Lecture 4, the adic affine line); over a strongly noetherian
Tate affinoid base `S = Spa(A, A⁺)` the same bijection is Zavyalov's Definition 6.1 of relative
analytification.
*Needs:* *scheme-fibre-product-analytification*; *analytification-functor*; Mathlib
`AlgebraicGeometry.ΓSpec.locallyRingedSpaceAdjunction`, `AlgebraicGeometry.LocallyRingedSpace`.

**The adic affine space `A^{n,ad}`: an increasing union of closed polydiscs, not quasi-compact, with
entire functions as global sections.** (*analytic-affine-space*) Let `n ≥ 1` and `ϖ` a
pseudo-uniformizer of `K` (`K` complete of rank one; the union and the answer in (iii) do not depend
on `ϖ`). Prove: (i) `A^{n,ad}_K := (A^n_K)^ad` is the increasing union of the closed polydiscs
`D_k = Spa(K⟨ϖ^k T₁,…,ϖ^k Tₙ⟩, K°⟨ϖ^k T₁,…,ϖ^k Tₙ⟩)`, `k ≥ 0`, where `D_k ⊆ D_{k+1}` is the
rational subset `{|ϖ^k Tᵢ| ≤ 1, i = 1,…,n}`; `D_0` is the closed unit polydisc. (ii) `A^{n,ad}_K`
is not quasi-compact, hence not affinoid. (iii) Restriction identifies `O(A^{n,ad}_K)` with
`lim_k K⟨ϖ^k T⟩ = {Σ_ν a_ν T^ν : |a_ν| r^{|ν|} → 0 for every real r > 0}`, the ring of entire power
series; it contains `K[T₁,…,Tₙ]` as a proper subring. (iv) That `A^{n,ad}_K` represents
`Y ↦ O_Y(Y)^n` on adic spaces over `Spa K` is *analytification-universal-property* at `X = A^n_K`
and is used, not restated (Hübner §4, Ex. 4.3, pp. 16–17, non-quasi-compactness of the adic affine
line and the discs as rational subsets of the larger discs; Berkeley Lecture 4, the adic affine line,
p. 27, its functor of points and why it is the union of the discs; Conrad-AWS §2.4, Ex. 2.4.3, the
rigid analogue; Berkeley Lecture 4, closure of the adic closed unit disc, p. 28). The closed
polydiscs `D_k` themselves, the open disc as the union of the rational closed discs
`{|T| ≤ |ϖ|^{1/m}}` and the non-quasi-compactness argument for that union are the Foundations of
adic spaces roadmap, layer 5.4 (Tau Ceti `ValuationSpectrum.closedPolydisc`, with
`SpectralSpace (spa A⁺)` for the quasi-compactness of each disc); the target is the affine space,
the union of discs of growing radius, whose charts are the `D_k`. The classical point
`T = ϖ^{-2}` lies in `D_2 \ D_1` (`|ϖ² · ϖ^{-2}| = 1 ≤ 1`, `|ϖ · ϖ^{-2}| = |ϖ|^{-1} > 1`);
`Σ_m ϖ^{m²} T^m` is an entire function on `A^{1,ad}_K` that is not a polynomial
(`|ϖ|^{m²} r^m → 0` for every `r`); and the closure of `D_0` in `A^{1,ad}_K` contains the
rank-2 point `x_{>1}` above the Gauss point (`|T| = 1·γ`, `γ > 1` infinitesimal), a specialisation
of the Gauss point of `D_0` with `|T| > 1`, so `D_0` is open but not closed and `A^{1,ad}_K` has
points of rank 2 (Berkeley Lecture 4). The coefficient form of (iii) is that a series lies in
every `K⟨ϖ^k T⟩` iff it is entire, together with the existence of a non-polynomial entire series for
`n ≥ 1`; for `n = 0` both sides are `K` and the polynomials are everything.
Lean: README target.

`AdicSpace.analyticAffineSpace_globalSections_series` carries the complete nontrivially
valued field `K`, pseudouniformiser `ϖ` and `n : ℕ`, and supplies the section-ring isomorphism
with entire series of (iii), normalized by restriction to every chart and fixing constants
and polynomial coordinates. `AdicSpace.analyticAffineSpace_globalSections_ne_polynomial`
adds `1 ≤ n` and states that this polynomial subring is proper, witnessed by
`Σ_m ϖ^{m²}T₁^m`.

The geometric statements use the existing
`analytification (fieldAffinoid K) (fieldAffinoid_stablySheafy K)
  (analytification.affineScheme K (MvPolynomial (Fin n) K))`.
For every `n : ℕ` and pseudo-uniformizer `ϖ`, the chart statement gives open immersions
`j k : (analytification.chartAffinoid K hϖ n k ⊥).spa ⟶ space`, fixes their
polynomial-coordinate maps through the scheme projection, and states that their ranges
increase and cover the space. For `k ≤ h`, the supplied `Huber.chartTransition` induces
an open immersion from `D_k` to `D_h` commuting with `j`; its range is the supplied
`rationalSubset` with denominator `1` and numerators `1, ϖ^k T₁, …, ϖ^k Tₙ`.
It also identifies `D_0` with the supplied closed unit polydisc. This is the
finite-dimensional version of Berkeley Lecture 4, p. 27, and Conrad-AWS,
Example 2.4.3, pp. 19–20. The non-compactness statement asserts
`¬ CompactSpace space.obj` and non-affinoidness for `1 ≤ n`, witnessed by the
points `(ϖ^{-(k+1)}, 0, …, 0)` escaping `D_k`.

For every `n : ℕ`, the section statement gives a ring
isomorphism from `sectionRing space ⊤` to the intersection
`⨅ k, weightedRestrictedSubring (fun _ ↦ {ϖ} ^ k) _` inside
`MvPowerSeries (Fin n) K`. Since `{ϖ} ^ k = {ϖ^k}`, its carrier is exactly
`{f // ∀ k, IsWeightedRestricted (fun _ ↦ {ϖ^k}) f}`. The isomorphism is
specified by restriction: on each polynomial-compatible chart, a section maps to
the completion image of its unscaled coefficient series, followed by the zero-ideal
quotient and `Affinoid.coeff`. Sheaf gluing on the same exhaustion proves this
identification; the coefficient criterion above converts it to the entire-series
formula. Completeness, nontriviality of the rank-one norm and the ultrametric
hypothesis are imposed throughout; the formal statement also records the compatible
`NonarchimedeanRing` and `IsHuberRing` instances.

- The analytification of
  `Spec K[Tᵢ : i ∈ Fin 0]` is compact and its global-section ring is isomorphic
  to `K`; positive dimension is necessary for non-compactness.
- Restricting the algebraic global
  function `a - T` to `D_k` gives `c_k(a) - c_k(T)`. The coordinate is unscaled,
  so the radius index changes neither its sign nor its polynomial coefficient.
- The analytification of `Spec K[T₁,T₂]`
  is not compact, although each closed bidisc in its exhaustion is compact.

*Needs:* *analytification-functor*; *analytification-universal-property*; Tau Ceti
`TauCeti.ValuationSpectrum.closedPolydisc`, `TauCeti.ValuationSpectrum.classicalPoint` (the
`K`-rational points of `D_0` only; the classical point `T = ϖ^{-2}` above lies in `D_2 \ D_1` and is
a classical point of `D_2` in the sense of *analytification-points*(ii)),
`TauCeti.ValuationSpectrum.rationalSubset`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; Mathlib
`AlgebraicGeometry.AffineSpace`.

**Analytification preserves and reflects surjectivity.** (*analytification-surjective*) Let
`h : X₁ → X₂` be a morphism of schemes locally of finite type over `Y` and `S → Y` as in
*scheme-fibre-product-analytification*. Prove that if `h` is surjective then
`h_S : X₁ ×_Y S → X₂ ×_Y S` is surjective, and that for `K`-schemes locally of finite type (`K`
complete of rank one, `S = Spa K`), `h` is surjective if and only if `h^ad : X₁^ad → X₂^ad` is
surjective (Huber94 §3, Lem. 3.9(ii), p. 537, the point-surjectivity used in both directions;
Conrad-RA §2.2, Ex. 2.2.11, the rigid analogue). The surjection `A¹ ⊔ A¹ → P¹` (two affine charts)
analytifies to a surjection onto `P^{1,ad}`; the non-surjective open immersion `G_m → A¹`
analytifies to a non-surjective map (`0` is missed). *Needs:*
*scheme-fibre-product-analytification*; *analytification-points*; Mathlib
`AlgebraicGeometry.Surjective`.
Lean: README target.

### R1.4 compatibilities

**Analytification of open and closed immersions: open subspaces and closed adic subspaces cut out
by the analytified ideal.** (*analytification-immersions*) Let `X` be a `K`-scheme locally of
finite type. Prove: (i) if `j : U → X` is an open immersion, `j^ad` is an open embedding with image
`q_X⁻¹(j(U))`; (ii) if `i : Z → X` is a closed immersion with quasi-coherent ideal sheaf
`I ⊆ O_X` (automatically of finite type since `X` is locally noetherian), then `i^ad` is a closed
embedding in the sense of *closed-adic-subspaces-and-embeddings* (layer R0): it identifies `Z^ad`
with the closed adic subspace of `X^ad` defined by the ideal sheaf `I·O_{X^ad}` generated by
`q_X⁻¹I`, and its image is `q_X⁻¹(i(Z))`; on an affine chart `X = Spec K[T]/J`,
`Z = Spec K[T]/(J + J')`, the piece of `Z^ad` over `Spa(A_k, A_k°)` is
`Spa(A_k/J'A_k, (A_k/J'A_k)°)`, the quotient pair of the Foundations of adic spaces roadmap,
layer 2.4; (iii) consequently immersions analytify to locally closed embeddings, and (i)–(ii) hold
verbatim for `X ×_Y S → X' ×_Y S` in the relative setting of
*scheme-fibre-product-analytification* (Conrad-RA §2.2, Ex. 2.2.11, relative rigid analytification
carries Zariski-open/closed immersions to Zariski-open/closed immersions; Zavyalov24 §6, Ex. 6.5,
p. 13, the analytification of `V(f₁,…,f_s) ⊆ A^d` is the vanishing locus of the same functions;
Huber96 §1.4, (1.4.1), pp. 60–61, closed adic subspaces cut out by an ideal sheaf). `V(T) ⊆ A¹_K`
analytifies to the single classical point `0` of `A^{1,ad}_K`, and `D(T) = G_m` analytifies to
`A^{1,ad}_K \ {0} = ⋃_k {|ϖ^k| ≤ |T| ≤ |ϖ|^{-k}}`; for a closed immersion `Y ↪ X` of
quasi-projective varieties over `K`, `Y^ad` is the closed adic subspace of `X^ad` cut out by
`I_Y·O_{X^ad}`, the input consumed by PerfectoidTowers layer P8.
*Needs:*
*analytification-universal-property*; *affine-chart-analytification*;
*tft-plus-ring-power-bounded*; *scheme-fibre-product-analytification*;
*closed-adic-subspaces-and-embeddings*, *noetherian-type-ideals-closed*,
*noetherian-type-stably-sheafy* (layer R0); Tau Ceti `TauCeti.Huber.Pair.quotient`,
`TauCeti.Huber.Pair.Hom.range_spaComap_quotientHom`; Mathlib `AlgebraicGeometry.IsOpenImmersion`,
`AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.IsImmersion`.
Lean: README target.

**Analytification commutes with fibre products and preserves finite products.**
(*analytification-fibre-products*) For morphisms `X → Z ← Y` of `K`-schemes locally of finite type,
prove that the natural morphism `(X ×_Z Y)^ad → X^ad ×_{Z^ad} Y^ad` (induced by the two
projections) is an isomorphism of adic spaces over `Spa K`; the right side is the fibre product in
the category of all adic spaces, which exists by *fibre-products-existence* because
`X^ad → Z^ad` is locally of finite type. Since `(Spec K)^ad = Spa K` is terminal among adic spaces
over `Spa K`, `(·)^ad` preserves finite products: `(X ×_K Y)^ad ≅ X^ad ×_{Spa K} Y^ad` and
`(Spec K)^ad ≅ Spa K`. Relatively, for locally noetherian `S` with stably sheafy charts over `Y` and `Y`-schemes
`X₁ → X₂ ← X₃` locally of finite type,
`(X₁ ×_{X₂} X₃) ×_Y S ≅ (X₁ ×_Y S) ×_{(X₂ ×_Y S)} (X₃ ×_Y S)` (Conrad-IC Appendix A.1,
Lem. A.1.2(3), p. 32; Stacks Tag 01I4 (Schemes, Lem. 26.6.7) and Tag 01JN (Schemes, Rem. 26.16.2),
affine and global fibre products of schemes are fibre products of locally ringed spaces; Huber96
§1.1, (1.1.11), p. 43, the rigid-to-adic functor also commutes with fibre products;
Huber94, Proposition 3.8, pp. 536–537, for the mixed fibre product).
For an affinoid base, `AdicSpace.analytification.isPullback` takes
`hA : HasStablySheafyCharts A.spa` and `hN : IsLocallyNoetherian A.spa`, and carries a
scheme pullback square in `SchemeOver A` to an adic pullback square.
`(A¹_K ×_K A¹_K)^ad ≅ A^{2,ad}_K ≅ A^{1,ad}_K ×_{Spa K} A^{1,ad}_K`; the fibre of `A¹ → A¹`,
`T ↦ T²`, over the `K`-point `1` is `Spec K[T]/(T² − 1)`, whose analytification for `char K ≠ 2` is
two classical points. *Needs:* *scheme-pullback-is-lrs-pullback*;
*analytification-universal-property*; *scheme-fibre-product-analytification*;
*analytification-functor*; *fibre-products-existence*, *finite-type-morphism-classes* (layer R0);
Mathlib `CategoryTheory.Limits.pullback`, `AlgebraicGeometry.Scheme.forgetToLocallyRingedSpace`.
Lean: README target.

**Analytification of finite and finite locally free morphisms.** (*analytification-finite*) Let
`f : X → Y` be a finite morphism of schemes and `S → Y` as in
*scheme-fibre-product-analytification*, with `S` locally noetherian and having stably sheafy
charts. The affinoid-base target `AdicSpace.analytification.finite` assumes
`hA : HasStablySheafyCharts A.spa`, `hN : IsLocallyNoetherian A.spa`, and
`AlgebraicGeometry.IsFinite f.hom.left` for `f` in `SchemeOver A`.
Prove that for every
open affinoid `V = Spa(A, A⁺) ⊆ S` with `A` of noetherian type (such `V` cover `S`, which is
locally noetherian), mapping into an affine open `Spec B ⊆ Y` with
`f⁻¹(Spec B) = Spec C` (`C` finite over `B`), the preimage of `V` in `X ×_Y S` is the affinoid
`Spa(C ⊗_B A, (C ⊗_B A)⁺)`, where `C ⊗_B A` carries its natural topology as a finite `A`-module and
`(C ⊗_B A)⁺` is the integral closure of the image of `A⁺`; hence `p : X ×_Y S → S` is finite in the
sense of *finite-morphism* (layer R0). If moreover `f` is finite locally free of constant rank `d`
(`f_*O_X` locally free of rank `d`), then for every such `V` the ring `O(p⁻¹V) = C ⊗_B A` is a
finite projective `A`-module of constant rank `d`. State this as
`AdicSpace.schemePullback.isFinite_of_finiteLocallyFree`: for any `X : Over Y` whose
structure morphism is finite, flat and locally of finite presentation, with fibre rank `d`
at every point of `Y`, and any `S → Y` with `S` having stably sheafy charts, the projection
`X ×_Y S → S` is finite and the sections over the full preimage of each affinoid chart
are finite projective of constant rank `d` over the target chart ring. In particular, for
`K`-schemes locally of finite type: `f` finite implies `f^ad` finite; `f` finite locally free of rank `d` implies `f^ad` finite
and `O((f^ad)⁻¹V)` finite projective of rank `d` over `O(V)` for every open affinoid `V ⊆ Y^ad`
(Conrad-IC Appendix A.2, proof of Thm A.2.1, p. 34, the rigid argument: finite maps factor through
monic equations, whose analytification is finite; Conrad-IC Appendix A.2, Thm A.2.1(2), p. 33;
Huber96 §1.4, Lem. 1.4.5, pp. 61–62, under (1.1.1), p. 37, finite morphisms of adic spaces, and the proof of
Lem. 1.4.5(i), p. 62, base change of a finite morphism of affinoid adic spaces computed by the
tensor product with the module topology, used for the restriction of `(f^ad)⁻¹V` to the rational
pieces `V_i`). For `f : A¹ → A¹`, `T ↦ T²` (finite locally free of rank 2), over the disc
`|T| ≤ |ϖ|^{-2k}` the preimage under `f^ad` is `Spa(K⟨ϖ^{2k}T⟩[S]/(S² − T))`, the disc
`|S| ≤ |ϖ|^{-k}`, of rank 2 over the base disc; an open immersion that is not finite (`G_m → A¹`)
analytifies to `A^{1,ad} \ {0} → A^{1,ad}`, whose preimage of the unit disc is not affinoid.
*Needs:* *scheme-fibre-product-analytification*; *affine-chart-analytification*;
*finite-morphism*, *finite-algebra-over-affinoid* (layer R0); Mathlib
`AlgebraicGeometry.IsFinite`, `Module.Projective`, `Module.Finite`,
Mathlib's descent of flatness along faithfully flat tensor products and its criterion that a
flat finitely presented module is projective (in `Module.Flat`); Tau Ceti
`TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc`.
Lean: README target.

**The analytification morphism `q_X : X^ad → X` is flat.** (*analytification-map-flat*) Let `X` be
a `K`-scheme locally of finite type (`K` complete of rank one). Prove that for every point
`x ∈ X^ad` (classical or not) the local homomorphism `q^♯_x : O_{X,q_X(x)} → O_{X^ad,x}` is flat.
Relatively, for a strongly noetherian Tate affinoid `S = Spa(A, A⁺)` and a scheme `X` locally of
finite type over `Spec A`, the morphism `X ×_{Spec A} S → X` is flat (Zavyalov24 §6, Lem. 6.7,
p. 14; Conrad-IC Appendix A.1, proof of Lem. A.1.2, p. 32, the rigid proof via local rings and
completions). At the Gauss point `x` of the unit disc, `O_{X^ad,x}` is a field extension of
`K(T) = O_{A¹,η}`, flat as every module over a field; consequently `F ↦ q_X^*F` is exact on
`O_X`-modules (*analytification-of-modules*). The chart flatness statements are
`AdicSpace.analytification.flat_chart_affinoid` (`K[T] → K⟨ϖ^k T⟩` flat, the absolute case) and
its variant over a Tate base with a noetherian ring of definition, which assumes this of the
Tate ring `A` rather than the strongly noetherian hypothesis of the relative geometric statement; the
strongly noetherian chart case is *restricted-series-flat-over-polynomials*. *Needs:*
*analytification-completed-local-rings*; *analytification-functor*;
*affine-chart-analytification*;
*restricted-series-flat-over-polynomials*; *analytification-immersions*;
*scheme-fibre-product-analytification*; *closed-adic-subspaces-and-embeddings* (layer R0); Tau
Ceti `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`; Mathlib `AlgebraicGeometry.Flat`.
Lean: README target.

**Analytification of `O_X`-modules `F ↦ F^ad = q_X^*F`, its exactness, and analytified ideal
sheaves.** (*analytification-of-modules*) For a `K`-scheme `X` locally of finite type and an
arbitrary `O_X`-module `F`, put `F^ad := q_X^*F = O_{X^ad} ⊗_{q_X⁻¹O_X} q_X⁻¹F`, the pullback of
sheaves of modules along the morphism of ringed spaces `q_X : X^ad_ → X` (Mathlib
`SheafOfModules.pullback` for the continuous functor of opens `V ↦ q_X⁻¹(V)` and the ring map
`q_X^♯`; `O_{X^ad}` regarded as a sheaf of rings). Then `F ↦ F^ad` is an exact functor
`O_X-Mod → O_{X^ad}-Mod` (exactness uses only the flatness of `q_X`) with stalks
`(F^ad)_x ≅ O_{X^ad,x} ⊗_{O_{X,q(x)}} F_{q(x)}`; it commutes with tensor products (the sheafified
tensor product of sheaves of modules, `tensorModules` below) and with pullback along analytified morphisms
(`(h^*G)^ad ≅ (h^ad)^*G^ad`), `(O_X)^ad = O_{X^ad}`, and for a quasi-coherent ideal `I ⊆ O_X` the
map `I^ad → O_{X^ad}` is injective with image the ideal sheaf `I·O_{X^ad}` of the closed adic
subspace `V(I)^ad` (*analytification-immersions*). The same holds relatively for the
analytification `X ×_{Spec A} S → X` of a scheme `X` locally of finite type over `Spec A`, with
`S = Spa(A, A⁺)` a strongly noetherian Tate affinoid (Zavyalov24 §6). It does not hold for
`X ×_Y S → X` with an arbitrary scheme `Y` and morphism `S → Y`, whose projection need not be flat
(`Y = X = A¹_K` and `S = Spa K` mapping to the origin: the projection is the inclusion of a point
and `q^*` is not exact). Coherence of `F^ad` for coherent `F` uses the coherent-sheaf notion of
AdicSpacesPartIII layer R3 and is proved there (Conrad-IC Appendix A.1, Lem. A.1.2(4), p. 32, rigid analytification
of modules is exact, faithful, and carries coherent to coherent; Zavyalov24 §6, Lem. 6.9, p. 15,
the adic pullback `c*_{X/S}` on coherent sheaves, whose t-exactness comes from Lemma 6.7). In
`AdicSpace`, define `analytification.modules` as `pullbackModules q_X`. Its morphism action
is `(analytification.modules A hA X).map`; identity and composition are the supplied
`CategoryTheory.Functor.map_id` and `CategoryTheory.Functor.map_comp`. Here `A` is a complete
sheafy affinoid, `hA : HasStablySheafyCharts A.spa`, and `X : SchemeOver A` is locally of finite
type over `Spec A`. For strongly noetherian Tate `A`, `analytification.modules_exact` states
preservation of finite limits and finite colimits, and `analytification.modules_mono` states
preservation of every monomorphism. These follow from `analytification.flat`
(Zavyalov24 §6, Lem. 6.7). The unit comparison `analytification.modules_unitIso` says that
Mathlib's canonical `SheafOfModules.pullbackObjUnitToUnit` is an isomorphism; it requires only
`hA`. For this same base and every module sheaf `F` and point `x ∈ X^ad`, define
`analytification.stalkComparison` as the `O_{X^ad,x}`-linear map
`O_{X^ad,x} ⊗_{O_{X,q(x)}} F_{q(x)} → (q_X^*F)_x` induced by the pullback adjunction unit.
The algebra structure is the actual homomorphism `(q_X.stalkMap x).hom`.
`analytification.stalkComparison_germ` specifies its value on generators:
`a ⊗ germ(m) ↦ a · germ(η_F(m))`, where `m` is a section on a neighbourhood `U` of
`q_X(x)` and `η_F(m)` is its pullback section on `q_X⁻¹(U)`.
`analytification.modules_stalk` asserts bijectivity of this map
([Stacks, Definition 6.26.1 and Lemma 6.26.4](https://stacks.math.columbia.edu/tag/0094)).
Lean: README target.

Define `tensorModules X F G` on the same `SheafOfModules (ringCatSheaf X)` carrier by applying
`PresheafOfModules.sheafification` to
`PresheafOfModulesOfCommRing.Monoidal.tensorObj F.val G.val`.
Tau Ceti supplies the closed monoidal structure through
`TauCeti.SheafOfModules.monoidalClosed`, under the site hypotheses in the supplier table.
`SheafOfModules.tensorUnderlyingIso` identifies its tensor with `tensorModules`.
For arbitrary module sheaves `F, G`, `analytification.modules_tensorIso` states
`IsIso (Functor.OplaxMonoidal.δ (analytification.modules A hA X) F G)`.
Its source is `(F ⊗ G)^ad` and its target is `F^ad ⊗ G^ad`; the oplax structure is
`TauCeti.SheafOfModules.pullbackOplaxMonoidal`
([Stacks, Lemma 18.26.2](https://stacks.math.columbia.edu/tag/03EL)).
For a morphism `h : X → Y` in `SchemeOver A`, `analytification.modules_pullbackIso`
states invertibility of the specified natural comparison `(h*G)^ad → (h^ad)*(G^ad)`.
It is the hom of `SheafOfModules.pullbackComp h♯ q_X♯`, followed by equality transport
from `q_X ≫ h = h^ad ≫ q_Y` supplied by `analytificationFunctor.map_snd`, followed by
the inverse of `SheafOfModules.pullbackComp q_Y♯ (h^ad)♯`.
Both statements need only the stable-chart hypothesis
([Stacks, Lemma 6.26.3](https://stacks.math.columbia.edu/tag/0094)).

For strongly noetherian Tate `A`, `analytification.modules_idealImage` states that the
canonical map from the pullback of a submodule `I` of the structure sheaf is mono, and that a
section belongs to its image exactly when, locally, it is a finite linear combination of
pullbacks of sections of `I`. This describes `I·O_{X^ad}` without imposing quasi-coherence.
For a closed immersion `i : Z → X` in `SchemeOver A`, take `I` with sections equal to the
kernel of `i` on functions. Then `analytification.modules_idealSheaf_closedImmersion` gives
the short exact sequence `0 → I^ad → O_{X^ad} → i^ad_*O_{Z^ad} → 0` and the corresponding
cokernel isomorphism. In particular, `(O_X/I)^ad ≅ O_{X^ad}/I·O_{X^ad} ≅ i^ad_*O_{Z^ad}`.
The kernel description is the ideal comparison in the proof of Zavyalov24 §6, Cor. 6.8,
using Lem. 6.7; the closed immersion itself is *analytification-immersions*.

*Needs:* *analytification-map-flat*; *analytification-functor*;
*analytification-immersions*; Mathlib `SheafOfModules.pullback`, `SheafOfModules.pullbackComp`,
`SheafOfModules.Submodule`, `SheafOfModules.pullbackObjUnitToUnit`;
the affine restriction maps of `analytification.modules`.

**Checks.**

- For a zero module sheaf every tensor maps to zero.
- For the structure sheaf, `1 ⊗ germ(r)` maps to
  `q_X♯(germ(r))` times the image of `1 ⊗ germ(1)`; this checks the actual scalar homomorphism.
- `1 ⊗ germ(m)` maps to the germ of `η_F(m)` on
  `q_X⁻¹(U)`, fixing the normalization and the direction of the comparison.
- Tensoring the zero sheaf with any module sheaf gives zero.
- Tensoring the structure sheaf with `F` gives `F`.
- Free sheaves of ranks two and three tensor to rank six.
- *Degenerate.* `(O_X)^ad ≅ O_{X^ad}` and
  `0^ad = 0`.

**Continuous differentials of the analytification charts:
`Ωᶜ_{A_k/A'} ≅ A_k ⊗_C Ω_{C/B'}`.** (*analytic-kahler-differentials*) Let `h : X → Y` be a
morphism of schemes locally of finite type over a scheme `B₀` and `S → B₀` as in
*scheme-fibre-product-analytification* (in particular `B₀ = Spec K`, `S = Spa K`); write
`h_S : X_S → Y_S` for the analytified morphism and `q_X : X_S → X`. Chart form: let `Spec C ⊆ X`
and `Spec B' ⊆ Y` be affine opens with `h(Spec C) ⊆ Spec B'` and `C = B'[T₁,…,Tₙ]/I`, let
`Spa(A', A'⁺) ⊆ Y_S` be an affinoid open lying over `Spec B'`, and let `Spa(A_k, A_k⁺)` be the
charts of `X_S` over it (*affine-chart-analytification*:
`A_k = A'⟨T⟩_{E(k)}/I·A'⟨T⟩_{E(k)}`). Prove that the `A_k`-linear map
`A_k ⊗_C Ω_{C/B'} → Ωᶜ_{A_k/A'}`, `1 ⊗ dc ↦ d(c)`, induced by the `B'`-derivation
`C → A_k → Ωᶜ_{A_k/A'}` (`Ω_{C/B'}` the Kähler module, Mathlib `KaehlerDifferential`; `Ωᶜ` the
module of continuous differentials of *continuous-differentials*, layer R0), is an isomorphism of
finite `A_k`-modules with `1 ⊗ dTᵢ ↦ dTᵢ`; it is compatible with the chart maps `A_h → A_k`
(`k ≤ h`), with rational localisation and with shrinking `Spec C`, `Spec B'` and `Spa(A', A'⁺)`.
Continuous differentials exist for morphisms locally of weakly finite type between adic spaces
(Huber96 (1.6.2)), and on the charts the maps `A' → A_k` are of topologically finite type. Global
form: once the coherent sheaf `Ω¹_{X_S/Y_S}` is glued from the modules `Ωᶜ` in AdicSpacesPartIII layer R3 (which takes
this chart statement as an input), these isomorphisms glue to the unique isomorphism
`Ω¹_{X_S/Y_S} ≅ O_{X_S} ⊗_{q_X⁻¹O_X} q_X⁻¹Ω_{X/Y} = (Ω_{X/Y})^ad` compatible with the universal
derivations; that gluing is stated and proved in AdicSpacesPartIII layer R3, so that the chart statement does not
depend on AdicSpacesPartIII layer R3 (Zavyalov24 §5, proof of Lem. 5.9, p. 11, continuous differentials of adic
spaces and their generators by differentials of ideal generators, Huber96 1.6.9; Huber96 §1.6,
before Prop. 1.6.7, p. 79, the differential calculus "as for schemes", which is the method of the
chart comparison; more explicitly, Huber96 (1.6.2)(i), p. 76, presents the continuous module
by the same generators and differentiated relations as the algebraic module, and
Prop. 1.6.3(iv), p. 77, gives rational-localisation compatibility).
`AdicSpace.analyticDifferentials.comparison` is the composite of Mathlib's
`KaehlerDifferential.mapBaseChange`, `KaehlerDifferential.map` and the R0 map
`ContinuousKaehlerDifferential.fromKaehler`, with an explicit adic coefficient map
`A → D` between the complete Huber rings. `comparison_tmul_D` fixes its characteristic
equation, and `comparison_chart` states bijectivity on `chartRing` with its quotient topology.
It assumes the complete Hausdorff noetherian-type base and pins the chart's algebra structures
by their values on base coefficients and polynomial classes.
`Ω_{A^{n,ad}/Spa K}` is free on `dT₁,…,dTₙ`; for `h` unramified,
`Ω_{X^ad/Y^ad} = 0`; for `X = Spec K[x,y]/(y² − x³ − ax − b)` smooth (`char K ≠ 2`),
`Ω_{X^ad/Spa K}` is invertible, generated by `dx/(2y)` where `y` is invertible. *Needs:*
*scheme-fibre-product-analytification*; *affine-chart-analytification*;
*continuous-differentials* (layer R0); Mathlib `KaehlerDifferential`, `KaehlerDifferential.D`,
`KaehlerDifferential.mvPolynomialBasis`,
`KaehlerDifferential.exact_kerCotangentToTensor_mapBaseChange`,
`KaehlerDifferential.tensorKaehlerEquiv`.
Lean: README target.

**Checks for the differential comparison map.** `analyticDifferentials_test_zeroVariables`
is the map between two zero modules for `C = B'` and `A_k = A'` (the Check uses `K`);
`analyticDifferentials_test_oneVariable` sends `1 ⊗ dT` to the basis vector `dT` on each disc
chart of the affine line. `analyticDifferentials_test_twoCoordinates` uses
`S₁ ↦ T₁ + T₂²`, `S₂ ↦ T₂`: the images are `dT₁ + 2T₂ dT₂` and `dT₂`. The matrix on column
vectors is `[[1,0],[2T₂,1]]`, with determinant one, including characteristic two.
The one- and two-coordinate Checks use the unit-radius Tate charts, with the algebra
map explicitly equal to `TateAlgebra.ofMvPolynomial`; the first also checks that `dT ≠ 0`.
All three Checks apply the specified comparison map.

**Analytification preserves étale, smooth and unramified morphisms.**
(*analytification-etale-smooth*) Let `h : X₁ → X₂` be a morphism of schemes locally of finite type
over `Y` and `S → Y` as in *scheme-fibre-product-analytification*. The mixed fibre products and
`h_S : X₁ ×_Y S → X₂ ×_Y S` exist for `S` locally noetherian with stably sheafy charts, the
hypotheses of that construction, which are not changed here. Preservation of the étale and smooth
predicates of layer R0 needs more, because those predicates contain local finite presentation
(*locally-finite-presentation*), whose witness charts are in Huber's standing class: assume in
addition `hStd : IsLocallyHuberStandard S` (*locally-huber-standard*), which implies the
noetherian-type and stable-chart inputs (`IsLocallyHuberStandard.isLocallyNoetherian`,
`IsLocallyNoetherian.isStablySheafy`). For an affinoid base, the targets
`AdicSpace.analytification.etale` and `AdicSpace.analytification.smooth` assume
`hStd : IsLocallyHuberStandard A.spa` (local standardness of the base space, not membership of
the global ring `A.ring` in the class), together with `AlgebraicGeometry.Etale f.hom.left` or
`AlgebraicGeometry.Smooth f.hom.left`, respectively, for a morphism `f` in `SchemeOver A`; the
unramified statement keeps the construction's hypotheses only, since `Unramified` has no
finite-presentation conjunct.
Prove that if `h` is étale (resp. smooth) and `S` is locally Huber-standard, resp. if `h` is
unramified, then `h_S` is étale (resp. smooth, resp. unramified) in the sense of Huber96
Definition 1.6.5 (*differentials-unramified-smooth-etale*, *smooth-morphism*,
*unramified-morphism*, layer R0): the mixed products are locally of finite type over `S`, so
they are locally Huber-standard too (*locally-huber-standard*), and the R0.16–R0.17 package
applies with its hypotheses. In particular, for `K`-schemes locally of finite type, `h` étale
/ smooth / unramified implies `h^ad` étale / smooth / unramified, and a smooth `X` of pure dimension
`d` gives `X^ad` smooth over `Spa K` with `Ωᶜ_{O(U)/K}` finite projective of rank `d` on every chart
`U` (so `Ω¹_{X^ad/Spa K}`, glued in AdicSpacesPartIII layer R3, is locally free of rank `d`) (Huber96 §1.7,
Prop. 1.7.1, p. 80, the Jacobian criterion for étaleness of `Spa B/I` used on the charts; Huber96
§1.7, Cor. 1.7.3, pp. 85–86, which concerns exactly `X^ad := X ×_{Spec D} Spa A`, part (i) being
the étale case; smoothness also uses Huber96, Propositions 1.6.7 and 1.6.9, p. 79;
these Huber96 statements are under (1.1.1), p. 37;
Conrad-IC Appendix A.2, Thm A.2.1(1), p. 33, the rigid analogue). For `n`
invertible in `K`, the Kummer map `G_m → G_m`, `x ↦ xⁿ`, is finite étale and its analytification
`A^{1,ad} \ {0} → A^{1,ad} \ {0}` is finite étale. For `P ∈ K[X]` the étale `K`-algebra
`K[X]_{P'}/(P)` analytifies over the disc `{|X| ≤ |ϖ|^{-k}}` to the locus `{P' ≠ 0}` of
`Spa(K⟨ϖ^k X⟩/(P))` (open, and here also closed), i.e. to the simple roots of `P` in that disc, not
to the whole quotient: over `ℚ_3`, `P = X²(X − 1)` has `P' = 3X² − 2X`, so `K[X]_{P'}/(P) ≅ K` (the
simple root `1`) analytifies to one reduced point, while on the unit disc
`K⟨X⟩/(P) ≅ K[ε]/(ε²) × K` keeps the double point at `0`. If `P'` is a unit modulo `P` (`P` monic
separable, so `(P, P') = 1`), e.g. `P = X² − a` with `a, 2 ∈ K^×`, the localisation changes nothing
and the analytification over the chart is `Spa` of `K⟨ϖ^k X⟩/(P)` itself, the finite étale algebra
of the roots of `P` of absolute value `≤ |ϖ|^{-k}`, étale by the Jacobian criterion; the ramified
map `T ↦ T²` (`char K ≠ 2`) is étale away from `0`, and its analytification is étale exactly away
from the point `0`. *Needs:* *scheme-fibre-product-analytification*;
*affine-chart-analytification*; *analytic-kahler-differentials*; *etale-local-structure*,
*differentials-unramified-smooth-etale*, *smooth-morphism*, *unramified-morphism*,
*open-embedding-etale*, *immersion-unramified*, *jacobian-criterion-closed-subspace*,
*restricted-power-series-smooth*, *closed-adic-subspaces-and-embeddings*,
*continuous-differentials* (all layer R0); Mathlib
the local standard smoothness of smooth morphisms of schemes (in `AlgebraicGeometry.Smooth`),
`Algebra.IsStandardSmooth`, `Algebra.SubmersivePresentation`, the standard smooth characterisation of
étale algebras (in `Algebra.Etale`), `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Smooth`.
Lean: README target.

For an affinoid `A` with `hA : HasStablySheafyCharts A.spa` and a morphism
`f : X → Y` in `SchemeOver A`, `AdicSpace.analytification.unramified` assumes
`AlgebraicGeometry.FormallyUnramified f.hom.left` and concludes
`Unramified ((analytificationFunctor A hA).map f).left`. The objects are locally of finite
type over `Spec A.ring`, so `f.hom.left` is locally of finite type and the formal hypothesis
expresses unramifiedness here. The open-diagonal criterion (Huber96, Proposition 1.6.8,
p. 79), together with preservation of fibre products and open immersions, gives the relative
statement alongside `AdicSpace.analytification.etale` and `AdicSpace.analytification.smooth`.

**Checks.**

- *analytification_etale_identity_implication* (structural) — for every adic space `S`,
  `LocallyOfFinitePresentation (𝟙 S) → IsLocallyHuberStandard S`: a witness chart for the identity
  has a standard target chart, and the commuting square `source.ι ≫ 𝟙 S = map ≫ target.ι` puts
  the point in the image of that target chart. Hence `Etale (𝟙 S)` and `Smooth (𝟙 S)` fail for
  every `S` that is not locally Huber-standard (a Lean `example`, proved, after
  `LocallyOfFinitePresentation`).
- *analytification_etale_fibre_product_base* (non-example for the hypothesis) — for
  `A = ℤ_p ×_{𝔽_p} E` of *etale-standing-class-control* and `S = Spa(A, A)`, the mixed
  analytification of `id_{Spec A}` exists and is `id_S` (`S` is locally noetherian with stably
  sheafy charts, so the construction applies), but `S` is not locally Huber-standard at `∞`
  (*locally-huber-standard*), so `S` fails the hypothesis `hStd` and the theorem does not apply;
  consistently, `id_S` is not `Etale` in the sense of R0 by the previous Check. The hypotheses `hA` and `hN` alone do not imply `Etale (𝟙 S)`, since `S` is not
  locally Huber-standard.
- *analytification_etale_identity_padic*, *analytification_etale_identity_field* (positive
  controls) — over `S = Spa(ℤ_p, ℤ_p)` (non-analytic, discrete-free standard regime through the
  noetherian ring of definition) and over `Spa(K, K°)` (analytic standard regime), `S` is locally
  Huber-standard and the identity analytifies to the identity, which is étale and smooth.
- *analytification_etale_locality* (positive locality control) — for the direct product
  `ℤ_p × E` of *etale-standing-class-product-control*, `Spa(ℤ_p × E) = Spa(ℤ_p) ⊔ Spa(E)` is
  locally Huber-standard although its global ring is not in the class; the theorem applies to it
  through its component charts, so the hypothesis is local standardness, never standardness of
  the whole coefficient ring.
- The consumers that infer the scoped predicates through this target are over a complete
  rank-one field: *analytification-reflects-etale-smooth* and *analytification-group-objects* work over
  `Spa(K, K°)`, which is locally Huber-standard, and the relative polydisc and algebraic étale
  chart Checks of R1.1–R1.3 are over such a base as well; the derivative-localisation Check
  (`P = X²(X − 1)` over `ℚ_3`) above is unchanged.

### R1.5 local rings, constructible sets, connectedness

**At a classical point, the local ring of `X^ad` has the same completion as the local ring of
`X`.** (*analytification-completed-local-rings*) Let `X` be a `K`-scheme locally of finite type
(`K` complete of rank one), `x ∈ X^ad` a classical point (`k(x)` finite over `K`) and
`x₀ = q_X(x)` the corresponding closed point (*analytification-points*). Prove that `O_{X^ad,x}`
is a noetherian local ring, that `q^♯_x : O_{X,x₀} → O_{X^ad,x}` is a local homomorphism inducing an
isomorphism of residue fields and an isomorphism of completions `Ô_{X,x₀} ≅ Ô_{X^ad,x}`; in
particular the Zariski cotangent spaces `m_{x₀}/m_{x₀}² ≅ m_x/m_x²` agree and
`dim O_{X,x₀} = dim O_{X^ad,x}` (Conrad-IC Appendix A.1, Lem. A.1.2(1)–(2), p. 32; Conrad-Adic §3,
discussion after Ex. 3.15, p. 16, stalks of `r_K(X)` at classical points are the rigid local
rings; Huber93 §4, Cor. 4.2, p. 473). At the origin of `A^{1,ad}_K`, `O_{X^ad,0}` is the ring of
power series converging on some disc around `0`, strictly between `K[T]_{(T)}` and `K[[T]]`, and
both complete to `K[[T]]`; for the node `y² = x²(x + 1)` (`char K ≠ 2`) the completed local ring of
`X^ad` at the origin is `K[[x, y]]/(y² − x²(x+1))`, which is not a domain although `O_{X,0}` is.
*Needs:* *analytification-points*; *analytification-functor*; *rigid-adic-comparison-functor*;
*rigid-local-ring-completion* (RigidAnalyticGeometry Layers 3–4);
*classical-points-constructible-density* (RigidAnalyticGeometry §8.2);
*gerritzen-grauert* (RigidAnalyticGeometry Layers 3–4); *tate-algebra-maximal-ideals-polynomial*
(RigidAnalyticGeometry §0.1, using RestrictedPowerSeries §§5.2, 6.2); Mathlib `IsLocalRing.CotangentSpace`,
`AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `Algebra.HasGoingDown.of_flat`,
`Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`; Tau Ceti
`TauCeti.AlgebraicGeometry.ZariskiCotangentSpace`.
Lean: README target.

**Closures of constructible sets are compatible with analytification; closedness is detected on
`X^ad`.** (*analytification-constructible-closure*) Let `X` be a `K`-scheme locally of finite type
(`K` complete of rank one) and `T ⊆ X` a locally constructible subset (for instance the image of an
immersion). Prove `q_X⁻¹(closure(T)) = closure(q_X⁻¹(T))` in `X^ad`; consequently `T` is closed
(resp. open, resp. dense) in `X` iff `q_X⁻¹(T)` is closed (resp. open, resp. dense) in `X^ad`
(Conrad-IC Appendix A.1, Thm A.1.3(2)–(3), p. 33, the rigid analogue with the naive topology on
`X^an`; Huber93 §4, Cor. 4.2, p. 473, density of classical points in the constructible topology;
Stacks Tag 005Z (Topology, Lem. 5.18.7), constructible sets of a Jacobson space are controlled by
closed points). The image of the diagonal of the affine line with doubled origin is not closed, and
neither is its preimage in the analytification of the self-product — this is how non-separatedness
is seen on `X^ad`; for `T = G_m ⊆ A¹_K`, `q⁻¹(T) = A^{1,ad} \ {0}` is open and dense but not
closed. *Needs:* *analytification-points*; *analytification-immersions*;
*analytification-completed-local-rings*; *affinoid-jacobson* (RigidAnalyticGeometry §1.1),
*affinoid-residue-fields-finite* (RigidAnalyticGeometry §1.2).
`AdicSpace.analytification.constructible_closure` carries the complete nontrivially
valued rank-one field `K`, locally finite-type `K`-scheme `X`, and locally constructible `T`;
it states `q_X⁻¹(closure T) = closure (q_X⁻¹ T)` for the specified scheme projection.

Lean: README target.

**A finite locally free surjection of adic spaces locally of finite type over `Spa K` is an
effective epimorphism.** (*finite-locally-free-quotient*) Let `K` be complete of rank one and
`p : X → Y` a morphism of adic spaces locally of finite type over `Spa K` that is finite, surjective
and locally free (for every open affinoid `V ⊆ Y`, `p⁻¹(V)` is affinoid and `O(p⁻¹V)` is a finite
projective `O(V)`-module). Prove that for every adic space `Z` locally of finite type over `Spa K`,
composition with `p` is a bijection from `Hom_{Spa K}(Y, Z)` onto the set of morphisms `h : X → Z`
with `h ∘ pr₁ = h ∘ pr₂` on `X ×_Y X`; i.e. `Y` is the coequaliser of `X ×_Y X ⇉ X` in
`Adic^{lft}_K` (Conrad-RA §4.2, Cor. 4.2.5, the rigid analogue: representable functors are sheaves
for faithfully flat maps with local fpqc quasi-sections; Conrad-RA §4.2, Thm 4.2.2, analytified
faithfully flat maps admit local fpqc quasi-sections; Stacks Tag 023M (Descent, Lem. 35.3.6),
exactness of the Amitsur complex for faithfully flat ring maps). The statement is not claimed for
test objects `Z` outside `Adic^{lft}_K`. The proof is local on `Y`: on an affinoid `V` the map
`O(V) → O(p⁻¹V)` is finite projective with `Max O(p⁻¹V) → Max O(V)` surjective, hence faithfully
flat, the Amitsur complex gives `O(V)` as the equaliser, and the plus rings are the power-bounded
subrings on both sides (*tft-plus-ring-power-bounded*), so a function on `p⁻¹V` that is
power-bounded and `X ×_Y X`-invariant descends to a power-bounded function on `V`. Surjectivity
cannot be dropped: `∅ → Spa K` is finite and locally free (of rank `0`), `∅ ×_{Spa K} ∅ ⇉ ∅` has
coequaliser `∅`, and `Hom(Spa K, Spa(K × K))` has two elements while `Hom(∅, Spa(K × K))` has
one. For the Kummer covering `G_m^ad → G_m^ad`, `x ↦ xⁿ` (`n`
invertible), functions on `G_m^ad` invariant under `μ_n`-translation descend; the finite surjection
`Spa(K[T]/(T²)) → Spa K` is locally free, and `Spa K` is its coequaliser (an element `a + bε` with
`a + bε ⊗ 1 = 1 ⊗ (a + bε)` in `K[ε] ⊗_K K[ε] = K[ε₁, ε₂]` has `b = 0`). *Needs:*
*finite-morphism*, *fibre-products-existence*, *affinoid-fibre-product*, *finite-morphisms*,
*fibre-product-points*, *finite-algebra-over-affinoid*, *finite-algebra-tensor-complete* (all layer
R0); *affinoid-homomorphism-continuous* (RigidAnalyticGeometry §1.1);
*tft-plus-ring-power-bounded*; Mathlib
`Module.FaithfullyFlat`.
Lean: README target.

**`X` is connected iff `X^ad` is connected.** (*analytification-connected*) A `K`-scheme `X` locally
of finite type is connected iff its analytification is connected. Supplied by RigidAnalyticGeometry §8.1. The supplier states it
for the rigid analytification `X^an`; this roadmap transports it to `X^ad` along `r_K(X^an) ≅ X^ad`
(*rigid-analytification-comparison*), since `r_K` identifies the open and closed subsets of `X^an`
with those of `r_K(X^an)` (*rigid-adic-topos-equivalence*), so that `T ↦ q_X⁻¹(T)` is a bijection
from the open and closed subsets of `X` to those of `X^ad`; `A^{1,ad}_K` is connected and locally
connected (Zavyalov24 Lemma 2.2) although its subspace of classical points is totally disconnected.
*Needs:* *rigid-analytification-comparison*; *rigid-adic-topos-equivalence*;
*analytification-points*.
Lean: README target.

### R1.6 separatedness and properness

**The analytified projective space `P^{n,ad} → Spa K` is proper; relatively `(P^n_Y)^ad → Y^ad` is
proper.** (*analytic-projective-space-proper*) Let `K` be complete of rank one. Prove that for
every `n ≥ 0` the morphism `(P^n_K)^ad → Spa(K, K°)` is proper in Huber's sense
(*universally-closed-and-proper-morphism*, layer R0), and that `(P^n_K)^ad` is covered by the
`n+1` closed unit polydiscs `D_i = {|T_j| ≤ |T_i| for all j}`, `i = 0,…,n`. For a `K`-scheme `Y`
locally of finite type, `(P^n_Y)^ad ≅ (P^n_K)^ad ×_{Spa K} Y^ad → Y^ad` is proper. Relatively, for
a scheme `Y` and an analytic adic space `S` satisfying Huber's condition with a morphism `S_ → Y`,
`P^n_Y ×_Y S → S` is proper; over an affinoid `Spa(A, A⁺) ⊆ S` it is covered by the `n+1` relative
closed unit polydiscs `Spa(A⟨T_j/T_i⟩, A⟨T_j/T_i⟩⁺)`, where `A⟨T_j/T_i⟩⁺` is the integral closure
in `A⟨T_j/T_i⟩` of `A⁺⟨T_j/T_i⟩`, the series with coefficients in `A⁺` — the chart pair of
*affine-chart-analytification* with `k = 0` (Conrad-AWS §3.2, Ex. 3.2.5, rigid
projective space is proper by relative compactness of the polydisc covers; Hübner §4, Ex. 4.5,
p. 19, global functions on the adic projective line are constants; Conrad-RA §2.3,
Ex. 2.3.11, relative analytification carries projective schemes to proper rigid spaces).
`AdicSpace.projectiveSpace.relative_proper` states properness of
`P^n_R ×_{Spec R} S → S` for a commutative ring `R` and an analytic adic space `S`
with stably sheafy charts and a morphism `S_ → Spec R`
(Huber96 §5.7, Lemma 5.7.3(ii), p. 317 (setting (5.7.1));
Zavyalov24 Remark 6.3, p. 13).
For a Tate affinoid `A` with `hA : HasStablySheafyCharts A.spa`,
`AdicSpace.projectiveSpace.analytic_proper` supplies these charts on
`P := analytification A hA (projectiveSpace.over A n)`. Put
`G := MvPolynomial.homogeneousSubmodule (Fin (n + 1)) A.ring`.
Alongside the topological ring isomorphisms `e i : A⟨T₁,…,Tₙ⟩ ≃ (c i).affinoid.ring`,
it supplies `θ i : HomogeneousLocalization.Away G (X i) →+* (c i).affinoid.ring` satisfying
`forget (c i).ι ≫ P.snd = (c i).affinoid.toSpec ≫ Spec(θ i) ≫ Proj.awayι G (X i)`
as morphisms of locally ringed spaces. For `j : Fin n`, with `i.succAbove j` enumerating
the homogeneous coordinates other than `i`, the equation
`θ i (X_(i.succAbove j)/X_i) = e i (T_j)` fixes the polydisc coordinates;
the fraction is Mathlib's `HomogeneousLocalization.Away.mk` with exponent one.
Together with the base-map and plus-ring equations, this identifies the charts with the
specified homogeneous-coordinate domains (Conrad-AWS §2.4, Example 2.4.4, p. 20).
`P^{1,ad}_K` is the union of two closed unit discs glued along the annulus `{|T| = 1}`; it is
proper by the preceding comparison, and `O(P^{1,ad}_K) = K` (Hübner Ex. 4.5, p. 19); the open subspace `A^{1,ad} ⊆ P^{1,ad}` is not closed,
its complement being the classical point `∞`. *Needs:* *analytic-affine-space*;
*analytification-points*; *scheme-fibre-product-analytification*;
*analytification-fibre-products*; *analytification-immersions*;
*rigid-analytification-comparison*; *proper-separated-comparisons*;
*universally-closed-and-proper-morphism*, *separated-proper-partially-proper*,
*proper-base-change* (layer R0); Mathlib `AlgebraicGeometry.Proj.isSeparated`.
`AdicSpace.analytification_proj_proper` carries a complete strongly noetherian Tate
pair `A` and a finitely generated graded `A`-algebra with degree-zero ring `A`.
It states that relative analytification of its `Proj` over `A.spa` is proper,
using a graded presentation as a closed subspace of relative projective space
(Huber96 §5.7, Lemma 5.7.3(ii), p. 317; Zavyalov24 §7).

Lean: README target.

For a strongly noetherian Tate affinoid `A`, the target also treats `Proj B` for an
`ℕ`-graded algebra finite type over its degree-zero ring, identified with `A`.
It asserts properness of the projection of the Part II `schemePullback`;
the standard polynomial grading recovers projective space
(Huber96 §5.7, Lemma 5.7.3(ii), p. 317 (setting (5.7.1));
Zavyalov24 Remark 6.3, p. 13).

**Separatedness and properness comparison: `f` is separated (proper) iff `f^ad` is.**
(*analytification-separated-proper*) Let `f : X → Y` be a morphism of `K`-schemes locally of finite
type (`K` complete of rank one). Prove: (i) `f` is separated iff `f^ad` is separated
(*separated-morphism*, layer R0). (ii) If `f` is proper then `f^ad` is proper
(*universally-closed-and-proper-morphism*). (iii) If `f` is of finite type (quasi-compact) and
`f^ad` is proper, then `f` is proper; the quasi-compactness in (iii) is needed: for
`X = ⨆_{m ≥ 0} Spec K → A¹_K` sending the `m`-th point to `T = ϖ^{-m}`, the analytification is
the closed embedding of the discrete closed subset `{ϖ^{-m} : m ≥ 0}` (each chart
`{|T| ≤ |ϖ|^{-k}}` meets only the `k + 1` points with `m ≤ k`), hence proper
(*closed-embedding-proper*), while `f` is not quasi-compact and not proper. In particular a
`K`-scheme `X` of finite type is separated (resp. proper) iff `X^ad` is separated (resp. proper)
over `Spa(K, K°)`; for instance `P^{n,ad}` is proper and `A^{1,ad}` is separated but not proper.
(ii′) Relatively: for a proper morphism `f : X → Y` of schemes and an analytic adic space `S`
satisfying Huber's condition with `S_ → Y`, the projection `X ×_Y S → S` is proper; the forward
direction of (i) also holds relatively (Conrad-RA Appendix A.1, p. 38, the rigid statement of the
properness comparison, Berkovich and Temkin; Conrad-MR §1.3, Notation and terminology, p. 2, the
rigid comparison that the analytification of a map of locally finite type `K`-schemes is
quasi-separated iff the scheme map is separated; Zavyalov24 §6, Rem. 6.3, p. 13, the adic forward direction for
relative analytification over a strongly noetherian Tate affinoid, citing Huber96 Lemma 5.7.3;
the scheme valuative criterion and the adic specialization criterion of R0.12,
applied to valuation rings and their centers in (ii) and (iii);
Stacks Tag 03GN (Morphisms, Lem. 29.42.9), universal closedness descends along surjections).
`AdicSpace.analytification.proper` states the forward properness implication for
morphisms of schemes locally of finite type over a Tate affinoid `A` with
`hA : HasStablySheafyCharts A.spa`
(Huber96 §5.7, Lemma 5.7.3(ii), p. 317 (setting (5.7.1), with analytic base);
Zavyalov24 Remark 6.3, p. 13).
`P^{n,ad}_K → Spa K` is proper and `A^{1,ad}_K` is separated but not proper (not quasi-compact);
the affine line with doubled origin analytifies to a non-separated adic space, the diagonal image
`q⁻¹(Δ(X))` not being closed; for an abelian variety `A` over `K` (Tau Ceti
`TauCeti.AlgebraicGeometry.AbelianVariety`), `A^ad` is proper over `Spa(K, K°)`. *Needs:*
*universally-closed-and-proper-morphism* (R0); *scheme-fibre-product-analytification*;
*analytification-fibre-products*;
*analytification-immersions*; *analytification-constructible-closure*;
*analytification-surjective*; *analytic-projective-space-proper*; *separated-morphism*,
*universally-closed-and-proper-morphism*, *finite-type-morphism-classes*, *fibre-product-points*,
*separated-proper-partially-proper*, *closed-embedding-proper*, *proper-comp*,
*proper-of-comp-separated*, *universally-closed-of-surjective*, *proper-base-change* (all
layer R0); Mathlib `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.IsProper`,
`AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.UniversallyClosed`.
`AdicSpace.analytification.separated_iff` carries a morphism of locally finite-type
schemes over the complete nontrivially valued rank-one field `K`, and states that the
scheme morphism is separated iff its adic analytification is separated.

Lean: README target.

**For `f` of finite type: `f` is finite (resp. a closed immersion) iff `f^ad` is.**
(*analytification-reflects-finite-closed-immersion*) Let `f : X → Y` be a morphism of finite type
(quasi-compact) between `K`-schemes locally of finite type (`K` complete of rank one). Prove that
`f` is finite iff `f^ad` is finite (*finite-morphism*, layer R0), and `f` is a closed immersion iff
`f^ad` is a closed embedding (*closed-adic-subspaces-and-embeddings*) (Conrad-IC Appendix A.2,
Thm A.2.1(2), p. 33; Stacks Tag 02OG (Cohomology of Schemes, Lem. 30.21.1), proper with finite
fibres over a locally noetherian base is finite; Huber96 §1.4, Lem. 1.4.5, pp. 61–62, finite
morphisms and closed embeddings are proper). The normalisation of the cuspidal cubic
`A¹ → V(y² − x³)`, `t ↦ (t², t³)`, is finite and bijective but not a closed immersion; its
analytification is finite, bijective on points and not a closed embedding (the stalk map at the
cusp is not surjective); `G_m → A¹` is not finite, and neither is its analytification (the
preimage of the unit disc is not affinoid). *Needs:* *analytification-finite*;
*analytification-points*; *analytification-immersions*; *analytification-separated-proper*;
*analytification-fibre-products*; *analytification-of-modules*;
*analytification-completed-local-rings*; *finite-morphisms*, *finite-morphism*,
*closed-embedding-finite*, *closed-adic-subspaces-and-embeddings* (all layer R0); Mathlib
`AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsClosedImmersion`.
`AdicSpace.analytification.finite_iff` and `AdicSpace.analytification.closedImmersion_iff`
carry the complete nontrivially valued rank-one field `K`, a morphism of locally finite-type
`K`-schemes and its quasi-compactness hypothesis, and identify scheme finiteness,
respectively closed immersion, with the corresponding property of its adic analytification.

Lean: README target.

**`f` is étale (resp. smooth) iff `f^ad` is.** (*analytification-reflects-etale-smooth*) Let
`f : X → Y` be a morphism of `K`-schemes locally of finite type (`K` complete of rank one). Prove
that `f` is étale (resp. smooth, resp. unramified) iff `f^ad` is étale (resp. smooth, resp.
unramified) in the sense of Huber96 Definition 1.6.5 (Conrad-IC Appendix A.2, Thm A.2.1(1),
p. 33; Stacks Tag 01V9 (Morphisms, Lem. 29.35.14), smoothness at a point from flatness and
smoothness of the fibre; Huber96 §1.7, Prop. 1.7.5, p. 87, adic étale = flat + unramified for
analytic adic spaces). The Frobenius-type map `A¹ → A¹`, `T ↦ T^p` over `K` of characteristic `p`
is flat, not étale, and its analytification is not étale (`Ω_{A^{1,ad}/A^{1,ad}} = O·dT ≠ 0`,
since `d(T^p) = pT^{p−1}dT = 0`); `T ↦ T²`
(`char K ≠ 2`) is not étale at `0` and its analytification is not étale at the classical point `0`.
*Needs:* *analytification-etale-smooth*; *analytification-points*;
*analytic-kahler-differentials*; *analytification-completed-local-rings*;
*analytification-fibre-products*; *etale-flat-unramified*, *flat-morphism*,
*smooth-local-structure*, *smooth-differentials-locally-free*, *smooth-etale-base-change*,
*infinitesimal-criteria* (all layer R0); Mathlib
`AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`, `AlgebraicGeometry.Etale`,
`AlgebraicGeometry.Smooth`.
Lean: README target.

### R1.7 rigid–adic comparison

The naturality of global sections identifies the pullback of a
global section along a rigid morphism with pullback along its image under
`rigidToAdic`, using the canonical `rigidToAdic.sections` isomorphisms
(Huber94 Proposition 4.3).

**Huber's functor `r_K` from rigid-analytic spaces to adic spaces locally of finite type over
`Spa(K, K°)`.** (*rigid-adic-comparison-functor*) The functor `r` from rigid-analytic spaces over
`K` to adic spaces over `Spa(K, K°)`, with `r(Sp A) = Spa(A, A°)` carrying its structure presheaf,
morphisms of affinoids induced by their `K`-algebra maps and the extension to rigid spaces by
pasting, carries affinoid subdomains to open affinoid subspaces and admissible opens and coverings
to opens and open coverings, and identifies the points of `X` with the classical points of `r(X)`
and rational subdomains with the traces of rational subsets. Supplied by RigidAnalyticGeometry
§§8.2–8.3. The supplier owns global fibre-product compatibility and the ringed-topos comparison;
this roadmap supplies the additional ringed-site finality below and writes `AdicSpace.rigidToAdic` (`r_K`) for
the supplier's `r` regarded in `Adic^{lft}_K`, with `rigidToAdic_Sp` (`r_K(Sp A) ≅ Spa(A, A°)`, with
underlying space Tau Ceti's `ValuationSpectrum.spa` of the pair `Huber.Pair.powerBounded A`) and
`rigidToAdic.classicalPointsEquiv` (the points of `X` and the classical points of `r_K(X)`, with
`r_K(U) ∩ X = U`), and states the following on its side. Let `K` be a complete rank-one
nonarchimedean field. For each rigid space `X` there is a morphism of ringed sites
`ρ_X : (|r_K(X)|, O_{r_K(X)}) → (X, O_X)` over `Sp K = Spa K` such that `r_K(X)` is locally of
finite type over `Spa(K, K°)`, `ρ_X` is locally coherent, and `(r_K(X), ρ_X)` is final: for every
adic space `Z` locally of finite type over `Spa(K, K°)` and every locally coherent morphism of
ringed sites `λ : (|Z|, O_Z) → (X, O_X)` over `Sp K` there is a unique morphism `f : Z → r_K(X)`
over `Spa K` with `ρ_X ∘ f = λ` (Huber94 §4, Prop. 4.3, p. 541). Moreover, if `X` is
quasi-separated, `U ↦ r_K(U)` is a bijection from the quasi-compact admissible opens of `X` onto the
quasi-compact opens of `r_K(X)`, under which affinoid opens correspond to affinoid opens (Huber96
§1.1, (1.1.11), p. 43); `r_K` commutes with fibre products (Huber96 §1.1, (1.1.11), p. 43); and a
morphism `f` of rigid spaces is a closed immersion iff `r_K(f)` is a closed embedding
(*closed-adic-subspaces-and-embeddings*, layer R0) (Huber96 §1.4, (1.4.1), p. 60). In `AdicSpace`,
define `rigidToAdic.rho` as the inverse-image functor of `r_K` on opens, `rigidToAdic.sections` as
the section isomorphism, `rigidToAdic.ringedRho` as the locally coherent morphism of ringed sites
`ρ_X` over `Sp K`, natural in `X` by `rigidToAdic.rho_naturality`, and `rigidToAdic.lift` as the
unique morphism `lift λ : Z → r_K X` over `Spa K` with `ρ_X ∘ lift λ = λ` (with `rho_comp_lift` and
`lift_unique`). The bridge `rigidToAdic.preservesPullbacks` transports the supplier’s product comparison (`r_K(X ×_S Y) ≅ r_K(X) ×_{r_K S} r_K(Y)`,
affinoid-locally `Spa(B ⊗̂_A C, (B ⊗̂_A C)°)`, *affinoid-fibre-product*). The other carrier
adapters are `rigidToAdic.locallyOfFiniteType` (for every rigid space `X` the structure morphism
`r_K(X) → Spa(K, K°)` is locally of finite type), `rigidToAdic.quasiCompactOpensEquiv` (for
quasi-separated `X`, `U ↦ r_K(U)` is an order isomorphism from the quasi-compact admissible opens of
`X` onto the quasi-compact opens of `r_K(X)`, carrying affinoid opens to affinoid opens) and
`rigidToAdic.isClosedImmersion_iff` (a morphism `f` of rigid spaces is a closed immersion iff
`r_K(f)` is a closed embedding of adic spaces). `r_K(B¹)` is the adic closed unit disc, whose
non-classical points (e.g. the Gauss point) are not points of the rigid disc. *Needs:*
*rigid-analytic-space* (RigidAnalyticGeometry §6.2); *tft-plus-ring-power-bounded*;
*affinoid-fibre-product*, *closed-adic-subspaces-and-embeddings* (layer R0);
*affinoid-homomorphism-continuous* (RigidAnalyticGeometry §1.1);
*classical-points-constructible-density* (RigidAnalyticGeometry §8.2); *gerritzen-grauert* (RigidAnalyticGeometry Layers 3–4); Tau Ceti
`TauCeti.ValuationSpectrum.spa`, `TauCeti.Huber.Pair.powerBounded`, `TauCeti.Huber.Pair.quotient`,
`TauCeti.ValuationSpectrum.rationalSubset`.
Lean: README target.

**Checks.**

- *Degenerate.* `r_K(Sp K) ≅ Spa(K, K°)` has exactly one point.
  Under `rigidToAdic.classicalPointsEquiv`, `ρ` preserves membership in each admissible open;
  under `rigidToAdic_Sp`, its section map sends every `a ∈ K` to the same coefficient.
  These equations express the identity of the one-point ringed site.
- *Compatibility.* `ofRigidAffinoid K (RigidSpace.Affinoid.polydisc K 1)`
  uses `Huber.Pair.powerBounded`. Its plus ring is also the closure of the power-bounded
  subring of the uncompleted restricted-series ring. The homeomorphism from the underlying
  space of `r_K(Sp K⟨T⟩)` to `ValuationSpectrum.closedPolydisc 1 K` restricts valuations along
  the completion map after `rigidToAdic_Sp` (Wedhorn Proposition 7.48, p. 68).
  For the smaller plus ring `A⁺ = integral closure of K° + A°°`, the Check exhibits
  `x_{>1} ∈ Spa(A,A⁺)` with `|T(x_{>1})| > 1`, hence outside `Spa(A,A°)`
  (Wedhorn Example 7.57, p. 72).
- *Computation.*
  `r_K(Sp K⟨T₁⟩ ×_{Sp K} Sp K⟨T₂⟩) ≅ Spa(K⟨T₁,T₂⟩, K⟨T₁,T₂⟩°)`.
  The images of the two rigid projections form a pullback square over `Spa(K,K°)`,
  giving the second identification with the product of the two adic discs. The statement
  uses `Affinoid.spa` and explicitly fixes its pair to `Huber.Pair.powerBounded`
  (Conrad-AWS Example 2.4.5, p. 20; the comparison is `rigidToAdic.preservesPullbacks`).

The input to `rigidToAdic.lift` is `rigidToAdic.RingedSiteHom K X Z`, for a rigid
space `X` and `Z : AdicOver K`. It consists of an inverse-image functor preserving the
whole open, intersections and admissible covers, and a natural map of section rings
respecting `AdicOver.scalars`. Local coherence means that, over each affinoid admissible
open `U`, intersecting a quasi-compact open `W ⊆ λ(U)` with `λ(V)` is quasi-compact whenever
`V ⊆ U` is quasi-compact admissible. No global quasi-compactness of `Z → X` is assumed.
The section map of an arbitrary `λ` need not be an isomorphism; the canonical
`rigidToAdic.ringedRho` uses `rigidToAdic.sections`, which is an isomorphism.
`rigidToAdic.rho_comp_lift` states the factorization on opens and section homomorphisms;
`rigidToAdic.lift_unique` requires both equalities and concludes equality of morphisms over
`Spa(K,K°)` (Huber94, Proposition 4.3, pp. 541–542). `rigidToAdic.locallyOfFiniteType`
exposes the structural property of the codomain `AdicOver K`.

`rigidToAdic.classicalPointsEquiv` uses the residue field of the supplied adic local stalk.
Its predicate is finiteness of the structural map from `K`, expressed by `RingHom.Finite`;
it does not choose an unrelated algebra structure. `rigidToAdic.classicalPointsEquiv_mem`
identifies the trace of each `ρ_X(U)` with `U`.
`rigidToAdic.quasiSeparatedSpace_iff` identifies `QuasiSeparatedSpace (r_K X)` with
quasi-compactness of intersections of quasi-compact admissible opens of `X`.
Under this hypothesis, `rigidToAdic.quasiCompactOpensEquiv_apply` identifies the order
isomorphism with `rigidToAdic.rho`, and `rigidToAdic.quasiCompactOpensEquiv_affinoid`
identifies affinoid opens on the two sides, using the supplied adic restriction carrier
(Huber96, (1.1.11), pp. 42–43).

**Checks for ringed-site finality and the point/open correspondences.** The identifiers
are suggested names for the accompanying Checks.

| Definition | Checks |
|---|---|
| `AdicOver.scalars` | `AdicOver.scalars_point`: global scalars on `r_K(Sp K)` are bijective; `AdicOver.scalars_empty`: on the empty open, `1` maps to `0`; `AdicOver.scalars_disc`: constants in the disc are injective but do not exhaust its functions. |
| `rigidToAdic.RingedSiteHom` | `rigidToAdic.RingedSiteHom_emptyOpen`: the empty admissible open maps to the empty open; `rigidToAdic.RingedSiteHom_noConstantTop`: for nonempty `Z`, sending every open to the whole space cannot define a morphism of sites; `rigidToAdic.RingedSiteHom_emptySource`: all pulled-back sections on an empty source are zero. |
| `rigidToAdic.ringedRho` | `rigidToAdic.ringedRho_empty`: the empty open is preserved; `rigidToAdic.ringedRho_sections`: every section map is bijective; `rigidToAdic.ringedRho_affinoid`: a quasi-compact admissible open in an affinoid has compact adic image. |
| `rigidToAdic.lift` | `rigidToAdic.lift_identity`: lifting the canonical ringed-site morphism gives the identity; `rigidToAdic.lift_empty`: for empty `Z`, the lift equals every morphism `Z → r_K X`; `rigidToAdic.lift_twoTerms`: pullback of the image of `a+b²` is `λ(a)+λ(b)²`, fixing the order of section pullbacks. |
| `rigidToAdic.quasiCompactOpensEquiv` | `rigidToAdic.quasiCompactOpensEquiv_empty`: the empty open maps to the empty open; `rigidToAdic.quasiCompactOpensEquiv_whole`: the whole affinoid maps to the whole adic affinoid; `rigidToAdic.quasiCompactOpensEquiv_trace`: the inverse sends a compact open to its trace on classical points. These Checks carry `QuasiSeparatedSpace` explicitly. |

**`r_K` is fully faithful, generates the lft adic spaces, restricts to an equivalence on
quasi-separated objects, and detects affinoids.** (*rigid-adic-quasi-separated-equivalence*) For `K`
complete of rank one, (i) `r_K : Rig_K → Adic^{lft}_K` is fully faithful; (ii) an adic space over
`Spa(K, K°)` is locally of finite type iff it has an open covering by spaces
`r_K(Sp A) = Spa(A, A°)`, so the adic spaces locally of finite type form the smallest class
containing the image of `r_K` and closed under isomorphism, open subspaces and open coverings; (iii)
`r_K` restricts to an equivalence from quasi-separated rigid-analytic spaces onto quasi-separated
adic spaces locally of finite type over `Spa(K, K°)`; and (iv) `r_K(X)` is affinoid iff `X` is. Supplied by
RigidAnalyticGeometry §8.3. The supplier states these contracts for its functor `r` on
rigid spaces; this roadmap reads them for
`AdicSpace.rigidToAdic` from `RigidSpace K` to `AdicOver K` (*rigid-adic-comparison-functor*).

**The rigid and adic ringed topoi agree: `ρ_X` induces an equivalence
`Shv(r_K(X)) ≃ Shv(X)`.** (*rigid-adic-topos-equivalence*) Let `K` be complete of rank one and
`X` a rigid-analytic space over `K`. Consume RigidAnalyticGeometry §8.3’s equivalence of
ringed topoi, using the section comparison of `r_K`. The adapter identifies this equivalence
with the one induced by Part II’s canonical morphism of ringed sites
`ρ_X : (|r_K(X)|, O_{r_K(X)}) → (X, O_X)`
(Huber94 §4, Prop. 4.5(i), p. 543). For `X = Sp(A)`
this is Huber93 Corollary 4.4: sheaves for the Grothendieck topology of rational subdomains of
`Max A` are the same as sheaves on the topological space `Spa(A, A°)` (Huber93 §4, Cor. 4.4,
p. 473). Global sections agree, `Γ(r_K(X), O) = Γ(X, O_X)`, both equal to `A` for `X = Sp A`; on
the closed disc `X = Sp K⟨T⟩`, the sheaf corresponding to the skyscraper sheaf at the Gauss point of
`r_K(X)` is nonzero although its stalks at all points of `X` vanish (each classical point has a
rational neighbourhood avoiding the Gauss point): the rigid topos lacks enough classical points,
while the adic space, a topological space, has enough points. *Needs:*
*rigid-adic-comparison-functor*; *classical-points-constructible-density* (RigidAnalyticGeometry §8.2); *gerritzen-grauert*
(RigidAnalyticGeometry Layers 3–4); *rigid-analytic-space* (RigidAnalyticGeometry §6.2); Mathlib
`CategoryTheory.Functor.IsDenseSubsite`,
`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`.
Lean: supplier README contract with the canonical-ρ adapter specified here.

**Checks.**

- For `X=Sp K`, the section comparison fixes every element of `K`.
- For the empty rigid space, the equivalence identifies the two degenerate sheaf topoi
  and their zero section rings.
- On `Sp K⟨T⟩`, the nonzero sheaf corresponding to the Gauss-point skyscraper has zero
  stalk at every classical point, as described above.

**`r_K(X^an) ≅ X^ad`: the adic space of the rigid analytification is the adic analytification.**
(*rigid-analytification-comparison*) Let `K` be complete of rank one and `X` a `K`-scheme locally
of finite type (no separatedness). Prove that there is a unique isomorphism `r_K(X^an) ≅ X^ad`
over `Spa(K, K°)` compatible with the maps to `X` (`i_X ∘ ρ_{X^an}` and `q_X`).
`AdicSpace.rigidToAdic.analytification_iso` states unique existence of the natural isomorphism
`e : analytificationFunctor ⋙ rigidToAdic ≅ analytificationLftFunctor K`, with
`q_X ∘ e_X = i_X ∘ ρ_{X^an}` as maps of ringed sites. Explicitly, for every Zariski open
`U ⊆ X`, put `V = i_X⁻¹(U)`: the inverse image of `U` under `q_X ∘ e_X` equals
`rho(V)`, and its section homomorphism equals `sections(V) ∘ i_X♯(U)`. The formal `HEq`
transports the section homomorphism across that equality of opens. Thus compatibility
includes functions, excluding an affine-line translation that changes `T` to `T + 1`.
The isomorphism is natural in `X`, and under it the fibre-product isomorphism of `(·)^ad` (*analytification-fibre-products*)
corresponds to `r_K` of the rigid one composed with the fibre-product compatibility of `r_K`
(*rigid-adic-comparison-functor*(e)) — no further fibre-product statement is made (Huber94 §4,
Rem. 4.6(i), p. 543, `r_k(X^an) ≅ X ×_{Spec k} Spa(k, k°)` over `Spa(k, k°)`; Wedhorn §10,
Rem. 10.1, p. 103). For `X = A¹_K`,
`r_K((A¹)^an) = A^{1,ad}_K`, the union of the discs `Spa(K⟨ϖ^k T⟩, K°⟨ϖ^k T⟩)`; the classical
points of `X^ad` are the points of `X^an`, i.e. the closed points of `X` (compatibly with
*analytification-points*). *Needs:* *rigid-adic-comparison-functor*; *rigid-analytification*
(RigidAnalyticGeometry §8.1);
*analytification-functor*; *analytification-universal-property*; *analytification-immersions*;
*analytification-fibre-products*.
Lean: README target.

**Check.** `rigidToAdic.analytification_iso_nonidentity`: for every such `X`, a nonidentity
automorphism of `X^ad` over `Spa(K, K°)` changes the morphism `q_X`. In particular, translating
the affine coordinate by `1` cannot preserve the comparison equation. This follows from
the uniqueness in the mixed fibre-product universal property, and tests the requirement
on individual components of the natural isomorphism.

**Separated, partially proper and proper morphisms of rigid spaces versus their adic counterparts
(Huber96 1.3.19).** (*proper-separated-comparisons*) Separated morphisms of rigid-analytic spaces,
relative compactness `U ⋐_Y V` of affinoid opens over an affinoid base (an affinoid generating
system of `O(V)` over `O(Y)` with `|a_l| < 1` on `U`) and Kiehl-proper morphisms are the rigid
notions compared here. Supplied by RigidAnalyticGeometry §6.3. The supplier defines no partial properness, so
this roadmap defines it from relative compactness and states the comparisons with the adic notions
on its side. Let `f : X → Y` be a morphism of rigid-analytic spaces over `K` (`K` complete of rank
one). Define `RigidSpace.IsPartiallyProper f` as follows. The morphism is separated, and there is an
admissible affinoid covering `(Y_i)` of `Y` such that each `f⁻¹(Y_i)` has an admissible affinoid
covering `(U_ij)` with affinoid opens `V_ij ⊆ f⁻¹(Y_i)` containing `U_ij` and `U_ij ⋐_{Y_i} V_ij`
(Huber96 Remark 1.3.19(i), p. 59). Prove that Kiehl properness is equivalent to quasi-compactness
and this condition. Prove also: (i) `f` is separated iff `r_K(f)` is separated
(*separated-morphism*, layer R0). (ii) If `f` is partially proper then `r_K(f)` is partially proper
(*partially-proper-morphism*); the converse holds when `K°` is discretely valued. (iii) If `f` is
proper then `r_K(f)` is proper (*universally-closed-and-proper-morphism*); the converse holds when
`K°` is discretely valued. (iv) If `f` is locally quasi-finite, the converses in (ii)–(iii) hold for
arbitrary `K` (Huber96 Lemma 1.5.9, stated and proved here from
*partially-proper-quasi-finite-local-finiteness*, Huber's Prop. 1.5.6, and
*maximal-point-closure-rational*, Lem. 1.5.10, both of layer R0; the finiteness criterion
*quasi-finite-and-finiteness-criteria*, Huber's 1.5.5, enters only through them). The converses of
(ii)–(iii) are stated only under the hypothesis `K°` discretely valued, which is the hypothesis of
the source; the proofs of (i) and of the converses are in Huber's habilitation [Hu4, 3.11.21]
(Bewertungsspektrum und rigide Geometrie, Regensburger Mathematische Schriften 23, 1993) and in the
paper of Lütkebohmert that Huber96 cites as [L1], both cited through Huber96, which states (i) as an
equivalence (Huber96 §1.3, Rem. 1.3.19, pp. 59–60, the exact discreteness caveat; Huber96 §1.5, Lem.
1.5.9, pp. 73–75, removal of the discreteness assumption for locally quasi-finite morphisms;
Conrad-AWS §3.2, Ex. 3.2.5, rigid projective space is proper). `r_K` of the inclusion of the open
unit disc into the closed unit disc is partially proper but not proper (not quasi-compact);
`r_K(P^{1,an}) → Spa(K, K°)` is proper, `P^{1,an}` being proper in Kiehl's sense. *Needs:*
*rigid-adic-comparison-functor*; *rigid-analytic-space* (RigidAnalyticGeometry §§6.2–6.3);
*separated-morphism*, *partially-proper-morphism*, *universally-closed-and-proper-morphism*,
*separated-proper-partially-proper*, *partially-proper-quasi-finite-local-finiteness*,
*maximal-point-closure-rational*, *quasi-finite-and-finiteness-criteria*, *quasi-finite-morphism*
(all layer R0).
`AdicSpace.rigidToAdic.separated_iff` carries a morphism of rigid varieties over
complete nontrivially valued `K` and gives equivalence of its supplied rigid separatedness
with separatedness of its image under `r_K`; no discrete-valuation assumption is made.
`RigidSpace.isProper_iff_quasiCompact_and_isPartiallyProper` carries the same morphism
and identifies the supplier's Kiehl properness with quasi-compactness and the locally owned
`IsPartiallyProper` predicate. The bridge `RigidSpace.IsInner` is the supplier's
relative-compactness relation `U ⋐_Y V` (RigidAnalyticGeometry §6.3, with affinoid `U ⊆ V`
over an affinoid base); `RigidSpace.IsQuasiCompact` is its §6.3 predicate, requiring a
finite admissible affinoid cover over each affinoid target open. Neither is a second local
construction.

Lean: README target.

`HasInnerAffinoidCover f finite` records the admissible covering data with the relative
compactness of RigidAnalyticGeometry §6.3; its Boolean argument requires finite coverings
upstairs when true. `IsPartiallyProper` uses this condition with arbitrary admissible coverings
and separatedness, and with finite coverings it is the supplier's Kiehl properness. Thus the
properness comparison above identifies properness with quasi-compact partial properness.

**Checks.** For `HasInnerAffinoidCover`, `IsPartiallyProper`
and `IsProper`, `rigidClasses_test_identity` and `rigidClasses_test_empty` give the identity and
empty-source cases; `rigidClasses_test_closedDisc` gives the negative case of the closed unit
disc over the point. `rigidPartialProper_test_affineLine` tests partial properness without
quasi-compactness on the rigid affine line; `rigidPartialProper_test_openDisc` tests
partial properness without properness on the inclusion of the open disc into the closed disc.
The projective-line comparison Check requires the projective analytification and the adic
comparison functor; its rigid assertion is `P¹ → Sp K` proper.

**Rigid and adic étale, unramified and smooth morphisms agree under Huber's functor.**
(*rigid-adic-etale-comparison*) The original rigid predicate has the stability
contracts `RigidSpace.IsEtale.of_isOpenImmersion`, `RigidSpace.IsEtale.comp`
and `RigidSpace.IsEtale.baseChange`: admissible open immersions are étale,
composites of étale maps are étale, and étaleness is preserved by arbitrary
rigid base change (Huber96 Propositions 1.6.7 and 1.7.11).
Let `K` be a complete rank-one nonarchimedean field (complete for
a nontrivial nonarchimedean absolute value of rank one) and `f : Y → X` a morphism of rigid
analytic spaces over `K` (*rigid-analytic-space*, RigidAnalyticGeometry §6.2), with
`r_K(f) : r_K(Y) → r_K(X)` the morphism of
adic spaces locally of finite type over `Spa K` given by Huber's functor
(*rigid-adic-comparison-functor*). Call `f` étale (resp. unramified) in the rigid sense if for
every point `y` of `Y` the local homomorphism `O_{X,f(y)} → O_{Y,y}` is flat and unramified (resp.
unramified); for affinoids `Y = Sp B → X = Sp A` this means that `A → B` is flat and the universal
finite differential module `Ω^f_{B/A}` vanishes (resp. that `Ω^f_{B/A} = 0`) (dJvdP §3.1,
Observation 3.1.1, p. 19, which continues "and `Ω^f_{O(Y)/O(X)} = 0`"). Call `f` smooth in the
rigid sense if `Y` has an admissible covering by affinoid opens `V`, each mapping into an affinoid
open `W` of `X` and admitting an étale morphism in the rigid sense `V → 𝔹^n_W` over `W` to a
relative closed polydisc; this is equivalent to Huber's pointwise Definition 1.7.10(ii) (for every
point `y`, affinoid neighbourhoods `V` of `y` and `W` of `f(y)` with such a factorisation), which
is the last step of the proof. Prove: (a) `r_K(f)` is étale in Huber's sense
(*differentials-unramified-smooth-etale*, layer R0) iff `f` is étale in the rigid sense; (b)
`r_K(f)` is unramified (*unramified-morphism*) iff `f` is unramified in the rigid sense; (c)
`r_K(f)` is smooth (*smooth-morphism*) iff `f` is smooth in the rigid sense:
`AdicSpace.rigidToAdic.smooth_iff` states
`AdicSpace.Smooth ((AdicSpace.rigidToAdic K).map f).hom.left ↔ RigidSpace.IsSmooth K f`.
`AdicSpace.rigidToAdic.etale_iff` states
`AdicSpace.Etale ((AdicSpace.rigidToAdic K).map f).hom.left ↔ RigidSpace.IsEtale K f`
(Huber96, Definition 1.7.10(i) and Proposition 1.7.11(i), p. 89).
Here `RigidSpace.IsEtale` is the flat-stalk, maximal-ideal-equality and finite-separable-residue
criterion in (a). `RigidSpace.IsSmooth` requires a cover in the strong Tate topology, an
affinoid source restriction on each member, an affinoid target restriction `Sp A`, and a
`RigidSpace.IsEtale` map into `Sp A ×_{Sp K} Sp K⟨T₁,…,Tₙ⟩`. Its composite with the
first projection and target inclusion must equal the restriction of `f`. The number `n` may
vary with the chart, including `n = 0`. These predicates and the comparison theorem have
exactly the field hypotheses above; neither quasi-compactness nor quasi-separatedness is
required (Huber96 Definition 1.7.10 and Proposition 1.7.11(ii), pp. 89–90).
For `K`-affinoid algebras `A → B`, étaleness is equivalent to having
such presentations
locally on source and target: after affinoid restriction,
`B' ≅ A'⟨T₁,…,Tₙ⟩/(G₁,…,Gₙ)` with `det(∂Gᵢ/∂Tⱼ)` invertible in `B'`
(Huber96 Proposition 1.7.1 and Corollary 1.7.2, pp. 80–85;
*etale-local-structure*, layer R0).
(a) and (c) are Huber96 Definition 1.7.10 and Proposition 1.7.11 (printed p. 89), where
Definition 1.7.10(i) defines rigid étale by flatness of `O_{X,x}` over `O_{Y,f(x)}` with
`O_{X,x}/m_{f(x)}O_{X,x}` a finite separable field extension of the residue field, and
1.7.10(ii) defines rigid smooth pointwise by affinoid neighbourhoods `U` of `x` and `V` of `f(x)`
with `U → Sp O_Y(V)⟨T₁,…,Tₙ⟩` étale; (b) is not in Huber's proposition (DLLZ-A §3.2,
Rem. 3.2.15 cite 1.7.11 for it) and is proved here from Huber96 1.6.8 and dJvdP §3.1 (Huber96
§1.7, Def. 1.7.10 and Prop. 1.7.11, p. 89; DLLZ-A §3.2, Rem. 3.2.15, the statement on affinoids
with Huber's infinitesimal notions on one side and the rigid notions on the other; dJvdP §3.1,
Observation 3.1.1, p. 19). The Kummer map `T ↦ Tⁿ` on the rigid annulus `|T| = 1` over `Q_p` with
`p ∤ n` is étale on both sides, while `T ↦ T^p` on the closed unit disc over `Q_p` is neither (the
Jacobian `pT^{p−1}` vanishes at `0`); the inclusion of the affinoid subdomain `{|T| ≤ |p|}` into
the closed unit disc is étale on both sides although `K⟨T⟩ → K⟨T, T/p⟩` is not finite, so étale
here is not "finite étale"; the projection `𝔹²_K → 𝔹¹_K` is smooth on both sides and not étale.
(b) is not a consequence of (a): the closed immersion of the classical point `Sp K → Sp K⟨T⟩`,
`T ↦ 0`, is unramified on both sides (`Ω^f_{K/K⟨T⟩} = 0 = Ωᶜ`, and `m_0 O_{Sp K} = 0 = m`) but
étale on neither, `K⟨T⟩ → K` not being flat (`T` is a nonzerodivisor killed by the map).
*Needs:* *rigid-analytic-space* (RigidAnalyticGeometry §6.2); *rigid-adic-comparison-functor*;
*differentials-unramified-smooth-etale*, *unramified-morphism*, *smooth-morphism*,
*etale-local-structure*, *infinitesimal-criteria*, *continuous-differentials*,
*smooth-local-structure*, *etale-ring-flatness*,
*restricted-power-series-smooth*, *etale-smooth-composition*, *etale-smooth-locality*,
*smooth-differentials-locally-free*, *differential-criterion-morphism* (all layer R0);
*affinoid-jacobson* (RigidAnalyticGeometry §1.1); *rigid-local-ring-completion*
(RigidAnalyticGeometry Layers 3–4); *tft-plus-ring-power-bounded*.
Lean: README target.

**Checks for `RigidSpace.IsEtale` and `RigidSpace.IsSmooth`.** The following names are
suggested names for the matching Checks, over every complete nontrivially normed nonarchimedean field `K`.

- The identity of any rigid space satisfies both
  predicates; smooth charts can have relative dimension zero.
- Every map from the empty affinoid satisfies both
  predicates; the empty admissible covering suffices for smoothness.
- The structural map `Sp K⟨T⟩ → Sp K` is smooth and is
  not étale, distinguishing a positive-dimensional polydisc from a zero-dimensional chart.
- An affinoid homomorphism `K⟨T⟩ → K` with `T ↦ 0`
  sends `a + T` to `a`; the induced origin inclusion `Sp K → Sp K⟨T⟩` is neither étale
  nor smooth. Its failure of flatness rules out treating an arbitrary affinoid factorisation
  as an étale chart.

### R1.8 analytic groups and invariant differentials

Over a complete nontrivially normed nonarchimedean field K,
`AdicSpace.AdicOver.hasFiniteProducts` and `AdicSpace.SchemeOver.hasFiniteProducts`
state existence of finite products in the categories of objects locally of finite
type over `Spa K` and `Spec K`.
`AdicSpace.analytificationLftFunctor.preservesFiniteProducts` states preservation by
relative analytification (Huber94, Proposition 3.8; Huber96, (1.1.11)).

**Analytic groups: analytification of group schemes, finite locally free group schemes, abelian
varieties and isogenies.** (*analytification-group-objects*) Let `K` be complete of rank one, let
`Sch^{lft}_K` be the category of `K`-schemes locally of finite type (a full subcategory of
`Over(Spec K)` closed under finite products, with its cartesian monoidal structure) and
`Adic^{lft}_K` the category of adic spaces locally of finite type over `Spa K = Spa(K, K°)`,
which has finite products `X ×_{Spa K} Y` (*fibre-products-existence*, layer R0) and terminal
object `Spa K`. Because `(·)^ad` preserves finite products (*analytification-fibre-products*), it
is a monoidal functor and carries group objects to group objects: a group scheme `(G, m, e, i)`
locally of finite type over `K` gives the analytic group `G^ad` with multiplication `m^ad`, unit
`e^ad : Spa K → G^ad` and inverse `i^ad`, and a homomorphism `φ` gives the homomorphism `φ^ad`;
commutative group schemes give commutative group objects. Relatively, for a group scheme `G → Y`
locally of finite type and `S → Y` as in *scheme-fibre-product-analytification*, `G ×_Y S` is a
group object over `S`. Prove: (a) for an affinoid `Spa(D, D⁺)` over `Spa K`, the group of its
points in `G^ad` is `G(D)`; (b) if `G` is finite locally free of rank `d` over `Y` then
`G^ad → Y^ad` is finite, with `O` over each affinoid finite projective of rank `d`; (c) if `A` is
an abelian variety over `K` then `A^ad` is a commutative analytic group that is proper, smooth of
dimension `dim A` and connected over `Spa K`; (d) if `φ : A → B` is an isogeny (a finite surjective
homomorphism) then `φ^ad` is a finite surjective homomorphism whose kernel
`A^ad ×_{B^ad, e^ad} Spa K` is `(ker φ)^ad`, a finite analytic group (Conrad-MR §2, p. 11,
multiplication by `n` on the smooth locus over an artin base: torsion of analytified generalised
elliptic curves as finite flat commutative group objects; Conrad-MR §2, p. 10, universal group-law
structures, analytified through the compatibility of analytification with `Spec`, Hilbert and Hom
functors; Conrad-MR §3.2, Thm 3.2.3, p. 20, analytified universal elliptic curves and their group
structures are universal in the analytic category). Define `AdicSpace.analytificationFunctor.monoidal`
as the monoidal structure on `(·)^ad` induced by preservation of finite products,
`AdicSpace.analytificationGrp` as the functor `Grp(Sch^{lft}_K) ⥤ Grp(Adic^{lft}_K)`, `G ↦ G^ad`
(`mapGrp` of the analytification functor), `AdicSpace.analytificationCommGrp` as the same functor
on commutative group objects, and `AdicSpace.analytificationGrp.relative` as the group object
`G ×_Y S` over `S` for a group scheme `G → Y` and `S → Y`.
For `F = AdicSpace.analytificationLftFunctor K`, Mathlib's
`CategoryTheory.Functor.obj.μ_def` (`Mathlib/CategoryTheory/Monoidal/Mon.lean:842`)
identifies multiplication with `m^ad` composed with the product comparison;
`CategoryTheory.Functor.obj.η_def` (the same file, line 839) identifies the unit with
`e^ad` composed with `Spa K ≅ (Spec K)^ad`; and `CategoryTheory.Functor.obj.ι_def`
(`Mathlib/CategoryTheory/Monoidal/Grp.lean:591`) identifies the inverse with `i^ad`.
All three are definitional identities supplied by Mathlib. Prove
`AdicSpace.analytificationGrp.map` (a homomorphism `φ` gives
the homomorphism `φ^ad`; `map_id`, `map_comp`), `AdicSpace.analytificationGrp.pointsMulEquiv`
(for affinoid `Y = Spa(D, D⁺)` over `Spa K`, `Hom(Y, G^ad) ≃* G(D)`),
`AdicSpace.analytificationGrp.isFinite_of_finiteLocallyFree` (clause (b), the corollary of
`AdicSpace.schemePullback.isFinite_of_finiteLocallyFree` in *analytification-finite*
applied to the structure morphism of `G`),
`AdicSpace.analytificationGrp.abelianVariety_isProper` (`A^ad → Spa K` proper for an abelian
variety `A`), `AdicSpace.analytificationGrp.abelianVariety_smooth` (`A^ad → Spa K` smooth of
relative dimension `dim A`), `AdicSpace.analytificationGrp.isogeny_isFinite` (`φ^ad` is finite and
surjective for an isogeny `φ`) and `AdicSpace.analytificationGrp.kernelIso`
(`ker(φ^ad) ≅ (ker φ)^ad` as analytic groups). `G_a^ad = A^{1,ad}_K` with addition and
`G_m^ad = A^{1,ad}_K \ {0}` with multiplication; for `n` invertible in `K`,
`μ_n^ad = Spa(K[T]/(Tⁿ − 1))` is a finite étale analytic group of rank `n`. *Needs:*
*analytification-functor*; *scheme-fibre-product-analytification*;
*analytification-fibre-products*; *analytification-universal-property*; *analytification-finite*;
*analytification-separated-proper*; *analytification-etale-smooth*; *analytification-connected*
(RigidAnalyticGeometry §8.1);
*analytification-surjective*; *fibre-products-existence* (layer R0); Mathlib
`CategoryTheory.GrpObj`, `CategoryTheory.Functor.mapGrp`,
`CategoryTheory.Functor.Monoidal.ofChosenFiniteProducts`,
`CategoryTheory.CartesianMonoidalCategory`; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`,
`TauCeti.AlgebraicGeometry.AbelianVariety.isCommMonObj`,
`TauCeti.AlgebraicGeometry.AbelianVariety.smooth`,
`TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff`,
`TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat`, `TauCeti.AdditiveGroup.groupScheme`.
Lean: README target.

`AdicSpace.analytificationGrp.ofGroupScheme` regards a group object in
`Over(Spec K)` whose structure morphism is locally of finite type as an object of
`Grp(SchemeOver (fieldAffinoid K))`. Its underlying scheme and structure map are unchanged;
`analytificationGrp.ofGroupScheme_operations` identifies the inverse and multiplication
under the inclusion, using the product projections. This is the full-subcategory form of
the finite-product construction (Mathlib `Functor.mapGrp`).

`analytificationGrp.relative_hasFiniteProducts` supplies finite products in the full
subcategory of spaces locally of finite type over a stably sheafy `S`.
`analytificationGrp.relative Y G S hS g` has underlying space exactly
`(schemePullback G.X.hom S hS g).space`, with its projection to `S`.
`analytificationGrp.relative_operations` specifies the inverse and multiplication by
composition with the scheme projection; the unit is the identity for this multiplication.
The hypotheses are local finite type of `G → Y`, stably sheafy charts on `S`, and a
locally ringed space morphism `S → Y` (Wedhorn §8.7, Proposition 8.61, pp. 91–92,
and Remark 8.62, p. 92).

`analytificationGrp.pointsMulEquiv` allows every affinoid `D` equipped with a morphism
of Huber pairs `(K,K°) → (D,D⁺)`, without a local finite-type assumption on `D`.
Its statement supplies group structures on the over-category morphisms
`Spa D → G^ad` and `Spec D → G`, and a multiplicative equivalence between them.
The inverse and multiplication equations fix both group structures using `ι`, `μ`
and the two product projections. The comparison itself is fixed by
`Spa D → Spec D → G = Spa D → G^ad → G`
(Wedhorn Proposition 8.61 and the affinoid global-section comparison in AdicSpaces §5.4).

`analytificationGrp.abelianVariety_connected_commutative` takes a bundled abelian
variety `V` and a group object whose underlying `K`-scheme is `V.toOver`, and proves
`ConnectedSpace` and `IsCommMonObj` for its analytification. Commutativity follows from
proper geometrically integral group schemes and the product comparison; connectedness
uses *analytification-connected* (RigidAnalyticGeometry §8.1; Conrad-IC §2.3, Theorem 2.3.1, pp. 16–17, and Appendix A.1,
proof of Theorem A.1.3, p. 33; Huber94 Proposition 4.5(i)).
`analytificationGrp.kernelIso` takes an algebraic kernel square and an analytic kernel
square for the analytified homomorphism. It gives an isomorphism of analytic groups
whose composite with the kernel inclusion is the analytified algebraic inclusion.
It applies to every homomorphism with these kernel objects, hence also to isogenies;
finite kernels use *analytification-finite* (Wedhorn Proposition 8.61).

The symmetric structure is `analytificationFunctor.braided`, supplied by Mathlib's
`Functor.Braided.ofChosenFiniteProducts`; its three Checks are
`analytificationFunctor.braided_trivial`, `analytificationFunctor.braided_commuting`
and `analytificationFunctor.braided_inverse_product`, paired with the commutative-group
examples below.

**Checks for the constructions.** `analytificationCommGrp_trivial` gives the terminal
analytic group. In the polynomial presentation of `G_a`,
`analytificationCommGrp_commuting` computes the pullback `m* T = T₁ + T₂`
in both orders. In the Laurent presentation of `G_m`,
`analytificationCommGrp_inverse_product` computes `i* T = T⁻¹`, `TT⁻¹ = 1`,
and `(i ∘ m)* T = T₁⁻¹T₂⁻¹`. The algebraic multiplication is specified in each
presentation; the analytic coordinates are pulled through the scheme projection
(Wedhorn, Proposition 8.61 and Remark 8.62, pp. 91–92).
`analytificationGrp.relative_trivial` gives `S` for the trivial group over `Y`; `analytificationGrp.relative_empty` gives the empty space over the empty
base; `analytificationGrp.relative_finite` gives a finite map for a finite group scheme.
The three Checks `analytificationGrp.ofGroupScheme_trivial`,
`analytificationGrp.ofGroupScheme_additive` and
`analytificationGrp.ofGroupScheme_abelianVariety` are the corresponding trivial,
additive and abelian-variety examples for the included group objects.

**Checks.**

- *Degenerate.* The trivial group scheme `Spec K` analytifies to
  the trivial analytic group `Spa K`.
- *Computation.* For `G = G_a` (Tau Ceti
  `TauCeti.AdditiveGroup.groupScheme`) and an affinoid `Spa(D, D⁺)` over `Spa K`,
  `G^ad(Spa(D, D⁺)) = (D, +)` as a group. The Check uses a locally finite-type
  affinoid test space, identifies the primitive polynomial coordinate with the coefficient
  in `D`, and computes multiplication as `a+b` and inverse as `-a`. The general affinoid
  statement is `analytificationGrp.pointsMulEquiv`.
- *Non-example.* The unit circle
  `{|T| = 1} = Spa(K⟨T, T⁻¹⟩, K°⟨T, T⁻¹⟩)` is an open analytic subgroup of `G_m^ad` that is not the
  analytification of any algebraic subgroup of `G_m`; analytic groups have more subgroups than
  algebraic ones, so the analytification functor on group objects is not essentially surjective
  onto open subgroups.
- *Compatibility.* In characteristic `p`,
  `α_p = Spec K[T]/(T^p)` with additive law analytifies to the one-point, non-reduced finite
  analytic group `Spa(K[T]/(T^p), K° + (T))` whose coordinate ring is the Hopf algebra
  `K[T]/(T^p)` (an object of Tau Ceti `TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat`): finite
  flat analytic groups need not be étale. The formal polynomial presentation requires the
  coordinate to be primitive under multiplication, distinguishing `α_p` from `μ_p`.
- *Characterisation.* For an abelian variety `A` over
  `K` (Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`), `A^ad` is a commutative analytic
  group, connected, proper and smooth of dimension `dim A` over `Spa K`.

**Analytification of quotient maps by finite locally free subgroups: `(A/G)^ad ≅ A^ad/G^ad`.**
(*analytification-finite-quotient*) Let `π : A → B` be a homomorphism of group schemes locally of
finite type over `K` that is finite locally free and surjective, with kernel
`G = A ×_{B, e} Spec K` (a finite locally free subgroup scheme) — for instance the isogeny
`E → E/C` of an elliptic curve by a finite locally free subgroup, whose algebraic quotient is
constructed by the Tau Ceti roadmap ModularCurves, layer 2B, or the quotient `A → A/G` of an
abelian variety by a finite locally free subgroup scheme, which is a finite locally free surjective
homomorphism of group schemes with kernel `G`: the translation action is free and the abelian
variety is projective, so [Stacks Tag 07S7, Lemma 66.14.2](https://stacks.math.columbia.edu/tag/07S7)
gives the quotient scheme and its finite locally free torsor map. The group law descends along
that torsor. Construction of algebraic quotients belongs to the algebraic supplier; this target
uses only the stated hypotheses on `π`. In particular it does not require a separate theorem
that the quotient is an abelian variety. Prove
that `π^ad : A^ad → B^ad` is a finite locally
free surjective homomorphism of analytic groups with kernel `G^ad`; that the morphism
`A^ad ×_{Spa K} G^ad → A^ad ×_{B^ad} A^ad`, `(a, g) ↦ (a, a·g)`, is an isomorphism; and that
`B^ad` is the quotient of `A^ad` by the right action of `G^ad` in `Adic^{lft}_K`: for every adic
space `Z` locally of finite type over `Spa K`, composition with `π^ad` identifies `Hom(B^ad, Z)`
with the morphisms `h : A^ad → Z` satisfying `h(a·g) = h(a)`. In this sense `(A/G)^ad ≅ A^ad/G^ad`.
The quotient property is proved against test objects locally of finite type over `Spa K`; the
existence of quotients of analytic groups by finite flat analytic subgroups not arising from
algebra is not claimed (Conrad-RA §4.2, Cor. 4.2.5, descent of morphisms along analytified
faithfully flat maps in rigid form; Conrad-MR §2, p. 11, finite flat torsion subgroups of
analytified elliptic curves, the kernels whose quotients are studied). For an elliptic curve `E`
over `K` and `n` invertible, `[n] : E → E` has kernel `E[n]`, and `[n]^ad : E^ad → E^ad`
identifies `E^ad` with `E^ad/E[n]^ad`; for `E` with a `K`-rational subgroup `C` of order `p`
(possibly non-étale in characteristic `p`), `(E/C)^ad` is the quotient of `E^ad` by `C^ad`, and in
characteristic `p` with `C = ker(Frobenius)` the quotient map is the analytified relative
Frobenius, finite flat of degree `p` and purely inseparable. *Needs:*
*analytification-group-objects*; *analytification-finite*; *analytification-surjective*;
*analytification-fibre-products*; *finite-locally-free-quotient*; ModularCurves layer 2B (the
quotient of an elliptic curve by a finite locally free subgroup); Tau Ceti
`TauCeti.AlgebraicGeometry.AbelianVariety`, `TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff`.
Lean: README target.

`AdicSpace.analytificationGrp.torsorIso` states the action comparison for a finite,
flat, surjective homomorphism `π`, a specified algebraic kernel inclusion `i`, and any
analytic kernel-pair square `W`. It supplies `A^ad × G^ad ≅ W`, with first projection
`a`, second projection `a·i(g)`, and inverse kernel coordinate `a⁻¹b`.
These three equations fix the right-action convention, including in the noncommutative
case. `analytificationGrp.quotient` gives the unique factorization of an invariant
morphism through `π^ad` for every locally finite-type analytic target. The torsor
comparison follows from the algebraic group identities and preservation of fibre
products (Wedhorn Proposition 8.61); the factorization is finite locally free descent
(Conrad-RA §4.2, Corollary 4.2.5, p. 33).

**Checks for the analytic quotient map.** `analyticQuotient_test_trivial` gives the identity
quotient for the trivial subgroup. `analyticQuotient_test_kummer` uses `[n]` on `G_m`, with
`n ≥ 1`: the kernel is `μ_n`, and the action comparison sends `(a,ζ)` to `(a,aζ)`.
`analyticQuotient_test_frobenius` uses `[p]` on `G_m` in characteristic `p`: the same quotient
has nonreduced kernel `μ_p` and remains finite locally free of rank `p`. Its differential is
zero, so an étale-kernel replacement would give the wrong Check. The carrier is the actual
group-object analytification functor, its product comparison and its quotient morphism in
adic spaces locally of finite type over `Spa K`. The Kummer and Frobenius examples
specify the algebraic map by `T ↦ Tⁿ` and `T ↦ Tᵖ` in a Laurent-polynomial presentation
over `K`. Kummer is étale exactly when `n` is invertible; Frobenius is bijective on
underlying points with a nonzero nilpotent on its kernel and affinoid module rank `p`.
`analytificationGrp_torsor_coordinates` computes both projections on `lift a ζ`, giving
`a` and `aζ` on the actual analytic product. The group-law Checks
`analytificationGrp_identity`, `analytificationGrp_inverse` and
`analytificationGrp_composition` (also named `analytificationLftFunctor_identity`,
`analytificationLftFunctor_inverse`, `analytificationLftFunctor_composition`) compute
the following equations over a complete nontrivially normed nonarchimedean field `K`.
The identity Check computes `a·1 = a` for arbitrary analytic test-space points.
For `G_a` presented by `Spec K[T]` with algebraic law `m* T = T₁ + T₂`,
the inverse Check computes `i* T = −T`, `e* T = 0`, and `T ≠ 0` on the actual
analytic global section pulled through the scheme projection. For `G_m` presented
by `Spec K[T,T⁻¹]` with law `m* T = T₁T₂`, the composition Check computes
`m* T = T₁T₂`, `e* T = 1`, and `T ≠ 1` on analytic global sections.
These specify the analytic operations in coordinates, in addition to the
finite-product identities (`analytificationFunctor.map_snd`; Wedhorn,
Proposition 8.61 and Remark 8.62, pp. 91–92).

**Invariant differentials at the unit over `Spec K`: `K ⊗ Ωᶜ ≃ₗ[K] m_e/m_e²`.**
(*analytic-invariant-differentials*) Let `K` be complete, nontrivially normed and
nonarchimedean, with the Huber-ring structure of `fieldAffinoid K`, and let
`G : Grp (SchemeOver (fieldAffinoid K))` be a group scheme locally of finite type
over `Spec K`. At its analytic unit, the `K`-fibre of the continuous differential
stalk is isomorphic to the algebraic cotangent space `m_e/m_e²`, with the residue
scalar structures specified below. The four theorems
`AdicSpace.analytificationGrp.invariantDifferentials`,
`AdicSpace.analytificationGrp.invariantDifferentials_mul`,
`AdicSpace.analytificationGrp.invariantDifferentials_unit` and
`AdicSpace.analytificationGrp.invariantDifferentials_power` give the comparison,
the sum formula for `μ` at the pair of units, centering a germ by its value at `e`,
and multiplication by `n` under `[n]`, respectively. They use the local
comparison of Conrad-AWS, Example 2.4.6, pp. 20–21, and the continuous
differential construction of Huber96, (1.6.2)(i), p. 76, and Proposition 1.6.3,
pp. 77–78. The algebraic cotangent identification is
[Stacks, Tag 047I](https://stacks.math.columbia.edu/tag/047I).
For affine `G = Spec H`, this is also the augmentation cotangent space `I/I²`;
for an abelian variety it is the `K`-dual of the tangent space at zero
(CHJ §1, p. 4, over a complete algebraically closed field). The trivial group
has zero fibre; the fibre for `G_m` is spanned by the value of `dT/T` at the unit.
The sheaf comparison over a locally finite-type base `Y` belongs to
AdicSpacesPartIII R3.6, as specified in Downstream consumers.
*Needs:* *analytic-kahler-differentials*;
*analytification-of-modules*; *analytification-group-objects*;
*analytification-completed-local-rings*; Tau Ceti
`TauCeti.AlgebraicGeometry.ZariskiCotangentSpace`, `TauCeti.Bialgebra.CotangentSpace`,
`TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`; Mathlib `KaehlerDifferential`,
`IsLocalRing.CotangentSpace`.
Lean: README target.

For `G : Grp (SchemeOver (fieldAffinoid K))`,
`AdicSpace.analytificationGrp.invariantDifferentials` states the unit-fibre comparison on
`(analytificationGrp K).obj G`. Write `x = e^ad(s)`, `S = O_{G^ad,x}`,
`R = O_{G,q(x)}` and `m = maximalIdeal R`. A residue map `ε : S → K` has kernel the
maximal ideal, and its composite with the base stalk map is required to be bijective.
`AdicSpace.analytificationGrp.unit_residue` constructs such an `ε` and fixes its
normalization by sending the germ of every constant `a : K` to `a`; its existence
uses the rational-point comparison of Conrad-AWS, §2.4, pp. 20–21.
`AdicSpace.continuousDifferentialFibre.pullback` gives
the unique `K`-linear pullback for any morphism `φ : X → Y` in `AdicOver K`, at any
source point with an evaluation `ε`. The target evaluation is `ε ∘ φ*`, and the
map sends `db` to `d(φ*b)`; this pins naturality for group homomorphisms as well
as the operations below (Huber96, Proposition 1.6.3, pp. 77–78).
With scalar structures induced by these maps, the theorem gives a finite-dimensional
`K`-space and an equivalence

```text
K ⊗_R (m/m²) ≃ₗ[K] continuousDifferentialFibre K f x ε
               = K ⊗_S continuousDifferentialStalk f x.
```

It sends `1 ⊗ [a]` to `continuousDifferentialFibre.d K f x ε (q*(a))`.
Here `.d` is explicitly `1 ⊗ fromKaehlerStalk f x (D a)`, so the comparison is
fixed on generators. Finite-dimensional duality also identifies this space with
the dual of the tangent space. The differential **fibre**, rather than the whole
stalk, is `ω`: already on `G_a`, the stalk is `O_{G_a^ad,e}·dT`.
`AdicSpace.continuousDifferentialFibre.fromKaehler_bijective` requires a locally
finite-type map between locally noetherian analytic spaces, the same residue-map
kernel condition, and a bijective composite with the base stalk map; it asserts
bijectivity after tensoring `fromKaehlerStalk` with `K`. It does not assert that
algebraic differentials of analytic germs equal continuous differentials before
this tensor product. More generally, ordinary differentials of the analytic local rings are
compared with continuous ones only at classical points: for `u : X → X'` locally of finite type
between adic spaces locally of finite type over `Spa(K, K°)` and `x ∈ X` with residue field `k(x)`
finite and separable over `K` (every classical point when `char K = 0`; e.g. the identity `e` of
`G^ad` over `Y = Spec K`), the natural map `Ω_{O_{X,x}/O_{X',u(x)}} ⊗ k(x) → (Ωᶜ_{X/X'})_x ⊗ k(x)`
is an isomorphism, both sides being the cokernel of the cotangent map
`(m_{u(x)}/m_{u(x)}²) ⊗ k(x) → m_x/m_x²` (Stacks Tag 047I; Huber96 (1.6.2)(i), p. 76, Prop. 1.6.3,
pp. 77–78; Conrad-AWS §2.4, pp. 20–21). Check: the comparison
fails at non-classical points. At the Gauss point `x` of the closed disc over `K = ℚ_3`, `O_{X,x}`
is a field `F = k(x)` containing `K⟨T⟩`, and `h = log(1 + 3T) = Σ_{n ≥ 1} (−1)^{n+1} 3ⁿTⁿ/n ∈ K⟨T⟩`
is transcendental over `K(T)` (were it algebraic, the trace of `h` from `K(T, h)` would be a
rational function whose derivative, `[K(T, h) : K(T)]·3/(1 + 3T)`, has a nonzero residue at
`T = −1/3`, impossible for a derivative); so `dT`, `dh` are independent in `Ω_{F/K}`, while
`dh = 3(1 + 3T)⁻¹dT` in continuous differentials, and `dh − 3(1 + 3T)⁻¹dT` is a nonzero element of
the kernel that tensoring with `k(x) = F` does not remove. These statements use the chart comparison
`analyticDifferentials.comparison_chart` (Huber96, (1.6.2)(i), p. 76), the differential
sheaf's affinoid description (p. 78), and the infinitesimal local-ring comparison
`analytification.completedLocalRings` (Conrad-AWS, §2.4, pp. 20–21).

`AdicSpace.analytificationGrp.invariantDifferentials_mul` states, at the pair of
units, `μ*db = pr₁*db + pr₂*db` in the differential fibre for every section `b` on
an open neighbourhood containing the three image points. The two projections of
the chosen product point must equal the unit; the evaluation map has maximal-ideal
kernel. `AdicSpace.analytificationGrp.invariantDifferentials_unit` states
`ε(b − c(ε(b))) = 0` and `d(b − c(ε(b))) = db` in
`continuousDifferentialFibre K X.hom x ε`, the cotangent fibre of the group at
`x = e^ad(s)`. Here `K` is complete, nontrivially normed and nonarchimedean with
the Huber-ring structure of `fieldAffinoid K`, `G` is as above, `b ∈ O_{G^ad,x}`,
and `ε` has maximal-ideal kernel and satisfies `ε(c(a)) = a` for every `a ∈ K`.
The map `c` takes the germ of a constant on `Spa K` and pulls it back through
the structural stalk map. Thus subtracting the value at the unit gives an
augmentation-ideal representative of the same cotangent vector under
`invariantDifferentials`. The identity follows from the relative derivation
law (Huber96, Definition 1.6.1 and (1.6.2)(i), p. 76; sheaf description, p. 78).
`AdicSpace.analytificationGrp.invariantDifferentials_power` states `[n]*db = n·db`
at the unit for every `n : ℕ`, under the same kernel condition. These are the
cotangent maps of the actual analytic group operations, with germs and stalk maps
spelled out; the multiplication and power equations at the unit need no
commutativity assumption. Their algebraic input is the translation argument of
[Stacks, Tag 047I](https://stacks.math.columbia.edu/tag/047I), applied to cotangent fibres.

**Checks for the fibre and its differential.**
`analytificationGrp.invariantDifferentials_unit_constants` checks that centering
a constant gives zero; `analytificationGrp.invariantDifferentials_unit_zeroResidue`
checks that a germ with zero residue is unchanged; and
`analytificationGrp.invariantDifferentials_unit_nonzero` checks that a nonzero
differential stays nonzero after centering. These three clauses form
one Check with the unit theorem's hypotheses.

**Checks.** `analyticInvariantDifferentials_test_trivial_group` gives `ω = 0` for the trivial
group. `analyticInvariantDifferentials_test_additive` gives the one-dimensional invariant
space generated by `dT` on `G_a`, with addition pulling `dT` back to `dT₁ + dT₂`
at the pair of units.
`analyticInvariantDifferentials_test_multiplicative` gives `dT/T` on `G_m`, with multiplication
pulling it back to `dT₁/T₁ + dT₂/T₂` in the cotangent fibre at the pair of units.
`analyticInvariantDifferentials_test_power` gives
`[n]^*(dT/T) = n dT/T` at the unit of `G_m`; it vanishes for `n = p` in
characteristic `p`, although `dT/T` does not.
For the first Check, `K` is complete, nontrivially normed and
nonarchimedean, with the Huber-ring structure used by `fieldAffinoid K`, and
`G : Grp (SchemeOver (fieldAffinoid K))` has an isomorphism as
its structural map to `Spec K`. At the analytic unit `x = e^ad(s)`, for every
evaluation `ε : O_{G^ad,x} → K`, the Check asserts
`Subsingleton (continuousDifferentialFibre K X.hom x ε)` and `db = 0` for every
stalk element `b`, where `X = ((analytificationGrp K).obj G).X.obj`.
The algebraic identity `Ω[K/K] = 0` comes from
`KaehlerDifferential.subsingleton_of_surjective` in the supplier table;
`continuousDifferentialFibre_trivial` is the identity-map specialization of the
analytic vanishing. The additive and multiplicative examples use isomorphisms over
`Spec K` with `Spec K[T]` and `Spec K[T,T⁻¹]`, respectively. Each has an explicit
`hm` hypothesis on the algebraic group law: `μ*T = pr₁*T + pr₂*T` for `G_a`, and
`μ*T = pr₁*T · pr₂*T` for `G_m`. They pull the coordinate through `q` to a global
analytic section and then to its germ at the unit. With `ε` of maximal-ideal
kernel and bijective composite with the base stalk map, they assert rank one,
a nonzero coordinate differential (normalized to `dT/T` on `G_m`), and spanning.
For a product point `z` whose two projections are the unit and an evaluation
`εP` with maximal-ideal kernel, they also specialize
`AdicSpace.analytificationGrp.invariantDifferentials_mul` to that coordinate.
The three pulled-back coordinate germs for `G_m` have residue `1`, so this gives
the displayed logarithmic identity. The power Check uses the same multiplicative
coordinate hypothesis and unit evaluation, and specializes
`AdicSpace.analytificationGrp.invariantDifferentials_power` to `T` for every
`n : ℕ`. Its pullback is the stalk map of the actual analytic power morphism
`(𝟙 A)^n`; both coordinate residues are `1`. Thus it includes `n=0,1,2` and
characteristic-`p` vanishing while asserting that the original `dT/T` is nonzero.
The coordinate computations use Huber96, (1.6.2)(i), p. 76, Proposition 1.6.3,
p. 77, and the sheaf description on p. 78; the group cotangent identification is
[Stacks, Tag 047I](https://stacks.math.columbia.edu/tag/047I).

### R1.9 dimension, identity principle and supporting lemmas

**Every maximal ideal of a `K`-affinoid domain has height equal to its dimension.**
(*affinoid-domain-equidimensional*) In a `K`-affinoid integral domain every maximal ideal has height
`dim A`, and a finite injective `K`-algebra map `K⟨T₁,…,T_e⟩ → A` has `e = dim A`. Supplied by
RigidAnalyticGeometry §1.2 (`height_eq_ringKrullDim_of_isDomain`). The supplier's carrier is `IsAffinoidAlgebra K A`; this roadmap applies it
through the carrier bridge of R0.9.

**Identity principle on connected normal rigid spaces.** (*rigid-identity-principle*) On a connected
normal rigid-analytic space `X` a nonempty admissible open `U` is dense for the analytic Zariski
topology, `X` is irreducible, and restriction from `X` to `U` is injective on the sections of `O_X`
and of every finite locally free `O_X`-module; for a `K`-affinoid integral domain, restriction to a
nonempty affinoid subdomain is injective. Supplied by RigidAnalyticGeometry Layers 3–4 and §7.3. The supplier's carrier is `IsAffinoidAlgebra K A`;
this roadmap applies it through the carrier bridge of R0.9.

**If `T` generates an open ideal then every `T^n·U` is a neighbourhood of `0`: Huber's "`M·A`
open" gives a Tau Ceti weight family.** (*open-ideal-weight-family*) Let `A` be a Huber ring (Tau
Ceti `IsHuberRing`) and `T ⊆ A` a subset, not necessarily finite or bounded, such that the ideal
`T·A` generated by `T` is open in `A`. Prove that for every `n ∈ ℕ` and every neighbourhood `U` of
`0` in `A`, the additive subgroup `T^n·U` generated by the products `t₁⋯t_n·u` (`tᵢ ∈ T`, `u ∈ U`)
is a neighbourhood of `0`, using
`AddSubgroup.closure` of the pointwise product `(T^n)·U`. No open mapping theorem is needed,
the argument using only a pair of
definition `(A₀, I)` with `I` finitely generated. Consequently: (a) if `M₁,…,M_k ⊆ A` are finite
subsets with every `Mᵢ·A` open, then `M = (M₁,…,M_k)` is a weight family in Tau Ceti's sense
(`TauCeti.Huber.IsWeightFamily`), so Huber's `A⟨X⟩_M` is built on Tau Ceti's
`weightedRestrictedSubring M`; (b) if `E ⊆ A` has `E·A` open, then for every `k ≥ 1` the set
`E(k) = {e₁⋯e_k : eᵢ ∈ E}` generates the ideal `(E·A)^k`, which is again open (Huber94 §1,
Lem. 1.1, p. 516; Wedhorn §6.4, Lem. 6.20, p. 50, the same statement with the proof; Wedhorn §8.5,
opening paragraph, p. 86, consequence (a): Huber's openness condition gives Wedhorn's standing
hypothesis, i.e. Tau Ceti's `IsWeightFamily`). For `A` Tate with pseudo-uniformizer `ϖ` and
`T = {ϖ}` this recovers Tau Ceti `TauCeti.Huber.IsWeightFamily.of_exists_isUnit`; for
`A = ℚ_p⟨Y, Z⟩` and `T = {Y}`, `Y·A` is not open and the conclusion fails (the counterexample in
the docstring of `TauCeti.Huber.IsWeightFamily`), so the openness hypothesis cannot be dropped.
The case `n = 1` is Tau Ceti's `TauCeti.Huber.PairOfDefinition.exists_forall_mem_idealImage_exists_sum_eq`
(every element of a power of the ideal of definition is a sum `Σ tᵢuᵢ` with `tᵢ ∈ T`,
`uᵢ` in a neighbourhood of `0`), the powers `T^n·U` are handled by `isOpen_mul` and
`extendedIdealOfDefinition_pow`, and consequence (a) is the constructor
`IsWeightFamily.of_forall_openAddSubgroup`; the direction "`T·A` open implies every `T^n·U` open
for all `n`" is the one Tau Ceti records as missing in the docstring of
`IsWeightFamily.isOpen_weightMul_top`, and it is the content of the target. *Needs:* Tau Ceti
`TauCeti.Huber.IsWeightFamily`, `TauCeti.Huber.IsWeightFamily.of_forall_openAddSubgroup`,
`TauCeti.Huber.IsWeightFamily.isOpen_weightMul_top`,
`TauCeti.Huber.PairOfDefinition.exists_forall_mem_idealImage_exists_sum_eq`,
`TauCeti.Huber.PairOfDefinition.isOpen_mul`, `TauCeti.Huber.PairOfDefinition.extendedIdealOfDefinition_pow`,
`TauCeti.Huber.PairOfDefinition`, `TauCeti.Huber.IsHuberRing`.
Lean: README target.

**Extending a valuation along a finitely generated algebra with value group in the divisible
hull.** (*valuation-extension-divisible-hull*) The formal target is
`valuation_extension_torsion`; its equation `r(d)^n r(φ(b)) = r(φ(a))`, with `n > 0` and
`v(b) ≠ 0`, expresses torsion over the value group generated by the restricted valuation.
Let `φ : A → D` be a ring homomorphism making `D`
a finitely generated `A`-algebra (only needed to make `k(q)` finitely generated over the residue
field of `supp v`; a finite transcendence degree would suffice), `v` a valuation of `A` with value
group `Γ_v`, and `q ⊆ D` a prime ideal with `φ⁻¹(q) = supp(v)`. Prove that there is a valuation
`r` of `D` with `supp(r) = q`, `r ∘ φ` equivalent to `v`, and `Γ_r/Γ_v` a torsion group; that is,
`Γ_v` and `Γ_r` have the same divisible hull. In particular `Γ_v` is cofinal in `Γ_r` and the
convex subgroup of `Γ_r` generated by `Γ_v` is `Γ_r`. Field form: for a finitely generated field
extension `L/K` and a valuation `v` of `K` there is a valuation `w` of `L` extending `v` with
`Γ_w/Γ_v` torsion (Wedhorn §8.7, proof of Prop. 8.63, p. 92, the exact statement used, asserted
there without proof; Huber94 §3, proof of Lem. 3.9(ii), p. 538, the same choice in Huber's proof,
again without proof. For the field statement, choose a transcendence basis, extend by the
Gauss valuation assigning value one to its variables, and then extend across the remaining
finite algebraic extension; the latter changes the value group only by torsion. Apply this to
`Frac(D/q)` over `Frac(A/supp(v))`. Stacks Tag 00IA (Algebra, Lem. 10.50.2), domination by a valuation ring, used
in the algebraic step). For `A = ℚ_p` with the `p`-adic valuation, `D = ℚ_p[T]`, `q = 0`: the
Gauss valuation has value group `p^ℤ`, while a valuation with `|T| = γ` for `γ` infinitesimal
relative to `|p|` (a rank-2 extension) is an extension whose value group is not in the divisible
hull, so it is excluded; for `A = ℚ_p`, `D = ℚ_p[T]/(T² − p)`, the unique extension has value group
`p^{ℤ/2}`, torsion over `p^ℤ`. *Needs:* Mathlib `Valuation`, `Valuation.supp`,
`LocalSubring.exists_le_valuationSubring`, `ValuationSubring.isMax_toLocalSubring`,
`Algebra.FiniteType`.
Lean: README target.

**Fibre products of schemes are fibre products of locally ringed spaces.**
(*scheme-pullback-is-lrs-pullback*) Let `f : X → Z` and `g : Y → Z` be morphisms of schemes and
`X ×_Z Y` their fibre product in schemes, with projections `p₁, p₂`; no hypotheses on `f`, `g` or
`T`. Prove that `(X ×_Z Y, p₁, p₂)` is also a fibre product in the category of locally ringed
spaces: for every locally ringed space `T` and all morphisms of locally ringed spaces `a : T → X`,
`b : T → Y` with `f ∘ a = g ∘ b` there is a unique morphism of locally ringed spaces
`c : T → X ×_Z Y` with `p₁ ∘ c = a` and `p₂ ∘ c = b`. Equivalently, Mathlib's
`Scheme.forgetToLocallyRingedSpace` preserves pullbacks (`scheme_forget_preservesPullbacks`)
(Stacks Tag 01I4 (Schemes, Lem. 26.6.7),
the affine case; Stacks Tag 01JN (Schemes, Rem. 26.16.2), the general statement, left to the
reader there; Stacks Tag 01HI (Schemes, Lem. 26.3.5), factorisation through open subspaces, used
for gluing the local lifts). For `X = Y = A¹_K` over `Z = Spec K` and `T = (Spa(K, K°))_`, pairs
`(x, y) ∈ K²` are the same as morphisms `T → A²_K` of locally ringed spaces over `Spec K`; the
lemma is used with `T = U_` for an adic space `U` in *analytification-fibre-products*, and no
analogue is claimed for fibre products of adic spaces. The affine case, `Spec` of a pushout of rings
is a fibre product of locally ringed spaces, follows from Mathlib's adjunction
`ΓSpec.locallyRingedSpaceAdjunction` (a right adjoint preserves limits); the global statement, the
gluing of the local lifts, is not in Mathlib and is the content of the target. *Needs:* Mathlib
`AlgebraicGeometry.ΓSpec.locallyRingedSpaceAdjunction`,
`AlgebraicGeometry.Scheme.forgetToLocallyRingedSpace`, `AlgebraicGeometry.LocallyRingedSpace`,
`CategoryTheory.Limits.pullback`.
Lean: README target.

**Finite coverings of `Max A` by rational subdomains are refined by standard rational coverings
(Huber's product trick on classical points).** (*max-rational-covering-refinement*) For a `K`-affinoid algebra `A`, consume the affinoid-to-rational refinement of
RigidAnalyticGeometry Layers 3–4 and Layer 5. Prove its explicit standard-cover form on the
R0.9 carrier: every finite affinoid covering of `Max A` admits a refining cover
`{|g_j| ≤ |g_i| ≠ 0 for all j}_i` for a finite tuple `(g_i)` generating the unit ideal of `A`.
For a rational cover the tuple is formed from products of its presentation entries
(Bosch14 §4.3, Lemma 4, pp. 84–85; Huber94 §2, Lemma 2.6).
Lean: README target.

**Checks.**

- The identity cover is refined by the standard cover from the singleton tuple `(1)`.
- For `A=K⟨T⟩` and `0<|ϖ|<1`, the tuple `(T,ϖ)` gives the cover
  `|T|≤|ϖ|` and `|ϖ|≤|T|`; each domain keeps its nonzero denominator.
- The empty cover of `Max 0` is refined by the empty standard cover: the empty tuple
  generates the unit ideal in the zero ring. It cannot cover `Max K`.

**Morphisms from a rigid space to a finite-type affine `K`-scheme are `K`-algebra maps on global
sections (Conrad-IC Lemma A.1.1).** (*rigid-gamma-spec*) For a rigid-analytic space `Y` over `K` and
a finite-type `K`-algebra `C`, morphisms `Y → Spec C` of locally G-ringed spaces correspond
bijectively to `K`-algebra maps `C → O_Y(Y)`, naturally in `Y` and `C`. Supplied by
RigidAnalyticGeometry §8.1. The supplier states it on its rigid varieties, which this roadmap writes `RigidSpace K`
(*rigid-analytic-space*).

**Classical points of `Spa(A, A°)` for a `K`-affinoid algebra: constructible density, and rational
subsets ↔ rational subdomains of `Max A` (Huber93 §4).** (*classical-points-constructible-density*)
For a `K`-affinoid algebra `A`, `m ↦ |·|_m` embeds `Max A` into `Spa(A, A°)` with image the points
whose residue field is finite over `K`, the trace on `Max A` of the rational subset `R({f, g}/g)` is
the rational subdomain `X(f/g)`, a finite family of rational subdomains covers `Max A` iff the
corresponding rational subsets cover `Spa(A, A°)`, and the classical points are constructibly
dense: with `L_A = {v ∈ Spv A : v(a) ≤ 1 for a ∈ A°, v(a) < 1 for a ∈ A°°}`, (i) `L_A` is the
closure of `Max A` in the constructible topology of `Spv A`, (ii) `Max A` is dense in the
constructible topology of `Spa(A, A°)`, and (iii) two constructible subsets of `Spa(A, A°)` with the
same classical points are equal. Supplied by RigidAnalyticGeometry §8.2. The supplier states (i)–(iii) in its README; this roadmap reads them on Tau Ceti's `ValuationSpectrum A` and its
subspace `ValuationSpectrum.spa` with Mathlib's `constructibleTopology`, and deduces from (iii) and
RigidAnalyticGeometry §8.2 that `U ↦ U ∩ Max A` is an inclusion-preserving bijection from the
rational subsets of `Spa(A, A°)` onto the rational subdomains of `Max A`, since rational subsets are
constructible and `U ⊆ V` exactly when `U ∩ V` and `U` have the same classical points.

**Restricted power series are flat over polynomials for strongly noetherian Tate rings.**
(*restricted-series-flat-over-polynomials*) Let `A` be a complete Hausdorff strongly noetherian
Tate ring (Tau Ceti `TauCeti.Huber.IsStronglyNoetherian`; no noetherian ring of definition is
assumed) and `d ≥ 0`. Prove that the inclusion `A[T₁,…,T_d] → A⟨T₁,…,T_d⟩` is flat (Zavyalov24
§6, proof of Lem. 6.7, p. 14, the flatness input of the relative analytification morphism). For
`A = K` a complete rank-one field and `d = 1`, `K⟨T⟩` is a torsion-free, hence flat, module over
the principal ideal domain `K[T]`. *Needs:* Tau Ceti `TauCeti.Huber.IsStronglyNoetherian`; Mathlib
`AdicCompletion.flat_of_isNoetherian`, `Module.Flat`.
Lean: README target.

**Affinoid opens locally of finite type over a noetherian-type affinoid are of topologically finite
type (Huber94 Proposition 3.6).** (*affinoid-over-noetherian-base-tft*) Let `f : X → Y` be a
morphism of adic spaces locally of finite type (*finite-type-morphism-classes*, layer R0) and
`U ⊆ X`, `V ⊆ Y` arbitrary open affinoid subspaces (not just members of a chosen cover) with
`f(U) ⊆ V`, and assume that `O_Y(V)` has a noetherian ring of definition or is a strongly
noetherian Tate ring. Prove that the morphism of affinoid rings
`(O_Y(V), O⁺_Y(V)) → (O_X(U), O⁺_X(U))` is of topologically finite type, as stated by
`AdicSpace.LocallyOfFiniteType.affinoid` in R1. In particular, for an
affinoid adic space `Spa(B, B⁺)` locally of finite type over `Spa(K, K°)` (`K` complete of rank
one), `B` is a `K`-affinoid algebra and `B⁺ = B°` (*tft-plus-ring-power-bounded*) (Huber94 §3,
Prop. 3.6, p. 535; Huber94 §4, proof of Prop. 4.5, p. 543, the use in 4.5(v); Huber96 §1.2,
after Def. 1.2.1, p. 47, the book's restatement). For
`U = Spa(K⟨T⟩⟨1/T⟩, K°⟨T, 1/T⟩) ⊆ Spa(K⟨T⟩, K°⟨T⟩)` over `Spa(K, K°)`, the global ring
`K⟨T, T⁻¹⟩` is `K`-affinoid (a quotient of `K⟨T, S⟩` by `(TS − 1)`) with plus ring its
power-bounded subring. The chart case — a rational localisation of a strongly noetherian Tate ring
is strictly topologically of finite type over it, with plus ring the integral closure of the
adjoined fractions — is Tau Ceti's `isStrictlyTopologicallyFiniteType_toCompletionLoc` and
`isRingOfIntegralElements_integralClosure_adjoin_plus`; the target is the statement for arbitrary
affinoid opens `U ⊆ X`, `V ⊆ Y` of a morphism locally of finite type, which are not rational
localisations of one another. *Needs:* *finite-type-morphism-classes* (layer R0);
*tft-plus-ring-power-bounded*; Tau Ceti `TauCeti.Huber.IsTopologicallyFiniteType`,
`TauCeti.Huber.IsStronglyNoetherian`,
`TauCeti.Huber.PairOfDefinition.isStrictlyTopologicallyFiniteType_toCompletionLoc`,
`TauCeti.Huber.PairOfDefinition.isRingOfIntegralElements_integralClosure_adjoin_plus`.
Lean: README target.

**Rigid analytification preserves and reflects reducedness and normality.**
(*rigid-analytification-normal-reduced*) For a `K`-scheme `X` locally of finite type with rigid
analytification `i_X : X^an → X`, `x ∈ X^an` and `x₀ = i_X(x)`, (i) the stalk map
`O_{X,x₀} → O_{X^an,x}` is a local homomorphism of noetherian local rings inducing an isomorphism of
completions, hence faithfully flat, (ii) `O_{X,x₀}` is reduced (resp. a normal domain) iff
`O_{X^an,x}` is, and (iii) `X` is reduced (resp. normal) iff every local ring of `X^an` is reduced
(resp. a normal domain). Supplied by RigidAnalyticGeometry §8.1. The supplier states (ii)–(iii) for
its analytification `X^{rig}`, which this roadmap writes `X^an` (*rigid-analytification*).

**A `K`-scheme locally of finite type is connected iff its rigid analytification is connected.**
(*rigid-analytification-connected*) A `K`-scheme `X` locally of finite type is connected iff `X^an`
is connected, and `Z ↦ i_X⁻¹(Z)` is a bijection from the irreducible components of `X` to the
analytic irreducible components of `X^an`, identifying each analytified reduced component with the
corresponding reduced analytic component. Supplied by RigidAnalyticGeometry §8.1. The supplier states it on its rigid varieties, which this roadmap
writes `RigidSpace K` (*rigid-analytic-space*).

### Examples

**Checks on the analytified projective line.** These apply the R0 properness and
specialization predicates to the R1 object
`analytification (fieldAffinoid K) (fieldAffinoid_stablySheafy K)
(projectiveSpace.over (fieldAffinoid K) 1)`.

- *Computation.* Over a complete nontrivially normed
  nonarchimedean field `K`, `P¹ → Spa(K,K°)` is proper and its two closed-disc charts
  cover. In either chart, the inverse image of the other is exactly `|T| = 1`,
  with chart coordinate rings continuously isomorphic to `K⟨T⟩`
  (Conrad-AWS, Example 2.4.4, p. 20). The valuative criterion gives the unique centre;
  the two discs account for the alternatives that a coordinate or its inverse is integral.
- *Non-example.* The open embedding `D₀ → P¹` is not
  specializing at the Gauss point `x`: the type-5 point of `D_∞` at the Gauss point in the direction
  `|T| > 1` is a specialization of `x` in `P¹` with no preimage specializing `x` in `D₀`. Being an
  open embedding therefore does not imply being universally specializing.
- *Computation.* Over a complete nontrivially normed
  nonarchimedean field `K`, the structure map of `P^{1,ad}_K` is proper, partially proper
  and quasi-compact, and the canonical scalar map `K → O(P^{1,ad}_K)` is bijective.
  The section calculation uses the two closed discs glued by reciprocal coordinates:
  a series in `T` agreeing with a series in `T⁻¹` on the unit annulus is constant
  (Conrad-AWS, Example 2.4.4, p. 20). The general properness target over a complete
  stably sheafy Tate affinoid is `projectiveSpace.analytic_proper`;
  Huber96 §1.3, Lemma 1.3.4, p. 51 relates the three properness predicates.


The following Checks give the algebraic computations used in these examples. Unless a row specifies an arbitrary field, K is a complete nontrivially normed ultrametric field with its compatible nonarchimedean ring structure.

- Every power series in zero variables over K is a polynomial.
- For a pseudouniformiser ϖ and every k, the image of T is a non-zero-divisor in the weighted chart ring K⟨ϖᵏT⟩.
- Over any nontrivially normed field with 0 < ‖ϖ‖ < 1, the natural numbers m satisfying ‖ϖᵏϖ⁻ᵐ‖ ≤ 1 are exactly those with m ≤ k.
- Over any field K, the zero K-module is finite and projective but not faithfully flat; there are exactly two K-algebra maps K × K → K.
- For any field K and x in K[ε]/(ε²), equality x ⊗ 1 = 1 ⊗ x over K forces x to be a scalar.
- For a separable polynomial P over any field K, the image of P′ in K[X]/(P) is a unit.
- Over any field of prime characteristic p, the polynomial derivative of Tᵖ is zero.
- The quotient K⟨T⟩ → K⟨T⟩/(T) has zero relative Kähler differentials and is not flat.

**Relative analytification and its carriers.** The R0 constructions
`AdicSpace.toLocallyRingedSpace` and `AdicSpace.forgetToLocallyRingedSpace`
retain the actual structure sheaf and stalk maps.
`SchemePullback f S g` contains an adic space, its two projections, their commutative
square, and the unique factorization for every compatible adic test space.
`schemePullback` constructs this object when f is locally of finite type and S has stably
sheafy charts (Huber94, Prop. 3.8, p. 536; Wedhorn §8.7, Prop. and Def. 8.61, p. 91), including the locally
noetherian case via `IsLocallyNoetherian.isStablySheafy`. `Affinoid.toSpec` is classified by the canonical
coefficient map, and its point map is the support of the valuation.
`SchemeOver A` is the full subcategory of schemes locally of finite type over Spec A.
`analytification A X` is the mixed pullback along `Affinoid.toSpec`; the equation
`analytificationFunctor.map_snd`, together with the structure map to Spa A, specifies
its action on morphisms (Huber94, Proposition 3.8).

`projectiveSpace R n` is Mathlib's Proj of the standard grading on R[X₀,…,Xₙ].
`projectiveSpace.coeff_value` identifies a coefficient with its degree-zero homogeneous
fraction at every point. `projectiveSpace.toSpec` is the map classified by these sections,
and `projectiveSpace.over` is the resulting object of `SchemeOver`.
`projectiveSpace.locallyOfFiniteType` states that this structure morphism is locally
of finite type for every commutative coefficient ring R and n ≥ 0
(the standard affine charts in [Stacks, Lemma 27.13.3](https://stacks.math.columbia.edu/tag/01ND)).
The properness statement supplies n+1 analytic affinoid charts, with coordinate rings
the n-variable Tate algebras and plus rings the integral closures of the bounded
coordinate subrings (Conrad-AWS, §3.2, Example 3.2.5; Conrad-RA, §2.3, Example 2.3.11).

`ringCatSheaf` forgets commutativity of the supplied ring sheaf; `ringCatSheafMap` is its
actual morphism over inverse image on opens. `pullbackModules` uses Mathlib's sheafified
extension of scalars, and `analytification.modules` applies it to the scheme projection.
`moduleStalk` is the colimit of the underlying additive presheaf, with scalar multiplication
specified by `moduleStalk.germ_smul`. `analytification.modules_stalk` proves bijectivity of
`analytification.stalkComparison`, whose value `a ⊗ germ(m) ↦ a · germ(η_F(m))` is fixed by
`analytification.stalkComparison_germ`. Its scalar extension uses the actual local-ring
homomorphism ([Stacks, Lemma 6.26.4](https://stacks.math.columbia.edu/tag/0094)).
For a strongly noetherian Tate base the projection is flat, hence this module functor
is exact and preserves monomorphisms of ideal sheaves (Zavyalov24 §6, Lemma 6.7, p. 14).

`AdicOver K` is the full subcategory of spaces locally of finite type over Spa K.
`analytificationLftFunctor` is the relative functor into this category, with its finite-product
comparison; `analytificationGrp` is the induced functor on group objects. Its equations
for multiplication, identity and inverse specify the group structure, with multiplication
transported through the product comparison (Huber94 §3, Proposition 3.8, p. 536;
Wedhorn Remark 8.62, p. 92).

`rigidToAdic` is the functor of RigidAnalyticGeometry §8.3 read on the R0 affinoid
carriers; it is specified on affinoids by `rigidToAdic_Sp` and on affinoid maps by
`rigidToAdic_Sp_map`.
`rigidToAdic.rho U` is the range of the image of the rigid open immersion U → X;
`rigidToAdic.sections` is the natural section comparison along this functor on opens.
`rigidToAdic.sections_coeff` identifies this comparison on every coefficient of a whole
affinoid. The cover equivalence and the section equations determine the gluing to arbitrary
rigid spaces (Huber94, Proposition 4.5(i)–(ii)).

**Checks for these carriers and constructions.** Names below are in `AdicSpace`;
K has the standing complete rank-one nonarchimedean hypotheses.

- Base change of the identity scheme map has an isomorphic projection to the adic space.
- An empty scheme source gives an empty mixed fibre product.
- Base change of a scheme open immersion is an adic open immersion whose image is the inverse image of the original open.
- For the zero ring, both the affinoid and its scheme spectrum are empty.
- For a field, every valuation point maps to the zero prime ideal.
- The map to Spec commutes with every continuous pair homomorphism, including quotient maps.
- The analytification of the base scheme has an isomorphic projection to the base affinoid.
- An empty scheme has empty adic analytification.
- The image of an analytified open immersion is the inverse image of the scheme open under the canonical projection.
- Relative projective zero-space has an isomorphic structure map in the category of schemes locally of finite type over the coefficient ring.
- Over the zero ring, every relative projective space is empty.
- Over a field, relative projective one-space has two distinct points.
- Projective zero-space is Spec R, and its constant-section map is bijective.
- Over the zero ring, projective space is empty and its structure map is an isomorphism.
- Over a field, projective one-space has distinct points with the same image in Spec R, while its global coefficient map remains bijective.
- Pullback sends the zero module sheaf to the zero module sheaf.
- Pullback of the structure sheaf is the structure sheaf.
- Pullback preserves a free sheaf with n generators, including n = 0.
- The ring-sheaf map of the identity fixes every section.
- Sections over the empty open form the zero ring, and every induced map on these sections is bijective.
- The section homomorphism commutes with restriction along V ⊆ U.
- The stalk of a zero module sheaf is zero.
- The stalk of the unit module sheaf is the actual local ring, linearly over that ring.
- The stalk of a free sheaf on n generators is free of rank n.
- The transported unit satisfies `a·1 = a` for any analytic group.
- On `G_a`, the actual coordinate satisfies `i* T = −T`, `e* T = 0`, and `T ≠ 0`.
- On `G_m`, the actual coordinate satisfies `m* T = T₁T₂`, `e* T = 1`, and `T ≠ 1`.
- The rigid affinoid point becomes a one-point adic space, and its scalar homomorphism is bijective.
- The rigid spectrum of the zero affinoid algebra becomes empty, with zero coefficient ring.
- An identity rigid affinoid map becomes the identity adic map.
- The identity of Spa K is an object of the relative locally finite-type category.
- The relative category contains an empty object.
- The relative category contains the closed unit disc, whose structure map is not finite.
- An empty admissible open maps to the empty adic open and has the zero section ring.
- The whole rigid affinoid maps to the whole adic affinoid, and the section comparison there is bijective.
- The section comparison commutes with restriction to a smaller admissible open.


The worked examples of this layer are the checks above together with the following. For affinoid
subdomains: `U = Max A` with `A_U = A` and `U = ∅` with `A_U = 0`; the Weierstrass domain
`{|T| ≤ |c|} ⊆ Max K⟨T⟩` with coordinate ring `K⟨T, S⟩/(T − cS) ≅ K⟨S⟩`, and the open disc
`{|T| < 1}`, which is not an affinoid subdomain; the faithfully flat map
`K⟨T⟩ → K⟨S⟩ × K⟨T, U⟩/(TU − ϖ)` of the covering `{|T| ≤ |ϖ|}`, `{|T| ≥ |ϖ|}` against the flat
but not faithfully flat `K⟨T⟩ → K⟨S⟩`; Gerritzen–Grauert with `n = 1` on every Weierstrass,
Laurent or rational domain, and a finite union of rational subdomains that is not affinoid; the exact Laurent sequence
`0 → A → A⟨f⟩ × A⟨f⁻¹⟩ → A⟨f, f⁻¹⟩ → 0` and the gluing of compatible functions on
`{|T| ≤ |ϖ|}`, `{|T| ≥ |ϖ|}` to an element of `K⟨T⟩`; the stalk `O_0` of `Max K⟨T⟩` at the origin,
strictly between `K[T]_{(T)}` and `K⟦T⟧` with completion `K⟦T⟧`, and `O_0 = A` for
`A = K⟨T⟩/(T²)`; `Sp(K)` as a point with structure sheaf `K`, `O(Sp A) = A`, and the two admissible
opens `{|T| < 1}`, `{|T| = 1}` of the closed unit disc that cover it set-theoretically but not
admissibly (Conrad-AWS Example 2.2.8). For rigid analytification: `(A¹_K)^an` is not
quasi-compact, `(Spec L)^an = Sp(L)` for `L/K` finite, and the analytification of the affine line
with doubled origin is not quasi-separated; the completed local rings at the origin of
`A^{1,ad}_K` and at the node of `y² = x²(x + 1)`; `G_m ⊆ A¹_K` with preimage `A^{1,ad} \ {0}`
open and dense but not closed, and the non-closed diagonal image of the doubled-origin line; the
Kummer covering `G_m^ad → G_m^ad` and the locally free surjection `Spa(K[T]/(T²)) → Spa K` with
coequaliser `Spa K`.

For Huber's fibre product and the analytification functor: the chart data `A_k = K⟨ϖ^k T⟩`,
`A_k⁺ = K°⟨ϖ^k T⟩`, `R_k ⊆ R_{k+1}` the rational subset `{|ϖ^k T| ≤ 1}` (Hübner Example 4.3), and
the point `T ↦ ϖ^{-3}` that factors through `R_3` but not `R_2`; `R = S` with `p = id`, `q = g`
when `X = Y`; the surjectivity of `X ×_Y S` onto compatible pairs `(x, s)` (Huber94 Lemma
3.9(ii)); `(A¹_K)^ad` as the adic affine line `⋃_k Spa(K⟨ϖ^k T⟩, K°⟨ϖ^k T⟩)` (Hübner Example
10.4), not the closed unit disc, representing `Y ↦ O_Y(Y)` while the closed unit disc represents
`Y ↦ O⁺_Y(Y)` (Berkeley Lecture 4); `(Spec L)^ad = Spa(L, L°)` and `X^ad(Spa(L, L°)) = X(L)` for
finite `L/K`; the classical point `T = ϖ^{-2}` in `D_2 \ D_1`, the entire non-polynomial function
`Σ_m ϖ^{m²} T^m`, and the rank-2 point in the closure of `D_0`; the classical points of
`(A¹_K)^ad` as `Aut(K̄/K)`-orbits, i.e. monic irreducible polynomials, and the Gauss point over the
generic point; the surjection `A¹ ⊔ A¹ → P¹` and the non-surjective `G_m → A¹` after
analytification.

For the compatibilities: `V(T)` analytifying to the classical point `0` and `D(T) = G_m` to
`⋃_k {|ϖ^k| ≤ |T| ≤ |ϖ|^{-k}}`; `Y^ad` cut out by `I_Y·O_{X^ad}` for a closed immersion of
quasi-projective varieties; `(A¹_K ×_K A¹_K)^ad ≅ A^{2,ad}_K` and the two classical points of the
fibre of `T ↦ T²` over `1` when `char K ≠ 2`; the preimages of discs under `(T ↦ T²)^ad`, finite locally free of rank `2`, and the non-affinoid
preimage of the unit disc under `(G_m → A¹)^ad`; flatness at the Gauss point; the skyscraper
`(O_X/(T))^ad` and `(O_X/I)^ad = i^ad_* O_{Z^ad}`; `Ω_{A^{n,ad}/Spa K}` free on `dT₁,…,dTₙ`,
vanishing for unramified `h`, and the invertible `Ω_{X^ad/Spa K}` of a smooth plane cubic; the
Kummer map, the standard étale algebra `K[X]_{P'}/(P)` (the locus `P' ≠ 0`, one reduced point for
`P = X²(X − 1)` over `ℚ_3`) and the map `T ↦ T²` étale exactly away
from `0` when `char K ≠ 2`. For connectedness and properness: `A^{1,ad}_K` connected and locally connected while its
classical points are totally disconnected, `Spec(K × K)` analytifying to two points;
`P^{1,ad}_K` as two closed unit discs glued along `{|T| = 1}` with `O(P^{1,ad}_K) = K` and
complement of `A^{1,ad}` the classical point `∞`; `P^{n,ad}_K` proper, `A^{1,ad}_K` separated but
not proper, the doubled-origin line non-separated, `A^ad` proper for an abelian variety; the
normalisation of the cuspidal cubic, finite and bijective but not a closed embedding on either
side; the Frobenius-type map `T ↦ T^p` and `T ↦ T²` at `0`, not étale on either side.

For the rigid–adic comparison: `r_K(Sp A) = Spa(A, A°)`, admissibility detected by set-theoretic
covering of `r_K(X)`, and `r_K(B¹)` with its non-classical Gauss point; `A^{1,ad}_K` as `r_K` of
the rigid affine line and the non-affinoid open unit disc on both sides; `Γ(r_K(X), O) = Γ(X, O_X)`
and the skyscraper at the Gauss point with vanishing classical stalks; `r_K((A¹)^an) = A^{1,ad}_K`
and the classical points of `X^ad` as the closed points of `X`; the open-in-closed disc inclusion,
partially proper but not proper, and `r_K(P^{1,an}) → Spa(K, K°)` proper; the Kummer map on the
annulus `|T| = 1` over `Q_p` with `p ∤ n`, `T ↦ T^p` on the closed disc, the non-finite étale
inclusion `{|T| ≤ |p|} ↪ 𝔹¹`, and the smooth non-étale projection `𝔹²_K → 𝔹¹_K`. For analytic
groups: `G_a^ad = A^{1,ad}_K` with addition, `G_m^ad = A^{1,ad}_K \ {0}` with multiplication,
`μ_n^ad = Spa(K[T]/(Tⁿ − 1))` finite étale of rank `n` when `n` is invertible in `K`; for `n ≥ 1`, `[n]^ad : E^ad → E^ad` identifying `E^ad`
with `E^ad/E[n]^ad`, `(E/C)^ad = E^ad/C^ad` for a `K`-rational subgroup `C` of order `p`, and the
analytified relative Frobenius for `C = ker(Frobenius)`; `ω_{G_m^ad}` spanned by `dT/T`,
`ω_{E^ad}` spanned by the analytified `dx/(2y + a₁x + a₃)` with `[n]^*` acting as `n`, and
`ω_{E^ad/X^ad}` as the analytified Hodge line bundle on a modular curve.

For the supporting results: the annulus `K⟨X, Y⟩/(XY − ϖ)` with all maximal ideals of height 1
and `K⟨X⟩ × K` with heights 1 and 0; the identity principle on the closed unit disc and its
failure on `Sp K⟨S, T⟩/(ST)` (not normal) and on `Sp(K⟨T⟩ × K⟨T⟩)` (not connected);
`T = {ϖ}` recovering `IsWeightFamily.of_exists_isUnit` and `T = {Y}` in `ℚ_p⟨Y, Z⟩` where the
conclusion fails; the Gauss valuation on `ℚ_p[T]` with value group `p^ℤ` and the excluded rank-2
extension, and `ℚ_p[T]/(T² − p)` with value group `p^{ℤ/2}`; `K²` as morphisms
`(Spa(K, K°))_ → A²_K`; the standard refinement `S = {ϖ², ϖT, T²}` of the covering
`{|T| ≤ |ϖ|}`, `{|T| ≥ |ϖ|}` of `Max K⟨T⟩`; `Hom_K(Sp A, A^n_K) = Aⁿ` and the point `T = a`
mapping to `(T − a)`; the Weierstrass and Laurent traces of `{|T| ≤ |ϖ|}` and `{|T| = 1}` and
the non-constructible closed set `{x_{<1}}`; `K⟨T⟩` torsion-free over `K[T]`; `K⟨T, T⁻¹⟩` as a
`K`-affinoid algebra with plus ring `K°⟨T, 1/T⟩`; and `(A¹_K)^an` connected, `Spec(K × K)^an`
disconnected, and the nodal cubic irreducible after analytification.

### Dependencies

The [rigid geometry project](https://github.com/dagurtomas/rigid) treats Tate and affinoid
algebras, rigid spaces and their Berkovich comparison. The comparison here is Huber's rigid–adic
functor, built on Tau Ceti's Huber rings and valuation spectra. The valuation-spectrum carrier,
basic opens and pullback are `TauCeti.ValuationSpectrum`,
`TauCeti.ValuationSpectrum.basicOpen` and `TauCeti.ValuationSpectrum.comap`
(`TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean`).
The continuous locus is `TauCeti.ValuationSpectrum.cont`
(`TauCeti/AlgebraicGeometry/AdicSpace/Cont/Basic.lean`); the adic spectrum and its
rational subsets are `TauCeti.ValuationSpectrum.spa` and
`TauCeti.ValuationSpectrum.rationalSubset`
(`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` and
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean`). These supply
the valuation-theoretic objects of [AdicSpaces](../AdicSpaces/README.md), layers 1–2.

Layer R0 of this roadmap (`K`-affinoid algebras and their residue fields, the completed tensor
product, rings of noetherian type and their stable sheafiness, locally noetherian adic spaces,
the finite-type hierarchy, fibre products of adic spaces, closed adic subspaces, separated,
proper, partially proper, finite and quasi-finite morphisms, continuous differentials, flat,
unramified, smooth and étale morphisms with their local structure and criteria). The Foundations
of adic spaces roadmap (AdicSpaces): layer 0.5 (complete rank-one fields and `K`-affinoid algebras
are strongly noetherian), layer 2.4 (quotient pairs), layer 4.1 (Tate's acyclicity for finite
rational
coverings), layer 5.4 (the closed polydisc). The Tau Ceti roadmap ModularCurves,
layer 2B, supplies the algebraic quotient of an elliptic curve by a finite locally free subgroup;
quotients of abelian varieties by finite subgroup schemes enter only as finite locally free
surjective homomorphisms (Stacks Tag 07S7 for the free action on a projective scheme).
RigidAnalyticGeometry supplies affinoid subdomains, Tate acyclicity, rigid-analytic spaces, the
rigid analytification with its reducedness and normality, constructible density of classical
points, and Huber's functor with its full faithfulness, essential image and equivalence on
quasi-separated objects. Mathlib supplies `AlgebraicGeometry.Scheme`, `LocallyRingedSpace`,
`Scheme.forgetToLocallyRingedSpace`,
`ΓSpec.locallyRingedSpaceAdjunction`, `LocallyOfFiniteType`, `AffineSpace`, `IsOpenImmersion`,
`IsClosedImmersion`, `IsImmersion`, `IsFinite`, `IsSeparated`, `IsProper`, `QuasiCompact`,
`UniversallyClosed`, `Surjective`, `Flat`, `Etale`, `Smooth`, `Proj.isSeparated`,
`Scheme.Modules`, `SheafOfModules` and its pullback, the presheaf tensor
`PresheafOfModulesOfCommRing.Monoidal.tensorObj` and module sheafification used by
`AdicSpace.tensorModules`,
`KaehlerDifferential` and its basis and base-change lemmas, `Module.Flat`,
`Module.FaithfullyFlat`, `Module.Projective`, `Module.Finite`, `AdicCompletion`, `IsLocalRing`,
`IsNoetherianRing`, `IsLocalRing.CotangentSpace`, `Ideal.height` and the going-down lemmas,
`MaximalSpectrum`, `Valuation`, `LocalSubring.exists_le_valuationSubring`,
`CategoryTheory.Limits.pullback`, `CategoryTheory.GrpObj`, `CategoryTheory.Functor.mapGrp`,
`CategoryTheory.Functor.IsDenseSubsite`. Tau Ceti supplies `Huber.Pair`, `Huber.Pair.powerBounded`,
`Huber.Pair.quotient`, `Huber.powerBoundedSubring`, `Huber.IsTopologicallyFiniteType`,
`Huber.IsStrictlyTopologicallyFiniteType`, `Huber.IsStronglyNoetherian`, `Huber.IsHuberRing`,
`Huber.PairOfDefinition` with `completionLocalization` and
`TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`,
`Huber.IsWeightFamily` and `Huber.weightedRestrictedSubring`, `ValuationSpectrum.spa`,
`ValuationSpectrum.rationalSubset`, `ValuationSpectrum.closedPolydisc`,
`ValuationSpectrum.classicalPoint` (the `K`-rational points of the unit polydisc),
`TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc`,
`TauCeti.Huber.PairOfDefinition.exists_forall_mem_idealImage_exists_sum_eq`,
`TauCeti.Huber.PairOfDefinition.isStrictlyTopologicallyFiniteType_toCompletionLoc`,
`TauCeti.Huber.PairOfDefinition.isRingOfIntegralElements_integralClosure_adjoin_plus`,
`AlgebraicGeometry.AbelianVariety` with its tangent space, smoothness and isogeny API,
`AlgebraicGeometry.ZariskiCotangentSpace`, `Bialgebra.CotangentSpace`,
`FiniteLocallyFreeBicommutativeHopfAlgCat`, `AdditiveGroup.groupScheme`,
`WeierstrassCurve.Affine.invariantDifferential`.

## Downstream consumers

The following sections use Part II's results or compare their constructions with them.
AdicSpacesPartII R0.1b's algebraic *adic-completion-noetherian* supplies R0's
uniform-completion comparison. AdicSpacesPartIII R3.1a owns
`TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.analytification.modules_chartSections`,
using its R3.1 associated-module sheaves and Part II R1.4's general module pullback.

The following layers consume AdicSpacesPartII layer R1: AdicSpacesPartIII layer R2
(the Hasse invariant on the analytified Hodge bundle), AdicSpacesPartIII layer R3
(coherent sheaves, the glued sheaf of differentials), AdicEtaleGeometry A2.6a
(the analytification morphism `λ_X` on étale sites), AdicSpacesPartIV layer R4
(the rigid comparison and other site applications) and
AdicSpacesPartIV layer F1 (the dagger–rigid comparison); PerfectoidTowers layer P8
consumes the closed adic subspaces of analytified quasi-projective varieties.

| Destination | Relation to Part II |
|---|---|
| [AdicEtaleGeometry A0.1–A0.8](../AdicEtaleGeometry/README.md#a01-the-comparison-interface-the-pushout-of-complete-huber-pairs) | The fibre-product, uniformization, rational-pullback and finite-étale-pullback comparisons use R0's completed tensors and affinoid products. The analytic locus uses `AdicSpace.IsAnalytic` on `TauCeti.AdicSpace`, supplied here, and Tau Ceti's analytic points and open restrictions. |
| [AdicEtaleGeometry A1.4](../AdicEtaleGeometry/README.md#a14-comparison-with-hubers-definitions), *etale-morphisms-local-description-and-comparison* | The comparison uses R0's *etale-local-open-finite-etale-factorisation* (Huber96, 2.2.8) and its finite-étale algebra comparison. |
| [AdicSpacesPartIII R3.1](../AdicSpacesPartIII/README.md#r31-the-associated-sheaf-and-acyclicity-for-finite-modules), *noetherian-rod-acyclicity-finite-modules* | Sheaf-cohomology vanishing uses R0's noetherian-ring-of-definition sheafiness and finite-module Čech results. |
| [AdicSpacesPartIII R3.1a](../AdicSpacesPartIII/README.md#r31a-affinoid-sections-of-analytified-modules) | The affinoid section comparison for analytified associated modules and its associated-sheaf Checks use R1.4's general exact pullback, stalk, tensor and ideal comparisons. |
| [AdicSpacesPartIII R3.6](../AdicSpacesPartIII/README.md#r36-the-sheaf-of-continuous-differentials-and-kiehls-proper-mapping-theorem), *sheaf-of-continuous-differentials* | The differential sheaf and its analytification comparison glue R0's continuous modules and R1's *analytic-kahler-differentials* chart comparison. |
| [AdicSpacesPartIV R5.6](../AdicSpacesPartIV/README.md#r56-coefficient-algebras), *mixed-completed-tensor* | The ring-case comparison and the contrast between bounded families and null families refer to R0's completed tensors; the mixed construction is owned by R5. |

**AdicSpacesPartIII R3.6: invariant differential sheaves over a scheme base.**
For `K` as in R1's unit-fibre target, let `Y` be a `K`-scheme locally of finite
type and `f : G → Y` a group scheme
locally of finite type with unit `e`. Using R3.6's `AdicSpace.relativeDifferentials`
and `relativeDifferentials.analytificationIso`, construct
`ω_{G^ad/Y^ad} := (e^ad)^*Ω¹_{G^ad/Y^ad}` and prove a natural isomorphism
`ω_{G^ad/Y^ad} ≅ (e^*Ω¹_{G/Y})^ad` of `O_{Y^ad}`-modules, by pulling back along `e^ad` the
identification `Ω¹_{G^ad/Y^ad} ≅ (Ω_{G/Y})^ad` of the analytified algebraic differential sheaf
(*analytic-kahler-differentials*) and using `(e^ad)^*(F^ad) ≅ (e^*F)^ad`
(*analytification-of-modules*). It must commute with
pullback along group homomorphisms and with base change `Y' → Y` between
`K`-schemes locally of finite type. Prove also
`Ω¹_{G^ad/Y^ad} ≅ (f^ad)^*ω_{G^ad/Y^ad}` and local freeness of `ω` of rank `g`
when `f` is smooth of relative dimension `g`. At `Y = Spec K`, its unit fibre
must identify with `AdicSpace.continuousDifferentialFibre` and the four
`analytificationGrp.invariantDifferentials` theorems of R1. The algebraic
translation isomorphism is [Stacks, Tag 047I](https://stacks.math.columbia.edu/tag/047I);
its analytic comparison and base change use Huber96, (1.6.2)(i) and
Proposition 1.6.3(iii)–(iv), pp. 76–78.

The trivial group gives the zero sheaf. For `G_m`, the resulting sheaf is
`O·dT/T`, free of rank one. For an elliptic curve
`E : y² + a₁xy + a₃y = x³ + …`, the analytification of
`dx/(2y + a₁x + a₃)` spans `ω`, using Tau Ceti's
`WeierstrassCurve.Affine.invariantDifferential`, and `[n]^*` acts by `n`.
For commutative groups, require the global invariant-form identities
`μ*ω = pr₁*ω + pr₂*ω` and `[n]*ω = n·ω`. For the universal elliptic curve
over a modular curve, the comparison identifies `ω` with the analytified Hodge
line bundle, whose `(p−1)`-st power carries R2's Hasse invariant. This is the
consumer in BHW, §3.3, p. 12 of arXiv:1902.03985v4. These sheaf targets use
R3.6's gluing of the R1 *analytic-kahler-differentials* chart comparison.

Part III's chart arguments use `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart`
and `HomChart`.

AdicSpacesPartIII uses R0 and R1 for formal generic fibres, coherent sheaves, GAGA and traces.
Its R3 differential sheaf uses `Huber.ContinuousKaehlerDifferential.localizationEquiv`,
`localizationEquiv_D`, `localizationEquiv_symm` and `map_comp` for rational restriction
and gluing, on the module of continuous differentials defined here. Its geometric
unramified, smooth and étale predicates are `AdicSpace.Unramified`, `Smooth` and
`Etale` from R0.16. AdicSpacesPartIV uses R0 and R1 for site applications, families and dagger geometry.
AdicEtaleGeometry A0 uses completed and uniform completed tensors, analytic pullbacks and
analytic loci; A1 uses the étale local structure theorem; A2 uses separatedness, properness,
smooth charts, relative polydiscs and tori. PerfectoidSpaces P0–P4 and P7 and PerfectoidTowers P9 use affinoid
algebras, adic morphisms, completed tensors and fibre products, including P4.5a's exactness
over a field. [PerfectoidTowers P8.21](../PerfectoidTowers/README.md#p821-zariski-closed-loci-in-perfectoid-towers)
uses R1's analytification of closed immersions and their ideal sheaves to describe closed
adic subspaces of analytified quasi-projective varieties and their perfectoid pullbacks.
DiamondsAndVStacks uses the Tate-ring norm and affinoid algebras.

## References

- [ECD] Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4; locators give printed page numbers. https://arxiv.org/abs/1709.07343v4
- [Sch12] Peter Scholze, *Perfectoid spaces*, Publ. IHÉS 116 (2012); arXiv:1111.4914, author manuscript. https://arxiv.org/abs/1111.4914
- [SGA 4 VI] A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas*, Tome 2, Exposé VI; French transcription, Exposé VI numbering. https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf
- [Scholze–Weinstein 2013] P. Scholze, J. Weinstein, *Moduli of p-divisible groups*, Camb. J. Math. 1 (2013), 145–237; arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357v2
- [Bourbaki] Nicolas Bourbaki, *Commutative Algebra*, Hermann, 1972, Ch. III, §2, no. 12.
- [Huber94] Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217
- [Huber96] Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996 (not freely available). https://link.springer.com/book/10.1007/978-3-663-09991-8
- [Wedhorn] Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (14 Oct 2019). https://arxiv.org/abs/1910.05934v1
- [Hübner] Katharina Hübner, *Adic spaces*, arXiv:2405.06435v1 (10 May 2024). https://arxiv.org/abs/2405.06435
- [Morel] Sophie Morel, *Adic spaces (lecture notes)*, version of April 22, 2019. https://web.math.princeton.edu/~smorel/adic_notes.pdf
- [KL15] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (9 May 2015). https://arxiv.org/abs/1301.0792
- [Conrad-AWS] Brian Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 lecture notes. https://math.stanford.edu/~conrad/papers/aws.pdf
- [Zavyalov24] Bogdan Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516v2 (17 Jul 2025). https://arxiv.org/abs/2409.15516
- [Berkeley] Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020). https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
- [EGA I] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique I*, Publ. Math. IHÉS 4 (1960). http://www.numdam.org/item/PMIHES_1960__4__5_0/
- [HK] David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, version dated August 6, 2026. https://kskedlaya.org/papers/criteria.pdf
- [Huber93] Roland Huber, *Continuous valuations*, Math. Z. 212 (1993) 455–477. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212
- [EGA III₁] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique III (première partie)*, Publ. Math. IHÉS 11 (1961). http://www.numdam.org/item/PMIHES_1961__11__5_0/
- [Stacks] The Stacks Project Authors, *The Stacks Project*, cited by tag. https://stacks.math.columbia.edu
- [CHJ] Przemyslaw Chojecki, David Hansen, Christian Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2 (22 Aug 2016), published in Documenta Math. 22 (2017); printed page numbers of the arXiv PDF. https://arxiv.org/abs/1507.04875
- [Zavyalov-Q] Bogdan Zavyalov, *Quotients of admissible formal schemes and adic spaces by finite groups*, arXiv:2102.02762v2 (7 June 2023); published in Algebra & Number Theory 18(3) (2024) 409–475. https://arxiv.org/abs/2102.02762
- [Scholze13] Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (3 Nov 2012) (Forum Math. Pi 1 (2013)). https://arxiv.org/abs/1205.3463
- [FK] Kazuhiro Fujiwara, Fumiharu Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734v5 (28 Feb 2017). https://arxiv.org/abs/1308.4734
- [BHW] Christopher Birkbeck, Ben Heuer, Chris Williams, *Perfectoid Hilbert modular forms and overconvergent Hilbert modular forms*, Annales de l'Institut Fourier 2023. https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf
- [dJvdP] Johan de Jong, Marius van der Put, *Étale cohomology of rigid analytic spaces*, Documenta Mathematica 1 (1996), 1–56; EMS Press PDF. https://ems.press/content/serial-article-files/25781
- [DLLZ-A] Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2 (30 Oct 2022); PDF page = printed page. https://arxiv.org/abs/1912.09836
- [Conrad-IC] Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf. https://math.stanford.edu/~conrad/papers/irredpaper.pdf
- [Conrad-RA] Brian Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006) 1049–1126; author PDF amplepaperfinal.pdf (45 pp.). https://math.stanford.edu/~conrad/papers/amplepaperfinal.pdf
- [Conrad-MR] Brian Conrad, *Modular curves and rigid-analytic spaces*, Pure Appl. Math. Q. 2 (2006); author PDF genpaper.pdf. https://math.stanford.edu/~conrad/papers/genpaper.pdf
- [Conrad-Adic] Brian Conrad, *A brief introduction to adic spaces*, author notes Adicnotes.pdf (22 pp.). https://math.stanford.edu/~conrad/papers/Adicnotes.pdf
- [BL I] Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry I. Rigid spaces*, Math. Ann. 295 (1993) 291–317. https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295
- [GK00] Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (14 Aug 2014), author's version of J. reine angew. Math. 519 (2000) 73–95, with a footnote to Lemma 4.7 correcting the published hypotheses. https://arxiv.org/abs/1408.3329
- [Kedlaya06] Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006) 15–97), with the author's errata file https://kskedlaya.org/papers/finiteness-errata.txt. https://arxiv.org/abs/math/0208027
- [KL16] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, arXiv:1602.06899v3 (21 Oct 2019); locators give the printed page numbers of the arXiv PDF. https://arxiv.org/abs/1602.06899
- [Berkovich] V. G. Berkovich, *Spectral theory and analytic geometry over non-Archimedean fields*, Math. Surveys Monogr. 33, AMS 1990.
- [Bosch14] Siegfried Bosch, *Lectures on Formal and Rigid Geometry*, Lecture Notes in Mathematics 2105, Springer 2014, §4.3, Lemma 4.
- [BGR] S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren der mathematischen Wissenschaften 261, Springer 1984.
- [Hu4] Roland Huber, *Bewertungsspektrum und rigide Geometrie*, Regensburger Mathematische Schriften 23, 1993 (Huber96's reference [Hu4]; cited through Huber96; not available online).
- [HuKn] Roland Huber, Manfred Knebusch, *On valuation spectra*, Contemp. Math. 155 (1994) 167–206 (Huber96's reference [HK]; the key `[HK]` of this README is Hansen–Kedlaya).
- [L1] Werner Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990) 341–371 (cited through Conrad-MR and Huber96 as [L1]).
- [Kedlaya-CM] Kiran S. Kedlaya, *Notes on condensed mathematics*, online notes, §11 *Huber rings and solid rings*. https://kskedlaya.org/condensed/sec_huber_rings.html

# Roadmap: perfectoid towers: finite quotients, closed perfectoid loci and continuous torsor descent

**Summary.** Perfectoid Shimura varieties are limits of towers of rigid spaces; this roadmap builds,
on top of [PerfectoidSpaces](../PerfectoidSpaces/README.md), the three tools their study needs.
Finite quotients: the invariant Huber pair and `|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`, perfectoid
invariants for any `|G|`, and categorical quotients of affinoid perfectoid spaces, of adic, rigid
and perfectoid spaces with an invariant affinoid cover, and of analytically separated perfectoid
spaces. Closed perfectoid loci: Zariski-closed embeddings, good towers of projective varieties, and
perfectoidisation of integral extensions and closed subvarieties. Descent along pro-étale Galois
towers with perfectoid limit: of functions, finite locally free modules and twisted character sheaves
with weight-space coefficients, local freeness of character sheaves trivialised at finite level, and
coefficient change. The cochain foundations include lifting through discrete surjections,
cochains into inverse limits and the all-degree homogeneous comparison for jointly continuous
actions. The end results are the finite-quotient theorems for analytically separated
perfectoid spaces and good towers ([HJ] Theorem 5.8, Proposition 5.13), the closed-locus tilde-limit
comparison ([HJ] Lemma 5.7), and descent along towers ([CHJ] §2, [BHW] §3–4).

This roadmap constructs finite quotients of perfectoid spaces, closed perfectoid loci in towers,
and continuous torsor descent of functions, modules and character sheaves with rigid coefficients.
It uses perfectoid carriers, tilting, almost purity and tilde-limits from
[PerfectoidSpaces](../PerfectoidSpaces/README.md), v-topology and diamond geometry from
[DiamondsAndVStacks](../DiamondsAndVStacks/README.md), and sousperfectoid coefficients from
PerfectoidSpaces P3.17a and AdicSpacesPartIV R5.5–R5.11.

| Layer | Construction |
| --- | --- |
| P8 | Finite quotients and closed perfectoid loci in towers |
| P9 | Continuous torsor descent with coefficients |

Dependencies: AdicSpaces §§0–5; AdicSpacesPartII R0, R1; AdicSpacesPartIII R3;
AdicEtaleGeometry A1, A2, A4.2–A4.5, A4.2a, A4.7; PerfectoidSpaces P0–P7,
including P3.17a–P3.17b, P5.13, P6.15–P6.17, P7.11, P7.16;
AdicSpacesPartIV R4, R5.5–R5.11; DiamondsAndVStacks D2–D6; ProfiniteCohomology Layer 3;
PadicFunctionalAnalysis §§2.2–2.4 (Banach bases and model comparisons).

## Scope and ownership

PerfectoidSpaces owns P0–P7, and this roadmap owns the tower-quotient and torsor-descent layers P8–P9.

- P8: invariant Huber pairs and invariants of a perfectoid ring, quotients of affinoid perfectoid
  spaces and finite quotients of perfectoid spaces, good towers, and Zariski-closed loci in perfectoid
  towers.
- P9: continuous cochains, inverse-limit and homogeneous comparisons, pro-étale Galois towers,
  descent of functions along a perfectoid tower, descent with
  weight-space coefficients, twisted character sheaves and their local freeness.

PadicFunctionalAnalysis §§2.2–2.4 owns the Banach-basis and model-space inputs to P8.7 and
P9.7; the invariant-tensor comparisons and their geometric applications belong here.
DiamondsAndVStacks owns the v-topology, diamondification, diamond presentations and spatiality,
together with the foundational comparisons that P9 applies to towers: the vector-bundle
comparison across the analytic, étale, pro-étale and v-sites (D2.9, [KL16] Theorem 3.5.8, p. 76)
and the analytic/diamond étale-site equivalence (D6.5), specialised to smoothoid spaces in P9.11,
and the seminormal comparison `O_X ≅ ν_*Ô_X` and the full faithfulness of diamondification on
seminormal rigid spaces (D6.9, [KL16] Theorem 8.2.3, pp. 162–163). The applications to a prescribed pro-étale Galois tower
belong here: P9.8 owns descent of module sections and morphisms along the tower, and P9.12 owns
function descent over a seminormal base. They apply the D2.9 and D6.9 inputs to a specified tower
and do not supply those foundations. These tower applications are downstream
of the site and diamond constructions.
PerfectoidSpaces supplies the perfectoid rings, spaces, almost algebra and pro-étale calculus,
including sousperfectoid spaces (P3.17a) and the rigid pro-étale affinoid perfectoid basis (P7.16).
AdicEtaleGeometry owns analytic étale geometry, the pro-étale site with the finite-level
pro-object, covering and torsor Čech nerve of a profinite Galois cover (A1, A1.12) and finite étale
torsor towers (A4); AdicSpacesPartII owns completed tensor products, separatedness and
analytification (R0, R1); AdicSpacesPartIII owns sheafy affinoid acyclicity and Kiehl's theorem
(R3); AdicSpacesPartIV owns smooth products with perfectoid spaces and coefficient
localization theory, including the coefficient Kiehl comparisons (R4, R5.5–R5.11).
AdicEtaleGeometry A4.2a supplies finite Galois module descent, including projectivity and rank reflection.
Lifting continuous cochains through surjections onto discrete spaces is Tau Ceti's
`TauCeti.ContCohomology.exists_continuous_lift` and is not restated. P9.0 owns continuous
cochains into inverse limits, and the general continuous inhomogeneous cochain model with its all-degree
homogeneous comparison for jointly continuous actions on topological modules. Its coefficient
module need not be compact. P9.5 uses P9.0 for the geometric Čech-nerve, completed-section
and integral/rational tower comparisons.
The locally analytic distribution theory and Shimura-variety applications belong to downstream
roadmaps. P8 specifies the integral-extension perfectoidization needed for its closed loci.

Already stated or built elsewhere, cited by the layers and not restated:

- integrality of `A` over `A^G` — Mathlib `Algebra.IsInvariant.isIntegral` (P8.1); the
  `Spec`-level orbit space and the torsor case `|Spa(B)|/G ≅ |Spa(A)|` — Mathlib
  `Algebra.IsInvariant.exists_smul_of_under_eq`, Tau Ceti
  `AffineInvariantQuotient.isQuotientMap_projection`, AdicEtaleGeometry layer A4
  (*torsor-spa-orbits*, *spa-of-completed-tower*) (P8.2); `G`-clean neighbourhoods in locally
  compact Hausdorff spaces — Mathlib `ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`
  (P8.13);
- the pro-étale site of a locally noetherian adic space — AdicEtaleGeometry layer A1
  (*pro-etale-site-corrected*, A1.12); the affinoid perfectoid basis over a rigid base —
  PerfectoidSpaces P7.16 (*proetale-site*); the pro-étale
  structure sheaves over a perfectoid base — DiamondsAndVStacks layer D2 (D2.5) (P9.2); finite
  étale torsor towers with their completed pairs and self-products — AdicEtaleGeometry layer A4
  (*finite-etale-torsor-tower*, *completed-tower-pair*, *completed-tower-self-product*), and the
  torsor property of a profinite tower over a perfectoid base — DiamondsAndVStacks layer D3
  (D3.10) (P9.4, P9.5); the finite-level pro-object of a profinite Galois cover, with its
  covering and torsor Čech nerve — AdicEtaleGeometry A1.12, `profinite-galois-cover-is-covering`
  (P9.4, P9.5).

## Conventions

Fix a prime `p`. A perfectoid Tate ring is complete and Hausdorff, uniform, and has a
pseudouniformiser `ϖ` with `ϖ^p | p` in `R°` such that Frobenius `R°/ϖ → R°/ϖ^p` is an isomorphism;
injectivity of Frobenius is automatic and the condition does not depend on `ϖ`. No perfectoid base
field is fixed; statements that hold only over a perfectoid field say so. A perfectoid Tate pair
`(R, R⁺)` is a Tau Ceti Huber pair with `R` perfectoid; `R°` is its maximal ring of integral elements
and `R°°` the topologically nilpotent elements. `Perfd` denotes perfectoid spaces of all
characteristics and `Perf` its characteristic-`p` subcategory; `X♭` is the tilt, `♯` the sharp map,
which is multiplicative and continuous but not additive. Almost mathematics is always with respect
to a stated basic setup `(V, m)`: `m` idempotent with `m ⊗_V m` flat; for a perfectoid Tate ring the
setup is `(R°, R°°)`, equivalently the root ideal `(ϖ^{1/p^∞})` of a pseudouniformiser with compatible
`p`-power roots, and the two setups on `R⁺ ⊆ R°` are compared explicitly. "Almost zero", "almost
isomorphism", "almost finite étale" and "almost acyclic" are relative to that setup; an almost
statement is never silently upgraded to an actual one.

Rings of integral elements are open, integrally closed and contained in `R°`; completed colimits of
Tate pairs complete the colimit of the plus rings `ϖ`-adically and invert `ϖ`. "qcqs" means
quasicompact and quasiseparated; morphisms of perfectoid spaces are morphisms of adic spaces.
Tilde-limits carry both the topological condition and the affinoid density condition. Finite group quotients
are categorical quotients in adic spaces, not finite étale torsors unless the action is free.
Pro-étale Galois towers have profinite group `G` with the tower's finite levels indexed by open
normal subgroups. A left action `ρ : G →* Aut X` on a space has `ρ(gh) = ρ(g) ∘ ρ(h)`. Towers
carry right actions, with `(γδ)^* = γ^*δ^*` on functions and Čech increments
`(x, g₁, …, gₙ) ↦ (x, xg₁, …, xg₁⋯gₙ)`. Twisted invariants use the inverse cocycle,
`γ·f = c(γ)⁻¹f` with `c(γδ) = c(γ)·γ(c(δ))`.

Each target below is written with its hypotheses in the sentence, its source locator in parentheses
(short keys are resolved in the References), its API as named lemmas and its unit tests as `Checks`;
`Suggested.lean` gives typed forms for a subset of these targets and Checks. Existing definitions
keep their library namespaces. Each subsection of P8 and P9 ends with a `Lean:` line. It names the
declarations of `TauCetiRoadmap/PerfectoidTowers/Suggested.lean` that carry the subsection's
targets and says which Checks its `example`s state. Where the line says *README only*, the target,
its API and its Checks are specified in this README alone and have no declaration in this
roadmap's `Suggested.lean`; they are described in prose and carry italic labels, which are
descriptive and not Lean declarations. Backticked names are reserved for declarations of this
roadmap's `Suggested.lean` and for names of the pinned libraries and of supplier roadmaps. The
declarations of `Suggested.lean` lie in the namespace `TauCetiRoadmap.PerfectoidTowers`, with
`MulAction.IsGClean` and `MulAction.exists_isGClean` in its sub-namespace `MulAction`.

## Exact supplier contracts

### From TauCetiRoadmap.PerfectoidSpaces

The names in this table are those PerfectoidSpaces fixes for its targets. Its `Suggested.lean`
gives Lean signatures for the subset it prototypes, among them `Perfectoid.IsPerfectoidTateRing`,
`Perfectoid.IsIntegralPerfectoid`, `PerfectoidSpace.isAffinoidPerfectoid` and
`PerfectoidSpace.Perfd`. This roadmap's `Suggested.lean` imports none of them: it states only
what the pinned Mathlib and Tau Ceti carry, so the headlines whose statements need these four
carriers (P8.4, P8.7–P8.8 and P8.18) are README only. The PerfectoidSpaces README specifies the
rest at the cited layers.
Names beginning with `Almost`, `Perfectoid`, `PerfectoidSpace` or `AdicSpace` in this
table have the prefix `TauCetiRoadmap.PerfectoidSpaces`. The table includes the
carriers and maps used by the Checks; typeclass instances, generated constructors
and structure projections are supplied with their parent declarations.

| Application | Exact supplier | Use |
| --- | --- | --- |
| Almost coefficients | `TauCetiRoadmap.PerfectoidSpaces.Almost.BasicSetup`, `Almost.Module`, `Almost.Algebra` | P9's almost vanishing and coefficient sheaves use the specified basic setup. |
| Perfectoid rings and pairs | `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing`, `Perfectoid.IsIntegralPerfectoid`, `Perfectoid.PairCat`, `Perfectoid.PseudoUniformizerRoots` | P8 invariants and integral extensions retain the given topologies and plus rings. |
| Tilting and affinoid charts | `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.tilt`, `Perfectoid.rationalPair`, `PerfectoidSpace.ofPair`, `PerfectoidSpace.spaFunctor`, `PerfectoidSpace.Chart` | Quotient charts, componentwise perfectoidness and closed loci use P1–P2. |
| Adic spaces and adic representatives (P2.10, P3.17) | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.toAdicSpace` (the inclusion `Perfd p ⥤ PreAdicSpace`, landing in adic spaces) with *PerfectoidSpace.locallyStronglySheafy* for an adic representative | *toVRingedSpace* and *finite-tower-over-perfectoid-tower* read perfectoid spaces and their morphisms in `TauCeti.AdicSpace` through the inclusion, which lands there by `PerfectoidSpace.isPerfectoidSpace_le_isAdic`. |
| Residue characteristic (P7.11) | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.TowerGeometry.IsOverZp` | Topological nilpotence of `p` on every affinoid chart is the finite-level hypothesis in P8. |
| Spaces and functions | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd`, `PerfectoidSpace.globalSections`, *PerfectoidSpace.globalPlus*, *PerfectoidSpace.globalPullback*, *PerfectoidSpace.pullbackOverAnalytic* | P8 analytic separatedness and P9 descent use the supplied perfectoid geometry. |
| Closed loci and pro-étale maps | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.zeroLocus`, `PerfectoidSpace.zeroLocus_sup`, *PerfectoidSpace.IsProEtale*, `PerfectoidSpace.prodProfinite` with its point sections (P6.8, Checks `pointSection_singleton`, `pointSection_two_points`, `pointSection_empty_base`) | P8 global closed embeddings, the P8.12 torsor sections and P9 profinite torsors. |
| Tilde-limits and tower geometry | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsTildeLimit`, *PerfectoidSpace.IsPreperfectoid*, `PerfectoidSpace.TowerGeometry.IsFinite`, *PerfectoidSpace.VQuotient.tildeLimit_represented_comparison* | P8 good towers and P9 Galois towers use P7's limit conditions and projection comparisons. |
| Represented-limit topology and density | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.VQuotient.represented_limit_homeomorph`, `TauCetiRoadmap.PerfectoidSpaces.AdicSpace.HasDenseCharts` | *GoodTower.homeomorph* specializes the supplied homeomorphism to the represented cone of a good tower; *GoodTower.isTildeLimit* requires the separate, supplied density predicate. |
| Finite-level affinoid basis (P7.11) | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.VQuotient.represented_limit_affinoid_basis` | P8.19's *finite_level_affinoid_basis* adapts the represented-functor basis to the diamond-limit cone through DiamondsAndVStacks D6.4, with locally noetherian analytic levels, finite transitions and `TowerGeometry.IsOverZp`. |
| Rigid pro-étale affinoid perfectoid basis (P7.16) | `TauCetiRoadmap.PerfectoidSpaces.ProEtaleSite.IsAffinoidPerfectoid`, `TauCetiRoadmap.PerfectoidSpaces.ProEtaleSite.AffinoidPresentation`, `TauCetiRoadmap.PerfectoidSpaces.ProEtaleSite.affinoidPerfectoid_basis` | P9 uses the supplied completed pairs, base maps and point comparison on the corrected AdicEtaleGeometry A1.12 site. |
| Sousperfectoid geometry (P3.17a–P3.17b) | PerfectoidSpaces P3.17a.1–P3.17a.4, *sousperfectoid-etale-base-change*; P3.17b, *perfectoid-times-polydisc* | P9 coefficient products use the supplied sousperfectoid charts and étale base-change formula; smooth products use AdicSpacesPartIV R5.5. |
| Almost-zero modules and basic setups | `Almost.BasicSetup.IsAlmostZero`, `Almost.BasicSetup.almostZero`, `Almost.BasicSetup.ofCompatibleRoots`, `Almost.BasicSetup.ofValuationRing`, `Almost.BasicSetup.padicComplex_maximalIdeal_not_fg` | P9 specifies annihilation by the root ideal or valuation maximal ideal, including the setup on `PadicComplexInt p`. |
| Almostification and ordinary Tor | `Almost.toAlmost`, `Almost.Module.ordinaryTor` | P9 almostifies module sections and uses ordinary derived tensor groups in coefficient-change statements. |
| Tilting maps and completed pair products | *Perfectoid.Pair.tiltHom*, *Perfectoid.PairCat.tiltFunctor*, `Perfectoid.PairCat.tensorPair`, `Perfectoid.tilt.coeff`, `Perfectoid.tilt.sharp` | P8 tilting of quotients uses the supplied maps; the affinoid self-product Check uses the supplied tensor pair. |
| Rational localization carriers and maps | *Perfectoid.RationalLoc*, `Perfectoid.RationalLoc.pair`, `Perfectoid.RationalLoc.structureMap`, `Perfectoid.RationalOpen`, *Perfectoid.rationalMap* | P8 compares invariant rational localizations with the completed localization and its canonical map. |
| Root polynomials and exponent groups | *Perfectoid.PseudoUniformizerRoots.rootPB*, *Perfectoid.pPowerExponents*, *Perfectoid.pPowerIntegers* | P8–P9's root coordinates use these exponent groups. |
| Perfected discs and their coordinates | `Perfectoid.perfectedTateAlgebra`, `Perfectoid.perfectedTateAlgebra.rootX`, `PerfectoidSpace.discPair`, `PerfectoidSpace.gaussPoint`, *PerfectoidSpace.spaSpaceEquiv* | P8's closed-point, punctured-disc and Gauss-point Checks use the actual root coordinate and valuation spectrum. |
| Cyclotomic field | `Perfectoid.padicCyclotomic` | P8 tilting examples and P9 cyclotomic towers use the completed cyclotomic subfield of `ℂ_p`. |
| Perfectoid field test objects | *PerfectoidSpace.AffinoidField*, `PerfectoidSpace.AffinoidField.toPair` | P8 closed loci and P9 torsor fibers use perfectoid fields with their specified valuation subrings. |
| Characteristic-p test spaces | `PerfectoidSpace.InCharP`, `PerfectoidSpace.Perf` | P8 diamond comparisons use the characteristic-p subcategory of `Perfd`. |
| Points and open restrictions | `PerfectoidSpace.isPerfectoidSpace_restrict` | `Perfd p` is a full subcategory of Tau Ceti's `PreAdicSpace`, so points, maps on points and open restrictions are those of `TauCeti.PreAdicSpace.forgetToTop`, `TauCeti.PreAdicSpace.restrict` and `TauCeti.PreAdicSpace.ofRestrict`; the supplied lemma keeps an open restriction in `Perfd p`. P8 tests images, closed loci and open covers on these valuation points, including the empty-open Checks. |
| Universal closed subspaces | *PerfectoidSpace.zariskiClosedSubspace*, `PerfectoidSpace.zariskiClosedSubspace.ι`, *PerfectoidSpace.IsStronglyZariskiClosed* | P8's *IsZariskiClosedEmbedding* tests the supplied affinoid predicate on every chart; closed-point Checks use the supplied closed subspace and inclusion. |
| Closed immersions and separatedness | `PerfectoidSpace.IsClosedImmersion`, `PerfectoidSpace.IsSeparated` | P8 compares global Zariski embeddings and analytic separation with P4's predicates on perfectoid spaces. |
| Nonseparated gluing | *PerfectoidSpace.glueSelf*, `PerfectoidSpace.glueSelf.fold`, *PerfectoidSpace.discAnnulusOpen* | P8's nonseparated Check glues two discs along the supplied annulus and maps the glued space to the base field by the fold followed by the structure map of the disc. |
| Affinoid functions | `PerfectoidSpace.globalSectionsAffinoidEquiv_spec` | P8–P9 identify global functions of a perfectoid affinoid with its complete ring, retaining the canonical pullbacks. |
| Finite étale perfectoid maps | `PerfectoidSpace.IsFiniteEtale` | P9 tests the finite levels of a perfectoid torsor tower using the imported geometric predicate. |
| Locally profinite products and their maps | *PerfectoidSpace.prodLocallyProfinite*, `PerfectoidSpace.prodLocallyProfinite.homEquiv`, `PerfectoidSpace.prodProfinite.fst`, `PerfectoidSpace.prodProfinite.map` | P9 constructs torsor self-products and equivariant maps with the supplied product universal property; `prodProfinite` and its point sections are listed above. |

In P9, `AffinoidPresentation` and its `points` comparison, and
`ProEtaleSite.IsAffinoidPerfectoid`, denote the PerfectoidSpaces P7.16 interfaces
in `TauCetiRoadmap.PerfectoidSpaces.ProEtaleSite`. P9 defines its completed sheaves
and tower comparisons on these supplied objects.

### From TauCetiRoadmap.PadicFunctionalAnalysis

[PadicFunctionalAnalysis §§2.2–2.4](../PadicFunctionalAnalysis/README.md#layer-2-model-spaces-and-bases)
supplies the basis and model interfaces used in P8.7 and P9.7.
Here `c₀(I,K)` is its native `C₀(I,K)` for a discrete index type `I`.

| Application | Supplier section and interface | Use |
| --- | --- | --- |
| Specified basis and model | §2.2: coefficient expansion and conversion between an orthonormal basis and a chosen linear model isometry | P8.7 transports its specified bounded model through completed tensors; P9.7 uses an isometry when the given norm admits one. |
| Countable-type Banach space | §2.4: a `t`-orthogonal basis for `0 < t < 1` and a continuous linear equivalence with a `C₀` model over any complete nontrivially valued ultrametric field | P9.7 uses this bounded model equivalence for the whole chart algebra, including over nondiscretely valued perfectoid fields. |
| Discretely valued field | §2.3: potential orthonormalisability of every Banach space by an equivalent norm, with §2.2's model comparison | P9.7 uses the resulting bounded linear equivalence for arbitrary index sets; isometry for the original norm requires an orthonormal basis for that norm. |

### From TauCetiRoadmap.DiamondsAndVStacks

The names in this table are those DiamondsAndVStacks fixes for its targets; its `Suggested.lean`
prototypes a subset and its README specifies the rest at the cited sections. This roadmap's
`Suggested.lean` uses none of them.
Names beginning with `Geometry`, `Perf`, `PreAdic` or `Rigid` here have the
prefix `TauCetiRoadmap.DiamondsAndVStacks`.

| Application | Exact supplier | Use |
| --- | --- | --- |
| v-topology and test category | `TauCetiRoadmap.DiamondsAndVStacks.Geometry.vTopology`, `Geometry.Perf`, `Geometry.space`, `Geometry.proet` | D2.1–D2.2 supply the characteristic-p perfectoid v-site for P8 quotients. |
| v-sheaf and point-space carriers | `Geometry.Spaces`, `Geometry.VSheaf`, `Perf.Diamond.space` | P8 quotient and spatial-presentation statements use the supplied sheaf category and its topological realization. |
| Diamond functor | `TauCetiRoadmap.DiamondsAndVStacks.PreAdic.geometricDiamond`, `PreAdic.diamond_perfectoid`, `PreAdic.diamond_fibreProduct` | D6.4 supplies diamondification and these comparisons. Compose with `CategoryTheory.ULiftHom.up` on the analytic Yoneda carrier; quotient and tower comparisons retain their canonical maps. |
| Analytic/diamond étale sites | `TauCetiRoadmap.DiamondsAndVStacks.PreAdic.diamond_etale_equivalence` | D6.5 supplies the equivalence from diamond étale objects to analytic étale objects for an analytic carrier over `Spa(ℤ_p,ℤ_p)`. P9.11 transports it to the smoothoid carrier and takes its inverse for the analytic-to-diamond direction, preserving and reflecting coverings. |
| Topology of diamond limits | `TauCetiRoadmap.DiamondsAndVStacks.Perf.Diamond.cofilteredLimit` | D5.3 (ECD 11.22) supplies the homeomorphism for locally spatial levels with qcqs transitions; it imposes no density condition on analytic functions. |
| Spatial presentations | `TauCetiRoadmap.DiamondsAndVStacks.Perf.Diamond.Presentation`, `Perf.Diamond.IsSpatial`, `Geometry.realized`, `Perf.Diamond.spaceι` | D4–D5 supply presentations, spatiality and their point spaces. *SpatialPresentation* abbreviates the supplied presentation with its spatiality proof; component loci use the supplied realization and evaluation maps. |
| Presentation comparisons | `TauCetiRoadmap.DiamondsAndVStacks.Perf.Diamond.Presentation.atlas`, `.atlas_isColimit`, `Perf.Diamond.relation_eq`, `Perf.Diamond.presentationSpace`, `Perf.Diamond.space_eq_quotient` | The supplied presentation determines its epimorphic atlas, effective relation and topological quotient. |
| Realization and spectrality | `TauCetiRoadmap.DiamondsAndVStacks.Perf.Diamond.spaceι_restrict`, `.spaceMap_ι`, `.space_of_perfectoid_ι`, `Perf.Diamond.IsSpatial.spectralSpace` | Component evaluations use the canonical natural maps, and spatiality supplies the spectral point space. |
| Perfectoid structure sheaves | `TauCetiRoadmap.DiamondsAndVStacks.Geometry.O_isSheaf_v`, `Geometry.Oplus_isSheaf_v` | D2.7 supplies v-descent on perfectoid charts for P9's rational and integral coefficients. |
| Seminormal rings and rigid spaces | `TauCetiRoadmap.DiamondsAndVStacks.IsSeminormalRing`; `TauCetiRoadmap.DiamondsAndVStacks.Rigid.IsSeminormal` | D6.9 defines seminormality of an arbitrary commutative ring (reduced, with unique square–cube lifting) and tests it on every affine open of a fixed-field `Rigid.Space`. P9.12 applies the ring predicate to the chart rings of Part II's `AdicSpace.Chart.affinoid.ring`; it defines no predicate of its own. |

The tower statements `finite_projective_sections_descent`,
*ProEtaleSite.finite_locally_free_hom_descent* and *function_descent_seminormal*
are P9 targets on this roadmap's carriers. The first two express degree-zero
module descent from a specified fixed-ring comparison; the third uses
*ProetaleGaloisTower* and DiamondsAndVStacks' `IsSeminormalRing`. Only the affine lemma
`finite_projective_sections_descent` is in `Suggested.lean`; the other two are specified in
this README only. Their proofs use the direct completed-sheaf comparisons cited in P9.8 and
P9.12, which DiamondsAndVStacks owns: D2.9 for vector bundles and D6.9 for the seminormal
comparison. DiamondsAndVStacks D2.9 and D6.9 prove their site equivalences and geometric full
faithfulness without these tower statements as inputs.

The foundational comparisons and their tower specialisations have distinct suppliers:

| Declaration or target | Supplier | Use here |
| --- | --- | --- |
| Vector bundles across the analytic, étale, pro-étale and v-sites; [KL16] Theorem 3.5.8 | DiamondsAndVStacks D2.9; PerfectoidSpaces P3.19 and P6 supply the étale and pro-étale inputs | P9.8 specialises pullback to a chosen tower |
| Seminormal `O_X ≅ ν_*Ô_X`, [KL16] Theorem 8.2.3 | DiamondsAndVStacks D6.9 | P9.12 supplies tower fixed sections |
| Full faithfulness of diamondification on seminormal rigid spaces | DiamondsAndVStacks D6.9 | An upstream comparison, not a consequence assigned to P9 |
| Finite-level pro-object, covering and torsor Čech nerve | AdicEtaleGeometry A1.12, `profinite-galois-cover-is-covering` | P9.4–P9.5 add perfectoid completion and continuous completed sections |
| Tower function and module corollaries | PerfectoidTowers P9.6, P9.8, P9.12; `finite_projective_sections_descent` is the affine lemma | Functions fixed by the specified tower action and full faithfulness of its pullback |
| Affinoid reconstruction with coefficients | AdicSpacesPartIV R5, `coefficient-sheaf-kiehl` and `affinoid-weight-coefficient-sheaf` | P9.10 uses only the branches specified there |

### From TauCetiRoadmap.AdicEtaleGeometry

The names in this table are those AdicEtaleGeometry fixes for its targets; its `Suggested.lean`
prototypes a subset and its README specifies the rest at the cited layers. This roadmap's
`Suggested.lean` uses none of them.
Names beginning with `AdicSpace`, `CAff` or `YonedaAdicSpace` here have the prefix
`TauCetiRoadmap.AdicEtaleGeometry`.

| Application | Exact supplier | Use |
| --- | --- | --- |
| Affinoid morphisms and the rational site | the `Pair.Hom` projection `toRingHom` of `CAff` morphisms, `CAff.toRingHom_eval`, `CAff.ratTopology` | P8–P9 use the underlying ring maps and the rational site defining Yoneda-adic spaces. |
| Sheafy affinoid adic realizations | `CAff.adicSpa`, `CAff.spaHom` | P8 invariant affinoid covers and P9 constant étale objects use the adic spectrum and its induced morphisms. |
| Yoneda-adic objects and open immersions | *YonedaAdicSpace.IsYonedaAdic*, `YonedaAdicSpace.ofSpaY`, `YonedaAdicSpace.spaYFunctor`; Tau Ceti's `TauCeti.PreAdicSpace.IsOpenImmersion` (the open-immersion predicate AdicEtaleGeometry uses) | P8 quotient charts and invariant opens use the supplied rational-site sheaves, their morphisms and the open-immersion predicate. |
| Yoneda points and functions | `YonedaAdicSpace.space`, *YonedaAdicSpace.globalFunctions*, `YonedaAdicSpace.globalFunctions.map`, *YonedaAdicSpace.toGlobalFunctions* | P8 pointwise quotient conditions and P9 fixed-function descent retain the canonical pullback and affinoid coefficient maps. |
| Realization comparisons | `YonedaAdicSpace.ofAdicSpace_spa`, `YonedaAdicSpace.ofAdicSpace_globalFunctions` | P8 analytification and P9 torus Checks compare adic spectra and functions with their Yoneda realizations. |
| Analytic and sheafiness hypotheses | `AdicSpace.IsAnalytic`, `AdicSpace.IsLocallyStronglySheafy`, `AdicSpace.IsLocallyStablySheafy`, `AdicSpace.IsLocallyNoetherianAnalytic`, `AdicSpace.IsLocallyNoetherianAnalytic.isLocallyStronglySheafy` | P9 specifies the hypotheses for the small étale and pro-étale sites, coefficient sheaves and relative polydiscs. |
| Étale objects and topology | `AdicSpace.IsEtaleLocalDescription`, `AdicSpace.smallEtale`, `AdicSpace.smallEtale.mk`, `AdicSpace.smallEtaleTopology` | P9 uses actual étale maps as objects, then embeds them as constant pro-objects. |
| Pro-objects and presentations | `AdicSpace.ProEtale.ProEt`, `AdicSpace.ProEtale.ProEt.final`, *AdicSpace.ProEtale.ProEt.toFinal*, `AdicSpace.ProEtale.ProEt.Presentation`, *AdicSpace.ProEtale.IsProEtale* | P9's affinoid presentations use the supplied cofiltered étale diagram and limit over the base. |
| Pro-étale site and constant embedding | `AdicSpace.ProEtaleSite`, `AdicSpace.ProEtaleSite.topology`, `AdicSpace.ProEtaleSite.const`, `AdicSpace.ProEtaleSite.space` | P9 defines its sheaves, inverse images and section cohomology on A1's corrected site, with its supplied point functor. |
| Profinite objects and Galois actions | *AdicSpace.ProEtaleSite.profiniteObj*, *AdicSpace.ProEtaleSite.GaloisPresentation*, `AdicSpace.ProEtaleSite.GaloisPresentation.limitAction` | P9's Cartan–Leray and local-system comparisons use the specified finite Galois stages and their induced limit action. |
| Integral and rational étale structure sheaves | `AdicSpace.structureSheafPlusEtale`, `AdicSpace.structureSheafEtale` | P9 pulls these ring sheaves to the pro-étale site before completion and coefficient extension. |
| Integral sections and continuous differentials | `AdicSpace.Oplus`, *AdicSpace.structureRingSheaf*, `TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.relativeDifferentials` (R3.6, *sheaf-of-continuous-differentials*), re-exported in AdicEtaleGeometry A2.4 through `AdicSpace.relativeDifferentials.continuousIso` | P9's differential sheaf on the small étale site evaluates the supplied continuous differential module on each source space. |
| Relative polydiscs and underlying maps | *AdicSpace.relativePolydisc*, `AdicSpace.base` | P9 torus Checks use the supplied polydisc coordinates and the continuous maps on underlying adic spaces. |

### Continuous cochain contracts (P9.0 and P9.5)

[P9.0, *Comparison with the canonical carrier for compact coefficients*](#p90-continuous-cochains-and-inverse-limits)
supplies the general comparison for jointly continuous actions, using Mathlib and
[ProfiniteCohomology Layer 3](../ProfiniteCohomology/README.md#layer-3-the-comparison-isomorphisms).
P9.5 names the local cochain, differential and homogeneous-comparison adapters and
supplies the naturality and discrete-compatibility APIs in the following table.

| Application | Local P9.5 adapter or API | Contract |
| --- | --- | --- |
| Continuous cochain model | *continuousInhomogeneousCochains*, *continuousInhomogeneousCochains_d* | For profinite `G`, a commutative ring `V` with a topology, and `ρ : TopRep V G`, require `Continuous (fun z : G × ρ.V ↦ ρ.ρ z.1 z.2)`. The underlying `V`-module complex has terms `C(G^n, ρ.V)` and the unnormalized differential specified in P9.5; every construction and differential carries this joint-continuity premise. No compactness or discreteness of `ρ.V` is required. |
| Homogeneous comparison | *continuousInhomogeneousCochains_homogeneous* | Under the same hypotheses, an all-degree `V`-linear isomorphism with Mathlib's `TopRep.homogeneousCochains` after forgetting topology, compatible with the whole differential and hence with the underlying modules of `continuousCohomology`. Local compactness of `G` supplies compact-open currying and uncurrying. |
| Naturality and discrete compatibility | *continuousInhomogeneousCochains_map*, *continuousInhomogeneousCochains_homogeneous_natural*, *continuousInhomogeneousCochains_discrete* | Continuous equivariant `V`-linear coefficient maps between jointly continuous actions induce cochain maps by postcomposition, and the homogeneous comparison is natural in these maps. For discrete coefficients, over `ℤ` after scalar restriction, degrees 0–2 and their differentials agree with Tau Ceti's `cochainEquiv0`, `cochainEquiv1`, `cochainEquiv2`, `d_cochainEquiv0` and `d_cochainEquiv1_apply`. |

P9.5's unqualified *continuousInhomogeneousCochains*,
*continuousInhomogeneousCochains_d* and *continuousInhomogeneousCochains_homogeneous*
are local adapters to that prose comparison, with the hypotheses and maps specified here.
*continuousInhomogeneousCochains_map*, *continuousInhomogeneousCochains_homogeneous_natural*
and *continuousInhomogeneousCochains_discrete* are local compatibility targets.

### From Mathlib, Tau Ceti and analytic adic geometry

In the file column of the following tables, a Mathlib or Tau Ceti path is the file of the
declaration at the pinned versions. A sibling `Suggested.lean` path stands for that sibling
roadmap: the name is one of its targets, prototyped in that file or specified in its README.
This roadmap's own targets are cited by subsection.

| Application | Exact supplier and file | Use |
| --- | --- | --- |
| Analyticity and affinoid sheafiness | `TauCetiRoadmap.AdicEtaleGeometry.YonedaAdicSpace.IsAnalytic`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `R.Sheafy`, AdicEtaleGeometry's notation (section "Geometric signatures and Checks") for Tau Ceti's `TauCeti.Huber.IsSheafyForEveryPresentation R.P.plus` | P8 uses the supplied Tate-chart analyticity and sheafiness predicates for quotient charts and finite-level analytic spaces. |
| Adic charts and morphism properties | `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart`, `.Smooth`, `.LocallyOfFiniteType`, `.IsFinite`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | P8 invariant affinoid covers and finite rigid quotients use the chart ring and open immersion; P9 uses smoothness, finite type and seminormal chart rings in descent and coefficient comparisons. |
| Adic ring homomorphisms | `TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom`, `Huber.IsAdicHom.of_isTateRing`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | P8 completed pair tensors require adic scalar maps; continuity from a Tate ring supplies the adicness and the target Tate structure. |
| Completed tensor ring structures | `TauCetiRoadmap.AdicSpacesPartII.Huber.CompletedTensor.isTopologicalRing`, `Huber.CompletedTensor.isHuberRing`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | P8 installs the supplied topological ring and Huber ring structures when forming completed tensor pairs. |
| Affinoid spectra and spaces over a field | `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Affinoid.spa`, `AdicSpace.fieldAffinoid`, `AdicSpace.AdicOver`, `RigidSpace`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | P8 analytification and finite rigid quotients use these spectra, rigid spaces and locally finite type adic spaces over the complete nonarchimedean field. |
| Profinite flat coefficient modules | `TauCetiRoadmap.AdicSpacesPartIV.Huber.IsProfiniteFlat`, `TauCetiRoadmap/AdicSpacesPartIV/Suggested.lean` | P9's mixed completed tensors retain flatness and the compact Hausdorff linear module topology supplied by R5. |
| Affinoid restriction and represented towers | *PerfectoidSpace.IsZariskiClosedEmbedding*, *PerfectoidSpace.GoodTower.represents*, this roadmap's P8.14 and P8.19 (README only) | Checks *IsZariskiClosedEmbedding.base_change_affinoid* and *GoodTower.universal* evaluate the predicate and the structure field. |
| Integral fixed elements and characteristic-p localization | `invariantPair`, `TauCetiRoadmap/PerfectoidTowers/Suggested.lean`; *Perfectoid.PairCat.invariants*, *Perfectoid.rational_invariants_perfectoid*, this roadmap's P8.4–P8.5 (README only) | Checks *invariants_pair_plus* and *rational_invariants_characteristic_p* use the comap plus ring and the general localization comparison; the first is specified by the comap defining `invariantPair`. |
| Affinoid sheaf equalizers | *Perfectoid.TorsorDescent.WeightExtension.structureSheafEqualizer*, `.integralStructureSheafEqualizer`, this roadmap's P9.11 (README only) | Check *WeightExtension.rationalSectionsEqualizer* combines their conclusions on an affinoid open. |
| Regular-element coefficient sequence | `Module.Flat.isSMulRegular_of_isRegular`, `Mathlib/RingTheory/Flat/TorsionFree.lean`; `LinearMap.exact_iff`, `Mathlib/Algebra/Exact/Basic.lean`; `Submodule.ideal_span_singleton_smul`, `Mathlib/RingTheory/Ideal/Operations.lean` | Check *coefficient_change_regular* applies flatness for injectivity and the supplied kernel equality for exactness. The sheaf and derived comparisons remain P9 targets. |
| Sectionwise inverse limits | `CategoryTheory.Sheaf.createsLimits`, `Mathlib/CategoryTheory/Sites/Limits.lean`; `CategoryTheory.Limits.evaluationPreservesLimits`, `Mathlib/CategoryTheory/Limits/FunctorCategory/Basic.lean`; `CategoryTheory.preservesLimitIso`, `Mathlib/CategoryTheory/Limits/Preserves/Limits.lean:54` | Check *higher_inverse_limits_sections* gives the section comparison for any inverse system of module sheaves. P9 supplies almost vanishing of positive derived limits and higher cohomology. |

| P9 object | Exact supplier and file | New P9 content |
| --- | --- | --- |
| Fixed rings and coefficient scalars | `FixedPoints.subring`, `FixedPoints.subalgebra`, `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean`; `Algebra.IsInvariant`, `Mathlib/RingTheory/Invariant/Defs.lean` | Twisted submodules and continuous descent along a specified torsor; no new fixed-ring definition. |
| Multiplicative cocycle and units action | `groupCohomology.IsMulCocycle₁`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`; `Units.mulDistribMulActionRight`, `Mathlib/Algebra/Group/Action/Units.lean` | The twisted submodule uses the inverse cocycle; the supplier's multiplication order agrees because the unit group of a commutative ring is commutative. |
| Module invariants and averaging | `Representation.invariants`, `Representation.averageMap`, `Representation.isProj_averageMap`, `Mathlib/RepresentationTheory/Invariants.lean` | Effective descent over commutative rings; averaging is used only with invertible group order. |
| Field-valued Galois descent | `TauCeti.GaloisDescent.span_invariants_eq_top`, `TauCeti/RepresentationTheory/GaloisDescent/Span.lean`; `TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant`, `TauCeti/RepresentationTheory/GaloisDescent/Injective.lean`; `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective`, `TauCeti/RepresentationTheory/GaloisDescent/Range.lean` | Finite étale torsors over arbitrary commutative rings, including disconnected rings and characteristic dividing the group order. |
| Finiteness and rank under base change | `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `Mathlib/RingTheory/Finiteness/Descent.lean`; `Module.rankAtStalk_baseChange`, `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean` | Establish faithful flatness from finite étaleness and injectivity, then reflect rank using surjectivity on spectra. |
| Continuous degree-zero cohomology | `ContinuousCohomology.zeroIso`, `Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`; `TauCeti.ContinuousCohomology.zeroIsoNatIso`, `TauCeti/RepresentationTheory/Homological/ContCohomology/DegreeZero.lean` | Identify the tower's Čech complex with continuous cochains; use these degree-zero comparisons directly. |
| Continuous lifts along discrete surjections | `TauCeti.ContCohomology.exists_continuous_lift`, `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean` | For any topological source and any surjection onto a discrete space, a continuous map lifts continuously; P9.0 applies it with source `Gⁱ` in each cochain degree. |
| Continuous inhomogeneous cochains in degrees 0, 1 and 2 | `TauCeti.ContCohomology.cochainEquiv0`, `TauCeti.ContCohomology.cochainEquiv1`, `TauCeti.ContCohomology.cochainEquiv2`, `TauCeti.ContCohomology.d_cochainEquiv0`, `TauCeti.ContCohomology.d_cochainEquiv1_apply`, `TauCeti/RepresentationTheory/Homological/ContCohomology/CochainComparison.lean` | These additive comparisons use discrete modules with jointly continuous action; degree 2 also assumes local compactness of the group, automatic for profinite groups. P9.5 uses the all-degree and non-discrete extension of P9.0 with its explicit joint-continuity premise. |
| Finite torsor Galois map, fixed ring and module descent | `TauCetiRoadmap.AdicEtaleGeometry.Algebra.galoisTensorMap`, `TauCetiRoadmap.AdicEtaleGeometry.Algebra.IsFiniteEtaleTorsor`, `TauCetiRoadmap.AdicEtaleGeometry.Algebra.IsFiniteEtaleTorsor.isInvariant` (A4.2); `TauCetiRoadmap.AdicEtaleGeometry.IsGaloisExtension`, *finite-galois-descent-of-modules* (A4.2a, README only) | A4.2a supplies faithful flatness, the torsor and fixed-ring conclusions, effective module descent, and finite-projectivity and rank reflection for P9.10. |
| Faithful flatness of an injective finite étale algebra | `Algebra.IsIntegral.comap_surjective`, `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`; `Module.FaithfullyFlat.of_comap_surjective`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean` | Finiteness gives integrality, injectivity gives lying over every prime, and étaleness gives flatness. These construct the faithful-flatness field of the torsor. |
| Integral tensor exactness | `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, `Mathlib/RingTheory/Flat/TorsionFree.lean`; `AdicCompletion.map_surjective`, `Mathlib/RingTheory/AdicCompletion/Exactness.lean` | Fixed points of completed lattice tensors with a specified completed free coefficient lattice. |
| Module sheaves, local bases and pullback | `SheafOfModules.Submodule.toSheafOfModules`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean`; `SheafOfModules.IsLocallyFree`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`; `SheafOfModules.pullbackPushforwardAdjunction`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean` | P9 identifies the invariant subsheaf, proves the integral local-basis criterion and identifies the canonical pullback map on equivariant Hom sets. |
| Coefficient localization and Kiehl | `TauCetiRoadmap.AdicSpacesPartIV.RigidSpace.Coefficients` and its `Loc` (R5.7: *coefficient-sheaf-loc*, *coefficient-sheaf-kiehl* branches (a)–(b), *affinoid-weight-coefficient-sheaf*), `TauCetiRoadmap/AdicSpacesPartIV/Suggested.lean` | P9 proves that the character module on an affinoid is finite projective of rank one and glues to a coefficient line sheaf; R5 supplies localization and acyclicity for finite projective modules. Reconstruction `ω_c ≅ Loc(ω_c(X))` on an affinoid base uses only R5's `coefficient-sheaf-kiehl` branches (a) and (b) and `affinoid-weight-coefficient-sheaf`, as specified in P9.10; the finite-free small-coefficient global-section comparison over a discretely valued base is the case of branches (a) and (b). |
| Derived coefficient change | `CategoryTheory.InjectiveResolution.cochainComplex`, `Mathlib/CategoryTheory/Abelian/Injective/Extend.lean`; `CategoryTheory.Functor.totalLeftDerived`, `Mathlib/CategoryTheory/Functor/Derived/LeftDerived.lean`; `CategoryTheory.SpectralSequence`, `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` | P9 applies these carriers to twisted sheaves and finite acyclic covers, including the filtration of the abutment. |
| Ring-sheaf completion | `CategoryTheory.Sheaf`, `Mathlib/CategoryTheory/Sites/Sheaf.lean`; `CategoryTheory.presheafToSheaf`, `CategoryTheory.toSheafify`, `Mathlib/CategoryTheory/Sites/Sheafification.lean`; `Localization.Away`, `Mathlib/GroupTheory/MonoidLocalization/Away.lean` | Complete the integral coefficient sheaf by a limit of sheaf quotients, then sheafify its localization; twisted sheaves are subpresheaves of the actual coefficient sheaf. |
| Abelian sheaves and direct images | `CategoryTheory.sheafIsAbelian`, `Mathlib/CategoryTheory/Sites/Abelian.lean`; `CategoryTheory.Sheaf.Hom.add_app`, `Mathlib/CategoryTheory/Sites/Sheaf.lean`; `CategoryTheory.Functor.rightDerived`, `Mathlib/CategoryTheory/Abelian/RightDerived.lean` | P9.3 computes direct images using Mathlib's abelian and additive structures on sheaves, with proposition-valued `HasSheafify`; finite limits of these sheaves are supplied by `Mathlib/CategoryTheory/Sites/Limits.lean`. |
| Completed coefficient maps | `TauCetiRoadmap.AdicSpacesPartII.Huber.BanachModule.CompletedTensor.map`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap.AdicSpacesPartIV.Huber.mixedTensorInt`, `TauCetiRoadmap.AdicSpacesPartIV.Huber.mixedTensorInt.map`, `TauCetiRoadmap/AdicSpacesPartIV/Suggested.lean`; `AdicCompletion.map`, `Mathlib/RingTheory/AdicCompletion/Functoriality.lean` | Identify the image of the canonical fixed-submodule inclusion with the fixed completed tensors, retaining the three distinct completions. |
| Cohomology of a quotient complex | `HomologicalComplex.homologyMap`, `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`; `CategoryTheory.ShortComplex.ShortExact.δ`, `Mathlib/Algebra/Homology/HomologySequence.lean` | Apply the connecting-map sequence to a degreewise flat Čech complex modulo a regular element, locating the torsion obstruction in degree `q+1`. |

| P8 object | Exact supplier and file | New P8 content |
| --- | --- | --- |
| Normal fixed field | `Normal`, `Mathlib/FieldTheory/Normal/Defs.lean`; `IntermediateField.fixedField`, `Mathlib/FieldTheory/Galois/Basic.lean` | Restriction of arbitrary-rank valuation classes from a normal extension and its automorphism fixed field. |
| Fixed subring | `FixedPoints.subring`, `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean` | Equip the fixed subring with its Tate structure and invariant plus ring. |
| Invariant orbit product | `Finset.smul_prod_perm`, `Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean` | Bundle this product in the fixed subring and prove that a pseudouniformizer stays one. |
| Integrality and prime orbits | `Algebra.IsInvariant.isIntegral`, `Algebra.IsInvariant.exists_smul_of_under_eq`, `Algebra.IsInvariant.orbit_eq_primesOver`, `MulSemiringAction.charpoly`, `MulSemiringAction.charpoly_eq`, `MulSemiringAction.eval_charpoly`, `MulSemiringAction.monic_charpoly`, `Mathlib/RingTheory/Invariant/Basic.lean` | Continuous valuations and complete Tate pairs, rather than new algebraic integrality statements. |
| Affine scheme quotient | `TauCeti.AffineInvariantQuotient.isQuotientMap_projection`, `TauCeti.AffineInvariantQuotient.projection_eq_iff_exists_smul`, `TauCeti.AffineInvariantQuotient.isFinite_projection`, `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean` | Orbit spaces of adic spectra; the cited finiteness theorem requires `Algebra.FiniteType (FixedPoints.subring A G) A`. |
| Rational pullback | `TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Comap.lean` | Open generation in the fixed Tate ring and stability under a plus-preserving action. |
| Disjoint translates | `ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`, `Mathlib/Topology/Algebra/ConstMulAction.lean` | A clean open-neighbourhood basis for finite actions with only Hausdorffness; also impose stabilizer invariance. |
| V-valued sheaves | `AlgebraicGeometry.SheafedSpace`, `AlgebraicGeometry.PresheafedSpace.Hom`, `Mathlib/Geometry/RingedSpace/SheafedSpace.lean`, `Mathlib/Geometry/RingedSpace/PresheafedSpace.lean`; `TauCeti.CompleteSeparatedTopCommRingCat`, `TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.lean` | Add stalk valuations and valuation-compatible maps; no local-stalk axiom is imposed in Huber's category V. |
| Perfectoid adic realization | `TauCetiRoadmap.AdicEtaleGeometry.YonedaAdicSpace.ofAdicSpace` with the full faithfulness of *adic-spaces-in-yoneda-adic-spaces* (A1.16), `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCeti.AdicSpace.toSheafyPreAdicSpace`, `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`; `TauCeti.PreAdicSpace.stalkValuation_def`, `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean` | PerfectoidSpaces P2.10’s *PerfectoidSpace.toAdicSpace* is the inclusion of `Perfd p` into pre-adic spaces, landing in adic spaces; P3.17’s *PerfectoidSpace.locallyStronglySheafy* identifies a perfectoid space with the A1 realization of a locally strongly sheafy adic representative. *toVRingedSpace* composes the inclusion with the forgetful functor, retaining the complete topological sheaf and the supplied residue-induced stalk valuation. |
| Direct perfection and completions | `PerfectClosure`, `PerfectClosure.of`, `Mathlib/FieldTheory/PerfectClosure.lean`; `AdicCompletion`, `Mathlib/RingTheory/AdicCompletion/Basic.lean`; `Localization.Away`, `Mathlib/GroupTheory/MonoidLocalization/Away.lean` | The universal integral-perfectoid algebra and its parameter-adic generic pair. |
| Integral closure in the generic ring | `integralClosure`, `mem_integralClosure_iff`, `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean`; `IsLocalization.Away.invSelf`, `Mathlib/RingTheory/Localization/Away/Basic.lean` | *genericPlus* uses the integral closure of the completed ring's image; its Checks distinguish integral roots from the inverse of a nonzero nonunit parameter. |
| Projective levels | `AlgebraicGeometry.Proj`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`; `AlgebraicGeometry.Proj.toSpecZero`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean`; `MvPolynomial.homogeneousSubmodule`, `MvPolynomial.gradedAlgebra`, `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` | Projective scheme presentations and their natural affinoid-test analytifications. |
| Analytification comparison | `RigidSpace.analytification` with its natural bijection *analytification-universal-property* (AdicSpacesPartII R1.3) and `AdicSpace.rigidToAdic` (R1.7); `R.Sheafy` (AdicEtaleGeometry's notation for `TauCeti.Huber.IsSheafyForEveryPresentation R.P.plus`), `YonedaAdicSpace.ofAdicSpace`, `YonedaAdicSpace.ofAdicSpace_spa`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | R1 owns analytification. *TowerGeometry.Analytification* specifies its sheafy-test interface on the Yoneda carrier; *Analytification.rigid_comparison* identifies its space with R1's image. |
| Unit torus and coordinates | *AdicSpace.relativeTorus*, `relativeTorus.ι`, `relativeTorus.proj`, `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.Polydisc.coord`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | P9 root-torus Checks use this unit annulus, its base map, and its coordinate p-power endomorphism. The coordinate is the `Polydisc.coord` field of *AdicSpace.relativePolydisc*, pulled back along `relativeTorus.ι`. |
| Global functions on adic spaces | `YonedaAdicSpace.ofAdicSpace_globalFunctions`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | Identifies the torus coordinate with the function pulled back along the Galois-tower levels. |
| Projective-line chart | `AlgebraicGeometry.Proj.fromOfGlobalSections`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean`; `AlgebraicGeometry.Scheme.ΓSpecIso`, `Mathlib/AlgebraicGeometry/Scheme.lean` | *projectiveLineChart* specializes the supplier map to the homogeneous coordinates `(1,T)`; it fixes the coordinate in *goodTower_frobenius_P1*. |
| Finite maps of pairs | `TauCetiRoadmap.AdicSpacesPartII.Huber.Pair.Hom.IsFinite`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Test this pair predicate on every target affinoid and require the square to be a pullback. |

| Analytic and coefficient object | Exact supplier and file | Use in P8–P9 |
| --- | --- | --- |
| Analytic bases and perfectoid spaces | `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.IsLocallyNoetherianAnalytic`, `YonedaAdicSpace.ofSpaY`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.isPerfectoidSpace`, `PerfectoidSpace.isAffinoidPerfectoid`, `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` | Use the supplied analytic predicates on the adic and Yoneda carriers. PerfectoidSpaces P7.16's *ProEtaleSite.AffinoidPresentation* adds a map to `Spa(ℚ_p, ℤ_p)`; its `ProEtaleSite.IsAffinoidPerfectoid` concerns pro-objects with completed section pairs, whereas PerfectoidSpaces P2.9’s `isAffinoidPerfectoid` is a property of pre-adic spaces. *ProetaleGaloisTower.base* requires the same base map in its locally noetherian branch. |
| Quasi-compact étale slices and finite towers; separated rigid quotients | `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.QuasiCompact`, `.IsSeparated`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`, R0; `TauCetiRoadmap.AdicEtaleGeometry.YonedaAdicSpace.IsEtaleLocalDescription`, `.IsFiniteEtale`, `.smallEtale`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`, A1 | *finite-tower-over-perfectoid-tower* uses R0 on the limit map; *rigid_invariant_cover_of_separated* assumes R0 separatedness. *ProetaleGaloisTower.finiteEtale* uses A1’s finite étale predicate. |
| Completed pair tensors | `TauCetiRoadmap.AdicSpacesPartII.Huber.CompletedTensor`, `Huber.Pair.completedTensor`, `Huber.Pair.completedTensor.tmul`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`, R0 | The carriers, plus rings and tensor maps used by *quotient_scalar_extension_pair* and its Checks. |
| Banach tensors over an analytic field | `TauCetiRoadmap.AdicSpacesPartII.Huber.BanachModule.CompletedTensor`, `.injective_tensorProduct_of_field`, `.ker_map_of_field`, `.injective_kerMap_of_field`, `.isStrictMap_map_of_field`, `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`, R0; `BanachModule.productSeminorm` in the same file | Use the completed tensor for the nonarchimedean maximum-cost seminorm and the full kernel theorem without a strictness hypothesis. These are admitted sibling-roadmap suppliers. |

| Completed tower object | Exact supplier and file | Use in P9 |
| --- | --- | --- |
| Completed tower self-product | `TauCetiRoadmap.AdicEtaleGeometry.FiniteEtaleTorsorTower.uniformCompletedTensor_completion_equiv`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`, A4 | Supplies the uniform completed tensor-square comparison; P9.4's *Perfectoid.TorsorDescent.ProetaleGaloisTower.torsorIso* (README only) expresses the self-product of the tower's pro-object on this roadmap's tower carrier; completing the nerve gives the perfectoid self-product. |

| Perfectoid carrier | Exact supplier and file | Use in P8–P9 |
| --- | --- | --- |
| Complete pair and space carriers | `TauCetiRoadmap.AdicEtaleGeometry.CAff`, `CAff.IsRationalLocalization`, `YonedaAdicSpace`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | The imported carriers underlying the global perfectoid objects and the affinoid tower comparison. |
| Root-torus coordinates and limits | `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra.laurent`, `Perfectoid.perfectedTateAlgebra.X`, `PerfectoidSpace.IsTildeLimit`, `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`; `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.relativeTorus`, `.relativeTorus.ι`, `.relativeTorus.proj`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | The torus Checks use the imported Laurent ring, the monomials `X s a` and their inverses in it, the tilde-limit predicate and the relative torus. PerfectoidSpaces P7.16 supplies their site presentation; P9 supplies their tower Galois action and section calculations. |
| Nonarchimedean base pair | `TauCeti.Huber.Pair.powerBounded`, `TauCeti/RingTheory/Huber/Pair.lean`; `CAff.of`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | *TowerGeometry.basePair* (for the base field `K`) packages the complete nontrivially normed ultrametric field with `K°`; an explicit `Huber.Pair K` retains an arbitrary ring of integral elements `K⁺`. |

The multiplicative cocycle predicate is `groupCohomology.IsMulCocycle₁` in
`Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`, with the action on
units supplied by `Units.mulDistribMulActionRight` in `Mathlib/Algebra/Group/Action/Units.lean`.
For commutative units its law is `c(γδ) = c(γ) · γ • c(δ)`. P9 uses this predicate directly.

### Declarations at the pins

Every name in the following table exists at the pinned Mathlib and Tau Ceti versions or in
PerfectoidSpaces' `Suggested.lean`. The signatures of this roadmap's `Suggested.lean` and its
affine targets rest on them.

| Object | Declaration at the pins | Layer |
| --- | --- | --- |
| Fixed rings, integrality, prime orbits | Mathlib `FixedPoints.subring`, `Algebra.IsInvariant`, `Algebra.IsInvariant.isIntegral`, `Algebra.IsInvariant.exists_smul_of_under_eq`, `MulSemiringAction.charpoly` | P8.1–P8.2 |
| Affine invariant quotients | Tau Ceti `AffineInvariantQuotient.isQuotientMap_projection`, `AffineInvariantQuotient.isFinite_projection` | P8.2, P8.10 |
| Huber pairs and Tate rings | Tau Ceti `Pair`, `Pair.Hom`, `IsTateRing`, `IsPseudoUniformizer`, `PairOfDefinition`, `powerBoundedSubring` | P8 |
| Adic spectra | Tau Ceti `ValuationSpectrum.spa`, `ValuationSpectrum.spaComap`, `ValuationSpectrum.spaComap_preimage_rationalSubset` | P8.2, P8.5 |
| Pre-adic spaces | Tau Ceti `PreAdicSpace`, `PreAdicSpace.Hom`, `PreAdicSpace.restrict`, `PreAdicSpace.isAdic`, `PreAdicSpace.isAffinoid`, `ValuationSpectrum.presentationLimitPreAdicSpace` | P8.6–P8.9 |
| Perfectoid rings and spaces | PerfectoidSpaces `IsPerfectoidTateRing`, `IsIntegralPerfectoid`, `PseudoUniformizerRoots`, `isAffinoidPerfectoid`, `isPerfectoidSpace`, `Perfd`, `Perf`, `padicCyclotomic` | P8–P9 |
| Disjoint translates, Hausdorff quotient | Mathlib `ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`, `T2Quotient` | P8.13, P8.16 |
| Perfection and adic completion | Mathlib `PerfectClosure`, `AdicCompletion`, `AdicCompletion.map` | P8.18, P9.13 |
| Cocycles, invariants, averaging | Mathlib `groupCohomology.IsMulCocycle₁`, `Representation.invariants`, `Representation.averageMap`, `Representation.isProj_averageMap` | P9.9–P9.10 |
| Continuous cohomology in low degrees | Mathlib `ContinuousCohomology.zeroIso`; Tau Ceti `ContinuousCohomology.zeroIsoNatIso`, `ContCohomology.cochainEquiv0`, `ContCohomology.cochainEquiv1`, `ContCohomology.cochainEquiv2` | P9.5 |
| Galois descent and faithful flatness | Tau Ceti `GaloisDescent.span_invariants_eq_top`; Mathlib `Module.FaithfullyFlat.of_comap_surjective`, `Module.rankAtStalk` | P9.10 |
| Module sheaves and derived functors | Mathlib `SheafOfModules.IsLocallyFree`, `Functor.rightDerived`, `Functor.totalLeftDerived` | P9.2–P9.13 |

## How to read the build

P8 constructs invariant pairs, quotient charts, finite quotients, good towers and their closed
perfectoid loci. Its diamond comparisons use DiamondsAndVStacks D2.1–D2.2
(the sites), D4–D5 (presentations, spatiality and limits), and D6.4
(diamondification). P9 uses P8 with PerfectoidSpaces P0–P7,
DiamondsAndVStacks D2.5 and D2.7 (structure sheaves), D3.10 (profinite
torsors) and D2.9 and D6.9 (the foundational vector-bundle and seminormal comparisons, which
P9.8 and P9.12 apply to towers), AdicEtaleGeometry A1 (with A1.12) and A4, and
AdicSpacesPartII–IV for continuous torsor descent with coefficients.
The construction order is determined by the individual *Needs:* clauses:

- In P8, construct the P8.19 projective-level and analytification carriers, then P8.21's
  closed-subvariety pullback and fixed-target closed-limit inputs. These precede P8.20's
  projective-tower separation theorem, which precedes P8.19's GoodTower separation and
  P8.15's projective-line separation Check. Construct GoodTower before applying its
  quotient theorem; the remaining closed-tower comparison follows the closed-limit inputs.
- In P9, construct P9.0's cochain foundations before P9.5. Use AdicEtaleGeometry A4.2a's
  *finite-galois-descent-of-modules* for P9.10. After P9.6, build P9.12, then resume
  P9.7–P9.11 and P9.13. P9.10's integral unit-frame application uses the affine
  P9.13 frame criterion, which is independent of the geometric P9.10 applications.

Each definition requires three discriminating Checks on its own carrier, including a computed
value and a degenerate case or non-example. `Suggested.lean` contains suggested signatures for
a subset of targets and Checks; the README is the definitive specification. The `Lean:` line
closing each subsection names the declarations that carry it. Targets needing the pro-étale
site, completed structure sheaves, Galois towers, good towers, analytic separation, the diamond
comparisons, completed tensors or the v-ringed and Yoneda-adic carriers are specified here only.
The declarations of `Suggested.lean` are:

| Declaration | Kind | Subsection |
| --- | --- | --- |
| `isClosed_fixedPoints` | theorem | P8.1 |
| `IsUniformAddGroup` and `CompleteSpace` on `FixedPoints.subring A G` | instances (anonymous) | P8.1 |
| `isTateRing_fixedPoints` | theorem, registered as an instance | P8.1 |
| `isRingOfIntegralElements_comap_fixedPoints` | theorem | P8.1 |
| `invariantPair` | def | P8.1 |
| `invariant_spectrum_homeomorphism` | theorem | P8.2 |
| `IsCategoricalQuotient` | structure | P8.6 |
| `isTateAffinoidModel`, `isTateAffinoid` | def, abbrev | P8.9 |
| `exists_isCategoricalQuotient_of_invertible_order` | theorem | P8.9 |
| `MulAction.IsGClean`, `MulAction.exists_isGClean` | structure, theorem | P8.13 |
| `finite_projective_sections_descent` | theorem | P9.8 |
| `twistedInvariants` | def | P9.9 |
| `finite_character_comparison_linear`, `finite_character_line` | theorems | P9.10 |
| `integral_matrix_coboundary_effectivity` | theorem | P9.13 |

In P8 and P9, the following auxiliary examples illustrate algebraic conventions
and consequences. None counts toward a definition's three discriminating Checks.

| Auxiliary examples | What they establish |
| --- | --- |
| *invariants_trace_char_p*, *invariants_completeness_needed*, *quotient_point_valuation_subring*, *invariants_plus_stability_required* | Facts about the imported fixed subring, trace, valuation subring, or product subring. |
| The two *invariants_infinite_group_not_perfectoid* calculations, *frobenius-on-invariants-of-p-group*, *adic-quotient-order-invertible*, *invariants-of-affinoid-algebra*, *not_isZariskiClosed_gauss_closure* | Root-of-unity, polynomial, ordered-group, and p-adic calculations; the statements do not use perfectoid invariants, adic quotients, or the Gauss-point closed-locus predicate. |
| *quotient_not_etale_at_fixed_point_signs*, *quotient_sign_two_terms*, *action_order_two_terms*, *isGClean_neg_real_intervals*, *not_isGClean_doubled_origin_intersection* | Power signs, permutation order, and topological calculations without the quotient or clean-neighbourhood predicate. |
| *isGClean_iff_injective*, *isAnalyticallySeparated_isSeparated*, *goodTower_isAnalyticallySeparated*, *isAnalyticallySeparated_goodTower*, *goodTower_frobenius_P1*, *rational_invariants_characteristic_p* | Applications of the corresponding general theorems, without an independently computed instance. |
| *GoodTower.universal*, *IsZariskiClosedEmbedding.base_change_affinoid* | Projections of hypotheses already containing the conclusion. |
| *closed_limit_two_ideals* | [PerfectoidSpaces P4](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness)'s `PerfectoidSpace.zeroLocus_sup`; it computes zero loci, not the maps or universal property of the P8 limit. |
| *vHom_identity*, *vHom_composition*, *invariants_map_zero_one* | Identity, composition, and ring-homomorphism laws. |
| *nonfaithful_base_change*, *cech_trivial_two_terms*, *pullback_two_terms*, *twisted_inverse_two_terms*, *matrix_rank_two*, *averaging_two_terms*, *derived_two_term_tor*, *mixed_completion_diagonal*, *integral_matrix_nonunit*, *matrix_rank_zero* | Algebraic or coefficient-array computations; they do not instantiate the descent, cochain, twisted-sheaf, or completed-tensor constructions. |
| *coefficient_change_regular*, *coefficient_change_unit*, *coefficient_change_zero_not_regular*, *coefficient_change_two* | Library regularity and exactness calculations, without the derived comparison. |
| *completedScalar_one*, *completedScalar_uniformizer*, *integralToRational_one*, *scalarModuleSheaf_one*, *scalarModuleSheaf_two* | Laws valid for every ring homomorphism or module action; they do not determine the completion coordinates or the specified scalar map. |

## Layer P8: finite quotients and closed perfectoid loci in towers

For the statements cited from [HJ] §5.1, adic spaces are analytic over `ℤ_p`, the standing
convention on [HJ] p. 27; a base nonarchimedean field has residue characteristic `p`.
`TowerGeometry.IsOverZp` ([PerfectoidSpaces P7.11](../PerfectoidSpaces/README.md#p711-represented-functors-and-finite-level-descriptions),
*finite-level-analytic-carriers*) expresses this by topological nilpotence of `p` on every
affinoid chart. *GoodTower.basePadic* imposes the same condition on its base field. The
finite-tower and finite-level-basis targets below use this analytic convention.

**Checks** of the supplied predicate `TowerGeometry.IsOverZp p X`.

- *overZp_perfectoid* — an affinoid `p`-perfectoid space satisfies the condition.
- *overZp_empty* — the empty affinoid does so vacuously.
- *overZp_wrong_prime* — `Spa(ℚ_q, ℤ_q)` fails it for `q ≠ p`; its missing `p`-perfectoid
  test points must not be mistaken for an empty geometric space.

Lean: README only.


The layer builds the invariant Huber pair of a finite group action and the homeomorphism
`|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`; the invariants of perfectoid Tate rings, including `p`-groups
in characteristic `p`; the finite quotients of affinoid perfectoid spaces, of spaces with an
invariant affinoid cover and of analytically separated spaces; the perfectoidization of integral
extensions; good towers and their quotients; and Zariski-closed loci in towers with the
tilde-limit comparison.

The [HJ] locators in this layer refer to [arXiv:2011.03951v2](https://arxiv.org/pdf/2011.03951v2).
Actions on rings are left actions; the induced action on valuations is the right action
`v·g = v ∘ g`. The P8 quotient signatures `ρ : G →* Aut X` take left actions
of `G`, equivalently right actions of `Gᵐᵒᵖ`: Mathlib's multiplication satisfies
`(ρ (g * h)).hom = (ρ h).hom ≫ (ρ g).hom`.
In *affinoid_perfectoid_quotient* the resulting pullback on sections is
`(ρ g)^* a = g⁻¹ • a`. The `VQuotient.*` statements and P9 towers use right
`G`-actions, encoded by `Gᵐᵒᵖ →* Aut X`; applying those quotient comparisons to a
left `G`-action uses the opposite group. For a right action on a space,
`MulAction.IsGClean` uses the left action of the opposite group. **Auxiliary calculation *action_order_two_terms*:** for the permutations
`σ = (0 1)` and `τ = (1 2)`, `(στ)(0) = 1` and `(τσ)(0) = 2`; thus successive pullbacks
reverse composition.

### P8.1 the invariant Huber pair

The first three subsections build the invariant Huber pair of a finite group action, identify its
adic spectrum with the orbit space, and present its diamond as a quotient v-sheaf.

**The invariant Huber pair `(A^G, A^{+G})` of a finite group action.** (*invariant-huber-pair*)
Let `(A, A⁺)` be a Tate–Huber pair and `G` a finite group
acting on `A` on the left by continuous ring automorphisms with `g(A⁺) = A⁺` for all `g ∈ G`;
there is no hypothesis on `|G|`: `p` may divide it, and it need not be invertible in `A`. Put
`A^G = {a ∈ A : g·a = a for all g}` with the subspace topology and `A^{+G} = A⁺ ∩ A^G`. Then: (i)
`A^G` is a Tate ring; if `A` is Hausdorff it is closed, and if `A` is also complete it is complete: for every pseudouniformizer
`ϖ` of `A` the norm `N(ϖ) = ∏_{g∈G} g(ϖ)` is a `G`-invariant pseudouniformizer of `A` and of
`A^G`, `G`-stable rings of definition `A₀ ⊆ A` exist (the subring generated by the translates
`g(A₁)` of a ring of definition `A₁`. Its elements are finite sums of products with one
factor in each `g(A₁)`. Choose a pseudouniformizer `ϖ ∈ A₁` and bounds
`g(A₁) ⊆ ϖ^{-n_g} A₁`; all such sums lie in `ϖ^{-Σ_g n_g} A₁`, proving boundedness), and `A₀^G` is a ring of definition of
`A^G`; (ii) `(A^G)° = (A°)^G = A° ∩ A^G`; (iii) `A^{+G}` is open and
integrally closed in `A^G` and contained in `(A^G)°`, so `(A^G, A^{+G})` is a Tate–Huber
pair, complete and Hausdorff when `(A, A⁺)` is; (iv) `A⁺` is the integral closure of `A^{+G}` in `A` — using that `A` is integral over
`A^G`, each `a ∈ A` being a root of `∏_{g∈G}(T − g·a) ∈ A^G[T]`, which is Mathlib's
`Algebra.IsInvariant.isIntegral` with `MulSemiringAction.charpoly` (`charpoly_eq`, `eval_charpoly`,
`monic_charpoly`) and is not restated. The construction
is functorial in `G`-equivariant continuous maps of pairs, and for a subgroup `H ≤ G` it gives
inclusions `A^G ⊆ A^H`, `A^{+G} ⊆ A^{+H}`. Define `invariantPair` using Mathlib's `FixedPoints.subring A G` as carrier and
`P.plus.comap (FixedPoints.subring A G).subtype` as plus ring; membership in its plus ring is
membership of the image in `A⁺`, by definition. Define the orbit product
`N(a) = ∏_{g ∈ G} g·a`, an element of `FixedPoints.subring A G`,
for any element of a commutative ring with a finite group action. This action-indexed product
also allows nonfaithful actions; it is not the determinant norm of a finite free extension.
Prove that the orbit product of a pseudouniformizer is a pseudouniformizer of `A` and of
`A^G` for continuous actions on Tate
rings ([Hansen] §2, p. 3; the invariant pseudouniformiser fixed in Step 1 of the proof of
Theorem 3.1, p. 4, and the invariant ring of definition in the proof of Theorem 3.3, p. 7; integral
closure in Step 3 of the proof of Theorem 3.1, p. 6. Theorem 3.1 itself is the orbit-space
homeomorphism of P8.2 and has no numbered parts).
Name the further pair interfaces *invariantPair.map* for an equivariant continuous
map of pairs and *invariantPair.subgroup* for restriction from `G` to a subgroup `H`;
both are induced by the corresponding inclusions or restrictions on fixed elements. Prove that for a normal algebraic extension `L/K` with `Aut(L/K)` finite and a
valuation `v` on `K` of any rank, `v` extends to `L`, uniquely along the purely inseparable
subextension `K ⊆ L^{Aut(L/K)}`, and `Aut(L/K)` acts transitively on the equivalence classes of
extensions (*extensions-of-valuations-are-conjugate*) ([Hansen] Theorem 3.1, Step 1, pp. 4–5).
*extensions_of_valuations_are_conjugate* states surjectivity and orbit fibres on the actual
`ValuationSpectrum`, and bijectivity of restriction from the automorphism fixed field to `K`.
*Needs:* Mathlib `FixedPoints.subring`, `Algebra.IsInvariant`, `Algebra.IsInvariant.isIntegral`;
Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.IsPseudoUniformizer`.

**Checks.**

- *invariants_trivialGroup* (degenerate) — for the trivial group, `invariantPair` returns
  `(A, A⁺)`, and `N(ϖ) = ϖ`.
- *invariants_trivialAction* (degenerate, negative control) — for the trivial action of a group
  `G` of order `m`, `A^G = A`, `A^{+G} = A⁺`, and `N(ϖ) = ϖ^m`, a pseudouniformizer; the formula also includes `m = 1` and the zero ring;
  for `A` of characteristic `p` and `|G| = p` the trace `a ↦ Σ_g g·a = p·a` is zero while
  `A^G = A`: the invariant ring is not the image of a trace or averaging operator when `p`
  divides `|G|`.
- *invariants_swap_prod* (computation) — for `A = K × K`, `A⁺ = K⁺ × K⁺` and `ℤ/2` swapping the
  factors, `A^G` is the diagonal copy of `K`, `A^{+G}` the diagonal copy of `K⁺`, and the norm of
  `(ϖ, ϖ)` is `(ϖ, ϖ)·(ϖ, ϖ) = (ϖ², ϖ²)`.
- *invariants_plus_stability_required* (auxiliary negative control) — if `a ∈ P` but `a ∉ Q`
  for subrings `P, Q ⊆ K`, then `(a,0) ∈ P × Q` but its swap is not in `P × Q`.
  Preserving the plus ring is a separate hypothesis on the action; the rational-subset
  theorem includes it explicitly.
- *norm_zero_one* (computation) — for every finite group action on a commutative ring,
  `N(0) = 0` and `N(1) = 1`; a group is nonempty. The Check *norm_trivialGroup* gives
  `N(a) = a` for a one-element group, and *invariants_trivialAction* gives `N(a) = a^|G|`.
- *invariants_toSubring_eq_fixedPoints* (compatibility) — the underlying subring of
  `invariantPair G (A, A⁺)` is `FixedPoints.subring A G`, and `A` is `Algebra.IsInvariant`
  over it.

The maps are pinned by *invariants_map_apply*, *invariants_subgroup_apply* and
*invariants_inclusion_apply*: after forgetting fixed-element subtypes they are the original
pair map, the identity inclusion and the inclusion in `A`. The following Checks also apply
to these constructions:

- *invariants_map_identity*, *invariants_map_injective* — restriction preserves the identity
  map and injectivity. *invariants_map_zero_one* is an auxiliary ring-homomorphism
  calculation sending `(0,1)` to `(0,1)`; it does not count as a definition Check.
- *invariants_map_swap_diagonal* — let `f : K → L` be a continuous ring map carrying
  `K⁺` into `L⁺`, with product Tate pairs and swap actions on `K × K` and `L × L`.
  The componentwise pair map is equivariant; *invariantPair.map* sends `(a,a)` to
  `(f(a),f(a))`, whose plus-ring membership is exactly `f(a) ∈ L⁺`. In particular
  the induced map on the identified diagonal rings is `f`, including its integral restriction.
- *invariants_subgroup_top*, *invariants_subgroup_bot*, *invariants_subgroup_injective* — restriction
  to the whole group is bijective; restriction to the trivial subgroup sends a fixed element
  to the same element of `A`; every subgroup restriction is injective.

Lean: `isClosed_fixedPoints` with the subspace `IsUniformAddGroup` and `CompleteSpace` instances on
`FixedPoints.subring A G` (closedness and completeness in clause (i)), `isTateRing_fixedPoints`
(clause (i), a theorem registered as an instance, so that the pair-level declarations see the
Tate structure on `A^G`), `isRingOfIntegralElements_comap_fixedPoints` (clause (iii)) and
`invariantPair`.
Clause (iii), and with it the pair `invariantPair`, does not use the stability `g(A⁺) = A⁺`;
clause (iv) and the spectrum theorem of P8.2 do. The orbit product and its pseudouniformizer property, the norm evaluations, the plus-ring
membership Check *invariants_pair_plus*, the remaining Checks, clauses (ii) and (iv), the maps
*invariantPair.map* and *invariantPair.subgroup*, and
*extensions-of-valuations-are-conjugate* are README only.

### P8.2 the orbit space of the adic spectrum

**`|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`.** (*invariant-spectrum-homeomorphism*) With `(A, A⁺)`
and `G` as in *invariant-huber-pair* (no completeness, Hausdorffness or sheafiness assumed), the continuous map
`q : |Spa(A, A⁺)| → |Spa(A^G, A^{+G})|`, `v ↦ v|_{A^G}`, is surjective with fibres the `G`-orbits
and induces a homeomorphism `|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|` for the quotient topology.
Moreover `Spa(A, A⁺)` is the full preimage of `Spa(A^G, A^{+G})` in `Cont(A)`, and for every
rational subset `U = U(f₁, …, f_n / s)` of `Spa(A^G, A^{+G})` (`f_i, s ∈ A^G` generating an open
ideal of `A^G`, i.e. the unit ideal, since an open ideal of a Tate ring contains a power of the
pseudouniformizer; it then also generates the unit ideal of `A`) the preimage `q^{-1}(U)` is the
`G`-stable rational subset `U(f₁, …, f_n / s)` of
`Spa(A, A⁺)` ([Hansen] Theorem 3.1, p. 4). The `Spec` analogue — fibres of `Spec A → Spec A^G` are
`G`-orbits and the map is a quotient map — is Mathlib's `Algebra.IsInvariant.exists_smul_of_under_eq`
and `orbit_eq_primesOver` and Tau Ceti's `TauCeti.AffineInvariantQuotient.isQuotientMap_projection`,
`projection_eq_iff_exists_smul`, `isFinite_projection`; the free case, `|Spa(B)|/G ≅ |Spa(A)|` for
a finite étale `G`-torsor and `|Spa(Â_∞)|/G ≅ |Spa(A)|` for a completed torsor tower, is
AdicEtaleGeometry layer A4 (*torsor-spa-orbits*, *spa-of-completed-tower*); this target is the
continuous-valuation statement for an arbitrary action. Prove that `Cont(A) → Cont(A^G)`,
`v ↦ v|_{A^G}`, is surjective and that two continuous valuations have the same restriction iff
they lie in the same `G`-orbit for `v ↦ v ∘ g` (*continuous-valuations-over-invariants*) ([Hansen]
Theorem 3.1, Step 1, pp. 4–5). *Needs:* *invariant-huber-pair*; AdicEtaleGeometry layer A4
(*torsor-spa-orbits*, the free case); Mathlib `Algebra.IsInvariant.exists_smul_of_under_eq`; Tau
Ceti `TauCeti.AffineInvariantQuotient.isQuotientMap_projection`, `TauCeti.ValuationSpectrum.spaComap`,
`TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`,
`TauCeti.ValuationSpectrum.spa_integralClosure`.

Lean: `invariant_spectrum_homeomorphism`, for `G` finite acting continuously on a Tate ring and
preserving `A⁺`: restriction from `Spa(A, A⁺)` to the spectrum of `invariantPair` is a quotient map
whose fibres are the orbits of `v ↦ v ∘ g`. The full-preimage and rational-subset clauses and
*continuous-valuations-over-invariants* are README only.

### P8.3 the quotient v-sheaf of the invariants

**`Spd(A, A⁺) × G ⇉ Spd(A, A⁺)` presents `Spd(A^G, A^{+G})` as a v-sheaf.**
(*invariant-quotient-v-sheaf-presentation*) Let `A` be a complete Tate `ℤ_p`-algebra with a
continuous left action of a finite group `G` and `A⁺ ⊆ A°` a `G`-stable open integrally closed
subring of `A` (no perfectoidness, no condition on `|G|`); put `X = Spd(A, A⁺)` and
`X_G = Spd(A^G, A^{+G})`. Then `X → X_G` and `X × G → X ×_{X_G} X` are surjections of v-sheaves on
`Perf`. Hence `X × G ⇉ X → X_G` is a coequalizer of v-sheaves, `X/G ≅ X_G` for the quotient
v-sheaf, and the same holds for the quotient computed as a pro-étale sheaf ([CGJ] Proposition
2.1.1, p. 4; the pro-étale-sheaf clause is [HJ] Theorem 5.3, proof, p. 29, via [ECD] Proposition
13.6). *Needs:* *invariant-spectrum-homeomorphism*; DiamondsAndVStacks layers D2 and D5.

Lean: README only.

### P8.4 invariants of a perfectoid Tate ring

The next three subsections show that invariants of a perfectoid Tate ring are perfectoid and
commute with invariant rational localisation, and construct the categorical quotient of a
v-ringed space by a finite group.

**Invariants of a perfectoid Tate ring under a finite group are perfectoid.**
(*invariants-of-perfectoid-tate-ring*) Let `A` be a perfectoid Tate ring ([P1.1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts), any
characteristic) and `G` a finite group acting continuously on `A` by ring automorphisms. Then
`A^G`, with the subspace topology, is a perfectoid Tate ring ([KL16] Theorem 3.3.26, p. 68). There is no hypothesis on `|G|`: `p` may divide the order of `G`.
Moreover, `(A^G)♭ = (A♭)^G` as subrings of `A♭` with the same topology, compatibly with `♯`
(*Perfectoid.tilt_invariants*, by fixed compatible-root sequences in [ECD] Definition 3.9 and
Lemma 3.10, p. 16, and Lemma 3.11, p. 17). Over a perfectoid field `K` with a `K`-linear action,
perfectoidness is [Hansen] Theorem 3.5, p. 9; the general case is also stated in [Hansen]
Theorem 3.6, p. 9. Prove that for a `p`-group `G` of order `p^k`, a `G`-invariant
pseudouniformizer `ū` of `A♭` and `n` with `u = (ū^{1/p^n})♯` satisfying `u^{p^{k+1}} | p` in
`(A^G)°`, every `x ∈ (A^G)°` is a `p`-th power modulo `u^p (A^G)°`, with no division by an integer
(*frobenius-on-invariants-of-p-group*) ([KL16] Theorem 3.3.26, p. 68). Such `ū` and `n` exist:
`ū = N(ϖ♭)` for any pseudouniformizer `ϖ♭` of `A♭`; `u` is `G`-invariant because `p`-power roots
in the perfect ring `A♭` are unique and `♯` is `G`-equivariant; and if `ϖ = ϖ♭♯` satisfies
`ϖ^p | p` in `A°` and `ū | ϖ♭^m` in `A♭°`, then for `n ≥ k` with `p^{n−k} ≥ m` every
`v ∈ Spa(A♭, A♭°)` has `v(ϖ♭)^{p^{n+1}} ≤ v(ū)^{p^{k+1}}`. Extracting
`p^n`-th roots gives the divisibility comparison, so `u^{p^{k+1}} | ϖ^p | p` in `A°`, and
`p/u^{p^{k+1}} ∈ A° ∩ A^G = (A^G)°`. For `k = 0` the theorem is Frobenius surjectivity on
`A°/u^p`: `x = y^p + pz = y^p + u^p (p/u^p) z`. *Needs:*
*invariant-huber-pair*; [P1.1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts); [P1.4](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts); Mathlib `Sylow`, `sub_pow_char_pow`.

**Checks.**

- *invariants_completeness_needed* — the trivial action on `ℚ` fixes every element,
  and the fixed subring remains incomplete. Completeness requires a complete ambient ring.
- *invariants_trivialAction_perfectoid* (degenerate) — for the trivial action, or the trivial
  group, `A^G = A` and `(A^G)♭ = A♭`.
- Perfect invariants in characteristic `p` (computation) — in characteristic `p` the `p`-th root of a
  `G`-invariant element is `G`-invariant (Frobenius is injective), so `A^G` is a perfect complete
  Tate ring, hence perfectoid by [P1.2](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts) with no group theory; for `ℤ/p` permuting the variables of
  `K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩` the invariants are perfectoid and contain `T₁ + ⋯ + T_p`, whose
  `p`-th root `T₁^{1/p} + ⋯ + T_p^{1/p}` is again invariant.
- *invariants_infinite_group_not_perfectoid* (negative control) — finiteness of `G` is needed:
  for a perfectoid field `K` of characteristic zero containing a chosen compatible
  system of primitive `p`-power roots of unity, and `G = ℤ_p(1)` acting on `K⟨T^{1/p^∞}⟩` by
  `T^{m/p^n} ↦ ζ_{p^n}^{mγ} T^{m/p^n}`, a monomial is invariant iff `p^n | m`, so
  `A^G = K⟨T⟩`, which is not perfectoid (`T` is not a `p`-th power modulo `p`: reduce to
  `k[T]`).
- *invariants_kummer_char_p* (boundary control) — for `K` the completed perfection of
  `𝔽_p((t))`, every `p`-power root of unity is `1`, since `X^(p^n) − 1 = (X − 1)^(p^n)`.
  The root-of-unity action is trivial and its fixed ring is all of `K⟨T^{1/p^∞}⟩`.

The bundled perfectoid pair is *Perfectoid.PairCat.invariants*, with structural map
*Perfectoid.PairCat.invariantsι*; its carrier is the supplied fixed subring and its plus ring
is the inverse image of `A⁺`. *invariants-of-perfectoid-tate-ring* states the finite-action
theorem without an invertibility hypothesis. *frobenius_on_invariants_of_p_group* takes `|G| = p^k`, a
`G`-invariant pseudouniformizer `ū` in `tilt p R`, an integer `n ≥ 0`, and its unique root
`v` with `v^(p^n) = ū`. The parameter `u ∈ (R^G)°` is a pseudouniformizer with
`u = tilt.sharp v` in `R` and `u^(p^(k+1)) ∣ p` in `(R^G)°`. The conclusion is
`x = y^p + u^p z` in `(R^G)°`. This is the p-group input in the proof of [KL16]
Theorem 3.3.26, p. 68; its proof uses the tilt of `R` and does not use
*invariants-of-perfectoid-tate-ring* for `R^G`. The root equation also covers the zero ring, without
requiring a nontriviality hypothesis to express inverse Frobenius.

- *frobenius_on_invariants_of_p_group_root_zero* — at `n = 0`, the root equation forces
  `v = ū`, so the sharp hypothesis is exactly `u = ū♯`.
- *frobenius_on_invariants_of_p_group_trivialGroup* — for a group of order one, `k = 0`
  reduces the divisibility hypothesis to `u^p ∣ p` and gives Frobenius surjectivity
  modulo `u^p` with the same sharp parameter.

For a finite group acting continuously on a perfectoid pair and preserving its plus ring,
*Perfectoid.tilt_invariants* gives an isomorphism of perfectoid pairs
`tilt (invariants R) ≅ invariants (tilt R)`. Its composite with the invariant-pair inclusion
is `Pair.tiltHom` of the original inclusion, and applying `sharp` after this comparison
agrees with including the sharp value from `R^G` into `R`. Thus it identifies both plus
rings and the subspace topologies, without a restriction on the group order. The action
on the right is *Perfectoid.PairCat.tiltAction*, defined by tilting each automorphism;
*tiltAction_coeff* specifies every coordinate, *tiltAction_continuous* gives continuity,
and *tiltAction_plus* gives preservation of the tilted plus ring. Once
*invariants-of-perfectoid-tate-ring* applies, these assertions follow by taking fixed compatible-root
sequences in [ECD] Definition 3.9 and Lemma 3.10, p. 16, and Lemma 3.11, p. 17.

- *tiltAction_coeff* — the action on every coordinate, including the first root, is the
  original action on that coordinate.
- *tiltAction_trivial* — an action trivial on `R` is trivial on its tilt, even for a
  nontrivial group.
- *tiltAction_movedCoordinate* — if any coordinate is moved by a group element, the
  corresponding tilted element is not fixed by it.

- *invariants_pair_trivial* — for a one-element group the structural map is an isomorphism.
- *invariants_trivialAction_tilt* — for a trivial action, the tilt of the fixed-pair inclusion
  is an isomorphism; thus the comparison is induced by the original inclusion.
- *invariants_pair_empty* — the zero pair has zero invariant pair.
- *invariants_pair_plus* — an element of the fixed ring is integral in the invariant pair
  exactly when its image belongs to `A⁺`, by the comap definition in
  *PairCat.invariants* and `invariantPair`.

Lean: README only. *invariants-of-perfectoid-tate-ring* carries the hypothesis that `A` is
perfectoid and no hypothesis on `|G|`; its statement needs PerfectoidSpaces'
`Perfectoid.IsPerfectoidTateRing`, which the pinned libraries do not provide, and with
PerfectoidSpaces' `IsPerfectoidTateRing.iff_perfectRing` it gives the characteristic-`p` Check
above. *Perfectoid.tilt_invariants*, *frobenius-on-invariants-of-p-group*, the bundled pair
*Perfectoid.PairCat.invariants* with the tilted action, and the remaining Checks are specified
here.

### P8.5 invariants and rational localisation

**Invariants commute with invariant rational localisation for perfectoid pairs.**
(*rational-invariants-perfectoid*) Let `(A, A⁺)` be a perfectoid Tate–Huber pair, of any
characteristic, with a continuous action of a finite group `G` of any order (no linearity over a
base field), and `q : X = Spa(A, A⁺) → Y = Spa(A^G, A^{+G})`. For every rational subset `U` of
`Y`, `A^G⟨T/s⟩ → A⟨T/s⟩^G` is an isomorphism ([CGJ] Proposition 2.1.3(2), p. 5, whose proof
establishes exactly this isomorphism), and `A^{G+}⟨T/s⟩ → (A⁺⟨T/s⟩)^G` is an isomorphism (plus
rings: the integral closures of the images); hence `O_Y = (q_*O_X)^G` and `O_Y⁺ = (q_*O_X⁺)^G`.
The plus-ring clause is not part of [CGJ]'s statement. It follows from the rational clause,
*invariant-spectrum-homeomorphism* (P8.2) and Huber's recovery of a ring of integral elements
from its adic spectrum: write `B = A^G⟨T/s⟩ ≅ A⟨T/s⟩^G`; both `A^{G+}⟨T/s⟩` and `A⁺⟨T/s⟩ ∩ B` are
open integrally closed subrings of `B`, the first with `Spa(B, A^{G+}⟨T/s⟩) = U` (rational
localisation) and the second with `Spa(B, A⁺⟨T/s⟩ ∩ B) = Spa(A⟨T/s⟩, A⁺⟨T/s⟩)/G = q(q⁻¹(U)) = U`
(P8.2 for the Tate ring `A⟨T/s⟩` with its induced continuous `G`-action), the same subset of
`Cont(B)`; an open integrally closed subring is the set of elements of value at most `1` at every
point of its adic spectrum ([Wedhorn] Proposition 7.18(1), pp. 60–61), so the two coincide. The characteristic-`p` specialization, for any `|G|`, states:
`A^G⟨T/s⟩ → A⟨T/s⟩^G` is an isomorphism for every rational `U(T/s)` of `Spa(A^G, A^{+G})`
(*rational-invariants-characteristic-p*) ([CGJ] Proposition 2.1.3(2), p. 5, of which it is a
case; Remark 2.1.4, pp. 5–6, gives a direct proof in characteristic `p`, to which tilting reduces
the general case). *Needs:*
*invariants-of-perfectoid-tate-ring*; *invariant-spectrum-homeomorphism*; [P2.3](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P1.27](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts); Mathlib
`PerfectRing`, `Choose.choose_pow_mul_pow_mul_modEq_choose_nat`.

*rational_invariant_action* extends the given action to the completed localization on
`q⁻¹(U)` by equivariance of its structural map. *rational_invariants_perfectoid*
identifies the localized invariant pair with the invariant localized pair by an isomorphism
in `PairCat`, including continuity and the integral-closure plus rings. Its structural-map
equation fixes the comparison, including its direction. Check
*rational_invariants_characteristic_p* applies this theorem under `[CharP R p]`;
the same statement includes characteristic `p` without a second theorem.

- *rationalInvariants_empty* — the empty rational subset gives the zero ring on both sides.
- *rationalInvariants_whole* — localization on the whole spectrum gives an isomorphism from
  the original fixed pair to the fixed localized pair.
- *rationalInvariants_plus_swap* (computation) — for `A = K × K` with `A⁺ = K⁺ × K⁺`, `G = ℤ/2`
  acting by the swap and `U` the whole spectrum, `A^{G+}⟨T/s⟩` and `(A⁺⟨T/s⟩)^G` are both the
  diagonal copy of `K⁺` inside the diagonal `K`; a definition that takes the upstairs plus ring
  `A⁺⟨T/s⟩ = K⁺ × K⁺` itself gets a ring that is not even contained in `B`.
- *rationalInvariants_trivialAction* — a trivial action on the original pair extends to the
  trivial action on the completed rational localization, even when the group is nontrivial.

Lean: README only.

### P8.6 the categorical quotient of a v-ringed space

**The categorical quotient `X/G` of an adic space by a finite group.** (*categorical-quotient*)
Let `X = (|X|, O_X, (v_x))` be an adic space (more generally an object of Huber's category `V` of
v-ringed spaces) with a left action `ρ : G →* Aut X` of a finite group `G`; the quotient always exists in `V`,
and whether it is an adic space or perfectoid is the content of the quotient theorems. Define
`X/G = (|X|/G, (q_*O_X)^G, (v_y))`, where `|X|/G` has the quotient topology, `q : |X| → |X|/G` is
the orbit map, `(q_*O_X)^G` is the sheaf of `G`-invariant sections (a sheaf of complete topological
rings), and `v_y` is the valuation on `O_{X/G,y}` induced by `O_{X/G,y} → O_{X,x} → Γ_{v_x} ∪ {0}`
for any `x` over `y` (independent of `x`). Then `X/G` is an object of `V` with a `G`-invariant
morphism `q : X → X/G`, and it is the categorical quotient in `V`: every `G`-invariant morphism
`X → Z` in `V` factors uniquely through `q`. Define *VRingedSpace.quotient* (the object `X/G`) and
*VRingedSpace.quotient.π* (the `G`-invariant morphism `q`); prove
*VRingedSpace.quotient.isQuotientMap* (`|q|` is the quotient map `|X| → |X|/G`, and it is open)
([Hansen] Definition 2.2, p. 3, and Proposition 2.3, p. 4, for the universal property;
openness follows from `q⁻¹q(U) = ⋃_{g∈G} gU` for open `U`). *Needs:* the Foundations of adic spaces roadmap (AdicSpaces),
layer 3; Mathlib `TopCat.Presheaf`, `Topology.IsQuotientMap`.

The carrier *VRingedSpace.Object* has a sheaf of complete separated topological rings and
an equivalence class of valuations on each underlying ring stalk, without imposing local
stalks. *VRingedSpace.Hom* consists of a continuous morphism of these sheaves preserving the
stalk valuations. Identity and composition use the supplied presheafed-space maps.
*quotient.invariant*, *quotient.fibres* and *quotient.universal* pin the projection, orbit fibres
and categorical property. *quotient.sheaf_universal* pins the invariant direct-image sheaf
as a quotient in presheafed spaces as well; valuation compatibility is the *Hom.valuation_eq*
field, so the construction retains the sheaf and valuation data.

**Checks.**

- *quotient_left_action_mul* — on the v-ringed-space carrier,
  `(ρ (g * h)).hom = (ρ h).hom ≫ (ρ g).hom`; the noncommuting computation
  *action_order_two_terms* above distinguishes this left action from a right action.
- *quotient_empty* — the quotient of the empty v-ringed space has no points.
- *quotient_single_orbit* — a transitive action on the point space gives exactly one quotient
  point, including nontrivial stabilizers; this does not assert that its section ring is unchanged.
- *vHom_empty* — the empty v-ringed space has exactly one morphism to every target.
- *vHom_field_extension* — an isometric embedding of complete nonarchimedean fields
  `K → L` gives `Spa(L,L°) → Spa(K,K°)` in *VRingedSpace.Hom*; on the unique stalk
  it is the given embedding and its pulled-back valuation is the valuation on `K`.
- *vHom_incompatible_valuations* — take the one-point v-ringed spaces with section
  ring `ℚ_p`, once with its `p`-adic valuation and once with the trivial valuation.
  The identity topological ring map gives a map of the underlying ringed spaces but
  cannot be a *VRingedSpace.Hom*: `p` has value less than `1` in one stalk and value
  `1` in the other. These spaces use the general v-ringed carrier, not an assertion
  that the trivial valuation is continuous on the `p`-adic field spectrum.
- *vHom_identity*, *vHom_composition* — identity fixes every point and composite sheaf maps
  compose in the same order as the continuous maps.
- *quotient_trivialAction* (degenerate) — for the trivial action of `G`, `q : X → X/G` is an
  isomorphism; for `X = ∅`, `X/G = ∅`.
- *quotient_point* (computation) — for a complete nonarchimedean field `K` with `G` acting by
  continuous automorphisms, `Spa(K, K°)/G = Spa(K^G, (K^G)°)`, again one point, `K^G` a closed
  subfield; for `Spa(K, K⁺)` with a valuation subring `K⁺ ⊊ K°` the quotient is `Spa(K^G, K⁺ ∩ K^G)`, and
  `K⁺ ∩ K^G` is a valuation ring of `K^G` (one of `x`, `x⁻¹` lies in `K⁺`).
- *quotient_prod_self* (computation) — for `X = Y × G` with `G` acting on itself by right
  translation, `X/G ≅ Y`; the Check passes the left `Gᵐᵒᵖ`-action to
  *VRingedSpace.quotient*.
- *affinoid_perfectoid_quotient* (compatibility) — for an affinoid perfectoid `Spa(A, A⁺)` with
  `G`, `X/G` is `Spa(A^G, A^{+G})`, by *affinoid-perfectoid-quotient*.
- *quotient_not_etale_at_fixed_point* (negative control) — for `p` odd and `μ₂` acting on the
  perfectoid disc by `T^{1/p^n} ↦ −T^{1/p^n}` (compatible since `(−T^{1/p^n})^p = −T^{1/p^{n−1}}`;
  for `p = 2`, `(−T^{1/2})² = T ≠ −T`, so this action does not exist), `q` is not étale at the
  fixed point `T = 0`: the fibre over `q(0)` has one geometric point, whereas fibres at nonzero points have two,
  so the local degree cannot be that of a finite étale map near `0`. In particular it is not
  a `G`-torsor. **Auxiliary calculation *quotient_sign_two_terms*:** over `ℚ`, the pair
  `((-1)^2, -(1^2))` is `(1, -1)` but `((-1)^3, -(1^3)) = (-1, -1)`.
  In characteristic two negation is the identity, so it gives no such obstruction.

The *quotient_point* Check uses *VRingedSpace.ofAdicSpace* on the field
and its invariant pair, identifies the action on sections, and intertwines the
quotient projection with the inclusion of fixed rings. This includes fields
that are not perfectoid. The affinoid perfectoid comparison uses
*toVRingedSpace* and its section comparison on rational charts. The product Check uses the finite coproduct with its translation
action. The geometric fixed-point ramification Check uses the perfected-disc quotient
and the finite étale local-degree comparison.

[PerfectoidSpaces P2.10](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)
and [P3.17](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site)
supply *PerfectoidSpace.toAdicSpace* and *PerfectoidSpace.locallyStronglySheafy*:
the inclusion of `Perfd p` into pre-adic spaces, which lands in adic spaces, and an
adic representative, as described in the
[PerfectoidSpaces supplier contracts](#exact-supplier-contracts).

**Checks.**

*PerfectoidSpace.toVRingedSpace* is the composite of `toAdicSpace`, read in
`TauCeti.AdicSpace` (`PerfectoidSpace.isPerfectoidSpace_le_isAdic`), with
*VRingedSpace.ofAdicSpace*. For every `X : Perfd p`, *toVRingedSpace_sheaf*
identifies the entire presheafed space of complete topological rings with that of
its adic representative, including all restriction maps. *toVRingedSpace_valuation*
identifies each stalk valuation with the representative's residue-field valuation
pulled back along the residue map. For every morphism of perfectoid spaces,
*toVRingedSpace_map* identifies the whole continuous sheaf morphism with the adic
one. These are the forgetful constructions on the adic spaces of [ECD]
Definition 3.19, p. 18, using the supplied `PreAdicSpace.stalkValuation_def`.
*toVRingedSpace_spec* gives a family of carrier homeomorphisms intertwining the
maps on points of all morphisms, together with the ring comparison on every open. The Checks
*toVRingedSpace_empty*, *toVRingedSpace_affinoid*, and *toVRingedSpace_point*
respectively give an empty carrier, the original ring of global sections of an
affinoid, and a nonempty field spectrum with global sections equal to that field.

*VRingedSpace.ofAdicSpace* forgets the local-stalk condition of an actual adic
space. Its structure sheaf is unchanged, and its valuation is the residue-field
valuation composed with the residue map. Checks *ofAdicSpace_empty*,
`_affinoid`, and *_stalk_support* respectively preserve the empty carrier,
recover the affinoid section ring, and give the maximal ideal as valuation support.

Lean: `IsCategoricalQuotient ρ q` states, for a left action `ρ : G →* Aut X` on a Tau Ceti
pre-adic space, that `q` is `G`-invariant, that every `G`-invariant morphism of pre-adic spaces
out of `X` factors uniquely through `q`, and that `q` is a quotient map on points whose fibres are
the orbits. Morphisms of Tau Ceti pre-adic spaces are the morphisms of `V` between such objects,
so this is the universal property of *categorical-quotient* tested against pre-adic spaces. The
`example` after it states a negative control: if some `ρ g ≠ 1`, the identity is not a
categorical quotient; the trivial-action clause of *quotient_trivialAction* (the identity is a
categorical quotient) is README only. The construction *VRingedSpace.quotient* on the carrier
*VRingedSpace.Object*, *VRingedSpace.ofAdicSpace*, *PerfectoidSpace.toVRingedSpace* and the
remaining Checks are README only.

### P8.7 the quotient of an affinoid perfectoid space

The next ten subsections prove the quotient theorems: for affinoid perfectoid spaces, for spaces
with a `G`-stable affinoid cover (perfectoid, analytic adic with `|G|` invertible, rigid), the
comparison of the diamond of a quotient with the quotient of the diamond, the torsor criterion,
and the `G`-clean neighbourhoods, Zariski-closed embeddings and analytic separation needed for
quotients of separated rigid spaces.

**The quotient of an affinoid perfectoid space by a finite group.**
(*affinoid-perfectoid-quotient*) Let `(A, A⁺)` be a perfectoid Tate–Huber pair with a continuous
action of a finite group `G` preserving `A⁺` (any `|G|`, no base field). Then
`X_G = Spa(A^G, A^{+G})` is an affinoid perfectoid space and `q : X = Spa(A, A⁺) → X_G` is the
categorical quotient `X/G` in `V` (so also in adic spaces); it is also the coequalizer of
`X × G ⇉ X` in Kedlaya–Liu's locally v-ringed spaces ([CGJ] Proposition 2.1.3(2), p. 5). Prove
that finite quotients commute with topologically orthonormalisable scalar extension: for a
complete Banach Tate–Huber pair `(A, A⁺)` over `(K, K°)` with a continuous `K`-linear action
preserving `A⁺`, and `L/K` complete with a specified bounded isomorphism `L ≅ c₀(I, K)` (`G`
trivial on `L`), `D = A^G ⊗̂_K L → (A ⊗̂_K L)^G` is a topological algebra isomorphism (through
`A ⊗̂_K L ≅ c₀(I, A)` the invariants are computed coordinatewise, `c₀(I, A)^G = c₀(I, A^G)`, with
no averaging, so also for `p = 2` and `|G|` even; for `I` a singleton, `L = K` and the statement
is `A^G = A^G`), and for
`C = A ⊗̂_K L` uniform, with the plus rings of AdicSpacesPartII layer R0, `D⁺ = C⁺ ∩ C^G` and
`|Spa(C, C⁺)|/G ≅ |Spa(D, D⁺)|`; so the represented quotient commutes with the perfectoid scalar
extension of [P2.16](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces) and with reduced classical affinoid scalar extensions
(*quotient-scalar-extension*) (the coordinatewise argument of [CHJ] Lemma 2.23(2),
pp. 19–20, stated there over `ℚ_p`; here the specified `c₀` isomorphism supplies the same
argument over `K`). The Banach-module theorem *quotient_scalar_extension* uses the specified
`c₀` model, whereas *invariants_completedTensor* consumes the countable-type model of
PadicFunctionalAnalysis §§2.2, 2.4 or the discretely valued model of §§2.2–2.3.
These are bounded linear equivalences; an isometry for the original norm requires an
orthonormal basis for that norm. The pair statement is *quotient_scalar_extension_pair*:
`K` and `L` are complete
nonarchimedean nontrivially normed fields, `A` is a complete nonarchimedean normed `K`-algebra
with its Tate topology, and `G` is finite, acts continuously by `K`-algebra automorphisms,
and preserves `A⁺`. The structure map sends `K°` into `A⁺`. The action on the completed
tensor is specified by `g(a ⊗ l) = (ga) ⊗ l`. The comparison is a ring isomorphism and a
homeomorphism sending `a ⊗ l` to `a ⊗ l`; this also fixes the `L`-algebra structure.
Both `C⁺` and `D⁺` are supplied by `Pair.completedTensor`, using the completed integral
closure of the images of the two plus rings ([KL I] Definition 2.4.1, p. 38).
When `C` is uniform, the comparison sends `D⁺` onto the plus ring of
`invariantPair G C`, namely the inverse image of `C⁺` in `C^G`. Transporting
`invariant_spectrum_homeomorphism` across this pair isomorphism gives the stated spectrum
homeomorphism: the canonical `Spa C → Spa D` is a quotient map and two points have the same
image exactly when their valuation classes differ by an element of `G`.

Check *quotient_scalar_extension_pair_twoTerms* uses the comparison `e` supplied by
*quotient_scalar_extension_pair* with `A = K × K`, `L = K`, a singleton `c₀` basis,
and an element `σ` acting by swapping coordinates. It computes
`e(tmul((a,a) ⊗ l)) = tmul((a,a) ⊗ l)` and the difference of two such tensors,
with diagonal elements in the fixed algebra on the left. It also computes the supplied
action on a general tensor: `σ(tmul((a,b) ⊗ l)) = tmul((b,a) ⊗ l)`.
Check *quotient_scalar_extension_pair_emptyBasis* excludes an empty `c₀` basis for the
nonzero field `L`; it is a negative control for the theorem's hypotheses.
Check *quotient_scalar_extension_pair_zeroAlgebra* uses the theorem's comparison for
zero `A` and verifies that both `e` and its inverse send every element to zero. *Needs:*
*invariants-of-perfectoid-tate-ring*; *invariant-spectrum-homeomorphism*;
*rational-invariants-perfectoid*; *categorical-quotient*; [P2.8](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P2.16](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); AdicSpacesPartII layer R0;
PadicFunctionalAnalysis §§2.2–2.4 (basis and model interfaces).

Lean: README only. *affinoid-perfectoid-quotient* needs the perfectoid Tate predicate and the
category of perfectoid spaces of PerfectoidSpaces, which the pinned libraries do not provide. The
identification of the quotient with `Spa(A^G, A^{+G})`, the coequalizer statement,
*quotient-scalar-extension*, *quotient_scalar_extension_pair*, *invariants_completedTensor* and
their Checks are specified here.

### P8.8 quotients under an invariant affinoid perfectoid cover

**Perfectoid quotients under a `G`-stable affinoid perfectoid cover.**
(*perfectoid-quotient-invariant-cover*) Let `X` be a perfectoid space with a left action
`ρ : G →* Aut X` of a finite group `G`, and suppose `X` has a covering by `G`-stable open subspaces
`U_i = Spa(A_i, A_i⁺)` with `A_i` perfectoid Tate (the hypothesis that *perfectoid-finite-quotient*
removes under analytic separation). Then `X/G` (the categorical quotient in `V`; equivalently the
coequalizer of `X × G ⇉ X` in locally v-ringed spaces) is a perfectoid space covered by the
affinoid perfectoid opens `U_i/G = Spa(A_i^G, A_i^{+G})`; `|X/G| = |X|/G`; the preimage under `q`
of each `U_i/G` is `U_i`. There is no condition on `|G|`; Hansen's Theorem 1.4 is the case
`|G| ∈ O_X(X)^×` or a `K`-linear action over a perfectoid field ([CGJ] Theorem 2.1.2, p. 5).
*Needs:* *affinoid-perfectoid-quotient*; *categorical-quotient*.

Lean: README only. *perfectoid-quotient-invariant-cover* needs the category of perfectoid spaces
and the affinoid perfectoid predicate of PerfectoidSpaces, which the pinned libraries do not
provide. Its invertible-order analogue with Tate affinoid charts is
`exists_isCategoricalQuotient_of_invertible_order` (P8.9).

### P8.9 adic quotients with invertible group order

**Quotients of analytic adic spaces with a `G`-stable affinoid cover, `|G|` invertible.**
(*adic-quotient-order-invertible*) Let `X` be an analytic adic space with an action of a finite
group `G`, covered by `G`-stable open affinoid subspaces `Spa(A_i, A_i⁺)` with `A_i` a Tate ring
(Tate because the homeomorphism theorem needs a pseudouniformizer), and assume `|G|` is invertible
in `O_X(X)` (invertible in the Tate rings, not in the plus rings: for `ℤ/2` swapping
`ℚ_2 × ℚ_2`, `2 ∈ A^×` and the averaging idempotent sends `(1, 0)` to `(1/2, 1/2) ∉ A⁺`, while
`A^{+G}` is the diagonal `ℤ_2` by *invariant-huber-pair*). Then `X/G` is an adic space with
underlying space `|X|/G`, covered by the affinoid
adic spaces `Spa(A_i^G, A_i^{+G})` ([Hansen] Theorem 1.1, p. 1). Prove that for a sheafy complete
Tate–Huber pair `(A, A⁺)` (not necessarily perfectoid) with `|G| ∈ A^×`, `A^G⟨f/h⟩ → A⟨f/h⟩^G` is
an isomorphism for every rational subset `U(f₁, …, f_n / h)` of `Y = Spa(A^G, A^{+G})`, so
`O_Y = (q_*O_X)^G` is a sheaf and `Y = X/G` in `V` (*rational-invariants-order-invertible*) (
[Hansen] Theorem 3.3, p. 7). *Needs:* *invariant-spectrum-homeomorphism*; *categorical-quotient*;
Tau Ceti `TauCeti.Huber.PairOfDefinition.completionLocObj`.

**Checks** of the Tate affinoids in the hypothesis.

- *isTateAffinoid_le_isAffinoid* (compatibility) — every Tate affinoid is affinoid in Tau Ceti's
  sense (`PreAdicSpace.isAffinoid`).
- *isTateAffinoid_spa* (compatibility) — `Spa(A, A⁺)` of a Tate–Huber pair is a Tate affinoid.
- *isTateAffinoid_padic_field* (computation) — `Spa(ℚ_p,ℤ_p)` is a Tate affinoid:
  its ring of definition is `ℤ_p` with ideal `(p)`, and `p` is a topologically nilpotent unit.
- *isTateAffinoid_zero* (degenerate) — the zero pair gives the empty Tate affinoid;
  its unique element `0 = 1` is a topologically nilpotent unit, and its spectrum is empty.
- *isTateAffinoid_not_padic_integers* (negative control) — `Spa(ℤ_p, ℤ_p)` is affinoid but not a
  Tate affinoid: every Tate affinoid is analytic, while the point of `Spa(ℤ_p, ℤ_p)` with support
  `(p)` is not.

Lean: `isTateAffinoidModel` (pre-adic spaces of the form `Spa(A, A⁺)` with `A` a Tate ring), its
isomorphism closure `isTateAffinoid`, and `exists_isCategoricalQuotient_of_invertible_order` (for
an adic space with `|G|` invertible in global sections and a cover by `G`-stable open Tate
affinoids, the categorical quotient exists and is adic, and every `G`-stable open Tate affinoid is
the full preimage of an open Tate affinoid of the quotient). The proved `example` states
*isTateAffinoid_le_isAffinoid*. The Checks *isTateAffinoid_spa*, *isTateAffinoid_padic_field*,
*isTateAffinoid_zero* and *isTateAffinoid_not_padic_integers*, the assertion that
`Spa(ℤ_p,ℤ_p)` is affinoid and *rational-invariants-order-invertible* are README only.

### P8.10 rigid quotients under an invariant affinoid cover

**Quotients of rigid spaces with a `G`-stable affinoid cover, for any `|G|`.**
(*rigid-quotient-invariant-cover*) Let `X` be a rigid analytic space over a complete
nonarchimedean field `K` with a `K`-linear action of a finite group `G`, and suppose `X` has an
(admissible) covering by `G`-stable open affinoid subspaces; no condition on `|G|`. Then `X/G` is
a rigid analytic space over `K`, `q : X → X/G` is finite, and `X/G` is affinoid if `X` is.
Conversely, if `X/G` is rigid with `q` finite then such a covering exists ([Hansen] Theorem 1.3,
p. 2). Prove that for a `K`-affinoid algebra `A` and `G` acting by `K`-algebra automorphisms, in
any characteristic and for any `|G|`, `A^G` is `K`-affinoid and `A` is a finite `A^G`-module
(*invariants-of-affinoid-algebra*) ([CHJ] §6.4, opening paragraph, p. 53); and that for
`X = Spa(A, A°)`, `Y = Spa(A^G, (A^G)°)` (with `(A^G)° = A° ∩ A^G`) and every rational `U(f/h)`
of `Y`,
`A^G⟨f/h⟩ = A⟨f/h⟩^G`, so `O_Y = (q_*O_X)^G`, `Y = X/G` in `V` and `q` is finite
(*rational-invariants-affinoid-algebra*) ([Hansen] Theorem 3.4, p. 8). *Needs:*
*categorical-quotient*; *invariant-huber-pair*; AdicSpacesPartII layer R0; Tau Ceti
`TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`.

Lean: README only.

### P8.11 the diamond of a finite quotient

**The diamond of a finite quotient is the quotient of the diamond.**
(*quotient-diamond-comparison*) Let `X` be an analytic adic space over `ℤ_p` with an action of a
finite group `G`, covered by `G`-stable affinoid opens `Spa(A_i, A_i⁺)` such that `X/G` is an adic
space covered by the `Spa(A_i^G, A_i^{+G})` (as in the three quotient theorems above). Then the
canonical map `X^◇/G → (X/G)^◇` of pro-étale sheaves (equivalently v-sheaves) is an isomorphism
([HJ] Theorem 5.3 and its proof, pp. 28–29). *Needs:*
*invariant-quotient-v-sheaf-presentation*; *perfectoid-quotient-invariant-cover*;
DiamondsAndVStacks layer D4.

Lean: README only.

### P8.12 free actions and finite étale torsors

**Free actions give finite étale torsors; the universal quotient is not one in general.**
(*free-action-quotient-is-torsor*) Let `X` be a perfectoid space with a left action
`ρ : G →* Aut X` of a finite group `G` such that `X/G` is a perfectoid space with `(X/G)^◇ = X^◇/G` (for instance under a `G`-stable
affinoid perfectoid cover, or the hypotheses of *perfectoid-finite-quotient*). The following are
equivalent: (a) `q : X → X/G` is a finite étale `G`-torsor, i.e. finite étale with
`t : X × G ≅ X ×_{X/G} X`, where `s_g`, the section `X → X × G` of
`PerfectoidSpace.prodProfinite` at the point `g` (PerfectoidSpaces P6.8) followed by `t.hom`, satisfies
`s_g ≫ fst = 𝟙 X` and `s_g ≫ snd = (ρ g).hom` (that is, `s_g ≫ snd = ρ g`
when writing automorphisms as maps); thus `(x, g)` maps to `(x, g • x)`; (b) `G` acts freely on `X^◇`, i.e.
`X^◇ × G → X^◇ ×_{X^◇/G} X^◇` is injective; (c) every geometric point `Spa(C, C⁺) → X` has trivial
stabilizer in `G`. Conversely, if `Y → X` is a surjective finite étale map of perfectoid spaces
with a `G`-action over `X` such that `Y × G ≅ Y ×_X Y` (a `G`-torsor), then `X = Y/G`. The
universal quotient of the other quotient theorems is a `G`-torsor only when these conditions hold.
Prove *PerfectoidSpace.quotient_finiteEtale_iff_free* for `X Y : Perfd p`, a finite group
`G`, a left action `ρ : G →* Aut X`, and an invariant map `q : X → Y`: assume both that `q`
identifies `Y` with the quotient in `V` and that DiamondsAndVStacks’ `PreAdic.geometricDiamond p`, composed with `ULiftHom.up`, sends `q`
to the coequalizer of the action and projection maps `∐_{g ∈ G} X^◇ ⇉ X^◇`.
This second hypothesis expresses `Y^◇ = X^◇/G` on the perfectoid untilt test site,
as supplied by P8.11 (*quotient-diamond-comparison*). The conclusion is finite
étaleness together with the specified torsor isomorphism if and only if all geometric
stabilizers are trivial. Finite étaleness is AdicEtaleGeometry's
`YonedaAdicSpace.IsFiniteEtale`, restricted to perfectoid spaces.

For the implication from freeness, the sheaf coequalizer is an epimorphism, and its
kernel pair is the orbit relation. Freeness identifies that relation with `X^◇ × G`,
so pulling back along `X^◇ → Y^◇` trivializes the action. This gives a `G`-torsor
in the sense of [ECD] Definition 10.12, p. 53. Apply [ECD] Lemma 10.13, p. 53, to
the finite-index inclusion `{1} ≤ G` to obtain the finite étale map; its proof uses
finite étale descent from Proposition 10.11(iii), pp. 52–53. The reverse implication
follows by evaluating the torsor isomorphism at geometric points. These locators are
arXiv page numbers. *Needs:* *quotient-diamond-comparison*;
*perfectoid-quotient-invariant-cover*; [P2](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P3](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site). The diamond formulation is obtained
from this untilt-site statement through DiamondsAndVStacks' diamond functor (D6.4).

**Checks.**

- *quotient_finiteEtale_iff_free_trivial_group* — for the trivial group, every geometric
  stabilizer is trivial.
- *quotient_finiteEtale_iff_free_empty* — on the empty perfectoid space, the geometric
  stabilizer condition holds for every finite group.
- *quotient_finiteEtale_iff_free_trivial_action* — a nontrivial finite group acting
  trivially on a space with a geometric point fails the stabilizer condition, even
  though its quotient map is the finite étale identity. The torsor isomorphism is
  therefore essential to the criterion.

Lean: README only.

### P8.13 G-clean neighbourhoods

**`G`-clean neighbourhoods.** (*g-clean-neighbourhood*) The predicate is defined for a topological space `X` with a
(right) action of any group `G`; its neighbourhood-basis theorem assumes the action continuous
and `G` finite. Fix `x ∈ X` a point and `H_x ≤ G` its stabilizer (no
separation hypothesis). An open neighbourhood `U` of `x` is `G`-clean if `Uh = U` for all
`h ∈ H_x` and `U ∩ Ug = ∅` for all `g ∈ G ∖ H_x`. Define `MulAction.IsGClean` (the predicate: `U`
open, `x ∈ U`, `U·h = U` for `h ∈ H_x`, `U ∩ U·g = ∅` for `g ∉ H_x`); prove
`MulAction.IsGClean.smul_eq` (`U·h = U` for `h ∈ H_x`) and `MulAction.IsGClean.disjoint_smul`
(`U ∩ U·g = ∅` for `g ∉ H_x`) ([HJ] Definition (`G`-clean neighbourhood), unnumbered, in the
paragraph before Lemma 5.2, pp. 27–28). Prove `MulAction.exists_isGClean`: in a Hausdorff space every point has a `G`-clean
open neighbourhood inside each prescribed neighbourhood (*g-clean-neighbourhoods-exist*) ([HJ]
Lemma 5.2, p. 28); for a locally compact Hausdorff space this is Mathlib's
`ProperlyDiscontinuousSMul.exists_nhds_disjoint_image` (with the `[Finite G]` instance of
`ProperlyDiscontinuousSMul`: `∃ U ∈ 𝓝 x, ∀ γ, γ • x ≠ x → Disjoint (γ • U) U`), intersected over
the finite stabiliser to make `U` `H_x`-stable; the Hausdorff-only case proved here drops the
local compactness; when a locally spectral space is Hausdorff, it is locally compact. *Needs:* Mathlib
`MulAction.stabilizer`, `IsOpen`, `T2Space`, `t2_separation`,
`ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`.

**Checks.**

The clean-neighbourhood Check labels are set in italics. `Suggested.lean` proves the overlap
Check as an `example` after `MulAction.exists_isGClean`; the others, the trivial-action Check
among them, are README only.

- *isGClean_empty* (negative control) — the empty set is invariant and has disjoint
  translates, but is not a neighbourhood of `x`; the Lean predicate rejects it.
- *isGClean_overlap* (negative control) — if `g·x ≠ x` and `y, g·y ∈ U`, then `U` is not
  clean at `x`. The explicit real intervals below instantiate this obstruction.
- *isGClean_trivialAction* (degenerate) — for the trivial group every open neighbourhood of `x` is
  `G`-clean; for the trivial action of any `G` (`H_x = G`) likewise; for the discrete topology
  `{x}` is `G`-clean at `x`. The trivial-action clause reads: `U` is clean at `x` exactly when it
  is open and contains `x`. The discrete-topology clause is the Check
  *isGClean_discrete_singleton*.
- *isGClean_neg_real* (computation) — for `ℤ/2` acting on `ℝ` by `x ↦ −x`, `(1/2, 3/2)` is
  `G`-clean at `1` (trivial stabilizer; its translate is `(−3/2, −1/2)`, disjoint) and `(−1, 1)`
  is `G`-clean at `0` (stabilizer `G`; it is its own translate), while `(−1/2, 3/2)` is not
  `G`-clean at `1`: it meets its translate `(−3/2, 1/2)`.
- *isGClean_iff_injective* (auxiliary characterisation) — `U`, assumed open and containing `x`, is `G`-clean at `x` iff it is
  `H_x`-stable and `U ×^{H_x} G → X`, `(u, g) ↦ ug`, is injective (for a continuous action,
  its image `⋃_g Ug` is open): if `u' = uk ∈ U ∩ Uk` then `(u, k)` and `(u', 1)` have the same image, and
  injectivity forces `k ∈ H_x`.
- *not_isGClean_doubled_origin* (negative control) — on the quotient of `ℝ × {0,1}` identifying `(x,0)` with `(x,1)`
  exactly when `x ≠ 0`, with `ℤ/2` swapping the copies, no neighbourhood of one origin is `G`-clean: every
  neighbourhood contains a punctured interval `(−ε, 0) ∪ (0, ε)`, which its translate also
  contains. The Hausdorff hypothesis of *g-clean-neighbourhoods-exist* cannot be dropped.

The left-action form of the contracted product is *MulAction.cleanContracted*: its relation
identifies `(g,u)` with `(g h⁻¹,h·u)` for `h·x = x`. *cleanContractedMap_mk* fixes the map to `X`.
The equivalence *isGClean_iff_injective*, in the `MulAction` namespace, states the displayed
injectivity criterion, including stabilizer stability and the open-neighbourhood hypotheses.

- *cleanContracted_empty* — an empty input gives an empty contracted product.
- *cleanContracted_trivialAction* — the map is injective with image exactly `U`.
- *cleanContracted_singleton* — contraction of `{x}` maps bijectively onto the orbit of `x`,
  even when its stabilizer is nontrivial.

The restricted orbit relation `MulAction.subsetOrbitRel H W` is
`x ~ y ↔ ∃ h ∈ H, h • x = y`; it does not require `W` to be invariant.
*finite_quotient_chart* applies the stabilizer of the selected point, with the
G-clean neighbourhood of its image and the given open set containing its closure.
It identifies the quotient of their intersection with the quotient of its union
of translates, and gives the open map to the larger stabilizer quotient, with
both maps specified on point classes ([HJ] Theorem 5.3, pp. 28–29).

**Checks.** *subsetOrbitRel_trivial* gives equality for the trivial subgroup,
*subsetOrbitRel_empty* gives an empty quotient, and *subsetOrbitRel_two*
gives a singleton quotient for the transitive permutation action on two points.

Lean: `MulAction.IsGClean`, a structure whose fields `isOpen`, `mem`, `smul_eq` and
`disjoint_smul` are the four conditions (so `MulAction.IsGClean.smul_eq` and
`MulAction.IsGClean.disjoint_smul` are its projections), and `MulAction.exists_isGClean` for a
finite group acting continuously on a Hausdorff space. The contracted product, the restricted
orbit relation, *finite_quotient_chart* and their Checks are README only.

### P8.14 Zariski-closed embeddings

**Zariski-closed embeddings of perfectoid spaces and Zariski-open subsets.**
(*zariski-closed-embedding*) A map of perfectoid spaces `Z → X` is a Zariski-closed embedding if
for every open affinoid perfectoid `U ⊆ X` the base change `Z ×_X U → U` is a Zariski-closed
embedding of affinoid perfectoid spaces, i.e. a closed immersion ([ECD] Definition 5.6) whose image
is the vanishing locus of an ideal `I ⊆ O_X(U)` ([ECD] Definition 5.7(i)), which is then the
universal perfectoid space over that Zariski-closed subset ([Torsion] Lemma II.2.2) and
equivalently, by [ECD] 5.8, a strongly Zariski-closed immersion `Spa(S, S⁺) → U` with
`O_X(U) → S` surjective and `S⁺` the integral closure of `O_X⁺(U)`. The affinoid notion is that of
[P4.15](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness); its base change along any map of affinoid perfectoids is Zariski closed ([Torsion] Lemma
II.2.9(i)), and since the source leaves open whether the property can be checked on one affinoid
cover, the definition quantifies over all open affinoid perfectoids. An open `U ⊆ X` is Zariski
open if its complement `X ∖ U` is the image of a Zariski-closed embedding `Z → X` (`Z` is then
the universal perfectoid space over `X ∖ U`, so the structure on `X ∖ U` is determined by the
subset). Define
*PerfectoidSpace.IsZariskiClosedEmbedding* (the predicate on `Z → X`, quantified over the open
affinoid perfectoids of `X`) and *PerfectoidSpace.IsZariskiOpen* (an open subset whose complement
is the image of such an embedding); prove *PerfectoidSpace.IsZariskiClosedEmbedding.of_affinoid* (an
affinoid Zariski-closed immersion into an affinoid perfectoid is a Zariski-closed embedding).
Check *IsZariskiClosedEmbedding.base_change_affinoid* evaluates
*PerfectoidSpace.IsZariskiClosedEmbedding* at the chosen chart: for `U ⊆ X` open affinoid
perfectoid, `Z ×_X U → U` is strongly Zariski closed ([HJ] Definition 5.4 (1),(2), with the
caution paragraph after it, p. 29). *Needs:* [P4.15](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness); [P2.16](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces).

**Checks.**

- *isZariskiClosedEmbedding_id* (degenerate) — the identity of `X` (cut out by the zero ideal on
  every affinoid) and the empty subspace (cut out by the unit ideal; its ring is the zero ring)
  are Zariski-closed embeddings.
- *isZariskiClosedEmbedding_point* (computation) — for `K` perfectoid, the point `T = 0` of
  `Spa(K⟨T^{1/p^∞}⟩)` is the Zariski-closed embedding cut out by the ideal `(T^{1/p^n})_n`, with
  ring `K`; the ideal `(T)` has the same vanishing locus, and the universal perfectoid space over
  it is again `Spa(K)`, although `K⟨T^{1/p^∞}⟩/(T)` is not reduced.
- *isZariskiClosedEmbedding_affinoid_iff* (compatibility) — for `X` affinoid perfectoid, a map
  `Z → X` is a Zariski-closed embedding iff it is a (strongly) Zariski-closed immersion in the
  sense of [ECD] Definition 5.7.
- *not_isZariskiClosed_gauss_closure* (negative control) — in the perfectoid closed disc over
  `K`, a function vanishing at the Gauss point has Gauss norm `0`, so is `0`; the closure of the
  Gauss point, a closed subset, is therefore not the vanishing locus of an ideal (the only
  candidate ideal is `0`, whose locus is the whole disc): closed immersions of perfectoid spaces
  need not be Zariski closed.

The global predicate is expressed on [P2](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)'s `PerfectoidSpace.Perfd`, using every
`PerfectoidSpace.Chart`. The pullback over each chart must satisfy [P4](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness)'s
*PerfectoidSpace.IsStronglyZariskiClosed*; a single chosen cover is not substituted for that
quantifier. The empty-subspace Check is also named *isZariskiClosedEmbedding_empty*.

**Zariski-open Checks.** Each is stated as an example of *IsZariskiOpen*, with the
complement realized by an actual perfectoid space.

- *isZariskiOpen_empty* — the empty open has complement the identity closed embedding.
- *isZariskiOpen_whole* — the whole space has complement the empty closed embedding.
- *isZariskiOpen_punctured_disc* — the complement of the vanishing locus of `T` in the
  perfected disc is Zariski open; its closed complement is the perfectoid origin, not the
  nonreduced algebraic quotient by `(T)`.

Lean: README only.

### P8.15 analytically separated perfectoid spaces

Throughout this subsection and P8.17, `K` is a complete nontrivially normed
nonarchimedean field: its formal assumptions are `[NontriviallyNormedField K]`,
`[IsUltrametricDist K]`, and `[CompleteSpace K]`, together with `[IsTateRing K]`
for the Huber-pair API. *TowerGeometry.basePair* at `K` is `(K, K°)`.
The statements of *analyticSelfProduct*, *IsAnalyticallySeparated.inter_affinoid*,
and *perfectoid_finite_quotient* accept `P : Huber.Pair K`, defaulting to
`(TowerGeometry.basePair K).P`, so `K⁺` can also be a smaller ring of integral elements.
Being a field as an abstract ring and a complete Tate ring does not supply these
normed-field hypotheses.

**Analytically separated perfectoid spaces.** (*analytically-separated*) A perfectoid space `X`
over a nonarchimedean field `Spa(K, K⁺)` is analytically separated if the diagonal
`X → X ×_{Spa(K, K⁺)} X` is a Zariski-closed embedding; the fibre product over `Spa(K, K⁺)` is
perfectoid (for `K` not perfectoid, by the uniform completed tensor product of [P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)). The notion
is stronger than separatedness of `X^◇ → Spd(K, K⁺)` ([ECD] Definition 10.7, p. 51). Define
*PerfectoidSpace.IsAnalyticallySeparated* (the diagonal over `Spa(K, K⁺)` is a Zariski-closed
embedding); prove *PerfectoidSpace.IsAnalyticallySeparated.inter_affinoid* (intersections of two
open affinoid perfectoids are affinoid perfectoid) ([HJ] Definition 5.4 (1),(2), with the caution
paragraph after it, p. 29; Lemma 5.5(2), pp. 29–30).
*PerfectoidSpace.IsAnalyticallySeparated.closed_diagonal* gives the representable
closed-diagonal criterion for `X^◇ → Spd(K, K⁺)` to be separated as a map of v-sheaves
([ECD] Definition 10.7, p. 51), including when `K` is not perfectoid.
`PerfectoidSpace.IsAnalyticallySeparated.isSeparated` concludes PerfectoidSpaces P4
`IsSeparated` for a morphism `f : X → Y` of perfectoid spaces; for `Y = Spa(K, K⁺)` with
`K` perfectoid, this is the perfectoid-base clause of [HJ] Lemma 5.5(1), p. 29, in the sense
of [ECD] Definition 5.10, p. 25 (*analytically-separated-is-separated*).
*Needs:* *zariski-closed-embedding*; [P2.16](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P4.10](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness); [P4.19](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness).

**Checks.**

- *isAnalyticallySeparated_affinoid* (degenerate) — `Spa(K, K°)` for `K` perfectoid (its
  diagonal is the identity) and every affinoid perfectoid space `Spa(A, A⁺)` over any
  nonarchimedean `K` are analytically separated: `(A ⊗̂_K A)^u → A` is surjective, so the diagonal
  is strongly Zariski closed, with plus ring the integral closure of the image of
  `(A⁺ ⊗ A⁺)^{icl}`, which is `A⁺`.
- *isAnalyticallySeparated_projective_tower* (computation) — the perfectoid projective line
  `lim_{x ↦ x^p} ℙ¹` over `ℂ_p` is analytically separated (it is the limit of a tower of
  projective varieties). The theorem *PerfectoidSpace.projectiveLine_perfectoid_charts*
  gives two open perfected-disc charts on the tower selected by
  *goodTower_frobenius_P1*; they cover, their pullback is the perfected Laurent
  chart, and the two root coordinates multiply to one on the overlap. It also
  states analytic separation after the projective-tower separation theorem of P8.20
  ([Sch12] Theorem 8.5(ii), pp. 45–46;
  [HJ] Lemma 5.6, p. 30).
- *isAnalyticallySeparated_isSeparated* (auxiliary theorem application) — the perfectoid-field
  specialization: for `K : AffinoidField p` and `f : X → Spa(K, K⁺)`, analytic separation
  implies PerfectoidSpaces P4 `IsSeparated p f` ([ECD] Definition 5.10, p. 25).
- *not_isAnalyticallySeparated_nonseparated_gluing* (negative control) — glue two copies of the
  perfectoid closed disc `D = Spa(K⟨T^{1/p^∞}⟩)` along the rational subset `{|T| ≥ |ϖ|}`. The
  two charts meet in that affinoid, so the affinoid-intersection conclusion of
  *analytically-separated-affinoid-intersections* holds for them, but the rank-two point `w`
  with `w(T) = |ϖ|·γ`, `γ < 1` infinitesimal (the specialisation of the Gauss point of radius
  `|ϖ|` towards smaller radii) lies in the closure of the gluing locus and not in it, so it has
  two lifts and the diagonal is not closed: the space is not separated, hence not analytically
  separated. A definition asking only for affinoid intersections, or only for an injective
  diagonal, would accept it.

The carrier *AnalyticSelfProduct* records the self-product over an analytic base through
its universal property on perfectoid test spaces, as for the fibre product of diamonds.
*analyticSelfProduct* supplies it over the complete nonarchimedean field `(K, K⁺)`
by the uniform tensor construction ([HJ], paragraph before Definition 5.4, p. 29). *AnalyticSelfProduct.diagonal_fst_snd* specifies the
diagonal by its two identity composites. *IsAnalyticallySeparated* asks that this diagonal
be Zariski closed. This does not assert a limit on arbitrary nonreduced adic test spaces.

- *analyticSelfProduct_identity* — over `X` with structure map the identity, both projections
  of `X ×_X X` are isomorphisms.
- *analyticSelfProduct_empty* — an empty source has empty self-product.
- *analyticSelfProduct_affinoid* — over a perfectoid affinoid base the carrier agrees with
  [P2](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)'s `PairCat.tensorPair`, including its plus ring.
- *isAnalyticallySeparated_identity* — the identity morphism is analytically separated.

On perfectoid untilt test spaces, DiamondsAndVStacks D2.2 and D2.7 supply the v-precoverage
(PerfectoidSpaces P7 only restricts it to the test spaces), which asks that
quasicompact opens in the target be covered by finitely many images of quasicompact
opens in the sources. `vTopology` is the generated topology. Their Checks are
`vTopology_identity`, `vTopology_empty`, and `vTopology_nonempty`: identity covers,
the empty family covers the empty space, and it does not cover a nonempty space.
*adicVFunctor* sheafifies the restricted functor of points. For a fixed untilt, this
is the corresponding fibre of the diamond over Spd ℤ_p; morphisms preserve that untilt.
The Checks *adicVFunctor_identity*, *adicVFunctor_empty*, and *adicVFunctor_two_points*
test functorial identity, the empty target on nonempty tests, and the two-point target
on an algebraically closed field. The quotient comparison is compatible with these
fibres, so it identifies the quotient diamond. These untilt-site Checks are in
[PerfectoidSpaces P7](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers).
The P8 quotient statements use DiamondsAndVStacks’ `Geometry.vTopology` and
`PreAdic.geometricDiamond` directly, with `ULiftHom.up` on the analytic carrier.

Lean: README only.

### P8.16 finite quotients of separated rigid spaces

**Finite quotients of separated rigid spaces.** (*rigid-finite-quotient*) Let `X` be a separated
rigid analytic space over a complete nonarchimedean field `K` with a `K`-linear action of a finite
group `G`, such that for every rank-one point `x ∈ X` the closure of `{x}` lies in some open
affinoid `Spa(A, A°) ⊆ X` (true for `X` affinoid or partially proper; [HJ] v2, Theorem 5.3
and the paragraph after it, p. 28). Then the
categorical quotient `X/G = (|X|/G, (q_*O_X)^G, …)` is a rigid analytic space, `q : X → X/G` is
finite, and `X^◇/G → (X/G)^◇` is an isomorphism. No `G`-stable affinoid cover is assumed; one
exists a posteriori; no condition on `|G|` and no condition on the images of orbits in the
maximal Hausdorff quotient of `|X|` ([HJ] v2, Theorem 5.3 and its proof, pp. 28–29).

Prove the separation step on a quasicompact invariant open
(*clean-neighbourhood-on-invariant-qcqs-open*): let `X` be a quasi-separated analytic adic space
(rigid, or perfectoid with affinoid perfectoid intersections) with an action of a finite group
`G`, `x` a rank-one point with stabilizer `H`, and `V ⊆ X` an `H`-stable open affinoid containing
the closure of `{x}`. Put `Y = ⋃_{g∈G} V g`, a `G`-stable quasicompact open, and let
`π_Y : |Y| → |Y|^h` be the maximal Hausdorff quotient. Then for every `G`-clean neighbourhood
`U ⊆ |Y|^h` of `π_Y(x)` the open `π_Y^{-1}(U) ⊆ X` contains the closure of `{x}` and is `G`-clean at
`x`. *Proof sketch.* `Y` is quasicompact, and quasi-separated because `X` is, so `|Y|` is taut ([Hub96] §5.1);
for taut `|Y|` the maximal Hausdorff quotient is injective on rank-one points ([HJ] v2,
footnote 7, p. 28, via [Hub96] Lemmas 5.3.4 and 8.1.5). Distinct points `x ≠ xg` of the orbit are
rank one, so `π_Y(x) ≠ π_Y(xg)` and `Stab(π_Y(x)) = H`; `G`-cleanness of `U` then pulls back along the
equivariant `π_Y`, and the closure of `{x}` maps to the point `π_Y(x)` of the Hausdorff space
`|Y|^h`. Working on `X` itself would not do: if `|X|` is not taut, `π_X` may identify `x` with
`xg`, the stabilizer of `π_X(x)` is then larger than `H`, and `π_X^{-1}(U)` is stable under
elements that move `x`. *Needs:* *g-clean-neighbourhood*; *g-clean-neighbourhoods-exist*;
Mathlib `T2Quotient`; AdicSpacesPartII layer R0 (affinoid intersections in a separated space).

Prove the chart lemma: for `X`, `x`, `H`, `V` and `Y` as above with affinoid quotient `V/H`,
`U ⊆ |Y|^h` a `G`-clean neighbourhood of `π_Y(x)` and `W = π_Y^{-1}(U) ∩ V`: `W` is a
`G`-clean neighbourhood of the closure of `{x}`, `W ×^H G ⊆ X` is a `G`-stable open,
`(W ×^H G)/G ≅ W/H` is open in `V/H`, and `W ×^H G → (W ×^H G)/G` pulls back to
`⊔_i W g_i → W/H`, `(w g_i) ↦ [w]`
(*finite-quotient-chart*) ([HJ] v2, proof of Theorem 5.3, pp. 28–29, with the Hausdorff
quotient of `Y` in place of that of `X`). *Needs:* *clean-neighbourhood-on-invariant-qcqs-open*;
*rational-invariants-affinoid-algebra*; *rigid-quotient-invariant-cover*;
*quotient-diamond-comparison*; *categorical-quotient*; *g-clean-neighbourhood*;
AdicSpacesPartII layer R0; Mathlib `T2Quotient`.

**Checks.**

- *clean-neighbourhood-on-invariant-qcqs-open*, two disjoint discs (computation) — `G = ℤ/2`
  swapping two disjoint closed unit discs over `K`, `x` the Gauss point of the first: `H = 1`,
  `Y` is the whole space, `π_Y(x) ≠ π_Y(xσ)`, and the first disc is a clean neighbourhood.
- *clean-neighbourhood-on-invariant-qcqs-open*, trivial action (degenerate) — `H = G`, `Y = V`,
  and `W = π_Y^{-1}(U) ∩ V` is `G`-stable for every neighbourhood `U` of `π_Y(x)`.
- *clean-neighbourhood-on-invariant-qcqs-open*, growing stabilizer (negative control) — for
  `G = ℤ/2` acting on a two-point orbit `{x, xσ}` and any `G`-equivariant map `π` to a space where
  `π(x) = π(xσ)`, the stabilizer grows from `1` to `ℤ/2`; `π^{-1}(U)` of a clean `U` contains both
  orbit points and is not clean at `x`. Injectivity of `π_Y` on rank-one points is what excludes this.

The rigid invariant-cover statement assumes R0’s
`AdicSpace.IsSeparated f` for the structural morphism to `Spa(K, K°)`,
along with analyticity, local finite type and the closure-chart condition. It concludes
that every point has a `G`-stable affinoid neighbourhood, using the argument of [HJ] v2,
Theorem 5.3, pp. 28–29, with *clean-neighbourhood-on-invariant-qcqs-open* in place of the
Hausdorff quotient of `X`.

Lean: README only.

### P8.17 finite quotients of analytically separated perfectoid spaces

The next two subsections prove the finite-quotient theorem for analytically separated perfectoid
spaces and the perfectoidization of integral extensions that feeds the tower lemmas.

**Finite quotients of analytically separated perfectoid spaces.** (*perfectoid-finite-quotient*)
Let `X` be an analytically separated perfectoid space over `Spa(K, K⁺)`, with `K`
a complete nontrivially normed nonarchimedean field and `K⁺` encoded by the pair `P`
as in P8.15, with an action of a finite group `G` by automorphisms over `Spa(K, K⁺)`, such that for every
rank-one point `x ∈ X` the closure of `{x}` is contained in an open affinoid perfectoid subspace
`Spa(A, A⁺) ⊆ X` (the hypotheses of [HJ] v2, Theorem 5.8, p. 30). Then the categorical
quotient `X/G` is a perfectoid space, covered by opens `W_x/H_x` of the affinoid perfectoids
`V_x/H_x = Spa(A^{H_x}, A^{+H_x})`, and `X^◇/G → (X/G)^◇` is an isomorphism. No hypothesis on
`|G|` is needed: apply *affinoid-perfectoid-quotient* to the stabilizer actions on the charts
([HJ] v2, Theorem 5.8 and its proof, pp. 30–31; the clean charts come from
*clean-neighbourhood-on-invariant-qcqs-open*, whose quasi-separation input is
*analytically-separated-affinoid-intersections*). Prove that in an analytically separated space the intersection of two open affinoid
perfectoids is affinoid perfectoid (*analytically-separated-affinoid-intersections*) ([HJ] Lemma
5.5(2), pp. 29–30); that every `y ∈ X/G` has a neighbourhood basis of open affinoid perfectoids `Y` with
`q^{-1}(Y)` affinoid perfectoid, so `X` has a `G`-stable affinoid perfectoid cover
(*perfectoid-quotient-map-is-weakly-affinoid*) ([HJ] Theorem 5.8, p. 30); and that a spatial
diamond with an action of a profinite group `G` having finitely many orbits on `π₀` and perfectoid
connected components is perfectoid (*perfectoid-from-perfectoid-components*) ([HJ] Lemma 5.1,
p. 27). *Needs:* *clean-neighbourhood-on-invariant-qcqs-open*; *finite-quotient-chart*;
*affinoid-perfectoid-quotient*;
*quotient-diamond-comparison*; *analytically-separated*; [P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent); DiamondsAndVStacks layer D5.

The carrier *SpatialPresentation* uses DiamondsAndVStacks’ `Perf.Diamond.Presentation`
with `Perf.Diamond.IsSpatial`; `Geometry.realized` supplies its spectral point space
and `Perf.Diamond.spaceι` evaluates sections naturally on perfectoid test spaces. The component criterion requires
a profinite action with finitely many orbits of connected components and a
perfectoid representative of each component, including its image on every test
object. These are the spatial hypotheses in [HJ] Lemma 5.1, p. 27.

**Checks.** *SpatialPresentation_affinoid* recovers the affinoid point space,
*SpatialPresentation_empty* gives the empty space, and
*SpatialPresentation_noncompact* excludes a noncompact point space.

Lean: README only.

### P8.18 perfectoidization of integral extensions

**Perfectoidization of an integral extension of a perfectoid ring.**
(*integral-extension-of-perfectoid-pair*) Let `R⁺` be an integral perfectoid ring ([P1.24](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts)) and
`R⁺ → S⁺` an integral ring map. Then there is an initial integral perfectoid ring `S⁺_perfd` under
`S⁺` (for every integral perfectoid `A`, maps `S⁺_perfd → A` correspond to maps `S⁺ → A`), and the
`p`-adic completion `S⁺^∧_p` has the same perfectoidization, so `S⁺_perfd` is the universal
integral perfectoid ring under the `p`-complete `R⁺`-algebra `S⁺^∧_p` (the integrality
hypothesis is on `R⁺ → S⁺`; the completion need not remain integral over `R⁺`: for
`R⁺ = O_{ℂ_p}` and `S⁺ = LC(ℤ_p, O_{ℂ_p})`, integral because a locally constant function has
finite image and is killed by `∏ (T − a)` over it, the completion `C(ℤ_p, O_{ℂ_p})` contains
`x ↦ x`, which is not integral over the constants since a monic polynomial over `O_{ℂ_p}` has
finitely many roots in `ℂ_p`; the factorisation of maps through the completion uses only
completeness of the target, and no integral-extension instance on `S⁺^∧_p` is inferred). Moreover, for
`ϖ ∈ R⁺` a pseudouniformizer with compatible roots, `T := (S⁺_perfd)^∧_ϖ[1/ϖ]` is a perfectoid Tate
ring and, with `T⁺` the integral closure of `(S⁺_perfd)^∧_ϖ` in `T`, the integral model `S⁺` has
the following universal property: the map `S⁺ → T⁺` is initial among ring maps `S⁺ → A⁺` into the
plus ring of a perfectoid Tate pair `(A, A⁺)` sending `ϖ` to a pseudouniformizer of `A`, and each
such map extends uniquely to a continuous pair map `(T, T⁺) → (A, A⁺)`. The integral model need not
define a Huber pair `(S⁺[1/ϖ], S⁺)`: for `R⁺ = O_{ℂ_p}` and `S⁺ = R⁺[ε]/(ε²)`, `ε/ϖ ∈ S⁺[1/ϖ]` is
integral over `S⁺` (its square is zero) but does not lie in `S⁺`, and with `ϖ`-torsion in `S⁺`
the localization map is not injective; an actual source pair, when one is wanted, is the image of
`S⁺` in `S⁺[1/ϖ]` and its integral closure there. (This universality is
not in [BS22], which gives it only for semiperfectoid quotients in Remark 7.5; it is derived here
from the integral universality: a map `S⁺ → A⁺` into the plus ring of a perfectoid Tate pair,
which is integral perfectoid and `ϖ`-adically complete, factors uniquely through
`(S⁺_perfd)^∧_ϖ`, and `T⁺ → A⁺` follows because `A⁺` is integrally closed.) `T` may be the zero
ring: for `S⁺ = R⁺/ϖ` every `ϖ^{1/p^n}` dies in `S⁺_perfd`, `T = 0`, and every map `S⁺ → A⁺` sending
`ϖ` to a pseudouniformizer has target the zero pair (whose element `0 = 1` is a topologically
nilpotent unit, as in *isTateAffinoid_zero*), since `ϖ = 0` in `S⁺` is sent to a unit; there is no
such map to a nonzero perfectoid Tate pair; for `S⁺ = R⁺`, `T = R`. In characteristic `p`, `S⁺_perfd` is the uncompleted perfection
and the `ϖ`-adic completion is necessary ([BS22] §1, Theorem 1.17(1), p. 9; §10, Theorem 10.11,
p. 82; §8, Corollary 8.14, p. 70). Prove that for a map `(R, R⁺) → (S, S⁺)` of Tate–Huber pairs
with `R` perfectoid and `R⁺ → S⁺` integral, `Spd(S, S⁺) ≅ Spa(T, T⁺)^◇` is represented by an affinoid perfectoid space,
`Hom((T, T⁺), (A, A⁺)) = Hom((S, S⁺), (A, A⁺))` for every perfectoid Tate–Huber pair `(A, A⁺)`
([HJ] Lemma 5.10, p. 32); and that for a morphism `(X_i) → (Y_i)` of cofiltered inverse systems
of locally noetherian adic spaces with all `f_i` and transition maps finite and `Y_∞ = lim Y_i^◇`
perfectoid, `X_∞ = lim X_i^◇` is perfectoid, `f_∞` is quasicompact and affinoid in the weak sense,
and `f_∞^{-1}(U)` is affinoid perfectoid for every open affinoid perfectoid `U ⊆ Y_∞` pulled back
from an open affinoid `U_i ⊆ Y_i` (*finite-tower-over-perfectoid-tower*) ([HJ] Lemma 5.9, pp. 31–32). *Needs:* [P1.24](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts); [*perfectoid-tate-ring-from-integral-perfectoid*](../PerfectoidSpaces/README.md);
[P4.15](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness); [P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent); AdicSpacesPartII layer R0.

The integral input carrier is *Perfectoid.IntegralExtension*: an integral ring map from an
integral perfectoid ring. Its construction `perfectoidization`, map `ι` and theorem `universal`
specify initiality against every integral perfectoid ring. *charPEquiv_ι* identifies the
characteristic-`p` structural map with `PerfectClosure.of`, using the direct perfection.
`padicι`, *padicι_comp* and *padic_universal* state the same initiality after `p`-adic
completion, with the structural map fixed on the original ring.
The completed ring is `AdicCompletion` at the image of `(ϖ)`, and *genericRing* is its
`Localization.Away`. *genericPlus* is the integral closure of the completed ring's image.
For a compatible-root parameter `t`, with `t₀^p ∣ p` and the base `t₀`-adically complete,
*genericPair*, *genericPairEquiv*, *genericPair_plus*, *toGenericPair* and
*genericPair_universal* specify the perfectoid pair. The last theorem extends an integral
map to a perfectoid pair when the parameter maps to a pseudouniformizer; its factorization
is unique among continuous pair maps.

**Checks.**

- *integralExtension_identity* — perfectoidization of the identity integral extension has
  bijective structural map.
- *integralExtension_zero* — perfectoidization of the zero algebra is zero.
- *integralExtension_char_p* — the kernel consists exactly of nilpotents, and every element
  of the perfection has a `p^n`-th power in the original algebra.
- *integralGeneric_identity*, *integralGenericPair_identity* — for a complete integral model
  the generic ring is its localization; for the plus ring of a perfectoid pair the result
  is that same pair, with the map fixed on integral elements.
- *integralGeneric_killed*, *integralGenericPair_killed* — if the image of the parameter is
  nilpotent, inversion after completion gives the zero ring and the empty perfectoid spectrum.
- *integralGeneric_char_p*, *integralGenericPair_char_p* — in characteristic `p`, completion
  and inversion of the perfected integral ring still give a perfect ring.

- *integralPadic_identity* — the identity perfectoid algebra has bijective completed
  structural map.
- *integralPadic_zero* — completion of the zero integral algebra is zero.
- *integralPadic_char_p* — in characteristic `p`, `p`-adic completion is the original ring.
- *padicι_char_p_value* — after *charPEquiv*, the completed structural map sends the
  image of `a` to `PerfectClosure.of a`.
- *padicι_zero* — for the zero integral algebra, `padicι` is the bijection between zero rings.
- *padicι_nilpotent* — a nonzero nilpotent in characteristic `p` survives completion
  but maps to zero under `padicι`, so this map is not injective.
- *genericPlus_image* — every completed integral element maps into *genericPlus*.
- *genericPlus_square_root* — if `x²` is the image of a completed integral element,
  then `x` belongs to *genericPlus*, by its monic quadratic equation.
- *genericPlus_killed* — a nilpotent image of the parameter gives the zero generic
  ring, whose *genericPlus* is the whole ring and has one element.
- *genericPlus_inverse_parameter* — if the completed ring is a domain and the
  completed parameter is a nonzero nonunit, its inverse in the generic ring does
  not belong to *genericPlus*: integrality of that inverse would make the
  parameter a unit. These Checks use the completion and perfectoidization of
  [BS22] Theorem 1.17(1), p. 9, and Theorem 10.11, p. 82, together with the
  defining monic-polynomial criterion for integral closure.

*integral-extension-of-perfectoid-pair* states the [HJ] Lemma 5.10, p. 32 comparison on all affinoid
perfectoid test pairs, with unique factorization by a continuous pair map. The uniqueness
makes the comparison natural in the test pair, specifying the represented `Spd` functor.
*finite-tower-over-perfectoid-tower*, for locally noetherian analytic levels, states the
represented limit, R0’s `AdicSpace.QuasiCompact` for its limit map `g` between the
adic representatives given by *PerfectoidSpace.locallyStronglySheafy* (equivalently, for `g`
read in `TauCeti.AdicSpace` through the inclusion `toAdicSpace`), and the affinoid pullback comparison for every chart
descending to a finite level ([HJ] Lemma 5.9, pp. 31–32).
The statement of *finite-tower-over-perfectoid-tower* imposes `IsOverZp` on the levels of both
towers, in accordance with [HJ] p. 27.

Lean: README only. *perfectoidization-of-integral-extension* (an initial integral perfectoid ring
under `S⁺` for an integral map out of an integral perfectoid ring) needs PerfectoidSpaces'
`Perfectoid.IsIntegralPerfectoid`, and *integral-extension-of-perfectoid-pair* (a perfectoid Tate
pair under `(S, S⁺)` through which every map to a perfectoid Tate pair factors uniquely by a
continuous map preserving plus rings) needs its `Perfectoid.IsPerfectoidTateRing`; neither
predicate is in the pinned libraries. The carrier *Perfectoid.IntegralExtension* with its
`p`-adic and generic pairs, *finite-tower-over-perfectoid-tower* and the Checks are specified
here.

### P8.19 good towers

The next two subsections define good towers and prove that their limits have perfectoid finite
quotients.

**Good towers.** (*good-tower*) Fix a nonarchimedean field `K`. A good tower is a cofiltered
inverse system `(X_i)_{i∈I}` of locally noetherian adic spaces over `Spa K` such that (1) each
`X_i` is the analytification of a projective variety over `K` and the transition maps are finite;
(2) `X = lim_i X_i^◇` is a perfectoid space; (3) there are two coverings of `X` by open affinoid
perfectoid subsets `U_j, V_j` with the closure of `U_j` contained in `V_j` for all `j`, and
`U_j, V_j` the preimages of open affinoids `U_{j,i_j}, V_{j,i_j} ⊆ X_{i_j}` for some `i_j ∈ I`.
Condition (3) gives the closure hypothesis of *perfectoid-finite-quotient*. Define *PerfectoidSpace.GoodTower* (the structure:
projective analytifications, finite transitions, perfectoid limit, paired finite-level affinoid
covers with closures) and *PerfectoidSpace.GoodTower.limit* (the perfectoid space
`X = lim X_i^◇`); prove *PerfectoidSpace.GoodTower.isAnalyticallySeparated* (the limit is
analytically separated) ([HJ] Definition 5.12, pp. 32–33, and Lemma 5.6, p. 30).
PerfectoidSpaces P7.11 supplies `VQuotient.represented_limit_affinoid_basis`: for a cofiltered
system of locally noetherian analytic levels with finite transitions and a represented
perfectoid limit, finite-level affinoid preimages which are affinoid perfectoid form a
neighbourhood basis. The local *finite_level_affinoid_basis* (*finite-level-affinoid-basis*)
adapts this supplier to the diamond-limit cone through DiamondsAndVStacks D6.4, retaining
the finite-transition and `TowerGeometry.IsOverZp` hypotheses ([HJ] Lemma 5.11, p. 32).
GoodTower construction consumes this supplied basis. Prove that a
tower mapping by finite maps `f_i` to a good tower (with finite transition maps) is good
(*good-towers-under-finite-maps*) ([HJ] Proposition 5.13(1), p. 33).
*Needs for the carriers and finite-level affinoid adapter:* *analytically-separated*;
PerfectoidSpaces [P7.11](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers),
`VQuotient.represented_limit_affinoid_basis`; DiamondsAndVStacks D6.4;
[P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent); AdicSpacesPartII layer R1; Tau Ceti
`TauCeti.ValuationSpectrum.rationalSubset`.
*Needs for *GoodTower.isAnalyticallySeparated* and the projective-line separation output:*
*projective-tower-limit-is-analytically-separated*. *Needs for *GoodTower.of_finite*:*
*finite-tower-over-perfectoid-tower*; PerfectoidSpaces P7.11's
`VQuotient.represented_limit_affinoid_basis` through the local adapter;
AdicSpacesPartIII R3.7 (*gaga-finite-covers*), specifically
`AdicSpace.analytification_finiteCover_algebraization`,
`AdicSpace.analytification_finiteCover_hom`, and
`AdicSpace.analytification_finiteCover_projective`. Algebraize each finite map into a
projective level. For a transition, base change the algebraized finite cover at its target
to the source level of the good tower and apply the Hom comparison there; its uniqueness
retains the transition identities and commuting squares. AdicSpacesPartII R1's
*analytification-reflects-finite-closed-immersion* retains finiteness of these transitions.

**Checks.**

- *goodTower_const_point* (degenerate) — for `K` perfectoid, the constant tower `X_i = Spa(K)` is
  good, with `U = V = Spa(K)` (a point is projective, the identity is finite); the constant tower
  `X_i = ℙ¹_K` in mixed characteristic is not good, because its diamond is not representable
  by a perfectoid space. For a single locally noetherian projective level `X₀` over a complete
  nonarchimedean field `K` with topologically nilpotent `p`,
  *PerfectoidSpace.goodTower_single_level_iff* states that the tower is good iff `X₀^◇` is
  representable by a perfectoid space; its statement gives the unique factorization
  property on `Perfd p` used by *GoodTower.represents*
  ([HJ] Definition 5.12, pp. 32–33, and Lemma 5.11, p. 32).
  For perfectoid `K`, this holds, for example, when `(X₀)_red` is a finite disjoint union of
  `Spa(L)` with `L/K` finite. In particular, `X₀ = Spa(K[ε]/(ε²))` is a projective level
  whose diamond is represented by `Spa(K)` ([HJ] Lemma 5.10, p. 32): maps from perfectoid tests kill `ε`, since
  perfectoid rings are reduced ([P1.1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts)). The preimages of `U₀ = V₀ = X₀` give condition (3).
  The level itself is not perfectoid; its nonzero nilpotent prevents uniformity
  ([ECD] Definition 3.1, p. 14).
- *goodTower_const_P1_charP_not_tildeLimit* (negative control) — for a complete
  nontrivially normed perfectoid field `K` of characteristic `p`, the single-level
  tower `ℙ¹_K` is good, with represented limit its completed perfection. One can take
  `K` to be the completed perfection of `𝔽_p((t))`; here `p = 0` is topologically
  nilpotent. Perfectoid test maps lift uniquely through perfection. For a
  pseudouniformizer `ϖ`, the discs `{|T| ≤ 1} ⊂ {|T| ≤ |ϖ|⁻¹}` and their
  reciprocal-coordinate counterparts supply the cover with closure containment,
  pulled back from the single projective level. Nevertheless `HasDenseCharts` fails:
  on a perfected disc, the finite-level analytic functions lie in the closed
  subring with integral exponents, which misses `T^(1/p)`. The same obstruction
  persists on neighborhoods of its Gauss point, so no affinoid cover can satisfy
  density. The Check asserts both failure of density and failure of
  `IsTildeLimit` for this good tower on the polynomial `Proj` carrier
  ([HJ] Definition 5.12(2), pp. 32–33; [SW13] Definition 2.4.1, pp. 19–20,
  and Proposition 2.4.5, pp. 20–21).
- *goodTower_frobenius_P1* (auxiliary computation) — the tower `ℙ¹_{ℂ_p} ← ℙ¹ ← ⋯` with transition maps
  `T ↦ T^p` is a good tower with limit the perfectoid projective line; the standard discs
  `{|T| ≤ 1}`, `{|T| ≥ 1}` and their slight enlargements `{|T| ≤ |p|^{-1}}`, `{|T| ≥ |p|}` give
  (3): the closure of `{|T| ≤ 1}` adds only the rank-two point at the Gauss point of radius `1`
  in the direction `∞`, which has `|T| = 1·γ` with `γ > 1` infinitesimal, so `|T| < |p|^{-1}`.
  *PerfectoidSpace.goodTower_frobenius_P1* states existence of this good tower, with
  every level identified over `K` with polynomial `Proj` and every successor transition
  identified with the scheme map whose restriction to `[1:T]` is `T ↦ T^p`
  ([Sch12] §8, Theorem 8.5(ii), pp. 45–46; [HJ] Definition 5.12, pp. 32–33).
- *goodTower_isAnalyticallySeparated* (compatibility) — the limit of a good tower is analytically
  separated, by *projective-tower-limit-is-analytically-separated*.
- *not_goodTower_affine_line* (negative control) — the tower over `ℂ_p` of affine lines `𝔸¹ ← 𝔸¹ ← ⋯` with
  `T ↦ T^p` satisfies (2) (limit the perfectoid affine line) and (3), with
  `U_n = {|T| ≤ |p|^{−n}}` and `V_n = {|T| ≤ |p|^{−n−1}}` pulled back from level `0`, but it is
  not good, because the `X_i` are not projective: condition (1) is a genuine restriction.

*GoodTower* records the diagram over the field, projective levels with their closed
embeddings into polynomial `Proj`, finite transition maps, and the represented perfectoid
limit on perfectoid test spaces. Both affinoid covers have specified finite-level preimages,
and the smaller chart's closure lies in the larger chart. Check *GoodTower.universal*
applies *GoodTower.represents* to a cone on a perfectoid test space; this universal property
is part of the represented-limit data ([HJ] Definition 5.12(2), pp. 32–33).
*GoodTower.homeomorph* identifies the cone point's underlying space with the compatible
families of finite-level points, with coordinate maps equal to the cone projections.
It applies to good towers indexed by a small cofiltered category: finite transitions
are qcqs and the diamonds of the
locally noetherian analytic levels are locally spatial ([ECD] Lemma 11.22, p. 63).
*GoodTower.isTildeLimit* gives the full comparison of
[P7](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers)
only under the additional hypothesis `AdicSpace.HasDenseCharts T.diagram T.cone`.
That hypothesis is density of finite-level functions on an affinoid covering, as in
[SW13] Definition 2.4.1, pp. 19–20. Representability on perfectoid tests in
[HJ] Definition 5.12(2) does not imply it; [SW13] Proposition 2.4.5, pp. 20–21,
establishes the implication from a perfectoid tilde-limit to representation.
*GoodTower.of_finite* names the finite-map theorem; *finite_level_affinoid_basis* is the
adapter to PerfectoidSpaces P7.11's supplied basis theorem.

*TowerGeometry.Analytification* expresses analytification in the supplied Yoneda-adic
category by its natural mapping equivalence on **sheafy** complete affinoid test pairs
`(R, hR : R.Sheafy)` over `(K,K°)`. Naturality requires both test pairs to be sheafy.
Its *adicRealization* requires the space to come from an actual adic space, so the tests
characterize a geometric object. *Analytification.exists_of_locallyOfFiniteType* gives
existence for schemes locally of finite type over the complete nonarchimedean field `K`
([Wedhorn] Proposition 8.61 and Definition 8.64, pp. 91–92);
*Analytification.rigid_comparison*, under that same finite-type hypothesis, identifies
any such analytification with the image of AdicSpacesPartII R1's
`RigidSpace.analytification` under `AdicSpace.rigidToAdic` and
`YonedaAdicSpace.ofAdicSpace` ([Wedhorn] Remark 10.1, p. 103;
[Sch12] Theorem 2.21, p. 12).
These are comparison targets on this roadmap's carrier, with R1 supplying the construction.
Non-sheafy pairs are excluded: the structure presheaf can fail rational descent even for
complete Tate rings ([HK] Remark 3.19, p. 9); the Yoneda sheaf's value there need not be the
ring itself. *TowerGeometry.ProjectiveLevel* includes a finite-type scheme over `K`, a closed
embedding in `Proj K[X₀,…,X_n]`, and its analytification. `TowerGeometry.IsFinite` tests every
open target affinoid using an actual pullback and the supplied `Pair.Hom.IsFinite`, including
the integral plus-ring condition.

**Further Checks.**

- *goodTower_empty* — the constant empty projective variety has empty perfectoid limit;
  both covers can be empty.
- *goodTower_two_points* — the constant two-point projective variety has limit
  `Spa(K × K, K° × K°)`, with two points for the maximal-plus field pair.
- *goodTower_closure_cover* — every point's closure lies in an affinoid chart, by choosing
  a smaller chart through the point and its paired larger chart.
- *analytification_point*, *analytification_empty*, *analytification_affine_line* — the point
  has identity structural map, the empty scheme has empty analytification, and maps from
  `Spa(R)` to the affine line over `K` are parametrized by all elements of `R` when `R.Sheafy`.
- *Analytification_nonsheafy_test_not* (auxiliary; not counted for definitions) — a
  complete Tate pair failing `R.Sheafy` exists ([HK] Remark 3.19, p. 9). This checks
  existence of such pairs, not the behavior of *Analytification.homEquiv*; that field
  requires a proof of `R.Sheafy` and imposes no mapping equivalence at a non-sheafy pair.
- *projectiveLevel_point*, *projectiveLevel_empty*, *projectiveLevel_affine_line_not* — a point
  and the empty scheme admit projective presentations; the affine line does not.
- *projectiveLevel_P1* — the polynomial projective line admits a *ProjectiveLevel*,
  giving a positive-dimensional instance over every complete nonarchimedean field `K`.
- *projectiveLineChart_range*, *projectiveLineChart_over_base*,
  *projectiveLineChart_zero_ne_one* — the chart `T ↦ [1:T]` has image `D₊(X₀)`,
  commutes with the structural map to `Spec K`, and sends `0` and `1` to distinct points.
- *finiteMap_identity*, *finiteMap_affinoid*, *finiteMap_nonclosed_not* — identity is finite;
  an affinoid map supplied by `Pair.Hom.IsFinite` is finite globally; a map with nonclosed
  image is not finite.

The auxiliary *goodTower_frobenius_P1* example applies the existence theorem on
*GoodTower* over `ℂ_p`; it is not an independent definition Check. The tower is
indexed by `ℕᵒᵖ`; its displayed chart equation fixes the homogeneous `p`-power map.
The represented limit is the perfectoid projective line, obtained by gluing the two
completed root-coordinate discs ([Sch12] §8, pp. 45–46). The
*not_goodTower_affine_line* Check excludes a tower all of whose projective
presentations would be affine lines. The constant-point, empty and two-point Checks
retain the zero-dimensional cases.

Lean: README only.

### P8.20 finite quotients of good towers

**Finite quotients of good towers.** (*quotient-of-good-tower*) Let `(X_i)_{i∈I}` be a good
tower over a complete nontrivially normed ultrametric field `K` with topologically nilpotent `p`,
with an action of a finite group `G` over `K` (compatible actions on the `X_i`). Then the categorical
quotient `X/G` of `X = lim X_i^◇` is a perfectoid space, and `X/G ≅ lim_i X_i/G` as diamonds, where
`X_i/G` are the rigid quotients (projective varieties, since `X_i/G` is the analytification of the
projective quotient variety). The conclusion asserts conditions (1) and (2) of a good tower
for `(X_i/G)` ([HJ] Proposition 5.13(2), v2 pp. 33–34).
*GoodTower.quotient* takes actions `ρi i : G →* Aut (T.diagram.obj i)` over `K`,
equivariant transition maps, and an action `ρ` on the limit of `T` whose projections are
equivariant. It produces a quotient diagram `D`, projective presentations
`L i` in *TowerGeometry.ProjectiveLevel* over `K`, and a natural transformation `η : T.diagram ⟶ D`
whose components are finite categorical quotient maps over `K`. The transitions of `D`
are finite and over `K`; each level is locally noetherian. The perfectoid quotient `q : X → Y`
commutes with the finite-level quotient maps and the projections of a cone `c` with vertex `Y`.
The theorem asserts
`IsLimit ((ULiftHom.up ⋙ DiamondsAndVStacks.PreAdic.geometricDiamond p).mapCone c)`,
giving the canonical identification of the v-sheaf of `Y` with `lim_i Y_i^◇`.
It also gives the categorical quotient property of `q^◇` for the induced
`G`-action, as well as the quotient in valued ringed spaces and the affinoid pullback
neighbourhood basis. No closure-cover condition for the quotient tower is asserted.
The v-site and diamond functor are supplied by DiamondsAndVStacks; the untilt-site
comparison of P8.15 is over `Spd Z_p`.

**Checks.** *goodTower_quotient_trivial* applies *GoodTower.quotient* to `PUnit`
with identity actions. Its output map `q` is an isomorphism, and its output diagram
has an isomorphism `e : D ≅ T.diagram` with `η = e.inv`; the quotient cone retains
both projection compatibility and the v-sheaf limit property.
*goodTower_quotient_empty* applies *GoodTower.quotient* to compatible actions of any
finite group on a tower with an empty finite level. Both the original perfectoid
limit and the output quotient `Y` are empty. Each empty original level has an empty
quotient level, so an entirely empty tower has an entirely empty quotient tower.
The check retains the valued-ringed-space quotient presentation of `q`, projection
compatibility and the v-sheaf limit property ([HJ] Proposition 5.13(2), pp. 33–34).
*goodTower_quotient_incompatible* is an auxiliary check of the compatibility
hypothesis: a disagreement at one projection excludes a compatible cone action.

Prove that a cofiltered inverse system of separated rigid spaces over
`Spa(K, K°)`, each an open subspace of the analytification of a projective variety, with
perfectoid limit `X_∞ = lim X_i^◇`, has `X_∞` analytically separated
(*projective-tower-limit-is-analytically-separated*) ([HJ] Lemma 5.6, p. 30).
*Needs for the quotient-of-good-tower target:* *good-tower*;
*perfectoid-finite-quotient*; *rigid-finite-quotient*; *quotient-diamond-comparison*.
*Needs for projective-tower separation:* *analytically-separated*;
P8.19's *TowerGeometry.ProjectiveLevel* and analytification carriers;
P8.21's *closed-subvariety-pullback-is-zariski-closed* and
*limit-of-zariski-closed-embeddings*; DiamondsAndVStacks D6.4 (diamondification).
This separation theorem precedes the separation outputs for GoodTower and the
projective line and requires no finite quotient theorem.

*projective_tower_limit_is_analytically_separated* states the result for arbitrary open
immersions into projective analytifications, with the represented limit and maps over `K`
explicit. *IsAnalyticallySeparated.closed_diagonal* states the closed-diagonal conclusion
also over a nonperfectoid analytic base. The concrete Frobenius projective-line instance
uses the two-chart construction specified above.

Lean: README only.

### P8.21 Zariski-closed loci in perfectoid towers

**Zariski-closed loci of perfectoid towers and their tilde-limit comparison.**
(*closed-loci-in-towers*) Let `(Y_i)_{i∈I}` be a cofiltered inverse system of analytifications of
quasi-projective varieties over a nonarchimedean field `K` with finite transition maps and
perfectoid limit `Y = lim_i Y_i^◇`, `Y ~ lim Y_i`; let `X_i ⊆ Y_i` be compatible closed
subvarieties (`X_j ⊆ X_i ×_{Y_i} Y_j` for `j ≥ i`). Then `X = lim_i X_i^◇` is a perfectoid space,
`X → Y` is a Zariski-closed embedding, and `X ~ lim X_i`. Explicitly, for an open affinoid
perfectoid `V = Spa(R, R⁺) ⊆ Y` pulled back from finite level, `X ∩ V = Spa(S, S⁺)` is strongly
Zariski closed: `R → S` is surjective, `S⁺` is the integral closure of the image of `R⁺`,
`R⁺ → S⁺` is almost surjective (for the ideal `(ϖ^{1/p^∞})R⁺`, `ϖ` a pseudouniformizer of `R` with
compatible `p`-power roots), and the image of `lim→ O(X_i ∩ V_i)` is dense in `S`. This is a
perfectoidization of the closed locus, not the statement that the algebraic quotient `R/I` is
complete and perfectoid. Derive the Zariski-closed comparison from [HJ] Lemma 5.7,
p. 30, and the fixed-target limit argument in the proof of Lemma 5.6, p. 30.
The density clause follows by composing the dense finite-level maps into `R` with
`R → S`; [P7.1](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers)–[P7.2](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers) supply the resulting tilde-limit comparison. [Torsion] Theorem IV.1.1,
pp. 67–69, is the Shimura-variety application of this argument. Prove that for `U = Spa(R, R⁺)`
affinoid perfectoid and a cofiltered system of Zariski-closed embeddings `W_i → U` cut out by
ideals `I_i ⊆ R` with `I_i ⊆ I_j` for `i ≤ j`, `lim_i W_i → U` (limit of v-sheaves) is the
Zariski-closed embedding cut out by `∑_i I_i`, in particular affinoid perfectoid
(*limit-of-zariski-closed-embeddings*) ([HJ] proof of Lemma 5.6, p. 30); and that for a closed immersion
`Y → X` of quasi-projective varieties over `K` and `f : Z → X^an` from a perfectoid space,
`W = Z ×_{X^an} Y^an` is a perfectoid space, `W → Z` is a Zariski-closed embedding, and for `Z`
affinoid perfectoid `W` is cut out by the images of finitely many global sections of `f^*ℰ` for
any vector bundle `ℰ` on `X^an` surjecting onto the ideal sheaf of `Y^an`
(*closed-subvariety-pullback-is-zariski-closed*) ([HJ] Lemma 5.7, p. 30).
*Needs for the closed-subvariety pullback and fixed-target closed-limit inputs:*
*zariski-closed-embedding*; PerfectoidSpaces P4.15; P8.19's projective-level
and analytification carriers; AdicSpacesPartII R1. They precede projective-tower
separation. *Needs for the closed-tower tilde-limit comparison:* these two
inputs and PerfectoidSpaces P7.1–P7.2.

*limit_of_zariski_closed_embeddings* specifies the fixed-target limit by factorization:
a map factors through the locus of `⨆ I_i` exactly when it factors through every finite
locus. The comparison retains the structural maps, rather than merely a bijection of points.

- *closed_limit_zero* — the supremum of zero ideals gives the identity closed subspace.
- *closed_limit_unit* — one unit ideal makes the limiting space empty.
- *closed_limit_two_ideals* (auxiliary application of [P4](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness)'s `PerfectoidSpace.zeroLocus_sup`) —
  `V(I ⊔ J) = V(I) ∩ V(J)` pins the ideal convention. This does not test the
  structural maps or factorization property of *limit_of_zariski_closed_embeddings*.

The pullbacks defining analytic separation and the closed-subvariety comparison are
characterized on perfectoid test spaces, as diamond fibre products. They do not assert
universality against nonreduced adic test spaces.

- *analyticPullback_disc_nilpotent* — in the raw quotient of the perfected disc by `T`,
  the image of `T^(1/p)` is nonzero and nilpotent. Its perfectoid closed locus kills this
  element. This distinguishes the diamond pullback from the raw adic quotient.

*TowerGeometry.Analytification.map* is fixed by *map_over_base* and *map_test*: on a sheafy
affinoid test map it composes with the given scheme morphism. *closed_subvariety_pullback_is_zariski_closed*
states the perfectoid pullback and its global Zariski-closed map. *closed_loci_in_towers*
identifies the compatible closed limit and its tilde-limit comparison. Both statements
include the open projective presentations of the finite-level varieties.

**Checks.** On the *TowerGeometry.Analytification.map* carrier over a characteristic-zero
complete nonarchimedean field `K`, use the coordinate `T` determined by the analytification
mapping equivalence and the chart `[1:T]` of the polynomial projective line
([Wedhorn] Proposition 8.61 and Remark 8.62, pp. 91–92; [Sch12] §8, Theorem 8.5(ii),
pp. 45–46).

- *analytificationMap_affine_square* — for the scheme endomorphism of `𝔸¹_K` given by
  `T ↦ T²`, its analytic map `f` satisfies `f^*T = T²` on the analytic affine line;
  on `Spa(K,K°)`-valued points it sends the point of coordinate `2` to that of coordinate `4`.
- *analytificationMap_affine_zero* — the scheme endomorphism given by `T ↦ 0` has
  analytic pullback `f^*T = 0` and sends the point of coordinate `1` to that of coordinate `0`.
- *analytificationMap_projective_power* — the scheme map `[X:Y] ↦ [X^p:Y^p]` preserves
  the chart `[1:T]`; its analytic restriction satisfies `f^*T = T^p`, so its composite
  with the analytic chart equals the chart composed with the analytic `p`-power map.

The auxiliary functor laws *analytificationMap_identity*, *analytificationMap_composition*,
and *analytificationMap_empty* assert the identity equation, preservation of composition
in its given order, and the unique empty-source map. They do not count as definition Checks.

Lean: README only.

### Examples

The worked examples of this layer are the checks above and the acceptance cases of the theorems:
the swap action of `ℤ/2` on `K × K`; `ℤ/p` permuting the variables of
`K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩` in characteristic `p`, with perfectoid invariants, an affinoid
perfectoid quotient and freeness exactly off the small diagonal (a group of prime order has
stabilizers `1` or `ℤ/p`, and the cyclic shift fixes `(t₁, …, t_p)` iff `t₁ = ⋯ = t_p`); `μ₂` on
`K⟨T⟩` by `T ↦ −T` and, for `p` odd, on the perfectoid disc by `T^{1/p^n} ↦ −T^{1/p^n}`, not a
torsor at `0`; `ℤ/p` on `K⟨T⟩` by `T ↦ T + 1` in characteristic `p`
with invariants `K⟨T^p − T⟩`; the doubled origin, where no
`G`-clean neighbourhood exists; the closure of the Gauss point, closed but not Zariski closed; the
perfectoid projective line as a good tower against the tower of affine lines, which fails only
(1); and in the perfectoid torus over a perfectoid field `K` of characteristic zero containing
a chosen compatible system of primitive `p`-power roots of unity, at finite level `n` the locus
`T^{1/p^n} = 1` is one point. Its inverse image in the
perfectoid torus is `p^nℤ_p` inside the fibre `T = 1`, which is `ℤ_p(1) ≅ ℤ_p` with ring
`C(ℤ_p, K)`; imposing `T^{1/p^n} = 1` for every `n` leaves the identity point.
The Check *closed_torus_fibre_char_p* uses the completed perfection of `𝔽_p((t))`:
the perfectoid closed fibre of `T = 1` is already a singleton with ring `K`, and every
root coordinate is `1`. Raw finite-level fibres have nilpotents; this assertion is
about their perfectoid closed loci.

### Dependencies

Layer [P1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts) ([P1.1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts), [P1.4](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts), [P1.24](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts), [P1.27](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts), *perfectoid-tate-ring-from-integral-perfectoid*); layer [P2](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)
([P2.3](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces), [P2.8](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces), [P2.16](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces), [P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)); layer [P3](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site); layer [P4](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness) ([P4.10](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness), [P4.15](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness), [P4.19](../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness)); layer [P5](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent) ([P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent)); layer [P7](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers)
([P7.2](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers), [P7.11](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers)); the Foundations of adic spaces roadmap (AdicSpaces), layer 3; AdicSpacesPartII
layers R0 and R1; AdicSpacesPartIII R3.7 (*gaga-finite-covers*, for algebraization,
transition maps and projectivity in *GoodTower.of_finite*);
AdicEtaleGeometry layer A4 (the torsor case of the orbit homeomorphism);
DiamondsAndVStacks layers D2, D4 and D5; the Tau Ceti and Mathlib declarations named in the
*Needs* clauses above (`Algebra.IsInvariant.isIntegral`, `MulSemiringAction.charpoly`,
`ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`,
`TauCeti.AffineInvariantQuotient.isQuotientMap_projection` among them); for the Lean signatures,
Tau Ceti `PreAdicSpace`, `PreAdicSpace.isAdic`, `PreAdicSpace.isAffinoid` and
`ValuationSpectrum.presentationLimitPreAdicSpace`; for the perfectoid targets specified in this
README only, PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`, `Perfectoid.IsIntegralPerfectoid`,
`PerfectoidSpace.isAffinoidPerfectoid` and `PerfectoidSpace.Perfd`.

## Layer P9: continuous torsor descent with coefficients

The layer constructs continuous cochain foundations in P9.0 and uses the pro-étale site of a rigid
space to construct its affinoid perfectoid objects and completed structure sheaves; pro-étale Galois towers with their Čech descent data; descent of
`O`, `O⁺` and finite locally free modules along a tower, over smooth and over seminormal bases and
after product with a smooth weight space; twisted character sheaves with their finite-level
comparison; and flat and derived coefficient change with the vanishing of higher inverse limits.

### P9.0 continuous cochains and inverse limits

Lifting along discrete surjections is Tau Ceti's `TauCeti.ContCohomology.exists_continuous_lift`:
for any topological space `X`, a surjection `π : Y → Z` onto a discrete space and a continuous
`f : X → Z`, there is a continuous `g : X → Y` with `π ∘ g = f` (compose `f` with a set-theoretic
section of `π`; [Rubin] Appendix B, §2, Remark 2.2, p. 152). Applied with `X = Gⁱ` in each degree,
surjective transitions of discrete `G`-modules induce surjective transitions on continuous cochains
`C(Gⁱ, −)`. For `ℤ/4 → ℤ/2` the section sending the residues `0, 1` to `0, 1` gives the lift; for
`ℝ → ℝ/ℤ` the identity of `ℝ/ℤ` has no continuous lift, so discreteness of the target is needed.

**Continuous cochains into an inverse limit.** Let `G` be profinite and `T = lim T_n` a limit of
topological `G`-modules, a closed subspace of `∏ T_n` with the induced product topology. Then
`Cⁱ(G, T) = lim Cⁱ(G, T_n)` as complexes. When the `T_n` are finite discrete with surjective
transitions, the transitions of the tower `Cⁱ(G, T_n)` are surjective.

*Proof sketch.* A continuous map into a subspace of a product is a compatible family of
continuous maps into the factors (Mathlib `continuous_pi_iff`); the coboundaries are given by the
same formula at every level, so the identification is one of complexes. Surjectivity is
`TauCeti.ContCohomology.exists_continuous_lift` with source `Gⁱ` ([Rubin] Appendix B, §2,
Definition 2.1 and Remark 2.2, pp. 151–152). *Needs:* Tau Ceti
`TauCeti.ContCohomology.exists_continuous_lift`; Mathlib `continuous_pi_iff`.

**Checks.**

- For `T = ℤ_p = lim ℤ/pⁿ` with trivial action: in degree `0` both sides are `ℤ_p`, and in
  degree `1` a continuous homomorphism `G → ℤ_p` is the same as a compatible family of
  homomorphisms `G → ℤ/pⁿ`.
- For the trivial group `G`, both cochain complexes have term `T` in every degree; the
  differentials alternate between zero and the identity, so all positive cohomology vanishes.
- A coefficient tower with zero transitions has zero limit, as does its tower of cochains;
  the comparison is the zero complex in every degree.

**Comparison with the canonical carrier for compact coefficients.** Let `G` be a profinite group
(compact, Hausdorff and totally disconnected) and `M` a topological `R`-module with a jointly
continuous action `G × M → M`; continuity of each operator separately, as in `TopRep`, is not
enough. Then dehomogenisation identifies the inhomogeneous complex `C(Gⁿ, M)` with Mathlib's
`TopRep.homogeneousCochains` after forgetting topology, and hence identifies its cohomology with
the underlying `R`-module of `continuousCohomology`. For compact and rational coefficients this
extends the comparison for discrete coefficients of ProfiniteCohomology Layer 3. When a
topological statement is made, cohomology carries the quotient topology; comparisons in the
derived category forget it.

*Proof sketch.* Dehomogenisation and its inverse are given by composing with continuous maps
between `Gⁱ⁺¹` and `Gⁱ` and with the action; the inverse is continuous because the action is
jointly continuous. Mathlib's homogeneous cochains are iterated spaces of continuous maps with the
compact-open topology, and currying identifies them with `C(Gⁱ⁺¹, M)` because `G` is locally
compact Hausdorff. The proof for discrete coefficients then applies unchanged ([Rubin]
Appendix B, §2, Definition 2.1, p. 151). *Needs:* P9.0, *Continuous cochains into an inverse limit*;
ProfiniteCohomology Layer 3; Mathlib `continuousCohomology`.

**Checks.**

- In degree `0` both sides are `M^G`.
- In degree one the comparison agrees with Tau Ceti's `ContCohomology` description of `H¹` by
  continuous crossed homomorphisms modulo principal ones.
- In degree two it agrees with `TauCeti.ContCohomology.H2`, continuous `2`-cocycles modulo
  coboundaries.

Lean: README only. The lifting statement is supplied by Tau Ceti; the inverse-limit and
homogeneous comparisons are README targets.

### P9.2 completed structure sheaves

**Completed structure sheaves `Ô⁺`, `Ô` on affinoid perfectoid objects.**
(*completed-structure-sheaves*) On the site `X_proét` of PerfectoidSpaces P7.16 (*proetale-site*) define `O⁺ = ν*O⁺_{X_ét}`,
`O = ν*O_{X_ét}`, `Ô⁺ = lim_n O⁺/p^n` and `Ô = Ô⁺[1/p]`. For an affinoid perfectoid object `U`
with associated perfectoid pair `(R, R⁺)`: (i) `O(U) = colim R_i` and
`O⁺(U) = colim R_i⁺` (uncompleted); (ii) `Ô⁺(U) = R⁺` and `Ô(U) = R`; (iii) for `m ≥ 1`, `(O⁺/p^m)(U)` is
almost isomorphic to `R⁺/p^m`, and `H^i(U, O⁺/p^m)` is almost zero for `i > 0`
([Sch13] Lemma 4.10(i) and its proof, pp. 26–27, over a perfectoid base;
use [P3.21](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site) and the étale–pro-étale comparison for the root-ideal formulation); (iv)
`H^i(U, Ô⁺)` is almost zero for `i > 0` (Lemma 4.10(v)), hence `H^i(U, Ô) = 0` for `i > 0`; (v)
for a profinite set `S`, `Ô⁺(U × S) = C(S, R⁺)` and `Ô(U × S) = C(S, R)` (continuous maps for the
`p`-adic topology on `R⁺` and its induced Tate topology on `R`). The almost statements are for the root ideal `(ϖ^{1/p^n})_n ⊆ R⁺` of a
pseudouniformizer `ϖ` of `R` with compatible `p`-power roots ([P0.2](../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup)); when the base field is a
perfectoid `K` and `ϖ ∈ K`, this is `K°°R⁺`, the setting of [Sch13], and it is idempotent, as
the ideal `(ϖ)` of a discretely valued base is not. For a perfectoid base the section comparison
`colim F(Y_i) → (ν^*F)(Y)` is supplied by DiamondsAndVStacks D2.5; for affinoid
perfectoid `X`, that subsection also supplies `H^i(X_proét, O) = 0` and
`H^i(X_proét, O⁺)` almost zero for `i > 0`,
using [P6](../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms)’s pro-étale morphisms and [P3](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site)’s étale structure sheaves. The present
target uses the locally noetherian analytic site, which includes the spectrum
of a complete nonarchimedean field. Name the four sheaves *ProEtaleSite.integralStructureSheaf*,
*ProEtaleSite.structureSheaf*, *ProEtaleSite.completedIntegralStructureSheaf* and
*ProEtaleSite.completedStructureSheaf*; name the comparisons
*ProEtaleSite.sections_colimit*, *ProEtaleSite.completedSections*,
*ProEtaleSite.modPowerAlmostComparison*, *ProEtaleSite.completedAlmostAcyclic* and
*ProEtaleSite.completedSections_profinite*. *sections_colimit* takes the map
`X → Spa(ℚ_p, ℤ_p)` explicitly. *completedSections*, *modPowerAlmostComparison*,
*completedAlmostAcyclic* and *completedSections_profinite* carry it through their
`AffinoidPresentation` hypothesis, as does `AffinoidPresentation.points` in PerfectoidSpaces P7.16.
Each has exactly the base-field, affinoid
perfectoid and degree hypotheses of the corresponding clause above ([Sch13] §4, Definition 4.1, p. 21, and Lemma 4.10, p. 26; §6,
Corollary 6.6, p. 36). *Needs:* PerfectoidSpaces P7.16 (*proetale-site*); [P2.8](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P2.7](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); [P6.14](../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms) for the comparison of affinoid perfectoid presentations.

**Checks for the four structure sheaves.**

- *structureSheaves_constant_point* — on AdicEtaleGeometry’s site of the
  locally noetherian analytic field spectrum, on the constant perfectoid point `Spa(C, O_C)`,
  with `C` complete algebraically closed of mixed characteristic, the four rings of
  sections are respectively `O_C`, `C`, `O_C`, `C`; completion adds nothing.
- *structureSheaves_torus_completion* — on the torus root tower over `C = ℂ_p`, the
  uncompleted ring is `⋃_n C⟨T^{±1/p^n}⟩`, whereas the completed ring also contains
  `Σ_{n≥1} p^n T^{1/p^n}`, which belongs to no finite level. The analogous distinction
  holds for the integral rings, using the same power-bounded series. The Check's
  conclusion includes both uncompleted colimit comparisons, both completed
  section-ring comparisons, and a sum `s` with `HasSum`, membership in the
  power-bounded subring and nonmembership in every finite-level image.
- *structureSheaves_two_points* — the disjoint union of two copies of the constant
  perfectoid point, on that same site, has sections `O_C²`, `C²`, `O_C²`, `C²`; the two idempotents
  `(1,0)` and `(0,1)` remain distinct after completion and inverting `p`.

*ProEtaleSite.structureSheaves_split_point* computes the four sheaves on
`n` constant copies of a complete algebraically closed nonarchimedean
perfectoid field of characteristic zero with topologically nilpotent `p`,
with values the functions on `Fin n`
into the field or its power-bounded subring. Its cases `n = 1`, `n = 2` and
`n = 0` are the constant-point, two-point and *structureSheaves_empty* Checks
([Sch13] Definition 4.1, p. 21, and Lemma 4.10(iii–iv), pp. 26–27).
*TorsorDescent.rootTorusTower_exists* supplies the torus Check’s actual
`AffinoidPresentation`, both uncompleted colimit comparisons, both completed
section rings and the displayed convergent series outside every finite level.
It uses a complete nonarchimedean perfectoid field of characteristic zero
with topologically nilpotent `p`, compatible primitive roots of unity and
pseudouniformizer roots; the displayed Checks specialize to `ℂ_p` ([Sch13] Example 4.4, p. 23, and Lemma 4.10, pp. 26–27).

The completion operations also have an intrinsic form for a ring sheaf `F` on any
small site `(C,J)`. *ProEtaleSite.modPowerPresheaf* (of `J`, `F`, `p` and `n`) takes the sectionwise
quotient by `p^n`; *modPowerDiagram* sheafifies these quotients and uses the quotient
transition maps. *completedIntegralStructureSheaf* (of `J`, `F` and `p`) is their limit and
*completedStructureSheaf* (of `J`, `F` and `p`) is the sheafification of *invertPPresheaf*, its
sectionwise localization at `p`. For the pro-étale structure sheaves take
`F = ν*O⁺`. The transition equation *modPowerDiagram_map_mk* and restriction equation
*invertPPresheaf_map_algebraMap* specify these maps. The sectionwise limit comparison
*completedIntegralStructureSheaf_sections* identifies each coordinate with the
corresponding limit projection. This construction does not replace the geometric
section and cohomology comparisons above.

Checks for these operations (including quotient and localization) are:

- *completion_characteristic_p* — if `p` is prime and every section ring of `F` has
  `p = 0`, every positive-exponent quotient and its sheafification recover `F`;
  integral completion recovers `F`, while localization and rational completion are zero. In particular this applies to a sheaf of `𝔽_p`-algebras.
- *completion_p_unit* — if `p` is invertible in every section ring, every quotient
  and both completions are zero. Thus completing `O` itself cannot construct `Ô`.
- *completion_two_factors* — integral and rational completion of `F × H` are
  respectively the products of their completions. The quotient presheaves,
  quotient diagrams and localization presheaves also preserve these products.
  This preserves the two factor
  idempotents whenever both completed factors are nonzero.

The constant-point and two-point objects in *structureSheaves_split_point* lie in
AdicEtaleGeometry's locally noetherian analytic pro-étale site over the perfectoid
field spectrum. *TorsorDescent.rootTorusTower_exists* supplies the torus pro-object,
its `AffinoidPresentation`, and the comparisons of all four section rings with
the finite-level colimits and their completions.

The uncompleted geometric sheaves are the categorical inverse images of
`AdicSpace.structureSheafPlusEtale` and `AdicSpace.structureSheafEtale` along
`AdicSpace.ProEtaleSite.const`. *ProEtaleSite.sections_colimit* gives both ring
comparisons for a specified qcqs pro-presentation with qcqs stages.

Their Checks *integralStructureSheaf_point*, *integralStructureSheaf_empty*
and *integralStructureSheaf_two_points* compute sections on the constant
one-point, empty and two-point objects over `Spa(ℚ₂, ℤ₂)` as `ℤ₂`, the zero
ring and `ℤ₂ × ℤ₂`. The corresponding *structureSheaf_point*,
*structureSheaf_empty* and *structureSheaf_two_points* compute `ℚ₂`, the zero
ring and `ℚ₂ × ℚ₂`. The two factors keep distinct idempotents.

*scalarOnSlice* is multiplication by a section on the additive sheaf over the
slice site; *scalarOnSlice_app* evaluates it as restriction followed by
multiplication. Check *scalarOnSlice_zero* gives the zero endomorphism. On the two-point
slice over `Spa(ℚ₂,ℤ₂)`, with section ring `ℤ₂ × ℤ₂` (or `ℚ₂ × ℚ₂`), the Checks
*scalarOnSlice_idempotent_restriction* and *scalarOnSlice_idempotent_product* compute
multiplication by `e₁ = (1,0)` and `e₂ = (0,1)`: restriction of `e₁`'s endomorphism
to the first component is the identity and to the second is zero, and composing the
two distinct idempotent endomorphisms is zero. Check *scalarOnSlice_nonconstant*
computes `(1,2)·(a,b) = (a,2b)`; its endomorphism differs from constant multiplication
by its value `1` at the first point. The `_one` and `_two` calculations are auxiliary
module laws. The positive-degree integral
cohomology statements say that every compatible root acts by zero on cohomology;
the rational completed cohomology vanishes. The mod-power comparison is induced
by the projections from the completed integral sheaf ([Sch13] Lemma 4.10).

Constant scalars are recorded by *scalarModuleSheaf*: `a • x = κ(a)x`.
The equation is *scalarModuleSheaf_smul* for each object and the specified `κ`.
*tensorCoefficientFunctor* first extends the coefficient module to those scalars,
then tensors with the integral ring sheaf and sheafifies. *moduleCohomology* is
the right derived sections functor with that scalar action.
*moduleReductionDiagram* is the cokernel diagram `F/pⁿ`, whose transition maps
commute with the quotient maps. Its inverse limit is integral completion.
These are the module forms of [Sch13] Definition 4.1, p. 21, and the coefficient
construction in [CHJ] Lemma 4.1, pp. 28–29.

**Checks.** *scalarModuleSheaf_zero* checks the zero ring.
*scalarModuleSheaf_product* uses a section ring identified with `ℤ × ℤ` and
the identity scalar map: `(1,0)` and `(0,1)` send `(3,5)` to `(3,0)` and `(0,5)`.
*scalarModuleSheaf_projection* uses a section ring identified with `ℤ` and the
first projection from `ℤ × ℤ`: `(0,1)` kills `1`, and the resulting scalar action
is not faithful. Both computations use the specified scalar map on the actual
module-sheaf sections.
*scalarModuleSheaf_one* and *scalarModuleSheaf_two* are auxiliary module laws,
valid for any scalar action, and do not count as definition Checks.
*tensorCoefficientFunctor_zero*, *tensorCoefficientFunctor_unit*, and
*tensorCoefficientFunctor_two* give the zero, rank-one, and rank-two coefficient
sheaves. *moduleCohomology_zero_degree*, *moduleCohomology_zero_sheaf*, and
*moduleCohomology_injective* identify sections, zero cohomology, and vanishing
positive cohomology of an injective. *moduleReductionDiagram_zero*,
*moduleReductionDiagram_unit*, and *moduleReductionDiagram_torsion* distinguish
exponent zero, invertible `p`, and a sheaf already killed by `p`.

Lean: README only.

### P9.3 pushforward to the étale site of a smooth rigid space

**Pushforward of `Ô` to the étale site of a smooth rigid space.** (*pushforward-of-completed-O*)
Let `k` be a complete discretely valued field of characteristic `0` with perfect residue field of
characteristic `p`, and `X` a smooth rigid-analytic variety over `k`, viewed as an adic space. For
the morphism of sites `ν : X_proét → X_ét` ([Sch13] Corollary 6.19): `ν_* Ô_X = O_{X_ét}`;
`ν_* Ô_X(n) = 0` for `n ≥ 1`; `R¹ν_* Ô_X(1) ≅ Ω¹_{X/k}` and `R¹ν_* Ô_X(n) = 0` for `n ≥ 2`, where
`(n)` is the Tate twist by the cyclotomic character. The higher direct images `R^iν_* Ô_X` for
`i ≥ 2` and their form after base change to a completed algebraic closure lie outside this layer.
Name these four comparisons *ProEtaleSite.pushforward_completedStructureSheaf*,
*ProEtaleSite.pushforward_positiveTwist_eq_zero*, *ProEtaleSite.firstPushforward_twistOne*
and *ProEtaleSite.firstPushforward_twist_ge_two_eq_zero*, with the hypotheses and
ranges of `n` above. Both first direct images use Mathlib's `Functor.rightDerived`
and `sheafIsAbelian`, with the standard additive structure on abelian-group
sheaves. Sheafification on each small étale topology is expressed by the
proposition-valued `HasSheafify`; finite limits of abelian-group sheaves use
Mathlib's standard instance. The `i = 0` statement is the one used for function descent along Galois towers in
*function-descent-along-tower*: the functions on `X` are the pro-étale-locally completed
functions that descend ([Sch13] §6, Definition 6.8, p. 37, and Corollary 6.19, p. 41;
§5, Lemma 5.2 (étale toric charts)). *Needs:* *completed-structure-sheaves*; PerfectoidSpaces P7.16 (*proetale-site*); [P1.31](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts).

*CyclotomicModule* (of `p` and `R`) is the additive module of compatible `p`-power roots of
unity in `R`. Its coordinate equations specify addition by multiplication and
`ℤ_p`-scalars by exponentiation modulo `p^n`. *completedScalar* is the scalar map
whose `n`th completion coordinate is that residue. *integralToRational* is
localization followed by sheafification. *twistPresheaf* tensors completed
functions over `ℤ_p` with the `n`th tensor power of *CyclotomicModule*;
*completedTateTwist* is its associated sheaf. The restriction equation is
*twistPresheaf_map* ([Sch13] Proposition 6.7 and the definitions in its statement, p. 37).

**Checks.** *CyclotomicModule_zero_ring* and *CyclotomicModule_rational* vanish;
*CyclotomicModule_closed_field* is generated freely over `ℤ_p` by a primitive
compatible system. *completedScalar_residue* tests `1+p` modulo `p`.
*completedScalar_exponent_zero* sends every scalar to zero in the coordinate
modulo `p⁰`. *completedScalar_second_digit* gives `1+p` in the coordinate modulo
`p²`; when that section ring has characteristic exactly `p²`, this value is
different from `1`, so the first residue alone does not determine the scalar.
*completedScalar_one*, *completedScalar_uniformizer*, and *integralToRational_one*
are auxiliary ring-homomorphism laws and do not count as definition Checks.
*integralToRational_uniformizer* and *integralToRational_torsion* make `p` invertible
and kill `p`-power torsion. *integralToRational_unit_scalar* assumes `p` is already
a unit on every section of the original sheaf: completion gives zero, so each
component of *integralToRational* is bijective with range `{0}`. These coordinate
and localization computations use [Sch13] Definition 4.1(ii), p. 21.
For *twistPresheaf* and *completedTateTwist*, `_zero` is the untwisted sheaf, *_unit_scalar* vanishes when
completing a sheaf in which `p` is already a unit, and `_generator` trivializes the
first twist over a specified compatible generator.

*etaleDifferentials* evaluates continuous relative differentials on each étale
object. Its restriction equation sends `da` to the differential of the restricted
function. Its `_identity`, *_disc*, and `_empty` Checks distinguish zero relative
differentials, the nonzero disc differential, and empty sections. The first direct
image comparison uses this sheaf, over the stated discretely valued field.

Lean: README only.

### P9.4 pro-étale Galois towers

The next two subsections define pro-étale Galois towers with perfectoid limit and compute their
Čech descent datum as a continuous cochain complex.

**Pro-étale Galois towers with perfectoid limit.** (*profinite-galois-tower*) Let `X` be either a
locally noetherian adic space over `Spa(ℚ_p, ℤ_p)` (a rigid space over a complete discretely valued
field in the source range) or a perfectoid space, and `G` a profinite group with a cofinal
decreasing sequence of open normal subgroups `G_j`. The finite levels are the compatible finite
étale `G/G_j`-torsors `X_j → X` of AdicEtaleGeometry A1.12, `profinite-galois-cover-is-covering`,
with compatible right actions; write `𝒯 = (X_j)_j` for their pro-object. In the locally
noetherian branch `𝒯` is an object of A1.12's site, and the covering `𝒯 → X` and the identities
`𝒯 ×_X 𝒯 ≅ 𝒯 × \underline{G}` and `𝒯^{×_X(n+1)} ≅ 𝒯 × \underline{G}^n` are identities in that
pro-object site; in degree one the map sends `(x, g)` to `(x, xg)`, and in degree `n` it uses the
successive increments below. Base change by an arbitrary `U ∈ X_proet` takes place in the slice
`X_proet/U`, with torsor `𝒯_U = U ×_X 𝒯`; it need not give a locally noetherian or perfectoid
adic base `U`.

A pro-étale `G`-tower over `X` is this inverse
system `(X_j)_j` of finite étale `G/G_j`-Galois covers `X_j → X`, with compatible right actions,
together with a perfectoid space `X_∞` with a right `G`-action and compatible equivariant maps
`X_∞ → X_j` such that `X_∞ ~ lim_j X_j` (tilde-limit; for `X` perfectoid the `X_j` are perfectoid
and `X_∞ = lim_j X_j`); `X_∞ = 𝒯̂` is the perfectoid completion of the pro-object, not an object
of the pro-object site. Continuity of each orbit map on completed integral sections with the
`p`-adic topology in the locally noetherian branch, and the pseudouniformizer lattice topology
in the perfectoid branch, is part of the data. Pullback preserves the integral lattice and fixes
`p`, respectively a pseudouniformizer from the base affinoid; P9.5 derives joint continuity
on integral and rational sections. Also part of the data is a
covering of `X` by affinoids `V` whose pro-objects `𝒯_V = lim_j V ×_X X_j` are affinoid
perfectoid with completion `V_∞ = V ×_X X_∞ = h^{-1}(V)`; every rational subdomain
`U ⊆ V` then has `𝒯_U` affinoid perfectoid, with completion `U_∞` a rational subset of `V_∞`, so
these `U` form a basis of `X`. In the locally noetherian branch the completion of `𝒯_V` in the
sense of PerfectoidSpaces P7.16 and P9.2 is required to identify with `V_∞`. Thus `Ô⁺(𝒯_V) = O⁺(V_∞)` and
`Ô(𝒯_V) = O(V_∞)` identify completed sections, not objects of the pro-object site, and completion
of the nerve identifies the completion of `𝒯_V × \underline{G}^n` with the actual perfectoid space
`V_∞ × \underline{G}^n` (PerfectoidSpaces P6.8, and P9.2 here). Over a perfectoid base, the finite
levels and their realisation lie in PerfectoidSpaces P6's pro-category equivalence and limit
construction, with a pseudouniformizer topology on the completed pairs in either characteristic;
there `X_∞ ×_X X_∞ ≅ X_∞ × \underline{G}` is an identity of perfectoid spaces. The right action of
`G` on `X_∞` gives a left action on functions,
`γ^*f = f ∘ (x ↦ xγ)`, with `(γδ)^* = γ^* ∘ δ^*`. In Čech degree `n`, use successive increments:
`(x, g₁, …, gₙ) ↦ (x, xg₁, xg₁g₂, …, xg₁⋯gₙ)`.
Viewed in
`X_proet` (Scholze's pro-étale site for locally noetherian `X`, the pro-étale site of [ECD] for
perfectoid `X`), the pro-object `𝒯 = lim_j X_j` is a pro-étale `G`-torsor, with the nerve
identities above via `(x, g) ↦ (x, xg)`. For `U ∈ X_proet` (in particular `U ⊆ X` open), `𝒯_U`
is a pro-étale `G`-torsor over `U` in the slice, affinoid perfectoid when `U` is affinoid and `𝒯`
is affinoid perfectoid over it; this base change is a statement in the slice site. The completed
geometric tower `U_∞ = U ×_X X_∞`, a pro-étale `G`-tower over `U` in the sense of this target, is
asserted only for bases `U` the target admits — an open `U ⊆ X`, or a locally noetherian analytic
or perfectoid adic space over `X` with the realisation and affinoid-completion data of the
previous paragraphs — and not for an arbitrary pro-object `U ∈ X_proet`, which need not be an adic
space of either kind. The tower of finite étale Galois covers of an affinoid with its completed
limit pair, the perfectoidness of that limit when the levels are perfectoid-generating, and its
perfectoid torsor presentation use AdicEtaleGeometry A4.3–A4.5 (*finite-etale-torsor-tower*,
*completed-tower-pair*) and PerfectoidSpaces P1.32 and P6.16 (*perfectoid-cover-presentation*), and the torsor property
`X_∞ ×_X X_∞ ≅ X_∞ × \underline{G}` for perfectoid `X` is DiamondsAndVStacks layer D3 (D3.10,
*locally-profinite-torsors*); what is added here is an arbitrary prescribed tower over a rigid
base `X` with the perfectoid tilde-limit as a hypothesis. These are specialisations of the
supplied torsor constructions (PerfectoidSpaces P6.9, P6.12; DiamondsAndVStacks D3.10). Define
*ProetaleGaloisTower* (the
structure of `G`, the `G_j`, the covers `X_j → X`, `X_∞ ~ lim X_j` and the compatible right
actions) and *ProetaleGaloisTower.level* (the finite-level map `q_j : X_∞ → X_j`, equivariant for
`G → G/G_j`); prove *ProetaleGaloisTower.torsorIso* (`𝒯 ×_X 𝒯 ≅ 𝒯 × \underline{G}`,
`(x, g) ↦ (x, xg)`, in the pro-object site over a rigid base, completing to
`V_∞ × \underline{G}` over each affinoid `V` of the cover). The structure includes the affine-cover
and continuity conditions above, in addition to the compatible finite-level torsor data ([CHJ] unnumbered setup paragraph of §4.1 ('A handy
lemma'), p. 28). *Needs:* AdicEtaleGeometry A1.12 and A4.3–A4.5; PerfectoidSpaces P1.32 and P6.16; [P6](../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms) profinite products;
[P7.2](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers); [*tilde-limit-etale-base-change*](../PerfectoidSpaces/README.md); Mathlib `ProfiniteGrp`, `OpenNormalSubgroup`.

*ProetaleGaloisTower.finiteEtale* uses A1’s
`YonedaAdicSpace.IsFiniteEtale` for every finite-level structural map.
*ProetaleGaloisTower.base* combines local noetherian analyticity with existence
of a morphism `X → Spa(ℚ_p, ℤ_p)` in its first branch ([CHJ] §4.1, p. 28).
Its perfectoid branch allows both characteristics. Check
*ProetaleGaloisTower_padic_base* extracts that morphism when `X` is not perfectoid.
*ProetaleGaloisTower* records the quotient maps with kernel `G_j`, simply
transitive actions on geometric fibers, the tilde-limit projections and their
equivariance equations. Its action is a morphism from the profinite product;
*action_one* and *action_mul* specify the right-action convention.
*affinoidBasis* requires actual pullback charts over an affinoid cover.

Additional Checks *ProetaleGaloisTower_trivial* and *_finite_etale* assume
`isPerfectoidSpace p X`: the first gives isomorphisms for the trivial group; the
second gives a finite étale limit map and eventual stabilization for a finite
group. The same Checks for `level` test its projections. Perfectoidness of the
finite levels and uniqueness of perfectoid tilde-limits give these conclusions
([SW13] Proposition 2.4.5, pp. 20–21). The `_empty` Check gives empty fibers over
the empty base without this extra hypothesis. *trivial_exists* realizes the
identity tower of every perfectoid space.

Check *ProetaleGaloisTower_dual_numbers* takes `K = ℂ_p`,
`X = Spa(K[ε]/(ε²), K° + Kε)`, the trivial group and the constant identity tower.
The reduction `Spa(K, K°) → X` is a perfectoid tilde-limit: it preserves the
valuation space and its map on rings is surjective, hence dense. The affinoid
preimage condition also holds. Yet `X` is not perfectoid, and the limit map is
neither an isomorphism nor finite étale: its map on rings kills the nonzero
element `ε`, and `K` is not flat over `K[ε]/(ε²)`. Thus even the trivial finite
group requires more than the locally noetherian branch of `base` for these
conclusions ([SW13] Remark 2.3.5, p. 18, and Proposition 2.4.4, p. 20). Before completion the
constant pro-object still carries the nonzero nilpotent `ε`; it disappears only in the strong
completion `Spa(K, K°)`, so even strong completion does not identify the pro-object with its
completed adic space.

**Checks.**

- *tower_trivial* (degenerate) — for `G = {1}` and `X` perfectoid, `X_∞ = X`, and invariants are
  the identity; for `G` profinite acting on `X_∞ = X × \underline{G}` by right translation (the
  trivial torsor), `O(X_∞) = C(G, O(X))` and the invariants are the constant functions `O(X)`.
- *tower_finite_etale* (computation) — for `G` finite acting freely on a perfectoid `Y` with
  `Y → X = Y/G` finite étale (layer P8), the constant tower `X_j = Y` is a pro-étale `G`-tower and
  `O(Y)^G = O(X)`.
- *pullback_two_terms* (auxiliary convention) — right translation gives
  `γ^*(δ^*f)(x) = f((xγ)δ) = f(x(γδ))`. For the permutations `g = (01)` and
  `h = (12)` of `{0,1,2}`, `(gh)(0) = 1` whereas `(hg)(0) = 2`; the order matters.
- *tower_Zp_torus* (computation) — over `K = ℂ_p`, the torus `X = Spa(K⟨T^{±1}⟩)` with
  `X_n = Spa(K⟨T^{±1/pⁿ}⟩)` and `G = ℤ_p(1)` acting by `T^{1/pⁿ} ↦ ζ_{pⁿ}^γ T^{1/pⁿ}` is a
  pro-étale `ℤ_p`-tower with `X_∞` the perfectoid torus, and `O(X_∞)^G = O(X)`: the monomial
  `T^{m/pⁿ}` is multiplied by `ζ_{pⁿ}^{mγ}`, invariant for all `γ` iff `pⁿ | m`, so the invariant
  elements of `K⟨T^{±1/p^∞}⟩` are the series in integral powers of `T`.

The theorem *TorsorDescent.rootTorusTower_exists* constructs the
*ProetaleGaloisTower* used by *tower_Zp_torus*, as well as the site object used
by `proEtale_torus_tower`. Each finite level is the unit torus; its map to
level zero is the `p^n`-power map. The limit coordinates are the [P1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts) Laurent
monomials with exponents `1/p^n`, the action has the displayed roots-of-unity
formula, and invariant global functions are exactly the image of the base
ring. The chosen roots identify `ℤ_p(1)` with `Multiplicative ℤ_p`.
The Check *tower_Zp_torus* explicitly asserts the coordinate action and the
fixed-section equivalence `s` is fixed if and only if `s` is pulled back from
`O(X)`. Check `isTildeLimit_test_perfectoidTorus` uses the full theorem over a
complete nonarchimedean perfectoid field of characteristic zero, with
topologically nilpotent `p`, pseudouniformizer roots and compatible primitive
`p`-power roots of unity. Check `tildeLimit_perfectoid_torus` specializes to
`ℂ_p` and explicitly asserts `PerfectoidSpace.IsTildeLimit` for the tower's
level cone, together with the identification of the limit with the completed
Laurent torus ([Sch13] Example 4.4 and the following paragraph, p. 23).
The *tower_trivial* Check constructs the identity tower and its invariant
sections. The *tower_trivial_product* Check identifies the global sections of
`X × G` with `C(G,O(X))`, using the topology of uniform convergence on
affinoid charts, and computes translation invariants as constants for every
perfectoid space `X` and profinite group `G`; *tower_finite_etale* constructs the constant tower of a surjective
finite étale map between perfectoid spaces with a simply transitive finite
group action on geometric fibers, and computes its invariant functions
([Sch13] Example 4.4, p. 23; [SW13] Proposition 2.4.5, pp. 20–21).

Lean: README only.

### P9.5 the Čech descent datum

**The Čech descent datum of a pro-étale Galois tower.** (*cech-descent-datum*) For a pro-étale
`G`-tower `X_∞ → X` and `U ∈ X_proet` with `𝒯_U` affinoid perfectoid and completion `U_∞`
(P9.4), the Čech nerve of the covering pro-object `𝒯_U → U` in the slice `X_proet/U` is
identified with `𝒯_U × \underline{G}^n` (`n ≥ 0`). In the locally noetherian branch, for
`F ∈ {Ô⁺_X, Ô_X}`, evaluation and completion give
`F(𝒯_U × \underline{G}^n) = C(G^n, F(𝒯_U))` and `F(𝒯_U) = O⁺(U_∞)`, respectively `O(U_∞)`
(continuous maps, with the `p`-adic
topology for `Ô⁺` and the Tate topology induced from its integral lattice for `Ô`). The completed
spaces are `U_∞ × \underline{G}^n`, while the covering used for the sheaf equalizer remains
`𝒯_U → U`. In the perfectoid branch use the realised torsor `U_∞ → U` and `O⁺`, `O` directly,
with the lattice topology in either characteristic. The descent datum is the jointly continuous
`G`-action on `F(𝒯_U) = F(U_∞)`, and the Čech complex of
`𝒯_U → U` with coefficients in `F` is the continuous cochain complex `C^•_cts(G, F(U_∞))`. Use the unnormalized inhomogeneous complex:
`d⁰(a)(g) = g(a) − a` and `d¹(b)(g,h) = g(b(h)) − b(gh) + b(g)`; in
degree `0` the equalizer of `F(𝒯_U) ⇉ F(𝒯_U × \underline{G})` is `F(U_∞)^G`. For the finite étale
torsor towers of AdicEtaleGeometry layer A4 the identification of the uniform completed
self-product with `C⁰(G, Â_∞)`, and of `FÉt(C⁰(G^k, Â_∞))`, is *completed-tower-self-product* and
*finite-etale-invariance-along-tower* there, used here for the Čech nerve. Define
*ProetaleGaloisTower.cechNerveIso* (the `n`-th term of the Čech nerve is
`𝒯_U × \underline{G}^n`, with completion `U_∞ × \underline{G}^n`); prove
*ProetaleGaloisTower.sections_prod_profinite*
(`F(𝒯_U × \underline{G}^n) = C(G^n, F(U_∞))` for `F = Ô⁺, Ô`) and
*ProetaleGaloisTower.cechComplexIso* (the Čech complex with coefficients `F` is
`C^•_cts(G, F(U_∞))`) (the degree-zero descent is [BHW] Lemma 3.7, p. 10; the continuous-cochain
comparison is the Čech construction in [CHJ] Remark 2.25, p. 20, using P9.2 for
completed coefficients). Prove that for a profinite group `G` and a
filtered system `(M_i)` of `G`-modules (or `G`-sets) with continuous discrete actions
factoring through finite quotients (open kernels), `colim_i (M_i^G) → (colim_i M_i)^G` is an isomorphism, as it is for any group `G` when
the transition maps are eventually injective (*invariants-of-eventually-injective-colimits*) (
[CHJ] Lemma 2.24, p. 20). *Needs:* *profinite-galois-tower*; AdicEtaleGeometry layer A4
(*completed-tower-self-product*); P9.0,
*Comparison with the canonical carrier for compact coefficients*; Mathlib `continuousCohomology`,
`CategoryTheory.Limits.filtered_colim_preservesFiniteLimits`; Tau Ceti
`TauCeti.ContinuousCohomology.zeroIsoNatIso`.

**Checks.**

- *cech_trivial_group* (degenerate) — for `G` trivial, the normalized Čech complex
  is `F(U)` in degree `0`; the unnormalized complex has `F(U)` in every degree.
- *cech_trivial_two_terms* (auxiliary convention) — on the identity cover, `d⁰(a) = a − a = 0`
  and `d¹(b) = b − b + b = b`. Thus the unnormalized differentials begin `0, id`.
- *cech_finite_group* (computation) — for `G = ℤ/2` and `U_∞ = U ⊔ U`, `C^0 = F(U)²`, and the
  equalizer is the diagonal `F(U)`.
- *cech_equalizer_eq_contInvariants* (compatibility) — the degree-zero cohomology is Mathlib's
  `continuousCohomology` `H⁰(G, F(U_∞))`, identified with invariants by
  `ContinuousCohomology.zeroIso`. The Check identifies the homology of
  *continuousInhomogeneousCochains* with this supplied cohomology and states
  its degree-zero kernel condition. *cech_finite_group* uses the swap
  representation on two coefficient factors and computes the diagonal kernel;
  *cech_trivial_group* computes degree zero, positive homology, and the first
  two differentials of that same complex.

The model *continuousInhomogeneousCochains* and the theorems
*continuousInhomogeneousCochains_d* and *continuousInhomogeneousCochains_homogeneous*
are local adapters to P9.0, with the contracts specified above.
For a profinite group `G` and `ρ : TopRep V G`, each takes the explicit premise
`Continuous (fun z : G × ρ.V ↦ ρ.ρ z.1 z.2)` for the representation action.
Equivalently, install that action and require `ContinuousSMul G ρ.V`.
Continuity of each operator in `TopRep` alone does not supply this premise
(Mathlib `RepresentationTheory/Homological/ContCohomology/Basic.lean`,
implementation details, and `RepresentationTheory/Continuous/Basic.lean`,
`ContRepresentation`). The terms are the underlying `V`-modules of compact-open
continuous functions on `G^n`, with `C^0 = ρ.V`. For `b ∈ C^n`, the differential is

```text
(db)(g₁,…,gₙ₊₁) = g₁ b(g₂,…,gₙ₊₁)
  + ∑ᵢ₌₁ⁿ (−1)^i b(g₁,…,gᵢgᵢ₊₁,…,gₙ₊₁)
  + (−1)^(n+1) b(g₁,…,gₙ).
```

Products occur in their written order. The shared homogeneous comparison uses
`b ↦ ((g₀,…,gₙ) ↦ g₀ b(g₀⁻¹g₁,…,gₙ₋₁⁻¹gₙ))`; its inverse evaluates on
`(1,g₁,g₁g₂,…,g₁⋯gₙ)`. Joint continuity makes the former a continuous function,
and local compactness of profinite `G` identifies it with the iterated compact-open
carrier (Mathlib `Topology/CompactOpen.lean`, `ContinuousMap.curry`,
`ContinuousMap.uncurry`). The isomorphism retains all differentials after forgetting
topology, and its homology is Mathlib's `continuousCohomology` in every degree.
It is natural under continuous equivariant linear coefficient maps. For discrete
coefficients its degrees 0–2 and first two differentials agree, after scalar
restriction to `ℤ`, with `TauCeti.ContCohomology.cochainEquiv0`,
`TauCeti.ContCohomology.cochainEquiv1`, `TauCeti.ContCohomology.cochainEquiv2`,
`TauCeti.ContCohomology.d_cochainEquiv0` and
`TauCeti.ContCohomology.d_cochainEquiv1_apply` in
`TauCeti/RepresentationTheory/Homological/ContCohomology/CochainComparison.lean`.

Prove *ProetaleGaloisTower.sections_continuousAction* for the completed section
identifications above: the action on `O⁺(U_∞)` is jointly continuous in the
`p`-adic topology in the locally noetherian branch and in the pseudouniformizer
lattice topology in the perfectoid branch, and the action on `O(U_∞)` is jointly
continuous in its Tate topology. P9.4 supplies continuous orbit maps and lattice
preservation. For the neighbourhoods `t^m O⁺(U_∞)`, where `t = p`, respectively a
base pseudouniformizer, every group element preserves every neighbourhood because
it fixes `t`. Thus the operators are equicontinuous. The identity
`g(a) − g₀(a₀) = g(a − a₀) + (g(a₀) − g₀(a₀))` combines this uniform control with
orbit continuity to prove joint continuity. On rational sections the same
neighbourhoods control the first summand; write `a₀ = t⁻ʳ a₀⁺` to obtain continuity
of its orbit from the integral one. These are the specified completed-section
topologies, including after sheafification and inversion of `p`.
The geometric *cechComplexIso* and *cechComplexIso_rational* use this joint
continuity with the shared model for integral and rational sections, respectively.
They retain the right-action increment convention and are compatible with
restriction and with continuous equivariant coefficient maps via P9.5's
local naturality comparison ([CHJ] Remark 2.25, p. 20, for the Čech construction;
[BHW] Lemma 3.7, p. 10, for the completed-section descent).

**Checks.**

- Degree zero (computation) — `d⁰(a)(g) = ga − a` is a continuous function of `g`
  under the explicit joint-continuity hypothesis.
- Degree one (computation) — `d¹(b)(g,h) = gb(h) − b(gh) + b(g)` is a continuous
  function of `(g,h)` under the same hypothesis, retaining the written order of `gh`.
- *continuousInhomogeneousCochains_trivial* gives alternating zero and identity
  maps for the trivial group, with any topological coefficient module.
- *continuousInhomogeneousCochains_discrete_comparison* specializes the shared
  comparison to a discrete module with `ContinuousSMul G M` and checks agreement
  with the three supplied additive equivalences and their first two differentials.
- *cech_operators_without_joint_continuity* (negative) — let
  `G = (ℤ₂,+)` and `M = ⨁_{g ∈ G} ℤ e_g` with the discrete topology. Translation
  `h(e_g) = e_{h+g}` gives continuous individual linear automorphisms and hence a
  `TopRep ℤ (Multiplicative G)`. But `d⁰(e₀)(h) = e_h − e₀` has inverse image
  `{0}` of the open singleton `{0}`; that singleton is not open in `ℤ₂`.
  Thus the differential is not continuous and this representation fails the
  shared interface's joint-continuity premise.
- *cech_root_torus_continuousAction* (non-discrete coefficients) — for P9.4's
  root-torus tower over `ℂ_p`, with `G = ℤ_p(1)`, use
  `M⁺ = O⁺(U_∞)` and `M = ℂ_p⟨T^{±1/p^∞}⟩` with their lattice and Tate
  topologies. The root-coordinate formula makes finite-level polynomial orbit
  maps continuous; density and preservation of lattice neighbourhoods extend
  this to all completed sections. Apply *sections_continuousAction* and both
  Čech-complex comparisons with these non-discrete modules. In degree zero
  their invariants are the integral and rational base-torus functions, and
  `d⁰(T^{1/pⁿ})(g) = (ζ_{pⁿ}^g − 1)T^{1/pⁿ}` is continuous.
- *cech_coefficient_map_natural* (compatibility) — on the trivial profinite
  torsor `U × G → U`, a continuous linear coefficient map commuting with
  translation acts on the section complex by postcomposition. Check that
  both geometric Čech comparisons and the shared homogeneous comparison
  commute with that map in every degree.

Lean: README only. The negative control *cech_operators_without_joint_continuity*, the geometric
targets, the shared-model re-exports and the remaining Checks are specified here.

### P9.6 descent of functions along a tower

**Descent of `O` and `O⁺` along a pro-étale Galois tower over a smooth rigid space.**
(*function-descent-along-tower*) Let `X` be a smooth rigid space over a complete discretely
valued field `k ⊇ ℚ_p` with perfect residue field, and `X_∞ → X` a pro-étale `G`-tower. For every
open (or qcqs étale) `U ⊆ X` with `U_∞ = U ×_X X_∞`: `O⁺_X(U) = O⁺_{X_∞}(U_∞)^G` and
`O_X(U) = O_{X_∞}(U_∞)^G`. These are actual equalities of rings (the equalizer of the Čech datum
in degree `0`), obtained through almost statements at each finite level; smoothness over a
discretely valued field with perfect residue field enters through *pushforward-of-completed-O*:
`O_X(U) = (ν_*Ô_X)(U) = Ô_X(U)`, and `Ô_X(U) = Ô_X(𝒯_U)^G` is the sheaf property of `Ô_X` for the
pro-étale cover `𝒯_U → U` with `𝒯_U ×_U 𝒯_U = 𝒯_U × \underline{G}`, followed by the
completed-section identifications of P9.4–P9.5. Both sides are sheaves on
`X`, so it suffices to treat the affinoid `U` with `U_∞` affinoid perfectoid, a basis by
*profinite-galois-tower*, where `Ô_X(𝒯_U) = O_{X_∞}(h^{-1}U)`; the `O⁺` equality follows from
the `O` equality because `h^{-1}(U) → U` is surjective on points, so `|f| ≤ 1` on `U` iff on
`h^{-1}(U)` ([CHJ] Lemma 2.26, p. 20). Under these smooth rigid hypotheses,
for `G = {1}` both equalities are identities, and for finite `G` they are finite
étale descent. These conclusions do not extend to arbitrary locally noetherian
bases, as *ProetaleGaloisTower_dual_numbers* shows. Prove that for a Galois `G`-cover `Y_∞ ∈ Y_proet` of a rigid variety `Y`
(`G` profinite) and `U ∈ Y_proet` qcqs, every sheaf `F` pulled back from `Y_et` satisfies
`F(U) = F(U ×_Y Y_∞)^G` (*etale-sheaf-sections-over-galois-tower*) (the sheaf-theoretic form of
*invariants-of-eventually-injective-colimits* (P9.5), [CHJ] Lemma 2.24, p. 20, applied to
`F(U ×_Y Y_∞) = colim_j F(U ×_Y Y_j)`);
that, after base change to a completed algebraic closure `C` of `k`, for `U`
affinoid with `U_∞` affinoid perfectoid, `H^q(U_proet, O⁺_X/p^m)` is almost
isomorphic to `H^q_cts(G, (O⁺/p^m)(U_∞))` for all `m`, `q` (over `O_C` with the topologically
nilpotent ideal), and `H^q(U_proet, Ô⁺_X)^a ≅ lim_m H^q_cts(G, O⁺(U_∞)/p^m)^a` when
`R¹lim_m H^{q−1}_cts` is almost zero, where the degree-zero integral identity is
`Ô⁺(U) = (lim_m O⁺(U_∞)/p^m)^G`; no exact mod-`p^m` comparison is asserted
(*almost-cohomology-of-tower*) ([CHJ] Remark 2.25, p. 20); and that for a uniform Banach
`K`-algebra `A_∞` with a group acting by continuous `K`-algebra automorphisms, `A = A_∞^G` is a
closed uniform Banach subalgebra with the induced topology and `A° = A_∞° ∩ A = (A_∞°)^G`
(*closed-invariant-subalgebra*) ([CHJ] Proposition 2.22, p. 19). *Needs:* *cech-descent-datum*;
*completed-structure-sheaves*; PerfectoidSpaces P7.16 (*proetale-site*);
[P0.5](../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup); Mathlib `FixedPoints.subalgebra`.

Lean: README only.

### P9.7 descent after product with a weight space

The next two subsections extend function descent to products with a smooth weight space and to
finite locally free modules.

**Descent of `O` and `O⁺` along a torsor after product with a smooth weight space.**
(*weight-extension-of-function-descent*) Let `L₀ ⊇ ℚ_p` be a complete discretely valued field
with perfect residue field and `L ⊇ L₀` a perfectoid field (as in [BHW] §1.5, where `L` is a
perfectoid extension of `ℚ_p^cyc`). Let `Y` be an affinoid adic space over `L₀` that is either a
smooth rigid space or a perfectoid space, `Γ` a profinite group, `X ∈ Y_proet` an affinoid
perfectoid pro-étale `Γ`-torsor with `h : X → Y`, and `𝒰` a smooth adic space over `L`. Put
`X_L := X ×_{L₀} Spa L` and `Y_L := Y ×_{L₀} Spa L`. The geometric statement is made over the
common perfectoid base field `L`, as in [BHW] Lemma 3.7: `X_L` is perfectoid
([P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)) — its affinoid rings are the *uniform* completions
`O(W) ⊗̂^u_{L₀} L` of KL II Cor. 3.3.21, which are not the ordinary Banach completed tensors (see
the Kummer-field Check below) — `X_L → Y_L` is again an affinoid perfectoid pro-étale
`Γ`-torsor (base change of the torsor data along `Spa L → Spa L₀`), and `X_𝒰 := X_L ×_L 𝒰`,
`Y_𝒰 := Y_L ×_L 𝒰` are the sousperfectoid adic spaces of AdicSpacesPartIV R5.5
(*perfectoid-times-smooth-fibre-product*). That supplier describes affinoid rings on its
*affinoid finite-composite charts* only: an affinoid open `V' = Spa(B, B⁺) ⊆ 𝒰` whose
`L`-affinoid algebra `B` is obtained from a Tate algebra `L⟨T⟩` by a finite composition of
rational localisations and finite étale maps (this is the chart class; an arbitrary open with an
étale map to a polydisc, such as the non-quasi-compact open unit disc, is not one), for which
`W' ×_L V' = Spa(S⟨T⟩) ×_{𝔹^n} V'` for affinoid perfectoid `W' = Spa(S, S⁺) ⊆ X_L`, with the
affinoid formula of PerfectoidSpaces P3.17a.4 (*sousperfectoid-etale-base-change*) identifying `O(W' ×_L V')` with
`S ⊗̂_L B`; for an arbitrary affinoid open of `𝒰` it supplies quasi-compactness and a finite
cover by such charts, not an affinoid product or a tensor formula, and nothing more is used here.
Then for every affinoid `V ⊆ Y_L`, with affinoid perfectoid `W = h^{-1}(V)`, and every affinoid
finite-composite chart `V' = Spa(B, B⁺) ⊆ 𝒰`:
`O⁺(W ×_L V')^Γ = O⁺(V ×_L V')` and `O(W ×_L V')^Γ = O(V ×_L V')`. Proof route for the `O`
equality on a chart, in one step on the whole chart algebra: `Γ` acts through `S = O(W)` only, and
`B` is of countable type as a Banach `L`-space (present it as a quotient of a Tate algebra; the
images of the countably many monomials span a dense subspace), so
*invariants-of-completed-tensor-with-banach-space* in its countable-type form (P8.7) gives
`(S ⊗̂_L B)^Γ = S^Γ ⊗̂_L B`, and R5.5's chart formula identifies the two sides with
`O(W ×_L V')^Γ` and, after `S^Γ = O(V)`, with `O(V ×_L V')` (the product formula for the rigid
or perfectoid base side). No stage-by-stage induction along `L⟨T⟩ → B` is used: a rational
localisation is not finite, so `S⟨T⟩ ⊗_{L⟨T⟩} B` is not a finite projective `S⟨T⟩`-module in
general (for the annulus `B = L⟨T, π/T⟩`, `T^{-1} ∈ B` satisfies no monic polynomial over
`L⟨T⟩`), and *function-descent-along-tower*'s rational step, which has a discretely valued
ground field and a perfectoid tower limit, does not apply to `Spa(S⟨T⟩)`, which is not perfectoid.
The base input `S^Γ = O(V)` has two cases: for `Y` perfectoid (hence `Y_L` affinoid perfectoid) it
is *function-descent-over-perfectoid-base*; for `Y` smooth rigid, `Y_L` is smooth rigid over
`L` and generally not perfectoid (`Spa(L⟨T^{±1}⟩)` is not, although its `p`-power toric cover is),
and the input is P9.12's *function-descent-seminormal-base*, smooth rigid spaces being
seminormal, with the topological identification of the sections that the Banach comparison
needs; P9.12 depends on P9.6, the Čech inputs, the completed structure sheaf and DiamondsAndVStacks
D6.9, not on this target. The `O⁺` equality follows because `W ×_L V' → V ×_L V'` is surjective
on points, so a function on `V ×_L V'` is bounded by `1` iff its pullback is. For `𝒰 = Spa L`
(one weight) the statement is the base input itself: *function-descent-over-perfectoid-base* for
`Y` perfectoid, *function-descent-seminormal-base* for `Y` smooth rigid; for `Γ = {1}` it is an
identity; for the trivial torsor `X = Y × \underline{Γ}`,
`O⁺(W ×_L V') = C(Γ, O⁺(V ×_L V'))` and the invariants are the constants. The arithmetic
branch over `L₀` itself (sections over `Spa L₀`-opens before base change to `L`) is not a target
here: its rings are uniform base changes, not ordinary completed tensors, and the Banach
invariants lemma does not apply to them directly. These product charts are not a basis of `Y_𝒰`;
the equalities on all opens are the intrinsic sheaf statement `(h_{𝒰*}O)^Γ = O`,
`(h_{𝒰*}O⁺)^Γ = O⁺` of P9.11 (*weight-extension-sheaf-equalizer*), whose sections on an
arbitrary product open give descent there without that open being affinoid or having a tensor
model; the chart statement here is its input and is what the character sheaves need, which are
sheaves on `Y` of `O_Y ⊗̂ O(V')`-modules ([BHW] Lemma 3.7, p. 10). Prove that for `Y`
affinoid perfectoid and `X → Y` an affinoid perfectoid pro-étale `\underline{Γ}`-torsor,
`O⁺_X(X)^Γ = O⁺_Y(Y)` and `O_X(X)^Γ = O_Y(Y)` (*function-descent-over-perfectoid-base*) ([BHW]
Lemma 3.7, p. 10); and the Banach-space form of *quotient-scalar-extension* (P8.7, the case `V ≅ c₀(I, K)`): for a
Banach `K`-space `E` with a group acting by continuous `K`-linear automorphisms, `F = E^G`, and a
Banach `K`-space `V` with trivial action, with either `V` of countable type over `K` (then `V` is
linearly homeomorphic to `c₀(I, K)` and this is P8.7's statement for modules) or `K` discretely
valued (the clause added here), the canonical map `J : F ⊗̂_K V → (E ⊗̂_K V)^G` (projective tensor
completions of AdicSpacesPartII layer R0) is a natural topological isomorphism, isometric when `V`
is isometric to `c₀(I, K)` (an orthonormal basis)
(*invariants-of-completed-tensor-with-banach-space*) ([CHJ] Lemma 2.23(2), pp. 19–20).
Consume PadicFunctionalAnalysis §2.4's countable-type basis theorem over any complete
nontrivially valued ultrametric `K`, or §2.3's equivalent orthonormalisable norm when `K`
is discretely valued, and §2.2's coefficient/model comparison. Transport the completed
tensor through the resulting bounded linear equivalence `V ≃L[K] C₀(I,K)` to compute fixed
points coordinatewise. A specified model isometry gives the isometric conclusion
for the original norms. *Needs:*
*quotient-scalar-extension* (P8.7);
PadicFunctionalAnalysis §§2.2–2.4 (basis and model interfaces);
*function-descent-over-perfectoid-base*; *function-descent-seminormal-base* (P9.12, for a smooth
rigid base); *cech-descent-datum*; [P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces); AdicSpacesPartIV R5.5
(*perfectoid-times-smooth-fibre-product*); PerfectoidSpaces P3.17a.4
(*sousperfectoid-etale-base-change*); AdicSpacesPartII
layer R0; DiamondsAndVStacks layer D2 and D6.9 (through P9.12).

*WeightExtension.function_descent* states this comparison with a product-chart
hypothesis over the common perfectoid field `L`: sheafy affinoids `B, C` embed openly in
`Y_L, 𝒰`, with `C` an affinoid finite-composite chart algebra, the torsor preimage of `Spa B`
is `Spa R` for a perfectoid pair `R`, and the two projections identify the selected open with
`Spa B ×_L Spa C`; the base-change isomorphism `Y_L = Y ×_{L₀} Spa L` relates it to the
`Y`/`L₀` data of the statement, and no ordinary completed tensor over `L₀` is involved. Its
pullback map is injective with image the invariant functions and reflects membership in
*boundedFunctions*. The tensor argument is made on the whole chart algebra `C`, of countable
type over `L` (P8.7); it makes no assertion on nonproduct opens;
the all-opens comparisons in P9.11 have a perfectoid base field.

**Checks.** *function_descent_nonproduct_domain* tests the rational region
`|T|,|S| ≤ 1`, `|T − S| ≤ |π|` for `|π| < 1`: it contains `(0,0)` and `(1,1)`
but excludes `(0,1)`, so its field-valued points cannot be a Cartesian product.
For a nonzero `π` this gives a rational subdomain of the bidisc that fails the
product-chart hypothesis. This shows only that the region is not itself a product chart.
That product opens are not a basis is tested at the Gauss point of the diagonal: in the unit
bidisc with `0 < |π| < 1`, the Gauss point of the diagonal `T = S` lies in the rational open
`|T − S| ≤ |π|`, and both its projections are the Gauss points of the two discs. Every
product-open neighbourhood of it therefore also contains the independent Gauss point of the
bidisc, where `|T − S| = 1`, so no such neighbourhood lies inside the rational open. Descent on
every open is the separate assertion of P9.11.

The Banach comparison is *invariants_completedTensor*: over a complete nonarchimedean
nontrivially normed field, for complete nonarchimedean Banach spaces `E,V` and a
representation on `E` with continuous operators, the map from the completed tensor
of the fixed subspace is a closed embedding with image the fixed tensors. The
coefficient space has either a countable set with dense linear span, or the field's
norm group is generated by one element of norm strictly between zero and one.
This uses `BanachModule.CompletedTensor` and its continuous linear `map` from R0.

**Checks.**

- *invariants_completedTensor_scalar* — for `V = K`, the canonical comparison is the
  identity on `F` after the scalar-tensor identifications.
- *invariants_completedTensor_countable_nondiscrete* — for `K = ℂ_p` and `V = K⟨T⟩`,
  the countably many monomials give the `c₀(ℕ,K)` model; fixed tensors are exactly
  power series whose coefficients belong to `F`. This uses the countable-type branch
  over a nondiscretely valued perfectoid field.
- *invariants_completedTensor_rescaled_line* — give `V = ℚ_p` the norm `r|a|`, with
  `r > 0` outside `|ℚ_pˣ|`. Its identity map to the usual scalar model is bounded with
  bounded inverse, so the comparison applies, while no vector has norm `1` and the
  original norm has no orthonormal basis.

Lean: README only.

### P9.8 descent of finite locally free modules

**Descent of finite locally free modules and their morphisms, and the limits of degree-zero
descent.** (*descent-of-finite-locally-free-modules*) Let `X_∞ → X` be a pro-étale `G`-tower as
in *function-descent-along-tower*, and `E, F` finite locally free `O_X`-modules; integral modules
are treated separately below. Write
`h^*E = h^{-1}E ⊗_{h^{-1}O_X} O_{X_∞}`. For every affinoid `U ⊆ X`, with `E(U)` finite projective over
`O(U)` by Kiehl's theorem (AdicSpacesPartIII layer R3): `E(U) = (E ⊗_{O_X} O_{X_∞})(U_∞)^G = (h^*E)(U_∞)^G`, and
`Hom_X(E, F) = Hom_{O_{X_∞}, G}(h^*E, h^*F)` (`G`-equivariant homomorphisms). So pullback along
`h` is fully faithful on finite locally free modules. It is not essentially surjective: a
`G`-equivariant finite projective `O(U_∞)`-module need not descend, and degree-zero function
descent alone does not classify finite locally free modules; effectivity needs a finite-level
trivialisation, as in *finite-level-character-sheaf-comparison*, or, integrally, an integral
coboundary, as in *integral-matrix-coboundary-effectivity*. Full faithfulness follows locally
from P9.6 by writing the bundles as direct summands of free modules and applying function
descent to their Hom modules; compare [KL16] Corollary 8.2.4, p. 163, for the
completed pro-étale pullback comparison. The cyclotomic twist in P9.9 gives a
rank-one counterexample to essential surjectivity. *Needs:*
*function-descent-along-tower*; AdicSpacesPartIII layer R3; Mathlib `Module.Projective.iff_split`,
`Module.Finite.exists_comp_eq_id_of_projective`.

**Integral module descent.** For locally free finite-rank `O_X⁺`-modules `E⁺, F⁺`, define
`h^{+*}E⁺ = h^{-1}E⁺ ⊗_{h^{-1}O_X⁺} O_{X_∞}⁺`. The fixed-section identity of P9.6 gives
`E⁺ ≅ (h_*h^{+*}E⁺)^G` and
`Hom_{O_X⁺}(E⁺, F⁺) ≅ Hom_{O_{X_∞}⁺,G}(h^{+*}E⁺, h^{+*}F⁺)`.
To prove this, trivialise both bundles locally: an equivariant morphism is a matrix whose entries
are fixed `O⁺` sections. Descend its entries and glue the matrices using uniqueness on overlaps.
This proof uses no assertion about projectivity of integral sections on an arbitrary affinoid.
More generally, the same local argument applies to ring sheaves `R → h_*B` identifying `R` with
fixed sections for a continuous inverse-image functor between sites with finite limits.
Full faithfulness alone gives no effectivity; P9.10 gives rational finite-level effectivity and
P9.13 gives integral effectivity under its unit-frame hypothesis.

**Affine projective descent.** The affine module comparison is `finite_projective_sections_descent`. For an
injective algebra map `A → B`, an action by `A`-algebra automorphisms with
`Algebra.IsInvariant A B G`, and a finite projective `A`-module `M`, the map
`m ↦ 1 ⊗ m` is injective and has exactly the fixed tensors as its image.
The proof reduces a direct summand of a finite free module to function descent;
no averaging or finite-group hypothesis enters this comparison. The finite projectivity of `M`
is an input. The comparison applies to rational or integral rings with these algebraic
hypotheses; rational affinoid Kiehl supplies the input for `O`-bundles, whereas the integral
statement above uses local frames instead.

Negative control for integral Kiehl: on `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, glue `p O⁺` on
`U₀ = {|T| ≤ |p|}` to `T O⁺` on `U₁ = {|p| ≤ |T|}`. Their generators differ by the integral unit
`T/p` on the overlap, giving a locally free rank-one sheaf `E⁺`. A series `Σ a_n T^n` is a global
section exactly when `a₀ ∈ pℤ_p`: on `U₀` divide by `p`, and on `U₁` write the constant term as
`(a₀/p)(p/T)` after dividing by `T`. Hence `E⁺(X) = (p,T)`. At the maximal ideal `(p,T)` this ideal
has rank one and two independent generators modulo the maximal ideal times itself. It is not
projective, despite local freeness of `E⁺` on `X`.

This is the tower application of the vector-bundle comparison that DiamondsAndVStacks owns in
D2.9, whose site equivalences use completed v-descent on perfectoid covers
([KL16] Theorem 3.5.8, p. 76). The fixed-section and equivariant-Hom
comparisons for a specified tower are the P9 statements here. Their proof
reduces to the fixed-ring comparison, independently of those site equivalences.

The sheaf statement is *ProEtaleSite.finite_locally_free_hom_descent*.
Let `L` be the functor taking base objects to their inverse images on the
covering site. Both sites have finite limits; `L` preserves them, is continuous,
and takes covering families of the terminal sheaf to covering families.
For `α : R → h_*B` injective on sections and identifying `R` with the
`G`-fixed sections of `h_*B`, finite locally free `R`-module sheaves `E,F` have
`Hom_R(E,F) ≃ Hom_{B,G}(h^*E, h^*F)`. The scalar extensions are
Mathlib's pullback between these two ringed sites, and the equivalence sends
a morphism to its pullback.
The actions are semilinear for the specified action on `B` and fix the
adjunction-unit images of `E,F`; this specifies the canonical actions.
Apply this with `B = O_{X_∞}` or `O⁺_{X_∞}` using function descent. It also applies on
`AdicEtaleGeometry.AdicSpace.ProEtaleSite X hX` with its supplied topology,
by taking the pulled-back tower on each object. No averaging is used.
This is the local free-module argument underlying [KL16] Corollary 8.2.4,
p. 163; the integral case uses the actual integral function-descent hypothesis.

Lean: `finite_projective_sections_descent`, the affine projective descent, with `FaithfulSMul A B`
and `Algebra.IsInvariant A B G` expressing injectivity and the fixed-ring identification and
with `M` finite projective as an input. The rational and integral sheaf statements,
*ProEtaleSite.finite_locally_free_hom_descent* and the negative control are README only.

### P9.9 twisted character sheaves

**The twisted-invariant character sheaf of a pro-étale tower.** (*twisted-character-sheaf*) Let
`X_∞ → X` be a pro-étale `G`-tower over a smooth rigid base as in P9.6 or a
perfectoid base as in P9.7, `A` a coefficient algebra (a small `ℤ_p`-algebra with the
mixed completed tensor product, or a reduced affinoid `ℚ_p`-algebra with `⊗̂_{ℚ_p}`), and
`F_A` the completed coefficient sheaf on `X_∞`: its value on an affinoid perfectoid object `V` is
`O(V) ⊗̂ A`, it is extended from this basis to all opens as a sheaf, and it agrees with
`O(V) ⊗̂ A` on every qcqs `V` by finite covers (AdicSpacesPartIV R5.7 builds the coefficient sheaf
this way, with the raw sectionwise formula only on quasi-compact opens). Let
`c : G → Γ(X_∞, F_A)^×` be a 1-cocycle for the pullback action,
`c(γδ) = c(γ)·γ^*(c(δ))` (right action on `X_∞`, so `(γδ)^* = γ^*δ^*` on functions), continuous
in the sense that each restriction `c_U : G → (O(U_∞) ⊗̂ A)^×` to a qcqs `U` is continuous for the
Banach topology. For every open `U ⊆ X` the sheaf `ω_c` on `X` is
`ω_c(U) = {s ∈ Γ(U_∞, F_A) : γ^*s = c_U(γ)^{-1} s for all γ ∈ G}`, a sheaf of
`O_X ⊗̂ A`-modules; on qcqs `U` this is `{f ∈ O(U_∞) ⊗̂ A : γ^*f = c_U(γ)^{-1} f}`. The
raw ringwise expression `O(U_∞) ⊗̂ A` is not used on other opens: there `O(U_∞)` is not a Banach
algebra and integral completion followed by inverting `p` gives the wrong ring
(*twisted_disjoint_components*). `ω_c⁺` is defined with the integral subsheaf `F_A⁺`
(value `O⁺(V) ⊗̂ A°` on affinoid perfectoid `V`) and `c` valued in `Γ(X_∞, F_A⁺)^×`,
where `A° = A` for small integral coefficients and `A°` denotes a chosen bounded open
integral coefficient subring for affinoid coefficients. The algebraic sections are
`twistedInvariants c`, a submodule over `FixedPoints.subring R G` for
any commutative ring `R` with a `MulSemiringAction G R` and any function `c : G → Rˣ`.
Its membership formula `γ • f = c(γ)⁻¹ f` holds by definition; a cocycle is required
for the descent interpretation, not for closure under addition and invariant scalars.
Coboundaries are `γ ↦ F/γ^*(F)` for units `F ∈ Γ(X_∞, F_A)^×`, and for `c′(γ) = c(γ)·F/γ^*(F)` multiplication by
`F` is an isomorphism `ω_c ≅ ω_{c′}` of sheaves of algebraic twisted invariants; name this map
*TwistedCharacterSheaf.congr_cocycle*. This change of cocycle is a statement about the
unrestricted algebraic datum: an arbitrary unit `F` need not have Banach-continuous orbit maps, and
then `c′` is not continuous even when `c` is (*twisted_change_not_continuous*). The continuous
class is preserved when each orbit map `γ ↦ γ^*(F|U_∞)` into `(O(U_∞) ⊗̂ A)^×`, for qcqs `U`, is
continuous for the Banach topology, since products and inverses of units are continuous in a
Banach algebra.
Define *TwistedCharacterSheaf* (the sheaf `ω_c` attached to
the tower, `A` and `c`) and *TwistedCharacterSheaf.sections* (`ω_c(U)` is the set of
sections `s ∈ Γ(U_∞, F_A)` with `γ^*s = c_U(γ)^{-1}s`, equal to the displayed subset of
`O(U_∞) ⊗̂ A` for qcqs `U`); prove *TwistedCharacterSheaf.module* (`ω_c` is a
sheaf of `O_X ⊗̂ A`-modules) ([CHJ] Definition 2.18, p. 17, on qcqs opens, and the
description following it as the invariants of a pushed-forward coefficient sheaf, p. 18). Prove the profinite-module form of *quotient-scalar-extension* (P8.7) and
*invariants-of-completed-tensor-with-banach-space* (P9.7): for a uniform `ℚ_p`-Banach algebra
`A_∞` with a continuous action of a profinite group `G`, `A = A_∞^G`, and a profinite flat
`ℤ_p`-module `M` (e.g. a small `ℤ_p`-algebra) with the trivial `G`-action and the mixed completion
of AdicSpacesPartIV layer R5, `(A_∞ ⊗̂ M)^G = A ⊗̂ M` for the mixed completed tensor product
`(A_∞° ⊗̂ M)[1/p]`, and
integrally `(A_∞° ⊗̂ M)^G = A° ⊗̂ M` (*invariants-of-completed-tensor-with-profinite-module*) ([CHJ]
Lemma 2.23(1) and proof, pp. 19–20). Here `M` retains its profinite topology in
the integral completion. For an infinite pseudobasis this mixed tensor is not identified
with the Banach projective tensor for the normed space `M[1/p]`; its fixed points are
computed on the bounded families of coefficients in that pseudobasis. *Needs:* *quotient-scalar-extension* (P8.7);
*invariants-of-completed-tensor-with-banach-space* (P9.7);
*profinite-galois-tower*; *cech-descent-datum*; *weight-extension-of-function-descent*;
AdicSpacesPartIV layer R5.

**Checks.**

- *twisted_trivial_cocycle* (degenerate) — for `c = 1`, `ω_c = O_X ⊗̂ A` (weight-space function
  descent).
- *twisted_finite_character* (computation) — for the `ℤ_p(1)`-tower on the torus over `ℂ_p`, with
  `γ^*T^{1/pⁿ} = ζ_{pⁿ}^γ T^{1/pⁿ}`, and the finite-order character `c(γ) = ζ_{pⁿ}^{−kγ}` (a
  cocycle since its values are constants: `γ^*c(δ) = c(δ)`), `ω_c = T^{k/pⁿ}·O_X` is free of rank
  one: `γ^*T^{k/pⁿ} = ζ_{pⁿ}^{kγ} T^{k/pⁿ} = c(γ)^{-1} T^{k/pⁿ}`, and `f ∈ ω_c` iff `f/T^{k/pⁿ}` is
  invariant; `k = 0` is the trivial cocycle, `ω_c = O_X`.
- *twisted_coboundary* (compatibility) — if `c(γ) = F/γ^*(F)` for a unit `F` of `Γ(X_∞, F_A)`,
  then `ω_c = F·(O_X ⊗̂ A)`, matching *TwistedCharacterSheaf.congr_cocycle* with the trivial cocycle: `γ^*f = (γ^*F/F)f`
  iff `γ^*(f/F) = f/F`; and `γ ↦ F/γ^*F` is a cocycle because
  `(F/γ^*F)·γ^*(F/δ^*F) = F/γ^*δ^*F = F/(γδ)^*F`.
- *twisted_change_not_continuous* (boundary, continuity of cocycle changes) — let
  `X = Spa(ℂ_p, O_{ℂ_p})`, `G = ℤ_p`, the trivial tower `X × G` with finite stages `X × ℤ/p^m`,
  and `A = ℤ_p[[Z]]`, so that the mixed tensor is `B⁺ = C(G, O_{ℂ_p})[[Z]]`, `B = B⁺[1/p]`, with
  the supremum norm on coefficients (AdicSpacesPartIV R5.6). Put `e_n` for the indicator of
  `p^n ℤ_p` and `F = 1 + p ∑_{n≥1} e_n Z^n`; then `F` and `F^{-1}` lie in `B⁺` and have norm one.
  For the translations `g_m = p^m → 0` and every `n > m`, `e_n(0) = 1` and `e_n(p^m) = 0`, so
  `‖g_m(F) − F‖ = |p|` and, multiplication by `g_m(F)^{-1}` being an isometry,
  `‖F/g_m(F) − 1‖ = |p|`. Changing the trivial cocycle by `F` gives an algebraic cocycle that is
  not Banach-continuous, although `ω_c ≅ ω_1` still holds algebraically.
- *twisted_disjoint_components* (boundary, all opens) — let `C = ℂ_p`,
  `S = {0} ∪ {pⁿ : n ≥ 0} ⊂ ℤ_p` (profinite), `X = Spa(C, O_C) × S` (affinoid perfectoid by
  PerfectoidSpaces P6.8), the identity tower, `G = 1`, `A = ℤ_p` and `c = 1`. The open `U`
  over `S ∖ {0}` is `⨿ₙ Spa(C, O_C)`, with `Γ(U, O⁺) = ∏ₙ O_C` and `Γ(U, O) = ∏ₙ C`. Then
  `ω_c(U) = Γ(U, F_A) = ∏ₙ C`, which contains the glued section `(p^{−n})_n`, whereas the raw
  recipe `(∏ₙ O_C)[1/p]` contains only tuples with a common denominator bound and is strictly
  smaller. On each quasi-compact component the two descriptions agree.
- *twisted_inverse_two_terms* (auxiliary convention) — on `R = ℚ × ℚ` with the swap action
  and `F = (1,2)`, the coboundary at the swap is `(1/2,2)`. Its inverse acts on `F`
  as `(2,1/2)(1,2) = (2,1)`, the swapped vector; the uninverted coefficient gives
  `(1/2,4)`. The cocycle product is `(1/2,2)(2,1/2) = 1`, whereas squaring `(1/2,2)`
  does not give `1`.
- *mixed_completion_diagonal* (auxiliary non-example) — take `A_∞ = ℚ_p⟨T⟩` and
  `M = ∏_{n≥0} ℤ_p`. The family `(T^n)_n` belongs to the bounded-product mixed tensor.
  Its coefficient array `a(n,m) = 1` for `n = m` and `0` otherwise has every row
  finitely supported, but the tails do not tend to zero uniformly in `n`. It is
  therefore absent from `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} (M[1/p])` with the projective Banach topology.
- *twisted_non_cocycle* (non-example) — for the trivial group acting on `ℚ`, the
  function `c(1) = −1` is not a cocycle, and its algebraic twisted-invariant submodule
  is zero: `f = −f` forces `f = 0`.
- *twisted_tate_twist_zero* (negative control) — for the cyclotomic tower of `Spa(ℚ_p)` with
  `G = ℤ_p^×` and `c = χ_cyc^{-1}` (valued in `ℤ_p^× ⊂ O(X_∞)^×`),
  `ω_c(X) = {f ∈ ℚ̂_p^{cyc} : γ^*f = χ_cyc(γ) f} = 0` by the cyclotomic computation
  in [Sch13], proof of Proposition 6.16(ii), p. 41, with `R = ℚ_p` and `i = −1`:
  a twisted character sheaf can
  vanish, so it is not locally free of rank one without the finite-level trivialisation of
  *finite-level-character-sheaf-comparison*.
- *weightExtension_kummer_not_uniform* (non-example) — ordinary and uniform completed tensors
  must not be identified because both factors are perfectoid: let `F` be the completion of
  `⋃_n ℚ_p(α_n)` with `α_0 = p`, `α_{n+1}^p = α_n`, embedded in `C = ℂ_p`. The projective Banach
  tensor `B = F ⊗̂_{ℚ_p} C` is not uniform: for `d = p^n`, `t_n = α_n ⊗ α_n^{-1}` has `t_n^d = 1`,
  the idempotent `e_n = (1/d) ∑_{i<d} t_n^i` is power-bounded, and `‖e_n‖ = p^n` — the
  constant-coefficient maps `∑ a_i α_m^i ↦ a_0` are contractions (distinct valuations modulo `ℤ`)
  compatible in `m`, extend to a contraction `λ : F → ℚ_p`, and `λ ⊗̂ id_C` sends `e_n` to `p^{-n}`.
  So `B°` is unbounded and `B` is not the coordinate ring of `Spa(F) ×_{ℚ_p} Spa C`, which is the
  uniform completion `F ⊗̂^u_{ℚ_p} C` (KL II Cor. 3.3.21, p. 66). This is the `L₀ = ℚ_p`, `L = C`,
  `X = Y = Spa(F, F°)`, `Γ = {1}`, `𝒰 = Spa C` instance of the target: the identity torsor
  descends trivially, but the ordinary tensor is the wrong ring model.

*TorsorDescent.cyclotomic_tower_twisted_invariants* constructs this tower
on *ProetaleGaloisTower* and its action on `padicCyclotomic p`. It identifies
finite-level section rings with `ℚ_p(ζ_{p^n})`, identifies their inclusions
in the completed field, and specifies the action on every root of unity.
For the coefficient map `ι : ℤ_p → ℚ̂_p^{cyc}`, it states that
`twistedInvariants (g ↦ ι(g)⁻¹)` is the zero submodule. Thus the
*twisted_tate_twist_zero* Check uses the inverse-cocycle convention of
`twistedInvariants` on the completed field, including `p = 2`
([Sch13] Proposition 6.16(ii), proof pp. 40–41, with `i = −1`).

For a ring sheaf `F` on a site, *TwistedCharacterSheaf.Datum* (for `F`) consists of a
sectionwise group action by ring automorphisms and a unit cocycle, both commuting
with restriction. Its equations are `g(h(s)) = (gh)(s)` and
`c(gh) = c(g)g(c(h))`. `sections` is the actual additive subgroup of twisted
invariants; `presheaf` restricts through `F`, and `isSheaf` gives `sheaf`.
For a tower, `F` is the pushforward of the completed coefficient sheaf. Taking its
integral version defines the integral twist by exactly the same construction.
`module` supplies multiplication by invariant coefficients. A natural unit `e`
changes the cocycle to `c'(g) = c(g)e/g(e)` via `change`; *congr_cocycle* is the
sheaf isomorphism multiplying sections by `e`, pinned by *congr_cocycle_apply*. These carry no
topology: for a tower they apply to the algebraic datum, and the continuous subclass is preserved
only under the orbit-continuity hypothesis on `e` stated above.

Checks on this sheaf carrier are:

- *twisted_sheaf_trivial* — `c = 1` gives the fixed-section sheaf, recovering the
  library fixed-point condition on every object.
- *twisted_sheaf_eigenunit* — an integral or rational unit eigenvector `e` with
  `g(e) = c(g)⁻¹e` identifies all twisted sections with `e` times fixed sections.
- *twisted_sheaf_zero* — a zero section ring gives a zero group of twisted sections,
  including the empty open of the analytic site.
- *twisted_sheaf_coboundary* — with a section-ring identification with `ℚ × ℚ`,
  the natural frame `(1,2)` sends the diagonal section `(1,1)` to `(1,2)` under
  the cocycle-change isomorphism. This distinguishes multiplication from division.
- *twisted_change_identity* — changing by the unit frame `1` leaves the cocycle
  unchanged and fixes every section.
- *twisted_change_inverse* — changing successively by `e` and `e⁻¹` recovers the
  original cocycle and every original section, including nonconstant frames.
- *twisted_sheaf_bad_identity* — in characteristic zero, `c(1) = −1` cannot occur
  in `Datum`; the earlier arbitrary-function twisted submodule permits it.

*TorsorDescent.rootTorusTower_exists* also computes every finite-character
eigenline on its completed Laurent ring: for each level `n` and integer `k`,
the sections transforming by `γ ↦ ζ_{pⁿ}^{kγ}` are exactly
`T^{k/pⁿ}` times the image of the base torus's functions. The coordinate is
a unit, so this includes negative `k`; `k = 0` and `n = 0` recover the
invariant functions. This is the coordinate calculation in [Sch13] Example 4.4,
p. 23, combined with Lemma 4.10(iii–iv), pp. 26–27, and the eigenunit
calculation above. Check *twisted_finite_character_torus* specializes to
`ℂ_p` and `k = −1`: for every level `n`, the character
`γ ↦ ζ_{pⁿ}^{−γ}` has eigenline `T^{−1/pⁿ} O(X)`. Its conclusion
uses the inverse power of the coordinate unit; at `n = 0` this is the
invariant ring because `T⁻¹` already lies in `O(X)`. The cyclotomic counterpart is
*TorsorDescent.cyclotomic_tower_twisted_invariants*, with its specified
continuous action on `padicCyclotomic p` and zero inverse-character eigenspace.
For integral mixed coefficients, *invariants_mixedTensorInt* uses a compact Hausdorff
topological DVR `O`, a torsion-free module `E` complete for its maximal ideal,
a profinite flat `O`-module `M`, and an `O`-linear group action on `E`. The map
`mixedTensorInt.map` from the fixed submodule is injective and has precisely the
fixed mixed tensors as its image. The rational mixed-tensor statement above still
uses localization of an open bounded lattice, not a Banach tensor of `M[1/p]`.

Lean: `twistedInvariants`; the identification of the trivial-cocycle twisted invariants with the
invariants is the Check `k = 0` above.
The affine clause of *twisted_coboundary* (for `c(γ) = F/γ(F)`, `f` is twisted invariant exactly
when `F⁻¹f` is invariant), *TwistedCharacterSheaf* with its sheaf constructions, the completed-tensor comparisons and
the remaining Checks are README only.

### P9.10 finite-level comparison and local freeness

The last four subsections identify character sheaves at finite level, prove the sheaf equalizer
after smooth coefficient base change, descend functions over a seminormal base, and give the
integral effectivity criterion in arbitrary finite rank.

**Finite-level identification and local freeness of rank one of character sheaves.**
(*finite-level-character-sheaf-comparison*) Let `ω_c` be a twisted character sheaf on `X` with
`A` a small or affinoid coefficient algebra, and `U ⊆ X` an affinoid (rational or an affinoid
subdomain). Let `G_n ⊴ G` be the open normal subgroup with `U_n = U_∞/G_n` and `Γ_n = G/G_n` the
finite quotient, so that `O(U) → O(U_n)` is finite étale Galois with group `Γ_n` and `O(U_n)` is
finite projective over `O(U)`; `p` is invertible in `O(U_n) ⊗̂ A`, so this
is a rational statement. Suppose that `c(γ) = (γ^*u/u)·c_n(γ)` for a unit `u ∈ (O(U_∞) ⊗̂ A)^×` and
a 1-cocycle `c_n` of `Γ_n` with values in `(O(U_n) ⊗̂ A)^×` (inflated to `G`). Then `f ↦ f·u` is an
`O(U) ⊗̂ A`-isomorphism from `ω_c(U)` onto the `c_n`-twisted invariants
`(O(U_n) ⊗̂ A)^{Γ_n, c_n} = {f₀ : c_n(γ)γ^*f₀ = f₀}`. This is a direct summand of `O(U_n) ⊗̂ A`
(split by `e_n = |Γ_n|^{-1} Σ_{γ∈Γ_n} c_n(γ)γ^*`, an idempotent because `γ ↦ c_n(γ)γ^*` is an
action by the cocycle law), it is the Galois descent of the free rank-one module with descent
datum `c_n`, hence finite projective of rank one over `O(U) ⊗̂ A`, and the formation commutes with
restriction to affinoid subdomains `V ⊆ U` ([CHJ] unnumbered paragraph after Proposition 2.27
(cocycle `j_{U,n}`, idempotent `e_n`), p. 21; `j_{U,n}` and `e_n` are displayed on p. 22). Write
`R_U = O(U) ⊗̂ A`, `B = O(U_n) ⊗̂ A` and `C = O(U_∞) ⊗̂ A`. The comparison uses the coefficient
fixed-section comparison `B ≅ C^{G_n}` and the finite étale torsor comparison
`B ⊗_{R_U} B ≅ ∏_{Γ_n} B`, with `R_U → B` faithfully flat; these follow from P9.7, P9.9 and
AdicSpacesPartIV R5's finite-module tensor comparison for the indicated coefficients. The target
has three separate outputs: this finite projective rank-one module on each affinoid, the
coefficient line sheaf glued from these modules, and the reconstruction of `ω_c` from its global
sections, which holds only on an affinoid base under the named coefficient Kiehl branches.

**Gluing the coefficient line sheaf.** On a general base `X`, affinoids with these decompositions
and restriction compatibilities give a locally projective rank-one coefficient sheaf `ω_c`,
locally free of rank one after the finite étale covers `Uₙ → U`. Equivalently it is a coefficient
line sheaf in the étale topology; for affinoid weights it is a line bundle on the product with
the weight space. This gluing assertion does not identify it with `Loc(ω_c(X))`, even when the
cover is finite ([CHJ] Theorem 2.28, local descent argument).

**Affinoid reconstruction.** Assume now that `X` itself is affinoid and that decompositions as
above exist on a finite affinoid cover. Then
`ω_c ≅ Loc(ω_c(X))` is locally projective of rank one and trivial over the finite levels `U_n`,
with finite projective rank-one global sections, under the following precise
supplier hypotheses from AdicSpacesPartIV R5:

- For small `A` finite free over `ℤ_p` and a discretely valued base field, apply
  `coefficient-sheaf-kiehl` branch (a) for global generation and branch (b) for projectivity.
- For an arbitrary small `A` over a discretely valued base, assume a global presentation
  `ω_c ≅ Loc(M)` with `M` finitely generated over `R_X`. Branch (b) proves projectivity of `M`,
  and full faithfulness of `Loc` identifies `M` with `ω_c(X)`. This finite global presentation
  is an additional input, not a consequence of coherence on a finite cover.
- For reduced affinoid `ℚ_p`-algebra coefficients, use `affinoid-weight-coefficient-sheaf` and
  Kiehl on the affinoid product `X ×_{ℚ_p} Spa(A)` in its rigid branch. On other bases require
  a coefficient Kiehl theorem with the same global-generation conclusion as an explicit input.

These are the supported applications of [CHJ] Theorem 2.28. The unrestricted small-ring
form of [CHJ] Theorem 6.20 is not an input: AdicSpacesPartIV's `coefficient-sheaf-kiehl` separates
its valid projectivity argument from global generation because Lemma 6.19(2) fails for an
infinite pseudobasis.

Regression control: let `E/k` be an elliptic curve with good reduction, where `k/ℚ_p` is finite
and contains `μ_p` and all `E[p]` points. For a nontrivial character `χ : E[p] → μ_p`, the
`χ`-eigensheaf of `[p]_*O_E` is a nonzero line bundle and pulls back to a trivial line bundle
along the finite étale torsor `[p]`. However `H⁰(E, O_E) = k`, and every translation fixes these
constants, so the nontrivial eigensheaf has zero global sections. Thus even finite-level
triviality and a finite affinoid cover do not imply reconstruction from global sections.

The affine comparisons are `finite_character_comparison_linear` and
`finite_character_line`. The former is multiplication by `u`, with the kernel
invariants identified with the finite-level ring. The latter is the finite-level line
(*finite-character-line*): let `G` be a finite group acting on a commutative ring `B` by ring
automorphisms, with `B` finite and faithfully flat over `B^G` and the torsor map
`B ⊗_{B^G} B → ∏_{g∈G} B`, `b ⊗ b′ ↦ (g ↦ b·g(b′))`, an isomorphism, and let `c : G → B^×` satisfy
`c(gh) = c(g)·g(c(h))`. Then the `c`-twisted invariants `{f : c(g)·g(f) = f}` form a finite
projective `B^G`-module of rank one at every prime of `B^G`. No hypothesis on `|G|` is made;
when it is invertible the projector is the displayed weighted average. *Proof sketch.*
`g ↦ (f ↦ c(g)·g(f))` is a semilinear action by the cocycle law, that is, a descent datum on the
free module `B` for the finite étale torsor `B^G → B`; effective descent (AdicEtaleGeometry A4.2a)
gives `B ⊗_{B^G} B^{G,c} ≅ B`, and finiteness, projectivity and rank one descend along the
faithfully flat `B^G → B` (Mathlib `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`,
`Module.rankAtStalk_baseChange`) ([CHJ] paragraph after Proposition 2.27, pp. 21–22, and Theorem
2.28, p. 22). *Needs:* AdicEtaleGeometry A4.2a; Mathlib `Module.FaithfullyFlat`,
`Module.rankAtStalk`.

**Checks.**

- *finite-character-line*, split swap over `𝔽₂` (computation) — `B = 𝔽₂ × 𝔽₂` with `G = ℤ/2`
  swapping the factors and `c = 1`: `B^G` is the diagonal `𝔽₂`, the torsor map is bijective
  (both sides have dimension `4`), and the twisted invariants are the diagonal, of rank one. Here
  `2 = 0`, so no averaging projector exists.
- *finite-character-line*, nontrivial cocycle (computation) — over `B = ℚ × ℚ` with the swap and
  `c(σ) = (2, 1/2)`, the twisted invariants are `{(a, a/2)}`, a line generated by `(1, 1/2)`.
- *finite-character-line*, trivial group (degenerate) — `B^G = B`, the cocycle law forces `c(1) = 1`,
  and the module is `B` itself, of rank one.
- *finite-character-line*, faithful action is not enough (negative control) — `ℤ/2` acting on
  `ℤ[i]` by conjugation is faithful with invariants `ℤ`, but the torsor map is not surjective at
  the prime `2` (the images of `1⊗1, 1⊗i, i⊗1, i⊗i` span a sublattice of index `4` in `ℤ[i]²`), so the hypothesis is the torsor
  isomorphism, not faithfulness.

These formulas commute with
restriction because the scalar map, action, cocycle and frame all restrict.

The comparison is `R_U`-linear, identifying `B^{Γ_n}` with `C^G`, and commutes with restrictions
that transport `u` and `c_n`. For an admissible coefficient map `A → A′`, require the coefficient
fixed-section and finite étale tensor comparisons on both sides; finite projective base change
then identifies the corresponding modules, with `f u` mapping to `f′ u′`. The additive
comparison, its linear upgrade over a common scalar ring acting compatibly through both fixed
rings, its compatibility with restriction and its compatibility with coefficient change
([CHJ] after Proposition 2.27 and the finite Galois argument in Theorem 2.28, pp. 21–22, and
Lemma 2.29, pp. 22–23). Restriction maps commute with the comparing unit, and the
coefficient-change maps are specified on pure tensors. The linear form is
`finite_character_comparison_linear`; the additive form is its case of scalars `ℤ`. Both
compatibilities follow formally from the multiplication formula: for restriction, a twisted
invariant `z` restricts to a twisted invariant `z′`, and the two comparison images of `z′` and
of `z` agree after the injective map `B′ → C′` because both equal the restriction of `z·u`; for
coefficient change, the same computation on pure tensors `a ⊗ z` and linearity give the
identity.

Checks: for the swap on `ℚ × ℚ`, `u = (1,2)` and `c_n = 1` give `c(σ) = (2,1/2)`; the
inverse-twisted line `(a,a/2)` maps to `(a,a)` by multiplication by `u`, which confirms the
inverse-cocycle sign. With `u = 1` and the trivial group the comparison is the identity, and
scalar change preserves the displayed multiplication formula, including over the zero ring.

*TwistedCharacterSheaf.finite_comparison* gives an isomorphism of the actual
*TwistedCharacterSheaf.sheaf* objects. The finite-level coefficient sheaf embeds
as the kernel-fixed sections, its action agrees with the quotient action, and
the natural unit `u` satisfies the displayed cocycle equation. The comparison
sends a section `s` to the unique finite-level section whose image is `su`;
this equation specifies the map on every object and all restrictions.

*TwistedCharacterSheaf.finite_character_sheaf_locally_projective* gives the
global sheaf conclusion. Its module sheaf is identified with `sheaf c`,
including scalar multiplication through the coefficient-ring sheaf. On a
cover, its sections embed as the twisted invariants of specified injective
finite étale Galois coefficient algebras. Restriction is the canonical scalar
extension `a ⊗ m ↦ a·res(m)`. The sheaf is of finite type, is a direct summand
of a finite free sheaf on each member of that cover, and its section modules
there have rank one at every prime. The scalar extension to each finite Galois
coefficient algebra is a free line, by `b ⊗ m ↦ b·j(m)`.
When these finite-level coefficient algebras are realized by a covering family
`V_i → U_i` in the chosen site, the same theorem gives `M.IsLocallyFree` and
`M|_{V_i} ≅ O_{V_i}` as module sheaves. This includes the finite étale covers
inside the pro-étale site. Thus local projectivity is a statement about the whole sheaf, rather than only
its value on one affinoid. AdicSpacesPartIV R5 supplies the coefficient
localization and Kiehl comparison used to obtain `ω_c = Loc(ω_c(X))` in the
branches of the affinoid reconstruction above: `RigidSpace.Coefficients` and `Loc` of
AdicSpacesPartIV R5 (*coefficient-sheaf-kiehl* branches (a)–(b),
*affinoid-weight-coefficient-sheaf*). Kiehl's theorem there assumes a discretely valued
base field; *coefficient-sheaf-loc* gives the sheaf property and vanishing higher
cohomology of `Loc(M)` for finitely generated projective `M` without that assumption.
The finite-level construction is the descent in
[CHJ] Theorem 2.28, p. 22; the sheaf-gluing argument is the same local argument
as [KL16] Corollary 8.2.4, p. 163.

The finite-level module comparison uses AdicEtaleGeometry A4.2a
(*finite-galois-descent-of-modules*), including its finite-projectivity and rank reflection.

Prove that for `U`
quasicompact with `O⁺(U_∞)` the `p`-adic completion of `colim_n O⁺(U_n)`, every unit
`t ∈ O(U_∞)^×` and `m ≥ 1` admit `n`, `s_n ∈ O(U_n)^×` and `t^{(n)} ∈ 1 + p^m O⁺(U_∞)` with
`t = t^{(n)} s_n` (*approximation-of-units-at-finite-level*) ([CHJ] Proposition 2.27, p. 21).
Prove that for an affinoid `V ⊆ X`, an integral cocycle `c` and `F ∈ (O⁺(V_∞) ⊗̂ A°)^×` with `γ^*F = c(γ)^{-1}F`,
`ω_c⁺|_V = F·(O⁺_V ⊗̂ A°)` is free of rank one and its integral pullback is isomorphic to the
prescribed rank-one lattice upstairs (with the bounded open coefficient lattice and the
`π`-adic tensor completion for affinoid coefficients, the product completion of AdicSpacesPartIV
layer R5 for profinite ones) (*integral-coboundary-trivialises-integral-sheaf*) ([BHW] Theorem
4.8, proof, p. 18, using Proposition 3.8 to identify the invariant integral generator). Three
properties of the integral invariants are distinct: the invariant module is locally free of rank
one; it has an eigenvector that is a unit of the upstairs ring; and the descent counit is an
isomorphism. A unit eigenvector gives both rank-one freeness and an isomorphic counit, by the
unit-frame criterion of *integral-matrix-coboundary-effectivity* (P9.13); freeness alone does not
give the counit. Without such an `F`, the projector `e_n = |Γ_n|^{-1} Σ_{γ ∈ Γ_n} c_n(γ)γ^*` is not
integral when `p | |Γ_n|`, so the rational argument gives no integral descent; and even an
integral `e_n` does not give effectivity. For `L = ℚ_p(α)`, `α² = p` and `p` odd, with the sign
twist `c(σ) = −1`, `e = (1 − σ)/2` is integral and the twisted invariants of `O_L = ℤ_p[α]` are
`N = αℤ_p`. Multiplication by `α` is a `ℤ_p`-linear isomorphism `ℤ_p ≅ N`, a positive test of
rank-one freeness, but every such eigenvector lies in `αO_L`, so none is an integral unit, and the
counit `O_L ⊗_{ℤ_p} N → O_L`, `b ⊗ n ↦ bn`, has image `αO_L ≠ O_L`. After inverting `p`, `α` is a
unit and the counit is an isomorphism. The example asserts no failure of local freeness of `N`; it
is a negative test for the integral counit. Prove coefficient change by a regular element: for `A_𝒰` noetherian,
`i : A_𝒰 → A_𝒵` a surjection with kernel generated by a regular element `x`, `K` discretely
valued, and `ω_𝒰` admitting finite-level decompositions over an affinoid `X_w` with
`ω_𝒰 = Loc` of a finite projective module (for an infinite pseudobasis, assuming the finite-level
coefficient ring flat over `A_𝒰` with canonical quotient comparison),
`0 → ω_𝒰 --·x--> ω_𝒰 → ω_𝒵 → 0` and `0 → H⁰(X_w, ω_𝒰) --·x--> H⁰(X_w, ω_𝒰) → H⁰(X_w, ω_𝒵) → 0`
are exact (*coefficient-change-by-regular-element*) ([CHJ] Lemma 2.29, p. 22). Prove derived
coefficient change: for `X` separated quasicompact with a finite affinoid cover `𝔘` carrying
finite-level decompositions, `K` discretely valued, and any ideal `I ⊆ A_𝒰` with `A_𝒰/I` a
coefficient algebra, assume on each nonempty finite intersection of `𝔘` that the
finite-level coefficient ring is flat over `A_𝒰` and its algebraic quotient by `I`
is the completed coefficient ring for `A_𝒰/I`. Assume the coefficient-sheaf Kiehl
comparison and higher-cohomology vanishing on these intersections, before and after
this quotient. Then the ordered Čech complex (one term per strictly increasing
set of indices) `C^•(𝔘, ω_𝒰)` is a bounded complex of flat `A_𝒰`-modules with
`C^•(𝔘, ω_𝒰) ⊗_{A_𝒰} A_𝒰/I ≅ C^•(𝔘, ω_{𝒰/I})`, hence
`RΓ(X, ω_𝒰) ⊗^L_{A_𝒰} A_𝒰/I ≅ RΓ(X, ω_{𝒰/I})` with
`E₂^{i,j} = Tor_{−i}^{A_𝒰}(H^j(X, ω_𝒰), A_𝒰/I) ⇒ H^{i+j}(X, ω_{𝒰/I})`, reducing for
projective dimension `≤ 1` to
`0 → H^q(X, ω_𝒰) ⊗ A_𝒰/I → H^q(X, ω_{𝒰/I}) → Tor_1^{A_𝒰}(H^{q+1}(X, ω_𝒰), A_𝒰/I) → 0` (Tor
term `H^{q+1}(X, ω_𝒰)[x]` for `I = (x)`), so `H⁰(X, ω_𝒰)/I → H⁰(X, ω_{𝒰/I})` is not surjective
in general for `X` not affinoid (*derived-coefficient-change*) (the regular-element case is [CHJ] Lemma 2.29,
pp. 22–23; the stated derived form follows by applying derived tensor product to
this bounded flat Čech complex). Prove
that for a tower over a rigid space over `ℚ_p` and a profinite flat `ℤ_p`-module `M` with
continuous `G`-action and `G`-stable open `I_i` with `M/I_i` finite of `p`-power exponent, the
sheaf `V ↦ (M ⊗̂ Ô_X(V ×_X X_∞))^G` (qcqs `V`, diagonal action) is
`ℚ̂_p ⊗_{ℤ̂_p} lim_i (ν^*M̃_i ⊗_{ℤ_p} O⁺_X)`, `M̃_i` the locally constant sheaf of `M/I_i`, almost
at each finite level and exactly after the inverse limit and inverting `p`
(*profinite-module-coefficient-sheaf*) ([CHJ] Lemma 4.1, p. 28). Prove that for an inverse system
`(M_k)` of finite `G`-modules of `p`-power exponent with surjective transitions and
`F_k = ν^*M̃_k ⊗ O⁺_X`, `R^i lim_k F_k` is almost zero for `i > 0`,
and `H^j(U, lim F_k)` is almost zero for
`j > 0` on the basis `U = V ×_X X_∞` with `V` affinoid perfectoid in `X_proét`,
all exact after inverting `p`; and that finiteness of the
`H^i(X_C, M_k)` (as for proper `X_C`) makes `H^i(X_C, M_k) ⊗ O_C` Mittag-Leffler, so cohomology
commutes with the inverse limit (*higher-inverse-limits-vanish-on-towers*) ([CHJ] Proposition 4.4
(proof), pp. 29–30). *Needs for the geometric character and coefficient applications:*
AdicEtaleGeometry A4.2a (*finite-galois-descent-of-modules*); *twisted-character-sheaf*; *weight-extension-of-function-descent*;
*invariants-of-completed-tensor-with-profinite-module*; *profinite-galois-tower*; [P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent);
AdicSpacesPartIV layer R5; DiamondsAndVStacks layer D3; Mathlib `Module.FaithfullyFlat`,
`Algebra.Etale`, `IsGaloisGroup`, `Module.Flat`, `CategoryTheory.Limits.limit`; Tau Ceti
`TauCeti.GaloisDescent.span_invariants_eq_top`.

*ProEtaleSite.higher_inverse_limits_almost_zero* states the positive derived-limit
and higher-cohomology almost vanishing. Check *higher_inverse_limits_sections*
uses Mathlib's `CategoryTheory.preservesLimitIso` for sheaf inclusion followed by evaluation:
`(lim_k F_k)(U) ≅ lim_k F_k(U)` for every inverse system of module sheaves,
without finiteness, surjectivity, or tower hypotheses.

Check *coefficient_change_regular* is the affine regular-element sequence: a flat
`A`-module `M`, a regular `x ∈ A`, and a surjection `q : M → N` with kernel `xM`
give injectivity of multiplication by `x` and exactness at `M`.
Its proof uses `Module.Flat.isSMulRegular_of_isRegular` and `LinearMap.exact_iff`
with the specified kernel; surjectivity supplies the final map of the short exact sequence.
*TwistedCharacterSheaf.coefficient_change_sheaf_regular* states the finite-level
sequence on the twisted sheaves themselves. The finite group order is a unit
in the finite-level function rings (including their rational `p`-inversion),
its action fixes the natural `A`-scalars, these rings are `A`-flat, and the
coefficient-ring surjection has kernel `x` and respects both
action and cocycle. The two sheaf morphisms are specified on sections as
multiplication by `x` and coefficient specialization. They form a short exact
sequence of sheaves, and an injective/exact/surjective sequence on every object
where these coefficient-ring hypotheses hold. Transport through
*TwistedCharacterSheaf.finite_comparison*, with the frame specialized by the
coefficient map, gives the tower sequence and its `H⁰(X_w,·)` sequence. For
local finite-level decompositions, the sheaf sequence is local; surjectivity
on the whole affinoid uses the coefficient Kiehl acyclicity specified above
([CHJ] 2.29, pp. 22–23).

*derived_coefficient_change_regular* retains the regular-element calculation
for flat complexes. *ProEtaleSite.derived_coefficient_change* states the
arbitrary-ideal comparison on `AdicEtaleGeometry.AdicSpace.ProEtaleSite X hX`
for a locally noetherian analytic `X`, with its supplied topology. The module
sheaves are identified with *TwistedCharacterSheaf.sheaf*, with specialization induced by the coefficient
ring-sheaf map. On a finite covering family of subobjects of the terminal
object, every nonempty finite intersection has flat sections, the canonical
quotient by `I`, and zero higher module cohomology before and after quotient.
The scalar actions on the two twisted sheaves agree with the coefficient maps.
These are the acyclic affinoid-cover hypotheses above; subobjects ensure that
the ordered Čech model has no repeated-index terms. The statement supplies a
flat complex in degrees `0,…,n−1` quasi-isomorphic to the section complex of
an injective resolution. It gives the isomorphism for Mathlib's total left
derived tensor functor. Its bounded model has a tensor comparison which is a
quasi-isomorphism and whose composite with `s ↦ s ⊗ 1` agrees with the
specialization map in the derived category. The `E₂` page with `i ≤ 0` is
`Tor_{−i}(H^j, A/I)` and is zero for `i > 0`. A finite filtration of the actual
*moduleCohomology* of the specialized sheaf gives convergence, and the stable
page vanishes in negative total degree. The differential is
`(i,j) ↦ (i+r,j-r+1)`. When all `Tor_r(−,A/I)` vanish for `r ≥ 2` (in
particular when `A/I` has projective dimension at most one), it gives the
short exact sequence above, with first map `s ⊗ ā ↦ a·H^q(π)(s)`.
This is the bounded-flat Čech consequence of the coefficient and acyclicity
hypotheses. The tensor-resolution argument is [GR] §2.4.10, p. 24;
[GR] 2.4.17, p. 25 uses its hyper-Tor spectral sequence on a two-term
complex. Finite open covers in the pro-étale site provide the required
covering families of subobjects.

Auxiliary exactness calculations are *coefficient_change_unit* (multiplication by one and the zero quotient
are exact), *coefficient_change_zero_not_regular* (zero is not regular in `ℤ`),
and *coefficient_change_two* (multiplication by two on `ℤ` is injective with
cokernel `𝔽₂`). *derived_cohomology_two_terms* computes the actual cohomology
modules of `ℤ --2→ ℤ` and `𝔽₂ --0→ 𝔽₂`, linked by the
cochain map whose two nonzero components are reduction modulo two. It verifies
surjectivity and the kernel `2K` in every degree, then computes degrees zero and one:
`(0,𝔽₂)` and `(𝔽₂,𝔽₂)` respectively. It also identifies
`Tor₁(H¹(K),𝔽₂)` with `H⁰(Q)`: the spectral-sequence entry `(-1,1)`
contributes to degree zero. It tests the same index as *derived_two_term_tor*
on the cochain-complex carrier.

*FiniteTowerCoefficients* records finite modules of `p`-power exponent,
surjective transitions, continuous monodromy, and their étale local systems.
Their trivializations on the cover commute with restriction and transitions.
Deck pullback uses the inverse group element for the left monodromy action.
The completion used in *profinite_module_coefficient_sheaf* is the limit of the
finite tensor products; the diagonal action is determined by every projection.
The finite-level comparison is almost, and the limit comparison becomes an
isomorphism after inverting `p`, on the affinoid perfectoid basis ([CHJ] Lemma 4.1).
(*rational-profinite-module-coefficient-sheaf*)
*profinite_module_coefficient_sheaf_rational* states the rational comparison over
`ℚ_p` itself, with the specified `ℤ_p` scalar map; the almost comparison uses
the base change to `ℂ_p`.
(*finite-cohomology-commutes-with-inverse-limits*)
*finite_cohomology_tensor_mittagLeffler* supplies stabilized images for the
finite cohomology groups. *finite_cohomology_commutes_limit* uses their almost
comparison with integral coefficient cohomology to remove the Milnor term,
as in the proof of [CHJ] Proposition 4.4, pp. 29–30.

**Checks.** *FiniteTowerCoefficients_zero* is the zero system;
*FiniteTowerCoefficients_constant* realizes a finite constant module for trivial
monodromy; *FiniteTowerCoefficients_torsionfree* excludes a `ℤ_p` stage.

Lean: `finite_character_comparison_linear` (multiplication by `u`, linear over a common scalar
ring) and `finite_character_line` (finite projective of rank one at every prime). The additive
form, the restriction and coefficient-change compatibilities, the sheaf statements,
the gluing and reconstruction outputs, approximation of units, the integral counit,
coefficient change and the inverse-limit statements are README only.

### P9.11 sheaf equalizers after coefficient base change

**Smoothoid charts and degree-zero structure-sheaf comparisons.**
For a perfectoid field `K` of mixed characteristic, define *WeightExtension.IsSmoothoid*
on analytic adic spaces over `Spa(K,K⁺)` by existence of an open cover whose members
admit smooth maps to perfectoid spaces over `K` ([Heuer] Definition 2.2, p. 8).
Supply restriction to opens, étale stability, gluing of such covers, and the instances
for perfectoid spaces and smooth rigid spaces over `K`. Smooth charts use
AdicEtaleGeometry A2's ball-chart convention. Define
*WeightExtension.smoothoidEtaleEquivalence*, an equivalence `X_et ≌ (X^◇)_et`, by specialising
DiamondsAndVStacks D6.5's `PreAdic.diamond_etale_equivalence` to the analytic Yoneda
carrier of a smoothoid `X`. Transport its analyticity and the structure map
`X → Spa(K,K⁺) → Spa(ℤ_p,ℤ_p)` through `CategoryTheory.ULiftHom.up`, and take the
inverse of the supplied diamond-to-analytic equivalence. On objects and maps it sends
`U → X` to `U^◇ → X^◇`, retaining pullbacks and preserving and reflecting covering
families, including the empty family ([ECD] Lemma 15.6, p. 91).
Supply the natural unit isomorphisms
*WeightExtension.smoothoidIntegralComparison*, an isomorphism `O⁺ ≅ ν_*O⁺`, and
*WeightExtension.smoothoidRationalComparison*, an isomorphism `O ≅ ν_*O`, for
`ν : X^◇_v → X_et` ([Heuer] Lemma 2.6(2)–(3), p. 9, and Proposition 2.9(2), p. 10,
in degree zero). The rational comparison is local on toric smooth charts: Lemma 2.5
supplies their smooth rigid Cartesian presentation and degree zero gives `g^*O_Z = O_X`.
Include the toric-chart refinement and that presentation in this comparison's API
([Heuer] Definitions 2.1–2.4 and Lemma 2.5, pp. 8–9). Both comparison maps are pullback
of functions, commute with restriction and étale pullback, and preserve the integral
inclusion. *Needs:* AdicEtaleGeometry A1 (étale sites) and A2 (smooth charts);
AdicSpacesPartIV R5.5 (*perfectoid-times-smooth-fibre-product*);
PerfectoidSpaces P3.17a.4 (sousperfectoid charts);
DiamondsAndVStacks D2 (v-sheaves and structure sheaves), D6.4 (diamondification) and
D6.5 (`PreAdic.diamond_etale_equivalence`).

**Checks.**

- *smoothoid_perfectoid_point* — `Spa(K,K⁺)` has the identity smooth chart; the site
  equivalence is the transported inverse of D6.5's equivalence and retains its étale
  objects; the two unit maps identify sections with `K⁺` and `K`.
- *smoothoid_empty* — the empty cover makes the empty space smoothoid; its étale
  site is the empty-space site, the site equivalence preserves and reflects the empty
  covering family, and both comparisons give the zero section rings.
- *smoothoid_disc* — the ordinary disc over `K` is smoothoid via its smooth map to
  `Spa(K,K⁺)`, although it is not perfectoid. The étale equivalence retains its rational
  annulus `|π| ≤ |T| ≤ 1`, for a pseudouniformizer `π ∈ K`; the two comparisons
  identify the analytic sections on this
  annulus, including their integral subring, with the corresponding v-site sections.
  Restriction of `T` and `π/T` is the same under both maps. This tests the comparisons
  beyond a perfectoid chart.

**Sheaf equalizers after smooth coefficient base change.** (*weight-extension-sheaf-equalizer*)
Let `K` be a perfectoid field of mixed characteristic, `Y` an affinoid smooth rigid or affinoid
perfectoid space over `K`, `X → Y` an affinoid perfectoid pro-étale profinite `Γ`-torsor, and `𝒰`
a smooth rigid space over a perfectoid extension of `K`; the fibre products are the sousperfectoid
spaces of PerfectoidSpaces P3.17a.4, with smooth products supplied by AdicSpacesPartIV R5.5. For `h_𝒰 : X ×_K 𝒰 → Y ×_K 𝒰`: `(h_𝒰* O)^Γ = O` and
`(h_𝒰* O⁺)^Γ = O⁺` as sheaves on the whole product, i.e. on every open of `Y ×_K 𝒰`, with
invariants of sections of its full preimage. This is stronger than
*weight-extension-of-function-descent*, which gives the equalities on product affinoids only, and
these are not a basis (on the bidisc no product-open neighbourhood of the Gauss point of the
diagonal lies in the rational domain `|T − S| ≤ |π|`, P9.7).
Name the sheaf comparisons *WeightExtension.structureSheafEqualizer* and
*WeightExtension.integralStructureSheafEqualizer*, with exactly the hypotheses above.
Check *WeightExtension.rationalSectionsEqualizer* combines the rational equalizer
and the boundedness-reflection clause of these two theorems when the chosen open is affinoid.
It applies in particular to every rational subdomain of an affinoid product chart of
`Y ×_K 𝒰`, with sections on its full preimage in `X ×_K 𝒰`. These rational subdomains
form a basis; the sheaf comparisons include compatibility with restriction.
For the integral comparison, use surjectivity on points to reflect the condition `|f| ≤ 1`.
When `Y` is smooth rigid, the completed-structure-sheaf comparison is [KL16]
Theorem 8.2.3, pp. 162–163. For perfectoid `Y`, *WeightExtension.IsSmoothoid*
applies to the product with a smooth space: it is smooth over a perfectoid space, also after extending the perfectoid base field. Use [Heuer] Definition 2.2, p. 8,
and the preceding *smoothoidEtaleEquivalence* and *smoothoidIntegralComparison*
([Heuer] Lemma 2.6(2)–(3), p. 9). The latter identifies the integral structure sheaf on
the étale site with the pushforward from the diamond's v-site. The base-changed
torsor is a v-cover, so the v-sheaf equalizer gives integral descent on each rational
open and commutes with restriction. Proposition 2.9(2), p. 10, in degree zero
gives *smoothoidRationalComparison* on smooth charts over a perfectoid base. Applying
the same v-sheaf equalizer and gluing gives both comparisons on every analytic open. The same argument applies
to smooth rigid `Y`, which is smoothoid over `K`. This supplies the rational-open
step in [BHW] Lemma 3.7, p. 10; no product-open basis assertion is used.
For `Γ = {1}` these maps are identities on all opens; for finite `Γ` they are finite
étale descent after base change. *Needs:* *weight-extension-of-function-descent*;
*completed-structure-sheaves*; AdicSpacesPartIV layer R5
(*perfectoid-times-smooth-fibre-product*, for the product charts);
DiamondsAndVStacks layer D2; the preceding *WeightExtension.IsSmoothoid*,
*WeightExtension.smoothoidEtaleEquivalence*, *WeightExtension.smoothoidIntegralComparison*
and *WeightExtension.smoothoidRationalComparison*.

*WeightExtension.boundedFunctions* is the subring of functions whose restriction
to each sheafy affinoid chart belongs to its plus ring. The Checks
*boundedFunctions_affinoid*, *boundedFunctions_empty* and
*boundedFunctions_inverse_parameter* identify this with the specified plus ring,
give the whole zero ring on the empty space, and exclude the inverse of a
topologically nilpotent unit on a nonempty affinoid. The three equalizer
statements quantify over an arbitrary open immersion into the product and its
full pullback along the given torsor, so they commute with further restriction.

Lean: README only.

### P9.12 function descent over a seminormal base

**Function descent over a seminormal rigid base.** (*function-descent-seminormal-base*) Let `K`
be a complete nonarchimedean field of mixed characteristic, `Y` a seminormal rigid analytic space
over `K` (seminormality as in [KL16] Definition 3.7.1), and `X_∞ → Y` a pro-étale `G`-tower with
perfectoid limit. Then `O_Y = (h_* O_{X_∞})^G` and `O⁺_Y = (h_* O⁺_{X_∞})^G` on analytic opens, by the argument
of *function-descent-along-tower* (P9.6) with Kedlaya–Liu's comparison `O_Y ≅ ν_* Ô_Y` for
seminormal `Y`, in its full field range, supplied by DiamondsAndVStacks D6.9 ([KL16] Theorem
8.2.3 and proof, pp. 162–163), in place of
Scholze's smooth comparison; P9.6 is the case of a smooth base over a discretely valued field with
perfect residue field, and the seminormal generality over an arbitrary `K` of mixed characteristic
is what is added. *Needs:* *function-descent-along-tower*; *cech-descent-datum*;
*completed-structure-sheaves*; DiamondsAndVStacks D6.9.

The affine criterion is DiamondsAndVStacks' ring predicate
`TauCetiRoadmap.DiamondsAndVStacks.IsSeminormalRing` (D6.9): `A` is reduced and every pair with
`x² = y³` has a unique `z` with `x = z³`, `y = z²` ([KL16] Definition 1.4.1, p. 19; Remark 3.7.3,
p. 80). With the variables renamed this is Kedlaya–Liu's common root `c² = a`, `c³ = b` for
`a³ = b²`, and in a reduced ring such a root is unique. A field and a product of two fields
satisfy it; the dual numbers over `ℚ` do not, being nonreduced. The seminormal-base function
descent below applies this predicate to the ring of every affinoid chart. Its rational
map has precisely the invariant functions as image; its integral clause reflects
membership in the plus ring on all affine charts. Applying the same statement to
open subspaces gives the sheaf comparison.

This theorem is the tower application of DiamondsAndVStacks D6.9, which owns the foundational
comparison `O_X ≅ ν_* Ô_X` for seminormal rigid spaces and the full faithfulness of
diamondification. The geometric theorem `Rigid.diamond_hom_bijective` there uses
`O_X ≅ ν_* Ô_X` directly, as in [Berkeley] Proposition 10.2.3 and proof,
p. 78 (PDF p. 88), and [KL16] Theorem 8.2.3, pp. 162–163. Here
*function_descent_seminormal* combines that direct comparison with the
Čech self-product of *ProetaleGaloisTower* to identify fixed functions and
reflect integral sections; it supplies tower fixed sections, not the comparison itself.

Lean: README only.

### P9.13 integral effectivity in finite rank

**Integral effectivity in arbitrary finite rank.** (*integral-matrix-coboundary-effectivity*) Let
`h : X_∞ → X` be a pro-étale `G`-tower with actual `O⁺` function descent as in
*function-descent-along-tower*. Let `N⁺` be a locally free finite-rank `O⁺_{X_∞}`-module with
continuous semilinear `G`-action. Suppose `X` has an open cover `U_i` such that `N⁺` on `h⁻¹U_i`
is free of rank `r_i` and, in a chosen integral frame, its action is `v ↦ C_i(g)g(v)`, with
`C_i(g) ∈ GL_{r_i}(O⁺(h⁻¹U_i))` satisfying `C_i(gh) = C_i(g)g(C_i(h))`. Assume there is
`P_i ∈ GL_{r_i}(O⁺(h⁻¹U_i))` with `C_i(g)g(P_i) = P_i` for all `g` (`P_i` and its inverse both
integral). Then `E⁺ = (h_* N⁺)^G` is locally free of rank `r_i` over `O⁺_X` and the canonical map
`h⁻¹E⁺ ⊗ O⁺_{X_∞} → N⁺` is an isomorphism; these comparisons glue and are compatible with
morphisms. Conversely, if this map is an isomorphism from a locally free descended `E⁺`, such
invariant integral frames exist after a cover of `X`. Thus an integral coboundary is the exact
local effectivity condition; a rational coboundary alone is insufficient (rank one is [BHW]
Theorem 4.8, proof, p. 18; the finite-rank matrix form is proved here). Prove the integral fixed points of completed lattice tensors: with `K, E, F, V, G`
and `J` as in *invariants-of-completed-tensor-with-banach-space*, `O = K°`, `π ∈ O` with
`0 < |π| < 1`, bounded open `O`-lattices `E₀ ⊆ E` (`G`-stable) and `V₀ ⊆ V`, and `F₀ = E₀ ∩ F`,
assume in addition that `V₀` is topologically `O`-linearly isomorphic to the `π`-adic
completion of `⊕_{i∈I} O`, for a specified set `I`. Then the canonical map `completion_π(F₀ ⊗_O V₀) → completion_π(E₀ ⊗_O V₀)^G` is a topological
`O`-linear isomorphism, natural in maps preserving the lattices; for a uniform algebra with its
spectral norm (`E₀ = A_∞°`, `F₀ = A°`) this is the integral coefficient comparison, with no
identification of a completed lattice with the unit ball of a projective tensor norm
(*invariants-of-completed-lattice-tensor*) (the coordinatewise argument of [CHJ] Lemma 2.23(2), pp. 19–20,
applied to the specified integral basis). Both completions are the families in `E₀`
(resp. `F₀`) tending to zero `π`-adically; invariance is checked in each coordinate.
The hypothesis on `V₀` is essential to this argument and is not inferred merely from
countable type of the rational Banach space `V`. *Needs:* *function-descent-along-tower*; *descent-of-finite-locally-free-modules*;
AdicSpacesPartII layer R0; AdicSpacesPartIV layer R5; Mathlib `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`,
`AdicCompletion.map_surjective`.

The affine integral-frame statement is `integral_matrix_coboundary_effectivity`:
for any commutative ring with a group action, matrices `C(g)` and an
invertible integral frame `P` with `C(g)g(P) = P`, every invariant vector has a
unique expression `Pa` with invariant coefficients `a`. The frame equation forces
`C(g) = P·g(P)⁻¹`, so the cocycle identity `C(gh) = C(g)g(C(h))` is a consequence and is not
a hypothesis; the proof takes `a = P⁻¹v`, for which `g(a) = P⁻¹C(g)g(v) = a`. The auxiliary calculation
*matrix_rank_zero* computes the unique empty vector, and *matrix_rank_two* verifies
two rational matrix products. Neither instantiates this effectivity theorem.
*twisted_sheaf_eigenunit* gives the rank-one sheaf comparison. Gluing integral frames
gives the locally free sheaf comparison above.

*ProEtaleSite.invariant_subsheaf* constructs the unique module subsheaf with
sections fixed by the specified action. For the scalar-restricted pushforward
of `N⁺`, this is exactly `E⁺ = (h_*N⁺)^G`. Its construction-specific Checks are
*invariant_subsheaf_zero* (the zero module sheaf has zero invariant subsheaf),
*invariant_subsheaf_trivial* (a trivial action gives the whole module sheaf), and
*invariant_subsheaf_swap* (for `N = F ⊕ F` with the two factors swapped, the
invariant subsheaf consists exactly of `(s,s)` on every object, and its restrictions
are diagonal restrictions of `F`).
*ProEtaleSite.integral_matrix_sheaf_effectivity* states the global equivalence:
`E⁺` is locally free of finite type and its canonical map `h^*E⁺ → N⁺`
is an isomorphism if and only if invariant integral bases exist on a cover
of the base. The two sites and their inverse-image functor satisfy the
finite-limit, continuity and covering hypotheses of P9.8. It assumes sectionwise injectivity and actual fixed-ring
identification for `O⁺_X → h_*O⁺_{X_∞}` and a semilinear sheaf action on
`N⁺`. A local basis is specified on every object of the covering-site slice
over the inverse image of the cover member, commutes with every restriction,
and is invariant on that inverse image. The affine matrix condition
`C(g)g(P)=P` supplies exactly these bases in a chosen frame. The comparison is
the adjoint of the invariant-subsheaf inclusion, so the local comparisons glue;
the Hom comparison in P9.8 supplies compatibility with morphisms. The converse
pulls back a local basis of `E⁺`. This is the formal sheaf form of the integral
frame criterion above; it requires both a frame and its inverse over the
integral coefficient ring, with no inversion of the residue characteristic.

The algebraic completed-lattice map is *invariants_completedLatticeTensor*, using
Mathlib's `AdicCompletion.map`. Its coefficient ring is a domain complete for a
nonzero nonunit `π`, its lattice `E₀` is torsion-free and `π`-adically complete,
and the specified basis identifies `V₀` with `completion_π(⊕ O)`.
It states injectivity and equality of the image with fixed tensors. These
hypotheses apply to the bounded open lattices above, including nondiscretely
valued `K`; no discrete valuation ring hypothesis is imposed on this comparison.
Torsion-freeness ensures `F₀ ∩ π^nE₀ = π^nF₀`, so the coordinate argument uses
the correct topology on the fixed lattice.

Lean: `integral_matrix_coboundary_effectivity`, the affine integral-frame statement. The sheaf
statements *ProEtaleSite.invariant_subsheaf* and *ProEtaleSite.integral_matrix_sheaf_effectivity*,
the completed-lattice comparison *invariants_completedLatticeTensor* and the auxiliary
calculations are README only.

### Examples

The algebraic Checks below test AdicEtaleGeometry A4.2a's `IsGaloisExtension` on the
finite-level rings used in P9.10; the auxiliary coefficient calculations concern P9.10 and
P9.13. All are specified in this README only.
Entries marked auxiliary do not count as Checks of a roadmap definition:

- *galois_trivial_action* — a nontrivial finite group acting trivially on a nonzero
  ring `B = A` has a diagonal Galois map and is not Galois.
- *galois_two_terms* — write `e₁ = (1,0)`, `e₂ = (0,1)`. Evaluated at `(1,σ)`,
  the Galois map sends `e₁ ⊗ e₁` to `(e₁,0)` and `e₁ ⊗ e₂` to `(0,e₁)`.
  This pins which tensor factor receives the action.
- *galois_nonfaithful_invariants* — if `A₁ → B₁` is finite étale with a bijective
  Galois map, factoring the scalars through `A₁ × A₂ → A₁`, with `A₂ ≠ 0`, still
  makes every invariant come from the base, but the scalar map is not injective.
- *nonfaithful_base_change* (auxiliary calculation) — projection `𝔽₂ × 𝔽₂ → 𝔽₂` kills `e₂`; it is not
  injective, although its Galois map for the trivial group is bijective.
- *integral_matrix_nonunit* (auxiliary calculation) — for `p` prime, including `p = 2`, the fixed lattice
  of `−star` on `ℤ[√p]` is `√p·ℤ`, and `(√p)` is proper. After base change to
  `ℤ_p` this shows why an invariant rational frame does not imply integral effectivity.
- *matrix_rank_two* (auxiliary calculation) — over `ℚ × ℚ` with its swap, write a rank-two frame as
  `P = (diag(1,2), diag(2,1))`. Its cocycle is
  `C(σ) = (diag(1/2,2), diag(2,1/2))`; the two component equations
  `C₁P₂ = P₁`, `C₂P₁ = P₂` compute `C(σ)σ(P) = P`.
- *averaging_two_terms* (auxiliary calculation) — for the swap on `ℚ × ℚ` with `c(σ) = (1/2,2)`,
  the average of the twisted action `c(σ)σ` sends `(1,0)` to `(1/2,1)` and `(0,1)`
  to `(1/4,1/2)`, both on the invariant line generated by `(1,2)`.
- *derived_two_term_tor* (auxiliary calculation) — multiplication by two is injective
  on `ℤ` and zero on the nonzero ring `𝔽₂`. The Check states these elementwise
  facts. The cohomology and Tor computations, including the `q+1` convention in the
  coefficient-change sequence, are stated on complexes in *derived_cohomology_two_terms*.

The geometric examples are
the `ℤ_p(1)`-tower of the perfectoid torus over `ℂ_p`, with `O(X_∞)^G = O(X)`,
`ω_c = T^{k/pⁿ}·O_X` for the finite-order character, and `T^{1/p^k}` a unit at level `k`; the
trivial torsor `Y × \underline{Γ} → Y`; the swap action on `K × K`, with no averaging in residue
characteristic `2`; the cyclotomic tower of `Spa(ℚ_p)` with `c = χ_cyc^{-1}`, whose equalizer
vanishes by Tate; `ℚ_p(√p)/ℚ_p` for `p` odd, where the rational eigenfunction `√p` is not an
integral unit, so the integral counit fails although the invariants are free of rank one; the
rational domain `|T − S| ≤ |π|` on the bidisc as a non-product open, containing the Gauss point of
the diagonal, which has no product-open neighbourhood inside it; the integral sheaf on the closed
unit disc over `ℚ_p` with global sections `(p, T)`, locally free of rank one but with
non-projective global sections; the `χ`-eigensheaf of `[p]_*O_E` on an elliptic curve with good
reduction, a nonzero line bundle with zero global sections; and the
non-seminormal cusp algebra `K⟨t², t³⟩`.

### Dependencies

Layer [P0](../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup) ([P0.5](../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup)); layer [P1](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts) ([P1.31](../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts)); layer [P2](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces) ([P2.7](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces), [P2.8](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces), [P2.17](../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces)); layer [P3](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site) ([P3.21](../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site)); layer [P5](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent) ([P5.1](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent),
[P5.3](../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent)); layer [P6](../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms) ([P6.14](../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms)); PerfectoidSpaces P7.16 (the affinoid perfectoid objects of Scholze's site); layer [P7](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers) ([P7.1](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers), [P7.2](../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers),
*tilde-limit-etale-base-change*); layer P8 (finite étale torsors of free actions; the scalar-extension
lemma P8.7); AdicEtaleGeometry layer A1 (the pro-étale site, with the finite-level pro-objects of
A1.12) and A4.2–A4.5, A4.2a and A4.7 (torsor towers, finite Galois module descent and
their completed self-products); PerfectoidSpaces P1.32, P3.17a–P3.17b and P6.15–P6.17; AdicSpacesPartII layer R0; AdicSpacesPartIII layer R3; AdicSpacesPartIV R4 and R5.5–R5.11 (in P9.10, the
`coefficient-sheaf-kiehl` branches and `affinoid-weight-coefficient-sheaf`); DiamondsAndVStacks
layers D2 (D2.5, and D2.9 for the vector-bundle comparison), D3 (D3.10) and D6 (D6.9 for the
seminormal comparison); ProfiniteCohomology Layer 3 (the discrete cochain comparison
extended in P9.0); the Tau Ceti and Mathlib declarations named in the *Needs*
clauses above.

## Downstream consumers

Perfectoid Shimura varieties and period spaces use the following tower forms, supplied here, of
the foundational comparisons of DiamondsAndVStacks D2.9 and D6.9:

- P9.8 supplies `finite_projective_sections_descent` and
  *ProEtaleSite.finite_locally_free_hom_descent* for sections and morphisms
  of bundles pulled back along a prescribed tower. Effectivity uses the
  additional hypotheses in P9.10 and P9.13.
- P9.12 supplies *function_descent_seminormal* on *ProetaleGaloisTower*
  over a base whose affinoid chart rings satisfy DiamondsAndVStacks' `IsSeminormalRing`. It gives
  the tower form of the function comparison used in seminormal rigid
  geometry.

The site equivalences of D2.9 and the seminormal comparison and geometric full faithfulness of
D6.9 belong to DiamondsAndVStacks, with their direct proofs from [KL16] and
[Berkeley]; their affinoid perfectoid basis is supplied by PerfectoidSpaces P7.16, and
DiamondsAndVStacks does not consume these tower statements.

These consumers also use the finite quotients of good towers,
closed perfectoid loci, and descent of functions, modules and character sheaves with weight-space
coefficients in P8–P9. Their diamond interpretations use DiamondsAndVStacks' sites,
presentations, spatiality, limits and D6.4 diamondification together with these tower results.

## References

Locators are theorem and section numbers of the linked versions, with page numbers of the linked manuscripts where they are stable.

- [GR] Ofer Gabber and Lorenzo Ramero, Almost ring theory, LNM 1800 (2003); arXiv:math/0201175v3. https://arxiv.org/abs/math/0201175.
- [Sch12] Peter Scholze, Perfectoid spaces, Publ. IHÉS 116 (2012); arXiv:1111.4914. https://arxiv.org/abs/1111.4914.
- [ECD] Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4. https://arxiv.org/abs/1709.07343.
- [Berkeley] Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, author manuscript dated 27 March 2020. https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf.
- [KL I] Kiran S. Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations, Astérisque 371 (2015); arXiv:1301.0792v5. https://arxiv.org/abs/1301.0792v5.
- [KL16] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory, II: imperfect period rings, arXiv:1602.06899v3. https://arxiv.org/abs/1602.06899.
- [Heuer] Ben Heuer, Moduli spaces in p-adic non-abelian Hodge theory, arXiv:2207.13819v2. https://arxiv.org/abs/2207.13819v2.
- [Sch13] Peter Scholze, p-adic Hodge theory for rigid-analytic varieties, Forum Math. Pi 1 (2013); arXiv:1205.3463v2. https://arxiv.org/abs/1205.3463.
- [Sch13E] Peter Scholze, Erratum to 'p-adic Hodge theory for rigid-analytic varieties'. https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf.
- [HK] David Hansen and Kiran Kedlaya, Sheafiness criteria for Huber rings. https://kskedlaya.org/papers/criteria.pdf.
- [Wedhorn] Torsten Wedhorn, Adic spaces, arXiv:1910.05934v1. https://arxiv.org/abs/1910.05934.
- [Torsion] Peter Scholze, On torsion in the cohomology of locally symmetric varieties, Ann. of Math. 182 (2015); arXiv:1306.2070v2. https://arxiv.org/abs/1306.2070.
- [SW13] Peter Scholze and Jared Weinstein, Moduli of p-divisible groups, Camb. J. Math. 1 (2013); arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357.
- [BHW] Christopher Birkbeck, Ben Heuer and Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties, Ann. Inst. Fourier (2023); arXiv:1902.03985. https://arxiv.org/abs/1902.03985.
- [CHJ] Przemysław Chojecki, David Hansen and Christian Johansson, Overconvergent modular forms and perfectoid Shimura curves, Doc. Math. 22 (2017); arXiv:1507.04875. https://arxiv.org/abs/1507.04875.
- [HJ] David Hansen and Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures, arXiv:2011.03951v2. https://arxiv.org/abs/2011.03951v2.
- [Hansen] David Hansen, Quotients of adic spaces by finite groups, Math. Res. Lett. 28 (2021); author manuscript. http://davidrenshawhansen.net/adicgpquotient.pdf.
- [CGJ] Ana Caraiani, Daniel Gulotta and Christian Johansson, Vanishing theorems for Shimura varieties at unipotent level, J. Eur. Math. Soc. (2022); arXiv:1910.09214. https://arxiv.org/abs/1910.09214.
- [BS22] Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology, Ann. of Math. 196 (2022); arXiv:1905.08229v4. https://arxiv.org/abs/1905.08229.
- [Hub96] Roland Huber, Étale cohomology of rigid analytic varieties and adic spaces, Aspects of Mathematics E30, Vieweg (1996); §5.1 (taut spaces), Lemmas 5.3.4 and 8.1.5.
- [Rubin] Karl Rubin, Euler systems, manuscript notes for the 1999 Arizona Winter School, https://swc-math.github.io/aws/1999/99RubinES.pdf; Appendix B, §2, pp. 151–152 (the page and numbered locators refer to this edition, not to the published Annals of Mathematics Studies 147 (2000), where Appendix B begins on p. 195).

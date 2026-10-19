# Roadmap: complex comparison, part II — coherent, de Rham–Betti and étale comparison

**Summary.** This roadmap compares complex algebraic geometry with complex analytic geometry and
classical topology, for coherent, de Rham and étale coefficients. It builds the
analytic-space extension of RealAnalyticGeometry R3.2's coherent module category and the exact
analytification functor into it; computes coherent analytic cohomology using supplied analytic inputs
(Dolbeault's lemma, RealAnalyticGeometry R3.1's weighted `∂̄`-estimate, Cartan's theorem B on strongly 1-complete spaces,
Cartan–Serre finiteness, and Serre's analytic generation and vanishing on projective space); states
the consequences of coherent GAGA that arithmetic consumers use (projection and base change,
ideal, section and line-bundle dictionaries, coherent descent on algebraic spaces and derived GAGA);
proves Remmert's proper mapping theorem, the Remmert–Stein closure theorem and Chow's theorem with
nilpotents, and with them the algebraicity of holomorphic maps out of proper schemes and the
connectedness comparison for affine curves; and compares algebraic de Rham cohomology with singular
cohomology — for proper smooth schemes (Grothendieck), in proper smooth families (Gauss–Manin,
Katz–Oda), with Hodge theory (harmonic forms on compact Kähler manifolds, the pure Hodge structure
of a proper smooth scheme, Deligne's relative Hodge theorem), with integration over analytic cycles
and the Chern normalisation, for regular singular connections (Deligne's Riemann–Hilbert equivalence
and nonproper comparison), and for proper log-smooth schemes over the standard log point (Kato's
logarithmic structures and the logarithmic monodromy triangle). It also uses scheme
compactifications over qcqs bases and their coherent refinement API to build stratified topology and finite
cover comparison for complex schemes, and ordinary, compact-support, relative and integral/rational
adic Artin comparison for constructible coefficients.

Finite-coefficient ordinary and compact-support comparison are supplied by
ComplexComparisonPartII §§C6.3–C6.4 / `artinComparison`, `artinComparisonCompactSupport`;
coherent GAGA and de Rham comparison have their own coefficient categories and canonical maps.
ComplexKahlerGeometry K2–K4 supplies convergent germs, Weierstrass preparation and division,
primitive Oka relations, local Dolbeault theory and native holomorphic bundle sheaves, using
GlobalHolomorphicFunctions GH0.3 for scalar local analysis. §§C−1.1–C−1.3 extend those inputs to
complex analytic spaces with nilpotents, scheme and space analytification, and flat analytic
stalk comparisons. Projective and proper coherent
GAGA are proved in §C1.9 after the analytic cohomology inputs. §§C3.2a–C3.2g build intrinsic
quasi-coherent derived limits from shared ringed-site limits, proper-support effectivity,
coherent-sheaf and Picard algebraicity, Picard components
and their formal parameter interface on the algebraic carriers supplied by
AlgebraicModuliForArithmeticGeometry.
Every object keeps its nilpotents and every comparison is a named canonical map (pullback,
exchange, integration, residue, coefficient change), so that an arithmetic application can identify
its own sections, residues, periods and monodromy through those maps rather than through
unlabelled dimension counts.

The layers are C−1–C6:

| Layer | Title | Headline targets |
| --- | --- | --- |
| C−1 | Analytic local foundations | `HolomorphicStructureSheaf`, `ComplexAnalyticSpace`, `complexSchemeAnalytification`, `complexSpaceAnalytification`, `completedAnalyticStalkComparison`, `sncPolydiscChart` |
| C0 | Coherent analytic modules and coherent analytification | `CoherentAnalyticModule`, `coherentOperations`, `CoherentAnalyticIdeal`, `holomorphicBundleDictionary`, `CoherentAnalytification`, `HigherImageComparison`, `fibreDimensionLoci`, `analyticEtaleDescent`, `SpaceCoherentAnalytification` |
| C1 | Analytic coherent cohomology | `localDolbeault`, `weightedDolbeaultEstimate`, `cartanTheoremA`, `cartanTheoremB`, `schwartzFiniteness`, `cartanSerreFiniteness`, `AnalyticTwist`, `analyticTwistCohomology`, `analyticSerreGeneration`, `analyticSerreVanishing`, `projectiveComplexGaga`, `properSchemeGagaEquivalence`, `properSpaceComplexGaga` |
| C2 | Projective and proper consequences of coherent GAGA | `gagaBaseChange`, `projectiveGeometricDictionaries` |
| C3 | Algebraic spaces: derived GAGA | `spaceQuasiCoherator`, `pseudoCoherenceDetection`, `spaceDerivedLimits`, `strongProperSupportExistence`, `cohStack_algebraic`, `relative_picard_algebraicSpace`, `picardZeroCriterion`, `picardParameter_formalEquiv`, `derivedGagaProperSpace` |
| C4 | Analytic images, Chow algebraization and morphism comparison | `remmertProperImage`, `remmertSteinExtension`, `projectiveChowNonreduced`, `properSupportAlgebraization`, `properSourceMorphismAlgebraicity`, `affineCurveConnectedness` |
| C5 | de Rham–Betti comparison, Hodge theory and logarithmic comparison | `AlgebraicDeRham`, `holomorphicPoincare`, `sheafSingularComparison`, `properDeRhamBetti`, `GaussManin`, `relativeHodgeBundles`, `kaehlerHodgeDecomposition`, `properPureHodge`, `AnalyticCycleIntegration`, `LogStructure`, `logChartCriterion`, `deligneRiemannHilbert`, `regularSingularDeRhamComparison`, `properLogGagaMonodromy` |
| C6 | Stratified topology, Riemann existence and finite/adic Artin comparison | `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `adicArtinComparison` |

## Scope and ownership

The roadmap owns C−1's extension of supplied manifold local algebra to analytic spaces with
nilpotents and their analytification, proper coherent GAGA of C1.9,
and the algebraicity and component targets of C3.2a–C3.2g, as well as the analytic-space descent
of RealAnalyticGeometry R3.2's coherent module interface and operations; coherent
ideals and their nilpotent quotients; the identification of ComplexKahlerGeometry K4's
bundle–sheaf dictionary with this coherent category, including locally varying finite rank; the analytification functor on coherent algebraic modules with its
faithfulness and its tensor, Hom, dual and determinant comparisons; the canonical exchange map for
higher direct images; the Cartan–Remmert fibre-dimension loci. The comparison of the supplied Dolbeault resolution with this coherent category, the
complex-geometric transports of RealAnalyticGeometry R3.1's weighted theorem and
R3.2's manifold Cartan A/B to the strongly 1-complete analytic-space setting,
Montel's and Schwartz's theorems, Cartan–Serre finiteness, analytic projective twisting sheaves with their
cohomology, and Serre's analytic generation, vanishing and twist presentations. The base-change and
dictionary consequences of projective GAGA. Coherent analytic descent on étale presentations, the
quasi-coherator of an algebraic space (on AlgebraicModuliForArithmeticGeometry's `spaceDQCoh`),
its intrinsic products and limits obtained from EnhancedDerivedSheaves §§0.1–0.4's ringed-site
enhancement, replacements and coherent limits, Hall's
pseudo-coherence detection and derived GAGA for proper algebraic spaces. Remmert's and
Remmert–Stein's theorems, Chow's theorem with nilpotents, algebraization
with proper support, algebraicity of holomorphic maps from proper sources and of maps with algebraic
graphs, the morphism interfaces for families, and the affine-curve connectedness comparison. In
Layer C5: sheafification of the shared algebraic de Rham complex and the holomorphic de Rham complex, the holomorphic and relative Poincaré
lemmas, the analytic equivalence between flat connections and local systems with holomorphic
parameters, the nilpotent-retaining Artin-base de Rham–Betti comparison, analytification of differential
operators and proper hypercohomology comparison for operator complexes, small singular cochains and the sheaf–singular comparison for arbitrary abelian
coefficients, the proper de Rham–Betti comparison with its multiplicative and integral structure,
the identification of finite locally free holomorphic connections with ComplexKahlerGeometry
K4's carrier and absolute correspondence, the underlying-smooth analytification adapter for
Ehresmann fibrations and Betti local systems, the Gauss–Manin connection and the relative
comparison, the compatibility of supplied compact elliptic/Hodge theory with geometric
comparison maps, pure Hodge structures on proper smooth schemes, Deligne's relative Hodge theorem,
the complementary-form specialization of ComplexKahlerGeometry K5a's bundle tests and distributions
and its current calculus with positivity, mass and local regularization, integration over analytic
cycles, positivity of (1,1)-forms, the integral first Chern class of a holomorphic line bundle
and its integral identification with the shared smooth first Chern class, and the Chern normalisation, sheafification and analytification of
shared ordinary connections,
regular singularities, canonical logarithmic extensions, Deligne's Riemann–Hilbert equivalence and
nonproper comparison, the curve logarithmic and compact-support complexes with residues, and the
specializations and analytic adapters for shared logarithmic structures and de Rham complexes,
split log cotangent transitivity, and the proper logarithmic comparison over the standard log point.

EtaleCohomologyFoundations §§G.1–G.3 owns `Compactification`, `DenseCompactification`,
their category, dense replacement, base change, Nagata existence and common refinements
for separated finite-type maps over qcqs bases, in namespace `TauCeti.AlgebraicGeometry`.
C4.3 uses this geometry with coherent coefficients. The étale support functors are
EtaleCohomologyFoundations §§0.7–0.8's constructions.

C6 owns the noncompact/locally-closed and algebraic-gluing extensions of
AffineMorseLefschetz A4’s compact closed-family triangulation. It owns finite locally constant
module sheaves and their fibre-preserving equivalence with the finite-stalk full subcategory
of the native `TauCeti.LocalCoefficientSystem`, constructible topological coefficients,
their sheaf–cochain comparisons, Riemann existence,
the analytic-to-étale site morphism, and ordinary, compact-support and relative finite Artin
comparison. These use §C−1.1's analytic-space carrier
and analytification functor. InverseGaloisAndArithmeticFundamentalGroups uses the same cover
equivalence and comparison maps for its puncture, ramification and Hurwitz-space adapters.
C5.1's constant sheaf–singular comparison retains arbitrary abelian coefficients and its
non-Hausdorff domain; on Hausdorff CW spaces it uses and compares with CharacteristicClasses
C1.2's early locally acyclic small-chain sheaf resolution. C6 uses this shared constant
resolution and constructs the local-system sheaf resolution, stratified comparisons and
their support adapters. TopologicalSheafCohomology TS3.1–TS3.3
owns the common topological extension by zero, compact-support resolutions and localization;
C6 identifies its compact-support cochain maps with TS3.7 on their common CW domain.
Generic direct local-system cochains and their topological identities come from
AlgebraicTopology Stage 6.1.

C6.6 is the single owner of the topological realization of normalized adic systems, its derived
inverse limit and rationalization, and integral/rational ordinary and compact-support Artin
comparison. EtaleCohomologyFoundations §§F.0–F.4 owns the finite/adic étale coefficient
categories and their geometric operations; EnhancedDerivedSheaves §§0.1–0.4 owns generic
enhancements, derived limits and completion. The dependency order is §§F.0–F.3 → C6.0–C6.5,
with §F.4 additionally supplying C6.6, followed by the nearby-cycle and inertia application
in LefschetzPencilsAndVanishingCycles §0.8a. C6 does not use that application to construct its comparisons.

The analytic ownership and stage order are:

| Interface | Owner and supplied stage | Reciprocal handoff and retained scope |
| --- | --- | --- |
| Scalar compact-support Cauchy–Green and finite-rank Runge | GlobalHolomorphicFunctions GH0.3 (GH0 preparatory calculus and finite-rank Runge paragraphs) | ComplexKahlerGeometry K2 supplies the parameter-dependent extension to C1.1 |
| Native holomorphic sheaf, convergent local algebra and primitive Oka relations | ComplexKahlerGeometry K2–K4 | C−1 adds analytic quotients, nilpotents and gluing; RealAnalyticGeometry R3.2 supplies native coherence; C0 descends it to analytic spaces |
| Algebraic strict-SNC compactifications and labelled étale coordinates | ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4 / `sncBoundary`, `sncCompactification`, `sncCoordinates` | The prescribed smooth quasi-projective open is unchanged in a smooth projective compactification with globally smooth labelled boundary components and local equation `t₁⋯t_b=0`; C−1.4 supplies `analyticPolydisc`, `sncPolydiscChart` and `snc_exists_polydiscChart` by analytification and the analytic inverse-function theorem |
| Scheme analytification and its algebraic-to-holomorphic prefix | ComplexComparisonPartII C−1.1, C0.4 and C5.1–C5.2 | FormalConnectionsOpers F2.4 uses the same complex points, ring sheaf, open restrictions, fibre products, smooth charts and étale local isomorphisms. F2.4 retains fixed-model maximal atlases, second countability, tangent/derivation, toric, group and gauge comparisons; these use the prefix without proper GAGA |
| Ordinary algebraic differential operators and all-order principal parts | FormalConnectionsOpers F2.2 | C5.1 uses the characteristic-free commutator, order, localization and principal-parts interfaces specified in C5.1, and owns their analytic comparison. F2.4 applications use that analytic adapter; Lie–Rinehart PBW assumes projectivity, while its identification with ordinary operators also uses smoothness and characteristic zero |
| Fixed-rank bundle–sheaf equivalence, holomorphic connections and absolute flat correspondence | ComplexKahlerGeometry K4 on native Mathlib bundles and `SheafOfModules` | C0.3 assembles clopen rank strata; C1.3 fixes Chern curvature conventions; C5.2's `holomorphicConnectionDictionary` identifies the analytic connection carriers and absolute unit, evaluation and monodromy maps, and adds all horizontal morphisms and holomorphic parameters |
| Bundle test sections and distributions | ComplexKahlerGeometry K5a's `BundleTest` and `BundleDistribution` | C5.4 transports these through the complex orientation and exterior wedge pairing; its bidegrees, positive cones, mass and complex-current extension theory use that same substrate |
| Local analytic-set mass and L¹ integration | ComplexKahlerGeometry K6.1's chart-local Lelong estimates and K5a's L¹ integration comparison | C5.4's `analyticSetLocalFiniteMass` globalizes the supplied estimates to pure-dimensional analytic subsets in arbitrary manifolds, without compactness or a Kähler hypothesis, and compares metrics and restrictions; C5.4 glues the general cycle current and proves closedness. `AnalyticCycleIntegration.compactKaehler` identifies its compact specialization with K6.1's real de Rham functional, with the same orientation and multiplicities |
| Real dimension-graded currents and complex degree-graded currents | GeometricCurrents G1's real carrier and boundary; C5.4's `realComplexCurrentComparison` | K5a owns the general LF bundle-test/distribution foundation. C5.4 identifies G1's tests with its real exterior-dual/density specialization without an ambient orientation, and supplies complex extension with the grading sign. GeometricCurrents retains rectifiability, integral subgroups and minimizing-current geometry; C5.4 retains complex type, positivity, analytic cycles and comparison applications |
| Local bundle elliptic regularity, adjoints and symbols | ComplexKahlerGeometry K5a local estimates and K5b.0; K6.0 supplies local Kähler/Bochner identities | RealAnalyticGeometry R3.1 supplies their complete-metric weighted existence theorem, consumed in C1.4; the local inputs precede compact Hodge theory and use no C5.3 result |
| Compact bundle Sobolev, harmonic and Green theory | ComplexKahlerGeometry K5a–K5b.1; K6.1 supplies compact Kähler decomposition | C5.3 identifies the supplied maps with coherent and de Rham–Betti comparisons |
| Native coherent analytic module predicate, finite-presentation comparison and manifold calculus | RealAnalyticGeometry R3.2 item 0, over ComplexKahlerGeometry K4's ring sheaf | K3 retains primitive Oka relations and ideal generators; K3/K4 use R3.2's native predicate. C0.1–C0.3 uses the supplied predicate and `CoherentAnalyticModule.presentation_iff`, descends it through analytic quotient charts, and identifies open/over-site, section/stalk/germ and bundle transports with C−1's analytic-space carriers |
| Complete-metric weighted theorem, graph-domain density, weighted regularity, Stein criteria and approximation; coherent manifold Cartan A/B | RealAnalyticGeometry R3.1–R3.2 | C1.4 transports the positive-definite `(n,k)` theorem to C0.3's bundle/sheaf dictionary and scalar forms; C1.5 uses the supplied Stein criteria, complete metrics, approximation and coherent Cartan package to obtain strongly 1-complete analytic-space A/B, retaining nilpotents. Real-analytic complexification, p-functions and neighborhood constructions remain in R3–R5 |
| Coherent analytification on algebraic spaces | ComplexComparisonPartII C0.7 | C1.9 uses its exact functor, coherent operations and canonical cohomology/exchange maps; C3 gives the derived upgrade |

Thus GH0.3 → K2/K3/K4 → RealAnalyticGeometry R3.2 item 0 → C−1/C0.
K5a's local regularity, K5b.0 and K6.0 supply RealAnalyticGeometry R3.1's
weighted theorem independently of compact Hodge theory. R3.1 supplies C1.4's weighted
and scalar-form transports; R3.1–R3.2 supplies C1.5's Stein and coherent manifold
inputs. C0 uses R3.2's finite-type/relation predicate and its finite-presentation
identification `CoherentAnalyticModule.presentation_iff` on the shared native category.
Its additional descent and comparison maps concern C−1's analytic spaces, rather than
another manifold coherent category. RealAnalyticGeometry R3 uses neither C0 nor C1.
The ring-sheaf, primitive relation and local Bochner suppliers use neither the coherent
Cartan package nor its real-analytic applications.
The compact Kähler input follows the separate path RealAnalyticGeometry R3–R5 →
ComplexKahlerGeometry K6.1 → C5.3. Neither C0 nor C1 uses K6.1 or its triangulation inputs.
These dependencies are on the named stages and give an acyclic order within and between
roadmaps; they do not impose a strict merge order on whole roadmap specifications.

**Built in other roadmaps and cited.**

- *EtaleCohomologyFoundations, §§G.1–G.3.* Scheme compactification objects, dense
  replacement, Nagata compactification over qcqs bases, common refinements, cofilteredness
  and coherent choice comparison for coefficient functors that invert refinement arrows.

- *DerivedDeRhamCohomology, Layer 2, §§2.1–2.19.* The ordinary algebraic de Rham
  differential, its square-zero and graded Leibniz laws (`DeRham.d_squared`,
  `DeRham.d_leibniz`), `DeRham.complex A B`, and its pullback and complex-map API
  (`DeRham.pullback`, `DeRham.complexMap`) over arbitrary commutative rings. C5.1 sheafifies
  this core; its affine differential and functoriality are the supplier's constructions.
- *[FormalConnectionsOpers, F2.2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1056).*
  Ordinary algebraic differential operators, their commutator/order calculus, localization
  and scheme sheafification. The required all-order principal-parts factorization,
  restriction and composition maps are specified in C5.1, over arbitrary commutative base
  rings and modules. Lie–Rinehart PBW assumes projectivity; its identification with
  ordinary operators on smooth schemes also uses characteristic zero. C5.1 owns the analytic adapter;
  F2.4's analytification applications use C−1.1, C0.4 and that adapter.
- *CrystallineCohomology, CR.1, “Modules with integrable connection and their de Rham
  complexes”.* `Crystalline.Connection`, with extension, curvature, coefficient de Rham
  complex, base change, tensor and Hom. C5.2 uses the ordinary Kähler-differential case,
  sheafifies it on smooth schemes, and analytifies it; no PD or quasi-nilpotence condition
  enters the complex comparison.
- *CrystallineCohomology, CR.5:log-algebra.1–.4 and CR.5.1.* `LogCrystalline.PrelogRing`,
  `LogCrystalline.PrelogRing.IsLog`, the étale log-structure, associated-log, inverse-image,
  fine-chart and divisorial-log APIs; `LogCrystalline.IsFineMonoid`,
  `LogCrystalline.IsSaturatedMonoid`, `LogCrystalline.IsLogSmooth`, the Kato chart criterion,
  `LogCrystalline.divisorialLog`,
  `LogCrystalline.logDifferentials` and `LogCrystalline.logDeRham`. These own the
  all-characteristic algebraic core. C5.5 uses that carrier on algebraic sites and builds
  its analytic adapter `logAnalytification`. The order is the ordinary Layer 2 core →
  CR.1 ordinary connections and CR.5 logarithmic cores → C5.1–C5.2 sheafification and
  C5.5 analytic adapters → C5.6–C5.7 comparisons. No supplier uses C5's GAGA or Hodge theory
  to construct these cores; the supplier section order between the crystalline and derived
  roadmaps is retained.
- *ResolutionOfSingularitiesCharacteristicZero, §§1.3, 6.2, 6.4.* `sncBoundary`,
  `sncCompactification` and `sncCoordinates`: a smooth quasi-projective finite-type variety
  in characteristic zero embeds unchanged as a dense open in a smooth projective variety
  with reduced strict-SNC complement, globally smooth labelled components and local étale
  equations `t₁⋯t_b=0`. §C−1.4 supplies the analytic polydisc charts from this algebraic datum.
- *AlgebraicModuliForArithmeticGeometry, Layers 1–3.* Algebraic projective bundles, twisting sheaves and relative Serre
  generation and vanishing (Layer 1); coherent dévissage `coherentDevissage` and
  `devissageViaChow` (Layer 2, §2.3); effective étale descent on algebraic spaces and the
  algebraic Hom/Isom representability for projective families (Layer 3).
- *AlgebraicModuliForArithmeticGeometry, §7.7.* `spaceDQCoh X`, the full subcategory of the derived category of
  `O_X`-modules on the ringed small étale site of an algebraic space with quasi-coherent cohomology
  sheaves, and `spacePerfect X`, with `spaceDQCoh.chartRestriction`,
  `spaceDQCoh.schemeEtaleEquivalence`, `spaceDQCoh.derivedPullback`,
  `spaceDQCoh.derivedPushforward`, `spaceDQCoh.tensor` and `spaceDQCoh.cohomologyComparison`. C3.2
  builds the quasi-coherator on this category.
- *DerivedModuleAlgebra, §1.E.1.* `perfectInverseSystemEffectivity` supplies effectivity
  of compatible perfect complexes over surjective inverse ring systems with locally nilpotent
  transition kernels, with the given derived reductions and projections.
- *EnhancedDerivedSheaves, E1.9.* `perfect_proper_pushforward` supplies perfect pushforward
  of a perfect complex tensored with a bounded finitely presented, target-flat complex
  with proper support, and its arbitrary derived base-change comparison on algebraic spaces.
- *EtaleCohomologyFoundations, §§F.0–F.3.* Finite étale covers and monodromy,
  finite/constructible module sheaves, the bounded constructible finite-Tor category, finite
  cohomology and products, proper/smooth base change, compact supports, finiteness and Künneth.
  C6.2–C6.5 use these inputs, with their precise coefficient and geometric hypotheses.
  Its §F.4 supplies normalized adic systems and their classical/pro-étale realizations for C6.6.
- *EnhancedDerivedSheaves §§0.1–0.4 and EtaleCohomologyFoundations §§0.7–0.8.* Enhanced module-sheaf categories,
  K-injective/K-flat replacements, ambient derived products, canonical derived functors,
  coherent derived limits/completion, étale support localization and
  compactification-defined proper supports. These use the geometry of EtaleCohomologyFoundations §§G.1–G.3;
  coherent proper-support algebraization in C4.3 uses the same geometry with `O_X`-modules.
- *GlobalHolomorphicFunctions, GH0.3.* Scalar compact-support Cauchy–Green and finite-rank
  Runge with fixed evaluation points and uniform operator bounds; these feed
  ComplexKahlerGeometry K2's smooth/holomorphic parameter theory used in C1.1.
- *[RealAnalyticGeometry, R3.1–R3.2](../RealAnalyticGeometry/README.md#r31-weighted-estimates-stein-criteria-and-approximation).* R3.1 supplies the noncompact complete-Kähler
  positive-definite `(n,k)` weighted theorem, maximal domains, graph-domain density,
  weighted regularity, complete exhaustion metrics, Stein criteria, jet interpolation
  and Oka–Weil approximation. R3.2 item 0 supplies the native coherent module predicate,
  `CoherentAnalyticModule.presentation_iff`, operations and manifold open/over-site,
  section/stalk/germ comparisons; R3.2 supplies coherent Cartan A/B, exact sections and
  coherent approximation. C0 extends these to analytic-space charts and descent; C1.4–C1.5
  retains their complex-geometric transports and analytic-space consequences.
- *ComplexKahlerGeometry, K2–K5 and K6.0–K6.1.* K2 supplies the parameter Dolbeault
  resolution and native sheaf-cohomology comparison, K3 the convergent local algebra and
  primitive Oka relations, K4 the native holomorphic sheaf, bundle–sheaf equivalence and
  Chern connection, holomorphic connection carrier and absolute flat-connection/local-system
  groupoid equivalence. C5.2 identifies the analytic connection and comparison maps and supplies
  all horizontal morphisms and relative holomorphic parameters. K5a supplies `BundleTest`,
  `BundleDistribution`, their topologies, coefficient comparisons and operator action for
  C5.4's complementary-form specialization. K5a local estimates, K5b.0's adjoint/symbol layer and K6.0's local Kähler/Bochner
  identity feed RealAnalyticGeometry R3.1's weighted theorem, used in C1.4. K5's compact harmonic/Green theory and
  K6.1's compact Kähler decomposition feed C5.3. K6.1 supplies the chart-local
  Lelong finite-mass estimates; C5.4 globalizes them as `analyticSetLocalFiniteMass`.
  K5a supplies the L¹ integration comparison used by C5.4's cycle currents and their
  compact Kähler specialization.
- *GeometricCurrents, G1.* The real dimension-graded continuous-dual current carrier,
  unsigned boundary, support and comass mass. C5.4's `realComplexCurrentComparison`
  identifies its LF test forms with K5a's real exterior-dual/density specialization
  and compares it with complex currents, retaining the differential sign. The general
  bundle-test foundation belongs to K5a; integral subgroups and minimizing-current
  geometry belong to GeometricCurrents.
- *ComplexManifolds, Milestones 1 and 7.1–7.3.* Functorial realification and native
  holomorphic cocycle gluing underlie ComplexKahlerGeometry K4. C0.3 consumes K4's
  fixed-rank equivalence; C5.2 specializes realification to holomorphic submersions and
  analytification.
- *CharacteristicClasses, C1.2, locally acyclic resolution in item 2.* The shared
  constant-coefficient small-chain sheaf resolution on Hausdorff CW representatives.
  C5.1 supplies the nesting extension to semilocally contractible spaces and identifies
  its CW specialization with that resolution; Čech refinement and transport to CW-type
  bases remain in the supplier.
- *[TopologicalSheafCohomology, TS3.1–TS3.3 and TS3.7](https://github.com/TauCetiProject/TauCetiRoadmap/pull/973).*
  The native topological extension-by-zero adapter, stalks, exactness and adjunction;
  c-soft compact-support resolutions, compactification comparisons and localization
  on locally compact Hausdorff spaces. On finite-dimensional locally finite Hausdorff
  CW pairs, TS3.7 supplies the compact-support sheaf/singular bridge through
  CharacteristicClasses C1.2/S0–S4, with its pair comparison under S5's controlled-collar
  hypotheses. C6.1 identifies the common augmentations, coefficient maps and boundary
  signs; its general locally proper lower shriek and constructible comparisons remain here.
- *SmoothBundlesConnections, B1.5.* The general proper-surjective-submersion theorem on
  finite-dimensional Hausdorff second-countable real smooth manifolds without boundary,
  with native `FiberBundle`/`Trivialization` charts smooth in both directions over the base,
  componentwise model fibres and restriction/pullback maps. C5.2's `ehresmannFibration`
  supplies the underlying-smooth holomorphic/analytification adapter and the relative Betti
  consequence. This dependency uses B1.5's submersion construction, not its principal-bundle
  applications or the rest of that roadmap.
- *Same roadmap, B2 and B6.1–B6.4.* Native smooth complex bundles and Hermitian metrics;
  the integral exponential/Čech-to-singular construction for the inverse-character line of a
  right principal circle bundle, its pullback/tensor/dual laws, rank-one curvature comparison
  and flat-holonomy Bockstein. C5.4 forgets holomorphic structure and identifies its class
  integrally with this one. CharacteristicClasses C1.5 and C3 use the same line class.
- *AffineMorseLefschetz, A4, opening triangulation paragraphs.* The compact semialgebraic
  finite closed-family theorem, subcomplexes, compatible subdivisions and dimension API.
  C6.0 constructs the noncompact/locally-closed and separated algebraic chart-gluing
  extensions. Only this foundational leaf is consumed, not A4's complement duality or its
  Lefschetz applications.
- *UniversalCovers.* Fundamental-groupoid transport, covering classification, lifting and deck
  transformations for C6's finite topological covers and local systems.
- *SchemeAndStackFoundations.* Algebraic spaces, their étale sites and descent (Layer 1); site
  cohomology functoriality, higher direct images, Leray and Čech-to-cohomology (§2.1 `Sheaf.H.pullback`,
  §2.1 `Sheaf.higherDirectImage`, §2.2 `leray_spectral_sequence`, §2.2 `cech_to_cohomology`),
  quasi-coherent higher direct images, cohomology of line bundles on projective space and Serre
  vanishing (§2.6 `qcoh_higherDirectImages`, §2.6 `projectiveSpace_cohomology`,
  §2.6 `ample_serre_vanishing`), the quasi-coherent derived category of a scheme with derived
  pullback and pushforward, its perfect generator and Tor-independent base change
  (§2.18 `DQCoh`, §2.18 `derivedPullback`, `totalDirectImage`,
  §2.18 `perfect_generator`, §2.18 `torIndependent_baseChange`); coherent duality and its trace
  (§2.19 `upperShriek`, `trace`; §2.20 `relativeDualizingModule_smooth`, `cm_serre_duality`,
  `sheafified_grothendieck_duality`), used for the Hodge-cohomology retraction in C5.3;
  Chow's lemma (§4.12).

**Tau Ceti roadmaps this roadmap builds on.** AlgebraicVectorBundles (general sheaf-module tensor
product, internal Hom, finite local freeness, exterior powers, duals and determinants); DifferentialGeometry (smooth differential forms on
manifolds, wedge product, exterior derivative, integration and Stokes, smooth de Rham cohomology and
its products, the Laplace–Beltrami operator); AlgebraicTopology (singular chains and cochains with
arbitrary coefficients, cup products, manifold duality and trace); PDE (scalar elliptic estimates on
Euclidean domains); JacobianChallenge (relative coherent cohomology and base change); AlgebraicCurves
(normal affine charts in Layer 2 and the smooth projective model of a function field in
Layers 12B–12C; C4.5 constructs the affine completion immersion); StableReduction (coherent curve
theory); and the completed HodgeStructures roadmap
(abstract pure Hodge structures, implemented in Tau Ceti as `TauCeti.Hodge.HodgeStructureOn` and
`TauCeti.Hodge.Conjugation`). None of these is re-planned; where this roadmap needs holomorphic submersion adapters or geometric comparison
compatibilities, the additional target is stated here with its exact relation to the supplier.
Shared manifold Hodge and Chern constructions come from ComplexKahlerGeometry.

**Already in the Tau Ceti library.** Montel's theorem for open subsets of `ℂ` is `TauCeti.montel`
(at the pinned commit); `montelTheorem` in C1.6 is its several-variable form. The pinned library
also supplies singular cohomology with coefficients and its cup product
(`TopCat.singularCohomology`, `TopCat.singularCup`), the complex of singular chains small for an
open cover with its inclusion equivalence (`TopCat.smallSingularSubcomplex`,
`TauCeti.smallSingularChainHomotopyEquiv`), and the stability of Fredholm operators under compact
perturbation (`ContinuousLinearMap.IsFredholm.add_of_isCompactOperator`). These are used, not
restated: `SmallSingularCochains` (C5.1) measures smallness by a nesting of neighbourhoods attached
to the barycentres of the faces of a simplex rather than by one open cover, and `schwartzFiniteness` (C1.6) perturbs a surjection
whose kernel may be infinite-dimensional, so it is not a statement about Fredholm operators.
The cochain and cup suppliers are in `TauCeti.AlgebraicTopology.Cohomology.Basic` and
`TauCeti.AlgebraicTopology.Cohomology.Cup`; subdivision and the inclusion equivalence are in
`TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Homotopy` and
`TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Equiv`. The Fredholm supplier is in
`TauCeti.Analysis.Fredholm.CompactPerturbation`. The native local-system carrier is
`TauCeti.LocalCoefficientSystem Λ T` (ring first), with evaluation, path transport,
monodromy and pullback in `TauCeti.AlgebraicTopology.LocalCoefficient`. Its finite-stalk
full subcategory is `FiniteModuleLocalSystem Λ T` in C6.1. The pinned
`TauCeti.LocalCoefficientSystem.twistedCochainComplex` in
`TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic` takes Hom from twisted chains;
with scalar target it computes dual-system cochains. C6.1 consumes AlgebraicTopology
Stage 6.1's direct cochains with the actual coefficient fibres.

Outside this scope are definable Chow and o-minimal algebraization
(LogicAndDefinabilityInNumberTheory, LD.6); Borel's algebraicity theorem for maps into arithmetic
quotients (ShimuraVarieties, V3), which needs an extension theorem and does not follow from proper
GAGA; the Kato–Nakayama Betti space of a log scheme; crystalline sites, divided-power envelopes,
the full cotangent complex and derived de Rham cohomology (CrystallineCohomology,
DerivedDeRhamCohomology, which supply the ordinary and logarithmic cores used in C5); variations of
Hodge structure, period maps, limiting Hodge structures and nilpotent orbits (HodgeStructuresPartII,
which imports the connection, canonical-extension, Gauss–Manin, proper-log and geometric-Hodge
outputs of C5); rigid and dagger de Rham cohomology (AdicSpacesPartII); the Kodaira–Spencer
normalisation of modular curves (ModularCurvesPartII, R12.5).

## Conventions

- **Analytic spaces.** A complex analytic space is an object of `ComplexAnalyticSpace`: locally
  finite complex dimension, with a uniform dimension bound only where a target explicitly requires
  one; structure sheaf locally a quotient `O_U/I` of the holomorphic sheaf of an open
  `U ⊆ ℂⁿ` by a finitely generated ideal sheaf `I`, which need not be radical. Nilpotents are never
  discarded: a closed analytic subspace is given by a coherent ideal, not by its zero set.
- **Dimensions.** The empty analytic fibre has dimension `−∞`, so the zeroth
  fibre-dimension locus in the target is the image of the map, rather than the entire base.
- **Manifolds and analytic cohomology.** Manifolds in C1 and C5 are finite-dimensional,
  Hausdorff, second countable and without boundary. Strongly 1-complete spaces and the compact
  analytic spaces of C1 are Hausdorff and second countable; the coherent categories and descent
  of C0 and C3 also apply to the non-Hausdorff analytic spaces of the supplier.
- **Algebraic schemes** are locally of finite type over `ℂ` unless a target names another base;
  algebraic spaces are locally separated and of finite type over `ℂ`.
- **Compactification geometry** in EtaleCohomologyFoundations §§G.1–G.3 is over any qcqs base `S` with `f : X → S`
  separated and finite type. In Lean, finite type is `LocallyOfFiniteType f` together with
  `QuasiCompact f`, and qcqs is `CompactSpace S` together with `QuasiSeparatedSpace S`.
- **Finite and adic coefficients.** C6 uses a finite commutative ring `Λ`, killed by an integer
  `N ≥ 1`; invertibility is required only by the particular geometric input using it (over `ℂ`
  it is automatic). `Dᵇ_ctf` means bounded constructible cohomology and finite Tor amplitude,
  not just constructibility. Adic objects have coherent derived reductions at all levels and
  uniform cohomological and Tor intervals. Arithmetic fibre transport requires a specified
  family and an étale path or specialization datum.
- **Classical topology.** C6 always uses the underlying space of
  §C−1.1's `complexSchemeAnalytification`, restricted to
  finite-type complex schemes. Forgetting the ring sheaf supplies the topological carrier;
  its nilpotents remain in the analytic object. Global Hausdorff/paracompact and compact-support
  claims carry separatedness; arbitrary finite-type schemes retain the affine-local topology
  and ordinary comparison.
- **Analytification of modules.** For a scheme `X` with `φ_X : X^an → X`, and an `O_X`-module `F`,
  `F^an = O_{X^an} ⊗_{φ_X⁻¹O_X} φ_X⁻¹F`: Mathlib's pullback of sheaves of modules along the
  morphism of ringed spaces `φ_X`. It is never an independently chosen analytic module.
- **Coherence** of an analytic module means local finite presentation over a coherent structure
  sheaf (equivalently, finite type with locally finitely generated relation sheaves); Noetherian
  stalks alone do not give it.
- **Cohomology** is Mathlib's `Sheaf.H` (Ext from the constant sheaf) and the derived categories of
  sheaves of modules; Čech complexes are Mathlib's `cechComplexFunctor`, compared with derived
  cohomology through SchemeAndStackFoundations §2.2 `cech_to_cohomology`.
  DiamondsAndVStacks D0.19 uses this same general theorem on perfectoid sites; the analytic
  application here uses the general supplier directly.
- **Linearity of differentials.** Exterior derivatives, connections and differential operators are
  `ℂ`-linear (relative ones `f⁻¹O_S`-linear), never `O_X`-linear. A de Rham complex is a complex of
  sheaves of `ℂ`-vector spaces whose terms happen to be coherent `O_X`-modules; its comparison runs
  through differential operators and principal parts (C5.1), not through coherent GAGA applied to
  the differential.
- **Periods and Chern classes.** The positively oriented unit circle gives `∮ dz/z = 2πi`. The first
  Chern form of a Hermitian holomorphic line bundle is `(i/2π)Θ`; the normalised Fubini–Study form
  represents `c₁(O(1))` and integrates to `1` over a projective line. SmoothBundlesConnections
  B6's right principal circle class is the class of its inverse-character associated line;
  the standard-character line has its negative. For a holomorphic line `L`, the unit-frame
  bundle of `L∨` supplies that convention, so its inverse-character line is `L`.
- **Hermitian pairing.** Smooth bundle metrics use Mathlib's convention, conjugate-linear in
  the first slot: `h(s,t) = s* H t` in column coordinates. The pairing displayed in the Hodge
  star identity is `⟨α,β⟩ = h(β,α)`, linear in the first slot. Transport this swap when
  comparing ComplexKahlerGeometry K4's Chern connection with SmoothBundlesConnections B2–B4.
  ComplexKahlerGeometry uses `d^c = i(∂̄−∂)`; for this roadmap's current convention
  `d_c = d^c/(4π)`, hence `dd_c = (i/2π)∂∂̄`. C1.3 proves these scalar-factor
  comparisons on the supplied operators.
- **Hodge star and Laplacian.** The Hodge star on complex forms is `ℂ`-linear, defined by
  `α ∧ *β̄ = ⟨α, β⟩ vol`; complex conjugation sits in the Hermitian pairing, not in `*`. The Hodge
  Laplacian `Δ = dδ + δd` is nonnegative; on functions it is the negative of DifferentialGeometry's
  `laplaceBeltrami = div ∘ grad` (in `ℝ³`, `Δ(x₁²) = −2`).
- **Residues and monodromy.** For the connection `d + a dz/z` the residue at `0` is `a` and the
  monodromy along the positive loop is `exp(−2πia)`. Canonical logarithmic extensions use the
  residue strip `0 ≤ Re λ < 1`; tensor products of canonical extensions need integer residue
  adjustment, while the unipotent extension is tensor compatible.
- **Log structures** are monoid sheaves with a multiplicative structure map to `(O, ·)`; charts may
  send non-units to `0` (the standard log point `ℕ → ℂ`, `1 ↦ 0`). "Fine" means integral and
  finitely generated; saturation is a separate condition and is never assumed silently.
- **Lean.** Declarations live in `TauCetiRoadmap.ComplexComparisonPartII`; the names below are
  relative to it. The local prototypes `commutatorWith` and `IsDifferentialOperator`
  model FormalConnectionsOpers F2.2's canonical algebraic declarations.
  Targets whose carriers are not in Mathlib or Tau Ceti at the pins (complex
  analytic spaces, analytification, algebraic spaces, compact manifolds with forms) are specified in
  this README only; `Suggested.lean` records the light definitions and the statements that can be
  typed against the pinned libraries.

## Exact supplier contracts

### From Mathlib (pinned)

- Sheaves of modules: `SheafOfModules`, `SheafOfModules.IsFinitePresentation` (finite presentation
  by quasi-coherent data), `SheafOfModules.IsLocallyFree`, pullback along morphisms of ringed sites,
  `AlgebraicGeometry.LocallyRingedSpace`, `AlgebraicGeometry.Scheme.Modules`.
- Cohomology: `CategoryTheory.Sheaf.H F n` (Ext from the constant sheaf; needs sheafification and
  `HasExt`), `CategoryTheory.cechComplexFunctor`, derived categories `DerivedCategory`, and
  `CategoryTheory.Abelian.Ext.mapExactFunctor` (the map on Ext induced by an exact additive functor).
- Commutative algebra: `KaehlerDifferential` with `KaehlerDifferential.D : Derivation R S Ω[S⁄R]`,
  `Derivation`, `exteriorPower` with `exteriorPower.ιMulti`, `Module.Flat`,
  `Module.FaithfullyFlat.of_flat_of_isLocalHom` (a flat local homomorphism of local rings is
  faithfully flat), `MvPowerSeries`, `Monoid.FG`, `AddMonoid.FG`, group completion
  `Algebra.GrothendieckGroup` (group completion of a commutative monoid);
  `AddSubmonoid.NSMulSaturated` (root saturation in the given ambient additive monoid).
  C5.5 applies the latter to the chart submonoid inside its generated subgroup.
- Schemes: `AlgebraicGeometry.IsProper`, `IsSeparated`, `LocallyOfFiniteType`, `IsOpenImmersion`
  (a `MorphismProperty`), `IsLocallyNoetherian`; `QuasiCompact`, `CompactSpace`,
  `QuasiSeparatedSpace`, `IsSchemeTheoreticallyDominant`, `Scheme.Hom.ker`, `Flat`,
  `CategoryTheory.Over` and scheme pullbacks for compactification geometry.
- Analysis: `AnalyticAt`, `Filter.Germ.valueRingHom`, `ContDiff`, `fderiv`, the multivariable inverse
  function theorem `ContDiffAt.to_localInverse` (valid at analytic smoothness `ω`), Montel-type
  compactness via Arzelà–Ascoli, `circleIntegral` with
  `circleIntegral.integral_sub_inv_of_mem_ball` (`∮ (z − w)⁻¹ = 2πi`), Lebesgue measure on `ℂ`,
  `Matrix.PosSemidef`, `Matrix.det`. `TestFunction` has the locally convex inductive-limit
  topology of compactly supported smooth functions; `Distribution Ω F ⊤` is the compact-convergence
  continuous real-linear dual of real-valued test functions, with values in `F`.
  `Distribution.lineDerivCLM`, `Distribution.ofFun` and `Distribution.delta` supply the
  chartwise derivative, locally integrable coefficients and Dirac distribution for `CurrentCalculus`.
  Module lengths use `Module.length`; `DualNumber ℂ` is the square-zero algebra in the Artin check.
- Manifolds: `ModelWithCorners`, `𝓘(ℂ, E)`, `IsManifold I ω M` (complex manifolds),
  `ContMDiffVectorBundle`, `topologicalKrullDim`, `LocallyContractibleSpace` (a predicate).
- Singular chains: `AlgebraicTopology.singularChainComplexFunctor` (singular cohomology itself is
  not in Mathlib at the pin; see AlgebraicTopology below).

### From Tau Ceti (pinned)

- `TauCeti.SheafOfModules.ringCatSheaf R` in
  `TauCeti.Algebra.Category.ModuleCat.Sheaf.Defs`: the sheaf of rings underlying a sheaf of
  commutative rings on any site. Applied to a locally ringed space's structure sheaf, this is the
  ring sheaf used in C0.1.
- `TauCeti.SheafOfModules.isMonoidal_isFinitePresentation` in
  `TauCeti.Algebra.Category.ModuleCat.Sheaf.Quasicoherent.Monoidal`: the monoidal unit is finitely
  presented and tensor products of finitely presented modules are finitely presented. These parts
  of `coherentOperations` use that supplier; kernels, internal Hom, extensions and analytic gluing
  are supplied on manifolds by RealAnalyticGeometry R3.2 and extended to analytic spaces in C0.1.
- `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`: positive-degree `Sheaf.H` of a flasque sheaf of
  abelian groups on a topological space vanishes.
- `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X`: the full subcategory of finitely presented
  `X.Modules`, the algebraic coherent category on a locally Noetherian scheme.
- `TauCeti.Hodge.Conjugation W` (an antilinear involution of a complex vector space) and
  `TauCeti.Hodge.HodgeStructureOn W ω n` (a decreasing filtration `F` with `F^p` and the conjugate of
  `F^{n+1−p}` complementary): the abstract pure Hodge structure that C5.3 instantiates.
- `TauCeti.holomorphicSheaf E`: the sheaf of `E`-valued holomorphic functions on `ℂ` (one variable;
  types-valued), used only as a sanity check for the `n = 1` holomorphic sheaf.
- `TauCeti.montel`: Montel's theorem for a locally bounded sequence of holomorphic maps from an open
  subset of `ℂ` to a proper complex normed space (subsequence converging locally uniformly, with
  holomorphic limit); C1.6 extends it to open subsets of `ℂⁿ`.
- `TopCat.singularCochainComplex R k M` and `TopCat.singularCohomology R k M q`:
  the complex of `k`-linear coefficient morphisms from singular chains with coefficient object
  `R` to `M`, and its degree-`q` cohomology in `ModuleCat k`. For abelian coefficients take
  `C = ModuleCat ℤ`, `R = ℤ` and `M = A`; for complex coefficients take `C = ModuleCat ℂ`.
  `TopCat.singularCup` uses a coefficient diagonal `T → R ⊗ S` and a product `M ⊗ N → P`,
  is natural, associative and unital (the scalar cases use their usual diagonal and product).
  The small-chain suppliers are `TopCat.smallSingularSubcomplex`,
  `TauCeti.smallSingularSubdivisionHomotopy` (subdivision is homotopic to the identity on
  cover-small chains), and `TauCeti.smallSingularChainHomotopyEquiv` (their inclusion into
  all chains is a chain homotopy equivalence). They require an open family covering the space.
- `TauCeti.LocalCoefficientSystem Λ T := FundamentalGroupoid T ⥤ ModuleCat Λ` in
  `TauCeti.AlgebraicTopology.LocalCoefficient`, with `constantFunctor`, `fiberFunctor`,
  `transport`, `monodromyRepresentation`, `pullback` and the identity/composition/homotopy comparisons.
  `FiniteModuleLocalSystem Λ T` is its full subcategory cut out by
  `∀ x, Finite (L.obj x)`; finite means finite underlying sets, not finite projectivity.
  Sheaf equivalence identifies these modules and their path maps themselves.
  `TauCeti.LocalCoefficientSystem.twistedCochainComplex` is Hom from twisted chains,
  hence dual-valued with scalar target; it is used only with that convention.
- `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (compact perturbations of Fredholm
  operators are Fredholm), for Banach spaces. This supplies the finite-kernel case;
  `schwartzFiniteness` treats a surjection with no finite-kernel hypothesis.
- `TauCeti.IsSemialgebraic`, `TauCeti.IsSemialgebraicOn`, `TauCeti.IsSemialgebraicMap` in
  `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic` and `.Function`: polynomial sign sets,
  finite Boolean operations, polynomial inverse images and graph-defined maps. C6.0 extends
  AffineMorseLefschetz A4’s compact compatible triangulations using these carriers.

### From TauCetiRoadmap roadmaps

- **GlobalHolomorphicFunctions GH0.3.** The GH0 compact-support operator uses native
  Lebesgue area on `ℂ` and kernel `1/(π(z−w))`; its finite-rank Runge maps have evaluation
  points independent of parameters and bound `sup_K |f−A f| ≤ ε sup_L |f|` under the
  stated Runge compact/collar hypotheses. ComplexKahlerGeometry K2 owns parameter dependence.
- **ComplexKahlerGeometry K2–K4.** K2's fine Dolbeault resolution and Ext-based
  sheaf-cohomology comparison use native type forms; K3 compares analytic germs with
  `smoothSheafCommRing` stalks and proves Weierstrass and primitive Oka relations;
  K4 supplies the RingCat holomorphic sheaf by forgetting commutativity, its native
  open restrictions and germs, the section/reconstruction equivalence on fixed finite-rank
  `VectorBundle ℂ` with holomorphic transitions, and the Chern connection.
  C−1 and C0 use those carriers and prove the analytic-space and coherent-category adapters.
- **ComplexKahlerGeometry K5a, K5b.0, K6.0.** On arbitrary open manifold domains, K5a
  supplies bundle distributions, Sobolev scales and local Laplace-type regularity, K5b.0
  the geometric L² formal adjoint and Dolbeault symbol `½|ξ|² id`, and K6.0 the local
  Kähler/Bochner identities. RealAnalyticGeometry R3.1 supplies their noncompact weighted
  domain and existence theory to C1.4.
  On compact boundaryless bases K5a/K5b.1 supplies harmonic projections and Green maps;
  K6.1 supplies the compact Kähler decomposition used by C5.3.
- **RealAnalyticGeometry R3.1–R3.2.** R3.1 supplies weighted existence on complete
  Kähler manifolds, graph-domain density and regularity, Stein criteria and approximation.
  R3.2 supplies native coherence and its finite-presentation identification, manifold
  restriction/stalk calculus and coherent Cartan A/B. C0 descends the supplied category
  on analytic-space quotient charts; C1 transports its weighted and coherent conclusions.
- **ComplexManifolds.** Milestones 7.1–7.3 supply native holomorphic gluing to
  ComplexKahlerGeometry K4; Milestone 1 supplies C5.2's functorial realification.
- **CharacteristicClasses.** C1.2 item 2 supplies the early locally acyclic constant
  singular-cochain sheaf resolution on Hausdorff CW representatives, before its Čech
  comparison. C5.1 identifies its nesting-small extension with this resolution, preserving
  augmentation, restrictions and coefficient maps. The supplier owns Čech refinement
  and homotopy transport to paracompact Hausdorff CW-type bases.
- **AlgebraicVectorBundles.** L0A: the closed symmetric monoidal category of sheaves of modules,
  internal Hom (an isomorphism on stalks for finitely presented sources), strong monoidal pullback;
  L0B: finite locally free sheaves, duals, `Hom(E, F) ≅ E^∨ ⊗ F`; L0C: symmetric and exterior powers
  and `determinant`. C0 and C5 use these for coherent and locally free analytic modules.
- **DifferentialGeometry.** Layers 0–1: differential forms on manifolds, wedge and exterior
  derivative; Layer 2: orientations; Layer 5: integration of top forms and Stokes; Layer 6:
  `deRhamCohomology`; Layer 8: the de Rham theorem `deRhamEquiv`; Layer 9: Poincaré duality and
  `finiteDimensional_deRhamCohomology` for compact manifolds; Layer 12: Riemannian metrics and
  `laplaceBeltrami = div ∘ grad`. All over `ℝ`; ComplexKahlerGeometry K2–K5 supplies the complex/Hermitian
  and Hodge adapters; SmoothBundlesConnections B1.5 owns the
  general Ehresmann theorem used through C5.2’s holomorphic adapter.
- **AlgebraicTopology.** Stage 6: singular cochains with coefficients in an arbitrary module
  (abelian groups over `ℤ`), universal coefficients, cup and cap products, orientation and
  fundamental class, Poincaré duality; Stage 6.1: direct local-system cochains, relative
  cochains, coefficient maps, homotopy/excision/Mayer–Vietoris and constant-system comparison,
  with no projectivity assumption. Its tensor-paired products supply C6.1's cup identities.
  C6.1 owns the locally constant sheaf/native-functor dictionary and its sheaf resolution;
  this supplier owns the generic direct complex. Stage 8: compact smooth manifolds are of finite CW type.
- **SmoothBundlesConnections.** B1.5 supplies the native smooth proper-submersion
  trivializations to C5.2. B2 supplies the smooth complex bundle carrier/operations and
  conjugate-first Hermitian metrics; B6.1–B6.4 supplies the integral circle/exponential
  class, Čech–singular–de Rham comparison and Bockstein to C5.4. The holomorphic bundle
  adapter and equality with this integral class are C5.4 targets; CharacteristicClasses
  C1.5 and C3 supply its universal/classical first-Chern identification on these bundles.
- **AffineMorseLefschetz.** A4's opening triangulation foundation supplies a finite
  simplicial complex `K`, a semialgebraic homeomorphism `|K| ≅ S` for compact `S`,
  subcomplexes for a finite closed family and compatible subdivisions. C6.0 extends that
  model and owns its comparison with separated complex algebraic charts and open simplices.
  No complement duality or Lefschetz theorem is an input to these extensions.
- **PDE.** Lane A: Sobolev spaces and Rellich compactness on bounded Euclidean domains; Lane D:
  Gårding's inequality, Lax–Milgram and the Fredholm alternative for scalar elliptic operators;
  Lane E: interior regularity. Scalar and Euclidean only; ComplexKahlerGeometry K5a owns the local and compact bundle extensions.
- **JacobianChallenge.** Layer B: coherent cohomology over a field (affine acyclicity, Čech equals
  derived, finiteness for proper schemes); Layer C: proper flat pushforward, flat base change,
  cohomology and base change and semicontinuity, formal functions.
- **StableReduction.** Layer 2: coherent sheaves over locally Noetherian bases, proper pushforward,
  cohomology and base change, relative dualizing sheaves of curves.
- **AlgebraicCurves.** Layer 12B–12C: the regular projective model of a function field and the
  anti-equivalence with regular projective curves (algebraic only; the comparison with compact
  Riemann surfaces is excluded there and is built in C4 here); Layer 2: normal affine charts
  and their DVR/place dictionary. C4.5 constructs the open immersion into the projective model.
- **Completed HodgeStructures.** Abstract pure, polarized and mixed Hodge structures, Tate twists and
  morphisms, implemented as the Tau Ceti declarations above.

### From AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations

- **AlgebraicModuliForArithmeticGeometry.** Layers 1–3 supply algebraic projective
  bundles and twists, `relativeSerre`, projective-space Čech comparison, `coherentDevissage`,
  `devissageViaChow`, effective étale/fpqc quasi-coherent descent and projective Hom/Isom representability.
  Layer 6 supplies module obstruction theory and common étale neighbourhoods. §§7.1–7.3 supply Artin criteria, independent coherent-stack approximation, module Hom/Isom,
  `universalFlatteningProperSupport`, general Picard
  sheaves, base change, rigidification and infinitesimal lifting. §7.2 supplies perfect-complex
  rank loci; §§7.6.1–7.8 supply `spaceDQCoh`, `spacePerfect`, the ringed étale carriers and `properSpaceCompletionEquivalence`. §7.9 supplies
  `spaceSectionComponentCriterion`; §8.3 supplies generic parameter transport and the two
  framed-completion equivalences. ResolutionOfSingularitiesCharacteristicZero Layers 1–6
  supply algebraic resolution and SNC compactification.
  The analytic local models are §§C−1.1–C−1.4, coherent GAGA is §C1.9, and derived limits,
  coherent/Picard algebraicity and components are §§C3.2a–C3.2g here.
- **DerivedModuleAlgebra §1.E.1 and EnhancedDerivedSheaves E1.9.**
  `perfectInverseSystemEffectivity` and `perfect_proper_pushforward`, respectively, supply
  the ring-complex effectivity and geometric perfect-test inputs of C3.2b. The latter also
  supplies the Picard cohomology inputs of C3.2d.1 and C3.2d.3. Ambient enhancement,
  replacements and limits for C3.2a come from EnhancedDerivedSheaves §§0.1–0.4.
- **SchemeAndStackFoundations.** Layer 1 (algebraic spaces, étale sites, effective descent); Layer 2 (the site-cohomology, quasi-coherent cohomology and derived
  quasi-coherent declarations named in *Scope and ownership*), including §§2.19–2.20's coherent
  duality, smooth dualizing module, trace and Serre duality for C5.3; §4.12 (Chow's lemma).

### Compactification, finite and adic étale suppliers

- **EtaleCohomologyFoundations §§G.1–G.3.** `Compactification`,
  `DenseCompactification`, `nagataCompactification`, `compactificationCommonRefinement`,
  `denseCompactification_cofiltered` and `denseCompactification_hom_unique` supply the
  common geometry and categorical refinement comparison used in C4.3 and C6.4–C6.5.

- **EtaleCohomologyFoundations §F.0.** `VanishingCycles.constructibleEtale`,
  `VanishingCycles.finiteEtaleGaloisCategory` and `VanishingCycles.etaleTateTwists` supply
  finite module sheaves, finite covers, étale paths and twists. Constructibility is globally
  finitely stratified on Noetherian schemes and affine-local on locally Noetherian schemes.
  Cover classification and pure constructibility impose no coefficient invertibility;
  twists use SchemeAndStackFoundations §§2.9, 2.11's roots of unity and Kummer with invertible `N`.
- **Its §F.1.** `VanishingCycles.constructibleDerivedCategory` and
  `VanishingCycles.finiteCoefficientCohomology` use the common enhanced module-sheaf category
  and retain the distinction between constructible and ctf complexes, coefficient modules,
  cups and coherent finite group actions. The underlying abelian `D⁺` cohomology agrees with
  SchemeAndStackFoundations §§2.1–2.2, which supply the generic site functors and Leray.
- **Its §F.2.** `VanishingCycles.properBaseChange` covers arbitrary torsion on the proper
  `D⁺` domain without invertibility; `VanishingCycles.smoothBaseChange` uses invertible
  torsion in the rotated smooth/qcqs square. `VanishingCycles.localAcyclicity`,
  `VanishingCycles.etaleKunneth`, `VanishingCycles.etaleCompactSupports`,
  `VanishingCycles.compactSupportCohomology` and `VanishingCycles.etaleKunnethCompactSupport`
  supply finite-level exchange, ULA and ordinary/compact products on their stated domains.
  The lower-shriek construction itself is EtaleCohomologyFoundations §0.8's
  `ClassicalAlgebraic.properSupports`, using EtaleCohomologyFoundations §§G.1–G.3.
- **Its §F.3.** `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`,
  `VanishingCycles.affineArtinVanishing`, `VanishingCycles.lisseDirectImageTransport`
  and `VanishingCycles.compactSupportFiniteness`
  supply geometric bounds, affine Artin vanishing, constructibility and finite/perfect
  cohomology. For `Rf_!` preservation of ctf use separated finite type between Noetherian
  schemes and invertible `N`; geometric finiteness is over a separably closed field.
- **Its §F.4.** `VanishingCycles.normalizedAdicSystems`, `VanishingCycles.classicalAdicRealization`,
  `VanishingCycles.etaleProetaleAdicComparison`, `VanishingCycles.adicFiniteness`,
  `VanishingCycles.rationalAdicRealization` and `VanishingCycles.adicFunctoriality` supply
  coherent uniform ctf towers, derived-complete realization, all reductions and continuous
  actions. C6.6 applies them over `ℂ`, with compact support for separated schemes, and uses
  rationalization of this integral object. LefschetzPencilsAndVanishingCycles §0.8a
  consumes the resulting comparisons.
- **EnhancedDerivedSheaves §§0.1–0.4 and EtaleCohomologyFoundations §§0.7–0.8.** `ClassicalDerived.tensorHom`,
  `ClassicalDerived.functorCoherence`, `ClassicalDerived.inverseLimits`,
  `ClassicalDerived.derivedCompletion`, `ClassicalAlgebraic.supportLocalization` and
  `ClassicalAlgebraic.properSupports` give the enhancement, canonical transformations,
  derived products/limits, reduction conservativity, étale localization and proper supports.
  Constructibility and geometric isomorphism theorems come from the preceding suppliers.
- **UniversalCovers** supplies the topological fundamental groupoid and finite-cover
  classification on locally path-connected, semilocally simply connected spaces, with deck
  groups and basepoint-change transport. **RealAlgebraicGeometry Layers 3, 6** supply the
  polynomial-sign, cell decomposition and projection theory; **AlgebraicTopology** supplies
  simplicial/CW topology and ordinary constant singular coefficients. C6.0 adds triangulation;
  C6.1 adds local and stratified cochains on these existing foundations.

## How to read the build

C−1 uses ComplexKahlerGeometry K3's convergent local algebra to build analytic local models, scheme and space analytification,
completed-stalk comparison and SNC coordinates. C0 puts coherent sheaf theory on the analytic spaces of §§C−1.1–C−1.2: the coherent category, ideals with nilpotents, holomorphic bundles, the analytification
functors on coherent modules of schemes and algebraic spaces and the exchange maps for higher
direct images, which every later comparison uses. C1.1–C1.8 compute coherent analytic cohomology: local and
weighted Dolbeault theory (with the Hermitian and Kähler linear algebra it needs) give Cartan's
theorem B, functional analysis gives Cartan–Serre finiteness, and Čech computations on projective
space give twist cohomology and Serre's analytic generation and vanishing. These are the analytic
half of Serre's projective comparison; C1.9 uses them to prove projective and proper coherent
GAGA. They also feed Chow's theorem in C4. C2 states the projective
consequences of GAGA that families need (projection and base change, dictionaries for ideals,
sections and bundles). C0.7 constructs coherent analytic étale descent before C1.9. C3 constructs the quasi-coherator on
the quasi-coherent derived category of an algebraic space, derived limits and proper-support
effectivity, coherent/Picard algebraicity and component/formal-parameter interfaces, and Hall's derived GAGA. C4 proves the
analytic image theorems and uses them, with EtaleCohomologyFoundations §§G.1–G.3’s compactification objects, Nagata theorem and
refinements, to algebraize analytic subspaces and
holomorphic maps out of proper schemes, and compares connectedness of affine curves. C5 is the
de Rham layer, in seven parts: ordinary proper comparison (C5.1), families (C5.2), geometric Hodge
theory (C5.3), integration over analytic cycles (C5.4), logarithmic structures (C5.5), regular
singular connections and the Riemann–Hilbert correspondence (C5.6), and curves with the proper
logarithmic comparison (C5.7). C6 develops stratified topology and topological coefficients,
Riemann existence, finite-level ordinary/compact-support/relative Artin comparison, then adic
comparison using the supplied normalized étale systems. C6.0–C6.5 use the finite-level
foundations independently of adic realization. Each layer ends with its checks and dependencies.

## Layer C−1: Analytic local foundations

### C−1.1 Analytic local models and scheme analytification

Use Mathlib's `AlgebraicGeometry.LocallyRingedSpace` and the holomorphic commutative
ring sheaf of ComplexKahlerGeometry K3–K4. Write `HolomorphicStructureSheaf n` for that
supplied sheaf on `ℂⁿ`, using K3.0's identification of complex smooth and analytic
sections. Its RingCat version is K4's sheaf underlying `smoothSheafCommRing`.
The comparison `HolomorphicStructureSheaf.stalkIso` identifies its native stalk with
K3's convergent-germ ring `ConvergentGerm n a`; `HolomorphicStructureSheaf.restrict`,
`HolomorphicStructureSheaf.coordinate` and `HolomorphicStructureSheaf.localRing` identify
restriction, coordinate sections and the maximal ideal with those supplied by K3–K4.
All these identifications preserve ring maps and germs; for `n = 1`, identify the underlying
sheaf of types with the pinned `TauCeti.holomorphicSheaf`. This is a carrier comparison,
using pointwise evaluation and equality of analytic germs (Freitag, *Complex Spaces*,
2017, I §§1–2, pp. 1–6). *Needs:* ComplexKahlerGeometry K3–K4; Mathlib
`smoothSheafCommRing`; Tau Ceti `TauCeti.holomorphicSheaf`.

**Checks.**

- `HolomorphicSheafChecks.point`: `n=0` gives `ℂ`, with zero maximal ideal.
- `HolomorphicSheafChecks.exponential`: `exp(z)` is a section on `ℂ` although it is not a polynomial.
- `HolomorphicSheafChecks.local`: `z` is in the maximal ideal at zero, whereas `1−z` is a unit in that stalk; its inverse need not extend across `z=1`.

Consume ComplexKahlerGeometry K3's Weierstrass division and preparation, Noetherian
convergent-germ rings and primitive Oka relations, through the preceding stalk isomorphism.
The regular last-variable order `d`, monic degree, vanishing lower coefficients, unique
quotient/remainder and order-zero unit case retain the supplier's hypotheses. For the
completed-stalk comparison prove that completion of this analytic stalk at the coordinate
maximal ideal is `ℂ[[z₁,…,zₙ]]`: Taylor truncation identifies its quotients by powers of that
ideal, and the compatible limit is the formal power-series ring. Consume
RealAnalyticGeometry R3.2 item 0's translation of K3's primitive relations to native
coherence. Identify it on the preceding stalk isomorphism and pass to finitely generated
ideal quotients, retaining their nilpotents, independently of C0.1's analytic-space descent (Freitag I,
Theorems 3.3–3.4, pp. 7–8; §4, pp. 12–14; Theorem 10.3 and Lemma 10.4, pp. 29–33).
*Needs:* ComplexKahlerGeometry K3–K4; RealAnalyticGeometry R3.2 item 0; native sheaf kernels and stalks.

**Checks for convergent local algebra.**

- `WeierstrassChecks.unit`: order `d=0` gives a unit times the degree-zero polynomial 1, with zero division remainder.
- `WeierstrassChecks.double`: dividing by `z²` gives a remainder `a+bz` and completion `ℂ[[z]]`; the quotient germ ring `ℂ{z}/(z²)` retains `z`.
- `WeierstrassChecks.relations`: for the row `(z,w)`, the relation `(−w,z)` is a local generator of its relation module; this tests coherence beyond functions in one variable.

Define `ComplexAnalyticSpace` as a locally `ℂ`-ringed space locally isomorphic to `(V(I), (O_U/I)|_(V(I)))`, for an open `U` in `ℂⁿ` and a finitely generated ideal sheaf `I` of analytic functions. Use the full subcategory of Mathlib's `Over ((Spec (CommRingCat.of ℂ)).toLocallyRingedSpace)` selected by this local-model condition; its morphisms are local ringed-space morphisms commuting with the structure maps to `Spec ℂ`. No Hausdorff axiom is imposed globally. Local charts are Hausdorff. The API `ComplexAnalyticSpace.closedSubspace`, `ComplexAnalyticSpace.openSubspace`, `ComplexAnalyticSpace.glue`, `ComplexAnalyticSpace.fibreProduct`, `ComplexAnalyticSpace.coherentStructure` constructs coherent closed quotients, open restrictions, open gluing and fibre products, and proves coherence of the structure sheaf. Fibre products are locally the product of the ambient charts with the pulled-back defining ideals and the equality equations for the two maps; the sheaf quotient supplies the universal property. Open gluing reuses the ringed-space gluing and preserves the local-model predicate. These operations retain nilpotents. A smooth manifold structure alone does not supply this category. (Freitag II, Definitions 2.1–2.3 and Remark 2.4, pp. 47–48; the finite-limit and open-gluing assertions follow from the given local models.)

**Checks.**

- `ComplexModelChecks.dual`: `I=(z²)` in `ℂ` gives one point with stalk `ℂ[ε]/(ε²)`, and `ε` is nonzero.
- `ComplexModelChecks.unit`: the unit ideal gives the empty space; the zero ideal leaves `U` unchanged.
- `ComplexModelChecks.node`: `I=(xy)` has two tangent directions at zero and is not a smooth one-dimensional manifold there.
- `ComplexModelChecks.doubleOrigin`: gluing two lines along `ℂ ∖ {0}` gives a locally analytic non-Hausdorff space.

Define `complexSchemeAnalytification` as a functor from the full subcategory of `Over (Spec (CommRingCat.of ℂ))` selected by `LocallyOfFiniteType` on the structure morphism to `ComplexAnalyticSpace`; morphisms are over `ℂ`. Its value `X^an` has a canonical local `ℂ`-ringed-space morphism `φ_X:X^an→X`, where `X` is viewed as a locally ringed space over `Spec ℂ`. For `Spec(ℂ[x₁,…,xₙ]/I)`, take the coherent analytic quotient by `I` in `ℂⁿ`, without radicalizing `I`; polynomial evaluation defines `φ_X`. Principal algebraic opens become analytic opens because a germ is invertible exactly when its value is nonzero. Glue these local models over any affine open cover, including infinite covers. No global finite-type, separatedness, reducedness or smoothness assumption is imposed. (SGA 1 XII, Theorem and Definition 1.1 and its construction, retyped pp. 239–241, original pp. 312–315.)

The API `complexSchemeAnalytification.homEquiv` is the bijection `Hom_an(A,X^an) ≃ Hom_{lrs,ℂ}(A,X)`, given by composition with `φ_X`, for every complex analytic space A, natural in A and `X`. The right-hand side is the Hom set in the same locally ringed-space over category after forgetting A's local-model condition and `X`'s scheme structure. It proves uniqueness of the ringed construction, independence of affine presentations and covers, and determines `complexSchemeAnalytification.map`. The API `complexSchemeAnalytification.mapId` and `complexSchemeAnalytification.mapComp` gives the functor laws, and `complexSchemeAnalytification.comparison` gives the naturality equation `φ_Y∘f^an=f∘φ_X`. These are equalities of local ringed-space morphisms, including the sheaf maps. (SGA 1 XII, 1.1–1.2, retyped pp. 239–241.)

The API `complexSchemeAnalytification.complexPoints` identifies the underlying topological space with `X(ℂ)` equipped with the classical topology: on each affine chart this is the zero-locus subspace topology in `ℂⁿ`, and these topologies glue along the algebraic opens. The API `complexSchemeAnalytification.openSubspace`, `complexSchemeAnalytification.closedSubspace` and `complexSchemeAnalytification.fibreProduct` supplies natural isomorphisms of analytic spaces for open restrictions, closed quotients by the extended coherent ideal, and `X×_Z Y`, for locally finite-type complex schemes `X,Y,Z`. These isomorphisms commute with `φ` and the defining inclusions and projections. The API `complexSchemeAnalytification.reduction` identifies `(X_red)^an` with `(X^an)_red`; the underlying topological spaces agree, while `X^an` itself keeps the full analytic ring sheaf. (SGA 1 XII, 1.1(a), 1.2 and Proposition 2.1, retyped pp. 240–242.)

The API `complexSchemeAnalytification.etaleLocalIso` turns an étale morphism into a local biholomorphism of analytic ringed spaces, by the analytic inverse theorem on a standard étale presentation and gluing. The analytic inverse is supplied by `AnalyticAt.exists_openPartialHomeomorph` in Tau Ceti’s `TauCeti.Analysis.Analytic.Inverse`. The API `complexSchemeAnalytification.smooth` identifies analytification of a smooth morphism locally with a projection from a product of an analytic open in the base with an open polydisc. This is an isomorphism of analytic ringed spaces even when the base is singular or nonreduced; for a smooth complex scheme it gives complex manifold charts. The API `complexSchemeAnalytification.separatedHausdorff` proves that separated `X` has Hausdorff `X^an`, by the closed diagonal and the product comparison. The API `complexSchemeAnalytification.finite` and `complexSchemeAnalytification.proper` carries finite and proper morphisms, respectively, to finite and proper analytic morphisms. Here relative separatedness means that the analytic diagonal is a closed immersion. A proper analytic morphism is relatively separated and, over every Hausdorff analytic open chart of the base, has compact inverse images of compact subsets; a finite analytic morphism is proper with finite fibres. These chart conditions do not require the whole base to be Hausdorff. The schemes need only be locally of finite type over `ℂ`; finite and proper algebraic morphisms are themselves of finite type, as required for this comparison. All these comparisons use the same functor and ring sheaf. (SGA 1 XII, Propositions 3.1–3.2, retyped pp. 244–247, original pp. 321–325.)

This roadmap owns the analytic local models, their category, arbitrary open gluing and
`complexSchemeAnalytification` with its analytic ring sheaf and all the comparisons above.
The construction uses ComplexKahlerGeometry K3–K4's holomorphic sheaf and convergent-germ
theory through this section's carrier comparisons,
Mathlib's locally ringed spaces and the cited Tau Ceti analytic inverse theorem.
Restricting its domain to finite-type
complex schemes and forgetting the analytic ring sheaf gives the classical topological carrier.
Coherent and topological consumers take the ring sheaf and topological carrier from this same
analytic space, respectively; its locally finite-type domain
includes infinite affine covers, and its analytic ring sheaf retains nilpotents on singular and
nonseparated schemes.

FormalConnectionsOpers F2.4 takes this functor's `.complexPoints`, `.openSubspace`,
`.fibreProduct`, `.smooth` and `.etaleLocalIso` interfaces on separated smooth finite-type
complex schemes of constant differential dimension. Its fixed-model manifold realization
is compared by the identity on `X(ℂ)`: the coordinate holomorphic functions identify its
function sheaf with this analytic ring sheaf, and the comparison intertwines restrictions,
scheme maps, products and étale local inverses. Fixed-model maximal atlases, second
countability, tangent/derivation, toric, group and gauge comparisons belong to F2.4.
The coherent-module and connection adapters use C0.4 and C5.1–C5.2's prefix;
none of these constructions uses proper GAGA.

*Needs:* ComplexKahlerGeometry K3–K4; Mathlib `AlgebraicGeometry.LocallyRingedSpace`, sheaves of modules, `AnalyticAt ℂ`, analytic power-series and local-ring APIs; Tau Ceti `AnalyticAt.exists_openPartialHomeomorph` in `TauCeti.Analysis.Analytic.Inverse`.

**Checks.**

- `SchemeAnalytificationChecks.affineLine`: the analytified affine line admits `exp(z)` as a holomorphic section and its classical topology is the usual topology on `ℂ`.
- `SchemeAnalytificationChecks.dual`: the dual-number point has one topological point, while its identity and the map `ε↦0` induce different ring-sheaf maps.
- `SchemeAnalytificationChecks.relativeDual`: the smooth affine line over `Spec ℂ[ε]/(ε²)` has analytic product charts retaining `ε` in the base ring sheaf.
- On `G_m`, the identity on complex points identifies F2.4's smooth charts with these
  ringed-space charts; for `z ↦ zⁿ`, `n > 0`, both étale comparisons give the same local
  inverse branches and pullbacks of holomorphic functions.

### C−1.2 Complex analytic quotients and completed stalks

Use the category and scheme analytification built in §C−1.1, including singularities, nilpotents and possibly non-Hausdorff underlying spaces. Its open-immersion, fibre-product and étale-local-isomorphism comparisons are prerequisites of this quotient. The new definition `complexSpaceAnalytification X` applies to a locally separated algebraic space of finite type over `ℂ`. Choose an étale atlas `U→X` that is a finite disjoint union of affine schemes, and its scheme equivalence relation `R=U×_X U`. The affine choice makes the individual scheme analytic charts Hausdorff; it does not force the quotient to be Hausdorff. Analytify both schemes using the scheme functor and take the quotient of `U^an` by `R^an`. The quotient's ring sheaf is the sheaf obtained by gluing `O_(U^an)` along the local biholomorphisms of this relation. It retains the nilpotent ideals, rather than attaching the reduced function sheaf to the point quotient. The API `complexSpaceAnalytification.chart`, `complexSpaceAnalytification.atlasIndependence`, `complexSpaceAnalytification.map`, `complexSpaceAnalytification.mapId`, `complexSpaceAnalytification.mapComp`, `complexSpaceAnalytification.fibreProduct`, `complexSpaceAnalytification.etaleLocalIso`, `complexSpaceAnalytification.separatedHausdorff` consists of the chart maps, comparison isomorphisms and functoriality and base-change equations. The final Hausdorff assertion requires separated `X`.

Prove `analyticRelationLocalChart`, the point at which local separatedness is used. For `u ∈ U(ℂ)`, the diagonal `U→R` is an open immersion because `U→X` is étale. The relation `R→U×U` is an immersion because `X` is locally separated. Near `(u,u)`, the diagonal open in `R` is therefore the intersection of `R` with an ambient open neighbourhood of `(u,u)`. Choose a sufficiently small product neighbourhood `V×V` inside it. Only identity arrows of `R` then have both endpoints in `V`. The quotient map restricted to `V` is injective. The saturation of every open of `V` is open, since the source and target maps of `R^an` are local biholomorphisms; the restricted quotient is thus a homeomorphism onto an open in the quotient. On two such chart images, the unique relation arrow gives the local biholomorphism identifying the analytic sheaves, with the triple equation supplied by composition in `R`. Gluing the local analytic subspace models gives the analytic space. A common refinement `U×_X U′` proves independence of the atlas. The same construction on common refinements defines maps and verifies their identity, composition and fibre-product comparisons.  For separated `X`, the relation is closed in the Hausdorff scheme chart products; its open quotient is Hausdorff. (Conrad–Temkin, §1.1, p. 1, identifies the complex local-separatedness boundary; the local relation argument here proves the stated extension from the scheme analytification construction.)

**Checks.**

- `AnalyticSpaceChecks.affine`: the identity atlas of a finite-type affine complex scheme returns its existing analytification, including the dual-number point. Its topology has one point but `ε≠0` and `ε²=0` in its ring sheaf.
- `AnalyticSpaceChecks.twoCharts`: an atlas with two identical chart copies has a relation identifying the copies; the quotient has one copy, rather than their disjoint union. The identity and cross-copy arrows satisfy the triple equation.
- `AnalyticSpaceChecks.doubledOrigin`: the affine line with doubled origin is locally separated and has a non-Hausdorff analytification. It satisfies chart existence and fails the Hausdorff conclusion, whose separatedness hypothesis excludes it.
- `AnalyticSpaceChecks.branch`: `z↦z²` at zero has derivative zero and is not locally injective. It is not an étale chart, so it cannot replace a relation's local biholomorphism.

Define `completedAnalyticStalkComparison` for a finite-type complex scheme `X` and a complex point `x`. It is the canonical map `O_(X,x)→O_(X^an,x)`, with the API `completedAnalyticStalkComparison.localHom`, `completedAnalyticStalkComparison.completionIso`, `completedAnalyticStalkComparison.flat`, `completedAnalyticStalkComparison.coherentPullbackExact`: the local hom, its isomorphism on maximal-ideal completions, flatness and exact analytification of coherent modules. These are extensions of the scheme analytification construction, which does not itself promise these assertions. On an affine space both completions are the same formal-power-series ring; on a closed subspace the quotient by its finitely generated ideal gives the comparison, including nilpotent equations. Localization and analytic restriction give the general chart, and flatness follows from the Noetherian local completion criterion. For a locally separated space, use the analytic and algebraic étale charts to identify the two stalks at a chosen complex point and descend this comparison. (SGA 1, Exposé XII, Theorem and Definition 1.1 and proof, retyped pp. 239–241, original pp. 312–315; Proposition 1.3.1, retyped p. 242.)

**Checks.**

- `CompletedAnalyticStalkChecks.line`: at zero on `A¹`, the algebraic local ring is `ℂ[z]_(z)`, the analytic stalk is `ℂ{z}`, and both completions are `ℂ[[z]]`. The analytic and algebraic local rings themselves are not equated.
- `CompletedAnalyticStalkChecks.dual`: for the dual-number point the completion is `ℂ[ε]/(ε²)`, not `ℂ`; the comparison retains `ε`.
- `CompletedAnalyticStalkChecks.node`: at the origin of `xy=0`, both completions are `ℂ[[x,y]]/(xy)`, and both tangent spaces have dimension two.
- `CompletedAnalyticStalkChecks.etale`: choosing another étale point chart gives the same canonical comparison after the common-refinement identifications, rather than a chart-dependent power-series substitution.

*Needs:* §C−1.1; AlgebraicModuliForArithmeticGeometry Layer 3 and §§7.6.1/7.7 (algebraic-space atlases and ringed étale sites); SchemeAndStackFoundations Layer 1 (étale relations and descent), and Noetherian local completion and flatness criteria.

### C−1.3 Complex space analytification and local comparison

Define `SpaceAnalytification`. For a complex algebraic space `X` locally of finite type with locally separated diagonal, take an étale scheme presentation `R⇉U` and construct `X^an` as the analytic quotient of `R^an⇉U^an`. The local-isomorphism relation glues analytic structure, including nilpotents. Its quotient sheaf is represented, and `U^an→X^an` is an étale cover with `R^an≅U^an×_{X^an}U^an`.

Complex scheme analytification and its analytic ring sheaf are those of §C−1.1; the quotient construction is §C−1.2. For a locally finite-type space, glue these finite-type constructions on open subspaces.

([Grothendieck et al.](https://arxiv.org/abs/math/0206203), Exposé XII, Theorem and Definition 1.1 and Proposition 1.2, retyped pp. 239–241 (original pp. 312–315); Proposition 1.3.1, retyped p. 242).

The API gives `SpaceAnalytification.chart`: The analytic chart is étale and surjective, with relation equal to its fibre product; `SpaceAnalytification.quotient`: Maps out are exactly maps out of `U^an` equalizing the two relation arrows; `SpaceAnalytification.scheme`: For a scheme, this agrees with the existing scheme analytification, including the structure sheaf; `SpaceAnalytification.map`: A morphism of analytifiable algebraic spaces induces the canonical analytic morphism independent of chart refinements; `SpaceAnalytification.map_id`: Analytifying an identity gives the identity after the canonical quotient comparison; `SpaceAnalytification.map_comp`: Analytification respects composition with the canonical presentation-independent identifications.

*Needs:* §§C−1.1–C−1.2; SchemeAndStackFoundations §§1.4–1.5/1.14 (algebraic-space presentations and descent).

**Checks.**

- `AnalytificationTests.dualNumbers`: For `Spec ℂ[ε]/ε²` the analytic local ring contains the nonzero class `ε` with `ε²=0`.
- `AnalytificationTests.point`: A single field point analytifies to the existing analytic field point.
- `AnalytificationTests.presentation`: A disjoint union presentation of the same scheme gives the same analytification and its actual overlap relation.

Prove `analytification_descent`. For locally separated complex algebraic spaces locally of finite type, the quotient analytification is independent up to unique canonical isomorphism of the chosen étale presentation. It is functorial in morphisms and compatible with fibre products whenever the terms are analytifiable. The scheme comparison respects these identifications; complex étale morphisms yield local analytic isomorphisms.

([Brian Conrad and Michael Temkin](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), Theorem 2.2.3, pp. 7–8; §2.3, pp. 11–13 (Theorem 2.3.1 and Example 2.3.2)).

For the proof, use the common refinement of two étale presentations and the quotient universal property; then lift morphisms on refinements and descend them; uniqueness gives identity and composition; then apply the scheme fibre-product theorem to charts and descend the resulting comparison.

*Needs:* §§C−1.1–C−1.2; `SpaceAnalytification` of this section.

Prove `complex_local_comparison`. For finite-type complex schemes at complex points, isomorphic analytic germs imply isomorphic completed local `ℂ`-algebras and hence a common pointed étale neighbourhood with residue-field isomorphisms. Conversely a common pointed étale neighbourhood yields an isomorphism of analytic germs. These conclusions extend to locally separated finite-type complex algebraic spaces by choosing étale charts and descending the local analytic identifications.

Here Use finite-type complex objects, retain nonreduced analytic structure and respect the chosen complex points. The particular formal automorphism need not itself analytify.

([Michael Artin](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf), Corollary 2.6, pp. 28–29; [Grothendieck et al.](https://arxiv.org/abs/math/0206203), Exposé XII, Theorem and Definition 1.1 and Proposition 1.2, retyped pp. 239–241 (original pp. 312–315); Proposition 1.3.1, retyped p. 242; [Brian Conrad and Michael Temkin](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), Introduction, p. 1; Example 2.3.2, p. 12 (nonarchimedean analogue)).

For the proof, import the analytic/algebraic completed-stalk identification from the scheme analytification substrate; then apply the common étale neighbourhood theorem over `ℂ` to the chart completions; then étale analytification gives local biholomorphisms; compare refinements to descend the germ statement for spaces.

*Needs:* AlgebraicModuliForArithmeticGeometry §6.1 `common_etale_neighbourhood`; §C−1.2 `completedAnalyticStalkComparison`; `analytification_descent` of this section.

**Checks.**

- `ComplexLocalChecks.line`: the identity pointed étale neighbourhood of `A¹` at zero yields the same analytic germ and completed ring `ℂ[[z]]`.
- `ComplexLocalChecks.dual`: the nonreduced point `Spec ℂ[ε]/(ε²)` retains `ε` in both its analytic germ and its completion.
- `ComplexLocalChecks.refinement`: replacing a pointed étale chart by a common refinement preserves the comparison and the residue-field identification; an arbitrary formal automorphism is not asserted convergent.

### C−1.4 Holomorphic SNC coordinates

Consume ResolutionOfSingularitiesCharacteristicZero §§6.2, 6.4's `sncCompactification`
and `sncCoordinates`. For a smooth quasi-projective finite-type complex variety `U`,
the former supplies a smooth projective compactification containing the given `U`
unchanged, with reduced strict-SNC boundary and globally smooth labelled components.
The latter supplies étale coordinates with boundary equation `t₁⋯t_b=0`, with each
incident label assigned to a distinct `t_i`; it applies to any smooth finite-type
complex scheme with a labelled strict-SNC divisor, without a compactness hypothesis.

Prove `analyticPolydisc`. For the complex analytification of a smooth finite-type complex variety with a labelled algebraic strict-SNC divisor, every point a has a biholomorphic neighbourhood chart onto a polydisc `Δⁿ`, sending a to 0, in which the boundary components through a are exactly `z₁=0,…,z_r=0` and other components miss the neighbourhood. Its intersection with the complement is `(Δ*)ʳ×Δ^(n−r)`. The number `r` is the number of incident labels and `r≤n`. This is a local chart result, not an algebraization theorem or a Borel extension theorem.

([Edward Bierstone and Pierre D. Milman](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), §3.1–3.5, pp. 231–233 and SNC coordinate convention, p. 213, for the analytic deduction from the supplied algebraic coordinates using the inverse-function theorem).

For the proof, analytify the étale coordinate chart supplied by `sncCoordinates` and its invertible Jacobian; then apply the complex analytic inverse-function theorem and shrink its image to a product of sufficiently small discs; then use the supplied labelled component equations to identify the punctured factors; shrink away from nonincident components.

*Needs:* ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4 (`sncBoundary`, `sncCompactification`, `sncCoordinates`); §C−1.1; Mathlib `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, Tau Ceti `TauCeti.ContDiffOn.exists_openPartialHomeomorph`.

Do not define a new analytic inverse-function theorem. At the Mathlib pin, `AnalyticAt.hasStrictFDerivAt` gives the strict derivative of an analytic map; `HasStrictFDerivAt.toOpenPartialHomeomorph`, `HasStrictFDerivAt.mem_toOpenPartialHomeomorph_source`, `HasStrictFDerivAt.eventually_left_inverse` and `HasStrictFDerivAt.eventually_right_inverse` provide its local inverse when the derivative is a continuous linear equivalence. `OpenPartialHomeomorph.analyticAt_symm'` proves that this inverse is analytic. The linear equivalence and the complete normed-space assumptions are material. These declarations apply to finite-dimensional complex coordinates with their normed-space structures. Inverse uniqueness lets the resulting analytic germs glue. A nonzero derivative is required in dimension one; in dimension `n` the full Jacobian must be invertible.

Define `sncPolydiscChart` for a smooth finite-type complex scheme or locally separated space `M`, a finite ordered SNC divisor `E`, a point `x`, and the `b` distinct components of `E` through `x`. Its data are an analytic neighbourhood of `x`, positive radii `r_i`, and a biholomorphism to a polydisc in `ℂⁿ` taking `x` to zero and the labelled boundary components to `z₁=0,…,z_b=0`. In particular `b≤n`. The API `sncPolydiscChart.boundary`, `sncPolydiscChart.complement`, `sncPolydiscChart.restrict`, `sncPolydiscChart.permuteLabels`, `sncPolydiscChart.etalePullback` states equality of the reduced boundary, the complement isomorphism, restriction to smaller positive radii, equivariance under relabelling, and transport along an étale chart. Define the punctured polydisc using the product of open metric balls and the inequalities `z_i≠0` for `i<b`. No separate competing notion of a complex manifold or polydisc is introduced.

Prove `snc_exists_polydiscChart`: ResolutionOfSingularitiesCharacteristicZero §6.4's `sncCoordinates` supplies, on an étale chart, regular parameters whose first `b` entries define the labelled components. Their Jacobian at `x` is invertible. Analytification and the analytic inverse theorem produce local holomorphic coordinates; shrink the target neighbourhood to a product of discs with positive radii, avoiding every boundary component not through `x`. Its inverse image is the desired chart, and the vanishing equations identify `E`. Restricting the same biholomorphism identifies the complement with `(Δ*)^b×Δ^(n−b)`. This argument includes dimension zero and empty boundary. For a space, first use the local analytic quotient chart from §C−1.2. The existence assertion is local and assumes no compactness. For smooth quasi-projective varieties, the compactification is supplied by that roadmap's §6.2 `sncCompactification` and retains the given smooth open unchanged. (Deligne, Théorie de Hodge II, (3.1.2), p. 31, the proof of (3.1.9), pp. 33–34, and (3.2.1), pp. 34–35; Mathlib's analytic inverse APIs just cited.)

**Checks.**

- `SNCChartChecks.empty`: `n=b=0` gives the point chart; `b=0` in any dimension leaves the full polydisc as complement.
- `SNCChartChecks.one`: `n=b=1` gives `Δ*`; `z↦2z+z²` has derivative two at zero and inverse linear coefficient `1/2`. Replacing it by `z²` at zero fails invertibility.
- `SNCChartChecks.crossing`: `n=b=2` and `E:xy=0` gives `(Δ*)²`. The complement condition `xy≠0` is `x≠0` and `y≠0`, not removal only of the origin.
- `SNCChartChecks.triangular`: `(u,v)↦(u+v²,v)` has inverse `(u,v)↦(u−v²,v)`; both composites give `(u,v)`. The nonlinear sign is detected by this two-term coordinate witness.
- `SNCChartChecks.singularAmbient`: `xy=0` as the ambient curve is singular at zero; it is not a smooth two-dimensional SNC ambient chart. The definition distinguishes the boundary divisor from its ambient space.

*Needs:* §§C−1.1–C−1.3; ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4 (`sncBoundary`, `sncCompactification`, `sncCoordinates`) for algebraic SNC boundaries, compactifications and étale coordinate charts; Mathlib analytic inverse APIs cited above.

<a id="c0"></a>

## Layer C0: Coherent analytic modules and coherent analytification

Work on a complex analytic space `T` in the sense of §C−1.1,
whose structure sheaf is coherent by `ComplexAnalyticSpace.coherentStructure`. For a scheme `X`
locally of finite type over `ℂ`, write `φ_X : X^an → X` for the canonical morphism of locally
ringed spaces of `complexSchemeAnalytification`.

### C0.1 Coherent analytic modules

Use RealAnalyticGeometry R3.2 item 0's native coherent module predicate and
`CoherentAnalyticModule.presentation_iff`: over a coherent ring sheaf it identifies
the conjunction of finite type and finite-type kernels of every local finite free row
map with `SheafOfModules.IsFinitePresentation`. Extend that same category to a complex analytic
space `T` using its local closed embeddings into manifold charts and sheaf descent.
Here `CoherentAnalyticModule T` is its finite-presentation form, the full subcategory of
Mathlib's `SheafOfModules` over `O_T` on finitely presented objects, with all `O_T`-linear
morphisms. The coherent structure sheaf of C−1.1 makes the supplied identification apply
on every analytic chart, including nonreduced ones; it is compatible with chart changes.
The supplied `CoherentAnalyticModule.ofPresentation` takes a local exact presentation
`O^p → O^q → F → 0` to an object. Prove `CoherentAnalyticModule.hom_ext` for the
descended category: restrictions to an open cover determine a morphism.
`Suggested.lean` records the finite-presentation form over any locally ringed space
using `TauCeti.SheafOfModules.ringCatSheaf`; it represents coherent modules when the
structure sheaf is coherent (Demailly, II.3.11–3.16, pp. 87–88; II §9.4, p. 124).
For the locally ringed space underlying a scheme `X`, this is the pinned
`TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X`. The abbreviation extends that
category to every locally ringed space, including C−1.1's analytic spaces.
*Needs:* RealAnalyticGeometry R3.2 item 0 (predicate, `presentation_iff` and manifold
calculus); Mathlib `SheafOfModules.IsFinitePresentation`;
§C−1.1 `ComplexAnalyticSpace.coherentStructure`.

**Checks.**

- `CoherentAnalyticModule.free`: `O_T^r` is an object, and it is Mathlib's free sheaf of modules of
  rank `r` (rank `0` included); a definition that forgot the module structure would fail the
  comparison.
- `CoherentAnalyticModule.zero`: the zero sheaf is an object, with a presentation of ranks `0` and
  `0`.
- `CoherentAnalyticModule.torsion`: `O_ℂ/(z)` (the skyscraper `ℂ` at `0`) is coherent but not
  locally free at `0`; a definition by local freeness would exclude it.

Prove `coherentOperations` as analytic-space descent of RealAnalyticGeometry R3.2's
manifold calculus: on a complex analytic space, kernels, cokernels, images and extensions
of coherent modules are coherent, the internal Hom of two coherent modules is coherent,
restriction to an open preserves coherence, and coherent modules with
compatible gluing isomorphisms on an open cover glue to a coherent module. Consequently
`CoherentAnalyticModule T` is an abelian full subcategory of all `O_T`-modules, closed under
extensions. Finite tensor products are already coherent by
`TauCeti.SheafOfModules.isMonoidal_isFinitePresentation`, and use that declaration.
On a closed chart `i : T ↪ Ω`, identify coherent `O_T`-modules with coherent
`O_Ω`-modules annihilated by the defining ideal. The supplied manifold operations give
kernels, cokernels and Hom in this subcategory; tensor products are taken over `O_T`.
For a short exact sequence of `O_T`-modules, apply the supplied coherence theorem to
its ambient pushforward; its middle term already has the given `O_T`-module structure. Identify the operations
on chart overlaps and glue by sheaf descent. The pinned tensor supplier constructs the
tensor product as a cokernel by tensoring a finite presentation of the first argument with the
second. The general monoidal structure
and internal Hom of sheaves of modules are AlgebraicVectorBundles'; this theorem adds coherence of
the outputs (Demailly, II.3.13–3.16, pp. 87–88, for kernels, images, cokernels and extensions;
II §9.4, p. 124, for analytic spaces with nilpotents; II, Exercise 11.3 c), p. 127, for Hom; the
tensor product is the cokernel argument just given). *Needs:* `CoherentAnalyticModule`;
RealAnalyticGeometry R3.2 item 0; TauCetiRoadmap.AlgebraicVectorBundles (sheaf-module tensor and internal Hom).

Identify the supplied manifold restriction calculus with the analytic-space restriction
of `coherentOperations`. Use K4's RingCat holomorphic sheaf `R_W` and C−1.1's
ring-sheaf isomorphism. Transport RealAnalyticGeometry R3.2 item 0's module equivalences
on opens and over-sites through this isomorphism, with its unit comparisons, section,
stalk and germ maps and naturality for nested opens and iterated slices. Its preservation
of finite free modules, kernels, finite type, local freeness and finite presentation,
and its stalk-generator and finite-relation shrinking statements are inputs.
Prove that these maps agree with restriction and germs on C−1's analytic-space carrier
and descend on closed quotient charts and their overlaps. In particular a quotient by
`I` uses sections and stalks of `O/I`, rather than its reduced quotient. Use the supplied
`CoherentAnalyticModule.presentation_iff` in each chart; the same identification then
holds globally by locality (Demailly, II.3.11–3.16, pp. 87–88; II §9.4, p. 124).
*Needs:* RealAnalyticGeometry R3.2 item 0 (native restriction and section/stalk/germ
comparisons); ComplexKahlerGeometry K4; C−1.1's analytic-space charts and ring-sheaf
comparison; Mathlib sheaf-module restriction and continuous-pushforward APIs.

**Checks for the manifold restriction interface.**

- Restricting `O_W/(z²)` to a neighborhood of zero preserves its length-two stalk and the
  germ of `z`; the over-site equivalence does not replace the ideal by `(z)`.
- For `V ⊆ U ⊆ W`, successive restriction and direct restriction give the same germ map,
  finite free generators and presentation matrix, under the canonical associativity isomorphism.
- The kernel of `O_ℂ → O_ℂ/(z)` is `(z)` and is of finite type; on `O_ℂ/(z²)`,
  multiplication by `z` has the nonfree coherent kernel `(z)/(z²)`.

### C0.2 Coherent analytic ideals and nilpotent quotients

Define `CoherentAnalyticIdeal T` as the coherent `O_T`-submodules `I ⊆ O_T`. Its closed analytic
subspace is `ComplexAnalyticSpace.closedSubspace` of §C−1.1, with
underlying set the zero locus of `I` and structure sheaf `O_T/I`; `I` is never replaced by its
radical. The API is `CoherentAnalyticIdeal.quotient` (the structure sheaf of the closed subspace is
`O_T/I`), `CoherentAnalyticIdeal.quotientMap` (`O_T → O_T/I` is surjective with kernel exactly
`I`) and `CoherentAnalyticIdeal.pullbackQuotientIso` (for a morphism `g : T' → T`, the pullback of
`O_T/I` is `O_{T'}/I·O_{T'}`: pullback extends the ideal, it does not take the preimage of the
zero set) (Demailly, II.9.10–9.13, p. 124). *Needs:* `coherentOperations`;
RealAnalyticGeometry R3.2 item 0 (coherent ideals and quotient presentations); §C−1.1 `ComplexAnalyticSpace.closedSubspace`.

**Checks.**

- `CoherentAnalyticIdeal.dualNumbers`: for `I = (z²)` on `ℂ`, the stalk of the quotient at `0` is
  `ℂ{z}/(z²)`, with basis `1, z`, `z ≠ 0` and `z² = 0`; replacing `I` by its radical `(z)` gives
  the reduced point and fails.
- `CoherentAnalyticIdeal.zeroIdeal`: `I = 0` gives `T` with its whole structure sheaf.
- `CoherentAnalyticIdeal.unitIdeal`: `I = O_T` gives the empty analytic subspace.

### C0.3 Holomorphic vector bundles and locally free modules

Prove `holomorphicBundleDictionary` as the identification of ComplexKahlerGeometry K4's
native fixed-rank bundle–sheaf equivalence with the finite locally free subcategory of
`CoherentAnalyticModule M`. Here `M` is a finite-dimensional complex manifold, with
`IsManifold 𝓘(ℂ, EM) ω M`, viewed as an analytic space via its zero-ideal charts.
The ring-sheaf isomorphism of C−1.1 and C0.1's open/module transports identify K4's
holomorphic section sheaf on each open with this same native `SheafOfModules` object.
For each `r : ℕ`, the supplied equivalence uses native `VectorBundle ℂ` with model
`Fin r → ℂ` and holomorphic transitions and AlgebraicVectorBundles L0B's
`isFiniteLocallyFreeOfRank` predicate. Identify its unit, counit, morphism and pullback
maps after the ring-sheaf transport. For arbitrary locally constant finite
rank, the bundle carrier consists of a locally constant function `ρ : M → ℕ` and a bundle
with model fibre `Fin r → ℂ` on each clopen stratum `M_r = {x | ρ x = r}`. A morphism between
two such objects is a holomorphic bundle map on each intersection of their rank strata;
source and target ranks may differ. Glue their section sheaves on this disjoint open cover.
Conversely the local ranks of a finite locally free sheaf define `ρ`, and the fixed-rank
dictionary on each `M_r` gives the inverse. This yields the full finite locally free category,
including objects whose ranks differ between components; no global bound on `ρ` or
connectedness assumption is required. Tensor products use the common rank-stratum refinement
and pointwise product of ranks; duals preserve ranks, exterior powers use binomial ranks,
determinants have rank one, and pullback uses `ρ ∘ f`. Compare determinants on fixed-rank
subcategories and on the core of all objects, as in AlgebraicVectorBundles L0C. Prove that these operations correspond
to the module operations of AlgebraicVectorBundles. Use K4's section/reconstruction equivalence on each rank stratum; its naturality supplies
the unit and counit without constructing another section functor or gluing another bundle.
The additional gluing is only the disjoint union of the rank strata, with the operation
comparisons just stated (Demailly, II.3.1–3.6, pp. 83–86).
*Needs:* `coherentOperations`; RealAnalyticGeometry R3.2 item 0's coherence and
finite-presentation comparison; C−1.1's native ring-sheaf comparison;
ComplexKahlerGeometry K4 (fixed-rank section/reconstruction equivalence);
AlgebraicVectorBundles L0B–L0C (finite local freeness and operations).

**Checks.**

- Rank zero: the model fibre `Fin 0 → ℂ` gives the zero section sheaf, and its determinant is `O_M`.
- Fixed positive rank: the trivial model bundle `M × (Fin r → ℂ)` has section sheaf `O_M^r`;
  its dual and pullbacks agree with the fixed-rank dictionary.
- Replacing module frames by holomorphic matrices `h_i` replaces transition matrices by
  `h_i⁻¹ g_ij h_j`; the supplier's change-of-frame isomorphism induces the same section-sheaf
  isomorphism and the same dictionary counit.
- On `M = ℂ ⊔ ℂ`, glue rank one on the first component and rank two on the second to obtain
  `O ⊔ O²`. No single fixed-model-fibre bundle on all of `M` represents this object; the
  clopen-stratum carrier does, and its second exterior power has ranks `(0,1)`.

### C0.4 Coherent analytification

Define `CoherentAnalytification X` for `X` locally of finite type over `ℂ`: the functor from
coherent `O_X`-modules (Tau Ceti's `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` carrier over
a locally Noetherian scheme) to `CoherentAnalyticModule X^an` sending `F` to
`F^an = O_{X^an} ⊗_{φ_X⁻¹O_X} φ_X⁻¹F`, i.e. Mathlib's pullback along `φ_X`. A local finite
presentation of `F` pulls back to one of `F^an`, and `O_{X^an}` is coherent, so `F^an` is coherent.
Its exactness is `completedAnalyticStalkComparison.coherentPullbackExact`. The API is
`CoherentAnalytification.obj` (the displayed tensor pullback), `CoherentAnalytification.map`
(pullback of morphisms, preserving identities and composition), `CoherentAnalytification.tensorIso`
(`(F ⊗ G)^an ≅ F^an ⊗ G^an`, natural) and `CoherentAnalytification.idealQuotientIso`
(`(O_X/I)^an ≅ O_{X^an}/I·O_{X^an}` for a coherent ideal `I`) (SGA 1, Exposé XII, §1.3, printed
p. 241). *Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`;
§C−1.1 `complexSchemeAnalytification`; `CoherentAnalyticModule`.

**Checks.**

- `CoherentAnalytification.structureSheaf`: `(O_X)^an = O_{X^an}` canonically.
- `CoherentAnalytification.freeModule`: `(O_X^r)^an = O_{X^an}^r`, including `r = 0`.
- `CoherentAnalytification.dualNumberQuotient`: for `X = Spec ℂ[ε]/(ε²)`, `(O_X)^an` is the
  length-two algebra `ℂ[ε]/(ε²)` on one point; an analytification of the reduced space would give
  `ℂ`.

On F2.4's smooth finite-type domain, its bundle analytification is the finite locally
free specialization of `CoherentAnalytification`, reconstructed through C0.3's
`holomorphicBundleDictionary`. In local frames both use the same analytified transition
matrices. The identification commutes with restriction, pullback along scheme maps and
change of frame, including locally varying rank; it needs no properness assumption.

Prove `coherentAnalytification_faithful`: for `X` locally of finite type over `ℂ`, coherent
analytification is faithful and reflects isomorphisms and zero objects. A nonzero coherent module
has a closed point in its support (finite type over `ℂ` is Jacobson), closed points are complex
points, and at a complex point `O_{X,x} → O_{X^an,x}` is a flat local homomorphism, hence faithfully
flat, so the stalk of the analytification is nonzero; apply this to kernels, cokernels and images
(SGA 1, XII, Proposition 1.3.1 and its proof, printed pp. 241–242). The functor is not full when `X`
is not proper: on `A¹` multiplication by `exp(z)` is an endomorphism of `O_{A¹,an}` that is not
algebraic (Serre, *GAGA*, n° 12, Remarque 1, printed p. 20, notes that the comparison theorems fail
for affine varieties).
*Needs:* `CoherentAnalytification`; §C−1.2
`completedAnalyticStalkComparison.flat`; Mathlib (a flat local homomorphism of local rings is
faithfully flat); Mathlib `JacobsonSpace` (schemes locally of finite type over a field).

Prove `coherentPullbackOperations`: analytification commutes, by the canonical maps, with tensor
products and internal Hom of coherent modules, with dual and determinant of finite locally free
modules, with restriction to opens, with direct image along closed immersions and with short exact
sequences. For internal Hom present the first argument by two finite free modules and use exactness
of analytification on the resulting kernel; tensor, exterior powers and determinants follow from
the monoidal structure of pullback and local frames (Serre, *GAGA*, n° 14, Lemma 6 and its proof,
printed p. 22; SGA 1, XII, 1.1 a) and 1.3, printed pp. 240–241). *Needs:* `coherentAnalytification_faithful`;
`coherentOperations`; `completedAnalyticStalkComparison.coherentPullbackExact`.

### C0.5 The exchange map for higher direct images

Define `HigherImageComparison f F`. For a morphism `f : X → S` of schemes locally of finite type
over `ℂ`, the square formed by `φ_X`, `φ_S`, `f` and `f^an` commutes, and for every `O_X`-module `F`
there is a canonical morphism in the derived category of `O_{S^an}`-modules
`θ_{f,F} : φ_S^*(Rf_*F) → Rf^an_*(F^an)`, the adjoint of `F → Rφ_{X*}φ_X^*F` pushed forward along
`f`; on cohomology sheaves it gives `θ^q_{f,F} : (R^q f_*F)^an → R^q f^an_* F^an` whenever the left
side is defined as an analytification (for instance when `R^q f_*F` is coherent). The map is defined
for all `f`; properness is only used to prove it invertible, which is
`properSchemeGagaPushforward`. The API is `HigherImageComparison.degreeZero` (`θ⁰` is the
pullback–pushforward adjunction map), `HigherImageComparison.naturality` (a morphism of modules
gives commuting squares in every degree) and `HigherImageComparison.composition` (for composable
`f`, `g` the derived `θ` of `g ∘ f` is the composite of the exchange maps, compatibly with the Leray
edge maps) (SGA 1, XII, 4.1 and (4.1.1), printed pp. 247–248, for the degreewise maps `θ^q` and
their invertibility for proper `f` in Theorem 4.2, pp. 248–249; the derived form and the
composition law are the construction given here). *Needs:* `CoherentAnalytification`;
SchemeAndStackFoundations §2.1 `Sheaf.higherDirectImage`, §2.2 `leray_spectral_sequence`.

**Checks.**

- `HigherImageComparison.identity`: for `f = id`, `θ⁰` is the identity and all positive higher
  images vanish on both sides.
- `HigherImageComparison.twist`: for `P¹ → Spec ℂ` and `O(−2)`, `θ¹` sends the class of the inverse
  Laurent monomial `z₀⁻¹z₁⁻¹` in the algebraic Čech complex of the standard cover to the same class
  in the analytic Čech complex; a comparison built from arbitrary chosen isomorphisms in each degree
  would not be pinned by this.
- `HigherImageComparison.nonreducedPoint`: for `Spec ℂ[ε]/(ε²) → Spec ℂ`, `θ⁰` is the identity of the
  two-dimensional algebra and keeps `ε ≠ 0`.

### C0.6 Fibre-dimension loci

Define and prove `analyticSetGeometry` on reduced complex analytic spaces: local dimension,
finite decompositions of analytic germs into irreducible branches, the closed analytic singular
locus and dense open manifold regular locus. On Hausdorff second-countable spaces, construct the
locally finite global irreducible components, distinguishing them from branches at a point.
For each irreducible germ of dimension `d`, construct a finite projection of a sufficiently small
representative onto a polydisc in `ℂᵈ`, an analytic discriminant, and a constant positive sheet number
off that discriminant. Construct finite analytic normalization, its isomorphism over the regular
locus and its stalk description by integral closure in the total ring of fractions. Prove
compatibility with open restriction and invariance of local dimension under nilpotent reduction.
Consume ComplexKahlerGeometry K3's reduced analytic-set geometry and finite projections on
ambient chart domains. This target descends them to the analytic-space carrier of C−1.1,
proves chart independence and constructs the finite normalization there, using the supplied
Weierstrass and coherence APIs (Demailly, II §§4–7, pp. 90–115, especially II.4.7,
II.4.19, II.4.31, II.5.3 and II.7.9–7.15). *Needs:* §C−1.1
(`ComplexAnalyticSpace`, `coherentStructure`); ComplexKahlerGeometry K3's reduced chart geometry
and Weierstrass division.

**Checks.**

- A reduced point has dimension zero, is regular and is its own normalization; a nilpotent
  thickening of the point still has dimension zero.
- The node `xy = 0` has two branches at zero, singular locus `{0}`, and normalization the disjoint
  union of the two lines.
- The cusp `y² = x³` has one branch at zero and a nontrivial normalization
  `t ↦ (t²,t³)`; projection to `x` has two sheets away from zero.

Prove `fibreDimensionLoci` (Cartan–Remmert): for a holomorphic map `f : T → S` of finite-dimensional
complex analytic spaces and `k ≥ 0`, the set
`A_k = {x ∈ T : dim_x f⁻¹(f(x)) ≥ k}` is a closed analytic subset of `T` (with its reduced
structure). Properness is not assumed. Upper semicontinuity of the fibre dimension (Demailly,
II.8.2, p. 116) shows `A_k` is closed; analyticity is the stronger statement (Peterzil–Starchenko,
*Complex analytic geometry in a nonstandard setting*, Theorem 7.2 and Lemma 8.2, author PDF
pp. 21–23, where analyticity of `A_k` is quoted from Whitney, *Complex Analytic Varieties*,
Theorem 9F, p. 240, whose proof is the one relied on). Nilpotents do not change local fibre
dimensions. Only the `B_k` statement of `remmertProperImage` (C4.1) uses the analyticity; elsewhere
closedness suffices. *Needs:* §C−1.1
(`ComplexAnalyticSpace`, `ComplexAnalyticSpace.fibreProduct`); `analyticSetGeometry`.

### C0.7 Coherent analytification on algebraic spaces

Prove `analyticEtaleDescent`. Let `X` be a locally separated algebraic space of finite type over `ℂ`,
`U → X` an étale presentation by a scheme, `R = U ×_X U`. Then `U^an → X^an` (from
`complexSpaceAnalytification`) is a surjective local biholomorphism with
`R^an ≅ U^an ×_{X^an} U^an`, and pullback identifies coherent analytic modules on `X^an` with
coherent analytic modules on `U^an` equipped with effective descent data along `R^an ⇉ U^an`.
Defining `F^an` for a coherent `O_X`-module `F` as the descent of `(F|_U)^an` with the analytified
descent datum gives a functor `SpaceCoherentAnalytification X`, independent of the presentation up
to canonical isomorphism, extending `CoherentAnalytification` on schemes, exact and faithful, and
compatible with the algebraic étale descent of AlgebraicModuliForArithmeticGeometry Layer 3 and
SchemeAndStackFoundations Layer 1. The charts `U` need not be proper and no GAGA statement is made about
them (Hall, *GAGA theorems*, Example 9.8, pp. 23–24, for the analytification of locally separated
algebraic spaces, under which étale morphisms become local isomorphisms; SGA 1, XII, §1, printed
pp. 239–242, and §3, 3.1 (iii), 3.2 (i) and Remark 3.3 a), printed pp. 244–247, for étale and
surjective morphisms of schemes; the effective descent of coherent modules along the surjective
local biholomorphism `U^an → X^an` is sheaf gluing on the analytic side and is proved here). *Needs:* §C−1.2 `complexSpaceAnalytification`;
`CoherentAnalytification`; `coherentAnalytification_faithful`; SchemeAndStackFoundations Layer 1;
AlgebraicModuliForArithmeticGeometry Layer 3.

The functor preserves tensor, coherent internal Hom, open restriction and closed
pushforward by descent of C0.4's comparisons. Finite local presentations and flat analytic
stalk maps compare every coherent local Ext sheaf; this does not assert global Ext or
cohomology isomorphisms on nonproper charts. Glue the canonical morphism of ringed sites
and the adjunction construction of C0.5 to define cohomology and derived exchange maps
for morphisms of these spaces. Their pullbacks to étale charts agree with the scheme maps;
prove compatibility with refinement, composition and local-to-global Ext spectral sequences.
Invertibility under properness is C1.9. Algebraic descent is specifically
AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.coherentPresentationDescent`,
using [Stacks 04W8](https://stacks.math.columbia.edu/tag/04W8),
[07UB](https://stacks.math.columbia.edu/tag/07UB) and
[07UC](https://stacks.math.columbia.edu/tag/07UC) for the locally Noetherian
coherent category. Analytic descent is local gluing along local biholomorphisms, with
C0.1's native restrictions, and uses no proper GAGA theorem.
*Needs:* C0.1–C0.5; §C−1.2; AlgebraicModuliForArithmeticGeometry §3.5 and §7.7;
SchemeAndStackFoundations §§1.10–1.11 and §2.2.

**Checks.**

- `SpaceCoherentAnalytification.scheme`: for a scheme `X` with the identity presentation the functor is
  `CoherentAnalytification X`, including on the dual-number point, where `(O_X)^an = ℂ[ε]/(ε²)`.
- `SpaceCoherentAnalytification.twoCharts`: for the presentation `U ⊔ U → X` by two copies of the same
  chart, the restriction of the descended module to either copy of `U^an` is `(F|_U)^an`;
  the descent isomorphism identifies the two pullbacks rather than doubling the module.
  For `z ↦ z² : G_m → G_m` and `F = O/(t−1)`, the descended support is `{t=1}` on the base,
  while its pullback to either chart has support `{z=±1}`.
- `SpaceCoherentAnalytification.doubledOrigin`: on the affine line with doubled origin (a locally
  separated, non-separated algebraic space) the structure sheaf analytifies to the structure sheaf of
  the non-Hausdorff analytic space; the construction does not require separatedness.

### Examples

- On `ℂ`, multiplication by `z` on `O/(z²)` has kernel `zO/(z²)` and cokernel `O/(z)`, both coherent;
  the kernel is not free of rank one over `O`.
- For `f : ℂ² → ℂ`, `(z, w) ↦ zw`, every fibre has local dimension one, so `A₁ = ℂ²` and `A₂ = ∅`;
  for the blow-up of `ℂ²` at `0`, `A₁` is the exceptional curve and `A₀` is the whole source.
- The locally finite-type scheme `∐_{n≥0} Aⁿ_ℂ` analytifies to `∐_{n≥0} ℂⁿ`, with locally
  finite dimension and no uniform dimension bound.
- On `A¹`, the holomorphic endomorphism of `O_{A¹,an}` given by multiplication by `exp(z)` is not the
  analytification of an algebraic endomorphism: analytification is exact and faithful but not full
  on nonproper schemes.
- On `P¹`, the analytic dual of `O(1)^an` is `O(−1)^an` and the determinant of `O(1) ⊕ O` is `O(1)`.

### Dependencies

§§C−1.1–C−1.2; ComplexKahlerGeometry K3–K4; RealAnalyticGeometry R3.2 item 0;
AlgebraicModuliForArithmeticGeometry §3.5 and §7.7; SchemeAndStackFoundations Layers 1–2; Mathlib `JacobsonSpace`; TauCetiRoadmap.AlgebraicVectorBundles; Mathlib sheaves of modules and vector bundles; Tau
Ceti `FinitelyPresentedSheaf`.

<a id="c1"></a>

## Layer C1: Analytic coherent cohomology and GAGA

Sections C1.1–C1.8 compute coherent analytic cohomology by analysis alone, providing the
inputs for coherent GAGA in C1.9 and Chow's theorem in C4. Their outputs are Cartan's theorem B on strongly 1-complete spaces, Cartan–Serre finiteness on compact
spaces, the cohomology of analytic twisting sheaves on projective space in every degree, and
Serre's analytic generation, vanishing and finite twist presentations. Smooth forms on open subsets
of `ℂⁿ` use Mathlib's `ContDiff ℝ ∞` functions; `∂̄ = d''` is the `(0,1)`-part of the real
derivative, `∂f/∂z̄ⱼ = ½(∂f/∂xⱼ + i ∂f/∂yⱼ)`.

### C1.1 The supplied local Dolbeault resolution

Consume GlobalHolomorphicFunctions GH0.3's scalar compact-support Cauchy–Green and
finite-rank Runge results through ComplexKahlerGeometry K2's parameter-dependent solver.
The latter supplies smooth `(p,q)` primitives for `q ≥ 1` on polydiscs, with jointly
smooth holomorphic parameters, and the fine resolution of holomorphic `p`-forms on a
finite-dimensional Hausdorff second-countable complex manifold.
Prove `localDolbeault` as the comparison of that supplied resolution with C0's sheaves:
under C−1.1's ring-sheaf identification and `holomorphicBundleDictionary`, its degree-zero
kernel is the same native module `Ω^p`, its augmentation is the holomorphic-section
inclusion, and its restrictions and pullbacks commute with those of C0. The induced
Dolbeault/sheaf-cohomology isomorphism is K2's Ext-based comparison on this carrier.
For a holomorphic finite-rank bundle use K4's section sheaf and K2's bundle-valued
comparison, stratum by stratum when ranks vary. This proves equality of the comparison
maps through local frames and their change-of-frame equations (Demailly, I.3.29, p. 28;
Serre, *Faisceaux analytiques sur l'espace projectif*, exposé 18, §1, nos. 1–3,
pp. 18-1–18-4, for holomorphic parameters).
*Needs:* GlobalHolomorphicFunctions GH0.3; ComplexKahlerGeometry K2–K4;
C−1.1; C0.1–C0.3. No local scalar solution operator is constructed here.

**Checks.**

- In degree `(0,0)` the kernel consists of the same holomorphic functions as K4's ring
  sheaf; on `ℂ` the function `exp(z)` is included.
- For a smooth compactly supported radial function equal to one near zero, the supplied
  transform has `∂̄Tg(0) = 1` with kernel `1/(π(z−w))`, fixing its sign and area normalization.
- If the input depends holomorphically on a parameter, the transported primitive retains
  that dependence; a partition of unity in that complex parameter is not permitted.
- A bundle of ranks one and two on `ℂ ⊔ ℂ` gives the supplied resolution on each component,
  with the same sheaf restriction maps as C0.3.

### C1.2 Supplied Hodge operators and their normalization

Use ComplexKahlerGeometry K5a's pointwise real star and its complex-linear extension on
DifferentialGeometry's actual exterior/alternating bundles, with the supplied Riemannian
volume density and geometric L² pairing. Under the conjugate-first metric convention,
`α ∧ *β̄ = h(β,α) vol`; the conjugation belongs to the pairing, not to the linear star.
Use the supplied codifferential `δ = (−1)^{m(r+1)+1} * d *` and nonnegative Laplacian
`Δ_d = dδ + δd`. K5b.0 supplies the type-form adjoint and Dolbeault symbol, and K6.0
supplies `[Λ,∂̄] = −i∂*`, `[Λ,∂] = i∂̄*` and `Δ_d = 2Δ_∂ = 2Δ_∂̄` on Kähler
manifolds. These are local identities; no compactness assumption is used. General
Hermitian manifolds retain their torsion terms (Demailly, VI.3.1–3.14, pp. 291–294;
VI.6.1–6.9, pp. 304–307).
*Needs:* ComplexKahlerGeometry K5a pointwise/formal-adjoint layer, K5b.0 and K6.0.

**Checks for the supplied normalization.**

- The star on a positively oriented point is `id`, and on a negatively oriented point
  it is `−id`, agreeing with Mathlib's signed degree-zero volume forms.
- On the positively oriented Euclidean plane, `*dx = dy`, `*dy = −dx`, and
  `*(iα) = i(*α)`; reversing orientation changes the star's sign.
- On real two-dimensional one-forms, `δ = −*d*`; on functions the supplied nonnegative
  `Δ_d` is `−laplaceBeltrami`, and in `ℝ³` takes `x₁²` to `−2`.

For the Euclidean adapter `hodgeLaplacianFun`, prove compatibility with the function
part of the supplied Laplacian, complexification, and linearity on twice differentiable
real functions. It is the negative of Mathlib's `Laplacian.laplacian` and of
DifferentialGeometry's `laplaceBeltrami` (Demailly, VI.3.9–3.14, pp. 292–294).
*Needs:* ComplexKahlerGeometry K5a's function-Laplacian comparison;
Mathlib `Laplacian.laplacian`.

**Checks for `hodgeLaplacianFun`.**

- Constants have value zero.
- On `ℝ³`, the value on `x₁²` is `−2`.
- On a zero-dimensional Euclidean space every function is constant and the operator is zero.

### C1.3 Supplied Chern connection and curvature conventions

Use ComplexKahlerGeometry K4's unique Chern connection on a native finite-rank
holomorphic bundle with smooth Hermitian metric, through C0.3's section-sheaf
identification. Identify its `(0,1)` operator with C1.1's transported Dolbeault operator.
The conjugate-first local metric is `h(s,t) = s* H t`, so the supplied connection and
curvature are `D = d + H⁻¹∂H` and `Θ = ∂̄(H⁻¹∂H)`. Its `(1,1)` curvature, metric
compatibility and tensor/dual/pullback laws use K4's native maps (Demailly, V.10.3 and
V.12.1–12.2, pp. 267–269). Prove the convention comparisons on these maps: the Hodge
pairing is `h(β,α)`, a line metric `e^{−φ}` has `Θ = ∂∂̄φ`, and the normalized real
Chern form is `(i/2π)Θ`. With the supplier's `d^c = i(∂̄−∂)` and this roadmap's
`d_c = d^c/(4π)`, prove `dd_c = (i/2π)∂∂̄`; these operators are related by a scalar
comparison, not definitional equality.

Consume ComplexKahlerGeometry K6.0's local Bochner–Kodaira identity on Kähler manifolds:
`Δ''_E = Δ'_E + [iΘ(E),Λ]`. The corresponding compact-support energy identity uses
K5a's geometric L² pairing, K5b.0's adjoint and these same curvature conventions
(Demailly, VII.1.1–1.3, pp. 329–331). Verify its transport through the section/type
comparisons; all torsion terms vanish under the stated Kähler hypothesis.
*Needs:* `holomorphicBundleDictionary`; `localDolbeault`; ComplexKahlerGeometry
K4, K5a's local formal adjoints, K5b.0 and K6.0.

**Checks.**

- The trivial line with constant metric has `D = d` and `Θ = 0` under both section carriers.
- The metric `e^{−|z|²}` has `Θ = dz ∧ dz̄` and positive `iΘ`; its Chern form is
  `(i/2π)dz ∧ dz̄ = dd_c |z|²`, fixing the `4π` adapter.
- On `ℂ²`, the curvature commutator of this Gaussian line is `−id` on `(0,1)`
  and `+id` on `(2,1)` for `ω = iΣ dzⱼ ∧ dz̄ⱼ`; positivity cannot be moved between
  bidegrees without the canonical-bundle twist.

### C1.4 The weighted L² estimate

Prove `weightedDolbeaultEstimate` as the transport of RealAnalyticGeometry R3.1's
weighted theorem through C0.3's bundle–sheaf dictionary. Let `(M, ω)` be a complete
Kähler manifold of positive complex dimension `n`, Hausdorff, second countable and without
boundary, and `E` a finite-rank holomorphic bundle with a smooth Hermitian metric. For `1 ≤ k ≤ n`, a smooth real weight `φ` and pointwise
positive definite `B = [iΘ(E) + i∂∂̄φ ⊗ id_E, Λ]` on `(n,k)`-forms,
distributionally closed weighted L² data `f` with finite inverse-curvature integral
admit the minimal solution with
`∂̄u = f` and `∫ |u|²e^{−φ} ≤ ∫ h(B⁻¹f,f)e^{−φ}`.
If `B ≥ ε id` for a constant `ε > 0`, then
`‖u‖_φ ≤ ε^(−1/2) ‖f‖_φ`; pointwise positivity alone supplies no uniform
closed-range constant. Use R3.1's maximal distributional domain, adjoint, graph-domain
density and weighted local regularity, including smoothness for smooth data; their
construction belongs to that supplier (Demailly, VIII.3.2–3.3, pp. 368–369;
VIII.4.5–4.8, pp. 371–372).

Identify the bundle-valued `(0,k)` Dolbeault complex with the `(n,k)` complex valued
in `E ⊗ K_M⁻¹`, with its induced metric. Prove that C0.3's section-sheaf transport
intertwines this supplied canonical identification, its `∂̄`, norms and curvature
operator with C1.1–C1.3's geometric conventions. The metric curvature of `K_M⁻¹`
remains in `B`; retain positivity and finite inverse-energy hypotheses on that twisted
bundle. The distributional equation commutes with open restriction: the global solution
restricts to a solution, whose integrals on that open obey the global bound. Minimality
and the adjoint's boundary domain need not persist on restriction. Applying the theorem
anew on an open set requires a complete metric there.
*Needs:* RealAnalyticGeometry R3.1 (weighted theorem, canonical twist, graph-domain
density and regularity); C0.3; C1.1–C1.3; ComplexKahlerGeometry K4 (Chern connection);
SmoothBundlesConnections B2's native geometric L² sections.

**Checks for the weighted comparison.**

- `B = 0` is outside the positive-definite hypothesis. For zero data the minimal solution
  is nevertheless zero; the comparison does not assert solvability for arbitrary data
  with zero curvature.
- On complete `ℂⁿ` with a Gaussian line metric, the `(n,k)` curvature eigenvalue is `k`
  in the `ω = iΣ dzⱼ ∧ dz̄ⱼ` convention, giving the bound `k^(−1/2)` for `k ≥ 1`.
- A positive curvature eigenvalue tending to zero gives a pointwise inverse-weight
  estimate, with no asserted constant `ε`; restricting to an incomplete open ball
  does not by itself satisfy the complete-metric hypothesis.
- For scalar `(0,k)` data the canonical identification uses `E ⊗ K_M⁻¹` with its
  induced metric; the Ricci contribution remains in `B`.

### C1.5 Strongly 1-complete spaces and Cartan A/B

Use `SteinManifold M` for RealAnalyticGeometry R3.0–R3.1's Stein predicate on a
finite-dimensional Hausdorff second-countable complex manifold: holomorphic convexity,
global point separation and holomorphic local coordinates supplied by global functions.
Transport its holomorphic functions, compact hulls, separating functions and coordinate
maps through C−1.1's structure-sheaf comparison. The holomorphic hull of a compact `K`
is `{x : ∀ f ∈ O(M), |f(x)| ≤ sup_K |f|}`; the empty hull is empty.
Use R3.1's equivalence with a smooth strictly plurisubharmonic exhaustion, including
its countable-discrete dimension-zero case (Demailly, I.6.6–6.8 and I.6.13–6.18, pp. 47–51).
*Needs:* RealAnalyticGeometry R3.0–R3.1 (Stein predicate and exhaustion criterion);
§C−1.1 `HolomorphicStructureSheaf`.

**Checks.**

- `ℂⁿ`, including `n = 0`, is Stein: coordinates separate points and bound compact hulls.
- A polydisc with positive radii is Stein; its compact hull stays inside a smaller closed polydisc.
- `P¹` is holomorphically convex but not Stein: its global holomorphic functions are constant,
  so they neither separate distinct points nor supply local coordinates.

Define `StronglyOneComplete T` for a Hausdorff second-countable complex analytic space `T`: there is a smooth exhaustion
function `ψ : T → ℝ` (all sublevel sets relatively compact) that is strictly plurisubharmonic,
meaning that `T` is covered by local embeddings into opens `Ω ⊆ ℂᴺ` on which `ψ` extends to a smooth
function with positive definite complex Hessian. The API is
`StronglyOneComplete.closedSubspace` (a closed analytic subspace of a strongly 1-complete space is
strongly 1-complete, by restricting `ψ`), `StronglyOneComplete.prod` (products, with `ψ₁ + ψ₂`) and
`StronglyOneComplete.ofStein` (a Stein manifold is strongly 1-complete) (Demailly, I.6.13–6.18,
pp. 49–51, for manifolds; IX.2.1, IX.2.5 and IX.2.7, pp. 409–410, for analytic schemes).
*Needs:* §C−1.1 (`ComplexAnalyticSpace`, local embeddings);
`SteinManifold` and RealAnalyticGeometry R3.1's exhaustion theorem for
`StronglyOneComplete.ofStein`.

**Checks.**

- `StronglyOneComplete.polydisc`: a polydisc `∏ {|zᵢ| < rᵢ}` is strongly 1-complete with
  `ψ = |z|² − Σ log(rᵢ² − |zᵢ|²)`.
- `StronglyOneComplete.torusProduct`: `ℂᵃ × (ℂ*)ᵇ` is strongly 1-complete with
  `ψ = |z|² + |w|² + Σ (log|wⱼ|)²`; `|z|² + |w|²` alone is not an exhaustion near `wⱼ = 0`.
- `StronglyOneComplete.notCompact`: a compact space of positive dimension, such as `P¹`, is not
  strongly 1-complete (a strictly plurisubharmonic function has no interior maximum on a positive
  dimensional space); the point is.

Prove `StronglyOneComplete.completeKaehlerMetric` as the manifold transport of
RealAnalyticGeometry R3.1's complete exhaustion metric. Given a smooth strictly
plurisubharmonic exhaustion `ψ`, identify its supplied complete Kähler metric
`i∂∂̄χ(ψ)` on C−1's manifold carrier, for the increasing convex `χ` chosen by that
supplier. For nonnegative `ψ`, the choice `χ(t) = t + t²` gives
`ω̂ = i∂∂̄ψ + i∂∂̄(ψ²)` and the bound by `2i∂ψ ∧ ∂̄ψ` controls the lengths of
escaping paths. Compare the metric, Levi form and path lengths under the transport
(Demailly, VIII.2.4, pp. 366–367, and VIII.5.2, p. 372).
*Needs:* `StronglyOneComplete`; RealAnalyticGeometry R3.1 (complete metric and
length bound); DifferentialGeometry's metric, forms and length APIs.

**Checks.**

- On `ℂⁿ`, `ψ = |z|²` gives a metric dominating the complete Euclidean metric.
- On the unit disc, `ψ = −log(1 − |z|²)` gives infinite length to every escaping path,
  including a radial path approaching the boundary.
- In dimension zero the forms vanish and the resulting metric is complete; on a positive
  dimensional compact manifold no strictly plurisubharmonic exhaustion exists.

Prove `cartanTheoremB`: on a strongly 1-complete complex analytic space `T` (finite-dimensional,
Hausdorff, second countable, nilpotents allowed), `H^q(T, F) = 0` for every coherent analytic module `F` and
every `q ≥ 1`. In particular this holds on polydiscs, on `ℂᵃ × (ℂ*)ᵇ`, on their closed analytic
subspaces and on Stein manifolds. A finite open cover by itself proves nothing of the kind. The
manifold case is RealAnalyticGeometry R3.2's coherent Cartan B, transported through
C0.1–C0.3; its Stein hypothesis is supplied by R3.1's exhaustion criterion.
For analytic spaces, extend that theorem using local free resolutions in ambient
manifold charts and a countable exhaustion by sublevels with Runge approximation.
Use the supplier's approximation and exact section maps on the manifold charts;
prove the overlap and exhaustion-limit comparisons for the analytic-space restrictions,
including modules annihilated by nonradical chart ideals. No Laplacian is placed on a
singular or nilpotent locus (Demailly, IX.4.1, pp. 419–420;
IX.4.10–4.11 with `q = 1`, p. 425; IX.4.12–4.13, pp. 426–428).
*Needs:* RealAnalyticGeometry R3.1–R3.2 (Stein criterion, approximation, coherent
Cartan B and exact sections); `StronglyOneComplete`; `coherentOperations`;
C0.1–C0.3's chart and manifold transports.

**Checks for the manifold input and analytic-space Cartan B.**

- On `ℂ²` with `ω = iΣ dzⱼ ∧ dz̄ⱼ`, the trivial line with metric `e^{−|z|²}` has
  `[iΘ,Λ] = −id` on `(0,1)`-forms and `+id` on `(2,1)`-forms; the canonical twist fixes the degree.
- For `F = O_M`, the identification is `A^{0,q}(O_M) ≅ A^{n,q}(K_M⁻¹)` and preserves `∂̄`.
- On the nonreduced closed subspace `(z² = 0)` of a polydisc, Cartan B applies to
  the whole structure sheaf and its coherent ideals; it does not discard the class of `z`.

Prove `cartanTheoremA`: for a finite-dimensional Hausdorff second-countable strongly
1-complete complex analytic space `T`, nilpotents allowed, and coherent `F`, global sections
generate each stalk. Equivalently the evaluation
`Γ(T,F) ⊗_(Γ(T,O_T)) O_{T,x} → F_x` is onto for every `x`.
Apply `cartanTheoremB` to the coherent kernel of
`F → F/𝔪_xF`, lift a basis of the finite-dimensional fibre, and use Nakayama at `x`.
Consequently finitely many global sections generate near any specified compact subset;
no finite global generating tuple on an arbitrary noncompact space is asserted.
If a specified finite global tuple generates `F` everywhere, B applied to its coherent
relation kernel gives global coefficient lifting for every section. These evaluation and
coefficient maps commute with the open restriction/germ maps of C0.1 (Demailly,
II.3.13–3.16, pp. 87–88, and IX.4.10–4.13 with `q = 1`, pp. 425–428; the
skyscraper-kernel argument gives A from B).
*Needs:* RealAnalyticGeometry R3.2 (manifold Cartan A and coefficient lifting);
`cartanTheoremB`; `coherentOperations`; coherent point ideals and Nakayama.

**Checks for Cartan A and coefficient lifting.**

- The skyscraper `O_ℂ/(z)` is globally generated although it is not locally free at zero.
- On the dual-number analytic point, the stalk and evaluation retain the nonzero
  nilpotent; generating only the reduced quotient does not give the evaluation map itself.
- On a compact subset, a finite subcover selects finitely many global generators;
  this compactness argument supplies no such bound for an arbitrary noncompact set.

On manifolds, identify the evaluation, coefficient lifting and exact global-section
maps of `cartanTheoremA` and `cartanTheoremB` with RealAnalyticGeometry R3.2's
maps on the native K4 ring/module carriers. Transport its coherent approximation:
for `F` coherent on the whole Stein manifold, a section near a holomorphically convex
compact is approximable there by global sections. The topology is the supplied
finite-presentation quotient topology, independent of presentation. Prove that these
maps and topologies agree under C0's ring-sheaf comparison, that restriction is
continuous, and that section-to-stalk and germ maps commute with those identifications
(Demailly, IX.4.6, p. 422, and IX.4.10–4.13, pp. 425–428).
*Needs:* RealAnalyticGeometry R3.1–R3.2 (Stein approximation and coherent Cartan maps);
C0.1–C0.3's restriction and manifold transports.

**Checks for the manifold comparison.**

- On a countable discrete complex manifold the exhaustion and point separation are
  direct, and every coherent stalk is generated without a positive-dimensional estimate.
- The Gaussian example in C1.3 is negative on `(0,1)` but positive on `(2,1)`;
  the scalar/bundle comparison includes `K_M⁻¹` and its metric curvature.
- Restriction from a Stein manifold to an open set preserves coherent presentations
  and germ maps. Cartan A/B on the open set requires that open set itself to be Stein;
  its inherited metric need not be complete.

### C1.6 Montel, Schwartz and Cartan–Serre finiteness

Prove `montelTheorem`: for an open `Ω ⊆ ℂⁿ`, a sequence of holomorphic functions on `Ω` that is
uniformly bounded on every compact subset has a subsequence converging uniformly on compact
subsets, and the limit is holomorphic; equivalently, for `Ω' ⋐ Ω` the restriction map between the
Fréchet spaces of holomorphic functions is compact (Demailly, I.3.12, p. 23). It differs from Tau
Ceti's `TauCeti.montel` only in allowing several variables: Cauchy estimates on polydiscs give
equicontinuity on compacts and the Arzelà–Ascoli argument of the one-variable proof applies
unchanged. *Needs:* Tau Ceti `TauCeti.montel` (the one-variable case and its compactness
argument); Mathlib Arzelà–Ascoli, Cauchy estimates.

Prove `frechetOpenMapping`: every continuous complex-linear surjection between complete
metrizable Hausdorff locally convex complex vector spaces is open. No separability or normability
is assumed. Use Baire category and absorbing balanced neighbourhoods to obtain a neighbourhood
in the closure of each image, then successive approximation in a decreasing neighbourhood basis
to remove the closure (Demailly, IX.1.7–1.10, pp. 405–408, for the open-mapping input and its uses;
the Baire and approximation argument is part of this target). *Needs:* Mathlib Baire category,
complete uniform additive groups, locally convex spaces and continuous linear maps.

**Checks.**

- A surjection of complex Banach spaces recovers Mathlib's Banach open mapping theorem.
- The shift `(z₀,z₁,…) ↦ (z₁,z₂,…)` on `ℂ^ℕ` with its complete product topology is open;
  this topology is not normable.
- The continuous bijection from finitely supported sequences with the `ℓ¹` norm to the same
  space with the `ℓ²` norm is not open: completeness cannot be omitted.

Prove `schwartzFiniteness` (L. Schwartz): let `E`, `F` be Fréchet spaces, `g : E → F` a continuous
linear surjection and `h : E → F` a compact linear map. Then `g + h` has closed image of finite
codimension (Demailly, IX.1.8–1.9, pp. 406–407). Its special case for Banach spaces is
`schwartzFiniteness_banach`. *Needs:* `frechetOpenMapping`; Mathlib `IsCompactOperator`.

Prove `cartanSerreFiniteness`: for a compact Hausdorff second-countable complex analytic space `T` (nilpotents allowed) and a
coherent analytic module `F`, every `H^q(T, F)` is a finite-dimensional complex vector space, and
`H^q(T, F) = 0` for `q > dim T`. The sections of a coherent module on a distinguished chart carry a
Fréchet topology induced from a local presentation; construct this topology and its
independence of presentation using `frechetOpenMapping`; for finite covers `U'_α ⋐ U_α` by strongly
1-complete charts both Čech complexes compute `H^q` (Cartan B and SchemeAndStackFoundations §2.2), the refinement map is
compact by Montel and surjective on cohomology, and Schwartz's theorem gives finite dimension
(Demailly, IX.4.6–4.8 and proof, pp. 422–424; vanishing above the dimension IX.4.15, p. 428).
*Needs:* `montelTheorem`; `frechetOpenMapping`; `schwartzFiniteness`; `cartanTheoremB`; SchemeAndStackFoundations §2.2 `cech_to_cohomology`.

### C1.7 Projective charts and analytic twisting sheaves

Prove `projectiveLerayCover`: on the analytification of `Pʳ`, the standard affine charts
`Uᵢ = {Zᵢ ≠ 0}` and all their finite intersections (repeated indices allowed) are isomorphic to
`ℂᵃ × (ℂ*)ᵇ`, hence strongly 1-complete; so for every coherent analytic module on `Pʳ_an`, or on a
closed analytic subspace, the alternating Čech complex of this cover computes `Sheaf.H` in every
degree (Serre, exposé 18, §2, no. 5, Proposition 4 and its corollary, pp. 18-5–18-6, for the standard
cover; that the intersections are products of affine and punctured lines is read off the charts).
*Needs:* `cartanTheoremB`; SchemeAndStackFoundations §2.2 `cech_to_cohomology`; Mathlib
`cechComplexFunctor`, `Sheaf.H`.

Define `AnalyticTwist r k` for `r ≥ 0`, `k ∈ ℤ`: the invertible analytic module `O(k)` on `Pʳ_an`
whose sections over `V` are the holomorphic functions on the cone over `V` in `ℂ^{r+1} ∖ {0}` that
are homogeneous of degree `k`; equivalently, glued from `O_{Uᵢ}` with transition factor
`(Zⱼ/Zᵢ)ᵏ` from the frame on `Uᵢ` to the frame on `Uⱼ`. The API is
`AnalyticTwist.chartTransition` (the transition factor is `(Zⱼ/Zᵢ)ᵏ`), `AnalyticTwist.tensorIso`
(`O(k) ⊗ O(l) ≅ O(k + l)`) and `AnalyticTwist.analytificationIso` (the analytification of the
algebraic `O(k)` of AlgebraicModuliForArithmeticGeometry Layer 1 is `O(k)`, by the same homogeneous
frames) (Serre, exposé 18, §2, nos. 5–6, pp. 18-5–18-8; Serre, *GAGA*, n° 16, printed p. 24, for
the analytification of the algebraic twists). *Needs:* `coherentOperations`;
`CoherentAnalytification`.

**Checks.**

- `AnalyticTwist.zero`: `O(0) ≅ O`.
- `AnalyticTwist.degreeOneSections`: on `P¹_an`, `H⁰(O(1))` is two-dimensional with basis `Z₀, Z₁`.
  This fixes the direction of the transition factor: the reversed factor `(Zᵢ/Zⱼ)ᵏ` glues `O(−1)`,
  which has no nonzero global section, and a definition ignoring `k` gives the one-dimensional
  `H⁰(O)`. (The duality `O(k)^∨ ≅ O(−k)` does not detect the direction, since it also holds for
  the reversed convention.)
- `AnalyticTwist.hyperplaneSection`: `Zᵢ` is a global section of `O(1)` whose zero scheme is the
  reduced hyperplane `Zᵢ = 0`.

Prove `analyticTwistCohomology`: for `r ≥ 1` and `k ∈ ℤ`, `H^q(Pʳ_an, O(k)) = 0` unless `q = 0` or
`q = r`; `H⁰` has the basis of monomials of degree `k` (zero for `k < 0`), so
`h⁰ = binom(k + r, r)` for `k ≥ 0`; `H^r` has the basis of Laurent monomials `Z^a` with every
`aᵢ ≤ −1` and `Σ aᵢ = k` (zero for `k > −r − 1`), so `h^r = binom(−k − 1, r)` for `k ≤ −r − 1`.
For `r = 0`, `H⁰(P⁰, O(k)) = ℂ` and higher cohomology vanishes. The map from the algebraic Čech
complex (Laurent polynomials) to the analytic one (convergent Laurent series on the chart
intersections) is a quasi-isomorphism and identifies these bases, products and connecting maps. The
proof expands sections on the Čech intersections in convergent Laurent series and splits by the sign
pattern of the exponents: every pattern except "all nonnegative" and "all negative" gives an
acyclic piece (Serre, exposé 18, §2, no. 5, Proposition 4, pp. 18-5–18-7; no. 7, Proposition 7,
and Remarks 1–2 (Remark 2 is this Laurent-series method),
the hyperplane sequence and Remark 1, pp. 18-9–18-10). *Needs:* `AnalyticTwist`;
`projectiveLerayCover`; SchemeAndStackFoundations §2.6 `projectiveSpace_cohomology` (the
algebraic calculation).

### C1.8 Serre's analytic theorems on projective space

Prove `analyticSerreGeneration` (Serre's analytic theorem A): for a coherent analytic module `F` on
`Pʳ_an` (supported on any closed analytic subspace, nilpotents allowed) there is `k₀` such that for
every `k ≥ k₀` the twist `F(k)` is generated by finitely many global sections. The proof is a
joint induction on `r` with `analyticSerreVanishing`. By compactness it suffices to generate the
stalk at one point `x` for large `k`. Choose a hyperplane `H ∋ x` with equation `z₀`;
multiplication by `z₀` gives `0 → P → F(−1) → F → Q → 0` with `P` and `Q` coherent and supported on
`H ≅ P^{r−1}`. Vanishing on `H` for large twists makes `dim H¹(F(k))` (finite by Cartan–Serre)
nonincreasing, hence eventually constant, and then `H⁰(F(k)) → H⁰(Q(k))` is surjective; generation
of `Q(k)` on `H` and Nakayama at `x` give generation of `F(k)_x` (Serre, *Faisceaux analytiques sur
l'espace projectif (suite)*, Séminaire Henri Cartan 6 (1953–54), exposé 19, §3, no. 8,
pp. 19-1–19-4; the statement is exposé 18, no. 7, p. 18-8). It uses no algebraization. *Needs:*
`cartanSerreFiniteness`; `AnalyticTwist`; `coherentOperations`; `analyticSerreVanishing` on
`P^{r−1}` (the joint induction).

Prove `analyticSerreVanishing` (Serre's analytic theorem B): for `F` as above there is `k₁` with
`H^q(Pʳ_an, F(k)) = 0` for all `q ≥ 1` and `k ≥ k₁`; one `k₁` can be chosen for finitely many
modules at once. Generation gives `O(−a)ⁿ → F → 0`; descending induction on `q` from `q > r`
(vanishing above the dimension) with the coherent kernel and `analyticTwistCohomology` closes the
argument (Serre, exposé 19, §3, no. 9, pp. 19-4–19-5). *Needs:*
`analyticSerreGeneration`; `analyticTwistCohomology`.

Prove `twistPresentations`: every coherent analytic module `F` on `Pʳ_an` has an exact sequence
`O(−b)^m → O(−a)^n → F → 0` with finite `a, b, m, n`, and the construction iterates to any
prescribed finite length of a resolution by sums of twists. No global finite locally free
resolution is claimed on a singular or nonreduced support (Serre, exposé 19, §3, nos. 8–9,
pp. 19-1–19-5; Serre, *GAGA*, nos. 16–17, Lemma 8 and the finite presentation, printed pp. 24–27).
*Needs:* `analyticSerreGeneration`; `coherentOperations`.

### Examples

- On `C × C*` the structure sheaf has no positive-degree cohomology; a skyscraper `ℂ` at a point has
  `H⁰ = ℂ` and no higher cohomology.
- On `P¹`: `h⁰(O(2)) = 3`, `h¹(O(−2)) = 1` with generator the class of `(Z₀Z₁)⁻¹` on the overlap
  `ℂ*`, and `O(−1)` is acyclic in all degrees; `O(−2)(k) = O(k − 2)` is globally generated for
  `k ≥ 2` and has no higher cohomology for `k ≥ 1`, while `H¹(O(−2)) ≠ 0`.
- For the double point `2p ⊂ P¹`, `0 → O(−2) → O → O_{2p} → 0` is a twist presentation whose
  cokernel has length two (the reduced point would have length one); `H⁰(O_{2p}) = ℂ[ε]/(ε²)` has
  dimension two and there is no higher cohomology.
- The compact non-Hausdorff space obtained by gluing two copies of `P¹` along `P¹ ∖ {0}`
  has `H¹(O) ≅ O(ℂ)/ℂ`, which is infinite-dimensional: the two `P¹` charts have only constant
  global functions and their overlap has all entire functions. This excludes dropping
  Hausdorffness from Cartan–Serre finiteness.
- The weighted estimate needs completeness (or a separate boundary argument): it is not applied
  formally on an incomplete ball.

### Dependencies

C0; §C−1.1; RealAnalyticGeometry R3.1–R3.2; GlobalHolomorphicFunctions GH0.3;
ComplexKahlerGeometry K2–K4,
K5a local estimates, K5b.0 and K6.0; AlgebraicModuliForArithmeticGeometry Layer 1; SchemeAndStackFoundations Layer 2;
SchemeAndStackFoundations §2.2 `cech_to_cohomology`; Tau Ceti `TauCeti.montel`; TauCetiRoadmap.DifferentialGeometry (Layers 0–2, 5
and 12); Mathlib analysis
(smooth functions, integration, Arzelà–Ascoli, open mapping theorem).

### C1.9 Projective and proper coherent GAGA

Prove `projectiveComplexGaga`. (i) For a scheme `S` of finite type over `ℂ`, the projection `π:P^r_S→S` and a coherent `F` on `P^r_S`, the exchange map `θ^q_{π,F}:(R^qπ_*F)^an→R^qπ^an_*F^an` of ComplexComparisonPartII C0.5 (`HigherImageComparison`) is an isomorphism of `O_(S^an)`-modules for every `q≥0`. (ii) For a closed subscheme `X⊂P^r_ℂ`, coherent analytification `Coh(X)→Coh(X^an)` is an equivalence of categories, and `H^q(X,F)≅H^q(X^an,F^an)` for every coherent `F`. The base in (i) is arbitrary of finite type, not only a point, and nilpotents are allowed in `S`, `X` and `F`.

Here `S` of finite type over `ℂ`; `F` coherent; `X` closed in projective space; the comparison maps are the canonical ones of ComplexComparisonPartII C0.

(SGA 1, Exposé XII, proof of Theorem 4.2 in the projective case, retyped pp. 247–249, original pp. 326–329; Serre, *Géométrie algébrique et géométrie analytique*, §3, Théorèmes 1–3, with the analytic inputs of Serre, Séminaire Cartan 6, exposés 18–19, as specified in ComplexComparisonPartII C1.7–C1.8.)

For the proof, in order: (1) twist cohomology over a parameter base: the question in (i) is local on `S^an`, so take `V` a closed analytic subspace of a polydisc in an ambient chart of `S^an`; the charts `U_i×V` of `P^r×V` and all their intersections are closed subspaces of products of `ℂ^a×(ℂ^*)^b` with polydiscs, hence strongly 1-complete (`StronglyOneComplete.closedSubspace`, `StronglyOneComplete.prod`, `StronglyOneComplete.polydisc`, `StronglyOneComplete.torusProduct`), so by `cartanTheoremB` the Čech complex of this cover computes `H^q(P^r×V,O(n))`; expanding sections in convergent Laurent series in the fibre coordinates with coefficients holomorphic on `V`, as in `analyticTwistCohomology`, identifies it with `H^q(P^r,O(n))⊗_ℂ O(V)`, which is the analytification of the algebraic computation AlgebraicModuliForArithmeticGeometry Layer 1 `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison`, so `θ^q` is an isomorphism for `F=O(n)`; (2) locally on `S` every coherent `F` has an algebraic presentation `O(−b)^m→O(−a)^n→F→0` (`relativeSerre`); analytification is exact (`completedAnalyticStalkComparison.coherentPullbackExact`), both sides vanish for `q>r`, and descending induction on `q` with the five lemma gives (i); (3) for (ii), (i) applied to the coherent Hom sheaves and their cohomology, with local Ext compared through the flat stalk map, gives full faithfulness; for essential surjectivity push an analytic coherent module to `P^r_an`, take a presentation `O(−b)^m→O(−a)^n→F→0` by `twistPresentations`, identify the analytic twists with analytified algebraic twists (`AnalyticTwist.analytificationIso`), and use full faithfulness to make the presentation matrix algebraic; `F` is the analytification of the algebraic cokernel, supported on `X`.

*Needs:* ComplexComparisonPartII C0 (`CoherentAnalytification`, `HigherImageComparison`), ComplexComparisonPartII C1.5 (`StronglyOneComplete`, `cartanTheoremB`), ComplexComparisonPartII C1.7 (`projectiveLerayCover`, `AnalyticTwist`, `analyticTwistCohomology`), ComplexComparisonPartII C1.8 (`twistPresentations`), §C−1.2 `completedAnalyticStalkComparison`, AlgebraicModuliForArithmeticGeometry Layer 1 `relativeSerre`, AlgebraicModuliForArithmeticGeometry Layer 1 `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison`, SchemeAndStackFoundations §2.6.

**Checks.**

- `ProjectiveGagaChecks.relativeLine`: for `S=A¹_ℂ` and `F=O(−2)` on `P¹_S`, `R¹π_*F=O_S`, and the comparison is an isomorphism of `O_(S^an)`-modules onto `R¹π^an_*O(−2)=O_(S^an)`; its coefficient functions are all holomorphic functions of `s`, such as `exp(s)`, not only polynomials, so a fibrewise dimension count does not prove (i).
- `ProjectiveGagaChecks.doublePoint`: for `X=V(Z₀²)⊂P¹`, `Coh(X)` is the category of modules over `ℂ[ε]/(ε²)`, and analytification retains the nonzero nilpotent `ε`.
- `ProjectiveGagaChecks.skyscraper`: on `P¹_an` the skyscraper at a point has the twist presentation `0→O(−1)→O→O_p→0` and is the analytification of the algebraic `O_p`; the presentation map is the algebraic section of `O(1)` vanishing at `p`.

Prove `properSchemeGagaPushforward` for a proper morphism f of finite-type complex schemes and a coherent `F`: the canonical map `(R^q f_*F)^an→R^q f^an_*F^an` is an isomorphism for all `q≥0`. The projective case is `projectiveComplexGaga`(i), applied to a closed subscheme of `P^r_S`. A projective Chow modification, Leray and coherent dévissage by smaller closed supports give the proper case. The comparison is the canonical map, so its compatibility with composition and the coherent exact sequences is retained. Properness is on f; the base need not be proper. Consequently coherent cohomology and local-to-global Ext comparison hold on a proper complex scheme. Local Ext comparison follows from finite coherent presentations and the flat analytic stalk map, and the local-to-global Ext spectral sequence plus coherent cohomology comparison gives every global Ext group. (SGA 1, Exposé XII, Theorem 4.2 and proof and Corollary 4.3, retyped pp. 247–250, original pp. 326–330.)
*Needs:* `projectiveComplexGaga`, AlgebraicModuliForArithmeticGeometry §2.3 `devissageViaChow`, §C−1.2 `completedAnalyticStalkComparison`, ComplexComparisonPartII C0 (`HigherImageComparison`), SchemeAndStackFoundations §4.12, SchemeAndStackFoundations §2.2.

**Checks for proper pushforward.**

- `ProperPushforwardChecks.identity`: for `f=id`, the degree-zero exchange is the identity and all positive higher images vanish.
- `ProperPushforwardChecks.relativeLine`: for `P¹_(A¹_ℂ)→A¹_ℂ` and `O(−2)`, `R¹` is `O_(A¹_ℂ)`; its analytic comparison allows every holomorphic coefficient on the base.
- `ProperPushforwardChecks.dualPoint`: pushing the structure sheaf of the proper dual-number point to `Spec ℂ` compares `ℂ[ε]/(ε²)` in degree zero and zero in positive degrees, retaining `ε`.

Prove `properSchemeGagaEquivalence` and `properSpaceComplexGaga`: on a proper finite-type complex scheme or algebraic space, analytification is an equivalence of coherent categories and compares coherent cohomology and proper pushforward. The projective start is `projectiveComplexGaga`(ii); for a proper scheme or space, a projective Chow modification reduces to it. On each closed support, comparison of coherent Hom and cohomology proves full faithfulness. For essential surjectivity of an analytic coherent `F`, pull it to the projective modification, algebraize there, and push down, using the just-proved proper pushforward comparison. The canonical map from `F` to this pushforward has kernel `K` and cokernel `L` on smaller closed supports. Induction algebraizes `K` and `L`. Full faithfulness algebraizes the map from the pushforward to `L`, hence its kernel `I`. Finally the extension `0→K→F→I→0` algebraizes because **`Ext¹` comparison** identifies its class with an algebraic extension of I by `K`. This last step is required; comparison of `H⁰` and kernels alone would not recover `F`. Nilpotent thickenings are handled by finite coherent ideal filtrations. The same support induction proves the proper-space pushforward comparison, with space coherent direct images and étale local flatness from AlgebraicModuliForArithmeticGeometry §7.7. This complex result is distinct from the nonarchimedean proper-space comparison in AlgebraicModuliForArithmeticGeometry §7.4. (SGA 1, Exposé XII, Theorem 4.4 and proof, retyped pp. 250–251, original pp. 330–332; Stacks, More on Morphisms of Spaces, Theorem 42.11, pp. 103–104, gives the algebraic-space Chow/dévissage pattern; the analytic extension is proved by the stated induction.)
*Needs:* `projectiveComplexGaga`, `properSchemeGagaPushforward`, §C−1.2 `complexSpaceAnalytification`, §C−1.2 `completedAnalyticStalkComparison`, C0.7 (`analyticEtaleDescent`, `SpaceCoherentAnalytification`, its coherent Hom, local Ext, cohomology and exchange comparisons), ComplexComparisonPartII C0 (`CoherentAnalytification`), AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.coherentPresentationDescent` and §7.7, SchemeAndStackFoundations §4.12.

**Checks.**

- `ComplexGagaChecks.point`: the reduced and dual-number proper points give equivalences of their actual coherent module categories; the latter retains nonzero nilpotent modules.
- `ComplexGagaChecks.extension`: a nonzero `Ext¹` class is carried to its corresponding analytic extension, including its injection and quotient, rather than replaced by a split direct sum.
- `ComplexGagaChecks.projectiveLine`: `H¹(P¹,O(−2))` and its analytic counterpart are one-dimensional, while `H⁰` is zero; both degrees use the same canonical comparison.
- `ComplexGagaChecks.nonproper`: on `A¹`, the analytic function `exp(z)` is not algebraic. Full faithfulness of coherent analytification on arbitrary nonproper spaces fails, so properness cannot be removed.

<a id="c2"></a>

## Layer C2: Projective and proper consequences of coherent GAGA

Coherent GAGA for proper schemes — the isomorphism `θ` of C0.5 for proper morphisms, and the exact
equivalence `Coh(X) ≃ Coh(X^an)` for proper `X` with comparison of cohomology and Ext — is
`properSchemeGagaPushforward` and `properSchemeGagaEquivalence` of
§C1.9; the projective case is Serre's theorem, whose analytic
inputs are `analyticTwistCohomology`, `analyticSerreVanishing` and `twistPresentations` of C1. This
layer states the compatibilities and dictionaries that families and moduli problems use on top of
it.

### C2.1 Projection formula and base change

Prove `gagaBaseChange`. Let `f : X → S` be a proper morphism of schemes locally of finite type over
`ℂ` and `F` a coherent `O_X`-module. Then:

1. (projection) for a finite locally free `O_S`-module `E`, the comparison `θ_{f, F ⊗ f^*E}`
   corresponds to `θ_{f,F} ⊗ E^an` under the algebraic and analytic projection formulas;
2. (flat base change) for a flat morphism `g : S' → S` locally of finite type over `ℂ`, with
   `f' : X' = X ×_S S' → S'`, the comparison maps `θ_{f',g'^*F}` and `g^{an*}θ_{f,F}` agree under the
   algebraic flat base-change isomorphism and its analytic counterpart;
3. (derived base change) for an arbitrary `g : S' → S` such that `X` and `S'` are Tor-independent over
   `S`, the derived exchange maps are compatible in the same sense, for the complexes to which
   SchemeAndStackFoundations §2.18 `torIndependent_baseChange` applies.

An isomorphism `(R^q f_*F)|_{S'} ≅ R^q f'_*(F|_{X'})` in a single degree is asserted only under the
hypotheses of the algebraic cohomology-and-base-change theorem (flatness of `F` over `S` and the
surjectivity conditions of JacobianChallenge Layer C and StableReduction Layer 2), never for jumping
cohomology. All three statements are diagram chases on the derived exchange maps before taking
cohomology, using that finite locally free factors commute with pullback and pushforward (SGA 1,
Exposé XII, 4.1–4.2, printed pp. 247–249, for the exchange maps and their invertibility; the
compatibilities themselves are the diagram chases just described and are not stated there). *Needs:* `HigherImageComparison`;
§C1.9 `properSchemeGagaPushforward`; SchemeAndStackFoundations
§2.18 `torIndependent_baseChange`; TauCetiRoadmap.JacobianChallenge (Layer C);
TauCetiRoadmap.StableReduction (Layer 2).

### C2.2 Ideals, sections and bundles

Prove `projectiveGeometricDictionaries`. Let `X` be a proper scheme over `ℂ` (in particular a
projective one), nilpotents allowed. Then:

1. every coherent ideal of `O_{X^an}` is `I^an` for a unique coherent ideal `I ⊆ O_X`, so closed
   analytic subspaces of `X^an` are exactly the analytifications of closed subschemes of `X`, with
   their nilpotent structure;
2. global sections, morphisms of coherent modules, invertible modules and finite locally free
   modules correspond under analytification, and the Picard groups agree;
3. a coherent module `F` is finite locally free if and only if `F^an` is, and the dual and
   determinant agree with those of `coherentPullbackOperations`.

For (1) algebraize the ideal as a coherent submodule of `O_X` and its inclusion by full faithfulness;
the ideal property and the quotient are checked by faithfulness. For (3) use that finite projectivity
descends along the faithfully flat local maps of C0 (SGA 1, XII, Corollary 4.3, Theorem 4.4 and
Corollary 4.5, printed pp. 249–251, for (1) and (2); the descent argument for (3) is the one just
given).
*Needs:* §C1.9 `properSchemeGagaEquivalence`;
`CoherentAnalyticIdeal`; `coherentAnalytification_faithful`; `coherentPullbackOperations`;
`holomorphicBundleDictionary`.

### Examples

- For `P¹ × S → S` and `O(−2)`, `R¹f_*O(−2) ≅ O_S` and the comparison commutes with flat base change
  and with tensoring by a line bundle on `S`.
- The doubled hyperplane `(Z₀²) ⊂ Pʳ` and its quotient algebraize together, with the square ideal;
  algebraizing only the reduced support fails.
- On `P¹` the analytic `O(1)` has algebraic dual `O(−1)` and `O(1) ⊗ O(−1) ≅ O`.
- For `S = A¹` and `X = P¹ × S`, the comparison holds for algebraic coefficients; the analytic
  function `exp(s)` on `S^an` is not thereby algebraic: nothing here algebraizes analytic data over a
  nonproper base.

### Dependencies

C0, C1; §C−1.2 and §C1.9; SchemeAndStackFoundations Layer 2;
TauCetiRoadmap.JacobianChallenge (Layer C); TauCetiRoadmap.StableReduction (Layer 2).

<a id="c3"></a>

## Layer C3: Algebraic spaces — analytic descent and derived GAGA

The abelian GAGA theorem for proper algebraic spaces is `properSpaceComplexGaga` of
§C1.9, proved by Chow modification and support induction.
Coherent analytification and its descent comparisons are constructed in C0.7, before that
abelian theorem. This layer supplies the quasi-coherator on the quasi-coherent derived category `spaceDQCoh` of
AlgebraicModuliForArithmeticGeometry §7.7, and Hall's derived GAGA, which upgrades the abelian
equivalence to bounded coherent derived categories without a projective reduction.

### C3.1 Abelian inputs for the derived comparison

Use C0.7's `analyticEtaleDescent` and `SpaceCoherentAnalytification`, including their
presentation comparisons, and C1.9's `properSpaceComplexGaga`. These supply the functor on
hearts and its proper cohomology/exchange isomorphisms before the derived construction below.

### C3.2 The quasi-coherator of an algebraic space

The quasi-coherent derived category of an algebraic space `X` is `spaceDQCoh X` of
AlgebraicModuliForArithmeticGeometry §7.7: the full subcategory of Mathlib's derived category
`D(X_ét, O_X)` of `O_X`-modules on the ringed small étale site of SchemeAndStackFoundations Layer 1
whose cohomology sheaves are quasi-coherent, with its perfect objects `spacePerfect X`, its derived
pullback, pushforward and tensor product, and its comparison `spaceDQCoh.schemeEtaleEquivalence`
with SchemeAndStackFoundations §2.18 `DQCoh` for schemes. This layer uses that category and its API
as stated there and adds the quasi-coherator.

Define `spaceQuasiCoherator X` for a quasi-compact quasi-separated algebraic space `X`: the right
adjoint `RQ_X : D(X_ét, O_X) → spaceDQCoh X` of the inclusion, with `M → RQ_X M` an isomorphism for
`M` in `spaceDQCoh X`. For a morphism of ringed topoi `c : 𝔛 → X_ét`, `Rc_{qc,*} = RQ_X ∘ Rc_*` is
right adjoint to `Lc^*` restricted to `spaceDQCoh X`, and the projection morphism
`M ⊗ᴸ Rc_{qc,*}N → Rc_{qc,*}(Lc^*M ⊗ᴸ N)` is an isomorphism for `M` in `spacePerfect X` (Hall, §4,
the quasi-coherator and Lemma 4.3, pp. 10–11). The API is `spaceQuasiCoherator.adjunction` (the
right adjoint `RQ_X`), `spaceQuasiCoherator.unit_iso` (`M ≅ RQ_X M` on `spaceDQCoh X`) and
`spaceQuasiCoherator.projection_perfect` (the projection isomorphism for perfect `M`). *Needs:*
AlgebraicModuliForArithmeticGeometry §7.7 `spaceDQCoh`, `spacePerfect`,
`spaceDQCoh.schemeEtaleEquivalence`, `spaceDQCoh.tensor`; SchemeAndStackFoundations Layer 1
(algebraic spaces and étale sites) and §2.18 `DQCoh`, §2.18 `perfect_generator`; Mathlib
`DerivedCategory`.

**Checks.**

- `spaceQuasiCoherator.affine`: for `X = Spec A` an affine scheme, `RQ_X K` is the quasi-coherent
  complex of `RΓ(X_ét, K) ∈ D(A)` (the adjunction of `O_X ⊗ᴸ_A −` with `RΓ(X_ét, −)`), so through
  `spaceDQCoh.schemeEtaleEquivalence` and Layer 2's affine equivalence `spaceDQCoh X ≃ D(A)` it is
  the identity on `spaceDQCoh X` (Stacks, Tag 08D9, on the Zariski site).
- `spaceQuasiCoherator.zero`: for the empty space, `spaceDQCoh X` is the zero category and
  `RQ_X = 0`.
- `spaceQuasiCoherator.extensionByZero`: for `X = Spec A`, `A` a DVR with generic point `η`, the
  extension by zero `j_!O_η` of the structure sheaf of the open point `j : {η} → X` is not
  quasi-coherent (its global sections vanish, since a nonzero section over `{η}` does not have
  closed support in `X`, while its restriction to `{η}` is `O_η ≠ 0`), so the counit
  `RQ_X(j_!O_η) → j_!O_η` is not an isomorphism; a quasi-coherator equal to the identity of
  `D(X_ét, O_X)` would make it one.

Prove `pseudoCoherenceDetection`. Let `A` be a ring and `X → Spec A` a quasi-compact, separated,
pseudo-coherent morphism of algebraic spaces. A complex `M` in `spaceDQCoh X` is pseudo-coherent (étale
locally quasi-isomorphic to a bounded-above complex of finite free modules), respectively
pseudo-coherent and bounded, as soon as `RHom(P, M) ∈ D(A)` is pseudo-coherent (and bounded) for
every `P` in `spacePerfect X`. Consequently, for `c : 𝔛 → X_ét` such that `RΓ(𝔛, −)` sends bounded
pseudo-coherent complexes to bounded pseudo-coherent `A`-complexes, `Rc_{qc,*}` preserves bounded
pseudo-coherent complexes (Hall, Theorem 3.8, p. 8, and Proposition 4.1, p. 10). *Needs:*
`spaceQuasiCoherator`; AlgebraicModuliForArithmeticGeometry §7.7 `spaceDQCoh`, `spacePerfect`;
SchemeAndStackFoundations §2.18 `perfect_generator`.

### C3.2a Derived products and inverse limits of quasi-coherent complexes

Prove `spaceDerivedLimits` for a quasi-compact quasi-separated algebraic space `X`, using
C3.2's `spaceQuasiCoherator` `RQ_X`, the right adjoint of the inclusion
`i : spaceDQCoh X → D(O_X)`. Specialize EnhancedDerivedSheaves §§0.1–0.4's
`ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`,
`ClassicalDerived.inverseLimits` and `ClassicalDerived.functorCoherence` to the ringed
small étale site `(X_ét,O_X)`. Use its ambient derived products and coherent limits.
For any set-indexed family `M_j` in `spaceDQCoh X`, construct its intrinsic product as
`RQ_X(∏ᴿ_j iM_j)`, with the product universal property. Construct the enhanced
quasi-coherent full subcategory and lift the quasi-coherator adjunction to it, with
homotopy-category image the adjunction of C3.2. For a coherent countable inverse sequence
`M_n`, use the shared enhanced limit and the right adjoint to obtain the canonical comparison

`R lim_(spaceDQCoh X) M_n ≅ RQ_X(R lim_(D(O_X)) iM_n)`.

Identify its homotopy-category image with the fibre of `1−shift` on the intrinsic derived
products, with shift induced by the given transition maps. This is the fibre presentation
of the shared limit, with its projections and transition homotopies. The API
`spaceDerivedLimits.products` and `spaceDerivedLimits.comparison` gives these intrinsic
constructions and comparisons with their actual projections.

`spaceDerivedLimits.boundedness` gives an integer `N(X)≥0` such that, if `H^i(U,L)=0`
outside `[a,b]` for every affine étale `U→X` and `L∈D(O_X)`, then `H^i(RQ_X L)=0` outside
`[a,b+N(X)]`. In particular, for an inverse sequence of quasi-coherent modules in degree
zero, affine étale cohomology of the ambient derived limit vanishes outside `[0,1]`, so
its intrinsic derived limit lies in degrees `[0,1+N(X)]`. This proves the bounded,
nonnegative assertion used in `strongProperSupportExistence` for the closed pushforwards
of `F_n`. For `X` over `Spec A` and `E` perfect, `spaceDerivedLimits.perfectTest` identifies
`RHom_X(E,R lim_(spaceDQCoh X) M_n)` with `R lim RHom_X(E,M_n)` in `D(A)`, compatibly with
every projection and transition map; the global-sections tensor version follows using `E^∨`.

([Stacks](https://stacks.math.columbia.edu/tag/079P), Theorem 19.12.6, and
[Stacks](https://stacks.math.columbia.edu/tag/07D9), Lemma 19.13.4, for the supplied
ambient replacements and products; [Stacks](https://stacks.math.columbia.edu/tag/0CST),
Example 75.19.5; [Stacks](https://stacks.math.columbia.edu/tag/0CSS), Lemma 75.19.4;
[Stacks](https://stacks.math.columbia.edu/tag/0CX5), Lemma 77.12.2;
[Stacks](https://stacks.math.columbia.edu/tag/0CX6), Lemma 77.12.3, proof.)

For the enhanced adjunction, use affine étale descent to prove that the quasi-coherent
full subcategory is presentable and its inclusion preserves small colimits. Apply
EnhancedDerivedSheaves E3.2's `adjointFunctorTheorem`; its mapping-space adjunction
induces the adjunction of C3.2 on homotopy categories. The enhanced right adjoint
preserves limits. For boundedness, use the affine description of `RQ_X` and induction
through elementary distinguished étale squares, with the finite cohomological dimension
of quasi-compact open pushforward. Perfect duality and the right-adjoint property of
global sections make perfect-test functors preserve these limits. All comparisons are
induced by those adjunctions and the shared limit, including their projections.

*Needs:* EnhancedDerivedSheaves §§0.1–0.4 (`ClassicalDerived.enhancedCategory`,
`ClassicalDerived.replacements`, `ClassicalDerived.inverseLimits`,
`ClassicalDerived.functorCoherence`) and E3.2 (`adjointFunctorTheorem`);
AlgebraicModuliForArithmeticGeometry §7.7
(`spaceDQCoh`, `spacePerfect`); C3.2 (`spaceQuasiCoherator.adjunction`,
`spaceQuasiCoherator.projection_perfect`); SchemeAndStackFoundations §2.18 and Layer 1
(affine étale charts and distinguished squares).

**Checks.**

- `SpaceLimitChecks.constant`: a constant sequence of quasi-coherent modules with identity maps has that module as its intrinsic derived limit, in degree zero; its projection to each term is the identity.
- `SpaceLimitChecks.empty`: on the empty algebraic space both the ambient and intrinsic derived limits are zero.
- `SpaceLimitChecks.adicSheaf`: for `A=k[[t]]`, `X=Spec A` and `M_n=O_X/t^n`, the ordinary inverse-limit sheaf has sections A on `X` but zero on `D(t)`, and is not quasi-coherent. The limit in `spaceDQCoh X` corresponds under `D_qc(Spec A)≃D(A)` to `lim A/t^n=A`, so is `O_X` in degree zero and has sections `k((t))` on `D(t)`.

### C3.2b Strong existence with proper support

Prove `strongProperSupportExistence`. Let `(A_n)` be an inverse system of rings with surjective transition maps whose kernels are locally nilpotent, `A = lim A_n`, and `X` a separated algebraic space of finite presentation over `A`, with `X_n = X ×_A A_n`. Let `F_n` be finitely presented `O_{X_n}`-modules, flat over `A_n` with support proper over `A_n`, with isomorphisms `F_n ⊗ O_{X_(n−1)} ≅ F_(n−1)`. Then there is a finitely presented `O_X`-module `F`, flat over A with support proper over `A`, with `F ⊗ O_{X_n} ≅ F_n` compatibly with the given isomorphisms.

Here arbitrary rings `A_n` with locally nilpotent kernels; A need not be Noetherian, local or complete; `X` separated of finite presentation; proper support at every level.

([Stacks](https://stacks.math.columbia.edu/tag/0CXB), Theorem 77.12.8, with Situation 77.12.1 (tag 0CX4) and Lemmas 77.12.2–77.12.7 (tags 0CX5–0CXA); [Stacks](https://stacks.math.columbia.edu/tag/0CTJ), Lemma 38.28.8).

For the proof, in order: (1) push each `F_n` forward along the closed immersion `X_n→X` and form `K = RQ_X(R lim F_n in D(O_X))`, using ComplexComparisonPartII C3.2's `spaceQuasiCoherator`. By `spaceDerivedLimits` this is the limit in `spaceDQCoh X`, bounded with cohomology in degrees at least zero; the ambient limit is not assumed quasi-coherent. (2) For every perfect `E` on `X`, EnhancedDerivedSheaves E1.9's `perfect_proper_pushforward` on `X_n` gives perfect `M_n=RΓ(X_n,F_n⊗ᴸE|_(X_n))` with the derived transition isomorphisms `M_(n+1)⊗ᴸ_(A_(n+1))A_n≅M_n`. Apply DerivedModuleAlgebra §1.E.1's `perfectInverseSystemEffectivity`, with every `M_n` perfect and the locally nilpotent transition kernels, to obtain a perfect limit and its canonical derived reductions. Retain the tower's projections and derived transition maps in these comparisons. The perfect-test comparison of `spaceDerivedLimits` identifies this limit with `RΓ(X,K⊗ᴸE)`; applying it to `E^∨` identifies `RHom_X(E,K)` as well. (3) Hence `K` is pseudo-coherent relative to `A`, and for every quasi-compact étale `U→X` one has `RΓ(U,K)⊗ᴸ_A A_n≅RΓ(U_n,F_n)`, by writing `RΓ(U,−)` as a homotopy colimit of `RΓ(X,−⊗ᴸE_m)` for perfect `E_m` (Stacks, Lemmas 75.25.7 and 75.27.3, and More on Morphisms of Spaces, Lemma 76.51.4). (4) There is an open `W⊂X` containing all points over `Spec A_1` on which `K` is `H⁰(K)`, finitely presented and restricting to every `F_n`, and after shrinking `W` its support is proper over A. (5) By `universalFlatteningProperSupport` the universal flattening of `H⁰(K)|_W` is a monomorphism of finite presentation through which every `Spec A_n→Spec A` factors, so it is all of `Spec A` by Lemma 38.28.8 and `F=H⁰(K)|_W` is flat. (6) Its proper support makes extension by zero to `X` the required module. The perfect objects in (2) are test complexes `E`; the modules `F_n` themselves need not be perfect.

*Needs:* EnhancedDerivedSheaves E1.9 `perfect_proper_pushforward`, DerivedModuleAlgebra §1.E.1 `perfectInverseSystemEffectivity`, AlgebraicModuliForArithmeticGeometry §7.3 `universalFlatteningProperSupport`, §C3.2a `spaceDerivedLimits`, AlgebraicModuliForArithmeticGeometry §7.7 `spaceDQCoh`, AlgebraicModuliForArithmeticGeometry §7.7 `spacePerfect`, ComplexComparisonPartII C3.2 (`spaceQuasiCoherator`), SchemeAndStackFoundations §2.18, SchemeAndStackFoundations Layer 1.

**Checks.**

- `StrongExistenceChecks.constant`: for the constant system `A_n = A` with identity transitions, `F = F_1`.
- `StrongExistenceChecks.adic`: for a complete Noetherian local A and `A_n = A/m^n`, the theorem gives on objects the effectivity of compatible proper-support towers of `properSpaceCompletionEquivalence`; morphisms are not part of this statement.
- `StrongExistenceChecks.properSupport`: over `A = k[[t]]` with `A_n = k[t]/(t^n)` and `X = A¹_A`, the module `O_X/(tx − 1)` restricts to zero on every `X_n`, as does 0; only 0 has proper support, so the output is determined only among modules with proper support.

### C3.2c Algebraicity of the coherent-sheaf stack

Prove `cohStack_algebraic`. Let `f : X → B` be a separated morphism of finite presentation between
algebraic spaces. The stack `Coh_{X/B}` over `B`, whose fibre over `T → B` is the groupoid of finitely
presented `T`-flat quasi-coherent modules on `X_T` with support proper over `T`, is an algebraic stack,
quasi-separated and locally of finite presentation over `B`. No flatness of f is required, and no
Noetherian hypothesis on `B`.

Here f separated and of finite presentation; `B` an arbitrary algebraic space; modules on the ringed small étale site of `X_T` (AlgebraicModuliForArithmeticGeometry §7.7).

([Stacks](https://stacks.math.columbia.edu/tag/09DS), Theorem 99.6.1 and proof, tag 09DS; the flat case is Section 99.5, Lemmas 99.5.3–99.5.10, tags 08W6, 08KC, 08KD, 08LQ, 08W8, 08W9; [Stacks](https://stacks.math.columbia.edu/tag/0DLZ), Lemma 108.4.2).

For the proof, in order: (1) by `cohStackFiniteTypeModel` it suffices to treat `B = S = Spec Λ` with `Λ` of finite type over `ℤ`, so `S` is Noetherian and its local rings are G-rings (SchemeAndStackFoundations §0.21); (2) verify the hypotheses of `artin_stack_criterion` (AlgebraicModuliForArithmeticGeometry §7.1): Coh is a stack by fpqc descent of quasi-coherent modules (`spaceFpqcQuasicoherentDescent`), which preserves finite presentation, flatness and properness of support; `coherentModuleIsom`, constructed from `coherentModuleHom`, identifies every base change of its relative diagonal and makes that diagonal affine of finite presentation; it is limit preserving because finitely presented flat modules with proper support spread out; it has RS* because flat modules glue along the pushout of a thickening and an affine morphism; and at a finite-type field point its tangent and infinitesimal-automorphism spaces are `Ext¹` and Hom of the module, finite dimensional by proper support; (3) effectivity of formal objects over complete Noetherian local rings with finite-type residue field is `properSpaceCompletionEquivalence` (AlgebraicModuliForArithmeticGeometry §7.8); (4) openness of versality is `openness_of_versality_strongEffective` (AlgebraicModuliForArithmeticGeometry §7.1), whose strong effectiveness hypothesis is `strongProperSupportExistence`. Quasi-separatedness and local finite presentation over `B` follow from the affine finitely presented diagonal and limit preservation. Openness of versality is not obtained from an obstruction complex of the module: `perfect_proper_pushforward` needs a perfect first argument, and the module `k` on `Spec k[ε]/(ε²)` is not perfect.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.3 `cohStackFiniteTypeModel`, AlgebraicModuliForArithmeticGeometry §7.3 `coherentModuleHom`, AlgebraicModuliForArithmeticGeometry §7.3 `coherentModuleIsom`, AlgebraicModuliForArithmeticGeometry §7.1 `artin_stack_criterion`, AlgebraicModuliForArithmeticGeometry §7.1 `openness_of_versality_strongEffective`, §C3.2b `strongProperSupportExistence`, AlgebraicModuliForArithmeticGeometry §7.8 `properSpaceCompletionEquivalence`, AlgebraicModuliForArithmeticGeometry §3.1 `spaceFpqcQuasicoherentDescent`, SchemeAndStackFoundations §0.21, SchemeAndStackFoundations Layer 1.

**Checks.**

- `CohStackTests.point`: for `X = B` the stack `Coh_{B/B}` is the stack of finite locally free modules
  of finite rank, the disjoint union of the classifying stacks `B GL_r` over `r ≥ 0`; the component
  `r = 0` is the zero module, with its identity automorphism only.
- `CohStackTests.notFlat`: for the closed immersion `Spec 𝔽_p → Spec ℤ`, the restriction of Coh to
  `𝔽_p`-schemes `T` is the stack of finite locally free `O_T`-modules of every rank, including rank zero,
  since `X_T = T` there. Over `ℤ[1/p]` the source `X_T` is empty and its only module is zero, so the
  restriction to `ℤ[1/p]`-schemes is the terminal stack, not the empty one. A substack of modules of
  fixed positive rank would have empty restriction there; it is a different stack. f need not be flat.
- `CohStackTests.properSupport`: on `X = A¹_k` the module `O_X` is not a point, since its support is not
  proper over `k`.
- `CohStackTests.nonperfectPoint`: on `X = Spec k[ε]/(ε²)` over `B = Spec k`, the residue module `k` is a
  point of Coh, but `Ext^n(k,k) = k` for every `n ≥ 0` by the periodic resolution by multiplication by `ε`,
  so its derived self-Hom is not perfect; the openness argument must not use a perfect deformation
  complex of the module.

### C3.2d.1 Algebraicity of the Picard stack

Prove `picard_stack_algebraic`. If `f:X→B` is proper, flat and finitely presented, the Picard stack is algebraic, quasi-separated and locally of finite presentation over `B`. It is the open substack of `Coh_{X/B}` consisting of invertible modules.

Here No global section, Noetherian base or projectivity is required. The ambient coherent-sheaf stack parametrizes finitely presented `T`-flat modules with support proper over `T`.

([Stacks](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.10.1, tag 0D03, and Proposition 99.10.2, tag 0D04, p. 26; [Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), Lemma 108.8.2, p. 13).

For the proof, apply `cohStack_algebraic`; then invertibility is open in a flat finitely presented family; the complement of its locus has proper image in `T`; then restrict the coherent-sheaf stack to that open substack and import its local finite presentation and quasi-separatedness.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.3 `PicardStackSpaces`, §C3.2c `cohStack_algebraic`, EnhancedDerivedSheaves E1.9 `perfect_proper_pushforward`, SchemeAndStackFoundations Layer 1.

**Checks.**

- `PicardStackChecks.point`: for `X=B`, invertible modules give `B G_m` inside the stack of vector bundles.
- `PicardStackChecks.dualBase`: for `X=B=Spec k[ε]/(ε²)`, line bundles retain their unit automorphisms, including `1+ε`.
- `PicardStackChecks.noninvertible`: a length-one skyscraper on `P¹` over a field is a coherent-stack point but is excluded from the invertible open substack.

### C3.2d.2 Representability of the relative Picard sheaf

Prove `relative_picard_algebraicSpace`. If `f:X→B` is proper, flat and finitely presented and `O_T→(f_T)_*O_{X_T}` is an isomorphism for every `T→B`, its relative fppf Picard sheaf is an algebraic space, quasi-separated and locally of finite presentation over `B`. It remains the sheafification of line-bundle classes modulo base classes; arbitrary `T`-points need not be represented by a line bundle.

Here Universal functions is an arbitrary-base-change condition. Neither a section nor geometrically integral fibres are required.

([Stacks](https://stacks.math.columbia.edu/download/quot.pdf), Proposition 99.11.8, p. 30; [Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), Lemma 108.9.3, p. 14).

For the proof, fppf locally on `B` obtain sections by covering from `X` and use the rigidified Picard stack; then universal functions kills its rigidified automorphisms, so the stack is an algebraic space and agrees with the relative class sheaf by the prior splitting theorem; then descend algebraic-space representability and local finite presentation; use the diagonal description for quasi-separatedness.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.6.1 `relativePicardSheaf`, AlgebraicModuliForArithmeticGeometry §7.6.1 `relativePicardBaseChange`, AlgebraicModuliForArithmeticGeometry §7.6.1a `sectionPicardSplit`, §C3.2d.1 `picard_stack_algebraic`, AlgebraicModuliForArithmeticGeometry §7.3 `rigidification_gm_torsor`, SchemeAndStackFoundations Layer 1.

**Checks.**

- `RelativePicardChecks.point`: for `X=B` the fppf relative class sheaf is terminal, although the Picard stack has `Gₘ` stabilizers.
- `RelativePicardChecks.projectiveLine`: for `P¹_B` the relative Picard sheaf is the constant degree group `ℤ_B`.
- `RelativePicardChecks.section`: a section identifies rigidified line-bundle classes with the relative sheaf; without a section the sheafification is retained.

### C3.2d.3 The Picard diagonal and separatedness

Prove `relative_picard_separated`. Under the preceding Picard hypotheses its diagonal is a quasi-compact immersion, hence it is locally separated. If every geometric fibre of `X→B` is integral, the Picard space is separated over `B`.

Here For the separatedness statement geometric integrality is required; normality is not added. Universal functions remains in force.

([Stacks](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.11.9, pp. 30–31; [Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), Lemmas 108.9.2–108.9.4, pp. 14–15).

For the proof, express the diagonal as the locus of relative equality of line-bundle classes, computed by sections of `L` and `L⁻¹`; then use perfect pushforward and rank loci for its immersion and quasi-compactness; then for a valuation-ring test, two positive section spaces on an integral fibre force a line bundle generically trivial and relatively equal to zero; conclude the properness of the diagonal.

*Needs:* §C3.2d.2 `relative_picard_algebraicSpace`, EnhancedDerivedSheaves E1.9 `perfect_proper_pushforward`, SchemeAndStackFoundations Layer 1.

**Checks.**

- `PicardSeparatedChecks.line`: the Picard space of `P¹_B` is `ℤ_B` and is separated.
- `PicardSeparatedChecks.curve`: a smooth proper geometrically integral pointed curve has separated Picard space, including every degree component.
- `PicardSeparatedChecks.baseChange`: after arbitrary base change of a universally cohomologically flat proper flat family, the diagonal comparison is the pullback of the equality-of-class locus; geometric integrality is required for its separated conclusion.

### C3.2d.4 The Brauer obstruction to a Picard representative

Prove `picard_brauer_obstruction`. For proper flat finitely presented `f:X→T` with universal functions, the fppf Leray spectral sequence for `Gₘ` gives `0→Pic(T)→Pic(X)→Pic_{X/T}(T)→H²_fppf(T,Gₘ)→H²_fppf(X,Gₘ)`. The image of a relative class has zero obstruction exactly when it is represented by a line bundle on `X`. With a section the obstruction vanishes and the sequence recovers the prior split Picard comparison.

Here `H²` denotes cohomological Brauer data, without asserting that every class is Azumaya or torsion over every base.

([Stefan Schröer](https://arxiv.org/pdf/2004.07025), Lemma 1.1 and proof, p. 5).

For the proof, use universal functions to identify `f_*Gₘ` with `Gₘ`; then use Hilbert 90 and invertible-module descent to identify `R¹f_*Gₘ` with the relative Picard sheaf; then read the Leray five-term sequence; the section gives a retraction on cohomology and hence zero boundary.

*Needs:* SchemeAndStackFoundations §2.2, SchemeAndStackFoundations §2.11, JacobianChallenge Layer D and SchemeAndStackFoundations §2.22, AlgebraicModuliForArithmeticGeometry §7.6.1 `relativePicardKernel`, AlgebraicModuliForArithmeticGeometry §7.6.1a `sectionPicardSplit`, §C3.2d.2 `relative_picard_algebraicSpace`.

**Checks.**

- `PicardBrauerChecks.section`: a section retracts the cohomology pullback and makes the obstruction zero.
- `PicardBrauerChecks.point`: for `X=T` the relative class group and obstruction map vanish.
- `PicardBrauerChecks.conic`: for a nonsplit smooth conic over a field the geometric degree-one relative class has the nonzero conic Brauer obstruction; its double is represented by a line bundle.

### C3.2d.5 Finite Cartier-dual torsors and Picard classes

Prove `finite_picard_cartier_torsors`. Let `f:X→B` be proper flat finitely presented with universal functions, `M` a finite locally free commutative group scheme over `B` and `D(M)` its Cartier dual. There is a natural isomorphism of fppf sheaves `R¹f_*(D(M)_X)≅Hom_B(M,Pic_{X/B})`. Thus a homomorphism into the Picard sheaf gives fppf-locally on `B` a `D(M)`-torsor on `X`. With a section, rigidifying the torsor along it gives the pointed global correspondence. Without a section there can be a base `H²(D(M))` obstruction to a global representative.

Here Finite locally free includes flatness and finite presentation; the statement includes non-étale group schemes. Sheafification of torsors and global torsors are distinguished.

([Michel Raynaud](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf), Proposition 6.2.1, pp. 50–51, and Lemma 6.2.2 (fppf-local splitting of extensions of M by Gₘ), p. 51; [Stefan Schröer](https://arxiv.org/pdf/2004.07025), Section 5, pp. 14–15).

For the proof, use ModularCurves §0B’s `FiniteFlatCommGroupScheme.cartierDual` and `cartierDualBaseChangeIso` for scheme-base Cartier duality and its arbitrary-base-change comparison; on affine bases compare with the pinned Hopf-algebra duality. For an algebraic-space base `B`, apply this supplier on affine étale charts and glue by its base-change comparison and Layer 3 descent; this chart-gluing bridge is part of the present target; then push out a `D(M)`-torsor by each character to obtain the corresponding Picard homomorphism; then use fppf-local splitting of extensions of `M` by `Gₘ` to reverse this construction as in Raynaud 6.2.1; then apply Leray for `D(M)` to distinguish sheaf points, globally realized torsors and pointed rigidifications.

*Needs:* ModularCurves §0B (`FiniteFlatCommGroupScheme.cartierDual`, `cartierDualBaseChangeIso`), AlgebraicModuliForArithmeticGeometry Layer 3 descent, Tau Ceti `TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality`, SchemeAndStackFoundations §§2.3–2.4, §C3.2d.4 `picard_brauer_obstruction`, §C3.2d.2 `relative_picard_algebraicSpace`, SchemeAndStackFoundations Layer 1.

**Checks.**

- `PicardTorsorChecks.trivialGroup`: for `M=0` both sheaves in the correspondence are terminal.
- `PicardTorsorChecks.kummer`: for `M=(ℤ/n)_B` its dual is `μ_n`; on the relative fppf sheaf the correspondence recovers `n`-torsion Picard classes, including residue characteristics dividing `n`.
- `PicardTorsorChecks.pointed`: rigidifying along a supplied section removes base torsors and gives the pointed global correspondence; forgetting the rigidification recovers the sheaf correspondence.

### C3.2e Torsion components of the Picard scheme

Prove `picardTorsionComponent`. Let `B` be a locally Noetherian scheme and `f : X → B` a morphism of schemes, projective Zariski-locally on `B`, flat and with geometrically integral fibres. Then `Pic^τ_{X/B}`, consisting of classes with a positive multiple fibrewise algebraically equivalent to zero, is an open and closed subgroup scheme of `Pic_{X/B}` of finite type over `B`, and its formation commutes with every base change `B′ → B` with `B`′ locally Noetherian. Over a field `Pic⁰` is the identity component and `Pic^τ_{P¹/k} = 0`. The general proper-flat algebraic-space hypotheses of the Picard representability theorem alone are not the hypotheses of this result, and no statement is made here over a base that is not locally Noetherian.
(Kleiman, The Picard scheme, arXiv:math/0504020, Theorem 6.16, pp. 58–59 (published numbering 9.6.16), whose standing conventions on `p`. 15 restrict all schemes to be locally Noetherian; the projective Zariski-local, flat and geometrically integral hypotheses are explicit there.)
*Needs:* §§C3.2d.1–C3.2d.3; SchemeAndStackFoundations §2.11.

**Checks.**

- `PicardTorsionChecks.projectiveLine`: `Pic^τ_{P¹/k} = 0` although `Pic_{P¹/k} = ℤ`.
- `PicardTorsionChecks.elliptic`: for an elliptic curve `E` over `k`, `Pic^τ = Pic⁰ ≅ E`, the degree-zero part.
- `PicardTorsionChecks.enriques`: for an Enriques surface over an algebraically closed field of characteristic different from 2, `Pic⁰ = 0` while `Pic^τ ≅ ℤ/2` is generated by the canonical class, so `Pic^τ` is not the identity component.

### C3.2f.1 The identity-component Picard sheaf

Define `picardZeroSheaf`. For the quasi-separated represented relative Picard sheaf `P`, define `Pic⁰(T)` as the subgroup of `P(T)` whose value at every geometric point `t` of `T` lies in the connected component containing zero in `P_t`. Keep the full induced scheme or algebraic-space structure when this subfunctor is represented; do not replace a nonreduced component by its reduction.

Here `P` is a group algebraic space locally of finite presentation over `B`; geometric points test every base-changed fibre.

([Steven L. Kleiman](https://arxiv.org/pdf/math/0504020), Proposition 5.10, pp. 41–42, and Proposition 5.20, pp. 47–48; [Stefan Schröer](https://arxiv.org/pdf/2004.07025), Section 4, classification table, p. 13).

The API gives `picardZeroSheaf.inclusion`: `Pic⁰` includes naturally into the relative Picard sheaf as a subgroup; `picardZeroSheaf.baseChange`: For every `B′→B`, the pullback of this subfunctor is canonically the identity-component subfunctor of `P_B′`, naturally in test schemes; the neutral component of a fibre is geometrically connected because it has the identity point; `picardZeroSheaf.fibre`: On geometric fibres the sheaf is exactly the identity component, with its full structure; `picardZeroSheaf.mk`: A section of `P` and proofs that all its geometric values lie in the identity components determine a section of `Pic⁰`; `picardZeroSheaf.mem_iff`: Membership is equivalent to the identity-component condition at every geometric point of `T`; `picardZeroSheaf.group`: Addition, zero and inverses are specified from `P` and preserve the fibrewise identity-component condition; `picardZeroSheaf.ext`: Sections are equal exactly when their images in `P` are equal; no reduction of the represented component is used.

*Needs:* §C3.2d.2 `relative_picard_algebraicSpace`, SchemeAndStackFoundations §1.13, SchemeAndStackFoundations Layer 1.

**Checks.**

- `PicardZeroTests.projectiveLine`: For `P¹/k` the relative Picard sheaf is the constant degree group `ℤ` and `Pic⁰` is zero.
- `PicardZeroTests.curve`: For a smooth proper pointed curve `Pic⁰` agrees with the existing JacobianChallenge identity component.
- `PicardZeroTests.nonreduced`: For an ordinary Enriques surface Y over an algebraically closed field `k` of characteristic 2, `Pic^τ=μ₂` is connected, hence `Pic⁰=μ₂`. Its coordinate ring `k[t]/((t−1)²)` retains a nonzero nilpotent `t−1`; the reduced identity component would be the trivial group.

### C3.2f.2 Representability of the identity component

Prove `picardZeroCriterion`. Assume `B` is locally Noetherian and `P` is the quasi-separated relative Picard group algebraic space locally of finite presentation over `B`. If its geometric identity components are smooth of locally constant dimension, `picardZeroSheaf` is represented by an open group subspace `P⁰` of finite type over `B`. It is smooth over reduced `B`. Over a nonreduced `B`, formal smoothness of `P` along `P⁰` is an additional sufficient hypothesis for smoothness. If the geometric identity components are proper and `P` is separated over `B`, `P⁰` is proper over `B` and closed in `P`. Formation of `P⁰` commutes with arbitrary base change, including nonreduced new bases. For scheme-represented `P` this is the group subscheme criterion. ([Steven L. Kleiman](https://arxiv.org/pdf/math/0504020), Proposition 5.20 and proof, pp. 47–48; the algebraic-space extension is AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion`.)

*Needs:* §C3.2f.1 `picardZeroSheaf`, §C3.2d.3 `relative_picard_separated`, AlgebraicModuliForArithmeticGeometry §7.3 `picard_infinitesimal_lifting`, AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion`, SchemeAndStackFoundations Layer 1, JacobianChallenge Layer D.


Apply AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion`, including its étale descent, reduced-base flatness and nonreduced-base formal-smoothness argument, to the identity section. Translation gives the group subspace and its finite-type and properness conclusions.
**Checks.**

- `PicardZeroChecks.point`: `P=0` gives `P⁰=0`, smooth and proper of dimension zero, over reduced and nonreduced bases.
- `PicardZeroChecks.elliptic`: for an elliptic scheme `P⁰` is its smooth proper dual of dimension one; no `H²=0` test is imposed on higher-dimensional abelian schemes.
- `PicardZeroChecks.fullStructure`: `μ₂` over characteristic two has a nonreduced connected component, different from its reduced identity point; replacing `P⁰` by its reduction changes the group functor.
- `PicardZeroChecks.baseChange`: after `B′→B`, including `B′=Spec(k[ε]/(ε²))` over `B=Spec k`, `P⁰_B′` represents the same fibrewise subfunctor of `P_B′`; this comparison carries the full ring sheaf.
- `PicardZeroChecks.nonreducedBase`: `Spec(B_red)→Spec B` has smooth point fibres but is not flat when `B=k[ε]/(ε²)`. The formal-smoothness test excludes this morphism; fibre smoothness alone does not prove the stated nonreduced-base conclusion.

### C3.2g Formal parameters for relative Picard classes

Prove `picardParameter_formalEquiv`, the Picard instantiation of AlgebraicModuliForArithmeticGeometry §8.3 `ParameterFormalExports`. Let `S` be locally Noetherian and `X→S` proper, flat and finitely presented with universal functions. Let `P` be the represented relative fppf Picard sheaf of §C3.2d.2, and `p` a finite-type point. Choose a pointed étale scheme chart `(U,u)→(P,p)` inducing the same residue field. The completion `Ô_(U,u)` represents the framed deformation functor of the relative Picard class `p` on local Artinian `S`-algebras with that residue field. The framing fixes the special-fibre class. This is a set-valued class functor; it does not classify the arrows of the Picard stack.

Transport the representation through `schemeFramedCompletionEquiv` and `spaceFramedEtaleCompletionEquiv`. The Picard instantiation of `ParameterFormalExports.classify`, `.universal` and `.classify_natural` retains the universal relative class, compatibility with Artinian pullback, and the canonical comparisons under pointed étale refinement. A chart with a residue extension changes the coefficient problem.

([Stacks](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.12.3, pp. 18–19; §98.3, pp. 4–5.)

*Needs:* §C3.2d.2; AlgebraicModuliForArithmeticGeometry §8.3 (`ParameterFormalExports`, `schemeFramedCompletionEquiv`, `spaceFramedEtaleCompletionEquiv`); Mathlib `CategoryTheory.yoneda`; SchemeAndStackFoundations Layer 1.

**Checks.**

- `ParameterTests.picardAutomorphisms`: for `X=Spec A` over itself the relative Picard sheaf is terminal, while the trivial line in the Picard stack has automorphism group `A×`.
- `PicardParameterChecks.identityRepresentation`: transporting the represented Picard functor by the identity representation classifies actual arrows to `P` and takes `id_P` to the universal relative class.
- `PicardParameterChecks.pullback`: classification of an Artinian composition is pullback of the relative class; changing the pointed étale chart by a common refinement gives the same framed deformation.

### C3.3 Derived GAGA for proper algebraic spaces

Prove `derivedGagaProperSpace`. Let `X` be a proper algebraic space of finite type over `ℂ`, nilpotents
allowed, and `c : X^an → X_ét` the morphism of ringed topoi given by the étale charts of
`complexSpaceAnalytification`. Then `Lc^* : D^b_coh(X) → D^b_coh(X^an)` is a t-exact equivalence of
triangulated categories. On hearts it is the coherent analytification of C0.7, so it recovers the
abelian equivalence and the cohomology comparison of `properSpaceComplexGaga`, and on a proper scheme
it agrees with `properSchemeGagaEquivalence`. The proof checks the hypotheses of Hall's
Tor-independent GAGA theorem (Theorem 9.1) with the family of closed points: `RΓ(X^an, −)` has finite-dimensional
cohomology on bounded coherent complexes (`cartanSerreFiniteness`); `c` is flat and Tor-independent
of each closed point (`completedAnalyticStalkComparison.flat`); at a closed point the residue fields
agree and pullback is an equivalence on the residue-field modules (`completionIso`); `O_X` is
coherent (and `O_{X^an}` is coherent by Oka's theorem, `ComplexAnalyticSpace.coherentStructure`); and
the residue fields of the closed points form a pseudo-conservative family on both sides (Nakayama on
top cohomology and the Jacobson property). Full faithfulness and essential surjectivity then follow
from the adjunction of C3.2 (Hall, Theorem 9.1 and the proof of Theorem A, pp. 20–21; Lemma 5.5,
p. 12; Examples 7.1–7.2, p. 18, and Lemma 7.4, p. 19, for pseudo-conservative families). *Needs:* `spaceQuasiCoherator`;
`pseudoCoherenceDetection`; `analyticEtaleDescent`; `cartanSerreFiniteness`;
§C−1.2 `completedAnalyticStalkComparison`, `properSpaceComplexGaga`.

### Examples

- For the degree-two étale map `G_m → G_m`, `z ↦ z²`, coherent descent along the analytified chart
  uses the deck cocycle on `(G_m ×_{G_m} G_m)^an`; both charts are nonproper and no GAGA statement is
  applied to them.
- For a proper scheme viewed as an algebraic space, `derivedGagaProperSpace` restricts on hearts to the
  scheme GAGA functor; for the doubled closed point `Spec ℂ[ε]/(ε²)`, the residue-field test detects the
  nonzero nilpotent module `ε·ℂ[ε]/(ε²)`.
- An étale chart of a proper algebraic space need not be proper; nothing in this layer applies
  absolute GAGA to it.

### Dependencies

C0, C1; AlgebraicModuliForArithmeticGeometry Layer 3 and §7.7; §C−1.2 and §C1.9; SchemeAndStackFoundations
Layer 1 and Layer 2; Mathlib derived categories.

<a id="c4"></a>

## Layer C4: Analytic images, Chow algebraization and morphism comparison

This layer proves the classical image theorems of complex analytic geometry and uses them, with
coherent GAGA, to algebraize closed analytic subspaces of projective space (keeping nilpotents),
coherent modules with proper support, and holomorphic maps out of proper schemes. It ends with the
comparison of algebraic and analytic connectedness for smooth affine curves. Borel's algebraicity of
maps from nonproper sources into arithmetic quotients and definable Chow are not consequences of
anything here.

### C4.1 Remmert's theorems

Prove `remmertProperImage`: for a proper holomorphic map `f : T → S` of finite-dimensional complex
analytic spaces and a closed analytic subset `A ⊆ T`, the image `f(A)` is a closed analytic subset of
`S` (with its reduced structure); properness of `f|_A` suffices. Nilpotent structure on images is
handled separately through coherent ideals. In particular, for proper `f` the sets
`B_k = {s ∈ S : dim f⁻¹(s) ≥ k} = f(A_k)` are closed analytic, by `fibreDimensionLoci`. The proof is
the simultaneous induction on dimension with `remmertSteinExtension`: away from a lower-dimensional
critical image the image is described by finite projections and symmetric functions of the sheets,
and the extension theorem fills in the critical image; closedness is topological properness
(Demailly, II.8.8 with the simultaneous proof of II.8.7, pp. 118–121, using the semicontinuity
results II.8.2–8.6, pp. 116–118). *Needs:* §C−1.1
(`ComplexAnalyticSpace`, ComplexKahlerGeometry K3's Weierstrass preparation, `coherentStructure`);
`analyticSetGeometry`; `fibreDimensionLoci` for the `B_k` statement.

Prove `remmertSteinExtension`: let `T` be a complex analytic space, `E ⊆ T` a closed analytic subset
of dimension at most `p`, and `Z` an analytic subset of `T ∖ E` with `dim_x Z > p` at every
`x ∈ Z`. Then the closure of `Z` in `T` is analytic (Demailly, II.8.7 and the simultaneous proof,
pp. 118–121). The strict inequality cannot be weakened: a sequence of points converging to a point
of a zero-dimensional `E` has non-analytic closure (see the Examples). *Needs:* `remmertProperImage` (in the simultaneous
induction); `analyticSetGeometry`; ComplexKahlerGeometry K3's Weierstrass preparation.

### C4.2 Chow's theorem with nilpotents

Prove `projectiveChowNonreduced`: every closed analytic subspace `Z ⊆ Pʳ_an` defined by a coherent
ideal `I`, radical or not, is `W^an` for a unique closed subscheme `W ⊆ Pʳ`, and `I = I_W^an`. For
reduced `Z` this is Chow's theorem. The proof generates `I(k)` for large `k` by finitely many global
sections (`analyticSerreGeneration`), identifies them with homogeneous polynomials
(`analyticTwistCohomology` in degree `0`), and algebraizes the inclusion and the quotient, keeping every
nilpotent order; the reduced statement can also be read off from `remmertSteinExtension` applied to
the cone in `ℂ^{r+1}` (Serre, exposé 19, §4, no. 10, Propositions 8–9 and the corollary,
pp. 19-5–19-7; Demailly, II.8.10,
p. 121). It says nothing about closed analytic subsets of `Aⁿ`. *Needs:* `analyticSerreGeneration`;
`analyticTwistCohomology`; `projectiveGeometricDictionaries`; `remmertSteinExtension`.

### C4.3 Compactification and algebraization with proper support

Use the compactification objects, Nagata theorem and common refinements of
EtaleCohomologyFoundations §§G.1–G.3. Every compactification in this coherent application has base `Spec ℂ`;
for quasi-projective schemes projective closure supplies a choice.

Prove `properSupportAlgebraization`: let `Y` be a separated scheme of finite type over `ℂ` and `G` a
coherent analytic module on `Y^an` whose support is compact. Then `G ≅ F^an` for a coherent `O_Y`-module
`F` with proper support and a specified isomorphism `F^an ≅ G`; this pair is unique up to
unique isomorphism compatible with the specified identification, and morphisms between such
modules algebraize uniquely. In particular a closed analytic subspace of `Y^an` with compact support is `W^an`
for a unique closed subscheme `W ⊆ Y`, proper over `ℂ`, nilpotents included. For `Y = A¹_ℂ`,
the analytic module `O_{Y^an}` has noncompact support and is not covered. Choose a compactification `Y ⊆ Ȳ` (EtaleCohomologyFoundations §G.2 `nagataCompactification`); the support of `G` is closed
in `Ȳ^an`, so `G` extended by zero is coherent; apply `properSchemeGagaEquivalence` on `Ȳ`;
faithfulness puts the support of the algebraic module inside `Y`, and full faithfulness, applied on a
common refinement of two compactifications (EtaleCohomologyFoundations §G.3 `compactificationCommonRefinement`), makes the result independent of
the compactification (SGA 1, XII, Theorem 4.4, printed pp. 249–250, applied on `Ȳ`; Serre, *GAGA*,
n° 19, Proposition 14, printed p. 29, for reduced compact analytic subsets; the reduction to a
compactification is the argument just given).
*Needs:* EtaleCohomologyFoundations §§G.1–G.3 (`Compactification`, `nagataCompactification`,
`compactificationCommonRefinement`); §C1.9 `properSchemeGagaEquivalence`; `coherentAnalytification_faithful`; §C−1.1 `complexSchemeAnalytification.openSubspace`.

**Checks.**

- On `A¹_ℂ`, the analytic structure sheaf has support `ℂ`, which is not compact.
- On `P¹_ℂ`, the analytic structure sheaf has compact support and algebraizes to `O_{P¹}`.
- On `Spec ℂ`, the structure sheaf is covered and algebraizes to the rank-one module `ℂ`.

### C4.4 Holomorphic maps out of proper schemes

Prove `properSourceMorphismAlgebraicity`: for a proper scheme `X` over `ℂ` and a separated scheme
`Y` of finite type over `ℂ`, nilpotents allowed on both, the map
`Hom_ℂ(X, Y) → Hom(X^an, Y^an)` is bijective; `Y` need not be proper. The graph of a holomorphic
`h : X^an → Y^an` is a closed analytic subspace of `(X × Y)^an` isomorphic to `X^an`, hence with
compact support; `properSupportAlgebraization` makes it `Γ^an` for a closed subscheme
`Γ ⊆ X × Y`; the first projection `Γ → X` is proper and quasi-finite, hence finite, and the map
`O_X → p_*O_Γ` becomes an isomorphism after analytification, hence is one by faithfulness; compose its
inverse with the second projection (SGA 1, XII, Corollary 4.5 and its graph argument, printed
pp. 250–251, for `X` and `Y` both proper; Serre, *GAGA*, n° 19, Propositions 14–15, printed
pp. 29–30, for reduced complete `X` and arbitrary `Y`; the general case is the graph argument just
given). *Needs:*
`properSupportAlgebraization`; `CoherentAnalyticIdeal`; `coherentAnalytification_faithful`;
§C1.9 `properSchemeGagaEquivalence`, `complexSchemeAnalytification.homEquiv`,
`complexSchemeAnalytification.fibreProduct`.

Prove `algebraicGraphRegular`: let `X`, `Y` be reduced schemes of finite type over `ℂ` and
`h : X^an → Y^an` holomorphic. If the graph of `h` is (the analytification of) a locally closed
algebraic subvariety `Γ ⊆ X × Y`, then `h` is the analytification of a morphism `X → Y`. Neither
properness nor smoothness of `X` is assumed; for nonreduced sources the graph must be algebraic as a
subspace. The first projection `Γ → X` is bijective on complex points and an analytic isomorphism;
Serre's comparison of the usual and Zariski closures of an image (*GAGA*, n° 7, Proposition 7,
printed p. 12) makes it a homeomorphism for the Zariski topology, a count of generic fibre degrees
makes it birational on components, and the flat local comparison identifies the local rings (Serre,
*GAGA*, n° 8, Propositions 8–9 and proofs,
printed pp. 13–15). This is the second step of the definable-Chow route of Bakker–Klingler–Tsimerman
(Theorem 4.12, printed p. 933), whose first step — making a nonproper graph algebraic — is
LogicAndDefinabilityInNumberTheory LD.6. *Needs:* §C−1.2 `completedAnalyticStalkComparison`; `coherentAnalytification_faithful`; AlgebraicModuliForArithmeticGeometry
Layer 2; SchemeAndStackFoundations Layer 1.

Prove `familyMorphismInterface`: (1) if `X → S` and `Y → S` are morphisms of schemes of finite type over
`ℂ` with `X` proper over `ℂ` and `Y` separated, every holomorphic `S^an`-morphism `X^an → Y^an` is the
analytification of a unique `S`-morphism; (2) for a projective family `X → S` and `Y → S` with
`Hom_S(X, Y)` represented as in AlgebraicModuliForArithmeticGeometry Layer 3, at every complex point
`s` of `S` the fibre `Hom(X_s, Y_s) → Hom(X_s^an, Y_s^an)` is bijective, while a holomorphic section of
`Hom_S(X, Y)^an` over a nonproper `S^an` need not be algebraic; (3) for abelian varieties `A`, `B`
over `ℂ`, every holomorphic group homomorphism `A^an → B^an` is the analytification of a unique
homomorphism of abelian varieties, and an analytic isogeny algebraizes together with its finite
kernel and degree. Group-law diagrams are checked by faithfulness (SGA 1, XII, §4.5, printed
pp. 250–251; Bakker–Klingler–Tsimerman, Theorem 4.12, printed p. 933, for the separate graph
interface). *Needs:* `properSourceMorphismAlgebraicity`; `algebraicGraphRegular`; `gagaBaseChange`;
AlgebraicModuliForArithmeticGeometry Layer 3.

### C4.5 Connectedness of affine curves

Prove `affineCurveCompletionInterface`: let `U` be a connected component of a smooth affine curve
over `ℂ`. AlgebraicCurves Layer 12B–12C gives its smooth projective model `C` (unique up to unique
isomorphism). Construct `U → C` here by extending the identity of function fields to the
DVR stalks of the regular affine curve, using Layer 2's normal affine charts and the proper model's
valuative criterion. The local maps glue by separatedness; prove that the birational morphism
between regular curves is an open immersion. Then `D = C ∖ U` is a finite set of closed points
(a proper closed subset of an irreducible
one-dimensional Noetherian scheme), and `U^an = C^an ∖ D` as an open analytic subspace. Holomorphic
functions on `U^an` are not the coordinate ring of `U` (AlgebraicCurves, Layers 2 and 12B–12C, for
the affine chart dictionary and model; SGA 1, XII, 1.1 a), printed p. 240, for open immersions under
analytification). *Needs:* TauCetiRoadmap.AlgebraicCurves
(Layers 2 and 12B–12C); §C−1.1 `complexSchemeAnalytification.openSubspace`;
Mathlib `topologicalKrullDim`.

**Checks.**

- For `U = A¹`, the model is `P¹`, the immersion is the standard affine chart and the complement
  is the single point `∞`.
- For `U = G_m`, the same model has complement `{0,∞}`.
- For an elliptic curve with its origin removed, the model is that elliptic curve and the
  complement is the origin; the construction is not restricted to rational function fields.

Prove `puncturedRiemannSurfaceConnected`: if `M` is a connected Riemann surface (a connected
Hausdorff complex manifold of dimension one: Mathlib `ChartedSpace ℂ M` with `IsManifold 𝓘(ℂ) ω M`)
and `D ⊆ M` is finite, then `M ∖ D` is connected and path-connected. Connected manifolds are path
connected; a path meeting `D` is rerouted around each point of `D` inside a punctured coordinate disc,
which is path connected because the real dimension is two. The statement fails for real intervals
(SGA 1, XII, Lemma 2.5, printed p. 244, proves the general form: the complement of a nowhere dense
closed analytic subset of a connected normal analytic space is connected). *Needs:* Mathlib manifolds and path connectedness.

Prove `affineCurveConnectedness`: a smooth affine curve `U` over `ℂ` is connected if and only if
`U^an` is connected. Work component by component: for a connected `U` the projective model `C` is
connected, so `H⁰(C, O_C)` has no nontrivial idempotents; `properSchemeGagaEquivalence` identifies
these with the idempotents of `H⁰(C^an, O)`, so `C^an` is connected; `puncturedRiemannSurfaceConnected`
removes `D`. Conversely a decomposition of `U` into open and closed pieces analytifies. No full
faithfulness on the nonproper `U` is used, and the false claim that every holomorphic function on an
affine variety is algebraic is not invoked (SGA 1, XII, Proposition 2.4, printed pp. 243–244, proves
the comparison of connectedness for every scheme locally of finite type over `ℂ`; this target is its
one-dimensional case, by the route above). *Needs:* `affineCurveCompletionInterface`;
`puncturedRiemannSurfaceConnected`; §C1.9 `properSchemeGagaEquivalence`.

### Examples

- The projection `P¹ × P¹ → P¹` maps a compact analytic subset to an analytic subset; the
  non-proper map `ℂ² → ℂ²`, `(x, y) ↦ (x, xy)` has image `{x ≠ 0} ∪ {(0, 0)}`, which is not closed.
- The closure of `ℂ* ⊂ ℂ` across `E = {0}` is analytic since `1 > 0`; a sequence of points converging
  to `0` (dimension `0`, not greater than `dim E = 0`) has a closure that is not analytic at `0`.
- The double hyperplane cut out by `L²`, `L` a linear form, keeps the square ideal under Chow.
- A finite-length analytic module supported at `0 ∈ A¹` algebraizes with its nilpotents; `O_{A¹,an}`
  does not satisfy the compact-support hypothesis.
- Maps `Spec ℂ[ε]/(ε²) → Y` keep their tangent vectors under analytification; every holomorphic map
  `P¹_an → A¹_an` is constant, consistent with `Hom(P¹, A¹) = ℂ`.
- `A¹` and `G_m` analytify to the connected `ℂ` and `ℂ*`; the disjoint union of two affine lines stays
  disconnected; `P¹ ∖ {0, ∞}` is path connected, an interval minus an interior point is not.

### Dependencies

C0–C2; §§C−1.1–C−1.2 and C1.9; AlgebraicModuliForArithmeticGeometry Layers 1–3;
SchemeAndStackFoundations Layer 1 and §0.9; EtaleCohomologyFoundations §§G.1–G.3
(`Compactification`, `nagataCompactification`, `compactificationCommonRefinement`);
StableReduction Layer 4 and SchemeAndStackFoundations §4.11 for compactification geometry;
TauCetiRoadmap.AlgebraicCurves (Layers 2 and 12B–12C); Mathlib schemes and manifolds.

<a id="c5"></a>

## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison

The de Rham layer. Its seven parts are: the ordinary comparison for proper smooth schemes (C5.1);
families, the Gauss–Manin connection and Ehresmann's theorem (C5.2); geometric Hodge theory (C5.3);
integration over analytic cycles and the Chern normalisation (C5.4); logarithmic structures (C5.5);
regular singular connections and Deligne's Riemann–Hilbert theory (C5.6); curves and the proper
logarithmic comparison (C5.7). Throughout, de Rham complexes are complexes of sheaves of
`ℂ`-vector spaces (relative ones of `f⁻¹O_S`-modules) whose terms are coherent, and they are compared
through differential operators, never by applying coherent GAGA to a `ℂ`-linear differential.

### C5.1 The ordinary comparison

Define `AlgebraicDeRham X` for a smooth scheme `X` over `ℂ` (more generally over a field `k` of
characteristic zero), by sheafifying DerivedDeRhamCohomology Layer 2's ordinary
`DeRham.complex k A` on affine opens `Spec A` and gluing along its localization pullbacks
`DeRham.complexMap`. Thus `Ω^p_{X/ℂ} = Λ^p Ω¹_{X/ℂ}`, with the shared `ℂ`-linear differential determined by
`d(a₀ da₁ ∧ ⋯ ∧ da_p) = da₀ ∧ da₁ ∧ ⋯ ∧ da_p`. It satisfies `d² = 0` and the graded Leibniz rule and is
not `O_X`-linear. Forgetting the module structures gives a complex of sheaves of `ℂ`-vector spaces in
degrees `p ≥ 0` with finite locally free terms; `H^q_dR(X/ℂ)` is its hypercohomology. Near a point
`x` the module `Ω¹_{X/ℂ}` is free of rank `dim_x X`, so `Ω^p_{X/ℂ} = 0` for `p > dim X`: the complex
is bounded when `X` is finite-dimensional, in particular when `X` is of finite type, and finite local
freeness of each term does not bound it in general. The API is
`AlgebraicDeRham.d_on_generator` (the displayed formula), `AlgebraicDeRham.d_squared`
(`d ∘ d = 0`), `AlgebraicDeRham.pullback` (a morphism of smooth schemes induces pullback of forms
commuting with `d`) and `AlgebraicDeRham.bounded` (`Ω^p_{X/ℂ} = 0` for `p > dim X` when `X` is
finite-dimensional) (Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math.
IHÉS 29 (1966), notation (1)–(4), printed pp. 95–96; Stacks, §10.132, tag 0FKF;
Deligne, *Équations différentielles à points
singuliers réguliers*, LNM 163 (1970), I.2.20.3–2.21, printed pp. 13–14). *Needs:*
DerivedDeRhamCohomology Layer 2 §§2.1–2.19 (`DeRham.complex`, `DeRham.complexMap`,
`DeRham.d_squared`, `DeRham.d_leibniz`); Mathlib `KaehlerDifferential.D`,
`exteriorPower.ιMulti`; TauCetiRoadmap.AlgebraicVectorBundles (L0C exterior powers of locally free
sheaves); Mathlib `DerivedCategory` (hypercohomology of a bounded-below complex of sheaves of
`ℂ`-vector spaces on the Zariski site, as morphisms from the constant sheaf in the derived category).

**Checks.**

- On `Spec A`, sections on each principal open recover `DeRham.complex k A_f`; restriction
  is the supplier's localization complex map. For `z ↦ z²` on `k[z]`, the affine pullback is
  `DeRham.complexMap` and sends `dz` to `2z dz`.
- `AlgebraicDeRham.point`: for `Spec ℂ` the complex is `ℂ` in degree `0`.
- `AlgebraicDeRham.polynomial`: on `A¹ = Spec ℂ[z]`, `d(zⁿ) = n zⁿ⁻¹ dz`.
- `AlgebraicDeRham.torus`: on `G_m = Spec ℂ[z, z⁻¹]`, `dz/z` is closed and not exact (it is not
  `d` of any Laurent polynomial), so `H¹_dR(G_m) ≠ 0`; a complex that forgot the units would miss it.
- `AlgebraicDeRham.disjointUnion`: `X = ⊔_{n ≥ 0} Aⁿ_ℂ` is smooth and locally of finite type over `ℂ`,
  and `Ω^p_X ≠ 0` for every `p` (restrict to the component `A^p_ℂ`), so its de Rham complex is not
  bounded; `AlgebraicDeRham.bounded` needs `dim X < ∞`.

Define `HolomorphicDeRham T` for a complex manifold `T`: `Ω^p_T` the coherent sheaf of holomorphic
`p`-forms (the locally free module of the holomorphic cotangent bundle's `p`-th exterior power, by
`holomorphicBundleDictionary`) with the holomorphic exterior derivative, a bounded complex of sheaves of
`ℂ`-vector spaces with `Ω⁰_T = O_T` and `ℂ`-linear, not `O_T`-linear, differential. The API is
`HolomorphicDeRham.degreeZero` (`Ω⁰_T = O_T`), `HolomorphicDeRham.d_squared` (`d² = 0`) and
`HolomorphicDeRham.pullback` (holomorphic maps induce pullbacks commuting with `d`) (Deligne 1970,
I.2.10–2.15, printed pp. 9–11, with the canonical connection `∇f = df` of I.2.7.3, p. 8). *Needs:* `holomorphicBundleDictionary`; TauCetiRoadmap.AlgebraicVectorBundles
(L0C).

**Checks.**

- `HolomorphicDeRham.point`: on a point the complex is `ℂ` in degree `0`.
- `HolomorphicDeRham.coordinate`: `d(zᵢ) = dzᵢ` in a holomorphic chart, and `d(fg) = f dg + g df`.
- `HolomorphicDeRham.torusPeriod`: on `ℂ*` the closed form `dz/z` integrates to `2πi` over the
  positively oriented unit circle (Mathlib `circleIntegral.integral_sub_inv_of_mem_ball`), so it is not
  exact on `ℂ*`.

Prove `holomorphicPoincare`: on a complex manifold `T`, the inclusion of the constant sheaf `ℂ` into
`Ω^•_T` is a quasi-isomorphism. On a coordinate ball every closed holomorphic `p`-form with `p ≥ 1` is
exact on a smaller ball, and the kernel of `d : O → Ω¹` is the sheaf of locally constant functions.
The radial homotopy `K` with `dK + Kd = id − ev₀` proves it, the parameter integral preserving
holomorphy (Deligne 1970, I.2.19 and I.2.23 (ii) with 2.23.2–2.23.3, printed pp. 13–17, where the
homotopy integrates power series term by term). *Needs:* `HolomorphicDeRham`.

**Shared algebraic operators and principal parts — `IsDifferentialOperator`.**
Use FormalConnectionsOpers F2.2's ordinary algebraic foundation. For arbitrary commutative
`k`, a commutative `k`-algebra `A`, arbitrary `A`-modules `M`, `N` and a `k`-linear map
`D : M → N`, `IsDifferentialOperator k m D` means order at most `m`: order zero is
`A`-linearity, and order at most `m+1` means every commutator
`commutatorWith k a D = D ∘ (a·) − a·D` has order at most `m`. The local prototypes
`TauCetiRoadmap.ComplexComparisonPartII.IsDifferentialOperator` and
`TauCetiRoadmap.ComplexComparisonPartII.commutatorWith` model F2.2's canonical
algebraic declarations.
F2.2 owns additivity in `D` and `a`, the commuting criterion, the order-zero equivalence,
monotonicity, sums at a common order, the composition bound and localization/sheafification.
This elementary interface has no characteristic, smoothness or projectivity hypothesis.

The required F2.2 principal-parts interface is all-order: with
`I = ker(A ⊗_k A → A)`, use `P^m_A/k(M) = ((A ⊗_k A)/I^(m+1)) ⊗_(A,right) M`,
with the left `A`-action and universal jet `s ↦ 1 ⊗ s`. Prove the bijection between
`A`-linear maps `P^m_A/k(M) → N` and operators of order at most `m`, natural in the
coefficient modules. Supply order-transition quotients and the composition maps
`P^(m+n)(M) → P^m(P^n(M))` carrying the universal jet to the iterated jet.
Prove their unit, associativity and order-transition compatibilities, restriction to opens,
and compatibility with localization and the sheafified universal property on schemes.
Every individual finite-order operator extends uniquely to localized coefficient modules;
an identification of the localized Hom module with all Hom maps after localization requires
finite presentation of `P^m_A/k(M)`. No such finiteness is needed for the order predicate or
its universal factorization. F2.2 retains Lie–Rinehart PBW under projectivity; identifying
the enveloping algebra with ordinary differential operators additionally uses smoothness
and characteristic zero.
(Source: EGA IV₄, §§16.7–16.8, especially (16.8.1)–(16.8.4), Proposition (16.8.8),
Proposition (16.8.9) and its composition map (16.8.9.2), printed pp. 39–44.)
*Needs:* FormalConnectionsOpers F2.2's algebraic operator and principal-parts foundation;
Mathlib modules, tensor products and localization.

**Checks for shared algebraic operators and principal parts.**

- Multiplication by `a ∈ A` has order zero; every commutator of two multiplication maps vanishes.
- On `ℂ[z]`, `[d/dz, z]` is the identity, and `d/dz` has order one but not zero.
- The zero map has order zero and every higher order, including on the zero module; order bounds
  express “at most”, rather than exact order.
- For `A = k[z]`, `P^m_A/k(A) = A[t]/(t^(m+1))`, with jet `f(z) ↦ f(z+t)`;
  the composition map sends `t` to `t₁+t₂`, with `t₁^(m+1)=t₂^(n+1)=0`.
- Over `𝔽_p[z]`, the coefficient of `t^p` in `f(z+t)` is an operator of order `p`
  taking `z^p` to `1`, although the `p`-fold ordinary derivative vanishes. The universal
  factorization requires no division by `p!`.

Define `DifferentialOperatorAnalytification`: for coherent `F`, `G` on `X` of finite type over `ℂ`
and an algebraic differential operator `D` of order at most `m`, compare the analytification
of the supplied algebraic `P^m(F)` with the analytic principal-parts module, constructed
locally from the analytic diagonal ideal. The comparison carries universal jets,
order transitions and composition maps to their analytic counterparts and commutes with
open restriction and pullback of the principal-parts diagrams along scheme maps.
Analytify the `O`-linear universal factorization to obtain the analytic operator
`D^an : F^an → G^an`, independent of the chosen `m`.
The API is `DifferentialOperatorAnalytification.orderZero` (order-zero operators go to the
analytification of `O`-linear maps), `DifferentialOperatorAnalytification.composition`
(`(D ∘ E)^an = D^an ∘ E^an`, orders adding) and `DifferentialOperatorAnalytification.deRham` (the
analytification of the algebraic exterior derivative is the holomorphic one) (Deligne 1970, II.6.6,
printed pp. 100–101, stated there for proper `X`; the construction through principal parts is
local). This analytic adapter and `boundedOperatorHyperGaga` belong here; F2.4's connection
applications use the adapter without the proper comparison theorem.
*Needs:* FormalConnectionsOpers F2.2's all-order principal parts as specified above;
`CoherentAnalytification`; `CoherentAnalyticIdeal` (the diagonal ideal);
`coherentPullbackOperations`.

**Checks.**

- `DifferentialOperatorAnalytification.scalar`: multiplication by an algebraic function `f`
  analytifies to multiplication by `f^an`.
- `DifferentialOperatorAnalytification.derivative`: `d/dz` on `ℂ[z]` analytifies to the holomorphic
  derivative on `O_ℂ`, with `exp(z) ↦ exp(z)`.
- `DifferentialOperatorAnalytification.nonLinearOverO`: for `D = d/dz`, `D(z · 1) − z D(1) = 1`, so `D`
  has order exactly `1` and is not `O`-linear; a construction that analytified it as an `O`-linear map
  fails.

Prove `boundedOperatorHyperGaga`: for a proper scheme `X` over `ℂ` and a bounded complex `K` of
coherent `O_X`-modules whose differentials are `ℂ`-linear differential operators, the canonical map
`RΓ(X, K) → RΓ(X^an, K^an)` is a quasi-isomorphism; more generally, for a proper morphism `f : X → S`
and a bounded complex of coherent modules with `f⁻¹O_S`-linear differential operators as
differentials, `(Rf_*K)^an → Rf^an_* K^an` is a quasi-isomorphism (on cohomology sheaves after
analytification of coherent hypercohomology sheaves). Compatible short exact sequences of such
complexes give compatible triangles and connecting maps. Induct on the length of `K` with the
brutal truncation triangles `σ^{≥p+1}K → σ^{≥p}K → K^p[−p] →`, which analytification respects
because the analytified operators are the differentials of `K^an`; the terms are compared by
`properSchemeGagaPushforward`, and the five lemma closes the induction (equivalently, the first pages
of the spectral sequences of the stupid filtration agree and boundedness gives convergence)
(Deligne 1970, II.6.5–6.6 and proof, printed pp. 100–101, for the absolute statement; the relative
statement is proved here by the same induction, with `properSchemeGagaPushforward` for the terms;
Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106,
Proposition 3.6, pp. 18–19, applies it to logarithmic de Rham complexes). *Needs:* `DifferentialOperatorAnalytification`; `HigherImageComparison`;
§C1.9 `properSchemeGagaPushforward`; SchemeAndStackFoundations
§2.1 `Sheaf.higherDirectImage` (higher direct images); Mathlib `DerivedCategory` (its triangulated
structure, for the truncation triangles).

Define `SmallSingularCochains T A` for a topological space `T` and an abelian group `A` (Sella's
construction). A nesting assigns an open set to every finite sequence of points of `T`, the whole
space to the empty sequence and a neighbourhood of `x₁` to `(x₁, …, x_n)` whenever `x₁` lies in the
set assigned to `(x₂, …, x_n)`; the set of a sequence lies in the set of every sequence obtained from
it by a nondecreasing reindexing, in particular of every subsequence. A
singular simplex is small for the nesting when, for every chain of faces `σ₁ ⊂ ⋯ ⊂ σ_m` of it, the
face `σ₁` lies in the set assigned to the images of the barycentres of `σ₁, …, σ_m`. Small
`A`-valued cochains, taken in the directed colimit over refinements of nestings, form a complex of
flasque sheaves on `T` with degree-zero augmentation from the constant sheaf `A`. Use Tau Ceti's singular cochain complex as the
complex of all cochains. On Hausdorff CW representatives consume CharacteristicClasses
C1.2 item 2's early locally acyclic small-chain sheaf resolution, with its constant-sheaf
augmentation and small-chain restriction maps. Construct the nesting-small extension to
general semilocally contractible spaces here. On the common CW domain identify the two
augmented resolutions in the derived category by their quasi-isomorphisms from the same
constant sheaf. Prove that the comparison commutes with the maps from ordinary singular
cochains, using common small-chain refinements and the subdivision homotopies. Retain
restriction, coefficient naturality and homotopy coherence; thus the canonical
sheaf–singular map agrees with the supplier's map on that domain. Its Čech-refinement
and CW-type transport theorems remain in CharacteristicClasses C1.2. The API is
`SmallSingularCochains.augmentation` (on a semilocally contractible `T`, the degree-zero cocycles
are the locally constant `A`-valued functions; on a totally path-disconnected space every function
is a cocycle), `SmallSingularCochains.restriction_surjective` (every restriction map of the cochain
sheaves is surjective, so the sheaves are flasque) and
`SmallSingularCochains.small_inclusion_equivalence` (for each nesting on an open, the small chains
include into all singular chains by a chain homotopy equivalence, built from subdivision and prism
homotopies corrected on faces; in the colimit over nestings the map from all singular cochains to
the small ones is a quasi-isomorphism) (Sella, *Comparison of sheaf cohomology and singular
cohomology*, arXiv:1602.06674v3, the definition of nestings, p. 6, Lemma 0.1, pp. 2–4, and
Steps 1–3, pp. 7–19). *Needs:* CharacteristicClasses C1.2 item 2's early locally acyclic
small-chain sheaf resolution on Hausdorff CW representatives; Tau Ceti `TopCat.singularCochainComplex` and
`TauCeti.smallSingularChainHomotopyEquiv` (the open-cover construction);
TauCetiRoadmap.AlgebraicTopology (Stage 6, cochain products); Mathlib `AlgebraicTopology.singularChainComplexFunctor`.

**Checks.**

- `SmallSingularCochains.point`: on a point the cohomology of global sections is `A` in degree `0`
  and zero in positive degrees.
- `SmallSingularCochains.empty`: on the empty space every cochain group is zero.
- On the CW circle with coefficients `ℤ`, the shared resolution and the nesting extension
  identify the same degree-one generator evaluated as `1` on the positive loop; restrictions
  to open arcs and coefficient reduction `ℤ → ℤ/n` commute with this identification.
- `SmallSingularCochains.nonHausdorff`: on Sella's five-point locally contractible non-Hausdorff
  space, the map from singular `1`-cochains to global sections of the sheafification of the presheaf
  of all singular `1`-cochains is not surjective, so an argument through the naive sheafification
  breaks down there, while the nesting construction still has surjective restriction maps (Sella,
  Example 0.3, p. 5).

Prove `sheafSingularComparison`: for a space `T` in which every neighbourhood of every point contains a
smaller neighbourhood whose inclusion is null-homotopic (semilocal contractibility, which is Mathlib's
`LocallyContractibleSpace`; manifolds satisfy it through coordinate balls, and C6.0 supplies it
for finite-type complex schemes), and for every abelian group `A`, the canonical map
`Sheaf.H(T, A) → H^q_sing(T, A)` is an isomorphism in every degree, natural in `T` and `A`.
`Suggested.lean` states the existence of an additive isomorphism; the canonical map and its
naturality are specified here. No Hausdorff assumption on `T` and no finiteness assumption on `A`
is made. The small cochains are a
flasque resolution of the constant sheaf (`TauCeti.Topology.subsingleton_H_succ_of_isFlasque` makes
it acyclic), and their global sections are quasi-isomorphic to the singular cochains (Sella, the
Theorem, p. 2, and Lemma 0.1, pp. 2–4; the subdivision construction and proof, pp. 6–19). This is additive;
compatibility with cup products is `multiplicativePeriodInterface`. *Needs:*
`SmallSingularCochains`; Tau Ceti `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`; Mathlib
`Sheaf.H`, `LocallyContractibleSpace`; TauCetiRoadmap.AlgebraicTopology (Stage 6).

Prove `properDeRhamBetti` (Grothendieck): for a smooth proper scheme `X` over `ℂ` and every `q ≥ 0`
there is a canonical `ℂ`-linear isomorphism `H^q_dR(X/ℂ) ≅ H^q_sing(X^an, ℂ)`, natural for morphisms of
smooth proper schemes. It is the composite of `boundedOperatorHyperGaga` for `Ω^•_X` (bounded by
`AlgebraicDeRham.bounded`, since `X` is of finite type; its analytification is `Ω^•_{X^an}` by local
coordinates), `holomorphicPoincare` and
`sheafSingularComparison`. Projectivity is not assumed (Grothendieck 1966, Theorem 1′ and the remark
on complete schemes, printed p. 96); smoothness is, since the ordinary de Rham complex of a singular
scheme does not compute Betti cohomology in general. *Needs:* `AlgebraicDeRham`; `HolomorphicDeRham`;
`boundedOperatorHyperGaga`; `holomorphicPoincare`; `sheafSingularComparison`.

Prove `multiplicativePeriodInterface`: the isomorphism of `properDeRhamBetti` is compatible with
pullback, carries the wedge product to the cup product (through DifferentialGeometry's de Rham theorem
and its multiplicativity, and AlgebraicTopology's cup product), and carries the de Rham trace in top
degree, `∫_{X^an}` with the complex orientation, to the manifold trace. Keep `H^q_sing(X^an, ℤ)`, its
torsion subgroup and its image in `H^q_sing(X^an, ℂ)` distinct: the image of integral cohomology is a
lattice of full rank in the real subspace, and the coefficient-change map `H_ℤ ⊗ ℂ → H_ℂ` is the named
comparison; finite generation of `H_ℤ` uses that compact manifolds are of finite CW type. The period
of the positively oriented loop on `G_m` against `dz/z` is `2πi`, the integral
`circleIntegral.integral_sub_inv_of_mem_ball` (Grothendieck 1966, Theorem 1, printed p. 95, for the
comparison on the affine `G_m`; the product, trace and period compatibilities are assembled here from
the suppliers named below). *Needs:* `properDeRhamBetti`; TauCetiRoadmap.DifferentialGeometry
(Layers 5, 6, 8 and 9); TauCetiRoadmap.AlgebraicTopology (Stages 6 and 8).

### C5.2 Families, Ehresmann and the Gauss–Manin connection

Use the ordinary connection carrier `Crystalline.Connection` from CrystallineCohomology CR.1,
sheafified as `Crystalline.Connection E` for a smooth scheme `X` over a field `k` of characteristic zero and a
coherent `O_X`-module `E`: a `k`-linear sheaf map `∇ : E → Ω¹_X ⊗ E` with
`∇(a s) = da ⊗ s + a ∇s`. It extends uniquely to `∇ : Ω^p ⊗ E → Ω^{p+1} ⊗ E` with the graded Leibniz rule;
its curvature `∇ ∘ ∇ : E → Ω² ⊗ E` is `O_X`-linear, and `∇` is integrable (flat) when the curvature
vanishes, equivalently when `(Ω^• ⊗ E, ∇)` is a complex — the de Rham complex of `(E, ∇)`. The API is
`Crystalline.Connection.leibniz` (the displayed rule), `Crystalline.Connection.tensor` (`∇_E ⊗ 1 + 1 ⊗ ∇_F`
on `E ⊗ F`, and the dual connection when `E` is finite locally free) and `Crystalline.Connection.curvature` (zero curvature
iff the extended `∇` squares to zero; the trivial connection is `(A, d)`) (Deligne 1970, I.2.3–2.15, printed pp. 6–11, for holomorphic bundles, and I.2.20.3–2.21, pp. 13–14,
for smooth schemes). On complex manifolds use its analytic sheafification on coherent
holomorphic modules; analytification transports algebraic connections to this carrier.
Its finite locally free specialization is identified with K4's holomorphic bundle connections
by `holomorphicConnectionDictionary` below. For a holomorphic submersion `f : T → S`, use
the same sheafified carrier with
relative holomorphic forms `Ω¹_{T/S}`, the relative exterior derivative and
`f⁻¹O_S`-linearity. On an affine `Spec A`, use the supplier's ordinary `Ω¹_{A/k}` case and
its tensor order `E ⊗ Ω¹`; tensor symmetry identifies this with `Ω¹ ⊗ E` in the
geometric formula. Additivity and the Leibniz rule imply `k`-linearity because `d` kills
base scalars. Extension, curvature, tensor and dual connections are the CR.1 operations,
using `DeRham.complex` from DerivedDeRhamCohomology Layer 2. Sheafify by localization
and analytify via `DifferentialOperatorAnalytification`; prove that tensor symmetry and
restriction identify the coefficient complexes and their curvature with those of the shared
carrier. *Needs:* CrystallineCohomology CR.1, “Modules with integrable connection and their
de Rham complexes” (`Crystalline.Connection`, `.extend`, `.curvature`, `.tensor`, `.hom`,
`.baseChange`); `AlgebraicDeRham`; `coherentOperations`; `DifferentialOperatorAnalytification`;
Mathlib `Derivation`, `KaehlerDifferential`.

**Checks.**

- `Crystalline.Connection.trivial`: on `O_X` the exterior derivative `d` is an integrable connection.
- `Crystalline.Connection.point`: on `Spec k` every connection is zero, with zero curvature.
- `Crystalline.Connection.rankOneTorus`: on `O_{G_m}`, `∇ = d + a dz/z` is integrable for every
  `a ∈ ℂ`, its horizontal sections on `ℂ*` are the branches of `z^{−a}`, and its monodromy along the
  positive loop is `exp(−2πia)`.

**Holomorphic connection carrier comparison — `holomorphicConnectionDictionary`.** On a
finite-dimensional complex manifold `M`, identify the analytic sheafification of CR.1's
ordinary connection carrier on finite locally free `O_M`-modules with ComplexKahlerGeometry
K4's holomorphic bundle-connection carrier. Apply `holomorphicBundleDictionary` on each
clopen rank stratum and their common refinements for source and target. In a holomorphic
frame both operators are `s ↦ ds + A s`; the CR.1 coefficient-first output is moved to
`Ω¹ ⊗ E` by tensor symmetry. Equality on frames and the gauge law
`A′ = g⁻¹Ag + g⁻¹dg` identify the operators, not just their underlying bundles.
Prove compatibility with curvature, pullback, tensor symmetry, tensor, dual and Hom
connections, and identify the kernels of the connection maps and their inclusions as the
same horizontal sheaves. The morphisms are all horizontal `O_M`-linear maps, including
noninvertible maps between different ranks. The connection comparison also applies to
nonflat connections; flatness is preserved and reflected. The coherent-module extension,
algebraic analytification and relative connection construction remain the sheafifications
above (Deligne 1970, I.2.3–2.15, printed pp. 6–11, and I.2.17–2.19, pp. 12–13).
*Needs:* `holomorphicBundleDictionary`; CrystallineCohomology CR.1's ordinary connection
operations; ComplexKahlerGeometry K4's holomorphic connections, gauge formulas and absolute
flat correspondence.

For FormalConnectionsOpers F2.4's smooth curve specialization, the algebraic-to-holomorphic
comparison is the composite of C−1.1's analytification, C0.4's coherent pullback,
C5.1's differential-operator adapter and this dictionary. It uses CR.1's shared algebraic
connection operations. Restriction, scheme pullback, curvature and horizontal sections
commute with this composite by the same local frame equations; its monodromy is the
K4 transport specified in `analyticFlatConnectionLocalSystem`. Only these foundational
prefixes enter the curve comparison, independently of proper GAGA.

**Checks.**

- The trivial bundle with `d` gives the same operator and horizontal sheaf under both
  carriers; this includes rank zero and ranks one and two on `ℂ ⊔ ℂ`.
- On the trivial line over `ℂ²`, `d + z dw` has curvature `dz ∧ dw` on both carriers;
  the carrier comparison does not assume integrability.
- Changing a line frame by a nowhere zero holomorphic `g` changes `A` to
  `A + g⁻¹dg` in both carriers, and takes the same horizontal sections to their new coordinates.
- F2.4's left gauge `h` is the frame change `g = h⁻¹`; substituting in the same matrix
  formula gives `A′ = Ad(h)A − (dh)h⁻¹` and the same horizontal sheaf.

Prove `analyticFlatConnectionLocalSystem`: let `f : T → S` be a holomorphic submersion of
complex manifolds and `(E, ∇)` a finite locally free holomorphic module with integrable relative
connection on the shared carrier above. Its horizontal sheaf `V = ker ∇` is an `f⁻¹O_S`-module
locally isomorphic, on a product chart, to the inverse image of a finite locally free module on
an open of `S`, with the same local rank as `E`. The canonical evaluation map
`O_T ⊗_{f⁻¹O_S} V → E`, `a ⊗ v ↦ av`, is an isomorphism carrying the connection
`d_{T/S} ⊗ 1` to `∇`. Conversely, for an `f⁻¹O_S`-module `V` locally of this form,
the unit `V → (O_T ⊗_{f⁻¹O_S} V)^{d_{T/S}⊗1}` is an isomorphism. These maps give
quasi-inverse functors between such relative local systems and finite locally free holomorphic
modules with integrable relative connection; prove naturality for horizontal morphisms,
compatibility with tensor products and duals, and pullback along diagrams of holomorphic
submersions with extension of base scalars. For `S` a point this is the equivalence of
categories with finite-dimensional complex local systems, preserving the locally constant
rank function of C0.3. Under `holomorphicConnectionDictionary`, its core is K4's absolute
groupoid equivalence: tensor symmetry identifies `O_M ⊗_ℂ V` with K4's `V ⊗_ℂ O_M`,
`d ⊗ 1` with `1 ⊗ d` followed by the forms-first symmetry, the unit `v ↦ 1 ⊗ v`
with `v ↦ v ⊗ 1`, and evaluation with K4's `v ⊗ a ↦ av`. The stalk comparison sends
a horizontal germ to its value, and horizontal transport is K4's source-to-target transport
`T_γ`; in a frame `e` its monodromy is `e⁻¹T_γe`. Prove these map identities and extend
the absolute correspondence to all horizontal morphisms; the relative construction retains
holomorphic parameters and uses that same specialization.

Construct the local horizontal frames with holomorphic parameters: for a holomorphic matrix
`A(z,t)` and holomorphic initial matrix `G₀(t)`, solve `∂G/∂z = −A(z,t)G`,
`G(0,t) = G₀(t)`, uniquely on a smaller product polydisc; with invertible initial matrix the
solution is invertible after shrinking. Starting with the identity on the zero section, extend
a frame successively in the fibre variables, using the preceding frame as initial value at each
step. Integrability and uniqueness make each extension horizontal in the preceding variables. The frames identify evaluation with
multiplication in a free module; horizontal morphisms have coefficients pulled back from the base,
which proves the functorial assertions (Deligne 1970, I.2.22–2.23(iii) and proof, printed
pp. 14–19, especially the Cauchy problem with parameters and induction on pp. 17–18).
*Needs:* `holomorphicConnectionDictionary`; `HolomorphicDeRham`; ComplexKahlerGeometry K4's
absolute flat correspondence and sheaf/stalk/monodromy comparison; CrystallineCohomology CR.1's
shared connection operations and their holomorphic/relative sheafification above.

**Checks.**

- Rank zero gives the zero horizontal sheaf and the zero evaluation isomorphism; for
  `(O_T^r, d_{T/S})` the horizontal sheaf is `(f⁻¹O_S)^r` and evaluation is the usual free-module
  isomorphism.
- On a disc, `d + dz` has the nowhere vanishing horizontal frame `exp(−z)`.
  The scalar radial operator gives `K(∇1) = K(dz) = z`, whereas `(id − ev₀)(1) = 0`;
  the coefficient contraction is obtained by conjugating through the horizontal frame.
- For `T = D_z × D_t → D_t`, `d_z + t dz` has frame `exp(−tz)`, holomorphic in both variables,
  normalized to one at `z = 0`; its horizontal sheaf is the inverse image of `O_{D_t}`.
- Gluing local frames `z^{−a}` for `d + a dz/z` on `ℂ*` gives monodromy
  `exp(−2πia) = localMonodromy a` along the positive loop, matching K4's transport and C5.6.
- Over a point base, the horizontal projection `(O_M²,d) → (O_M,d)`, `(s₁,s₂) ↦ s₁`,
  induces the constant local-system projection `ℂ² → ℂ`. Evaluation and the units commute
  with this noninvertible morphism under the K4 carrier comparison.

Prove `relativePoincare`: for a holomorphic submersion `f : T → S` of complex manifolds, the relative
holomorphic de Rham complex `Ω^•_{T/S}` (with `f⁻¹O_S`-linear differential) is a resolution of
`f⁻¹O_S`; with coefficients in a finite locally free holomorphic module with integrable relative
connection it resolves its horizontal sheaf `V`. The scalar degree-zero kernel is `f⁻¹O_S`.
Apply the radial homotopy in the fibre coordinates of a local product chart for scalar forms;
the parameter integral keeps holomorphic dependence on the base. For coefficients, first use
`analyticFlatConnectionLocalSystem` to identify `(E, ∇)` with
`(O_T ⊗_{f⁻¹O_S} V, d_{T/S} ⊗ 1)` and transport the scalar contraction through its evaluation
isomorphism (Deligne 1970, I.2.23(ii)–(iii) and proof, printed pp. 15–19).
*Needs:* `HolomorphicDeRham`; `holomorphicPoincare`; `analyticFlatConnectionLocalSystem`.

Prove `ehresmannFibration`, the holomorphic/analytification adapter to
SmoothBundlesConnections B1.5: for a proper surjective holomorphic submersion
`f : T → S` of finite-dimensional Hausdorff second-countable complex manifolds without
boundary, use ComplexManifolds Milestone 1's restriction-of-scalars structures and
functorial map/derivative comparison to prove `Manifold.IsSubmersion I J ∞ f`.
The native continuous map has the same properness and surjectivity. Consume B1.5's
regular-fibre manifold carrier and smooth `FiberBundle` atlas, componentwise on `S`:
for every `s`, a `Trivialization` over an open `V` represents an actual diffeomorphism
`f⁻¹(V) ≅ V × f⁻¹(s)` with first projection `f`. Compare the total-space identification
with the original `T`; both chart maps are smooth for the underlying real models.
For a proper smooth surjective morphism of smooth separated finite-type complex schemes,
prove these hypotheses for its analytification using §C−1.1's properness and local analytic
submersion comparisons.

For a holomorphic base map `g : S′ → S` between these manifolds, identify the native
pullback bundle with `T ×_S S′ → S′` on its submersion fibre-product manifold. Pull back
each supplied chart, retaining the projection square and fibre map; prove the identity and
composition comparisons. The smooth local trivializations are imported from B1.5, not
chosen independently after base change. The general proper-submersion theorem and horizontal
lift infrastructure have their single owner in that supplier; this adapter supplies
`relativeBettiLocalSystem` (tom Dieck, *Differential Manifolds*, January 2009,
Theorems 2.2.1 and 2.2.3 and Corollary 2.2.4, pp. 52–53; Deligne 1970, I.2.24–2.25, p. 19).
*Needs:* SmoothBundlesConnections B1.5's foundational submersion/trivialization leaf;
ComplexManifolds Milestone 1's realification and atlas-transport maps;
§C−1.1; Mathlib `Manifold.IsSubmersion`, `FiberBundle`, `Trivialization`.

**Checks.**

- `P¹ × S → S` uses the product smooth chart, and its pullback to `S′` is the same product
  chart with the base coordinate changed by `g`.
- Over two disjoint base components, the families with fibres `P¹` and an elliptic curve have
  componentwise bundle models; both fibres have complex dimension one, but they are not
  diffeomorphic, so no single fixed fibre is asserted for both components.
- For `z ↦ zⁿ` on `ℂ*`, `n ≥ 1`, the proper holomorphic submersion has `n`-point fibres;
  its smooth trivializations and those of its pullback give the same fibre permutations.
- For the map `z ↦ iz` on `ℂ`, the underlying real derivative is the matrix
  `[[0,−1],[1,0]]`; realification, composition and restriction give the supplier's same map.

Prove `relativeBettiLocalSystem`: for a proper smooth holomorphic map `f : T → S` of complex manifolds
(proper surjective submersion) and an abelian group `A`, `R^q f_* A` is a locally constant sheaf with
stalk `H^q_sing(f⁻¹(s), A)` at `s`; for `A = ℂ` (or `ℚ`) it has finite rank, and for `A = ℤ` finitely
generated stalks. Local triviality comes from `ehresmannFibration`; on a trivialized `V × F` with `V`
contractible, `R^q f_*A|_V` is the constant sheaf `H^q(F, A)` by `sheafSingularComparison` and homotopy
invariance; finiteness uses that the compact fibre has finite CW type (Deligne 1970, I.2.24–2.25,
printed p. 19, for the stalks of `R^q f_*`; tom Dieck, Corollary 2.2.4, p. 53). *Needs:* `ehresmannFibration`;
`sheafSingularComparison`; TauCetiRoadmap.AlgebraicTopology (Stage 8, finite CW type).

Prove `coherentFlatConnection_locallyFree`: a coherent module with an integrable ordinary
connection on a smooth scheme over a characteristic-zero field is finite locally free.
Over `ℂ`, first establish the horizontal-frame equivalence on arbitrary coherent analytic
coefficients: locally the module is the structure sheaf tensored with a finite-dimensional
horizontal vector space (Deligne 1970, I.2.22–2.23(iii), pp. 14–19, with the coherent-presentation
argument in the proof). This argument does not assume freeness or use the finite locally free equivalence
`analyticFlatConnectionLocalSystem`. Analytify the coherent
algebraic module and connection, then descend freeness along C0's faithfully flat analytic stalk
maps, using `Module.Flat.of_flat_tensorProduct` and `Module.free_of_flat_of_isLocalRing`.
Over any characteristic-zero field, work on affine charts and descend the smooth algebra,
finite presentation, connection and integrability to a finitely generated subfield of `k` over `ℚ`;
embed that subfield in `ℂ`, apply the complex case, and use faithful scalar extension and pullback
to `k`. Include this descent of finite connection data in the target; smoothness descends
with the finite presentation. Sheafify `Crystalline.Connection` on coherent coefficients before
constructing
`GaussManin`; apply this freeness theorem only after constructing its integrable connection.
*Needs:* CrystallineCohomology CR.1 `Crystalline.Connection`; `CoherentAnalytification`;
`coherentPullbackOperations`; `completedAnalyticStalkComparison.flat`; Mathlib
`Module.Flat.of_flat_tensorProduct`, `Module.free_of_flat_of_isLocalRing`;
SchemeAndStackFoundations Layer 0 (localization and affine gluing).

**Checks.**

- The zero module with its zero connection is locally free of rank zero.
- `(O_X^r,d)` is locally free of rank `r`, including disconnected rank strata.
- On `A¹` in characteristic zero, `O/(t)` cannot carry a connection: applying Leibniz to
  `t·1 = 0` would give `dt ⊗ 1 = 0`. In characteristic `p`, `O/(t^p)` does carry the induced
  integrable connection and is not locally free, so the characteristic hypothesis is necessary.

Define `GaussManin f` for a smooth proper morphism `f : X → S` of smooth schemes over a field `k` of
characteristic zero: filter the absolute de Rham complex `Ω^•_{X/k}` by the subcomplexes generated by
`p` forms pulled back from `S`; smoothness makes the graded pieces `f^*Ω^p_S ⊗ Ω^•_{X/S}[−p]`. The
connecting map of the two-step quotient is
`∇ : H^q_dR(X/S) → Ω¹_S ⊗ H^q_dR(X/S)` (with `H^q_dR(X/S) = R^q f_*Ω^•_{X/S}`, coherent because `f` is proper, then finite locally free by
`coherentFlatConnection_locallyFree` after constructing the integrable connection below). It
is a connection, and it is integrable: the first page of the spectral sequence of the filtration is
`Ω^p_S ⊗ H^q_dR(X/S)` with differential the extension of `∇`, and its square is zero. The API is
`GaussManin.connection` (the connecting-map definition), `GaussManin.integrable` (zero curvature) and
`GaussManin.horizontalComparison` (over `ℂ`, the analytic horizontal sections of
`(H^q_dR(X/S)^an, ∇^an)` form the local system `R^q f^an_* ℂ`) (Katz–Oda, *On the differentiation of
de Rham cohomology classes with respect to parameters*, J. Math. Kyoto Univ. 8 (1968), §1,
pp. 199–201, §2, Theorem 1 and proof, pp. 201–204, and §3, sequence (13), pp. 204–205, for the
filtration construction and integrability; Deligne 1970, II.7.7, printed p. 117, for
`horizontalComparison`, and II.7.8, pp. 117–118). *Needs:* `AlgebraicDeRham`; `Crystalline.Connection`; `coherentFlatConnection_locallyFree`;
`relativePoincare`; `analyticFlatConnectionLocalSystem`; `relativeBettiLocalSystem`;
`boundedOperatorHyperGaga`; SchemeAndStackFoundations Layer 2.

**Checks.**

- `GaussManin.constantFamily`: for `X = F × S`, `H^q_dR(X/S) = H^q_dR(F) ⊗ O_S` and `∇` differentiates
  only the `O_S`-coefficients.
- `GaussManin.degreeZero`: for a family with geometrically connected fibres, `H⁰_dR(X/S) = O_S` with
  `∇ = d`.
- `GaussManin.leibniz`: `∇(a v) = da ⊗ v + a ∇v`; an `O_S`-linear map fails this already for
  `a = t` on `S = A¹`.

Prove `relativeDeRhamBetti`: for a smooth proper morphism `f : X → S` of smooth schemes over `ℂ`, the
canonical map `(R^q f_*Ω^•_{X/S})^an → R^q f^an_* ℂ ⊗_ℂ O_{S^an}` is an isomorphism of locally free
holomorphic modules carrying `∇^an` to the connection `1 ⊗ d`, followed by tensor symmetry
into `Ω¹_{S^an} ⊗ (R^q f^an_* ℂ ⊗_ℂ O_{S^an})`: on a locally constant section `v`,
`v ⊗ a ↦ da ⊗ (v ⊗ 1)`. Its horizontal sections are
`R^q f^an_* ℂ`, compatible with base change and with the fibrewise `properDeRhamBetti`. No projectivity
is assumed. Compare the relative operator complexes by `boundedOperatorHyperGaga` over each
quasi-compact open `V ⊆ S`, over which `Ω^•_{X/S}` is bounded (`f` is quasi-compact and `Ω¹_{X/S}` is
finite locally free, so its rank on `f⁻¹(V)` is bounded), resolve
`f^{an,−1}O_{S^an}` by `relativePoincare`, and use `relativeBettiLocalSystem` with the projection
formula; identify the horizontal sheaf and its evaluation map by
`analyticFlatConnectionLocalSystem` (Deligne 1970, I.2.27–2.29, printed pp. 19–21, and II.7.7, p. 117; Deligne, *Théorème de
Lefschetz et critères de dégénérescence de suites spectrales*, Publ. Math. IHÉS 35 (1968), Theorem 5.5,
printed pp. 123–125, for local freeness). *Needs:* `GaussManin`;
`relativePoincare`; `analyticFlatConnectionLocalSystem`; `relativeBettiLocalSystem`;
`boundedOperatorHyperGaga`.

**Checks for `relativeDeRhamBetti`.**

- For the identity family on `A¹_ℂ` in degree zero, the section `1 ⊗ t` has derivative
  `dt ⊗ (1 ⊗ 1)`, with the derivative acting on the holomorphic-function factor.
- For `F × S → S`, a locally constant Betti class `v` gives the horizontal section
  `v ⊗ 1`; the connection sends `v ⊗ a` to `da ⊗ (v ⊗ 1)`.
- On a point base the connection is zero and the comparison is `properDeRhamBetti`;
  tensor symmetry identifies its unit and evaluation with K4's absolute correspondence.

**Artin-base relative comparison — `artinDeRhamBetti`.** Let `A` be a finite-dimensional
commutative local `ℂ`-algebra with maximal ideal `m` and specified residue identification `A/m ≅ ℂ`,
and let `f : X → Spec A` be smooth and proper, with special fibre `X₀`. Sheafify the shared
`DeRham.complex A B` on affine opens of `X` to form `Ω^•_{X/A}`; analytify its terms and relative
operators to obtain `Ω^•_{X^an/(Spec A)^an}` on the nilpotent-retaining analytic ringed space.
Its underlying topological space is `X₀^an`, whereas its structure sheaf and relative forms retain
`A`. Prove that the canonical augmentation from the constant sheaf `A` is a quasi-isomorphism,
and that it gives canonical `A`-linear isomorphisms, natural for morphisms over `A` and compatible
with extension of these Artin coefficient algebras,

```text
A_const → Ω^•_{X^an/(Spec A)^an},
H^n_dR(X/A) ≅ H^n_sing(X₀^an, A) ≅ H^n_sing(X₀^an, ℂ) ⊗_ℂ A.
```

In particular `H^n_dR(X/A)` is free of rank `dim_ℂ H^n_sing(X₀^an, ℂ)` and
`length_A H^n_dR(X/A) = length_A(A) · dim_ℂ H^n_sing(X₀^an, ℂ)`.
No freeness or base-change hypothesis on the individual Hodge cohomology modules is used.
Smoothness makes the relative forms flat over `A`: analytified étale coordinates identify them
locally with `A ⊗_ℂ Ω^•` on a polydisc. For the finite `m`-adic filtration,
`gr_m^i Ω^•_{X^an/(Spec A)^an} ≅ (m^i/m^{i+1}) ⊗_ℂ Ω^•_{X₀^an/ℂ}`.
The associated graded augmentation is a quasi-isomorphism by `holomorphicPoincare`; induction
through this finite filtration proves the augmentation over `A`. Apply
`boundedOperatorHyperGaga` to the bounded relative complex (properness bounds the relative
dimension), then `sheafSingularComparison` with coefficients in the additive group of `A`.
Finite-dimensional coefficient extension gives the final tensor isomorphism and the length
formula (Deligne 1968, Lemma (5.5.3) and equation (5.5.4), printed p. 124).
*Needs:* DerivedDeRhamCohomology Layer 2 (`DeRham.complex`, `DeRham.complexMap`);
§§C−1.1–C−1.2 and C1.9 (`ComplexAnalyticSpace`,
`complexSchemeAnalytification`, its nilpotent and étale comparisons, `properSchemeGagaPushforward`);
`DifferentialOperatorAnalytification`; `boundedOperatorHyperGaga`; `holomorphicPoincare`;
`sheafSingularComparison`; AlgebraicTopology Stage 8 (finite CW type of the compact special fibre);
Mathlib `Module.length`.

**Checks.**

- For `A = ℂ`, the maps recover `holomorphicPoincare` and `properDeRhamBetti`.
- For `A = ℂ[ε]/(ε²)` and `X = P¹_A`, degrees zero and two are each free rank-one `A`-modules
  of length two, and degree one is zero. Reduction sends these modules to the corresponding
  one-dimensional `ℂ`-cohomology; discarding `ε` before comparison loses their length.
- For `X = Spec A` over itself, the relative complex is `A` in degree zero and zero otherwise;
  its augmentation is the identity. For any local coefficient map `A → B` of the stated type,
  this comparison becomes the identity on `B` after tensoring with `B`.

### Examples (C5.1–C5.2)

- `H¹_dR(G_m)` is one-dimensional, spanned by `dz/z`; its period on the positive loop is `2πi`, so the
  rational Betti lattice is `ℚ · (2πi)⁻¹[dz/z]` under the comparison.
- For the product of a compact Riemann surface of genus `g` with a smooth base, `R¹f_*ℤ` has stalks
  `ℤ^{2g}` and trivial monodromy; `R¹f_*ℂ` has rank `2g` (a complex dimension, not a generation count).
- For a constant elliptic family `E × S → S`, a fixed fibre class times a holomorphic coefficient is
  carried to the corresponding Betti class times that coefficient, and `∇` differentiates the
  coefficient.
- A singular proper scheme (the nodal cubic) is not assigned the ordinary de Rham comparison.

### C5.3 Geometric Hodge theory

Use ComplexKahlerGeometry K5a–K5b.1's bundle distributions, Sobolev spaces,
local estimates, compact harmonic projections and Green operators on their native
geometric L² carriers. Prove `compactEllipticHodge` as the extension of K5a's nonnegative
compact spectral package to a formally self-adjoint second-order operator `P` with
principal symbol `|ξ|² id` on a Hermitian bundle over a compact boundaryless manifold.
The Hodge Laplacian is its supplied nonnegative instance. In these same Sobolev norms:
(1) there are operator-dependent `c > 0`, `λ ≥ 0` with
`c ‖u‖²_{H¹} ≤ Re h(Pu,u) + λ ‖u‖²_{L²}`;
(2) `u ∈ L²` and weak `Pu ∈ Hˢ`, integer `s ≥ 0`, imply `u ∈ H^{s+2}` with
`‖u‖_{H^{s+2}} ≤ C_s(‖Pu‖_{Hˢ} + ‖u‖_{L²})`;
(3) `H^{s+1} → Hˢ` is compact; and
(4) `ker P` is finite-dimensional and smooth, and `P` is invertible on its smooth
orthogonal complement, with inverse bounded from `Hˢ` to `H^{s+2}` there.
Use K5a's local estimates and compactness directly for (1)–(3). For (4), choose `λ`
large enough that `Q = P + λ id` is nonnegative and apply its supplied compact spectral
theorem. Recover `ker P` as Q's `λ`-eigenspace, not Q's zero eigenspace; invert the
spectral values `μ−λ` off that eigenspace. Thus the kernel and inverse are those of P.
For the Hodge Laplacian the shifted energy estimate allows `λ = 1` after adjusting c
(Demailly, VI.1.5–1.8 and VI.2.1–2.4, pp. 288–290). The Sobolev spaces, adjoints and
compact Hodge operators themselves are the supplier's constructions.
*Needs:* ComplexKahlerGeometry K5a's local estimates and nonnegative compact spectral
package, K5b.1 for Dolbeault applications; C1.2's normalization comparisons.

**Checks.**

- For the nonnegative Hodge Laplacian on the standard circle, integration by parts gives
  `⟨Pu,u⟩ = ‖u'‖²_{L²}` and the usual `H¹` norm satisfies (1) with `c = λ = 1`.
- For `P = −d²/dθ² − 2 id` on the trivial line bundle over the standard circle and `u = 1`,
  `Re ⟨Pu,u⟩ + ‖u‖²_{L²} = −‖u‖²_{L²}`. The coefficient-one estimate fails, while
  `λ = 3`, `c = 1` gives (1) for every smooth section with the usual `H¹` norm.
- For `P = −d²/dθ² − id`, `ker P` is spanned by the modes `e^{iθ}`, `e^{-iθ}`.
  The shift `λ = 2` makes (1) coercive but gives `ker(P + 2 id) = 0`; the inverse in (4)
  still excludes the original two modes.

Use K5a's supplied harmonic projection `H` and Green map `G`, with
`ΔG = GΔ = id−H`, their commutation with `d,δ`, and the de Rham harmonic-representative
isomorphism. Use K5b.1's Dolbeault harmonic isomorphism and K6.1's `∂∂̄` lemma on compact
Kähler manifolds. The latter requires d-closed pure-type forms and says that d-, ∂-,
∂̄- and `∂∂̄`-exactness agree, with negative bidegrees interpreted as zero
(Demailly, VI.3.15–3.17, pp. 294–295, and VI.8.6, p. 311).
*Needs:* ComplexKahlerGeometry K5a, K5b.1, K6.0–K6.1.

**Checks for the supplied harmonic maps.**

- On a point, `H₀ = id` and `G₀ = 0`; a closed degree-zero exact form is zero.
- On the unit circle harmonic functions are constants and harmonic one-forms are the
  span of `dθ`, agreeing with the supplied de Rham comparison.
- On `P¹`, harmonic one-forms vanish and the Fubini–Study form has positive integral,
  hence is neither d-exact nor `∂∂̄`-exact.

Prove `kaehlerHodgeDecomposition` as compatibility of ComplexKahlerGeometry K6.1's
supplied compact Kähler decomposition with C0's coherent modules and C5.1's integration
comparison. For a compact Kähler manifold `T`, the supplied summands `ℋ^{p,q}` identify
with `H^q(T,Ω^p_T)` through `localDolbeault` and K5b.1's harmonic maps. Show that their
sum in degree `n` identifies the supplied Hodge filtration with the image of the
hypercohomology of `Ω_T^{≥p}`. The induced rational cohomology map uses C5.1's canonical
singular integration, including products and conjugation. Hence the
`TauCeti.Hodge.HodgeStructureOn` and `TauCeti.Hodge.Conjugation` transported through
this comparison agree with K6.1's structure; they are not independently chosen Hodge
structures. The comparison follows from the augmentation maps of the supplied
Dolbeault double complex, its type-preserving harmonic projections and the supplied
`∂∂̄` lemma (Demailly, VI.8.1–8.6, pp. 310–311). On a general compact complex manifold,
`E₁`-degeneration alone does not imply Hodge symmetry or harmonic type splitting
(Demailly, VI.11.3 and VI.12.5, pp. 322–326).
*Needs:* ComplexKahlerGeometry K5b.1 and K6.1; `localDolbeault`;
`HolomorphicDeRham`; `sheafSingularComparison`; C5.1's integration comparison;
Tau Ceti `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.Conjugation`.

**Checks for the geometric Hodge compatibility.**

- On a point the only piece is `(0,0)`, and the integration and coherent comparison
  both send the unit to the unit.
- On `P¹`, the Fubini–Study class lies in type `(1,1)` and integrates to one with
  the Chern normalization fixed in the conventions; no rescaling is inserted into the comparison map.
- On an elliptic curve the holomorphic one-form gives the `(1,0)` piece and its
  conjugate the `(0,1)` piece under the same de Rham–Betti map.

Prove `properPureHodge`: for a smooth proper scheme `X` over `ℂ`, projective or not, `H^n_sing(X^an, ℚ)`
carries a pure Hodge structure of weight `n` whose Hodge filtration is, under `properDeRhamBetti`, the
filtration of `H^n_dR(X/ℂ)` by form degree (the image of the hypercohomology of `Ω^{≥p}_X`). A
nonprojective `X^an` need not be Kähler, so the structure is transported: Chow's lemma and resolution of
singularities in characteristic zero give a smooth projective `Y` with a birational proper `π : Y → X`;
`π^*` is injective on cohomology with a retraction given by the trace (Poincaré duality on Betti
cohomology). On Hodge cohomology specialize SchemeAndStackFoundations §§2.19–2.20's coherent
duality and smooth dualizing modules to construct the derived trace and its induced maps
`Tr_π : H^q(Y, Ω_Y^p) → H^q(X, Ω_X^p)` with `Tr_π ∘ π^* = id`, by transposing pullback under
Serre duality. The derived composite induces an endomorphism of the locally free sheaf `Ω_X^p`
which is the identity on a dense open, hence everywhere (Deligne 1968, (4.2) and Proposition 4.3,
printed p. 120). Pullback is compatible with the algebraic filtrations, and the Kähler
Hodge structure of `Y^an` restricts (Deligne 1968, Proposition 5.3, printed pp. 121–123). The completed HodgeStructures roadmap
supplies only the linear algebra; no geometric theorem is attributed to it. *Needs:*
`kaehlerHodgeDecomposition`; `properDeRhamBetti`; `multiplicativePeriodInterface` (trace);
AlgebraicModuliForArithmeticGeometry Layer 2 (`devissageViaChow`);
ResolutionOfSingularitiesCharacteristicZero Layers 1–6 (resolution and SNC compactification);
SchemeAndStackFoundations §§2.19–2.20 (coherent duality, trace and Serre duality), §4.12
(Chow's lemma); Tau Ceti `TauCeti.Hodge.HodgeStructureOn`.

Prove `relativeHodgeBundles` (Deligne): let `f : X → S` be smooth and proper with `S` locally Noetherian
over a field of characteristic zero; `S` may be nonreduced. Then each `R^q f_*Ω^p_{X/S}` is finite
locally free and its formation commutes with arbitrary base change `S' → S`; the relative
Hodge-to-de Rham spectral sequence `E₁^{p,q} = R^q f_*Ω^p_{X/S} ⇒ R^{p+q} f_*Ω^•_{X/S}` degenerates at
`E₁`, and each step of the Hodge filtration of `H^n_dR(X/S)` is a locally direct summand compatible with
base change. If a finite group whose order is invertible on `S` acts on `X` over `S`, each isotypic
summand cut out by a character idempotent defined over the coefficient field is again finite locally free and inherits the filtration and the comparison.
Reduce by Noetherian approximation to `S` of finite type, then by completion and formal functions
to Artin local thickenings of points. Choose a coefficient field in the equicharacteristic Artin
ring, descend the finite data to a finitely generated characteristic-zero subfield and embed that
subfield into `ℂ`; faithful field extension reduces to the Artin `ℂ`-algebras of `artinDeRhamBetti`.
That comparison supplies the total de Rham length. The bounds
`length_A H^q(X, Ω^p_{X/A}) ≤ length_A(A) · dim_ℂ H^q(X₀, Ω^p_{X₀/ℂ})`, with equality forcing
freeness, together with the spectral-sequence length inequality and `properPureHodge` on `X₀`,
force equality in every bound, degeneration and freeness. Coherent base change and formal
functions then give local freeness and arbitrary base change on `S`; idempotents of the group
algebra cut out direct summands (Deligne 1968, Theorem 5.5 and proof, printed pp. 123–125; the
character summands are the argument just given, and Qian, *Potential automorphy for `GL_n`*, Lemma
3.10(2), printed p. 1266, applies them to the Dwork family). *Needs:* `properPureHodge`;
`artinDeRhamBetti`; TauCetiRoadmap.JacobianChallenge (Layer C, cohomology and base change,
formal functions); SchemeAndStackFoundations §0.9 (Noetherian approximation);
Mathlib
`AlgebraicGeometry.IsLocallyNoetherian`, `SheafOfModules.IsLocallyFree`.

### C5.4 Integration over analytic cycles and the Chern normalisation

**Test forms and current calculus — `CurrentCalculus`.** On the same smooth complex manifolds
`M` as the forms API, finite-dimensional Hausdorff and second countable, of complex dimension
`n`, use ComplexKahlerGeometry K5a's `BundleTest` and `BundleDistribution` on the complexified
real exterior bundle `E_k = (Λ^k T* M) ⊗_ℝ ℂ`, for `0 ≤ k ≤ 2n`. Scalar-extend K5a's
real density line to `ℂ`. The complex orientation identifies complex top forms with complex
densities, and the bilinear wedge pairing gives the smooth bundle isomorphism
`Λ^{2n−k} T* M ⊗_ℝ ℂ ≅ E_k* ⊗ DensityBundle M`, sending `η` to
`(α ↦ density(α ∧ η))`. No conjugation or Hermitian metric enters this pairing.
Prove it induces a continuous `ℂ`-linear equivalence between complementary-degree compactly
supported test forms and K5a's `BundleTest(E_k* ⊗ DensityBundle M)`, preserving support and
the fixed-compact derivative seminorm topologies. Transport K5a's inductive-limit topology
through this equivalence. A degree-`k` current is the continuous `ℂ`-linear dual of these
test forms, with compact-convergence topology; the induced dual equivalence identifies it
with `BundleDistribution(E_k)`. Weak convergence means convergence on each test form.

Use K5a's chart, restriction, test extension by zero and partition-of-unity gluing maps;
prove the two equivalences intertwine them. Use its real/complex scalar comparison on
exterior bundles: in real charts the current coefficients are Mathlib
`Distribution Ω ℂ ⊤`, acting on real-valued `TestFunction Ω ℝ ⊤`. The inverse comparison
extends a coefficient functional `U` by `U_ℂ(φ + iψ) = U(φ) + iU(ψ)` for real tests
`φ, ψ`. Identify this comparison with the one induced by the wedge pairing, as a
continuous linear equivalence, not a definitional equality of the test carriers.

Pin degree `k` versus dimension `2n − k`, and bidegree `(a,b)` versus bidimension `(n−a,n−b)`;
a current of bidegree `(a,b)` acts on test forms of type `(n−a,n−b)`. Transport K5a's
distributional differential-operator action on `E_k` through the wedge/density equivalence
and prove that the exterior derivative has the current sign
`(dT)(η) = (−1)^{k+1} T(dη)`, with the same duality sign for `∂T` and `∂̄T`, the type components
of `dT`. Prove `d² = ∂² = ∂̄² = 0` and `∂∂̄ + ∂̄∂ = 0`, continuity and compatibility with
restriction and weak limits. Embed locally integrable forms by `T_α(η) = ∫_M α ∧ η`, injectively
up to almost-everywhere equality; for smooth forms `dT_α = T_{dα}`, also for `∂` and `∂̄`.
For a smooth form `β`, set `(T ∧ β)(η) = T(β ∧ η)`; prove graded commutation with left wedge,
the graded Leibniz laws and `supp(T ∧ β) ⊆ supp T ∩ supp β`. Construct the integration current
of a closed smooth oriented submanifold by the existing manifold integral, with its Stokes
identity `d[Z] = (−1)^{2n−dim_ℝ Z+1}[∂Z]` when `Z` has smooth boundary. This supplies the
integration-by-parts pairing used by the cycle and Poincaré–Lelong targets.

For every `0 ≤ p ≤ n`, strongly positive `(p,p)`-forms are sums with nonnegative coefficients
of `iα₁ ∧ ᾱ₁ ∧ ⋯ ∧ iα_p ∧ ᾱ_p`, where the `α_j` have type `(1,0)`;
positive forms pair nonnegatively with complementary
strongly positive forms. A positive current of bidimension `(p,p)` acts nonnegatively on
strongly positive test forms; a strongly positive current acts nonnegatively on positive test
forms. Keep these cones distinct in intermediate degrees and prove compatibility with smooth
forms, restriction and weak limits. Prove that positive currents have order zero, hence
locally finite complex Radon-measure coefficients in charts. For a Hermitian metric with
fundamental form `ω = (i/2)Σ h_jk dz_j ∧ dz̄_k`, define its trace mass measure by
`T ∧ ω^p/p!`. On compact sets this controls the total variations of all coefficient measures,
and two such metrics give comparable mass measures. Thus finiteness near a deleted closed set
is independent of the metric. For an order-zero current on `M ∖ E` with coefficient variations
finite near `E`, extend those measures by zero to construct a coordinate-independent current
on `M`, assigning no mass to `E`; positivity is preserved. Closedness of this extension is the
separate theorem `closedCurrentExtension`.

In complex coordinate opens construct convolution regularization by nonnegative smooth kernels of
integral one, on smaller opens. Prove weak convergence, commutation with `d`, `∂`, `∂̄`,
preservation of positivity and closedness there, and local mass bounds. Include dominated
convergence for bounded smooth cutoffs tending to one off `E` in the finite-mass zero extension,
and the positive-current Cauchy–Schwarz bounds for the mixed test forms used in Skoda–El Mir.
Use the same convolution to regularize locally integrable plurisubharmonic functions on smaller
complex coordinate opens, retaining plurisubharmonicity and their distributional derivatives
(Demailly, I §2.A–B, pp. 13–16, I §2.D.3, p. 19, I (3.20), p. 25; III (1.1)–(1.14),
pp. 129–133, (1.21)–(1.22), pp. 135–136; III (2.2)–(2.3) and proof, pp. 138–140).
*Needs:* ComplexKahlerGeometry K5a's `BundleTest`, `BundleDistribution`, density bundle,
real/complex and chart comparisons, restriction/gluing and distributional operator action;
DifferentialGeometry Layers 0–2 and 5 (forms, orientation, partitions of unity,
integration and Stokes); Mathlib `TestFunction`, `Distribution`, `Distribution.lineDerivCLM`,
`Distribution.ofFun`, `Distribution.delta`, convolution and Radon measures.

**Checks.**

- For a smooth `k`-form `α`, `(dT_α)(η) = (−1)^{k+1}∫ α ∧ dη = ∫ dα ∧ η`.
  In a chart a scalar coefficient derivative is Mathlib's negative transpose
  `Distribution.lineDerivCLM`, transported from K5a's operator action.
- On `ℂ` with orientation `dx ∧ dy`, `α = a dx + b dy` and
  `η = φ dx + ψ dy` give `α ∧ η = (aψ − bφ) dx ∧ dy`. Thus the test identification
  sends `η` to the dual-density coefficients `(ψ,−φ)`; for scalar chart tests,
  `U_ℂ(iφ) = iU(φ)`, with no conjugation in either comparison.
- The point current `[a]`, of bidimension `(0,0)` and bidegree `(n,n)`, is `f ↦ f(a)`;
  its chart coefficient is `Distribution.delta a`, it is positive and has trace mass one.
- For the closed coordinate submanifold `Z = ℂ^p × {0} ⊂ ℂ^n`, `[Z](η)` is the
  DifferentialGeometry integral of the restricted form, is closed and strongly positive,
  and its trace mass for the Euclidean metric is the usual volume on `Z`.
- Extending the positive measure `|z|⁻² dx dy` from a punctured disc by zero fails the local
  finite-mass hypothesis at zero; positivity on the complement alone does not provide an extension.

**Real/complex current comparison — `realComplexCurrentComparison`.** For a finite-dimensional
Hausdorff second-countable smooth real manifold `N` without boundary and `q ∈ ℕ`,
identify GeometricCurrents G1's compactly supported real `q`-form tests with K5a's real
`BundleTest(V_q* ⊗ DensityBundle N)`, where
`V_q = (Λ^q T* N)* ⊗ DensityBundle N`. The evaluation and dual-line cancellation
`V_q* ⊗ DensityBundle N ≅ Λ^q T* N` give this identification without an orientation
of `N`. Prove equality of the LF topologies through the fixed-compact seminorms and chart
extension maps, and the induced compact-convergence dual equivalence between G1's
`Current q N` and the real `BundleDistribution(V_q)`. Retain evaluation, support,
restriction, extension by zero on tests, gluing and boundary as the transpose of exterior
derivative. These are specializations of K5a's general foundation.

For a complex `n`-manifold `M` as in `CurrentCalculus`, put `N = M_ℝ`. For
`0 ≤ q ≤ 2n` construct the real topological linear equivalence `J_q` from real
dimension-`q` currents to the conjugation-fixed complex degree-`(2n−q)` currents,
using the LF real/imaginary test decomposition and
`J_q(T)(φ + iψ) = T(φ) + i T(ψ)` for real compactly supported `q`-forms `φ, ψ`.
Conjugation here is `κS(η) = conj(S(conj η))`; the inverse on fixed points restricts
to real tests. Every complex current is uniquely `J_q(T₁) + i J_q(T₂)`.
Prove the comparison agrees with K5a's scalar comparison and C5.4's wedge/density
transport. It preserves support, commutes with restriction and gluing, and sends the
real integration current of a closed smooth oriented `q`-submanifold to its complex
integration current, including sources with smooth boundary and their outward-first
boundary orientation.

For `1 ≤ q ≤ 2n`, the differential identity is
`d J_q(T) = (−1)^(2n−q+1) J_(q−1)(∂T)`, where `∂T(η) = T(dη)` is G1's boundary.
This follows by evaluation on real and imaginary test forms; it is the degree sign
of `CurrentCalculus`. Extend the real dimension grading by zero below zero and the
complex degree grading by zero above `2n`; then `∂T = 0` for `q = 0` and
`d J_0(T) = 0`. No negative-degree form is inserted into the test space.

For a smooth Hermitian metric use its underlying real Riemannian metric, with
`ω = (i/2)Σ h_jk dz_j ∧ dz̄_k`. Give complex `q`-form tests the comass obtained
by taking absolute values on real unit simple `q`-vectors. The corresponding
variational mass of `J_q(T)` equals G1's real comass mass of `T`, locally and globally:
real tests give one inequality, and taking the real part after a constant unit-complex
rotation of each complex test gives the other. For locally finite mass, identify the
Radon mass measures by their values on opens. If `q = 2p` and `J_q(T)` is positive
of bidimension `(p,p)`, prove two-sided comparison on each compact set between this
mass measure and the trace measure `J_q(T) ∧ ω^p/p!`, using coefficient-norm
equivalence and the positive-current coefficient bounds. For integration over complex
`p`-submanifolds both equal their induced Riemannian volume. An arbitrary current
need not have locally finite mass or a trace mass, and neither complexification nor
positivity implies integer rectifiability (Demailly, I (2.1)–(2.7), pp. 13–15;
III (1.14)–(1.15), pp. 133–134, and (1.21)–(1.22) with Wirtinger's formula (1.24),
pp. 135–136; GeometricCurrents, conventions and G1's boundary and mass definitions).
*Needs:* `CurrentCalculus`; ComplexKahlerGeometry K5a's real bundle tests,
distributions, density duality and scalar comparison; GeometricCurrents G1;
ComplexManifolds Milestone 1's realification.

**Checks for the real/complex comparison.**

- On the nonorientable manifold `ℝP²`, `q = 0` gives `V_0 = DensityBundle N`;
  its dual-density tests are scalar functions, so point currents require no ambient orientation.
- On the oriented closed unit disc `D ⊂ ℂ`, `q = 2` gives
  `d J_2([D]) = −J_1([∂D])`, with the counterclockwise boundary orientation.
- On an oriented segment from `a` to `b` in `ℂ`, `q = 1` gives
  `d J_1([a,b]) = J_0(δ_b − δ_a)`, with the opposite sign to the disc case.
- For a point mass `δ_a`, `J_0(δ_a)(φ + iψ) = φ(a) + iψ(a)` and its
  differential is zero, including when `n = 0`.
- For `Z = ℂ^p × {0} ⊂ ℂ^n`, `J_(2p)([Z])` is the complex integration current;
  its Euclidean comass and trace masses both equal volume on `Z`, locally finite
  even when its total mass is infinite.
- The positive current `½δ_a` has mass `½` and is outside G1's integer-rectifiable
  subgroup. On `ℂ`, a nonzero coordinate derivative of a point mass is a current
  without locally finite mass.

Prove `closedCurrentExtension` (Skoda–El Mir): let `E` be a closed complete pluripolar subset of a
complex manifold `M` (locally `{v = −∞}` for a plurisubharmonic `v`; analytic subsets qualify) and `Θ` a
closed positive current on `M ∖ E` with locally finite mass near every point of `E`. Then the extension
of `Θ` by zero across `E` is a closed positive current on `M`. Finite mass cannot be dropped. Use cutoffs
built from the plurisubharmonic function with pole set `E` (smoothed locally by convolution); Stokes and
Cauchy–Schwarz bound the error by the mass on shrinking neighbourhoods (Demailly, III.2.3 and its proof,
pp. 138–140). *Needs:* `CurrentCalculus`; `remmertSteinExtension` (local structure of analytic sets);
TauCetiRoadmap.DifferentialGeometry (forms, Stokes); Mathlib convolution.

**Finite mass on compact subsets — `analyticSetLocalFiniteMass`.** Prove the globalization
of ComplexKahlerGeometry K6.1's chart-local Lelong finite-mass estimates: for a pure
`d`-dimensional closed analytic subset `Z` of any finite-dimensional Hausdorff second-countable
complex manifold `M`, the induced volume of `Z_reg ∩ K` is finite for every compact
`K ⊆ M` and every smooth Hermitian metric. The supplied local estimate is the finite-sheet
projection bound near each singular point; at regular points use a relatively compact
submanifold chart. A finite cover of `K` by these neighborhoods gives the global bound.
Prove compatibility with restriction and holomorphic chart change. If two metrics satisfy
`c g ≤ h ≤ C g` near `K`, with `c,C > 0`, their induced `2d`-volumes there satisfy
`c^d μ_g ≤ μ_h ≤ C^d μ_g`; compact-local metric comparison gives metric independence of
local finiteness. Neither `M` nor `Z` is required to be compact or Kähler.
Use K5a's L¹ extension and its comparison with the native Riemannian-volume integral;
compact ambient support need not pull back to compact support on `Z_reg`
(Demailly, III.2.5–2.6, p. 140).
*Needs:* ComplexKahlerGeometry K6.1's chart-local Lelong estimates and K5a's L¹ integration
comparison; the induced regular-locus metric and volume. The local projection estimate
is the supplier's theorem; the restriction, metric comparison and globalization are the adapter here.

**Checks.**

- A coordinate line in `ℂ²` has finite mass on compact subsets and infinite total Euclidean mass.
- Near the node `xy = 0` in `ℂ²`, the mass is the sum of the two branch areas, with no point mass at the node.
- A compactly supported smooth ambient form nonzero at the node can restrict to a form whose support accumulates
  at the missing node on `Z_reg`; the L¹ integral still exists.

Define `AnalyticCycleIntegration` for a pure `d`-dimensional analytic subset `Z` of a complex manifold
`M`: the current `[Z](η) = ∫_{Z_reg} η` on compactly supported smooth `2d`-forms, with the complex
orientation of `Z_reg`. The integral converges near the singular locus and `[Z]` is a closed positive
current of bidimension `(d,d)`; for a cycle `Σ mᵢZᵢ` take `Σ mᵢ[Zᵢ]`. Nilpotent structure enters only
through the multiplicities of the cycle. Use `analyticSetLocalFiniteMass` and
K5a's L¹ integration comparison; closedness follows from `closedCurrentExtension` applied
across `Z_sing`. The API is
`AnalyticCycleIntegration.regular` (on a closed submanifold it is the manifold integral of
DifferentialGeometry), `AnalyticCycleIntegration.add` (additivity in multiplicities) and
`AnalyticCycleIntegration.closed` (`[Z](dη) = 0`) (Demailly, III.2.1–2.3, pp. 138–140, and
III.2.5–2.7, p. 140). *Needs:* `analyticSetGeometry`; `CurrentCalculus`; `closedCurrentExtension`; `remmertSteinExtension`;
`analyticSetLocalFiniteMass`; ComplexKahlerGeometry K5a (L¹ integration comparison);
TauCetiRoadmap.DifferentialGeometry (integration, Layer 5).

**Checks.**

- `AnalyticCycleIntegration.point`: for a reduced point `Z = {a}`, `[Z](f) = f(a)` on functions.
- `AnalyticCycleIntegration.line`: for the coordinate line `{z₂ = 0} ⊂ ℂ²` and
  `η = χ(|z₁|² + |z₂|²) (i/2) dz₁ ∧ dz̄₁` with `χ ≥ 0` smooth and compactly supported and `χ(0) > 0`,
  `[Z](η) > 0`: the complex orientation `dx ∧ dy = (i/2)dz ∧ dz̄` is used, not its negative.
- `AnalyticCycleIntegration.doubleLine`: the cycle `2[L]` integrates to twice `[L]`; integrating over the
  reduced regular locus of the double line would lose the multiplicity.

Prove `AnalyticCycleIntegration.compactKaehler`: for a compact Kähler manifold `M`,
a pure `d`-dimensional analytic cycle `Z = Σ mᵢZᵢ` and a real smooth closed `2d`-form `α`,
`[Z](α_ℂ) = ι(Σ mᵢ ∫_((Zᵢ)_reg) α)`, where `ι : ℝ → ℂ` is scalar inclusion and
`α_ℂ` is the complexification of `α`. The right side is the complex image of K6.1's
real analytic-set de Rham functional, extended with the same multiplicities. Use the
complex orientation on each regular component and the shared L¹ integral, including
when the restricted form lacks compact support on the regular locus. The equality
descends to de Rham classes and is independent of the induced metric
(Demailly, III.2.5–2.7, p. 140; ComplexKahlerGeometry K5a and K6.1).
*Needs:* `AnalyticCycleIntegration`; ComplexKahlerGeometry K5a (real/complex L¹ comparison)
and K6.1 (real analytic-set integral and de Rham functional).

**Checks.**

- For a smooth projective curve the equality is the real/complex manifold integral comparison.
- For a nodal projective curve `C ⊂ P²`, evaluation on the Fubini–Study form equals
  the complex image of the real L¹ integral over `C_reg`, including forms nonzero at the node.
- For `2[C]` both sides are twice their values on `C`; the singular point contributes no atom.

Prove `semipositiveWedge`: with the complex orientation, products of semipositive real `(1,1)`-forms
are positive, and if `α`, `β` and `α − β` are semipositive `(1,1)`-forms on a neighbourhood of a pure
`d`-dimensional analytic set `Z`, then `∫_Z χ βᵈ ≤ ∫_Z χ αᵈ` for every nonnegative compactly supported
smooth `χ`; every mixed term `(α − β)^j ∧ β^{d−j}` integrates nonnegatively. Pointwise this is
`det B ≤ det A` for Hermitian matrices `0 ≤ B ≤ A` (`det_le_det_of_posSemidef`) (Demailly, III.1.7–1.12, pp. 131–132;
Dimitrov–Gao–Habegger, proof of Proposition 4.2, display (4.3), PDF p. 17). *Needs:*
`AnalyticCycleIntegration`;
Mathlib `Matrix.PosSemidef`.

Prove `lelongPoincareSection`: let `M` be a complex manifold, `(L, h)` a Hermitian holomorphic line
bundle on `M` with Chern curvature `Θ(L, h)` (ComplexKahlerGeometry K4's Chern connection) and `c₁(L, h) = (i/2π)Θ(L, h)`, and
`s` a meromorphic section of `L` vanishing identically on no connected component of `M`. Its divisor
`div s = Σ mⱼZⱼ` runs over the irreducible components `Zⱼ` of the zero and pole sets, `mⱼ` the order
of vanishing (negative along poles) of the coefficient of `s` in a local frame at a generic point of
`Zⱼ`. Then `log ‖s‖_h` is locally integrable and, as currents of bidegree `(1,1)`,
`(i/π)∂∂̄ log ‖s‖_h = [div s] − c₁(L, h)`, with `[div s] = Σ mⱼ[Zⱼ]` (`AnalyticCycleIntegration`).
The local and the global equation differ. For a local meromorphic coefficient `f` (a function,
`s = f e` in a holomorphic frame `e` on an open `Ω`, `f` vanishing identically on no component of
`Ω`) the equation is `(i/π)∂∂̄ log|f| = [div f]`, with no curvature term; for the global section `s`
the
curvature term is present, since `log ‖s‖_h = log|f| + log ‖e‖_h` and
`(i/π)∂∂̄ log ‖e‖_h = −c₁(L, h)` on `Ω` (from C1.3's supplied line-curvature comparison with
`‖e‖²_h = e^{−φ}`). Consequently `[div s]` and `c₁(L, h)` agree on closed forms:
`Σ mⱼ ∫_{Zⱼ} η = ∫_M c₁(L, h) ∧ η` for every closed compactly supported smooth `(2n − 2)`-form `η`,
`n = dim_ℂ M`, because the left side of the equation is `d((i/π)∂̄ log ‖s‖_h)`. The function equation is
proved near a regular point of a component, in coordinates where it is `w₁ = 0` and `f = u w₁^{mⱼ}` with
`u` invertible (ComplexKahlerGeometry K3's Weierstrass preparation), from the one-variable identity
`(i/π)∂∂̄ log|z| = [0]` (Cauchy's formula for `1/z`); the difference of the two sides is then a
closed current of order zero (away from the zero and pole sets both sides vanish) supported in the
singular locus of the support of the divisor, of dimension `< n − 1`, and it vanishes by the first
support theorem (a normal current of bidimension `(p,p)` supported in an analytic set of dimension
`< p` is zero), which is proved with this target (Demailly, III.2.10–2.11, p. 141, for the support
theorem; III.2.15 and proof, pp. 143–144, for meromorphic functions;
V.13.1–13.4, p. 271, for sections of Hermitian line bundles, equation (13.2) and Theorem 13.4).
*Needs:* `CurrentCalculus`; `AnalyticCycleIntegration`; ComplexKahlerGeometry K4's Chern connection (C1.3 conventions); ComplexKahlerGeometry K3's Weierstrass preparation through §C−1.1; TauCetiRoadmap.DifferentialGeometry (forms, Stokes);
Mathlib `circleIntegral`.

**Checks.**

- `lelongPoincareSection.projectiveLine`: for `O(1)` on `P¹` with the Fubini–Study metric and the
  section `z₀`, vanishing simply at one point, the left side integrates to `0` over `P¹` (it is `d` of
  a current on a compact manifold), `[div z₀]` to `1` and `c₁(O(1), h)` to `1`
  (`fubiniStudy_integral_eq_one`); the function equation applied to the section would assert `0 = 1`.
- `lelongPoincareSection.coordinate`: for the trivial bundle on `ℂ` with constant metric, `f = zᵐ`
  gives `m[0]` and `f = z/(z − 1)` gives `[0] − [1]`; poles count negatively.
- `lelongPoincareSection.frame`: for a nowhere vanishing holomorphic `e` with `‖e‖²_h = e^{−|z|²}` on
  `ℂ`, `(i/π)∂∂̄ log ‖e‖_h = −(i/2π) dz ∧ dz̄ = −c₁(L, h)`, and `c₁(L, h)` is positive, matching
  C1.3's supplied line-curvature comparison.

Define `integralLineBundleChernClass L ∈ H²_sing(M, ℤ)` for a holomorphic line bundle `L`
on a complex manifold `M` by forgetting to SmoothBundlesConnections B2's native smooth
complex `VectorBundle`/`ContMDiffVectorBundle` carrier. Construct this forgetful adapter
from C0.3's holomorphic bundle dictionary by restricting scalars on the base charts;
its maps remain fibrewise complex-linear. Prove compatibility with pullback, tensor, dual
and the trivial line. Equip the underlying line with a smooth Hermitian metric only to form
its unit-frame circle bundle: let `P_L` be the right unit-frame bundle of the dual smooth
line. Identify `P_L ×_Circle ℂ` for the inverse character `z ↦ z⁻¹` with the underlying
smooth `L`. Changes of metric induce the same bundle class.

Consume SmoothBundlesConnections B6.1–B6.4's integral exponential/Čech-to-singular
construction and define the class using its `c₁(P_L)`. Prove equality in integral singular
cohomology with CharacteristicClasses C1.5/C3's first Chern class of the underlying
complex line, before coefficient change. Pullback, tensor additivity, dual negation and
triviality commute with this equality. The generic exponential sequence, cover refinement,
Čech comparison and curvature/Bockstein comparison have their single owner in
SmoothBundlesConnections B6; the holomorphic adapter and integral identification are here.

Identify the cocycles explicitly. If `g_αβ` changes β-coordinates to α-coordinates in unitary
frames of `L` and `g_αβ = exp(2πiu_αβ)`, then the dual-frame principal cocycle is
`g^P_αβ = g_αβ⁻¹` with angle `φ^P_αβ = −2πu_αβ`. B6's inverse-character class has
integer representative `−δφ^P/(2π) = δu`, where
`(δu)_αβγ = u_βγ − u_αγ + u_αβ`. Prove this equality through the shared integral
Čech-to-singular map, its refinements and coefficient connecting maps. The inclusion of
unitary transitions into smooth nonzero complex transitions identifies this class with
the connecting image of `[g]` for `u ↦ exp(2πiu)` in the smooth complex exponential
sequence (the positive real factor has a global smooth logarithm). No metric or meromorphic
section is part of the integral class.

For C1.3's Chern connection, transport the conjugate-first bundle metric
`h(s,t) = s* H t` to B2–B4's convention; the linear-first Hodge pairing is `h(t,s)`.
On `P_L`, the dual connection's real circle curvature `F_P` satisfies
`Θ(L) = −i F_P`. B6.1–B6.3's Čech–singular–de Rham comparison therefore sends the
real coefficient image of the integral class to `[(i/2π)Θ(L,h)] = [F_P/(2π)]`;
extending coefficients gives the complex comparison. Prove this square uses
DifferentialGeometry's integration comparison and C5.1's `sheafSingularComparison`.
Changing the metric changes the curvature representative by an exact form
(Demailly, V.8.2 and V.9.2–9.5, printed pp. 264–265; IV.6.11 for the Čech–de Rham sign;
V.12.1–12.2, pp. 268–269 for the Chern connection).
*Needs:* `holomorphicBundleDictionary`; ComplexKahlerGeometry K4's Chern connection (C1.3 conventions); `sheafSingularComparison`;
SmoothBundlesConnections B2–B4 and B6.1–B6.4; CharacteristicClasses C1.5 and C3;
DifferentialGeometry Layers 6–8.

**Checks.**

- The trivial holomorphic line has the shared integral class zero. On `ℂ`, the metric
  `‖1‖² = e^{−|z|²}` has nonzero exact normalized curvature, still with integral class zero.
- For `O(1)` on `P¹`, `P_L` is the Hopf bundle of frames of `O(−1)`; the shared
  inverse-character class and `integralLineBundleChernClass O(1)` are the positive integral
  generator, pairing to one (`fubiniStudy_integral_eq_one`).
- For any right circle bundle `P`, its inverse-character line has class `c₁(P)` and its
  standard-character line has class `−c₁(P)`. Thus the underlying dual of `L` has class
  `−integralLineBundleChernClass L`, and `L ⊗ L∨` has integral class zero.
- For a flat circle cocycle with holonomy class `h` and nonzero torsion Bockstein
  `β(h)`, the shared integral representatives `−δφ^P/(2π)` and `δu` coincide and represent
  `β(h)`; their real images vanish. Equality only after real coefficient change would miss
  this test. Use B6.4's torsion cocycle and its connecting-map comparison.

Prove `chernFubiniStudyIntersection`: for a Hermitian holomorphic line bundle `L` on a complex
manifold, the form `(i/2π)Θ(L)` of its Chern connection is closed and its de Rham class is the image of the integral
first Chern class `integralLineBundleChernClass L`; on `Pʳ` the normalised Fubini–Study form
represents `c₁(O(1))` and integrates to `1` over a line (in the affine chart, `∫_ℂ π⁻¹(1 + |z|²)⁻² dλ = 1`,
`fubiniStudy_integral_eq_one`); and for a projective `d`-dimensional algebraic cycle `Z` (with multiplicities) and a
line bundle `L`, `∫_Z c₁(L, h)ᵈ` equals the algebraic intersection degree `(c₁(L)ᵈ · Z)`, with mixed
degrees and Segre pullbacks normalised the same way. The assertion on any complex manifold uses
the integral class and Čech–curvature comparison of `integralLineBundleChernClass`.
For the projective intersection assertion, `lelongPoincareSection` identifies the class of
the curvature form with that of the divisor current — for a global section `s` of `(L, h)` through
`(i/π)∂∂̄ log ‖s‖_h = [div s] − c₁(L, h)`, not through the function equation
`(i/π)∂∂̄ log|f| = [div f]`, which holds only for a local coefficient `f` — and induction on dimension
cuts by divisors (Demailly, V.9.2–9.5, pp. 264–265; V.13.2–13.9, pp. 271–273; V.15.8, V.15.10
and V.15.12 and proofs, pp. 279–281). *Needs:*
`AnalyticCycleIntegration`; `semipositiveWedge`; `lelongPoincareSection`; ComplexKahlerGeometry K4's Chern connection (C1.3 conventions);
`integralLineBundleChernClass`; `multiplicativePeriodInterface`;
`projectiveChowNonreduced`; SchemeAndStackFoundations Layer 5 (degrees and intersection products);
AlgebraicModuliForArithmeticGeometry Layer 1.

Prove `dghIntegrationApplication`: in the setting of Dimitrov–Gao–Habegger, Proposition 4.2, the volume
estimate on an analytic component is obtained as follows: represent the line bundle on the product of
projective spaces by the Segre pullback of the normalised Fubini–Study form, keep the pullback along
the paper's second projection (the bundle `O(0,1,1)` on the triple product, not `O(1,1,1)`), apply
`semipositiveWedge` to the semipositive difference of the two forms compared there, with compact
support supplied by a cutoff pulled back from the base and the integrals over the smooth locus made
finite by Lelong's theorem (`AnalyticCycleIntegration`), and identify the total with the algebraic
intersection degree by `chernFubiniStudyIntersection` after discarding the contribution of the
lower-dimensional boundary (Dimitrov–Gao–Habegger, Proposition 4.2 and proof, PDF pp. 16–19, with
the integration–intersection identity at (4.9), p. 18).
*Needs:* `AnalyticCycleIntegration`; `semipositiveWedge`; `chernFubiniStudyIntersection`.

### Examples (C5.3–C5.4)

- For an elliptic curve `E`, `H¹(E, ℂ)` splits into the one-dimensional `(1,0)` part spanned by the
  invariant differential and its conjugate; for `P¹`, `H¹ = 0` and `H²` has type `(1,1)`.
- A dual-number base `Spec ℂ[ε]/(ε²)` satisfies the local freeness and base change of
  `relativeHodgeBundles`; dimension counting on reduced fibres is not a proof of it. An averaging
  projector is used only when the group order is invertible; a character projector also requires
  the corresponding character to be defined over the coefficient field.
- On `P¹`, the normalised curvature of `O(1)` integrates to `1` and that of `O(m)` to `m`; a doubled cycle
  contributes twice its reduced degree.
- For `α = tω`, `β = sω` with `t ≥ s ≥ 0`, `∫_Z χ βᵈ = sᵈ ∫_Z χ ωᵈ ≤ tᵈ ∫_Z χ ωᵈ`.
- The integration current of a complex line extends across a deleted point (finite mass) and stays
  closed.

### C5.5 Logarithmic structures

The algebraic carrier and its basic API are supplied by CrystallineCohomology
CR.5:log-algebra.1–.4 and CR.5.1, over arbitrary characteristics. On algebraic sites the
names `PrelogStructure`, `LogStructure`, `AssociatedLog`, `LogPullback`, `FineLogChart`,
`DivisorialLog`, `LogSmooth`, `logChartCriterion` and `LogDeRham` below are specializations
or aliases of that API. Their formulas and checks specify the shared interface, rather than
separate constructions. Complex analytic spaces use the same monoid-sheaf, logification
and log-pullback constructions. Their differentials use the holomorphic cotangent
sheaf and the analytic log-derivation property specified by `AnalyticLogDifferentials`.
This roadmap owns that analytic adapter, `logAnalytification`, the SNC identification
and boundedness of the specialized complex, and `logDifferentialTransitivitySplit`
on the algebraic carrier.

**Analytic cotangent and logarithmic differentials.** Define `AnalyticLogDifferentials`
for a morphism `f : X → S` of fine log complex analytic spaces, retaining nilpotents.
First construct the coherent relative holomorphic cotangent sheaf `Ω¹_hol(X/S)`.
On an absolute germ chart `A = ℂ{z₁, …, z_n}/I`, its presentation is
`(⊕ᵢ A dzᵢ)/(d_hol h : h ∈ I)`, with
`d_hol h = Σᵢ [∂h/∂zᵢ] dzᵢ`; the relative quotient also kills differentials of
functions pulled back from `S`. Prove independence of chart presentations and
compatibility with restriction and analytic base change, using convergent substitution
and the chain rule. On manifolds this is C5.1's holomorphic cotangent sheaf, with its
relative version for a holomorphic map.

For any `O_X`-module sheaf `F`, an analytic derivation is an `f⁻¹O_S`-linear
derivation `D : O_X → F` satisfying the convergent chain rule: in the chart above,
`D([h]) = Σᵢ [∂h/∂zᵢ] D([zᵢ])` for every convergent germ `h`.
Prove that `Ω¹_hol(X/S)` represents these derivations. Define the analytic log
module as the quotient of `Ω¹_hol(X/S) ⊕ (O_X ⊗_ℤ M_X^gp)` by
`d_hol α(m) − α(m) ⊗ m` and `1 ⊗ q` for local sections `q` from `f⁻¹M_S`.
Its pair `(d_hol, dlog)` represents analytic logarithmic derivations: such a `D`
and an additive map `δ : M_X^gp → F` with `Dα(m) = α(m) δ(m)` and
`δ(f⁻¹M_S) = 0`. The API is `AnalyticLogDifferentials.lift` (this representing
property), `AnalyticLogDifferentials.d_alpha` and `AnalyticLogDifferentials.dlog_mul`.
Prove coherence, logification invariance, restriction and analytic base change.
Exterior powers carry the holomorphic log de Rham differential, determined by
the holomorphic exterior derivative, `d(dlog m) = 0` and the graded Leibniz rule;
prove that it respects the relations and squares to zero. The ordinary cotangent
carrier represents analytic derivations; unrestricted algebraic derivations of
the analytic structure rings have a different representing module.
(Freitag, *Complex Spaces*, I.2, pp. 2–5, I.6, pp. 16–18, and II.2, pp. 47–48,
for convergent substitution and analytic quotient charts; the presentations and
representing properties follow from the chain rule and quotient relations;
Kato, §§1.7–1.9, pp. 195–196, for the algebraic log relations and exterior
extension; Deligne 1970, I.2.10–2.15, pp. 9–11, and I.2.22, p. 14,
for holomorphic forms and their relative differential.) *Needs:* `ComplexAnalyticSpace`;
`HolomorphicDeRham`; `coherentOperations`; CrystallineCohomology
CR.5:log-algebra.1 (monoid sheaves, logification and log pullback).

**Checks.**

- With trivial log structures on the analytic affine line, the module is
  `O_ℂ dz` and `d_hol(exp z) = exp z · dz`. In the germ ring `A = ℂ{z}`, an
  algebraic derivation into `Frac(A)` can have `D(z) = 0`, `D(exp z) = 1`;
  it fails the analytic chain rule and does not factor through this cotangent sheaf.
- On the nonreduced chart `A = ℂ{z, ε}/(ε²)` with trivial logs,
  `Ω¹_hol(A/ℂ) = A dz ⊕ (A/(ε)) dε`: `dε ≠ 0` and `ε dε = 0`.
  Relative to `ℂ[ε]/(ε²)`, the module is `A dz` and `ε dz ≠ 0`.
- The standard analytic log point over the trivial point has module `ℂ · dlog t`;
  relative to itself the base-monoid relation makes the module zero.

Define and prove `logAnalytification`: for a fine log scheme `X` locally of finite type
over `ℂ`, transport the shared étale monoid sheaf to `X^an` and logify its structure map
along `φ_X`. On an étale chart `P → O_X`, this is the associated analytic log structure
of `P → O_{X^an}`; analytified étale charts are local biholomorphisms, and their descent
identifications make this construction independent of charts. It commutes with log
pullback. For a morphism `X → S` of schemes locally of finite type over `ℂ`, prove
`logAnalytification.cotangentIso`:
`(Ω¹_{X/S})^an ≅ Ω¹_hol(X^an/S^an)`, compatible with the ordinary derivations.
Use finite algebraic presentations and their holomorphic conormal presentations,
including nonreduced charts. For a morphism of fine log schemes with these underlying
schemes, prove `logAnalytification.logDifferentialsIso`:
`(Ω¹_log(X/S))^an ≅ AnalyticLogDifferentials(X^an/S^an)`, carrying `(d, dlog)`
to `(d_hol, dlog)`. On finite charts `Q → P`, apply the ordinary cotangent comparison
and exact coherent analytification to the relation quotient; logification invariance
and chart descent make these maps canonical. Exterior powers and
`DifferentialOperatorAnalytification` identify the algebraic and holomorphic log
de Rham complexes, including their differentials and pullbacks.
For an SNC pair, identify this log structure with the analytic divisorial structure and
the complex with `Ω^•_{X^an}(log D^an)`. Residue along a labelled component puts its
`dlog` factor first: `Res_z(dlog z ∧ η) = η|_{z=0}`. These compare the supplier's
algebraic carrier with the holomorphic analytic carrier (Kato, §§1.3–1.9,
pp. 193–196, for logification, inverse image and the algebraic quotient;
Freitag, I.6, pp. 16–18, and II.2, pp. 47–48, for the analytic chart presentations;
Deligne 1970, II.6.6, pp. 100–101, for local differential-operator analytification;
the cotangent, chart-descent and residue comparisons follow from the presentations).
*Needs:* `AnalyticLogDifferentials`; CrystallineCohomology
CR.5:log-algebra.1–.4 and CR.5.1; `CoherentAnalytification`;
`DifferentialOperatorAnalytification`; §C−1.1
(`complexSchemeAnalytification.etaleLocalIso`) and §C−1.4 (`analyticPolydisc`).

**Checks.**

- Trivial log structures compare the algebraic Kähler module with the holomorphic
  cotangent sheaf and `AlgebraicDeRham` with the holomorphic complex. On algebraic
  affines the differential and pullback are `DeRham.complex` and `DeRham.complexMap`;
  on the analytic affine line the transported differential sends `exp z` to `exp z · dz`.
- The standard log point over the trivial complex point has `ℂ · dlog t` in degree one,
  while its identity relative differential module is zero, on both sides of analytification.
- For the SNC coordinate boundary `xy = 0` in the smooth plane, the shared absolute
  log complex has basis `dlog x`, `dlog y`, with
  `Res_x(dlog x ∧ dlog y) = dlog y` and `Res_y(dlog x ∧ dlog y) = −dlog x`.
  These conventions persist in the analytic complex used in C5.6–C5.7.
- For `Spec ℂ[z, ε]/(ε²)` with trivial logs, the cotangent comparison gives
  `A dz ⊕ (A/(ε)) dε` at the origin, where `A = ℂ{z, ε}/(ε²)`; the
  relation `2ε dε = 0` persists and the chart is not replaced by its reduction.

Use the shared prelog carrier as `PrelogStructure T`: a sheaf of commutative monoids `M` with a morphism of sheaves of monoids
`α : M → (O_T, ·)`. Non-units, including `0`, are allowed in the image. On a ring `A` with a chart
monoid `P` this is a monoid homomorphism `P → (A, ·)`, not an additive map and not a map into `Aˣ`.
Morphisms commute with the structure maps. The API is `PrelogStructure.structureMap` (multiplicative,
`α(1) = 1`), `PrelogStructure.morphism` (morphisms of monoid sheaves compatible with `α`) and
`PrelogStructure.restrict` (restriction to opens) (Kato, *Logarithmic structures of Fontaine–Illusie*,
in *Algebraic Analysis, Geometry, and Number Theory* (1989), §1.1, printed p. 192). *Needs:*
CrystallineCohomology CR.5:log-algebra.1, “Prelog rings” and “Étale log structures”
(`LogCrystalline.PrelogRing` on rings); SchemeAndStackFoundations Layer 1 (sites of schemes);
Mathlib monoid homomorphisms and sheaves of monoids.

**Checks.**

- `PrelogStructure.trivialChart`: the one-element monoid maps its unit to `1`.
- `PrelogStructure.coordinateChart`: `ℕ → ℂ[z]`, `n ↦ zⁿ`, is a prelog structure on the affine line.
- `PrelogStructure.standardLogpoint`: `ℕ → ℂ`, `n ↦ 0ⁿ` (so `0 ↦ 1` and `n ↦ 0` for `n ≥ 1`) is a
  prelog structure; restricting targets to units would exclude this standard log point.

Use the shared log carrier as `LogStructure T`: a prelog structure for which `α` restricts to an isomorphism
`α⁻¹(O_T^×) → O_T^×` (tested on sections, equivalently on stalks). A morphism of log ringed spaces is a
morphism of ringed spaces with a compatible map from the pulled-back monoid sheaf. The API is
`LogStructure.unitsIso` (the inverse-image unit map is the stated isomorphism), `LogStructure.trivial`
(the trivial log structure `O_T^× ⊆ O_T`) and `LogStructure.restrict` (restriction preserves the unit
condition). On a ring the condition reads: every unit has exactly one preimage
(`LogCrystalline.PrelogRing.IsLog` for the bundled chart; the standard-point chart map
is `standardLogPoint`) (Kato, §1.2–1.5(2), printed pp. 193–194). *Needs:* CrystallineCohomology CR.5:log-algebra.1,
“Étale log structures” (`LogCrystalline.LogStructure`, `LogCrystalline.PrelogRing.IsLog`);
`PrelogStructure`.

**Checks.**

- `LogStructure.trivialUnits`: for the trivial log structure the characteristic monoid
  `M/O_T^×` is the one-element monoid.
- `LogStructure.point`: on a field the trivial log structure is its unit group.
- `LogStructure.rawNChart`: the raw chart `ℕ → ℂ[z]` is not a log structure (it misses the units of
  `ℂ[z]`, namely `ℂ^×`); logification adds them.

The chart condition `LogCrystalline.PrelogRing.IsLog` has the API that the map on inverse images of units is
bijective, hence a monoid isomorphism, is invariant under chart isomorphisms, and agrees with the
sheaf condition on a one-point ringed site. The specialization `standardLogPoint` is
`powersHom ℂ 0`; its API evaluates the identity to `1`, every positive exponent to `0`, and
identifies its logification with `ℂˣ × ℕ` (Kato, §§1.2–1.3, pp. 193–194).

**Checks for chart log structures and the standard point.**

- The inclusion `Aˣ → A` satisfies `LogCrystalline.PrelogRing.IsLog`, including the zero ring where its unit
  group and its multiplicative monoid both have one element.
- The raw standard-point chart does not satisfy `LogCrystalline.PrelogRing.IsLog`: the unit `2 ∈ ℂˣ` has no
  preimage. Its logification adds those missing units.
- The projection from `ℂˣ × Multiplicative (ZMod 2)` to `ℂ` maps onto every unit but has two
  preimages for each one, so it fails `LogCrystalline.PrelogRing.IsLog`; surjectivity alone does not suffice.

**Checks for `standardLogPoint`.**

- Exponent `0` maps to `1`; sending every exponent to zero is not a monoid homomorphism.
- Every positive exponent, including `1` and `2`, maps to `0`, so this chart includes non-units.
- Its logification has monoid `ℂˣ × ℕ` and characteristic monoid `ℕ`; logifying it as the
  trivial log structure would lose the nonzero characteristic generator.

Use shared logification as `AssociatedLog`: for a prelog structure `α : M → O_T`, the log structure
`M^a = M ⊕_{α⁻¹(O_T^×)} O_T^×`, the pushout of commutative monoid sheaves (sheafified), with the induced
map to `O_T`. It is left adjoint to forgetting a log structure to its prelog structure. The API is
`AssociatedLog.unit` (the canonical prelog map `M → M^a`), `AssociatedLog.lift_unique` (prelog maps to a
log structure factor uniquely through `M^a`) and `AssociatedLog.idempotent` (logification of a log
structure is itself) (Kato, §1.3 with the pushout description, printed p. 193). *Needs:*
CrystallineCohomology CR.5:log-algebra.1, “Associated log structures”; `LogStructure`.

**Checks.**

- `AssociatedLog.trivialMonoid`: logifying the one-element chart gives `O_T^×`, the trivial log
  structure.
- `AssociatedLog.coordinate`: logifying `ℕ → O`, `n ↦ zⁿ` on a disc gives characteristic monoid `ℕ` at
  `z = 0` and `0` elsewhere.
- `AssociatedLog.unitChart`: a chart whose generators all map to units logifies to the trivial log
  structure.

Use shared inverse image as `LogPullback`: for a morphism of ringed sites `f : T → S` and a log structure `M` on `S`,
`f^*M` is the logification of `f⁻¹M → f⁻¹O_S → O_T`. It is not `f⁻¹M`: units of `O_T` may come from
non-units of `O_S`. The API is `LogPullback.chart` (a chart pulls back by composing with the ring map
and logifying), `LogPullback.identity` and `LogPullback.composition` (the canonical isomorphisms)
(Kato, §1.4 and §1.6, printed pp. 193–195). *Needs:* CrystallineCohomology
CR.5:log-algebra.1, “Inverse image log structures”; `AssociatedLog`.

**Checks.**

- `LogPullback.openComplement`: the divisorial structure of `z = 0` on a disc pulls back to the trivial
  structure on `{z ≠ 0}`.
- `LogPullback.origin`: its pullback to the origin is the standard log point `ℕ → ℂ`, `1 ↦ 0`.
- `LogPullback.trivial`: the pullback of a trivial log structure is trivial.

Use the shared fine-chart carrier as `FineLogChart`. A commutative monoid is integral if it is cancellative (equivalently, it injects
into its group completion `GrothendieckGroup`), fine if integral and finitely generated, saturated if
integral and `x ∈ P^gp`, `nx ∈ P` for some `n ≥ 1` imply `x ∈ P`. A chart for a log structure `M` is a
fine monoid `P` with a map `P → M` whose logification is an isomorphism (kept as data); `M` is fine if
such charts exist étale locally. Fine does not imply saturated. The API is
`FineLogChart.groupCompletionEmbedding` (integral monoids embed in their group completion),
`FineLogChart.logificationIso` (the chosen chart logifies to `M`) and `FineLogChart.etaleLocal` (fine
charts exist étale locally and pull back along `LogPullback`); the monoid conditions are
`LogCrystalline.IsFineMonoid` and `LogCrystalline.IsSaturatedMonoid` (Kato, §2.1–2.5 and §2.9–2.10, printed pp. 197–200, for
integral and fine monoids and charts; Kato does not use saturation, which is recorded here only to
make explicit that nothing below assumes it). For `LogCrystalline.IsFineMonoid`, the API projects cancellation
and finite generation, transports fineness along monoid isomorphisms, and proves fineness of
finite products. For `IsSaturatedSubmonoid`, the API identifies it with
`AddSubmonoid.NSMulSaturated` in the generated subgroup, transports it along group isomorphisms,
and agrees with `LogCrystalline.IsSaturatedMonoid` for the multiplicative form of the
submonoid. These use the intrinsic group, rather than any chosen larger ambient group.
*Needs:* CrystallineCohomology CR.5:log-algebra.1, “Integral monoids”, “Fine monoids”,
“Saturated monoids” and “Log charts”; `AssociatedLog`; `LogPullback`; Mathlib `Monoid.FG`, `GrothendieckGroup`.

**Checks.**

- `FineLogChart.free`: `ℕʳ` is fine and saturated, including `r = 0`.
- `FineLogChart.unsaturated`: the submonoid of `ℤ` generated by `2` and `3` is fine but not saturated
  (`1 ∈ P^gp` and `2·1 ∈ P`, but `1 ∉ P`).
- Saturation is intrinsic: `2ℕ ⊆ ℤ` is saturated in its generated group `2ℤ`, despite
  `2·1 ∈ 2ℕ` and `1 ∉ 2ℕ`. Testing roots in all of `ℤ` would wrongly exclude it.
- `FineLogChart.noncancellative`: the additive monoid `ℕ ∪ {∞}` with `∞` absorbing is finitely
  generated (by `1` and `∞`) but not integral, since `0 + ∞ = 1 + ∞` while `0 ≠ 1`.

Specialize `LogCrystalline.divisorialLog` as `DivisorialLog D` for a smooth scheme `X` with a strict normal crossings divisor `D` and
`j : U = X ∖ D → X`: the subsheaf `M_D ⊆ (O_X, ·)` of functions invertible on `U`. Locally, with
`D = {z₁ ⋯ z_r = 0}`, it is the logification of `ℕʳ → O_X`, `eᵢ ↦ zᵢ`, so it is fine and saturated. The
API is `DivisorialLog.chart` (at an `r`-fold crossing the chart is `ℕʳ`), `DivisorialLog.offBoundary`
(trivial on `U`) and `DivisorialLog.changeEquation` (multiplying a local equation by a unit gives the
same structure) (Kato, §1.5(1), printed p. 194, and Example 2.5(1), pp. 197–198). *Needs:*
CrystallineCohomology CR.5:log-algebra.4, “Divisorial log structures”
(`LogCrystalline.divisorialLog`); `FineLogChart`;
ResolutionOfSingularitiesCharacteristicZero §6.2 (`sncCompactification`, SNC boundaries).

**Checks.**

- `DivisorialLog.empty`: the empty divisor gives the trivial log structure.
- `DivisorialLog.oneBranch`: at a smooth boundary point the characteristic monoid is `ℕ`.
- `DivisorialLog.crossing`: at the origin of `xy = 0 ⊂ A²` the characteristic monoid is `ℕ²`, not `ℕ`.

On the algebraic side use `LogCrystalline.logDifferentials` from CrystallineCohomology CR.5.1: for a morphism of prelog rings `(A, Q) → (B, P)` (structure maps
`α : P → B`, `β : Q → A`), `Ω¹_log = (Ω¹_{B/A} ⊕ (B ⊗_ℤ P^gp)) / R`, where `R` is generated by
`dα(p) − α(p) ⊗ p` for `p ∈ P` and `1 ⊗ q` for `q` in the image of `Q`; write `dlog p` for the class of
`1 ⊗ p`. It carries the universal pair `(d, dlog)` with `dα(p) = α(p) dlog p` and
`dlog(pp') = dlog p + dlog p'`; it glues on the ringed site, is invariant under logification, satisfies
log base change, and is coherent for fine charts of finite type. The API is
`LogCrystalline.logDifferentials.lift` (maps out classify log derivations), `LogCrystalline.logDifferentials.d_alpha`
(`dα(p) = α(p) dlog p`) and `LogCrystalline.logDifferentials.dlog_mul`
(`dlog(pp') = dlog p + dlog p'`), with the supplier's log base-change isomorphism (Kato,
§1.7–1.8, pp. 195–196, and §2.1, p. 197; Qian, arXiv:2103.00106, Proposition 3.6,
pp. 18–19). *Needs:* CrystallineCohomology CR.5.1, “Logarithmic differentials”;
`PrelogStructure`; `AssociatedLog`; `FineLogChart`; Mathlib `KaehlerDifferential`,
`GrothendieckGroup`.

**Checks.**

- `LogCrystalline.logDifferentials.trivial`: for trivial log structures `Ω¹_log = Ω¹_{B/A}`.
- `LogCrystalline.logDifferentials.logpoint`: for the standard log point over `ℂ` with trivial structure,
  `Ω¹_log = ℂ · dlog t` although `Ω¹_{ℂ/ℂ} = 0`.
- `LogCrystalline.logDifferentials.relativeLogpoint`: for the identity of the standard log point the relative module
  is `0`; omitting the base relation `1 ⊗ q` gives `ℂ · dlog t` and fails.

The algebraic quotient and its relation submodule are the supplier's construction.
The map `logAnalytification.logDifferentialsIso` compares them with the quotient
built from the holomorphic cotangent sheaf, through the analytic log-derivation pair. For a chart
`Q → P`, the base relation kills the image of `Q`, not an independently selected subgroup.
On the standard log point it kills `dlog t` for the identity base map, while the trivial
base imposes no such relation (Kato, §1.7–1.8, pp. 195–196).

Use `LogCrystalline.IsLogSmooth` as `LogSmooth`: a morphism of fine log schemes `f : X → Y` is log smooth if its underlying map is
locally of finite presentation and every square-zero lifting problem with an exact closed immersion
(the source log structure is the pullback of the target's) on the left has a solution étale locally on
the test object; log étale if the solution is moreover unique. Fibre products are taken in the fine
category (integralizing when needed). The API is `LogSmooth.lift` (the lifting property),
`LogSmooth.strict_iff` (for strict `f`, log smooth iff smooth) and `LogSmooth.baseChange` (stable under
fine base change) (Kato, Definitions 3.1–3.3, pp. 200–201; Proposition 3.8, p. 203, for the strict
case; (2.8), p. 199, for fine fibre products). *Needs:* CrystallineCohomology
CR.5:log-algebra.2–.3, “Log fiber products” and “Log smooth morphisms”; `FineLogChart`;
`LogCrystalline.logDifferentials`; Mathlib `Algebra.FormallySmooth`.

**Checks.**

- `LogSmooth.identity`: the identity of a fine log scheme is log étale.
- `LogSmooth.trivialStructures`: with trivial log structures, log smooth is smooth.
- `LogSmooth.semistableChart`: `Spec ℂ[x, y, t]/(xy − t)` with chart `ℕ²` over the base chart
  `ℕ → ℕ²`, `1 ↦ (1, 1)` is log smooth over the `t`-line with its divisorial structure, although its
  central fibre `xy = 0` is singular.

Use the Kato chart criterion of CrystallineCohomology CR.5:log-algebra.3 as `logChartCriterion`: a morphism of fine log schemes `f : X → Y` with a chart `Q → M_Y` is
log smooth if and only if étale locally on `X` there is a chart `Q → P` of `f` such that the kernel and
the torsion part of the cokernel of `Q^gp → P^gp` are finite of order invertible on `X`, and
`X → Y ×_{Spec ℤ[Q]} Spec ℤ[P]` is étale; `f` is log étale if and only if the same holds with the
whole cokernel finite of invertible order. Log smoothness implies that `Ω¹_log(X/Y)` is finite
locally free. No saturation is assumed (Kato,
Proposition 3.4, pp. 201–202, Theorem 3.5, p. 202, with Remark 3.6 and the proof 3.13,
pp. 202–205; Proposition 3.10, p. 203). *Needs:*
CrystallineCohomology CR.5:log-algebra.3, “Kato chart criterion”, and CR.5.1,
“Logarithmic differentials”; `LogSmooth`; `LogCrystalline.logDifferentials`.

On log schemes specialize `LogCrystalline.logDeRham` as `LogDeRham`: for a fine log morphism, `Ω^p_log = Λ^p Ω¹_log` with the differential extending the
universal log derivation by `d(dlog p) = 0` and the graded Leibniz rule; it is a complex of
`f⁻¹O_Y`-modules (`ℂ`-linear in the complex case), with finite locally free terms when `f` is log
smooth. It is bounded when moreover `X` is quasi-compact, since the locally constant rank of
`Ω¹_log` then takes finitely many values; log smoothness alone does not bound it (with trivial log
structures, `⊔_{n ≥ 0} Aⁿ_ℂ` over `Spec ℂ` is log smooth, see `AlgebraicDeRham.disjointUnion`). For
a divisorial structure with SNC boundary it is the classical `Ω^•_X(log D)` generated by the
`dzᵢ/zᵢ` and the remaining `dzⱼ`. The API is `LogDeRham.dlogClosed` (`d(dlog p) = 0`),
`LogDeRham.d_squared` (`d² = 0`) and `LogDeRham.SNC` (agreement with `Ω^•_X(log D)`) (Kato, §1.9, p. 196,
and Proposition 3.10, p. 203; the agreement with `Ω^•_X(log D)` follows from the chart formula (1.8),
p. 196; Qian, Proposition 3.6, pp. 18–19, uses it over the standard log point). *Needs:* CrystallineCohomology CR.5.1,
“Log de Rham complexes” (`LogCrystalline.logDeRham`); `LogCrystalline.logDifferentials`; `logChartCriterion`;
`AlgebraicDeRham`. Its analytic counterpart is the exterior complex of
`AnalyticLogDifferentials`, identified by `logAnalytification.logDifferentialsIso`
and the differential-operator comparison.

**Checks.**

- `LogDeRham.emptyBoundary`: for a trivial structure it is the ordinary de Rham complex.
- `LogDeRham.coordinate`: on the log line, `dz = z dlog z` and `dlog z` is closed.
- `LogDeRham.crossing`: on the smooth plane with SNC boundary `xy = 0`, `Ω¹_log` is free on `dlog x`, `dlog y`, and `Ω²_log` on
  `dlog x ∧ dlog y`.

Prove `logDifferentialTransitivitySplit`: for morphisms of fine log schemes `X → Y → S` with `X → Y`
log smooth, `0 → f^*Ω¹_log(Y/S) → Ω¹_log(X/S) → Ω¹_log(X/Y) → 0` is exact and locally split, with
`Ω¹_log(X/Y)` finite locally free; no smoothness of `Y → S` is needed. Taking exterior powers over the
standard log point gives the short exact sequence of log de Rham complexes used in C5.7 (Kato,
Propositions 3.10 and 3.12, printed pp. 203–204). *Needs:* `LogCrystalline.logDifferentials`; `LogSmooth`;
`logChartCriterion`.

**Checks for `logDifferentialTransitivitySplit`.**

- For an identity `X → X → S`, the last term is zero and the first map is the identity.
- With trivial log structures and `A²_ℂ → A¹_ℂ → Spec ℂ` the sequence splits as
  `ℂ[x,y] dx ⊕ ℂ[x,y] dy`, recovering ordinary smooth cotangent transitivity.
- For the log-smooth node `xy = 0` over the standard log point, the absolute module is
  free on `dlog x`, `dlog y`; the base generator maps to `dlog x + dlog y`, and the
  relative quotient imposes that sum equal to zero. Individual component residues
  are defined on the absolute module and do not descend to this relative quotient.

### C5.6 Regular singular connections and Deligne's Riemann–Hilbert theory

Define `RegularSingular`: an integrable algebraic connection `(E, ∇)` (finite locally free `E`) on a
smooth variety `U` of finite type over `ℂ` is regular singular if for every smooth curve `C` with a map
`C → U`, the pulled-back connection has, at each point at infinity of the smooth completion of `C`, a
lattice on which it has at most a logarithmic pole (Deligne 1970, II.4.1–4.6, printed pp. 85–91).
*Needs:* `Crystalline.Connection`; `DivisorialLog`; `LogCrystalline.logDifferentials`;
C4.5 `affineCurveCompletionInterface` on affine curve charts.

The internal order is the curve-condition definition, the analytic `CanonicalLogExtension`, then
the curve/logarithmic-lattice equivalence and compactification independence. The analytic extension
is constructed for every finite-rank complex local system, independently of algebraic regularity.

**Checks.**

- `RegularSingular.trivial`: `(O_U, d)` is regular singular on every smooth `U`.
- `RegularSingular.logarithmic`: `d + a dz/z` on `G_m` has logarithmic lattices at `0` and at `∞`.
- `RegularSingular.irregularInfinity`: `d + dz` on `A¹` is integrable but not regular singular at `∞`
  (in `w = 1/z` it is `d − dw/w²`, a double pole), so integrability does not imply regularity.

Define `CanonicalLogExtension`: for a local system `V` of finite rank on `U^an`, `U = X ∖ D` with `X`
smooth proper and `D` SNC, and a set-theoretic section `τ` of `ℂ → ℂ/ℤ` (for instance
`0 ≤ Re λ < 1`), the unique locally free extension `(Ē, ∇)` of `(V ⊗ O_{U^an}, d)` to `X^an` with
logarithmic poles whose residues along each component of `D` have eigenvalues in `τ`.
The initial bundle and its identification with the horizontal local system use the inverse and
unit of `analyticFlatConnectionLocalSystem`. Local monodromy
along a positive loop is conjugate to `exp(−2πi Res)`: the section `τ` excludes nonzero
integral differences between distinct residue eigenvalues. A matrix equality uses the chosen
fibre identification from the local logarithmic model, with its change-of-frame compatibility.
The extension is exact in `V`; tensor products need integer
shifts of residues, while the unipotent extension (nilpotent residues) is tensor compatible. Choose
logarithms of the commuting local monodromies with eigenvalues in `τ` and twist multivalued flat frames
by the corresponding exponentials; moderate growth glues and characterizes the extension. The API is
`CanonicalLogExtension.residueSpectrum` (residue eigenvalues in `τ`), `CanonicalLogExtension.monodromy`
(the conjugacy above, and equality with a retained fibre identification;
rank-one scalar `localMonodromy`; strip representatives `residueStripRep`) and
`CanonicalLogExtension.uniqueness` (uniqueness of an extension with the
strip condition) (Deligne 1970, II.5.1–5.6, printed pp. 91–96: the choice of `τ` in II.5.3, misnumbered
4.3 in print, and Proposition 5.4, p. 94; the monodromy in Corollary 5.6, p. 96).
*Needs:* `analyticFlatConnectionLocalSystem`; `DivisorialLog`; `AnalyticLogDifferentials`;
`logAnalytification`;
§C−1.4 (`analyticPolydisc`).

**Checks.**

- `CanonicalLogExtension.emptyBoundary`: with `D = ∅` the extension is `(V ⊗ O, d)` itself.
- `CanonicalLogExtension.rankOne`: residue `a` has monodromy `exp(−2πia)`.
- Under independent changes of basis on the boundary and nearby fibres, the two matrices
  need not be equal; their conjugacy class is unchanged.
- `CanonicalLogExtension.tensorCarry`: residues `3/4` and `3/4` add to `3/2`, whose strip representative
  is `1/2`; so the canonical extension with the strip `[0,1)` is not an unadjusted tensor functor.

Prove the logarithmic-lattice criterion for `RegularSingular`: on a smooth proper compactification
`X ⊇ U` with SNC boundary `D`, the curve condition is equivalent to the existence of a finite locally
free extension of `E` to `X` with logarithmic connection `Ē → Ω¹_X(log D) ⊗ Ē`, and it is independent
of the compactification. Use the analytic `CanonicalLogExtension` of the horizontal local system:
the curve condition makes its identification with `E^an` meromorphic along the boundary, by a
uniform pole bound from Baire category and extension across codimension two; proper GAGA then
algebraizes the lattice and connection. The API is `RegularSingular.restrict` (restriction to an
open), `RegularSingular.pullback` (pullback along morphisms of smooth varieties) and
`RegularSingular.tensor` (tensor products and duals) (Deligne 1970, II.4.1–4.6, printed pp. 85–91,
and II.5.1–5.9, pp. 91–98, with the replacement proof of II.4.1 in the author's 1971 erratum,
pp. 1–3). *Needs:* the curve-condition `RegularSingular` definition; `CanonicalLogExtension`;
`analyticFlatConnectionLocalSystem`; `DifferentialOperatorAnalytification`;
ResolutionOfSingularitiesCharacteristicZero §6.2 (`sncCompactification`) and
§C1.9 (`properSchemeGagaEquivalence`).

The residue-strip functions also have an elementary API. For `a ∈ ℂ`,
`residueStripRep a = a − floor(Re a)`; `residueStripRep_mem` proves membership in the half-open
strip and integer difference, and the API includes invariance under integer translation and
idempotence. The imaginary part is preserved. For `localMonodromy a = exp(−2πia)`,
`localMonodromy_add_int` proves integer invariance; the API includes nonvanishing and the
addition-to-multiplication law. These are the scalar normalizations of Deligne's residue
construction (II.5.3–5.6, pp. 94–96).

**Checks for residue-strip representatives.**

- At `a = 0` the representative is `0`; at `a = 1` it is again `0`, so the upper boundary is excluded.
- At `a = −1/4` it is `3/4`, with no change in the imaginary part for a non-real residue.
- At `a = 3/4 + 3/4` it is `1/2`, detecting the tensor carry.

**Checks for local monodromy.**

- Residue zero has monodromy `1`, as does every integer residue.
- Residue `1/2` has monodromy `−1`.
- Residue `1/4` has monodromy `−i`; this detects the negative sign in the exponent.

Prove `deligneRiemannHilbert`: for a smooth variety `U` of finite type over `ℂ`, analytification followed
by horizontal sections is an equivalence between the category of regular singular integrable algebraic
connections on `U` and the category of local systems of finite-dimensional complex vector spaces on
`U^an`; it is exact, fully faithful and compatible with tensor products and duals. In particular a
horizontal analytic morphism between regular singular algebraic connections is algebraic. Descent of
such tensors to a smaller field of definition is an additional arithmetic input not supplied here.
Use `analyticFlatConnectionLocalSystem` for the analytic horizontal-section functor, its rank
property, unit and evaluation counit, and its tensor/dual compatibility. On a smooth quasi-projective
`U`, take the canonical logarithmic extension on an SNC compactification
(`sncCompactification`), algebraize it and its logarithmic connection by proper GAGA
(`properSchemeGagaEquivalence` and `DifferentialOperatorAnalytification`), and algebraize horizontal
maps by moderate growth; a general `U` is covered by quasi-projective opens (Deligne 1970, II.5.7–5.9
and proof, printed pp. 96–98, with the corrected II.4.1; Caraiani–Scholze, *On the generic part of the
cohomology of compact unitary Shimura varieties*, arXiv:1511.02418v1, §2.3, PDF p. 17, which uses it
on a Hodge-type Shimura variety to make horizontal Hodge tensors algebraic).
*Needs:* `CanonicalLogExtension`; `analyticFlatConnectionLocalSystem`; `relativePoincare`;
`DifferentialOperatorAnalytification`;
§C1.9 `properSchemeGagaEquivalence`; ResolutionOfSingularitiesCharacteristicZero §6.2 `sncCompactification`;
SchemeAndStackFoundations Layer 1.

Prove `regularSingularDeRhamComparison`: for a smooth variety `U` of finite type over `ℂ` and a regular
singular integrable connection `(E, ∇)` with local system `V = (E^an)^∇`, `H^q_dR(U, (E, ∇)) ≅ H^q(U^an, V)`
for all `q`. For a smooth proper SNC compactification `j : U → X` and a logarithmic extension `Ē` whose
residue eigenvalues are not positive integers, `Ω^•_X(log D) ⊗ Ē → Rj_*(Ω^•_{U^an} ⊗ E^an)` is a
quasi-isomorphism (after analytification); an arbitrary logarithmic lattice need not compute the same
cohomology. On a boundary polydisc expand in Laurent series and contract the negative-exponent part with
the inverses of `k + Res` (available because no residue eigenvalue is a positive integer); then apply
`boundedOperatorHyperGaga` and the coefficient Poincaré lemma (Deligne 1970, Theorem II.6.2, printed
p. 98, and II.6.7–6.10 and proof, pp. 101–105, with II.3.13–3.15, pp. 80–85, for the passage from
logarithmic to meromorphic forms). *Needs:* `deligneRiemannHilbert`; `boundedOperatorHyperGaga`; `LogDeRham`;
`sheafSingularComparison`; `analyticFlatConnectionLocalSystem`; `relativePoincare`.

**Checks for `regularSingularDeRhamComparison`.**

- For the trivial connection on `G_m = P¹ ∖ {0, ∞}`, choose `z⁻¹ℂ{z}` at `0` and the
  unshifted lattice `ℂ{w}`, `w = 1/z`, at `∞`. The residues `(−1,0)` meet the comparison
  condition. Both terms of the logarithmic complex are `O_{P¹}(1)` and have no higher
  cohomology. In the global bases `(1,z⁻¹)` and `(dz/z,z⁻¹ dz/z)`, its differential has
  matrix `diag(0,−1)`, giving `H⁰ = H¹ = ℂ`.
- Replacing only the first lattice by `zℂ{z}` gives residues `(1,0)`. Both terms of the
  logarithmic complex are `O_{P¹}(−1)` and have zero cohomology, so its hypercohomology is zero.
- Using `e′ = z⁻¹` as a global frame instead gives residues `(−1,+1)`. Both terms are
  `O_{P¹}` and their global differential is multiplication by `−1` in the basis `dz/z`;
  this logarithmic complex is acyclic despite trivial monodromy at both boundaries.

### C5.7 Curves and the proper logarithmic comparison

Define `CurveLogComplex` for a smooth projective curve `C` over `ℂ`, a reduced finite set `D` of points
and `U = C ∖ D`: the logarithmic complex `Ω^•_C(log D) = [O_C → Ω¹_C(D)]` and the compact-support complex
`Ω^•_C(log D)(−D) = [O_C(−D) → Ω¹_C]`, with `ℂ`-linear differentials. The first computes `H^•_dR(U)`, the
second `H^•_c(U)`, and the inclusion of the second into the first induces the natural map
`H¹_c(U) → H¹(U)`, whose image is the parabolic cohomology. The local logarithmic Poincaré lemma
identifies the first complex with `Rj_*ℂ`. The second is identified with `j_!ℂ` by a local
computation: at `p ∈ D` with coordinate `z`, `d` maps `zℂ{z}` isomorphically onto `ℂ{z} dz`
(`z^{n+1} ↦ (n+1)zⁿ dz`), so the stalk at `p` is acyclic, as is `(j_!ℂ)_p`. The API is `CurveLogComplex.ordinary` (terms `O_C`,
`Ω¹_C(D)`), `CurveLogComplex.compactSupport` (terms `O_C(−D)`, `Ω¹_C`) and `CurveLogComplex.parabolic`
(parabolic `H¹` is the image of `H¹_c → H¹`) (Grothendieck 1966, Theorem 2, printed p. 97, for the
meromorphic de Rham complex; Deligne 1970, II.6.9–6.10, printed pp. 102–105, for the logarithmic
one; the compact-support identification is the computation just given). *Needs:* `LogDeRham`; `regularSingularDeRhamComparison`;
`affineCurveCompletionInterface`.

**Checks.**

- `CurveLogComplex.emptyBoundary`: for `D = ∅` the two complexes coincide with `Ω^•_C`.
- `CurveLogComplex.affineLine`: for `U = P¹ ∖ {∞}`, `H¹(U) = 0` and `H²_c(U)` is one-dimensional.
- `CurveLogComplex.torus`: for `U = P¹ ∖ {0, ∞}`, `H¹(U)` is spanned by `dz/z` and the parabolic `H¹`
  is `0`.

Prove `curveResidueLocalization`: in the setting of `CurveLogComplex`,
`0 → Ω^•_C → Ω^•_C(log D) → ⊕_{p ∈ D} ℂ_p[−1] → 0` is exact with `Res_p(a dz/z) = a` in a local
coordinate `z` at `p`. Its hypercohomology sequence is the de Rham localization sequence. Let `comp`
be the comparison given by `holomorphicPoincare` (`Ω^•_{C^an} ≃ ℂ`) and `CurveLogComplex`
(`Ω^•_C(log D)^an ≃ Rj_*ℂ`), and let the Betti residue `res_B : (R¹j_*ℂ)_p → ℂ` be evaluation on the
positively oriented loop around `p`. The analytified sequence maps to the Betti triangle
`ℂ_C → Rj_*ℂ → ⊕_{p ∈ D} (R¹j_*ℂ)_p[−1]` by `comp` on the first two terms and, on the third, by the
map whose composite with `res_B` is `2πi · Res_p`:
the square

```
H¹_dR(U)      ──Res──→  ⊕_{p ∈ D} ℂ
   │ comp                    │ 2πi
   ↓                         ↓
H¹(U^an, ℂ)  ──res_B──→  ⊕_{p ∈ D} ℂ
```

commutes, that is `res_B ∘ comp = 2πi · Res`, equivalently `Res = (2πi)⁻¹ · res_B ∘ comp`, and the
same factor `2πi` on the residue terms makes the connecting maps into `H²` of the two localization
sequences correspond under `comp`. The factor is the period `∮ dz/z = 2πi` of
`HolomorphicDeRham.torusPeriod`; the residue convention and the monodromy `exp(−2πia)` are unchanged.
The sum of residues of a global logarithmic form is `0`, compatibly with the trace; and
the pairing between compact-support and ordinary `H¹` induces the nondegenerate pairing on parabolic
`H¹` with the same normalisations (Deligne 1970, II.3.5–3.7, printed pp. 75–78, for the Poincaré
residue, and II.6.10, p. 105, for the identification with `Rj_*ℂ`; Grothendieck 1966, Theorem 2,
printed p. 97; the factor `2πi` is the stalk computation at `p`, where `H¹` of the logarithmic complex
is spanned by `dz/z`). *Needs:* `CurveLogComplex`; `holomorphicPoincare`;
`multiplicativePeriodInterface`; `boundedOperatorHyperGaga`.

**Checks.**

- `curveResidueLocalization.puncturedDisc`: on a disc around `p` with coordinate `z`, `dz/z` has de
  Rham residue `1` and Betti residue `∮ dz/z = 2πi`, so `res_B ∘ comp = 2πi · Res`; the reversed
  statement `Res = 2πi · res_B ∘ comp` would give `1 = (2πi)²`.
- `curveResidueLocalization.torus`: on `G_m = P¹ ∖ {0, ∞}`, `dz/z` has de Rham residues `(1, −1)` at
  `(0, ∞)` and positive local-loop periods `(2πi, −2πi)`; the positive loop around `∞` (positive in
  `w = 1/z`) is the circle `|z| = R` traversed clockwise.
- `curveResidueLocalization.residueSum`: on `P¹ ∖ {0, 1, ∞}`, `a dz/z + b dz/(z − 1)` has residues `a`,
  `b`, `−(a + b)` at `0`, `1`, `∞`, which sum to `0`.

Prove `properLogGagaMonodromy`: let `X` be a proper fine log-smooth log scheme over the standard log
point `0^† = (Spec ℂ, ℕ → ℂ, 1 ↦ 0)`. Through
`logAnalytification.logDifferentialsIso` and the differential-operator comparison,
analytification compares the hypercohomology of the relative log de Rham complex
`Ω^•_{X/0^†}` with the holomorphic exterior complex of `AnalyticLogDifferentials`
in every degree, and compares the exact
sequence of complexes `0 → Ω^•_{X/0^†}[−1] → Ω^•_{X/ℂ} → Ω^•_{X/0^†} → 0` (absolute log differentials
relative to the trivial base; the first map is `dlog t ∧ −`) together with its connecting endomorphism
`N` of `H^q(X, Ω^•_{X/0^†})`. The exactness comes from `logDifferentialTransitivitySplit`, the terms are
coherent with differential-operator differentials, the complexes are bounded because `X` is proper,
hence quasi-compact, and `boundedOperatorHyperGaga` applies; the sign of
`N` is fixed by the `dlog t ∧ −` map. This is a de Rham statement: no Kato–Nakayama Betti comparison is
claimed (Qian, arXiv:2103.00106, Theorem 1.8, pp. 3–4, and Proposition 3.6 and proof, pp. 18–19).
*Needs:* `LogDeRham`; `logAnalytification`; `logDifferentialTransitivitySplit`; `boundedOperatorHyperGaga`;
`DifferentialOperatorAnalytification`.

### Examples (C5.5–C5.7)

- On `P¹`, `dz/z` has residues `1` at `0` and `−1` at `∞`; on `G_m` the ordinary `H¹` is `ℂ`, its
  parabolic part is `0`, and the Betti residue of `comp[dz/z]` at `0` is `2πi` times its de Rham
  residue.
- For the identity of the standard log point the relative complex is `ℂ` in degree `0` and `N = 0`;
  over the standard log point the first map of the transitivity sequence is multiplication by `dlog t`.
- The semistable chart `xy = t` is log smooth with a singular central fibre, and the chart
  criterion does not require saturation.

### Dependencies

C0–C4; §§C−1.1–C−1.4/C1.9; AlgebraicModuliForArithmeticGeometry Layers 1–3;
ResolutionOfSingularitiesCharacteristicZero Layers 1–6 (resolution and SNC compactification);
SchemeAndStackFoundations (Layer 1, Layer 2 including §§2.19–2.20, §4.12, Layer 5); TauCetiRoadmap.DifferentialGeometry (Layers 0–3,
5, 6, 8, 9 and 12); TauCetiRoadmap.AlgebraicTopology (Stages 6 and 8); TauCetiRoadmap.PDE (Lanes A,
D and E); TauCetiRoadmap.AlgebraicVectorBundles (L0C); SmoothBundlesConnections B1.5, B2–B4, B6.1–B6.4;
CharacteristicClasses C1.5, C3; TauCetiRoadmap.JacobianChallenge (Layer C);
Tau Ceti `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.Conjugation`,
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`; Mathlib Kähler differentials, exterior powers,
derivations, monoids and group completions, `circleIntegral`.

<a id="c6"></a>

## Layer C6: Stratified topology, Riemann existence and Artin comparison

Use `complexSchemeAnalytification` from §C−1.1 on
finite-type complex schemes, and write `T_X` for its underlying topological space. This layer
owns the finite-stalk sheaf/native-local-system dictionary and constructible coefficients,
finite-cover equivalence, comparison-site morphism
and finite/adic Artin equivalences on that analytic carrier. Its algebraic coefficient and
operation suppliers are EtaleCohomologyFoundations §§F.0–F.4 and
EnhancedDerivedSheaves’ generic enhancement; coherent `O_X`-modules and de Rham complexes
retain the comparisons of C0–C5. The nearby-cycle and inertia compatibility of
LefschetzPencilsAndVanishingCycles §0.8a consumes these general equivalences.

### C6.0 Stratified topology of complex algebraic schemes

**Stratified topology of complex algebraic schemes — `complexAlgebraicTopology`.**
For separated finite-type `X/ℂ` and any prescribed finite algebraic stratification, construct
a finite compatible triangulation of `T_X`: a homeomorphism from a union of open simplices
in a finite simplicial complex, with each stratum a union of those simplices. In the proper
case the union is a finite subcomplex, giving a compact finite-polyhedron model of the reduced
carrier. No smoothness, irreducibility or reducedness is required for the topological theorem.
Prove that `T_X` is Hausdorff, locally compact, second countable, paracompact, locally
contractible and locally path-connected, has finite cohomological dimension for finite
coefficients, and is homotopy equivalent to a finite CW complex. Finite CW type means a
homotopy equivalence, not compactness of `T_X`.

Use `TauCeti.IsSemialgebraic` and its Boolean, product and polynomial inverse-image API,
and `TauCeti.IsSemialgebraicOn` for maps. Consume RealAlgebraicGeometry's cell and projection
theory and AffineMorseLefschetz A4's opening compact finite closed-family triangulation
foundation: its output is a finite simplicial complex `K`, a semialgebraic homeomorphism
`|K| ≅ S`, and subcomplexes for the prescribed closed subsets. Its compatible subdivision
maps realize the identity on `S` and preserve those subcomplexes. The dimension comparison
is that leaf's API; no complement duality or Lefschetz application is consumed.

Construct here the extension to noncompact locally closed semialgebraic sets and finite
locally closed strata. After a bounded semialgebraic embedding, in the compact closure
record the closures and boundaries of the locally closed pieces as closed subsets; apply
the supplied closed-family theorem and express each piece as a difference of subcomplexes,
hence a union of open simplices. Retain the ambient finite complex and the selected open
simplices, rather than asserting that this union is compact. Construct common compatible
refinements, with realization homeomorphisms over the original space and subdivision maps
on cochains commuting with stratum restrictions. Pass from affine algebraic charts in
`ℂⁿ = ℝ²ⁿ` to separated schemes by finite gluing: identify chart-overlap maps with the
algebraic coordinate changes, refine on the overlaps, and prove that the resulting realization
maps glue to a homeomorphism over `T_X`. Prove cover/refinement independence and the finite
CW and finite-cohomological-dimension consequences used by Artin comparison. For arbitrary finite-type `X`
use finite affine covers to prove local compactness, local contractibility and local path
connectedness, and also second countability and finite cohomological dimension via the
finite-cover cohomology bound. Hausdorffness, global triangulation and the preceding global
finiteness package are asserted for separated `X`.

*Source:* Hironaka, *Triangulations of algebraic sets*, Proc. Sympos. Pure Math. 29 (1975),
165–185; Bochnak–Coste–Roy, *Real Algebraic Geometry*, §9.2, Theorem 9.2.1
(triangulation compatible with a finite family); SGA 1 XII §§1–3 for analytification's
local topology and separatedness.
*Needs:* §C−1.1; the pinned semialgebraic carriers;
RealAlgebraicGeometry Layers 3, 6; AffineMorseLefschetz A4's compact triangulation leaf;
AlgebraicTopology's simplicial and CW topology. The noncompact/locally-closed extension,
algebraic chart gluing and finiteness consequences just specified are constructed here.

**Checks.**

- A nodal complex curve is locally contractible at its singular point.
- `A¹_ℂ` has the homotopy type of a point despite being noncompact; its finite ambient
  triangulation selects open simplices, not a compact realization of the whole ambient complex.
- On `P¹` stratified by `{0}`, `{∞}` and `ℂ*`, the point strata are subcomplexes and the
  locally closed open stratum is a difference of subcomplexes. The two affine charts have
  inversion as overlap map; their compatible refinement maps realize that same identification.
- The affine line with doubled origin has the stated local topology and is not Hausdorff.

### C6.1 Local-coefficient and constructible topological cohomology

**Local-coefficient and constructible topological cohomology — `topologicalCoefficientComparison`.**
For finite commutative `Λ`, build the category of finite `Λ`-local systems as locally
constant topological module sheaves. On locally path-connected, semilocally simply connected
spaces identify it with `FiniteModuleLocalSystem Λ T`, the finite-stalk full subcategory of
`TauCeti.LocalCoefficientSystem Λ T`, not a separate functor carrier. The unit/counit identify
the actual sheaf stalk at each vertex with `L.obj x` and match path maps with native
`transport`; use a basepoint only for a based representation statement. Supply stalks,
pullback, finite limits/colimits, extensions, tensor, dual and path-change coherence using
the native constant/evaluation/monodromy and identity/composition/homotopy pullback maps.

Consume AlgebraicTopology Stage 6.1's direct coefficient complex: in degree `n` it is
`∏_σ L.obj(σ(v₀))`. Its first face term is transported from `σ(v₁)` back to `σ(v₀)`
by the inverse of the native first-edge transport; the other face terms keep `v₀` and the
alternating signs. The supplier owns the square-zero, pullback, homotopy, pair, excision,
Mayer–Vietoris and tensor-paired cup identities. Its comparison with the pinned Hom-from-
twisted-chains complex identifies cochains for the dual system with that Hom complex;
identifying direct `L` with a double dual requires a displayed reflexivity isomorphism.
No projectivity or reflexivity is imposed on finite coefficients here or in Artin comparison.
For constant coefficients consume C5.1's `SmallSingularCochains` and `sheafSingularComparison`
and Tau Ceti's ordinary singular complex and cup product.

On locally contractible paracompact spaces construct the sheaf resolution by direct
small local cochains using C5.1’s neighbourhood nestings: trivialize the local system on
small opens, use the constant resolution there, and glue using its actual transport maps. Prove the augmentation preserves
vertex fibres, local exactness, acyclicity and the quasi-isomorphism from the supplier's
all-singular direct complex to global sections. This gives the natural derived sheaf/singular
comparison for these local systems. C6.1 owns this sheaf/native-functor dictionary and
resolution on this domain; AlgebraicTopology Stages 2.6 and 6.1 own generic coefficient
functors and direct cochains. Apply the bridge to the analytic carrier and constructible strata.
For a finite triangulation compatible with a finite constructible stratification, construct
stratified cochains using the sheaf's restriction
and specialization maps, and prove their derived comparison with sheaf cohomology for
bounded constructible complexes. These coefficients need not be locally constant across
strata. Prove compatibility with restriction and finite open-cover descent; the local-system
resolution and descent also give ordinary comparison on the possibly non-Hausdorff `T_X`
of a finite-type complex scheme using its finite affine cover.

On locally compact Hausdorff spaces use TopologicalSheafCohomology TS3.1–TS3.3's native
topological `j_!`, its stalks, exactness, adjunction, restriction and composition, and its
c-soft construction of `RΓ_c`, compactification comparison and localization maps. These
are the canonical sheafified extension by zero and derived compact-support functor.
For locally proper separated continuous maps between such spaces that are also paracompact
and locally contractible, construct `Rf_!` here with composition, proper agreement, base
change and the supplied open/localization specializations. On the finitely triangulated
constructible domain prove comparison with compactly supported stratified cochains and,
for local systems, compact singular cochains. On finite-dimensional locally finite Hausdorff
CW pairs identify the latter map with TS3.7's sheaf/singular bridge through
CharacteristicClasses C1.2/S0–S4 and C5.1's constant resolution, including the actual
augmentations and compact-support enlargement maps. Compare pair triangles under S5's
controlled-collar hypotheses and retain their connecting signs and coefficient naturality.
The complexes are bounded with finite cohomology over `Λ`; they are perfect when the
coefficient complex has a uniform finite Tor interval at its stalks. All maps retain
coefficient change, cup/external products and coherent finite group actions.

*Source:* Dimca, *Sheaves in Topology*, §§2.1–2.5, §3.2 and §4.1 (local systems,
proper supports and constructibility); Sella, Theorem and Lemma 0.1, pp. 2–4, for the
constant ordinary resolution used in C5.1; Hatcher, §3.H, printed pp. 333–334, for direct
local cochains. The transport-preserving sheaf equivalence, local-system resolution and
stratified cochain construction are the extensions specified here.
*Needs:* §C6.0; the native `TauCeti.LocalCoefficientSystem` and its finite-stalk restriction;
AlgebraicTopology Stages 2.6 and 6.1; UniversalCovers' groupoid/cover classification; C5.1; the singular suppliers
in *Exact supplier contracts*; EnhancedDerivedSheaves §§0.1–0.4 on topological
module sheaves, including `ClassicalDerived.tensorHom` and `ClassicalDerived.functorCoherence`;
TopologicalSheafCohomology TS3.1–TS3.3 and TS3.7, with CharacteristicClasses C1.2/S0–S5
on the stated common support and CW domains.

**Checks.**

- A rank-one `𝔽₃`-local system on `ℂ*` with monodromy `−1` is retained as a nonconstant
  object; its degree-zero global sections are zero.
- On `ℂ*`, a rank-one `𝔽₅` system with positive-loop transport `2` has dual transport
  `3 = 2⁻¹`. The sheaf/native unit identifies transport `2` itself, while direct cochains'
  first-face term uses the reverse-edge transport `3`. Testing just the vanishing cohomology
  groups would not distinguish the two systems.
- Constant coefficients retain C5.1's augmentation and the ordinary singular cup product.
- On a point, the finite nonprojective module `ℤ/2` over `ℤ/4` has direct degree-zero
  cochains and sheaf sections equal to that module, and higher cohomology zero; the comparison
  requires no projectivity. It does not replace the coefficient module by its dual.
- A skyscraper at a closed point uses its point stratum and has no local-system extension
  across that point as a locally constant sheaf.
- For `j : (0,1) ↪ ℝ`, `j_!Λ` has zero stalk at each endpoint. Its compact-support
  comparison uses TS3.1's extension functor and TS3.3's localization, rather than a
  local-system extension over the endpoints.
- On the oriented interval pair `([0,1],{0,1})`, TS3.7 and the singular comparison send
  the relative fundamental interval to boundary `[1]−[0]`; every coefficient map preserves
  this sign and the connecting map.
- On a point, `ℤ/2` over `Λ = ℤ/4` has bounded cohomology but is not perfect.

### C6.2 Riemann existence for finite-type complex schemes

**Riemann existence for finite-type complex schemes — `riemannExistence`.**
For every finite-type `X/ℂ`, analytification induces an equivalence between finite étale
`X`-schemes and finite topological covering spaces of `T_X`. Include singular, nonreduced,
disconnected and nonseparated `X`. Construct full faithfulness and essential surjectivity
by finite-cover analytic algebraization, building extension across compactification
boundaries, finite analytic algebras, and descent to singular charts as needed for that
construction. Glue the affine-local equivalences. Use the existing analytification functor
and UniversalCovers' topological covering API.

The equivalence commutes with pullback, fibre products, disjoint unions and connected
components, identifies Galois covers and deck groups, and identifies finite lisse
`Λ`-sheaves with finite topological local systems. For a connected nonempty `X` and a
chosen complex point identify the étale fundamental group with the profinite completion
of the topological fundamental group, using the same fibre functor and deck-action
convention. Unbased and disconnected statements use groupoids; identity and composite
path changes, tensor operations and coefficient changes commute with this equivalence.

*Source:* SGA 1 XII, Theorem 5.1, with §§2–3 for components and finite/étale analytification.
*Needs:* §C−1.1; §§C6.0–C6.1;
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`,
`VanishingCycles.constructibleEtale`; UniversalCovers; the coherent algebraization tools
of C0–C4 for the finite-cover analytic algebraization constructed in this target.

**Checks.**

- `z ↦ zⁿ` on `ℂ*`, `n ≥ 1`, gives the cyclic degree-`n` cover and its cyclic deck group.
- A nilpotent thickening induces the same finite-cover category on both sides.
- A disconnected finite cover retains its components and their fibrewise cardinalities.

### C6.3 Finite-level Artin comparison for constructible coefficients

**Finite-level Artin comparison for constructible coefficients — `artinComparison`.**
For every finite-type `X/ℂ`, finite commutative `Λ` and `K ∈ Dᵇ_c(X_ét,Λ)`, construct
the site morphism `ε_X : (T_X)_lh → X_ét` by analytifying étale maps as local
homeomorphisms. The small local-homeomorphism site with jointly surjective covers has
the same sheaf category as the open-set site of `T_X`; prove and use this equivalence.
Define `K^an = ε_X^*K`, preserving stalks, finite lissity and constructibility.
Its derived tensor and coefficient-change maps retain the Tor bounds needed to stay
bounded; dual comparisons carry the supplier's perfect-source hypotheses. The unit gives the canonical comparison
`RΓ_ét(X,K) → RΓ(T_X,K^an)`; prove it is an equivalence of enhanced derived
`Λ`-module objects, natural in `X` and `K`. No smoothness, properness or separatedness
hypothesis is imposed on `X`.

Prove comparison through elementary fibrations. Construct `U ⊂ Ubar → S` with
`Ubar → S` a smooth projective relative curve with geometrically connected fibres and
`Ubar ∖ U → S` finite étale with nonempty fibres. For every point of a positive-dimensional
smooth complex variety of dimension `d`, build a Zariski neighbourhood admitting such a
fibration over a smooth base of dimension `d−1`: supply the projective embedding,
normalization, generic projection, shrinking and boundary arguments. Dimension zero
is the separate point/finite-disjoint-union base case. For finite lisse coefficients
prove degree-zero/one fibre and higher-direct-image comparison, higher vanishing and
monodromy agreement. Leray and dimension induction give the smooth lisse comparison.
Noetherian stratification, finite direct images, localization and induction give the
constructible case. Use bounded truncations to export this comparison on `Dᵇ_c`.
Its restriction to `Dᵇ_ctf` is the same canonical map; arbitrary truncations are not
asserted to remain ctf. The ctf restriction supplies the Tor-sensitive tensor/Künneth,
relative and adic interfaces below, with their stated additional hypotheses.

Supply ordinary singular corollaries for finite local systems and constant finite abelian
groups from the ambient `Dᵇ_c` theorem and C6.1, viewing a finite abelian `A` as a finite
`ℤ/n`-module for an annihilator `n`; this does not assert finite Tor dimension over `ℤ/n`.
State the comparison and its inverse, and coherent compatibility with coefficient maps,
localization and its connecting morphisms, twists and finite group actions throughout
`Dᵇ_c`. Cup/external products, ordinary Künneth and derived coefficient reduction retain
the supplier's Tor and boundedness hypotheses. These maps agree on the ctf restriction.

*Source:* SGA 4 XI §4, especially §4.6 (elementary fibrations), and XVI §4 (comparison);
Milne, *Lectures on Étale Cohomology*, §21, Theorems 21.1, 21.5, Definition 21.7 and
Proposition 21.8, pp. 130–134, for the smooth induction.
*Needs:* §§C6.0–C6.2 and §C−1.1;
EtaleCohomologyFoundations §§F.0–F.3 (the constructible/ctf categories, cohomology, base-change,
local-acyclicity, fibre-transport, dimension, finiteness and ordinary Künneth contracts above);
SchemeAndStackFoundations §§2.1–2.2 (site functors and Leray);
EnhancedDerivedSheaves §§0.1–0.4 and EtaleCohomologyFoundations §0.7 / `ClassicalAlgebraic.supportLocalization`.
Its localization and finite-open Mayer–Vietoris use étale module coefficients.

**Checks.**

- On `G_m`, `H¹(ℤ/n) = ℤ/n`; with `ζ_n = exp(2πi/n)` the Kummer class of the coordinate
  evaluates as `1` on the positive loop through the root-of-unity coordinate.
- A singular finite-type complex scheme is admitted without choosing a manifold structure.
- On `Spec ℂ` with `ℤ/2` coefficients the comparison is the canonical identity in degree zero.
- On `Spec ℂ`, take `Λ = ℤ/4` and `K = (ℤ/2)[0]`. The periodic free resolution with
  differential multiplication by `2` gives `Tor_i^Λ(ℤ/2,ℤ/2) = ℤ/2` for every `i ≥ 0`.
  Thus `K` lies in `Dᵇ_c` and comparison is the identity, while `K` is outside `Dᵇ_ctf`.
- The constant group `ℤ/2 ⊕ ℤ/4`, viewed over its annihilator ring `ℤ/4`, also lies outside
  ctf and is covered by the ambient theorem and its singular corollary.

### C6.4 Compact-support Artin comparison

**Compact-support Artin comparison — `artinComparisonCompactSupport`.**
For separated finite-type `X/ℂ`, finite commutative `Λ` and `K ∈ Dᵇ_c(X_ét,Λ)`,
construct the canonical equivalence
`RΓ_c,ét(X,K) → RΓ_c(T_X,ε_X^*K)` using EtaleCohomologyFoundations §§G.1–G.3's compactifications,
proper analytic comparison and the exchange with topological `j_!`. Prove independence
of compactification by the refinement comparisons and their cocycle. Supply the local-system
and constant compact singular corollaries from this ambient theorem via §C6.1.
The ctf restriction uses the same exchange map and refinement comparisons, and supplies
the finite-Tor compact-support and adic interfaces. The source and target are the
compact-support constructions, not the cohomology of coherent modules with proper support.

The equivalence commutes with proper pushforward, open extension by zero, localization
triangles and their connecting maps, coefficient maps, twists and finite group actions
on `Dᵇ_c`. Compact-support external products/Künneth and derived coefficient change
carry their supplier's Tor and boundedness hypotheses; all compatibilities restrict
to ctf. For complex conjugation use the
conjugate scheme and the transported coefficient object together with the induced continuous
homeomorphism; track its action on orientation and root-of-unity coordinates. Arbitrary
abstract field automorphisms of `ℂ` do not supply continuous maps on the classical topology.

*Source:* SGA 4 XVII §§3–5; SGA 4½, *Théorèmes de finitude*, §§1–2;
SGA 4 XVI §4's comparison applied to a proper compactification.
*Needs:* EtaleCohomologyFoundations §§G.1–G.3, §§C6.0–C6.3; §C−1.1’s analytic
properness API; EtaleCohomologyFoundations §§F.2–F.3 /
`VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`,
`VanishingCycles.compactSupportFiniteness`, `VanishingCycles.etaleKunnethCompactSupport`;
EtaleCohomologyFoundations §§0.7–0.8 / `ClassicalAlgebraic.supportLocalization`,
`ClassicalAlgebraic.properSupports` with §F.2's `VanishingCycles.properBaseChange`.

**Checks.**

- `H⁰_c(A¹,Λ) = 0` on both sides, although ordinary `H⁰` is `Λ`.
- On the proper point `Spec ℂ`, compact comparison for `Λ = ℤ/4` and `K = (ℤ/2)[0]`
  is the same identity as ordinary comparison; its infinite Tor dimension excludes only
  the ctf restriction, not the compact singular corollary.
- The localization sequence for `G_m ⊂ A¹` has the same connecting map after comparison.
- Conjugation on `P¹` reverses its complex orientation; the comparison transports the
  coefficient/twist coordinate with this action, rather than declaring it trivial.

### C6.5 Proper and lower-shriek relative Artin comparison

**Proper and lower-shriek relative Artin comparison — `relativeArtinComparison`.**
Let `f : X → Y` be a morphism between finite-type complex schemes, `Λ` finite
commutative and `K ∈ Dᵇ_ctf(X_ét,Λ)`. If `f` is proper, the canonical exchange
`ε_Y^* Rf_*K → R(f^an)_* ε_X^*K` is an equivalence. If `f` is separated and finite
type, prove the lower-shriek exchange
`ε_Y^* Rf_!K → R(f^an)_! ε_X^*K` is an equivalence. For nonseparated `Y`, construct
the analytic lower-shriek functor and exchange on Hausdorff affine base opens, where `X`
is separated over `ℂ`, and prove effective gluing with identity/composition coherence.
Thus no global Hausdorff hypothesis on `Y` is added to the relative theorem.

Both equivalences identify fibre/stalk comparisons, coefficient maps, cups, twists and
finite group actions and commute with base-change transformations and composition. On a
lisse higher-direct-image stratum, intertwine transport along a supplied topological/étale
path under §C6.2. A path choice is retained; no canonical comparison of unrelated fibres
is inferred. Proper agreement identifies the two exchanges when `f` is proper.

*Source:* SGA 4 XII, XVI §4 and XVII §§3–5 (proper exchange, comparison and lower shriek);
the stalk proof uses §§C6.3–C6.4 and proper/lower-shriek base change.
*Needs:* §§C6.0–C6.4; EtaleCohomologyFoundations §§F.2–F.3 /
`VanishingCycles.properBaseChange`, `VanishingCycles.smoothBaseChange`,
`VanishingCycles.localAcyclicity`, `VanishingCycles.lisseDirectImageTransport`,
`VanishingCycles.etaleCompactSupports`, `VanishingCycles.etaleFiniteness`,
`VanishingCycles.compactSupportFiniteness`; EnhancedDerivedSheaves §§0.1–0.4 /
`ClassicalDerived.functorCoherence`; EtaleCohomologyFoundations §§0.7–0.8 /
`ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.properSupports`.

**Checks.**

- For proper `f`, the lower-shriek exchange agrees with the ordinary proper exchange.
- For an open immersion the theorem gives the topological `j_!` exchange.
- For a smooth proper family, the comparison commutes with the transport along each
  specified path, including a loop with nontrivial monodromy.

**Smooth trace under Artin comparison — `artinSmoothTrace`.**
For a separated smooth morphism `f : X → Y` of relative pure dimension `d` between
finite-type complex schemes, `n > 0` and `Λ = ℤ/n`, prove that the lower-shriek exchange
of `relativeArtinComparison` identifies EtaleCohomologyFoundations §0.11's
`ClassicalAlgebraic.smoothTrace : Rf_!Λ_X(d)[2d] → Λ_Y` with the topological trace:
`ε_Y^*(Tr_f) = Tr_(f^an) ∘ Ex_!` after the twist and shift identifications.
Construct the topological trace by the relative complex orientation on smooth analytic
charts and oriented fibre integration in sheaf cohomology, with descent over Hausdorff
affine base opens as in the relative exchange. Use the Kummer coordinate
`exp(2πi/n)` of C6.3 and degree `+1` point classes, so the positive orientation generator
of `H²_c(ℂ,Λ(1))` has trace `1`. Prove compatibility with open restriction, base change,
composition and coefficient reduction `ℤ/n → ℤ/m` for `m > 0` dividing `n`.
The comparison follows from the Kummer/localization normalization on the affine line,
products for affine space, finite étale trace as summation and smooth étale charts.

*Source:* SGA 4 XVI §4 and XVIII §§2–3, especially 2.8–2.10 and Theorem 3.2.5
(trace normalization, composition and smooth charts).
*Needs:* §§C6.3–C6.5 (`relativeArtinComparison`, cups, Kummer and localization);
EtaleCohomologyFoundations §0.11 (`ClassicalAlgebraic.smoothTrace`); §C6.1's
sheaf–cochain comparison and the relative complex orientation.

**Checks.**

- The identity morphism in relative dimension zero has identity trace on both sides.
- On `P¹ → Spec ℂ`, `c₁(O(1))` has trace `1`; open restriction gives the positive
  compact-support generator on `A¹`, with the same sign.
- On `A¹ ⊔ A¹ → Spec ℂ`, `H²_c(Λ(1)) = Λ²` and trace is addition, including when
  `n = 2`; trace is not an isomorphism for disconnected fibres when `n > 1`.
- For `A² → A¹ → Spec ℂ`, the composite trace equals the iterated trace and this
  identity survives every coefficient reduction.

### C6.6 Integral and rational Artin comparison

The topological adic realization and both integral and rational Artin equivalences are owned
here. The étale normalized-system category and classical/pro-étale realizations are those of
EtaleCohomologyFoundations §F.4, and the generic limit/completion operations are those
of EnhancedDerivedSheaves §0.3.

**Integral and rational Artin comparison — `adicArtinComparison`.**
Fix a prime `ℓ`, finite-type `X/ℂ` and a normalized system `K_n ∈ Dᵇ_ctf(X_ét,ℤ/ℓⁿ)`,
`n ≥ 1`, with coherent derived reduction equivalences and uniform cohomological and Tor
intervals. Use EtaleCohomologyFoundations §F.4's unique étale adic category and
classical/pro-étale realizations. Construct the corresponding topological system
`ε_X^*K_n`, its derived `ℓ`-complete realization `K_Zℓ^an = Rlim_n ε_X^*K_n`, all
derived reductions and the rational object `K_Qℓ^an = K_Zℓ^an ⊗ᴸ_Zℓ Qℓ`.
These topological coefficient objects carry coherent maps and operations, not just a
sequence of unrelated sheaves.

Prove the canonical integral ordinary equivalence
`RΓ_ét(X,K_Zℓ) ≃ RΓ(T_X,K_Zℓ^an)`, and the compact-support equivalence for
separated `X`, then their rationalizations. Establish on the topological side the
cohomology/derived-limit comparisons and reduction equivalences using §C6.0's finite
triangulations and the uniform ctf bounds, keeping Milnor `lim¹`. Ordinary comparison
for possibly nonseparated `X` follows by finite affine-open descent of the separated
comparisons and their coherent limits. Rationalization commutes with these cohomology
functors on this bounded constructible domain. Preserve cups, ordinary and compact
Künneth on their proved domains, reduction at every level, twists, finite group actions
and lattice comparison when two lattices define the same rational coefficient object.
Carry `artinSmoothTrace` through the normalized systems: for separated smooth `f` of
relative pure dimension `d`, the compatible traces at `ℤ/ℓⁿ` define the integral
`Rf_!ℤ_ℓ(d)[2d] → ℤ_ℓ` comparison and, by rationalization, the `ℚ_ℓ` comparison.
Use §F.4's adic lower-shriek realization and the topological realization constructed
here; retain compatibility with every derived reduction, composition and base change.

For the constant system deduce integral and rational singular-cohomology corollaries;
the `Zℓ` and `Qℓ` coefficients on that side are the derived-limit and scalar-extension
constructions just given. On the finite CW/triangulated domain compare these with the
ordinary constant singular coefficient complex. Keep geometric fibre comparisons and
path-dependent transport separate from Frobenius or any identification of unrelated fibres.

*Source:* Bhatt–Scholze, *The pro-étale topology for schemes*, §§5–6, especially §§6.5,
6.7–6.8 (normalized realization, continuity and rationalization), combined with
§§C6.3–C6.5's finite comparisons and §C6.1's finite topological cochain construction.
*Needs:* §§C6.0–C6.5; EtaleCohomologyFoundations §F.4 /
`VanishingCycles.normalizedAdicSystems`, `VanishingCycles.classicalAdicRealization`,
`VanishingCycles.etaleProetaleAdicComparison`, `VanishingCycles.adicFiniteness`,
`VanishingCycles.rationalAdicRealization`, `VanishingCycles.adicFunctoriality`;
EnhancedDerivedSheaves §0.3 / `ClassicalDerived.inverseLimits`,
`ClassicalDerived.derivedCompletion`; the finite-level operations of §§F.0–F.3.

**Checks.**

- Every reduction modulo `ℓⁿ` of integral comparison is the finite comparison, and the
  squares for adjacent derived reductions commute.
- A torsion integral coefficient object becomes zero after rationalization on both sides.
- On `P¹`, degree two has rank one and the same Tate/orientation coordinate after comparison;
  its integral and rational traces send `c₁(O(1))` to `1`, reducing to `artinSmoothTrace` at every level.

### Dependencies

§C−1.1 supplies analytification; C0–C4 supply the
coherent algebraization used in §C6.2; C5.1 supplies the constant ordinary resolution.
EtaleCohomologyFoundations §§G.1–G.3 supply compactification geometry. C6.0–C6.5 use only the finite-level
étale foundations of EtaleCohomologyFoundations §§F.0–F.3, generic site cohomology
and Leray from SchemeAndStackFoundations §§2.1–2.2, and the enhancement/support functors
of EnhancedDerivedSheaves §§0.1–0.4 and EtaleCohomologyFoundations §§0.7–0.8. C6.6 additionally uses §F.4's adic
realizations and EnhancedDerivedSheaves’ generic derived limits/completion. UniversalCovers,
RealAlgebraicGeometry Layers 3, 6, AffineMorseLefschetz A4’s compact triangulation leaf
and AlgebraicTopology Stages 2.6 and 6.1 supply the specified topology. C6.1’s
`FiniteModuleLocalSystem` restricts the native functor carrier to finite fibres.
LefschetzPencilsAndVanishingCycles §0.8a consumes C6 for its nearby-cycle/inertia application.

## Worked examples

These computations cross the layers and fix the normalisations that consumers rely on. Each one is
an instance of the named targets, not a separate theorem.

1. **Twists and nilpotent points.** On `P¹`: `h⁰(O(2)) = 3`, `h¹(O(−2)) = 1`, `O(−1)` acyclic, both
   algebraically and analytically, with `HigherImageComparison` matching the Laurent bases
   (`analyticTwistCohomology`). The double point `Spec ℂ[ε]/(ε²) ⊂ P¹` has `H⁰(O) = ℂ[ε]/(ε²)` of
   length two, and multiplication by `ε` is a nonzero square-zero endomorphism that analytification
   keeps (`CoherentAnalytification`, `projectiveGeometricDictionaries`).
2. **An elliptic curve.** For an elliptic curve `E` over `ℂ` (the carrier of the Tau Ceti EllipticCurves
   roadmap), `H⁰(E, Ω¹)` is the one-dimensional space of invariant differentials, it is the `(1,0)` part
   of `H¹_dR(E) ≅ H¹(E^an, ℂ)` (`properDeRhamBetti`, `kaehlerHodgeDecomposition`), and
   `H¹(E^an, ℤ)` is free of rank two with the alternating intersection form (`multiplicativePeriodInterface`).
   A holomorphic isogeny of the analytifications is the analytification of an algebraic isogeny,
   with its group law, finite kernel and degree (`familyMorphismInterface`). No uniformization
   theorem is proved here.
3. **The logarithmic loop.** On `G_m`, `Res₀(dz/z) = 1` and the positive loop period is `2πi`
   (`curveResidueLocalization`, `HolomorphicDeRham.torusPeriod`). `Ω^•(log D)(−D)` computes compact
   support cohomology and its image in `H¹` is the parabolic part, which vanishes for `G_m`
   (`CurveLogComplex`).
4. **Modular normalisation.** With `q = e^{2πiτ}`, `dq/q = 2πi dτ`: the factor `2πi` is the period
   of `dz/z` fixed above (`HolomorphicDeRham.torusPeriod`), and the comparison maps of this roadmap
   carry it unchanged. A downstream Kodaira–Spencer identification, such as that of
   ModularCurvesPartII matching `f(q)(du/u)²` (with `du/u` the relative differential of the Tate
   curve) to `f(q) dq/q` on the base, is not constructed or used here.
5. **Proper moduli fibres.** The proper ambient spaces of PEL moduli and of Baily–Borel
   compactifications, with their nilpotent coherent ideals, use the analytic carrier of C0; the
   proper-source comparison keeps graph projections (`properSourceMorphismAlgebraicity`), while the
   nonproper definable Chow step stays with LogicAndDefinabilityInNumberTheory LD.6.
6. **Relative Hodge and characters.** Over the dual numbers in characteristic zero, the relative Hodge
   bundles are free and commute with base change (`relativeHodgeBundles`); for a finite group of
   invertible order, each character idempotent cuts out a vector-bundle summand. For the identity of
   the standard log point the relative log de Rham complex is `ℂ` in degree `0` and its monodromy is
   `N = 0` (`properLogGagaMonodromy`).
7. **Integral realization.** The algebraic de Rham realization, its rational and integral Betti
   coefficient maps, products and trace (`properDeRhamBetti`, `multiplicativePeriodInterface`) are
   compatible; torsion stays in `H_ℤ` and is killed only by the named coefficient change.

## Downstream consumers

| Consumer | Supplied targets and coefficient boundary |
| --- | --- |
| LefschetzPencilsAndVanishingCycles §0.8a | §§C6.0–C6.6 / `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `artinSmoothTrace`, `adicArtinComparison` supply general comparisons, including the finite/integral/rational smooth trace with the complex orientation; nearby-cycle/inertia compatibility is its application. |
| InverseGaloisAndArithmeticFundamentalGroups §§IG.3.1, IG.5.5 and its Hurwitz topology | Uses C6's finite covers/local coefficients, ordinary comparison on finite-type complex schemes and compact/rational comparison on separated ones. Its puncture, ramification, opposite-group and chosen-path adapters retain their own conventions. |
| SchemeAndStackFoundations' finite/adic comparison boundary | §§C6.3–C6.6 supply Artin comparison; its generic site and pro-étale topos foundations remain the inputs to the coefficient owners. |

- **MotivesAndAlgebraicCycles, MC.2** use the algebraic de
  Rham and Betti realizations with `properDeRhamBetti`, `multiplicativePeriodInterface` and
  `chernFubiniStudyIntersection` (functoriality, coefficient change, products, trace, first Chern class
  and intersection normalisation).
- **AlgebraicModuliForArithmeticGeometry §§9.10–9.11** uses CrystallineCohomology
  CR.5:log-algebra.4/CR.5.1's algebraic divisorial-log and log de Rham core for its
  algebraic residue and vanishing results. C5.5–C5.7 supply the complex analytic and
  Hodge comparison adapters on that shared core.
- **HodgeStructuresPartII** imports the ordinary connection and curvature (H.0), canonical logarithmic
  extensions and the Gauss–Manin comparison (H.2), the proper logarithmic comparison with its monodromy
  triangle and residue normalisation (H.6), and the geometric pure Hodge structure and relative Hodge
  bundles (H.8); variations, period maps and limiting Hodge structures stay there.
- **AbelianSchemesAndArithmeticModuli**, **PELModuli**, **ShimuraVarieties**,
  **ShimuraCompactifications**, **AutomorphicBundles** and **AlgebraicModularFormsAndSerreWeights** use
  coherent analytification, the GAGA dictionaries and the proper-source morphism comparison; Borel's
  algebraicity of nonproper maps is ShimuraVarieties' own V3.
- **MordellLawrenceVenkatesh**, **InverseGaloisAndArithmeticFundamentalGroups**,
  **AbelianVarietiesIsogenousToNoJacobian**, **HyperbolicCurveVolumesAndGonality**,
  **EllipticRegulators**, **Polylogarithms**, **PeriodsAndSpecialValues** and
  **LefschetzPencilsAndVanishingCycles** use the analytic image theorems, Chow's theorem, the affine
  curve comparison, the Gauss–Manin connection, the residue and period normalisations and the
  integration of C5.4.

## References

- J.-P. Demailly, *Complex Analytic and Differential Geometry*, author's public version
  (<https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf>); cited by chapter
  (roman), statement number and page.
- J.-P. Serre, *Géométrie algébrique et géométrie analytique*, Ann. Inst. Fourier 6 (1956), 1–42
  (<https://www.numdam.org/item/AIF_1956__6__1_0.pdf>).
- J.-P. Serre, *Faisceaux analytiques sur l'espace projectif* and *(suite)*, Séminaire Henri Cartan 6
  (1953–54), exposés 18 and 19 (<https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf>,
  <https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf>).
- A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, Exposé XII,
  *Géométrie algébrique et géométrie analytique*, revised edition arXiv:math/0206203v2, printed page
  numbers of that edition.
- M. Artin, A. Grothendieck and J.-L. Verdier, *Théorie des topos et cohomologie étale des
  schémas (SGA 4)*, Exposés XI, XII, XVI and XVII; P. Deligne, *Cohomologie étale (SGA 4½)*,
  *Théorèmes de finitude*, §§1–2.
- J. S. Milne, *Lectures on Étale Cohomology*, version 2.21 (2013), §21
  (<https://www.jmilne.org/math/CourseNotes/LEC.pdf>).
- H. Hironaka, *Triangulations of algebraic sets*, Proc. Sympos. Pure Math. 29 (1975), 165–185;
  J. Bochnak, M. Coste and M.-F. Roy, *Real Algebraic Geometry*, Springer 1998, §9.2.
- A. Dimca, *Sheaves in Topology*, Springer 2004, §§2.1–2.5, §3.2 and §4.1.
- B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015), 99–201,
  §§5–6 (<https://arxiv.org/abs/1309.1198>).
- The Stacks Project, §§29.6–29.7, §§38.32–38.33 and §63.9, with the Limits locators
  cited in EtaleCohomologyFoundations §G.2 (<https://stacks.math.columbia.edu/>).
- A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique IV₄*, Publ. Math. IHÉS 32
  (1967), §§16.7–16.8, printed pp. 40–44.
- A. Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math. IHÉS 29 (1966),
  95–103 (<https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf>).
- P. Deligne, *Théorème de Lefschetz et critères de dégénérescence de suites spectrales*, Publ. Math.
  IHÉS 35 (1968), 107–126 (<https://www.numdam.org/item/PMIHES_1968__35__107_0.pdf>).
- P. Deligne, *Équations différentielles à points singuliers réguliers*, Lecture Notes in Math. 163,
  Springer 1970 (<https://publications.ias.edu/sites/default/files/Number9.pdf>), with the author's
  1971 erratum (<https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf>).
- N. Katz and T. Oda, *On the differentiation of de Rham cohomology classes with respect to
  parameters*, J. Math. Kyoto Univ. 8 (1968), 199–213.
- K. Kato, *Logarithmic structures of Fontaine–Illusie*, in *Algebraic Analysis, Geometry, and Number
  Theory*, Johns Hopkins Univ. Press 1989, 191–224.
- J. Hall, *GAGA theorems*, author's version
  (<https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf>).
- Y. Sella, *Comparison of sheaf cohomology and singular cohomology*, arXiv:1602.06674v3.
- T. tom Dieck, *Differential Manifolds*, author's notes, January 2009
  (<https://www.uni-math.gwdg.de/tammo/GT03.pdf>).
- Y. Peterzil and S. Starchenko, *Complex analytic geometry in a nonstandard setting*, author's version
  (<http://math.haifa.ac.il/kobi/Newton.pdf>); H. Whitney, *Complex Analytic Varieties*,
  Addison-Wesley 1972, Theorem 9F, p. 240 (quoted there).
- L. Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1;
  L. Qian, *Potential automorphy for `GL_n`*, Invent. Math. 231 (2023), 1239–1275; NSF public access
  version (<https://par.nsf.gov/servlets/purl/10388233>).
- V. Dimitrov, Z. Gao and P. Habegger, *Uniformity in Mordell–Lang for curves*, Ann. of Math. 194
  (2021); arXiv:2001.10276v3.
- B. Bakker, B. Klingler and J. Tsimerman, *Tame topology of arithmetic quotients and algebraicity of
  Hodge loci*, J. Amer. Math. Soc. 33 (2020), 917–939.
- A. Caraiani and P. Scholze, *On the generic part of the cohomology of compact unitary Shimura
  varieties*, Ann. of Math. 186 (2017); arXiv:1511.02418v1.
- N. Mok, J. Pila and J. Tsimerman, *Ax–Schanuel for Shimura varieties*, Ann. of Math. 189 (2019);
  arXiv:1711.02189v3 (motivation for the graph interface of C4.4).
- TauCetiRoadmap: AlgebraicVectorBundles, DifferentialGeometry, AlgebraicTopology, PDE,
  JacobianChallenge, StableReduction, AlgebraicCurves and the completed HodgeStructures roadmap, as cited in *Exact supplier contracts*.

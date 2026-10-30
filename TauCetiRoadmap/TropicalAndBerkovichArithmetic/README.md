# Roadmap: berkovich spaces, tropical curves and nonarchimedean arithmetic

**Summary.** Build norm-sensitive comparisons for Berkovich analytic spaces from Banach spectra, then the metric and divisor theory of semistable curves, valued tropical cycles and faithful tropicalizations, and the model metrics, measures and integration comparisons used in nonarchimedean arithmetic. The endpoints include metric-graph and metrized-complex Riemann–Roch, a faithful tropicalization dominating any specified toric embedding, the skeleton–Jacobian comparison and the tropical correction between Berkovich–Coleman and abelian integrals.

## Scope and ownership

Layer 0 imports the complete Banach-spectrum core from AdicSpacesPartIII §R3.9, the Tate-normalized rank-one spectrum and maximal Hausdorff quotient from DiamondsAndVStacks §D5.13, and the Hausdorff strict analytic category and taut-adic equivalence from ClassicalAdicEtaleCohomology §3.1. AlgebraicModuliForArithmeticGeometry §7.10.2 supplies the general locally Hausdorff analytic category, including affinoid domains, refinements and gluing. This roadmap owns its norm-sensitive affinoid comparison, the native noncomplete spectrum comparison, the archimedean unit criterion, general Banach residue-field realization and general-family hybrid topology. Section 0.28 compares the specified uniform-unit norm with the supplied normalized spectrum; §0.30 identifies the strict Hausdorff specialization of the general analytic carrier with the supplied category. The input adic valuation classes, Huber pairs and rational topology belong to Tau Ceti's AdicSpaces Layer 2. Section 0.21 compares the weighted norm-sensitive charts with that general category, including its nonstrict, trivially valued and non-Hausdorff objects; no supply to these earlier owners is assumed.

Layer 1 owns line points, paths, annuli, logarithmic lengths and their descent conventions. Layer 2 owns rank-one analytic semistable existence, the metric realization of the imported combinatorial dual graph, retractions, refinement and locally finite noncompact triangulations. StableReduction Layer 1 supplies the dual graph with component genera and its arithmetic-genus formula; Layer 2 supplies flat-family genus invariance in its locally noetherian range; the application to rank-one models requires the descent comparison in this roadmap. Its Layers 7–9 cover discrete valuation rings. Their statement does not establish the required theorem over a possibly nonnoetherian rank-one valuation ring.

Layer 3 owns metric graphs, all-point divisors, potentials, Jacobians, metrized complexes and specialization. Layer 4 owns torus and extended tropicalization on Berkovich analytifications, initial-degeneration and weighted-cycle comparisons. Layer 5 owns faithfulness on metric graphs and marked rays. Algebraic curves and Riemann–Roch are imported. AnalyticToricGeometry Layer 0 supplies lattice, cone and fan geometry; ShimuraCompactifications §C0.16 supplies finite-fan schemes over arbitrary coefficient rings, including singular cones. Section 4.0 extends that carrier to arbitrary small fans and constructs its valued analytic comparisons.

Layer 6 owns local model metrics, mixed measures, graph and line potential theory, and local heights. ArithmeticDynamics owns dynamical escape-rate estimates and the convergence of its family-specific potentials on the hybrid space. Layer 7 imports the algebraic Tate curve from EllipticCurves Layer 4, local annular primitives and good-reduction integration from ColemanIntegration, and the finite-model abelian logarithm from AnabelianGeometryAndNonabelianChabauty §5.8, its arbitrary-ℂ_p-coefficient extension from ColemanIntegrationPartII §4.0, and rational endpoint integrals from EffectiveDiophantineMethods §4.3. Section 7.0 constructs the arbitrary-rank-one Raynaud interfaces. The new results here compare those objects with skeleta and path integrals.

The complete spectral carrier, its bounded pullback, spectral maximum and Hausdorff topology belong to AdicSpacesPartIII §R3.9. Sections 0.1–0.9 specify only the norm-dominated native presentation and its comparison; §0.2 specializes Mathlib's contraction theorem. The algebraically closed Tate analytic quotient and its circle belong to ClassicalAdicEtaleCohomology §3.7; §7.1 extends them by descent to a general complete field and fixes their metric/differential comparison. Mathlib `Graph` owns unmetric multigraph incidence, including loops and parallel edges; §3.1 adds metric realization and subdivision.

The extensions beyond the cited suppliers' ranges are owned here: isometric absolute-valued-field amalgamation in §0.15a, trivial-base faithful scalar extension in §0.17a, the small-fan extension and valued toric comparisons in §4.0, geometric intersection descent over rank-one fields in §§6.1a–6.2 and rank-one Raynaud uniformization, valuation and polarization in §7.0. ResolutionOfSingularitiesCharacteristicZero §7.7 supplies scheme pair principalization; §0.23 owns its convergent-model transport and the domination and cofinality contracts for the hybrid family. ArithmeticDynamics’ line and hybrid specializations consume these general constructions; its dynamical escape-rate and family-potential convergence results retain their own ownership.

The general analytic carrier, its affinoid domains, atlas refinements, gluing, fibre products and completed residue fields over nonarchimedean K belong to AlgebraicModuliForArithmeticGeometry §7.10.2. Section 0.21 compares its charts and morphisms with the specified weighted normed presentations rather than constructing another category. Section 0.15 extends residue-field realization to general Banach spectra, and §§0.19–0.20 add the weighted rational-presentation and finite-module acyclicity comparisons.

## Conventions

A general Banach ring is commutative and unital, with a specified submultiplicative seminorm, |1|≤1 and separated completion; the zero ring is allowed. Contractive maps are used for categorical colimits. Bounded maps are used for affinoid functoriality, with the multiplicative power trick giving pointwise domination. The norm is data: the topology alone does not determine the spectrum. Archimedean and discretely normed examples are included in Layer 0. For a native normed ring, the spectral carrier is a subtype of Mathlib's `MulRingSeminorm`, never a new theory of seminorms.

For ordinary nonarchimedean geometry, K is a complete real rank-one valued field. Algebraic curve and split skeleton statements assume that K is algebraically closed and nontrivially valued unless the individual statement gives descent hypotheses. X is smooth connected, X̄ its smooth proper completion and D=X̄∖X a finite set of classical punctures. A semistable vertex set consists of type-II points in the split algebraic setting; noncompact nonsplit triangulations can contain type-II and type-III points. H denotes nonclassical points of P¹; H° in faithful finite-graph statements consists of type-II and type-III points. Completed residue fields are H(x); κ is the residue field of K.

Write v(a)=−log|a|, using natural logarithms. An annulus r<|T|<R has length log(R/r). A node uv=a has edge length v(a); uv=πⁿ has length n·v(π). Punctures produce infinite rays, and their classical endpoints belong only to the topological completion. Isometric scalar extension preserves these lengths; changing to a valuation normalized by v_L(π_L)=1 rescales numerical lengths. Virtual-annulus modulus conventions are specified in Layer 1, rather than identified with geometric component length.

Graphs retain loops, multiple edges, positive real edge lengths and vertex genera. A loop contributes two to valency. Divisors range over all graph points, not only a chosen vertex set. Use divPL(f)=Σ_xΣ_outgoing d_bf·x and Δf=−divPL(f); the measure extension is Δf=−f″ds−Σ_xΣ_outgoing d_bf·δ_x. Thus ddc f=−Δf and multiplying a metric by exp(−f) changes curvature by −Δf. For F=−log|h| on a compact skeleton, ΔF=τ_*div(h). This sign convention is used consistently in local heights, graph Green functions and Yuan's normalization comparison.

In p-adic integration K=ℂ_p, a branch Log is fixed and v_p(p)=1. The tropical arithmetic coordinate is rational, while natural-log length is log(p) times that coordinate. Real graph energies and Cp-valued periods have different coefficient fields. No identification of a real monodromy pairing with a Cp integral is implicit.

All sets, graphs, fans and diagrams are small in a fixed universe; colimits use small diagrams, and residue-field completions live in the corresponding universe or its explicit lift. Real-valued norms, lengths and Radon measures retain ℝ coefficients; divisors have ℤ coefficients, and integration has ℂ_p coefficients. Connected graphs are nonempty. A constant function on the one-point graph has Δ=0, while the empty graph is excluded from its Jacobian and rank theorems.

**Normalization checks.** On uv=π² with |π|=1/3, the length is 2log 3; the unit-valuation coordinate gives length 2. On [0,2], f(s)=s has outgoing slopes +1 at 0 and −1 at 2, so divPL(f)=δ₀−δ₂, Δf=δ₂−δ₀ and the curvature change for exp(−f) is δ₀−δ₂. At p=2 with a ramified uniformizer π²=2, v_p(π)=1/2 and a branch change Log′−Log=2v_p changes Log(π) by 1. These same witnesses apply wherever the corresponding supplier conventions are transported.

## Exact supplier contracts

The headline signatures use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native interfaces supply the spectrum construction:

### From Mathlib

- `MulRingSeminorm` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): Native nonnegative additive seminorm and unital multiplicative map to the reals.
- Mathlib `MulRingSeminorm.ext` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): Extensional equality of native multiplicative seminorms.
- Mathlib `normRingSeminorm` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean): The submultiplicative ring seminorm supplied by the norm.
- Mathlib `RingHom.IsBoundedWrt` (Mathlib/Basic/Real/Basic.lean): One positive uniform bound between specified real functions.
- Mathlib `RingHom.IsBounded` (Mathlib/Analysis/Normed/Ring/Basic.lean): One positive uniform bound between source and target norms.
- Mathlib `contraction_of_isPowMul_of_boundedWrt` (Mathlib/Analysis/Normed/Unbundled/IsPowMulFaithful.lean): Power-multiplicative bounded pullbacks are pointwise dominated by the source ring seminorm.
- Mathlib `IsPowMul` (Mathlib/Basic/Real/Basic.lean): Power multiplicativity for positive natural powers.
- Mathlib `map_pow` (Mathlib/Algebra/Group/Hom/Defs.lean): A multiplicative map preserves natural powers.
- Mathlib `normHom` (Mathlib/Analysis/Normed/Ring/Basic.lean): The native multiplicative map supplied by a multiplicative norm and norm of one equal to one.
- Mathlib `Topology.IsEmbedding` (Mathlib/Topology/Defs/Induced.lean): Induced topology together with injectivity.
- Mathlib `Topology.IsInducing.continuous_iff` (Mathlib/Topology/Maps/Basic.lean): Continuity into an induced topology is tested after the inducing map.
- Mathlib `continuous_pi` (Mathlib/Topology/Constructions.lean): Coordinatewise continuity gives continuity into a product.
- Mathlib `continuous_apply` (Mathlib/Topology/Constructions.lean): Each coordinate evaluation is continuous for the product topology.
- Mathlib `isClosed_iInter` (Mathlib/Topology/Basic.lean): Arbitrary intersections of closed sets are closed.
- Mathlib `isClosed_eq` (Mathlib/Topology/Separation/Hausdorff.lean): An equality of continuous real functions cuts out a closed set.
- Mathlib `isClosed_le` (Mathlib/Topology/Order/OrderClosed.lean): An inequality of continuous real functions cuts out a closed set.
- Mathlib `isCompact_pi_infinite` (Mathlib/Topology/Compactness/Compact.lean): Tychonoff compactness for a product of compact subsets.
- Mathlib `CompactIccSpace` (Mathlib/Topology/Order/Compact.lean): Native compactness of closed intervals, including real intervals.
- Mathlib `IsCompact.of_isClosed_subset` (Mathlib/Topology/Compactness/Compact.lean): A closed subset of a compact set is compact.
- Mathlib `Topology.IsEmbedding.isCompact_iff` (Mathlib/Topology/Compactness/Compact.lean): An embedding reflects compactness from its image.
- Mathlib `Topology.IsEmbedding.t2Space` (Mathlib/Topology/Separation/Hausdorff.lean): An embedding into a Hausdorff space has a Hausdorff domain.
- Mathlib `NormedAlgebra.Real.nonempty_algEquiv_or` (Mathlib/Analysis/Normed/Algebra/GelfandMazur.lean): Real normed-algebra field classification. Section 0.26 adds the complete absolute-valued-field version without a chosen real scalar structure and with the norm exponent.
- Mathlib `T2Space.of_injective_continuous` (Mathlib/Topology/Separation/Hausdorff.lean): Injective continuous maps into a Hausdorff space give Hausdorffness.
- Mathlib `Pi.t2Space` (Mathlib/Topology/Separation/Hausdorff.lean): Products of Hausdorff spaces are Hausdorff.
- `AlgebraicGeometry.Scheme.GlueData` and `AlgebraicGeometry.Scheme.GlueData.glued` (Mathlib/AlgebraicGeometry/Gluing.lean) supply scheme gluing along open overlaps; §4.0 uses them for the small-fan extension of the supplied finite-fan charts.
- `Rat.AbsoluteValue.equiv_real_of_unbounded` (Mathlib/NumberTheory/Ostrowski.lean) identifies a rational absolute value not bounded by 1 on the naturals with the ordinary real absolute value up to a positive power; §0.26 extends this to the complete field.
- `Graph`, `Graph.IsLoopAt` and `Graph.banana` (Mathlib/Combinatorics/Graph/Basic.lean) provide multigraph incidence with distinct edge identities, loops and parallel edges. They carry neither positive lengths nor a metric realization, which §3.1 constructs.

### From Tau Ceti

- `TauCeti.ValuationSpectrum.spa`, in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean`, and the rational topology of AdicSpaces Layer 2 provide the adic point carrier.
- `TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`, in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean`, supplies an analytic rank-one coarsening of a continuous analytic valuation, with unchanged support, using an Archimedean nontrivial quotient of its value group. DiamondsAndVStacks §D5.13 supplies its uniqueness, maximality and Tate normalization; §0.28 compares that normalization with the specified uniform-unit Banach norm.
- `TauCeti.ValuationSpectrum.spaSeparationQuotientHomeomorph`, in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/SeparationQuotient.lean`, identifies Spa of A modulo the closure of zero with Spa of A. This separated-ring invariance does not provide the maximal Hausdorff quotient of the adic point space required here.
- `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted`, in `TauCeti/RingTheory/PowerSeries/GaussNorm.lean`, provides multiplicativity of restricted Gauss norms. Layer 1 uses it for the analytic Gauss-point comparison.
- `TauCeti.exists_isRiemannRochDivisor`, in `TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean`, and AlgebraicCurves Layer 4 provide algebraic Riemann–Roch. Layer 5 adds analytic lifting and separating functions.
- `TauCeti.IsConvexPolyhedron`, in `TauCeti/Analysis/Convex/Polyhedron.lean`, and the lattice/cone/fan interfaces of AnalyticToricGeometry supply the underlying convex geometry. Layer 4 adds valued initial degenerations and tropical cycles.

### From TauCetiRoadmap.StableReduction

- StableReduction Layer 1 supplies the nodal multigraph and its component genera; Layer 2 supplies genus invariance in proper flat curve families over locally noetherian bases; the rank-one application uses the descent comparison of Layer 2 below. A simple intersection graph, such as `TauCeti.NumericalType.intersectionGraph`, does not supply this metric dual graph: loops and repeated nodes must be retained.
- **TauCetiRoadmap.StableReduction Layer 1**: Combinatorial dual graph with component genera and p_a=Σg_v+b₁. Layer 2 adds the metric thickness/skeleton identification only. Consumed by [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs), [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).
- **TauCetiRoadmap.StableReduction Layer 2**: Genus invariance in proper flat curve families over locally noetherian bases. Apply it to special and generic fibers through the owned rank-one model descent comparison; no second algebraic genus-invariance theorem is planned. Consumed by [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).
- **TauCetiRoadmap.StableReduction Layer 7**: Semistable-reduction theorem in its DVR range, used as a compatibility check. It does not supply the owned nonnoetherian rank-one theorem. Consumed by [2.10 Rank-one semistable reduction](#210-rank-one-semistable-reduction).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

- AlgebraicModuliForArithmeticGeometry §7.10.2 (`BerkovichAnalyticSpace`, `BerkovichAnalyticSpace.affinoid`, `BerkovichAnalyticSpace.refineAtlas`, `BerkovichAnalyticSpace.domain`, `BerkovichAnalyticSpace.glueDomains`, `BerkovichAnalyticSpace.fibreProduct`, `BerkovichAnalyticSpace.rigidModel`): Locally Hausdorff affinoid nets, refinement-local morphisms, affinoid domains, bounded spectra, evaluation topology and completed residue fields. Section 0.21 compares the specified weighted normed charts with these objects; the rigid equivalence is used only in the supplier's paracompact strict range.

### From TauCetiRoadmap.RigidAnalyticGeometry

- RigidAnalyticGeometry Layer 5: Augmented Čech exactness for finite affinoid covers of a strict affinoid over nontrivially valued K, for every algebraic A-module. Weighted nonstrict descent remains a Layer 0 target.

### From TauCetiRoadmap.AdicSpacesPartII

- AdicSpacesPartII §R1.3 (`analytification-functor`): Adic analytification of finite-type schemes, with the scheme and local-chart interfaces. It does not itself construct Berkovich analytification.
- AdicSpacesPartII §R0.7 (`ValuationSpectrum.exists_amalgamation`) and §R0.18 (*banach-completed-tensor-field-exactness*): Valuation-class amalgamation and nontrivially valued nonarchimedean completed tensor exactness in their stated ranges.

### From TauCetiRoadmap.AdicSpacesPartIII

- AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`): Flat, topologically finitely presented admissible formal K°-schemes, allowing a nonnoetherian valuation ring.
- AdicSpacesPartIII §R2.3 (`raynaud-generic-fibre`): The analytic generic fiber, its formal affinoid charts and compatibility with admissible modifications. Layer 2 proves the metric skeleton correspondence.
- AdicSpacesPartIII §R3.9 (`Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty`, `GelfandSpectrum.smoothingFun_eq_sSup`): The complete bounded-seminorm spectrum, pointwise topology, compactness, nonemptiness, bounded pullback and spectral maximum.

### From TauCetiRoadmap.ColemanIntegration

- ColemanIntegration §L0.23: The explicit change of the logarithmic primitive under Log′−Log=c·v_p.
- ColemanIntegration §L0.22: The convergent analytic-plus-logarithmic primitive, with its residue coefficient and differentiation identity.
- ColemanIntegration §L0.11: The dt/t Laurent coefficient and its oriented coordinate invariance.
- ColemanIntegration §L1.20: The good-reduction, Frobenius-normalized Coleman integration class. It is not general global path integration.

### From TauCetiRoadmap.EffectiveDiophantineMethods

- EffectiveDiophantineMethods §4.3: The endpoint integral for rational points over a finite extension of ℚ_p, paired with an invariant differential. The all-ℂ_p extension here uses the logarithm below.

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

- AnabelianGeometryAndNonabelianChabauty §5.8 (`abelianLog.cp`, `abelianLog.derivative`, `abelianLog.functorial`): The logarithm on all ℂ_p-points of an abelian variety defined over a finite p-adic field.

### From TauCetiRoadmap.ColemanIntegrationPartII

- ColemanIntegrationPartII §4.0: The unique locally analytic additive logarithm with identity differential for every abelian variety over ℂ_p, including those without a finite p-adic field model, and comparison with the preceding finite-model logarithm.
- ColemanIntegrationPartII §3.1: The zero sum of oriented analytic end residues on a connected Coleman wide open, for forms extending to its specified strict neighborhood.

### From TauCetiRoadmap.DiamondsAndVStacks

- DiamondsAndVStacks §D5.13 (`BerkovichSpectrum`, `BerkovichSpectrum.ofSpa`, `BerkovichSpectrum.toSpa`, `BerkovichSpectrum.changeNormalization`, `TauCetiRoadmap.DiamondsAndVStacks.nonempty_t2Quotient_spa_homeomorph`): The Tate-normalized continuous real spectrum with value 1/2 on the chosen pseudouniformizer, unique rank-one maximal generization, set-theoretic section and maximal Hausdorff quotient of Spa. Section 0.28 transports that quotient through its norm-sensitive comparison.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

- ClassicalAdicEtaleCohomology §3.1 (`StrictAnalyticSpace`, `StrictAnalyticSpace.affinoid`, `StrictAnalyticSpace.glue`, `StrictAnalyticSpace.Hom`, `StrictAnalyticSpace.u`, `StrictAnalyticSpace.s₀`, `StrictAnalyticSpace.u_max`, `StrictAnalyticSpace.u_partiallyProper`, `StrictAnalyticSpace.u_proper`, `StrictAnalyticSpace.u_etale_smooth`): Hausdorff strict analytic atlases over a complete nontrivially valued rank-one field, their taut locally finite-type adic equivalence, and boundary, properness, étale and smooth comparisons. Sections 0.21 and 0.30 identify the strict specialization and transport these results; §0.22 uses them for the strict GAGA route.
- ClassicalAdicEtaleCohomology §3.7 (`AnalyticTateQuotient`): The analytic quotient, covering, Tate analytification isomorphism and skeletal circle over a complete algebraically closed rank-one field. Section 7.1 extends this to general complete K and compares the metric and differential.

### From TauCetiRoadmap.PerfectoidSpaces

- PerfectoidSpaces §P1.12 (`gelfandSpectrum_isUnit_iff`): Unit detection in its nonarchimedean range; §0.14 adds the archimedean extension.

### From TauCetiRoadmap.RestrictedPowerSeries

- RestrictedPowerSeries §§0.1, 1.1 and 2.1: Native weighted series at arbitrary positive polyradii, Gauss norms, completeness and contractive evaluation. Section 0.17 uses these for affinoid quotients and strictification.

### From TauCetiRoadmap.PadicFunctionalAnalysis

- PadicFunctionalAnalysis §0.4: Tate gauge data and their topology/norm comparison; §0.27 adds uniform-unit and spectral normalization comparisons.

### From TauCetiRoadmap.SchemeAndStackFoundations

- **SchemeAndStackFoundations §3.3**: Integrate the native smooth connected algebraic curve, smooth proper completion and finite puncture set from AlgebraicCurves. Analytification belongs to Layer 0, not this request. Use §3.3’s `cohomologyDim_zero_structureModule` for H⁰(X̄,O)=K on a smooth proper geometrically connected curve over algebraically closed K, used with proper GAGA for analytic connectedness. Consumed by [2.1 Semistable vertex set](#21-semistable-vertex-set), [1.4 Connected algebraic curves remain connected](#14-connected-algebraic-curves-remain-connected).
- SchemeAndStackFoundations §4.12 (`chow_lemma`): A projective modification of a proper variety, used in §6.4 to prove the model-function estimate on projective models and descend it by projection.
- **SchemeAndStackFoundations §§5.2–5.3**: Residue-field cycle degrees, `Chow.c1` and `proper_pushforward`. Section 5.9 treats fields, Dedekind bases and arithmetic surfaces; geometric model specialization is constructed in §6.1a and arbitrary-rank-one descent in §6.2.

### From TauCetiRoadmap.AnalyticToricGeometry

- **AnalyticToricGeometry Layer 0**: Lattices, cones, fans and dual semigroups, used with the coefficient-ring charts below.

### From TauCetiRoadmap.ShimuraCompactifications

- ShimuraCompactifications §C0.16 (`TauCeti.Toric.finiteFanScheme`, `affineChart_baseChange`, `finiteFanScheme_baseChange`, `finiteFanScheme_complex`, `finiteFanScheme_torusAction`, `finiteFanScheme_glue_hom`): Schemes of finite rational fans over every commutative ring, singular cones allowed, with face localizations, coherent coefficient change and compatible chart gluing. Section 4.0 uses the specialization R=K and extends it to small fans; §§4.1–4.2 add valued analytification and tropicalization. Section C0.17 supplies the finite-fan toric morphisms induced by lattice maps.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

- ResolutionOfSingularitiesCharacteristicZero §7.7 (`qePairPrincipalization`): Projective principalization on a reduced noetherian quasi-excellent ℚ-scheme, for a coherent ideal nonzero on every generic component, with regular source and strict-normal-crossings reduced support including the exceptional support, preserving the stated semi-strict locus. Section 0.23 proves the convergent-model excellence and analytic transport needed for complex meromorphic families, rather than identifying the scheme statement with analytic resolution.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

- **NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and §§4.3–4.4**: The complete-DVR Raynaud extension (`SemiabelianExtensionClassification`), analytic quotient (`RigidUniformisation`, `RaynaudOneMotive`) and graph monodromy pairing. Section 7.0 constructs the arbitrary-rank-one extension used in §§7.5 and 7.8.

### From TauCetiRoadmap.AdicSpaces

- **TauCetiRoadmap.AdicSpaces Layer 2**: Native valuation classes, Spa(A,A⁺), rational topology and continuous maps; DiamondsAndVStacks §D5.13 supplies the normalized rank-one quotient and §0.28 compares it with the specified norm. Consumed by [0.28 Normalized rank-one adic quotient](#028-normalized-rank-one-adic-quotient).

### From TauCetiRoadmap.AlgebraicCurves

- **TauCetiRoadmap.AlgebraicCurves Layer 4**: Algebraic Riemann–Roch and prescribed-pole rational functions on the smooth proper curve; Layer 5 imports them to obtain unit-slope and coprime-pole coordinates. Consumed by [5.3 Functions separating edges and vertices](#53-functions-separating-edges-and-vertices).

### From TauCetiRoadmap.EllipticCurves

- **TauCetiRoadmap.EllipticCurves Layer 4**: The algebraic Tate elliptic curve and its q-parametrization; Layer 7 adds complete-field descent and measure/integral calibration. Consumed by [7.1 Tate analytic quotient and skeletal circle](#71-tate-analytic-quotient-and-skeletal-circle).

## How to read the build

The complete Banach-spectrum contract precedes its native noncomplete presentation and the adic quotient comparisons. Line geometry then provides the annular local models for curve skeleta. Divisor and slope theory supplies both weighted tropicalization and the functions used to make it faithful. Measures use the same Laplacian and metric normalization, while the uniformization and integration comparisons use the resulting graph Jacobian and real period lattice. Layer 6 constructs general model measures and curvature corrections. Layer 7 extends the supplied analytic Tate quotient to general complete fields and then applies those measure results to calibrate its circle.

## Layer 0: Berkovich spectra and analytic comparison

Compare actual norm-dominated points with the imported bounded-point carrier. The completion comparison extends compactness and nonemptiness to noncomplete normed rings; unit detection has a separate general Banach-ring extension. The general Banach category serves archimedean and hybrid applications, while nonarchimedean affinoid domains carry the G-topology needed for analytic spaces.

### 0.1 Berkovich spectrum

Define `Spectrum`, the native noncomplete presentation of the supplier spectrum, with evaluation `Spectrum.eval`. For a normed commutative unital ring A, M(A) is the subtype of native MulRingSeminorm A consisting of p with p(a) ≤ ‖a‖ for every a. Points are actual real-valued seminorms, not equivalence classes. Completeness, a base field, multiplicativity of the ambient norm and a nonarchimedean norm are not required for this carrier.

Provide the following interface:

- Forget only the domination proof, retaining the native MulRingSeminorm.
- For x in M(A) and a in A, return x(a) in ℝ.
- A native multiplicative seminorm p with a pointwise norm bound gives a point.
- Evaluating the constructed point at a returns p(a).
- Points with equal values at every a in A are equal.
- Every point has value zero at zero.
- Every point has value one at one.
- x(ab)=x(a)x(b).
- x(−a)=x(a).
- x(a+b)≤x(a)+x(b).
- 0≤x(a).
- x(a)≤‖a‖.

**Checks.**

- M(A) is empty when A is a subsingleton normed ring.
- No point takes value zero at every a.
- Forgetting the bound on the point made from p returns exactly p.
- The maximum norm on ℝ×ℝ is not multiplicative: use (1,0) and (0,1).

For the construction, take the norm-dominated subtype of the existing seminorm carrier; retain its function coercion through the named evaluation projection. The native carrier already supplies positivity, zero, negation, triangle inequality, one and multiplication.

*Needs:* Mathlib `MulRingSeminorm`; Mathlib `MulRingSeminorm.ext`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6; Definition/Exercise 2.1.2.1(i), p. 4. The source uses bounded points for Banach rings. The bounded-iff-dominated theorem proves equality with this presentation; this carrier needs no completion.

**Check.** The zero ring has no point because one must map to one and zero to zero. The zero function is excluded. On the product of two real fields, the two projection seminorms are distinct; the ambient maximum norm itself is not multiplicative.

### 0.2 Bounded points are norm dominated

Prove *the bounded/dominated comparison*. For p in native MulRingSeminorm A, there is a constant C>0 with p(a)≤C‖a‖ for all a if and only if p(a)≤‖a‖ for all a.

For the proof, apply the native contraction theorem to the identity ring map, the norm ring seminorm, and the multiplicative function p. Native preservation of powers supplies power multiplicativity. For the reverse direction choose C=1. The comparison specializes the native contraction theorem.

*Needs:* Mathlib `RingHom.IsBoundedWrt`; Mathlib `normRingSeminorm`; Mathlib `IsPowMul`; Mathlib `map_pow`; Mathlib `contraction_of_isPowMul_of_boundedWrt`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Identifies the source boundedness convention with the chosen subtype; the proof is the pinned library theorem.

**Check.** A different positive bound C produces the same point subtype. A point need not be bounded as a real-valued function on all of A.

### 0.3 Topology of pointwise convergence

Construct `Spectrum.topology`. Equip M(A) with the topology induced by x↦(a↦x(a)) into the full product ℝ^A. Thus continuity into M(A) is equivalent to continuity of every evaluation coordinate.

Provide the following interface:

- The topology is induced by the full evaluation map M(A)→ℝ^A.
- Evaluation at each a is continuous.
- For any topological Z, f:Z→M(A) is continuous exactly when each z↦f(z)(a) is continuous.
- The topology agrees with the native induced topology from ℝ^A.

**Checks.**

- On M(ℝ×ℝ), a map choosing the first projection at rational parameters and the second at irrational parameters has constant zero-coordinate but is discontinuous: evaluation at (2,3) alternates between 2 and 3. Testing only zero cannot define the topology.
- In M(ℤ) for the usual norm, set p_t(0)=0 and p_t(n)=|n|^t for n≠0, 0≤t≤1. The nonconstant path t↦p_t is continuous, with coordinate pair (p_t(2),p_t(3))=(2^t,3^t). A discrete topology would fail this test.
- For the same integer seminorms, p_(1−1/n) tends to p_1 in M(ℤ), although sup_m |p_1(m)−p_(1−1/n)(m)|=∞ for every n≥2. A topology requiring uniform convergence on all ring elements would reject this limit.
- The evaluation-open set {x:x(2,3)<5/2} contains the first projection (value 2) and excludes the second (value 3). Its complement contains the open neighborhood {x:x(2,3)>5/2} of the second point.

For the construction, use the native induced topology on the native function product. Apply the inducing-map continuity criterion, followed by coordinatewise continuity into a product.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); Mathlib `Topology.IsInducing.continuous_iff`; Mathlib `continuous_pi`; Mathlib `continuous_apply`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. The initial topology for evaluation at every element of A.

**Check.** Evaluations at zero and one are continuous constants. The two projection points of ℝ×ℝ have disjoint separating neighborhoods.

### 0.4 The evaluation map is an embedding

Prove *the evaluation embedding*. The evaluation map M(A)→ℝ^A is a topological embedding.

For the proof, the topology is induced by definition. Native seminorm extensionality and subtype extensionality prove injectivity.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); [0.3 Topology of pointwise convergence](#03-topology-of-pointwise-convergence); Mathlib `MulRingSeminorm.ext`; Mathlib `Topology.IsEmbedding`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. The explicit induced-topology embedding is the library formulation of the definition.

**Check.** Equality of coordinates cannot identify two distinct points.

### 0.5 Equations for the evaluation image

Prove *the evaluation-image equations*. The image of M(A) in ℝ^A is exactly the functions v satisfying v(0)=0, v(1)=1, v(−a)=v(a), v(a+b)≤v(a)+v(b), v(ab)=v(a)v(b), and 0≤v(a)≤‖a‖ for all a,b.

For the proof, unpack a spectrum point to obtain the listed laws. Conversely bundle the additive group seminorm laws and multiplicative zero-preserving unital homomorphism laws into the existing MulRingSeminorm, then attach domination.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); Mathlib `MulRingSeminorm`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition/Exercise 2.1.2.1(i), p. 4; Definition 2.2.2.1(i), p. 6. Native-carrier expansion used only to prove the image description.

**Check.** The zero function violates the one equation; the product maximum norm violates multiplication.

### 0.6 Closedness of the evaluation image

Prove *closedness of the evaluation image*. The image of M(A) in ℝ^A is closed.

For the proof, express the image as the intersection of the equalities and inequalities of evaluation-range. Coordinate evaluation, real addition and real multiplication are continuous. Each equality is closed by the Hausdorff equality theorem; each inequality is closed by the real order theorem. Intersect over all elements and pairs.

*Needs:* [0.5 Equations for the evaluation image](#05-equations-for-the-evaluation-image); Mathlib `continuous_apply`; Mathlib `isClosed_eq`; Mathlib `isClosed_le`; Mathlib `isClosed_iInter`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Fact 2.2.2.3(i), p. 7. This is the explicit topological proof step for the compactness statement; supplied here from native closed-set lemmas.

**Check.** One uses non-strict inequalities; imposing strict positivity on all nonzero elements would fail closedness.

### 0.7 Compactness of the Berkovich spectrum

Prove `Spectrum.compactSpace`. M(A) is compact for every normed commutative ring A, even without completeness or nontriviality.

Transport compactness from AdicSpacesPartIII §R3.9 through the completion comparison below. The closed-product argument gives the same native presentation: the image is closed in ∏ₐ[0,‖a‖]. No nonemptiness hypothesis is used.

*Needs:* [0.4 The evaluation map is an embedding](#04-the-evaluation-map-is-an-embedding); [0.6 Closedness of the evaluation image](#06-closedness-of-the-evaluation-image); Mathlib `isCompact_pi_infinite`; Mathlib `CompactIccSpace`; Mathlib `IsCompact.of_isClosed_subset`; Mathlib `Topology.IsEmbedding.isCompact_iff`; the completion comparison in this section; AdicSpacesPartIII §R3.9.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Fact 2.2.2.3(i), p. 7. Proves the compactness assertion in a stronger generality; the nonemptiness assertion is not included.

**Check.** M(ℝ×ℝ) is compact although its ambient norm is not multiplicative. The empty spectrum of a zero ring is compact.

Prove `Spectrum.completion_comparison`: restriction along A→completion(A) is a homeomorphism M(completion(A))≃M(A), with every evaluation at a∈A unchanged. Composing it with bounded-iff-dominated identifies this presentation with AdicSpacesPartIII §R3.9 after completion. A dominated seminorm is 1-Lipschitz, extends uniquely to the completion, and its unital multiplicative laws extend by density; uniqueness and the closed evaluation topology give the inverse and continuity (Scholze Definition 2.13, p. 10).

*Needs:* Mathlib `UniformSpace.Completion`; §0.2; §0.3; AdicSpacesPartIII §R3.9.

**Checks.**

- ℚ→ℝ restricts the absolute value with |2|=2 on both sides.
- The zero ring has empty spectra on both sides, so no point is produced by completion.
- On ℤ with its ordinary norm completion is still ℤ and p_t(2)=2ᵗ remains unchanged.

### 0.8 Hausdorffness of the Berkovich spectrum

The native presentation M(A) is Hausdorff.

The full evaluation map is injective and continuous into the Hausdorff real product, so Mathlib `T2Space.of_injective_continuous` applies.

*Needs:* [0.4 The evaluation map is an embedding](#04-the-evaluation-map-is-an-embedding); Mathlib `Pi.t2Space`; Mathlib `Topology.IsEmbedding.t2Space`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Point separation follows from distinct real-valued seminorms having different coordinates.

**Check.** Projection points on ℝ×ℝ are separated using evaluation at (2,3).

### 0.9 Pullback of Berkovich points

Transport the supplier’s bounded pullback to the native presentation. For normed commutative rings A,B and a bounded unital ring homomorphism f:A→B, construct the continuous map M(f):M(B)→M(A), given by M(f)(x)(a)=x(f(a)).

Provide the following interface:

- M(f)(x)(a)=x(f(a)).
- M(id)(x)=x.
- M(g∘f)(x)=M(f)(M(g)(x)).
- The map is continuous for the evaluation topologies.
- Changing the proof of boundedness does not change the continuous map.

**Checks.**

- Pull the real norm back along the first projection ℝ×ℝ→ℝ: its value at (2,3) is 2.
- Pull back along the second projection: its value at (2,3) is 3.
- Pulling the real norm point back along the identity fixes it.
- The first and second projection pullbacks are distinct.

For the construction, compose the native seminorm laws with the ring map. If ‖f(a)‖≤C‖a‖, then x(f(a))≤C‖a‖. Apply bounded-iff-dominated to the composed seminorm. For continuity test each a-coordinate, which is evaluation at f(a). Identity and reversed composition follow by pointwise extensionality.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); [0.2 Bounded points are norm dominated](#02-bounded-points-are-norm-dominated); [0.3 Topology of pointwise convergence](#03-topology-of-pointwise-convergence); Mathlib `RingHom.IsBounded`; Mathlib `MulRingSeminorm`; AdicSpacesPartIII §R3.9.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Exercise 2.2.2.4(i), p. 7. Contravariant continuous functor on bounded homomorphisms; completeness is unused.

**Check.** Contravariance reverses f:A→B and g:B→D: M(g∘f)=M(f)∘M(g). Do not assume an arbitrary continuous ring homomorphism is bounded.

The evaluation formula identifies this transported map uniquely; the functorial identities remain README interface facts.

### 0.10 The norm point of a valued field

Construct *the norm point*. For a normed field K, its native absolute-value norm defines a distinguished point ν_K of M(K), with ν_K(a)=‖a‖. No completeness or nontrivial valuation hypothesis is needed.

Provide the following interface:

- ν_K(a)=‖a‖.
- The underlying native multiplicative map of ν_K is normHom.
- Any native seminorm point whose function equals the norm is ν_K.

**Checks.**

- ν_ℝ(2)=2.
- ν_ℝ(0)=0.
- ν_ℝ(2 inverse)=1/2.

For the construction, combine the native norm homomorphism with the native additive seminorm laws; the required upper bound is equality.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); Mathlib `normHom`; Mathlib `MulRingSeminorm`; Mathlib `normRingSeminorm`.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 2.1.2.1(i) and 2.2.2.1(i), pp. 4, 6. Specialization to the multiplicative norm of a field.

**Check.** The real norm point has values 0,2,1/2 on 0,2,2 inverse.

### 0.11 The spectrum of a normed field is a singleton

Prove *uniqueness of the norm point*. For any normed field K, every point of M(K) equals ν_K.

For the proof, for a=0 equality is forced. For a≠0, multiplicativity gives p(a)p(a inverse)=1. Use p(a)≤‖a‖ and p(a inverse)≤‖a inverse‖=‖a‖ inverse to obtain the reverse inequality p(a)≥‖a‖. Apply extensionality.

*Needs:* [0.10 The norm point of a valued field](#010-the-norm-point-of-a-valued-field); [0.1 Berkovich spectrum](#01-berkovich-spectrum).

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 2.2.2.1(i), p. 6. Elementary consequence of the bounded multiplicative point definition, proved here with explicit inverse bounds.

**Check.** Every point of M(ℝ) takes value 3 at −3. A power of the real absolute value with exponent strictly between zero and one fails domination near zero.

### 0.12 Seminormed Banach rings

Define *the seminormed Banach-ring category*. Use commutative unital seminormed rings with submultiplicative seminorm and |1|≤1, including the zero ring, then separated completion. Morphisms in the colimit statements are contractive unital maps. M(A) consists of unital multiplicative real seminorms dominated by the specified seminorm. The normed-ring subtype of §0.1 agrees with this normalized carrier when ‖(1 : A)‖≤1; separated completion retains that norm on A.

A seminorm, rather than merely its topology, is part of the data.

**Check.** On ℝ with the complete submultiplicative norm ‖x‖′=2|x|, ‖1‖′=2. This native normed ring is allowed in §0.1 but does not satisfy the normalized-category adapter; completion still gives norm 2 at one.

Provide the following interface:

- Separated completion is universal for contractive maps to separated complete rings.
- Restriction M(completion(A))→M(A) is a homeomorphism.
- Contractive maps compose and their pullbacks satisfy identity and composition.
- For a native NormedCommRing A with ‖(1 : A)‖≤1 the dominated seminorm subtype is this normalized spectrum, with its specified norm retained.

**Checks.**

- The zero ring has empty spectrum.
- A nonzero discretely normed field has its trivial absolute-value point.
- The usual norm on ℤ and its trivial norm define different spectra although both ring topologies are discrete.

For the construction, quotient the seminorm-zero ideal, complete the resulting metric ring, and extend multiplication by uniform continuity on bounded sets. Every dominated multiplicative seminorm kills that ideal and extends uniquely through completion.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum).

[Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Definitions 2.1–2.2 and Proposition 2.4, pp. 7–8; Proposition 3.2, pp. 14–15. Distinguishes contractive Banach-ring maps and their completion from arbitrary bounded morphisms of affinoid algebras.

**Check.** The additive-group norms |x| and √|x| on ℝ induce the same topology but have no two-sided global constant comparison: the ratios are unbounded at large values and near zero. Thus a topological-ring structure alone cannot replace the specified norm. This distinguishes the norm convention from the topological formulation in Temkin Definition/Exercise 2.1.1.1(iv), author preprint p. 4.

### 0.13 Existence of spectral points

Prove the noncomplete extension: any commutative unital seminormed ring A with |1|=1 has nonempty spectrum. In the native normed-ring presentation this is `Spectrum.nonempty`. Its spectrum is compact Hausdorff. The unit normalization prevents separated completion from becoming zero.

No completeness or separation is needed for the seminormed statement; norm of one is one. The Lean signature specializes to native normed commutative rings.

For the proof, pass to separated completion, use AdicSpacesPartIII §R3.9 there and restrict the point. The norm of one remains one, so the completed ring is nonzero. Scholze Theorem 2.14 gives precisely this seminormed generality.

*Needs:* [0.12 Seminormed Banach rings](#012-seminormed-banach-rings); [0.7 Compactness of the Berkovich spectrum](#07-compactness-of-the-berkovich-spectrum); [0.8 Hausdorffness of the Berkovich spectrum](#08-hausdorffness-of-the-berkovich-spectrum); the completion comparison in §0.7; AdicSpacesPartIII §R3.9.

Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (1990), Theorem 1.2.1, pp. 13–15. Supplies existence, including the part not implied by compactness. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.14, pp. 10–11. Records the general Banach-ring version and unit normalization.

**Check.** The zero-ring exception is necessary. The archimedean and trivial absolute-value field cases are included.

### 0.14 Units and spectral maximum

Extend the unit criterion and transport the imported spectral-radius formula. For a complete commutative Banach ring A with ‖1‖≤1, a is a unit iff x(a)>0 for every x∈M(A), including the zero ring. For nonzero A, moreover ρ(a)=limₙ||aⁿ||^(1/n)=infₙ≥1||aⁿ||^(1/n)=maxₓ x(a). The spectrum is unchanged by replacing the seminorm with its spectral uniformization and taking separated completion.

Unital Banach norm with ‖1‖≤1; for a nonzero separated ring this forces ‖1‖=1. Positive integer powers are used in the infimum, and attainment requires nonzero A.

For the archimedean unit extension, apply nonemptiness to the closed maximal-ideal quotient containing a; a unit has positive evaluation by evaluating its inverse. Import the attained spectral-radius formula from AdicSpacesPartIII §R3.9 and compare bounded and dominated points. PerfectoidSpaces §P1.12 supplies the nonarchimedean unit case.

*Needs:* [0.13 Existence of spectral points](#013-existence-of-spectral-points); [0.2 Bounded points are norm dominated](#02-bounded-points-are-norm-dominated); PerfectoidSpaces §P1.12; AdicSpacesPartIII §R3.9.

Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (1990), Corollary 1.2.4, p. 15 and Theorem 1.3.1, pp. 15–16. Gives unit detection and the spectral maximum, rather than only a definition by infimum. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Corollary 2.15, p. 11 and Proposition 2.21, pp. 12–13. Relates spectral uniformization to the same spectrum.

**Check.** A nonzero nilpotent has spectral radius zero. In ℝ×ℝ the radius is max(|a|,|b|), not a multiplicative norm.

The headline `Spectrum.isUnit_iff` includes the archimedean extension and the empty-spectrum zero-ring case. The spectral maximum is imported from AdicSpacesPartIII §R3.9; its maximizing point requires a nonzero ring and its root-norm limit uses positive powers.

### 0.15 Completed residue fields

Construct *the general Banach residue-field realization*. On nonarchimedean affinoid charts compare with AlgebraicModuliForArithmeticGeometry §7.10.2’s H(x); the additional range is a general normed Banach spectrum, including archimedean rings. For x∈M(A), ker(x) is prime, x descends to an absolute value on Frac(A/ker(x)), and H(x) is its completion. Evaluation A→H(x) has absolute value x. Bounded pullback f*:M(B)→M(A) induces an isometric field embedding H(f*x)→H(x).

A commutative normed ring; x a normalized dominated multiplicative seminorm.

Provide the following interface:

- A bounded ring map A→H(x) realizes x(a)=|a(x)|.
- The fraction field of A/ker(x) has dense image in H(x).
- Pullback induces an isometric embedding; identities and composites agree.
- Any isometric complete valued-field realization of x contains a unique isometric image of H(x).

**Checks.**

- At a K-rational point of A¹, H(x)=K.
- At the unit Gauss point over algebraically closed K, the residue field is κ(T), rather than κ.
- A point with nonzero kernel uses A/ker(x); taking Frac(A) would fail.

For the construction, multiplicativity makes the kernel prime; define |a/b|=x(a)/x(b), prove independence and complete. Extend the induced fraction-field embedding uniquely to completions.

*Needs:* §0.1; §0.9; AlgebraicModuliForArithmeticGeometry §7.10.2 for the nonarchimedean affinoid comparison.

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definition I.2.1 and Lemma I.2.5, pp. 6–7. Gives the residue-field construction and its role in point types. [Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §2.2.2, pp. 6–7. Evaluation realizes a spectral point in a complete valued residue field.

### 0.15a Isometric amalgamation of absolute-valued fields

Prove *isometric field amalgamation*. For isometric embeddings of complete real absolute-valued fields F→K and F→L, construct a complete absolute-valued field E and isometric embeddings K→E and L→E agreeing on F. Include trivial and archimedean absolute values. The embeddings preserve the specified absolute values, not just valuation classes (Scholze, Proposition 3.2(i) and proof, pp. 14–15; Poineau–Turchetti, Proposition I.5.1, pp. 19–20).

For the nonarchimedean proof, start with AdicSpacesPartII §R0.7 valuation amalgamation and establish its real-valued isometric refinement; complete the common field. In the archimedean case use §0.26 to identify the common real or complex powered absolute value and choose compatible embeddings. This proof route depends on §0.26, whose only spectral input is §0.13, so it does not use the colimit theorem of §0.16.

**Checks.**

- For F=K=L=ℝ with its ordinary norm, the identity amalgam sends 2 to a value of 2 on both sides; replacing the norm by its square root gives √2 and fails isometry.
- For F=ℝ and K=L=ℂ, either conjugate amalgam has |i|=1 and |2|=2; uniqueness of the amalgam is not asserted.
- For trivially valued F=𝔽₂ and K=L=F, take E=F: the values of 0 and 1 are 0 and 1. A zero-ring target cannot be a field amalgam.

*Needs:* §0.13; §0.26 for the archimedean route; AdicSpacesPartII §R0.7 for valuation-class amalgamation; native field completions.

### 0.16 Spectra and contractive colimits

Prove *contractive colimits*. In the category of commutative Banach rings and contractive maps, complete separated projective ℓ¹ tensor products compute pushouts. The induced map from M(B⊗̂_A C) to the fiber product of M(B) and M(C) over M(A) is surjective. Filtered colimits, formed by seminormed colimit and separated completion, have spectrum canonically homeomorphic to the inverse limit of the spectra. All small colimits exist in this category; ℤ with its usual absolute value is initial.

The tensor norm is the projective ℓ¹ norm in the general archimedean category. Nonarchimedean affinoid tensor norms are a separate specialization.

For the proof, for compatible points use valued-field amalgamation to obtain a bounded tensor evaluation. For filtered colimits compatible seminorms define a single dominated seminorm on the algebraic colimit, then extend to completion; compact Hausdorff topology identifies the inverse limit.

*Needs:* [0.12 Seminormed Banach rings](#012-seminormed-banach-rings); [0.15 Completed residue fields](#015-completed-residue-fields); §0.15a isometric field amalgamation (isometric complete-field embeddings, including the archimedean case).

[Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Proposition 3.2, pp. 14–15. Pushout comparison is surjective, not an asserted homeomorphism; filtered-colimit comparison is a homeomorphism. [Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Proposition 2.4, p. 8. Computes the contractive category colimits using infimum quotient/projective ℓ¹ seminorms and separated completion.

**Check.** For ℂ⊗̂_ℝℂ, the two conjugate factors give two points over the single pair of field-norm points: injectivity fails. Do not replace ℓ¹ by a maximum tensor seminorm in the archimedean category. Every unital ring map ℤ→A is contractive because ||n·1||≤|n|. A trivially normed ℤ would not be initial in the archimedean category.

### 0.17 Affinoid algebras over valued fields

Define *affinoid algebras*. Use RestrictedPowerSeries §§0.1 and 1.1 for K{r⁻¹T} at arbitrary positive polyradii and its complete weighted Gauss norm. A K-affinoid algebra is a Banach quotient of this imported algebra. Strict affinoids admit a presentation with radii 1. Morphisms are bounded K-algebra maps and presentations are auxiliary data.

K may be trivially valued; radii need not belong to |K×|.

Provide the following interface:

- In a complete nonarchimedean normed K-algebra B with contractive scalar map, a tuple b with ||b_i||≤r_i gives a unique contractive K-algebra evaluation map K{r⁻¹T}→B. The target norm and its nonarchimedean triangle inequality are part of this assertion.
- Closed-ideal quotients give affinoid algebras with quotient norm.
- Completed scalar extension preserves affinoid presentations and identities/composites.
- A finite list of radii can be realized in a complete valued extension so that the base change is strict.

**Checks.**

- K{T} gives the closed unit disc, not the open disc.
- A radius outside the divisible closure of |K×| is allowed and need not be strict.
- The quotient K{T}/(T) is K, with singleton spectrum.
- For B=K with its specified norm, evaluation at b with |b|≤r is contractive. A target with an uncontrolled scalar norm does not satisfy this universal property.

Import the weighted-series algebra, Gauss norm, completeness and universal evaluation from RestrictedPowerSeries §§0.1, 1.1 and 2.1. Construct the affinoid quotients, separate quotient norms, compare bounded presentations and prove strictification; no second weighted-series algebra is constructed.

*Needs:* [0.12 Seminormed Banach rings](#012-seminormed-banach-rings); RestrictedPowerSeries §§0.1, 1.1 and 2.1.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definition 3.1.1.1 and Fact 3.1.4.1, pp. 11–14. Weighted Tate algebras, strictness, quotients and completed scalar extension.

### 0.17a Faithful scalar extension over trivial bases

Prove *faithful scalar extension*. Let K be a complete trivially valued field, L/K a complete isometric nonarchimedean extension and B a Banach K-vector space. The nonarchimedean projective tensor seminorm on B⊗_K L is separated, so the canonical map B⊗_K L→B⊗̂_K L is injective. For a K-affinoid algebra A and a finite A-module M with its canonical finite-module topology, completed scalar extension is faithful: M⊗̂_K L=0 implies M=0. Prove strict exactness for the finite-module sequences used in affinoid descent, and identify sections on each finite rational intersection after extension (Temkin, Fact 3.1.4.1, pp. 13–14 and §§3.3.1–3.3.3, pp. 16–18).

Use the projective nonarchimedean tensor norm, rather than the general-category ℓ¹ norm. A trivially valued field is spherically complete; finite-dimensional orthogonal decompositions separate each nonzero finite tensor. The finite-module quotient and strictness arguments then give faithful descent. AdicSpacesPartII §R0.18 supplies the corresponding nontrivially valued range.

**Checks.**

- B=K=L has 1⊗1 of norm 1 and completed tensor K; a completion killing this tensor violates faithfulness.
- For B=K² with maximum norm and any isometric L/K, the two basis tensors have norms 1 and remain independent in L².
- The zero module extends to zero. For A=K{T} and M=A/(T), scalar extension is L, so this nonzero quotient is detected even when K is trivial and L is nontrivial.

*Needs:* §0.17; native normed tensor products and completions; AdicSpacesPartII §R0.18 for the nontrivial-base comparison.

### 0.18 Valued base change of spectra

Prove *spectral base change*. For complete nonarchimedean K, a K-affinoid algebra A and complete valued extension L/K, M(A⊗̂_K L)→M(A) is continuous proper surjective. For a finite normal extension it is the topological quotient by the separable Galois group, with purely inseparable extension inducing a homeomorphism. Completed algebraic closure has the corresponding Galois quotient.

Affinoid completed tensor product; absolute values extend that of K.

For the proof, a point lifts by amalgamating H(x) and L over K and evaluating in a common complete valued field. Compactness gives properness in the affinoid case. Normal-extension orbit classification is checked on residue fields, then passed to the completed algebraic closure.

*Needs:* [0.15 Completed residue fields](#015-completed-residue-fields); [0.17 Affinoid algebras over valued fields](#017-affinoid-algebras-over-valued-fields); §0.15a isometric field amalgamation; AdicSpacesPartII §R0.18; §0.17a faithful scalar extension.

Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (1990), Proposition 1.3.5 and Corollary 1.3.6, p. 16. Normal and purely inseparable spectrum comparison. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Propositions I.5.1 and I.5.5, Corollary I.5.6, pp. 19–22. Valued amalgamation proves surjectivity; the quotient statements are topological.

### 0.19 Rational and affinoid domains

Compare *weighted rational presentations with affinoid domains*. Use AlgebraicModuliForArithmeticGeometry §7.10.2’s affinoid domains; identify the following normed presentations with their representing algebras. A rational domain {|f_i|≤r_i|g|}⊂M(A), where (g,f_i) generate the unit ideal, is represented by A{r⁻¹T}/(gT_i−f_i). An affinoid domain is a compact subset with an affinoid algebra universally representing maps from affinoid spectra whose images lie there; it carries the induced topology and unchanged completed residue fields.

Finite inequalities, positive radii and the unit-ideal condition; general affinoid domains need not be open subsets.

Provide the following interface:

- Any affinoid map with image in the domain factors uniquely through its representing algebra.
- Finite intersections of rational domains are rational and restriction maps compose.
- The representing point and its image have canonically isometric H-fields.
- An affinoid domain has a finite rational cover in the Gerritzen–Grauert range.

**Checks.**

- A closed subdisc in a disc is an affinoid domain but is not generally topologically open.
- Without the unit-ideal condition the displayed quotient can retain unwanted fibres over g=f_i=0.
- The annulus r≤|T|≤1 has both T and a bounded inverse in its domain algebra.

For the construction, verify the rational universal property using g invertible on any factoring test spectrum and unit detection. Identify fibres and residue fields using AdicSpacesPartII §R0.18 in its nontrivial range and §0.17a faithful scalar extension; glue finite rational covers for general affinoid domains.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.2 for the analytic domains and G-sheaf; [0.17 Affinoid algebras over valued fields](#017-affinoid-algebras-over-valued-fields); [0.14 Units and spectral maximum](#014-units-and-spectral-maximum); [0.15 Completed residue fields](#015-completed-residue-fields); AdicSpacesPartII §R0.18; §0.17a faithful scalar extension.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 3.2.2.1 and 3.2.3.1; Fact 3.2.3.2, Exercise 3.2.3.3 and Fact 3.2.3.4, pp. 14–16. Distinguishes rational inequalities from the universal affinoid-domain definition and states Gerritzen–Grauert.

### 0.20 Affinoid structure sheaf and acyclicity

Compare *weighted affinoid sections and acyclicity*. Use the analytic G-sheaf on AlgebraicModuliForArithmeticGeometry §7.10.2’s affinoid nets. On M(A), finite affinoid-domain covers form the compact G-topology. The assignment U↦A_U with bounded restrictions is a sheaf; for a finite affinoid cover and finite A-module M the augmented Čech complex of associated sections is exact. For nontrivially valued strict K-affinoids import the stronger existing acyclicity theorem; extension to weighted nonstrict affinoids uses strictifying base change and descent.

Finite A-module in the general Berkovich statement; strict nontrivial-value part supplied externally.

Provide the following interface:

- Domain inclusions induce bounded restriction homomorphisms satisfying identity/composition.
- Compatible sections over a finite affinoid-domain cover glue uniquely.
- Global sections recover A as a K-affinoid algebra.
- Finite-module sections have the stated exact augmented Čech complex.

**Checks.**

- A one-chart cover has the identity equalizer.
- Two Laurent domains covering an annulus glue the same Laurent function.
- The sheaf is on affinoid G-covers; arbitrary set covers are not declared admissible.

For the construction, use rational refinements and Laurent-cover acyclicity, then finite Čech refinement. Prove descent after adjoining the finitely many radii by the strictification construction below.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.2 for the analytic domains and G-sheaf; [0.19 Rational and affinoid domains](#019-rational-and-affinoid-domains); RigidAnalyticGeometry Layer 5; AdicSpacesPartII §R0.18; §0.17a faithful scalar extension.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §§3.3.1–3.3.3, pp. 16–18. Finite compact covers, Tate acyclicity, sheaf equalizers and affinoid analytic spaces.

For arbitrary positive radii, prove faithful strictification before applying the strict Čech theorem. Choose a complete valued extension whose value group contains the required radii and is nontrivial, including when K is trivially valued. Establish faithful scalar extension on finite modules, identify sections on every finite intersection after completed base change, and descend the augmented Čech complex using that faithful extension. Compatibility of different strictifications makes the result independent of the auxiliary field. This is the nonstrict descent argument in Temkin §§3.3.1–3.3.3, pp. 16–18; it is an additional construction beyond the strict supplier theorem.

### 0.21 Analytic atlases and morphisms

Construct *the norm-sensitive affinoid comparison* with AlgebraicModuliForArithmeticGeometry §7.10.2’s general K-analytic category. A supplied object has a locally Hausdorff carrier, a net of compact affinoid domains and compatible affinoid algebras, localized under common atlas refinement. Identify its affinoid M(A) with the normalized weighted quotient presentation of §§0.17–0.20 and its chart-local morphisms with the bounded K-algebra maps of those presentations. The comparison is the identity on seminorm evaluations and on completed residue fields (Temkin §§4.1.1–4.1.3, pp. 22–24).

K is complete nonarchimedean; Hausdorffness is a separate property. For nontrivially valued K identify the strict Hausdorff specialization with ClassicalAdicEtaleCohomology §3.1’s strict atlases. Nonstrict, trivially valued and non-Hausdorff objects use the supplied general category through the same weighted-chart comparison.

Provide the following interface:

- Each weighted affinoid presentation identifies its spectrum and domain sheaf with the supplied affinoid object, preserving every evaluation.
- The comparison commutes with gluing of compatible analytic-domain charts and with common net refinement.
- Equality of chart maps transports to equality of supplied analytic morphisms on a domain cover.
- Bounded chart maps and their composites identify with the supplied category laws.
- The comparison preserves the canonical isometric embeddings on H-fields.

**Checks.**

- A nonseparated doubled disc is an analytic space but need not be Hausdorff.
- Affinoid-domain inclusions are morphisms even when the domain is not a topological open.
- Changing to a rational refinement gives an equivalent analytic space.

For the comparison, match the normalized bounded spectrum on each weighted affinoid chart, then identify domain restrictions by their universal property. Common refinements and the section equalizers of §0.20 make the chart identifications agree on overlaps. Transport the supplied gluing and morphisms; completed residue-field embeddings verify compatibility.

*Needs:* §0.17 weighted affinoids; §0.19 domain presentation; §0.20 finite-module sections; AlgebraicModuliForArithmeticGeometry §7.10.2 for the general category; ClassicalAdicEtaleCohomology §3.1 for the strict Hausdorff comparison.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Definitions 4.1.1.1 and 4.1.2.1; §§4.1.2–4.1.3, pp. 22–24. Specifies nets, affinoid atlases, domain sheaves and chart-local morphisms.

### 0.22 Berkovich analytification

Construct *analytification*. For a finite-type K-scheme X, glue the analytic spaces of affine pieces, whose points are scheme points ξ with an absolute value on κ(ξ) extending K. This defines Xᵃⁿ functorially, with H(x) the completion of κ(ξ). For separated proper X it is Hausdorff compact; for smooth X it is quasi-smooth. Scalar extension commutes with analytification. Gluing the same construction on finite-type affine opens defines analytification for every locally finite-type K-scheme; separation is tested on chart overlaps, and compactness is asserted only in the proper finite-type case.

Complete nonarchimedean K; finite-type schemes; use the existing scheme and adic-analytification infrastructure, not a second scheme theory.

Provide the following interface:

- Pairs (ξ, extended absolute value) give analytic points with the prescribed H-field.
- A scheme morphism induces an analytic morphism, respecting identity/composition.
- Affine analytic charts agree with the bounded-radius construction.
- (X_L)ᵃⁿ≅Xᵃⁿ⊗̂_K L.

**Checks.**

- (Spec K)ᵃⁿ is one point.
- A¹ᵃⁿ contains Gauss points, so X(K) alone is the wrong carrier.
- P¹ᵃⁿ is compact whereas A¹ᵃⁿ is not compact for nontrivial K.

For the construction, on polynomial presentations cover by increasing bounded-radius affinoid domains; glue along principal-open domains. Prove the universal analytic mapping property and field-extension compatibility chartwise. Prove the properness, separation and coherent GAGA comparisons of Temkin Facts 5.1.2.1–5.1.2.2 directly in the general valued-field setting. For a projective scheme embed in projective space, use its finite compact affinoid covering and closed analytic equations; extend to proper finite-type schemes by the proper comparison theorem. The later strict adic equivalence is a compatibility result, not a prerequisite for the general or trivially valued case.

*Needs:* [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms); AdicSpacesPartII §R1.3 (`analytification-functor`).

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), §5.1, Exercise 5.1.1.1 and Facts 5.1.1.2, 5.1.2.1–5.1.2.2, pp. 33–34. Algebraic analytification, its local constructions, properness and coherent GAGA; the general valued-field comparison is a theorem target here.

Prove the *proper coherent GAGA comparison*: for a proper finite-type K-scheme over any complete nonarchimedean K, analytification induces an equivalence between algebraic and analytic coherent sheaves, and the canonical maps Hⁱ(X,𝓕)→Hⁱ(Xᵃⁿ,𝓕ᵃⁿ) are isomorphisms for every i≥0. Transport AdicSpacesPartIII §R3.7 in the strict nontrivially valued range through ClassicalAdicEtaleCohomology §3.1’s equivalence, identified with the §0.21 carrier in §0.30; prove the general valued-field extension by the affine analytic comparison and proper descent (Temkin Facts 5.1.2.1–5.1.2.2, p. 34).

*Needs:* §0.22 affine charts and properness; §0.20 coherent Čech comparison; AdicSpacesPartIII §R3.7, ClassicalAdicEtaleCohomology §3.1 and §0.30 only for the strict comparison route. The general-valued proof uses neither that strict equivalence nor §1.4.

**Checks.**

- Spec K has H⁰=K and higher coherent cohomology zero on both sides.
- P¹ has H⁰(O)=K and H¹(O)=0 on both sides.
- On nonproper A¹ over ℚ_p, the entire series Σₙ≥0 p^(n²)Tⁿ is analytic and is not a polynomial; this comparison requires properness.

### 0.23 Hybrid analytic spaces

Construct *hybrid analytic space*. For a projective meromorphic family X over a punctured complex disc, choose 0<r<1 small enough for its defining coefficients. The Banach ring A_r of convergent Laurent series uses coefficient hybrid norm max(|c|∞,|c|triv) and weight rⁿ. Its spectrum is the closed disc; the associated analytic family has usual complex fibers for t≠0 and central fiber at parameter 0 equal to Xᵃⁿ over ℂ((t)), where the formal parameter has nonarchimedean absolute value r. The topology makes `|f|^{log r/log|t|}` converge to its nonarchimedean evaluation; the SNC-model hybrid inverse limit gives the same space.

Projective meromorphic family; the Laurent series have finitely many negative terms and finite weighted hybrid sum; fix r within the convergence radius. The complex family is a smooth projective submersion meromorphic at 0; shrink to the closed disc of radius r. The analytic-space machinery must include general Banach-ring bases, not just nonarchimedean K-affinoid charts.

Provide the following interface:

- The hybrid space projects continuously and properly to the closed parameter disc.
- For t≠0 the fiber is homeomorphic to the usual complex analytic X_t.
- At 0 the fiber is the nonarchimedean analytification over ℂ((t)) with |t|=r.
- The rescaled complex evaluations extend to the central nonarchimedean evaluations.
- The analytic construction agrees with the inverse limit of SNC hybrid models.

**Checks.**

- For the constant family P¹, the central fiber is Berkovich P¹, not the complex sphere.
- The parameter monomial t has rescaled absolute value r at every nonzero fiber and at the center.
- A series converging only on a smaller disc cannot be used at a larger fixed r.

Define the *hybrid model category* using a small skeleton of normal complex spaces proper and flat over the fixed parameter disc with an identified restriction to X over the punctured disc. When a construction is made over a smaller disc, glue its punctured restriction to the given family X outside the center and prove that this extends it to a proper flat model over the fixed disc; all transition maps and inverse limits use that fixed base. Morphisms are proper maps inducing that identity; domination points from a finer model to a coarser one. Its SNC subcategory consists of smooth total spaces whose central Cartier divisor has strict-normal-crossings reduced support; component multiplicities are retained. Prove nonemptiness, common SNC domination of any two models, and cofinality of projective SNC models: every model is dominated by a projective SNC model, and two such dominations have a common projective SNC refinement (Boucksom–Jonsson §4.1 and Lemma 4.1, pp. 20–21; §4.6, equation (4.3), p. 25).

Provide the following model-category interface:

- Domination maps are the identity over the punctured disc, extend across the fixed disc by that identity when constructed near zero, compose, and induce compatible continuous maps between the dual complexes and hybrid models.
- Projective meromorphic equations give a proper model germ, and principalization of the central ideal gives an SNC model without changing the punctured family.
- The SNC model category is nonempty and cofiltered; its projective subcategory is cofinal for inverse limits, including the common-refinement condition.
- The central retractions identify the Berkovich space over ℂ((t)) with the inverse limit of the projective SNC dual complexes.

Prove *convergent-model resolution transport* in this family setting. Establish noetherianity and quasi-excellence of the convergent complex local algebras and their finite-type model charts, and compare blowups, their punctured restrictions, regular loci and reduced divisor support with the associated analytic modifications. Transport ResolutionOfSingularitiesCharacteristicZero §7.7's pair principalization through these comparisons. Prove the relative analytic domination step: any proper modification of a fixed projective model, trivial over the punctured disc, is dominated after shrinking by a projective modification supported on the central fiber. Apply this to graph closures of model comparisons and principalize the resulting central ideals to obtain the stated cofinality. These are family comparison targets; the scheme theorem alone does not assert them (Boucksom–Jonsson §4.1, proof of Lemma 4.1, pp. 20–21).

**Checks.**

- The constant family P¹ has the smooth projective model P¹×D and a one-point dual complex; further blowups are still needed in the inverse system, whose central limit is Berkovich P¹ rather than that one point.
- Blowing up the origin of the nodal chart xy=t replaces its two multiplicity-one components by their strict transforms and a multiplicity-two exceptional component. On a new edge the coordinates satisfy w_x+w_y=1, with the exceptional vertex at (1/2,1/2); assigning it multiplicity one would violate the central-divisor equation.
- A central blowup constructed over |t|<r/2 glues to the unchanged family on t≠0, recovering exactly X_t for r/2≤|t|≤r; it is thereby a model over the fixed disc, not an undefined term of its inverse system. The identity domination induces the identity on each dual complex; two different central blowups require a common dominating model, rather than an assumed morphism between the two blowups.

For the construction, build the hybrid Banach base, identify nonzero fibers with powered complex absolute values and the zero fiber with the t-adic completion. Use the model-category and transport targets to compare affinoid evaluations with SNC-model logarithmic coordinates. Identify the central fiber through the projective cofinal subsystem before proving continuity of the full hybrid comparison.

*Needs:* [0.12 Seminormed Banach rings](#012-seminormed-banach-rings); [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms); [0.22 Berkovich analytification](#022-berkovich-analytification); ResolutionOfSingularitiesCharacteristicZero §7.7 pair principalization; this section's convergent-model resolution transport, relative analytic domination, common SNC domination and projective cofinality.

[Sébastien Boucksom and Mattias Jonsson, Tropical and non-Archimedean limits of degenerating families of volume forms](https://arxiv.org/pdf/1605.05277v2), Definition 4.9, pp. 23–24 and Proposition 4.12, pp. 25–26; Appendix A. Supplies the topology and Banach analytic realization; no volume-form or dynamical convergence result is inferred. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://arxiv.org/pdf/1901.09945v2), §4, pp. 18–22. Uses the rescaled potential convention in the dynamical family.

**Check.** For f=c·tᵐ with c≠0, its rescaled complex absolute value tends to rᵐ as t→0: the exponent of |c| tends to zero, while the parameter factor equals rᵐ. The central coefficient norm is trivial, so the central evaluation also equals rᵐ, including negative m.

Construct scheme analytification over the mixed Banach ring A_r, including bounded affine charts and their gluing; the purely nonarchimedean affinoid atlas alone does not do this. For an SNC model construct the logarithmic retraction to its dual complex and prove compatibility under dominating models. Prove the central inverse-limit identification using the projective SNC cofinality above and equation (4.3), before applying Proposition 4.12. Boucksom–Jonsson Appendix A, pp. 43–48 and §§4.1–4.6, pp. 20–29 give these constructions. Retain the Laurent norm |f|=r^ord₀(f) at the central point: in particular |t|=r. Family-specific convergence of dynamical potentials is a downstream ArithmeticDynamics result.

**Check.** The central point evaluates t to r<1, not r⁻¹. The latter would exceed its ambient norm and would not be a point of M(A_r). Thus use r^ord₀(f) in Boucksom–Jonsson Proposition A.4, preprint p. 45 / JEP p. 136, consistently with Appendix A.5–A.6, JEP pp. 136–137.

### 0.24 Uniform Gelfand representation

Prove *the Gelfand representation*. For a uniform commutative Banach ring A, the evaluation homomorphism A→bounded product of H(x) for x∈M(A) is isometric. Here ∏ᵇ is the ring of tuples (b_x) with finite sup_x|b_x|, equipped with pointwise operations and that supremum norm; evaluation lands there because |a(x)|≤||a||. The unrestricted product is not equipped with a finite supremum norm. If A is nonzero, ||a||=max_x|a(x)|. For the zero ring the supremum over the empty family of nonnegative values is zero; no maximizing point exists. For arbitrary A its kernel is the spectral seminorm-zero ideal, not necessarily zero.

Uniform means the given complete norm is power-multiplicative.

For the proof, for a nonzero element in a power-multiplicative ring, adjoin its inverse with inverse norm bounded by its reciprocal. Power multiplicativity keeps the norm of one equal to one. Nonemptiness of this Banach localization produces a field-valued evaluation attaining the original norm. The spectral maximum then identifies the Gelfand kernel and the isometric uniform representation.

*Needs:* [0.14 Units and spectral maximum](#014-units-and-spectral-maximum); [0.15 Completed residue fields](#015-completed-residue-fields).

[Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Definitions 2.19–2.20 and Proposition 2.21, pp. 12–13. The uniform Gelfand transform is an isometric embedding. Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields* (1990), Corollary 1.3.2, p. 16. The spectral/Gelfand kernel is the seminorm-zero ideal.

**Check.** The dual numbers have a nonzero element in the kernel before uniformization. In the bounded product of countably many copies of ℝ, the tuple (1,2,3,…) is excluded; it cannot be assigned a finite supremum norm.

**Check.** The zero uniform ring maps isometrically to the empty product, which is the zero ring. Its norm is zero, but its empty spectrum has no point attaining a maximum. Keep the isometry in this case and restrict the assertion of attainment to nonzero A.

**Check.** On K[T], the evaluation points at T=0 and T=1 agree on the base K and differ on T. The topology of an algebra's multiplicative spectrum must therefore test all its own elements. In Temkin Definition 2.2.3.1, author preprint p. 7, read the evaluation coordinate as an element of that algebra C.

### 0.25 Idempotents and clopen subsets

Prove `Spectrum.existsUnique_idempotent_of_isClopen`. For a separated complete commutative Banach ring A with ‖1‖≤1, e↦{x∈M(A):x(e)=1} is a bijection from idempotents to clopen subsets, carrying 0,1 and complementary idempotents to ∅,M(A) and complementary subsets.

Complete commutative Banach ring with normalized unit.

For the proof, multiplicativity restricts x(e) to 0 or 1. If e and e′ have the same values, the idempotents e(1−e′) and e′(1−e) have spectral radius zero and are zero, giving e=ee′=e′. Lift idempotents by Newton iteration from the uniform completion. For a two-domain spectral cover, the overconvergent Laurent equalizer glues compatible idempotents. Refine a clopen partition by finitely many such domains; complementing the vanishing-locus convention gives the stated value-one convention. Prove the closed-ideal and equalizer statements of KL Corollary 2.8.9 in the descent argument below.

*Needs:* [0.14 Units and spectral maximum](#014-units-and-spectral-maximum); [0.24 Uniform Gelfand representation](#024-uniform-gelfand-representation).

[Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.18 and its direct proof, pp. 11–12. Classifies clopen spectral subsets by ring idempotents.

**Check.** For ℝ×ℝ the four idempotents correspond to the four subsets of its two-point spectrum.

Descend the two local idempotents associated to a clopen decomposition through an overconvergent Laurent cover. Prove the Laurent equalizer and its closed-ideal property using Kedlaya–Liu Corollary 2.8.9, then use Newton iteration to lift an approximate idempotent in the complete ring. Scholze Theorem 2.18, pp. 11–12 uses this route. It applies to the general Banach category here without asserting an ordinary-topology structure sheaf on every M(A).

### 0.26 Archimedean Banach fields

Prove `archimedean_field_classification`. A commutative Banach field K with |2|>1 is isomorphic as a normed field to ℝ or ℂ with |·|_usual^α for a unique exponent 0<α≤1.

Complete multiplicative absolute value, normalized at one; archimedean condition |2|>1.

For the proof, |2|>1 forces characteristic zero, since an absolute value is trivial on a finite prime field. Restrict to ℚ and use Mathlib `Rat.AbsoluteValue.equiv_real_of_unbounded`: the value at 2 excludes a bound by 1 on the naturals. Identify the completed prime subfield with the corresponding power of the real absolute value. Apply the complex spectral/nonemptiness argument after complex scalar extension to force algebraic degree at most two; retain the real alternative and the norm exponent.

*Needs:* §0.13; Mathlib `Rat.AbsoluteValue.equiv_real_of_unbounded`; the complex projective-tensor construction of §0.12, without using §0.16’s colimit theorem.

[Peter Scholze, Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Theorem 2.12, p. 10. Gelfand–Mazur in the norm-sensitive category, including real fields and exponents.

**Checks.**

- For ℝ with its usual norm, |2|=2 and the exponent is α=1.
- For ℂ with norm √|·|, |2|=√2 and the exponent is α=1/2; |1/4|=1/2 tests the same exponent near zero.
- For ℚ₂, |2|=1/2, and for ℚ₃, |2|=1. Both fail |2|>1; no archimedean conclusion applies.

### 0.27 Uniform units and trivial spectrum

Define *uniform unit hierarchy*. A topologically nilpotent element satisfies ||aⁿ||→0. A uniform unit is an invertible topologically nilpotent z with ρ(z)ρ(z⁻¹)=1. A Banach ring is free of trivial spectrum when every H(x) has nontrivial absolute value; equivalently the ideal generated by its topologically nilpotent elements is the unit ideal. For nonzero nonarchimedean Banach rings, being a bounded Banach algebra over an analytic field implies admitting a uniform unit, which implies admitting a topologically nilpotent unit, which implies freedom of trivial spectrum. The converse from a uniform unit to an analytic-field algebra in characteristic p requires additional norm control, for example equivalence of the norm with the spectral norm.

The Banach ring is nonzero and separated complete. An analytic field is complete and nontrivially valued. All scalar homomorphisms in the hierarchy are bounded for the specified norms.

Provide the following interface:

- For a uniform unit z and every x∈M(A), x(z)=ρ(z)∈(0,1).
- A bounded analytic-field algebra has a uniform unit; a uniform unit is a topologically nilpotent unit; its existence excludes trivially valued H(x).
- Freedom of trivial spectrum is equivalent to generation of the unit ideal by topologically nilpotent elements.
- Import PadicFunctionalAnalysis §0.4’s gauge for a complete Tate Huber ring with ring of definition A₀, pseudouniformizer z∈A₀ and 0<c<1. Prove its uniform-unit comparison: the separated gauge ||a||=inf{cⁿ:z⁻ⁿa∈A₀} induces the given topology and makes z a uniform unit with spectral value c. This is a chosen gauge; the norm-sensitive M(A) is not declared invariant under arbitrary changes of compatible norm.

**Checks.**

- A nontrivially valued complete field has uniform units, and all its spectral residue fields are nontrivially valued.
- A trivially normed nonzero field has no topologically nilpotent unit and fails freedom of trivial spectrum.
- For k((z₁))×k((z₂)) with supremum norm and |z_i|=exp(−c_i), where c₁/c₂ is irrational, (z₁,z₂) is a topologically nilpotent unit but no uniform unit exists for this norm.
- In characteristic p, the complete weighted norm max_i ρⁱ(1+|i|) on F_p((z)) has a uniform unit z yet admits no bounded scalar map from any analytic field; this rejects the unqualified converse.

For the construction, the spectral maximum and the inverse identity force x(z)=ρ(z) for every spectral point. Apply the unit criterion to the ideal of topologically nilpotent elements for the trivial-spectrum characterization. A topologically nilpotent scalar from the analytic base field gives a uniform unit. In characteristic p and a uniform Banach ring, the estimates on all positive and negative powers of z extend the Laurent-series map from F_p((z)) boundedly. Apply PadicFunctionalAnalysis §0.4’s chosen z-adic gauge. Compare its multiplicative action by z with the spectral radius to get the uniform normalization; this does not assert that the original norm had that normalization.

*Needs:* [0.12 Seminormed Banach rings](#012-seminormed-banach-rings); [0.14 Units and spectral maximum](#014-units-and-spectral-maximum); [0.15 Completed residue fields](#015-completed-residue-fields); PadicFunctionalAnalysis §0.4.

[Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5), Remark 2.3.9, p. 35; Remark 2.4.4, p. 39. Defines the hierarchy and the Tate gauge norm; the characteristic-p converse is used only with the integral-power norm control specified below.

**Check.** A uniform unit by itself does not give a bounded analytic-field scalar structure for an arbitrary specified Banach norm in characteristic p. On F_p((z)) with 0<r<1, the complete submultiplicative weighted norm of Σa_i z^i is maxᵢ:aᵢ≠0 rⁱ(1+|i|). The spectral values of z and z⁻¹ are r and r⁻¹. A putative bounded scalar map taking a small scalar to positive z-valuation k would bound both positive and negative powers, forcing (1+nk)²≤C² for all n, which is impossible. Require control of all integral powers, for instance a uniform Banach norm, for this converse to Kedlaya–Liu Remark 2.3.9, arXiv v5 p. 35. Part II Appendix A, pp. 189–191 does not supply that extra hypothesis.

### 0.28 Normalized rank-one adic quotient

Construct the *uniform-unit spectrum comparison*. Let A be a complete nonarchimedean Banach ring with a uniform topologically nilpotent unit z, and let A⁺⊂A° be open and integrally closed in A. Put c=ρ(z)∈(0,1). Compare M(A) with DiamondsAndVStacks §D5.13’s continuous nonarchimedean spectrum normalized at z with value 1/2. Define θ:M(A)→BerkovichSpectrum(A,z) by θ(x)(a)=x(a)^s, where s=log(1/2)/log(c)>0; its inverse raises evaluations to t=log(c)/log(1/2). Prove that θ is a homeomorphism for the evaluation topologies (Kedlaya–Liu Definition 2.4.6, p. 40, together with the uniform-unit normalization of §0.27).

Provide the following interface:

- The comparison preserves evaluations with the specified exponent: θ(x)(a)=x(a)^s, including value zero; its inverse uses t and st=1.
- The inverse seminorm is dominated by the specified Banach norm, and every point of M(A) has value c on z.
- Transport the supplied quotient and section as r=θ⁻¹∘ofSpa:Spa(A,A⁺)→M(A) and toSpa∘θ:M(A)→Spa(A,A⁺). Thus r is the maximal Hausdorff quotient and their composite on M(A) is the identity; the section is only a map of sets.
- The quotient agrees under the supplier’s change of pseudouniformizer and is independent of A⁺, although Spa can depend on A⁺.

For the comparison proof, use the uniform-unit identity to fix x(z)=c. Positive powers preserve nonarchimedean seminorms and continuity. Conversely the normalized continuous seminorm, rescaled to value c, is the representative selected by the uniform-unit formula in Kedlaya–Liu Definition 2.4.6; that formula gives domination for the specified norm. The reciprocal exponents give inverse continuous maps, coordinate by coordinate. Transport the unique maximal generization, section and Hausdorff universal property from DiamondsAndVStacks §D5.13. For a general complete Tate Huber pair, first use §0.27’s chosen z-adic gauge; this does not assert the comparison for every compatible Banach norm.

*Needs:* [0.1 Berkovich spectrum](#01-berkovich-spectrum); [0.27 Uniform units and trivial spectrum](#027-uniform-units-and-trivial-spectrum); DiamondsAndVStacks §D5.13; TauCetiRoadmap.AdicSpaces Layer 2.

[Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5), Definition 2.4.1 and Remark 2.4.4, pp. 38–39; Definition 2.4.6, p. 40. These fix the Banach-pair and uniform-unit conventions for comparison with the supplied Tate normalization.

**Checks.**

- On ℚ₃ with z=3 and c=1/3, θ sends the value 1/3 to 1/2; its inverse sends 1/2 to 1/3 with exponent log(3)/log(2). Leaving the exponent at one gives the wrong specified absolute value.
- On z⁻¹ in the same field, the supplied value 2 becomes 3, and on zero both comparisons give zero. This tests the inverse exponent above one and the convention 0^t=0 for t>0.
- In the strict closed disc over ℚ₃, the Gauss rank-one valuation and a proper rank-two specialization have the same quotient image; both give the specified values 1 on T and 1/3 on 3. Distinct adic points therefore need not be distinct points of M(A).

Construct the *general Banach rational-domain comparison*. For a complete nonarchimedean Banach ring A with a uniform unit z, A⁺⊂A° as in §0.28, and a Huber rational datum (g,f₁,…,fₙ) generating an open ideal, import AdicSpaces §0.4 and Layer 3’s completed rational localization. Equip it with the separated quotient Gauss seminorm of A⟨T₁,…,Tₙ⟩/(gTᵢ−fᵢ), and complete. Restriction identifies its dominated spectrum homeomorphically with {x∈M(A):x(fᵢ)≤x(g) for all i}, including the induced topology and residue-field embeddings. The specified quotient norm, which may initially be a seminorm, is essential; no assertion for an arbitrary equivalent norm is made (Kedlaya–Liu Definition 2.4.8, p. 40).

The interface consists of the bounded restriction map, its universal property on contractive rational realizations, the spectral homeomorphism, and compatibility with successive rational refinements. The open-ideal condition and the uniform unit imply x(g)>0 on the trace. Identify the quotient Banach algebra with the supplied Huber completion by comparing the two universal properties; spectral unit detection and the density of the uncompleted localization give the trace comparison.

*Needs:* AdicSpaces §0.4 and Layer 3; §§0.12, 0.14 and 0.28; RestrictedPowerSeries §§0.1, 1.1 and 2.1 for restricted series, Gauss norms, completion and evaluation over ultrametric Banach rings.

**Checks.**

- A=ℤ_p((T)) with discrete coefficient norm and |T|=r<1 has uniform unit T, while p is not invertible, so no unital field scalar map is available.
- The datum g=T,f=1 gives the empty trace since 1>r; its separated rational algebra is zero.
- The datum g=1,f=T gives the full trace since r≤1; its rational algebra is A. In the K-affinoid specialization this recovers §0.19.

### 0.29 Rational traces and Hausdorff localization

Prove *Hausdorff localizations*. Under the uniform-unit hypotheses, rational subsets of Spa have closed general Banach rational-domain traces in M(A), and rational neighborhoods encircle every Berkovich point and its open neighborhood. The Hausdorff localization at x is henselian with residue field densely embedded in H(x). Finite étale maps induce open maps on the corresponding Berkovich spectra.

Use the KL Hausdorff-localization colimit over rational neighborhoods, followed by its stated henselian/local residue construction; no claim that a rational trace is open.

For the proof, express normalized inequalities by rational comparisons, refine inside a chosen evaluation-open neighborhood and take the localization colimit. Henselian lifting and finite étale factorization prove the localization and openness statements.

*Needs:* [0.28 Normalized rank-one adic quotient](#028-normalized-rank-one-adic-quotient); the general Banach rational-domain comparison immediately above (the K-affinoid specialization is §0.19).

[Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5), Definition 2.4.8, p. 40; Definition 2.4.12 and Lemma 2.4.17, pp. 41–43. Rational encircling, Hausdorff localization and étale openness in the exact uniform-unit range.

### 0.30 Strict Berkovich–adic equivalence

Construct the *strict analytic carrier comparison*. For complete nontrivially valued rank-one K, identify the Hausdorff strictly K-analytic specialization of §0.21 with ClassicalAdicEtaleCohomology §3.1’s strict analytic category. The comparison is the identity on each strict affinoid M(A), its bounded morphisms and analytic-domain identifications, and respects common atlas refinement. Transport the supplied equivalence with taut adic spaces locally of finite type over Spa(K,K°) through this identification (Temkin §§4.1.1–4.1.3, pp. 22–24; Zavyalov Definition A.6 and Lemma A.7, pp. 84–85).

Provide the following interface:

- The comparison identifies strict affinoid charts, domain intersections, local morphisms and their glued structure sheaves.
- The transported realization has underlying maximal-point quotient; Spa(A,A°) realizes as M(A), with the affinoid normalization of §0.28.
- Transport the supplier’s morphism comparisons: partial properness implies absence of relative boundary, properness is preserved and reflected, and adic étale and smooth maps realize as quasi-étale and quasi-smooth maps. Partial properness upgrades these to étale and smooth maps, with the supplier’s equivalence for étale maps. The general nonstrict, trivially valued and non-Hausdorff objects are compared with AlgebraicModuliForArithmeticGeometry §7.10.2 in §0.21.

For the comparison, match the two presentations of a strict affinoid domain and their bounded maps. Common domain refinements identify atlases and the sheaf equalizers identify the glued structure sheaves. This identifies the categories; apply the supplier’s equivalence and morphism results to this identification.

*Needs:* [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms); [0.28 Normalized rank-one adic quotient](#028-normalized-rank-one-adic-quotient); ClassicalAdicEtaleCohomology §3.1.

[Bogdan Zavyalov, Mod-p Poincaré duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830v3), Appendix A, Definitions A.5–A.6, Lemmas A.7–A.8 and Corollary A.11, pp. 84–86. These describe the supplied strict correspondence and its boundary-sensitive morphism comparisons. Its Huber locators are Proposition 8.3.1 and Remark 8.3.2, pp. 422–425, Lemma 5.6.8(i), pp. 313–314 and Theorem 8.3.5, pp. 428–429 in Huber (1996), and Proposition 4.5(iv), p. 543 in Huber (1994).

**Checks.**

- Spa(K,K°) corresponds to the one-point M(K) through both presentations; the identity map has empty relative boundary.
- Spa(K⟨T⟩,K°⟨T⟩) corresponds to the same closed Berkovich unit disc in both presentations. Its structure map is quasi-smooth and retains its Gauss boundary, so it is not smooth in the boundaryless sense.
- For a∈K with 0<|a|<1, the inclusion of the strict closed subdisc |T|≤|a| in A¹ᵃⁿ is quasi-étale with relative boundary ζ(0,|a|). It is not Berkovich étale; the corresponding adic open immersion is not partially proper.

### 0.31 Real quotient of analytic preadic spaces

Prove *real quotient*. For a preadic space over an analytic field, identify points with the same maximal normalized rank-one generization and equip the set of these generizations with the quotient topology. Partially proper opens are the saturated inverse images of opens in this real quotient. For an adic space, quasi-compactness descends to the real quotient without a tautness hypothesis; if the space is taut its real quotient is Hausdorff and is its maximal Hausdorff quotient, and every partially proper open is taut.

The tautness condition is essential for the global maximal Hausdorff assertion; use the KL analytic-field normalization.

For the proof, choose the field-normalized Tate gauge on each analytic affinoid chart and glue the local rank-one quotient sets and topologies. No finite-type or strictness hypothesis is used. A continuous quotient preserves quasi-compactness. Tautness gives separation of distinct rank-one points; any continuous map to a Hausdorff space is constant on generization classes. For a partially proper open, the image of a quasi-compact open has compact, hence closed, image in the Hausdorff quotient; its saturated inverse image contains its closure and stays inside the partially proper open. Together with quasiseparatedness this proves tautness.

*Needs:* [0.27 Uniform units and trivial spectrum](#027-uniform-units-and-trivial-spectrum); [0.28 Normalized rank-one adic quotient](#028-normalized-rank-one-adic-quotient).

[Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5), Definition 8.2.11 and Lemma 8.2.12(a)–(c), pp. 160–161; Example 8.2.13, p. 161. Real quotient, partially proper opens, tautness and its failure in the doubled-disc example.

**Check.** The doubled-origin closed disc has a non-Hausdorff real quotient, so the tautness qualification cannot be removed. A partially proper open in a taut adic space remains taut even if it is not quasi-compact.

### 0.32 Surjectivity detected by residue fields

Prove *residue field surjectivity*. For an A-linear map M→N over a nonarchimedean Banach ring A, with N finitely generated, surjectivity is equivalent to surjectivity of M⊗_A H(x)→N⊗_A H(x) for every x∈M(A). If B is faithfully finite étale over A with its finite Banach module topology, M(B)→M(A) is surjective; under the uniform-unit hypotheses of Hausdorff localization it is also open.

No topology or finite-generation hypothesis is imposed on M. The displayed module tensors are algebraic. N must be finite. Étale openness uses the same analytic hypotheses as KL §2.4.

For the proof, the cokernel is finite. For each maximal ideal choose a spectral point with that kernel by the closed maximal-ideal quotient construction. Faithful scalar extension from its residue field to H(x), followed by Nakayama, annihilates the localized cokernel; hence it vanishes. For finite étale B, the completed fiber over H(x) is a nonzero product of finite valued-field extensions. Its nonempty spectrum lifts x. The Hausdorff-localization factorization proves openness.

*Needs:* [0.15 Completed residue fields](#015-completed-residue-fields); [0.13 Existence of spectral points](#013-existence-of-spectral-points); [0.29 Rational traces and Hausdorff localization](#029-rational-traces-and-hausdorff-localization).

[Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5), Lemmas 2.3.12 and 2.3.14, p. 36; Lemma 2.4.17(c), p. 43. Finite-cokernel detection, faithful finite étale spectral surjectivity, and openness.

**Check.** The zero map to A is detected at every spectral residue field when A is nonzero. Faithfulness excludes a finite étale algebra supported on only one factor of a product ring. Openness and surjectivity are distinct assertions; the finite étale hypothesis alone does not remove the faithfulness requirement for surjectivity.

### Examples

For ℝ×ℝ the projection absolute values are distinct points, while the ambient maximum norm is not multiplicative. The zero ring has empty spectrum; a normed field has one point, even without completeness. A completed pushout need not have the set-theoretic fiber-product spectrum: ℂ⊗̂_ℝℂ has two complex factors over a single pair of field points. These examples test normalization, nonemptiness hypotheses and the surjection in the colimit theorem (Temkin §2.2.3, pp. 7–8; Scholze Propositions 2.4 and 3.2, pp. 8, 14–15).

### Dependencies

Mathlib multiplicative seminorms, normed rings, completions, product topology and compactness; Tau Ceti AdicSpaces Layer 2; DiamondsAndVStacks §D5.13 for the Tate-normalized rank-one quotient; ClassicalAdicEtaleCohomology §3.1 for the Hausdorff strict analytic category and taut-adic equivalence; RigidAnalyticGeometry Layer 5 for strict affinoid Čech acyclicity and AdicSpacesPartII §R1.3 for adic analytification. AlgebraicModuliForArithmeticGeometry §7.10.2 supplies general analytic nets and their gluing; ResolutionOfSingularitiesCharacteristicZero §7.7 supplies scheme pair principalization. This layer constructs weighted-chart comparison, hybrid scheme analytification, convergent-model resolution transport and projective SNC cofinality, and nonstrict finite-module descent.

## Layer 1: Discs, annuli and metric trees

Gauss evaluations and completed residue fields distinguish the four point types. Unique paths give the hyperbolic tree metric and annular skeleta. The descent statement retains geometric component counts and possible end swapping, so an ordinary split interval is never assumed for an arbitrary annulus form.

### 1.1 Gauss points, discs and projective line

Construct *Gauss points, discs and the analytic line*. A¹ᵃⁿ is the space of multiplicative seminorms on K[T] extending K. For a∈K and r≥0 the Gauss point ζ(a,r) evaluates Σc_n(T−a)ⁿ as max_n|c_n|rⁿ. Glue two affine charts by T↦T⁻¹ to obtain P¹ᵃⁿ. Open/closed discs and annuli are the corresponding strict/non-strict radius inequalities.

Complete nonarchimedean K. For r=0 use evaluation at a and the constant-term weight 1; for r>0 no restriction r∈|K×| is imposed. The zero polynomial has Gauss value 0, without taking the maximum of a nonempty support.

Provide the following interface:

- ζ(a,r)(Σc_n(T−a)ⁿ)=max|c_n|rⁿ.
- ζ(a,r)=ζ(b,s) iff r=s and |a−b|≤r.
- For r>0, the closed disc is the affinoid domain M(K{r⁻¹(T−a)}). For r=0, the singleton {a} is the closed analytic subspace M(K[T]/(T−a))=M(K), not an affinoid domain in A¹ᵃⁿ; no inverse radius is used.
- Inversion exchanges the two projective charts and sends an annulus to the reciprocal-radius annulus.

**Checks.**

- ζ(a,0) is the classical a-point.
- ζ(0,1)(T)=1 even though evaluation at 0 gives zero.
- ζ(0,r)=ζ(b,r) for |b|≤r, so centers are not unique.

For the construction, prove Gauss multiplicativity by choosing the extremal dominant coefficient, then identify the bounded-radius affinoid charts and glue the inverse-coordinate charts.

*Needs:* [0.17 Affinoid algebras over valued fields](#017-affinoid-algebras-over-valued-fields); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), §I.1, pp. 4–5; §I.3, pp. 12–15. Gauss seminorms, disc equality criterion and disc/annulus domains.

### 1.2 Four types of points

Prove *four point types*. Over algebraically closed complete nontrivially valued K, points of A¹ᵃⁿ are: I, evaluation at a∈K; II, ζ(a,r) with r>0 in |K×|; III, ζ(a,r) with r>0 outside |K×|; IV, the infimum seminorm of a decreasing family of closed discs with empty intersection. The IV infimum radius is positive. These cases are disjoint and exhaustive; for general K the classification is made after completed algebraic closure with Galois descent.

Algebraic closedness is required for this explicit list over K; spherical completeness is not assumed.

For the proof, use nested discs extracted from values of T−a; a common point gives a Gauss center, and an empty intersection gives IV. Completeness rules out empty intersection with radius tending to zero. Compare value-group rational rank and residue transcendence for II/III.

*Needs:* [1.1 Gauss points, discs and projective line](#11-gauss-points-discs-and-projective-line); [0.15 Completed residue fields](#015-completed-residue-fields); [0.18 Valued base change of spectra](#018-valued-base-change-of-spectra).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definition I.2.9, Lemma I.2.11, Proposition I.2.12 and Example I.2.20, pp. 7–11. Classification, the radius/value-group distinction and an explicit type-IV construction. In Example I.2.20 the Hahn coefficients are complex, with rational exponents and complex coefficients.

**Check.** Type IV is not deleted for a merely complete field. At II the residue transcendence degree is one; at III the value-group rational-rank increment is one. Over a nonclosed field a type-I point need not be K-rational.

**Check.** In the Hahn-series model for a spherical completion of the completed algebraic closure of ℂ((t)), rational exponents have complex coefficients. The constant i is present. Rational coefficients alone cannot contain that constant. This fixes the coefficient interpretation in Poineau–Turchetti Example I.2.20, author preprint p. 11.

### 1.3 Paths, tangent directions and hyperbolic metric

Construct *tree hyperbolic metric*. P¹ᵃⁿ over algebraically closed K is uniquely path connected. On H=P¹ᵃⁿ\P¹(K), use d(x,y)=2log diam(x∨y)−log diam(x)−log diam(y) in an affine coordinate, using another affine chart when necessary and identifying the metrics on overlaps. This is the intrinsic path metric and can induce a finer topology than the analytic topology. At type II, tangent directions correspond to closed points of its residue P¹; at III there are two directions and at I/IV one.

Complete algebraically closed nontrivial K; the metric is on nonclassical points and classical endpoints are at infinite path distance.

Provide the following interface:

- There is a unique arc [x,y], compatible with subdivision at z∈[x,y].
- x∨y is the least containing disc point in an affine rooted tree.
- For z on [x,y]⊂H, d(x,y)=d(x,z)+d(z,y).
- PGL₂(K) acts by isometries on H.
- The tangent set at a type-II point is the residue projective line.

**Checks.**

- d(ζ(0,r),ζ(0,s))=|log r−log s| for r,s>0.
- Distinct classical endpoints have infinite length to their joining segment; they are not finite-metric points.
- A type-III point has two branches, while a type-II Gauss point has all residue directions.

For the construction, join nested-disc points at their least common containing disc. Logarithmic diameter identifies each ordered segment with an interval and proves additivity. Inversion patches the affine formula; residue discs enumerate branches.

*Needs:* [1.2 Four types of points](#12-four-types-of-points).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Proposition I.6.12, pp. 25–26; §§I.8.1–I.8.9, pp. 29–31. Unique paths, tangent directions and multiplicative length, converted here to its logarithm, equivalently the difference of −log radial coordinates. [Charles Favre and Juan Rivera-Letelier, Équidistribution quantitative des points de petite hauteur sur la droite projective](https://arxiv.org/pdf/math/0407471v2), §3, pp. 19–22. Hyperbolic tree distance and the distinction from the compact analytic topology.

### 1.4 Connected algebraic curves remain connected

Prove *connected analytification*. The Berkovich analytification of a smooth geometrically connected algebraic curve over algebraically closed complete nontrivially valued K is connected. For its smooth proper completion X̄, H⁰(X̄ᵃⁿ,O)=H⁰(X̄,O)=K. Removing finitely many classical points leaves a connected analytic curve.

Smooth geometrically connected curve; finite puncture set in its proper completion.

For the proof, proper GAGA identifies global analytic functions with algebraic global functions. A clopen analytic decomposition gives a global idempotent, impossible in K, so X̄ᵃⁿ is connected. Smooth analytic curve charts are locally path connected; classical punctures are tree endpoints in disc charts. Excise finitely many such endpoints without separating the remaining curve. Use the proper coherent GAGA target of Layer 0.

*Needs:* [0.22 Berkovich analytification](#022-berkovich-analytification); [0.25 Idempotents and clopen subsets](#025-idempotents-and-clopen-subsets); [1.3 Paths, tangent directions and hyperbolic metric](#13-paths-tangent-directions-and-hyperbolic-metric); SchemeAndStackFoundations §3.3.

[Michael Temkin, Introduction to Berkovich analytic spaces](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf), Facts 5.1.2.1–5.1.2.2, p. 34. Proper coherent GAGA identifies global functions and analytic morphisms. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Proposition I.6.12 and Remark I.6.14, pp. 25–26. Path structure of disc charts gives the endpoint removal argument.

### 1.5 Annular skeleton and deformation

Construct *annular skeleton*. For an ordinary open annulus r<|T|<R, its skeleton is {ζ(0,ρ):r<ρ<R}, parameterized by s=−logρ, with logarithmic length log(R/r). Retraction sends x to ζ(0,|T(x)|). It is a strong deformation retraction; closed and half-open versions retain the appropriate boundary points. Punctured discs give unbounded rays.

0≤r<R; infinite logarithmic length is allowed when r=0 or R=∞. Ordinary annuli and non-split forms are distinguished.

Provide the following interface:

- s↦ζ(0,exp(−s)) embeds the radius interval.
- τ(x)=ζ(0,|T(x)|), with τ∘section=id.
- The deformation fixes the skeleton pointwise and ends at inclusion∘τ.
- An annular coordinate changes s by a translation or reflection; intrinsic length is invariant.
- A punctured disc skeleton is a ray of infinite length toward its puncture.

**Checks.**

- The annulus |q|<|T|<1 has length −log|q|.
- For T↦a/T with a≠0, a₋₁=a and a₁=0: the annulus r<|T|<R maps to |a|/R<|T|<|a|/r, reversing orientation and preserving log(R/r). The reversing coefficient is a₋₁.
- A closed annulus has its two endpoints; an open annulus excludes them.

For the construction, identify the Gauss interval via Laurent evaluations; every complementary residue ball attaches at exactly one skeletal point. Enlarge disc radii continuously to the attachment radius to construct the homotopy, then descend through valued scalar extension.

*Needs:* [1.1 Gauss points, discs and projective line](#11-gauss-points-discs-and-projective-line); [1.3 Paths, tangent directions and hyperbolic metric](#13-paths-tangent-directions-and-hyperbolic-metric).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definitions I.7.1–I.7.2, Lemmas I.7.8–I.7.9 and Propositions I.7.10–I.7.11, pp. 26–29. Skeleta and explicit deformation homotopies for discs/annuli. [Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), §2, Propositions 2.4–2.5 and 2.10, pp. 4–6. Generalized annulus skeleta, retractions and boundary versions.

**Check.** For the reversing coordinate φ(T)=a/T, the radius t maps to |a|/t and the target interval is (|a|/R,|a|/r). The coefficient is a₋₁=a; using a₁=0 would collapse both radii to zero. Use the same quantified radius variable throughout the formulas in Poineau–Turchetti Proposition I.4.14, author preprint p. 19. The logarithmic modulus is unchanged.

### 1.6 Integral slopes of analytic units

Prove *annular integral slopes*. For a nonzero analytic Laurent series f on an annulus, −log|f(ζ_s)|=min_n(v(a_n)+ns), a locally finite concave integral-slope piecewise-affine function. On any subannulus where f is invertible with no zero or pole, its skeletal slope is a single integer. A zero-free analytic function on an open ball has constant absolute value.

Complete nonarchimedean K; restrict to compact subintervals to obtain finitely many Laurent terms and breakpoints.

For the proof, use convergence to reduce the Gauss maximum on compact subannuli to finitely many dominant terms. A slope change produces a Newton-polygon zero after algebraic closure; invertibility rules it out. The ball assertion follows by nested closed-ball unit criteria.

*Needs:* [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.14 Units and spectral maximum](#014-units-and-spectral-maximum).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Propositions 2.4–2.5, pp. 4–5; proof of Theorem 5.15, pp. 21–22. Annular units and ball norm constancy are the local pieces of the slope formula. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694v3), §4.1, formula (4.1), p. 27. The Laurent minimum has exactly this sign in coordinate s=−log|T|.

**Check.** f=Tⁿ has slope n. f=T−a has a breakpoint at s=v(a), so invertibility on a whole annulus cannot be dropped.

### 1.7 Virtual annuli and metric descent

Define *virtual annuli descent*. A virtual disc or annulus is a nonempty connected analytic domain in A¹ᵃⁿ_K whose base change to a completed algebraic closure is a finite disjoint union of ordinary discs or annuli of the specified open or closed kind. Its geometric components form one Galois orbit, so annular components have a common modulus. For an annulus A with m geometric components, use Poineau–Turchetti modulus Mod(A)=Mod(component)^(1/m), so additive length is the geometric component length divided by m. Intrinsic skeleton and retraction descend. Nonempty connected abstract annulus forms can have an end-swapping action and a folded half-open quotient skeleton; they must not be identified with an ordinary interval without a splitting hypothesis.

Complete nonarchimedean K; the finite component number and A¹-domain condition are explicit where used.

Provide the following interface:

- Base change gives finitely many conjugate ordinary components.
- The descended skeleton is the intrinsic complement of virtual open balls.
- log Mod(A)=log Mod(A_geometric_component)/m.
- The geometric retractions are Galois equivariant and descend.
- For an ordinary split annulus m=1 and the usual logarithmic interval is recovered.

**Checks.**

- For a split annulus, log Mod equals log(R/r).
- For odd p, a nonsquare unit u∈ℚ_p and 0<r<R<1, the domain r<|T²−u|<R splits over the unramified quadratic extension into annuli about ±√u. Since |2√u|=1, both have length log(R/r); the chosen descended length is log(R/r)/2.
- Over a quadratic extension K′/K, take |q|<|z|<1 and descent σ(z)=q/z with q∈K and 0<|q|<1. Since σ²(z)=z, it descends, and s↦ℓ−s, ℓ=−log|q|, gives quotient skeleton (0,ℓ/2]. A disconnected union of annuli of lengths 1 and 2 is excluded: its components would give inconsistent divided lengths 1/2 and 1.

For the construction, use Galois transitivity on geometric components and uniqueness of the intrinsic complement-of-balls skeleton. Descend the homotopy; calculate length from the chosen modulus convention and retain end stabilizers for abstract forms.

*Needs:* [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.18 Valued base change of spectra](#018-valued-base-change-of-spectra).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definitions I.7.1–I.7.2, Lemma I.7.4, Remark I.7.5, Definition I.7.6 and Remark I.7.7, pp. 26–28. A¹-domain descent, the end-swap caution and the component-count modulus convention.

### Examples

On r<|T|<1, the coordinate s=−log|T| gives length −log r. The function Tⁿ has slope n; a reversing coordinate a/T has slope −1 and preserves log modulus. A virtual annulus with m geometric components has normalized modulus equal to the m-th root of a component modulus, so its length is the component length divided by m (Poineau–Turchetti Proposition I.4.14, p. 19; CDN Appendix A.2, pp. 51–52).

### Dependencies

Layer 0 spectra, completed residue fields and analytic charts; Tau Ceti restricted Gauss norms; SchemeAndStackFoundations §3.3 for proper-curve global functions in the connectedness comparison. The virtual-annulus statements retain their explicit descent hypotheses; their locally finite model application is in Layer 2.

## Layer 2: Semistable models and skeleta of curves

Construct finite marked skeleta and their global retraction from annular charts, then compare them to the imported combinatorial dual graph. Semistable existence over a nonnoetherian rank-one valuation ring is an owned theorem. The noncompact theory uses locally finite triangulations and formal gluing rather than an unjustified finite graph.

### 2.1 Semistable vertex set

Define *semistable vertex sets and skeleta*. A semistable vertex set is a finite set V of type-2 points of X̄ᵃⁿ whose complement is a disjoint union of open balls and finitely many open annuli, with the punctures in distinct open-ball components.

Provide the following interface:

- Return the finite subset V of type-2 points.
- Equal finite subsets define equal vertex sets.
- A finite type-2 subset with the stated decomposition and puncture separation gives a vertex set.
- Distinct punctures lie in distinct complementary ball components.

**Checks.**

- On unpunctured P¹, the singleton Gauss vertex is semistable, since its complement consists of residue open balls. The empty vertex set is not semistable: P¹ itself is neither an open ball nor an open annulus.
- Two punctures in one complementary ball prevent semistability for the punctured curve.
- A complementary annulus may have both boundary ends at the same vertex; a simple-graph restriction would reject valid examples.

For the construction, use the native algebraic curve and its Layer 0 Berkovich analytification, with the Layer 1 analytic ball and annulus classifications. Specify the decomposition as a property of V, without choosing an enumeration of infinitely many ball components.

*Needs:* TropicalAndBerkovichArithmetic Layer 0; SchemeAndStackFoundations §3.3; [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [1.2 Four types of points](#12-four-types-of-points).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 3.1, printed p. 101; arXiv p. 7. The corresponding arXiv numbering is the same.

**Check.** Two punctures in one complementary ball invalidate the candidate.

### 2.2 Skeleton of a semistable decomposition

Construct *skeleton*. For a semistable V, define Σ(X,V) as V union the intrinsic skeleta of the generalized open annulus components of Xᵃⁿ minus V. A punctured ball contributes a ray. Its completed skeleton is the closure in X̄ᵃⁿ.

Provide the following interface:

- Membership means being a vertex or a point of a complementary annulus skeleton.
- Every vertex is in Σ.
- The closure of Σ in X̄ᵃⁿ.
- If there are no generalized annulus components, Σ=V.

**Checks.**

- For P¹ with only its Gauss vertex ζ(0,1), Σ is a singleton, since every complementary component is an open ball.
- For P¹∖{0,∞} with its Gauss vertex, Σ has two puncture rays and is a real line in the coordinate −log|T|. Its closure adds 0 at +∞ and ∞ at −∞.
- For a split Tate curve with parameter 0<|q|<1, a vertex and its complementary annulus form a loop of length −log|q|; the two annular ends attach to the same vertex, so the result is a circle.

For the construction, take the union in the analytic point space using Layer 1 annulus skeleta. Define the completed-skeleton accessor by closure; equality with Σ union D is proved separately.

*Needs:* [2.1 Semistable vertex set](#21-semistable-vertex-set); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definitions 3.3 and 3.5, printed pp. 102–103. The corresponding arXiv numbering is the same.

**Check.** A puncture belongs to the completed skeleton but not to Xᵃⁿ.

### 2.3 Limit boundaries of semistable components

Prove *component limit boundary*. An open-ball component has one boundary vertex. An open annulus of logarithmic length ℓ has its skeleton parametrization extending continuously from (0,ℓ) to [0,ℓ], with both ends in V, possibly equal. A punctured ball has the extension [0,∞] with one end in V and one in D.

For the proof, BPR Proposition 2.10 yields limits of regular-function norms as logarithmic radius tends to zero. Lemma 2.13 gives constant norms off the annular skeleton; use a zero-free collar to check endpoint continuity, then compactness. Apply the same norm-limit argument at both annulus ends or at the puncture. The annular integral-slope formula and constancy on complementary balls give the required limits; the corrected logarithmic coordinate tends to zero at a normalized unit-radius boundary.

*Needs:* [2.1 Semistable vertex set](#21-semistable-vertex-set); TropicalAndBerkovichArithmetic Layer 0; [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [1.6 Integral slopes of analytic units](#16-integral-slopes-of-analytic-units).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.2 with proof, printed pp. 101–102. The corresponding arXiv numbering is the same.

**Check.** A loop annulus has equal endpoint images.

In the annular collar argument use a logarithmic radius tending to zero and test the scalar |f(φ(z))| against the real interval (c₁,c₂). For the component argument choose the connected neighborhood disjoint from V, so it lies in one component of the complement. These are the typed collar and neighborhood conditions for BPR structure Lemmas 3.2 and 3.4(4), arXiv pp. 8–9 (published pp. 102–103).

### 2.4 Ball components off the skeleton

Prove *skeleton complement balls*. Every component B of Xᵃⁿ minus Σ is an open ball with a singleton limit boundary in Σ.

For the proof, combine the component boundary lemma with BPR Lemma 2.12 for an annulus minus its intrinsic skeleton.

*Needs:* [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); [2.3 Limit boundaries of semistable components](#23-limit-boundaries-of-semistable-components); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(3), printed p. 102. The corresponding arXiv numbering is the same.

**Check.** The boundary point may lie in an edge interior, not in V.

### 2.5 Closure and punctures of the skeleton

Prove *completed skeleton boundary*. Σ is closed in Xᵃⁿ, its limit boundary in X̄ᵃⁿ is D, and its closure is Σ union D. It is compact exactly when D is empty.

For the proof, use the finitely many segments and rays with their endpoint extensions. For D empty the union is compact; any omitted puncture is a limit point preventing compactness in the Hausdorff proper analytification.

*Needs:* [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); [2.3 Limit boundaries of semistable components](#23-limit-boundaries-of-semistable-components); TropicalAndBerkovichArithmetic Layer 0; [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(1)–(2), Definition 3.5, printed pp. 102–103. The corresponding arXiv numbering is the same.

**Check.** A punctured-ball ray is not compact, and its added endpoint is not at finite path distance.

### 2.6 Disc characterization of the skeleton

Prove *skeleton disc characterization*. Σ consists of the points admitting no affinoid neighborhood isomorphic to a closed unit ball and disjoint from V.

For the proof, off Σ, use the complementary open ball. For x in Σ outside V, any connected candidate neighborhood disjoint from V stays in the same annulus component. Apply BPR Proposition 2.4.

*Needs:* [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); [2.4 Ball components off the skeleton](#24-ball-components-off-the-skeleton); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.4(4), printed pp. 102–103. The corresponding arXiv numbering is the same.

**Check.** The disjointness from V cannot be omitted in the connected-neighborhood argument.

### 2.7 Retraction onto the skeleton

Construct *retraction to the skeleton*. Define τ_V:Xᵃⁿ→Σ to fix Σ and send every other point to the unique boundary point of its complementary open-ball component. Continuity is a separate lemma.

Provide the following interface:

- τ_V fixes Σ pointwise.
- τ_V is constant on each complementary ball with value its boundary point.
- Every point of Σ is attained.
- These skeleton and ball evaluation laws determine the map.

**Checks.**

- On P¹ with only its Gauss vertex, the classical points 0 and 1 lie in distinct residue balls but both retract to ζ(0,1).
- In a complementary annulus A(r,R), a classical point a with r<|a|<R retracts to ζ(0,|a|), of coordinate −log|a|, even when that radius is not a vertex radius.
- For w=ζ(0,r) with r∈|K×| and 0<r<1, the vertex set {ζ(0,1),w} on P¹ gives τ(w)=w, while the coarser set {ζ(0,1)} gives τ(w)=ζ(0,1). Thus refinement changes the retraction.

For the construction, use the unique boundary supplied by skeleton-complement-balls, and the identity on Σ.

*Needs:* [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); [2.4 Ball components off the skeleton](#24-ball-components-off-the-skeleton); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 3.7, printed p. 103. The corresponding arXiv numbering is the same.

**Check.** On P¹ with vertices ζ(0,r) and ζ(0,1), 0<r<1, the interior point ζ(0,√r) is fixed at coordinate −log(r)/2, rather than rounded to either endpoint.

### 2.8 Continuity of skeletal retraction

Prove *continuous retraction*. τ_V is continuous and restricts on each complementary generalized annulus to its intrinsic retraction.

For the proof, the annulus assertion follows from BPR Lemma 2.12. Supply the vertex-neighborhood proof left as an exercise in Lemma 3.8. Continuity at vertices is proved by the star-neighborhood argument below; continuity on the complementary components alone is insufficient.

*Needs:* [2.7 Retraction onto the skeleton](#27-retraction-onto-the-skeleton); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Lemma 3.8, printed p. 103. The corresponding arXiv numbering is the same.

**Check.** Check vertices with infinitely many attached balls.

At a vertex there may be infinitely many residue-ball directions. Given a neighborhood in the skeleton, cut the finitely many incident annuli inside that neighborhood and use local analytic connectedness to build a star neighborhood in the curve. Include entire sufficiently small residual ball directions; verify that their retractions stay at the vertex. Apply the same neighborhood argument with the time coordinate to prove continuity of the strong homotopy at the vertex, not only on open annuli. BPR structure Lemma 3.8, p. 9 leaves this continuity argument to the reader. Use the resulting star lemma also for marked rays and the strong deformation theorem.

### 2.9 Connectedness of the skeleton

Prove *connected skeleton*. Both Σ and its completed skeleton are connected.

For the proof, use connectedness of the curve analytification, continuity and surjectivity of τ, then connectedness of its closure in the proper completion. The connectedness target is supplied by proper GAGA and the classical-endpoint removal argument.

*Needs:* [2.8 Continuity of skeletal retraction](#28-continuity-of-skeletal-retraction); [2.5 Closure and punctures of the skeleton](#25-closure-and-punctures-of-the-skeleton); TropicalAndBerkovichArithmetic Layer 0; [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [1.4 Connected algebraic curves remain connected](#14-connected-algebraic-curves-remain-connected).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Proposition 3.9, printed p. 103. The corresponding arXiv numbering is the same.

**Check.** Completing puncture ends does not create an extra connected component.

### 2.10 Rank-one semistable reduction

Prove *rank one semistable reduction*. A smooth proper geometrically connected curve over a complete nontrivially valued rank-one field acquires a split semistable admissible formal model after a finite valued extension. Over algebraically closed K it has a semistable model over K° itself. The valuation ring may be nonnoetherian. For a finite marked set, choose a model/vertex set adapted to the marks after an extension splitting them.

Admissible formal models over K° are topologically finitely presented and flat, not assumed noetherian. Finite extension is allowed before splitting nodes and marked points.

For the proof, use the rank-one analytic semistable-reduction theorem cited by BPR, then separate finitely many marked residue directions by admissible modifications. Prove the rank-one theorem by the formal construction specified below; the DVR stable-reduction roadmap supplies only its own discrete range.

*Needs:* AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`); TauCetiRoadmap.StableReduction Layer 7.

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Theorem 4.22 and proof, pp. 16–17. Uses BL85 Theorem 7.1 for rank-one semistable existence; its DVR replacement would leave the main hypothesis untreated. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Theorem II.2.20 and Remark II.2.21, pp. 42–43. Relates triangulation and semistable models after extension.

**Check.** Dense value groups are included. A noetherian/DVR model alone is insufficient for this node.

Carry out the semistable-reduction argument over the complete rank-one valuation ring itself, including the nonnoetherian case. Over an algebraically closed field, cap the boundary discs of each formal fiber and minimize the largest resulting genus. If a positive-genus fiber remains, choose nonzero prime-to-residue-characteristic torsion in its Picard group. Move its divisor away from the finitely many boundary discs, and use a meromorphic function whose divisor is a prime multiple of that divisor to cut the fiber into pieces of smaller genus. Glue the corresponding formal covering; the strict decrease terminates. A genus-zero fiber is a projective line minus finitely many discs, where subdivision produces ordinary double points. These are Bosch–Lütkebohmert (1985), Lemmas 7.2–7.3 and Proposition 7.4 in the proof of Theorem 7.1, pp. 374–377. Use the finite-extension descent of the formal covering, retaining the fields of definition of nodes and marked points; their concluding argument, pp. 377–378, algebraizes using norm-bounded sections of a sufficiently positive divisor. BPR structure Theorem 4.22, pp. 16–17 and Poineau–Turchetti Theorem II.2.20, pp. 42–43 explain the analytic-curve application. StableReduction's DVR theorem supplies the compatibility case only.

### 2.11 Formal models and metric dual graphs

Establish *formal model skeleton*. Over algebraically closed complete nontrivial K, semistable formal models of a smooth proper connected curve correspond to semistable vertex sets V. The point over a generic component is type II; smooth closed special-fiber points have open-ball fibers; a node locally étale over uv=a has an open-annulus fiber of length v(a)=−log|a|. The metric dual graph, retaining loops and multiple edges, identifies with Σ(X,V). Domination corresponds to inclusion of vertex sets.

Admissible semistable formal model; 0<|a|<1; special-fiber normalizations define component genera.

For the proof, use formal étale charts to identify analytic fibers and glue Gauss intervals along generic points. For the converse cover by vertex affinoids and annular edge domains and glue their canonical formal models; uniqueness uses admissible-model comparison.

*Needs:* [2.10 Rank-one semistable reduction](#210-rank-one-semistable-reduction); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); AdicSpacesPartIII §R2.3 (`raynaud-generic-fibre`); TauCetiRoadmap.StableReduction Layer 1; [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Proposition 4.3, Theorem 4.6, §4.9, Proposition 4.10 and Theorem 4.11, pp. 11–15. Formal fibers and the vertex-set/model correspondence, including the metric and order relation.

**Check.** A self-node yields a loop counted twice in valency. An equation uv=πⁿ has length n·v(π), not unit length unless n=1 and v(π)=1.

### 2.12 Vertex genera and analytic genus

Prove *vertex genus and genus formula*. At a type-II vertex v let g(v) be the genus of the smooth proper normalization of the residue component. For smooth proper connected X over algebraically closed K, g(X)=b₁(Σ)+Σ_v g(v). Import the algebraic dual-graph arithmetic-genus formula and flat-family genus invariance from StableReduction, and prove the formal/analytic identification and invariance under subdivision. Over general K use geometric stable genus; residue genus alone can change under extension.

K complete rank one; algebraically closed for the displayed residue-genus formula without descent weights.

For the proof, first establish a finite-presentation model descent or algebraization comparison that identifies the generic and special arithmetic genera over the rank-one base. StableReduction Layer 2 supplies the proper-flat genus theorem in its locally noetherian range; proving its applicability through this descent is part of the present formal/analytic comparison. Apply the imported nodal multigraph formula to the special fiber. Formal chart normalization identifies analytic residue genera. New subdivision vertices are rational genus-zero components, so both sides are unchanged.

*Needs:* [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs); TauCetiRoadmap.StableReduction Layer 1; TauCetiRoadmap.StableReduction Layer 2; [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definition II.2.14, Remark II.2.16, Definition II.2.22 and Theorem II.2.23, pp. 40–43. Stable genus and the analytic/algebraic genus formula; the example rules out unqualified residue-genus invariance.

**Check.** A good-reduction genus-g curve has a one-vertex skeleton of vertex genus g. A split Tate curve has b₁=1 and all vertex genera zero. A potentially good-reduction elliptic point can have residue genus zero before extension and stable genus one.

### 2.13 Refinement and valued extension

Prove *refinement and field extension*. Any finite set of type-II points is contained in a semistable vertex set. Two such vertex sets have a common refinement. Enlarging V subdivides old edges into unions of new edges and may attach finite trees; retractions compose τ_V∘τ_V′=τ_V. Under an isometric extension with split semistable model, the corresponding geometric skeleton preserves natural-log edge lengths and vertex genera; replacing v_K by the convention v_L(π_L)=1 rescales lengths by the ramification factor. General descent uses the virtual-annulus convention separately.

Smooth proper connected curve over algebraically closed K for finite-point refinement; split model for the scalar-extension assertion.

For the proof, insert points on annular edges and in finitely many ball branches, using a larger initial semistable model if necessary. Uniqueness of paths proves retraction composition. Base change of uv=a preserves −log|a|; regularization subdivides the edge rather than changing its total length.

*Needs:* [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs); [2.7 Retraction onto the skeleton](#27-retraction-onto-the-skeleton); [1.7 Virtual annuli and metric descent](#17-virtual-annuli-and-metric-descent); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Theorem 4.11, Corollary 4.23 and §5.3, pp. 13–18. Model domination/refinement and the corrected union-of-subedges statement. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), §I.7, pp. 26–29; §II.2, pp. 40–43. Base-change and stable-genus cautions.

**Check.** Inserting a type-II point inside an old edge makes it the union of two new edges; neither new edge contains the whole old edge. Add their lengths to recover the old length, as in BPR structure Proposition 3.13(1)–(2), pp. 10–11. Use this subdivision statement in §5.3, p. 18 (published p. 115).

### 2.14 Existence of a semistable vertex set

Prove *stable reduction and minimal skeleta*. X has a semistable vertex set.

For the proof, apply the owned rank-one semistable-reduction target to the smooth proper completion. Use the formal-model/skeleton correspondence, then refine to separate the finite puncture set into distinct complementary balls. The DVR theorem alone is insufficient.

*Needs:* [2.10 Rank-one semistable reduction](#210-rank-one-semistable-reduction); [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs); [2.13 Refinement and valued extension](#213-refinement-and-valued-extension).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Theorem 4.22, printed p. 112. The corresponding arXiv numbering is the same.

**Check.** The punctured case needs refinement, not an arbitrary vertex addition.

### 2.15 Marked skeleta and puncture rays

Construct *marked extended skeleton*. For a smooth proper connected curve X, finite distinct K-rational marked set D and a vertex set V separating the marks into distinct ball components, define Σ(X,D,V) by adjoining the paths from V toward each puncture in (X\D)ᵃⁿ. These are infinite-length rays; adjoining the classical marked endpoints gives the topological completion, not a finite metric edge. The deformation retraction and refinement maps preserve the compact core and marked directions.

K algebraically closed complete nontrivial for the split statement; finite extension to split nonsplit marks is explicit.

Provide the following interface:

- Removing the marked open rays recovers the compact proper skeleton.
- Each mark determines a ray with coordinate −log|t| tending to infinity.
- The strong deformation retraction fixes the extended skeleton.
- Refinements preserve puncture labels and commute with retractions.

**Checks.**

- P¹ minus {0,∞} with a Gauss vertex gives two rays joined at that vertex.
- A single puncture produces one ray, not a loop.
- The classical puncture is absent from (X\D)ᵃⁿ although it is present in the topological completion.

For the construction, choose a semistable refinement separating the finitely many marks; each punctured complementary ball has its intrinsic annular ray. Glue its radius retraction to the core and check continuity at attachment vertices.

*Needs:* [2.13 Refinement and valued extension](#213-refinement-and-valued-extension); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Definitions 3.1 and 3.3, Remark 3.6 and Lemma 3.8, pp. 7–9. Open algebraic curves, completed skeleta and retractions. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Theorem 5.22, pp. 26–27. Uses the punctured skeleton and its unbounded ends.

### 2.16 Locally finite triangulations and analytic nodes

Define *noncompact triangulations*. For a separated smooth analytic curve over a p-adic local field, the canonical analytic skeleton is the complement of points with a virtual open-disc neighborhood. A triangulation is a closed discrete set of type-II/III points cutting the curve into relatively compact virtual discs and virtual annuli; its skeleton is locally finite, not necessarily finite. For an admissible graph Γ, a node is a point of Γ with positive stable genus g(x), valence different from two, analytic boundary, or a strict inclusion of the local constant field into a branch constant field. Define g(x) as the residue-curve genus of any lift of x to the completed algebraic closure; it is independent of the lift. Over the nonsplit base this need not be the genus of the raw residue curve at x. The nodes of a triangulation skeleton belong to its vertex set; the intrinsic nodes of the canonical analytic skeleton belong to every triangulation.

Use the local-field hypotheses of CDN Appendix A.2. For a geometrically connected compact smooth curve, assume that its intrinsic node set is nonempty; that set is then a finite minimal triangulation, contained in every triangulation. A smooth projective curve of genus at least two satisfies this condition. A nonempty skeleton alone is insufficient, as the split Tate circle shows. Separately, for every separated quasi-smooth analytic curve over a complete nonarchimedean field, construct a triangulation containing any prescribed closed discrete set of type-II/III points. For strict curves over a nontrivially valued field and prescribed type-II points, choose only type-II vertices. This general existence statement supplies the ℂ_p curve covers used in integration; it does not assert a canonical minimal node triangulation outside the stated compact local-field range.

Provide the following interface:

- The intrinsic skeleton is independent of a chosen triangulation.
- A point of the given admissible graph is a node exactly under the four stated alternatives.
- Every triangulation contains the intrinsic node set, and its own skeleton has all its nodes in its vertex set.
- Adding a closed discrete compatible point set refines the triangulation without assuming it finite.
- A separated quasi-smooth analytic curve over a complete nonarchimedean field has a closed discrete triangulation containing a prescribed closed discrete type-II/III set, with the strict type-II variant just stated.
- The geometric residue genus is independent of the chosen lift to the completed algebraic closure and invariant under further algebraically closed isometric extension; type-III points have genus zero.

**Checks.**

- A split open annulus over K has a canonical interval skeleton and no interior valence-two genus-zero node: its constant field does not jump along a branch.
- The component point of a good-reduction elliptic curve has stable genus one and is a node even if its intrinsic skeleton has valence zero; an annular genus-zero point of valence two is not a node.
- A noncompact locally finite curve can require infinitely many vertices; a finite-set carrier would lose it.

For the construction, characterize virtual-disc neighborhoods and annular interiors; all failures of an unmarked annular interval are exactly the node alternatives. Local finiteness follows from closed discreteness and the analytic triangulation theorem; no global finiteness is inferred in the noncompact case.

*Needs:* [1.7 Virtual annuli and metric descent](#17-virtual-annuli-and-metric-descent); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), Appendix A.2, pp. 51–52. Canonical skeleton, four node alternatives, closed discrete triangulations and relatively compact complementary discs.

**Check.** A split Tate curve has a circle skeleton, stable genus zero at every point and no nodes: valence is two, the analytic boundary is empty and constant fields do not jump. Its empty node set is not a triangulation. Choosing one type-II point gives a semistable triangulation but is not an intrinsic minimal node choice.

[Antoine Ducros, La structure des courbes analytiques](https://webusers.imj-prg.fr/~antoine.ducros/trirss.pdf), §4.5.2, p. 271, §5.1.12, p. 292, Definition 5.1.13 and Theorem 5.1.14, pp. 293–295, and §5.4.12, pp. 318–320. These specify stable genus, nodes, general triangulation existence with prescribed vertices, and the nonempty-node hypothesis for the compact minimal triangulation.

Construct the *analytic formal structure of a vertex set*. For a separated quasi-smooth analytic curve over complete K, let S be closed and discrete, consist of type-II/III points, contain the analytic boundary, meet every irreducible component, and have relatively compact complementary components. At each type-III x∈S outside the analytic boundary, require that no one complementary component contains every branch at x. These are the vertex-set conditions for the unique maximal formal affinoid atlas with vertices S. A formal affinoid atlas is a G-cover by affinoid domains whose pairwise overlaps are finite unions of spectral maximum loci of analytic functions; its equivalence class is the analytic formal structure. Retain the constant fields and nonsplit node invariants. A triangulation satisfying these conditions determines this structure; a type-III self-adjacency can require a refinement before applying the construction (Ducros §§6.3.1–6.3.3, pp. 338–339; Theorem 6.3.15 and §§6.3.16–6.3.17, pp. 343–347).

Provide the following interface:

- Taking the vertices of the maximal formal atlas recovers S, and equivalent atlases have the same maximal atlas.
- The atlas is strict exactly when all its vertices are type II.
- Formal domains are precisely the closed analytic domains with analytic boundary contained in S; restricting the atlas restricts its vertex set.
- Locally finite gluing preserves the formal atlas and its specified vertex set on each compact analytic domain.

Prove *strict formal-scheme reconstruction*. Assume K is nontrivially valued and either algebraically closed or discretely valued, and S above consists only of type-II points. Glue the charts Spf O(V)° of the strict formal atlas to a flat locally topologically finitely presented K°-model relatively normal in its generic fiber. Its generic fiber is X, and its component points are exactly S. Conversely a model in this category recovers its strict formal atlas and its component-point set. If the vertex reductions are smooth and its edge charts are split nodal charts uv=a with 0<|a|<1, this is the split semistable correspondence; a general strict reconstruction is not asserted semistable. Nonsplit data use the virtual-annulus descent convention of Layer 1. The general analytic structure remains available without these field or strictness hypotheses (Ducros §§6.3.9–6.3.13, pp. 340–343, and §§6.3.22–6.3.23, pp. 349–350; CDN Appendix A.2, pp. 51–52, for the model-to-component-point direction).

**Checks.**

- On P¹ over ℚ_p, S={ζ(0,p^(−√2))} cuts the curve into two virtual open discs and has type III because √2∉ℚ. It gives an analytic formal structure with one vertex, but no admissible formal ℤ_p-model with that component point.
- The Gauss point of P¹ over ℚ_p is type II; its strict structure reconstructs the smooth model P¹ over ℤ_p, with one reduced component and one component point.
- A single type-III point on a split Tate circle leaves one complementary annulus containing both branches at that point. It fails the formal-atlas vertex condition, even though it is an analytic triangulation; adding a second vertex separates those branches.
- A type-II point of radius p^(−1/2) on P¹ over ℚ_p has value-group index 2. Strict reconstruction can have a multiplicity-two component; type II alone does not imply a reduced semistable special fiber.

*Needs:* §0.21 analytic domains and G-covers; §1.7 virtual-annulus descent; this section's vertex-set conditions and formal atlas; AdicSpacesPartIII §§R2.2–R2.3 for admissible models and generic fibers. The strict reconstruction uses the stated field hypotheses, while general triangulation existence does not.

**Check.** Gluing two discs along the complement of their origins gives a quasi-smooth nonseparated doubled-origin disc. Any type-II/III vertex set leaves both origins in a nonseparated complementary piece, which is neither a virtual disc nor a virtual annulus. The existence theorem therefore requires separatedness; §0.21 still allows this analytic space.

### 2.17 Triangulated curves and formal automorphisms

Prove *triangulated formal automorphisms*. For a normal flat admissible formal curve over O_K in the CDN local-field setting, let S be the set of analytic points corresponding to generic points of its special-fiber components. An automorphism of its analytic generic fiber preserving S extends uniquely to a formal automorphism. If the model is semistable, S is its associated triangulation; normality and flatness alone do not make S a triangulation. A split semistable chart uv=a, a≠0, gives the annular chart. This modelwise statement asserts neither a converse reconstruction theorem nor a single proper finite model for every noncompact curve.

Normal flat admissible formal curve in the local-field setting of CDN Appendix A.2; semistability is an additional hypothesis for the triangulation assertion.

For the proof, use the normal formal model and its component-point set S. The extension criterion for automorphisms preserving S is the cited Ducros theorem; on semistable charts it respects the disc/annulus decomposition. Prove locally finite gluing and uniqueness; CDN does not itself establish a converse reconstruction theorem.

*Needs:* [2.16 Locally finite triangulations and analytic nodes](#216-locally-finite-triangulations-and-analytic-nodes); AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`); AdicSpacesPartIII §R2.3 (`raynaud-generic-fibre`); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), Appendix A.2–A.3, pp. 52–53, citing Ducros Theorem 6.3.23. Gives the component-point set and the automorphism-extension criterion for normal flat models. The set is a triangulation for a semistable model; a general triangulation-to-model reconstruction is a separate proof input.

### 2.18 Strong deformation onto a skeleton

Prove *skeletal strong deformation*. A semistable (marked) skeleton of a smooth algebraic curve over algebraically closed complete nontrivially valued K is a strong deformation retract of its analytification with punctures removed. The homotopy fixes the skeleton pointwise, ends at τ, and is compatible with the annular radius homotopies and the boundary point of every complementary ball.

Finite semistable vertex set; finite split marks; use the analytic topology on source and skeleton.

For the proof, glue the annular radial homotopies and rooted-ball contraction while fixing each vertex. At a vertex use star neighborhoods with finitely many annular cuts and all but finitely many attached residue balls. Continuity at these vertices, including infinitely many ball directions, is the vertex-neighborhood argument specified above; componentwise continuity does not suffice.

*Needs:* [2.8 Continuity of skeletal retraction](#28-continuity-of-skeletal-retraction); [2.4 Ball components off the skeleton](#24-ball-components-off-the-skeleton); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), §2.3, p. 4 and Lemma 3.8, p. 9. The annular homotopy is recalled in §2.3. Lemma 3.8 states continuous retraction only; it does not prove the strong homotopy, and its vertex-continuity exercise remains an additional proof target. [Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Lemmas I.7.8–I.7.9 and Propositions I.7.10–I.7.11, pp. 28–29; paragraph following Theorem II.2.20, p. 43. Explicit local disc/annulus homotopies and the global strong-retraction assertion. Prove gluing and continuity at every vertex direction using the star-neighborhood argument.

### 2.19 Contractions of genus-zero vertices

Prove *genus zero contractions*. Let V be a semistable vertex set of a smooth punctured curve and x∈V have genus zero. In the completed skeleton, a valence-one x can be removed if its adjoining edge has other endpoint outside the puncture set D; delete x and that edge interior. A valence-two x incident to two distinct edges can be removed if their two other endpoints are not both in D; join these edges, adding their lengths. A single self-loop contributes two tangent directions but is not a pair of distinct edges and cannot be suppressed by this rule. The resulting V\{x} is semistable.

Algebraically closed complete nontrivially valued K; retain puncture endpoints and the exceptional configurations in the stated conditions.

For the proof, translate the genus-zero component contraction of BL85 Lemma 6.1 into formal fibers and vertex sets. Rational tail contraction removes its ball branch; a rational bridge contraction joins annuli and adds moduli. The nonnoetherian contraction proof is the specified BL85 proof input.

*Needs:* [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus); [2.15 Marked skeleta and puncture rays](#215-marked-skeleta-and-puncture-rays).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Proposition 4.21, p. 16. Gives both contractions with the marked-endpoint exceptions and cites BL85 Lemma 6.1.

**Check.** A genus-zero bridge lying between two punctures is excluded by the two-endpoint condition. Positive genus forbids these rational-component contractions. A one-vertex Tate circle retains its vertex: its single loop cannot be contracted by the two-edge rule.

Prove the required formal genus-zero contractions over the possibly nonnoetherian rank-one valuation ring. For a genus-zero component of valence at most two, construct the coarser formal covering that contracts that component; its remaining formal fiber is a genus-zero curve with at most two peripheral discs, hence a ball or an annulus. Bosch–Lütkebohmert (1985), Lemma 6.1, p. 372 uses their formal contraction construction 3.9 and genus comparison 4.6; see also BPR structure Proposition 4.21, p. 16. A rational tail can be removed only under the stated puncture exclusions. A bridge contraction replaces its two distinct adjacent annuli by one whose thickness is their sum. Preserve the one-point and one-vertex-loop exceptions explicitly retained in §6, p. 371. These contractions underlie the intrinsic minimal skeleton and the stable-vertex existence and uniqueness arguments; the DVR contraction theorem is a compatibility case.

### 2.20 Intrinsic minimal skeleton

Prove *intrinsic minimal skeleton*. If χ(X)=2−2g(X̄)−#D≤0 and V is inclusion-minimal, Σ(X,V) is the locus with no affinoid neighborhood isomorphic to the closed unit ball.

For the proof, use the exact genus-zero tail/bridge contraction theorem and semistable refinement. If a minimal skeleton met a forbidden closed-ball neighborhood, refine at its Gauss boundary; its retract in the contractible ball would be a finite tree with a genus-zero vertex of valence below two. The contraction contradicts minimality when χ≤0.

*Needs:* [2.14 Existence of a semistable vertex set](#214-existence-of-a-semistable-vertex-set); [2.6 Disc characterization of the skeleton](#26-disc-characterization-of-the-skeleton); [2.8 Continuity of skeletal retraction](#28-continuity-of-skeletal-retraction); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [2.19 Contractions of genus-zero vertices](#219-contractions-of-genus-zero-vertices); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Theorem 4.22(1), printed p. 112. The corresponding arXiv numbering is the same.

**Check.** The χ≤0 restriction excludes the unpunctured projective line.

### 2.21 Stable vertices of a hyperbolic curve

Prove *stable vertex characterization*. For χ(X)<0 and inclusion-minimal V, V is stable and equals the points of Σ of valence at least three or positive vertex genus. The genus of a type-2 point is the genus of the smooth proper curve over the residue field with function field the residue field of its completed residue field.

For the proof, remove each allowable genus-zero low-valence vertex by the exact contraction theorem. Under χ<0 the exceptional one/two-puncture configurations cannot exhaust the curve. The remaining vertices are exactly positive-genus points or topological vertices of valence at least three.

*Needs:* [2.14 Existence of a semistable vertex set](#214-existence-of-a-semistable-vertex-set); [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [2.19 Contractions of genus-zero vertices](#219-contractions-of-genus-zero-vertices); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Definition 4.20 and Theorem 4.22(2), printed pp. 111–112. The corresponding arXiv numbering is the same.

**Check.** A positive-genus vertex remains even at valence below three.

### 2.22 Uniqueness of the minimal skeleton

Prove *unique minimal skeleton*. For χ(X)≤0 there is a unique set-theoretic minimal skeleton.

For the proof, a finite vertex set has a minimal subset, and the intrinsic description is independent of that choice.

*Needs:* [2.20 Intrinsic minimal skeleton](#220-intrinsic-minimal-skeleton); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Corollary 4.23, printed p. 112. The corresponding arXiv numbering is the same.

**Check.** A Tate curve has one minimal circle but many minimal one-point vertex sets.

### 2.23 Uniqueness of stable vertices

Prove *unique stable vertex set*. For χ(X)<0 there is a unique stable vertex set.

For the proof, the intrinsic minimal skeleton is independent of a vertex presentation. Its positive-genus points and valence-at-least-three points are intrinsic and form the stable set when χ<0. The contraction theorem shows that any stable semistable presentation is minimal, giving uniqueness.

*Needs:* [2.22 Uniqueness of the minimal skeleton](#222-uniqueness-of-the-minimal-skeleton); [2.21 Stable vertices of a hyperbolic curve](#221-stable-vertices-of-a-hyperbolic-curve); [1.5 Annular skeleton and deformation](#15-annular-skeleton-and-deformation); [0.22 Berkovich analytification](#022-berkovich-analytification); [2.19 Contractions of genus-zero vertices](#219-contractions-of-genus-zero-vertices); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of non-archimedean analytic curves](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1), Corollary 4.23, printed p. 112. The corresponding arXiv numbering is the same.

**Check.** Do not apply the assertion to a Tate curve with χ=0.

### Examples

A formal node uv=π³ gives an edge of length 3v(π); replacing it by three thickness-one nodes subdivides the interval and preserves its total length. A good-reduction curve of genus g has a one-point skeleton with vertex genus g. A split Tate curve has a circle, and many one-vertex semistable models of that same minimal circle; minimal skeleton uniqueness does not mean vertex-set uniqueness when χ=0 (BPR structure Proposition 4.3 and Theorem 4.22, pp. 11, 16–17).

### Dependencies

Layers 0–1; AdicSpacesPartIII §§R2.2–R2.3 admissible formal schemes and Raynaud generic fibers; AlgebraicCurves / SchemeAndStackFoundations §3.3 for algebraic curves and completions; StableReduction Layers 1–2 for dual-graph genus and flat-family genus invariance, with Layer 7 supplying the DVR compatibility case. Rank-one semistable existence and contractions are constructed here.

## Layer 3: Divisors, slope formula and specialization

Keep graph principal divisors, the negative-outgoing Laplacian and analytic slope specialization in separate named contracts. The unweighted graph Riemann–Roch theorem uses b₁. Vertex genus is retained through metrized complexes and their residue-curve functions; it is not inserted into the unweighted theorem by changing a symbol.

### 3.1 Metric graphs with loops and vertex genus

Define *metric graphs*. A compact metric graph Γ is the realization of a finite connected graph with half-edges, loops and multiple edges and a positive real length on every edge, modulo length-preserving subdivision. For a polarized graph attach a nonnegative integer genus g(v) to finitely many vertices; its polarized genus is b₁(Γ)+Σg(v). An extended graph additionally has finitely many labeled infinite rays, but compact-graph Riemann–Roch uses the compact core.

A one-point graph with no edges is allowed; connected graphs here are nonempty. Zero-length edges are contracted before forming a model. Use Mathlib `Graph` for unmetric incidence and its distinct edge identities; lengths, half-edge flags and metric realization are the additional data.

Provide the following interface:

- A finite positive-length multigraph has a compact connected metric realization.
- Splitting an edge into positive lengths with the same sum preserves Γ isometrically.
- Tangent directions are germs of incident intervals; a loop contributes two at its vertex.
- The polarized genus is b₁+Σg(v), independent of genus-zero subdivisions.
- A proper split semistable curve skeleton gives this carrier, with length v(a).

**Checks.**

- A single loop has b₁=1 and vertex valence two.
- Two parallel edges have b₁=1; a SimpleGraph carrier would erase this cycle.
- An interval subdivided at its midpoint is isometric to the original interval with unchanged total length.

For the construction, glue closed real intervals by their endpoint half-edge incidence and give the intrinsic path metric. Subdivision gives canonical isometries and transports tangent directions; retain each half-edge separately at a loop.

*Needs:* [1.3 Paths, tangent directions and hyperbolic metric](#13-paths-tangent-directions-and-hyperbolic-metric).

[Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), §1, pp. 3–5. Metric graph models, loops, edge lengths and tropical curves. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §1.1, pp. 2–3. Vertex genus and half-edge marked-point data.

### 3.2 Divisors and rank on metric graphs

Define *graph divisors*. Div(Γ) is the free abelian group on all points of compact Γ, with degree the coefficient sum and effectiveness coefficientwise. An integral-slope continuous piecewise-affine function with finitely many breaks has principal divisor divPL(f)=Σ_x(Σ_outgoing d_bf)x. Linear equivalence is difference by such a divisor; r(D)=−1 if D has no effective equivalent and otherwise is the largest r≥0 such that D−E has an effective equivalent for every effective E of degree r. Set KΓ=Σ_v(val(v)−2)v for an unweighted graph; polarized K adds 2g(v).

Divisors include interior points, not just vertices; principal divisors have degree zero.

Provide the following interface:

- Each x∈Γ gives a degree-one effective divisor.
- Degree is an additive homomorphism, invariant under linear equivalence.
- divPL(f+g)=divPL(f)+divPL(g) and constants have zero divisor.
- Rank is characterized by all effective subtractands of the specified degree.
- KΓ has degree 2b₁−2; the polarized formula has degree 2g−2.

**Checks.**

- A point in the interior of an edge is a legal degree-one divisor.
- On a tree any degree-d divisor has rank d for d≥0.
- On a circle a degree-one divisor has rank zero, so rank is not simply degree.
- A loop contributes two to valency in the canonical divisor.

For the construction, use finitely supported integer functions on the realization. Refine at all breaks, cancel the two edge-end slopes to prove degree zero, and define equivalence/rank through effective representatives.

*Needs:* [3.1 Metric graphs with loops and vertex genus](#31-metric-graphs-with-loops-and-vertex-genus).

[Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), Definitions in §1, pp. 4–7. All-point divisors, principal slopes, linear systems, canonical divisor and rank.

### 3.3 Graph Laplacians and potentials

Define *the graph Laplacian*. For integral-slope PL f define Δf=−divPL(f). For real continuous functions that are C² up to the endpoints of finitely many closed edge pieces, extend to the finite signed measure Δf=−f″ds−Σ_x(Σ_outgoing d_bf)δ_x. It has mass zero. On a connected compact graph, Δf=0 implies f constant. Integration by parts gives ∫f Δg=∫f′g′ds=∫g Δf. Write ddc f=−Δf for the positive-outgoing convention used for curvature changes.

For the density formula, require C² on each closed piece (or absolutely continuous f′ with f″∈L¹ there). The larger domain consists of continuous functions with weak edge derivatives of bounded variation and finite total Laplacian variation; Δ uses distributional edge derivatives and all endpoint fluxes. Compact Γ and all boundary terms are included.

Provide the following interface:

- For integral PL f, Δf=−divPL(f).
- The total mass of Δf is zero.
- The energy identity holds for piecewise C² test functions.
- The kernel on connected compact Γ is the constants.
- A metric multiplied by exp(−f) has curvature change ddc f=−Δf.

**Checks.**

- For f(t)=t on [0,L], divPL(f)=δ₀−δ_L and Δf=δ_L−δ₀.
- For f(t)=t²/2, the interior part of Δ is −ds and endpoint atoms restore total mass zero.
- A constant potential has zero Δ on a loop as well as on a tree.

For the construction, integrate twice on each oriented edge, add its endpoint derivative terms and identify the vertex fluxes. The energy identity proves uniqueness modulo constants.

*Needs:* [3.2 Divisors and rank on metric graphs](#32-divisors-and-rank-on-metric-graphs).

[Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, pp. 115–117. Uses negative outgoing slopes and negative edge second derivative. [Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), §1, pp. 4–6. The principal-divisor convention is the opposite sign from this Δ.

**Check.** On [0,1], extend f(s)=s² constantly along all other branches. Then ddc f has interior density +2 ds and outgoing derivative atoms of total −2, hence mass zero. Accordingly Δf has density −2 ds and atoms of total +2. This is the sign compatible with equation (20) of Favre–Rivera-Letelier §4; in the author preprint §4.2, pp. 24–25 the displayed negative interior density does not match its outgoing-derivative atoms. The 2007 corrigendum concerns quantitative estimates.

**Check.** On [0,1], put f(t)=∫₀ᵗ u sin(1/u²)du and f(0)=0. Then f′(0)=0, but f″(t)=sin(1/t²)−2t⁻²cos(1/t²) has infinite L¹ norm: substitution v=1/t gives a divergent ∫|cos(v²)|dv. Thus interior C² regularity and finite endpoint derivatives alone do not produce a finite signed measure. For the Cantor distribution C, f(t)=∫₀ᵗ C(u)du has Δf=δ₁−μ_C, a finite measure with singular-continuous part, so it belongs to the larger weak domain.

### 3.4 Metric Jacobian and Abel–Jacobi map

Construct *the graph Jacobian*. Let M=H₁(Γ,ℤ), N=Hom(M,ℤ), and μ:M→N_ℝ be the edge-length pairing μ(m)(n)=Σ_eℓ_e m_e n_e. Define Jac(Γ)=N_ℝ/μ(M). It is canonically Pic⁰(Γ)=Div⁰(Γ)/Prin(Γ); the basepoint Abel–Jacobi map sends x to integration along a path from the basepoint, modulo integral periods. Harmonic-form duals give the same real torus.

Finite connected compact metric graph; orientation choices cancel in the pairing.

Provide the following interface:

- The positive definite cycle-length pairing defines a compact real torus of dimension b₁.
- Degree-zero divisor classes identify canonically with Jac(Γ).
- A basepoint gives a continuous map Γ→Jac(Γ), additive on degree-zero divisors.
- Subdivision identifies the lattice pairing and Abel–Jacobi maps.
- Abel–Jacobi contracts bridges and is affine with primitive derivative on a nonbridge edge.

**Checks.**

- The Jacobian of a tree is the zero group.
- A circle of circumference L has Jacobian ℝ/Lℤ.
- A bridge attached to a circle is contracted, so Abel–Jacobi need not embed Γ.

For the construction, positive lengths make the pairing positive definite on cycle space, hence μ(M) a full lattice. Pass through finite-model Jacobians and their subdivision direct limit to identify Pic⁰. Path changes are integral cycles; harmonicity proves tropical balancing. Prove finite-model exactness and subdivision compatibility as described below.

*Needs:* [3.2 Divisors and rank on metric graphs](#32-divisors-and-rank-on-metric-graphs); [3.3 Graph Laplacians and potentials](#33-graph-laplacians-and-potentials).

[Matthew Baker and Xander Faber, Metric properties of the tropical Abel–Jacobi map](https://arxiv.org/pdf/0905.1679v4), §3, Theorem 3.4, pp. 15–16 and Theorem 4.1, p. 17. Picard/Jacobian identification, model independence and bridge behavior. [Matthew Baker and Joseph Rabinoff, The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves](https://arxiv.org/pdf/1308.3864v1), §2.7 and Proposition 2.8, p. 5. Length-pairing lattice presentation.

For each finite graph model establish the exact sequence relating integer chains, the Laplacian, degree-zero divisors and the finite-model Picard group, together with the integration pairing on harmonic forms. Under subdivision prove compatibility of the chain embedding, harmonic extension and weighted edge pairing. Passing to the direct limit then identifies the all-point Picard group with Ω(Γ)*/H₁(Γ,ℤ). Baker–Faber §2 and §3, pp. 3–16 supply the finite-model and direct-limit arguments. The metric lengths enter the pairing throughout, including the length L in the circle quotient ℝ/Lℤ.

### 3.5 Riemann–Roch for metric graphs

Prove *Riemann–Roch for metric graphs*. For a compact connected metric graph Γ of genus g=b₁ and any divisor D, r(D)−r(KΓ−D)=deg(D)+1−g. In particular deg(KΓ)=2g−2 and r(KΓ)=g−1. This is the unweighted graph theorem; vertex genera require metrized complexes rather than silently replacing g by b₁+Σg(v).

All edge lengths positive real numbers; all-point divisor rank; compact graph.

For the proof, for rational lengths subdivide after scaling and compare discrete chip-firing rank with metric rank, then apply the finite graph Riemann–Roch theorem. For real lengths use the rational polyhedral stratification of simultaneous ranks of D and K−D and choose rational points preserving both ranks, rather than relying on unjustified semicontinuity. Prove the discrete rank theorem by the reduced-divisor argument below.

*Needs:* [3.2 Divisors and rank on metric graphs](#32-divisors-and-rank-on-metric-graphs).

[Andreas Gathmann and Michael Kerber, A Riemann–Roch theorem in tropical geometry](https://arxiv.org/pdf/math/0612129v2), Theorem 2.1, Lemma 2.3, Proposition 2.4, Corollary 2.5 and Proposition 3.1, pp. 8–12. The finite graph bridge, rational lengths and simultaneous rational approximation prove the real-length statement.

**Check.** On a tree r(D)=deg D for nonnegative degree. For g=1 and deg D>0, r(D)=deg D−1. Replacing metric rank by vertex-only rank loses the arbitrary-real-length theorem.

First prove the finite graph rank theorem, using reduced divisors rather than assuming Riemann–Roch as an oracle. For a connected loopless multigraph and a base vertex, obtain the unique reduced representative by chip firing and use its burning order to classify degree g−1 divisors of rank −1. Reversing an order exchanges its distinguished divisor with its complement in the canonical divisor. The minimum positive-part formula for rank then gives the rank difference. Baker–Norine, Proposition 3.1, Theorem 3.3 and the proof of Theorem 1.12, §§2–3, pp. 8–16 give this route. Subdivide loops first; prove the discrete-to-metric comparison and rational rescaling in Gathmann–Kerber Lemma 2.3, Proposition 2.4 and Corollary 2.5, pp. 10–11. Finally use their Proposition 3.1, pp. 11–12: encode both ranks with finitely many slope and chip-position conditions and approximate lengths and divisor positions simultaneously inside their rational polyhedra. Separate approximation of the lengths alone would not preserve the two ranks.

### 3.6 Specialization of algebraic divisors

Construct *divisor specialization*. For smooth proper X over algebraically closed complete rank-one K and a semistable skeleton Γ with retraction τ, define τ_*:Div(X)→Div(Γ) by Σn_P P↦Σn_P τ(P). It preserves degree and effectiveness. For a nonclosed field first use geometric divisors or retain closed-point residue degrees explicitly. Refinement maps and isometric scalar extension commute with specialization.

Div(X) is on geometric K-points in the displayed formula; X is proper to give a compact skeleton.

Provide the following interface:

- τ_*(P)=τ(P).
- Degree is preserved and effective divisors specialize effectively.
- Coarsening the refined specialization equals the original specialization.

**Checks.**

- Two distinct points in one residue ball specialize to the same vertex.
- A point retracting to an edge interior must not be rounded to a vertex.
- A closed point of degree d contributes total degree d after geometric base change.

For the construction, extend point retraction linearly and use compatibility of graph retractions. For closed points compare the sum of geometric conjugates, including inseparable multiplicities, with the degree convention.

*Needs:* [2.7 Retraction onto the skeleton](#27-retraction-onto-the-skeleton); [2.13 Refinement and valued extension](#213-refinement-and-valued-extension); [3.2 Divisors and rank on metric graphs](#32-divisors-and-rank-on-metric-graphs).

[Matthew Baker, Specialization of linear systems from curves to graphs](https://arxiv.org/pdf/math/0701075v4), §2, pp. 5–10. Specialization in the discrete-model range. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §4.3, pp. 21–22. Analytic retraction and geometric-point specialization over arbitrary complete algebraically closed K.

### 3.7 Slope formula for rational functions

Prove *slope formula*. Let f∈K(X)× on smooth proper X, and choose a marked skeleton containing all zeros and poles as punctures. F=−log|f| is integral-affine along the extended edges, constant on complementary balls and harmonic at every unmarked nonclassical point. At type II, its outgoing slope equals the order of the normalized residue function in that branch; along a ray toward P the outgoing slope is ord_P(f). On a compact skeleton Δ(F|Γ)=τ_*div(f), equivalently divPL(log|f||Γ)=τ_*div(f).

K algebraically closed complete nontrivial; include the support of div(f) in the marking.

For the proof, use analytic-unit constancy on balls and Laurent slopes on annuli. In a formal node chart compare the first nonvanishing residue term with its annular exponent. The principal divisor on the residue curve has degree zero, proving harmonicity; cancel attached branch fluxes to obtain the compact-graph formula.

*Needs:* [1.6 Integral slopes of analytic units](#16-integral-slopes-of-analytic-units); [2.15 Marked skeleta and puncture rays](#215-marked-skeleta-and-puncture-rays); [3.3 Graph Laplacians and potentials](#33-graph-laplacians-and-potentials); [3.6 Specialization of algebraic divisors](#36-specialization-of-algebraic-divisors).

[Matthew Baker, Sam Payne, Joseph Rabinoff, On the structure of nonarchimedean analytic curves](https://arxiv.org/abs/1404.0279v1), Theorem 5.15 and its proof, pp. 21–22. All slope assertions, harmonicity and puncture orders with F=−log|f|. [Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorem 4.5 and its sign footnote, p. 23. Uses log|f| for the positive-outgoing principal-divisor convention.

**Check.** On G_m, F=−log|T| has slope +1 toward 0 and −1 toward infinity. The compact formula uses Δ rather than divPL for −log|f|.

As a consequence of the slope formula, prove *principal-divisor compatibility of specialization*: τ_*div(f)=Δ(−log|f||Γ)=divPL(log|f||Γ). This supplies the induced Picard specialization, after the point, degree and refinement maps of §3.6.

*Needs:* §3.6 point/degree/refinement specialization; §3.7 slope formula only.

### 3.8 Metrized complexes and their divisors

Define *metrized complexes*. A metrized complex consists of compact Γ, a smooth proper connected residue curve Cᵥ over algebraically closed κ at each vertex and distinct marked points indexed by incident half-edges. Replace each vertex by Cᵥ(κ) in the divisor support. A rational function is a PL graph function f_Γ with integral slopes and independent nonzero rational functions f_v on Cᵥ. Its component divisor is div(f_v)+Σ_b slope_b(f_Γ)·p_b; its graph-interior divisor is divPL(f_Γ). The associated graph divisor puts total component degree at the vertex. Set `K_C=Σ_v(K_{Cᵥ}+Σ_bp_b)`, with genus b₁+Σg(Cᵥ).

A loop has two distinct marked half-edge points on the same Cᵥ; rational functions need not satisfy an unstated gluing equality.

Provide the following interface:

- A divisor maps to its graph-interior chips plus its total degree on each Cᵥ at v.
- A graph PL function and residue rational functions give the stated principal divisor.
- Total degree is preserved by graph projection and vanishes on principal divisors.
- Rank tests every effective divisor on the full metrized-complex carrier.
- The canonical divisor has degree 2g−2 and is independent up to linear equivalence of canonical-divisor choices.

**Checks.**

- A one-vertex complex with no edges recovers divisors and rank on Cᵥ, not a point graph.
- A self-loop requires two distinct marked points on Cᵥ.
- A graph slope at a vertex adds a marked-point chip, so taking only div(f_v) is incorrect.

For the construction, construct the free divisor group on graph interiors and residue-curve points. Refine at all breaks to prove total principal degree zero; moving vertex chips onto the corresponding component compares refined models.

*Needs:* [3.1 Metric graphs with loops and vertex genus](#31-metric-graphs-with-loops-and-vertex-genus); [3.2 Divisors and rank on metric graphs](#32-divisors-and-rank-on-metric-graphs); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus).

[Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), §§1.1–2.1, pp. 2–7. Carrier, half-edge markings, rational-function tuple and component slope terms.

### 3.9 Finite rank-determining sets

Prove *metrized complex rank determining*. Let C be a compact metrized complex with a loopless finite graph model G. For every vertex v choose any subset R_v⊂Cᵥ(κ) of cardinality g(Cᵥ)+1. The union R=∪_v R_v is rank determining: in the definition of r_C(D), it suffices to test effective subtractands supported on R. A graph loop must first be subdivided; points may be chosen away from the finitely many attaching points over algebraically closed κ.

κ algebraically closed; graph model loopless; the points in each R_v are distinct.

For the proof, first develop reduced divisors on the metrized complex, including existence and their precise uniqueness: the graph part and each residue-curve linear-equivalence class are determined, while a representative within a component class need not be unique. For D of degree d and nonnegative rank, prove continuity of P↦(D_P)_Γ from Γ to its symmetric power Sym^d(Γ); no continuous choice of component representatives is asserted. Use the v₀-reduced characterization to find a test point in one R_v detecting failure of rank one; subtract one test point and induct on the tested rank. These reduced-divisor results are established independently of Riemann–Roch and also supply the next target.

*Needs:* [3.8 Metrized complexes and their divisors](#38-metrized-complexes-and-their-divisors).

[Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorem 3.7, pp. 14–16; Appendix A, Theorem A.1, Lemma A.3 and Theorem A.4, pp. 40–43. Reduced divisors precede the finite-testing proof. Any g_v+1 residue points suffice on a loopless model; no unspecified genericity condition is imposed.

**Check.** A loop requires subdivision before the stated criterion applies. One residue point suffices on every genus-zero component.

### 3.10 Riemann–Roch and rank determination on complexes

Prove *Riemann–Roch for metrized complexes*. For a compact metrized complex C of genus g and any divisor D, r_C(D)−r_C(K_C−D)=deg D+1−g, using the combined graph/residue-curve principal-divisor convention.

Algebraically closed residue field; smooth proper Cᵥ; rank on the full divisor carrier. Finite testing uses §3.9, with a loopless graph model and g_v+1 distinct points on each component.

For the proof, use existence of reduced divisors and the nonspecial-divisor characterization to obtain the two rank inequalities. Establish the Appendix A rank-determining criterion before using finite tests; cardinality alone is not treated as its proof.

*Needs:* [3.8 Metrized complexes and their divisors](#38-metrized-complexes-and-their-divisors); [3.9 Finite rank-determining sets](#39-finite-rank-determining-sets).

[Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorem 3.2, p. 13 and Theorem 3.7, pp. 14–16; Appendix A, Theorem A.1, pp. 40–43. Riemann–Roch and the rank-determining criterion use the reduced-divisor construction and uniqueness convention in the preceding target.

**Check.** For one vertex without edges this is algebraic curve Riemann–Roch. For all Cᵥ=P¹ the statement agrees with metric-graph Riemann–Roch.

Use the reduced divisors established in the preceding target to prove the minimum positive-part rank formula and hence Riemann–Roch and specialization. Their componentwise uniqueness is a uniqueness of linear-equivalence classes, not chosen effective representatives. Amini–Baker §3.1, Theorem 3.7, pp. 14–16 supplies the reduced divisors; §§3.2–3.3, Lemmas 3.10–3.11 and Proposition 3.13, pp. 17–20 supplies the moderator and minimum positive-part rank argument. Appendix A, pp. 40–43 supplies the finite-testing continuity step. Neither proof imposes an extra genericity condition on the g_v+1 distinct residue points of a loopless model.

### 3.11 Specialization inequality

Prove *specialization rank inequality*. For a smooth proper connected curve X over algebraically closed complete nontrivial rank-one K and its semistable metrized complex C, specialization preserves principal divisors and r_X(D)≤r_C(sp D)≤r_Γ(τ_*D). The first map sends points above vertices to their residue point and points above graph interiors to their retraction. For f use the tuple (log|f||Γ, normalized reductions f_v), whose principal divisor is sp(div f).

Arbitrary rank-one value group; do not infer this range solely from Baker’s DVR argument.

For the proof, the slope formula gives principal compatibility, including the marked-point terms. Choose the Appendix A rank-determining residue points and lift them to X(K); specialize every effective subtractand to obtain r_X≤r_C. For the second inequality lift a graph effective subtractand to arbitrary component points of matching degree and project the effective representatives.

*Needs:* [3.10 Riemann–Roch and rank determination on complexes](#310-riemannroch-and-rank-determination-on-complexes); [3.7 Slope formula for rational functions](#37-slope-formula-for-rational-functions); [3.6 Specialization of algebraic divisors](#36-specialization-of-algebraic-divisors).

[Omid Amini and Matthew Baker, Linear series on metrized complexes of algebraic curves](https://arxiv.org/pdf/1204.3508v3), Theorems 4.5–4.6, pp. 23–24. Principal specialization and the rank inequality without a discrete-valuation restriction. [Matthew Baker, Specialization of linear systems from curves to graphs](https://arxiv.org/pdf/math/0701075v4), Lemma 2.8 and Corollary 2.10, pp. 8–10. Compatible DVR special case; not the source of the arbitrary rank-one proof.

**Check.** On a positive-genus good-reduction component the metrized complex retains algebraic rank while the point graph loses it. The inequality is r_X≤r_specialized, not the reverse.

### Examples

For f(s)=s on [0,L], divPL(f)=δ₀−δ_L and Δf=δ_L−δ₀. A tree has rank d for every divisor of nonnegative degree d. A circle has rank d−1 in positive degree and Jacobian ℝ/Lℤ. Vertex genus alone does not restore the rank of a good-reduction algebraic curve: the metrized complex must retain its residue curve (Gathmann–Kerber Proposition 3.1, pp. 11–12; Baker–Faber §3, pp. 15–16; Amini–Baker §§1–3, pp. 1–14).

### Dependencies

Layers 1–2, finite graph linear algebra and the imported algebraic divisor/Riemann–Roch theory. The metric-graph, reduced-divisor and metrized-complex arguments belong to this layer. Graph-only rank does not consume or encode residue-curve rank.

## Layer 4: Tropicalization and multiplicities

Use tilted models and valued extensions to define initial degenerations at every real tropical point. Scheme-theoretic generic lengths determine weights. Primitive lattice vectors and the target/image index determine balancing and pushforward; set-theoretic initial supports do not supply these integers.

### 4.0 Small-fan extension and valued toric comparisons

Construct the *small-fan extension*. For a field K and an arbitrary small rational fan Δ of strongly convex cones in a finite-rank lattice N with dual M, glue the affine charts of the finite subfans using their face open immersions. The result Y_Δ is a separated locally finite-type K-scheme, naturally identified on every finite subfan with its finite-fan scheme. Finite subfans cover Δ: the faces of each cone form a finite subfan, and finite unions of these subfans remain finite. The construction is the open gluing of this directed system, not a second construction for finite fans (Gubler §§6.2–6.3, p. 12, for the cone and fan charts; the small gluing is the extension specified here).

Prove *valued toric comparisons*: analytify these schemes by the locally finite-type gluing extension of §0.22. Toric morphisms, characters, orbit charts, products and face open immersions commute with isometric complete valued extension. For a smooth curve with a closed toric embedding X→Y and finitely many nonzero rational functions, their morphisms X→P¹ give a closed graph in Y×(P¹)ⁿ dominating the specified embedding; quasiprojectivity is preserved when Y is quasiprojective. The analytic comparison uses Gubler §§2.1–2.6, pp. 3–4, and BPR tropicalization §4.2, p. 14. No local finiteness of the affine chart family is assumed: every nonempty toric chart contains the dense torus.

Provide the following interface:

- Restriction to a finite subfan is its specified open subscheme, and inclusions of finite subfans compose coherently.
- Compatible maps on the finite-subfan schemes glue uniquely; the resulting finite specialization is the supplied finite-fan scheme.
- Fan morphisms and products extend from finite charts and preserve composition, characters and orbit strata.
- Coefficient change commutes with the small-fan gluing; isometric valued extension commutes with its analytification.
- The closed graph of the finite tuple of rational functions projects isomorphically to X and dominates its original embedding.

**Checks.**

- The zero cone in rank zero gives Spec K, including K=𝔽₂; the empty fan gives the empty scheme and no dense torus inclusion.
- The two rays in rank one recover P¹_K with overlap K[T,T⁻¹]; the finite specialization retains the supplied localization maps.
- The cone generated by (1,0) and (1,2) is allowed and is singular in characteristic zero; the comparison cannot assume regular cones.
- The graph of T² on G_m is closed in G_m×P¹ and has one-point projection fibers; replacing it by the product would give P¹ fibers.
- Infinitely many distinct rational rays in a rank-two lattice, together with the zero cone, form a small fan. Its scheme is locally of finite type but not quasi-compact; its infinitely many affine charts all meet in the torus, so that cover is not locally finite.

*Needs:* AnalyticToricGeometry Layer 0 for lattice/cone/fan/semigroup geometry; ShimuraCompactifications §§C0.16–C0.17 for the finite-fan carrier, face localizations, gluing property, coefficient change and toric morphisms; Mathlib `AlgebraicGeometry.Scheme.GlueData` for the small gluing; §0.22 for analytification.

### 4.1 Torus tropicalization

Construct *torus tropicalization*. For a split torus T=Spec K[M] with character lattice M and N=Hom(M,ℤ), define trop:Tᵃⁿ→N_ℝ by ⟨trop(x),u⟩=−log|χᵘ(x)|. For a closed subscheme X⊂T define Trop(X)=trop(Xᵃⁿ), including multiplicities only after the weighted-cycle construction. Torus homomorphisms induce the dual integral-linear tropical maps; valued scalar extension leaves Trop(X) unchanged.

K a valued field, completed before analytification; arbitrary rank-one value group, including the trivial valuation. The torus is split; nonsplit descent is additional data.

Provide the following interface:

- ⟨trop x,u⟩=v(χᵘ(x)).
- For a torus map with lattice map A, trop(fᵃⁿx)=A(trop x).
- Trop(X_L)=Trop(X).
- After nontrivial algebraically closed extension L, Trop(X) is the closure of tropicalizations of X(L).

**Checks.**

- Trop(G_m)=ℝ, including when K is trivially valued.
- The equation χᵘ=a tropicalizes into ⟨w,u⟩=v(a).
- The map T↦Tⁿ acts by w↦nw, so omitting the exponent fails.

For the construction, characters are invertible analytic functions, so logarithmic evaluation is well-defined and continuous. Pullback of characters proves functoriality; surjective spectral base change proves invariance. General-field toric scheme interfaces require §4.0 small-fan extension and valued toric comparisons.

Construct the *extended tropicalization*. Let Δ be a rational fan of strongly convex cones in the finite-rank lattice N, and let Y_Δ be its split toric K-scheme. For σ∈Δ put S_σ=σ∨∩M and N_ℝ(σ)=Hom_mon(S_σ,ℝ∪{∞}), where homomorphisms preserve addition and zero, ∞ is absorbing for addition, and ℝ∪{∞} has the order topology of ℝ∪{+∞}. Give N_ℝ(σ) the topology of pointwise convergence. For a face τ≼σ, localization of S_σ gives the open inclusion N_ℝ(τ)→N_ℝ(σ). Glue these charts to N_ℝ(Δ). On Y_σᵃⁿ define trop(x)(u)=−log|χᵘ(x)|, with −log 0=∞ (BPR tropicalization §4.2, p. 14).

Provide the following interface:

- The chart maps glue to a continuous, proper, surjective map trop:Y_Δᵃⁿ→N_ℝ(Δ). Here proper means that inverse images of compact subsets are compact. This holds over every complete nonarchimedean K, including trivially valued K.
- For nonempty Δ, N_ℝ is open and dense in N_ℝ(Δ), and restriction to Tᵃⁿ is the torus tropicalization. The stratum for the orbit of σ is N_ℝ/span_ℝ(σ).
- For a toric morphism f:Y_Δ→Y_Δ′ with lattice map F, precomposition by F* on the character monoids gives a continuous map F_trop:N_ℝ(Δ)→N_ℝ(Δ′), integral linear on each orbit stratum, with trop∘fᵃⁿ=F_trop∘trop. Identity and composition agree with those of the lattice maps.

For the construction, use face localization to compare the formulas on chart overlaps. A monoid point w has a weighted Gauss lift: on K[S_σ], assign Σa_uχᵘ the seminorm max_u |a_u|exp(−w(u)), with exp(−∞)=0. Its finite face determines the torus orbit and the remaining weights give a multiplicative Gauss seminorm on that orbit, so this lift proves surjectivity even for trivially valued K. In finitely many monoid generators, compact target sets have finite lower coordinate bounds; their inverse images are closed in a weighted affinoid domain and hence compact. The monoid charts are locally compact Hausdorff spaces, since finitely many generators present them as closed relation loci in products of ℝ∪{+∞}. The fan intersection property makes the glued target Hausdorff. Shrinking chart neighborhoods covers any compact set by finitely many compact subsets of charts, which proves global properness. Precomposition proves toric functoriality. The full monoid maps and zero-preserving condition exclude constant-∞ functions. BPR §4.2, p. 14 states the construction over algebraically closed nontrivially valued K; the weighted Gauss lift and arbitrary-radius affinoid compactness of §§0.17–0.18 give the stated general-field extension.

**Checks.**

- For Δ={0}, S₀=M and every monoid map is finite, since w(u)+w(−u)=w(0)=0. Thus N_ℝ(Δ)=N_ℝ and the map is exactly the torus map. If N=0 it is a map between one-point spaces; for the empty fan both glued spaces are empty and no dense torus inclusion is asserted.
- For A¹, N_ℝ(Δ)=ℝ∪{+∞}; the origin maps to +∞ and ζ(0,1) to 0. The map T↦T² sends a finite coordinate w to 2w and +∞ to +∞, fixing the sign and the boundary convention.
- For P¹, N_ℝ(Δ)=[−∞,+∞] is compact; 0 maps to +∞ and ∞ to −∞ because the second chart uses T⁻¹. For the single ray ℝ≥0·(1,0) in ℝ², the space is (ℝ∪{+∞})×ℝ, with no infinite second coordinate; adding endpoints in every direction would be wrong.

*Needs:* [0.22 Berkovich analytification](#022-berkovich-analytification); [0.17 Affinoid algebras over valued fields](#017-affinoid-algebras-over-valued-fields); AnalyticToricGeometry Layer 0 and §4.0 small-fan extension and valued toric comparisons for Y_Δ, face/orbit charts and toric morphisms.

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), §4.2, p. 14. The monoid charts, open face gluing, extended map and dense torus stratum specify the analytic construction used in Layer 5.

*Needs:* [0.22 Berkovich analytification](#022-berkovich-analytification); [0.18 Valued base change of spectra](#018-valued-base-change-of-spectra); AnalyticToricGeometry Layer 0 and §4.0 small-fan extension and valued toric comparisons.

[Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §2.1, p. 3; Definition 3.2 and Propositions 3.6–3.7, p. 7. Seminorm tropicalization, field-extension invariance and classical-point closure after algebraically closed nontrivial extension.

### 4.2 Initial degenerations over valued fields

Construct *initial degenerations*. For w∈N_ℝ, use the tilted algebra K[M]^w={Σa_uχᵘ:v(a_u)+⟨u,w⟩≥0}; close X in this model and take the residue fiber. When w is not realized in the value group, pass to a valued extension realizing w and translate its torus point to valuation zero before reduction. The resulting in_w(X) is well-defined up to the corresponding residue-field extension and torus translation; preserve its scheme structure and generic lengths. Polyhedral tilted models use the inequalities for every w in a polyhedron.

Finite-type closed X⊂T; do not assert canonical residue coordinates or finite presentation for every dense indivisible value group.

Provide the following interface:

- A realized weight gives the translated residue subscheme with its nilpotents.
- Initial degeneration commutes with valued base extension up to the stated residue identification.
- The inverse tropical image of a bounded rational polyhedron has its weighted affinoid algebra.
- Two realizations agree after common extension and torus translation.
- Generic local-ring lengths are not discarded by replacing the scheme with its reduced support.

**Checks.**

- For X={T=a}, in_w X is nonempty precisely at w=v(a).
- For (T−a)²=0, the initial point has length two, not one.
- For trivially valued K, X=G_m and w=√2, choose a complete valued extension containing a with v(a)=√2 and set T=aU. The translated initial scheme is G_m over its residue field; the non-value-group weight is neither empty nor undefined.

For the construction, extend the valued field to realize finitely many weights, translate and use flat closure over the valuation ring. Compare two choices in a common valued extension; reductions differ by the residual torus translation. For polyhedra apply the same inequality algebra and track the finiteness hypotheses.

*Needs:* [4.1 Torus tropicalization](#41-torus-tropicalization); [0.17 Affinoid algebras over valued fields](#017-affinoid-algebras-over-valued-fields).

[Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§5.1–5.5 and §§6.5–6.7, pp. 10–13. Extension/translation definition and the failure of unconditional finite generation over some valuation rings. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Definitions 4.8 and 4.14, Proposition 4.17 and §4.18, pp. 15–18. Canonical analytic/formal models and their initial special fibers.

Prove finite valued Gröbner control for tilted algebras over arbitrary real value groups, with descent along valued extensions when a chosen w is not in the original value group. Establish the Bieri–Groves dimension and purity theorem, then glue the finitely many initial-equivalence regions into the required Γ-rational complex. Do not replace this by noetherian Gröbner theory over a DVR: the valuation ring can be nonnoetherian and tilted algebras need not have the naive finite-presentation property. Gubler Theorems 3.3 and 10.14, pp. 7, 32 are the dimension and Gröbner statements; Proposition 10.15, p. 32 identifies the local star used below.

### 4.3 Fundamental theorem and polyhedrality

Prove *fundamental polyhedral theorem*. For finite-type X⊂T over any valued field, Trop(X)={w:in_w(X)≠∅}. It is the support of a finite v(K×)-rational polyhedral complex; if X is pure d-dimensional, it is pure d-dimensional. Local stars at w equal tropicalizations of in_w(X) over the trivially valued residue field.

Use the completion/valued-extension definition for arbitrary w; dimensional purity assumes X pure-dimensional.

For the proof, the fundamental equivalence follows from surjective reduction of the polyhedral affinoid domains and a lift of a residue point after valued extension. Homogenize and construct the finite Gröbner complex, constant up to translation on relative interiors; initial-of-initial identifies local stars. Use Gröbner finiteness and pure dimension from the preceding valued initial-degeneration construction.

*Needs:* [4.2 Initial degenerations over valued fields](#42-initial-degenerations-over-valued-fields); [0.18 Valued base change of spectra](#018-valued-base-change-of-spectra).

[Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), Theorems 3.3, 5.6 and 10.14; Proposition 10.15, pp. 7, 11 and 32. Support theorem, finite Gröbner subdivision, dimension and local-star comparison.

**Check.** The theorem holds for trivial valuation by analytic points even though classical K-points have only zero valuation. Nonreduced structure affects weights, not this support equality.

### 4.4 Tropical weights and balancing

Define *weighted tropical cycles*. For pure-dimensional X and a regular tropical point w, define m_X(w) as the sum of the generic local-ring lengths of the irreducible components of in_w(X), after a suitable algebraically closed valued extension. It is locally constant on the regular locus, independent of extension and compatible with the algebraic cycle [X]. On a rational subdivision, attach this integer to each maximal cell. A weighted d-complex is balanced if for each codimension-one face τ, Σ(σ⊃τ)m_σ u(σ/τ)=0 in N/N_τ, using primitive outgoing quotient-lattice vectors. Identify cycles under common subdivision.

Use saturated tangent lattices Nσ=N∩span(σ−σ); weights may be signed for general algebraic cycles, positive for effective X.

Provide the following interface:

- Each regular point or refined maximal cell carries its generic-length weight.
- Weights commute with valued extension and algebraic cycle multiplicities.
- Common subdivision defines equality of weighted tropical cycles.
- Primitive-normal weighted sums vanish modulo the face lattice.
- Cycle addition adds weights after common subdivision.

**Checks.**

- A doubled hypersurface has twice the reduced hypersurface weights.
- The standard tropical line has three primitive rays of weight one whose outgoing vectors sum to zero.
- Using a nonprimitive normal doubles one term and can destroy balancing.

For the construction, compare local stars with initial degenerations, prove cycle-linearity and valued-base-change invariance, then use trivial-valuation tropical compactification and intersection with toric strata for balancing. Refinement preserves weights. Prove the tropical-compactification and intersection comparison by the local-star argument below.

*Needs:* [4.3 Fundamental theorem and polyhedrality](#43-fundamental-theorem-and-polyhedrality).

[Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§13.4–13.11, pp. 43–45. Generic lengths, cycle/base-change compatibility, local constancy and balancing. [Bernd Sturmfels and Jenia Tevelev, Elimination theory for tropical varieties](https://arxiv.org/pdf/0704.3471v1), Definition 3.1, Lemma 3.2 and Corollaries 3.4/3.8, pp. 7–8. Trivial-valuation intersection proof and refinement independence.

Reduce balancing near w to the trivially valued tropicalization of the initial degeneration at w. Prove invariance of its generic cycle multiplicities under the required valued scalar extension and the initial-of-initial identification. Apply the toric local balancing argument to this cycle and transport it back to the local star. For pushforward also compare flat limits of cycles and their intersection multiplicities under the torus map; only source cells of full image dimension contribute. Sturmfels–Tevelev §3, pp. 7–10 treats the trivial-valuation construction; Gubler §§13.5–13.17, pp. 43–46 and BPR tropicalization Theorem 7.1 and Corollary 7.3, pp. 34–35 give the general-valued comparison. The weight is always multiplied by [N′τ:A(Nσ)], the target lattice modulo the image lattice.

### 4.5 Relative point and edge multiplicities

Define *relative tropical multiplicity*. For a pure-dimensional algebraic cycle [X] and a tropical point w, choose a complete algebraically closed valued extension realizing w. For each geometric analytic branch, multiply its canonical-reduction generic degree by the generic length of the base-changed algebraic cycle along that branch. Define m_rel(x) over the original field by summing these weighted geometric branches above x; non-Shilov branches have weight zero. Prove independence under further such extensions and their common refinements. In the geometrically reduced case each cycle length is one and this recovers the unweighted branch-degree formula. For a geometrically reduced curve over algebraically closed K and a noncontracted skeletal edge e, its branch relative multiplicity is the integral expansion factor, equal to the generic degree of a suitable finite annular projection. Over the original general field, a cycle-weighted edge contribution is the sum of geometric lengths times these branch expansion factors.

Use full generic field degrees, including inseparable degree, and multiply by geometric cycle lengths in m_rel as well as in m_Trop. Reduction degree and cycle length are distinct factors; neither is replaced by a branch count.

Provide the following interface:

- Non-Shilov points have relative multiplicity zero; Shilov weights are the cycle-length-weighted geometric generic degrees.
- The multiplicity over w is the sum of lifted relative multiplicities after realizing w.
- For a geometrically reduced curve over algebraically closed K, the point multiplicity on an edge interior equals its integer expansion factor; the general cycle formula sums the weighted geometric branches.
- m_Trop(w)=Σ(x∈trop⁻¹(w))m_rel(x), with finite nonzero support.

**Checks.**

- A point in an attached open residue ball is non-Shilov and has relative multiplicity zero.
- For n≠0 the annular map T↦Tⁿ has expansion and generic degree |n|, including inseparable characteristic-p cases. Thus n=−2 gives degree two, while n=0 is contracted and is excluded from the finite-map assertion.
- Two distinct degree-one annular branches over one tropical edge contribute total weight two.

For the construction, canonical reduction associates Shilov points with generic components. Compare a separating character projection with a finite annular map and compute its degree from its primitive slope. Base-change invariance and summation over lifted components give the arbitrary-weight definition.

*Needs:* [4.2 Initial degenerations over valued fields](#42-initial-degenerations-over-valued-fields); [1.6 Integral slopes of analytic units](#16-integral-slopes-of-analytic-units).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Definitions 4.21 and 4.23, Proposition 4.24, pp. 18–19; Theorem 5.8, pp. 22–23. Shilov point multiplicities, initial generic lengths and equality with edge expansion factors.

Relate the finite degree on canonical reductions of the relevant affinoid fibers to generic scheme lengths of the initial degeneration. After the required scalar extension, sum those cycle-length-weighted reduction degrees over analytic branches and compare each annular degree with its primitive lattice expansion. Multiply the full residue field degree, including its inseparable part, by its generic cycle-length factor, and retain both factors in the comparison. BPR tropicalization Proposition 5.4, Theorem 5.8 and Corollary 5.9, pp. 21–23 supplies this finite-map comparison. It proves the multiplicity formula and the multiplicity-one isometry criterion, beyond the calculation of a gcd of coordinate slopes.

**Checks.**

- For trivially valued K=𝔽_p(a) and X={Tᵖ=a}⊂G_m, algebraic closure gives (T−a^(1/p))ᵖ=0: cycle length p times reduction degree 1 gives m_rel=m_Trop=p.
- Its product with G_m has weight p along the free tropical direction; the reduced-support value 1 fails.
- For the separate geometrically reduced map T↦Tᵖ, cycle length 1 and inseparable annular degree p give expansion p; multiplying those two different examples together would give the wrong value p².

### 4.6 Tropical multiplicity formula for curves

Prove *tropical multiplicity formula*. For the standing smooth curve over algebraically closed K, after suitable subdivision, each tropical edge e′ has finitely many embedded segments e_i of H° mapping homeomorphically onto it. Other segments disjoint from these in its preimage are contracted. Its multiplicity is the sum of their positive integral expansion factors. Initial-degeneration components are counted with scheme multiplicities.

For the proof, for a value-group-rational tropical point, pass to its polyhedral analytic fiber and canonical reduction. The Shilov components account for the initial-degeneration generic lengths. For a curve, a finite annular projection identifies each relative component degree with its integral expansion factor. Sum over the noncontracted preimage edges; contracted components contribute zero. Extend to other points by valued base change. Use the canonical-reduction degree and scheme-length comparison constructed in the relative-multiplicity target.

*Needs:* AnalyticToricGeometry Layer 0 and §4.0 small-fan extension and valued toric comparisons; [4.5 Relative point and edge multiplicities](#45-relative-point-and-edge-multiplicities); [3.7 Slope formula for rational functions](#37-slope-formula-for-rational-functions).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Theorem 1.3, pp. 2–3; Proposition 5.4, Theorem 5.8 and Corollary 5.9, pp. 21–23. The curve multiplicity formula is proved by the comparison of analytic edge degrees and initial generic lengths. The finite-map reduction argument is specified in the relative-multiplicity construction.

**Check.** Factors 2 and 3 contribute multiplicity 5, not 2.

### 4.7 Expansion factors from coordinate slopes

Prove *expansion factor gcd*. For an affine curve embedded in a torus by invertible regular functions f_i, the expansion factor on an affine edge is the gcd of the absolute values of the integral slopes of log|f_i|. An all-zero slope tuple gives factor zero and a contracted edge.

For the proof, the index of the coordinate-slope vector in its primitive lattice direction is the gcd. The relative-multiplicity comparison identifies this lattice index with the analytic expansion factor, using the annular metric and slope formula.

*Needs:* [4.5 Relative point and edge multiplicities](#45-relative-point-and-edge-multiplicities); [3.7 Slope formula for rational functions](#37-slope-formula-for-rational-functions).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Remark 5.6 and formula (5.6.1), p. 22. The expansion index of an integral slope vector is the positive gcd of its coordinate slopes, measured against the primitive image lattice.

**Check.** Slopes (−2,4) give factor 2; (0,0) gives zero.

### 4.8 Sturmfels–Tevelev pushforward

Prove *cycle pushforward*. Let f:T→T′ be a torus homomorphism with lattice map A:N→N′, and f:X→Y its dominant generically finite restriction of degree δ between integral d-dimensional subvarieties. After a subdivision on which every noncontracted maximal cell maps into a target cell, `δm_Y(τ)=Σ_{σ↦τ}m_X(σ)[N′τ:A(Nσ)].` Cells whose image dimension is smaller than d contribute zero. Equivalently Trop(f_*[X])=A_*Trop([X]), extended linearly to cycles.

Equal dimensions and generically finite restriction; saturated tangent lattices and positive finite index in the displayed direction.

For the proof, reduce by valued extension and cycle-linearity to complete algebraically closed fields. On corresponding polyhedral domains compare finite-map degrees and generic reduction degrees; sum over source components. Subdivision and initial local-star compatibility make the formula independent of the chosen cells.

*Needs:* [4.4 Tropical weights and balancing](#44-tropical-weights-and-balancing); [4.5 Relative point and edge multiplicities](#45-relative-point-and-edge-multiplicities).

[Walter Gubler, A guide to tropicalizations](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf), §§13.14–13.17, pp. 45–46. Cycle pushforward and the generic-degree formula. [Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), §7, Theorem 7.1 and Corollary 7.3, pp. 34–35. Analytic proof input for arbitrary-dimensional pushforward, distinct from curve harmonicity.

**Check.** For T↦Tⁿ on G_m with n≠0, δ=|n| and [ℤ:nℤ]=|n|, so both sides equal |n|. A contracted component contributes zero to the d-dimensional pushforward. The reciprocal lattice index is not used.

**Check.** For z↦z², the source lattice maps to 2ℤ inside the target ℤ, giving [ℤ:2ℤ]=2. The reversed index is not an index of a subgroup. Use this target/image convention for Gubler §13.16, author-hosted v2 p. 46, consistently with Sturmfels–Tevelev formula (1.2), pp. 1–2 and BPR Corollary 7.3, pp. 34–35.

### Examples

The doubled equation (χᵘ−1)² has the same tropical support as χᵘ−1 and twice its weight. For z↦zⁿ on G_m with n≠0 the pushforward index is [ℤ:nℤ]=|n|; this includes the inseparable map n=p in characteristic p. Scheme multiplicity, lattice expansion and the number of branches remain distinct quantities (Gubler §§13.5–13.17, pp. 43–46; BPR tropicalization Corollary 7.3, pp. 34–35).

### Dependencies

Layers 0–3 for analytic points, annular slopes, skeleta and the slope formula; AnalyticToricGeometry Layer 0 for lattice and fan geometry; ShimuraCompactifications §§C0.16–C0.17 for finite-fan schemes and toric morphisms; §4.0 for the small-fan extension and valued toric comparisons. The valued Gröbner, cycle multiplicity and balancing arguments are constructed here.

## Layer 5: Faithful tropicalization of curves

Faithfulness requires injectivity as well as primitive slopes. Add local unit-slope functions, annular approximations and global separating coordinates, then preserve faithfulness under toric domination. Marked rays require their own eventual coprime-pole slope argument.

### 5.1 Multiplicity-one isometry criterion

Prove *multiplicity one isometry*. If Γ′ is a finite embedded tropical subgraph and every initial degeneration at w in Γ′ is irreducible and generically reduced, the positive-relative-multiplicity Shilov lifts form a canonical embedded Γ in H° mapping homeomorphically and isometrically onto Γ′ for the subgraph length metrics. If Γ′ has no isolated vertices, this is the unique embedded lift mapping homeomorphically onto Γ′. At an isolated vertex, uniqueness requires the positive-relative-multiplicity condition; arbitrary singleton lifts are not unique.

Require m_Trop(w)=1 for every w∈Γ′, including isolated points outside the value group, using valued extension to define their multiplicities. On nondegenerate segments local constancy permits testing value-group-rational points; isolated points require the explicit hypothesis.

For the proof, at each value-group-rational tropical point, multiplicity one forces a unique generically reduced initial component and one relative-multiplicity-one Shilov lift. On edges the multiplicity formula forces expansion one. Uniqueness at vertices glues these lifts into a graph; intrinsic retraction and properness prove the inverse is continuous. Extend across non-value-group points on edges by their adjacent intervals. For an isolated non-value-group point the explicit multiplicity-one hypothesis gives, after valued base extension, a unique Shilov point of its tropical affinoid fiber, descending that point independently of the extension.

*Needs:* [4.6 Tropical multiplicity formula for curves](#46-tropical-multiplicity-formula-for-curves); [4.5 Relative point and edge multiplicities](#45-relative-point-and-edge-multiplicities); [2.8 Continuity of skeletal retraction](#28-continuity-of-skeletal-retraction).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Theorem 1.4, p. 3; Theorems 5.24–5.25, Remarks 5.26–5.27 and Corollary 5.28, pp. 27–28. Multiplicity one gives a unique positive-relative-multiplicity lift and unit expansion on the stated locus; continuity and compactness identify the intrinsic graph metrics.

**Check.** Irreducibility without generic reducedness is insufficient. For X=G_m and Γ′={0}, both ζ(0,1) and ζ(1,r), 0<r<1, are nonclassical singleton lifts mapping isometrically to {0}. Only the Gauss/Shilov point ζ(0,1) has positive relative multiplicity. This separates the canonical section from unrestricted uniqueness at isolated vertices.

**Check.** Over ℂ_p with p≠2, take y²=1+x in G_m² and Γ′={(α,0)} with α>0 outside v(ℂ_p×). The rational-point test is empty, while after realizing α the initial equation is y²−1, with two components and two degree-one Shilov lifts, hence m_Trop=2. It fails the all-point hypothesis. This also preserves the distinction between canonical Shilov uniqueness and arbitrary singleton lifts.

### 5.2 Faithful tropicalization on a graph

Define *faithful embedding predicate*. For a closed algebraic embedding ι:X→Y_Δ into a toric variety, faithful tropicalization on a finite embedded graph Γ⊂H°(Xᵃⁿ) means trop_ι|Γ, where trop_ι is §4.1’s extended tropicalization composed with ιᵃⁿ, is a homeomorphism onto its image and an isometry for Γ’s intrinsic path metric and the tropical lattice-length metric. On each noncontracted edge the expansion factor is the gcd of the absolute coordinates of its integral slope vector; being one is necessary for edgewise isometry but does not by itself imply global injectivity or correct vertex gluing.

K algebraically closed complete nontrivial; X smooth connected curve; subdivide at finitely many tropical breakpoints.

Provide the following interface:

- The slope-vector gcd is the integer expansion on a noncontracted edge.
- Faithfulness is global injectivity/homeomorphism plus all edge factors one.
- Faithfulness is unchanged by compatible source/target subdivisions.
- For compatible toric embeddings ι′ dominating ι, tropicalization factors through the integral toric projection.

**Checks.**

- The annular coordinate T² has expansion two and is not faithful on its skeleton.
- Two different source edges mapping onto one primitive edge are not faithful even though both factors are one.
- A graph containing only a long arc of a skeletal circle uses its own path distance, not the shorter omitted arc.

For the construction, define lattice length by primitive integral direction, use intrinsic shortest paths on both graph realizations, and separate edgewise expansion from global topology.

*Needs:* [3.1 Metric graphs with loops and vertex genus](#31-metric-graphs-with-loops-and-vertex-genus); [4.1 Torus tropicalization](#41-torus-tropicalization); [4.5 Relative point and edge multiplicities](#45-relative-point-and-edge-multiplicities); AnalyticToricGeometry Layer 0 and §4.0 small-fan extension and valued toric comparisons.

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), §5.15, Remark 5.16 and Lemma 5.17, pp. 24–25. Faithfulness and the warning to use the graph’s intrinsic metric, not an ambient skeleton shortcut.

### 5.3 Functions separating edges and vertices

Prove *unit slope separating functions*. Given a finite embedded graph Γ⊂H°(Xᵃⁿ), one can choose finitely many nonzero rational functions on X that provide a primitive slope on each subdivided edge and separate all points of Γ that an initial toric embedding identifies. Adjoin them as coordinates, allowing the toric compactification required for their zeros and poles, to obtain a dominating closed toric embedding faithful on Γ.

Smooth algebraic connected curve over algebraically closed complete nontrivial K; subdivide loops and ensure finitely many relevant graph edges/vertices.

For the proof, on vertex residue curves use algebraic Riemann–Roch to prescribe a slope-one local function, then lift it to a formal vertex domain. Approximate annular coordinates by global rational functions on suitable affinoids; compactness extracts finitely many separating functions. Separate edges first, then vertices and disjoint pieces, and include an initial closed embedding. Prove the local residue lifting and global approximation statements by the constructions and sources below.

*Needs:* [5.2 Faithful tropicalization on a graph](#52-faithful-tropicalization-on-a-graph); [3.7 Slope formula for rational functions](#37-slope-formula-for-rational-functions); TauCetiRoadmap.AlgebraicCurves Layer 4.

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Lemmas 5.18–5.19 and Theorem 5.20, pp. 25–26. Residue Riemann–Roch, formal lifting, Runge approximation and finite separating coordinates.

**Check.** A bad T² coordinate is repaired by adjoining T, yielding slope vector (2,1) and gcd one. Edgewise primitive slopes alone do not complete the vertex-separation step.

Establish three analytic approximation inputs in addition to algebraic Riemann–Roch. Lift rational functions on residue components that are regular at the nodes and agree there to a global meromorphic function regular over their regularity locus. Bosch–Lütkebohmert (1985), Corollary 3.8, pp. 364–365 proves this by the formal reduction and lifting statements of Proposition 3.7. Approximate an annular coordinate by a global meromorphic function regular on the chosen affinoid, closely enough that its leading Laurent term and slopes are preserved (Fresnel–Matignon, Théorème 4, §2.4, pp. 182–184). Describe each required edge affinoid by rational sublevel functions (their Théorème 1, §1.4, pp. 165–168). BPR tropicalization Lemmas 5.18–5.19 and Theorem 5.20, pp. 25–26 combine these inputs. Use finitely many such functions to separate edges and vertices; then add coprime-pole functions at punctures and take a closed graph over the specified toric embedding. The same inputs serve faithful domination and marked-ray faithfulness.

### 5.4 Faithful tropicalization of a finite subgraph

Prove *faithful tropicalization and expansion factors*. Every finite embedded Γ in H°(Xᵃⁿ) admits a closed embedding of X into a quasiprojective toric K-variety meeting its dense torus T such that Γ maps isometrically onto its tropical image. Metrics are the subgraph length metrics. H° is the non-leaf locus, excluding classical and type-4 points.

For the proof, cover the finite embedded graph by finitely many closed skeletal segments. Use unit-slope functions to make the expansion gcd one, and add finitely many separating coordinates for pairs in distinct graph neighborhoods. The resulting toric refinement is locally isometric and injective on the compact graph, hence faithful.

*Needs:* [2.2 Skeleton of a semistable decomposition](#22-skeleton-of-a-semistable-decomposition); AnalyticToricGeometry Layer 0 and §4.0 small-fan extension and valued toric comparisons; [5.2 Faithful tropicalization on a graph](#52-faithful-tropicalization-on-a-graph); [5.3 Functions separating edges and vertices](#53-functions-separating-edges-and-vertices).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Theorem 1.1, p. 2; Theorems 5.20–5.21 and proofs, p. 26. The finite-graph existence theorem follows from finitely many separating unit-slope coordinates. Use the residue lifting, annular approximation and rational sublevel constructions specified in the preceding separating-functions target.

**Check.** A plane embedding can contract a Tate loop; faithfulness is not automatic.

### 5.5 Faithfulness under domination

Prove *faithful domination*. Embeddings faithful on a fixed Γ are stable under domination by equivariant toric maps and cofinal among toric embeddings meeting the dense torus.

For the proof, extend each separating rational function on the smooth proper completion to a morphism to P¹. For the specified closed embedding into a toric variety Y, take the graph of this finite tuple in Y×(P¹)^n. This is a closed toric embedding and projection gives domination; the target remains quasiprojective when Y is quasiprojective. The gcd-one slope and point-separation properties persist under adjoining coordinates. For domination by any equivariant toric map, expansion indices multiply and the composite has index one, so both indices are one. Use the intrinsic image-graph metric.

*Needs:* [5.4 Faithful tropicalization of a finite subgraph](#54-faithful-tropicalization-of-a-finite-subgraph); [5.3 Functions separating edges and vertices](#53-functions-separating-edges-and-vertices); [5.2 Faithful tropicalization on a graph](#52-faithful-tropicalization-on-a-graph).

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), §5.15, Remark 5.16, Lemma 5.17 and Theorems 5.20–5.21, pp. 24–26. Lemma 5.17 treats domination for toric targets; Theorems 5.20–5.21 supply quasiprojective faithful embeddings. Taking the product with an arbitrary specified toric target proves cofinality in the stated class. Use the residue lifting and annular approximation constructions specified in the preceding separating-functions target.

**Check.** Lengths are measured within the image subgraph, not via shortcuts in the entire tropicalization.

### 5.6 Faithful tropicalization of marked rays

Prove *puncture ray faithfulness*. For X= X̄\D with finite marked punctures, choose a semistable extended skeleton and a toric embedding that sends each puncture to the toric boundary. Using §4.1’s extended tropicalization on the toric boundary, a dominating toric embedding can be made faithful on the entire extended skeleton, including infinite tails. At each puncture use two rational functions with coprime pole orders larger than 2g to force gcd-one expansion on the eventual ray, then refine the remaining compact part.

K algebraically closed complete nontrivial; smooth proper completion and distinct split marked points.

For the proof, Riemann–Roch produces functions with the two prescribed sufficiently large pole orders at each mark; their eventual slopes have gcd one. Outside finitely long initial segments they separate the labeled rays; apply compact-graph faithful refinement to the remaining core.

*Needs:* [2.15 Marked skeleta and puncture rays](#215-marked-skeleta-and-puncture-rays); [5.3 Functions separating edges and vertices](#53-functions-separating-edges-and-vertices); §4.1 extended tropicalization for the toric boundary.

[Matthew Baker, Sam Payne, Joseph Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320v3), Theorem 5.22 and proof, pp. 26–27. Coprime pole orders repair the unbounded tails as well as the finite graph.

### Examples

A coordinate T² alone has expansion two on an annulus. Adjoining T gives slope vector (2,1) and expansion one. That local gcd calculation still needs global injectivity: two distinct edges can otherwise have the same tropical image. Add functions separating all relevant edges and vertices, and take their closed graph over the prescribed toric embedding (BPR tropicalization Lemmas 5.18–5.19 and Theorem 5.20, pp. 25–26).

### Dependencies

Layers 0–4; AlgebraicCurves Layer 4 and Tau Ceti algebraic Riemann–Roch for prescribed-pole functions; AnalyticToricGeometry Layer 0 for lattices and §4.0 for valued toric comparisons. Formal residue-function lifting and Runge approximation are the additional analytic arguments specified in this layer.

## Layer 6: Model metrics, measures and local heights

For formal models in this layer, K is complete and nontrivially valued. Model intersection degrees first give atomic measures with the correct total mass. Semipositivity and integrability specify the approximation class for weak limits and local heights. Graph Green functions, line Hsia potentials and hybrid topology have distinct contracts; none implies dynamical convergence without its consumer theorem.

### 6.1 Formal and model metrics

Define *formal model metrics*. A model metric on a line bundle L over proper X is induced by an admissible formal model (𝔛,𝔏) of (X,L^e), e≥1: for a formal frame σ of 𝔏 and a local section s of L with s^e=fσ, define ||s||^e=|f|. A metric is continuous, homogeneous in scalars and nonzero on nonzero vectors. Tensor products and duals add and negate logarithmic metric ratios. A vertical Cartier divisor gives a model function on Xᵃⁿ, compatible with admissible blowups.

Proper K-variety and positive tensor exponent; formal line-bundle frames of L^e, not an unchosen frame of L.

Provide the following interface:

- A model of L^e defines a metric on L by the e-th-root rule.
- A model frame has norm one; multiplying by f changes the norm by |f|.
- Tensor, dual and tensor-power metrics satisfy the logarithmic sum/negative/scaling rules.
- Model pullback agrees with pullback of the analytic norm and respects composition.
- Pullback to an admissible blowup does not change the analytic metric.

**Checks.**

- A trivial line with its trivial model has constant frame norm one.
- A model of L² must use square roots; omitting e doubles log norms.
- Multiplying a local frame by an integral unit leaves the norm unchanged.

For the construction, use unit absolute value of formal transition functions to glue the local norms; divide logarithms by e. Pullback along a common admissible blowup compares different model presentations.

*Needs:* [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms); AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`); AdicSpacesPartIII §R2.3 (`raynaud-generic-fibre`).

[Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.1–2.3, pp. 4–5. Formal metrics, tensor powers, semipositivity and model-function changes.

**Check.** For a local section s of L with s^e=fσ in a formal frame σ of the model of L^e, the defining identity is ||s||^e=|f|. A frame of L^e is not silently treated as a frame of L; tensor and dual operations respect this identity.

### 6.1a Geometric model intersections and rank-one descent

Prove *geometric intersection specialization*. Over a complete nontrivially valued algebraically closed field C, put finitely many rational model metrics on a common proper admissible model with reduced special fiber, relatively normal in its reduced generic fiber. Construct such refinements by the power-bounded affinoid charts and their gluing; in this field range they remain locally topologically finitely presented. For model bundles extending L_i^e_i, the sum of special-component intersection degrees divided by ∏e_i equals the generic intersection degree. Prove *geometric intersection projection*: these weighted degrees and their associated component points respect proper model modifications and further algebraically closed isometric extension. The construction includes common refinements of any finite collection of model presentations (Ducros §§6.3.9–6.3.10, pp. 340–341; Chambert–Loir Definition 2.4 and §2.5, pp. 5–6, for the intersection formula).

For a complete discretely valued K and a proper normal admissible K°-model, prove agreement with the literal special-fiber formula using scheme-theoretic component multiplicities and residue-field degrees. SchemeAndStackFoundations §§5.2–5.3 supplies the field-valued cycle intersections and proper pushforward; §5.9 supplies the discrete calibration. For arbitrary rank-one K, use geometric extension and pushforward in §6.2. The ordinary special fiber of a K°-normalization is not used to define its weights, and no normal admissible refinement over K is required.

For geometrically nonreduced base changes, retain the generic lengths of their fundamental cycles before passing to the reduced irreducible supports and their normalizations. Prove compatibility of these cycle lengths with intersection degree, proper pushforward and further extension; this retains purely inseparable degree even when the analytic point set is unchanged. Vertical Cartier metric changes are compared on the geometric models and then pushed to Xᵃⁿ. These specialization and projection results provide the rank-one curvature input of §6.7.

**Checks.**

- A reduced component of degree 6 modeling L² contributes 6/2=3; forgetting the tensor power gives 6.
- On a normal DVR model, multiplicity 2 and residue-field intersection degree 3 contribute 2·3=6. Over C, the reduced-fiber formula instead accounts for degree through the geometric components and cycle lengths.
- A constant separable degree-two point becomes two geometric points of weight one; their pushforward has mass 2. A purely inseparable degree-p point becomes one geometric support of generic length p and still has mass p.
- Subdividing uv=a into lengths v(b) and v(a)−v(b) preserves their sum v(a), and the opposite new interior Cartier fluxes cancel.

*Needs:* §6.1 model metrics; §0.18 valued extension and §0.22 analytification; AdicSpacesPartIII §§R2.2–R2.3 for admissible models and generic fibers; SchemeAndStackFoundations §§5.2–5.3 and §5.9 for cycle intersections, generic lengths, pushforward and the DVR comparison. The arbitrary-base measure descent is constructed in §6.2 after this geometric intersection theorem.

### 6.2 Chambert–Loir model measures

Construct *geometric model measures*. Over C as in §6.1a, for a proper d-cycle with rational model-metrized line bundles L₁,…,L_d, define the finite atomic measure on a common reduced-special-fiber model by the component intersection weights `deg_Y(c₁(𝔏₁)…c₁(𝔏_d))/(e₁…e_d)` at the unique component points ξ_Y. Extend linearly over the generic multiplicities of the cycle, using normalizations of its reduced supports. For a normal model over a complete DVR, the same measure is given by the formula with the additional scheme-theoretic special-component multiplicity and the residue-field degree convention. On a reduced split semistable curve it is Σ_v deg(𝔏|Cᵥ)/e·δ_v (Chambert–Loir Definition 2.4 and §2.5, pp. 5–6; Ducros §6.3.9, pp. 340–341, for the geometric model range).

Construct *rank-one model-measure descent*. For every complete nontrivially valued rank-one K, choose an isometric embedding into a completed algebraic closure C and write p_C:X_Cᵃⁿ→Xᵃⁿ for the scalar projection. Pull back the metrics and the fundamental d-cycle, retaining inseparable generic lengths, and define μ_K=(p_C)_*μ_C. Prove independence of the closure, its embedding and all geometric model presentations; for every complete isometric extension L/K prove `(p_L)_*μ_L=μ_K`. This is scalar-extension pushforward, with no division by a finite or infinite field-extension degree. A finite surjective morphism between K-varieties has the separate degree factor stated below.

Provide the following interface:

- Over C the measure is the finite atomic sum above; over K it is its finite atomic pushforward, without requiring a normal admissible K°-model.
- The total mass over every K is deg_X(L₁…L_d), including the degree of a zero-dimensional fundamental cycle.
- The measure is symmetric and multilinear in metrized line bundles and linear in cycles.
- For finite surjective f:X→Y between integral proper d-dimensional K-varieties of degree δ, `f_*c₁(f*L₁)…c₁(f*L_d)=δ c₁(L₁)…c₁(L_d)`; δ includes the inseparable degree.
- Common admissible modifications of a model presentation preserve the measure; scalar-extension pushforward is transitive and agrees with the DVR formula and split semistable formula in their ranges.

For the proof, construct the geometric atomic measure using §6.1a's common reduced models. Prove modification invariance and invariance under algebraically closed extension by intersection projection and the compatibility of the distinguished power-bounded charts with geometric extension. Compare two choices of C inside a common complete algebraically closed valued overfield, using §0.15a's isometric amalgamation, and push to Xᵃⁿ. Apply the same comparison to L/K for extension invariance. Geometric intersection degree and flat cycle base change give total mass; proper cycle pushforward gives the finite-map degree formula. The field-range extension and its independence are theorem targets here; the normal-model assertion in Chambert–Loir §2 is not a general normalization theorem over K°.

**Checks.**

- A degree-d line bundle on a split good-reduction curve gives dδ_v; a degree-zero trivial model line gives zero curvature.
- A reduced component of degree 6 for L² has weight 3. On a DVR model a multiplicity-two component of degree 3 for L has weight 6; the two formulas are compared after geometric extension.
- Let v(5)=1, K be the completion of the union of ℚ₅(5^(1/2ⁿ)), and L=K(θ), θ³=5. The K-variety Spec L has degree 3. Its geometric base change has three points of weight 1, all projecting to its one analytic point, so μ_K=3δ_x. The ordinary fiber of L° has degree 1 and cannot supply this weight.
- In that example v(K×)=ℤ[1/2], and the coefficient ideals of θ and θ² in L° have infima −1/3 and −2/3, neither attained. For instance −1/4>−1/3 can be improved to −5/16>−1/3. No finite generating set reaches the infimum; L° is not an admissible finite-presentation normalization of the finite-free model defined by T³−5.
- For a purely inseparable extension of degree p in characteristic p, geometric base change has one point of length p. The descended mass is p, including p=2 and p=3; discarding nilpotents would give the wrong mass 1.

*Needs:* §6.1 model metrics; §6.1a geometric intersection specialization, projection and cycle lengths; §0.15a isometric amalgamation; §0.18 scalar projection; §0.22 proper analytification; SchemeAndStackFoundations §§5.2–5.3 cycle intersections and proper pushforward. Limits enter only in §6.4 after §6.3 defines the metric classes.

### 6.3 Semipositive and integrable metrics

Define *semipositive integrable metrics*. A formal/model metric is semipositive if its model line bundle has nonnegative degree on every proper special-fiber curve. A continuous semipositive metric is a uniform limit of semipositive model metrics. An integrable metrized line bundle is a difference, in the metrized Picard group, of two semipositive metrized line bundles. The uniform metric distance on a fixed L is sup_x|log(||·||₁/||·||₂)(x)|.

Use a compact proper analytification; comparison ratios are frame independent. For nonmetrizable fields the approximation mode is stated explicitly as nets or a countable-descent construction, not assumed automatic.

Provide the following interface:

- The logarithmic uniform distance is a genuine metric on metrics of a fixed line bundle.
- Semipositive metrics form a tensor/additive cone and integrable metrics form a group.
- A uniform limit of semipositive metrics is semipositive in the approximation definition.
- Mixed semipositive model measures are positive. The extension to continuous integrable metrics is constructed in §6.4, after semipositive limits.

**Checks.**

- On a split curve, a model degree −1 on one component is not semipositive even if total degree is positive.
- Uniformly multiplying a metric by a positive constant preserves semipositivity.
- The difference of semipositive metrics can have signed curvature and is not required semipositive.

For the construction, prove frame independence of ratios and the metric/tensor identities. Nefness on model curves yields positive model measures; complete the cone in the uniform topology and take its difference group.

*Needs:* [6.1 Formal and model metrics](#61-formal-and-model-metrics); [6.2 Chambert–Loir model measures](#62-chambertloir-model-measures).

[Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §§2.2–2.3 and Proposition 2.7, pp. 4–8. Model semipositivity, uniform approximation and integrable differences; source §2 uses a countable dense subfield.

### 6.4 Limits and local intersection heights

Prove *measure limits and local heights*. On proper X over a complete nonarchimedean field with a countable dense subfield, mixed measures of uniformly convergent semipositive model metrics converge weakly to a positive Radon measure of the same degree mass, independently of approximants; extend multilinearly to integrable metrics. For sections s₀,…,s_d meeting properly, local heights satisfy h(s₀,…,s_d|Z)=h(s₁,…,s_d|div_Z s₀)−∫log||s₀|| c₁(L₁)…c₁(L_d)|Z. Changing one continuous metric by exp(−F) changes the corresponding local height by the integral of F against the remaining mixed curvature. The extension is for integrable metrics and admissible logarithmic singularities, not arbitrary singular potentials.

Proper d-cycle, properly intersecting sections, integrable metrizations and integrable logarithmic terms. Algebraic intersection uses v(π)=1; analytic local heights include −log|π|.

For the proof, for model metrics apply intersection recursion and projection formula. The telescoping estimate bounds a change of one metric by its uniform distance times the appropriate mixed degree. Uniform density of model functions identifies weak limits against continuous tests; positivity and mass control yield Radon convergence. Extend by multilinearity and prove decomposition independence. For arbitrary bases apply the model-function density and positive-functional/Radon-limit extension stated below in this section.

*Needs:* [6.3 Semipositive and integrable metrics](#63-semipositive-and-integrable-metrics); [6.2 Chambert–Loir model measures](#62-chambertloir-model-measures).

[Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.5 and Proposition 2.7, pp. 6–8. Local height recursion, Lipschitz control and passage to semipositive/integrable limits.

**Check.** Uniform convergence alone does not imply weak convergence of arbitrary signed Laplacians without positivity or total-variation control. The measure mass remains deg(L₁…L_d) through approximation.

Prove *uniform density of model functions*: for a proper variety X over any complete nontrivially valued rank-one K, rational model functions are uniformly dense in C(Xᵃⁿ,ℝ). A model function is −log‖1‖ for a rational model metric on the trivial line bundle. Constants from ℚ·v(K×) are dense in ℝ; common modifications allow maxima and minima, and rational domains separate distinct points, giving the lattice Stone–Weierstrass argument (Chambert–Loir §2.1, p. 4, for the model-metric density argument; the arbitrary-base version is proved by this route).

Prove *model-measure limits over arbitrary bases*: on that X, for fixed line bundles and uniformly convergent nets of semipositive rational model metrics as in §6.3, mixed model measures converge weakly to positive Radon measures of mass deg_X(L₁…L_d), independent of the approximating nets. Multilinearity then defines the signed mixed measures for differences of semipositive metrized bundles, independent of their decompositions. The same telescoping estimates prove the local-height identities above whenever the logarithmic terms are integrable. Uniform approximation is in the sup-norm metric, which admits a sequence chosen with errors ≤1/n even when Xᵃⁿ is not metrizable; the measure proof uses compact Hausdorff Riesz representation, not sequential compactness of Xᵃⁿ.

For the proof, integrate a model test function by the model intersection recursion, use the uniform-distance/mixed-degree estimate to show the resulting net is Cauchy, and extend its positive functional from the dense model-function lattice to C(Xᵃⁿ). Riesz representation gives the Radon limit with fixed mass. Common approximation gives independence, and polarization/telescoping gives the mixed and integrable extensions. For a nonprojective proper variety, use SchemeAndStackFoundations §4.12’s Chow lemma over the field K to choose a projective modification, prove the estimate after pullback there, and push forward by §6.2’s projection formula. The degree-one modification comparison makes the result independent of the modification. These conclusions do not assume a countable dense subfield.

*Needs:* §6.1 model functions; §6.2 descended model measures and §6.1a geometric intersections; §6.3 semipositivity; compact Hausdorff analytification from §0.22; SchemeAndStackFoundations §4.12 (`chow_lemma`) for the proper-to-projective modification. No general integrable-measure construction is consumed by §6.3.

**Checks.**

- On Spec K every continuous function is constant, and constants in ℚ·v(K×) approximate it; the d=0 measure has mass 1.
- A degree-d line bundle on a good-reduction curve retains mass d under uniform semipositive limits.
- The potentials n⁻¹sin(n²t) have interior second derivative −n³sin(n²t), so their Laplacian variation is unbounded; the signed analogue without positivity or variation control is excluded.

### 6.5 Hsia kernels and positive energy

Define *Hsia potentials and energy*. On the Berkovich line over ℂ_p set δ∞(x,y)=diam(x∨y), and use its projectively normalized spherical kernel when infinity is included. A signed measure has continuous potential if its potential relative to a fixed Gauss base measure is continuous. For equal-mass measures ν₁,ν₂ of continuous potential, put ρ=ν₁−ν₂ and E(ρ)=−∬log δ∞(x,y)dρ(x)dρ(y); normalization terms cancel because ρ has mass zero. Then E(ρ)≥0 with equality iff ρ=0. The Hsia diagonal of a nonclassical point is retained. Classical self-atoms require a separately renormalized energy, for which this positivity claim is not made.

Finite signed Radon measures with the stated continuous-potential/integrability conditions. Source supports ℂ_p; arbitrary complete algebraically closed fields need a separate proof.

Provide the following interface:

- δ∞(x,y) is the join diameter, with finite positive self-diameter at a hyperbolic point.
- A continuous-potential mass-zero measure gives a potential modulo constants.
- The kernel potential has ddc equal to the specified measure difference.
- Self-energy is the squared-slope integral, hence positive definite on mass-zero continuous-potential measures.
- Polarization defines a symmetric bilinear energy pairing; cross-pairings can be negative.

**Checks.**

- For distinct hyperbolic x,y, E(δ_x−δ_y)=d(x,y)>0.
- The cross-pairing of ρ and −ρ is −E(ρ), so arbitrary cross-energy is not nonnegative.
- At ζ(0,r), δ∞(x,x)=r>0; deleting every diagonal would lose finite self-energy.
- A classical Dirac mass has a logarithmic singularity and is outside the continuous-potential positivity hypothesis.

For the construction, construct finite-tree potentials and use the graph energy identity; exhaust the hyperbolic tree and identify E with the integral of squared directional potential slope. Zero energy makes the potential constant, hence the measure zero. Verify kernel Laplacian ddc logδ∞(·,y)=δ_y−δ_∞.

*Needs:* [1.3 Paths, tangent directions and hyperbolic metric](#13-paths-tangent-directions-and-hyperbolic-metric); [3.3 Graph Laplacians and potentials](#33-graph-laplacians-and-potentials).

[Charles Favre and Juan Rivera-Letelier, Équidistribution quantitative des points de petite hauteur sur la droite projective](https://arxiv.org/pdf/math/0407471v2), §§4.1–4.5, equation (20), Lemmas 4.3–4.4 and Proposition 4.5, pp. 23–27. Kernel, continuous potentials, integrability and positive self-energy. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://arxiv.org/pdf/1901.09945v2), §2.7, pp. 11–12. Use the self-energy of a difference for the local pairing. [Laura DeMarco, Holly Krieger and Hexi Ye, Uniform Manin–Mumford for a family of genus 2 curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf), §2.7, printed p. 961. The local pairing uses self-energy of the difference; use self-energy positivity rather than arbitrary cross-energy positivity.

Prove self-energy positivity first in the ℂ_p continuous-potential range of Favre–Rivera-Letelier §4, pp. 22–27. Prove the *general-field continuous-potential energy theorem*: for every complete algebraically closed nontrivially valued rank-one field, the Radon Hsia kernel and its continuous-potential class give a symmetric bilinear mass-zero pairing, equal to the squared-slope integral on the diagonal, nonnegative there and zero only on the zero measure. Establish the necessary measure and approximation results over that field instead of transporting a metrizability hypothesis silently. In either range positivity concerns E(ρ,ρ), with equality exactly for ρ=0; it does not concern arbitrary cross-energy.

**Check.** For distinct nonclassical points x,y, the measure ρ=δ_x−δ_y has E(ρ,ρ)=d(x,y)>0 and E(ρ,−ρ)=−d(x,y)<0. Keep the nonclassical self-diagonal terms. For equal-mass ν₁,ν₂ apply positivity to their difference, so equality means ν₁=ν₂. This is the self-energy formulation required by the local pairing, in place of the cross-energy assertion in DKY §2.7, Annals p. 961 / arXiv v2 p. 12.

### 6.6 Admissible Green functions and measures

Construct *graph Green functions and the admissible measure*. For a polarized compact metric graph (Γ,g(v)) of genus g>0, let μ be a Radon probability measure. Its normalized Green kernel satisfies Δ_y g_μ(x,y)=δ_x−μ, ∫g_μ(x,y)dμ(y)=0 and symmetry. There is a unique admissible probability μ_a characterized by g_μ(KΓ,x)+g_μ(x,x) being constant. Explicitly μ_a=(1/g)(Σ_vg(v)δ_v+Σ_e ds/(ℓ_e+r_e)), where r_e is the effective resistance between its endpoints in Γ with the edge interior deleted; r_e=∞ for a bridge and r_e=0 for a loop.

Positive polarized genus; KΓ=Σ(2g(v)−2+val(v))v; use real electrical resistance and natural-log lengths.

Provide the following interface:

- The unique mean-zero Green kernel solves Δg=δ−μ.
- g_μ(x,y)=g_μ(y,x).
- The admissible measure is the unique probability satisfying the canonical-divisor diagonal condition.
- Vertex atoms and edge densities are exactly the displayed formula.
- Subdividing an edge preserves the measure and kernel under the canonical isometry.

**Checks.**

- For good reduction of genus g>0, the point graph has μ_a=δ_v.
- A genus-one circle of length L has μ_a=ds/L.
- A bridge has zero edge density, even though its length can be positive.
- For genus zero the 1/g formula is undefined and no assertion is made.

First prove the *Radon Poisson theorem*: every finite signed Radon measure ν of mass zero on a connected compact metric graph has a continuous potential in §3.3’s weak bounded-variation domain, unique modulo constants, with Δf=ν. Fix z and solve the finite resistor network with breakpoints x,y,z to obtain the continuous voltage kernel j_z(x,y), characterized by Δₓj_z(x,y)=δ_y−δ_z and j_z(z,y)=0. Integration f(x)=∫j_z(x,y)dν(y) gives the potential; uniform Lipschitz bounds on the compact graph justify distributional differentiation and finite variation. Integration by parts proves uniqueness. Subtract the two μ-means of j_z and add its double μ-mean to obtain the symmetric, μ-mean-zero Green kernel. The edge-quadratic calculation applies to the special admissible density. Compute the diagonal derivative/effective-resistance contribution on each edge; the numerator has edge mass b₁ and vertex mass Σg(v); dividing by g=b₁+Σg(v) gives total mass one. The unit-edge Yuan formula supplies the discrete-model normalization; the arbitrary-real-length network proof below establishes the displayed formula.

*Needs:* [3.3 Graph Laplacians and potentials](#33-graph-laplacians-and-potentials); [3.1 Metric graphs with loops and vertex genus](#31-metric-graphs-with-loops-and-vertex-genus).

[Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, Green-kernel characterization and Proposition A.5, pp. 115–118. Normalized Green function, admissible measure and unit-edge resistance formula; the network construction below handles arbitrary real lengths.

For arbitrary positive real edge lengths, solve the finite electrical-network equations with edge conductance 1/ℓ_e and prove Kirchhoff's identities for the effective resistances. Derive the displayed admissible probability measure, treating deleted bridges by r_e=∞ and deleted loops by r_e=0, and verify mass one by the network identities. Construct the Green kernel as the inverse of Δ on mass-zero measures, then impose its μ_a-mean-zero normalization and prove symmetry. Yuan Appendix A.5, pp. 115–118 is the unit-edge reference; the arbitrary-length network derivation is part of this target. To extend the curvature identity from model PL potentials to edgewise C² potentials, approximate the derivative as well as the function, prove weak convergence of the Laplacians with bounded total variation, and retain the vertex derivative atoms. These estimates are also required in the model approximation target.

**Checks.**

- On [0,L], j₀(s,L)=s has Δj₀=δ_L−δ₀ and j₀(0,L)=0.
- On a one-point graph the only mass-zero signed measure is zero; all potentials are constant and the normalized kernel is zero. A measure of mass one cannot be Δf because Δf has mass zero.
- For the Cantor probability μ_C on [0,1] and x=1, f(t)=∫₀ᵗ C(u)du satisfies Δf=δ₁−μ_C. Subtracting its μ_C-mean gives g_μC(1,t). Its singular-continuous second derivative excludes every finite-piece C² density-plus-finitely-many-atoms model, while the weak domain includes it.

### 6.7 Model potentials and Laplacian approximation

Prove *model PL approximation*. On a finite rational-length polarized reduction graph of a split semistable proper curve over a complete discretely valued field, each continuous edgewise C² function F admits PL approximants F_n with rational breakpoints, uniformly converging to F, whose Laplacian measures converge weakly to ΔF with uniformly bounded total variation. The potentials may be chosen with rational values, so after multiplying by a positive integer and passing to a finite valued extension their vertex data come from vertical divisors on regular semistable models. Thus their normalized metrics are rational model metrics. The signed BV-potential continuity theorem below, rather than semipositive convergence applied directly to these signed metrics, passes the curvature–Laplacian identity to F.

Fix the unit-edge valuation normalization before approximation; use a finite graph and functions C² up to the endpoints of every chosen edge. Refinement allows all rational breakpoints as divisorial points. Constants can be approximated independently and do not affect Δ.

For the proof, interpolate at finer rational partitions, approximating values sufficiently closely relative to the square of the mesh size. On each edge the derivative slopes converge to the derivative of F away from partition points, and their variation is controlled by the integral of |F″| plus the vanishing interpolation error. Vertex outgoing slopes converge as well. Integration by parts gives weak convergence of the interior and vertex measures. Clear rational denominators in the values and subdivide after finite extension to realize the vertical model divisor. Yuan sketches density but does not supply this derivative/variation control; prove it as part of the arbitrary-length Green and approximation construction.

*Needs:* [3.3 Graph Laplacians and potentials](#33-graph-laplacians-and-potentials); [6.1 Formal and model metrics](#61-formal-and-model-metrics); [6.2 Chambert–Loir model measures](#62-chambertloir-model-measures); [2.13 Refinement and valued extension](#213-refinement-and-valued-extension).

[Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, Proposition A.4 and proof, p. 117. Uses rational subdivisions realized by finite extensions and model-function approximation. The stronger convergence contract states the control needed to justify the measure passage.

**Check.** For an affine F on one edge, the interior Laplacian vanishes and only the outgoing endpoint atoms remain. Uniform convergence alone fails: n⁻¹sin(n²t) tends uniformly to zero while its Laplacian total variation diverges. Subdivision adds no atom at a point where the two incident affine slopes agree.

Prove *rank-one model-potential approximation*: for a split semistable proper curve over any complete nontrivially valued rank-one K and F continuous and C² up to the ends of each edge piece, there are rational model functions F_n converging uniformly on its compact skeleton, with edge slopes converging to F′ off their breaks, one-sided endpoint slopes converging to those of F, and ΔF_n converging weakly to ΔF with uniformly bounded total variation. Subdivision points and values are chosen in the divisible hull of v(K×); finite valued extensions realize each finite set of them, and rational tensor powers clear slope denominators. Keep the original real lengths; there is no common rational rescaling assumption.

Prove the *rank-one model curvature identity* for these rational model functions: the curvature of the trivial line with metric exp(−F_n∘τ) is −i_*ΔF_n. Compute vertical Cartier intersections on the geometric models of §6.1a and push them to the original analytic curve by §6.2; compare split component degrees with outgoing slopes. Descend from finite extensions using scalar-extension pushforward and the tensor-power normalization. For finite-variation weak potentials, first use smooth potentials converging uniformly, with weakly converging derivative measures, uniformly bounded variation and converging endpoint fluxes, before model approximation. Passing from these signed model curvatures to a continuous metric uses the following integrability and continuity targets.

For the approximation proof, use successively finer partitions in the divisible value group and vertex values there whose errors are o(h²), h the minimum mesh. A secant slope need not be rational. On each small interval replace it by two nearby rational slopes bracketing it, with one breakpoint chosen so that the endpoint values agree. The breakpoint is in the divisible value group because the endpoint difference and interval length are there and both slopes are rational. Choose the rational-slope errors so their sum tends to zero. Approximate any non-value-group breakpoints by subdivision points. Secant slopes converge on smooth pieces, and the extra rational-slope variation tends to zero. Total variation is bounded by the integrals of |F″| on the smooth pieces, the finite sum of derivative jumps at breaks and vertex fluxes, plus vanishing error. Include the converging vertex atoms. Formal subdivisions and vertical Cartier data realize these rational slopes after finite extension. This extends the model-function route of Yuan Proposition A.4, p. 117; the intersection inputs are §§6.1a–6.2 geometric intersections and rank-one descent, with their DVR comparison.

Prove the *positive graph-curvature criterion*. On a split semistable proper curve over complete nontrivially valued rank-one K, let Γ be its compact skeleton with retraction τ and inclusion i. Choose a positive-degree line bundle H with a rational model metric whose curvature is i_*μ₀, with μ₀ positive at every vertex of its semistable model; prove existence using a relatively ample model bundle. For every continuous G in §3.3's weak BV domain, if μ₀−ΔG is positive, the metric on H obtained by multiplying by exp(−G∘τ) is semipositive in §6.3's approximation sense, and its §6.4 curvature is i_*(μ₀−ΔG). Prove this by uniform rational model approximation preserving positivity. On edges outside the support of μ₀ the condition is convexity of G; approximate by convex rational-slope functions and preserve all vertex flux inequalities. Replacing G by (1−ε)G first gives a positive vertex margin εμ₀. Use it to accommodate the rational value and slope approximations; at inserted vertices convexity supplies the inequality. The model curvature identity identifies these inequalities with nonnegative component degrees. Section 6.4 applies to this semipositive approximation. This criterion and its approximation are targets here, using Chambert–Loir §§2.2–2.3 and Proposition 2.7, pp. 4–8, for the semipositivity and limit framework.

Prove *BV-potential integrability and signed continuity*. For every continuous F in that weak BV domain, the trivial line with metric exp(−F∘τ) is integrable in §6.3's sense and has §6.4 curvature −i_*ΔF. For functions F_n in the same domain, if F_n→F uniformly, ΔF_n→ΔF weakly and sup_n‖ΔF_n‖_TV<∞, these integrable curvatures converge weakly to −i_*ΔF. The same statement holds for nets with a uniform variation bound and weak convergence.

To prove integrability, put ν=−ΔF, write its Jordan decomposition ν=ν⁺−ν⁻, and let m=ν⁺(Γ)=ν⁻(Γ). Take a tensor power of the preceding H with degree d>m, fix z∈Γ, and set λ±=ν±+(d−m)δ_z. Both measures have mass d, and λ⁺−λ⁻=ν. The Radon Poisson theorem of §6.6 gives normalized potentials G± with −ΔG±=λ±−μ₀, where μ₀ is now the curvature measure of that tensor power. The positive graph-curvature criterion makes the two resulting metrics on the same fixed H semipositive. Their quotient is exp(−F∘τ), up to a constant metric fixed by evaluation at z. Subtract their §6.4 curvatures to obtain the signed identity, proving agreement with the existing integrable measure rather than defining a competing measure.

For a uniformly variation-bounded family F_n, choose this same H with d larger than all positive Jordan masses. On any subnet where the two padded positive measures converge weakly, the jointly continuous voltage kernel on compact Γ×Γ makes their normalized Poisson potentials converge separately uniformly. Apply §6.4 to the two semipositive metrics on the fixed H and subtract. Every resulting subnet limit is −i_*ΔF, proving signed continuity. This argument requires neither convergence of the Jordan parts along the original net nor semipositivity of the trivial-line metrics themselves.

*Needs:* §3.3 weak Laplacian and variation; §2.13 subdivision and valued extension; §§6.1–6.2 model metrics, geometric intersections and rank-one descent; §6.3 metric classes; §6.4 semipositive limits and decomposition independence; §6.6 Radon Poisson theorem and continuous voltage kernel. Within this section, prove model curvature, then positive graph-curvature approximation, then BV integrability and signed continuity. None uses §6.8.

**Checks.**

- Two loop lengths 1 and √2 remain unchanged: ℓ₂/ℓ₁=√2 rules out making both rational by rescaling.
- On [0,L], F(s)=s has ΔF=δ_L−δ₀ and every exact affine approximant has the same flux.
- For F(s)=s²/2, ΔF=−ds+Lδ_L has total variation 2L; controlled interpolation converges to both the density and endpoint atom without a discrete value group.
- On [0,1] with F(s)=s, ν=δ₀−δ₁. With d=2 and z=0, the padded positive measures are λ⁺=2δ₀ and λ⁻=δ₁+δ₀, each of mass 2; their difference is δ₀−δ₁. The trivial-line curvature is signed, although its two degree-two factors have positive curvature.
- For μ₀=δ₀+δ₁ on [0,1], G(s)=s gives μ₀−ΔG=2δ₀≥0, while G(s)=2s gives 3δ₀−δ₁ and fails the positive criterion. With G replaced by (1−ε)G in the first case, the curvature becomes (2−ε)δ₀+εδ₁, displaying the positive endpoint margin.
- For constant F, ν=0 and both padded measures equal dδ_z; their quotient changes only a constant norm and has curvature zero.
- For the tent of height 1/n supported on [c−1/n,c+1/n] in an edge interior, ΔF_n=−δ_(c−1/n)+2δ_c−δ_(c+1/n), ‖F_n‖∞=1/n and ‖ΔF_n‖_TV=4. The signed measures tend weakly to zero, but both Jordan parts tend to 2δ_c. Padding and separate Poisson potentials retain this cancellation.

### 6.8 Metric–Laplacian and admissible corrections

Prove *the model-metric Laplacian comparison*. On a split semistable curve, multiplying a model/integrable metric by exp(−F∘τ) changes its curvature by −i_*ΔF for PL or admissible piecewise C² F. For a regular DVR model with normalized v(π)=1, put c=log(|π|⁻¹). Yuan’s unit-coordinate potential f and metric factor e_K^(−f) correspond to natural-log coordinate s=c·t and F(s)=c·f(s/c). The pushforward of Δ_unit f is Δ_natural F, so the curvature measure has no extra c factor. For the model Arakelov metric on the dualizing bundle, c₁(ω,||·||_Ar)=i_*δ_KΓ. Write g_nat(s,t)=c·g_unit(s/c,t/c) and a_nat=c·a_unit, with a=−g_μ(KΓ,x)−g_μ(x,x), independent of x. Its admissible correction in natural-log coordinates is exp(−a_nat−g_nat(KΓ,τ(x)))=exp(g_nat(τ(x),τ(x))); equivalently, in unit coordinates it is e_K^(−a_unit−g_unit(KΓ,τ(x)))=e_K^(g_unit(τ(x),τ(x))), and c₁(ω,||·||_a)=(2g−2)i_*μ_a.

Split semistable proper curve of positive genus; the dualizing metric statement uses Yuan’s model/Arakelov metric and normalized Green conventions. Approximation must control Laplacians as well as potentials. The unit-edge formula uses a regular semistable DVR model with local equation uv=π. Thickness n is represented by an edge of length n or by n unit subdivisions.

For the proof, for model PL functions identify vertical-divisor intersections with outgoing slopes. Apply §6.7’s model curvature identity, positive graph-curvature criterion and BV-potential integrability and signed continuity, with weak Laplacian convergence and controlled total variation; the DVR statement is only their discrete calibration. Under s=c·t and F=c·f the slopes are unchanged, including the vertex atoms and the interior Laplacian measure. The model dualizing degree on each component is 2g_v−2+val(v). Subtract the Green Laplacian δ_KΓ−(2g−2)μ_a to obtain the corrected curvature. Local heights rescale with log absolute values, while these curvature measures keep their total mass.

*Needs:* [6.1 Formal and model metrics](#61-formal-and-model-metrics); [6.6 Admissible Green functions and measures](#66-admissible-green-functions-and-measures); [6.4 Limits and local intersection heights](#64-limits-and-local-intersection-heights); [6.7 Model potentials and Laplacian approximation](#67-model-potentials-and-laplacian-approximation), specifically its arbitrary-rank-one model curvature, positivity-preserving approximation, BV integrability and signed continuity theorems.

[Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Appendix A.5, displayed admissible metric formula, p. 116; Propositions A.4–A.5 and proofs, pp. 117–118. Metric correction and normalized curvature/Laplacian formula; the original graph edges have length one.

**Check.** For F(t)=t on an interval, curvature change is δ₀−δ_L. Changing the absolute-value normalization rescales both edge length and log metric, not just one. Uniform PL density by itself is insufficient to claim Laplacian convergence. For s=c·t and F(s)=c·f(s/c), ΔF is the coordinate pushforward of Δf. Multiplying the measure by c again would give an incorrect dualizing total mass.

**Check.** On a loop of length L with one vertex v of genus one, total genus is 2, KΓ=2v and μ_a=(δ_v+ds/L)/2. The Green correction has Δg_nat(KΓ,·)=δ_v−ds/L; curvature changes from 2δ_v to δ_v+ds/L=2μ_a. For c=2 and L=2, the correction’s midpoint/vertex metric ratio is exp(L/8)=exp(1/4); using e_K on the natural-log kernel would give exp(1/2), an extra rescaling.

### Examples

A polarized tree with two genus-one vertices has μ_a=(δ_v+δ_w)/2 and no bridge density. For three parallel unit edges and genus-zero vertices, each deleted-edge resistance is 1/2; each density is 1/3 and the total mass is one. On an abstract polarized genus-one circle of length L, μ_a=ds/L and the mean-zero Green function at the origin is s²/(2L)−s/2+L/12. Its Laplacian is δ₀−ds/L (Yuan Appendix A.5, pp. 115–118). The analytic Tate application uses the complete-field quotient comparison in Layer 7.

### Dependencies

Layers 0–3 for analytic spaces, graph Laplacians and skeleta; AdicSpacesPartIII §§R2.2–R2.3 for formal models; SchemeAndStackFoundations §§5.2–5.3 for cycle intersections; §6.1a geometric intersection specialization and projection, with §6.2 rank-one descent for the residue-field intersections and the stated rank-one model extension. The line, potential, measure and hybrid comparisons supply the downstream dynamical applications; none is a prerequisite of this layer.

## Layer 7: Uniformization and integration interfaces

Import the algebraic Tate curve, local Coleman primitives and the abelian logarithm. Build the analytic quotients and Schottky–Mumford comparison, compare Jacobian periods with graph lengths, and then state the branch-sensitive path integral and its valuation-linear correction to abelian integration.

### 7.0 Raynaud uniformization over rank-one fields

For this section, split semistable reduction means that A admits a smooth separated group model over K° whose connected special fiber is an extension of an abelian variety by a split torus. Good reduction means that A extends to an abelian scheme over K°. Compare the construction for different such models through their formal identity neighborhoods.

Prove *rank-one Raynaud uniformization*. For an abelian variety A with split semistable reduction over any complete nontrivially valued rank-one K, construct the analytic cross 0→M′→Eᵃⁿ→Aᵃⁿ→0 and 0→T→E→B→0, with B of good reduction, the full discrete period lattice M′ and the analytic quotient. Here E is the algebraic semiabelian extension, and its good-reduction formal subgroup defines a distinguished analytic domain E₀. Prove compatibility with isometric extension and descent (Baker–Rabinoff §4.1, pp. 8–9; KRZB uniform §3.4.1, pp. 21–22).

Prove *rank-one Raynaud valuation*: for N the cocharacter lattice of T, construct trop:Eᵃⁿ→N_ℝ extending v on torus coordinates; on valued points its kernel is E₀ and trop(M′) is a full lattice. Prove *rank-one Raynaud polarization*: a principal polarization induces the multiplicative period pairing and its real valuation pairing, compatibly with extension and descent. For Jacobians, its identification with the edge-length pairing is §7.5, rather than an assumption of this construction (Baker–Rabinoff §4.2, p. 9, for tropicalization and the full lattice; §4.3, pp. 9–10, for duality; §6, pp. 14–16, for the Jacobian pairing).

Use NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and §§4.3–4.4 for the complete-DVR specialization. Establish the rank-one formal extension, algebraization and lattice descent on the same semiabelian objects; no discreteness of v(K×) is assumed.

**Checks.**

- For E_q, E=G_m, M′=q^ℤ and trop(q)=−log|q|=L>0; the real quotient is ℝ/Lℤ. The logarithmic value Log(q) is a different scalar and need not be nonzero.
- For a positive-dimensional good-reduction abelian variety, T=0, N=0 and M′=0, while B=A retains its dimension; the kernel domain is all of Aᵃⁿ.
- For a product of Tate curves with lengths 1 and √2, the real period lattice has diagonal pairing diag(1,√2). It is discrete and full even though no common rescaling makes both lengths integral.

*Needs:* AdicSpacesPartIII §§R2.2–R2.3 for formal models and generic fibers, §§R3.1–R3.3 for analytic coherent geometry; the rank-one formal algebraization in this target uses KRZB uniform §3.4.1’s Raynaud theorem; NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and §§4.3–4.4 for the DVR comparison; §0.21 analytic spaces; §0.18 scalar extension.

### 7.1 Tate analytic quotient and skeletal circle

Extend *the Tate analytic quotient to general complete fields*. For complete nonarchimedean K and 0<|q|<1, descend ClassicalAdicEtaleCohomology §3.7’s algebraically closed analytic quotient and its identification with the Tate curve, using the K-defined q-parametrization of EllipticCurves Layer 4. The Gauss-line skeleton descends to ℝ/Lℤ with L=−log|q|, and its retraction is −log|z| mod L. The invariant differential pulls back to dz/z. Isometric scalar extension commutes with quotient, skeleton and differential.

This is the split Tate case over general K; the added conclusion is compatibility of the descended quotient, metric and differential with the specified absolute value.

Provide the following interface:

- The analytic group quotient has kernel q^ℤ and universal descent for invariant analytic maps.
- The quotient identifies with the imported Tate elliptic analytification.
- Its skeleton is ℝ/Lℤ and τ([z])=−log|z| mod L.
- The invariant form pulls back to dz/z.
- The quotient and circle commute with isometric complete valued extension.

**Checks.**

- Replacing z by qz changes its real coordinate by L and leaves its skeletal class unchanged.
- The circumference is −log|q|, so changing q to qⁿ for an integer n≥1 scales it by n.
- The condition |q|<1 is essential; a parameter q with |q|=1, equivalently a unit of K°, does not supply this contracting annular quotient; q=p is a field unit of ℚ_p and is a valid parameter, while q=0 is excluded.

For the extension, form the q-equivariant annular charts over K and compare their completed algebraically closed base changes with ClassicalAdicEtaleCohomology §3.7. Descend the supplied quotient identification through the K-defined Tate parametrization and faithful affinoid scalar extension. The annular metric of §1.5 identifies its descended Gauss-line quotient with the specified circle; compare the invariant differential in the same charts.

*Needs:* §1.5; §0.18; §0.21; EllipticCurves Layer 4; ClassicalAdicEtaleCohomology §3.7 (`AnalyticTateQuotient`).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Theorem II.3.18 and Example II.3.19, pp. 49–50. Rank-one Schottky quotient is the Tate analytic curve. [Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), Tate example, pp. 17–18. The metric circle and local canonical measure normalization.

### 7.2 Good-reduction and Tate calibration

Prove *good-reduction and Tate measures*. For a good-reduction proper curve with a semipositive model line bundle of degree d, its model measure is dδ_ζ at the unique component point. For the Tate elliptic curve E_q with L=−log|q| and canonical degree-one line bundle O(0), the canonical measure is normalized length ds/L on the skeletal circle. The periodic potential g(s)=s²/(2L)−s/2+L/12 on 0≤s≤L has mean zero and ddc g=ds/L−δ₀; choose a reference O(0) metric whose curvature is δ₀ at the skeletal origin. Multiplication by exp(−g) then produces the canonical curvature. The constant L/12 normalizes the graph potential to mean zero; identifying the resulting metric with a chosen canonical metric additionally requires its rigidification.

Split good reduction or split Tate reduction; 0<|q|<1. The reference metric has curvature δ₀. Mean-zero normalization fixes g, while a fixed rigidification fixes the canonical line-bundle metric up to its otherwise undetermined constant.

For the proof, the good-reduction model has one component, so the atomic formula gives dδ_ζ. On the circle compute g″=1/L, derivative jump −1 at 0 and integral zero. Add ddc g to the reference curvature δ₀ to get ds/L. Curvature determines the metric only up to a constant; compare rigidifications separately.

*Needs:* [6.2 Chambert–Loir model measures](#62-chambertloir-model-measures); [6.8 Metric–Laplacian and admissible corrections](#68-metriclaplacian-and-admissible-corrections); [7.1 Tate analytic quotient and skeletal circle](#71-tate-analytic-quotient-and-skeletal-circle).

[Antoine Chambert-Loir, Mesures et équidistribution sur les espaces de Berkovich](https://arxiv.org/pdf/math/0304023v3), §2.4 and Tate example, pp. 5–6 and 17–18. Atomic good-reduction measure and the Tate circle local metric. [Xinyi Yuan, Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Proposition A.5, pp. 117–118. The genus-one circle is the admissible measure calibration.

**Check.** The Tate canonical measure is not a Dirac mass at one chosen vertex. Its total mass is one; for degree d it scales to d.

### 7.3 Schottky groups and fundamental domains

Define *Schottky data*. A Schottky subgroup Γ⊂PGL₂(K) is free and finitely generated, every nonidentity element is loxodromic, and some nonempty Γ-invariant connected open subset of P¹ᵃⁿ carries a free proper Γ-action. Such a subgroup is discrete. The equivalent marked presentation consists of a free generating tuple γ₁,…,γ_g with pairwise disjoint paired closed discs `D⁺(γ_i^{±1})` such that `γ_i^{±1}(P¹ᵃⁿ\D⁺(γ_i^{∓1}))` is the maximal open disc inside `D⁺(γ_i^{±1}).` Nonidentity elements are loxodromic. Their limit set Λ is the set of accumulation points of distinct group translates, and Ω=P¹ᵃⁿ\Λ. A loxodromic matrix has unequal eigenvalue norms, equivalently |det|<|tr|², and is conjugate to z↦βz with 0<|β|<1.

Complete nonarchimedean K; marked paired-disc data includes the maximal-open-disc condition. The unmarked equivalence uses the Schottky figure theorem rather than assuming every free subgroup has such a figure.

Provide the following interface:

- Unequal eigenvalue norms are equivalent to |det|<|tr|².
- Attracting and repelling K-rational points and 0<|β|<1 determine a loxodromic transformation.
- A paired-disc figure yields the marked free Schottky group.
- Λ is the closed accumulation set; Ω is its invariant open complement.
- The underlying group/quotient does not depend on the chosen free basis or fundamental figure.

**Checks.**

- diag(q,1) with 0<|q|<1 has limit set {0,∞}.
- A matrix with |det|=|tr|² is not certified loxodromic by the strict criterion.
- Over ℚ_p the translation z↦z+1 generates a free cyclic subgroup, but is unipotent and not loxodromic. Freeness alone does not give a Schottky group.

For the construction, construct the nested discs indexed by reduced words. Ping-pong gives freeness; contraction gives loxodromic elements and K-rational limit points. The trace/determinant calculation supplies the explicit loxodromic test.

*Needs:* [1.1 Gauss points, discs and projective line](#11-gauss-points-discs-and-projective-line); [1.3 Paths, tangent directions and hyperbolic metric](#13-paths-tangent-directions-and-hyperbolic-metric).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Definitions II.1.9/II.1.11, Lemma II.1.10, p. 38; Definition II.3.1 and Lemma II.3.6, pp. 45–46; Definition II.3.21 and Remark II.3.22, p. 51; Proposition II.3.24 and Theorem II.3.26, p. 52. Koebe coordinates, loxodromic criterion, group hypotheses, discreteness and the equivalence with paired-disc figures.

Prove the Schottky figure theorem, obtaining genuinely paired maximal open discs and their contraction property from the unmarked group hypotheses. For the converse uniformization, exhaust the universal covering tree by bounded subtrees and realize their inverse images as open Swiss cheeses. Normalize three directions to 0, 1 and ∞. Bound the differences of successive analytic coordinates on each smaller domain, obtain a compatible uniform limit, and prove that its restriction has degree one by a Gauss-point fiber calculation. The limit embeds the universal cover in the projective line with rational compact complement. Deck transformations then extend to projective transformations; properness identifies the quotient with the original curve. Poineau–Turchetti §II.3, pp. 43–55 and Theorem II.4.3 with Lemmas II.4.4–II.4.6, pp. 57–61 give these constructions. The converse keeps the split Mumford condition over K; potential splitting only produces the corresponding statement after extension.

### 7.4 Schottky–Mumford uniformization

Prove *Mumford uniformization*. For a rank-g Schottky group Γ, Ω→Γ\Ω is a free properly discontinuous analytic quotient, the quotient is a smooth proper split Mumford curve of genus g, and, for g≥1, its skeleton is Γ\Hull(Λ) (with the limit endpoints removed before quotient). Conversely a split analytic Mumford curve is so uniformized. A split Mumford curve means locally a K-Swiss-cheese domain, equivalently a split semistable model whose normalized special components are P¹_κ and nodes are κ-rational. Potential total degeneration over a finite extension does not imply this split condition over K; descend with its Galois cocycle and graph action.

Complete nontrivially valued K. For the converse use the split Mumford hypothesis. Genus zero gives P¹ and the trivial group; its limit set and hull are empty, so the hull formula is not a point skeleton. A one-point semistable skeleton of P¹ requires a chosen type-II point. Genus one gives the Tate quotient and its circle.

For the proof, reduced-word discs give a compact fundamental region, a free proper action and the hull skeleton; the genus formula gives genus g. For the converse, take the topological universal cover and exhaust its genus-zero tree by finite Swiss-cheese neighborhoods. Construct an embedding into P¹ by the normalized coordinate approximation specified above. Deck transformations extend to PGL₂(K), giving the Schottky group.

*Needs:* [7.3 Schottky groups and fundamental domains](#73-schottky-groups-and-fundamental-domains); [2.11 Formal models and metric dual graphs](#211-formal-models-and-metric-dual-graphs); [2.12 Vertex genera and analytic genus](#212-vertex-genera-and-analytic-genus); [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms).

[Jérôme Poineau and Daniele Turchetti, Berkovich curves and Schottky uniformization](https://arxiv.org/pdf/2010.09043v1), Proposition II.2.26 and Remark II.2.28, pp. 44–45; Theorem II.3.18, pp. 49–50; Theorem II.4.3 and Remark II.4.7, pp. 57–61. Split Mumford condition, direct quotient theorem and converse; arbitrary genus-zero nonproper curves need not embed in P¹.

**Check.** For g≥1 the quotient hull has b₁=g with all vertex genera zero. For the trivial group Λ=∅ and Hull(Λ)=∅, whereas any chosen one-point semistable skeleton of P¹ is nonempty. A potentially split curve is kept with descent data, rather than declared a K-Schottky quotient without proof.

### 7.5 Analytic Jacobian periods

Prove *analytic Jacobian periods*. For smooth proper X with split semistable model and Jacobian J, import its Raynaud analytic uniformization 0→M′→Eᵃⁿ→Jᵃⁿ→0, with 0→T→E→B→0 and B of good reduction. The valuation map trop:Eᵃⁿ→N_ℝ has ker on points the good-reduction domain, and trop(M′) is a full real lattice. For a split Mumford curve B=0, T has rank g, and Jᵃⁿ=Tᵃⁿ/M′. Under M′≅H₁(Σ,ℤ), the valuation of the multiplicative period pairing equals the edge-length pairing; hence Sk(J)≅Jac(Σ) as principally polarized real tori. The analytic Abel–Jacobi map retracts to the tropical Abel–Jacobi map.

Complete nonarchimedean K with split semistable model; choose X(K) basepoint when using the point Abel–Jacobi map. The arbitrary-rank-one Raynaud cross requires §7.0 rank-one Raynaud uniformization and §7.0 rank-one Raynaud valuation, beyond NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 over complete DVRs; include descent from algebraically closed fields to the stated split semistable base. NeronModelsAndSemistableAbelianVarieties §§4.3–4.4 supplies the DVR graph monodromy formula, and §7.5 adds arbitrary-real-length skeleta and the analytic Abel–Jacobi square.

For the proof, use the supplied uniformization and the specialization map on Pic⁰ induced by the slope formula. Compare the two Abel–Jacobi maps on divisors and integral cycles; the induced H₁ isomorphism identifies valuation periods with length integration. This identifies the principal polarizations, not merely the dimensions of the real tori.

*Needs:* [3.4 Metric Jacobian and Abel–Jacobi map](#34-metric-jacobian-and-abeljacobi-map); [3.7 Slope formula for rational functions](#37-slope-formula-for-rational-functions); [7.4 Schottky–Mumford uniformization](#74-schottkymumford-uniformization); NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and §§4.3–4.4; §7.0 rank-one Raynaud uniformization, valuation and polarization.

[Matthew Baker and Joseph Rabinoff, The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves](https://arxiv.org/pdf/1308.3864v1), §2.7, Theorem 2.9, p. 5; Corollary 6.6 and Remark 6.7, p. 16. Arbitrary rank-one period lattice and equality of analytic monodromy and edge pairings. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694v3), §3.4.1, pp. 21–22. The general Raynaud cross and valuation lattice needed for integration.

**Check.** For a Tate curve the single multiplicative period is q and its valuation is L. Good reduction gives toric rank zero, even when dim J>0. The Cp-valued logarithmic periods need not form a discrete lattice; only their real valuation periods do.

Use the full analytic Raynaud cross from §7.0, importing its existing formal and analytic DVR cases and the §§4.3–4.4 DVR graph pairing. Prove the compatibility of analytic and tropical Abel–Jacobi maps using specialization of degree-zero divisor classes, after valued base extension when a rational base point is needed. Identify the homology map of the analytic Abel–Jacobi morphism with the map of uniformizing lattices induced by the principal polarization. Applying H₁ to the compatible Abel–Jacobi square then identifies the valuation period pairing with the edge-length pairing. Baker–Rabinoff Proposition 4.7, pp. 10–11, Proposition 6.1 and the proof of Theorem 2.9, pp. 14–16, followed by Corollary 6.6 and Remark 6.7, p. 16, give this argument. Section 7.0 constructs analytic uniformization, its polarization and base-change compatibility; the edge-pairing identification is proved here. The point parametrization of a Tate curve calibrates the normalization but cannot replace this general argument.

### 7.6 Berkovich–Coleman path integration

Construct *the Berkovich–Coleman path integral*. Fix a branch Log:ℂ_p×→ℂ_p extending the unit logarithm. For a separated smooth ℂ_p-analytic curve, and for the smooth analytic group covers used in the comparison, associate to a closed analytic 1-form and a continuous path with classical endpoints its Berkovich–Coleman integral. It is ℂ_p-linear in the form, invariant under endpoint-fixed homotopy, additive under path concatenation, functorial under analytic pullback, equals F(Q)−F(P) for exact dF, and satisfies ∫_P^Q dz/z=Log Q−Log P on G_m. Restriction to the good-reduction Coleman domains agrees with their Frobenius-normalized primitives.

Characteristic zero and ℂ_p; fixed branch; analytic closed forms and endpoint-fixed homotopy. No global endpoint-only primitive is asserted when the skeleton has cycles.

Provide the following interface:

- The value depends on the closed form and endpoint-fixed path homotopy class.
- Concatenation adds integrals; reversal negates them; constant paths integrate to zero.
- For dF the integral is F(Q)−F(P).
- Integrating f*ω along γ equals integrating ω along f∘γ.
- On G_m, dz/z integrates to the chosen logarithm difference.
- On the imported good-reduction domains it agrees with their Coleman primitive differences.

**Checks.**

- The zero form and constant path give zero.
- For TⁿdT with n≠−1, the integral is (Q^(n+1)−P^(n+1))/(n+1).
- On G_m, dT/T uses Log, not a globally analytic primitive in O(G_m).
- A Tate loop can have BC period Log(q); path independence on all of E_q is false.

For the construction, glue local primitives/logarithmic annular primitives along a triangulation, retaining the path and continuation constants. On good-reduction pieces use the imported Coleman characterization. Independence and global existence require the Berkovich integration theorem beyond these local axioms; this is an explicit owned proof target, not inferred from formal antiderivatives.

*Needs:* [0.21 Analytic atlases and morphisms](#021-analytic-atlases-and-morphisms); [2.16 Locally finite triangulations and analytic nodes](#216-locally-finite-triangulations-and-analytic-nodes); ColemanIntegration §L1.20; ColemanIntegration §L0.22.

[Eric Katz, Joseph Rabinoff and David Zureick-Brown, Diophantine and tropical geometry, and uniformity of rational points on curves](https://arxiv.org/pdf/1606.09618v2), Definition 4.2.2 and surrounding discussion, pp. 28–30. Path integral axioms and logarithm normalization; cites the deeper Berkovich existence theorem. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694v3), §3.1–3.3 and §3.4.2, pp. 15–23. The path integral on smooth spaces and simply connected analytic group covers needed in Proposition 3.16.

Construct the global continuation of local analytic and logarithmic primitives, with locally constant differences, before defining integration along a path. Pull the primitive sheaf back to [0,1]; its additive constant torsor is trivial there, so the difference of endpoint values is independent of the chosen lift. Pull back to a homotopy square to obtain endpoint-fixed homotopy invariance, and use subdivision for concatenation. Berkovich, Integration of one-forms on p-adic analytic spaces, Theorems 1.6.1–1.6.2, pp. 22–23 and Theorem 9.1.1, pp. 136–138 gives this construction; over ℂ_p the additional descent condition in that theorem is automatic. The primitive-sheaf existence theorem is an owned proof input, not supplied by the local Coleman primitives. KRZB §4.2, pp. 28–31 supplies the path-integral characterization used for comparison.

### 7.7 Annular integration and residue monodromy

Prove *annular residues and periods*. For an open annulus with coordinate t and ω=(Σa_ntⁿ)dt, import res(ω)=a₋₁ and its logarithmic primitive. The BC integral is a₋₁(Log t(Q)−Log t(P))+Σ(n≠−1)a_n(t(Q)^(n+1)−t(P)^(n+1))/(n+1). Reversing annular orientation negates the residue; a branch change Log′−Log=c·v_p changes the value by c·res(ω)(v_p(t(Q))−v_p(t(P))). Residues of a regular differential around a semistable vertex sum to zero, defining a harmonic graph cochain. Cycle continuation of local primitives records BC periods and is distinct from the real monodromy length pairing.

Open annuli over ℂ_p; compatible Laurent convergence on every compact subannulus. For the vertex residue identity use regular differentials on a semistable proper curve.

For the proof, apply the imported annulus primitive and residue invariance. Laurent substitution proves the branch-change expression. Choose a basic wide-open neighborhood of each semistable vertex. ColemanIntegrationPartII §3.1 makes the sum of the analytic Laurent residues at these ends zero; these are the outgoing oriented residues. Čech continuation constants along graph cycles give periods. Construct the oriented skeletal adapter and continuation comparison from this imported residue theorem as described below.

*Needs:* [7.6 Berkovich–Coleman path integration](#76-berkovichcoleman-path-integration); [3.1 Metric graphs with loops and vertex genus](#31-metric-graphs-with-loops-and-vertex-genus); ColemanIntegration §L0.11; ColemanIntegration §L0.22; ColemanIntegration §L0.23; ColemanIntegrationPartII §3.1.

[Eric Katz, Joseph Rabinoff and David Zureick-Brown, Diophantine and tropical geometry, and uniformity of rational points on curves](https://arxiv.org/pdf/1606.09618v2), §4.2 and §4.3, pp. 28–34. Distinguishes local logarithmic integrals, paths and analytic periods. [Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694v3), §3.1–3.4, pp. 15–23. Local antiderivatives and group-cover comparison; the analytic wide-open residue identity is imported from ColemanIntegrationPartII §3.1, while its skeletal harmonic-cochain and BC-period comparison is constructed here.

**Check.** A residue-zero differential has an analytic annular primitive; dT/T does not. A residue is a Cp scalar and an edge length is real: neither can replace the other in a period pairing.

For a global regular differential on a semistable proper curve, choose vertex wide-open neighborhoods whose ends are the incident oriented annuli. Apply ColemanIntegrationPartII §3.1’s characteristic-zero wide-open residue identity to get an exact sum of ℂ_p-valued residues equal to zero; count both ends of a loop. Reversing t to a/t changes the residue sign. This gives the harmonic cochain. Reduction of an integral differential can compare reduced residues, but cannot establish this ℂ_p identity by itself. Continue the local primitives around cycles to identify the BC period map; the comparison with the Raynaud valuation map is the global factorization target in [7.8 BC–abelian tropical correction](#78-bcabelian-tropical-correction).

[Robert Coleman, Reciprocity laws on curves](https://www.numdam.org/item/CM_1989__72_2_205_0.pdf), Proposition 4.3, printed p. 226, with the ℂ_p setting of §III, p. 213 and Theorem 4.2, pp. 224–226. The wide-open theorem supplies the exact residue identity in characteristic zero. [Ehud de Shalit, Coleman integration versus Schneider integration on semistable curves](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/deshalit.pdf), §0.3, equations (0.11)–(0.13), pp. 327–328 gives its oriented harmonic-cochain use on a semistable model.

**Check.** On an annulus p·dt/t has nonzero ℂ_p residue p, although its integral coefficient reduces to zero modulo the maximal ideal. Thus a zero reduced residue does not imply a zero analytic residue. For dt/t the two ends have residues +1 and −1, so a loop contributes two opposite terms to the vertex sum.

### 7.8 BC–abelian tropical correction

Prove *the BC–abelian tropical correction*. For an abelian variety A/ℂ_p with Raynaud cover E and torus cocharacter lattice N, let log_BC:E(ℂ_p)→Lie(A) be integration on its simply connected analytic cover and let log_Ab=log_A∘π be the imported analytic abelian logarithm. There is a unique ℚ-linear L:N_ℚ→Lie(A) with log_BC−log_Ab=L∘trop. For a path in A starting at 0 with lifted endpoint e, ∫_BC ω−∫_Ab ω=⟨L(trop e),ω⟩. For curve integrals compose with Abel–Jacobi. On an annulus the correction is a_ω(v_p(t(Q))−v_p(t(P))), linear in ω; for a type-II vertex v and an open star V with d≥1 ends, put U=τ⁻¹(V), a basic wide open, and let H be the subspace of global regular differentials on X whose BC and abelian integrals agree on U. Then codim H≤d−1. On a zero-dimensional skeleton the correction is zero and codim H=0.

For curve applications ω is a global regular differential on the smooth proper curve X/ℂ_p. Use v_p(p)=1 for N_ℚ and Cp scalar arithmetic; convert natural-log graph lengths by log p. The abelian logarithm on all Cp-points is the analytic extension, not just a union of finite-extension point sets.

For the proof, the two logarithms agree on the good-reduction domain A₀: the analytic group logarithm is uniquely characterized by its identity tangent map and agrees with local formal integration. Their difference therefore factors through E(Cp)/A₀(Cp)=N_ℚ. Restriction to the period lattice determines L since the real full lattice has ℚ-span N_ℚ. For d≥1, tropical Abel–Jacobi balancing bounds the span of a d-ended basic wide-open star by d−1 on global regular differentials; the annular restriction gives one linear coefficient. A point skeleton has no tropical directions and zero correction.

*Needs:* [7.5 Analytic Jacobian periods](#75-analytic-jacobian-periods); [7.6 Berkovich–Coleman path integration](#76-berkovichcoleman-path-integration); ColemanIntegrationPartII §4.0; EffectiveDiophantineMethods §4.3.

[Eric Katz, Joseph Rabinoff and David Zureick-Brown, Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/pdf/1504.00694v3), Proposition 3.16, formula (3.17), Corollary 3.18, pp. 22–23; Propositions 3.28–3.29, pp. 26–27. Factorization proof, good-reduction agreement and annular/star consequences.

**Check.** Good reduction has N=0, so BC and abelian integrals agree. For E_q and dz/z, ∫_Ab=Log(z_Q/z_P)−(Log q/v_p(q))(v_p(z_Q)−v_p(z_P)), independent of changing lifts by q-powers. On a valence-two annular star at most one linear condition makes the two integrals agree.

**Check.** For d≥1 the agreement subspace of global regular differentials on the basic wide open above a d-ended star is the kernel of the correction map to harmonic functions modulo constants, of dimension d−1. The conclusion is a codimension bound ≤d−1. For a good-reduction isolated vertex d=0 the correction space is zero, so codim H=0; applying d−1=−1 there would be false. For a zero map its kernel is the whole differential space, which rules out replacing this by a dimension bound. Use this kernel calculation for the last estimate in the proof of KRZB Proposition 3.28, arXiv:1504.00694 p. 26.

### Examples

For E_q and ω=dz/z, an analytic loop lifted from z to qz has BC period Log q. The endpoint abelian integral instead equals Log(z_Q/z_P)−(Log q/v_p(q))(v_p(z_Q)−v_p(z_P)); changing a lift by q cancels exactly. Good reduction has zero tropical period space, so the two integrals agree. A valence-two annular star imposes at most one linear agreement condition (KRZB Proposition 3.16 and Proposition 3.28, pp. 21–27).

### Dependencies

Layers 0–3 and the measure normalization of Layer 6; EllipticCurves Layer 4 for the algebraic Tate curve; NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 and §§4.3–4.4, with §7.0 for the full analytic cross and pairing; ColemanIntegration §§L0.11, L0.22, L0.23 and L1.20 for annular residues, logarithmic primitives and good-reduction integration; ColemanIntegrationPartII §§3.1 and 4.0 for wide-open residue cancellation and arbitrary-ℂ_p-coefficient abelian logarithms; AnabelianGeometryAndNonabelianChabauty §5.8 for the finite-model logarithm; EffectiveDiophantineMethods §4.3 for rational endpoint integrals. Schottky uniformization, the complete-field Tate comparison and global BC path integration are constructed here.

## Worked examples

### Product rings and the general Banach category

For ℝ×ℝ with its maximum norm, the two coordinate absolute values are distinct points. Its ambient norm is not multiplicative: (1,0) and (0,1) both have norm one and their product is zero. There are exactly four idempotents, corresponding to all subsets of the two-point spectrum. In contrast, a normed field has only its specified norm point, by applying domination to both a and a⁻¹. The spectrum of the zero ring is empty. These cases test the carrier before any curve geometry is introduced (Temkin §2.2.3, pp. 7–8; Scholze Theorems 2.14, 2.18, pp. 10–12).

The pushout ℂ⊗̂_ℝℂ has two complex factors, hence two spectral points mapping to the single pair in M(ℂ)× over M(ℝ)M(ℂ). The spectral pushout map is surjective; it is not generally injective. This is why the category uses the projective ℓ¹ seminorm and why the target theorem is a surjection (Scholze Propositions 2.4 and 3.2, pp. 8, 14–15).

### Annuli, thickness and curvature signs

On r<|T|<1, s=−log|T| runs through (0,−log r). For f=Tⁿ the tropical coordinate is ns and its expansion is |n|; adjoining T to a T² coordinate gives slope vector (2,1), whose gcd is one. A formal node uv=π³ has total length 3v(π). Resolving it into three thickness-one nodes subdivides that interval without changing its length (BPR structure Proposition 4.3 and §5.3, pp. 11, 18; BPR tropicalization equation (5.6.1), p. 22).

For f(s)=s on [0,L], divPL(f)=δ₀−δ_L and Δf=δ_L−δ₀. A metric multiplied by exp(−f) therefore changes curvature by δ₀−δ_L. For f(s)=s²/2 the interior contribution to Δ is −ds and the endpoint derivative atoms restore mass zero. These computations fix the sign before the model intersection and Green-function identities are used. If s=c·t and F(s)=c·f(s/c), then dF/ds=df/dt and the Laplacian measures agree by coordinate pushforward. Curvature masses therefore acquire no extra c factor when passing from unit-edge to natural-log lengths; local heights still scale with log absolute values (Yuan Appendix A.5, pp. 115–118).

### Vertex genus and rank

A good-reduction genus-g curve has a one-point skeleton carrying vertex genus g; a split Tate curve has a circle with all vertex genera zero. The first graph has b₁=0 and the second b₁=1, while both satisfy g(X)=b₁+Σg(v) with their correct genera. The bare graph of a good-reduction curve cannot remember its algebraic linear-series rank; its residue curve in the metrized complex supplies that information (Poineau–Turchetti Definition II.2.22 and Theorem II.2.23, pp. 42–43; Amini–Baker §§1–3, pp. 1–14).

On a tree every divisor of nonnegative degree d has graph rank d. On a circle, a degree-one divisor has rank zero, while a divisor of positive degree d has rank d−1. The circle Jacobian is ℝ/Lℤ. A bridge attached to the circle is contracted by Abel–Jacobi, so that map does not itself give a faithful tropicalization of every graph (Gathmann–Kerber Proposition 3.1, pp. 11–12; Baker–Faber Theorem 4.1, p. 17).

### Multiplicity and inseparable degree

The double equation (χᵘ−1)² has the same tropical support as χᵘ−1 and twice its scheme-theoretic weight. The support alone is insufficient. For z↦zⁿ on G_m, the tropical lattice map is multiplication by n; pushforward has index [ℤ:nℤ]=|n|. In characteristic p this includes n=p: the algebraic map is inseparable but its degree is still p, and the tropical pushforward retains it (Gubler §§13.5–13.17, pp. 43–46, with the corrected index in §13.16).

### Admissible measures and the Tate calibration

For a metric tree with two vertices of genus one, total genus is two and μ_a=(δ_v+δ_w)/2; its bridge has no continuous admissible mass. For three parallel edges of length one between two genus-zero vertices, total genus is two. Deleting one edge leaves resistance 1/2, so each edge has density 1/(2(1+1/2))=1/3 and total mass is one. A loop has deleted-edge resistance zero; a bridge has infinite deleted-edge resistance. These tests distinguish the arbitrary-length resistance formula from an unweighted graph count (Yuan Appendix A.5 and Proposition A.5, pp. 115–118; the arbitrary-length proof target is specified in the construction).

For the Tate curve put L=−log|q|. The canonical degree-one measure is ds/L on its circle. The periodic function g(s)=s²/(2L)−s/2+L/12 has mean zero and Δg=δ₀−ds/L: its derivative jumps by −1 at the basepoint. Thus ddc g=ds/L−δ₀, the correction from the one-vertex model measure to the canonical measure. For points represented by z_P,z_Q the abelian integral of dz/z is Log(z_Q/z_P)−(Log q/v_p(q))(v_p(z_Q)−v_p(z_P)). Replacing z_Q by qz_Q leaves it unchanged. Changing the Log branch also cancels between the two terms (Chambert–Loir §5, pp. 17–18; KRZB Proposition 3.16, pp. 21–23 and annular comparison pp. 26–27).

### Hsia self-energy and hybrid normalization

For distinct nonclassical tree points x,y let ρ=δ_x−δ_y. The finite Hsia self-energy is E(ρ)=d(x,y)>0. Bilinearity gives E(ρ,−ρ)=−d(x,y), so arbitrary cross-energy is not nonnegative. Nonclassical diagonal contributions are necessary in this computation. The correct comparison of equal-mass measures uses the self-energy of their difference (Favre–Rivera-Letelier §4, pp. 22–27; DKY printed §2.7, p. 961, with the self-energy convention of Layer 6).

For a hybrid family and fixed 0<r<1, the ordinary complex parameter t has rescaled absolute value |t|^(log r/log|t|)=r. At the central fiber the formal parameter has exactly that nonarchimedean absolute value. A constant projective-line family has central fiber the Berkovich projective line over ℂ((t)), and does not have the complex sphere as its central fiber. Continuity of these evaluations is the topological contract; dynamical potential convergence belongs to the downstream ArithmeticDynamics application (Boucksom–Jonsson Proposition 4.12, pp. 25–26).

## Downstream consumers

ArithmeticDynamics consumes the line geometry and hybrid analytic space of Layer 0 and the local kernels and self-energy of Layer 6 for its §§2.2–2.5 and §6.1. It supplies the dynamical escape-rate estimates and locally uniform convergence of normalized family potentials in the DKY degeneration. Hybrid topology alone is not a convergence theorem for those potentials. Global Arakelov and Bogomolov arguments consume the mixed measures, admissible corrections and local-height normalization of Layer 6.

The skeleton–Jacobian comparison and the BC–abelian correction in Layer 7 supply period and annular comparison inputs to Diophantine applications. ColemanIntegration retains local integration; AnabelianGeometryAndNonabelianChabauty §5.8 and ColemanIntegrationPartII §4.0 supply the logarithms in their specified ranges, and EffectiveDiophantineMethods §4.3 supplies rational endpoint integrals; this roadmap compares their outputs through the analytic skeleton.

## References

Locators refer to the versions specified here. Statements above use the stated normalizations and hypotheses; preprint formula checks are scoped to those versions.

- Michael Temkin, *Introduction to Berkovich analytic spaces*. Author-hosted arXiv:1010.2235v2, 16 December 2011; 52 pages. Author preprint. [Source](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf).
- Matthew Baker, Sam Payne, Joseph Rabinoff, *On the structure of nonarchimedean analytic curves*. arXiv:1404.0279v1 [math.AG], 1 April 2014 (published in Tropical and non-Archimedean geometry, Contemp. Math. 605 (2013); this is the paper cited as [BPR13] by the tropicalization paper). [Source](https://arxiv.org/abs/1404.0279v1).
- Matthew Baker, Sam Payne, Joseph Rabinoff, *Nonarchimedean geometry, tropicalization, and metrics on curves*. arXiv:1104.0320v3 [math.AG], 10 June 2015 (published in Algebraic Geometry 3 (2016) 63-105). The paper notes that its numbering differs from v2 and that the former Section 5 was extracted and published separately as [BPR13] (= the structure paper above). [Source](https://arxiv.org/abs/1104.0320v3).
- Matthew Baker, Sam Payne, Joseph Rabinoff, *On the structure of non-archimedean analytic curves*. Published author offprint, Contemporary Mathematics 605 (2013), 93–121, DOI 10.1090/conm/605/12113; 29 physical pages. [Source](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1).
- Vladimir Berkovich, *Spectral Theory and Analytic Geometry over Non-Archimedean Fields*. AMS Mathematical Surveys and Monographs 33 (1990); printed page numbers.
- Peter Scholze, *Berkovich Motives*. Author-hosted 65-page PDF; §2 and Proposition 3.2. [Source](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf).
- Jérôme Poineau and Daniele Turchetti, *Berkovich curves and Schottky uniformization*. arXiv:2010.09043v1, 18 October 2020; physical pages. All locators here refer to this version. [Source](https://arxiv.org/pdf/2010.09043v1).
- Andreas Gathmann and Michael Kerber, *A Riemann–Roch theorem in tropical geometry*. arXiv:math/0612129v2, 11 July 2007, 14 pages. [Source](https://arxiv.org/pdf/math/0612129v2).
- Matthew Baker, *Specialization of linear systems from curves to graphs*. arXiv:math/0701075v4, 5 July 2007, 31 pages. [Source](https://arxiv.org/pdf/math/0701075v4).
- Omid Amini and Matthew Baker, *Linear series on metrized complexes of algebraic curves*. arXiv:1204.3508v3; PDF dated 6 April 2018, arXiv stamp 10 October 2013; 45 pages. [Source](https://arxiv.org/pdf/1204.3508v3).
- Matthew Baker and Xander Faber, *Metric properties of the tropical Abel–Jacobi map*. arXiv:0905.1679v4 PDF; physical pages. [Source](https://arxiv.org/pdf/0905.1679v4).
- Walter Gubler, *A guide to tropicalizations*. Author-hosted arXiv:1108.6126v2; page numbers in the PDF. [Source](https://gubler.app.uni-regensburg.de/Publikationen/1108.6126.pdf).
- Bernd Sturmfels and Jenia Tevelev, *Elimination theory for tropical varieties*. arXiv:0704.3471v1 PDF; physical pages. [Source](https://arxiv.org/pdf/0704.3471v1).
- Antoine Chambert-Loir, *Mesures et équidistribution sur les espaces de Berkovich*. arXiv:math/0304023v3, 12 November 2004, 21 pages. [Source](https://arxiv.org/pdf/math/0304023v3).
- Charles Favre and Juan Rivera-Letelier, *Équidistribution quantitative des points de petite hauteur sur la droite projective*. arXiv:math/0407471v2 PDF; physical pages. [Source](https://arxiv.org/pdf/math/0407471v2).
- Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*. Author PDF dated 21 August 2024, 126 pages. [Source](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf).
- Bogdan Zavyalov, *Mod-p Poincaré duality in p-adic analytic geometry*. arXiv:2111.01830v3, 21 February 2024. [Source](https://arxiv.org/pdf/2111.01830v3).
- Kiran Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*. arXiv:1301.0792v5, author preprint; printed PDF pages. [Source](https://arxiv.org/abs/1301.0792v5).
- Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*. arXiv:1704.08928v2, 56 pages. [Source](https://arxiv.org/pdf/1704.08928v2).
- Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. arXiv:1901.09945v2. [Source](https://arxiv.org/pdf/1901.09945v2).
- Sébastien Boucksom and Mattias Jonsson, *Tropical and non-Archimedean limits of degenerating families of volume forms*. arXiv:1605.05277v2 PDF; 48 pages. [Source](https://arxiv.org/pdf/1605.05277v2).
- Eric Katz, Joseph Rabinoff and David Zureick-Brown, *Diophantine and tropical geometry, and uniformity of rational points on curves*. arXiv:1606.09618v2, 49 pages. [Source](https://arxiv.org/pdf/1606.09618v2).
- Eric Katz, Joseph Rabinoff and David Zureick-Brown, *Uniform bounds for the number of rational points on curves of small Mordell–Weil rank*. arXiv:1504.00694v3 PDF; physical pages. [Source](https://arxiv.org/pdf/1504.00694v3).
- Matthew Baker and Joseph Rabinoff, *The skeleton of the Jacobian, the Jacobian of the skeleton, and lifting meromorphic functions from tropical to algebraic curves*. arXiv:1308.3864v1 PDF; physical pages. [Source](https://arxiv.org/pdf/1308.3864v1).
- Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*. Annals of Mathematics 191 (2020), 949–1001; version of record. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf).
- Sébastien Boucksom and Mattias Jonsson, *Tropical and non-Archimedean limits of degenerating families of volume forms*. JEP 4 (2017), 87–139; version of record; Appendix A.4–A.6, pp. 136–137. [Source](https://www.numdam.org/item/10.5802/jep.39.pdf).
- Charles Favre and Juan Rivera-Letelier, *Corrigendum to Équidistribution quantitative des points de petite hauteur sur la droite projective*. Author-hosted corrigendum, 3 pages; quantitative error bounds are corrected, not the §4.2 Laplacian sign. [Source](https://www.cmls.polytechnique.fr/perso/favre/corrigendum.pdf).
- Kiran Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*. arXiv:1602.06899v3, Appendix A, pp. 189–191; errata to Part I. [Source](https://arxiv.org/pdf/1602.06899v3).
- Matthew Baker and Serguei Norine, *Riemann–Roch and Abel–Jacobi theory on a finite graph*. arXiv:math/0608360v3 (2007), §§2–3, pp. 8–16. [Source](https://arxiv.org/pdf/math/0608360v3).
- Vladimir Berkovich, *Integration of one-forms on p-adic analytic spaces*. Author preprint (2004), Theorems 1.6.1–1.6.2 and 9.1.1, pp. 22–23, 136–138. [Source](https://www.wisdom.weizmann.ac.il/~vova/Integration_2004.pdf).
- Jean Fresnel and Michel Matignon, *Sur les espaces analytiques quasi-compacts de dimension 1 sur un corps valué complet ultramétrique*. Annali di Matematica Pura ed Applicata 145 (1986), 159–210; Théorème 1, §1.4, pp. 165–168 and Théorème 4, §2.4, pp. 182–184. [Source](https://doi.org/10.1007/BF01790541).
- Siegfried Bosch and Werner Lütkebohmert, *Stable reduction and uniformization of abelian varieties I*. Mathematische Annalen 270 (1985), 349–379; Corollary 3.8, pp. 364–365; Lemma 6.1, p. 372; Theorem 7.1 and its proof, pp. 374–378. [Source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0034.pdf).
- Roland Huber, *Étale cohomology of rigid analytic varieties and adic spaces*. Aspects of Mathematics E30 (1996), Proposition 8.3.1, pp. 422–424, Remark 8.3.2, pp. 424–425 and Lemma 5.6.8(i), pp. 313–314.
- Roland Huber, *A generalization of formal schemes and rigid analytic varieties*. Mathematische Zeitschrift 217 (1994), 513–551, Proposition 4.5(iv), printed p. 543.
- Antoine Ducros, *La structure des courbes analytiques*. Author PDF, §4.5.2, p. 271, §5.1.12, p. 292 and §5.4.12. [Source](https://webusers.imj-prg.fr/~antoine.ducros/trirss.pdf).
- Robert F. Coleman, *Reciprocity laws on curves*. Compositio Mathematica 72 (1989), 205–235; §III and Proposition 4.3, p. 226. [Source](https://www.numdam.org/item/CM_1989__72_2_205_0.pdf).
- Ehud de Shalit, *Coleman integration versus Schneider integration on semistable curves*. Documenta Mathematica, Extra Volume Coates (2006), 325–334; §0.3, pp. 327–328. [Source](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/deshalit.pdf).

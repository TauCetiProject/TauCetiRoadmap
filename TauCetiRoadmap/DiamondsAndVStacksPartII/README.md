# Roadmap: diamonds and v-stacks, part II — integral recovery and kimberlite specialization

**Summary.** This Part II develops the integral geometry of diamonds after DiamondsAndVStacks Layer D6: invariance under analytic universal homeomorphisms, full faithfulness on perfect schemes and perfect discrete sources, the olivine spectrum, reduction of v-sheaves, formal adicness, specializing v-sheaves and étale formal neighbourhoods. It recovers flat normal formal schemes locally formally of finite type, and proper flat normal schemes over a complete mixed-characteristic discrete valuation ring, from their v-sheaves; identifies flat Zariski closures with v-closures; and develops kimberlites, tubes and specialization of connected components. The last layer proves the quotient theorem for rich smelted kimberlites, the component bijection under a closed-specialization hypothesis, and the specialization principle for π-adic kimberlites. The general analytic invariance theorem consumes the residue-field separation contract below; the normality criterion using connected tubes assumes algebraically closed residue field. Algebraic closedness is part of the normality statement (SW20 Propositions 10.2.1, 18.3.1, 18.4.1 and Theorem 18.4.2; GLE Theorem 2.32, Theorem 4.27 and Lemmas 4.53, 4.55; AGLR Theorem 2.37, with the correction to Proposition 2.39 in §D11.20).

## Scope and ownership

This roadmap owns Layers D7–D11 below. SchemeAndStackFoundations §§4.9–4.10 owns formal functions and the proper-scheme existence and morphism theorems; the corresponding AdicSpacesPartIII F0 interfaces are adapters of those results. DiamondsAndVStacks stops at D6.9: it supplies small v-sheaves and v-stacks, diamonds, underlying spaces and morphism classes (D0–D5), analytic diamondification and its étale comparison (D6.1–D6.5), pre-adic diamondification (D6.6), the integral Galois quotient (D6.7), its point map (D6.8), and seminormal rigid full faithfulness (D6.9). Those constructions are imported without a second definition. D7 adds universal-homeomorphism invariance, through the general residue-field supplier contract, and the full theory for perfect discrete sources, rather than another analytic diamondification.

SchemeAndStackFoundations §§0.14, 0.21, 0.23–0.26 owns henselian pairs, excellence, scheme universal homeomorphisms, perfection and weak normality. Its §0.23a includes arbitrary elementwise nil ideals. Its scheme and formal extensions of mixed-characteristic weak normality and absolute weak normalization are supplier contracts below. PrismaticCohomology §2.0 owns scheme v-covers tested by valuation rings of arbitrary rank, and SchemeKTheoryOperations §4.10 owns the v-topology on qcqs perfect 𝔽_p-schemes. ArcTopologyAndDescent §§1.5–1.7, 3.10 and 7.8 own subcanonicity on qcqs perfect schemes, right cancellation, universal submersiveness and adic detection of v-covers, valuation-product covers and representable descent for perfect schemes. D7.6 extends subcanonicity to arbitrary perfect schemes, and D7.10 owns the comparison with surjectivity of the associated v-sheaves.

RigidAnalyticGeometry §8.2 owns classical points of affinoid algebras and their constructible density. AdicSpacesPartII R0 and R1 owns Huber pairs, adic morphisms, finite morphisms, rigid spaces, relative scheme–adic fibre products and rigid–adic comparison. AdicSpacesPartIII F0 and R2 owns formal schemes, completions, generic fibres, classical specialization, classical tubes and the formal-scheme adapters for formal functions and formal GAGA. F0.3 owns the finite-ideal formal-scheme carrier without noetherianity; the contract below requests its reduction interface and the extension of R2.3's comparison to that generality. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 owns the global bounded-function recovery theorem, including restriction compatibility and its corrected de Jong proof route; D10.4 owns only the local connectedness theorem used by D11.15. AdicCoefficientsAndComparisons L1 owns the analytic scheme functor on schemes locally of finite type over O; D10.1 extends its domain to all O-schemes and identifies the restriction with that functor. D10.2 extends the R2.9 comparison from topologically finite type to locally formally finite type by taking the relative generic fibre; it does not identify that fibre with the entire analytic locus. PerfectoidSpaces owns perfectoid spaces, marked untilts, tilting and perfectoid residue fields. DiamondEtaleCohomology C4 supplies partial properness and properness. These notions are not reconstructed here.

At the library level, Mathlib owns schemes, prime spectra, perfect closures, valuations, pullback squares, adjunctions, constructible topologies and connected components. In particular, the pointwise ideal of elements of valuation less than one uses `Valuation.ltIdeal` and `Valuation.mem_ltIdeal_iff`, pulled back to the chosen bounded subring; no separate pointwise specialization-ideal definition or membership API is owned here. Constructible density uses `Dense` with `constructibleTopology`, without a second generic density predicate. Tau Ceti owns the valuation spectrum, its analytic locus and pre-adic-space carriers. The precise contracts follow below.

GeometricSatakeAndFusion GS0 §0.30, “Integral bounded Grassmannian families” and “Integral parahoric ind-properness”, owns the integral Grassmannians, Schubert bounds and change of group; its GS4 §4.17, “Integral local models and admissible special fibres”, and §4.18, “Functoriality of integral local models”, own the v-sheaf local models and their maps. D10.15 applies integral recovery to supplied local-model data; it constructs no Grassmannian or local model. The identification of the supplied v-closure with that of D10.9, and the general linear minuscule identification, are explicit hypotheses there. GeometricSatakeAndFusionPartII Layers 0, 3, 6 and 7 consume D10 and D11 for integral local models, and HeckeStacksAndLocalShtukas HS2.16 is a downstream consumer of component comparisons of the kind D11.14 proves. Their connected-tube and shtuka theorems are not suppliers for this roadmap.

## Conventions

Fix a prime p, including p = 2 and p = 3. Perf is the category of perfectoid spaces of characteristic p, with the v-topology. All v-sheaves and v-stacks are small in the cutoff-cardinal sense of DiamondsAndVStacks D0 and D4; each construction is first made at a cutoff and compared under increasing cutoffs. Scheme-theoretic v-sheaves use perfect affine 𝔽_p-schemes in the same universe and the scheme v-topology. A cover of an affine target has a finite subfamily giving a v-cover; the empty family covers exactly the empty target. The initial sheaf is empty; the final v-sheaf is Spd(𝔽_p), and is not a diamond.

For a pre-adic space X over Spa(ℤ_p, ℤ_p), X^♢ denotes the sheaf of marked untilts with a map to X. For a characteristic-p scheme X, X^⋄ is the formal convention: on an affine test Spa(R, R⁺), Spec(A)^⋄ has values Hom(A, R⁺). Its affine line is a bounded disc. The analytic convention of AdicCoefficientsAndComparisons L1 instead uses Hom(A, R). Over a mixed-characteristic base O the corresponding two functors are defined in D10.1. A Tate-pair map uses continuous maps of both the ambient ring and its integral subring. All valuation comparisons are multiplicative, with v(0) = 0 and v(1) = 1; specialization uses v(a) < 1. The witness v(π) < 1, v(1) = 1 sends a DVR point to (π), not to (0); the same witness appears in D7, D9 and D11.

A formal Huber pair is (A, A) with A a ℤ_p-algebra, complete for an ideal-adic topology with a finitely generated ideal of definition containing p. Write A°° for its topologically nilpotent elements and A_red = (A/(A·A°°))^perf, a perfect 𝔽_p-algebra since p ∈ A°°. For a Tate pair (A, A⁺) the reduction target is Spec(A⁺/A°°) as in D9.1; its perfection A⁺_red is formed only when p ∈ A°°. In a quotient pair the plus ring is the integral closure of the image of the original plus ring in the quotient ambient ring. For any complete flat π-adic O-algebra B, write B⁺ for its integral closure in B[1/π]; the Tate pair with bounds imposed by B is (B[1/π], B⁺). No normality assumption on B is implicit. The quotient convention sends a Tate pair to the zero pair when its topologically nilpotent unit is killed.

E is a complete discretely valued extension of ℚ_p, with ring O_E, uniformizer π and perfect residue field k. Equivalently, the π-adic layer allows any complete DVR O flat over ℤ_p with perfect residue field of characteristic p; F is its fraction field. The maps π ↦ π and 1 ↦ 1 fix the valuation normalization. “Locally formally of finite type” means locally a quotient of O_E[[q₁,…,qₙ]]⟨T₁,…,Tₘ⟩ with the (π,q₁,…,qₙ)-adic topology, allowing continuous non-adic structure maps. “Topologically of finite type” uses the π-adic topology and no formal variables qᵢ. Thus Spf O_E[[q]] has relative generic fibre the open disc, while its analytic locus also has characteristic-p points. Normality of a ring does not silently imply that the ring is a domain; complete local normal rings in D11.15 are domains. The normality test D11.20 explicitly assumes a domain.

FS_O denotes AdicSpacesPartIII R2.9's `FormalScheme.FSC` with C = O_E: the full category over Spf O_E of locally noetherian adic formal schemes whose reduction is locally of finite type over k (de Jong's category, DJ95 Definition 7.0.1). Every formal scheme locally formally of finite type in the sense above is an object of FS_O, and its structure map need not be adic: Spf O_E[[q]] with the (π,q)-adic topology is one. "The standing FS convention" below refers to this paragraph.

For X over Spd O, X_η = X ×_(Spd O) Spd F and X_s = X ×_(Spd O) Spd k. The specialization-triple theorem D11.18 uses the completed maximal unramified extension F̆ and its ring Ŏ; morphisms of triples commute with specialization after that base change. Connected means nonempty and preconnected; the empty space is preconnected. Empty tubes never establish connectedness at a closed point. A point y specializes to x when x lies in the closure of {y}; for Spec O the direction is (0) → (π). A closed-specialization assumption quantifies over all points of the reduction.

**Checks.**

- In Spec 𝔽_p, Frobenius is the identity for p = 2 and p = 3; in 𝔽_p[ε]/(ε²), perfection sends ε to 0, excluding nilpotent structure from the formal functor.
- On a test field C with pseudouniformizer ϖ, the formal affine line permits T = ϖ and excludes T = ϖ⁻¹; the analytic line permits both. Reduction sends ϖ to 0 and 1 to 1.
- Spd O has the generic point specializing to the special point, and both have specialization (π). Its generic fibre has one point; its reduction is Spec k. Reversing specialization would send the generic point away from the closed point.
- With zero ring or empty scheme, both fibres, the reduction and the space of points are empty. There is no prime ideal of the zero ring and no assertion of a minimal point in an empty image.

## Exact supplier contracts

### From Mathlib

Use the pinned `AlgebraicGeometry.Scheme` in `Mathlib/AlgebraicGeometry/Scheme.lean`, `PrimeSpectrum` in `Mathlib/RingTheory/Spectrum/Prime/Defs.lean`, its Zariski topology in `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`, and `PrimeSpectrum.zeroLocus` in `Mathlib/RingTheory/Spectrum/Prime/Basic.lean`. Prime ideals are proper, so Spec 0 is empty. Use `PerfectRing` in `Mathlib/FieldTheory/Perfect.lean` together with characteristic p and primality of p; the class alone only asserts bijectivity of the specified power map. Use `PerfectClosure` in `Mathlib/FieldTheory/PerfectClosure.lean` for the colimit along Frobenius, not the inverse-limit construction called perfection elsewhere.

Use `Valuation` in `Mathlib/RingTheory/Valuation/Basic.lean`, `Valuation.integer`, `Valuation.ltIdeal` and `Valuation.mem_ltIdeal_iff` in `Mathlib/RingTheory/Valuation/Integers.lean`; the last ideal is on the valuation's integer subring. For a merely bounded subring take its comap. Use `ValuationSubring.valuation_lt_one_iff` in `Mathlib/RingTheory/Valuation/ValuationSubring.lean` for the maximal ideal of a valuation subring. A bounded unit has value one; strict inequality singles out nonunits. `IsIntegrallyClosed` in `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean` refers to the general fraction ring and is combined with domain hypotheses where needed. `AlgebraicGeometry.Scheme.Pullback.exists_preimage_pullback` in `Mathlib/AlgebraicGeometry/PullbackCarrier.lean` gives, for x ∈ X and y ∈ Y with the same image in S, a point of X ×_S Y over both; D7.6 uses it to descend underlying maps along v-covers. `AlgebraicGeometry.ext_of_isDominant_of_isSeparated` in `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` says that two maps from a reduced scheme to a scheme separated over a common base, agreeing over the base and on a dominant source, are equal; D10.1 applies it to Spec R^♯ → Spec R^(♯+) (dominant since a pseudouniformizer is a nonzerodivisor of the reduced ring R^(♯+)). `Algebra.IsEffective.of_faithfullyFlat` in `Mathlib/RingTheory/TensorProduct/IncludeLeftSubRight.lean` gives, for a faithfully flat R-algebra S, exactness of R → S ⇉ S ⊗_R S (the effective-monomorphism form of faithfully flat descent); D10.11 applies it to unramified Galois extensions.

Use `CategoryTheory.Adjunction` in `Mathlib/CategoryTheory/Adjunction/Basic.lean`, `CategoryTheory.IsPullback` in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean`, and `CategoryTheory.Limits.PreservesLimitsOfShape` in `Mathlib/CategoryTheory/Limits/Preserves/Basic.lean`. Reduction is the right adjoint, hence preserves limits; diamondification is the left adjoint. No abstract adjunction theorem is a new target here.

Use `constructibleTopology` in `Mathlib/Topology/Spectral/ConstructibleTopology.lean`, `IsSpectralMap` in `Mathlib/Topology/Spectral/Hom.lean`, `Specializes` in `Mathlib/Topology/Defs/Filter.lean`, `Topology.IsQuotientMap` in `Mathlib/Topology/Defs/Induced.lean`, and `ConnectedComponents` in `Mathlib/Topology/Connected/Clopen.lean`. Quotient-map data include surjectivity and the coinduced topology, without separation or compactness assumptions. Spectrality is applied on spectral charts; constructible topology on an arbitrary space is not assumed compact Hausdorff. For a map f of locally spectral spaces, the local convention is that U → V is spectral for every pair of quasicompact opens with f(U) ⊂ V; this does not assert that f is quasicompact (AGLR §2.3, paragraph preceding Proposition 2.27). `PreconnectedSpace` and `IsClopen` have their usual topological meanings, with nonemptiness added when connectedness is asserted.

### From Tau Ceti

Use `TauCeti.ValuationSpectrum.spa` in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` for continuous valuations bounded on the plus ring, and `TauCeti.ValuationSpectrum.IsAnalyticPoint` in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean` for non-open support. Use the pre-adic-space carriers of `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean` and `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Sheaf.lean` through AdicSpaces and AdicSpacesPartII. These supply the ambient adic objects, not a perfectoid site or a v-sheaf category.

Use the Huber pairs `TauCeti.Huber.Pair` in `TauCeti/RingTheory/Huber/Pair.lean` (a ring of integral elements on a Huber ring) and `TauCeti.Huber.IsTateRing` in `TauCeti/RingTheory/Huber/Basic.lean` (a Huber ring with a topologically nilpotent unit); D9.1 states the specialization theorem on these carriers. For a complete Hausdorff Huber pair, `TauCeti.ValuationSpectrum.exists_mem_spa_supp_eq_of_isMaximal` in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Support.lean` gives a point of Spa(A, A⁺) whose support is a prescribed maximal ideal; D10.7 uses it on complete rational localizations.

For strongly noetherian complete separated Tate rings, use `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc` in `TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Flat.lean` for flat rational localization, retaining its rational-presentation and denominator-power hypotheses. For the rational localization of a complete noetherian non-Tate source onto its Tate analytic charts, use AdicSpacesPartII R0.16 *open-embedding-etale* and R0.17 *etale-ring-flatness*: the chart embedding is étale, and the ring map of an étale affinoid morphism whose target ring is in Huber's standing class is flat.

### From TauCetiRoadmap.DiamondsAndVStacks

D0.1 and AdicSpacesPartII R0.19.1–R0.19.3 supply local spectrality, patch topology and closure of proconstructible subsets; D0's cutoff-cardinal targets and D2's cutoff independence supply size control. D1.1, D1.4 and D1.9 supply totally and strictly totally disconnected perfectoid covers. D2 supplies the v-site, descent of functions and higher v-acyclicity. D3.6–D3.10 supplies étale and quasi-pro-étale maps, sub-v-sheaves of totally disconnected spaces, immersion classes, their v-locality and locally profinite torsors. D4 supplies smallness, underlying spaces, surjectivity and isomorphism detection. D5 supplies spatiality, relative representability, étale local structure and finite étale permanence. D6.1–D6.9 supplies the diamondification, gluing, site comparison, pre-adic point map, integral Galois quotient and seminormal rigid full faithfulness specified in Scope and ownership. In particular the structure map to Spd E remains part of every generic-fibre Hom set.

### From TauCetiRoadmap.PrismaticCohomology

§2.0 supplies the v-covers of qcqs schemes: a qcqs map Y → T is a v-cover when every Spec V → T, for V a valuation ring of arbitrary rank, lifts to Y after an injective local extension of valuation rings V → W. It supplies stability of v-covers under composition and base change, their finite-presentation refinement, and the statement that every v-cover is an arc-cover. This is the scheme v-cover of GLE Definition 3.4(1).

### From TauCetiRoadmap.SchemeKTheoryOperations

§4.10 supplies the v-topology on qcqs perfect 𝔽_p-schemes, generated by valuation lifting after extension, with its identity, composition, refinement and base-change rules. On perfect affine schemes a small family covers exactly when a finite subfamily has a v-covering disjoint union (GLE Definition 3.4(2)): a covering sieve contains a finite jointly covering family, each member factors through some member of the given family, and the right-cancellation rule of ArcTopologyAndDescent §1.6 passes the cover to that finite subfamily.

### From TauCetiRoadmap.ArcTopologyAndDescent

§1.5 supplies subcanonicity of the v-topology on qcqs perfect 𝔽_p-schemes; D7.6 extends it to arbitrary perfect schemes. §1.6 supplies right cancellation: if g ∘ f is a v-cover then g is a v-cover. §1.7 supplies the equivalence of v-covers with universally subtrusive maps, universal submersiveness of v-covers, and the adic valuation test: Spec B → Spec A is a v-cover if and only if Spa(B,B) → Spa(A,A), with discrete topologies, is surjective (GLE Lemma 3.5). §3.10 supplies, for every ring A, a v-cover Spec(∏ Vᵢ) → Spec A by absolutely integrally closed valuation domains Vᵢ of unrestricted rank, chosen of cardinality at most max(|A|, ℵ₀) through its §0.3. When A is perfect of characteristic p each Vᵢ is perfect: Frobenius is injective on a domain of characteristic p, and xᵖ − a has a root in Vᵢ (GLE Remark 3.8). §7.8 supplies arc-descent, hence v-descent, of Hom(−, Y) on perfect schemes for every qcqs perfect 𝔽_p-scheme Y, and the characterization of arc-covers of qcqs perfect 𝔽_p-schemes as universally effective epimorphisms.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.21 supplies excellence, regularity of completion maps and preservation of normality; §§0.23–0.24 supplies universal homeomorphisms, unrestricted étale topological invariance and the perfection adjunction; §0.25 supplies perfectly finite type schemes. §§4.9–4.10 supply formal functions, proper-scheme existence and full faithfulness of completion on morphisms, through the formal-module adapters of AdicSpacesPartIII F0.6–F0.8. §0.26 supplies the characteristic-p weak-normality criterion and finite models with specified generic fields. The mixed-characteristic formal statements below extend that scheme interface.

What SchemeAndStackFoundations must provide (gap:strict-henselization-g-ring): In §0.21, for a noetherian local G-ring R, prove that the henselization and the strict henselization of R (ModularCurves 4D) are G-rings (STACKS Tag 07QR), so that R^sh → (R^sh)^∧ is a regular map and the normality of R^sh passes to its completion.

What SchemeAndStackFoundations must provide (gap:mixed-characteristic-weak-normality): In §0.26, for a reduced excellent ring A flat over a mixed-characteristic complete DVR, prove that weak normality excludes every proper finite birational universal homeomorphism from a reduced scheme, compatibly with localization and completion at closed points.

What SchemeAndStackFoundations must provide (gap:finite-geometric-fibre-radiciality): In §0.26, for a finite surjection Y → X of finite-type schemes over an algebraically closed field k, prove that singleton geometric fibres over all closed points imply universal injectivity, hence a universal homeomorphism.

What SchemeAndStackFoundations must provide (gap:absolute-weak-normality-formal): In §0.26, define absolute weak normality of rings and schemes (AGLR Definition 2.12) and supply scheme absolute weak normalization with its universal property, finiteness for excellent rings with characteristic-zero generic fields, and preservation and descent under regular completion and formal localization maps.

### From TauCetiRoadmap.AdicSpacesPartII

R0.6, R0.7, R0.13 supplies adic and finite maps and fibre products; R0.9 supplies K-affinoid Jacobson theory; RigidAnalyticGeometry §8.2 (*classical-points-constructible-density*, imported by R1.7) supplies patch density of the classical points Max A in Spa(A, A°) for a K-affinoid algebra A, used for the cJ property of D11.8; R0.19.1–R0.19.4 supplies patch topology, proconstructible closure and quotient criteria. R1.2, “Huber's fibre product of a scheme and an adic space”, supplies relative analytification over Spa(O,O), by its noetherian-ring-of-definition case, with gluing and universal property; R1.3–R1.4 supplies field-base analytification and compatibilities; R1.7 supplies the rigid–adic comparison. R0.1, *huber-standing-class*, supplies that a complete noetherian ring with the I-adic topology of a finitely generated ideal I is in Huber's standing class, with itself as ring of definition, and that the class is stable under rational localization; R0.16, *open-embedding-etale*, supplies that an open embedding of locally Huber-standard adic spaces is étale; R0.17, *etale-ring-flatness*, supplies flatness of O_Y(Y) → O_X(X) for an étale morphism X → Y of affinoid adic spaces whose target ring is complete Hausdorff and in Huber's standing class. D10.7 combines these three: for B topologically of finite type over O_E, the embedding of a rational chart {|πⁿ| ≤ |t| ≠ 0} into Spa(B[[t]]) is étale, so the rational localization B[[t]] → O(chart) is flat. The finite-morphism criterion is combined with completed residue fields from PerfectoidSpaces and AdicSpaces.

What AdicSpacesPartII must provide (gap:finite-residue-and-integral-stalks): In R0.13, for a finite morphism of analytic adic spaces locally of finite type over a complete nonarchimedean field K, with no residue-characteristic restriction, prove finiteness of completed residue extensions and identify the source valuation subring with the localization of the target valuation subring’s integral closure at the prime selected by the source point; for a unique prolongation this is the integral closure itself.

What AdicSpacesPartII must provide (gap:completed-residue-fields-general-universal-homeomorphisms): In R0.18, for arbitrary analytic pre-adic spaces over Spa(ℚ_p,ℤ_p), prove that a universal homeomorphism identifies completed residue fields and their chosen valuation subrings; for every proper extension of complete valued fields K ⊂ L of characteristic zero, its separation input must produce a complete algebraically closed valued extension C/K for which Spa(L,L⁺) ×_(Spa(K,K⁺)) Spa(C,C⁺) has at least two points, with compatible extending valuation subrings, without assuming L/K finite.

What AdicSpacesPartII must provide (gap:analytic-integral-stalks-mod-p): In R0.18, for any analytic pre-adic space X over Spa(ℚ_p,ℤ_p), any point x and integer n ≥ 1, identify the integral stalk O⁺_(X,x)/pⁿ with K(x)⁺/pⁿ naturally in X, using the chosen valuation subring; no finite-type or finite-map assumption is imposed.

What AdicSpacesPartII must provide (gap:pseudorigid-jacobson-flatness): In R0.9 / R0.18, for a complete Tate O-algebra A admitting a noetherian ring of definition formally of finite type over the complete DVR O, prove that A is Jacobson–Tate and admits an excellent ring of definition, with maximal-support rank-one valuations dense and rational localizations again pseudoaffinoid (LOU17 Definition 4.1, Lemma 4.2 and Propositions 3.3, 4.6).

### From TauCetiRoadmap.AdicSpacesPartIII

F0.2–F0.5 supplies formal spectra, formal schemes of finite ideal type, adic morphisms and formal completions; in F0.3, `FormalScheme` has no noetherian hypothesis, and `FormalScheme.IsLocallyNoetherian` is a separate predicate. F0.6 supplies coherent formal modules and the formal-functions adapter of SchemeAndStackFoundations §4.9; F0.7–F0.8 supplies the adapters of SchemeAndStackFoundations §4.10 for existence and morphisms between given proper algebraic schemes and their completions. R2.2–R2.4 supplies admissible formal schemes, the locally noetherian formal-scheme comparison, the relative generic-fibre functor, classical specialization and tubes. R2.9 supplies `FormalScheme.FSC` (FS_O for C = O_E) and its rigid generic fibre `rigOfFSC`, with its power-series open-disc example, plus étale formal-scheme lifting and site invariance. D10.2 uses these universal properties to identify the relative Huber generic fibre on all of FS_O. No algebraization of an arbitrary proper formal scheme is consumed.

What AdicSpacesPartIII must provide (gap:finite-ideal-formal-schemes): Using F0.3's `FormalScheme`, for formal schemes over ℤ_p locally represented by complete separated I-adic rings A with finitely generated I containing p, without noetherian hypotheses, construct the reduction locally Spec((A/I)_red), independently of I and compatibly with open gluing, and extend R2.3's fully faithful comparison to pre-adic spaces with affine formula Spf A ↦ Spa(A,A), compatibly with open gluing and with R2.3 on locally noetherian objects (GLE Convention 1 and Proposition 4.16; SW13 Proposition 2.2.1).

### From TauCetiRoadmap.RigidAnalyticGeometry

§8.2 supplies the classical points Max A → Spa(A, A°) of a K-affinoid algebra A over a complete nonarchimedean field K, their injectivity, and their density for the constructible topology, with the constructible closure described by the valuations bounded by one on A° and strictly less than one on A°°; AdicSpacesPartII R1.7 imports the same statement. D11.8 uses it for the constructibly Jacobson property of diamonds of adic spaces topologically of finite type over K.

### From TauCetiRoadmap.PerfectoidSpaces

P1 supplies perfectoid pairs, marked untilts and integral completeness; P1 supplies tilting; P2.3 supplies perfectoid rational localization and P2.5 supplies completed residue fields; P3 supplies étale invariance under tilting. Strictly totally disconnected spaces are used through DiamondsAndVStacks D1, retaining their descriptions by algebraically closed fields with specified integral valuation subrings.

### From TauCetiRoadmap.DiamondEtaleCohomology

C4.1 and C4.3–C4.7 and C4.16, “Images of proper maps in separated targets”, supply partially proper and proper maps, stability under composition and base change, and closedness of proper images. C8.24 supplies the presentation of a one-point quasiseparated diamond as Spa(C,O_C)/G with C algebraically closed and G profinite, used in D8.7. Coefficient and cohomology constructions are not used.

### From TauCetiRoadmap.AdicCoefficientsAndComparisons

L1, “Schemes as v-sheaves”, supplies the analytic convention in characteristic p and, in L1, *mixed-characteristic-scheme-diamond*, for mixed-characteristic O-schemes locally of finite type. D10.1 constructs the arbitrary-O-scheme extension and compares its restriction with L1. Its special-fibre functor is distinguished from the formal functor of D7.4 by the affine-line Check.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.2.27, `deJongBoundedFormalFunctions`, supplies the ring isomorphism from Γ(𝔛,O_𝔛) to the analytic functions on 𝔛^rig bounded by 1 for O-flat formally normal 𝔛 in FS_O, compatibly with restriction to formal opens, using the corrected de Jong argument. D10.10 consumes this theorem and D10.11 consumes D10.10; D10.4 supplies only complete-local connectedness.

### From TauCetiRoadmap.GeometricSatakeAndFusion

GS0 §0.30, “Integral bounded Grassmannian families”, and §0.32, “Integral parahoric ind-properness”, supplies the integral BD Grassmannian, its proper bounds, and the closed change-of-group map for a closed representation of parahoric models. GS4 §4.17, “Integral local models and admissible special fibres”, supplies the v-sheaf local model `M^v_(𝒢,μ)`, constructed there as the v-closure of the generic Schubert bound in the integral Grassmannian, and §4.18, “Functoriality of integral local models”, supplies the map attached to a morphism of parahoric models. D10.15 takes as explicit hypotheses that this v-closure is the v-closure of D10.9 and that the general linear minuscule local model is the Grassmannian v-sheaf.

**Contract Checks.**

- For x the ℚ_p-point of Spa(ℚ_p,ℤ_p), the stalk comparison with n = 2 is ℤ_p/p² ≅ ℤ_p/p²; n = 0 is outside the contract. For the unramified quadratic extension the finite residue contract gives degree 2, not equality of residue fields.
- The finite map Spec 𝔽_(p²) → Spec 𝔽_p has one ordinary fibre point and two geometric fibre points, so it fails the singleton-geometric-fibre condition. Over algebraically closed k, a finite surjection with exactly one geometric point in every closed fibre passes that condition.
- On the punctured formal chart O[[t]]⟨π/t⟩[1/t], t is invertible, while the ring of definition is noetherian and formally of finite type. Its characteristic-p quotient k((t)) is nonzero and also Tate. Rational localization at the whole space is the identity, hence flat; the zero rational domain has zero ring, also flat. The non-Tate formal source O[[t]] is noetherian with the (π,t)-adic topology, so it is in Huber's standing class with itself as ring of definition; the embedding of the chart {|π| ≤ |t| ≠ 0} is étale (AdicSpacesPartII R0.16) and O[[t]] → O[[t]]⟨π/t⟩[1/t] is flat (AdicSpacesPartII R0.17). A Huber ring of noetherian type that is not finitely generated over its noetherian ring of definition is outside R0.17's hypothesis and is used nowhere here. The pinned flat_toCompletionLoc applies on the resulting complete strongly noetherian Tate charts.
- For Spf ℤ_p, reduction is Spec 𝔽_p and the pre-adic space is Spa(ℤ_p,ℤ_p); the comparison restricts to R2.3's functor.
- For Spf O_C, with C a completed algebraic closure of ℚ_p, choose a ∈ O_C with a² = p. The defining ideals (p) and (a) both contain p and have radical m_C, so both reductions are Spec k_C. F0.3's carrier admits this nonnoetherian object, while R2.3's locally noetherian comparison does not; the extended comparison gives Spa(O_C,O_C).
- For the zero ring, the reduced quotient is zero for every defining ideal; the formal scheme, reduction and pre-adic space all have zero points. A nonemptiness requirement would exclude this compatible empty case.
- On the perfect affine line Spec 𝔽_p[`t^(1/p^∞)`], the two basic opens D(t) and D(t − 1) form a finite cover. The family of all closed points misses the generic point, so no finite subfamily is a v-cover and the family does not cover, although its members are jointly surjective onto the closed points.
- ArcTopologyAndDescent §1.5 concerns qcqs targets. For X = ⨿_(n∈ℕ) Spec 𝔽_p, perfect but not quasicompact, a map Spec A → X is a locally constant function |Spec A| → ℕ, with finitely many values. Along a v-cover Spec B → Spec A, a labelling of Spec B with equal pullbacks is constant on fibres and descends through the quotient map |Spec B| → |Spec A|, as in the extension proved in D7.6.
- An absolutely integrally closed valuation domain of characteristic p is perfect: in the valuation ring of an algebraic closure of 𝔽_p((t)), the root of xᵖ − t is t^(1/p). The ring 𝔽_p[[t]] is neither, since t has no p-th root.

## How to read the build

D7 extends the parent's diamondification to the perfect discrete and integral comparisons needed by reduction. D8 builds scheme-theoretic v-sheaves, the reduction adjunction and formal morphism classes. D9 constructs specialization, prekimberlites and formal and étale formal neighbourhoods. D10 combines the generic and special sides to recover integral objects and compute flat closures. D11a develops valuativity, kimberlites and tubes; D11b proves quotient and component criteria; D11c develops π-adic flatness and specialization triples and applies the criteria to normal formal schemes. Each target lists both its statement inputs and a proof route's inputs. A different proof may use a smaller subset. The README contains the full library programme. Suggested.lean records only headline signatures expressible on pinned carriers, with a precise account of those whose carriers must first be constructed.

## Layer D7: What diamondification forgets: universal homeomorphisms and perfect schemes

Diamondification forgets some scheme structure, including nilpotents and cuspidal defects; residue-field information remains essential. On the analytic side a universal homeomorphism in characteristic 0 induces an isomorphism of diamonds, using the general residue-field contract; a residue-preserving homeomorphism is the intermediate case; on the characteristic-p side X^⋄ depends only on the perfection and is fully faithful on perfect schemes. Gleason's olivine spectrum computes the underlying space of Spd(B, B⁺) and gives the strongest full-faithfulness statement for perfect discrete sources.

### D7.1 Finite universal homeomorphisms in characteristic zero preserve completed residue fields

**Lemma.** Let K be a complete nonarchimedean field of characteristic 0 and f : X → X' a finite morphism of adic spaces locally of finite type over Spa(K, K°) that is a universal homeomorphism: every base change of f along a morphism of adic spaces is a homeomorphism. Then for every x ∈ X with image x' = f(x) the map of completed residue fields K(x') → K(x) is an isomorphism of nonarchimedean fields carrying K(x')⁺ onto K(x)⁺.

f finite: affinoid-locally Spa(B, B⁺) → Spa(A, A⁺) with B finite over A and B⁺ the integral closure of A⁺. Characteristic 0 makes every finite field extension separable; this is where the hypothesis enters.

*Proof sketch.* Finiteness gives a finite extension K(x)/K(x'), since the residue field of B at a point is a quotient of B ⊗_A κ(x'). Base change along Spa(C, C⁺) → X' with C a completed algebraic closure of K(x') and C⁺ extending K(x')⁺. The reduced geometric fibre over x' is a disjoint union of d copies of Spa(C, C⁺), with d = [K(x):K(x')], by separability. The finite fibre itself can have nilpotents. Universal injectivity forces d = 1. For a finite morphism K(x)⁺ is the localization, at the prime selected by x, of the integral closure of K(x')⁺ in K(x). Since the field extension has degree one and a valuation ring is integrally closed, this closure is K(x')⁺ itself; contraction to the original point selects its maximal ideal, so the two valuation subrings agree.

For example, for the normalization t ↦ (t², t³) of the cuspidal cubic over K the unique point above the cusp has residue field K. The finite morphism Spa(L, O_L) → Spa(K, O_K) for a nontrivial finite extension L/K is surjective and injective but not a universal homeomorphism: after base change to a completed algebraic closure it has [L:K] points.

**General residue-field prerequisite.** For a universal homeomorphism of arbitrary analytic pre-adic spaces over Spa(ℚ_p,ℤ_p), require the same completed residue-pair isomorphisms, without finiteness assumptions, from AdicSpacesPartII R0.18 (gap:completed-residue-fields-general-universal-homeomorphisms). D7.1 proves the finite case independently. For a proper complete valued extension the separating base field may need to be larger than the completed algebraic closure of the original field, especially for transcendental extensions. D7.3 consumes the general contract, rather than treating the finite argument as its proof.

**Checks.**

- The identity extension K/K has one geometric lift; its completed residue degree is 1.
- An unramified quadratic extension L/ℚ_p has one ordinary point but two points after completed algebraic-closure base change, for p = 2 and p = 3. Thus an ordinary homeomorphism cannot satisfy the general contract.
- The cusp normalization has degree 1 at its unique point over the cusp; the finite intermediate theorem identifies the entire residue pair.
- For K = 𝔽_p(t)((u)), give its residue field the t-adic valuation at t=0, and put L = 𝔽_p(s)((u)) with t=s(s−1). This separable quadratic extension has two prolongations of that residue valuation, at s=0 and s=1, including for p=2,3. The integral closure of the rank-two valuation ring has two maximal ideals; each chosen point uses one localization. Such a map is not universally injective.

Applications include DiamondsAndVStacks D6.9, the rigid seminormalization comparison: the finite universal homeomorphism X^sn → X satisfies the residue-field hypothesis of D7.3.

*Needs:* AdicSpacesPartII R0, AdicSpacesPartII R1.7, AdicSpacesPartII R0.13 (gap:finite-residue-and-integral-stalks).

(SW20, Lecture 10, §10.2, paragraph before Proposition 10.2.1, p. 77.)

### D7.2 Integral structure sheaves modulo p^n along a residue-preserving homeomorphism

**Lemma.** Let f : X → X' be a morphism of analytic pre-adic spaces over Spa(ℚ_p, ℤ_p) that is a homeomorphism and induces, for every x ∈ X, an isomorphism of completed residue fields K(f(x)) → K(x) carrying K(f(x))⁺ onto K(x)⁺. Then for every n ≥ 1 the map `O⁺_(X')`/p^n → f_\*(O⁺_X/p^n) is an isomorphism of sheaves on |X'| = |X| (quotients taken as sheaves).

p is topologically nilpotent on X and X', since both lie over Spa(ℚ_p, ℤ_p).

*Proof sketch.* Compare stalks. For a point x of an analytic pre-adic space, the kernel of `O⁺_(X,x)` → κ(x)⁺ consists of germs g with |g(x)| = 0; each lies in p^n `O⁺_(X,x)`, because g/p^n is bounded by 1 on the rational neighbourhood {|g| ≤ |p^n|} of x. Hence `O⁺_(X,x)`/p^n = κ(x)⁺/p^n = K(x)⁺/p^n, the last since K(x)⁺ is the completion of κ(x)⁺ for a topology in which p is topologically nilpotent. The hypothesis identifies K(x')⁺/p^n with K(x)⁺/p^n compatibly with the map of stalks, and f is a homeomorphism, so the sheaf map is an isomorphism.

For example, for the identity of X the comparison is the identity of O⁺_X/p^n. For X' = Spa(ℚ_p, ℤ_p) and X = Spa(ℚ_p(√p), ℤ_p[√p]) the map is a homeomorphism of one-point spaces, the residue fields differ, and ℤ_p/p → ℤ_p[√p]/p is not an isomorphism: the hypothesis is needed.

*Needs:* AdicSpacesPartII R0, Mathlib `Valuation`, AdicSpacesPartII R0.18 (gap:analytic-integral-stalks-mod-p).

(SW20, Lecture 10, §10.2, Lemma 10.2.2 and proof, p. 77.)

### D7.3 Universal homeomorphisms induce isomorphisms of diamonds

**Theorem.** Let f : X → X' be a universal homeomorphism of analytic pre-adic spaces over Spa(ℚ_p,ℤ_p). Then f^♦ : X^♦ → X'^♦ is an isomorphism over Spd ℚ_p. The intermediate residue-preserving theorem has the same conclusion for any morphism f which is a homeomorphism and identifies every completed residue field together with its valuation subring.

The general statement uses AdicSpacesPartII R0.18 (gap:completed-residue-fields-general-universal-homeomorphisms) to reduce to that intermediate theorem. D7.1 gives the finite locally finite-type case directly; no finite-type restriction is imposed on the headline.

*Proof sketch.* It suffices that for every affinoid perfectoid Y = Spa(S, S⁺) and every Y → X' (with Y the untilt) there is a unique factorization through f. The underlying map |Y| → |X'| = |X| is given; one needs a map of sheaves |f|\*O_X → O_Y compatible with the plus subsheaves. By D7.2, O⁺_X/p^n = `O⁺_(X')`/p^n, giving maps |f|\*O⁺_X/p^n → O⁺_Y/p^n for all n. Passing to the limit and using that Y is perfectoid, so O⁺_Y = lim O⁺_Y/p^n (H^i(Y, O⁺_Y/ϖ^n) is almost S⁺/ϖ^n for i = 0 and almost zero for i > 0), gives the unique factorization; inverting p gives the map on O. Uniqueness and the sheaf property make f^♦ bijective on all test objects.

For example, the normalization A¹ → {y² = x³} of the cuspidal cubic over ℚ_p induces an isomorphism of diamonds although it is not an isomorphism of rigid spaces (SW20 §10.2). Compatibility: for X^sn → X the seminormalization of a rigid space over K ⊇ ℚ_p, the theorem says that X^sn → X induces an isomorphism of diamonds. Non-example: a nontrivial finite étale cover of degree d > 1 is not a universal homeomorphism and its diamond map is not an isomorphism.

Applications include SW20 Proposition 10.2.3: explains why full faithfulness of ♦ requires a seminormal source. DiamondsAndVStacks D6.9's seminormalization comparison is the case f = X^sn → X of this theorem, proved there independently; D7.3 generalises it and is not an input to it.

*Needs:* D7.2, D7.1, DiamondsAndVStacks D6.4, DiamondsAndVStacks D2.7, DiamondsAndVStacks D2.8, AdicSpacesPartII R0.18 (gap:completed-residue-fields-general-universal-homeomorphisms).

(SW20, Lecture 10, §10.2, Proposition 10.2.1 and proof, pp. 77–78.)

### D7.4 The v-sheaf X^⋄ of a scheme over 𝔽_p

**Construction.** For a scheme X over 𝔽_p, X^⋄ is the v-sheaf on Perf obtained by applying the pre-adic diamondification of DiamondsAndVStacks D6.6 to the discrete adic space with charts Spa(A, A) for affine opens Spec A ⊂ X. Concretely, Spec(A)^⋄(Spa(R, R⁺)) = Hom_ring(A, R⁺) (characteristic p, so no untilt choice), and X^⋄ is glued along the open subfunctors Spec(A[1/g])^⋄ = {f(g) ∈ (R⁺)^×} ⊂ Spec(A)^⋄. The construction X ↦ X^⋄ is a functor from 𝔽_p-schemes to small v-sheaves; X^⋄ = (X^perf)^⋄; it commutes with finite limits and sends open (closed) immersions to open (closed) immersions.

This is the 'formal' convention Spa(A, A); it differs from the analytic convention Spa(A, A⁺) with A⁺ the integral closure of 𝔽_p used by AdicCoefficientsAndComparisons L1 for X◇. A discrete ring A has the discrete topology, so every ring map A → R⁺ is continuous.

*Proof sketch.* Use DiamondsAndVStacks D6.6 for the discrete affine pairs (A, A) and glue along the open subfunctors attached to principal opens. Frobenius of R⁺ is bijective, so Hom(A, R⁺) = Hom(A^perf, R⁺): X^⋄ = (X^perf)^⋄ with X^perf from SchemeAndStackFoundations §0.24. Finite limits: Hom(A ⊗_C B, R⁺) = Hom(A, R⁺) `×_(Hom(C, R⁺))` Hom(B, R⁺) on affines, then glue. A closed immersion Spec(A/I) → Spec A gives maps annihilating every element of I; I need not be finitely generated. After a v-cover by totally disconnected perfectoid test objects, the simultaneous vanishing locus of all these functions is closed and weakly generalizing. Apply the parent's closed-sub-v-sheaf criterion there and descend closed immersions; arbitrary intersections, rather than a finite generating set, handle general I.

Its API includes the following facts.

- The functor X ↦ X^⋄ from 𝔽_p-schemes to small v-sheaves.
- Spec(A)^⋄(Spa(R, R⁺)) = Hom(A, R⁺), naturally in A and in the test object.
- The perfection map X^perf → X induces an isomorphism (X^perf)^⋄ ≅ X^⋄.
- X ↦ X^⋄ preserves finite limits, in particular fibre products over a base.
- Open immersions of schemes go to open immersions of v-sheaves; Spec(A[1/g])^⋄ is the locus where g is a unit of R⁺.
- Closed immersions go to closed immersions.
- X^⋄ is DiamondsAndVStacks D6.6's pre-adic diamondification of the discrete adic space (X, Spa(A, A)) over Spa(ℤ_p, ℤ_p).

**Checks.**

- Spec(𝔽_p)^⋄ is the final v-sheaf: each Spa(R, R⁺) has exactly one ring map 𝔽_p → R⁺.
- Spec(𝔽_p[t])^⋄(Spa(R, R⁺)) = R⁺, the bounded closed disc, not R.
- For X = Spec 𝔽_p[t], X^⋄ is not the analytic X◇ of AdicCoefficientsAndComparisons L1: the point t ↦ 1/ϖ of Spa(R, R⁺) lies in X◇ and not in X^⋄.
- The absolute Frobenius F_X induces an isomorphism of X^⋄: it is post-composition with the bijective Frobenius of R⁺, consistently with X^⋄ = (X^perf)^⋄.
- The empty scheme gives the empty v-sheaf.

For example, Spec(𝔽_p)^⋄ is the final v-sheaf \*, and (Spec 𝔽_p[t])^⋄ sends Spa(R, R⁺) to R⁺.

Applications include SW20 Proposition 18.3.1: the functor whose full faithfulness on perfect schemes is proved; SW20 proof of Proposition 18.4.1: the special fibre of 𝔛^♢ is (𝔛_red^perf)^⋄; Gleason §3: S ↦ S^⋄ is the left adjoint whose right adjoint is the reduction functor; GeometricSatakeAndFusion GS0 Witt geometry: v-sheaves of perfect Witt Grassmannians and affine flag varieties.

*Needs:* DiamondsAndVStacks D6.6, DiamondsAndVStacks D3.8, DiamondsAndVStacks D4.7, SchemeAndStackFoundations §0.24, Mathlib `PerfectRing`, Mathlib `PerfectClosure`, Mathlib `AlgebraicGeometry.Scheme`, DiamondsAndVStacks D3.7, DiamondsAndVStacks D3.9.

(SW20, Lecture 18, §18.3, first paragraph, p. 163; GLE, §3.1, definition of S^⋄ and Remark 3.1, p. 22; Propositions 3.2–3.3, p. 22; AGLR, §2.2, Definition 2.10(2) and the paragraph after it, p. 10.)

### D7.5 Quasicompact spaces over a valuation spectrum have a minimal image point

**Lemma.** Let V be a valuation ring, Z a nonempty quasicompact topological space and g : Z → Spec V a continuous map. Then the image g(Z) ⊂ Spec V has a unique minimal point for the generization order: a point of the image that is a specialization of every other point of the image (the largest prime ideal in the image).

Spec V is totally ordered by specialization; Z is nonempty and quasicompact. Nonemptiness is necessary: an empty image has no minimal point.

*Proof sketch.* For each prime 𝔭 in g(Z), take the closed subset g⁻¹(V(𝔭)) of Z. Every finite intersection is nonempty because the finitely many primes are linearly ordered and the largest belongs to the image. Quasicompactness gives a point in their total intersection. Its image is the largest prime of g(Z), and linear ordering makes it unique. Nonemptiness supplies the first prime and excludes the empty-family failure.

For example, for V a field the image is the unique point. For Z = Spec V and g the identity the minimal point is the closed point. Quasicompactness is needed: for V with primes p_1 ⊊ p_2 ⊊ ⋯ whose union is the maximal ideal and Z = {p_n : n ≥ 1} with the subspace topology (not quasicompact), no image point specializes all others. The empty space has empty image and no minimal image point, so it is excluded. For the identity of Spec V the minimal image point is its closed point.

*Needs:* Mathlib ValuationRing, Mathlib `PrimeSpectrum`, Mathlib Specializes.

(SW20, Lecture 18, §18.3, Lemma 18.3.2 and proof, p. 166.)

### D7.7 The olivine spectrum Spo(B, B⁺) of a Huber pair

**Definition.** For a Huber pair (B, B⁺), Spo(B, B⁺) is the set of pairs x = (|·|^h_x, |·|^a_x) of points of Spa(B, B⁺) such that |·|^a_x has rank at most 1 and is a vertical generization of |·|^h_x, with the topology generated by the classical localizations `U_(b₁≤b₂≠0)` = {|b₁|^h ≤ |b₂|^h ≠ 0} and the analytic localizations `N_(b₁≪b₂)` = {|b₁|^a < |b₂|^a ≠ 0}. The first projection h : Spo(B, B⁺) → Spa(B, B⁺) is continuous, surjective and functorial. A point is discrete if |·|^a is trivial, d-analytic otherwise (analytic if h(x) is analytic, meromorphic otherwise), bounded if |B|^a ≤ 1, and formal if bounded and d-analytic; supp(x) = supp h(x), the specialization ideal sp(x) = {b ∈ B⁺ : |b|^h < 1} and, for bounded x, the deformation ideal def(x) = {b ∈ B : |b|^a < 1}.

(B, B⁺) is a Huber pair, not necessarily complete or over ℤ_p; Spa(B, B⁺) is Tau Ceti's TauCeti.ValuationSpectrum.spa.

*Proof sketch.* Each fibre `h^(-1)`(h(x)) has at most one d-analytic and at most one discrete point, two exactly when h(x) is discrete and microbial. Classical and analytic localizations are functorial in (B, B⁺), so Spo is a functor and h is continuous.

Its API includes the following facts.

- The space Spo(B, B⁺) with its topology, functorial in maps of Huber pairs.
- The continuous surjective projection Spo(B, B⁺) → Spa(B, B⁺).
- `U_(b₁≤b₂≠0)` is the inverse image under h of the open valuation-comparison locus {|b₁| ≤ |b₂| ≠ 0}. It is a rational subset when the rational-domain open-ideal condition holds; in general it is a union of rational opens.
- `N_(b₁≪b₂)` is open.
- Every fibre of h has one or two points, two exactly over discrete microbial points.
- For a Tate pair h is a homeomorphism (Gleason Proposition 2.13).
- Spo of the completion equals Spo(B, B⁺) (Gleason Proposition 2.10).
- The closed bounded locus Spo(B, B⁺)†, the complement of the union of the `N_(1≪b)`.

**Checks.**

- For a perfectoid field (C, C⁺), Spo(C, C⁺) = Spa(C, C⁺) via h.
- For B = 𝔽_p[[u]] with the discrete topology, Spa(B) has three points (two trivial valuations and the u-adic one) and Spo(B) has four: over the u-adic point lie a discrete microbial point and a d-analytic point that is both meromorphic and formal (Gleason Example 2.8).
- Spo(𝔽_p, 𝔽_p) is one point.
- For B = 𝔽_p[[u]] discrete, h is not injective, so Spo is not Huber's spectrum.

For example, Spo(B, B⁺) has more points than Spa(B, B⁺) exactly over the discrete microbial points. Algebraic points (|·|^h trivial) correspond to the prime ideals of B/(B·B°°), equivalently to the open prime ideals of B: B°° itself need not be an ideal of B (for B = ℚ_p, p ∈ B°° but p⁻¹·p = 1 ∉ B°°), and a prime contains B·B°° exactly when it is open. For ℚ_p the ideal B·B°° is the unit ideal, so there are no algebraic points; for 𝔽_p[[u]] with the discrete topology B°° = 0 and the two primes (0) and (u) give the two algebraic points.

Applications include Gleason Theorem 1 / Proposition 2.14: computes |Spd(B, B⁺)| as a set and, under finiteness conditions, as a space; Gleason Proposition 2.36 and Lemma 3.31: identifies schematic closed subsets with zero loci of open ideals; Gleason Proposition 4.9: formal specializations control uniqueness of formalizations; AGLR Proposition 2.39 footnote: the locus `N_(t≪1)` of a higher-rank valuation ring misses the generic fibre.

*Needs:* Tau Ceti `TauCeti.ValuationSpectrum.spa`, Tau Ceti `TauCeti.ValuationSpectrum.IsAnalyticPoint`, Mathlib `Valuation`, DiamondsAndVStacks D0.1.

(GLE, §2.1–2.2, Definitions 2.1, 2.2 and 2.4, Remark 2.3, pp. 10–11.)

### D7.8 The olivine spectrum computes |Spd(B, B⁺)|

**Theorem.** For a complete Huber pair (B, B⁺) over ℤ_p, sending a point Spa(C, C⁺) → Spa(B, B⁺) of Spd(B, B⁺) to the images of the closed point and of the rank-one point defines a continuous bijection π : |Spd(B, B⁺)| → Spo(B, B⁺), functorial in (B, B⁺) and compatible with the generization patterns. It is a homeomorphism when (B, B) is a formal Huber pair, when (B, B⁺) is Tate, and when (B, B⁺) is topologically of finite type over a formal Huber pair (B₀, B₀) with B⁺ the integral closure of the image of the rings of integral elements; on the bounded locus it is always a homeomorphism.

Huber pairs over ℤ_p; complete.

*Proof sketch.* Continuity: analytic localizations pull back to open loci on perfectoid tests; classical localizations pull back to open valuation-comparison loci, locally unions of rational opens. Injectivity: two points with the same image have the same residue field data and are equivalent through a common perfectoid field over (`K_(h(x))`, `K⁺_(h(x))`). Surjectivity: realize each pair (|·|^h, |·|^a) by a perfectoid field with an open bounded valuation subring. Formal pairs: compare with the analytic pre-adic space `Spa(B[[t]])_(t≠0)`, a v-cover whose space equals that of its diamond, and transport opens. Topologically finite type: induct on the number of variables using rational localizations and closed immersions, which preserve the olivine property (Gleason Propositions 2.11, 2.22).

For example, for (B, B⁺) = (C, O_C) a perfectoid field, π is the homeomorphism |Spd C| = |Spa C| of DiamondsAndVStacks D6.3. For B = 𝔽_p[[u]] discrete, |Spd(B)| has four points, not the three of Spa(B). For (ℤ_p, ℤ_p), |Spd ℤ_p| is the two-point Sierpiński space, matching DiamondsAndVStacks D6.8's computation.

*Needs:* D7.7, DiamondsAndVStacks D6.6, DiamondsAndVStacks D6.3, DiamondsAndVStacks D4.5 and D4.8, DiamondsAndVStacks D4.8, PerfectoidSpaces P2.5.

(GLE, Introduction, Theorem 1, p. 3; §2.2, Propositions 2.13 and 2.14, p. 14; Lemma 2.18 and Proposition 2.19, pp. 15–16; Proposition 2.22, p. 17; Proposition 2.27, p. 18.)

### D7.9 Schematic closed subsets of the olivine spectrum are zero loci of open ideals

**Lemma.** Let (B, B⁺) be a Huber pair. Call Z ⊂ Spo(B, B⁺) schematic if it is a union of images Spo(m)(Spo(A, A)) along maps of Huber pairs m : (B, B⁺) → (A, A) with A discrete. For a discrete A and m: the image of Spo(A, A) is `h^(-1)` of the image of Spa(A), which is stable under horizontal specializations and vertical generizations. If Z is schematic and closed then Z = `σ^(-1)`(V(I)) for the support map σ : Spo(B, B⁺) → Spec B and some ideal I of B open for the topology of B.

(B, B⁺) a Huber pair; σ(x) = supp h(x).

*Proof sketch.* A continuous map to a discrete pair has open kernel and kills every topologically nilpotent element. Pass to B/(B·B°°), with the integral closure of the image of B⁺ as its plus subring; this is a discrete Huber pair. Topologically nilpotent elements need not themselves be an ideal of B. Images of discrete pairs are stable under the stated specializations and generizations (Gleason Proposition 2.34), hence Z = `σ^(-1)`(σ(Z)). The trivial-valuation section Spec B → Spa(B, B⁺) of the support map identifies σ(Z) with the preimage of h(Z), which is closed by Proposition 2.28.

For example, for B = A discrete and Z = Spo(A, A) itself, I = 0. For A discrete and m : A → A/I with I an open prime, the image of Spo(A/I, A/I) is `σ^(-1)`(V(I)). For B = 𝔽_p × 𝔽_p discrete, the whole olivine spectrum is schematic and closed. Its defining radical ideal is zero, which is not prime. The empty locus is allowed by taking I = B.

*Needs:* D7.7, D7.8, Mathlib `PrimeSpectrum.zeroLocus`.

(GLE, §2.5, Proposition 2.34, p. 21; Definition 2.35 and Proposition 2.36, p. 22.)

### D7.10 v-covers of perfect affine schemes are detected by ⋄

**Theorem.** Let f : S → T be a morphism of perfect affine 𝔽_p-schemes. Then f^⋄ : S^⋄ → T^⋄ is a quasicompact map of v-sheaves, and f is universally subtrusive (a v-cover in the sense of Bhatt–Scholze and Rydh) if and only if f^⋄ is a surjection of v-sheaves. A small family (S_i → T) is a v-cover if and only if ⨿ S_i^⋄ → T^⋄ is surjective. Equivalently, Spec B → Spec A is universally subtrusive iff |Spa(B)| → |Spa(A)| (discrete pairs) is surjective.

Perfect affine schemes; a family is a v-cover when a finite subfamily is.

*Proof sketch.* Quasicompactness: for perfect discrete A, the bounded locus of Spd(A) is everything, and maps of bounded loci along adic maps are representable in spatial diamonds (Gleason Lemma 2.26). For quasicompact maps surjectivity of v-sheaves is surjectivity on underlying spaces (DiamondsAndVStacks D4). Through D7.8, surjectivity of |Spd(B)| → |Spd(A)| is surjectivity of Spo(B, B) → Spo(A, A), which is surjectivity of Spa(B) → Spa(A) by Proposition 2.34. The adic-spectrum criterion for universal subtrusiveness is the adic valuation test of ArcTopologyAndDescent §1.7.

For example, the identity of a perfect affine scheme is a v-cover and its ⋄ is surjective. A proper surjection of perfect schemes, such as the perfected blow-up of the origin in the perfect affine plane, is a v-cover. Non-example: the inclusion of the generic point Spec 𝔽_p(t)^perf → Spec 𝔽_p[t]^perf is not a v-cover, and its ⋄ misses the points of the closed points.

**Checks.**

- The empty family over Spec 𝔽_p is not a v-cover and induces a nonsurjection; over the empty scheme it is a v-cover and induces the isomorphism ∅ → ∅.
- For a perfect rank-one valuation ring V with fraction field K and residue field κ, Spec(K × κ) → Spec V is surjective on ordinary points but not a v-cover: no extension of V lifts the full generic-to-closed specialization into either component. The discrete adic spectrum map is therefore not surjective.
- The identity and a proper surjection are v-covers; the generic-point inclusion into the perfect affine line omits every closed point and fails both cover tests.

*Needs:* D7.8, D7.9, PrismaticCohomology §2.0, SchemeKTheoryOperations §4.10, ArcTopologyAndDescent §1.7, DiamondsAndVStacks D4.8, DiamondsAndVStacks D5.12, D7.4.

(GLE, §3.1, Definition 3.4, Lemma 3.5, Lemma 3.6 and Proposition 3.7, pp. 22–23.)

### D7.6 Full faithfulness of X ↦ X^⋄ on perfect schemes

**Theorem.** The functor X ↦ X^⋄ of D7.4 from perfect schemes of characteristic p to small v-sheaves on Perf is fully faithful: for perfect schemes X and Y, Hom(Y, X) → Hom(Y^⋄, X^⋄) is bijective.

No finiteness or separatedness hypotheses on X or Y.

*Proof sketch.* Affine target X = Spec R: both sides turn colimits in Y into limits, so take Y = Spec S; the v-cover Spa(S((`t^(1/p^∞)`)), S[[`t^(1/p^∞)`]]) of Y^⋄ embeds Hom(Y^⋄, X^⋄) into Hom(R, S[[`t^(1/p^∞)`]]), and equality of the two pullbacks to the self-product forces the image to lie in S, checked after mapping S to fields. Faithfulness in general: two maps with the same ⋄ agree on underlying spaces, by surjectivity of |Y^⋄| → |Y| (DiamondsAndVStacks D6.8), and then agree by the affine case. Fullness: successively for Y = Spec K (one point, factor through an affine open), Y = Spec V a valuation ring (the key case, using D7.5 to show the map factors through U^⋄ for an affine U), Y = Spec ∏V_i (Stone–Čech compactification of the index set and splitting of open covers), and general Y by Zariski gluing and v-descent. For affine Y, ArcTopologyAndDescent §3.10 gives a v-cover q : Spec(∏V_i) → Y by absolutely integrally closed valuation domains, which are perfect in characteristic p; the previous case gives f with f^⋄ = ψ ∘ q^⋄, faithfulness makes the two pullbacks of f to the perfect fibre product agree, f descends to h : Y → X, and h^⋄ = ψ because q^⋄ is surjective (D7.10). The descent uses that Hom(−, X) is a v-sheaf on perfect affine schemes for every perfect X. For qcqs X this is ArcTopologyAndDescent §1.5, and also §7.8 through arc-descent. For arbitrary X let q : Spec B → Spec A be a v-cover and g : Spec B → X a map whose two pullbacks to the perfect fibre product agree. Points of a fibre product of schemes surject onto pairs of points with a common image (Mathlib `AlgebraicGeometry.Scheme.Pullback.exists_preimage_pullback`), and perfection does not change underlying spaces, so |g| is constant on the fibres of |q|. As q is surjective and submersive (ArcTopologyAndDescent §1.7), |g| factors through a continuous φ : |Spec A| → |X|. Two descents of g have the underlying map φ, and over each basic open D(a) with φ(D(a)) inside an affine open U of X they agree by the affine case applied to the base-changed cover; this is uniqueness. Over each such D(a), g restricted to q⁻¹(D(a)) lands in U and descends by the affine case, and uniqueness on the basic opens of the overlaps glues these local descents.

For example, for X = Spec 𝔽_p[`t^(1/p^∞)`], the endomorphisms of the v-sheaf X^⋄ are exactly the ring endomorphisms of 𝔽_p[`t^(1/p^∞)`]. Non-example for non-perfect schemes: Spec 𝔽_p[t] and its perfection have isomorphic ⋄, but are not isomorphic. Compatibility: Gleason's Theorem 2.32 (D7.11) specializes to this statement when the target is a perfect scheme.

Applications include SW20 proof of Proposition 18.4.1: recovers (𝔛_red)^perf from the closed complement of the analytic locus.

*Needs:* D7.4, D7.5, D7.10, DiamondsAndVStacks D6.8, DiamondsAndVStacks D1.4, ArcTopologyAndDescent §1.5, ArcTopologyAndDescent §1.7, ArcTopologyAndDescent §3.10, ArcTopologyAndDescent §7.8, PrismaticCohomology §2.0, Mathlib `AlgebraicGeometry.Scheme.Pullback.exists_preimage_pullback`.

(SW20, Lecture 18, §18.3, Proposition 18.3.1 and proof, pp. 163–166; GLE, §3.2, Proposition 3.16(1), p. 25.)

### D7.11 Maps from perfect discrete adic spaces to pre-adic spaces

**Theorem.** Let Y be a perfect discrete adic space over 𝔽_p (locally Spa(A, A⁺) with A perfect and discrete) and X a pre-adic space over ℤ_p. Then Hom(Y, X) → Hom(Y^♢, X^♢) is bijective. In particular ♢ is fully faithful on perfect discrete adic spaces over 𝔽_p, and every map Spd(A, A⁺) → Spd(B, B⁺) to a complete Huber pair over ℤ_p comes from a unique map of Huber pairs (B, B⁺) → (A, A⁺).

A⁺ ⊂ A is a ring of integral elements; A carries the discrete topology.

*Proof sketch.* Every map Spd(A, A⁺) → Spd(ℤ_p) factors through Spd 𝔽_p (Gleason Lemma 2.30). Affine target: test against Spa(A((`t^(1/p^∞)`)), A⁺ + `t^(1/p^∞)`A[[`t^(1/p^∞)`]]), which covers the bounded locus; invariance under automorphisms of the test object and topological nilpotence of `t^(p^n)`f\*(b) force f\*(b) ∈ A, giving a ring map (B, B⁺) → (A, A⁺); agreement off the bounded locus uses ultraproducts of geometric points (Lemma 2.31). General X: show that a map g : Y^♢ → X^♢ descends to a continuous |Y| → |X| through the olivine spectrum; reduce to Y = Spa(A, A⁺) with A⁺ ⊂ A valuation rings with the same fraction field, where an exotic map would contradict quasicompactness via D7.5 (Lemma 2.33). Glue the affine factorizations.

For example, for Y = Spec(S) with S perfect and X = Spec(R) perfect this recovers D7.6 on affines. For Y = Spa(𝔽_p) and X = Spa(ℤ_p, ℤ_p) both sides are a single point. Perfection of the source is needed: for the non-perfect discrete Y = Spa(𝔽_p[t], 𝔽_p[t]) the endomorphism of Y^♢ = (Y^perf)^♢ induced by t ↦ `t^(1/p)` is not induced by an endomorphism of Y.

Applications include Gleason Proposition 3.16: perfect schemes are reduced scheme-theoretic v-sheaves.

*Needs:* D7.8, D7.5, D7.4, DiamondsAndVStacks D6.6, DiamondsAndVStacks D6.8.

(GLE, Introduction, Theorem 2, p. 3; §2.5, Lemma 2.30, Lemma 2.31, Theorem 2.32 and Lemma 2.33, pp. 19–21.)

### Examples

For the cuspidal cubic, t ↦ (t²,t³) has residue extension degree one and gives equal diamonds although its coordinate rings differ. In characteristic p, 𝔽_p[t] and 𝔽_p[`t^(1/p^∞)`] have the same formal v-sheaf, while maps from the perfect source recover all fractional Frobenius powers. For the discrete pair 𝔽_p[[u]], three adic points become four olivine points: the extra choice records whether the rank-at-most-one generization is trivial (SW20 §10.2; GLE Example 2.8).

### Dependencies

AdicSpacesPartII R0.13, R1.7; ArcTopologyAndDescent §§1.5–1.7, 3.10, 7.8; PrismaticCohomology §2.0; SchemeKTheoryOperations §4.10; DiamondsAndVStacks D0–D6; PerfectoidSpaces P2; SchemeAndStackFoundations §§0.23–0.24.

## Layer D8: Scheme-theoretic v-sheaves and the reduction functor

The functor S ↦ S^⋄ from perfect affine schemes is continuous for the v-topologies, so it extends to scheme-theoretic v-sheaves and has a right adjoint, the reduction functor. Reduction kills topologically nilpotent elements and analytic points. Formal adicness of a map is Cartesianness of its reduction square; it agrees with adicness for formal Huber pairs and underlies formal separatedness.

### D8.1 Small scheme-theoretic v-sheaves

**Construction.** For a cutoff cardinal κ let PCAlg^op_κ be the category of perfect affine 𝔽_p-schemes whose underlying space and ring of global sections have cardinality at most κ, with the v-topology (a small family is a cover when a finite subfamily is universally subtrusive), and SchPerf~_κ its topos. For κ < λ the inverse-image (extension) functor induced by inclusion of sites gives fully faithful embeddings SchPerf~_κ → SchPerf~_λ; the category SchPerf~ of small scheme-theoretic v-sheaves is the filtered union over all cutoff cardinals. Representable functors of perfect schemes are objects; the topology is subcanonical.

Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine 𝔽_p-schemes with the v-topology of SchemeKTheoryOperations §4.10, whose covers are the v-covers of PrismaticCohomology §2.0, made small through cutoff cardinals as in DiamondsAndVStacks D0.23 and D2.3.

*Proof sketch.* Given S → T with T κ-small, there are S → T′ → T with T′ κ-small and S → T′ a v-cover (Gleason Lemma 3.10). Hence every v-cover S′ → S of perfect affine schemes is a cofiltered inverse limit of v-covers between κ-small perfect affine schemes; equivalently, its map of coordinate rings is a filtered colimit of maps of κ-small rings, and evaluating a presheaf on it is a filtered colimit of its values on the κ-small covers. Hence the inverse-image extension from the κ-small to the λ-small topos is fully faithful (Gleason Proposition 3.9), and the colimit over cutoff cardinals exists as in DiamondsAndVStacks D0.23. Subcanonicity: ArcTopologyAndDescent §1.5 gives it for qcqs perfect schemes, and the descent of the underlying map with gluing over affine opens in the proof of D7.6 extends it to every perfect scheme.

Its API includes the following facts.

- The category of small scheme-theoretic v-sheaves, with the Yoneda functor from perfect schemes.
- Perfect schemes embed fully faithfully (subcanonicity).
- For κ < λ, extension (the inverse image of the geometric morphism) SchPerf~_κ → SchPerf~_λ is fully faithful; its right adjoint is restriction in the opposite direction.
- Finite limits exist and are computed sectionwise.

**Checks.**

- Spec 𝔽_p is the final object.
- The empty scheme represents the initial object.
- Spec 𝔽_p[t] is not an object of the perfect affine site. Its restricted functor of points is nevertheless an object of the sheaf topos, represented there by its perfection.

For example, a perfect scheme represents an object of SchPerf~.

Applications include Gleason Definition 3.12: target category of the reduction functor; AGLR Definition 2.19: X^red is a small v-sheaf on perfect k-schemes; GLX §3.4: the reduction of an integral shtuka moduli space is a perfect scheme in this category.

*Needs:* SchemeKTheoryOperations §4.10, PrismaticCohomology §2.0, ArcTopologyAndDescent §1.5, ArcTopologyAndDescent §1.6, D7.6, DiamondsAndVStacks D0.23, DiamondsAndVStacks D2.3, Mathlib `PerfectRing`.

(GLE, §3.1, the paragraph after Remark 3.8, Lemma 3.10, Proposition 3.9 and the definition of SchPerf~, pp. 23–24.)

### D8.2 The underlying space of a scheme-theoretic v-sheaf

**Construction.** For S ∈ SchPerf~, |S| is the set of equivalence classes of maps Spec k → S from perfect fields, two maps being equivalent if they are dominated by a common perfect field. Choosing a surjection X = ⨿ S_i → S from perfect affine schemes and a surjection Y → X ×_S X of the same kind, |S| = |X|/|Y| with the quotient topology, independent of choices; maps of scheme-theoretic v-sheaves induce continuous maps, and for S representable by a perfect scheme |S| is its Zariski space.

Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine 𝔽_p-schemes with the v-topology of SchemeKTheoryOperations §4.10, whose covers are the v-covers of PrismaticCohomology §2.0, made small through cutoff cardinals as in DiamondsAndVStacks D0.23 and D2.3.

*Proof sketch.* Existence of the presentations: smallness (Gleason Proposition 3.14(1)). Independence of choices and functoriality as for small v-sheaves (DiamondsAndVStacks D4.5 and D4.8), using that v-covers of perfect schemes are surjective on points and submersive (ArcTopologyAndDescent §1.7).

Its API includes the following facts.

- The functor S ↦ |S| to topological spaces.
- For S represented by a perfect scheme X, |S| ≅ |X| homeomorphically, naturally in X.
- |S| is the quotient of |X| by |X ×_S X| for any presentation by perfect affine schemes.
- A surjection of scheme-theoretic v-sheaves induces a surjection on spaces.

**Checks.**

- |Spec 𝔽_p| is one point.
- |Spec 𝔽_p[`t^(1/p^∞)`]| is the Zariski space of the affine line: one generic point and the closed points.
- The empty sheaf has empty space.

For example, for S = Spec A perfect, |S| = Spec A with the Zariski topology.

Applications include Gleason Definition 4.12: target space of the specialization map sp_F : |F| → |F^red|; Gleason Lemma 4.53, 4.55: π₀(|F^red|) and local noetherianity of |F^red|.

*Needs:* D8.1, ArcTopologyAndDescent §1.7, DiamondsAndVStacks D4.5 and D4.8, Mathlib `PrimeSpectrum`.

(GLE, §3.1, definition of |S| after Remark 3.13 and Proposition 3.14, pp. 24–25.)

### D8.3 The functor ⋄ from scheme-theoretic v-sheaves to v-sheaves

**Construction.** The functor S ↦ S^⋄ of D7.4 on perfect affine schemes is continuous for the v-topologies, so it extends uniquely to a colimit-preserving functor ⋄ : SchPerf~ → (small v-sheaves) commuting with finite limits, with (Spec A)^⋄ = Spd(A, A) for A perfect and discrete; the extension is compatible with the passage between cutoff cardinals.

Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine 𝔽_p-schemes with the v-topology of SchemeKTheoryOperations §4.10, whose covers are the v-covers of PrismaticCohomology §2.0, made small through cutoff cardinals as in DiamondsAndVStacks D0.23 and D2.3.

*Proof sketch.* Continuity: v-covers of perfect affine schemes go to surjections (D7.10) and ⋄ preserves fibre products (D7.4). The general topos formalism (the morphism-of-topoi formalism of DiamondsAndVStacks D0) extends a continuous finite-limit-preserving functor on the site to the inverse image of a morphism of topoi f_κ : (v-sheaves)_κ → SchPerf~_κ, compatible in κ (Gleason Proposition 3.11).

Its API includes the following facts.

- The functor ⋄ : SchPerf~ → small v-sheaves.
- On representables it is D7's X ↦ X^⋄.
- ⋄ preserves finite limits.
- ⋄ preserves small colimits.

**Checks.**

- (Spec 𝔽_p)^⋄ is the final v-sheaf.
- The initial scheme-theoretic v-sheaf goes to the empty v-sheaf.
- (Spec 𝔽_p)^⋄ = \* is not a diamond (DiamondsAndVStacks D6.6).

For example, for S a perfect scheme, S^⋄ agrees with D7.4.

Applications include Gleason Definition 3.20: the square (F^red)^⋄ → F defining formal adicness; SW20 Proposition 18.4.1 proof: the closed complement of the analytic locus is (𝔛_red^perf)^⋄.

*Needs:* D7.4, D7.10, D8.1, DiamondsAndVStacks D4.7, Mathlib `CategoryTheory.Limits.PreservesLimitsOfShape`.

(GLE, §3.1, Proposition 3.11 and the paragraph before Definition 3.12, p. 24.)

### D8.4 The reduction functor F ↦ F^red

**Construction.** The reduction functor (−)^red from small v-sheaves to small scheme-theoretic v-sheaves is the right adjoint of ⋄: F^red(Spec R) = Hom(Spec(R)^⋄, F) = F(Spd(R, R)) for R perfect. It preserves limits and smallness, and comes with the counit (F^red)^⋄ → F and the unit S → (S^⋄)^red.

Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine 𝔽_p-schemes with the v-topology of SchemeKTheoryOperations §4.10, whose covers are the v-covers of PrismaticCohomology §2.0, made small through cutoff cardinals as in DiamondsAndVStacks D0.23 and D2.3.

*Proof sketch.* Right adjoint of the inverse image of the morphism of topoi of D8.3, assembled over cutoff cardinals; the formula is the adjunction applied to representables (Gleason Remark 3.13). Smallness: the direct image preserves κ-smallness (Gleason Proposition 3.11), so F^red is small.

Its API includes the following facts.

- The functor F ↦ F^red.
- The adjunction ⋄ ⊣ (−)^red, with unit and counit.
- F^red(Spec R) = F(Spd(R, R)) for R perfect, naturally in R and F.
- (−)^red preserves all limits, in particular fibre products.
- The adjunction map (F^red)^⋄ → F.
- For a reduced S (D8.5) the unit S → (S^⋄)^red is an isomorphism.

**Checks.**

- Spd(ℤ_p)^red = Spec 𝔽_p.
- Spd(ℚ_p)^red is empty: every map Spd(R, R) → Spd ℤ_p with R discrete factors through Spd 𝔽_p (Gleason Lemma 2.30), which is disjoint from Spd ℚ_p.
- For a perfect scheme X, (X^⋄)^red = X (Gleason Proposition 3.16).
- For a formal Huber pair (A, A) with ideal of definition I, Spd(A)^red = Spec((A/I)^perf).

For example, Spd(ℤ_p)^red = Spec 𝔽_p (Gleason Lemma 3.17).

Applications include Gleason §4: target of the specialization map and of Heuer's SP_F; SW20 Proposition 18.4.1 proof: functorial recovery of (𝔛_red)^perf from 𝔛^♢; GLX §3.4 and Lemma 3.10: the reduction of integral shtuka moduli is the affine Deligne–Lusztig variety, functorially in (G, b, μ); AGLR Theorem 2.37: the triple X ↦ (X_η, X^red, sp).

*Needs:* D8.3, Mathlib `CategoryTheory.Adjunction`.

(GLE, §3.1, Definition 3.12 and Remark 3.13, p. 24; AGLR, §2.3, Definition 2.19, p. 14.)

### D8.5 Reduced scheme-theoretic v-sheaves and full faithfulness of ⋄

**Definition.** A small scheme-theoretic v-sheaf S is reduced if the unit S → (S^⋄)^red is an isomorphism. Every perfect scheme is reduced, and ⋄ is fully faithful on reduced objects: Hom(G^⋄, F^⋄) = Hom(G, F) for G arbitrary and F reduced.

Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine 𝔽_p-schemes with the v-topology of SchemeKTheoryOperations §4.10, whose covers are the v-covers of PrismaticCohomology §2.0, made small through cutoff cardinals as in DiamondsAndVStacks D0.23 and D2.3.

*Proof sketch.* Representables: Theorem 2.32 of Gleason (D7.11) applied to Y = Spec R and X perfect gives (X^⋄)^red = X. Full faithfulness: Hom(G^⋄, F^⋄) = Hom(G, (F^⋄)^red) = Hom(G, F) by adjunction.

Its API includes the following facts.

- The predicate: the unit S → (S^⋄)^red is an isomorphism.
- Representables of perfect schemes are reduced.
- Hom(G^⋄, F^⋄) ≅ Hom(G, F) for F reduced.
- Finite limits of reduced objects are reduced.

**Checks.**

- Spec 𝔽_p is reduced.
- The empty scheme-theoretic v-sheaf is reduced.
- For X = Spec(𝔽_p × 𝔽_p), evaluated on Spec 𝔽_p, X has two sections (the two component choices) and so does (X^⋄)^red, since its sections are the maps 𝔽_p × 𝔽_p → 𝔽_p; the unit is the bijection 2 = 2, for p = 2 and p = 3. A reduction that collapsed X to the terminal object would give 1 ≠ 2.
- The counit (Spd(ℤ_p)^red)^⋄ = Spd 𝔽_p → Spd ℤ_p is not an isomorphism: Spd ℤ_p is not in the essential image of ⋄.

For example, reduced objects are closed under finite limits.

Applications include Gleason Lemma 3.32: criterion for formal adicness when a fibre is reduced; Gleason Definition 4.15: prekimberlites have representable, hence reduced, reduction.

*Needs:* D8.4, D7.11, D7.6.

(GLE, §3.2, Definition 3.15 and Proposition 3.16, p. 25.)

### D8.6 Reduction of Spd(A, A⁺) and of pre-adic spaces

**Theorem.** Let X be a pre-adic space over ℤ_p and X^na → X the reduced non-analytic adic space of its non-analytic locus (locally Spa(A/(A·A°°), integralClosure(image(A⁺ → A/(A·A°°))))). Then (X^na,♢)^red → (X^♢)^red is an isomorphism. For a Huber pair (A, A⁺) over ℤ_p, Spd(A, A⁺)^red is represented by Spec(A_red) with A_red = (A/A·A°°)^perf; in particular Spd(A)^red = Spec((A/I)^perf) for a formal Huber pair with ideal of definition I, and Spd(ℤ_p)^red = Spec 𝔽_p.

*Proof sketch.* A map Spec(R)^⋄ → X^♢ for R perfect is a map of pre-adic spaces Spa(R) → X (D7.11); it factors through the non-analytic locus, which is final among reduced non-analytic adic spaces over X (Gleason Proposition 1.19). Affinely use the quotient by the ideal A·A°° and the integral closure of the image of A⁺ in that quotient; this makes the intended quotient-pair construction of Proposition 1.19 precise. Any map to a discrete perfect ring kills this ideal and then factors uniquely through perfection.

For example, for (A, A⁺) = (C, O_C) a perfectoid field, A·A°° = C, so A_red = 0 and Spd(C, O_C)^red is empty. For (O_C, O_C), Spd(O_C)^red = Spec(k_C) with k_C the residue field. For A = 𝔽_p[t] discrete with A⁺ = A, A_red = 𝔽_p[`t^(1/p^∞)`].

Applications include SW20 Proposition 18.4.1 proof: (𝔛^♢)^red is the perfection of 𝔛_red; Gleason Proposition 4.17: formal schemes give prekimberlites.

*Needs:* D8.4, D7.11, DiamondsAndVStacks D6.6, Mathlib `PerfectClosure`.

(GLE, §1.3, Proposition 1.19, p. 9; §3.2, Lemma 3.17 and Proposition 3.18, p. 25; AGLR, §2.3, paragraph after Definition 2.19, p. 14.)

### D8.7 Quasiseparated diamonds have empty reduction

**Theorem.** If Y is a quasiseparated diamond then Y^red is empty: there is no map Spec(k)^⋄ → Y for k a perfect field, equivalently for k algebraically closed.

*Proof sketch.* Suppose f : Spec(k)^⋄ → Y, k algebraically closed; restrict to the sub-v-sheaf Y_y of points over the image y, a quasiseparated diamond with one point, so Y_y = Spa(C, O_C)/G for a profinite G (DiamondEtaleCohomology C8.24). Cover Spec(k)^⋄ by Spa(K₁, `O_(K₁)`) with K₁ an algebraic closure of k((`t^(1/p^∞)`)) and take a field K₂ ⊃ k with two embeddings of K₁ meeting in k; both composites to Y_y agree, which forces the image of C in K₂ to lie in k, contradicting the topologies.

For example, Spd(ℚ_p)^red = ∅ and (Spa(C, C⁺)^♢)^red = ∅ for a perfectoid field C. Non-example: the final v-sheaf \* = Spd(𝔽_p) is not a quasiseparated diamond and has reduction Spec 𝔽_p.

*Needs:* D8.4, DiamondsAndVStacks D4.1, DiamondsAndVStacks D5.1, DiamondsAndVStacks D3.10; DiamondEtaleCohomology C8.24.

(GLE, §3.2, Proposition 3.19 and proof, pp. 25–26.)

### D8.8 Formally adic morphisms of v-sheaves

**Definition.** A map f : F → G of small v-sheaves is formally adic if the square formed by the counits (F^red)^⋄ → F, (G^red)^⋄ → G and the maps (f^red)^⋄, f is Cartesian: (F^red)^⋄ = F ×_G (G^red)^⋄. Formally adic maps are stable under composition and base change.

*Proof sketch.* Composition: paste Cartesian squares. Base change: ⋄ and (−)^red commute with finite limits (D8.3, D8.4).

Its API includes the following facts.

- The predicate: the reduction square of f is a pullback.
- Formally adic maps compose.
- Base changes of formally adic maps are formally adic.
- Isomorphisms are formally adic.
- For formally adic f, (F^red)^⋄ = F ×_G (G^red)^⋄ as subsheaves when the counits are injective.
- The reduction square of any f commutes, by naturality of the counit.

**Checks.**

- Spd(ℤ_p[[T]]) → Spd(ℤ_p) with the (p, T)-adic topology is not formally adic: the fibre over Spd 𝔽_p contains the analytic points with p = 0, T ≠ 0.
- Spd(𝔽_p((t)), 𝔽_p[[t]]) → Spd(𝔽_p, 𝔽_p) with discrete topologies is adic as a map of adic spaces but not formally adic (Gleason Example 3.21).
- For K perfect nonarchimedean, Spd(K, O_K) → Spd(K_disc, O_K) from the norm topology to the discrete topology is formally adic, the source having empty reduction and empty fibre over Spec(K)^⋄, but it is not adic (Gleason Example 3.22).
- The identity of Spd ℤ_p is formally adic.
- For a p-adic formal pair (A, A), Spd(A) → Spd ℤ_p is formally adic, matching adicness of Spa(A) → Spa ℤ_p (Proposition 3.23).

For example, isomorphisms are formally adic.

Applications include Gleason Definition 3.27: formally closed immersions are formally adic closed immersions; Gleason Definition 4.26 and Theorem 4.27: étale formal neighbourhoods are formally adic étale maps; AGLR Definition 2.20(2), 2.23: π-adic prekimberlites are formally adic over Spd O; GLX §3.4: maps of integral shtuka moduli spaces are formally adic over Spd O_E.

*Needs:* D8.4, D8.3, Mathlib `CategoryTheory.IsPullback`.

(GLE, §3.2, Definition 3.20, Examples 3.21–3.22 and Proposition 3.24, pp. 26–27; AGLR, §2.3, Definition 2.20(1), p. 14.)

### D8.9 Formal adicness detects adicness for formal Huber pairs

**Theorem.** For formal Huber pairs (A, A) and (B, B) over ℤ_p with ideals of definition I_A, I_B and a continuous map B → A, Spa(A) → Spa(B) is adic (some I_A^m ⊂ A·I_B) if and only if Spd(A) → Spd(B) is formally adic. For a Huber pair (A, A⁺) with a map to Spa(ℤ_p), if Spd(A, A⁺) → Spd ℤ_p is formally adic then Spa(A, A⁺) → Spa(ℤ_p) is adic.

*Proof sketch.* The reduction square involves Spec(A_red) and (Spec(A/I_B A)^perf); adicness makes them agree after perfection. Conversely, formal adicness identifies the Zariski closed subsets of I_A and I_B·A in Spec A, so I_A is nil modulo I_B·A and, being finitely generated, I_A^m ⊂ I_B·A. For (A, A⁺): the analytic locus U^♢ → Spd(A, A⁺) is formally adic, since U^♢ is a quasiseparated diamond with empty reduction (D8.7) and the points of Spec(A_red)^⋄ (D8.6) have open support; composing, formal adicness forces the analytic locus to lie over Spd ℚ_p.

For example, ℤ_p[[T]] with the (p, T)-adic topology over ℤ_p with the p-adic topology: not adic and not formally adic. ℤ_p⟨T⟩ over ℤ_p: adic and formally adic.

*Needs:* D8.8, D8.6, D8.7, AdicSpacesPartIII F0.4.

(GLE, §3.2, Proposition 3.23 and Proposition 3.26, pp. 26–27.)

### D8.10 Formally p-adic v-sheaves, formally closed immersions and formally separated v-sheaves

**Definition.** A v-sheaf F over Spd ℤ_p is formally p-adic if F → Spd ℤ_p is formally adic. A map F → G is a formally closed immersion if it is a closed immersion (DiamondsAndVStacks D3) and formally adic. A v-sheaf F is formally separated if the diagonal F → F × F is a formally closed immersion; in particular it is separated.

*Proof sketch.* Unwind the definitions; stability of closed immersions and formally adic maps under composition and base change gives the same for formally closed immersions.

Its API includes the following facts.

- F → Spd ℤ_p is formally adic.
- Closed immersion and formally adic.
- The diagonal is formally closed.
- Composition of formally closed immersions.
- Base change of formally closed immersions.
- Formally separated implies separated.
- A formally closed subsheaf of a formally separated v-sheaf is formally separated.

**Checks.**

- Spd ℤ_p is formally separated (D8.11).
- Spd 𝔽_p → Spd ℤ_p is a formally closed immersion.
- The origin Spd(𝔽_p) → Spd(𝔽_p[[T]]), T ↦ 0, with the T-adic topology, is a formally closed immersion.
- The formal neighbourhood Spd(𝔽_p[[T]]) → Spd(𝔽_p[T]) of the origin (discrete target) is an open immersion and is not formally adic, since the base change of (Spd 𝔽_p[T]^red)^⋄ = Spd(𝔽_p[T]) is all of Spd(𝔽_p[[T]]) while its reduction is Spd(𝔽_p); so it is not formally closed.
- The empty v-sheaf is formally separated.

For example, formally closed immersions compose and are stable under base change.

Applications include Gleason Proposition 4.9: formal separatedness gives uniqueness of formalizations; Gleason Definition 4.11: specializing v-sheaves are formally separated; Gleason Proposition 4.41: formally closed subsheaves of kimberlites are kimberlites; AGLR Proposition 2.24: π-adic prekimberlites are formally separated.

*Needs:* D8.8, DiamondsAndVStacks D3.8.

(GLE, §3.2, Definitions 3.25 and 3.27, p. 27.)

### D8.11 Spd ℤ_p is formally separated and formally p-adic sheaves have formally adic diagonal

**Lemma.** Spd ℤ_p is formally separated. If F is formally p-adic then the diagonal F → F × F is formally adic.

*Proof sketch.* The diagonal of Spd ℤ_p pulls back along Spa(R, R⁺) → Spd ℤ_p × Spd ℤ_p to the locus where two untilts agree, the intersection of two closed Cartier divisors of Spa W(R⁺) minus V([ϖ]), a Zariski closed subset represented by a perfectoid space. (Spd ℤ_p × Spd ℤ_p)^red = Spec 𝔽_p and Spd(𝔽_p) `×_((Spd ℤ_p)²)` Spd ℤ_p = Spd 𝔽_p give formal adicness. For F formally p-adic: F `×_(Spd ℤ_p)` F → Spd ℤ_p is formally adic, the relative diagonal is formally adic by Cartesian-square generalities, and F `×_(Spd ℤ_p)` F → F × F is a base change of the diagonal of Spd ℤ_p.

For example, for F = Spd(A) with A a p-adic formal ring the diagonal is formally adic.

*Needs:* D8.10, D8.6, DiamondsAndVStacks D6.1, PerfectoidSpaces P1.22.

(GLE, §3.2, Lemma 3.28 and Proposition 3.29, p. 27.)

### D8.12 Injectivity of the reduction counit and the formally-adic criterion

**Lemma.** For a small v-sheaf F the diagonal F → F × F is formally adic iff the counit (F^red)^⋄ → F is injective; in that case a section m ∈ F(A, A⁺) lies in (F^red)^⋄ iff v-locally on Spa(A, A⁺) it extends along Spa(R, R⁺) → Spec(R⁺)^⋄ to a map Spec(R⁺)^⋄ → F. If (G^red)^⋄ → G is injective and F ×_G (G^red)^⋄ is represented by a reduced scheme-theoretic v-sheaf, then any f : F → G is formally adic.

*Proof sketch.* A map of sheaves is injective iff its diagonal square is Cartesian; (F^red)^⋄ is the sheafification of (R, R⁺) ↦ Hom(Spec(R⁺)^⋄, F). For the criterion: with T reduced and T^⋄ = F ×_G (G^red)^⋄, compute (T^⋄)^red = F^red `×_(G^red)` ((G^red)^⋄)^red = F^red using the triangle identities, so (F^red)^⋄ = T^⋄.

For example, Spd(A) for a formal Huber pair satisfies the criterion with (Spd A^red)^⋄ = Spec(A_red)^⋄.

*Needs:* D8.4, D8.8, D8.5.

(GLE, §3.2, Lemma 3.30 and Lemma 3.32, pp. 27–28.)

### D8.13 Formally closed subsheaves of Spd(A) have reduction Spec(A/J)

**Lemma.** Let (A, A) be a formal Huber pair over ℤ_p and F → Spd(A) a formally closed immersion. Then (F^red)^⋄ = Spec(A/J)^⋄ for some open ideal J ⊂ A; in particular F^red is represented by the perfection of a closed subscheme of Spec(A_red).

*Proof sketch.* Pull back F → Spd(A) to a v-cover by totally disconnected perfectoid spaces. On each such space the parent classifies closed sub-v-sheaves by weakly generalizing closed subsets. Descent for closed immersions and for subobjects gives the corresponding closed subset |F| in Spo(A,A); this does not assume that Spd(A) itself is totally disconnected. By formal adicness |(F^red)^⋄| = |F| ∩ |Spec(A_red)^⋄|, and by D8.12 it is a schematic closed subset of Spo(A, A). D7.9 identifies it with V(J) for an open ideal J.

For example, for F = Spd(A/J) with J open (A/J discrete), F^red = Spec((A/J)^perf), which depends only on the radical of J.

Applications include Gleason Proposition 4.9: uniqueness of formalizations; Gleason Proposition 4.41: formally closed subsheaves of prekimberlites.

*Needs:* D8.10, D8.12, D7.9, D8.6, DiamondsAndVStacks D3.7, DiamondsAndVStacks D3.9, DiamondsAndVStacks D4.9.

(GLE, §3.2, Lemma 3.31 and proof, pp. 27–28.)

### Examples

Reduction sends Spd ℤ_p to Spec 𝔽_p and Spd ℚ_p to ∅. For Spd(ℤ_p[[T]]) with the (p,T)-adic topology, reduction is a point but the fibre over Spd 𝔽_p also has T ≠ 0 analytic points. This computes the failure of formal adicness of its structure map, in contrast with Spd(ℤ_p⟨T⟩) (GLE Proposition 3.23; the discrete-pair contrast Spd(𝔽_p((t)), 𝔽_p[[t]]) → Spd 𝔽_p is GLE Example 3.21).

### Dependencies

D7; DiamondsAndVStacks D0–D6; DiamondEtaleCohomology C8.24; ArcTopologyAndDescent §§1.5–1.7; PrismaticCohomology §2.0; SchemeKTheoryOperations §4.10; AdicSpacesPartIII F0.4; Mathlib adjunctions and pullbacks.

## Layer D9: Specializing v-sheaves, prekimberlites and formal neighbourhoods

A v-sheaf behaves like a formal scheme when its maps from perfectoid spaces formalize, uniquely by formal separatedness. Such specializing v-sheaves carry a continuous specialization map to the space of their reduction; prekimberlites add that the reduction is a scheme embedded as a closed subsheaf. Formal neighbourhoods, Heuer's thickening and the specialization morphism SP_F give étale formal neighbourhoods, which recover the étale site of the reduction.

### D9.1 The specialization map of a Tate Huber pair

**Construction.** For a Tate Huber pair (A, A⁺) (a Tate ring A with a ring of integral elements A⁺; neither completeness nor a ℤ_p-algebra structure is needed, the applications use pairs over ℤ_p), sp_A : |Spa(A, A⁺)| → |Spec(A⁺/A°°)| sends x to the prime {a ∈ A⁺ : |a(x)| < 1} of A⁺, which contains A°° (= A⁺°°, an ideal of A⁺ because A⁺ ⊂ A°) and so is a point of the closed subspace V(A°°) = Spec(A⁺/A°°) of Spec A⁺. It is functorial in maps of Tate Huber pairs, continuous, surjective, spectral and closed; for a strictly totally disconnected perfectoid Spa(R, R⁺) it is a homeomorphism.

Define `reductionSpectrum A⁺` as the subspace of `PrimeSpectrum A⁺` of primes containing every element of A⁺ topologically nilpotent in A; it is the closed subset V(A°°), canonically homeomorphic to Spec(A⁺/A°°). Prove `exists_tate_specialization`: for A with `TauCeti.Huber.IsTateRing` and P a `TauCeti.Huber.Pair` on A, there is a map sp from `TauCeti.ValuationSpectrum.spa P.plus` to `reductionSpectrum P.plus` characterized by a ∈ sp(x) ⟺ |a(x)| < 1 for every a ∈ A⁺, and this map is surjective, spectral (`IsSpectralMap`) and closed (BHA17 Remark 7.4.12 for continuity and spectrality, and Theorem 8.1.2, which identifies Spa(A, A⁺) with the inverse limit of the special fibres of the proper models of Spec A⁺ that are isomorphisms over Spec A, for surjectivity and closedness). The characterization determines sp, so the existential statement is the theorem about the specialization map itself.

When p ∈ A°°, for instance for pairs over (ℚ_p, ℤ_p) and for pairs of characteristic p, A⁺/A°° is an 𝔽_p-algebra and its perfection A⁺_red = (A⁺/A°°)^perf has the same underlying space; this is the target written in the applications. For an arbitrary Tate pair no perfection is available and the target is Spec(A⁺/A°°) itself: for (ℚ((t)), ℚ[[t]]) the quotient is ℚ, on which the p-th power map is not additive. For perfectoid pairs A°° is the radical of a pseudouniformizer.

*Proof sketch.* The set {a ∈ A⁺ : |a(x)| < 1} is a prime ideal since |·(x)| is multiplicative and ≤ 1 on A⁺; it contains the topologically nilpotent elements. Continuity, surjectivity, spectrality and closedness: the specialization theorem stated in Gleason Proposition 4.2, through the description of Spa(A, A⁺) as an inverse limit over formal models. Strictly totally disconnected case: points with the same image lie in the same connected component; components are Spa(C, C⁺) (DiamondsAndVStacks D1.4), where sp is the bijection between points of Spa(C, C⁺) and primes of C⁺ above m_C (valuation rings between C⁺ and O_C).

Its API includes the following facts.

- The map |Spa(A, A⁺)| → |Spec(A⁺/A°°)|, x ↦ {a ∈ A⁺ : |a(x)| < 1}.
- The value at x is a prime ideal of A⁺ containing A⁺°°.
- sp_A is continuous; the preimage of D(a) is {|a| = 1}.
- sp_A is surjective.
- sp_A is a spectral and closed map of spectral spaces.
- sp_B ∘ |Spa(f)| = |Spec(f̄⁺)| ∘ sp_A for a map of Tate pairs f : (B, B⁺) → (A, A⁺), where f̄⁺ : B⁺/B°° → A⁺/A°° is induced by f⁺ (topologically nilpotent elements map to topologically nilpotent elements).
- For Spa(R, R⁺) strictly totally disconnected perfectoid, sp_R is a homeomorphism.

**Checks.**

- For a perfectoid field (C, O_C), sp sends the point to the maximal ideal of O_C.
- For (C, C⁺) with C⁺ of rank two, Spa(C, C⁺) has two points and sp is a bijection onto the two primes of C⁺ above m_C, the closed point going to the maximal ideal of C⁺.
- For the closed unit disc Spa(C⟨T⟩, O_C⟨T⟩) the Gauss point maps to the generic point of Spec k_C[T].
- For the empty Tate pair (the zero ring) sp is the empty map.
- For the closed disc sp is not injective: the classical points of the open disc |T| < 1 all map to the origin.
- The specialization ideal of a bounded valuation on A⁺ excludes 1, since v(1) = 1; using a non-strict inequality would include 1 and give the wrong ideal.
- A unit of A⁺ has value 1 and is not in the specialization ideal, so the ideal is proper and different from A⁺.
- For (ℚ((t)), ℚ[[t]]) with the t-adic topology, a Tate pair that is not a ℤ_p-algebra, A°° = tℚ[[t]] and the target is Spec(ℚ[[t]]/(t)) = Spec ℚ, one point; sp sends the unique point of Spa(ℚ((t)), ℚ[[t]]) (the t-adic valuation; the only valuation rings of ℚ((t)) containing ℚ[[t]] are ℚ[[t]] and the field) to (t): one point to one point, surjective and closed. A target defined through a Frobenius on the quotient would be meaningless here: in ℚ, (1 + 1)² = 4 ≠ 2 = 1² + 1².

For example, for (C, O_C) a perfectoid field sp_C maps the unique point to the closed point of Spec(k_C).

Applications include Gleason Definition 4.12: descends to the specialization map of specializing v-sheaves; Gleason Proposition 4.9: surjectivity forces formally closed subsheaves with dense generic fibre to be everything; AGLR Proposition 2.32: surjectivity of sp_A for A integrally closed in A[1/π].

*Needs:* Tau Ceti `TauCeti.ValuationSpectrum.spa`, Tau Ceti `TauCeti.Huber.Pair`, Tau Ceti `TauCeti.Huber.IsTateRing`, Mathlib `Valuation`, Mathlib `Ideal.IsPrime`, Mathlib `PrimeSpectrum`, Mathlib `IsSpectralMap`, Mathlib `IsTopologicallyNilpotent`, DiamondsAndVStacks D1.4, AdicSpacesPartII R0.19.3.

(GLE, §4.1, Definition 4.1, Propositions 4.2 and 4.3, p. 28; BHA17, Remark 7.4.12 and Theorem 8.1.2 with proof, pp. 74–89.)

### D9.2 Formalizations and v-formalizing v-sheaves

**Definition.** Let F be a small v-sheaf, (A, A⁺) a Tate Huber pair and f : Spd(A, A⁺) → F. A formalization of f is a map t : Spd(A⁺) → F restricting to f, where Spd(A⁺) = Spd(A⁺, A⁺) with the ϖ-adic topology. F formalizes f if one exists, v-formalizes f if f becomes formalizable after a v-cover Spa(B, B⁺) → Spa(A, A⁺); F is formalizing if it formalizes all maps from affinoid perfectoid spaces and v-formalizing if it v-formalizes all of them. F is v-locally formal if there is a surjection ⨿_i Spd(B_i) → F from formal Huber pairs over ℤ_p; this is equivalent to v-formalizing, and to the existence of a surjection ⨿_j Spd(R_j⁺) → F from perfectoid pairs.

*Proof sketch.* Spd ℤ_p and Spd(B) for formal Huber pairs are formalizing: a map Spa(A, A⁺) → Spd ℤ_p is an untilt, given by a primitive ξ ∈ W(R⁺), which defines Spd(R⁺) → Spd ℤ_p (Gleason Lemma 4.7). v-formalizing implies v-locally formal by refining a surjection from affinoid perfectoid spaces; the converse because maps into Spd(B_i) formalize. Permanence (Gleason Proposition 4.8): images of v-formalizing sheaves under surjections are v-formalizing; S^⋄ is formalizing for perfect affine S and v-formalizing for any scheme-theoretic v-sheaf; nonempty v-formalizing sheaves have nonempty reduction, so nonempty quasiseparated diamonds are not v-formalizing.

Its API includes the following facts.

- F formalizes f : Spd(A, A⁺) → F.
- Every map from an affinoid perfectoid space v-locally formalizes.
- A surjection from a disjoint union of Spd of formal Huber pairs.
- Being v-formalizing is equivalent to being v-locally formal.
- Spd(B) is formalizing for every formal Huber pair (B, B) over ℤ_p.
- Images of v-formalizing sheaves under surjections are v-formalizing.
- A nonempty v-formalizing sheaf has nonempty reduction.

**Checks.**

- Spd ℤ_p is formalizing.
- Spd ℚ_p is not v-formalizing: its reduction is empty.
- For a perfect affine scheme S, S^⋄ is formalizing; for X a scheme-theoretic v-sheaf, X^⋄ is v-formalizing.
- The empty v-sheaf is v-formalizing (the empty formal presentation covers it), whereas Spd ℚ_p is not. Both reductions are empty, but their point sets have cardinalities 0 and 1, respectively.

For example, Spd(O_C) is formalizing; Spd(C, O_C) is not v-formalizing.

Applications include Gleason Definition 4.11: specializing v-sheaves are v-locally formal; Gleason Remark 4.13: computing sp_F through a formalized representative; AGLR Definition 2.23: π-adic prekimberlites; GLX §3.4: integral shtuka moduli are v-locally formal through Demazure resolutions with A_inf coefficients.

*Needs:* D8.4, D8.7, D8.12, DiamondsAndVStacks D6.6, PerfectoidSpaces P1.22, DiamondsAndVStacks D2.2.

(GLE, §4.2, Definitions 4.5 and 4.6, Lemma 4.7 and Proposition 4.8, pp. 28–29; AGLR, §2.3, Definition 2.21 and Proposition 2.22, pp. 14–15.)

### D9.3 Formalizations into a formally separated v-sheaf are unique

**Theorem.** If F is formally separated and f : Spa(R, R⁺) → F is a map from an affinoid perfectoid space of characteristic p, then f has at most one formalization Spd(R⁺) → F. Fibre products of v-formalizing sheaves over a formally separated sheaf are v-formalizing, and v-formalizing formally separated v-sheaves are stable under fibre products and contain Spd ℤ_p.

*Proof sketch.* Two formalizations g₁, g₂ define Spd(R⁺) → F × F; the pullback of the diagonal is a formally closed subsheaf G ⊂ Spd(R⁺) containing Spa(R, R⁺). By D8.13, G^red is a closed subscheme of Spec(R⁺_red); it contains the formal specializations of all geometric points, so by surjectivity of D9.1 it is everything. Hence |G| = |Spd(R⁺)| and G = Spd(R⁺), so g₁ = g₂. The fibre-product statements follow by choosing compatible formalizations and D8.11.

For example, for F = Spd(O_C) every map from Spa(C, O_C) has the unique formalization Spd(O_C) → Spd(O_C).

*Needs:* D8.10, D8.13, D9.1, D9.2, D8.11.

(GLE, §4.2, Proposition 4.9 and Proposition 4.10, p. 29.)

### D9.4 Specializing v-sheaves

**Definition.** A small v-sheaf F is specializing if it is formally separated and v-locally formal. Specializing v-sheaves are stable under fibre products and contain Spd ℤ_p and Spd(B) for every formal Huber pair over ℤ_p.

*Proof sketch.* Stability: D9.3.

Its API includes the following facts.

- Formally separated and v-locally formal.
- Fibre products of specializing sheaves are specializing.
- Spd(B) is specializing for formal Huber pairs over ℤ_p.
- Maps from affinoid perfectoid spaces have at most one formalization.

**Checks.**

- Spd ℤ_p is specializing.
- Spd ℚ_p is formally separated but not v-locally formal, so not specializing.
- The empty v-sheaf is specializing.
- Spd 𝔽_p = Spec(𝔽_p)^⋄ is specializing.

For example, Spd ℤ_p is specializing.

Applications include Gleason Definition 4.12: these are the v-sheaves with a specialization map; Gleason Definition 4.15: prekimberlites are specializing; Gleason Proposition 4.41: formally closed subsheaves of specializing sheaves are specializing.

*Needs:* D8.10, D9.2, D9.3.

(GLE, §4.2, Definition 4.11 and Proposition 4.10, p. 29.)

### D9.5 The specialization map sp_F : |F| → |F^red|

**Construction.** For a specializing v-sheaf F, sp_F : |F| → |F^red| is the unique map such that for every surjection ⨿ Spd(B_i) → F from formal Huber pairs, sp_F composed with |Spd(B_i)| → |F| equals |f^red| composed with the specialization |Spd(B_i)| → |Spec((B_i)_red)|. Concretely, represent x ∈ |F| by a formalizable Spa(K, K⁺) → F, take its unique formalization Spd(K⁺) → F, apply (−)^red to get Spec((K⁺)_red) → F^red, and take the image of the closed point. sp_F is continuous and functorial in maps of specializing v-sheaves.

*Proof sketch.* Well defined and independent of choices by D9.3 (Gleason Remark 4.13). Continuity: in the square with a cover ⨿ Spd(R_i⁺) → F, the left map is a quotient map, f^red is continuous (D8.2) and the `sp_(R_i⁺)` are continuous (D9.1).

Its API includes the following facts.

- The continuous map |F| → |F^red| of a specializing F.
- For F = Spd(B) with B formal, sp_F on |Spd(B)| restricted to the analytic locus is the Tate specialization of D9.1 composed with Spec of the reduction.
- |f^red| ∘ sp_F = sp_G ∘ |f| for f : F → G of specializing sheaves.
- sp_F is continuous.
- On |(F^red)^⋄| ⊂ |F| (when the counit is injective), sp_F is the canonical map |(F^red)^⋄| → |F^red|.

**Checks.**

- `sp_(Spd ℤ_p)` sends both points of |Spd ℤ_p| to the point of Spec 𝔽_p.
- For F = Spd(ℤ_p⟨T⟩), sp sends the Gauss point of the generic fibre to the generic point of Spec 𝔽_p[T]^perf and a classical point T = a, |a| ≤ 1, to the closed point T = ā.
- For F empty, sp_F is the empty map.
- sp_F is not injective: for F = Spd(ℤ_p⟨T⟩) all classical points of a residue disc |T − a| < 1 map to the same closed point T = ā.

For example, for F = Spd(O_C), sp_F maps both points to the point of Spec k_C.

Applications include SW20 Proposition 18.4.1 proof: the closure of a classical point meets the special fibre in sp of it; GLX ¶6 and (3.4): specialization triples of prekimberlites and agreement with formal schemes; Gleason Lemma 4.55: π₀(sp_D) is a bijection for topologically normal rich pairs; AGLR Proposition 2.27: functoriality of (X_η, X^red, sp).

*Needs:* D9.4, D9.3, D9.1, D8.2, D8.4, DiamondsAndVStacks D4.5 and D4.8.

(GLE, §4.2, Definition 4.12, Remark 4.13 and Proposition 4.14, p. 30.)

### D9.6 Prekimberlites and their analytic locus

**Definition.** A prekimberlite is a specializing v-sheaf F such that F^red is represented by a (perfect) scheme and the counit (F^red)^⋄ → F is a closed immersion. Its analytic locus is the open complement F^an = F ∖ (F^red)^⋄.

*Proof sketch.* The complement of a closed immersion is an open subsheaf (DiamondsAndVStacks D3.8 and D4.8).

Its API includes the following facts.

- Specializing, representable reduction, closed counit.
- The open analytic locus F^an.
- The perfect scheme representing F^red.
- The counit (F^red)^⋄ → F is a formally closed immersion.
- |F| = |F^an| ⊔ |(F^red)^⋄| as sets, with |F^an| open.

**Checks.**

- Spd ℤ_p is a prekimberlite with reduction Spec 𝔽_p and analytic locus Spd ℚ_p.
- Spd(ℤ_p⟨T⟩) is a prekimberlite with reduction Spec 𝔽_p[T]^perf and analytic locus the diamond of the closed disc over ℚ_p.
- A nonempty quasiseparated diamond is not a prekimberlite: it is not v-formalizing.
- The empty v-sheaf is a prekimberlite with empty reduction.

For example, for a prekimberlite F the counit (F^red)^⋄ → F is a formally closed immersion.

Applications include Gleason Definition 4.18: formal neighbourhoods of locally closed subschemes of F^red; Gleason Definition 4.26 and Theorem 4.27: the étale site of F^red is recovered by étale formal neighbourhoods; GLX ¶5–6, §3.4: integral models of local Shimura varieties and their specialization triples; Gleason Definition 4.30: valuative prekimberlites.

*Needs:* D9.4, D8.5, DiamondsAndVStacks D3.8, DiamondsAndVStacks D4.8.

(GLE, §4.3, Definition 4.15, p. 30; AGLR, §2.3, Definition 2.23 and Proposition 2.24, p. 15.)

### D9.7 Formal schemes give prekimberlites

**Theorem.** Let 𝔛 be a separated formal scheme over ℤ_p, locally Spf A with A complete and separated for a finitely generated ideal of definition I containing p, and let 𝔛^ad = t(𝔛) be its pre-adic space. Then 𝔛^♢ := (𝔛^ad)^♢ is a prekimberlite with (𝔛^♢)^red = (𝔛_red)^perf, its counit is the closed immersion ((𝔛_red)^perf)^⋄ → 𝔛^♢ of the non-analytic locus, and (𝔛^♢)^an = (𝔛^ad_a)^♢ is the diamond of the analytic locus.

Here formal schemes have the Zariski-sheaf description on p-nilpotent algebras of GLE Convention 1, without local noetherianity, using AdicSpacesPartIII F0.3's finite-ideal carrier: a formal scheme is the colimit of its thickenings, locally Spec(A/Iⁿ⁺¹), and its morphisms are the compatible systems of morphisms of thickenings (AdicSpacesPartIII F0.3, *thickening-colimit-finite-ideal-type* and *morphisms-as-compatible-systems-finite-ideal-type*), so Spf A has the value colimₙ Hom(A/Iⁿ, B) on Spec B for B with p nilpotent. Separated means 𝔛_red is a separated scheme. The reduction interface and fully faithful pre-adic comparison t use AdicSpacesPartIII F0.3/R2.3 (gap:finite-ideal-formal-schemes); t restricts on locally noetherian objects to R2.3's functor.

*Proof sketch.* v-locally formal: 𝔛^♢ is covered by the Spd(A) of affine opens Spf A. Reduction: D8.6 gives (𝔛^♢)^red = (𝔛^na,♢)^red = (𝔛_red)^perf; the counit is the map of the non-analytic locus, a closed immersion (Gleason Proposition 1.21(6); DiamondsAndVStacks D6.6 the formal complement comparison). Separatedness over Spd ℤ_p: quasiseparatedness from quasicompactness of affine intersections and representability of the diagonal; the valuative criterion (DiamondsAndVStacks D3) reduces to separatedness of 𝔛_red via maps Spf(K⁺) → 𝔛 as pairs of a map from Spf(O_K) and a map from Spec(K⁺/K°°). The closed counit already established is a monomorphism. Apply D8.12 to obtain formal adicness of the diagonal, and combine it with separatedness proved above. This proves formal separatedness without assuming that the structure map to Spd ℤ_p is formally p-adic.

For example, for 𝔛 = Spf ℤ_p⟨T⟩ the prekimberlite is Spd(ℤ_p⟨T⟩) with reduction the perfect affine line. For 𝔛 = Spf ℤ_p[[T]] ((p, T)-adic) the analytic locus contains points with p = 0 and T ≠ 0, so (𝔛^♢)^an ≠ (𝔛^♢)_η.

**Checks.**

- For A = O_C, C a completed algebraic closure of ℚ_p, the ideal (p) is a defining ideal although A is nonnoetherian. The reduction is Spec k_C, the analytic part is Spd(C,O_C), and specialization is 1 → 1.
- For ℤ_p[[T]] with ideal (p,T), reduction is Spec 𝔽_p and the analytic part contains the characteristic-p point T ≠ 0; it is larger than the ℚ_p-generic fibre.
- The empty formal scheme has empty reduction and analytic part. The doubled-origin formal affine line has nonseparated reduction and is outside the stated separated category.

Applications include SW20 Proposition 18.4.1: the source category of the full-faithfulness theorem; Gleason Corollary 4.28: étale formal neighbourhoods of formal schemes are formal schemes.

*Needs:* D9.6, D8.6, D8.11, AdicSpacesPartIII F0.3, AdicSpacesPartIII F0.3 *thickening-colimit-finite-ideal-type*, AdicSpacesPartIII F0.3 *morphisms-as-compatible-systems-finite-ideal-type*, AdicSpacesPartIII R2.3, DiamondsAndVStacks D6.6, DiamondsAndVStacks D3.8, D8.12, AdicSpacesPartIII F0.3/R2.3 (gap:finite-ideal-formal-schemes).

(GLE, §4.3, Convention 1, Proposition 4.16 and Proposition 4.17 with proof, pp. 30–31; SW13, §2.2, Proposition 2.2.1, p. 15.)

### D9.8 Formal neighbourhoods of locally closed subsets of the reduction

**Definition.** Let F be a prekimberlite and S ⊂ |F^red| a locally closed subset with its reduced perfect subscheme structure. Write underline(T) for the v-sheaf U ↦ Cont(|U|,T), as in Gleason §1.1. The formal neighbourhood is the sheaf pullback `F̂_(/S)` = F `×_(underline(|F^red|))` underline(S), using the natural specialization morphism to this topological sheaf. This condition concerns the entire image of each perfectoid test space; it does not identify |`F̂_(/S)`| with `sp_F^(-1)`(S) on individual points. For a map of prekimberlites G → F and T = S `×_(F^red)` G^red, `F̂_(/S)` ×_F G = `Ĝ_(/T)`; `F̂_(/S)` is a prekimberlite with reduction S. It is open when S is open. For a formal pair (A,A), with ideal of definition I and finitely generated J ⊃ I, it is Spd(Â_J) over V(J), where Â_J is the J-adic completion.

*Proof sketch.* The pullback is taken in v-sheaves, with the topological factors underlined; a section lies in it precisely when its continuous specialization map on the entire test space lands in S. Rank-higher-than-one generizations explain why this is stronger than membership of one point in `sp_F^(-1)`(S). Base change: |T| = |S| `×_(|F^red|)` |G^red| and naturality of sp (Gleason Proposition 4.20). Prekimberlite: formal separatedness is inherited by subsheaves; v-formalizing because formalizations specialize into S; the closed immersion S^⋄ → `F̂_(/S)` is checked for S closed (proper inclusion) and S open, then composed (Proposition 4.21). Completion: maps A → R⁺ whose reduction lands in V(J) send J into a topologically nilpotent ideal, hence are J-adically continuous and extend to B (Proposition 4.19).

Its API includes the following facts.

- The subsheaf `F̂_(/S)` for S ⊂ |F^red| locally closed.
- `F̂_(/S)` ×_F G = `Ĝ_(/T)` with T = S `×_(F^red)` G^red.
- For a morphism G → F of prekimberlites, factorization through `F̂_(/S)` is equivalent to factorization of G^red → F^red through S. The restriction to prekimberlite sources is essential.
- `F̂_(/S)` is a prekimberlite with (`F̂_(/S)`)^red = S.
- `Spd(A)^_(/V(J))` = Spd(Â_J) for formal (A, A) and finitely generated J ⊃ I.
- `F̂_(/|F^red|)` = F.

**Checks.**

- For F = Spd(ℤ_p⟨T⟩) and S the origin of Spec 𝔽_p[T]^perf, `F̂_(/S)` = Spd(ℤ_p[[T]]) with the (p, T)-adic topology.
- For S = ∅ the formal neighbourhood is empty.
- For a perfect k-algebra A and S = V(a₁, …, a_n) ⊂ Spec A, |S^⋄| ⊊ |`Spd(A)^_(/S)`| ⊊ `sp^(-1)`(S) in general: the middle set is where the a_i are topologically nilpotent, the last where |a_i| < 1 (AGLR Example 2.29).
- For a noetherian formal scheme 𝔛 and a closed T ⊂ 𝔛_red, `(𝔛^♢)^_(/T^perf)` = (`𝔛_(/T)`)^♢ for the formal completion of AdicSpacesPartIII F0.

For example, for S = |F^red| the formal neighbourhood is F.

Applications include Gleason Definition 4.38: tubular neighbourhoods `D^⊚_(/S)` = `F̂_(/S)` ×_F D; GLX ¶7, (3.10): the local model correspondence between tubes of integral shtuka moduli and local models; AGLR Proposition 2.39: tubes at closed points detect normality.

*Needs:* D9.6, D9.5, AdicSpacesPartIII F0.5, DiamondsAndVStacks D3.10.

(GLE, §1.1, topological v-sheaves, p. 7; §4.3, Definition 4.18, Propositions 4.19–4.21, p. 31; AGLR, §2.3, Definition 2.28, p. 15, and Example 2.29, p. 16.)

### D9.9 Constructible formal neighbourhoods are open

**Theorem.** If F is a prekimberlite and S ⊂ |F^red| is locally closed and constructible, then `F̂_(/S)` → F is an open immersion. For S closed with ideal (i₁, …, i_n) locally, and a formalized test map Spd(R⁺) → F with lifts j_k ∈ R⁺, the base change is the open locus where all j_k are topologically nilpotent. It is formally adic when S is open, and need not be otherwise.

*Proof sketch.* The question is Zariski local on F^red; reduce to S closed constructible in Spec A, defined by a finitely generated ideal. Over a formalized test object, D9.8 (completion case) and the analytic-localization description of the olivine spectrum (Gleason Lemma 2.24) identify the base change with ⋂ `N_(j_k≪1)`, an open subsheaf. Openness descends along v-covers (DiamondsAndVStacks D3.9).

For example, for S the origin of the perfect affine line over 𝔽_p, Spd(𝔽_p[[T]]) → Spd(𝔽_p[T]) is an open immersion that is not formally adic.

*Needs:* D9.8, D7.8, DiamondsAndVStacks D3.9.

(GLE, §4.3, Proposition 4.22 with proof and footnote 1 of the introduction, pp. 5, 32; AGLR, §2.3, Proposition 2.30, p. 16.)

### D9.10 Heuer's v-sheaf `X^(⋄/◦)` of a perfect scheme

**Construction.** For a scheme X over 𝔽_p, `X^(⋄/◦)` is the analytic sheafification of (R, R⁺) ↦ X(Spec(R⁺/R°°)) on affinoid perfectoid spaces; for affine X no sheafification is needed. It is a v-sheaf commuting with finite limits and open immersions, with a natural map X^⋄ → `X^(⋄/◦)`. For X perfect, (`X^(⋄/◦)`)^red = X, and `X^(⋄/◦)`(Spa(R, R⁺)) = `X^(⋄/◦)`(Spd(R⁺)) for totally disconnected Spa(R, R⁺): maps from totally disconnected spaces formalize uniquely.

*Proof sketch.* v-sheaf property: the v-sheaf assertion recalled with Gleason Definition 4.23. Reduction: X ⊂ (`X^(⋄/◦)`)^red is formal; for the converse test against Spd(R((`t^(1/p^∞)`)), R[[`t^(1/p^∞)`]]) where Heuer's lemma computes the values as maps A → R (Gleason Proposition 4.24). Totally disconnected tests: compute on the cover of the analytic locus of Spd(R⁺[[`t^(1/p^∞)`]]) by U(ϖ/t), U(t/ϖ) and glue; the delicate gluing reduces to valuation rings as in D7.11.

Its API includes the following facts.

- The v-sheaf `X^(⋄/◦)`.
- `Spec(A)^(⋄/◦)`(Spa(R, R⁺)) = Hom(A, R⁺/R°°).
- (`X^(⋄/◦)`)^red = X for X perfect.
- X ↦ `X^(⋄/◦)` preserves finite limits and open immersions.
- The natural transformation X^⋄ → `X^(⋄/◦)`.
- For totally disconnected Spa(R, R⁺), `X^(⋄/◦)`(Spa(R, R⁺)) = `X^(⋄/◦)`(Spd(R⁺)).

**Checks.**

- `Spec(𝔽_p)^(⋄/◦)` is the final v-sheaf.
- `Spec(𝔽_p[t])^(⋄/◦)`(Spa(R, R⁺)) = R⁺/R°°, so a point t ↦ f with f topologically nilpotent maps to the origin.
- `X^(⋄/◦)` is not formally separated in general (Gleason, proof of Theorem 4.27), so it is not a prekimberlite even though its reduction is X.
- The empty scheme gives the empty v-sheaf.

For example, for X = Spec 𝔽_p both X^⋄ and `X^(⋄/◦)` are the final v-sheaf.

Applications include Gleason §4.4: target of Heuer's specialization morphism SP_F; Gleason Definition 4.30: valuativity is partial properness of SP_F; Gleason Theorem 4.27: étale formal neighbourhoods F `×_((F^red)^(⋄/◦))` `V^(⋄/◦)`.

*Needs:* D7.4, D8.4, D7.11, DiamondsAndVStacks D1.1, DiamondsAndVStacks D2.2.

(GLE, §4.4, Definition 4.23 and Proposition 4.24 with proof, pp. 32–33.)

### D9.11 The specialization morphism SP_F : F → `(F^red)^(⋄/◦)`

**Construction.** For a prekimberlite F, SP_F : F → `(F^red)^(⋄/◦)` sends a formalizable map Spa(R, R⁺) → F to the reduction Spec(R⁺_red) → F^red of its unique formalization; this defines a natural transformation, separated, and for S ⊂ |F^red| locally closed `F̂_(/S)` = F `×_((F^red)^(⋄/◦))` `S^(⋄/◦)`. On underlying spaces it recovers sp_F.

*Proof sketch.* Well defined by D9.3 and v-descent; the formula for formal neighbourhoods by comparing the two descriptions on formalized test objects. Separatedness: F is formally separated and `(F^red)^(⋄/◦)` formalizes totally disconnected spaces uniquely (D9.10).

Its API includes the following facts.

- The natural transformation F → `(F^red)^(⋄/◦)`.
- On spaces, the composite |F| → |`(F^red)^(⋄/◦)`| → |F^red| is sp_F.
- `F̂_(/S)` = F `×_((F^red)^(⋄/◦))` `S^(⋄/◦)`.
- SP_F is separated.
- SP is natural in maps of prekimberlites.

**Checks.**

- For F = Spd ℤ_p, SP_F is the map to `Spec(𝔽_p)^(⋄/◦)` = \*.
- For F = Spd(ℤ_p⟨T⟩), the classical point T = a over C maps to the point T ↦ ā of `Spec(𝔽_p[T])^(⋄/◦)`.
- For F empty, SP_F is the empty map.
- SP_F carries more information than sp_F: its fibres are v-sheaves, e.g. the fibre of SP over the origin for Spd(ℤ_p⟨T⟩) is the formal neighbourhood Spd(ℤ_p[[T]]), not a set of points.

For example, for F = Spd(A) formal, SP_F sends Spa(R, R⁺) with A → R⁺ to the induced A_red → R⁺/R°°.

Applications include Gleason Definition 4.30: valuative prekimberlites: SP_F partially proper; Gleason Theorem 4.27: étale formal neighbourhoods are base changes along SP_F; AGLR Definition 2.25: π-adic kimberlites require SP_X partially proper.

*Needs:* D9.6, D9.10, D9.3, D9.8.

(GLE, §4.4, paragraph after Proposition 4.24 and before Lemma 4.25; paragraph before Definition 4.30, pp. 33–34.)

### D9.12 Étale maps of perfect schemes give formally adic étale maps of Heuer sheaves

**Lemma.** For a quasicompact separated étale map V → X of perfect 𝔽_p-schemes, `V^(⋄/◦)` → `X^(⋄/◦)` is separated, quasicompact, formally adic and étale. On affine tests Spa(R,R⁺), use the unique completed formally étale lift of the prescribed étale algebra over the reduced integral ring. Its generic fibre, with the canonical integral subring, represents the pullback; work on affine étale charts and glue. Uniqueness is in the category of complete formal lifts, not among all ordinary étale R⁺-algebras.

*Proof sketch.* X ↦ `X^(⋄/◦)` commutes with finite limits and open immersions; separatedness from the open-and-closed diagonal. For formal adicness, compare V^⋄ with `V^(⋄/◦)` `×_(X^(⋄/◦))` X^⋄ on formalized tests. Put A = R⁺ and I = (ϖ). The prescribed étale algebra over R⁺/R°° = (R⁺/ϖ)_red is transported along the universal homeomorphisms of perfection and of the nil-ideal quotient (SchemeAndStackFoundations §§0.23a–0.24) and lifts uniquely to compatible étale schemes over R⁺/ϖⁿ⁺¹ for every n, an adic inductive system; AdicSpacesPartIII F0.3, *adic-systems-equivalence-finite-ideal-type*, which has no noetherian hypothesis, makes this system a unique formal scheme adic over Spf R⁺ whose thickenings are étale, and the morphism part of that equivalence gives uniqueness and compatibility with localization and gluing. R⁺ may be nonnoetherian; the same route is used for formal schemes in D9.14. On affine étale charts, take the completed lift, invert a pseudo-uniformizer, and use its canonical integral subring to obtain the étale adic pullback. Glue the charts. Finite presentation and the quasicompact separated hypothesis give quasicompactness and separatedness.

For example, for V → X an open immersion, `V^(⋄/◦)` → `X^(⋄/◦)` is an open immersion. For the identity residue algebra, R⁺ and R⁺ × R⁺[1/ϖ] are distinct ordinary étale lifts with the same reduction. Completion removes the second factor, so uniqueness must be formulated for completed lifts.

*Needs:* D9.10, D8.8, DiamondsAndVStacks D3.6, SchemeAndStackFoundations §0.23a, SchemeAndStackFoundations §0.24, AdicSpacesPartIII F0.3 (*adic-systems-equivalence-finite-ideal-type*).

(GLE, §4.4, Lemma 4.25 and proof, p. 33.)

### D9.13 Étale formal neighbourhoods of a prekimberlite

**Definition.** For a prekimberlite F, `(F)_(qc,for-ét)` is the category of maps T → F with T a prekimberlite and T → F formally adic, étale and quasicompact; morphisms are maps over F (automatically quasicompact, formally adic, étale and separated). For V → F^red quasicompact, separated and étale, the étale formal neighbourhood is `F̂_(/V)` = F `×_((F^red)^(⋄/◦))` `V^(⋄/◦)`, an object with reduction V.

*Proof sketch.* `F̂_(/V)` → F is quasicompact, formally adic, étale and separated by D9.12; it is formally separated, v-formalizing (Heuer sheaves formalize totally disconnected spaces uniquely) and a prekimberlite with reduction V.

Its API includes the following facts.

- The category `(F)_(qc,for-ét)`.
- V ↦ `F̂_(/V)` = F `×_((F^red)^(⋄/◦))` `V^(⋄/◦)`.
- (`F̂_(/V)`)^red = V.
- Morphisms in the category are quasicompact, formally adic, étale and separated.
- For V ⊂ F^red open, `F̂_(/V)` is the formal neighbourhood of D9.8.

**Checks.**

- For V = F^red, `F̂_(/V)` = F.
- For F = Spd ℤ_p and V = Spec 𝔽_q, `F̂_(/V)` = Spd W(𝔽_q), a finite étale formal neighbourhood.
- For F = 𝔛^♢ and V étale over (𝔛_red)^perf, `F̂_(/V)` = 𝔜^♢ for the formal scheme 𝔜 étale over 𝔛 lifting V (Gleason Corollary 4.28).
- For F = Spd ℤ_p and V = Spec `𝔽_(p²)`, the finite étale formal neighbourhood Spd W(`𝔽_(p²)`) → Spd ℤ_p is not an open immersion: its geometric generic fibre has two points (p = 2 and p = 3 alike). By contrast, for F = Spd(ℤ_p × ℤ_p) and V = Spec 𝔽_p the first component of F^red, the finite étale map V → F^red is not the identity, yet `F̂_(/V)` is the open and closed first component Spd ℤ_p, an open immersion; finite étaleness alone does not exclude open immersions.

For example, for V an open subscheme, `F̂_(/V)` is the open formal neighbourhood.

Applications include Gleason Theorem 4.27: reduction identifies étale formal neighbourhoods with étale perfect schemes over F^red; Gleason Remark 4.29 and GLX ¶4 (3): a morphism of sites D_ét → (F^red)_ét and a formal nearby-cycles functor; Gleason Proposition 4.42: étale formal neighbourhoods of (smelted) kimberlites are (smelted) kimberlites.

*Needs:* D9.6, D9.11, D9.12, D8.8.

(GLE, §4.4, Definition 4.26 and Step 3 of the proof of Theorem 4.27, pp. 33–34.)

### D9.14 Reduction is an equivalence on étale formal neighbourhoods

**Theorem.** For a prekimberlite F, the reduction functor gives an equivalence between `(F)_(qc,for-ét)` and the category of quasicompact separated étale perfect schemes over F^red, restricting to an equivalence between injective objects (open formal neighbourhoods) and quasicompact open immersions; `F̂_(/V)` is a quasi-inverse. If F = 𝔛^♢ for a formal scheme 𝔛, every étale formal neighbourhood is 𝔜^♢ for a formal scheme 𝔜.

*Proof sketch.* A morphism inducing an isomorphism on reductions is an isomorphism: the image is an open subsheaf containing (F^red)^⋄, hence everything, and injectivity is checked on geometric points Spa(C, C⁺) ⊂ Spd(C⁺) by counting components (Gleason Theorem 4.27, Step 1). Full faithfulness: maps over F correspond to open and closed subsheaves of the fibre product projecting isomorphically, and likewise for reductions (Step 2). Essential surjectivity: D9.13 (Step 3). Formal schemes, in the generality of D9.7 (no noetherian or finite-presentation hypothesis): on an affine chart Spf A, with A complete and separated for a finitely generated ideal I containing p, a quasicompact separated étale V → (Spec A/I)_red^perf comes from a unique étale scheme over (A/I)_red, because perfection is a universal homeomorphism (SchemeAndStackFoundations §0.24) and étale sites are invariant under universal homeomorphisms (SchemeAndStackFoundations §0.23a); the same invariance along the nil-thickenings Spec(A/I)_red → Spec A/Iⁿ⁺¹ lifts it uniquely to étale Vₙ over A/Iⁿ⁺¹ with Vₘ = Vₙ ×_(A/Iⁿ⁺¹) A/Iᵐ⁺¹ for m ≤ n. This is an adic inductive system, hence a formal scheme 𝔜 adic over Spf A (AdicSpacesPartIII F0.3, *adic-systems-equivalence-finite-ideal-type*); uniqueness of the lifts glues the charts. Then 𝔜^♢ → 𝔛^♢ is formally adic, étale and quasicompact with reduction V, so it is `F̂_(/V)` by the equivalence (Gleason Corollary 4.28). For locally noetherian or locally topologically finitely presented 𝔛 this agrees with the formal étale site invariance of AdicSpacesPartIII R2.9. Example outside that restriction: for A the p-adic completion of ℤ_p[T₁, T₂, …], neither noetherian nor topologically of finite presentation, the identity and the two-copy étale reduction lift to Spf A and Spf(A × A).

For example, for F = Spd ℤ_p, étale formal neighbourhoods correspond to finite products of finite fields over 𝔽_p, i.e. to Spd of finite products of unramified extensions W(𝔽_q).

Applications include GLX ¶4 (3): formal étale site and formal nearby cycles of kimberlites.

*Needs:* D9.13, D9.12, D9.3, D9.7, SchemeAndStackFoundations §0.23a, SchemeAndStackFoundations §0.24, AdicSpacesPartIII F0.3 (*adic-systems-equivalence-finite-ideal-type*), AdicSpacesPartIII R2.9, DiamondsAndVStacks D4.9.

(GLE, §4.4, Theorem 4.27 with Steps 1–3 and Corollary 4.28, pp. 33–34; Introduction, Theorem 7, p. 4.)

### Examples

The formal neighbourhood of the origin in Spd(ℤ_p⟨T⟩) is Spd(ℤ_p[[T]]) with the (p,T)-adic topology. Its generic fibre is the open residue disc. The degree-two étale formal neighbourhood of Spd ℤ_p is Spd W(`𝔽_(p²)`), whereas a formal neighbourhood of an open reduction is an open immersion. Completion kills the extra ordinary étale factor R⁺[1/ϖ] (GLE Propositions 4.19, 4.22, Lemma 4.25, Theorem 4.27).

### Dependencies

D7–D8; AdicSpacesPartIII F0.2–F0.5, R2.4, R2.9; SchemeAndStackFoundations §§0.23a–0.24; DiamondsAndVStacks D1–D6; PerfectoidSpaces P1.

## Layer D10: Integral models from their v-sheaves

Flat normal formal schemes locally formally of finite type over Spf O_E, and proper flat normal schemes over O_E, are recovered from their v-sheaves. The proof assembles the generic fibre (seminormal rigid full faithfulness), the reduction (perfect schemes), the specialization map on classical points, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27’s bounded-function theorem and Lourenço's specialization-triple theorem, and compares closed graphs through density of the generic fibre. v-closures make precise the closure statements used for local models.

### D10.1 The two v-sheaves X^♢ and X^⋄ of an O-scheme

**Construction.** Let O be a complete discrete valuation ring flat over ℤ_p with perfect residue field. For every O-scheme X, construct the analytic functor X ↦ X^♢ by marked untilts with an O-map A → R^♯ on X = Spec A, and the formal functor X ↦ X^⋄ by the same untilt data with A → `R^(♯+)`. Glue the first along {|g| ≠ 0} and the second along {|g| = 1}. Their section descriptions give natural identifications of the restriction of X^♢ to locally finite-type O-schemes with AdicCoefficientsAndComparisons L1, *mixed-characteristic-scheme-diamond*. The comparison below relates these two functors on all O-schemes over Spd O. For X locally of finite type, X^⋄ = (X̂)^♢ for the π-adic completion X̂ (a formal scheme) and X^♢ = (X^an)^♢ for Huber's analytification over Spa O. There is a natural map X^⋄ → X^♢: a monomorphism for X separated, an open immersion for X separated locally of finite type, an isomorphism for X proper.

O = O_E as in the D10 conventions. Both functors have domain all O-schemes; on locally finite-type schemes the analytic functor agrees with AdicCoefficientsAndComparisons L1, *mixed-characteristic-scheme-diamond*. The relative pre-adic realizations below are asserted only on that smaller domain.

*Proof sketch.* On arbitrary affine O-schemes the marked-untilt section formula is a v-sheaf: untilts descend, and for a fixed untilt algebra maps descend sectionwise. This uses the parent’s pre-adic diamondification and v-descent of the untilted structure sheaves; no general adic analytification is assumed. Gluing: localization A → A[1/g] gives the open loci where g is a unit of R^♯, resp. of `R^(♯+)`. Two-step description for X locally of finite type: the forgetful functor from discrete adic spaces over Spa O_disc to O-schemes has adjoints Spec A ↦ Spa(A, A) and Spa(A, Õ) (Õ the integral closure of O in A); base change along O_disc → O and Huber's relative analytification over Spa(O,O), supplied by AdicSpacesPartII R1.2, gives X̂ and X^an (AGLR Lemma 2.11). Monomorphism: R^(♯+) is reduced and Spec R^♯ → Spec R^(♯+) is dominant, so for X separated two maps Spec R^(♯+) → X over O agreeing on Spec R^♯ are equal (Mathlib `AlgebraicGeometry.ext_of_isDominant_of_isSeparated`). Open immersion for locally finite type: check on finite-type affine charts using affine space and a closed immersion into it, then glue. No quasicompactness of X is used. Isomorphism for proper X: surjective on points by the valuative criterion of properness.

Its API includes the following facts.

- Both functors X ↦ X^♢ and X ↦ X^⋄ on all O-schemes, with identities, composition and open gluing.
- On schemes locally of finite type, the analytic functor agrees naturally with AdicCoefficientsAndComparisons L1, *mixed-characteristic-scheme-diamond*.
- For X locally of finite type, X^⋄ = (X̂)^♢ with X̂ the π-adic completion.
- For X locally of finite type, X^♢ = (X^an)^♢.
- The natural map X^⋄ → X^♢.
- It is a monomorphism for X separated.
- It is an open immersion for X separated locally of finite type.
- It is an isomorphism for X proper over O.

**Checks.**

- For X = A¹_O, X^⋄ is the formal closed-unit-disc v-sheaf over Spd O and X^♢ is the relative adic affine line over Spa O. On the F-generic fibre they are the closed rigid disc and the rigid affine line, respectively.
- For an F-algebra A, Spec(A)^⋄ is empty. Spec(F[t])^♢ is the rigid affine line over F; it has nonalgebraic endomorphisms, for example the entire series `Σ_(n≥0)` `π^(n²)`T^n.
- Spec(Â)^⋄ → Spec(A)^⋄ is an isomorphism for the π-adic completion Â, because `R^(♯+)` is π-adically complete.
- For X = P^n_O, X^⋄ = X^♢ = (P^n)^♢.
- The empty scheme gives the empty v-sheaf under both functors.
- For Spec O[T₁,T₂,…] and a marked affinoid untilt, analytic and formal sections are respectively sequences in R^♯ and `R^(♯+)`. The sequence (ϖ⁻¹,0,…) is analytic only, and (ϖ,0,…) belongs to both. Every finite-coordinate restriction gives the supplied finite-dimensional affine-space functor.
- For ⨿_(n∈ℕ) Spec O, the comparison is the disjoint union of identities of Spd O, hence an open immersion. The scheme is separated and locally of finite type but not quasicompact.

For example, for X = Spec O, X^⋄ = X^♢ = Spd O.

Applications include KPZ §3.1.9 and Lemma 3.4.1: local models and Grassmannians are proper, so their two v-sheaves agree; AGLR §2.2: ♢ is used for G_m-actions and nearby cycles, ⋄ for specialization maps; D10.12: reduces proper schemes to formal schemes.

*Needs:* DiamondsAndVStacks D6.6, AdicCoefficientsAndComparisons L1, *mixed-characteristic-scheme-diamond*, AdicSpacesPartIII F0.5, Mathlib `AlgebraicGeometry.ext_of_isDominant_of_isSeparated`, Mathlib `AlgebraicGeometry.Scheme`, AdicSpacesPartII R1, DiamondsAndVStacks D2.7, DiamondsAndVStacks D2.8, PerfectoidSpaces P1.

(AGLR, §2.2, Definition 2.10, Lemma 2.11 and the following two paragraphs, pp. 10–11.)

### D10.2 Generic fibres of formal schemes locally formally of finite type

**Theorem.** For 𝔛 locally formally of finite type over Spf O_E, the Huber generic fibre 𝔛^ad_η = 𝔛^ad `×_(Spa O_E)` Spa(E, O_E) is the adic space r(𝔛^rig) of Berthelot's generic fibre (Conrad's 𝔛^rig), compatibly with maps, open immersions and the specialization maps; and 𝔛^♢ `×_(Spd O_E)` Spd E = (𝔛^ad_η)^♢ = r(𝔛^rig)^♢, a locally spatial diamond.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc.

*Proof sketch.* On affine charts Spf A, 𝔛^ad_η(R, R⁺) for complete affinoid (E, O_E)-algebras is the sheafification of colim over open bounded R₀ ⊂ R⁺ of 𝔛(R₀) (Scholze–Weinstein 2013 Proposition 2.2.2), which is the functor represented by Berthelot's 𝔛^rig (de Jong Proposition 7.1.7, the universal property of AdicSpacesPartIII R2.9's `rigOfFSC`). Both constructions glue along open formal subschemes, giving the identification and its naturality. ♢ commutes with fibre products of pre-adic spaces (Gleason Proposition 1.21(4)); the diamond of an analytic adic space is locally spatial (DiamondsAndVStacks D6.5).

For example, for 𝔛 = Spf O_E[[q]] the generic fibre is the open unit disc over E, and 𝔛^♢_η its diamond. For 𝔛 = Spf O_E⟨T⟩ the generic fibre is the closed unit disc. Non-example: the analytic locus of Spa(O_E[[q]]) is strictly larger than the generic fibre (it contains points with π = 0, q ≠ 0); the comparison is with 𝔛^ad_η, not with 𝔛^ad_a.

*Needs:* AdicSpacesPartIII R2.9, AdicSpacesPartIII R2.3, AdicSpacesPartII R1.7, DiamondsAndVStacks D6.5, DiamondsAndVStacks D6.6.

(SW13, §2.2, Proposition 2.2.2, p. 16; DJ95, §7.1, Proposition 7.1.7, p. 77 (journal pagination); SW20, Lecture 18, §18.4, proof of Proposition 18.4.1, p. 167.)

### D10.3 Generic fibres of normal formal schemes are normal

**Lemma.** If 𝔛 is locally formally of finite type over Spf O_E and (formally) normal, i.e. covered by Spf A with A normal, then its Berthelot generic fibre 𝔛^rig is a normal rigid space; in particular it is seminormal, so DiamondsAndVStacks D6.9 applies to it.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc.

*Proof sketch.* The rings A are excellent, so normality of A is normality of all complete local rings; the affinoid algebras of 𝔛^rig are built from A by Berthelot's construction and inherit normality (de Jong Lemma 7.1.9, Proposition 7.2.4(c)). Normal rings are seminormal (square–cube criterion), and normality of affinoid algebras gives seminormality of the rigid space.

For example, for 𝔛 = Spf O_E[[q]], 𝔛^rig is the open disc, normal. Non-example: the formal completion of the cusp y² = x³ over O_E is not normal, and its generic fibre is not seminormal.

*Needs:* AdicSpacesPartIII R2.9, AdicSpacesPartIII R2.6 and R2.9, Mathlib `IsIntegrallyClosed`.

(DJ95, §7.2, Proposition 7.2.4(c) and its proof, p. 84 (journal pagination).)

### D10.4 Connectedness of the complete-local generic fibre

**Theorem.** Let B be a nonzero normal complete local noetherian O_E-algebra, flat over O_E, with residue field finite over k and the maximal-ideal-adic topology, such that Spf B belongs to FS_O. Then the Berthelot generic fibre (Spf B)^rig is nonempty and connected (DJ95 §7.3, Lemma 7.3.5, p. 88). This is connectedness over E, without geometric connectedness.

*Proof sketch.* Use a finite injective map from a formal power-series ring over a finite coefficient extension into B, pass to a finite Galois normal closure in the fraction field, and use the action on the finite covering over a dense open of the connected open polydisc. Complete-local normality excludes a decomposition of B. Flatness makes the generic fibre nonempty. This route does not use D11’s component theorem.

**Checks.**

- B = O_E[[q]] gives one connected open disc; B = O_E gives one point.
- For a nontrivial finite unramified extension L/E, B = O_L gives the connected point Spa(L,O_L), whereas its base change to a completed algebraic closure has [L:E] points. The target does not assert geometric connectedness.
- B = O_E[[x,y]]/(x(x−π)) is complete local and flat but nonnormal; its generic fibre has two disjoint open-disc components. The zero ring is excluded by nonzeroness.

D11.15 uses this local theorem at the completions of closed points. D10.10, and through it D10.11, uses the global ring isomorphism of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27, `deJongBoundedFormalFunctions`.

*Needs:* D10.2, D10.3, AdicSpacesPartIII R2.9, SchemeAndStackFoundations §0.21.

(DJ95, §7.3, Lemma 7.3.5 and proof, pp. 88–89.)

### D10.5 The specialization map of 𝔛^♢ restricts to Berthelot's on classical points

**Theorem.** For 𝔛 separated and locally formally of finite type over Spf O_E with k algebraically closed, the specialization map sp of the prekimberlite 𝔛^♢ (D9.5), restricted to the image of the classical points |𝔛^rig|_cl in |𝔛^♢_η| = |𝔛^ad_η|, is Berthelot's specialization map sp : |𝔛^rig|_cl → 𝔛_red(k), composed with the bijection 𝔛_red(k) = (𝔛_red)^perf(k). Equivalently, the closure of a classical point x in |𝔛^♢| meets |((𝔛_red)^perf)^⋄| in exactly one point, the image of the point of Spec(k)^⋄ under the k-point sp(x).

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc.

*Proof sketch.* A classical point x is given by Spf O' → 𝔛 for a finite extension O' of O_E (de Jong 7.1.10); it formalizes to Spd(`O_(C')`) → 𝔛^♢, and the reduction of the formalization is the k-point sp(x). Closure: in |Spd(`O_(C')`)| the generic point specializes to the special point; conversely the closure of x meets the special fibre only in points over sp(x) because the specialization map is continuous and the special fibre of the closure of a classical point is a point (Gleason Remark 4.13, D9.5). Agreement of the formal-scheme and v-sheaf triples: GLX ¶6, diagram (3.4).

For example, for 𝔛 = Spf O_E⟨T⟩ and the classical point T = a with |a| ≤ 1, sp(x) is the point T = ā of A¹_k.

*Needs:* D9.5, D9.7, D10.2, AdicSpacesPartIII R2.4, AdicSpacesPartIII R2.9.

(DJ95, §7.1, 7.1.10, p. 80 (journal pagination); GLX, §3.1, ¶6 and diagram (3.4), p. 18; SW20, Lecture 18, proof of Proposition 18.4.1, p. 167.)

### D10.6 The analytic locus of 𝔛^♢ is its maximal quasiseparated diamond open subsheaf

**Theorem.** For a separated formal scheme 𝔛 over Spf ℤ_p as in D9.7 (locally Spf A with A complete and separated for a finitely generated ideal of definition containing p; no noetherian hypothesis), the analytic locus (𝔛^♢)^an = (𝔛^ad_a)^♢ is an open sub-v-sheaf of 𝔛^♢ that is a quasiseparated locally spatial diamond, its closed complement is ((𝔛_red)^perf)^⋄, the image of the reduction counit, and every open sub-v-sheaf of 𝔛^♢ that is a quasiseparated diamond is contained in it. For any map ψ : 𝔛^♢ → 𝔜^♢ between the v-sheaves of two such formal schemes, ψ maps ((𝔛_red)^perf)^⋄ into ((𝔜_red)^perf)^⋄, and ψ^red is a map (𝔛_red)^perf → (𝔜_red)^perf of perfect schemes.

Quasiseparated is the absolute notion of DiamondsAndVStacks D2.4, fibre products over the sheaf of quasicompact perfectoid spaces being quasicompact; Spd 𝔽_p and Spd ℤ_p are not quasiseparated in this sense, while the diamond of a quasiseparated analytic adic space is.

*Proof sketch.* The analytic locus is an open sub-v-sheaf of 𝔛^♢ and a locally spatial diamond (DiamondsAndVStacks D6.5); it is quasiseparated because fibre products of affinoid perfectoid spaces over the quasiseparated analytic adic space 𝔛^ad_a are affinoid perfectoid; its complement is the image of the reduction counit (D9.7). If an open U ⊂ 𝔛^♢ that is a quasiseparated diamond met this complement, choose a point x there and its perfect residue field k(x). The morphism Spec k(x) → (𝔛_red)^perf is a monomorphism, even when x is not closed, and its diamondification Spd k(x) → ((𝔛_red)^perf)^⋄ → 𝔛^♢ lands in the open U, which contains x. This is a map Spec(k(x))^⋄ → U, so U^red is nonempty, contradicting D8.7. Quasiseparatedness of U is used only through D8.7, and it cannot be dropped from the argument: Spd ℤ_p is an open sub-v-sheaf of itself with nonempty reduction, and that it is not a diamond at all is DiamondsAndVStacks D6.1, not a consequence of D8.7. No identification with the terminal sheaf is used. Functoriality: the counits are natural, so ψ composed with the counit of 𝔛^♢ equals the counit of 𝔜^♢ composed with (ψ^red)^⋄ (D8.4), and D8.6 identifies both reductions with the perfections of the reduced formal schemes; this step uses no diamond property of ψ.

**Checks.**

- Spd 𝔽_p has one section on Spa(C,O_C) for algebraically closed perfectoid C of characteristic p. For k = 𝔽_(p²), Spd k has two, for p = 2 and p = 3. Neither sheaf is a quasiseparated diamond, since each has the nonempty reduction Spec k (D8.7); Spd 𝔽_p is not a diamond at all, being the final sheaf (DiamondsAndVStacks D4.1).
- At the generic point of the perfect affine line the residue-point map is a monomorphism and is not a closed immersion. The argument uses only the former property.
- For 𝔛 = Spf ℤ_p the maximal quasiseparated diamond open is Spd ℚ_p; the larger open Spd ℤ_p is neither quasiseparated nor a diamond. For the empty formal scheme the maximal such open is empty.
- For the nonnoetherian 𝔛 = Spf O_C, C a completed algebraic closure of ℚ_p with ideal of definition (p), the maximal quasiseparated diamond open is Spd(C, O_C) and its complement is Spd k_C, which has the nonempty reduction Spec k_C and so meets no quasiseparated diamond open.

For example, for 𝔛 = Spf ℤ_p the analytic locus is Spd ℚ_p and its complement Spd 𝔽_p.

*Needs:* D9.7, D8.7, D8.4, DiamondsAndVStacks D6.5, DiamondsAndVStacks D5.1, DiamondsAndVStacks D4.4, DiamondsAndVStacks D6.6, DiamondsAndVStacks D2.4, DiamondsAndVStacks D6.1, D8.6.

(SW20, Lecture 18, proof of Proposition 18.4.1, p. 167; GLE, §3.2, Proposition 3.19, p. 25; §4.3, Proposition 4.17, p. 30.)

### D10.7 The generic fibre is dense in the v-sheaf of a flat formal scheme

**Theorem.** If 𝔛 is flat and locally formally of finite type over Spf O_E, then |𝔛^♢_η| is a dense open subset of |𝔛^♢|. In particular this holds for π-adically complete flat O_E-algebras B topologically of finite type, where the generic fibre Spd(B[1/π], B') (B' the integral closure of B in B[1/π]) is dense open in Spd(B).

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc.

*Proof sketch.* Reduce to 𝔛 = Spf B. Let Y ⊂ Spa(B[[t]]) be the punctured open unit ball {|t| ≠ 0} over Spa B; Y^♢ → Spd(B) is a v-cover and Y is analytic, so |Y| = |Y^♢| (DiamondsAndVStacks D6.5). A nonempty rational subset Spa(R, R⁺) of a chart {|πⁿ| ≤ |t| ≠ 0} of Y has R flat over O_E (B[[t]] is noetherian and in Huber's standing class, so the chart embedding into Spa(B[[t]]) is étale by AdicSpacesPartII R0.16 *open-embedding-etale* and B[[t]] → O(chart) is flat by AdicSpacesPartII R0.17 *etale-ring-flatness*; the pinned `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc` covers the further rational localization O(chart) → R of this strongly noetherian Tate chart; B[[t]] is π-torsion-free, so R is) and is a pseudorigid space, hence R is Jacobson (Lourenço Propositions 3.3, 4.6). π is not nilpotent in R, so a maximal ideal m ∌ π exists; since (R, R⁺) is a complete Hausdorff Huber pair, Tau Ceti `TauCeti.ValuationSpectrum.exists_mem_spa_supp_eq_of_isMaximal` gives a point of Spa(R, R⁺) with support m, which lies in the generic fibre because π ∉ m.

For example, for 𝔛 = Spf O_E, |Spd O_E| has two points and the generic point is dense. Non-example: for 𝔛 = Spf(O_E[[q]]/(π)), not flat, the generic fibre is empty. Non-example: for a higher-rank valuation ring V ⊃ O_E⟨t⟩ with the π-adic topology, Spd(V) is flat but the open `N_(t≪1)` misses the generic fibre, so density fails outside the noetherian setting (AGLR footnote 2).

*Needs:* D10.2, DiamondsAndVStacks D6.5, DiamondsAndVStacks D4.8, Tau Ceti `TauCeti.ValuationSpectrum.exists_mem_spa_supp_eq_of_isMaximal`, AdicSpacesPartII R0.9, AdicSpacesPartII R0, AdicSpacesPartII R0.9/R0.18 (gap:pseudorigid-jacobson-flatness), AdicSpacesPartII R0.1 *huber-standing-class*, AdicSpacesPartII R0.16 *open-embedding-etale*, AdicSpacesPartII R0.17 *etale-ring-flatness*, Tau Ceti `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`.

(AGLR, §2.2, Lemma 2.17 and proof, p. 13; LOU17, §3–4, Propositions 3.3 and 4.6, pp. 6 and 9; SW20, Lecture 18, end of proof of Proposition 18.4.1, p. 168.)

### D10.8 Closed immersions of small v-stacks and proper monomorphisms

**Theorem.** A morphism Y → X of small v-stacks is a closed immersion if and only if it is a quasicompact monomorphism and |Y| → |X| is a closed embedding. Consequently every proper monomorphism of small v-sheaves is a closed immersion.

Proper maps of v-stacks are those of DiamondEtaleCohomology C4: separated, quasicompact and universally closed.

*Proof sketch.* Closed immersions are quasicompact monomorphisms with closed image: base change to a v-cover by totally disconnected spaces, where closed immersions are representable, and use that |S| → |X| is a quotient map. Conversely, after base change to a totally disconnected S a quasicompact monomorphism is a pro-constructible generalizing subset with the subspace topology (DiamondsAndVStacks D3.7 and D1.5), closed by hypothesis, hence a closed immersion. Proper monomorphism: proper gives quasicompact and |Y| → |X| closed (DiamondEtaleCohomology C4.1); a monomorphism is injective on points, so |Y| → |X| is a closed embedding.

For example, the inclusion of the closed point Spd 𝔽_p → Spd ℤ_p is a closed immersion. Non-example: for a perfectoid field C with C⁺ ⊊ O_C of rank two, the closed point of |Spa(C, C⁺)| is a closed subset that is not weakly generalizing, and no closed immersion has it as image.

Applications include KPZ Lemma 3.4.1: `M^v_(G,μ)` → `Gr_(GL(Λ))` is a closed immersion because it is a proper monomorphism.

*Needs:* DiamondsAndVStacks D3.8, DiamondsAndVStacks D3.7, DiamondsAndVStacks D4.8, DiamondEtaleCohomology C4.1, DiamondEtaleCohomology C4.1.

(AGLR, §2.1, Lemma 2.1 and proof, p. 8; KPZ, Proof of Lemma 3.4.1, arXiv v3 p. 29 (published p. 28).)

### D10.9 The v-closure of a sub-v-sheaf

**Construction.** For a small v-stack X and a sub-v-stack Y ⊂ X (a monomorphism), the v-closure Y^cl is the intersection of all closed sub-v-stacks of X containing Y; it is a small closed sub-v-stack. A subset S ⊂ |X| is weakly generalizing if for every Spa(C, C⁺) → X, |Spa(C, C⁺)| maps into S iff its closed point does; images of maps of small v-stacks are weakly generalizing; S ↦ S `×_(|X|)` X is a bijection between closed weakly generalizing subsets and closed sub-v-stacks, with |S `×_(|X|)` X| = S; and Y^cl = |Y|^wgc `×_(|X|)` X, where |Y|^wgc is the smallest closed weakly generalizing subset containing |Y|. v-closures commute with base change along open partially proper maps.

*Proof sketch.* Closedness and smallness: check after base change to totally disconnected spaces (DiamondsAndVStacks D1.5 and D3.7) and use that subsheaves of small sheaves are small. Images: a map Spa(C, C⁺) → X sending the closed point into the image factors after enlarging (C, C⁺) (DiamondsAndVStacks D4.8). Bijection: for S closed weakly generalizing its preimage in a totally disconnected cover is closed and generalizing, hence an affinoid perfectoid subset; conversely closed sub-v-stacks have weakly generalizing image and equal S `×_(|X|)` X by surjectivity on points (AGLR Lemma 2.7). Formula for Y^cl: Proposition 2.8; base change: Corollary 2.9 via the valuative criterion for partially proper maps.

Its API includes the following facts.

- The closed sub-v-stack Y^cl of X.
- Y^cl → X is a closed immersion and Y ⊂ Y^cl.
- Y^cl is contained in every closed sub-v-stack containing Y.
- The weakly generalizing predicate on subsets of |X|.
- Images of maps of small v-stacks are weakly generalizing.
- Closed sub-v-stacks of X ≃ closed weakly generalizing subsets of |X|, S ↦ S `×_(|X|)` X.
- |Y^cl| = |Y|^wgc.
- For Z → X open and partially proper, (Y ×_X Z)^cl = Y^cl ×_X Z.

**Checks.**

- For the open unit disc D ⊂ B the closed disc over a perfectoid field C, |D|^cl misses the Gauss point but contains a rank-two specialization of it, so it is not weakly generalizing; the v-closure of D is the complement of the open residue classes of all closed points of the special-fibre torus 𝔾_(m,k_C), that is, of the open subspaces ⋃_n {|fⁿ| ≤ |ϖ|} ⊂ B for f ∈ O_C[T] monic lifting an irreducible polynomial of k_C[T] other than T. For C algebraically closed these are the open discs {|T − a| < 1} with a ∈ C, |a| = 1 (AGLR Example 2.5, which states only the algebraically closed form with C-rational centres). For C the completed perfection of 𝔽₂((u)), with k_C = 𝔽₂, the classical point α with α² + α + 1 = 0 in the unramified quadratic extension has |α − a| = 1 for every a ∈ C with |a| = 1 (ᾱ ∉ 𝔽₂), so it lies in no C-centred disc, yet |α² + α + 1| = 0 < 1 puts it in the residue class of the degree-two closed point, outside the v-closure.
- For Y closed, Y^cl = Y; for Y empty, Y^cl is empty.
- In general |Y^cl| ≠ closure of |Y|: for D ⊂ B as above the topological closure is not the space of a closed subsheaf.
- For a perfectoid field C with C⁺ ⊊ O_C of rank > 1, S = {closed point} is closed but not weakly generalizing and S `×_(|X|)` X is empty.
- For B flat topologically of finite type over O_E, the v-closure of Spd(B[1/π], B') in Spd(B) is Spd(B), by D10.7.

For example, If Y ⊂ X is already closed then Y^cl = Y.

Applications include SW20 Conjecture 21.4.1 / AGLR Definition 4.11: v-sheaf local models are v-closures of Schubert diamonds in Beilinson–Drinfeld Grassmannians; KPZ Lemma 3.4.1: the v-sheaf of a flat closure is the v-closure of the generic fibre; GLX §3.2: local models `M_(K_p,μ)` as v-closures.

*Needs:* D10.8, DiamondsAndVStacks D4.8, DiamondsAndVStacks D3.7, DiamondEtaleCohomology C4.5.

(AGLR, §2.1, Definitions 2.2 and 2.3, Lemma 2.4, Example 2.5, Lemma 2.7, Proposition 2.8 and Corollary 2.9, pp. 9–10; GLE, §1.1, Proposition 1.9, p. 8.)

### D10.10 Formal schemes are determined by their specialization triples (Lourenço)

**Theorem.** Assume k is algebraically closed. Let `C_(O_E)` be the category of triples (X_η, X_s, sp) with X_η a rigid space over E, X_s a perfect scheme over k and sp : |X_η|_cl → X_s(k) a map of sets on classical points. The functor 𝔛 ↦ (𝔛^rig, (𝔛_red)^perf, sp_𝔛) from flat normal formal schemes locally formally of finite type over Spf O_E to `C_(O_E)` is fully faithful.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc. k is algebraically closed. Morphisms of formal schemes are continuous over Spf O_E and need not be adic.

*Proof sketch.* Faithfulness: two maps with the same triple agree topologically (|𝔛| = |𝔛_red^perf|), reduce to affines Spf B → Spf A, and agree on A by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`) since A ⊂ O(𝔛^rig). In the affine fullness step, pullback of bounded analytic functions and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`) give a ring homomorphism A → B. Continuity must still be proved before this defines a morphism of formal schemes. Let I and J be finitely generated ideals of definition in A and B. For each generator a of I, specialization compatibility and the existence of generic-fibre points above every closed point of the reduction imply that its image in B vanishes at all such closed points. The reduced special fibre is locally of finite type over algebraically closed k, so the image lies in √J. Finite generation gives an N with I^N mapping into J, and then `I^(Nn)` maps into J^n. This proves continuity, including for (π,q)-adic topologies. The induced reduction morphism agrees with ψ_s on all k-points, hence on the reduced perfect schemes. Globalization: the preimage under ψ_s of an affine reduction is covered by affine reductions, and the compatibility with sp identifies the corresponding generic fibres (Lourenço Corollaries 6.5–6.6).

For example, the triple of Spf O_E⟨T⟩ is (closed disc, A¹_k^perf, reduction of coordinates). Normality is needed for the affine step: for A = O_E⟨X, Y⟩/(Y² − π²X), Y/π is a power-bounded function on the generic fibre outside A, so maps of generic fibres need not come from maps of formal schemes.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`), D10.5, D10.2, AdicSpacesPartIII R2.4, AdicSpacesPartIII F0.3.

(SW20, Lecture 18, §18.4, Theorem 18.4.2 and Remark 18.4.3, p. 167; LOU17, §6, Definition 6.4, Corollaries 6.5 and 6.6 with proofs, pp. 17–18.)

### D10.11 Scholze–Weinstein: flat normal formal schemes are determined by their v-sheaves

**Theorem.** The functor 𝔛 ↦ 𝔛^♢ from flat normal formal schemes locally formally of finite type over Spf O_E to small v-sheaves over Spd O_E is fully faithful.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc. Morphisms of v-sheaves are over Spd O_E. No separatedness is assumed: the comparison of graphs is made over affine opens of the target.

**Lemma (unramified descent).** Let Ĕ be the completion of the maximal unramified extension of E, Ŏ its ring of integers, with residue field k̄, and Γ = Gal(k̄/k) acting continuously on Ŏ. For a complete O_E-algebra A with finitely generated ideal of definition I ∋ π, write A_Ŏ for the I-adic completion of A ⊗_(O_E) Ŏ and 𝔛_Ŏ = 𝔛 ×_(Spf O_E) Spf Ŏ.

1. A → A_Ŏ is injective with image (A_Ŏ)^Γ. For each n, A/Iⁿ is a module over some O_E/πᵐ, and Ŏ/πᵐ is the union of the finite étale Galois extensions O_(E_r)/πᵐ with groups Gal(k_r/k); O_(E_r) ⊗_(O_E) O_(E_r) ≅ ∏_(Gal(k_r/k)) O_(E_r), because both sides are finite étale over O_(E_r) with isomorphic reductions (k_r ⊗_k k_r ≅ ∏ k_r, then SchemeAndStackFoundations §0.23a). Faithfully flat descent (Mathlib `Algebra.IsEffective.of_faithfullyFlat`, applied to the base change of O_(E_r)/πᵐ to A/Iⁿ) identifies A/Iⁿ with the equalizer of the two maps to the product, that is with the Gal(k_r/k)-invariants of A/Iⁿ ⊗ O_(E_r); pass to the union over r and to the limit over n.
2. For formal schemes 𝔛, 𝔜 locally formally of finite type over Spf O_E, base change Hom_(O_E)(𝔛, 𝔜) → Hom_Ŏ(𝔛_Ŏ, 𝔜_Ŏ)^Γ is bijective. Affine-locally, a Γ-equivariant continuous Ŏ-algebra map A_Ŏ → B_Ŏ carries A into (B_Ŏ)^Γ = B by (1), and is the completed base change of that restriction since A ⊗ Ŏ is dense in A_Ŏ. Globally, |𝔛_Ŏ| → |𝔛| is the map of reductions Spec(R ⊗_k k̄) → Spec R on affine charts, surjective with Γ-orbits as fibres, so Γ-stable opens descend and the affine maps glue.
3. If 𝔛 is flat, normal and locally formally of finite type over Spf O_E, then so is 𝔛_Ŏ over Spf Ŏ: a presentation of A as a quotient of O_E[[q₁,…,qₙ]]⟨T₁,…,Tₘ⟩ base-changes to one of A_Ŏ over Ŏ, and flatness passes by (1). For normality, let 𝔫 be a maximal ideal of the noetherian ring A_Ŏ; it contains I, lies over a maximal ideal 𝔪 of A whose residue field κ is finite over the perfect field k, and has residue field k̄ (κ ⊗_k k̄ is a product of copies of k̄). Put R = Â_𝔪, a complete local ring, normal because A is normal and excellent (a quotient of O_E[[q₁,…,qₙ]]⟨T₁,…,Tₘ⟩) and A_𝔪 → R is regular (SchemeAndStackFoundations §0.21, `regular_map_completion`). The 𝔫-adic completion of A_Ŏ is the completion of the strict henselization R^sh (ModularCurves 4D): R ⊗_(O_E) O_(E_r) is finite étale over R, its local factor R_r at 𝔫 is a finite étale local R-algebra with residue field κk_r, these factors are cofinal among the étale neighbourhoods defining R^sh because R is henselian and ⋃_r κk_r = k̄ = κ^sep, and completion commutes with this filtered colimit since A_Ŏ/𝔫ⁿ = colim_r R_r/𝔫_rⁿ for every n. R^sh is a normal noetherian local domain: each R_r is normal, being étale over the normal R (regular maps preserve normality, §0.21), and an element of the fraction field of R^sh integral over R^sh lies in some R_r. R is a G-ring (a complete noetherian local ring; §0.21, `IsGRing`), hence so is R^sh (SchemeAndStackFoundations §0.21, gap:strict-henselization-g-ring; STACKS Tag 07QR), so R^sh → (R^sh)^∧ is regular and (R^sh)^∧ is normal (`regular_map_completion`). Normality of A_Ŏ follows by faithfully flat descent from its completed local rings at all maximal ideals.
4. Spd Ŏ → Spd O_E is surjective as a map of v-sheaves: for C a completed algebraic closure of Ĕ, Spd O_C → Spd O_E is a v-cover (DiamondsAndVStacks D6.7) and factors through Spd Ŏ. Moreover (𝔛_Ŏ)^♢ = 𝔛^♢ ×_(Spd O_E) Spd Ŏ, since on test objects both sides are pairs of compatible continuous maps from A and Ŏ to R^♯⁺, which extend uniquely to A_Ŏ because R^♯⁺ is complete.

*Proof sketch.* Reduce to k algebraically closed by the lemma: faithfulness and fullness over Ŏ give, for ψ : 𝔛^♢ → 𝔜^♢, a unique f′ : 𝔛_Ŏ → 𝔜_Ŏ with f′^♢ = ψ ×_(Spd O_E) Spd Ŏ; for σ ∈ Γ, σ f′ σ⁻¹ has the same diamond, so f′ is Γ-equivariant by faithfulness and descends to f : 𝔛 → 𝔜 by (2); f^♢ and ψ agree after pullback along the surjection 𝔛^♢ ×_(Spd O_E) Spd Ŏ → 𝔛^♢ of (4), hence agree. Faithfulness over O_E follows in the same way from injectivity in (2). In the algebraically closed case, from ψ : 𝔛^♢ → 𝔜^♢ build a map of triples: on generic fibres via D10.2 and DiamondsAndVStacks D6.9 (the generic fibres are normal, D10.3); on reductions via D8.4 and D7.6, applying D10.6 on separated affine charts; compatibility with sp via D10.5. D10.10 gives faithfulness and a map f : 𝔛 → 𝔜 with f_η = ψ_η. Localize on 𝔜: for an affine open V ⊂ 𝔜, V^♢ is the open formal neighbourhood of V_red (D9.8), so `ψ^(-1)`(V^♢) = (`f^(-1)`V)^♢ by compatibility of ψ^red = f_red^perf with specialization; hence assume 𝔜 affine, in particular separated. ψ = f^♢: the graphs Γ_ψ, `Γ_(f^♢)` : 𝔛^♢ → (𝔛 `×_(Spf O_E)` 𝔜)^♢ are then closed immersions, so it suffices that their closed images agree (D10.9); they agree on the generic fibre, which is dense in |𝔛^♢| (D10.7).

For example, for 𝔛 = 𝔜 = Spf O_E[[q]], endomorphisms of 𝔛^♢ over Spd O_E are the continuous O_E-algebra endomorphisms of O_E[[q]], q ↦ g with g ∈ (π, q). Non-example (normality): the normalization Spf O_E⟨t⟩ → Spf O_E⟨x, y⟩/(y² − x³), x = t², y = t³, induces an isomorphism of v-sheaves (D10.13 (1); D7.3 on the generic fibre) but is not an isomorphism of formal schemes. Non-example (flatness and reducedness): the closed immersion Spf k → Spf(k[[q]]/(q²)) over Spf O_E induces an isomorphism of v-sheaves, both being Spd k, but is not an isomorphism.

**Checks.**

- On Spa(C,O_C), C algebraically closed perfectoid of characteristic p, k = 𝔽_(p²) gives two sections on each side of the nilpotent comparison: q maps to 0 and k has its two embeddings. Spd 𝔽_p has one section. This holds for p = 2 and p = 3.
- Unramified descent for A = O_E = ℤ_p: A_Ŏ = W(𝔽̄_p) and its Γ-invariants are ℤ_p. For the normality step, R = ℤ_p, R^sh = ⋃_r W(𝔽_(p^r)) is a discrete valuation ring that is not complete, and its completion is W(𝔽̄_p) = Ŏ, normal, as the identification of the completed local ring of A_Ŏ requires. At the finite level, ℤ_(p²) ⊗_(ℤ_p) ℤ_(p²) ≅ ℤ_(p²) × ℤ_(p²) (two factors, one per element of Gal(𝔽_(p²)/𝔽_p)), and the equalizer of the two inclusions is ℤ_p, for p = 2 and p = 3.
- The product decomposition used in the lemma fails for ramified extensions, which is why the descent goes through Ŏ and not through O_C directly: for ℤ_p[√p], ℤ_p[√p] ⊗_(ℤ_p) ℤ_p[√p] ≅ ℤ_p[√p][y]/(y² − p) is local with nilpotents mod √p, not a product of two copies.
- Faithfulness by itself does not descend maps: the two embeddings of 𝔽_(p²) into 𝔽̄_p are distinct Ŏ-points of Spf W(𝔽_(p²)) ×_(Spf ℤ_p) Spf Ŏ that Γ permutes; only Γ-invariant maps, here none from Spf ℤ_p to Spf W(𝔽_(p²)), come from O_E.

Applications include KPZ §3.1.9, Lemma 3.4.1, §7.1.8: constructs ρ_\* : `M^loc_(G,μ)` → `Gr(d, Λ)_(O_E)` and proves uniqueness of local models; SW20 Lecture 21–25: uniqueness of local models and of integral models of local Shimura varieties.

*Needs:* D10.10, D10.6, D10.7, D10.3, D10.8, D10.9, D9.8, D7.6, DiamondsAndVStacks D6.9, DiamondsAndVStacks D6.7, DiamondsAndVStacks D3.8, SchemeAndStackFoundations §0.21, SchemeAndStackFoundations §0.21 (gap:strict-henselization-g-ring), ModularCurves 4D, SchemeAndStackFoundations §0.23a, AdicSpacesPartIII F0.3, Mathlib `Algebra.IsEffective.of_faithfullyFlat`.

(SW20, Lecture 18, §18.4, Proposition 18.4.1 and proof, pp. 167–168; KPZ, §3.1.9, p. 19; Lemma 3.4.1, arXiv v3 p. 29.)

### D10.12 Proper flat normal schemes over O_E are determined by their v-sheaves

**Theorem.** On the category of proper flat normal O_E-schemes, X ↦ X^♢ (= X^⋄) is fully faithful into small v-sheaves over Spd O_E.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc.

*Proof sketch.* For proper X, X^♢ = X^⋄ = (X̂)^♢ with X̂ the π-adic completion (D10.1). X̂ is flat, locally formally of finite type (even topologically of finite type) and normal: completion of an excellent normal ring along an ideal is normal (regular maps preserve normality; SchemeAndStackFoundations §0.21). D10.11 identifies maps of v-sheaves with maps X̂ → Ŷ. The formal-morphism full-faithfulness theorem of F0 then identifies these with maps X → Y between the already algebraic proper schemes; no algebraization of an arbitrary proper formal scheme is required.

For example, for X = Y = `P^n_(O_E)` the endomorphisms of (P^n)^♢ over Spd O_E are the endomorphisms of P^n over O_E. Non-example: the projective cuspidal cubic X ⊂ `P²_(O_E)` and its normalization `P¹_(O_E)` → X have isomorphic v-sheaves (AGLR Proposition 2.18(1): the normalization is the absolute weak normalization) although X is not isomorphic to `P¹_(O_E)`; normality cannot be dropped.

*Needs:* D10.11, D10.1, SchemeAndStackFoundations §4.10, through AdicSpacesPartIII F0.8, SchemeAndStackFoundations §0.21.

(KPZ, §3.1.9, p. 19; AGLR, §2.2, the discussion after (2.12) and Proposition 2.18(2), p. 13.)

### D10.13 Full faithfulness on absolutely weakly normal formal and proper schemes

**Theorem.** (1) For an affine formal scheme Spf A over O_E with finitely generated ideal of definition I, and B the I-adic completion of the absolute weak normalization of A, Spf(B)^♢ → Spf(A)^♢ is an isomorphism. (2) The functor 𝔛 ↦ 𝔛^♢ from absolutely weakly normal formal schemes flat, separated and topologically of finite type over O_E to v-sheaves over Spd O_E is fully faithful. (3) For a proper flat O_E-scheme X, X^awn is proper and flat and (X^awn)^♢ → X^♢ is an isomorphism; X ↦ X^♢ is fully faithful on proper flat absolutely weakly normal O_E-schemes.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc. Absolute weak normality (AGLR Definition 2.12) and absolute weak normalization are requested from SchemeAndStackFoundations §0.26 (gap:absolute-weak-normality-formal), whose characteristic-p weak normality covers only reduced schemes of finite type over a perfect field. Absolute weak normality is seminormality together with the condition that for every prime ℓ, an equality ℓ^ℓ a = b^ℓ has a unique c with a = c^ℓ and b = ℓc. This is not closure under arbitrary ℓ-th roots. For 𝔽_p-algebras it is equivalent to perfectness.

*Proof sketch.* (1): affinoid perfectoid test objects have v-covers Spa(R, R⁺) with R⁺ a product of perfectoid valuation rings with algebraically closed fraction fields, which are absolutely weakly normal, so maps factor through the absolute weak normalization. (2): faithfulness since A injects into a product of perfectoid valuation rings; fullness by producing ψ_η from DiamondsAndVStacks D6.9 (A[1/π] is seminormal), a map from the image A'' of B ⊗ A in A[1/π], and comparing the closed sub-v-sheaves (X'')^♢ and Γ_f through density of the generic fibre (D10.7); special fibres agree by D7.6, so A → A'' is a universal homeomorphism and A'' = A by absolute weak normality; globalize with the specialization map. (3): X^awn → Spec O_E is of finite type by excellence and the embedding into the normalization in characteristic 0; π-adic completion preserves absolute weak normality (regular maps); then (2) and Grothendieck existence.

For example, for normal A this recovers D10.11 in the topologically finite type case. For A = O_E⟨x, y⟩/(y² − x³), the absolute weak normalization is the normalization O_E⟨t⟩, and (1) gives Spd(O_E⟨t⟩) ≅ Spd(A).

Applications include AGLR Theorem 1.1 and §4: uniqueness and representability of scheme-theoretic local models.

*Needs:* D10.7, D10.10, D10.1, D7.6, DiamondsAndVStacks D6.9, SchemeAndStackFoundations §0.21, SchemeAndStackFoundations §4.10, through AdicSpacesPartIII F0.8, SchemeAndStackFoundations §0.26 (gap:absolute-weak-normality-formal).

(AGLR, §2.2, Definition 2.12, Lemma 2.13, Definition 2.14, Proposition 2.15, Theorem 2.16 and Proposition 2.18 with proofs, pp. 12–14.)

### D10.14 The v-sheaf of a flat Zariski closure is the v-closure of its generic fibre

**Theorem.** Let P be a proper O_E-scheme, U ⊂ P_E a closed subscheme of the generic fibre, and X ⊂ P the scheme-theoretic closure of U, a closed subscheme of P flat over O_E with generic fibre U. Then X^♢ ⊂ P^♢ is the v-closure (D10.9) of U^♢ ⊂ P^♢, where U^♢ = (U^an)^♢ ⊂ (P_E^an)^♢ = P^♢ `×_(Spd O_E)` Spd E.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc. X is flat over O_E because it is the closure of its generic fibre.

*Proof sketch.* X → P is a closed immersion of proper O_E-schemes, so X^♢ → P^♢ is a proper monomorphism, hence a closed immersion (D10.8; for proper schemes ♢ = ⋄). X^♢ contains U^♢, so U^cl ⊂ X^♢. |U^♢| = |X^♢_η| is dense in |X^♢| (D10.7 applied to the flat formal completion X̂, using X^♢ = X̂^♢). |U^cl| is closed and contains |U^♢|, hence contains its closure in |X^♢|, which is all of |X^♢|; two closed sub-v-sheaves of X^♢ with the same underlying space agree (D10.9, bijection with weakly generalizing closed subsets).

For example, for U = P_E, X = P (P flat) and the statement says P^♢ is the v-closure of its generic fibre. Non-example: for X' = X ∪ Z with Z ⊂ P_k a closed subvariety of the special fibre not contained in X, X' is not flat and X'^♢ strictly contains the v-closure of U^♢; nilpotent structure alone is invisible to ♢. Application: for the Grassmannian P = `Gr(d, Λ)_(O_E)` and U = G/P_μ ⊂ Gr(d, V)_E, the v-sheaf of the Zariski closure is the v-closure of the Schubert diamond (KPZ Lemma 3.4.1).

Applications include KPZ Lemma 3.4.1, Theorem 3.2.15: identifies (X̄_μ)^♢ with `M^v_(G,μ)` and proves the Scholze–Weinstein conjecture for the constructed local models.

*Needs:* D10.9, D10.7, D10.1, D10.8, AdicSpacesPartIII F0.5.

(KPZ, Proof of Lemma 3.4.1, arXiv v3 p. 29 (published p. 28); AGLR, §2.1, Lemma 2.7 and Proposition 2.8, pp. 9–10; Lemma 2.17, p. 13.)

### D10.15 Integral models and morphisms with prescribed v-sheaves are unique

**Application.** (1) If X and X' are proper flat normal O_E-schemes with X^♢ ≅ X'^♢ over Spd O_E, then X ≅ X' by a unique isomorphism inducing the given one. For a parahoric model 𝒢 and minuscule μ with reflex field E, let `M^v_(𝒢,μ)` be GeometricSatakeAndFusion §4.17's integral v-sheaf local model (“Integral local models and admissible special fibres”): the v-closure of the generic Schubert bound in the integral Beilinson–Drinfeld Grassmannian `Gr_(𝒢,Spd O_E)`, and assume that `M^v_(𝒢,μ)` is the v-closure, in the sense of D10.9, of that generic Schubert bound in `Gr_(𝒢,Spd O_E)`. Then a scheme-theoretic local model `M^loc_(𝒢,μ)` (proper, flat, normal, with reduced special fibre, and with (M^loc)^♢ = `M^v_(𝒢,μ)`, as in SW20 Conjecture 21.4.1) is unique if it exists. (2) Let ρ : 𝒢 ↪ GL(Λ) be a closed immersion extending a Hodge embedding (G, μ) ↪ (GL(V), μ_d), and assume that `M^v_(GL(Λ),μ_d)` = Gr(d, Λ)^♢ (SW20 Corollary 21.6.10 with its proof, as read in KPZ §3.1.9). Then there is a unique morphism ρ_\* : `M^loc_(𝒢,μ)` → `Gr(d, Λ)_(O_E)` of O_E-schemes whose diamond is the map `M^v_(𝒢,μ)` → `M^v_(GL(Λ),μ_d)` that GeometricSatakeAndFusion §4.18 (“Functoriality of integral local models”) attaches to ρ; if the Zariski closure X̄_μ of G/P_μ in `Gr(d, Λ)_(O_E)` is normal with reduced special fibre then X̄_μ = `M^loc_(𝒢,μ)` and ρ_\* is a closed immersion.

Use the standing FS convention: continuous structure maps are allowed, including the (π,q)-adic formal disc. The integral Grassmannians, their bounded closed subfunctors and the closed immersion `Gr_(𝒢)` → `Gr_(GL(Λ))` induced by a closed representation are those of GeometricSatakeAndFusion GS0 (Witt geometry); this node only applies the recovery theorems to them. The identification `M^v_(GL(Λ),μ_d)` = Gr(d, Λ)^♢ is a hypothesis here: SW20 Corollary 21.6.10 gives a closed immersion Gr(d, Λ)^♢ → `Gr_(GL(Λ),Spd O_E)` whose generic fibre is the Schubert bound of μ_d, and KPZ §3.1.9 reads the identification with the v-closure off its proof; under the v-closure hypothesis of (1) it also follows from D10.14 applied to the flat projective `Gr(d, Λ)_(O_E)`, since the v-closure of the generic Schubert bound in the closed sub-v-sheaf Gr(d, Λ)^♢ is its v-closure in `Gr_(GL(Λ),Spd O_E)` (D10.9).

*Proof sketch.* (1) is D10.12 applied to the isomorphism and its inverse. (2) existence and uniqueness of ρ_\* is D10.12 applied to the functorial map of v-sheaf local models. For the last clause: D10.14 gives (X̄_μ)^♢ = v-closure of X_μ^♢ in Gr(d, Λ)^♢; the map `M^v_(𝒢,μ)` → `Gr_(GL(Λ))` is a closed immersion (GS0's closed immersion of integral Grassmannians, or directly as a proper monomorphism by D10.8), and v-closures are compatible with closed immersions, so its image is the same v-closure; hence (X̄_μ)^♢ = `M^v_(𝒢,μ)` and (1) applies.

For example, for G = GL(Λ) and minuscule μ_d, M^loc = `Gr(d, Λ)_(O_E)` and ρ_\* is the identity.

*Needs:* D10.12, D10.14, D10.8, D10.9, GeometricSatakeAndFusion GS0 §0.32, “Integral parahoric ind-properness”, GeometricSatakeAndFusion GS0 §0.30, “Integral bounded Grassmannian families”, GeometricSatakeAndFusion §4.17, “Integral local models and admissible special fibres”, GeometricSatakeAndFusion §4.18, “Functoriality of integral local models”.

(SW20, Lecture 21, §21.4, Conjecture 21.4.1, Remark 21.4.2 and the following paragraph, p. 195 (PDF p. 205); KPZ, §3.1.9, p. 19; Lemma 3.4.1 and proof, arXiv v3 p. 29 (published p. 28).)

### Examples

The rings of bounded functions on the open and closed unit discs are O_E[[q]] and O_E⟨T⟩, respectively. The map q ↦ π+q² is continuous for the (π,q)-adic topology, whereas q ↦ 1 is not; generic-fibre maps in an integral-recovery statement must respect specialization. For a flat proper scheme P, the flat-closure theorem with U = P_E gives the v-closure P^♢, and adding a disjoint vertical reduced component changes that closure (DJ95 Theorem 7.4.1; SW20 Theorem 18.4.2; AGLR Lemma 2.17).

### Dependencies

D7–D9; AdicSpacesPartII R0.1, R0.9, R0.13, R0.16, R0.17, R1.2–R1.7, with R0.9 / R0.18 (gap:pseudorigid-jacobson-flatness); AdicSpacesPartIII F0.6–F0.8, R2.2–R2.4, R2.9; SchemeAndStackFoundations §0.21 and §0.26 (gap:absolute-weak-normality-formal); DiamondsAndVStacks D3–D6; DiamondEtaleCohomology C4; AdicCoefficientsAndComparisons L1 on its locally finite-type domain; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27; ModularCurves 4D and SchemeAndStackFoundations §0.21 (gap:strict-henselization-g-ring) for the unramified descent lemma of D10.11; GeometricSatakeAndFusion GS0 and §§4.17–4.18 for D10.15.

## Layer D11a: Kimberlites and tubular neighbourhoods

Kimberlites are valuative prekimberlites whose analytic locus is a quasiseparated locally spatial diamond with quasicompact specialization map. Their tubular neighbourhoods are interiors of specialization fibres. With the finiteness condition of being constructibly Jacobson, rich pairs have quotient specialization maps, and topologically normal rich pairs have the same connected components as their reduction. Over Spd O the π-adic kimberlites of Anschütz–Gleason–Lourenço–Richarz satisfy a specialization principle.

### D11.1 Valuative prekimberlites

**Definition.** A prekimberlite F is valuative if Heuer's specialization morphism SP_F : F → `(F^red)^(⋄/◦)` is partially proper (it is always separated). Separated formal schemes give valuative prekimberlites; if G → F is a partially proper map of prekimberlites with F valuative then G is valuative; formal neighbourhoods and étale formal neighbourhoods of valuative prekimberlites are valuative; and for valuative F, sp_F : |F| → |F^red| is a specializing map.

*Proof sketch.* Formal schemes: partial properness is local on the target (DiamondEtaleCohomology C4.5–C4.7); for Spd(B) the valuative criterion asks that B → `R^(♯,◦)` with reduction landing in `R^(♯,+)`_red lands in `R^(♯,+)`, which holds as `R^(♯,+)` = `R^(♯,◦)` `×_(R^(♯,◦)_red)` `R^(♯,+)`_red (Gleason Proposition 4.31). Partially proper G → F: G → `(F^red)^(⋄/◦)` is partially proper and G → `(G^red)^(⋄/◦)` separated (Proposition 4.32). Neighbourhoods: base changes (Proposition 4.34). Specializing: given r with sp(r) = x and a specialization y of x, pick a valuation ring dominating the local ring of the closure of x at y, refine the integral subring of the residue field of a formalizable representative of r, and lift by partial properness (Proposition 4.33).

Its API includes the following facts.

- SP_F is partially proper.
- 𝔛^♢ is valuative for a separated formal scheme locally defined by a finitely generated ideal containing p, with complete separated affine rings as in D9.7.
- Partially proper maps of prekimberlites to valuative ones have valuative source.
- Formal and étale formal neighbourhoods of valuative prekimberlites are valuative.
- sp_F is a specializing map of topological spaces.

**Checks.**

- Spd ℤ_p is valuative.
- Spd(ℤ_p⟨T⟩) is valuative.
- For F = Spd(ℤ_p⟨T⟩) and S = G_m ⊂ `A¹_(𝔽_p)`, `F̂_(/S)` = Spd(ℤ_p⟨T, `T^(-1)`⟩) is valuative (a formal scheme) although the open immersion `F̂_(/S)` → F is not partially proper: valuativity of the source does not come from Proposition 4.32 here.
- The empty prekimberlite is valuative.

For example, Spd ℤ_p is valuative.

Applications include Gleason Definition 4.35: smelted kimberlites and kimberlites are built on valuative prekimberlites; Gleason Lemma 4.53: valuativity lifts maps from minimal integral subrings; AGLR Definition 2.25: π-adic kimberlites require SP_X partially proper.

*Needs:* D9.11, D9.6, D9.7, D9.13, DiamondEtaleCohomology C4.5, DiamondEtaleCohomology C4.7.

(GLE, §4.4, Definition 4.30 and Propositions 4.31–4.34, p. 34.)

### D11.2 Smelted kimberlites and their specialization map

**Definition.** A smelted kimberlite is a pair K = (F, D) with F a valuative prekimberlite and D ⊂ F^an an open subsheaf that is a quasiseparated locally spatial diamond such that D → F is partially proper. Its specialization map is sp_D : |D| → |F| → |F^red|. The cases of interest are D = F^an and, for F over Spd O_K, D = F `×_(Spd O_K)` Spd(K, O_K).

*Proof sketch.* F^an → F is always partially proper for a prekimberlite (Gleason Remark 4.36), so the conditions on D = F^an reduce to it being a quasiseparated locally spatial diamond.

Its API includes the following facts.

- Pairs (F, D) with the stated conditions.
- sp_D : |D| → |F^red|, the restriction of sp_F.
- (F, F^an) when F^an is a quasiseparated locally spatial diamond.
- (F, F `×_(Spd O_K)` Spd(K, O_K)) for F over Spd O_K with that generic fibre quasiseparated locally spatial.
- Maps of pairs commute with sp.

**Checks.**

- (Spd ℤ_p, Spd ℚ_p) is a smelted kimberlite with sp_D constant.
- (Spd(ℤ_p⟨T⟩), closed disc diamond over ℚ_p) is a smelted kimberlite.
- For F = Spd(ℤ_p⟨T⟩), the open subdiamond D = {|T| ≤ |p|} (a smaller closed disc) of the generic fibre does not give a smelted kimberlite: D → F is not partially proper, the disc having a boundary.
- For F = Spd(ℤ_p⟨T⟩), D = {|T| < 1} does give a smelted kimberlite: the open disc is partially proper over Spd ℚ_p, hence over the separated closed disc, and F^an → F is partially proper.
- (F, ∅) is a smelted kimberlite for every valuative prekimberlite F.

For example, for F = Spd ℤ_p and D = Spd ℚ_p, sp_D maps the point to Spec 𝔽_p.

Applications include GLX Theorem 3.7: (`Sht^(K_p)`_μ(b), `Sht_((G,b,μ,K_p))`) is a rich smelted kimberlite; Gleason Definition 4.38: tubular neighbourhoods of D; Gleason Lemma 4.55: π₀ of D versus π₀ of F^red.

*Needs:* D11.1, D9.5, DiamondsAndVStacks D5.1, DiamondEtaleCohomology C4.5.

(GLE, §4.5, Definition 4.35(1)–(2) and Remark 4.36, p. 35; GLX, §3.1, ¶7, p. 18.)

### D11.3 Kimberlites

**Definition.** A valuative prekimberlite G is a kimberlite if (G, G^an) is a smelted kimberlite and `sp_(G^an)` : |G^an| → |G^red| is quasicompact; equivalently `sp^(-1)_(G^an)`(U) is a spatial diamond for every affine open U ⊂ G^red.

*Proof sketch.* The equivalence is Gleason Remark 4.37: quasicompactness of a spectral-type map is tested on affine opens.

Its API includes the following facts.

- Valuative prekimberlite with (G, G^an) smelted and `sp_(G^an)` quasicompact.
- Equivalently `sp^(-1)`(U) is spatial for affine opens U ⊂ G^red.
- The smelted kimberlite (G, G^an).

**Checks.**

- Spd ℤ_p is a kimberlite.
- Spd(ℤ_p[[T]]) ((p, T)-adic) is a kimberlite whose analytic locus contains characteristic-p points.
- The formal affine line over ℤ_p with doubled origin gives a v-sheaf that is not formally separated, so it is not a kimberlite (not even a prekimberlite).
- The empty v-sheaf is a kimberlite.

For example, Spd ℤ_p is a kimberlite.

Applications include GLX ¶4–6: v-sheaves of formal schemes and v-sheaf local models are kimberlites; Gleason Theorem 4.40(2): sp of a kimberlite is closed.

*Needs:* D11.2, DiamondsAndVStacks D5.1.

(GLE, §4.5, Definition 4.35(3) and Remark 4.37, p. 35; AGLR, §2.3, footnote 1, p. 14.)

### D11.4 Formal schemes give kimberlites

**Theorem.** For a separated formal scheme 𝔛 over ℤ_p as in D9.7, with complete separated affine rings and finitely generated ideals of definition containing p, 𝔛^♢ is a kimberlite. On |(𝔛^♢)^an| its specialization sends a bounded valuation to the prime ideal of elements of value less than 1, viewed in |𝔛_red| = |(𝔛_red)^perf|. For locally noetherian 𝔛 this agrees with the classical specialization λ of AdicSpacesPartIII R2.

*Proof sketch.* Valuative prekimberlite: D9.7 and D11.1. (𝔛^♢)^an = (𝔛^ad_a)^♢ is a locally spatial diamond (DiamondsAndVStacks D6.5); quasiseparated since 𝔛 is separated. Over an affine open Spf A ⊂ 𝔛 with ideal of definition (f_1, …, f_n), `sp^(-1)`(Spec A_red) = Spa(A, A)_a^♢ is the finite union of the rational subsets {|f_j| ≤ |f_i| ≠ 0}, hence spatial: sp is quasicompact.

For example, for 𝔛 = Spf ℤ_p⟨T⟩, sp on the generic fibre is the reduction of coordinates. For 𝔛 = Spf ℤ_p[[T]], the analytic locus is the union of {|p| ≤ |T| ≠ 0} and {|T| ≤ |p| ≠ 0}.

**Checks.**

- For Spf O_C with ideal (p), there is one analytic point, one reduction point and specialization 1 → 1; thus the general theorem supplies a nonnoetherian example for D11.17.
- For Spf ℤ_p[[T]], two rational charts, using p and T, cover the analytic part; the T-chart has characteristic-p points.
- For the zero ring there are zero analytic charts with nonempty spectrum and the specialization map ∅ → ∅ is quasicompact. Finite generation cannot be replaced in this proof by an infinite list of generators.

*Needs:* D9.7, D11.1, D11.3, AdicSpacesPartIII R2.4, AdicSpacesPartIII R2.3, DiamondsAndVStacks D6.5, AdicSpacesPartIII F0.3/R2.3 (gap:finite-ideal-formal-schemes).

(GLE, §4.3–4.5, Propositions 4.17 and 4.31, Remark 4.37, pp. 30–35; AGLR, §2.3, footnote 1, p. 14; GLX, §3.1, ¶5–6 and diagram (3.2), pp. 17–18.)

### D11.5 Tubular neighbourhoods of smelted kimberlites

**Definition.** For a smelted kimberlite K = (F, D) and a constructible locally closed S ⊂ |F^red|, the tubular neighbourhood is `D^⊚_(/S)` = `F̂_(/S)` ×_F D; for a kimberlite G write `G^⊚_(/S)` = `Ĝ_(/S)` ×_G G^an. Then (`F̂_(/S)`, `D^⊚_(/S)`) is a smelted kimberlite, and `D^⊚_(/S)` is the open subdiamond of D with underlying space the interior of `sp_D^(-1)`(S), which is the largest generization-stable subset of `sp_D^(-1)`(S); it is not the whole fibre in general.

*Proof sketch.* `F̂_(/S)` is a valuative prekimberlite (D11.1), `D^⊚_(/S)` → `F̂_(/S)` is open and partially proper by base change, and `D^⊚_(/S)` → D is an open immersion (D9.9), so `D^⊚_(/S)` is a quasiseparated locally spatial diamond. Interior: `D^⊚_(/S)` ⊂ (`sp^(-1)`_D S)^int ⊂ T, T the largest generization-stable subset; conversely for x ∈ T all generizations specialize into S, so a formalizable geometric point over x factors through `F̂_(/S)` (D9.8).

Its API includes the following facts.

- `D^⊚_(/S)` = `F̂_(/S)` ×_F D.
- (`F̂_(/S)`, `D^⊚_(/S)`) is a smelted kimberlite.
- |`D^⊚_(/S)`| is the interior of `sp_D^(-1)`(S) in |D|.
- `D^⊚_(/S)` → D is an open immersion.
- Tubes pull back along maps of smelted kimberlites (from D9.8).

**Checks.**

- For the kimberlite Spd(ℤ_p⟨T⟩) and S the origin of `A¹_(𝔽_p)`, the tube is the open unit disc |T| < 1 over ℚ_p (the diamond of Spf(ℤ_p[[T]])_η).
- For a perfectoid field C with C⁺ of rank > 1, sp_C is a homeomorphism Spa(C, C⁺) → Spec(C⁺/C°°); for x the closed point, `sp^(-1)`(x) is the closed point of Spa(C, C⁺), whose interior is empty, so the tube over x is empty although the fibre is not (Gleason Example 4.43).
- For S = |F^red|, `D^⊚_(/S)` = D; for S = ∅ it is empty.
- For 𝔛 a formal scheme topologically of finite type over ℤ_p and x a closed point, |`(𝔛^♢)^⊚_(/x)`| is Berthelot's tube ]x[ of AdicSpacesPartIII R2.4.

For example, for S = |F^red| the tube is D.

Applications include GLX ¶10, (3.10)–(3.11) and Theorem 3.8: tubes of integral shtuka moduli and of local models, and their connectedness; Gleason Definition 4.52(3): topological normality: connected tubes at closed points; Gleason Proposition 4.45: density of tubes in fibres for constructibly Jacobson D.

*Needs:* D11.2, D9.8, D9.9, D11.1.

(GLE, §4.5, Definition 4.38 and Proposition 4.39 with proof, p. 35; AGLR, §2.3, Definition 2.28, p. 15, and Example 2.29, p. 16.)

### D11.6 Specialization maps of smelted kimberlites are spectral and closed for kimberlites

**Theorem.** For a smelted kimberlite (F, D), sp_D : |D| → |F^red| is a specializing spectral map of locally spectral spaces (continuous for the constructible topologies). For a kimberlite G, `sp_(G^an)` : |G^an| → |G^red| is closed.

*Proof sketch.* Specializing: D11.1 and partial properness of D → F. Spectral: work on spatial opens; a formalizable cover X = Spa(A, A⁺) → D gives a commutative square with sp_X, which is patch-continuous, and with g^red : Spec(A⁺_red) → F^red, patch-continuous because F^red is a scheme (D8.5); g is a surjection of compact Hausdorff patch spaces, hence a quotient map. Closed for kimberlites: a spectral specializing map of spectral spaces is closed (AdicSpacesPartII R0.19.3), applied over affine opens using quasicompactness of `sp_(G^an)`.

For example, for the formal disc, sp on the closed disc over ℚ_p is closed and surjective onto `A¹_(𝔽_p)`.

*Needs:* D11.2, D11.3, D11.1, D9.1, AdicSpacesPartII R0.19.3, AdicSpacesPartII R0.19.1, Mathlib `IsSpectralMap`.

(GLE, §4.5, Theorem 4.40 with proof, pp. 35–36; Introduction, Theorem 9, p. 5.)

### D11.7 Formally closed immersions and étale formal neighbourhoods preserve kimberlite structures

**Theorem.** Let f : G → F be a formally closed immersion. If F is specializing (resp. a prekimberlite, a kimberlite) so is G, and if (F, D) is a smelted kimberlite so is (G, G ∩ D). If V → F^red is quasicompact, separated and étale and (F, D) is a smelted kimberlite (resp. F a kimberlite), then (`F̂_(/V)`, D ×_F `F̂_(/V)`) is a smelted kimberlite (resp. `F̂_(/V)` a kimberlite).

*Proof sketch.* Specializing: G is separated as a subsheaf and (G^red)^⋄ → G is injective by formal adicness; v-formalizing by the argument of D9.3 applied to G ×_F Spd(R⁺). Prekimberlite: (G^red)^⋄ → G is a closed immersion and (G^red)^⋄ → (F^red)^⋄ formally closed, so G^red is a closed subscheme (D8.13). Smelted and kimberlite: closed immersions are partially proper and quasicompact; G ∩ D is a quasiseparated locally spatial diamond (DiamondsAndVStacks D5.2). Étale case: D9.12, D11.1 and DiamondsAndVStacks D5.5.

For example, the special fibre (F^red)^⋄ → F of a kimberlite is a formally closed immersion and is a kimberlite with empty analytic locus.

*Needs:* D8.10, D8.13, D9.3, D9.12, D11.3, D11.2, DiamondsAndVStacks D5.2.

(GLE, §4.5, Propositions 4.41 and 4.42 with proofs, pp. 35–36.)

### Examples

For the formal closed disc, the tube at the origin is the open disc, while the full specialization fibre also contains higher-rank boundary points. For a rank-two field pair the closed-point fibre has one point and its interior is empty. This separates tubes from point fibres and the kimberlite axioms from richness (GLE Propositions 4.39–4.40 and Example 4.43).

### Dependencies

D8–D10; DiamondsAndVStacks D3–D6; DiamondEtaleCohomology C4; AdicSpacesPartIII R2.3–R2.4.

## Layer D11b: Richness and connected components

Richness adds constructible density and surjective specialization. D11.14 proves the component bijection for topologically normal rich smelted kimberlites whose reduction has closed specializations.

### D11.8 Constructibly Jacobson diamonds

**Definition.** A locally spatial diamond X is constructibly Jacobson (a cJ-diamond) if its rank-one points are dense in |X| for the constructible topology. Surjective images of cJ-diamonds, open subdiamonds of cJ-diamonds, quotients of cJ-diamonds by quasi-pro-étale J-torsors (J profinite) and étale maps to cJ-diamonds have the property; diamonds of adic spaces topologically of finite type over a complete nonarchimedean field K over ℤ_p are cJ, since Max(A) ⊂ Spa(A, A°) is patch-dense for A topologically of finite type over K (Huber); perfectoid unit balls are cJ.

*Proof sketch.* Permanence (Gleason Proposition 4.46): maps of locally spatial diamonds are spectral and generalizing; open immersions preserve patch-opens; étale maps are locally open immersions composed with finite étale maps (DiamondsAndVStacks D5.7), reduced to Galois covers, i.e. to torsors under finite groups, for which f is patch-open because the patch topology commutes with limits and `f^(-1)`(f(U)) = J·U. Huber's theorem gives patch density of classical points, which are rank one (Gleason Theorem 4.47, Corollary 4.48).

Its API includes the following facts.

- Rank-one points are dense in the constructible topology.
- Surjective images of cJ-diamonds are cJ.
- Open subdiamonds of cJ-diamonds are cJ.
- Étale over a cJ-diamond implies cJ.
- The base of a quasi-pro-étale profinite torsor with cJ total space is cJ.
- X^♢ for X topologically of finite type over Spa(K, O_K) is cJ.
- Every nonempty patch-open (constructible) subset contains a rank-one point.

**Checks.**

- Spd(C, O_C) is cJ.
- Spd(C, C⁺) with C⁺ of rank two is not cJ: its closed point is a patch-open set without rank-one points.
- For C of characteristic p, the perfectoid ball Spa(C⟨`T^(1/p^∞)`⟩) is cJ: Frobenius perfection identifies its diamond with that of the characteristic-p closed disc.
- The empty diamond is cJ.
- In the two-point Sierpiński space the open point alone is not constructibly dense: the closed point is constructible (the space of Spa(C, C⁺) for C⁺ of rank two).

For example, Spd(C, O_C) is a cJ-diamond (one rank-one point).

Applications include Gleason Proposition 4.45: tubes are dense in specialization fibres; Gleason Definition 4.52: richness requires D to be cJ; GLX Theorem 3.7: local Shimura varieties at parahoric level are cJ (part of richness).

*Needs:* DiamondsAndVStacks D5.1, DiamondsAndVStacks D5.7, DiamondsAndVStacks D3.10, AdicSpacesPartII R0.19.1, AdicSpacesPartII R0.9 (K-affinoid carrier), RigidAnalyticGeometry §8.2 (*classical-points-constructible-density*), Mathlib `constructibleTopology`.

(GLE, §4.6, Definition 4.44, Proposition 4.46, Theorem 4.47, Corollary 4.48 and Example 4.49, pp. 36–37.)

### D11.9 Tubes are dense in specialization fibres for constructibly Jacobson diamonds

**Theorem.** If (F, D) is a smelted kimberlite with D a cJ-diamond and S ⊂ |F^red| is constructible (locally closed), then |D ∩ `F̂_(/S)`| = |`D^⊚_(/S)`| is dense in `sp_D^(-1)`(S).

*Proof sketch.* |`D^⊚_(/S)`| is the largest generization-stable subset of `sp_D^(-1)`(S) (D11.5). `sp_D^(-1)`(S) is patch-open (sp_D is patch-continuous, D11.6), so rank-one points are dense in it; rank-one points are generization-stable (they have no proper generizations), hence lie in the tube.

For example, for the formal disc and S the origin, the open disc is dense in the closed fibre `sp^(-1)`(0), which also contains the rank-two points at the boundary.

*Needs:* D11.5, D11.8, D11.6.

(GLE, §4.6, discussion before Example 4.43, Example 4.43 and Proposition 4.45, p. 36.)

### D11.10 Diamonds with enough facets

**Definition.** For a perfectoid field C of characteristic p, a locally spatial diamond X over Spa(C, O_C) has enough facets if it has a v-cover ⨿_i Spd(A_i, A_i°) → X with each A_i topologically of finite type over C itself. Having enough facets is stable under base change to perfectoid extensions C → C' and fibre products over Spa(C, O_C), implies cJ, and holds for Spd(A, A°) with A smooth topologically of finite type over an untilt C^♯.

*Proof sketch.* Stability: topologically finite type is stable under completed tensor products and field extension. cJ: D11.8 (surjective images and tft case). Smooth case: étale locally map to a torus, pull back along the perfectoid torus and use invariance of the étale site under tilting (PerfectoidSpaces P3.20) to cover by Spd of tft algebras over C (Gleason Proposition 4.51).

Its API includes the following facts.

- A v-cover by Spd of topologically finite type algebras over C.
- Stable under perfectoid field extension.
- Stable under fibre products over Spa(C, O_C).
- Enough facets implies cJ.
- Spd(A, A°) has enough facets for A smooth tft over C^♯.

**Checks.**

- The closed disc over C has enough facets.
- Spa(C, O_C) itself has enough facets.
- Let L be the completed perfection of C(T) for the Gauss norm, with residue field `k_C(T^(1/p^∞))`, and let L⁺ ⊂ O_L be the inverse image of the T-adic valuation ring of that residue field. Then O_C ⊂ L⁺, so Spd(L, L⁺) lies over Spa(C, O_C). It has two points, one of rank one; the rank-two closed point is a patch-open singleton without rank-one points, so Spd(L, L⁺) is not cJ and does not have enough facets. (Spa(C, C⁺) with C⁺ ⊊ O_C is not a test case here: the identity of C does not carry O_C into C⁺, so it has no structure map to Spa(C, O_C).)

For example, Spd(C⟨T⟩, O_C⟨T⟩) has enough facets.

Applications include Gleason §5: Demazure resolutions of B_dR⁺-Grassmannians have enough facets, giving richness; GLX §3.4: richness of integral shtuka moduli.

*Needs:* D11.8, DiamondsAndVStacks D6.5, DiamondsAndVStacks D5.1.

(GLE, §4.6, Definition 4.50 and Proposition 4.51 with proof, p. 37.)

### D11.11 Rich smelted kimberlites

**Definition.** A smelted kimberlite K = (F, D) is rich if F is valuative, D is a cJ-diamond, |F^red| is locally noetherian and sp_D : |D| → |F^red| is surjective; a kimberlite G is rich if (G, G^an) is. Constructible formal neighbourhoods and étale formal neighbourhoods preserve rich smelted kimberlites.

Richness and topological normality are distinct predicates with separate APIs (D11.12).

*Proof sketch.* Permanence: D11.8 (open and étale), D9.9 and D9.10 (Gleason Proposition 4.54).

Its API includes the following facts.

- Valuative, cJ, locally noetherian reduction, surjective sp_D.
- (G, G^an) is rich.
- sp_D is surjective.
- Constructible formal neighbourhoods preserve richness.
- Étale formal neighbourhoods preserve richness.

**Checks.**

- (Spd ℤ_p, Spd ℚ_p) is rich.
- For 𝔛 separated, flat and topologically of finite type over Spf ℤ_p, (𝔛^♢, 𝔛^♢_η) is rich: cJ by Huber's theorem, surjective sp from the Tate specialization theorem D9.1 on affine formal charts.
- For F = Spd(𝔽_p[T]) with the discrete topology, a valuative prekimberlite with empty analytic locus, the pair (F, ∅) is a smelted kimberlite but not rich: sp_∅ is not surjective.
- A pair whose D contains Spd(C, C⁺) with C⁺ of rank two as an open is not rich: D is not cJ.
- The empty pair is rich.

For example, (Spd ℤ_p, Spd ℚ_p) is rich.

Applications include Gleason Lemma 4.53: sp_D is a quotient map for rich pairs; Gleason Lemma 4.55: component bijection for topologically normal rich pairs; GLX Theorem 3.9: π₀ of local Shimura varieties equals π₀ of affine Deligne–Lusztig varieties.

*Needs:* D11.2, D11.8, D11.1, D9.13, D9.9.

(GLE, §4.6, Definition 4.52(1)–(2) and Proposition 4.54, pp. 37–38; GLX, §3.4, Theorem 3.7 and footnote 18, p. 21.)

### D11.12 Topologically normal rich smelted kimberlites

**Definition.** A rich smelted kimberlite (F, D) is topologically normal if for every closed point x ∈ |F^red| the tubular neighbourhood `D^⊚_(/x)` is connected. This predicate is separate from richness.

*Proof sketch.* Closed points of a locally noetherian |F^red| are constructible, so `D^⊚_(/x)` is defined (D11.5).

Its API includes the following facts.

- Every closed-point tube is connected (rich pair).
- `D^⊚_(/x)` is connected for closed x.
- Constructible formal neighbourhoods of closed points inherit topological normality.

**Checks.**

- (Spd(ℤ_p⟨T⟩), closed disc) is topologically normal: each tube is an open disc.
- For 𝔛 = Spf ℤ_p⟨x, y⟩/(x(x − p)), flat but not normal, the reduction is `A¹_(𝔽_p)` and the tube at a closed point is the disjoint union of the two open discs on x = 0 and x = p, so the rich pair (𝔛^♢, 𝔛^♢_η) is not topologically normal.
- (Spd ℤ_p, Spd ℚ_p) is topologically normal: the only tube is Spd ℚ_p.

For example, for a flat normal formal scheme topologically of finite type over Spf O, tubes at closed points are connected, so (𝔛^♢, 𝔛^♢_η) is topologically normal.

Applications include Gleason Lemma 4.55: the component bijection; GLX Theorem 3.8 / Gleason–Lourenço: tubes of local models are connected; AGLR Proposition 2.39: connected tubes detect normality of weakly normal formal schemes.

*Needs:* D11.11, D11.5, Mathlib `PreconnectedSpace`.

(GLE, §4.6, Definition 4.52(3) and footnote 7, p. 37; GLX, §3.4, proof of Theorem 3.9 and footnote 20, p. 22.)

### D11.13 Specialization of a rich smelted kimberlite is a quotient map

**Theorem.** If K = (F, D) is a rich smelted kimberlite then sp_D : |D| → |F^red| is a quotient map.

*Proof sketch.* The statement is local on |F^red|; reduce to F^red = Spec A with finitely many irreducible components (local noetherianity). Irreducible case: take r ∈ |D| over the generic point g, formalizable by Spa(C, O_C) → D; let C_min be the minimal ring of integral elements of C with C_min/C°° ⊇ A; Spa(C, C_min) → `(F^red)^(⋄/◦)` lifts to D by valuativity. |Spa(C, C_min)| → |F^red| is specializing, surjective and spectral between spectral spaces, hence closed (AdicSpacesPartII R0.19.3), hence a quotient map; it factors through sp_D, which is therefore a quotient map; finitely many components are handled the same way.

For example, for (Spd ℤ_p⟨T⟩, closed disc) the quotient topology on `A¹_(𝔽_p)` from the closed disc is the Zariski topology.

*Needs:* D11.11, D11.1, D11.6, D9.11, AdicSpacesPartII R0.19.3, Mathlib `Topology.IsQuotientMap`.

(GLE, §4.6, Lemma 4.53 and proof, p. 37.)

### D11.14 Gleason's connected-components theorem

**Theorem.** Let K = (F, D) be a topologically normal rich smelted kimberlite such that every point of |F^red| specializes to a closed point. Then π₀(sp_D) : π₀(|D|) → π₀(|F^red|) is bijective (GLE Lemma 4.55, whose proof uses a closed specialization).

Closed-specialization condition: for each y ∈ |F^red| there is a closed point x of |F^red| with y specializing to x. It holds when |F^red| is quasicompact (a nonempty closed subset of a quasicompact sober space contains a closed point) and when F^red is the perfection of a scheme locally of finite type over a field (such a scheme is Jacobson, so closed points are dense in every closed subset). GLE prints the lemma without this condition, but local noetherianity of |F^red|, which richness provides, does not imply it (second Check below), and topological normality constrains only the tubes at closed points; the theorem is therefore stated with the condition, which every application below satisfies.

*Proof sketch.* Surjectivity of sp_D gives surjectivity on connected components. For a clopen partition |D| = U ⊔ V, each image is stable under specialization because sp_D is specializing and U,V are closed. If the two images meet, use the closed-specialization condition to choose a common closed specialization x. Local noetherianity of the underlying topology makes {x} constructible. Tube density and topological normality make `sp_D^(-1)`(x) connected, contradicting the partition. Thus every clopen subset of |D| is saturated under sp_D. Apply D11.13: saturated clopens descend to clopens of |F^red|. To pass from clopens to actual connected components, use that a locally noetherian space is locally connected and its components are open. Restrict to the open preimage of each base component; any disconnection there gives a clopen in |D|, whose descended partition would disconnect that base component. Each such preimage is therefore connected, giving injectivity on π₀.

For example, for a flat normal formal scheme 𝔛 topologically of finite type over Spf O with k algebraically closed, π₀(𝔛_η) = π₀(𝔛_red), the classical fact recovered here. Non-example: for 𝔛 = Spf ℤ_p⟨x, y⟩/(x(x − p)) the generic fibre is two disjoint closed discs while the reduction `A¹_(𝔽_p)` is connected; the pair is rich but not topologically normal and π₀(sp) is not injective.

**Checks.**

- Spd O has component map 1 → 1 and satisfies the closed-specialization condition. The empty rich pair has component map ∅ → ∅ and satisfies it vacuously.
- On the perfect valuation spectrum with primes 𝔭₀ ⊊ 𝔭₁ ⊊ ⋯ and maximal limit 𝔪, delete 𝔪. The remaining space has finite initial-segment open neighbourhoods, hence is locally noetherian, but every 𝔭ₙ specializes to 𝔭ₙ₊₁ and none is closed. Its number of closed points is 0 and its closed-specialization condition is false. This is a counterexample to the topological inference, not an asserted rich kimberlite.
- For Spf ℤ_p⟨x,y⟩/(x(x−p)), the component map is 2 → 1 and every closed-point tube has two components; topological normality fails. Thus topological normality cannot be dropped.

Applications include GLX Theorem 3.9 and §6: π₀(`Sht_((G,b,μ,K_p))` × Spd F) ≅ π₀(`X^(K_p)`_μ(b)); Gleason Theorem 5.1 / Theorem 11: normality of B_dR⁺-Grassmannians implies component results.

*Needs:* D11.12, D11.11, D11.9, D11.6, Mathlib `ConnectedComponents`, Mathlib `IsClopen`, D11.13.

(GLE, §4.6, Lemma 4.55 and proof, p. 38; Introduction, Definition 10 and the paragraph after Theorem 11, pp. 5–6; GLX, §3.4, Theorem 3.9 and its proof, p. 22.)

### Examples

For O_E⟨x,y⟩/(x(x−π)), the reduction is the line with one component, while the generic fibre has two closed-disc components. Its closed-point tube has two open-disc components, so topological normality fails and the component map 2 → 1 is not injective. For Spd O_E the component map is 1 → 1 (GLE Definition 4.52 and Lemma 4.55; both reductions satisfy the closed-specialization condition).

### Dependencies

D7–D9, D11a; DiamondsAndVStacks D0, D3, D5, D6; AdicSpacesPartII R0.9, R0.19; RigidAnalyticGeometry §8.2; Mathlib constructible topology, quotient maps and connected components.

## Layer D11c: π-adic kimberlites and specialization triples

The π-adic theory adds formal adicness over the DVR and a v-local flatness condition. It supplies the normal-formal-scheme application of D11b and the recovery theorem for specialization triples.

### D11.16 π-adic prekimberlites and kimberlites over Spd O

**Definition.** A small v-sheaf X over Spd O is a π-adic prekimberlite if it is v-locally formal, X → Spd O is separated and formally adic, and X^red is represented by a perfect k-scheme; equivalently X is a prekimberlite with X → Spd O formally adic, in which case X^an = X_η and (X^red)^⋄ = X_s. A π-adic prekimberlite is a π-adic kimberlite if X_η is a locally spatial diamond, sp_X restricted to |X_η| is quasicompact and SP_X is partially proper; equivalently X is a kimberlite formally adic over Spd O. The rule X ↦ (X_η, X^red, sp_X) is functorial, sp_X : |X_η| → |X^red| is spectral when X_η is locally spatial, and closed for π-adic kimberlites.

O is a complete discrete valuation ring, flat over ℤ_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X `×_(Spd O)` Spd F and X_s = X `×_(Spd O)` Spd k.

*Proof sketch.* Equivalences: formal adicness over Spd O gives X^an = X_η and (X^red)^⋄ = X_s; formal separatedness by the argument of D8.11 with O for ℤ_p (AGLR Proposition 2.24, Remark 2.26). Functoriality and spectrality: D9.5 and D11.6 (AGLR Proposition 2.27).

Its API includes the following facts.

- v-locally formal, separated formally adic over Spd O, representable reduction.
- Locally spatial generic fibre, quasicompact sp on it, partially proper SP.
- π-adic prekimberlite iff prekimberlite with formally adic structure map.
- π-adic kimberlite iff kimberlite with formally adic structure map.
- X^an = X_η and (X^red)^⋄ = X_s.
- X ↦ (X_η, X^red, sp_X) is a functor.
- sp_X : |X_η| → |X^red| is closed.

**Checks.**

- Spd O is a π-adic kimberlite.
- Spd(A) for A π-adically complete, flat, topologically of finite type over O is a π-adic kimberlite.
- Spd(O[[T]]) with the (π, T)-adic topology is a kimberlite but not π-adic: its structure map is not formally adic.
- For A a discrete perfect k-algebra, Spd(A) is a π-adic kimberlite with empty generic fibre.
- The empty v-sheaf is a π-adic kimberlite.

For example, Spd O is a π-adic kimberlite with X_η = Spd F and X^red = Spec k.

Applications include AGLR Definition 2.36 and Theorem 2.37: the specialization-triple theorem; AGLR Proposition 4.14: v-sheaf local models are π-adic kimberlites in 𝒦; GLX §3.2: local models `M_(K_p,μ)` are kimberlites.

*Needs:* D9.6, D11.3, D8.8, D8.11, D11.6.

(AGLR, §2.3, Definitions 2.20(2), 2.23 and 2.25, Propositions 2.24 and 2.27, Remark 2.26, pp. 14–15.)

### D11.17 Flat π-adic kimberlites

**Definition.** A π-adic kimberlite X over Spd O is flat if it has a v-cover ⨿_i Spd(`R_i^(♯+)`) → X over Spd O with (R_i^♯, `R_i^(♯+)`) perfectoid pairs over F. If A → B is a map of π-adically complete flat O-algebras with A integrally closed in A[1/π] and Spd(B[1/π], B⁺) → Spd(A[1/π], A) a v-cover, then Spd(B) → Spd(A) is a v-cover; in particular Spd(A) is a flat π-adic kimberlite for such A, and Spd(A) is flat for A the π-adic completion of a flat O-algebra of finite type. For a flat π-adic kimberlite sp : |X_η| → |X^red| is surjective; conversely a π-adic kimberlite proper over Spd O with surjective sp is flat.

O is a complete discrete valuation ring, flat over ℤ_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X `×_(Spd O)` Spd F and X_s = X `×_(Spd O)` Spd k.

*Proof sketch.* Cover criterion: Spd(B) → Spd(A) is quasicompact (Gleason Lemma 2.26), so it suffices to check surjectivity on points; on the special fibre reduce to surjectivity of Spa(B/π) → Spa(A/π) (D7.10) and lift points through the surjective Tate specialization of (A[1/π], A) (AGLR Proposition 2.32). Finite type case: reduce to A reduced using D10.13 (1); the integral closure A' of A in A[1/π] is finite, Spd(A') is flat, and Spd(A') → Spd(A) is a v-cover (AGLR Proposition 2.33). Surjectivity of sp for flat X from D9.1 on Spd(`R^(♯+)`); the converse by covering X_η with affinoid perfectoids, formalizing, and extending points by partial properness (AGLR Proposition 2.35).

Its API includes the following facts.

- A v-cover by Spd of integral perfectoid rings over F.
- Spd(A) is flat for A flat π-adically complete and integrally closed in A[1/π].
- Spd(A) is flat for A the π-adic completion of a flat finite type O-algebra.
- Flat implies sp : |X_η| → |X^red| surjective.
- Proper with surjective sp implies flat.

**Checks.**

- Spd O is flat. For B = O⟨X,Y⟩/(Y²−π²X), z = Y/π is absent from B, integral by z² = X, and B⁺ = O⟨z⟩. Boundedness on B forces |z|² = |X| ≤ 1, so normalizing the plus ring changes no bounded valuation and does not impose normality on B.
- For a nonzero discrete perfect k-algebra A, Spd(A) is a π-adic kimberlite that is not flat: its generic fibre is empty while its reduction is not.
- For a higher-rank valuation ring V ⊃ O⟨t⟩ with the π-adic topology, Spd(V) is a flat π-adic kimberlite although its generic fibre is not dense (AGLR footnote 2).
- The empty kimberlite is flat.

For example, Spd O is flat.

Applications include AGLR Definition 2.36: the category 𝒦 consists of flat π-adic kimberlites; D11.11: surjectivity of sp is part of richness.

*Needs:* D11.16, D9.1, D7.10, D10.13, DiamondEtaleCohomology C4.1, D9.7, D11.1, D11.4.

(AGLR, §2.3, Definition 2.31, Propositions 2.32, 2.33 and 2.35, Remark 2.34, pp. 16–17.)

### D11.15 Normal formal schemes give topologically normal rich kimberlites

**Theorem.** Let 𝔛 be a separated flat normal formal scheme topologically of finite type over Spf O_E. Then 𝔛^♢ is a flat π-adic kimberlite, and the smelted kimberlite (𝔛^♢, 𝔛^♢_η) is rich and topologically normal; its tube at a closed point x is the diamond of the connected rigid space Spf(`Ô_(𝔛,x)`)^rig. Consequently sp induces a bijection π₀(𝔛^rig) ≅ π₀(𝔛_red).

E/ℚ_p complete discretely valued with perfect residue field k. Topologically of finite type makes 𝔛^♢ formally adic over Spd O_E, so its analytic locus is its generic fibre.

*Proof sketch.* Richness: valuative by D11.1; 𝔛^♢_η is the diamond of an adic space topologically of finite type over E, cJ by Huber's density theorem (D11.8); 𝔛_red is locally of finite type over k; 𝔛^♢ is a flat π-adic kimberlite (D11.17, finite-type case), so sp is surjective. Tubes: by D9.8 the formal neighbourhood of a closed point x is Spf(`Ô_(𝔛,x)`)^♢, whose generic fibre is the tube; `Ô_(𝔛,x)` is a normal complete local domain by excellence, so its rigid generic fibre is connected by D10.4’s complete-local connectedness theorem (DJ95 Lemma 7.3.5) and so is the tube (connectedness of a rigid space and of its diamond agree, DiamondsAndVStacks D6.5). The reduction has the space of 𝔛_red, which is locally of finite type over k and Jacobson, so every point has a closed specialization. Apply D11.14; perfection does not change this underlying space.

For example, for 𝔛 = Spf O_E⟨T⟩, the generic fibre is the connected closed disc and the reduction is A¹_k. The tube at a closed point x is an open disc over the finite unramified extension of E with residue field κ(x); it is an open E-disc when x is k-rational. Normality is needed: the flat non-normal Spf ℤ_p⟨x, y⟩/(x(x − p)) has disconnected tubes (D11.12).

*Needs:* D11.11, D11.12, D11.14, D11.4, D9.8, D11.17, D10.2, DiamondsAndVStacks D6.5, SchemeAndStackFoundations §0.21, D10.4.

(DJ95, §7.3, Lemma 7.3.5 and proof, p. 88 (journal pagination); GLE, Introduction, unnumbered paragraph on normal formal schemes and connected components, p. 6; §4.6, motivation before Example 4.43, p. 36; GLX, §3.1, ¶6, p. 18.)

### D11.18 The specialization-triple theorem for π-adic kimberlites

**Theorem.** Let 𝒦 be the full subcategory of v-sheaves over Spd O consisting of flat π-adic kimberlites X, quasicompact and separated over Spd O, such that (1) the Spd C-valued points of X are dense in |X_C| (C a completed algebraic closure of F), (2) X^red is a perfect k-scheme perfectly of finite type, and (3) every section Spd C → X_C formalizes to Spd O_C → `X_(O_C)`. On 𝒦 the generic-fibre functor X ↦ X_η is faithful and X ↦ (X_η, X^red, `sp_(X̆)`) is fully faithful, with X̆ = X `×_(Spd O)` Spd Ŏ.

O is a complete discrete valuation ring, flat over ℤ_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X `×_(Spd O)` Spd F and X_s = X `×_(Spd O)` Spd k.

*Proof sketch.* Faithfulness: replace X by a cover Spd(R⁺); the diagonal of Y is formally adic and closed, its pullback along (f, g) is a formally closed subsheaf of Spd(R⁺) with the same generic fibre, hence everything by the argument of D9.3. Fullness: for a map of triples, let Z be the image of a formalizable cover Spd(R⁺) → W = X `×_(Spd O)` Y under (g, f ∘ g); Z_η is the graph of f_η. Z is v-locally formal and separated; using density of C-points and formalization of C-sections, the special fibre of Z lies in the graph of f^red, so Z is formally π-adic with Z^red ≅ X^red. Z → X is an isomorphism on generic and special fibres and quasicompact, hence an isomorphism (DiamondsAndVStacks D4.9); compose with the projection to Y.

For example, for X = Spd O the triple is (Spd F, Spec k, constant map).

Applications include AGLR Theorem 1.1 and §4: local models are determined by their specialization triples; the formal-scheme analogue D10.10, without using this π-adic theorem in the proof of D10.10.

*Needs:* D11.17, D11.16, D9.3, D9.5, DiamondsAndVStacks D4.9.

(AGLR, §2.3, Definition 2.36, Theorem 2.37 and proof, pp. 17–18.)

### D11.19 Proper π-adic prekimberlites with dense generic fibre lie in 𝒦

**Lemma.** Let X be a π-adic prekimberlite proper over Spd O satisfying conditions (1)–(3) of D11.18, with X_η a spatial diamond. Then X is a π-adic kimberlite, and if |X_η| is dense open in |X| then X is flat, hence in 𝒦.

O is a complete discrete valuation ring, flat over ℤ_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X `×_(Spd O)` Spd F and X_s = X `×_(Spd O)` Spd k.

*Proof sketch.* SP_X is partially proper (D11.1, Gleason Proposition 4.32); sp is spectral between qcqs spaces, hence quasicompact. Flatness: sp is closed (D11.16), so surjectivity onto the perfectly finite type X^red reduces to hitting closed points; the formal neighbourhood of a closed point is a nonempty open, so meets the dense generic fibre, and a C-point there gives the preimage; conclude by D11.17.

For example, Spd O satisfies the hypotheses.

*Needs:* D11.18, D11.17, D11.1, D9.9.

(AGLR, §2.3, Lemma 2.38 and proof, p. 18.)

### D11.20 Normality of weakly normal formal schemes through connected tubes

**Theorem.** Let O be a complete discrete valuation ring flat over ℤ_p with algebraically closed residue field k and uniformizer π. Let A be a flat, weakly normal, π-adically complete domain topologically of finite type over O, with A[1/π] normal. If the tube at every closed point of Spec(A/π), equivalently the rigid generic fibre of the corresponding complete local formal scheme, is connected, then A is normal. Algebraic closedness is an extra hypothesis correcting AGLR Proposition 2.39; connectedness alone over a merely perfect k is insufficient.

O is a complete discrete valuation ring flat over ℤ_p, with uniformizer π, fraction field F and algebraically closed residue field k. Weak normality excludes a proper finite birational universal-homeomorphism modification by a reduced scheme (SchemeAndStackFoundations §0.26, gap:mixed-characteristic-weak-normality).

*Proof sketch.* Use D9.8 to identify each tube with the generic fibre of the completion at its closed point. Let B be the normalization of A in A[1/π]; excellence makes B finite, and B[1/π] = A[1/π]. The completion of B over a closed point x decomposes as the product of its complete local factors. Their generic fibres are disjoint, nonempty (flatness and the flat-kimberlite specialization theorem), and have union the tube of A at x. Connectedness gives exactly one point of Spec(B/π) above x. All these closed residue fields are k because k is algebraically closed. Thus the finite special-fibre map has one geometric point in each closed fibre. The Jacobson/constructibility criterion for finite maps of finite-type k-schemes gives universal injectivity everywhere; integral surjectivity makes it a universal homeomorphism. Together with the generic-fibre isomorphism this makes Spec B → Spec A a finite birational universal homeomorphism. Weak normality now implies A = B directly. No absolute-weak-normality full-faithfulness theorem is needed.

For example, for A = O⟨T⟩ with k algebraically closed, the tubes at closed points are open discs and A is normal. Non-example: for A = O⟨x, y⟩/(y² − π²x) with p ≠ 2, A[1/π] ≅ F⟨z⟩ (z = y/π, x = z²) is normal but A is not, and accordingly the tube at a closed point x = ā, with ā a nonzero square in k, is two disjoint discs |z ∓ √a| < 1. The perfect-residue-field boundary fails: take a nontrivial finite unramified extension L/ℚ_p, B = O_L and A = ℤ_p + pB. This finite flat complete local domain is weakly normal but not normal, and A[1/p] = L. Its only tube is Spa(L,O_L), which is connected but becomes disconnected after the unramified base extension. This gives a negative control to the perfect-field formulation.

Applications include AGLR §§4–7: normality of local models; Gleason footnote 7: motivates topological normality.

*Needs:* D11.17, D9.8, D11.5, SchemeAndStackFoundations §0.21, SchemeAndStackFoundations §0.26 (gap:mixed-characteristic-weak-normality), SchemeAndStackFoundations §0.26 (gap:finite-geometric-fibre-radiciality).

(AGLR, §2.3, Proposition 2.39 and proof, pp. 18–19.)

### Examples

Spd O is flat with specialization 1 → 1; a nonzero perfect discrete k-algebra gives an empty generic fibre and a nonempty reduction, so it is not flat. For a nontrivial unramified L/ℚ_p, A = ℤ_p+pO_L has normalization O_L, one special point and one connected generic tube, but A ≠ O_L. Over algebraically closed residue field that separable residue extension cannot occur (AGLR Propositions 2.35, 2.39; the negative control in D11.20).

### Dependencies

D7–D10, D11a–D11b; SchemeAndStackFoundations §§0.21, 0.23, 0.25 and §0.26 (gap:mixed-characteristic-weak-normality, gap:finite-geometric-fibre-radiciality); DiamondEtaleCohomology C4; AdicSpacesPartIII R2.2–R2.4; PerfectoidSpaces P1–P2.

## Downstream consumers

GeometricSatakeAndFusionPartII applies D10 and D11 to integral local models. Its §0.4 uses the v-closure of D10.9; §§0.5, 3.2, 6.5 and 6.6 use D10.12's proper-scheme recovery theorem; §§3.1 and 7.7 use D10.15; §3.5 uses the kimberlite structure of D11.11, D11.17 and D11.19; §3.6 uses D10.13 and D11.18; §6.4 uses D10.14's flat-closure theorem; §§7.1 and 7.5 use the tubes of D11.5 and the tube theory of D11; and §7.6 uses the normality criterion D11.20. HeckeStacksAndLocalShtukas HS2.16 states a specialization criterion for open components of shtuka moduli that assumes an identification of finite-level components with the components of the special fibre; D11.14's component bijection for topologically normal rich smelted kimberlites whose reduction has closed specializations (as perfectly finite-type reductions do) is a theorem of that kind, as in GLX Theorem 3.9. The general theory here supplies these applications without assuming their local-model or shtuka comparison theorems.

## Worked examples

The cuspidal normalization, the two formal discs, the discrete four-point olivine spectrum, the rank-two empty tube, the two-branch flat model and the unramified order occur as Checks in their defining layers. Together they distinguish forgetting nilpotents and universal-homeomorphism defects from recovering normal integral objects, and distinguish connected tubes over an algebraically closed field from connectedness over a perfect field. The Grassmannian example D10.15 is conditional on its named geometric data; for GL of a lattice of rank n and μ of dimension d, 0 ≤ d ≤ n, d = 0 and d = n both give Spec O_E and the identity comparison. Rank zero has only d = 0 and gives the same point, with no nonempty positive-dimensional Schubert cell.

## References

- **SW20**: Peter Scholze and Jared Weinstein, [Berkeley lectures on p-adic geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Annals of Mathematics Studies 207, Princeton University Press, 2020; authors' copy dated 27 March 2020 (printed page = PDF page − 10).

- **GLE**: Ian Gleason, [Specialization maps for Scholze's category of diamonds](https://arxiv.org/abs/2012.05483v4). arXiv:2012.05483v4, 10 August 2025 (printed pagination).

- **AGLR**: Johannes Anschütz, Ian Gleason, João Lourenço and Timo Richarz, [On the p-adic theory of local models](https://arxiv.org/abs/2201.01234v2). arXiv:2201.01234v2 (printed pagination).

- **LOU17**: João N. P. Lourenço, [The Riemannian Hebbarkeitssätze for pseudorigid spaces](https://arxiv.org/abs/1711.06903v1). arXiv:1711.06903v1, 18 November 2017.

- **DJ95**: A. J. de Jong, [Crystalline Dieudonné module theory via formal and rigid geometry](http://www.numdam.org/item/PMIHES_1995__82__5_0/). Publications Mathématiques de l'IHÉS 82 (1995), 5–96; Numdam copy (journal page = PDF page + 3).

- **SW13**: Peter Scholze and Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357v2). arXiv:1211.6357v2, 13 April 2013; Cambridge Journal of Mathematics 1 (2013).

- **KPZ**: Mark Kisin, Georgios Pappas and Rong Zhou, [Integral models of Shimura varieties with parahoric level structure, II](https://arxiv.org/abs/2409.03689v3). arXiv:2409.03689v3; Forum of Mathematics, Pi (2026).

- **GLX**: Ian Gleason, Dong Gyu Lim and Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/abs/2208.07195v3). arXiv:2208.07195v3, 10 November 2025; Inventiones Mathematicae (2026).

- **STACKS**: The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). Tag 07QR, More on Algebra, Lemma 15.51.8 (henselization and strict henselization of a noetherian local G-ring are G-rings).

- **BHA17**: Bhargav Bhatt, [Lecture notes for a class on perfectoid spaces](https://www.math.ias.edu/~bhatt/teaching/mat679w17/lectures.pdf). Author's lecture notes, 2017.

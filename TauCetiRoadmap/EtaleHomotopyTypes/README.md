# Roadmap: étale homotopy types and pro-spaces

**Summary.** Construct the raw étale homotopy type of locally noetherian schemes and simplicial schemes, starting from simplicial sets, ordinary pro-categories, finite étale covers and sheaf cohomology. Develop its covering theory, classifying pro-spaces, materialization and relative pointed mapping classes. The end theorems are Galois-equivariant cohomology transport, arithmetic monodromy orbit bijections, maps into products of raw étale K(π,1) varieties, and a functorial Betti–étale comparison after p-profinite completion with explicit cohomological finiteness hypotheses. The library includes all primes and arbitrary local coefficients in the raw comparison range.

## Scope and ownership

This roadmap owns homotopy pro-local systems, Isaksen’s pro-space model, pro-coverings and pro-classifying spaces, the rigid simultaneous étale construction, its raw comparisons and fiber theorem, arithmetic relative mapping-class adapters, and the p-finite model comparison and complex comparison zigzag. Ordinary spaces, the generic Pro carrier, finite étale Galois categories, analytic spaces and ordinary sheaf cohomology are supplied objects.

The ordinary Pro category and its Hom formula are stated by AdicSpacesPartII §R0.19.9; DiamondsAndVStacks §D0.13 and PerfectoidSpaces §P6.10 own bounded presentations. The specialization to simplicial sets retains their carrier and makes its additional size and reindexing requirements explicit. GeneralizedCohomology §G2.1 owns the ordinary unpointed and pointed Kan–Quillen model and simplicial enrichment; AlgebraicTopology Stages 6 and 8 own ordinary local coefficients, homotopy groups, Whitehead theory and representability; Completed/UniversalCovers Stages 2–4 own ordinary universal covers and deck transformations. StableHomotopyKTheory §§1.19–1.23 and 1.28–1.34 own discrete group nerves, translation categories and their covering/asphericity comparisons, and its §§2.3–2.6 own ordinary homotopy-fiber sequences on GeneralizedCohomology §G2.10’s mapping-path carrier. The pro-level constructions here differ by their cofiltered diagrams and derived mapping problem.

The compact compatible-family theorems, topological finite-generation predicate and finitely generated abelian pro-p structure theorem are already in the library, in the Tau Ceti modules listed below. ProfiniteProPGroups Layers 0, 3 and 4 own their profinite group interfaces. Homotopy groups use those predicates and structures without a second definition. The native singular functor, simplicial sets, abstract model-category class and abelian sheaf cohomology are already in the library and are imported with their actual size and existence hypotheses.

EtaleCohomologyFoundations §§F.0.2 and F.0.A2 own finite étale fundamental groups, étale paths and the arithmetic exact sequence; its §F.0.4 owns purely inseparable topological invariance and §F.2.6 owns finite-coefficient Künneth. SchemeAndStackFoundations §§0.9–0.12, 2.10 and 2.15 own approximation, geometric unibranchness, étale neighborhoods, site comparisons and cohomology limits. The characteristic-zero cohomological properness, local asphericity and homotopy-sequence theorems of SGA1 XIII used for the geometric product formula and the elementary-fibration sequence are §3.8a here; their non-abelian proper base change, descent, local-acyclicity and constructible-sheaf continuity inputs from SGA 4 and the Stacks Project are requested from EtaleCohomologyFoundations, which owns the abelian versions. The base-change criterion for universal local 0-acyclicity and 1-asphericity on sheaves of sets and stacks of torsors, through which SGA1 XIII Theorem 3.3 passes from descent to local asphericity, is a target of §3.8a here, since EtaleCohomologyFoundations §F.2.3 states local acyclicity for bounded constructible complexes only. CrystallineCohomology CR.5:log-algebra.4 owns the absolute Abhyankar lemma on regular local schemes with a strict normal-crossings divisor; §3.8a uses it and keeps only the relative form over an arbitrary base, whose strict localizations need not be regular, and requests the relative purity inputs of that step from LocalPurity §2.2. Orbifolds O4-N owns ordinary numerable-submersion Čech descent. EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and E2.6 own coherent categorical infrastructure, generic hypercovers and bounded-below cohomological descent. BordismFormalGroups §F6.5 owns the Cartesian Kan–Quillen monoidal model axiom and generic model-diagram rectification, including Kan-complex diagrams; §6.9 here instantiates it for the étale functor and automorphism action. ComplexComparisonPartII §C-1.1 owns analytification, §§C5.1 and C6.1 own sheaf–singular comparison, and §§C6.2–C6.3 own Riemann existence and finite Artin comparison.

The finite-coefficient K(π,1) applications, smooth-curve examples and geometric existence of hyperbolic neighborhoods belong to AnabelianGeometryAndNonabelianChabauty Layer 1. Its §1.5 states the raw pointed étale homotopy type of a pointed locally noetherian scheme as an object of the homotopy category of pointed pro-spaces, with its classifying map, the profinite π₁ of a connected geometrically unibranch variety and the finite-coefficient comparison, its §1.6 the comparison with the raw K(π,1) condition, and its §§1.10–1.11 the elementary-fibration homotopy fibre and its K(π,1) consequence, each in the form its applications use. The carriers here differ: the rigid construction of §3.3 is a strict pro-simplicial set, unpointed and functorial on the nose in degreewise locally noetherian simplicial schemes; the coefficient comparison of §3.4 covers arbitrary locally constant abelian coefficients; the profiniteness of §3.6 is proved on noetherian geometrically unibranch schemes; and the effacement criterion of §3.9b and the elementary-fibration sequence of §3.9d are stated on this rigid type with the pro-space theory of Layers 0–2 beneath them. Those sections and §§1.9, 3.3–3.6, 3.9b and 3.9d here state the same theorems of Schmidt–Stix on these different carriers; no finite-coefficient K(π,1) application is restated here, and no pro-space theory is restated there. The raw effacement and product theorems needed before those applications are §§3.9a–3.9c here. The open-image and geometric-conjugacy adapters are §§4.0a–4.0b here. The general unstable-limit interface is an explicit contract with the supplied ordinary topology supplier. A¹-local realization and motivic K-theory are outside this roadmap; ℓ-adic homotopy algebras and weights belong to EllAdicHomotopyTypesAndWeights; generic Γ-spaces and group completion belong to StableHomotopyKTheory Layers 4–6; arithmetic identification of the spectrum-level symplectic Galois action belongs to ArithmeticKTheoryPartII. No geometric existence theorem is inferred from an elementary fibration supplied as input; ComplexComparisonPartII §C6.3 constructs elementary fibrations of smooth complex varieties inside its Artin comparison, and the carrier over an arbitrary base used in §3.9d is the SchemeAndStackFoundations request named in the supplier contracts.

## Conventions

Fix universes for simplicial sets, schemes, coefficient modules and small cofiltered indexing categories. Index enlargement comes with a cofinal comparison, and small geometric-point representatives come with comparison under replacement. A family of rigid neighborhoods may be infinite. Pointed pro-objects carry compatible actual vertices. Connected means isomorphic to a diagram of connected spaces; path-connected means that the derived materialization has one path component. The empty pro-space is unpointed and is not connected.

Write Pro(C) for the ordinary size-controlled pro-category on the supplied Ind-opposite carrier. Its morphisms have the formula limⱼ colimᵢ Hom(Xᵢ,Yⱼ). Raw homotopy means Isaksen’s localization at homotopy pro-local-system equivalences; the strict model instead inverts essentially levelwise weak equivalences. Homotopy-coherent Pro of p-finite homotopy types retains mapping spaces, and is not replaced by Pro of their homotopy category. Homotopy groups are pro-sets in degree zero, pro-groups in degree one and pro-abelian groups in degrees at least two. Materialization is right-derived limit and has ordinary, underlying abstract homotopy groups.

Relative morphisms are in the slice of the homotopy category over B, with triangles commuting as morphism classes. A specified homotopy is not part of such a morphism. Multiplication of loops and target transport are normalized so that transport by α sends φ to the homomorphism γ ↦ α φ(γ) α⁻¹. With permutations composed right to left, conjugating (12) first by (123) and then by (12) gives (13); the combined conjugator is (12)(123). Conjugation by (123) alone sends (12) to (23), whereas its inverse sends (12) to (13). This fixes the direction of transport and composition.

For schemes use the small étale topology and native abelian sheaf cohomology, with sheafification and Ext existence installed in the stated universes. Raw locally constant abelian coefficients include arbitrary constant abelian groups. Finite-coefficient comparison has finite abelian coefficients. A variety means a separated finite-type scheme over the indicated field; reducedness is not needed for the raw construction, and nilpotent thickenings use étale topological invariance. A geometric closure in positive characteristic is a separable closure or an algebraic closure with the purely inseparable comparison retained. No prime is excluded from raw characteristic-zero fiber or product statements.

For the complex comparison, the input schemes are degreewise quasi-projective over ℂ; analytic realizations of their hypercover pieces use the supplier’s full locally finite-type domain, allowing infinite disjoint unions. Analytic points have their ordinary Euclidean topology; n-simplices use the real standard n-simplex with Mathlib’s explicit universe lift. On Δ¹ the ordered vertices are 0 and 1, and restriction of a singular path evaluates its corresponding endpoints. Discrete points of a simplicial scheme have degree n equal to Xₙ(ℂ). A grading is specified open-and-closed simplicial subschemes preserved by every operator, together with grade maps on morphisms. Fix a prime p, including p=2 and p=3; p=1 and p=0 are excluded. Continuous mod-p cohomology of a pro-object is a filtered colimit; ordinary cohomology of its materialization is a separate object. Cohomology of ordinary coproducts uses products; homology uses direct sums.

## Exact supplier contracts

### From Mathlib

- `SSet` is the presheaf category on the simplex category (`Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean`, line 33). `SSet.KanComplex` and `SSet.KanComplex.hornFilling` (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`, lines 40 and 45) supply the fibrancy predicate and horn extension; no pro-space model instance is part of that predicate. `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`, line 43) supplies abstract CM1–CM5, including finite limits/colimits, lifting and factorizations, without a chosen functorial factorization.
- `TopCat.toSSet`, `TopCat.toSSetObjEquiv`, `SSet.toTop`, `sSetTopAdj` and `TopCat.toSSetIsoConst` (`Mathlib/AlgebraicTopology/SingularSet.lean`, lines 50, 56, 65, 73 and 97) supply singular simplices, realization and the adjunction. The constant comparison assumes `TotallyDisconnectedSpace`; it assumes neither nonemptiness nor compactness. `CategoryTheory.Functor.diag` and `CategoryTheory.Functor.uncurry` supply the ordinary diagonal of the singular bisimplicial diagram.
- `AlgebraicGeometry.Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean`, line 50) supplies the site, and `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`, line 56) is Ext from the constant integral sheaf. It requires `HasSheafify` and `HasExt`; these are retained, rather than inferred from the notation H.
- `ContinuousMap.evalAlgHom` and `ContinuousMap.compRightAlgHom` in `Mathlib/Topology/ContinuousMap/Algebra.lean` supply point evaluation and precomposition with their topological algebra hypotheses. `CategoryTheory.Ind` in `Mathlib/CategoryTheory/Limits/Indization/Category.lean` supplies the native carrier underlying ordinary Pro.
- `CategoryTheory.Functor.rightDerived` (`Mathlib/CategoryTheory/Abelian/RightDerived.lean`, line 108), `CategoryTheory.HasInjectiveResolutions` (`Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean`, line 70) and `CategoryTheory.Limits.lim` (`Mathlib/CategoryTheory/Limits/HasLimits.lean`, line 555) supply the abelian derived-limit formalism. The resolution class asserts existence; it is not chosen resolution data. `CategoryTheory.Functor.additive_of_preserves_binary_products` (`Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean`, line 231) supplies additivity of the limit functor.
- `ProfiniteGrp.profiniteCompletion`, `ProfiniteGrp.ProfiniteCompletion.homEquiv` and `ProfiniteGrp.ProfiniteCompletion.adjunction` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean`, lines 191, 205 and 215) supply ordinary group completion and its continuous-target universal property. `ProfiniteGrp.toFiniteQuotientFunctor` and `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean`, lines 48 and 138) present a profinite group as the limit of its finite quotients. `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit` (`Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean`, lines 330 and 347) supply the limit of a diagram `J ⥤ ProfiniteGrp` over a small category `J`, with the target universe at least that of `J`, carrying its profinite topology.
- `nonempty_sections_of_finite_cofiltered_system` (`Mathlib/CategoryTheory/CofilteredSystem.lean`, line 79) supplies compatible sections of a diagram of nonempty finite sets over a small cofiltered category. `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system` (`Mathlib/Topology/Category/TopCat/Limits/Konig.lean`, line 126) supplies the compact Hausdorff version. Neither needs surjective transitions or a directed-preorder presentation; both also allow an empty index, whose limit is a point.

### From Tau Ceti

- `TauCeti.LocalCoefficientSystem` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`, line 43) is a functor from the fundamental groupoid to `ModuleCat`; `TauCeti.LocalCoefficientSystem.pullback`, `TauCeti.LocalCoefficientSystem.pullbackIdIso`, `TauCeti.LocalCoefficientSystem.pullbackCompIso` and `TauCeti.LocalCoefficientSystem.transport` (lines 75, 102, 136 and 252) supply ordinary coefficient transport. This carrier has no finite-rank or finite-monodromy condition. The pro-local-system construction is its filtered level version, using the ordinary topology comparison on simplicial realizations.
- `TauCeti.exists_forall_map_eq_of_compact_t2` and `TauCeti.exists_forall_map_eq_of_finite` (`TauCeti/Topology/Compactness/InverseSystem.lean`, lines 78 and 96) supply compatible families for nonempty compact Hausdorff systems with continuous transitions, and nonempty finite systems over a directed preorder. Surjectivity of transition maps is not required. For general cofiltered categories use the two native Mathlib results above directly; the Tau Ceti versions serve directed presentations.
- `TauCeti.LocalCoefficientSystem.twistedCochainComplex` and `TauCeti.LocalCoefficientSystem.twistedCohomology` (`TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean`, lines 79 and 84) apply Hom into a coefficient module to twisted chains. Their convention is dual-system cohomology; arbitrary direct L-valued cochains are supplied by AlgebraicTopology Stage 6, without a reflexivity assumption.
- `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` and `TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite` (`TauCeti/Topology/Algebra/Group/Profinite/Completion.lean`, lines 179 and 68) supply the unbundled continuous-target universal property, allowing a larger target universe, and bijectivity of the unit on finite groups.
- `TauCeti.IsTopologicallyFinitelyGenerated` (`TauCeti/Topology/Algebra/Group/Generation.lean`, line 73) means that a finite subset generates a dense subgroup. `TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod` (`TauCeti/Topology/Algebra/Group/Profinite/ProP/StructureTheorem.lean`, line 59) supplies the decomposition into finitely many ℤₚ factors and finite cyclic p-power factors. Its assumptions are a prime p, a compact totally disconnected topological commutative group, the pro-p predicate and topological finite generation. Use it on higher homotopy groups after identifying their profinite topology.

### From TauCetiRoadmap.AdicSpacesPartII

Section R0.19.9 supplies the Ind-opposite Pro carrier, the double-limit Hom formula with stage representatives and naturality, finite limits and flattening as cofiltered limit cones. DiamondsAndVStacks §D0.13 and PerfectoidSpaces §P6.10 supply bounded presentations and cardinal comparisons.

What AdicSpacesPartII must provide (gap:pro-universe-extension): For the native category of simplicial sets in a fixed universe and diagrams small in a fixed larger universe, extend the Ind-opposite Pro carrier with a fully faithful comparison under further universe enlargement.

What AdicSpacesPartII must provide (gap:pro-cofinal-invariance): For a small cofiltered diagram in the declared Pro carrier, prove that restriction along a cofinal inverse-index functor induces an isomorphism of pro-objects, naturally in the diagram.

What AdicSpacesPartII must provide (gap:pro-cofinite-reindexing): For every small cofiltered diagram in the declared universes, supply a cofinal presentation indexed by a cofinite directed poset.

What AdicSpacesPartII must provide (gap:pro-level-representations): For every finite loopless diagram (with no nonidentity endomorphisms) of pro-objects in a locally small category, supply an isomorphic diagram represented levelwise over one small cofiltered index.

What AdicSpacesPartII must provide (gap:pro-monomorphism-presentations): For a monomorphism of small pro-groups, supply an isomorphic level representation by injective group homomorphisms.

### From TauCetiRoadmap.AlgebraicTopology

Stages 6 and 8 supply ordinary local cohomology, Kan/cubical homotopy comparison, Whitehead and obstruction theory at their stated scopes; Completed/UniversalCovers Stages 2–4 supply ordinary covering classification and induced homotopy maps. Stage 6.1 supplies direct L-valued cochains for arbitrary abelian local systems, including non-reflexive fibers. The coefficient carrier and its pullback laws are the native Tau Ceti objects above; abelian right-derived limits use Mathlib rather than another supplier construction.

What AlgebraicTopology must provide (gap:simplicial-postnikov): For a Kan simplicial set K and n≥0, supply functorial truncations K→P_n K inducing isomorphisms on π_i for i≤n and vanishing π_i for i>n, with compatible transition maps and the fundamental-groupoid model for P_1.

What AlgebraicTopology must provide (gap:simplicial-local-whitehead): For a map of simplicial sets inducing a bijection on components and isomorphisms on fundamental groups at every basepoint, prove that it is a weak equivalence if it induces isomorphisms in every degree for every abelian local coefficient system on the target.

What AlgebraicTopology must provide (gap:simplicial-moore-postnikov): For a Kan fibration, supply its functorial Moore–Postnikov lifting tower, with each abelian-stage obstruction in the local system of the fiber homotopy group and vanishing equivalent to a lift after the specified preceding-stage adjustment.

What AlgebraicTopology must provide (gap:simplicial-covering-classification): For a connected pointed simplicial set K, classify connected pointed coverings with vertex-unique lifting by subgroups of π_1(K), with pullback followed by the component of the chosen vertex corresponding to inverse image of subgroups, and identify their geometric realizations with connected pointed ordinary covering spaces.

What AlgebraicTopology must provide (gap:local-coefficient-representability): For a simplicial set K, an abelian local system L and n≥1, identify H^n(K,L) with homotopy classes of sections of the associated twisted K(L,n)-fibration over K, naturally in K and L.

What AlgebraicTopology must provide (gap:reedy-homotopy-limits): For a diagram of Kan simplicial sets over a small category, identify its homotopy limit, with its projection maps, with the totalization of a Reedy fibrant cosimplicial replacement.

What AlgebraicTopology must provide (gap:nonabelian-lim1): For a levelwise inclusion G↪E of group diagrams over a small cofiltered category, define lim¹G as π_0(holim BG) and prove the natural pointed-set exact sequence 1→lim G→lim E→lim(E/G)→lim¹G→lim¹E.

What AlgebraicTopology must provide (gap:bk-homotopy-limit-spectral-sequence): For a small cofiltered diagram of connected pointed Kan spaces, identify the E₂ˢ,ᵗ terms of the partial-totalization homotopy spectral sequence with limˢ π_t for 0≤s≤t, retaining the nonabelian group and pointed-set fringe (BK XI 5.2 and XI 7.1; cited by locator without text).

What AlgebraicTopology must provide (gap:bk-tower-convergence): For the Reedy fibrant cosimplicial replacement of a small cofiltered diagram of connected pointed Kan spaces, prove that vanishing of all E₂ˢ,ᵗ for 1≤s≤t, including the nonabelian fringe, makes totalization connected and its edge maps π_n Tot→E₂⁰,ⁿ isomorphisms for n≥1 (BK XI 5.2, XI 7.1, IX 5.1 and IX 5.4; cited by locator without text).

What AlgebraicTopology must provide (gap:multisimplicial-diagonal): For a map of bisimplicial sets that is a weak equivalence in every row, prove that its diagonal is a weak equivalence, naturally and iterably for finitely many simplicial directions.

### From TauCetiRoadmap.GeneralizedCohomology

Section G2.1 supplies the unpointed Kan–Quillen model, its pointed undercategory, simplicial mapping objects, tensors and cotensors, and realization–singular Quillen comparison. Its Cartesian simplicial model axiom follows from the BordismFormalGroups §F6.5 monoidal model axiom by tensor–Hom adjunction, as in §0.2. Properness is the additional input below. Section G2.10 supplies the mapping-path space and mapping-path fiber of a map, the strict-fiber comparison under Hurewicz and Serre lifting, and the constant-path inclusion, on which StableHomotopyKTheory §§2.3–2.6 build the fiber sequence used in §3.9d.

What GeneralizedCohomology must provide (gap:kan-quillen-properness): Prove that the §G2.1 Kan–Quillen model is left and right proper, using its native weak equivalences, cofibrations and fibrations.

### From TauCetiRoadmap.BordismFormalGroups

Section F6.5 supplies the monoidal model axiom for the fixed Cartesian Kan–Quillen base: the pushout product of two cofibrations is a cofibration, trivial if either factor is trivial. Combine it with GeneralizedCohomology §G2.1’s Cartesian mapping objects, tensors and cotensors in §§0.2 and 6.2. Its “Coherent model diagrams and stable enhancements” block supplies the equivalence between coherent diagrams and strict model diagrams, including its Kan-complex instance, restriction functors and derived unit/counit. Use this theorem in §6.9 with the declared universe of schemes or of the discrete automorphism group; the actual étale diagram and its equivariant comparison are constructed here.

### From TauCetiRoadmap.StableHomotopyKTheory

Sections 1.19–1.23 and 1.28–1.34 supply simplicial covering/realization compatibility, translation categories, discrete BG and EG, the chosen π₁ identification and groupoid nerves. The group nerve convention identifies edge(g) with g and edge(gh) with edge(h) followed by edge(g); transport uses the corresponding α φ α⁻¹ convention. On S₃ this sends (12) by (123) to (23), as fixed above.

Sections 2.3–2.6 supply the ordinary homotopy-fiber sequence used at each finite level of §3.9d: the strict fiber of a Hurewicz fibration is homotopy equivalent, and that of a Serre fibration weakly equivalent, to the homotopy fiber; the connecting map δ:πₙ₊₁B→πₙF, a homomorphism for n≥1 and pointed at n=0; exactness of the long sequence of every based map; and the π₁(B)-action on π₀F whose orbits are the fibers of π₀F→π₀A and whose base stabilizer is the image of π₁A. For the based map *→BS₃ the homotopy fiber is the discrete six-point S₃, δ:π₁BS₃→π₀F is a bijection and the action is the regular one; for id:BS₃→BS₃ the fiber is connected and δ is trivial. AlgebraicTopology Stage 8 is not used for these statements: its exact sequence is that of a based pair.

What StableHomotopyKTheory must provide (gap:surjective-nerve-fibration): Supply the native Kan-fibration criterion for the nerve of a surjective group homomorphism, compatible with the translation-category quotient models of §§1.28–1.34 and their right actions.

### From TauCetiRoadmap.Orbifolds

Section O4-N, under O4 item 3, supplies realization descent for the Čech nerve of a numerable surjective submersion using actual local sections and a subordinate partition of unity. The smooth quasi-projective complex application in §5.3a verifies those hypotheses on its analytic carrier. General hypercover realization is the EnhancedDerivedSheaves contract below; the multisimplicial diagonal comparison is the AlgebraicTopology contract above.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections E0.2–E0.5 and E0.8 supply mapping spaces, coherent localizations, functor categories, spaces, smallness and filtered diagrams. Section E2.6 supplies generic hypercovers with degree-zero matching and uniformly bounded-below cohomological descent, including refinement. Its sheaf-descent conclusion is used only for cohomology.

What EnhancedDerivedSheaves must provide (gap:coherent-pro-category): For an essentially small infinity-category C, construct Pro(C) as its free completion under small cofiltered limits, retaining its coherent universal property.

What EnhancedDerivedSheaves must provide (gap:coherent-pro-mapping): For small cofiltered diagrams X:I→C and Y:J→C, prove Map_Pro(C)(X,Y)≃lim_j colim_i Map_C(X_i,Y_j), as an equivalence of spaces natural in both diagrams.

What EnhancedDerivedSheaves must provide (gap:coherent-pro-universes): For a fully faithful universe enlargement C→C′, prove full faithfulness of the induced Pro comparison on diagrams whose indexing categories lie in the smaller specified universe.

What EnhancedDerivedSheaves must provide (gap:topological-hypercover-realization): For an augmented simplicial topological space U_•→T whose every matching map, including U_0→T, has local continuous sections covering its target, prove diag Sing(U_•)→Sing(T) a weak equivalence, without a finiteness assumption on the set of pieces.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.9–0.12 supply approximation, geometric unibranchness and étale neighborhoods; §§2.10 and 2.15 supply site comparisons and étale cohomology. Section 2.15 supplies continuity of abelian sheaf cohomology for qcqs inverse systems with affine transitions and compatible coefficient sheaves. Its geometric field-extension application uses constant coefficients and does not assume descent of arbitrary infinite-group torsors.

What SchemeAndStackFoundations must provide (gap:connected-etale-components): For a locally noetherian scheme and a separated étale neighborhood, prove that the connected component through a specified geometric point is open and remains separated étale over the base.

What SchemeAndStackFoundations must provide (gap:elementary-fibration-carrier): Define an elementary fibration X→Y as the complement of a finite étale relative divisor in a smooth proper geometrically connected relative curve over Y, with every complement fiber nonempty and affine; no existence theorem is requested.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Section F.0.2 supplies finite étale Galois categories, the geometric fiber functor, its profinite automorphism group, étale paths and finite continuous-set/monodromy equivalences. Section F.0.A2 supplies the exact geometric/arithmetic fundamental-group sequence for quasi-compact geometrically connected schemes over a field, using an algebraic closure and retaining path choices for sections. Section F.0.4 supplies topological invariance under purely inseparable and nilpotent changes. Section F.2.6 supplies finite-coefficient geometric Künneth, with its Tor and invertibility hypotheses. In characteristic zero every finite coefficient order is invertible. Section 0.10 supplies the boundary formula for Rj_* along a smooth divisor, and §F.3 supplies lisse direct images under proper smooth maps and constructibility of direct images for finite-type schemes over a field; both are used with finite abelian coefficients.

What EtaleCohomologyFoundations must provide (gap:nonabelian-proper-base-change): For a proper morphism, prove base change for the direct image of an étale sheaf of sets and for R¹ with coefficients in an ind-finite sheaf of groups (SGA 4 XII 5.1), and for the direct image of every ind-finite stack, including the direct image along a coherent morphism of the stack of torsors under a finite constant group, which is not a torsor stack (SGA1 XIII Example 1.4 and Corollary 1.8).

What EtaleCohomologyFoundations must provide (gap:proper-surjective-torsor-descent): Prove that proper surjective morphisms of finite presentation are of universal effective descent for étale sheaves of sets and for their stacks of torsors under finite constant groups (SGA 4 VIII 9.4).

What EtaleCohomologyFoundations must provide (gap:nonabelian-local-acyclicity): Define 0-acyclic morphisms f, those for which the unit F → f_*f^*F is bijective for every étale sheaf of sets F on the base, and locally 0-acyclic and locally 1-aspheric morphisms for a set of primes through the fibres of strict localizations, and prove that smooth morphisms are universally locally 1-aspheric for the primes invertible on the base, that flat finitely presented morphisms with geometrically reduced fibres are universally locally 0-acyclic, and that a coherent locally 0-acyclic morphism is 0-acyclic exactly when its geometric fibres are nonempty and connected (SGA 4 XV 1.11, 1.16, 2.1 and 4.1).

What EtaleCohomologyFoundations must provide (gap:constructible-set-subsheaves): Prove that on a noetherian scheme every subsheaf of a constructible étale sheaf of sets is constructible (SGA 4 IX 2.9), and that a constructible étale sheaf of sets whose specialization maps are all bijective is locally constant (SGA 4 IX 2.11, as used in SGA1 XIII Corollary 1.16).

What EtaleCohomologyFoundations must provide (gap:constructible-set-continuity): For a quasi-compact quasi-separated scheme, prove that every étale sheaf of sets is a filtered colimit of constructible sheaves of sets and every ind-finite sheaf of groups a filtered colimit of constructible sheaves of groups with finite stalks (Stacks tag 03SA; SGA 4 IX 2.7.2), that constructible sheaves of sets are closed under finite limits and colimits and that constructibility is detected after pullback along a surjective morphism of quasi-compact quasi-separated schemes (Stacks tags 03RZ and 095Q), that every constructible sheaf of sets, and every constructible sheaf of groups with finite stalks, embeds in a finite product of direct images of finite constant sheaves along finite finitely presented morphisms (Stacks tag 09Z7; SGA 4 IX 2.14), that for a coherent morphism the direct image of sheaves of sets and the first direct image of sheaves of groups commute with filtered colimits (SGA 4 VII 3.3), and that constructible sheaves of sets on a cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps, with their morphisms, descend to a finite stage (Stacks tag 09YU).

### From TauCetiRoadmap.ComplexComparisonPartII

Section C-1.1 supplies `complexSchemeAnalytification` on all locally finite-type complex schemes, including infinite disjoint unions. Its complex-points, fibre-product, reduction, étale-local-isomorphism and smooth-chart comparisons, stated in §C-1.1 for `complexSchemeAnalytification`, supply the point topology, finite fibre products, nilpotent compatibility, étale local analytic isomorphisms and smooth local product charts. Those product charts give local sections through each chosen point of a smooth morphism and manifold charts when the scheme is smooth; surjectivity supplies a point above each base point. Sections C5.1 and C6.1 supply analytic sheaf/singular comparison with their local-contractibility hypotheses; §§C6.2–C6.3 supply finite-cover Riemann existence and finite-coefficient Artin comparison. On Spec ℂ the constant-coefficient degree-zero comparison is the identity. On Gₘ, the positive loop and ζₙ=exp(2πi/n) identify the coordinate’s Kummer class with 1; no inverse normalization is introduced here.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Section 5.5 supplies local-isomorphism-compatible resolution of arbitrary reduced finite-type schemes over a characteristic-zero field, preserving the entire regular locus, without a separatedness or quasi-projectivity hypothesis. Sections 5.1–5.2 supply principalization on smooth schemes for ideals nonzero at every generic point and embedded resolution for reduced closed subschemes of smooth ambient schemes; §§5.3–5.4 supply resolved-pair preservation and boundary cleanup with their stated hypotheses. Section 6.1 supplies projective closure of reduced quasi-projective schemes with a chosen immersion; §6.2 supplies projective strict-SNC compactification of smooth quasi-projective varieties. The deduction of strong desingularizability for the full finite-type range, as used in SGA1 XIII §§3–4, is a target of §3.8a, using general resolution and boundary refinements; it makes no projective compactification assertion for arbitrary finite-type schemes.

### From TauCetiRoadmap.CrystallineCohomology

Section CR.5:log-algebra.4, *The classical Abhyankar lemma*, supplies, for a regular local scheme X with residue characteristic p ≥ 0 and a strict normal-crossings divisor D = Σ div(f_i) cut out by part of a regular system of parameters, the regularity of the root covers X[T_i]/(T_i^(n_i) − f_i), the unique extension of a tamely ramified cover of X ∖ D across D after pullback to the root cover whose exponents n_i are the inertia orders, and, for strictly local X, the tame fundamental group ∏_(ℓ≠p) ℤ_ℓ(1)^r of X ∖ D. In characteristic zero every cover is tame and this group is ℤ̂(1)^r. §3.8a uses it at regular strict localizations; the relative form over an arbitrary base change, whose strict localizations need not be regular, is a step of §3.8a’s normal-crossings target.

### From TauCetiRoadmap.LocalPurity

Section 2.2 supplies full faithfulness of restriction of finite étale covers to an open subscheme whose complement has local rings of depth at least 2, and essential surjectivity across points where purity holds, on absolute locally noetherian schemes. The relative Abhyankar step of §3.8a needs the relative forms below, over bases that need not be regular or reduced; they are requested from this section, the owner of finite étale extension and purity.

What LocalPurity must provide (gap:relative-etale-depth): For a flat morphism f:X→S of locally noetherian schemes with geometrically reduced fibres and a closed subset Y⊂X whose fibre Y_s is nowhere dense in X_s for every s∈f(Y), prove that restriction of finite étale covers from X to X∖Y is fully faithful when either the closure of f(Y) is nowhere dense in S or every fibre X_s is geometrically unibranch at the points of Y_s (SGA 2 XIV Corollary 1.19, étale depth at least 2 along Y).

What LocalPurity must provide (gap:relative-homotopical-purity): For a regular morphism f:X→S of locally noetherian schemes and a closed subset Y⊂X such that every s∈f(Y) has codim(Y_s,X_s)≥2, or codim(Y_s,X_s)≥1 and étale depth of S at s at least 1, or homotopical depth of S at s at least 3, prove that restriction of finite étale covers from X to X∖Y is an equivalence of categories (SGA 2 XIV Corollary 1.20, homotopical depth at least 3 along Y).

### From TauCetiRoadmap.ProfiniteProPGroups

Layers 0, 3 and 4 supply finite-quotient presentations, pro-p groups and their topological group interface. Use the native compatible-family, finite-generation and abelian structure declarations named above. Transport of the finite-generation predicate to homotopy pro-groups is part of §6.5; no generic group structure theorem is reconstructed.

## How to read the build

Layer 0 fixes the raw homotopy model and its detection theorems; Layer 1 adds coverings, subgroup representability and classifying spaces. Layer 2 derives materialization, establishes profinite homotopy-limit comparison and computes the absolute and relative monodromy quotients. Layer 3 specializes these constructions to rigid étale types, cohomology, finite-cover base change and elementary fibrations. Layer 4 turns the relative theorem into arithmetic orbit and product statements. Layer 5 supplies the algebraic evaluation and diagonal Betti realization used in Layer 6, where completion, model comparison, finite-type materialization, specified gradings and coherent and strict automorphism naturality are constructed. Each Needs line separates statement prerequisites from the inputs used by the indicated proof route.

## Layer 0: Homotopy theory of pro-spaces

### 0.1 Homotopy pro-local systems

Specialize the supplied size-controlled Pro category to simplicial sets, with pointed objects represented by compatible actual vertices. A local system on X=(X_i) is a local system on one level, modulo pullback to a later level; its morphisms use the corresponding filtered colimit. The homotopy pro-local system Π_nX consists of the ordinary fundamental-groupoid homotopy local systems on the levels. For a pointed representative put π_n(X,x)=(π_n(X_i,x_i)); π_0 is pro-set-valued, π_1 pro-group-valued, and π_n is pro-abelian for n≥2. Connected means isomorphic to a levelwise connected diagram. This does not mean that its homotopy limit is path-connected. (I01, §§4–6, pp. 6–10; Corollary 7.5, pp. 12–13; I01 line 281 and I01 line 340).

One proof route is the following. Use the imported Pro carrier and finite-diagram reindexing; retain the universe of the indexing category. Pull local systems back along transition maps and pass to the filtered colimit category. Ordinary homotopy groups and their path transport come from AlgebraicTopology. Define the homotopy pro-local systems with their transition morphisms, and compare evaluation at a compatible vertex with the levelwise π_n system.

- Pointed maps induce pro-homomorphisms, preserving identity and composition.
- Pullback is compatible with reindexing and composition, up to the specified natural isomorphisms.
- For connected pointed X, evaluation of Π_nX at its point is π_n(X,x).
- For a constant pointed simplicial set, the pro-homotopy groups are the constant ordinary homotopy groups.

**Checks.**

- For the constant singular circle, π_1 is constant Z and every π_n for n≥2 is zero.
- The constant two-point set has π_0 with two elements; a single basepoint cannot detect deletion of the other component.
- On the constant circle, the integral sign local system has monodromy -1, unlike the constant integral system; both must occur in the local-system category.
- The tower whose levels are the nerves of the ordered set ℕ, each connected and contractible, with the shift n ↦ n+1 as transition maps, is connected but has no compatible vertex: a compatible family (n_i) would satisfy n_i = n_0 − i for every i, which fails for i > n_0. It admits no pointed representative and no π₁; a notion of pointedness taking a vertex at a single level would wrongly point it.

*Needs:* AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension, gap:pro-cofinal-invariance and gap:pro-level-representations); Mathlib `CategoryTheory.Ind` and `SSet`; AlgebraicTopology Stages 6 and 8 (direct local coefficients, ordinary homotopy groups and path transport).

### 0.2 Isaksen homotopy model structure

On Pro(SSet), take weak equivalences to be maps inducing an isomorphism of π_0 and of every homotopy pro-local system Π_nX→f*Π_nY, n≥1. Cofibrations are essentially levelwise monomorphisms, and fibrations have the right lifting property against trivial cofibrations. These classes form Isaksen’s simplicial model structure and induce its pointed model and homotopy categories. Every object is cofibrant. Its strict predecessor instead inverts essentially levelwise ordinary weak equivalences. Factorizations here are not asserted functorial. (I01, Definitions 6.1–6.3, Theorem 6.4, pp. 9–10; §§12–16, pp. 20–32; I01 line 412 and I01 line 423).

One proof route is the following. Use GeneralizedCohomology §G2.1’s Kan–Quillen model and Cartesian mapping objects, its properness contract, and BordismFormalGroups §F6.5’s fixed-base monoidal model axiom. For a cofibration i:A→B and a Kan fibration p:E→F, tensor–Hom adjunction identifies lifting a map j against Map(B,E)→Map(A,E)×_(Map(A,F))Map(B,F) with lifting i□j against p. If j is a horn inclusion, the supplied pushout product is trivial, giving a Kan fibration; if i or p is trivial, boundary inclusions j give trivial fibrancy. Retain the ordinary obstruction theory requested from AlgebraicTopology. Use cofinite reindexing and finite predecessor matching objects. The increasing connectivity bound gives Isaksen’s strong fibrations (Definition 6.5). Apply the two factorizations and lifting theorem, I01 Propositions 15.1, 15.2, 15.4; then the pushout-product argument of §16. Properness is isolated in the next target because its original proof needs the published correction.

- Weak equivalence is equivalent to the stated π_0 and Π_n conditions.
- Every pro-simplicial set, and every pointed one, is cofibrant.
- Identity induces the localization functor from strict homotopy to Isaksen homotopy.
- For fibrant Y, Hom in the homotopy category is strict maps X→Y modulo simplicial homotopy.

**Checks.**

- On constant pointed connected Kan complexes, weak equivalence is the ordinary π_n equivalence in every degree.
- For K=∏ₙ≥₁K(Z,n), the map cK→(P_m K)_m is an Isaksen equivalence but not a strict equivalence: every finite truncation misses nonzero higher homotopy groups. This avoids relying on a finiteness claim about a particular sphere.
- The map from the singular S² to a point is not an Isaksen equivalence even though it preserves π_0 and π_1.
- For i:∂Δ[1]→Δ[1] and p:BC₂→*, the mapping-space map (BC₂)^Δ[1]→BC₂×BC₂ is a Kan fibration whose fiber over the base vertices is the two-element loop space C₂, so it is not trivial. Replacing i by an endpoint inclusion gives evaluation (BC₂)^Δ[1]→BC₂ with contractible fiber. The horn lifts in the first case and boundary lifts in the second are adjoint to the supplied pushout-product lifts.

*Needs:* §0.1; Mathlib `HomotopicalAlgebra.ModelCategory`; GeneralizedCohomology §G2.1 (gap:kan-quillen-properness); BordismFormalGroups §F6.5 (Cartesian Kan–Quillen monoidal model axiom); AlgebraicTopology Stage 8 (gap:simplicial-postnikov and gap:simplicial-moore-postnikov); AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing and gap:pro-level-representations).

### 0.3 Properness and strong fibrations

Isaksen’s model structure is left and right proper. A strong fibration is a fibration, and arbitrary fibrations are retracts of suitable strong-fibration presentations. Consequently pullback along a fibration preserves weak equivalences, also for maps over a fixed pro-space. (I01, Definition 6.5, p. 10; Proposition 17.1, pp. 32–33; SS, Appendix A opening and Lemma A.5, pp. 853–855; IStr, proof of Theorem 4.15 and Remark 4.16, pp. 11–12; IStr line 507).

One proof route is the following. Left properness follows from cofibrancy of every object. For right properness, reduce a fibration to a retract of a strong fibration and use the levelwise connectivity criterion. Use the level-presentation repair of IStr, proof of Theorem 4.15 and Remark 4.16, pp. 11–12 (IStr line 507): insert an intervening pro-isomorphism before applying levelwise right properness; a simultaneous favorable level presentation is not assumed. Apply the right-proper pullback square; do not substitute the strict model’s weak equivalences.

*Needs:* §0.2; GeneralizedCohomology §G2.1 (gap:kan-quillen-properness).

### 0.4 Connected pointed homotopy detection

For connected pointed pro-spaces, a pointed map is an Isaksen weak equivalence exactly when it induces an isomorphism of pro-groups π_n for every n≥1. A pointed morphism whose underlying morphism is an isomorphism in the unpointed homotopy category is an isomorphism in the pointed homotopy category. (I01, Corollary 7.5, pp. 12–13; pointed model-category consequence; I01 line 578).

One proof route is the following. Represent the map after cofinite reindexing; use path transport on connected levels to recover all stalks of Π_n from the selected one. Apply the weak-equivalence criterion, and use the forgetful pointed model functor reflecting weak equivalences for the isomorphism assertion.

*Needs:* §0.2.

### 0.5 Local-coefficient detection

A map f:X→Y of pro-spaces is an Isaksen weak equivalence if and only if π_0(f) is a pro-set isomorphism, Π_1X→f*Π_1Y is an isomorphism of pro-local systems, and H^m(Y,L)→H^m(X,f*L) is an isomorphism for every m≥0 and every abelian local system L on Y. Here cohomology for a system represented on Y_i is the filtered colimit over later levels of ordinary cohomology with pulled-back coefficients; finite constant coefficients alone do not state this criterion. (I01, §18, Proposition 18.4, pp. 34–36; I01 line 1658).

One proof route is the following. A weak equivalence admits a level presentation with connectivity increasing arbitrarily far, so ordinary local-coefficient comparison gives every fixed cohomological degree in the filtered colimit. Conversely replace by a cofibration and test maps into strongly fibrant objects. A finite Moore–Postnikov lifting tower has obstruction classes in local cohomology; kill each using the assumed isomorphisms. Pass to the inverse limit of the matching fibrations and use the model’s fibrant retract theorem. The ordinary local-coefficient Whitehead and Moore–Postnikov inputs are explicitly specified in the AlgebraicTopology contract, not asserted by its existing Kan predicate.

*Needs:* §§0.1–0.2; AlgebraicTopology Stages 6 and 8 (direct L-valued cochains, gap:local-coefficient-representability, gap:simplicial-local-whitehead and gap:simplicial-moore-postnikov).

### Examples

The constant singular circle has π₁=cℤ and πₙ=0 for n≥2. The two-point discrete space has two components, so deletion of its second point is not a weak equivalence. The integral sign system on the circle has monodromy −1 and cohomology H⁰=0, H¹=ℤ/2; the constant system has H⁰=ℤ, H¹=ℤ.

### Dependencies

AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension, gap:pro-cofinal-invariance, gap:pro-cofinite-reindexing and gap:pro-level-representations); Mathlib `CategoryTheory.Ind`, `SSet` and `HomotopicalAlgebra.ModelCategory`; AlgebraicTopology Stages 6 and 8 (direct local coefficients, homotopy groups, gap:local-coefficient-representability, gap:simplicial-postnikov, gap:simplicial-local-whitehead and gap:simplicial-moore-postnikov); GeneralizedCohomology §G2.1 (gap:kan-quillen-properness); BordismFormalGroups §F6.5 (Cartesian Kan–Quillen monoidal model axiom). The item-level Needs lines give the direct inputs.

## Layer 1: Coverings and classifying pro-spaces

### 1.1 Coverings of pro-spaces

A simplicial covering p:E→X has the unique lifting property for every vertex inclusion Δ[0]→Δ[n], including every choice of vertex. A pro-covering is a pro-morphism isomorphic to a levelwise simplicial covering; connected Galois coverings have a levelwise presentation with E_i/Aut_Xi(E_i)≅X_i. Universal pointed coverings are formed from the levelwise universal simplicial coverings. The deck group is a pro-group, not an unqualified single discrete group. (SS, Appendix A.1, Definition A.1 and preceding paragraphs, p. 853; SS line 1457).

One proof route is the following. Import ordinary simplicial covering theory, compared by realization with the supplied topological universal-cover API; this extension is specified in the AlgebraicTopology contract. Use the supplied reindexing to make a finite covering diagram levelwise. Define the pro-cover property invariantly under pro-isomorphism. Apply the ordinary pointed universal-cover functor levelwise and retain its transition maps and deck actions.

- Pullback of a pro-covering is a pro-covering; finite degree is preserved under base change.
- On connected pointed levels the universal covering kills π_1 and preserves π_n for n≥2.
- The deck pro-group of the pointed universal covering is π_1(X,x).
- For a constant simplicial covering its realization agrees with the ordinary covering-space interface.

**Checks.**

- The identity covering has one point over each vertex and trivial deck group. A quotient with an extra sheet would give fiber cardinality at least two.
- The connected degree-two cover of the singular circle corresponds to 2Z⊂Z and has deck group Z/2.
- The Kan fibration Sing(S¹)→* is not a covering: the fiber contains nonconstant singular simplices, violating uniqueness over a vertex.

*Needs:* §0.1; AlgebraicTopology Stage 8 (gap:simplicial-covering-classification); Completed/UniversalCovers Stages 2–4; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34.

### 1.2 Covering associated to a sub-pro-group

For connected pointed X and a monomorphism U↪π_1(X,x) of pro-groups, construct h:X_U→X in the connected pointed homotopy category. For every connected pointed W, composition with h bijects Hom(W,X_U) with the pointed homotopy classes f:W→X for which π_1(f) factors through U. This universal property specifies X_U over X up to unique isomorphism there. No finite-index hypothesis is imposed on U. (SS, Proposition A.2, p. 854; SS line 1475).

One proof route is the following. Represent the subgroup monomorphism levelwise after reindexing, using images if necessary; build the ordinary subgroup covers at each level. Use ordinary lifting uniqueness to define their transition maps, and cofinite reindexing to compare choices. Apply the levelwise lifting criterion and pass to homotopy classes into a fibrant target; the resulting representability gives the independence statement.

- A pointed homotopy class lifts exactly when its pro-π_1 factors through U.
- An inclusion U↪V over π_1 gives X_U→X_V over X, compatible with composition.
- The full subgroup gives the identity cover.
- The trivial sub-pro-group gives the universal pointed cover.

**Checks.**

- For constant Sing(S¹) and U=2Z the representing cover is the ordinary degree-two cover.
- For U=π_1(X), h is an isomorphism over X. Replacing it by the universal cover of the circle would give π₁=0 instead of ℤ.
- For U=0⊂Z the cover of Sing(S¹) is universal and has infinite fiber; restricting the construction to finite covers would fail this test.

*Needs:* §1.1; §0.2; AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing, gap:pro-level-representations and gap:pro-monomorphism-presentations).

### 1.3 Coverings under homotopy equivalence

Pullback along an Isaksen weak equivalence between connected pro-spaces induces an equivalence on their categories of connected coverings. (SS, Lemma A.3, p. 854; SS line 1484).

One proof route is the following. Transport sub-pro-groups along the pro-π_1 isomorphism and use the covering universal property to get the category equivalence.

*Needs:* §1.2; §0.3.

### 1.4 Coverings are pro-fibrations

Every pro-covering is a fibration in Isaksen’s model structure. (SS, Lemma A.4, p. 854; SS line 1493).

One proof route is the following. For fibrancy use a cofinite level presentation; the relative matching maps are coverings, hence co-1-fibrations. Apply the strong-fibration criterion, and pass to isomorphic presentations.

*Needs:* §§1.1 and 0.2; AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing and gap:pro-level-representations).

### 1.5 Base change of homotopy isomorphisms

For maps f:X→W and g:Y→W and an isomorphism γ:X≅Y in Ho(Pro(SSet)) with gγ=f, every pro-covering W′→W admits an isomorphism γ′:X×_W W′≅Y×_W W′ in the homotopy category, compatible with γ and the maps to W′. Choices can be made compatibly with morphisms of the covering. If W′/W is connected Galois, the induced cohomology isomorphisms with any constant abelian group A are equivariant for its deck pro-group action. Existence, rather than uniqueness of γ′, is asserted. (SS, Proposition A.6, pp. 855–856; SS line 1512).

One proof route is the following. Replace W by a fibrant object and transport the connected covering category along the equivalence; handle components separately. Represent γ and the structural homotopy by actual maps into fibrant replacements. Lift that homotopy along the covering to make the maps compatible. Right properness identifies the strict pullbacks with the required derived pullbacks. Deck transformations commute with these lifted maps, giving equivariance after cohomology.

*Needs:* §1.3; §0.3; AlgebraicTopology Stage 6 (direct local coefficients); §1.4.

### 1.6 Classifying pro-space and fibrant replacement

For a pro-group G=(G_i) use the supplied discrete nerves BG_i and EG_i levelwise. On a cofinite directed presentation define G_i* = ∏ⱼ≤ᵢG_j, embed G_i by all transition maps (including the identity factor), and set B*G_i=E(G_i*)/G_i for the resulting right action. Then BG→B*G is a levelwise ordinary weak equivalence and B*G is fibrant in the Isaksen pointed model. BG is not declared fibrant merely because each level is Kan. (SS, Lemma A.14, pp. 862–864; SS line 1833).

One proof route is the following. Import the discrete free, contractible EG and its quotient; build G* from finite predecessor products. The diagonal inclusion of G_i into G_i* is injective, and the product projection to predecessor factors is surjective. The associated nerve map is a Kan fibration; this discrete lemma is the StableHomotopyKTheory nerve contract. Check the relative matching maps for B*G are co-1-fibrations. Both quotient models have π_1=G_i and no higher groups, so the comparison is a level weak equivalence.

- π_1(BG)=G and π_n(BG)=0 for n≥2, using the supplied discrete computations.
- Homomorphisms of pro-groups induce pointed maps, compatible with composition.
- BG→B*G is a weak equivalence with fibrant codomain; reindexing choices give the same derived object.
- Each pro-level EG→BG has its given deck action and quotient isomorphism.

**Checks.**

- B1 is contractible and its π_1 is trivial. An empty nerve would instead have no component.
- For constant C_p, BC_p has π_1=C_p and all π_n for n≥2 zero; it need not have finitely many nondegenerate simplices.
- For G=(Z/p^r), π_1(BG) is this inverse system; it is not the constant discrete additive group Z_p.

*Needs:* §0.2; AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing and gap:pro-cofinal-invariance); StableHomotopyKTheory §§1.19–1.23, 1.28–1.34 (gap:surjective-nerve-fibration).

### 1.7 Full faithfulness of pro-classifying spaces

For pro-groups G,H the nerve map identifies Hom_Pro(Grp)(G,H) with strict pointed pro-simplicial maps BG→BH and with pointed Isaksen homotopy classes BG→BH. (SS, Lemma A.15, pp. 863–864; SS line 1866).

One proof route is the following. Strict nerve maps are determined by their one-simplex map, and the two-simplex identities impose the homomorphism law. Replace BH with B*H; the auxiliary map to BH* is injective on strict pointed maps because the intervening map is a pointed covering. The same π_1 computation proves injectivity after localization.

*Needs:* §1.6.

### 1.8 Maps into classifying pro-spaces

For connected pointed X and any pro-group G, π_1 induces a natural bijection Hom_Ho(Pro(SSet)_*)(X,BG)≅Hom_Pro(Grp)(π_1(X),G). (SS, Proposition A.16 and proof, pp. 864–866; SS line 1912).

One proof route is the following. Use the ordinary first Postnikov truncation X_i→BΠ_1X_i. Inclusion of the chosen object gives BG_i→BΠ_1X_i and is a level weak equivalence when the levels are connected. Represent maps into fibrant B*G. Ordinary maps from a groupoid nerve to a group nerve and pointed homotopies correspond to homomorphisms; pointing removes conjugation. Use the lim-colim Hom formula and reindexing for the pro statement. The first Postnikov construction is part of the ordinary topology supplier contract.

*Needs:* §§1.6–1.7 and 0.4; AlgebraicTopology Stage 8 (gap:simplicial-postnikov).

### 1.9 The first classifying morphism

For connected pointed X define c_X:X→Bπ_1(X) in the pointed homotopy category as the unique class corresponding to id under pro-BG representability. Call X a raw K(π,1) when π_n(X)=0 for all n≥2. Then c_X is an isomorphism if and only if X is a raw K(π,1). This is a property of the full pro-homotopy type, distinct from a finite- or p-coefficient convention on schemes. (SS, Definition A.17 and Corollary A.18, p. 866; SS line 1953).

One proof route is the following. Use representability with G=π_1(X) to obtain the actual morphism class. Naturality follows from the uniqueness part of the bijection. Its π_1 map is the identity; the target’s higher groups vanish. Apply connected detection. The comparison with a finite-coefficient scheme predicate uses the geometric hypotheses and effacement criterion of §3.9b.

- π_1(c_X)=id under the canonical BG identification.
- For pointed f:X→Y, c_Y∘f=Bπ_1(f)∘c_X.
- c_X is invertible exactly when every π_n(X), n≥2, vanishes.
- For BG the classifying map is the identity under π_1(BG)=G.

**Checks.**

- The one-point pro-space is a raw K(π,1). All positive homotopy groups vanish; a nonemptiness-free test that accepts the empty space would not define the connected pointed object.
- The constant singular circle is raw K(Z,1) and its c_X is an isomorphism.
- The constant singular S² is not raw K(π,1), since π_2=Z, despite π_1=0.

*Needs:* §1.8; §0.4.

### Examples

For c Sing(S¹), the subgroup 2ℤ produces the degree-two cover with deck group C₂; the zero subgroup produces the infinite universal cover. The pointed maps BC₂ → BS₃ correspond to the four homomorphisms C₂ → S₃, while forgetting points gives two conjugacy classes.

### Dependencies

Layer 0; AdicSpacesPartII §R0.19.9 (gap:pro-cofinal-invariance, gap:pro-cofinite-reindexing, gap:pro-level-representations and gap:pro-monomorphism-presentations); AlgebraicTopology Stages 6 and 8 (direct local coefficients, gap:simplicial-postnikov and gap:simplicial-covering-classification); Completed/UniversalCovers Stages 2–4; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34 (gap:surjective-nerve-fibration). The item-level Needs lines give the direct inputs.

## Layer 2: Materialization and relative monodromy

### 2.1 Homotopy limit and topological homotopy groups

Let Mat(X) denote the right-derived limit of a small pro-simplicial set, represented by the ordinary homotopy limit of a levelwise Kan diagram. For a pointed X define π_n^top(X,x)=π_n(Mat(X),x), with pointed sets in degree zero. For n≥0, the derived constant/limit adjunction identifies πₙᵗᵒᵖ(X,x) with Hom_Ho(Pro(SSet)_*)(cS^n,X). Call X path-connected when Mat(X) is path-connected. Its comparison to lim_i π_n(X_i,x_i) is canonical; invertibility requires the separate profiniteness theorem. (I01, Proposition 8.2, Corollary 8.3 and Proposition 8.4, pp. 14–15; I01 line 637; SS, Appendix A.2.2, p. 857).

One proof route is the following. Constant objects preserve cofibrations and trivial cofibrations, so constant and limit form a Quillen adjunction. Use I01 Proposition 8.4’s levelwise Kan and Postnikov-tower argument to identify the derived limit with the ordinary homotopy limit. The unstable homotopy-limit supplier contract uses a Reedy fibrant cosimplicial replacement C, with C^q the product of X_i0 over chains i_q→…→i_0, and actual Tot_m=Map(sk_m Δ^•,C^•), including all compatibility equations. A single C^m is not Tot_m.

- Derived maps cK→X are naturally maps K→Mat(X).
- Cofinal reindexing and Isaksen weak equivalence preserve Mat up to ordinary weak equivalence.
- Projections induce natural π_n^top(X)→lim π_n(X_i), with the prescribed low-degree algebra.
- Path-connectedness means π_0(Mat(X)) is a singleton, rather than only π_0(X)=*.

**Checks.**

- Mat(cK)≃K for a Kan complex K. In particular π₀ is unchanged; a constant-point materialization fails for a two-point K.
- For a system of finite sets considered as discrete spaces, Mat is the discrete set of compatible tuples and has no positive homotopy groups.
- For the discrete diagram *→{0,1} sending * to 0, a degree-zero choice (*,1) in the cosimplicial replacement has no extension to Tot_1. The compatibility equations exclude it; retaining only independent product coordinates would admit it.

*Needs:* §0.2; AlgebraicTopology Stage 8 (gap:reedy-homotopy-limits and gap:simplicial-postnikov); AdicSpacesPartII §R0.19.9 (gap:pro-cofinal-invariance).

### 2.2 Vanishing of profinite derived limits

For an inverse system G of finite groups over a small cofiltered category, the nonabelian derived-limit pointed set lim¹G is trivial. For a system A of finite abelian groups, lim^s A=0 for every s≥1. For the abelian statement use a native functor A : I ⥤ AddCommGrpCat, assume injective resolutions exist in that functor category, require every A_i finite and s>0, and conclude that the s-th native right-derived limit is zero. The assertion is invariant under pro-isomorphism, so it applies to profinite pro-groups represented by finite groups, without assuming countable indexing. (SS, Lemma A.7, pp. 856–857; SS line 1573).

One proof route is the following. Pass to a cofinite directed presentation. Embed G_i in G_i*=∏ⱼ≤ᵢG_j through all transition maps. Its matching projections are surjective and the product system is derived-limit acyclic. The finite quotients G_i*/G_i are sets with transitive G_i* action; compactness supplies compatible lifts, giving the nonabelian lim¹ assertion. In the abelian case use 0→A→A*→A*/A→0, acyclicity of A*, and dimension shifting. Use Mathlib’s abelian right-derived functor formalism, assuming injective resolutions exist. Apply `nonempty_sections_of_finite_cofiltered_system` directly to the nonempty finite fibers; compact Hausdorff fibers use `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`. Cofinite reindexing here serves the finite predecessor products, not the existence of compatible families.

*Needs:* AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing and gap:pro-cofinal-invariance); Mathlib `CategoryTheory.Functor.rightDerived`, `CategoryTheory.HasInjectiveResolutions`, `CategoryTheory.Limits.lim`, `CategoryTheory.Functor.additive_of_preserves_binary_products` and `nonempty_sections_of_finite_cofiltered_system`; AlgebraicTopology Stage 8 (gap:nonabelian-lim1); ProfiniteProPGroups Layer 0.

### 2.3 Homotopy groups of profinite pro-spaces

If pointed X has π_0(X)=* and every π_n(X), n≥1, is a profinite pro-group, then Mat(X) is path-connected and π_n^top(X)→lim π_n(X) is an isomorphism for all n≥1; the degree-zero comparison is a bijection of singleton pointed sets. No finiteness of the whole simplicial sets or uniform Postnikov bound is assumed. (SS, Theorem A.8 and proof, pp. 857–858; SS line 1611; BK XI 5.2, XI 7.1, IX 5.1, IX 5.4, cited by locator without text).

One proof route is the following. Replace the levelwise Kan diagram by a Reedy fibrant cosimplicial replacement and use the actual compatible partial totalizations. Its fringe spectral sequence has E₂ˢ,ᵗ = limˢ πₜ(X), abelian for t≥2 and with the nonabelian group and pointed-set fringe retained. Apply §2.2, then the supplied BK IX 5.1 connectivity and IX 5.4 complete-convergence statements, with XI 5.2 and XI 7.1 identifying the tower and its E₂ page. The comparison is the projection-induced edge map. The BK inputs are cited by locator without text; a collapsed E₂ page is not itself convergence.

*Needs:* §§2.1–2.2; AlgebraicTopology Stage 8 (gap:bk-homotopy-limit-spectral-sequence, gap:bk-tower-convergence and gap:reedy-homotopy-limits).

### 2.4 Endpoint-preserving pro-cylinders

For a pro-simplicial set X with two distinct specified vertices x_0,x_1, form Cyl₂(X) from X×Δ[1] by collapsing each {x_i}×Δ[1] to its own vertex. The endpoint map from the pushout of two copies of X along {x_0,x_1} to Cyl₂(X) is a cofibration and the projection to X is an Isaksen weak equivalence. These maps form a cylinder in the undercategory of the two-point set. The projection need not be a fibration. (SS, Appendix A.2.3, p. 858, corrected cylinder assertion; SS line 1648).

One proof route is the following. Construct the quotient levelwise and use ordinary relative simplicial cylinder theory, preserving its two endpoint inclusions. Each quotient projection contracts the interval relative to the two selected vertices in the ordinary homotopy sense, so the pro-projection is a weak equivalence. Use this cylinder only for cofibrant domains in the undercategory; the interval with its two distinct endpoints supplies the domain for paths.

- The combined endpoint inclusion is a cofibration in the two-point undercategory.
- The projection is a weak equivalence and composes with either endpoint to the identity.
- Maps from Δ[1] into a fibrant target modulo this cylinder give endpoint-preserving path classes.

**Checks.**

- For X={x_0,x_1}, Cyl₂(X) is X and the projection is the identity. Identifying the two marked points would give one vertex, violating the relative construction.
- For X={x_0,x_1,a}, Cyl₂(X) is two isolated vertices together with Δ[1] over a. This projection is not a Kan fibration: a Kan horn witnessing an inverse to the directed edge has no filler.
- For X=Δ[1] marked at its two endpoints and Y=BC₂ with both marked points at its unique vertex, maps X→Y modulo Cyl₂(X) are the endpoint-preserving path classes, π₁(BC₂)=C₂: the edges labelled 1 and g give two distinct classes. Free homotopy classes of maps Δ[1]→BC₂ form π₀(BC₂), a single class, Δ[1] being contractible. A cylinder that let an endpoint move would merge the two classes into one.

*Needs:* §0.2; GeneralizedCohomology §G2.1 (simplicial tensors and pointed model).

### 2.5 Monodromy on pointed mapping classes

For pointed pro-spaces X and two points y_0,y_1 of Y, a path class u:y_0→y_1 in Mat(Y) induces a bijection u_*:Hom_Ho(Pro(SSet)_*)(X,(Y,y_0))→Hom(X,(Y,y_1)). Identity paths act identically and composition of paths composes these bijections. At y_0=y_1 this is the π_1^top(Y,y_0) action. Use the convention for which the induced action on fundamental-group homomorphisms is φ↦αφα⁻¹. (SS, Lemma A.9 and Lemma A.12, pp. 858–860; SS line 1675).

One proof route is the following. Replace Y by a fibrant target. Extend the pair consisting of f:X→Y and the path u along X∨Δ[1]→X×Δ[1], a trivial cofibration. The terminal restriction gives a pointed map to (Y,y_1). Use relative homotopies to prove independence of extension, representative path and fibrant replacement. Concatenation and inversion prove the action laws. Compare the induced map of loops with conjugation using the same path-order convention.

- Transport along the constant path fixes every pointed class.
- Transport along a composite equals successive transport.
- For a loop α, the induced π_1 homomorphism is αφα⁻¹.
- Transport is natural under pointed source maps and target maps carrying the chosen path.

**Checks.**

- For X=BC₂,Y=BS₃, a transposition homomorphism is transported to each of its conjugates in S₃.
- For X=S¹,Y=BC₃, loop transport fixes each homomorphism Z→C₃.
- For a constant two-point target, distinct points have no connecting path; no transport bijection between those basepoints is postulated.

*Needs:* §2.1; §2.4; §0.2.

### 2.6 Pointed maps modulo monodromy

If Y is path-connected, forgetting points induces a bijection Hom_Ho(Pro(SSet)_*)(X,Y)/π_1^top(Y)≅Hom_Ho(Pro(SSet))(X,Y), for any pointed X. (SS, Theorem A.10, p. 859; SS line 1683).

One proof route is the following. Represent an unpointed map into a fibrant target; connect its image of the source point to the target point and transport. An unpointed homotopy has a basepoint track; its loop is precisely the orbit ambiguity, proving injectivity of the orbit map.

*Needs:* §2.5.

### 2.7 Pointed lifts of unpointed isomorphisms

If pointed X is unpointedly isomorphic to connected pointed Y and every π_n(Y), n≥1, is a profinite pro-group, every such unpointed isomorphism admits a pointed isomorphism lift. (SS, Corollary A.11, p. 859; SS line 1693).

One proof route is the following. Layer 2’s profinite homotopy-limit theorem gives paths between the necessary points. The absolute orbit theorem supplies a pointed lift, whose underlying unpointed isomorphism makes it a pointed isomorphism.

*Needs:* §2.6; §2.3; §0.4.

### 2.8 Pointed lifting over a base

Let pointed X,Y map to pointed B. If Y and B are path-connected and π_1^top(Y)→π_1^top(B) is surjective, forgetting points gives a surjection from Hom in Ho(Pro(SSet)_*)↓(B,b) to Hom in Ho(Pro(SSet))↓B. These are slices of homotopy categories: their structural triangles commute as morphism classes; no chosen null-homotopy is part of a morphism. (SS, Theorem A.13(a), pp. 860–861; SS line 1736).

One proof route is the following. Lift the underlying unpointed map to a pointed one using target path-connectedness. The two composites to B differ by a loop at b. Surjectivity on topological π_1 lifts that loop to Y. Transport by its inverse to obtain a pointed map in the relative Hom set.

*Needs:* §2.6; §2.5.

### 2.9 Relative isomorphisms lift

Under the hypotheses of §2.8, any isomorphism in Ho(Pro(SSet))↓B has a preimage that is an isomorphism in Ho(Pro(SSet)_*)↓(B,b). (SS, Theorem A.13(a), last assertion, pp. 860–861; SS line 1783).

One proof route is the following. Use §2.8 to lift the given map. Its underlying unpointed map is an isomorphism, so it is an isomorphism in the pointed homotopy category. The inverse also commutes with the structure map because the original triangle does.

*Needs:* §2.8; §0.4.

### 2.10 Stabilizer quotient for relative maps

With the same hypotheses, let S_X⊂π_1^top(B,b) be the stabilizer of the pointed structure class p_X under monodromy, and Δ_XY its preimage under π_1^top(Y,y)→π_1^top(B,b). Monodromy restricts to the pointed relative Hom set, and its Δ_XY-orbits biject with Hom_Ho(Pro(SSet))↓B(X,Y). The whole π_1(Y) need not preserve the relative subset. (SS, Theorem A.13(b), pp. 860–861; SS line 1743).

One proof route is the following. Naturality of path transport identifies the loops preserving the structural triangle with Δ_XY. Use the absolute orbit theorem to characterize pairs with the same unpointed class; the relative constraint forces the loop into Δ_XY. Use the relative surjection for existence, giving the claimed bijection.

*Needs:* §2.8; §2.5.

### Examples

For the finite cyclic system C_(pʳ), materialization of its classifying pro-space is path-connected with π₁=ℤₚ and πₙ=0 for n≥2, for p=2 as well as p=3. In contrast the tower ℤ with transition multiplication by 2 has lim=0 and lim¹=ℤ₂/ℤ; its classifying homotopy limit is disconnected, showing why profiniteness matters. For the identity map the comparison on each group is the identity.

### Dependencies

Layers 0–1; AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing and gap:pro-cofinal-invariance); AlgebraicTopology Stage 8 (gap:reedy-homotopy-limits, gap:nonabelian-lim1, gap:bk-homotopy-limit-spectral-sequence, gap:bk-tower-convergence and gap:simplicial-postnikov); GeneralizedCohomology §G2.1; Mathlib abelian derived limits and cofiltered compatible-family theorems; ProfiniteProPGroups Layer 0. The item-level Needs lines give the direct inputs.

## Layer 3: Rigid étale types and finite-cover comparison

### 3.0a Profinite completion of a pro-group

For a small cofiltered group diagram G:I→Grp, define its profinite completion Ĝ as lim_i (`ProfiniteGrp.profiniteCompletion`(G_i)) in `ProfiniteGrp`. Regard this profinite group as a pro-group through `ProfiniteGrp.toFiniteQuotientFunctor`; the native levelwise completion units and the finite-target limit comparison below define the unit from G to this finite-quotient pro-group. Its unit G → Ĝ induces, for every profinite group H, a natural bijection Hom_cont(Ĝ,H) ≃ Hom_Pro(Grp)(G,H), where H on the right is represented by its finite quotients. All transition and comparison maps retain their topology and source and target. This construction does not replace G by the constant discrete group of its inverse limit (SS, discussion before Corollary 2.5, p. 826; SS line 369).

One proof route is the following. For any small cofiltered diagram P in ProfiniteGrp and finite discrete group F, prove Hom_cont(lim_i P_i,F)≃colim_i Hom_cont(P_i,F). A continuous homomorphism on the limit factors through its image in a finite quotient of a stage; compactness puts the images of sufficiently late stages inside that finite subgroup, giving a stage homomorphism. Equality of stage maps is likewise detected eventually. Apply this with P_i=Ĝ_i. This argument needs neither surjective transitions nor countable indices. Apply the native levelwise completion adjunction and then the target H’s finite-quotient presentation; the resulting limit-colimit expression is precisely the supplied pro-Hom formula. This also proves invariance under cofinal refinement and gives the pro-unit, rather than a unit into the constant abstract limit.

- The unit induces the same finite quotients and is functorial under pro-group homomorphisms.
- Precomposition by the unit is the stated bijection for every profinite target, with its continuous maps.
- For a finite-group system the unit is an isomorphism of pro-groups, and its inverse-limit topology is the supplied profinite topology.

**Checks.**

- For the trivial pro-group, the completion has one element and exactly one map to every group; an empty limit would be wrong.
- For constant ℤ, completion is ℤ̂, and maps to C₂ are exactly the two choices for the image of 1; the discrete constant ℤ̂ is not the resulting pro-object.
- For the system C_(pʳ), the finite quotients remain C_(pʳ), including p=2 and p=3; its completion is the same pro-system, rather than a constant group.
- For constant S₃, completion is S₃ and its three order-two subgroups remain distinct; abelianization C₂ is not a completion.
- For ℤ ←×2 ℤ ←×2 ⋯, the abstract limit is 0, but the completed limit is ∏_(ℓ≠2) ℤ_ℓ: its 2-adic coordinate is infinitely 2-divisible and therefore zero, and multiplication by 2 is invertible on every odd-adic coordinate. Both its continuous maps to C₃ and the pro-maps from the tower to C₃ number 3. Completing the abstract limit would give only one map.

*Needs:* AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension and gap:pro-cofinal-invariance); Mathlib `ProfiniteGrp.profiniteCompletion`, `ProfiniteGrp.ProfiniteCompletion.homEquiv`, `ProfiniteGrp.ProfiniteCompletion.adjunction`, `ProfiniteGrp.toFiniteQuotientFunctor` and `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor`; ProfiniteProPGroups Layer 0; Mathlib `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit`.

### 3.1 Rigid étale covers

For a locally noetherian scheme X in a fixed universe, a rigid cover is a disjoint union U=∐_x U_x indexed by its geometric points in the chosen small presentation, each U_x connected, étale and separated over X, with a specified lift u_x of x. Morphisms preserve these lifts. The geometric-point presentation and its universe enlargement comparisons are retained. A rigid pullback along f:X→Y uses the component of X×_Y U_f(x) containing the specified lifted point, separately for every x; this may repeat a component of the ordinary pullback. (IEt, Definitions 5.1, 5.3 and Proposition 5.5, pp. 13–14; IEt line 599, IEt line 624 and IEt line 634).

One proof route is the following. Use the small étale site and a size-controlled geometric-point indexing family; existence of connected components as open subschemes follows from local noetherianity. Take connected pointed components of the ordinary fiber products. A point-preserving map between connected étale separated neighborhoods is unique. Prove the rigid pullback universal property. Choose a separable closure of each residue field and a bounded small collection of its embeddings in separably closed extensions. Prove that replacing these choices or enlarging the bound gives common cofinal rigid-cover refinements, natural under scheme maps; §3.2 extends them to hypercovers. For a cofiltered system of finite étale neighborhoods with nonempty lift fibers, those fibers are finite and `nonempty_sections_of_finite_cofiltered_system` supplies compatible choices directly. General rigid neighborhoods use the common pointed refinements, without any finite-fiber assumption. These are scheme-specific comparison targets here; no class of all geometric points is asserted small (IEt, §5 and Proposition 5.5, pp. 13–14; IEt line 594 and IEt line 634).

- There is at most one rigid cover map over a fixed base map.
- Rigid maps V→f*U over Z→X correspond to rigid maps V→U over Z→Y.
- Iterated rigid pullback agrees, by its canonical isomorphism, with pullback along the composite.
- Each chosen connected piece is separated étale; the disjoint union is a covering family, with no finite-component requirement.
- Replacement of the bounded geometric-point choices induces common cofinal rigid-cover refinements; the comparisons respect identity, composition and further enlargement.

**Checks.**

- Over an algebraically closed field, a connected étale neighborhood of the canonical point is Spec of that field and its chosen lift is unique.
- For A¹_C→Spec C and the canonical point cover of Spec C, ordinary pullback has one connected component A¹_C. Rigid pullback has a separate copy for each geometric point of A¹_C, including distinct copies chosen at 0 and 1. Replacing it by the ordinary pullback loses the rigid data.
- On A¹_C the indexing includes its infinitely many complex closed points; a definition demanding a finite index family would reject the required rigid covers.
- For Spec F_q, two separable closures give equivalent finite-Galois neighborhood systems; the induced π₁ identifications differ by inner conjugation, which is trivial on G_Fq=ℤ̂. Duplicating representatives changes no pro-type. Omitting all representatives over a nonempty component would instead produce an empty component diagram.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology` and `nonempty_sections_of_finite_cofiltered_system`; AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension and gap:pro-cofinal-invariance); EtaleCohomologyFoundations §F.0.2; SchemeAndStackFoundations §§0.9–0.12 (gap:connected-etale-components).

### 3.2 Rigid hypercovers of simplicial schemes

A rigid hypercover U_•→X of a scheme is an augmented simplicial scheme whose map from U_n to degree n of the relative (n−1)-coskeleton of U over X is a rigid cover for every n≥0, with U_0→X in degree zero. For simplicial X_• use an augmented bisimplicial U_(a,b), with U_(a,−1)=X_a, whose rows are rigid hypercovers and whose maps in a preserve the rigid lifts. HRR(X_•) has at most one map between any two objects, is nonempty and cofiltered, and admits rigid pullbacks along simplicial scheme maps. Generic hypercovers and descent remain EnhancedDerivedSheaves’ construction. (IEt, Definitions 6.2–6.4, pp. 16–17; Proposition 6.10, pp. 17–18; Proposition 6.14 and 6.17, pp. 19–20; IEt line 747).

One proof route is the following. Use EnhancedDerivedSheaves’ augmented matching-object convention. Recursively choose rigid covers; the split degeneracies are constructed through latching components with their specified points. For finite diagrams form rigid limits by taking the connected pointed components of the ordinary matching fiber products; include the induced degeneracies, as in IEt Remarks 6.9 and 6.13. The rigid-limit universal property supplies cones and uniqueness supplies equalizers. A finite-degree right Kan construction gives cofinality into the product of HRR(X_a) over a≤m, for every m.

- The first matching map is the rigid cover U_0→X, never an omitted condition.
- Rigid pullback preserves matching covers and has the universal property of IEt Proposition 6.10.
- The size-controlled HRR index is nonempty and cofiltered.
- For every finite m, the map from HRR(X_•) to the product of HRR(X_a) over a≤m is cofinal.

**Checks.**

- An étale Čech hypercover admits rigid refinements compatible with its specified point lifts; its degree-one matching map is to U_0×_X U_0.
- The empty augmented simplicial object over a nonempty scheme is not a rigid hypercover, even if all its positive-degree conditions are vacuous.
- HRR(X) and HRR(cX) yield equivalent indexing systems; the diagonal construction on a constant scheme recovers the ordinary étale type.

*Needs:* §3.1; EnhancedDerivedSheaves §E2.6 (generic hypercovers); AdicSpacesPartII §R0.19.9 (gap:pro-cofinal-invariance and gap:pro-level-representations).

### 3.3 Rigid étale topological type

For a degreewise locally noetherian simplicial scheme X, construct Et(X) from the pro-system of diagonal simplicial sets U ↦ diag π₀(Uₐ,ᵦ), indexed by its rigid bisimplicial hypercovers. For an ordinary scheme take the constant simplicial scheme. A compatible geometric point gives a vertex, and rigid pullback defines the map Et(X) → Et(Y) for every scheme map X → Y, with coherent identity and composition comparisons. Define its raw homotopy groups through §0.1. Prove comparison with the realization of the degreewise étale pro-types as a weak equivalence, retaining the distinction from a strict pro-isomorphism. (IEt, §3, pp. 8–10, definitions of Et and sEt; Propositions 3.1–3.2 and Theorem 3.3; IEt line 350; FGV, Appendix A.2.2, equations (A.8)–(A.9), pp. 307–308; cited by locator without text).

One proof route is the following. Apply π_0 to each scheme in a rigid bisimplicial hypercover and take the diagonal n↦π_0(U_n,n). Use the universal rigid pullback to give an index functor and the comparison map of diagrams. Track the canonical coherence isomorphisms in any strictification. Finite-degree cofinality controls the skeleta. It gives the IEt comparison to the realization of the degreewise pro-types, without declaring those pro-objects strictly isomorphic.

- Every scheme map induces a pro-map, with identity and composition after the chosen coherence identifications.
- A geometric basepoint yields a compatible pro-vertex and pointed maps for point-preserving morphisms.
- The constant simplicial scheme construction agrees with the ordinary rigid étale type.
- Et sends disjoint unions to coproducts in pro-spaces; materialization or completion is not inferred to preserve these coproducts.

**Checks.**

- For separably closed k, Et(Spec k) is weakly contractible. Its π₀ is a singleton and all positive groups vanish; an empty indexing system must not give the empty type.
- For F_q, Et(Spec F_q)≃B Gal(F_q^sep/F_q) with Gal≅Zhat as a pro-group, not constant discrete Z.
- For the simplicial C-scheme B(C_p), the raw diagonal has the homotopy type BC_p. Replacing X_• by X_0 would give a point and is wrong.

*Needs:* §3.2; §0.1; Mathlib `SSet`.

### 3.4 Cohomology of the rigid étale type

For locally noetherian X, the rigid type has H^m(Et(X),L)≅H^m_et(X,L) for locally constant abelian étale sheaves L in the ordinary étale local-system range, naturally in X, L and every m≥0. This includes arbitrary constant abelian groups, not only finite groups. For a degreewise locally noetherian simplicial scheme, constant finite coefficients have the corresponding total/diagonal comparison. It uses the same native sheaf cohomology and EnhancedDerivedSheaves’ bounded-below descent comparison. (IEt, §2 proof of Theorem 2.6, p. 6, invoking Friedlander Proposition 5.9 for mod-p coefficients, IEt line 271; the locally constant comparison after Theorem 2.10, p. 7, IEt line 331; §3, pp. 8–10; SS, §§1–2.2, pp. 822–824; Proposition 2.3, p. 824; Fr Proposition 5.9, cited by locator without text).

One proof route is the following. Compare the local system on the simplicial component diagram with its pullback to the hypercover’s étale site. Use EnhancedDerivedSheaves’ bounded-below hypercover descent for the sheaf concentrated in degree zero, and take the filtered colimit over refinements. This requires the local-system acyclicity/refinement theorem, not the false claim that any cover is acyclic. Establish the full coefficient range of Fr Proposition 5.9, cited by locator without text; the finite-coefficient comparison does not supply this local-system theorem. Finite-degree descent then compares total and diagonal constant-coefficient cohomology.

*Needs:* §3.3; EnhancedDerivedSheaves §E2.6 (bounded-below cohomological descent); SchemeAndStackFoundations §2.15; Mathlib `CategoryTheory.Sheaf.H`; AlgebraicTopology Stage 6.1 (direct local coefficients).

### 3.5 Finite étale base change

For finite étale W′→W between locally noetherian schemes, Et(W′)→Et(W) is a finite pro-covering. For every X→W in this scope the natural map from Et(X×_W W′) to the fiber product of Et(X) and Et(W′) over Et(W) is an isomorphism of pro-simplicial sets. Consequently a relative homotopy isomorphism Et(X)≅Et(Y) over Et(W) lifts along W′, compatibly with projections, with the existence and deck-equivariance qualifications of Layer 1. (SS, Lemmas 2.1–2.2 and proofs, pp. 822–823; SS line 237 and SS line 269).

One proof route is the following. For constant degree d, refine rigid covers so W′ splits as d copies on every connected hypercover piece. Treat varying finite degree on its open-and-closed degree loci. On this cofinal system π_0(U×_W W′)→π_0(U) is a simplicial degree-d covering and the base-change square of component simplicial sets is cartesian. Pass to the pro-system. Apply the pro-covering base-change result to homotopy isomorphisms; this final application adds no uniqueness assertion.

*Needs:* §3.3; §1.1; §1.5; EtaleCohomologyFoundations §F.0.2.

### 3.6 Raw and finite étale homotopy groups

For connected locally noetherian X the profinite completion of the raw pro-group π_1(Et(X),x) identifies with the supplied finite-étale fundamental group, compatibly with finite-cover fibers. If X is noetherian and geometrically unibranch, each raw π_n, n≥1, is a profinite pro-group, and π_1 itself identifies with that finite-étale group in Pro(Grp). For a field this identifies Et(Spec k) with BG_k in the raw homotopy category. (SS, Notation before §2, p. 822, SS line 228, for raw profiniteness; discussion before Corollary 2.5, p. 826, SS line 373, for completion; Appendix A.3, pp. 862–866, for the BG interface; AM Theorem 11.1, cited by locator without text).

One proof route is the following. Use the finite-cover classification of the rigid type and the geometric fiber to identify finite quotients of the raw π_1 with finite étale covers. For a field use the finite Galois hypercover system to model Et by BG_k, equivalently the field’s higher asphericity; the field comparison here is an equivalence of raw pro-homotopy types. For noetherian geometrically unibranch X the profiniteness is AM Theorem 11.1 (cited by locator without text); its proof is not replaced by the abstract compactness of finite groups, and the inputs it consumes are the following, each a step of this target unless a supplier is named.

- Torsor classification. For every discrete group G, possibly infinite, pointed pro-homomorphisms π_1(Et(X),x) → G modulo conjugation correspond to isomorphism classes of étale G-torsors on X: a torsor is trivialized on a rigid cover, its transition data form a 1-cocycle on the component simplicial set, and refinement identifies cocycles exactly as torsor isomorphisms do. This is the degree-one non-abelian case of §3.4’s comparison, built from §3.1–§3.3 and §1.9.
- Unibranch components. If X is connected, noetherian and geometrically unibranch, it is irreducible, and every connected component P₀ of an étale G-torsor P on X is irreducible, because a connected étale X-scheme dominating X is irreducible (SGA1 I §11, p. 22; SGA1 line 1310; with SchemeAndStackFoundations §0.10 for `IsGeometricallyUnibranch.of_etale`). The generic fibre of P₀ is then the spectrum of one finite separable extension of the function field, so P₀ has constant finite geometric fibre cardinality over the connected base, and P₀ → X is finite étale (SGA1 I Corollary 10.10, p. 20; SGA1 line 1208). The stabilizer H of P₀ in G is finite of that cardinality, and P is induced from the H-torsor P₀, so the classifying homomorphism has finite image. SchemeAndStackFoundations §0.10’s `unibranch_finite_components` covers only finite locally constant sheaves; this infinite-fibre statement is the step proved here.
- Finite images give profiniteness. A pro-group all of whose homomorphisms to discrete groups have finite image is isomorphic in Pro(Grp) to the system of images of its transition maps, a system of finite groups: apply the hypothesis to the projection to each level. With the first two items this makes raw π_1 profinite and identifies it with the finite-étale group of EtaleCohomologyFoundations §F.0.2.
- Higher groups. For n ≥ 2, use the cofiltered tower of pointed finite Galois covers X_i → X, which presents the pro-universal cover of §1.2 for the trivial subgroup because π_1 is profinite; §3.5 makes each Et(X_i) → Et(X) a finite pro-covering, so π_n is unchanged (§1.1), and each X_i is again noetherian and geometrically unibranch (SchemeAndStackFoundations §0.10). On a noetherian geometrically unibranch scheme, rational cohomology vanishes in positive degrees: the normalization is integral, radicial and surjective, hence a universal homeomorphism (EtaleCohomologyFoundations §F.0.4), and on a normal integral scheme the constant sheaf ℚ is the direct image from the generic point with no higher direct images, profinite groups having no positive-degree continuous cohomology with ℚ coefficients; the same holds for coefficients in any ℚ-vector space. With the pro-Hurewicz isomorphism, proved levelwise from AlgebraicTopology Stage 8, item 3 after cofinite reindexing (gap:pro-cofinite-reindexing), the first nonvanishing higher homotopy pro-group of the pro-universal cover, in degree n, is its integral homology pro-group H_n, and H_(n−1) vanishes. Its homomorphisms to a discrete abelian group A have finite image, with no finite cover involved: by the universal-coefficient sequence such a homomorphism is a class in colimᵢ Hⁿ(Et(X_i),A) = colimᵢ Hⁿ_et(X_i,A) (§3.4); its composite with A → A ⊗ ℚ is a class with coefficients in a ℚ-vector space, hence zero, so at a later level the homomorphism takes values in the torsion subgroup of A; and étale cohomology of the noetherian X_i commutes with filtered colimits of coefficient groups, so the class comes from a finite subgroup of that torsion subgroup and the homomorphism has finite image at a later level. Positive-degree integral classes need not die on finite covers (Checks below). The finite-image criterion makes H_n profinite. Induction on n climbs the Moore–Postnikov tower (gap:simplicial-moore-postnikov), each stage being a pro-Eilenberg–MacLane fibration with profinite fibre group, which again has no positive-degree rational cohomology; cohomology still commutes with filtered colimits of coefficient groups, the Eilenberg–MacLane spaces of finite groups having finitely generated integral homology in each degree.

**Checks.**

- For the nodal cubic N over ℂ, which is not unibranch at its node, the infinite chain of projective lines glued end to end is a connected ℤ-torsor; the corresponding homomorphism from raw π_1 to ℤ has infinite image, so raw π_1 is not profinite, while its profinite completion is ℤ̂, the finite-étale group. The unibranch hypothesis cannot be dropped from the profiniteness assertion.
- For X = Gₘ over ℂ, every G-torsor has finite connected components, the Kummer covers z ↦ zⁿ; homomorphisms from raw π_1 to ℤ are trivial although the topological fundamental group is ℤ, and raw π_1 is the system C_n, with limit ℤ̂(1).
- For X = Spec k, a G-torsor is a continuous G_k-set with simply transitive G-action, whose components are finite; raw π_1 is G_k as a pro-group, and all higher groups vanish, as in the BG_k comparison.
- For X = ℙ¹ over an algebraically closed field of characteristic zero, rational vanishing gives H³_et(ℙ¹,ℤ) ≅ H²_et(ℙ¹,ℚ/ℤ) = colimₙ ℤ/n(−1) = ℚ/ℤ(−1), and no nonzero class dies on a finite étale cover, every such cover being a disjoint union of copies of ℙ¹. The higher-group step asks nothing of these classes: the pro-universal cover is Et(ℙ¹) itself, its H₂ is ℤ̂(1), as the system of the groups ℤ/n(1), and each homomorphism from it to ℚ/ℤ factors through a finite subgroup. A route asserting that positive-degree integral classes die on finite covers is refuted here from degree three on.

*Needs:* §3.3; §1.9; EtaleCohomologyFoundations §F.0.2; §3.0a for completion. The unibranch route also uses §§1.1–1.2, 3.1–3.4 and 3.5; SchemeAndStackFoundations §0.10; EtaleCohomologyFoundations §F.0.4; AlgebraicTopology Stage 8, item 3 (Hurewicz) with AdicSpacesPartII §R0.19.9 (gap:pro-cofinite-reindexing) and AlgebraicTopology Stage 8 (gap:simplicial-moore-postnikov); AM Theorem 11.1.

### 3.7 Galois-equivariant geometric cohomology transport

If k-varieties X,Y have Et(X)≅Et(Y) in Ho(Pro(SSet))↓Et(k), then for every abelian group A and every m≥0 there is an isomorphism H^m_et(Y_kbar,A)→H^m_et(X_kbar,A) of G_k-modules, natural in A. Here kbar is a fixed separable closure (or its algebraic closure with the purely inseparable étale comparison). The isomorphism is induced by the lifted finite-cover system; an abstract group isomorphism alone is insufficient. (SS, Proposition 2.3, p. 824; SS line 285).

One proof route is the following. Apply Layer 1 covering base change once to the pro-covering of Et(k) formed by the entire pointed finite Galois extension tower. This supplies an isomorphism of the pulled-back towers compatible with their deck action; unrelated choices of finite-cover lifts would not suffice. Apply cohomology of the rigid type to this tower, keeping homotopy invariance for arbitrary constant abelian A and the deck-equivariant projection maps. Take the filtered colimit of scheme cohomology along the affine field-extension system. SchemeAndStackFoundations §2.15’s limit theorem identifies this with the geometric cohomology, and the deck actions give the actual G_k action.

*Needs:* §3.5; §3.4; SchemeAndStackFoundations §2.15; §0.5; §1.5.

### 3.8a Cohomological properness and the geometric product formula

Throughout this subsection K is an algebraically closed field of characteristic zero, except in the base-change criterion, which is stated over an arbitrary base scheme S, and in the target over an arbitrary field, which names its field k. SGA1 states these results over any field for coefficient groups of order prime to the characteristic, under a resolution hypothesis on finite-type schemes over the algebraic closure; the first target below discharges that hypothesis, and characteristic zero is assumed because that is where it is discharged. The dimension ≤ 0 assertion for sheaves of sets needs no resolution and is stated over every field. In characteristic zero SGA1’s set p′ of primes is the set of all primes, so its prime-to-p fundamental groups are the full finite-étale groups of EtaleCohomologyFoundations §F.0.2. For a scheme Z and a finite group F (possibly non-abelian), Tors(Z,F) is the groupoid of étale F-torsors on Z. For a morphism f:Z → Y of S-schemes, say that (F,f) is cohomologically proper in dimension ≤ 1 relative to S when, for every S-scheme S′, with Y′ = Y ×_S S′, g:Y′ → Y and h:Z ×_S S′ → Z the projections and f′:Z ×_S S′ → Y′ the base change, the base-change functor g^*f_*Φ → f′_*h^*Φ, from the pullback to Y′ of the direct image under f of the stack Φ of F-torsors on Z to the direct image under f′ of the stack of F-torsors on Z ×_S S′, is an equivalence of stacks on Y′; dimension ≤ 0 asks that it be fully faithful and dimension ≤ −1 that it be faithful. For a stack Φ on Z in place of the torsor stack the condition is the same; for a sheaf of sets E, dimension ≤ 0 asks that the base-change map g^*f_*E → f′_*h^*E be bijective and dimension ≤ −1 that it be injective (SGA1 XIII 1.0.1, Definitions 1.1 and 1.3 and 1.2, pp. 261–262; SGA1 line 10206, SGA1 line 10214 and SGA1 line 10230). The case Y = S, f the structure morphism, is the one named below without further comment; the open immersion i:U → P of the normal-crossings target and the dévissage along p:X₁ → X use the general form. For S = Spec K and a quasi-compact quasi-separated K-scheme Z, say that (F,Z) is cohomologically proper in dimension ≤ 1 over K. Because K is separably closed and Z is quasi-compact and quasi-separated, this is equivalent to: for every strictly henselian local K-algebra A, the pullback functor Tors(Z,F) → Tors(Z ⊗_K A,F) is an equivalence of groupoids; dimension ≤ 0 for a sheaf of sets E asks only for bijectivity of sections E(Z) → E(Z ⊗_K A) (SGA1 XIII Remarks 1.5(b), p. 264; SGA1 line 10347). A morphism f:Z → S is 0-acyclic when the unit F → f_*f^*F is bijective for every étale sheaf of sets F on S, not only for the constant ones (Checks below); it is locally 0-acyclic when, for every geometric point z of Z and every geometric point t of the strict localization of S at f(z), the fibre over t of the strict localization of Z at z is nonempty and connected. Locally 0-acyclic, locally 1-aspheric and 0-acyclic morphisms are those of SGA 4 XV 1.11 and 1.16 (cited by locator without text; SGA1 XIII 1.14 and 4.1 restate the conditions used, SGA1 line 10742 and SGA1 line 12120), supplied with their basic theorems by gap:nonabelian-local-acyclicity.

**Strong desingularizability.** Prove that for every algebraically closed field K of characteristic zero, every finite-type K-scheme T is strongly desingularizable in the sense of SGA5, Exposé I, §3.1.5 (cited by locator without text), and desingularizable in the sense used by SGA1 XIII Theorem 3.3 (SGA1 line 11983). No reducedness, separatedness or quasi-projectivity is imposed on T. One proof route is to apply ResolutionOfSingularitiesCharacteristicZero §5.5 to T_red, with its local-isomorphism compatibility, and use §§5.1–5.4 for principalization and the boundary refinements, retaining the nonzero-at-generic-points hypothesis for each principalized ideal. Projective closures and projective strict-SNC compactifications from §§6.1–6.2 are used only for their reduced quasi-projective and smooth quasi-projective inputs. The two consequences used below are: a proper surjective morphism X₁ → T_red with X₁ smooth over K and of the same dimension (the resolution is proper and an isomorphism over the dense regular locus, hence surjective), and, for a smooth affine K-scheme U, an open immersion into a smooth projective P whose complement is a strict normal-crossings divisor (§6.2, U being quasi-projective).

**Normal-crossings complements.** Let S be a scheme over ℚ, P → S a smooth proper morphism of finite presentation, D ⊂ P a divisor with normal crossings relative to S (SGA1 XIII 2.1, SGA1 line 10879: étale locally on P a sum of divisors div(f_i) such that, at each point of D, the f_i vanishing there cut out a subscheme smooth over S of codimension their number), U = P ∖ D with structure morphism u:U → S, and F a finite group. Prove that (F,u) is cohomologically proper in dimension ≤ 1 relative to S; for S = Spec K this says that (F,U) is cohomologically proper in dimension ≤ 1 over K (SGA1 XIII Theorem 2.4, assertion 1) under hypothesis b), and Corollaries 2.7 and 2.9, pp. 282–289; SGA1 line 11089, SGA1 line 11297 and SGA1 line 11364). One proof route follows SGA1. Over ℚ every F-torsor on U is tamely ramified along D relative to S (SGA1 XIII Remarks 2.3(b), SGA1 line 11064). For a geometric point x of D, lying on r branches of D, the fundamental group of the complement of D in the strict localization of P at x is ℤ̂(1)^r, compatibly with every base change S′ → S (SGA1 XIII Propositions 5.4–5.5 and Corollary 5.6, pp. 317–318; SGA1 line 12550 and SGA1 line 12566). Where that strict localization is regular, as at every point when S is regular, this is the absolute lemma, CrystallineCohomology CR.5:log-algebra.4, *The classical Abhyankar lemma*; the step owned here is the relative form on P ×_S S′ for an arbitrary S′, whose strict localizations need not be regular, proved by SGA1's argument (SGA1 line 12577 to SGA1 line 12600). Reduce to S′ local noetherian by approximation (SchemeAndStackFoundations §0.9 `noetherian_approximation` and `finite_presentation_limits`), and take the root-cover exponents to be the least common multiples of the inertia orders at the generic points of the branches of D over the maximal points of S′. On the root cover X′₁, smooth over S′ along the preimage Y′₁ of D, restriction of finite étale covers away from Y′₁ is fully faithful (gap:relative-etale-depth, the fibres being normal), which gives uniqueness and lets the extension be built strict-locally. At a maximal point of Y′₁ the reduced strict localization is a discrete valuation ring, where the absolute lemma applies after reduction (EtaleCohomologyFoundations §F.0.4). The extension over the open W′₁ so obtained crosses the remaining closed set Z′₁ because the fibre codimension of Z′₁ is at least 2 over maximal points of S′ and at least 1 over the other points, where S′ has étale depth at least 1 (gap:relative-homotopical-purity, SGA 2 XIV Corollary 1.20, printed p. 177; SGA2 line 6563). The relative purity input cannot be replaced by the absolute one: over a nonreduced S′ the scheme P ×_S S′ is not regular (Checks below). This gives Theorem 2.4, assertion 1) under hypothesis b), for the open immersion i:U → P. The direct image i_*Φ of the stack Φ of F-torsors on U is an ind-finite stack, i being coherent (SGA 4 IX 1.6(ii), cited by locator without text; SGA1 line 10460); it is not a stack of torsors under a sheaf of groups on P (Checks below). Proper base change for ind-finite stacks along P → S (gap:nonabelian-proper-base-change) makes (i_*Φ, P → S) cohomologically proper in dimension ≤ 1, and the composition rule SGA1 XIII Proposition 1.6(1) (SGA1 line 10386) gives the claim; this is SGA1 XIII Corollary 1.8 as used in the proof of Corollary 2.7 (SGA1 line 10456 and SGA1 line 11316).

**Cohomological properness of quasi-compact quasi-separated schemes.** Let X be a quasi-compact quasi-separated K-scheme and F a finite group. Prove that (F,X) is cohomologically proper in dimension ≤ 1 over K, and that every finite étale X-scheme E, as a sheaf of sets, is cohomologically proper in dimension ≤ 0 over K (SGA1 XIII Theorem 3.1(2)(a) and Corollary 3.2(1) and (2)(b), pp. 293–303; SGA1 line 11562 and SGA1 line 11938). One proof route treats finite-type X first and then passes to the limit, as SGA1 does for Corollary 3.2 (SGA1 line 11961 to SGA1 line 11982). For finite-type X follow SGA1’s proof of Theorem 3.1(2)(a) (pp. 296–298; SGA1 line 11676 to SGA1 line 11760). Replace X by X_red using EtaleCohomologyFoundations §F.0.4. Choose the proper surjective p:X₁ → X with X₁ smooth given by strong desingularizability, and put X₂ = X₁ ×_X X₁ and X₃ = X₁ ×_X X₁ ×_X X₁. Proper surjective descent of torsor stacks (gap:proper-surjective-torsor-descent) gives the exact diagram of stacks from the torsor stack on X to its pushforwards from X₁, X₂ and X₃ (SGA1 XIII 1.11(2)); the dévissage of SGA1 XIII Propositions 1.12(2) and 1.6(2) (SGA1 line 10594 and SGA1 line 10386) reduces the claim to dimension ≤ 1 on the smooth X₁ and dimension ≤ 0 on X₂ and X₃, the latter proved first for every finite-type scheme by the same descent. Reduce the smooth case to smooth affine pieces by Zariski descent, compactify a smooth affine piece by §6.2 and apply the normal-crossings target with S = Spec K. The sheaf-of-sets assertion follows from the torsor assertion for a Galois closure of E and SGA1 XIII Proposition 1.13(3) (SGA1 line 10656). For general X, write X = lim X_i as a cofiltered limit of finite-type K-schemes with affine transition maps (Stacks, Lemma 32.7.2, tag 09MV; StacksLimits line 791, applied to X → Spec K), so that X ⊗_K A = lim X_i ⊗_K A with quasi-compact quasi-separated stages. By SchemeAndStackFoundations §0.9 `finite_presentation_limits`, finite étale schemes over these limits, their morphisms and the isomorphisms expressing the torsor condition come from a finite stage, so Tors(X,F) and Tors(X ⊗_K A,F) are the 2-colimits of the groupoids at the stages, and the equivalences at the stages give the equivalence in the limit; the same argument gives the sheaf-of-sets assertion.

**Base-change criterion for universal local acyclicity.** Let f:X → S be a morphism of schemes locally of finite presentation and L a set of primes invertible on S. Call a sheaf of groups an ind-L-group when every finitely generated subgroup of every stalk is a finite group whose order has all its prime factors in L. For a base change f′:X′ → S′ of f, an étale finitely presented i:S″ → S′, and the base changes j:X″ = X′ ×_(S′) S″ → X′ of i and f″:X″ → S″ of f′, every sheaf of sets F on S″ has a base-change map f′^*i_*F → j_*f″^*F, and every sheaf of groups F on S″ a base-change functor f′^*i_*Φ → j_*f″^*Φ of its stack Φ of torsors (SGA1 XIII 1.0–1.3, SGA1 line 10180). Prove: (i) if f is universally locally 0-acyclic, then for every f′ and i the base-change map is bijective for every sheaf of sets F and the base-change functor is fully faithful for every sheaf of groups F; if f is universally locally 1-aspheric for L, then for every f′ and i the base-change functor is an equivalence for every sheaf of ind-L-groups F; (ii) conversely, f is universally locally 0-acyclic as soon as the base-change map of the constant sheaf with two elements is bijective for every f′ and i, and universally locally 1-aspheric for L as soon as, in addition, the base-change functor of every finite constant L-group is an equivalence for every f′ and i (SGA 4 XV §1 and Giraud VII 2.1.7, both cited by locator without text, in the forms the proof of SGA1 XIII Theorem 3.3 invokes at SGA1 line 12007, SGA1 line 12022 and SGA1 line 12069 to SGA1 line 12076). One proof route is the following. Hypotheses and conclusions are stable under base change, so take S′ = S. The stalk at a geometric point x̄ of X over s̄ of S of the base-change map, resp. functor, is the pullback F(T) → F(X̃ ×_S̃ T), resp. Φ(T) → Φ(X̃ ×_S̃ T), where S̃ and X̃ are the strict localizations of S at s̄ and of X at x̄ and T = S″ ×_S S̃: the stalk of a direct image along a coherent morphism is its value on the base change to the strict localization (Stacks, Theorem 59.53.1, tag 03Q9; StacksEtale line 3733; for sheaves of sets and for torsor stacks through the limit lemmas of Stacks §59.51, tag 03Q4, StacksEtale line 3402, and Lemma 59.73.10, tag 09YU, StacksEtale line 5824), and i and j are coherent. For (i), the morphism h:X̃ ×_S̃ T → T is affine, hence coherent; X̃ ×_S̃ T = X̃ ×_S S″ is pro-étale over X ×_S S″ and T over S″, so the strict localizations of h are strict localizations of the base change X ×_S S″ → S″ of f, and h is locally 0-acyclic, resp. locally 1-aspheric for L, by universality; its fibre over a geometric point t of T is the fibre X̃ ×_S̃ t of f at x̄ and t, nonempty and connected. Hence h is 0-acyclic (SGA 4 XV 1.16 through gap:nonabelian-local-acyclicity), which is the bijectivity of F(T) → F(X̃ ×_S̃ T) for every sheaf of sets F; morphisms between two torsors P and Q are the sections of the sheaf of sets Isom(P,Q), whose pullback along h is Isom(h^*P,h^*Q), so the functor on torsor stacks is fully faithful; and its essential surjectivity under local 1-asphericity is the torsor form of SGA 4 XV 1.16, that a coherent morphism locally 1-aspheric for L with nonempty connected geometric fibres induces an equivalence on stacks of torsors under ind-L-groups (Giraud VII 2.1.7, as used at SGA1 line 12070). For (ii), fix a base change of f, renamed f:X → S, a geometric point x̄ of X over s̄, and a point t₀ of S̃; let Z ⊂ S̃ be the closure of t₀ with its reduced structure, an integral strictly henselian local closed subscheme with generic point t₀ and closed point s̄, and κ^s a separable closure of κ(t₀). The base change X ×_S Z → Z of f has at the lift of x̄ the strict localization X̃ ×_S̃ Z, a closed subscheme of X̃ through x̄, whose fibre over Spec κ^s is X̃ ×_S̃ Spec κ^s. The hypothesis for this base change, at that lift and for the étale finitely presented Z-schemes S″ that are nonempty affine opens of Z or spread out finite separable extensions of κ(t₀) over them, gives in the cofiltered limit over them, whose limit is Spec κ^s (Stacks, Lemma 32.7.2, tag 09MV; StacksLimits line 791, and the limit lemmas above), that C(Spec κ^s) → C(X̃ ×_S̃ Spec κ^s) is bijective for the two-element set C and that the stack of G-torsors on Spec κ^s is equivalent to the stack of G-torsors on X̃ ×_S̃ Spec κ^s for every finite L-group G. The first says that X̃ ×_S̃ Spec κ^s is nonempty and connected, the second, κ^s being separably closed, that every G-torsor on it is trivial. This is the fibre condition of local 0-acyclicity, resp. local 1-asphericity for L, at x̄ for every algebraic geometric point of S̃; its passage to an arbitrary geometric point of S̃ over t₀, a separably closed extension Ω of κ^s, is the step the characterization of SGA 4 XV §1 takes for f locally of finite presentation and L invertible on S, whose abelian form is Stacks, Lemma 59.90.2, tag 0F0B, StacksEtale line 8566, with the footnote at StacksEtale line 9091; nonemptiness and connectedness themselves pass to Ω and back by Stacks, Lemma 33.7.6, tag 0363, StacksVarieties line 387, and the surjectivity of X̃ ×_S̃ Spec Ω → X̃ ×_S̃ Spec κ^s. The base change being arbitrary, this is the universal property.

**Universal local 1-asphericity.** Let X be a quasi-compact quasi-separated K-scheme. Prove that X → Spec K is universally locally 1-aspheric for the set of all primes: after any base change S′ → Spec K, for every geometric point x of X ⊗_K S′ and every geometric point t of the strict localization of S′ at the image of x, the fibre over t of the strict localization of X ⊗_K S′ at x is nonempty and connected, and every torsor on it under a finite group is trivial (SGA1 XIII Corollary 3.4(a) and (b) and Theorem 3.3 with proof, pp. 303–305; SGA1 line 12077 and SGA1 line 11983). One proof route treats finite-type X first. The condition is local on X, so for general X one may take X affine and write it as a cofiltered limit of finite-type affine K-schemes X_i (SGA1 line 12084, invoking SGA 4 XV 1.3, cited by locator without text): the strict localization of X ⊗_K S′ at x is the limit of the strict localizations of the X_i ⊗_K S′ at the images of x, so the fibre over t is a cofiltered limit, with affine transition maps, of nonempty connected affine schemes on which finite torsors are trivial; such a limit is nonempty, has no nontrivial idempotent, and every finite torsor on it comes from a finite stage by SchemeAndStackFoundations §0.9 `finite_presentation_limits`, hence is trivial. For finite-type X the route follows SGA1 (SGA1 line 11993 to SGA1 line 12076) with base Spec K, where no shrinking of the base is needed. Pass to X_red, which is geometrically reduced and flat over K, hence universally locally 0-acyclic; choose p:X₁ → X_red proper surjective with X₁ smooth; X₁ → Spec K is universally locally 1-aspheric because it is smooth; X₁ ×_X X₁ and the triple product, after reduction, are universally locally 0-acyclic over K (all three inputs from gap:nonabelian-local-acyclicity, with §F.0.4 for the reductions). Proper descent of torsor stacks (gap:proper-surjective-torsor-descent) then shows, for every base change S′ → Spec K, every étale finitely presented S″ → S′ and every sheaf of ind-finite groups on S″, that the base-change functor on torsor stacks is an equivalence: in SGA1’s diagram (SGA1 line 12025 to SGA1 line 12068) the functor for X₁ is an equivalence and those for the double and triple products are fully faithful, by part (i) of the base-change criterion above, and the descent diagram makes the functor for X an equivalence. Part (ii) of the criterion, with L the set of all primes, invertible on every S′ over K, and X of finite type over K, turns this into universal local 1-asphericity.

**Arbitrary fields and arbitrary coefficients.** Let k be a field, X a quasi-compact quasi-separated k-scheme and f:X → Spec k its structure morphism. Call a sheaf of groups on X_ét ind-finite when every stalk is a locally finite group, that is, every finitely generated subgroup of a stalk is finite; for a sheaf of groups F, cohomological properness of (F,f) in dimension ≤ 1 refers to the stack of F-torsors (SGA1 XIII 1.3, SGA1 line 10230). With the base-change definition of cohomological properness relative to Spec k (the strictly henselian reformulation above is reserved to separably closed fields; Checks below), prove: (a) for every field k, of any characteristic, (F,f) is cohomologically proper in dimension ≤ 0 for every étale sheaf of sets F on X (SGA1 XIII Corollary 3.2(1), p. 302, stated there for a field of characteristic p ≥ 0 and a coherent f, the resolution hypotheses of Corollary 3.2 being attached to its assertion 2) only; SGA1 line 11938); (b) when k has characteristic zero, (F,f) is cohomologically proper in dimension ≤ 1 for every ind-finite sheaf of groups F on X, in particular for every finite constant group (Corollary 3.2(2)(b), SGA1 line 11942, whose resolution hypothesis is discharged by the first target of this subsection and whose set p′ is the set of all primes); (c) when k has characteristic zero, f is universally locally 1-aspheric for the set of all primes (Corollary 3.4(b), SGA1 line 12077). The two preceding targets are the case k = K with F a finite constant group or a finite étale X-scheme. In positive characteristic (b) fails for the constant group of order p (Checks below), so (b) and (c) are asserted in characteristic zero only.

One proof route has five steps. *Reduction to the separable closure.* Let A be a strictly henselian local k-algebra with residue field κ. The separable closure k^s of k inside κ is a separable closure of k, κ being separably closed, and Hensel's lemma lifts it uniquely to a k-algebra map k^s → A, every finite subextension being étale over k, so X ⊗_k A = X_(k^s) ⊗_(k^s) A. By SGA1 XIII Remarks 1.5(b) (SGA1 line 10347), applied to f and to X_(k^s) → Spec k^s, (F,f) is cohomologically proper in dimension ≤ n relative to Spec k exactly when, for every such A, the functor F(X_(k^s)) → F(X ⊗_k A) between fibres of the stack is faithful, fully faithful or an equivalence according as n = −1, 0 or 1, and the same functors express the condition for (F|X_(k^s), X_(k^s) → Spec k^s); so cohomological properness over k is cohomological properness of X_(k^s) over k^s. In characteristic zero k^s is an algebraic closure k̄ of k, and the strict localization of X ⊗_k S′ at a geometric point over s̄ ∈ S′ is the strict localization of X_k̄ ⊗_k̄ Spec A at that point, A the strict henselization of S′ at s̄, so (c) is the universal local 1-asphericity target for X_k̄, and (b) for a finite constant group is the cohomological-properness target above for X_k̄. Hence assume k = K algebraically closed of characteristic zero for (b) and (c), and k separably closed, of any characteristic, for (a). *Constant and constructible sheaves of sets on finite-type X.* In characteristic zero, for a nonempty finite set C, with G the symmetric group of C and H ⊂ G the stabilizer of a point, the constant sheaf C is the quotient Q/H of the trivial G-torsor Q, so SGA1 XIII Proposition 1.13(3) (SGA1 line 10656), with (H,f) in dimension ≤ 1 and (G,f) in dimension ≤ 0 from the cohomological-properness target above, gives (C,f) in dimension ≤ 0; for C = ∅ the assertion is trivial. For a constructible sheaf of sets F on finite-type X choose a monomorphism F → G = ∏ p_(i*)C_i with finitely many finite finitely presented morphisms p_i:Z_i → X and finite sets C_i (Stacks, Lemma 59.74.4, tag 09Z7; StacksEtale line 6045; this is SGA 4 IX 2.14(ii) as used at SGA1 line 11653). Each Z_i is of finite type over K, so (C_i, f p_i) is in dimension ≤ 0, hence (p_(i*)C_i, f) by SGA1 XIII Corollary 1.9 (SGA1 line 10462), hence (G,f), direct images and base change commuting with finite products; a subsheaf of G is then in dimension ≤ −1, base-change maps of subsheaves being restrictions. The amalgamated sum G ∐_F G is constructible (Stacks, Lemma 59.71.6, tag 03RZ; StacksEtale line 5469), hence in dimension ≤ −1 by the same embedding, and F is the equalizer of the two coprojections G ⇉ G ∐_F G, a monomorphism in a topos being the equalizer of its cokernel pair; Proposition 1.13(1) (SGA1 line 10641) gives (F,f) in dimension ≤ 0, as in SGA1's proof of Theorem 3.1(1)(b) (SGA1 line 11652 to SGA1 line 11669); this passage from constant to constructible sheaves of sets uses nothing about the characteristic. *Constant sheaves of sets over a separably closed field of positive characteristic.* Let k be separably closed of characteristic p > 0, X of finite type over k and C a finite set. Follow SGA1's proof of Theorem 3.1(1)(a) with base Spec k (SGA1 line 11582 to SGA1 line 11651): a nonempty open of the base is the base itself, and the finite radicial extensions of k the proof allows change neither the étale sites nor the strict localizations (EtaleCohomologyFoundations §F.0.4), so they may be made freely. After such an extension the normalization X₁ of X_red is geometrically normal and finite surjective over X_red; the dévissage along p:X₁ → X_red and X₁ ×_X X₁ by Corollary 1.9, the descent exact sequence of Examples 1.11(1) (SGA1 line 10567) and Proposition 1.13(1) (SGA1 line 11583 to SGA1 line 11606) reduces the claim to X₁ and to a dense open affine U ⊂ X₁, the constant sheaf on the normal X₁ being the direct image of its restriction to U because the étale depth of X₁ along X₁ ∖ U is at least 2 (SGA2 XIV Theorem 1.18, SGA2 line 6424; Proposition 1.6(2), SGA1 line 10390; SGA1 line 11607 to SGA1 line 11619). The second hypothesis of Proposition 1.6(2), that (C,i) is in dimension ≤ −1, and the dimension ≤ −1 of (C, f q) on X₁ ×_X X₁ that the first dévissage uses, where SGA1 assumes its theorem for i and for f q (SGA1 line 11601 and SGA1 line 11615), hold relative to Spec k for every sheaf of sets F and every morphism h:Y → Z of finite-type k-schemes: for S′ → Spec k and a geometric point z̄′ of Z ⊗_k S′ over z̄ of Z, the base-change map at z̄′ restricts sections of F from Y ×_Z Spec O^sh_(Z,z̄) to Y ×_Z Spec O^sh_(Z ⊗ S′,z̄′) (Stacks, Theorem 59.53.1, tag 03Q9; StacksEtale line 3733); the map of strict localizations is flat, S′ → Spec k and strict henselization being flat, and local, hence faithfully flat, hence surjective, and so is its base change along Y → Z; and two sections of an étale sheaf of sets agree on an open subscheme, so sections pull back injectively along a surjective morphism. Compactify U by a dense open immersion j:U → P into a proper k-scheme, normal after a further radicial extension of k and normalization; the direct image j_*C is constant and stays constant after every base change (SGA 4 IX 2.14.1, cited by locator without text, as used at SGA1 line 11646), so (C,j) is cohomologically proper in dimension ≤ 0, (C,P → Spec k) is by proper base change for sheaves of sets (Corollary 1.8, SGA1 line 10456, through gap:nonabelian-proper-base-change), and Proposition 1.6(1) composes (SGA1 line 11620 to SGA1 line 11651). Nothing in this argument restricts the characteristic; in characteristic zero it is an alternative to the symmetric-group route, which depends on the torsor assertion of the cohomological-properness target and so on resolution. *Constructible sheaves of groups on finite-type X.* For a constructible sheaf of groups F with finite stalks choose a monomorphism of sheaves of groups F → G = ∏ p_(i*)C_i with p_i finite and C_i finite constant groups (SGA 4 IX 2.14, cited by locator without text, as used at SGA1 line 11768); (G,f) is in dimension ≤ 1 by the constant case on the Z_i, Corollary 1.9 and finite products of torsor stacks. For every étale Y₁ → Spec K, a disjoint union of copies of Spec K, and every torsor Q under G on X × Y₁, the quotient Q/F is the coequalizer of the action and projection maps F × Q ⇉ Q, a finite colimit of constructible sheaves (Q is constructible, being étale locally isomorphic to F: Stacks, Lemma 59.73.3, tag 095Q; StacksEtale line 5681), so (Q/F, X × Y₁ → Y₁) is in dimension ≤ 0 by the previous step on each copy of X, and Proposition 1.13(2) (SGA1 line 10648) gives (F,f) in dimension ≤ 1, as in SGA1's proof of Theorem 3.1(2)(b), case 4)1 (SGA1 line 11761 to SGA1 line 11796). *Colimits and quasi-compact quasi-separated X.* Every sheaf of sets on X is a filtered colimit of constructible sheaves of sets (Stacks, Lemma 59.73.2, tag 03SA; StacksEtale line 5647) and every ind-finite sheaf of groups a filtered colimit of constructible sheaves of groups with finite stalks (SGA 4 IX 2.7.2, cited by locator without text, as used at SGA1 line 11949); for the coherent morphisms f and their base changes the direct image on sheaves of sets and R¹ on sheaves of groups commute with filtered colimits (SGA 4 VII 3.3, as used at SGA1 line 11953; for sheaves of sets, the remark opening Stacks §59.51, tag 03Q4, StacksEtale line 3402), and the base-change map of a colimit is the colimit of the base-change maps. With the criterion of SGA1 XIII Proposition 1.3.1(ii) (SGA1 line 10235), in which the twisted forms of F are sheaves of sets covered by (a), this reduces (a) and (b) to constructible F (SGA1 line 11949 to SGA1 line 11959). For constructible F on a quasi-compact quasi-separated X over the separably closed base field, written K in either case, let A be a strictly henselian local K-algebra, g:X ⊗_K A → X the projection, and Φ the discrete stack of F or the stack of F-torsors. The condition of Remarks 1.5(b) is that the global-section functor of the unit Φ → g_*g^*Φ be an equivalence; it suffices that the unit be an equivalence on every affine scheme V étale over X, these forming a basis of X_ét, that is, that Φ(V) → Φ(V ⊗_K A) be an equivalence (SGA1 line 11974 to SGA1 line 11982). Write such a V as the cofiltered limit of the affine finite-type K-schemes V_i = Spec B_i, B_i running over the finitely generated K-subalgebras of the coordinate ring of V, with affine transition maps (the affine case of Stacks, Lemma 32.7.2, tag 09MV; StacksLimits line 791). The constructible sheaf F|V, its torsors, their morphisms and the isomorphisms expressing the torsor condition descend to some V_i, and Φ(V) and Φ(V ⊗_K A) are the 2-colimits of Φ(V_i) and Φ(V_i ⊗_K A) (Stacks, Lemma 59.73.10, tag 09YU; StacksEtale line 5824); the finite-type case makes each Φ(V_i) → Φ(V_i ⊗_K A) an equivalence, hence their colimit.

**Projections are 0-acyclic.** Let X be a connected quasi-compact quasi-separated K-scheme and Y any K-scheme. Prove that the projection f:X ×_K Y → Y is locally 0-acyclic and locally 1-aspheric for all primes, and 0-acyclic. The local conditions are the base change of the preceding target along Y → Spec K. Since X is quasi-compact and quasi-separated over K, f is coherent; its geometric fibres X ⊗_K Ω are nonempty and connected because a connected scheme over a separably closed field is geometrically connected (Stacks, Lemma 33.7.6, tag 0363; StacksVarieties line 387), and a coherent locally 0-acyclic morphism is 0-acyclic exactly when its geometric fibres are nonempty and connected (SGA 4 XV 1.16, through gap:nonabelian-local-acyclicity; SGA1 XIII 4.1 states the equivalence for coherent morphisms already assumed locally 0-acyclic, SGA1 line 12120). Local 0-acyclicity cannot be dropped from the criterion (Checks below).

**Homotopy exact sequence and geometric product formula.** Let S be a connected scheme and f:X → S a morphism that is locally 0-acyclic and 0-acyclic, such that (C,f) is cohomologically proper in dimension ≤ 1 relative to S for every finite group C, and f′_*E is constructible for every finite étale cover S′ → S and every finite étale E over X ×_S S′, with f′:X ×_S S′ → S′. Prove that for a geometric point s of S and a geometric point a of the fibre X_s the sequence π₁^ét(X_s,a) → π₁^ét(X,a) → π₁^ét(S,a) → 1 is exact (SGA1 XIII Proposition 4.1 and Lemma 4.2 for the set of all primes, pp. 306–307; SGA1 line 12120 and SGA1 line 12162). The constructibility hypothesis holds whenever X and S are of finite type over a field of characteristic zero: embed E in the finite locally constant sheaf 𝔽₂[E]; f′_*(𝔽₂[E]) is constructible by EtaleCohomologyFoundations §F.3, constructibility being local on S′, and a subsheaf of a constructible sheaf of sets on a noetherian scheme is constructible (gap:constructible-set-subsheaves). The projections of the product formula below satisfy it as well, with an arbitrary connected base. One proof route follows SGA1 (SGA1 line 12132 to SGA1 line 12174). Surjectivity holds because, f being 0-acyclic, every connected finite étale cover π:S′ → S pulls back to a connected cover of X: apply the unit to π_*C for a two-element set C, whose pullback to X is the direct image of C from X ×_S S′, π being finite. For exactness in the middle, let Q be a Galois cover of X ×_S S′ with group F, S′ → S finite étale, whose restriction to X_s is disconnected, so induced from a proper subgroup G of F; the finite étale quotient E = Q/G has a section over X_s, (E,f′) is cohomologically proper in dimension ≤ 0 by SGA1 XIII Proposition 1.13(3) (SGA1 line 10656), and f′_*E is constructible with bijective specialization maps (SGA1 XIII Proposition 1.14, SGA1 line 10742), hence locally constant (SGA1 XIII Corollary 1.16, SGA1 line 10798, through gap:constructible-set-subsheaves) and constant after a further finite étale cover of S′, where E acquires a section, so Q becomes disconnected. Apply this to the product formula: let X be a connected quasi-compact quasi-separated K-scheme and Y a connected K-scheme, a, b geometric points of X and Y, and c a geometric point of X ×_K Y over a and b. Prove that X ×_K Y is connected and that the projections induce a continuous isomorphism π₁^ét(X ×_K Y,c) → π₁^ét(X,a) × π₁^ét(Y,b) (SGA1 XIII Proposition 4.6(b) and proof, pp. 310–311; SGA1 line 12282 to SGA1 line 12313). No finiteness condition and no K-rational point is required of Y. One proof route follows SGA1. Connectedness is Stacks, Lemma 33.7.4 (tag 0385; StacksVarieties line 372), X being geometrically connected (tag 0363). By path transport (EtaleCohomologyFoundations §F.0.2) take c in the fibre X_b = X ⊗_K κ(b) of f:X ×_K Y → Y over b. The composite X_b → X ×_K Y → X induces an isomorphism on π₁^ét: κ(b) is separably closed, hence a strictly henselian local K-algebra, so cohomological properness of X over K, applied to torsors under every finite group and to finite étale schemes over X and over its finite étale covers, makes pullback FEt(X) → FEt(X_b) an equivalence of Galois categories compatible with the fibre functors. Apply the homotopy exact sequence to f. Its hypotheses are: f locally 0-acyclic and 0-acyclic (preceding target); (C,f) cohomologically proper in dimension ≤ 1 relative to Y for every finite group C, which is the base change along Y → Spec K of the target for X (SGA1 XIII Remarks 1.5(c), SGA1 line 10363); and constructibility of f′_*E. For the last, the direct images under f of the stacks of torsors under finite groups are pulled back from Spec K, hence constant, as SGA1 uses at SGA1 line 12303: at a geometric point of an étale Y′ → Y, cohomological properness identifies the restriction of E over the strict localization with the pullback of a finite étale E₀ over X, the identification spreads to an étale neighbourhood V by SchemeAndStackFoundations §0.9 `finite_presentation_limits`, and over V the sheaf f′_*E is the constant sheaf of the finite set E₀(X) by the dimension ≤ 0 assertion; so f′_*E is locally constant with finite stalks, hence constructible. This gives exactness of π₁^ét(X_b) → π₁^ét(X ×_K Y) → π₁^ét(Y) → 1. The composite of the first map with the first projection is the isomorphism just described, so the sequence 1 → π₁^ét(X) → π₁^ét(X ×_K Y) → π₁^ét(Y) → 1 is exact. The projections map it to the split sequence 1 → π₁^ét(X) → π₁^ét(X) × π₁^ét(Y) → π₁^ét(Y) → 1 by a map that is an isomorphism on the outer terms, so the middle map is an isomorphism. In SGA1’s printed proof the composite at SGA1 line 12307 ends in the group of Y; the composite meant, and the one used here, ends in the group of X.

**Checks.**

- Let T be the affine line with doubled origin over K. It is smooth and finite-type, so its smooth resolution is the identity with empty boundary. Its two origins prevent separatedness: the map Spec K((t))→T through the common punctured line extends to two maps Spec K[[t]]→T, one meeting each origin. Consequently it has no open immersion into a projective K-scheme. The general strong-desingularizability input cannot be replaced by a projective compactification claim.
- For the smooth quasi-projective curve Gₘ, §6.2 applies: its compactification is ℙ¹ with two reduced boundary points {0,∞}. For 𝔸¹ there is one boundary point; these boundary counts distinguish the two inputs.
- For T=∅ the reduction and resolution are empty and no boundary is principalized. For T=Spec(K[ε]/ε²), T_red=Spec K has identity resolution and empty boundary; reduction does not assert a smooth morphism isomorphic to the nonreduced T on a dense open.
- Normal-crossings complements, computed: for U = Gₘ = ℙ¹ ∖ {0,∞}, F = C₂ and A the strict henselization of K[t] at t = 0, both sides have two isomorphism classes of torsors. On U they are the Kummer classes 1 and z; on U ⊗_K A = Spec A[z,z⁻¹], the Picard group vanishes because the regular local ring A is factorial, hence so is A[z,z⁻¹]; the units are A^× z^ℤ, and A^× is 2-divisible because A is strictly henselian with 2 invertible, so the classes are again 1 and z. For D = ∅ and P = ℙ¹ both sides are trivial, ℙ¹_A being simply connected by proper base change. For U = ∅ both groupoids have exactly one object.
- The stack i_*Φ, computed: for U = Gₘ ⊂ P = ℙ¹ and F = C₂, the fibre of the direct image i_*Φ at the geometric point 0 is the groupoid of C₂-torsors on the fraction field of the strict henselization of ℙ¹ at 0, whose Galois group is ℤ̂(1); it has two isomorphism classes, the restrictions of the classes 1 and z, the second ramified at 0, each with automorphism group C₂, while the fibre at a geometric point of U has one class. A stack of torsors under a sheaf of groups on ℙ¹ has a single class at every geometric point, so i_*Φ is not of that form, and the base change along ℙ¹ → Spec K needs proper base change for ind-finite stacks, not only for torsor stacks.
- The relative normal-crossings hypothesis is needed: over S = 𝔸¹ with coordinate s, let P = ℙ¹_S and D the curve z² = s, a divisor flat over S but not étale over it at s = 0. For s ≠ 0 the fibre of U is ℙ¹ minus two points, with two classes of C₂-torsors; at s = 0 it is 𝔸¹, with one. Since U → S is smooth, cohomological properness in dimension ≤ 1 would make these stalks of R¹u_*C₂ agree (SGA1 XIII Proposition 1.14 and Remarks 1.5(d), SGA1 line 10742 and SGA1 line 10381), so the conclusion fails for this D.
- The strictly henselian reformulation needs K separably closed: over ℝ, with Z = Spec ℝ, A = ℂ and F = C₂, the groupoid on Spec ℝ has two isomorphism classes and the one on Spec ℂ has one. This is why the reformulation is stated only over a separably closed K.
- Over an arbitrary field the base-change definition is the one used: for X = Spec ℝ over k = ℝ, f is the identity, so every base-change functor is an identity and (F,f) is cohomologically proper in every dimension for every F, and f is universally locally 1-aspheric with one-point strict-local fibres. Comparing the global C₂-torsor classes on Spec ℝ and on Spec ℂ, 2 against 1, would wrongly deny this. For X = Gₘ over ℚ and F = C₂, the reduction to the algebraic closure compares the classes 1 and z on Gₘ ⊗ ℚ̄ with those on Gₘ ⊗ A, computed in the normal-crossings Check for A the strict henselization of ℚ̄[t] at t = 0: 2 and 2, never the infinitely many classes ℚ^×/ℚ^(×2) × {1,z} on Gₘ over ℚ.
- Sheaves of sets beyond finite étale schemes, computed: on X = 𝔸¹_K the skyscraper sheaf at the origin of a two-element set has 2 sections on X and 2 on 𝔸¹_A for every strictly henselian local K-algebra A, the origin pulling back to the connected closed subscheme Spec A; it is not finite étale. On X = Spec ℂ the constant sheaf of the infinite set ℕ has sections ℕ on X and on every connected Spec A. The finite étale assertion of the preceding target reaches neither.
- Ind-finite groups beyond finite ones, computed: on X = Spec ℂ the constant sheaf ℚ/ℤ has one torsor class on X and on every strictly henselian Spec A, with automorphism group ℚ/ℤ on both; ℚ/ℤ is ind-finite and not finite. The constant sheaf ℤ is not ind-finite, its stalk containing the infinite cyclic subgroup ℤ, and lies outside (b); a definition of ind-finite through torsion alone would admit it only if every element had finite order, which fails for 1 ∈ ℤ, while a definition through finite stalks would wrongly exclude ℚ/ℤ.
- Descent along the normalization, computed: for the nodal cubic N over K with normalization ℙ¹ → N gluing 0 and ∞, X₂ is the diagonal ℙ¹ together with the two points (0,∞) and (∞,0). An F-torsor on N is a trivial torsor on ℙ¹ with one gluing element of F, up to simultaneous conjugation; so Tors(N,F) has F/conjugation as its set of classes, matching π₁^ét(N) = ℤ̂, and the same computation after any base change to a strictly henselian A gives the same answer, as the cohomological-properness target asserts. Using only one branch of the normalization, a non-surjective map, would lose the gluing element.
- Universal local 1-asphericity concerns structure morphisms only: the morphism 𝔸¹ → 𝔸¹, x ↦ x², is not of the form X ⊗_K S′ → S′, and at x = 0 its strict-local fibre over a geometric generic point of the target has two points, so it is not locally 0-acyclic there. For X the nodal cubic and S′ = Spec K, the strict localization at the node is a strictly henselian local scheme, connected with no nontrivial finite torsors; local 1-asphericity holds although the node is not unibranch.
- For X = Spec K ⊔ Spec K, which is disconnected, the projection X ×_K Y → Y has disconnected fibres and is not 0-acyclic: over a connected Y a two-element constant sheaf has two sections on Y and four on Y ⊔ Y; for X = ∅ the fibres are empty and the same sheaf has one section upstairs. Over ℝ, the connected scheme Spec ℂ becomes two points over ℂ, so the separably closed hypothesis is needed for geometric connectedness.
- The criterion needs local 0-acyclicity: for a discrete valuation ring R with residue field κ and fraction field L, the morphism Spec κ ⊔ Spec L → Spec R is affine, hence coherent, with one-point geometric fibres, yet a two-element constant sheaf has two sections on Spec R and four upstairs, so it is not 0-acyclic. It is not locally 0-acyclic at the point Spec κ: the strict localization there is the spectrum of a separable closure of κ, whose fibre over a geometric generic point of the strict henselization of R is empty. The surjectivity step of the homotopy sequence fails for it: the trivial cover of Spec R is connected and pulls back to the disconnected Spec κ ⊔ Spec L.
- 0-acyclicity is tested on every sheaf of sets, not only on constant ones: over the strictly henselian discrete valuation ring A (the strict henselization of K[t] at t = 0), let X′ be the complement of the closed point x = y = t = 0 in the surface xy = t over A. Then X′ → Spec A is smooth (the partial derivatives y and x do not both vanish on X′) and coherent, X′ is integral, its generic fibre is Gₘ and its closed fibre is two disjoint punctured lines. A constant sheaf has the same sections on Spec A and on X′; the skyscraper sheaf of a two-element set at the closed point has two sections on Spec A and four on X′, so X′ → Spec A is not 0-acyclic, as the criterion predicts from its disconnected closed fibre. A definition through constant sheaves alone would call it 0-acyclic and break the criterion.
- Over K, for X = Y = Gₘ, the sequence is 1 → ℤ̂(1) → π₁^ét(Gₘ²) → ℤ̂(1) → 1, split by the second projection’s section, so π₁^ét(Gₘ²) = ℤ̂(1)²; with the adapter alone nothing computes π₁^ét(Gₘ²). For Y = Spec K the formula is the identity of π₁^ét(X).
- Relative purity, computed: over S′ = Spec K[ε]/ε², the scheme X = 𝔸²_(S′) is smooth over S′ but not regular, and for its zero section Z the fibre codimension is 2, so the relative purity input extends every finite étale cover of X ∖ Z; all of them are trivial, as over the reduction 𝔸²_K ∖ {0}, which is simply connected in characteristic zero, by topological invariance. The absolute regular-local lemma does not reach this point. On 𝔸¹_K with Z the origin, the fibre codimension is 1 and Spec K has étale depth 0 at its only point, so no condition of the purity contract holds, and indeed the Kummer cover t ↦ t² of 𝔾ₘ does not extend to a finite étale cover of 𝔸¹_K.
- The qcqs range is genuinely wider: X = Spec K[t₁,t₂,…] is affine but not of finite type; every finite étale cover of X comes from some 𝔸ⁿ_K by approximation, and π₁^ét(𝔸ⁿ_K) = 1 in characteristic zero, so π₁^ét(X) = 1, and the product formula for X and Y = Gₘ gives 1 × ℤ̂(1). For Y = Spec K(t), which has no K-rational point and is not of finite type, the product formula gives π₁^ét(Gₘ ⊗_K K(t)) ≅ ℤ̂(1) × G_(K(t)); this agrees with the arithmetic sequence of Gₘ over K(t), split by the rational point 1, with trivial action on ℤ̂(1) since K(t) contains all roots of unity. A route through a K-rational point of Y would not reach this case.
- The characteristic hypothesis is used: over an algebraically closed field of characteristic p, the Artin–Schreier cover w^p − w = xz of 𝔸² is a connected C_p-cover whose class is not of the form f(x) + g(z) modulo the Artin–Schreier image, so π₁^ét(𝔸²) is not π₁^ét(𝔸¹)²; no coefficient-order restriction is visible in characteristic zero.
- Positive characteristic in dimension ≤ 0 and ≤ 1, computed: over an algebraic closure k̄ of 𝔽_p, for X = 𝔸¹ and the constant two-element sheaf, the sections are two on 𝔸¹ and two on 𝔸¹_A for every strictly henselian local k̄-algebra A, the idempotents of A[t] lying in the local ring A; this is assertion (a). Dimension ≤ 1 fails for the constant group C_p: with A the strict henselization of k̄[s] at s = 0, the C_p-torsors on 𝔸¹_A are classified by A[t] modulo the image of w ↦ w^p − w, and the class of st is nontrivial and is not the pullback of any class from 𝔸¹_(k̄), since reducing a relation st − f(t) = w^p − w modulo the maximal ideal of A forces f to be an Artin–Schreier image in k̄[t], after which st = u^p − u is impossible by degree in t (p·deg u or 0 against 1). So the p-part that Corollary 3.2(2) excludes from its set p′ is excluded for a reason, and (b) is stated in characteristic zero only; the Artin–Schreier cover of the preceding Check enters dimension ≤ 1 and the product formula, never dimension ≤ 0.
- Dimension ≤ −1 is automatic relative to a field and not relative to another base, computed: over the base 𝔸¹_k with coordinate s, for the open immersion h:𝔾_m → 𝔸¹ and the constant sheaf C with two elements, the base change along the origin Spec k → 𝔸¹ compares the stalk of h_*C at the origin, the two sections of C on the punctured spectrum of the strict henselization of k[s] at s = 0, which is the spectrum of its fraction field and so connected, with the one section of C on the empty fibre 𝔾_m ×_(𝔸¹) Spec k; the base-change map C → * is not injective, so (C,h) is not cohomologically proper in dimension ≤ −1 relative to 𝔸¹, the base change Spec k → 𝔸¹ not being flat. Relative to a field every base change is flat, which is the surjectivity used in the positive-characteristic route.

*Needs:* ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5, 6.1–6.2; EtaleCohomologyFoundations §§F.0.2, F.0.4, F.2.3 and F.3 (gap:nonabelian-proper-base-change, gap:proper-surjective-torsor-descent, gap:nonabelian-local-acyclicity, gap:constructible-set-subsheaves and gap:constructible-set-continuity); CrystallineCohomology CR.5:log-algebra.4 (*The classical Abhyankar lemma*, for the normal-crossings target at regular strict localizations); LocalPurity §2.2 (gap:relative-etale-depth and gap:relative-homotopical-purity, for the relative Abhyankar step); SchemeAndStackFoundations §0.9 (approximation and descent of finite étale schemes through limits); Stacks tags 03Q9, 03Q4, 09YU, 09MV, 0F0B and 0363, SGA 4 XV §1 and Giraud VII 2.1.7 as cited at the base-change criterion; SGA1 XIII §§1–5 as cited at each target.

### 3.9a Finite étale product formula

For a characteristic-zero field k and geometrically connected finite-type k-schemes Y₁,Y₂, prove the canonical continuous isomorphism π₁^ét(Y₁ ×ₖ Y₂) ≃ π₁^ét(Y₁) ×_(Gₖ) π₁^ét(Y₂), with its two projections and chosen compatible geometric points (SS proof of Lemma 2.9, pp. 828–829; SS line 474; SGA1 XIII Proposition 4.6, SGA1 line 12282). No unibranch hypothesis is imposed on either factor; unibranchness enters only in §§3.9b–3.9d and 4.7, through §3.6’s profiniteness. This finite-cover theorem uses no vanishing of higher raw homotopy groups.

One proof route is the following. Over an algebraic closure k̄, the factors Y_(i,k̄) are connected finite-type k̄-schemes, so §3.8a’s geometric product formula gives π₁^ét((Y₁ ×ₖ Y₂)_k̄) ≅ π₁^ét(Y_(1,k̄)) × π₁^ét(Y_(2,k̄)) and shows that Y₁ ×ₖ Y₂ is geometrically connected; it is quasi-compact. Apply EtaleCohomologyFoundations §F.0.A2 to Y₁, Y₂ and Y₁ ×ₖ Y₂: the map from the arithmetic sequence of the product to the fiber product of the two arithmetic sequences over Gₖ is the geometric isomorphism on kernels and the identity on Gₖ, so it is an isomorphism.

**Checks.**

- Over ℂ, two copies of Gₘ have fundamental group ℤ̂², and the projections select its two coordinates. Replacing the product by a single ℤ̂ loses one independent Kummer cover.
- For Y₂=Spec k, the fiber product π₁^ét(Y₁) ×_(Gₖ) Gₖ is π₁^ét(Y₁), with inverse g ↦ (g,p(g)). This tests the structural map in the formula.
- For Y₁=Y₂=Spec ℝ over ℝ, both sides are C₂: the fiber product is the diagonal {(1,1),(c,c)}. An ordinary direct product would have four elements and is wrong.
- For the nodal cubic Y₁ over ℂ, which is not unibranch at its node, and Y₂ = Gₘ, the formula gives π₁^ét(Y₁ × Y₂) = ℤ̂ × ℤ̂(1): the first factor is §3.8a’s normalization computation, and both agree with the profinite completion of the topological fundamental group ℤ × ℤ through ComplexComparisonPartII §C6.2. A unibranch hypothesis would exclude this valid instance.

*Needs:* §3.8a; EtaleCohomologyFoundations §§F.0.2 and F.0.A2.

### 3.9b Finite effacement and profinite detection

For a connected noetherian geometrically unibranch pointed scheme X, prove that vanishing of every raw πₙ for n≥2 is equivalent to the following: for every finite étale X′→X, every finite abelian group A, every q≥2 and every class α in Hᑫ_et(X′,A), some further finite étale surjective cover X″→X′ kills α. Schmidt–Stix gives the connected geometrically unibranch variety case; the extension to the stated noetherian schemes is a target here, using AM Theorem 4.3 and §3.6’s profiniteness (SS, proof of Lemma 2.7(b), p. 827; SS line 418; AM Theorem 4.3, cited by locator without text).

Prove also the detection lemma used in this argument: between connected pointed pro-spaces (X,x) and (Y,y) whose positive homotopy pro-groups are profinite, a pointed map f:(X,x) → (Y,y) inducing an isomorphism of pro-groups π₁(X,x) → π₁(Y,y) and isomorphisms H^m(Y,L) → H^m(X,f^*L) for every m≥0 and every finite abelian local coefficient system L on Y is a weak equivalence (AM Theorem 4.3, cited by locator without text). Finite systems here have continuous finite monodromy. This is a finite-coefficient criterion only in the profinite homotopy range, and a pointed one: π₁ of a pro-space is defined at a compatible vertex (§0.1), which a connected pro-space need not possess (§0.1 Checks); both uses below, the pro-universal cover of the pointed Et(X) here and the pointed pro-homotopy fibre of §3.9d, are pointed.

One proof route is the following. Apply §1.2 to the zero subgroup and use the cofiltered finite-cover presentation of this pro-universal cover, available by §3.6. Its finite constant-coefficient cohomology is the colimit over finite étale covers by §3.4. The killing condition says this colimit vanishes in degrees at least two; simple connectivity gives degree-one vanishing. Finite local systems become constant after a finite cover. AM’s profinite detection criterion, proved through finite Postnikov obstructions, identifies this cover with a point exactly when its higher homotopy vanishes. Applying the argument on every finite cover gives both directions. None of these steps needs a finite-type structure morphism to a field.

**Checks.**

- For Spec of a separably closed field, positive-degree constant cohomology is zero, all higher raw homotopy groups vanish and the identity cover suffices.
- Over an algebraically closed characteristic-zero field, the nonzero class in H²_et(ℙ¹,C₂)=C₂ survives every connected finite étale cover, since such covers are trivial. Every surjective disconnected cover has a component with the same nonzero restriction. An empty killing cover would give a false positive.
- For Spec(k[ε]/ε²) with separably closed k, étale invariance gives the same point type and zero positive cohomology as Spec k. Reducedness is unnecessary. For BC₃→* at coefficient 𝔽₂ the cohomology is 𝔽₂ in degree zero and zero above, but π₁ is C₃→1; a single-prime constant-coefficient test does not supply the π₁ hypothesis.

*Needs:* §§1.2, 1.8–1.9 and 3.4–3.6; AlgebraicTopology Stage 8 (gap:simplicial-postnikov and gap:simplicial-moore-postnikov); AM Theorem 4.3; EtaleCohomologyFoundations §F.0.2.

### 3.9c Products of raw K(π,1) varieties

For a characteristic-zero field k and a finite family of geometrically connected geometrically unibranch finite-type k-varieties which are raw K(π,1), prove that their product over k is raw K(π,1). Include the empty product Spec k (SS Lemma 2.7(b), pp. 827–828; SS line 414).

One proof route is the following. Pass to an algebraic closure using finite-cover invariance of higher groups, apply §3.9a’s finite étale product formula and geometric finite-coefficient Künneth, and kill the finitely many classes in each Künneth expression on common finite covers. Use §3.9b for raw detection and iterate the binary formula. This supplies the raw product input to §4.7.

**Checks.**

- The empty product is Spec k with raw type BGₖ, so every πₙ for n≥2 is zero. Replacing it by the empty scheme would destroy connectedness.
- For one factor Gₘ over ℂ, π₁=ℤ̂(1) and higher groups vanish; the one-factor product is unchanged.
- For two copies of Gₘ over ℂ and a prime p, finite-coefficient cohomology has dimensions 1,2,1 in degrees 0,1,2. Pullback along (z,w) ↦ (z^p,w^p) multiplies each degree-one generator by p and their degree-two product by p², both zero in 𝔽ₚ. The product is raw K(π,1) despite nonzero H² before pullback. The same computation uses the exponent for general finite coefficients and includes p=2 and p=3.

*Needs:* §§3.9a–3.9b; §§3.5–3.6; EtaleCohomologyFoundations §§F.0.2, F.0.A2 and F.2.6.

### 3.9d Étale homotopy sequence for elementary fibrations

Let f:X→Y be an elementary fibration of smooth connected varieties in characteristic zero, with affine curve fibers, and geometric x↦y. Form the cofiltered pointed finite étale Galois cover system 𝒴 of Y and 𝒳=X×_Y𝒴. The geometric fiber, 𝒳 and 𝒴 have the Friedlander homotopy fiber sequence with all primes; finite-cover invariance identifies its higher groups with those of X and Y. This gives …→π_n Et(X_y)→π_n Et(X)→π_n Et(Y)→πₙ₋₁Et(X_y)→… in the appropriate pro-group ranges. In particular, when Y is raw K(π,1), its low-degree part is 1→π_1 Et(X_y)→π_1 Et(X)→π_1 Et(Y)→1. (SS, Notation before §2, p. 822; Proposition 2.8, pp. 827–828, invoking Friedlander Theorem 11.5; SS line 438; Fr Theorem 11.5, cited by locator without text).

One proof route is the following. Import the geometric elementary-fibration input from SchemeAndStackFoundations’ elementary-fibration carrier (gap:elementary-fibration-carrier): a smooth proper geometrically connected curve family with finite étale boundary and nonempty affine complement fibers. Applications to towers of elementary fibrations use this sequence. Over the pointed finite Galois covers, use Friedlander Theorem 11.5’s all-prime homotopy-fiber comparison (Fr Theorem 11.5, cited by locator without text). This étale pro-fiber comparison over the cover tower is the content of the target; the inputs it consumes are the following.

- The geometric carrier: X = X̄ ∖ D with X̄ → Y smooth proper with geometrically connected curve fibres and D → Y finite étale, every fibre of X → Y nonempty and affine (gap:elementary-fibration-carrier).
- Base change of the carrier: for every finite étale Y′ → Y, X ×_Y Y′ → Y′ is again an elementary fibration, with X̄ ×_Y Y′ and D ×_Y Y′; the geometric fibre X_y is a smooth connected affine curve, the complement of finitely many points in a smooth proper connected curve. This is immediate from the definition and is a step of this target.
- The cohomological input: for every finite abelian group A and every q ≥ 0, R^q f_*A is locally constant with geometric stalks H^q(X_y,A), compatibly with base change along Y′ → Y. Route: write Rf_*A = Rf̄_*Rj_*A for j:X → X̄; since D is a smooth divisor in the smooth k-variety X̄ and A is constant, EtaleCohomologyFoundations §0.10 gives R^0j_*A = A, R^1j_*A = A(−1) on D and no higher terms; EtaleCohomologyFoundations §F.3 (`VanishingCycles.lisseDirectImageTransport`) applied to the proper smooth f̄ and to the restriction f̄|_D, which is finite étale, gives the lissity and the stalk formula.
- The tower: the pro-system 𝒴 has trivial pro-π_1 by §3.6 and §1.2, so π_1 of the base acts trivially on the homotopy of the pro-fibres over 𝒴, and §3.5 identifies the higher homotopy of 𝒳 and 𝒴 with that of X and Y.
- The degree-one input: f is locally 0-acyclic, being smooth, and coherent, being a morphism of finite-type schemes over a field; its geometric fibres, smooth proper connected curves minus finitely many points, are nonempty and connected, so f is 0-acyclic by the criterion for coherent locally 0-acyclic morphisms (gap:nonabelian-local-acyclicity); (C,f) is cohomologically proper in dimension ≤ 1 relative to Y for every finite group C, by §3.8a’s normal-crossings target with base S = Y, since X̄ → Y is smooth proper and D, being finite étale over Y, is a divisor with normal crossings relative to Y; and the direct images f′_*E are constructible, X and Y being of finite type over a field of characteristic zero. §3.8a’s homotopy exact sequence then makes π_1 Et(X_y) → π_1 Et(X) → π_1 Et(Y) → 1 exact, §3.6 identifying these raw groups of the smooth connected X_y, X and Y with their finite-étale groups, so π_1 Et(X_y) maps onto π_1 of 𝒳, the kernel of π_1 Et(X) → π_1 Et(Y). The cohomological input cannot give this: π_1 is detected by torsors under finite non-abelian groups, which abelian coefficients do not see.
- The fibre identification: the map from Et(X_y) to the pro-homotopy fibre of Et(𝒳) → Et(𝒴) induces isomorphisms on cohomology with finite local coefficients by the cohomological input. On π_1, the pro-homotopy fibre’s group is the extension of π_1 of 𝒳 by the image of the boundary from π_2 Et(Y); the degree-one input gives the surjection onto π_1 of 𝒳, and the comparison with the boundary term is the degree-one part of Fr Theorem 11.5 (cited by locator without text). Both sides have profinite homotopy by §3.6, X_y being smooth; §3.9b’s detection lemma (AM Theorem 4.3) makes the map a weak equivalence.

At each finite level, after Kan/cubical comparison (AlgebraicTopology Stage 8, item 2), the ordinary homotopy-fiber input is imported: the strict fiber of a Serre fibration is weakly equivalent to the mapping-path fiber of GeneralizedCohomology §G2.10, and that fiber has the boundary maps, exactness and pointed-set end with its π₁-action of StableHomotopyKTheory §§2.3–2.6. Passage to the limit over the tower, its π₁ trivialization and finite-cover invariance give the claimed higher terms. Injectivity of π_1 Et(X_y) → π_1 Et(X) is not part of the degree-one input: it holds when π_2 Et(Y) = 0, and when f has a section, π_2 Et(X) → π_2 Et(Y) then being split surjective so that the boundary vanishes, and it fails for 𝔸² ∖ {0} → ℙ¹ (Layer 3 Examples). If the base and fiber have vanishing higher raw homotopy, the exact sequence gives that vanishing for the total space; the fundamental-group exact sequence alone does not give the higher sequence.

*Needs:* §§3.5–3.6; §1.2; StableHomotopyKTheory §§2.3–2.6 (strict and homotopy fibers, boundary maps, exactness and the low-degree π₁-action); GeneralizedCohomology §G2.10 (mapping-path carrier); AlgebraicTopology Stage 8, item 2 (Kan/cubical homotopy comparison); SchemeAndStackFoundations §§0.9–0.12 (gap:elementary-fibration-carrier); EtaleCohomologyFoundations §§0.10 and F.3 (boundary purity, lisse direct images and constructible direct images; gap:nonabelian-local-acyclicity and gap:constructible-set-subsheaves); §3.8a (normal-crossings complements over the base Y and the homotopy exact sequence); §3.9b (the detection lemma, for the fibre identification); Fr Theorem 11.5.

### Examples

Over a separably closed field the field type is a point; over 𝔽_q it is Bℤ̂. A square-zero thickening Spec(k[ε]/ε²) has the same étale type as Spec k. The map Spec k′ → Spec k for finite separable k′/k has the expected finite-cover index; a purely inseparable extension has index 1. For a product elementary fibration Gₘ×Y → Y with raw K(π,1) base in characteristic zero, the sequence is the split exact sequence with geometric kernel ℤ̂(1). Over an algebraically closed field of characteristic zero, 𝔸² ∖ {0} → ℙ¹, (x,y) ↦ [x:y], is an elementary fibration with fibres Gₘ: it is the complement of the zero and infinity sections in the ℙ¹-bundle ℙ(𝒪 ⊕ 𝒪(−1)) over ℙ¹, two disjoint sections forming a finite étale divisor. The degree-one input gives the exact sequence ℤ̂(1) → 1 → 1 → 1, π_1 of 𝔸² ∖ {0} being trivial by purity of the branch locus; injectivity on the left fails, and the boundary from π_2 Et(ℙ¹) = ℤ̂(1) to π_1 Et(Gₘ) = ℤ̂(1) is an isomorphism, π_2 Et(𝔸² ∖ {0}) being zero.

### Dependencies

Layers 0–2; Mathlib group completion, finite-quotient presentation, `ProfiniteGrp.limitCone` and `ProfiniteGrp.limitConeIsLimit`; AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension, gap:pro-cofinal-invariance, gap:pro-cofinite-reindexing and gap:pro-level-representations); ProfiniteProPGroups Layer 0; SchemeAndStackFoundations §§0.9–0.12, 2.10 and 2.15 (gap:connected-etale-components and gap:elementary-fibration-carrier); EtaleCohomologyFoundations §§0.10, F.0.1, F.0.2, F.0.4, F.0.A2, F.2.6 and F.3 (gap:nonabelian-proper-base-change, gap:proper-surjective-torsor-descent, gap:nonabelian-local-acyclicity, gap:constructible-set-subsheaves and gap:constructible-set-continuity); EnhancedDerivedSheaves §E2.6 (generic hypercovers and bounded-below descent); AlgebraicTopology Stages 6 and 8 (direct local coefficients, Kan/cubical homotopy comparison, Hurewicz, gap:simplicial-postnikov and gap:simplicial-moore-postnikov); StableHomotopyKTheory §§2.3–2.6 (homotopy-fiber exact sequences); GeneralizedCohomology §G2.10 (mapping-path carrier); ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5, 6.1–6.2; CrystallineCohomology CR.5:log-algebra.4 (the classical Abhyankar lemma); LocalPurity §2.2 (gap:relative-etale-depth and gap:relative-homotopical-purity). The item-level Needs lines distinguish the cohomological-properness inputs of §3.8a and the independent finite-cover product formula from raw detection and raw products.

## Layer 4: Arithmetic relative mapping classes

### 4.0a Center-free bases and geometric outer homomorphisms

Call a profinite group strongly center-free if the center of every open subgroup is trivial. This includes the trivial group and excludes every nontrivial abelian profinite group. For continuous homomorphisms G → Q and H → Q with H → Q surjective, define relative outer Hom as continuous homomorphisms G → H commuting with the two maps to Q, modulo conjugation by ker(H → Q). This quotient uses the geometric kernel and is not quotient by all of H. Define its open-image subset by requiring the image in the profinite topology of H to be open; conjugation preserves this condition (SS §2.2 and Corollaries 2.5–2.6, pp. 825–826; SS line 326 and SS line 369).

- Strong center-freeness is invariant under continuous group isomorphism and passes to open subgroups; a centralizer element of an open subgroup is trivial because it is central in the open subgroup it generates with that subgroup.
- Kernel conjugation preserves the over-Q condition and defines an action whose identity and composition laws use α φ α⁻¹.
- Open image is invariant under that action and hence is a property of relative outer classes; passing from a raw source to its profinite completion leaves maps to H unchanged.

**Checks.**

- For Q=1 the center condition holds and relative outer Hom is ordinary outer Hom. For Q=C₂ it fails, and a structure map with image Q has stabilizer C₂, rather than 1.
- The center of S₃ is trivial but the open subgroup A₃=C₃ has center C₃. Thus center-free alone does not satisfy the definition.
- In S₃, α=(123) transports the image (12) to (23); a second transport by β=(12) yields (13), equal to conjugation by βα. This verifies action order in the arithmetic quotient.
- For Q=C₂, G=C₂, H=C₂×C₂ and the second projection H → Q, there are two relative homomorphisms, t ↦ (0,t) and t ↦ (t,t). Both remain distinct modulo the abelian kernel. An arbitrary map t ↦ (t,0) is excluded by the over-Q condition.
- For Q=1 and H=ℤₚ, the image pℤₚ has index p and is open, whereas {0} is not open. In a finite target both images are open; algebraic surjectivity is not the predicate.
- The empty finite generating family gives the trivial group as an admissible strongly center-free base. Nontrivial C₃ and ℤₚ are excluded, including p=2.

*Needs:* ProfiniteProPGroups Layer 0 and the native profinite group topology; §3.0a; §2.5’s transport convention.

### 4.0b Open arithmetic image

For a connected nonempty finite-type k-variety X, prove that the image of π₁^ét(X) → Gₖ is open, without assuming X geometrically connected or geometrically unibranch. Finite-type descent of a chosen connected component over a separable closure makes its stabilizer open; finite-cover classification identifies that stabilizer with the arithmetic image (SS proof of Proposition 2.4(c), p. 825; SS line 361).

**Checks.**

- X=Spec k gives the full Gₖ, index 1. For X=Spec k′ with finite separable k′/k, the image is G_(k′) and its index is [k′:k]; requiring surjectivity would be false.
- For a finite purely inseparable field extension, the map on absolute Galois groups is an isomorphism, index 1. The inseparable degree must not be used as the index.
- For X=Spec ℚ(i) over ℚ, the image is G_ℚ(i)⊂G_ℚ, of index 2. It is open and is not surjective; geometric connectedness over ℚ fails.

*Needs:* EtaleCohomologyFoundations §§F.0.2, F.0.4 and F.0.A2; SchemeAndStackFoundations §§0.9, 2.10 and 2.15; ProfiniteProPGroups Layer 0. The independent finite-cover product input for raw product mapping is §3.9a.

### 4.1 Pointed arithmetic lifting

Let X,Y be connected finite-type k-varieties, with Y geometrically connected and geometrically unibranch. Choose geometric points over one separably closed extension of k and its induced separable closure kbar. The forgetful map Hom_Ho(Pro(SSet)_*)↓Et(k)(Et(X),Et(Y))→Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y)) is surjective. (SS, Proposition 2.4(a), p. 825; SS line 329).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch.

One proof route is the following. Identify Et(k) with BG_k. Geometric unibranchness of the noetherian Y makes its homotopy pro-groups profinite, so Layer 2 gives path-connected materializations. Import the geometric/arithmetic fundamental-group exact sequence from EtaleCohomologyFoundations §F.0.A2; apply the relative lifting theorem and its isomorphism assertion.

*Needs:* §2.8; §2.9; §2.3; §3.6; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.2 Pointed lifts of arithmetic isomorphisms

Under the hypotheses of §4.1, every isomorphism over Et(k) in the unpointed homotopy category has a pointed isomorphism lift over (Et(k),kbar). (SS, Proposition 2.4(a), second assertion, p. 825; SS line 340).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1.

One proof route is the following. Apply the relative isomorphism-lifting theorem using the same profinite and geometric-connectivity verifications as §4.1.

*Needs:* §4.1; §2.9.

### 4.3 Geometric monodromy quotient

Under the hypotheses of §4.1, π_1^et(Y_kbar,y) acts on pointed relative mapping classes, and forgetting points induces a surjection from its orbit set to the unpointed relative Hom set. This action is through the actual underlying abstract geometric fundamental group identified by Layer 2, not through its finite quotients one at a time. (SS, Proposition 2.4(b), p. 825; SS line 342).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1.

One proof route is the following. The exact fundamental-group sequence identifies the geometric group with the kernel of π_1(Y)→G_k. The kernel maps to the identity of G_k and therefore preserves the pointed structure class. It is contained in Δ_XY from the relative orbit theorem. The relative pointed lifting surjection descends through this subgroup quotient; it need not yet be injective.

*Needs:* §4.1; §2.10; §3.6; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.4 Arithmetic orbit bijection

Under the hypotheses of §4.1, if every open subgroup of Gₖ has trivial center, forgetting points induces a bijection between geometric π₁^ét(Y_k̄,y)-orbits of pointed relative maps and unpointed relative maps. Use the strongly center-free predicate of §4.0a, with all open subgroups included. (SS, Proposition 2.4(c) and proof, p. 825; SS line 352).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. If g stabilizes the structure class of Et(X)→BG_k, the conjugation formula says that g centralizes the image U of the raw pro-fundamental group in G_k. The finite-type connected-variety openness theorem proved in §4.0b says that U is open, including when X is not geometrically unibranch. The open subgroup generated by U and g has g in its center, so g=1. Thus S_X=1 and Δ_XY is exactly the geometric kernel. Apply the relative orbit theorem.

*Needs:* §4.3; §2.10; §2.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.5 Outer fundamental-group map

Under the hypotheses of §4.1 and strongly center-free G_k, applying π_1 to a pointed relative class and quotienting by target geometric conjugation yields a basepoint-independent map from unpointed relative homotopy classes to Hom_out,Gk(π_1^et(X),π_1^et(Y)). Here π₁ on the source is first the raw pro-group; because the target is profinite each map factors uniquely through X’s finite-étale profinite completion. This map agrees with the usual outer arithmetic homomorphism of a scheme map. (SS, Corollary 2.5 and preceding definitions, p. 826; SS line 369).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. Use the native Pro(Grp) functor and the profinite-completion universal property constructed in §3.0a and §4.0a. Path transport acts on the group homomorphism by conjugation by precisely the geometric target group. The relative outer Hom quotient of §4.0a therefore receives a well-defined orbit map. Apply the arithmetic orbit bijection. Compare scheme morphisms before taking either quotient, and use the usual geometric-basepoint path torsors for independence.

*Needs:* §4.4; §2.5; §3.6; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.6 Open-image orbit bijection

Under the hypotheses of §4.1 and strongly center-free G_k, the arithmetic orbit bijection restricts to pointed relative classes inducing homomorphisms with open image, modulo π_1(Y_kbar), and unpointed π_1-open relative classes. Openness is tested in the target profinite topology after the finite-étale completion of the source. (SS, Corollary 2.6, p. 826; SS line 391).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. The supplier’s continuous conjugation automorphisms preserve open subgroups. Hence π_1-openness is constant on every geometric orbit. Restrict the established bijection to that invariant predicate. Its definition agrees on the unpointed side by §4.5.

*Needs:* §4.4; §4.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.7 Maps into products of étale K(pi,1) varieties

Let k have characteristic zero and strongly center-free G_k. Let Y_1,Y_2 be geometrically connected, geometrically unibranch k-varieties whose raw higher étale homotopy pro-groups vanish. For every k-variety X, projections give a bijection Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y_1×_kY_2))≅Hom(Et(X),Et(Y_1))×Hom(Et(X),Et(Y_2)). (SS, Lemma 2.9 and proof, pp. 828–829; SS line 467).

The field k has characteristic zero and every open subgroup of G_k has trivial center. Y_1 and Y_2 are geometrically connected and geometrically unibranch, with vanishing raw higher étale homotopy pro-groups. X is any finite-type k-variety; its connected components are treated separately.

One proof route is the following. Treat the finitely many connected components of X separately. Apply §3.9c to show the product target is raw K(π,1). Use §3.9a’s characteristic-zero finite étale product formula with its two projections. Classifying-space representability gives the product bijection of pointed relative Hom sets. The geometric target kernel is the product of the two geometric kernels; take its componentwise orbits and apply §4.4.

*Needs:* §4.4; §1.8; §§3.9a and 3.9c; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### Examples

For a separably closed base field the geometric action is the whole target action. Thus BC₂ → BS₃ has four pointed classes and two unpointed classes. For the relative pro-space model X=BC₃ → BC₂ with trivial structure map and Y=BS₃ → BC₂ induced by sign, the pointed relative maps are the three homomorphisms C₃ → A₃. The geometric kernel A₃ fixes all three, while the full stabilizer preimage S₃ identifies the two nonzero maps. Thus its geometric-kernel quotient has three elements and the unpointed relative set has two; this is the negative control for the center hypothesis on an abstract relative model. For an empty source, every target has exactly one unpointed map, and the product formula gives 1=1×1.

### Dependencies

Earlier layers 0, 1, 2, 3; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters; §§3.9a and 3.9c. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 5: Betti realization and analytic descent

### 5.1 Algebraic evaluation of singular simplices

For a compact Hausdorff space T, let C(T,ℂ) be the native complex algebra of continuous functions. For every quasi-projective complex scheme X, evaluation at t gives a natural bijection Hom_ℂ(Spec C(T,ℂ),X) ≃ C(T,X(ℂ)_an). The left-to-right map takes a scheme morphism to its evaluations, and the inverse glues the affine coordinate maps. It is natural in algebraic maps of X and continuous maps of T. For the standard real n-simplex this identifies the algebraic singular-simplex formula with the native singular functor, including its universe lift. (FGV, Lemma A.7 and proof, p. 306; Definition A.8, p. 307; cited by locator without text).

One proof route is the following. For affine X the bijection is the ordinary algebra-homomorphism/point correspondence, with its coordinatewise continuity. For general quasi-projective X choose a finite partition of unity on T subordinate to the inverse images of an affine cover. Choose cutoff functions whose closed supports lie in the corresponding inverse-image affine opens; their subordinate finite sum is positive at every point. Use supports to extend suitable coordinate products by zero and obtain maps on distinguished opens of Spec C(T,C). Glue the scheme maps and verify uniqueness on the distinguished cover. A cutoff supported strictly inside its affine chart makes the relevant coordinate products bounded on its support, so extension by zero is continuous. In every localization used for gluing, the chosen cutoff is inverted and hence a unit; no value at its zero set is divided by it. Precomposition of continuous functions commutes with evaluation. The imported analytification carrier and its affine coordinate tests identify the native singular set.

**Checks.**

- For T a point and X=𝔸¹_ℂ, both sides are ℂ and evaluation is the identity; the zero map would fail at the point 1.
- For T=∅, C(T,ℂ) is the zero ring, Spec is empty, and both Hom sets are singletons. For T nonempty and X=∅, both Hom sets are empty. A nonzero-ring assumption would incorrectly discard the first case.
- For T=[0,1] and X=𝔾ₘ, the function t ↦ 1+t gives a point on both sides with inverse t ↦ 1/(1+t), since 1+t≥1. The function t ↦ t is excluded: it vanishes at 0, so is not a unit.
- For X=Spec(ℂ[ε]/ε²), every map into the reduced algebra C(T,ℂ) sends ε to 0. Its analytic-point space is one point, so both sides are singletons; forgetting nilpotents is valid for this test algebra, not an equality of analytic ringed spaces.

*Needs:* Mathlib `ContinuousMap.evalAlgHom`; Mathlib `ContinuousMap.compRightAlgHom`; Mathlib `TopCat.toSSetObjEquiv`; ComplexComparisonPartII §C-1.1.

### 5.2 Betti realization of simplicial varieties

For a simplicial locally finite-type complex scheme X_•, define Sing_an(X_•)=diag([a],[b])↦Sing_b(X_a(C)_an), using §C-1.1’s analytification. On the quasi-projective subcategory its n-simplices are equivalently X_n(C(Δⁿ,C)) by §5.1. For a scheme with several simplicial directions, take the diagonal after applying Sing in one additional direction. Define D(X_•)_n=X_n(C), with discrete complex points in the second direction; constant singular simplices give D(X_•)→Sing_an(X_•). On a constant scheme this is exactly the supplied singular functor on its analytification. (FGV, Definition A.8 and preceding identity, p. 307; properties (i)–(ii), p. 305; cited by locator without text).

One proof route is the following. Compose the given simplicial analytic space with Mathlib’s singular functor and precompose with the simplex diagonal. No new singular-simplex definition is needed. Use algebraic evaluation degreewise to identify the diagonal with X_n(C(Δⁿ,C)); check both faces and degeneracies, since both indices move. Constant simplices define the natural map from the diagonal discrete-point object.

- For cX, the diagonal realization is naturally isomorphic to TopCat.toSSet(X_an).
- A map of simplicial analytic spaces gives a simplicial map, preserving identity and composition.
- For degreewise quasi-projective X, its n-simplices identify with X_n(C(Δⁿ,C)) with the diagonal simplicial operators; no such algebraic evaluation formula is needed for general hypercover pieces.
- The natural point map sends a complex point in degree n to the constant singular n-simplex in X_n.

**Checks.**

- For constant A¹_C the result is weakly contractible; its discrete points object has one component for each complex number.
- For the simplicial finite constant scheme BC_p over C, the diagonal is BC_p, not a point.
- For a constant quasi-projective scheme X the natural isomorphism agrees degreewise with Mathlib’s native singular simplices; for a finite reduced scheme it agrees with the native constant-set comparison.

*Needs:* §5.1 for the quasi-projective evaluation identity; Mathlib `TopCat.toSSet`, `TopCat.toSSetObjEquiv`, `TopCat.toSSetIsoConst`, `CategoryTheory.Functor.diag` and `CategoryTheory.Functor.uncurry`; ComplexComparisonPartII §C-1.1.

### 5.3a Betti descent for smooth surjections

For a smooth surjection U→V of smooth quasi-projective complex varieties, let U_n=U×_V⋯×_V U with n+1 factors. Prove that Sing_an(U_•)→Sing_an(V) is a weak equivalence (FGV, Example A.10, p. 311; cited by locator without text).

One proof route is the following. The product charts of the smooth-chart comparison of `complexSchemeAnalytification` in ComplexComparisonPartII §C-1.1 make the analytic map a surjective submersion and supply local sections through each chosen point upstairs. The smooth quasi-projective target is Hausdorff and second countable, hence paracompact; the local-section cover is numerable. Apply Orbifolds O4-N’s Čech descent and the singular/realization comparison on this same analytic carrier.

**Checks.**

- For {0,1}→*, Čech degree n has 2^(n+1) points and the diagonal realization is contractible, rather than a discrete two-point set.
- For 𝔸¹_ℂ→Spec ℂ, Čech degree n is ℂ^(n+1), contractible, and the augmentation is an equivalence to a point.
- The identity of Gₘ gives its constant Čech nerve: the augmentation induces the identity on π₁=ℤ. The map ∅→Spec ℂ is smooth but not surjective and has empty realization, so surjectivity cannot be omitted.

*Needs:* §5.2; Orbifolds O4-N, item 3; ComplexComparisonPartII §C-1.1 (smooth-chart comparison of `complexSchemeAnalytification`); GeneralizedCohomology §G2.1; AlgebraicTopology Stage 8 (gap:multisimplicial-diagonal).

### 5.3b Analytic descent for étale hypercovers

For a quasi-projective complex scheme X and an étale hypercover U_•→X whose pieces are locally of finite type over ℂ, prove that diag Sing(U_•^an)→Sing(X^an) is a weak equivalence. No quasi-compactness, global finite-type or quasi-projectivity assumption is imposed on the U_n; infinite disjoint unions are allowed. Every matching map, including U_0→X, is a surjective étale cover. The analytification is ComplexComparisonPartII §C-1.1’s locally finite-type functor; X and its pieces may be singular or nonreduced (FGV, Appendix A.2.3, pp. 309–310; cited by locator without text).

One proof route is the following. Analytification preserves the finite matching fiber products. The étale-local-isomorphism comparison of `complexSchemeAnalytification` turns the surjective étale matching maps into local analytic isomorphisms covering all complex points. These give local continuous sections, even over singular bases. Apply topological hypercover realization and then the multisimplicial diagonal theorem. Applying this assertion in each scheme-simplicial degree gives the weak equivalence for the rigid bisimplicial hypercovers used in §6.7; all three simplicial directions are retained.

**Checks.**

- For an infinite nonempty set A, the Čech hypercover of ∐_A Spec ℂ→Spec ℂ has A^(n+1) points in degree n and contractible diagonal. In particular A=ℕ is allowed although its degree-zero piece is not quasi-projective.
- For X the nodal affine curve xy=0, the identity hypercover induces the identity on Sing of the union of two complex lines. Its π₀ is a singleton and every positive homotopy group is zero; the analytic tangent dimension at the node is 2, so a smooth-curve manifold premise is unavailable.
- For X=Spec(ℂ[ε]/ε²), the identity hypercover has one analytic point in every degree and point diagonal. The empty augmented diagram over Spec ℂ fails U_0→X and has empty diagonal; omitting degree-zero surjectivity would falsely assert an equivalence.

*Needs:* §5.2; EnhancedDerivedSheaves §E2.6 (gap:topological-hypercover-realization); ComplexComparisonPartII §C-1.1 (fibre-product and étale-local-isomorphism comparisons of `complexSchemeAnalytification`); AlgebraicTopology Stage 8 (gap:multisimplicial-diagonal).

### Examples

For constant 𝔸¹_ℂ the Betti type is contractible, while its discrete points have one component per complex number. For B(C_p) in finite constant complex schemes, degree n has pⁿ simplices and the Betti type is BC_p. For the Čech nerve of {0,1} → *, each degree has 2^(n+1) simplices but the realization is contractible; a degreewise disjoint union would retain too many components.

### Dependencies

ComplexComparisonPartII §C-1.1; native Mathlib singular sets, diagonal and continuous-function algebra maps; Orbifolds O4-N, item 3; GeneralizedCohomology §G2.1; EnhancedDerivedSheaves §E2.6 (gap:topological-hypercover-realization); AlgebraicTopology Stage 8 (gap:multisimplicial-diagonal). The item-level Needs lines separate smooth Čech descent from étale hypercover descent.

## Layer 6: p-completion and Betti–étale comparison

### 6.1 p-finite spaces

For a prime p, a space is p-finite when π_0 is finite and for every basepoint its positive homotopy groups are finite p-groups and vanish above a uniform finite degree. Regard these as homotopy types, or Kan representatives closed under equivalence. Write Sp_p-fin for their essentially small category and Pro(Sp_p-fin) for its homotopy-coherent pro-category. Arbitrary finite π_1 is not allowed unless it is a p-group; degreewise finiteness of a simplicial model is neither the definition nor a replacement for truncation. (FGV, Appendix A.2.2, p. 307, definition before (A.9); cited by locator without text; BHH, Definition 7.3.1 and Propositions 7.3.4–7.3.6, pp. 68–70; BHH line 2427).

One proof route is the following. Use the imported ordinary homotopy groups and truncations to define the full subcategory. Take a small skeleton in the declared universe. Retain all finite component sets, and compare Kan representatives through the homotopy-coherent localization requested from EnhancedDerivedSheaves. Prove finite homotopy-limit closure and use finite Postnikov decompositions with finite p-group actions.

- The predicate is invariant under weak homotopy equivalence.
- The terminal space and finite homotopy limits of p-finite spaces are p-finite.
- K(A,n) is p-finite for a finite abelian p-group A and n≥1; B P is p-finite for a finite p-group P.
- Every component has the finite p-group and truncation properties, with one common bound for the finite component set.

**Checks.**

- Every finite discrete set, including the empty set and a two-element set, is p-finite. Their component counts are 0 and 2 and every positive homotopy group is zero, so a connectedness requirement is wrong.
- BC_p is p-finite, whereas BC_q is not p-finite for a different prime q.
- The product of K(F_p,n) over n≥1 has finite homotopy groups in each degree but is not p-finite, because no truncation bound exists.

*Needs:* §0.1; AlgebraicTopology Stage 8 (gap:simplicial-postnikov); ProfiniteProPGroups Layers 0 and 3; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category and gap:coherent-pro-universes).

### 6.2 p-profinite completion

For a pro-space X, construct X^∧_p in Pro(Sp_p-fin) with a unit X→X^∧_p, characterized by equivalences of derived mapping spaces Map(X^∧_p,K)≃Map(X,K) for every p-finite K. Extend this to all p-profinite targets by their limit formula. On a small cofiltered representative, maps to a constant K are the filtered colimit of derived level mapping spaces. In particular the unit preserves continuous F_p cohomology in every degree. Completion is not materialization and is not defined as levelwise group completion alone. (IC, Theorem 2.2, pp. 4–5; Definition 3.1 and Theorem 3.3, pp. 5–6; IC line 185; BHH, §7.3, Proposition 7.3.6 and Corollary 7.3.8, pp. 70–71; FGV, Appendix A.2.2, pp. 308–309; cited by locator without text).

One proof route is the following. Use the strict model on Pro(SSet) for this localization. Take BHH’s small set K_p of p-finite test objects: isomorphism representatives of every finite discrete space, of BC_p and of K(C_p,n) for every n≥2 (BHH Definition 7.3.2, p. 69; BHH line 2437). The set is infinite, since the K(C_p,n) have distinct nonzero homotopy degrees; bounding n by some N would miss K(C_p,N+1)→*, which no test of degree at most N detects although H^(N+1)(−,𝔽ₚ) is 𝔽ₚ versus 0. Apply IC’s test-object localization and its nilpotent fibrant characterization; BHH’s finite-limit closure comparison identifies the result with a system of p-finite types. The model/infinity-category adapter is the separate next target. The mapping-space unit is the localization universal property; K(F_p,n) gives continuous cohomology preservation. This construction is applied to the raw representative of Et, without equating strict and Isaksen weak equivalences.

- The unit is natural in X in the homotopy-coherent sense.
- Precomposition with the unit is an equivalence of derived mapping spaces to every p-profinite target.
- Completing a p-profinite type again is canonically equivalent to it.
- Continuous cohomology with F_p coefficients agrees through the unit in all degrees.

**Checks.**

- For X=BC_p or any finite discrete set, completion agrees with that constant p-finite type. In particular a two-point input still has two components, excluding a connected completion.
- For q≠p, the p-profinite completion of BC_q is contractible; mod-p acyclicity here is used together with its finite prime-to-p group structure.
- The p-profinite completion of an infinite discrete set is its pro-finite-set completion, not the constant infinite discrete set and not a single connected point.

*Needs:* §§6.1 and 0.2; AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension and gap:pro-cofinal-invariance); GeneralizedCohomology §G2.1 (gap:kan-quillen-properness); BordismFormalGroups §F6.5 (Cartesian Kan–Quillen monoidal model axiom); EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category and gap:coherent-pro-mapping).

### 6.3 Model for homotopy-coherent p-profinite types

Prove that the infinity-category presented by the Kₚ-localized strict model on pro-simplicial sets is equivalent to the homotopy-coherent Pro category of p-finite spaces. Identify materialization with the right adjoint to completion of constant spaces: for an ordinary space K, maps from its p-completion into P are equivalent to maps from K into Mat(P). Under the model comparison, Mat(P) is the ordinary homotopy limit of a strict fibrant p-finite representative. The constant-space left adjoint here includes p-completion; an arbitrary constant space is not already p-profinite. (BHH, Theorem 7.1.2, pp. 62–64; Corollary 7.3.8, pp. 70–71; BHH line 2226).

One proof route is the following. Apply the general comparison of a localized strict pro-model with the infinity-pro-category of the closure of its test objects under finite limits. Use BHH’s p-finite closure theorem. Compare the constant functors on the common finite types; uniqueness of right adjoints identifies derived limit with materialization. Use the native infinity-category and universe interfaces in EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category, gap:coherent-pro-mapping and gap:coherent-pro-universes); ordinary Pro(Ho(SSet)) does not retain the required mapping spaces.

*Needs:* §6.2; §2.1; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category, gap:coherent-pro-mapping and gap:coherent-pro-universes); AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension, gap:pro-cofinal-invariance, gap:pro-cofinite-reindexing and gap:pro-level-representations).

### 6.4 Materialized p-completed étale type

For degreewise locally noetherian simplicial X, put Et_p(X)=Mat(Et(X)^∧_p), an ordinary homotopy type represented by a simplicial set. The projections and completion unit give a canonical map H^m_et(X,F_p)→H^m(Et_p(X),F_p). This map is not asserted to be an isomorphism for arbitrary X. The scheme-functorial construction is a functor of homotopy-coherent types; a strictly functorial chosen simplicial-set model is the strictification target in §6.9. (FGV, Appendix A.2.2, (A.9), pp. 307–309; cited by locator without text).

One proof route is the following. Apply the completion to the actual rigid inverse system and choose a strict fibrant p-finite presentation through the model comparison. Take the derived limit, using the supplied native simplicial-set carrier. Pull cohomology classes along all limit projections, and use continuous cohomology preservation to obtain the displayed map. The chosen point-set functor and its comparison are constructed in §6.9.

- Maps of simplicial schemes induce maps of the materialized p-types coherently with identity and composition.
- The canonical cohomology comparison is induced by the completion unit and limit projections.
- For separably closed k, Et_p(Spec k) is contractible.
- Under the finite-type hypotheses of the next theorem, the displayed map is an isomorphism in every degree.

**Checks.**

- Over C the p-realization of Spec C is a point. Its H⁰ is 𝔽ₚ and higher cohomology is zero, rather than H⁰=0 of an empty model.
- For the simplicial C-scheme BC_p, Et_p is BC_p, with H¹=F_p. The sufficient H¹=0 criterion is not a necessary condition for every individual comparison.
- For an infinite disjoint union of Spec C, H⁰_et consists of all F_p-valued functions on the component set. Raw materialization of the pro-finite-set completion has additional ultrafilter components, so its H⁰ need not coincide. Completion/materialization cannot silently commute with this infinite coproduct.

*Needs:* §3.3; §3.4; §6.3; §2.1.

### 6.5 Finite-type materialization comparison

For a p-profinite space P, assume H⁰_cont(P,F_p)=F_p via the unit, H¹_cont(P,F_p)=0, and every H^m_cont(P,F_p) is finite-dimensional. Then P is simply connected of finite type in Lurie’s sense: all its higher homotopy pro-p groups are topologically finitely generated. The projection map H^m_cont(P,F_p)→H^m(Mat(P),F_p) is an isomorphism for every m. Consequently Et_p(X) computes mod-p étale cohomology whenever X has these cohomological properties. A finite number of components is handled one connected component at a time. (DAG13, Definition 3.3.2 and Proposition 3.3.8, pp. 82–86; Corollary 3.4.10 and Theorem 3.4.12, pp. 91–93; DAG13 line 4146; FGV, Appendix A.2.2, p. 309; cited by locator without text).

One proof route is the following. Use the homotopy-coherent adapter to view the completed rigid object as Lurie’s p-profinite P. Apply Corollary 3.4.10 and Theorem 3.4.12 to obtain simple connectivity and finite type; apply Proposition 3.3.8 to the canonical projection-induced map. For finite components, completion preserves the finite component decomposition and the limit splits accordingly. Apply the connected assertion componentwise.

*Needs:* §§6.3–6.4; AlgebraicTopology Stage 8 (gap:simplicial-postnikov); ProfiniteProPGroups Layers 0, 3 and 4; Tau Ceti compact inverse systems, `TauCeti.IsTopologicallyFinitelyGenerated` and `TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category, gap:coherent-pro-mapping and gap:coherent-pro-universes).

### 6.6 Componentwise p-completed realization

Given a specified decomposition of X_• into open-and-closed simplicial subschemes X_•,a indexed by a∈A and preserved by every face and degeneracy, define Et_p^gr(X)=∐_a Et_p(X_a). Maps carry each specified summand into a specified target summand, together with the induced map of grading sets. If each summand has H⁰_et=F_p, H¹_et=0 and H^m_et(X_a,F_p) is finite-dimensional for every cohomological degree m, its comparison is an isomorphism, and the graded coproduct computes the full componentwise cohomology, with products over A in cohomology. This is a construction on specified graded objects and does not assert such a decomposition exists functorially for every simplicial scheme. (FGV, Appendix A.2.2–A.2.3, pp. 307–310; graded applications in A.4–A.5, pp. 312–315; cited by locator without text).

One proof route is the following. Apply raw completion and materialization separately on each supplied simplicial summand. Form the ordinary coproduct only at the end. Functoriality uses the actual map on grading sets and each component map; it cannot be reconstructed from an arbitrary decomposition of each X_n independently. The cochain complex of a coproduct is the product of the component cochain complexes. Exactness of products of vector spaces gives the cohomology assertion.

- The a-summand is canonically Et_p(X_a).
- A map preserving the given grading induces a map of the coproduct realizations.
- Its mod-p cohomology is the product of the component cohomologies in each degree.
- For finite A it agrees, up to canonical equivalence, with raw Et_p on the corresponding finite disjoint union.

**Checks.**

- For X equal to the disjoint union of copies of Spec C indexed by N with its displayed grading, Et_p^gr(X) is the ordinary discrete N and H⁰ is F_p^N.
- For a single specified grade the construction agrees with raw Et_p; for no grades it is empty.
- A separate partition of each X_n that a face merges or a degeneracy fails to preserve is not an input grading and cannot be used to form this functor.

*Needs:* §6.5; §6.4; §3.3; AlgebraicTopology Stage 6 (direct local coefficients).

### 6.7 Betti–étale comparison zigzag

For a simplicial quasi-projective C-scheme X and its rigid hypercovers U, whose pieces are locally of finite type and may form infinite disjoint unions, set Z_X=holim_U Sing_an(U), where the analytic realization of U uses §C-1.1’s locally finite-type analytification followed by the diagonal of all its simplicial directions. A rigid cover need not itself be quasi-projective. There is a natural zigzag Sing_an(X)←Z_X→Et_p(X); the left arrow is a weak equivalence. The right arrow is induced by the component map of every connected singular simplex and the completion unit. For a specified grading use the coproduct of these zigzags on the grades. The resulting homotopy-category map is independent of cofinal refinements. (FGV, Appendix A.2.3, pp. 309–310; cited by locator without text).

One proof route is the following. A singular simplex is connected, so its image lies in one connected component of U_a,b. These assignments commute with all face and degeneracy maps and give maps to diag π_0 U. Apply §5.3b in each degree of X and the multisimplicial diagonal theorem: Sing_an(U)→Sing_an(X) is a weak equivalence even for these locally finite-type infinite pieces. The nerve of the nonempty cofiltered rigid index is contractible, so the homotopy limit of this objectwise weak equivalence to the constant diagram still maps by equivalence to Sing_an(X). Compose the compatible component maps with the completion unit and apply derived limit. Use homotopy-coherent functoriality to obtain the zigzag independently of cofinal refinement; §6.9 also constructs the strictly chosen point-set version.

- The left arrow of the zigzag is a weak equivalence.
- Cofinal rigid refinement gives the same comparison morphism in the homotopy category.
- Comparison commutes with algebraic maps of simplicial schemes over C.
- The composite from discrete complex points has the algebraic field-automorphism naturality stated in the final theorem.

**Checks.**

- For Spec C all three homotopy types and both maps are contractible equivalences. In degree zero the comparison is 1 ↦ 1 on 𝔽ₚ, excluding the zero map.
- For a finite disjoint union of Spec C the zigzag preserves every labeled point and every permutation.
- For the simplicial scheme BC_p it yields BC_p at both endpoints and the expected identity comparison, rather than the point X_0.

*Needs:* §§5.2 and 5.3b; §3.2; §6.4; §2.1; AlgebraicTopology Stage 8 (gap:multisimplicial-diagonal).

### 6.8 Mod-p Betti–étale comparison

For simplicial quasi-projective X over C, assume H⁰_et(X,F_p)=F_p, H¹_et(X,F_p)=0 and H^m_et(X,F_p) is finite-dimensional for every cohomological degree m. Then the comparison zigzag induces an isomorphism on mod-p cohomology and homology in every degree. The statement also holds for a specified open-and-closed simplicial grading with these hypotheses on each grade, using Et_p^gr. Finite constant-coefficient Artin comparison and the analytic sheaf/singular comparison are the supplied inputs; no unrestricted infinite-coefficient analytic comparison is used. (FGV, Appendix A.2.3, pp. 309–310; property (iii), p. 305; cited by locator without text).

One proof route is the following. Apply the supplied finite-coefficient Artin comparison degreewise, then bounded-below descent/first-quadrant totalization to the simplicial scheme. Use the supplier’s paracompact semilocally contractible analytic sheaf/singular comparison; check that the induced cohomology map is precisely that from the hypercover component maps, not merely an abstract group isomorphism. Apply the finite-type materialization theorem to identify the other endpoint. Over the field F_p, natural universal coefficients turn a cohomology isomorphism into a homology isomorphism. For the grading apply this on each grade, using direct sums in homology and products in cohomology.

*Needs:* §§6.5–6.7; ComplexComparisonPartII §§C5.1, C6.1–C6.3; EnhancedDerivedSheaves §E2.6 (bounded-below cohomological descent).

### 6.9 Field-automorphism naturality of discrete points

For every field automorphism σ of ℂ and every σ-semilinear morphism f:X → X′ of simplicial quasi-projective complex schemes, the discrete-point map D(X) → Etₚ(X) is natural after twisting by σ, as a map of homotopy types. The same holds for specified gradings respected by f. Analytic comparison maps are used for continuous σ, namely identity and complex conjugation. For a simplicial ℚ-scheme obtain a homotopy-coherent Aut(ℂ)-action on its p-realization and equivariance of its discrete-point map. Construct a strictly functorial simplicial-set representative of the étale p-realization and a strict Aut(ℂ)-diagram weakly equivalent, as a coherent diagram, to this action; specify the equivariant comparison for the discrete-point map. The discrete group of automorphisms and diagram category live in the fixed larger universe. (FGV, Properties (i)–(ii), p. 305; Appendix A.2.2–A.2.3, pp. 308–310; application to (6.2), pp. 259–260; cited by locator without text).

One proof route is the following. Semilinear base change sends rigid covers and their specified geometric lifts to rigid covers, and gives coherent maps of raw étale types. Completion and materialization preserve that coherent functoriality. Define the point-to-étale map directly by the algebraic lifts of complex points to the rigid system; prove its equality with the composite comparison. This avoids needing an analytic map for a discontinuous automorphism. For identity and conjugation, evaluation of continuous functions supplies the analytic semilinear comparison as well. For a Q-model use its descent identifications and their cocycle law to obtain the coherent group action. Apply BordismFormalGroups §F6.5’s general model-diagram rectification to the coherent scheme functor, and to its diagram indexed by the discrete group of field automorphisms in a fixed larger universe, retaining the equivariant comparison of derived diagrams and the cocycle law.

**Checks.**

- On Spec ℂ all field automorphisms act on the one-point p-type by the identity. On discrete complex points of 𝔸¹, composition sends z to σ(τ(z)); replacing the action by the inverse reverses the stated law.
- Conjugation sends the discrete point i of 𝔾ₘ to −i, and sends the positively oriented loop exp(2πit) to its inverse. On geometric π₁ it acts by multiplication by −1; a trivial action fails.
- For a finite constant scheme with two labeled points, a field automorphism fixes both labels; a permutation of labels acts by that permutation. A rectified model is compared equivariantly with these maps, and arbitrary weakly equivalent spaces without equivariant comparison do not satisfy the target.

*Needs:* §6.7; §5.1; §3.1; §6.3; ComplexComparisonPartII §C-1.1; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category, gap:coherent-pro-mapping and gap:coherent-pro-universes); BordismFormalGroups §F6.5 (model-diagram rectification).

### Examples

For B(C_p) the materialized p-type is BC_p and H¹=𝔽ₚ, so the sufficient H¹=0 theorem is not a necessary condition for every comparison. For K(ℤ/p,2), the finite-type criterion applies and the degree-two comparison is 𝔽ₚ → 𝔽ₚ, the identity. For the specified grading ∐_(a∈ℕ) Spec ℂ, the graded type is the discrete ℕ and H⁰=𝔽ₚ^ℕ. Completing the ungraded infinite set first has the ultrafilter component set βℕ; its full function space contains functions not arising from the continuous functions βℕ → 𝔽ₚ.

### Dependencies

Layers 0–5; AdicSpacesPartII §R0.19.9 (gap:pro-universe-extension and gap:pro-cofinal-invariance); GeneralizedCohomology §G2.1 (gap:kan-quillen-properness); AlgebraicTopology Stages 6 and 8 (direct local coefficients, gap:simplicial-postnikov and gap:multisimplicial-diagonal); ProfiniteProPGroups Layers 0, 3 and 4 and the native compactness, generation and abelian pro-p structure interfaces; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 (gap:coherent-pro-category, gap:coherent-pro-mapping and gap:coherent-pro-universes) and §E2.6 (bounded-below descent); ComplexComparisonPartII §§C-1.1, C5.1 and C6.1–C6.3; BordismFormalGroups §F6.5 (Cartesian Kan–Quillen monoidal model axiom and model-diagram rectification). The item-level Needs lines give the direct inputs.

## Downstream consumers

EllAdicHomotopyTypesAndWeights consumes the pro-space reindexing and universe interfaces of Layer 0, the cohomology convention of §0.5, the rigid pro-simplicial carrier of §3.3 with the local-coefficient comparison of §3.4, and the homotopy-limit Betti comparison of §§6.4–6.8 for quasi-projective complex schemes. ArithmeticKTheoryPartII consumes the specified-graded complex comparison of §§6.6–6.8, its mod-p homology isomorphism under the stated finite-type conditions, and the coherent and rectified automorphism actions of §6.9 for spectrum-level applications. The raw K(π,1) recognition of §1.9, the finite-cover transport of §3.5, the raw and finite fundamental-group comparison of §3.6, the effacement criterion of §3.9b, the elementary-fibration sequence of §3.9d and the arithmetic adapters and orbit theorems of §§4.0a–4.7 are the interfaces on which finite-coefficient K(π,1) applications and arithmetic fundamental-group applications rest.

## References

All statements are expressed here in the roadmap’s notation. Line locators count the lines of the text extraction of the linked version of each source, one marker line per page; printed page, theorem and equation locators identify the same passages independently. A source cited by locator without text was not available as text and is cited by its theorem numbers and pages alone.

- **SS:** Alexander Schmidt and Jakob Stix, *Anabelian geometry with étale homotopy types*, Annals of Mathematics 184 (2016), 817–868. [Published open text](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf). §§1–2.3 and Appendix A.1–A.3; SS line 228 and SS line 1421.
- **I01:** Daniel C. Isaksen, *A model structure on the category of pro-simplicial sets*, arXiv:math/0106152v1 (2001). [Version read](https://arxiv.org/abs/math/0106152v1). §§4–8 and §§12–18; I01 line 412 and I01 line 423. Page references use the preprint, rather than journal pagination.
- **IStr:** Daniel C. Isaksen, *Strict model structures for pro-categories*, arXiv:math/0108189v1 (2001; published 2004). [Version read](https://arxiv.org/abs/math/0108189v1). Proof of Theorem 4.15 and Remark 4.16, pp. 11–12; IStr line 507. This is the preprint numbering for the properness repair.
- **IEt:** Daniel C. Isaksen, *Etale realization on the A¹-homotopy theory of schemes*, arXiv:math/0106158v2 (2003 version). [Version read](https://arxiv.org/abs/math/0106158v2). §§2–3 and §§5–6; IEt line 394 and IEt line 634.
- **IC:** Daniel C. Isaksen, *Completions of pro-spaces*, arXiv:math/0404303v1 (2004; published 2005). [Version read](https://arxiv.org/abs/math/0404303v1). Theorems 2.2 and 3.3 and Definition 3.1; IC line 185 and IC line 233. The test-object localization is distinct from localization defined only by constant-coefficient homology.
- **BHH:** Ilan Barnea, Yonatan Harpaz and Geoffroy Horel, *Pro-categories in homotopy theory*, Algebraic & Geometric Topology 17 (2017), 567–643. [Author postprint](https://www.math.univ-paris13.fr/~harpaz/pro_categories.pdf). Theorem 7.1.2, Definition 7.3.1, Proposition 7.3.6 and Corollary 7.3.8; BHH line 2226 and BHH line 2427. Page references use the postprint’s internal pages 62–71.
- **DAG13:** Jacob Lurie, *Derived Algebraic Geometry XIII: Rational and p-adic Homotopy Theory*, December 15, 2011. [Author text](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf). Definition 3.3.2, Proposition 3.3.8, Corollary 3.4.10 and Theorem 3.4.12; DAG13 line 3708, DAG13 line 3736 and DAG13 line 4146.
- **FGV:** Tony Feng, Søren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, Inventiones Mathematicae 230 (2022), 225–319. [Publisher citation](https://doi.org/10.1007/s00222-022-01127-8). Appendix A.2.1–A.2.3 and Example A.10, cited by locator without text. The finite-type criterion used here is DAG13 Theorem 3.4.12 and Proposition 3.3.8. Infinite specified gradings use componentwise completion and materialization; the smooth-submersion proof assumes a smooth target.
- **BK:** A. K. Bousfield and D. M. Kan, *Homotopy limits, completions and localizations*, Lecture Notes in Mathematics 304 (1972). [Publisher citation](https://doi.org/10.1007/978-3-540-38117-4). XI 5.2, XI 7.1, IX 5.1 and IX 5.4, cited by locator without text.
- **AM:** Michael Artin and Barry Mazur, *Etale homotopy*, Lecture Notes in Mathematics 100 (1969). [Publisher citation](https://doi.org/10.1007/BFb0080957). Theorems 4.3 and 11.1, cited by locator without text.
- **Fr:** Eric M. Friedlander, *Etale homotopy of simplicial schemes*, Annals of Mathematics Studies 104 (1982). [Publisher citation](https://doi.org/10.1515/9781400881499). Proposition 5.9 and Theorem 11.5, cited by locator without text.
- **SGA1:** A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental*, revised arXiv:math/0206203v2. [Open edition](https://arxiv.org/abs/math/0206203v2). Exposé I, Corollary 10.10 and §11, for étale schemes over geometrically unibranch bases; Exposé XIII, Definitions 1.1 and 1.3, Proposition 1.3.1, Example 1.4, Remarks 1.5, Propositions 1.6, 1.12, 1.13 and 1.14, Corollaries 1.8, 1.9 and 1.16, paragraph 2.1, Remarks 2.3, Theorem 2.4 and Corollaries 2.7 and 2.9, Theorems 3.1 and 3.3 with Corollaries 3.2 and 3.4 (Corollary 3.2(1) over an arbitrary field, Corollary 3.2(2)(b) and Corollary 3.4(b) over an arbitrary field of characteristic zero), Proposition 4.1, Lemma 4.2, Proposition 4.6, Propositions 5.4 and 5.5 and Corollary 5.6, for cohomological properness, local asphericity, the homotopy exact sequence and the characteristic-zero geometric finite-cover product formula; Exposé IX, Theorem 6.1, for the arithmetic sequence consumed through EtaleCohomologyFoundations. In the printed proof of XIII Proposition 4.6 (p. 311; SGA1 line 12307) the composite asserted to be an isomorphism should end in the fundamental group of X, not of Y.
- **SGA5:** A. Grothendieck, edited by L. Illusie, *Cohomologie ℓ-adique et fonctions L (SGA 5)*, Lecture Notes in Mathematics 589 (1977). [Publisher citation](https://doi.org/10.1007/BFb0096802). Exposé I, §3.1.5, for the strong-desingularizability condition referenced by SGA1 XIII Theorem 3.1(2) and Proposition 4.6(a), cited by locator without text.
- **SGA4:** M. Artin, A. Grothendieck and J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas (SGA 4)*, Tomes 2 and 3, Lecture Notes in Mathematics 270 and 305 (1972–1973). [Publisher citation](https://doi.org/10.1007/bfb0081551). Exposé VII 3.3, Exposé VIII 9.4, Exposé IX 1.6(ii), 2.7.2, 2.9, 2.11 and 2.14, Exposé XII 5.1 and Exposé XV 1.3, 1.11, 1.16, 2.1 and 4.1, cited by locator without text, for the inputs requested from EtaleCohomologyFoundations in §3.8a, for ind-finiteness of direct-image stacks, and for the colimit presentations, embeddings and continuity of sheaves of sets and ind-finite sheaves of groups used in §3.8a.
- **StacksVarieties:** The Stacks Project Authors, *The Stacks Project*, chapter Varieties. [Open text](https://stacks.math.columbia.edu/download/varieties.pdf). Lemmas 33.7.4 and 33.7.6 (tags 0385 and 0363), for connectedness of products and geometric connectedness over separably closed fields; StacksVarieties line 372 and StacksVarieties line 387.
- **SGA2:** A. Grothendieck and M. Raynaud, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux (SGA 2)*, revised arXiv:math/0511279v1. [Open edition](https://arxiv.org/abs/math/0511279v1). Exposé XIV, Theorem 1.18 and Corollaries 1.19 and 1.20, printed pp. 176–177, for the étale depth of a normal scheme along a closed subset and for relative étale and homotopical depth, as invoked in the proofs of SGA1 XIII Theorem 3.1 and Proposition 5.5; SGA2 line 6424, SGA2 line 6545 and SGA2 line 6563.
- **StacksLimits:** The Stacks Project Authors, *The Stacks Project*, chapter Limits of Schemes. [Open text](https://stacks.math.columbia.edu/download/limits.pdf). Lemma 32.7.2 (tag 09MV), for writing a quasi-compact quasi-separated scheme over a field as a limit of finite-type schemes with affine transition maps; StacksLimits line 791.
- **StacksEtale:** The Stacks Project Authors, *The Stacks Project*, chapter Étale Cohomology. [Open text](https://stacks.math.columbia.edu/download/etale-cohomology.pdf). Lemmas 59.71.6, 59.73.2, 59.73.3, 59.73.10 and 59.74.4 (tags 03RZ, 03SA, 095Q, 09YU and 09Z7) and the remark opening §59.51 (tag 03Q4), for constructible sheaves of sets: closure under finite limits and colimits, filtered-colimit presentations of all sheaves of sets, detection after surjective pullback, descent along limits of schemes, embeddings into direct images of finite constant sheaves along finite morphisms, and sections of filtered colimits over quasi-compact objects; StacksEtale line 3402, StacksEtale line 5469, StacksEtale line 5647, StacksEtale line 5681, StacksEtale line 5824 and StacksEtale line 6045.

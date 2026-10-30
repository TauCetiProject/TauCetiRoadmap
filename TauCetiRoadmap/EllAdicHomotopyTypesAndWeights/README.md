# Roadmap: ℓ-adic homotopy types and weights

**Summary.** Construct relative integral divided-power forms, their simplicial and pro-simplicial cohomology comparisons, and a commutative ℚ_ℓ homotopy algebra of every separated finite-type variety over an algebraically closed field in which ℓ is invertible. Combine its complex comparison with geometric cohomological weights and Sullivan theory to prove rational weight splitting and conjugacy for complex varieties, ℚ_ℓ weight splitting over arbitrary algebraically closed bases, formality of proper smooth varieties, and the weight-bounded presentation of the unipotent étale fundamental Lie algebra of a normal variety. The construction retains integral coefficients at every prime, including 2, before rationalization and stabilization (Weil II §5.1–§5.3, pp. 234–242; weil-II line 3650).

## Scope and ownership

This roadmap owns the relative divided-power form functor and its triangular integral comparison, its bidegreewise completion and rational stabilization, the realization of these forms on the supplied étale type, the comparison of the resulting commutative algebras over ℂ, the finite-block minimal-model weight arguments, the compatible proalgebraic weight extension, and the 1-minimal comparison and presentation with weights −1, −2 on generators and −2, −3, −4 on relations. Its complex geometric bridge compares a supplied mixed Hodge realization with Frobenius realizations; it does not introduce another abstract mixed Hodge structure.

The ordinary DG carrier, morphisms, tensor product and cohomology are already in the library: Tau Ceti’s DG algebra modules supply them. DerivedDeRhamCohomology §2.21 owns strict graded commutativity and odd-square-zero on the nonnegative DG carrier; Layer 0 uses these predicates and fixes connectedness. Mathlib supplies divided-power and exterior algebras, simplicial sets and Dold–Kan. DerivedModuleAlgebra §§0.DP.2–0.DP.3, 0.14–0.17 and 1.T.1–1.1 own homogeneous divided powers, general décalage and module tower exactness. The retained rank-one coordinate target identifies these objects with a specific integral polynomial lattice; the coefficient calculation applies décalage to the relative simplex object.

Generic polynomial forms, Sullivan/Hirsch constructions, polynomial homotopies and their existence/lifting/uniqueness theory are requested from AlgebraicTopologyPartII Layer 4 through the five exact contracts below, extending its rational sphere and loop-space direction. DGAInfinity Layer 3 owns homological transfer and the DG/A∞ formality predicates; Layer 8 owns Massey consequences and formality criteria. Sullivan minimality and A∞ minimality are different notions. AlgebraicTopology Stage 6 and Tau Ceti’s singular cohomology modules retain ordinary cochains and cup products.

EtaleHomotopyTypes §EH.3 owns raw étale types, rigid hypercovers and their cohomology; §EH.6 owns the homotopy-limit Betti comparison for quasi-projective complex schemes with the p-completed type. AnabelianGeometryAndNonabelianChabauty §1.5 constructs the raw pointed étale homotopy type as an object of the homotopy category of pointed pro-spaces; the form functor needs a strict pro-simplicial representative with strict refinement maps, which is why the rigid object of EtaleHomotopyTypes §EH.3 is consumed, and no target here uses §1.5. The finite-component hypercover presentation is requested from EtaleHomotopyTypes §EH.3 below. Sections 4.1a–4.4 compare its form algebra with the raw rigid-type algebra and use nerves of analytic open hypercovers with contractible pieces for separated finite-type complex schemes. EtaleCohomologyFoundations §§F.0–F.4 owns the finite and adic coefficient theories, finiteness, base change and Galois actions. ComplexComparisonPartII §§C6.0–C6.6 owns finite CW type and finite/adic Artin comparison; §C5.5 owns logarithmic de Rham complexes, and §C5.3 is the geometric Hodge supplier direction. MotivicEtaleKTheory §§3.1–3.2 and 3.4 owns the smooth logarithmic Dolbeault algebra and its compactification-independent mixed Hodge realization; its singular hyperresolution extension is requested below. MixedHodgeModulesAndIrregularHodgeTheory §§H.1/operations and H.1/weight-bounds treats quasi-projective varieties through mixed Hodge modules; the requested extension is Deligne’s hyperresolution realization for all separated finite-type complex schemes. ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6 and 6.1–6.4 owns the characteristic-zero resolution, principalization and SNC compactification inputs, with their stated domains. SchemeAndStackFoundations §§4.17 and 4.19 retain SNC geometry and alterations. DeligneWeightsAndPurity §§0.1–0.18, 7.12, 7.14–7.15 and 8.20–8.24 retain scalar weights, finite-dimensional spectral linear algebra, proper and smooth cohomological bounds and proper smooth purity; the general ordinary-cohomology bound is requested below. ReductiveGroups Layers 5, 6 and 6A own finite-dimensional unipotent theory, complete reducibility and characteristic-zero Levi complements. The inverse-limit compatibility for the particular minimal-model automorphism tower is proved here. AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 retains tensor reconstruction and the geometric unipotent group; this roadmap compares its general normal-variety instance with 1-minimal models.

No theorem here asserts a functorial choice of a model weight grading, a continuous action on an actual chosen minimal model, or conjugacy by an automorphism homotopic to identity. The last two stronger assertions are questions in Weil II §§5.3.9–5.3.10, p. 242 (weil-II line 3960). The correction to Morgan’s Theorem 9.2 distinguishes the canonical associated graded of indecomposables from the indecomposable space itself; Theorem 9.4’s presentation remains applicable (morgan-correction line 29).

## Conventions

Fix universes for schemes, modules, simplicial sets and small cofiltered index categories. All diagrams used to form a pro-object are small in the chosen diagram universe, using AdicSpacesPartII §R0.19.9’s ordinary pro-category, imported through DiamondsAndVStacks §D0.13, and EtaleHomotopyTypes §EH.0’s pro-space reindexing and change-of-universe interfaces. Varieties mean separated finite-type schemes over an algebraically closed field k; nilpotents are allowed. A single minimal model requires connectedness. Empty and disconnected schemes are handled by the form functor before taking connected models. Fix a prime ℓ invertible in k. Ordinary cohomology is used throughout. Finite coefficients have exponent r≥1; the exponent-zero quotient is the zero ring and is not substituted for the first coefficient level.

R denotes an arbitrary commutative ring, including the zero ring; K denotes a characteristic-zero field when polynomial forms or Sullivan theory are used. Cochain degree p and divided-power degree n are nonnegative integers; d has bidegree (+1,0). Minimal-model weight w is an integer, d preserves w, and multiplication adds weights. The unit has degree and weight zero. Total t-graded algebras are direct sums; inverse limits complete each (p,n) separately. The integral simplex quotient kills dt=Σdxᵢ and retains t=Σxᵢ. Only characteristic-zero barycentric polynomial forms impose t=1.

Graded commutativity uses xy=(−1)^(pq)yx for homogeneous degrees p,q, with the additional integral axiom x²=0 in odd degree. Koszul signs alone do not imply that axiom in characteristic 2. Differentials raise degree by one and satisfy d(xy)=d(x)y+(−1)^p x d(y). Sullivan minimality means a free graded-commutative algebra on positive-degree generators, an ordered Hirsch filtration, and decomposable generator differentials. Connectedness means H⁰=K, without requiring the target algebra’s degree-zero part to equal K. A 1-minimal map is an H¹ isomorphism and H² injection; a full minimal model is a quasi-isomorphism in every degree (Morgan §5, pp. 163–169; morgan line 1017).

Geometric Frobenius is inverse to arithmetic Frobenius. It acts by q⁻¹ on ℚ_ℓ(1), so H²(ℙ¹)=ℚ_ℓ(−1) has eigenvalue q and weight 2. A nonzero algebraic number has Weil q-weight w when every complex conjugate has absolute value q^(w/2), with q>1. Integrality is separate from weight. Lie weights are dual to cohomological generator weights and have the opposite sign. All decompositions use generalized eigenspaces on finite invariant pieces; semisimplicity of Frobenius is never assumed (Weil II §5.3.1–§5.3.2; weil-II line 3874).

**Checks.**

- Over ℤ and over 𝔽₂, a degree-one exterior generator has e²=0; the degree-one generator of 𝔽₂[e] instead has e²≠0 despite the same trivial signs.
- For x in degree 2 and y in degree 3 with dy=x², weights 2 and 4 give weight(dy)=4=2+2; weights 2 and 3 fail this equality.
- For q=2, geometric Frobenius on H⁰(ℙ¹) and H²(ℙ¹) has eigenvalues (1,2), hence weights (0,2); arithmetic Frobenius gives (1,1/2), hence (0,−2).
- The two closed degree-one generators of an elliptic curve have weights (1,1); their dual Lie generators have weights (−1,−1), and their bracket is zero. For a nonzero bracket, Λ(a₁,b₁,c₁) with dc=ab and weights (2,2,4) gives [A,B]=−C of weight −4=(−2)+(−2), with §8.3’s sign convention. On 𝔾_m the single cohomological weight is 2 and the Lie weight is −2.
- At q=1 all magnitudes q^(w/2) equal 1, so weight uniqueness fails; q>1 is required. A rank-zero representation has no eigenvalues and is pure of every weight.

## Exact supplier contracts

### From Mathlib

Use the pins of the repository’s lake manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. `DividedPowerAlgebra`, `DividedPowerAlgebra.dp`, `DividedPowerAlgebra.dp_mul`, `DividedPowerAlgebra.algHom_ext`, `DividedPowerAlgebra.lift` and `DividedPowerAlgebra.map` are in `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` (definition at line 99, generator at 127, product at 171, extensionality at 235, lift and map in the subsequent sections). This is the universal algebra of a module, not its concrete rank-one integral polynomial embedding. `ExteriorAlgebra` in `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` imposes alternating products over every commutative ring. No odd-square condition is inferred from sign commutation alone.

`SSet` in `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33` supplies simplicial sets; `SSet.chainComplex` in `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:75` supplies their ordinary chain complex. `ChainComplex.linearYonedaObj` in `Mathlib/CategoryTheory/Abelian/Ext.lean:56` takes its module-valued Hom cochain complex; the chain objects are the free modules on simplices, and coefficients are taken in the same module category. `CategoryTheory.Abelian.DoldKan.equivalence` in `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167` supplies normalization in an abelian category. It does not assert that arbitrary nonlinear functors preserve chain homotopies. `CategoryTheory.Functor.IsMittagLeffler` in `Mathlib/CategoryTheory/CofilteredSystem.lean:137` is the stabilization predicate for images of a set-valued functor; exactness of module or complex limits is consumed from DerivedModuleAlgebra. For the full subcategory of nonnegative commutative DG algebras selected by the supplied predicates, use `CategoryTheory.MorphismProperty.Localization` and `CategoryTheory.MorphismProperty.Q` in `Mathlib/CategoryTheory/Localization/Construction.lean:106` and line 111, with the morphism property of inducing cohomology isomorphisms in every degree. Tensor products, direct sums, modules, Lie algebras and finite-dimensional primary decomposition use their native Mathlib carriers. The derived/pure results consumed below retain finite-dimensionality on their finite-stage inputs, rather than imposing it on the entire model degree.

### From Tau Ceti

At pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use `TauCeti.IsDGAlgebra` in `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182`, `TauCeti.DGAlgHom` in `TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean:50`, and `TauCeti.IsDGAlgebra.Cohomology` in `TauCeti/Algebra/Homology/DG/Algebra/Cohomology.lean:182`. The first records degree +1, square-zero and Leibniz laws on an internally ℤ-graded algebra; it does not impose nonnegative support or commutativity. Its cohomology is the quotient of cycles by boundaries. `TauCeti.algEquivCohomologyOfZero` in the latter module at line 257 identifies the native zero-differential algebra with that quotient, including its product.

The ordinary simplicial cochain complex is the composite of `SSet.chainComplex` with `ChainComplex.linearYonedaObj`, the same composite used to define `TopCat.singularCochainComplex` in `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60`. Its homology gives ordinary simplicial cohomology. `TopCat.singularCochainComplex` and `TopCat.singularCohomology` in `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60` and line 94, and `TopCat.singularCup` in `TauCeti/AlgebraicTopology/Cohomology/Cup.lean:203`, are the ordinary topological carriers used through AlgebraicTopology Stage 6. `TauCeti.Hodge.MixedHodgeStructure` in `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` records bounded rational weight and complex Hodge filtrations with pure graded pieces and explicit base-change models; it does not construct geometric cohomology or impose finite dimension. Geometric finite-dimensionality is required separately below.

### From TauCetiRoadmap.DGAInfinity

Layer 1 supplies DG algebras, morphisms, tensor products and cohomology with the +1 convention; use Mathlib’s categorical localization for quasi-isomorphisms. Layer 3 supplies the formality predicate and Layer 8 its Massey consequences; this roadmap supplies a commutative geometric quasi-isomorphism into cohomology. Layer 3’s transferred A∞ models are used only through their stated interfaces and are not definitions of Sullivan models.

### From TauCetiRoadmap.AlgebraicTopology

Stage 4, item 7 supplies the CW realization of a native simplicial set; Stage 6 supplies singular cohomology, coefficient exact sequences, the cup product and cellular comparison. Use these realization and cohomology comparisons with the pinned simplicial chain/cochain composite above, with arbitrary commutative coefficients. Stage 5 supplies finite-cover chain descent on its stated domain. The nerve theorem for open hypercovers with contractible pieces used here is the separate contract with ComplexComparisonPartII; no finite-cover descent theorem is used to infer contractibility of intersections.

### From TauCetiRoadmap.AlgebraicTopologyPartII

The following five contracts specify the generic rational-homotopy extension of AlgebraicTopologyPartII Layer 4. AlgebraicTopology Stage 6 supplies ordinary cohomology and Stage 5 finite-cover descent; neither supplies the Sullivan or polynomial-form interface.

What AlgebraicTopologyPartII must provide (gap:polynomial-forms-de-rham): For every simplicial set X and characteristic-zero field K, provide A_PL(Δʳ;K) as the polynomial/exterior algebra with Σxᵢ=1, Σdxᵢ=0 and d(xᵢ)=dxᵢ, and A_PL(X;K) as its degreewise compatible-family algebra, with equality detected by simplex evaluations, contravariant pullbacks and a natural multiplicative de Rham isomorphism H*(A_PL(X;K))≃H*(X,K); the simplex filtration counting both coordinates and differentials is preserved by d, faces and degeneracies, while the full compatible-family algebra permits unbounded simplexwise degrees (DGMS §2, Theorem 2.1, pp. 254–255; dgms line 448; Sullivan Theorem 7.1 and its polynomial-form example, pp. 296–299; sullivan line 1121).

What AlgebraicTopologyPartII must provide (gap:sullivan-minimal-models): Over every characteristic-zero field define positive-degree Sullivan algebras as free graded-commutative algebras with ordered Hirsch extensions, call them minimal when generator differentials are decomposable, identify their indecomposable quotient M⁺/(M⁺)² with zero induced differential in the minimal case, prove that a DG map out of a Hirsch extension is determined by its restriction to the base and generator images satisfying the differential equation, and give every connected nonnegative commutative DG algebra ordered full and 1-minimal model maps, respectively quasi-isomorphisms and H¹ isomorphisms with H² injections, without a nilpotence hypothesis on a realizing space (Morgan Definitions 5.1–5.3 and Theorem 5.6, pp. 163–166; morgan line 1017; morgan line 1064).

What AlgebraicTopologyPartII must provide (gap:sullivan-quasi-isomorphism-rigidity): For the Layer 4 rational-homotopy extension, every quasi-isomorphism between Sullivan minimal algebras over a characteristic-zero field is an algebra isomorphism (Morgan Proposition 5.9 and its degreewise application, p. 167; morgan line 1162).

What AlgebraicTopologyPartII must provide (gap:sullivan-homotopy-lifting): Over a characteristic-zero field define polynomial homotopies M→A⊗K[t,dt], d(t)=dt, with endpoint evaluations killing dt, and prove equal induced cohomology maps, constant paths, pre- and postcomposition, an equivalence relation for ordered positive-degree Sullivan sources with a single homotopy for transitivity, bijectivity [M,A]→[M,B] for every quasi-isomorphism A→B of nonnegative commutative DG algebras, and lifting of each automorphism of a connected target to a homotopy class of automorphisms of a chosen minimal model, without asserting a compatible choice of actual lifts (Morgan Proposition 5.5, Theorems 5.6–5.7 and the relative uniqueness argument, pp. 164–167; morgan line 1043; morgan line 1119; DGMS Theorem 1.2 and Corollaries 1.3–1.6, pp. 252–253; dgms line 331).

What AlgebraicTopologyPartII must provide (gap:sullivan-scalar-extension): For the Layer 4 rational-homotopy extension, extension of scalars K→L between characteristic-zero fields carries a full or 1-minimal map M→A to a full or 1-minimal map M⊗_K L→A⊗_K L (Morgan Definition 5.3, p. 163; morgan line 1036; flat field extension preserves its cohomology conditions).

### From TauCetiRoadmap.DerivedDeRhamCohomology

Section 2.21 supplies the strict graded-commutativity and odd-square-zero predicates on DGAInfinity Layer 1’s nonnegative unital cochain DG algebras and their DG morphisms, including odd-square-zero in characteristic 2. Layer 0 uses the same predicates on the native carrier.

### From TauCetiRoadmap.DerivedModuleAlgebra

Sections 0.DP.2–0.DP.3 supply homogeneous divided powers and their universal properties. Sections 0.14–0.17 supply alternating derived exterior powers and décalage, in particular L∧ⁿ(R[1])≃Γⁿ(R)[n] for the free rank-one module, naturally in R; this remains nonzero at n=2 over 𝔽₂. Sections 1.T.1 and 1.1 supply countable module towers, lim¹, the ML vanishing and Milnor/limit exactness sequences, naturally in tower maps. This roadmap verifies their module, cycle and boundary hypotheses for the relative-form tower. It does not infer exactness from finite cohomology without that verification.

### From TauCetiRoadmap.DiamondsAndVStacks

Section D0.13 imports the ordinary pro-category and its double-limit Hom formula from AdicSpacesPartII §R0.19.9 and supplies its bounded size interface. EtaleHomotopyTypes §EH.0 supplies the pro-space reindexing and universe comparisons. All pro-colimits below retain the fixed small-diagram conventions.

### From TauCetiRoadmap.AdicSpacesPartII

Section R0.19.9 supplies the ordinary pro-category on the native opposite-Ind carrier, small cofiltered presentations and the double-limit Hom formula, with its stage representatives and naturality. Use the universe bounds of that construction; EtaleHomotopyTypes §EH.0 supplies its pro-space specialization.

### From TauCetiRoadmap.EtaleHomotopyTypes

Use §EH.0’s small pro-space carriers, reindexing and “Local-coefficient detection” convention that cohomology is the filtered colimit of level cohomology, and §EH.3, “Rigid hypercovers of simplicial schemes”, “Rigid étale topological type” and “Cohomology of the rigid étale type”. The supplied étale pro-simplicial set computes finite constant étale cohomology, is compatible with maps, coefficients and common refinements, and carries the geometric point when specified. This roadmap applies forms to that raw rigid object and to the following finite-component presentation, and proves their localized commutative-algebra comparison; both presentations compute the same finite-coefficient cohomology.

What EtaleHomotopyTypes must provide (gap:finite-component-etale-presentation): For every separated finite-type scheme over a countable algebraically closed field k₁, provide a presentation E_fin=(π₀U^α)_(α∈ℕ) by connected components of a countable tower of étale hypercovers U^α of finite type in every simplicial degree (hence with finitely many components there), whose transition maps U^(α+1)→U^α are relative hypercovers, that is, each U^(α+1)_n→U^α_n×_(M_nU^α)M_nU^(α+1) is étale and surjective, with M_n the matching object, and a refinement pro-map Et_rig→E_fin inducing the ordinary finite-coefficient étale cohomology isomorphism for every invertible prime ℓ and r≥1, naturally in maps, coefficients and common fields of definition; for a descent to k₀ choose the presentation Galois-compatible, with finite Galois orbits of each truncated stage and finite-extension descent of its components and maps (Weil II §5.2.2–§5.2.3, pp. 238–239; weil-II line 3804; weil-II line 3823).

### From TauCetiRoadmap.EtaleCohomologyFoundations

Sections F.2.2 and F.3 supply geometric field-extension invariance and finite ordinary cohomology for separated finite-type schemes over algebraically closed fields with invertible finite coefficients. Sections F.4.1–F.4.6 supply compatible integral/rational realizations and continuous finite-level actions; §§F.0.3 and F.10.1–F.10.2b fix Tate twists and descent Frobenius. Use ordinary cohomology, not compact-support cohomology, in the form comparison. In particular on 𝔸¹, H⁰=Λ while H⁰_c=0 for nonzero Λ; on ℙ¹ geometric Frobenius has eigenvalues 1 and q in degrees 0 and 2.

### From TauCetiRoadmap.ComplexComparisonPartII

Sections C6.0–C6.1 supply separated complex finite-type topology, singular/sheaf comparison and finite CW homotopy type, including singular, noncompact and nonreduced schemes. Section C6.3 supplies finite-level Artin comparison and its product/coefficient naturality; §C6.6 supplies the integral/rational version on its coherent derived-limit domain. Section C5.5 supplies the logarithmic de Rham complex for SNC boundaries. Section C5.3 is consumed for geometric pure Hodge realization; MotivicEtaleKTheory’s contract below specifies its extension to the general mixed realization by proper smooth/SNC hyperresolutions and common refinements. This roadmap’s Layer 5 proves the Frobenius–Hodge identification using that input.

What ComplexComparisonPartII must provide (gap:compatible-good-cover-refinement): For every separated finite-type complex scheme X and every countable tower U^α of étale hypercovers of X whose transition maps are relative hypercovers (as in the finite-component contract above), supply a tower of open hypercovers V^α of X(C) in which every simplicial degree is a disjoint union of contractible open subsets of X(C), with simplicial maps V^α→U^α(C) over X(C) and V^(α+1)→V^α making each square with U^(α+1)(C)→U^α(C) commute strictly. The maps are built degree by degree: the analytified matching maps U_n(C)→M_nU(C) and the maps U^(α+1)_n(C)→U^α_n(C)×_(M_nU^α(C))M_nU^(α+1)(C) are surjective local homeomorphisms, so each piece of the matching object of the partial V can be covered by contractible opens carrying lifts; a degree-zero lift alone determines the map only when the target is a Čech nerve. Supply also, naturally in the tower, the zigzag of weak equivalences of simplicial sets π₀V^α←diag Sing(V^α)→Sing X(C), the left map because every piece is contractible and the right map by the hypercover form of the nerve theorem; no compactness, smoothness or finiteness of the open covers is required (Weil II §5.2.4, p. 239, for the Čech case with degree-zero lifts, and the hypercover remark in §5.2.2, p. 238; weil-II line 3835; weil-II line 3813; Dugger–Isaksen, Theorem 1.2; dugger-isaksen line 57).

### From TauCetiRoadmap.MotivicEtaleKTheory

Use §§3.1–3.2 for the smooth logarithmic Dolbeault algebra and its geometric filtered comparison for smooth separated finite-type complex varieties with a smooth proper SNC compactification. It identifies WₘHⁱ with the filtration induced from Wₘ₋ᵢ on the logarithmic complex, proves Hodge E₁ and weight E₂ degeneration, and compares refinements on derived global sections with the specified real F-filtered equivalence. No invariance of the unshifted residue filtration on complexes under a boundary blowup is imported. Layer 5 uses this smooth realization on the hyperresolution strata; the singular descent and common-refinement realization is the following extension of §§3.2 and 3.4.

What MotivicEtaleKTheory must provide (gap:geometric-mixed-hodge-realization): For every separated finite-type complex scheme, extend §§3.2 and 3.4’s smooth realization by proper smooth/SNC hyperresolution descent to a common-refinement-independent multiplicative mixed Hodge realization, with rational/complex filtered comparison, cup and Künneth compatibility, and WₘHⁱ induced by Wₘ₋ᵢ on the weight complex (Hodge III §§8.1.19–8.2.4, pp. 34–39; hodge-III line 1213).

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §0.9 for finite-presentation descent and arithmetic spreads, Layer 2 for sites and cohomological descent, and §§4.17 and 4.19 for SNC divisors and projective regular SNC alterations. These geometric interfaces retain their actual field and characteristic hypotheses. The mixed Hodge contract uses ResolutionOfSingularitiesCharacteristicZero for characteristic-zero resolution and principalization, EtaleCohomologyFoundations §§G.1–G.3 for proper compactifications and common refinements, and rational proper descent to construct its hyperresolutions; curve resolution alone is insufficient.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Sections 5.1–5.6 supply resolution and principalization preserving a smooth open and an initial boundary; §§6.1–6.4 supply projective SNC compactifications on their quasi-projective domain and SNC coordinates. For a general smooth separated finite-type stratum, apply resolution and boundary principalization to a proper compactification supplied by EtaleCohomologyFoundations §§G.1–G.3; projectivity is not inferred from properness. The hyperresolution construction belongs to MotivicEtaleKTheory’s geometric-mixed-hodge-realization contract.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Sections 0.1–0.3 and 0.7–0.18 supply the all-embeddings Weil-weight convention and finite-dimensional generalized-eigenspace rules, including products, inverses, tensor products and duals. Section 7.12 supplies compact-support bounds and hence the ordinary bounds for proper schemes; §7.14’s upper Newton triangle implies the smooth ordinary upper weight bound w≤2i, and §7.15 supplies proper smooth purity without a projectivity assumption. The ordinary bound for schemes that are neither smooth nor proper is requested separately below. Sections 8.20–8.24 supply potentially pure arithmetic models and SNC weight spectral sequences. The weight homomorphism takes q to 2 and q⁻¹ to −2, so the Frobenius example in the conventions has the same values in every realization.

What DeligneWeightsAndPurity must provide (gap:arbitrary-base-weight-filtration): For every separated finite-type scheme over an algebraically closed field with ℓ invertible, extend §§8.20–8.24 to the functorial finite weight filtration on ordinary ℚ_ℓ cohomology defined by suitable spreads, independent of spreads and common refinements and compatible with products and algebraically closed field extension (Weil II §5.3.6, p. 241; weil-II line 3938).

What DeligneWeightsAndPurity must provide (gap:ordinary-cohomology-weight-bounds): For every separated finite-type scheme X over an algebraically closed field k, every prime ℓ invertible in k and every i≥0, the spread-independent filtration on ordinary Hⁱ_ét(X,ℚ_ℓ) satisfies Gr_w^W Hⁱ=0 for w<0 or w>2i, including when X is neither smooth nor proper (Poids §7.1, p. 82; poids line 127; Weil II §5.3.6, p. 241; weil-II line 3938).

What DeligneWeightsAndPurity must provide (gap:normal-h1-weights): For every normal separated finite-type scheme over an algebraically closed field with ℓ invertible, extend §7.12 and §§8.20–8.24 to Gr_w^W H¹_(ét)(X,ℚ_ℓ)=0 for w outside {1,2}, for the spread-independent weight filtration (Poids §8.3, p. 82; poids line 152; Weil II §5.3.6, p. 241; weil-II line 3938).

### From TauCetiRoadmap.ReductiveGroups

Layers 5 and 6 supply unipotent groups, their characteristic-zero polynomial Lie correspondence and complete reducibility of rational torus representations. Layer 6A supplies finite-type characteristic-zero Levi complements and conjugacy over the base field, equivariant vector layers, rational algebraic cohomology vanishing and triviality of split-unipotent torsors. Consume these for the finite algebraic images of the weight-automorphism tower. Surjective transition maps and compatible sections/conjugators in its inverse limit remain §7.2’s theorem.

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

Sections 2.1–2.3 supply neutral tensor reconstruction, unipotent tensor categories, fibre functors, the pro-unipotent group and its lower-central and tensor-length towers, with their distinction retained. The geometric étale category in §2.2 is stated there for smooth characteristic-zero curves. The following contract supplies the general base needed for this roadmap’s comparison; it does not assume the 1-minimal comparison itself.

What AnabelianGeometryAndNonabelianChabauty must provide (gap:normal-variety-unipotent-category): Extend §§2.2–2.3’s pointed unipotent étale Tannakian category, finite-dimensional quotient towers and H¹/Ext¹ and H² obstruction interfaces to every connected normal separated finite-type variety over an algebraically closed field with ℓ invertible.

## How to read the build

Layer 0 uses the supplied commutative DG predicates and fixes connectedness and the supplied Sullivan interface. Layer 1 constructs relative simplex forms; Layer 2 proves their integral triangular cohomology theorem and rational stabilization using the supplied polynomial forms. Layer 3 takes the finite-coefficient pro-colimit, then completes bidegrees, rationalizes and stabilizes. Layer 4 realizes the algebra on varieties, compares its finite-component and raw rigid representatives, and proves complex comparison. Layer 5 identifies geometric weights; Layer 6 transports them through finite-type model filtrations and generalized eigenvalues. Layer 7 descends rational splittings and proves their conjugacy, including compatible pro-group lifting. Layer 8 proves the ℚ_ℓ geometric splitting, proper smooth formality and the pointed unipotent Lie comparison and presentation. The headline theorems of these layers, and the carriers needed to state them, are listed in the module docstring of Suggested.lean.

## Layer 0: Commutative refinement and Sullivan interfaces

### 0.1 Supplied commutative DG algebras and connectedness

For a commutative coefficient ring R, use DerivedDeRhamCohomology §2.21’s strict graded-commutativity and odd-square-zero predicates on the nonnegative native DG R-algebra carrier, with its degree +1 differential. Morphisms are the supplied DGAlgHom maps and quasi-isomorphisms induce isomorphisms on every cohomology module. For a characteristic-zero field K, connected means H⁰(A)=K, without requiring A⁰=K. The underlying graded algebra need not be an ordinary commutative ring. ([weil-II](#ref-weil-ii), §5 (5.1.2)–(5.1.3), p. 234, for the Koszul rule (weil-II line 3665), and (5.1.6.3), p. 235, for the exterior factor imposing odd squares zero (weil-II line 3710); [morgan](#ref-morgan), §5, definitions preceding Theorem 5.6, pp. 163–165 (morgan line 1024)).

The interface has the following laws.

- Forgetting the refinement returns the same grading and differential, hence exactly the native cohomology algebra.
- For x∈A^p and y∈A^q, xy=(-1)^(pq)yx.
- A homogeneous odd-degree element has square zero over every coefficient ring.
- Existing graded differential algebra homomorphisms give the morphisms; identities and composition retain their laws.
- Over a characteristic-zero field, graded commutativity implies the odd-square axiom.

Use the supplied predicates and their laws on the pinned internally graded algebra, and its cycles and boundaries quotient for cohomology. DGAInfinity supplies the DG carrier, morphisms, tensor products and cohomology. Form the full subcategory selected by the nonnegative commutative predicates, and apply Mathlib’s localization to the morphism property of inducing cohomology isomorphisms in every degree. Connectedness is the stated condition on H⁰ over K.

*Needs:* Tau Ceti `TauCeti.IsDGAlgebra`; Tau Ceti `TauCeti.DGAlgHom`; Tau Ceti `TauCeti.IsDGAlgebra.Cohomology`; DGAInfinity Layer 1; DerivedDeRhamCohomology §2.21; Mathlib `CategoryTheory.MorphismProperty.Localization` and `CategoryTheory.MorphismProperty.Q`.

**Checks.**

- Λ_R(e), |e|=1, d=0 satisfies e²=0 even over Z/2.
- 𝔽₂[e] with |e|=1 and d=0 is rejected because e²≠0.
- For Λ(a₁,b₁) with d=0, the native zero-differential equivalence sends ab to [ab]≠0; a comparison forgetting the product would not test this value.
- For a=0 in the zero algebra all three expressions d²a, a² and (−1)aa are zero; connectedness over a nonzero field still excludes that algebra.
- The identity of K induces 1 on H⁰, and a↦2a on Λ_K(a₁), da=0, induces 2 on H¹. Both maps are inverted in the localization since 1 and 2 are nonzero in K; the distinct H¹ scalars are retained by the cohomology functor.

### Examples

For the supplied interval, d(t)=dt and both endpoint values of dt are 0. A constant identity path has both endpoints identity. Maps Λ(e₁)→Λ(a₁) sending e to a and 2a induce distinct H¹ maps, hence cannot be homotopic. These distinguish the genuine interval from an algebra in which t is closed (Morgan Proposition 5.5; morgan line 1043).

For the supplied Sullivan models, Λ(a₁), da=0 has Betti ranks (1,1,0) in degrees 0,1,2. The even-sphere model K[x₂]⊗Λ(y₃), dy=x² has H*=K[x]/(x²); K[x₂] alone has the unwanted nonzero x² class. The free extension with v₂ preceding u₁ and du=v is Sullivan but not minimal, since its differential is linear. A 1-minimal map claims an H² injection, not an H² isomorphism. The supplied full-model theorem retains every connected target, including those with nonzero H¹; actual lift choices need not be unique (Morgan §5, pp. 163–169; morgan line 1017).

### Dependencies

Tau Ceti’s graded DG carrier and cohomology; DGAInfinity Layer 1; AlgebraicTopologyPartII Layer 4 with polynomial-forms-de-rham, sullivan-minimal-models, sullivan-quasi-isomorphism-rigidity, sullivan-homotopy-lifting and sullivan-scalar-extension for the models used in the examples. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 1: Relative divided-power simplex forms

### 1.1 The rank-one divided-power coordinate

Identify the rank-one Mathlib divided-power algebra Γ_ℤ(ℤ) with the integral lattice of finite polynomials Σaₙtⁿ/n! in ℚ[t], using γₙ=tⁿ/n! and t-degree n. Put R{t}=R⊗_ℤℤ{t}. The divided-power multiplication is the imported relation γₘγₙ=binom(m+n,m)γₘ₊ₙ; establish the concrete rank-one basis and scalar-extension comparison for this coordinate lattice. Over a ℚ-algebra the coordinate comparison identifies it with R[t], retaining the normalized basis. This target concerns the concrete lattice identification, not another universal divided-power algebra. R is a commutative ring; finite sums are used. ([weil-II](#ref-weil-ii), §5 (5.1.1), p. 234 (weil-II line 3662)).

The interface has the following laws.

- Γ_ℤ(ℤ) is isomorphic to the displayed concrete subring, taking dp n 1 to γ_n.
- The γ_n form a free ℤ-basis, transported to a free R-basis after scalar extension.
- γ_mγ_n=binom(m+n,m)γ_(m+n), agreeing with DividedPowerAlgebra.dp_mul.
- tγ_n=(n+1)γ_(n+1).
- For a ℚ-algebra the map γ_n↦t^n/n! gives R{t}≃R[t].
- Two R-algebra maps from R{t} agreeing on every γ_n are equal; γ_1 alone does not suffice over general R.

A proof can proceed as follows. Send the universal γ_n(1) to t^n/n! and prove the defining relations by binomial identities. Establish the rank-one free basis and injectivity into ℚ[t], then scalar extend this presentation. The comparison must preserve all divided-power generators, rather than only the first coordinate.

*Needs:* Mathlib `DividedPowerAlgebra`; Mathlib `DividedPowerAlgebra.dp`; Mathlib `DividedPowerAlgebra.dp_mul`; DerivedModuleAlgebra §0.DP.2.

**Checks.**

- γ₁²=2γ₂ in ℤ{t}; the coefficient is 2, not 1.
- In 𝔽₂{t}, γ₁²=0 while γ₂ is nonzero, so this is not 𝔽₂[t].
- Under ℚ{t}≃ℚ[t], γ₂ maps to t²/2 and γ₀ to 1.
- Into 𝔽₂[ε]/(ε²), the two algebra maps sending γ₁ to 0 and all γ_(2ʲ) with j≥2 to 0, but γ₂ respectively to 0 and ε, are distinct. Agreement on the first coordinate alone does not detect an integral divided-power algebra map.
- Over 𝔽₃, tγ₂=0 although γ₃≠0; the corresponding coefficient over ℤ is 3.
- Over the zero ring, γ₀ and γ₂ are both zero; retaining a nonzero integral basis element after scalar extension would give the wrong module.

### 1.2 The t-grading of relative forms

A t-graded commutative DG R{t}-algebra is a direct sum of modules Ω_n^p for p,n≥0, with differential Ω_n^p→Ω_n^(p+1), product Ω_n^p×Ω_m^q→Ω_(n+m)^(p+q), and γ_r of bidegree (0,r). Its total cochain degree is p. In the simplex-form objects require Ω_n^p=0 for p>n. The t-grading is distinct from the weight grading introduced on characteristic-zero minimal models. R is commutative; exterior degree is p and t-degree is n. ([weil-II](#ref-weil-ii), §5 (5.1.3)–(5.1.4.1), p. 234 (weil-II line 3668)).

The interface has the following laws.

- Expose the module Ω_n^p and its inclusion in the direct sum.
- The differential has bidegree (+1,0) and squares to zero.
- Multiplication adds both degrees and has the Koszul sign determined only by p,q.
- The R{t} action agrees with the divided-power coordinate presentation.
- Maps are equal if they agree on every bidegree inclusion.

A proof can proceed as follows. Use direct sums of the modules and graded algebra carrier. Differential raises p and fixes n. Define bidegreewise morphisms and limits before forming total direct sums; inverse limits do not create a completed product over t-degrees.

*Needs:* §0.1; §1.1.

**Checks.**

- x_i has bidegree (0,1) and dx_i has (1,1), so d cannot raise t-degree.
- On an edge over ℤ, Ω₀¹=0 while Ω₁¹=ℤ·dx₀ is nonzero; setting every positive exterior component to zero would fail this test.
- The finite sum γ₀+γ₂ is in the total direct sum; a family with nonzero components in every t-degree is not.

### 1.3 Relative divided-power forms on a simplex

For a finite nonempty set σ put L=R^σ and Q=L/R·(1,…,1). Define Ω(σ,R)=Γ_R(L)⊗_RΛ_R(Q). Its differential is the divided-power derivation dγ_r(x)=γ_(r−1)(x)·bar(x) for r≥1, with dγ₀(x)=0, extended by d(bar(x))=0 and the graded Leibniz rule. Give γ_r(x) t-degree r and bar(x) t-degree 1. Equivalently take divided-power polynomial forms on coordinates x_i and quotient by the differential ideal generated by dt=Σdx_i, where t=Σx_i. Do not quotient by t−1. Scalar extension is applied to simplex coefficients before any simplicial mapping object. σ is finite and nonempty; R is a commutative ring. The quotient L/R·diag is free, because one coordinate splits the diagonal inclusion. ([weil-II](#ref-weil-ii), §5 (5.1.6.1)–(5.1.6.3), p. 235 (weil-II line 3698)).

The interface has the following laws.

- The coordinate quotient by dt is isomorphic to Γ_R(L)⊗Λ_R(L/R·diag).
- For r≥1, dγ_r(x_i)=γ_(r−1)(x_i)dx_i; dγ₀=0.
- Σ_i dx_i=0 and the sum of coordinates is the unchanged divided-power t-coordinate.
- Ω(σ,Z)⊗R≃Ω(σ,R) as t-graded commutative DG algebras.
- The exterior factor uses Mathlib.ExteriorAlgebra, so every degree-one differential squares to zero.
- Two relative DG maps agreeing on all γ_r(x_i) and dx_i are equal; agreement on x_i alone is insufficient integrally.

A proof can proceed as follows. Use the divided-power and exterior algebra universal properties to define the derivation and the tensor product. Check the divided-power relations, d²=0 and the quotient by dt. Identify the integral construction followed by tensoring with the intrinsic R-construction. A monomial of exterior degree p has at least t-degree p; this proves the triangular support.

*Needs:* §1.2; Mathlib `DividedPowerAlgebra`; Mathlib `ExteriorAlgebra`.

**Checks.**

- For R=ℤ and σ={0}, dx₀=0 but x₀=t and the nonzero basis element γ₂(x₀) survives.
- On σ={0,1}, dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀.
- Imposing t=1 over Z would force 2γ₂=1; the actual form algebra imposes no such equation.
- For one vertex Ω(σ,R)=R{t} in cochain degree zero, not R.
- On the edge over 𝔽₂, dx₀²=0; replacing the exterior factor by the odd symmetric algebra would make this square nonzero.

### 1.4 Pullback of relative forms

For every map of finite nonempty sets φ:τ→σ there is a t-graded commutative DG pullback φ*:Ω(σ,R)→Ω(τ,R), sending x_i to Σ_(φ(j)=i)x_j and dx_i to the corresponding sum of dx_j. These maps preserve t, commute with coefficient change, and satisfy identity and contravariant composition laws. Restriction to ordinal maps gives a simplicial algebra, including all degeneracies. Finite nonempty σ,τ; no injectivity or surjectivity hypothesis on φ. ([weil-II](#ref-weil-ii), §5 (5.1.6.4), p. 236 (weil-II line 3720)).

A proof can proceed as follows. Pull back the coordinate module by summing over fibres and observe that the diagonal vector maps to the diagonal vector. Apply functoriality of Γ and Λ and check d on divided-power generators. Use the divided-power addition identity for a noninjective φ.

*Needs:* §1.3.

**Checks.**

- A face map sets omitted coordinates and their differentials to zero.
- For the collapse {0,1}→{0}, γ₂(x₀) pulls back to γ₂(x₀)+x₀x₁+γ₂(x₁), not just the sum of its two pure terms.
- For the identity set map, x₀↦x₀ and γ₂(x₀)↦γ₂(x₀); collapsing three vertices in either order gives γ₂(x₀+x₁+x₂)=Σγ₂(xᵢ)+Σ_(i<j)xᵢxⱼ.

### Examples

The one-vertex algebra is R{t}: dx₀=0, and over R=ℤ the nonzero basis element γ₂(x₀) survives. On an edge dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀. The collapse of an edge has γ₂(x₀+x₁)=γ₂(x₀)+x₀x₁+γ₂(x₁), retaining the mixed term. Over 𝔽₂, γ₁²=0 while γ₂ is a nonzero basis element. These values fix both integral normalization and contravariance (Weil II §§5.1.1, 5.1.6; weil-II line 3662).

### Dependencies

Layer 0; Mathlib divided-power and exterior algebras; DerivedModuleAlgebra §0.DP.2. The rank-one lattice and relative differential are constructed in this layer. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 2: Integral cohomology and rational stabilization

### 2.1 Divided-power forms on a simplicial set

For a simplicial set X define Ω_n^p(X,R)=Hom_sSet(X,UΩ_n^p(−,R)), where U forgets the module structure of the simplicial coefficient object. The group and R-module structures are pointwise. Put Ω(X,R)=⊕_(p,n)Ω_n^p(X,R), with pointwise product and differential. This is contravariant in X and covariant in R, with 0≤p≤n support. A family must respect faces and degeneracies. Tensor coefficients into each simplex-form module first: Ω(X,Z)⊗R is not used as the definition of Ω(X,R). X is any simplicial set; R is a commutative ring. ([weil-II](#ref-weil-ii), §5 (5.1.7)–(5.1.8), p. 236 (weil-II line 3740)).

The interface has the following laws.

- Evaluate a form on each simplex; the evaluations satisfy all face and degeneracy relations.
- Two forms are equal when all simplex evaluations in each bidegree agree.
- Simplicial maps induce contravariant DG maps, with identity and composition laws.
- Ring maps induce coefficient maps and commute with pullback and differential.
- Ω(Δ^r,R)≃Ω([r],R), with the same relative t-coordinate.

A proof can proceed as follows. Form the simplicial coefficient modules from simplex pullback, then the sets of simplicial maps into their underlying sets. Pointwise operations give modules and the product. Sum over bidegrees to retain finite t-support rather than silently taking a product.

*Needs:* §1.4; §1.2; Mathlib `SSet`.

**Checks.**

- For X=Δ⁰ obtain R{t} in degree zero, so this model is different from the ordinary de Rham complex of a point.
- For the empty simplicial set every mapping module is zero and the resulting algebra is the zero algebra.
- The value on a degenerate edge is the degeneracy pullback of its vertex value; independent edge data violate the definition.
- Evaluation on the identity simplex of Δ¹ recovers x₀,x₁ and dx₀=−dx₁, with x₀+x₁=t; imposing t=1 would recover a different algebra.
- On two edges sharing a vertex, the restrictions of their degree-zero forms to that vertex must agree; values 0 and γ₁ violate compatibility, while two values γ₁ agree.

### 2.2 Homotopy of the simplicial coefficient modules

For p,n,i≥0, the homology in degree i of the normalized chain complex of the simplicial R-module Ω_n^p(−,R) is R if i=p=n and is zero otherwise. The identification in the exceptional degree is natural in R. Here homology refers to the simplicial direction, not the cochain differential d of forms. This calculation is the coefficient resolution input to the integral cohomology comparison. R is a commutative ring. ([weil-II](#ref-weil-ii), §5 (5.1.9)(b), pp. 236–237 (weil-II line 3751)).

A proof can proceed as follows. Normalize σ↦R^σ; its chain complex is R→R with identity differential in degrees 1 and 0, hence contractible. Use an explicit simplicial contraction on its divided-power algebra. An arbitrary nonlinear functor preserving chain homotopy is not a sufficient substitute. The diagonal quotient is K(R,1); establish the exterior-power décalage calculation for this free rank-one object and combine the t-degrees. Use DerivedModuleAlgebra §0.17 for décalage; establish extendability and finite-skeleton determination for this coefficient object.

*Needs:* §1.3; §1.4; Mathlib `CategoryTheory.Abelian.DoldKan.equivalence`; DerivedModuleAlgebra §§0.14–0.17.

**Checks.**

- For p=n=0 the simplicial coefficient module is constant R with H₀=R.
- For (p,n)=(0,1) normalization is acyclic; for (1,1) it has H₁=R.
- Over the zero ring, even the exceptional homology groups at (p,n,i)=(0,0,0) and (1,1,1) are zero; a fixed nonzero coefficient group would fail.

### 2.3 The triangular integral cohomology comparison

For every simplicial set X and commutative ring R there is a natural multiplicative isomorphism H^p(Ω_n(X,R))≃H^p(X,R)·γ_n for n≥p, and H^p(Ω_n(X,R))=0 for n<p. Together these identify H*Ω with the triangular subalgebra ⊕_(0≤p≤n)H^p(X,R)γ_n of H*(X,R)⊗R{t}. Under it the product of classes aγ_n and bγ_m is binom(n+m,n)(a∪b)γ_(n+m). The target is ordinary simplicial cohomology with its cup product, not homotopy groups or the full untapered tensor algebra. X is arbitrary; no finite-dimensionality assumption. ([weil-II](#ref-weil-ii), §5 (5.1.4.2)–(5.1.5), p. 235; (5.1.9), pp. 236–237 (weil-II line 3682)).

A proof can proceed as follows. Use the normalized simplicial coefficient calculation to construct the natural cohomology comparison and prove its additive isomorphism. Establish the extension/acyclicity argument for compatible forms on successive skeleta, including passage to an infinite simplicial set; the extendability argument is part of this target. Check cup-product compatibility on universal simplicial cocycles, tracking the divided-power binomial coefficient. Use the pinned simplicial cochain composite and AlgebraicTopology Stage 4, item 7 and Stage 6 for realization and singular/cellular comparison.

*Needs:* §2.1; §2.2; Mathlib `SSet.chainComplex` and `ChainComplex.linearYonedaObj`; AlgebraicTopology Stage 4, item 7 and Stage 6; §1.1.

**Checks.**

- For the simplicial circle H¹Ω_n≃R for n≥1 and H¹Ω₀=0.
- For a two-torus, multiplying two independent degree-one classes in t-degree 1 gives 2(a∪b)γ₂; reduction mod 2 makes this product zero although H²(X,𝔽₂) is nonzero.
- For X empty both sides vanish in every bidegree, including degree zero; the unit is the unique zero element.

### 2.4 Quotient coefficients and the exceptional diagonal

For a principal ideal quotient B=R/(a) of a commutative ring, the natural map Ω_n^p(X,R)⊗_R B→Ω_n^p(X,B) is an isomorphism for n≠p. In the exceptional diagonal the complex has a right-exact sequence Ω_p^(p−1)(X,R)→Ω_p^p(X,R)→H^p(X,R)→0, natural in coefficients. In particular the coefficient transition maps at fixed (p,n), n≠p, are surjective. Do not assert the global base-change isomorphism on n=p or for arbitrary quotient ideals on infinite X: the infinite discrete-set counterexample below excludes the unrestricted assertion. X is a simplicial set; p,n≥0; B=R/(a), including ℤ→ℤ/ℓ^r and ℤ/ℓ^(r+1)→ℤ/ℓ^r. ([weil-II](#ref-weil-ii), §5 (5.1.5), last paragraph, p. 235; (5.2.1)(b), p. 237 (weil-II line 3694)).

A proof can proceed as follows. Prove the principal-quotient assertion from the extendable coefficient resolution; this principal-quotient assertion is part of the target. Keep coefficient products explicit: tensoring by an arbitrary quotient need not commute with them. On the diagonal d out of Ω_p^p vanishes by the degree bound, so the comparison identifies the stated cokernel. At p=0 the preceding term has exterior degree −1 and is zero; natural-number subtraction must not turn that index into 0. Apply right exactness of tensoring only where its hypotheses supply the required quotient, avoiding a tensor/Hom interchange.

*Needs:* §2.1; §2.3.

**Checks.**

- For a point in bidegree (0,1), reduction ℤ/4→ℤ/2 sends 3γ₁ to γ₁ and is surjective; this tests a genuine off-diagonal coefficient transition.
- At X=Δ⁰ the diagonal Ω₀⁰ is R; this special base-change isomorphism does not justify a general diagonal assertion.
- On an infinite discrete set and B=R/(a), the natural map (∏R)/a(∏R)→∏B is bijective: coordinatewise lifts give surjectivity and coordinatewise a-preimages give its kernel. The infinitely generated ideal example in the worked examples has a larger kernel.

### 2.5 Rational comparison after t-stabilization

There is a natural t-graded DG injection Ω(X,K)→A_PL(X;K)⊗K[t], sending x_i to t·x_i and dx_i to t·dx_i. Its t-degree n image is t^n times the forms whose total barycentric polynomial degree is at most n. Multiplication by t induces a natural quasi-isomorphism colim_n Ω_n(X,K)→A_PL(X;K). The first map is an isomorphism onto this bounded-degree subalgebra in each t-degree n; the whole target allows forms of higher barycentric degree. The stabilized map need not be surjective as an actual map of form sets for an infinite X with unbounded simplexwise polynomial degrees. K is a characteristic-zero field; the transition Ω_n→Ω_(n+1) is multiplication by t. ([weil-II](#ref-weil-ii), §5 (5.1.5), p. 235; (5.1.9)(a), p. 236; (5.2.5), p. 239 (weil-II line 3749)).

A proof can proceed as follows. Use the rational divided-power identification and homogenize barycentric forms by t. On cohomology tγ_n=(n+1)γ_(n+1); all transition scalars are invertible in K. Send the class aγₙ to a/n! to identify the eventual cohomology with H*(X,K). Use exactness of filtered module colimits and the polynomial de Rham theorem; no claim of a uniform degree bound on arbitrary compatible forms is required.

*Needs:* AlgebraicTopologyPartII Layer 4 through gap:polynomial-forms-de-rham; §2.3; §1.1.

**Checks.**

- For a point the degree-n comparison is an isomorphism K·γ_n→K·t^n sending γ_n to t^n/n!; non-surjectivity before stabilization is detected on an edge, not on a point.
- On an edge, t⁰x₁ in A_PL⊗K[t] is absent from the t-degree-zero image.
- On the disjoint union of edges indexed by N≥1, the degree-zero form restricting to x₁ᴺ on the Nth edge is in A_PL but in no uniformly bounded image; t-stabilization is not surjective on all forms.

### Examples

The supplied A_PL(Δ⁰;K) is K, while the relative point forms are K[t]. On Δ¹, the integral of dx₁ on the oriented interval from 0 to 1 is 1; dx₁=d(x₁) is exact, and the polynomial de Rham contraction gives H¹(Δ¹;K)=0. The expression x₁ᴺdx₁ has total polynomial degree N+1, counting dx₁. Uniform bounds across an infinite simplicial set cannot be deduced from finite-dimensional cohomology (Sullivan Theorem 7.1; sullivan line 1121).

For the simplicial circle H¹(Ωₙ)=R for n≥1 and H¹(Ω₀)=0. On the two-torus the product of independent degree-one classes in t-degree 1 is 2(a∪b)γ₂; it vanishes over 𝔽₂ although ordinary H² is nonzero. Rational normalization sends γ₂ to 1/2 after stabilization and recovers the cup product (Weil II §5.1.4.2; weil-II line 3682).

### Dependencies

Layer 1; Mathlib simplicial sets and Dold–Kan; the pinned simplicial cochain composite; AlgebraicTopology Stage 4, item 7 and Stage 6; AlgebraicTopologyPartII Layer 4 through gap:polynomial-forms-de-rham; DerivedModuleAlgebra §§0.14–0.17 for décalage. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 3: Pro-simplicial completion and the homotopy algebra

### 3.1 Finite-coefficient forms of a pro-simplicial set

Let X=(X_α) be a small cofiltered system of simplicial sets and ℓ a prime. Use EtaleHomotopyTypes §EH.0’s cohomology convention H^i(X,ℤ/ℓ^r)=colim_α H^i(X_α,ℤ/ℓ^r), for r≥1, and define Ω_n^p(X,ℤ/ℓ^r)=colim_α Ω_n^p(X_α,ℤ/ℓ^r), using the filtered direction induced by pullback. The integral triangular cohomology comparison persists through this filtered colimit. Morphisms of pro-objects induce contravariant maps independent of cofinal reindexing. A small cofiltered index category and a prime ℓ; r≥1. ([weil-II](#ref-weil-ii), §5 (5.2.1.1)–(5.2.1.2), p. 237 (weil-II line 3762)).

The interface has the following laws.

- Each stage has a natural map to the filtered colimit, compatible with transition maps.
- Cofinal reindexing induces isomorphisms in every bidegree and on finite-coefficient cohomology.
- Pro-morphisms induce maps opposite to the direction of spaces.
- Reduction r+1→r commutes with the α-colimit and the product.
- The triangular comparison is the colimit of the ordinary comparisons, with the same binomial factors.
- Compatible DG maps from the finite-coefficient stages determine a unique map from their filtered colimit, bidegree by bidegree.

A proof can proceed as follows. Take the filtered colimit separately in every bidegree and coefficient exponent, with its induced product. Use exactness of filtered module colimits for the cohomology comparison and the universal property for cofinal reindexing.

*Needs:* §2.1; §2.3; EtaleHomotopyTypes §EH.0, “Local-coefficient detection”; DiamondsAndVStacks §D0.13; AdicSpacesPartII §R0.19.9; Mathlib `SSet.chainComplex` and `ChainComplex.linearYonedaObj`; AlgebraicTopology Stage 4, item 7 and Stage 6.

**Checks.**

- For the map from two discrete points to one point, pullback on Ω_n⁰ is Rγₙ→R²γₙ, a↦(a,a). Over R=𝔽₃ it sends 1 to (1,1), not (0,0); a covariant summation map would have the opposite domain.
- On a constant point pro-object the colimit in bidegree (0,n) is Rγₙ; replacing the colimit by zero would lose this rank-one piece.
- The module control lim_r colim_N(ℤ/ℓʳ)^N contains the infinite-support sequence (ℓⁱ)ᵢ, while colim_N lim_r(ℤ/ℓʳ)^N contains only finite-support sequences; interchanging the two operations changes the object.

### 3.2 The mod-ℓ finiteness condition

The condition (F) on a pro-simplicial set at the prime ℓ says that H^i(X,ℤ/ℓ) is finite for every i≥0. It is degreewise finiteness and does not require a uniform bound on the number of nonzero degrees. Define H^i(X,ℤ_ℓ)=lim_r H^i(X,ℤ/ℓ^r) as a ℤ_ℓ-module, and H^i(X,ℚ_ℓ)=H^i(X,ℤ_ℓ)⊗_(ℤ_ℓ)ℚ_ℓ. These names alone do not assert finite generation or an interchange of inverse limit and cohomology. X is a small pro-simplicial set and ℓ is prime. ([weil-II](#ref-weil-ii), §5 (5.2.1), condition (F), (5.2.1.3) and (5.2.1.6), pp. 237–238 (weil-II line 3767)).

The interface has the following laws.

- For each i the finite group H^i(X,𝔽_ℓ) is available.
- The inverse limit has compatible reduction maps to every exponent.
- Rational cohomology is its tensor product with ℚ_ℓ.
- The condition is invariant under cofinal changes of the pro-system.
- A mod-ℓ cohomology equivalence transports (F), degree by degree.

A proof can proceed as follows. Use finite cardinality of each ordinary finite-coefficient cohomology module. Build the inverse-limit module and its scalar extension; derive their finiteness in the next theorem rather than adding it as a field.

*Needs:* §3.1.

**Checks.**

- A point has H⁰=𝔽_ℓ and all positive groups zero, so satisfies (F).
- The simplicial set of CP^∞ has one 𝔽_ℓ cohomology generator in each even degree and satisfies (F), although infinitely many degrees are nonzero.
- A countably infinite wedge of circles has infinite H¹(−,𝔽_ℓ) and fails (F).
- For the finite CW circle the mod-ℓ cohomology ranks are (1,1,0,…), giving finite cardinalities ℓ,ℓ,1,…; a requirement that all positive groups vanish would reject it.

### 3.3 Finite generation and ℓ-adic universal coefficients

Under (F), each H^i(X,ℤ/ℓ^r) is finite, H^i(X,ℤ_ℓ) is a finitely generated ℤ_ℓ-module, and for every r≥1 there is a natural short exact sequence 0→H^i(X,ℤ_ℓ)⊗ℤ/ℓ^r→H^i(X,ℤ/ℓ^r)→Tor₁^(ℤ_ℓ)(H^(i+1)(X,ℤ_ℓ),ℤ/ℓ^r)→0. In particular H^i(X,ℚ_ℓ) is finite-dimensional. Torsion in H^(i+1) cannot be dropped from the formula. (F) holds in every degree; ℓ is prime; X is a pro-simplicial set. ([weil-II](#ref-weil-ii), §5 (5.2.1), paragraph following (F), p. 237 (weil-II line 3769)).

A proof can proceed as follows. Use the coefficient exact sequences and (F) inductively to prove finiteness for all exponents. Prove bounded generation and completeness of the inverse limit by lifting a finite mod-ℓ generating set; control possible torsion through the Bockstein sequences. Derive the natural Tor exact sequence with degree i+1, not i. Use DerivedModuleAlgebra §1.T.1 and §1.1 for tower exactness and prove the bounded-generation argument for these pro-simplicial coefficients.

*Needs:* §3.2; §3.1; Mathlib `SSet.chainComplex` and `ChainComplex.linearYonedaObj`; AlgebraicTopology Stage 4, item 7 and Stage 6; DerivedModuleAlgebra §§1.T.1 and 1.1.

**Checks.**

- For CP∞ the ranks H²ʲ=1 and H²ʲ⁺¹=0 hold for every j, so (F) holds with infinitely many nonzero degrees; requiring a bounded total complex would reject this input.
- For the free two-term ℤ_ℓ complex ℤ_ℓ→ℤ_ℓ with differential ℓ, in degrees 1 and 2, H¹=0 and H²=ℤ/ℓ. After reduction modulo ℓ its H¹ is 𝔽_ℓ, supplied entirely by Tor₁(H²,𝔽_ℓ)=𝔽_ℓ.

### 3.4 Bidegreewise completion and its cohomology

For a pro-simplicial set satisfying (F), define Ω_n^p(X,ℤ_ℓ)=lim_r Ω_n^p(X,ℤ/ℓ^r), and then take the direct sum over (p,n) to get a t-graded commutative DG ℤ_ℓ{t}-algebra. Its cohomology in t-degree n is H^p(X,ℤ_ℓ)γ_n for p≤n and zero for p>n. The inverse-limit statement includes proof of exactness on the cycles and boundaries systems; finite cohomology alone is not permission to commute arbitrary limits. The mod-ℓ finiteness condition (F) holds; inverse limits are taken before total direct sums. ([weil-II](#ref-weil-ii), §5 (5.2.1.4)–(5.2.1.5), p. 237 (weil-II line 3774)).

The interface has the following laws.

- Each bidegree has compatible maps to its finite-coefficient levels.
- Multiplication is the inverse limit of finite-level products and adds bidegrees.
- The completed differential raises cochain degree, fixes t-degree and squares to zero.
- The comparison is the inverse limit of finite-coefficient comparisons, with explicit ML hypotheses discharged.
- Maps of pro-simplicial objects induce completed DG maps.
- A compatible family of bidegree-preserving DG maps into all finite-coefficient levels determines a unique map into the bidegreewise completion; equality is checked after every reduction.

A proof can proceed as follows. Off the diagonal the quotient-coefficient theorem makes the module transitions surjective. On n=p use the natural right-exact sequence from Ω_p^(p−1) to Ω_p^p to finite H^p; the boundary images are ML and the finite quotient is ML. Verify the module, cycle and boundary systems needed for the inverse-limit exactness theorem. Apply the countable ML exactness criterion to identify completed cohomology. Use DerivedModuleAlgebra §1.T.1 and §1.1 for this criterion and verify its hypotheses on these systems.

*Needs:* §3.1; §2.4; §3.3; Mathlib `CategoryTheory.Functor.IsMittagLeffler`; DerivedModuleAlgebra §§1.T.1 and 1.1.

**Checks.**

- For a point the t-degree n completed piece is ℤ_ℓγₙ and has no positive cohomology; replacing completion by reduction would give ℤ/ℓʳ instead.
- The sequence Σ_(n≥0)γ_n is not an element of the total completed algebra; only each bidegree has been completed.
- For the circle at (p,n)=(1,1) and coefficients ℤ/2, the cokernel of d is ℤ/2 with two elements; omitting it would incorrectly make d surjective.

### 3.5 The ℚ_ℓ homotopy algebra of a pro-simplicial set

For X satisfying (F), put A_ℓ(X)=colim_n (Ω_n(X,ℤ_ℓ)⊗_(ℤ_ℓ)ℚ_ℓ), where the map n→n+1 is multiplication by t. Products of components define a nonnegative commutative DG ℚ_ℓ-algebra and there is a natural ring isomorphism H*(A_ℓ(X))≃H*(X,ℚ_ℓ). The order is finite-coefficient α-colimit, bidegree r-inverse-limit, ℚ_ℓ scalar extension, then t-colimit. At cohomology level send aγ_n to a/n!; this normalizes the transition and product factors. (F); ℓ prime; small filtered and cofiltered systems as above. ([weil-II](#ref-weil-ii), §5 (5.2.1.6)–(5.2.1.8), p. 238 (weil-II line 3796)).

The interface has the following laws.

- Each rationalized t-degree has a map to A_ℓ compatible with t multiplication.
- Pro-simplicial maps induce contravariant commutative DG maps.
- H*(A_ℓ)≃H*(X,ℚ_ℓ) as graded rings, with γ_n normalized by 1/n!.
- Cofinal reindexing of the original pro-system does not change the algebra up to its canonical comparison.
- A finite-coefficient cohomology equivalence between systems satisfying (F) gives a quasi-isomorphism of A_ℓ.
- Chain maps from the rationalized t-degree complexes, compatible with multiplication by t and with products under addition of t-degrees, and sending the t-degree-zero unit to the unit, determine a unique DG map from A_ℓ.

A proof can proceed as follows. Rational scalar extension is flat, and filtered module colimits are exact. Apply these facts to the completed comparison. Check that t multiplication is compatible with the product at the directed-system level. Normalize γ_n by n! to remove (n+1) transition factors and binomial product factors.

*Needs:* §3.4; §2.5; §1.1.

**Checks.**

- For a point, [γ₀]=1 and the class of γ₂ at t-degree 2 represents 1/2 in ℚ_ℓ; sending every γₙ to 1 would fail at n=2.
- At n=ℓ−1, tγ_(ℓ−1)=ℓγ_ℓ; its coefficient ℓ is a nonunit in ℤ_ℓ, and stabilization uses its inverse in ℚ_ℓ.
- For n=2,m=3, the normalized product coefficient is binom(5,2)/5!=10/120=1/12=(1/2!)(1/3!); leaving the binomial coefficient 10 unnormalized would fail.

### Examples

The point has H⁰_ℤℓ=ℤ_ℓ, with completed n-piece ℤ_ℓγₙ. For ℓ=2 the transition from n=1 to 2 is multiplication by 2; rationalization gives γ₂ the normalized value 1/2 and identifies tγ₁ with the same scalar as γ₁. The zero ring at exponent zero supplies no substitute for any r≥1 stage. The infinite series Σγₙ has unbounded t-support and remains absent (Weil II §5.2.1; weil-II line 3774).

### Dependencies

Layer 2; EtaleHomotopyTypes §EH.0’s pro-cohomology convention; the pinned simplicial cochain composite; AlgebraicTopology Stage 4, item 7 and Stage 6 coefficient sequences; DerivedModuleAlgebra §§1.T.1 and 1.1 for countable tower exactness; native modules, filtered colimits and scalar extension. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 4: Étale realization and complex comparison

### 4.1 Étale realization of the homotopy algebra

For a separated finite-type scheme X over algebraically closed k with ℓ invertible, descend X to a model X₁ over a countable algebraically closed subfield k₁⊂k and take its supplied raw étale type Et(X₁). Write A_ℓ,rig(X) for §3.5’s homotopy algebra of that raw rigid pro-simplicial set. Let A_ℓ(X) be the image of A_ℓ,rig(X) in the localization of commutative DG algebras at quasi-isomorphisms. Finite-coefficient étale finiteness gives (F) for the raw presentation, and the supplied hypercover cohomology comparison and algebraically closed field-extension invariance give H*(A_ℓ(X))≃H*_ét(X,ℚ_ℓ) as rings. Common fields and common refinements compare all choices by quasi-isomorphisms. This is a contravariant functor into the localization of commutative DG algebras at quasi-isomorphisms. Apply connected minimal models to each connected component. X is separated and of finite type over algebraically closed k; ℓ≠char(k). ([weil-II](#ref-weil-ii), §5 (5.2.2), p. 238, including the final hypercover remark (weil-II line 3801)).

The interface has the following laws.

- Cohomology is ordinary étale ℚ_ℓ cohomology with its cup product.
- Refinements induce quasi-isomorphisms compatible with the étale cohomology identification.
- A common field-of-definition enlargement gives the same localized algebra.
- A morphism of varieties gives a contravariant localized DG morphism, respecting identities and composition.
- For connected X, H⁰(A_ℓ(X))=ℚ_ℓ, so the Sullivan existence theorem applies.

A proof can proceed as follows. Spread the finitely many defining equations to a countable subfield and take its algebraic closure inside k. Use EtaleHomotopyTypes §EH.3 and EtaleCohomologyFoundations §§F.2.2–F.3 for the étale hypercover, finiteness and algebraically closed extension inputs to identify the pro-simplicial cohomology. The proper-hypercover node is not sufficient for this étale assertion. For two fields or hypercover systems pass to a common countable overfield and common refinements. Use cohomology equivalences to obtain quasi-isomorphisms and functoriality in the localization.

*Needs:* §3.5; EtaleHomotopyTypes §EH.3; EtaleCohomologyFoundations §§F.2.2–F.3 and F.4.2–F.4.5; SchemeAndStackFoundations §0.9; §0.1; Mathlib `CategoryTheory.MorphismProperty.Localization` and `CategoryTheory.MorphismProperty.Q`.

**Checks.**

- For X=Spec(k), H⁰=ℚ_ℓ and H^i=0 for i>0.
- For a disjoint union of two geometric points, H⁰=ℚ_ℓ×ℚ_ℓ; a single connected minimal model must not be asserted.
- For an uncountable algebraically closed k, the countability used in the indexing belongs to k₁, not k; replacing k₁ by an arbitrary k invalidates that argument.
- For 𝔸¹ over 𝔽̄_p with ℓ=p, the Artin–Schreier classes of tᵐ for p∤m give infinite H¹; the finite-coefficient finiteness assertion would fail there.

### 4.1a Finite-component representative and comparison

For the countable field-of-definition model X₁ of §4.1, use EtaleHomotopyTypes §EH.3 through finite-component-etale-presentation to obtain E_fin and a refinement pro-map Et_rig(X₁)→E_fin. Define A_ℓ,fin(X)=A_ℓ(E_fin) and A_ℓ,rig(X)=A_ℓ(Et_rig(X₁)), using §3.5. Prove that the induced map A_ℓ,fin(X)→A_ℓ,rig(X) is a quasi-isomorphism respecting the ordinary étale cohomology ring, coefficients, common refinements and Galois descent data. Both presentations satisfy (F). Consequently A_ℓ,fin(X) is another representative of the localized object constructed in §4.1; either representative can be used in the weight and minimal-model theorems. X is separated finite type, k₁ is countable algebraically closed, and ℓ is invertible in k₁. This is the form-algebra comparison of two presentations, with the finite-component geometric presentation requested from its owner. (Weil II §5.2.2–§5.2.3, pp. 238–239; weil-II line 3804; weil-II line 3823.)

The interface has the following laws.

- The finite-coefficient pullback Ω_n^p(E_fin,ℤ/ℓʳ)→Ω_n^p(Et_rig,ℤ/ℓʳ) preserves products, differential and t, and induces the identity under the two étale cohomology identifications.
- After bidegreewise completion, rationalization and t-stabilization this pullback is a quasi-isomorphism A_ℓ,fin(X)→A_ℓ,rig(X).
- Galois-compatible descent makes the comparison equivariant as an algebra map; discreteness and continuity on finite-coefficient forms are asserted only for E_fin in §4.2.

A proof can proceed as follows. Use the supplied refinement pro-map and finite-coefficient comparison, then §2.3 and exactness of filtered colimits for the form cohomology comparison. Both presentations satisfy (F) by étale finiteness, so apply §3.4’s cycle and boundary limit argument to both, rationalize and apply §3.5. All maps retain the same source-to-target direction under these operations.

*Needs:* §3.1; §3.4; §3.5; EtaleHomotopyTypes §EH.3 through gap:finite-component-etale-presentation; EtaleCohomologyFoundations §§F.2.2–F.3 and F.4.2–F.4.5; SchemeAndStackFoundations §0.9.

**Checks.**

- For a geometric point the completed t-degree n cohomology is ℤ_ℓγₙ in both presentations; after stabilization both units are 1 and [γ₂] is 1/2. The comparison fixes these values rather than multiplying them by a scalar.
- For two geometric points both H⁰ rings have dimension 2, and the comparison preserves their two idempotents; collapsing the components would give dimension 1.
- A refinement Et_rig→E_fin induces forms in the opposite direction, A_ℓ,fin→A_ℓ,rig; the cohomology map on H⁰ of a point is 1, not a map to zero. For 𝔾_m the comparison gives an H¹ isomorphism of rank 1, rather than just an H⁰ comparison.

### 4.2 Galois action and its finite-level continuity

If X descends to a variety X₀ over a countable field k₀ and k₁ is its algebraic closure in k, the Galois-compatible finite-component presentation gives an action of Gal(k₁/k₀) on A_ℓ,fin(X) inducing the usual Galois action on H*_(ét)(X,ℚ_ℓ). At every fixed r the discrete action on Ω(E_fin,ℤ/ℓʳ) is continuous: every form has open stabilizer. On Ω(Et_rig,ℤ/ℓʳ) and A_ℓ,rig(X) assert the induced algebraic action and its equivariant cohomology comparison, without discrete continuity. No continuity of a chosen actual minimal-model action is concluded. The comparison A_ℓ,fin→A_ℓ,rig is the equivariant quasi-isomorphism of §4.1a. k₀ is countable; X₀ is separated finite type; ℓ invertible in k₀. ([weil-II](#ref-weil-ii), §5 (5.2.3), pp. 238–239, for the finite-type covering presentation of (5.2.2) (weil-II line 3804; weil-II line 3823; weil-II line 3831)).

A proof can proceed as follows. At fixed (p,n), prove that the simplicial coefficient object of §2.2 has finite skeletal width. A form at a finite-component stage is determined by its values on finitely many simplices in those degrees. The presentation contract gives a finite orbit of this truncated stage and finite-extension descent for its components and maps. Intersect the finitely many open stabilizers of these data and values; this subgroup fixes the form. A total form has finite bidegree support, so another finite intersection suffices. Transport actions through completion, scalar extension and stabilization as algebraic maps. For the raw rigid type no finite-component argument applies. Lift individual automorphisms of either representative to homotopy classes on a minimal model; these classes do not choose a group action by actual lifts.

*Needs:* §4.1a; §4.1; §2.2 finite-width coefficient argument; EtaleHomotopyTypes §EH.3 through gap:finite-component-etale-presentation; EtaleCohomologyFoundations §§F.4.6 and F.10.1–F.10.2b; AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models, gap:sullivan-homotopy-lifting and gap:sullivan-quasi-isomorphism-rigidity for individual model lifts.

**Checks.**

- On a geometric point the Galois action fixes 1∈H⁰=ℚ_ℓ and all positive groups are zero; the stabilizer is the entire group, of index 1.
- For a descended geometric two-point orbit, Frobenius swaps (1,0) and (0,1) in finite-coefficient forms of the finite-component presentation; their stabilizer has index 2.
- Over 𝔽₂ with ℓ=3, the raw rigid vertices of 𝔸¹ include one label for each geometric closed point. Select one point in each Frobenius orbit of length 2ʲ, j≥1, and take its indicator f. The compatible relative linear form on a simplex is Σᵢf(vᵢ)xᵢ. Its stabilizer is contained in ⋂ⱼ2ʲℤ̂, which is not open: for every N≥1, an orbit with j>v₂(N) has f(v)=1 and f(Fᴺv)=0. Rigid refinements preserve labels, so this counterexample persists in the raw colimit and is excluded from the continuity assertion.
- In a truncated finite-component stage with a Frobenius 2-cycle and 3-cycle, an indicator selecting one vertex in each cycle has stabilizer 2ℤ̂∩3ℤ̂=6ℤ̂, open of index 6. The infinite intersection in the preceding example has no finite-index subgroup; finite skeletal width alone does not give continuity.

### 4.3 The nerve-to-étale comparison from supplied good hypercovers

For a separated finite-type complex variety X with countable field-of-definition model X₁, let U^α be the tower of finite-type étale hypercovers underlying E_fin in §4.1a, base-changed to ℂ. Use the tower of open hypercovers V^α of X(C) with contractible pieces and the strictly compatible simplicial maps V^α→U^α(C) supplied by ComplexComparisonPartII’s compatible-good-cover-refinement contract. Their nerves N^α=π₀V^α define a morphism of towers N→E_fin, and the pullback Hⁱ(E_fin,ℤ/ℓʳ)→Hⁱ(N,ℤ/ℓʳ) agrees with §C6.3’s Artin comparison under the supplied zigzag N^α←diag Sing(V^α)→Sing X(C). Two choices of the analytic tower are compared through a third tower mapping to both, and induce the same map in cohomology. Complex algebraic X is separated finite type; ℓ is prime and r≥1. ([weil-II](#ref-weil-ii), §5 (5.2.4), p. 239, which treats the Čech case (weil-II line 3835); [dugger-isaksen](#ref-dugger-isaksen), Theorem 1.2 (dugger-isaksen line 57)).

A proof can proceed as follows. A component of V^α_n is connected, so it lands in one connected component of U^α_n(C); connected components of the finite-type scheme U^α_n over the algebraically closed field k₁ do not change under base change to ℂ or analytification, so V^α→U^α(C) induces π₀V^α→π₀U^α. The strict commutation of the supplied squares makes these maps a morphism of towers; faces and degeneracies are respected because V^α→U^α(C) is simplicial. The comparison with Et_rig is the separate refinement map of §4.1a. Identify the finite-coefficient cohomology map by ComplexComparisonPartII §C6.3, through the descent spectral sequence of the hypercover V^α, which degenerates because contractible pieces have no higher cohomology. Finite CW type is used for finite generation, without assuming that a noncompact open hypercover has finitely many pieces.

*Needs:* §4.1a; §4.1; ComplexComparisonPartII §§C6.0–C6.3 and compatible-good-cover-refinement; AlgebraicTopology Stages 5–6; EtaleHomotopyTypes §EH.3 through gap:finite-component-etale-presentation.

**Checks.**

- On 𝔾_m(C) let U be the 1-coskeletal hypercover with U_0=𝔾_m⊔𝔾_m and U_1 equal to U_0×U_0 except that the copy indexed by (first, second) is replaced by the connected double cover z↦z². Take the open hypercover given by the two-arc cover A∪B of the circle, with A↦first copy and B↦second copy. Over the two contractible components of A∩B there are 2·2=4 lifts to the double cover, and every other degree-one piece has a unique lift, so there are exactly 4 simplicial maps with this degree-zero part. For a Čech target the degree-zero lift determines the simplicial map uniquely; for this hypercover target it does not, so the degree-one lifts are part of the supplied data.

- The noncompact curve 𝔾_m(ℂ) has a circle model with H¹ rank 1; a proof restricted to compact analytic spaces would miss this input.
- For two arcs covering a circle with disconnected intersection, the ordinary nerve is an interval with H¹=0, while the connected-component Čech diagram has two edges and H¹ of rank 1, agreeing with the circle; the cover fails the good-cover condition.
- For two geometric points, the two-singleton good cover has a two-vertex nerve and H⁰=(ℤ/ℓʳ)²; collapsing its components to one vertex would give rank 1.

### 4.4 Complex comparison of minimal models

Let X be a connected separated finite-type complex variety and M_Q→A_PL(X(C);Q) a Sullivan minimal model, using a simplicial model of X(C). There is a zigzag of quasi-isomorphisms of commutative DG ℚ_ℓ-algebras from A_ℓ(X) to A_PL(X(C);Q)⊗ℚ_ℓ, inducing the usual cohomology comparison. Consequently M_Q⊗ℚ_ℓ is a minimal model of A_ℓ(X), and any chosen minimal model of A_ℓ(X) is isomorphic to it, compatibly with a natural homotopy class of comparisons. The resulting actual algebra isomorphism need not be canonical. X is connected; ℓ prime; étale–analytic comparison and finite CW type are available. ([weil-II](#ref-weil-ii), §5 Construction (5.2.5), p. 239 (weil-II line 3844)).

A proof can proceed as follows. Use Ω(E_fin,ℤ/ℓ^r)→Ω(N,ℤ/ℓ^r) and a chosen nerve stage to obtain bidegree quasi-isomorphisms. Apply the proved ML comparison to pass to ℤ_ℓ, then rationalize and stabilize in t. Justify the integral-to-ℤ_ℓ cohomology comparison by finite CW type, not by an unrestricted tensor/Hom identity. Compare the rational stabilized nerve algebra to A_PL of a nerve stage, then along the supplied zigzag N^α←diag Sing(V^α)→Sing X(C) to A_PL(Sing X(C);Q), each map inducing a cohomology isomorphism, and use §4.1a’s quasi-isomorphism to A_ℓ,rig. Pass to minimal models using the declared Layer 0 contracts.

*Needs:* §4.3; §4.1a; §3.4; §3.5; §2.5; AlgebraicTopologyPartII Layer 4 through gap:polynomial-forms-de-rham, gap:sullivan-minimal-models, gap:sullivan-homotopy-lifting, gap:sullivan-quasi-isomorphism-rigidity and gap:sullivan-scalar-extension; ComplexComparisonPartII §§C6.0, C6.3 and C6.6; AlgebraicTopology Stage 6.

**Checks.**

- For X=𝔾_m,C the model is Λ(a₁)⊗ℚ_ℓ, with one H¹ class.
- For a complex elliptic curve the model is Λ(a₁,b₁)⊗ℚ_ℓ; its two H¹ generators multiply to the H² generator.
- For two geometric points H⁰ has dimension 2, so the connected minimal-model assertion cannot apply; the algebra comparison still applies componentwise.

### Examples

For Spec k, the realized algebra is quasi-isomorphic to ℚ_ℓ and the Galois action on cohomology is trivial. Two geometric points have H⁰=ℚ_ℓ² and do not admit a single connected model. Over ℂ, 𝔾_m has model Λ(a₁), and a complex elliptic curve has model Λ(a₁,b₁); in the latter case ab is the nonzero top class. The countable field in the construction is k₁ even when k is uncountable (Weil II §§5.2.2–5.2.5; weil-II line 3801).

### Dependencies

Layers 2–3; SchemeAndStackFoundations §0.9; EtaleHomotopyTypes §EH.3 through gap:finite-component-etale-presentation; EtaleCohomologyFoundations §§F.2–F.4 and F.10.1–F.10.2b; ComplexComparisonPartII §§C6.0–C6.6 and compatible-good-cover-refinement; AlgebraicTopology Stages 5–6; AlgebraicTopologyPartII Layer 4 through the five contracts in Exact supplier contracts. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 5: Geometric cohomology and Frobenius weights

### 5.1 Geometric cohomology weight filtrations

Construct the geometric comparison bridge from the supplied mixed Hodge realization of every separated finite-type complex X and its rational/complex filtered comparison to the supplied étale weight realizations of suitable spreads. Identify the geometric cohomology’s increasing finite weight filtration with the SNC hyperresolution weight filtration, naturally under common refinements, cup product and Künneth. Use ordinary-cohomology-weight-bounds for the general range [0,2i] in degree i, §7.12 of DeligneWeightsAndPurity for the proper range [0,i], §§7.12 and 7.14 for the smooth range [i,2i], and normal-h1-weights for weights 1 and 2 in normal H¹. Over arbitrary algebraically closed bases the étale filtration is the spread-independent filtration of the exact weight supplier contract. The new target is the realization identification and its compatibility, not another abstract mixed Hodge structure or another proof of finite-field purity. X separated finite type; ℓ invertible for the étale realization. Geometric mixed Hodge realization and spread-independent weight comparison are the inputs isolated in the geometric-realization supplier contracts; the pinned abstract MixedHodgeStructure carrier alone does not construct them. ([hodge-III](#ref-hodge-iii), §6.2.8, pp. 20–21; §8.1.19–8.1.20, pp. 34–35; §8.2.2–8.2.4, pp. 38–39; §8.2.10–8.2.11, p. 40 (hodge-III line 582; hodge-III line 1213; hodge-III line 1279); [poids](#ref-poids), §8.3, p. 82; §12–§14, pp. 83–84 (poids line 127)).

A proof can proceed as follows. Use the geometric mixed Hodge realization supplier contract and its resolution and compactification input to obtain a proper hyperresolution with smooth proper compactifications and SNC boundaries; import the log de Rham sheaf from ComplexComparisonPartII §C5.5 and the smooth geometric mixed Hodge comparison from MotivicEtaleKTheory §3.2. The geometric Hodge supplier contract consists of a rational/complex mixed Hodge complex with the comparison, strictness and descent required by Hodge III 8.1.19–20. Its complex filtration index shifts on H^i: W_m H^i is induced from W_(m−i) on the weight complex. Over ℂ, use smooth proper strata and Tate twists in the hyperresolution weight spectral sequence to identify the two realizations; over an arbitrary algebraically closed base consume ordinary-cohomology-weight-bounds, without assuming a characteristic-zero resolution there. For normal H¹ use the normal-h1-weights supplier contract (Poids §8.3). The exact supplier contracts specify the geometric realization needed here.

*Needs:* MotivicEtaleKTheory §§3.1–3.2 and 3.4 with geometric-mixed-hodge-realization; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4; ComplexComparisonPartII §§C5.3 and C5.5; SchemeAndStackFoundations §§0.9, 4.17 and 4.19; EtaleCohomologyFoundations §§F.2–F.4; DeligneWeightsAndPurity §§7.12, 7.14–7.15 and 8.20–8.24 with arbitrary-base-weight-filtration, ordinary-cohomology-weight-bounds and normal-h1-weights; Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`.

**Checks.**

- For 𝔾_m, H¹ has weight 2; for an elliptic curve, H¹ has weight 1.
- A proper singular variety need not have pure cohomology; the nodal rational curve has weight-0 H¹, so the normality hypothesis in the H¹ bound is essential.
- Over 𝔽̄₂ with ℓ=3, let C be a split nodal proper rational curve and X=C×𝔾_m. X is singular and nonproper. Künneth gives H¹ weights {0,2} and H² two weight-2 lines, lying in [0,4]; either a smooth-only or a proper-only bound would miss this example.
- For the dual-number thickening of a geometric point the étale cohomology is unchanged: H⁰=ℚ_ℓ, Hⁱ=0 for i>0, and W₋₁H⁰=0, W₀H⁰=H⁰.

### 5.2 Geometric Frobenius splitting of Hodge weights

Let X be a complex variety defined over k₀ finitely generated over Q, and choose an integral finite-type Z-model with ℓ inverted. After shrinking that model, for every closed point s with residue cardinality q>1 and every geometric Frobenius lift σ at s, the eigenvalues of σ on H^i(X(C),Q)⊗ℚ_ℓ are algebraic integers that are Weil q-numbers, and the sum of their generalized eigenspaces of weights at most m is W_m H^i(X(C),Q)⊗ℚ_ℓ. Thus the Weil weight homomorphism used on the minimal model splits the scalar extension of the geometric Hodge weight filtration. The cohomological filtration is independent of s and σ; the splitting can depend on these choices. Finite-type separated complex X; k₀ finitely generated; ℓ invertible on the spread; geometric, not arithmetic, Frobenius. ([poids](#ref-poids), §13 and Théorème 14, pp. 83–84 (poids line 198); [weil-II](#ref-weil-ii), §5 (5.3.2)–(5.3.3), pp. 240–241 (weil-II line 3891)).

A proof can proceed as follows. Spread a common normal-crossing hyperresolution and all comparison maps over an open of a finitely generated integral Z-algebra. Apply the DeligneWeightsAndPurity §§7.12 and 7.15 purity theorem to smooth proper strata and track all Tate twists in the weight spectral sequence. Strictness and degeneration identify the resulting weight filtration on Betti and étale cohomology. Generalized eigenspaces distinguish weights even when Frobenius has nontrivial Jordan blocks.

*Needs:* §5.1; §4.4; §4.2; SchemeAndStackFoundations §0.9; EtaleCohomologyFoundations §§F.4.6 and F.10.1–F.10.2b; DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18, 7.15 and 8.20–8.24.

**Checks.**

- For geometric Frobenius on H²(ℙ¹), eigenvalue q has weight 2, fixing the dual/Tate convention.
- The opposite Frobenius convention gives q^(−1), which would have weight −2 and contradict the intended comparison.
- At q=2 and q=3 the H⁰⊕H² eigenvalues on ℙ¹ are (1,2) and (1,3); both spectra are integral and give total W₀ rank 1 and W₂ rank 2. The filtration agrees at the two closed points although the eigenvalues differ; inversion gives weight −2 and the nonintegral eigenvalues 1/2 and 1/3.

### Examples

At q=2, the Frobenius spectrum on H⁰⊕H² of ℙ¹ is (1,2); the weight filtration ranks are 1 at bound 0 and 2 at bound 2. The same example at q=3 gives (1,3) and the same filtration ranks. H¹ of 𝔾_m has weight 2; H¹ of an elliptic curve has weight 1. A nodal proper rational curve has a weight-zero H¹ graph class and fails normality (Poids §§7–8, 14; poids line 127).

### Dependencies

Layer 4; MotivicEtaleKTheory §§3.1–3.2 and 3.4 with geometric-mixed-hodge-realization; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4; ComplexComparisonPartII §§C5.3 and C5.5; SchemeAndStackFoundations §§0.9, 4.17 and 4.19; EtaleCohomologyFoundations §§F.2–F.4 and F.10.1–F.10.2b; DeligneWeightsAndPurity §§0.1–0.18, 7.12, 7.15 and 8.20–8.24 with arbitrary-base-weight-filtration and ordinary-cohomology-weight-bounds; Tau Ceti’s mixed Hodge structure carrier. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 6: Finite-type filtrations and model weights

### 6.1 Exhaustive finite-type filtrations of minimal models

An admissible filtration of a Sullivan minimal algebra M is an increasing sequence M₀⊂M₁⊂… of differential graded subalgebras, each generated by finitely many positive-degree elements, whose union is M. Stability under an automorphism means that it carries each M_n onto itself, not merely into it. Every cochain degree of each M_n is finite-dimensional, but a cochain degree of the union M may be infinite-dimensional. An automorphism preserving this filtration is locally finite on every degree of M. K is characteristic zero; M is a connected Sullivan minimal algebra with finite-dimensional H^i(M) for each i when existence is invoked. ([weil-II](#ref-weil-ii), §5 (5.3.1), first and second paragraphs, p. 240 (weil-II line 3867)).

The interface has the following laws.

- Every element of M belongs to some M_n.
- Each (M_n)^i is finite-dimensional over K.
- Stability means equality σ(M_n)=M_n for each n.
- A stable automorphism acts locally finitely on M^i for every i.
- Cofinal increasing reindexing preserves the admissible filtration and its stability.
- Filtrations with equal sub-DG-algebras at each index are equal; exhaustive and finite-type witnesses carry no additional choices.

A proof can proceed as follows. Represent subalgebras with inherited grading and differential; record finite positive generator sets and exhaustivity. For a fixed degree, finitely many positive-degree generators allow finitely many monomials, proving local finite-dimensionality and then local finiteness for stable automorphisms.

*Needs:* AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models.

**Checks.**

- For Λ(a₁,b₁) with d=0, the constant filtration by M is admissible.
- For K[x₂] with d=0, the degrees≤2 vector subspace is not a subalgebra because x² has degree 4.
- In K[x₂]⊗Λ(y₃), dy=x², the algebra generated by y alone is not a DG subalgebra; adjoining x fixes the defect.

### 6.2 Stable representatives of homotopy automorphisms

For a connected nonnegative commutative DG algebra A over a characteristic-zero field, with each H^i(A) finite-dimensional, a chosen minimal model M admits an admissible finite-type filtration such that every automorphism of M is homotopic to an automorphism preserving that filtration. In particular an automorphism of A can be lifted, up to homotopy, to a filtration-preserving automorphism of M. The filtration can be chosen so that, for every extension L/K of characteristic-zero fields, every automorphism of M⊗_K L is homotopic over L to an automorphism carrying each M_n⊗_K L onto itself. The same K-defined filtration is used for all L. This assertion does not say that the original automorphism preserves the chosen filtration. H⁰(A)=K; every H^i(A) finite-dimensional; K characteristic zero. ([weil-II](#ref-weil-ii), §5 (5.3.1), (5.3.3) and proof of (5.3.4), pp. 240–241 (weil-II line 3867; weil-II line 3909; weil-II line 3919); [morgan](#ref-morgan), §5, pp. 167–169 (morgan line 1166)).

A proof can proceed as follows. Construct a countable sequence of finite Hirsch-extension blocks, closing each block under the finitely many differential dependencies. Use the homotopy lifting/obstruction calculation to replace an arbitrary automorphism by one adapted to those blocks. For degree-one extensions and higher degrees verify that finite cohomology is sufficient for the finite-block choices. Choose the exhaustive blocks over K before adapting any automorphism. Prove the adaptation by induction for an arbitrary automorphism over L on these scalar-extended blocks: the finite-dimensional cycle, boundary and obstruction kernels and images commute with flat field extension, and the Hirsch lifting equations are linear in each new generator image. Thus the chosen blocks retain the stable-representative property over L without selecting a new filtration there. Finite-dimensionality of M^i is not an assumption.

*Needs:* AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models, gap:sullivan-homotopy-lifting and gap:sullivan-scalar-extension; §6.1.

**Checks.**

- For K[x₂]⊗Λ(y₃), dy=x², a finite block containing x and y contains their differential x²; a block containing y alone does not.
- For the three-punctured line, H¹ has dimension 2 and H²=0 but its free fundamental group is nonnilpotent and its degree-one Hirsch tower continues indefinitely; a finite degree-one generator-space assumption would exclude it.
- For Λ(a₁,b₁), d=0, the maps a↦a+b, b↦b and a↦a, b↦a+b both preserve the constant filtration, while their matrices do not commute.
- Take M=Λ_ℚ(a₁,b₁), d=0, with constant filtration and L=ℚ₇. For α²=2 with α≡3 mod 7, the L-automorphism a↦a, b↦b+αa preserves the extended filtration and sends [b] to [b]+α[a]. Its H¹ matrix has off-diagonal entry α∉ℚ, so the law must cover automorphisms not defined over ℚ.
- The filtration Λ(a₁)⊂Λ(a₁,b₁) is admissible but lacks the stable-representative property: the swap a↦b, b↦a cannot be homotopic to a map preserving its first stage, since [b]∉L·[a] in H¹. The scalar-extension assertion concerns the specially constructed filtration, not every admissible one.

### 6.3 Multiplicative generalized eigenvalue grading

Let σ be an automorphism of a minimal commutative DG K-algebra M preserving an admissible finite-type filtration. Over an algebraic closure Kbar set M(a)=union_(r≥1)ker((σ−a)^r) for a∈Kbar×, degreewise in M⊗Kbar. Then M⊗Kbar=⊕_a M(a), d preserves a, and M(a)M(b)⊂M(ab). These are generalized eigenspaces for a locally finite automorphism; neither semisimplicity nor finite-dimensionality of the whole degree of M is required. K characteristic zero; σ is invertible and preserves an admissible filtration. ([weil-II](#ref-weil-ii), §5 (5.3.1), second paragraph, p. 240 (weil-II line 3874)).

The interface has the following laws.

- Membership in M(a) means annihilation by a positive power of σ−a on some finite invariant piece.
- The inclusions induce a direct-sum equivalence to M⊗Kbar.
- Products of a and b components lie in the ab component.
- The differential preserves generalized eigenvalue.
- Restriction to each finite invariant piece is its ordinary primary decomposition; the construction agrees with DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18 generalized eigenspaces.
- Two generalized-eigenvalue decompositions with the same component subspaces for every nonzero eigenvalue agree.

A proof can proceed as follows. Restrict to finite-dimensional graded pieces of M_n and use primary decomposition over a splitting field. Show independence under inclusion of the finite pieces and take their union. For x,y in generalized eigenspaces use the tensor product spectrum to obtain the ab generalized eigenspace for xy. Commutation with d preserves the eigenvalue.

*Needs:* §6.1; §0.1; DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18.

**Checks.**

- An invertible σ has zero generalized eigenspace at 0; the grading indices lie in Kbar×.
- For the size-two eigenvalue-1 Jordan block, ker(σ−1) has dimension 1 and ker((σ−1)²) dimension 2; ordinary eigenvectors do not span.
- Closed generators with eigenvalues 2 and 3 have product eigenvalue 6, whereas 2+3=5; additive spectral indexing gives the wrong answer.

### 6.4 Eigenvalues of a minimal model come from cohomology

For M,σ as in the generalized-eigenvalue construction, every eigenvalue a on M^n⊗Kbar is a finite product ∏α_j of eigenvalues α_j on positive-degree cohomology H^(r_j)(M)⊗Kbar, with Σr_j≥n. The unit in degree zero uses the empty product. The inequality is in this direction because a generator that kills a cohomology relation in degree r may have degree r−1. Eigenvalues may be taken from the spherical cohomology quotients appearing in the Hirsch-extension induction. M is a connected Sullivan minimal model with finite-dimensional cohomology; σ respects an admissible filtration. ([weil-II](#ref-weil-ii), §5 (5.3.1), third paragraph, p. 240 (weil-II line 3879)).

A proof can proceed as follows. Induct along minimal Hirsch extensions: closed generators obtain eigenvalues from new cohomology; generators killing relations obtain eigenvalues from decomposable cocycles in the preceding algebra. Multiplicativity propagates product expressions to monomials. The differential raises degree without changing eigenvalue, giving Σr_j≥n. For possibly infinite degree-one towers make the induction compatible with the finite blocks constructed in §6.2.

*Needs:* §6.3; §6.2; AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models.

**Checks.**

- In the even-sphere model with σx=ax and dy=x², σy=a²y: its source cohomology degree sum is 4≥3.
- The pair du₁=v₂ can carry an arbitrary eigenvalue β although its positive cohomology vanishes; its linear differential violates minimality and excludes this false model-eigenvalue control.
- The degree-zero unit has eigenvalue 1 and uses the empty product with degree sum 0.

### 6.5 Integer weight gradings and their lower bounds

Let Γ⊂Kbar× contain all eigenvalues of σ on M and let v:Γ→Z be a group homomorphism. Coarsen the eigenvalue grading by M_w=⊕_(v(a)=w)M(a). This is a Z-weight grading with d of weight 0 and multiplicative weights. If v(α)≥0 on every positive-degree cohomology eigenvalue, all model weights are nonnegative. If v(α)≥i for eigenvalues on H^i, then M^n has only weights w≥n. If v extends to a Galois-invariant homomorphism on a Galois-stable subgroup, the grading descends to K. For K=ℚ_ℓ and q>1 a prime power, use the all-complex-embeddings Weil q-weight homomorphism on algebraic numbers, imported from DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18. σ is a filtration-preserving automorphism; v is defined on a group containing its spectrum. Descent requires the stated Galois invariance; choosing one complex embedding is insufficient. ([weil-II](#ref-weil-ii), §5 (5.3.1), last paragraph and (5.3.2), p. 240 (weil-II line 3883)).

The interface has the following laws.

- d maps M_w^n into M_w^(n+1).
- M_w^n·M_v^m⊂M_(w+v)^(n+m).
- The induced grading on H*(M) is the coarsening of its generalized eigenspaces by the same v.
- Cohomology weight≥degree implies M_w^n=0 for w<n.
- A Galois-invariant extension of v descends the grading to K; its scalar extension is the original grading.
- Two weight gradings are equal when their subspaces M_w^n agree for every cochain degree n and weight w.

A proof can proceed as follows. Sum generalized eigenspaces over equal values of v; directness follows from primary decomposition. Apply the eigenvalue-product theorem to prove both bounds. Galois invariance makes each weight subspace invariant under coefficient-field descent; descend the finite invariant pieces and take their union.

*Needs:* §6.3; §6.4; DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18.

**Checks.**

- A generalized Jordan block with Weil eigenvalue a is assigned the single weight v(a), including its generalized vectors.
- In K[x₂]⊗Λ(y₃), dy=x², weights 2 and 4 are compatible; weights 2 and 3 are rejected.
- For 𝔾_m, a degree-one generator of weight 2 is allowed; replacing all weights by cochain degree would give the wrong cohomological weight.
- On Λ(a₁,b₁), d=0, the automorphism σa=2a, σb=a+2b has a size-two Jordan block in H¹ of Weil 2-weight 2 and weight 4 on H². Weights exceed degree, but σ remains nonsemisimple.

### 6.6 A common filtration for finitely many automorphisms

For the minimal algebra M of a connected finite-cohomology commutative DG algebra over a characteristic-zero field, every finite set of actual automorphisms of M admits a single admissible finite-type filtration stable under each of them. The automorphisms are not required to generate a finite group. For two algebraic weight 𝔾_m-actions, choose such a filtration for their values at a scalar such as 2; local finiteness and Zariski density of its powers then show that the same filtration is graded for both actions. Characteristic zero; finite-dimensional H^i(M); finitely many automorphisms, not a finite generated group assumed finite. ([weil-II](#ref-weil-ii), §5 Lemme (5.3.5), p. 241 (weil-II line 3934)).

A proof can proceed as follows. Construct finite generator blocks closed under d and the indicated maps and their inverses, using minimal-extension obstructions to prevent an uncontrolled infinite orbit closure. Prove finite generation of each block and exhaustivity simultaneously; taking all iterates of a finite set without proving finite-dimensional span does not suffice. For a rational torus action each element has finite weight support; a finite-dimensional subspace invariant under the operator 2^w and its inverse is a sum of its weight spaces. The construction proves finite-dimensionality of each orbit span while adjoining its differential dependencies; this is the substantive block-construction argument of the target.

*Needs:* §6.1; §6.2; §6.5.

**Checks.**

- The two shears have AB=((2,1),(1,1)) and BA=((1,1),(1,2)); they are noncommuting yet preserve the same finite generating block {a,b}.
- For the shear A=((1,1),(0,1)), Aⁿ=((1,n),(0,1)) and A⁻¹=((1,−1),(0,1)); all preserve the finite generator space, although A has infinite order.
- On two weight lines with weights 1 and 2, the scalar 2 acts by diag(2,4). The line spanned by a+b maps to the line spanned by 2a+4b and is not invariant, while the whole two-dimensional space is graded.

### Examples

In the even-sphere algebra dy=x², σ(x)=ax forces σ(y)=a²y. The source cohomological degree sum for y is 4, exceeding its degree 3; weights (2,4) obey the differential law. The Jordan block ((1,1),(0,1)) has generalized eigenvalue-1 space of dimension 2 and ordinary eigenvalue-1 space of dimension 1. The two noncommuting shears of Λ(a₁,b₁) preserve its constant finite-type filtration, so common stability is not a finite-group averaging statement (Weil II §§5.3.1, 5.3.5; weil-II line 3867).

### Dependencies

Layer 0 and the supplied Sullivan model/homotopy interface; DeligneWeightsAndPurity §§0.1–0.18 for finite-dimensional primary decomposition and weights. Geometric Frobenius is an application after Layer 5, rather than an assumption in the general algebraic statements. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 7: Rational descent and conjugacy

### 7.1 Filtered automorphism schemes and the weight extension

Fix an admissible filtration of M over a characteristic-zero field K. Let G₁ be the inverse limit of the affine algebraic groups of DG automorphisms of M_n preserving all earlier M_j. Use restrictions and their scheme-theoretic images when needed. For a multiplicative cohomology filtration W finite on each H^i define G₂⊂G₁×𝔾_m by pairs (g,λ) preserving W and acting as λ^w on Gr_w^W H*(M). Write U=ker(G₂→𝔾_m). An algebraic section of G₂→𝔾_m is exactly a weight grading compatible with the fixed model filtration and splitting W on cohomology. M has finite-dimensional cohomology and a chosen admissible filtration. All cohomology constraints are imposed as the inverse limit of finite-dimensional algebraic equations. ([weil-II](#ref-weil-ii), §5 proof of Théorème (5.3.4), p. 241 (weil-II line 3919); [sullivan](#ref-sullivan), §6, Theorem 6.1 and proof, pp. 289–294 (sullivan line 912)).

The interface has the following laws.

- G₁ has compatible morphisms to finite filtered automorphism schemes.
- The second projection G₂→𝔾_m has kernel U.
- Algebraic sections correspond to compatible Z-gradings splitting W on cohomology.
- Finite-stage equations commute with the characteristic-zero field extensions used here, and the inverse limit is formed in affine group schemes; this is not an assertion that tensoring arbitrary underlying vector-space products commutes with field extension.
- U consists exactly of filtered model automorphisms inducing identity on Gr^W H*.
- Two points of the automorphism pro-group over any coefficient algebra are equal if their finite-stage restrictions agree; compatible stage points determine a unique limit point.

A proof can proceed as follows. Describe a map on each finite generating set by its images in the finite-dimensional same-degree spaces. Impose multiplication, differential and filtration equations; invertibility is the corresponding open determinant condition. Take finite filtered automorphism groups, not unrestricted Aut(M_n) whose restrictions might fail to preserve earlier stages. Impose the W and graded-scalar conditions on finite cohomology data and pass to the limit. The kernel is proved prounipotent in the next target, rather than assumed by definition.

*Needs:* §6.1; §6.5; ReductiveGroups Layer 5; ReductiveGroups Layer 6; DGAInfinity Layer 1.

**Checks.**

- For Λ(a₁) with a closed of weight 1, the compatible section is a↦λa and U is trivial.
- For M=Λ(a₁,b₁), d=0, M₀=Λ(a₁) and M₁=M, the swap a↦b,b↦a is a DG automorphism of M₁ but cannot restrict to an automorphism of M₀ because b∉M₀.
- At λ=2, weights 1 and 2 give scalar factors 2 and 4 on the two generator lines; swapping the weight sign would give 1/2 and 1/4.
- For closed degree-one a,b of weights 1,2, the shear b↦b+a fixes both associated graded lines but sends [b] to [b]+[a]≠[b].

### 7.2 Splitting and conjugacy for the weight extension

For the filtered minimal-model weight extension, U is prounipotent. If G₂→𝔾_m has a section after a field extension L/K, it is scheme-surjective over K. An extension 1→U→G₂→𝔾_m→1 over a characteristic-zero field with the compatible affine algebraic finite-stage structure used here has an algebraic section over K, and any two sections are U(K)-conjugate. The passage from finite-dimensional unipotent groups to the inverse limit includes a compatible-lifting argument; it is not justified by applying finite-dimensional Levi decomposition independently at every stage. K characteristic zero; the filtered automorphism tower and finite-stage image systems are as in the preceding target. ([weil-II](#ref-weil-ii), §5 proof of Théorème (5.3.4), p. 241 (weil-II line 3926); [sullivan](#ref-sullivan), Appendix, p. 295, including (A.1) (sullivan line 1042)).

A proof can proceed as follows. Use the triangular minimal-generator filtration to show that an automorphism acting trivially on Gr^W H* acts unipotently on every relevant finite stage. The kernel is a limit of these unipotent image groups. Use faithful flatness of L/K to descend scheme-surjectivity of the projection. Apply characteristic-zero reductivity of 𝔾_m and the unipotent torsor result to lift sections and their conjugators successively through finite-stage images. Prove the transition lifting and nonempty inverse-limit assertions. Use the base-field point lifting of ReductiveGroups Layer 6A at every transition, rather than choosing unrelated finite-stage splittings. Present the tower by its eventual algebraic image groups with faithfully flat transition maps and unipotent kernels. For each finite collection of constraints the image stabilizes inside the finite-type group; form the induced torsor of section lifts and the torsor of conjugator lifts. Prove their transition maps have nonempty K-point fibres using split-unipotent torsor triviality. Choose successively compatible points in this countable tower. This produces the algebraic pro-group section and a single element of U(K), not merely a section or conjugator in each finite quotient.

*Needs:* §7.1; §6.4; ReductiveGroups Layer 5; ReductiveGroups Layer 6; ReductiveGroups Layer 6A.

**Checks.**

- The formula s₁(λ)=(1−λ,λ) is algebraic and satisfies s₁(2)s₁(3)=s₁(6), with additive coordinate −5 on both sides; point-group multiplicativity alone would omit its algebraic dependence on λ.
- For G₂=𝔾_a⋊𝔾_m, (u,λ)(v,μ)=(u+λv,λμ), the sections s_c(λ)=(c(1−λ),λ) satisfy s_c(λ)s_c(μ)=s_c(λμ) and are conjugate to s₀ by (c,1). At λ=2 their additive coordinate is −c.

### 7.3 Rational weight gradings for complex varieties

For a connected separated finite-type complex variety X and a Sullivan rational minimal model M_Q of X(C), there is a Z-grading M_Q=⊕_w M_(Q,w) by commutative DG subspaces inducing the Hodge weight filtration on cohomology: W_m H^i(X(C),Q)=⊕_(w≤m)H^i(M_Q)_w. This is the complex-variety rational statement of Weil II 5.3.4, not a theorem stated only for varieties over a finite field. The upper index in the sum is m, the same filtration index on the left. X connected separated finite type over C; geometric mixed Hodge weight filtration supplied as in Layer 5. ([weil-II](#ref-weil-ii), §5 (5.3.3) and Théorème (5.3.4), pp. 240–241 (weil-II line 3916)).

A proof can proceed as follows. Choose a good Frobenius and lift it to a homotopy class on M_Q⊗ℚ_ℓ. Use §6.2’s scalar-extension law for the filtration (M_n) of M_Q chosen for §7.1 to obtain a representative preserving each M_n⊗ℚ_ℓ; apply the Weil-weight construction on these extended rational blocks and Layer 5. This gives a section of the weight extension after ℚ_ℓ scalar extension. Descend scheme-surjectivity and use the prounipotent splitting theorem over Q. Read the resulting 𝔾_m action as a rational grading and compare cohomology weight pieces.

*Needs:* §6.2; §6.5; §5.2; §7.1; §7.2.

**Checks.**

- For an elliptic curve, degree-one generators have weight 1 and their product has weight 2.
- For 𝔾_m,C the degree-one generator has weight 2, so the statement is not purity in cochain degree.
- On 𝔾_m, W₁H¹=0 and W₂H¹=H¹ of rank 1; on an elliptic curve W₀H¹=0 and W₁H¹=H¹ of rank 2.

### 7.4 Conjugacy of rational weight gradings

Any two rational weight gradings of M_Q inducing the geometric Hodge weight filtration on H*(X(C),Q) are conjugate by an automorphism of M_Q inducing identity on Gr^W H*(X(C),Q). Conjugacy means g(M_w)=M′_w for every w. The automorphism is not required to induce identity on H* itself, be homotopic to identity, or respect an arbitrarily preselected finite-type filtration. Here X is connected, separated and of finite type over ℂ, M_Q is its rational Sullivan model, and W is the geometric Hodge weight filtration. ([weil-II](#ref-weil-ii), §5 Théorème (5.3.4), proof and Lemme (5.3.5), p. 241 (weil-II line 3916)).

A proof can proceed as follows. Use the two 𝔾_m actions evaluated at 2 and Layer 6 common filtration to obtain a finite-type filtration graded for both. Encode the actions as two sections of a single weight extension. Conjugate the sections by U(Q) and translate to the subspace gradings. This uses the actual-automorphism theorem of §6.6 and the compatible conjugator theorem of §7.2.

*Needs:* §7.3; §6.6; §7.1; §7.2.

**Checks.**

- For closed degree-one generators a,b of weights 1,2, let g(a)=a and g(b)=b+a. It fixes both associated graded lines and conjugates the weight splitting (Ka,Kb) to (Ka,K(b+a)); [b] changes to [b]+[a], so g cannot be homotopic to identity.

### Examples

In 𝔾_a⋊𝔾_m with weight-one action, s_c(λ)=(c(1−λ),λ) is a section. Its product at λ=2, μ=3 has additive coordinate −5c, the same as s_c(6); conjugating s₀ by (c,1) gives s_c. At c=0 the section is the diagonal torus. This is the finite-dimensional normalization for the compatible tower argument, not a construction of a limit from unrelated stage choices (Sullivan Appendix A.1; sullivan line 1042; Weil II proof of 5.3.4; weil-II line 3926).

### Dependencies

Layers 5–6; ReductiveGroups Layers 5, 6 and 6A; DGAInfinity Layer 1. Finite-stage algebraic group theory is supplied; compatible sections and conjugators in the model tower are proved here. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Layer 8: ℓ-adic splitting, formality and fundamental groups

### 8.1 Weight gradings over arbitrary algebraically closed fields

Let X be a connected separated finite-type variety over any algebraically closed field k, with ℓ invertible in k. A Sullivan minimal ℚ_ℓ-model M of A_ℓ(X) admits integer weight gradings inducing on H*(M)=H*_(ét)(X,ℚ_ℓ) a splitting of the spread-independent cohomological weight filtration obtained from Frobenius on a sufficiently small arithmetic spread. Over a finite field of definition geometric Frobenius directly supplies the grading through a stable minimal representative. For general k the comparison uses spreads and common refinements. This theorem asserts existence of a grading over ℚ_ℓ; it does not assert a rational Q-model of X or a functorial choice of splitting. X connected, separated finite type; k algebraically closed; ℓ≠char(k). ([weil-II](#ref-weil-ii), §5 (5.3.2) and (5.3.6), pp. 240–241 (weil-II line 3938)).

A proof can proceed as follows. Descend X to a finitely generated field and spread the cohomological weight comparison of Layer 5; verify independence of the cohomological filtration using the geometric-realization supplier contracts. After the required shrinking choose a closed point and a geometric Frobenius lift, and lift that automorphism to a stable minimal-model representative. Apply the Galois-invariant Weil weight homomorphism and its field descent. No descent from ℚ_ℓ to Q is used in this case.

*Needs:* §4.1; §4.2; §5.1; §6.2; §6.5; DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.18; DeligneWeightsAndPurity §§7.12, 7.15 and 8.20–8.24.

**Checks.**

- For ℙ¹ minus three rational points over 𝔽_q, the geometric H¹ has two weight-2 generators.
- Over 𝔽̄₂ with ℓ=3 the two H¹ eigenvalues on the three-punctured line are 2 and 2, yielding a ℚ₃ grading of weight 2; this does not construct complex points or a rational Betti model of that variety.

### 8.2 Formality of proper smooth varieties

For a connected proper smooth variety X over an algebraically closed field k with ℓ invertible in k, a Sullivan minimal model M of A_ℓ(X) admits a commutative DG quasi-isomorphism M→(H*_(ét)(X,ℚ_ℓ),d=0). Thus the same M is a minimal model of the zero-differential cohomology algebra. In a weight grading with M_w^n=0 for w<n and pure weight n on H^n, the map in degree n projects to M_n^n and then takes its cohomology class, killing weights w>n. This is a multiplicative chain map and a cohomology isomorphism. Assume that X is connected, proper and smooth, that ℓ is invertible in k and that the model has finite cohomology in every degree. ([weil-II](#ref-weil-ii), §5 Corollaire (5.3.7) and proof, p. 242 (weil-II line 3947); [dgms](#ref-dgms), §6, Main Theorem and first proof, pp. 270–271 (dgms line 1060)).

A proof can proceed as follows. Use DeligneWeightsAndPurity §§7.12 and 7.15 purity for proper smooth X, including nonprojective X; the smooth-projective result alone is insufficient. The weight-n part of M^n consists of cycles since d lands in M_n^(n+1)=0. For the chain-map condition, the image of a differential is a boundary and hence has zero cohomology class even when its weight equals the target degree. The bound and multiplicativity give compatibility with products. Purity makes the induced map on cohomology an isomorphism. Import the generic formality predicate and its Massey consequences from DGAInfinity.

*Needs:* §8.1; §6.5; AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models; DGAInfinity Layers 3 and 8; DeligneWeightsAndPurity §§7.12, 7.15 and 8.20–8.24.

**Checks.**

- A proper smooth genus≥1 curve is formal; for an elliptic curve the explicit model is Λ(a₁,b₁), d=0.
- On 𝔾_m the closed H¹ generator has weight 2 rather than degree 1, so degree-diagonal projection sends it to 0 and fails to induce an H¹ isomorphism.
- For ℙ¹ the model has dy=x²≠0. The diagonal map sends x to [x], y to 0 and dy to [x²]=0; hence it is a chain map and H* is ℚ_ℓ[x]/(x²).

### 8.3 The Lie tower dual to a 1-minimal model

For a nonnegative connected commutative DG K-algebra A with finite-dimensional H¹, construct a 1-minimal map M^(1)→A as an increasing union of finite degree-one Hirsch extensions, giving an H¹ isomorphism and an H² injection. If V_n is the finite-dimensional generator space of a finite stage, define the bracket on V_n∨ by the negative transpose of d:V_n→Λ²V_n under (a∧b)(u,v)=a(u)b(v)−a(v)b(u). Thus dφ(u,v)=−φ([u,v]); d²=0 gives Jacobi. These finite nilpotent Lie algebras and their surjective transition maps form a pronilpotent tower. A compatible integer grading on M^(1) dualizes with opposite signs on the Lie tower. K characteristic zero; H⁰(A)=K; H¹ finite-dimensional. The tower is indexed by finite 1-minimal Hirsch stages; it is not obtained by dualizing an arbitrary infinite vector space without a topology. ([morgan](#ref-morgan), §5, pp. 168–169; §9, Theorem 9.4 and proof, pp. 198–199 (morgan line 1175; morgan line 2245); [poids](#ref-poids), §10, p. 83 (poids line 164)).

The interface has the following laws.

- Every finite Hirsch stage gives a finite-dimensional nilpotent Lie algebra.
- The bracket is the negative transpose of d on degree-one generators in the stated Chevalley–Eilenberg convention, with Jacobi equivalent to d²=0.
- An inclusion of Hirsch stages dualizes to a surjective Lie morphism.
- The map to A is an H¹ isomorphism and H² injection, the exact conditions used in the relation theorem.
- Weight-w generators dualize to Lie weight −w, with additive bracket weights.

A proof can proceed as follows. Adjoin H¹ generators, then degree-one generators killing the H² kernel. Each finite degree-one stage has finite-dimensional H², so the kernel of its map to H²(A) is finite-dimensional even when H²(A) is infinite-dimensional. Adjoining generators for this kernel preserves finite stages. Use the Lie algebra carrier and the negative transpose of the quadratic differential at each finite stage. Compare this tower with the supplier’s unipotent fundamental group; the comparison is a separate target, not part of the definition.

*Needs:* AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models; Mathlib Lie algebras and finite-dimensional linear duals; §6.5 only when a geometric model weight grading is used.

**Checks.**

- For Λ(a₁), da=0, the Lie tower is the one-dimensional abelian Lie algebra.
- For Λ(a₁,b₁), d=0, the tower is abelian of dimension two; [a∨,b∨]=0, so it is not the free Lie algebra.
- For ℙ¹ minus three points the completion is free pronilpotent on two weight −2 generators; higher Hirsch generators encode its nonabelian brackets.
- The sign reversal turns cohomological weights 1,2 into Lie generator weights −1,−2.
- At the stage Λ(a₁,b₁,c₁), da=db=0, dc=ab, the dual basis A,B,C has [A,B]=−C and [A,C]=[B,C]=0. Therefore dc(A,B)=1=−c([A,B]); using the positive transpose would give −1 in this convention. Weights (2,2,4) dualize to (−2,−2,−4).
- For ℙ¹ the 1-minimal model is K, with H²=0 injecting into H²(ℙ¹)=K; its full minimal model has H²=K. Replacing the injection by an isomorphism would fail.
- For the square-zero DG algebra A=K⊕⊕_(j≥0)Ke_j, with |e_j|=2 and d=0, H¹=0 and H²=⊕_(j≥0)Ke_j is infinite-dimensional. Its 1-minimal map is K→A: H¹ is 0→0 and H² is the injection 0→⊕_(j≥0)Ke_j; every Lie stage is zero. Requiring finite-dimensional H²(A) would reject this valid input.

### 8.3a Minimal presentations of the dual Lie tower

Let K, A, the 1-minimal map M^(1)→A and the pronilpotent tower u=(u_n) be as in §8.3, and put V=H¹(M^(1))^∨≃H¹(A)^∨, a finite-dimensional space. Let F̂(V)=lim_k L(V)/Γ_kL(V) be the lower-central completion of the free Lie algebra on V. Choose a linear map V→lim_n u_n lifting the identification of V with the common abelianization of the u_n; it extends to a compatible system of surjections F̂(V)→u_n, and their kernels form a closed ideal I of F̂(V) contained in the closure of [F̂(V),F̂(V)]. Prove the following presentation duality. First, H²(M^(1)) is isomorphic to the continuous dual of I/cl[F̂(V),I], the colimit over k of the duals of its images in F̂(V)/Γ_k, naturally in the choice of lift; here H²(M^(1)) is the filtered colimit of the Chevalley–Eilenberg H² of the finite stages u_n, because each finite stage Λ(V_n) of §8.3 is the Chevalley–Eilenberg cochain algebra of u_n=V_n^∨. Second, every subspace R⊆I whose image is dense in I/cl[F̂(V),I] generates I as a closed ideal. Third, suppose M^(1) carries a weight grading preserved by d and multiplication, with every degree-one element of positive weight and finite-dimensional weight pieces in degree one. Then the tower, V, F̂(V) and I are graded with negative Lie weights, each weight piece of L(V) is finite-dimensional, the lower central and weight filtrations of L(V) are cofinal, the duality sends cohomological weight w to Lie weight −w, and any homogeneous R⊂L(V) mapping isomorphically onto I/cl[F̂(V),I] gives u≃(L(V)/(R))^∧, the lower-central completion. When H²(M^(1)) is finite-dimensional, R is finite-dimensional. K has characteristic zero; H⁰(A)=K; H¹(A) is finite-dimensional. ([morgan](#ref-morgan), Theorem 9.4, proof, p. 199, for the duality between H² of the Lie tower and the ideal generators in negative weights (morgan line 2270); [poids](#ref-poids), §10, p. 83 (poids line 164)).

The interface has the following laws.

- The isomorphism with the continuous dual of I/cl[F̂(V),I] is compatible with the transition maps of the tower and with changing the chosen lift V→lim_n u_n.
- A subspace of I whose image is dense in I/cl[F̂(V),I] generates I as a closed ideal; a subspace with non-dense image does not.
- In the graded case a relation of Lie weight −w corresponds to a class of cohomological weight w in H²(M^(1)), and relations lie in weights ≤−2 because I lies in the closure of the brackets.
- The degree-two part of a finite stage Λ(V_n) is the space of alternating two-cochains on u_n, and the differential on degree one is the Chevalley–Eilenberg coboundary of §8.3’s sign convention.

A proof can proceed as follows. At each finite stage apply the five-term inflation–restriction sequence of the extension 0→I_n→F(V)/Γ_k→u_n→0 for k large, with trivial coefficients K: the abelianizations of the free nilpotent quotient and of u_n agree, H² of the free Lie algebra vanishes, and the u_n-invariants of H¹(I_n) are the dual of I_n/[F(V)/Γ_k,I_n]. Pass to the colimit over n and k. For generation, a closed ideal J⊆I with J+cl[F̂(V),I]=I equals I by successive approximation along I∩Γ_k, each quotient being finite-dimensional. In the graded case use induction on the Lie weight, which is bounded on each finite-dimensional weight piece, and the bound |weight| ≥ bracket length together with the bound on generator weights for cofinality.

*Needs:* §8.3; Mathlib `FreeLieAlgebra` and `LieModule.lowerCentralSeries`; Mathlib `LieModule.Cohomology.twoCocycle` and `LieModule.Cohomology.d₁₂` in `Mathlib/Algebra/Lie/Cochain.lean` for low-degree Chevalley–Eilenberg cochains (the pinned file has no cohomology quotient); §6.5 only when a geometric model weight grading is used.

**Checks.**

- For Λ(a₁,b₁), d=0, u is abelian of dimension 2, I=cl[F̂,F̂] and cl[F̂,I] is the closure of Γ₃, so I/cl[F̂,I] is spanned by [A,B] and has dimension 1=dim H²(Λ(a,b)), the class ab. With a,b of weight 1 the relation has Lie weight −2 and ab has weight 2.
- For the Heisenberg stage Λ(a₁,b₁,c₁), dc=ab, H² is spanned by ac and bc: all of ab, ac, bc are closed since a²=b²=0, and ab=dc is exact. The kernel I is Γ₃, and Γ₃/Γ₄ has the basis [A,[A,B]], [B,[A,B]]: dimension 2 on both sides. With weights a,b↦1 and c↦2 the classes ac, bc have weight 3 and the relations Lie weight −3.
- For the 1-minimal model of ℙ¹ minus three points H²(M^(1))=0, so I=0 and u is free pronilpotent on two generators.
- Replacing I/cl[F̂,I] by the abelianized relation module I/cl[I,I] fails on Λ(a₁,b₁): there I/cl[I,I] already contains the independent classes [A,B], [A,[A,B]], [B,[A,B]] in weights −2 and −3, since [I,I] lies in weights ≤−4, while H² has dimension 1.
- Dropping minimality fails: presenting the abelian K² by the free algebra on A,B,D with D↦0 puts D in I outside cl[F̂,F̂], and I/cl[F̂,I] has dimension 2 (classes of D and [A,B]) against dim H²=1.

### 8.4 Comparison with the unipotent étale fundamental group

For a geometrically pointed connected normal variety (X,x) over an algebraically closed field with ℓ invertible, the pronilpotent Lie tower from the 1-minimal model of A_ℓ(X) identifies with the Lie algebras of the finite-dimensional unipotent ℚ_ℓ-quotients of the continuous étale fundamental-group representation category. Here the geometric group is the unipotent Tannakian fundamental group supplied by AnabelianGeometryAndNonabelianChabauty §§2.1–2.3; the maximal profinite étale fundamental group is not identified with its unipotent completion. Pointed maps give the comparison, and forgetting the basepoint gives the usual ambiguity by inner automorphisms. X normal, separated finite type and connected; geometric basepoint x; ℓ invertible. ([weil-II](#ref-weil-ii), §5 (5.3.8), p. 242 (weil-II line 3956); [poids](#ref-poids), §10, p. 83 (poids line 164); [sullivan](#ref-sullivan), §8, Theorem 8.1(ii), p. 301 (sullivan line 1289)).

A proof can proceed as follows. Compare the algebraic finite-stage extension category of the degree-one minimal model with successive extensions of the trivial continuous ℚ_ℓ étale local system. No flat-connection realization on a singular or positive-characteristic variety is assumed. At each finite unipotence depth match extension H¹ and obstruction H² through the étale cohomology comparison. Check basepoint fiber functors, bracket and transition maps. The general normal-variety Tannakian supplier contract and this target together establish the comparison beyond smooth curves.

*Needs:* §8.3; §4.1; AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 and its general normal-variety supplier contract.

**Checks.**

- For the three-punctured line, depth one has two abelian generators and dimension 2=dim H¹; the depth-two quotient has dimension 3 and is not the abelianization.
- The finite groups C₂ and S₃ have orders 2 and 6 but trivial characteristic-zero unipotent completions: a finite-order unipotent matrix is identity, since log(1+N) would be killed by a nonzero integer in characteristic zero. Replacing completion by the full finite group would give the wrong order.

### 8.5 Weight-bounded presentations for normal varieties

Let X be a connected normal separated finite-type variety over an algebraically closed field k, with geometric basepoint x and ℓ invertible in k. The Lie algebra u_ℓ(X,x) of its unipotent étale fundamental group is isomorphic to the lower-central completion of a graded Lie algebra L(V)/(R), where V≃H¹_(ét)(X,ℚ_ℓ)∨ has weights −1 and −2, L(V) is the free graded Lie algebra, and the homogeneous ideal is generated by a finite-dimensional relation space R supported in weights −2,−3,−4. The choices of generators and presentation are noncanonical. Its finite unipotent quotients are obtained by the compatible nilpotent/lower-central truncations; one must also include the nilpotence cutoff when presenting a finite quotient. X connected normal separated finite type; k algebraically closed; ℓ≠char(k). Use the weight filtration on cohomology and the 1-minimal étale comparison of Layer 8. ([weil-II](#ref-weil-ii), §5 (5.3.8), p. 242 (weil-II line 3956); [poids](#ref-poids), §10, p. 83, using §8.3, p. 82 (poids line 164); [morgan](#ref-morgan), Theorem 9.4 and proof, pp. 198–199 (morgan line 2245); [morgan-correction](#ref-morgan-correction), p. 185, revised Theorem 9.2 and final paragraph (morgan-correction line 29)).

A proof can proceed as follows. Restrict §8.1’s weight grading of a minimal model M of A_ℓ(X) to the subalgebra generated by M¹, which is a 1-minimal model; normality gives H¹ weights 1 and 2, so dual generators have weights −1 and −2, and every degree-one generator has positive weight by §6.5. The weight pieces of M¹ are finite-dimensional by induction on w: the kernel of d on M¹ is H¹, and d maps M¹_w into the weight-w part of Λ²(M¹_(<w)), so dim M¹_w ≤ dim H¹_w + dim Λ²(M¹_(<w))_w. Apply §8.3a: the relation space R is dual to H²(M^(1)) with weights reversed, and generates the kernel of the completed presentation as a closed ideal. The 1-minimal H² injection makes H²(M^(1)) a weight-graded subspace of H²(X,ℚ_ℓ), so R is a quotient of H²(X,ℚ_ℓ)∨ and is finite-dimensional. The ordinary-cohomology-weight-bounds supplier contract in degree 2 puts the weights of H² in [0,4], hence those of R in [−4,0]. Relations lie in the closure of the brackets, hence have weight≤−2. Intersecting the two bounds leaves exactly −2,−3,−4. Transport the presentation to u_ℓ(X,x) through §8.4.

*Needs:* §8.3; §8.3a; §8.4; §5.1; §8.1; §6.5; DeligneWeightsAndPurity §§7.12–7.14 and 8.24 through gap:ordinary-cohomology-weight-bounds; AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 and its general normal-variety supplier contract.

**Checks.**

- For ℙ¹ minus three points V has two weight −2 generators and R=0: all finite nilpotent free quotients occur.
- For a proper smooth elliptic curve V has two weight −1 generators and the relation [a,b]=0 of weight −2, giving an abelian Lie algebra.
- A proper nodal rational curve is not normal and has H¹ of weight 0; it is excluded from the negative-generator-weight statement.
- For genus g≥1, a proper smooth curve has 2g generators of weight −1 and a one-dimensional weight −2 relation space generated by Σ[aᵢ,bᵢ]; at g=1 this forces the two-dimensional abelian Lie algebra. At g=0 both generator and relation spaces are zero.

### Examples

For ℙ¹−{0,1,∞}, H¹=ℚ_ℓ(−1)², H²=0. Closed a,b have weight 2; adjoining c of degree 1 with dc=ab and weight 4 kills the unwanted H² class and continues to the free pronilpotent Lie algebra on two weight −2 generators. For an elliptic curve the two weight −1 Lie generators satisfy [a,b]=0. The proper smooth ℙ¹ model dy=x² is formal although its minimal differential is nonzero (Poids §10; poids line 164; Weil II §5.3.7; weil-II line 3947).

### Dependencies

Layers 4–7; AlgebraicTopologyPartII Layer 4 through gap:sullivan-minimal-models; DeligneWeightsAndPurity §§7.12, 7.14–7.15 and 8.20–8.24 with arbitrary-base-weight-filtration, ordinary-cohomology-weight-bounds and normal-h1-weights; DGAInfinity Layers 3 and 8; AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 with normal-variety-unipotent-category. The purely algebraic construction of §8.3 only uses the subset stated in its Needs line. Each target’s Needs line distinguishes its statement inputs from the inputs of the proposed route.

## Downstream consumers

The ordinary and completed form comparisons supply commutative models to arithmetic and geometric homotopy applications. Nonabelian applications consume the unipotent Lie comparison with H¹ generators, H² obstructions and the precise relation-weight range. Rational-homotopy applications consume the complex geometric instances and the supplied generic Sullivan theory. A consumer uses the model only in the localization or through the stated comparison; a chosen weight splitting is not functorial.

## Worked examples across the interfaces

**Circle and two-torus.** The simplicial circle has the rational minimal model
Λ(a₁), da=0. As an algebraic test one can give a weight 1 to a, but an abstract
circle has no preferred arithmetic weight. Its occurrence as the homotopy
type of 𝔾_m carries weight 2 on H¹. The topological two-torus realized by a
complex elliptic curve has Λ(a₁,b₁), d=0, weights 1 on a,b and weight 2 on ab.
This is the proper smooth weight-diagonal example. The algebraic torus
(𝔾_m)² also has this exterior rational model but weights 2 on H¹ and 4 on
H². These are distinct geometric weight assignments on the same rational
topological algebra; assigning every torus weight 1 in H¹ would fail the
comparison theorem. The cohomology calculations use ordinary circle/torus
cohomology from AlgebraicTopology stage 6 and Hodge III 8.2.4, pp. 38–39,
together with the 𝔾_m logarithmic calculation.

In the integral divided-power model of the two-torus, independent H¹ classes
aγ₁ and bγ₁ multiply to 2abγ₂. Over 𝔽₂ this product vanishes even though the
ordinary class ab in H² is nonzero. After rational stabilization γ_n represents
1/n!, so the product comparison becomes exactly the ordinary cup product.
This checks the distinction between the triangular integral ring and the
final rational homotopy algebra (Weil II 5.1.4.2, p. 235, and 5.2.1.7–8,
p. 238).

**Three punctures.** For X=ℙ¹−{0,1,∞} over 𝔽_q and ℓ not dividing q,
H¹(X_bar,ℚ_ℓ)=ℚ_ℓ(−1)² and H²=0. The first Hirsch stage consists of two
closed degree-one generators a,b of weight 2. It is not the whole minimal
model: Λ(a,b) has the unwanted class ab in H². Add a degree-one c with
dc=ab and weight 4, then continue the degree-one Hirsch construction. Its
dual Lie algebra is the free pronilpotent Lie algebra on two generators of
weight −2. There are no defining geometric relations, although every finite
nilpotent quotient imposes its bracket-length cutoff. This uses ordinary
punctured-curve cohomology from SchemeAndStackFoundations Layer 2 and the relation argument of Poids §10,
p. 83, not a claim that the first two generators constitute a finite minimal
algebra.

**Proper smooth curves.** A genus-g proper smooth curve has pure weight 1 in
H¹ and pure weight 2 in H², so the formality target applies. For g=1 the
exterior algebra above is already the minimal model. For g>1, the exterior
algebra on 2g degree-one generators has too many degree-two classes, so
additional minimal generators and nonzero differentials are necessary. Formal
means that this minimal algebra maps by a quasi-isomorphism to the cohomology
ring with zero differential. It does not mean that the differential on the
minimal algebra vanishes. The unipotent Lie presentation has 2g weight −1
generators and the single weight −2 symplectic relation
Σ_i[a_i,b_i]=0. The input is SchemeAndStackFoundations Layer 2 curve cohomology and the cup pairing; the
presentation mechanism is Morgan Theorem 9.4, pp. 198–199, and Poids §10,
p. 83.

**The projective line.** A minimal model is ℚ_ℓ[x₂]⊗Λ(y₃), dy=x²,
with weights 2 and 4. The formal quasi-isomorphism sends x to the H² class
and y to zero. This checks that a nonzero minimal differential can coexist
with formality, that weight exceeds degree on y, and that the direction of
the eigenvalue-product inequality is correct. It is the basic model obtained
by the Hirsch construction of Morgan §5, pp. 163–167.

**Why normality matters.** A proper nodal rational curve has a loop in its
dual graph and weight-0 H¹. It is not normal. Applying the normal-variety
negative-generator-weight presentation to it would therefore give the wrong
weight bound. Normality, rather than smoothness, is the hypothesis used to
exclude weight 0 from H¹ (Poids §8.3, p. 82); singular normal varieties remain
within the presentation theorem.


The examples use the integral product and stabilization normalization of Weil II §§5.1.4.2 and 5.2.1.7–8 (weil-II line 3682; weil-II line 3798), the curve weight calculations of Hodge III §8.2.4 (hodge-III line 1213), and the normal presentation of Poids §10 (poids line 164).

**Infinite discrete coefficients.** For the infinite discrete simplicial set ℕ, Ω₁⁰(ℕ,R)=∏ᵢR·γ₁. Take R=ℚ[x₁,x₂,…], I=(x₁,x₂,…). The sequence (xᵢ) maps to zero in ∏ᵢ(R/I) but is not in I(∏ᵢR): any finite expression uses only finitely many elements of I, involving finitely many variables, and its ideal cannot contain every xᵢ. Thus (∏R)/I(∏R)→∏(R/I) is not injective. For a principal ideal (a), coordinatewise preimages show its kernel is precisely a(∏R), so the corresponding discrete-set map is an isomorphism. The general principal-quotient target in §2.4 still requires its extendable coefficient-resolution proof. This explains the precise coefficient scope of the correction to Weil II §5.1.5, p. 235 (weil-II line 3694).

## References

Locators refer to the published versions and to the line-numbered extractions identified by the source keys below. The mathematical statements above are specifications in the author’s words. Miller’s full integral proof and SGA 5’s universal-coefficient argument are supporting references, while Layers 2 and 3 state the complete proof obligations rather than assuming that the presence of a cited reference closes them.

### Ref: weil-II

- **weil-II** — Pierre Deligne, [La conjecture de Weil : II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Published, Publications mathématiques de l’IHÉS 52 (1980), 137–252. §5, pp. 234–242, entire; bibliography pp. 250–252.

### Ref: sullivan

- **sullivan** — Dennis Sullivan, [Infinitesimal computations in topology](https://numdam.org/item/PMIHES_1977__47__269_0.pdf), Published, Publications mathématiques de l’IHÉS 47 (1977), 269–331. §§2–3, pp. 279–285; §5, pp. 287–289; §6, pp. 289–294; Appendix, pp. 294–296; §7, pp. 296–300; Theorem 8.1, p. 301.

### Ref: morgan

- **morgan** — John W. Morgan, [The algebraic topology of smooth algebraic varieties](https://www.numdam.org/item/PMIHES_1978__48__137_0.pdf), Published, Publications mathématiques de l’IHÉS 48 (1978), 137–204. Introduction, pp. 137–141; §5, pp. 163–169; §9, Theorem 9.2 and preceding rigidity argument, p. 195; Theorem 9.4 and proof, pp. 198–199.

### Ref: morgan-correction

- **morgan-correction** — John W. Morgan, [Correction to: The algebraic topology of smooth algebraic varieties](https://www.numdam.org/item/PMIHES_1986__64__185_0.pdf), Published, Publications mathématiques de l’IHÉS 64 (1986), 185. Entire correction, p. 185.

### Ref: dgms

- **dgms** — Pierre Deligne, Phillip Griffiths, John Morgan and Dennis Sullivan, [Real homotopy theory of Kähler manifolds](https://publications.ias.edu/sites/default/files/realhomotopytheory.pdf), Published, Inventiones mathematicae 29 (1975), 245–274; IAS-hosted scan. §1, pp. 248–253; §2, pp. 254–255; §6, Main Theorem and first proof, pp. 270–271.

### Ref: poids

- **poids** — Pierre Deligne, [Poids dans la cohomologie des variétés algébriques](https://publications.ias.edu/sites/default/files/29_Poidsdansla.pdf), ICM Vancouver 1974, Proceedings vol. 1 (1975), 79–85; IAS-hosted scan. §§1–17, pp. 79–84; bibliography p. 85; in particular §8.3 p. 82, §10 p. 83, §§12–14 pp. 83–84; read from page images.

### Ref: dugger-isaksen

- **dugger-isaksen** — Daniel Dugger and Daniel C. Isaksen, [Topological hypercovers and A¹-realizations](https://arxiv.org/abs/math/0111287), Mathematische Zeitschrift 246 (2004), 667–689; arXiv version v1 read, numbering as cited there. Theorem 1.2, p. 2, for the weak equivalence from the homotopy colimit of an open hypercover to the space.

### Ref: hodge-III

- **hodge-III** — Pierre Deligne, [Théorie de Hodge : III](https://www.numdam.org/item/PMIHES_1974__44__5_0.pdf), Published, Publications mathématiques de l’IHÉS 44 (1974), 5–77. §6.2.4–6.2.8, pp. 19–21; §6.4, pp. 22–23; §8.1.1–8.1.20, pp. 28–35, including Theorem 8.1.15, pp. 32–33; §8.2.1–8.2.4, pp. 38–39; §8.2.10–8.2.11, p. 40.

- **miller** — Edward Y. Miller, *De Rham cohomology with arbitrary coefficients*, Topology 17 (1978), 193–203; supporting proof reference for §2.2–§2.4, cited by Weil II §5.1.9 (weil-II line 3747); uncertified, cited by locator.

- **sga5** — Alexander Grothendieck and collaborators, edited by Luc Illusie, [Cohomologie ℓ-adique et fonctions L (SGA 5)](https://link.springer.com/book/10.1007/BFb0096802), Lecture Notes in Mathematics 589 (1977), Exposé V, §5.3.1; supporting reference for §3.3, as cited by Weil II §5.2.1 (weil-II line 3769); uncertified, cited by locator.

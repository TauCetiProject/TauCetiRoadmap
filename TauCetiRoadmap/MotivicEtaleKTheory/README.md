# Roadmap: motivic cycle comparisons and real Deligne regulators

**Summary.** Build the integral cubical and mixed realizations of the shared higher-cycle theory, identify its rational higher Chern character on actual scheme K-groups, and construct its real Deligne–Beilinson regulator. The logarithmic Dolbeault theory includes arbitrary twists, products, compactification independence, singular closed supports and semipurity. The end theorems identify the universal regulator with the independently normalized Beilinson character and prove integral-source multiplicativity. Algebraic comparisons work over every field in their stated geometric scope. Complex realization uses a specified embedding into ℂ; its logarithmic and support theory covers smooth separated varieties, and its higher-cycle source uses smooth quasi-projective varieties, with disconnected schemes treated componentwise.

## Scope and ownership

This roadmap owns the cubical and mixed adapters to the shared integral cycles, the higher motivic Chern comparison, the logarithmic Deligne functor and its geometric model, and the universal derived realization and its comparison theorems. It does not introduce a second higher Chow group or an independent K-theory carrier.

KTheoryFiniteLocalFields §3.0a owns the simplicial BlochCycle/HigherChow complexes, moving, localization, coefficients, products, transfers and motivic-to-K tower; its §6.10 owns the universal integral motivic Chern classes and their projective-bundle and Whitney identities, as well as the field-diagonal Chern map. Section 2.0b here realizes those classes as operations on the shared higher-cycle complexes of every smooth quasi-projective scheme. MotivesAndAlgebraicCycles §4.4 owns functorial Tate complexes, and §§4.7–4.8 and 4.17–4.18 own the shared cycles’ motive-category adapters and comparisons; its §§4.8a and 4.14 retain relative cycles and specialization. SchemeKTheoryOperations §§7.1–7.3 own Adams/γ theory and the degree-zero character. The retained higher variant here extends that same map in positive K-degree and compares it on the same carriers. Section 2.3 owns the geometric supported cycle-to-K comparison for regular quasi-projective schemes over every field, including its full-support specialization. Its identification with the universal-class character of §§2.0b–2.2 and the products of §2.4 retain their smooth quasi-projective scope. SchemeAndStackFoundations §§5.1–5.8 retain ordinary intersection and geometric Chern theory. ResolutionOfSingularitiesCharacteristicZero §§5–6 and EtaleCohomologyFoundations §§G.1–G.3 retain resolution and common-refinement geometry.

ComplexComparisonPartII §§C5.1, C5.3–C5.5 retain analytification, geometric de Rham comparison, proper algebraic Hodge theory, holomorphic logarithmic forms, current calculus and ordinary geometric cycle normalization. Its §C5.6 (regularSingularDeRhamComparison, trivial connection, Ē=O_W) retains the all-dimensional unfiltered logarithmic comparison. Section 3.2 here adds the geometric weight and Hodge filtrations and the Burgos smooth logarithmic model. ComplexKahlerGeometry K1–K2 retain type decomposition, the transported complex orientation and Dolbeault calculus. The geometric logarithmic, Deligne and support assertions in §§3.1–3.4 and 5.1–5.2 apply to all smooth separated finite-type complex varieties; §§5.3–5.4 keep the quasi-projective higher-cycle scope of Layer 1. Completed/HodgeStructures retains linear pure and mixed Hodge structures; the corresponding pinned Tau Ceti structures and strictness are imported. General geometric Hodge modules and singular hyperresolution theory are outside this construction.

The shared auxiliary complexes Aₚ, Aₚ,S and Hₚ, the logarithmic Green-current criterion and its normalized even-degree pairing are owned by §§5.2–5.3 here. The supply direction is from §§5.1–5.4 and 6.1–6.3 here to Polylogarithms §5.2; its shared auxiliary complexes and abstract supported regulator are imports of these constructions, transported by Jₙ. Polylogarithms §5.2 retains its shifted comparison complex D_AH and β, the full normalized-current dictionary and concrete support-cone adapters; §5.3 retains Green forms, and §§5.4–5.12 retain Wang/Goncharov forms, mixed regulator homotopies and explicit Arakelov comparisons. Section 5.1 supplies the abstract fibers.

Section 2.0a owns the shared supported multi-relative restriction diagrams, their common-base spectrum pairing and Adams-compatible ordered relativity on pointed K-spaces and nonnegative homotopy groups. The consumer contract for ColemanIntegration §§L3.Fa.1–L3.Fa.2 preserves its public relativeKSpace, higherKGroupWithSupports, cubeRelK and cubeRelK.relativityIso as Quillen-model adapters under SchemeKTheoryOperations §2.5's comparison, including the sign and support transports specified below. ColemanIntegration retains its exact-category and exact-cube models, the comparison of its exact-cube Adams operations with the supplied operations, special-unit localizations and de Jeu symbols. SchemeKTheoryOperations §§2.5, 6.1 and 6.8–6.9 supply the ordinary supported K-models, vertex pairings and operations; the shared iterated restriction-fiber refinement of those inputs is §2.0a here.

The general compactification-independent Deligne construction and universal Deligne Chern character belong to §§3.3–3.4, 4.1–4.2 and 7.1 here. ColemanIntegration §L3.Fc.1's consumer contract is the marked complex-point specialization of §7.1 with §7.4's normalization; its arithmetic pairings, Galois integral-image theorem and determinants remain there. BorelRegulators §6.0a imports the same general Deligne constructions; its topological calibration, conjugation and transfer interfaces, infinitesimal comparison, arithmetic regulator spaces, Borel comparison, lattices and special values remain in BorelRegulators §§6.0a–6.2 and its arithmetic layers. KTheoryFiniteLocalFields §§3.0–3.0a owns the field-diagonal and norm-residue comparison. The name MotivicEtaleKTheory adds no finite-coefficient étale descent, norm-residue theorem, p-adic regulator, arithmetic K-group computation or trace theory to this scope.

## Conventions

Schemes and sites are small in a fixed universe u; their module and enhanced derived categories use the necessary enlarged universe. Compactification and support diagrams use small skeletons; change of skeleton has its comparison functor. Except for the regular-base cube K-theory of §2.0a, algebraic schemes are separated and of finite type over the stated field. Equidimensional cycle formulas use dimension d; on regular schemes of mixed dimensions, including smooth schemes, take the finite open-and-closed equidimensional decomposition. Neither integrality nor geometric connectedness is implicit. For a point disjoint from ℙ¹, weight-zero rank is a pair, and CH¹ in degree zero is 0⊕ℤ.

Use the supplied dimension grading CHᵖ(X,n)=CHⱼ(X,n) for j=d−p, and H_Mᵃ(X,R(p))=CHᵖ(X,2p−a;R). The expression 2p−a is an integer; negative homological degrees are zero, never natural-number subtraction. Coefficients mean derived tensor with any commutative ring, including the zero ring. For ℤ/2⊗ᴸℤ/2 the two nonzero groups occur in degrees −1 and 0; tensoring homology alone is not coefficient change.

Order cube coordinates first, simplex coordinates second. Set ∂□=Σᵢ₌₁ⁿ(−1)ⁱ⁻¹(∂ᵢ⁰−∂ᵢ∞), and totalize mixed cycles by ∂□+(−1)ⁿ∂Δ. The supplied simplex boundary in degree one is [1]−[0]. BF and BFT use δ=−∂□; Jₙ=(−1)ⁿ transports every cube-dependent cycle and Deligne complex, including its support fibers. Its first three values are 1,−1,1, and Jₙ₊ₘ=JₙJₘ. A graph of t on 𝔸¹ has ∂□Γ_t=[0] and δΓ_t=−[0]. The mixed (1,1) cross coefficients are −1 and +1.

Cochain differential raises degree, A[s]ᵃ=Aᵃ⁺ˢ and d[s]=(−1)ˢd. Use Mathlib’s source-shift-first cone and the explicitly transported pair fiber with d(a,b)=(da,f(a)−db) in Aᵃ⊕Bᵃ⁻¹. It is isomorphic to Cone(f)[−1] by negating the second coordinate after shifting. Thus fib(0→ℝ[0]) lies in degree 1. Its raw cochain connecting map sends b to [(0,b)]. Keep this raw map separate from the supplied K-theory boundary B, with B[t]=+[O₀], and the uniformizer-last adapter (−1)ⁿ⁻¹B. Section 2.3 proves the suspension dictionary between their sequences. In the cycle pair fiber, d(Γ_t,0)=([0],t), hence [(0,t)]=−[([0],0)]. The localization-boundary adapter on both cycle and Deligne pair fibers is minus the raw connecting map; it sends the unit t to +[0] and log|t| to +cl([0]). Section 2.3 identifies this adapter with the supplied right-linear B in every degree; the left-linear version adds its factor (−1)ⁿ⁻¹. The raw fiber triangles themselves retain their connecting maps.

Write z̄ for complex conjugation, also on coordinates and coefficient functions. Write ℝ(p)=(2πi)ᵖℝ for every integer p. Negative powers are valid because 2πi≠0. The Deligne arrow is filtered de Rham comparison minus real inclusion. For the point H_D⁰(ℝ(0))=ℝ, while H_D¹(ℝ(1))=ℂ/(2πiℝ)≃ℝ by real part. The exponential class of u has value log|u|; u=2 gives log 2 and u=i gives 0. The critical Dolbeault differential is −2∂∂̄; on |z|² it gives −2dz∧dz̄. A principal-divisor Green representative is −log|f|. Under the raw connecting map log|t| gives −cl([0]), while (0,−log|t|) represents +cl([0]).

Orient complex normal disks by their complex coordinates and loops counterclockwise. The period of dz/z is 2πi, the ordered two-residue of dz/z∧dw/w is +1, and exchange gives −1. The Tate-normalized integral of c₁O(1) on ℙ¹ is +1, with raw complex period 2πi. Deligne degree a has ordinary form degree a−1 below 2p and degree a at or above 2p. In totalized forms of bidegrees (r,−n),(s,−m), product has the additional Koszul factor (−1)ⁿˢ. For n=s=1 this is −1. On 𝔾_m, log 2•log|t|=i log 2 darg t with circle period 2πi log 2. These witnesses are retained wherever the signs are transported.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Use `AlgebraicGeometry.AlgebraicCycle` and `AlgebraicGeometry.AlgebraicCycle.map` from Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44 and :69. A cycle is a locally finitely supported coefficient function on scheme points, without a dimension condition; the map uses explicit dimension weights and residue degrees for a quasi-compact morphism. The face-admissible and dimension predicates here cut out subgroups of this carrier. Properness is needed for the higher Chow pushforward, rather than for the bare native map. Use `AlgebraicGeometry.Scheme` from Mathlib/AlgebraicGeometry/Scheme.lean:40, `ModuleCat` from Mathlib/Algebra/Category/ModuleCat/Basic.lean:56, `HomologicalComplex` and `HomologicalComplex.d_comp_d` from Mathlib/Algebra/Homology/HomologicalComplex.lean:59 and :72, and `DerivedCategory` from Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87. The last is localization at quasi-isomorphisms of integer cochain complexes in an abelian category, not a homotopy-coherent diagram category.

Use `CochainComplex.mappingCone`, `CochainComplex.mappingCone.inl_v_d` and `CochainComplex.mappingCone.inr_f_d` from Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57, :261 and :269. These specify the cone differential on both summands; the pair fiber above is a coordinate transport of it. Use `CategoryTheory.Abelian.DoldKan.equivalence` from Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 for the equivalence between simplicial objects in an abelian category and natural-number chain complexes. Its interpretation in homotopy groups is AlgebraicTopology Stage 8, item 2’s separate input.

### From Tau Ceti

The baseline is Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Use `TauCeti.gradedCochainComplex` from TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 when realizing graded submodules with an actual degree-one square-zero endomorphism. Use `TauCeti.Hodge.HodgeStructureOn` and `TauCeti.Hodge.HodgeStructureOn.IsMorphism` from TauCeti/Geometry/Hodge/Structure.lean:62 and Morphism.lean:69; the latter requires conjugation equivariance and filtration preservation. Use `TauCeti.Hodge.tate`, `TauCeti.Hodge.tate_F` and `TauCeti.Hodge.tate_piece` from TauCeti/Geometry/Hodge/Tate/Basic.lean:91, :100 and :111. Its Tate lattice map is the ordinary ℤ→ℂ and its only Hodge piece is at −p for twist p; the geometric factor (2πi)ᵖ must be marked explicitly.

Use `TauCeti.Hodge.MixedHodgeStructure` from TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 with its specified rational/complex base-change models, and `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` from Mixed/Strictness.lean:110. Its conclusion is range(f)∩Fᵖ= f(Fᵖ). This is strictness for an actual mixed-Hodge morphism; §3.2 constructs the geometric input that makes it applicable. The native structures are linear Hodge data and contain no logarithmic sheaf, geometric Deligne complex or cycle-to-K comparison.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

§3.12, §§4.6, 4.8, 4.14, §6.3, §§7.4–7.7, §§8.12–8.13. The actual Q/plus/Waldhausen K-theory models, resolution, dévissage, localization and biexact tensor pairings and transfers. The native right-linear DVR boundary B sends a uniformizer to +1; its left-linear adapter in degree n is (−1)ⁿ⁻¹B.

### From TauCetiRoadmap.SchemeKTheoryOperations

§§2.1–2.6, §§3.1–3.6, §4.3, §6.1, §§6.7–6.9, §§7.1–7.3. Perfect scheme K, derived pullback, supported localization and the supported external spectrum pairing of §6.1, the actual K-sheaf/classifying-space comparison and its finite-rank stabilization, supported pointed-space Adams operations and finite rational weight decomposition in the regular ample-family scope. Integral Adams compatibility concerns pointed spaces and their nonnegative homotopy groups. Section 7.2 supplies the existing degree-zero Chow character, including leading structure-sheaf class; §7.3 supplies its γ-graded counterpart. These are compared, rather than redefined.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

§3.0a (motivicCycles), §3.0a (motivicToK), §6.10 (diagonalChernMilnor). Integral dimension-graded simplicial BlochCycle and HigherChow, coefficient complexes, arbitrary-field localization, simultaneous good-position moving, graph pullbacks, integral products/transfers, nilpotent invariance and componentwise grading. The degree-one simplex boundary is [fiber at 1]−[fiber at 0]. The common Milnor diagonal, its signs and the existing motivic-to-K tower with layers, convergence and localization are also inputs. Section 6.10 supplies the universal integral motivic Chern classes on B·GL_N, their projective-bundle and Whitney identities, and the field-diagonal Chern map; §2.0b pulls these classes back to the shared complexes of every smooth quasi-projective scheme. Neither norm-residue nor étale descent is a target here.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§4.4, §§4.7–4.8, §4.8a, §§4.17–4.18. The functorial Tate complexes of §4.4 and the perfect-field higher-Chow comparison of §4.17 supply the finite-field Chern construction without resolution. The adapters to the same shared higher-cycle complexes, and the perfect-field motive/higher-Chow and representability comparisons, including their resolution hypotheses where used. These express the source of §6.3 motivically; they impose no perfectness condition on the arbitrary-field cycle comparison or Chern theorem. Section 4.8a supplies specialization of relative cycles for the infinite-field construction in §2.0b.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§2.1–2.2, §4.12, §4.17, §§5.1–5.8. Scheme cohomology, Chow groups, multiplicity-bearing cycles, refined intersection, Chern classes, normal cones and degree-zero geometric characters. Section 4.12 supplies Chow domination and §4.17 the SNC algebraic predicate. Generality of a geometric Chern class is retained when it is transported to perfect K.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

§§5.1–5.6, §§6.1–6.4. Characteristic-zero resolution and principalization with preservation of the given smooth open and initial boundary, smooth projective SNC compactifications in the quasi-projective case, and étale SNC coordinates. Applied to the compactification supplier’s common graph refinement, these give SNC refinements; no universal choice of compactification is assumed.

### From TauCetiRoadmap.EtaleCohomologyFoundations

§§G.1–G.3. Dense compactification objects, existence, proper morphisms between choices, finite-diagram common refinements and their coherent comparison principle. Only this algebraic geometric prefix is consumed, with no étale coefficient theory.

### From TauCetiRoadmap.ComplexComparisonPartII

§§C−1.1, C−1.4, §C5.1, §§C5.3–C5.6, §C6.0. Analytification and adapted holomorphic SNC charts, geometric de Rham–Betti comparison, projective and arbitrary smooth-proper algebraic Hodge theory (properPureHodge and relativeHodgeBundles in §C5.3), LF-continuous current calculus and multiplicity-bearing integration classes, Poincaré–Lelong and geometric first-Chern normalization, holomorphic logarithmic forms, and compatible algebraic stratification. Section C5.6 (regularSingularDeRhamComparison, trivial connection, Ē=O_W, all residues 0) supplies the all-dimensional unfiltered logarithmic comparison; §3.2 adds its mixed-Hodge filtrations and smooth Burgos model.

### From TauCetiRoadmap.EnhancedDerivedSheaves

§§0.1–0.4, §E0.6, §E1.4, §E2.6. Functorial enhanced module/sheaf complexes, K-injective/K-flat replacements, derived tensor, mapping-cone/shift comparison, coherent functor and diagram calculus and hypercover descent. Equivalences of restriction diagrams and their fibers use these carriers, including the point-site module specialization.

### From TauCetiRoadmap.DifferentialGeometry

Layers 0–1, Layers 5–9. Native forms, pullback, wedge, exterior derivative, integration, Stokes, real de Rham comparison and smooth manifold duality. The extra closed-jet inputs for §3.2 are gap:smooth-whitney-extension and gap:flat-ideal-regular-situation specified here.

What DifferentialGeometry must provide (gap:smooth-whitney-extension): For U⊂ℝⁿ open, A⊂U relatively closed and E a finite-dimensional real vector space, every infinite-order E-valued Whitney jet on A is the jet of a smooth U→E, including relative Borel extension along a coordinate hyperplane with smooth transverse parameters. The supplier section is Part II: Whitney jets and flat functions. A jet satisfies Whitney compatibility when each order-m Taylor remainder for derivative α is o(‖y−x‖^(m−|α|)), uniformly on compact subsets of A, for every m≥|α|. Complex coefficients use real and imaginary parts. This is an extension of the supplier’s manifold calculus. (Burgos94 Theorems 3.1 and 3.3, pp.72–73, Burgos94 line 316 and Burgos94 line 337.)

**Checks.**

- At A={0}⊂ℝ, Taylor coefficients 1,1,2 give derivatives 1,1,4. Coefficients n! give derivatives (n!)²; the smooth extension exists although the power series has radius zero.
- Along x=0 in ℝ², prescribed normal derivatives ∂ₓᵐf(0,y)=(m!)² sin y have a smooth extension. At m=2,y=π/2 the value is 4, so a scalar Borel theorem without parameters does not specify this jet.
- Empty A imposes zero jet conditions; at A=U the prescribed smooth function extends as itself. At U=ℝ,A={0}, both 0 and exp(−1/x²), extended by 0, have all jet entries 0, so uniqueness of extension is false.

What DifferentialGeometry must provide (gap:flat-ideal-regular-situation): For U⊂ℝⁿ open and relatively closed real-analytic subsets A,B⊂U, the scalar smooth flat ideals satisfy I∞(A∩B)=I∞(A)+I∞(B). The supplier section is Part II: Whitney jets and flat functions. Complex-valued functions satisfy the componentwise version. (Burgos94 Theorems 3.4–3.5, pp.73–74, Burgos94 line 345 and Burgos94 line 358.)

**Checks.**

- For A=B={0}, exp(−1/x²), extended by 0, lies in I∞({0})=I∞({0})+I∞({0}) and has value e⁻¹ at x=1; an analytic-function model would give only 0.
- For A=∅, B=U, the formula reads C∞(U)=C∞(U)+0. For A=B=U it reads 0=0+0.
- For A={x=0},B={y=0} in ℝ², let φ(t)=exp(−1/t²), φ(0)=0. The function φ(x)+φ(y) is flat at A∩B={(0,0)} and splits into the two flat ideals; at (0,1) it has value e⁻¹, excluding their intersection as the answer.

The coordinate-division and logarithmic-power estimates used in the smooth logarithmic resolution are targets of §3.2 here, using Burgos94 Proposition 4.1; they are not supplier-extension requirements.

### From TauCetiRoadmap.ComplexKahlerGeometry

K1 supplies type decomposition, conjugation and transport of the complex orientation in the shared orientation carrier; K2 supplies ∂, ∂̄, bidegrees, squares zero, anticommutation, Leibniz and holomorphic-pullback naturality on finite-dimensional Hausdorff second-countable complex manifolds. Analytifications here satisfy these hypotheses. K1 transports the orientation supplied by ComplexManifolds Milestones 1–2; it does not construct a separate orientation.

### From TauCetiRoadmap.AlgebraicTopology

Stages 2–3, Stage 6, items 1–4, Stage 8, item 2. Relative homology/cohomology, excision, products and local manifold duality used in the support calculation; the simplicial-group Kan theorem and, for simplicial abelian groups, the Moore-homotopy comparison πₙ(G)=Hₙ(NG), including components, used with native Dold–Kan in §7.1.

## How to read the build

The roadmap is this README. Suggested.lean records which headline theorems can be stated against the pinned APIs; the geometric higher-cycle, scheme K-theory and Deligne carriers required by these headlines are supplied by the build below.

Layer 1 compares integral cycle models and their operations. Layer 2 constructs the geometric supported rational comparison for regular quasi-projective schemes and identifies its inverse with the universal-class character on smooth quasi-projective schemes, on the supplied K-groups. Layer 3 builds the smooth logarithmic algebra, its geometric filtered comparison and the Deligne cone, then proves choice independence. Layer 4 fixes the full product and its associativity homotopy. Layer 5 proves support semipurity and the auxiliary cycle resolution. Layer 6 uses their specified roof to construct the universal restriction-natural regulator. Layer 7 constructs the independently normalized Deligne character and proves Beilinson identification, integral-source multiplicativity and the logarithm/Chern witnesses. Each *Needs:* line specifies the statement and the sketched route, so a different proof need not wait on unrelated layers.

## Layer 1: integral cubical and mixed cycle models

### 1.1 Normalized cubical cycles

For every field k, equidimensional quasi-projective finite-type k-scheme X of dimension d and p≥0, form the free integral cycle groups on codimension-p integral closed subschemes of X×□ⁿ, □=ℙ¹∖{1}, meeting every iterated face properly. Define C□ᵖ(X)ₙ as the intersection of the kernels of the infinity-face maps. The boundary is ∂□=Σᵢ₌₁ⁿ(−1)ⁱ⁻¹(∂ᵢ⁰−∂ᵢ∞), restricted to this subgroup. Identify it with the quotient by coordinate degeneracies. Extend to finite disjoint unions of equidimensional pieces componentwise, and reindex M□(X,p)ᵃ=C□ᵖ(X)₂ₚ₋ₐ using integer degrees and zero terms at negative cube degrees. Set all negative-codimension terms to zero for the dimension-shifted maps. Realize the raw groups as the face-admissible, dimension-graded subgroups of the native AlgebraicGeometry.AlgebraicCycle (X×□ⁿ) ℤ, rather than a second ordinary-cycle carrier; finite type makes their locally finite coefficients finitely supported. (BF, §1.6 and §2.1, pp.8,13–14; BF line 381, BF line 610; BFT §3.2, p.5, BFT line 180).

Use the split face-degeneracy projectors to identify normalization with the degeneracy quotient. Face intersections use generic lengths, and the cubical identities cancel each codimension-two face twice. The degree-n isomorphism Jₙ=(−1)ⁿ converts this boundary into BF’s δ=−∂□; on products Jₙ₊ₘ=JₙJₘ. No new simplicial higher Chow carrier is introduced.

Define the refined subcomplex C□,refᵖ(X)ₙ=(⋂ᵢ₌₁ⁿ ker ∂ᵢ∞)∩(⋂ᵢ₌₂ⁿ ker ∂ᵢ⁰), with the same degree-zero group and differential ∂₁⁰ in positive degrees. Construct an integral chain retraction r:C□ᵖ(X)→C□,refᵖ(X) of its inclusion i, with r i=id and i r−id=∂□h+h∂□ for a degree-one integral homotopy h. Use the extra cubical pullbacks which replace adjacent affine coordinates x,y, where x=t/(t−1), by x+y−xy: these maps are flat, preserve face admissibility and satisfy the identities needed for the retraction. Transport BF's homotopy by J to fix its sign. This is a homotopy equivalence for every field and every X in this section, independent of incidence moving. (BF Definition 1.18 and Proposition 1.20, pp.8–9, BF line 395–459; §2.1, pp.13–14, BF line 639–660.)

The construction has the following API.

- The inclusion of the normalized subgroup followed by projection to the degeneracy quotient is an isomorphism of complexes, natural for maps of the cycle diagrams. (BF §1.6 and §2.1, pp.8,13–14, BF line 381 and BF line 610; SchemeAndStackFoundations §§5.1–5.2.)
- For a proper map X→Y of equidimensional schemes of dimensions d_X,d_Y, pushforward sends codimension p to p+d_Y−d_X and agrees with the restriction of the native AlgebraicCycle.map using dimension weights. Flat pullback of pure relative dimension e preserves codimension; open restriction preserves p. These maps commute with faces and degeneracies; dimension-dropping images contribute zero. (BF §2.2, p.14, BF line 661–663; Mathlib AlgebraicGeometry.AlgebraicCycle.map; SchemeAndStackFoundations §§5.1–5.2.)
- Jₙ=(−1)ⁿ is an involutive chain isomorphism from boundary ∂□ to δ, with J₀=1 and Jₙ₊ₘ=JₙJₘ; the same degree rule applies after reindexing and on restriction fibers. (BF §1.6 and §2.1, pp.8,13–14, BF line 381 and BF line 610; SchemeAndStackFoundations §§5.1–5.2.)
- A face-admissible integral closed subscheme supplies its native generic-point cycle. The canonical face-degeneracy projector constructs a normalized element from a raw one; equality of normalized elements is detected by the inherited native coefficients. Degree zero is the same ordinary cycle subgroup supplied by SchemeAndStackFoundations. (BF §1.6 and §2.1, pp.8,13–14, BF line 381 and BF line 610; SchemeAndStackFoundations §§5.1–5.2.)
- The refined inclusion, retraction and homotopy commute with open restriction, flat pullback and proper pushforward with its dimension shift. Thus their restriction diagrams and fibers for a closed Z⊂X are integrally homotopy equivalent, and remain equivalent after derived coefficient change. Cube supports may change during refinement; retain their face-admissible enlargements when comparing the support-local maps. (BF Proposition 1.20 and §2.1–§2.2, pp.8–9,13–14, BF line 408–459 and BF line 648–663.)
- A positive-degree refined chain has boundary ∂₁⁰; it is a cycle exactly when that remaining face also vanishes. Hence a refined cycle vanishes on every face separately, as required by §2.0a. Apply the normalization comparison in the chosen coordinate order and transport the whole comparison through J; the distinguished first face follows that order. (BF Definition 1.18, BF line 395–403; Levine94's complex preceding Theorem 3.1, pp.275–276, Levine94 line 1184–1208.)

**Checks.**

- On X=𝔸¹, p=1, the graph of t has infinity face 0 and zero face [0], so ∂□[Γ_t]=[0], while δ[Γ_t]=−[0].
- For X=Spec k and p=0 the normalized complex is ℤ in degree 0 and 0 in every positive degree; retaining degenerate cubes would leave an unwanted ℤ in each degree.
- At n=0 the group is the ordinary codimension-p cycle group; for a double point the unique integral support still generates ℤ, while its multiplicity-two cycle is 2.
- J₀,J₁,J₂ have values 1,−1,1. On a square, the two routes to any vertex have coefficients +1 and −1, summing to 0 over ℤ even when char k=2.
- Set the negative-codimension extension to 0: on a point p=−1 has no generators, and pushforward of the fundamental cycle of ℙ¹ to a point is 0 because its dimension drops.
- At n=0 and n=1 refined and ordinary normalization agree. The graph Γ_t on 𝔸¹ has ∂₁⁰Γ_t=[0]≠0, so it is a refined chain but not a refined cycle; the degree-one point 2 over ℚ has both faces zero and is a refined cycle.
- On Spec ℚ in affine square coordinates, let Z=[x+y=3]−[x=2]−[y=2]. Its infinity faces are 0, its two zero faces are both [3]−[2], and ∂□Z=0. Thus Z is an ordinary normalized cycle but fails refined normalization. The retraction in degree two gives rZ=Z−[x+y−xy=3]+[x+y−xy=2]; each zero face is ([3]−[2])−[3]+[2]=0, and each infinity face is 0. The equality rZ−Z=−∂□h₂Z, where h₂ splits the second coordinate by the extra cubical map, preserves its homology class integrally.
- The extra map has values h(0,y)=y, h(x,0)=x and h(1,y)=h(x,1)=1; these hold also in characteristics 2 and 3. Consequently it fixes the two required zero-face restrictions and factors each infinity restriction through the infinity face; at p=0 on a point both normalized positive-degree groups are 0 over every field.

*Needs:* KTheoryFiniteLocalFields §3.0a; SchemeAndStackFoundations §§5.1–5.2; Mathlib `HomologicalComplex`; Mathlib `AlgebraicGeometry.AlgebraicCycle`; Mathlib `AlgebraicGeometry.AlgebraicCycle.map`.

### 1.2 The mixed complex and its axes

For the same k,X,p, define Cmixᵖ(X)ₙ,ₘ from integral closed cycles of X×□ⁿ×Δᵐ meeting every product of iterated faces properly, normalized only in the cube directions. Its direct-sum total complex in homological degree N is ⊕ₙ₊ₘ₌N Cmixᵖ(X)ₙ,ₘ with differential ∂□+(−1)ⁿ∂Δ. Define the cube-axis inclusion i□ and the supplied unnormalized simplex-axis inclusion iΔ into this total complex. (BFT, §6.4 and Proposition 6.12, pp.19–20; BFT line 943, BFT line 948 and BFT line 961).

The face systems commute before totalization. The sign (−1)ⁿ changes when the cube boundary lowers n, so the cross terms in the square cancel. Each diagonal has finitely many summands. Transport BFT’s axis maps by Jₙ on bidegree (n,m), leaving the simplex axis unchanged.

The construction has the following API.

- Both axis inclusions preserve degree, cycles, boundaries and restriction; in degree 0 each sends a cycle to itself. (BFT §6.4, pp.19–20, BFT line 948–961.)
- A morphism out of the direct-sum total is determined by its bidegree components; commuting cube and simplex face maps with the displayed signs define such morphisms. (BFT §6.4, pp.19–20, BFT line 948–961.)
- Multiplication by (−1)ⁿ on bidegree (n,m) identifies the total differential with δ+(−1)ⁿ∂Δ; it restricts to J on the cube axis and identity on the simplex axis. (BFT §6.4, pp.19–20, BFT line 948–961.)

**Checks.**

- In bidegree (1,1), ∂□∂Δ and ∂Δ∂□ have coefficients −1 and +1 in the square of the total differential, hence sum to 0.
- At (0,0) both axis maps send [V] to [V]; there is one summand in total degree 0 and three in total degree 2.
- The orientation multiplier at (1,0),(0,1),(1,1) is −1,+1,−1; using (−1)ⁿ⁺ᵐ would wrongly negate the simplex axis.

*Needs:* §1.1; KTheoryFiniteLocalFields §3.0a; Mathlib `HomologicalComplex`.

### 1.3 Integral comparison and supports

For every k,X,p as in 1.1, i□ and iΔ are integral quasi-isomorphisms. Thus Hₙ(C□ᵖ(X)) is the supplied CHᵖ(X,n), for all n≥0. For every closed subset Z⊂X, the induced maps between homotopy fibers of restriction to U=X∖Z are quasi-isomorphisms. These assertions remain true after any derived coefficient change ℤ→R, with R any commutative ring including the zero ring. (BFT, Proposition 6.12, p.20, BFT line 961; Levine94 Theorem 4.7, p.296, Levine94 line 1767).

Filter the mixed total in its two directions. The relative moving and affine-homotopy contractions identify each axis augmentation as a quasi-isomorphism, as in Levine94 Lemma 4.6, pp.295–296. Restriction gives an actual square of axis maps; exactness of fibers and of derived tensor then proves the supported and coefficient versions. Use the supplier’s two-coprime-degree descent over finite fields, rather than averaging.

**Checks.**

- For p=0 and a point each model has H₀=ℤ and Hₙ=0 for n>0; the induced H₀ map is 1↦1.
- Z=∅ gives a contractible pair fiber, hence zero homology; Z=X gives fib(C→0)=C in all three models. For C=ℤ concentrated in cochain degree 0, fib(id) has ℤ→ℤ by identity in degrees 0 and 1, with both cohomology groups zero.
- For a two-term multiplication-by-2 coefficient triangle, derived reduction retains both kernel and cokernel; ℤ/2⊗ᴸℤ/2 has ℤ/2 in degrees −1 and 0. R=0 gives the zero comparison.

*Needs:* §1.2; KTheoryFiniteLocalFields §3.0a; EnhancedDerivedSheaves §§0.1–0.4.

### 1.4 The shared operations

The comparisons of 1.3 commute with open restriction, proper pushforward with its dimension shift and flat pullback wherever these are defined. On smooth quasi-projective schemes over any field they intertwine the supplier’s derived pullbacks and external and diagonal products integrally, with sign (−1)ⁿᵐ on exchanging homological degrees n,m. They also intertwine support enlargement and the localization triangles after the explicit cone and orientation transports. (Levine94, Corollary 4.9, pp.297–298, Levine94 line 1794; Theorem 5.2, pp.312–313, Levine94 line 2226; BF §2.2–§2.3, pp.14–15, BF line 661).

For direct geometric maps compare the same multiplicity-bearing cycles on both axes. For general smooth pullbacks choose a common graph-good-position subcomplex, including simultaneous conditions for compositions and products. Its integral moving quasi-isomorphism is the supplier input; Levine94 Corollary 4.9 alone supplies only a rational pullback statement. Apply the integral input to the mixed incidence complex and descend the equality. Cube concatenation and simplex shuffles agree through the mixed double construction.

**Checks.**

- For 𝔽₂(t)/𝔽₂(t²), flat restriction followed by proper transfer on CH⁰ is multiplication by 2 on ℤ in every model, not identity.
- For X=Spec k ⊔ ℙ¹, CH¹(X,0)=0⊕ℤ and CH⁰(X,0)=ℤ²; the comparison preserves these two summands.
- A square-zero thickening has the same integral cycle generators, and an identity map acts by +1. Two odd-degree product factors acquire sign −1 on exchange; a degree-zero factor acquires +1.

*Needs:* §1.3; KTheoryFiniteLocalFields §3.0a.

### Examples

The graph of the coordinate on the affine line has boundary the origin in cube degree one. A point over 𝔽₂, the purely inseparable extension 𝔽₂(t)/𝔽₂(t²), and a square-zero thickening test integral coefficients without a characteristic-zero argument.

### Dependencies

KTheoryFiniteLocalFields §3.0a, SchemeAndStackFoundations §§5.1–5.2, and EnhancedDerivedSheaves §§0.1–0.4 supply the simplicial complexes, cycle maps and derived algebra.

## Layer 2: the rational higher Chern character

### 2.0a Supported multi-relative cube K-theory

For every regular Noetherian separated finite-dimensional scheme X with an ample family of line bundles, n≥0, open Y⊂X×□ⁿ and closed S⊂Y, construct K^S(Y;∂□ⁿ) as the iterated homotopy fiber of the supplied supported perfect K-spectra on all intersections of the coordinate face pairs Dᵢ={tᵢ=0}⊔{tᵢ=∞}, with support restricted to each intersection. Here □=ℙ¹_ℤ∖{1}, the ambient cube X×□ⁿ is formed over Spec ℤ, and every face is intersected with Y. Pairings over a common regular base and external pairings have the domains specified below. Equivalently take the support fiber of the multi-relative restriction diagram. Order the coordinates as in Layer 1. Apply the infinite-loop-space functor to the supported K-spectra and their total fiber. Construct compatible integral Adams operations ψᵃ, a≥1, on the resulting pointed K-space diagrams and their homotopy fibers, using the supplied unstable operations and coherent restriction maps. Every integral Adams identity here concerns these pointed spaces and their nonnegative homotopy groups. For a fixed a>1, integer q and homotopy degree m≥0, on Kₘ^S(Y;∂□ⁿ)⊗ℚ first use the finite generalized weight-q decomposition defined by (ψᵃ−aᑫ)ᴺx=0 for some N≥1. The commuting Adams maps preserve these summands, and the decomposition agrees with the supplied weight decomposition on each vertex. For arbitrary Y,S retain generalized weight pieces; on full cubes Y=X×□ⁿ with product support S=T×□ⁿ the relativity equivalence below identifies them with the supplied simultaneous supported eigenspaces. Section 2.3 identifies the supported and absolute eigenweights with higher Chow groups for regular quasi-projective schemes over a field; §2.2 identifies the smooth absolute comparison with the universal-class character. For the relative cycle map require X regular quasi-projective and finite type over a field k, and face-admissible S, with all iterated face intersections of the required codimension. The relative-cycle isomorphism over an infinite k retains the splitting and moving hypotheses below. (Levine94 §1, Theorem 1.10 and Corollary 1.11, pp.247–256, Levine94 line 407, Levine94 line 539 and Levine94 line 625; §2, Lemma 2.1 and Theorem 2.7, pp.257–273, Levine94 line 655, Levine94 line 695, Levine94 line 711 and Levine94 line 1101.)

Use SchemeKTheoryOperations §§2.5, 6.7–6.9’s supported K-models, functorial pointed-space Adams maps and rational vertex weights on the stated regular ample-family domain before taking pointed homotopy fibers. The finite face diagram gives a finite filtration on each rational homotopy group; its weight quotients yield the generalized decomposition by the linear-algebra argument of Levine94 Lemma 2.1, pp.258–259, Levine94 line 719–729. Regularity of the open face strata permits resolution comparisons. On full cubes, SchemeKTheoryOperations §6.8 makes pullback from X and restriction to the two sections Adams-compatible. Iterating their diagonal pointed fiber with the ordered difference proves Adams equivariance of pointed-space relativity; §6.9 then supplies its simultaneous eigenspaces. In the field-base cycle-map clause, the iterated-double cycle comparison invokes Theorem 2.7 for regular schemes with its splitting and moving hypotheses over an infinite field. For finite fields, regular finite-type schemes are smooth; the supplied finite-field moving and transfer descent completes the geometric comparison. No extension to an algebraic closure of an imperfect field is used to preserve regularity. The pairing uses SchemeKTheoryOperations §6.1’s supported external spectrum pairing on the vertices of the two face diagrams. Integral Adams multiplicativity on the associated pointed total fibers requires more than vertex identities: the vertices, face strata and their support complements are smooth over the regular base X. Apply §6.9’s several-variable identification of operations on ℤ×Gr in the pointed A¹-homotopy category over X. The two operations ψᵃ∘μ and μ∘(ψᵃ×ψᵃ) agree on K₀, since on line bundles both send (L,M) to [LᵃMᵃ]; the supplied comparison identifies them on the K-theory object. Evaluate on the pointed diagrams representing the iterated cofibers, then use the supported K comparison to obtain the integral Adams identity for the pointed-space pairing and the induced nonnegative homotopy groups. For an external pairing with different bases first pull back to the regular product X×_ℤX′. This route uses the stated ample-family and finite-dimensional hypotheses. (SchemeKTheoryOperations §§6.1, 6.8–6.9; Levine94 §2, p.258, Levine94 line 695–705.)

For the relative-cycle input, let V be regular quasi-projective over an infinite field k, D=D₁+⋯+Dᵣ a normal crossing divisor (each intersection D_I is regular of codimension |I| or empty), and s a finite family of closed subsets containing V. For c≥0 define CH_sᶜ(V;D) as codimension-c cycles meeting every D_I∩S properly, S∈s, with zero restrictions to the Dᵢ, modulo restrictions at 0 of cycles on V×𝔸¹ meeting every intersection of Dᵢ×𝔸¹, V×{0}, V×{1} and the pulled-back family s properly, and having zero restrictions to Dᵢ×𝔸¹ and V×{1}. The zero-section restriction supplies the relation. For a pure codimension-c closed W whose every irreducible component meets every D_I properly, construct the support-local isomorphism from the group of raw codimension-c cycles supported on W and vanishing on each Dᵢ, tensored with ℚ, to K₀^W(V;D)^(c), natural for flat pullback and support enlargement. Its degree-zero starting map is the leading weight of the resolved structure-sheaf class. For every a>0 and integer b≤c, prove K_a^W(V;D)^(b)=0, with rational generalized weight pieces as above. In the forget-face exact sequence, W∩Dᵣ has codimension c in Dᵣ when nonempty, so this includes K₁^(W∩Dᵣ)(Dᵣ;D₁∩Dᵣ,…,Dᵣ₋₁∩Dᵣ)^(c)=0. Consequently K₀^W(V;D)^(c)→K₀^W(V;D−Dᵣ)^(c) is injective; exactness and induction give the unique lift of a cycle whose face restrictions vanish. Forgetting W defines the geometric map to K₀(V;D)^(c). (Levine94 Lemma 2.2, equation (2.1) and its forget-face sequence, pp.261–264, Levine94 line 777–795 and Levine94 line 862–889.) Require an A-scheme structure on V and finitely many f_α∈A generating 1 such that the opposite face cube of D₁,…,Dᵣ over each V_(f_α) is split, meaning its inclusions have compatible retractions. Require also that every pure codimension-c W meeting all D_I∩S properly is contained in a pure codimension-c W′ with the same incidence conditions such that each face cube over V_(f_α)∖W′ is split. Under these two hypotheses the map CH_sᶜ(V;D)⊗ℚ→K₀(V;D)^(c) is an isomorphism. (Levine94 §2, pp.259–260, 269, Levine94 line 739–752 and Levine94 line 1006–1018; Theorem 2.7, pp.272–273, Levine94 line 1101–1117.)

The construction has the following API.

- The support-local cycle map commutes with flat pullback and enlargement of pure codimension-c supports meeting all faces properly. Its forget-support map annihilates the stated relative homotopy relations, giving CH_sᶜ(V;D)⊗ℚ→K₀(V;D)^(c); under the two splitting and moving hypotheses this is an isomorphism. (Levine94 Lemmas 2.2 and 2.5, Theorem 2.7, pp.261–264,269,272–273, Levine94 line 777–889, Levine94 line 1015–1037 and Levine94 line 1101–1117.)
- On V=X×□ⁿ, the raw inputs to the support-local cycle map are the cycles of §1.1's refined complex, vanishing separately on all 2n faces. A refined boundary ∂₁⁰b is a relative homotopy relation: take the first coordinate of b as the affine homotopy parameter, whose infinity face becomes 1, and the remaining n coordinates as V's cube. All their face restrictions and the parameter-1 restriction vanish. This identifies refined homology with the relative-cycle quotient used in the geometric map. (BF Definition 1.18 and §2.1, BF line 395–403 and BF line 639–660; Levine94 pp.275–276, Levine94 line 1197–1208.)
- At n=0 the construction is the supplied K^S(Y); in particular it is K^S(X) when Y=X. Empty support gives a contractible spectrum, hence zero homotopy groups. Forgetting and enlarging support commute with every face restriction and the total fiber. (Levine94 §2, pp.257–259, Levine94 line 655–736; SchemeKTheoryOperations §§6.1, 6.8–6.9.)
- Coordinate restrictions and pullbacks induce maps of total fibers: for g:X′→X between bases in this scope, take an open Y′⊂(g×id)⁻¹(Y) and closed S′⊂Y′ containing (g×id)⁻¹(S)∩Y′, with the induced faces. For two opens Y⊂X×□ⁿ and Y′⊂X×□ᵐ over the same X, construct the pairing of total-fiber spectra inducing the bilinear pairing from Kᵣ(Y;∂□ⁿ) with support S and Kₛ(Y′;∂□ᵐ) with support S′ to Kᵣ₊ₛ(Y×_X Y′;∂□ⁿ⁺ᵐ) with support S×_X S′, for r,s≥0. The target is an open cube over X and has the same regularity hypotheses. For different bases X,X′, the external pairing over Spec ℤ is included when X×_ℤX′ also satisfies those hypotheses. Identities and compositions are coherent. On the associated pointed spaces and their nonnegative homotopy groups, Adams operations commute with restrictions and pullbacks and satisfy ψᵃ(x·y)=ψᵃx·ψᵃy for these pairings; their rational projectors restrict to the supplied vertex projectors. (Levine94 §2, pp.257–259, Levine94 line 655–736; SchemeKTheoryOperations §§6.1, 6.8–6.9.)
- For Y=X×□ⁿ and S=T×□ⁿ with T⊂X closed, homotopy invariance gives the ordered equivalence K^S(Y;∂□ⁿ)≃ΩⁿK^T(X). At each step identify the cokernel of the diagonal by (a,b)↦a−b, with the zero face first; exchanging two loop coordinates contributes −1 on the induced double suspension of homotopy groups. Its associated pointed-space equivalence intertwines every integral ψᵃ, a≥1, and carries the rational generalized weight-q piece in homotopy degree m≥0 onto the simultaneous weight-q eigenspace of Kₘ₊ₙ^T(X)⊗ℚ. Thus on these full cubes the generalized pieces are simultaneous eigenspaces. (Levine94 §2, pp.257–259, Levine94 line 655–736; SchemeKTheoryOperations §§6.1, 6.8–6.9.)

**Checks.**

- At n=0,Y=X,S=X the degree-zero group is K₀(X); for X=Spec k the class [k²] is 2. At n=0,S=∅ it is 0. For an infinite field k, V=𝔸¹_k, D empty and W={0} with c=1, the support-local map sends the raw cycle 1 to [O_W]∈K₀^W(V)^(1)=ℚ, whereas forgetting support gives 1−1=0 in K₀(V).
- For V=Spec ℚ, W=V, D empty and c=0, K₁^W(V)^(0)=0 but K₀^W(V)^(0)=ℚ, so positive K-degree is essential. For V=𝔸¹_ℚ, W={0}, D empty and c=1, dévissage shifts weights by 1: K₁^W(V)^(1)=K₁(ℚ)^(0)=0, whereas K₁^W(V)^(2)=K₁(ℚ)^(1) contains the unit 2, of 2-adic valuation 1. Thus the vanishing includes weight c and cannot extend to c+1.
- For V=𝔸²_ℚ, W=V(x), D₁=V(y) and c=1, the obstructing face group K₁ with support W∩D₁ on D₁≃𝔸¹_ℚ has weight-1 part 0. The degree-zero restriction on weight-1 support classes is ℚ→ℚ, 1↦1; its kernel and K₀^W(V;D₁)^(1) are both 0. The only raw cycle m[W] with zero face restriction has m=0, in agreement with the support-local isomorphism.
- At X=Spec ℚ and n=0, stable η sends 1∈K₀ to [−1]≠0∈K₁. The pointed operation ψ² fixes 1 and sends [−1] to [1]=0. A spectrum endomorphism fixing 1 would instead send η·1 to η·1=[−1]. After tensoring with ℚ, [−1]=0, so this obstruction vanishes. (WeibelKBook Exercise IV.1.12(a), p.275, WeibelKBook line 15979.)
- At n=1,Y=X×□,S=Y the face map is the diagonal x↦(x,x). Its difference map sends (1,0)↦1, (0,1)↦−1 and (1,1)↦0; reversing the face order reverses these signs. For X=Spec ℚ, the relative class corresponding to the unit 2 maps to [2]∈K₁(ℚ); ψ² multiplies it by 2 on both sides, and ψ¹ fixes it.
- At n=2,Y=X×□²,S=Y the face-pair diagram has four vertices and total fiber Ω²K(X). For k=ℚ(u,v), the class corresponding to {u,v}∈K₂(k) has consecutive last-slot residues +1; exchanging the loop coordinates gives −1. Adams ψ² acts on this weight-2 class by 4 and ψ¹ by 1.
- For X=Spec ℤ_p at every prime p, n=1,Y=X×□,S=Y gives fib(K(Y)→K(X)⊕K(X))≃ΩK(X), hence K₀(Y;∂□)=K₁(ℤ_p)=ℤ_p×. The difference map on the two face ranks sends (1,0) to +1 and (0,1) to −1, including p=2 and p=3. For X=Spec ℤ₃ and Y=(X×□)∖{t=2}, the two induced faces are still copies of X, with face ranks (1,1) for the trivial line; the construction applies without asserting the full-cube delooping for this open.
- On X=S=Y=ℙ² at n=0, put h=1−[O(−1)], so h³=0. Then ψ²h=2h−h² and ψ²h²=4h². The integral generalized weight lattices ℤ·1, ℤ(2h+h²), ℤh² have index 2, whereas over ℚ, h=(2h+h²)/2−h²/2. Thus the direct-sum decomposition requires rational coefficients.
- A finite filtration with scalar Adams actions on its quotients need not give scalar action on a generalized piece. On ℚe₁⊕ℚe₂ with T(e₁)=2e₁ and T(e₂)=e₁+2e₂, (T−2)e₂=e₁≠0 but (T−2)²e₂=0; the generalized 2-space has dimension 2 and the 2-eigenspace dimension 1. An equivariant isomorphism preserves these dimensions separately, so transport alone cannot identify the two notions on open cubes. This tests the filtration argument, without asserting such a Jordan block occurs in a particular K-group.
- For X=Spec ℤ[i], the external self-product over ℤ is singular at (1+i,s−i): in ℤ[i,s]/(s²+1), putting v=s−i gives v(v+2i)=0, so this local ring has dimension 1 and cotangent dimension 2 over 𝔽₂. It is outside the regular external-product domain. In contrast Y=Y′=X×□ gives Y×_X Y′=X×□², which is regular. For X=Spec ℤ_(p) and units u,v, the ordered two-loop product satisfies ψ²{u,v}=4{u,v}=ψ²[u]·ψ²[v], including p=2 and p=3.
- For ℓ=2 or 3, k=𝔽_ℓ(t) and L=k[s]/(s^ℓ−t), V=Spec L with D empty, incidence family {V} and c=0 has CH_s⁰(V;D)⊗ℚ=ℚ=K₀(L)^(0), and the geometric map sends 1 to [L]=1. This input is regular over the infinite field k although it is not smooth over k.
- On V=□_L with its two faces, the degree-one relative cycle at cube coordinate s represents [s] in K₀(□_L;∂□)^(1)=K₁(L)⊗ℚ. Its s-adic valuation is +1; the zero map or an inverse convention would give 0 or −1.
- In the affine coordinate z=t/(t−1) on □, the faces are z=0 and z=1. The functions z and 1−z generate 1, and each corresponding open contains only one face, retracted onto by a constant map. The subset W={z=0} has codimension 1 in V but codimension 0 in that face, so it fails the proper-incidence hypothesis and is excluded.

*Needs:* §1.1; §1.4; SchemeKTheoryOperations §§2.5, 3.1–3.3, 4.3, 6.1, 6.7–6.9; GeneralAlgebraicKTheory §§4.6, 4.8, 4.14, 7.4–7.7; KTheoryFiniteLocalFields §3.0a; EnhancedDerivedSheaves §§0.1–0.4, E0.6.

### 2.0b Universal motivic Chern classes

For every field k, smooth quasi-projective finite-type X/k and p,n≥0, construct integral motivic Chern operations cₚ,ₙ:Kₙ(X)→CHᵖ(X,n) on the shared cycle complexes from the universal classes supplied by KTheoryFiniteLocalFields §6.10. The p=0 component is 1 at n=0 and 0 at n>0; rank is retained separately when forming the character. For p≥1 import the universal class Cₚ∈CHᵖ(B·GL_N,0) and its projective-bundle and Whitney identities from KTheoryFiniteLocalFields §6.10, pass to the stabilized classifying sheaves and, over infinite k, use moving over purely transcendental extensions and specialization to define pullback on the shared cycle complexes. This specialization requires k infinite: over 𝔽₂ the dense open 𝔸¹∖{0,1} has no rational point. Over a perfect field, including every finite field, instead represent the same universal classes in the functorial Tate complexes of MotivesAndAlgebraicCycles §4.4, use their pullbacks for every morphism of smooth k-schemes, and transport to the shared cycle theory by its §4.17 perfect-field comparison. Applied on each smooth term of the flat-face classifying nerve, this comparison identifies the universal classes and their descent maps. Prove agreement with the moving/specialization construction over infinite perfect fields. (MVW Definition 3.1, p.21, MVW line 1054; Theorem 19.1 and its sheaf comparison, pp.159–162, MVW line 5827–5842; Levine94 Lemma 4.3 and its proof, pp.289–290, Levine94 line 1585–1608.) Here the higher Chow group of B·GL_N is the cohomology of its flat-face simplicial cycle double complex. Positive K-degree gives additive maps; cₚ,₀ is the ordinary Chern operation, which need not be additive. (BF §3.2, pp.21–22, BF line 961 and BF line 974–997, read over ℂ; the arbitrary-field construction is Bloch86 §7, uncertified.)

The construction has the following API.

- The induced operations inherit stabilization, pullback naturality and the degree-zero Whitney sum identity from the supplied universal classes. Their classifying-sheaf maps use moving and specialization over infinite fields and the functorial Tate model over perfect fields, with agreement on the overlap, so different allowed representatives give the same operation. (MVW Definition 3.1 and Theorem 19.1, MVW line 1054 and MVW line 5827; BF §3.2, pp.21–22, BF line 974–997; Bloch86 §7, uncertified; KTheoryFiniteLocalFields §6.10.)
- For a field F and p=n≥1, the diagonal operation restricts by construction to KTheoryFiniteLocalFields §6.10’s diagonalChernMilnor, including its coefficient (−1)ⁿ⁻¹(n−1)! on Milnor symbols. (BF §3.2, pp.21–22, BF line 974–997; Bloch86 §7, uncertified; KTheoryFiniteLocalFields §6.10.)
- Newton polynomials and rank give a rational universal-class character; for n>0,p≥1 its component is (−1)ᵖ⁻¹cₚ,ₙ/(p−1)!, and in degree zero it is the supplied ordinary character. Construct this character on the stabilized classifying-space/descent diagrams with target the Dold–Kan realizations of the nonpositive good truncations of the rational cycle complexes shifted by 2p, with coherent open-restriction naturality before passing to homotopy groups. The denominator is a positive integer factorial, hence nonzero in ℚ. (BF §3.2, pp.21–22, BF line 974–997; Bloch86 §7, uncertified; KTheoryFiniteLocalFields §6.10.)

**Checks.**

- For a unit u in a field, c₁,₁[u]=[u]; for u=2 over ℚ, the 2-adic valuation of this class is 1. Thus the operation in positive K-degree is not zero. At the zero K-class c₀,₀=1 and cₚ,₀=0 for p>0, whereas the character is 0.
- Over 𝔽₂ on X=𝔾_m, the functorial Tate construction gives c₁,₁[t]=[t]∈CH¹(𝔾_m,1), with t-adic valuation 1. The dense open 𝔸¹∖{0,1} has zero 𝔽₂-points, so a rational specialization there cannot define this class. (MVW Theorem 4.1 and Corollary 4.2, p.25, MVW line 1204–1216.)
- On ℙ², c₂,₀(O(1))=0 whereas ch₂,₀(O(1))=h²/2≠0. For O(1)⊕O(−1), c₂,₀=−h² and ch₂,₀=h²; confusing the operations reverses this value.
- On diagonal Milnor symbols in degrees 1,2,3 the composite symbol-to-K then cₙ,ₙ is multiplication by 1,−1,2. The corresponding character is multiplication by 1 in all three degrees after rationalization; no division by 2 is made integrally.

*Needs:* §1.4; SchemeKTheoryOperations §§4.3, 6.7; SchemeAndStackFoundations §§5.3–5.8; KTheoryFiniteLocalFields §§3.0a, 6.10; MotivesAndAlgebraicCycles §§4.4, 4.8a, 4.17; GeneralAlgebraicKTheory §3.12; EnhancedDerivedSheaves §E2.6; Mathlib `CategoryTheory.Abelian.DoldKan.equivalence`; AlgebraicTopology Stage 8, item 2.

### 2.1 The geometric cycle-to-K map

For every smooth quasi-projective finite-type X over any field k and p,n≥0, construct the geometric weight-p cycle map cycₚ,ₙ:CHᵖ(X,n)⊗ℚ→Kₙ(X)^(p) on the supplied carriers. Represent the shared Chow class by an ordinary normalized cycle using §1.3, then apply §1.1's integral retraction to obtain a refined cycle with every face zero. Apply §2.0a's support-local leading structure-sheaf map on its face-admissible support, forget that cube support, and apply the ordered cube delooping. Refined boundaries are exactly the relative homotopy relations described in §2.0a, so the map descends to homology; the inverse of the refined inclusion on homology makes it independent of the retraction and the cycle representative. This construction is on cycle homology and K-groups. (BF Proposition 1.20 and §2.1, BF line 408–459 and BF line 639–660; Levine94, Theorem 3.1 and its construction, pp.275–277, Levine94 line 1197–1269.)

Use §2.0a’s supported multi-relative cube model, the supplied resolution and Adams operations, §1.1's refined-normalization homotopy equivalence, and §1.4’s moving comparisons. Normalize the same restriction diagrams before passing to their fibers; support enlargement compares local classes, and the chosen coordinate order and J transport the whole construction. The finite-field clause uses the supplier’s integral moving and transfer descent. Invertibility is proved in §2.2; the universal-class character on classifying-space diagrams is constructed independently in §2.0b.

The construction has the following API.

- The map cycₚ,ₙ is rationally additive, natural for flat morphisms, and natural for all morphisms of smooth quasi-projective schemes through §1.4. (Levine94 Theorem 3.1, p.276, Levine94 line 1210; Corollary 4.9, pp.297–298, Levine94 line 1794.)

**Checks.**

- At a point cyc₀,₀ sends 2 to [k²]=2; all positive-codimension degree-zero cycle groups are 0. A zero map fails.
- On ℙ¹, cyc₁,₀(h)=[O_point]=1−[O(−1)]; this is nonzero since its Euler characteristic is 1. An inverse divisor convention would give Euler characteristic −1.
- For X=∅ both source and target are 0. For X=Spec k⊔Spec k, cyc₀,₀ sends the cycle (2,1) to ([k²],[k])∈K₀(X)=ℤ², while the fundamental cycle (1,1) maps to [O_X].
- For X=Spec ℚ and p=n=1, cyc₁,₁ sends the cube point 2 to [2]∈K₁(ℚ)^(1), with 2-adic valuation 1.
- For §1.1's square cycle Z, the zero-face supported class has coordinates (+1,−1) at the distinct points 3 and 2, so its supported restriction is nonzero. After replacing Z by rZ both coordinates are 0 on every face, and the relative map is defined; simply forgetting support before refinement would lose this test.

*Needs:* §2.0a; §§1.1, 1.3–1.4; GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7; SchemeKTheoryOperations §§2.1–2.6, 4.3, 6.7–6.9, 7.1–7.3; KTheoryFiniteLocalFields §3.0a.

### 2.2 Weights and the higher comparison

For every X/k and n≥0 in 2.1, prove that cycₚ,ₙ is an isomorphism onto the simultaneous weight-p subspace for each p≥0. Define chₚ,ₙ as cycₚ,ₙ⁻¹ composed with the weight-p projector, and the total character as their finite sum. The total character is an isomorphism Kₙ(X)⊗ℚ≃⊕ₚ≥₀ H_M²ᵖ⁻ⁿ(X,ℚ(p)). Its pth component identifies the simultaneous Adams weight-p subgroup with CHᵖ(X,n)⊗ℚ and annihilates all other weights. For every integer a≥1, chₚ,ₙ(ψᵃx)=aᵖchₚ,ₙ(x). (Levine94, Theorem 3.1, p.276, Levine94 line 1210; BF Theorem 3.5, p.20, BF line 905).

Prove the geometric cycle-to-K map is an isomorphism on each weight by §1.1's refined-normalization equivalence and §2.0a’s multi-relative filtration, moving and resolution argument of Levine94. Sum the finite weight pieces supplied by SchemeKTheoryOperations; compare the diagonal tower edge on the common Milnor symbols. Projector denominators 2ⁱ−2ʲ are used only for i≠j, when they are nonzero rational numbers.

Prove separately that the inverse of Levine’s geometric cycle map equals the universal-class character of §2.0b on these K-groups in every degree and weight. The universal-class comparison route transports the universal motivic classes through the iterated-double cycle map, uses the splitting principle for their degree-zero bundle classes, and the moving/specialization construction over infinite fields and the functorial Tate construction over finite fields on the classifying diagrams; the composite is identity on each weight, so uniqueness of inverse identifies the maps. The coherently restriction-natural character of §2.0b supplies the space-level model of these inverse maps; this does not construct a space-level inverse to cycₚ,ₙ. Degree-zero agreement alone is not this argument. (Bloch86 §7, uncertified; Levine94 Theorem 3.1, p.276, Levine94 line 1210; BF §3.2, pp.21–22, BF line 961–997, for the universal construction over ℂ.)

The comparison has the following API.

- The inverse geometric weight-p cycle map equals the universal-class character on Kₙ(X)⊗ℚ for every n,p≥0 in the stated arbitrary-field scope. (Bloch86 §7, uncertified; BF §3.2, pp.21–22, BF line 961–997.)

**Checks.**

- At a point ch₀,₀([k²])=2 and all positive-weight degree-zero components vanish. For X=Spec k⊔Spec k and x=([k²],[k]), ch₀,₀(x)=(2,1), while ch₀,₀([O_X])=(1,1); neither value is the scalar sum of its coordinates. On ℙ¹, ch(O(1))=1+h and ch(O(−1))=1−h, so ch(O(1)⊕O(−1))=2 and the total Chern class is 1.
- For weights 0,1,2 the ψ² eigenvalues are 1,2,4, and their pairwise differences are −1,−3,−2; none is 0.
- On K₁(k)=k×, ψᵃ[u]=[uᵃ]=a[u], so the diagonal component has weight 1. At n=0,p=0 rank has eigenvalue a⁰=1, including a=1.
- The component of ch(O(1)) on ℙ² in weight 2 is h²/2; its coefficient 1/2 excludes an integral character with the same target.
- Both the inverse cycle map and the universal-class character send [O_point] on ℙ¹ to h in leading weight 1. In degree 1 both send the unit 2 over ℚ to [2], whose 2-adic valuation is 1; agreement only at n=0 would not exclude a zero map in positive degrees.
- On 𝔾_m over ℚ, both the inverse cycle map and the universal-class character send {2}·{t}∈K₂ to the ordered cube product [Γ₂]×[Γ_t]∈CH²(𝔾_m,2)⊗ℚ. Its uniformizer-last localization residue at t=0, using KTheoryFiniteLocalFields §3.0a’s diagonal boundary adapter, is [2]∈CH¹(Spec ℚ,1)⊗ℚ, whose 2-adic valuation is 1. Reversing the loop order gives −[2], of valuation −1. The native right-linear K-boundary instead has value −[2] on {2,t}, before the degree-two factor −1. Thus agreement in degrees 0 and 1 alone does not fix this sign.

*Needs:* §1.1; §2.0a; §2.0b; §2.1; SchemeKTheoryOperations §§6.8–6.9, 7.1–7.3; KTheoryFiniteLocalFields §3.0a.

### 2.3 Closed supports and boundary transport

For every field k, regular quasi-projective finite-type X/k, closed subset Z⊂X and n,p≥0, define CHᵖ_Z(X,n)⊗ℚ as H²ᵖ⁻ⁿ(fib(M(X,p)→M(X∖Z,p))⊗ᴸℚ), using the shared complexes and the pair-fiber convention. Construct the geometric cycle isomorphism CHᵖ_Z(X,n)⊗ℚ≃Kₙᶻ(X)^(p), where the right side is the simultaneous weight-p subspace of Kₙᶻ(X)⊗ℚ. Its inverse, summed over the finitely many supported weights, is the supported rational character Kₙᶻ(X)⊗ℚ≃⊕ₚ≥₀CHᵖ_Z(X,n)⊗ℚ. Full support gives CHᵖ(X,n)⊗ℚ≃Kₙ(X)^(p) and the total absolute comparison for every regular quasi-projective X/k. For smooth X/k this inverse agrees with §2.2's universal-class character, including on restriction fibers. No identification with Kₙ(Z) or CHᵖ(Z,n) without a purity shift is made. (Levine94, Theorem 3.4, pp.283–284, Levine94 line 1399–1425; the smooth universal-class identification is §2.2.)

Use §1.1's integral refined-normalization comparison on the restriction diagram of X and X∖Z before §2.0a's regular relative-cycle map: resolve the resulting facewise-zero cycle's coherent structure-sheaf class in the supported perfect K-model, project to its weight, and apply ordered cube relativity. For infinite k the face cubes and their good-position complements satisfy Theorem 2.7's splitting and moving conditions by coordinate retractions, as in Levine94's verification at Levine94 line 1223–1269; these products with regular X remain regular without a smoothness assumption. For finite k, regularity implies smoothness and KTheoryFiniteLocalFields §3.0a's finite-field moving/descent and transfers supply the same comparison; restriction followed by transfer is multiplication by the extension degree, invertible over ℚ. Construct the comparison on the iterated homotopy-fiber square for X and X∖Z, as in Levine94 line 1424–1437, and compare with the supplied supported K-spectrum. This route establishes the general comparison independently of the universal-class construction. On smooth X, the equality of §2.2 on restriction diagrams identifies the inverse with that character on fibers.

The comparison commutes with open restriction, forgetting and enlarging support and all maps of the localization sequences after the suspension dictionary. More precisely, for the cycle pair fiber the localization boundary is minus the raw connecting class b↦[(0,b)], and it corresponds to the supplier's right-linear B. Thus ch_Z B=−δ_raw ch_U. For the left-linear K-boundary multiply the degree-n right-hand side by (−1)ⁿ⁻¹. The source supplier has B[t]=+[O₀]; a lifted cube with boundary +[0] gives the raw pair-fiber class −[0]. Section 5.1 applies the same suspension transport to Deligne fibers in their smooth complex scope. (Levine94 Theorem 3.4, pp.283–284, Levine94 line 1405–1437; GeneralAlgebraicKTheory §§8.12–8.13.)

The construction has the following API.

- A flat morphism f:X′→X of regular quasi-projective k-schemes, of pure relative dimension on each component and with f⁻¹Z⊂Z′, induces a commuting square of supported characters with the cycle flat pullback and supplied K-pullback. When both schemes are smooth, §1.4 supplies this compatibility for every morphism of pairs. Identities, composition and support enlargement commute. (Levine94 Theorem 3.4, pp.283–284, Levine94 line 1405–1437; Lemma 2.2(i), p.261, Levine94 line 777–781, and Corollary 4.9 in its smooth scope, pp.297–298, Levine94 line 1794–1820; SchemeKTheoryOperations §§2.2, 3.1–3.3.)
- The restriction-diagram comparison identifies the connecting morphisms after the suspension dictionary. Degreewise boundary orientation is exported together with the comparison, so native B, its left-linear adapter and a cochain fiber boundary remain distinguishable. (Levine94 Theorem 3.4, pp.283–284, Levine94 line 1399–1437; GeneralAlgebraicKTheory §§7.5–7.7.)

**Checks.**

- Z=∅ gives 0≃0, and Z=X gives the regular absolute comparison because the open term is 0. For X=Spec k⊔ℙ¹ and x=([k²],[O_ℙ¹]), the weight-zero degree-zero component is (2,1), and CH¹(X,0)⊗ℚ=0⊕ℚ.
- On (𝔸¹,{0}), ∂□Γ_t=[0]; in the fiber with d(a,b)=(da,res(a)−db), d(Γ_t,0)=([0],t), so [(0,t)]=−[([0],0)]. The supplied K-boundary has B[t]=+[O₀], and minus the raw cycle boundary sends [t] to +[0].
- For Z=V(xy)⊂𝔸² the degree-zero leading support cycles have two components, with coefficients (1,1); replacing Kᶻ(𝔸²) by K(Z) would assert an unavailable regular dévissage.
- For ℓ=2 or 3, let k=𝔽_ℓ(t), L=k[s]/(s^ℓ−t). The field L has local dimension and embedding dimension 0, but Ω¹_L/k=L ds≠0 and L⊗ₖL=L[ε]/(ε^ℓ) with ε≠0. Thus Spec L is regular and not smooth over k. For X=Spec L,Z=X,p=n=0 both comparison groups are ℚ and 1 maps to [L]=1; a smoothness requirement would omit this nonzero comparison.
- With the same k,L and X=𝔸¹_L,Z={u=0}, p=1,n=0, CH¹_Z(X,0)⊗ℚ=ℚ=K₀ᶻ(X)^(1) and the divisor generator maps to [O_Z] with coefficient +1. The boundary of u is +1 for B, −1 for the raw cycle pair fiber, and +1 after its minus-sign adapter. Identity acts by +1, and enlarging support from {0} to {0,1} sends 1 to (1,0).

*Needs:* §2.0a; §§1.1, 1.3–1.4; SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 6.8–6.9; GeneralAlgebraicKTheory §§4.6, 4.8, 4.14, 7.4–7.7, 8.12–8.13; KTheoryFiniteLocalFields §3.0a; EnhancedDerivedSheaves §§0.1–0.4, E0.6. The additional universal-class identification on smooth X uses §§2.0b–2.2.

### 2.4 Products and degree-zero agreement

For X,Y smooth quasi-projective over k, x∈Kₙ(X)⊗ℚ and y∈Kₘ(Y)⊗ℚ, the weight-(p+q) character of x×y is Σᵢ₊ⱼ₌p₊q chᵢ,ₙ(x)×chⱼ,ₘ(y), and diagonal pullback gives the internal formula. The cycle product is Levine94 Theorem 5.2, p.313, Levine94 line 2226; compatibility of the character with it is proved here by the tensor-pairing route below. In degree zero this character equals SchemeKTheoryOperations §7.2 on the same K₀ carrier: ch(E)=Σ Chern roots exp(c₁), the rank is ch₀, ch(L)=exp(c₁L), and for an integral codimension-c closed V⊂X, chⱼ(O_V)=0 for j<c and ch_c(O_V)=[V]; this class may also vanish. In positive K-degree, chₚ,ₙ=(−1)ᵖ⁻¹ cₚ,ₙ/(p−1)! for p≥1 with the universal higher Chern-class convention. (For the universal construction and degree-zero agreement: BF §3.2, pp.21–22, BF line 961–997; the higher coefficient follows from the Newton-polynomial calculation below.)

Compare universal Chern classes and use the splitting principle for K₀. On higher homotopy the decomposable Chern monomials disappear, leaving the Newton-polynomial coefficient (−1)ᵖ⁻¹/(p−1)!. Tensor pairing coherence and the same multirelative cycle product prove multiplicativity. Agreement with §7.2 is an equality of maps after its perfect/vector-bundle comparison.

**Checks.**

- On ℙ¹, [O_point]=1−[O(−1)] and ch=1−(1−h)=h. Thus the leading sign is +1.
- For {0}⊂𝔸¹, the resolution O —t→ O gives [O₀]=1−1=0 in K₀(𝔸¹), and [{0}]=div(t)=0 in CH¹(𝔸¹). Every character component vanishes; the leading-class formula is 0=0.
- For n>0 the factors relating chₚ,ₙ to cₚ,ₙ at p=1,2,3 are 1,−1,1/2; in particular ch₂,₂=−c₂,₂.
- The external product of bundles of ranks 2 and 3 has ch₀=6=2·3; the unit rank 1 preserves every character component.
- On ℙ¹, put ξ=1−[O(−1)]∈K₀ and h=[point]∈CH¹(ℙ¹,0). Then ξ²=0, ch(ξ)=h and h²=0, hence ch(ξ²)=0=ch(ξ)²; the character product formula gives the same vanishing as the Chow product.

*Needs:* §2.0b; §2.2; §2.3; §2.0a; §1.4; GeneralAlgebraicKTheory §7.4; SchemeKTheoryOperations §§6.8, 7.1–7.3; SchemeAndStackFoundations §§5.3–5.8.

### Examples

On ℙ¹, ch(O(a))=1+a h and ch(1−O(−1))=h, h=[point]. On a field the first higher component is the unit group in weight one. Arbitrary singular closed supports occur inside a regular ambient scheme; Spec 𝔽_ℓ(t)[s]/(s^ℓ−t) over 𝔽_ℓ(t), for ℓ=2 or 3, also tests full support without smoothness.

### Dependencies

Layer 1; GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13; SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3; KTheoryFiniteLocalFields §§3.0a, 6.10; MotivesAndAlgebraicCycles §§4.4, 4.8a, 4.17; SchemeAndStackFoundations §§5.3–5.8; EnhancedDerivedSheaves §§0.1–0.4, E0.6, E2.6; AlgebraicTopology Stage 8, item 2.

## Layer 3: logarithmic forms and the real Deligne complex

### 3.1 The smooth logarithmic Dolbeault algebra

For a smooth complex algebraic variety W and an SNC divisor D, with open X=W∖D, define E_W(log D) as the subalgebra of j_* smooth complex forms generated locally over smooth forms on W by log|zᵢ|², dzᵢ/zᵢ and dz̄ᵢ/z̄ᵢ in holomorphic SNC coordinates. Retain its real structure, Dolbeault bigrading, Hodge filtration by holomorphic degree and the image weight filtration from the real analytic logarithmic model. Use native form and pullback carriers. It is the image algebra, rather than an abstract tensor product with the smooth functions. (Burgos94, §2, pp.65–67, Burgos94 line 155; BKK Definition 5.20, p.116, BKK line 4217).

Coordinate changes multiply boundary parameters by holomorphic units, so their logarithms and logarithmic derivatives differ by smooth terms. This proves independence of charts. Define the algebra as an actual subsheaf of smooth forms on X; equality and all operations are inherited from that inclusion.

The construction has the following API.

- The operators ∂ and ∂̄ preserve the algebra, have bidegrees (1,0),(0,1), square to zero and anticommute; conjugation interchanges them, and d=∂+∂̄. (Burgos94 §2, pp.65–67, Burgos94 line 155–190; BKK Definition 5.20, p.116, BKK line 4217.)
- For an algebraic morphism of SNC pairs whose open part maps to the open part, pullback maps logarithmic forms to logarithmic forms, preserves the real structure and F, commutes with d and wedge, and satisfies identity and composition. (Burgos94 §2, pp.65–67, Burgos94 line 155–190; BKK Definition 5.20, p.116, BKK line 4217.)
- The inclusion into forms on X is injective; local sections equal there are equal in the logarithmic algebra. Empty boundary recovers the native smooth Dolbeault algebra. The constant function 1 is its closed real identity, and logarithmic pullback preserves it. (Burgos94 §2, pp.65–67, Burgos94 line 155–190; BKK Definition 5.20, p.116, BKK line 4217.)

**Checks.**

- On a punctured disk d log|z|²=dz/z+dz̄/z̄ and ∮dz/z=2πi. Omitting the logarithmic function or its conjugate derivative fails this identity.
- If D=∅ the algebra is the smooth forms on W; for W=∅ every degree is 0.
- Near z=0, log|z|² is admitted while |z|⁻² is not a smooth coefficient polynomial in logarithmic generators; a model admitting arbitrary poles is too large.
- The ordered residue of (dz/z)∧(dw/w) at z=w=0 is 1; reversing the order gives −1.

*Needs:* ComplexComparisonPartII §§C−1.1, C−1.4, C5.1, C5.5; DifferentialGeometry Layers 0–1; ComplexKahlerGeometry K1–K2.

### 3.2 Geometric filtered comparison

For every smooth separated finite-type complex X and every smooth proper SNC compactification j:X→W, the holomorphic logarithmic complex maps by a bifiltered quasi-isomorphism for (W,F) to E_W(log D), and the real logarithmic model represents Rj_*ℝ. On hypercohomology the rational structure and F define the geometric mixed Hodge structure; its cohomological weight WₘHⁱ is induced by Wₘ₋ᵢ on the logarithmic complex. The Hodge spectral sequence degenerates at E₁ and the weight spectral sequence at E₂. Every morphism of compactifications fixing X induces a real F-filtered quasi-isomorphism on derived global sections. No invariance of the unshifted residue filtration W on complexes under a blowup is asserted. (DeligneHodgeII, Proposition 3.1.8, Theorem 3.2.5 and Corollary 3.2.13, pp.33,35–38; DeligneHodgeII line 1044, DeligneHodgeII line 1142, DeligneHodgeII line 1242; Burgos94 Theorem 2.1/Corollary 2.2, p.67, Burgos94 line 181).

Import ComplexComparisonPartII §C5.6’s regularSingularDeRhamComparison for the trivial connection with Ē=O_W: every residue is 0 and hence is not a positive integer. This supplies the all-dimensional unfiltered logarithmic comparison. Identify the residue graded pieces with shifted forms on intersections of boundary components, including their order signs and Tate markings. Apply proper geometric Hodge theory to these strata; strictness of the resulting opposed filtrations gives the two degenerations and the shifted cohomological weight. For its smooth resolution prove the following local estimates here. In an SNC coordinate polydisk U⊂ℂᵈ with coordinate hypersurfaces Hᵢ, let f be smooth and flat on their union. For any fixed nonnegative integers aᵢ,bᵢ,cᵢ, both f/∏ᵢ(zᵢ^(aᵢ)z̄ᵢ^(bᵢ)) and f∏ᵢ(log|zᵢ|²)^(cᵢ) on the complement extend by 0 smoothly and remain flat on that union; so does the combined expression f∏ᵢ(zᵢ^(−aᵢ) z̄ᵢ^(−bᵢ)(log|zᵢ|²)^(cᵢ)). Derivative estimates follow from flatness to every order, and the supplier’s Whitney/Borel and real-analytic flat-ideal results supply the remaining local resolution steps. (Burgos94 Proposition 4.1, p.75, Burgos94 line 379–381; Theorem 2.1, p.67, Burgos94 line 181.) Fine acyclicity then proves the Burgos comparison. For a refinement, the underlying Betti map is identity and the cohomology map is a strict mixed-Hodge isomorphism; E₁ degeneration upgrades it to the F-filtered comparison.

The local estimates have the following API.

- Division of a smooth function flat on the union of the coordinate hypersurfaces by any fixed coordinate-and-conjugate monomial extends by 0 smoothly and flat on that union. (Burgos94 Proposition 4.1, p.75, Burgos94 line 379.)
- Multiplication of that function by fixed nonnegative integral powers of the logarithms, also in combination with that denominator, has the same smooth flat extension. (Burgos94 Proposition 4.1, p.75, Burgos94 line 379.)

**Checks.**

- For X=𝔾_m⊂ℙ¹, the trivial extension has residues (0,0), so §C5.6 gives H¹=ℂ·dz/z with positive-loop period 2πi. It has type (1,1) and weight 2; on both the holomorphic and smooth logarithmic complexes dz/z lies in W₁ and not W₀, and 1+cohomological degree 1=2. Calling that weight 1 would be wrong.
- Blow up (0,0) in (ℙ¹)² compactifying 𝔾_m². H⁰,H¹,H² have complex dimensions 1,2,1 before and after; the dlog x,dlog y and dlog x∧dlog y classes are unchanged. The extra boundary component changes the residue E₁ diagram, so W-filtered quasi-isomorphism is not asserted.
- For a point the only Hodge component is H⁰,⁰=ℂ and the weight is 0; for ∅ all components are 0.
- On ℂ set f(z)=exp(−1/|z|²), f(0)=0. Every derivative at 0 of f/z² and f log|z|² is 0; at z=1 the first value is e⁻¹. Thus flat extension is smooth without being the zero function.
- With f(z)=1, 1/z has a pole and log|z|² diverges at 0; the flatness hypothesis cannot be omitted. With all exponents 0, the extension is f itself and has its original values.
- On ℂ², f(z,w)=exp(−1/|zw|²) off zw=0 and 0 on the axes is flat on their union. The extension of f log|z|²/(zw̄) has zero jets on both axes and value −(e⁻¹ᐟ⁴ log 4)/2 at (z,w)=(−2,1), excluding a changed denominator or an extension by an unrelated value.

*Needs:* §3.1; ComplexComparisonPartII §§C5.1, C5.3, C5.5–C5.6; EtaleCohomologyFoundations §§G.1–G.3; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.4; EnhancedDerivedSheaves §§0.1–0.4, E2.6; Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`; Tau Ceti `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`; gap:smooth-whitney-extension; gap:flat-ideal-regular-situation.

### 3.3 The Deligne functor on Dolbeault complexes

For every real Dolbeault cochain complex A bounded below, with A_C the direct sum of its (r,s)-pieces and conjugation exchanging r,s, and every integer p, define its Deligne cone as fib(A_R(p)⊕FᵖA_C→A_C), with arrow (a,f)↦f−a and A_R(p)=(2πi)ᵖA_R. Define its small Dolbeault model D(A,p) by Dᵃ=A_Rᵃ⁻¹(p−1)∩Fᵃ⁻ᵖ,ᵃ⁻ᵖ for a≤2p−1, and Dᵃ=A_Rᵃ(p)∩Fᵖ,ᵖ for a≥2p. Here Fʳ,ˢ projects to types at least (r,s). Its differential is minus the projection of d to types at least (a−p+1,a−p+1) below degree 2p−1, equals −2∂∂̄ at degree 2p−1, and equals d above it. Construct mutually inverse-up-to-homotopy maps with the cone, with inclusion D(A,p)→cone followed by projection cone→D(A,p) equal to the identity of D(A,p), and projection followed by inclusion homotopic to the identity of the cone by the specified degree −1 contraction. (BKK, Definitions 5.7–5.10 and Proposition 5.12, pp.110–113; BKK line 3999, BKK line 4035 and BKK line 4060).

Use the type projections and πₚ(z)=(z+(−1)ᵖz̄)/2 to split the real and Hodge cone. The inclusion below the critical degree sends x to (∂xᵖ⁻¹,ᵃ⁻ᵖ−∂̄xᵃ⁻ᵖ,ᵖ⁻¹, 2∂xᵖ⁻¹,ᵃ⁻ᵖ,x); above it sends x to (x,x,0). The cone projection and the complementary-type contraction prove the stated homotopies. The special differential follows from ∂∂̄+∂̄∂=0.

The construction has the following API.

- The explicit inclusion, projection and degree −1 contraction compare the two models, naturally for real type-preserving cochain maps; shifting these comparison maps in the category of cochain complexes preserves their homotopy identities, and finite direct sums are preserved. This does not assert that an arbitrary cochain shift carries the original Dolbeault bigrading. (BKK Proposition 5.12 and Remark 5.11, pp.112–113, BKK line 4056–4111.)
- The Deligne functor is exact on short exact sequences of Dolbeault complexes compatible with real and type decompositions; a real F-filtered quasi-isomorphism induces a Deligne quasi-isomorphism. (BKK Proposition 5.12 and Remark 5.11, pp.112–113, BKK line 4056–4111.)
- A (p−1,p−1)-form has Deligne degree 2p−1 and differential −2∂∂̄ into degree 2p; this is an ordinary-form degree jump of two. (BKK Proposition 5.12 and Remark 5.11, pp.112–113, BKK line 4056–4111.)

**Checks.**

- For A=ℂ in degree 0, H⁰D(A,0)=ℝ and H¹D(A,1)=ℂ/(2πiℝ)≃ℝ by Re; all other degrees vanish in these two cases.
- Reversing the cone arrow from f−r to r−f is a chain isomorphism by (r,f,ω)↦(r,f,−ω). At a point in weight 1 both quotients are ℂ/iℝ with coordinate Re; in weights 2 and 3 the quotient lines are iℝ and ℝ. At z=3+4i the raw quotient coordinates are 3,4i,3 and the negated representative has −3,−4i,−3. Transporting the quotient identification through the same sign gives 3,4i,3 again; keeping the raw coordinate unchanged would introduce a minus sign.
- For the same point and p=−1, F⁻¹A=A, so H⁰ is ℝ(−1) and H¹=0. A rule forcing p≥1 would lose this case.
- For p=1 and x=|z|², ∂∂̄x=dz∧dz̄, hence d_Dx=−2dz∧dz̄; replacing the top operator by d would have degree and sign wrong.
- The point complex A has its unique type (0,0). Its ordinary shift A[1] is concentrated in degree −1; a one-dimensional complexification cannot have a conjugation-stable integral Dolbeault bigrading of that odd total degree. The comparison may be shifted as a cochain comparison without defining D(A[1],p).
- For A=0 every cone term, D term and contraction is 0. On the point at weight 1, inclusion sends r to (0,0,r) and projection sends this back to r. The other composite sends (0,0,log 2+iθ) to (0,0,log 2), which differs when θ≠0; it is homotopic to identity, rather than equal to it.

*Needs:* Mathlib `CochainComplex.mappingCone`; Mathlib `CochainComplex.mappingCone.inl_v_d`; Mathlib `CochainComplex.mappingCone.inr_f_d`; §3.1; ComplexKahlerGeometry K1–K2; Tau Ceti `TauCeti.gradedCochainComplex`.

### 3.4 The compactification-independent logarithmic realization

For every smooth separated finite-type complex X, on its small Zariski site form the presheaf assigning to U the filtered colimit of Γ(W_U^an,E_W_U(log D_U)) over smooth proper SNC compactifications U→W_U with boundary D_U. Use universe-small skeletons of these diagrams and let E_log be the degreewise Zariski sheafification of this presheaf of Dolbeault algebras. For every integer p set D_log(X,p)=D(Γ(X_Zar,E_log),p), using §3.3. The logarithmic form sheaves on each compactification use the analytic topology; the colimit presheaf is sheafified in the Zariski topology. It represents fib(RΓ(X,ℝ(p))⊕RΓ(W,FᵖΩ_W(log D))→RΓ(X,ℂ)), with arrow filtered comparison minus real inclusion. Each fixed compactification maps by a quasi-isomorphism to this object. Refinement comparisons compose, their common-refinement identifications satisfy the three-choice cocycle, and algebraic pullbacks, restrictions and finite disjoint unions are independent of the auxiliary compactifications. (BKK, Theorem 5.22, formula 5.23, Proposition 5.29 and Corollary 5.31, pp.117–119; BKK line 4239, BKK line 4255–4272, BKK line 4297, BKK line 4310–4315).

Use EtaleCohomologyFoundations §G.2 to compactify each smooth separated finite-type X, then resolve and principalize outside X to obtain a smooth proper SNC choice. The quasi-projective case can use the supplied projective sncCompactification. Apply the same resolution to the dense common-refinement category; properness alone never implies projectivity. The equivalences of 3.2 satisfy its coefficient comparison principle. Prove finite Zariski-open Mayer–Vietoris for the F-graded logarithmic presheaf using strict mixed-Hodge maps. Acyclicity of the associated type sheaves in the Zariski topology then compares the presheaf colimit with the global sections of its degreewise Zariski sheafification. (BKK Proposition 5.29 and its proof, p.119, BKK line 4297–4308.) In general they need not be equal as spaces of sections. Resolve graph compactifications to construct algebraic pullbacks.

The construction has the following API.

- A refinement arrow fixing X gives a quasi-isomorphism; two refining cones induce the same derived comparison, with identity, inverse and cocycle laws. (BKK formula 5.23, Proposition 5.29 and Corollary 5.31, pp.117–119, BKK line 4263–4315; EnhancedDerivedSheaves §E2.6.)
- Every morphism f:X→Y of smooth separated finite-type complex schemes induces f*:D_log(Y,p)→D_log(X,p), with coherent identity/composition and restriction maps in the enhanced derived category; on fixed pairs it is the actual logarithmic pullback. (BKK formula 5.23, Proposition 5.29 and Corollary 5.31, pp.117–119, BKK line 4263–4315; EnhancedDerivedSheaves §E2.6.)
- D_log(∅,p)=0 and for a finite Zariski-open cover its augmented Čech totalization computes D_log(X,p); this comparison is natural for restriction. (BKK formula 5.23, Proposition 5.29 and Corollary 5.31, pp.117–119, BKK line 4263–4315; EnhancedDerivedSheaves §E2.6.)
- For a sheaf of Dolbeault complexes on X_Zar, compatible morphisms from the logarithmic presheaf diagram extend uniquely from its degreewise Zariski-sheafified colimit. A change of small skeleton induces the unique colimit comparison preserving those maps; the geometric comparisons of this section identify its derived global sections. (BKK formula 5.23, Proposition 5.29 and Corollary 5.31, pp.117–119, BKK line 4263–4315; EnhancedDerivedSheaves §E2.6.)

**Checks.**

- For X=𝔸¹ and p=1, H¹D_log(X,1)=ℝ consists of constants, agreeing with ℂ/(2πiℝ) by real part. The pluriharmonic function Re z has values 0 and 1 at 0 and 1 and satisfies −2∂∂̄Re z=0, but its pole growth at infinity excludes it on every nonempty Zariski open. Analytic sheafification would admit it locally and create an extra degree-one class, with no incoming boundary.
- On 𝔾_m², let W′ be the blowup of (ℙ¹)² at (0,0), with chart x=e,y=eu. Logarithmic pullback sends log|x| to log|e|, including logarithmic growth along the exceptional divisor. Both restrict to log|x| on 𝔾_m², with value log 2 at (2,3); swapping it with log|y| would give log 3.
- For 𝔾_m² and the boundary blowup of (ℙ¹)², the loop periods of dlog x,dlog y are (2πi,0),(0,2πi) in both choices, and the product period is (2πi)².
- For a point disjoint from ℙ¹, H_D⁰(−,ℝ(0))=ℝ²; for the empty open its restriction target is 0.

*Needs:* §3.2; §3.3; EtaleCohomologyFoundations §§G.1–G.3; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4; EnhancedDerivedSheaves §§0.1–0.4, E1.4, E2.6.

### Examples

For a punctured coordinate disk, the period of dz/z is 2πi. On a point, weight 0 has H⁰=ℝ and weight 1 has H¹=ℂ/ℝ(1)≃ℝ. Two compactifications of the two-dimensional torus are compared after blowing up a boundary crossing.

### Dependencies

ComplexComparisonPartII §§C−1.1, C−1.4, C5.1, C5.3–C5.6; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4; EtaleCohomologyFoundations §§G.1–G.3; EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6; DifferentialGeometry Layers 0–1, 5–9; ComplexKahlerGeometry K1–K2. The proper algebraic case uses ComplexComparisonPartII §C5.3’s properPureHodge and relativeHodgeBundles; the smooth local-resolution route also needs gap:smooth-whitney-extension and gap:flat-ideal-regular-situation.

## Layer 4: the logarithmic Deligne product

### 4.1 The full Dolbeault product

For every real Dolbeault algebra A, meaning a real Dolbeault complex as in 3.3 with an associative graded-commutative differential product respecting types, without a unit requirement, equip ⊕ₚ∈ℤD(A,p) with the following bilinear product. Put l=a+b, r=p+q, πᵣ(z)=(z+(−1)ʳz̄)/2 and rₚ(x)=2πₚ(Fᵖdx). For x∈Dᵃ(A,p), y∈Dᵇ(A,q), if a<2p and b<2q use (−1)ᵃrₚ(x)∧y+x∧r_q(y). If a<2p, b≥2q and l<2r, use Fˡ⁻ʳ,ˡ⁻ʳ(x∧y); if instead l≥2r, use Fʳ,ʳ(rₚ(x)∧y)+2πᵣ∂(x∧y)ʳ⁻¹,ˡ⁻ʳ. If both degrees are at or above their cutoffs, use x∧y. Define the remaining case by graded symmetry. On odd critical degrees this is x•y=−∂x∧y+∂̄x∧y+x∧∂y−x∧∂̄y. Apply the construction to D_log and obtain external products by the two projections. (BKK, Definitions 5.13–5.14 and special-degree formulas, pp.113–115; BKK line 4121, BKK line 4129 and BKK line 4176).

Split the cone product into real, filtered and homotopy coordinates, and apply the explicit contraction of 3.3. Verify each degree range by type projection; the swapped mixed case is forced by the same formula. This yields the specific BKK product, with its critical-degree identity, rather than leaving an unspecified cup product on cohomology.

The construction has the following API.

- For homogeneous degrees a,b, d_D(x•y)=d_Dx•y+(−1)ᵃx•d_Dy, and x•y=(−1)ᵃᵇy•x. (BKK Definition 5.14 and special-degree formulas, pp.113–115, BKK line 4129–4180.)
- If A has a specified real multiplicative identity 1_A of type (0,0), its class in D⁰(A,0) is closed and is a two-sided unit. Products are natural for real Dolbeault algebra maps; the unit assertion is natural for maps preserving the specified identities. The geometric logarithmic algebras have the constant identity 1. Products in high even critical degrees are the native wedge product. (BKK Definition 5.14 and special-degree formulas, pp.113–115, BKK line 4129–4180.)
- At a=2p−1 and b=2q−1 the displayed four-term formula holds as a form identity, including when one or both inputs are not closed. (BKK Definition 5.14 and special-degree formulas, pp.113–115, BKK line 4129–4180.)

**Checks.**

- For p=q=1 on 𝔾_m, x=log 2 and y=log|t| give x•y=(log 2)/2·(dt/t−dt̄/t̄)=i log 2 darg t; y•x is its negative.
- On a point log 2•log 3=0 because every one-form is 0; its geometric identity 1∈D⁰(−,0) multiplies log 2 to log 2.
- For A=tℝ[t] in type (0,0), with d=0, the weight-zero Deligne product is polynomial multiplication. For every e∈A, the coefficient of t in et is 0, whereas that in t is 1, so no unit is asserted. For A=ℝ[t], the specified identity satisfies 1•t=t. The inclusion tℝ[t]→ℝ[t] preserves products without supplying an identity in its source.
- On ℂ, x=|z|² and y=1 in weight one have x•y=−z̄ dz+z dz̄ and d_D(x•y)=−2dz∧dz̄, equal to d_Dx•1. Replacing the critical operator by the ordinary d fails.

*Needs:* §3.3; §3.4; ComplexKahlerGeometry K1–K2; DifferentialGeometry Layers 0–1; EnhancedDerivedSheaves §0.3.

### 4.2 Associativity and choice compatibility

For the product of 4.1 construct a natural degree −1 trilinear homotopy h_a satisfying d_Dh_a+h_ad=((x•y)•z)−x•(y•z), with tensor differential on the input. It vanishes on all triples x∈D²ᵖ(A,p), y∈D²ᑫ(A,q), z∈D²ʳ(A,r), without a closedness hypothesis. All refinement, restriction and algebraic pullback comparisons preserve this product in the enhanced derived category. Thus the Deligne cohomology of every real Dolbeault algebra has an associative graded-commutative multiplication graded by degree and twist; it has the unit [1_A] when A has the specified identity of 4.1, with unit preservation for identity-preserving maps. For the geometric logarithmic algebras these give compactification-independent unital cohomology rings. (BKK, Proposition 5.15, p.114, BKK line 4142; BF Proposition 1.26, p.10, BF line 506).

Transfer the associative cone product through the explicit deformation retract, symmetrize with the Koszul signs, and write its associator as a boundary using the contraction. This specifies the homotopy as an operation, not merely an existential cohomological associativity. Naturality of the contraction transports it through the entire refinement diagram. The degree −1 is forced by the associator identity; BF line 508’s displayed codomain lacks this shift.

**Checks.**

- For even critical-degree forms both bracketings equal x∧y∧z and h_a=0. In weight zero on ℂ, take x=Re z and constants 2,3: both bracketings are 6 Re z, with value 6 at z=1, although d_Dx=dx≠0. The homotopy identity gives dh_a+h_ad=0 here as well.
- For three weight-zero point constants 2,3,5 the bracketings are both 30; an odd triple of point weight-one classes has product 0 in either bracketing. In the nonunital type-(0,0) algebra tℝ[t], (t•t)•t=t•(t•t)=t³; cohomology retains this associative multiplication without an identity.
- The dlog x∧dlog y period on the positive product torus is (2πi)² before and after a boundary blowup. Exchanging the two circles changes the period to −(2πi)² in both choices.

*Needs:* §4.1; §3.4.

### Examples

At weights p=q=1, constants have zero odd-degree product. On 𝔾_m the product of log 2 with log|t| is i log 2 darg t and its positive-circle period is 2πi log 2. These witnesses fix the sign in both the Dolbeault and totalized models.

### Dependencies

Layer 3, the native wedge algebra and pullbacks supplied by DifferentialGeometry Layers 0–1, ComplexKahlerGeometry K1–K2’s type calculus, and EnhancedDerivedSheaves §0.3.

## Layer 5: supports, semipurity and the cycle resolution

### 5.1 Logarithmic support fibers

For every smooth separated finite-type complex X, closed subset Z⊂X and integer p, define D_log,Z(X,p)=fib(D_log(X,p)→D_log(X∖Z,p)). In cochain degree a its pair model is D_logᵃ(X,p)⊕D_logᵃ⁻¹(X∖Z,p), with d(ω,g)=(d_Dω,res(ω)−d_Dg). Give its explicit isomorphism to Mathlib’s mapping cone shifted by −1, its forget-support projection and its restriction and support-enlargement maps. Its cohomology is denoted H_D,Zᵃ(X,ℝ(p)). (BF, Definition 1.28 and Lemma 1.29, p.11, BF line 517; BFT §1.1, p.2, BFT line 63).

The pair differential squares to zero because restriction commutes with d_D. Relative to Mathlib’s source-shift-first cone coordinates, negating the second coordinate after shifting identifies the displayed fiber differential. Construct the localization triangle and all support maps in the enhancement; finite-open descent gives excision and the Mayer–Vietoris triangle for two closed supports.

The construction has the following API.

- For Z⊂Z′, restriction X∖Z′⊂X∖Z induces a map D_log,Z→D_log,Z′ commuting with forget-support. Open restriction and iterated enlargements compose as their actual diagrams do. (BF §1.9, p.11, BF line 517–528; BF §5.2, pp.33–35, BF line 1539.)
- The fiber triangle supplies the long exact sequence and excision; in the displayed pair coordinates the connecting class of a closed open-complement form b is [(0,b)]. Record this raw connecting map independently of a purity or K-theory residue adapter. (BF §1.9, p.11, BF line 517–528; BF §5.2, pp.33–35, BF line 1539.)
- The product of classes with supports Z,W lands in support Z∩W, with external support Z×W on a product scheme, and agrees with forgetting support and the product of Layer 4. (BF §1.9, p.11, BF line 517–528; BF §5.2, pp.33–35, BF line 1539.)
- The pair coordinates determine elements and maps into the fiber. A pair (ω,g) is a cocycle exactly when d_Dω=0 and res ω=d_Dg; its zero and sum are computed coordinatewise. (BF §1.9, p.11, BF line 517–528; BF §5.2, pp.33–35, BF line 1539.)

**Checks.**

- For Z=∅ the fiber of identity is contractible; for Z=X it is D_log(X,p) because D_log(∅,p)=0.
- For the map 0→ℝ[0], the fiber is ℝ in cochain degree 1, not degree −1. For a pair (ω,g), d² has second coordinate res(dω)−d(res ω−dg)=0.
- For {0}⊂{0,1}⊂𝔸¹, degree-two supported coordinates send r↦(r,0), and the direct composite agrees; reversing the arrow would have source ℝ² and lose this inclusion.
- Classes supported on the disjoint divisors V(x) and V(x−1) of 𝔸²_ℂ multiply into support ∅, whose fiber is contractible, so their product is 0 in cohomology.

*Needs:* §3.4; §4.2; Mathlib `CochainComplex.mappingCone`; Mathlib `CochainComplex.mappingCone.inl_v_d`; Mathlib `CochainComplex.mappingCone.inr_f_d`; EnhancedDerivedSheaves §§0.1–0.4.

### 5.2 Semipurity with singular support

For every smooth equidimensional separated finite-type complex X, p≥0 and closed Z whose every irreducible component has codimension at least p, H_D,Zᵃ(X,ℝ(p))=0 for every integer a<2p. In degree 2p, cycle classes give a canonical isomorphism from the direct sum of the lines ℝ[V], indexed by V⊂Z with codim_X V=p, to H_D,Z²ᵖ(X,ℝ(p)), with finite support and multiplicities. Restriction and support enlargement commute with these classes. In the normalized logarithmic form model a cocycle (ω,g) represents Σm_V[V] if and only if its current extensions satisfy −2∂∂̄[g]=[ω]−Σm_Vδ_V. Here the criterion uses the normalized currents corresponding to these forms, and is not a new current carrier or a product of arbitrary currents. For this even-degree representative criterion, in complex dimension d the form-current pairing is [α](η)=(2πi)⁻ᵈ∫_X η∧α (BKK equation (5.38), p.122, BKK line 4395–4408), and δ_V(η) is (2πi)⁻⁽ᵈ⁻ᵖ⁾ times the integral of η over the regular locus of V (BKK Definition 5.41, p.123, BKK line 4450–4462). These are scalar multiples of the supplied native form and cycle currents in the indicated degrees. (BF, Equation 1.30 and Proposition 1.31, p.11, BF line 530; BKK §5.6 and Proposition 5.58, pp.132–133, BKK line 4795 and BKK line 4841).

First prove the local Betti support calculation: a complex normal p-disk has one oriented class in degree 2p and none below. Use compatible algebraic stratification, excision and the long exact sequence for nested supports to remove higher-codimension singular strata; these cannot contribute at or below 2p. This yields Betti vanishing and the component basis with pure type (p,p) in top degree. The filtered cone of restriction, using the strict cohomology maps of 3.2, then gives the Deligne assertion. Normalize its fundamental class by the complex orientation and the supplied integration class. Resolve supports only to justify locally integrable extensions and prove both directions of the current criterion; exact current differences have zero local coefficients.

The construction has the following API.

- The underlying Betti group with supports is 0 below 2p and in degree 2p is the direct sum of the oriented codimension-p component lines. Its top classes have Hodge type (p,p); this is a theorem about arbitrary closed algebraic support, proved in this target. (BF equation 1.30 and Proposition 1.31, p.11, BF line 530–552; BKK Proposition 5.58, pp.132–133, BKK line 4841.)
- The supported class of Σm_V[V] has coordinates m_V, is independent of a resolution, restricts to each generic smooth locus with that multiplicity, and is zero exactly when every coordinate is zero. (BF equation 1.30 and Proposition 1.31, p.11, BF line 530–552; BKK Proposition 5.58, pp.132–133, BKK line 4841.)
- For nonzero rational f with divisor supported in Z and p=1, the pair (0,−log|f|) represents the supported divisor class. This fixes the sign separately from the positive logarithm of a unit. (BF equation 1.30 and Proposition 1.31, p.11, BF line 530–552; BKK Proposition 5.58, pp.132–133, BKK line 4841.)

**Checks.**

- For X=𝔸², p=1, Z=V(xy), H_D,Z²=ℝ² with [V(x)]+[V(y)]↦(1,1); for Z=V(y²−x³) it is ℝ with the reduced cusp↦1. All groups below degree 2 are 0.
- For the origin in 𝔸², p=1 gives H_D,{0}²=0, whereas p=2 gives H_D,{0}⁴=ℝ. The double divisor 2V(x) has coordinate 2 in the same line as V(x), whose coordinate is 1.
- At p=0 and Z=X, H_D,X⁰=ℝ per component and all negative degrees vanish; Z=∅ gives 0 in every degree. At a point with p=1 and full support, H¹=ℝ≠0, so deleting the codimension hypothesis is false.
- Under §5.1’s product, the supported classes of V(x) and V(y) in 𝔸²_ℂ multiply to the origin class with coefficient +1 in H_D,{0}⁴(𝔸²,ℝ(2))=ℝ; replacing V(x) by 2V(x) gives 2. The local intersection lengths are 1 and 2.
- For f=t on 𝔸¹, d=p=1 gives form-current factor (2πi)⁻¹ and point-current factor 1. The normalized identity is d_D[−log|t|]=−δ₀, and (0,−log|t|) has class +[0]; using +log|t| gives coordinate −1.

*Needs:* §5.1; §3.2; ComplexComparisonPartII §§C5.4, C6.0; ComplexKahlerGeometry K1–K2; DifferentialGeometry Layers 5–9; AlgebraicTopology Stages 2–3, 6.1–6.4.

### 5.3 The auxiliary support resolution

For a smooth quasi-projective complex X and p≥0, let Sₚ,ₙ be the directed set of closed subsets of X×□ⁿ all of whose components have codimension at least p and which meet every iterated face with that bound. Finite unions are the directing operation. Let Hₚ(X)ₙ be H_D,Sₚ,ₙ²ᵖ, defined by the filtered colimit of support fibers, with infinity normalization and cube boundary ∂□. Define Aₚ(X) as the normalized direct-sum total of τ≤₂ₚD_log(X×□ⁿ,p) in bidegree (r,−n). Define Aₚ,S(X) by the same construction from the support colimits. Their total differential is d_D+(−1)ʳ∂□ and total degree r−n. Truncation is good truncation, with cycles in its top degree. (BF, §2.4–§2.5, pp.15–17, BF line 705 and BF line 746; BFT Proposition 4.3, p.7, BFT line 266).

Face pullback is defined on precisely these support conditions. The split infinity normalization commutes with cohomology and filtered colimits. Build all three objects on the same diagram, with projection to supported degree 2p, and with the forget-support map Aₚ,S→Aₚ. Applying Jₙ converts this entire diagram to the BF δ convention. Under Jₙ these identify with the auxiliary D_A, its supported variant indexed by Z, and H^p constructed in Polylogarithms §5.2. The shared diagram and the abstract supported regulator of §6.2 must be imported there; the shifted D_AH and β are additional consumer constructions.

The construction has the following API.

- Sending a normalized real cycle to the sum of its multiplicity-bearing supported fundamental classes gives a map C□ᵖ(X)⊗ℝ→Hₚ(X), compatible with faces and open restrictions. (BF §2.4–§2.5, pp.15–17, BF line 705–774; BFT Proposition 4.3, p.7, BFT line 266.)
- There is a cochain map Aₚ,S(X)→Hₚ(X)[−2p], where Hₚ(X) is reindexed cohomologically by degree −n; it sends the top-form-degree component to its supported cohomology class. (BF §2.4–§2.5, pp.15–17, BF line 705–774; BFT Proposition 4.3, p.7, BFT line 266.)
- Forgetting support gives Aₚ,S(X)→Aₚ(X), compatible with projections from good-position support subfamilies and with the constant-cube map τ≤₂ₚD_log(X,p)→Aₚ(X). (BF §2.4–§2.5, pp.15–17, BF line 705–774; BFT Proposition 4.3, p.7, BFT line 266.)
- Compatible maps from all support complexes give a unique map from the filtered colimit. Two representatives become equal exactly after passage to a common finite-union support; the empty support contributes an acyclic complex and hence zero cohomology. This universal property is preserved by the split infinity normalization. (BF §2.4–§2.5, pp.15–17, BF line 705–774; BFT Proposition 4.3, p.7, BFT line 266.)

**Checks.**

- The orientation factors J₀,J₁,J₂ are 1,−1,1. On bidegree (r,−1), J₀∂□=∂□=δJ₁ since δ=−∂□, while J₁ commutes with d_D; the total diagrams agree after transport.
- At (r,n)=(2p,1) total degree is 2p−1; its cube differential has coefficient (−1)²ᵖ=1. At r=2p−1 that coefficient is −1.
- For a point and p=0, the normalized cycle-support complex is ℝ in degree 0 and 0 in positive cube degree.
- On ℂ² with p=1, ω=Re(z₁) dz₂∧dz̄₂ belongs to D²(A,1), but d_Dω=(dz₁+dz̄₁)∧dz₂∧dz̄₂/2 is nonzero: its value on (∂ₓ₁,∂ₓ₂,∂ᵧ₂) is −2i. Good truncation excludes ω from degree 2; brutal truncation would make it an extra top cocycle.
- For X=Spec ℂ, p=1 and n=0 the only admissible support is ∅. Since D_log(X,1) is ℝ in degree 1, its empty-support pair fiber is ℝ→ℝ by identity in degrees 1 and 2. Good truncation τ≤₂ and degree-zero cube normalization retain both terms: the column colimit has nonzero cochains, while H¹=ker(id)=0 and H²=coker(id)=0.

*Needs:* §1.1; §5.1; §5.2; §4.2; EnhancedDerivedSheaves §§0.1–0.4.

### 5.4 Cycle classes and affine contraction

For X,p as in 5.3, the class map C□ᵖ(X)⊗ℝ→Hₚ(X) is an isomorphism of complexes. The projection Aₚ,S(X)→Hₚ(X)[−2p] is a quasi-isomorphism, and τ≤₂ₚD_log(X,p)→Aₚ(X) is a quasi-isomorphism. All three are compatible with restriction, with simultaneous graph-good-position comparisons and with the external products of their diagrams. In particular restriction diagrams, rather than just the individual cohomology groups, are compared. (BF, Proposition 2.8, Corollary 2.9, Lemma 2.11 and Proposition 2.13, pp.15–17; BF line 720, BF line 741, BF line 753, BF line 766; BFT Proposition 4.3, BFT line 266).

Semipurity reduces each support column after good truncation to its degree-2p class group, giving the projection quasi-isomorphism. For the unsupported total, prove algebraic affine-line invariance of real Deligne cohomology from the logarithmic Betti and filtered comparison; normalization then annihilates every positive cube column. Each contributing diagonal is finite because 0≤r≤2p. Apply these arguments to the same support diagrams and good-position subcomplexes. Products use the totalization factor (−1)ⁿˢ for factors of bidegrees (r,−n),(s,−m); it is separate from the cube orientation J.

**Checks.**

- At X=𝔸¹, p=1, n=0, the origin cycle maps to the supported class with coefficient 1; its double maps to 2. A zero class map fails this test.
- At p=1 the map point→𝔸¹ identifies H_D¹=ℝ on both sides; at p=0 it identifies H_D⁰=ℝ. Positive normalized cube columns have cohomology 0.
- For n=s=1 the totalized product factor is −1; for n=0 or s=2 it is +1. Dropping this factor changes the Leibniz sign.

*Needs:* §5.3; §5.2; §1.4; §3.2.

### Examples

A nodal union of coordinate axes has two independent supported degree-two classes, while a cuspidal irreducible curve has one. A double divisor multiplies its class by two without changing the support group. Empty and full support test the fiber shift.

### Dependencies

Layers 1, 3–4; ComplexComparisonPartII §§C5.4 and C6.0 for multiplicity-bearing analytic cycle classes, Poincaré–Lelong and algebraic stratified topology; DifferentialGeometry Layers 5–9; EnhancedDerivedSheaves §§0.1–0.4; ComplexKahlerGeometry K1–K2; AlgebraicTopology Stages 2–3, Stage 6, items 1–4.

## Layer 6: the universal derived regulator

### 6.1 The regulator as a specified roof

For every field embedding σ:k→ℂ, smooth quasi-projective finite-type X/k and p≥0, construct r_D:M(X,ℤ(p))→D_log(X_σ,p) in the derived category of abelian groups, and compatibly as an enhanced diagram on open restrictions. Its source uses the supplier’s shared cycle complex and its degree reindexing. On the cubical real model it is the composite C□ᵖ(X_σ)⊗ℝ→Hₚ(X_σ)←Aₚ,S(X_σ)[2p]→Aₚ(X_σ)[2p]←τ≤₂ₚD_log(X_σ,p)[2p], with the two backward arrows inverted, then the map to the full Deligne complex. Precompose with cycle base change and the integral-to-real map, and undo the degree shift. It induces CHᵖ(X,n)→H_D²ᵖ⁻ⁿ(X_σ,ℝ(p)) for every n≥0. (BF, §3.1, equation 3.1–3.2, p.19; BF line 862; BFT §4, p.7, BFT line 277).

Every arrow is fixed by fundamental classes, forget-support or the constant-cube inclusion. Invert the designated quasi-isomorphisms in the enhanced category of restriction diagrams, rather than choosing unrelated inverses objectwise. The cohomological source has degree a=2p−n, so the even shift 2p introduces no additional differential sign. The construction agrees with the BF roof after Jₙ on cycles and both total complexes.

The construction has the following API.

- A cycle represented in Aₚ,S by ((ωₙ,gₙ),…,(ω₀,g₀)) with top support class cl(z) maps to the class of (ωₙ,…,ω₀) in Aₚ and hence in D_log; different lifts have the same class. (BF §3.1, p.19, BF line 862–895.)
- The source is integral CHᵖ, followed by ℤ→ℝ; torsion maps to 0, but the map is not defined only on an arbitrary rational vector space. (BF §3.1, p.19, BF line 862–895.)
- At n=0 the map is the Deligne cycle class for every smooth quasi-projective X, including its line-bundle Chern classes; on a compactification it is restriction of that geometric class. (BF §3.1, p.19, BF line 862–895.)

**Checks.**

- At Spec ℂ, p=n=0, the cycle m maps to m∈ℝ; at n>0, p=0, the source is 0.
- The empty scheme and zero cycle map to 0. On a point, torsion units such as −1 or i have log absolute value 0.
- On ℙ¹, r_D(c₁O(1)) integrates to 1 in Tate-normalized degree 2, equivalently raw complex period 2πi; O(−1) gives −1.

*Needs:* §1.3; §5.4; KTheoryFiniteLocalFields §3.0a; EnhancedDerivedSheaves §§0.1–0.4, E2.6.

### 6.2 Restriction homotopies and supported realization

The map of 6.1 is a morphism of enhanced restriction diagrams: its naturality homotopy for each open immersion is specified by the common roof, and the homotopies satisfy identity and composition coherence. For every closed Z⊂X, taking the fiber defines r_D,Z from the motivic restriction fiber to D_log,Z(X_σ,p). It commutes with forgetting and enlarging support, restriction of pairs and every map of the localization triangles with the declared signs. This includes singular and nonreduced closed supports through their underlying closed sets and cycle multiplicities. (BF, Proposition 3.3 and its proof, p.19, BF line 877; §1.3–§1.5, pp.5–7, BF line 319; BFT §4, BFT line 277).

The cycle-class and forget-support arrows commute strictly with open restriction in the colimit models. Inversion within the diagram category supplies the coherent inverse data and hence the needed homotopies. For a pair square f′r≃r′f with cochain homotopy h satisfying f′r−r′f=dh+hd, its fiber map is (a,b)↦(ra,r′b+ha); this formula proves the sign and reduces higher coherence to that of the original diagram. Compare only these abstract fibers here; explicit Wang/current support-cone adapters belong to Polylogarithms §5.2.

The supported map has the following API.

- For cochain maps f:A→B, f′:A′→B′, r:A→A′, r′:B→B′ and a degree −1 homotopy h with f′r−r′f=dh+hd, its pair-fiber map is (a,b)↦(ra,r′b+ha). Its domain is fib(f) and its target is fib(f′). (The pair model of §5.1; BF §1.3–§1.5, pp.5–7, BF line 319.)

**Checks.**

- Z=∅ gives the zero regulator on the contractible fiber; Z=X gives the absolute regulator. The identity restriction has h=0.
- For h=0 the pair map is (ra,r′b). With +ha its second-coordinate differential defect is (f′r−r′f−dh−hd)a=0; using −ha would give 2(dh+hd)a. For A=A′=ℤ[0], B=0, B′=(ℤ→ℤ) in degrees −1,0 with differential 1, r=f′=h=1, the image of 1 is (1,1) and D′(1,1)=(0,0); the wrong image (1,−1) has D′=(0,2).
- On (𝔸¹,{0}), the open unit t maps to log|t|; its raw Deligne connecting class is [(0,log|t|)]=−cl([0]). The principal-divisor representative (0,−log|t|) has coefficient +1. Thus raw connecting and positive valuation are not silently identified.

*Needs:* §6.1; §5.1; §1.4; EnhancedDerivedSheaves §§0.1–0.4, E0.6.

### 6.3 Pullback, embeddings and all cycle models

For every morphism f:X→Y of smooth quasi-projective k-schemes and every embedding σ:k→ℂ, f_σ* r_D,Y=r_D,X f* on higher Chow and Deligne cohomology in all p,n≥0. For a compatible field extension k→k′ with embedding σ′:k′→ℂ and σ′|k=σ, base change commutes with the regulator. Transporting 6.1 along i□ and iΔ through the mixed complex gives the same derived realization from the shared simplicial model, with the same restriction fibers. Expressing the source as motivic cohomology via MotivesAndAlgebraicCycles §§4.17–4.18 yields this very map; its perfect-field or resolution hypotheses are retained only on that categorical reformulation. (BF, Propositions 2.19 and 3.3, pp.18–19, BF line 827 and BF line 877; BFT Proposition 6.12, p.20, BFT line 961).

Flat naturality is literal in the roof. For a general morphism use graph-good-position subfamilies on both the cycles and supported forms; 5.4 and the supplier moving comparison make their inclusions invertible. Compatible embeddings identify the final complex base changes. Model independence is transport of this morphism along the axis quasi-isomorphisms; it does not assert an explicit-current comparison for all quasi-projective varieties.

**Checks.**

- Pullback of O(1) along a point→ℙ¹ has c₁=0 in CH¹(point,0), and the Deligne class also pulls back to H_D²(point,ℝ(1))=0. A literal pullback of every raw cycle would be undefined for a point lying on its support.
- For k=ℚ and unit 2, base change through either ℚ→ℝ→ℂ or ℚ→ℂ gives log 2; compatible embeddings give the identical value.
- Both axes send the degree-zero point generator to 1. In cube degree 1 the BF transport has sign −1 and in degree 2 sign +1; it is applied to source and totalized targets together.

*Needs:* §6.1; §6.2; §1.4; MotivesAndAlgebraicCycles §§4.7–4.8, 4.17–4.18; KTheoryFiniteLocalFields §3.0a.

### Examples

At a point the integral unit 2 maps to log 2. On an arbitrary open complement, including the complement of a singular divisor, the same restriction diagram defines the supported morphism. The simplex and cube maps agree through their mixed comparison.

### Dependencies

Layers 1 and 3–5, KTheoryFiniteLocalFields §3.0a’s moving/localization maps, MotivesAndAlgebraicCycles §§4.7–4.8, 4.17–4.18 for its representability bridge, and EnhancedDerivedSheaves §§0.1–0.4, E0.6, E2.6.

## Layer 7: Beilinson comparison, products and normalization

### 7.1 The independently normalized Deligne character

For smooth quasi-projective complex X and p,n≥0, construct the real Beilinson character on the actual supplied Kₙ(X) by universal Deligne Chern classes on BGL, stabilization, descent to the supplied K-theory space and the Chern-character Newton polynomials. At n=0 use the ordinary character, and for n>0,p≥1 use coefficient (−1)ᵖ⁻¹/(p−1)! on the universal higher Chern class. Its weight-one map on K₁ of a complex point is the exponential class [log u] in ℂ/ℝ(1). No arbitrary regulator structure or assumed comparison is part of the input. (BF, §3.2, pp.20–23, BF line 919, BF line 934 and BF line 948; BKK §5.1, pp.109–110, BKK line 3965).

Use finite Grassmannian bundles and their classifying Čech nerves to realize the Deligne Chern classes. Apply Dold–Kan to the nonpositive good truncation of D_log[2p], giving πₙ=H²ᵖ⁻ⁿ. Descent and the plus/perfect K comparisons give the actual K-theory map, compatibly with stabilization. The exponential sequence fixes weight one. This is an independent normalization against which the cycle roof can be compared.

The construction has the following API.

- The universal character is additive in positive K-degree, rationally extends in all degrees, commutes with pullback and embedding base change, and its total character respects K-products. (BF §3.2, pp.20–23, BF line 919–959; BKK §5.1, pp.109–110, BKK line 3965.)
- Its degree-zero Chern classes equal the Deligne classes of the geometric Chern classes. A unit u∈ℂ× maps to the logarithm coset modulo ℝ(1), independent of logarithm branch. (BF §3.2, pp.20–23, BF line 919–959; BKK §5.1, pp.109–110, BKK line 3965.)

**Checks.**

- For u=2eⁱθ, Re(log u)=log 2, independent of θ and of adding 2πi to the logarithm. For u=i the value is 0.
- For O(a) on ℙ¹ the degree-zero character is 1+a h_D, and the normalized integral of h_D is 1.
- The zero K-class and the K-groups of ∅ map to 0; the trivial line maps to 1, so the entire character is not the zero map.

- For a number-field embedding and p=j≥1, the point quotient ℂ/ℝ(p) identifies with ℝ(p−1) by πₚ₋₁(z)=(z+(−1)ᵖ⁻¹z̄)/2, the same projection used for the number-field Beilinson map. At z=3+4i, p=1,2,3 give 3,4i,3. Adding an element of ℝ(p) changes each projected value by 0; the opposite parity would not descend to the quotient.

- For the constant simplicial abelian group ℤ, π₀=H₀=ℤ and all positive homotopy and homology groups are 0. The constant simplicial group S₃ instead has nonabelian π₀=S₃; the abelian Moore-chain comparison does not apply to it.

*Needs:* §3.4; §4.2; GeneralAlgebraicKTheory §§3.12, 7.4–7.7; SchemeKTheoryOperations §§2.1–2.6, 4.3, 6.7–6.9; SchemeAndStackFoundations §§5.3–5.8; EnhancedDerivedSheaves §E2.6; Mathlib `CategoryTheory.Abelian.DoldKan.equivalence`; AlgebraicTopology Stage 8, item 2.

### 7.2 Identification on the supplied K-groups

For every σ:k→ℂ, smooth quasi-projective finite-type X/k and n≥0, the sum over weights of r_D∘chₙ on Kₙ(X)⊗ℚ equals the real Beilinson character of 7.1 after base change X→X_σ. The equality is on the actual K-groups and the shared higher Chow maps. The supported realization of 6.2 composed with 2.3 is the induced relative comparison on every closed-open restriction diagram, with its stated boundary transports. Products, pullbacks and change of compatible embeddings preserve this equality. (BF, Theorem 3.5 and proof, pp.20–23; BF line 905, BF line 998 and BF line 1033; BFT Theorem 4.7, p.7, BFT line 296).

Use §2.2’s identification of Levine’s inverse with §2.0b’s universal motivic character, then run the motivic and Deligne universal-class constructions on the same BGL and Grassmannian nerves. On Grassmannians the cycle class of a geometric Chern class is the Deligne Chern class by 6.1 and the geometric normalization. Naturality, specialization and descent from the supplied classifying-space model extend the equality to all K-degrees. This is the argument inside BF’s proof, which assumes smooth quasi-projective X despite the wider wording of its theorem header. Take fibers only after proving the equality of restriction diagrams. BFT’s explicit-current theorem is not used to extend the construction to opens.

**Checks.**

- At a point in degree 0 both composites send rank 2 to 2; on ℙ¹ both send [O_point] to h_D of normalized degree 1.
- For K₁(ℂ), the unit 2 has value log 2 on both sides, while −1 has value 0. In higher weight 2 the universal factor is −1, agreeing with ch₂,₂=−c₂,₂.
- For full support the equality is the absolute one and for empty support both maps are 0. On (𝔸¹,{0}) the raw Deligne boundary of log|t| has coefficient −1, as in 6.2.

*Needs:* §2.0b; §2.2; §2.4; §6.3; §7.1.

### 7.3 Multiplicativity of the universal map

For σ:k→ℂ, X,Y smooth quasi-projective over k, p,q,n,m≥0, α∈CHᵖ(X,n) and β∈CHᑫ(Y,m), prove r_D(α×β)=r_D(α)×r_D(β) in H_D²⁽ᵖ⁺ᑫ⁾⁻ⁿ⁻ᵐ((X×Y)_σ,ℝ(p+q)). On one smooth X diagonal pullback gives the internal formula. The statement is integral on its Chow source, commutes with restrictions and retains the support products of 5.1. Exchange of α,β has sign (−1)ⁿᵐ on both sides. (BF, §5.1–§5.2, Proposition 5.13 and Corollary 5.14, pp.31–35; BF line 1440, BF line 1539 and BF line 1619).

Take products on the common support diagrams, with the sign (−1)ⁿˢ for the totalized forms. The supported fundamental-class product is the class of the product cycle, including multiplicities. The support projection and forget-support map commute with that product, so invert the comparison quasi-isomorphisms within the product diagram. Use 4.2’s homotopy for associativity and general smooth pullback for the diagonal. Rational K-theory multiplicativity alone would not prove this integral-source theorem.

**Checks.**

- On 𝔾_m, the classes of 2 and t in CH¹(−,1) give i log 2 darg t under the product regulator. Swapping them gives −i log 2 darg t; the positive-circle periods are ±2πi log 2.
- The weight-zero cycle 1 preserves each regulator; a zero cycle or empty factor gives 0. At a point the product of the units 2 and 3 has regulator 0 in degree 2.
- On ℙ¹×ℙ¹, the two ruling divisor classes multiply to the point class, of normalized Deligne degree 1; multiplying either divisor cycle by 2 multiplies the result by 2.

*Needs:* §6.3; §4.2; §5.4; §1.4.

### 7.4 The logarithm and projective acceptance witnesses

For every u∈ℂ×, under H_D¹(point,ℝ(1))=ℂ/ℝ(1)≃ℝ with quotient identified by real part, the K₁ exponential class and its shared motivic unit both have regulator log|u|. Hence the value on uv is log|u|+log|v|. On a smooth complex curve a nowhere-zero regular unit f gives the Dolbeault representative log|f|; for two units f,g their cup representative is i(log|f| darg g−log|g| darg f), where darg f=(df/f−df̄/f̄)/(2i). For a rational function with divisor, the supported Green representative instead is −log|f|. On ℙ¹ the Deligne cycle class of c₁O(a) is a times the positive generator of normalized integral 1. (BKK, §5.1, pp.109–110, BKK line 3965; special-degree formula p.115, BKK line 4176; BF p.11, BF line 550; KLM §5.3, p.13, KLM line 553).

Use the exponential class to fix the value at a point, then restriction naturality and the weight-one logarithmic representative. Substitute x=log|f| and y=log|g| into the four-term product, using ∂log|f|=df/(2f). Poincaré–Lelong fixes the negative Green representative separately. The projective line calculation follows from the degree-zero character and positive complex orientation; it excludes any rescaling of the universal map.

**Checks.**

- For u=2,v=3 the values are log 2,log 3,log 6=log 2+log 3. For u=1 the value is 0, for u=i it is 0, and for u=1/2 it is −log 2.
- On 𝔾_m take f=2,g=t. The representative is i log 2 darg t and its circle period is 2πi log 2; taking a real-valued form without the factor i fails the twist.
- For a=−1,0,1 on ℙ¹, normalized Chern integrals are −1,0,1. For tᵃ on 𝔸¹, −log|tᵃ|=−a log|t| represents divisor multiplicity a, while the unit regulator on the punctured open is +a log|t|.

*Needs:* §7.2; §7.3; §5.2; §4.1.

### Examples

The unit 2 and the line O(1) fix the two basic normalizations. Two units on a smooth curve test the odd product sign. A smooth projective variety is an instance of every construction above, while arbitrary closed supports are tested by the cusp and the crossing divisor of Layer 5.

### Dependencies

Layers 1–6, the actual classifying-space K-models and operations supplied by GeneralAlgebraicKTheory and SchemeKTheoryOperations, the degree-zero geometric Chern classes of SchemeAndStackFoundations §§5.3–5.8; AlgebraicTopology Stage 8, item 2; EnhancedDerivedSheaves §E2.6.

## Downstream consumers

- **Polylogarithms.** The supply contract for §5.2 is §§1.3–1.4, 3.4, 4.1–4.2, 5.1–5.4 and 6.1–6.3; §§5.9–5.10 consume the cycle comparisons and §7.2; §§5.13 and 5.17 consume §§2.4, 7.2–7.4. The shared Aₚ, Aₚ,S, Hₚ, logarithmic Green-current criterion and normalized even-degree pairing belong to §§5.2–5.3 here; Polylogarithms §5.2 must import them and §6.2’s abstract supported map through Jₙ. Polylogarithms §5.2 retains D_AH, β, its full current dictionary and concrete comparison cones; §5.3 retains its Green forms. Explicit Wang/Goncharov forms and their comparison homotopies remain its direction.

- **ColemanIntegration.** On §2.0a's regular ample-family domain, its §§L3.Fa.1–L3.Fa.2 consumer contract identifies relativeKSpace, higherKGroupWithSupports and cubeRelK with the associated pointed fibers and nonnegative homotopy groups of §2.0a's supported perfect K-diagrams through SchemeKTheoryOperations §2.5's vertex comparison. The comparison commutes with every face restriction, open restriction and support enlargement, so it identifies the total fibers and their pairings. Transport §2.0a's Adams operations and ordered relativity through this comparison while preserving the public cubeRelK.relativityIso and its sign API: on each full cube with support T×□ⁿ its weight-q part is Kₘ₊ₙ^T(X)^(q), and each face-pair difference is zero face minus infinity face. Thus the rank witnesses are (1,0)↦1 and (0,1)↦−1, and the two-loop exchange acts by −1. On arbitrary open cubes, including special-unit localizations, the adapter identifies the generalized kernels of (ψᵃ−aᑫ)ᴺ and, separately, the simultaneous kernels of all ψᵃ−aᑫ. The supplied direct-sum decomposition is into generalized pieces; identifying these with simultaneous eigenspaces is asserted on the full cubes with product support specified in §2.0a. Its exact-category and exact-cube models, exact-cube Adams comparison, special-unit localizations and de Jeu symbols remain there.

  For p≥2, the consumer contract for ColemanIntegration §L3.Fc.1 marks reg_∞:K₂ₚ₋₁(ℂ)⊗ℚ→ℝ(p−1) as πₚ₋₁∘ch_D,p, where ch_D,p is §7.1's character to H_D¹(Spec ℂ,ℝ(p))=ℂ/ℝ(p). Section 7.4 fixes πₚ₋₁(z)=(z+(−1)ᵖ⁻¹z̄)/2: at z=3+4i the weights p=2,3 give 4i,3, unchanged by adding ℝ(p). Embeddingwise pullback uses that same marked identification. Arithmetic pairings, the Galois integral-image theorem, discriminant and regulator determinants, and the syntomic map remain in ColemanIntegration.

- **BorelRegulators.** The supply contract for §6.0a is the general Deligne theory and independent universal Chern character of §§3.3–3.4, 4.1–4.2 and 7.1, with opposite cone arrows identified by (r,f,ω)↦(r,f,−ω). Its topological calibration, conjugation/transfer interfaces, infinitesimal comparison and arithmetic theorems remain there. Number-field applications can use §§2.2, 6.1 and 7.2–7.4 for the motivic comparison.

- **ZagierConjecturePolylogarithms.** The motivic character and number-field Deligne normalization used by ZagierConjecturePolylogarithms M.8 are §§2.1–2.2, 7.1 and 7.4 here; they supply the character and embeddingwise normalization used by its cycle-period comparisons.

- **MixedHodgeModulesAndIrregularHodgeTheory.** Its N/logarithmic-filtration zero-function case can use §§3.1–3.2 as the ordinary logarithmic comparison; irregular pole-order, exponential and Newton constructions remain there.

## References

All statements are specifications in this roadmap’s own words. The locators below use the listed versions; source line references identify the legal extracted copies. Each reference records its version and the scope of its mathematical input.

- **Levine94.** Marc Levine, *Bloch’s higher Chow groups revisited*, Astérisque 226 (1994), pp.235–320. [Numdam](https://www.numdam.org/item/AST_1994__226__235_0/). Theorems 2.7, 3.1, 3.4, 4.7, 5.2 and Corollary 4.9, at Levine94 line 1101, 1210, 1405, 1767, 2226 and 1794. The relative-cycle theorem uses regular schemes over an infinite field with its splitting and moving conditions; the supported comparison uses regular quasi-projective schemes over any field.
- **BF.** José Ignacio Burgos Gil and Elisenda Feliu, *Higher arithmetic Chow groups*, [arXiv:0907.5169v1](https://arxiv.org/abs/0907.5169v1) (2009). Sections 1–3 and 5, using the preprint numbering: BF line 381, 506, 530, 720, 753, 766, 862, 905, 1440 and 1619. The proof of Theorem 3.5 at BF line 919 works with smooth quasi-projective schemes.
- **BFT.** Burgos Gil, Feliu and Yuichiro Takeda, *On Goncharov’s regulator and higher arithmetic Chow groups*, [arXiv:0909.5296v1](https://arxiv.org/abs/0909.5296v1) (2009). Sections 1, 3–4 and Proposition 6.12; BFT line 63, 180, 266, 296, 948 and 961. Its explicit-current comparison uses projective complex varieties; the general regulator here uses BF.
- **Burgos94.** José Ignacio Burgos, *A C∞ logarithmic Dolbeault complex*, Compositio 92 (1994), pp.61–86. [Numdam](https://www.numdam.org/item/CM_1994__92_1_61_0/). Theorems 1.1, 2.1 and Corollary 2.2, Burgos94 line 102, 181 and 190. Its local image-algebra construction is Burgos94 line 155.
- **BKK.** Burgos Gil, Jürg Kramer and Ulf Kühn, *Cohomological arithmetic Chow rings*, [arXiv:math/0404122v2](https://arxiv.org/abs/math/0404122v2) (revision 2005). Printed preprint §§5.1–5.3 and 5.6, pp.109–119,122–123,132–133; equation (5.38), Definition 5.41 and Proposition 5.58 fix the current conventions and criterion, at BKK line 4395, BKK line 4450 and BKK line 4841; BKK line 3965, 4035, 4060, 4129, 4142, 4176, 4239, 4263, 4297, 4315 and 4841. These numbers belong to the preprint, rather than the 2007 publication.
- **DeligneHodgeII.** Pierre Deligne, *Théorie de Hodge, II*, Publications Mathématiques de l’IHÉS 40 (1971), pp.5–57. [Numdam](https://www.numdam.org/item/PMIHES_1971__40__5_0/). Sections 2.2.2–2.2.3, 3.1.4–3.1.9, Theorem 3.2.5 and Corollary 3.2.13; DeligneHodgeII line 852, 866, 988, 1044, 1142 and 1242. The cohomological weight shift and refinement proof are DeligneHodgeII line 1147 and 1223.
- **KLM.** Matt Kerr, James D. Lewis and Stefan Müller-Stach, *The Abel–Jacobi map for higher Chow groups*, [arXiv:math/0409116v1](https://arxiv.org/abs/math/0409116v1) (2004). Section 5.3, printed p.13, KLM line 553, provides the degree-one logarithm witness; its explicit-current construction stays with the explicit regulator consumers.
- **Bloch86.** Spencer Bloch, *Algebraic cycles and higher K-theory*, Advances in Mathematics 61 (1986), pp.267–304, [DOI](https://doi.org/10.1016/0001-8708(86)90081-2). Uncertified reference: §7, for the arbitrary-field universal motivic Chern construction and its identification with the inverse cycle map in §§2.0b and 2.2. BF pp.21–22 provides the read complex-field construction; Levine94 supplies the read cycle-to-K isomorphism.
- **Beilinson85.** A. A. Beilinson, *Higher regulators and values of L-functions*, Journal of Soviet Mathematics 30 (1985), §§1–2, pp.2036–2070, [DOI](https://doi.org/10.1007/BF02105861). Uncertified historical reference; BF supplies the read comparison proof.
- **MVW.** Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture notes on motivic cohomology* (2006), [author’s institutional copy](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/Lecture_notes_on_motivic_cohology_published.pdf). Definition 3.1, p.21, MVW line 1054; Theorem 4.1 and Corollary 4.2, p.25, MVW line 1204–1216; Theorem 19.1 and its sheaf-comparison route, pp.159–162, MVW line 5827–5842. The smooth perfect-field comparison has no resolution hypothesis.
- **WeibelKBook.** Charles Weibel, *The K-book: an introduction to algebraic K-theory* (2013), [author’s copy](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Exercise IV.1.12(a), printed p.275, WeibelKBook line 15979, identifies the stable Hopf class with [−1] and fixes the integral spectrum obstruction. Theorem V.11.11 and its proof, pp.457–459, WeibelKBook line 27681–27808, construct the universal motivic classes imported from KTheoryFiniteLocalFields §6.10; Lemma V.11.13, p.458, WeibelKBook line 27746, fixes their diagonal factorial.
- **Levine98.** Marc Levine, *Mixed Motives* (1998), Part I, Chapter II §§2–3, Chapter III §1 and Chapter V §2. Waived chapter-level background reference; it certifies no finer locator or additional theorem in this build.

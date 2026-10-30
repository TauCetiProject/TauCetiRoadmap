# Roadmap: direct summands and big Cohen–Macaulay algebras

**Summary.** Build the commutative algebra that converts perfectoid ramification and Riemann extension into linear retractions of finite extensions of regular rings, balanced big Cohen–Macaulay algebras over every Noetherian local ring, faithfully flat domination of finite covers, Cohen–Macaulay descent along pure mixed-characteristic local maps, and the derived direct summand theorem. The two perfectoid arguments meet in the same splitting obstruction: André kills extension classes modulo powers of p using the Kummer tower and the perfectoid Abhyankar theorem; Bhatt uses quantitative extension across rational annuli. Hochster’s algebra modifications turn almost regular parameter systems into balanced big Cohen–Macaulay algebras. The derived theorem replaces a finite algebra by the derived global sections of a proper surjective scheme.

## Scope and ownership

This roadmap owns split algebras and splinters (§§0.1–0.2), arbitrary big and balanced big Cohen–Macaulay modules and algebras (§§0.3–0.6), the algebra-unit and proper-unit applications of the supplied triangle obstruction (§0.7), Hochster’s endomorphism and complete-local purity criteria (Layer 1), the two direct summand arguments (Layers 2–3), Hochster’s algebra modifications and their criterion for big Cohen–Macaulay algebras (Layer 4), the existence theorems, flat domination and monomial theorem (Layers 4–5), the mixed-characteristic weak-functoriality square and pure-subring theorem (Layer 6), and derived splinters and derived direct summands (Layer 7).

The following constructions and theorems are supplied elsewhere and are used by section, rather than reconstructed here. PerfectoidSpaces P0–P3 owns almost algebra, perfectoid rings, rational localization, the sheaf theorem and almost purity. PerfectoidSpacesPartII RA.0–RA.5 owns quantitative Riemann extension, uniform Banach and ramification theory, the perfectoid Abhyankar lemma, tensor purity, almost purity of maps, Krull detection and normalized Kummer towers. Its analytic statements remain supplier contracts here. PerfectoidQuotients §§0.7, 1.3–1.4 owns the fixed-field integral models and saturated root extension. DeformationAndDerivedPatchingAlgebraPartII §§K0.1, K0.3 owns the arbitrary-module Čech comparison, filtered-colimit local cohomology and finite secant parameter lists, their existence, permutations and positive powers. DerivedModuleAlgebra §§0.K.1, 1.T.1, 1.1.1, 1.E.0 and 1.M.2 owns Koszul complexes, ordinary towers, derived Hom, pseudo-coherent/perfect carriers and arbitrary-residue-field Matlis duality. EnhancedDerivedSheaves §§E1.4, E1.6 and E1.8 owns enhanced derived ringed pushforward, regular homological dimension, Kunz’s theorem and transport of triangle obstructions. DeformationAndDerivedPatchingAlgebra §§1.9–1.15, 3.1–3.4, 3.7, 3.9, 4.1 and 7.3 owns Cohen presentations, residue extensions, flat completion, finite algebra decompositions, Artin–Rees Hom pro-comparison, Auslander–Buchsbaum and finite models. SchemeAndStackFoundations §§0.9, 0.11, 0.15, 0.17, 2.6–2.7, 2.18–2.19, 2.21 and 4.12 owns limits, Popescu approximation, depth and finite-module Cohen–Macaulayness, flat cohomology base change, derived quasicoherent sheaves, coherent duality and the upper-shriek functor, and modification domination. JacobianChallenge Layer C owns coherent proper pushforward; ResolutionOfSingularitiesCharacteristicZero §7.5 owns resolution of quasi-excellent ℚ-schemes.

Mathlib already supplies regular local and regular rings, regular sequences, flatness, faithful flatness, completions, Witt vectors, power series, fraction fields, integral closures, trace, local cohomology and the derived category. Tau Ceti supplies injective-envelope interfaces, regular local domains and finite products of flat modules. Mathlib supplies the ordinary bounded-below derived pushforward of sheaves of modules and the geometric ringed-space unit; Layer 7 uses these native constructions, while its enhancement and affine comparison remain supplied by EnhancedDerivedSheaves and SchemeAndStackFoundations. Section 5.2 differs from the finite-product theorem by allowing an arbitrary index set over a coherent base; §7.2 adds the particular proper-unit cone, its finite affine bound and its regular-local perfectness application. The generic cone-vanishing test, coherent proper pushforward and finite Hom pro-comparison are not independent targets of this roadmap. The predicates in Suggested.lean that express parameter lists and purity are transparent views of their supplier contracts on native carriers, not new competing constructions.

The characteristic-p Cohen–Macaulay theorem for the absolute integral closure is owned here. Mixed-characteristic Cohen–Macaulayness of its p-adic completion, plus-regularity and test ideals are outside this roadmap’s scope. General weak functoriality without the hypotheses of Layer 6, perfectoid characterizations of regularity, improved intersection and syzygy theorems, and Hochster’s reduction to the unramified case are outside this roadmap’s scope. Heitmann–Ma’s weakly functorial big Cohen–Macaulay algebras for height-one quotients, their vanishing theorem for maps of Tor and the resulting Cohen–Macaulayness of pure subrings of mixed-characteristic regular local rings without residue separability (HEITMANNMA18, Theorems 3.1 and 4.1 and Corollary 4.3) extend Layer 6 and belong to a Part II of this roadmap.

## Conventions

All rings are commutative with unit. Local rings are nonzero. A regular ring means a Noetherian ring all of whose prime localizations are regular local rings; a regular local ring is Noetherian and local, with dimension equal to the minimal number of generators of its maximal ideal. These are Mathlib’s `IsRegularRing` and `IsRegularLocalRing`. Global regular rings may have components of different dimensions, and may include the zero ring; local statements exclude it.

A splitting is an R-linear map S→R taking 1 to 1, with no multiplicativity requirement. A splinter is reduced and Noetherian and splits every finite injective algebra. Tensor purity means that M→M⊗_R S, m↦m⊗1, is injective for every R-module M; finite presentations suffice. A system of parameters in a d-dimensional local ring (R,m) is a list of d elements of m whose generated ideal has radical m. A weakly regular list makes each successive scalar action injective on the quotient by its predecessors. Big Cohen–Macaulayness also requires M/mM≠0; balanced means every system of parameters is weakly regular. Modules and algebras in these definitions need not be Noetherian or finite over the base.

Fix a prime p whenever roots or residue characteristic p occur. Mixed characteristic means characteristic zero with residue characteristic p; it does not mean that p is a regular parameter. Root systems are specified data r₀=π, rₙ₊₁ᵖ=rₙ. The almost ideal is generated by all their terms. Distinguish the p-root ideal, the (pg)-root ideal, the (ϖg)-root ideal, and `g^{1/p^∞}`K°°; every use of “almost” names its ideal. Integral perfectoid models are K°-algebras, not K-algebras. In Layer 3 K is the completion of ℚ_p(`p^{1/p^∞}`) and t=p. In Layers 2 and 4, k is perfect of characteristic p, A=W(k)⟦T₁,…,Tₙ⟧ and the cyclotomic Kummer tower is the specified one of PerfectoidSpacesPartII RA.5.

Use cohomological indexing in D(A). For a distinguished triangle A→K→Q→A[1], the obstruction is the last arrow α:Q→A[1]; only its vanishing is independent of the chosen cone. For 0→ℤ→²ℤ→ℤ/2→0 its value is the nonzero class 1 in Ext¹_ℤ(ℤ/2,ℤ)=ℤ/2. For the identity of A the cone and its arrow are zero. These two examples fix the direction and degree of the obstruction in every layer that uses it. For an ideal 𝔞 of A with 𝔞²=𝔞, a map u : A → K in D(A) is almost split with respect to 𝔞 when 𝔞 annihilates α; equivalently, for every ε ∈ 𝔞 there is r_ε : K → A in D(A) with r_ε ∘ u = ε·id_A (extend ε·id_A along u exactly when ε·α=0). This is weaker than a left inverse in the derived category of almost modules: for V the valuation ring of the completion of ℚ₂(`2^{1/2^∞}`) and 𝔞 its maximal ideal, the almost epimorphism (⊕ₙV)ᵃ → Vᵃ, eₙ ↦ `2^{1/2ⁿ}`, has an ε-section for every ε ∈ 𝔞 but no section, since every V-linear map 𝔞 → ⊕ₙV has finitely many nonzero coordinates, each a multiplication by an element of V, so the composite is multiplication by an element of 𝔞, never 1.

For the splinter equivalence, finite algebras and proper scheme covers are tested in the base universe; finite presentation permits transport to an isomorphic model in that universe. Lean rings and finite algebra data can otherwise live in independent universes; modules may be in a larger universe. Balanced-algebra existence uses a carrier in the base universe: finite equations and filtered modifications have cardinality at most κ = max(|R|,ℵ₀), and the countable inverse-limit completion has cardinality at most κ^ℵ₀. For example ℤ_(2) is countable but its completion ℤ₂ has cardinality 2^ℵ₀; completion preserves the universe, not this smaller cardinal bound. Purity can be tested in that universe because finite presentations suffice. Flat domination uses a universe containing both the source algebra and the base. A separable field extension means that every finitely generated intermediate field has a transcendence basis over which it is separable algebraic (STACKS, Definition 10.42.1, tag 030O; STACKS line 4671 in the commutative-algebra text). The residue-field algebra structure used by `SeparableResidueMap` is induced by the specified local ring map. The predicate uses `Algebra.IsTranscendentalSeparable`, so transcendental extensions are included. Its Checks are the identity of 𝔽₂ (separable of degree 1), 𝔽₂(t)→𝔽₂(`t^{1/2}`) (inseparable of degree 2), 𝔽₂→𝔽₄ (separable of degree 2), and 𝔽₂→𝔽₂(t) (separable with transcendence degree 1); an arbitrary unrelated field algebra structure is not admitted.

Source keys are those of the References: André B means ANDRE18B, Bhatt without a year means BHATT18, Bhatt 2012 means BHATT12, and BMPSTWW means the seven-author source under that key. Published André page numbers, the specified arXiv versions and the author-preprint pages of Hochster 2002 are distinguished throughout.

[Suggested.lean](Suggested.lean) states the headline theorems that have native carriers, with real predicate and unit-map definitions. The perfectoid, modification and relative cohomology-killing headlines that need further interfaces are identified in its module docstring. The derived splitting headlines use the native bounded-below category of sheaves of modules on Spec R, with the affine comparison to D(R). The API bullets and Checks below specify mathematical behaviour in prose.

## Exact supplier contracts

### From Mathlib

Consume the declarations below at Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`. The paths identify the source modules; the definitions carry exactly the hypotheses named here.

- `AdicCompletion` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: I-adic completion of a module
- `Algebra.Etale` in `Mathlib/RingTheory/Etale/Basic.lean`: Étale algebras (formally étale and of finite presentation)
- `Algebra.IsTranscendentalSeparable` in `Mathlib/FieldTheory/TranscendentalSeparable.lean`: General separability of field extensions, including transcendental ones; `Algebra.IsSeparablyGenerated` in the same file specifies a separating transcendence basis.
- `Algebra.IsIntegral` in `Mathlib/RingTheory/IntegralClosure/Algebra/Defs.lean`: Integral algebras
- `Algebra.trace` in `Mathlib/RingTheory/Trace/Defs.lean`: The trace form of a finite free algebra
- `Algebra.trace_algebraMap` in `Mathlib/RingTheory/Trace/Defs.lean`: Trace of the image of a scalar is the rank times the scalar
- `AlgebraicClosure` in `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean`: An algebraic closure of a field
- `AlgebraicGeometry.IsIntegral` in `Mathlib/AlgebraicGeometry/Properties.lean`: Integral schemes
- `AlgebraicGeometry.IsProper` in `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`: Proper morphisms of schemes
- `AlgebraicGeometry.Surjective` in `Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean`: Surjective morphisms of schemes
- `CategoryTheory.Abelian.Ext` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`: Ext groups in an abelian category through the derived category
- `CharP` in `Mathlib/Algebra/CharP/Defs.lean`: Rings of characteristic p
- `DerivedCategory` in `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: The derived category of an abelian category
- `CategoryTheory.Functor.rightDerivedFunctorPlus` and `CategoryTheory.Functor.rightDerivedFunctorPlusUnit` in `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean`: The right derived functor between bounded-below derived categories, for an additive functor from an abelian category with enough injectives, and its natural comparison from complexes.
- `AlgebraicGeometry.Scheme.Modules.pushforward` in `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`: The additive pushforward of sheaves of modules; its source module category is Grothendieck abelian.
- `SheafOfModules.unitToPushforwardObjUnit` in `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackFree.lean`: The morphism O_Y→f_*O_X induced by the specified scheme map.
- `CochainComplex.Plus`, `DerivedCategory.Plus.Q` and `HasDerivedCategory.standard` in `Mathlib/Algebra/Homology/CochainComplexPlus.lean`, `Mathlib/Algebra/Homology/DerivedCategory/Plus.lean` and `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: Native complexes, localization and its standard universe choice; `HomologicalComplex.singleMapHomologicalComplex` in `Mathlib/Algebra/Homology/Additive.lean` supplies the single-complex comparison for an additive functor.
- `FractionRing` in `Mathlib/RingTheory/Localization/FractionRing.lean`: The fraction field of a domain
- `Ideal.iInf_pow_eq_bot_of_isLocalRing` in `Mathlib/RingTheory/Filtration.lean`: Krull's intersection theorem for an ideal of a Noetherian local ring
- `IsAdicComplete` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: I-adically complete and separated modules and rings
- `IsIntegrallyClosed` in `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean`: Integral closedness in the total fraction ring; domain hypotheses remain explicit in its applications
- `IsLocalRing` in `Mathlib/RingTheory/LocalRing/Defs.lean`: Local rings
- `IsNoetherianRing` in `Mathlib/RingTheory/Noetherian/Defs.lean`: Noetherian rings
- `IsReduced` in `Mathlib/Algebra/GroupWithZero/Basic.lean`: Reduced rings
- `IsRegularLocalRing` in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`: Regular local rings: Noetherian local with maximal ideal generated by dim R elements
- `IsRegularRing` in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`: Noetherian rings all of whose localisations at primes are regular local rings
- `IsSMulRegular` in `Mathlib/Algebra/Regular/SMul.lean`: Elements acting as nonzerodivisors on a module
- `Localization.AtPrime` in `Mathlib/RingTheory/Localization/AtPrime/Basic.lean`: Localisation at a prime ideal
- `Module.Dual` in `Mathlib/LinearAlgebra/Dual/Defs.lean`: The dual Hom_R(M, R)
- `Module.FaithfullyFlat` in `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`: Faithfully flat modules (flat with mM ≠ M for every maximal ideal m)
- `Module.Finite` in `Mathlib/RingTheory/Finiteness/Defs.lean`: Finitely generated modules
- `Module.FinitePresentation` in `Mathlib/Algebra/Module/FinitePresentation.lean`: Finitely presented modules
- `Module.Flat` in `Mathlib/RingTheory/Flat/Basic.lean`: Flat modules
- `Module.Free` in `Mathlib/LinearAlgebra/FreeModule/Basic.lean`: Free modules
- `MvPowerSeries` in `Mathlib/RingTheory/MvPowerSeries/Basic.lean`: Formal power series rings in several variables
- `RingTheory.Sequence.IsRegular` in `Mathlib/RingTheory/Regular/RegularSequence.lean`: Regular sequences: weakly regular with M ≠ (x)M
- `RingTheory.Sequence.IsWeaklyRegular` in `Mathlib/RingTheory/Regular/RegularSequence.lean`: Weakly regular sequences on a module (each element a nonzerodivisor modulo the previous ones)
- `WittVector` in `Mathlib/RingTheory/WittVector/Defs.lean`: Witt vectors W(k), in particular of a perfect field
- `frobenius` in `Mathlib/Algebra/CharP/Lemmas.lean`: The Frobenius endomorphism in characteristic p
- `integralClosure` in `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean`: The integral closure of a ring in an algebra
- `localCohomology` in `Mathlib/Algebra/Homology/LocalCohomology.lean`: Ext-colimit local cohomology functor; Čech comparison for arbitrary modules is consumed from DeformationAndDerivedPatchingAlgebraPartII §K0.1, rather than included by this declaration.
- `ringKrullDim` in `Mathlib/RingTheory/KrullDimension/Basic.lean`: Krull dimension of a ring

`RingTheory.Sequence.IsRegular` consists of weak regularity and a nonzero final quotient; weak regularity alone includes the zero module. `IsAdicComplete` includes separation. `Module.FaithfullyFlat` includes flatness and nontrivial maximal-ideal quotients. `localCohomology` is the Ext-colimit functor and does not by definition identify it with the Čech or Koszul construction for arbitrary modules. `CategoryTheory.HasInjectiveDimensionLE` in `Mathlib/CategoryTheory/Abelian/Injective/Dimension.lean` expresses finite self-injective dimension for the Gorenstein cover in §4.9.

### From Tau Ceti

Consume Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`: `TauCeti.IsRegularLocalRing.isDomain` in `TauCeti/RingTheory/RegularLocalRing/Basic.lean`; `TauCeti.IsInjectiveEnvelope` and the essential-extension uniqueness interface in `TauCeti/Algebra/Module/Injective/Envelope/Basic.lean`; and `Module.Flat.pi` in `TauCeti/RingTheory/Flat/Pi.lean`, whose index set is finite. Its `Module.FaithfullyFlat.pi_of_exists_submodule_ne_top` needs one surviving factor for each maximal ideal. `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean` takes values in abelian groups; an A-module-valued derived global-sections unit is a separate geometric input.

### From TauCetiRoadmap.PerfectoidSpaces

Sections P0.1–P0.17 and P0.25 supply basic setups, root ideals, almost modules and algebras, almost elements, the two left adjoints including `(·)_{!!}`, traces and change of setup. P1.24 supplies the common integral perfectoid predicate, and P1.25 supplies its Tate-ring comparison; P1.4 supplies pseudo-uniformizers with compatible p-power roots that are unit multiples of a given pseudo-uniformizer whose p-th power divides p. P2 supplies rational localization, its almost integral models, and almost acyclicity of O⁺; P3 supplies almost purity and the integral closure of finite étale covers. Use their named root setup, not an unspecified valuation ideal. Faithful finite étale covers are required for the almost-splitting consequence.

### From TauCetiRoadmap.PerfectoidSpacesPartII

Sections RA.0–RA.1 supply almost-pro-zero towers, linear-functor preservation, derived limits, rational annuli and quantitative Riemann extension, including the finite-perfect-complex form and the form without a regularity assumption on g. RA.3 supplies integral closedness in the (pg)-localization; RA.4 supplies the perfectoid Abhyankar theorem. RA.5 supplies pure and almost pure maps, André’s Krull detection lemma, the normalized Kummer tower, its flat integral model and ramified almost flatness modulo pᵐ. The almost annihilators, the distinction between a pro-isomorphism and a levelwise isomorphism, and all faithful-flatness hypotheses are part of the contract.

The ramified simultaneous Kummer contract is: Extend normalized Kummer flatness and almost faithful flatness modulo p² to ramified complete regular local bases with perfect residue field and finitely many simultaneous discriminants, with compatible root maps.

### From TauCetiRoadmap.PerfectoidQuotients

Sections 0.7 and 1.3–1.4 supply the saturated fixed-field integral model, the root extension A→A∞ with its distinguished roots, and almost faithful flatness modulo t. Use the given roots and maps through completed operations. The universal perfectoidization of integral quotients is not used.

### From TauCetiRoadmap.DerivedDeRhamCohomology

Section 1.10, “Bhatt’s ordinary flatness criterion”, supplies ordinary (faithful) flatness from (faithful) flatness modulo π, with A Noetherian and both rings π-torsion-free and classically π-adically complete. The statement retains these ordinary completeness hypotheses.

### From TauCetiRoadmap.DerivedModuleAlgebra

Sections 0.K.1, 1.T.1 and 1.1.1 supply Koszul complexes, module towers, ordinary limits, the product-difference map, Milnor sequences and native module-derived Hom. Section 1.E.0 supplies pseudo-coherent objects, bounded finite models, perfect objects and their finite Tor-amplitude interfaces. Section 1.M.2 supplies arbitrary-residue-field Matlis duality and End_R(E)=R̂, with E the injective hull of the residue field. No double-duality theorem for an arbitrary infinite module is assumed.


### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Sections 1.9–1.10 supply coefficient-compatible Cohen presentations, strict Cohen rings, residue-field extensions with equality of extended maximal ideals, and the individual perfect-residue completed base change. Sections 1.13–1.15 supply flat completion for an arbitrary flat algebra over a Noetherian base, finite algebra completion factors, and the finite-module Artin–Rees Hom pro-isomorphism and its vanishing lim¹. Sections 3.1–3.2 supply Auslander–Buchsbaum and finite local homological comparisons; §3.4 supplies regular-surjection kernels generated by a prefix of a regular parameter system; §3.7 supplies dimension, top local cohomology and its arbitrary-module tensor comparison; §3.9 supplies canonical modules and the finite-self-injective-dimension Gorenstein criterion; §4.1 supplies finiteness from a finite-dimensional residual fibre over a complete local source; §7.3 supplies finite minimal models. The regular-surjection theorem is applied to the specified map and leaves its coefficient restriction fixed; the parameter-subring application in §4.8 retains the chosen coefficient map.

The common Cohen extension contract is: For compatible Cohen embeddings lifting a separable residue extension k→k′ in the general field-extension sense, identify completion_p(Λ′⊗_Λ W(kᵖerf)) as a strict Cohen ring with residue k′⊗_k kᵖerf and construct its compatible faithfully flat map to W(k′ᵖerf), so the resulting common completed base change preserves injectivity and purity.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebraPartII

Section K0.3, “Secant sequences”, supplies finite secant parameter lists, their dimension formula, existence, permutations and invariance under positive powers. For M=R≠0 its dimension formula identifies maximal secant lists with dimension-length lists generating a maximal-primary ideal. The transports are the contract below.

The parameter-system transport contract is: For a Noetherian local ring R, a parameter system maps to a parameter system of its maximal-adic completion. For a prime P of R with dim(R/P)=dim R, a parameter system of R maps to one of R/P. For a finite injective local map R→B of Noetherian local rings, a parameter system of R maps to one of B. For a flat local map R→R′ of Noetherian local rings with `m_R R′ = m_{R′}`, a parameter system of R maps to one of R′.

Section K0.1, “Local cohomology inputs”, supplies the Čech computation of Mathlib’s Ext-colimit local cohomology for any module over a Noetherian ring and any finite generating list, and commutation with filtered colimits. Use SchemeAndStackFoundations §2.7 for its derived-torsion comparison and DerivedModuleAlgebra §0.K.1 for Koszul models. The new content in §0.5 is arbitrary-module completion and change of parameters, rather than another Čech comparison.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections E1.4 and E1.8 supply enhanced ringed derived pushforward, affine comparisons, and transport of the triangle obstruction under exact functors. Section E1.6 supplies the projective-dimension bound over a regular local ring, Kunz’s theorem and complete equal-characteristic Cohen presentations. An exact functor reflects a vanishing obstruction only when its induced map on the relevant Hom group is injective.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.9 and 0.15 supply finite-presentation limits and Popescu approximation; §0.11 supplies absolute integral closure and its affine comparison with Spec R⁺; §0.17 supplies depth, finite-module Cohen–Macaulayness and flat-local descent; §§2.6–2.7 and 2.18 supply flat and Tor-independent base change and the derived-torsion comparison for local cohomology on the same quasicoherent derived categories; §§2.19 and 2.21 supply the right adjoint of proper pushforward, global duality, dualizing complexes and biduality, together with the upper-shriek functor for separated finite-type morphisms of Noetherian schemes and its proper, étale, flat-base-change and local-complete-intersection laws (`globalDuality`, `upperShriek_proper`, `upperShriek_etale`, `upperShriek_flat_baseChange`, `upperShriek_lci`, `pushforwardRightAdjoint_affine_finite`); the last makes f^!O locally a shifted line bundle for an lci f. Section 4.12 supplies Noetherian modification domination; §4.13 supplies normality of regular schemes and the Serre normality criterion. The extension to quasi-compact quasi-separated bases specified below is needed in §7.4; it involves no perfectoid carrier.

The modification-domination contract over a quasi-compact quasi-separated base is: For a quasi-compact quasi-separated scheme S, a quasi-compact open U⊆S and a proper morphism X→S that is an isomorphism over U, supply a U-admissible blow-up S′→S, with a finite-type ideal sheaf as centre, and a factorization S′→X→S (STACKS, Lemma 38.31.4, tag 081T; STACKS line 4296 in the flattening text).

### From TauCetiRoadmap.JacobianChallenge

Layer C, “relative coherent cohomology and base change”, supplies coherent higher direct images for every proper scheme morphism over a locally Noetherian base and every coherent sheaf, with no flatness assumption on the morphism or coefficients. Over an affine base its cohomology modules are finite over the base ring. The finite affine Čech cover in §7.2 gives the cohomological bound.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Section 7.5, `qeResolution`, supplies for every reduced Noetherian quasi-excellent ℚ-scheme Z a projective birational morphism Y→Z, component by component, with Y regular. Section 7.7 applies it to an integral scheme proper over a complete regular local ring containing ℚ; no finite-type hypothesis over a field is used.

## How to read the build

Layer 0 fixes the module notions, descent and obstruction. Layer 1 proves complete-local purity and the Frobenius case. Layer 2 uses the normalized Kummer tower to kill finite extension classes modulo pᵐ. Layer 3 constructs ramified perfectoid covers and transports the same obstruction through the annular tower. Layer 4 develops algebra modifications, their criterion, the key lemma with controlled denominators and completion, then constructs balanced big Cohen–Macaulay algebras in every characteristic. Layer 5 assembles the general direct summand theorem and the independent flat-domination route. Layer 6 constructs compatible squares and descends parameter regularity along pure maps. Layer 7 supplies proper-unit obstructions, finite cohomology-killing covers and the derived theorem. A Needs line distinguishes the inputs to the statement from those to the displayed proof route; another proof need not wait for inputs it does not use. Within Layer 4, build §4.9 before §4.8, whose characteristic-p branch uses it, and then §§4.10–4.11. Within Layer 5, build §§5.2–5.3 before the flat-domination proof of §5.1; the Bhatt proof of §5.1 uses only earlier layers.

## Layer 0: Splittings, splinters and big Cohen–Macaulay modules

### 0.1 Split algebras (R-linear retractions of the unit)

The headline signature is `SplitAlgebra`.

Let R be a commutative ring and S a commutative R-algebra with structure map ι : R → S. A splitting of S over R is an R-linear map ρ : S → R with ρ ∘ ι = id_R, equivalently ρ(1) = 1. S is split over R (ι splits) if a splitting exists. No multiplicativity of ρ is required. Writing ev : Hom_R(S, R) → R for evaluation at 1, S is split iff ev is surjective, and the image of ev is an ideal of R (the trace ideal of 1).

(ANDRE18B, §0.1, Conjecture 0.1.1 and the sentence after it, p. 71; ANDRE18B line 27; ANDRE18B, Annexe A.2, Lemme A.2.1(4) and its proof, p. 90; ANDRE18B line 873; BHATT18, Theorem 1.1, p. 1; BHATT18 line 17.)

Splittings are R-module maps, never ring maps: ℝ → ℂ is split by the real part, which is not multiplicative.

When S is a finitely presented R-module, splitting is equivalent to purity of ι (PerfectoidSpacesPartII §RA.5 (pure map); in the proof of André B Lemme A.2.1(4) Hom_S(S, R) is read as Hom_R(S, R), with the dual taken over R).

A proof route is the following. The image of ev is an ideal: for f ∈ Hom_R(S, R) and r ∈ R, (r·f)(1) = r·f(1). If ev(f) = u is a unit, u⁻¹f is a splitting. Composition: splittings of R → S and S → T (the latter S-linear) compose to an R-linear splitting of R → T; if R → S → T splits then the restriction of a splitting of R → T to S splits R → S. Base change: if ρ splits ι then R′ ⊗_R ρ splits R′ → R′ ⊗_R S for every R-algebra R′. Finite case: if R is Noetherian and S is a finite R-module, S is finitely presented, so Hom_R(S, R) is finite and its formation commutes with flat base change; hence the ideal ev(Hom_R(S, R)) commutes with flat base change, so splitting can be checked after localising at every maximal ideal, and descends along any faithfully flat R → R′ (an ideal I with IR′ = R′ is R).

The interface has the following laws.

- An algebra splits exactly when an R-linear functional S→R takes 1 to 1.
- Splitting is equivalent to surjectivity of evaluation at 1 on the R-module dual.
- If S splits over R and T splits over S then T splits over R.
- If T splits over R and R → S → T, then S splits over R.
- If S splits over R then R′ ⊗_R S splits over R′ for every commutative R-algebra R′.
- A split algebra is tensor-pure (PerfectoidSpacesPartII §RA.5); the converse holds when S is finitely presented as an R-module.
- The structure map of a split algebra is injective.
- For R Noetherian and S finite over R: S splits over R iff S_m splits over R_m for every maximal ideal m.
- For R Noetherian, S finite over R and R → R′ faithfully flat: if R′ ⊗_R S splits over R′ then S splits over R.

**Checks.**

- R → R[X] is split by evaluation at 0.
- The identity R → R is split, and so is R → R × R by the first projection.
- ℤ → ℤ[i] is split: the coefficient of 1 in the basis {1, i} is a ℤ-linear retraction.
- ℤ → ℚ is injective and flat but not split: Hom_ℤ(ℚ, ℤ) = 0.
- For K a field, K → L splits for every nonzero K-algebra L (extend 1 to a basis).
- For R = K[x, y]/(xy) and its normalisation S = K[x] × K[y], R → S is finite and injective but not split (André B §0.2): its splitting would make R → S pure, but the ideal (x + y) of R is not contracted from S, since x = (x + y)(1, 0) in S while x ∉ (x + y)R. A definition requiring only injectivity of R → S fails this test.
- For R=ℝ, S=ℂ, the real-part retraction has ρ(i²)=−1 while ρ(i)²=0; requiring a ring retraction would reject a valid splitting.
- For a field K and the zero K-algebra, any linear map sends 1=0 to 0, so the value-one condition fails.

*Needs:* Mathlib `Module.Finite`; Mathlib `Module.FaithfullyFlat`; Mathlib `Module.Dual`; PerfectoidSpacesPartII §RA.5 (pure map).

### 0.2 Splinters

The native predicate for the characteristic-p derived equivalence is `Splinter`.

A commutative ring R is a splinter if it is Noetherian and reduced, and every finite injective ring map R → S (S commutative) is split in the sense of §0.1. Equivalently (R Noetherian and reduced) every integral injective ring map R → S is pure (PerfectoidSpacesPartII §RA.5 (pure map)), since an integral extension is the filtered union of its finite subalgebras.

(BMPSTWW, Definition 2.12 and the following paragraph, p. 15; BMPSTWW line 672; BHATT12, Definition 0.1, p. 1; BHATT12 line 20; BHATT12, Example 1.1, pp. 2–3; BHATT12 line 91; ANDRE18B, Conjecture 0.1.1 (proved in the paper), p. 71; ANDRE18B line 27.)

The convention follows Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, Definition 2.12. Bhatt 2012 Definition 0.1 instead asks splitting of O_S → f_*O_X for every finite surjective f : X → Spec S; for Noetherian rings the two agree once R is reduced, and the scheme version forces reducedness (apply it to R_red → R).

Reducedness is part of the definition: without it the Artinian Gorenstein ring k[ε]/(ε²), which is self-injective, would satisfy the splitting condition.

A proof route is the following. Integral version: an integral extension R ⊆ S is the filtered union of finite subalgebras S_α; each R → S_α splits hence is pure, and pure maps are stable under filtered colimits (PerfectoidSpacesPartII §RA.5 (pure map)). Contracted ideals: for a pure extension R → S and every ideal I of R, R/I → S/IS is injective, so IS ∩ R = I. A splinter domain is integrally closed: for t=a/b integral over R, split R ⊆ R[t]. The direct-summand quotient R[t]/R embeds in the torsion-free R-module R[t] through the chosen complement, but is torsion since it vanishes over Frac R. It is therefore zero.

The interface has the following laws.

- A ring is a splinter exactly when it is Noetherian and reduced and every finite injective algebra has an R-linear unit retraction.
- For a splinter R and a finite injective R-algebra S, S splits over R.
- For a splinter R, every injective integral R-algebra S is pure over R.
- For a splinter R, an injective integral R-algebra S and an ideal I of R, IS ∩ R = I.
- A splinter domain is integrally closed.
- Being a splinter is invariant under ring isomorphism.
- Every Noetherian regular ring is a splinter (the direct summand theorem, §5.1).

**Checks.**

- A field K is a splinter.
- ℤ is a splinter: a finite injective ℤ → S splits because the image of 1 in S modulo torsion is primitive (an element s with ns ≡ 1 would make 1/n integral over ℤ).
- k[ε]/(ε²) is not a splinter because it is not reduced, although every finite injective map out of it splits (it is self-injective); a definition without reducedness fails this test.
- K[x, y]/(xy) is reduced but not a splinter: its normalisation S = K[x] × K[y] is finite and injective but does not split, since x = (x, 0) = (x, y)(1, 0) lies in (x + y)S while x ∉ (x + y)R (the constant coefficient of a multiplier would have to be both 1 and 0). A definition requiring only reducedness fails this test.
- K[t², t³] is not a splinter: K[t²,t³] → K[t] is finite and injective but the quotient is torsion of generic rank 0 and nonzero, so no splitting exists.
- A Noetherian domain containing ℚ is a splinter iff it is integrally closed (Mathlib IsIntegrallyClosed).

*Needs:* §0.1; PerfectoidSpacesPartII §RA.5 (pure map); Mathlib `IsNoetherianRing`; Mathlib `IsReduced`; Mathlib `Algebra.IsIntegral`.

### 0.3 Big Cohen–Macaulay modules and algebras

The target BigCMFor is specified here in prose.

Use `ParameterSystem` for the dimension-length, maximal-ideal membership and radical condition. For the nonzero finite module M=R, the secant dimension formula of DeformationAndDerivedPatchingAlgebraPartII §K0.3 identifies this predicate with a maximal secant list with zero-dimensional terminal quotient; its permutation, positive-power and isomorphism-transport laws are consumed from that section. The native comparison is the interface here. A regular system of parameters is a special case (ANDRE18B §0.1 footnote 1, p.72; ANDRE18B line 72).

Let (R, m) be a Noetherian local ring of Krull dimension d and x = (x₁, …, x_d) a system of parameters of R (DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems), applied to M = R). An R-module M, not necessarily finitely generated, is big Cohen–Macaulay for x if M ≠ mM and x is weakly regular on M: for each 0 ≤ i < d, `x_{i+1}` is a nonzerodivisor on M/(x₁, …, x_i)M. M is big Cohen–Macaulay if it is big Cohen–Macaulay for some system of parameters. An R-algebra C is a big Cohen–Macaulay algebra (for x) if it is so as an R-module.

(ANDRE18B, Définition 4.1.1(1), p. 84; ANDRE18B line 638; BMPSTWW, §2.2, conditions (a)–(d) and the definitions after them, p. 12; BMPSTWW line 507.)

Because (x) is m-primary, M ≠ mM is equivalent to M ≠ (x)M; so for a system of parameters the condition is exactly Mathlib's RingTheory.Sequence.IsRegular M x.

No finiteness is imposed on M; for finitely generated M the notion is that of a maximal Cohen–Macaulay module.

In dimension 0 the empty sequence is the system of parameters and every module with M ≠ mM qualifies.

A proof route is the following. The equivalence M ≠ mM ⟺ M ≠ (x)M: mⁿ ⊆ (x) for some n, so M = mM gives M = mⁿ M ⊆ (x)M. Hence big Cohen–Macaulay for x is RingTheory.Sequence.IsRegular M x with x a system of parameters, and Mathlib’s regular-sequence interface applies.

The interface has the following laws.

- For a parameter system x, big Cohen–Macaulayness means weak regularity of x and a nonzero maximal-ideal quotient.
- For a parameter system, this is equivalent to the native regular-sequence condition on M, including the nonzero final quotient.
- A module is big Cohen–Macaulay exactly when at least one parameter system satisfies this condition.
- The predicate is invariant under R-linear isomorphism.
- If d≥1 and M is big Cohen–Macaulay for (x₁, …, x_d), then M/x₁M is big Cohen–Macaulay over R/x₁R for (x₂, …, x_d).
- If M is big Cohen–Macaulay for x then `(x₁⋯x_d)^{t−1}`M ⊄ (x₁^t, …, x_d^t)M for every t ≥ 1; in particular for an algebra the element `(x₁⋯x_d)^{t−1}` is not in (x^t)C.

**Checks.**

- For R = K⟦X, Y⟧ and x = (X, Y), R is big Cohen–Macaulay for x.
- If dim R = 0 then M is big Cohen–Macaulay iff M ≠ mM; for R a field, iff M ≠ 0.
- Over R = ℤ_(p) with x = (p), the module ℚ is not big Cohen–Macaulay: p is a nonzerodivisor on ℚ but ℚ = pℚ. A definition requiring only weak regularity fails this test.
- R = K⟦X, Y⟧/(XY, Y²) has dimension 1 and depth 0 (Y is killed by the maximal ideal), so R is not big Cohen–Macaulay over itself for the system of parameters (X).
- A regular local ring is big Cohen–Macaulay over itself for a regular system of parameters.
- For M=0, every scalar action on the zero module is injective, but M/mM=0; the nonzero quotient clause excludes it.

- Over a field k the empty list has length 0 and generated radical zero, so it is a parameter system.
- Over k⟦X⟧, (X²) has length 1 and radical (X), so it is a parameter system; (1) has unit radical and fails.
- Over k⟦X,Y⟧, (X,X) has the required length 2 but radical (X)≠(X,Y), while (X) has length 1<dim R=2. Both fail, testing the independent radical and length conditions.

*Needs:* DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); Mathlib `RingTheory.Sequence.IsWeaklyRegular`; Mathlib `RingTheory.Sequence.IsRegular`; Mathlib `IsLocalRing`; Mathlib `ringKrullDim`.

### 0.4 Balanced big Cohen–Macaulay modules and algebras

The headline signature is `BalancedBigCM`.

Let (R, m) be a Noetherian local ring. An R-module M is balanced big Cohen–Macaulay if M ≠ mM and every system of parameters of R is weakly regular on M, i.e. M is big Cohen–Macaulay (§0.3) for every system of parameters. An R-algebra C is a balanced big Cohen–Macaulay algebra if it is so as an R-module; André calls these Cohen–Macaulay B-algebras.

(ANDRE18B, Définition 4.1.1(2) and footnote 5, p. 84; ANDRE18B line 641; BMPSTWW, §2.2, condition (c) and the definition of balanced, p. 12; BMPSTWW line 507.)

For finitely generated nonzero M, balanced and big agree. For arbitrary modules they can differ; m-adic completion passes from big to balanced (§0.5), with the arbitrary-module completion input recorded in the arbitrary-module comparison of §0.5.

A proof route is the following. Balanced means big Cohen–Macaulayness for every parameter system. Change of rings: a balanced big Cohen–Macaulay algebra for B is one for any local subring A ⊆ B over which B is finite with the same systems of parameters (used in André B Remarque 4.2.1).

The interface has the following laws.

- Balanced big Cohen–Macaulayness means a nonzero maximal-ideal quotient and weak regularity of every parameter system.
- A balanced big Cohen–Macaulay module is big Cohen–Macaulay for every system of parameters.
- If A → B is a finite injective local map of Noetherian local rings of the same dimension and C is a balanced big Cohen–Macaulay B-algebra, then C is a balanced big Cohen–Macaulay A-algebra.
- Over a regular local ring, balanced big Cohen–Macaulay modules are faithfully flat (§0.6).

**Checks.**

- A regular local ring R is a balanced big Cohen–Macaulay R-module (every system of parameters of a Cohen–Macaulay local ring is regular).
- Over a field every nonzero module is balanced big Cohen–Macaulay.
- A nonzero finitely generated module is balanced big Cohen–Macaulay iff it is big Cohen–Macaulay iff it is maximal Cohen–Macaulay (depth = dim R).
- Let R be regular local of positive dimension and x₁ the first member of a regular system of parameters. The nonzero finite module R/x₁R has depth dim R − 1, so it is neither big nor balanced big Cohen–Macaulay over R. In particular the system of parameters beginning with x₁ fails weak regularity.
- For R=k⟦X⟧ and M=R/(X), X kills 1≠0, so the balanced condition fails although M is a nonzero finite module.

*Needs:* §0.3; DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems).

### 0.5 Completion turns big Cohen–Macaulay modules into balanced ones

The target completion_balanced is specified here in prose.

Let (R, m) be a Noetherian local ring and M an R-module with M ≠ mM on which some system of parameters x of R is weakly regular. Then the m-adic completion M̂ = lim_n M/mⁿ M is a balanced big Cohen–Macaulay R-module (§0.4). If M is an R-algebra, M̂ is an R-algebra and M → M̂ is an algebra map.

(ANDRE18B, §4.1, sentence after Définition 4.1.1, p. 85; ANDRE18B line 659; BMPSTWW, §2.2, paragraph after conditions (a)–(d), p. 12; BMPSTWW line 516, which cites BH93, Exercise 8.1.7 and Theorem 8.5.1, for the completion; HEITMANNMA18, §1.2, discussion after Theorem 1.6, p. 4; HEITMANNMA18 line 144.)

The completion is Mathlib’s maximal-ideal-adic module completion; M need not be finitely generated or separated.

A proof route is the following. A system of parameters weakly regular on M implies Hⁱ_m(M) = 0 for i < d by the direct limit of the Koszul complexes on its powers. Use DeformationAndDerivedPatchingAlgebraPartII §K0.1 for arbitrary-module Čech comparison and filtered colimits, together with DerivedModuleAlgebra §0.K.1 for Koszul complexes. This section owns the arbitrary-module completion and change-of-parameters assertion: if M/mM ≠ 0 and Hⁱ_m(M)=0 for i<d, the maximal-adic completion is balanced (BH93, Exercise 8.1.7 and Theorem 8.5.1, cited by published locator: complete M, show that every system of parameters acts weakly regularly on M̂ through the vanishing of lower local cohomology, and keep M̂/mM̂ = M/mM ≠ 0). Consume the comparison of Ext-colimit local cohomology with Čech cohomology for arbitrary modules from DeformationAndDerivedPatchingAlgebraPartII §K0.1, and use DerivedModuleAlgebra §0.K.1 for its Koszul presentation. The finite-module depth criterion alone does not imply arbitrary-module completion (André §4.1 p.85; BMPSTWW §2.2 p.12). Completion is functorial, and for an algebra the inverse limit of the quotient algebras carries the required algebra structure. No finite-generation or separatedness assumption on M is inserted.

**Checks.**

- For M finitely generated, M̂ = M ⊗_R R̂ and the statement reduces to the classical fact that a maximal Cohen–Macaulay module stays maximal Cohen–Macaulay after completion.
- For R=k[X]_(X) and M=R, completion is k⟦X⟧ and its quotient by X is k, with X acting injectively.
- For M=0 the completion and the maximal-ideal quotient are zero, so the hypothesis fails.

*Needs:* DeformationAndDerivedPatchingAlgebraPartII §K0.1; §0.3; §0.4; Mathlib `AdicCompletion`; Mathlib `localCohomology`; DeformationAndDerivedPatchingAlgebra §3.7; DerivedModuleAlgebra §0.K.1.

### 0.6 Balanced big Cohen–Macaulay algebras over regular local rings are faithfully flat

The target balanced_faithfullyFlat is specified here in prose.

Let A be a Noetherian regular local ring and C a balanced big Cohen–Macaulay A-module (§0.4). Then C is faithfully flat over A. In particular a balanced big Cohen–Macaulay A-algebra is a faithfully flat A-algebra.

(ANDRE18B, Remarque 4.2.1 and footnote 7, pp. 86–87; ANDRE18B line 741; ANDRE18B, §0.7, sentence before Théorème 0.7.2, p. 75; ANDRE18B line 189; HH95, §1.2(d); cited by published locator.)

Use the exact Tor segment below and choose the maximal regular sequence by ht P, not by the descending Tor degree i; these are independent indices.

A proof route is the following. Every finitely generated A-module M has projective dimension at most dim A (EnhancedDerivedSheaves §E1.6), so Tor^A_i(M, C) = 0 for i > dim A. For the descending induction on the Tor degree i > 0, reduce by a prime filtration to M = A/P. Choose a maximal A-regular sequence x₁,…,x_h in P, of length h = ht P, independently of i; it extends to a system of parameters. For N = A/(x₁,…,x_h), the prime P is associated to N: N is Cohen–Macaulay and its localisation at P has dimension zero. Thus A/P embeds in N. The Koszul resolution of N and weak regularity on C give Tor_j(N,C)=0 for all j>0. The exact segment `Tor_{i+1}`(N/M, C) → Tor_i(M, C) → Tor_i(N, C) has vanishing outer terms (the first by the induction hypothesis), so Tor_i(M, C) = 0: C is flat. mC ≠ C gives faithful flatness for the local ring A (Mathlib Module.FaithfullyFlat).

**Checks.**

- For A = C a regular local ring the statement is trivial; for A a DVR it says a torsion-free module with C ≠ ϖC is faithfully flat.
- For a DVR A and C=Frac(A), the uniformizer acts bijectively and C/ϖC=0; this flat module is not faithfully flat.

*Needs:* §0.4; SchemeAndStackFoundations §0.17; EnhancedDerivedSheaves §E1.6; DerivedModuleAlgebra §0.K.1; Mathlib `IsRegularLocalRing`; Mathlib `Module.FaithfullyFlat`.

### 0.7 The splitting obstruction of a unit map

Let A be a commutative ring and u : A → K a morphism in the derived category D(A) (Mathlib DerivedCategory of A-modules), for example the unit A → B of a finite A-algebra or A → RΓ(X, O_X) for an A-scheme X. Complete it to a distinguished triangle A → K → Q_u → A[1] and let α_u ∈ `Hom_{D(A)}`(Q_u, A[1]) be the connecting morphism. Then u has a left inverse in D(A) iff α_u = 0 (EnhancedDerivedSheaves §E1.8, splitting obstructions). For a finite injective algebra A → B, Q_u = B/A in degree 0 and α_u is the class of the extension 0 → A → B → B/A → 0 in Ext¹_A(B/A, A); it vanishes iff B is split over A (§0.1).

(BHATT18, Proof of Theorem 5.4, p. 10; BHATT18 line 563; ANDRE18B, §3.3, p. 84; ANDRE18B line 618; BHATT18, Proof of Theorem 6.1, p. 11; BHATT18 line 604.)

Two choices of the cone are related by an isomorphism completing the identities of A and K to a morphism of triangles. This isomorphism carries one connecting morphism to the other, so its vanishing is independent of the choice.

For A → A′ any ring map the derived base change carries α_u to `α_{u′}` for u′ = u ⊗^L_A A′; vanishing of `α_{u′}` implies vanishing of α_u only when the base change map on Hom groups is injective, for example for A → A′ faithfully flat and Q_u pseudo-coherent with A Noetherian.

A proof route is the following. Use the supplied distinguished-triangle splitting test and its functoriality under exact functors; construct only its specialization to algebra units and coherent proper units here. Flat base change: if Q_u is pseudo-coherent (DerivedModuleAlgebra §1.E.0) and A → A′ is flat, `Hom_{D(A)}`(Q_u, A[1]) ⊗_A A′ ≅ `Hom_{D(A′)}`(Q_u ⊗^L A′, A′[1]) (Stacks 0A6A), compatibly with α. For A Noetherian and I-adically complete, represent pseudo-coherent Q_u by a bounded-above complex of finite free modules. In each fixed cohomological degree its dual uses only finitely many adjacent finite modules. Artin–Rees exactness of I-adic quotient pro-systems gives {Hʲ RHom(Q_u,A)/Iᵐ}_m ≅ {Hʲ RHom(Q_u,A/Iᵐ)}_m as pro-systems, with lim¹ zero. Taking j=1 gives the required Hom inverse limit. This is a degreewise argument extending the finite-module supplier; no uniform assertion for unbounded complexes is needed.

The interface has the following laws.

- The class α_u ∈ `Hom_{D(A)}`(cone u, A[1]) attached to u : A → K in D(A).
- α_u = 0 ↔ u has a left inverse in D(A).
- For a finite injective algebra A → B, α_u is the Yoneda class of 0 → A → B → B/A → 0 in Ext¹_A(B/A, A).
- Derived base change along A → A′ maps α_u to `α_{u ⊗ A′}`.
- For A Noetherian, Q_u pseudo-coherent and A → A′ faithfully flat, α_u = 0 iff `α_{u ⊗ A′}` = 0.
- For A Noetherian and I-adically complete and Q_u pseudo-coherent, α_u = 0 iff its reduction in `Hom_{D(A)}`(Q_u, A/Iᵐ[1]) vanishes for every m.

**Checks.**

- For u = id_A the cone is 0 and the obstruction is 0.
- For A = K[t², t³] and B = K[t], B/A ≅ K (spanned by t) and the obstruction is a nonzero element of Ext¹_A(K, A); a definition through Hom instead of Ext¹ would give 0.
- For the module map 2 : ℤ → ℤ (not an algebra unit), the class of 0 → ℤ → ℤ → ℤ/2 → 0 is the generator of Ext¹_ℤ(ℤ/2, ℤ) = ℤ/2: injectivity of u does not make α vanish.
- For a finite free A-algebra B of positive rank, 1 is primitive at every maximal ideal by Nakayama; the quotient B/A is finite locally free, hence projective. Thus its Ext¹ obstruction is zero. For ℤ ⊆ ℤ[i], B/A is free on the class of i. The zero A-algebra over nonzero A has rank zero and no such conclusion.

*Needs:* EnhancedDerivedSheaves §E1.8, splitting obstructions; §0.1; Mathlib `DerivedCategory`; Mathlib `CategoryTheory.Abelian.Ext`; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §1.15.

### 0.8 Reductions of the splitting problem

Let A₀ → B₀ be a finite injective ring map with A₀ Noetherian regular. For every maximal ideal m of A₀ and every field extension K of A₀/m there is a complete Noetherian regular local ring A, faithfully flat over (A₀)_m, with m A = m_A and residue field K; and B = B₀ `⊗_{A₀}` A has a prime 𝔮 with 𝔮 ∩ A = 0. A₀ → B₀ splits (§0.1) as soon as, for every m, the finite injective map A → B/𝔮 splits for one such A and one such 𝔮. If A has mixed characteristic (0, p), then B/𝔮 is a domain finite over the normal domain A and there is g ∈ A, outside every minimal prime of pA (so g ≠ 0 in A/p), such that B/𝔮[1/(pg)] is finite étale over A[1/(pg)].

(BHATT18, Proof of Proposition 5.2, first sentences, p. 8; BHATT18 line 469; BHATT18, Proof of Theorem 5.4, first paragraph, p. 10; BHATT18 line 563; ANDRE18B, §3.1, p. 83; ANDRE18B line 589.)

The completion is taken before passing to the domain quotient: completion need not preserve the domain property.

The domain reduction is needed before choosing g. The reductions apply in all three characteristic types: equal characteristic 0, equal characteristic p and mixed characteristic (0, p).

A proof route is the following. Localise: splitting of a finite algebra over a Noetherian ring is checked at maximal ideals (splitting of the unit). Complete and extend the residue field: DeformationAndDerivedPatchingAlgebra §1.10 gives a complete Noetherian local A faithfully flat over (A₀)_m with m A = m_A and residue field K; A is regular because m_A is generated by dim A elements. Splitting descends along faithfully flat maps (splitting of the unit). Domain quotient: A → B is injective and integral, so some prime 𝔮 of B lies over 0 (lying over for the minimal prime 0 of the domain A, Tau Ceti TauCeti.IsRegularLocalRing.isDomain); a splitting of A → B/𝔮 composed with B → B/𝔮 splits A → B. Discriminant: B/𝔮 is a domain finite over the normal domain A of characteristic 0, so Frac(B/𝔮)/Frac(A) is finite separable and A → B/𝔮 is generically étale (Mathlib Algebra.Etale). The non-étale locus in Spec A[1/p] has closure Z of codimension ≥ 1 whose codimension-one components are height-one primes not containing p; a minimal prime P of pA has height one and contains p, so P ∉ Z, and prime avoidance gives g in the ideal of Z outside every minimal prime of pA.

**Checks.**

- For S=A×A/I, projecting to A chooses a dominating component; projecting to A/I loses injectivity when I≠0.

*Needs:* §0.1; SchemeAndStackFoundations §4.13; DeformationAndDerivedPatchingAlgebra §1.10; DeformationAndDerivedPatchingAlgebra §1.13; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `IsRegularRing`; Mathlib `IsRegularLocalRing`; Mathlib `Algebra.Etale`; Mathlib `Localization.AtPrime`.

### 0.9 Trace splittings and the characteristic-zero direct summand theorem

Let R be a Noetherian integrally closed domain and S a domain containing R and finite over R, with d = [Frac(S) : Frac(R)]. If d is a unit in R, then d⁻¹·`Tr_{Frac(S)/Frac(R)}` restricts to an R-linear splitting S → R. Consequently every Noetherian normal domain containing ℚ is a splinter, and every Noetherian regular ring containing ℚ is a splinter (§0.2).

(ANDRE18B, §0.2, first paragraph, p. 72; ANDRE18B line 54; BHATT12, Example 1.1, pp. 2–3; BHATT12 line 91.)

The characteristic-zero statement uses the domain reduction of §0.8 (a regular local ring is a normal domain) and the fact that a splitting of A → B/𝔮 splits A → B.

Bhatt says 'characteristic 0' for this case; the trace argument needs ℚ ⊆ R.

A proof route is the following. For s ∈ S the trace Tr(s) is integral over R (sum of conjugates of an integral element) and lies in Frac(R), hence in R by normality (Mathlib Algebra.trace, IsIntegrallyClosed). Tr(1) = d (Mathlib Algebra.trace_algebraMap), so d⁻¹Tr is a splitting. For a general finite injective R → S with R a normal domain containing ℚ, choose a prime 𝔮 of S over 0; the trace splitting of R → S/𝔮 splits R → S.

**Checks.**

- Invertibility of d matters for the trace construction: for ℤ → ℤ[(1 + √5)/2], d = 2 and d⁻¹Tr((1 + √5)/2) = 1/2 ∉ ℤ, so d⁻¹Tr is not a ℤ-linear map to ℤ, although the extension (being free) still splits by the coefficient of 1.
- For a nonsquare a in a field K of characteristic different from 2, K⊆K(√a) is quadratic; the trace on the basis 1,√a is 2,0 and the divided trace is 1,0.
- For a=1 the extension K(√1)=K has degree 1, so Tr(1)=1. The pair 1,√1 is not a basis and the degree-two trace formula does not apply.

*Needs:* §0.1; §0.2; §0.8; Mathlib `Algebra.trace`; Mathlib `Algebra.trace_algebraMap`; Mathlib `IsIntegrallyClosed`; Mathlib `FractionRing`.

### 0.10 The direct summand theorem in dimension at most two

Let A be a Noetherian regular local ring of dimension at most 2 and A → S a finite injective ring map. Then A → S splits. More precisely, for a domain S finite over A containing A, the reflexive hull S** = Hom_A(Hom_A(S, A), A) is a finite free A-algebra containing S, so A → S** splits and hence A → S splits.

(ANDRE18B, §0.2, first paragraph, p. 72; ANDRE18B line 54; BHATT18, §1, paragraph after Theorem 1.1, p. 1; BHATT18 line 17.)

Any characteristic. For dimension 3 in mixed characteristic the statement is Heitmann's theorem (André B §0.2), here a special case of §5.1. The statement is the case André B §0.2 calls easy: finite flat extensions split, and in dimension ≤ 2 normal (reflexive) finite extensions are flat.

A proof route is the following. Reduce to S a domain containing A (§0.8, the domain step). S** is the intersection of the localisations S_𝔭 over height-one primes 𝔭 of A inside S ⊗ Frac(A), hence a ring containing S, and it is a finitely generated reflexive A-module. A reflexive module over a regular local ring of dimension ≤ 2 has depth min(2, dim A) = dim A, so by Auslander–Buchsbaum (DeformationAndDerivedPatchingAlgebra §3.1) it is free; a finite free A-algebra containing A splits (1 extends to a basis after reducing modulo m_A, since 1 ∉ m_A S**).

**Checks.**

- In dimension 1 (A a DVR) every torsion-free finite A-module is free, so every finite extension domain splits.
- For A=k and S=k[ε]/ε², the basis 1,ε gives the coefficient retraction; reducedness of S is not required.

*Needs:* §0.1; §0.8; DeformationAndDerivedPatchingAlgebra §3.1; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `Module.Free`.

### Examples

The node normalization detects failure of ideal contraction, ℤ⊆ℤ[i] detects a linear splitting, and the module ℚ over a DVR detects the missing nonzero quotient. The trace calculation on (1+√5)/2 distinguishes an available splitting from the divided-trace formula.

### Dependencies

Internal statements and proof routes use Layer 0. External inputs: SchemeAndStackFoundations §§0.17, 4.13; Mathlib `Module.Finite`; Mathlib `Module.FaithfullyFlat`; Mathlib `Module.Dual`; PerfectoidSpacesPartII §RA.5 (pure map); Mathlib `IsNoetherianRing`; Mathlib `IsReduced`; Mathlib `Algebra.IsIntegral`; DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); Mathlib `RingTheory.Sequence.IsWeaklyRegular`; Mathlib `RingTheory.Sequence.IsRegular`; Mathlib `IsLocalRing`; Mathlib `ringKrullDim`; Mathlib `AdicCompletion`; Mathlib `localCohomology`; DeformationAndDerivedPatchingAlgebra §3.7; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §E1.6; Mathlib `IsRegularLocalRing`; EnhancedDerivedSheaves §E1.8, splitting obstructions; Mathlib `DerivedCategory`; Mathlib `CategoryTheory.Abelian.Ext`; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §1.15; DeformationAndDerivedPatchingAlgebra §1.10; DeformationAndDerivedPatchingAlgebra §1.13; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `IsRegularRing`; Mathlib `Algebra.Etale`; Mathlib `Localization.AtPrime`; Mathlib `Algebra.trace`; Mathlib `Algebra.trace_algebraMap`; Mathlib `IsIntegrallyClosed`; Mathlib `FractionRing`; DeformationAndDerivedPatchingAlgebra §3.1; Mathlib `Module.Free`.


## Layer 1: Hochster’s purity criteria and the characteristic-p theorem

### 1.1 Hochster's endomorphism criterion for splitting

Let (R, m) be a nonzero local ring, not necessarily Noetherian, and r ∈ m such that `∩_{n≥1}` rⁿ R = 0 and either r = 0 or r is a nonzerodivisor on R. Let σ : R → R be a local ring endomorphism such that R is a free module over σ(R) and `∩_{j≥0}` σʲ(m)R ⊆ rR. Let R ⊆ S be a ring extension and τ : S → S an injective ring endomorphism restricting to σ on R. If Hom_R(S, R) ≠ 0, then R → S splits (§0.1).

(ANDRE18B, Annexe A.3, Proposition A.3.1, implication (c) ⇒ (b) and its proof, pp. 90–91; ANDRE18B line 912; HOCHSTER73, §1, Theorem 2, statement p. 31 and first characteristic-p proof p. 32; HOCHSTER73 line 235.)

Require r=0 or multiplication by r to be injective, in addition to r-adic separation; dividing a functional by a power of r uses this condition. The free-summand functional is defined on the chosen finite free summand M.

A proof route is the following. Take λ ∈ Hom_R(S, R) nonzero. Since ∩ rⁿR = 0 and r is regular (or zero), divide λ by the largest power of r dividing all its values, then precompose with multiplication by some s ∈ S, to get λ(1) ∉ rR. Then λ(1) ∉ σʲ(m)R for some j, by the hypothesis on ∩σʲ(m)R. R is free over σʲ(R), a local ring with maximal ideal σʲ(m); choose a finite free σʲ(R)-summand M of R with λ(1) ∈ M ∖ σʲ(m)M and, by Nakayama, a σʲ(R)-linear form μ on M with μ(λ(1)) = 1, extended by 0 on a complement. μ ∘ λ restricted to τʲ(S) is a σʲ(R)-linear retraction of σʲ(R) → τʲ(S); transporting along the isomorphisms σʲ : R → σʲ(R) and τʲ : S → τʲ(S) gives an R-linear retraction of R → S.

**Checks.**

- With r = 0 and σ = Frobenius this is the characteristic-p splitting criterion (§1.3).
- With R = V⟦x₂, …, x_d⟧ for a complete DVR V with uniformiser r and σ(x_i) = x_i^q (q ≥ 2), R is free over σ(R) with monomial basis of exponents < q and ∩σʲ(m)R = rR; this is the case used for R → R⁺ (ANDRE18B, Annexe A.3 Applications, p.91).
- For R=𝔽₂⟦X⟧, σ(X)=X², r=0, the ideals σʲ(m)R=(`X^{2ʲ}`) have intersection zero; R has rank 2 over σ(R).

*Needs:* §0.1; Mathlib `IsLocalRing`; Mathlib `Module.Free`; Mathlib `Module.Dual`.

### 1.2 Pure maps out of complete local rings split

The target complete_pure_split is specified here in prose.

`PureAlgebra` is the native view of the pure ring map of PerfectoidSpacesPartII §RA.5 (pure map); its composition, base-change, filtered-colimit and left-factor laws are consumed from that section. The comparison with the supplier notion identifies its tensor-unit test with tensor purity (ANDRE18B Lemme A.2.1(1), p.90; ANDRE18B line 868).

Let (R, m) be a complete Noetherian local ring and S a commutative R-algebra such that R → S is pure (PerfectoidSpacesPartII §RA.5 (pure map)). Then R → S splits (§0.1). No finiteness, integrality or endomorphism of S is needed.

(ANDRE18B, Annexe A.3, Proposition A.3.1, implication (a) ⇒ (c) and its proof, p. 91; ANDRE18B line 912; DATTAMURAYAMA, Proposition 5.4.1(iii), p. 28; DATTAMURAYAMA line 1315; HOCHSTERLC, §5, Theorem 5.1, p. 19 (End(E)=R̂), and Theorem 5.4, p. 21 (Matlis duality); HOCHSTERLC line 623.)

Completeness is essential: Datta–Murayama Proposition 5.4.1(iii) gives an excellent Henselian characteristic-p DVR V with Hom_V(`V^{1/p}`,V)=0, although V ⊆ `V^{1/p}` is faithfully flat and therefore pure.

A proof route is the following. Let E be the injective hull of the residue field (DerivedModuleAlgebra §1.M.2). Purity makes E = E ⊗_R R → E ⊗_R S injective. E is injective, so restriction Hom_R(E ⊗_R S, E) → Hom_R(E, E) is surjective. Hom_R(E, E) = R̂ = R for complete R (DerivedModuleAlgebra §1.M.2), and by adjunction Hom_R(E ⊗_R S, E) = Hom_R(S, Hom_R(E, E)) = Hom_R(S, R); under these identifications the restriction map is evaluation at 1. Hence evaluation at 1 on Hom_R(S, R) is surjective and R → S splits.

**Checks.**

- R = K a field: every nonzero K-algebra splits.
- The Datta–Murayama DVR is a non-example showing that 'complete' cannot be replaced by 'excellent Henselian'.

- For the identity algebra the tensor-unit map is the identity after the unit comparison.
- For ℤ→ℚ, tensoring ℤ/2 gives zero; the nonzero class 1 maps to 0, so this algebra is not pure.
- For the diagonal R→R×R, the tensor of the first projection retracts the tensor-unit map.

*Needs:* §0.1; PerfectoidSpacesPartII §RA.5 (pure map); DerivedModuleAlgebra §1.M.2; Mathlib `IsAdicComplete`.

### 1.3 The direct summand theorem in characteristic p

The target directSummand_charP is specified here in prose.

Every Noetherian regular ring of characteristic p > 0 is a splinter (§0.2).

(ANDRE18B, Annexe A.3, Applications, p. 91; ANDRE18B line 928; ANDRE18B, §0.2, second paragraph, p. 72; ANDRE18B line 54; BHATT12, Example 1.3, p. 3; BHATT12 line 114.)

The proof uses the reductions of §0.8 with a perfect residue field.

A proof route is the following. By §0.8 it suffices to split A → S for A a complete regular local ring of characteristic p with perfect residue field k and S a domain finite over A. A ≅ k⟦x₁, …, x_d⟧ (coefficient field EnhancedDerivedSheaves §E1.6, Cohen presentations and Cohen's presentation DeformationAndDerivedPatchingAlgebra §§1.9–1.10, the kernel being 0 by regularity), so Frobenius F : A → A is finite and A is free over F(A) = Aᵖ with monomial basis (Kunz, EnhancedDerivedSheaves §E1.6). Hom_A(S, A) ≠ 0: S is a finite torsion-free A-module, so S ⊗ Frac(A) ≅ Frac(A)ⁿ and a nonzero Frac(A)-linear form, scaled by a common denominator of its values on generators, maps S to A. Apply §1.1 with r = 0, σ = F on A and τ = F on S (injective since S is reduced).

**Checks.**

- For A = 𝔽_p⟦x⟧ and S = A[`x^{1/p}`] = 𝔽_p⟦`x^{1/p}`⟧, the splitting is the coefficient projection onto the monomials with integer exponent.
- For p=2, projection sends a+`bX^{1/2}` to a; for p=3 it sends a+`bX^{1/3}`+`cX^{2/3}` to a. Both send 1 to 1.

*Needs:* §0.2; §0.8; §1.1; EnhancedDerivedSheaves §E1.6, Cohen presentations; DeformationAndDerivedPatchingAlgebra §§1.9–1.10; EnhancedDerivedSheaves §E1.6; Mathlib `CharP`; Mathlib `frobenius`; Mathlib `MvPowerSeries`.

### Examples

Over 𝔽₂⟦X⟧ the Frobenius basis is 1,X and over 𝔽₃⟦X⟧ it is 1,X,X². Pure-to-split over a complete local ring includes infinite algebras; the Henselian DVR with zero Frobenius dual distinguishes completeness.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 1. External inputs: Mathlib `IsLocalRing`; Mathlib `Module.Free`; Mathlib `Module.Dual`; PerfectoidSpacesPartII §RA.5 (pure map); DerivedModuleAlgebra §1.M.2; Mathlib `IsAdicComplete`; EnhancedDerivedSheaves §E1.6, Cohen presentations; DeformationAndDerivedPatchingAlgebra §§1.9–1.10; EnhancedDerivedSheaves §E1.6; Mathlib `CharP`; Mathlib `frobenius`; Mathlib `MvPowerSeries`.


## Layer 2: André’s theorem over Witt power series

### 2.1 Splittings modulo powers of an ideal give a splitting

Let A be a Noetherian ring, I an ideal contained in the Jacobson radical of A, and S a finite A-algebra. If for every m ≥ 1 the map A/Iᵐ → S/Iᵐ S splits (as A/Iᵐ-modules), then A → S splits (§0.1).

(ANDRE18B, §3.4, p. 84; ANDRE18B line 630; BHATT18, Lemma 5.3 and its use in the proof of Theorem 5.4, pp. 9–10; BHATT18 line 547.)

André passes through the Artinian quotients A/(pᵐ, `T₁^{pᵐ}`, …, `T_n^{pᵐ}`) and Hochster's coset-stabilisation argument (Hochster 1973 p. 30); the Artin–Rees pro-isomorphism used here (Bhatt Lemma 5.3) needs only the powers of one ideal in the Jacobson radical.

A proof route is the following. By DeformationAndDerivedPatchingAlgebra §1.15 the towers {Hom_A(S, A)/Iⁿ} and {Hom_A(S, A/Iⁿ)} are pro-isomorphic; in particular for each n there is m ≥ n such that the image of Hom_A(S, A/Iᵐ) in Hom_A(S, A/Iⁿ) lies in the image of Hom_A(S, A). A splitting of A/Iᵐ → S/IᵐS is an element φ_m ∈ Hom_A(S, A/Iᵐ) with φ_m(1) = 1. Its image in Hom_A(S, A/Iⁿ) lifts to f ∈ Hom_A(S, A) with f(1) ≡ 1 modulo Iⁿ. f(1) ∈ 1 + I is a unit since I lies in the Jacobson radical, so f(1)⁻¹f is a splitting.

**Checks.**

- For A a complete local ring and I = m_A this reproves that splitting of a finite algebra can be checked on Artinian quotients.
- For A=ℤ, I=ℤ, all quotient rings are zero, but ℤ→ℤ/2 has no retraction; the Jacobson-radical condition prevents this false positive.
- For A=ℤ, M=ℤ/2, Hom(M,ℤ)=0 but Hom(M,ℤ/2ⁿ)≅ℤ/2 for n≥1; the transition from level n+1 to n is zero. Thus a pro-isomorphism need not be an isomorphism at a fixed level.

*Needs:* §0.1; DeformationAndDerivedPatchingAlgebra §1.15; Mathlib `IsNoetherianRing`; Mathlib `Module.Finite`.

### 2.2 Splitting modulo pᵐ of finite extensions of W(k)⟦T₁, …, T_n⟧

Let k be a perfect field of characteristic p, A = W(k)⟦T₁, …, T_n⟧, and B a domain containing A and finite over A, with g ∈ A ∖ pA such that B[1/(pg)] is finite étale over A[1/(pg)]. Then for every m ≥ 1 the map A/pᵐ → B/pᵐB is injective and admits an A/pᵐ-linear retraction.

(ANDRE18B, §3.1, p. 83; ANDRE18B line 589; ANDRE18B, §3.2, Théorème 3.2.1 and Corollaire 3.2.2, p. 83; ANDRE18B line 598; ANDRE18B, §3.3, p. 84; ANDRE18B line 618.)

The setup (B a domain, g outside pA, étale after inverting pg) is supplied by §0.8 for unramified A, where pA is prime.

A proof route is the following. Injectivity: A is integrally closed in A[1/p] and A → B is injective and integral, so pᵐB ∩ A = pᵐA. Let S = `(Â°∞∞)_{!!}` be the faithfully flat A-algebra of PerfectoidSpacesPartII §RA.5 (flat integral model); S/pᵐ is flat over A/pᵐ and B/pᵐ is finitely presented over A/pᵐ, so `Ext¹_{A/pᵐ}`(B̄/Ā, Ā) ⊗ S/pᵐ ≅ `Ext¹_{S/pᵐ}`((B̄ ⊗ S/pᵐ)/(S/pᵐ), S/pᵐ) (flat base change of Ext for finitely presented modules over a Noetherian ring, §0.7). By PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness) (André B Corollaire 3.2.2), S/pᵐ → (B ⊗_A S)/pᵐ is almost pure in the setup (K°∞ + K°°∞[`T^{1/p^∞}`], `T^{1/p^∞}`K°°∞[`T^{1/p^∞}`]) with `T^{1/p^h}` acting as `g^{1/p^h}`; by PerfectoidSpacesPartII §RA.5 (almost pure map) (Lemme A.4.1) the class e ⊗ 1 of the base-changed extension is killed by `g^{1/p^∞}`K°°∞. Apply PerfectoidSpacesPartII §RA.5 (krull detection lemma) with R = A/pᵐ, M = R·e, S/pᵐ faithfully flat and K = `g^{1/p^∞}`K°°∞ S/pᵐ (idempotent): K kills M ⊗ S/pᵐ and K ∩ R contains the class of pg, which is nonzero for m ≥ 2. Hence M = 0, i.e. e = 0, and A/pᵐ → B/pᵐ splits; m = 1 follows from m = 2. When B[1/p] is already étale over A[1/p] (g = 1) the argument only needs Faltings' almost purity; this is the case proved earlier by Bhatt and Shimomoto (André B §0.4).

**Checks.**

- For A=ℤ₂ and g=1, p·g has class 0 modulo p but class 2≠0 modulo p²; perform Krull detection at m≥2, then reduce to m=1.

*Needs:* §0.1; §0.7; §0.8; PerfectoidSpacesPartII §RA.5 (flat integral model); PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness); PerfectoidSpacesPartII §RA.5 (almost pure map); PerfectoidSpacesPartII §RA.5 (krull detection lemma); PerfectoidSpaces §P0 (almost algebra lower shriek shriek); Mathlib `WittVector`; Mathlib `MvPowerSeries`.

### 2.3 André's direct summand theorem for W(k)⟦T₁, …, T_n⟧

The target andre_unramified is specified here in prose.

Let k be a perfect field of characteristic p. Then A = W(k)⟦T₁, …, T_n⟧ is a splinter (§0.2): every finite injective A-algebra B splits over A.

(ANDRE18B, Théorème 0.2.1, p. 72; ANDRE18B line 70; ANDRE18B, §§3.1–3.4, pp. 83–84; ANDRE18B line 589; ANDRE18B, §0.6 and Corollaire 2.6.1, pp. 74 and 82; ANDRE18B line 551.)

The general theorem of Layer 5 uses Bhatt’s argument and, independently, flat domination; both routes treat ramified regular rings as well.

A proof route is the following. Reduce to B a domain with a discriminant g ∈ A ∖ pA (§0.8; A is local, complete, with perfect residue field, and pA is prime). A/pᵐ → B/pᵐB splits for every m (§2.2). Apply §2.1 with I = pA, which lies in the maximal ideal of the local ring A. For Kummer extensions B = integral closure of A in A[`g^{1/p^k}`][1/p] the splitting also follows from purity of Kummer extensions without the Abhyankar fragment (PerfectoidSpacesPartII §RA.5 (kummer purity), André B Corollaire 2.6.1). André also notes that W(k)⟦T⟧ → W(k)⟦T⟧⁺ splits; this is §5.4.

**Checks.**

- For k = 𝔽₂ and n = 0, A = ℤ₂ and B = ℤ₂[√2]: the coefficient functional a + b√2 ↦ a sends 1 to 1 and √2 to 0; the trace sends a + b√2 to 2a, so half the trace is the same functional and is ℤ₂-valued here, although 2 is not a unit. The zero functional sends 1 to 0 and is no splitting.

*Needs:* §0.2; §0.8; §2.2; §2.1; PerfectoidSpacesPartII §RA.5 (kummer purity).

### Examples

At m=1 the detecting scalar pg is zero, while at m=2 and g=1 it is p≠0. Splitting at m=2 first, then reducing, handles the first level. The zero-variable case is W(k).

### Dependencies

Internal statements and proof routes use Layer 0, Layer 2. External inputs: DeformationAndDerivedPatchingAlgebra §1.15; Mathlib `IsNoetherianRing`; Mathlib `Module.Finite`; PerfectoidSpacesPartII §RA.5 (flat integral model); PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness); PerfectoidSpacesPartII §RA.5 (almost pure map); PerfectoidSpacesPartII §RA.5 (krull detection lemma); PerfectoidSpaces §P0 (almost algebra lower shriek shriek); Mathlib `WittVector`; Mathlib `MvPowerSeries`; PerfectoidSpacesPartII §RA.5 (kummer purity).


## Layer 3: Perfectoid covers and Bhatt’s proof

### 3.1 Cohen presentations of complete regular local rings of mixed characteristic

Let (A₀, m, k) be a complete Noetherian regular local ring of mixed characteristic (0, p) and dimension d, with k perfect, and fix a continuous local coefficient map ι : W(k) → A₀ inducing the identity of k (DeformationAndDerivedPatchingAlgebra §1.10). All presentations are W(k)-algebra maps for this ι. (1) Unramified case p ∉ m²: A₀ ≅ W(k)⟦x₂, …, x_d⟧. (2) Ramified case p ∈ m²: for any generators x₁, …, x_d of m, the surjection ψ : W(k)⟦X₁, …, X_d⟧ → A₀, X_i ↦ x_i, has kernel generated by one element p − f with f ∈ (p, X₁, …, X_d)², f having no constant term and p ∤ f.

(BHATT18, Proof of Proposition 5.2, pp. 8–9; BHATT18 line 469.)

The coefficient-compatible regular-local corollary here retains the specified coefficient map; its two presentations distinguish p ∉ m² from p ∈ m².

A proof route is the following. (1) p is part of a regular system of parameters (p, x₂, …, x_d); the map W(k)⟦X₂, …, X_d⟧ → A₀ is surjective (DeformationAndDerivedPatchingAlgebra §§1.9–1.10) between regular local rings of the same dimension, hence an isomorphism (DeformationAndDerivedPatchingAlgebra §3.4). (2) ψ is a surjection of regular local rings of dimensions d + 1 and d, so its kernel is generated by one element h that is part of a regular system of parameters (DeformationAndDerivedPatchingAlgebra §3.4). Since p ∈ m² is in the image of (p, X)², p ≡ f′ modulo ker ψ for some f′ ∈ (p, X)², and h can be taken as p − f with f ∈ (p, X)². Write the initial generator as p − f₀ with f₀ ∈ (p,X)² and constant term c ∈ p²W(k). Put u = 1 − c/p, a unit of W(k), and f = (f₀ − c)/u. Multiplying the generator by u⁻¹ gives p − f; now f has zero constant term and is still in (p,X)². If p divides f then p − f is p times a unit, forcing characteristic p, contrary to mixed characteristic.

**Checks.**

- A₀ = ℤ_p[√p]⟦x₂⟧ ≅ ℤ_p⟦X₁, X₂⟧/(p − X₁²) is a ramified example with f = X₁².
- If f₀=p²+X², its constant term is p² and u=1−p; replacing p−f₀ by u⁻¹(p−f₀) gives p−X²/(1−p), with zero constant term.

*Needs:* DeformationAndDerivedPatchingAlgebra §1.10; DeformationAndDerivedPatchingAlgebra §§1.9–1.10; DeformationAndDerivedPatchingAlgebra §3.4; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `WittVector`; Mathlib `MvPowerSeries`; Mathlib `IsRegularLocalRing`.

### 3.2 Perfectoid covers of regular local rings

Let A₀ be a p-torsion-free Noetherian regular local ring with residue characteristic p, and K = Q_p(`p^{1/p^∞}`)^ with t = p. After replacing A₀ by a complete regular local ring with algebraically closed residue field k that is faithfully flat over it, construct A₀ → A as follows. Unramified case (A₀ ≅ W(k)⟦x₂, …, x_d⟧): A is the p-adic completion of A₀[`p^{1/p^∞}`, `x₂^{1/p^∞}`, …, `x_d^{1/p^∞}`]. Ramified case (A₀ = W(k)⟦X₁, …, X_d⟧/(p − f)): let P_m = W(k)⟦`X^{1/pᵐ}`⟧ and A′ the p-adic completion of colim_m P_m/(p − f); there is a unit u ∈ A′ with gᵖ = pu, where g = `σ^{-1}`(f)(`X^{1/p}`) ∈ P₁ (σ the Witt vector Frobenius), so A′[1/p] is a perfectoid Tate ring with a pseudouniformizer π, πᵖ = pv for a unit v; let A be the π-adic completion of the integral closure of A′ in A′[1/p][`v^{1/p^∞}`], normalised by passing to almost elements. In both cases A is an integral perfectoid K°-algebra in which p has a compatible system of p-power roots.

(BHATT18, Proposition 5.2 (1) and its proof, pp. 8–9; BHATT18 line 469.)

Adjoin the roots of the unit v to the generic algebra, then take the integral closure and pass to almost elements. The resulting A, rather than A′, receives K° and the compatible roots of p. Integral models are K°-algebras.

A proof route is the following. Reduce to complete A₀ with algebraically closed residue field (§0.8, the residue-field step) and choose the Cohen presentation (§3.1). Unramified case: A is integral perfectoid over K° (PerfectoidSpaces §P1.25, PerfectoidQuotients §0.7). Ramified case: P₀ → P_m is faithfully flat, so A₀ → A′ is faithfully flat; gᵖ ≡ f modulo p gives gᵖ = f + ph = p(1 + h) with h without constant term, so u = 1 + h is a unit; A′[1/p] is a perfectoid Tate ring in the generalised sense (PerfectoidSpaces §P1.1). Since gᵖ = pu with u a unit, gᵖ divides p, so PerfectoidSpaces §P1.4 (exists pseudouniformizer with compatible roots), applied to g, gives π = gw with w a unit and compatible p-power roots; then πᵖ = p·u·wᵖ, so πᵖ = pv with v = uwᵖ a unit, as used in BHATT18 Proposition 5.2. A′[1/p] → A′[1/p][`v^{1/p^∞}`] is ind-finite étale; almost purity (PerfectoidSpaces §P3 (almost purity theorem), PerfectoidSpaces §P3 (integral closure almost finite etale)) makes A an integral perfectoid ring, π-torsion-free, with A′ → A almost faithfully flat modulo π; the roots of p come from π and v. Pass to almost elements (PerfectoidSpaces §P0 (almost hom and adjoints)).

The interface has the following laws.

- The integral perfectoid K°-algebra A attached to A₀ (after the reductions), with its structure map A₀ → A.
- A is an integral perfectoid K°-algebra (PerfectoidSpaces §P1.24 predicate and PerfectoidQuotients §0.7 fixed-field comparison).
- A compatible system of p-power roots of p in A, giving the almost setup (A, `p^{1/p^∞}`A).
- If p ∉ `m_{A₀}`², A₀ → A is faithfully flat.
- `Tor_i^{A₀}`(M, A) is almost zero for i > 0 (§3.3).

**Checks.**

- For A₀ = ℤ_p the cover is the p-adic completion of ℤ_p[`p^{1/p^∞}`], the valuation ring of Q_p(`p^{1/p^∞}`)^.
- In the unramified case A₀ → A is faithfully flat in Mathlib's sense (Module.FaithfullyFlat), by Bhatt's Proposition 5.1.
- For A₀=ℤ₂ and A the valuation ring of the completion of ℚ₂(`2^{1/2^∞}`), the class of `2^{1/4}` in A/`2^{1/2}`A is nonzero (valuation 1/4 < 1/2), and Frobenius x↦x² sends it to the class of `2^{1/2}` in A/2A, again nonzero (1/2 < 1). The zero map would send it to 0, so this tests that Frobenius A/`p^{1/p}` → A/p is the isomorphism required of an integral perfectoid algebra.
- For d ≥ 1, A is not Noetherian (the ideal generated by all `p^{1/pⁿ}` is not finitely generated); the cover cannot be replaced by a Noetherian regular extension of A₀.
- For p=2, the valuation of `2^{1/2ⁿ}` is `2^{-n}`; these positive values tend to zero, and their root ideal is not finitely generated.

*Needs:* §0.8; §3.1; PerfectoidSpaces §P1.25; PerfectoidQuotients §0.7; PerfectoidSpaces §P1.1; PerfectoidSpaces §P1.4 (exists pseudouniformizer with compatible roots); PerfectoidSpaces §P3 (almost purity theorem); PerfectoidSpaces §P3 (integral closure almost finite etale); PerfectoidSpaces §P0 (almost hom and adjoints); PerfectoidSpaces §P0 (root ideal basic setup).

### 3.3 The perfectoid cover is almost faithfully flat

For A₀ → A as in §3.2 and every A₀-module M: (a) `Tor_i^{A₀}`(M, A) is almost zero (killed by every `p^{1/pⁿ}`) for i > 0; (b) if M `⊗_{A₀}` A is almost zero then M = 0. In the unramified case A₀ → A is faithfully flat.

(BHATT18, Proposition 5.2 (2) and the end of its proof, pp. 8–9; BHATT18 line 469; BHATT18, Proposition 5.1 and proof, p. 8; BHATT18 line 451.)

Almost mathematics is with respect to `p^{1/p^∞}`A, which equals `π^{1/p^∞}`A and the radical of pA.

A proof route is the following. Factor A₀ → A′ → `A_{!!}` → A, where `A_{!!}` is the left adjoint of almostification applied to A (PerfectoidSpaces §P0 (almost algebra lower shriek shriek)); `A_{!!}` → A is an injective almost isomorphism, `A_{!!}` is p-adically complete and p-torsion-free. Formation of `(·)_{!!}` commutes with reduction modulo pᵐ, and A′ → A is almost faithfully flat modulo π, so A′ → `A_{!!}` is faithfully flat modulo pᵐ (PerfectoidSpaces §P0 (lower shriek shriek faithful flatness)); by Bhatt's Proposition 5.1 (DerivedDeRhamCohomology §1.10) A₀ → `A_{!!}` is faithfully flat. This gives (a). (b): reduce by faithful flatness and a filtration to M = A₀/I; then `π^{1/pⁿ}` ∈ `IA_{!!}` for all n, so p = πᵖ `v^{-1}` ∈ `I^{pⁿ}A_{!!}` and, by faithful flatness, p ∈ `I^{pⁿ}` for all n. Krull's intersection theorem (Mathlib Ideal.iInf_pow_eq_bot_of_isLocalRing) forces I = A₀ since p ≠ 0.

**Checks.**

- For M = A₀/m the conclusion (b) says m A is not almost equal to A: the roots of p do not all lie in mA up to almost zero error.
- For A₀=ℤ₂ and A=O_K, A/2A≠0 and `2^{1/2}` has valuation 1/2<1, so its residue in A/2A is nonzero; the residue module is not almost zero.

*Needs:* §3.2; PerfectoidSpaces §P0 (almost algebra lower shriek shriek); PerfectoidSpaces §P0 (lower shriek shriek faithful flatness); PerfectoidSpaces §P0 (almost zero limits and colimits); DerivedDeRhamCohomology §1.10; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`; Mathlib `Module.FaithfullyFlat`.

### 3.4 Detection of the splitting obstruction after perfectoid base change

Let A₀ be a complete Noetherian regular local ring of mixed characteristic (0, p), Q₀ a perfect complex of A₀-modules and α₀ ∈ `Hom_{D(A₀)}`(Q₀, A₀[1]); put P = `RHom_{A₀}`(Q₀, A₀). Let g ∈ A₀ be nonzero in A₀/p, A₀ → `A_{∞,0}` the perfectoid cover (§3.2) and `A_{∞,0}` → A∞ Bhatt's root extension of g (PerfectoidQuotients §1.3), and write α∞/pᵐ for the derived base change of α₀ modulo pᵐ. If α₀ ≠ 0, then there are m ≥ 3 with α₀/pᵐ ≠ 0 and k ≥ 0 such that `(pg)^{1/p^k}` does not annihilate α∞/pᵐ in `Hom_{D(A∞)}`(Q₀ ⊗^L A∞, A∞/pᵐ[1]).

(BHATT18, Proof of Theorem 5.4, second and third paragraphs, p. 10; BHATT18 line 563; BHATT18, Proof of Theorem 6.1, p. 11; BHATT18 line 604; BHATT18, Theorem 2.3, p. 4; BHATT18 line 202.)

For the direct summand theorem Q₀ = B₀/A₀ in degree 0, which is perfect because A₀ is regular (EnhancedDerivedSheaves §E1.6); for the derived theorem Q₀ is the cone of A₀ → RΓ(X₀, O) (§7.2).

m ≥ 3 is used so that p²g ≠ 0 in A₀/pᵐ. The theorem is used contrapositively: almost vanishing of α∞/pᵐ for `(pg)^{1/p^∞}` forces α₀ = 0.

A proof route is the following. For P = RHom(Q₀,A₀), the triangle for multiplication by pᵐ gives 0 → H¹(P)/pᵐ → H¹(P ⊗^L A₀/pᵐ) → H²(P)[pᵐ] → 0. Transitions on the last term are multiplication by p. The p-primary torsion in finite H²(P) is bounded, so that tower is pro-zero. This proves the needed complex comparison directly from finite cohomology, rather than attributing a complex theorem to the finite-module Hom supplier. Krull's intersection theorem for the finite module H¹(P) gives m ≥ 3 with α₀/pᵐ ≠ 0, so Ann(α₀/pᵐ) ≠ A₀/pᵐ; Krull again gives k with p²g ∉ `(Ann(α₀/pᵐ))^{p^k}`. Choose a bounded finite free representative of Q₀. Tensor its dual modulo pᵐ along the two almost faithfully flat maps. The finite filtration, or its Tor spectral sequence, identifies cohomology after tensoring up to an almost isomorphism. This proves the almost Hom comparison for this perfect Q₀; arbitrary complexes are not covered by a module-only flatness assertion. Annihilators therefore satisfy pg ∉ `(Ann(α∞/pᵐ))^{p^k}`, losing one power of p in passing to almost mathematics, hence `(pg)^{1/p^k}` ∉ Ann(α∞/pᵐ).

**Checks.**

- For A₀=ℤ₂, g=1 and m=3, p²g=4 is nonzero in ℤ/8; at m=2 it is zero. The lower bound m≥3 distinguishes the detection step.

*Needs:* §0.7; §3.2; §3.3; PerfectoidQuotients §1.3; PerfectoidQuotients §1.4; DeformationAndDerivedPatchingAlgebra §1.15; EnhancedDerivedSheaves §E1.6; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`.

### 3.5 Almost splitting on the annuli A∞⟨pⁿ/g⟩

In the setting of §3.4, let A₀ → B₀ be finite and injective with B₀[1/(pg)] finite étale over A₀[1/(pg)]. In this section Q₀ = B₀/A₀ in degree 0, the cone of the unit A₀ → B₀, and α₀ : Q₀ → A₀[1] is its connecting morphism (§0.7); put Q∞ = Q₀ `⊗^L_{A₀}` A∞. Let A∞⟨pⁿ/g⟩ be the annular tower of A∞ (PerfectoidSpacesPartII §RA.1 (annular tower), with t = p). For fixed m, n ≥ 1 the base change A∞⟨pⁿ/g⟩ → B₀ `⊗^L_{A₀}` A∞⟨pⁿ/g⟩ is almost split with respect to `p^{1/p^∞}` (Conventions); hence the image of α∞/pᵐ in `Hom_{D(A∞)}`(Q∞, A∞⟨pⁿ/g⟩/pᵐ[1]) is almost zero for `p^{1/p^∞}`.

(BHATT18, Proof of Theorem 5.4, fourth paragraph, p. 10; BHATT18 line 563.)

g divides pⁿ in A∞⟨pⁿ/g⟩, so after inverting p the base change of A₀ → B₀ is finite étale.

A proof route is the following. Since g | pⁿ in A∞⟨pⁿ/g⟩, the algebra B₀ ⊗ A∞⟨pⁿ/g⟩[1/p] is finite étale over the perfectoid Tate ring A∞⟨pⁿ/g⟩[1/p]. Almost purity (PerfectoidSpaces §P3 (almost purity theorem), PerfectoidSpaces §P3 (integral closure almost finite etale)) dominates the base change by an almost finite étale cover of A∞⟨pⁿ/g⟩, which is almost split (the trace of an almost finite étale algebra, PerfectoidSpaces §P0 (almost dual and trace); BHATT18, proof of Theorem 5.4, p.10). Almost splitting passes to the reduction modulo pᵐ and kills the image of the obstruction up to `p^{1/p^∞}`. The obstruction is that of the algebra unit itself: an arbitrary perfect Q₀ with an arbitrary morphism to A₀[1] is not controlled by B₀.

**Checks.**

- For B₀ = A₀ the cone Q₀ and the obstruction α₀ are zero, so every root annihilates the image. By contrast, for A₀ = ℤ₂, g = 1, m = 3 and the unrelated identity morphism of A₀[1] (with Q₀ replaced by A₀[1]), the image in `Hom`(A∞[1], A∞/8[1]) = A∞/8 is the class of 1, and `2^{1/2}`·1 ≠ 0 there because its valuation 1/2 is less than 3; it is not almost zero.

- For g = 1 the annulus has the equation U = pⁿ, so its integral model is A∞ itself for every n, the annular tower is constant and the comparison is the identity; the statement is then the almost splitting in the case where B₀[1/p] is étale over A₀[1/p], which Faltings' almost purity already gives (André B §0.4, p. 73; ANDRE18B line 113).

- For 𝔽₄=𝔽₂[ω] with ω²+ω+1=0, the field trace has Tr(1)=0 and Tr(ω)=1. The functional z↦Tr(ωz) takes 1 to 1. Thus a faithful finite étale algebra can split even when its degree is not invertible; dividing its trace by the degree is not the argument (PerfectoidSpaces §P0.12, trace pairing).

*Needs:* §3.4; §0.7; PerfectoidSpacesPartII §RA.1 (annular tower); PerfectoidSpaces §P3 (almost purity theorem); PerfectoidSpaces §P3 (integral closure almost finite etale); PerfectoidSpaces §P0 (almost dual and trace).

### 3.6 From the annuli back to A∞: the limit argument

In the setting of §3.4, put Q∞ = Q₀ `⊗^L_{A₀}` A∞. If for every n ≥ 1 the image of α∞/pᵐ in `Hom_{D(A∞)}`(Q∞, A∞⟨pⁿ/g⟩/pᵐ[1]) is almost zero for `p^{1/p^∞}`, then α∞/pᵐ is almost zero for `(pg)^{1/p^∞}`.

(BHATT18, Proof of Theorem 5.4, last paragraph, p. 10; BHATT18 line 563; BHATT18, Remark 4.3 and proof of Theorem 6.1, pp. 7 and 11; BHATT18 line 604.)

Q₀ is perfect, so `RHom_{A∞}`(Q∞, A∞⟨pⁿ/g⟩/pᵐ) = K `⊗^L_{A∞/pᵐ}` A∞⟨pⁿ/g⟩/pᵐ with K = `RHom_{A∞}`(Q∞, A∞/pᵐ). For Q₀ = B₀/A₀ this is the last paragraph of the proof of Bhatt’s Theorem 5.4; for the cone of A₀ → RΓ(X₀, O) it is the corresponding step of Theorem 6.1.

A proof route is the following. Represent K by a bounded complex of finite projective A∞/pᵐ-modules, using perfection of Q₀. RA.1’s general quantitative Riemann comparison applies to the coefficient modules. Tensoring its cone with K and filtering by the finitely many terms preserves almost-pro-zero cohomology; RA.0’s linear-functor input and idempotence of the root ideal absorb the finitely many losses. The bound may depend on the finite amplitude; no statement uniform over all complexes is used. Consequently each relevant cohomology tower, including degree zero, is almost-pro-isomorphic to a constant tower. The degree-zero tower has almost-zero lim¹ by RA.0’s derived-limit theorem; the resulting map Hom(Q∞,A∞/pᵐ[1]) → lim_n Hom(Q∞,A∞⟨pⁿ/g⟩/pᵐ[1]) is an almost isomorphism for `(pg)^{1/p^∞}`. Each compatible component of the obstruction is annihilated by every root of p, hence by every root of pg; the limit has the same property. Almost injectivity of the comparison, and idempotence of the root ideal, make the original obstruction almost zero.

**Checks.**

- For a constant tower V with identity transitions, lim V=V and lim¹ V=0; for the zero perfect complex both Hom groups are zero.

*Needs:* §3.4; PerfectoidSpacesPartII §RA.1 (quantitative riemann extension derived); PerfectoidSpacesPartII §RA.1 (quantitative riemann extension general); PerfectoidSpacesPartII §RA.0 (almost pro zero linear functor); PerfectoidSpacesPartII §RA.0 (almost pro zero derived limit); PerfectoidSpacesPartII §RA.0 (almost pro zero tower); DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3.

### 3.7 Bhatt's direct summand theorem for complete regular local rings

The target bhatt_mixed is specified here in prose.

Every complete Noetherian regular local ring A₀ of mixed characteristic (0, p), ramified or not, is a splinter (§0.2).

(BHATT18, Theorem 5.4 and proof, p. 10; BHATT18 line 563; BHATT18, Theorem 1.1 and §1.2, pp. 1–3; BHATT18 line 17.)

Theorem 5.4 of Bhatt is stated for regular A₀ and a finite extension A₀ → B₀; the reduction to the complete local case is §0.8.

A proof route is the following. Reduce to B₀ a domain finite over A₀ with a discriminant g nonzero in A₀/p (§0.8). The obstruction α₀ of A₀ → B₀ (§0.7) has perfect cone B₀/A₀. If α₀ ≠ 0, §3.4 gives m, k with `(pg)^{1/p^k}` ∉ Ann(α∞/pᵐ). §3.5 and §3.6 show α∞/pᵐ is almost zero for `(pg)^{1/p^∞}`, a contradiction. Hence α₀ = 0 and A₀ → B₀ splits.

**Checks.**

- For p odd, A₀ = ℤ_p⟦x⟧ and B₀ = A₀[y]/(y² − x − p): the discriminant is 4(x + p), so g = x + p, which is nonzero modulo p, and the theorem gives a splitting (here also visible directly, B₀ being free with basis 1, y).
- At p=2 the free quadratic example still splits by a+by↦a; its discriminant is 4(x+2), so 4 belongs to the p-factor and g=x+2 remains nonzero modulo 2.

*Needs:* §0.2; §0.7; §0.8; §3.4; §3.5; §3.6; EnhancedDerivedSheaves §E1.6.

### Examples

The ramified ring ℤ₂⟦T,V⟧/(TV−2) has 2 in the square of its maximal ideal. The quadratic finite algebra with relation Y²−X−p splits on the basis 1,Y for p=2 and p=3, although the discriminant has different p-parts.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 3. External inputs: DeformationAndDerivedPatchingAlgebra §1.10; DeformationAndDerivedPatchingAlgebra §§1.9–1.10; DeformationAndDerivedPatchingAlgebra §3.4; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `WittVector`; Mathlib `MvPowerSeries`; Mathlib `IsRegularLocalRing`; PerfectoidSpaces §P1.25; PerfectoidQuotients §0.7; PerfectoidSpaces §P1.1; PerfectoidSpaces §P1.4 (exists pseudouniformizer with compatible roots); PerfectoidSpaces §P3 (almost purity theorem); PerfectoidSpaces §P3 (integral closure almost finite etale); PerfectoidSpaces §P0 (almost hom and adjoints); PerfectoidSpaces §P0 (root ideal basic setup); PerfectoidSpaces §P0 (almost algebra lower shriek shriek); PerfectoidSpaces §P0 (lower shriek shriek faithful flatness); PerfectoidSpaces §P0 (almost zero limits and colimits); DerivedDeRhamCohomology §1.10; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`; Mathlib `Module.FaithfullyFlat`; PerfectoidQuotients §1.3; PerfectoidQuotients §1.4; DeformationAndDerivedPatchingAlgebra §1.15; EnhancedDerivedSheaves §E1.6; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3; PerfectoidSpacesPartII §RA.1 (annular tower); PerfectoidSpaces §P0 (almost dual and trace); PerfectoidSpacesPartII §RA.1 (quantitative riemann extension derived); PerfectoidSpacesPartII §RA.1 (quantitative riemann extension general); PerfectoidSpacesPartII §RA.0 (almost pro zero linear functor); PerfectoidSpacesPartII §RA.0 (almost pro zero derived limit); PerfectoidSpacesPartII §RA.0 (almost pro zero tower).


## Layer 4: Big Cohen–Macaulay algebras

### 4.1 Almost Cohen–Macaulay algebras

The target AlmostCMFor is specified here in prose.

Let (B, m_B) be a Noetherian local ring of residue characteristic p and dimension d, x = (x₁, …, x_d) a system of parameters, and D a B-algebra containing a nonzerodivisor π with a compatible system of p-power roots `π^{1/p^h}` (`π^{1/p⁰}` = π, (`π^{1/p^{h+1}}`)ᵖ = `π^{1/p^h}`). Put J = Σ_h `π^{1/p^h}`D. D is almost Cohen–Macaulay for (B, x, `π^{1/p^∞}`) if J ⊄ m_B D and J annihilates ((x₁, …, x_i)D :_D `x_{i+1}`) / (x₁, …, x_i)D for every 0 ≤ i < d.

(ANDRE18B, Définition 4.1.1(3) and footnote 6, p. 84; ANDRE18B line 643.)

Almostness is with respect to the ideal J generated by the roots of π, which need not be a valuation ideal: in André's application π = ϖg (source footnote 6).

The roots are data; the condition depends on the root system only through J. The algebra D = B° of André B (18), constructed in §4.8, is the application: it is almost Cohen–Macaulay for (B, x, `(ϖg)^{1/p^∞}`).

A proof route is the following. The condition J ⊄ m_B D says that D is not almost equal to m_B D in the setup (D, J). If D is big Cohen–Macaulay for x and `π^{1/p^h}` ∉ m_B D for some h, D is almost Cohen–Macaulay; conversely almost Cohen–Macaulay with J = D (π a unit) is big Cohen–Macaulay.

The interface has the following laws.

- The root ideal survives the maximal-ideal quotient and its product with each parameter colon lies in the corresponding preceding parameter ideal.
- A big Cohen–Macaulay algebra for x in which some root of π lies outside m_B D is almost Cohen–Macaulay.
- For A ⊆ B finite with A Cohen–Macaulay local and x ⊂ A a system of parameters of B, D is almost Cohen–Macaulay for (B, x) iff for (A, x) (§4.6).
- Every root `π^{1/p^h}` kills each colon module ((x₁, …, x_i)D : `x_{i+1}`) / (x₁, …, x_i)D.

The definition requires p to be prime and B to have residue characteristic p; values p=0 and p=1 are outside it. The roots themselves remain specified data.

**Checks.**

- If D is big Cohen–Macaulay for x (§0.3) and π is a unit, D is almost Cohen–Macaulay for (B, x, `π^{1/p^∞}`).
- For B = ℤ_p, x = (p), π = p and D the valuation ring of Q_p(`p^{1/p^∞}`)^ with its roots of p, D is almost Cohen–Macaulay: p is a nonzerodivisor on D and J = m_D ⊄ pD.
- For B = 𝔽_p⟦X, Y⟧/(XY, Y²), x = (X), D = B and π = 1 (all roots 1), the colon module (0 :_D X) = (Y) is not killed by J = D, so D is not almost Cohen–Macaulay; a definition keeping only the condition J ⊄ m_B D fails this test.
- If dim B = 0 the colon condition is empty and D is almost Cohen–Macaulay iff J ⊄ m_B D.
- For D=0 all colons vanish but every root belongs to m_BD=0; the surviving-root condition fails.

*Needs:* §0.3; DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); PerfectoidSpaces §P0 (root ideal basic setup); Mathlib `IsSMulRegular`.

### 4.2 Hochster's algebra modifications

Let (R, m) be a Noetherian local ring, x = (x₁, …, x_d) a system of parameters and T a commutative R-algebra. For 0 ≤ k < d and a relation `x_{k+1}u_{k+1}` = `Σ_{j≤k}` x_j u_j with u_j ∈ T, the algebra modification of T for this relation is `T′ = T[X₁,…,X_k]/(F)`, F = `u_{k+1}` − `Σ_{j≤k}` x_j X_j, where (F) is the ideal generated by F in the polynomial ring over T, together with the constant map T → T′. A sequence of algebra modifications of T with respect to x is a finite chain T = T₀ → T₁ → ⋯ → T_ℓ in which each step is the algebra modification of the preceding algebra for a relation in it; k may change from step to step. The sequence is bad if the image of 1 lies in mT_ℓ. For a local homomorphism (R, m) → (S, n) and a system of parameters y of S, a double sequence first takes a sequence of algebra modifications T₀ → ⋯ → T_ℓ of T over R with respect to x and then a sequence U₀ = S ⊗_R T_ℓ → ⋯ → U_s over S with respect to y; it is bad if the image of 1 lies in nU_s.

(HOCHSTER02, Definition 3.1 and the following paragraphs, pp. 6–7 of the author preprint; HOCHSTER02 line 172; HOCHSTER02 line 187.)

The quotient is by the ideal generated by F, so multiples of F by polynomials with coefficients in T are killed. A quotient by the R-submodule spanned by multiples of F with scalar coefficients is a different, non-algebra construction and is not used.

A proof route is the following. T′ is a quotient of a polynomial algebra over T, hence a commutative T-algebra, and the class of F vanishes, so the image of `u_{k+1}` equals Σ x_j X_j in T′. The universal properties of polynomial rings and quotients give the extension law. If x is weakly regular on an R-algebra D and α : T → D is an R-algebra map, then `x_{k+1}α(u_{k+1})` ∈ (x₁, …, x_k)D, so `α(u_{k+1})` = Σ x_j d_j for some d_j ∈ D, and X_j ↦ d_j extends α. Every element of T_ℓ is the class of a polynomial over T in the finitely many variables adjoined along the sequence, and badness is witnessed by one equation 1 = Σ m_s w_s in T_ℓ with m_s in a finite generating set of m.

The interface has the following laws.

- The algebra modification is a commutative T-algebra with the specified constant map, and in it the image of `u_{k+1}` lies in (x₁, …, x_k)T′.
- T-algebra maps T′ → D correspond to families `(d_j)_{j≤k}` in D with the image of `u_{k+1}` equal to Σ x_j d_j.
- If x is weakly regular on an R-algebra D, every R-algebra map T → D extends along every sequence of algebra modifications of T with respect to x; for a double sequence and a compatible pair of algebras on which x and y are weakly regular, the pair of maps extends along both parts.
- A bad sequence has a finite witness: finitely many polynomial representatives of bounded total degree for the relation coefficients of each step and for elements w_s of T_ℓ with 1 = Σ m_s w_s, m_s ∈ m.

**Checks.**

- For k=0 the modification is T/u₁T. Take R=k⟦x⟧, T=R[t]/(xt) and the relation x·t=0: the modification is T/tT=R, in which t and t² vanish and 1 maps to 1, so this one-step sequence is not bad. The R-module quotient T/Rt would still contain the nonzero class of t²; this distinguishes the algebra modification from a scalar-multiple quotient.
- For R = K⟦X, Y⟧/(XY, Y²) with system of parameters (X) and the relation X·Y = 0 (k = 0, u₁ = Y), R → R/RY kills Y ≠ 0: modifications need not be injective, so a definition making T′ an extension of T is wrong.
- For R=T=k⟦x,y⟧ with x=(x,y) and the relation y·x=x·y (k=1, u₂=x, u₁=y), the modification is R[X]/(x−xX). Evaluation X↦1 kills x−xX and retracts the constant map.
- For R=T=k⟦x,y⟧ and the zero relation y·0=x·0, the modification is R[X]/(xX). Its class X is nonzero and xX=0; evaluation X↦0 retracts the source, but the complement has x-torsion.
- For R=k⟦X⟧ and T=R/(X), the relation X·1=0 (k=0, u₁=1) gives T/T=0, in which 1 lies in m·0; the one-step sequence is bad.

*Needs:* DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); Mathlib `IsLocalRing`; Mathlib `RingTheory.Sequence.IsWeaklyRegular`.

### 4.3 Hochster's modification criterion for (weakly functorial) big Cohen–Macaulay algebras

Let (R, m) → (S, n) be a local homomorphism of Noetherian local rings with systems of parameters x of R and y of S, and T an R-algebra. There is a commutative square R → B → C, R → S → C, with R → B factoring through T, B a balanced big Cohen–Macaulay R-algebra and C a balanced big Cohen–Macaulay S-algebra, if and only if there is no bad double sequence of algebra modifications (§4.2) of T over R → S with respect to x and y. Taking S = R and T = R: a Noetherian local ring R has a balanced big Cohen–Macaulay algebra iff no sequence of algebra modifications of R with respect to x is bad.

(HOCHSTER02, §3, pp. 6–7 of the author preprint; HOCHSTER02 line 180; HOCHSTER02 line 192; HEITMANNMA18, Theorem 1.6 and the discussion after it, pp. 3–4; HEITMANNMA18 line 123.)

Fixed systems of parameters for the two bases suffice, as in Heitmann–Ma Theorem 1.6; balance comes from completion (§0.5). Hochster’s formulation also permits varying systems.

A proof route is the following. Only if: x is weakly regular on B and y on C, so by §4.2 the maps T → B and S ⊗_R T_ℓ → C extend along any double sequence; a bad one would put 1 into nC, contradicting C ≠ nC. If: let B′ be the direct limit of the countable tower B₀ = T, `B_{i+1}` = the simultaneous algebra modification of B_i for all relations with respect to x in B_i; any finite computation in B′ takes place in a finite sequence of algebra modifications of T, so x is weakly regular on B′ by construction, and B′ ≠ mB′ when no sequence is bad. Build C′ from S ⊗_R B′ in the same way with respect to y; a relation or witness in C′ involves finitely many elements, which come from some S ⊗_R T_ℓ, so C′ ≠ nC′ when no double sequence is bad. Thus B′ and C′ are big Cohen–Macaulay for x and y; their m-adic and n-adic completions are balanced (§0.5), and locality of R → S extends B′ → C′ to the completions. The uncompleted modification algebras have cardinality at most κ = max(|T|, |S|, ℵ₀); their countable inverse-limit completions have cardinality at most κ^ℵ₀. Both constructions stay in the universes fixed in the Conventions.

**Checks.**

- For S=R Cohen–Macaulay and T=R, every R-algebra map R → R extends along each step by §4.2, the image of 1 stays 1 ∉ m, and no sequence is bad.
- For R=S=k⟦x⟧ and T=R[t]/(xt), the step T → T/tT=R is not bad, and T maps to the balanced big Cohen–Macaulay algebra R by t↦0, as the criterion predicts.
- For R=k⟦X⟧ and T=R/(X), the bad one-step sequence of §4.2 shows that no big Cohen–Macaulay R-algebra C receives T: X would kill 1 in C, while X is a nonzerodivisor on C≠0.

*Needs:* §4.2; §0.3; §0.4; §0.5.

### 4.4 Hochster's key lemma: extending algebra maps with controlled denominators

Let (R, m) be a Noetherian local ring with system of parameters x, D an R-algebra, π ∈ D a nonzerodivisor with a compatible system of p-power roots, and write `π^a` for a ∈ `ℤ[1/p]_{≥0}` by means of these roots. Let α : T → D[1/π] be an R-algebra map and T → T′ the algebra modification for a relation `x_{k+1}u_{k+1}` = `Σ_{j≤k}` x_j u_j in T, with α(u_j) ∈ `π^{-e}`D for all j ≤ k+1 and some e ∈ `ℤ[1/p]_{≥0}`. If `π^{1/p^m}` annihilates ((x₁, …, x_k)D :_D `x_{k+1}`)/(x₁, …, x_k)D, then there are w_j ∈ D with `π^{e+1/p^m}α(u_{k+1})` = Σ x_j w_j, and X_j ↦ `π^{-(e+1/p^m)}`w_j extends α to an R-algebra map β : T′ → D[1/π]. An element of T′ represented by a polynomial of total degree at most δ whose coefficients have α-images in `π^{-e′}`D has β-image in `π^{-(e′+δ(e+1/p^m))}`D.

(HOCHSTER02, Lemma 5.1 and its proof, pp. 9–10 of the author preprint; HOCHSTER02 line 258; ANDRE18B, Proof of Proposition 4.1.2, p. 85; ANDRE18B line 664.)

This is Hochster’s evaluation argument applied to the algebra modification. Denominators are tracked only on the finitely many polynomial representatives that a finite witness uses, so no degree-bounded module quotient is needed.

A proof route is the following. Since π is a nonzerodivisor, D ⊆ D[1/π], and multiplying the image of the relation by `π^e` gives `x_{k+1}(π^e α(u_{k+1}))` = Σ x_j (`π^e` α(u_j)) in D. Hence `π^e α(u_{k+1})` lies in the colon ideal, and `π^{1/p^m}` times it lies in (x₁, …, x_k)D, which gives the w_j. The R-algebra map T[X] → D[1/π] extending α by X_j ↦ `π^{-(e+1/p^m)}`w_j sends F to `α(u_{k+1})` − Σ x_j `π^{-(e+1/p^m)}`w_j = 0, so it factors through T′. A monomial of degree at most δ with coefficient of exponent at most e′ maps into `π^{-(e′+δ(e+1/p^m))}`D.

**Checks.**

- If π is a unit, D[1/π]=D, the annihilation hypothesis says the colon equals the preceding parameter ideal, and β is the extension of §4.2 for an algebra on which x is weakly regular.
- For p=2, e=0 and m=1, the new variables have exponent 1/2; a coefficient of a later relation of degree 2 in them has exponent 1, and the variables of that next step have exponent 1+1/2=3/2.
- For k=0 and x₁ a nonzerodivisor on D, the colon module is zero and x₁α(u₁)=0 forces α(u₁)=0 in D[1/π]; β is the induced map on T/u₁T. If instead x₁ kills a nonzero element of D, the hypothesis asks `π^{1/p^m}` to kill it, which fails for D=k⟦X,Y⟧/(XY,Y²), x₁=X and π=1.

*Needs:* §4.2; Mathlib `IsSMulRegular`.

### 4.5 Almost Cohen–Macaulay algebras give balanced big Cohen–Macaulay algebras

The target almostCM_exists_balanced is specified here in prose.

Let B be a Noetherian local ring of residue characteristic p. If B has an almost Cohen–Macaulay algebra D for (B, x, `π^{1/p^∞}`) (§4.1) for some system of parameters x and some root system of a nonzerodivisor π of D, then B has a balanced big Cohen–Macaulay algebra.

(ANDRE18B, Proposition 4.1.2 and its proof, p. 85; ANDRE18B line 664; HOCHSTER02, Lemma 5.1 and §3, pp. 6–10; HOCHSTER02 line 258.)

The construction yields choice-dependent R-algebra maps from the finite stages of a sequence of algebra modifications into D[1/π]; it does not promise an algebra factorization of B→D through the resulting big Cohen–Macaulay algebra.

Choose the root index large relative to the finitely many degrees and the length of a witness, so that the accumulated denominator is at most `π^{-1/p^h}`, for any prescribed h.

A proof route is the following. Fix a sequence B = T₀ → ⋯ → T_ℓ of algebra modifications with respect to x and a witness 1 = Σ m_s w_s, m_s ∈ m_B, w_s ∈ T_ℓ. Represent the relation coefficients of every step and the w_s by polynomials over B, of total degree at most δ ≥ 1. Choose h with `π^{1/p^h}` ∉ m_B D; it exists because J ⊄ m_B D, and every larger h also works, since a smaller root is a power of a larger one. Apply §4.4 step by step with one fixed m, starting from the structure map B → D: with e₀ = 0 and `e_{i+1}` = δe_i + 1/pᵐ, the variables of step i+1 map into `π^{-e_{i+1}}`D, so every w_s maps into `π^{-C/p^m}`D with C = δ(1 + δ + ⋯ + `δ^{ℓ−1}`), which depends only on the witness. Choose m with C/pᵐ ≤ 1/pʰ. Then 1 ∈ m_B `π^{-1/p^h}`D, i.e. `π^{1/p^h}` ∈ m_B D, a contradiction. So no sequence is bad, and §4.3 with S = R = B and T = B gives a balanced big Cohen–Macaulay B-algebra.

**Checks.**

- If D is already big Cohen–Macaulay for x, the conclusion follows from §0.5 applied to D.
- For B=ℤ₂, D=O_K and π=2, choose h with `2^{-h}`<1; the root `2^{1/2ʰ}` has valuation less than 1 and cannot lie in 2D.
- For δ=2 and ℓ=2, C=2(1+2)=6. With p=2 and h=1 the condition 6/2ᵐ ≤ 1/2 holds for m=4 (6/16) and fails for m=3 (6/8); the root index must grow with the witness.

*Needs:* §4.1; §4.4; §4.3.

### 4.6 Criteria for almost Cohen–Macaulayness

Let B be a Noetherian local ring of residue characteristic p, A ⊆ B a Cohen–Macaulay local subring with B finite over A, x ⊂ A a system of parameters of B, and D a B-algebra with a nonzerodivisor π and a root system. Then D is almost Cohen–Macaulay for (B, x, `π^{1/p^∞}`) iff it is so for (A, x, `π^{1/p^∞}`). In each of the following cases D is almost Cohen–Macaulay for (A, x, `π^{1/p^∞}`), hence for (B, x, `π^{1/p^∞}`): (a) (πD) ∩ A ≠ 0 and D is almost isomorphic, in the setup (A[`π^{1/p^∞}`], `π^{1/p^∞}`A[`π^{1/p^∞}`]), to a faithfully flat A-algebra D′ (not necessarily containing B); (b) d≥1, (πD) ∩ A ⊄ x₁A, D has no x₁-torsion, and D/x₁D is almost isomorphic in the same setup to a faithfully flat A/x₁A-algebra.

(ANDRE18B, Lemme 4.1.3 and its proof, pp. 85–86; ANDRE18B line 692.)

Almost isomorphism is in the setup generated by the roots of π, which acts on D′ through the almost isomorphism.

A proof route is the following. m_A B is m_B-primary, so J ⊄ m_B D iff J ⊄ m_A D: the first assertion. (a): if J ⊆ m_A D, transport to D′ and apply PerfectoidSpacesPartII §RA.5 (krull detection lemma) with R = A, S = D′, M = A/m_A: K = J D′ is idempotent, kills M ⊗ D′ and contains a nonzero element of A, so M = 0, absurd. Colon modules vanish on D′ by flatness and A Cohen–Macaulay, hence are almost zero on D. (b): the same with A/x₁A (Cohen–Macaulay) and (x₂, …, x_d), using that x₁ is regular on D.

**Checks.**

- André's application uses (b) with x₁ = p² and π = ϖg, where (π) ∩ A = pgA ⊄ p²A.
- For A=ℤ₂, x₁=4 and g=1, the element 2∈(π)∩A is not in 4A; the condition modulo x₁ is nonzero.

*Needs:* §4.1; PerfectoidSpacesPartII §RA.5 (krull detection lemma); PerfectoidSpaces §P0 (change of basic setup); Mathlib `Module.FaithfullyFlat`.

### 4.7 Reductions for the existence of big Cohen–Macaulay algebras

Let (B, m_B) be a Noetherian local ring. (1) If P is a minimal prime with dim B/P = dim B, a balanced big Cohen–Macaulay B/P-algebra is a balanced big Cohen–Macaulay B-algebra. (2) A balanced big Cohen–Macaulay B̂-algebra is one for B. (3) If B is complete and p-torsion-free with residue characteristic p, then B_red is p-torsion-free and a balanced big Cohen–Macaulay B_red-algebra is one for B. (4) If B is complete of residue characteristic p with residue field k and coefficient map Λ = C(k) → B, then B′ = (B ⊗_Λ W(`k^{1/p^∞}`))^ is complete Noetherian local, faithfully flat over B with m_B B′ = `m_{B′}`, and a balanced big Cohen–Macaulay B′-algebra is one for B.

(ANDRE18B, §4.2, first paragraph, p. 86; ANDRE18B line 720; ANDRE18B, §0.7, paragraph after Théorème 0.7.1, p. 75; ANDRE18B line 184.)

In (1) the dimension condition matters: a system of parameters of B maps to one of B/P only when dim B/P = dim B.

A proof route is the following. (1) and (2): systems of parameters of B map to systems of parameters of B/P (equal dimension) and of B̂, and m_B C ≠ C is preserved. (3): nilpotents are killed in a reduced quotient; p-torsion-freeness of B_red follows from that of B. (4): DeformationAndDerivedPatchingAlgebra §1.10 gives B′ with m_B B′ = `m_{B′}`; a system of parameters of B is one of B′ by the flat-local transport of DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems): its image generates an `m_{B′}`-primary ideal, and dim B′ = dim B because the closed fibre is zero-dimensional.

**Checks.**

- For B = ℤ_p⟦x, y⟧/(xy) the reduction (1) passes to B/(x) ≅ ℤ_p⟦y⟧, which is its own balanced big Cohen–Macaulay algebra.
- For B=ℤ₂⟦X,Y⟧/(2X,2Y), dim B=2. The quotient by (2) is 𝔽₂⟦X,Y⟧ of dimension 2, whereas the quotient by (X,Y) is ℤ₂ of dimension 1. The parameter system (2+X,Y) has Artinian quotient ℤ₂/4, maps to (X,Y) on the first component, and to (2,0) on the smaller component; the latter list has the wrong length and fails weak regularity.

*Needs:* §0.4; DeformationAndDerivedPatchingAlgebra §1.10; DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); Mathlib `AdicCompletion`.

### 4.8 André's existence theorem for big Cohen–Macaulay algebras in mixed characteristic

Every Noetherian local ring B of mixed characteristic (0, p) (residue characteristic p) has a balanced big Cohen–Macaulay algebra.

(ANDRE18B, §4.2, Preuve du théorème 0.7.1, p. 86; ANDRE18B line 720; ANDRE18B, Théorème 0.7.1, p. 74; ANDRE18B line 179.)

B may have p-torsion. Complete first and choose a minimal prime P with dim(B̂/P)=dim B. If p∈P, use the characteristic-p existence theorem on B̂/P, even when p was not nilpotent in B. Otherwise the quotient is a p-torsion-free mixed-characteristic domain.

A proof route is the following. Complete and take a maximal-dimensional domain quotient as just described. In the mixed-characteristic case pass faithfully flatly to a perfect residue field, then choose a maximal-dimensional minimal-prime quotient again if needed: the extension is still p-torsion-free, so its minimal primes avoid p. Systems of parameters from the original ring remain systems of parameters throughout. The characteristic-p branch is §4.9. Choose a system of parameters x with x₁ = p²; put d=dim B and A=W(k)⟦T₂,…,T_d⟧. The chosen Cohen map W(k)→B and native series evaluation give the local map A→B sending T_i↦x_i (DeformationAndDerivedPatchingAlgebra §§1.9–1.10). Its residual fibre B/(p,x₂,…,x_d) has finite length and residue k, so §4.1 of that supplier makes B finite over A. Its kernel P is prime because B is a domain. Since dim B=d=dim A, a nonzero P would give dim B=dim(A/P)<d, a contradiction; thus the map is injective; choose g ∈ A ∖ pA with B[1/(pg)] étale over A[1/(pg)] (§0.8). Let D = B° be the integral closure of Â°∞∞ in B ⊗_A Â∞∞[1/g] and `π^{1/pᵐ}` = `(ϖg)^{1/pᵐ}`, a nonzerodivisor on D. Then (π) ∩ A = pgA ⊄ p²A, D is p-torsion-free, and D/p²D is almost isomorphic in the setup (`(Â°∞∞)_{!!}`, `(ϖg)^{1/p^∞}`) to `(D/p²D)^a_{!!}`, which is faithfully flat over A/p² by André's flatness theorem and its ramified form (PerfectoidSpacesPartII §RA.5 (kummer almost faithful flatness), PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness), PerfectoidSpacesPartII §RA.5 (flat integral model)). §4.6 (b) makes D almost Cohen–Macaulay for (B, x, `π^{1/p^∞}`); §4.5 gives a balanced big Cohen–Macaulay B-algebra.

**Checks.**

- For B regular unramified, B itself is the answer; the theorem has content for singular B, e.g. B = ℤ_p⟦x, y, z⟧/(xy − pz).
- The mixed-characteristic ring B=ℤ₂⟦X,Y⟧/(2X,2Y) has minimal primes (2) and (X,Y), with quotients 𝔽₂⟦X,Y⟧ of dimension 2 and ℤ₂ of dimension 1. Thus dim B=2 and every maximal-dimensional domain quotient has characteristic 2, forcing the characteristic-p branch although B has characteristic zero. In contrast, ℤ₂⟦X,Y⟧/(2X) also has the dimension-two mixed-characteristic quotient ℤ₂⟦Y⟧.

*Needs:* §4.7; §4.6; §4.5; §0.8; DeformationAndDerivedPatchingAlgebra §§1.9, 1.10, 4.1; PerfectoidSpacesPartII §RA.5 (kummer almost faithful flatness); PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness); PerfectoidSpacesPartII §RA.5 (flat integral model); PerfectoidSpaces §P0 (almost algebra lower shriek shriek); §4.9.

### 4.9 Hochster–Huneke: R⁺ is big Cohen–Macaulay in characteristic p

The headline signature is `absoluteIntegralClosure_charP`, using the equal native expression `integralClosure R (AlgebraicClosure (FractionRing R))` for the supplier’s R⁺.

Let (R, m) be a Noetherian local domain of characteristic p > 0 that is a homomorphic image of a Gorenstein local ring (for example a complete local domain), and R⁺ its absolute integral closure (SchemeAndStackFoundations §0.11, with affine model the integral closure of R in an algebraic closure of Frac R). Then Hⁱ_m(R⁺) = 0 for i < dim R, and every system of parameters of R is a regular sequence on R⁺; R⁺ ≠ mR⁺, so R⁺ is a balanced big Cohen–Macaulay R-algebra.

(HUNEKELYUBEZNIK, Theorem 2.1, Lemma 2.2 and Corollary 2.3, pp. 2–6; HUNEKELYUBEZNIK line 75; BMPSTWW, Theorem 2.5 and the paragraph after it, p. 13; BMPSTWW line 561.)

Hochster–Huneke prove it for excellent R; Huneke–Lyubeznik for homomorphic images of Gorenstein local rings, with a simpler proof; complete local domains satisfy both.

A proof route is the following. Apply the strong form of Huneke–Lyubeznik Theorem 2.1 to every finite intermediate domain R′ ⊆ R⁺: for each i<dim R there is a finite R′-extension inside R⁺ killing Hⁱ_m(R′). Finite extensions have the same dimension; the theorem’s stated finite-extension form supplies this step. Its proof uses Frobenius, local duality over the Gorenstein ring and the equational Lemma 2.2. Every class in the filtered colimit of Hⁱ_m(R′) thus dies at a later finite stage, so Hⁱ_m(R⁺)=0. Use DeformationAndDerivedPatchingAlgebraPartII §K0.1 for filtered colimits and Čech comparison; killing only classes coming from R would not suffice. Corollary 2.3(b): induction on j shows x₁, …, x_j is regular on R⁺, using the local cohomology vanishing and the identification of the colon modules. R⁺ ≠ mR⁺ because R⁺ is integral over R (lying over).

In `absoluteIntegralClosure_charP`, a Gorenstein cover is a specified surjective map A→R from a Noetherian local ring A together with a finite bound on the injective dimension of A as an A-module. This is the standard local Gorenstein condition, expressed by native injective dimension; no regularity or completeness of R is added.

**Checks.**

- For R = 𝔽_p⟦x, y⟧ (regular), R⁺ is faithfully flat over R, consistent with §0.6.
- In equal characteristic 0 and dim R ≥ 3 the analogous statement is false: a trace argument shows R⁺ is not big Cohen–Macaulay (BMPSTWW §2.2).
- For R=𝔽₂ and R⁺ an algebraic closure, the parameter list is empty and R⁺/mR⁺=R⁺≠0; this is the dimension-zero case.

*Needs:* SchemeAndStackFoundations §0.11; DeformationAndDerivedPatchingAlgebraPartII §K0.1; §0.4; Mathlib `localCohomology`; DeformationAndDerivedPatchingAlgebra §3.7; DerivedModuleAlgebra §0.K.1; DerivedModuleAlgebra §1.M.2; EnhancedDerivedSheaves §E1.6; Mathlib `AlgebraicClosure`; Mathlib `integralClosure`; Mathlib `frobenius`; DeformationAndDerivedPatchingAlgebra §3.9, the Gorenstein criterion.

### 4.10 Big Cohen–Macaulay algebras in equal characteristic zero

The target exists_balanced_charZero is specified here in prose.

Every Noetherian local ring containing ℚ has a balanced big Cohen–Macaulay algebra.

(HH92, the equal-characteristic-zero existence theorem and its proof by reduction to characteristic p; cited by published locator. BMPSTWW, §2.2, paragraph before Theorem 2.5, p. 13; BMPSTWW line 561, which attributes the equal-characteristic case to HH92 and HH95; ANDRE18B, §0.7, p. 75; ANDRE18B line 184, where the equicharacteristic case is recorded as known.)

Existence is asserted, with no claim that the absolute integral closure itself is big Cohen–Macaulay in characteristic zero.

This section owns the finite-equation specialization theorem used in its existence proof: descend a finite bad modification witness while preserving the parameter system, the local dimension and a maximal-dimensional domain quotient after a suitable characteristic-p specialization.

A proof route is the following. Reduce to B a complete local domain (§4.7). By the modification criterion (§4.3) it suffices to show no sequence of algebra modifications of B is bad. A bad sequence is witnessed by finitely many elements and equations. Descend the bad sequence to a local ring essentially of finite type over a finitely generated ℤ-algebra, using Néron–Popescu desingularisation (SchemeAndStackFoundations §0.15) and limit arguments (SchemeAndStackFoundations §0.9), keeping the parameters a system of parameters on a dense open set of the base. Reduce modulo a suitable maximal ideal of the base to obtain a bad sequence over a Noetherian local ring of characteristic p whose completion has a domain quotient of maximal dimension, contradicting §4.9.

**Checks.**

- For B regular containing ℚ, B is its own balanced big Cohen–Macaulay algebra; the theorem is used for singular local rings such as the complete local domains `S_{m,i}` in André's proof of Théorème 0.7.2 (ANDRE18B, §4.3, p. 87; ANDRE18B line 747).
- For R=ℚ[ε]/ε² the quotient R→ℚ gives a balanced algebra: dim R=0 and m_Rℚ=0. Requiring an injective algebra would wrongly exclude this construction.
- For the model Spec ℤ[1/6][X] along its zero section, the local fibre at X=0 over any p>3 is 𝔽_p[X]_(X), dimension 1 and parameter X. At p=2 or 3 the base fibre is empty because 6 is invertible; specialization must choose a maximal ideal of the actual coefficient base.

*Needs:* §4.7; §4.3; §4.9; SchemeAndStackFoundations §0.15; SchemeAndStackFoundations §0.9.

### 4.11 Every Noetherian local ring has a balanced big Cohen–Macaulay algebra

The headline signature is `exists_balanced`.

Every Noetherian local ring B has a balanced big Cohen–Macaulay B-algebra (§0.4).

(ANDRE18B, Théorème 0.7.1, p. 74; ANDRE18B line 179, and §4.2, p. 86; ANDRE18B line 720.)

Characteristic types: equal characteristic p (Hochster–Huneke), equal characteristic 0 (Hochster–Huneke), mixed characteristic (André). The monomial theorem of §5.5 is a consequence.

A proof route is the following. Reduce to B complete with a minimal prime of maximal dimension, then to the corresponding complete local domain (§4.7). Equal characteristic p: R⁺ of the complete local domain (§4.9). Equal characteristic 0: §4.10. Mixed characteristic: §4.8.

**Checks.**

- For R=𝔽₂[ε]/ε², C=𝔽₂ has m_RC=0 and empty parameter list; existence does not assert that R embeds in C.

*Needs:* §4.7; §4.9; §4.10; §4.8.

### 4.12 Weak functoriality from squares of almost Cohen–Macaulay algebras

Let β : B → B′ be a local homomorphism of complete local domains of mixed characteristic (0, p), with systems of parameters x of B and x′ of B′. Suppose β fits in a commutative square B → D, B′ → D′, δ : D → D′, where D is almost Cohen–Macaulay for (B, x, `π^{1/p^∞}`), D′ is almost Cohen–Macaulay for (B′, x′, `π′^{1/p^∞}`), and δ(`π^{1/pᵐ}`) divides `π′^{1/pᵐ}` in D′ for every m. Then β fits in a commutative square B → C, B′ → C′, γ : C → C′ with C and C′ balanced big Cohen–Macaulay algebras for B and B′.

(ANDRE18B, Proposition 4.4.1, p. 87; ANDRE18B line 769; HEITMANNMA18, Theorem 1.6, pp. 3–4; HEITMANNMA18 line 123.)

D′ is almost Cohen–Macaulay for (B′, x′, `π′^{1/p^∞}`), not for B.

A proof route is the following. By §4.3 (with T = B) it suffices to show no double sequence of algebra modifications of B over B → B′ is bad. Fix one, with a finite witness as in §4.2, and one root index m. Extend B → D to B-algebra maps from the B-part into D[1/π] by §4.4, then B′ ⊗_B T_ℓ → D′[1/π′] along the B′-part by §4.4 for π′. Since δ(`π^{1/pᵐ}`) divides the nonzerodivisor `π′^{1/pᵐ}`, it is a nonzerodivisor and `δ(π^{1/pᵐ})^{-1}` lies in `π′^{-1/pᵐ}`D′; so an element of `π^{-a}`D maps into `π′^{-a}`D′ for every a ∈ `ℤ[1/p]_{≥0}`, and the exponent bound of §4.5 carries over. Badness would put `π′^{1/p^h}` into `m_{B′}`D′ once m is large relative to the witness, contradicting almost Cohen–Macaulayness of D′.

**Checks.**

- For β = id and D = D′ this is §4.5.
- For the identity square over ℤ₂, choose the same root system on both sides; each root divides itself with quotient 1.
- In the valuation ring containing all 2-power roots of 2, take π=2 and π′=4, with roots 2^(1/2ⁿ) and 2^(2/2ⁿ). The first divides the second with quotient 2^(1/2ⁿ), and 2^(-1/2ⁿ)=2^(1/2ⁿ)·4^(-1/2ⁿ). The reverse divisibility fails because the required quotient has negative valuation −1/2ⁿ. This fixes the direction used to transport denominators (ANDRE18B, Proposition 4.4.1, p.87; ANDRE18B line 769).

*Needs:* §4.1; §4.3; §4.4.

### Examples

The relation Xt=0 in T=k⟦X⟧[t]/(Xt) has algebra modification T/tT=k⟦X⟧, which kills t²; the R-module quotient T/kt would retain it. The hypersurface ℤ_p⟦X,Y,Z⟧/(XY−pZ) is a singular mixed-characteristic test for balanced-algebra existence.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 4. External inputs: DeformationAndDerivedPatchingAlgebraPartII §K0.3 (parameter systems); PerfectoidSpaces §P0 (root ideal basic setup); Mathlib `IsSMulRegular`; Mathlib `IsLocalRing`; Mathlib `RingTheory.Sequence.IsWeaklyRegular`; PerfectoidSpacesPartII §RA.5 (krull detection lemma); PerfectoidSpaces §P0 (change of basic setup); Mathlib `Module.FaithfullyFlat`; DeformationAndDerivedPatchingAlgebra §1.10; Mathlib `AdicCompletion`; DeformationAndDerivedPatchingAlgebra §§1.9, 1.10, 4.1; PerfectoidSpacesPartII §RA.5 (kummer almost faithful flatness); PerfectoidSpacesPartII §RA.5 (ramified kummer almost flatness); PerfectoidSpacesPartII §RA.5 (flat integral model); PerfectoidSpaces §P0 (almost algebra lower shriek shriek); Mathlib `localCohomology`; DeformationAndDerivedPatchingAlgebra §3.7; DerivedModuleAlgebra §0.K.1; DerivedModuleAlgebra §1.M.2; EnhancedDerivedSheaves §E1.6; Mathlib `AlgebraicClosure`; Mathlib `integralClosure`; Mathlib `frobenius`; SchemeAndStackFoundations §0.15; SchemeAndStackFoundations §0.9.


## Layer 5: The direct summand theorem and flat domination

### 5.1 The direct summand theorem

The headline signature is `directSummand`.

Every Noetherian regular ring is a splinter: for a Noetherian regular ring R and a commutative R-algebra S that is finite and faithful as an R-module, R → S admits an R-linear retraction (§0.1). Equivalently, every finite extension of R is pure, and S is a generator of the category of R-modules.

(ANDRE18B, Conjecture 0.1.1, §0.2 and Théorème 0.2.1, pp. 71–72; ANDRE18B line 70; ANDRE18B, §0.7, after Théorème 0.7.2, p. 75; ANDRE18B line 189; BHATT18, Theorem 1.1 and Theorem 5.4, pp. 1 and 10; BHATT18 line 17.)

The retraction is R-linear and is not required to be multiplicative.

The theorem is stated once; it has two proofs in mixed characteristic, André's and Bhatt's, recorded as alternative routes in the proof steps. Both routes use the same reductions. Dimension at most 2, in any characteristic, is §0.10; dimension 3 in mixed characteristic is Heitmann's theorem, a special case.

A proof route is the following. Reduce to A a complete regular local ring with algebraically closed residue field and S a domain finite over A (§0.8). A contains ℚ: trace splitting (§0.9). A has characteristic p: Frobenius (§1.3). Mixed characteristic, Bhatt's route: §3.7, valid for ramified and unramified A. Mixed characteristic, André's route: A ⊆ S is dominated by a faithfully flat algebra (§5.3, built from André's big Cohen–Macaulay algebras over the unramified ring W(k)⟦T⟧ of §4.8); then A → S is pure as a left factor of a faithfully flat map, hence split since S is finite (PerfectoidSpacesPartII §RA.5 (pure map)). For A unramified this is also André's direct theorem §2.3.

**Checks.**

- Regularity cannot be weakened to normality: in characteristic p or mixed characteristic there are normal non-splinters, and K[x, y]/(xy) is a reduced non-splinter (André B §0.2).
- For R=0, injectivity forces S=0 and the unique linear map satisfies ρ(1)=1 since 0=1; the global statement includes this case.

- Let A=𝔽₂[a,b,c]/(a³+b³+c³) localized at (a,b,c), and S the same cubic in x,y,z with a↦x², b↦y², c↦z². This finite injective map has normal source: the projective cubic is smooth, and the hypersurface has only the vertex as a singular point. In A/(a,b)=𝔽₂[c]/c³ the element c² is nonzero, but its image z⁴=x³z+y³z lies in (x²,y²)S. Thus a normal ring can fail ideal contraction and fail to be a splinter (ANDRE18B §0.2, p.72; SchemeAndStackFoundations §4.13, Serre normality criterion).

*Needs:* statement: §0.1; §0.2; Mathlib `IsRegularRing`. Shared reductions: §0.8; §0.9; §1.3. Bhatt route: §3.7. Flat-domination route: §5.3 (hence §§5.2, 4.11); PerfectoidSpacesPartII §RA.5 (pure map); for unramified A also §2.3.

### 5.2 Products of flat modules over a Noetherian ring are flat

Let R be a Noetherian ring (more generally a coherent ring) and `(M_i)_{i∈I}` any family of flat R-modules. Then ∏_i M_i is flat. If moreover each M_i is an R-algebra and for every maximal ideal m of R some M_i satisfies mM_i ≠ M_i, then ∏_i M_i is faithfully flat.

(ANDRE18B, §4.3, p. 87; ANDRE18B line 747; CHASE60, Theorem 2.1, p.460; CHASE60 line 139.)

The arbitrary-index theorem uses coherence (Chase's theorem); the square-zero example below shows why this hypothesis matters.

A proof route is the following. Flatness is tested on finitely generated ideals J: J is finitely presented since R is Noetherian, so J ⊗ ∏ M_i ≅ ∏ (J ⊗ M_i) (tensor product with a finitely presented module commutes with arbitrary products). J ⊗ M_i → M_i is injective for every i, hence so is the product map. Faithful flatness: m(∏ M_i) ⊆ ∏ mM_i ≠ ∏ M_i when some factor has mM_i ≠ M_i, and flat with mT ≠ T for all maximal m is faithfully flat (Mathlib Module.FaithfullyFlat).

**Checks.**

- For I finite this is Tau Ceti's Module.Flat.pi.
- Over a non-coherent ring the statement fails (Chase); the Noetherian hypothesis is used exactly in the finite presentation of ideals.
- The empty product is the zero module, flat but not faithfully flat over a nonzero ring; the surviving-factor hypothesis fails.
- For R=ℤ and I an arbitrary index set, multiplication by any nonzero integer on ∏_Iℤ is injective, consistent with flatness over the PID ℤ.

- Let R=k⊕V with V having independent basis x₀,x₁,… and V²=0. In M=∏ₙR the vector (x₁,x₂,…) is killed by x₀. It does not belong to Ann(x₀)M=VM: every finite sum from VM has all coordinates in a fixed finite-dimensional subspace of V. Thus M is not flat. This gives an explicit noncoherent negative control (CHASE60, Theorem 2.1, p.460).

*Needs:* Tau Ceti `Module.Flat.pi`; Mathlib `Module.Flat`; Mathlib `Module.FaithfullyFlat`; Mathlib `Module.FinitePresentation`; Mathlib `IsNoetherianRing`.

### 5.3 Finite covers of regular rings are dominated by faithfully flat algebras

The headline signature is `finiteCover_flatDomination`.

Let R be a Noetherian regular ring and R ⊆ S a finite extension. There is a commutative S-algebra T such that the composite R → S → T is faithfully flat.

(ANDRE18B, Théorème 0.7.2, p. 75; ANDRE18B line 189; ANDRE18B, §4.3, Preuve du théorème 0.7.2, p. 87; ANDRE18B line 747.)

The product is taken only over components that receive R̂_m injectively: André's proof takes all factors of the normalisation of S ⊗_R R̂_m, which can include components of smaller dimension over which Remarque 4.2.1 does not apply. No normalisation is needed: a domain quotient of maximal dimension suffices. As a consequence R → S is pure, hence split since S is finite (André B §0.7).

A proof route is the following. For each maximal ideal m of R, R̂_m is a complete regular local domain and S ⊗_R R̂_m is a finite R̂_m-algebra, a finite product of complete local rings (DeformationAndDerivedPatchingAlgebra §1.14); R̂_m → S ⊗ R̂_m is injective. By lying over for the minimal prime 0 of R̂_m, some factor has a prime P lying over 0; S_m := factor/P is a complete local domain, finite over R̂_m and containing it, of the same dimension. Let T_m be a balanced big Cohen–Macaulay S_m-algebra (§4.11). It is a balanced big Cohen–Macaulay R̂_m-algebra (same systems of parameters), hence faithfully flat over R̂_m (§0.6), hence flat over R with mT_m ≠ T_m. T = ∏_m T_m is an S-algebra, flat over R (§5.2) and faithfully flat because each maximal ideal stays proper in its own factor.

**Checks.**

- For R a field the statement says every nonzero finite K-algebra S has a K-algebra map to a nonzero K-algebra: take a residue field of S.
- For R=ℤ₂ and S=R×R/2, project to R and take T=R; the other component has 2T=0 and cannot be faithfully flat over R.

*Needs:* §4.11; §0.6; §0.4; §5.2; DeformationAndDerivedPatchingAlgebra §1.14; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `IsRegularRing`; Mathlib `AdicCompletion`.

### 5.4 R → R⁺ splits for complete regular local rings

The headline signature is `absoluteIntegralClosure_split`, using the equal native expression `integralClosure R (AlgebraicClosure (FractionRing R))` for the supplier’s R⁺.

Let R be a complete Noetherian regular local ring and R⁺ the absolute integral closure of SchemeAndStackFoundations §0.11, whose affine model is the integral closure of R in an algebraic closure of Frac(R). Then R → R⁺ admits an R-linear retraction. In particular W(k)⟦T₁, …, T_n⟧ → W(k)⟦T₁, …, T_n⟧⁺ splits for every perfect field k of characteristic p.

(ANDRE18B, §0.2, last paragraph, p. 73; ANDRE18B line 81; ANDRE18B, Annexe A.3, Applications, p. 91; ANDRE18B line 928; DATTAMURAYAMA, Proposition 5.4.1(iii), p. 28; DATTAMURAYAMA line 1315.)

Completeness of R is needed for the passage from purity to splitting: the corresponding statement for an arbitrary DVR V in place of W(k), asserted in André B Annexe A.3 Applications, fails by the Datta–Murayama example.

A proof route is the following. R⁺ is the filtered union of its finite R-subalgebras S_α, each split over R by the direct summand theorem (§5.1), hence pure. Filtered colimits of pure maps are pure (PerfectoidSpacesPartII §RA.5 (pure map)), so R → R⁺ is pure. R is complete, so the pure map R → R⁺ splits (§1.2).

**Checks.**

- For a complete DVR, every finite domain subalgebra of R⁺ is torsion-free and hence free; the subalgebras themselves need not be DVRs. Purity passes to their union, and complete-local purity gives the retraction.
- In characteristic p the splitting of R → R⁺ also follows from §0.6 and §4.9, which make R⁺ faithfully flat over R.
- For a field K, K⁺ is its algebraic closure and projection onto a basis containing 1 sends 1 to 1; the field need not be perfect.

*Needs:* SchemeAndStackFoundations §0.11; §5.1; §1.2; PerfectoidSpacesPartII §RA.5 (pure map); Mathlib `integralClosure`; Mathlib `AlgebraicClosure`; Mathlib `IsAdicComplete`.

### 5.5 Contracted ideals and the monomial theorem

The headline signature is `monomial_noncontainment`.

(1) Contracted ideals: for every Noetherian regular ring R, every ideal I of R and every injective integral ring map R → S, IS ∩ R = I. (2) Monomial theorem: for every Noetherian local ring R of dimension d ≥ 1, every system of parameters x₁, …, x_d and all m, n ∈ ℕ with n ≥ 1, (x₁⋯x_d)ᵐ ∈ (x₁ⁿ, …, x_dⁿ)R if and only if m ≥ n. In dimension 0 the empty product 1 is never in the zero ideal of a nonzero ring.

(ANDRE18B, §0.1, statements (1)–(6) and footnote 1, p. 72; ANDRE18B line 41.)

The 'if and only if' form of (2) needs d ≥ 1; André's §0.1(4) states it for every local ring, which fails for d = 0. The non-containment for m < n holds in all dimensions. Contracted ideals and the monomial theorem are the consequences developed here; the further homological conjectures listed in André §0.1 are outside this roadmap’s scope.

A proof route is the following. (1): R → S is pure (the integral-extension purity criterion of §0.2 and the direct summand theorem §5.1), so R/I → S/IS is injective. (2), m ≥ n: (x₁⋯x_d)ᵐ is a multiple of x₁ⁿ when m ≥ n and d ≥ 1. (2), m < n: let C be a balanced big Cohen–Macaulay R-algebra (§4.11). For a regular sequence x on C with C ≠ (x)C, `(x₁⋯x_d)^{n−1}` ∉ (x₁ⁿ, …, x_dⁿ)C (Koszul/regular-sequence computation, the monomial of §0.3); a fortiori not in the ideal of R.

**Checks.**

- For R = K⟦x, y⟧/(xy) with system of parameters x + y, d = 1: (x + y)ᵐ ∈ ((x + y)ⁿ) iff m ≥ n.
- For d=0 the product is 1 and the pure-power ideal is zero; 1∉0 even when m≥n, so the iff formulation requires d≥1.
- For R=k⟦X,Y⟧ and n=2, XY∉(X²,Y²), whereas (XY)²=X²Y² belongs to it; m=0 gives 1∉(X²,Y²).

*Needs:* §5.1; §0.2; §4.11; §0.3; §0.4.

### Examples

For S=R×R/I choose the R-component before constructing a faithfully flat receiving algebra. The empty parameter list has product 1 and generated ideal zero; it tests the exact range of the monomial equivalence.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 1, Layer 2, Layer 3, Layer 4, Layer 5. External inputs: PerfectoidSpacesPartII §RA.5 (pure map); Mathlib `IsRegularRing`; Tau Ceti `Module.Flat.pi`; Mathlib `Module.Flat`; Mathlib `Module.FaithfullyFlat`; Mathlib `Module.FinitePresentation`; Mathlib `IsNoetherianRing`; DeformationAndDerivedPatchingAlgebra §1.14; Tau Ceti TauCeti.IsRegularLocalRing.isDomain; Mathlib `AdicCompletion`; Mathlib `integralClosure`; Mathlib `AlgebraicClosure`; Mathlib `IsAdicComplete`.


## Layer 6: Pure subrings of regular rings

### 6.1 Purity survives completion and perfect residue fields

Let β : B → B′ be a pure local homomorphism of Noetherian local rings. Then the induced map B̂ → B̂′ of maximal-ideal-adic completions is pure. If B and B′ have mixed characteristic (0, p) and the residue extension k → k′ is separable, then for compatible coefficient maps Λ → B̂, Λ′ → B̂′ the map (B̂ ⊗_Λ W(`k^{1/p^∞}`))^ → (B̂′ `⊗_{Λ′}` W(`k′^{1/p^∞}`))^ is pure.

(ANDRE18B, Annexe A.2, Lemme A.2.2 and proof, p. 90; ANDRE18B line 890; ANDRE18B, §4.4, before Théorème 4.4.2, p. 88; ANDRE18B line 818.)

Use compatible coefficient maps for the separable residue extension and the common completed coefficient-extension contract (common Cohen extension). Separate extensions of source and target do not construct a compatible square.

A proof route is the following. Put C=`completion_{m_B B′}`(B′). This is Noetherian local, and its maximal-adic completion is B̂′, faithfully flat over C. To prove B̂ → C pure, test every finite B̂-module P, rather than only those descending to B. Each P/m_BⁿP is a finite B-module and is unchanged by tensoring B → B̂ at that level. Purity of B → B′ gives its injection into (P/m_BⁿP) ⊗_B B′ = (P/m_BⁿP) `⊗_{B̂}` C. An element in the kernel of P → P `⊗_{B̂}` C therefore lies in every m_BⁿP; Krull intersection for the finite B̂-module P makes it zero. Compose with C → B̂′. For the perfect-residue assertion use the common Cohen extension of the supplier contract. Separability makes k′ ⊗_k kᵖerf a field; the completed Cohen tensor has that residue field and maps faithfully flatly to W(k′ᵖerf). Apply the common flat base change to the original map, then extend the target faithfully flatly and complete. This preserves purity and, for an injective original map, injectivity.

**Checks.**

- A faithfully flat local map is pure and stays so after completion; a split local map stays split.
- For the split local map k[X]_(X)→k[X,Y]_(X,Y), evaluation Y=0 extends to the completions k⟦X,Y⟧→k⟦X⟧; it fixes every X-power.

*Needs:* PerfectoidSpacesPartII §RA.5 (pure map); DeformationAndDerivedPatchingAlgebra §1.10 (common Cohen extension); DeformationAndDerivedPatchingAlgebra §1.10; Mathlib `AdicCompletion`; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`.

### 6.2 Weak functoriality of big Cohen–Macaulay algebras for regular targets

The headline signature is `weakFunctoriality_regularTarget`.

Let β : B → B′ be an injective local homomorphism of complete Noetherian local domains of mixed characteristic (0, p), with separable residue field extension k → k′ and B′ regular. Then there are a balanced big Cohen–Macaulay B-algebra C, a balanced big Cohen–Macaulay B′-algebra C′ and a ring map γ : C → C′ whose composite with B → C equals the composite of β with B′ → C′.

(ANDRE18B, §4.4, problems (1)–(3) and the paragraph after them, pp. 87–88; ANDRE18B line 779; ANDRE18B, Remarques 2.6.1(4), pp. 82–83; ANDRE18B line 575.)

The three obstructions André lists all disappear under these hypotheses: (1) perfect residue fields are reached compatibly because k → k′ is separable; (2) no square A → A′ of unramified complete regular local rings finite under B → B′ exists in general — for B = ℤ_p⟦T⟧ → B′ = ℤ_p⟦T, U⟧/(T² − TU + p) no parameter of B/p maps to a parameter of B′/p — but A′ may be ramified when B′ is regular; (3) the discriminant condition δ(`(ϖg)^{1/pᵐ}`) | `(ϖg′)^{1/pᵐ}` is met by replacing g′ by g′β(g), which needs β(g) to be a nonzerodivisor, guaranteed by injectivity of β (β(g) = 0 when Spec B′[1/p] maps into the singular locus of Spec B[1/p]).

Use the ramified, multi-element Kummer flatness contract of PerfectoidSpacesPartII §RA.5 (ramified simultaneous Kummer extension). Heitmann–Ma construct weakly functorial balanced big Cohen–Macaulay algebras for the quotient map of a complete local domain by a height-one prime with mixed-characteristic quotient (HEITMANNMA18, Theorem 3.1); that is a surjective square, not the injective square above, and it belongs to the Part II named in the Scope.

The common Cohen coefficient extension must preserve injectivity by a common flat base change followed by a faithfully flat target extension (common Cohen extension).

A proof route is the following. Pass to perfect residue fields through a common compatible coefficient extension (DeformationAndDerivedPatchingAlgebra §1.10 (common Cohen extension)), preserving injectivity by flat base change and faithful flatness on the target. Separate choices of the two residue extensions would not justify the new square. Build A, A∞, Â∞∞ and D = B° for B as in §4.8, and A′ = B′ itself (regular, possibly ramified) with D′ = `g^{-1/p^∞}`Â′∞⟨`ζ_{p^∞}`, `g^{1/p^∞}`, `T^{1/p^∞}`⟩°, which is integrally closed in D′[1/(pg)] by the perfectoid Riemann extension theorem (PerfectoidSpacesPartII §RA.3 (perfectoid riemann extension)). D′/p² is almost isomorphic to a faithfully flat B′/p²-algebra (André's flatness theorem over the ramified base B′, PerfectoidSpacesPartII §RA.5, ramified simultaneous Kummer extension), so D′ is almost Cohen–Macaulay for B′ (§4.6); D is almost Cohen–Macaulay for B as before, and the map δ : D → D′ exists with the divisibility after replacing g′ by g′β(g). §4.12 turns the square of almost Cohen–Macaulay algebras into a square of balanced big Cohen–Macaulay algebras.

The predicate `SeparableResidueMap` uses general separability of the induced residue map, expressed by `Algebra.IsTranscendentalSeparable`. An unrelated algebra structure on the two residue fields cannot replace the induced one (DeformationAndDerivedPatchingAlgebra §1.10; ANDRE18B §4.4(1), p.88; ANDRE18B line 780). The induced-residue-map interface has the following laws.

- The residue map of the identity local homomorphism is separable.
- Composing local homomorphisms with separable induced residue maps gives a separable induced residue map.
- A compatible square of local ring isomorphisms transports this condition to the corresponding induced residue map.

**Checks.**

- André's example ℤ_p⟦T⟧ → ℤ_p⟦T, U⟧/(T² − TU + p) is covered: with V = U − T the relation T² − TU + p becomes p − TV, so the target is ℤ_p⟦T, V⟧/(TV − p), regular of dimension 2, and no unramified square is needed. At p = 2 the target is regular with 2 = TV ∈ m², so a condition p ∉ m² would exclude the required example.

- The residue inclusion 𝔽₂→𝔽₂(t) is separable: t is a separating transcendence basis and the extension over 𝔽₂(t) has degree 1. Its transcendence degree is 1, so a condition requiring an algebraic residue extension would exclude it. This residue map occurs for the faithfully flat local inclusion ℤ₂→completion₂(ℤ₂[t]_(2)), where the target is a complete DVR with maximal ideal (2) and residue field 𝔽₂(t) (STACKS, Definition 10.42.1, tag 030O; STACKS line 4671 in the commutative-algebra text; DeformationAndDerivedPatchingAlgebra §1.10).
- The residue identity of 𝔽₂ has separable degree 1.
- The residue extension 𝔽₂→𝔽₄ is separable of degree 2.
- The local field inclusion 𝔽₂(t)→𝔽₂(`t^{1/2}`) has inseparable degree 2 and fails the separability condition.

*Needs:* §4.8; §4.6; §4.12; §4.7; DeformationAndDerivedPatchingAlgebra §1.10 (common Cohen extension); PerfectoidSpacesPartII §RA.3 (perfectoid riemann extension); PerfectoidSpacesPartII §RA.5 (kummer almost faithful flatness); PerfectoidSpacesPartII §RA.5; DeformationAndDerivedPatchingAlgebra §§1.9–1.15.

### 6.3 Cohen–Macaulayness descends along pure maps to regular rings with a big Cohen–Macaulay square

Let β : B → B′ be a pure local homomorphism of Noetherian local rings with B′ regular. Suppose there are a B-algebra C on which some system of parameters x = (x₁, …, x_d) of B is a regular sequence, a balanced big Cohen–Macaulay B′-algebra C′ and a ring map C → C′ compatible with β. Then x is a regular sequence on B; in particular B is Cohen–Macaulay.

(ANDRE18B, §4.4, sentence before Théorème 4.4.2, p. 88; ANDRE18B line 818; HH95, §2.3; cited by published locator.)

The argument descends every parameter colon through the faithfully flat target algebra and then through the pure base map; it makes no integrality assumption on the pure map.

A proof route is the following. Let 0 ≤ i < d and b ∈ B with `x_{i+1}`b ∈ (x₁, …, x_i)B. As x is regular on C, b ∈ (x₁, …, x_i)C, hence b ∈ (x₁, …, x_i)C′. C′ is faithfully flat over the regular local ring B′ (§0.6), so (x₁, …, x_i)C′ ∩ B′ = (x₁, …, x_i)B′ and b ∈ (x₁, …, x_i)B′. B → B′ is pure, so (x₁, …, x_i)B′ ∩ B = (x₁, …, x_i)B (PerfectoidSpacesPartII §RA.5 (pure map)) and b ∈ (x₁, …, x_i)B. Since x is a system of parameters, B ≠ (x)B, and B is Cohen–Macaulay.

**Checks.**

- For B = B′ regular and C = C′ = B the conclusion is that regular local rings are Cohen–Macaulay.
- For B=k⟦X,Y⟧, the X-colon at the first step is zero and (X):Y=(X); these are the two parameter-colon equalities that descend.

*Needs:* §0.6; §0.4; PerfectoidSpacesPartII §RA.5 (pure map); Mathlib `RingTheory.Sequence.IsRegular`; Mathlib `IsRegularLocalRing`.

### 6.4 Pure subrings of regular rings are Cohen–Macaulay (mixed characteristic, separable residue extension)

The headline signature is `pureSubring_cohenMacaulay`.

Let B → B′ be a pure local homomorphism (an extension) of Noetherian local rings of mixed characteristic (0, p), with B′ regular and the residue field extension separable. Then B is Cohen–Macaulay.

(ANDRE18B, Théorème 4.4.2, p. 88; ANDRE18B line 822.)

Separability of the residue extension is André's hypothesis. Heitmann–Ma prove the Cohen–Macaulay conclusion for every pure local map into a mixed-characteristic regular local ring, with no separability, by their vanishing theorem for maps of Tor (HEITMANNMA18, Corollary 4.3, p. 13; HEITMANNMA18 line 544); that extension belongs to the Part II named in the Scope.

A proof route is the following. Pass to completions and perfect residue fields; purity is preserved (§6.1), B′ stays regular, and Cohen–Macaulayness descends from the faithfully flat extension (SchemeAndStackFoundations §0.17). B is a domain as a pure subring of the domain B′, and β is injective. §6.2 gives a square of balanced big Cohen–Macaulay algebras over β. §6.3 concludes.

Equal-characteristic analogues are Hochster–Roberts and Boutot; they are outside this roadmap’s scope. The signature `pureSubring_cohenMacaulay` expresses the conclusion as regularity of every system of parameters on B itself. For a Noetherian local ring this is equivalent to the Cohen–Macaulay conclusion, using SchemeAndStackFoundations §0.17.

**Checks.**

- Invariant rings: if a finite group G acts on a regular local ring B′ of mixed characteristic with |G| invertible in B′, B = B′^G is a pure (Reynolds-split) subring and the theorem makes it Cohen–Macaulay (when the residue extension is separable).
- For G=C₂ acting by X↦−X on B′=ℤ₃⟦X⟧, the invariant ring is ℤ₃⟦X²⟧ and the Reynolds projection sends a+bX to a. At residue characteristic 2, the formula 1/2 is unavailable.

- For the trivial group, the Reynolds projection is the identity, and 1 maps to 1 in every residue characteristic.
- For S₃ permuting X₁,X₂,X₃ on ℤ₅⟦X₁,X₂,X₃⟧, the Reynolds average sends X₁ to (X₁+X₂+X₃)/3 and 1 to 1. The group is nonabelian and its order 6 is a unit; the invariant ring is ℤ₅⟦e₁,e₂,e₃⟧, where e₁,e₂,e₃ are the elementary symmetric polynomials.

*Needs:* §6.1; §6.2; §6.3; SchemeAndStackFoundations §0.17; Mathlib `IsRegularLocalRing`.

### Examples

The semistable regular target ℤ_p⟦T,V⟧/(TV−p) tests ramification and coefficient compatibility. The order-two invariant example over ℤ₃ tests the actual Reynolds denominator and the separable residue map.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 4, Layer 6. External inputs: PerfectoidSpacesPartII §RA.5 (pure map); DeformationAndDerivedPatchingAlgebra §1.10 (common Cohen extension); DeformationAndDerivedPatchingAlgebra §1.10; Mathlib `AdicCompletion`; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`; PerfectoidSpacesPartII §RA.3 (perfectoid riemann extension); PerfectoidSpacesPartII §RA.5 (kummer almost faithful flatness); PerfectoidSpacesPartII §RA.5; DeformationAndDerivedPatchingAlgebra §§1.9–1.15; Mathlib `RingTheory.Sequence.IsRegular`; Mathlib `IsRegularLocalRing`; SchemeAndStackFoundations §0.17.


## Layer 7: The derived direct summand theorem

### 7.1 Derived splinters

The native predicate is `DerivedSplinter`.

A Noetherian ring A is a derived splinter if for every proper surjective morphism of schemes f : X → Spec A the unit A → RΓ(X, O_X) has a left inverse in the derived category D(A), i.e. its splitting obstruction (§0.7) vanishes.

(BHATT12, Definition 0.2 and Theorem 0.3, p. 1; BHATT12 line 38; BHATT18, Theorem 1.2, p. 1; BHATT18 line 27; KOVACS00, Theorem 1, p. 187; KOVACS00 line 11.)

For a scheme X, `structureComplex` is its structure sheaf in degree zero, regarded as a native bounded-below cochain complex. Its interface has the following laws.

- Its term in degree zero is O_X, and every other term and every differential is zero.
- It is bounded below by zero and its derived image has H⁰=O_X and Hⁱ=0 for i≠0.
- A scheme isomorphism transports this complex to the corresponding structure-sheaf complex through the supplied sheaf comparison.

For a scheme map f:X→Y, `derivedUnit` is the map O_Y[0]→Rf_*O_X in the bounded-below derived category of Y-modules. Define it by applying the single-complex functor to O_Y→f_*O_X, using the native single-complex comparison, then composing with the unit of the native right derived functor. These are specializations of the Mathlib constructions in the supplier contract (BHATT12, Definition 0.2, p.1; BHATT12 line 30). Its interface has the following laws.

- Its source is the derived image of the degree-zero structure complex of Y, and its target is the right derived pushforward of the derived structure complex of X.
- On H⁰ it is the ringed-space map O_Y→f_*O_X induced by f.
- For the identity map, the native identity comparison identifies the unit with the identity; a retraction means that composing the unit with a map back to its source gives the identity.

For Y=Spec A with A Noetherian and f proper, the affine quasicoherent comparison of SchemeAndStackFoundations §2.18 and EnhancedDerivedSheaves §§E1.4, E1.8 identifies splitting of this sheaf-derived unit with splitting of A→RΓ(X,O_X) in D(A). The bounded-below inclusion is fully faithful, so it does not change the existence of the retraction. This is the formulation used by `DerivedSplinter` and the two derived-splitting headline signatures, `splinter_iff_derivedSplinter_charP` and `derivedDirectSummand`.

Bhatt 2012, Definition 0.2, asks splitting of O_S → Rf_*O_X in D(Coh(S)) for schemes S; for affine S = Spec A this is the definition above, RΓ(X, O_X) being computed by the enhanced pushforward (EnhancedDerivedSheaves §E1.4).

Every Noetherian derived splinter is reduced: apply its retraction property to the finite surjective reduction map Spec(A_red) → Spec A. On H⁰ the retraction makes A → A_red injective, so the nilradical is zero. Every finite injective ring map A → B gives a finite surjective Spec B → Spec A (lying over), with RΓ = B; hence every derived splinter is a splinter. In characteristic 0 a complex variety is a derived splinter iff it has rational singularities (Kovács, as recalled in Bhatt 2012 Example 1.2; the direction from a derived retraction to rational singularities is KOVACS00, Theorem 1, p. 187; KOVACS00 line 11); in characteristic p derived splinters are exactly the splinters (§7.6).

A proof route is the following. RΓ(X, O_X) is the derived pushforward of O_X along X → Spec A (EnhancedDerivedSheaves §E1.4), an object of D(A) with Hⁱ = Hⁱ(X, O_X) (Tau Ceti Scheme.Modules.Cohomology). Composition: if A → RΓ(Y, O_Y) splits for some Y → X → Spec A with Y → X proper surjective, then A → RΓ(X, O_X) splits, since the unit for Y factors through the one for X.

The interface has the following laws.

- A Noetherian ring is a derived splinter exactly when every proper surjective scheme over its spectrum has a derived unit retraction.
- A Noetherian derived splinter is reduced and is a splinter.
- For a derived splinter A and a proper surjective X → Spec A, a chosen left inverse RΓ(X, O_X) → A in D(A).
- If A is Noetherian, f : X → Spec A is proper and, for every maximal ideal m, the base-changed unit Â_m → RΓ(X ×_A Â_m, O) splits, then A → RΓ(X, O_X) splits (§7.3).
- Every Noetherian regular ring is a derived splinter (§7.8).

**Checks.**

- A field K is a derived splinter: for X proper over K and nonempty, K → H⁰(X, O_X) splits as K-vector spaces and the higher cohomology is a direct summand of RΓ.
- The cone C = ℂ[x, y, z]/(x³ + y³ + z³) is a normal domain containing ℚ, hence a splinter, but not a derived splinter: its vertex is not a rational singularity (H¹ of the structure sheaf of the blow-up of the vertex is H¹(E, O_E) ≠ 0 for the elliptic curve E), so the unit for a resolution does not split: a left inverse of O_X → Rφ_*O_Y for a resolution φ forces rational singularities (KOVACS00, Theorem 1, p. 187; KOVACS00 line 11), while the blow-up Y of the vertex has R¹φ_*O_Y = H¹(E, O_E) = ℂ ≠ 0. A definition using only finite maps fails this test.
- For the identity proper cover, RΓ=A and the cone is zero, so the unit is its own retraction. For A=k[ε]/ε² the finite surjective reduction cover has H⁰-unit ε↦0, which has no retraction because ε≠0; this excludes a nonreduced derived splinter.
- For X=Spec 𝔽₂ the structure complex has term 𝔽₂ in degree zero and zero in degrees −1 and 1; its differential is zero.
- For X empty the structure sheaf and every term of its complex are zero, so the derived image is zero.
- For the identity of Spec k[ε]/ε² the degree-zero term retains ε≠0 and ε²=0; replacing the structure sheaf by its reduction would give k and fail this Check.
- For the finite diagonal cover Spec(A×A)→Spec A, the degree-zero unit sends a↦(a,a), and first projection composes with it to a.
- For Spec(ℤ/2)→Spec ℤ the derived unit is induced by ℤ→ℤ/2, with 1↦1 and 2↦0. It has no left inverse because the image of 2 would have to be both 0 and 2.


*Needs:* §0.7; §0.2; Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlus`; Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlusUnit`; Mathlib `AlgebraicGeometry.Scheme.Modules.pushforward`; Mathlib `SheafOfModules.unitToPushforwardObjUnit`; EnhancedDerivedSheaves §§E1.4, E1.8; SchemeAndStackFoundations §2.18; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.Surjective`.

### 7.2 Coherent cohomology of proper schemes over regular rings is perfect

Let A₀ be a Noetherian ring and f : X → Spec A₀ proper. Then RΓ(X, O_X) is a bounded complex with finitely generated cohomology modules, hence pseudo-coherent (DerivedModuleAlgebra §1.E.0), and so is the cone of A₀ → RΓ(X, O_X). If A₀ is a regular local ring, these complexes are perfect. For flat A₀ → A₀′, RΓ(X, O_X) `⊗^L_{A₀}` A₀′ ≅ RΓ(X `×_{A₀}` A₀′, O).

(BHATT18, Proof of Theorem 6.1, p. 11; BHATT18 line 604; BHATT18, §1.2, last paragraph, p. 3; BHATT18 line 137; STACKS, Lemma 30.4.2, tag 01XI; STACKS line 290 in the cohomology-of-schemes text; Proposition 30.19.1, tag 02O5, and Lemma 30.19.2, tag 02O6; STACKS lines 2350 and 2413 in the cohomology-of-schemes text.)

Bhatt uses these facts implicitly in the proof of Theorem 6.1; they are stated here because the localisation of the derived obstruction and its flat base change need them.

A proof route is the following. Use coherent proper pushforward from JacobianChallenge Layer C. For a finite affine cover of X by t opens, separatedness makes all intersections affine, and the alternating Čech complex gives Hⁱ(X,O_X)=0 for i≥t. This supplies the finite bound without a finite-dimensional base hypothesis (Stacks §30.4, Lemma 30.4.2). Bounded with finitely generated cohomology over Noetherian A₀ means pseudo-coherent (DerivedModuleAlgebra §1.E.0). Over a regular local ring every finitely generated module has finite projective dimension (EnhancedDerivedSheaves §E1.6), so a pseudo-coherent complex with bounded cohomology is perfect (DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3). Flat base change for quasi-coherent cohomology (SchemeAndStackFoundations §§2.6, 2.18).

**Checks.**

- For X = Spec B with B finite over A₀, RΓ(X, O_X) = B; over a regular local ring B has finite projective dimension, consistent with perfectness.
- For a proper elliptic curve E/k, H⁰(O_E)=k, H¹(O_E)=k and Hⁱ=0 for i≥2; perfection does not mean concentration in degree zero.

- For the affine line over k, H⁰(O)=k[T] has infinite k-dimension, so the proper-coherence and perfectness conclusion cannot be applied to this nonproper morphism (STACKS, tag 02O5; STACKS line 2350 in the cohomology-of-schemes text).

*Needs:* JacobianChallenge Layer C; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §7.3; EnhancedDerivedSheaves §E1.6; SchemeAndStackFoundations §§2.6, 2.18; EnhancedDerivedSheaves §E1.4; Mathlib `AlgebraicGeometry.IsProper`.

### 7.3 Reductions of the derived splitting problem

Let A₀ be a Noetherian regular ring and f₀ : X₀ → Spec A₀ proper surjective, with splitting obstruction α ∈ `Hom_{D(A₀)}`(Q, A₀[1]) of A₀ → RΓ(X₀, `O_{X₀}`) (§0.7). Then α = 0 iff its image vanishes over the completion of the localisation at every maximal ideal; each such completion is a complete regular local ring of equal characteristic 0, of equal characteristic p, or of mixed characteristic (0, p), and the base-changed map is again proper surjective. Over a complete regular local A₀ one may moreover replace X₀ by an integral closed subscheme Z, proper, surjective and generically finite over A₀; in mixed characteristic there is then g ∈ A₀ nonzero in A₀/p with Z → Spec A₀ finite étale over A₀[1/(pg)].

(BHATT18, Proof of Theorem 6.1, first sentences, p. 11; BHATT18 line 604.)

The pseudo-coherence of Q makes `Hom_{D(A₀)}`(Q, A₀[1]) commute with flat base change (Stacks 0A6A), so the passage to completed local rings is lossless. For X₀ = Spec B₀ with B₀ finite the reductions are those of §0.8.

A proof route is the following. Q is pseudo-coherent (§7.2), so for flat A₀ → A₀′, Hom(Q, A₀[1]) ⊗ A₀′ ≅ Hom(Q ⊗^L A₀′, A₀′[1]), and Q ⊗^L A₀′ is the cone for X₀ `×_{A₀}` A₀′ by flat base change. A finitely generated module vanishing at every completed local ring vanishes. Multisection: choose a closed point of the generic fibre of X₀ → Spec A₀ (A₀ a domain) and let Z be its closure, integral, proper, surjective and generically finite; the unit for Z factors through the unit for X₀, so splitting for Z implies splitting for X₀. Discriminant: Z → Spec A₀ is generically finite étale in characteristic 0, and as in §0.8 g can be chosen outside the minimal primes of pA₀.

**Checks.**

- For the map Spec(A×A)→Spec A, select either generic point and take its closure Spec A; the composed unit is the identity.

*Needs:* §0.7; §0.8; §7.2; SchemeAndStackFoundations §§2.6, 2.18; DeformationAndDerivedPatchingAlgebra §1.13; Mathlib `AlgebraicGeometry.IsIntegral`; Mathlib `AlgebraicGeometry.IsProper`.

### 7.4 Proper maps over integral perfectoid algebras are almost split

Let K be a perfectoid field of characteristic 0 and residue characteristic p, A an integral perfectoid K°-algebra and f : Y → Spec A a proper morphism such that f[1/p] is finite étale and surjective. Then u : A → RΓ(Y, O_Y) is almost split with respect to K°°A in the sense of the Conventions: the connecting morphism α of u is annihilated by K°°, equivalently for every ε ∈ K°° there is r_ε : RΓ(Y, O_Y) → A in D(A) with r_ε ∘ u = ε·id_A. No left inverse in the derived category of almost modules is asserted. When K is the completion of ℚ_p(`p^{1/p^∞}`) used in Layer 3, K°°A is generated by the chosen p-power roots of p, and the statement is almost splitting with respect to `p^{1/p^∞}`.

(BHATT18, Proposition 6.2 and proof, with footnote 8, p. 11; BHATT18 line 616.)

Require the finite étale generic fibre to be surjective. The empty generic fibre of Spec(A/p) gives a counterexample without this condition. The almost ideal is K°°A, the ideal of topologically nilpotent elements of K° extended to A (PerfectoidSpaces §P0 (root ideal basic setup)); a general perfectoid field need not contain any p-power root of p, and Bhatt’s Proposition 6.2 fixes the rooted field.

Use the quasi-compact quasi-separated modification-domination contract of SchemeAndStackFoundations §4.12 explicitly (STACKS, tag 081T; STACKS line 4296 in the flattening text). Its scheme statement has no perfectoid hypothesis; completion and the perfectoid application are owned here. Integrality of H⁰(Y,O_Y) is used without a claim that it is finite over A.

A proof route is the following. B = H⁰(Y, O_Y) is integral over A and finite étale after inverting p; almost purity (PerfectoidSpaces §P3 (almost purity theorem), PerfectoidSpaces §P3 (integral closure almost finite etale)) gives B → C, an isomorphism after inverting p, with A → C almost finite étale, faithful by surjectivity, hence almost split (trace, PerfectoidSpaces §P0 (almost dual and trace)): for every ε ∈ K°° there is an A-linear ρ_ε : C → A with ρ_ε(1) = ε. Pass through the integral closure C of the finite étale generic algebra and base change Y along H⁰(Y,O_Y)→C. The generic fibre becomes an isomorphism; the faithful almost finite étale cover supplies the retraction back to A. Apply the scheme contract to S=Spec C, U=Spec C[1/p] and the proper C-scheme `Y ×_(Spec B) Spec C`, whose restriction to U is the identity. Properness of Y→Spec B follows from properness over A and separatedness of Spec B→Spec A. This gives a U-admissible blow-up dominating that C-scheme, without assuming finite presentation over C. On the affine base its finite-type centre I satisfies V(I)⊆V(p), hence pᴺ∈I for some N. Its p-adic completion gives the required completed domination. Relabel C as A and its base-changed scheme as Y for the following perfectoid step. Write the blow-up ideal (f₀,…,f_r). The rational domains |f_j|≤|f_i|, with some f_i nonzero since pᴺ lies in the ideal, cover Spa(A[1/p],A). On each, the bounded fractions f_j/f_i give a map to the corresponding scheme blow-up chart; these glue to a morphism of ringed spaces (Spa(A[1/p],A),O⁺) → Y. This is Bhatt’s footnote 8 argument. No locally finite-type formal model or general Raynaud equivalence is used. The composite is an almost isomorphism by Scholze's almost vanishing of Hⁱ(S_η, O⁺) for i > 0 (PerfectoidSpaces §P2 (sheaf theorem and almost acyclicity)), so the first map b is almost split: the cone Q′ of a∘b has cohomology killed by K°°, so K°° `⊗_{K°}` Q′ = 0 (K°° is flat over K° and equal to its square); multiplication by ε ∈ K°° on Q′ factors through K°° `⊗_{K°}` Q′ and is therefore zero, so ε kills the connecting morphism of a∘b. Hence ε·id_C = r∘a∘b for some r, and r∘a is an ε-retraction of b; write r_δ for these retractions of the unit of the relabelled scheme. Return to the original A and Y: the unit of A factors through RΓ(Y,O_Y) → `RΓ(Y ×_(Spec B) Spec C, O)`, so ρ_ε ∘ r_δ ∘ (that pullback) is a retraction up to εδ. Since (K°°)² = K°° (the value group of K is p-divisible), every element of K°° is a finite sum of such products, and sums of these maps give r_ε for every ε ∈ K°°.

**Checks.**

- For Y = Spec B finite over A this is the almost splitting of an almost finite étale cover, as in §3.5.
- For A=K° and Y=Spec(K°/p), the generic fibre is empty and finite étale, but p=0 on Y. An almost retraction would give ε·p=0 in K° for every ε∈K°°, which fails because K° is a domain and K°°≠0.
- For K the completion of ℚ₃(`μ_{3^∞}`), the ideal K°° is defined and nonzero (it contains ζ₃−1), but K contains no cube root of 3: the splitting field of X³−3 over ℚ₃ is nonabelian, while every finite subextension of the cyclotomic tower is abelian, and Krasner’s lemma puts any element of K algebraic over ℚ₃ into a finite subextension. So the almost ideal must be K°°A, not one generated by roots of p.

*Needs:* PerfectoidSpaces §P0 (root ideal basic setup); PerfectoidSpaces §P3 (almost purity theorem); PerfectoidSpaces §P3 (integral closure almost finite etale); PerfectoidSpaces §P0 (almost dual and trace); PerfectoidSpaces §P2 (sheaf theorem and almost acyclicity); SchemeAndStackFoundations §4.12 (perfectoid base modification domination); EnhancedDerivedSheaves §E1.4.

### 7.5 Killing higher coherent cohomology by finite covers in characteristic p

Let f : X → S be a proper morphism of Noetherian 𝔽_p-schemes. There exist a proper morphism g : Y → S and a finite surjective morphism π : Y → X such that π* : `τ^{≥1}`Rf_*O_X → `τ^{≥1}`Rg_*O_Y is zero.

(BHATT12, Theorem 0.4, p. 1; Lemma 2.2, p.6; Propositions 3.1–3.2 with Corollary 3.5, pp.7–9; BHATT12 line 42.)

The source is Bhatt 2012 Theorem 0.4, whose proof follows the method of Hochster–Huneke and Huneke–Lyubeznik (equational lemma and Frobenius); it is cited here as a key theorem with that outline.

A proof route is the following. Over an affine Noetherian base, each positive coherent cohomology module is finite and Frobenius-stable. For finitely many generators, monic additive Frobenius equations allow finite integral extensions killing the classes (Bhatt 2012 Proposition 3.2 and Corollary 3.5, pp. 7–9). The equational lemma supplies the method; ordinary affine cohomology is not local cohomology. Choose a finite affine cover of X. Its base changes remain affine, giving a fixed finite Čech bound for the higher cohomology at every later finite cover. Killing all cohomology maps is insufficient by itself to kill a derived morphism: iterate the covers through that finite amplitude, using Bhatt Lemma 2.2, p. 6, to make `τ^{≥1}`Rf_* → `τ^{≥1}`Rg_* zero. For a general Noetherian S choose finitely many affine opens; Proposition 3.1, p. 7, extends and dominates the local finite covers to obtain a common finite surjective cover. The same bounded-complex argument yields the global zero morphism. No induction on potentially infinite Krull dimension is used.

**Checks.**

- For an elliptic curve E over a field of characteristic p, the finite surjective map [p]:E → E acts as multiplication by p on H¹(E,O_E), hence as zero. Since `τ^{≥1}`RΓ(E,O_E) has only H¹, its induced map is zero. In contrast, X=Spec R already has zero positive ordinary coherent cohomology and cannot test local-cohomology killing.
- For an elliptic curve in characteristic 2, [2]* acts by 2=0 on H¹(O_E); in characteristic 3, [3]* acts by 3=0. The identity cover acts by 1 and does not kill that group.

*Needs:* §4.9; §7.2; EnhancedDerivedSheaves §E1.4; Mathlib `frobenius`.

### 7.6 Splinters are derived splinters in characteristic p

The headline signature is `splinter_iff_derivedSplinter_charP`.

A Noetherian 𝔽_p-algebra is a splinter if and only if it is a derived splinter (§7.1). In particular every Noetherian regular 𝔽_p-algebra is a derived splinter.

(BHATT12, Theorem 0.3, p. 1, proof p. 9; BHATT12 line 38; BHATT12, Example 1.3, p. 3; BHATT12 line 114; BHATT18, §1, paragraph after Theorem 1.2, p. 1; BHATT18 line 27.)

The 'in particular' combines this with §1.3, as Bhatt cites Bhatt 2012 Theorem 1.4 and Example 2.3 for the characteristic-p case of Theorem 1.2.

A proof route is the following. Derived splinter ⇒ splinter: §7.1 first gives reducedness, and finite surjective maps are proper surjective. Given X → Spec A proper surjective, choose Y → X finite surjective killing the map on `τ^{≥1}`. The composite RΓ(X,O_X) → RΓ(Y,O_Y) → `τ^{≥1}`RΓ(Y,O_Y) is zero. Exactness of Hom applied to the truncation triangle H⁰(Y,O_Y) → RΓ(Y,O_Y) → `τ^{≥1}`RΓ(Y,O_Y) therefore lifts the first map to RΓ(X,O_X) → H⁰(Y,O_Y). The lift preserves the unit: Hom(A,H⁰(Y,O_Y)) → Hom(A,RΓ(Y,O_Y)) is an isomorphism by the standard t-structure. The finite algebra H⁰(Y,O_Y) has surjective spectrum over A by proper surjectivity of Y → Spec A; since a splinter is reduced, its structure map is injective. Its A-linear splitting composed with the lift retracts A → RΓ(X,O_X).

**Checks.**

- 𝔽_p⟦x, y⟧ is a derived splinter, by §1.3 and this theorem.
- For a field of characteristic 2 both the splinter and derived-splinter properties hold; for the node k[x,y]/(xy), failure of ideal contraction rules out both properties.

*Needs:* §7.1; §7.5; §1.3; §0.2; §7.2; EnhancedDerivedSheaves §E1.4.

### 7.7 The derived direct summand theorem for regular rings containing ℚ

The target derivedDirectSummand_charZero is specified here in prose.

Every Noetherian regular ring containing ℚ is a derived splinter (§7.1).

(BHATT18, §1, paragraph after Theorem 1.2, p. 1; BHATT18 line 27; BHATT12, Example 1.1, pp. 2–3; BHATT12 line 103; BHATT12, Example 1.2, p. 3; BHATT12 line 105.)

Bhatt attributes the characteristic-zero case to Kovács through rational singularities. Kovács Theorem 2 (KOVACS00, p. 188; KOVACS00 line 50) treats surjective maps of complex projective varieties, and its proof passes through Theorem 5 (KOVACS00 line 148), whose canonical-sheaf isomorphism fails for maps with disconnected generic fibre: for the degree-two map of the projective line to itself, the pushforward of the canonical sheaf has rank 2 and the target canonical sheaf rank 1. The route below therefore uses the generic degree directly, and needs neither a finite-type base over a field nor Grauert–Riemenschneider vanishing, because the base is regular.

This section owns the following trace lemma. Let f : Y → X be a proper surjective morphism of integral regular Noetherian schemes which is generically finite, of generic degree e, and generically étale. Then f is a local complete intersection morphism, f^!O_X is an invertible sheaf L placed in degree 0, and the field trace `Tr_{K(Y)/K(X)}`, an element of the generic stalk `L_η = Hom_{K(X)}(K(Y), K(X))`, extends to a global section of L. Under global duality `Hom_X(Rf_*O_Y, O_X) ≅ H⁰(Y, L)` the extended section is a map τ : Rf_*O_Y → O_X whose composite with the unit O_X → Rf_*O_Y is multiplication by e.

(STACKS, Duality for Schemes, Lemma 48.29.2, tag 0E9Z, pp. 77–78; STACKS line 3650 in the duality text, with Lemmas 48.15.6 and 48.15.7 (tags 0BR0, 0BRT; lines 1786 and 1797 there) for the immersion and smooth-proper factors; STACKS, Example 48.7.3, tag 0B6L, p. 21; STACKS line 1039 in the duality text, for the trace of a finite affine morphism as evaluation.) Lemma 48.29.2 assumes a global factorization through an immersion into a smooth proper scheme. Here it is applied locally: an affine open of Y over an affine open U of X is closed in some affine space over U, hence immersed in projective space over U, and `upperShriek` restricts along open immersions. For relative dimension r = 0 it gives a section of L, the Jacobian section below. Compatibility with the field trace at the generic point, and gluing of the local sections by agreement there, are owned by this target.

A proof route is the following. Lci: locally Y is a closed subscheme of an affine space over an affine open of X, and a closed immersion of regular schemes is cut out by part of a regular system of parameters (DeformationAndDerivedPatchingAlgebra §3.4). Shape of f^!O_X: SchemeAndStackFoundations §2.19 (`upperShriek_lci`, `upperShriek_proper`) makes f^!O_X locally a shifted line bundle; Y is connected, and flat base change to the generic point of X (`upperShriek_flat_baseChange`, then `upperShriek_etale` for the finite étale generic fibre) fixes the shift at 0. Extension of the trace: in a local presentation of Y as the zero locus of g₁, …, g_n in affine n-space over an affine open of X, the local formula for f^! identifies L with the line generated by the dual of dg₁∧⋯∧dg_n tensored with dX₁∧⋯∧dX_n; the Jacobian determinant det(∂g_i/∂X_j) is a regular function, and the corresponding section agrees at the generic point with the trace of the finite étale algebra K(Y)/K(X) (for one variable and a monic g of degree r, Tr = g′(y)·c, where c reads off the coefficient of `y^{r−1}` in the basis 1, y, …, `y^{r−1}`). Composite: an endomorphism of O_X on the integral scheme X is a regular function, and after flat base change to the generic point the finite-map formula `pushforwardRightAdjoint_affine_finite` turns the duality counit into evaluation at 1, so τ∘unit is Tr(1)=e.

Using the lemma, the theorem follows. A proof route is the following. By §7.3 it suffices to treat A₀ complete regular local containing ℚ and Z integral, proper, surjective and generically finite over X = Spec A₀; in characteristic zero Z is generically étale over X. A₀ is excellent, so Z is a reduced Noetherian quasi-excellent ℚ-scheme; ResolutionOfSingularitiesCharacteristicZero §7.5 (`qeResolution`) gives a projective birational π : Y → Z with Y regular, and Y is integral because Z is. The unit A₀ → RΓ(Y, O_Y) factors through the unit for Z, so a retraction for Y gives one for Z. The composite f : Y → X is proper, surjective and generically finite of degree e, between integral regular schemes. Apply the trace lemma: e is a unit because ℚ ⊆ A₀, and e⁻¹τ retracts the unit, so the obstruction of §0.7 vanishes. The affine comparison of §7.1 transports the retraction between the sheaf and the module formulations.

**Checks.**

- For A₀=K⟦x⟧ and Y the spectrum of B=K⟦`x^{1/2}`⟧=A₀[y]/(y²−x), e=2. With c(a+by)=b, the section g′(y)·c=2y·c sends 1 to c(2y)=2 and y to c(2x)=0, which is the trace; dividing by 2 sends 1 to 1. The zero functional and the coefficient functional c alone (c(1)=0) both fail to retract.
- For Y the blow-up of Spec K⟦x,y⟧ at its maximal ideal, e=1 and L=O_Y(E) for the exceptional curve E; the Jacobian section vanishes to order 1 along E and is regular, and τ is the identity of A₀ because H⁰(O_Y)=A₀ and Hⁱ(O_Y)=0 for i>0. The dual model O_Y(−E) has no section restricting to the generic identity, so this example fixes the direction of the twist.
- For the degree-two map of the projective line to itself over ℂ, given by squaring both homogeneous coordinates, the pushforward of the canonical sheaf has rank 2 while the canonical sheaf of the target has rank 1, so no isomorphism between them exists; the composite of the trace with pullback of top forms is 2 times the identity, and half of it is the retraction. This is the degree-sensitive form used above.
- For A₀=K a field and Z=Spec L with L/K finite of degree e, the lemma is the divided trace of §0.9, with Tr(1)=e.
- For a smooth projective elliptic curve E/ℂ, H¹(O_E)=ℂ, but ℂ→RΓ(E,O_E) splits in D(ℂ); nonzero higher cohomology alone does not obstruct a derived retraction.

*Needs:* statement: §7.1. Route: §7.3; §0.7; §0.9; SchemeAndStackFoundations §2.19; DeformationAndDerivedPatchingAlgebra §3.4; ResolutionOfSingularitiesCharacteristicZero §7.5 (`qeResolution`); Mathlib `AlgebraicGeometry.IsProper`; Mathlib `Algebra.trace`.

### 7.8 The derived direct summand theorem

The headline signature is `derivedDirectSummand`.

Let A₀ be a Noetherian regular ring and f₀ : X₀ → Spec A₀ a proper surjective morphism. Then A₀ → RΓ(X₀, `O_{X₀}`) has a left inverse in D(A₀); that is, every Noetherian regular ring is a derived splinter (§7.1).

(BHATT18, Theorem 1.2 and Theorem 6.1 with proof, pp. 1 and 11; BHATT18 line 27; BHATT18, Remark 1.3(2) and §1.2, pp. 1–3; BHATT18 line 32.)

In mixed characteristic the theorem was new even in dimension 2 when Bhatt proved it; it implies the direct summand theorem for reduced finite covers and is orthogonal to it for birational f₀ (blow-ups).

A proof route is the following. Reduce to A₀ complete regular local of one of the three characteristic types, and to Z integral, generically finite, finite étale over A₀[1/(pg)] (§7.3). Equal characteristic 0: §7.7. Equal characteristic p: §7.6. Mixed characteristic: the cone Q₀ is perfect (§7.2). If α₀ ≠ 0, §3.4 gives m, k with `(pg)^{1/p^k}` ∉ Ann(α∞/pᵐ). For fixed m, n the base change of Z to A∞⟨pⁿ/g⟩ is proper and finite étale and surjective after inverting p (g divides pⁿ), so A∞⟨pⁿ/g⟩/pᵐ → RΓ(Z, O) ⊗^L A∞⟨pⁿ/g⟩/pᵐ is almost split (§7.4). §3.6 makes α∞/pᵐ almost zero for `(pg)^{1/p^∞}`, a contradiction; hence α₀ = 0.

**Checks.**

- For f₀ finite and A₀ → B₀ injective the theorem is the direct summand theorem §5.1.
- For f₀ the blow-up of a regular local ring A₀ of dimension d ≥ 1 at its maximal ideal, f₀ is proper and surjective, RΓ(X₀, O) = A₀ and the splitting is trivial. For d = 1 the maximal ideal is generated by a nonzerodivisor, so the blow-up is the identity and RΓ = A₀; for d = 2 see the next Check. For alterations of regular schemes the theorem says coherent cohomology loses nothing.
- For d = 0, that is A₀ = k a field, the maximal ideal is zero, the Rees algebra is k in degree zero and 0 in every positive degree, its Proj is empty and RΓ(∅, O) = 0. The map k → 0 has no left inverse; the blow-up is proper but not surjective, so the surjectivity hypothesis excludes it and cannot be dropped.
- For the blow-up of Spec k⟦X,Y⟧ at (X,Y), H⁰(O)=k⟦X,Y⟧ and all positive Hⁱ(O) vanish; the unit is an isomorphism. The same value occurs for the identity cover.

*Needs:* §7.1; §7.3; §7.7; §7.6; §7.2; §7.4; §3.4; §3.6; §3.2; PerfectoidQuotients §1.3; PerfectoidSpacesPartII §RA.1 (annular tower).

### Examples

A field-valued proper elliptic curve has one-dimensional cohomology in degrees zero and one and still has a derived unit retraction. The normal elliptic cone is a splinter in characteristic zero but fails the derived property; the blow-up of a regular surface gives a unit isomorphism.

### Dependencies

Internal statements and proof routes use Layer 0, Layer 1, Layer 3, Layer 4, Layer 7. The headline definitions use Mathlib’s bounded-below sheaf-derived pushforward and geometric unit as specified in the supplier contract. External inputs: SchemeAndStackFoundations §§0.11, 2.6, 2.7, 2.18, 2.19, 4.12; EnhancedDerivedSheaves §§E1.4, E1.6, E1.8; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.Surjective`; Mathlib `AlgebraicGeometry.IsIntegral`; Mathlib `Algebra.trace`; JacobianChallenge Layer C; DerivedModuleAlgebra §1.E.0; DeformationAndDerivedPatchingAlgebra §§1.13, 3.4, 7.3; PerfectoidSpaces §P3 (almost purity theorem); PerfectoidSpaces §P3 (integral closure almost finite etale); PerfectoidSpaces §P0 (almost dual and trace); PerfectoidSpaces §P0 (root ideal basic setup); PerfectoidSpaces §P2 (sheaf theorem and almost acyclicity); SchemeAndStackFoundations §4.12 (perfectoid base modification domination); ResolutionOfSingularitiesCharacteristicZero §7.5 (`qeResolution`); Mathlib `frobenius`; PerfectoidQuotients §1.3; PerfectoidSpacesPartII §RA.1 (annular tower).

## Downstream consumers

Local and global commutative-algebra applications consume Layer 5’s splitting, contraction and monomial statements. Derived geometric applications consume Layer 7’s proper-unit retraction. Each consumer uses these interfaces on the same carriers and retains the characteristic, local and residue-separability hypotheses stated here.

## Worked examples

For R=K[x,y]/(xy), embed R into K[x]×K[y] by x↦(x,0), y↦(0,y). A pair lies in R precisely when its two constant coefficients agree. Multiplying (x,y) by (1,0) gives (x,0), so x belongs to (x+y)S. If x=(x+y)r in R, the x-component of r would have constant 1 and the y-component constant 0, which is impossible. Thus (x+y)S∩R strictly contains (x+y)R. This witnesses the failure of splitting without regularity (§0.1; ANDRE18B §0.2, pp.72–73).

For B=ℤ_p⟦T⟧ and B′=ℤ_p⟦T,U⟧/(T²−TU+p), put V=U−T. The defining equation becomes p−TV; hence B′ is regular of dimension two, with parameters T,V and p=TV. Its reduction is 𝔽_p⟦T,V⟧/(TV). The image of the parameter T of B/p is a zero divisor on B′/p. This is the obstruction to a square with both regular bases unramified; Layer 6 uses the regular, ramified target and the simultaneous Kummer-flatness contract (§6.2; ANDRE18B §4.4, p.88; ANDRE18B line 802).

For the algebra modification take R=k⟦X⟧, T=R[t]/(Xt), k=0 and u₁=t. There are no variables and F=t. The ideal tT contains t², so the modification is T/tT=R. Scalar multiples of t by R span only kt, so an R-module quotient T/kt keeps the nonzero class of t²; Hochster’s degree-bounded partial modifications at this fixed relation are such quotients, and their colimit is not the algebra modification. Layer 4 therefore works with algebra modifications and finite witnesses throughout (§§4.2–4.5; HOCHSTER02 §4.1 p.8; HOCHSTER02 line 225).

For a regular local ring R=k⟦X,Y⟧ and the system (X,Y), the class of XY in R/(X²,Y²) is nonzero, but (XY)² lies in that ideal. In dimension zero, the parameter list is empty, its product is 1 and its power ideal is zero; noncontainment still holds but the positive-dimensional equivalence cannot be used (§5.5; ANDRE18B §0.1(4), p.72).

## References

- **CHASE60**. Stephen U. Chase, *Direct products of modules*, Transactions of the American Mathematical Society 97 (1960), 457–473, Theorem 2.1, p.460. [Publisher archive](https://www.ams.org/journals/tran/1960-097-03/S0002-9947-1960-0120260-3/S0002-9947-1960-0120260-3.pdf).

- **ANDRE18B**. Yves André, *La conjecture du facteur direct*. Published version, Publications Mathématiques de l’IHÉS 127 (2018), 71–93, DOI 10.1007/s10240-017-0097-9 (Numdam copy; arXiv:1609.00345 is the shorter preprint, numbered differently). Page numbers are the journal's. [Legal source](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf).
- **BHATT18**. Bhargav Bhatt, *On the direct summand conjecture and its derived variant*. arXiv:1608.08882v2 (11 November 2017); published in Inventiones Mathematicae 212 (2018), 297–317. The theorem numbers and pages used here are those of the specified arXiv version. [Legal source](https://arxiv.org/pdf/1608.08882v2).
- **HOCHSTER02**. Melvin Hochster, *Big Cohen–Macaulay algebras in dimension three via Heitmann's theorem*. J. Algebra 254 (2002), 395–408; author preprint (scanned) from the author's page [Legal source](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/09/bigcm3.pdf).
- **HEITMANNMA18**. Raymond Heitmann and Linquan Ma, *Big Cohen–Macaulay algebras and the vanishing conjecture for maps of Tor in mixed characteristic*. arXiv:1703.08281v2 (18 March 2018); published in Algebra & Number Theory 12 (2018) [Legal source](https://arxiv.org/pdf/1703.08281v2).
- **BMPSTWW**. B. Bhatt, L. Ma, Z. Patakfalvi, K. Schwede, K. Tucker, J. Waldron and J. Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*. arXiv:2012.15801v3 [Legal source](https://arxiv.org/pdf/2012.15801v3).
- **DATTAMURAYAMA**. Rankeya Datta and Takumi Murayama, *Excellence, F-singularities, and solidity*. arXiv:2007.10383v1 [Legal source](https://arxiv.org/pdf/2007.10383v1).
- **HUNEKELYUBEZNIK**. Craig Huneke and Gennady Lyubeznik, *Absolute integral closure in positive characteristic*. arXiv:math/0604046v1 (3 April 2006); published in Advances in Mathematics 210 (2007), 498–504 [Legal source](https://arxiv.org/pdf/math/0604046v1).
- **HOCHSTERLC**. Melvin Hochster, *Local cohomology (Math 615 lecture notes, Winter 2011)*. version of January 6, 2011, from the author's page [Legal source](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W2011.LocCoh.pdf).
- **BHATT12**. Bhargav Bhatt, *Derived splinters in positive characteristic*. arXiv:1109.0354v1 (2 September 2011); published in Compositio Mathematica 148 (2012), 1757–1786 [Legal source](https://arxiv.org/pdf/1109.0354v1).
- **HOCHSTER73**. Melvin Hochster, *Contracted ideals from integral extensions of regular rings*. Nagoya Mathematical Journal 51 (1973), 25–43; public journal copy from Cambridge University Press. Journal page numbers. [Legal source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/82D140341FC0DE224799A1FB5468DC45/S0027763000015701a.pdf/contracted-ideals-from-integral-extensions-of-regular-rings.pdf).
- **HH95**. Melvin Hochster and Craig Huneke, *Applications of the existence of big Cohen–Macaulay algebras*. Advances in Mathematics 113 (1995), 45–117. Published locator: §1.2(d) for flatness and §2.3 for descent, as cited in ANDRE18B §§4.2–4.4. [Legal source](https://doi.org/10.1006/aima.1995.1035).
- **BH93**. Winfried Bruns and Jürgen Herzog, *Cohen–Macaulay rings*, Cambridge Studies in Advanced Mathematics 39, Cambridge University Press, 1993; Exercise 8.1.7 and Theorem 8.5.1, as cited by BMPSTWW. Cited by published locator. [Publisher page](https://doi.org/10.1017/CBO9780511608681).
- **HH92**. Melvin Hochster and Craig Huneke, *Infinite integral extensions and big Cohen–Macaulay algebras*, Annals of Mathematics (2) 135 (1992), 53–89; the equal-characteristic-zero existence of big Cohen–Macaulay algebras, as attributed by BMPSTWW §2.2. Cited by published locator. [Publisher page](https://doi.org/10.2307/2946563).
- **KOVACS00**. Sándor J. Kovács, *A characterization of rational singularities*. Duke Mathematical Journal 102 (2000), 187–191; public author copy; journal page numbers. [Legal source](https://sites.math.washington.edu/~kovacs/current/papers/Kovacs__A_characterization_of_rtl_singularities.pdf).
- **STACKS**. The Stacks Project Authors, *The Stacks Project*. Online version accessed 2026-10-25; tags are stable locators. [Legal source](https://stacks.math.columbia.edu).

HH95, HH92 and BH93 are cited by their published locators only; the other source locators use the legally fetched versions. André’s numbers and pages refer to the published Numdam article, Bhatt’s to arXiv:1608.08882v2, Bhatt 2012 to arXiv:1109.0354v1, and Hochster 2002 to the author preprint. The other arXiv versions are specified in the entries above. No published numbering is inferred from a differently numbered preprint.

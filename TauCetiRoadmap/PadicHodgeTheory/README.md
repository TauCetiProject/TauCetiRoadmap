# Roadmap: p-adic Hodge theory and geometric comparison

**Summary.** This roadmap connects Mathlib's theta and de Rham completion carriers to rational period functors, Robba realizations and geometric comparison. Its endpoints are the group-valued period torsor (§5.5), the interpolation presentation of the de Rham differential lattice (§5.1), filtered de Rham comparison with coefficients (§7.2), crystalline and semistable geometric comparison (§8.1), and the good-reduction criterion (§9.3). Explicit Kummer and Tate-curve periods fix the conventions.

`README.md` states the full roadmap; `Suggested.lean` states §9.3's `potentiallyMultiplicativeTwistReduction`, using the explicit twist predicate `IsTateTwist`. Its module docstring identifies the missing objects needed to state the other headline signatures against the pins. All targets and their prerequisite constructions are specified here. New declarations use `TauCetiRoadmap.PadicHodgeTheory`; supplied objects retain their owner’s namespace. API lists may suppress a common namespace, and a suffix beginning `_` retains the operation stem.

## Scope and ownership

This roadmap extends the supplied field periods to relative coefficients and stronger integral presentations (Layer 0), cyclotomic adapters on supplied analytic annuli (1), period sheaves and primitive comparison (2), Hodge–Tate descent and extra filtered APIs (3), Robba comparison (4), the interpolation presentation of the supplied differential lattice, Robba modifications and normalization adapters (5), integral weight dictionaries and ordinary lifting (6), filtered connections and relative period cohomology (7), rational geometric assembly (8), and explicit Kummer/reduction applications (9).

Existing objects are inputs:

- Mathlib's `PadicComplex`, `PadicComplexInt`, `PreTilt`, `WittVector.fontaineTheta`, `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham`, `WittVector.Isocrystal`, `WittVector.IsocrystalHom`, `WittVector.IsocrystalEquiv` and rank-one `WittVector.isocrystal_classification`. The lower period owners below supply the field structures on these carriers; this roadmap adds the stated relative and higher-rank comparisons.
- Tau Ceti's two-sided restricted coefficients and convolution; PadicDifferentialEquationsAndRigidCohomology §§RD.0.1–RD.0.3 supplies their arbitrary-radius annulus and Robba extensions. Layer 1 adds cyclotomic operations on those carriers.
- TauCetiRoadmap **AdicSpaces**, §§6.1–6.4, supplies the classical Witt interval rings, adic Fargues–Fontaine curve and quotient sheaf, in addition to Huber pairs and rational sheaves; **AlgebraicVectorBundles**, Layers L0B–L0C, supplies vector bundles and tensor/dual/determinant operations. The period-lattice construction adds filtration, connection and descent.
- TauCetiRoadmap **LocalFieldsRamification**, Layer `3`, supplies ramification; **LocalGaloisGroups**, Layers 5 and `7`, supplies cyclotomic orientation and completion actions; **ClassFieldTheory**, Layers 7 and `9`, supplies arithmetic Artin and Weil groups. **EllipticCurves**, Layers `2`, 4 and `5`, supplies Tate modules, Tate uniformization, reduction and twists. ArithmeticGaloisRepresentations §6.3 supplies the Tate-curve torsion and Tate-module sequence also at ℓ=p. Layer 9 compares its Kummer coordinates and adds periods and `potentiallyMultiplicativeTwistReduction` on the supplied carriers.
- **ReductiveGroupsPartII**, §§RG2.1.5 and RG2.4.3, supplies algebraic fundamental groups, central extensions, the Kottwitz homomorphism and cocharacter averaging. Section 5.5 owns `localTorsorKottwitz`, descent to sigma-conjugacy, tensor Newton invariants and the period-torsor comparison.
- **DerivedDeRhamCohomology**, §§PD.6–PD.7, supplies general PD envelopes and their comparison with the principal period envelope of **PadicPeriodRings** §3. **CrystallineCohomology**, Layers CR.1–CR.3 and CR.5, supplies crystalline and log crystalline/Hyodo–Kato realizations. Full coefficient/family crystalline comparison, log period sheaves on semistable models and general analytic Hyodo–Kato comparison are downstream **CohomologyComparisons** work.
- **AInfCohomology**, **PrismaticCohomology** and **PerfectoidQuotients** own their integral constructions and comparison maps. Their integral interfaces are inputs to this roadmap's rational comparison and compatibility theorems.
- **LocalGaloisDeformationRings**, §§0.3–0.4 and 1.7, owns the common finite-coefficient Robba category, étale realization, overconvergence and Herr comparisons, ordinary endpoints, and elementary ordered-flag API. Sections 4.3 and 4.5 use its field specializations with cyclotomic presentation and sign adapters; §6.4 applies its endpoint theorems. Section 3.6 uses its ordinary predicate as `RegularOrdinary` and owns the additional crystalline slope, monodromy and descent comparisons.

## Conventions

`p` is prime, including 2. Unless explicitly generalized, `K/ℚ_p` is finite, `k` its residue field, `K_0=Frac W(k)`, `K̄` a fixed algebraic closure and `C=(K̄)^∧`. General-residue assertions allow complete discretely valued mixed-characteristic `K` with perfect `k`. Equal characteristic is admitted only in the analytic/algebraic assertions that say so. Normalize `v_p(p)=1`, `|p|=p^(−1)`, while `v_K(p)=e_K`. Representations and cohomology are continuous for the stated topology. Coefficients `E/ℚ_p` use `K⊗ E` components and labelled filtrations.

The covariant twist has `g(e_r)=χ(g)^re_r`. Weight `h` counts `C(h)`; for de Rham objects its filtration jump is `−h`. Thus `ℚ_p(1)` has Frobenius `p^(−1)` and jump `−1`. For `u=log[p^♭]`, `N=−d/du` and `Nφ=pφ N`; Berger's corrected coordinate has `N(log π)=−p/(p-1)`. Arithmetic Weil Frobenius inverts crystalline Frobenius, with the residue degree in §5.3. The split Tate basis has `φ=diag(p^(−1),1)`, `Ny=v_p(q)x`, and arithmetic Weil operator `diag(p,1)`.

Complexes are cohomological, with total differential `d_h+(−1)^i d_v` in horizontal degree `i` and `d_(C[1])=−d_C`. Cups use Koszul signs. Filtrations decrease and tensor by convolution; the dual uses `(Fil^(1−i))^⊥`. Natural Fontaine topologies retain p-adic coefficients. No filtered Frobenius on `B_dR` is assumed.

## Exact supplier contracts

### From Mathlib

At pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `RingTheory.Perfectoid.FontaineTheta` supplies `WittVector.fontaineTheta, fontaineTheta_teichmuller` and `surjective_fontaineTheta`, requiring p-adic completeness and, for surjectivity, residue Frobenius surjectivity. `RingTheory.Perfectoid.BDeRham` supplies completion/localization carriers for a commutative ring `R` and a prime `p`, under `[Fact (¬ IsUnit (p:R))]` and `[IsAdicComplete (Ideal.span {p}) R]`; PadicPeriodRings §§1.1 and 1.5 supplies the geometric field DVR theorem and its natural topology. `RingTheory.WittVector.Isocrystal` supplies semilinear automorphisms and rank-one algebraically closed-residue classification. Use existing divided powers, filtered modules, adic completion, Laurent polynomials, summable families, derived categories and continuous cochains.

### From Tau Ceti

At pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: in `RingTheory.Huber.Restricted.TwoSidedSeries`, use `TauCeti.Huber.twoSidedRestrictedSubmodule, mem_twoSidedRestrictedSubmodule, addConvolutionExists_of_mem_twoSidedRestrictedSubmodule, addRingConvolution_mem_twoSidedRestrictedSubmodule, twoSidedRestrictedMul` and `coe_twoSidedRestrictedMul`. Summability requires a complete nonarchimedean uniform ring; the bilinear product uses the separated commutative case. These give the radius-one special case of the analytic coefficient supplier used in §1.1.

### From PadicDifferentialEquationsAndRigidCohomology

Sections RD.0.1–RD.0.3, RD.0.17–RD.0.18, RD.0.24, RD.0.26 and RD.0.36 supply Laurent, annulus, Robba and Amice carriers, Gauss norms, chart and weak topologies, restrictions, preparation, finite coefficient extension, bounded intersections and differentiation. Their positive-radius intervals allow arbitrary real endpoints. Sections 1.1–1.4 use those objects directly; their analytic formulas and Checks specify the imported convention. Any Laurent presentation adapter must preserve coefficients and convolution, identify every Gauss seminorm, and be a homeomorphism on charts and on the Robba inductive limit; bounded and integral subrings and restrictions must correspond under the same map. New work in Layer 1 consists of cyclotomic substitutions, localizations and normalization adapters, together with the evaluation and completed scalar-extension interfaces in §1.2.

### From PadicPeriodRings

Sections 1.1–1.5 and 2 supply `PadicComplex`'s continuous isometric Galois action, Ax–Sen–Tate, normalized cyclotomic traces, Tate's `H⁰/H¹` calculations, and their extension to complete discretely valued mixed-characteristic fields with arbitrary perfect residue field. Section 2's `completedUnramifiedDescent` gives finite-module descent over the completed maximal unramified extension. Section 3 supplies `periodPDEnvelope`, its principal regular-kernel presentation, p-completion, universal property, theta and logarithm. Sections 4.1–4.3 supply `generalBasePeriodRings`, the topological de Rham/crystalline/semistable carriers, their actions and structure maps, invariant functors, rational predicates, fixed fields, dimension bounds, regularity and the underlying fundamental period sequence. Finite `K/ℚ_p` uses these same carriers. The natural topology on `B_dR` is the locally convex inductive limit of the filtration stages: multiplication is separately continuous and jointly continuous on each pair of fixed stages; there is no global `ContinuousMul` instance. Continuous cochains use its additive topology and jointly continuous Galois action.

### From PadicLocalLanglandsForGL2Qp

Section 0.2 supplies the shared carrier `FilteredPhiNModule K` for every complete discretely valued field `K` of characteristic zero with perfect residue field of characteristic `p`, over its Cohen subfield `K₀` with Frobenius `σ`: finite-dimensional `K₀`-spaces with invertible `σ`-semilinear `φ`, nilpotent `N` with `Nφ=pφN` and an exhaustive separated decreasing filtration on `K⊗_(K₀)D`, together with finite Galois descent data for potentially semistable objects. It also supplies the morphisms, the induced and quotient filtrations on `φ,N`-stable subobjects, the Hodge and Newton numbers and weak admissibility, and the tensor, dual, determinant, Tate-twist, exact-category, scalar-change and descent APIs. Its equivalence theorem says that the supplied `D_st` is a fully faithful equivalence from semistable representations onto weakly admissible objects at arbitrary rank; this is the Colmez–Fontaine theorem at perfect-residue base. Layers 3 and 5 use this carrier, its weak admissibility and its equivalence directly; the `N=0` objects form its filtered `φ`-module subcategory. No second carrier is constructed here.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

Sections R07.P2–R07.P5 and R07.3.0 supply the finite-field-of-definition arithmetic comparison interfaces for those period carriers: `aCris`, `bCris`, `bCris_toBDR`, `bCris_frobenius`, `dCris`, `dDeRham`, `IsCrystalline` and `IsDeRham`, with their structure maps and agreement with the supplied invariant functors. Section R07.P3 supplies the additional fundamental sequences, continuous nonequivariant sections and boundary maps. Its map is `1−φ`; replacing it by `φ−1` multiplies the corresponding target and connecting map by `−1`. These interfaces use PadicPeriodRings §§3–4's objects, with no separate period-ring construction. Sections R07.3.15–R07.3.17 supply the Fontaine–Laffaille comparison; SelmerIwasawaCohomology §4.7 uses its finite-residue specialization and is a consumer of this period foundation.

Sections R07.P7.1–R07.P7.3 supply `D_HT`, labelled weights, rational Sen modules and operators, their tensor/dual formulas, Hodge–Tate criteria and the character zero-weight inertia criterion. The Laurent `B_HT` of §0.3 presents that supplied graded algebra. Sections 3.3 and 4.4 extend the supplied Hodge–Tate decomposition and Sen theory to general semilinear `C`-representations. Their scalar-extension comparisons, operators, weights and tensor/dual maps specialize to R07.P7.1–R07.P7.2 on `C⊗V`; the finite-coefficient local character criterion is R07.P7.3. Section 4.4 proves the zero-Sen inertia criterion for arbitrary rational representations. Any perfect-residue extension uses the general-base period and Tate–Sen inputs from PadicPeriodRings §2 on these same carriers.

CrystallineCohomology §CR.4.7 owns higher-rank Dieudonné–Manin classification and perfect-field slope decomposition on Mathlib’s isocrystal carrier; R07.2.15 imports these and owns their integral and group-theoretic consequences. On PadicLocalLanglandsForGL2Qp §0.2's carrier, Section R07.3.3 supplies `crisEigenvector_filtration_bound`, the realization `V_st` on arbitrary objects with its finite-dimensional admissibility criterion, and the contravariant `D*_st`. Section R07.4.13 supplies `semistableFiniteHeight` and Kisin's proof of weakly admissible⇒admissible over the Kummer frame of R07.4.1, which permits arbitrary perfect residue fields; twist an effective object to cover every bounded filtration. That proof is independent of this roadmap’s Robba modifications. Sections R07.3.15–R07.3.17 own the filtered period subring and rational/integral Fontaine–Laffaille realizations. All these objects are used directly.

### From NeronModelsAndSemistableAbelianVarieties

Section 5.3 supplies the abelian `PadicComparison` and `AbelianVariety.deRham`, consuming PadicPeriodRings §§4.1–4.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.0 for the period carriers and their arithmetic comparison. Its `PadicWeilDeligneRealization` transports NoncommutativeAndEquivariantIwasawa §F.6's generic realization to uniformizer-normalized monodromy `N_K=e_K N_p` and identifies the admissible period modules with the filtered-module realization. Where this normalized output enters the abelian comparisons, `absoluteMonodromyAdapter` divides `N_K` by `e_K`, recovering the same `N_p` on the actual period module. Its restriction comparison uses `N_L=e(L/K)N_K`; the absolute operator is unchanged. The Raynaud and abelian comparisons remain inputs to §§8.3 and 9.3.

### From NoncommutativeAndEquivariantIwasawa

Section F.6's generic period-realization prefix supplies `D_pst` and the Weil–Deligne realization directly, for every finite-dimensional potentially semistable E-representation of `G_K`, every finite `K/ℚ_p` and every prime p. It uses the actual `B_st` invariants and their algebraic-unramified direct limit, with native monodromy `N_p=N_absolute`. Its exact tensor/dual maps, coefficient extension and descent, determinant and inertia descent, changes of semistabilizing extension and tower comparisons are inputs. The same prefix supplies nilpotence of `N_p` and filtered de Rham descent along a finite Galois semistabilizing extension. Section 5.3 imports its deRhamWeilDeligne composite, whose domain is identified by the supplier's `deRham_iff_potentiallySemistable`. The generic period prefix assumes potential semistability and uses no differential semistabilization theorem.

Section F.6's stage 3, "Embedded differential lattice and semistabilization", supplies to §5.1 the embedded lattice `N_dR(V)⊂D_rig^†(V)[1/t]` of every de Rham E-representation of `G_K` for finite `K/ℚ_p`, its radius lattices, its characterization at every sufficiently deep cyclotomic localization by `K_n[[t]]⊗_K D_dR(V)`, uniqueness, rank, exactness, tensor/dual compatibility, arbitrary-weight twists, `N_dR(V)[1/t]=D_rig^†(V)[1/t]`, and `deRham_iff_potentiallySemistable` for every finite-dimensional continuous representation, every prime p including 2 and arbitrary Hodge–Tate weights. Its comparison with this roadmap's realization preserves the ambient `D_rig^†(V)[1/t]`, the lattice inclusion, every sufficiently deep localization, connection, Frobenius and cyclotomic action, and the supplier's uniqueness gives the lattice comparison. Section 5.1 keeps the interpolation and localization presentation of the same lattice: Forster's theorem on the annulus, the separating scalars `t_n`, Layer 4's interpolation, density of localized images and `∇_V(N_s)⊆tN_s`, with the crystalline comparison and the converse lattice criterion. Sections 6.3 and 8.1 use the same semistabilization theorem. Section 5.3 adds the completed-unramified constants comparison, coefficient-component adapters and semistable/crystalline criteria; the normalization adapter is the identity on the native output and rescales only the normalized Néron output.

### From PerfectoidSpaces

Sections P1.6, P1.10–P1.11 and P1.16–P1.18 supply integral tilt, sharp, theta and primitive kernel, followed by almost purity and toric perfectoid covers. **AdicEtaleGeometry**, §§A1.10–A1.12 and Layer A2, supplies pro-étale sites, étale localization and smooth charts. **PerfectoidTowers** §P9.0 supplies the canonical continuous-cochain comparison. **ClassicalAdicEtaleCohomology**, §§1.3–1.4, 8.2, 9.5, 9.7 and 11.1, supplies étale/pro-étale comparison, finite-coefficient proper base change, analytification and normalized trace. **RigidAnalyticGeometry**, §§7.4 and 8.4, supplies proper coherent finiteness, closed Čech images and GAGA; **AdicSpacesPartIII**, §§R3.6–R3.7, supplies their adic forms. **AdicSpacesPartII**, Layers R0–R1, supplies the underlying geometric morphisms and analytification. **EnhancedDerivedSheaves**, Layers E1–E2, supplies enhanced tensor, derived images, hypercover descent and replete limits. **DerivedModuleAlgebra**, §§1.1–1.9, supplies module derived completion and limits. **DerivedDeRhamCohomology**, §§1.14–1.22 and 5.23–5.24, supplies filtered derived categories, filtered completion, completed tensors, the valid exchanges of completion and derived operations, proper smooth de Rham perfectness and Hodge quotient descent. **PadicDifferentialEquationsAndRigidCohomology**, Layers RD.0–RD.2 and §§RD.7.7–RD.7.8, supplies the analytic Robba carriers, slope theory, logarithmic local monodromy with radius control and finite-field Frobenius comparison; its ramified application uses this roadmap's dictionary, whose construction uses only its earlier analytic foundations.

### From SchemeAndStackFoundations

SF.0, “Catenary, Cohen–Macaulay, Nagata and excellent rings”, supplies finiteness of normalization for reduced finite-type algebras over the excellent complete DVR `W(κ)`, used in §2.3's algebraic toric models.

### From LocalGaloisDeformationRings

Sections 0.3–0.4 supply `OrdinaryPeriodComparison`, `RankTwoOrdinaryEndpoints`, `CoefficientRobbaModule`, `CoefficientRobbaModule.etaleEquivalence`, `HerrCohomology` and `HerrCohomology.baseChange`. The Robba category is over finite local E-algebras A, including every finite coefficient field `A=E`. Its field specialization includes bounded overconvergence `D^†(V)`, compatible finite-radius models above a common threshold, finite coefficient change, restriction, exact tensor/dual maps and Frobenius generation at the enlarged radius. Its realization comparison with §4.3 preserves these maps and the cyclotomic coefficient identification of §4.1, including integral and bounded subrings and the chart and inductive-limit topologies. The same comparison transports its Herr complex, Ext/Galois comparisons, derived coefficient change and Tate duality. The shared coordinates and arithmetic cup/trace normalization are those displayed in §4.5; Liu’s coordinates use the explicit swap and degree-two minus sign there. Layer 4 constructs the additional integral Cohen-ring descent, connections, integral crystalline-image comparisons and B-pair enhancement; its Wach modules are supplied by PhiGammaModulesAndIwasawaCohomology §6.0. Section 6.4 applies the supplied ordinary endpoints with the chosen lattice, determinant and residual quotient maps.

Section 1.7, including its ordinary flag definitions, supplies `IsOrdinaryOfWeight`, ordered rank-one graded characters, flag uniqueness over fields with distinct inertial characters, restriction with pullback of labels, coefficient change, and the dual/twist and rank-two dictionaries. Section 3.6's `RegularOrdinary` abbreviates this predicate with coefficient algebra `A=E`; its `regularOrdinary_graded, _restrict, _rank_two` are the supplied field specializations. Equality of the prescribed characters is required only on an open subgroup of units, so finite ramified inertia is retained. No integral flag-uniqueness assertion without residual separation is used here.

### From PhiGammaModulesAndIwasawaCohomology

Sections 6.0–6.1 supply the rational `wachModule`, integral `wachLattice`, reconstruction, interval twists and filtered reduction, including finite coefficient and unramified base change. Section 4.4 uses these embedded modules and their maps directly; its additional targets concern the integral image in crystalline periods and Fontaine–Laffaille compatibility.

Sections 1.0b–1.0c, 1.5–1.6 supply the perfect-uniform relative period rings and sheaves, `RelativePhiModule`, chartwise curves, `RelativeBPair`, their exact tensor equivalences and `relativePeriodDerivedComparison`, including the common-radius restrictions and equivariant descent. Sections 7.5–7.6 retain these carriers and maps and identify their classical specializations with Layers 3–4. The global pure-module comparison of §1.5 requires an integral model up to isogeny; the sheaf comparison permits rational local systems without a global lattice. In §§4.4 and 7.5–7.6, `PG` denotes this supplier's namespace.

### From ReductiveGroups

Layer 1 supplies finite-dimensional algebraic representations and comodules, faithful closed embeddings and reconstruction of an affine group scheme from its tensor category of representations. The pinned `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` identifies the group points with tensor automorphisms of scalar extension of the forgetful functor. Section 5.5 uses this identification in its finite-type specialization of the tensor-isomorphism torsor supplied by MotivesAndAlgebraicCycles §6.8.

### From MotivesAndAlgebraicCycles

Sections 6.1–6.3 supply neutral Tannaka reconstruction over any field, without a tensor generator. Section 6.8 supplies the affine faithfully flat tensor-isomorphism torsor for any neutral category and coefficient algebra, its commuting right precomposition and left postcomposition actions, right-to-left action conversion, scalar extension and inverse tensor descent. For a finite-type reconstructed group it supplies finite presentation and identification with SchemeAndStackFoundations §§1.15 and 2.3's common fppf torsor-class carrier. Section 5.5 specializes these maps to `Rep_F(G)` for finite-type affine G and retains their pointwise identity comparison. The composite Galois class and the local Kottwitz and period-torsor comparisons belong to §5.5.

### From PELModuli

Section M0.9 supplies `galoisH1 F G`, the pointed set `H¹_cont(Gal(F^sep/F),G(F^sep))` with discrete coefficient topology, for smooth affine G of finite type over any field F, including disconnected groups. Its `smoothAffineTorsor_galoisH1` identifies SchemeAndStackFoundations §§1.15 and 2.3's common class set `NonabelianH1 (fppfTopology.over (Spec F)) h_G` with `galoisH1 F G`; `galoisH1_equiv_torsorClasses` is the inverse. The comparison preserves the trivial class, field extension and pushforward along group homomorphisms, with the right-torsor cocycle and left-action convention of §5.5. Source: Milne, *Algebraic Groups* (2017), Proposition 3.50, p.80. Section 5.5 composes this supplied comparison with its tensor-isomorphism torsor before applying `localTorsorKottwitz`.

### From AdicSpaces

Sections 6.1–6.4 fix the classical positive Witt Huber pair, rational radius windows, finite closed interval rings and the adic quotient sheaf. Tau Ceti at the pin provides `TauCeti.FarguesFontaine.spaY`, `frobeniusHomeomorph`, `spaX`, `quotientMap` and its open-window quotient topology, in `AlgebraicGeometry.AdicSpace.FarguesFontaine.{Y,Window,Quotient}`. The structure sheaf is an AdicSpaces input. Section 7.5 extends the rings to relative perfect uniform affinoids and adds the scheme-Proj comparison and untilt patching. **ReductiveGroupsPartII**, §RG2.1.5, supplies `KottwitzMap.kottwitz` on the strictly henselian unramified field, its positive valuation normalization, functoriality and sigma equivariance; §RG2.4.3 supplies the averaged cocharacter and its dominance order.

### From ArithmeticGaloisRepresentations

Section 2.4 supplies the arithmetic Weil–Deligne carrier. **ArithmeticGaloisDuality**, Layers R02.1, R02.4 and D7, supplies derived continuous cochains, local trace and normalized Tate duality. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** supplies finite flat/p-divisible groups, Dieudonné comparison, Fontaine–Laffaille objects, Breuil–Kisin lattices and height-one realization of an actual stable lattice, including `(p=2)`, independently of §9.3. Its §R07.3.19 supplies `tameConnectedEtaleRankOne` with precisely the field, coefficient, determinant and residual-fixed-vector hypotheses in §6.4. **AbelianSchemesAndArithmeticModuli**, §§A2.2–A2.3 and A4.3, supplies duality, degree-one de Rham cohomology and its Hodge sequence; §7.3 constructs the filtered period/Gauss–Manin comparison. **NeronModelsAndSemistableAbelianVarieties**, §§3.13–3.14 and 5.1–5.3, supplies Raynaud uniformization and prime-to-p good-reduction and p-adic comparison results. The algebraic p-divisible good-reduction criterion is the target `abelianGoodReduction_iff_pDivisibleExtends` in §9.3. **DiamondsAndVStacks**, §§D6.4–D6.5, supplies associated diamonds and étale-site comparison; §7.4 constructs the pro-étale period-coefficient adapter.

### From AInfCohomology

Sections AI.0.1, AI.0:integral.2, AI.0:period-comparison.1 and AI.3.1 supply cyclotomic periods, integral crystalline coefficients, the rational period maps with finite de Rham quotients, and integral pro-étale period sheaves with their derived/classical comparison. Import AI.3.1’s `AInf.primitive_mod_p_comparison`, vector-bundle change of site, `AInfSheaf.deRhamPeriods`, `AInfSheaf.structuralDeRhamPeriods`, `AInf.completed_structure_first_image` and `AInf.constant_deRham_comparison`. The local formulas in Layers 2 and 7 describe these supplied structures, including the corrected tensor completion and strict Poincaré lemma; their additional relative/coefficient interfaces and the singular-proper extension are targets here. Section 8.1 identifies the coefficient construction with the supplied constant comparison map. Sections AI.5.1 and AI.6.4–AI.6.6 supply the global crystalline/semistable maps, Frobenius, normalized monodromy and de Rham agreements; their multiplicative and trace normalizations fix the top Tate line. Sections AI.2.2–AI.2.3 supply classical BKF lattice pairs and patching; §7.5 adds the relative chartwise extension. **PrismaticCohomology**, §§1.14, 1.21–1.23, supplies crystalline comparison with its Frobenius twist, bounded-prism base change, the de Rham comparison under `W(A/I)` p-torsion-freeness, and proper smooth perfectness. Section 8.2 owns agreement with these specializations. **PerfectoidQuotients**, §§0.0, 0.3 and 0.6, supplies perfectoid Tor independence, bounded Witt torsion and ordinary completed perfectoid operations. PerfectoidSpaces §P4.15.1 and DerivedModuleAlgebra §§1.3–1.8 supply the corresponding derived-completion comparison, with its bounded-torsion hypotheses; PerfectoidSpaces Layer P0 supplies the almost category and its tensor/limit operations. These are the integral inputs to the primitive theorem of §2.7 and the rational comparisons of Layer 8.

## How to read the build

Layers 0 and 1 can proceed independently. Layer 2 uses the supplied local period theory and adds arithmetic, relative and singular-proper interfaces. Layer 3 imports admissibility and adds its weight and descent dictionaries; Layer 4 builds the needed cyclotomic machinery. Layer 6 supplies integral bridges. Layer 7 constructs relative de Rham and period descent; Layer 8 combines this map with integral comparisons. Layer 9 applies the results to Kummer periods and reduction. Each layer ends with examples and its dependencies.

## Layer 0: rational period rings

### 0.1 The completed algebraic closure and Tate–Sen descent

Import `C`, `O_C`, its supplied completeness and perfectoid residue-Frobenius structures, and the continuous isometric `G_K`-action from PadicPeriodRings §§1.1 and 1.5, on Mathlib's carriers. The induced tilt/Witt actions and theta equivariance are that same supplied action. BC Prop. 2.1.1, p.11, §2.1, p.12, and FO §3.1.2, p.43, describe its field construction. The checks below validate the imported convention; no second `galoisActionCp` is defined.

**Checks.**

- The identity fixes all of `C`; restriction back to `K̄` recovers the original automorphism.
- On `μ_(p^n)` the action is exponentiation by `χ` modulo `p^n`, including `p=2`.
- An open subgroup `U` fixes the finite extension `K̄^U`, whereas the union of these fixed fields is `K̄` rather than `C`. The action on `C` is continuous, not discrete.

Prove discrete semilinear descent `L⊗_F D^Gal(L/F)≅D` for finite-dimensional `D` over a possibly infinite Galois extension `L/F`, provided every vector has an open stabilizer. For completed unramified descent use PadicPeriodRings §2, `completedUnramifiedDescent`: for a complete DVR `R` with perfect residue field `k`, `R'=completion(R^un)`, and a finite `R'`-module `M` with continuous semilinear `G_k`-action, `M^G_k` is finite over `R` and `R'⊗_R M^G_k≅M`; inverting a uniformizer gives its rational form. Keep these topologies distinct (BC display (2.4.3), p.20, Lemma 3.2.6, p.36; FO Thm. A.108, p.209).

Import Ax–Sen, almost descent, the cyclotomic normalized traces `R_n` and Tate–Sen cohomology from PadicPeriodRings §§1.1–1.5; use its §2 for the general-perfect-residue and character extensions. Set `K_n=K(μ_(p^n))`. For `m≥n≥n₀` the trace is `R_n|K_m=[K_m:K_n]⁻¹Tr_(K_m/K_n)`; choose `n₀` after the cyclotomic tower stabilizes (`n₀≥2` at `p=2`), so this also equals `p^(n−m)Tr`. Keep the finite torsion subgroup of `Gal(K_∞/K)`, in particular the sign factor when it occurs at `p=2`, rather than identifying the entire group with `ℤ_p`. The supplied projections satisfy `R_nR_m=R_n` for `n≤m` and `R_nx→x` on the completed tower, with uniform valuation loss. The character theorem gives `H⁰` and `H¹` of `C(η)` zero for infinite inertia image and one-dimensional over `K` for finite inertia image, for continuous `η:G_K→O_Kˣ` whose image has p-adic Lie dimension `≤1`. In particular `H⁰(G_K,C)=K` and `H¹(G_K,C)=K·log χ` with nonzero generator, whereas both groups vanish for `C(r)`, `r≠0`. The imported normalized trace is linear, not multiplicative. Locators: FO Props. 3.3, 3.8, 3.11, pp.41–45, A.88–A.97, pp.202–204; BC Thms. 2.2.7, p.15, 14.3.4, pp.253–255. These remain supplier targets, not new Tate–Sen targets here.

**Checks for descent and normalized trace.**

- The zero module descends to zero; for the standard semilinear action on a finite Galois extension `L/F`, the invariant module is `F`, not `L`. The open-stabilizer hypothesis excludes applying discrete descent directly to `C`.
- `R_n(1)=1`, since `Tr_(K_m/K_n)(1)=[K_m:K_n]`. In a stabilized quadratic step the value is `(1/2)·2=1`, whereas the raw trace gives 2. Before stabilization use the actual degree, not a presumed power of p.
- `R_n` fixes `K_n` pointwise. For `n` large enough that successive cyclotomic steps have degree `p`, `R_n(ζ_(p^(n+1)))=0` but `R_n(ζ_(p^(n+1))^p)=ζ_(p^n)≠0`. Thus `R_n` is a linear projection, not a ring homomorphism, also at `p=2`.

### 0.2 Tilt coordinates, the theta ideal and de Rham filtration

Import the tilt carrier, its perfect valuation-ring structure and sharp map from PerfectoidSpaces, §§P1.6, P1.10–P1.11, P1.16–P1.18, and the cyclotomic `ε`, `μ=[ε]−1`, `ξ_ε=μ/φ⁻¹(μ)` from AInfCohomology, §AI.0.1. On that carrier choose `p^♭` with sharp p. Coordinate API: `pFlat, untilt_pFlat, galois_epsilonFlat, val_epsilonFlat_sub_one`: `(p^♭)^♯=p`, `v^♭(p^♭)=1`, `v^♭(ε−1)=p/(p−1)`, `gε=ε^χ(g)` and `g(p^♭)=p^♭ε^c(g)`. Here `c` is the Kummer cocycle. Use Mathlib's `PreTilt`, `PreTilt.val` and `PreTilt.untilt`, and AInfCohomology §AI.0.1's compatible cyclotomic element and change-of-generator maps (BC Lemma 4.3.3 and Example 4.3.4, pp.53–54).

**Checks.**

- `ε^♯=1` although `ε≠1`; prove nonidentity from `v^♭(ε−1)=p/(p−1)`, rather than from its first coordinate, which fails as a test at `p=2`.
- `v^♭(p^♭)=1` with the normalization `v_p(p)=1`.
- The fraction field is the supplied tilt `C^♭`, with the same sharp map.

Apply the supplied primitive-kernel theorem to `ξ=[p^♭]−p`. It differs by a unit from `ξ_ε` and is a nonzerodivisor generating ker `θ`. Extend theta to `θ_Q:A_inf[1/p]→C`; prove equivariance, W(k̄)-linearity, openness, ker `θ_Q=(ξ)`, `A_inf∩(ker θ_Q)^j=(ker θ)^j` and `⋂_j(ker θ_Q)^j=0` (BC Prop. 4.4.3 and Cor. 4.4.5, pp.58–59; FO Prop. 5.12, p.92; BMS Example 3.16, pp.25–26).

On Mathlib's actual `BDeRhamPlus R⁺ p` and `BDeRham R⁺ p`, for a p-torsion-free p-adically complete perfectoid affinoid `R⁺` with `R=R⁺[1/p]`, give the rational coefficient structure, `θ_dR` and `Fil^i=ξ^iB_dR⁺`. Prove independence of `ξ`, functoriality under base-compatible maps, `gr⁰≅R` and `gr^i≅ξ^iR`. Only after choosing a compatible cyclotomic system identify this line with `R(i)`. API: `bdRPlusAffinoid, filAffinoid, grAffinoid, bdRPlusAffinoid_functorial, _eq_bdRPlus_C`: the structures and point specialization on the library carrier (Scholze §6, Lemma 6.3 and Cor. 6.4, pp.35–36).

**Checks.**

- At `(C,O_C)` the carrier and theta agree with Mathlib's BDeRhamPlus.
- `gr⁰=R` via theta, `θ(ξ)=0`, and `θ([x])=x^♯`; a chosen primitive `x` with sharp `p·u` gives that value, not zero.
- At `C`, the quotient `B_dR⁺/ξ²→C` has no continuous `G_K`-equivariant `ℚ_p`-linear section (BC Remark 4.1.4, p.47). Rank-one graded pieces do not split the filtered extension.

At `C` import PadicPeriodRings §§1.5 and 4.1's filtered `G_K`-action on the actual Mathlib completion, its injective `A_inf[1/p]` map, complete DVR with uniformizer `ξ` and residue `C`, and fraction field `B_dR`. Use its residue projection and transport maps directly. Section 0.2's new `bdRPlusAffinoid, filAffinoid, grAffinoid` specialize to those structures; there is no second `thetaDR` or geometric DVR target. BC Def. 4.4.7 and Prop. 4.4.6, pp.60–61, and FO Def. 5.13, p.93, fix the imported convention.

**Checks.**

- `θ_dR([x])=x^♯` and `Fil⁰` is precisely the image of `B_dR⁺`.
- At `O_C` the named carrier is BDeRhamPlus, and `ξ` is a nonzero nonunit, so `B_dR⁺` is not a field.
- The fraction field `B_dR` is not algebraically closed: `ξ` has valuation `1`, whereas the valuation of a square is even, so `X²−ξ` has no root there. The algebraically closed field in the DVR statement is its residue field `C`.
- There is no `G_K`-equivariant ring section `C→B_dR⁺` of theta (BC Remark 4.1.4; FO Exercise 5.18(2)).

### 0.3 Natural topologies and Fontaine's t

Use PadicPeriodRings §§1.5 and 4.1's natural topology: the weak Witt topology on `A_inf` and the inverse limit of the Banach quotients `A_inf[1/p]/ξ^m` on `B_dR⁺`. Use the supplied continuous `G_K`-action, theta quotient topology, closed coefficient fields and embeddings given by multiplication by `ξ`. This topology keeps p-adic coefficients; it differs from the discrete-valuation topology. The relative extension `naturalTopologyBdRPlusAffinoid` is the corresponding inverse-limit topology on §0.2's affinoid carrier, with complete Hausdorff quotients and continuous maps induced by bounded perfectoid morphisms. API: `_quotient, _complete, _theta, _functorial, _point` identifies the quotient topology `R`, completeness, theta continuity, functoriality and specialization. BC Exercise 4.5.3(1)–(6), pp.65–66, and FO Remark 5.14, p.93, give the field model; Scholze Lemma 6.3, pp.35–36, gives the relative finite quotients.

**Checks.**

- The quotient modulo `ξ` has the norm topology of `C`, not its discrete topology.
- `p^n→0` naturally, while it does not converge to zero in the `ξ-adic` topology.
- `ξ^n→0 ξ-adically`, but `[p^♭]^n/p^n` cannot tend to zero naturally: its theta image is 1.
- W(k̄) has its p-adic subspace topology.

Construct the unique `K₀`-algebra lift `K̄→B_dR⁺` of `K̄⊂C` by Hensel lifting separable algebraic elements; it is `G_K`-equivariant. A complete subfield of finite ramification receives its valuation topology and is closed. Finite-dimensional K-subspaces of `B_dR⁺` and `B_dR⁺/t^m` are closed and have their natural vector-space topologies (BC Lemmas 4.4.10, 4.4.12, pp.62–63).

Import `t=log[ε]`, its nonvanishing/uniformizer theorem, `g(t)=χ(g)t`, `φ(t)=pt` and basis-change `t_(ε^a)=at` from PadicPeriodRings §§1.5 and 4.1. The new extension `logTeichmuller` on `{x:x^♯=1}` is additive on multiplication, has `log[x^a]=a` log[x] for `a∈ℤ_p`, specializes to `t` on `ε`, and is functorial under the relative maps. API: `_mul, _zpow, _epsilon, _map`. The canonical lattice `Z_pt` is independent of its cyclotomic basis. BC Prop. 4.4.8, pp.61–62 (including `p=2`), and FO Prop. 5.20, p.94, supply the field logarithm calculation.

**Checks.**

- `t≠0` although `θ([ε])=1`; `t/ξ` is a unit.
- An element with `χ(g)=−1` sends `t` to −t, whereas `H_K` fixes `t`.
- For `a∈ℤ_p^×`, replacing the primitive cyclotomic system `ε` by `ε^a` scales `t` by a and preserves `ℤ_pt`. For `a=p`, the logarithm is still `pt`, but the lattice is the proper sublattice `pℤ_pt`; `a=0` gives zero. At `p=2`, 2 is a nonunit of `ℤ₂` and `ℤ₂·2≠ℤ₂·1` inside `ℚ₂`; multiplication by the nonzero period `t` transports this lattice distinction.

Present the graded algebra `B_HT` supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1 on the existing Laurent polynomial ring after choosing `t`. Its graded pieces are C(i), with multiplication adding degrees and action `g(at^i)=g(a)χ(g)^it^i`. The supplied invariant calculation gives `B_HT^G_K=K`; the Laurent presentation also gives `Frac(B_HT)^G_K=K`. The structure `BHT.single, BHT.laurentEquiv, galoisActionBHT, BHT.invariants_eq, BHT.frac_invariants_eq, BHT.isDomain` records homogeneous generators, the Laurent identification, action and fixed fields. Use PadicPeriodRings §§1.5 and 4.1’s `Fil^iB_dR=t^iB_dR⁺` and graded comparison, identifying its target with the Laurent carrier `B_HT` just specified; import `(B_dR⁺)^G_K=B_dR^G_K=K` from PadicPeriodRings §4.3. For the extra general-perfect-residue specialization use PadicPeriodRings §2’s Tate–Sen theorem in the corresponding completed algebraic closure (BC Def. 2.4.7, p.22, Example 5.1.2, p.66, Thm. 4.4.13, p.64; FO Props. 5.22, 5.24, p.96).

**Checks.**

- Degree zero is `C`, degree one's invariants are zero.
- The graded comparison identifies the class of `t` with the Tate generator, not its dual.
- `B_HT` is not a field: 1+t is not a unit of `C[t,t⁻¹]`.

### 0.4 Crystalline periods and divided Frobenius

Use PadicPeriodRings §§3–4.1's `A_cris`, `B_cris`, Frobenius and field embedding into the supplied de Rham ring; DerivedDeRhamCohomology §§PD.6–PD.7 supplies the general PD-envelope construction and its identification at `O_C`. The genuinely additional coefficient target `acrisAffinoidPresentation` is the following construction on a p-torsion-free p-complete perfectoid `R⁺`, with `A=W(R⁺♭)`, primitive `ξ` and p-torsion-free `A/ξ=R⁺`. It is used in §2.5 and specializes to the supplied field embedding. Write `δ_i=γ^(i+1)(ξ)`, `γ(x)=x^p/p`. The uncompleted envelope has presentation

`A[δ_0,δ_1,…]/(pδ_0−ξ^p, pδ_(i+1)−δ_i^p (i≥0)).`

Its reduction modulo `p` is
`(R^(+♭)/ξ̄^p)[δ_0,δ_1,…]/(δ_i^p (i≥0)).`

The monomials of finite support with exponents `0,…,p−1` form a free basis over `R⁺♭/ξ̄ᵖ`. To prove the presentation, expand `n` in base `p` and express `ξ^[n]` as a unit times `ξ^(n₀)∏δ_i^(n_(i+1))`; the factorial valuation makes the multiplier a p-adic unit. Reduction of exponents uses exactly the displayed relations. At each finite polynomial stage, regularity of `(p,ξ)` proves p-saturation by eliminating the highest variable; induction gives coefficient independence and p-torsion-freeness before completion. The resulting p-completion is `A_cris(R⁺)`. API: `_universal, _mod_p, _basis, _p_torsion_free, _complete, _map` gives the PD universal property, the two presentations, independence, completion and functoriality. Source and proof model: Brinon, Proposition 6.1.1, Cor. 6.1.2 and Prop. 6.1.3, printed pp.62–64; TT Prop. 2.2, Cor. 2.3, pp.5–6. These assertions concern a regular primitive kernel, not arbitrary PD ideals.

**Checks.**

- `1↦1` and `γ₂(ξ)↦ξ²/2`, including `p=2`.
- `θ_dR(j(a))=θ_cris(a)` for all a.
- The image is not contained in `A_inf[1/p]`: `t` has no bounded-denominator Witt expression there. Conversely `1/p` is not in `A_cris`, since reduction modulo `p` is nonzero. These two subrings of `B_dR⁺` are not comparable by inclusion.

For `acrisAffinoid_toBdR_injective`, let `J^[n]` be the p-closed ideal generated by `ξ^[m]`, `m≥n`. The graded step `J^[n]/J^[n+1]` is `R⁺·ξ^[n]` and is p-torsion-free. In each finite de Rham quotient the divided powers have p-adically bounded images, defining `h:A_cris(R⁺)→B_dR⁺(R⁺)`. Inductively `h⁻¹(Fil^n)=J^[n]`: write a class modulo `J^[n]` as `ξ^[n−1]a` with `a∈A`; vanishing of its leading de Rham coefficient means `θ(a)=0`, so `a=ξb`. Here `ξ·ξ^[n−1]=nξ^[n]`. To prove separation without assuming `h` injective, reduce modulo `p` in the preceding basis. Assign weight 1 to `ξ` and `p^(i+1)` to `δ_i`. A finite polynomial has finite weight, so the intersection of all divided-power filtration steps modulo `p` is zero. Each `J^[n]` is p-saturated, by its p-torsion-free successive graded pieces. Thus an element in every `J^[n]` is in `pA_cris`, and its quotient by `p` is still in every `J^[n]`. Iteration and p-separatedness give zero. Therefore `h` is injective. API: `_filtration_preimage, _separated, _strict, _galois, _divided_power` includes the filtration identity and compatibility. This proof uses regularity and completion, not specialization to a field. Brinon Prop. 6.2.1 and proof, printed pp.69–70, gives this filtration argument; §2.5 adds the structural variables.

The auxiliary series target `xiOverPSeriesSeparated` uses `S=A[[T]]/(pT−ξ)`, before any embedding. Raw coefficients are not unique: `pT=ξ`. Multiplication by `pT−ξ` is injective modulo `p^n` (start with `ξ̄` regular and lift through `p`), and preserves p-adic order. Hence its image is p-closed and `S` is p-complete and p-separated. The ideal is also T-closed: solving `(pT−ξ)b=a` modulo `T^m` determines successive coefficients of b uniquely, since `ξ` is regular; compatible solutions give `b∈A[[T]]`. Thus `S` is T-separated. The same recurrence shows `T` is regular; `S/T=A/ξ` is p-torsion-free, so induction makes every `S/T^m` p-torsion-free. Consequently `(T^m):p^n=(T^m)`, and `S[1/p]` is T-separated. Its finite T-quotients identify with `A[1/p]/ξ^m`, by `T↦ξ/p`, giving an injection `S→B_dR⁺`. Finally `ξ^[n]↦(p^n/n!)T^n` extends p-adically from `A_cris` to `S`; its composite is `h`. This proves the separated-series input used by FO Lemma 6.12, pp.119–121, without claiming uniqueness of raw series or using the embedding to prove its own separatedness.

Develop the extra cyclotomic PD expansion of FO Prop. 6.20 and Thm. 6.21, pp.125–126: `S_ε=W(k)[[μ]]`, `Λ_ε` consists of p-adically null series in `t^⦃n⦄=t^rγ_q(t^(p−1)/p)`, `n=r+(p−1)q`, `0≤r<p−1`, and `A_inf⊗̂_(Sε)Λ_ε≅A_cris`. With torsion cyclotomic subgroup `Δ` use `S=W(k)[[π₀]]` and `Λ=Λ_ε^Δ`, `π₀=Tr_Δ μ`; at `p=2`, `π₀=[ε]+[ε]⁻¹−2` and Λ consists of the even-index terms. This invariant coordinate is distinct from the dyadic theta-kernel generator below. API: `acrisCyclotomicPresentation, _delta, _p_two`.

**Checks for the coefficient presentation and separation.**

- At `p=2`, `δ₀=ξ²/2` and `δ₀²=2δ₁`; modulo `2`, `δ₀` is nonzero and `δ₀²=0`. Replacing the PD envelope by `A[ξ/2]` gives the wrong relation and makes `ξ` zero modulo 2.
- `ξ` and `δ₀` have different basis degrees; coefficient independence does not assert that `ξ^[p]` is an ordinary monomial basis over A.
- In `S`, `ξ−pT=0` has two nonzero raw coefficients. Separation is a statement about the quotient, not uniqueness of those coefficients.
- The class of 1 survives modulo `(p,ξ,δ₀,δ₁,…)`; in particular `1/p` cannot lie in `A_cris`.
- `J^[0]=A_cris` and `h⁻¹Fil⁰=A_cris`; the intersection argument concerns all `n`, not just one filtration step.

For `r≥0` prove `I^[r]A_inf={a:∀n≥0,φ^na∈Fil^r}=μ^rA_inf`. For a already in this ideal, a generates it precisely when `v^♭(a mod p)=rp/(p−1)`; the valuation equality alone is not an ideal-membership criterion. At `r=1` record the equivalent Witt-coordinate criterion of FO Prop. 6.18 and Lemma 6.19, p.123. Prove `t∈A_cris`, `t^(p−1)∈pA_cris`, the inherited PD powers on ker `θ_cris` and on `(p, ker θ_cris)`, and `A_cris[1/t]=A_cris[1/t,1/p]` (BC Prop. 9.1.3, p.130; FO Prop. 6.6, p.115).

**Checks.**

- At `r=0` the ideal is `A_inf` and 1 is a generator; `p` belongs to it but does not generate it.
- At `r=1`, `μ` generates the ideal and has reduction valuation `p/(p−1)`, including the value 2 at `p=2`.
- The element `μ+p` has the same reduction and valuation as `μ`, but `θ(μ+p)=p≠0`, so it is not even in `I^[1]`. The membership hypothesis cannot be omitted.

Use PadicPeriodRings §4.1's Witt Frobenius extension to `A_cris` and `B_cris`. The additional relative map is induced functorially by Witt Frobenius on the PD presentation and has `φ([x])=[x^p]`, `φ(t)=pt`, `σ`-semilinearity and Galois commutation; it does not preserve the filtration. API: `acrisAffinoidFrobenius, _teichmuller, _t, _galois`. BC Lemma 9.1.7, p.132, and FO §6.1.1, p.116, give the scalar formula.

**Checks.**

- `φ(1)=1`; on `A_inf` this is WittVector.frobenius.
- `φ(ξ)=[p^♭]^p−p`, so `θφ(ξ)=p^p−p≠0` although `θ(ξ)=0`.
- `φ(t⁻¹)=p⁻¹t⁻¹` after localization; this also fixes the Tate-line Frobenius convention.

`B_cris⁺=A_cris[1/p]` and `B_cris=B_cris⁺[1/t]`, their constant-field structure, action, filtration, embedding and independence of `K` are the supplied PadicPeriodRings §4.1 rings, not new carriers. For the extra affinoid constructions of §2.5 use the same rationalization/localization of `acrisAffinoidPresentation`. BC Def. 9.1.4, p.131, and FO Def. 6.7, p.115, fix the convention.

**Checks.**

- `B_cris^G_ℚp=ℚ_p` and `t⁻¹` belongs to `B_cris` with the preceding Frobenius value.
- The inclusions land in Mathlib's BDeRhamPlus and BDeRham respectively.
- For ramified `K`, invariants distinguish `B_cris` from `B_dR`: `K₀≠K`.
- `ξ` is a nonunit in `B_cris⁺` but a unit in `B_cris`: `t/ξ∈p⁻¹A_cris`, hence `ξ⁻¹=(t/ξ)t⁻¹`. It is incorrect to retain `ξ` as a nonunit after inverting `t`.

Prove continuity of `G_K` on `A_cris` for the p-adic topology (open stabilizers modulo `p^r`). Describe `I^[r]A_cris` as the closed `A_inf`-span of `t^⦃s⦄`, `s≥r`; `A_cris/I^[r]` and `A_inf/I^[r]A_inf` are p-torsion free, their map is injective and its cokernel is killed by `p^m·m!`, where `m` is the largest nonnegative integer with `(p−1)m<r (r>0)`. For `r=0` both quotients are zero (BC Prop. 9.1.2, p.129; FO Props. 6.22–6.23, p.127).

For `r≥0` define `Fil_p^rA_cris={a∈Fil^r:φ(a)∈p^rA_cris}` and prove exactness of `0→ℤ_p·t^⦃r⦄→Fil_p^rA_cris→A_cris→0`, last map `p^(−r)φ−1`. For odd p its closed `A_inf`-module generators are `q'^jγ_n(t^(p−1)/p)`, `j+(p−1)n≥r`, with `q'=φ⁻¹(p+π₀)`. At `p=2` put `ξ₂=1+[ε^(1/2)]` and `T=t/2`. Prove `dividedFrobenius_dyadic_generators`: the closed `A_inf`-span of `ξ₂^jγ_n(T)`, `j+n≥r`, is `Fil_2^rA_cris`. Here `ξ₂` generates `ker θ` on `A_inf`, `θ(ξ₂)=0`, `φ(ξ₂)=2+μ=ξ₂²−2ξ₂+2`, and `φ(ξ₂)/2=1−ξ₂+γ₂(ξ₂)`. Also `φ(T)=2T` and `μ/t` is a unit of `Λ_ε`, so `φ(ξ₂)/2=1+T(μ/t)`.

Use the dyadic family in the integral exactness proof: its elements lie in `Fil_2^r`, and modulo 2 the expansion in divided powers of T makes `2^(−r)φ−1` triangular. At step i, `i≤r`, the term `yξ₂^(r−i)γ_i(T)` has leading coefficient `φ(y)−ξ₂^(r−i)y`; solve this equation in `A_inf`: modulo 2 it is the monic equation `Y²−ξ̄₂^(r−i)Y=b̄` in the algebraically closed tilt, with an integral root, and the same equation lifts each successive Witt digit. Absorb the remaining higher divided-power terms. On the closed span of `γ_n(T)` for `n>r`, the operator `2^(−r)φ` is 2-adically contracting, so the tail is handled by its convergent geometric series. Successive 2-adic lifting gives surjectivity from the closed span. The kernel calculation from `I^[r]` gives `ℤ₂·γ_r(T)`, already in that span; subtracting a preimage then proves the generating assertion for all of `Fil_2^r`. This is FO Prop. 6.24's proof, p.128, with the theta-kernel generator `μ/φ⁻¹(μ)` at 2 in place of `φ⁻¹(2+π₀)`; the primitive-kernel and cyclotomic expansions are FO §§6.1.1 and 6.2.2, pp.114–116, 124–126. Prove the bound `p^m·m!Fil^r⊂Fil_p^r` for `r>0` using the corresponding generators, and handle `r=0` directly. Rationally, prove the analogous exact sequence for `B_cris⁺` when `r≥0` and `B_cris` when `r∈ℤ`. With `B'_cris={x:∀n≥0,φ^nx∈Fil⁰}`, prove `φ(B'_cris)⊂B_cris⁺⊂B'_cris` for `p≠2` and the `φ²` variant for `p=2` (FO Thm. 6.25, p.129).

**Checks for divided Frobenius.**

- At `p=2`, `θ(φ⁻¹(2+π₀))=θ([ε^(1/2)]+[ε^(−1/2)])=−2`, so that element is outside `Fil¹`. In contrast `θ(ξ₂)=1+ζ₂=0` and the displayed Frobenius formula puts `ξ₂` in `Fil_2¹`.
- At `p=2,r=1`, both `ξ₂` and `T` are generators in the family; `γ₂(ξ₂)` also belongs to `Fil_2¹`, since `φ(γ₂(ξ₂))=2(φ(ξ₂)/2)²`.
- At `p=2`, the kernel generator is `γ_r(T)=t^r/(2^r r!)`, including 1 at `r=0`. It cannot be replaced by `t^r` as an integral lattice generator.
- At `r=0` the generator with `j=n=0` is 1; the module is all of `A_cris`. For odd p, the `r=1,j=1,n=0` term uses `θ(q')=0`.

Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3's fundamental period sequences and continuous nonequivariant sections. In `φ−1` notation their target map and boundary acquire the sign −1 from the supplier's `1−φ` convention. The extra integral divided-Frobenius sequences above refine, rather than rebuild, that rational result. The restrictions to `Fil^(−r)`, `r≥0`, and `(Fil^rB_cris)^(φ=p^r)=ℚ_p·t^r`, `r≥1`, follow by twisting the supplied fundamental sequence (FO Thm. 6.26, Remark 6.27, p.130; BC Thm. 9.1.10, p.134). In particular `Fil¹(B_e)=0`.

### 0.5 Maximal periods, logarithms and semistable periods

Define `A_max` as the p-completion of `A_inf[ξ/p]`, `B_max⁺=A_max[1/p]`, `B_max=B_max⁺[1/t]`. For finite `K/K₀` and uniformizer `π`, define the analogous ramified ring from `O_K⊗_(W(k))A_inf` and `([π^♭]−π)/π`. Construct Frobenius on the unramified ring, the maps into `B_dR⁺`, `A_cris→A_max` and `B_max,K⁺≅K⊗_(K₀)B_max⁺`. On ramified coefficients Frobenius is a map to the `σ-base-changed` algebra, unless a compatible coefficient lift is supplied; no Frobenius endomorphism of arbitrary `K` is assumed. API: `Amax, BmaxPlus, bmaxPlusToBdRPlus, acrisToAmax, _comp, bmaxFrobenius, bmaxPlusK_equiv`: compatibility and continuity (Colmez §8.5, pp.61–62, Remark 8.13).

**Checks.**

- `A_inf⊂A_max` and every `(ξ/p)^n` belongs to `A_max`.
- `γ_n(ξ)` maps to `(p^n/n!)(ξ/p)^n`.
- `ξ∈pA_max` but `ξ∉pA_cris`; reduce the latter to the nonzero class of `p^♭` in the PD presentation modulo p.

Prove `K⊗_(K₀)B_max⁺→B_dR⁺` injective (Colmez Prop. 8.14, p.62, using the `θ_v` expansion on p.60). Deduce injectivity `K⊗_(K₀)B_cris→B_dR`, the associated-graded isomorphism onto `B_HT` for the subspace filtration, and injectivity after taking `Frac(B_cris)` (BC Thm. 9.1.5, p.131; Colmez §8.5, p.62).

Construct the additive-valued multiplicative logarithm `logCris` on `(O_C^♭)ˣ`: the convergent `log[x]` series on `1+𝔪` and zero on the canonical k̄ˣ lifts. API: `_mul, frobenius_logCris, logCris_galois, _epsilon, _eq_logDR`: `λ(xy)=λx+λy`, `φλ=pλ`, Galois compatibility, `λ(ε^a)=at` and `λ(y)=log_dR([y]/y^♯)+log(y^♯)` when `y^♯` is algebraic (BC Lemmas 9.2.2, 9.2.7, pp.137,140).

**Checks.**

- `λ(1)=0` and `λ(ε)=t`.
- When `y^♯=1` its image is the de Rham logarithm.
- A Galois-compatible extension with the required de Rham value on `p^♭` cannot take values in `B_cris`: that value is transcendental over `Frac(B_cris)`.

Use PadicPeriodRings §4.1's semistable algebra, action and operators, with the finite-K arithmetic comparison of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.0. Its universal logarithm gives `B_st⁺=B_cris⁺[u]`, `B_st=B_cris[u]` after choosing `u=λ_st(p^♭)`. Use its absolute monodromy `N_absolute=N_p`, so `φ(u)=pu`, `g(u)=u+c(g)t`, `N(u)=−1`, `Nφ=pφN`, ker `N=B_cris` and `N` is onto. The polynomial presentation and identities below are checks of this supplied ring, not a second `Bst` definition. The APIs `absoluteMonodromyAdapter, _restriction, _tensor, _uniformizer` compare NeronModelsAndSemistableAbelianVarieties §5.3's normalized output with this operator by `N_absolute=N_K/e_K`, preserving tensor monodromy and `N(u_π)=−1/e_K` for `u_π=λ_st(π^♭)`. On NoncommutativeAndEquivariantIwasawa §F.6's native output this comparison is the identity. Rational powers in `λ_st(y)=v^♭(y)u+λ(y/(p^♭)^(v^♭y))` use compatible roots. BC Def. 9.2.3, Remark 9.2.5, pp.138–139, and FO Def. 6.15, Props. 6.16–6.17, p.122, describe the logarithm presentation.

**Checks.**

- `N(u)=−1` and `N(u²)=−2u`, whereas `N` is zero on `B_cris`.
- `φ` restricts to crystalline Frobenius, and `N` is minus the polynomial derivative.
- `u∉B_cris` since `N(u)≠0`; BC's monodromy is −N.

For `q∈m_K∖{0}` and `c∈K`, prove there is a unique extension `log_K:K̄ˣ→K̄` of the unit logarithm with `log_K(q)=c`. It is `G_K`-equivariant; replacing `c` by c' adds `v_p(x)(c'−c)/v_p(q)`. Fix `log_K(p)=0` (BC Lemma 9.2.6, pp.139–140). Construct `bstToBdR` sending `u` to `log_dR([p^♭]/p)=Σ_(n≥1)(−1)^(n+1)ξ^n/(np^n)`. API: `_u, _bcris, _galois, _range_independent, _fil`: restriction, equivariance, independence of the image when `log_K(p)∈K₀`, and the induced filtration on `K⊗B_st` (BC §9.2, p.143; FO (6.9), p.119).

**Checks.**

- The image of `u` is `ξ/p` modulo `Fil²`, with a plus sign.
- `1↦1`; `θ(ιu)=0` and `θ(ιa)=θ_cris(a)` for `a∈A_cris`.
- No filtration-preserving Frobenius on `B_dR` extends crystalline Frobenius: `ξ∈Fil¹` but `θφ(ξ)=p^p−p≠0`. This assertion concerns filtration preservation, not arbitrary field endomorphisms.

Prove `log_dR([p^♭]/p)` transcendental over `Frac(B_cris)`, and over `Frac(K⊗B_cris)`, and hence `K⊗B_st→B_dR` injective. Its associated-graded map for the subspace filtration is injective (FO Prop. 6.11, Lemma 6.12 and Thm. 6.14(2), pp.119–121; BC Thm. 9.2.10, p.143). Use PadicPeriodRings §§4.1–4.3 for the finite-K de Rham/crystalline/semistable fixed fields, and §§0.1,0.3 for the new Hodge–Tate realization: `C^G_K=(B_dR⁺)^G_K=B_dR^G_K=B_HT^G_K=Frac(B_HT)^G_K=K`, and `(B_cris⁺)^G_K=B_cris^G_K=Frac(B_cris)^G_K=B_st^G_K=Frac(B_st)^G_K=K₀`. Include restriction to finite extensions and the completed maximal unramified base with its corresponding `K₀` (FO Thm. 6.14(1), p.121, Prop. 6.28(2), p.131; BC Example 5.1.3, p.67).

Compare Fontaine's arithmetic inverse limit of `O_(K̄)/p` with `PreTilt O_C p` using `O_(K̄)/p≅O_C/p`. Identify theta by agreement on Teichmüller lifts and continuity, then identify the completed de Rham and PD crystalline constructions, including filtration, `φ`, `N` and Galois actions. This compares presentations (BC Prop. 4.3.1, p.52, §4.4, p.56, Exercise 9.4.1(1), p.153).

### 0.6 Breuil's completed semistable ring

For finite `K/ℚ_p` choose `π`, `e=e_K` and `W=W(k)`. Put `W_l=W/p^l`. Let `R_l` be the PD envelope of `W_l[z]→O_K/p^l`, `z↦π`, compatible with the canonical PD structure on p. Equivalently take divided powers of `z^e`: the Eisenstein equation differs from `z^e` by a multiple of p. This is Breuil Lemma 2.1, printed p.4, not a Tate-algebra completion.

Here is the finite-level Kato–Tsuji presentation. Define `θ_l:W_l(O_K̄/p)→O_K̄/p^l` by
`θ_l(a_0,…,a_(l-1))=∑_(i=0)^(l-1)p^iâ_i^(p^(l-i))`,
independent of lifts. Let `H_l` be its PD envelope and `P_l=H_l⟨X_l⟩` the **PD polynomial algebra**, with finite sums at this level. For compatible `p^l`-th roots `π_l` of `π`, map `z↦[π̄_l](1+X_l)⁻¹`; on `W_l` coefficients use inverse `Frobenius^l`. The inverse of `1+X_l` exists because its PD ideal is nilpotent elementwise modulo `p^l`. The transition `P_(l+1)→P_l` sends `X_(l+1)` to `X_l` and on Witt coefficients sends `(a₀,…,a_l)` to `(a₀^p,…,a_(l−1)^p)`, extending through the PD envelope. This Frobenius with truncation, rather than truncation alone, is necessary for compatibility with `θ_l`. If `π'_l=ε_lπ_l`, the coordinate change is `X_l↦[ε̄_l]⁻¹(1+X'_l)−1`. These formulas agree with the log-crystalline presentation in Kato §3, (3.2)–(3.3), (3.9), printed pp.277–280, and Breuil §2, printed pp.3–5.

The inverse limit is the p-completed PD polynomial ring `A_cris⟨X⟩^∧`: its elements are sums `∑a_n X^[n]` with `a_n∈A_cris` tending p-adically to zero. Define `B̂_st⁺=(lim P_l)[1/p]` and `𝒦=(lim R_l)[1/p]`, with this coefficient topology. Integral operators, before rescaling, are
`g(X)=[ε(g)](1+X)−1, φ(X)=(1+X)^p-1, N_π(X)=1+X.`
They restrict to the usual action/Frobenius on `A_cris`, with `N_π(A_cris)=0`. PD substitution defines the first two continuously at every finite level; the derivative satisfies `N_π(X^[n])=(1+X)X^[n−1]`, hence preserves p-adically null coefficients. They therefore extend to the inverse limit. On the base `φ(z)=z^p`, `N_π(z)=−z`; `G_K` fixes `z`. Specialization `z↦0` is `φ`-equivariant and fixes `K₀`. In our convention use **`N=−N_π/e`**, on both the base and completed ring, after inverting p. Thus `N(z)=z/e` and `N(X)=−(1+X)/e`; when `p` divides e this is a rational operator. The constant `B_st` inclusion sends `u_π=λ_st(π^♭)` to `log(1+X)`. This logarithm converges in the completed PD algebra because its `X^[n]` coefficient is `(−1)^(n+1)(n−1)!`, which tends p-adically to zero. It has the correct Galois translation and Frobenius `p`; `N(u_π)=−1/e`. Since `e·λ_st(π^♭)=λ_st(p^♭)+λ((π^♭)^e/p^♭)` and the unit logarithm lies in `B_cris`, this gives `N(log[p^♭])=−1`. Kato §2.2, printed pp.272–273, uses positive monodromy on the uniformizer logarithm; that sign, as well as e, must be transported. Breuil §2, printed pp.5–6, gives the integral operators; §4 gives the invariant base. API: `breuilMin, completedBstPlus, _pdPresentation, _transition, _rootChange, _series, _operators, _absoluteMonodromy, breuilMin_specialize` includes precisely these constructions, topologies and formulas.

**Checks.**

- Specialization fixes `K₀`.
- For ramified `K`, `𝒦` is the indicated PD-envelope ring, not `K₀⟨z⟩`.
- `N` kills `K₀`, and tensor monodromy is `N_D⊗1+1⊗N`.
- At `p=2`, `φ(X)=2X+X²` and `N_πφ(X)=2(1+X)²=2φN_π(X)`. Reversing the factor `p` fails.
- For `e=2`, `N(X)=−(1+X)/2` and `N(z)=z/2`; `N(log(1+X))=−1/2`. Using `+N_π/e` gives the wrong sign, and using `−N_π` gives the wrong ramification scale.
- Modulo `p` the PD variable has `X^p=0` but `X^[p]` remains a separate generator. An ordinary polynomial truncation loses this generator.
- A non-null constant sequence `a_n=1` does not define an element of the p-completed PD polynomial algebra; an arbitrary formal power series is too large.

Prove that `B_st⁺` is the union of ker `N^m` inside `B̂_st⁺`, that `B̂_st⁺` is flat over `𝒦`, that `N` is onto, and that its `G_K`-invariants are `𝒦`, while those of `B_st⁺` are `K₀`. For finite-dimensional `D/K₀` with bijective semilinear `φ`, nilpotent `N` and `Nφ=pφN`, prove the monodromy edge map from `(D⊗𝒦)/N` to `H¹(G_K,(D⊗B_st⁺)^(N=0))`, restricted to `φ=p^r` for `r∈ℤ`, factors by specialization through `D/ND`. Both tensor factors use `N_absolute`. To apply the source, replace `N_D` and `N_ring` by −e times those operators, so the completed-ring operator is Breuil’s `N_π`. The total operator scales by `c=−e`; its kernel and cokernel ideals are unchanged. The connecting map satisfies `δ_(cN)(b)=c⁻¹δ_N(b)`, by the short-exact-sequence diagram with identity on the middle term and multiplication by `c` on the last term. Thus the absolute-normalized edge is −e times the source edge; the specialization factorization is preserved. API `completedBstEdge_normalization` records this scalar, rather than identifying the connecting maps without it. The `φ-eigenspace` restriction is essential (Disegni–Liu Lemmas B.13–B.14, Remark B.15 and footnote 40, p.92).

### Examples

For the first two periods, `g(t)=χ(g)t` and `φ(t)=pt`, while `N(u)=−1` and `φ(u)=pu`; therefore `Nφ(u)=−p=pφN(u)`. Modulo `Fil³` the image of `u` is `ξ/p−ξ²/(2p²)`. These two terms fix both the logarithm sign and the monodromy convention, including `p=2` after inverting p. In the associated graded, `t⁻¹` has degree −1 and Galois weight −1. The rank-zero coefficient representation has zero period module; the trivial line has fixed field `K` or `K₀` according to its period ring.

### Dependencies

Mathlib's `C_p`, Witt, theta, completion, localization and Laurent polynomial APIs; PadicPeriodRings §§1.1–1.5 and §2 for Tate–Sen and its general-base/character extension; PadicPeriodRings §§3–4 for the supplied period carriers and invariant functors, and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 for the finite-K comparison interfaces; PerfectoidSpaces, §§P1.6, P1.10–P1.11, P1.16–P1.18, for tilt and primitive kernel; AInfCohomology, §AI.0.1, for the cyclotomic integral specialization; DerivedDeRhamCohomology, §PD.6, for PD envelopes; DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.14–1.22, for filtered-completion infrastructure. None of the rational comparison theorems of Layer 8 is used in this layer.

## Layer 1: Analytic annuli and cyclotomic coefficient rings

### 1.1 Laurent coefficients and their norms

Use PadicDifferentialEquationsAndRigidCohomology §§RD.0.1–RD.0.2’s coefficient algebra `𝒪_K(I)`, for a complete nontrivially nonarchimedean `K` and nonempty interval `I` of positive real radii. Its coefficients satisfy `|a_n|ρ^n→0` along the cofinite filter on `ℤ` at every `ρ∈I`; multiplication is summable Cauchy convolution. Both Laurent tails occur, and no value-group condition is imposed on `I`. Constants and Laurent polynomials embed in this supplied algebra.

Use the supplier’s convergence predicate and Gauss norm directly. Convergence is closed under genuine discrete convolution, and the radius-one specialization identifies with Tau Ceti’s restricted coefficients. At a positive radius of convergence the Gauss supremum bounds every weighted coefficient, is definite and is multiplicative. The real supremum requires bounded weighted coefficients; its norm interpretation uses convergence.

Use the supplier’s dominant indices `n(f,ρ)≤N(f,ρ)`, their additivity under products, the three-circles inequality and compact endpoint maximum. Its power-series specialization agrees with the existing power-series Gauss norm. A centre `e∈K` interprets the variable as `T=z−e`. Sources: Lazard, Prop. 1, pp.49–50; Kedlaya, Def. 3.2.1 and Lemma 3.2.2, p.10; KL, Def. 4.1.2, p.103.

**Checks.**

- `(TT^(-1)=1)`, and every finite Laurent family belongs for every `I`.
- The geometric family supported in nonnegative degrees belongs on ((0,1)), where it inverts (1-T), but fails on `{1}`.
- Constants have norm `|c|`, and `|1+T|_ρ=max(1,ρ)`.
- If `|a|=ρ`, then `|a-T|_ρ=ρ>0` although evaluation at `a` is zero.
- The product `(T-a)(T+a)` has norm `ρ^2` on that circle, including residue characteristic two.
- Power-series restriction agrees with Mathlib's norm.
- Finally `T+T^(−1)` has norm `max(ρ,ρ^(−1))`; this checks convexity without confusing it with monotonicity.

### 1.2 Topology, restriction, evaluation and scalar extension

Use PadicDifferentialEquationsAndRigidCohomology §RD.0.2’s complete Hausdorff Gauss topology, density of Laurent polynomials and compact-window inverse limit. On `[a,b]` its norm is `max(|f|_a,|f|_b)`. Its coefficient restriction maps are injective, continuous and compose identically on coefficients; the Gauss norm is preserved on the restricted radius domain. Surjectivity can fail. The supplier’s Laurent splitting gives the equalizer sequence for overlapping inner and outer intervals, with surjectivity of the difference map when every inner radius lies below an overlap radius and every outer radius lies above one. (Lazard, (2.5)–(2.6), p.51; B02, Lemma 2.18, p.22; KL, Def. 4.1.3, p.104).

Use §RD.0.17 for finite coefficient extension of annulus, Robba, bounded Robba and Amice rings through finite-basis coordinates; integral tensor identifications require the corresponding integral-basis hypothesis. On these supplied carriers, construct `eval, evalAlgHom, norm_eval_le, continuous_eval` for a complete isometric valued extension `L/K`, `e∈K` and `z∈L` with `|z−e|∈I`: sum `a_n(z−e)^n`, prove the Gauss bound, restriction and scalar-extension compatibility and agreement with Laurent-polynomial evaluation. Over a complete algebraically closed extension, prove attainment of the Gauss norm on each nonempty circle with radius in its value group, using reduction of a dominant Laurent polynomial. (Kedlaya, §3.2, p.10; Lazard, §§1–2, pp.48–54).

The additional completed scalar-extension interface is as follows. For arbitrary complete (L/K) and compact `I`, the projective nonarchimedean tensor seminorm gives the isometric identification `L⊗̂_K𝒪_K(I)≃𝒪_L(I)`; prove it first on finite Laurent families, whose weighted coordinate norms are explicit, then complete. For compact `I=[a,b]`, put `w_n=max(a^n,b^n)`. On finite Laurent families the projective tensor norm is exactly `max_n |a_n|w_n`: the monomial presentation gives one inequality and the bounded coefficient projections give the other. Finite Laurent families are dense on both sides, so completion gives the stated isometry. General `I` is recovered by the compact inverse limit. This is a direct coefficient argument using the completed tensor product and Tate algebra conventions of KL, Defs. 2.1.10 and 2.2.15, pp. 27, 33.

**Checks.**

- On ((1/2,2)), `(T^m)` converges coefficientwise to zero but not in the analytic topology.
- Geometric truncations converge on every compact subinterval of ((0,1)).
- A singleton gives precisely its Gauss norm topology.
- Restriction preserves `(T,T^(-1))`, and identity and successive restriction agree; the geometric series on ((0,1)) cannot extend to ((0,2)).
- Evaluation of that series is `(1−z)^(−1)` for `0<|z|<1`, constants evaluate unchanged, and Laurent-polynomial evaluation agrees with the existing API.
- Evaluation at `(z=1)` of this series is unavailable.
- Scalar extension of a finite Laurent polynomial preserves its norm, and the zero element and degree-zero families remain fixed under all the comparison maps.

### 1.3 Zeros, units, differentiation and the Robba limit

Use PadicDifferentialEquationsAndRigidCohomology §§RD.0.18 and RD.0.24 for compact preparation, dominant-index zero counts and units. On a closed `[a,b]`, the unit criterion is `n(f,a)=N(f,b)`: a unique dominant monomial persists through both endpoints. Breaks in log-norm are locally finite, and on a circle the zero count with multiplicity is `N−n`. (Lazard, Props. 2 and 4, pp.53–56; B02, Lemma 4.6, p.41).

Use §RD.0.36’s coefficient derivation `d/dT`, with `(df)_n=(n+1)a_(n+1)`, bound `|df|_ρ≤ρ⁻¹|f|_ρ`, continuity and restriction compatibility. In characteristic zero its kernel is `K`; on an open interval its image consists of series with zero `T⁻¹` coefficient. Dividing by `n+1` preserves convergence by absorbing its subexponential growth on a larger compact window. Closed endpoints in residue characteristic p do not support that image assertion. (Kedlaya, Remark 4.1.3, p.17; B02, Prop. 4.4, p.40).

Use §§RD.0.1–RD.0.2’s Robba union `⋃_(0<r<1)𝒪_K((r,1))`, coefficient maps and LF topology. Fixed-stage convergence implies LF convergence; a converse requires a regularity theorem. The map to formal Laurent series applies only to series with finitely many negative coefficients. (Kedlaya, Def. 3.5.1, p.15; KL, Def. 4.1.3(c), p.104; BI, §IV.2, pp.26–27).

**Checks.**

- On ([|a|,b]) with `(0<|a|<b)`, (T-a) is not a unit because it vanishes at `a`; its indices are `(n(f,|a|)=0)`, `(N(f,|a|)=1)`, `(n(f,b)=N(f,b)=1)`.
- Between breaks the inverse of a dominant monomial times (1+h) is the geometric inverse.
- A monomial has no zeros and `(N-n=0)`.
- Differentiation gives `(d(T^j)=jT^(j-1))`, kills constants, and agrees with polynomial differentiation. `(T^(-1))` has no primitive.
- On the unit circle, `∑_(k≥0)p^kT^(p^k-1)` converges but its formal primitive `∑ T^(p^k)` does not, checking the open-interval hypothesis.
- In the Robba ring (1-T) is invertible and constants embed injectively; the family `(a_(-p^k)=p^k)` is excluded since its weighted terms grow for every `ρ<1`.

### 1.4 Bounded coefficients and cyclotomic operations

Use PadicDifferentialEquationsAndRigidCohomology §§RD.0.1, RD.0.3 and RD.0.26’s Amice ring `E_K`, integral subring, coefficient supremum norm and weak topology. Coefficients are bounded and the negative tail tends to zero; reduction gives `k((T))`. For discretely valued `K`, the integral Amice ring is a complete DVR. Its weak topology is the inverse limit of the T-adic topologies modulo powers of a topologically nilpotent scalar. Within the Robba ring use the supplier’s bounded and integral subrings, their localization and intersection with Amice, and the limiting Gauss norm. These are intersections inside coefficient families. (FO, §4.3.2, p.80; KL, Def. 4.1.3(a), pp.103–104).

Now specialize to `(F=W(k)[1/p])`, `k` perfect of characteristic `p`, with Witt Frobenius `σ` and `|p|=p^(−1)`. Write the coordinate as `π`. API: `CycRing.Aplus, A, B, BrigR, Brig, Bdag, AdagR, BrigPlus`, and `rn` denote respectively `𝒪_F[[π]]`, integral Amice, Amice, `𝒪_F([p^(−1/r),1)`), Robba, bounded Robba, the radius-`r` norm-unit subring, functions on the open disc, and `(r_n=p^(n-1)(p-1))`. `BrigR_mono, Bdag_eq_Brig_inf_B`, and `pi_isUnit_BrigR` give the inclusion and intersection dictionary. The integral Robba ring `A_F^†` is the intersection `A_F∩ B_F^†`; it is **not** the union of the norm-unit rings `AdagR`. (BI, §VI.2, p. 39).

Frobenius substitutes `(1+π)^p-1` and applies `σ` to coefficients. For `(r>(p-1)/p)`, it maps radius `r` into radius `p r`. On the target annulus, `|φ f|_ρ=|f|_(ρ^p)`; both radii must belong to the relevant domains. The map is injective and preserves the integral, bounded, Amice and open-disc rings. API: `phi, _pi, _C, _mapsTo_BrigR, gaussNorm_phi, phi_mapsTo, _injective, continuous_phi, phi_sub_pow_mem`, and `_basis`: reduction to Frobenius on `k((π))` and the basis `(1+π)^i`, `0≤ i<p`, of `A_F` over `φ(A_F)`. Let `q=φ(π)/π`. (FO, Lemma 4.26, p. 83; B08, §I.2, pp. 5–6; KL, Example 4.3.2, p. 111).

For `a∈ℤ_p^×`, the integral binomial series defines `γ_a(π)=(1+π)^a-1=aπ(1+h_a)`, where `h_a∈πℤ_p[[π]]`. Substitution is an isometric automorphism at every radius in `(0,1)`, commutes with Frobenius, and acts continuously on each annular stage. Use `padicBinom, _mem_padicInt, gammaAct, _pi, _C, _one, _mul, gaussNorm_gammaAct, gammaAct_mapsTo, _phi, continuous_gammaAct`, and `galoisAct`; the last action factors through the existing cyclotomic character. For finite (K/F), only the subgroup `Γ_K` acts. (FO, (4.10), p. 80; B08, §I.2, p. 5).

**Checks.**

- In integral Amice, `(1−T^(−1))(−∑_(n≥1)T^n)=1`.
- The family `(a_(-p^k)=p^k)` is integral Amice but not Robba; reduction sends `T` to the Laurent-series variable.
- Constants have their original norm. `(T^(-1))` is integral Robba although its radius norm exceeds one, and `|ϖ^(−1)+T|_1=|ϖ|^(−1)`.
- The coordinate is invertible in annular and Amice rings, but not in the open-disc rings.
- For `(p=3)`, the first cyclotomic slopes are `(1/2,1/6,1/18)`.
- For `(p=2)`, `φ(π)=π^2+2π`, while `q≡ p mod π`.
- Reduction of Frobenius agrees with the existing Laurent-series Frobenius, and `π` is not in its image in `A_F`.
- The identity and constants are preserved.
- Finally `γ_(−1)(π)=−π/(1+π)`, `γ_a(π)≡ aπ mod π^2`, and allowing `(a=p)` would lose invertibility.

### 1.5 The logarithmic coordinate and localization

The element `t=log(1+π)=∑_(n≥1)(−1)^(n-1)π^n/n` belongs to the open-disc ring and every annular Robba stage, but is not bounded. API: `tElt, coeff_tElt, tElt_mem_BrigPlus, _not_mem_Bdag, phi_tElt, gammaAct_tElt, tendsto_tElt`, and `tElt_zeros`: `φ(t)=pt`, `γ_a(t)=at`, and the locally uniform limit of `((1+π)^(p^m)−1)/p^m`. Telescoping gives `t=π∏_(n≥1)φ^(n-1)(q)/p`; the roots are exactly `ζ−1` for `p`-power roots of unity and all are simple. (BI, §§IV.2, V.1.1, pp. 26–27, 34).

The derivation `∂=(1+π)d/dπ` satisfies `∂ t=1`, `∂φ=pφ∂`, and `∂γ_a=aγ_a∂`. On the Robba union its kernel is `F` and its cokernel is the one-dimensional class of `(1+π)/π`. API: `partialOp, partial_pi, _tElt, _phi, _gammaAct, ker_partial`, and `partial_range_sup`: these assertions. The Lie operator `nabla` is `t∂`; `tendsto_nabla` identifies it with `(γ_a f-f)/log_p a` as `a→1`, `a≠1`, for example through `1+p^2ℤ_p`. Thus `invariants_gammaAct` identifies full cyclotomic invariants with `F`. The cokernel assertion concerns the open Robba union, not arbitrary closed-radius rings. (B02, Lemma 4.2 and Prop. 4.4, pp. 39–40).

Choose compatible primitive roots and set `F_n=F(ζ_(p^n))`. For an integer `n≥1`, `0<r≤r_n` and `f∈B_(rig,F)^(†,r)`, define
`θ_n(f)=(σ^(−n)f)(ζ_(p^n)−1), ι_n(f)=∑_(j≥0)(p^(−nj)θ_n(∂^j f))/(j!)t^j∈ F_n[[t]].`
Use `thetaN, iotaN, _ringHom, _pi, _tElt, _phi, _gammaAct, _injective`, and `ker_thetaN`. Taylor expansion gives a `σ^(−n)`-semilinear injective ring map with `π↦ζ_(p^n)exp(t/p^n)−1`, `t↦ t/p^n`, and `ι_(n+1)φ=ι_n`. In comparing these maps, include `F_n[[t]]` in `F_(n+1)[[t]]`. The target action sends `ζ↦ζ^a` and `t↦ at`. Evaluation is onto `F_n`, with kernel generated by `Φ_(p^n)(1+π)=φ^(n-1)(q)`. Every evaluation, kernel and Frobenius/Gamma compatibility statement here has this positive-level and radius domain; the Frobenius identity uses the corresponding source radius for `φ f`. (B08, §I.2, p. 6; B02, Lemma 4.9, p. 42).

Finally adjoin a **polynomial** variable `ℓ=logπ`. API: `LogRing, logPhi, logGamma, monodromyN, _phi, _gamma, ker_monodromyN`, and `logPartial` specify
`φ(ℓ)=pℓ+log(φ(π)/π^p),; γ_a(ℓ)=ℓ+log(γ_a(π)/π),; ∂ℓ=(1+π)/π, Nℓ=−p/(p-1).`
The Frobenius logarithm converges for radius parameter `(r>p-1)`; the Gamma logarithm uses the Iwasawa logarithm on units for its constant term. Here `Nφ=pφ N`, `N` commutes with Gamma and `∂`, and `ker N=B^†_(rig,F)`. This is Berger's normalization from the cited erratum; it differs from `Nℓ=−1`. The Fontaine coordinate `u` of Layer 0 is matched only after the scalar comparison in Layer 4. (B02, §2.6, p. 29; B08, Appendix `B`, p. 27).

**Checks.**

- The coefficient of `π^(p^k)` in `t` has valuation (-k), so boundedness fails although analytic convergence holds.
- Its constant and linear coefficients are 0 and 1; the finite product identity telescopes exactly.
- The formulas for `φ t`, `γ_a t`, `∂π`, `∂(π^(−1))=−(1+π)/π^2`, and `∂ t` test the scalings.
- Constants are killed by `∂`, whereas `(1+π)/π` has no Robba primitive.
- Localization sends `t` to `(t/p^n)`, kills exactly the indicated cyclotomic factor at constant term, and sends `c` to `σ^(−n)c`; the explicit exponential verifies Frobenius compatibility.
- At `n=0`, the proposed value of `π` is zero although `π` is an annular unit, so evaluation is impossible. The radius inequality alone does not exclude this level.
- If `(r>r_n)` at a positive level, the inverse of that cyclotomic factor belongs to the annulus but has a pole at the proposed localization point.
- On the logarithmic variable `Nφ(ℓ)=−p^2/(p-1)=pφ N(ℓ)`, the Gamma corrections obey the cocycle identity, and `N` kills exactly degree-zero polynomials.
- The absence of a primitive proves that adjoining `ℓ` adds an element.

### Examples

The three coefficient families `∑_(n≥0)T^n`, `log(1+T)`, and `∑_(k≥0)p^kT^(−p^k)` distinguish analytic convergence, bounded Robba membership and Amice membership. These distinctions are needed for residues, overconvergent representations and differential equations. The two-term boundary example (T-a) distinguishes a closed annulus from its interior.

### Dependencies

PadicDifferentialEquationsAndRigidCohomology §§RD.0.1–RD.0.3, RD.0.17–RD.0.18, RD.0.24, RD.0.26 and RD.0.36 supply the analytic carriers and theory used through §1.4; evaluation of summable families and completed tensor products give §1.2’s additional interfaces. Witt vectors, cyclotomic roots and the existing cyclotomic character enter only for the specialization to `F`. The relative period sheaves of Layer 2 do not enter the analytic construction.

## Layer 2: Local period sheaves and primitive comparison

### 2.1 The completed structure sheaf on toric covers

Let `ν:X_(proét)→ X_(ét)` be the supplied site projection. The supplier gives the perfectoid basis, `𝒪̂_X^+`, tilt and `A_(inf,X)`. `UncompletedStructureSheaf` is `ν^*𝒪_(X_(ét))`; `CompletedStructureSheaf` is `𝒪̂_X^+[1/p]`. For qcqs `U=lim U_i`, `sections_limit` gives uncompleted sections as the finite-stage direct limit; `_qcqs` gives completed sections by inverting `p` in integral completed sections. API: `valuation, _restrict, topology` for valuations extended through completion. Bounds (1) and `|p|^n` at all points detect integral sections and `(p^n)` divisibility, and give integral closedness. Retain higher-rank continuous adic valuations. (S13, Def. 4.1 and Lemma 4.2, pp. 21–22).

Every point closure in a smooth affinoid over a complete nonarchimedean field has arbitrarily small rational neighbourhoods mapping étale to a torus, through rational embeddings and finite étale maps. Over a perfectoid base, adjoining all compatible `p`-power coordinate roots gives `X̃`. For affinoid perfectoid `Û=Spa(R,R^+)`, `𝒪̂_X(U)=R`, higher cohomology vanishes, and sections on `U× S` are `C^0(S,R)` for profinite `S`. An étale `S_j/R_j` with this factorization pulls back to affinoid perfectoid ring `S_j⊗̂_(R_j)R`. The `p`-completed torsion-free integral tensor injects with bounded `p`-torsion cokernel. Enlarging the stage gives bound `p^ε` for every positive available value-group exponent. On toric charts,
`R̃=R⊗̂_(k⟨ T_i^(±1)⟩) K⟨ T_i^(±1/p^∞)⟩.`
The integral map need not be onto. (S13, Lemmas 4.5, 4.10, 5.2 and 6.18, pp. 23–28, 40).

**Checks.**

- Over a perfectoid field the perfected torus has completed ring `K⟨ T_i^(±1/p^∞)⟩`.
- At an étale finite stage the uncompleted ring and point valuations agree with the usual ones.
- At `Spa(C,𝒪_C)`, completed sections are `C`.
- On the perfected one-dimensional torus the series `∑_(m≥1)p^mT^(1/p^m)` belongs to completed sections and to no finite-stage ring.
- Thus uncompleted and completed sheaves differ.
- The bound-one characterization detects the original integral ring, and rationalization removes the bounded torsion in the tensor comparison.

### 2.2 Horizontal de Rham sheaves

Use AInfCohomology §AI.3.1’s `AInfSheaf.deRhamPeriods`. In its notation `InfinitesimalPeriodSheaf` is `B_(inf)=A_(inf)[1/p]`, as a sheaf localization, and `DeRhamPlusSheaf` is the inverse limit of the sheaf quotients `B_(inf)/(kerθ)^n`. API: `theta, fil, map, algebraMap_fontaine`, and `sections_qcqs`: the quotient map, multiplicative complete kernel filtration, functoriality and its constant Fontaine-algebra structure after geometric base change. Use Layer 0's rings. On an affinoid perfectoid `U` over a characteristic-zero perfectoid base,
`B_dR^+(U)=lim_n W(R^(♭+))[1/p]/ξ^n, Fil^r=ξ^r B_dR^+(U).`
Here `ξ` is primitive, a nonzerodivisor, unique up to a unit. Sectionwise quotients require local almost acyclicity. (S13, Def. 6.1 and Thm. 6.5, pp. 35–36).

`DeRhamSheaf` is the supplied localization at that generator. API: `fil, t_isUnit, sections_affinoidPerfectoid, gr`, and `map`: the exhaustive separated filtration `Fil^r=t^rB_dR^+` locally and functorial maps. A cyclotomic geometric base permits `t=log[ε]`; multiplication of `t` by a unit under descent makes the definition independent of the generator. The graded isomorphisms are
`gr^r B_dR≃ 𝒪̂_X(r) (r∈ℤ),`
with the class of `(t^rf)` mapping to `f⊗ε^(⊗ r)`. Positive de Rham has these pieces only for `r≥0`. (S13, Remark 6.2 and Prop. 6.7, pp. 35, 37).

On the affinoid perfectoid basis, `B_(inf)` is almost acyclic with the Witt almost ideal generated by all Teichmüller roots of a topologically nilpotent tilt element. Its finite kernel quotients, `B_dR^+`, `B_dR`, and all their filtration and graded pieces are rationally acyclic. For the almost annihilator choose a nonzero topologically nilpotent scalar in the tilt of the perfectoid base field. Its untilt is a unit in R, and kernel-adic completeness lifts that inverse to `B_dR^+`. For profinite `S`, sections of these sheaves on `U× S` are continuous maps from `S`, using the natural direct-limit topology for `B_(inf)`, inverse-limit topology for `B_dR^+`, and localization topology for `B_dR`. These topologies on the finite quotients retain their `p`-adic coefficient topology; they are not discrete. (S13, Thm. 6.5 and Cor. 6.6, p. 36).

**Relative Teichmüller units.** On such a chart require `IsUnit (untilt x)`, equivalently `x^♯∈R×`. Then `[x]` is a unit in `B_dR^+(R,R⁺)`. More generally, for a surjective ring map θ with source complete for ker θ, any lift of a unit is a unit: lift an inverse modulo the kernel and invert the resulting element of `1+kerθ`. The Teichmüller specialization uses `θ([x])=x^♯`. Source: S13, proof of Theorem 6.5(iii), p.36; Mathlib `IsAdicComplete.le_jacobson_bot` supplies the complete-ring unit-lifting input.

**Checks.**

- At `Spa(C,𝒪_C)` these rings identify with the existing `BDeRhamPlus` and `BDeRham` and their original maps.
- The map `θ` is onto with kernel `Fil^1`, and the positive ring is its filtration completion.
- Inverting `p` again has no effect, whereas `(t^(-1))` is absent from the positive ring and generates the degree (-1) piece after localization.
- Degree one is `𝒪̂_X(1)`.
- On `(R,R⁺)=(C×C,O_C×O_C)`, `x=(1,0)` has nonzero untilt `(1,0)` but `[x]` is not a unit, since theta preserves units. For a nonzero topologically nilpotent scalar a in `C^♭`, `x=(a,0)` has the same failure; the diagonal scalar `(a,a)` has invertible untilt and its lift is a unit.
- The element `1−ξ/p`, for `ξ=[p^♭]−p`, has nonzero untilt and is invertible in `B_dR^+` but not in `B_(inf)`: its numerator `2p-[p^♭]` is neither a Witt unit nor divisible by p.
- This distinguishes the completion from its input.

### 2.3 Structural de Rham sheaves and the Poincaré lemma

Use AInfCohomology §AI.3.1’s `AInfSheaf.structuralDeRhamPeriods`, including its connection and strict Poincaré lemma. For this subsection `k/ℚ_p` is complete discretely valued with perfect residue field `κ`, and (X/k) is smooth. The following formulas describe that supplied sheaf with the corrected tensor completion. The notation `Ω_X^i` means the pulled-back analytic differential sheaf. On an affinoid perfectoid presentation `U=limSpa(R_i,R_i^+)`, first form
`S_i(U)=((R_i^+⊗̂_(W(κ)) W(R^(♭+)))[1/p])^∧_(kerθ).`
The tensor completion in this formula is `p`-adic. Its sheafification of `colim_i S_i(U)` is `StructuralDeRhamPlusSheaf`. Use `sectionRing, theta, fil, algebraMap_O, _BdR`, and `map` for its section maps, quotient, closed kernel-power filtration, two algebra structures and functoriality. Use Scholze's corrected definition. (Scholze 2016 erratum, item (3), pp. 1–3).

For a toric chart put `u_i=T_i⊗1−1⊗[T_i^♭]`. Then
`𝒪B_dR^+|_(X̃) ≃ B_dR^+|_(X̃)[[u_1,…,u_d]], Fil^r=(ξ,u_1,…,u_d)^r.`
The strengthened erratum proves this on sections: for large finite stage `i`, `S_i(U)` is already this power-series ring, independently of `i`. To construct the inverse, lift the étale finite-type algebraic toric model through the nilpotent kernel quotients, then extend its integral ring map through `p`-adic completion. Such an extension uses a bounded `p`-adically complete subring in each kernel quotient. It does **not** claim continuity from a `p`-adic source to the discrete kernel-adic quotient, which would already fail for `p^n→0`. (S13, Lemmas 6.11–6.12 and Prop. 6.10, pp. 38–39; erratum, pp. 2–3).

API: `PowerSeriesStructure.algebraMap, algebraMap_T, theta_comp, unique`, and `map_etale`: `T_i` to `[T_i^♭]+u_i`. The unique `B_dR^+`-linear continuous derivation extending `d` on `𝒪_X` is `connection`; `_leibniz, _integrable, _griffiths, _unique`, and `_map` give Leibniz, square-zero, filtration degree (-1), uniqueness and étale compatibility. Locally it is `∑_i∂_(u_i)⊗ dT_i`. Coefficient integration over a `ℚ`-algebra, or Euler contraction in positive degree, gives strict exactness
`0→ B_dR^+→𝒪B_dR^+ ─∇→𝒪B_dR^+⊗Ω_X^1→⋯.`
Place `Ω_X^j` in filtration degree `j`. The constant summand retains its filtration; the homotopy preserves total filtration. Degree one gives Faltings's extension
`0→𝒪̂_X(1)→gr^1𝒪B_dR^+ →𝒪̂_X⊗Ω_X^1→0.`
It splits on the toric perfectoid cover, without asserting a canonical arithmetic splitting. (S13, Cors. 6.13–6.14, p. 39, and proof of Thm. 7.2, p. 42).

Inverting `t` gives `StructuralDeRhamSheaf`, with `fil, connection, plus_inter_fil, gr, pushforward`:
`𝒪B_dR=B_dR^+[[u]][1/ξ], gr^r𝒪B_dR=ξ^r𝒪̂_X[u_1/ξ,…,u_d/ξ].`
In positive dimension `Fil^0` strictly contains the positive ring; its intersection with that ring in degree `r≥0` is the original filtration. Poincaré remains strictly exact after localization and on graded pieces. For smooth `f:X→ Y`, the relative horizontal term is
`B_(dR,X)^+⊗̂_(f^(−1)B_(dR,Y)^+) f^(−1)𝒪B_(dR,Y)^+,`
completed for filtration. Integration in relative coordinates gives the strictly exact relative Poincaré complex with forms `Ω^•_(X/Y)`. The uncompleted tensor in the original Prop. 8.5 is insufficient. (S13, Cor. 6.15 and Prop. 8.5, pp. 39, 49; TT, Prop. 5.1(1), p.43, gives the crystalline analogue. The completed de Rham version is the coordinate-integration target here).

**Checks.**

- In dimension zero the two structural rings reduce to their horizontal counterparts and the connection is zero.
- In a toric chart `∇ u_i=dT_i`, `∇ T_i=dT_i`, so the connection is not `𝒪_X`-linear; its horizontal positive ring is exactly `B_dR^+`.
- Inverse coordinate expands as `[T^♭]^(−1)∑_(m≥0)(−u/[T^♭])^m`, and a finite étale `p`-th root expands with binomial coefficients `binom(1/p, m)`.
- Both specialize correctly under `θ`.
- Setting `(u=0)` is not toric Galois equivariant, since `[T^♭]` moves while `T` is fixed.
- The corrected tensor completion makes both compositions of the local power-series isomorphism identities.
- In positive dimension the degree-zero structural graded ring is polynomial, not just `𝒪̂_X`.
- A formal primitive of a non-polynomial series in a base coordinate exhibits why the relative horizontal term needs completion.

### 2.4 Toric descent and geometric versus arithmetic Hodge–Tate cohomology

Assume the perfectoid base contains `μ_(p^∞)`. In `gr^0𝒪B_dR` set
`V_i=cl(t^(−1)log([T_i^♭]/T_i)).`
Then `γ_i(V_j)=V_j+δ_(ij)`; reversing the quotient reverses the sign. Polynomial finite differences and toric coefficient decomposition compute cohomology. For toric `X=Spa(R,R^+)` and a perfectoid completion `K` of an algebraic extension of `k`,
`H⁰(X_K, gr^r 𝒪B_dR) = R⊗̂_k K`, and `H^q(X_K, gr^r 𝒪B_dR) = 0` for `q > 0`,
after trivializing by `(t^r)`. Descend through `Γ_k=Gal(k_∞/k)` with normalized traces on `(k_∞)^∧`. For a trivial `k`-Banach algebra `R`, inclusion `R(i)→ R⊗̂_k(k_∞)^∧(i)` induces a cohomology isomorphism. Only `(i=0)`, `(q=0,1)` survives, with degree-one generator `logχ`. Bounded trace splittings and inverses prove the Banach extension. (BC, Lemma 14.1.9, p. 242; S13, Lemmas 6.17–6.18 and Prop. 6.16, pp. 39–41).

Thus over **arithmetic** `k`,
`H⁰(X, gr⁰ 𝒪B_dR) = R`, `H¹(X, gr⁰ 𝒪B_dR) = R·log χ`, and all other pairs `(i,q)` give zero.
The Poincaré complex gives `ν_*𝒪B_dR=𝒪_(X_(ét))`, `ν_*𝒪̂_X=𝒪_(X_(ét))`, and, for all `j∈ℤ`,
`R^jν_*𝒪̂_X(j) = Ω_X^j`, `R^(j+1)ν_*𝒪̂_X(j) = Ω_X^j·log χ`, with all other direct images zero,
with `Ω^j=0` outside `0≤ j≤dim X`. In particular the boundary map from Faltings's extension identifies `R^1ν_*𝒪̂_X(1)` with `Ω_X^1`. The differential-form index in the degree (j+1) term is `j`. A derived splitting requires an explicit splitting morphism. (S13, Cor. 6.19 and Remark 6.20, p. 41, with the degree index corrected by the toric computation).

Over **geometric** algebraically closed `C`, use AInfCohomology §AI.3.1’s `AInf.completed_structure_first_image`, the natural multiplicative isomorphism
`R^jν_*𝒪̂_X≃Ω_(X/C)^j(−j)`.
It is coherent, compatible with exterior products and pullback, and zero above dimension. There is no arithmetic `logχ` summand on this base. (Scholze survey, Prop. 3.23, pp. 21–22).

**Checks.**

- In one toric variable `V↦ V+1`, so the finite difference of `V` is (1); for two variables the two translations commute.
- Reversing the logarithmic quotient reverses that difference.
- At an arithmetic point, degree-one cohomology of `𝒪̂` has the `logχ` term even though `Ω^1=0`; this rejects the wrong differential-form index.
- At a geometric point positive direct images vanish.
- On a geometric curve only degrees zero and one survive, with the degree-one Tate twist (-1).
- These checks distinguish the two bases and detect a reversed twist.

### 2.5 Crystalline and structural crystalline sheaves

Form `CrystallinePeriodSheaf.Acris` by the `p`-completed PD envelope of `(A_(inf),kerθ)`, compatible with the canonical powers on p. API: `BcrisPlus, Bcris, fil, theta, t`, and `map`: rationalization, localization at `t`, the closed PD filtration, the quotient, cyclotomic element and functorial maps. On a geometric perfectoid basis the uncompleted envelope is `A_(inf)[ξ^([n])]`, `ξ^([n])=ξ^n/n!`; its degree-`r` graded piece is `𝒪̂_X^+ξ^([r])`, and the completed ring is `p`-torsion-free. Writing the filtration means the closed ideal generated by the indicated divided powers, not the subalgebra they generate. (TT, Defs. 2.1, 2.4, Prop. 2.2 and Cor. 2.3, pp. 5–6).

The inverse-limit proof uses the fixed almost ideal `I⊂ A_(cris)(𝒪_C)` generated by `[ε]^(1/p^N)−1` and `[p^♭]^(1/p^N)`. For a `p`-complete, `ℤ_p`-flat module sheaf with a `p`-complete flat candidate section module, an almost isomorphism modulo `p` and almost acyclicity there propagate to all `(p^n)`. The precise estimates are: `I R^1lim F_n(U)=0`; the kernel and cokernel of the section comparison are killed by `I^2`; `I^2R^ilim F_n=0`; and `(I^(2i+1)H^i(U,F)=0)`. Apply the statement separately to every closed filtration step. The integral result is almost. After the `t`-localization used for `B_cris`, sections identify exactly with the explicit affinoid ring and all positive cohomology of the ring and its filtration steps vanishes. (TT, Lemmas 2.6–2.7 and Cor. 2.8, pp. 7–11. No exact `B_cris^+` section formula follows). For the mod-p prerequisite apply §0.4’s `acrisAffinoidPresentation`: `δ_i^p=0` and the finite-support exponents `<p` form a free basis over `R⁺♭/ξ̄ᵖ`. Brinon Cor. 6.1.2, printed p.63, is freely available in the linked memoir. The regular-pair proof in §0.4 supplies coefficient independence before this almost-cohomology argument; almost acyclicity is not used to prove the presentation.

Witt Frobenius extends through the PD envelope and completion, then through `t^(−1)↦ p^(−1)t^(−1)`. API: `frobenius, _teichmuller, _t, _galois`, and `_sections` preserves the constant-field semilinearity and commutes with Galois. It need not preserve the PD filtration. In the smooth formal unramified setting below, the maps `B_cris^+↪ B_dR^+` and `B_cris↪ B_dR` are strict filtered injections, induce graded isomorphisms, and prove absence of `t`-torsion. Extending this assertion to an arbitrary relative affinoid requires a proof of the affinoid injection, not only the construction of a map. (TT, §2.3 and Prop. 2.23, pp. 18–22). For a p-torsion-free p-complete perfectoid `R⁺`, `acrisAffinoid_toBdR_injective` of §0.4 proves the horizontal injection: its inverse-image filtration is `J^[n]`, whose intersection vanishes by the mod-p PD basis and p-saturation. For the smooth formal structural ring, Brinon’s restricted PD-variable expansion identifies the map with `A_cris(R⁺)⟨u₁,…,u_d⟩^∧→B_dR⁺(R⁺)[[u₁,…,u_d]]`. Each coefficient maps by that horizontal injection; coefficientwise uniqueness proves structural injection. The structural expansion is restricted in the p-adic PD sense, rather than all formal series. TT Prop. 2.23 supplies graded strictness in its smooth formal setting; none of this extends structural coefficients to arbitrary singular formal models. Brinon Prop. 6.2.1 and proof, printed pp.69–70, gives the coefficientwise proof.

Let `k=W(κ)[1/p]` be absolutely unramified, `𝔛/𝒪_k` smooth formal, `X` its generic fibre and `w:X_(proét)→𝔛_(ét)`. Put `𝒪_X^(ur+)=w^(−1)𝒪_𝔛`. The `p`-completed PD envelope of `𝒪_X^(ur+)⊗_(𝒪_k)A_(inf)→𝒪̂_X^+` is `StructuralCrystallineSheaf.OAcris`. API: `OBcris, fil, connection, _griffiths, theta, map` for rational/`t`-localizations, filtration, integrable connection and quotient. A small formal toric chart gives the restricted PD polynomial ring `A_(cris){⟨ u_1,…,u_d⟩}`, `u_i=T_i-[T_i^♭]`, `∇ u_i=dT_i`. Filtration closes total PD degree including base filtration. Prove torsion-freeness and strict Poincaré exactness, also rationally. Affinoid section comparisons are almost modulo `(p^n)`; after `t`-localization all filtration steps are exactly acyclic. (TT, Def. 2.9, Prop. 2.13, Lemma 2.14 and Cors. 2.15–2.19, pp. 13–18).

A local Frobenius lift `σ` of `𝔛` induces `frobenius`; `_u, _horizontal, _change_of_lift`, and `_restrict` give
`φ_σ(u_i)=σ(T_i)−[T_i^♭]^p, ∇φ_σ=(φ_σ⊗ dσ)∇,`
and, writing `∇=∑_iN_i⊗ dT_i`,
`φ_(σ_2)=∑_n ∏_i(σ_2(T_i)−σ_1(T_i))^([n_i]) (φ_(σ_1)∘∏_iN_i^(n_i)).`
Prove convergence in the restricted PD topology. The horizontal ring's Frobenius is independent of the lift; the structural ring's is not. Strict injections into structural de Rham preserve connection and graded pieces, and `w_*𝒪B_cris=𝒪_(𝔛_(ét))[1/p]`. (TT, Lemmas 2.21–2.22, Prop. 2.23 and Cors. 2.24–2.26, pp. 19–22).

**Checks.**

- At a geometric point the crystalline sheaf specializes to Layer `0`, including its filtration.
- Its degree-zero quotient is `𝒪̂_X^+` and it has no `p`-torsion.
- The element `ξ^p/p` belongs to the PD envelope but not to `A_(inf)`.
- Frobenius sends `t` to (pt), `(t^(-1))` to `(p^(-1)t^(-1))`, and `θφ(ξ)=p^p-p≠0`, ruling out preservation of `Fil^1`.
- In dimension zero structural crystalline reduces to horizontal crystalline.
- With `σ(T)=T^p`, the binomial expansion gives `φ(u)=(u+[T^♭])^p-[T^♭]^p`.
- Replacing this lift by `(T^p+pT)` adds `pT≠0`, but changes nothing on horizontal sections.
- The formal series `∑_np^(−n)u^n` is de Rham but not rational restricted PD: its divided-power coefficients `(n!/p^n)` have valuations unbounded below, also for `(p=2)`.
- Thus the strict crystalline injection is not an equality.

### 2.6 Semistable polynomial extensions

Over the geometric pro-étale base, extend coefficients from the **constant** semistable ring of Layer 0. This defines `SemistablePeriodSheaf` by `B_cris[u]`, and its positive version by `B_cris^+[u]`. API: `frobenius, monodromy, _frobenius, galois, toDeRham`, and `ker_monodromy` uses
`φ(u)=pu, N=−d/du, g(u)=u+c(g)t,`
where `c` is the Kummer cocycle of the chosen roots of p. Then `Nφ=pφ N`, `N` is Galois equivariant, and `ker N=B_cris`. A logarithm branch gives the map to `B_dR` sending `u` to `log([p^♭]/p)`; filtration is pulled back after scalar extension from `K_0` to `K`. If one instead uses the logarithm `u_π` of a uniformizer, monodromy becomes `−v_p(π)d/du_π`; retain this scaling under coordinate change. Source for the constant ring: BC, Def. 9.2.3 and Thm. 9.2.10, pp. 138, 143.

In the unramified smooth formal setting, `StructuralSemistableSheaf` is `𝒪B_cris[u]`. Its `connection, monodromy, horizontal`, and `toDeRham` extend the preceding structures with `∇ u=0`. Polynomial coefficient comparison proves that horizontal sections are `B_st` and that `N∇=∇ N`. These polynomial extensions are constructions here. The canonical `toDeRham` map substitutes the logarithm in each finite de Rham quotient, then passes to the limit. No injectivity or relative logarithmic-transcendence theorem is claimed for this polynomial sheaf: neither the polynomial construction nor the comparisons in §8.1 require it. Its filtration is the preimage filtration under that map, which does not require an embedding. The injective structural **crystalline** coefficient map in §2.5 is distinct from this substitution map. Only at the constant field do we use the supplied `B_st` embedding. A log-smooth semistable formal model is not being inferred from the existence of this polynomial sheaf; its log-crystalline comparison belongs to Layer 8 and the bundle supplier.

**Checks.**

- On `(u^m)`, `Nφ(u^m)=−mp^mu^(m-1)=pφ N(u^m)`, including `(m=0)`.
- The kernel of `N` consists of degree-zero polynomials in characteristic zero, and `u` is a new element.
- At an arithmetic point evaluated over `C`, both sheaves reduce to the constant `B_st`.
- For `f∈𝒪B_cris`, both `N∇(fu^m)` and `∇ N(fu^m)` equal `−m∇(f)u^(m-1)`; this fixes the minus sign.
- These identities do not require a chosen Frobenius lift, while structural Frobenius does. If `v_p(π)=1/2`, the uniformizer coordinate has `N(u_π)=−1/2`, not −1.

### 2.7 Primitive comparison and integral finiteness

For proper smooth `X/C` and a finite `𝔽_p`-local system `L`, use AInfCohomology §AI.3.1’s `AInf.primitive_mod_p_comparison` and its finite-dimensionality and `[0,2dim X]` bound. Its canonical map is
`H^i_(ét)(X,L)⊗_(𝔽_p)𝒪_C/p → H^i_(proét)(X,ν^*L⊗𝒪̂_X^+/p).`
This is the supplied almost isomorphism, with the same étale/pro-étale and completed mod-p identifications. The supplier’s nested-cover proof uses toric charts, relatively compact rational restrictions and N adjacent Čech spectral sequences; finite-image propagation in degree k requires N≥k+2. These local estimates describe the supplied absolute theorem. The additional relative interface for a proper smooth morphism `f:X→Y` of smooth rigid C-spaces and finite `𝔽_p`-local `L` compares `R^if_(ét,*)L⊗𝒪_Y^+/p` with `R^if_(ét,*)(L⊗𝒪_X^+/p)` almost isomorphically on `Y_(ét)`: construct it from the same scalar-extension map and identify it on geometric stalks by proper base change and the supplied absolute theorem. (S13, Lemmas 5.3–5.8, Thm. 5.1 and Cor. 5.11 in arXiv v2, pp.28–34; Props. 3.15 and 3.17, pp.19–21).

For constant coefficients, use the supplied finiteness and its consequence that `RΓ_(ét)(X,ℤ/p^n)` is perfect of amplitude `[0,2d]`, and its derived inverse limit perfect over `ℤ_p`. Integral cohomology is finitely generated and agrees with the inverse limit of finite-level cohomology; torsion is allowed. The Frobenius argument must show almost freeness in the precise almost category before extracting the finite `𝔽_p`-space, not replace almost finite generation by freeness. (Zavyalov, Lemma 5.5.1, pp. 81–82; Bhatt–Morrow–Scholze, Thm. 5.1, p. 45).

The early period comparison for finite free lisse `ℤ_p`-systems is an almost quasi-isomorphism after derived tensor with `A_(inf)`. Distinguish the classical Witt sheaf from its derived `p`-completed version: their comparison is a supplier contract, and the cone for the latter is killed by `W(𝔪_(C^♭))`. Passing through finite kernel quotients gives the **exact** `B_dR^+`-comparison for lisse systems with finitely generated stalks. Its rational cohomology modules are finite free. (S13, proof of Thm. 8.4, p. 49; Bhatt–Morrow–Scholze, Remark 5.5, Lemma 5.6 and Thm. 5.7, p. 47, and proof of Thm. 13.1, p. 115).

The constant-coefficient primitive theorem extends to a possibly singular proper rigid X/C, dim `X=d`, as follows. First construct `primitiveSNCCompactSupport` in the restricted situation `U=Y∖D`, where `Y` is smooth proper and `D` is a strict normal-crossings divisor. For `D_J=∩_(j∈J)D_j`, the alternating boundary complex
`j_!𝔽_p→𝔽_(p,Y) →⊕_(|J|=1)i_(J,*)𝔽_(p,D_J) →⊕_(|J|=2)i_(J,*)𝔽_(p,D_J)→⋯`
is exact on geometric stalks: on a boundary stalk it is the augmented simplex on the nonempty set of local branches; away from `D` it is the identity augmentation. Tensoring with `O⁺/p` preserves this stalkwise contraction. Closed-immersion projection formula and the smooth proper primitive theorem on each `D_J` compare the finite total complexes. This proves the restricted `j_!` almost comparison and finite `F_p` cohomology, without assuming general compact-support comparison. API: `_boundaryResolution, _projectionFormula, _comparison, _amplitude`. Locators: Scholze survey Lemmas 3.14–3.15, printed pp.17–18.

**Analytic log resolution** (`properRigidLogResolution`). For reduced proper rigid `X/C` and a dense smooth Zariski open `U`, construct a proper morphism `Y→X`, isomorphic over `U`, with `Y` smooth proper and reduced boundary `Y∖U` a strict normal-crossings divisor. Own the characteristic-zero analytic resolution and principalization theorems needed for this assertion: a reduced quasi-compact good analytic space admits a smooth proper modification preserving its smooth locus; on a smooth such space a coherent ideal nonzero on every component has an invertible normal-crossings total transform after finitely many blowups in smooth centres away from its unit locus. For the prescribed `U`, principalize the ideal of its closed complement after resolving `X`. Construct the proper rigid–adic–Berkovich equivalences needed for this transport, with compatibility of coherent ideals, these blowups, properness and local normal-crossings equations. These analytic theorems and their transport are targets here; RigidAnalyticGeometry and AdicSpacesPartIII supply the underlying rigid–adic categories and maps. Sources: Scholze survey, Thm. 3.17 and footnote 3, printed p.19; Bierstone–Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*, situation (0.1)(2), p.208, Theorems 1.6 and 1.10, pp.215–216, and abstract-space gluing in Theorem 13.2, pp.296–298.

**Checks for analytic log resolution.**

- For smooth proper `X` and empty boundary, the identity is a resolution.
- For `X=ℙ¹` and `U=𝔸¹`, the identity has boundary the single smooth point at infinity; an SNC boundary need not be empty.
- For a proper nodal curve and `U` its smooth locus, normalization separates the two branches above a node, giving a smooth proper curve with reduced point boundary. The two preimages must not be identified in the resolved boundary.
- For a nonalgebraizable proper rigid space the same analytic theorem applies; algebraic resolution followed by GAGA supplies no resolution of that input.
- On a smooth proper surface with `U` the complement of one point, the identity has codimension-two boundary and is insufficient; blowing up the point gives a smooth divisorial boundary.

For singular proper `X` choose a dense smooth open `U` and use `properRigidLogResolution` on its reduction to obtain a proper resolution `f:Y→X`, isomorphic over `U`, with `Y` smooth proper and `D=Y∖U` strict normal crossings. Apply the preceding result to `j̃:U→Y`. Proper base change identifies `Rf_*j̃_!` with `j_!` on `X`: fibres on `U` are points, and outside `U` all restrictions of `j̃_!` vanish. The same argument with the closed-immersion/proper projection formulas applies to the `O⁺/p` coefficient complex. Then use the localization triangle for `U⊂X` and induction on the lower-dimensional closed complement `Z`. Nonreduced structure is removed by étale invariance and the almost mod-p coefficient comparison, not by declaring singular charts smooth. The preceding analytic log-resolution theorem supplies this modification. For a boundary stratum indexed by `|J|=a`, its dimension is at most d−a and its degree shift is a, so its upper bound is `2(d−a)+a≤2d`. The proper localization induction preserves this bound. API: `primitiveSingularProper, _resolutionIndependent, _localization, _amplitude` gives the same canonical primitive map, its independence and [0,2d] bound. Scholze survey Lemma 3.16, Thm. 3.17 and proof, printed pp.18–20, gives this argument. Finite mod-p comparison followed by finite-level devissage and derived Nakayama gives the integral perfect complex as above (Zavyalov Lemma 5.5.1, pp.81–82). Individual cohomology groups may have torsion. General compact-support or logarithmic comparison is still downstream.

**Checks.**

- A point admits one chart at every level; the usual two-chart cover of `ℙ^1` requires refinement to achieve all strict inclusions.
- A strictly smaller disc does not cover the original closed disc.
- At a point the primitive map is the scalar-extension identity and all positive degrees vanish.
- Rank-zero systems give zero complexes throughout.
- A torus's nonintegral monomial Koszul summand has the asserted root-of-unity annihilator.
- Degree `k` in the finite-image argument requires at least `k+2` levels; a one-step arbitrary-submodule argument does not suffice.
- Integral perfectness allows torsion and therefore does not imply that each integral cohomology group is free.
- For `Y=P¹` and `D` one point, `H⁰(Y,F_p)→H⁰(D,F_p)` is the identity, so `H_c⁰(A¹,F_p)=0` and `H_c²(A¹,F_p)=F_p(−1)`. Replacing `j_!` by `j_*` fails the degree-zero test.
- Two branches through a boundary point give the stalk complex `F_p→F_p²→F_p`, with maps `a↦(a,a)` and `(a,b)↦a−b`. Their composite is zero and the augmented complex is exact.
- A proper nodal curve still has cohomological upper bound 2. A boundary point contributes with its boundary degree; it cannot increase that bound to 3.
- Replacing the derived-completed Witt sheaf by the classical one requires its comparison map, even though their rational de Rham outputs agree.

### Examples

The perfected torus supplies explicit local coordinates, the two opposite logarithmic quotients give a sign test for toric descent, and a geometric point versus an arithmetic point tests the extra `logχ` class. Proper smooth curves test the primitive bound `2d=2`, rather than the local toric bound `d=1`.

### Dependencies

The pro-étale site, affinoid perfectoid basis, completed integral structure sheaf, tilt, Witt sheaf, almost category and derived/classical comparison are the exact inputs from AInfCohomology, §AI.3.1. AdicEtaleGeometry §§A1.10–A1.12 and Layer A2 and ClassicalAdicEtaleCohomology §§1.3–1.4 supply étale localization and cohomology on the pro-étale site. Layer 0 supplies constant periods, and §1.2 supplies strict tensor and limit tools. The analytic resolution and principalization theorems, with their proper rigid–adic–Berkovich transport, are owned by `properRigidLogResolution` in this layer before the singular-proper induction. The smooth formal crystalline constructions use DerivedDeRhamCohomology §PD.6's PD envelopes and CrystallineCohomology §§CR.1.1–CR.1.3's crystalline sites. Full logarithmic and compact-support comparison belongs to the consumer CohomologyComparisons.

## Layer 3: Period functors, filtrations and admissibility

### 3.1 Regular periods and finite-dimensional descent

Let `F` be a field, `G` a group and `B` a domain with a `G`-action by `F`-algebra automorphisms. Require `(E=B^G)` to be a field. Predicate `IsRegularPeriodRing` says that `Frac(B)^G=E` and that a nonzero element spanning a `G`-stable **`F`-line** is a unit. API: `of_isField, invariants_isField, unit_of_stable_line`, and `character_of_stable_line` give the field case, fixed field and the eigencharacter of such a line. (BC, Def. 5.1.1, p. 66; FO, Def. 2.8, p. 21).

For finite-dimensional `F`-linear `V`, let `D_B(V)=(B⊗_FV)^G`. The natural comparison `B⊗_ED_B(V)→ B⊗_FV` is injective and `dim_ED_B(V)≤dim_FV`. Equality is equivalent to bijectivity, or to a `G`-equivariant `B`-basis of the scalar extension. On these `B`-admissible representations the functor is exact, faithful and tensor, preserves duals, exterior and symmetric powers, and takes the determinant to the determinant. Subobjects and quotients of an admissible object are admissible. First prove linear independence of fixed vectors using regularity, then compare dimensions in exact sequences and tensors; it does not assume invariants are generally right exact. (BC, Thm. 5.2.1, pp. 68–70; FO, Thm. 2.13, p. 22).

For finite `K/ℚ_p`, import regularity and the fixed-field/dimension statements for `B_dR,B_cris` from PadicPeriodRings §4.3 and for `B_st` from NeronModelsAndSemistableAbelianVarieties §5.3; their fixed fields are `(K,K_0,K_0)`. Apply the abstract theorem to §0.3’s new Laurent realization of `B_HT`, whose fixed field is `K` by Tate–Sen. The new abstract `IsRegularPeriodRing` theorem above applies to arbitrary F,G,B satisfying its hypotheses; it does not redefine those four finite-K dimension results. The crystalline and semistable cases require the stable-line unit theorem. Put `P₀=W(k̄)[1/p]`, the completed maximal unramified constants, and let P be its algebraic closure inside C, embedded in `B_dR⁺` by its unique Henselian lift. A nonzero de Rham period spanning a `G_K`-stable `ℚ_p`-line lies in `P×t^i` for some integer i; its scalar is algebraic over P₀. If that period lies in `B_st`, it lies in `P₀×t^i` and is a crystalline unit. (FO, Prop. 6.28, p. 131; BC, Example 5.1.2 and Prop. 9.1.6, pp. 66, 131).

**Checks.**

- A field with such an action is regular.
- `B_dR^+` fails because `t` spans a stable line but is not a unit. `F[X]` with trivial action fails the fixed-field requirement, while `F(X)` passes.
- The zero representation has zero invariants and a bijective comparison between zero modules; the unit has fixed space `E`.
- For `K=ℚ₃`, let η be unramified with arithmetic Frobenius value 4. There is `b∈W(F̄₃)×` with `g(b)=η(g)b`; the weight-zero crystalline line has period `b⁻¹e`. The infinite orbit of b excludes algebraicity over `ℚ₃`, but b belongs to P₀.
- Thus regularity is a property of the actual period ring, not a property attached to arbitrary representation data.

### 3.2 Filtered spaces and the sign dictionary

Use the filtered linear algebra of PadicLocalLanglandsForGL2Qp §0.2's carrier: the filtration on `K⊗_(K₀)D`, its strict morphisms, dual/tensor/twist and Hodge number. In particular `Fil^i(D∨)=(Fil^(1−i)D)⊥`, `Fil^i(D[n])=Fil^(i+n)D` and `t_H=∑i·dim gr^i`. These are supplier definitions, not new `FilteredSpace` or `hodgeNumber` targets.

The extra filtered API `filteredBijective_hodgeInequality` says that a bijective filtered map has `t_H(source)≤t_H(target)`, with equality iff strict; prove it by cumulative graded dimensions. `filteredIso_iff_gr` detects a strict isomorphism on all graded steps. `hodgeWeight` is `t_H/rank` only for nonzero objects; its `_dual, _tensor` give dual sign and addition under tensor. A strict short exact sequence is exact at each filtration step; a merely bijective filtered map need not be strict. The full filtered category is not abelian. BC §6.2 and Def. 6.2.5, pp.74–75, Def. 8.1.1 and Prop. 8.1.2, pp.102–103, and FO Def. 6.44, Prop. 6.45, p.137, give these linear-algebra arguments.

Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.2’s labelled weights and tensor/dual/Sen formulas, with `HT(χ_p)=+1`. The notation `filtrationMultiplicity, hodgeTateMultiplicity, hodgeTateWeights` refers to that supplied data. The additional sign adapters `_eq_BC` and `_eq_filtrationJumps_neg` compare the source conventions: de Rham weight `h` counts `gr^(−h)`, twists add, duals negate, tensor weights pairwise add and determinants sum. Layer 4’s semilinear extension agrees with the supplied rational Sen equality. BC's covariant graded-degree sign is opposite; its contravariant de Rham convention agrees. Contravariant Fontaine–Laffaille takes jump `i` to weight `i`, while `V_(cris)` takes it to `−i`. Khare–Wintenberger weight `k` means `{0,k-1}`. For coefficients `E`, use labelled `K⊗ E` components, never divide an unlabelled multiplicity by `[E:ℚ_p]`. (BC, §§2.4, 6.3, pp. 17, 76; B02, §3.2, p. 31; KW1, §4, p. 7).

**Checks.**

- Unit filtration is self-dual; the `1−i` in the formula is necessary.
- A two-dimensional space with jumps `(0,1)` has graded dimensions `(1,1)` and `t_H=1`.
- The identity from a line of jump `0` to a line of jump (1) is bijective and filtered but not a filtered isomorphism.
- The zero space has `t_H=0`, but has no defined average weight.
- To test failure of monotonicity on subobjects, use jumps `−2,1`: the whole space has `t_H=−1`, while its jump-one line has `t_H=1`.
- For `ℚ_p(1)` the period basis `t^(−1)e_1` has jump `−1`, weight `+1`, and dual jump `+1`; these explicit lines fix all three sign conventions.

### 3.3 Fontaine's functors and Hodge–Tate descent

Use PadicPeriodRings §§4.1–4.3's `D_dR,D_cris,D_st` and rational admissibility predicates, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P5 and R07.3.0's finite-K comparison interfaces, and NoncommutativeAndEquivariantIwasawa §F.6's generic potentially semistable realization API. Names here always denote those supplied functors. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3’s Hodge–Tate functor, denoted `DHT`; the Laurent presentation of `B_HT` in §0.3 identifies its graded fixed spaces with the supplied ones. On weakly admissible objects the inverse realization is the quasi-inverse of PadicLocalLanglandsForGL2Qp §0.2's `D_st` equivalence; on an arbitrary object of that carrier it is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3’s realization given by the same formula, with its `N=0` crystalline specialization:
`V_(cris)(D)=Fil^0(B_cris⊗_(K_0)D)^(φ=1), V_(st)(D)=Fil^0(B_st⊗_(K_0)D)^(φ=1,N=0).`
Their filtration is pulled back after de Rham extension. The names Vcris and Vst below denote those supplied constructions; the perfect-residue scope is already that of the supplier. No second inverse functor is planned. The additional duality adapter `periodHom_eq_covariantDual` identifies `Hom_(ℚ_p[G_K])(V,B)` with `D_B(V∨)`. BC §6.1, Example 6.3.1, pp.73,76, FO Defs. 6.29,6.52, pp.131,140, fix these expressions. In particular crystalline⇒de Rham and full-dimension criteria are imported, not redefined.

For a semilinear `C`-representation `W`, write `W{q}=W(q)^(G_K)`. Serre–Tate gives an injective comparison
`⊕_q C(−q)⊗_KW{q}→ W`, so only finitely many weights occur and their dimensions sum to at most the rank. Equality characterizes Hodge–Tate representations. For a continuous character `ψ:G_K→𝒪_K^×` whose image has p-adic Lie dimension at most one, Tate’s character theorem says `C(ψ)≃C` exactly when its inertia image is finite; with infinite inertia its `H⁰` and `H¹` vanish. General coefficient-valued characters use the supplied labelled weights of §3.6. Finite inertia representations become sums of `C`'s. Hodge–Tate semilinear representations are equivalent to finite graded `K`-spaces by this decomposition, compatibly with tensors and duals. Exactness holds for a short exact sequence whose **middle object** is Hodge–Tate, not for every extension of Hodge–Tate objects. (BC, Lemma 2.3.1, Thm. 2.2.7, Thm. 2.4.11, pp. 15–16, 23; FO, Prop. 3.53, p. 63).

Finite extension and completed maximal unramified extension commute with the Hodge–Tate fixed-space construction and detect the Hodge–Tate property. For de Rham functors they commute with the entire filtration. A de Rham representation is Hodge–Tate with `grD_(dR)≃ D_(HT)`; its comparison is strictly filtered. The de Rham functor is exact on de Rham objects and preserves tensors, duals and determinants with their filtrations. Finite induction from `F'` to `F` carries de Rham periods to restriction of scalars of `D_(dR,F')`; the crystalline and semistable analogues require `F'/F` unramified. (BC, Thm. 2.4.6, Props. 6.3.2–6.3.3, 6.3.8 and the discussion before Prop. 9.3.1, pp. 20, 76–80, 146).

For a **`ℚ_p`-valued** character, Hodge–Tate and de Rham are equivalent to `χ^iη_0` with `i∈ℤ` and `η_0` finite on inertia. Finite inertia representations are de Rham of weight zero. Characters valued in a larger coefficient field can have different labelled weights and are treated in §3.6; they are not all one cyclotomic power. An extension of de Rham `V''` by de Rham `V'` is de Rham if every weight of `V'` is strictly larger than every weight of `V''`. (BC, Examples 6.3.6, 6.3.9, pp. 78–81; FO, Props. 7.18–7.19, p. 156).

**Checks.**

- Unit has `D_(dR)=K`, jump zero, and `D_(cris)=K_0`, the existing slope-zero isocrystal.
- For each integer `n`, `ℚ_p(n)` is crystalline with period `t^(−n)e_n`, Frobenius `p^(−n)σ`, and jump `−n`.
- If `K/K_0` is ramified the two fixed fields remain different even on the unit.
- For odd `p`, `⟨χ⟩^s`, `s∈ℤ_p∖ℤ`, has no Hodge–Tate periods; continuity alone is insufficient.
- A nontrivial semilinear extension of `C` by `C` given by `logχ` is not Hodge–Tate.
- For unramified quadratic `K/ℚ_p`, the nonidentity conjugate of a Lubin–Tate character has infinite inertia and identity-labelled weight zero, so its semilinear C-line is trivial. Its image has Lie dimension two, outside Tate’s one-dimensional character criterion.
- Extensions of `ℚ_p` by `ℚ_p(r)`, `r≥1`, satisfy the separated-weight de Rham criterion, including the Tate-curve extension.

### 3.4 Filtered Frobenius and monodromy modules

Use PadicLocalLanglandsForGL2Qp §0.2's carrier `FilteredPhiNModule K`, whose underlying `(D,φ)` is an object of Mathlib's `WittVector.Isocrystal` over the Cohen subfield, its `N=0` subcategory, morphisms, subquotients, tensor/dual/determinant and weak-admissibility predicate. In this roadmap's convention `Nφ=pφN`, tensor `N` is `N⊗1+1⊗N`, dual `N=−Nᵗ`, and the covariant twist sends `φ` to `p^(−i)φ` and `Fil^r` to `Fil^(r+i)`. The supplier's Hodge/Newton numbers use `v_p(p)=1`. A bijective map is an isomorphism precisely when it is strict. No second filtered-module or weak-admissibility carrier is constructed. BC Def. 8.2.5, pp.112–113, FO Def. 6.36, p.134, give the common convention.

Use CrystallineCohomology §CR.4.7’s higher-rank slope decomposition and the nilpotence of monodromy built into PadicLocalLanglandsForGL2Qp §0.2's carrier: `N` sends slope `a` into slope `a-1`, and only finitely many slopes occur. The supplied Newton polygon lists those slopes with multiplicities. These are imported theorems on the supplied carrier. (BC, Thm. 8.1.4, Lemmas 8.1.11, 8.2.8, pp. 104, `107`, 113).

Use the supplied Newton number `t_N=v_p(det φ)`, its basis independence, strict exact additivity, rank-weighted tensor, dual and twist identities. The extra API `newton_eq_sum_slopes` identifies it with the imported higher-rank slope sum; eigenvalues of a semilinear matrix need not compute those slopes. A basis change multiplies det `φ` by `σ(det A)`/det A, of valuation zero. FO Def. 6.40, Prop. 6.41, pp.135–136, BC Example 8.1.3, p.104.

The supplied weak-admissibility predicate requires `t_H=t_N` and `t_H(D')≤t_N(D')` for every `φ,N`-stable subspace with induced filtration. Import its invariance under completed unramified base change from PadicLocalLanglandsForGL2Qp §0.2's scalar-change API. New APIs `weaklyAdmissible_iff_quotients, filteredHN` give the reversed quotient inequalities and the finite-rank Harder–Narasimhan filtration in this exact filtered category. The filtered degree is `t_N−t_H`: subobjects of a weakly admissible object have degree `≥0`. For nonzero objects use destabilizing slope `(t_H−t_N)/rank`. The finite Newton slope multiset bounds the Newton numbers of stable subobjects; the finite range of filtration jumps bounds their Hodge numbers. Thus the possible slopes at ranks `≤rank D` form a finite set. For stable subspaces A,B with ambient induced filtrations, prove `filteredHodge_supermodular`: `t_H(A)+t_H(B)≤t_H(A∩B)+t_H(A+B)`. The strict sequence for intersection and the quotient filtration on the sum gives additivity there; the bijective filtered map from that quotient to the ambient induced filtration on `A+B` gives the inequality by §3.2’s `filteredBijective_hodgeInequality`. Newton numbers and ranks are additive on intersection and sum. Therefore the destabilizing degree `t_H−t_N` is supermodular. Two maximal-slope subobjects have a sum of the same slope, so a maximal-slope subobject of maximal rank is unique; induction on its quotient gives HN. The zero object has the empty filtration. Its later curve realization reverses the filtered degree sign and is not an input. BC Def. 8.2.9, p.114; FO Def. 6.48, p.138; Colmez–Nizioł §§5.1.1–5.1.3, pp.31–33.

Import from PadicLocalLanglandsForGL2Qp §0.2's exact-category API the two-out-of-three property for **strict** short exact sequences, strictness of morphisms between weakly admissible objects, and weak admissibility of their kernels, images and cokernels. The supplied category of weakly admissible objects is abelian and artinian; it is also the essential image of §0.2's `D_st` equivalence. A nonzero object is simple exactly when every proper nonzero stable subspace has strict Hodge–Newton inequality. (BC, Prop. 8.2.10 and Thm. 8.2.11, pp. 114–115).

**Checks.**

- Unit has `t_H=t_N=0`, and its twist has both numbers `−n`.
- A rank-one module with `φ e=λ e` and jump `r` is weakly admissible precisely when `v_p(λ)=r`; nilpotence forces `(N=0)`.
- For basis `e,f`, `φ e=e`, `φ f=pf`, `Nf=e`, the relation on `f` reads `p e=p e`, whereas `φ N=pNφ` would give `e=p^2e`.
- On its tensor square, the sum monodromy obeys the same relation; dual monodromy needs the minus sign.
- With `(N=0)` and filtration jumps `(0,1)`, placing `Fil^1` on `e` fails the subobject inequality, while placing it on `e+f` passes.
- The zero object has the empty `filteredHN` filtration.
- For `D=ℚ_p e⊕ℚ_p f`, `φ=diag(1,p)`, `N=0`, `Fil⁰=D` and `Fil¹=0`, `filteredHN` is `0⊂ℚ_p e⊂D`, with successive destabilizing slopes `0,−1`.
- For the same `φ,N`, with `Fil⁰=D`, `Fil¹=ℚ_p(e+f)` and `Fil²=0`, each stable eigenline has Hodge number zero and the total Hodge and Newton numbers are both one. Thus `D` is weakly admissible and `filteredHN` is the single slope-zero step `0⊂D`. For the eigenlines A,B, `t_H(A)+t_H(B)=0<1=t_H(A∩B)+t_H(A+B)`; their sum map is bijective filtered but not strict.
- With jumps `−1,2` and `Fil^0=Kf`, nonzero `Nf=e` passes but `(N=0)` fails because the line `Kf` becomes a subobject of Hodge number `2` and Newton number (1).
- Katz's matrix over `W(𝔽_9)[1/3]`, `[[2, 4i], [4i, −2]]`, has determinant `12`, Newton number `1`, and slopes `(0,1)`, although its eigenvalue valuations are both `1/2`.
- These tests distinguish total degree, slopes and actual subobjects.
- For perfect `k` the embedding `W(k)[1/p]→K` is unique, so §0.2's Cohen subfield is Mathlib's `K(p,k)` and the underlying `(D,φ)` of every object is a finite-dimensional `WittVector.Isocrystal`. Mathlib's `StandardOneDimIsocrystal p k m` is the rank-one object with `φ=p^mσ`: its Newton number is `m`, and with its filtration jump at `m` it is weakly admissible, while the jump at `m+1` fails `t_H=t_N`.

### 3.5 Crystalline and semistable classification

Import from PadicLocalLanglandsForGL2Qp §0.2 admissible⇒weakly admissible and full faithfulness of `D_st`, with its tensor/dual compatibility and induced/quotient-filtration statements, together with NeronModelsAndSemistableAbelianVarieties §5.3's semistable⇒de Rham and crystalline⇔semistable with `N=0`. The crystalline/de Rham invariant functors are supplied by PadicPeriodRings §§4.2–4.3. The supplied inverse realization of §3.3 recovers representations on its essential image. BC Thm. 9.1.8, Props. 9.1.9,9.1.11, pp.133–135, Lemma 9.2.13, Prop. 9.2.14, pp.145–146, describe the finite-K input. Essential surjectivity over general perfect residue is the Colmez–Fontaine part of §0.2's equivalence, imported in §5.5.

Completed maximal unramified and finite unramified base change commute with periods and detect admissibility. Ramified extension preserves crystalline/semistable objects but need not detect them. For finite Galois (L/K), `Gal(L/K)`-invariants recover downstairs periods; scalar comparison injects. Unramified representations correspond to unit-root modules with trivial filtration, equivalently a Frobenius-bijective integral lattice. A rank-one `λ∈ W(k)^×`, modulo `σ(c)/c`, gives the inverse unramified character. Algebraically closed residue gives a fixed basis via surjectivity of `w↦σ(w)/w`. For finite-inertia representations, semistable, crystalline and unramified are equivalent. Rational characters are crystalline exactly when `χ^i` times unramified. (BC, Example 8.3.2, Lemmas 8.3.3, 9.3.3, Prop. 8.3.4, Prop. 9.3.1 and Cor. 9.3.2, pp. 117–118, 146–147; FO, Prop. 7.14, p. 153).

For descent data, `FilteredPhiNGaloisModule` abbreviates PadicLocalLanglandsForGL2Qp §0.2's carrier with finite Galois descent data: an `L_0`-space with a semilinear `Gal(L/K)`-action commuting with `φ,N`, and stable filtration on `D_L`. Weak admissibility and subobjects are §0.2's. This roadmap's adapters `filK, ofFilteredPhiN, restrict, DstL`, and `_dR` descend that filtration to `(D_L)^(Gal(L/K))`, restrict the action and identify descended de Rham periods: `filK(D)=(L⊗_(L_0)D)^(Gal(L/K))` with `Fil^i` the invariants of `Fil^i D_L`; `ofFilteredPhiN(D₀)=L_0⊗_(K_0)D₀` with `Gal(L/K)` acting on the first factor; `restrict` keeps the action of `Gal(L/L')` for `K⊆L'⊆L`; `DstL(V)=(B_st⊗_(ℚ_p)V)^(G_L)` with the residual `Gal(L/K)`-action; and `DstL_dR` gives `filK(DstL(V))=D_dR(V)` as filtered `K`-spaces. Subobjects for this version also respect descent. Finite coefficient extension commutes with all period functors; for an admissible `E`-representation the fixed spaces are free of the original rank over `K⊗ E` or `K_0⊗ E`. Choose an isomorphism of the algebraic closures extending the isometric base-field isomorphism `K≃K′`. It extends uniquely and isometrically to `C≃C′`. Transport the representation, compatible root systems and logarithm branch along that choice, and then the periods, actions and filtrations. Transport commutes with identity and composition of chosen closure isomorphisms. Different choices differ by the corresponding Galois conjugation, which gives the change-of-choice comparison on periods and filtrations. (FO, Def. 6.61 and §7.2.8, pp. 143, 158; BC, Exercise 6.4.3 and discussion after Thm. 4.4.13, pp. 64, 82–83).

Import FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3’s finite-dimensional criterion, on §0.2's carrier, along with §0.2's admissible⇒weakly admissible: for weakly admissible `D`, `V_(st)(D)` is a continuous semistable representation of dimension at most `dim D`, and `D_(st)(V_(st)(D))` is a weakly admissible subobject. Equality of dimensions is equivalent to admissibility; for a simple object it suffices that the realization is nonzero. Finite-dimensional stable subspaces of a finite direct sum of `B_st`'s are continuous for their natural rational topology. In rank one the realization has dimension 1 if `t_H=t_N`, dimension zero if `t_H<t_N`, and infinite rational dimension if `t_H>t_N`. (BC, Thm. 9.3.4 and Props. 9.3.6, 9.3.9, Lemma 9.3.7, pp. 147–151).

Use the Colmez–Fontaine theorem in PadicLocalLanglandsForGL2Qp §0.2's equivalence. Its base is any complete discretely valued `K` of characteristic zero with perfect residue field, so it includes finite extensions of `ℚ̆_p`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13's `semistableFiniteHeight` over the Kummer frame of R07.4.1 is Kisin's proof of the same equivalence. The new adapter `colmezFontainePst` transports this equivalence to finite Galois descent data: full faithfulness lifts the finite semilinear descent action uniquely, its cocycle follows by faithfulness, and finite Galois descent recovers the representation over `K`. The dimension/simple/rank-one tests are the imported R07.3.3 criterion, rather than a new proof of the converse. (FO, Thm. A and Prop. A2, pp. 140–141; B08, Thm. V.2.1 and Remark V.2.2, pp. 21–22; Guo–Liu–Xu, §5.1, pp. 835–836).

**Checks.**

- Rank zero is admissible; rank one is admissible exactly under the equal-degree condition.
- Trivial-filtration weakly admissible modules are realized by unramified representations.
- A ramified finite-order character becomes crystalline on its kernel but is not crystalline downstairs.
- For a ramified quadratic descent extension, the unit module with quadratic descent action and the one with trivial descent action have the same underlying filtered module but are not isomorphic with descent.
- For an already semistable representation, `D_(st,L)=L_0⊗_(K_0)D_(st)` with coefficient action.
- The identity of `ℚ_p` has both the identity extension to `C` and nontrivial isometric Galois extensions, already for the unit representation. Even fixing the cyclotomic and compatible uniformizer roots does not fix all algebraic elements. A fixed algebraic-closure map, however, has a unique extension from that dense subfield to the completion.
- Equal total Hodge and Newton numbers alone do not make the unstable two-line example of §3.4 admissible.

### 3.6 Labelled ordinary flags, characters and group-valued data

Let `K/ℚ_p` and `E/ℚ_p` be finite, with `E` containing all embeddings of `K`, and let `λ_(τ,1)≥⋯≥λ_(τ,n)` be integral. For a continuous n-dimensional E-representation of `G_K`, `RegularOrdinary` abbreviates the field specialization `A=E` of `IsOrdinaryOfWeight` supplied by LocalGaloisDeformationRings §1.7. Its increasing stable full flag has rank-one graded characters satisfying on an open subgroup of `𝒪_K^×`
`ψ_i(Art^(geom)_K(u)) =∏_ττ(u)^(−(λ_(τ,n-i+1)+i-1)).`
Geometric Artin inverts arithmetic Artin. Labelled weights are `−(λ_(τ,n-i+1)+i-1)`, filtration jumps their negatives. Dominance makes these weights strictly ordered, so no extra regularity condition is imposed. Use the supplier's ordered graded-character, restriction, flag-uniqueness and dual/twist API, with field specializations `regularOrdinary_graded, _restrict, _rank_two`. The following slope, monodromy and descent comparisons belong here. For crystalline `V` put `h_(τ,j)=λ_(τ,j)+n-j` and assume the prescribed Hodge type: for every τ, `dim_E gr^i D_(dR,τ)(V)=1` precisely at the n distinct indices `i=h_(τ,j)`, and is zero at every other i. Under this hypothesis, order the eigenvalues `α_i` of `φ^f`, `f=[K_0:ℚ_p]`, by decreasing `v_K`, where `v_K(p)=e_K`. Ordinarity of weight λ is equivalent to
`v_K(α_i)=∑_(τ:K↪ E)(λ_(τ,i)+n-i).`
All coefficient components have the same Frobenius polynomial. For semistable V, if `dimker N^j=j` for `1≤j<n` and jumps are `c_τ,…,c_τ+n-1`, the representation is regular ordinary with `λ_(τ,i)=c_τ`. A de Rham regular ordinary restriction to finite (L/K) descends: its unique ordered flag descends and labels agree over each embedding of `K`. (Qian, Def. 1.2 and Lemma 2.4, pp. 1240, 1250; BLGHT, Lemma 2.2(1)–(2), pp.17–18; Qian, Dwork-family paper, Lemmas 4.1–4.2, pp. 19–20).

A character `ψ:G_K→ E^×` is crystalline exactly when
`ψ(Art^(arith)_K(u)) =∏_ττ(u)^(−h_τ) for every u∈𝒪_K^×.`
These `h_τ` are the labelled weights. Equality only on an open subgroup permits a ramified finite-order factor and gives potential crystallinity. After finite coefficient extension, any integral character admits a crystalline character matching both its residual character and its values on the finite torsion subgroup of `G_K^(ab)`; prove the interpolation of labelled exponents on the finite unit group and then choose the unramified factor. This includes the crystalline-character classification. (Conrad, *Lifting global representations with local properties*, Appendix `B`, Prop. B.4 and proof, pp.35–36, for the all-unit character criterion; Böckle–Iyengar–Paškūnas, Lemma 6.5 and proof, pp.53–54, for crystalline lifts).

For connected reductive `G/ℚ_p`, finite `K/ℚ̆_p`, `b∈ G(ℚ̆_p)` and a `K`-cocharacter `μ`, `filteredGFunctor` takes `(V,ρ)` to `(V⊗ℚ̆_p,ρ(b)σ,Fil_μ)`; `Fil^i` consists of weights `≥ i`. `admissiblePair` requires every realization to be weakly admissible. API: `filteredGFunctor_conjugate, _gl` for conjugation and `GL_n`. Assume additionally `μ∈{μ}` and `[b]∈ B(G,{μ})`, meaning the averaged Newton bound and matching Kottwitz invariant. Section 5.5 specializes MotivesAndAlgebraicCycles §6.8's tensor-isomorphism torsor as `tensorIsomTorsor` and constructs its `tensorIsomTorsor_galoisClass` using PELModuli §M0.9's torsor comparison. It then identifies that class under the local Kottwitz map with the torsion invariant difference, hence proves neutrality. A tensor trivialization produces a continuous crystalline `G(ℚ_p)`-representation, unique up to conjugacy. Source for the precise bounded assertion: Guo–Liu–Xu, §5.1, pp. 835–836, equation (5.1) and the paragraph before Def. 5.1.

**Checks.**

- In rank one the ordinary condition is exactly the displayed locally algebraic inertia condition.
- For `K=ℚ_p`, the ordered sum `⊕_(j=0)^(n-1)ℚ_p(−j)` has ordinary weight zero.
- An irreducible two-dimensional crystalline representation has no full stable flag even with distinct weights. For `K=E=ℚ_p`, take `φ=diag(1,p)`, `N=0`, `Fil^i=D` for `i≤−1`, `Fil^i=ℚ_p(e+f)` for `0≤i≤2`, and zero for `i≥3`. Then `t_H=t_N=1`, while both stable eigenlines have jump −1 and strict Hodge–Newton inequality. Its crystalline realization is irreducible, with descending Frobenius valuations `(1,0)` but weights `{1,−2}`. It fails the Hodge type for `λ=(0,0)`, whose required jumps are `{1,0}`.
- At `λ=(0,0)`, the dual Tate-curve representation has ordered characters `1,χ⁻¹`. A nonsplit extension with subline `χ⁻¹` and quotient `1` has the wrong order and fails this condition.
- For `G=𝔾_m`, `b=p^m`, `μ(z)=z^h`, admissibility is `m=h`; `b=1,μ=0` gives the unit tensor functor.
- For `GL_2`, slopes `(1,0)` and jumps `(1,0)` fail if the jump-one line is the slope-zero line.
- A ramified finite-order character distinguishes equality on all units from equality on an open subgroup.
- In rank one, `m=1,h=0` gives `κ(b)−μ^natural=1`, fixing the difference orientation; it fails admissibility. These tests prevent treating an arbitrary fibre-functor torsor as already trivial.

### 3.7 The semistable fundamental complex

For a filtered `(φ,N,G_K)`-module with smooth descent action, set
`X_(st)(D)=(D⊗ B_st)^(φ=1,N=0), X_(dR)(D)=(D_K⊗ B_dR)/Fil^0, C_(st)(D)=[X_(st)(D)→ X_(dR)(D)]`
in degrees `(0,1)`. API: `classicalStComplex, _H0, dualPeriodFunctor`, and `classicalStComplex_functorial` specifies the natural map, `H^0=V_(st)`, the contravariant/covariant duality and functoriality. `D^*_(pst)` is the smooth part of `Hom(V,B_st)`. For semistable `V`, `D=D_(st)(V)` has the exact fundamental sequence `0→ V→ X_(st)(D)→ X_(dR)(D)→0`, hence `H^1=0`. Surjectivity requires admissibility. (Colmez–Nizioł, §§5.1.3, 5.2.1 and Remark 5.5(iii)–(iv), pp. 32–34; Colmez–Dospinescu–Nizioł `2020`, Thm. 0.8, p. 7).

**Checks.**

- `D=0` gives the zero complex.
- For `V=ℚ_p(r)`, the covariant jump is `−r` and the contravariant jump is `r`.
- A mismatched rank-one pair `t_H>t_N` has an infinite-dimensional realization rather than a finite semistable representation; `t_H<t_N` has zero realization.
- Only the equal-degree case supplies the exact sequence with a one-dimensional kernel.

### Examples

The two-line examples of §3.4 give equal total degrees with different stable-subobject inequalities; the unit and its twists test all dimension, filtration and Frobenius normalizations. A ramified finite character tests descent and a labelled Lubin–Tate character tests why coefficient-valued characters need more than one cyclotomic exponent.

### Dependencies

Layer 0 supplies regular periods and invariant fields; Layer 1 supplies analytic rings only for the later converse proof. Existing isocrystals and general filtered linear algebra are reused. LocalFieldsRamification, Layer `3`, and LocalGaloisGroups, Layers 5 and `7`, supply the arithmetic groups and cyclotomic orientation, while ClassFieldTheory supplies the arithmetic Artin map. LocalGaloisDeformationRings §1.7 supplies the ordinary predicate and elementary flag API specialized in §3.6. Algebraic representations of reductive groups are lower-tier inputs; PadicLocalLanglandsForGL2Qp §0.2 supplies the filtered `(φ,N)`-module carrier, weak admissibility, full faithfulness and the general residue-field Colmez–Fontaine equivalence; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.3 and R07.4.13 supply the realization on arbitrary objects, its dimension criterion and Kisin's proof. Layer 5 proves the bounded torsor-neutrality theorem using that general residue-field crystalline equivalence.

## Layer 4: Robba realizations, differential periods and B-pairs

### 4.1 Ramified coefficient rings and extended periods

For finite `K/ℚ_p` set `K_∞=K(μ_(p^∞))`, `H_K=G_(K_∞)`, `Γ_K=G_K/H_K`, and
`F'_K=K_∞∩ K_0^(nr),`
possibly larger than `K_0`. Construct the norm-compatible inverse-limit field `E_K`, with addition by limits of norms of sums. It is complete discretely valued of characteristic `p`, residue `k'_K` and parameter `π̄_K`. Put `e_norm,K=e(E_K/E_(K_0))` and `f_norm,K=[k'_K:k]`. Normalize the base norm-field valuation by `v(ε−1)=1`, so `v(π̄_K)=1/e_norm,K`. Then `[E_K:E_(K_0)]=[K_∞:K_(0,∞)]=e_norm,K f_norm,K`; neither this total degree nor the absolute `e_K=v_K(p)` replaces `e_norm,K`. Finite extensions of `K_∞` correspond to finite separable extensions of `E_K`. Inside Witt vectors of `C^♭`, lift the separable closure and take `H_K`-invariants: `fieldOfNorms, _add, _galois, cyclotomicAK, cyclotomicBK` give the Cohen ring `A_K` and `B_K=A_K[1/p]`, with restricted Frobenius and Gamma. Since `E_K` is imperfect, `A_K` is not `W(E_K)`. Ambient overconvergent intersections give `B_K^(†,r)` and integral parts, independent of large-radius choices, with bounded Laurent coefficients over `F'_K` on `[p^(−1/(e_norm,K r)),1`). `cyclotomicBK_baseChange, _phi, _gamma, _overconvergent` give finite freeness, trace, norm and operator compatibility after radius enlargement. (FO, Thms. 4.15–4.16, pp.74–75, §§4.3–4.4, pp.79–86; B02, §§1.1, 2.1, pp.9–12, 14–17; for the radius, Berger’s [author version](https://perso.ens-lyon.fr/laurent.berger/articles/article02.pdf), §1.1 and Prop. 1.4, pp.10, 12, with the enlarged coefficient field in BE §1, p.2. Lift separable extensions finite étale and apply field-of-norms equivalence before invariants).

**Checks.**

- For `K=ℚ_p`, `E_K=𝔽_p((π̄))` and the Cohen lift is Layer 1's cyclotomic ring.
- The residue of the lifted parameter has intrinsic `E_K`-valuation one and base-normalized valuation `1/e_norm,K`; the zero element is included by the inverse-limit monoid construction.
- For `p=3` and `K=ℚ₃(μ₃)`, `H_K=H_(ℚ₃)`, so `e_norm,K=1` although `e_K=2`. With `π=[ε]−1` the radius-`r` annulus is `[3^(−1/r),1)`. At sufficiently large `r=r_n`, `φ^(n−1)(q)` has a zero at the inner endpoint: its inverse is excluded, though it would belong on `[3^(−1/(2r_n)),1)`.
- An unramified extension changes the residue constants and gives the matching finite-free coefficient extension. Purely inseparable extensions of `E_K` are excluded from the finite étale equivalence.

 `RobbaK.BrigR` is its Fréchet completion and `Brig` the union; `ofBdag, ofBrigF, phi, gammaAct, partialOp, ker_partial, tElt, LogRing`, and `topology_indep` specify the dense inclusion, unramified base inclusion, continuous extensions, derivative with constant field `F'_K`, cyclotomic element and logarithmic polynomial ring. Laurent expansion identifies this completion with `𝒪_(F'_K)([p^(−1/(e_norm,K r)),1)`), its bounded subring with `B_K^(†,r)`, and the union with the analytic Robba ring. The partial derivative is `∂(π_K)d/dπ_K`, with the leading factor a unit for large `r`. Gamma may act nontrivially on `F'_K`. (B02, Prop. 2.31 and §2.6, p. 27; B08, §I.2, p. 6; Berger's errata, §1, p. 2).

The finite-free multiplication map
`B_(rig,K_0)^(†,r)⊗_(B_(K_0)^(†,r))B_K^(†,r)→ B_(rig,K)^(†,r)`
is a topological isomorphism for large `r`, of rank `[K_∞:K_(0,∞)]`. It also gives the logarithmic-ring tensor formula. (B02, Lemma 3.13, p. 37).

Reuse the differential-equation supplier's extended Robba ring on `C^♭`, with valuation normalized by `v(ε−1)=1`. API: `ExtRobba.BrigR, galoisAct, phi, _galoisAct, plus, ofBdagK, LogRing, logPi`, and `radius_dictionary`: Berger radius `r` as the supplier's radius `1/r`. Frobenius is a bijection between radius `r` and `p r`; Galois acts continuously. The positive intersection `B̃_(rig)^+=⋂_nφ^n(B_cris^+)` embeds in the union and agrees with the analogous `B_(max)^+` intersection. Bounded field-of-norms elements embed into `H_K`-invariants. (B02, Def. 2.16, Props. 2.19, 2.25, pp. 21–25; BI, §VI.1, p. 38).

For a nonzero tilt element construct `tLog`, the additive logarithm of its Teichmüller lift, normalized to vanish on multiplicative residue constants and to send `π̄=ε−1` to a polynomial variable `X`. Extend it to nonzero elements of the overconvergent Witt ring with `log p=0`. Prove convergence and multiplicativity. `LogExtendedRobba, frobenius_u, galois_u, monodromy, iotaMap_injective`, and `plusLog_subset_bst` give
`φ X=pX, gX=X+log[gπ̄/π̄], NX=−p/(p-1), logπ=X+log(π/[π̄]).`
If `u=log[p^♭]` is Layer 0's Fontaine coordinate, `X=(p/(p-1))u+b`, with `b∈B̃_(rig)^+`. Thus `N` becomes exactly `−d/du`. (B02, Props. 2.23–2.25, pp. 23–25; B08, Appendix `B`, pp. 26–27; FO, Lemma 6.12, p. 119; BE, §1, pp. 1–2. Prove logarithmic transcendence over the extended analytic ring for injectivity).

**Checks.**

- For `K=K_0` recover Layer 1.
- The kernel of `∂` is `F'_K`.
- For odd `p`, choose a nonsquare unit `a` and `K=ℚ_p(√(a p^*))`, `p^*=(−1)^(p-1)/2p`.
- This `K` is totally ramified but its cyclotomic tower contains the unramified quadratic field `ℚ_p(√(a))`; coefficients in `K_0` alone would fail.
- Frobenius is bijective on the extended ring but not on the ordinary cyclotomic ring.
- The element `t` is positive with `φ t=pt`; `π` is an annular unit.
- On `X`, `Nφ X=−p^2/(p-1)`, and the coordinate change to `u` gives `Nu=−1`.
- The uncorrected `NX=−1` would rescale Tate-curve monodromy.

### 4.2 Localization, decompletion and logarithmic derivatives

For large `r`, choose `n(r)≥1` so that the ambient bound `r≤r_n` and the ramified finite-field threshold hold for all `n≥n(r)`. At these positive levels, `RobbaK.iotaN` extends `φ^(−n)` to an injective map `B_(rig,K)^(†,r)→ K_n[[t]]⊂ B_dR^+`. API: `iotaN_injective, _phi, _gamma, _tElt, _toBdR, ker_theta_iotaN`, and `quotient_eq_Kn`: `ι_n(t)=p^(−n)t`, shift compatibility with Frobenius, Gamma equivariance, and kernel `φ^(n-1)(q)`. The quotient is `K_n` on this domain. The bound comes from the ambient Witt radius; its Laurent presentation uses `e_norm,K`, and no absolute-ramification factor is inserted in `r≤r_n`. Evaluation, kernel and operator compatibilities all carry this positive-level threshold. Extend the logarithmic map through the chosen branch. `ExtRobba.iotaN, iotaN_injective, _galois, _phi, ker_theta_iotaN, iotaN_log, log_eq`, and `iotaN_restrict` give the extended-ring version, with `X↦ p^(−n)log[π̄]_(dR)`. The target needs no Frobenius. (B02, Props. 2.11–2.12, 2.25, 4.8 and Lemma 4.9, pp. 19–20, 24–25, 42; apply the corrected interval restrictions in BE, §1, p. 2).

The plus-part exact sequence uses the maps `x↦(x,−x)` and `(a,b)↦ a+b`: the bounded extended ring plus the positive analytic ring surjects onto the extended analytic ring. Its `H_K`-invariant sequence remains exact. Prove the needed `H^1`-vanishing for the Witt coefficients rather than assuming invariants preserve a surjection. Colmez, *Théorie d’Iwasawa des représentations de de Rham d’un corps local*, Prop. IV.2.4(i), p.34, proves `H^1(H_K,W(𝔪_(C^♭))⊗ T)=0` for a finite free continuous `ℤ_p`-representation `T`: solve the cocycle modulo `p`, divide its error by `p`, repeat, and sum the resulting corrections in the `p`-complete Witt module. Positive `B_(max)`-invariants admit an expansion with coefficients in the positive fixed Witt ring tending to zero, and bounded invariants are dense in analytic invariants. (B02, Lemmas 2.18, 2.27 and Cor. 2.28, pp. 22, 26).

The decompletion projections `decompletion, _section, _linear, tendsto_decompletion, decompletion_gamma`, and `_log` give continuous `φ^(−k)(B_(rig,K)^(†,p^kr))`-linear **retractions** `R_k` from extended fixed rings. They commute with Gamma and tend to the identity, extend to logarithmic localization and coefficientwise to a module with a fixed descended basis. They are not ring homomorphisms. These bounded projections, together with Frobenius regularization, descend fixed vectors: a matrix satisfying `A=Pφ^(−1)(A)`, `P∈GL_d(K_0)`, has positive logarithmic entries. The regularization proof bounds all negative-radius growth by a fixed power of `p` and intersects the shrinking-radius rings. (B02, Prop. 2.32 and Prop. 3.2, pp. 28–31).

API: `RobbaK.nabla, nabla_indep, _eq_t_mul_partial, _phi, nablaDivOneSubGamma, partial_surjective`, and `norm_one_sub_gamma`: `∇=logγ/logχ(γ)=t∂` for Gamma sufficiently close to one. Strict valuation gain for `1−γ` proves convergence on compact intervals. The continuous operator `∇/(1−γ_K)` satisfies the indicated product identity, without dividing by a unit in the coefficient ring. The logarithmic derivative is onto from `B_(rig,K)^†+F'_Klogπ_K` to the ordinary ring and onto the full logarithmic ring from itself; its kernel there is `F'_K`. A primitive of an element at radius `r` belongs at every larger radius `s>r`, not necessarily at `r`. (B02, Lemma 4.2, Prop. 4.4 and Remark 4.5, pp. 39–40).

The evaluation kernels extend coefficientwise to finite free modules. Vanishing modulo every sufficiently high cyclotomic factor implies divisibility by `t` in the Robba union. Principal parts can be interpolated: for `w≥1` choose an open-disc element equal to 1 modulo `t^w` at one selected localization and zero modulo `t^w` at all other sufficiently high ones. Principal ideals dividing `t^h` are generated by convergent products `∏_(n≥ n(r))(φ^(n-1)(q)/p)^(j_n)`, `0≤ j_n≤ h`; the maximal ideals are pairwise coprime once the finite field-of-norms threshold is reached. (B02, Lemmas 4.6, 5.1, 5.4, pp. 41, `46`, 48; B08, Lemma I.2.1 and Prop. I.2.2, pp. 6–7; Lazard, (8.11), p. 71).

**Checks.**

- Localization of `t` has the factor `p^(−n)`; that of `c∈ F'_K` is `σ^(−n)c` followed by its chosen embedding into `K_n`.
- Inverse cyclotomic factor has a pole at the excluded localization when `(r>r_n)`. For `K=ℚ₃(μ₃)` the radius-`r_n` ring still excludes that inverse: the unchanged norm field gives no factor of two in the endpoint.
- On the positive extended ring `ι_0` is the existing inclusion in `B_cris^+`, a separate domain which does not give level-zero evaluation on an annulus; `ι_(n+1)φ=ι_n` replaces any imagined target Frobenius.
- For `K=K_0`, `R_0([ε^(1/p)])=0`, `R_1([ε^(1/p)])=[ε^(1/p)]`, yet `R_0([ε])=[ε]`, proving nonmultiplicativity.
- Every later projection fixes an element already descended at level `k`.
- The derivative kills `F'_K`, sends `t` to 1 and sends `logπ_K` to a class with no ordinary primitive.
- Interpolation at width one and `h=0` gives respectively separated evaluation points and the unit ideal.

### 4.3 Representations and their Robba connection

For a stable free `ℤ_p`-lattice `T`, define `etalePhiGammaModule` by `(A⊗_(ℤ_p)T)^(H_K)`, where `A` is the completed maximal unramified Cohen extension just constructed. An étale module has finite free `A_K`-underlying module, continuous commuting semilinear Gamma, and invertible Frobenius linearization. Inverse is `(A⊗_(A_K)D)^(φ=1)` with its descended `G_K`-action. Import FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.4's `etalePhiModulesCohenRing`, specialized to the cyclotomic field of norms `E_K` and Cohen ring `A_K`. Construct `fontaineEquivalence, _unit, _counit, _rank, _exact_tensor`, and `_lattice` by adding the continuous `Γ_K` descent action to that supplied equivalence and descending its unit, counit, tensor and lattice maps. Its rationalization is identified with the supplied rational equivalence below; the integral lattices specify étaleness, which is not automatic for an arbitrary rational Frobenius module. (FO, Thms. 2.32–2.33, pp.36–37, and §§4.3–4.4, pp.79–86; B02, Thm. 1.2, pp.11–12).

Import LocalGaloisDeformationRings §0.4’s `CoefficientRobbaModule.etaleEquivalence` with `A=E`. Its overconvergence theorem supplies `D^†(V)` over `B_K^†⊗E` and compatible finite-radius models for every `r≥r_0`, for a common threshold depending on V. The notation `cherbonnierColmez` and its `_comparison, _rank, _restriction, _coefficients, _tensor, _dual, _finiteRadiusPhi` denote these supplied field specializations. Identify the supplier’s scalar Robba carrier with §4.1’s cyclotomic Laurent presentation: preserve coefficients and convolution, all Gauss seminorms, bounded and integral subrings, Frobenius, Gamma, restrictions and the chart and inductive-limit topologies. Under this identification the rationalization of `fontaineEquivalence` followed by overconvergence is the supplied étale equivalence, with its unit, counit, rank, tensor, dual and lattice comparison maps. The additional target here is this cyclotomic presentation and its compatibility with integral descent. (B02, Thms. 1.2–1.3, pp.11–12; BI, §III.3, pp.24–25).

**Checks.**

- Unit has basis fixed by Frobenius and Gamma, and rank zero stays zero under both quasi-inverses.
- On `ℚ_p(r)` the standard representation basis has `φ e_r=e_r` and `γ e_r=χ(γ)^r e_r`; its crystalline horizontal basis `t^(−r)e_r` instead has Frobenius `p^(−r)`.
- A rank-one Frobenius module with multiplier `p` is not étale, even though its rational linearization is invertible. Restriction to an unramified quadratic extension doubles the coefficient extension, not the representation rank.

Use the supplied `D_rig(V)` in its cyclotomic presentation
`D_(rig)^†(V)=(B_(rig,K)^†⊗E)⊗_(B_K^†⊗E)D^†(V).`
The logarithmic extension `D_(log)^†(V)=(B_(log,K)^†⊗E)⊗_(B_K^†⊗E)D^†(V)` is constructed here. The comparison with `D_rig(V)` preserves Frobenius, Gamma, exact tensor/dual maps and finite coefficient change; both presentations are free of rank `dim_E V`. Frobenius linearization is an isomorphism: at finite radius the radius `p r` module is generated by the image of Frobenius, not merely an extension of the radius-`r` module. The extended-ring comparison recovers `V` by Frobenius-fixed vectors. (B02, Thm. 1.3 and §3.2, pp. 12, 31; B08, Thm. I.3.3, with BE, §4, p. 4).

API: `RobbaRealisation.nablaV, nablaV_leibniz, _indep, _phi, partialV, ker_theta_iotaN, mem_t_of_forall`, and `nablaV_twist`: the Gamma action to a connection. Its quotient `∂_V=t^(−1)∇_V` is initially defined on `D_(rig)^†(V)[1/t]`. It preserves the original module only when an additional divisibility assertion is proved. The cyclotomic kernels and `t`-divisibility just established apply in a descended basis. (B02, §5.1 and Example 5.3, pp. 47–48).

The key comparison identifies, for every representation,
`D_(st)(V)=(D_(log)^†(V)[1/t])^(Γ_K), D_(cris)(V)=(D_(rig)^†(V)[1/t])^(Γ_K)`
as `K_0`-modules with their normalized operators. Prove extended logarithmic `χ^i`-eigenvectors are `K_0t^i` for `i≥0` and zero for `i<0`. Frobenius regularization identifies positive and analytic fixed periods; then decompletion descends them to the ordinary Robba realization. For semistable `V`, extension to `B_(log,K)^†[1/t]` gives its full comparison; for crystalline `V`, use the ring without the log variable. The transition determinant is a bounded overconvergent scalar times an integral power of `t`. If weights are at most zero, the fixed periods already lie before `t`-localization. (B02, Props. 3.3–3.4, Thm. 3.6, Props. 3.7, 3.9, pp. 31–34; BI, §IV.3.1, p. 27. Invariants are over `K_0` despite the larger coefficient field).

`RobbaCrystal` is a free finite-rank Robba module with invertible Frobenius linearization and a connection over `∇` commuting with Frobenius. `IsUnipotentConnection` requires vectors `f_i` in the original module which form a basis after inverting `t`, with `∇ f_i∈ t⟨ f_0,…,f_(i-1)⟩`. API: `isUnipotentConnection_iff_horizontal, IsTrivialConnection`, and `isUnipotentConnection_tensor`: identify this condition with a logarithmic horizontal basis before localization which spans after localization, and prove tensor stability. Unrestricted dual and extension stability fail, as the Checks show. A genuine differential lattice is a free full-rank Robba submodule `M⊂D[1/t]` with `∇M⊆tM`, hence a connection `∂_M=t⁻¹∇` on `M`. For Frobenius local monodromy require also `φ(M)⊆M`, invertible Frobenius linearization and `∂_Mφ=pφ∂_M`. Tensor and dual lattices carry their induced `∂`-connections. An extension in this differential category must have a free middle lattice with `∇M⊆tM` and connection-compatible exact maps; an extension of `RobbaCrystal` objects alone supplies no such divisibility. Layer 5 applies differential local monodromy to its constructed lattice `N_dR(V)`, with these Frobenius and connection hypotheses, rather than using closure of the original-module predicate. For representation realizations, a Tate twist making all weights nonpositive allows the original-module criterion to be applied to the dual representation. Integration on the logarithmic ring proves the horizontal-basis equivalence. There exists a cyclotomic level `K_n` over which `V` is semistable, respectively crystalline, **with all weights at most zero**, exactly when this original-module connection is unipotent, respectively trivial. Positive Tate twists violate the unlocalized condition. (B02, Prop. 5.5 and Prop. 5.6, pp. 48–49).

**Checks.**

- On `ℚ_p(r)`, `∇_V(fe_r)=(t∂ f+rf)e_r`; hence `∇_V(te_r)=(1+r)te_r`.
- Unit has the coefficient connection.
- The rational self-extension of the unit with cocycle `logχ` has `∇e₁=0`, `∇e₂=e₁` and nonzero nilpotent Sen operator. Its subline and quotient are trivial, but it is not Hodge–Tate or potentially semistable, so its original Robba connection is not unipotent. Arbitrary extension stability would contradict B02 Prop. 5.6 and BC Example 2.4.5, p.19.
- For `r=1`, `∂_Ve_1=t^(−1)e_1` has poles, so it is unavailable as an operator on the unlocalized module. The line `ℚ_p(−1)` has original horizontal vector `te_(−1)`, while its dual `ℚ_p(1)` has only `ct⁻¹e_1`, absent before localization. This also excludes unlocalized dual stability.
- In rank two, `∇ f_0=0`, `∇ f_1=t(1+π)f_0/π` has horizontal vector `f_1−logπ f_0` after log extension and is unipotent but not trivial over the ordinary localized ring.
- The corrected logarithmic `N` gives exactly the Tate-curve monodromy, not a scalar multiple.
- Rank-zero realization and comparison are zero.

### 4.4 Sen and differential de Rham realizations

Extend the rational Sen functor of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 to arbitrary finite-dimensional continuous semilinear C-representations `W`, with a natural identification with that functor when `W=C⊗V`. In this extension `senModule` is the canonical Gamma-finite `K_∞`-subspace of `W^(H_K)`, of dimension `dim_CW`, with scalar extension `C⊗_(K_∞)D_(Sen)(W)=W`. It descends to some finite cyclotomic level. `senOperator, senModule_equiv, senOperator_ker`, and `_tensor` define the logarithm of Gamma, the semilinear equivalence, its fixed kernel and the tensor and dual formulas. Small Gamma fixes finite-level scalars, giving `K_∞`-linearity. Hodge–Tate means semisimple with integral eigenvalues, and these are the present weights. Simple general Sen blocks require the finite-extension eigenvalue and division-algebra descent argument; integrality alone does not imply semisimplicity. (BC, Thms. 15.1.2, 15.1.7, pp.257, 261; Fontaine `2004`, §4.4, p.78).

**Zero Sen operator and inertia** (`senOperator_zero_iff_finiteInertia`). For finite `K/ℚ_p` and any finite-dimensional continuous `ℚ_p`-representation `V` of `G_K`, prove that the Sen operator on `C⊗_(ℚ_p)V` vanishes iff the image of `I_K` is finite, equivalently iff `V` is potentially unramified. Use Sen's theorem that the Lie algebra of the inertia image is the smallest `ℚ_p`-subspace of `End_(ℚ_p)(V)` whose extension to `C` contains the Sen operator. A compact p-adic Lie group has zero Lie algebra iff it is finite. Combined with the supplied Hodge–Tate criterion, this identifies zero Sen operator with Hodge–Tate of weight zero. The character specialization agrees with FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3. Source: Fontaine `2004`, §4.4, remark after Lemma 4.4, p.78; BC, Thm. 15.1.7, p.261. For an `E`-representation apply this theorem to its underlying `ℚ_p`-representation, so vanishing includes every coefficient label.

**Checks for zero Sen operator and inertia.**

- The zero representation has zero operator and trivial inertia image.
- An unramified character with arithmetic Frobenius value `1+p` has infinite total image but trivial inertia and zero Sen operator; finite total image is not the conclusion.
- The self-extension of `ℚ_p` defined by `logχ` has nonzero nilpotent Sen operator `[[0,1],[0,0]]` and infinite inertia image. Its eigenvalues are both zero, so eigenvalue vanishing alone is insufficient.

Write `K_∞[[t]]:=⋃_nK_n[[t]]`, a **union**, not all power series. `difPlus` is the Gamma-finite period lattice, free of the representation rank over that union, and `dif` its localization. `difPlus_comparison, difConnection, difPlus_mod_t`, and `dif_functor` give the scalar-extension comparison, logarithmic connection over `t d/dt`, reduction to the Sen module and exact tensor functoriality including restriction. Localizing a finite-radius Robba realization by `ι_n` gives this differential realization. De Rham periods are its Gamma invariants, and `K_∞⊗_KD_(dR)(V)` its horizontal vectors; de Rham is equivalent to having a full horizontal basis. For nonpositive weights, the positive comparison image is **`t`-adically dense** in the required filtered lattice, not necessarily equal. (BC, Prop. 15.4.5 and Def. 15.4.14, pp. 280, 285; B02, Props. 5.7, 5.9, 5.15, pp. 50–51, 54; BE, §1, p. 2).

For finite unramified `F/ℚ_p`, finite coefficients `E/ℚ_p`, crystalline `V` and a stable `𝒪_E`-lattice `T`, use PhiGammaModulesAndIwasawaCohomology §6.0's Wach modules with their chosen weight interval and twist. The notation here satisfies `wachModule V = PG.wachModule V` and `wachLattice T = PG.wachLattice T = PG.wachModule V ∩ D(T)` inside the same period realization, with `wachLattice T[1/p] = wachModule V`. For weights in `[−h,0]` the rational module is free of rank `dim_E V` over `E⊗B_F^+`, with `B_F^+=𝒪_F[[π]][1/p]`; Gamma acts trivially modulo `π`, Frobenius is stable and its cokernel is killed by `q^h`, `q=φ(π)/π`. Its extension generates the supplied étale `D(V)`. The integral module is free over `𝒪_E⊗A_F^+` and reconstructs `T`. The names `wachModule_unique, _exist, _height, _tensor, _twist`, and `wachLattice_reconstruct` denote the supplier's uniqueness, existence, height, interval-dependent tensor/twist and reconstruction maps under these identifications. Arbitrary bounded weight intervals use its twist and untwist maps; finite coefficient and unramified base changes are those of §6.1. (B04, *Limites de représentations cristallines*, Prop. II.1.1, §III.1 and Def. III.4.1, pp.11–12, 15–17, 21, with BE, §2, p.3).

**Checks.**

- Unit has `N= B_F^+` and integral lattice `A_F^+`.
- For `r=−h≤0`, the basis `π^h e_(−h)` has Frobenius multiplier `q^h` and Gamma multiplier `(γπ/π)^hχ(γ)^(−h)`, which is 1 modulo `π`.
- A noncrystalline semistable Tate representation has no such lattice. A ramified base is outside this existence statement; `q^h` is not a unit in `B_F^+` for `h>0`.
- For `ℚ_p(−1)`, `φ(πe_(−1))=qπe_(−1)` puts its generating reduction in `Fil¹`; replacing `q^iN` by `q^iφ*N` would lose this class.

For unramified `F` and nonpositive weights, use the supplied filtered isomorphism `λ_V = PG.wachModule_dcris V : D_cris(V) ≃ N(V)/πN(V)`, where `N(V)=wachModule V` and `Fil^iN(V)={x:φ x∈q^iN(V)}`. Thus `λ_V(Fil^iD_cris(V))=im(Fil^iN(V)→N(V)/πN(V))`, with crystalline Frobenius retained. This is the filtered reduction of PhiGammaModulesAndIwasawaCohomology §6.0, using B04 Thm. III.4.4 and Cor. III.4.5, p.22, with BE §2's corrected filtration argument.

For integral `T`, construct the additional crystalline image `Wach.dcrisLattice T = λ_V⁻¹(im(wachLattice T→N(V)/πN(V)))`. Its API `dcrisLattice_isLattice, _phi, _mono, _injective, det_comparison`, and `filtrationT` gives a full integral lattice, Frobenius-stable in nonpositive weights, monotone and injective as a function of lattices in fixed `V`. Here `filtrationT` is the image filtration under `λ_V⁻¹`; identify it with the induced crystalline filtration in the strongly divisible range below. On the underlying `ℚ_p`-representation, in bases of `D_cris(T)` and T, the determinant of `B_cris⊗_F D_cris(V)→B_cris⊗_(ℚ_p)V` lies in `t^(∑ r_i)W(k̄)^×` when the weights are `−r_i`, with `k̄` the algebraic closure of the residue field of F. (B04, Def. V.1.1, Prop. V.1.2 and Remark V.1.3, pp.28–29; BE, §2, p.3, version dated 13 October 2026).

In an interval of length at most (p-1), this lattice is strongly divisible with the induced filtration and the Wach image filtration agrees with it. The converse at length (p-1) requires absence of one of the two endpoint slope parts; at length at most `p-2` there is an inclusion-preserving bijection with strongly divisible lattices and no endpoint exclusion. Identify this explicitly with Fontaine–Laffaille's correspondence after the sign change. The Wach–Breuil–Kisin comparison is imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4.26 `wachBreuilKisinComparison`. Its contract has `p>2`, the specified cyclotomic frame over `𝒪_K[[t_1,…,t_d]]`, and the dual Tate module with nonpositive weights; specialize to `d=0` here. It compares functors after the prescribed scalar extensions, rather than equating their module carriers. It supplies no `p=2` Wach comparison. (B04, Props. V.2.1, V.2.3 and Remark V.2.2, pp. 30–31).

**Checks.**

- Sen and differential operators on the unit are zero and `t d/dt`, while on `e_r` their scalar contribution is `r`.
- A nontrivial `logχ` extension has a nonzero nilpotent Sen operator, hence fails the Hodge–Tate test despite integral eigenvalues.
- Modulo `t` the differential connection is the Sen operator.
- A non-de Rham reverse extension of `ℚ_p(1)` by `ℚ_p` has too few horizontal differential periods although its one-variable connection is integrable.
- Unit integral Wach lattice is `𝒪_F`; its twist `r≤0` has lattice `𝒪_Ft^(−r)e_r` and determinant `t^(−r)` times an integral unit.
- For `F=ℚ₃` and the unramified character η with arithmetic Frobenius value 4, the weight-zero line has determinant `b⁻¹∈W(F̄₃)×`, with `g(b)=η(g)b`. It cannot lie in `W(F₃)×=ℤ₃×`, which Galois fixes. Integral basis changes preserve this obstruction.
- Replacing `T` by `pT` multiplies the lattice by p.
- Endpoint conditions at length (p-1) and failure of strong divisibility in general at length at least `p` distinguish the integral ranges.

### 4.5 B-pairs, cohomology and general de Rham blocks

For finite coefficient field `E`, `BPair` consists of a finite free `B_e⊗ E`-module with continuous semilinear action, `B_e=B_cris^(φ=1)`, and a stable finite free `B_dR^+⊗ E`-lattice in its common `B_dR`-realization. `BPair_hom, _tensor_dual`, and `_ofRepresentation` specify equivariant lattice-preserving maps, tensor and dual, and the pair of a representation. Recover that representation as the intersection of its two realizations. The exact tensor equivalence with finite free coefficient-valued Robba `(φ,Γ)`-modules extends §4.3's étale representation equivalence; arbitrary B-pairs need not come from representations. (Fontaine `2004`, §3.7, pp. 67–69; KL, Def. 9.3.11 and Thm. 9.5.8, pp. 197, 202; Ding, §2.1, pp. 9–10).

API: `WdRPlus, _labelled, DdRPlus_filtration, WdRPlus_ofRepresentation`, and `fullRankQuotient_H0`: positive period lattices, projects by the `K⊗ E` idempotents, and gives `D_(dR)^+=Fil^0D_(dR)`. For a full-rank inclusion `N⊂ M`, identify Herr `H^0(M/N)` with the Galois invariants of `W_(dR)^+(M)/W_(dR)^+(N)`; for de Rham `M`, identify it with the quotient of the two positive de Rham realizations. Component period rings need not be fields. (Ding, Lemma 2.1, p. 10).

Import LocalGaloisDeformationRings §0.4’s `HerrCohomology` and `HerrCohomology.baseChange` with `A=E`. For a coefficient-valued Robba module D, let Δ be Gamma’s full finite torsion subgroup and choose γ generating `Γ_K/Δ`. The name `herrComplex` denotes the supplied complex on `D^Δ` in degrees `0,1,2`, with `d⁰x=((φ−1)x,(γ−1)x)` and `d¹(a,b)=(γ−1)a−(φ−1)b`. Its `_changeGenerator, _functorial, _galoisComparison, _cup, _duality` are the supplied field specializations: change-of-generator quasi-isomorphisms, Ext/Galois comparisons, cups and Tate duality. Derived coefficient change is supplied; cohomology-group change requires vanishing of the relevant Tor terms. The cyclotomic presentation identifies these complexes degree by degree, preserving cups and trace. Rational Δ-invariants are exact also at `p=2`; integral invariants need not be. Relative to Liu’s degree-one order `(γ−1,φ−1)`, use degree maps `1`, `(a,b)↦(b,a)`, `−1`; transport both cup products and the degree-two trace through this cochain isomorphism. The arithmetic normalization is `tr(χ_ur∪κ(p))=1` over `ℚ_p`, with `χ_ur(Φ)=1` for arithmetic Φ; reversing the order gives −1. (Ruochuan Liu, §2.1, Thms. 2.3, 2.8 and 4.7, pp.7–9, 11–14, 25).

**Checks.**

- On the unit, `d^0(1)=0`; scalar commuting operators `2,3` give `d^0(1)=(1,2)` and `d^1(1,2)=0`.
- On `(a,b)=(1,0)` with scalar `φ=2`, `γ=3`, our `d^1` is 2; Liu’s differential after the coordinate swap is −2. The degree-two adapter is therefore −1.
- Replacing `γ` by `γ^2` multiplies the Gamma component by `1+γ`, whenever both are admitted generators; this is a cochain map, not equality of the matrices.
- At `p=2` the finite torsion part is retained. Over `ℚ_p`, the degree-two trace of the unramified character `χ_ur`, `χ_ur(Φ)=1`, cupped with `κ(p)` is 1; `tr(κ(p)∪χ_ur)=−1`. This order follows arithmetic ClassFieldTheory reciprocity and fixes the Herr trace sign.

The general comparison is `herrBPairDerived`: a natural isomorphism in `D(ℚ_p)` between the Herr complex and the total continuous-cochain complex of `[W_e⊕W_dR⁺→W_dR]`, with difference differential x−y. Here is an actual roof, including the step beyond Nakamura Thm. 5.11. Put `C=C_Herr(D)`, `B=Tot C_cont(G_K,W)`, and let `α^i:H^i(C)≅H^i(B)` be Nakamura’s isomorphism of `δ-functors`, with the degree-two sign adapter above. Choose `ℚ_p`-linear cycle representatives `s_C^i:H^i(C)→Z^i(C)` and `s_B^i:H^i(B)→Z^i(B)`. In every degree these exist since the coefficients are a field. They define the roof
`C ← s_C ─ (H^•(C),0) ─ s_Bα → B.`
Both arrows are genuine quasi-isomorphisms of complexes; this is not an assertion that a `δ-functor` is itself a cochain map. Different choices produce the **same derived morphism**: over a field an acyclic complex is contractible, and a map inducing zero on cohomology is null-homotopic. Explicitly split `C^i=B_C^i⊕s_C^iH^i(C)⊕L_C^i` with `d:L_C^i≅B_C^(i+1)`; its inverse contracts the boundary summand. Applying this contraction to the difference of two representatives supplies the homotopy. Thus the resulting derived morphism is natural in `D`, even though the chosen representative maps need not be strictly natural. No equivariant or topological splitting of period modules is being assumed: these are algebraic `ℚ_p-complexes` after continuous cochains have been formed.

For cup compatibility first identify both cup products with the Yoneda product on extension classes. In degree zero this is the tensor product of fixed morphisms. In degree one it is the splice of the represented extensions; Herr’s Koszul product and the B-pair continuous-cochain product realize that splice, with the coordinate/sign adapter already fixed. For higher degrees use the weak effacement in Nakamura’s proof to dimension-shift in each variable; naturality with the connecting morphisms forces the same product. This proves compatibility on cohomology. Over `ℚ_p`, Künneth identifies the cohomology of the tensor of the two source complexes, so the product square commutes in `D(ℚ_p)`; the preceding contraction gives an actual homotopy for chosen chain representatives. Twists are exact tensor autoequivalences and follow identically. Connecting-map compatibility is `α`’s `δ-functor` compatibility, hence also holds in `D(ℚ_p)`. On étale objects the degree-zero map agrees with the Galois comparison, and universality gives agreement in every degree. The statement is a derived cup-compatible roof; it does not assert a strictly multiplicative map or an `E_∞` enhancement. These stronger unused promises are not part of the contract. Source: Nakamura Appendix §5, Thms. 5.9–5.11 and the cup construction, published pp.563–566; Liu §§2.1–2.2 and Thm. 2.3 for Herr cohomology. KL Remark 9.5.9, p.202, is a pointer, not the construction.

API: `herrBPairDerived, _H0, _cup, _twist, _boundary, _etale, _choiceIndependent`. This field-splitting argument is **not** used to descend a relative sheaf diagram: derived categories of sheaves are not semisimple. Section 7.6 instead constructs a common chart resolution before taking hypercovers.

For each Galois orbit A in `K̄` let `K_A=K[X]/P_A` and choose a small cyclotomic subgroup on which `exp(β log χ)` converges, `β=X` mod `P_A`. Induce that character to Gamma, extend to `K_∞` and choose a simple summand. Target `simpleSenBlock` proves its independence up to isomorphism, its orbit of eigenvalues and its endomorphism division algebra. The endomorphism algebra before taking a simple summand is the cyclic algebra with `c^m=b` and `cu=σ(u)c`; its central division factor `D_A` has dimension `p^(2s_A)` over `K_A`, and the simple block has dimension `|A|p^s_A`. Thus a prescribed Sen polynomial need not itself be realizable. Target `simpleSenBlock_classification` tensors with polynomials in log `χ` of degree `<d` and proves unique finite indecomposable multiplicities. (Fontaine `2004`, §2.6, Props. 2.12–2.13 and Thm. 2.14, pp.39–43).

**Checks.**

- `A={0}`, `d=1` gives the unit; `d=2` gives the nontrivial log `χ` extension, with one-dimensional invariants.
- The polynomial representation of degree `<2` has `Γ`-action `[[1,log χ],[0,1]]` and a nonzero nilpotent Sen operator.
- A division factor of index `p^s` forces simple-block dimension `|A|p^s`, rather than |A|; direct sums multiply this dimension.

Finally every finite-dimensional semilinear `B_dR`-representation is a finite sum of blocks `B_dR[a;d]`, with unique multiplicities, where `a` runs through Galois orbits in `K̄/ℤ`, and `d≥1` is logarithmic Jordan length. Construct the simple block from the simple Sen module, prove independence under integral change of lift, and tensor with the length-`d logχ` Jordan representation. Almost de Rham objects have only `a=0`, while de Rham objects additionally require `d=1`. The proof includes the simple Sen-block descent and its endomorphism division algebra. (Fontaine `2004`, Thm. 3.17, Prop. 3.18, Thm. 3.19 and Prop. 3.20, pp. 66–69).

**Checks.**

- Unit pair is `(B_e,B_dR^+)` and the zero pair has two zero components.
- Replacing the positive lattice by `tB_dR^+` changes the pair while retaining the same localized component.
- The representation `ℚ_p(r)` has invariant de Rham generator `t^(−r)e_r`, jump `−r`, in every labelled component.
- The zero module has zero labelled realizations.
- In the two-term B-pair complex the diagonal `(x,x)` is killed by `x-y`; using `x+y` would fail already on `(1,1)`.
- For the acyclic two-term complex `ℚ_p→ℚ_p` with identity differential, both cohomology groups are zero but both chain groups are nonzero. The roof uses a contraction; it does not equate a complex with its cohomology as chain groups.
- Two cycle representatives differing by a boundary induce homotopic maps. A sign change on `H²` is detectable and cannot be removed as such a boundary; use the scalar Herr witness above.
- A length-two zero-orbit block is almost de Rham but not de Rham; a nonzero orbit block cannot be made de Rham merely by changing its lift by an integer.

### Examples

The ramified quadratic coefficient-field example, the two-dimensional logarithmic unipotent connection, and the length-two Sen block distinguish constants, monodromy and semisimplicity. Tate twists compare the Robba, Sen, differential and filtered realizations on the same rank-one representation.

### Dependencies

Section 4.1 supplies the cyclotomic presentations; §4.4 uses PhiGammaModulesAndIwasawaCohomology §§6.0–6.1 for the Wach modules, reconstruction and filtered reduction and adds their integral crystalline-image comparisons. LocalGaloisDeformationRings §0.4 supplies finite-coefficient Robba modules, overconvergence, the rational étale equivalence and Herr/Ext/Galois, coefficient-change and Tate-duality comparisons; §§4.3 and 4.5 identify their field specializations with the displayed conventions. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.4 supplies `etalePhiModulesCohenRing`; §4.3 adds its continuous cyclotomic `Γ_K` descent. PadicDifferentialEquationsAndRigidCohomology supplies its extended Robba carrier and slope theory. Layers `0`, 1 and 3 supply period rings, analytic norms and admissibility. General B-pair cohomology, its residue-compatible duality, simple Sen blocks and logarithmic transcendence are proved in this layer where the narrower supplier contracts do not cover them.

## Layer 5: Monodromy, weak admissibility and Weil–Deligne parameters

### 5.1 The differential equation attached to a de Rham representation

Fix a de Rham representation `V` of `G_K`, with `K` finite over `ℚ_p`. NoncommutativeAndEquivariantIwasawa §F.6 stage 3 supplies the embedded differential lattice `N_dR(V)⊂D_(rig)^†(V)[1/t]`, its uniqueness and characterization at every sufficiently deep cyclotomic localization by `K_n[[t]]⊗_K D_dR(V)`, its rank, exactness, twist, tensor and dual API, and `deRham_iff_potentiallySemistable`. This section presents that lattice by interpolation and localization.

First suppose all Hodge–Tate weights of `V` are at most zero. For large s and all `n≥n₀`, localize its radius-s Robba realization in `K_n[[t]]⊗_K D_dR(V)`. Define `N_s` by requiring that every such localization belong to this positive lattice. Closed submodules of finite free radius-s analytic modules are free, with rank their fraction-field dimension. Use Forster's theorem on the annulus; closedness cannot be omitted. Construct approximations to any prescribed vector modulo tʷ at every cyclotomic level. The scalar `t_n=pⁿt/φⁿ⁻¹(q)` separates those levels, and Layer 4's interpolation then gives the approximation. These statements imply that `N_s` has rank dim `V`, its localized images are dense, and `∇_V(N_s)⊆tN_s` after increasing the radius. The Robba extension of `N_s` is a full-rank `∂_V`-stable lattice with the supplier's localization conditions, so the supplier's uniqueness identifies it with `N_dR(V)`. For general `V`, choose `h` at least its largest weight and transport the presentation of `V(−h)` by the supplied twist `N_(dR)(V)=t^(−h)N_(dR)(V(−h))⊗e_h`. (B02, Prop. 4.10, Lemmas 5.11–5.14 and Prop. 5.15, pp. 43, 52–54; BE, §1, p. 2).

API: `deRhamDiffEq, _free, deRhamDifferentialEquation, _localization, _phi, _gamma`, and `_connection` restate §F.6 stage 3's lattice on this presentation: `deRhamDiffEq` is the radius-s lattice `N_s`, free of the representation rank, `deRhamDifferentialEquation` is its Robba extension identified with `N_dR(V)`, and the remaining names record its localizations, invertible Frobenius linearization with `∂φ=pφ∂`, and `∂γ=χ(γ)γ∂`. Uniqueness, rank, twists, tensor products and duals are the supplier's. For crystalline `V` the lattice is the Robba extension of `D_cris(V)`. Conversely, a free full-rank `∂`-stable lattice in the unlocalized radius model gives a full horizontal basis in the differential realization and forces `V` to be de Rham with weights at most zero. (B02, Lemmas 5.16–5.17 and Prop. 5.18, pp. 51–56).

**Checks.**

- Unit has `N_dR` equal to the coefficient ring with its scalar derivative.
- For `ℚ_p(r)`, `N_dR` is generated by `t⁻ʳe_r` and the connection kills that generator; for `r>0` this module requires t-localization.
- At localization `n`, `t_n` has value `ζ_p−1` modulo `t`, whereas its other sufficiently high localizations vanish modulo `t`.
- A non-de Rham reverse extension cannot have a full-rank positive `∂`-stable lattice.
- The rank-zero lattice and monodromy module are zero.
- A nontrivial finite ramified character is potentially crystalline but is not crystalline over `K`, so descent data cannot be discarded.

### 5.2 Filtered modules as Robba modifications

For a filtered `(φ,N)`-module `D` with finite Galois descent from L/K, construct `bergerModification` by imposing, inside the logarithmic horizontal extension of `D`, every localized `Fil⁰` lattice obtained by transporting the filtration by `φ⁻ⁿ`. The coefficient module is first cut out by `N=0`; one does not simply extend `D` and forget the filtration. API: `bergerModification_iota, _rank, _exact_tensor`, and `_rank_one`: its localizations with those lattices and proves finite freeness, exactness and tensor compatibility. (B08, Def. II.2.1 and Thm. II.2.6, pp. 11–13).

The modification gives an equivalence between filtered modules with finite descent and Robba `(φ,Γ)`-modules whose connection is locally trivial. Recover `D` from the logarithmic horizontal vectors after finite extension, then recover each filtration from its positive differential lattice. Prove the reconstruction lemma: the stable period lattice equals the `Fil⁰` lattice reconstructed from its intersections. Without that lemma the filtration part of the quasi-inverse is missing. Saturated subobjects correspond under this equivalence. (B08, Thms. III.2.3–III.2.4, pp. 15–17, with the additional argument in BE, §4, p. 4).

In the valuation-positive analytic convention, the modification has degree `t_N(D)−t_H(D)`. Its curve degree has the opposite sign, as in KL Def. 4.1.6 and Remark 4.1.12, pp.104–105; HN polygons reflect in the horizontal axis. A filtered module is weakly admissible precisely when its modification is étale, equivalently all its Robba slopes are zero. Both directions use the saturated-subobject correspondence and the slope filtration: total degree zero alone does not force every slope to vanish. The new `bergerModification_realization` adapter identifies the representation obtained from an étale modification with the imported Colmez–Fontaine realization: compare their logarithmic horizontal periods and localized filtrations, then use full faithfulness from PadicLocalLanglandsForGL2Qp §0.2. It preserves tensor, dual and finite descent data. This proves agreement of two constructions, without planning the already supplied admissibility theorem again. (B08, Thms. IV.2.1–IV.2.2 and V.2.1, pp. 18–19, 21–22).

**Checks.**

- Unit modification is the unit Robba module, and the zero module has rank and degree zero.
- In rank one with `φ=p` and filtration jump zero the degree is `1`, so the modification is not étale.
- A direct sum of slopes −1 and 1 has total degree zero but fails weak admissibility.
- Changing only the filtration changes the local positive lattices and can change the modification.
- On a Tate twist the filtration shift compensates exactly for the Frobenius slope shift.
- A morphism of weakly admissible objects must be strict; a filtration-preserving map of arbitrary filtered modules need not be strict.

### 5.3 Potentially semistable periods and Fontaine's recipe

Import NoncommutativeAndEquivariantIwasawa §F.6's generic period-realization prefix directly. Its `D_pst(V)` is the union of the actual `D_st,L(V)` invariants over finite extensions L/K in the fixed algebraic closure. It is a `K₀^nr⊗E`-module of rank `dim_E V` for potentially semistable `V`, with semilinear `φ`, nilpotent `N_p=N_absolute` and smooth discrete `G_K`-action. For any semistabilizing `L`, scalar extension of `D_st,L(V)` recovers `D_pst(V)`. The supplier's filtered Galois descent identifies `D_dR,K(V)` with `D_dR,L(V)^{Gal(L/K)}` for finite Galois semistabilizing L/K. Its realization and period comparison give base change, action, restriction, exactness, tensor/dual, coefficient descent, full-rank and de Rham comparison, with composition in towers. The new `pstAlgebraicConstantsAdapter` extends this union from `K₀^nr` to its valuation completion `K̂₀^nr` and compares it with the semilinear realization descended using PadicPeriodRings §2’s completed unramified descent. It identifies the actual scalar-extension map, respecting `φ`, `N_p`, the smooth descent action on the union and the descended de Rham filtration. The completed module has a continuous action; it is not identified with the algebraic union as a carrier. (FO, Def. 6.61 and Prop. 6.62, p.143; Breuil–Schneider, §4, pp.13–15).

For `w` in `W_K` let `α(w)` be its exponent of **absolute arithmetic** residue Frobenius; `α(Φ_K)=f_K` and `q_K=p^f_K`. Choose a finite Galois semistabilizing `L/K`, an arithmetic Frobenius lift `Φ_K∈W_K`, and a coefficient embedding of `L₀` into a sufficiently large `E`; take the component of `D_st,L`. Set

`r_D(w)=w̄∘φ^(−α(w)).`

The two semilinearities cancel on that component. Since `Nφ=pφN`, this convention gives

`r_D(w)Nr_D(w)^(−1)=p^(α(w))N, r_D(Φ_K)Nr_D(Φ_K)^(−1)=q_KN.`

This is NoncommutativeAndEquivariantIwasawa §F.6's realization with its native `N_p=N_absolute`; `absoluteMonodromyAdapter` is the identity on this output. Its linearity, relation, finite inertia, equivalence and tensor/twist API are imported. Retain the rescaling adapter only for NeronModelsAndSemistableAbelianVarieties §5.3's uniformizer-normalized `PadicWeilDeligneRealization`: send `(r,N_K)` to `(r,N_K/e_K)` and identify the resulting period module with the direct supplier by the identity on the actual `B_st` invariants and the same coefficient component. This comparison preserves the Weil action, coefficient descent and filtered period maps. Its `_restriction` comparison follows from `e_L=e(L/K)e_K` and `N_L=e(L/K)N_K`, so `N_L/e_L=N_K/e_K`; it commutes with tensor products and coefficient change and composes in towers. The parameter of the twist `ℚ_p(1)` is the unramified character `ω` with `ω(Φ_K)=q_K`. With geometric Frobenius both displayed scaling factors invert. (Breuil–Schneider, §4, p. 14; Allen et al., §1.1.6, p.9. Changing the semistabilizing extension gives compatible scalar-extension isomorphisms. Changing the coefficient embedding preserves the isomorphism class, through a generally noncanonical isomorphism; no natural identification of chosen components is asserted (Breuil–Schneider, §4, p.14)).

For de Rham `V`, import NoncommutativeAndEquivariantIwasawa §F.6's deRhamWeilDeligne composite; the supplier's `deRham_iff_potentiallySemistable` (§F.6 stage 3) gives the semistabilization used to apply the generic period functor. The new `inertialType, arithmeticFrobeniusPolynomial` and `_embeddingChange` adapters record the chosen coefficient component, arithmetic polynomial and independence up to isomorphism. Restriction and tensor/dual/twist maps are the supplier’s API; retain the semistable and crystalline criteria on these same periods. The inertial type records `r|I`; the pair `(r|I,N)` is retained separately to distinguish special and crystalline parameters. For potentially semistable `V`, it is semistable over `K` iff inertia acts trivially on `D_pst`; it is crystalline iff additionally `N=0`, and potentially crystalline iff `N=0`. Over `K` the arithmetic Frobenius polynomial is that of `bar(Φ_K)∘φ^(−f_K)` on the chosen coefficient component. When `V` is already semistable over `K`, compute instead on `D_st,K` to obtain `det(X−φ^(−f_K))`. After restriction to `W_L`, the descent factor is trivial and the exponent for arithmetic Frobenius of `L` is `f_L`. On `D_st,L`, `φ^(−f_K)` alone can permute coefficient components; its composition with descent preserves the chosen component. The general polynomial records the chosen lift `Φ_K`; changing that lift can change the polynomial for ramified inertia. Reconstruction needs WD plus its descended weakly admissible filtration. (FO, Prop. 6.62, p.143; Breuil–Schneider, §4, pp. 13–15).

**Checks.**

- For a rank-one representation already semistable over `K=ℚ_p`, a `φ`-eigenvalue `λ` gives arithmetic Weil eigenvalue `λ⁻¹`; a nontrivial descent operator must otherwise be included.
- Unit has trivial `r` and `N=0`; `ℚ_p(1)` has `r(Φ)=p`. Over an unramified quadratic semistabilizing extension of `ℚ_p`, `φ⁻¹` alone exchanges the two coefficient components even for the unit; descent cancels this permutation.
- For odd `p` a ramified quadratic character can be unramified-twisted to have `η(Φ_K)=−1`. On its totally ramified kernel field the period Frobenius is 1, but descent is −1: the polynomial is `X+1`, whereas omitting descent gives `X−1`.
- A finite-image character retains its inertia character. For `K=ℚ₃`, `L=ℚ₃(√3)` and its quadratic character `η`, `3` is not a norm: the norm of `√3` is `−3` and unit norms have square residue. Thus `η(Art(3))=−1`; `φ=1` on `D_(st,L)(η)`, and the descent operator changes the arithmetic eigenvalue from `+1` to `−1`.
- In the Tate module with `φ=diag(p⁻¹,1)` and `Ny=vx`, `r(Φ)=diag(p,1)` and `rNr⁻¹=pN`.
- Replacing `−α` by `+α` both fails linearity over a nontrivial unramified coefficient field and gives the wrong monodromy scaling.
- Rank-zero `D` produces the zero parameter.
- For `e_K=2` and `q=π⁵`, the Néron adapter's `N_K` coefficient is 5 and the direct supplier's `N_p=N_absolute` coefficient is `5/2`. Division by `e_K` commutes with tensor monodromy; it does not invert the Weil operator or divide the native `N_p` a second time.
- For an extension K′/K with absolute ramification index `e_(K′)`, `N_(K′)=(e_(K′)/e_K)N_K` but `N_absolute` stays `5/2`. For a ramified quadratic extension the normalized coefficient becomes 10; dividing by `e_(K′)=4` recovers `5/2`. This identity comparison composes through a further ramified extension.

### 5.4 Normalizations, purity and rank-two types

For a `ℚ_p`-valued de Rham character `η=χʰη₀` with `η₀` finite on inertia, its parameter is `ωʰη₀|W`. Equivalently it is `η|W·(ω/χ)ʰ`. This formula also applies to the determinant of a rational representation. General E-valued characters need the labelled-weight version of Layer 3; they are not all a parallel power of `χ` times a finite-inertia character. Tensor, dual and determinant compatibility transport the formula to higher rank. For an elliptic curve with crystalline `H¹` and geometric Frobenius polynomial `X²−aX+p`, `φ` on the covariant Tate-module convention has polynomial `X²−(a/p)X+1/p`; its arithmetic Weil polynomial is `X²−aX+p`. (Allen et al., §§1.1.1, 1.1.6, pp.8–9; Breuil–Schneider, §4, p. 14. Use the same covariance for ℓ-adic parameters).

For a Tate curve with `q` parameter and `v=v_p(q)>0`, choose x,y so that

`φ x=p^(−1)x, φ y=y, Nx=0, Ny=vx, Fil^0D_K=K(y+log_p(q)x).`

Filtration is `D_K` in degree −1 and zero in degree 1. Its Hodge and Newton numbers are both −1; the `φ,N`-stable line `K₀x` has Hodge number −1 and Newton number −1. The arithmetic Weil Frobenius is `diag(p,1)`, with the same `N`. A nonsplit multiplicative curve introduces the unramified quadratic twist and changes both Frobenius eigenvalue signs. (BI, §II.4.3, p.18; Allen et al., §1.1.6, p.9).

Neither weights nor inertia determine Frobenius. A good ordinary elliptic example and a good supersingular one both have weights `0,1`, trivial inertia and `N=0`, but their crystalline slopes are respectively `0,1` and `1/2,1/2` on `H¹`. More generally, the rank-two crystalline realizations with weights `0,1` allow the Frobenius polynomials supplied by the weakly admissible classification, rather than a single polynomial fixed by those weights. In rank one, `χʰ` times an unramified character with arithmetic value `λ` has Weil value `λq_Kʰ`. (BC, Thm. 8.3.6, p.120; BI, §II.3.2, p.14).

Use ArithmeticGaloisRepresentations §2.6’s centered monodromy filtration and `WeilDeligneRep.IsPure`, evaluated at **geometric** Frobenius. Import its Frobenius-semisimplification, restriction, tensor, dual and twist laws and monodromy symmetry. The period adapter identifies the parameter of `ℚ_p(r)` with `ω^r`, so the supplied twist law gives weight `w−2r`. Retain algebraicity and the all-complex-embeddings condition of the supplied `WeilDeligneRep.IsWeilNumber`: on `gr_i` the absolute values are `q_K^((w+i)/2)`. (Boxer–Calegari–Gee–Pilloni `2025`, §1.8.3, p. 8).

`rankTwoSupercuspidal` means a two-dimensional WD parameter irreducible over an algebraic closure of E, equivalently absolutely irreducible over E; prove invariance under finite coefficient extension. `rankTwoSpecial` means `N≠0`. These definitions impose no absolute numerical slope normalization. The normalizations `1/2` in the supercuspidal case and `0,1` in the special case are extra conditions for the Drinfeld-tower coefficients. Their API includes `rankTwoType_twist`, recording preservation of the type and translation of slopes. (Colmez–Dospinescu–Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, arXiv:2204.11214v1, §0.3.1, pp.8–9; *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1* (2020), §0.2, p.4, footnotes 5–6 of the linked author version. In their homological convention the notation `D_pst(V)[1]` shifts the associated parameter by `|·|⁻¹`; record that explicit convention before using it. Local Langlands/Jacquet–Langlands are downstream).

Finally use §4.4’s `senOperator_zero_iff_finiteInertia`: the following are equivalent for a rational representation: it is Hodge–Tate with every weight zero; its Sen operator is zero; its inertia image is finite; it is potentially unramified. The Hodge–Tate hypothesis includes semisimplicity of the Sen operator. (Fontaine `2004`, §4.4, remark after Lemma 4.4, p.78; BC, Thm. 15.1.7, p.261, for the Sen operator).

**Checks.**

- A split multiplicative Tate curve gives the special parameter above; the nonsplit twist negates arithmetic Frobenius.
- On `φe₁=e₁`, `φe₂=pe₂`, `Ne₂=e₁`, specialness persists after any common slope shift, so requiring slopes exactly `0,1` would define the wrong type.
- A split unramified sum is neither special nor supercuspidal. Over `E=ℚ₃`, trivial inertia, `N=0` and arithmetic Frobenius `[[0,−1],[1,0]]` give an irreducible E-parameter, since `X²+1` has no root in `𝔽₃` and hence, by monic reduction, no root in `ℚ₃`. A root in `ℚ₃` would be integral and reduce to a root in `𝔽₃`. It splits over `E(i)`, so it is not supercuspidal; absolute irreducibility excludes it.
- Unit is pure of weight zero, `ℚ_p(1)` has weight `−2`, and their direct sum is not pure of one weight.
- A nonzero nilpotent Sen block has all eigenvalues zero but fails the weight-zero theorem.
- Crystalline ordinary and supersingular examples separate Hodge data from Newton data.

### 5.5 General residue fields and the tensor torsor

**Finite-type tensor-torsor comparison** (`tensorIsomTorsor`). For an affine group scheme G of finite type over any field F, write `ω_std:Rep_F(G)→Vec_F` for the forgetful functor. For every commutative F-algebra R and F-linear exact faithful tensor functor `η:Rep_F(G)→Proj_R`, take `tensorIsomTorsor` to be MotivesAndAlgebraicCycles §6.8's affine faithfully flat tensor-isomorphism torsor specialized to this category and fibre. Here `Proj_R` consists of finite projective R-modules. Identify the reconstructed group with G through ReductiveGroups Layer 1, and the supplied finite-presentation torsor with SchemeAndStackFoundations §§1.15 and 2.3's common fppf torsor-class carrier. Retain `tensorIsomTorsor_actions` and `tensorIsomTorsor_rightToLeft` as specializations of the supplier's commuting actions and left-action conversion. On every R-algebra S the comparison sends a tensor isomorphism s to itself and preserves `s·g=s∘g`, `h·s=h∘s` and `g·s=s∘g⁻¹`. It preserves scalar extension, tensor isomorphisms of η, finite presentation, the common torsor class and inverse tensor descent recovering η. No smoothness, connectedness or characteristic-zero hypothesis is needed for this specialization. Source: Deligne–Milne, *Tannakian Categories*, Theorem 3.2(a)–(b) and Remark 3.3(b), printed pp.30–31; supplier: MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.

For smooth G and `R=F`, construct `tensorIsomTorsor_galoisClass` by applying PELModuli §M0.9's `smoothAffineTorsor_galoisH1` to the class after `tensorIsomTorsor_rightToLeft`. It is natural under field extension and agrees with pushforward of torsors along homomorphisms of smooth affine finite-type groups. With `s∈P(F^sep)`, use `σ(s)=s·c_σ`, so `c_(στ)=c_σ σ(c_τ)`; changing s to `s·g` gives `g⁻¹c_σ σ(g)`. In the left-action carrier this is `σ(s)=c_σ⁻¹·s`. Source: Milne, *Algebraic Groups* (2017), Proposition 3.50, p.80.

**Checks for the tensor torsor and its class.**

- Taking `η=R⊗ω_std` gives the trivial G_R-torsor with its identity section; the trivial group gives a single tensor isomorphism.
- For `G=GL_n` and `R=F`, the torsor is the frame torsor of an n-dimensional vector space and is neutral. Rank zero uses the trivial group.
- For `G=PGL₂` over a p-adic field, descent from a division quaternion algebra gives a fibre functor with a nonneutral tensor-isomorphism torsor. Faithful flatness supplies local sections, not an F-rational section.
- Replacing `s` by `s·g` replaces `c_σ` by `g⁻¹c_σ σ(g)`; a rational section gives the trivial cocycle.
- For the disconnected smooth group `μ₂/ℚ`, descent from `Spec ℚ(√2)` gives the cocycle `σ↦σ(√2)/√2`, trivial after extension to `ℚ(√2)`.
- For the nonsmooth group `α_p/𝔽_p(t)`, descent along the fppf torsor `x^p=t` gives a tensor-isomorphism torsor, but it has no separable point. Since `α_p(F^sep)=0`, continuous Galois `H¹` cannot classify it; `tensorIsomTorsor_galoisClass` requires smoothness.
- For `G=GL₂`, let `a=[[1,1],[0,1]]` and `b=[[1,0],[1,1]]`. The specialization preserves `(s·a)·b=s∘a∘b`, with `ab≠ba`, and commuting postcomposition by h. Its left-action comparison uses `a⁻¹`; reversing the order would fail this test.

Let `K` be complete discretely valued of mixed characteristic with arbitrary perfect residue field `k` and `K₀=Frac` W(k). Import PadicLocalLanglandsForGL2Qp §0.2’s Colmez–Fontaine equivalence and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3’s dimension test on that carrier; the latter's §R07.4.13 gives Kisin's proof of the equivalence. The supplier’s Hom realization `U(D)=Hom_(Fil,φ,N)(D,B_st)` is contravariant and equals `V_st(D∨)`. Transport it through §R07.3.3’s `dStar_eq_dual`: the covariant realization of `D` is `U(D)∨`. An integral twist makes every filtered object effective; apply the supplier, take this dual and undo the twist. For a rank-one jump `m` and `φ=p^m`, U(D) has weight `m` and its dual has weight −`m`. The `N=0` restriction gives the crystalline equivalence. In particular finite extensions of the completed maximal unramified `ℚ_p` are covered. CF Theorem A, p.2, and Theorem 4.3, pp.23–24, give the same result by a different proof, which is not a second roadmap target here.

The following Checks test the imported general-base equivalence and its source conventions:

**Checks.**

- Rank zero has zero periods and the unique filtration; rank one with jump `m` and Frobenius `p^m` is admissible, over both finite and algebraically closed residue fields.
- The jump-zero line with `φ=pσ` has `t_H=0<t_N=1`, is not weakly admissible and has no admissible realization.
- At `p=2`, the jump-m line with `φ=2^mσ` realizes `ℚ₂(−m)` covariantly and `ℚ₂(m)` under U. Over algebraically closed residue, a jump-zero unit-root line is isomorphic to the unit by solving the Witt-unit Frobenius equation.

For connected reductive `G/ℚ_p`, the new invariants required by §3.6 are: `sigmaConjugacy` on `G(ℚ̆_p)`, its set `B(G)`, the Newton cocharacter `ν_b` characterized in each algebraic representation by isocrystal slopes, and the descent `kottwitzInvariant` of the supplied homomorphism to `π_1(G)_Γ`. Their `newton_conjugate, _representation, kottwitz_functorial`, and `_cocharacter` requires sigma-conjugacy invariance, representation compatibility and `κ(μ(p))=μ^(natural)`. Construct the tensor Newton cocharacter using isocrystal slope decompositions; sigma equivariance of the supplied Kottwitz map gives its descent. Define `B(G,{μ})` by `ν_b≤μ^◇` and `κ(b)=μ^(natural)`. This is a minimal invariant theory; it assumes no moduli stack of bundles. (Wintenberger, §4.5.1, pp.1329–1330, with the Kottwitz and Rapoport–Richartz results cited there).

Target `localTorsorKottwitz` belongs to this layer. Let `F/ℚ_p` be any finite extension, including `p=2`, G/F a connected reductive group and `Γ_F=Gal(F̄/F)`. With the algebraic fundamental group from ReductiveGroupsPartII §RG2.1.5, construct a canonical pointed bijection

`α_(F,G):H^1_(cont)(Γ_F,G(F̄)) ≃ (π_1(G)_(Γ_F))_(tors).`

Here G(F̄) has its discrete Galois topology and `H¹` is the nonabelian pointed set of algebraic G-torsors, not cohomology of G(F) with trivial action; coinvariants are taken before torsion. API: `localTorsorKottwitz_neutral, _neutral_iff, _functorial, _torus` sends the trivial torsor to zero, detects triviality, commutes with extension of structure group along F-homomorphisms of connected reductive groups, and agrees for tori with local Tate–Nakayama duality. No group operation on nonabelian cocycles is assumed. Source: Kottwitz, *Stable trace formula: elliptic singular terms*, §1.1 and Theorem 1.2 with proof, published pp.368–370. That theorem identifies `H¹(F,G)` with the character dual of `π₀(Z(Ĝ)^Γ_F)`; the character lattice of the diagonalizable fixed center is `π₁(G)_Γ_F`, so its component group gives precisely the displayed torsion subgroup. Start with the torus duality and the case of simply connected derived group, where the derived `H¹` vanishes over p-adic `F`. Pass to general `G` through a z-extension by an induced torus, using the lifting argument of the cited proof; independence follows by comparing z-extensions. Twisting the kernel argument gives injectivity, and elliptic maximal-torus lifts give surjectivity. The theorem's compatibility with normal homomorphisms and maximal-torus inclusions gives the functorial API: every local torsor class lifts from a maximal torus, and the image of that torus lies in a maximal torus of the target. ReductiveGroupsPartII §§RG2.1.5 and RG2.4.3 supply `π₁`, the point Kottwitz map and averaged cocharacters for the subsequent invariant comparison; they do not supply this torsor theorem.

**Checks for local torsors.**

- For the trivial group and for a simply connected semisimple `G`, `π₁(G)=0` and the sole class is neutral. This includes rank zero; connected reductive is essential to the statement.
- For `G_m` and `GL_n (n≥1)`, the coinvariants are `Z`, whose torsion subgroup is zero, so all torsors are trivial. `GL_0` is interpreted as the trivial group, not as a group with `π₁=Z`.
- For `PGL₂`, `π₁=Z/2` and the division quaternion algebra gives the nonneutral class, also over a 2-adic field. The coordinate check `1≠0` and `2·1=0` in Z/2 prevents replacing the target by its rationalization. Its two possible difference signs agree modulo `2`, so the separate `GL₁` witness below is still needed to fix the sign.
- For the norm-one torus of a quadratic extension `L/F`, `Γ` acts on `X_*=Z` by −1. The relation is `1−(−1)=2`, so coinvariants are Z/2, while invariants are zero; `H¹(F,T)=Fˣ/N_(L/F)Lˣ` has two elements by local reciprocity. Thus replacing coinvariants by invariants loses a torsor. This applies to ramified and unramified quadratic extensions at `p=2`.

For `K/ℚ̆_p` finite and a weakly admissible `(b,μ)` for connected reductive `G/ℚ_p`, the general-base equivalence constructs a rational exact faithful tensor fibre functor `ω_(b,μ)`. The specialized `tensorIsomTorsor` from MotivesAndAlgebraicCycles §6.8 represents `Isom^⊗(ω_std,ω_(b,μ))` by an algebraic G-torsor, and `tensorIsomTorsor_galoisClass`, using PELModuli §M0.9's comparison, gives its continuous cocycle class with discrete coefficients `G(ℚ̄_p)`. Target `periodTorsor_class` identifies `Isom^⊗(ω_std,ω_(b,μ))` in `H¹(ℚ_p,G)` with the torsion element `κ(b)−μ^natural` under this layer's `localTorsorKottwitz` specialized to `F=ℚ_p`. Consequently `periodTorsor_neutral` gives a rational tensor trivialization when `[b]∈B(G,{μ})`, and then a crystalline `G(ℚ_p)`-representation unique up to conjugacy. To prove continuity, choose ReductiveGroups Layer 1’s faithful finite-dimensional algebraic representation `G↪GL(W)`. Its realized `G_K`-action is continuous by the general-base equivalence; the closed immersion gives G(ℚ_p) its subspace topology in GL(W)(ℚ_p), so the tensor action is continuous in G(ℚ_p). This p-adic topology differs from the discrete coefficient topology used for the torsor cocycle. Its proof compares the two fibre functors after reduction to simply connected derived group and the torus quotient, then uses compatibility with slope-zero inner twisting. Source: Wintenberger, §4.5.2, pp.1330–1331, Prop. 4.5.3 and its corollary/proof, pp.1331–1332; CF, introduction, p.4. The difference lies in `π₁(G)_Γ`, is torsion under weak admissibility and uses the positive point normalization `κ(μ(p))=μ^natural` stated above.

**Checks.**

- For `G=𝔾_m`, `b=p^m`, `μ(z)=z^h`, equality of invariants is `m=h`. The invariant difference for `m=1,h=0` is +1; this input fails weak admissibility and has no period torsor from the theorem.
- For `G=GL_n`, the invariant is the determinant valuation and the torsor is neutral, while the Newton bound still tests every partial sum. For `n=0`, use the trivial group and its unique torsor.
- A chosen trivialization changed by `g∈ G(ℚ_p)` conjugates the representation. In `GL_2`, slopes `(1,0)` and a jump-one slope-zero line violate weak admissibility despite determinant equality.

### Examples

The Tate curve computes `φ`, `N`, filtration, weak admissibility, arithmetic Weil Frobenius and the nonsplit quadratic twist in one basis. Rank-one unramified twists test inversion of `φ`; rank-two slope shifts test that the type predicates are independent of normalization.

### Dependencies

Layer 4 supplies differential realizations and interpolation. NoncommutativeAndEquivariantIwasawa §F.6 stage 3 supplies `N_dR(V)` with its uniqueness, localization and twist/tensor/dual API, and `deRham_iff_potentiallySemistable`; §5.1 adds its interpolation presentation. PadicDifferentialEquationsAndRigidCohomology supplies the Robba slope filtration used in §5.2. Layer 4 adds integral descent and cyclotomic adapters to LocalGaloisDeformationRings §0.4’s rational étale equivalence. ClassFieldTheory supplies Weil groups and arithmetic residue Frobenius; ArithmeticGaloisRepresentations supplies the Weil–Deligne carrier. NoncommutativeAndEquivariantIwasawa §F.6's generic period prefix supplies `D_pst`, the potentially semistable realization and its de Rham composite with native absolute monodromy. Section 5.3's completed-constants, normalized-output and coefficient-component comparisons use these supplied maps. Layer 3 imports filtered linear algebra; PadicLocalLanglandsForGL2Qp §0.2 supplies general-base admissibility, with Kisin's proof in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13. ReductiveGroups Layer 1 supplies reconstruction and faithful algebraic embeddings; ModularCurves §0E supplies effective affine descent, and SchemeAndStackFoundations §§1.15 and 2.3 supplies torsors and their common class carrier. MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8 supply neutral reconstruction, tensor-isomorphism torsors, their actions, right-to-left conversion and tensor descent; §5.5 identifies their finite-type specializations. PELModuli §M0.9 supplies `smoothAffineTorsor_galoisH1` and its inverse `galoisH1_equiv_torsorClasses`; their composite `tensorIsomTorsor_galoisClass` belongs to §5.5. ReductiveGroupsPartII §§RG2.1.5 and RG2.4.3 supply algebraic `π₁`, the point Kottwitz map and averaged cocharacters. The filtered-module modification, filtration reconstruction, period normalization comparisons and `localTorsorKottwitz` belong here.

## Layer 6: Integral bridges, ordinary representations and small weights

### 6.1 The rational Fontaine–Laffaille comparison and its signs

Let `K=K₀=W(k)[1/p]` be absolutely unramified. Import the Fontaine–Laffaille categories, divided Frobenius maps, strongly divisible lattices and integral period ring Ŝ from FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.3.5–R07.3.17. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.15–R07.3.17’s period subring `Ŝ_K`, its filtered embedding and rational realization on weakly admissible `D` with `Fil⁰D=D` and `FilᵖD=0`. The same supplied functor specializes to finite residue fields; its interval and covariance conventions are fixed below. The following formula describes that supplied contravariant functor:

`U_(Ŝ_K)(D)=Hom_(φ,Fil)(D,Ŝ_K) ≃ Hom_(φ,Fil)(D,B_cris) =V_(cris)(D)^*.`

Its exactness, full faithfulness, dimension and contravariant crystalline inverse, including `p=2` and arbitrary perfect `k` in the Fontaine–Laffaille source, are imported. The supplied filtered embedding `Ŝ⊆A_cris` identifies Ŝ with the p-adic completion of `W(R)[ξᵖ/p]`, checks its induced filtration, and shows that every filtered Frobenius-compatible map into `B_cris` actually lands in Ŝ[1/p]. Frobenius regularization through `B_max⁺` supplies that assertion, using `φ²` instead of `φ` at `p=2` as in §0.4; the integral supplier's dimension theorem then gives the comparison. (FL, Prop. 7.17, Remark 7.18(a), Thm. 8.4(ii), pp. 594–596; BI, §II.3.4, p. 15. These assertions hold for `p=2` as well).

In the present covariant convention a jump `i` of `D` corresponds to weight −`i` of `V_cris(D)`, whereas U(D) has weight +`i`. Thus an integral object with jumps in [0,p−2] gives a lattice with weights in [0,p−2] under `U`, and its dual has weights in [−(p−2),0]. To apply the theorem to weights in [`c`,c+p−2], first twist `V` by −`c` and use its **contravariant** crystalline module. Its filtration indices are the original indices minus `c`. The new adapter API `fontaineLaffailleWeightDictionary, _dual, _weights, _tateShift, _rankOne` records this covariance dictionary; it does not rebuild the rational realization. (FL, Thm. 0.8(iii), p. 551, and Thm. 8.4(ii), p. 595; BC, §8.3, p. 119).

More generally, if `FilʲD=D` and `Filʲ⁺ᵖD=0`, twist by the rank-one object with jump −`j` and apply the preceding theorem. `D` is admissible and its covariant representation has weights in [−j−p+1,−j]. This supplied theorem is an independent small-weight proof of weak admissibility implying admissibility; the interval has spread at most p−1. (FL, Thms. 0.1 and 8.4(i), pp. 548, 595).

**Checks.**

- The rank-one module with `φe=pⁿe` and jump `n` gives `V_cris=ℚ_p(−n)`, `U=ℚ_p(n)`.
- Its torsion image has inertia character `ωⁿ`.
- A Tate module of good-reduction elliptic type has jumps `−1,0` covariantly, so its dual is the positive-index Fontaine–Laffaille object.
- Jumps 0,p−1 satisfy `Filᵖ=0` and are covered rationally; jumps 0,p do not.
- Zero modules have zero periods, and rank-one objects of arbitrary jump are covered after a common twist.

### 6.2 Lattices, torsion and the endpoint collision

For a strongly divisible lattice `M` with `Fil⁰M=M` and `Filᵖ⁻¹M=0`, put `T(M)=U_Ŝ(M)`. It is a stable `ℤ_p`-lattice in `U_ŜK(M[1/p])`, exact, faithful, rank-preserving and fully faithful contravariantly. Reduction is compatible for every `n≥1`:

`T(M)/p^n≃ U_S(M/p^nM), Hom_(G_K)(T(M)/p^n,T(M')/p^n) ≃Hom_(MF)(M'/p^n,M/p^n).`

Here the torsion `U_S` is defined by the supplier's `Ext¹` construction; replacing it silently by the lattice Hom formula is incorrect. Apply the same results on any common interval of spread at most p−2 by the twist of §6.1. These lattice, rank, exactness, full-faithfulness and reduction results are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.17. The new `fontaineLaffailleLatticeWeightShift` adapter identifies their shifted weights with §6.1’s convention. (FL, Thms. 3.3 and 6.1, Prop. 7.15 and §§7.14–7.18, pp.562–563, 581–582, 593–594).

At spread p−1, exactness, faithfulness and rank preservation still hold. Full faithfulness on lattices and torsion holds on either of the two restricted subcategories: reduction has no nonzero quotient concentrated at index p−1, or no nonzero subobject concentrated at index zero. These are sufficient subcategory hypotheses; no claim is made that they characterize every individual pair on which Hom comparison happens to hold. Rational full faithfulness needs neither restriction. (FL, §0.9, pp. 551–552, Thm. 6.1 and Prop. 7.15(ii), pp.581–582, 594).

The obstruction is explicit. The simple rank-one torsion objects with jumps 0 and p−1 have the same trivial Galois image because `ωᵖ⁻¹=1`, yet have no nonzero maps between them. In one direction filtration preservation forces zero; in the other the divided Frobenius at index zero forces zero. Their lifts `ℤ_p` and `ℤ_p(p−1)` are nonisomorphic characters with isomorphic mod-p reductions. Rational full faithfulness still holds. For `p=2` the short interval [0,p−2] is just {0}; it does not contain weight one. (FL, §0.9, p. 551).

**Checks.**

- For `p=3,5,7,11` the exponents 0,…,p−2 give distinct powers of the mod-p cyclotomic character, while exponents zero and p−1 agree; verify this by evaluating at a generator of `F_p×`.
- On the rank-one lattice at jump `n`, T(M)/p is `F_p(ωⁿ)`.
- `Hom_G(ℤ_p,ℤ_p(p−1))=0` whereas Hom of their reductions is `F_p`.
- For good-reduction elliptic curves at `p≥3` the filtered Dieudonné lattice supplies the weight-0,1 example and computes Hom of reductions.
- At `p=2` use the height-one integral theory instead.
- No essential-image classification of all lattices is inferred solely from the displayed full-faithfulness theorem; that stronger classification is a supplier contract.

### 6.3 Ordinary filtrations and semistability

For finite `K/ℚ_p` and `E/ℚ_p`, `IsOrdinary` means there is a decreasing exhaustive separated filtration by `G_K`-stable E-subspaces with inertia acting on grⁱ through `χⁱ`. Thus higher weights occur in subobjects. API: `IsOrdinary.subquotient`, `.dual`, `.tensor`, and `.hodgeTateWeights`: induced filtrations, the dual filtration `(Fil¹⁻ⁱV)⊥`, and convolution for tensors. Each graded piece may have dimension greater than one and an arbitrary unramified Frobenius action; ordinarity is not the existence of a complete flag by characters. (B02, proof of Cor. 6.3, p. 63, following Perrin-Riou; BC, Thm. 8.3.6, pp. 120–121).

A de Rham extension of semistable representations is semistable: after semistabilization by NoncommutativeAndEquivariantIwasawa §F.6 stage 3's `deRham_iff_potentiallySemistable`, finite inertia descent acts unipotently, hence trivially in characteristic zero. Unramified descent recovers the full `K_0`-module; do not trivialize its semilinear unramified action. For de Rham `V` with all weights `≥1`, prove `H^1(K,V)=H^1_g(K,V)` using the positive filtration, nonzero-twist `C`-cohomology vanishing and complete inverse limits to lift an invariant unit. Induct on the ordinary filtration, using Hom between higher-dimensional unramified graded pieces, to obtain semistability and the asserted weights. (B02, Thm. 6.2, Cor. 6.3 and Lemma 6.5, pp. 62–63).

**Checks.**

- `ℚ_p(n)` has one ordinary jump `n`; every unramified representation has just the zero jump.
- The Tate curve is ordinary and semistable but not crystalline.
- A Kummer extension of `ℚ_p` by `ℚ_p(1)` is crystalline precisely when its class is in the rationalized unit subgroup, and otherwise can still be ordinary semistable.
- A non-de Rham reverse extension with weight-zero subobject and weight-one quotient has the wrong order and is not ordinary.
- A good supersingular elliptic Tate module is not ordinary: its distinct weights cannot be realized by a stable ordinary flag.
- Duality reverses weights and subobject order; rank zero is ordinary.

### 6.4 Rank two, residual lifting and the Barsotti–Tate branch

For crystalline rank-two `V` over `ℚ_p` with E-coefficients and weights 0,r, `r≥1`, form `D*=D_cris(V∨)`. Its Frobenius polynomial is integral with constant term of valuation `r`. `V` is reducible, equivalently ordinary with an unramified quotient, exactly when that polynomial has a unit root. Split sums are included; the polynomial alone does not distinguish a split sum from the nonsplit representation with the same eigenvalues. For semistable noncrystalline `V` with these weights, the covariant slopes are −(r+1)/2 and −(r−1)/2. Reducibility, equivalently ordinarity, occurs precisely when `r=1`. Oddness of `r` follows only with `ℚ_p` coefficients, where the relevant eigenvalues lie in `ℚ_p`; it is false with arbitrary `E`. (BC, Thm. 8.3.6, Remark 8.3.7, Prop. 8.3.8 and Lemma 8.3.9, pp. 120–126).

Apply LocalGaloisDeformationRings §0.3’s `OrdinaryPeriodComparison` and `RankTwoOrdinaryEndpoints` to the following field specializations, retaining a chosen stable `O_E`-lattice T, its identified reduction, a chosen residual unramified quotient and the prescribed determinant `δ=det T`. These common implications and the connected–étale representation adapter are supplied there. Over a finite unramified `F/ℚ_p`, a residually ordinary crystalline lift of parallel weights 0,k−1 is ordinary for `2≤k≤p`; the same holds at `k=p+1` when `F=ℚ_p`. A weight-two semistable noncrystalline lift is ordinary. For the weight-two potentially crystalline branch use the connected–étale statement below: it gives potential ordinarity, and gives an ordinary unramified quotient downstairs when its descended étale quotient reduces to the specified residual unramified quotient. A nonsplit residual representation with unique rank-one quotient satisfies this compatibility. Residual ordinarity here means the existence of an unramified quotient of the chosen stable-lattice reduction; by itself this is insufficient for the stronger downstairs conclusion in this branch. (KW2, Def. 3.4 and Lemma 3.5, pp. 22–23. The first branch uses the restricted integral endpoint theorem. For the extra `ℚ_p` endpoint, use Berger–Li–Zhu, Cor. 4.1.3(1), Remark 4.1.2(1) and Prop. 4.1.4(1), §4.1, linked-PDF pp.10–11: for `k=p+1` and nonunit `a_p`, the reduction agrees with `V_(k,0)`, whose induced niveau-two character has exponent `p`, not divisible by p+1, hence is irreducible. The rank-two crystalline classification above then excludes a nonordinary lift of a residually ordinary representation. The potentially crystalline calculation uses Conrad–Diamond–Taylor, Lemma 2.1.2, author-version pp.8–9, under its actual hypotheses. KW-II Lemma 3.5(iii), read with only the residual-quotient definition just given, is too strong; the split counterexample below explains the necessary qualification. The group-level input is specified next; its local representation adapter is part of the supplied `RankTwoOrdinaryEndpoints` contract. The corresponding global modularity arguments are outside this roadmap).

Import FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.19’s `tameConnectedEtaleRankOne` under the following exact hypotheses. Let `F₀/ℚ_p` be finite unramified, `L=F₀(μ_p)`, `A=O_L` (absolute ramification `e=p−1`), O' the integers of `E`, `λ` its uniformizer, and `Γ/A` a p-divisible group with O'-action. Suppose `M=T_pΓ` is free of rank two over O', det `M|I_L=χ_p`, and `M/λM` has a nonzero `G_L-fixed` vector. Then the connected–étale sequence has O'-ranks `(1,1)`, with `I_L` acting by `χ_p` on `M⁰` and trivially on `M^et`. This is the group-level calculation in CDT Lemma 2.1.2; it does not require the global deformation-ring conclusion or `End=k` once the displayed group and determinant hypotheses are assumed. API: `_rank, _inertia, _dual, _descent, _residualQuotient` records ranks, inertia, duality, canonical descent and the reduction of the étale quotient.

The following describes the supplied group-level proof, used by `RankTwoOrdinaryEndpoints`. If `Γ` is connected, a fixed nonzero `λ-torsion` vector gives a generic `μ_p` subgroup, since `μ_p⊂L`. Use the lower finite-flat order-p classification at `e=p−1`: the closure inside the connected p-torsion is `μ_p,A`. Its Cartier dual makes `Γᴰ[p]` nonconnected. The connected–étale sequence for `Γᴰ`, together with determinant `χ_p`, then has a nonzero rank-one connected part on which inertia is `χ_p`; dualizing gives a nonzero unramified quotient of `M`, contradicting connectedness via the lower fully faithful p-divisible realization. Thus `M^et≠0`. Determinant `χ_p` excludes étale rank two, proving ranks `(1,1)`. With ramified O' use the isomorphism `(M/pM)[λ]≅M/λM` (multiplication by `λ^(v_λ(p)−1)`, up to a unit). The O'-linear Tate dual identification uses a choice of generator of the inverse different; do not replace it by an equality of integral lattices. These are exactly the points in CDT’s proof, pp.8–9. At `p=2`, `e=1` and `μ₂` is already rational; use the all-p order-p/height-one supplier, rather than an odd-p Fontaine–Laffaille shortcut.

For the potentially Barsotti–Tate application of `RankTwoOrdinaryEndpoints`, let F be finite unramified over `ℚ_p`, T a stable rank-two `O_E`-lattice in a weight-two representation crystalline over `ℚ_p^nr(μ_p)`, and `q̄:T/λT↠k_E(η̄₀)` a chosen unramified quotient. Choose a finite unramified `F₀` over the original unramified `F` so that `V|G_L` is crystalline and the residual diagonal characters are trivial on `G_L`. Assume det `V|I_L=χ_p`; for a general determinant include the finite character in the hypotheses and kill it on this `L` before applying the group lemma. The lower height-one theorem realizes the actual stable lattice by `Γ` with O'-action; full faithfulness transports the coefficient action and Galois descent datum. Its canonical connected part descends, so `V` has a line of weight one and a quotient `η` with `η|I_L=1`. Thus `η|I_F` is tame of order dividing p−1. To conclude `η|I_F=1`, require the reduction of the actual map `T↠T^et` to agree with q̄ up to an isomorphism of residual rank-one quotients. Reduction is injective on prime-to-p roots of unity, so this hypothesis kills `η`’s tame inertia. If the residual representation is nonsplit with unique quotient, compatibility is automatic. For split residual data it is a genuine extra condition. This is the supplied field, determinant, coefficient and quotient adapter. The application retains the actual quotient map, rather than only the existence of some residual unramified quotient.

For each finite `K/ℚ_p` and every `p`, including `2`, the height-one integral supplier gives: `V` is crystalline with weights in {0,1} iff `V=V_p(G)` for a p-divisible group `G/O_K`. Consequently `V` is potentially Barsotti–Tate iff it is de Rham with these weights and its potentially semistable monodromy is zero. Use the integral theorem for all `p=2` groups. Fontaine–Laffaille supplies an alternative in the unramified case `p≥3`; ramification or `p=2` requires the Breuil–Kisin branch. (Tong Liu, *The correspondence between Barsotti–Tate groups and Kisin modules when `p=2*`, Thms. 1.0.1 and 2.2.1, published pp.662, 666; FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.4.1–R07.4.13).

At weights 0,p−1, rational Fontaine–Laffaille still applies, but lattices with both endpoint constituents require the restricted subcategory or the integral supplier's stronger classification. At weights 0,p its rational Fontaine–Laffaille functor is undefined: `Filᵖ≠0`. The rational unit-root criterion remains valid, and the residual-ordinary implication over `ℚ_p` uses the additional reduction theorem above. The alternative weight-two semistable lift used for residual Serre weight p+1 is handled by the weight-two branch, not by pretending the original weights fit the short interval. (FL, §§0.8–0.9, pp.551–552, Thms. 3.3 and 6.1, pp.562–563, 581–582; KW2, Lemma 3.5(i), pp.22–23).

**Checks.**

- The Tate curve has `r=1` and nonzero `N` and is ordinary.
- The polynomial `X²−a_pX+p` has a unit root exactly when `a_p` is a p-adic unit.
- Over coefficients containing √p, consecutive half-integral semistable slopes can occur, so no general odd-r conclusion is allowed.
- `ℚ_p(p)⊕ℚ_p` has polynomial (X−1)(X−pᵖ) on D* and is an ordinary example outside the Fontaine–Laffaille range.
- `ℚ_p(1)` comes from `μ_p∞`, `ℚ_p` from `ℚ_p/ℤ_p`, and good-reduction elliptic Tate modules come from their p-divisible groups.
- A Tate curve has the same weight set but nonzero `N` and is not potentially Barsotti–Tate.
- Residual ordinarity without the stated field, weight and crystalline hypotheses gives none of these lifting conclusions.
- At `p=5` let `ω̃` be the Teichmüller lift of the mod-5 cyclotomic character. `V=(χ₅ω̃⁻¹)⊕ω̃` has determinant `χ₅`, weights `1,0` and becomes `χ₅⊕1` over `Q₅(μ₅)`. Its reduction `1⊕ω` has an unramified quotient, but neither characteristic-zero quotient is unramified: one has nontrivial wild inertia, the other nontrivial tame inertia. Thus the unqualified potentially crystalline residual-ordinary implication is false.
- In that example the connected–étale quotient reduces to `ω`, not to the specified residual quotient 1. This is precisely the missing adapter hypothesis.
- At `p=2` the tame quotient `I_F/I_L` has order one; no such nontrivial tame character survives. The group proof still requires the actual lattice and determinant hypotheses.

### Examples

Rank-one characters show the duality and endpoint collision without matrices. The Tate curve distinguishes ordinary semistable from crystalline and potentially Barsotti–Tate. The good-reduction polynomial tests the unit-root criterion, while the weights 0,p example separates rational admissibility from the integral Fontaine–Laffaille range.

### Dependencies

Layers 3 and 5 supply the rational admissibility dictionary, potential semistability and parameter conventions. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies the integral categories, their period functors, restricted torsion full faithfulness, crystalline lattices, height-one p-divisible-group classification including `p=2`, and the reduction calculations specified above. LocalGaloisDeformationRings §0.3 supplies `OrdinaryPeriodComparison` and `RankTwoOrdinaryEndpoints`, including the connected–étale descent and compatible-residual-quotient conclusions applied in §6.4. Layer 4 supplies the Wach comparison. No global ordinary lifting theorem is a prerequisite here.

## Layer 7: Relative de Rham objects and period equivalences

### 7.1 Horizontal lattices and filtered connections

Let `X` be smooth over a complete discretely valued `k/ℚ_p` with perfect residue field. A `BdRPlusLocalSystem` is a locally finite free sheaf over `B_dR⁺` on `X_proét`. An `OBdRPlusConnection` is a locally finite free structural-period module with an integrable Leibniz connection. Extension of scalars and horizontal sections are inverse equivalences. API: `ofLisse, tensor, dual, gr0`, and `pullback`: rationalized lisse coefficients, tensor and dual, reduction M/tM of the same rank, and smooth-space pullback. Formal Taylor expansion over the characteristic-zero power-series chart proves enough horizontal sections. (S13, Def. 7.1 and Thm. 7.2, pp. 41–42).

Use AInfCohomology §AI.3.1’s vector-bundle change-of-site equivalence for the uncompleted `O_X` on the analytic, étale and pro-étale sites. This excludes the completed structure sheaf. Define `FilteredConnection` as such a vector bundle `E` with a decreasing exhaustive separated filtration by local direct summands, an integrable connection, and Griffiths transversality. Its `deRham` complex has degree-a term `E⊗Ωᵃ` and Filᵐ term `Filᵐ⁻ᵃE⊗Ωᵃ`. API: `tensor, dual, shift, Associated`, and `pullback`: convolution, orthogonals, `Filⁱ(E[n])=Filⁱ⁺ⁿE`, and a horizontal filtered isomorphism after extending to `OB_dR`. (S13, Lemma 7.3 and Defs. 7.4–7.5, p. 42).

Set `associatedLocalSystem(E)` equal to `Fil⁰(E⊗OB_dR)^(∇=0)`. It is a `B_dR⁺-local` system, and `E` is recovered with filtration and connection by `ν_*(M(E)⊗OB_dR)`. API: `recover, fullyFaithful, map`, and `shift`: full faithfulness, pullback compatibility and `M(E[1])=tM(E)`. Induct on filtration length using filtered Poincaré. (S13, Thm. 7.6 and Lemma 7.7, pp. 42–44).

For `M₀` arising from `E` with trivial filtration, the boundary of `0→E⊗Ô_X(1)→M₀/t²M₀→E⊗Ô_X→0`, under `R¹ν_*Ô_X(1)=Ω¹`, is `**−∇**`. The lattice M(E) is uniquely determined inside `M₀[1/t]` by

`(M(E)∩ t^iM_0)/(M(E)∩ t^(i+1)M_0) =Fil^(−i)E⊗𝒪̂_X(i).`

Use `Ext¹(F₁,F₂⊗Ô_X(k))=Hom(F₁,F₂⊗Ω¹)` for `k=1` and zero for `k≥2`, and the Ext injections for the successive lattices. Tensor convolution and the unique lattice characterization prove `M(E⊗E′)=M(E)⊗M(E′)`, `M(E∨)=M(E)∨` and `M(O_X)=B_dR⁺`. (S13, Lemma 7.8, Prop. 7.9 and Lemma 7.10, pp. 45–46).

**Checks.**

- Unit gives `B_dR⁺` and its structural scalar connection.
- A filtration jump −1 gives `tB_dR⁺` and hence the local system `ℤ_p(1)⊗B_dR⁺`; the opposite filtration gives `t⁻¹B_dR⁺`. `Ô_X` as a `B_dR⁺`-module is t-torsion and fails local freeness.
- On the torus, `∇e₁=e₂dlog T`, `∇e₂=0` with `Fil¹=Fil²=Oe₁` violates Griffiths transversality.
- With the trivial connection, `grʲDR(O_X)=Ωʲ[−j]`.
- The boundary sends a function `T` to −dT; it sends the column vector `e₁` in the preceding two-line connection to `−e₂dlog T`.
- Using `+∇` changes this nonzero coefficient.
- Tensoring the jumps −1 and 1 returns the unit lattice.
- The completed line `Ô_X(1)` does not descend to an `O_X-bundle`, since its arithmetic `ν_*` vanishes.

### 7.2 Lisse integral coefficients and proper comparison

On a locally noetherian adic `X/ℚ_p`, `LisseZpSheaf` is a sheaf locally isomorphic to `Ẑ_p⊗M` with `M` finitely generated over `ℤ_p`, where `Ẑ_p=lim` Z/pⁿ on `X_proét`. `ofEtale` sends a compatible étale inverse system to lim `ν*L_n`; this is an equivalence and Rʲlim `ν*L_n=0` for `j>0`. API: `tensor, rational, tate`, and `pullback`: `Ẑ_p(n)=lim μ_pⁿ` tensor powers. The usual linear dual is available, but tensor duality as a rigid category is asserted only for the finite free subcategory; torsion systems are allowed and rationalize to zero. (S13, Def. 8.1 and Prop. 8.2, p. 48. The local proof uses the `K(π,1)` theorem: connected noetherian affinoids over `ℚ_p` have their p-torsion local-system cohomology computed by the fundamental group; positive-degree classes are killed on a suitable finite étale cover. Source: S13, Thm. 4.9, pp. 25–26).

`LisseZpSheaf.IsDeRham` means `L⊗B_dR⁺=M(E)` for a filtered connection `E`. API: `associated, tensor, point`, and `pullback`: the unique associated bundle, tensor and free dual compatibility, the pointwise classical period functor, and smooth pullback. Torsion has associated bundle zero. (S13, Def. 8.3 and Thm. 8.8, pp. 48, 51–52).

For proper smooth `X` and locally free A, the graded projection comparison
`RΓ(X_k̄,A)⊗_k̄grⁱB_dR≃RΓ(X_k̄,A⊗grⁱOB_dR)`
is a quasi-isomorphism. Use proper coherent finiteness and strict Čech complexes to commute the completed scalar extension with cohomology. For M(E), this gives the filtered `B_dR` comparison with `H_dR(X,E)`, and the graded decomposition with summands `Hⁱ(X,grʲDR(E))⊗C(−j)`. (S13, Thm. 7.11 and Lemma 7.13, pp. 46–47).

For any lisse `L` on proper smooth `X`, Layer 2's primitive `A_inf` comparison, followed by `ξ-adic` limits after inverting `p`, gives `Hⁱ(X_k̄,L)⊗B_dR⁺≃Hⁱ(X_k̄,L⊗B_dR⁺)`. Integral p-power torsion vanishes since `p` is a unit in `B_dR⁺`. If `L` is de Rham with bundle `E`, the filtered comparison is

`H^i(X_(k̄),L)⊗ B_dR ≃ H^i_dR(X,E)⊗_k B_dR, H^i(X_(k̄),L)⊗ C ≃⊕_jH^i(X,gr^jDR(E))⊗_k C(−j).`

The dimension equality proves Hodge–de Rham degeneration. These are Galois-equivariant and strictly filtered, and identify the de Rham periods with `H_dR(X,E)`. (S13, Thm. 8.4 and proof, pp. 48–49).

**Checks.**

- On connected perfectoid `U` and profinite `S`, `Ẑ_p(U×S)=C_cont(S,ℤ_p)`; the identity on `S=ℤ_p` is a section, whereas the pullback of the discrete constant étale `ℤ_p` only gives locally constant maps.
- A chosen cyclotomic generator trivializes `Ẑ_p(1)` on the cyclotomic perfectoid base.
- At a point the de Rham condition is dim `D_dR(L⊗ℚ_p)=rank(L⊗ℚ_p)`.
- A nonintegral analytic power of the pro-p part of `χ` has nonintegral Sen weight and is not de Rham.
- For a genus-`g` proper smooth curve, `H¹` has `C⁽ᵍ⁾⊕C(−1)⁽ᵍ⁾`, so the cohomological weights are `0,−1`.
- For `P¹`, `H²` is `ℚ_p(−1)` and its de Rham line has jump 1.
- The coherent checks on `P¹` give `H⁰(O)=k`, `H¹(O)=0` and `H¹(Ω¹)=k`.
- Properness matters: on an open disc ordinary tensoring of global analytic functions need not give all functions after complete base extension.
- Rank-zero and p-power torsion coefficients have zero rational comparison.

### 7.3 Proper smooth pushforward and de Rham pairs

For a proper smooth `f:X→Y` with toric charts, first prove the completed-tensor formulas on a pro-finite-étale object `U` of the perfectoid toric base. The completed structure ring of `U×_Y X_i` is `Ô_Y(U)⊗̂_(O_Y(Y))O_X(X_i)`; the full toric cover adjoins the remaining p-power roots by completed tensor product. The integral base map is flat up to a bounded p-power; coherent Čech differentials have closed image by proper finiteness. The graded structural period ring on these charts is the polynomial ring in the **base** logarithmic variables over that completed tensor product, with no higher cohomology. Thus the natural derived map

`(Rf_*A)⊗_(𝒪_Y)gr^0𝒪B_(dR,Y) → Rf_*(A⊗_(𝒪_X) gr^0𝒪B_(dR,X))`

is an isomorphism. (S13, Lemmas 8.6–8.7 and proofs, pp. 49–51).

When the relevant `Rⁱf_*L` are lisse, the relative primitive comparison gives `Rⁱf_*(L⊗B_dR,X⁺)=(Rⁱf_*L)⊗B_dR,Y⁺`. If `L` is de Rham with associated `E`, its higher direct image is de Rham with associated `Rⁱf_dR,*E`, locally free Hodge graded pieces and Gauss–Manin connection; the relative Hodge–de Rham spectral sequence degenerates. The filtered derived projection comparison is proved on graded pieces using the preceding coherent result and the relative Poincaré lemma. (S13, Thm. 8.8 and Remark 8.9, pp. 51–52. Lisseness in every degree entering a pairing is a hypothesis here).

A `DeRhamPair` records (L,E,c), with `c` a horizontal strictly filtered `OB_dR-isomorphism` between their period realizations. API: `_hom, _pullback`, and `_point`: uniqueness from `L`, pullback and the classical point comparison. Proper smooth pushforward produces such pairs. Comparison is obtained by completing the two projection maps and then descending the horizontal map. Descent holds because both objects arise from `B_dR⁺-local` systems: their `Fil⁰` horizontal lattices are unchanged by completion. Completion alone does not make the original projections isomorphisms. (Betts–Stix, Defs. 3.6, 3.9, Prop. 3.7, Thm. 3.12, Lemma 3.14 and Remark 3.15, pp. 18–23. Pairings, cup products and cartesian smooth-base change commute with this construction. Sources: Betts–Stix, Props. 3.16–3.17, pp. 23–25).

For an abelian family `f:A→S` with finite locally constant `Rʲf_*Z/pⁿ` in the degrees used, `R¹f_*Ẑ_p` is the **dual** Tate local system. Its bundle is `H¹_dR(A/S)`, with `Fil¹=f_*Ω¹_A/S`, `Fil²=0` and Gauss–Manin connection. Comparison respects homomorphisms, isogenies, base change, cup product, duals and polarizations. For dimension `g` its rank is 2g and both Hodge pieces have rank `g`. (S13, Thm. 8.8 and Remark 8.9, pp. 51–52; Betts–Stix, Props. 3.16–3.17, pp. 23–25).

**Checks.**

- The identity map gives the identity completed tensor formula and projection comparison; the base point gives §7.2.
- Unit pair has trivial filtration, a torsion constant pair has `E=0`, and `ℤ_p(r)` has jump −r.
- For elliptic families `∧²R¹f_*Ẑ_p=Ẑ_p(−1)`, matching `∧²H¹_dR` with jump 1.
- Swapping two odd-degree inputs negates their cup product, so the comparison must retain the cohomological sign.
- For a family of curves, the ascending relative Hodge–Tate filtration has pieces `R¹f_*O_X` and `f_*Ω¹_X/S(−1)`, with its first piece injecting into `R¹f_*Ô_X`.
- A completed map between arbitrary filtered modules does not satisfy the descent theorem without the essential-image hypothesis.

The relative Hodge–Tate filtration in general has graded piece `(grʲRⁱf_dR,*O_X)⊗Ô_S(−j)`, and `Fil₀=(Rⁱf_*O_X)⊗Ô_S` injects naturally into `Rⁱf_*Ô_X`. It is compatible with tensor operations and smooth-base change, under finite local constancy of the required mod-p higher direct images. (Caraiani–S13, Thm. 2.2.2, Cor. 2.2.4 and Prop. 2.2.5, pp. 664–667).

### 7.4 Analytic, diamond and coherent coefficient interfaces

For smooth rigid `S`, analytic and diamond pro-étale `B_dR⁺-local` systems are equivalent, preserving the fully faithful filtered-connection functor. Construct this on perfectoid toric charts using the lower diamond supplier's associated-diamond functor, completed tilt comparison and finite-projective descent. This compares pro-étale sites and coefficient objects. (Howe–Klevdal, §2.5, pp. 18–19).

Over algebraically closed `C`, define `ν*B` using the **completed** structure sheaf for coherent `B` on smooth rigid `X`. Then `Lν*B=ν*B` and `Rⁿν_*ν*B=B⊗Ωⁿ_X(−n)`. For coherent `O_X`-algebras, `ν_*(ν*B)×=B×` and the higher direct images of units are `B⊗Ωⁿ_X(−n)`, `n>0`. The proof resolves `B` by finite free modules on smooth charts, uses almost flatness of toric covers and the projection formula; the units comparison uses the p-adic exponential on `pB⁺` for `p>2` and on `4B⁺` for `p=2`. For proper smooth `X`, smooth `Y` and `π:Y×X→Y`, the completed pullback satisfies `π_*B=H⁰(X,B)⊗_C O_Y,proét`, compatible with smooth-base pullback. The right tensor is finite because `H⁰(X,B)` is finite-dimensional. (Heuer, Prop. 2.9 and equation (6), published pp. 273–275; arXiv v3, pp. 8–10).

**Checks.**

- For `B=O_X` recover the geometric Hodge–Tate formula without an arithmetic `logχ` summand.
- For `X` a point the product formula is the identity.
- The coherent theorem includes torsion sheaves, while the local-system equivalence requires local freeness.
- Replacing pro-étale by `v` fails the flatness assertion at a closed point.
- The `p=2` exponential must use the smaller domain.
- The diamond comparison preserves the shifted Tate lattice, and a zero-rank object stays zero.

### 7.5 Relative analytic periods and chartwise curves

Use PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c's relative period rings on a perfect uniform characteristic-p affinoid `R`, with their Teichmüller expansions, weighted Gauss seminorms, interval completions, bounded and integral subrings, radius-changing Frobenius and rational-localization descent. On a perfectoid chart `Y→X` these are evaluated on its tilt `Y♭`. The notation `relativePeriodSheaf` and its `_restrict, _perfectoid`, and `_ainf` maps denotes their sheafification and supplied restriction maps. On the interval `[s,r]`, its sections on Y are `PG.extendedRobbaAnnulus(O(Y♭),s,r)`, with the same Witt coefficients, radius seminorms and Frobenius. Its positive classical specialization is `A_inf(Y)=W(O_Y♭^+)`, with the same Witt and theta maps as AInfCohomology §AI.3.1. Comparison with derived completion is only almost before rationalization; positive-Witt acyclicity is not assumed. (KL, Def. 5.1.1, pp.113–116, Thms. 5.3.13 and 5.3.16, pp.121–125, Hyp. 9.3.2 and Def. 9.3.3, pp.195–196).

Fix `d>0` and `X` over `Q_(p^d)`, the degree-`d` unramified extension of `ℚ_p`, with its base embedding; write `Z_(p^d)` for its integers. Use `RelativePhiModule = PG.RelativePhiModule` with locally finite-projective underlying module and invertible `φᵈ`-linearization on the actual radius domains. The names `pullback, RelativePhiModule_isEtale`, and `localSystem` denote its supplied pullback, pointwise slope-zero predicate and functor `L↦L⊗Ã`, with Frobenius `1⊗φᵈ`. The pure and étale loci for the full relative Robba sheaf are partially proper opens, independent of the perfectoid lift and taut when `X` is taut. The supplier's §§1.0b, 1.5 identify integral modules over Ã and Ã† with finite locally free `Z_(p^d)`-local systems, inverse `ker(φᵈ−1)`. Rational local systems correspond to étale modules over B̃, B̃† and C̃, or to pointwise semistable degree-zero bundles. A global-ring pure comparison requires the integral model up to isogeny of §1.5; a rational sheaf local system need not admit a global lattice. (KL, Def. 9.3.5, Thms. 9.3.6–9.3.7 and 9.3.12–9.3.13, pp.196–198).

Use the chartwise curve and scheme realization of PhiGammaModulesAndIwasawaCohomology §1.0c, including the graded ring `⊕_(n≥0)C̃^(φᵈ=pⁿ)`, its Proj, the untilt Cartier divisor, completed ring `B_dR⁺` and complementary ring `B_e`. Its finite-projective patching is independent of the divisor equation and preserves pullback. For general `X`, bundles mean compatible chartwise bundles. The classical specialization identifies these localization and completion maps with AInfCohomology §§AI.2.2–AI.2.3; the relative charts and their patching are the supplied ones. (KL, §§8.7, 8.9, Defs. 9.3.9, 9.3.11 and Remark 9.3.10, pp.175–179, 185–188, 197).

Use `RelativeBPair = PG.RelativeBPair`, the finite-projective `B_e` and `B_dR⁺` modules glued by an isomorphism over `B_dR`. Its `pullback` and `RelativeBPair_morphism` are the supplied maps. All relative Robba `φᵈ`-modules, chartwise bundles and relative B-pairs correspond under `PG.periodModuleBundleComparison` and `PG.periodModuleBPairComparison`, with their actual localization maps, tensor and dual. The additional classical adapter `RelativeBPair_classical` identifies the equivariant specialization of PG §1.6 with Layer 4: `RelativeBPair_classical(D_rig(V))=(B_e⊗V,B_dR⁺⊗V,can)` with its `G_K` action, and the two scalar extensions to `B_dR` are the same comparison. For general `(φ,Γ)`-modules it identifies the supplied localization square with §4.5's B-pair square, before taking invariants. Prove compatibility with Layer 3's HN normalization: for `deg O(1)=1` and analytic degree divided by d, `deg_curve(E(M))=−d deg_analytic(M)`; ranks, exact sequences, tensors and duals respect this identity. (KL, Remark 6.3.16, pp.140–141, Thms. 9.3.12–9.3.13, p.197, and Thm. 9.5.8 with Remark 9.5.9, p.202).

**Checks.**

- At Spa(C), positive Witt sections are `W(O_C♭)`; modulo `p` one gets the tilted positive ring.
- Unit has slope zero. With `deg O(1)=1`, `φᵈe=pᵈe` has normalized analytic slope 1 and curve slope `−d`; `φᵈe=pe` gives `O(−1)` and analytic slope `1/d`. At `d=2` the first line is `O(−2)`. Zero Frobenius on a nonzero free module fails invertible linearization.
- The constant rank-r integral system gives Ãʳ with coefficient Frobenius.
- A nonzero-slope line still has a bundle and a B-pair but no local system.
- `O(1)⊕O(−1)` has curve degree zero and is excluded by semistability. At `d=1`, `φe=pe` gives analytic degree 1 and curve degree −1; `φe=p⁻¹e` gives the opposite pair.
- Unit B-pair has identity gluing, rank zero gives the zero triple, and zero gluing between nonzero lines is invalid.
- Changing the local equation `t` by a unit preserves the completed ring and its lattice filtration.
- A pointwise slope-zero sheaf without a global integral étale model lies in the sheaf equivalence and is outside the global-ring comparison; rationalization does not supply a missing global lattice.
- On a cyclic p-extension, positive Witt descent can retain `H²(G,O_L⁺)=O_K⁺/Tr(O_L⁺)≠0`; the `_ainf` identification does not assert integral acyclicity.

### 7.6 Relative period cohomology

The notations `relativePhiComplex` and `relativeBPairComplex` are the complexes in PhiGammaModulesAndIwasawaCohomology §1.0c's `relativePeriodDerivedComparison`. They are `[M→M]` in degrees `0,1` with differential `φᵈ−1`, and `[M_e⊕M_dR⁺→M_dR]` with differential `(x,y)↦x−ι(y)`. At finite radius, with `q=p^d` and `0<s≤r/q`, the first is `[M_[s,r]→M_[s,r/q]]`; both Frobenius and restriction land in the common interval `[s,r/q]`. The maps from the infinite-radius and full Robba presentations are the supplier's radius quasi-isomorphisms. Use pro-étale hypercohomology. The names `relativePhiCohomology_H0, _exact, _localSystem` and `relativeBPairCohomology_H0, _exact, _unit` denote its fixed-section/intersection identifications, connecting maps for strict coefficient sequences and local-system comparisons. (KL, Prop. 6.3.19, pp.143–144, Defs. 9.4.1, 9.4.4 and Thms. 9.4.2, 9.4.5, pp.198–200).

Under §7.5's carrier identifications, `relativePeriodDerivedComparison(M)=PG.relativePeriodDerivedComparison(M)` in the derived category of pro-étale sheaves, with the same augmentations and localizations. For every finite-projective module, including nonzero slopes, its chartwise specialization is the supplied roof
`C_φ(M) ←≃─ C_φ(M_∞) ─≃→Q_φ(E) ←≃─Γ(K(E)) ─≃→Q_B(E) ←≃─C_B(E)`.
Here `E=PG.periodModuleBundleComparison(M)`, `M_∞` is its infinite-radius lift, `K(E)=[E(n)^(⊕2)→E(2n)]` for sufficiently large positive n, and `Q_φ,Q_B` are the corresponding total complexes. The unit augmentation uses `(f₁^n,f₂^n)` for homogeneous sections with no common zero, followed by `(−f₂^n,f₁^n)`. Fixed-section inclusion and diagonal restriction are the middle arrows. The B-pair complex is the difference complex of sections over the divisor complement, formal completion and punctured completion. Locally the patching row for finite projective P over a t-separated ring A, with regular divisor equation t, is
`0→P─x↦(x,x)→P[1/t]⊕(P⊗_AÂ)─(x,y)↦x−y→P⊗_AÂ[1/t]→0`.
These are the positive-twist and formal-patching comparisons supplied in PG §1.0c, with common refinements for choices, radius restriction and hypercover descent; completion need not be flat. (KL, Prop. 1.3.6, pp.16–17, Thms. 6.3.12, 8.7.13, Cor. 8.7.14, Lemma 8.9.3, Def. 8.9.4, Remark 8.9.5 and Thm. 8.9.6, pp.140–142, 179, 187–188).

The API `relativePeriodDerivedComparison, _restrict, _radiusRefine, _hypercover, _cup, _twist`, and `_boundary` denote the supplier's restriction, radius, descent and tensor compatibilities on these same maps. Cups use the total Koszul signs, and strict locally split coefficient sequences give the same distinguished triangles and connecting maps. For an integral local system L, its Frobenius realization over Ã† or Ã has the augmentation `L→M`, `v↦1⊗v`, in `0→L→M─φᵈ−1→M→0`. Rationally the same augmentation identifies local-system cohomology over B̃, B̃†, C̃ and the B-pair complex; this is the étale specialization of the all-module roof. It makes no claim of a local-system kernel for a nonzero-slope module. (KL, Thms. 9.4.2 and 9.4.5, pp.198–200).

The additional comparison `relativePeriodDerivedComparison_classical` identifies the equivariant specialization with §4.5's `herrBPairDerived`. If `W(D)=(W_e,W_dR⁺,W_dR)` is the supplied classical B-pair, the required equation is
`RΓ_proét(Spa K,relativeBPairComplex(W(D))) ≃ Tot C_cont(G_K,[W_e⊕W_dR⁺→W_dR])`,
and, after the supplied cyclotomic equivariant descent on the Frobenius side, the relative comparison is `herrBPairDerived(D)`. Prove equality via the degree-zero intersection and the universal `δ-functor` comparison, transporting the degree-one coordinate swap and degree-two minus sign fixed in §4.5. This identifies cups, twists, restrictions, trace and connecting maps with those classical normalizations. (KL, §9.5, especially Thm. 9.5.8 and Remark 9.5.9, p.202; Nakamura, Appendix §5, Thm. 5.11, pp.563–566).

**Checks.**

- The zero module and zero triple have zero hypercohomology.
- At a geometric point the unit integral Frobenius module has `H⁰=Z_(p^d)`, while the unit rational pair has `H⁰=Q_(p^d)`.
- A common section gives the cocycle (x,x); x+y fails on `(1,1)`.
- If the Frobenius differential vanishes on a nonzero acyclic coefficient object, its `H¹` is that object, so omitting degree one is wrong.
- On a two-term scalar module with `φ=2` the differential `φ−1` sends 1 to 1; using `1−φ` sends it to −1 and changes the connecting-map normalization, even though kernels agree.
- In the positive-twist resolution, `n=0` gives `(1,1)` followed by `(−1,1)`, with zero composite; it resolves `E` but its terms need not be cohomologically acyclic, so the large-`n` hypothesis cannot be dropped.
- In the local patching row, `P→P[1/t]⊕P⊗Â` is diagonal; its composite with x−y is zero. For `t` a unit the completed term is zero and the row reduces to the identity on `P[1/t]=P`.
- A slope-one line is included in the roof even though it has no local system. Its comparison uses the curve/patching resolution, not an asserted Frobenius exact sequence with a finite-dimensional kernel `V`.
- For total bidegree `(1,1)`, the two internal differentials acquire opposite signs; omitting `(−1)^i` makes their square twice the mixed composite at characteristic zero.

### Examples

A family of elliptic curves tests the Gauss–Manin connection, the dual Tate system and the degree-two Tate line. The nonintegral cyclotomic character distinguishes a local system from a de Rham one. Relative slope-one lines and degree-zero unstable sums distinguish the full B-pair equivalence from the étale subcategory.

### Dependencies

Layers 0–2 supply scalar periods, corrected structural sheaves, local Poincaré lemmas and the early primitive comparison. AdicEtaleGeometry and ClassicalAdicEtaleCohomology supply the sites, derived images and proper base change; RigidAnalyticGeometry §7.4 and AdicSpacesPartIII §R3.6 supply coherent finiteness and strictness. DiamondsAndVStacks supplies only the associated-diamond and descent interfaces. AInfCohomology supplies its early integral sheaf. PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c, 1.5–1.6 supplies the relative period rings, chartwise curves and patching, slope-zero equivalence, general-module derived descent and equivariant specialization. Sections 7.5–7.6 identify these with the integral Witt, HN and classical p-adic Hodge interfaces; no higher Fargues–Fontaine or vector-bundle roadmap is an input.

## Layer 8: Rational geometric comparison

### 8.1 Proper smooth, crystalline and semistable realizations

Let `K/ℚ_p` be finite, `C` its completed algebraic closure, X/K proper smooth rigid, and `Vⁱ=Hⁱ_et(X_C,ℚ_p)`. Use AInfCohomology §AI.3.1’s `AInf.constant_deRham_comparison`, the natural strictly filtered `G_K`-equivariant map

`V^i⊗ B_dR≃ H^i_dR(X/K)⊗_KB_dR.`

Prove that §7.2’s coefficient construction specialized to the constant system and `(O_X,d)` equals this supplied map: both use the same finite de Rham quotient maps and strict structural Poincaré resolution, before limits and t-inversion. The supplied map identifies `D_dR(Vⁱ)` with `H_dRⁱ(X/K)`, proves `E₁` Hodge–de Rham degeneration and gives `C⊗Vⁱ=⊕_a C(−a)⊗Hⁱ⁻ᵃ(X,Ωᵃ)`. Thus weight −a has multiplicity dim `Hⁱ⁻ᵃΩᵃ`. Algebraic proper smooth schemes use the lower algebraic/analytic étale comparison and coherent de Rham GAGA; this is agreement with the same map, not a second construction. (S13, Thms. 7.11, 8.4 and Remark 7.12, pp. 46–49; Betts–Stix, Props. 3.18–3.19, pp. 25–27).

For a proper smooth scheme or p-adic formal model `𝔛/O_K`, compose AInfCohomology's global crystalline and étale maps over `B_cris` with its residue-field Frobenius bridge. Thus `D_cris(Vⁱ)=Hⁱ_cris(𝔛_k/W(k))[1/p]`, preserving semilinear `φ`, and proves crystallinity. Its extension to `B_dR` is the preceding map; over `K` the crystalline/de Rham identification is Berthelot–Ogus, with the Hodge filtration. There is no degree bound `i<p−1`, no unramifiedness condition and no integral torsion-freeness hypothesis for this rational statement. (Bhatt–Morrow–Scholze, Thm. 1.1(i), p. 2, §13.21 and Thm. 14.6(i), pp. 121–122 of arXiv v3; BC, (7.3.1), p. 97).

For a proper p-adic formal `𝔛` with divisorial log structure and étale charts over `Spf(O_K{t₀,…,t_d}/(t₀⋯t_r−a))`, a a nonzero nonunit allowed to vary by chart, use AInfCohomology's semistable comparison and CrystallineCohomology's normalized Hyodo–Kato realization `H_HKⁱ` over the standard log point. Then

`V^i⊗ B_st≃ H^i_HK⊗_(K_0)B_st`

preserves `φ` and total monodromy `N_HK⊗1+1⊗N_Bst`. Taking invariants gives semistability and `D_st(Vⁱ)=H_HKⁱ`. Its `B_dR`-extension, under the fixed period embedding and compatible Hyodo–Kato map, is the filtered de Rham comparison. Raw uniformizer monodromy must be divided by the absolute ramification index to match `N_Bst(log[p♭])=−1`. Changes of uniformizer change the Hyodo–Kato map and period embedding together. Smooth reduction recovers the crystalline result with `N=0`. (Česnavičius–Koshikawa, §6.7 and Prop. 6.8, pp. 66–68; §9.1, Prop. 9.2, Thm. 9.5 and Remark 9.6, pp. 75–77, arXiv v3).

Every proper smooth rigid Vⁱ is potentially semistable by de Rham comparison and NoncommutativeAndEquivariantIwasawa §F.6 stage 3's `deRham_iff_potentiallySemistable`. A finite Galois semistabilizing extension gives `D_pst` by scalar extension with descent; if a semistable model exists there, it identifies this module with normalized `H_HK`. No semistable-model existence assertion is needed for arbitrary proper rigid `X`. (BI, §II.5.1, p. 19; compare Colmez–Nizioł, Thm. 6.4, pp. 40–42, whose analytic Hyodo–Kato theorem is stronger than the consequence used here).

**Checks.**

- A point has `ℚ_p` with jump zero; `P¹` in degree two has `ℚ_p(−1)`, `φ=p` and jump 1.
- Curves of genus `g` have weights `0,−1` each `g` without any reduction hypothesis.
- A smooth model gives `N=0`; the Tate curve gives rank-one `N≠0`.
- For a Tate parameter `q` over ramification index e, raw cohomological `N(e₁)=v_K(q)e₀` becomes `(v_K(q)/e)e₀`.
- In the dual of §9.2's basis, `e₀↦−y*`, `e₁↦x*` matches `N(x*)=−v_p(q)y*`: both sign and divisor e matter.
- A potentially good additive elliptic curve becomes crystalline but need not be semistable over `K`.
- A ramified quadratic Tate twist stays potentially semistable with nonzero `N`.
- The rational comparison applies at `p=2` and in every degree even if integral crystalline cohomology has torsion.

### 8.2 Functoriality, duality and Tate lines

The actual comparison maps commute with pullback, cup product and finite base extension. For algebraic geometrically connected proper smooth `X` of pure dimension `d`, rational étale Poincaré duality gives `(Vⁱ)∨=V²ᵈ⁻ⁱ(d)`. Its period realization is the dual pairing into the normalized top-degree Tate line. For each available `B`, `D_B(V∨(m))=D_B(V)∨⊗D_B(ℚ_p(m))`; the latter line has `φ=p⁻ᵐσ`, `N=0` and filtration jump −`m`. The top-degree trace normalization is an exact supplier contract: multiplicativity alone cannot determine its scalar. A cohomological projector restricts the comparisons only when the same operator is supplied geometrically on both realizations. (S13, Thms. 7.11, 8.4, pp. 46–49; Česnavičius–Koshikawa, §§4.7–4.8, p. 27, §6.7, p. 66, Thm. 9.5, p. 76; BC, Def. 7.3.4, p. 98).

**Checks.**

- On `P¹`, twisting `H²` by 1 removes the jump and Frobenius factor p.
- On a curve, `H¹∨=H¹(1)`, changing cohomological weights `0,−1` to Tate-module weights `0,1`.
- The zero and identity projectors give zero and the whole realization.
- A common Frobenius polynomial alone supplies no filtered projector.
- Swapping degree-one cup inputs negates the product, and the comparison retains this sign.

For a bounded prism (A,I) with W(A/I) p-torsion-free and a proper smooth formal `𝔛/Spf(A/I)`, target `prismaticSpecializationAgreement` compares the actual crystalline and de Rham specializations, rather than merely their cohomology dimensions. Write `Δ=RΓ_Δ(𝔛/A)`. PrismaticCohomology §§1.21–1.23 supplies the map `Δ⊗̂^L_(A,φ_A)(A/I)≃RΓ_dR(𝔛/(A/I))`; for a crystalline prism (A,(p)) with perfect A/p, §1.14 gives `φ_A*Δ≃RΓ_cris(𝔛/A)`. Identify these targets through the crystalline–de Rham map of CrystallineCohomology §§CR.2.2–CR.2.3 and prove the specialization square commutes as a square of enhanced algebras, with Frobenius, products and pullback. For a mixed-characteristic smooth model in §8.1, use bounded-prism base change and the common PD-envelope maps to identify these crystalline/de Rham maps with the corresponding AInfCohomology §§AI.4.3 and AI.5.1 maps. After period extension their composites are the rational maps of §8.1. Frobenius twists stay on the stated scalar maps throughout. API: `prismaticSpecializationAgreement_crystalline, _deRham, _baseChange, _cup, _rational`. This comparison of specializations is proved here from their common Čech–Alexander and PD-envelope maps. Sources: Bhatt–Scholze, *Prisms and prismatic cohomology*, Theorems 5.2 and 6.4, pp.45 and 53; BMS1, §13 and Theorem 14.6, pp.115–122.

**Checks for prismatic agreement.**

- For the point over a perfect crystalline prism, the maps on constants are `φ_A`-linear on the prismatic side; forgetting that scalar twist fails already for `W(𝔽_(p²))`.
- For `ℙ¹`, the degree-zero unit and degree-two trace line map to the unit and the normalized top Tate line of §8.2; dimensions alone would permit an incorrect scalar on the latter.
- The zero coefficient complex gives zero under each specialization. A smooth proper model with torsion cohomology is included: perfectness of the global complex does not assert freeness of its individual integral cohomology groups.

### 8.3 Abelian varieties and good elliptic reduction

Use NeronModelsAndSemistableAbelianVarieties §5.3’s `AbelianVariety.deRham` and good-reduction `PadicComparison`. The new `abelianCovariantPeriodAdapter` identifies their covariance with §8.1’s geometric maps: for `𝔄/O_K` of dimension `g`, `V_p(A)=H¹_et(A_C,ℚ_p)∨` has
`D_cris(V_p(A))=H¹_cris(A₀/W(k))[1/p]∨` with **inverse-dual** Frobenius. Its de Rham module is `H¹_dR(A/K)∨`, `Fil⁰` is the annihilator of `H⁰Ω¹`, identified with `H¹(O_A)∨`, and `gr⁻¹=H⁰Ω¹∨=Lie(A)`. Each rank is `g` and `t_H=t_N=−g`. The integral `H¹/contravariant` Dieudonné comparison contains the Frobenius pullback in BC, Remark 7.3.3, pp. 97–98; retain it until an explicit semilinear identification is given. No integral lattice identification is asserted.

The supplied de Rham abelian theorem, regardless of reduction, agrees under that adapter with the proper smooth comparison and gives the same de Rham module and the natural decomposition `C⊗V_p(A)=(C(1)⊗Lie A)⊕(C⊗H¹(O_A)∨)`. Thus weights are `0,1` each `g`. The lower arithmetic Weil pairing gives `V_p(A∨)=V_p(A)∨(1)`; a polarization gives a perfect rational alternating pairing into `ℚ_p(1)`. Its integral pairing is perfect only when `p` does not divide the polarization degree. For finite residue field `F_pᶠ`, `det(φᶠ)` on the covariant crystalline realization is `p⁻ᶠᵍ`. (BC, Thm. 7.2.8 and §7.3, pp. 94–98, Example 9.2.8, p. 142; BI, §II.5.1, p. 19, with the ordinary linear dual convention specified above).

For good elliptic reduction `E₀/F_q` put `a=q+1−#E₀(F_q)`. The covariant polynomial is `X²−(a/q)X+1/q` for `φᶠ`. Ordinary reduction, p∤a, has slopes `−1,0`; weak admissibility forces the slope −1 line to have jump −1. Twist it to the unit-root case to realize it as a crystalline character, then lift the inclusion by full faithfulness. Supersingular reduction has slopes `−1/2,−1/2` and no `K₀`-rank-one `φ`-stable submodule: rank-one slopes over `K₀` are integral. Consequently `V_p(E)` is `ℚ_p-irreducible`; absolute irreducibility over every coefficient extension is not asserted. `φᶠ` may be scalar without giving a `φ`-stable line. (BI, §II.3.2, p. 14; BC, Example 8.1.10, Lemma 8.1.11, pp. 107–108, Lemma 8.3.3 and Prop. 8.3.4, pp. 118–119; Katz–Messing, Thm. `1`, pp. 74–75).

**Checks.**

- Dimension zero gives no weights and both numbers zero; products add dimensions and numbers.
- Ordinary and supersingular elliptic modules have identical Hodge data but the two slope patterns above.
- Over `F₅`, `y²=x³+x` has four points and `a=2`; its reciprocal polynomial is `X²−2X/5+1/5`.
- Over `F₃`, `y²=x³−x` has four points and `a=0`; over `F₉` its covariant `φ²` is scalar `−1/3` but still has no semilinear `φ`-line.
- For `g=2,f=2` the determinant is `p⁻⁴`.
- A polarization divisible by `p` can be degenerate mod `p` while its rational period pairing is perfect.

### Examples

`P¹` fixes the cohomological sign, while elliptic curves fix the Tate-module duality and reciprocal polynomial. Tate curves and potentially good additive curves separate semistable, crystalline and potential conclusions. No good-reduction hypothesis is used to obtain the weights of an abelian variety.

### Dependencies

Layer 7 supplies the rational de Rham map. AInfCohomology, §§AI.5.1 and AI.6.4–AI.6.6, supplies the integral-to-rational maps and their agreement. PrismaticCohomology §§1.14 and 1.21–1.23 supplies the crystalline and Frobenius-twisted de Rham specializations and proper smooth perfectness; §8.2 compares their common specializations with the rational maps. CrystallineCohomology §§CR.5.4 and CR.6.1–CR.6.3 supplies finite-dimensional log crystalline/Hyodo–Kato cohomology, ramified base change, product and uniformizer-change maps. RigidAnalyticGeometry §8.4 and AdicSpacesPartIII §R3.7 supply de Rham GAGA; ClassicalAdicEtaleCohomology §§8.2, 9.5 and 9.7 supplies étale analytification and trace normalization. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies height-two Dieudonné slopes and the `H¹` comparison; AbelianSchemesAndArithmeticModuli supplies abelian Hodge sequences. Rational assembly and the model-independent potential conclusion are owned here.

## Layer 9: Kummer extensions, Tate curves and reduction criteria

### 9.1 Continuous Kummer extensions

For `q∈K×` fix compatible p-power roots `q_n` and primitive roots `ε_n`. The coordinates `g(q_n)/q_n=ε_n^(c_q(g))` give a continuous `χ-cocycle c_q(gh)=c_q(g)+χ(g)c_q(h)`. Define `T(q)=Z_pe⊕Z_pf` with `g(e)=χ(g)e`, `g(f)=f+c_q(g)e`, and `V(q)=T(q)[1/p]`. Use the existing finite Kummer cocycle. Import SelmerIwasawaCohomology §§0.6 and 0.8’s `kummerLimit_bijective`, `ℤ_p`-linearity and continuous-cohomology identification on LocalGaloisGroups Layer `7`’s completed multiplicative carrier, and §0.11’s restriction/norm/cup compatibility. Apply ArithmeticGaloisDuality §R02.1.3’s rationalization comparison to obtain `H¹(K,ℚ_p(1))`. Its extension class is `δ(q)`. The adapters here give the valuation/logarithm coordinates `H¹(K,ℚ_p(1))=ℚ_p⊕K` via `(v_p,log_K)` and the explicit Kummer representation matrices. (BC, Lemma 8.3.9 and Example 9.2.8, pp. 125, 142; BI, §II.4.4, pp. 18–19).

API: `kummerCocycleFromRoots, kummerRepOfCocycle, _ext, kummerClass_mul, _restrict, _eq_delta, _pow, kummerChoice_iso`, and `kummerSplit_iff`: continuity, finite-level compatibility, the stated subline and quotient, Baer-additivity, finite-extension restriction and their identity/tower laws. Root change by b adds `(χ−1)b` and gives the unipotent basis-change isomorphism. Framed equality means equal cocycles; extension equivalence means equal `H¹` classes; unframed isomorphism is weaker. `δ(qᵃ)=aδ(q)` for integers a, so for nonzero a the rational representations are isomorphic, though the integral lattices need not be. Rational splitting is `q` torsion. Integral splitting is `q∈∩_n(K×)^(pⁿ)`, which is the prime-to-p roots of unity for finite `K`; p-power torsion can remain integrally.

In column coordinates write `M(a,c)=[[a,c],[0,1]]` and `U(b)=M(1,b)`. The cocycle equation gives `M(a,c)M(b,d)=M(ab,c+ad)`, its determinant is `a`, and root change gives `U(−b)M(a,c)U(b)=M(a,c+(a−1)b)`. These formulas fix the column-action and root-change signs.

**Checks.**

- `M(1,0)=1`, `M(a,0)=diag(a,1)`, `M(a,c)e₁=ae₁` and the second quotient is trivial.
- For `a=2,c=3,b=5,d=7`, the product upper-right entry is 17.
- Root change by 5 when `a=2,c=3` gives 8.
- Permitting an automorphism moving `q` destroys the root-of-unity equation; the group is `G_K`.
- Over `Q₃(ζ₃)`, `q=ζ₃` has nonsplit integral but split rational Kummer extension. `q=p` has valuation 1 and logarithm zero and is rationally nonsplit.
- These separate zero cocycle, coboundary, torsion and unframed isomorphism.

### 9.2 Semistable periods and the Tate normal form

Construct `u_q∈B_st⁺` with `g(u_q)=u_q+c_q(g)t`, `φ(u_q)=pu_q`, `N(u_q)=−v_p(q)`, and image congruent to `log_K(q)` modulo `Fil¹`. The invariants `x=t⁻¹e` and `y=f−u_qt⁻¹e` give

`φ x=p^(−1)x, φ y=y, Ny=v_p(q)x, Nx=0, Fil^0D_K=K(y+log_K(q)x), Fil^(−1)D_K=D_K, Fil^1D_K=0.`

Thus every rational Kummer extension is semistable, `t_H=t_N=−1`, and it is crystalline exactly when `v_p(q)=0`. General `H¹` classes are rational linear combinations of actual q-classes; use Baer sums as subquotients of direct sums, not closure under arbitrary semistable extensions. (BI, §II.4.3–II.4.4, pp. 18–19; BC, Lemma 8.3.9, Example 9.2.8 and Thm. 9.2.10, pp. 125, 142–143. BC's positive-derivative monodromy is translated to `N=−d/du` here).

For `0<|q|<1`, reuse the existing Tate curve and analytic uniformization. Use ArithmeticGaloisRepresentations §6.3’s all-prime Tate-curve torsion and Tate-module exact sequence at ℓ=p. Its chosen-root coordinates are the unique classes `ε_nⁱq_nʲ` with `0≤i,j<pⁿ`; compare these coordinates and their multiplication-by-p transitions with §9.1 to identify the supplied `T_p(E_q)` with `T(q)`, its sublattice and quotient. The new work here is the period and filtered-normal-form comparison on that supplied sequence. The preceding periods make `V_p(E_q)` semistable noncrystalline with rank-one `N`, ordinary of weights `0,1` and never potentially crystalline. Over `ℚ_p` its arithmetic WD Frobenius is diag(p,1), with `FNF⁻¹=pN`. (BI, §§II.4.2–II.4.3, pp. 17–18; BC, Example 9.2.9, p. 143).

A rank-two Tate-type admissible module has a one-dimensional `ℚ_p`-space `D^(φ=1)` generated by `y`, `Ny≠0`, `φ(Ny)=p⁻¹Ny`, basis (Ny,y), and filtration jumps `−1,0` with `Fil⁰` transverse to ker `N`. Define `tateLInvariantOfModule` by `Fil⁰=K(y+LNy)`. API: `_spec` and `_iso`: independence of `y` and classification of these unframed modules by `L`, hence of their realized rational representations by full faithfulness. This classification is unframed and rational. The coordinate `L(v,ℓ)=ℓ/v`, used with `v≠0`, is unchanged by simultaneous nonzero scaling, and `ℓ↦ℓ+bv` adds b. Period-embedding change requires Layer 0's `K₀`-valued branch; the scalar identity allows any b. For the finite-K normal form, commuting with `φ` forces a map to preserve the two distinct slope lines; commuting with `N` fixes their relative scale. An isomorphism therefore carries `y` to a common nonzero scalar multiple of y′ and carries Ny to the same multiple of Ny′, so it preserves exactly the coefficient `L`. Conversely equal `L` gives an isomorphism on this basis. (BI, §II.4.3, p.18, supplies the Tate periods; BC, Prop. 8.3.8 and proof, pp.123–126, gives the corresponding `ℚ_p` classification in its contravariant convention).

The coordinate matrices `Φ(r)=diag(r⁻¹,1)` and `N(v)=[[0,v],[0,0]]`, with filtration vector `(ℓ,1)`, use `r≠0` for Frobenius. They satisfy `N²=0`, `N=0` iff `v=0`, `det Φ=r⁻¹`, `NΦ=rΦN`, and `FN=rNF` for `F=diag(r,1)`. For `v≠0`, the span of `(ℓ,1)` complements `ker N`. For `v,v′≠0`, nonzero `α,β` satisfying `vα=βv′` and `ℓα=βℓ′` exist iff `ℓ/v=ℓ′/v′`. These are field calculations; their period interpretation is only over characteristic-zero p-adic fields.

**Checks.**

- `q=p` gives `ℓ=0`, `Ny=x` and `Fil⁰=Ky`; zero L-invariant does not mean `N=0` or a split extension.
- For `q=pᵐ`, `Ny=mx` and `Fil⁰=Ky`.
- For odd `p` and `q=1+p`, `N=0` and `ℓ≠0` give a nonsplit crystalline example.
- Roots of unity have both rational coordinates zero.
- There are `p²ⁿ` torsion representatives; omitting either zero index gives the wrong count. `q↦qᵖ` scales the extension class and gives a rational isomorphism, not equality of lattices.
- On `(v,ℓ)=(1,2),(2,4)`, both L-invariants are 2 although raw logarithms differ.
- The second filtration coordinate is `1`, ensuring transversality even when `ℓ=0`; `Fil⁰=ker N` would violate weak admissibility.
- At `r=3,v=1`, `NΦ=3ΦN`; transposing `N` fails.
- N(1) is nonzero and square-zero, det `Φ(3)=1/3`, and `F=diag(3,1)` has the opposite normalization.
- The zero monodromy case `v=0` is not a Tate-type object and is excluded from the division/classification assertions.

### 9.3 Good, semistable and multiplicative reduction

**Algebraic p-divisible good-reduction criterion** (`abelianGoodReduction_iff_pDivisibleExtends`). For finite `K/ℚ_p` and an abelian variety `A/K`, good reduction is equivalent to extension of `A[p^∞]` to a p-divisible group over `𝒪_K`, and equivalently to finite flat models `G_n` of all `A[p^n]` with `G_n=G_(n+1)[p^n]`, respecting the generic-fibre identifications. Build this algebraic criterion here independently of the crystalline criterion. Source: Grothendieck, SGA 7 I, Exposé IX, Thm. 5.13, as stated with its p-divisible reformulation in BC, Thm. 7.1.13 and discussion, p.90.

Use NeronModelsAndSemistableAbelianVarieties §§1.7–1.10 and 3.10–3.14 for Néron models, étale base change, finite-extension semistable reduction and Raynaud uniformization. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2, R07.1.8 and R07.1.20–R07.1.22 for p-divisible groups, Tate modules, schematic closures and Tate’s generic-fibre full faithfulness. The remaining algebraic extension and descent argument of SGA 7 IX.5.13 is part of this target: compare the extended p-divisible group with the semistable model after finite extension, exclude its toric degeneration and descend the resulting abelian scheme. Carry the compatible finite flat subgroup schemes and their generic identifications throughout; no p-adic comparison theorem enters this proof. The compatible-model formulation includes the exact p-divisibility sequences, obtained from finite flatness of the stated kernels and their generic ranks.

**Checks for the algebraic criterion.**

- An abelian scheme’s kernels of `[p^n]` form compatible finite flat models of rank `p^(2gn)`, including `p=2`; dimension zero gives the zero p-divisible group and good reduction.
- A split Tate curve has multiplicative reduction, so its generic p-divisible group has no such compatible extension, although its toric and lattice graded pieces separately do.
- For `n≥1`, over `K=ℚ_p(μ_(p^n))` the Tate curve with `q=p^(p^n)` has all its pⁿ-torsion rational, hence a constant finite flat model at that level, but still has multiplicative reduction. One isolated model does not supply the compatible tower and its flat kernels.

For each finite `K/ℚ_p` and every `p`, an abelian A/K has good reduction iff `V_p(A)` is crystalline. The forward direction is §8.3. Conversely its weights are `0,1` by the model-independent de Rham result; the lower height-one theorem realizes the **actual stable lattice** `T_p(A)` by a p-divisible group over `O_K`. Its compatible finite flat pⁿ-torsion models then give good reduction by `abelianGoodReduction_iff_pDivisibleExtends`. Rational isogeny data alone, or a finite flat model at one isolated level, is insufficient for that proof. Potentially good reduction is equivalent to potential crystallinity, equivalently `N=0` on `D_pst`. (BC, §7 opening and Thm. 7.1.13 with its p-divisible reformulation, pp. 83–84, 90; Coleman–Iovita, introductory theorem, p. 3).

Use NeronModelsAndSemistableAbelianVarieties §5.3’s semistable abelian comparison. Its compatibility with this roadmap’s geometric comparison can also be checked from the supplied Raynaud uniformization `A^an=G^an/Γ` with `0→T→G→B→0` and `B` good. Its compatible p-torsion sequences give the Tate filtration `V_p(T)⊂V_p(G)⊂V_p(A)`, with outer graded terms `X_*(T)⊗ℚ_p(1)` and `Γ⊗ℚ_p`. The lattices `X_*(T)` and `Γ` have unramified actions; the first rational graded term is a Tate twist of an unramified representation, and the second is unramified. Both graded terms and `V_p(B)` are crystalline. The whole representation is de Rham by §8.3, so Layer 6’s de Rham-extension theorem applied twice recovers the supplied semistability result. This checks agreement with the supplied semistable-abelian theorem. Finite-extension semistable reduction gives potential semistability. `N=0` is then equivalent to good reduction; the converse semistable-reduction criterion and rank-N/toric-rank formula remain the existing Néron roadmap's subject. (Coleman–Iovita, Introduction, pp. 1–3; BI, §II.5.1, p. 19; B02, Thm. 6.2, p. 62).

For elliptic `E` with `v_p(j(E))<0` apply this layer’s reduction theorem below, on the supplied Tate and twist carriers, to obtain `E=E_q⊗η`. Split multiplicative means `η=1`; nonsplit multiplicative means `η` nontrivial unramified; additive potentially multiplicative means `η` ramified. Then `V_p(E)=V(q)⊗η`. The first two are semistable with `N≠0`. The last has nontrivial WD inertia, hence is not semistable over `K`, but is potentially semistable with `N≠0`. All fail potential good reduction. Over `ℚ_p` the nonsplit case has `φ=diag(−p⁻¹,−1)`, `N` unchanged and arithmetic `F=diag(−p,−1)`. Relate these assertions to the existing minimal-Weierstrass reduction predicates; a nonminimal equation cannot test reduction. (BI, §II.4.1, p. 17, restricted to the split case; BC, Example 9.2.9, p. 143. The reduction theorem `potentiallyMultiplicativeTwistReduction` is this layer’s target below, using the existing EllipticCurves Layers 4–5 Tate and twist carriers).

Target `potentiallyMultiplicativeTwistReduction` is owned here: let `p` be any prime, `K/ℚ_p` finite and E/K an elliptic curve with `v_p(j(E))<0`. On the existing Tate-curve and quadratic-twist carriers, take `q∈Kˣ` with `v_p(q)>0` and `j(E_q)=j(E)`, and a continuous quadratic `η:G_K→{±1}` with `E≅E_q⊗η`. Then `E` has multiplicative reduction iff `η` is unramified, split multiplicative reduction iff `η=1`, nonsplit multiplicative reduction iff `η` is unramified and nontrivial, and additive reduction iff `η` is ramified. Reduction is computed on a minimal integral Weierstrass equation. The target includes existence of this presentation and uniqueness of `η`; `q` is the positive-valuation inverse of the Tate j-series. Since `v(j)<0` excludes `j=0,1728`, geometric automorphisms are {±1}, which gives uniqueness of the twisting character. Source: Mazur–Rubin, *Selmer companion curves*, §2, Definition 2.1 and Proposition 2.2, author-version p.3, for the splitting character and twisted Tate uniformization; the positive-valuation convention `v_K(q)=−v_K(j)` is used in the proof of Lemma 2.5, p.4. The supplied Tate theorem and the following descent argument give the stated reduction equivalences.

`Suggested.lean` states `potentiallyMultiplicativeTwistReduction` on characteristic-zero nonarchimedean local fields, including every finite extension of `ℚ_p` at `p=2`. Its definition `IsTateTwist` uses the existing Tate equation and `quadraticTwistOf`: a unit `d∈Kˣ`, a square root `a²=d` in the algebraic closure with `g(a)=η(g)a`, and a `K`-rational change of variables from the twist with parameters `(0,−d)` to `E`. Thus the twist has quadratic discriminant `4d` and the stated character, also when that character is trivial. The theorem includes the unique positive-valuation Tate parameter, the unique twisting character and all four reduction equivalences on a minimal equation.

If `η` is unramified, over a finite unramified splitting extension `E` is a split Tate curve. By NeronModelsAndSemistableAbelianVarieties §1.10’s étale base change, the Néron identity component descends as a torus, so `E` is multiplicative downstairs, split exactly when `η=1`. Conversely, multiplicative reduction splits after at most an unramified quadratic extension by the existing Tate theorem. Uniqueness of the {±1} twist then makes `η` trivial on inertia. Finally good reduction has integral `j`, because a minimal smooth model has unit discriminant and integral `c₄`. Negative `j` excludes good reduction; the reduction trichotomy therefore makes ramified `η` exactly the additive potentially multiplicative case. This works at `p=2` without dividing an integral equation by 2 or testing a nonminimal twist equation's discriminant. API: `potentiallyMultiplicativeTwistReduction_unramified_iff, _split_iff, _nonsplit_iff, _ramified_iff_additive, _baseChange`. For every finite extension K'/K, `_baseChange` uses q's image in K' and `η|G_K'`, with a newly minimal equation; it asserts the same classification over K', not invariance of additive reduction under ramified base change. EllipticCurves Layers 4–5 supply the existing Tate uniformization and quadratic twists, and NeronModelsAndSemistableAbelianVarieties §1.10 supplies étale base change. The classification and its descent proof are new work of this roadmap.

**Checks.**

- Good supersingular reduction is crystalline despite `ℚ_p-irreducibility`.
- Good reduction has `T=Γ=0` in Raynaud's filtration; the split Tate curve has `B=0`, `X_*(T)=Γ=ℤ` with trivial actions, and graded lines `ℚ_p(1)` and `ℚ_p`. The first has ramified cyclotomic inertia although both are crystalline; the whole extension is noncrystalline.
- The unramified quadratic twist of `E_p` is still semistable; its ramified quadratic twist is not semistable downstairs.
- A potentially good additive curve need only become crystalline after extension.
- A polarization divisible by `p` is still rationally invertible, so it does not invalidate the rational reduction criterion.
- Raw valuation changes after ramification, but normalized nonzero monodromy stays nonzero.
- Over `Q₂` take `q=2` and `η` from `Q₂(i)/Q₂`. Then `v₂(j(E₂))=−1` and `η` is ramified, so the twist is additive downstairs and becomes split multiplicative over `Q₂(i)`. An inertia element with `η=−1` acts in WD by `−I₂`, distinct from `I₂` over `Q₂` although the two coincide modulo 2: `−1≠1` in Q, but `−1=1` in `F₂`. Thus residual inertia cannot decide this reduction type; a short integral Weierstrass formula is not used.
- For the unramified quadratic twist at `p=2`, `Φ=diag(−1/2,−1)` has determinant `1/2` and, with `N=[[0,1],[0,0]]`, satisfies `NΦ=2ΦN`. Its arithmetic inverse is diag(−2,−1); the minus signs do not disappear in characteristic-zero coefficients.
- An unramified quadratic extension does not change a minimal model’s valuations. This is the step that permits unramified descent of multiplicative reduction; an arbitrary ramified extension does not have that property.

### 9.4 Good-place coefficient-prime compatibility

For an abelian variety over a number field and a good place v|p with residue `F_q`, `q=pᶠ`, import its common integral arithmetic Tate-module Frobenius polynomial `P_v` and its ℓ≠p good-reduction interpretation from NeronModelsAndSemistableAbelianVarieties §5.0b, using AbelianSchemesAndArithmeticModuli §§A6.10–A6.11 for integrality and prime independence. ArithmeticGaloisRepresentations §§2.4 and 6.1–6.3 supplies the Weil–Deligne and Tate-module representation carriers. Katz–Messing identifies it with `det(X−φᶠ)` on crystalline `H¹` of the projective special fibre. Dualizing to `V_p(A)` inverts the eigenvalues, and arithmetic WD uses `φ⁻ᶠ`, inverting them again. Thus `WD_p(V_p(A))` is unramified with `N=0` and Frobenius polynomial `P_v`. Over a common algebraically closed characteristic-zero coefficient field its Frobenius semisimplification agrees with `WD_ℓ(V_ℓ(A))`, `ℓ≠p`. Supplied geometric endomorphisms and projectors respect the comparison; equality of total polynomials alone does not identify coefficient summands or nonsemisimple operators. (Katz–Messing, Thm. 1 and proof, pp. 74–75; BC, (7.3.1), p. 97).

**Checks.**

- For 11a1, `y²+y=x³−x²−10x−20` over `F₃`, there are five points, so `P₃=X²+X+3`, whereas the covariant crystalline polynomial is `X²+X/3+1/3`.
- On `P¹`, cohomological `φᶠ=q`, the covariant dual gives `q⁻¹` and arithmetic WD returns `q`.
- At a split Tate bad place the polynomial (X−p)(X−1) has `N≠0`; good-place compatibility cannot erase that monodromy.
- Identity and zero projectors behave as in §8.2.

### Examples

The Kummer matrices compute cocycle and root-change signs; `q=p`, `q=1+p` and torsion `q` separate semistability, crystallinity and integral splitting. The Tate L-invariant classifies the specified unframed normal forms. The 11a1 point count checks the two inversions in good-place prime compatibility.

### Dependencies

Layers `0`, `3`, `5`, 6 and 8 supply periods, exactness, parameters, height-one consequences and geometric realizations. LocalGaloisGroups Layer `7` supplies the completed multiplicative carrier; SelmerIwasawaCohomology §§0.6, 0.8 and 0.11 supplies `kummerLimit_bijective`, its `ℤ_p`-linearity, continuous-cohomology identification and restriction/norm/cup laws. ArithmeticGaloisDuality §R02.1.3 supplies rationalization, and ClassFieldTheory and ArithmeticGaloisDuality supply continuous `H¹` and Ext. EllipticCurves, Layers 4–5, supplies the Tate curve and twist carriers; this layer’s `potentiallyMultiplicativeTwistReduction` proves the ramification/reduction classification using those carriers and NeronModelsAndSemistableAbelianVarieties §1.10’s étale base change. NeronModelsAndSemistableAbelianVarieties §§3.10–3.14 supplies Raynaud uniformization and finite-extension semistable reduction; §5.0b supplies the common integral good-place polynomial using AbelianSchemesAndArithmeticModuli §§A6.10–A6.11. Section 9.3 constructs `abelianGoodReduction_iff_pDivisibleExtends` from the cited algebraic Néron and p-divisible inputs. ArithmeticGaloisRepresentations supplies Tate pairings, the all-prime Tate-curve sequence and the `ℓ≠p` parameter, while PadicDifferentialEquationsAndRigidCohomology supplies the finite-field Frobenius comparison. None of these suppliers needs the period realization proved here as an antecedent to its cited algebraic or analytic construction.

## Downstream consumers

Section 5.5's `tensorIsomTorsor`, `tensorIsomTorsor_actions` and `tensorIsomTorsor_rightToLeft` specialize MotivesAndAlgebraicCycles §6.8 on `Rep_F(G)` for finite-type G. The same supplier gives the general neutral-category torsor used by AnabelianGeometryAndNonabelianChabauty §2.1 over arbitrary fields; on this common domain the specialization comparison is the identity on tensor isomorphisms, preserving both actions, base change and the common torsor class. Section 5.5 owns the composite `tensorIsomTorsor_galoisClass` on SchemeAndStackFoundations §2.3's `NonabelianH1` and its Kottwitz and period-torsor comparisons. The generic smooth-affine comparison `smoothAffineTorsor_galoisH1` and its inverse `galoisH1_equiv_torsorClasses` are supplied by PELModuli §M0.9 over arbitrary fields, including disconnected groups; its localization maps and all-place kernels remain PEL work.

Supplier identifiers: `R06.4` denotes §6.4, including its residual-ordinary crystalline endpoint theorem and BLZ/Wach proof; `R06.6` denotes §9.3; `P8` denotes the pro-étale/cohomology interfaces of §§2.4, 2.7 and 7.2.

CohomologyComparisons uses the rational maps, normalized Hyodo–Kato agreement and early primitive theorem, and extends them to log coefficients, compact support and integral diagrams. Automorphic and deformation roadmaps use labelled weights, ordinary flags, the normalized Weil–Deligne parameter and rank-two types; local Langlands/Jacquet–Langlands formation is their work. Regulator and Selmer roadmaps use the period fundamental complexes and the signed Herr comparison. Higher relative Fargues–Fontaine and bundle roadmaps use §§7.5–7.6’s adapters on the period and patching objects supplied by PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c, 1.5–1.6; they are not prerequisites. Abelian and Shimura applications use the relative degree-one comparison with its cup product and normalized Tate line. The same-bundle integral/prismatic comparisons agree with this roadmap's rational comparison through the supplier maps just specified.

## References

Abbreviations: BC `=` Brinon–Conrad; FO `=` Fontaine–Ouyang; KL `=` Kedlaya–Liu; BI `=` Berger introduction; B02 `=` Berger 2002; B04 `=` Berger 2004; B08 `=` Berger 2008; BE `=` Berger errata; S13 `=` Scholze 2013; TT `=` Tan–Tong; CF `=` Colmez–Fontaine; FL `=` Fontaine–Laffaille; KW1/2 `=` Khare–Wintenberger I/II; BLGHT `=` Barnet-Lamb–Geraghty–Harris–Taylor.

Page numbers refer to the linked versions; a published-page locator is explicitly identified where it differs. Berger's errata are used in the version dated 13 October 2026. Scholze's structural de Rham ring uses the 2016 erratum, including the p-adic tensor completion.

- [An introduction to the theory of p-adic representations](https://arxiv.org/abs/math/0210184v1).
- [Représentations p-adiques et équations différentielles](https://arxiv.org/abs/math/0102179v3).
- [Équations différentielles p-adiques et (φ,N)-modules filtrés](https://arxiv.org/abs/math/0406601v1).
- [Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5).
- [Theory of p-adic Galois representations](https://www.imo.universite-paris-saclay.fr/~fontaine/galoisrep.pdf).
- [Deligne–Milne, *Tannakian Categories*](https://www.jmilne.org/math/xnotes/tc2018.pdf), Theorem 3.2(a)–(b), printed pp.30–31.
- [Milne, *Algebraic Groups* (2017)](https://www.jmilne.org/math/Books/iAG2017.pdf), Proposition 3.50.
- [CMI Summer School notes on p-adic Hodge theory](https://math.stanford.edu/~conrad/papers/notes.pdf).
- [Local monodromy of p-adic differential equations: an overview](https://arxiv.org/abs/math/0501361v2).
- [Les zéros des fonctions analytiques d’une variable sur un corps valué complet](http://www.numdam.org/item/PMIHES_1962__14__47_0/).
- [Limites de représentations cristallines](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf).
- [Errata for my articles](https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf).
- [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf).
- [Erratum to p-adic Hodge theory for rigid-analytic varieties](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf).
- [p-adic Hodge theory for rigid-analytic varieties (arXiv version)](https://arxiv.org/abs/1205.3463v2).
- [Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case](https://arxiv.org/abs/1510.05543v2).
- [Espaces de Banach de dimension finie](https://webusers.imj-prg.fr/~pierre.colmez/jussieucorps.pdf).
- [Construction de représentations p-adiques](http://www.numdam.org/item?id=ASENS_1982_4_15_4_547_0).
- [First steps towards p-adic Langlands functoriality](https://arxiv.org/abs/math/0603499v1).
- [Deformations of polarized automorphic Galois representations and adjoint Selmer groups](https://arxiv.org/abs/1411.7661v2).
- [Serre's modularity conjecture `I`](https://www.math.ucla.edu/~shekhar/papers/results.pdf).
- [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3).
- [Bhatt–Scholze, *Prisms and prismatic cohomology*](https://people.mpim-bonn.mpg.de/scholze/prisms.pdf), Theorems 5.2 and 6.4, pp.45 and 53.
- [Perfectoid spaces: a survey](https://arxiv.org/abs/1303.5948).
- [Mod-p Poincaré duality in p-adic analytic geometry](https://arxiv.org/abs/2111.01830v3).
- [A p-adic arithmetic inner product formula](https://arxiv.org/abs/2204.09239).
- [Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233).
- [Ordinarity of local Galois representation arising from Dwork motives](https://arxiv.org/abs/2103.00106v1).
- [Barnet-Lamb–Geraghty–Harris–Taylor, *A family of Calabi–Yau varieties and potential automorphy II*](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 2.2, pp.17–18.
- [On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf).
- [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf).
- [On local Galois deformation rings](https://arxiv.org/abs/2110.01638v2).
- [p-adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf).
- [Arithmétique des représentations galoisiennes p-adiques](https://www.numdam.org/item/AST_2004__295__1_0.pdf).
- [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf).
- [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1).
- [Colmez–Dospinescu–Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*](https://arxiv.org/abs/2204.11214v1), §0.3.1, pp.8–9.
- [Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1* (2020)](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §0.2, p.4, footnotes 5–6 of the author version.
- [Galois sections and p-adic period mappings](https://arxiv.org/abs/2204.13674v1).
- [Admissible pairs and p-adic Hodge structures](https://arxiv.org/abs/2308.11064v2).
- [A p-adic Simpson correspondence for smooth proper rigid spaces](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf).
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf).
- [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- [The Frobenius and monodromy operators for curves and abelian varieties](https://arxiv.org/abs/math/9701229v1).
- [The A_inf-cohomology in the semistable case](https://arxiv.org/abs/1710.06145v3).
- [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf).
- [Some consequences of the Riemann hypothesis for varieties over finite fields](https://web.math.princeton.edu/~nmk/old/katzmessing.pdf).
- [Colmez–Fontaine, *Construction des représentations p-adiques semi-stables*](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf), 37-page author version, especially Theorem 4.3 and §6.2.
- [Conrad, *Lifting global representations with local properties*](https://math.stanford.edu/~conrad/papers/locchar.pdf), Appendix B, Prop. B.4, pp.35–36.
- [Ruochuan Liu, *Cohomology and duality for (φ,Γ)-modules over the Robba ring*](https://arxiv.org/abs/0711.4346v2), especially §2.1 and Thms. 2.3, 4.7.
- [Kentaro Nakamura, *Deformations of Trianguline B-Pairs and Zariski Density of Two Dimensional Crystalline Representations*](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms200401.pdf), Appendix §5, published pp.558–566.
- [Tong Liu, *The correspondence between Barsotti–Tate groups and Kisin modules when p=2*](https://www.numdam.org/item/10.5802/jtnb.852.pdf), Thms. 1.0.1 and 2.2.1, published pp.662, 666.
- [Wintenberger, *Propriétés du groupe tannakien des structures de Hodge p-adiques et torseur entre cohomologies cristalline et étale*](https://www.numdam.org/item/AIF_1997__47_5_1289_0/), Ann. Inst. Fourier 47 (1997), 1289–1334, §4.5.
- [Colmez, *Théorie d’Iwasawa des représentations de de Rham d’un corps local*](https://webusers.imj-prg.fr/~pierre.colmez/iwasawa-deRham.pdf), Prop. IV.2.4, pp.33–34.
- [Berger–Li–Zhu, *Construction of some families of 2-dimensional crystalline representations*](https://www.math.buffalo.edu/~hjzhu/Papers/mathann.pdf), §4.1, Remark 4.1.2(1), Cor. 4.1.3(1), Prop. 4.1.4(1), linked-PDF pp.10–11.
- [Conrad–Diamond–Taylor, *Modularity of certain potentially Barsotti–Tate Galois representations*](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf), Lemma 2.1.2, author-version p.8.
- [Fontaine, *Sur certains types de représentations p-adiques du groupe de Galois d’un corps local; construction d’un anneau de Barsotti–Tate*](https://annals.math.princeton.edu/1982/115-3/p03), §§5.5, 6.2–6.6, pp.563–567.

- [Olivier Brinon, *Représentations p-adiques cristallines et de de Rham dans le cas relatif*](https://numdam.org/item/10.24033/msmf.424.pdf), Mémoires SMF 112 (2008), Prop. 6.1.1, Cor. 6.1.2, Prop. 6.1.3, printed pp.62–64, and Prop. 6.2.1, pp.69–70.
- [Christophe Breuil, *Représentations p-adiques semi-stables et transversalité de Griffiths*](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/Griffiths.pdf), §2, author-version pp.3–6, and §4.1, pp.7–9.
- [Kazuya Kato, *Semi-stable reduction and p-adic étale cohomology*](https://www.numdam.org/item/AST_1994__223__269_0.pdf), Exposé VI, §§3.2–3.9, printed pp.277–280, with the logarithm sign in §2.2, pp.272–273.

- [Kottwitz, *Stable trace formula: elliptic singular terms*](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), Math. Ann. 275 (1986), 365–399, §1.1 and Theorem 1.2 with proof, pp.368–370.
- [Mazur–Rubin, *Selmer companion curves*](https://bpb-us-e1.wpmucdn.com/sites.harvard.edu/dist/a/189/files/2023/01/SELMER-COMPANION-CURVES.pdf), §2, Definition 2.1 and Proposition 2.2, author-version p.3; proof of Lemma 2.5, p.4.

- [Bierstone–Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*](https://mahalex.net/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), situation (0.1)(2), p.208; Theorems 1.6 and 1.10, pp.215–216.

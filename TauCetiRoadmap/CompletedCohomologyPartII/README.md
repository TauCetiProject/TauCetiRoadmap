# Roadmap: completed cohomology, homology and arithmetic towers — Part II

*Arithmetic locally symmetric spaces and their cohomology, Part II.*

**Summary.** Completed cohomology turns the cohomology of a tower of arithmetic locally symmetric spaces into one object with an action of a p-adic group. With coefficients `O/ϖ^s` one takes the colimit over p-power levels and then the limit over `s`; completed homology is the limit over levels under covering pushforward. This roadmap builds these objects from the actual finite-level complexes of ArithmeticLocallySymmetricSpaces, and keeps the degreewise completed modules apart from the cohomology of the derived limit. Its end results are: a bounded complex of finite projective modules over the Iwasawa algebra that computes completed homology and whose derived coinvariants recover every finite level; finite generation, bounded torsion and admissibility of the completed objects, with the Iwasawa-dimension bounds that follow; completed Hochschild–Serre descent, homological descent and the classical evaluation map; the completed support triangle, completed interior cohomology and completed Iwasawa–Poincaré duality; and, for the modular, Siegel, unitary and Hilbert towers, named comparisons with étale cohomology, the transported Galois and Hecke actions, the completed Hecke algebra and the residual localisation that arithmetic applications use. The construction retains integral torsion, support conditions, effective deck groups and the adjoint conventions of the finite-level diagrams.

## Scope and ownership

### What this roadmap owns

This roadmap is the Part II of ArithmeticLocallySymmetricSpaces (ALS) and starts where ALS stops. ALS supplies the finite-level objects: the arithmetic quotients `Y_K` and their local systems, finite cochain models, the Borel–Serre compactification with its boundary triangle, Hecke correspondences, level pullback and trace, and Poincaré–Lefschetz duality at a fixed level. Everything obtained from these by passing to the tower is owned here: the coherent tower diagram and its finite comparisons (Layer 0), the fixed-exponent colimits with their smooth actions (Layer 1), completion and derived limits (Layer 2), continuous duals and completed homology (Layer 3), the completed chain model (Layer 4), finiteness and admissibility (Layer 5), descent to finite level (Layer 6), completed supports and duality (Layer 7), and the adapters to Shimura varieties, Galois actions and Hecke algebras (Layer 8). ALS supplies finite-level descent, support maps and refinement compatibility. This roadmap assembles them and proves the completed interfaces in Layers 6 and 7; ALS.6 uses finite-level inputs only.

### Boundaries with neighbouring roadmaps

- **Tau Ceti AlgebraicTopology.** Cellular chains of finite CW pairs and relative complexes (Stage 4), finite-cover transfer, chain comparison and deck-group descent (Stage 5), and Poincaré–Lefschetz duality with local systems (Stage 6). Layer 4 lifts these through the tower; it does not construct them again.
- **Tau Ceti ProfiniteCohomology.** Continuous cohomology of profinite groups with discrete coefficients, with Mathlib's `continuousCohomology` as its carrier. The fixed-exponent descent 6.2 has discrete smooth coefficients and is a statement about this cohomology. The integral descent 6.1 uses ArithmeticGaloisDuality §D7.3 on its coefficient class and the continuous-function extension in F.2 here.
- **Tau Ceti library and ProfiniteProPGroups.** The completed group algebra `TauCeti.completedGroupAlgebra` and the action `IsCompactModule.completedGroupAlgebraModule` on compact modules exist in the pinned library. Layer 3 uses them and checks only the arithmetic hypotheses and conventions.
- **DerivedModuleAlgebra and ArithmeticGaloisDuality.** DerivedModuleAlgebra §§1.T.1 and 1.1 own linear countable `lim¹`, Milnor sequences and derived tower limits. ArithmeticGaloisDuality §D7.3 owns the compact ind-admissible Hochschild–Serre comparison. F.2 here supplies the continuous-function extension and compares the imported compact homology; Layers 2 and 6 prove the arithmetic comparisons.
- **PadicMeasuresIwasawaAlgebras.** Layers 0–1 own measures, finite quotient coordinates and convolution; §5.2 owns exact compact inverse systems.
- **PadicLocalLanglandsForGL2Qp.** Sections 0.1 and 0.3 own the coefficient-linear compact–discrete duality, Schikhof duality and the category of unitary Banach representations with its admissible subcategory. F.1 imports them; the bounded-torsion integral category, the strict topology comparisons used by the tower and their arithmetic applications in Layers 2–5 remain here.
- **NoncommutativeAndEquivariantIwasawa.** Sections 0.2, 0.4, 0.10–0.11 and F.1–F.2 supply open uniform subgroups, the all-profinite locality criterion, noetherianity and canonical finite-module topology, Auslander regularity and global dimensions without p-torsion, grade and coefficient comparisons, finite-index invariance, compact tensors and completed group homology. Sections 0.1, 3.11, 5.1, 5.5 and F.2 here identify these interfaces on the tower's coefficients and actions. The level index and normal power-subgroup basis, admissible-complex convention, arithmetic finite generation, Ore-rank comparison, uniform growth and continuous-function tensors remain here.
- **SmoothRepresentationsOfLocalGroups** (a Tau Ceti roadmap, Layers SR.0 and SR.1). Smooth representations over `O`, compact-open invariants and averaging for groups of invertible pro-order, smooth contragredients and O-valued Haar measures.
- **IntegralHeckeAndGaloisDeterminants** (a Tau Ceti roadmap; its Layer 2 on integral and derived Hecke actions is cited as IntegralHeckeAndGaloisDeterminants §§2.1–2.2). Finite derived Hecke images, their local factors, idempotents and ghost bounds. Layer 8 takes their inverse limit over the tower. These statements are over a commutative base; the extension to the possibly noncommutative group rings of the tower is specified below.
- **DeformationAndDerivedPatchingAlgebra.** Sections 7.3, 7.5–7.7 and Layer 8 supply commutative minimal models, complete-flat models and patching of complexes and actions. F.2–F.3 and §4.7 here construct the compact group-ring comparisons.
- **LocallyAnalyticDistributions.** Sections 0.0–0.3 own strict locally convex topology, analytic function stages and distribution duals. F.4 here builds locally analytic vectors and their derived functor; §6.7 proves their arithmetic comparison.
- **ModularCurvesPartII, EnhancedDerivedSheaves, ComplexComparisonPartII.** ModularCurvesPartII §§14.1–14.4a supplies the modular coefficient and finite-pair dictionary; EnhancedDerivedSheaves Layers E0–E3 the coherent enhancements; ComplexComparisonPartII §§C6.1–C6.5 the finite Artin, compact-support and trace comparisons.
- **ShimuraVarieties and HilbertModularVarietiesAndShimuraCurves.** ShimuraVarieties Layers 5–6 and §§8.1–8.5, 8.8 supply canonical models, level maps, translations and Hecke spans; 8.2 specializes their component and tower-map dictionary. HilbertModularVarietiesAndShimuraCurves §§R18.4.12–R18.4.13 (the arithmetic coefficient adapter for twisted Betti cohomology and the finite-level Hilbert support comparison) supply finite-level coefficient and support comparisons; 8.3 assembles these into the completed diagram. The central-quotient comparison (8.1) and the ALS support and trace identifications (0.6, 0.7) are owned here. EtaleDualityAndPerverseSheaves keeps the étale six operations.

### Not targets of this roadmap

- The fixed-exponent object is consumed by TorsionCohomologyInfrastructure TC.2 for Scholze's comparison with the cohomology of the perfectoid Shimura variety (Theorem 4.2.1 and Corollaries 4.2.2–4.2.3). Layer 8 supplies only its fixed-exponent left-hand side and the support convention (8.6).
- The completed objects are consumed by CompletedCohomologyAndLocalGlobalCompatibility R31 for Banach local–global compatibility for `GL₂` and its modular and Shimura-curve applications. No `GL₂` local–global result is used for another group.
- Nakamura's coadmissible modules (Appendix B.2.4, Lemma B.16) and his Corollary 2.5 belong to R31.4, with SmoothRepresentationsOfLocalGroups Layer SR.5.
- The concentration conjectures of Calegari–Emerton, projectivity of completed homology and growth along arbitrary filtrations do not follow from anything here and are not stated as results.
- Locally analytic vectors are a further functor, not the definition of completed cohomology.

## Conventions

Fix a prime `p` and `O`, the ring of integers of a finite extension `E/ℚ_p`, with uniformizer `ϖ` and finite residue field `k`. Fix tame level `K^p` and one specified compatible integral coefficient lattice. Reductions are `O/ϖ^s` for `s ≥ 1`. A rational isomorphism of coefficient representations does not identify their integral lattices or their support diagrams. Complete local coefficient rings A occur only in the separately qualified topological-module targets of Layer 3.

Write `H` for the full local group and `K_0` for a compact open subgroup. For a fixed algebraic lattice `W_0` let `H_int = Stab_H(W_0)`, an open subgroup containing `K_0`. Integral local actions are actions of `H_int`; replacing `H_int` by `H` requires a coherent H-equivariant integral system, as for trivial coefficients. A general `g` transports `W_0` to `g⁻¹W_0`, and only the commensurable-lattice comparison after rationalisation gives the action of `H` with algebraic coefficients. To apply the finite free chain model, choose an actual regular tower of a finite CW pair with faithful deck groups `K_0/U_r`, for a cofinal normal basis `U_r`; the existence of an open uniform or pro-p such basis is a foundational input. This hypothesis is checked on the geometric quotient in use. In a Shimura quotient with ineffective rational central units, neatness alone does not give these deck groups: Layer 8 keeps the effective quotient, the central coefficient descent and the bundle comparison (8.1, target G12). A non-neat fixed level has the derived stabiliser interpretation of ALS.

Two standing hypotheses hold throughout and are not repeated in each target: `O`, `E`, `ϖ` and `k` are as above, and the tame level and integral local system are fixed, with integral local actions restricted to `H_int` as just described.

For cohomology, refinement `U ⊂ K` induces pullback from level `K` to level `U`. At fixed `s` put `A^n_{★,s} = colim_K H^n_★(Y_K, O/ϖ^s)`, with the discrete topology, for the supports `★ ∈ {ordinary, c, ∂}`. Put `H̃^n_★ = lim_s A^n_{★,s}`: the level colimit comes before the coefficient limit. The enhanced complex is `RΓ̃_★ = Rlim_s colim_K C^★_{K,s}`. Its cohomology and `H̃^n_★` differ by an explicit Milnor term unless the stated control theorem applies.

Completed homology is the compact inverse limit over levels under covering pushforward, not under transfer. Borel–Moore homology is the relative homology of the Borel–Serre pair. Homology with finite coefficients and the reduction of integral completed homology differ by the adjacent torsion term of the Bockstein sequence. Compact support, boundary and the image that defines interior cohomology are different objects.

A left action on a module gives the right transpose action on its dual by `(f·g)(x) = f(gx)`. The left dual action is `(g·f)(x) = f(g⁻¹x)`, as in Mathlib's `Representation.dual`. Algebraic and continuous duals, the pointwise compact and uniform `ϖ`-adic topologies, and the coefficient targets `O` and `E/O` are named separately. Tame trace is unnormalised: trace after pullback along a cover of degree `d` is multiplication by `d`. Orientation characters, component groups and the Boxer–Pilloni Serre twist `t ↦ w₀t⁻¹` remain in every comparison where they apply.

The dimensions in Layers 5 and 7 are different: the real dimension of the symmetric space controls the classical middle degree, whereas `dim(K_0)` is the local analytic dimension. For torsion-free uniform `U`, `O[[U]]` has global dimension `dim(U) + 1` and `k[[U]]` has global dimension `dim(U)`. Concentration conjectures, projectivity of homology and growth along an arbitrary filtration are not consequences of finite perfectness.

**Varying tame level** (3.8, 3.9). `Σ₀` is a finite set of finite places of the base field not above `p`, `G_{Σ₀}` is the product of the groups `G(F_v)` for `v ∈ Σ₀`, and `K^Σ` is the level at the finite places outside `Σ = Σ₀ ∪ {places above p}`. A compact open subgroup has pro-order invertible in `O` when every finite index of an open subgroup in it is a unit of `O`. For such a `K⁰_{Σ₀}`, `μ` is the O-valued Haar measure on `G_{Σ₀}` with `μ(K⁰_{Σ₀}) = 1`, so that `μ(K) = [K⁰_{Σ₀} : K]⁻¹` for open `K ⊂ K⁰_{Σ₀}`; `G_{Σ₀}` is unimodular, so `μ` is invariant under conjugation. For a smooth `O[G_{Σ₀}]`-module `V`, `e_K` is the averaging projector onto `V^K`, and Ṽ is the smooth contragredient, the smooth vectors of `Hom_O(V, O)`.

**Notation across the sources.** The exponent of the coefficient ring is written `s`, or `m` where the source writes `m` (as in 4.5, after Pan); there `A^i_m` is the module `A^i_s` with `s = m`. Fu rationalises by `⊗ K` for a finite extension `K` of `ℚ_p`; in 3.6 that is `E ⊗` with `O = ℤ_p`. Nakamura's `Ĥ¹_c`, the `ϖ`-adic completion of the integral level colimit, agrees with `H̃¹_c` in his setting (the checks of 3.9 say why). Boxer–Pilloni's `Λ` is the Iwasawa algebra of a torus; elsewhere `Λ = O[[K_0]]`. The proposed Lean names live in the namespace `TauCetiRoadmap.CompletedCohomologyPartII`; the layers give them either relative to that namespace or in full.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `6b7abb3` and Tau Ceti `a91d3aa` with the hypotheses of the declarations listed below. The derived categories and exact colimits of the libraries supply generic operations; they do not supply the arithmetic diagrams, continuous completed `Tor` or the enhanced countable `Rlim` that the tower needs.

- `TauCeti.moduleCat_ab5OfSize`: Filtered module colimits are exact with the stated small universe convention. Module `TauCeti/Algebra/Homology/ShortComplex/Colimit.lean`. Used in §1.1.
- `TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`: Homology of complexes commutes with existing exact colimits. Module `TauCeti/Algebra/Homology/ShortComplex/Colimit.lean`. Used in §1.1.
- `ModuleCat.sectionsSubmodule`: Compatible module-valued sections are a native submodule of the product. Module `Mathlib/Algebra/Category/ModuleCat/Limits.lean`. Used in §2.1, §8.10.
- `TopModuleCat.isLimit`: An underlying module limit with the projection-induced topology is a topological-module limit. Module `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean`. Used in §2.1, §3.3, §8.7.
- `Module.DirectLimit`: The existing module colimit carrier; this roadmap specializes its diagram, not its quotient construction. Module `Mathlib/Algebra/Colimit/Module.lean`. Used in §1.1.
- `Module.DirectLimit.of`: Canonical maps from level modules into the existing colimit. Module `Mathlib/Algebra/Colimit/Module.lean`. Used in §1.1.
- `Module.DirectLimit.exists_of`: Every class has a finite-level representative in a nonempty directed diagram. Module `Mathlib/Algebra/Colimit/Module.lean`. Used in §1.1.
- `DerivedCategory.Q`: The native localization of cochain complexes at quasi-isomorphisms. Module `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`. Used in §0.2, §2.2.
- `CategoryTheory.Limits.colim.exact_mapShortComplex`: An exact colimit functor preserves exact short complexes. Module `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Colim.lean`.
- `CategoryTheory.Functor.Final.colimitIso`: Cofinal restriction gives the existing categorical colimit isomorphism. Module `Mathlib/CategoryTheory/Limits/Final.lean`. Used in §1.1.
- `Representation.dual`: Algebraic dual representation uses precomposition by the inverse group action. Module `Mathlib/RepresentationTheory/Basic.lean`. Used in §3.1.
- `groupCohomologyIsoExt`: Discrete group cohomology is `Ext` in Rep; not continuous completed descent. Module `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean`.
- `groupHomologyIsoTor`: Discrete group homology is `Tor` in Rep with its tensor product; the ordinary group-ring interpretation requires its standard adapter, and this is not continuous completed `Tor`. Module `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`. Used in §6.3.
- `ContinuousLinearMap`: Native bundled continuous linear maps supply continuous O-dual maps. Module `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`. Used in §3.1, §7.4.
- `PontryaginDual`: Native Circle-valued continuous characters with compact-open topology; on `ϖ`-primary modules its comparison with the O-linear `E/O` dual passes through `ℚ_p/ℤ_p` and the trace comparison `DualitySupport.traceComparison` of PadicLocalLanglandsForGL2Qp §0.3. Module `Mathlib/Topology/Algebra/PontryaginDual.lean`. Used in §3.1.
- `Representation.averageMap_eq_invOf_card_smul_norm`: For a finite group `G` with |G| invertible in `k`, Mathlib's averaging projection averageMap equals the group sum Representation.norm scaled by ⅟|G|: the finite form of the identity `e_K = [K : K']⁻¹` (sum over K/K') on K'-invariants. Module `TauCeti/RepresentationTheory/Invariants.lean`. Used in §3.8.
- `Representation.averageMap`: The averaging projection onto the invariants of a representation of a finite group whose order is invertible in the coefficient ring. Module `Mathlib/RepresentationTheory/Invariants.lean`.
- `IsAdicComplete`: An I-adically Hausdorff and precomplete module; for `I = (ϖ)` this is the completeness of the terms in 2.5. Module `Mathlib/RingTheory/AdicCompletion/Basic.lean`. Used in §2.5.
- `RingCat.sectionsSubring`: The compatible sections of a ring functor form the native subring of the product. Module `Mathlib/Algebra/Category/Ring/Limits.lean`. Used in §8.10, §8.12.
- `TopModuleCat`: Bundled topological modules with continuous linear morphisms; its limit is the underlying module limit with the induced projection topology. Module `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean`. Used in §8.7.
- `CategoryTheory.Functor.mapEnd`: A functor maps an object’s endomorphism monoid to the endomorphism monoid of its image, preserving composition. Module `Mathlib/CategoryTheory/Endomorphism.lean`. Used in §8.7.
- `LinearMap.IsIdempotentElem.range_eq_ker`: An idempotent linear map has range equal to the kernel of identity minus that map. Module `Mathlib/LinearAlgebra/Projection.lean`. Used in §8.13.
- `ContinuousLinearMap.IsIdempotentElem.isClosed_range`: The range of a continuous idempotent is closed on a T1 topological additive group. Module `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Idempotent.lean`. Used in §8.13.
- `RingHom.range`: The native subring image of a ring homomorphism; the compatible Hecke image diagram restricts an existing endomorphism-ring functor to these actual images. Module `Mathlib/Algebra/Ring/Subring/Basic.lean`. Used in §8.8.
- `CategoryTheory.Limits.lim`: The limit functor on diagram categories; its endomorphism map transports the supplied natural action. Module `Mathlib/CategoryTheory/Limits/HasLimits.lean`. Used in §8.7.

At the same Mathlib commit `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`) is the carrier of continuous group cohomology; the Tau Ceti roadmap ProfiniteCohomology develops it for profinite groups with discrete coefficients, and the fixed-exponent descent 6.2 is a statement about it.

Tau Ceti at `a91d3aa` supplies the completed group algebra `TauCeti.completedGroupAlgebra` with its ring structure, finite quotient projections, extensionality, topology and dense group-algebra span (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`); the predicate `TauCeti.IsCompactModule` for compact totally disconnected topological modules with its quotient and limit API (`Topology/Algebra/Module/Compact.lean`); and `IsCompactModule.completedGroupAlgebraModule`, which extends a continuous scalar-compatible action of a compact group, with `completedSMul_of`, `mkQ_completedSMul` and `continuousSMul_completedGroupAlgebraModule` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean`). Layer 3 uses these; the new work there is checking the arithmetic hypotheses, comparing the coefficient and group limit presentations and matching the deck and dual conventions. The same module already provides `TauCeti.IsCompactModule.module_finite_completedGroupAlgebraModule_of_dense_closure_univ_smul`: a finite set whose group-orbit additive span has dense closure generates the compact module over the completed algebra. This generic criterion is supplied; 5.1 proves the arithmetic homology statement. These declarations are available at the pin; the arithmetic specializations remain README targets.

The generic compact-module finite-generation criterion supplies a density implication. Arithmetic finite generation, with the actual tower and its canonical topology, is the target of §5.1.

### Native completion and Tate-module interfaces

Mathlib `AdicCompletion` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`, with `AdicCompletion.of`, `AdicCompletion.eval` and `AdicCompletion.ofLinearEquiv`, supplies the ideal-adic completion and its finite quotient maps. Section 2.7 uses `AdicCompletion (Ideal.span {ϖ}) B` for the integral arithmetic colimit B and identifies its projections with the displayed quotient system; no second completion constructor is needed.

Tau Ceti `TauCeti.TateModule` in `TauCeti/Algebra/Module/Torsion/TateModule.lean` supplies the p-adic Tate module of an additive group, with `TauCeti.tateModuleTransition`, `TauCeti.TateModule.proj`, `TauCeti.TateModule.proj_succ`, `TauCeti.TateModule.lift`, `TauCeti.TateModule.ext`, `TauCeti.TateModule.mapLinearMap` and its projection-induced topology. Section 2.7 reuses it when `O = ℤ_p` and `ϖ = p`. Its general coefficient variant uses the ϖ-torsion diagram in O-modules with O-linear multiplication-by-ϖ transitions, and proves its comparison with the native p-adic module using `p = u ϖ^e`, a unit u and cofinal exponents; the O-action and projection dictionary are retained. The generic p-adic construction is supplied rather than a target here.

### Native linear-map interfaces

Use `ContinuousLinearMap.comp` for continuous-dual precomposition and `LinearMap.range` for the image of a support arrow, with its existing submodule structure. Use `LinearMap.IsIdempotentElem.mem_range_iff` for the fixed-point description of an idempotent range and `ContinuousLinearMap.IsIdempotentElem.isClosed_range` for its closedness on a T1 topological additive group. The split arithmetic localisation and its topology comparison are §8.13, rather than new versions of these library facts. The tower constructions use these native colimits, limits and ranges with the specified arithmetic diagrams and projectors.

### External roadmap contracts

The contracts below name the existing layers and hypotheses consumed. The additional topological and noncommutative interfaces required by the tower are targets of the foundational sections F.1–F.5 here.

### From ArithmeticLocallySymmetricSpaces

The base roadmap. Its finite-level quotients, local systems, cochain models, Borel–Serre pairs, correspondences, traces and finite-level duality are taken from ALS.0–ALS.6: the quotient and proper-action model (ALS.0), integral local systems, Betti and finite-complex models (ALS.1), finite Borel–Serre pair and boundary stratification (ALS.2), derived correspondences and unnormalized trace (ALS.3), boundary triangle (ALS.4), finite-level oriented duality (ALS.5a) and derived finite-level descent (ALS.6).

### From Tau Ceti roadmap AlgebraicTopology

Stage 4, items 1–4 supplies finite CW pairs, cellular chains and cellular–singular comparison. Stage 5, item 3 supplies finite-cover transfer with pushforward after transfer equal to the degree and, for an effective regular cover, transfer after pushforward equal to the deck-group sum. Stage 6, items 1 and 4 supplies relative cochains by `Hom` and finite-manifold Poincaré–Lefschetz duality with local systems. The relative-cover and adjoint comparison required by the tower is specified in F.3 here; it is applied to the Borel–Serre pairs of ArithmeticLocallySymmetricSpaces §§ALS.2.1–ALS.2.4 and ALS.5a.1–ALS.5a.6.

### From Tau Ceti roadmap ProfiniteProPGroups

A Tau Ceti roadmap; only the completed-group-algebra receipt in its Layer 9 prerequisites is used, not Demushkin classification.

Import only the pinned-library completed-group-algebra and compact-module receipt in the Layer 9 prerequisites, not Demushkin classification: TauCeti.completedGroupAlgebra (Basic.lean) with proj, mk, ext and `dense_span_range_of`; TauCeti.IsCompactModule (Compact.lean); IsCompactModule.completedGroupAlgebraModule, `completedSMul_of`, `mkQ_completedSMul` and `continuousSMul_completedGroupAlgebraModule` (Module.lean). These exist at the pinned Tau Ceti commit a91d3aa. `O` must be a compact commutative topological ring and `M` a compact totally disconnected topological O-module with continuous `K_0`-action commuting with scalars. Layer 3 supplies only the arithmetic specialization and two-index coefficient comparison; the generic constructors are supplied by the pinned library.

### From SmoothRepresentationsOfLocalGroups

A Tau Ceti roadmap. SR.0 and SR.1 are its Layers SR.0 (the smooth category: smoothness, invariants and averaging for invertible pro-order, smooth contragredients) and SR.1 (Hecke algebras over rings, with A-valued Haar measures).

The existing compact-open index, smooth representation carrier, transport by conjugation, and finite-exponent open stabilizer criterion. Import the full local-group convention, not merely a fixed compact group.

### From IntegralHeckeAndGaloisDeterminants

Sections 2.1–2.2 supply finite derived Hecke images over a commutative Noetherian base, the cohomology action and its ghost kernel, finite complete-local factors, idempotent summands and the exponent `b−a+1` for ghosts on amplitude `[a,b]`. The ghost nilpotence concerns the full endomorphism ring. The O-linear equivariant finite-image and splitting statements over the possibly noncommutative finite deck-group rings are targets of F.3 here; forgetting the deck action does not replace them.

### From PadicMeasuresIwasawaAlgebras

Sections 0.1–0.2 supply clopen measure restriction, pushforward and the weak and strong topologies; Layer 1 supplies finite quotient coordinates and convolution for completed group algebras; §5.2 supplies compact inverse-system exactness and topological Nakayama with the compact Hausdorff and continuous-action hypotheses stated there. The completed-ring and compact-module constructors themselves are the pinned Tau Ceti declarations above. The general Schneider–Teitelbaum Banach category, the compact–discrete `E/O` duality and Schikhof duality are imported from PadicLocalLanglandsForGL2Qp §§0.1 and 0.3 (see below). Strict integral admissible-complex control and regular-filtration leading-rank estimates are targets of F.1, §§2.4, 3.1–3.2 and F.5 here.

### From NoncommutativeAndEquivariantIwasawa

Section 0.2 supplies an open normal uniform subgroup of every compact p-adic analytic group, with the fourth-power convention at 2. Section 0.4 supplies locality exactly for pro-p groups, for every profinite group with either `O` or `k` coefficients. Section F.1 supplies left and right noetherianity, the canonical compact topology on finite modules, grade with the zero-module convention, the coefficient shift, the reduction exact sequence, torsion-free grade equality and finite-index invariance. Sections 0.10–0.11 supply Auslander regularity and left and right global dimensions `d+1` integrally and `d` residually for compact analytic groups without p-torsion. These contracts include ramified `O` and the opposite-ring versions.

Section F.2 supplies the compact balanced tensor on inverse limits of finite continuous modules, its algebraic comparison when one factor is finitely presented, completed group homology as derived coinvariants, its long exact sequence, closed-subgroup Shapiro and bounded hyper-Tor. The tensor comparison does not require a noetherian coefficient ring. F.2 here identifies these operations by the balanced pure-tensor map and the induced comparison of resolutions, retaining outer actions, augmentation, connecting maps and the hyper-Tor abutment. The continuous-function coefficient category, lattice–compact tensor, cohomological comparisons and mixed tensor remain here. Section 5.5 proves the Ore-rank comparison and §5.8 the uniform-power growth bounds; Banach and compact–discrete duality come from PadicLocalLanglandsForGL2Qp §§0.1 and 0.3 through F.1.

### From DerivedModuleAlgebra and ArithmeticGaloisDuality

DerivedModuleAlgebra §1.T.1 and §1.1 supply linear countable `lim`, `lim¹`, the six-term exact sequence, ML vanishing, the strict-tower model `Cone(1−shift)[−1]` and the natural linear Milnor sequence. Sections 0.2 and 1.1.1 supply native module-derived tensor and `Hom`. Section 1.E.0 supplies `DerivedDeRham.IsPerfect` (alias `PerfectComplex.IsPerfect`), `isPerfect_retract` and `isPerfect_triangle` for arbitrary associative unital rings. Its `finiteFreeBaseChangeModel` is a commutative-ring interface; §1.E.1 supplies compatible perfect systems in its stated coefficient range. ALS.F.2 supplies opposite-ring duals and noncommutative scalar change in the order `B⊗ᴸ_A−`. F.2–F.3 here add the continuous-function topology, finite Hecke images and minimal models over finite local group rings, using the compact tensor and derived coinvariants of NoncommutativeAndEquivariantIwasawa §F.2. EnhancedDerivedSheaves Layers E2:towers and E3 supply coherent towers and their enhancement. Section 2.2 here applies these operations to the actual arithmetic diagram, rather than constructing a second derived limit. ArithmeticGaloisDuality §D7.3, *Admissible coefficients and continuous cochains in the derived category*, supplies compact continuous cochains and relative compact Hochschild–Serre with its ind-admissible coefficient hypotheses. The continuous-function lattices and coinduced acyclicity needed beyond that coefficient class are F.2 targets here; the compact completed `Tor` is imported there.

### From PadicLocalLanglandsForGL2Qp

Section 0.3 supplies, for the standing `O` with fraction field `E` finite over `ℚ_p`, the compact–discrete duality `DualitySupport.torsionDual`, valued in the dualizing module `E/O`, on discrete O-torsion modules with compact-open topology, and its compact-to-discrete counterpart. Its API `DualitySupport.exact`, `DualitySupport.bidual`, `DualitySupport.finiteQuotient` (compatibility with finite quotients and with inverse and direct limits), `DualitySupport.traceComparison` (the underlying `ℤ_p`-dual through the inverse different) and `DualitySupport.contragredient` (the action `(g·f)(v)=f(g⁻¹v)`) is used unchanged. Section 0.1 supplies the category of unitary Banach representations of a p-adic Lie group with jointly continuous action and its admissible subcategory; for compact open `H`, Schikhof duality between admissible H-Banach representations and finitely generated `E⊗_O O[[H]]`-modules, retaining the dual lattice and its topology; the criterion matching a `G`-stable compact torsion-free integral model with an open bounded `G`-stable lattice up to commensurability; and the inversion `ζ ↦ ζ⁻¹` of central characters. F.1 and §3.1 export their notation as abbreviations of these constructions.

### From DeformationAndDerivedPatchingAlgebra

Sections 7.3 and 7.5–7.7 supply minimal finite free representatives, complete-flat coefficient models, signed duality and strict coefficient towers over commutative complete local rings. Layer 8 supplies simultaneous patching of complexes, rings and derived actions in that coefficient setting, retaining an actual action diagram. The noncommutative compact group-ring version of Gee–Newton Propositions 3.4.16 and 3.4.19 is specified in §4.7 here, using the compact-category and finite-group-ring foundations of F.2–F.3. Its finite projective dimension, uniform rank bounds and reduction compatibility are hypotheses or proof targets there. Section 3.13–3.16 here supplies the qualified infinite-rank coefficient dualities and the mixed tensor comparison; the generic compact finite-quotient tensor is F.2. The closed-central-kernel change of rings is §8.1 and G12 here and requires its own perfect resolution.

### From LocallyAnalyticDistributions

Section 0.0 supplies nonarchimedean locally convex spaces, strict maps, their strict derived categories and completed projective tensors; §§0.1–0.3 supply fixed-radius analytic functions, their inductive topology and strong distribution duals. Section F.4 here constructs locally analytic vectors and their derived functor on those supplied carriers, with the `ℚ_p` versus `F_v` convention. Section 6.7 then proves the arithmetic comparison; Emerton Corollary 2.2.18 supplies a spectral sequence rather than the definition of derived vectors.

### From ModularCurvesPartII

Sections 14.1–14.4a supply the modular local-system dictionary and the finite-coefficient Betti, boundary and étale comparisons, including the modular Borel–Serre adapter. Sections 9.11–9.12 supply correspondence traces, and §§14.8 and 14.11 the Hecke and adjoint conventions. Section 0.6 here uses the general finite constructible comparison with these actual modular coefficients.

### From EnhancedDerivedSheaves

EnhancedDerivedSheaves Layers E0–E1 supply the enhanced derived sheaf categories and functors; Layers E2:towers and E3 supply coherent tower diagrams. Layer 0 here assembles the selected arithmetic diagram.

### From ComplexComparisonPartII

Sections C6.1–C6.4 supply local-coefficient sheaf/singular comparison, Riemann existence, `artinComparison` for finite constructible coefficients and `artinComparisonCompactSupport` for separated finite-type complex schemes. Section C6.5 supplies lower-shriek/proper exchange, trace and oriented duality compatibility with its stated perfect-source hypotheses. Sections 0.6–0.7 here identify these supplied maps with the actual ArithmeticLocallySymmetricSpaces support and orientation diagrams, including finite-cover and coefficient naturality. Coherent GAGA is used through that supplier's own proof, rather than as a replacement for Artin comparison.

## How to read the build

Layer 0 assembles the actual finite diagrams and the finite comparison maps, and Layer 1 takes their exact colimit at fixed exponent. Layer 2 distinguishes degreewise completion from the derived complex and states the strict integral control theorem independently of finiteness. Layer 3 fixes the dual categories and completed homology, and Layer 4 then constructs the actual lifted finite-cell models. Layer 5 applies noetherianity and analytic duality to those models. Layer 6 recovers finite levels by derived continuous invariants or completed `Tor`, and Layer 7 applies supports and duality to the same coherent diagram. Layer 8 compares the result with the Shimura towers, transports the arithmetic actions and builds the completed Hecke algebra and the residual localisation.

The control statements 2.6 and 2.9 are conditional on a supplied admissible cochain model and its compatible reductions; the integral universal-coefficient statement 3.7 similarly takes a bounded compact chain model as input. Layer 4 constructs these models for the arithmetic tower, and Layer 5 verifies their noetherian and finiteness hypotheses. Finite-coefficient duality 3.5 instead follows directly from finite-level duality and exact compact inverse limits. The torsion argument 5.7 uses the derived coinvariant comparison already constructed in 4.4; Layer 6 then records the full descent interfaces and their functoriality.

Each subsection gives the mathematical statement, its API or proof, source locators and prerequisites. The intermediate proof obligations at the end describe the constructions needed to connect those sources to the topological arithmetic objects.

## Foundations for the tower constructions

These targets precede the arithmetic applications. They extend the supplied measure, strict-topology and commutative-complex interfaces with the coefficient categories actually used by the tower. None presupposes arithmetic finite generation.

### F.1 Integral duality and the admissible Banach category

For the standing `O` with fraction field `E` and finite residue field `k`, the compact–discrete duality is `DualitySupport.torsionDual` of PadicLocalLanglandsForGL2Qp §0.3 with dualizing module `E/O`. On a compact Hausdorff inverse limit of finite O-modules it consists of the continuous O-linear maps to discrete `E/O`; on a discrete `ϖ`-primary module it consists of all O-linear maps to `E/O` with pointwise compact topology. Its exactness, biduality, finite-quotient and limit compatibility and contragredient action are `DualitySupport.exact`, `DualitySupport.bidual`, `DualitySupport.finiteQuotient` and `DualitySupport.contragredient`. Schikhof duality with values in `O` is the duality of PadicLocalLanglandsForGL2Qp §0.1 for compact open subgroups, with its dual lattice and topology. The tower applies the same Schikhof dual before finite generation is known. On a torsion-free compact O-module it is the module of continuous O-linear maps to `O` with uniform `ϖ`-adic topology; on a complete separated torsion-free `ϖ`-adic lattice it is the O-linear dual with pointwise compact topology. Prove exactness on the corresponding strict sequences and biduality with precisely these topologies on these two module categories, and prove that on finitely generated `O[[H]]`-models, for compact open `H` in a p-adic Lie group, they restrict to the duality of §0.1, lattice topology included. Evaluation and `DualitySupport.contragredient` give the pairings and actions of §§3.1–3.2. Prove the continuous-function/measure comparison `D_O C(K,O) ≅ O[[K]]` for a profinite group `K` from the supplied finite quotient coordinates and the pinned completed group algebra. (ST, Theorems 1.2 and 2.3, Propositions 1.3 and 1.6 and Lemmas 1.4–1.5, pp.3–12; E11, Appendix C, pp.103–104.)

An admissible unitary E-Banach representation of a compact p-adic analytic group `K` is an object of the admissible subcategory of PadicLocalLanglandsForGL2Qp §0.1; rational morphisms are bounded E-linear equivariant maps. The tower uses its lattice presentation: a K-stable bounded open O-lattice `L`, complete and torsion-free, whose Schikhof dual `Hom_O(L,O)` is finitely generated over `O[[K]]`, taken up to isogeny, with continuous O-linear equivariant lattice morphisms. Prove that this presentation selects exactly the supplier's admissible objects, through the equivalence between finiteness of every `(L/ϖL)^U` for open `U ⊂ K` and finite generation of the dual Iwasawa module, in the regime of ST Theorem 3.5. Prove independence of the chosen commensurable stable lattice and that admissibility can be tested on any compact open subgroup of a locally p-adic analytic group `H`. Equivalence with finitely generated `E[[K]]`-modules and abelianness with strict morphisms then follow from the Schikhof duality of §0.1. A full H-invariant norm requires an H-stable lattice; compact-open admissibility of a nonunitary algebraic twist makes no such assertion. The API on the imported category is the evaluation pairing, dual map and its identity/composition laws, the stable-unit-ball norm, the compact-open restriction comparison and the exact anti-equivalence. (ST, Theorems 2.3 and 3.5, pp.11–15, and the definition of admissibility preceding Lemma 3.4; E06, §1.1 opening, p.8, Definition 1.2.1 and Proposition 1.2.4, pp.13–14.)

On these imported duals, the integral admissible category of this roadmap also admits bounded `ϖ`-power torsion. Prove the strict image, bounded torsion, completeness and pro-system reduction statements needed in §2.4, using Emerton's quotient of inverse systems by essentially-null systems. Do not deduce a fixed-exponent reduction isomorphism from the inverse-limit equivalence. The ordinary, compact-support and boundary complexes use this same category and comparison. The generic theorem is independent of the arithmetic chain model that instantiates it in Layer 4. (E06, Definitions 1.2.1 and 1.2.8, Propositions 1.2.4 and 1.2.10–1.2.12, pp.13–16.)

**Checks.**

- For `K` trivial, `E` with lattice `O` has compact dual `O`; a `ϖ`-primary torsion module such as `k` has zero O-dual and nonzero `E/O`-dual. These two dualities cannot be interchanged.
- For `K = ℤ_p`, the dual of `C(K,O)` is `O[[K]]` with its compact quotient topology; its regular Banach representation is admissible although it has infinite E-dimension.
- The complete lattice `c₀(ℕ,O)` has pointwise compact dual `O^ℕ`. The latter has product topology: the coordinate vectors tend to zero there but have uniform norm one. The product cannot be given the lattice's uniform topology in the anti-equivalence.
- The two-term complex `O → O` with differential `ϖ` has a nonzero reduction error, as computed in §2.9; strict integral control must preserve it.
- The lattice presentation and the supplier's admissibility agree on both sides of the boundary. For `K = ℤ_p`, `C(K,O)/ϖ = C(K,k)` has `U`-invariants `Map(K/U,k)`, finite for every open `U`, and the dual `O[[K]]` is cyclic. For `K` trivial, the unit ball `c₀(ℕ,O)` of `c₀(ℕ,E)` has reduction `⊕_ℕ k`, with infinite invariants, and Schikhof dual `O^ℕ`, not finitely generated over `O`; both criteria reject it.

*Needs:* PadicLocalLanglandsForGL2Qp §§0.1 and 0.3 for the compact–discrete and Schikhof dualities and the admissible unitary Banach category; PadicMeasuresIwasawaAlgebras §§0.1–0.2, Layer 1 and §5.2; LocallyAnalyticDistributions §0.0 for the strict-topology vocabulary; native continuous linear maps and the pinned compact-module and completed-group-algebra APIs.

### F.2 Compact coefficient tensors and continuous derived operations

Import the compact balanced tensor of NoncommutativeAndEquivariantIwasawa §F.2: A is a compact Hausdorff complete ring with a basis of open two-sided ideals of finite index, and the right module `M` and left module `N` are compact inverse limits of finite continuous A-modules. Its finite coordinates are `(M/U) ⊗_A (N/V)`. Identify the tensor used by the tower with this supplied tensor by the continuous balanced universal property and the pure-tensor map, preserving finite quotient projections, induced maps and commuting outer actions. For commutative A it is an A-module; otherwise retain only those outer actions. Import its functoriality, cofinal independence, associativity, unit and finite-sum comparisons and its agreement with the algebraic tensor with compact quotient topology for arbitrary compact `M` and finitely presented compact `N`, including the handedness-reversed assertion. This applies to §3.16 without requiring both factors to be finite. The mixed `ϖ`-adic tensor of §3.15 has a separate limit and topology. (Nakamura, Definition B.2, Lemmas B.5–B.6, pp.90–92; E11, Lemmas B.6–B.7, pp.100–101.)

For a complete separated torsion-free `ϖ`-adic O-lattice `L` and a compact Hausdorff linearly topologized O-module `N` with finite continuous quotients, construct the lattice–compact tensor `L⊗̂_O N = lim_Q (L⊗_O Q)`, over all finite continuous O-module quotients `Q` of `N`. Each tensor on the right is discrete; the limit has its projection-induced topology. Prove functoriality in continuous linear maps of both factors, identity/composition, cofinal independence and finite direct-summand compatibility. For profinite `K`, the map `f⊗n ↦ (x↦f(x)n)` induces a natural topological isomorphism `C(K,O)⊗̂_O N ≅ C(K,N)`, where the latter has compact-open topology. Use finite clopen partitions and finite quotients of `N` to prove this comparison. In particular this defines `M⊗̂_OΛ` for the admissible function lattices and their finite summands in §3.12, with the diagonal action and the commuting outer action. This completion has its own topology, distinct from the mixed tensor of §3.15. (BP, §5.4, Lemmas 5.4.1–5.4.2 and their generator calculation, pp.56–57.)

For a profinite `K` and continuous compact O-coefficients, import continuous completed group homology, derived coinvariants, their long exact sequence, closed-subgroup Shapiro and bounded-complex hyper-Tor from NoncommutativeAndEquivariantIwasawa §F.2. Compare compact resolutions through the tensor identification above, preserving augmentation, connecting maps, coefficient, conjugation and subgroup maps, shifts and triangles, and the hyper-Tor abutment. A bounded complex of compact finite projective `O[[K]]`-modules computes these derived coinvariants by its completed tensor complex. For the continuous-function lattices of F.1 and their lattice–compact tensors, construct continuous cochains and derived invariants in the category of Hausdorff inverse limits of discrete O-modules. Use strict exact sequences and resolutions whose continuous cochain sequences are exact; establish these properties on this coefficient class before applying the derived functor. Prove resolution independence, naturality, support functoriality and bounded-complex hypercohomology. For a closed subgroup and the regular continuous-function coinduced module in the stated compact or complete-lattice category, prove the continuous coinduced acyclicity and cohomological Shapiro comparison used in §§3.12 and 6.1. Match ArithmeticGaloisDuality §D7.3 on its ind-admissible subcategory and Mathlib's discrete `Tor` and group cohomology at finite discrete levels. (E06, Proposition 2.1.11, pp.24–26; BP, Lemmas 5.4.1–5.4.2, pp.56–57; Marshall, §5.2, equation (34), pp.1646–1648; Fu, §7, equation (38), p.23.)

The interfaces are the supplied compact balanced tensor with its projection cone, `RΓ_cts(K,−)` on the specified strict inverse-limit coefficient derived category and the supplied `O ⊗̂ᴸ_{O[[K]]} −` on compact complexes. Their comparisons preserve shift/triangle compatibility and the actual coefficient-change maps. The arithmetic abutment is proved from the lifted model in §4.4 and Layer 6.

**Checks.**

- Tensoring a compact module with the rank-one coefficient module gives that same compact module; a finite free second factor of rank `d` gives `d` copies with the finite product topology.
- The compact tensor `O^ℕ` with `O` gives `O^ℕ` with product topology. The mixed tensor of `c₀(ℕ,O)` with `O` gives `c₀(ℕ,O)` with uniform topology, so the two completions differ.
- For `K` trivial, completed derived coinvariants of a bounded finite projective complex are that complex. For `K = ℤ_p`, the circle model with differential `γ − 1` acquires zero differential after augmentation, hence degree-one `O`; taking coinvariants of its zero first homology would miss this group.
- The lattice–compact units are `O⊗̂_O N≅N` and `L⊗̂_O O≅L`, the latter with its original `ϖ`-adic topology.
- For `K=ℤ_p` and `N=O^ℕ`, the lattice–compact tensor is `C(K,O)^ℕ` with product topology. The functions equal to one in coordinate `n` and zero elsewhere tend to zero in this topology, but not in the uniform `ϖ`-adic topology.
- For the action by translation on the argument and trivial action on values, the regular coinduced module `C(K,N)` has invariant constants `N` and zero higher continuous cohomology, by the continuous bar contraction; `N=O` recovers the lattice case. A continuous action on `N` gives the diagonal model, untwisted to this one by `f(x)↦x⁻¹f(x)`. This supplies the regular-point descent test without asserting acyclicity of every compact coefficient module.

*Needs:* F.1; NoncommutativeAndEquivariantIwasawa §F.2 for compact tensors, derived coinvariants, compact homology, long exact sequences, Shapiro and hyper-Tor; the pinned completed group algebra; ArithmeticGaloisDuality §D7.3 for its compact coefficient comparison; DerivedModuleAlgebra §§0.2, 1.1.1, 1.T.1 and 1.E.0 for ordinary derived operations, limits and general-ring perfectness; ALS.F.2 for opposite-ring duals and noncommutative scalar change; PadicMeasuresIwasawaAlgebras §5.2 for exact compact inverse systems.

### F.3 Equivariant finite complexes, relative transfer and central change of rings

Let `B` be a finite `O/ϖ^s`-algebra, possibly noncommutative, and `C` a bounded complex of finite projective left B-modules. For a central O-linear action of a commutative O-Hecke algebra on `C` in `D(B)`, prove its image is a finite commutative ring. Compute derived `Hom` through the bounded projective model to retain B-equivariance, rather than using a forgetful functor as a faithful map. Prove idempotent splitting in `D(B)`, with finite projective summands for perfect `C`, and the ghost exponent `b−a+1` when cohomology is in `[a,b]`. The finite commutative image then has the local factors and unique residual idempotents of IntegralHeckeAndGaloisDeterminants §2.2. All coefficient-change maps use specified Hecke-equivariant derived base-change identifications; the induced maps of faithful images are surjective when the same abstract Hecke algebra acts on the target. These are the group-ring extensions used in §§8.8–8.15. (GN, §§2.1.5–2.1.14, pp.9–11; IntegralHeckeAndGaloisDeterminants §§2.1–2.2 and its ACC ghost argument.)

For `B = (O/ϖ^s)[P]` with `P` a finite p-group, prove that its radical contains `ϖ` and every `g − 1`, with residue `k`, and that derived tensor with `k` detects the zero object among perfect B-complexes. Construct bounded minimal finite free representatives with differential in the radical and compare their reductions. Preserve both left and right module conventions; the right augmentation module is used for coinvariants. The argument extends the commutative minimal-model comparison of DeformationAndDerivedPatchingAlgebra §7.3 to this finite local group ring. The noncommutative perfect model of §4.7 also needs compatible minimal resolutions, uniformly bounded ranks and coherent reduction at every pair `(U_p,J)`, as stated there. (GN, Definition 2.1.6, Proposition 2.1.9 and proof, pp.9–10; Proposition 3.4.16, pp.23–24.)

For a finite cover of finite CW pairs `(Y,B) → (X,A)` with `B` the full preimage of A and finite free compatible local coefficients, descend the chain transfer of AlgebraicTopology Stage 5, item 3 to relative chains. Prove pushforward after transfer equals the covering degree and, for an effective regular cover, transfer after pushforward equals the deck sum. Under the `Hom` evaluation of Stage 6, identify cochain pullback as adjoint to chain pushforward and cochain trace as adjoint to chain transfer, preserving the boundary sequence and its connecting maps. These statements use the actual geometric degree and do not divide by it. (E06, proof of Proposition 2.1.11, pp.24–26; GN, §2.1.4, pp.8–9; the finite-cover lift-sum construction of AlgebraicTopology Stage 5, item 3.)

For a closed central kernel `Z` of an ineffective compact action, the quotient-ring change of rings is a target only with a specified finite projective resolution of `O[[K/Z]]` as the appropriate `O[[K]]`-module and a comparison with the actual effective deck tower. Prove the induced derived tensor and action comparisons under these hypotheses. Establish that resolution and its finite projective dimension for every selected application that keeps the full group; otherwise use the verified effective quotient throughout. No finite projective dimension is inferred merely from centrality. The arithmetic central-bundle and coefficient descent comparisons are §8.1 and G12. (E06, §2.4, pp.40–42; GN, §§2.1.1–2.1.3, pp.7–8.)

**Checks.**

- For `B = k[P]`, reduction of a nonzero minimal free stalk is nonzero; the contractible identity disk reduces to an acyclic disk. Derived detection concerns perfect objects, rather than arbitrary modules with vanishing underived coinvariants.
- Over `B=k[ε]/(ε²)`, the perfect complex `[B --ε→ B]` in degrees 0,1 has the nonzero ghost `(ε,0)`, whose square is zero. A null homotopy would require the same `εh` to equal both `ε` and zero. Over the field `k`, every ghost in `D(k)` is zero because complexes split into cohomology and contractible disks.
- For a degree-p cover, trace after pullback is `p` and becomes zero over `k`. The ineffective `C₂` action on a point has geometric degree one, not two; the raw-index sum is `2·id` and differs from geometric trace. At odd `p` its average is identity, while dividing the geometric trace itself by two gives `(1/2)·id`.
- On an interval relative to its endpoints the relative `H₁` is `O` and the absolute `H₁` is zero; the relative transfer and its adjoint retain this distinction.

*Needs:* F.2; IntegralHeckeAndGaloisDeterminants §§2.1–2.2 for the commutative image and factor comparisons; DeformationAndDerivedPatchingAlgebra §7.3 and Layer 8 for commutative minimal models and patching; AlgebraicTopology Stages 2, 4–6; ArithmeticLocallySymmetricSpaces §§ALS.3.6–ALS.3.9 and ALS.5a.3–ALS.5a.5 for arithmetic trace and pairing identifications.

### F.4 Locally analytic vectors and their derived functor

For a locally p-adic analytic group `H` and a continuous E-representation `V` in the strict locally convex categories of LocallyAnalyticDistributions §0.0, define the locally `ℚ_p`-analytic vectors by locally analytic orbit maps `H → V`. Construct their topology from the supplied fixed-radius analytic-function stages: the orbit-map embedding identifies the vectors with the appropriate invariant subspace of V-valued locally analytic functions, with its induced locally convex topology. Restriction to compact open charts and changing a cofinal radius system give the same object. For an `F_v`-analytic action, separately impose the relations that identify the `F_v`-linear Lie differential; restriction of scalars from `F_v` to `ℚ_p` does not make the two notions equal. The API is the evaluation inclusion, functoriality, compact-open restriction, radius comparison and the differentiated Lie action. (E06, §2.2, Corollary 2.2.18 and Remark 2.2.19, pp.34–35; BCGP, §4.8, Theorem 4.8.3, pp.101–102.)

Construct the right derived locally analytic-vector functor as `RLA(V) = RΓ_cts(H, C^la(H,V))` in the specified strict derived category, using the analytic-function resolution. On the function coefficient use `(h·f)(g) = h·f(h⁻¹g)`; the commuting right translations `(r_h f)(g) = f(gh)` give the output left H-action. Evaluation at 1 identifies an invariant function with its analytic orbit vector. Prove the comparison between this resolution and analytic vector-valued stages, with their completed tensor realization under the stated coefficient hypotheses, and retain the augmentation and H-action. Prove model independence, triangulated functoriality and comparison with ordinary locally analytic vectors in degree zero. State and prove any acyclicity or exactness theorem with its admissibility and coefficient hypotheses before replacing this derived object by the underived vectors. Construct Lie-algebra derived `Hom` using the differentiated action and the Chevalley–Eilenberg resolution; fix the dual `W∨` and restriction-of-scalars conventions. The arithmetic evaluation quasi-isomorphism is §6.7 with G6, including its general locally symmetric formulation and the `GSp₄` instance: `colim_U RΓ_★(Y_U,W) ≅ RHom_𝔤(W∨,RLA(RΓ̃_★(O)⊗_O E))` for ordinary and compact supports. The classical side is a smooth level colimit; finite-level recovery also uses continuous U-descent. Emerton's `Ext` spectral sequence is a consequence with its own hypotheses and is not used as a definition of the derived functor.

**Checks.**

- On a finite-dimensional algebraic E-representation every vector has an analytic orbit map; on a smooth representation every orbit map is locally constant and therefore locally analytic.
- For the regular translation action on `C(ℤ_p,E)`, a continuous function which is not locally analytic is excluded. Giving every continuous vector the analytic label fails this test.
- When `F_v` is a proper extension of `ℚ_p`, the `ℚ_p`-analytic coordinate functions on its underlying `ℚ_p`-vector space need not have `F_v`-linear differential. The `F_v`-analytic subspace satisfies the stated differential relations.
- For `H` trivial, both vector functors are the identity and the derived functor has no positive cohomology on a stalk.

*Needs:* LocallyAnalyticDistributions §§0.0–0.3; F.1–F.2; Mathlib Lie algebras and cochain complexes; EnhancedDerivedSheaves Layer E0 for the enhancement used by coherent functors.

### F.5 Leading rank in a regular congruence filtration

Let `K` be a compact p-adic analytic group of positive dimension `d` with the regular congruence filtration `U_r` of CEbounds §3, after a sufficiently small congruence shrink, so `[K:U_r] = c p^(dr)` for large `r`. For an admissible unitary E-Banach K-representation `V` in the category of PadicLocalLanglandsForGL2Qp §0.1, with finite compact dual `M`, let rank mean the rank of `E ⊗_O M` after restriction to a torsion-free uniform open domain, normalized by the finite index. Prove `dim_E V^(U_r) = rank(V) [K:U_r] + O(p^((d−1)r))` with this normalization, and for each fixed `i > 0` prove the continuous-cohomology error bound `dim_E H^i_cts(U_r,V) = O(p^((d−1)r))` in the coefficient class used by the bounded completed descent complex. The constants may depend on `V`, `i` and the chosen filtration. Supply the lattice comparison and long-exact-sequence estimates that pass these bounds through a bounded admissible complex. (CEbounds, Theorem 2.1 and Lemma 2.2, pp.3–4; Theorem 3.2 and its proof, pp.4–5.)

These estimates are the generic leading-rank input in §§5.7 and 5.9; the arithmetic classical multiplicity bounds remain §5.6 and G5. They concern rational corank in this regular filtration. Residual canonical-dimension growth in §5.8 is a separate statement, and an arbitrary normal cofinal basis is not substituted for `U_r`.

**Checks.**

- The regular representation `C(K,E)` has finite-level invariant dimension `[K:U_r]`, with normalized rank one and zero error.
- The trivial representation `E` has rank zero when `d > 0` and invariant dimension one, consistent with the error bound; rank zero does not imply vanishing.
- For `K = ℤ_p` the trivial representation has nonzero first continuous cohomology at every open level, so higher terms are bounded errors rather than identically zero.
- The anisotropic basis in §5.8 tests why a regular-filtration assertion cannot be transferred to arbitrary indices.

*Needs:* F.1–F.2; §0.1 and the generic filtered-ring statements of §§5.1 and 5.5, proved before their arithmetic applications. No arithmetic completed-homology torsion conclusion is an input.

## Layer 0: Finite-level towers and support data

This layer assembles the finite-level data from which the completed objects are built: the category of p-adic levels, one coherent diagram of ordinary, compact-support and boundary complexes with its pullback, trace and conjugation maps, the derived model at non-neat levels, and two arithmetic test towers. For Shimura varieties it also states the comparison of étale and Betti cohomology with finite coefficients, with compact supports, and its trace and orientation normalisation. No limit is taken in this layer.

### 0.1 Arithmetic level index

Use the compact opens `K_p` of `H=∏_{v∣p}G(F_v)` (or the specified local factor), ordered by refinement: an arrow `K→L` means `K⊂L`, and the cohomology diagram is on the opposite category. Only refinement arrows index the filtered colimit. Conjugation by each `g` gives a reindexing functor and a coherent natural transport map between diagrams, with its composition law; transport maps are not arrows of the indexing category. A fixed coefficient lattice has same-lattice transport only for `H_int`; other `g` transport `W_0` to `g⁻¹W_0` and act on the rational coefficient tower after lattice comparison. At fixed compact `K_0` choose a descending countable normal open basis `U_r`; after passing to an open uniform subgroup it can be pro-p. Cofinality of a normal basis concerns refinement arrows only, inside its compact open; full H-actions use all levels and conjugation reindexing.

For this construction, a uniform pro-p group means a finitely generated torsion-free powerful pro-p group: [U,U] lies in `U^p` for odd `p` and in `U⁴` for `p=2`. Import the open-uniform theorem from NoncommutativeAndEquivariantIwasawa §0.2: every compact p-adic analytic `K_0` has an open normal uniform subgroup `U`. Identify its power groups `U^{p^r}` as a countable characteristic neighbourhood basis in `U`, hence a normal pro-p basis of `K_0`, and prove finality for the arithmetic refinement index. In particular one must not infer uniformity at `p=2` from the odd-prime commutator bound. (ST, §3 opening, p.13, gives the open finitely generated pro-p and noetherian consequences; Venjakob, proof of Theorem 3.26, p.18, uses an open characteristic extra-powerful uniform subgroup.)

(E06, §2.1 opening, p.20; §2.2, pp.27–28: Normal compact level systems compute the same tower colimit; the arithmetic group action also transports levels.)

To prove this, specialize the supplied compact-open index to the actual local points of the reductive group. Prove common refinement by intersection and conjugation continuity. Compare any normal basis with all opens of `K_0` using the native final-functor criterion. Use the imported open-uniform theorem to choose the normal pro-p basis; retain the distinction between the analytic group and its finite deck quotients.

Applications include Layer 1 smooth action: Classes represented at `K` can be transported to `gKg⁻¹`; Layer 4 completed model: A normal compact basis provides finite deck quotients.

The API consists of the following maps and identities.

- **Intersection**: K∩L is a compact open common refinement.
- **Composition of transports**: Transport by `g` followed by `h` is transport by hg, in the chosen left action convention.
- **Finality of a normal basis**: The opposite of a normal neighbourhood basis is final in the refinement category of opens of `K_0`.
- **Underlying subgroup**: Forget the arithmetic label to the existing SR.0 compact-open subgroup carrier.
- Identify the normal power-subgroup basis of the supplied open uniform subgroup with the arithmetic refinement system, retaining the `p=2` powerful convention.

**Checks.**

- **Reversed arrow**: For `pℤ_p⊂ℤ_p` the cohomology arrow is from level `ℤ_p` to `pℤ_p`.
- **Common refinement**: For `pℤ_p` and `p²ℤ_p` the common refinement is `p²ℤ_p`.
- **Conjugation outside the compact**: Conjugation by diag(p,1) on `GL₂(ℚ_p)` can leave `GL₂(ℤ_p)`; the full index retains the conjugate.
- The cohomological arrow for `U⊂K` is `K→U`.
- For `K_0=ℤ₂`, the even and odd coset indicators stay distinct under refinement and are exchanged by translation by 1. Adding that translation to the indexing arrows would incorrectly identify them.
- For `K_0=ℤ_p^d`, `U=K_0` is uniform and `[U:U^{p^r}]=p^{dr}`; for `d=0` the tower is constant.
- A compact group with p-torsion can have an open uniform subgroup while failing to be uniform itself; a finite `C_p` has the trivial open subgroup.
- For `p=2` the condition `[U,U]⊂U²` alone is insufficient for powerfulness; the definition requires `U⁴`.

*Needs:* SmoothRepresentationsOfLocalGroups SR.0 for the compact-open carrier; NoncommutativeAndEquivariantIwasawa §0.2 for the open-uniform theorem.

### 0.2 Coherent arithmetic tower

Assemble the ALS finite-level ordinary `C_{K,s}`, compact-support `C^c_{K,s}` and boundary `B_{K,s}` into one diagram of complexes with pullback in p-level and coefficient reduction in `s`. The ALS boundary triangle is part of this diagram, including its connecting arrow. Conjugation acts by reindexing and natural transport between these refinement diagrams, not by adding indexing arrows. Keep trace as a separate reverse-level natural system. Ordinary homology uses covering pushforward; compact support uses proper pullback and trace. These actual diagrams retain coefficient lattices, real component groups and orientation systems.

(E06, §2.1, pp.20–21; §2.2, pp.27–29: Finite-level coefficients and covering maps generate the tower complexes.; GN, §2.1.1–2.1.4, pp.7–8: The actual adelic chain model has natural coefficient, level and Hecke maps.)

To prove this, take the actual ALS models and their specified maps. Rectify the diagrams in their supplied enhanced category, retaining comparison homotopies if representatives differ. Check every coefficient/level/support square before forming limits; a diagram of objects in a triangulated category alone is insufficient for `Rlim`.

Applications include Layer 2 derived tower: One coherent support diagram is needed to apply derived inverse limit; Layer 7 completed support: Connecting morphisms must survive the tower functor.

The API consists of the following maps and identities.

- **Evaluation**: Evaluation at `(K,s)` is the supplied ALS complex and coefficient system.
- **Reduction and pullback**: Coefficient reduction commutes with every level pullback and proper trace.
- **Support triangle**: The three tower functors form the specified natural triangle.
- **Refinement**: Refining a compatible representative induces a natural quasi-isomorphism, not a choice of unrelated complexes.

**Checks.**

- **Regular tower over a point**: For a finite deck torsor over a point the degree-zero functions are `Map(K_0/U,O/ϖ^s)`.
- **Compact quotient**: For an anisotropic compact quotient the compact-support arrow is an isomorphism at every `(K,s)`.
- **Modular boundary**: For a neat open modular curve the cusp boundary term survives in the support diagram; dropping it fails the connecting-map check.
- A level map commutes with the connecting arrow.
- No map erases a component or stabilizer unless its explicit descent comparison supplies this.

*Needs:* §0.1, `ArithmeticLocallySymmetricSpaces §ALS.1.2`, `ArithmeticLocallySymmetricSpaces §ALS.1.3`, `ArithmeticLocallySymmetricSpaces §ALS.1.8`, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, `ArithmeticLocallySymmetricSpaces §ALS.4.1`, `DerivedCategory.Q`.

### 0.3 Conjugation and tame coherence

The ALS pullback, trace and permitted coefficient-transport/conjugation maps on the actual tower satisfy identity and composition, commute with coefficient reduction and support maps, and commute with tame Hecke operators when tame levels agree at their support. Same-lattice integral conjugation uses `H_int`; translations outside it are maps between transported lattices, not endomorphisms of the fixed integral system. For a tame level change use the common correspondence refinement, without identifying different spherical Hecke generators at ramified levels.

(E06, Lemma 2.2.10 and Theorem 2.2.11, pp.30–32: Arithmetic translations and component actions respect the tower.; GN, §2.1.4, pp.8–9: Hecke maps commute with shrinking levels away from their support.)

To prove this, apply the imported ALS correspondence composition to each `(K,s)`. Check a common intersection for every conjugation/trace square. Preserve the chosen lattice for `H_int`, and explicitly transport it to `g⁻¹W_0` for other `g` before rational comparison. Retain this natural transformation on the enhanced tower.

**Checks.**

- Two products of translations give the same map after common refinement.
- The modular and anisotropic tower tests use actual quotient maps.

*Needs:* §0.2, `ArithmeticLocallySymmetricSpaces §ALS.3.8`, `ArithmeticLocallySymmetricSpaces §ALS.3.9`.

### 0.4 Non-neat tower realisation

At a level with torsion stabilizers, assemble the supplied ALS groupoid or derived group-cohomology model. A neat normal refinement with deck group Q descends by `RΓ(Q,−)`, including Q-torsion cohomology. Coarse quotient cohomology is substituted only under the supplied comparison hypotheses; a cofinal neat tower does not remove stabilizers from a fixed non-neat level.

(GN, §2.1.1–2.1.3, pp.7–8: Good level hypotheses make the quotient a manifold; the free model is not claimed at arbitrary bad levels.; E06, §2.2, p.27: Smallness is required for unramified manifold covers.)

To prove this, import the finite-level stabilizer interpretation from ALS. Assemble its derived descent comparison compatibly with refinement and supports. Use the neat tower to compute the colimit, but use derived descent for a fixed level.

**Checks.**

- For a point with stabilizer `C_p` over `k`, `H¹(C_p,k)` is nonzero.
- Averaging over a p-group is disallowed.

*Needs:* §0.2, `ArithmeticLocallySymmetricSpaces §ALS.1.5`, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`.

### 0.5 Modular and compact tower tests

Construct the assembled tower on neat modular curves using ModularCurvesPartII §§14.1–14.4a and on an anisotropic compact arithmetic quotient using ALS.0–ALS.2. Check pullback, trace, conjugation, supports and orientation against their finite-level maps. At a regular degree-d cover the composite trace after pullback is `d`; on the modular curve the boundary is the actual cusp incidence diagram; on the anisotropic quotient it is empty.

(CE, §1.5, pp.7–8: The arithmetic quotient and Borel–Serre boundary form the motivating tower.; GN, §2.1.1–2.1.4, pp.7–8: Arithmetic coverings and correspondences give the test maps.)

To prove this, specialize the existing finite-level constructions, rather than introducing a formal tower standing in for them. Use the regular-cover identity at common neat levels. Compare the compact support maps in the two examples, retaining cusp boundary in the noncompact case.

**Checks.**

- Both named arithmetic examples have fully specified level and trace directions.
- A degree-p test is integral, so `p` is not replaced by 1.

*Needs:* §0.2, `ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.7`, `ArithmeticLocallySymmetricSpaces §ALS.2.3`, `ModularCurvesPartII §§14.1–14.4a`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 0.6 Finite coefficient Betti comparison

For a selected neat characteristic-zero Shimura variety `X` at finite level, a complex embedding, and a finite locally constant `O/ϖ^s` sheaf `F`, specialize ComplexComparisonPartII §§C6.3–C6.4 to `RΓ_et(X_C,F)≅RΓ(X(C),F_an)`, and its compact-support comparison via a proper algebraic compactification `j:X→Xbar` and j!F. Compare the boundary support triangle with the ALS topological boundary model through its supplied compact-support comparison. Naturality in finite étale level maps and coefficient reduction is part of the named map. The new assertion identifies the supplied maps with the coherent ALS arithmetic diagram; it does not construct diamond operations or all étale six functors. Constructible comparison and compact-support proof obligations are G10.

(MilneEC, Theorems21.1,21.3,21.5 and Remark21.2, pp.130–134: Finite-stalk locally constant comparison is proved by étale-local killing of analytic cohomology; the constructible extension is identified separately.)

To prove this, use ComplexComparisonPartII §§C6.1–C6.5 for the finite constructible and compact-support comparisons, their compactification independence and finite-cover coefficient dictionary. Use the ALS compact-support sheaf/singular comparison to identify the actual arithmetic cochains, retaining all naturality squares.

**Checks.**

- Ordinary and compact-support cohomology of an open curve are distinguished.
- Finite-type characteristic-zero and finite-stalk hypotheses are checked before comparison.

*Needs:* `ArithmeticLocallySymmetricSpaces §ALS.1.4`, `ArithmeticLocallySymmetricSpaces §ALS.4.1`, `EnhancedDerivedSheaves Layers E1, E2:towers and E3`, `ComplexComparisonPartII §§C6.1–C6.5`.

### 0.7 Trace and orientation comparison

For the same finite-level smooth d-dimensional complex varieties, finite étale `f:Y→X` and finite coefficient `F`, the Betti comparison intertwines pullback and the unnormalized finite-cover trace. Under the chosen root-of-unity/orientation dictionary, `O/ϖ^s(d)[2d]` becomes the complex manifold orientation dualizing system. It intertwines the finite-level Poincaré pairings and support connecting arrows, with trace after pullback equal to deg(f). For noncomplex real arithmetic components the ALS orientation local system is retained rather than replaced by a trivial sheaf. This arithmetic adapter compares the supplied finite trace and oriented duality maps; it does not assert any completed duality.

(MilneEC, Trace discussion, p.98; Theorem24.1 and Remark24.2(a),(c),(f), pp.144–145: The finite-cover stalk sum and duality normalize trace and coefficient orientation.)

To prove this, compute finite étale trace on geometric and analytic stalks as the sum over the same finite fiber. Match the top-degree trace normalization using the chosen complex orientation and Tate coefficient identification. Use finite-level pairings and the actual support maps to check the commuting square, under G10’s comparison proof.

**Checks.**

- A degree-p cover gives `p` integrally, not an averaged identity.
- Real orientation characters survive component transport.

*Needs:* §0.6, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, `ArithmeticLocallySymmetricSpaces §§ALS.5a.2–ALS.5a.5`, `AlgebraicTopology Stage 6, cochains and manifold duality`.

### Examples

At a finite regular point torsor the actual degree-zero module is `Map(K_0/U, O/ϖ^s)`. On an open modular curve the cusp boundary remains; on an anisotropic compact quotient it is empty. A non-neat point with stabiliser `C_p` has nonzero `H¹` over `k`.

### Dependencies

`ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.7`, `ArithmeticLocallySymmetricSpaces §ALS.1.2`, `ArithmeticLocallySymmetricSpaces §ALS.1.3`, `ArithmeticLocallySymmetricSpaces §ALS.1.5`, `ArithmeticLocallySymmetricSpaces §ALS.1.8`, `ArithmeticLocallySymmetricSpaces §ALS.1.4`, `ArithmeticLocallySymmetricSpaces §ALS.2.3`, `ArithmeticLocallySymmetricSpaces §ALS.3.8`, `ArithmeticLocallySymmetricSpaces §ALS.3.9`, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, `ArithmeticLocallySymmetricSpaces §ALS.4.1`, `ArithmeticLocallySymmetricSpaces §§ALS.5a.2–ALS.5a.5`, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, `ComplexComparisonPartII §§C6.1–C6.5`, `EnhancedDerivedSheaves Layers E1, E2:towers and E3`, `ModularCurvesPartII §§14.1–14.4a`, §0.1, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4`, `DerivedCategory.Q`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`, `AlgebraicTopology Stage 6, cochains and manifold duality`.

Foundational prerequisites: NoncommutativeAndEquivariantIwasawa §0.2 (the analytic-group input of the level index) and G10 (the finite-coefficient support comparison).

## Layer 1: Torsion colimits and smooth actions

This layer takes the colimit over p-levels at a fixed exponent `s`. It proves exactness and cofinality, constructs the smooth action of the full local group by conjugating levels and the commuting tame Hecke operators, records the restriction–corestriction identities with their degree factors (never inverted integrally), and sets up the separate diagram over tame levels.

### 1.1 Fixed-exponent cohomology

For `s≥1` and support `★=ordinary,c,boundary` define `A^n_{★,s}=colim_K H^n(C^★_{K,s})` under pullback, and `A^•_{★,s}=colim_K C^★_{K,s}` in complexes. Exact filtered colimits identify `H^n(A^•_{★,s})` with `A^n_{★,s}`. Give the former cohomology modules the discrete topology at fixed exponent; finite exponent does not mean finite cardinality.

(E06, §2.1, pp.20–23: Fixed-exponent direct limits are computed with lifted simplicial cochains.; LLHLM, §5.3, p.121: Degree-zero forms first take the level colimit and only then the coefficient limit.)

To prove this, apply the existing module/complex colimit to the actual tower. Use exactness from Tau Ceti to commute its cohomology with the filtered colimit. Use refinement-only finality to compute within any compact-open normal basis; transport remains a natural map between reindexed diagrams.

Applications include Layer 2 completion: The coefficient limit is taken on these discrete smooth torsion modules; Layer 8 Scholze convention: Scholze’s fixed `n` object is this colimit, before inverse limit.

The API consists of the following maps and identities.

- A finite-level cohomology class has its native colimit image.
- Two representatives agree iff they agree after a common refinement.
- Restriction to a cofinal basis yields the native final-functor isomorphism.
- `H^n` of the actual filtered complex colimit is the colimit of `H^n`.

**Checks.**

- A constant identity system with value `O/ϖ^s` has that same colimit.
- For degree-p circle covers, degree-one pullback is `p` and the fixed-exponent colimit is zero.
- For `K_0=ℤ_p` fixed `s`, the degree-zero regular torsor colimit contains precisely locally constant functions, not arbitrary set functions. For `p=2`, `s=1`, the singleton indicator at zero is excluded.
- At fixed `s` the regular torsor gives locally constant functions `K_0→O/ϖ^s`.
- The order level colimit then coefficient limit is pinned.

*Needs:* §0.2, `Module.DirectLimit`, `Module.DirectLimit.of`, `Module.DirectLimit.exists_of`, `TauCeti.moduleCat_ab5OfSize`, `TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`, `CategoryTheory.Functor.Final.colimitIso`.

### 1.2 Smooth local-group action

For a specified coherent full-H-equivariant integral coefficient system, transport representatives by `g` and the Layer 0 conjugation dictionary to define a left H-action on `A^n_{★,s}`; right geometric translation is converted using `g⁻¹`. Every finite-level class has an open stabilizer after shrinking to fix its finite coefficient data, so this action is smooth independently of a normal basis. For a fixed `K_0`-stable algebraic lattice `W_0` the same argument gives only a smooth `H_int=Stab_H(W_0)` action on the fixed integral colimit. General `g` change the lattice; Layer 2/Layer 6 supply the full-H action only after rational lattice comparison.

(E06, §2.2, Lemmas 2.2.4,2.2.8–2.2.10 and Theorem 2.2.11, pp.28–32: The integral stabilizer preserves its lattice; other translations vary the lattice and give the rational action.; CE, §1.5, p.7: The trivial-coefficient completed objects have the full local-group action, not just `K_0`.)

To prove this, represent a class at a finite level using `Module.DirectLimit.exists_of`. Apply the natural transport to the conjugate-level representative and prove independence by a common refinement; no colimit relation identifies a class with its translate. Check the group law with the inverse in right geometric translation; shrink the level until finite coefficients are fixed.

**Checks.**

- For the regular-function model `(g f)(x)=f(xg)` is a left action.
- A coefficient action may require a smaller stabilizer than the level subgroup.
- For `H=ℚ_p^×` and `W_0=O` with the standard character, `p` does not act on `W_0/ϖ^s` by a lattice automorphism; the fixed integral colimit has no such full-H action.

*Needs:* §1.1, §0.3, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4`.

### 1.3 Tame Hecke on smooth colimits

The ALS tame double-correspondence maps induce `O/ϖ^s`-linear endomorphisms of `A^n_{★,s}` and of its actual complex, commute with the H-action, and obey the imported convolution/composition law. These are transported actions; the completed Hecke image algebra and its residual factors belong to Layer 8.

(GN, §2.1.4, pp.8–9: Integral finite-level operators are sums over cosets and commute with level reduction.; CE, §1.5, p.7: Tame Hecke acts on the completed tower.)

To prove this, apply the natural correspondence maps to the colimit. Use the finite-level composition law at a common refinement. Check the left/right translation dictionary in the commutation square.

**Checks.**

- The identity correspondence induces identity.
- A p-degree covering trace is not divided by p.

*Needs:* §1.1, §0.3, `ArithmeticLocallySymmetricSpaces §ALS.3.3`.

### 1.4 Integral restriction and corestriction

On the tower, a finite covering of actual degree `d` gives `cor∘res=d`. For a regular cover with effective deck group Q, `res∘cor=Σ_{a∈Q}a`. The formulas `d=[K:U]` and `Q=K/U` require the faithful regular-cover hypothesis; normality of `U` alone does not remove an ineffective central kernel. The corresponding maps induced on fixed-exponent colimits and descent diagrams use these same formulas. No division by `d` is made over `O/ϖ^s` or `O`; Mackey compatibility is inherited with the supplied coefficients.

(E06, Proposition 2.1.11 proof, pp.24–26: Finite-cover descent is applied before the tower limits.; GN, §2.1.4, p.8: Correspondence action is the unnormalized sum with coefficient transport.)

To prove this, specialize the supplied ALS trace identities. Push their natural equalities into the colimit and coefficient diagrams. Keep both composites distinct in subsequent edge maps.

**Checks.**

- For `C_p→point` over `k` the first composite is zero, not identity.
- For a degree-prime-to-p cover, averaging becomes available only after explicitly inverting its degree.
- If `C₂` acts trivially on a point, the geometric cover is the identity: `cor∘res=1`, although the raw group index is 2. Over `F₃`, dividing this trace by 2 gives 2, not 1; at `p=2` that division is unavailable.

*Needs:* §1.1, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 1.5 Tame-level variation

For `K^{p′}⊂K^p` assemble pullback `A_{s}(K^p)→A_s(K^{p′})` and trace in reverse. Form the filtered tame colimit with its smooth tame action, retaining smoothness away from `p` and its component convention. Changing tame level is a different diagram from completion in `s`; interchange with inverse limit in `s` requires its own comparison.

(E06, §2.2, Theorems 2.2.11,2.2.17, pp.31–35: Tame-level variation is a separate inductive system.; CE, Formula (1.4), p.9: Boundary induction is stated only after the tame-level colimit.)

To prove this, use Layer 0 tame-level natural squares. Apply the existing module colimit to the separate tame diagram. Retain fixed `K^p` as the default completion parameter.

Applications include Layer 7 boundary parabolic comparison: Formula (1.4) requires this distinct tame colimit; Nakamura §2.3.1: Its variation away from `p` has a separate restriction diagram.

The API consists of the following maps and identities.

- **Pullback**: Nested tame pullbacks compose in refinement order.
- **Trace**: Tame traces commute with p-level and coefficient transitions.
- **Representatives**: Each tame-colimit class has a representative at one tame level.
- **Components**: The finite archimedean component action is the transported ALS action.
- **Identity and degree**: Identity refinement is identity, and trace after pullback at a degree-d tame cover is multiplication by `d`.
- **Fixed tame level**: Completion at fixed tame level retains that parameter; the separate tame colimit can add classes.

**Checks.**

- For `R=O/ϖ^s`, `s≥1`, a two-point tame cover over a point with trivial p-tower has `H⁰=R²`. Pullback is `a↦(a,a)`, trace is `(a,b)↦a+b`, and `(1,0)` is outside the pullback image, so the finer tame level adds a nonzero class.
- For `K⁰=ℤ₂`, `O=ℤ₃` and trivial p-tower, the fixed-s tame colimit is `C^∞(ℤ₂,ℤ/3^s)`. Its coefficient limit is `C(ℤ₂,ℤ₃)`. The separate colimit of completed finite tame levels is `C^∞(ℤ₂,ℤ₃)` and excludes the continuous function `Σ_(n≥1)3^n·1_(2^nℤ₂)`: its values at zero and at `2^r` differ by the nonzero tail `Σ_(n>r)3^n` for every `r`.
- For the connected degree-two circle cover at `p=3` with coefficients `ℤ/3^s`, degree-one pullback is multiplication by two and trace is identity. Thus trace after pullback is two, whereas degree-zero trace is two and pullback is identity.

*Needs:* §1.1, §1.4, §0.1.

### Examples

For a pro-p circle tower, pullback in degree one is multiplication by `p`, so its fixed-exponent colimit is zero. In degree zero the regular point torsor gives locally constant functions, which are not all set functions when `K_0` is infinite.

### Dependencies

`ArithmeticLocallySymmetricSpaces §ALS.3.3`, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, §0.1, §0.3, §0.2, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4`, `CategoryTheory.Functor.Final.colimitIso`, `Module.DirectLimit`, `Module.DirectLimit.exists_of`, `Module.DirectLimit.of`, `TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`, `TauCeti.moduleCat_ab5OfSize`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

Foundational prerequisites: The smooth action is imported from SmoothRepresentationsOfLocalGroups SR.0; the arithmetic conjugation and Hecke checks are part of the targets above.

## Layer 2: Completion, derived limits and topology

This layer takes the inverse limit over the exponent. It keeps apart the degreewise completed module `H̃^n` and the cohomology of the derived limit, which differ by a `lim¹` term, and states the control theorems that identify them, including a general control lemma for complexes of complete torsion-free modules. It compares the completed module with its reductions through the Bockstein sequence, separates the completion of the integral colimit from its Tate module, proves continuity of the actions, and builds the unitary Banach completion after inverting p.

### 2.1 Completed cohomology

Define `H̃^n_★(K^p,O)=lim_{s≥1} A^n_{★,s}` with coefficient-reduction transitions, as the existing topological-module limit of discrete `A^n_{★,s}`. It is a compatible-family module with projection-induced topology. Do not assert yet that this topology is the `ϖ`-adic topology, or that its reduction is `A^n_{★,s}`.

(CE, §1.1, pp.2–4: The conventional completed cohomology takes the coefficient inverse limit after the level colimit.; E06, §2.1 definitions and Lemma 2.1.4, pp.20–22: Completion is separated and complete; the subsequent admissible-complex argument supplies stronger control.)

To prove this, apply the native topological-module limit to the coefficient diagram. Identify its underlying carrier with compatible sections and check projection equations. State the topology comparison as a subsequent theorem with control hypotheses.

Applications include Layer 3 duals: Topology must be fixed before a continuous dual can be formed; Layer 6 descent: This is the conventional module in the `E₂` page.

The API consists of the following maps and identities.

- **Projection**: Projection to `A^n_{★,s}` is continuous and O-linear.
- **Extensionality**: Equality of all coefficient projections implies equality.
- **Universal property**: A compatible family of continuous linear maps uniquely induces a map into `H̃`.
- **Support map**: The finite-level support natural transformation induces `H̃_c→H̃`.

**Checks.**

- **Point tower**: A constant point tower with trivial coefficients gives `O` in degree zero.
- **Regular torsor tower**: The regular `K_0` torsor tower gives `C(K_0,O)`, with uniform `ϖ`-adic topology once the explicit reduction control is proved.
- **Circle tower**: For the degree-p circle tower `H̃⁰=O` and `H̃¹=0`; levelwise `H¹` remains `O`.
- The object uses `lim_s colim_K`, not `lim_K colim_s`.
- Continuity is checked in the stated limit topology.

*Needs:* §1.1, `TopModuleCat.isLimit`, `ModuleCat.sectionsSubmodule`.

### 2.2 Derived completed tower

For the enhanced ordinary, compact-support and boundary complex diagram define `𝒞_★=Rlim_s A^•_{★,s}` in `D(O)`. Use the supplied countable homotopy-limit model `Cone(1−shift:∏_s A^•_{★,s}→∏_s A^•_{★,s})[−1]`, with its projection cone and coherent actions. This is a derived object distinct from `H̃^n_★`.

(E06, Proposition 1.2.12, p.16; Proposition 2.1.11, pp.24–26: Cohomology/limit interchange is established through a pro-system comparison, not assumed.; CE, §1.1, pp.2–4: The degreewise definition motivates a separate derived comparison.)

To prove this, use the general homotopy inverse limit contract from DerivedModuleAlgebra §§1.T.1 and 1.1; its existing Milnor theorem for degreewise-surjective ordinary limits is narrower. Apply it to the actual enhanced diagram and its natural support triangle. Carry the `H` and tame Hecke actions through the functorial cone.

Applications include Layer 7 exact triangle: The homotopy-limit functor preserves the actual diagram of triangles; Layer 6 derived invariants: Derived descent is formulated on this complex.

The API consists of the following maps and identities.

- **Projection**: The homotopy-limit projection cone is natural in `s` and in support.
- **Functoriality**: Coherent tower maps induce maps on 𝒞 with identity and composition laws.
- **Quasi-isomorphism invariance**: A natural objectwise quasi-isomorphism of enhanced towers induces an isomorphism of 𝒞.
- **Comparison with the limit**: A degreewise ML representative has its named ordinary-limit comparison.

**Checks.**

- **Constant tower**: A constant identity complex tower gives its original object in `D(O)`.
- **Nonvanishing lim¹**: For the auxiliary abelian tower `ℤ←pZ←pZ←⋯` in degree zero, `H¹(Rlim)=ℤ_p/ℤ` although `lim=0`.
- **Sign of the shift**: The support connecting map lands in the shift by `+1` of the completed compact-support object.
- For a general tower, `H^n(𝒞)` can have a nonzero `lim¹` contribution.
- The cone shift and the connecting sign are checked.

*Needs:* §1.1, `DerivedCategory.Q`, `DerivedModuleAlgebra §§1.T.1 and 1.1`.

### 2.3 Milnor comparison for the tower

For each `n` the supplied countable derived limit gives `0→lim¹_s A^{n−1}_{★,s}→H^n(𝒞_★)→H̃^n_★→0`, naturally for support, Hecke, conjugation and coefficients. The last arrow is an isomorphism when `{A^{n−1}_{★,s}}` is ML. For a degreewise-surjective complex representative this specializes to DerivedModuleAlgebra §1.1; ML of terms alone does not imply ML of cohomology.

(E06, Propositions 1.2.12 and 2.1.11, pp.16,24–26: Admissible pro-system comparison is the proof mechanism for the required interchange.)

To prove this, apply the generic derived-limit spectral sequence, using countable cohomological dimension one. Use exact filtered colimits to identify its coefficient cohomology terms. Apply the supplied ML-vanishing theorem separately in every degree used.

**Checks.**

- A nonzero `lim¹` test prevents unconditional interchange.
- A finite coefficient ring alone does not make the level colimit finite.

*Needs:* §2.2, §2.1, `DerivedModuleAlgebra §1.1, linear Milnor sequence`, `DerivedModuleAlgebra §1.T.1, ML vanishing`.

### 2.4 Integral admissible-complex control

For a bounded cochain complex `S^•` of Emerton-admissible integral `K_0`-modules (complete separated `ϖ`-adic modules, bounded `ϖ`-torsion, rationalization admissible), the system `{H^n(S)/ϖ^s}→{H^n(S/ϖ^s)}` has essentially-null kernel and cokernel: each fixed target index is killed by a sufficiently subsequent transition. Hence `H^n(S)≅lim_s H^n(S/ϖ^s)` as integral topological modules; the tower constructed from finite lifted cells has such a model by Layer 4. This is not a fixed-s reduction isomorphism.

(E06, Definition 1.2.1 and Proposition 1.2.4, pp.13–14; Definition 1.2.8 and Propositions 1.2.10–1.2.12, pp.15–16: Strict kernels/images and the quotient by essentially-null systems prove cohomological completeness.)

To prove this, use the admissible Banach category and Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1 as imported in F.1; prove its integral strict-category comparison in F.1 and §2.4. For each differential use closed images and bounded cokernel torsion to control induced `ϖ` topologies. Follow Emerton’s exact reduction functor in the pro-category modulo essentially-null systems, then its inverse-limit quasi-inverse.

**Checks.**

- The test complex `O --ϖ→ O` is complete, but its degree-zero `mod-ϖ` cohomology has a torsion error.
- No circular dependency on Layer 5 is used: the foundational category is supplied independently.

*Needs:* §2.2, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 2.5 Control of complete torsion-free complexes

Let `M^•` be a bounded-above complex of `ϖ`-adically complete, `ϖ`-torsion-free O-modules. Then (1) no nonzero element of `H^i(M^•)` has a compatible system of `ϖ`-power roots (`x_0 = x` and `ϖ x_n = x_{n−1}`): `Hom_O(E, H^i(M^•)) = 0`, hence its `ϖ`-adic Tate module `lim_n H^i(M^•)[ϖ^n]` (transitions multiplication by `ϖ`) is zero. This does not say that `H^i(M^•)` has no nonzero `ϖ`-divisible element (one lying in `ϖ^n H^i(M^•)` for every `n`); without the hypothesis of (4) such elements can exist; (2) for every `n` there is a natural exact sequence `0 → H^i(M^•)/ϖ^n → H^i(M^•/ϖ^n) → H^{i+1}(M^•)[ϖ^n] → 0`, and these sequences form an inverse system whose third terms have transition multiplication by `ϖ`; (3) the induced map `lim_n H^i(M^•)/ϖ^n → lim_n H^i(M^•/ϖ^n)` is an isomorphism; (4) if moreover `lim_n H^i(M^•/ϖ^n)` has bounded `ϖ`-power torsion for every `i`, then `H^i(M^•) → lim_n H^i(M^•)/ϖ^n` is also an isomorphism, so `H^i(M^•)` is `ϖ`-adically complete and separated and equals `lim_n H^i(M^•/ϖ^n)`. The statement is for complete and torsion-free terms: for `M = E` in degree 0 the limit of `H^0(M/ϖ^n)` is 0 while `H^0(M) = E`.

Assume throughout this subsection that `M^•` is bounded above; each `M^i` is `ϖ`-adically complete and separated (IsAdicComplete for the ideal `(ϖ)`) and `ϖ`-torsion-free. Clause (4) also assumes that every `lim_n H^i(M^•/ϖ^n)` has bounded `ϖ`-power torsion. The convergent-sum proof of clause (1) works more generally over any commutative ring `O` with an element `ϖ`, provided each term is IsAdicComplete for `(ϖ)` and multiplication by `ϖ` is injective. In that form `E` is replaced by `O[1/ϖ]`; the algebraic assertion makes no additional claim about an arithmetic tower.

(Pan22, §4.4, Lemma 4.4.4, Forum Math. Pi 10 (2022), e7, statement p. 44, proof p. 45 (arXiv:2008.07099v3, p. 48): For a bounded-above complex of p-adically complete p-torsion-free modules whose `mod-p^n` cohomologies have limits with bounded torsion, cohomology is the limit of its reductions and the limit of the `mod-p^n` cohomologies; the proof shows that no cohomology module receives a nonzero map from `ℚ_p`, uses the universal-coefficient sequence with multiplication by `p` on the torsion terms, and concludes by a divisibility argument.)

To prove this, divisible elements: if `x_n ∈ H^i(M)` satisfy `ϖ x_n = x_{n−1}` with `x_0 ≠ 0`, lift them to cocycles `x̃_n` and choose `y_n` with `d y_n = x̃_{n−1} − ϖ x̃_n`; the convergent sum `y = Σ ϖ^{n−1} y_n` satisfies `dy = x̃_0`, a contradiction. So `Hom_O(E, H^i) = 0`, and the Tate module, a submodule of `Hom_O(E, H^i)` by the sequence `0 → O → E → E/O → 0`, vanishes. Bockstein: `M` is `ϖ`-torsion-free, so `0 → M → M → M/ϖ^n → 0` (multiplication by `ϖ^n`) is exact; its long exact sequence gives (2), and comparing `n + 1` with `n` shows that the transition on the third terms is multiplication by `ϖ`. The third terms form a system with zero limit by (1). The first terms `H^i/ϖ^n` have surjective transitions, so their `lim¹` vanishes (DerivedModuleAlgebra §1.T.1, ML vanishing) and the limit of the exact sequences gives (3). Completeness: `H^i(M)` is a quotient of the complete module of cocycles, so `H^i(M) → lim H^i(M)/ϖ^n` is onto. If its kernel `K` were nonzero, bounded torsion (`ϖ^k` kills the torsion of the limit) shows `ϖ K = K`, which with (1) forces `K = 0`.

Downstream applications include CohomologyComparisons CP.6/pan-bounded-torsion-inverse-limit: Pan's bounded-torsion inverse-limit argument for `A_inf`-coefficient cohomology of the perfectoid modular curve applies this lemma to a Čech complex; §2.5 supplies exactly this control; 4.5: Identifies the completed tensor form of completed cohomology with arbitrary complete torsion-free coefficients.

**Checks.**

- `M = O` in degree 0: both limits are `O`.
- `M = [O → O]` in degrees 0, 1 with differential multiplication by `ϖ`: `H^0 = 0` and `H^1 = O/ϖ = k`. `H^0(M/ϖ^n) = ϖ^{n−1}O/ϖ^n ≅ k` is nonzero for every `n`, and the Bockstein sequence identifies it with `H^1[ϖ^n] = k`, whose transitions are multiplication by `ϖ`, hence zero: the limit of the `H^0(M/ϖ^n)` is `0 = H^0(M)`.
- Completeness is needed: `M = E` in degree 0 is torsion-free but not complete, and `E` is `ϖ`-divisible with `lim_n E/ϖ^n = 0 ≠ E`.
- Divisible elements need not vanish without the hypothesis of (4): let `M^0 = M^1` be the `ϖ`-adic completion of the free O-module on `e_1`, `e_2`, … (the null sequences in `O`) and `d(e_n) = ϖ^n e_n`. The class of `w = Σ ϖ^n e_n` in `H^1` is nonzero, since a preimage would have to be `Σ e_n`, which is not a null sequence, yet `w − d(e_1 + … + e_{k−1})` lies in `ϖ^k M^1` for every `k`, so the class lies in every `ϖ^k H^1`. Here `lim_m H^1/ϖ^m` is the completion of the direct sum of the `O/ϖ^n`, whose `ϖ`-power torsion is unbounded, and `Hom_O(E, H^1) = 0` still holds.

*Needs:* `DerivedModuleAlgebra §1.T.1, ML vanishing`, `IsAdicComplete`.

### 2.6 Adic topology and continuous actions

Suppose a bounded integral admissible cochain complex `S` is supplied, with compatible identifications `H^n(S)=H̃^n_★` and `H^n(S/ϖ^s)=A^n_{★,s}`, and with the strict pro-system control of 2.4. Then `H̃^n_★` is `ϖ`-adically separated and complete with bounded `ϖ`-torsion, and its coefficient projection topology agrees with its `ϖ`-adic topology. The `H_int`-action and transported Hecke endomorphisms are continuous; for a coherent full-H-equivariant integral system `H_int` may be replaced by `H`. Joint `H_int×H̃` continuity follows from smoothness of every discrete coefficient quotient and the topology comparison. Sections 4.2–4.3 construct the required `S` for the lifted finite-cell tower; this conditional control theorem does not assume that construction.

(E06, Lemma 2.1.4 and Theorem 2.1.5 proof, pp.21–24: The completed cochain model gives the actual topology and continuous admissible action.; CE, Theorem 1.1(2), pp.3–4: Integral completeness and bounded torsion are asserted separately in the survey.)

To prove this, first prove the named coefficient/pro-system comparison; prove the uniform bound in G2. Use complete admissible cohomology to identify the two topologies, retaining possible fixed-s reduction errors. Use the open stabilizer at a coefficient index to prove joint continuity, then transport Hecke maps by continuous projections.

**Checks.**

- Continuity is not inferred solely from algebraic equivariance.
- For `C(ℤ_p,O)`, the topology is uniform `ϖ`-adic, not pointwise convergence.

*Needs:* §2.1, §2.4, §1.2; the supplied admissible model and reduction comparisons specified above.

### 2.7 Completion and Tate module

Put `B^n_★=colim_K H^n(C^★_{K,O})` under pullback. Define `Ĥ^n_★=lim_s B^n_★/ϖ^s` and `T_ϖ B^n_★=lim_s B^n_★[ϖ^s]` with transition multiplication by `ϖ`, not inclusion or reduction. These modules are separate from `H̃`. The Tate module is `ϖ`-torsion-free; a divisible part of `B` is killed by completion but its divisible torsion may contribute to `T_ϖ`.

(CE, Definitions before (1.1), pp.4–5: Integral-colimit completion and its Tate module explain the error between integral and finite-coefficient completion.; E06, §2.1, pp.20–22: The UCT yields the comparison sequence.)

To prove this, use Mathlib AdicCompletion for the ideal `(ϖ)` and identify its quotient projections with those of `Ĥ`. For the Tate factor use the native Tau Ceti p-adic Tate module at `O = ℤ_p`, and the O-linear uniformizer variant and cofinal comparison specified in the supplier contracts for general O. Specify the torsion transition as multiplication by `ϖ`. Derive torsion-freeness by shifting the compatible-family equations.

Applications include Layer 2 UCT completion: These are the left and right terms of the comparison sequence; Layer 5 semisimple theorem: The Tate dual is a distinct torsion rank contribution.

The API consists of the following maps and identities.

- **Completion projection**: `Ĥ` projects to `B/ϖ^s`.
- **Tate-module projection**: `T_ϖ` projects to `B[ϖ^s]`, with `ϖ t_{s+1}=t_s`.
- **Functoriality**: O-linear compatible level maps induce maps of both objects.
- **Torsion-free Tate module**: Multiplication by `ϖ` on `T_ϖ` is injective.

**Checks.**

- **Finite free module**: For `B=O`, `Ĥ=O` and `T_ϖ=0`.
- **Divisible torsion module**: For `B=E/O`, `Ĥ=0` and `T_ϖ≅O`.
- **Bounded torsion module**: For `B=O/ϖ^a`, `Ĥ=B` and `T_ϖ=0`; using inclusion transitions would give the wrong Tate module.
- Completion is not defined by taking only the torsion-free part of `B`.
- Tate-module transition direction is explicit.

*Needs:* §0.2, §1.1, §2.1.

### 2.8 Completion–Tate exact sequence

For the finite-projective coefficient lattice and actual finite-cell UCT tower, `0→Ĥ^n_★→H̃^n_★→T_ϖ B^{n+1}_★→0` is exact and natural for the supplied support/Hecke maps. If the `ϖ`-torsion exponents of all finite-level `H^{n+1}` are uniformly bounded, the last term vanishes. No boundedness conclusion follows from each individual level being finite.

(E06, §2.1, displayed UCT and Lemma 2.1.4, pp.20–22: The quotient system is surjective, so `lim¹` on its left term vanishes.; CE, Equation (1.1), pp.4–5; Remark 1.15, p.12: The completed object differs by the next-degree Tate module.)

To prove this, take finite-level UCT `0→H^n/ϖ^s→H^n(mod ϖ^s)→H^{n+1}[ϖ^s]→0`. Use exact filtered colimit and track `multiplication-by-ϖ` on the right transition. Use surjectivity of `{B^n/ϖ^s}` and the six-term inverse-limit sequence.

**Checks.**

- The degree-p circle tower has `Ĥ¹=0` and `H̃¹=0`.
- `B=E/O` shows why killing divisible torsion before taking `T_ϖ` is wrong.

*Needs:* §2.7, `DerivedModuleAlgebra §1.T.1, six-term exact sequence`.

### 2.9 Coefficient Bockstein comparison

After the integral admissible-complex comparison identifies `H̃^n` with `H^n(S)`, derived reduction gives `0→H̃^n/ϖ^s→A^n_s→H̃^{n+1}[ϖ^s]→0`. The reduction map is an isomorphism only when the next-degree torsion term vanishes. For an arbitrary coefficient tower lacking that comparison, use `𝒞⊗ᴸ O/ϖ^s` and its separate base-change map to `A^•_s`, with the Milnor error retained.

Assume that a bounded integral admissible cochain model `S` is supplied with the strict control of 2.4, that it is O-flat, and that its derived reduction `S⊗ᴸ_O O/ϖ^s` identifies with the actual fixed-exponent tower cochain complex, compatibly for all `s`. These are hypotheses of the coefficient comparison. Layer 4 supplies their arithmetic instance; cohomological completeness alone does not imply them.

(CE, Theorem 1.16(5), p.13: The mod-p comparison contains a next-degree torsion term.; E06, Proposition 1.2.12, p.16: The comparison is established pro-systemically before reducing at one index.)

To prove this, use the `multiplication-by-ϖ^s` triangle of the flat integral cellular cochain model. Identify its reduction with the fixed-exponent tower using the established model comparison. If this identification is missing, state its failure as G2 rather than replacing `A_s` by a quotient by definition.

**Checks.**

- For `S=(O --ϖ→ O)` in degrees 0,1, `H⁰(S)=0` but `H⁰(S⊗ᴸk)=k`.
- The torsion term cannot be discarded merely because `O` is torsion-free.

*Needs:* §2.1, §2.4, §2.3; the supplied flat model and reduction comparisons specified above.

### 2.10 Unitary Banach completion

Under the topology and bounded-torsion theorem put `L=H̃^n_★/H̃^n_★[ϖ^∞]` with its complete separated `ϖ`-adic topology and `B=L⊗_O E`. The gauge norm with unit ball `L` makes `B` a unitary E-Banach representation for trivial coefficient action, or for a specified full-H-stable lattice. For algebraic coefficients the full-H action is constructed by maps between commensurable transported lattices, using E06 Lemmas 2.2.8–2.2.10; the resulting rational representation is continuous and compact-open admissible once Layer 5 applies. Full-H unitarity still requires a full-H-stable lattice. The Banach category and Schikhof duality are those of PadicLocalLanglandsForGL2Qp §0.1, imported in F.1.

(E06, Lemma 2.1.4, Theorem 2.1.5, pp.21–24; Lemmas 2.2.8–2.2.10 and Theorem 2.2.11, pp.30–32: The complete torsion-free lattice gives the Banach space; algebraic coefficient translations require lattice transport.; ST, Theorem 2.3, pp.11–12; §3, pp.12–15: The general duality and admissible category are foundational inputs.)

To prove this, quotient by bounded torsion and use completeness of the torsion-free lattice. Apply the supplied nonarchimedean gauge completion theorem and stable-lattice unitary criterion. For algebraic coefficients use E06 Lemmas 2.2.8–2.2.10: inclusions between commensurable lattices induce bounded maps and inverse rational isomorphisms. Transport `W_0` to `g⁻¹W_0`, check the group law and continuity near the identity in `H_int`, and only then obtain the full-H rational action.

Applications include Layer 5 Banach admissibility: admissibility in the category of PadicLocalLanglandsForGL2Qp §0.1 is deduced from the actual finitely generated compact dual.

The API consists of the following maps and identities.

- **Unit ball**: `L` embeds as the chosen bounded open unit ball in `B`.
- **Rational maps**: A continuous integral tower map induces a bounded E-linear map.
- **Isometric action**: A lattice-preserving H-action acts by isometries.
- **Change of lattice**: Commensurable lattices give inverse rational comparison maps and equivalent norms by E06 Lemmas 2.2.8–2.2.10. Combining these with g-induced lattice transport gives the same rational topological H-representation.

**Checks.**

- **Point tower**: The point tower gives `E` with unit ball `O`.
- **Torsion killed**: A completed module killed by `ϖ^a` rationalizes to zero.
- **Non-unitary character**: The character `ℚ_p^×→E^×` sending `p` to `p` cannot preserve `O` as a full-group unit ball; its compact-open restriction can.
- Unitarity is conditional on a stable lattice.
- This construction does not itself prove admissibility.

*Needs:* §2.6, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### Examples

The inverse coefficient limit of the functions on the regular point tower is `C(K_0, O)` with the uniform `ϖ`-adic topology. For the auxiliary uncontrolled discrete tower `ℤ` with transitions `p`, `lim` is zero but `lim¹ = ℤ_p/ℤ`, so degreewise completion and derived completion differ. For the complex `[O → O]` with differential `ϖ`, `H^0(M/ϖ^n) ≅ k` for every `n` but the transitions vanish, so the limit is `0 = H^0(M)`; for `M = E` in degree 0 completeness fails and `lim E/ϖ^n = 0 ≠ E` (2.5).

### Dependencies

`DerivedModuleAlgebra §§1.T.1 and 1.1`, `DerivedModuleAlgebra §1.T.1, six-term exact sequence`, `DerivedModuleAlgebra §1.1, linear Milnor sequence`, `DerivedModuleAlgebra §1.T.1, ML vanishing`, §0.2, §1.1, §1.2, §4.3, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `DerivedCategory.Q`, `IsAdicComplete`, `ModuleCat.sectionsSubmodule`, `TopModuleCat.isLimit`.

Foundational prerequisites: G2 (strict integral control), the enhanced countable `Rlim` of DerivedModuleAlgebra §§1.T.1 and 1.1, and the Banach category and Schikhof duality of PadicLocalLanglandsForGL2Qp §0.1 as imported in F.1.

## Layer 3: Continuous duals and completed homology

This layer fixes the dual categories, continuous O-duals and Pontryagin duals with their topologies and action conventions, defines completed homology and Borel–Moore homology as limits under pushforward, and proves the integral duality between completed homology and completed cohomology with its torsion terms. It also contains Fu's double-limit model of completed homology, the completed modules at varying tame level with their Borel–Moore duality used by Nakamura, and the admissible complexes and coefficient-module dualities used by Boxer–Pilloni and Nakamura.

### 3.1 Continuous tower duals

The notation `D_t` abbreviates `DualitySupport.torsionDual` of PadicLocalLanglandsForGL2Qp §0.3 and its compact-to-discrete counterpart, and `D_O` abbreviates the Schikhof dual of §0.1 there, in the extension of F.1. For a compact Hausdorff linearly topologized O-module `M` this gives `D_t(M)=Hom_cont,O(M,E/O)`, with discrete topology, and `D_O(M)=Hom_cont,O(M,O)`, with the uniform `ϖ`-adic topology. For a discrete `ϖ`-primary torsion module `V`, `D_t(V)=Hom_O(V,E/O)` has pointwise compact topology. For a complete separated torsion-free `ϖ`-adic lattice `L`, `D_O(L)=Hom_O(L,O)` has pointwise compact topology. A left action on the source gives a right transpose action `(f·g)(m)=f(gm)`; applying inversion gives the left contragredient `(g f)(m)=f(g⁻¹m)`. Never identify these two conventions without the anti-involution. The left contragredient is `DualitySupport.contragredient` on both duals, with the pointwise compact and uniform lattice topologies above, and it sends a central character `ζ` to `ζ⁻¹`.

(CE, Theorem 1.1(3) and §1.2, pp.3–5: Continuous and algebraic duals carry different topologies; left Ext-duals use inversion.; ST, §§1–2, Theorem 2.3, pp.2–12: Compact and Banach duality supplies the qualified topology conventions.; Nakamura, Appendix B.1, pp.90–91: Pointwise compact O-duals are distinct from `ϖ`-adic complete lattices.)

To prove this, identify the imported duals with native continuous linear maps to the coefficient targets. The compact/discrete topologies on the torsion pair are those of `DualitySupport.finiteQuotient`. Compare `E/O`-valued O-linear characters of a `ϖ`-primary module with the native Circle-valued Pontryagin carrier in two steps: `DualitySupport.traceComparison` with a chosen generator of the inverse different identifies them with `ℚ_p/ℤ_p`-valued characters, and a specified embedding of `ℚ_p/ℤ_p` into Circle identifies these with continuous Circle-valued characters. Keep the O-linear structure separately. Compare inverse precomposition with Representation.dual on the O-valued algebraic dual, restricting to continuous maps; do not identify the `E/O`-valued carrier with that O-valued dual.

Applications include Layer 3 integral UCT: Both `O` and `E/O` targets occur, in different terms; BP §5.4; LLHLM (5.8): Transpose and contragredient conventions control specialization and Pontryagin duals.

The API consists of the following maps and identities.

- **Evaluation pairing**: Evaluation is the O-bilinear pairing with the prescribed topology.
- **Functoriality**: A continuous source map induces contravariant precomposition.
- **Left action**: The left dual action uses the inverse group element.
- **Native carrier**: The O-valued continuous dual embeds equivariantly in Module.Dual `O M` with the inverse-precomposition action of Representation.dual. The `E/O`-valued dual shares this action formula but is not Module.Dual `O M`; its coefficient target and topology require a separate adapter.

**Checks.**

- **Finite torsion module**: `D_t(O/ϖ^s)≅O/ϖ^s` while `D_O(O/ϖ^s)=0`.
- **Torsion-free module**: `D_O(O)=O` and `D_t(O)=E/O`, with their different topologies.
- **Noncommuting action**: On `O²` let `A=[[1,1],[0,1]]`, `B=[[1,0],[1,1]]`, `φ(x)=x₁` and `x=(1,0)`. Then `φ(B⁻¹A⁻¹x)=1` but `φ(A⁻¹B⁻¹x)=2`, so the left dual of AB uses `B⁻¹A⁻¹`. These values remain distinct at `p=2` and over ramified `O`. Transpose without inversion is a right action.
- A direct transpose action is right-handed.
- Circle-valued additive characters alone are not the O-linear `E/O` dual.

*Needs:* §2.1, `ContinuousLinearMap`, `PontryaginDual`, `Representation.dual`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, PadicLocalLanglandsForGL2Qp §§0.1 and 0.3.

### 3.2 Qualified tower biduality

Evaluation identifies `M≅D_tD_tM` for compact Hausdorff linearly topologized inverse limits of finite `ϖ`-primary O-modules, and `V≅D_tD_tV` for discrete `ϖ`-primary torsion modules. It also identifies `M≅D_OD_OM` for torsion-free compact O-modules and `L≅D_OD_OL` for complete separated torsion-free `ϖ`-adic O-lattices, with the two dual topologies of the definition. No O-dual biduality is asserted for a module with torsion or with a different topology.

(ST, §1, Theorem 1.2, Propositions 1.3, 1.6 and Lemmas 1.4–1.5; §2, Theorem 2.3, pp.3–12: The relevant compact and complete-lattice categories support biduality.; E11, Appendix C, (C.3)–(C.4), pp.103–104: Torsion-free complete lattices and torsion-free profinite modules form the required dual categories.)

To prove this, for the `E/O`-pair apply `DualitySupport.bidual` and `DualitySupport.finiteQuotient` of PadicLocalLanglandsForGL2Qp §0.3: finite-length O-module duality with the injective cogenerator `E/O`, passed from compact inverse systems to discrete direct systems by compatible finite evaluations. For the O-pair use the Schikhof biduality of F.1, which extends §0.1's duality, with its pointwise/uniform topology dictionary.

**Checks.**

- `O/ϖ` is lost by `D_OD_O` and hence is an explicit non-example.
- For `K=ℤ₃` and `O=ℤ₃`, the compatible quotient measures `μ_r=(1/2)Σ_(a=0)^(3^r−1)(−1)^a[a]` define a uniform-continuous O-linear functional on `C(K,O)`. Each residue class has three lifts with alternating sum `1−1+1`, giving compatibility. Every residue ball has nonzero mod-3 mass, so no finite set of evaluations controls this functional modulo three; it is not pointwise-continuous.
- For finite `K`, uniform and pointwise topologies on `C(K,O)` coincide, as do their continuous O-duals.

*Needs:* §3.1, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 3.3 Completed homology

Define `H̃_n=lim_U H_n(Y_{UK^p},O)` under covering pushforward, and `H̃_n^{BM}=lim_U H_n^{BM}(Y_{UK^p},O)` under proper pushforward, with their compact projective-limit topologies at finite-type neat levels. At fixed `s` put `H̃_{n,s}=lim_U H_n(Y_{UK^p},O/ϖ^s)`, with the BM variant. These are separate from reductions `H̃_n/ϖ^s` until the Bockstein theorem is applied. Over a Borel–Serre pair, BM is computed by its relative chains, not by forgetting the boundary.

(CE, §1.1 definitions, p.2; Theorem 1.16, pp.12–13: Homology uses the inverse level system and has a separate finite-coefficient variant.; GN, §2.1.3, p.8: Completed homology is the inverse limit of actual finite-level homology.; Nakamura, Remark 2.3, p.21: For modular curves BM is the relative homology of the compact curve and its cusps.)

To prove this, apply the existing topological-module limit to actual finite-level homology. Use the finite-cell model to give each level its compact O-module topology. Prove the cofinal normal-basis isomorphism, then carry the proper pushforward/support maps into the limit.

Applications include Layer 4 cellular comparison: The completed chain model must recover this independently defined module; Fu §7; Nakamura §2.3: The homological descent and BM duality use these actual modules.

The API consists of the following maps and identities.

- **Projection**: The U-component is the actual finite-level `H_n`, with pushforward compatibility.
- **Extensionality**: All level projections jointly detect equality.
- **Cofinality**: Cofinal normal restriction gives an isomorphism of compact modules.
- **Map to Borel–Moore homology**: The finite support map induces `H̃_n→H̃_n^{BM}`.

**Checks.**

- **Regular torsor in degree zero**: The finite regular `K_0/U` torsor gives `H̃₀≅O[[K_0]]`, with projection to each group ring.
- **Circle pushforward**: Degree-p circle covers give `H̃₁=0`; replacing pushforward by a transfer gives a different limit.
- **Relative interval**: For an oriented interval with its two endpoints as boundary, `H₁(interval,boundary;O)=O` while absolute `H₁=0`.
- In the circle tower `H̃₀=O`, `H̃₁=0`: pushforward in `H₁` multiplies by p.
- A cusp relative class is retained by BM.

*Needs:* §0.2, §3.1, `ArithmeticLocallySymmetricSpaces §§ALS.2.1–ALS.2.3`, `ArithmeticLocallySymmetricSpaces §ALS.1.6`, `TopModuleCat.isLimit`.

### 3.4 Completed group-algebra action

For completed homology with its compact Hausdorff totally disconnected topological O-module structure and continuous O-linear `K_0`-action, import TauCeti.IsCompactModule.completedGroupAlgebraModule to obtain the continuous left action of `Λ=TauCeti.completedGroupAlgebra O K_0`. This existing pinned-library construction is not specified again. Identify `Λ=lim_U O[K_0/U]` with `lim_{U,s}(O/ϖ^s)[K_0/U]` using completeness of `O` and the finite free coefficient modules, compatibly with the normal basis and its topology. On the compact dual use the right transpose action and the inversion anti-isomorphism `Λ→Λ^op`. At quotient `(U,s)`, `[g]` acts by the actual deck transformation `g`. Uniqueness among continuous O-linear extensions follows by the density of finite O-linear combinations of group elements.

(CE, Theorem 1.1(1) and §1.2, pp.3,5: Homology is a left completed-group-ring module; dual `Ext` actions need inversion.; GN, §2.1.3, p.8: The natural compact-open action acts on completed homology.)

To prove this, verify the arithmetic inverse limit satisfies TauCeti.IsCompactModule `O M` and that the `K_0`-action is jointly continuous and commutes with O-scalars; install the existing structure with letI `:=` hM.completedGroupAlgebraModule `K_0`. Use `completedSMul_of`, `mkQ_completedSMul` and `continuousSMul_completedGroupAlgebraModule` for the finite action and continuity. Compare the single-index native ring with the two-index coefficient presentation by finite-rank O-adic completeness and commuting compatible limits. Use `completedGroupAlgebra.dense_span_range_of` to prove uniqueness of continuous extensions. Check inversion and the paired chain/cochain deck actions; no generic completed-ring or compact-module constructor is added.

**Checks.**

- For `S₃`, the product [g][h] acts in the order gh.
- The continuous extension needs the compact module topology, not just an abstract group action.

*Needs:* §3.3, §3.1, `ProfiniteProPGroups Layer 9 prerequisites, completed group algebra and compact modules`.

### 3.5 Finite-coefficient completed duality

For finite-cell towers with compatible finite-projective coefficients and their duals, evaluation identifies `A^n_k≅Hom_cont,k(H̃_{n,k},k)` and `H̃_{n,k}≅Hom_k(A^n_k,k)`, including compact-support/BM. The finite-level coefficient triangles and exact compact inverse limit give `0→H̃_n/ϖ→H̃_{n,k}→H̃_{n−1}[ϖ]→0`. With nontrivial coefficient lattice replace one coefficient system by its O-linear dual. This is algebraic UCT duality, not dimension-shifting Poincaré duality.

(CE, Theorem 1.16(3),(5), p.13: Finite-field duality is exact, whereas integral reduction retains adjacent torsion.; E06, Theorem 2.1.5 proof, pp.22–24: Finite cochain terms are dual to finite chains, compatibly with level maps.)

To prove this, dualize finite complexes over `k`, where linear dual is exact. Use continuous duality of the compact inverse level system and exactness of the discrete colimit. For the displayed sequence take the inverse limit of the finite-level homology UCT sequences. Their terms are compact finitely generated O-modules with continuous transitions, so compact inverse limit is exact. Applying this also to the kernel and image sequences of multiplication by `ϖ` identifies the outer limits with `H̃_n/ϖ` and `H̃_{n−1}[ϖ]`. No completed finite-projective `Λ`-model is needed for this step.

**Checks.**

- For the two-term chain `O --ϖ→ O`, `H̃_{1,k}=k` comes from `H̃₀[ϖ]`.
- The compact inverse limit is dual to the discrete colimit, not to an unrestricted product.

*Needs:* §3.3, §3.1, §3.2, `ArithmeticLocallySymmetricSpaces §ALS.1.6`, PadicMeasuresIwasawaAlgebras §5.2 for exact inverse limits of compact modules; F.1 for the duality category.

### 3.6 Finite-coefficient model of completed homology

Fix the tame level `K^p`, a compact open `K_0` of the p-adic group with a countable basis of open normal subgroups `U`, and the neat finite-type tower `Y_U` with the finite free O-local system of 3.3. For every `n` the coefficient-reduction maps induce an `O[[K_0]]`-linear homeomorphism `H̃_n ≅ lim_s H̃_{n,s}`, where `H̃_{n,s} = lim_U H_n(Y_U, O/ϖ^s)`; likewise `H̃_n^{BM} ≅ lim_s lim_U H_n^{BM}(Y_U, O/ϖ^s)`. The isomorphisms commute with the support map `H̃_n → H̃_n^{BM}`, covering pushforward, conjugation and the transported tame Hecke maps. Consequently the rational completed homology of Fu, `(lim_s lim_U H_n(Y_U, ℤ/p^s)) ⊗_{ℤ_p} K` for a finite extension `K/ℚ_p`, is `K ⊗_{ℤ_p} H̃_n` for `O = ℤ_p`: rationalisation is applied after both limits. It is not the limit `lim_U H_n(Y_U, E)` of rational finite-level homology: in the tower of connected degree-p covers of a circle the first is 0 and the second is `E`.

Fix the tame level `K^p`, and assume that every `Y_U` is a neat finite level with the finite cellular model of ArithmeticLocallySymmetricSpaces §ALS.1.6 (relative cells of the Borel–Serre pair for Borel–Moore homology), so its homology with coefficients in a finite O-module is a finite O-module. The coefficient system is the finite free O-local system fixed in 3.3; for an algebraic lattice `W_0` the integral local actions are those of `H_int = Stab_H(W_0)`. Fu's instance: `O = ℤ_p` and the rationalisation is `⊗_{ℤ_p} K` for a finite extension `K` of `ℚ_p`.

(Fu, §1, equation (4), p. 3; §7, the displayed definition before (38), p. 23: Fu defines completed homology at a fixed tame level as the limit over the exponent `s` of the limit over p-levels of homology with `ℤ/p^s` coefficients, tensored afterwards with a finite extension `K` of `ℚ_p`, and quotes its finite generation over `K[[G]]` from Emerton and Calegari–Emerton.; CE, §1.1, p. 2; Theorem 1.1(1), p. 3: Calegari and Emerton define completed homology as the limit over the tower of homology with `ℤ_p` coefficients, assuming each space has the homotopy type of a finite simplicial complex so that all these groups are finitely generated, and state that the projective-limit topology is the canonical one.)

To prove this, at a fixed level `U` the cellular chain complex `C_U` is a bounded complex of finite free O-modules (ArithmeticLocallySymmetricSpaces §ALS.1.6), and `H_n(Y_U, O/ϖ^s) = H_n(C_U/ϖ^s)` is a finite O-module; for Borel–Moore homology use the relative complex of the Borel–Serre pair. For fixed `n` the systems `s ↦ Z_n(C_U/ϖ^s)` and `s ↦ B_n(C_U/ϖ^s)` consist of finite modules, so they are Mittag-Leffler and their `lim¹` vanishes (DerivedModuleAlgebra §1.T.1, ML vanishing). So `lim_s` is exact on `0 → B_n → Z_n → H_n → 0` and on `0 → Z_n → C_n → B_{n−1} → 0`, and `lim_s H_n(C_U/ϖ^s) = H_n(lim_s C_U/ϖ^s) = H_n(C_U)` since `C_U` is `ϖ`-adically complete. Coefficient reduction commutes with covering pushforward, so `(U, s) ↦ H_n(Y_U, O/ϖ^s)` is a functor on a product of two directed sets and its limit may be taken in either order: `lim_s lim_U H_n(Y_U, O/ϖ^s) ≅ lim_U lim_s H_n(Y_U, O/ϖ^s) = lim_U H_n(Y_U, O) = H̃_n`. Both sides are compact Hausdorff, being limits of finite discrete modules, and the comparison is a continuous bijection, hence a homeomorphism. Deck transformations, supports and the transported Hecke correspondences commute with coefficient reduction, so the map is `O[[K_0]]`-linear for the action of 3.4. Rationalisation: `K ⊗_{ℤ_p}` (−) is applied to the integral limit. In the tower of connected degree-p covers of a circle, pushforward on `H_1(−, O) = O` is multiplication by `p`, so `H̃_1 = 0`, whereas `lim(E ← E ← …)` along multiplication by `p` is `E` because `p` is invertible in `E`.

Applications include Fu, §7, before (38), arXiv v2 p. 23: The finitely generated torsion Iwasawa module and the descent spectral sequence (38) are stated for this rational double-limit model; 5.7 and 6.3 prove them for `H̃_n`, and this comparison transports them; 3.5: The fixed-exponent modules `H̃_{n,s}` are the ones that duality pairs with the fixed-exponent cohomology; this comparison says how they assemble to `H̃_n`.

**Checks.**

- Circle tower of connected degree-p covers: `H̃_{1,s} = lim(O/ϖ^s ← O/ϖ^s ← …)` along multiplication by `p` is 0 for every `s`, `H̃_1 = 0`, and the comparison is the zero isomorphism.
- Zero-dimensional regular tower `Y_U = K_0/U`: `H̃_{0,s} = (O/ϖ^s)[[K_0]]` and its limit over `s` is `O[[K_0]] = H̃_0`, the degree-zero regular-torsor Check of 3.3.
- Non-example for commuting limits with rationalisation: in the circle tower `E ⊗_O H̃_1 = 0` while `lim_U H_1(Y_U, E) = E`.
- At `s = 1` the composite `H̃_n ≅ lim_s H̃_{n,s} → H̃_{n,k}` is the reduction map of the Bockstein sequence of 3.5, with cokernel `H̃_{n−1}[ϖ]`; in the circle tower `H̃_{0,k} = k` and `H̃_0 = O`, consistent with `H̃_{−1} = 0`.

*Needs:* §3.3, §3.4, `ArithmeticLocallySymmetricSpaces §ALS.1.6`, `DerivedModuleAlgebra §1.T.1, ML vanishing`.

### 3.7 Integral completed duality

Suppose `Λ=O[[K_0]]` is left and right noetherian and a bounded complex `P` of compact finite projective `Λ`-modules is supplied, with homology `H̃_n`. Assume its continuous O-dual `S` computes `H̃^n` with the strict integral control of 2.4, and that the qualified strict-duality hypotheses of 3.2 hold. Then there are natural exact sequences `0→Hom_cont,O(H̃_{n−1}[ϖ^∞],E/O)→H̃^n→Hom_cont,O(H̃_n,O)→0` and `0→Hom_O(H̃^{n+1}[ϖ^∞],E/O)→H̃_n→Hom_O(H̃^n,O)→0`, with the compact-support/BM analogues and dual coefficient lattice when needed. The first `E/O`-dual takes the torsion submodule as specified by correction E1 to CE Theorem 1.1(3). Each cohomology lattice uses `ϖ`-adic topology; compact homology uses its canonical topology. Sections 4.2–4.3 and 5.1 supply the arithmetic model and ring hypotheses of this conditional universal-coefficient statement.

(CE, Theorem 1.1(3), pp.3–4, corrected as E1: The paired sequences are the survey target; its first displayed torsion term must be restored.; E06, §2.1 lifted finite-cell proof, pp.22–24: The integral model, with strictness and bounded torsion, provides a route rather than a mere citation to the survey.)

To prove this, apply derived continuous O-duality to the supplied `P` and use the two-term O-injective resolution `O→E→E/O`. Prove exactness and topology of dualizing the compact cycle/boundary sequences; noetherianity supplies closed images and bounded torsion. This strict derived-duality identification is the explicit G3 proof obligation. Apply qualified biduality to recover the second sequence; preserve all support maps and inverses of Hecke operators.

**Checks.**

- The degree-p circle tower has `H̃¹=0` although `Hom_cont(O,E/O)≠0`; the uncorrected first sequence fails.
- An `O/ϖ` torsion homology class contributes to the adjacent cohomology torsion term.

*Needs:* §3.3, §3.1, §3.2, §2.4, F.1 for strict continuous duality; the supplied compact model and noetherian ring hypotheses specified above.

### 3.8 Completed modules at varying tame level

Let `Σ₀` be a finite set of finite places of `F` not above `p`, `G_{Σ₀} = ∏_{v∈Σ₀} G(F_v)`, and fix the level `K^Σ` at the finite places outside `Σ = Σ₀ ∪ {places above p}`. For a compact open `K_{Σ₀} ⊂ G_{Σ₀}` with `K_{Σ₀}K^Σ` neat, write `H̃^n_c(K_{Σ₀})` for the completed compact-support cohomology (Layer 2, support `c`) and `H̃_n^{BM}(K_{Σ₀})` for the completed Borel–Moore homology (Layer 3) of the p-tower at tame level `K_{Σ₀}K^Σ`. For `K'_{Σ₀} ⊂ K_{Σ₀}`, finite-cover pullback gives res: `H̃^n_c(K_{Σ₀}) → H̃^n_c(K'_{Σ₀})` and the finite-cover transfer gives tr: `H̃_n^{BM}(K_{Σ₀}) → H̃_n^{BM}(K'_{Σ₀})`; both commute with the p-level and coefficient transitions. Define `H̃^n_{c,Σ} = colim_{K_{Σ₀}} H̃^n_c(K_{Σ₀})` along res and `H̃_{n,Σ}^{BM} = colim_{K_{Σ₀}} H̃_n^{BM}(K_{Σ₀})` along tr. Conjugation of tame levels gives each a smooth O-linear action of `G_{Σ₀}`, commuting with the action of the p-adic group at each tame level and with the tame Hecke operators at places outside `Σ`. The colimit is taken after completion in `s`; it is a different construction from the fixed-exponent tame colimit of 1.5, and the two are not identified here.

Assume throughout this subsection that `Σ₀` is finite and contains no place above `p`; `K^Σ` is fixed; every tame level `K_{Σ₀}K^Σ` used is neat. For the invariants and Haar-normalized formulas, require that every normal refinement `K'_{Σ₀} ⊂ K_{Σ₀}` under consideration is a faithful regular cover with deck group `K_{Σ₀}/K'_{Σ₀}`, hence has degree `[K_{Σ₀} : K'_{Σ₀}]`. Pass to normal refinements for general inclusions. If an ineffective central kernel remains, use only the unnormalized colimit construction until the effective-kernel comparison has identified the correct degree and Haar measure; neatness alone does not establish that comparison. For Shimura quotients with infinite central units the effective deck group is verified under target G12. The invariants statement requires `K_{Σ₀}` of pro-order invertible in `O` (SmoothRepresentationsOfLocalGroups §SR.0.3, unit-pro-order).

(Nakamura, §2.3.1, arXiv p. 22 (Inventiones 234, p. 192): The completed Borel–Moore homology at tame level `Σ₀` is defined as the direct limit over compact opens of `G_{Σ₀}` of the fixed-level modules along restriction maps, and carries a smooth action of `G_{Σ₀}`.; Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): For a compact open of pro-order prime to `p`, the projector onto invariants is defined with the normalised Haar measure; the invariants of the tame-level compactly supported completed cohomology are the fixed-level module, and the projector restricted to a smaller level is the corestriction divided by the index.)

To prove this, at each p-level and exponent, pullback and finite-cover transfer between tame levels are the ALS pullback and the finite-cover transfer of the AlgebraicTopology supplier; they commute with p-level pushforward and pullback and with coefficient reduction, so they pass to the completed modules of 2.1 and 3.3. Form the two filtered colimits in O-modules. Conjugation by `g ∈ G_{Σ₀}` carries level `K_{Σ₀}` to `gK_{Σ₀}g⁻¹` and commutes with res and tr, so `G_{Σ₀}` acts; a class coming from level `K_{Σ₀}` is fixed by `K_{Σ₀}`, so the action is smooth (SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.2). For a faithful normal cover K' `⊂ K` of index invertible in `O`: cor∘res is multiplication by the degree and res∘cor is the group sum over the deck group (1.4, applied at every exponent and passed to the limit). Hence res is injective with image the invariants, and the averaging projector `e_K` of SR.0 satisfies `e_K∘ι_{K'} = ι_K∘[K : K']⁻¹` cor; the finite form of this identity is Tau Ceti's `Representation.averageMap_eq_invOf_card_smul_norm`. The Borel–Moore side is the same with tr and pushforward exchanged. Invariants commute with filtered colimits of smooth modules when `e_K` exists, which gives `(H̃^n_{c,Σ})^{K} = H̃^n_c(K)` and the Borel–Moore analogue.

Downstream applications include Nakamura, §2.3.1, arXiv p. 22 (Inventiones 234, p. 192): The completed Borel–Moore homology of modular curves at tame level `Σ₀` is the colimit of the fixed-tame-level modules along restriction, with its smooth action of `G_{Σ₀}`; restriction there is the Poincaré dual of the transfer used here; Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): The compactly supported completed cohomology at tame level `Σ₀` has `K_{Σ₀}`-invariants equal to the fixed-level module, and the projector restricted to a smaller level is the normalised trace; 3.9: Both colimits, the invariants identification and the projector formula are the inputs of the tame-level duality; CompletedCohomologyAndLocalGlobalCompatibility:R31.4 (Nakamura, Corollary 2.5): The residual-localised Borel–Moore module at tame level `Σ₀` is built from this colimit.

The API consists of the following maps and identities.

- **Structure maps**: Structure maps `H̃^n_c(K_{Σ₀}) → H̃^n_{c,Σ}` and `H̃_n^{BM}(K_{Σ₀}) → H̃_{n,Σ}^{BM}`, compatible with res and tr respectively.
- **Finite-level representatives**: Every element of either colimit is `ι_K x` for some open `K_{Σ₀}` inside a fixed compact open `K⁰_{Σ₀}`, and `ι_K x = ι_K y` exactly when `x` and `y` agree after res (respectively tr) to some open K′ `⊂ K`; the open subgroups of `K⁰_{Σ₀}` are cofinal, so restricting to them gives the same colimit.
- **Universal property**: A family of O-linear maps `f_K `: `H̃^n_c(K_{Σ₀}) → W` with `f_{K′} ∘` res `= f_K` for K′ `⊂ K` induces a unique O-linear map `H̃^n_{c,Σ} → W` with desc `∘ ι_K = f_K`, and likewise along tr on the Borel–Moore side; it is `G_{Σ₀}`-equivariant when `W` is a `G_{Σ₀}`-module and `g ∘ f_K = f_{gKg⁻¹} ∘ g` for the conjugation maps.
- **Smoothness**: Every element of either colimit is fixed by a compact open subgroup of `G_{Σ₀}`; an element in the image of level `K_{Σ₀}` is fixed by `K_{Σ₀}`.
- **Invariants**: For `K_{Σ₀}` of pro-order invertible in `O`, `ι` identifies `H̃^n_c(K_{Σ₀})` with `(H̃^n_{c,Σ})^{K_{Σ₀}}` and `H̃_n^{BM}(K_{Σ₀})` with `(H̃_{n,Σ}^{BM})^{K_{Σ₀}}`; in particular `ι` is injective.
- **Averaging identity**: For the faithful finite covers above with K' `⊂ K` of index invertible in `O`, `e_K ∘ ι_{K'} = ι_K ∘ [K : K']⁻¹` cor on `H̃^n_c(K')`, with `e_K` the averaging projector of SR.0.
- **Equivariance**: The `G_{Σ₀}`-action commutes with the action of the p-adic group at each tame level and with tame Hecke operators at places outside `Σ`.
- **Empty tame set**: For `Σ₀ =` ∅ the structure maps are isomorphisms from the fixed-level modules.

**Checks.**

- **Empty tame set**: With `Σ₀` empty, `H̃^n_{c,Σ} = H̃^n_c(K^p)` and `H̃_{n,Σ}^{BM} = H̃_n^{BM}(K^p)`.
- **Zero-dimensional levels**: For levels `Y(K) = K⁰/K` of a profinite `K⁰` of pro-order invertible in `O` with trivial p-tower, `H̃^0_{c,Σ} = C^∞(K⁰, O)` with translation action, and its K-invariants are the functions on `K⁰/K`; `H̃_{0,Σ}^{BM} = colim_K O[K⁰/K]` along the maps sending a coset to the sum of the smaller cosets it contains.
- **p-power index**: For the connected degree-p cover of a circle, pullback on `H^1(−, 𝔽_p) = 𝔽_p` is zero; with a p-power index the transition is not injective and level invariants are not recovered.
- **Transfer versus pushforward**: For the connected double cover of a circle with `p` odd, transfer `H_1(S^1, O) → H_1(S^1, O)` is an isomorphism and pushforward after transfer is multiplication by 2; the Borel–Moore colimit uses transfer, not pushforward.
- An element in the image of level `K_{Σ₀}` is fixed by every `g ∈ K_{Σ₀}`: conjugation by `g` maps level `K_{Σ₀}` to itself and acts there as the identity.
- For a finite group acting with invertible order, the averaging identity above is Tau Ceti's `Representation.averageMap_eq_invOf_card_smul_norm` (averageMap `=` ⅟|G| • norm).
- Pushforward after transfer is multiplication by the degree on the Borel–Moore side, and cor after res is multiplication by the degree on the cohomology side, at every exponent and after completion.
- An ineffective action of `C₂` on a point has geometric degree one despite subgroup index two; normalizing its coarse-space trace by `1/2` does not recover the identity projector. This case is excluded by the faithful-cover hypothesis, even for `p` odd.

*Needs:* §2.1, §3.3, §1.5, §1.4, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.2`, `SmoothRepresentationsOfLocalGroups §SR.0.3, unit-pro-order`, `SmoothRepresentationsOfLocalGroups §SR.0.3, averaging-projector`, `Representation.averageMap_eq_invOf_card_smul_norm`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 3.9 Tame-level Borel–Moore duality

In the setting of 3.8, fix a compact open `K⁰_{Σ₀} ⊂ G_{Σ₀}` of pro-order invertible in `O`, the O-valued Haar measure `μ` on `G_{Σ₀}` with `μ(K⁰_{Σ₀}) = 1`, and a degree `n`. Suppose that `H̃^{n+1}_c(K_{Σ₀})[ϖ^∞] = 0` for every open `K_{Σ₀} ⊂ K⁰_{Σ₀}`, so that by the compact-support and Borel–Moore case of 3.7 the evaluation map `h_{K_{Σ₀}}`: `H̃_n^{BM}(K_{Σ₀}) → Hom_O(H̃^n_c(K_{Σ₀}), O)` is a homeomorphism of compact O-modules. Put `V = H̃^n_{c,Σ}`. Then the maps `μ(K_{Σ₀})·h_{K_{Σ₀}}`, followed by the identification `Hom_O(V^{K_{Σ₀}}, O) ≅ (Ṽ)^{K_{Σ₀}}`, `λ ↦ λ∘e_{K_{Σ₀}}`, of SR.0, are compatible with the transfer transitions, and induce an O-linear isomorphism `H̃_{n,Σ}^{BM} ≅` Ṽ onto the smooth contragredient of `V`. It restricts at each `K_{Σ₀}` to a homeomorphism `H̃_n^{BM}(K_{Σ₀}) ≅ (Ṽ)^{K_{Σ₀}}`, and it is equivariant for `G_{Σ₀}`, for the p-adic group with the contragredient convention of 3.1, and for each tame Hecke correspondence at places outside `Σ`, which acts on Borel–Moore homology by the transposed correspondence. Without the torsion hypothesis `h_{K_{Σ₀}}` has kernel `Hom_O(H̃^{n+1}_c(K_{Σ₀})[ϖ^∞], E/O)` and no isomorphism is asserted.

Assume the hypotheses of 3.8, with `K⁰_{Σ₀}K^Σ` neat; for `GL₂` one may take `K⁰_{Σ₀} = ∏_{l∈Σ₀}(1 + l M₂(ℤ_l))`, which is pro-l at each l `∈ Σ₀`. `G_{Σ₀}` is unimodular (a product of groups of points of reductive groups), so `μ(gKg⁻¹) = μ(K)`. `H̃^{n+1}_c(K_{Σ₀})[ϖ^∞] = 0` for all open `K_{Σ₀} ⊂ K⁰_{Σ₀}`. For modular curves and `n = 1` this holds because the completed `H^2_c` vanishes, the result of Emerton that Nakamura cites in the proof of his Lemma 2.4.

(Nakamura, §2.3.2, Lemma 2.4 and its proof, arXiv p. 22 (Inventiones 234, p. 193): At a fixed tame level the evaluation map from completed Borel–Moore homology to the O-dual of compactly supported completed cohomology is a topological isomorphism, because the Calegari–Emerton sequence has a torsion term that vanishes since the completed `H^2_c` is zero.; Nakamura, §2.3.2, arXiv p. 23 (Inventiones 234, p. 193): Hecke operators on the Borel–Moore side are normalised as `T'_l = T_l S_l⁻¹` and `S'_l = S_l⁻¹` so that the duality map is Hecke-linear.; Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): With a compact open of pro-order prime to `p` and the normalised Haar measure, the normalised fixed-level duality maps composed with the projector identification assemble into a Hecke- and group-equivariant topological isomorphism from the tame-level Borel–Moore homology to the smooth contragredient of the tame-level compactly supported completed cohomology.; CE, Theorem 1.1(3), second sequence, p. 3, and its Borel–Moore and compact-support variants, p. 4: Completed homology maps onto the O-dual of completed cohomology with kernel the `E/O`-dual of the torsion of the next completed cohomology group, with Borel–Moore and compact-support variants.)

To prove this, fixed tame level: the compact-support and Borel–Moore case of the integral duality 3.7 gives `0 → Hom_O(H̃^{n+1}_c[ϖ^∞], E/O) → H̃_n^{BM} → Hom_O(H̃^n_c, O) → 0`. Under the hypothesis `h_K` is a continuous bijection of compact Hausdorff modules, hence a homeomorphism (Nakamura, Lemma 2.4, for the modular curve). Transitions: for K' `⊂ K ⊂ K⁰`, transfer on Borel–Moore homology is adjoint under evaluation to the trace (corestriction) on compact-support cohomology: both are the finite-cover transfer of the AlgebraicTopology Stage 5 supplier on relative chains of the Borel–Serre pair, with the relative adjointness proved in F.3, and ArithmeticLocallySymmetricSpaces §ALS.3.6 identifies that trace with the level trace. With `e_K∘ι_{K'} = ι_K∘[K : K']⁻¹` cor (the averaging identity of 3.8) and `μ(K') = [K : K']⁻¹ μ(K)`, the square formed by `μ(K)h_K`, `λ ↦ λ∘e_K`, transfer and `μ(K')h_{K'}` commutes. This is Nakamura's second diagram in §2.3.2, whose lower row lands in `Hom_O(Ĥ¹_c(K'_{Σ₀}), O)` (correcting a misprint in the printed diagram). SR.0 smooth-dual (3) identifies `Hom_O(V^K, O)` with `(Ṽ)^K` for `K` of pro-order invertible in `O`, and the invariants identity of 3.8 gives `V^K = H̃^n_c(K)`; these identifications are compatible with the inclusions `(Ṽ)^K ⊂ (Ṽ)^{K'}`. Pass to the colimit over the cofinal family of open `K ⊂ K⁰`: every vector of Ṽ is fixed by some such `K`, so the union of the `(Ṽ)^K` is Ṽ, and the colimit of `H̃_n^{BM}(K)` along transfer is `H̃_{n,Σ}^{BM}`. Equivariance: conjugation by `g` carries `μ(K)h_K` to `μ(gKg⁻¹)h_{gKg⁻¹}` because `μ` is conjugation invariant; the p-adic group acts through the contragredient convention; a Hecke correspondence acts on homology by its transpose, for which evaluation is invariant (1.3). In Nakamura's cohomological model of `H̃_1^{BM}` through Poincaré duality this transposed action is `T'_l = T_l S_l⁻¹`, `S'_l = S_l⁻¹`.

Downstream applications include Nakamura, §2.3.3 and Corollary 2.5, arXiv p. 25 (Inventiones 234, pp. 195–196): The residual-localised completed Borel–Moore homology at tame level `Σ₀` is identified with the smooth contragredient of completed cohomology, the starting point of the zeta morphisms; that corollary is routed to CompletedCohomologyAndLocalGlobalCompatibility:R31.4.

**Checks.**

- Zero-dimensional example of 3.8: the isomorphism sends the coset gK to the functional `f ↦ ∫_{gK} f dμ` on `C^∞(K⁰, O)`. Without the factor `μ(K)` the maps fail to commute with transfer by the factor `[K : K']`.
- Modular curves, `n = 1`: the isomorphism is Nakamura's identification of `H̃_{1,Σ}^{BM}` with the smooth contragredient of `Ĥ¹_{c,Σ}`; its Galois equivariance uses the Galois action transported by 8.7. Nakamura writes `Ĥ¹_c`, the `ϖ`-adic completion of the integral level colimit; here it is the `H̃¹_c` of this comparison, because every finite-level `H²_c(Y_K, O)` is torsion-free, so the Tate-module term of 2.8 vanishes.
- If `H̃^{n+1}_c(K)[ϖ^∞] ≠ 0`, the kernel `Hom_O(H̃^{n+1}_c(K)[ϖ^∞], E/O)` of `h_K` is nonzero.
- With `K⁰ = GL₂(ℤ_l)` and `p` dividing `|GL₂(F_l)|` the normalisation `μ(K)` is not defined in `O`; first pass to a pro-l open subgroup.

*Needs:* §3.8, §3.7, §3.1, §1.3, `SmoothRepresentationsOfLocalGroups §SR.0.4, smooth-dual`, `SmoothRepresentationsOfLocalGroups §SR.0.3, averaging-projector`, `SmoothRepresentationsOfLocalGroups §SR.1.1, A-valued Haar measure`, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 3.10 Dual completion–Tate sequence

Under the strict complete-lattice hypotheses of the integral completed UCT, dualizing `0→Ĥ^n→H̃^n→T_ϖ B^{n+1}→0` gives `0→D_O(T_ϖ B^{n+1})→H̃_n/H̃_n[ϖ^∞]→D_O(Ĥ^n)→0`. Surjectivity of the last map uses the complete torsion-free quotient and the qualified Schikhof duality; it is not exactness of `Hom(−,O)` on arbitrary O-modules.

(CE, Consequence of (1.1), p.5: The middle dual is the torsion-free quotient of completed homology, with a Tate-dual submodule.)

To prove this, use the second integral UCT to identify `D_O(H̃^n)` with the stated quotient. Check completeness/strictness of the source sequence and the torsion-free quotient `T_ϖ`. Apply the exact Schikhof duality of F.1 on this category; the complete-lattice splitting argument is part of G3.

**Checks.**

- For bounded `B^{n+1}`-torsion the first term is zero.
- The sequence is not asserted after arbitrary nonflat base change.

*Needs:* §2.7, §2.8, §3.7, §3.2.

### 3.11 Admissible integral complexes

For a profinite `K_0`, an integral admissible complex of amplitude `[a,b]` means a complex represented in degrees `[a,b]` by finite direct summands of `C(K_0,O)^{n_i}`, with uniform `ϖ`-adic topology and the continuous regular action. Duals are compact `Λ`-modules with transpose right action; convert by inversion when a left category is desired. If `K_0` is pro-p and `Λ` is local, finite projectives are free and these terms may be taken as `C(K_0,O)^{n_i}`. This termwise notion is stronger than admissibility of cohomology.

Import the all-profinite locality criterion from NoncommutativeAndEquivariantIwasawa §0.4, with no analyticity assumption: `O[[K_0]]` is local exactly when `K_0` is pro-p, and the same holds for `k[[K_0]]`. In the pro-p case the integral maximal ideal is generated topologically by `ϖ` and `g−1`. Identify this augmentation with the transpose regular action used by the admissible-complex dual, so the supplied finite-projective freeness gives exactly the free continuous-function representatives above. (ST, Lemmas 3.2–3.3, p.14; GN, §2.1.5, Definition 2.1.6 and Proposition 2.1.9, pp.9–10.)

(BP, Definition 1.4.1 and Remark 1.4.2, pp.4–5: The torus pro-p source uses continuous-function terms and dual perfect complexes; finite summands are required for general profinite groups.)

To prove this, use the existing regular continuous-function module and its measure dual from F.1. Define the termwise subcategory by finite direct summands with continuous idempotents. Use DerivedModuleAlgebra §1.E.0's general-ring perfectness and ALS.F.2's opposite-ring duals; specialize to free terms only with the supplied local-ring criterion.

Applications include BP §5.4: The degreewise duality must include the prime-to-p component of the full torus; Layer 4 completed chains: Finite projective `Λ` complexes are the dual side.

The API consists of the following maps and identities.

- **Terms**: Each degree has its finite regular-function summand and chosen continuous idempotent.
- **Dual**: Its degree −i dual is the corresponding finite projective right `Λ`-module.
- **Change of representative**: The derived property is existence of such a representative, invariant under isomorphism in the designated derived category.
- **Pro-p case**: For pro-p `K_0` the representative can have free regular-function terms.
- The imported locality criterion identifies the pro-p case in which finite-projective dual terms give free regular-function terms.

**Checks.**

- **Trivial group**: For `K_0=1`, admissible complexes are bounded finite projective O-complexes.
- **Regular pro-p tower**: For `K_0=ℤ_p` a single `C(K_0,O)` in degree a dualizes to `Λ` in degree −a.
- **Non-free summand**: For `K_0=C₂` and `p` odd, the trivial-character idempotent summand is projective but not free over `O[C₂]`; a free-only definition excludes it.
- Amplitude reverses on dualization.
- Finite projective over a general `Λ` need not mean finite free.

*Needs:* §3.1, NoncommutativeAndEquivariantIwasawa §0.4 for the all-profinite locality criterion, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.12 Admissible–perfect duality

Degreewise continuous O-duality induces an anti-equivalence between the integral admissible complexes just defined and perfect complexes of compact right `Λ`-modules, changing amplitude `[a,b]` to [−b,−a]. Inversion transports the latter to left modules. Its `Λ`-linear dual is `RHom_Λ(P,Λ)`, naturally right-handed for `P` left-handed. For the torus instance, with `t` acting on `Λ` by left multiplication `[t]`, the diagonal-action lattice–compact tensor model of F.2, `RΓ(K_0,M⊗̂_OΛ)`, realizes this dual after the prescribed inversion/opposite conversion. BP’s Serre adjoint uses the additional automorphism `t↦w₀t⁻¹`; it is recorded as a twist, not absorbed into the untwisted action.

(BP, Remark 1.4.2, p.5; Lemmas 5.4.1–5.4.2, pp.56–57; Theorem 5.5.2, p.57: Continuous function/measure duality gives perfect complexes; completed tensor and the action twist are essential.)

To prove this, identify `D_O C(K_0,O)` with `Λ` using the supplied continuous measure pairing and its finite quotient characterizations. Dualize finite idempotent summands and bounded differentials, using the reversed-complex sign convention. For the completed tensor model check the regular-function generator, contract the continuous coinduced complex, then pass finite summands. Fix handedness at that generator before deriving the general noncommutative formula; this action-level verification is G4. Construct its continuous cochains in the F.2 inverse-limit coefficient category before taking invariants. For T′ and `T`, use pro-p freeness and the finite prime-to-p projector separately.

**Checks.**

- Algebraic tensor is not substituted for completed tensor.
- For noncommuting g,h check `Hom_Λ(P,Λ)` right multiplication before inversion.
- The Serre twist contains `w₀` as well as inversion.

*Needs:* §3.11, §3.2, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.13 Orthonormalizable coefficient modules

For a complete noetherian local O-algebra A with finite residue field and maximal ideal `m`, `V` is orthonormalizable if it is m-adically complete separated and `V/m^rV` is free over `A/m^r` for every `r≥1`. A compact A-module is pro-free if it is a product `A^I` with the product m-adic topology. Put `V*=Hom_A(V,A)` with pointwise topology. Cofinitely generated `X` means `ϖ`-complete separated, O-torsion-free, continuous for m-adic A and `ϖ`-adic `X`, with (`X/ϖ` X)[m] finite dimensional over `k`. These three notions are named separately.

(Nakamura, Definitions B.1–B.4, pp.90–91: The coefficient-module notions and their distinct topologies are used by the tensor-duality lemma.; E11, Appendices B,C, Definitions B.1,B.10,C.1, pp.99,102–103: The definitions and their duality contracts are stated for general complete local coefficient rings.)

To prove this, use the existing adic completion and product carriers. Define the three predicates with all their topology and finite-socle conditions, retaining O-torsion-freeness for `X`. Provide the native finite-free specialization; their category equivalences are the next theorem.

Applications include Nakamura Lemma B.6: Orthonormalizable `V` and cofinitely generated `X` fix the completed tensor category; Layer 3 coefficient change: Finite local A-base change has a qualified topological duality contract.

The API consists of the following maps and identities.

- **Lifted basis**: `V` is the m-adic completion of the free span of any lifted basis of V/mV.
- **Product is pro-free**: `A^I` with product topology is pro-free.
- **Dual topology**: The A-dual is given its pointwise compact topology.
- **Cofinite socle**: For `X` satisfying completeness/torsion/continuity, finite `mod-ϖ` m-socle is equivalent to finite generation of its compact O-dual.

**Checks.**

- **Rank one**: `V=A` and `M=A` are orthonormalizable and pro-free respectively.
- **Restricted versus product**: For `A=O` and `I=N`, the orthonormalizable completion is `c₀(N,O)`, whose pointwise compact dual is `O^N`; it is not the same topology as the product.
- **Torsion excluded**: `X=A/ϖ` A with A O-torsion-free cannot satisfy the cofinite `X` predicate, even if its `mod-ϖ` socle is finite.
- For `A=O` and infinite `I`, choose distinct coordinates `e_n`: the convergent sum `Σ_n ϖ^n e_n` belongs to the completion but not to `O^(I)`. For Artinian `A`, the maximal ideal is nilpotent, the m-adic topology is discrete, and every direct sum is complete.
- Product topology and m-adic uniform topology are distinguished.

*Needs:* §3.1, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.14 Coefficient-module duality

For A as in the preceding definition, `V↦V*` anti-equivalently identifies orthonormalizable modules with pro-free compact modules, inverse `Hom_cont,A(−,A)`. For O-torsion-free A, `X↦Hom_O(X,O)` anti-equivalently identifies cofinitely generated modules with O-torsion-free finite A-modules with their m-adic topology. Orthonormalizable `V` is A-flat; tensor with a finite local A-algebra is orthonormalizable, without a claim for arbitrary base change.

(E11, Lemma B.2, Remark B.5, Lemma B.6 and Proposition B.11, pp.99–102; Proposition C.5, pp.103–104: Lifted bases, Artin–Rees and compact Nakayama prove the actual duality.; Nakamura, Appendix B.1, pp.90–91: These equivalences are precisely the topological inputs to B.6.)

To prove this, lift a residue basis and identify `V` with restricted families tending to zero m-adically. Use Artin–Rees on finite presentations for flatness and finite coefficient base change; use the finite noetherian hypothesis, not infinite rank projectivity. Compute `V*` as the unrestricted product `A^I`, and its continuous dual by convergent evaluation. Use the compact Nakayama criterion on the O-dual of `X` to translate the finite-socle condition into finite A-generation.

**Checks.**

- `c₀(N,A)` dualizes to `A^N` with product topology.
- Completing an arbitrary tensor product does not preserve finite generation without the hypotheses.

*Needs:* §3.13, §3.2, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.15 Mixed completed coefficient tensor

For O-torsion-free complete noetherian local A, orthonormalizable `V` and cofinitely generated `X`, define `V⊗̂_A X=lim_n V⊗_A(X/ϖ^nX)`, with `ϖ`-adic topology. Separately, for compact M,N define their compact tensor by `lim_{U,W}(M/U)⊗_A(N/W)` with finite quotient topology. These limits share a symbol in Nakamura but are different constructions. Use the supplied generic completed tensor carriers and name the mixed realization comparison here.

(Nakamura, Definition B.2 and Lemma B.5, pp.90–91: The compact quotient tensor and mixed `ϖ` completion are distinguished.)

To prove this, use the compact completed tensor and quotient universal property of F.2. Apply the existing inverse limit to the mixed finite coefficient diagram. Use A-flatness of `V` to prove exact reduction transitions and `ϖ`-torsion-freeness as in B.5.

Applications include Nakamura B.5–B.6: The duality map is defined on exactly this completion. BP §5.4 instead uses the lattice–compact tensor constructed in F.2; its compact second factor need not be cofinitely generated over O.

The API consists of the following maps and identities.

- **Projection**: Projection to `V⊗_A(X/ϖ^nX)` is O-linear and continuous.
- **Reduction**: Its `mod-ϖ^n` quotient is `V⊗_A(X/ϖ^nX)` under the stated flatness control.
- **Functoriality**: Continuous compatible A-linear maps induce the completed tensor map.
- **Torsion-freeness**: The completed mixed tensor is O-torsion-free.

**Checks.**

- **Unit coefficient**: `A⊗̂_A X≅X` with its `ϖ` topology.
- **Finite free coefficients**: For `V=A^d` the tensor is `X^d`.
- **Infinite index set**: For `A=O`, `V=c₀(N,O)` and `X=O`, the mixed tensor recovers `c₀(N,O)`, whereas the compact tensor of `O^N` with `O` has compact product topology.
- The topology on `V⊗̂_AX` is the mixed `ϖ`-adic topology.
- The compact tensor has the specified finite-quotient topology.

*Needs:* §3.13, §3.14, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.16 Mixed tensor duality

Under the mixed tensor hypotheses, with `D=Hom_O(X,O)` finite over A, evaluation induces a topological A-linear isomorphism `V* ⊗_A D ≅ Hom_O(V ⊗̂_A X,O)`, sending `f⊗d` to `(v⊗x↦d(f(v)x))`. On the left algebraic tensor agrees with compact completed tensor because `D` is finitely presented over noetherian A; this agreement is not asserted for an arbitrary compact second factor.

(Nakamura, Lemma B.6 and proof, pp.91–92: Finite m-power torsion and finite coefficient quotients give the evaluation comparison.; E11, Lemma B.7 and Proposition C.5, pp.101,104: Finite presentation controls Hom/tensor and compact finite generation.)

To prove this, write `X/ϖ^nX` as the union of its `m^r`-torsion, using continuity. Use free `V/m^rV` and finite-length `(X/ϖ^nX)[m^r]` for the finite-level Hom/tensor pairing. Pass the `(r,n)` inverse limits, using the finite presentation of `D` to compare compact and algebraic tensor. Check that the resulting map is exactly the evaluation formula, not merely a cardinality comparison.

**Checks.**

- For `V=A` the map is identity on `D`.
- For `V=A²` it is the two-coordinate evaluation pairing.
- A localization of A that is not a finite local algebra lies outside this theorem.

*Needs:* §3.15, §3.14, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 3.17 Definite degree-zero dual interface

For the finite definite unitary double-coset tower of LLHLM §5.3, its fixed-exponent functions and completed lattice are the Layer 1 and Layer 2 carriers. Their Pontryagin and Schikhof duals use the Layer 3 conventions. Formula (5.8) pairs the localized mod-residual representation with the Pontryagin dual of the patched quotient; it is not an O-linear Schikhof dual of a torsion module. Actual unitary geometry and patched-module existence remain in the Layer 8 adapter and the patching supplier.

(LLHLM, §5.3, pp.121–123, formula (5.8): The degree-zero completed lattice and its mod-residual Pontryagin pairing are explicit applications of the generic tower.)

To prove this, identify finite level functions with `H⁰` of the actual finite quotient from ALS. Match pullback and coefficient reduction with the source’s `S` and completed `S` definitions. Use torsion duality at the residual quotient and O-duality only for the complete torsion-free lattice.

**Checks.**

- `D_O` of a `mod-ϖ` quotient is zero and cannot realize (5.8).
- Tame coefficient factors and the residual Hecke ideal remain in the instance.

*Needs:* §1.1, §2.1, §3.1, §3.2.

### Examples

`D_O(O/ϖ) = 0` whereas `D_t(O/ϖ) ≅ O/ϖ`. For `K_0 = ℤ_p`, `D_O C(K_0, O) = O[[K_0]]` with the stated dual topologies. In infinite rank the orthonormalisable `c₀` lattice and the pro-free product are different topological objects. In the circle tower `H̃_1 = 0` integrally while `lim_U H_1(Y_U, E) = E`, so Fu's model rationalises after both limits (3.6). In the zero-dimensional tower of levels `K⁰/K` the tame-level duality of 3.9 sends a coset gK to integration over gK against `μ`; without the factor `μ(K)` the maps fail to commute with transfer by the index `[K : K′]`.

### Dependencies

`DerivedModuleAlgebra §1.T.1, ML vanishing`, `ArithmeticLocallySymmetricSpaces §ALS.1.6`, `ArithmeticLocallySymmetricSpaces §§ALS.2.1–ALS.2.3`, `ArithmeticLocallySymmetricSpaces §ALS.3.6`, §0.2, §1.1, §1.4, §1.3, §1.5, §2.1, §2.7, §2.4, §2.8, §4.2, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, §3.11, §5.1, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `SmoothRepresentationsOfLocalGroups §SR.0.3, averaging-projector`, `SmoothRepresentationsOfLocalGroups §SR.0.4, smooth-dual`, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.2`, `SmoothRepresentationsOfLocalGroups §SR.0.3, unit-pro-order`, `SmoothRepresentationsOfLocalGroups §SR.1.1, A-valued Haar measure`, `ContinuousLinearMap`, `PontryaginDual`, `Representation.dual`, `TopModuleCat.isLimit`, `Representation.averageMap_eq_invOf_card_smul_norm`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`, `ProfiniteProPGroups Layer 9 prerequisites, completed group algebra and compact modules`.

Foundational prerequisites: G3 (continuous integral duality), G4 (the noncommutative completed-tensor action), DeformationAndDerivedPatchingAlgebra §7.5 (complete-flat coefficient models), and the coefficient-module and mixed-tensor dualities of §§3.13–3.16 here.

## Layer 4: Actual completed chain models

This layer constructs the actual chain model. A finite CW model lifted through a regular tower gives a bounded complex of finite projective modules over `Λ = O[[K_0]]` whose derived coinvariants recover every finite level. The termwise continuous dual of its model with dual coefficients is the integral cochain model with the original coefficients, which computes completed cohomology and its reductions and also completed cohomology with complete torsion-free coefficients. Stabilisers, boundaries and the patched model of Gee–Newton are treated separately.

### 4.1 Lifted cellular tower

Choose a finite CW pair `(Z_0,∂Z_0)` from the supplied neat ALS Borel–Serre model and a regular `K_0/U_r` covering tower of that pair, with finite free O-local system pulled back from `Z_0`. Write `𝒫(W_0)` for the chain construction with this local system, and run the same construction with the contragredient `W_0∨=Hom_O(W_0,O)`. Lift each cell with its boundary attaching maps compatibly through the covers. Finite-level absolute and relative cellular chains are bounded finite free `O[K_0/U_r]`-modules, with quotient/pushforward transitions, and their specified homotopy-coherent singular comparisons are compatible with supports, coefficients and the transported Hecke maps.

(E06, Theorem 2.1.5 proof and Theorem 2.1.12, pp.22–24,26–27: A finite triangulation lifts to a profinite cell torsor; compact support has a homological version.; GN, §2.1.1–2.1.4, pp.7–8: The arithmetic chain model and its correspondence action are the finite-level comparison targets.)

To prove this, import generic cellular chains and singular comparison from AlgebraicTopology. Use the actual ALS finite pair and regular tower; choose compatible cell lifts through the compact torsors. Build the lifted differential from finite attaching maps with lattice transport, retaining the boundary subcomplex. Check compatibility of the supplied comparisons up to specified homotopies, without asserting strictly commuting arbitrary choices.

Applications include Layer 4 completed chains: A compatible finite-rank lifted basis makes the inverse limit finite free; Layer 6 Fu hyper-Tor: Its finite-level coefficient complex is recovered from this model.

The API consists of the following maps and identities.

- **Bases**: Cells and lattice bases index finite bases of each quotient chain module.
- **Differential**: The differential records deck translates and coefficient transport, with square zero.
- **Quotients**: The quotient group-ring map induces actual covering pushforward.
- **Comparison**: The cellular–singular comparison is the imported natural chain homotopy comparison.

**Checks.**

- **Zero-dimensional torsor**: A zero-dimensional regular torsor gives `O[K_0/U]` in degree zero.
- **Circle differential**: For the procyclic circle tower the completed differential is `γ−1` on `Λ`, not zero.
- **Relative pair**: The boundary cell subcomplex produces relative chains; discarding boundary changes the interval example.
- A base cell has one deck torsor of lifts, not one fixed lift at every quotient without compatibility.
- Finite-cell and trivial-stabilizer assumptions are explicit.

*Needs:* §0.2, §3.3, `ArithmeticLocallySymmetricSpaces §ALS.1.6`, `ArithmeticLocallySymmetricSpaces §ALS.2.4`, `AlgebraicTopology Stage 4, CW pairs and cellular comparison`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 4.2 Completed equivariant chain complex

For each chosen lattice `L=W_0` or `W_0∨` on the lifted pair define `𝒫_•(L)=lim_{r,s} C_•(Z_r,L/ϖ^s)` with quotient/pushforward transitions, and its relative counterpart `𝒫^{BM}`. Use the existing `Λ=TauCeti.completedGroupAlgebra O K_0`. The coefficient and normal-level systems compute its two-index finite quotient presentation by Layer 3, not a new ring construction. Each term is `Λ^{c_i d}`, where `c_i` is the number of base cells and `d` the coefficient rank, with differential the compatible limit of actual attaching matrices. It is a bounded complex of compact left `Λ`-modules; the continuous O-dual of `𝒫(W_0∨)`, with inverse-precomposition action, computes the cohomological tower with `W_0`. Finite-free biduality identifies `W_0∨∨` with `W_0`; no self-duality of `W_0` is assumed. Bases are auxiliary; the resulting object and comparisons are independent up to specified quasi-isomorphism.

(E06, Theorem 2.1.5 proof, pp.22–24: The completed cochains have finite continuous-function terms; their duals are finite completed-ring modules.; GN, §2.1.1–2.1.3, pp.7–8: The tower completed chain object is tied to actual arithmetic chains.)

To prove this, identify the inverse limit of each lifted free group-ring term with a finite power of the existing TauCeti.completedGroupAlgebra using its proj, mk and ext API and Layer 3’s two-index comparison. Take the compatible differential matrices and their square-zero equations by joint projection injectivity. Use exactness of compact inverse limits, with compact closed kernels and images, to identify `H_n(𝒫(L))` with `lim_r H_n(Z_r,L)`. Dualize the actual matrix complex for `W_0∨` to continuous-function cochains for `W_0`; establish its strict integral/pro-system comparison under G2/G3.

Applications include Layer 5 finite generation: Bounded finite projective terms and noetherian `Λ` imply finite homology; Layer 7 duality: The actual support complexes, not an invented homology carrier, are paired.

The API consists of the following maps and identities.

- **Reduction**: Each `(r,s)` projection is the actual finite chain complex.
- **Terms**: The compatible lifted bases give `Λ^{c_i d}` in degree `i`.
- **Homology**: For each L, the named comparison identifies `H_n(𝒫(L))` with the independently defined `H̃_n(L)`.
- **Support versions**: Absolute, boundary and relative models form their compatible short exact chain sequence.

**Checks.**

- **Regular point tower**: With `L=O`, the regular point tower gives `Λ` concentrated in degree zero.
- **Circle tower**: With `L=O`, the circle tower gives `Λ --(γ−1)→ Λ`; its `H₀` is `O` and `H₁` is zero.
- **Amplitude**: A d-dimensional finite pair gives zero terms outside [0,d], not merely zero homology there.
- An abstract inverse limit of arbitrary perfect complexes is not asserted perfect.
- The tower has one uniform finite cell bound before taking limits.

*Needs:* §4.1, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, §3.1, §3.3, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, `ProfiniteProPGroups Layer 9 prerequisites, completed group algebra and compact modules`, §3.4.

### 4.3 Finite projective completed model

Under the lifted finite-cell regular tower hypotheses, 𝒫 and `𝒫^{BM}` are perfect compact `Λ`-complexes, finite free in the chosen lifted model. A finite prime-to-p quotient descent or idempotent summand gives finite projective terms, not necessarily free terms. The continuous O-duals of these models for `W_0∨` are the integral admissible cochain models for `W_0`, and the comparisons identify conventional `H̃^n` and `H̃_n` via Layer 2 strict pro-system control. The degree bounds are cell bounds; no assertion of projective homology or concentration follows.

(E06, Theorems 2.1.5,2.1.12 proofs, pp.22–27: The lifted finite simplicial model supplies finite regular-function terms and admissible cohomology.; GN, §2.1.5–2.1.9, pp.9–10: Minimal finite projective/free resolutions require noetherian local base and separate degree control.)

To prove this, use the actual finite-rank lifted representatives from the previous construction. Use DerivedModuleAlgebra §1.E.0's shared `DerivedDeRham.IsPerfect` for the unital ring `Λ` and ALS.F.2 for opposite-ring duals and noncommutative scalar change. On prime-to-p descent take the averaging idempotent and retain its projective summand. Apply strict admissible-complex control to the dual to identify the conventional degreewise limit.

**Checks.**

- The pro-p circle complex is perfect but `H₀=Λ/(γ−1)` is not `Λ`-projective.
- A bad stabilizer with p-torsion cannot be averaged away.
- At a point with `W_0=ℤ₅` and a coefficient automorphism 2, chains on `W_0∨` have automorphism `1/2`; their cochain dual has automorphism 2. Over `𝔽₅` the first dual and bidual have scalars three and two, respectively. Dualizing chains on `W_0` instead would give the wrong action.

*Needs:* DerivedModuleAlgebra §1.E.0 and ArithmeticLocallySymmetricSpaces §ALS.F.2; §4.2, §3.11, §2.4, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 4.4 Derived finite-level coinvariants

For `U` normal open in `K_0`, `(O/ϖ^s)[K_0/U]⊗ᴸ_Λ𝒫≅C_•(Z_U,O/ϖ^s)`, naturally for quotient levels, coefficients and tame correspondences; here both sides carry the chosen coefficient local system of 4.1. More generally `O`, as a right `O[[U]]`-module by augmentation, satisfies `O⊗ᴸ_{O[[U]]}𝒫≅C_•(Z_U,O)` with that same local system. For the separate algebraic-coefficient comparison, write 𝒫(O) for the construction with constant rank-one `O` coefficients: the diagonal twist has `O⊗ᴸ_{O[[U]]}(𝒫(O)⊗_O W_0)≅C_•(Z_U,W_0)`. A model already carrying `W_0` is not tensored with `W_0` again. Compute on the finite projective terms; underived coinvariants of `H_n` need not equal `H_n` of the finite-level complex.

(GN, §2.1.1–2.1.3, pp.7–8: Finite arithmetic chain complexes use the correct right/left coefficient tensor.; Fu, §7, equation (38), pp.23–24: Homological descent needs the derived coinvariant object with coefficient twist.)

To prove this, identify the quotient on each finite free completed chain term. Use K-flatness of the bounded finite projective representative to calculate the derived tensor by its ordinary tensor complex. Compare the resulting differential with the actual quotient attaching map, then check the singular and support comparisons.

**Checks.**

- For the circle tower, `H₁` of U-coinvariants is `O` although coinvariants of `H̃₁=0`.
- The right augmentation module and left chain action are never swapped.
- For `K_0=1` and a point, twisting the constant model `O` by `W_0=O²` gives `O²`, whereas twisting an existing rank-two coefficient model again would give `O⁴`.

*Needs:* §4.2, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 4.5 Integral cochain model and completed coefficients

For the lifted finite-cell tower of Layer 4 at fixed tame level, put `S̃^•(W_0)=Hom_cont,O(𝒫_•(W_0∨),O)`, with inverse-precomposition action (4.3). This is the integral admissible cochain model with coefficients `W_0`. In this subsection `H̃^i`, `A^i_m` and the finite-level cochains carry `W_0`; additional trivial coefficients `M` mean `W_0⊗_O M`. Then `S̃^•` is a bounded complex of `ϖ`-adically complete, `ϖ`-torsion-free O-modules, with natural isomorphisms `H^i(S̃) ≅ H̃^i` and `H^i(S̃/ϖ^m) ≅ A^i_m`, where `A^i_m = colim_U H^i(Y_U, W_0/ϖ^m)`, compatible with tower transitions, the integral local action and the transported Hecke maps; the same holds for the compact-support and boundary models. For every `ϖ`-adically complete, `ϖ`-torsion-free O-module `M`, with trivial action on the tower, the completed cohomology with coefficients `M`, `H̃^i(M) = lim_m colim_U H^i(Y_U, (W_0⊗_O M)/ϖ^m)`, is naturally isomorphic to `lim_m (A^i_m ⊗_O M)`. If the `ϖ`-power torsion of `H̃^{i+1}` is bounded, as 5.2 proves for this tower, `H̃^i(M)` is moreover the `ϖ`-adic completion of `H̃^i ⊗_O M`.

Assume the hypotheses of 4.2 and 4.3: a lifted finite-cell regular tower over a compact p-adic analytic `K_0`, at fixed tame level. `M` is `ϖ`-adically complete, separated and `ϖ`-torsion-free, and the tower acts trivially on it; any further action on `M` (for example a Galois action on `A_inf`-type coefficients) is carried along by naturality. The completed-tensor clause assumes that `ϖ^c` kills the `ϖ`-power torsion of `H̃^{i+1}` for some `c`.

(PanII, §7.2, Lemma 7.2.6(1) and its proof, arXiv:2209.06366v1, p. 120: Completed cohomology with coefficients in a p-adically complete torsion-free module is the limit over `m` of the `mod-p^m` completed cohomology tensored with the module; the proof uses a complex of complete torsion-free modules computing completed cohomology and its reductions (attributed to Emerton), the universal-coefficient sequences and multiplication by `p` on the torsion terms.)

To prove this, terms: `𝒫_i(W_0∨) = Λ^{c_i d}`, so `S̃^i(W_0) = Hom_cont,O(𝒫_i(W_0∨), O) = C(K_0, O)^{c_i d}`, `ϖ`-adically complete and torsion-free (finite projective summands in the descended model). Reductions: continuous maps into the discrete `O/ϖ^m` factor through finite levels, so `S̃/ϖ^m = colim_U Hom_O((O/ϖ^m)[K_0/U] ⊗_Λ 𝒫(W_0∨), O/ϖ^m) = colim_U C^•(Z_U, W_0/ϖ^m)` by 4.4 (underived, as 𝒫 is finite projective); exactness of filtered colimits (1.1) gives `H^i(S̃/ϖ^m) ≅ A^i_m`. Integral cohomology: 2.4 gives `H^i(S̃) ≅ lim_m H^i(S̃/ϖ^m) = H̃^i`, naturally for the transitions and actions of 4.3. Coefficients: `M/ϖ^m` is flat over `O/ϖ^m` because `M` is torsion-free, so `colim_U C^•(Z_U, (W_0⊗_O M)/ϖ^m) = (S̃/ϖ^m) ⊗_{O/ϖ^m} M/ϖ^m` and its cohomology is `A^i_m ⊗_O M`; take the limit over `m`. Completed tensor: tensoring the Bockstein sequences of 2.5 for `S̃` with the flat `M/ϖ^m` gives `0 → (H̃^i ⊗ M)/ϖ^m → A^i_m ⊗ M → H̃^{i+1}[ϖ^m] ⊗ M → 0`. With `ϖ^c` killing the torsion, `c` consecutive transitions of the third terms vanish, so their limit and `lim¹` are zero and the limit of the middle terms is the completion of `H̃^i ⊗_O M`.

Downstream applications include CohomologyComparisons CP.6/pan-completed-coefficient-and-flag-descent: Pan's identification of completed cohomology with `A_inf/(ker θ)^k` coefficients is the case `M = A_inf/(ker θ)^k` of the coefficient formula; §4.5 supplies this complex and interchange; Pan, On locally analytic vectors II, Lemma 7.2.6, arXiv v1 p. 120: The stronger form for every p-adically complete torsion-free coefficient module.

**Checks.**

- `M = O`: the coefficient formula is `lim_m A^i_m = H̃^i`, the definition in 2.1.
- With `W_0=O`, `M = O[[T]]` (complete and torsion-free, not finitely generated over `O`): `H̃^i(O[[T]]) = lim_m (A^i_m ⊗_O O[[T]])` is the submodule of `H̃^i[[T]]` of the series `Σ_j a_j T^j` such that, for every `m`, the images of the `a_j` in `A^i_m` generate a finitely generated O-module; it is not `H̃^i[[T]]` in general. In the zero-dimensional tower `Y_U = K_0/U` with `K_0 = ℤ_p`, `H̃^0(M) = C(ℤ_p, M)` for the `ϖ`-adic topology of `M`, and `Σ_j 1_{p^j ℤ_p} T^j` lies in `C(ℤ_p, O)[[T]]` `= H̃^0[[T]]` but not in `H̃^0(O[[T]])`: the indicator functions are linearly independent in `A^0_1 = C^∞(ℤ_p, k)`.
- With `W_0=O`, the circle tower of connected degree-p covers has `A^0_m = O/ϖ^m` and `A^1_m = 0` (pullback is multiplication by `p` on `H^1`), so `H̃^0(M) = M` and `H̃^1(M) = 0` for every complete torsion-free `M`.

*Needs:* §4.3, §4.4, §4.2, §2.4, §1.1, §2.5.

### 4.6 Stabilizer and boundary replacement

When cell stabilizers are nontrivial, replace a free cell orbit by its induced derived stabilizer complex, retaining the stabilizer group cohomology/homology. A bounded finite projective `Λ` model follows only after finite projective resolutions and a uniform bound on stabilizer contributions are proved, or when finite stabilizer orders are invertible in `O`. For noncompact arithmetic quotients use the compact Borel–Serre pair and relative chains for BM; use its boundary subcomplex for absolute/compact support maps. The non-neat stack model is the ALS model, not a new coarse quotient construction.

(E06, Theorem 2.1.12, pp.26–27: Compact support is handled through the homological model with its manifold hypotheses.; GN, §2.1.1, p.7: The good level condition is used to obtain manifold chain models.)

To prove this, import the ALS stabilizer resolutions and the Borel–Serre pair. Apply completed induction to actual stabilizer cell complexes, retaining unbounded p-torsion resolutions where necessary. State the precise extra finite-projective hypothesis before any perfectness inference.

**Checks.**

- For a point with stabilizer `C_p` over `k` the derived model is not a bounded coarse-point complex.
- A compact quotient has empty boundary and `absolute=relative` chains.

*Needs:* §4.2, §0.4, `ArithmeticLocallySymmetricSpaces §ALS.5a.6`, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### 4.7 Patched completed model import

For the specific Gee–Newton patched complex `C̃_∞` with `O_∞=O[[x₁,…,x_g]]`, coherent open ideals J and normal levels `U_p`, prove the compact group-ring version of Gee–Newton Proposition 3.4.16: its terms are `O_∞[[K_0]]`-flat, it is perfect over that ring, and `O_∞/J⊗_{O_∞[[U_p]]}C̃_∞≅C(U_p,J,∞)`. Construct the patching comparison using one ultrafilter, compatible minimal resolutions and uniform rank bounds. Proposition 3.4.19 supplies the separate augmentation/cohomology comparison. This result is never cited as perfectness of an arbitrary unpatched inverse-limit tower.

(GN, Proposition 3.4.16 and proof, pp.23–24; Proposition 3.4.19, p.24: Flat terms, finite compatible minimal resolutions and reduction identify this particular patched model.)

To prove this, construct the noncommutative `O_∞[[K_0]]` patched model from the F.2–F.3 coefficient category and the Layer 8 patching methods of DeformationAndDerivedPatchingAlgebra. Prove its coherent reductions and finite projective representatives. Match chain conventions and coefficient maps with Layer 4, and retain the augmentation ideal separately.

**Checks.**

- A projective patched complex is not a claim that its homology is free.
- The number of variables, coefficient quotient J and level `U_p` remain parameters of the supplied comparison.

*Needs:* §4.2, `DeformationAndDerivedPatchingAlgebra Layer 8; §4.7 here for compact group rings`, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`.

### Examples

The procyclic circle model is `Λ → Λ`, multiplication by `γ − 1`. It is perfect, `H₀ = Λ/(γ − 1)` is not `Λ`-projective, and `H₁ = 0`. Derived finite-level coinvariants recover the finite circle's `H₁ = O`, while the coinvariants of `H̃₁` are zero. Coefficients are not taken termwise in 4.5: in the zero-dimensional tower over `ℤ_p`, `Σ_j 1_{p^j ℤ_p} T^j` lies in `C(ℤ_p, O)[[T]]` but not in `H̃^0(O[[T]])`.

### Dependencies

`ArithmeticLocallySymmetricSpaces §ALS.1.6`, `ArithmeticLocallySymmetricSpaces §ALS.2.4`, `ArithmeticLocallySymmetricSpaces §ALS.5a.6`, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, §0.4, §0.2, §1.1, §2.5, §2.4, §3.11, §3.3, §3.1, §3.4, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, `DeformationAndDerivedPatchingAlgebra Layer 8; §4.7 here for compact group rings`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `AlgebraicTopology Stage 4, CW pairs and cellular comparison`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`, `ProfiniteProPGroups Layer 9 prerequisites, completed group algebra and compact modules`.

Foundational prerequisites: G2 and G3 for the chain–cochain comparison, the compact group-ring minimal-model and patched extensions of F.3 and §4.7, and G12 where the deck action of a Shimura tower is ineffective.

## Layer 5: Noetherian finiteness and admissibility

This layer applies the noetherianity of `Λ` to the chain model of Layer 4: completed homology is finitely generated, its torsion is bounded, completed cohomology is admissible in the torsion and unitary Banach categories, and the Iwasawa dimension controls the growth of classical cohomology along a uniform-power filtration and the torsion of completed homology.

### 5.1 Finite generation and canonical topology

For the actual lifted finite-cell tower over compact p-adic analytic `K_0`, `H̃_n` and `H̃_n^{BM}` are finitely generated left `Λ=O[[K_0]]`-modules. The topology inherited from the compact chain complex agrees with the canonical finite-module topology. Kernels and images of its continuous differentials are closed. This asserts neither freeness of homology nor degree concentration, and does not cover arbitrary profinite groups.

Import left and right noetherianity for `O[[K_0]]` and `k[[K_0]]`, including ramified `O`, from NoncommutativeAndEquivariantIwasawa §F.1. Import also its canonical compact quotient topology on finite modules, continuity of linear maps and closedness of kernels and images. Identify the arithmetic compact homology topology with this supplied topology via the finite-projective chain terms and their closed cycle and boundary modules. The pinned Tau Ceti compact-module finite-generation criterion may discharge a density criterion once its hypotheses hold; the arithmetic argument here identifies the actual homology kernels and uses the supplied noetherianity. (ST, §3 opening and Proposition 3.1, p.13; Venjakob, Theorem 3.22, pp.16–18, and the residual graded-ring discussion after Theorem 3.30, p.20.)

(CE, Theorem 1.1(1), p.3; Theorem 1.16, pp.12–13: Finite generation and the canonical topology hold under the finite-cell and analytic hypotheses.; ST, Proposition 3.1 and Lemmas 3.2–3.4, pp.13–14: Finite modules over the compact noetherian algebra have the canonical compact topology.)

To prove this, apply the imported noetherianity to kernels and quotients in the bounded finite projective completed complex. Use compactness of finite modules and the supplied canonical-topology theorem to identify quotient and inverse-limit topologies.

**Checks.**

- The circle tower has finite nonprojective homology `Λ/(γ−1)`.
- A general profinite group is excluded.
- For `U={1}`, the rings are `O` and `k`; the ring result does not assert that every O-module is finite.
- For `U=ℤ_p`, `Λ/(γ−1)` is `O` with its compact quotient topology; its finite generation does not make it free over `Λ`.

*Needs:* §4.2, §4.3, §0.1, NoncommutativeAndEquivariantIwasawa §F.1 for noetherianity and canonical finite-module topology.

### 5.2 Bounded integral torsion

The `ϖ`-power torsion in each finitely generated completed homology module is killed by one `ϖ^a`. For completed cohomology computed by a bounded integral admissible model, its `ϖ`-power torsion is likewise bounded, its quotient by torsion is `ϖ`-adically complete, and rationalization is unchanged by taking that quotient. The cohomological assertion uses strict integral control, not the finite generation of a Banach-space dual alone.

(E06, Theorem 2.1.5, pp.22–24; Proposition 1.2.4, pp.13–14: The integral admissible model controls torsion and completeness.; CE, Theorem 1.1(1)–(2), pp.3–4: Integral bounded torsion is separate from rational duality.)

To prove this, for homology use the ascending torsion submodules and noetherian stabilization. For cohomology invoke the strict admissible-complex theorem and its integral universal-coefficient comparison. Check completeness after quotient and use flat rationalization.

**Checks.**

- The uniform exponent may depend on degree and tame level.
- No integral torsion-free assertion is inferred from rational admissibility.

*Needs:* §5.1, §2.4, §3.7.

### 5.3 Smooth residual admissibility

For a compact finitely generated `Ω=k[[K_0]]`-module `M`, its continuous k-linear dual to discrete `k` is a smooth admissible `K_0`-representation: for every open `U` its U-invariants are the dual of `M_U` and have finite k-dimension. Apply this to completed homology modulo `ϖ`. The reduction of `H̃^n` is identified with such a dual only by the Layer 3 Bockstein comparison, retaining its adjacent-degree torsion term.

(CE, Theorem 1.16 and §1.7, pp.12–14: Compact finite modules and smooth admissible duals are related with integral torsion corrections.; E11, Appendix C, Proposition C.5, pp.103–104: This is the integral finite-socle/dual-finiteness analogue. The stated residual k-module criterion follows from finite `Ω`-generators and finite U-coinvariants, with CE Theorem 1.16 supplying the arithmetic application.)

To prove this, use the imported compact-discrete duality and augmentation coinvariants. A finite set of `Ω`-generators gives finite-dimensional U-coinvariants because `[K_0:U]` is finite. Use the exact Bockstein sequence to distinguish `H̃^n/ϖ` from the dual of one homology group.

**Checks.**

- Invariants dualize coinvariants, not invariants.
- Adjacent torsion can prevent reduction from being the naive dual.

*Needs:* §5.1, §3.5, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 5.4 Admissible completed Banach cohomology

For trivial coefficients, or coefficients with a specified full-H-stable unit ball, the rational completed cohomology of an actual finite-cell arithmetic tower, with either support, is an admissible unitary E-Banach H-representation. For a compact open `K_0` the Schikhof dual of a torsion-free stable unit ball is a finitely generated `Λ`-module, up to isogeny, and its rational dual is a finitely generated `E[[K_0]]`-module. This is the arithmetic application of the Schneider–Teitelbaum anti-equivalence and admissible category of PadicLocalLanglandsForGL2Qp §0.1, in the lattice presentation of F.1; independence of the compact open is the F.1 comparison. General nonunitary algebraic coefficient twists instead have continuous H-action and the compact-open admissibility statement.

(E06, Theorem 2.1.5(i), pp.22–24; Theorem 2.1.12, pp.26–27: Completed ordinary and compact-support cohomology are admissible Banach representations.; ST, Lemma 3.4, pp.14–15; Theorem 3.5 and the following abelianness observation, p.15: The generic admissible Banach/finite Iwasawa-module duality and abelianness are foundational inputs.)

To prove this, identify the dual of the actual torsion-free completed lattice using Layer 3, keeping the integral torsion term until rationalization. Use finite generation and the general compact-group duality theorem. Transport the compact-open criterion to `H` using the imported general local-group result.

**Checks.**

- For the point tower with trivial coefficients the representation is `E` with unit ball `O` and Schikhof dual `O`, finitely generated over `Λ`; it is admissible.
- For the regular point tower with trivial coefficients, completed `H⁰` is `C(K_0,E)` with unit ball `C(K_0,O)`, whose Schikhof dual `O[[K_0]]` is cyclic over `Λ`, although the representation has infinite E-dimension.
- A Banach representation without a finite dual is not declared admissible.

*Needs:* §5.1, §2.10, §3.7, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 5.5 Iwasawa dimension interface

Import Auslander regularity of `Λ_U=O[[U]]` and `Ω_U=k[[U]]`, with global dimensions `d+1` and `d`, for a torsion-free uniform open `U` of analytic dimension `d`, from NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11. Its statements apply more generally to compact analytic groups without p-torsion. Use its grade `j_R(M)=min{i:Ext_R^i(M,R)≠0}` and canonical dimension `δ_R(M)=gldim(R)−j_R(M)` for nonzero finite modules; the zero module has grade `+∞` and dimension `−∞`. Import its coefficient shift `j_Λ(M)=j_Ω(M)+1` when `ϖ M=0`, its torsion-free reduction sequence `0→Ext_Λ^i(M,Λ)/ϖ→Ext_Ω^i(M/ϖM,Ω)→Ext_Λ^{i+1}(M,Λ)[ϖ]→0` and its separate torsion-free grade equality. These use the central uniformizer `ϖ`, including for ramified `O`, and do not assert degreewise `Ext` isomorphisms.

Import the finite-index grade comparison from NoncommutativeAndEquivariantIwasawa §F.1, using its Frobenius-extension `Ext` maps with identity and composition. Identify these `Ext` objects and the coefficient-reduction maps with those of the arithmetic compact modules, on both handedness conventions. Canonical dimension for a general compact analytic `K_0` is computed by restriction to a uniform open subgroup; this does not assign finite global dimension to a group with p-torsion. (Venjakob, Theorem 3.26 and its finite-index `Ext` argument, p.18; Proposition 3.28 and Theorems 3.29–3.30, pp.19–20.)

Prove that for every finitely generated left or right `Λ_U`-module, rank over the Ore division ring is zero exactly when its grade is positive, with `+∞` positive for the zero module. Under restriction to a smaller uniform open subgroup, rank rescales by the finite index. Its vanishing and the imported grade comparison therefore give a criterion independent of the chosen uniform subgroup of `K_0`. Keep the Ore-domain rank distinct from projectivity or integral O-torsion.

(CE, §1.7, Lemma 1.17, pp.13–14: The grade comparison uses a corrected Bockstein sequence; the printed degreewise isomorphism is not used.; CE, §1.2, pp.5–6: Rank, grade and the integral versus residual coefficient dimensions are distinct interfaces.)

To prove the rank criterion, localize at the Ore division ring. A torsion module has no nonzero map to the domain. For positive rank, choose a nonzero linear functional on the localized module and clear a common denominator on finite generators to obtain a nonzero map to `Λ_U`; this is grade zero. Use the finite-coset basis to compare ranks on restriction and the imported Frobenius-extension comparison to compare grades. Treat `ϖ`-torsion and zero modules separately; do not extend the uniform-domain rank definition to a ring with p-torsion group elements.

**Checks.**

- For `Λ=ℤ_p[[T]]` and `M=(p,T)`, the degree-zero reduction map has cokernel `𝔽_p`.
- For a k-module the `Λ`-grade includes the coefficient dimension shift: for `U={1}`, `j_O(k)=1` and `j_k(k)=0`.
- The zero module has grade `+∞` and dimension `−∞`; it is excluded from the minimum-of-nonzero-Ext definition.
- For `U=ℤ_p^d`, `Ω` has dimension `d`, its trivial module `k` has canonical dimension zero, and `Λ` has one extra coefficient dimension.
- At `p=2` use the same `d+1` integral bound; the trivial group already gives `Ext¹_O(k,O)=k`, so an integral bound `d` would fail.
- For `U=ℤ_p`, both `Λ/(γ−1)` and `Λ/ϖ` have Ore rank zero and grade one; only the second is O-torsion. The free module `Λ` has rank one and grade zero.

*Needs:* §5.1, NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11 for Auslander regularity, global dimensions, grade, coefficient comparisons and finite-index invariance, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 5.6 Normalized classical cohomology growth

In the semisimple arithmetic setting and congruence p-power tower of CEbounds §3, with a fixed finite-dimensional algebraic coefficient representation and analytic local dimension `d>0`, `dim_E H^n(Y_r,V)/[K_0:U_r]` tends to zero if the real group has no discrete series or `n` is not half the real symmetric-space dimension. The tower is the regular congruence filtration of that source. This target owns the exact normalized-growth input needed for the completed torsion application; its classical multiplicity and noncuspidal estimates remain proof obligations G5; AutomorphicSpectralTheory does not state them.

Assume throughout this subsection that `G` is a connected semisimple linear algebraic group over a number field `F`, embedded in `GL_N`; `G_∞=G(ℝ⊗_ℚ F)` and `K_∞` is a maximal compact subgroup. `Γ` is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above `p` with ramification index e and set `Γ_r=Γ∩G(𝔭^{er})`. Discard initial terms so that `Γ_r` is torsion-free. The closure `K_0` of `Γ` in `G(F_𝔭)`, after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; `U_r` is the specified congruence filtration `K_0∩(1+p^r M_{e f N}(ℤ_p))`, of analytic dimension `d>0` and index `c p^{dr}` for large `r`. `Y_r=Γ_r\\G_∞/K_∞`, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a `K_0`-stable finite free O-lattice. Dimensions over `E` are compared with classical complex Betti dimensions through this same algebraic coefficient system.

(CEbounds, Theorem 3.4 proof, p.6; Theorem 3.8, pp.7–8: Classical multiplicity limits and the noncuspidal estimate give sublinear normalized growth outside the discrete-series middle degree.)

To prove this, use the arithmetic cohomology/cuspidal comparison for the specified coefficient representation. Insert the discrete-series degree criterion, limit multiplicity bound and noncuspidal bound identified in the source proof; prove these intermediate targets under G5. Divide by the congruence index, which has order `p^{dr}`, and conclude the normalized limit.

**Checks.**

- This is a specified semisimple arithmetic tower theorem, not a theorem for every reductive group or every varying coefficient family.
- The use of deep classical estimates is recorded as a foundational proof target.

*Needs:* `ArithmeticLocallySymmetricSpaces §ALS.1.2` for the fixed finite-level algebraic coefficient comparison, `ArithmeticLocallySymmetricSpaces §ALS.2.4`; the classical multiplicity inputs G5. Completed coefficient untwisting is not needed for this classical estimate.

### 5.7 Semisimple completed homology torsion

In the same semisimple congruence tower, `H̃_n` is `Λ`-torsion if there is no real discrete series or `n` differs from half the real symmetric-space dimension. Here torsion means rank zero after restriction to a torsion-free uniform open domain, not every element being `ϖ`-torsion. The conclusion follows by duality, the normalized classical growth target and the supplied leading-rank asymptotic for admissible Banach invariants plus derived descent. It asserts neither integral vanishing nor a conjectural single-degree concentration theorem.

Assume throughout this subsection that `G` is a connected semisimple linear algebraic group over a number field `F`, embedded in `GL_N`; `G_∞=G(ℝ⊗_ℚ F)` and `K_∞` is a maximal compact subgroup. `Γ` is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above `p` with ramification index e and set `Γ_r=Γ∩G(𝔭^{er})`. Discard initial terms so that `Γ_r` is torsion-free. The closure `K_0` of `Γ` in `G(F_𝔭)`, after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; `U_r` is the specified congruence filtration `K_0∩(1+p^r M_{e f N}(ℤ_p))`, of analytic dimension `d>0` and index `c p^{dr}` for large `r`. `Y_r=Γ_r\\G_∞/K_∞`, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a `K_0`-stable finite free O-lattice. Dimensions over `E` are compared with classical complex Betti dimensions through this same algebraic coefficient system.

(CE, Theorem 1.4, pp.7–8; §1.6, pp.9–11: The proved torsion statement is weaker than the concentration conjectures.; CEbounds, Theorem 3.2, pp.4–5; Theorem 3.4 proof, p.6: The leading corank term compares completed cohomology with classical growth.; Fu, §7, p.23, completed-homology torsion bullet before (38): The non-totally-real `SL₂` example uses completed-homology Iwasawa torsion.)

To prove this, identify rational cohomology corank with the uniform-open rank of the completed dual using 5.4. The bounded derived coinvariant comparison 4.4 and its continuous dual give the finite-level comparison used in the proof of CEbounds Theorem 3.2; filter that bounded complex and apply the regular-congruence leading-rank and higher-continuous-cohomology error estimates supplied by F.5. Their error has lower growth than `[K_0:U_r]`. Use normalized classical growth to force the rank to vanish. This argument uses only that congruence filtration; the separate residual canonical-dimension growth theorem 5.8 is not required. Specialize to the `SL₂` over non-totally-real fields instance without claiming `GL₂` geometric results for `GSp₄`.

**Checks.**

- A nonzero module `Λ/(γ−1)` can satisfy this torsion conclusion.
- No concentration conjecture in CE §1.6 is promoted to a theorem.

*Needs:* §4.4, §5.1, §5.4, §5.5, §5.6, F.5 for the specified leading-rank and continuous-cohomology error estimates.

### 5.8 Uniform filtration growth

For torsion-free uniform `U` of dimension `d>0`, its power subgroups `U_r=U^{p^r}`, a nonzero finite `Ω_U`-module `M` of canonical dimension `δ`, and `V=D_k(M)`, `dim_k V^{U_r}` is bounded above and below by positive constants times `[U:U_r]^{δ/d}`. Establish the filtered-ring/Hilbert-growth theorem here for this regular filtration. It does not assert this exponent for an arbitrary descending normal neighbourhood basis; the uniform-filtration counterexample below exhibits a counterexample.

(CE, Theorem 1.18, p.14: The stated arbitrary-basis formulation needs the regular uniform-filtration restriction recorded in the uniform-filtration counterexample below.)

To prove this, dualize invariants to `Ω`-coinvariants. Prove the filtered Hilbert-growth comparison to the augmentation ideals of uniform power quotients. For augmentation ideal `I` and `q=p^r`, compare the ideal generated by the ordered uniform generators `g_i^q−1` with `I^q` and `I^{d(q−1)+1}`; a PBW/filtered argument gives both inclusions. The Hilbert–Samuel growth of `M/I^nM` is bounded by positive multiples of `n^δ`, yielding the two bounds. Establish these ideal comparisons in the noncommutative complete ring, rather than assuming the quotient is a commutative polynomial ring. The filtered theorem is an explicit G1 obligation; the cited survey alone does not supply its proof. Record the regular-filtration bounds and the anisotropic counterexample to the broader formulation.

**Checks.**

- For `U=ℤ_p²` and `M=k[[T₁]]` with `T₂` acting as zero, the uniform power filtration gives `p^r` growth.
- The basis `p^rℤ_p×p^{2r}ℤ_p` has index `p^{3r}` but the same `p^r` invariants, so the unrestricted `δ/d` formula fails.

*Needs:* §5.5, §5.1.

### 5.9 Middle-degree classical rank and Tate torsion

In the specified semisimple congruence tower with trivial `O` coefficients, suppose `G_∞` admits discrete series and put `n=dim_R(G_∞/K_∞)/2`. Then `D_O(Ĥ^n)` has positive `Λ`-rank; consequently `H̃_n` has positive rank. Moreover `D_O(T_ϖ B^{n+1})` has `Λ`-rank zero even in this middle degree. Thus the classical completion supplies the whole rank in the dual completion–Tate exact sequence, while the Tate contribution is Iwasawa torsion. Rank is measured after restriction to a torsion-free uniform open subgroup, and positive rank is not integral torsion-freeness or concentration.

Assume throughout this subsection that `G` is a connected semisimple linear algebraic group over a number field `F`, embedded in `GL_N`; `G_∞=G(ℝ⊗_ℚ F)` and `K_∞` is a maximal compact subgroup. `Γ` is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above `p` with ramification index e and set `Γ_r=Γ∩G(𝔭^{er})`. Discard initial terms so that `Γ_r` is torsion-free. The closure `K_0` of `Γ` in `G(F_𝔭)`, after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; `U_r` is the specified congruence filtration `K_0∩(1+p^r M_{e f N}(ℤ_p))`, of analytic dimension `d>0` and index `c p^{dr}` for large `r`. `Y_r=Γ_r\\G_∞/K_∞`, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a `K_0`-stable finite free O-lattice. Dimensions over `E` are compared with classical complex Betti dimensions through this same algebraic coefficient system. The coefficient system is trivial, and the strict dual completion–Tate comparison has been proved.

(CE, Theorem 1.4, pp.7–8, including the immediately preceding qualification: The middle-degree classical dual has positive rank, and the Tate dual is torsion; the survey says the latter follows from the proof of the bounds paper.; CEbounds, Theorem 3.2, pp.4–5; Theorem 3.8 and proof, pp.7–8: The leading rank comparison and discrete-series contribution give the arithmetic route; the full classical completion/Tate separation must also be checked.)

To prove this, prove G5’s discrete-series multiplicity limit and positive formal-degree contribution for trivial coefficients, with the cuspidal/noncuspidal comparison. Compare normalized growth of the classical integral completion with the completed Banach corank in the regular congruence filtration; verify the lattice and Tate separation argument signalled by CE rather than deriving it from Theorem 3.2 alone. Apply strict continuous duality to the completion–Tate sequence; rank additivity identifies the positive classical rank and the rank-zero Tate kernel. Use bounded integral homology torsion to identify the rank of `H̃_n` with that of its torsion-free quotient.

**Checks.**

- For `SL₂` over `ℚ` the middle degree is one; degree zero is still an Iwasawa-torsion module.
- The Tate dual may be nonzero despite having rank zero.

*Needs:* §3.10, §5.1, §5.6, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### Examples

The circle tower distinguishes finite generation, `Λ`-torsion and integral vanishing. The ideal `(p, T)` in `ℤ_p[[T]]` distinguishes a Bockstein `Ext` sequence from a false reduction isomorphism in all degrees. The weighted filtration of `ℤ_p²` distinguishes arbitrary bases from uniform-power growth.

### Dependencies

`ArithmeticLocallySymmetricSpaces §ALS.1.2`, `ArithmeticLocallySymmetricSpaces §ALS.2.4`, §2.4, §2.10, §3.10, §3.7, §3.5, §4.2, §4.3, §6.4, §6.3, §5.1, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4`.

Foundational prerequisites: NoncommutativeAndEquivariantIwasawa §§F.1, 0.10–0.11 (analytic and Auslander foundations), G1 (the rank and uniform-growth comparisons) and G5 (the classical multiplicity proof obligations and the leading-rank input for regular filtrations).

## Layer 6: Completed descent and classical comparison

This layer recovers the finite levels: the completed Hochschild–Serre spectral sequence and its fixed-exponent form, homological descent through completed `Tor`, the untwisting of algebraic coefficients, the classical evaluation map, and the derived locally analytic comparison. The descent is Hecke-equivariant: the tame correspondences act on the completed model compatibly with the finite-level identification of 4.4, the spectral sequence of 6.1 is functorial in that model, and on the classical edge this is the Hecke equivariance of the edge map (6.5).

### 6.1 Completed Hochschild–Serre descent

For the actual neat regular finite-cell tower and a compact open `U`, continuous group cohomology in the specified integral admissible category gives a functorial first-quadrant spectral sequence `H^i_cts(U,H̃^j_★)⇒H^{i+j}_★(Y_U,O)`, for `★=ordinary,c`, with the coefficient system and support hypotheses of Layer 4. Rationalization gives the `E` version. The identification with conventional `H̃^j` uses Layer 2 strict integral control; for a general tower replace it by the derived completed complex and retain its Milnor errors. Non-neat fixed levels use the ALS derived stabilizer interpretation.

(E06, Proposition 2.1.11 and proof, pp.24–26; Theorem 2.1.12, pp.26–27: The finite-level integral continuous descent sequence is Proposition 2.1.11; compact support is included in Theorem 2.1.12. Theorem 2.1.5(ii) instead gives rational stable cohomology after taking the level colimit.; CE, Theorem 1.1(4), p.3; Theorem 1.16(4), p.13: The completed Hochschild–Serre sequence is an arithmetic descent statement.)

To prove this, use ALS only for the finite-cover/groupoid descent input. Compute continuous derived U-invariants of the completed continuous-function cochain model, using the supplied coinduced acyclicity and completed tensor conventions. Identify that model with the conventional completed cohomology through strict pro-system control. Filter the bounded model to obtain the spectral sequence, including the full connecting/support maps.

**Checks.**

- The point regular tower has `C(U,O)` with zero higher continuous U-cohomology and degree-zero `O`.
- An arbitrary compact-open action is not enough to identify the abutment with finite arithmetic cohomology.

*Needs:* §4.2, §4.4, §2.4, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, `DerivedModuleAlgebra §§1.T.1 and 1.1`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `ArithmeticGaloisDuality §D7.3; F.2 here for continuous-function coefficients`.

### 6.2 Fixed-exponent descent

At each `s≥1`, `H^i_cts(U,A^j_{★,s})⇒H^{i+j}_★(Y_U,O/ϖ^s)`, using discrete smooth continuous group cohomology and the actual tower’s regular-cover model. The inverse coefficient limit of this spectral sequence cannot be identified with the integral spectral sequence by merely discarding `lim¹`; Layer 2 integral control supplies that comparison under its hypotheses.

(E06, Proposition 2.1.11 proof, pp.24–25: The fixed-exponent smooth modules are computed before applying coefficient inverse limits.)

To prove this, use cofinal covers inside `U` and the imported finite-cover resolution. Apply exact filtered colimits to the descent resolution. Use discrete smooth continuous cohomology at exponent `s`; invoke integral control separately for the coefficient comparison.

**Checks.**

- Finite exponent modules are discrete even when infinite.
- A bad stabilizer contributes higher group cohomology rather than an averaging projector.

*Needs:* §1.1, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, §6.1.

### 6.3 Completed homological hyper-Tor descent

Let `W_0` be a finite free O-module with continuous algebraic U-action and the corresponding local system on `Y_U`. Write 𝒫(O) and `H̃_j(O)` for the completed chain model and homology with constant rank-one `O` coefficients. Give `𝒫(O)⊗_O W_0` the diagonal action, with the inversion fixed by Layer 3. Then `O⊗ᴸ_{O[[U]]}(𝒫(O)⊗_O W_0)≅C_•(Y_U,W_0)`, where `O` is the right augmentation module, and `H_i_cts(U,H̃_j(O)⊗_O W_0)⇒H_{i+j}(Y_U,W_0)`. Here `H_i_cts` is completed `Tor`, not ordinary group-ring `Tor`. The rational `E` version uses flat rationalization and the appropriate completed locally analytic/continuous coefficient category. If the chain model already has coefficients `W_0`, apply derived coinvariants directly to that model, without a second twist.

(Marshall, §5.2, equation (34), pp.1646–1648: Completed homology descent is a continuous homological spectral sequence.; Fu, §7, equation (38), p.23: The spectral sequence includes the finite algebraic coefficient factor.)

To prove this, twist the constant-coefficient lifted chain model by `W_0` before taking coinvariants. Use the derived finite-level comparison and right augmentation convention. Filter the bounded completed projective model, since `W_0` is O-flat. Record ordinary Mathlib group-ring `Tor` as the finite discrete compatibility test, not as the completed theorem.

**Checks.**

- The point tower recovers `W_0` with the prescribed finite-level coefficient action.
- Nonflat coefficients require derived O-tensor as well.
- For `K_0=1` and `W_0=O²`, the degree-zero abutment has rank 2, not 4. For a rank-one character `χ` the diagonal twist contributes `χ` once, not `χ²`.

*Needs:* §4.2, §4.4, §3.4, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `groupHomologyIsoTor`, `ArithmeticGaloisDuality §D7.3; F.2 here for continuous-function coefficients`.

### 6.4 Algebraic coefficient untwisting

For a finite-dimensional algebraic E-representation `W` with a `K_0`-stable finite free lattice `W_0`, each reduction `W_0/ϖ^s` is trivial on some open `U_s`. In this subsection `H̃^n(E)` means completed cohomology with constant rank-one `E` coefficients; the coefficient system on the left is `W`. The arithmetic tower with its associated local system therefore has a compatible fixed-exponent untwisting, and after completion/rationalization its completed cohomology with `W` identifies with `H̃^n(E)⊗_E W` in the diagonal H-action convention specified by `(w,g)↦(g_p⁻¹w,g)`. Commensurable lattices give the same rational result; this does not make the algebraic factor a unitary representation of the full noncompact `H`.

(E06, Lemma 2.2.4, pp.28–29; Lemmas 2.2.8–2.2.10, pp.30–31; Theorem 2.2.17, pp.33–34: Fixed-exponent untwisting first uses the lattice stabilizer; commensurable-lattice transport gives the full rational action and tensor comparison.)

To prove this, choose `U_s` acting trivially modulo `ϖ^s` and pass to its cofinal tower. Use the explicit inverse-action untwisting on adelic representatives and verify lattice transport. Compare reduction squares and take the ordered limits on the fixed lattice. Then invert `ϖ` and use Lemmas 2.2.8–2.2.10 to transport between commensurable lattices, checking the full-H action and the diagonal tensor comparison.

**Checks.**

- The character `W=E` with action `χ` produces the expected inverse in the geometric untwisting and diagonal action after transport.
- A full-H invariant norm on `W` is not assumed.
- At a point with `K_0=1` and `W=E²`, the constant-coefficient factor is `E`, so the comparison gives `E²`, not `E⁴`.

*Needs:* §1.1, §0.3, §2.1, §2.10.

### 6.5 Classical evaluation map

Define the descent edge map `H^n_★(Y_U,W)→(H̃^n_★(E)⊗_E W)^U` by the actual completed descent and coefficient comparison. Its tower colimit maps into the corresponding smooth vectors. In general it has kernels or cokernels controlled by the other spectral-sequence terms; it is not an isomorphism by definition. The locally analytic classical edge map is the separate Layer 6 analytic target.

(E06, Proposition 2.1.11, pp.24–26; Theorem 2.2.11(v), pp.31–32: Finite-level integral descent gives the edge map; after rational lattice comparison its level colimit maps to smooth coefficient vectors. Corollary 2.2.18 is the separate locally analytic spectral sequence.)

To prove this, take the edge of the filtered completed descent model. Check compatibility with refinement and the algebraic untwisting. Pass to the tower colimit and record the other filtration pieces explicitly.

Applications include Classical coefficient recovery: Separate smooth finite-level evaluation from derived analytic recovery; Higher roadmap applications: Check vanishing hypotheses before identifying a classical eigenspace.

The API consists of the following maps and identities.

- **Edge map**: The spectral-sequence edge gives the named finite-level comparison.
- **Refinement**: Pullback of a classical class agrees with the level-refined edge map.
- **Hecke equivariance**: The edge intertwines the transported tame action.
- **Image**: Its image is the `E∞^{0,n}` edge submodule of `E₂^{0,n}`; other filtration pieces describe its kernel.

**Checks.**

- **Point tower in degree zero**: For the regular point tower and trivial `W` the degree-zero map is the finite-level identification.
- **Zero edge on the circle**: For the pro-p circle tower `H¹(Y_U,E)=E` but `H̃¹(E)=0`, so the edge map is zero.
- **Lowest nonzero degree**: If completed cohomology below `n` vanishes, descent makes the degree-n edge an isomorphism.
- An edge map may be zero even when its classical domain is nonzero.
- The construction commutes with tame correspondence maps.

*Needs:* §6.1, §6.4.

### 6.6 Lowest-degree recovery

If `H̃^j_★=0` for all `j<n` in the completed descent model, then the edge `H^n_\*(Y_U,O)→(H̃^n_\*)^U` is an isomorphism. In other degrees recovery is the spectral sequence, and higher continuous U-cohomology terms need not vanish. The analogous rational and algebraic-coefficient statements require their same comparison hypotheses.

(E06, Proposition 2.1.11, pp.24–26; Theorem 2.1.12, pp.26–27: The first-quadrant finite-level descent sequence gives an edge isomorphism when all lower completed rows vanish.)

To prove this, in total degree `n` the only surviving first-quadrant term is (0,n). All outgoing differentials from that edge hit lower completed degrees; incoming terms have negative first index. Use naturality of the edge map and the identified abutment.

**Checks.**

- The circle example does not satisfy lower-degree vanishing in degree one.
- No high-degree edge is declared an isomorphism without checking lower rows.

*Needs:* §6.1, §6.5.

### 6.7 Derived locally analytic recovery

For the locally symmetric arithmetic tower with algebraic coefficient local system `W`, state the derived comparison between classical cohomology and Lie-algebra derived `Hom` from `W∨` into derived locally analytic vectors of the rational completed cochain object, in the source’s `ℚ_p`-local analytic convention. At fixed tame level, for `★=ordinary,c`, this is `colim_U RΓ_★(Y_U,W) ≅ RHom_𝔤(W∨,RLA(RΓ̃_★(O)⊗_O E))`, including the smooth H-action on the classical level colimit. Here the completed input has scalar coefficients; this also states the `GSp₄` instance of BCGP Theorem 4.8.3. A single finite level requires the further continuous U-invariant/descent operation. The derived locally analytic-vector and Lie-cohomology functors, with their exactness hypotheses and `ℚ_p` versus `F_v` restriction-of-scalars convention, are constructed in F.4 on the carriers of LocallyAnalyticDistributions §§0.0–0.3. The ordinary underived `H̃^j_la Ext` spectral sequence of E06 Corollary 2.2.18 is a cohomological consequence and does not by itself specify the derived comparison or justify replacing derived vectors by underived ones.

(E06, Corollary 2.2.18 and Remark 2.2.19, pp.34–35: Lie-algebra `Ext` of locally analytic completed cohomology recovers classical coefficient cohomology spectrally.; BCGP, Theorem 4.8.3, pp.101–102: The `GSp₄` application states a derived locally analytic comparison, not a `GL₂` local-global theorem.)

To prove this, construct the derived analytic-vector machinery of F.4 with its exactness restrictions. Construct the arithmetic evaluation morphism using the untwisted finite-level coefficient diagram. Prove the chain-level comparison G6 before using the full quasi-isomorphism. Derive the classical `Ext` spectral sequence and retain it where only underived vectors are available.

**Checks.**

- No `GL₂` comparison is used as evidence for the `GSp₄` instance.
- For the regular scalar tower the classical side is the smooth locally constant function representation, not the invariants at one chosen U.
- For trivial H the level colimit and single-level object agree; both support versions retain the specified coefficient dual.

*Needs:* §6.1, §6.4, `LocallyAnalyticDistributions §§0.0–0.3; F.4 here for derived vectors`.

### Examples

For the regular point tower, descent recovers the chosen finite-level coefficient. For the circle tower the classical degree-one edge to `H̃¹` is zero. An edge map is an isomorphism in the first nonzero completed degree, because all lower rows of the spectral sequence vanish.

### Dependencies

`ArithmeticGaloisDuality §D7.3; F.2 here for continuous-function coefficients`, `DerivedModuleAlgebra §§1.T.1 and 1.1`, `ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3`, §0.3, §1.1, §2.1, §2.4, §2.10, §3.4, §4.2, §4.4, `LocallyAnalyticDistributions §§0.0–0.3; F.4 here for derived vectors`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `groupHomologyIsoTor`.

Foundational prerequisites: G2 (strict descent control), G6 (the derived analytic comparison) and the continuous coefficient contract of ArithmeticGaloisDuality D7.

## Layer 7: Completed supports, boundary and duality

This layer passes the support triangle through the derived tower, compares it with the conventional long exact sequence, defines completed interior cohomology as an image and compares it with the limit of the finite images, and states completed Iwasawa–Poincaré duality, the boundary strata with completed parabolic induction, and the generic part of boundary vanishing.

### 7.1 Derived completed support triangle

For the Layer 0 support diagram, exact filtered colimit and derived coefficient inverse limit give a natural triangle `RΓ̃_c→RΓ̃→RΓ̃_∂→RΓ̃_c[1]`. It commutes with the integral `H_int`-action, tame correspondences, coefficient changes and permitted level conjugation; after rationalisation it commutes with the full H-action obtained by lattice transport. A full integral H-action requires a coherent H-equivariant integral system. Its long exact sequence uses the cohomology of the derived objects; the conventional modules enter only through their Milnor comparison. There is no claim that a bare inverse limit preserves a long exact sequence of discrete modules.

(CE, §1.5, equation (1.3), p.8: The completed support sequence requires a compatible boundary tower.; E06, Theorem 2.1.12, pp.26–27: The compact-support integral model has the same tower-control requirements.)

To prove this, import the enhanced finite-level triangle. Apply exact filtered colimit as a derived functor with no higher correction. Apply `Rlim_s` and its triangulated exactness; retain the connecting map and Milnor terms.

**Checks.**

- The modular cusp boundary is present in the triangle.
- The compact quotient has zero boundary and identical ordinary/compact support objects.
- A coefficient character of `ℚ_p^×` sending `p` to `p` gives no full integral action on its O-lattice: multiplication by `p` has no integral inverse. The rational triangle has the full action; the integral triangle uses its lattice stabilizer.

*Needs:* §0.2, §2.2, `ArithmeticLocallySymmetricSpaces §ALS.4.1`, `DerivedModuleAlgebra §§1.T.1 and 1.1`.

### 7.2 Conventional support sequence

Under the actual finite-cell strict admissible control for all three support complexes, the triangle identifies with conventional completed modules and yields `…→H̃_c^n→H̃^n→H̃_∂^n→H̃_c^{n+1}→…`. Alternatively impose and verify `lim¹_s A^{n-1}_{★,s}=0` in every relevant degree. Without either hypothesis use the derived support sequence and its Milnor errors. All support arrows and connecting maps are equivariant with the Layer 0 actions.

(CE, §1.5, equation (1.3), p.8: The claimed conventional long exact sequence is justified here through the actual controlled model.)

To prove this, use the simultaneous support comparison, not independent unrelated identifications. When using Mittag–Leffler explicitly, check each support’s inverse coefficient system. Transport the triangle long exact sequence and its actions.

**Checks.**

- A surjective inverse system of cochains alone does not imply the needed cohomology ML condition.
- Connecting maps are part of the comparison.

*Needs:* §7.1, §2.3, §2.4.

### 7.3 Completed homological support sequence

For the actual compact completed chain models, `𝒫_∂→𝒫→𝒫^{BM}` is their relative chain triangle, and its long exact sequence identifies with `H̃_n(∂)→H̃_n→H̃_n^{BM}→H̃_{n-1}(∂)`. Exactness uses the compact closed-image inverse-limit category and the actual finite-cell comparison; it is not the unrestricted exactness of limits of discrete modules.

(Nakamura, §2.3, Lemma 2.4, pp.21–22; Appendix B.1, pp.90–92: The completed Borel–Moore model and compact topological duality retain the boundary.; CE, §1.5, equation (1.2), p.8: The homological support sequence has the displayed degree shift.)

To prove this, import the finite relative cellular chain sequence and complete its compatible lifted representatives. Use exactness for compact modules, retaining closed kernels and images. Compare all three homology groups and their boundary maps.

**Checks.**

- The relative interval example retains its endpoint boundary map.
- The degree shift is n−1 on boundary homology.

*Needs:* §4.2, §3.3, `ArithmeticLocallySymmetricSpaces §ALS.4.1`.

### 7.4 Completed interior cohomology

Define completed interior cohomology `I^n` as `im(H̃_c^n→H̃^n)` in the specified topological module category, with its quotient/image topology and the induced actions. Separately define `I_s^n=im(A^n_{c,s}→A^n_s)` and `I_lim^n=lim_s I_s^n`. There is a canonical map `I^n→I_lim^n`. These two constructions are not identified in the definition; closedness and comparison use the strict model or the kernel-system condition below.

(CE, §1.5, equations (1.2)–(1.3), p.8: The interior term is an image of the support map; its tower comparison must retain inverse-limit errors.)

To prove this, use the actual support arrow after the conventional comparison. Take its image with the induced topology and equivariant structure. Form the separate finite-exponent image system and its canonical comparison map.

Applications include Layer 8 localization: The central projector acts on the image through equivariance; Boundary-free applications: Identify ordinary and compact-support terms only after the boundary vanishes.

The API consists of the following maps and identities.

- **Inclusion**: `I^n` includes in `H̃^n` as the image of the actual support arrow.
- **Factorisation**: The compact-support arrow factors through `I^n` by its image quotient.
- **Actions**: Every compatible local/Hecke action preserves `I^n`.
- **Comparison with finite coefficients**: Coefficient projections give the natural map to `lim_s I_s^n`.

**Checks.**

- **Empty boundary**: For empty boundary the support arrow is an isomorphism and `I^n=H̃^n`.
- **Zero support map**: For a zero support map the image is zero even if both modules are nonzero.
- **Images and inverse limits**: For `A_{c,s}=ℤ` constant, `I_s=ℤ/p^s` with reduction and the surjection `ℤ→I_s`, `lim_s I_s=ℤ_p` but `im(lim_s ℤ→ℤ_p)=ℤ`. Thus inverse limit does not commute with images for uncontrolled discrete systems.
- Image before inverse limit is not made definitionally equal to image afterwards.
- Closedness is an additional proved property of the controlled model.

*Needs:* §7.2, `ContinuousLinearMap`.

### 7.5 Interior image comparison

Let `K_s=ker(A^n_{c,s}→I_s^n)`. The short exact systems `0→K_s→A^n_{c,s}→I_s^n→0` give coker(lim `A^n_{c,s}→lim I_s^n)=ker(lim¹ K_s→lim¹ A^n_{c,s}`). Hence `I^n=I_lim^n` if `lim¹ K_s=0`, with topology comparison requiring strictness/closedness. The finite-cell strict model must establish this kernel-system control when using conventional completed interior cohomology; the equality is not automatic from ML of the source and target systems separately.

(CE, §1.5, p.8: The support image is controlled by applying the inverse-limit exact sequence to its kernel system.)

To prove this, apply the derived inverse-limit exact sequence to the image short exact sequence. Identify the conventional support image with the image of the inverse-limit map. Use kernel ML or the named strict model to eliminate the obstruction and compare topologies.

**Checks.**

- The constant integer to `ℤ/p^s` example has a nonzero obstruction.
- Source and target ML alone do not force kernel ML.

*Needs:* §7.4, §2.3, `DerivedModuleAlgebra §§1.T.1 and 1.1`.

### 7.6 Completed Iwasawa Poincaré duality

For an oriented neat arithmetic d-manifold tower and dual coefficient local systems, the actual `Λ`-cellular duality comparison induces `Ext^i_Λ(H̃_j,Λ)⇒H̃_{d-i-j}^{BM}` with the orientation twist and opposite-ring action converted by `g↦g⁻¹`; swapping supports gives the reverse comparison. It is obtained from the chain-level Poincaré–Lefschetz pairing and `RHom_Λ(𝒫,Λ)`, not the continuous O-dual alone. For `O[[U]]` with torsion-free uniform `U`, the unrestricted `Ext` amplitude is `dim(U)+1`; the smaller `dim(U)` bound requires O-torsion-free input and the supplier’s coefficient argument. The arithmetic chain pairing is proof obligation G7.

(CE, §1.3, p.6, with the opposite-ring convention in §1.2, p.5: The completed Poincaré spectral sequence uses Iwasawa `Ext`. The orientation-sensitive chain comparison is the additional proof obligation G7; CE Theorem 1.16(5) is instead coefficient reduction, and Nakamura Lemma 2.4 concerns continuous O-duality.)

To prove this, import only finite-level manifold/support duality from ALS.5 and AlgebraicTopology. Lift its pairing compatibly to the actual cellular `Λ`-model, acquiring G7’s orientation/opposite-ring check. Use the perfect model to compute RHom and the hyper-Ext filtration. Retain all coefficient torsion and use the correct global-dimension bound.

**Checks.**

- For `U={1}`, `Λ=O` and `M=k`, `Ext¹_O(k,O)` is nonzero.
- The completed pairing is a target here; ArithmeticLocallySymmetricSpaces §§ALS.5a.1–ALS.5a.6 supply its finite-level input.

*Needs:* §4.2, §7.3, `ArithmeticLocallySymmetricSpaces §§ALS.5a.2–ALS.5a.5`, §5.5, `AlgebraicTopology Stage 6, cochains and manifold duality`.

### 7.7 Completed boundary strata

Apply the imported ALS boundary incidence diagram to completed towers. For a proper rational parabolic, the completed contribution retains the Levi arithmetic cohomology and continuous parabolic induction, with orientation and incidence shifts. The nilpotent-radical positive-degree contribution collapses only after proving its actual congruence-tower fixed-exponent colimit is zero (G8); finite component/stabilizer terms remain, especially at `p=2`. The Borel–Serre compactification is supplied by ALS; the required continuous induction on complete lattices is constructed here.

(CE, §1.5, equation (1.4) and preceding discussion, pp.7–9: Completed boundary terms involve Levi towers, induction and the congruence nilpotent-radical calculation.)

To prove this, import actual parabolic strata and their incidence maps from ALS.2. Prove the nilpotent congruence-tower calculation with its integral hypotheses under G8. For the closed local parabolic `P⊂H` and a separated complete ϖ-adic O-torsion-free lattice `V` with continuous unnormalised O-linear left P-action, construct the completed parabolic induction of `V` as the module of continuous functions `f:H→V` satisfying `f(ph)=p·f(h)`, with `(g·f)(h)=f(hg)`. Since `P\H` is compact, give it the uniform ϖ-adic topology via a compact set of representatives. Prove completeness, functoriality and independence of the representatives. For compact open K, restriction identifies the representation with the finite product, over `g∈P\H/K`, of continuous inductions to K from `K∩g⁻¹Pg`, with coefficient action `u·v=(gug⁻¹)·v`; prove this comparison preserves the uniform topology. For reduction, prove `(Ind V)/ϖ^s ≅ Ind(V/ϖ^s)` when the reduction on equivariant functions is surjective; establish that lifting hypothesis in the selected parabolic towers using compact-open local sections of `H→P\H` and lifts of finite-valued functions. Prove compatibility with support and incidence maps. Before applying CE (1.4), form the separate tame-level colimit of 1.5, using smooth induction away from p. Retain the finite component descent and the derived component/stabilizer corrections at `p=2`, where no averaging is available.

**Checks.**

- For `P=H`, evaluation at 1 identifies `completedParabolicInduction(V)` with V and its given action.
- For the Borel of `GL₂(ℚ_p)` and trivial rank-one coefficients, the induction is `C(ℙ¹(ℚ_p),O)`; modular boundary contributions include the cusp degree-zero terms.
- For a nontrivial continuous inducing character `χ:P→Oˣ`, covariance is `f(ph)=χ(p)f(h)`; replacing it by scalar invariance fails this test.
- At `p=2` no finite component average is silently divided by its order.

*Needs:* §7.1, `ArithmeticLocallySymmetricSpaces §§ALS.2.5–ALS.2.10`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`.

### 7.8 Boundary vanishing support comparison

If a compatible central residual Hecke projector e acts on the completed support triangle and `eRΓ̃_∂=0`, then `eRΓ̃_c→eRΓ̃` is a quasi-isomorphism, with all local actions and dual comparisons retained. This generic implication is the interface for BCGP Theorem 4.9.4. Proving boundary vanishing for its `GSp₄` residual Galois hypotheses belongs to that arithmetic consumer and is not deduced from a `GL₂` example or from the generic projector construction.

(BCGP, Theorem 4.9.4, p.104: The arithmetic non-Eisenstein condition is an additional boundary-vanishing input to the support comparison.)

To prove this, apply the supplied compatible projector as an exact summand functor on the enhanced triangle. Use its assumed boundary acyclicity to conclude that the first map is a quasi-isomorphism. Transport duality and actions along that comparison; leave the arithmetic boundary-vanishing proof to the named consumer.

**Checks.**

- Without boundary acyclicity the comparison is not asserted.
- The generic support criterion is independent of the residual Galois irreducibility proof.

*Needs:* §7.1, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`.

### Examples

For empty boundary the ordinary and compact-support objects coincide. For a finite relative interval the endpoint boundary creates relative `H₁ = O`. For the constant integer lifts `ℤ → ℤ/p^s`, the image of the inverse-limit map is `ℤ ⊂ ℤ_p` while the inverse limit of the images is `ℤ_p`, so image and limit do not commute without control of the kernels.

### Dependencies

`DerivedModuleAlgebra §§1.T.1 and 1.1`, `ArithmeticLocallySymmetricSpaces §§ALS.2.5–ALS.2.10`, `ArithmeticLocallySymmetricSpaces §ALS.4.1`, `ArithmeticLocallySymmetricSpaces §§ALS.5a.2–ALS.5a.5`, §0.2, §2.2, §2.4, §2.3, §3.3, §4.2, §5.5, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`, `Foundations F.1–F.3 here; PadicMeasuresIwasawaAlgebras Layers 0–1 and §5.2`, `ContinuousLinearMap`, `AlgebraicTopology Stage 6, cochains and manifold duality`.

Foundational prerequisites: G7 (the arithmetic Iwasawa chain pairing), G8 (the boundary nilpotent calculation) and control of the kernel system for the interior image.

## Layer 8: Shimura, Galois and Hecke adapters

This layer identifies the generic completed objects with the towers that arithmetic applications use. The arithmetic, split-centre and Shimura quotients are first told apart (8.1). The selected canonical-model towers (8.2), the Hilbert and quaternionic coefficient input (8.3) and the finite comparisons 0.6–0.7 then give four named comparison isomorphisms (8.4); the definite unitary degree-zero tower needs no canonical model (8.5), and Scholze's fixed-exponent object is matched with that of Layer 1 (8.6). Galois and tame Hecke actions are transported from finite level (8.7). The remaining targets build the completed Hecke algebra as the inverse limit of finite derived Hecke images, prove that it is semilocal, and localise the completed tower at a residual ideal compatibly with limits, supports and duality (8.8–8.15).

### 8.1 Arithmetic–Shimura central comparison

Distinguish E06’s arithmetic `Y_K`, finite-volume `Y_K°=Y_K/S_∞°`, and Shimura quotient `Ỹ_K=Y_K/Z_∞°`. The first quotient has contractible fiber `S_∞°≅R^a`, hence ordinary coefficient cohomology is unchanged but compact-support cohomology has the real dimension a shift and its orientation factor. The second quotient has a t-dimensional compact torus fiber; its Leray sequence has fiber `H^j((S¹)^t,O)≅∧^jO^t`, so it is not an unconditional cohomology isomorphism. An algebraic coefficient representation descends to `Ỹ` only when the indicated `Z_∞¹` action is trivial. At the finite adelic levels retain the closure of rational central units in the effective deck action; verify the actual deck quotient rather than inferring `K_0/U` from neatness. The Hilbert and selected quaternionic Shimura curves need this comparison, since E06 §2.4’s simplifying equality `Y°=Ỹ` excludes these general examples. Finite-cell/perfect/descent targets apply only to their verified regular tower, or to the explicit central/stabilizer replacement G12.

(E06, §2.4,pp.40–42: The two central quotients, torus fiber, coefficient descent condition and restricted simplifying hypothesis distinguish arithmetic and Shimura towers.; MilneSV, Example5.24,pp.63–64; Theorem5.28 and Remark5.29,pp.65–66; §9 type `A₁` example,pp.94–95: Hilbert/quaternionic data and rational central units determine the effective finite-level quotient; no topological inverse-limit identity from Theorem5.28 is used.)

To prove this, import the actual ALS quotient and coefficient descent data. Use the contractible real-split central bundle comparison for ordinary cohomology and the compact-support Thom shift. For the residual central torus bundle retain its Leray/monodromy comparison instead of identifying its cohomology with the base. Check actual level kernels and coefficient descent before applying Layer 4/Layer 6; prove G12’s effective-deck/perfect replacement if the full compact group is ineffective.

**Checks.**

- For a circle fiber `H¹` contributes `O`, so base and total cohomology need not agree.
- A real-line fiber preserves ordinary `H⁰` but shifts compact-support degree by one.
- Infinite central units are not removed by neatness.

*Needs:* §0.2, `ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.7`, `ArithmeticLocallySymmetricSpaces §ALS.0.8`, `ArithmeticLocallySymmetricSpaces §ALS.1.1`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

### 8.2 Canonical arithmetic tower input

For the selected modular/Siegel, PEL unitary and Hilbert data, specialize ShimuraVarieties §§8.1–8.5 and §8.8 (`CanonicalTower.ofLevelMaps`, `CanonicalTower.translation_comp`, `CanonicalTower.abelian_type`). Canonical existence is supplied by its Layers 5–6. Verify the component, coefficient and tower-map dictionary needed here: varieties over the reflex field, their complex arithmetic quotient, effective finite étale neat-level maps, translations and Hecke spans. Keep the central quotient and component labels of 8.1.

(MilneSV, §5, 5.29, pp.57–66; 12.10, pp.114–115; 13.6–13.8, pp.118–119; 14.12–14.16, pp.125–128: The analytic quotient, canonical-model convention, functoriality and PEL/Hodge/abelian-type existence supply these selected tower contracts.)

To prove this, check the selected PEL/Hodge or abelian-type hypotheses and apply the supplied canonical models and functoriality. Identify the complex components with the ALS quotient and verify coefficient descent before forming the completed diagram.

**Checks.**

- The trivial Shimura datum gives `Spec ℚ`.
- For the full `GL₂` level-3 model there are two geometric components, retaining both primitive Weil-pairing labels.
- The full neat level-9 to level-3 map has geometric degree 81: the congruence kernel has order `3⁴`. On a fixed source component over one target component the degree is 27, with three source determinant labels; the full fibre has 81 points.
- The definite unitary discrete quotient is distinguished from a positive-dimensional unitary Shimura variety.

*Needs:* ShimuraVarieties Layers 5–6 and §§8.1–8.5, 8.8; `ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.7`, §0.6, `ModularCurvesPartII §§14.1–14.4a`, §8.1.

### 8.3 Hilbert finite-level coefficient input

For the Hilbert datum `Res_{F/ℚ}GL₂`, with F totally real and the selected neat level, import HilbertModularVarietiesAndShimuraCurves §R18.4.13 for the finite coefficient/support dictionary and the arithmetic coefficient adapter of §R18.4.12, specialised to the selected quaternionic datum. Assemble the supplied maps for each `O/ϖ^s` into the completed diagram, compatibly with tame Hecke, level maps, coefficient reduction and the compact-support-to-ordinary map. Retain the full tower, central units and finite components. Selected quaternionic Shimura curves have exactly one split real place and use the supplied abelian-type canonical tower; their coefficients satisfy the central descent condition of 8.1.

(MilneSV, §5, pp.57–66; 14.12–14.16, pp.125–128: The totally real Hilbert datum is handled through its selected canonical-model construction and complex arithmetic quotient.; E06, §2.2, Lemma 2.2.4 and Theorem 2.2.17, pp.28–29,33–34: The coefficient system comparison must commute with untwisting and level transport.; MilneSV, Example5.24,pp.63–64; §9 type `A₁` example,pp.94–95: Hilbert data are the split quaternion case; the one-split-real-place case is a curve, and general quaternionic data require the abelian-type route.)

To prove this, use the supplied Hilbert and quaternionic coefficient adapters and canonical analytic quotient with its components. Apply their finite-level comparison at every exponent, including the bidual coefficient dictionary. Check the actual level, tame and reduction squares and feed them to the arithmetic adapter 8.4.

**Checks.**

- Central units are not discarded by replacing the tower with one connected component without descent.
- For proper finite-level input the supplied compact-support comparison equals the ordinary one.
- At a point with rank-one coefficient automorphism u, the bidual coefficient adapter retains u, whereas the unadapted dual would carry `u⁻¹`.

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.4.12–R18.4.13 (arithmetic coefficient adapter and finite-level support comparison); §8.2, `ArithmeticLocallySymmetricSpaces §ALS.1.2`, §0.6, §6.4, §8.1.

### 8.4 Arithmetic tower realisation comparisons

For each of the modular, Siegel, unitary and Hilbert families, fix the actual canonical-model tower `X_K` over its reflex field `E`, an embedding of an algebraic closure of `E` into `C`, a neat cofinal level system `K=K_p K^p`, and a compatible finite locally constant `O/ϖ^s` coefficient system `L_s` from one chosen integral lattice. Identify the Layer 0 finite-level arithmetic quotient with `X_K(C)`, with its archimedean-component convention explicitly matched. The supplied finite étale–analytic comparison gives compatible `O/ϖ^s`-linear isomorphisms of ordinary and compactly supported cohomology, natural for coefficient reduction, level pullback, finite étale trace and tame Hecke correspondences. Applying the existing Layer 1 colimit at fixed `s` and then the Layer 2 coefficient inverse limit gives named continuous linear comparison isomorphisms between the generic completed objects and these four actual arithmetic towers. These are comparisons of the existing carrier, not four new definitions of completed cohomology. The boundary triangle is transported only for the compactification and support maps supplied by Layer 0/Layer 7.

Assume neat levels, giving finite-level schemes and covering maps; nonneat levels require the supplied stack or group-cohomology interpretation. The connected real stabilizer `A_infty^0 K_infty^0` used in the survey and the full stabilizer of a Shimura domain can differ. A comparison is asserted only after a concrete equivariant quotient dictionary; when descent is needed retain derived finite-component descent, rather than averaging at primes dividing the component-group order. The canonical-model towers, their level maps and Hecke correspondences, and the analytic identification with the arithmetic quotient are those of 8.2. Siegel and unitary comparisons use the finite-coefficient comparison 0.6. ModularCurvesPartII §§14.1–14.4a supplies the modular local-system dictionary and 8.3 the Hilbert and quaternionic Shimura-curve one. Trace comparisons use the chosen complex orientation. For the complex orientation identify the finite Tate twist by the chosen compatible roots of unity. Use 0.7 for `ℤ/p^n` and the supplied coefficient-extension compatibility for the selected `O/ϖ^s` local system; no arbitrary unlabelled Tate-twist identification is made. The arithmetic quotient `Y_K` of Layer 0, its quotient `Y_K°` by the split real centre and the Shimura quotient `Ỹ_K` are distinguished as in 8.1. The identification with `X_K(C)` is made for the quotient the selected Shimura datum actually gives, with its coefficient descent, compact-support shift and orientation factor, and with the effective finite deck groups verified there. The notation `Y_K = X_K(C)` does not assert that a central torus bundle or an ineffective central kernel is trivial; where the effective deck group differs from `K_0/U`, the Layer 4 and Layer 6 comparisons are applied to the verified effective tower (target G12).

(CE, §1.5, pp. 7–8: The arithmetic quotient uses connected real stabilizers and retains a finite component-group action; this fixes the quotient dictionary required by the adapter.; Scholze, §4.2, proof of Theorem 4.2.1, p. 1021: The finite compact-support group is identified with étale cohomology of extension by zero on a compactification before the perfectoid argument. Only this finite comparison recipe is used here.; MilneEC, Theorem 21.1 and Remark 21.2, p. 130: Ordinary finite-coefficient comparison and its constructible extension motivate the finite input; compact supports and naturality come from 0.6, not from this ordinary statement.)

To prove this, compare the arithmetic, split-centre and Shimura quotients and their coefficients through 8.1. Take `X_K`, its canonical model, reflex-field action, level maps, Hecke correspondences and the analytic identification with the arithmetic quotient from 8.2; retain determinant/component labels, rather than silently selecting one geometric component. Apply the finite-coefficient comparison with compact supports 0.6. For modular and Hilbert/curve families use the specialized local-system dictionaries of ModularCurvesPartII §§14.1–14.4a and 8.3. Check all comparison squares before taking limits. Use 0.7 for the chosen Tate-twist/complex-orientation normalization and Layer 7 for its coefficient-system transport. Use Layer 1 functoriality on the cofinal level diagram at each `s` and Layer 7 for the support diagram. Then take the Layer 2 coefficient inverse limit with its induced topology; its inverse is the limit of the finite comparison inverses. Export modularCompletedComparison, siegelCompletedComparison, unitaryCompletedComparison and hilbertCompletedComparison; R31.1 imports the first and fourth instead of constructing them again.

**Checks.**

- On a finite disjoint union of geometric points the comparison preserves every component idempotent, and `H^0` is the product of one coefficient module per component.
- At the level of a noncompact modular curve, `H_c^0=0` whereas `H^0` contains constants; the support comparison must not substitute ordinary cohomology.
- For a component group `C_2` at `p=2`, no averaging projection using `1/2` is exported. The quotient dictionary or actual derived descent must appear.
- The Galois action transported to the Betti object depends on the specified comparison and complex embedding; no Galois action on the bare singular site is asserted.

*Needs:* Layer 0, Layer 1, Layer 2, Layer 7, §8.1, §8.2, `ModularCurvesPartII §§14.1–14.4a`, §8.3, §0.6, §0.7.

### 8.5 Definite unitary degree-zero adapter

In the definite unitary setting of LLHLM §5.3, with fixed tame level `U^p` and fixed away-p lattice `W`, let `S(U,W_s)` consist of functions on `G(F^+)\\G(A_f)` with `f(gu)=u^{-1}f(g)`, `W_s=W/ϖ^s`. The actual finite double quotient and its equivariant coefficient system identify this module with `H^0` of the finite discrete arithmetic tower. Thus `lim_s colim_{U_p} S(U_p U^p,W_s)` is canonically the Layer 2 completed degree-zero object after the Layer 1 level colimit for that tower, with its tame Hecke and `G_p` actions and coefficient-limit topology. At a nonneat finite quotient, the value at a representative `x` lies in `W_s^{Gamma_x}`; arbitrary `W_s`-valued functions are valid only when stabilizers act trivially. The degree-zero identification makes no claim that higher stabilizer cohomology vanishes. The finite quotient/coefficient dictionary is a Layer 0 input; no canonical-model or étale–Betti comparison is used for this discrete degree-zero identification. Galois representations associated to Hecke eigenvalues are not a Galois action on these functions.

Use the paper’s definite outer form of `GL_3` over the totally real `F^+≠ℚ`, split over its CM field, and its specified local identifications and tame coefficient lattice. For the simple `G_p` action by right translation, `W` is fixed away `p` and its `U_p` action is trivial. A nontrivial p-adic coefficient action requires the corresponding equivariant coefficient transport, not this simplified formula.

(LLHLM, §5.3, pp. 120–122, especially the definitions of `S(U,W)`, `S(U^p,W)` and its completed lattice: These definitions specify the definite unitary group, coefficient covariance, fixed tame level and the coefficient/level limit order. The invariant-fibre formula follows directly from their covariance condition.)

To prove this, use the finite double-coset decomposition to evaluate functions at representatives. Covariance identifies the result with the product of stabilizer invariants. Identify the same invariant fibres in finite-level equivariant `H^0` using the Layer 0 finite double-quotient/coefficient dictionary. Verify coefficient and level maps, including the covariant coefficient action. Apply the Layer 1 level colimit and then the Layer 2 coefficient inverse limit to this finite comparison; on the fixed away-p lattice use right translation to identify the `G_p` action and the standard finite Hecke sums. Import Layer 3 for Pontryagin/Schikhof duals, rather than creating new dual carriers.

**Checks.**

- One double coset with trivial stabilizer gives `W_s`, with the prescribed tame coefficient action.
- For stabilizer `C_2` acting by sign on `O` at `p=2`, integral invariant values are zero, while modulo 2 all values are invariant. Invariants cannot be interchanged with coefficient reduction without a descent theorem.
- An empty double quotient gives the zero module; a disjoint union gives a product, not an identification with one selected component.

*Needs:* Layer 0, Layer 1, Layer 2, Layer 3.

### 8.6 Scholze fixed-exponent support convention

For the Hodge-type datum `(G,D)`, the fixed embedding into `(Sp_{2g},D_{Sp_{2g}})`, and `K^p` contained in the level-N subgroup with `N≥3` prime to `p`, Scholze’s tilde `H^i_{c,K^p}(ℤ/p^n)` in published §4.2 is `colim_{K_p} H_c^i(X_{K_pK^p},ℤ/p^n)`, at fixed positive `n`. The compact-support part of the arithmetic comparison identifies this with the Layer 1 fixed-coefficient object for the same tower, constant lattice `ℤ_p` and exponent `n`. The integral completed lattice is a separate `lim_n` construction; its `modulo-p^n` recovery requires Layer 2 and is not the definition of the fixed-exponent object. This comparison supplies the left input and the boundary/support convention to TC.2. Scholze Theorem 4.2.1 and Corollaries 4.2.2–4.2.3, including the almost `O_C` coefficient tensor and the boundary ideal sheaf on the perfectoid minimal compactification, are exclusively TC.2 outputs.

Assume throughout this subsection that `n≥1` is fixed. Coefficients are exactly `ℤ/p^n`; an `O/ϖ^s` variant requires an explicit coefficient extension receipt. No perfection, almostification or automorphic sheaf is needed to construct this Layer 8 object; those operations belong to TC.2.

(Scholze, §4.2, definition on p. 1020; Theorem 4.2.1 statement and its two level diagrams on p. 1021: The definition is a compact-support colimit at fixed exponent with the Hodge/Siegel and tame-level hypotheses. The theorem is cited only to identify the consumer and its coefficient/support requirements, not as a Layer 8 theorem.)

To prove this, read the published §4.2 definition with the §4.1 Hodge embedding/tame level conventions, matching finite level and support with the arithmetic adapter. Apply cofinality and the compact-support finite comparison at fixed `n`. Expose the level-insertion maps so TC.2 can verify its pullback/trace diagrams. Layer 8 supplies this fixed-exponent input to TC.2 (the link Layer `8→TC.2`); the perfectoid comparison is not a Layer 8 output.

**Checks.**

- For a proper tower ordinary and compact supports agree under Layer 7; for a nonproper connected curve they do not agree in degree zero.
- The coefficient-limit lattice and its fixed quotient are not declared equal without the Layer 2 coefficient-recovery hypotheses.
- Changing the integral lattice changes the corresponding integral comparison; rational isomorphism alone is insufficient.

*Needs:* §8.4, Layer 1, Layer 2, Layer 7.

### 8.7 Transported Galois and Hecke actions

On each actual finite geometric étale cohomology group of the canonical model over `E`, use its continuous `G_E` action and the chosen O-linear tame Hecke correspondence action defined over `E`. Transport them by the finite arithmetic comparison, then through the fixed-s level colimit and the coefficient inverse limit defining the existing completed object. The resulting actions are unique actions with those finite comparison squares; `G_E` and tame Hecke commute, as do both with `G_p` when supplied by the tower. Give the torsion level colimit the discrete topology and the integral object the inverse-limit topology. Require an open stabilizer for every torsion-colimit vector and continuous reduction maps. Then `G_E×M→M` is jointly continuous, and each Hecke operator is continuous. Joint continuity of `G_p` uses the analogous supplied open stabilizers, not just continuity of individual operators. On a rational object use the chosen stable integral lattice and its induced p-adic topology.

Assume that the finite Galois and Hecke actions commute with level pullback, coefficient reduction and the selected support maps. Actual Hecke correspondences descend over `E`. An infinite-dimensional discrete colimit need not have an open global action kernel: require open point stabilizers, which suffice for joint continuity. Full `G_p` action may move levels by conjugation; the Layer 1 conjugated-level/cofinal construction is supplied. Do not assume `G_p` acts on every fixed `K_p` group.

(CE, §1.5, p. 7: The arithmetic tower carries the full p-adic group and completed tame Hecke action; Layer 8 adds the canonical-model Galois transport to the generic construction.; GN, Remark 2.1.13, p. 11: The completed Hecke action commutes with the full p-adic group on completed homology. This is the consumer requirement for the transported action.)

To prove this, conjugate the finite actions across the comparison, and use naturality to descend to each colimit. Prove its smoothness vector by vector at a finite level and finite coefficient. Invoke the existing TopModuleCat limit and Functor.mapEnd on the coefficient diagram. Equality and commutation are checked under every limit projection; uniqueness follows from those projections. For joint continuity, test each inverse-limit basic open using its discrete coordinate and that coordinate’s open stabilizer. Use Layer 1 for `G_p` level reindexing and Layer 2 for stable-lattice rationalization and its topology. For each residual projector of 8.12 the commutation equations restrict these actions to its closed summand.

The transported actions are consumed by TorsionCohomologyInfrastructure:TC.2: The fixed-exponent compact-support comparison must retain commuting actions; CompletedCohomologyAndLocalGlobalCompatibility:R31.1/R31.3: The Banach lattice and its residual summand must carry the same Galois, Hecke and `G_p` conventions.

The API consists of the following maps and identities.

- The monoid action on the existing topological coefficient-limit object is the image of the natural diagram action under the limit functor; arithmetic finite actions are transported first.
- Each limit projection intertwines the induced operator with the corresponding diagram component.
- Two continuous actions agreeing under every coefficient projection agree.
- Commuting natural diagram actions induce commuting operators on the limit.
- If each coordinate action is jointly continuous, the action on the induced limit topology is jointly continuous.
- A continuous idempotent commuting with all action operators has an invariant image with the restricted continuous action.

**Checks.**

- The trivial natural action induces the identity on every element of the completed object.
- For a constant `O` coefficient-limit diagram with the `C_2` sign action, the nontrivial element acts by −1, including at `p=2`; reduction modulo 2 can be trivial without making the integral action trivial.
- The two shears on `O^2`, represented by matrices [[1,1],[0,1]] and [[1,0],[1,1]], do not commute. Commutation on the completed object requires the finite commuting-action hypothesis.
- Projection to each coefficient coordinate recovers the specified action, with the same order of Hecke composition.
- A product of finite discrete representations gives a continuous inverse-limit action even when their common kernel is not open.

*Needs:* §8.4, Layer 1, Layer 2, Layer 7, `TopModuleCat`, `CategoryTheory.Functor.mapEnd`, `CategoryTheory.Limits.lim`, `TopModuleCat.isLimit`.

### 8.8 Compatible finite derived Hecke image diagram

Fix the commutative abstract spherical O-Hecke algebra `H` away from a finite set `S` containing `p` and all bad tame places. On each Layer 4 perfect complex `C_{U,s}` over the finite group ring `B_{U,s}=(O/ϖ^s)[K_0/U]`, use the specified central O-linear derived `H` action and its finite faithful image `T_{U,s}`. For `V⊂U` and `t≥s`, require the actual Hecke-equivariant derived base-change identification `B_{U,s}` tensor-derived over `B_{V,t} C_{V,t} ≅ C_{U,s}`. It induces a surjective O-algebra homomorphism `T_{V,t}→T_{U,s}`, taking the class of `h` to the class of the same `h`. With the Layer 4 coherence receipts these maps form a cofiltered diagram of finite commutative rings. Mere intertwining of homology maps does not construct these image-ring maps. The equivariant finite image, ghost bound and derived splitting are F.3; the finite commutative local-factor algebra is IntegralHeckeAndGaloisDeterminants §2.2; Layer 8 constructs their compatible tower diagram.

Assume throughout this subsection that `U` ranges over open normal subgroups of `K_0`, with a cofinal countable subsystem chosen for prototypes; finite images are finite as sets, not just finitely generated modules. `B_{U,s}` can be noncommutative. The finite image contracts must be O-linear in `D(B_{U,s})`; IHG’s existing commutative-base Suggested.lean is not silently an equivariant noncommutative contract. Use one compatible `H` and one common bounded cohomological interval for the family when exporting uniform ghost results.

(GN, Definition 2.1.11 and Remark 2.1.12, p. 10: The finite rings are images in the derived category of finite group-ring modules, and their transitions come from coefficient-change identifications, including reduction through a normal subgroup at nonnormal levels.)

To prove this, apply the finite equivariant image/idempotent/ghost theorem of F.3, with IntegralHeckeAndGaloisDeterminants §§2.1–2.2 as its commutative-base comparison. Verify finite cardinality from a bounded finite projective group-ring representative. Apply derived coefficient change to each Hecke endomorphism. Since the same abstract `H` acts at the target, the source action kernel is contained in the target kernel; form the quotient/image map and prove surjectivity on `H` classes. Check identity/composition using the actual Layer 4 base-change isomorphisms and their coherence. Expose the image ring functor without reintroducing the finite Hecke algebra theory.

Applications include Gee–Newton, Definition 2.1.11, p. 10: The big algebra is the inverse limit of this specific finite-image diagram; Layer 8 residual support and localization: Compatible image maps carry finite local factors and their projectors.

The API consists of the following maps and identities.

- The functor on the cofiltered normal-level/coefficient category has object `T_{U,s}` and transition given by the specified derived coefficient change.
- Every transition sends the derived image class of `h∈H` to its target image class.
- Each transition is surjective; finite images are finite commutative O-algebras.
- Identity and composite transitions agree, including their base-change comparison isomorphisms.

**Checks.**

- A zero complex has the one-element image ring at every level; its compatible diagram has no maximal ideals.
- For the scalar action on a rank-one `O/ϖ^s` complex at trivial group level, the image is `O/ϖ^s` and coefficient transitions are quotient maps.
- For `H=k[x]` acting by `x=0` on `k` and by `x=1` on `k`, the zero map of modules intertwines the actions, but no H-compatible map of the two image quotients exists. A bare intertwiner cannot replace base-change recovery.
- Every transition is surjective on actual image rings and preserves the class of each abstract Hecke operator.
- An operator killed in the finer derived image is killed after actual derived coefficient change.

*Needs:* Layer 4, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`, `RingHom.range`.

### 8.9 Residual support at a pro-p level

Choose an open pro-p `U_0⊂K_0`, restrict to `V` normal in `K_0` contained in `U_0`, and put `A_0=T_{U_0,1}` (formed by the same coefficient-change construction, permitting `U_0` nonnormal through a smaller normal subgroup). Under finite equivariant images, bounded perfect complexes, the Hecke-equivariant derived coinvariant identification `k` tensor-derived over `(O/ϖ^s)[U_0/V] C_{V,s} ≅ C_{U_0,1}`, and conservative derived residue reduction for those perfect complexes, each surjection `T_{V,s}→A_0` induces a bijection of maximal ideals. Equivalently its kernel is contained in the Jacobson radical of the finite ring and is nilpotent. The maximal ideals are indexed by the support of the actual derived image, not by arbitrary maximal ideals of `H`.

Assume throughout this subsection that `U_0/V` is a finite p-group. This hypothesis is essential. The conservative reduction is required after splitting each Hecke residual idempotent; its summand is a perfect complex over the finite local group ring. Ghost nilpotence identifies the support of a faithful derived image with the union of its homology supports; no equality of derived and homology images is assumed.

(GN, Lemma 2.1.14, p. 11; Definitions 2.1.6–2.1.8 and Proposition 2.1.9, pp. 9–10: The pro-p residual support argument is the first part of the semilocality proof. Minimal complexes over a possibly noncommutative local ring provide an alternative rigorous detection argument with a named prerequisite.)

To prove this, split a finite residual factor using the equivariant idempotent splitting of F.3. A nonzero factor acts on a nonzero perfect summand: if its identity vanished on all cohomology, bounded ghost nilpotence would force that idempotent to vanish. Over the local finite p-group algebra, conservative derived residue reduction detects this nonzero perfect summand. One can use a minimal representative with differentials in its radical, as in Gee–Newton 2.1.6–2.1.9; after residue reduction its nonzero free term survives. The finite-group-ring residue detection is F.3. The coinvariant identification puts every finer residual label in the support at `U_0,1`. Surjectivity gives the converse. A finite commutative ring’s radical is nilpotent; conclude the stated kernel criterion.

**Checks.**

- For a trivial tower `A_0=k×k`, exactly two residual labels persist.
- For the `C_2` sign representation over `F_3`, derived coinvariants vanish because 2 is invertible; a nonzero perfect summand can disappear. The pro-p hypothesis cannot be removed.
- Nilpotent ghosts can change an image algebra but cannot create a new residual maximal ideal.

*Needs:* §8.8, Layer 4, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`.

### 8.10 Completed derived Hecke algebra

For the compatible finite derived-image diagram `F` of 8.8 define `T̂` as its inverse limit, the subring of the product consisting of compatible tuples, with the subspace topology of the product of finite discrete rings. This is the instance of Mathlib RingCat.sectionsSubring attached to `F`, not a new generic inverse-limit construction. It is a compact Hausdorff complete topological commutative O-algebra. The evaluation maps to finite images are continuous surjections. The compatible map `H→T̂` has dense image; it need not be surjective. Cofinal normal-level systems and iterated coefficient/level limits give canonical topological ring isomorphisms. The finite derived images act on the derived objects and on homology; their compatible coordinate actions induce a continuous action on completed homology. A strict chain action requires a specified coherent lift of the abstract Hecke action: its derived-image quotient is not assumed to act on chain terms; on completed cohomology use the Layer 3 adjoint/dual convention or an explicitly supplied cohomological diagram.

Assume that the normal-level/coefficient index is nonempty and cofiltered; transitions are surjective finite ring maps. Use a countable cofinal subsystem only after proving cofinality. The completed module action is asserted only on diagrams whose action and transition maps are compatible and jointly continuous at each discrete coefficient level.

(GN, Definition 2.1.11, p. 10; Remark 2.1.13, p. 11: These give the inverse limit, its topology, the iterated coefficient/level presentation and its action on completed homology.)

To prove this, apply the existing sections subring to the ring functor. The compatibility equations define a closed subset of the product of finite Hausdorff spaces; compactness, Hausdorffness and completeness follow. For a finite coordinate or finite compatible set of coordinates, choose one finer coordinate. Finite surjective transitions and compactness lift it to a compatible tuple; images of `H` surject onto that finer image ring, proving density. Use the limit universal property to compare cofinal/iterated systems. Apply compatible finite actions coordinatewise to Layer 4 completed homology; use Layer 3 rather than equating chain, homology and dual actions.

Downstream applications include Gee–Newton, Lemma 2.1.14, p. 11: The finite residual support produces finitely many completed local factors; CompletedCohomologyAndLocalGlobalCompatibility:R31.3: The `GL₂` completed Hecke algebra specializes this common construction instead of constructing another big algebra.

The API consists of the following maps and identities.

- `completedHecke`: The carrier is RingCat.sectionsSubring for the finite derived-image functor; use its inherited commutative ring and the product-induced topology.
- Evaluation at any `(U,s)` is a continuous surjective ring map and satisfies all transition equations.
- Two elements agree exactly when their evaluations at every finite image agree.
- A compatible family of continuous ring maps to the finite images factors uniquely and continuously through `T̂`.
- The abstract `H` map is dense because it surjects onto every finite image; density does not assert surjectivity onto the limit.
- Restriction to a cofinal level/coefficient subsystem is a topological ring isomorphism preserving each retained evaluation.
- Evaluation of `t` acting on a compatible module element equals the corresponding finite image operator applied to that coordinate.
- If the finite coordinate actions are jointly continuous and compatible with the diagram, the induced action on the compatible-sections completed module is jointly continuous for the product-induced topologies.

**Checks.**

- For the constant identity-transition diagram on a finite commutative ring A, `T̂≅A` with its discrete topology.
- For `A_s=ℤ/p^s` with reduction maps, `T̂≅ℤ_p`; the map `ℤ→ℤ_p` is dense and is not surjective.
- For the constant diagram with value `ℤ` and identity transitions, the limit is `ℤ` with the discrete topology; its maximal spectrum is infinite, so the finiteness conclusion of 8.11 fails, and the finiteness of the terms assumed there excludes this diagram.
- For the one-element finite image diagram, the completed ring is the one-element ring and its maximal spectrum is empty.
- For the contractible perfect disk `[k --1→ k]`, the derived image is the zero ring; it acts on the zero derived object and homology, but cannot act unitally on the nonzero chain terms.
- No topology of pointwise convergence on End(completed homology) replaces the specified inverse-limit topology.
- The underlying ring and projections agree with the native compatible-sections carrier.

*Needs:* §8.8, Layer 3, Layer 4, `RingCat.sectionsSubring`, `ModuleCat.sectionsSubmodule`.

### 8.11 Semilocal product decomposition

Let `T̂` be the preceding inverse limit and fix the finite base image `A_0` of residual-support-stability. Then evaluation `q:T̂→A_0` is surjective and `ker(q)` is contained in `J(T̂)`. Pullback gives a bijection `MaxSpec(A_0)≅MaxSpec(T̂)`, including algebraic maximal ideals, not only continuous ones. With this finite index set, `T̂≅∏_m T̂_m` as rings and as topological rings when each factor is endowed with the inverse-limit topology from its finite local factors. Each `T̂_m` is a compact complete Hausdorff local ring with the same finite residue field as the corresponding `A_0` factor, and equals the algebraic localization of `T̂` at `m`. The topology asserted here is the finite-image inverse-limit topology. The statement `completedHecke_decomposition` in `Suggested.lean` includes the residual-label and residue-field identifications, semilocality and the canonical topological product decomposition. Its `completedHeckeLocalTopology` gives algebraic localizations the quotient topology from `T̂`, identified by this decomposition with the topology of the corresponding inverse-limit factors. No noetherianity, finite O-module assertion, or identification with the algebraic J-adic topology is inferred merely from semilocality.

Assume throughout this subsection that Every finite transition is surjective and its map to `A_0` has radical kernel. Finite local-factor decompositions and their uniqueness are supplied by IntegralHeckeAndGaloisDeterminants §§2.1–2.2. For the zero image system, the maximal spectrum is empty and the empty product is the one-element ring.

(GN, Lemma 2.1.14, p. 11: The source states semilocality, residue finiteness and the local product decomposition. This comparison proves the inverse-limit-topology portion directly and leaves the source’s stronger algebraic radical-adic conclusion outside its claimed output.)

To prove this, an element is a unit in the limit exactly when all its finite coordinates are units: their unique inverses form a compatible tuple. For `x` in `ker(q)` and any `y`, every coordinate of 1−yx is a unit because each finite kernel is radical. Thus `ker(q)⊂J(T̂)`, which treats all algebraic maximal ideals. Use surjectivity of `q` to identify the finite maximal spectrum. Match each finite local factor to its `A_0` label. Ring maps preserve its unique central idempotent, so finite decompositions are compatible. Take the finite product of inverse-limit factors. The coordinatewise splitting and recombination are inverse continuous ring maps. Each factor has radical kernel over its finite local base, hence is local; elements outside its maximal ideal are units. The projection’s algebraic universal property identifies it with localization. This proves the needed semilocal/topological decomposition directly, without relying on the stronger J-adic conclusion in the source proof. Export that stronger conclusion only with an additional closed-powers/completeness proof.

**Checks.**

- A constant k×k diagram has two algebraic maximal ideals and two factors.
- For `T = {(a,b) ∈ O×O : a ≡ b mod ϖ}`, the ring is local: it has two rational eigensystems but only one residual factor.
- An inverse system of local finite rings with arbitrarily large embedding dimensions may yield a nonnoetherian local limit; this theorem exports no noetherian instance.

*Needs:* §8.10, §8.9, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`.

### 8.12 Compatible residual Hecke projectors

Given a residual maximal ideal `m_0` of `A_0`, let `e_{m_0,U,s}` be the unique central idempotent of `T_{U,s}` equal to 1 in the local factor labelled `m_0` and 0 in its other local factors. Their compatible tuple is `e_{m_0}∈T̂`. This is the unique idempotent with those finite evaluations. The finite family is pairwise orthogonal and sums to 1, and `e_{m_0}T̂` is the `m_0`-labelled completed local factor. It is independent of the chosen finite residual base, pro-p level and cofinal normal subsystem after the labelled transition identifications. A maximal ideal of the abstract `H` is eligible only if it lies in the finite-image residual support and is pulled back from `m_0`.

Assume that the finite local decomposition and residual-label bijections are fixed by the preceding theorem. Do not lift separate characteristic-zero eigencharacters that are congruent modulo `ϖ` to distinct integral projectors.

(GN, Definition 2.1.11, pp. 10–11; Lemma 2.1.14, p. 11: The inverse-limit image algebra and its product into local factors provide canonical residual idempotents. This construction makes the projector compatibility and choice independence explicit.)

To prove this, use the unique finite local-factor idempotents from IntegralHeckeAndGaloisDeterminants §§2.1–2.2. The residual-label bijections show that transition maps preserve them. Form their element of the existing sections ring, and check idempotence, orthogonality and the finite sum at every coordinate. Use cofinality and the unique finite evaluations to prove choice independence. Identify the image ideal with the corresponding product factor.

Downstream applications include Layer 8 completed residual localization: Its action defines the exact closed summand on the existing completed object; CompletedCohomologyAndLocalGlobalCompatibility:R31.3 and TorsionCohomologyInfrastructure:TC.2: Both consumers select the same residual factor, with congruent characteristic-zero eigensystems kept together.

The API consists of the following maps and identities.

- The element of `T̂` formed from the compatible finite local-factor idempotents.
- Its evaluation equals the unique projector for the specified finite residual factor.
- An element with those finite evaluations is the same residual projector; consequently it is independent of all cofinal choices.
- The residual projectors are idempotent, pairwise orthogonal and have finite sum 1.
- Multiplication by the residual projector identifies its image ring with the corresponding factor of the semilocal product.

**Checks.**

- For O×O with the two residual maximal ideals, the projectors are (1,0) and (0,1).
- For a local completed image ring the sole residual projector is 1.
- In `T = {(a,b) ∈ O×O : a ≡ b mod ϖ}`, (1,0) is not an element of `T`. Both rational characters belong to the same residual factor, whose projector is 1.
- A residual ideal outside the image support is rejected as input; it does not define an arbitrary new summand.

*Needs:* §8.11, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`, `RingCat.sectionsSubring`.

### 8.13 Residual localisation of the completed tower

For a compatible continuous `T̂` action on the existing completed cohomology/homology object `M`, define its localisation at the supported residual ideal `m_0` to be the image of the continuous idempotent operator `P_{m_0}=e_{m_0}` acting on `M`, with its subspace topology. Use the native linear-map range; do not define another completed carrier. For Hausdorff `M` it is closed, and `M` is the topological direct product of these finitely many images. Algebraically this image agrees with localization at the corresponding maximal ideal of `T̂`, by the semilocal product theorem. The inclusion and projection split continuously. On Layer 4 complexes take the compatible derived idempotent summands of F.3, agreeing with IntegralHeckeAndGaloisDeterminants §2.2 over a commutative base. On a cohomological dual object use the adjoint-transposed Hecke convention from Layer 3; the residual label is transported along that adjoint anti-isomorphism, not assumed unchanged.

Assume throughout this subsection that `T̂` acts continuously and its finite projectors agree with the finite diagram actions on `M`. The native idempotent image construction is reused from Mathlib. The cohomology/homology duality identification and Hecke adjoints must be supplied by Layer 3 for the stated supports and coefficient lattice.

(GN, Lemma 2.1.14, p. 11; Definition 3.3.5, p. 18, and Proposition 3.4.19, p. 24: The semilocal factors are the residual localization used for completed homology and patched complexes. Layer 8 supplies the common topological summand, not patching or its augmentation theorem.)

To prove this, apply the ring action to `e_{m_0}`; its idempotence gives a continuous idempotent operator. Take its native linear range with induced topology. Use Mathlib’s idempotent `range=kernel(1−P)` and closed-range theorem. Restrict the operator to obtain a split continuous projection and inclusion; finite orthogonal projectors yield the topological product. Use the algebraic localization universal property of the ring factor to compare module localization. Use the F.3 derived splitting for complexes and the Layer 3 adjoint action for cohomology versus homology. Restrict commuting Galois, `G_p` and tame Hecke actions to the summand. No localization by an arbitrary abstract `H` ideal outside the supported finite spectrum is exported.

The residual summand is consumed by CompletedCohomologyAndLocalGlobalCompatibility:R31.3: Its residual Banach representation is the selected closed summand of the generic completed object; TorsionCohomologyInfrastructure:TC.2: The compact-support fixed-exponent object uses the same residual projector before the almost comparison.

The API consists of the following maps and identities.

- The native range of the continuous residual idempotent on the completed object, with induced topology.
- The range subtype inclusion is continuous and linear.
- `P` corestricts to a continuous linear projection onto its range, and the inclusion/projection composites are 1 on the range and `P` on `M`.
- Any continuous linear map intertwining two labelled projectors restricts to the ranges, respecting identity and composition.
- For the supported residual label and semilocal product ring, the selected image is algebraically the localization of `M` at that maximal ideal.
- A finite family of orthogonal continuous idempotents with sum 1 gives a continuous linear equivalence with the product of their ranges, whose coordinates are the projectors.
- For the complete separated additive uniformity of the Hausdorff completed object, its closed residual range is complete with the induced uniformity.

**Checks.**

- The zero projector selects the zero module, even when `M` is nonzero.
- The identity projector selects all of `M` with its original topology.
- On O×O with the first residual factor projector, the selected module is O×{0}; (0,1) is excluded.
- The range topology is inherited from `M` and the inclusion/projection are continuous; no algebraic localization topology is silently substituted.
- A nonidentity residual summand may be zero on one degree of `M` without removing that label from the all-degree derived image algebra.

*Needs:* §8.12, §8.7, Layer 3, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`, `LinearMap.IsIdempotentElem.range_eq_ker`, `ContinuousLinearMap.IsIdempotentElem.isClosed_range`.

### 8.14 Localisation through limits, supports and duality

For a compatible residual label on the actual completed tower, localisation commutes with the fixed-coefficient filtered level colimit and with the coefficient inverse limit: `e(lim_s colim_U M_{U,s})` is continuously isomorphic to `lim_s colim_U e_{U,s}M_{U,s}`, with the inherited topologies. It also commutes with cofinal reindexing and with all supplied equivariant morphisms, including Galois and tame Hecke actions. For a supplied equivariant support triangle, applying compatible derived projectors gives its residual summand triangle and the induced localized long exact sequence. For the exact Layer 3 Pontryagin/Schikhof duality pair, the transpose projector selects the dual of the original residual summand, with the adjoint Hecke label. This is not a claim that an arbitrary algebraic dual commutes with arbitrary inverse limits.

Assume that all finite projectors, transition maps and support-triangle maps are compatible. There are finitely many residual labels. Use Layer 1 for the discrete level colimit, Layer 2 for integral topology and qualified fixed-coefficient recovery, and Layer 3 for the continuous duality regime. Retain the Layer `2 lim^1` terms when its recovery hypotheses fail.

(GN, Remark 2.1.13, p. 11, and Proposition 3.4.19, p. 24: Residual localization is compatible with the completed homology object and the augmentation identification. The general Layer 8 compatibility is a split-idempotent argument on the supplied diagrams, not a new augmentation or duality theorem.; LLHLM, §5.3, pp. 121–122: The unitary example keeps a completed lattice and its dual, illustrating why dual localization must preserve the fixed lattice and its coefficient convention.)

To prove this, at each fixed `s`, represent a vector at some finite level; applying its projector produces a representative in the selected finite summand. Orthogonal complements show the resulting filtered-colimit image comparison is bijective. At the coefficient limit, send a compatible vector to its coordinate projections and use coordinatewise inclusion as inverse on the selected range. Continuity is tested under every coordinate map; no exactness of arbitrary inverse limits is used. For support triangles use the already equivariant Layer 7 triangle and its functorial IHG splitting. For duality transpose the split inclusion/projection; use the exact Layer 3 continuous dual comparison and coefficient/support regime.

**Checks.**

- For a constant `O^2` tower with first-coordinate projector, both orders of limits/localization give the first coordinate with its original topology.
- Localizing the boundary triangle preserves all three terms; it cannot replace compact support by the image in ordinary cohomology.
- For a pairing between a module and its continuous dual, transpose the first-coordinate projector; a Hecke adjoint that permutes residual labels permutes the dual factor accordingly.

*Needs:* §8.13, Layer 1, Layer 2, Layer 3, Layer 7, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`.

### 8.15 Derived and homology images have the same residual labels

Suppose the finite derived image diagram `T_i` maps surjectively and compatibly to the corresponding image `T_i^H` on the direct sum of finite homology groups, and all complexes have cohomology in one common interval `[a,b]`, `a≤b`. The induced map of finite-ring inverse limits `T̂→T̂^H` is surjective and its kernel has `(b−a+1)`-st power zero. Consequently it induces a bijection of residual maximal ideals and transports the unique residual projectors. It need not be an isomorphism. An action on one completed homology degree, or on End of its completed limit, is a further quotient and is not identified with either all-degree inverse-limit image algebra without a separate theorem.

Assume that finite-ring diagrams share the same cofiltered index and compatible image-quotient maps. A uniform cohomological interval supplies the uniform exponent. The IHG equivariant ghost bound is required in the actual derived category of the group-ring complexes.

(GN, Remark 2.1.12, p. 10, and Lemma 2.1.14, p. 11: The finite derived image has nilpotent kernel on all homology; its residual support is therefore detected on homology. This comparison states the uniform-amplitude inverse-limit extension with its additional compactness hypotheses.)

To prove this, use the IHG bounded ghost theorem at every finite coordinate. Products of `b−a+1` compatible ghost elements vanish at every coordinate and hence in the sections ring. Surjectivity of the inverse-limit quotient uses compactness: for a fixed compatible homology-image tuple the finite fibres and finite transition constraints have the finite-intersection property, since a common finer coordinate can be lifted. Arbitrary inverse limits of surjections between infinite modules would not justify this step. Apply the nilpotent-quotient maximal-spectrum and unique idempotent-lift comparison from the finite/complete Hecke input; label and projector compatibility follows. Do not identify the two rings.

**Checks.**

- A constant quotient `k[epsilon]/epsilon^2→k` has identical residual labels and projector 1 but is not an isomorphism.
- Without a uniform exponent, coordinatewise nilpotent kernels need not yield a nilpotent limit kernel; the uniform-amplitude hypothesis stays in the statement.

*Needs:* §8.10, §8.12, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`.

### Examples

For a definite unitary discrete tower the completion is the module of continuous degree-zero functions; its residual dual is the Pontryagin dual, not the O-linear Schikhof dual. A Hilbert or quaternionic input checks central descent and effective deck groups. A central torus fibre contributes exterior-power cohomology and cannot be discarded.

### Dependencies

`ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.7`, `ArithmeticLocallySymmetricSpaces §ALS.0.8`, `ArithmeticLocallySymmetricSpaces §ALS.1.1`, `ArithmeticLocallySymmetricSpaces §ALS.1.2`, Layer 0, §0.6, §0.7, §0.2, Layer 1, Layer 2, Layer 3, Layer 4, §6.4, Layer 7, `DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7; F.2–F.3 here for group rings`, `IntegralHeckeAndGaloisDeterminants §§2.1–2.2; F.3 here for equivariant group rings`, `ModularCurvesPartII §§14.1–14.4a`, `CategoryTheory.Functor.mapEnd`, `CategoryTheory.Limits.lim`, `ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `LinearMap.IsIdempotentElem.range_eq_ker`, `ModuleCat.sectionsSubmodule`, `RingCat.sectionsSubring`, `RingHom.range`, `TopModuleCat`, `TopModuleCat.isLimit`, `AlgebraicTopology Stage 5, item 3, finite-cover transfer and descent; F.3 here for relative adjoints`.

Foundational prerequisites: the selected canonical models supplied by ShimuraVarieties Layers 5–6, G10 (the finite support comparison), G12 (the central quotient, coefficient descent and effective deck groups), the finite equivariant noncommutative Hecke contract, finite p-group derived residue detection, and the arithmetic carriers absent at the library pins.

## Worked examples

**The pro-p circle.** The tower of connected degree-p covers of a circle tests direction, duality and descent at once. A degree-p cover acts by `p` on `H¹` under pullback and by `p` on `H₁` under pushforward. Hence `A¹_s = 0`, `H̃¹ = 0` and `H̃₁ = 0`, but `H̃₀ = O`. The completed cellular complex has differential `γ − 1`. Derived coinvariants recover the finite-level `H₁ = O` through `Tor`, while the coinvariants of the homology alone miss that degree. The integral universal-coefficient sequence has no `E/O`-dual contribution from the torsion of `H̃₀`, since that torsion is zero; this checks the corrected sequence E1 and shows that the classical edge map need not be an isomorphism. Rationalisation comes after the limits: `E ⊗ H̃₁ = 0`, whereas the limit of the rational groups `H₁(Y_U, E)` along multiplication by `p` is `E` (3.6).

**Growth along filtrations.** For `U = ℤ_p²` and `M = k[[T₁]]` with `T₂` acting trivially, the canonical dimension over `Ω` is one. The uniform-power levels give dual invariants of dimension `p^r` at index `p^{2r}`, as `δ/d = 1/2` predicts. The cofinal normal levels `p^r ℤ_p × p^{2r} ℤ_p` have index `p^{3r}` but the same `p^r` invariants, which disproves the growth claim for arbitrary filtrations. The target 5.8 proves filtered Hilbert growth only for the regular uniform-power filtration.

**An Ext calculation.** For `R = ℤ_p[[T]]` and `M = (p, T)`, resolve `M` by `R → R²` with relation `(−T, p)`. Dualising gives `Ext¹_R(M, R) = R/(p, T) = 𝔽_p`, so the reduction of the dual complex has an additional adjacent torsion term. The Bockstein sequence of Layer 5 records it; no identification of `Ext` groups in all degrees is used to prove the grade equality.

**Images and limits.** The constant discrete integer system surjects at every stage onto `ℤ/p^s`. Its inverse limit maps `ℤ → ℤ_p` with image `ℤ`, while the inverse limit of the stage images is `ℤ_p`; the kernel system `p^s ℤ` carries the `lim¹` obstruction. This distinguishes the two definitions of completed interior cohomology in 7.4–7.5. It is a counterexample to control, not a compact arithmetic tower: inverse limits of compact closed images are better behaved.

**Divisible classes in Pan's lemma.** Let `M^0 = M^1` be the `ϖ`-adic completion of the free O-module on `e_1`, `e_2`, …, with `d(e_n) = ϖ^n e_n`. The class of `w = Σ ϖ^n e_n` in `H^1` is nonzero, since a preimage would have to be `Σ e_n`, which is not a null sequence; yet `w − d(e_1 + … + e_{k−1})` lies in `ϖ^k M^1`, so the class lies in every `ϖ^k H^1`. Here `lim_m H^1/ϖ^m` has unbounded torsion, so clause (4) of 2.5 does not apply, while `Hom_O(E, H^1) = 0` still holds, as clause (1) says.

**A zero-dimensional tame tower.** Take tame levels `Y(K) = K⁰/K` for a profinite group `K⁰` of pro-order invertible in `O`, with trivial p-tower. Then `H̃^0_{c,Σ} = C^∞(K⁰, O)` with the translation action, `H̃_{0,Σ}^{BM}` is the colimit of the `O[K⁰/K]` along the maps sending a coset to the sum of the smaller cosets it contains, and the duality of 3.9 sends gK to the functional `f ↦ ∫_{gK} f dμ`. The factor `μ(K)` is what makes these maps compatible with transfer; without it they differ by `[K : K′]`.

**A Hilbert Shimura tower.** First decide whether the quotient in use is the arithmetic quotient `Y`, the finite-volume quotient Y° or the Shimura quotient Ỹ. The split real central quotient preserves ordinary cohomology but shifts compact support. The remaining compact torus quotient has exterior-power fibre cohomology, and coefficients descend only under the stated condition on the central action. The closure of the rational units can make the action of the full local compact group ineffective. The faithful regular-cover calculation of the sources cannot be transported across these quotients without the effective-deck or change-of-rings comparison of G12.

## Foundational proof targets

The following targets supply the intermediate proofs used in the layers. Each includes the coefficient, action and topology comparisons required by its applications.

### G1. General analytic Iwasawa foundations

Import the analytic open-uniform, noetherian, Auslander, coefficient-grade and finite-index theorems from NoncommutativeAndEquivariantIwasawa §§0.2, 0.4, F.1, 0.10–0.11. Sections 0.1, 3.11, 5.1 and 5.5 identify these on the tower's index, admissible complexes, homology topology and `Ext` objects. The Ore-rank comparison of §5.5 and the filtered uniform-growth proof of §5.8 are targets here. F.1 and F.5 prove the generic Schneider–Teitelbaum category and leading-rank estimates before their arithmetic applications.

Needed by §0.1, §5.1, §5.4, §5.5, §5.8.

### G2. Strict integral tower control

Emerton's finite-cell proof needs the full integral admissible-complex and pro-system machinery: strict images, bounded torsion, completeness and the compatible comparison with `lim_s` of cohomology. It is part of the F.1 contract; the native inverse-limit carrier alone does not supply it. The ordinary, compact-support and boundary models are checked simultaneously.

Needed by §2.4, §4.2, §6.1, §7.1.

### G3. Continuous duality with integral torsion

The qualified duality for complete lattices and compact–discrete modules, extending the dualities of PadicLocalLanglandsForGL2Qp §§0.1 and 0.3 as in F.1, with the strict exactness used in the two integral universal-coefficient sequences, in biduality, in the dual completion–Tate sequence and in the chain–cochain comparison, must be proved. The torsion term of the Calegari–Emerton sequence is corrected (E1), but a continuous `Hom` target is not a proof of the theorem.

Needed by §3.1, §3.7, §3.10, §4.2.

### G4. The noncommutative completed-tensor action

Boxer–Pilloni prove the torus case. The noncommutative profinite extension uses the lattice–compact tensor and continuous cochains constructed in F.2, with their inverse-limit topology. It needs the generator calculation for regular functions, the contraction of the completed coinduced complex and the conversion between right and opposite actions. It is verified before the full invariant completed-tensor realisation of `RHom_Λ` is used; the degreewise O-dual anti-equivalence is justified separately.

Needed by §3.12.

### G5. Classical multiplicity proof obligations

The proof of Calegari–Emerton's bounds Theorem 3.4 uses the theorem on the cohomological degrees of discrete series, the limit multiplicity theorems of DeGeorge–Wallach and Savin, and the noncuspidal bound of Rohlfs–Speh; their proofs are required in full. The normalised growth target is stated in Layer 5 rather than taken from AutomorphicSpectralTheory, and publicly usable proofs of these inputs are needed before the arithmetic torsion target closes. The middle-degree target 5.9 also needs the limit of the formal degrees of discrete series and the separation between the rank of the completed integral classical lattice and the rank of the Tate kernel indicated before Calegari–Emerton's survey Theorem 1.4; the rational leading-rank formula of the bounds paper does not prove that separation.

Needed by §5.6, §5.7, §5.9.

### G6. Derived analytic comparison

The derived comparison of BCGP Theorem 4.8.3 needs a chain-level evaluation map and a derived theorem on analytic vectors, with an explicit choice of field and analytic convention. At fixed tame level the classical side is `colim_U RΓ_★(Y_U,W)` and the other side is `RHom_𝔤(W∨,RLA(RΓ̃_★(O)⊗_O E))`, for `★=ordinary,c`; recovery at one finite level uses further continuous U-descent. Emerton's Corollary 2.2.18 supplies only a spectral sequence. The derived machinery is constructed in F.4, and the arithmetic quasi-isomorphism is proved before the stronger comparison is used.

Needed by §6.7.

### G7. The arithmetic Iwasawa chain pairing

ArithmeticLocallySymmetricSpaces §§ALS.5a.1–ALS.5a.6 supply Poincaré–Lefschetz duality at finite level only. The compatible `Λ`-cellular pairing, with orientation, inverse deck action, interchange of supports and grading, is built before the completed hyper-Ext spectral sequence is asserted. Calegari–Emerton state the spectral sequence but do not give this comparison.

Needed by §7.6.

### G8. The completed boundary nilpotent calculation

The proof that the positive-degree colimit over the nilpotent congruence tower vanishes, under the stated coefficient and `p` hypotheses, must be proved, and then Levi induction and incidence compatibility checked. Calegari–Emerton §1.5 gives a route, not a vanishing theorem for arbitrary boundary models. The component and stabiliser corrections at `p = 2` are kept.

Needed by §7.7.

### G10. The finite support comparison

Milne's étale notes (§21) give the proof outline for finite locally constant coefficients and identify the general constructible theorem. ComplexComparisonPartII §§C6.3–C6.5 supply constructible j! comparison, compactification independence and oriented trace. Prove that their maps identify the ALS support triangle and orientation pairing, with the chosen coefficient dictionary. This is a narrow comparison, not a six-functor formalism.

Needed by §0.6, §0.7, §8.3.

### G12. The effective central quotient tower

The central quotient and the effective finite deck groups are verified for the selected Hilbert and quaternionic examples and for the descended coefficients. The hypotheses of a faithful regular `K_0/U` tower in Layers 4 and 6 are not automatic for Shimura quotients with infinite central units. If the full ineffective compact group is kept, a finite projective model needs a qualified change of rings, with a perfect resolution, for the closed central kernel, constructed in F.3 and G12 before perfectness is used; otherwise descent is computed in the verified effective deck group. No invariants theorem for the full group is stated for an ineffective tower.

Needed by §4.2, §8.1, §8.3, §8.4.

### The finite equivariant noncommutative Hecke contract

The derived Hecke image theory of IntegralHeckeAndGaloisDeterminants is stated over a commutative base A, while the deck group rings of Layer 4 can be noncommutative. The equivariant extension of F.3 is proved before the finite derived-image objects of 8.8–8.15 exist for the tower; forgetting the deck action is not enough.

Needed by §8.8, §8.9, §8.15.

### Finite p-group derived residue detection

DeformationAndDerivedPatchingAlgebra §7.3 supplies the commutative minimal-complex comparison; F.3 proves its finite-group-ring counterpart. Layer 4 supplies the finite derived coinvariant identification. The derived Nakayama lemma over the noncommutative finite local group ring, needed after a Hecke idempotent is split off, is a target of F.3, using the finite p-group radical calculation and the minimal-complex argument of Gee–Newton §§2.1.5–2.1.9.

Needed by §8.9.

### Arithmetic carriers at the library pins

The pinned libraries have generic limits, topological modules and derived categories, but not the arithmetic tower and local-system carriers of Layers 0–7 or the canonical-model comparison. The suggested Lean file states the semilocal topological decomposition of 8.11 on native carriers; the profinite Iwasawa locality criterion and analytic Iwasawa noetherianity are imported from NoncommutativeAndEquivariantIwasawa §§0.4 and F.1. The arithmetic comparisons, actions, finite images and support and duality maps are targets of the layers, with their precise prerequisites.

Needed by §8.4, §8.5, §8.6, §8.7, §8.8, §8.14.

## Source corrections

The source statements require the following mathematical corrections. The targets use the corrected forms with the counterexamples below. The displayed counterexamples justify the corrected statements independently of any erratum.

### E1. Integral duality torsion term

Calegari–Emerton, survey, Theorem 1.1(3), p. 3. The first duality sequence has as its left term the `E/O`-dual of the whole of `H̃_{n−1}`. It should be the `E/O`-dual of the torsion submodule, `Hom_cont,O(H̃_{n−1}[ϖ^∞], E/O)`. In the degree-p circle tower `H̃₀ = O` and `H̃₁ = 0 = H̃¹`; the printed term `Hom(O, E/O)` is nonzero, while the corrected term vanishes. 3.7 uses the corrected sequence; 3.9 uses the second sequence, which needs no correction.

### E2. Ext reduction and adjacent torsion

Calegari–Emerton, survey, proof of Lemma 1.17, p. 14. The reduction modulo `p` of every `Ext` group is identified directly with an `Ext` group over `Ω`. For p-torsion-free `M` there is instead a Bockstein short exact sequence with an adjacent `Ext[p]` term, and the grade equality follows from a separate Auslander purity argument. For `R = ℤ_p[[T]]` and `M = (p, T)`, the resolution `R → R² → M` gives `Ext¹_R(M, R) = 𝔽_p`, so the reduction map in degree zero has cokernel `𝔽_p`. This does not say that the grade equality of the lemma is false.

### E3. Uniform versus arbitrary filtrations

Calegari–Emerton, survey, Theorem 1.18, p. 14. The growth exponent `δ/d` is claimed for every descending normal cofinal neighbourhood basis. It holds for a regular uniform-power filtration `U^{p^r}`, with `M` a nonzero finite `Ω`-module and `d > 0`; a broader filtration needs its own weighted growth statement. For `U = ℤ_p²`, `M = k[[T₁]]` with `T₂` acting by zero, `δ = 1`, `d = 2` and `U_r = p^r ℤ_p × p^{2r} ℤ_p`, the invariants of the dual have dimension `p^r` while `[U : U_r]^{δ/d} = p^{3r/2}`, and the ratio tends to zero.

### E4. Integral Ext amplitude

Calegari–Emerton, survey, §1.3, p. 6, the sentence on the amplitude of the `Ext` functors. The Iwasawa `Ext` functors are given amplitude at most `dim(K_0)` on finitely generated integral modules, with no condition on the coefficients. For `O[[U]]` with `U` torsion-free uniform the bound is `dim(U) + 1`; the bound `dim(U)` needs O-torsion-free input and a further argument. For `U =` {1} the ring is `O` and `Ext¹_O(k, O) = k`, although `dim(U) = 0`; for positive `d` the module `k` has its top `Ext` in degree `d + 1`, by regularity.

### E5. The degree of the Tate-module term

Pan (2022), proof of Lemma 4.4.4, p. 45 (arXiv v3, p. 48). After the universal-coefficient sequence, the proof writes the limit over `n` of `H^{i+1}(M^•)[p^n]` as `Hom(ℚ_p/ℤ_p, H^i(M^•))`. It is `Hom(ℚ_p/ℤ_p, H^{i+1}(M^•))`, since the terms are submodules of `H^{i+1}` and a compatible system under multiplication by `p` is a homomorphism from `ℚ_p/ℤ_p`. The proof has just shown that `Hom(ℚ_p/ℤ_p, H^j)` vanishes in every degree, so nothing is affected. The mismatched degree is present in the version of record.

### Further source corrections

- Boxer–Pilloni, §1.4, the display before Proposition 1.4.7, p. 5: the tensor product is the completed one, as in §5.4. 3.12 uses it.
- Boxer–Pilloni, §5.4, Remark 5.4.3, p. `57`: `Λ` acts through `t ↦ [t]` in the invariants that define the complexes, with the universal character normalised accordingly. 3.12 fixes this action.
- Boxer–Pilloni, Theorem 1.4.8, p. 5, and Theorem 5.5.2, p. 57: the `Λ`-structure of the second factor of the Serre pairing is twisted by the involution induced by `t ↦ w₀t⁻¹`. 3.12 records the twist.
- Nakamura, §2.3.2, the second commutative diagram (Inventiones p. 195, arXiv p. 24): the lower row lands in `Hom_O(Ĥ¹_c(K′_{Σ₀}), O)`. 3.9 uses the corrected diagram.

## Suggested Lean forms

`Suggested.lean` uses the namespace `TauCetiRoadmap.CompletedCohomologyPartII`. It declares `completedHecke` (§8.10), `completedHeckeLocalTopology` and `completedHecke_decomposition` (§8.11). The theorem identifies all algebraic residual maximal ideals and residue fields and gives the canonical topological product of local factors for a finite-ring diagram over any small cofiltered index. The two definitions select native compatible sections and the quotient topology on their algebraic localizations. The general locality and noetherianity theorems are supplied by NoncommutativeAndEquivariantIwasawa §§0.4, F.1.

The arithmetic tower and local-system carriers, integral admissible category, lifted finite-cell model, completed coefficient tensors and derived locally analytic-vector functor are absent at the pins. Consequently the arithmetic finiteness, descent, support duality and Shimura comparison theorems, and residual localization of the actual arithmetic tower, have no Lean signatures here. Their mathematical statements, hypotheses and Checks are specified in the layers above. Section 8.15 also needs the compatible finite equivariant derived-image diagram and its all-degree homology action.

## Downstream consumers

- **TorsionCohomologyInfrastructure TC.2** receives the fixed-exponent compact-support object, its support convention and the transported actions (8.6, 8.7), and proves Scholze's perfectoid comparison and the vanishing theorems. For its Iwasawa consequences it also uses the finite projective completed chain complex at a torsion-free pro-p level with its support versions (4.2, 4.3), completed Iwasawa–Poincaré duality with its hypotheses (7.6, target G7) and the tame action (1.3).
- **CompletedCohomologyAndLocalGlobalCompatibility R31** as a downstream consumer imports the modular and Hilbert comparisons (8.4) in R31.1 and specialises the completed Hecke algebra, its residual projectors and the closed localisation (8.10–8.13) to `GL₂` in R31.3. R31.4 builds Nakamura's residually localised Borel–Moore module at tame level `Σ₀` from 3.8–3.9 and proves his Corollary 2.5.
- **CohomologyComparisons CP.6** (Pan's comparison for the modular curve) uses the control lemma 2.5, with 2.2, 2.3, 2.7 and 2.9, for its bounded-torsion inverse limit, and the integral cochain model and coefficient interchange 4.5, with 4.3, for coefficients `A_inf/(ker θ)^k`. The Galois action on `A^i_m` and `H̃^i` is the one transported in 8.7, and the coefficient isomorphism of 4.5 is equivariant for it, acting diagonally with a continuous action on `M`, because at each finite level it is the étale universal-coefficient isomorphism. From Layer 8 it uses the modular comparison (8.4), the transported actions (8.7) and the fixed-exponent convention (8.6). The infinite-level perfectoid modular curve and its Hodge–Tate period map belong to PerfectoidShimuraVarieties (§1.27 and §3.11 for the Hodge–Tate period map, §§5.1–5.3 for the modular-curve tower), and Pan's almost-integral comparison (Pan 2022, Corollary 4.4.3) is not a target of this roadmap.
- **ArithmeticLocallySymmetricSpaces** supplies finite-level descent, support maps and refinement compatibility. Its ALS.6 uses finite-level inputs; completed descent and support are proved here in Layers 6 and 7.
- The sources' own uses: Fu and Marshall use completed homological descent (6.3), Fu's double-limit model (3.6) and the uniform Iwasawa torsion bounds (5.5–5.7); Boxer–Pilloni use the admissible–perfect anti-equivalence, the completed tensor product and the involution (3.11–3.12); Nakamura uses the Borel–Moore and coefficient-module dualities (3.3, 3.7–3.9, 3.13–3.16); Le–Le Hung–Levin–Morra use the definite unitary degree-zero tower and its residual Pontryagin pairing (8.5, 3.17).

## References

Author-draft pagination is distinguished from published pagination.

- **E06**: Matthew Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*. Author draft dated 2 January 2006, 71 pages; cite printed draft pages, not Inventiones pagination. [Public source](https://math.uchicago.edu/~emerton/pdffiles/interpolate.pdf), accessed 2026-10-16. Sections used: §1.2, Definition 1.2.1, Propositions 1.2.4, 1.2.10–1.2.12, 1.2.18–1.2.20, pp.13–19; §2.1, all constructions and proofs, pp.20–27; §2.2, lattice untwisting and Theorems 2.2.11, 2.2.17; Corollary 2.2.18 and Remark 2.2.19, pp.27–35; §2.4 central quotients and Galois comparison, pp.40–42.
- **CE**: Frank Calegari and Matthew Emerton, *Completed cohomology — a survey*. Author survey PDF; printed pp.1–20. [Public source](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf), accessed 2026-10-16. Sections used: §§1.1–1.5, pp.2–9; §1.6 conjecture and conditional implications, pp.9–11; §1.7, Theorem 1.16, Lemma 1.17 and Theorem 1.18, pp.12–15; §1.1, definitions of completed homology and cohomology, p. 2; Theorem 1.1(1) and (3), pp. 3–4; §1.5, pp. 7–8; quotient and component conventions.
- **GN**: Toby Gee and James Newton, *Patching and the completed homology of locally symmetric spaces*. 59-page author PDF; printed pages. [Public source](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), accessed 2026-10-16. Sections used: §2.1.1–2.1.14, pp.7–11; Proposition 3.4.16 and its proof, pp.23–24; Proposition 3.4.19, p.24; Introduction, pp. 1–3; Definition 3.3.5, p. 18; Propositions 3.4.16 and 3.4.19, pp. 23–24.
- **ST**: Peter Schneider and Jeremy Teitelbaum, *Banach space representations and Iwasawa theory*. arXiv:math/0005066 author preprint; published Israel J. Math.127 (2002),359–380; cite preprint pages. [Public source](https://arxiv.org/pdf/math/0005066), accessed 2026-10-16. Sections used: §2 duality, Theorem 2.3, pp.8–12; §3, Proposition 3.1, Lemmas 3.2–3.4, Theorem 3.5 and abelianness, pp.12–15.
- **CEbounds**: Frank Calegari and Matthew Emerton, *Bounds for multiplicities of unitary representations of cohomological type in spaces of cusp forms*. Author version dated 29 February 2008; published Annals170 (2009),1437–1446; cite author pages. [Public source](https://math.uchicago.edu/~emerton/pdffiles/bounds.pdf), accessed 2026-10-16. Sections used: §1 arithmetic and congruence hypotheses, pp.1–3; §2, Theorem 2.1 and Lemma 2.2, pp.3–4; §3, Theorems 3.2,3.4,3.8 and Lemma 3.3 with proofs, pp.4–8.
- **Marshall**: Simon Marshall, *Bounds for the multiplicities of cohomological automorphic forms on `GL₂*`. Annals175 (2012),1629–1651; published PDF. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf), accessed 2026-10-16. Sections used: §5.2, completed homology and equation (34), pp.1646–1648; §6 opening reduction and equations (36)–(37), pp.1648–1649.
- **Fu**: Weibo Fu, *Sharp bounds for multiplicities of Bianchi modular forms*. arXiv:2201.11190v2; printed preprint pages; Annals200 (2024). [Public source](https://arxiv.org/pdf/2201.11190v2), accessed 2026-10-16. Sections used: §7, equations (37)–(38) and the completed-homology torsion bullet, pp.23–24; §1, equation (4), p. 3; §7, the displayed definition, the two bullets and (38), pp. 23–24.
- **BP**: George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*. 65-page author PDF accessed 16 October 2026; cite its printed pages. [Public source](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), accessed 2026-10-16. Sections used: §1.4, Definition 1.4.1 and Remark 1.4.2, pp.4–5; §5.4, Lemmas 5.4.1–5.4.2 and their proofs; Theorem 5.5.2 twist, pp.56–57.
- **Nakamura**: Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*. arXiv:2006.13647 version accessed 16 October 2026; cite arXiv printed pages, not Inventiones234 pagination. [Public source](https://arxiv.org/pdf/2006.13647), accessed 2026-10-16. Sections used: §2.3, Remark 2.3 and Lemma 2.4 with proof, pp.21–22; Appendix B.1, Definitions B.1–B.4 and Lemmas B.5–B.6 with proofs, pp.90–92; §2.3.1, arXiv pp. 20–22 (Inventiones pp. 191–192); §2.3.2, Lemma 2.4 and its proof, the Hecke normalisation, the projector and the tame-level isomorphism, arXiv pp. 22–24 (Inventiones pp. 192–195); §2.3.3 and Corollary 2.5, arXiv pp. 24–25 (Inventiones pp. 195–196), for the use only; Appendix B.2.4, Definitions B.13–B.15 and Lemma B.16, arXiv pp. 95–96, to place B.16.
- **LLHLM**: Daniel Le, Bao `V`. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil’s lattice conjecture in dimension three*. Forum of Mathematics, Pi8 (2020),e5;135-page published PDF. [Public source](https://math.rice.edu/~bl70/LLHLMlattices.pdf), accessed 2026-10-16. Sections used: §5.3 setup, degree-zero spaces and formula (5.8), pp.120–123; §5.3, pp. 120–122; definite unitary forms and completed lattice.
- **BCGP**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1; printed preprint pages. [Public source](https://arxiv.org/pdf/2502.20645v1), accessed 2026-10-16. Sections used: §4.8, Theorem 4.8.3 and its Emerton citation, pp.101–102; §4.9, Theorem 4.9.4 and its stated boundary input, pp.103–104.
- **MilneSV**: James `S`. Milne, *Introduction to Shimura varieties*. Author revision 2017; printed pages. [Public source](https://www.jmilne.org/math/xnotes/svi.pdf), accessed 2026-10-16. Sections used: §5 quotient/tower conventions, 5.29, pp.57–66; 12.10 and canonical-model convention, pp.114–115; 13.6–13.8 functoriality, pp.118–119; 14.12–14.16 and PEL/Hodge-type existence discussion, pp.125–128; Example5.24 and5.28–5.29,pp.63–66; §9 type `A₁` example,pp.94–95.
- **E11**: Matthew Emerton, *Local-global compatibility in the p-adic Langlands programme for `GL₂/ℚ*`. Author manuscript dated 23 March 2011, unpublished; no `GL₂` local-global theorem imported as a generic theorem. [Public source](https://math.uchicago.edu/~emerton/pdffiles/lg.pdf), accessed 2026-10-16. Sections used: Appendix B, Lemmas B.2,B.6,B.7 and Proposition B.11 with proofs, pp.99–102; Appendix C, Definition C.1 and Proposition C.5 with proof, pp.103–104.
- **MilneEC**: James `S`. Milne, *Lectures on étale cohomology*. Version2.21,22March2013; printed pages. [Public source](https://www.jmilne.org/math/CourseNotes/LEC.pdf), accessed 2026-10-16. Sections used: §21, Theorems21.1,21.3,21.5, Lemma21.6 and Proposition21.8 with proof outline, pp.130–134; §14 trace discussion, p.98; §24, Theorem24.1 and Remark24.2, pp.144–145; Theorem 21.1 and Remark 21.2, p. 130.
- **Pan22**: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves*. Forum of Mathematics, Pi 10 (2022), e7, 1–82, open-access version of record, doi:10.1017/fmp.2022.1; arXiv:2008.07099v3 (8 July 2021), p. 48, gives the alternate pagination. [Public source](https://doi.org/10.1017/fmp.2022.1), accessed 2026-10-16. Sections used: §4.4, Corollary 4.4.3, Lemma 4.4.4 with its proof and Remark 4.4.5, published pp. 43–45 (arXiv v3 pp. 47–48).
- **PanII**: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. arXiv:2209.06366v1 (14 September 2022); cite this preprint’s printed pages. [Public source](https://arxiv.org/pdf/2209.06366v1), accessed 2026-10-16. Sections used: §7.2, the construction of the maps `g_{k,m}`, Lemmas 7.2.5 and 7.2.6 with their proofs, pp. 118–120.
- **Scholze**: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. Annals of Mathematics 182 (2015), 945–1066, published §4.2 numbering. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), accessed 2026-10-16. Sections used: §4.1, Theorem 4.1.1 hypotheses, pp. 1017–1020; §4.2 definition, p. 1020; Theorem 4.2.1 statement and comparison diagrams, p. 1021; opening finite-comparison step of proof.

- **Venjakob**: Otmar Venjakob, *On the structure theory of the Iwasawa algebra of a p-adic Lie group*. Author preprint, 39 pages; published J. Eur. Math. Soc. 4 (2002), 271–311. [Public author source](https://www.mathi.uni-heidelberg.de/~venjakob/papervenjakob/auslander.pdf), accessed 2026-10-16. Theorem 3.22 and filtered-ring preparation, pp.16–18; Theorem 3.26, p.18; Proposition 3.28 and Theorems 3.29–3.30, pp.19–20. Its `ℤ_p/𝔽_p` statements require the coefficient extensions specified in 5.1 and 5.5 before application over general `O`.

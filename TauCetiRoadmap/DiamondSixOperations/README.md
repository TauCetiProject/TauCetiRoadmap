# Roadmap: six operations, cohomological smoothness and biduality for diamonds

**Summary.** This roadmap constructs the exceptional operations of étale cohomology for small v-stacks and develops the theory of cohomologically smooth maps, following Scholze's *Étale cohomology of diamonds* (ECD), §§22–25. Its starting point is the étale derived category `D_ét(Y, Λ)` with its four operations `f^*, Rf_*, ⊗` and `RHom`, proper base change and the canonical compactification, all supplied by `DiamondEtaleCohomology`. It defines compactifiable and eligible morphisms. It then constructs the exceptional direct image `Rf_!` in three stages: as `Rf‾_* ∘ j_!` for quasicompact maps, by left Kan extension over locally spatial bases, and by simplicial hyperdescent for small v-stacks. It proves base change, the projection formula and composition for `Rf_!`, obtains `Rf^!` as its right adjoint, and derives Verdier duality and exceptional base change. `ℓ`-cohomologically smooth maps are those for which `Rf^!` is the twist of `f^*` by an invertible dualizing complex. The roadmap proves the practical smoothness criterion, universal openness, composition, descent, smooth base change and the basic examples: the perfectoid ball with dualizing complex `Λ(1)[2]`, quotients by profinite groups of pro-order prime to `ℓ`, smooth morphisms of analytic adic spaces, and `(Spa ℚ_p)^♢ → *`. It ends with biduality, finiteness and conservativity of Verdier duality for diamonds over a geometric point `Spa(C, O_C)`, together with the counterexamples over `Spa(C, C⁺)` for `C⁺ ≠ O_C` that show the base cannot be weakened.

## Scope and ownership

This roadmap owns the material of ECD §§22–25:
- compactifiable maps of v-stacks, locally split maps and the two eligible classes on which the exceptional operations are defined;
- the exceptional direct image `Rf_!` at the three levels of generality, its base change, colimit preservation, composition and projection formula, and their coherences;
- the exceptional inverse image `Rf^!`, Verdier duality, the formal exceptional base change and the adjunction calculus of traces and twisted pullbacks;
- invertible objects, `ℓ`-cohomologically smooth maps, the dualizing complex and the permanence and base-change theory of smooth maps;
- the examples of §24 and the biduality and conservativity theorems of §25.

Five geometric statements that ECD uses in these sections, and that no lower roadmap states, are targets here: hypercovers of small v-stacks by quasiseparated locally spatial diamonds (Section S2.1), the fibre-dimension bound for maps of diamonds and their canonical compactifications (Section S1.1), quotients of maps of diamonds by non-free profinite group actions (Section S5.3), the cyclotomic profinite-Galois-limit torsor over `Spd ℚ_p` (Section S5.5), and approximation of affinoid perfectoid morphisms by open subspaces of relative balls (Section S5.5).

The boundaries are as follows.
- `DiamondEtaleCohomology` (layers C0–C9) owns `D_ét(Y, Λ)` and its enhancement, the operations `f^*, Rf_*, ⊗^L` and `RHom`, change of coefficients, the étale extension by zero `f_!` for étale `f`, proper base change, the canonical compactification of ECD §18, constructible and perfect-constructible complexes, `dim.trg` and the cohomological-dimension bounds of ECD §21, and compact generation. C5 constructs `f_!` only for étale `f`; the general exceptional direct image is built here.
- `DiamondsAndVStacks` (layers D0–D6) owns perfectoid covers, the v-topology, morphisms of v-stacks (open immersions, separated, étale and quasi-pro-étale maps), diamonds and small v-stacks, spatial geometry and diamondification. D4.11 owns the properness predicate and its basic stability API; `DiamondEtaleCohomology` C4 uses that predicate for partial-properness comparisons, valuative refinements and canonical compactification.
- `EnhancedDerivedSheaves` (§§0.1–0.4; layers E0, E2, E3) owns generic ringed-site enhancements, `K`-injective and `K`-flat replacements, derived tensor–`Hom`, coherent derived limits and enhanced functor calculus, and the `∞`-categorical machinery: coCartesian fibrations and straightening, hypercovers and hypercover descent in a topos, left Kan extension along full inclusions, the adjoint functor theorem, mates and the compact-generation criterion for right adjoints.
- `ClassicalAdicEtaleCohomology` owns Huber's classical theory: the trace and Poincaré duality for smooth curves over `Spa(C, C⁺)` of arbitrary rank, compactly supported cohomology of relative balls, constructibility in smooth families and the compactification and boundary duality of smooth rigid curves. This roadmap uses those results and compares them with the diamond theory; it does not reprove them.
- `AdicEtaleGeometry` (layer A2) owns relative balls and tori and smooth morphisms of analytic adic spaces by étale ball charts; `PerfectoidSpaces` (layer P1) owns perfectoid fields, tilts, perfected Tate algebras and the full cyclotomic perfectoid field. `PerfectoidTowers` (P8.3–P8.4) supplies finite-group quotient presentations, invariants of perfectoid pairs and their compatibility with tilting, used to remove the finite torsion part of the cyclotomic action.
- `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` owns ring-valued Haar measures on locally profinite groups (`HaarMeasureWithValues`, the normalised measure with value `1` on a compact open subgroup of pro-order invertible in the coefficients, its existence and uniqueness under `HasUnitProOrder` (target a-valued-haar-measure of Layer SR.1.1), and finite-sum integration of locally constant functions), Layers SR.0.3 and SR.1.1. Tau Ceti owns the supernatural order and index of profinite groups (`TauCeti.profiniteOrder`, `Subgroup.profiniteIndex`) and their Lagrange formula. This roadmap uses the normalised measure of a profinite group of pro-order prime to `ℓ`; it does not construct Haar measures.
- Six operations for maps that are not representable in locally spatial diamonds (for instance `[*/K] → *` for a nontrivial profinite group `K`), and for Artin v-stacks, belong to `VStackSheavesAndLisseCategories`. `ℓ`-adic coefficients and the comparison with schemes belong to `AdicCoefficientsAndComparisons`.

## Conventions

Fix a prime `p`. `Perf` is the category of perfectoid spaces of characteristic `p` with the v-topology; v-stacks, small v-stacks and diamonds are those of `DiamondsAndVStacks` D4, and `* = Spd 𝔽_p` is the final v-sheaf. `C` denotes a complete algebraically closed nonarchimedean field of characteristic `p, O_C` its ring of integers and `C⁺ ⊂ O_C` an open and bounded valuation subring; `Spa(C, C⁺)` is then strictly totally disconnected and has a unique closed point.

**Coefficients.** Unless stated otherwise, `Λ` is a commutative ring with `nΛ = 0` for some integer `n` prime to `p`. This is ECD's standing assumption in §22, and it is assumed in every statement involving `Rf_!` or `Rf^!`. A prime `ℓ ≠ p` is fixed when smoothness is discussed. `Λ` is *`ℓ`-power torsion* if `ℓᵐ Λ = 0` for some `m ≥ 1`, and `𝔽_ℓ = ℤ/ℓ`. Several results are stated over `𝔽_ℓ`, as in ECD, and extended to `ℓ`-power-torsion `Λ` by dévissage. `Λ(1) = Λ ⊗_{ℤ/n} μ_n` is the Tate twist of Section S5.1, and `Λ[n]` is a shift; an invertible object étale locally isomorphic to `Λ[n]` has cohomological degree `−n`.

**Categories and functors.** `D_ét(Y, Λ)` is the étale derived category of `DiamondEtaleCohomology` C2 and `𝒟_ét(Y, Λ)` its presentable stable `∞`-categorical enhancement. Every functor and natural transformation in this roadmap is constructed on the enhancements and then passed to homotopy categories; ECD's `Rf_!` and `Rf^!` are the homotopy-category functors. `f^*, Rf_*, ⊗ = ⊗^L_Λ` and `RHom = RHom_Λ` are the operations of C3, and `f_!` for étale `f` is the left adjoint of `f^*` of C5.

**Compactifications and dimensions.** Properness throughout is the predicate imported from `DiamondsAndVStacks §D4.11`: quasicompact, separated and universally closed, with universal closedness tested on `|Y′ ×_Y X| → |X|` for every small v-sheaf `X → Y` (ECD Definition 18.1, p. 101). `DiamondEtaleCohomology §C4.1` re-exports this same predicate and its supplied basic API; C4 adds partial properness, valuative refinements and compactification results without defining a second properness predicate. For a separated map `f : Y′ → Y` of v-stacks, `(Y′)‾^{/Y} → Y` is the canonical compactification of C4 (ECD Proposition 18.6), `j : Y′ → (Y′)‾^{/Y}` the natural map and `f‾ : (Y′)‾^{/Y} → Y` the structure map, so that `f = f‾ ∘ j`. `dim.trg f` takes values in C8's `WithBot ENat`, written `ℤ_{≥0} ∪ {−∞, ∞}`, and an empty source has value `⊥ = −∞` (`DiamondEtaleCohomology §C8.16`, ECD Definition 21.7). "`dim.trg f < ∞`" is a global bound. "Locally `dim.trg f < ∞`" means that after pullback to any spatial diamond `X → Y`, every quasicompact open subspace of `Y′ ×_Y X` has finite `dim.trg` over `X`; the bound may depend on the open. `dim f` is the topological fibre dimension of C8 (ECD Definition 21.1 and Remark 21.8).

**Smoothness and twists.** A map is `ℓ`-cohomologically smooth in the sense of Section S4.2. The dualizing complex `D_f = Rf^!Λ` of a smooth `f` is invertible, and the twisted-pullback transformation `τ_f : Rf^!Λ ⊗ f^* → Rf^!` of Section S3.4 is an equivalence for it. For a free action of a finite group of order `m` prime to `ℓ`, the averaging transformation of Section S5.3 is multiplication by `m⁻¹` under the identification `Rq^! = q^*`; it is not that identification.

**Prerequisite labels.** `Cj`, `Dj`, `Ej`, `Aj` and `Pj` refer to layer `j` of `DiamondEtaleCohomology`, `DiamondsAndVStacks`, `EnhancedDerivedSheaves`, `AdicEtaleGeometry` and `PerfectoidSpaces`. The *Needs* lines name the supplier roadmap and its numbered subsection or target label, for example `DiamondEtaleCohomology §C4.13` or `DiamondsAndVStacks D5/relative-representability`. `ClassicalAdicEtaleCohomology` is cited by the sections of its roadmap. Sections S0.1–S6.3 are those of this roadmap. Lean names in backticks are declarations of Mathlib, Tau Ceti or a supplier roadmap; the targets of this roadmap and their APIs are described in prose and cited by section. [Suggested.lean](Suggested.lean) explains which geometric and sheaf-theoretic objects are needed to state the headline theorems against the pinned libraries.

## Exact supplier contracts

The pinned libraries are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The roadmap contracts below specify the additional mathematical interfaces required from each named roadmap.

### From Mathlib

- `JacobsonSpace`, `closedPoints`, `nonempty_inter_closedPoints` (every nonempty locally closed subset of a Jacobson space contains a closed point) and `JacobsonSpace.of_isOpenEmbedding` (open subspaces of Jacobson spaces are Jacobson), for the closed-point detection of Section S6.3.
- `ValuationSubring`, `IsLocalRing.exists_factor_valuationRing` (a local homomorphism into a field factors locally through a valuation subring) and `finite_of_finite_type_of_isJacobsonRing` (Zariski's lemma), for the valuation-refinement argument of Section S6.3.
- `LocallyConstant` and `LocallyConstant.freeOfProfinite` (Nöbeling's theorem: `LocallyConstant S ℤ` is a free `ℤ`-module for profinite `S`), for `C⁰(S, Λ)` in Sections S4.1 and S5.4.
- `Algebra.linearMap` and `Algebra.trace` on `I → Λ`, for the diagonal and summation maps in the finite-fibre trace conventions of Section S3.4.
- `CategoryTheory.Adjunction`, `CategoryTheory.conjugateIsoEquiv` and `CategoryTheory.MonoidalClosed`, for the formal adjunction arguments of Layer S3; `DerivedCategory`, `DerivedCategory.singleFunctor` and `DerivedCategory.homologyFunctor` and the shift, for the coefficient complex and degree of invertible objects over a point; `Module.evalEquiv`, for reflexivity of finite-dimensional vector spaces; `TopCat.Presheaf.stalk`, for the sheaf detection statement of Section S6.3; `rootsOfUnity`, for the twist convention of Section S5.1; `Subgroup.index` and `OpenNormalSubgroup`.

### From Tau Ceti

- `TauCeti.profiniteOrder` and `TauCeti.ofNat_card_quotient_le_profiniteOrder` in `TauCeti.Topology.Algebra.Group.Profinite.Order` (the supernatural order and the divisibility bound for finite continuous quotient orders), `Subgroup.profiniteIndex` and `OpenSubgroup.profiniteIndex_eq_ofNat_index` in `TauCeti.Topology.Algebra.Group.Profinite.Index.Basic` (agreement with `Subgroup.index` for open subgroups), and `Subgroup.profiniteOrder_eq_mul_profiniteIndex` in `TauCeti.Topology.Algebra.Group.Profinite.Lagrange` (Lagrange for closed subgroups), for the pro-order hypotheses of Section S5.3.
- `TauCeti.profiniteOrder_multiplicative_padicInt` in `TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic`: the order of the additive group of `ℤ_p`, written multiplicatively, is `p^∞`. This supplies the `ℓ ≠ p` and `ℓ = p` controls in Section S5.3.

### From TauCetiRoadmap

- `SmoothRepresentationsOfLocalGroups`, Layer SR.0.3: `HasUnitProOrder Λ (⊤ : Subgroup K)`, every finite continuous quotient of `K` has order a unit of `Λ`.
- `SmoothRepresentationsOfLocalGroups`, Layer SR.1.1: `HaarMeasureWithValues`, the normalised measure `μ` with `μ(U₀) = 1` on a compact open subgroup of invertible pro-order, its value `[U₀ : U]^{−1}` on cosets of open subgroups `U ≤ U₀` and its uniqueness, and finite-sum integration of locally constant compactly supported functions with values in a `Λ`-module.

### From the diamond and sheaf-theoretic roadmaps

| Supplier | Interface used here |
| --- | --- |
| `AdicSpacesPartII`, §R0.19.10 | Quasicompact and quasiseparated objects and morphisms of a topos, algebraic topoi and their stability API; D0 imports this vocabulary (ECD §8, pp. 40–41) |
| `DiamondsAndVStacks`, Layer D0 | The algebraic-topos application of coherent-site filtered-colimit cohomology (§D0.18, importing `SchemeAndStackFoundations §2.5`), coherent-topos limit cohomology (§D0.21), and the spectral-quotient criterion (ECD Lemma 2.10) |
| `DiamondsAndVStacks`, Layer D1 | Strictly totally disconnected perfectoid spaces, their components, the topological classification of pro-étale maps over them, pro-constructible generalizing subsets |
| `DiamondsAndVStacks`, Layer D2 | v-descent of `O` and `O⁺` |
| `DiamondsAndVStacks`, Layer D3 | Open and closed immersions, separated and `0`-truncated maps, étale and quasi-pro-étale maps of stacks, v-local nature of these classes, sub-v-sheaves of totally disconnected spaces, torsors under locally profinite groups, separated étale perfectoid spaces as v-stacks |
| `DiamondsAndVStacks`, Layer D4 | Small v-sheaves and v-stacks, underlying spaces, surjectivity, compact Hausdorff diamonds, quotients by pro-étale equivalence relations and by group actions; §D4.11 is the sole definition owner for proper maps of v-stacks (ECD Definition 18.1) and supplies closed immersions, composition and base change for that predicate |
| `DiamondsAndVStacks`, Layer D5 | Spatial and locally spatial diamonds, relative representability, universally open presentations, permanence under quasi-pro-étale maps and fibre products, cofiltered limits, the Berkovich and maximal Hausdorff quotients, the spatial v-sheaf criterion |
| `DiamondsAndVStacks`, Layer D6 | Gluing `Spd`, the diamond of an analytic adic space and its étale site, `Spd` of a Tate pair, spatiality of `Spd(A, A⁺)` |
| `DiamondEtaleCohomology`, Layer C0 | Continuity of étale cohomology along cofiltered limits of spatial diamonds; the étale topos of a strictly totally disconnected space |
| `DiamondEtaleCohomology`, Layer C2 | `D_ét(Y, Λ)`, its presentable stable enhancement, left-completeness, v-hyperdescent, testing on one v-cover, and the coherent simplicial enhanced v-derived categories of §C2.9 |
| `DiamondEtaleCohomology`, Layer C3 | `f^*, Rf_*` and their base change for qcqs maps (ECD 17.6), `⊗^L, RHom`, change of coefficients |
| `DiamondEtaleCohomology`, Layer C4 | The D4.11 properness predicate and basic API re-exported by §C4.1; partial properness, its comparison with properness, valuative refinements, the canonical compactification, its universal property and base change, and the envelope of an affinoid perfectoid space |
| `DiamondEtaleCohomology`, Layer C5 | Étale extension by zero, its base change, the open–closed triangle, proper base change (ECD Theorem 19.2) and its unbounded form, the étale topos of a compactified geometric point |
| `DiamondEtaleCohomology`, Layer C6 | Invariance of étale cohomology under extension of algebraically closed base fields |
| `DiamondEtaleCohomology`, Layer C7 | Constructible and perfect-constructible sheaves and complexes, their limit descent and filtrations |
| `DiamondEtaleCohomology`, Layer C8 | `dim.trg` of maps of analytic adic spaces and of diamonds, its base change and composition, local finiteness, topological fibre dimension, the bounds of ECD 21.6, 21.11, 21.13–21.16, exactness of direct images along quasi-pro-étale maps and quasicompact injections, acyclicity of strictly totally disconnected spaces |
| `DiamondEtaleCohomology`, Layer C9 | Compact generation under a uniform cohomological-dimension bound, compact objects over `𝔽_ℓ` and perfect-constructible compact objects, commutation of global sections with coproducts |
| `EnhancedDerivedSheaves`, §§0.1–0.4 | Generic ringed-site enhancements, `K`-injective and `K`-flat replacements, derived tensor–`Hom`, coherent derived limits and enhanced adjunctions and functor calculus; the analytic hypotheses and comparisons are supplied by `ClassicalAdicEtaleCohomology` in the sections below |
| `EnhancedDerivedSheaves`, Layer E0 | Joins and slices, coCartesian fibrations and restricted straightening |
| `EnhancedDerivedSheaves`, Layer E2 | Hypercovers in a topos, hypercover descent (bounded and unbounded), independence under refinement |
| `EnhancedDerivedSheaves`, Layer E3 | Left Kan extension along a full inclusion (§E3.1), coherent diagrams of ringed topoi over small posets and coherent mates (§E3.4), the adjoint functor theorem (§E3.2), and the compact-generation criterion: for an adjunction `F ⊣ G` of stable categories with compactly generated source, `G` preserves coproducts if and only if `F` preserves compact objects (§E3.3). Simplicial diagrams use `DiamondEtaleCohomology §C2.9` and restricted straightening of §E0.7; they are not inferred from the poset case alone. |
| `AdicEtaleGeometry`, Layer A2 | Relative closed polydiscs and tori, smooth morphisms by étale charts over relative balls |
| `PerfectoidTowers`, P8.3–P8.4 | Finite-group quotient v-sheaves, invariants of perfectoid pairs without a restriction on the group order, and their compatibility with tilting |
| `PerfectoidSpaces`, Layer P1 | Perfectoid fields, tilts, perfected Tate algebras, the cyclotomic perfectoid field |

### From ClassicalAdicEtaleCohomology

- Section 2.4: the Zariski–Riemann space of a field as a limit of projective models (Huber 1993, Lemma 2.1).
- Section 8.2: compactification of quasicompact separated smooth rigid curves over a complete algebraically closed field, local form: every point has a quasicompact open neighbourhood with an open immersion into a proper smooth curve.
- Section 8.4: the bound `n + 2 dim.tr f` for `R⁺f_!` when `f` is separated, taut, locally of +weakly finite type and finite-dimensional, for an input complex `K` with `Hⁱ(K) = 0` for `i > n` (Huber 1996, Proposition 5.5.8, p. 304). For a degree-zero sheaf on a smooth curve over `Spa(C, C⁺), n = 0` and `dim.tr f = 1` give the degree-two bound.
- Section 9.2: compactly supported cohomology of the relative ball over `Spa(C, C⁺)`, the trace map of a smooth curve and its compatibility with change of base.
- Section 9.5: the smooth trace over general analytic bases.
- Section 9.6: Poincaré duality for smooth curves over `Spa(C, C⁺)` of arbitrary rank, its compatibility with extension by zero from quasicompact opens, duality with an open coefficient for every unbounded complex, and constancy of the top trace across the plus ring.
- Section 10.5: constructibility of the pulled-back direct image along the relative ball over a strictly totally disconnected base.
- Section 11.3: finiteness of the frontier of a quasicompact open of a smooth curve, the compactification direct summand and the proper-curve duality reduction.

## How to read the build

The layers are built in order. Within S1.4 the spatial `2·dim.trg` bound precedes the general `3·dim.trg` bound; within S1.5 coproduct preservation precedes the projection formula. S0 fixes the classes of maps. S1 constructs `Rf_!` for quasicompact maps from the canonical compactification and proves its first properties. S2 extends it to all eligible maps, first over locally spatial bases by left Kan extension and then over small v-stacks by hyperdescent. S3 obtains `Rf^!` by the adjoint functor theorem and develops its formal calculus. S4 defines cohomological smoothness and proves its theory, S5 supplies the examples, and S6 proves biduality and conservativity over a geometric point.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [S0](#layer-s0-compactifiable-and-eligible-morphisms) | Compactifiable, locally split and eligible maps | All eight parts of ECD Proposition 22.3; the eligible and spatial-eligible classes |
| [S1](#layer-s1-the-exceptional-direct-image-for-spatial-eligible-maps) | `Rf_! = Rf‾_* ∘ j_!` for spatial-eligible maps | Independence of the compactification, the `3·dim.trg` and `2·dim.trg` bounds, proper diamonds of `dim.trg ≤ 0`, base change, composition, projection formula, sums (ECD 22.4–22.12) |
| [S2](#layer-s2-the-exceptional-direct-image-for-eligible-maps-of-small-v-stacks) | `Rf_!` for eligible maps of small v-stacks | Proper-support left Kan extension, the hypercover construction and its independence, base change, colimits, composition, projection formula and their coherences (ECD 22.13–22.23) |
| [S3](#layer-s3-the-exceptional-inverse-image) | `Rf^!` as the right adjoint of `Rf_!` | Change of rings, Verdier duality, `Rf^!` of an internal `Hom`, composition, `Rf^! = f^*` for étale maps, exceptional base change, traces and twisted pullbacks (ECD 23.1–23.3, 23.16(i)) |
| [S4](#layer-s4-cohomologically-smooth-morphisms) | `ℓ`-cohomologically smooth maps | The strictly local criteria, the direct-sum criterion, the practical criterion, universal openness, the dualizing complex, composition and descent, smooth base change (ECD 23.4–23.17) |
| [S5](#layer-s5-examples-of-cohomologically-smooth-morphisms) | Examples | The perfectoid ball, Tate twists, profinite quotients, smooth analytic maps, `Spd ℚ_p`, the geometric-base criterion (ECD 24.1–24.6) |
| [S6](#layer-s6-biduality-finiteness-and-conservativity-over-a-geometric-point) | Duality over `Spa(C, O_C)` | Biduality, finiteness, `ℓ`-power-torsion coefficients, conservativity, the counterexamples over `Spa(C, C⁺)` (ECD 25.1–25.6) |

## Layer S0: Compactifiable and eligible morphisms

This layer fixes the classes of maps on which the exceptional operations are defined. Compactifiability is a factorisation condition; eligibility adds representability in locally spatial diamonds and local finiteness of `dim.trg`. All eight parts of ECD Proposition 22.3 are targets, part (vii) with the local-splitting hypothesis that its proof uses.

### S0.1 Compactifiable morphisms and the canonical factorisation

**Compactifiable morphisms**. A morphism `f : Y′ → Y` of v-stacks is *compactifiable* if there are a v-stack `Z`, an open immersion `j : Y′ → Z` and a partially proper morphism `g : Z → Y` with `f = g ∘ j`. Open immersions are those of D3: every pullback to a perfectoid space is representable by an open immersion. Partially proper morphisms are those of C4 (ECD Definition 18.4): separated, with unique lifts from `Spa(R, R°)` to `Spa(R, R⁺)` for perfectoid Tate `R` and open integrally closed `R⁺`. The definition imposes no quasicompactness, representability or dimension condition, and no smallness on `Y`; those enter only through the eligible classes of Section S0.4. The factorisation is not part of the data: by the next target there is a canonical one, through the canonical compactification. (ECD Definition 22.2 and the remark after it, p. 128.)

The API consists of: the constructor (if `j` is an open immersion and `g` is partially proper then `g ∘ j` is compactifiable); compactifiability of open immersions (take `g` the identity) and of partially proper maps (take `j` the identity; in particular proper maps are compactifiable); and separatedness of compactifiable maps (open immersions and partially proper maps are separated, and separated maps compose). Section S0.2 relates the predicate to the canonical compactification and supplies its base change, composition and the separated étale case.

**Checks.**

- For every v-stack `Y`, the identity of `Y` is compactifiable.
- For `C⁺ ⊊ O_C` with `Spa(C, O_C)` open in `Spa(C, C⁺)`, for example `C⁺` of finite rank greater than one, the open immersion `j : Spa(C, O_C) → Spa(C, C⁺)` is compactifiable, and its canonical compactification over `Spa(C, C⁺)` is the identity of `Spa(C, C⁺)`: every map `Spa(R, R°) → Spa(C, C⁺)` factors through `Spa(C, O_C)`. In rank two `j` is quasicompact and separated but not proper in D4.11's sense, because its image is the nonclosed open point; C4 uses that same properness test.
- At arbitrary valuation rank, `a ∈ O_C ∖ C⁺` defines a nonempty proper quasicompact rational open `U = {|a| ≤ 1}` in `Spa(C, C⁺)`. Its inclusion is compactifiable with canonical compactification the whole space: every map `Spa(R, R°) → Spa(C, C⁺)` factors through `U`. The norm point itself need not be open (Section S6.2).
- Let `B` be the perfectoid closed unit ball over `Spa(C, O_C)` and `Y′ = B ⊔_{B∖{0}} B` the ball with doubled origin. The map `Y′ → B` is étale and surjective but not separated, so it is not compactifiable.
- A proper map of v-stacks in `DiamondsAndVStacks §D4.11` is partially proper by C4.5 and compactifiable, with canonical compactification itself.

*Needs:* `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`; `DiamondsAndVStacks §D4.11`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Compactifiability through the canonical compactification**. Let `f : Y′ → Y` be a morphism of v-stacks. Then `f` is compactifiable if and only if `f` is separated and the natural map `j : Y′ → (Y′)‾^{/Y}` into its canonical compactification is an open immersion. In that case `f = f‾ ∘ j` with `j` an open immersion and `f‾` partially proper; this is the factorisation used to define `Rf_!` in Layer S1. (ECD Proposition 22.3(i) and its proof, p. 128.)

*Proof route.* If `j` is open, `f‾` is partially proper by C4 (ECD Corollary 18.8(i)), so `f = f‾ ∘ j` exhibits `f` as compactifiable. Conversely, given `Y′ → Z → Y` with the first map an open immersion and the second partially proper, `f` is separated, and the universal property of the canonical compactification (C4, ECD 18.6) extends `Y′ → Z` uniquely to an injection `h : (Y′)‾^{/Y} → Z` over `Y`. Then `j` is the pullback of `Y′ → Z` along `h`, and open immersions are stable under pullback (D3).

For any `C⁺ ⊊ O_C` and `a ∈ O_C ∖ C⁺`, the criterion holds for `j : {|a| ≤ 1} → Spa(C, C⁺)`, where the natural map into the canonical compactification is `j` itself. When the norm point `Spa(C, O_C)` is open, its inclusion is another such example. The criterion fails for the doubled-origin ball, which is not separated.

**Checks.**

- For the identity, the canonical map is the identity and the criterion holds.
- For `C⁺` of rank two, the generic-point inclusion is open and its canonical compactification is the whole two-point space.
- In the infinite-rank example of Section S6.2 the generic-point inclusion is not open, whereas `{|x₀⁻¹| ≤ 1}` is a proper rational open with canonical compactification the whole space.
- For the doubled-origin ball, separatedness fails and no compactifiable factorisation exists.

*Needs:* other targets of Section S0.1; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`.

### S0.2 Permanence of compactifiability

**Base change**. Let `f : Y′ → Y` and `Ỹ → Y` be morphisms of v-stacks, with pullback `f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ`. If `f` is compactifiable, so is `f̃`; the map `Ỹ → Y` is arbitrary. (ECD Proposition 22.3(ii) and its proof, p. 128.)

*Proof route.* Use the criterion of Section S0.1. Separatedness is stable under base change (D3), and the canonical compactification commutes with base change in `Y: (Ỹ′)‾^{/Ỹ} = (Y′)‾^{/Y} ×_Y Ỹ` (C4, from the formula `(Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y` in the proof of ECD Corollary 18.8). So `Ỹ′ → (Ỹ′)‾^{/Ỹ}` is a pullback of an open immersion.

**Checks.**

- Base change along the identity recovers the original compactifiable map.
- When `Spa(C, O_C)` is open in `Spa(C, C⁺)`, its inclusion and every pullback are compactifiable open immersions.
- For the infinite-rank `C⁺` of Section S6.2 whose norm point is not open, the inclusion `Spa(C, O_C) → Spa(C, C⁺)` is not compactifiable: its canonical compactification is `Spa(C, C⁺)`, and the criterion requires openness.

*Needs:* Section S0.1; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`.

**v-locality on the target**. Let `f : Y′ → Y` and `g : Ỹ → Y` be morphisms of v-stacks with pullback `f̃ : Ỹ′ → Ỹ`. If `g` is a surjective map of v-stacks and `f̃` is compactifiable, then `f` is compactifiable. Surjectivity is surjectivity of v-stacks (D4), not topological surjectivity. In particular compactifiability of a map to `Spa(C, C⁺)` can be tested after pullback to a strictly totally disconnected cover. (ECD Proposition 22.3(iii), p. 128.)

*Proof route.* By the criterion, `f̃` is separated and `Ỹ′ → (Ỹ′)‾^{/Ỹ}` is an open immersion. Separatedness and being an open immersion descend along surjections of v-stacks (D3, ECD Proposition 10.11), and since the canonical compactification commutes with base change, `Ỹ′ → (Ỹ′)‾^{/Ỹ}` is the pullback of `Y′ → (Y′)‾^{/Y}` along the surjection `(Y′)‾^{/Y} ×_Y Ỹ → (Y′)‾^{/Y}`.

*Needs:* Section S0.1; `DiamondsAndVStacks D3/v-local-nature-of-morphism-classes`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Composition**. If `Y₁ → Y₂` and `Y₂ → Y₃` are compactifiable morphisms of v-stacks, the composite `Y₁ → Y₃` is compactifiable. No representability is needed. (ECD Proposition 22.3(iv) and its proof, p. 128.)

*Proof route.* By v-locality we may assume `Y₃`, and hence every `Yᵢ`, separated. With `Y‾` the absolute canonical compactification and `(Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y` (C4), the natural map `Y₁ → (Y₁)‾^{/Y₃}` factors as `Y₁ → (Y₁)‾ ×_{(Y₂)‾} Y₂ → (Y₁)‾ ×_{(Y₂)‾} (Y₂)‾^{/Y₃} = (Y₁)‾ ×_{(Y₃)‾} Y₃`. The first map is the open immersion of the criterion for `Y₁ → Y₂`, the second is a pullback of the open immersion `Y₂ → (Y₂)‾^{/Y₃}`, and open immersions compose (D3). For example, the open unit disc `D ⊂ B` followed by `B → *` is compactifiable.

*Needs:* other targets of Section S0.2; Section S0.1; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`.

**Locality on the source for open covers**. Let `f : Y′ → Y` be separated and representable in locally spatial diamonds (D5), and suppose `Y′` is covered by open subfunctors `V ⊂ Y′` (open subsets of `|Y′|`, D4) with each `f|_V` compactifiable. Then `f` is compactifiable. Moreover, for every open `V ⊂ Y′` with `f|_V` compactifiable, the composite `V → Y′ → (Y′)‾^{/Y}` is an open immersion. (ECD Proposition 22.3(v) and its proof, pp. 128–129.)

*Proof route.* The second assertion implies the first, since then `Y′` is a union of open subfunctors of `(Y′)‾^{/Y}`. Replace `Y` by `(Y′)‾^{/Y}`, so that `Y′ → Y` is an injection, and work v-locally on `Y` (D3): `Y = Spa(A, A⁺)` strictly totally disconnected. By ECD Proposition 10.5 (D3: sub-v-sheaves of a totally disconnected space are filtered unions of pro-constructible generalizing subsets), `Y′` is a filtered union of open subspaces `Spa(A, (A⁺)′)` with `A⁺ ⊂ (A⁺)′`, and a quasicompact `V` lies in one of them. For `x ∈ V` choose a rational subset `U = {|fᵢ| ≤ |g|}` of `Y` with `x ∈ Spa(A, (A⁺)′) ∩ U ⊂ V`; then `U ⊂ V‾^{/Y}`, in which `V` is open, so `U ∩ V` is an open neighbourhood of `x` in `Y` contained in `Y′`. For example, a union of two compactifiable open subspaces of a separated locally spatial diamond over `Spa(C, O_C)` is compactifiable.

*Needs:* Section S0.1; `DiamondsAndVStacks D5/relative-representability`; `DiamondsAndVStacks D3/sub-v-sheaves-of-totally-disconnected-spaces`; `DiamondsAndVStacks D3/v-local-nature-of-morphism-classes`; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Separated étale maps**. Every separated étale morphism `f : Y′ → Y` of v-stacks (étale in the sense of D3) is compactifiable. (ECD Proposition 22.3(vi) and its proof, pp. 128–129.)

*Proof route.* By v-locality assume `Y = X` strictly totally disconnected; then `Y′ = X′` is a perfectoid space separated and étale over `X` (D3). By locality on the source assume `X′` quasicompact. Every étale cover of `X` splits (D1), so `X′` is a finite disjoint union of quasicompact open subspaces of `X`, and `X′ → ⊔ X → X` is an open immersion followed by a finite étale, hence proper, map. Finite étale maps and quasicompact open immersions are therefore compactifiable; the doubled-origin ball is étale but not separated and is excluded.

*Needs:* other targets of Section S0.2; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D3/etale-and-quasi-pro-etale-morphisms-of-stacks`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Cancellation**. Let `f : Y′ → Y` and `g : Y → Z` be morphisms of v-stacks with `g` separated. If `g ∘ f` is compactifiable, then `f` is compactifiable. The statement does not produce representability or dimension hypotheses on `f`; those are hypotheses of the eligible cancellation in Section S0.4. (ECD Proposition 22.3(viii) and its proof, pp. 128–129.)

*Proof route.* `f` is separated because `g ∘ f` and `g` are (D3). There are injections `Y′ → (Y′)‾^{/Y} → (Y′)‾^{/Z}`: the second is `(Y′)‾ ×_{Y‾} Y → (Y′)‾ ×_{Z‾} Z`, a pullback of `Y → Y‾^{/Z}`, which is injective because `g` is separated (C4). Their composite is an open immersion (the criterion for `g ∘ f`) and the first map is its pullback along the second. For example, an open subspace `Y′ ⊂ Y` of a compactifiable separated `Y → Z` has compactifiable inclusion.

*Needs:* Section S0.1; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

### S0.3 Locally split maps and descent of compactifiability along the source

**Locally split maps**. A morphism `g : Z → Y′` of v-stacks is *locally split* if it is separated and surjective as a map of v-stacks (D4) and, for every strictly totally disconnected perfectoid space `X` (D1) with a map `X → Y′`, every point of `|X|` has an open neighbourhood `U ⊂ X` over which `Z ×_{Y′} U → U` has a section. The condition is stored as a hypothesis wherever it is used. A v-cover need not be locally split, and ECD notes that the source-descent statement below has counterexamples without local splitting. Local splitting is retained as a separate hypothesis for smooth maps; no implication from cohomological smoothness is used. Since `X` is quasicompact and totally disconnected, the neighbourhoods can be refined to a finite partition of `X` into open and closed subsets carrying sections. (ECD Proposition 22.3(vii) and footnote 5, p. 128; Remark 23.14 and the paragraph after it, p. 150.)

The API consists of: separatedness and surjectivity of locally split maps; the constructors from a global section (a separated map with a global section `g ∘ s = id` is locally split) and from clopen sections (separated, surjective, and for every strictly totally disconnected `X → Y′` a finite partition of `X` into open and closed subsets over each of which `Z ×_{Y′} X` has a section); stability under base change along any `Y″ → Y′` and under composition; and the separated étale case (a separated étale surjection is locally split, because étale covers of strictly totally disconnected spaces split, D1).

**Checks.**

- The identity of any v-stack is locally split.
- For an open cover `{Uᵢ}` of a v-sheaf `Y′`, the map `⊔ᵢ Uᵢ → Y′` is locally split; it is separated, étale and surjective.
- For complete algebraically closed `C ⊊ C′`, the map `Spa(C′, O_{C′}) → Spa(C, O_C)` is a separated surjection of v-sheaves with no section over the strictly totally disconnected `Spa(C, O_C)`: a section would be a continuous `C`-algebra map `C′ → C`. So it is not locally split, although it is a v-cover.
- For a profinite group `K` and a strictly totally disconnected `X`, the projection `K × X → X` is locally split.

*Needs:* `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`; `DiamondsAndVStacks D4/spaces-and-surjectivity-for-small-v-stacks`.

**Descent of compactifiability along locally split maps**. Let `f : Y′ → Y` be separated and representable in locally spatial diamonds, and let `g : Z → Y′` be locally split with `f ∘ g` compactifiable. Then `f` is compactifiable. Consequently, for separated maps representable in locally spatial diamonds, compactifiability is étale local on the source. Without a condition on `g` the statement has counterexamples (ECD footnote 5), and whether universal openness of `g` suffices is not known. (ECD Proposition 22.3(vii) and its proof, pp. 128–129.)

*Proof route.* As in the open-cover case, replace `Y` by `(Y′)‾^{/Y}` and show that the injection `Y′ → Y` is an open immersion, v-locally on `Y` (D3): `Y = Spa(A, A⁺)` strictly totally disconnected and `Y′` a locally spatial diamond. By locality on the source assume `Y′` quasicompact; it is then strictly totally disconnected, as a quasicompact open of a sub-v-sheaf of `Y` (ECD 10.5 and 7.6). Now `g` has local sections over `Y′`, so `Y′` is covered by opens `V` over which `f|_V` factors through the compactifiable `f ∘ g`; cancellation (Section S0.2, with `g` separated) makes `f|_V` compactifiable, and the open-cover statement concludes. A separated étale surjection satisfies the hypothesis; the extension `Spa(C′, O_{C′}) → Spa(C, O_C)` does not, and no conclusion is drawn from it.

*Needs:* other targets of Section S0.3; Sections S0.1, S0.2; `DiamondsAndVStacks D3/v-local-nature-of-morphism-classes`; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D5/relative-representability`.

### S0.4 Eligible and spatial-eligible morphisms

**Eligible morphisms**. A morphism `f : Y′ → Y` of small v-stacks is *eligible* if `(a) f` is compactifiable, `(b) f` is representable in locally spatial diamonds (D5), and `(c)` locally `dim.trg f < ∞` (C8): after pullback to any spatial diamond `X → Y`, every quasicompact open subspace of `Y′ ×_Y X` has finite `dim.trg` over `X`, with a bound depending on the open. The three conditions are independent and all three are stored. They are exactly the hypotheses of ECD Definition 22.18, Theorem 23.1 and Proposition 23.3, so that with `nΛ = 0` for `n` prime to `p` they make `Rf_!` and `Rf^!` defined. Local finiteness is not a global bound; the globally bounded variant is the spatial-eligible class below. (ECD Convention 22.1, p. 127; Definition 22.18, p. 137; the meaning of locally `dim.trg f < ∞`, §22, p. 135.)

The API consists of the constructor and the three projections (compactifiable, representable in locally spatial diamonds, locally finite `dim.trg`), together with the following statements. Eligible maps are stable under base change along any map of small v-stacks: compactifiability by Section S0.2, representability because it is a condition on pullbacks, and `dim.trg` because pullback does not increase it (`DiamondEtaleCohomology §C8.17`). They are stable under composition (by Section S0.2, D5 and `DiamondEtaleCohomology §C8.18`). Separated étale maps are eligible: they are compactifiable, an étale map into a locally spatial diamond has locally spatial source by D5, and `dim.trg` of an étale map is `≤ 0` because completed residue fields agree (it is `0` for nonempty source and `−∞` for empty source). Spatial-eligible maps are eligible, and the restriction of an eligible map to an open subspace of the source is eligible.

**Checks.**

- The identity of a small v-stack is eligible.
- The structure map `B → *` of the absolute perfectoid ball (Section S5.1) is eligible, with `dim.trg` equal to `1`.
- For complete algebraically closed `C ⊂ C′` whose modified topological transcendence degree is infinite, `Spa(C′, O_{C′}) → Spa(C, O_C)` is qcqs and representable in spatial diamonds but not eligible: `dim.trg` is infinite on its only quasicompact open.
- The open unit disc `D ⊂ B` over `Spa(C, O_C)` maps eligibly to `Spa(C, O_C)`, although `D` is not quasicompact: `dim.trg` is `1` on each closed subdisc.

*Needs:* Sections S0.1, S0.2; `DiamondsAndVStacks D5/relative-representability`; `DiamondsAndVStacks D5/quasi-pro-etale-and-fibre-product-permanence`; `DiamondEtaleCohomology §C8.19`; `DiamondEtaleCohomology §C8.17`; `DiamondEtaleCohomology §C8.18`.

**Spatial-eligible morphisms**. A morphism `f : Y′ → Y` of small v-stacks is *spatial-eligible* if it is compactifiable, representable in spatial diamonds (D5: representable in locally spatial diamonds and qcqs) and `dim.trg f < ∞` globally (C8: one finite bound over all spatial test objects). These are the hypotheses of ECD Definition 22.4, Theorem 22.5 and Propositions 22.8–22.12. Thus spatial-eligible means eligible, quasicompact, quasiseparated and of globally bounded `dim.trg`. The canonical compactification of a spatial-eligible map need not be representable in spatial diamonds; that stronger hypothesis enters only in the `2·dim.trg` bound of Section S1.4. (ECD Definition 22.4, p. 129; Theorem 22.5, p. 130.)

The API consists of the constructor; the projections to eligibility, quasicompactness and quasiseparatedness, and the global bound `dim.trg f < ∞`; the characterisation as the eligible, qcqs maps of globally finite `dim.trg`; stability under base change and composition; and restriction to quasicompact opens: if `f` is eligible, `Y` is spatial and `V ⊂ Y′` is an open subspace quasicompact over `Y`, then `f|_V` is spatial-eligible. This last statement is the input of the left Kan extension of Layer S2.

**Checks.**

- The identity of a spatial diamond is spatial-eligible.
- For every nonempty affinoid perfectoid `X`, the relative ball `B × X → X` is spatial-eligible with `dim.trg 1`.
- The open unit disc `D → Spa(C, O_C)` is eligible but not spatial-eligible: it is not quasicompact.
- A quasicompact open immersion into a spatial diamond is spatial-eligible with `dim.trg ≤ 0`; the empty source has `dim.trg −∞`.

*Needs:* other targets of Section S0.4; Section S0.1; `DiamondsAndVStacks D5/relative-representability`; `DiamondEtaleCohomology §C8.16`; `DiamondEtaleCohomology §C8.17`; `DiamondEtaleCohomology §C8.18`.

**Cancellation in the eligible class**. Let `f : Y′ → Y` and `g : Y → Z` be morphisms of small v-stacks. If `g ∘ f` is eligible, `g` is separated, `f` is representable in locally spatial diamonds and locally `dim.trg f < ∞`, then `f` is eligible. The last two hypotheses do not follow from the others and are kept: only compactifiability cancels (ECD Proposition 22.3(viii), p. 128). The proof is cancellation of compactifiability (Section S0.2) together with the two hypotheses. For example, for an open subspace `Y′ ⊂ Y` of an eligible `Y → Z`, the inclusion is eligible.

*Needs:* other targets of Section S0.4; Section S0.2.

### Examples

- Over `Spa(C, C⁺)` with `C⁺ ⊊ O_C` and `Spa(C, O_C)` open (for example `C⁺` of rank two), the generic point `j : Spa(C, O_C) → Spa(C, C⁺)` is a compactifiable open immersion whose canonical compactification is the whole space; for `Λ ≠ 0` it is the basic example of a map with `Rj_! ≠ Rj_*` (Section S1.2) and of the failure of biduality (Section S6.2).
- For arbitrary `C⁺ ⊊ O_C`, the rational open `{|a| ≤ 1}` for `a ∈ O_C ∖ C⁺` gives the biduality counterexample of Section S6.2, including when the generic point is not open.
- The perfectoid ball `B → *` is spatial-eligible with `dim.trg 1`; the open unit disc `D → Spa(C, O_C)` is eligible but not spatial-eligible; the doubled-origin ball is étale but not compactifiable.
- Separated étale surjections are locally split; `Spa(C′, O_{C′}) → Spa(C, O_C)` is a v-cover that is not.

### Dependencies

`DiamondsAndVStacks` D1, D3, D4 (including D4.11's properness predicate), D5; `DiamondEtaleCohomology` C4 (partially proper maps, refinements of the imported properness predicate and the canonical compactification) and C8 `(dim.trg)`.

## Layer S1: The exceptional direct image for spatial-eligible maps

For a spatial-eligible map the canonical compactification is proper, and `Rf_!` is pushforward along it after extension by zero. This layer constructs that functor on all of `D_ét`. It shows independence of the chosen compactification, bounds its cohomological dimension by `3·dim.trg f`, and proves base change, composition, agreement with the étale `f_!`, the projection formula and commutation with sums (ECD 22.4–22.12). The dimension bound needs two inputs from ECD §§21–22: the fibre-dimension inequality for maps of diamonds and the classification of proper diamonds of `dim.trg ≤ 0`. Both are targets here.

### S1.1 Fibre dimension of maps of diamonds and of their compactifications

**The fibre-dimension bound**. Let `f : Y′ → Y` be a map of small v-stacks representable in locally spatial diamonds, with topological fibre dimension `dim f` (the supremum of `dim(f ×_Y X)` over locally spatial diamonds `X → Y`, equivalently over `X = Spa(C, C⁺)`; C8, ECD Definition 21.1 and Remark 21.8). Then:

1. `dim f ≤ dim.trg f`, the diamond form of ECD Lemma 21.6;
2. if `f` is separated, the structure map `f‾ : (Y′)‾^{/Y} → Y` of its canonical compactification is representable in diamonds after base change to diamonds (ECD Corollary 18.8(iii)), and `dim.trg f‾ = dim.trg f`. If `f‾` is moreover representable in locally spatial diamonds, then `dim f‾ ≤ dim.trg f`.

(ECD Lemma 21.6 and its proof, Definition 21.7 and Remark 21.8, p. 123; proof of Theorem 22.5, p. 130, which uses `dim (f‾)^{−1}(s) ≤ dim f‾ ≤ dim.trg f‾ = dim.trg f`.)

*Proof route.* (1) Reduce to `Y = Spa(C, C⁺)` and `Y′` a locally spatial diamond, and then, by locality of both sides, to `Y′` spatial. Choose a universally open quasi-pro-étale surjection `X̃ → Y′` from an affinoid perfectoid space (D5). Its underlying map is a spectral, open and surjective map, so generalizations lift along it, and every chain of specializations in `|Y′|` lifts to a chain of the same length in `|X̃|`; hence `dim f ≤ dim(X̃ → Y)`. `dim.trg` of the composite `X̃ → Y` equals `dim.trg f`, because quasi-pro-étale maps do not change completed algebraically closed residue fields (Definition 21.7 computes `dim.trg` on such charts, `DiamondEtaleCohomology §C8.16`). The analytic bound `DiamondEtaleCohomology §C8.15` (ECD Lemma 21.6) applied to the map of analytic adic spaces `X̃ → Spa(C, C⁺)` concludes. (2) Points of `(Y′)‾^{/Y}` over a point of `Spa(C, C⁺)` are given by `(Y′)‾^{/Y}(R, R⁺) = Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺)` (C4). So every point of the compactification is a specialization of a point of `Y′` with the same completed residue field, only the plus ring shrinking. Since `dim.trg` only depends on completed algebraically closed residue fields, the suprema agree, and (1) applies to `f‾`.

**Checks.**

- For the closed unit ball over `Spa(C, O_C)`, `dim f = dim.trg f = 1`. Its canonical compactification adds exactly one point, the rank-two specialization of the Gauss point towards `|T| > 1`, without raising `dim.trg`.
- Over `Spa(C, C⁺)` with `C⁺ ⊊ O_C`, the compactification also contains the points `T = a` over the closed point `s` for `a ∈ O_C ∖ C⁺`: they have `|T|_s = |a|_s > 1` and are absent from the ball. Distinct `a` give distinct points, so the boundary need not be a singleton; `dim.trg` remains `1`.
- For an empty source the canonical compactification is empty, and both geometric transcendence dimensions are `⊥`.

*Needs:* `DiamondEtaleCohomology §C8.2`; `DiamondEtaleCohomology §C8.20`; `DiamondEtaleCohomology §C8.16`; `DiamondEtaleCohomology §C8.15`; `DiamondsAndVStacks D5/universally-open-presentation`; `DiamondsAndVStacks D5/relative-representability`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.15`.

### S1.2 Definition of `Rf_!` and independence of the compactification

**The proper pushforward of a spatial-eligible map**. Let `f : Y′ → Y` be spatial-eligible and `Λ` with `nΛ = 0, n` prime to `p`. Write `f = f‾ ∘ j` for the canonical factorisation of Section S0.1; `f‾` is proper in the sense of D4.11 because `f` is quasicompact (C4.15, ECD Corollary 18.8(vi)). Define

```text
Rf_! := Rf‾_* ∘ j_! : D_ét(Y′, Λ) → D_ét(Y, Λ),
```

where `j_!` is the exact left adjoint of `j^*` for the open immersion `j` (C5, ECD Definition 19.1) and `Rf‾_*` is the right adjoint of `f‾^*` on the unbounded `D_ét` (C3, ECD Lemma 17.5). The compactification `(Y′)‾^{/Y}` is a small v-stack, in general not a spatial diamond, and its `D_ét` and `Rf‾_*` are the general ones of C2–C3. The construction is made on the stable `∞`-categorical enhancements, so that Layer S2 can left Kan extend it. (ECD Definition 22.4 and the paragraph before it, p. 129.)

The API consists of: the defining identification `Rf_! ≅ Rf‾_* ∘ j_!` for the canonical factorisation; the proper case (if `f` is proper, its canonical compactification is `f` itself and `Rf_! ≅ Rf_*`); arbitrary factorisations (for any `f = g ∘ j′` with `j′` an open immersion and `g` proper, `Rf_! ≅ Rg_* ∘ j′_!`); the étale case (for `f` quasicompact separated étale, `Rf_!` agrees with C5's `f_!`); amplitude (`Rf_!` carries `D_ét^{≥0}` to `D_ét^{≥0}` and, on objects in degree `0`, has cohomology only in degrees `≤ 3 dim.trg f`); and base change, composition, the projection formula and preservation of direct sums, which with the amplitude bound are the targets of Sections S1.4 and S1.5.

**Checks.**

- For `f` the identity of a spatial diamond, `Rf_! ≅ id`.
- Assume `Λ ≠ 0`. For `C⁺ ⊂ O_C` of rank `2` and `j : U = Spa(C, O_C) → Y = Spa(C, C⁺)`, the canonical compactification of `j` is `Y, Rj_!Λ = j_!Λ` and `RΓ(Y, Rj_!Λ) = 0`, whereas `RΓ(Y, Rj_*Λ) = Λ`. So `Rf_!` is not `Rf_*` for non-proper `f`.
- For finite étale `f, Rf_! ≅ Rf_* ≅ f_!`: pushforward along a finite étale map is exact and is C5's left adjoint.
- For `f : B × Spa(C, O_C) → Spa(C, O_C), Rⁱ f_!Λ = 0` for `i ≠ 2` and `R²f_!Λ(1) ≅ Λ`, compatibly with the classical computation of `ClassicalAdicEtaleCohomology`, Section 9.2, under the diamond comparison.

*Needs:* Sections S0.1, S0.4; `DiamondsAndVStacks §D4.11`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.4`; `DiamondEtaleCohomology §C2.5`.

**Independence of the compactification**. Let `f : Y′ → Y` be spatial-eligible and `f = g ∘ j′` with `j′ : Y′ → Z` an open immersion and `g : Z → Y` proper. There is a natural equivalence `Rg_* ∘ j′_! ≅ Rf_!` of functors `D_ét(Y′, Λ) → D_ét(Y, Λ)`, compatible with morphisms of such factorisations and transitive. In particular `Rf_! ≅ Rf_*` when `f` is proper, and `Rf_! ≅ f_!` when `f` is a quasicompact open immersion with proper compactification. This makes ECD's Definition 22.4 independent of the choice of compactification; it is the diamond counterpart of the classical independence in `ClassicalAdicEtaleCohomology`, Section 8.3. (ECD Definition 22.4, p. 129; Theorem 19.2, p. 108.)

*Proof route.* Since `g` is partially proper, the universal property of the canonical compactification (C4, ECD 18.6) gives a unique `h : (Y′)‾^{/Y} → Z` over `Y` with `h ∘ j = j′`, and `h` is proper. Moreover `h⁻¹(j′(Y′)) = j(Y′)`: a point of `(Y′)‾^{/Y}(R, R⁺) = Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺)` landing in the open `Y′ ⊂ Z` comes from the induced point of `Y′(R, R⁺)`. Proper base change (C5, ECD Theorem 19.2) for `h` and `j′` then gives `j′_! ≅ Rh_* j_!` on `D⁺_ét`. In the statement of 19.2 the pullback of the open `j : U ⊂ Y` along `f` must be read as `U′ = U ×_Y Y′`. Hence `Rg_* j′_! ≅ Rf‾_* j_!` on `D⁺_ét`. Both sides commute with Postnikov limits, since `Rg_*` and `Rf‾_*` are right adjoints, `j_!` and `j′_!` are `t`-exact and `D_ét` is left-complete (C2), so the equivalence extends to all of `D_ét`. For the finite étale map `⊔ X → X`, the canonical factorisation and `(id, f)` both give `Rf_* = f_!`.

*Needs:* other targets of Section S1.2; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.4`; `DiamondEtaleCohomology §C2.5`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`.

### S1.3 Proper diamonds of `dim.trg ≤ 0` and continuity

**Classification of proper diamonds of `dim.trg ≤ 0`**. Let `X` be a strictly totally disconnected perfectoid space. The functor `T ↦ X ×_{π₀X} T`, from compact Hausdorff spaces over `π₀X` to proper diamonds over `X` (D4.11, ECD Definition 18.1), is an equivalence onto the proper diamonds `f : Y → X` with `dim.trg f ≤ 0`. For `X = Spa(C, C⁺)` these are exactly the `T × Spa(C, C⁺), T` compact Hausdorff. (ECD Proposition 22.6 and its proof, p. 131.)

*Proof route.* Given `Y → X` proper of `dim.trg ≤ 0`, choose a quasi-pro-étale surjection `X̃ → Y` from a strictly totally disconnected space (D5). Its compactification `X̃‾^{/X} → X` is a proper map of strictly totally disconnected spaces inducing isomorphisms on completed residue fields, so it is `X ×_{π₀X} S` for a profinite `S → π₀X` (D1, topological classification of pro-étale maps). With `X_S = X ×_{π₀X} S → Y` surjective, `R = X_S ×_Y X_S` is proper and pro-étale over `X`, hence `X ×_{π₀X} S′` for a closed `S′ ⊂ S × S`; then `T = S/S′` is compact Hausdorff and `Y = X ×_{π₀X} T`. Full faithfulness is ECD Example 11.12 relative to `π₀X` (D4, compact Hausdorff diamonds). For example, `[0, 1] × Spa(C, O_C)` is a proper diamond of `dim.trg 0` whose underlying space is an interval, not a spectral space.

**Checks.**

- `T = ∅` gives the empty diamond. Transporting C8.16's `diamondDimTrg_empty` along the classification gives `dim.trg = ⊥ = −∞ ≤ 0`.
- For `X = Spa(C, O_C)` and `T = *`, the functor gives the identity, of `dim.trg 0`. More generally `T = π₀X` gives the identity of `X`, of `dim.trg 0` when `X` is nonempty.
- For `X = Spa(C, O_C)` and `T = [0, 1]`, the result is proper of `dim.trg 0` but not spatial.
- For `X = ∅`, the only compact Hausdorff space over `π₀X = ∅` is `∅`. The classification has the single diamond `∅ → ∅`, of `dim.trg ⊥`.

*Needs:* `DiamondsAndVStacks §D4.11`; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D1/topological-classification-of-pro-etale-maps`; `DiamondsAndVStacks D5/universally-open-presentation`; `DiamondsAndVStacks D4/compact-hausdorff-diamonds`; `DiamondsAndVStacks D3/locally-profinite-torsors`; `DiamondEtaleCohomology §C8.16`; `DiamondEtaleCohomology §C4.5`; `DiamondEtaleCohomology §C4.7`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Continuity along cofiltered limits of qcqs diamonds**. Let `Y` be a small v-sheaf, `Λ` any ring, `C ∈ D⁺_ét(Y, Λ)`, and `Zᵢ → Y` a cofiltered inverse system of qcqs diamonds with qcqs transition maps and limit `Z`. Then `RΓ(Z, C) = colimᵢ RΓ(Zᵢ, C)`. For spatial `Zᵢ` this is ECD Proposition 14.9 (C0); the qcqs case is the claim made in the proof of ECD Proposition 22.7 (p. 132).

*Proof route.* Write the `Zᵢ` compatibly as quotients of affinoid perfectoid spaces `Xᵢ` (D5, ECD Lemma 11.22). The equivalence relations `Rᵢ = Xᵢ ×_{Zᵢ} Xᵢ` and their iterated fibre products are spatial diamonds (D4, ECD Proposition 12.3). Apply spatial continuity (C0) termwise to the Čech nerves and conclude by v-descent of `RΓ` (C2), using that filtered colimits commute with the totalisations of uniformly bounded-below cosimplicial objects in each degree. For `Zᵢ = T × Spa(C, O_C), T` compact Hausdorff, cofiltered neighbourhoods of a point compute stalks, as used in the next target.

*Needs:* `DiamondsAndVStacks D5/limits-and-finite-stage-comparisons`; `DiamondsAndVStacks D4/small-v-sheaves-and-small-v-stacks`; `DiamondEtaleCohomology §C0.18`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.4`; `DiamondEtaleCohomology §C2.5`.

**Étale sheaves on proper diamonds of `dim.trg ≤ 0` are topological**. Let `X` be strictly totally disconnected and `f : Y → X` proper with `dim.trg f ≤ 0`, so that `Y = X ×_{π₀X} T`. Pullback along the morphism of topoi `t : Y_v → |Y|` induces an equivalence `D⁺(|Y|, Λ) ≃ D⁺_ét(Y, Λ)`, where `D⁺(|Y|, Λ)` is the bounded-below derived category of sheaves of `Λ`-modules on the topological space `|Y|` and `Λ` is any ring. (ECD Proposition 22.7 and its proof, pp. 131–132.)

*Proof route.* `t^*F` lies in `D⁺_ét` for every sheaf `F` on `|Y|` (C2). `F → Rt_*t^*F` is an isomorphism on stalks: neighbourhoods of `y ∈ |Y|` are cofinal with the qcqs `U ×_{π₀X} S` (`U ⊂ X` quasicompact open, `S` a closed neighbourhood in `T`), with cofiltered limit the generalizations `Spa(C(y), C(y)⁺)` of `y`. Continuity reduces the stalk to `RΓ(Spa(C(y), C(y)⁺), t^*F) = F_y`, a strictly local computation (`DiamondEtaleCohomology §C8.21`). The same cofinality shows that `t^*Rt_*G → G` is an isomorphism for every `G` in `D⁺_ét`. For `Y = [0, 1] × Spa(C, O_C), Hⁱ_ét(Y, Λ) = Hⁱ([0, 1], Λ)`, which is `Λ` for `i = 0` and `0` otherwise.

**Checks.**

- For `Y` empty both derived categories are zero.
- Over `X = ∅` the classification forces `Y = ∅`, so the comparison is the unique equivalence between zero categories.
- For `Y = Spa(C, O_C)`, both are the bounded-below derived category of `Λ`-modules.
- For `Y = [0, 1] × Spa(C, O_C)`, constant coefficients have `H⁰ = Λ` and `Hⁱ = 0` for `i > 0`.

*Needs:* other targets of Section S1.3; `DiamondEtaleCohomology §C8.21`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.4`; `DiamondEtaleCohomology §C2.5`.

### S1.4 Cohomological dimension of the compactified pushforward

**The `2·dim.trg` bound for a spatial compactification**. Let `f : Y′ → Y` be spatial-eligible with `d = dim.trg f < ∞, Λ` with `nΛ = 0` for `n` prime to `p`, and `f = f‾ ∘ j` the canonical factorisation. Assume that `f‾ : (Y′)‾^{/Y} → Y` is representable in spatial diamonds. Then `Rⁱ f‾_* A = 0` for every `A` in degree `0` and `i > 2 dim.trg f`. (ECD Theorem 22.5, the remark after it and the spatial case of its proof, p. 130.)

*Proof route.* By qcqs base change and proper base change, reduce to `Y = Spa(C, C⁺)`. Let `s` be its closed point, `U = Y ∖ {s}` and `V = (f‾)^{−1}(U)`. Proper base change makes `RΓ((Y′)‾^{/Y}, j_{V!}j_V^*A)` vanish, so assume `A` supported over `s`. Now `(Y′)‾^{/Y}` is a spatial diamond, and `dim((Y′)‾^{/Y} ∖ V) = dim (f‾)^{−1}(s) ≤ dim f‾ ≤ dim.trg f` (Section S1.1). For maximal points `y′`, which all lie in `Y′, cd_ℓ(y′) ≤ dim.trg f` for `ℓ ≠ p` (`DiamondEtaleCohomology §C8.41`, ECD 21.16). The spatial cohomological bound (`DiamondEtaleCohomology §C8.48`, ECD 21.11) gives vanishing above `d + d = 2d`. For `Λ ≠ 0` and the ball over `Spa(C, C⁺)`, the bound is `2`, which is sharp since `R²f_!Λ ≠ 0`.

**Checks.**

- For a nonempty identity map `d = 0` and all positive higher direct images vanish.
- For the ball and `Λ ≠ 0, d = 1` and `R²f_!Λ ≅ Λ(−1)` is nonzero, so the constant `2` is sharp.
- For `Λ = ℤ/1`, all cohomology vanishes; sharpness requires nonzero coefficients.

*Needs:* Sections S1.1, S1.2; `DiamondEtaleCohomology §C8.48`; `DiamondEtaleCohomology §C8.41`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C4.13`.

**The `3·dim.trg` bound**. Let `f : Y′ → Y` be spatial-eligible with `d = dim.trg f < ∞, Λ` with `nΛ = 0` for `n` prime to `p`, and `f = f‾ ∘ j` the canonical factorisation. Then `Rⁱ f‾_* A = 0` for every `A ∈ D_ét((Y′)‾^{/Y}, Λ)` concentrated in degree `0` and every `i > 3d`. Since `j_*` is exact (C8, ECD Remark 21.14, for the quasicompact separated quasi-pro-étale inclusion `j`), also `Rⁱ f_* A = 0` for `A ∈ D_ét(Y′, Λ)` in degree `0` and `i > 3d`. No spatiality of `(Y′)‾^{/Y}` is assumed. (ECD Theorem 22.5 and its proof, pp. 130–131.)

*Proof route.* `Rf‾_*` commutes with base change on `D⁺` for the qcqs `f‾` (C3, ECD 17.6), which reduces the claim to `Y = Spa(C, C⁺)` and to `Hⁱ((Y′)‾^{/Y}, A) = 0` for `i > 3d`. Let `s` be the closed point, `U = Y ∖ {s}` and `V = (f‾)^{−1}(U)`; ECD writes `f⁻¹(U)`, but the open subset of the compactification is meant. By proper base change (C5), `RΓ((Y′)‾^{/Y}, j_{V!}j_V^*A) = 0`, so one may assume `A` is supported over `s`. The maximal Hausdorff quotient `T` of `|(Y′)‾^{/Y}|` is also that of the spectral space `|Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)|`, since the two have the same maximal points. By ECD Propositions 13.12 and 13.9 (D5) the map `(Y′)‾^{/Y} → T` is representable in locally spatial diamonds, so `g : (Y′)‾^{/Y} → T × Y` is proper and representable in spatial diamonds with `dim.trg g = d` (Section S1.1). The preceding `2·dim.trg` bound gives `Rⁱ g_*A = 0` for `i > 2d`. For `h : T × Y → Y` and `B` in degree `0` trivial on `T × U, Hⁱ(T × Y, B) = Hⁱ(T, B|_{T×{s}})` by proper base change and the topological comparison of Section S1.3; by ECD 13.13 this is cohomology of the spectral space `|Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)|`, of dimension `≤ dim f ≤ d` (Section S1.1), and it vanishes above `d` by Scheiderer's bound (`DiamondEtaleCohomology §C8.44`). The Leray spectral sequence of `f‾ = h ∘ g` gives `2d + d = 3d`. For the ball over `Spa(C, O_C), d = 1` and the bound gives vanishing above degree `3`; for `Λ ≠ 0` the actual top degree of `Rf_!` is `2`, as the sharper bound predicts because the compactification of the ball is spatial.

**Checks.**

- For an empty source `d = −∞` and the compactified pushforward is zero in every degree.
- For a nonempty identity map `d = 0` and the bound gives vanishing in positive degrees.
- For the ball and `Λ ≠ 0, d = 1` but the top nonzero compact-support group is in degree `2`, below the general bound `3`.

*Needs:* other targets of Section S1.4; Sections S1.1, S1.2, S1.3; `DiamondsAndVStacks D5/reduction-to-spatial-and-hausdorff-cohomology`; `DiamondsAndVStacks D5/berkovich-quotient`; `DiamondEtaleCohomology §C8.44`; `DiamondEtaleCohomology §C8.2`; `DiamondEtaleCohomology §C8.22`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.15`.

### S1.5 Base change, composition, étale agreement, projection formula and sums

In this section `f : Y′ → Y` is spatial-eligible and `Λ` has `nΛ = 0` for some `n` prime to `p`.

**Base change**. For any map `g : Ỹ → Y` of small v-stacks, with pullbacks `f̃ : Ỹ′ → Ỹ` and `g′ : Ỹ′ → Y′`, there is a natural base-change equivalence `g^*Rf_! ≃ Rf̃_!g′^*` of functors `D_ét(Y′, Λ) → D_ét(Ỹ, Λ)` on the whole unbounded category. The canonical factorisation is compatible with base change (C4), `j_!` commutes with base change (C5), and `Rf‾_*` commutes with base change on `D⁺` (C3, ECD 17.6); because `Rf‾_*` has finite cohomological dimension (Section S1.4), the unbounded version applies. Pulling back the ball `B × X → X` along a point `Spa(C, C⁺) → X` computes the stalk of `R²f_!Λ` as `H²_c` of the ball over `Spa(C, C⁺)`. (ECD Proposition 22.8 and its proof, p. 132.)

*Needs:* Sections S1.2, S1.4; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C4.15`.

**Composition**. For spatial-eligible `g : Y″ → Y′` and `f : Y′ → Y` there is a natural equivalence `Rf_! ∘ Rg_! ≃ R(f ∘ g)_!` of functors `D_ét(Y″, Λ) → D_ét(Y, Λ)`. Factor `Y″ →^{j₁} (Y″)‾^{/Y′} →^{j₂} (Y″)‾^{/Y} →^{g₂} (Y′)‾^{/Y} →^{f₁} Y`, with `g₁ : (Y″)‾^{/Y′} → Y′` and `j₃ : Y′ → (Y′)‾^{/Y}`. Then `Rf_!Rg_! = Rf₁_* j₃! Rg₁_* j₁!` and `R(f ∘ g)_! = Rf₁_* Rg₂_* j₂! j₁!`. Proper base change (C5) for the proper map `(Y″)‾^{/Y} → (Y′)‾^{/Y}` and the open `j₃`, made unbounded by the cohomological-dimension bound for `(Y″)‾^{/Y′} → Y′`, gives `j₃! Rg₁_* = Rg₂_* j₂!`. For an open immersion followed by a finite étale map the formula reduces to `j_!` followed by `f_*`. (ECD Proposition 22.9 and its proof, pp. 132–133.)

*Needs:* Sections S1.2, S1.4; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C4.15`.

**Agreement with the étale extension by zero**. If `f` is moreover quasicompact, separated and étale (so spatial-eligible with `dim.trg ≤ 0`), C5's `f_!` (the left adjoint of `f^*`, ECD Definition 19.1) agrees with `Rf_!` via a natural transformation `f_! → Rf_!`. Construct it as adjoint to `id → f^*Rf_!`, using the base change `f^*Rf_! = Rπ₂!π₁^*` for the projections `π₁, π₂ : Y′ ×_Y Y′ → Y′` and `id = Rπ₂!RΔ!Δ^*π₁^* → Rπ₂!π₁^*`, the diagonal `Δ` being open and closed. Both sides commute with base change, which reduces to `Y` strictly totally disconnected; there `Y′` is a disjoint union of quasicompact opens of `Y` (Section S0.2) and the claim is clear for an open immersion. For a finite étale cover of degree `d` the comparison is the identification of `f_!` with `f_*`; no trace enters. (ECD Proposition 22.10 and its proof, p. 133.)

**Checks.**

- For the empty étale source both functors are zero, and `dim.trg` is `−∞`.
- For an open immersion this is extension by zero, whose stalks vanish on the complement.
- For a two-sheeted finite étale map both functors are the sum of the two fibres; the comparison introduces no averaging factor.

*Needs:* Sections S0.2, S1.2; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.3`.

**Direct sums**. For `f` a spatial-eligible map of small v-sheaves and every family `(Aᵢ)_{i∈I}` in `D_ét(Y′, Λ)`, the natural map `⊕ᵢ Rf_!Aᵢ → Rf_!(⊕ᵢ Aᵢ)` is an isomorphism. By base change reduce to `Y = Spa(C, C⁺)` and global sections. In a fixed degree both sides depend only on truncations `τ^{≥ d − 3 dim.trg f}Aᵢ` (Section S1.4), so the `Aᵢ` may be taken uniformly bounded below. Then the claim is that `RΓ((Y′)‾^{/Y}, −)` commutes with direct sums on `D^{≥−n}_ét`. These are v-cohomology groups of small sheaves, and the `κ`-small v-topos of the qcqs v-sheaf `(Y′)‾^{/Y}` is coherent, so SGA 4 VI 5.2 applies (D0). For the ball over `Spa(C, O_C), H²_c(B, ⊕_ℕ Λ) = ⊕_ℕ Λ(−1)`. (ECD Proposition 22.12 and its proof, pp. 134–135.)

**Checks.**

- For the identity the comparison is the identity on every coproduct.
- For the ball `H²_c(B, ⊕_ℕ Λ) ≅ ⊕_ℕ Λ(−1)`.
- For an empty source both sides of the comparison vanish, including for an empty indexing family.

*Needs:* Sections S1.2, S1.4; `DiamondsAndVStacks D0/filtered-colimits-and-cohomology-on-coherent-sites`; `AdicSpacesPartII §R0.19.10 (quasicompact-objects-in-a-topos)`.

**Projection formula**. For `f` a spatial-eligible map of small v-sheaves (as ECD states it), there is an isomorphism `Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A)`, functorial in `B ∈ D_ét(Y′, Λ)` on the source and `A ∈ D_ét(Y, Λ)` on the base. The extension to small v-stacks is part of the general projection formula of Section S2.4. (ECD Proposition 22.11 and its proof, pp. 133–134.)

*Proof route.* For an open immersion `j`, the map `j_!(B ⊗ j^*A) → j_!B ⊗ A` adjoint to `B ⊗ j^*A = j^*(j_!B ⊗ A)` is an isomorphism: reduce to `Y` strictly totally disconnected, where `D_ét(Y) = D(|Y|)` (C2), and check on the closed complement `i`, where `i^*(j_!B ⊗ A) = 0`. In general compose with `Rf‾_*j_!B ⊗ A → Rf‾_*(j_!B ⊗ f‾^*A)`. To test the result, reduce by C3 to `Y = Spa(C, C⁺)` and global sections. For `A = j_{U!}A_U` with `U = Y ∖ {s}` both sides vanish by proper base change, so `A` may be taken concentrated at `s` and then constant. A constant complex is a filtered colimit of perfect complexes; the perfect case is clear, and colimits are handled by the preceding coproduct-preservation target. With `B = Λ` and `f` the ball over `Spa(C, O_C), H²_c(B, f^*M) ≅ M(−1)` for every `Λ`-module `M`.

**Checks.**

- For the projection of two disjoint copies of `X`, the formula distributes tensor product over a two-term direct sum.
- For the rank-two generic-point inclusion, restriction to the closed point makes both sides zero.
- For the ball, `Λ = ℤ/ℓ²` and `M = 𝔽_ℓ` with `ℓ ≠ p`, the formula gives `H²_c(B, f^*M) ≅ M(−1)`, although `M` is not flat over `Λ`.

*Needs:* other targets of Section S1.5; Section S1.2; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.4`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C5.9`.

### Examples

- The generic point `j : Spa(C, O_C) → Spa(C, C⁺)` for `C⁺` of rank `2: Rj_!Λ = j_!Λ` has vanishing cohomology on `Spa(C, C⁺)`, whereas `Rj_*Λ = Λ`.
- The relative ball `B × Spa(C, O_C) → Spa(C, O_C): Rf_!Λ = Λ(−1)[−2]`, its compactification is spatial and, for `Λ ≠ 0`, the `2·dim.trg` bound is sharp.
- `[0, 1] × Spa(C, O_C)`: a proper diamond of `dim.trg 0` whose étale cohomology is that of the interval.

### Dependencies

Layer S0; `DiamondsAndVStacks` D0, D1, D3, D4, D5; `DiamondEtaleCohomology` C0, C2, C3, C4, C5, C8; `ClassicalAdicEtaleCohomology`, Sections 8.3 and 9.2 (comparison only).

## Layer S2: The exceptional direct image for eligible maps of small v-stacks

`Rf_!` is extended from spatial-eligible maps to all eligible maps in two steps. First, over a quasiseparated locally spatial base, it is the left Kan extension of `Rf‾_* ∘ j_!` from the sheaves with proper support over the base (ECD 22.13–22.15). Second, over a small v-stack, it is obtained by running that construction over a simplicial hypercover by quasiseparated locally spatial diamonds, as a functor of coCartesian fibrations over `Δ`, and passing to coCartesian sections (ECD 22.16–22.18). All constructions take place in stable `∞`-categories: homotopy categories do not satisfy descent, so choices of representing complexes do not suffice. The layer ends with base change, colimits, composition, agreement with the étale `f_!`, the projection formula and the pasting coherences (ECD 22.19–22.23).

### S2.1 Hypercovers by quasiseparated locally spatial diamonds

**Existence and refinement of hypercovers**. Let `Y` be a small v-stack.

1. There is an augmented simplicial v-hypercover `Y• → Y` in which every `Y_n` is a disjoint union of strictly totally disconnected perfectoid spaces. Here a hypercover is in the sense of `EnhancedDerivedSheaves §E2.6`: `Y₀ → Y` and every matching map `Y_n → (cosk_{n−1} Y•)_n` are surjective maps of v-stacks. Each `Y_n` is then a quasiseparated locally spatial diamond and each `Y_n → Y` is `0`-truncated.
2. If `f : Y′ → Y` is separated and representable in locally spatial diamonds, then `Y′ ×_Y Y• → Y′` is a hypercover of `Y′` by quasiseparated locally spatial diamonds.
3. Any two such hypercovers `Y• → Y` and `Ỹ• → Y` admit a common refinement `Z• → Y` of the same kind, with maps of augmented simplicial objects `Z• → Y•` and `Z• → Ỹ•` over `Y`. For every map `g : Ỹ → Y` of small v-stacks there are hypercovers `Ỹ• → Ỹ` and `Y• → Y` of this kind and a map `g• : Ỹ• → Y•` over `g`.

(ECD Lemma 7.18, p. 36; Remark 17.4, p. 97; proof of Definition/Proposition 19.1, p. 108; §22 before Lemma 22.16, p. 136; Definition 22.18 and the paragraph after it, p. 137.)

*Proof route.* Every small v-stack receives a surjection from a perfectoid space (D4), and every perfectoid space receives a surjection from a disjoint union of strictly totally disconnected spaces (D1, ECD Lemma 7.18). Build `Y•` inductively: given the `(n−1)`-truncated augmented object, the coskeleton term `(cosk_{n−1} Y•)_n` is a small v-stack, so it is covered by such a disjoint union, and this cover is `Y_n` with its degeneracies added. Disjoint unions of strictly totally disconnected spaces are quasiseparated and locally spatial (D5). For (2), base change preserves surjections and matching maps, and `Y′ ×_Y Y_n` is a locally spatial diamond, quasiseparated because `f` is separated. For (3), the termwise fibre product `Y• ×_Y Ỹ•` is a hypercover of `Y` by small v-sheaves; refine it by the inductive construction. Choosing `Ỹ•` over `g^*Y•` gives `g•`. For `Y` a quasiseparated locally spatial diamond, the constant simplicial object is a hypercover by quasiseparated locally spatial diamonds, the broader class used in the construction of `Rf_!`. It has the stronger shape of (1) only when `Y` itself is a disjoint union of strictly totally disconnected spaces. Otherwise refine it by the construction above.

**Checks.**

- For `Y` empty, the constant empty simplicial object is a hypercover of the shape in (1).
- For `Y` strictly totally disconnected, its constant simplicial object has that shape, and the identity is a common refinement of this hypercover with itself.
- For the perfectoid ball over `Spa(C, O_C)`, the constant simplicial object is a hypercover in the broader class, but its terms are not disjoint unions of strictly totally disconnected spaces: the ball has a connected component with more than one rank-one point. `A` refinement is needed for (1).

*Needs:* `EnhancedDerivedSheaves §E2.6`; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D1/universally-open-std-cover`; `DiamondsAndVStacks D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks D4/spaces-and-surjectivity-for-small-v-stacks`; `DiamondsAndVStacks D5/spatial-diamond`; `DiamondsAndVStacks D5/relative-representability`.

### S2.2 Proper support and the left Kan extension over locally spatial bases

**Sheaves with proper support**. Let `f : Y′ → Y` be an eligible map of quasiseparated locally spatial diamonds, with canonical factorisation `j : Y′ → (Y′)‾^{/Y}` and partially proper `f‾`, and let `Λ` have `nΛ = 0` for some `n` prime to `p`. `D_ét,prop/Y(Y′, Λ)` is the full `∞`-subcategory of `D_ét(Y′, Λ)` of objects `A` with `A ≃ j_{V!}j_V^*A` for some open subspace `j_V : V → Y′` that is quasicompact over `Y`. For such `A` and `V, j_!A` is supported on the closure of `V` in `(Y′)‾^{/Y}`, which is proper over `Y`. Every `A ∈ D_ét(Y′, Λ)` is the filtered colimit of the `A_V = j_{V!}j_V^*A` over the filtered poset of such `V`, since `Y′` is the union of them. (ECD Definition 22.13, p. 135.)

The API consists of: the defining membership condition; extensions by zero (for `V ⊂ Y′` open and quasicompact over `Y` and `B ∈ D_ét(V, Λ), j_{V!}B` has proper support); the colimit formula (`A` is the filtered colimit of the `A_V`); stability under pullback along a map `Ỹ → Y` of quasiseparated locally spatial diamonds, which carries `D_ét,prop/Y(Y′, Λ)` into `D_ét,prop/Ỹ(Ỹ′, Λ)` because quasicompactness over `Y` and `j_{V!}` are stable under base change (C5); and the quasicompact case (if `f` is quasicompact the subcategory is everything).

**Checks.**

- If `Y′ → Y` is quasicompact, every object of `D_ét(Y′, Λ)` has proper support (take `V = Y′`).
- For the open unit disc `D → Spa(C, O_C)` and the closed subdisc `V` of radius `|ϖ|, j_{V!}Λ` has proper support.
- Assume `Λ ≠ 0`. The constant sheaf `Λ` on the open unit disc `D` over `Spa(C, O_C)` does not have proper support: `Λ ≃ j_{V!}j_V^*Λ` fails for every quasicompact `V ⊊ D`, since its stalks off `V` are nonzero.

*Needs:* Section S0.4; `DiamondsAndVStacks D5/spatial-diamond`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.10`.

**`Rf_!` over a quasiseparated locally spatial base**. Let `f : Y′ → Y` be an eligible map of quasiseparated locally spatial diamonds and `Λ` with `nΛ = 0, n` prime to `p`. Define `Rf_! : 𝒟_ét(Y′, Λ) → 𝒟_ét(Y, Λ)` as the left Kan extension, along the full inclusion, of `Rf‾_* ∘ j_! : 𝒟_ét,prop/Y(Y′, Λ) → 𝒟_ét(Y, Λ)` (E3, HTT 4.3.2.14). It is a functor of stable `∞`-categories, and the left Kan extension is not replaced by a choice of representing complexes. Its universal property is part of the definition: natural transformations `Rf_! → H` correspond to natural transformations `Rf‾_* j_! → H` restricted to proper-support objects, for every functor `H` on `𝒟_ét(Y′, Λ)`. This fixes the extension and all comparisons up to contractible choice. On `D_ét,prop/Y` it is `Rf‾_* j_!`, and for `A_V = j_{V!}j_V^*A` one has `Rf_!A_V = R(f|_V)_!(j_V^*A)`. Here `R(f|_V)_!` is computed by Layer S1 after restricting `Y` to spatial quasicompact opens `W: V ×_Y W` is quasicompact, and the eligible restriction over `W` has a finite global `dim.trg` bound. Quasicompactness of `V → Y` alone does not make `f|_V` spatial-eligible when `Y` is not quasicompact. (ECD Definition 22.13 and the paragraph after it, p. 135.)

*Proof route.* For `A = j_{V!}j_V^*A, Rf‾_*j_!A = Rf‾_*g_*j′_{V!}(j_V^*A) = R(f|_V)_!(j_V^*A)`, with `g : V‾^{/Y} → (Y′)‾^{/Y}` the closed immersion and `j′_V : V → V‾^{/Y}`. Compare with Layer S1 on spatial quasicompact opens `W ⊂ Y`, where locally finite `dim.trg` gives a finite bound, and glue the local comparisons and their base-change identifications by C2; no uniform bound over a non-quasicompact `Y` is used. `D_ét(Y, Λ)` is presentable (C2), so the left Kan extension exists (E3) and restricts to `Rf‾_*j_!` on the subcategory.

The API consists of: restriction to proper-support objects (there `Rf_! ≅ Rf‾_* ∘ j_!`, since the unit of a left Kan extension along a full inclusion is an equivalence); the filtered-support formula below; agreement with Layer S1 when `f` is spatial-eligible (for a relatively quasicompact eligible `f` over a non-quasicompact base the comparison is made over spatial quasicompact opens of the base); preservation of colimits; base change; and the universal property of the left Kan extension.

**Checks.**

- If `f` is spatial-eligible, the construction agrees with `Rf‾_* ∘ j_!` of Layer S1.
- For the open unit disc `f : D → Spa(C, O_C), R²f_!Λ(1) ≅ Λ` and `Rⁱ f_!Λ = 0` for `i ≠ 2`: it is the colimit over closed subdiscs, with isomorphic transition maps.
- Assume `Λ ≠ 0`. For the open unit disc, `Rf_*Λ = Λ` in degree `0` (the disc has the cohomology of a point, `ClassicalAdicEtaleCohomology`, Section 10.4), while `Rf_!Λ = Λ(−1)[−2]`. So the left Kan extension is not `Rf‾_*` applied to `j_!` of all objects.

*Needs:* other targets of Section S2.2; Sections S0.4, S1.2; `EnhancedDerivedSheaves §E3.1`; `EnhancedDerivedSheaves §E3.4`; `EnhancedDerivedSheaves §E3.2`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.10`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.15`.

**The filtered-support formula**. For `f : Y′ → Y` eligible between quasiseparated locally spatial diamonds and `A ∈ D_ét(Y′, Λ)`, the natural map `colim_V R(f|_V)_!(j_V^*A) → Rf_!A` is an equivalence, the colimit running over the filtered poset of opens `V ⊂ Y′` quasicompact over `Y`, and `R(f|_V)_!(j_V^*A) = Rf‾_*j_!(j_{V!}j_V^*A)`. The proof is the pointwise formula for left Kan extensions along full inclusions (E3, HTT 4.3.2.2): `Rf_!A` is the colimit over the slice of proper-support objects over `A`. In that slice the objects `A_V → A` are cofinal, since every `B → A` with `B` of proper support factors through some `A_V`, and they form a filtered diagram. For a disjoint union `Y′ = ⊔ᵢ Vᵢ` of opens quasicompact over `Y, Rf_!A = ⊕ᵢ R(f|_{Vᵢ})_!(A|_{Vᵢ})`. (ECD Definition 22.13, p. 135.)

*Needs:* other targets of Section S2.2; `EnhancedDerivedSheaves §E3.1`.

**Colimits over a locally spatial base**. For `f : Y′ → Y` eligible between quasiseparated locally spatial diamonds, `Rf_!` commutes with all direct sums, equivalently with all colimits (E3, HA 1.4.4.1(2)). Write each `Aᵢ` as `colim_V A_{i,V}`; then `Rf_!(⊕ᵢAᵢ) = colim_V ⊕ᵢ R(f|_V)_!j_V^*Aᵢ` by the sum statement of Section S1.5, applied after restricting `Y` to spatial quasicompact opens. Exchange the colimits and apply the filtered-support formula to each `Aᵢ`. For example, `Rf_!` of a countable direct sum of skyscrapers on the open disc is the direct sum of their compactly supported cohomologies. (ECD Proposition 22.14 and its proof, pp. 135–136.)

*Needs:* other targets of Section S2.2; Section S1.5; `EnhancedDerivedSheaves §E3.1`; `EnhancedDerivedSheaves §E3.2`.

**Base change over locally spatial bases**. Let `f : Y′ → Y` be eligible between quasiseparated locally spatial diamonds and `g : Ỹ → Y` a map of quasiseparated locally spatial diamonds, with pullbacks `f̃, g′`. There is a natural base-change equivalence `g^*Rf_! ≃ Rf̃_!g′^*`. The base `Ỹ` must be quasiseparated, as the construction of `Rf̃_!` requires; ECD states the result for any map of locally spatial diamonds, which is too general for its own definition. (ECD Proposition 22.15 and its proof, p. 136.)

*Proof route.* `j_!` commutes with base change (C5) and `Rf‾_*` has a base-change map (C3). Together they give `g^*Rf‾_*j_! → Rf̃‾_*j̃_!g′^*` on proper-support objects and, by the universal property of the left Kan extension, `g^*Rf_! → Rf̃_!g′^*`. On proper-support objects this is an equivalence by Section S1.5, applied locally on spatial quasicompact opens of the base after refining the base covers. Both sides commute with the filtered colimit `A = colim A_V`.

*Needs:* other targets of Section S2.2; Section S1.2; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`.

### S2.3 The hypercover construction

**The coherent support diagram over a hypercover**. Let `f : Y′ → Y` be an eligible map of small v-stacks and `Λ` with `nΛ = 0, n` prime to `p`. Let `Y• → Y` be a hypercover by quasiseparated locally spatial diamonds as in Section S2.1, with its augmentation, face and degeneracy maps and v-cover matching maps, and let `Y′• = Y′ ×_Y Y•`. Construct, as functors over `Δ` of `∞`-categories:

1. the coCartesian fibrations over `Δ` classified by `i ↦ 𝒟_ét(Y′ᵢ, Λ), i ↦ 𝒟_ét((Y′ᵢ)‾^{/Yᵢ}, Λ)` and `i ↦ 𝒟_ét(Yᵢ, Λ)` with pullback functors. These use the coherent simplicial enhanced v-derived categories and pullbacks of `DiamondEtaleCohomology §C2.9`, the étale full subcategories of §C2.12 and restricted straightening of `EnhancedDerivedSheaves §E0.7`. The support-diagram target includes their compatibility with face and degeneracy maps; the ringed-diagram contract of `EnhancedDerivedSheaves §E3.4` over small posets supplies its poset restrictions, rather than the entire simplicial diagram;
2. the full sub-fibration `𝒟_ét,prop/Y•(Y′•, Λ)⁰` with fibres the proper-support subcategories of Section S2.2. It is again coCartesian, because pullback preserves proper support;
3. the fibrewise extension by zero `j•!`, fully faithful and left adjoint to `j•^*`, and the relative right adjoint `Rf‾•_*` of `f‾•^*`, fibrewise `Rf‾ᵢ_*`;
4. `Rf•!⁰ : 𝒟_ét(Y′•, Λ)⁰ → 𝒟_ét(Y•, Λ)⁰`, the left Kan extension of `Rf‾•_* j•!` along the inclusion of the support sub-fibration (HTT 4.3.2.14), with its universal property taken in functors over `Δ`.

(ECD §22, the construction before Lemma 22.16, pp. 136–137.)

The API consists of: the fibre over `[i]`, which is the proper-support category for `Y′ᵢ → Yᵢ`; the coCartesian property (the support sub-fibration is coCartesian over `Δ` and its inclusion preserves coCartesian edges); the fibrewise descriptions of `j•!` (fibrewise `jᵢ!`, fully faithful and left adjoint to `j•^*`) and of `Rf‾•_*` (fibrewise `Rf‾ᵢ_*`); the fibre formula and preservation of coCartesian edges for `Rf•!⁰` (the next two targets); and refinement (a map of hypercovers over `Y` induces a map of diagrams compatible with `Rf•!⁰`).

**Checks.**

- For the constant hypercover of a quasiseparated locally spatial `Y`, the coefficient diagram is constant with fibre `D_ét(Y′, Λ)`, its support subdiagram has fibre `D_ét,prop/Y(Y′, Λ)`, and `Rf•!⁰` is the functor of Section S2.2 in every degree; the two fibres coincide if `f` is quasicompact.
- If `f` is quasicompact, every fibre of the support sub-fibration is the whole fibre and `Rf•!⁰` is fibrewise `Rf‾ᵢ_*jᵢ!`.
- For the open unit disc over `Spa(C, O_C)` and `Λ ≠ 0`, the constant object lies outside every proper-support fibre of the constant hypercover, whereas extension by zero from a closed subdisc lies inside.
- Choosing objects fibrewise in homotopy categories does not define a functor to coCartesian sections: the diagram `i ↦ Ho 𝒟_ét(Yᵢ, Λ)` does not determine `D_ét(Y, Λ)`, because descent fails for homotopy categories. The construction must be made in `Cat_∞`.

*Needs:* Sections S0.4, S2.1, S2.2; `EnhancedDerivedSheaves §E0.1 and §E0.4`; `EnhancedDerivedSheaves §E0.7`; `EnhancedDerivedSheaves §E2.6`; `EnhancedDerivedSheaves §E3.1`; `EnhancedDerivedSheaves §E3.4`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.10`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.2`.

**The fibres of the construction**. In this situation, `Rf•!⁰` is given in the fibre over `[i] ∈ Δ` by the functor `Rfᵢ! : D_ét(Y′ᵢ, Λ) → D_ét(Yᵢ, Λ)` of Section S2.2. Because the support sub-fibration is coCartesian, for `A` in the fibre over `[i]` the inclusion of the fibrewise slice of proper-support objects over `A` into the total slice is cofinal; the index category is filtered, and by HTT 4.3.1.7 (E3) the colimits computing the two left Kan extensions agree. For the constant hypercover the statement is a tautology. (ECD Lemma 22.16 and its proof, p. 137.)

*Needs:* other targets of Section S2.3; Section S2.2; `EnhancedDerivedSheaves §E3.1`.

**Preservation of coCartesian edges**. `Rf•!⁰` sends coCartesian edges to coCartesian edges; hence it restricts to coCartesian sections, `D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ)`. A coCartesian edge over `[i] → [k]` is `A → α^*A`, and its image is `Rfᵢ!A → Rf_k!α′^*A` by the previous target. This is the base-change map, an equivalence by Section S2.2 because the `Yᵢ` are quasiseparated locally spatial diamonds. (ECD Lemma 22.17 and its proof, p. 137.)

*Needs:* other targets of Section S2.3; Section S2.2.

**The exceptional direct image for small v-stacks**. Let `f : Y′ → Y` be an eligible map of small v-stacks and `Λ` with `nΛ = 0, n` prime to `p`. Choose a hypercover `Y• → Y` by quasiseparated locally spatial diamonds (Section S2.1) and define `Rf_!` as the composite

```text
𝒟_ét(Y′, Λ) ≃ 𝒟_ét,cart(Y′•, Λ) → 𝒟_ét,cart(Y•, Λ) ≃ 𝒟_ét(Y, Λ)
```

of hyperdescent (C2, ECD Proposition 17.3) and the restriction of `Rf•!⁰` to coCartesian sections. ECD's `Rf_!` is its homotopy-category functor. It does not depend on the hypercover (next target), and it agrees with Section S2.2 when `Y` is a quasiseparated locally spatial diamond and with Layer S1 when `f` is spatial-eligible. The domain is the eligible class: for maps of Artin v-stacks not representable in locally spatial diamonds the exceptional operations are those of `VStackSheavesAndLisseCategories`. (ECD §22 after Lemma 22.17 and Definition 22.18, p. 137.)

The API consists of: agreement with the constructions of Sections S1.2 and S2.2; independence of the hypercover; base change; preservation of colimits; composition; the identity (`R(id)_! ≃ id`, compatibly with the composition equivalence); the étale case (for separated étale `f, Rf_! ≅` C5's `f_!`); and the projection formula. All but the identity statement are targets of this layer.

**Checks.**

- `R(id_Y)_! ≅ id` for every small v-stack `Y`.
- For an open immersion `j : U → Y` of small v-stacks, `Rj_!` is C5's extension by zero `j_!`.
- For a nontrivial profinite group `K` acting trivially, `[*/K] → *` is not representable in locally spatial diamonds (its fibre over a point is not a diamond), so it is outside the domain of this construction.
- For `f : B → *` the perfectoid ball, `Rf_!Λ ≅ Λ(−1)[−2]` (Section S5.2).

*Needs:* other targets of Section S2.3; Sections S0.4, S2.1; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C2.10`; `EnhancedDerivedSheaves §E2.6`.

**Independence of the hypercover**. For two hypercovers `Y• → Y` and `Ỹ• → Y` by quasiseparated locally spatial diamonds, the two functors `Rf_!` are naturally equivalent through a common refinement, and these equivalences form a coherent system, compatible with further refinement. A map of hypercovers `Z• → Y•` induces a map of support diagrams compatible with `Rf•!⁰` on fibres (by the fibre lemma and base change over locally spatial bases), hence an equivalence of the functors on coCartesian sections, both of which are identified with `D_ét(Y, Λ)` by hyperdescent (C2, E2). Compatibility for chains of refinements comes from the same construction over `Δ × Δ¹ × Δ¹` (E0). For `Y` quasiseparated locally spatial, the constant hypercover and any other give the same `Rf_!`. (ECD Definition 22.18 and the paragraph after it, p. 137.)

*Needs:* other targets of Section S2.3; Sections S2.1, S2.2; `EnhancedDerivedSheaves §E0.7`; `EnhancedDerivedSheaves §E2.6`; `DiamondEtaleCohomology §C2.10`.

### S2.4 Properties of `Rf_!`

In this section `f : Y′ → Y` is an eligible map of small v-stacks and `Λ` has `nΛ = 0` for some `n` prime to `p`.

**Base change**. For any map `g : Ỹ → Y` of small v-stacks, with pullbacks `f̃ : Ỹ′ → Ỹ` and `g′ : Ỹ′ → Y′`, there is a natural base-change equivalence `g^*Rf_! ≃ Rf̃_!g′^*` of functors `D_ét(Y′, Λ) → D_ét(Ỹ, Λ)`, constructed at the enhanced level. Choose hypercovers `Ỹ• → Ỹ` and `Y• → Y` with a map `g•` over `g` (Section S2.1) and repeat the support-diagram construction over `Δ × Δ¹` (E0), the edge over `Δ¹` being pullback along `g•`. The fibrewise left Kan extension preserves coCartesian edges in both directions by base change over locally spatial bases; pass to coCartesian sections. Base change of the ball `B → *` along `X → *` gives the relative ball `B × X → X`, and `Rf_!Λ` pulls back to `R(f_X)_!Λ`. (ECD Proposition 22.19 and its proof, pp. 137–138.)

*Needs:* Sections S2.1, S2.2, S2.3; `EnhancedDerivedSheaves §E0.7`; `EnhancedDerivedSheaves §E2.6`.

**Colimits**. `Rf_!` commutes with all direct sums, equivalently with all colimits. Pullback along a hypercover is conservative and commutes with `Rf_!` by base change, which reduces the claim to `Y` quasiseparated locally spatial (Section S2.2); HA 1.4.4.1(2) (E3) passes from sums to colimits. This is the input of the adjoint functor theorem in Layer S3. (ECD Proposition 22.20 and its proof, p. 138.)

*Needs:* Sections S2.2, S2.3; `EnhancedDerivedSheaves §E3.2`.

**Composition**. For eligible `g : Y″ → Y′` and `f : Y′ → Y` there is a natural equivalence `Rf_! ∘ Rg_! ≃ R(f ∘ g)_!` of functors `D_ét(Y″, Λ) → D_ét(Y, Λ)`, coherent with identities and associative for triple composites. Choose a hypercover `Y• → Y` and pull it back to `Y′•` and `Y″•`, which are again hypercovers by quasiseparated locally spatial diamonds (Section S2.1(2)). On proper-support objects the two functors are identified by the composition of Section S1.5 and its proof (fibrewise proper base change). Both sides preserve colimits, so both are left Kan extensions of their restrictions and the identification extends (E3); pass to coCartesian sections. For example, compactly supported cohomology of an open subdisc of the ball is computed by composing `j_!` and `Rf_!`. (ECD Proposition 22.21 and its proof, p. 138.)

*Needs:* Sections S1.2, S2.3; `EnhancedDerivedSheaves §E3.1`.

**Agreement with the étale extension by zero**. For `f` separated étale (eligible by Section S0.4), C5's `f_!` (left adjoint of `f^*`, ECD Definition 19.1) agrees with `Rf_!`. The comparison transformation is constructed as in Section S1.5; by base change reduce to `Y` strictly totally disconnected, and since both functors commute with direct sums (C5 and the previous targets), to `Y′` quasicompact, which is Section S1.5. For example, for the open unit disc inside the ball, `Rj_!` is extension by zero. (ECD Proposition 22.22 and its proof, p. 138.)

*Needs:* Sections S1.5, S2.3; `DiamondEtaleCohomology §C5.1`.

**Projection formula**. There is a functorial isomorphism `Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A)` for `B ∈ D_ét(Y′, Λ)` and `A ∈ D_ét(Y, Λ)`, compatible as `A` varies. ECD states it for small v-sheaves. The extension to small v-stacks uses the same argument through a hypercover by quasiseparated locally spatial diamonds and hyperdescent (C2, ECD 17.3), and is a target here. Fix `A`. Both `Rf•!⁰(− ⊗ A|_{Y′•})` and `Rf•!⁰(−) ⊗ A|_{Y•}` are left Kan extensions from the support sub-fibration. On proper-support objects compare both with `Rf‾•_*(j•!(−) ⊗ f‾•^*A)`, using `j•! ⊣ j•^*, f‾•^* ⊣ Rf‾•_*` and monoidality of pullback (C3); fibrewise these are the open-immersion projection formula and Section S1.5. Both functors preserve coCartesian edges, so pass to coCartesian sections and apply hyperdescent. With `B = Λ: Rf_!Λ ⊗ A ≃ Rf_!f^*A`; for the ball this gives `Rf_!f^*A = A(−1)[−2]`. (ECD Proposition 22.23 and its proof, p. 139.)

*Needs:* Sections S1.2, S2.3; `DiamondEtaleCohomology §C2.10`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.8`; `EnhancedDerivedSheaves §E3.1`.

**Coherence of the exchange equivalences**. The base-change equivalences, the composition equivalences and the projection-formula isomorphisms of this section satisfy the pasting identities:

1. base change along a composite `Ỹ₂ → Ỹ₁ → Y` is the vertical pasting of the two base changes;
2. for composable eligible `f, g` and any base change, the base change of `R(f ∘ g)_! ≃ Rf_!Rg_!` is the horizontal pasting of the base changes of `Rf_!` and `Rg_!`;
3. the composition equivalences are associative and unital;
4. base change for an identity map, and along an identity base map, is the identity.

These hold at the enhanced level and are part of the interface. Each identity is obtained by running the support-diagram construction over `Δ × [1]ⁿ` (`n = 2` for (1) and `(2), n = 3` for associativity; E0). Uniqueness of left Kan extensions (E3) identifies two transformations once they agree on proper-support objects, where they reduce to the pasting identities of proper base change, of `j_!` (C5) and of `Rf‾_*` (C3). For open immersions, base change and composition reduce to the canonical isomorphisms of C5's `j_!`. (Proofs of ECD Propositions 22.19 and 22.23, pp. 138–139.)

*Needs:* Section S2.3; `EnhancedDerivedSheaves §E0.7`; `EnhancedDerivedSheaves §E3.1`; `EnhancedDerivedSheaves §E3.4`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C5.2`; `DiamondEtaleCohomology §C5.9`.

### Examples

- Assume `Λ ≠ 0`. For the open unit disc `D → Spa(C, O_C), Λ` has no proper support, `Rf_!Λ = colim_r R(f|_{D_r})_!Λ = Λ(−1)[−2]` over closed subdiscs, while `Rf_*Λ = Λ`.
- For `Y` quasiseparated locally spatial the constant hypercover recovers the left Kan extension; for `f` spatial-eligible every proper-support category is everything.
- `[*/K] → *` for a nontrivial profinite group `K` lies outside the eligible class. For `K = {1}` it is the eligible identity map.

### Dependencies

Layers S0 and S1; `DiamondsAndVStacks` D1, D4, D5; `DiamondEtaleCohomology` C2, C3, C4, C5; `EnhancedDerivedSheaves` E0, E2, E3; `ClassicalAdicEtaleCohomology`, Section 10.4 (one example).

## Layer S3: The exceptional inverse image

`Rf^!` is the right adjoint of `Rf_!`, produced by the adjoint functor theorem. Everything in this layer is formal, given the projection formula, base change and composition of Layer S2: Verdier duality, `Rf^!` of an internal `Hom`, the composition law, `Rf^! = f^*` for étale maps and the exceptional base change `Rg^!Rf_* ≃ Rf′_*Rg̃^!` (ECD 23.1–23.3 and 23.16(i)). The last of these is needed before smoothness, in the proof of ECD 23.4. The layer also constructs the traces, the twisted-pullback transformation `τ_f` and the base-change transformations of `Rf^!`, which Layer S4 compares.

### S3.1 `Rf^!` and change of rings

**The exceptional inverse image**. Let `f : Y′ → Y` be an eligible map of small v-stacks and `Λ` with `nΛ = 0, n` prime to `p`. `Rf^! : 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ)` is the right adjoint of `Rf_!` (Section S2.3), constructed for presentable stable `∞`-categories by the adjoint functor theorem (E3, HTT 5.5.2.9). The theorem applies because `Rf_!` preserves all colimits (Section S2.4) and both categories are presentable (C2, ECD Lemma 17.1). `Rf^!` is exact and preserves all limits, and the adjunction `Rf_! ⊣ Rf^!` is part of the data; on homotopy categories it gives `Hom(Rf_!A, B) ≅ Hom(A, Rf^!B)`. `Rf^!` is defined only for eligible `f`, and every statement that uses it carries the eligibility hypotheses of the map in question. (ECD Theorem 23.1 and its proof, p. 140.)

The API consists of: the adjunction, natural in `A ∈ D_ét(Y′, Λ)` and `B ∈ D_ét(Y, Λ)`; preservation of all limits and exactness of `Rf^!`; the identity (`R(id)^! ≃ id`); the targets below (composition, the étale case, restriction of scalars, internal `Hom` and the exchange with direct images); and the object `D_f := Rf^!Λ ∈ D_ét(Y′, Λ)`, invertible when `f` is `ℓ`-cohomologically smooth (Section S4.3).

**Checks.**

- `R(id_Y)^! ≃ id`.
- For an open immersion `j : U → Y` of small v-stacks, `Rj^! ≃ j^*`, the right adjoint of `j_!`.
- Assume `Λ ≠ 0`. For `q : S × Spa(C, O_C) → Spa(C, O_C)` with `S` an infinite profinite set, `Rq^!Λ` is the sheaf of `Λ`-valued distributions `T ↦ Hom_Λ(C⁰(T, Λ), Λ)` and is not `q^*Λ` (Section S5.4). A definition of `Rf^!` as a twisted pullback would get this wrong.
- For the ball `f : B → *, Rf^!Λ ≅ Λ(1)[2]` canonically (Section S5.2).

*Needs:* Sections S0.4, S2.3; `EnhancedDerivedSheaves §E3.2`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.12`.

**Change of rings**. Let `f` be eligible and `g : Λ′ → Λ` a map of rings each killed by an integer prime to `p`. With `res_g : D_ét(−, Λ) → D_ét(−, Λ′)` restriction of scalars along `g`, there is a natural equivalence `res_g ∘ Rf^! ≃ Rf^! ∘ res_g` of functors `D_ét(Y, Λ) → D_ét(Y′, Λ′)`. Restriction of scalars is right adjoint to `− ⊗^L_{Λ′} Λ` (C3). `Rf_!(− ⊗^L_{Λ′} Λ) ≃ Rf_!(−) ⊗^L_{Λ′} Λ` by the projection formula over `Λ′` applied to the constant sheaf `Λ`, and passing to right adjoints (mates, E3) gives the claim. For `Λ′ = ℤ/ℓᵐ → Λ = 𝔽_ℓ, Rf^!𝔽_ℓ` computed over `𝔽_ℓ` and over `ℤ/ℓᵐ` agree as `ℤ/ℓᵐ`-complexes; this is used in the proof of ECD 23.4. (ECD Remark 23.2, p. 140.)

*Needs:* other targets of Section S3.1; Section S2.3; `DiamondEtaleCohomology §C3.11`; `DiamondEtaleCohomology §C3.8`; `EnhancedDerivedSheaves §E3.4`.

### S3.2 The formal duality lemma, Verdier duality and internal `Hom`

**The formal duality lemma**. Let `𝒞` and `𝒟` be closed monoidal categories, with internal `Hom` `ihom X` right adjoint to `X ⊗ −`. Let `f^* : 𝒟 → 𝒞` have a right adjoint `f_*`, and `f_! : 𝒞 → 𝒟` a right adjoint `f^!`. Suppose given a natural isomorphism `f_!(B ⊗ f^*A) ≅ f_!B ⊗ A` of functors of `A ∈ 𝒟`, for a fixed `B ∈ 𝒞` (the projection formula). Then there is a natural isomorphism of functors of `A′ ∈ 𝒟`

```text
ihom(f_!B, A′) ≅ f_* ihom(B, f^!A′),
```

namely the conjugate (Mathlib `conjugateIsoEquiv`) of the given isomorphism for the composite adjunctions `(A ↦ f_!(B ⊗ f^*A)) ⊣ (A′ ↦ f_* ihom(B, f^!A′))` and `(f_!B ⊗ −) ⊣ ihom(f_!B, −)`. Likewise, a natural isomorphism `A ⊗ f_!C ≅ f_!(f^*A ⊗ C)` of functors of `C ∈ 𝒞`, for a fixed `A ∈ 𝒟`, gives a natural isomorphism `f^! ihom(A, A′) ≅ ihom(f^*A, f^!A′)` of functors of `A′`. In a symmetric monoidal setting the two forms of the projection formula are equivalent. This is the Yoneda argument of the proof of ECD Proposition 23.3, p. 141, stated for arbitrary categories so that it can be proved once; the two Verdier duality statements below are its instances, applied to the enhanced étale categories with the projection formula of Section S2.4.

The analogous conjugation turns base change for `Rf_!` into the exceptional base change of Section S3.3.

**Checks.**

- For `f^* = f_! = id` with the identity adjunctions and the identity projection isomorphism, the conclusion is the identity of `ihom(B, −)`.
- For a map of commutative rings `R → S`, take `𝒟 = Mod_R, 𝒞 = Mod_S, f^* = S ⊗_R −, f_* = f_! =` restriction of scalars and `f^! = Hom_R(S, −)`. The projection formula is the isomorphism `(B ⊗_S (S ⊗_R A))|_R ≅ B|_R ⊗_R A`, and the lemma returns the classical isomorphism `Hom_R(B|_R, A′) ≅ Hom_S(B, Hom_R(S, A′))|_R`, duality for the finite map `Spec S → Spec R` when `S` is finite over `R`. For `R = ℤ` and `S = ℤ/5, Hom_ℤ(S, ℤ) = 0` whereas `S ⊗_ℤ ℤ ≅ S ≠ 0`. Getting `f^!` as `S ⊗_R −` instead of `Hom_R(S, −)` fails this check.
- With the projection formula in the wrong variable (an isomorphism of functors of `B` instead of `A`), the conjugation does not apply. The hypothesis must be natural in the base variable.

*Needs:* Mathlib `CategoryTheory.MonoidalClosed`, `CategoryTheory.Adjunction.comp`, `CategoryTheory.conjugateIsoEquiv`.

**Verdier duality**. Let `f : Y′ → Y` be eligible and `Λ` with `nΛ = 0, n` prime to `p`. For `A ∈ D_ét(Y′, Λ)` and `B ∈ D_ét(Y, Λ)` there is a natural isomorphism

```text
RHom_Λ(Rf_!A, B) ≅ Rf_* RHom_Λ(A, Rf^!B),
```

`RHom` being the internal `Hom` of C3. It is the formal duality lemma for the adjunctions `f^* ⊣ Rf_*` and `Rf_! ⊣ Rf^!` and the projection formula of Section S2.4, made at the enhanced level so that it is natural. Taking global sections over `Y = Spa(C, O_C)` gives `RHom(RΓ_c(Y′, A), B) ≅ RHom(A, Rf^!B)`, the form used in ECD 25.1 and 25.4. (ECD Proposition 23.3(i) and its proof, pp. 140–141.)

*Needs:* other targets of Section S3.2; Sections S2.3, S3.1; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `EnhancedDerivedSheaves §E3.4`.

**`Rf^!` of an internal `Hom`**. For `f` eligible and `A, B ∈ D_ét(Y, Λ)` there is a natural isomorphism `Rf^!RHom_Λ(A, B) ≅ RHom_Λ(f^*A, Rf^!B)`: the second form of the formal duality lemma, using the symmetric monoidal structure of `D_ét`. With `B = Λ` and `f` smooth: `Rf^!RHom(A, Λ) ≅ RHom(f^*A, D_f)`, the input of ECD 23.17 and 25.4. (ECD Proposition 23.3(ii) and its proof, pp. 140–141.)

*Needs:* other targets of Section S3.2; Sections S2.3, S3.1; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `EnhancedDerivedSheaves §E3.4`.

### S3.3 Composition, étale maps and exceptional base change

**Identity and composition**. For eligible `g : Y″ → Y′` and `f : Y′ → Y` there are natural equivalences `R(id)^! ≃ id` and `R(f ∘ g)^! ≃ Rg^! ∘ Rf^!`, the mates of `R(id)_! ≃ id` and of `Rf_! ∘ Rg_! ≃ R(f ∘ g)_!` (Section S2.4) under the adjunctions of Section S3.1. They are associative and unital, as mates of the pasting coherences of Section S2.4, and compatible with the composition of `Rf_!` through units and counits. For an open immersion followed by a finite étale map, `R(f ∘ j)^! = j^*Rf^! = j^*f^*`. (Used in the proof of ECD Proposition 23.4, p. 143.)

*Needs:* Sections S2.3, S2.4, S3.1; `EnhancedDerivedSheaves §E3.4`.

**Étale maps**. If `f : Y′ → Y` is a separated étale map of small v-stacks, then `Rf^! ≃ f^*` canonically, compatibly with composition: `Rf_!` is C5's `f_!` (Section S2.4), and `Rf^!` and `f^*` are both right adjoints of it. For a disjoint union of opens `⊔Uᵢ → Y, Rf^!` is the family of restrictions. (Proof of ECD Proposition 23.4, p. 143.)

*Needs:* Sections S2.4, S3.1; `DiamondEtaleCohomology §C5.1`; `EnhancedDerivedSheaves §E3.4`.

**Exceptional base change**. Consider a cartesian square of small v-stacks, with `g : X′ → X` eligible, `f : Y → X` arbitrary, `g̃ : Y′ → Y` and `f′ : Y′ → X′` the pullbacks. Then `g̃` is eligible (Section S0.4) and for `A ∈ D_ét(Y, Λ)` there is a natural isomorphism

```text
Rg^! Rf_* A ≅ Rf′_* Rg̃^! A.
```

No hypothesis on `f` is needed. Base change for `g` along `f` gives `f^*Rg_! ≃ Rg̃_!f′^*` (Section S2.4). The right adjoints are `Rg^!Rf_*` and `Rf′_*Rg̃^!`, and the mate of an equivalence is an equivalence (E3; Mathlib `conjugateIsoEquiv` in the `1`-categorical form). For `g` an open immersion this is the base change `j^*Rf_* ≅ Rf′_*j̃^*` of C3. For `g = h : X × S → X` with `S` profinite it gives `Rh′_*Rf′^! = Rf^!Rh_*`, as used in ECD 23.4. (ECD Proposition 23.16(i) and its proof, p. 151.)

*Needs:* Sections S0.4, S2.3, S3.1; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `EnhancedDerivedSheaves §E3.4`.

### S3.4 The adjunction calculus

**Traces, twisted pullback and base-change transformations**. For an eligible `f : Y′ → Y` and `Λ` with `nΛ = 0, n` prime to `p`, construct at the enhanced level:

1. the unit `η_! : A → Rf^!Rf_!A` on `D_ét(Y′, Λ)` and the counit, or trace, `tr_f : Rf_!Rf^!B → B` on `D_ét(Y, Λ)` of `Rf_! ⊣ Rf^!`; `η_!` is distinct from the unit `η_* : B → Rf_*f^*B` of `f^* ⊣ Rf_*` on `D_ét(Y, Λ)`;
2. the twisted-pullback transformation `τ_f : Rf^!Λ ⊗^L_Λ f^*(−) → Rf^!(−)`, adjoint to `Rf_!(Rf^!Λ ⊗ f^*B) ≃ Rf_!Rf^!Λ ⊗ B → B`, the composite of the projection formula and `tr_f ⊗ id`;
3. evaluation `RHom(A, B) ⊗ A → B`, coevaluation for invertible objects, and the tensor–`Hom` adjunction on `D_ét` (C3);
4. for a cartesian square with `f` eligible and `g : Ỹ → Y` arbitrary, with pullbacks `f′` and `g̃`, the base-change transformation `g̃^*Rf^! → Rf′^!g^*`. It is adjoint to `Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^*`, the composite of base change and `tr_f`. Also its variant along open immersions used in ECD 23.4(iii)–(iv);
5. the mates of all exchange equivalences of Layer S2.

These are compatible with composition (traces compose: `tr_{f∘g} = tr_f ∘ Rf_!(tr_g)Rf^!`, the mate of the composition law) and with base change (the mate of the pasting coherences). They are tested on open immersions and finite étale maps before any smoothness statement uses them. (ECD Proposition 23.4(i), p. 141, for `τ_f` over `𝔽_ℓ` and its construction from the projection formula; Proposition 23.12(iii), p. 147, for the base-change transformation.)

The API consists of: the trace `tr_f` (the counit), `τ_f` and the base-change transformation; composition of traces under the composition equivalences; the open-immersion case (for an open immersion `τ_j` is the identity of `j^*`); the étale case (for `f` separated étale `τ_f` is the identity of `f^*` under `Rf^! ≃ f^*`); the finite étale case (for `f` finite étale, `tr_f : f_*f^* → id` is the classical trace, summation over the fibres); and compatibility of `τ` with base change along any map of small v-stacks through the base-change transformation.

The twisted-pullback transformation and the trace make sense for any adjunction with a projection formula. For a finite fibre `I`, where `Rf_! = Rf_*` and `Rf^! = f^*`, the unit `η_*` of `f^* ⊣ Rf_*` is the diagonal `Λ → Λ^I`, the trace is summation `Λ^I → Λ` and the normalised trace is `|I|^{−1}` times that sum. The unit `η_!` of `Rf_! ⊣ Rf^!` lives on the source: on a family `(A_i)_{i ∈ I}` it is given by the inclusions `A_i → ⊕_{j ∈ I} A_j`, and the triangle identities compose it with summation to the identity of each `A_i`. The diagonal agrees with Mathlib's `Algebra.linearMap Λ (I → Λ)` and summation with `Algebra.trace Λ (I → Λ)`; the latter is computed on `Pi.basisFun Λ I` by `Algebra.trace_eq_matrix_trace`.

For a commutative ring `Λ` and finite set `I`, prove that summation after the diagonal `η_*` is multiplication by `|I|` and that a bijection of fibre sets preserves the diagonal and the trace. When `|I|` is a unit of `Λ`, the normalised trace splits the diagonal and is invariant under such bijections. These are the finite-module specialisations of the trace, unit and averaging conventions above. (ECD Proposition 23.4(i), p. 141; proof of Proposition 24.2, p. 153.)

**Checks.**

- For `f` the identity, `τ_f` and `tr_f` are identities. For a one-point fibre, the diagonal, trace and normalised trace are all the identity of `Λ`.
- For `I` empty, the diagonal is the unique map `Λ → 0` and the trace is `0 → Λ`. If `Λ ≠ 0` the cardinality `0` is not a unit, so the normalised trace is undefined; for the zero ring all these maps are the unique zero map.
- For `I = Fin 2` and `Λ = 𝔽₅`, the diagonal `η_*` sends `1` to `(1, 1)`, the trace sends `(1, 0)` to `1`, and the normalised trace sends it to `3 = 2^{−1}`. Thus the plain trace after `η_*` is `2` and the normalised trace after `η_*` is `3·2 = 1`. In the same model `η_!` on `(A₀, A₁)` is the pair of inclusions `A_i → A₀ ⊕ A₁`, and summation after it is the identity of each `A_i`.
- For an open immersion `j, tr_j : j_!j^*B → B` is the counit of `j_! ⊣ j^*`.
- For `f : Y′ → Y` finite étale of constant degree `d`, the composite `Λ → f_*f^*Λ → Λ` of the unit `η_*` of `f^* ⊣ f_*` and `tr_f` is multiplication by `d`. In the finite-set model, with `I` a set of `d` points, the diagonal `Λ → Λ^I` followed by summation is multiplication by `d`, not the identity.
- Assume `Λ ≠ 0`. For `q : S × Spa(C, O_C) → Spa(C, O_C)` with `S` infinite profinite, `τ_q` is not an equivalence. On global sections over an infinite open and closed `T ⊂ S` (for example `T = S`), `Rq^!M = RHom(C⁰(T, Λ), M)`, while `Rq^!Λ ⊗ q^*M = RHom(C⁰(T, Λ), Λ) ⊗ M`. These differ for `M = ⊕_ℕ Λ` because `C⁰(T, Λ)` is free of infinite rank (Nöbeling, Section S4.1). So `Rq^!` does not commute with direct sums, matching criterion (iii) of Section S4.1.

*Needs:* Sections S2.3, S2.4, S3.1; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C3.11`; `EnhancedDerivedSheaves §E3.4`.

### Examples

- Open immersions: `Rj^! = j^*, tr_j` is the counit of `j_! ⊣ j^*, τ_j = id`.
- Finite étale maps of degree `d: Rf^! = f^*, tr_f` is summation over the fibres and `tr_f ∘ η_* = d`.
- For `S` infinite, `X` nonempty and `Λ ≠ 0`, the profinite projection `q : S × X → X` is not smooth, `Rq^!Λ` is a sheaf of distributions and `τ_q` is not an equivalence. For `S` finite, `q` is finite étale and `Rq^! = q^*`.

### Dependencies

Layer S2; `DiamondEtaleCohomology` C2, C3, C5; `EnhancedDerivedSheaves` E3; Mathlib's closed monoidal categories and conjugate adjunctions.

## Layer S4: Cohomologically smooth morphisms

A separated map representable in locally spatial diamonds is `ℓ`-cohomologically smooth if, after every base change to a strictly totally disconnected space, `Rf^!` is the twist of `f^*` by an invertible object. This layer first proves the criteria of ECD 23.4–23.7 over strictly totally disconnected bases, then defines smoothness and proves the practical criterion. It goes on to universal openness, the dualizing complex and its base change, composition, descent and v-locality, and finally smooth base change and the exchange of `Rf^!` with smooth pullback (ECD 23.8–23.17). From Section S4.2 on, `ℓ ≠ p` is a fixed prime.

### S4.1 Criteria over strictly totally disconnected bases

**Locally constant functions on a profinite set**. For a profinite set `S` and a commutative ring `Λ`, `C⁰(S, Λ) = LocallyConstant S Λ` is a free `Λ`-module. For finite `S` it is `Λ^S`, of rank `|S|` when `Λ ≠ 0`; for infinite `S` and `Λ ≠ 0` it is not finitely generated. For the zero ring it is the zero module for every `S`, and no rank `|S|` assertion is made. This follows from Nöbeling's theorem (Mathlib `LocallyConstant.freeOfProfinite`, for `Λ = ℤ`) and the isomorphism `C⁰(S, ℤ) ⊗_ℤ Λ ≅ C⁰(S, Λ)`. In particular `− ⊗^L_Λ C⁰(S, Λ) = − ⊗_Λ C⁰(S, Λ)`. (Proof of ECD Lemma 23.6, p. 144.)

**Checks.**

- For `S = Fin m, C⁰(S, Λ) = Λ^m`, of rank `m` if `Λ ≠ 0`. For `m = 0` it is the zero module. With `Λ = ℤ/1` it is the zero module for every `m`, so the rank assertion needs the nonzero-ring hypothesis.
- For `S = ℤ_p` and `Λ = 𝔽_ℓ, C⁰(S, Λ)` has countably infinite dimension, while its `Λ`-linear dual has uncountable dimension. So the module of distributions `Hom_Λ(C⁰(S, Λ), Λ)` is not isomorphic to `C⁰(S, Λ)`, which is the obstruction behind the distribution sheaf of Section S5.4.
- For the one-point space, `C⁰(S, Λ) = Λ`.

*Needs:* Mathlib `LocallyConstant`, `LocallyConstant.freeOfProfinite`, `Module.Free`.

**Pushforward along a profinite projection**. Let `S` be a profinite set, `Y` a small v-sheaf, `h : Y × S → Y` the projection, and `Λ` any commutative ring; the standing coefficient hypothesis is not used. For `C ∈ D_ét(Y, Λ)` there is a natural isomorphism `Rh_*h^*C ≃ C⁰(S, Λ) ⊗_Λ C`. The map is the composite of `C⁰(S, Λ) ⊗_Λ C → Rh_*Λ ⊗ C`, induced by viewing a locally constant function on `S` as a section of `Λ` over `Y × S`, with the projection morphism `Rh_*Λ ⊗ C → Rh_*h^*C`; the tensor product is underived because `C⁰(S, Λ)` is free. (ECD Lemma 23.6, p. 144.)

*Proof route.* Restriction to a slice commutes with direct image in the v-topos, and `(Y × S) ×_Y X = X × S`, so the comparison may be tested after pullback to every strictly totally disconnected `X → Y` (`DiamondEtaleCohomology §C2.3`). Then `X × S = lim X × Sᵢ`, with `S = lim Sᵢ` and `Sᵢ` finite, is strictly totally disconnected, and by the unbounded comparison (`DiamondEtaleCohomology §C0.24`) both v-pushforward and pullback are computed in the étale topoi, which are the sheaf topoi of `|X|` and `|X| × S` (`DiamondEtaleCohomology §C0.19`). The map `h` is quasicompact, separated and quasi-pro-étale, so `h_*` is exact on étale sheaves (`DiamondEtaleCohomology §C8.22`). For a sheaf `F` and a quasicompact open `U ⊂ X`, continuity along `U × Sᵢ` (`DiamondEtaleCohomology §C0.18`, ECD 14.9) gives `Γ(U × S, h^*F) = colim_i F(U)^{Sᵢ} = C⁰(S, F(U)) = C⁰(S, Λ) ⊗_Λ F(U)`. Exactness of `h_*` and of `C⁰(S, Λ) ⊗_Λ −` extend this to bounded-below complexes, and left-completeness (`DiamondEtaleCohomology §C0.22`) to unbounded ones. When `nΛ = 0` with `n` prime to `p`, ECD's argument through `Rh_* ≅ Rh_!` (Section S1.2) and the projection formula (Section S1.5) gives the same map; that argument does not cover `Λ = ℤ` or `Λ = 𝔽_p`. For `S` finite of cardinality `m, Rh_*h^*C = C^m`; for `S = ℤ_p, Rh_*h^*Λ = C⁰(ℤ_p, Λ)`, free of countable rank.

**Checks.**

- For `S` empty the pushforward and `C⁰(S, Λ)` are zero.
- For `S` a singleton the formula is the identity of `C`.
- For `S = ℤ_r` and `Λ = 𝔽_ℓ` with `r` and `ℓ` prime and `ℓ ≠ p`, the coefficient module has countably infinite dimension.
- For `S` with two points and `C = Λ[0]`, both sides are `Λ²[0]`, also for `Λ = ℤ` and `Λ = 𝔽_p`, which lie outside the coefficient class of the exceptional operations.

*Needs:* other targets of Section S4.1; `DiamondEtaleCohomology §C0.18`; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C0.22`; `DiamondEtaleCohomology §C0.24`; `DiamondEtaleCohomology §C2.3`; `DiamondEtaleCohomology §C8.22`.

**Criteria for `Rf^!` to be a twisted pullback**. Let `X` be a strictly totally disconnected perfectoid space, `f : Y → X` a compactifiable map from a locally spatial diamond `Y` with locally `dim.trg f < ∞` (so `f` is eligible), and `ℓ ≠ p`. The following are equivalent:

1. the twisted-pullback transformation `τ_f : Rf^!𝔽_ℓ ⊗_{𝔽_ℓ} f^* → Rf^!` of functors `D_ét(X, 𝔽_ℓ) → D_ét(Y, 𝔽_ℓ)` (Section S3.4) is an equivalence;
2. `Rf^!` is equivalent to `A ⊗_{𝔽_ℓ} f^*` for some `A ∈ D_ét(Y, 𝔽_ℓ)`;
3. `Rf^!` commutes with arbitrary direct sums, and for every connected component `X₀ = Spa(C, C⁺)` of `X` and open `j : U ⊂ X₀` the map `j′_!Rf_U^!𝔽_ℓ → Rf₀^!j_!𝔽_ℓ` is an equivalence. Here `f_U : V → U, f₀ : Y₀ → X₀` and `j′ : V → Y₀` are the pullbacks, and the map is adjoint to `Rf₀!j′_!Rf_U^!𝔽_ℓ = j_!Rf_U!Rf_U^!𝔽_ℓ → j_!𝔽_ℓ`;
4. for every affinoid pro-étale `g : X′ → X`, with pullbacks `h : Y′ → Y` and `f′ : Y′ → X′`, the base-change transformation `h^*Rf^! → Rf′^!g^*` is an equivalence; and for `X₀, U` as in (3) the transformation `j′_!Rf_U^! → Rf₀^!j_!` of functors `D_ét(U, 𝔽_ℓ) → D_ét(Y₀, 𝔽_ℓ)` is an equivalence.

Condition (4) says that `Rf^!` commutes with quasi-pro-étale base change. (ECD Proposition 23.4, Remark 23.5 and the proof of 23.4, pp. 141–144.)

*Proof route.* `(1) ⇒ (2) ⇒ (3)` is clear, since `f^*` and `⊗` commute with sums and twisted pullbacks satisfy the second part of (3). For the first part of `(3) ⇒ (4)`, write `g = lim gᵢ` with `gᵢ` affinoid étale. Then `h_* = Rh_*` is exact and conservative (`DiamondEtaleCohomology §C8.22`, ECD Remark 21.14), `g_*g^* = colim gᵢ*gᵢ^*`, and `Rf^!` commutes with colimits, which reduces to étale `gᵢ`; there `gᵢ^* = Rgᵢ^!` and the composition and étale laws of Section S3.3 apply. For the second part, the `K ∈ D_ét(U, 𝔽_ℓ)` satisfying it form a triangulated subcategory closed under sums and containing every `j″_!𝔽_ℓ` for open `j″ : U″ ⊂ U`, and these generate (`DiamondEtaleCohomology §C9.8`). For `(4) ⇒ (1)`, check on fibres. Reduce to `X = Spa(C, C⁺)` and to the generalizations of a point, and by triangles to `K = i_*K₀` and then to a constant `K₀`. The bounded case follows by triangles, the bounded-below case from the finite cohomological dimension of `Rf_!` (Section S1.4), and the bounded-above case by Postnikov limits, since `Rf^!` preserves limits and `Rf^!𝔽_ℓ ∈ D^{≤0}` (`DiamondEtaleCohomology §C8.23`, ECD Lemma 21.13). Finally, for `K₀ = V[0]` with `V = C⁰(S, 𝔽_ℓ)` and `h : X × S → X, (4)` gives `Rf′^!h^*𝔽_ℓ = h′^*Rf^!𝔽_ℓ`. Applying `Rh′_*` and exceptional base change (Section S3.3) gives `Rf^!Rh_*h^*𝔽_ℓ = Rh′_*h′^*Rf^!𝔽_ℓ`, which by the profinite-projection lemma is `Rf^!V = V ⊗ Rf^!𝔽_ℓ`. For the ball `B × X → X` all four conditions hold.

**Checks.**

- For a finite discrete `S, q : S × X → X` is finite étale; `Rq^! = q^*` and all four conditions hold.
- For `S` infinite profinite and `X` nonempty, condition (3) fails: `R⁰q_!𝔽_ℓ` has infinite-dimensional fibre `C⁰(S, 𝔽_ℓ)`, so `Rq^!` does not preserve direct sums.
- For `X` empty, both derived categories are zero and all four conditions hold, even for `S = ℤ_2`.

*Needs:* other targets of Section S4.1; Sections S0.4, S1.4, S3.1, S3.3, S3.4; `DiamondEtaleCohomology §C8.22`; `DiamondEtaleCohomology §C8.23`; `DiamondEtaleCohomology §C9.8`; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondEtaleCohomology §C5.1`; `EnhancedDerivedSheaves §E3.4`.

**`ℓ`-power-torsion coefficients**. Under the equivalent conditions of the previous target, for every `ℓ`-power-torsion ring `Λ (ℓᵐ Λ = 0)` the transformation `τ_f : Rf^!Λ ⊗_Λ f^* → Rf^!` of functors `D_ét(X, Λ) → D_ét(Y, Λ)` is an equivalence. (ECD Proposition 23.4, final assertion, p. 142, and its proof, p. 144.)

*Proof route.* `Λ` is a `ℤ/ℓᵐ`-algebra, and change of rings (Section S3.1) reduces to `Λ = ℤ/ℓᵐ`. Represent `K` by a complex of `ℤ/ℓᵐ`-modules on the étale site of `X` and filter it degreewise by `ℓⁱ`. Each graded piece is a complex killed by `ℓ`, hence an object of `D_ét(X, 𝔽_ℓ)`; these pieces need not be copies of `K ⊗^L 𝔽_ℓ`. Exactness of both functors and of `τ` reduces the comparison to these `𝔽_ℓ`-complexes, given the coefficient comparison `Rf^!(ℤ/ℓᵐ) ⊗^L_{ℤ/ℓᵐ} 𝔽_ℓ → Rf^!𝔽_ℓ`. For that, condition (4) holds for `ℤ/ℓᵐ` by the same filtration, which reduces to `X = Spa(C, C⁺)` connected. There use the periodic resolution of `𝔽_ℓ` over `ℤ/ℓᵐ` and `Rf^!(ℤ/ℓᵐ) ∈ D^{≤0}`, proved as for `𝔽_ℓ` using that `ℤ/ℓᵐ` is self-injective. For `Λ = ℤ/ℓ²` and the ball, `Rf^!ℤ/ℓ² ≅ ℤ/ℓ²(1)[2]`.

*Needs:* other targets of Section S4.1; Section S3.1; `DiamondEtaleCohomology §C3.11`; `DiamondEtaleCohomology §C3.8`.

**The direct-sum criterion**. Let `X` be strictly totally disconnected, `f : Y → X` a compactifiable map from a spatial diamond `Y` with `dim.trg f < ∞` (so `f` is spatial-eligible), and `ℓ ≠ p`. Then `Rf^! : D_ét(X, 𝔽_ℓ) → D_ét(Y, 𝔽_ℓ)` commutes with arbitrary direct sums if and only if, for every constructible sheaf `F` of `𝔽_ℓ`-vector spaces on `Y_ét` and every `i ≥ 0, Rⁱ f_!F` is constructible on `X_ét`. (ECD Proposition 23.7 and its proof, pp. 144–145.)

*Proof route.* Every quasicompact separated étale `U → Y` has `ℓ`-cohomological dimension `≤ 3 dim.trg f` (Section S1.4, `X` having cohomological dimension 0), which is the hypothesis of ECD 20.10. So `D_ét(Y, 𝔽_ℓ)` and `D_ét(X, 𝔽_ℓ)` are compactly generated, with compact objects the bounded complexes with constructible cohomology (`DiamondEtaleCohomology §C9.13`). The constructibility condition then says that `Rf_!` preserves compact objects, and the compact-generation criterion `EnhancedDerivedSheaves §E3.3` (for `F ⊣ G` with compactly generated source, `G` preserves coproducts iff `F` preserves compacts) concludes. For the ball over a strictly totally disconnected `X` both sides hold (`ClassicalAdicEtaleCohomology`, Section 10.5). For `q : S × X → X` with `S` infinite profinite and `X` nonempty, both fail: `R⁰q_!𝔽_ℓ` has the nonconstructible fibre `C⁰(S, 𝔽_ℓ)`.

**Checks.**

- For `S` finite, `q` is finite étale and `Rq^! = q^*` preserves sums; its sheaf pushforward preserves constructibility.
- For `S = ℤ_2` and `X = Spa(C, O_C), R⁰q_!𝔽_ℓ = C⁰(ℤ_2, 𝔽_ℓ)` is infinite-dimensional, and both conditions fail.
- For `X` empty and any `S`, the pushforward is zero and `Rq^!` preserves every sum; the zero sheaf is constructible.

*Needs:* Sections S0.4, S1.4, S3.1; `DiamondEtaleCohomology §C9.13`; `DiamondEtaleCohomology §C9.8`; `DiamondEtaleCohomology §C7.3`; `DiamondEtaleCohomology §C7.17`; `EnhancedDerivedSheaves §E3.3`.

### S4.2 Invertible objects and `ℓ`-cohomologically smooth maps

The coefficient complex at a point is `Λ` in degree zero in Mathlib's `DerivedCategory (ModuleCat Λ)`, formed by `DerivedCategory.singleFunctor` at zero. Its homology is `H⁰ ≅ Λ` and `Hⁱ = 0` for `i ≠ 0`; the shift `Λ[n]` has homology `Λ` in degree `−n` and zero elsewhere. For a nonzero commutative ring `Λ, Λ[m] ≅ Λ[n]` implies `m = n`; for `Λ = ℤ/1`, every shift is zero. These are the coefficient conventions for ECD Definition 23.8, p. 145, expressed through Mathlib's single-complex and homology functors.

**Checks.**

- For `Λ = ℤ`, `H⁰(Λ[0]) = ℤ` and `H¹ = 0`; shifting the defining complex away from zero fails this computation.
- `H⁻¹(Λ[1]) = Λ` and `H⁰ = 0`. The positive shift lowers the cohomological degree.
- For `Λ = ℤ/1` every shift is zero, so `Λ[0] ≅ Λ[1]`; shift uniqueness requires `Λ ≠ 0`.

**Invertible objects**. Let `Y` be any small v-stack and `Λ` a ring (in the applications `𝔽_ℓ` or an `ℓ`-power-torsion ring). An object `D ∈ D_ét(Y, Λ)` is *invertible* if it is étale locally isomorphic to `Λ[n]`, with `n` allowed to vary locally. Equivalently, this holds after pullback along a v-cover by locally spatial diamonds; the v-, quasi-pro-étale and étale local forms agree. Prove this comparison for small v-stacks: on diamond charts it is ECD's comparison, and the sheaves of isomorphisms to each `Λ[n]` descend to separated étale spaces over `Y` by D3's effective v-descent. Their disjoint union over `n` is surjective and supplies an étale cover on which `D` is a shift of `Λ`. The complex and its identifications descend by C2's v-hyperdescent. For `Λ ≠ 0`, the shift index `n` is uniquely determined at each point and locally constant on `|Y|`, and the cohomological degree is `−n`. For the zero ring every shift is zero, so invertibility makes sense but a degree does not. Invertible objects are `⊗`-invertible: `D ⊗ RHom(D, Λ) ≃ Λ`. The converse is not part of the definition. (ECD Definition 23.8, p. 145, over `𝔽_ℓ`; proof of Proposition 23.12, p. 149, for the agreement of the topologies.)

The API consists of: stability under shifts (`D[m]` is invertible if `D` is), the constants (`Λ[n]` is invertible), tensor products and pullback along any map of small v-stacks; agreement of the étale, quasi-pro-étale and v-local forms; duals (for invertible `D`, evaluation `D ⊗ RHom(D, Λ) → Λ` is an isomorphism and `RHom(D, Λ)` is invertible); the degree (for `Λ ≠ 0`, the locally constant function `|Y| → ℤ` with value `−n` at `y` when `D_y ≃ Λ[n]`; different connected components can have different degrees and no global shift is required); and detection by reduction (for `Λ = ℤ/ℓᵐ` with `m ≥ 1`, if `D ⊗^L_{ℤ/ℓᵐ} 𝔽_ℓ` is invertible then so is `D`; general `ℓ`-power-torsion rings are reached by extension of scalars from `ℤ/ℓᵐ`, with no map `Λ → 𝔽_ℓ` assumed). Over a point, uniqueness of the shift index follows from the homology of `Λ[n]`; it fails for the zero ring.

**Checks.**

- On the small v-stack `* = Spd 𝔽_p, Λ` is invertible and is the dualizing complex of `id_*`, of degree `0` when `Λ ≠ 0`; `*` is not a locally spatial diamond.
- Pullback of an invertible `D` along any diamond chart `T → Y` is invertible, and its tensor evaluation with its dual is `Λ_T`. For `D = Λ` on `*`, every such chart gives the usual constant coefficient object `Λ_T`.
- On `Spa(C, O_C), Λ(1)[2]` is invertible of degree `−2: μ_n` is constant after choosing roots of unity.
- Assume `Λ ≠ 0, C⁺ ≠ O_C` and `Spa(C, O_C)` open in `Spa(C, C⁺)`, and let `j` be this open immersion. Then `j_!Λ` is not invertible: its stalk at the closed point is `0`.
- Assume `Λ ≠ 0` and `Y` nonempty. `Λ ⊕ Λ` is not invertible: its stalks have rank `2`.
- For nonzero `Λ` and `Y` the disjoint union of two geometric points, the object that is `Λ` on one point and `Λ[1]` on the other is invertible, of degree `0` on the first component and `−1` on the second.
- Over a point with `Λ = ℤ/1` the zero ring, `Λ[0] ≅ Λ[1]`, so a degree function must assume `Λ ≠ 0`.

*Needs:* `DiamondsAndVStacks D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks D5/spatial-diamond`; `DiamondsAndVStacks D3/etale-and-finite-etale-are-v-stacks`; `DiamondsAndVStacks D3/etale-and-quasi-pro-etale-morphisms-of-stacks`; `DiamondEtaleCohomology §C2.2`; `DiamondEtaleCohomology §C2.10`; `DiamondEtaleCohomology §C2.12`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C3.11`.

**`ℓ`-cohomologically smooth maps**. Let `f : Y′ → Y` be a separated map of small v-stacks, representable in locally spatial diamonds, and `ℓ ≠ p`. Then `f` is *`ℓ`-cohomologically smooth* if

1. `f` is compactifiable and locally `dim.trg f < ∞`, so that `f` and all its pullbacks are eligible;
2. for every strictly totally disconnected perfectoid space `X` with a map `X → Y`, with pullback `f_X : Y′ ×_Y X → X`, the functor `Rf_X^! : D_ét(X, 𝔽_ℓ) → D_ét(Y′ ×_Y X, 𝔽_ℓ)` is equivalent to `D_{f_X} ⊗_{𝔽_ℓ} f_X^*` for some invertible object `D_{f_X}`.

The equivalence is one of functors, hence natural in the coefficient object. It need not be the canonical twisted-pullback transformation, and the equivalences need not be compatible for different `X`; both are conclusions (Section S4.3). In ECD's definition the twist is printed as `D_{f_X} ⊗ f^*`; the pullback is `f_X^*`. The notion is defined only for separated maps representable in locally spatial diamonds. Smoothness of stacky maps, such as `[*/G] → *`, belongs to `VStackSheavesAndLisseCategories`. (ECD Definition 23.8 and Remark 23.9, p. 145.)

The API consists of: eligibility and separatedness of smooth maps; the twist (for `ℓ`-power-torsion `Λ, τ_f : Rf^!Λ ⊗ f^* → Rf^!` is an equivalence and `Rf^!Λ` is invertible; Section S4.3); the practical criterion below; stability under base change and composition; v-locality on the target, given locally `dim.trg f < ∞`; universal openness; and smoothness of separated étale maps.

**Checks.**

- The identity of a small v-stack is `ℓ`-cohomologically smooth with dualizing complex `Λ`.
- The ball `B → *` is `ℓ`-cohomologically smooth for every `ℓ ≠ p`, with `Rf^!Λ ≅ Λ(1)[2]` (Section S5.2).
- Assume `X` nonempty. For `S` an infinite profinite set and `X` strictly totally disconnected, `S × X → X` is not `ℓ`-cohomologically smooth: `Rq^!𝔽_ℓ` is the sheaf of distributions, which is not invertible.
- The origin `0 : Spa(C, O_C) → B × Spa(C, O_C)` of the perfectoid ball is a closed immersion, hence proper, compactifiable and of `dim.trg ≤ 0`. Its image is not open, so it is not `ℓ`-cohomologically smooth (Section S4.3).

*Needs:* other targets of Section S4.2; Sections S0.4, S3.1; `DiamondsAndVStacks D1/strictly-totally-disconnected`; `DiamondsAndVStacks D3/immersions-separatedness-and-truncatedness`; `DiamondsAndVStacks D5/relative-representability`; `DiamondEtaleCohomology §C8.19`.

**The practical criterion**. Let `f : Y′ → Y` be a compactifiable map of small v-stacks representable in spatial diamonds, and `ℓ ≠ p`. Then `f` is `ℓ`-cohomologically smooth if and only if:

1. for each strictly totally disconnected `X → Y, dim.trg f_X < ∞`;
2. for every strictly totally disconnected `X → Y` and every constructible étale sheaf `F` of `𝔽_ℓ`-vector spaces on `Y′ ×_Y X, Rⁱ f_{X!}F` is constructible on `X` for all `i ≥ 0`;
3. for every `X = Spa(C, C⁺) → Y` and quasicompact open `j : U → X`, with pullbacks `f_U` and `j′`, the map `j′_!Rf_U^!𝔽_ℓ → Rf_X^!j_!𝔽_ℓ` adjoint to `Rf_X!j′_!Rf_U^!𝔽_ℓ = j_!Rf_U!Rf_U^!𝔽_ℓ → j_!𝔽_ℓ` is an equivalence;
4. for every strictly totally disconnected `X → Y, Rf_X^!𝔽_ℓ ∈ D_ét(Y′ ×_Y X, 𝔽_ℓ)` is invertible.

Condition (1) is local on the target. ECD prints (1) as one finite bound `dim.trg f < ∞`, uniform over `Y`, and that is too strong over a non-quasicompact base. Take `Y = ⊔_{n≥1} Spa(C, O_C)` and `Y′ = ⊔_{n≥1} Bⁿ_C`, the `n`-dimensional perfectoid ball over the `n`-th copy. The map is smooth by v-locality on the cover by components, and locally of finite `dim.trg` because a quasicompact test meets only finitely many components, but its global `dim.trg` is infinite. When `Y` is spatial the printed bound and (1) agree, by spatial representability and local finiteness. (ECD Proposition 23.10 and its proof, pp. 145–146.)

*Proof route.* Given (2), condition (3) for quasicompact `U` implies it for all `U`, by the direct-sum criterion and a filtered colimit over quasicompact opens. By the direct-sum criterion, (2) is equivalent to `Rf_X^!` commuting with direct sums. With (3) this is criterion (3) of Section S4.1, equivalent to `τ_{f_X}` being an equivalence, and (4) supplies invertibility. Conversely, the definition gives (2) of Section S4.1 after each strictly totally disconnected base change. That target gives (1), (3) and (4) there, and the direct-sum criterion gives constructibility. Spatial representability makes each `Y′ ×_Y X` quasicompact, so local finiteness gives the finite bound for each `f_X`. ECD's proof of 24.1 checks exactly (1)–(4) for the ball.

*Needs:* other targets of Section S4.2; Section S4.1.

**Separated étale maps are smooth**. Every separated étale map `f : Y′ → Y` of small v-stacks is `ℓ`-cohomologically smooth for every `ℓ ≠ p`, with `Rf^! ≃ f^*` and `D_f ≃ Λ`; in particular open immersions are. `f` is eligible (Section S0.4), and `Rf^! ≃ f^*` (Section S3.3), so the definition holds with `D = Λ`. Open subsets of the ball are therefore smooth over `*`, by composition with Section S5.2. (Proof of ECD Proposition 23.4, p. 143, for `Rg^! = g^*`; proof of Theorem 25.1, p. 160, where open immersions are used as smooth maps.)

*Needs:* other targets of Section S4.2; Sections S0.4, S3.1.

### S4.3 The dualizing complex

In this section `f : Y′ → Y` is separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth, and `Λ` is `ℓ`-power torsion.

**`Rf^!` of a smooth map commutes with base change**. For any map `g : Ỹ → Y` of small v-stacks (ECD writes v-sheaves), with pullbacks `f̃` and `g′`, the base-change transformation `g′^*Rf^! → Rf̃^!g^*` of Section S3.4 is an equivalence; in particular `g′^*D_f ≃ D_{f̃}`. (ECD Proposition 23.12(iii) and its proof, pp. 147–149.)

*Proof route.* Over a strictly totally disconnected base `τ_f` is an equivalence with `Rf^!Λ` invertible (Section S4.1). So for `Y = X` and `Ỹ = X̃` strictly totally disconnected it suffices to show `g′^*D_f ≃ D_{f̃}`. By condition (4) of Section S4.1 (commutation with `j_*` for quasicompact opens) reduce to connected `X = Spa(C, O_C), X̃ = Spa(C̃, O_{C̃})` and `Y′` spatial. `Rf_!Rf^!𝔽_ℓ` is constructible, so `Hom(Rf_!Rf^!𝔽_ℓ, 𝔽_ℓ) = Hom(𝔽_ℓ, 𝔽_ℓ)` on `Y′` is finite and `π₀Y′` is finite; assume `Y′` connected. Then `Ỹ′` is connected (C6, ECD 19.5(iii)), and `D_f = L[n], D_{f̃} = L̃[ñ]` for local systems `L, L̃`. The comparison `g′^*L[n] → L̃[ñ]` is nonzero, via `RΓ(Y′_ét, 𝔽_ℓ) ≅ RΓ(Ỹ′_ét, 𝔽_ℓ)` (C6), so `ñ ≥ n`, with an isomorphism when equality holds; choose `C̃` maximising `ñ`, which is bounded by `3 dim.trg f`. Over `Spa(C, O_C)` use a v-hypercover `X̃•` with `X̃₀ = X̃` and hyperdescent (C2, ECD 17.3). `Rf_!` is termwise `Rf̃ᵢ_!`, and its termwise right adjoints preserve cartesian objects by the case already shown, so they form the right adjoint of the cartesian `Rf̃•_!`; this gives base change along `X̃ → X`. For general `Ỹ → Y`, cover by disjoint unions of strictly totally disconnected spaces and combine. For the ball, base change along `Spa(C′, O_{C′}) → Spa(C, O_C)` carries `Λ(1)[2]` to `Λ(1)[2]`.

*Needs:* Sections S3.4, S4.1, S4.2; `DiamondEtaleCohomology §C6.1`; `DiamondEtaleCohomology §C2.10`; `EnhancedDerivedSheaves §E3.4`.

**`Rf^!` is a twisted pullback**. `τ_f : Rf^!Λ ⊗_Λ f^* → Rf^!` is an equivalence of functors `D_ét(Y, Λ) → D_ét(Y′, Λ)`, and `Rf^!Λ` is invertible, étale locally `≃ Λ[n]`. In particular the a priori unspecified equivalence of the definition is the canonical `τ_f`, and the dualizing object is `Rf^!Λ`. (ECD Proposition 23.12(i) and its proof, pp. 147–149.)

*Proof route.* Over a strictly totally disconnected `Y = X` the definition gives (2) of Section S4.1, hence (1). By the `ℓ`-power-torsion statement, `τ_f` is then an equivalence over `ℤ/ℓᵐ`; reduction to `𝔽_ℓ` and detection of invertibility by reduction (Section S4.2) give invertibility over `ℤ/ℓᵐ`. General `ℓ`-power-torsion `Λ` is reached by extension of scalars from `ℤ/ℓᵐ` (Section S3.1); no ring map `Λ → 𝔽_ℓ` is used. By the first step of the base-change target, `Rf^!` commutes with pullback along a v-hypercover `X̃• → Y` by disjoint unions of strictly totally disconnected spaces. So `τ_f` can be checked after pullback to `X̃₀`, where it holds, and invertibility descends étale locally. For the ball, `Rf^!M = M(1)[2]` for every `Λ`-module `M`.

*Needs:* other targets of Section S4.3; Sections S3.1, S4.1, S4.2; `DiamondEtaleCohomology §C2.10`.

**The dualizing complex**. The dualizing complex of `f` is `D_f := Rf^!Λ ∈ D_ét(Y′, Λ)`. It is invertible, étale locally isomorphic to `Λ[n]` with `n` locally constant. The canonical transformation `τ_f : D_f ⊗_Λ f^* → Rf^!` is an equivalence, and `D_f` commutes with every base change: `g′^*D_f ≃ D_{f̃}`. At points where `f` is a smooth analytic map of relative dimension `d` (Section S5.5), `D_f ≅ Λ(d)[2d]`, of degree `−2d` when `Λ ≠ 0`. (ECD Proposition 23.12(i) and (iii), p. 147.)

The API consists of: the definition `D_f = Rf^!Λ`; its invertibility; the identification `Rf^! ≃ D_f ⊗_Λ f^*` via `τ_f`; base change; composition (`D_{f∘g} ≃ D_g ⊗ g^*D_f` for composable smooth maps, Section S4.4); the étale case (`D_f ≃ Λ` for separated étale `f`); and change of coefficients (for a map `Λ → Λ′` of `ℓ`-power-torsion rings, `D_f` over `Λ′` is `D_f ⊗_Λ Λ′`).

**Checks.**

- `D_{id} ≅ Λ`.
- For the ball `B → *, D_f ≅ Λ(1)[2]` (Section S5.2).
- For finite étale `f, D_f ≅ Λ` and `τ_f` is the identification `Rf^! = f^*`.
- Assume `S` infinite, `X` nonempty and `Λ ≠ 0`. For the profinite projection `q : S × X → X`, which is not smooth, `Rq^!Λ` is the sheaf of distributions on `S`, not étale-locally `Λ[n]`.

*Needs:* other targets of Section S4.3; Sections S3.1, S4.2.

**Perfect-constructibility**. If `f` is moreover quasicompact, then `Rf_!A ∈ D_ét(Y, Λ)` is perfect-constructible for every perfect-constructible `A ∈ D_ét(Y′, Λ)` (C7). No such statement is made for an arbitrary proper map. By base change and v-descent of perfect-constructibility (C7), assume `Y` strictly totally disconnected. Then `Y′` is spatial of bounded cohomological dimension (Section S1.4), and compact objects on both sides are the perfect-constructible complexes (`DiamondEtaleCohomology §C9.12`, ECD 20.17). `Rf_!` preserves compacts if and only if `Rf^!` preserves sums (`EnhancedDerivedSheaves §E3.3`), which holds since `Rf^! = D_f ⊗ f^*`. For example `RΓ_c(B × Spa(C, O_C), Λ) = Λ(−1)[−2]` is perfect, while for `S` infinite, `X` nonempty and `Λ ≠ 0, Rq_!Λ` is the constant sheaf with fibre `C⁰(S, Λ)`, which is not perfect. (ECD Proposition 23.12(ii) and its proof, pp. 147–149.)

**Checks.**

- For the ball the compactly supported coefficient complex is `Λ(−1)[−2]`, hence perfect.
- For a finite étale map of degree `m`, the coefficient pushforward is locally `Λ^m` in degree zero, hence perfect.
- For `S` infinite, `X` nonempty and `Λ ≠ 0, C⁰(S, Λ)` is not finitely generated; the proper profinite projection therefore does not satisfy the smooth conclusion. For the zero ring this module is perfect.

*Needs:* other targets of Section S4.3; Sections S1.4, S2.3; `DiamondEtaleCohomology §C9.12`; `DiamondEtaleCohomology §C7.14`; `DiamondEtaleCohomology §C7.22`; `EnhancedDerivedSheaves §E3.3`.

**Smooth maps are universally open**. `f` is universally open: for every `X → Y` the map `|Y′ ×_Y X| → |X|` is open. Reduce to `Y = X` strictly totally disconnected and `Y′` spatial. The image of `|Y′|` is generalizing, so it suffices that it is constructible. `Rf_!Rf^!𝔽_ℓ` is constructible, since `Rf^!𝔽_ℓ` is invertible (practical criterion (2)), and its support equals the image. If `s` is not in the image, `Rf^!𝔽_ℓ`, and hence `Rf_!Rf^!𝔽_ℓ`, lives over `X ∖ {s}`. If `s` is in the image, condition (3) with `U = X ∖ {s}` identifies the stalk at `s`, and `Hom(Rf_!Rf^!𝔽_ℓ|_s, 𝔽_ℓ) = Hom(Rf^!𝔽_ℓ|_s, Rf^!𝔽_ℓ) ≠ 0` because the fibre over `s` is nonempty. The origin of the perfectoid ball has non-open image, so its inclusion is not smooth; open immersions are smooth. (ECD Proposition 23.11 and its proof, p. 146.)

*Needs:* other targets of Section S4.3; Sections S4.1, S4.2; `DiamondsAndVStacks D4/spaces-and-surjectivity-for-small-v-stacks`; `DiamondEtaleCohomology §C7.3`.

### S4.4 Composition, descent and base change of smoothness

In this section all maps are separated maps of small v-stacks and `ℓ ≠ p`.

**Base change**. If `f : Y′ → Y` is representable in locally spatial diamonds and `ℓ`-cohomologically smooth and `g : Ỹ → Y` is any map, the pullback `f̃` is `ℓ`-cohomologically smooth. Compactifiability, representability and locally finite `dim.trg` are stable under base change (Section S0.4), and the condition over a strictly totally disconnected `X → Ỹ` is the condition for `X → Ỹ → Y`. For example `B × X → X` is smooth for every `X`. (ECD Proposition 23.15 and its proof, p. 150.)

*Needs:* Sections S0.4, S4.2.

**v-locality on the target**. Let `f : Y′ → Y` be representable in locally spatial diamonds with locally `dim.trg f < ∞`, and `g : Ỹ → Y` a surjective map of small v-stacks with pullback `f̃`. If `f̃` is `ℓ`-cohomologically smooth, so is `f`. Local finiteness of `dim.trg` is a hypothesis on `f` itself; ECD does not show that it can be checked v-locally. `f` is compactifiable by Section S0.2, hence eligible. Reduce to strictly totally disconnected `Y = X` and `Ỹ = X̃`, and use the hypercover argument of the base-change target with `X̃₀ = X̃` to identify `Rf^!` with the descended twisted pullback. Smoothness of `(Spa ℚ_p)^♢ → *` is deduced this way from its pullback to `Spa(C, O_C)` (Section S5.5). (ECD Proposition 23.15, converse, p. 150.)

*Needs:* Sections S0.2, S4.2, S4.3; `DiamondEtaleCohomology §C8.19`; `DiamondEtaleCohomology §C2.10`.

**Composition**. If `g : Y″ → Y′` and `f : Y′ → Y` are representable in locally spatial diamonds and `ℓ`-cohomologically smooth, then `f ∘ g` is representable in locally spatial diamonds and `ℓ`-cohomologically smooth, with `D_{f∘g} ≃ D_g ⊗ g^*D_f`. `f ∘ g` is eligible (Section S0.4). Over a strictly totally disconnected `X → Y, R(f∘g)_X^! ≃ Rg^!Rf^!` (Section S3.3), which is `D_g ⊗ g^*(D_f ⊗ f^*)` by the twist and base-change targets, applied to `g` over the non-perfectoid `Y′ ×_Y X`. For example `Bⁿ → *` is smooth with `D = Λ(n)[2n]`, as an iterated composite of balls. (ECD Proposition 23.13, first part, and its proof, pp. 149–150.)

*Needs:* Sections S0.4, S3.1, S4.2, S4.3.

**Descent along smooth surjections**. Let `g : Y″ → Y′` and `f : Y′ → Y` be separated, with `g` and `f ∘ g` representable in locally spatial diamonds and `ℓ`-cohomologically smooth. If `g` is surjective and `f` is representable in diamonds and compactifiable, then `f` is representable in locally spatial diamonds and `ℓ`-cohomologically smooth. The hypotheses on `f` and the surjectivity of `g` are part of the statement. (ECD Proposition 23.13, second part, and its proof, pp. 149–150.)

*Proof route.* Representability in locally spatial diamonds is checked after pullback to a strictly totally disconnected `Y` (D5, ECD 13.4). For a quasicompact open `V ⊂ Y″`, its image `U ⊂ Y′` is open, by universal openness of `g`, and quasicompact. `|U|` is the quotient of `|V|` by an open qcqs equivalence relation, so it is spectral with `|V| → |U|` spectral (`DiamondsAndVStacks D0/spectral-quotient-criterion`, ECD 2.10), and `U` is spatial (D5). Next, locally `dim.trg f ≤ dim.trg(f ∘ g) < ∞`, using the modified transcendence degree of C8. Over strictly totally disconnected `Y, Rg^!(Rf^!𝔽_ℓ) = R(f∘g)^!𝔽_ℓ = Rg^!𝔽_ℓ ⊗ g^*Rf^!𝔽_ℓ` is invertible and `Rg^!𝔽_ℓ` is invertible. Hence `g^*Rf^!𝔽_ℓ`, and so `Rf^!𝔽_ℓ` (`g` being surjective), is invertible. Finally `τ_f` is an equivalence after applying the conservative `Rg^! = Rg^!𝔽_ℓ ⊗ g^*`. For example, a compactifiable map representable in diamonds whose pullback along a smooth chart is the ball is smooth.

*Needs:* Sections S0.1, S3.1, S4.2, S4.3; `DiamondsAndVStacks D5/relative-representability`; `DiamondsAndVStacks D0/spectral-quotient-criterion`; `DiamondsAndVStacks D5/quasi-pro-etale-and-fibre-product-permanence`; `DiamondEtaleCohomology §C8.16`.

**Descent of representability, and the locally split case**. Let `f : Y′ → Y` be a separated `0`-truncated map of small v-stacks representable in diamonds, and `g : Y″ → Y′` a universally open (for instance `ℓ`-cohomologically smooth), separated and surjective map such that `f ∘ g` is representable in locally spatial diamonds. Then `f` is representable in locally spatial diamonds. If `g` is moreover locally split (Section S0.3), the hypothesis that `f` is compactifiable can be dropped from the previous target, by descent of compactifiability along locally split maps. Without local splitting this is not known; no implication from smoothness of `g` to local splitting is used. (ECD Remark 23.14 and the paragraph after it, pp. 149–150.)

*Proof route.* The first step of the previous proof uses only universal openness of `g`. For the second statement, `f` is separated and now representable in locally spatial diamonds, and `f ∘ g` is compactifiable because it is smooth, so Section S0.3 applies. A separated étale surjection `g` is locally split, so smoothness of `f` can be tested along it without assuming compactifiability.

*Needs:* other targets of Section S4.4; Sections S0.3, S4.2; `DiamondsAndVStacks D5/relative-representability`; `DiamondsAndVStacks D0/spectral-quotient-criterion`.

### S4.5 Smooth base change and exchange with smooth pullback

**Smooth base change**. Consider a cartesian square of small v-stacks with `g : X′ → X` separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth, `f : Y → X` arbitrary, and pullbacks `g̃ : Y′ → Y` and `f′ : Y′ → X′`. Let `Λ` be `ℓ`-power torsion (so `nΛ = 0` with `n` prime to `p`). Then for every `A ∈ D_ét(Y, Λ)` the base-change morphism `g^*Rf_*A → Rf′_*g̃^*A` is an isomorphism. By exceptional base change, `Rg^!Rf_* ≅ Rf′_*Rg̃^!`. With `Rg^! = D_g ⊗ g^*` and `Rg̃^! = D_{g̃} ⊗ g̃^*`, where `D_{g̃} = f′^*D_g`, this reads `D_g ⊗ g^*Rf_*A ≅ Rf′_*(f′^*D_g ⊗ g̃^*A) = D_g ⊗ Rf′_*g̃^*A`, using the projection formula for the invertible `D_g` (C3); cancel `D_g`. For `g : S × X → X` with `S` infinite and `X` nonempty, which is not smooth, only the quasicompact base change of C3 applies. (ECD Proposition 23.16(ii) and its proof, p. 151.)

**Checks.**

- For a one-point profinite fibre `g` is the identity and the exchange map is the identity.
- For a finite discrete fibre `g` is finite étale, and the exchange equivalence is tested on its individual sheets.
- For an infinite profinite fibre over a nonempty `X, g` is not smooth; this target supplies no exchange equivalence for it.

*Needs:* Sections S3.3, S4.3; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`.

**`Rf^!` commutes with smooth pullback**. In the cartesian square of smooth base change, assume `g` separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth, and `Λ ℓ`-power torsion. Assume also that `f` is compactifiable and representable in locally spatial diamonds with locally `dim.trg f < ∞`, so that `Rf^!` and `Rf′^!` are defined; ECD omits this hypothesis on `f`. Then for `A ∈ D_ét(X, Λ)` the map `g̃^*Rf^!A → Rf′^!g^*A`, adjoint to `Rf^!A → Rf^!Rg_*g^*A = Rg̃_*Rf′^!g^*A`, is an equivalence. (ECD Proposition 23.16(iii) and its proof, p. 151.)

*Proof route.* `f′` is eligible by base change, and `Rf^!Rg_* ≅ Rg̃_*Rf′^!` by exceptional base change for the eligible `f`. Tensor with the invertible `Rg̃^!Λ: g̃^*Rf^!A ⊗ Rg̃^!Λ = Rg̃^!Rf^!A = Rf′^!Rg^!A = Rf′^!(g^*A ⊗ Rg^!Λ) = Rf′^!g^*A ⊗ f′^*Rg^!Λ`, and `f′^*Rg^!Λ = Rg̃^!Λ`. Throughout, the coefficients are `Λ`; ECD's proof writes `𝔽_ℓ` in these formulas. ECD's proof of 24.6 applies this to `g : X̃ → X` an open subset of a ball over `X`.

*Needs:* Sections S0.4, S3.1, S3.3, S4.3.

**Smooth pullback commutes with internal `Hom`**. Let `f : Y → X` be separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth, and `Λ ℓ`-power torsion; ECD omits the coefficient hypothesis here, which its introduction states. There is a functorial isomorphism `f^*RHom(A, B) ≅ RHom(f^*A, f^*B)` for `A, B ∈ D_ét(X, Λ)`. `Rf^!` of an internal `Hom` gives `Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B)`, and `Rf^! = f^* ⊗ D_f` with `D_f` invertible; cancel `D_f`. ECD's proof of 25.1 uses this to transport biduality along a smooth surjection. (ECD Proposition 23.17 and its proof, p. 151.)

*Needs:* Sections S3.1, S4.3.

### Examples

- Separated étale maps: `D_f = Λ` and `τ_f` is the identification `Rf^! = f^*`.
- The ball and its products: `D = Λ(n)[2n]` for `Bⁿ → *`, compatible with every base change.
- The disjoint union `Y′ = ⊔_n Bⁿ_C` over `Y = ⊔_n Spa(C, O_C)`: smooth, locally of finite `dim.trg`, of infinite global `dim.trg`.
- For `S` infinite and `X` nonempty, the profinite projection `q : S × X → X` is not smooth; with `Λ ≠ 0, Rq^!` does not preserve sums and `τ_q` is not an equivalence. `R⁰q_!𝔽_ℓ` has nonconstructible fibre `C⁰(S, 𝔽_ℓ)`. For `S` finite, `q` is finite étale and `Rq^! = q^*`.
- The origin of the perfectoid ball: a closed immersion of `dim.trg 0` that is not smooth, because its image is not open.

### Dependencies

Layers S0–S3; `DiamondsAndVStacks` D0, D1, D3, D4, D5; `DiamondEtaleCohomology` C0, C2, C3, C6, C7, C8, C9; `EnhancedDerivedSheaves` E3; `ClassicalAdicEtaleCohomology`, Section 10.5 (one example); Mathlib `LocallyConstant.freeOfProfinite`.

## Layer S5: Examples of cohomologically smooth morphisms

The basic smooth map is the perfectoid ball `B → *`, with dualizing complex `Λ(1)[2]`. Its smoothness is checked through the practical criterion against Huber's trace and duality for curves. Smoothness then passes to quotients by profinite groups of pro-order prime to `ℓ`, free and non-free; this gives smooth morphisms of analytic adic spaces, through the compatible-root torus, and `(Spa ℚ_p)^♢ → *`, through the punctured disc. The layer ends with a criterion over a general perfectoid base (ECD 24.1–24.6). Throughout, `ℓ ≠ p`.

### S5.1 The perfectoid ball and Tate twists

**The absolute perfectoid ball**. `B` is the v-sheaf on `Perf` with `B(R, R⁺) = R⁺` for affinoid perfectoid `Spa(R, R⁺)`, extended by gluing; it is a v-sheaf because `O⁺` is (D2). Let `f : B → *` be its structure map. For affinoid perfectoid `X = Spa(R, R⁺)`,

```text
B × X = Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩),
```

the perfectoid closed unit ball over `X`; in characteristic `p` the `p`-power roots of `T` exist uniquely. For `X` perfectoid, `B × X` is the diamond of the relative closed unit ball `B_X` of A2. `B` is not the ordinary analytic disc over a mixed-characteristic base; the comparison with `B_Y^♢` for analytic `Y` over `ℤ_p` goes through Section S5.5. `B → *` is separated and compactifiable. Its canonical compactification is `R ↦ R°` (C4, ECD 18.6), into which `B` is the open subfunctor `{|T| ≤ 1}`: the pullback along `t ∈ R°` is the rational subset `{|t| ≤ 1}` of `Spa(R, R⁺)`. It is representable in spatial diamonds with `dim.trg 1`, since completed residue fields of the perfectoid ball have modified topological transcendence degree `≤ 1` over the base (C8). The compactifiability check is needed in ECD's proof of 24.1, where Proposition 23.10 is applied, and is not written there. (ECD Theorem 24.1 and its proof, p. 152.)

The API consists of: the functor of points (maps `Spa(R, R⁺) → B` are the elements of `R⁺`); the displayed formula for products with affinoids; the comparison `B × X ≅ (B_X)^♢` for perfectoid `X`; compactifiability, with canonical compactification `R ↦ R°` and `B ⊂ B‾` the open `{|T| ≤ 1}`; spatial eligibility, with `dim.trg 1`; the universal coordinate `T ∈ O⁺(B)`; and the open disc: for `K = 𝔽_p((t^{1/p^∞}))^∧` and `C` complete algebraically closed of characteristic `p`, the punctured open unit disc `D_C^× = Spa(K, O_K) × Spa(C, O_C)` is an open subspace of `B × Spa(C, O_C)` (proof of ECD 24.5).

**Checks.**

- `B(Spa(C, C⁺)) = C⁺` for a perfectoid field `C`.
- `B → *` is not partially proper: the canonical compactification `B‾(R, R⁺) = R°` differs from `B(R, R⁺) = R⁺` whenever `R⁺ ≠ R°`. In particular `B(Spa(C, C⁺)) = C⁺ ≠ B‾(Spa(C, C⁺)) = O_C` for `C⁺ ≠ O_C`.
- `dim.trg(B → *) = 1`.
- `B × Spa(C, O_C)` is the perfectoid closed unit disc `Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)` over `C`.

*Needs:* Section S0.1; `DiamondsAndVStacks D2/v-descent-of-functions`; `DiamondsAndVStacks D6/gluing-and-the-diamond-functor`; `AdicEtaleGeometry A2/relative-closed-polydisc`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`; `DiamondEtaleCohomology §C8.16`; `DiamondEtaleCohomology §C8.14`.

**Tate twists**. Let `n` be prime to `p` and `Λ` a ring with `nΛ = 0`. `μ_n` is the étale sheaf on `*` of `n`-th roots of unity, `μ_n(R, R⁺) = {x ∈ R : xⁿ = 1}`. It is finite étale over `*`, represented by the finite étale `𝔽_p`-algebra `𝔽_p[x]/(xⁿ − 1)` since `n` is invertible, and split over every algebraically closed perfectoid field. Set `Λ(1) := Λ ⊗_{ℤ/n} μ_n, Λ(d) := Λ(1)^{⊗d}` for `d ≥ 0` and `Λ(−d) := RHom(Λ(d), Λ)`; for a small v-stack `Y, Λ_Y(d)` is the pullback to `Y`. `Λ(d)` is invertible and étale locally `≅ Λ`, by a local choice of a primitive `n`-th root of unity, and over `Spa(C, C⁺)` a compatible choice of roots of unity trivialises it. The definition does not depend on `n` with `nΛ = 0`. For `m | n` with `mΛ = 0`, the comparison is the power map `μ_n → μ_m, ζ ↦ ζ^{n/m}`: étale locally it sends a primitive `n`-th root to a primitive `m`-th root and identifies `μ_n/mμ_n` with `μ_m`, giving `Λ ⊗_{ℤ/n} μ_n ≅ Λ ⊗_{ℤ/m} μ_m`. The inclusion `μ_m ⊂ μ_n` does not give this comparison. Power maps compose, so any two annihilating integers prime to `p` are compared through a common multiple. Under the equivalence of étale sites of D6, `Λ(1)` is the classical twist `Λ ⊗ μ_n` of `ClassicalAdicEtaleCohomology`. (ECD Theorem 24.1 and its proof, p. 152, where the normalisation `Λ(1)[2]` and the twisted trace use this twist.)

The API consists of: `Λ(0) = Λ`; additivity (`Λ(a) ⊗ Λ(b) ≅ Λ(a + b)` for `a, b ∈ ℤ`); invertibility; pullback (`f^*Λ_Y(d) ≅ Λ_{Y′}(d)`); trivialisation (over `Spa(C, C⁺)`, a compatible system of primitive roots of unity gives `Λ(d) ≅ Λ`); and the classical comparison (for an analytic adic space `Y` over `ℤ_p, Λ_{Y^♢}(1)` corresponds to Huber's `Λ ⊗ μ_n`).

**Checks.**

- Even on a base where `𝔽_ℓ(1)` is nonconstant, `𝔽_ℓ(1) ⊗ 𝔽_ℓ(−1) ≅ 𝔽_ℓ`: the negative twist carries the dual character.
- Over `Spa(C, O_C)` with `C` algebraically closed, `H⁰(Spa(C, O_C), Λ(1)) ≅ Λ`, non-canonically. For `p` odd and `Λ = 𝔽₂`, compare `n = 4` with `n = 2`. The square map `μ₄ → μ₂` induces an isomorphism on twists, whereas the inclusion `μ₂ → μ₄` lands in the squares and induces zero after reduction modulo `2`.
- Over `(Spa ℚ_p)^♢` with `ℓ` odd and `μ_ℓ ⊄ ℚ_p (p ≢ 1 mod ℓ), 𝔽_ℓ(1)` is not isomorphic to `𝔽_ℓ: Gal(ℚ̄_p/ℚ_p)` acts on `μ_ℓ` through a nontrivial character, so `H⁰((Spa ℚ_p)^♢, 𝔽_ℓ(1)) = 0`.

*Needs:* Section S4.2; `DiamondsAndVStacks D3/etale-and-quasi-pro-etale-morphisms-of-stacks`; `DiamondsAndVStacks D6/etale-site-comparison`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.8`; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C3.11`.

### S5.2 Cohomological smoothness of the ball

**The ball is smooth with dualizing complex `Λ(1)[2]`**. The structure map `f : B → *` is `ℓ`-cohomologically smooth for every prime `ℓ ≠ p`. For every ring `Λ` with `nΛ = 0` (`n` prime to `p`) there is a canonical isomorphism `D_f = Rf^!Λ ≅ Λ(1)[2]`, adjoint to the trace `Rf_!Λ(1) → Λ[−2]` obtained from Huber's trace by base change; for the isomorphism, decompose `Λ` into its `ℓ`-primary parts. This concerns the absolute perfectoid ball. Ordinary analytic discs over a mixed-characteristic base are treated in Section S5.5. (ECD Theorem 24.1 and its proof, pp. 152–153; Huber 1996, Theorems 7.2.2 and 7.5.3 and Lemma 7.5.4, pp. 368 and 390–396.)

*Proof route.* Check the practical criterion of Section S4.2.

1. `dim.trg f = 1` (Section S5.1), and `f` is compactifiable.
2. Constructibility. For `X` strictly totally disconnected and `F` constructible on `B × X`, choose `X → Spa(K, O_K)` with `K = 𝔽_p((ϖ^{1/p^∞}))^∧`, factoring through `Spa(C, O_C)` for `C` the completed algebraic closure; this is possible because `X` has no nonsplit finite étale covers. Write `X = lim Xᵢ` with `Xᵢ` of topologically finite type and descend `F` to `Fᵢ` (C7, ECD 20.7). Then `Rʲ f_{X!}F = g^*Rʲ f_{Xᵢ!}Fᵢ` by base change and the classical comparison, and this is constructible by `ClassicalAdicEtaleCohomology`, Section 10.5 (Huber 1996, Theorem 6.2.2, p. 329).
3. Over `X = Spa(C, C⁺)`, use the curve duality with an open coefficient of `ClassicalAdicEtaleCohomology`, Section 9.6. For every `G` in the unbounded derived category of the curve, the trace identifies `RHom(G, j′_!𝔽_ℓ(1)[2])` with `RHom(Rf_!G, j_!𝔽_ℓ)`. The exceptional adjunction then gives the open-extension comparison of condition (3) by Yoneda. Restricting to `G` of the form `j′_!G_U` would not suffice. Huber 1996, Theorem 7.5.3 and Lemma 7.5.4, give the natural classical trace map at arbitrary `C⁺`.
4. Huber's trace `Rf_{C!}𝔽_ℓ(1) → 𝔽_ℓ[−2]` (`ClassicalAdicEtaleCohomology`, Section 9.2, with `Rⁱ f_{C!} = 0` for `i > 2` by Section 8.4) pulls back to `X`, and adjunction gives `α : 𝔽_ℓ(1)[2] → Rf_X^!𝔽_ℓ`. By (3) and Section S4.1, `Rf_X^!𝔽_ℓ` commutes with quasi-pro-étale base change, so `α` can be checked on connected components `Spa(C, C⁺)`. There it is Huber's duality, using the constancy of the top trace across the plus ring (`ClassicalAdicEtaleCohomology`, Section 9.6).

Canonicity: `α` is adjoint to the base-changed trace and independent of choices; for general `Λ` use the twist target of Section S4.3 and the `ℓ`-primary decomposition. For example `R²f_!Λ(1) ≅ Λ` on `B × Spa(C, O_C)`, and the ball over any strictly totally disconnected `X` has `D ≅ Λ(1)[2]`.

*Needs:* Sections S2.3, S4.1, S4.2, S4.3, S5.1; `ClassicalAdicEtaleCohomology`, Sections 8.4, 9.2, 9.5, 9.6 and 10.5; `DiamondEtaleCohomology §C7.3`; `DiamondEtaleCohomology §C7.8`; `DiamondsAndVStacks D1/strictly-totally-disconnected`.

### S5.3 Profinite quotients: geometry, unit quotient orders and averaging

**Quotients by profinite group actions**. Let `f : Y′ → Y` be separated and representable in locally spatial diamonds, and `K` a profinite group acting on `Y′` over `Y` such that the map `K × Y′ → Y′ ×_Y Y′` is `0`-truncated and qcqs; it is an injection for a free action. Let `Y′/K` be the quotient of `Y′` by the image equivalence relation and `q : Y′ → Y′/K` the quotient map. Then:

1. `Y′/K` is a small v-stack and `f/K : Y′/K → Y` is separated and representable in locally spatial diamonds; over a strictly totally disconnected base `Y = X, Y′/K` is locally spatial and quasiseparated;
2. `q` is proper and quasi-pro-étale, so `Rq_! = Rq_* = q_*` is exact; for a free action `q` is a `K`-torsor;
3. if `f` is compactifiable, so is `f/K`, with canonical compactification `(Y′)‾^{/Y}/K`; and locally `dim.trg f/K =` locally `dim.trg f`. In particular `f/K` is eligible when `f` is.

This is the image-relation quotient, not the stack quotient retaining stabilizers. (Proofs of ECD Propositions 24.2, p. 153, and 24.3, p. 155.)

*Proof route.* Reduce to `Y = X` strictly totally disconnected. The image relation is a qcqs equivalence relation on `Y′` whose projections are images of the quasi-pro-étale projection `K × Y′ → Y′`. So the quotient is a small v-sheaf with `|Y′/K| = |Y′|/K` (D4, quotients by group actions and by pro-étale equivalence relations). It is spectral on quasicompact opens by the spectral-quotient criterion (`DiamondsAndVStacks D0/spectral-quotient-criterion`, ECD Lemma 2.10, since the relation is open and qcqs) and spatial by `DiamondsAndVStacks D5/spatial-v-sheaf-criterion`. For a free action, `q` is a `K`-torsor (`DiamondsAndVStacks D3/locally-profinite-torsors`, ECD Lemma 10.13). `q` is quasicompact because `K` is compact, and separated and universally closed by the valuative criterion, with images of closed `K`-stable subsets closed; it is quasi-pro-étale because its pullback along itself is the image of `K × Y′ → Y′`. Separatedness of `f/K` is the valuative criterion. The compactification statement holds because `(Y′)‾^{/Y} → (Y′)‾^{/Y}/K` is a quotient map, so the inclusion `Y′/K → (Y′)‾^{/Y}/K` is open; `dim.trg` is unchanged because `q` does not change completed residue fields.

**Checks.**

- A trivial `K`-action gives the image-relation quotient `Y′` and `q = id`, including for nontrivial `K`.
- Translation on `K × X` gives quotient `X`; for finite `K, q` is finite étale.
- For `K = ℤ_r` and `X = Spa(C, O_C)`, translation still gives quotient `X`, but `q` is not étale, since its fibre is infinite and not discrete.

*Needs:* Sections S0.1, S0.4; `DiamondsAndVStacks D0/spectral-quotient-criterion`; `DiamondsAndVStacks D3/locally-profinite-torsors`; `DiamondsAndVStacks D4/quotient-presentations-of-diamonds`; `DiamondsAndVStacks D4/small-quotients-and-underlying-spaces`; `DiamondsAndVStacks D5/spatial-v-sheaf-criterion`; `DiamondsAndVStacks D5/relative-representability`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.15`; `DiamondEtaleCohomology §C8.16`.

**Finite quotient orders are units**. Let `K` be a profinite group whose supernatural order `TauCeti.profiniteOrder K` has exponent `0` at `ℓ`, and `Λ` an `ℓ`-power-torsion ring. Every finite continuous quotient `K/U` has order dividing the supernatural order (Tau Ceti `ofNat_card_quotient_le_profiniteOrder`), so its order is prime to `ℓ` and a unit in `Λ`. Unlike the `HasUnitProOrder` predicate of SmoothRepresentationsOfLocalGroups, Section SR.0.3, this target deduces its unit condition from a primewise supernatural-order hypothesis and nilpotence of `ℓ` in `Λ`. Compactness makes every open subgroup have finite index; an open subgroup of a noncompact group can have infinite index. The averaging construction below uses the normalised measure supplied at the boundary. (ECD Proposition 24.2 and its proof, p. 153.)

**Checks.**

- For `K` trivial, its only quotient has order `1`, a unit in every `Λ`, including the zero ring.
- For `K = ℤ_p, ℓ ≠ p` and `Λ = 𝔽_ℓ`, the quotient by `pᵏℤ_p` has order `pᵏ`, a unit. For `p = 2, ℓ = 5` and `k = 1` its inverse is `3` in `𝔽₅`.
- For `K = ℤ/m` with `ℓ ∤ m`, the order of each quotient divides `m` and is a unit in `Λ`.
- For `K = ℤ_ℓ` and `Λ = 𝔽_ℓ`, the quotient by `ℓℤ_ℓ` has order `ℓ = 0` in `Λ`, which is not a unit. The pro-order hypothesis excludes this case.

*Needs:* Tau Ceti `TauCeti.profiniteOrder`, `ofNat_card_quotient_le_profiniteOrder`, `Subgroup.profiniteIndex`, `Subgroup.profiniteOrder_eq_mul_profiniteIndex`, `OpenSubgroup.profiniteIndex_eq_ofNat_index`; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups`, Layer SR.0.3; Mathlib `Subgroup.index`.

**The averaging transformation**. Let `f : Y′ → Y` be eligible, `K` a profinite group of pro-order prime to `ℓ` acting on `Y′` over `Y` as in the quotient target, `q : Y′ → Y′/K` the quotient map and `Λ ℓ`-power torsion. Construct a natural transformation `α_q : q^* → Rq^!` of functors `D_ét(Y′/K, Λ) → D_ét(Y′, Λ)`, adjoint to a trace `Rq_!q^* = Rq_*q^* = q_*q^* → id`. For free actions the trace is the colimit, over open `H ⊂ K`, of the normalised finite-level traces `[K : H]^{−1}tr_{H,K} : q_{H,K*}q_{H,K}^* → id` for `q_{H,K} : Y′/H → Y′/K`; these are compatible in `H`, and `q_*q^* = colim_H q_{H,K*}q_{H,K}^*` by continuity (C0). In general, `q_*Λ → Λ` is integration over the `K`-action with respect to `μ_K`, defined v-locally on the quotient and descended; the fibres are `K`-orbits with stabilizers, not necessarily products with `K`. Compose the induced `Λ → Rq^!Λ` with `τ_q` (Section S3.4) and use the adjunction. The construction does not require `f` to be smooth; smoothness enters in the next section. (Proofs of ECD Propositions 24.2, p. 153, and 24.3, p. 155.)

The API consists of: the trace description (`α_q` is adjoint to the normalised trace `q_*q^* → id`); the finite case; splitting (the composite `F → q_*q^*F → F` of the unit `η_*` of `q^* ⊣ q_*` and the normalised trace is the identity, so `R(f/K)_!F` is a direct summand of `Rf_!q^*F`); base change along `Ỹ → Y`; and restriction to subgroups. Restriction to subgroups says: for a free action and an open `H ⊂ K`, the normalised trace for `q` is the composite of those for `q_H : Y′ → Y′/H` and `q_{H,K} : Y′/H → Y′/K`. Taking mates, `α_q` is `q_H^*α_{q_{H,K}}` followed by `α_{q_H}` evaluated at `Rq_{H,K}^!`; the factor `[K : H]^{−1}` is already in `α_{q_{H,K}}` and is not applied a second time. The finite case says: for a free action of a finite `K` of order `m` prime to `ℓ`, identify `Rq^! ≃ q^*` by Section S3.3; then `α_q` is multiplication by `m⁻¹` on `q^*`, not the identification itself, and its adjoint trace is `m⁻¹` times the sum over the fibre. For a finite fibre this is the normalised summation of Section S3.4.

**Checks.**

- For `K` trivial, `α_q` is the identity of `id^* = id^!`.
- For `K = ℤ/m (ℓ ∤ m)` acting freely, under `Rq^! ≃ q^*, α_q` is multiplication by `m⁻¹`, the trace `q_*q^*Λ → Λ` is `m⁻¹` times the sum over the fibre, and trace composed with unit is the identity. `Λ = 𝔽₅` and `m = 2` distinguish `α_q` from the canonical identification.
- Take `K = ℤ_r` for a prime `r ≠ ℓ, Λ = 𝔽_ℓ` and `X = Spa(C, O_C)`, with `K` acting freely by translation on `Y′ = K × X` over `X`. Then `q : Y′ → X` is proper and quasi-pro-étale, and `α_q : q^* → Rq^!` is not an equivalence, because `Rq^!Λ` is the sheaf of distributions (Section S5.4). Here `q` is not `ℓ`-cohomologically smooth, so the quotient theorems of Section S5.4 assert nothing for it.
- Assume `Λ ≠ 0`. For `K = ℤ_ℓ` there is no normalised measure, and the construction does not apply.

*Needs:* other targets of Section S5.3; Sections S0.4, S1.2, S3.1, S3.4; `DiamondEtaleCohomology §C8.22`; `DiamondsAndVStacks D3/locally-profinite-torsors`; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C2.3`.

### S5.4 Free and non-free quotients

**Quotients by free actions**. Let `f : Y′ → Y` be separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth, and `K` a profinite group of pro-order prime to `ℓ` acting freely on `Y′` over `Y` (`K × Y′ → Y′ ×_Y Y′` injective). Then `f/K : Y′/K → Y` is separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth. For `Λ ℓ`-power torsion and the normalised Haar measure there is a natural equivalence `Rf^! ≃ q^*R(f/K)^!` of functors `D_ét(Y, Λ) → D_ét(Y′, Λ)`. ECD omits the hypothesis that `Λ` is `ℓ`-power torsion here, though its introduction states it. `Rq^!` need not be `q^*` for infinite fibres (next target); for finite `K` the quotient map is finite étale and `Rq^! = q^*`. (ECD Proposition 24.2 and its proof, pp. 153–155.)

*Proof route.* By the quotient target, `f/K` is eligible with locally `dim.trg f/K = dim.trg f`. Reduce to `Y = X` strictly totally disconnected. The transformation `q^*R(f/K)^! → Rq^!R(f/K)^! = Rf^!` is built from `α_q` and the composition law. It is an equivalence for `𝔽_ℓ`: check locally on `Y′` (spatial), and test against constructible `F` (`DiamondEtaleCohomology §C9.13`, ECD 20.10). Descend `F` to `F_H` on `Y′/H` (C7, ECD 20.7) and compute `Hom(F, q^*R(f/K)^!A)` as `colim_{H′} Hom(R(f/H′)_!F_{H′}, A)`. The system `R(f/H′)_!F_{H′}` has split injective transition maps (by the normalised traces) and colimit `Rf_!F`, which is compact. Hence it is eventually constant and equal to `Rf_!F`, which gives `Hom(F, q^*R(f/K)^!A) = Hom(F, Rf^!A)`. Then `f/K` satisfies criterion (3) of Section S4.1 and `R(f/K)^!𝔽_ℓ` is invertible, so `f/K` is smooth. For example `T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p` for the compatible-root torus (Section S5.5); a pro-`ℓ` group is excluded.

**Checks.**

- For the trivial group `q` is the identity and the comparison is the identity.
- For a free finite action of order `m` prime to `ℓ, q` is finite étale; averaging scales the comparison by the unit `m⁻¹`.
- The compatible-root torus over `C_p` has free `ℤ_p`-action and smooth quotient for `ℓ ≠ p`, while its infinite-fibre quotient map `q` is not smooth.

*Needs:* Sections S3.1, S4.1, S4.2, S5.3; `DiamondEtaleCohomology §C9.13`; `DiamondEtaleCohomology §C7.3`; `DiamondEtaleCohomology §C7.8`; `DiamondsAndVStacks D3/locally-profinite-torsors`.

**`Rq^!` is a sheaf of distributions**. In the situation of free quotients one also has `Rf^! = Rq^!R(f/K)^!`, but `Rq^! ≠ q^*` in general. After base change, `q` becomes `q : S × Spa(C, O_C) → Spa(C, O_C)` for a profinite set `S` and algebraically closed `C`. Then `Rq^!Λ` is the sheaf on `S` whose value on an open and closed `T ⊂ S` is the module of distributions `Hom_Λ(C⁰(T, Λ), Λ)`. A Haar measure gives a natural map `q^* → Rq^!` (Section S5.3), which need not be an isomorphism. So statements about `Rf^!` must be made after composing with the structure map of the quotient, as in the free-quotient target. (ECD, the remark after Proposition 24.2, p. 153.)

*Proof route.* `Rf^! = Rq^!R(f/K)^!` is the composition law for `f = (f/K) ∘ q`; `q` is eligible, being proper, quasi-pro-étale and of `dim.trg ≤ 0`. For `T ⊂ S` open and closed, `Hom(Λ_T, Rq^!Λ) = Hom(Rq_!Λ_T, Λ) = Hom(C⁰(T, Λ), Λ)`, using `Rq_! = Rq_*` and the profinite-projection lemma of Section S4.1. For `S = ℤ_r (r ≠ ℓ)` and `Λ = 𝔽_ℓ`, the Dirac distribution at a point is not given by a locally constant density against Haar measure. A density whose integral vanishes on every clopen set avoiding the point vanishes there, hence, being locally constant, also near the point. So the averaging map is not surjective and the distribution sheaf is not a rank-one local system. For the zero ring both sides are zero, and no non-isomorphism is claimed. For `S` finite of size `m, Rq^!Λ = Λ^S = q^*Λ`.

**Checks.**

- For `S` finite, including empty, `Rq^! = q^*`; on the whole fibre both coefficient sections are `Λ^S`.
- For `S = ℤ_r` with `r ≠ ℓ` and `Λ = 𝔽_ℓ`, a Dirac distribution is not a locally constant density against normalised Haar measure.
- For `Λ = ℤ/1` every distribution module is zero, so it agrees with the zero pullback sheaf.

*Needs:* other targets of Section S5.4; Sections S1.2, S3.1, S4.1.

**Quotients by non-free actions**. Let `f : Y′ → Y` be separated, representable in locally spatial diamonds and `ℓ`-cohomologically smooth. Let `K` be a profinite group of pro-order prime to `ℓ` acting on `Y′` over `Y` with `K × Y′ → Y′ ×_Y Y′ 0`-truncated and qcqs, and `Y′/K` the image-relation quotient. Then `f/K` is separated and representable in locally spatial diamonds (Section S5.3). Assume moreover that for every complete algebraically closed `C` with open bounded valuation subring `C⁺` and every `Spa(C, C⁺) → Y`, the pullback `Y′/K ×_Y Spa(C, C⁺) → Spa(C, C⁺)` is `ℓ`-cohomologically smooth. Then `f/K` is `ℓ`-cohomologically smooth and, for `Λ ℓ`-power torsion and the normalised Haar measure, `Rf^! ≃ q^*R(f/K)^!`; as for free actions, ECD omits the coefficient hypothesis. (ECD Proposition 24.3 and its proof, pp. 155–156.)

*Proof route.* Write `g = f/K`. It is compactifiable, representable in locally spatial diamonds with locally `dim.trg g = dim.trg f` (Section S5.3). Check the practical criterion with `Y = X` strictly totally disconnected and `Y′` quasicompact. Condition (1) is clear. For (2), unit followed by the normalised trace is the identity, so `Rg_!F` is a direct summand of the constructible `Rf_!q^*F` for constructible `F` on `Y′/K`. Condition (3) follows from the smoothness of the geometric quotient fibres. Consequently `Rg^!` commutes with quasi-pro-étale base change (Section S4.1).

For (4), check the specified averaging comparison on each geometric base `S = Spa(C, C⁺)`, where both `f_S` and `g_S` are smooth. First take `Λ = 𝔽_ℓ` and put `D_f = Rf_S^!Λ` and `D_g = Rg_S^!Λ`. The map `β : q_S^*D_g → D_f` is `α_{q_S}` evaluated at `D_g`, followed by the composition isomorphism. Both objects are invertible. If `β` vanished at one geometric point over `z` of the quotient, `K`-equivariance and transitivity on that geometric orbit would make it vanish over the whole fibre of `q_S`. The fibre is a profinite orbit and `q_{S*}` is exact; proper base change would therefore make `(q_{S*}β)_z` zero. But the composite `D_g → q_{S*}q_S^*D_g → q_{S*}D_f → D_g` is the identity: by adjunction it is precisely unit followed by the normalised trace. Hence `β` is nonzero at every geometric stalk. A nonzero degree-zero map between shifts of one-dimensional `𝔽_ℓ`-vector spaces forces equal shifts and is an isomorphism. The twisted-pullback and projection-formula coherences identify the comparison on every `A ∈ D_ét(S, 𝔽_ℓ)` with `β ⊗ f_S^*A`, so this particular averaging comparison is an equivalence. Extend to `ℓ`-power-torsion `Λ` using Section S4.3 and compatibility of averaging with coefficients. Quasi-pro-étale base change now gives (4) and the claimed equivalence globally. For example, `T_Y` for `Y` over `Spa ℤ_p^cycl` is the quotient of the compatible-root torus `T̃_Y` by a non-free `ℤ_p`-action (Section S5.5).

**Checks.**

- For a trivial action, including nontrivial `K, q = id` and integration of a constant with total Haar volume `1` makes the comparison the identity.
- For a free finite action of order `m` prime to `ℓ`, the comparison is scaled by `m⁻¹` under the canonical étale identification; for `m = 2` and `Λ = 𝔽₅` the scalar is `3`, not `1`.
- For the compatible-root torus over `Spa ℤ_p^cycl`, the action on characteristic-`p` fibres is trivial, while over `C_p` it is free. The normalised unit–trace identity applies in both cases and detects the comparison on both types of fibre.

*Needs:* other targets of Section S5.4; Sections S3.1, S3.4, S4.1, S4.2, S4.3, S5.3; `DiamondEtaleCohomology §C5.9`; `DiamondEtaleCohomology §C8.22`; `DiamondEtaleCohomology §C7.3`.

### S5.5 Smooth analytic maps, `Spd ℚ_p` and the geometric-base criterion

**Approximation by relative balls**. Let `X′ → X` be a morphism of affinoid perfectoid spaces of characteristic `p`. Construct a small cofiltered system `X̃ᵢ → X` of affinoid open subspaces of finite-dimensional perfectoid balls `B^{nᵢ} × X`, with qcqs transition maps over `X` and compatible maps `X′ → X̃ᵢ` inducing `X′ ≅ limᵢ X̃ᵢ` as v-sheaves. The integers `nᵢ` need not be bounded. (ECD, proof of Proposition 24.6, p. 157.)

*Construction.* Write `X = Spa(A, A⁺), X′ = Spa(A′, A′⁺)`, and fix a pseudouniformizer `ϖ` in `A`. Use finite subsets of `A′⁺` as integral coordinates in perfected Tate algebras over `A`; their `p`-power roots are unique in characteristic `p`. Refine these finite coordinate sets by finitely many rational inequalities expressing bounds in `A′⁺` and approximating relations: a relation `P = 0` is imposed through `|P| ≤ |ϖ|^m` for increasing `m`. Common refinements take the union of the coordinates and inequalities. The resulting rational neighbourhoods of the image of `X′` are affinoid opens in relative perfectoid balls, with affinoid, hence qcqs, transitions. Prove that the completed colimit of their coordinate pairs is `(A′, A′⁺)`, including its ring of integral elements, and that a compatible family of maps from an affinoid perfectoid test space factors uniquely through `X′`. This identifies the v-sheaf limit. D5.3 supplies the subsequent finite-stage étale comparisons once this presentation has been constructed.

**Checks.**

- For `X′ = X` with the identity map, the constant system with `nᵢ = 0` recovers `X`.
- For evaluation at zero `Spa(K, O_K) → B_K` over a characteristic-`p` perfectoid field `K`, the rational opens `{|T| ≤ |ϖ|^m}` of `B_K` have limit the zero section. They are opens of the relative zero-dimensional ball over `X = B_K`; the zero section itself is not open.
- For `X′ = Spa(K⟨T_j^{1/p^∞} : j ∈ ℕ⟩, O_K⟨T_j^{1/p^∞} : j ∈ ℕ⟩)` over `Spa(K, O_K)`, the finite-coordinate balls recover `X′` in the limit. The dimensions of these stages are unbounded as the finite subsets of `ℕ` grow.

*Needs:* Section S5.1; `PerfectoidSpaces P1/perfected-tate-algebra`; `PerfectoidSpaces P2/rational-localization-in-characteristic-p`; `DiamondsAndVStacks D5/limits-and-finite-stage-comparisons`.

**Smooth analytic maps are cohomologically smooth**. Let `f : Y′ → Y` be a separated smooth morphism of analytic adic spaces over `Spa ℤ_p`. Smooth means locally on `Y′` an étale map `Y′ → Bⁿ_Y` followed by the projection `Bⁿ_Y → Y` (A2, Huber 1996, Corollary 1.6.10, p. 80), where `Bⁿ_Y = Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩)` over affinoid `Y = Spa(A, A⁺)`. Then `f^♢ : (Y′)^♢ → Y^♢` is `ℓ`-cohomologically smooth for every `ℓ ≠ p`. (ECD Proposition 24.4 and its proof, p. 156.)

*Proof route.* `f^♢` is representable in locally spatial diamonds (D6, ECD 15.6), and the ball charts give separated local pieces and the finite local dimension bounds of C8. Compactifiability of the ball projections comes from the ball and quotient results below; compactifiability of separated étale maps alone does not give it for a ball projection. Products reduce to dimension one, and `B_Y` is covered by the tori `T_Y = {|T| = 1}` and `{|T − 1| = 1}` (A2). In characteristic `p, T_Y^♢` is an open subspace of `B × Y^♢`, so the ball target and base change apply. Over `ℚ_p`, after base change to `C_p` (v-locality on the target), the compatible-root torus `T̃_{C_p} = Spa C_p⟨T^{±1/p^∞}⟩` is a `ℤ_p`-torsor over `T_{C_p}`. So `T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p` with `T̃^♢` open in a ball over `(Spa C_p)^♢`, and the free-quotient target applies, `ℤ_p` having pro-order prime to `ℓ`. In mixed characteristic, v-locally `Y` lives over `Spa ℤ_p^cycl`, and `T_Y` is the quotient of `T̃_Y` by a non-free `ℤ_p`-action whose geometric fibres were just shown to be smooth. The non-free-quotient target applies, and descent along the v-cover uses v-locality on the target, `dim.trg` being finite for smooth adic maps (`DiamondEtaleCohomology §C8.15`). The ball, free-quotient and non-free-quotient steps supply compactifiability and smoothness of each local projection. Compose with the separated étale charts (Sections S0.2 and S4.4) and conclude by locality on the source for open covers (Section S0.2), with local finiteness of dimension retained from the charts. The composition law and the étale comparison of Section S3.3 identify the dualizing twists on overlapping charts, so the twisted-pullback criterion glues on the open source cover. For example, smooth rigid curves over `C` and their open subsets are smooth over `Spa(C, O_C)`, the input of Layer S6.

*Needs:* Sections S0.1, S0.2, S3.1, S4.2, S4.4, S5.2, S5.4; `AdicEtaleGeometry A2/smooth-morphism-ball-charts`; `AdicEtaleGeometry A2/relative-torus`; `AdicEtaleGeometry A2/relative-closed-polydisc`; `DiamondsAndVStacks D6/etale-site-comparison`; `DiamondsAndVStacks D3/locally-profinite-torsors`; `DiamondEtaleCohomology §C8.15`; `PerfectoidSpaces P1/perfectoid-field-definition`; `PerfectoidSpaces P1/perfected-tate-algebra`; `PerfectoidSpaces P1/cyclotomic-perfectoid-field`.

**The cyclotomic limit is a geometric `ℤ_p`-torsor**. Let `p` be prime, `L` the completed field `ℚ_p(μ_{p^∞})` of P1.31, `Γ = Gal(ℚ_p(μ_{p^∞})/ℚ_p) ≅ ℤ_p^×`, and `Δ` its finite torsion subgroup (of order `p − 1` for odd `p` and `{±1}` for `p = 2`). Put `L_n = ℚ_p(μ_{pⁿ})^{Δ_n}`, where `Δ_n` is the image of `Δ`, and `K_∞ =` completion of `⋃_n L_n`. Then `K_∞ = L^Δ` is perfectoid, `G = Γ/Δ ≅ ℤ_p` acts continuously, and `X_∞ = Spa(K_∞^♭, O_{K_∞^♭})` is the inverse limit of `(Spa L_n)^♢` over `X = Spd ℚ_p`. The structural map `q : X_∞ → X` is a surjective v-cover, and `(g, x) ↦ (x, gx)` identifies `G × X_∞` with `X_∞ ×_X X_∞`. Thus `q` is a `G`-torsor in D3's sense and `X_∞/G ≅ Spd ℚ_p`. The full cyclotomic cover has group `Γ`, its quotient by `Δ` is `X_∞`, and the two quotient presentations agree. Under tilting, `K_∞^♭ ≅ 𝔽_p((u^{1/p^∞}))^∧` for `u = ∏_{δ∈Δ}δ(t)` with `t = ε − 1` in `L^♭`, compatibly with the `G`-action, so this same presentation is the one used in the smoothness proof. (ECD Proposition 24.5 and its proof, pp. 156–157; P1.31; PerfectoidTowers P8.4.)

*Proof route.* On a marked untilt `S^♯ → Spa ℚ_p`, the pullbacks of `Spa L_n` are compatible finite Galois torsors with groups `G_n = Gal(L_n/ℚ_p)`. Their inverse limit is a v-cover: compatible lifts of a geometric point exist by compactness of the inverse system of nonempty finite fibres. The finite-level Galois identifications of the self-fibre products pass to the limit, giving `G × X_∞ = X_∞ ×_X X_∞`. On affinoid untilts, compatible maps from the `L_n` extend uniquely to their completion, identifying this limit with `Spd(K_∞, O_{K_∞})`, hence with `X_∞` by D6. Apply the same argument to the full cyclotomic levels. The finite-group quotient presentation of PerfectoidTowers P8.3 and its P8.4 targets `invariants_perfectoid` and `Perfectoid.tilt_invariants` identify their `Δ`-quotient with the perfectoid pair of `L^Δ`; continuity of finite averaging in characteristic zero identifies `L^Δ` with the completion of `⋃_n L_n`. In the tilt of `L`, write `t = ε − 1`. The action `δ(t) = (1 + t)^δ − 1` preserves `𝔽_p((t))`. Its invariant field is `𝔽_p((u))`: this totally ramified extension has degree `|Δ|`, and the norm `u = ∏_{δ∈Δ}δ(t)` has `t`-adic order `|Δ|` and hence valuation one in the fixed field. For `p = 2`, the nonidentity element sends `t` to `t/(1 + t)`, so `u = t²/(1 + t)`. Passing to completed perfections identifies the invariant tilt with `𝔽_p((u^{1/p^∞}))^∧`. Torsor descent in D3 identifies the quotient with `X`. These geometric limit and quotient statements use compatible Galois levels, without a universal-splitting assumption on their union.

**Checks.**

- At each finite level the self-fibre product is `G_n × (Spa L_n)^♢`; passing to the limit gives the displayed `G`-torsor identity and `Spd ℚ_p` as its quotient.
- For odd `p, Δ` has order `p − 1, u` has `t`-adic order `p − 1`, and `G ≅ 1 + pℤ_p ≅ ℤ_p`.
- For `p = 2, Δ = {±1}, u = t²/(1 + t)` has `t`-adic order two, and `G ≅ 1 + 4ℤ_2 ≅ ℤ_2`. The finite-invariant perfectoid theorem applies when `p` divides `|Δ|`, so this calculation uses no division by two in characteristic two.
- The full cyclotomic cover has group `ℤ_p^×`, containing nontrivial finite torsion even at `p = 2`. It is a `Γ`-torsor, and becomes the specified `ℤ_p`-torsor only after quotienting by `Δ`.
- After pullback along `Spa(C, O_C) → *` with `C` algebraically closed of characteristic `p`, the tilted cover is `D_C^×` and its self-fibre product over `Spd ℚ_p × Spa(C, O_C)` is `ℤ_p × D_C^×`.
- The `L_n` satisfy the geometric `G`-torsor contract, and the full cyclotomic levels give its `Γ`-torsor counterpart. Both fail A4's `finite-etale-torsor-tower`: the unramified quadratic extension remains nonsplit over their totally ramified union. This is the non-example `AdicEtaleGeometry A4/test_not_cyclotomic`.

*Needs:* `DiamondsAndVStacks D3/locally-profinite-torsors`; `DiamondsAndVStacks D5/limits-and-finite-stage-comparisons`; `DiamondsAndVStacks D6/spd-of-a-tate-pair`; `PerfectoidSpaces P1/cyclotomic-perfectoid-field`; `PerfectoidSpaces P1/tilt-of-perfectoid-field`; `PerfectoidTowers P8.3/invariant-quotient-v-sheaf-presentation`; `PerfectoidTowers P8.4/invariants-of-perfectoid-tate-ring`.

**Smoothness of `Spd ℚ_p`**. For every prime `ℓ ≠ p`, the map `(Spa ℚ_p)^♢ → *` is `ℓ`-cohomologically smooth. (ECD Proposition 24.5 and its proof, pp. 156–157.)

*Proof route.* The preceding cyclotomic-limit target supplies the perfectoid `K_∞`, the tilted `ℤ_p`-torsor and the quotient presentation `(Spa ℚ_p)^♢ = Spa 𝔽_p((u^{1/p^∞}))^∧/ℤ_p`. The spatiality of `Spd(A, A⁺)` (D6) supplies spatiality of the base; its tower with no nonsplit finite étale covers is a different construction and is not identified with the cyclotomic tower. After pullback along the v-cover `Spa(C, O_C) → *`, with `C` algebraically closed of characteristic `p`, one gets `(Spa ℚ_p)^♢ × Spa(C, O_C) = D^×_C/ℤ_p`. Here `D^×_C`, the punctured open unit disc, is open in `B × Spa(C, O_C)` (Section S5.1), and `D^×_C → Spa(C, O_C)` is smooth (the ball, open immersions, composition). `ℤ_p` acts freely with pro-order prime to `ℓ`, so the free-quotient target applies. Descend along the v-cover by v-locality on the target; `(Spa ℚ_p)^♢ → *` has locally finite `dim.trg`, equal to `1` on nonempty quasicompact opens. Consumers such as `Div¹ = (Spa ℚ̆_p)^♢/φ^ℤ` combine this with étale quotients.

**Checks.**

- Over `Spa(C, O_C)` in characteristic `p` the geometric presentation is `D_C^×/ℤ_p`, with `D_C^×` an open in the perfectoid ball and hence cohomologically smooth.
- For `p = 2` and `ℓ` odd, the torsion-removed group `1 + 4ℤ_2` has pro-order prime to `ℓ`, so the same free-quotient theorem applies.
- A nonsplit unramified quadratic extension of the cyclotomic union does not prevent the geometric torsor presentation or this smoothness theorem; A4's universal-splitting theorem remains inapplicable.

*Needs:* other targets of Section S5.5; Sections S4.2, S4.4, S5.1, S5.2, S5.4; `DiamondsAndVStacks D6/spd-is-a-spatial-diamond`.

**Smoothness over a general perfectoid base**. Let `X` be a perfectoid space, `Y` a locally spatial diamond and `f : Y → X` compactifiable with locally `dim.trg f < ∞`. Then `f` is `ℓ`-cohomologically smooth if and only if

1. `Rf^!𝔽_ℓ` is invertible, that is, étale locally `≅ 𝔽_ℓ[d]`; and
2. for every `X̃ → X` that is an open subset of a finite-dimensional ball `Bⁿ_X`, with pullback `f̃ : Ỹ → X̃`, the transformation `τ_{f̃} : Rf̃^!𝔽_ℓ ⊗ f̃^* → Rf̃^!` is an equivalence.

(ECD Proposition 24.6 and its proof, pp. 157–158.)

*Proof route.* Necessity is the twist target and base change of Section S4. For sufficiency, reduce to `X` affinoid perfectoid and `Y` spatial. For `X̃ ⊂ Bⁿ_X` open, `g : Ỹ → Y` is smooth (the ball, base change, open immersions). So `g^*Rf^!𝔽_ℓ ≃ Rf̃^!𝔽_ℓ` by the exchange with smooth pullback of Section S4.5 (`f` being eligible), and `Rf̃^!𝔽_ℓ` is invertible. For `X′` strictly totally disconnected over `X`, the relative-ball approximation above gives `X′ = lim X̃ᵢ` with `X̃ᵢ` affinoid open subsets of finite-dimensional balls over `X`. It suffices to check `h^*Rf^!𝔽_ℓ ⊗ f′^* → Rf′^!` on quasicompact separated étale `V′ → Y′`; these come from a finite stage (D5, ECD 11.23(iii)), so reduce to global sections and apply `Rh_*`. Then `Rh_*Rf′^! = Rf^!Rg_*` (exceptional base change) `= Rf^!𝔽_ℓ ⊗ f^*Rg_*` (condition (2)) `= Rf^!𝔽_ℓ ⊗ Rh_*f′^*` (C3, ECD 17.6) `= Rh_*(h^*Rf^!𝔽_ℓ ⊗ f′^*)`, by the projection formula for the invertible `Rf^!𝔽_ℓ`. For `Y = B × X` both conditions hold with `d = 2`.

**Checks.**

- For `f = id_X, Rf^!𝔽_ℓ = 𝔽_ℓ` and both conditions hold after every relative-ball base change.
- For `B × X → X`, both conditions hold with dualizing complex `𝔽_ℓ(1)[2]`, including when `X` is not strictly totally disconnected.
- For the closed origin `i : Spa(C, O_C) → B_C, Ri^!𝔽_ℓ = 𝔽_ℓ(−1)[−2]` is invertible, but condition (2) fails already for the zero-dimensional relative ball `X̃ = B_C`. Evaluated on `i_*𝔽_ℓ`, the twisted-pullback map has source `𝔽_ℓ(−1)[−2]` and target `Ri^!i_*𝔽_ℓ = 𝔽_ℓ`, so it cannot be an equivalence.

*Needs:* other targets of Section S5.5; Sections S3.3, S4.2, S4.3, S4.5, S5.2; `DiamondsAndVStacks D5/limits-and-finite-stage-comparisons`; `DiamondEtaleCohomology §C3.1`; `DiamondEtaleCohomology §C3.2`; `DiamondEtaleCohomology §C3.8`.

### Examples

- The ball: `D_f = Λ(1)[2], R²f_!Λ(1) ≅ Λ` on `B × Spa(C, O_C)`, and the compactification of `B → *` is `R ↦ R°`.
- The compatible-root torus: `T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p` is a free profinite quotient; over `Spa ℤ_p^cycl` the action is not free.
- `(Spa ℚ_p)^♢ × Spa(C, O_C) = D^×_C/ℤ_p`.
- For `S` infinite, `X` nonempty and `Λ ≠ 0`, the profinite projection `S × X → X` is not smooth and `τ_q` is not an equivalence. For translation by `ℤ_r` with `r ≠ ℓ` and `Λ = 𝔽_ℓ, Rq^!Λ` is a distribution sheaf distinct from `q^*Λ` and averaging is not an isomorphism. For finite `S` the projection is finite étale and `Rq^! = q^*`; when the finite group order is a unit, averaging multiplies by its inverse.

### Dependencies

Layers S0–S4; `DiamondsAndVStacks` D0, D2, D3, D4, D5, D6; `DiamondEtaleCohomology` C0, C2, C3, C4, C7, C8, C9; `AdicEtaleGeometry` A2; `PerfectoidSpaces` P1; `PerfectoidTowers` P8.3–P8.4; `ClassicalAdicEtaleCohomology`, Sections 8.4, 9.2, 9.5, 9.6 and 10.5; Tau Ceti `TauCeti.profiniteOrder`; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups`, SR.0.3 and SR.1.1.

## Layer S6: Biduality, finiteness and conservativity over a geometric point

Over `Spa(C, O_C)`, with `C` complete algebraically closed of characteristic `p`, Verdier duality behaves as in algebraic geometry. For `X` smooth over `Spa(C, O_C)`, bounded constructible complexes are reflexive; if `X` is quasicompact, their cohomology is finite. Moreover `RHom(−, Rf^!𝔽_ℓ)` is conservative on all of `D_ét(X, 𝔽_ℓ)`, with no smoothness or constructibility hypothesis (ECD 25.1–25.6). Both statements fail over `Spa(C, C⁺)` with `C⁺ ≠ O_C`, and the counterexamples are targets.

### S6.1 Verdier and naive duals

**The Verdier dual**. Let `f : X → Spa(C, O_C)` be an eligible map from a locally spatial diamond and `Λ` with `nΛ = 0, n` prime to `p`. The Verdier dual is `𝔻_X := RHom_Λ(−, Rf^!Λ) : D_ét(X, Λ)^op → D_ét(X, Λ)`, and the naive dual is `RHom_Λ(−, Λ)`. Their biduality maps `A → 𝔻_X𝔻_X A` and `A → RHom(RHom(A, Λ), Λ)` are the evaluation maps. When `f` is `ℓ`-cohomologically smooth and `Λ` is `ℓ`-power torsion, `Rf^!Λ` is invertible (Section S4.3). Then `𝔻_X = RHom(−, Λ) ⊗ Rf^!Λ, RHom(RHom(A, D), D) = RHom(RHom(A, Λ), Λ)` for `D = Rf^!Λ`, and the two biduality maps correspond. Verdier duality (Section S3.2) gives `RΓ(X, 𝔻_X A) = RHom(RΓ_c(X, A), Λ)`. On `Spa(C, O_C)` itself, `D_ét = D(Λ)` and `𝔻` is the linear dual. (ECD Theorem 25.1, p. 158; Proposition 25.4, p. 161.)

The API consists of: the defining formula `𝔻_X A = RHom(A, Rf^!Λ)`; the constant case `𝔻_X Λ = Rf^!Λ`; the smooth case (for smooth `f` and `ℓ`-power-torsion `Λ, 𝔻_X A ≅ RHom(A, Λ) ⊗ D_f`); the biduality map (the evaluation `A → 𝔻_X𝔻_X A`); global sections (`RΓ(X, 𝔻_X A) ≅ RHom(RΓ_c(X, A), Λ)`); extension by zero (for a quasicompact open `j : U → X, 𝔻_X(j_!B) ≅ Rj_*𝔻_U(B)`, and `RHom(j_!Λ, Λ) = Rj_*Λ`); and smooth pullback: for `g : X′ → X ℓ`-cohomologically smooth and `Λ ℓ`-power torsion, `g^*𝔻_X ≅ D_g⁻¹ ⊗ 𝔻_{X′}g^*`. Indeed `D_{f∘g} ≅ Rg^!D_f ≅ D_g ⊗ g^*D_f` and smooth pullback commutes with internal `Hom` (Section S4.5), so `𝔻_{X′}(g^*A) ≅ D_g ⊗ g^*𝔻_X(A)`; cancel `D_g`. No smoothness of `f` itself is needed for this.

**Checks.**

- For `X = Spa(C, O_C), 𝔻` is the linear dual `RHom_Λ(−, Λ)` on `D(Λ)`; for `Λ = 𝔽_ℓ` and finite-dimensional vector spaces the canonical bidual map `Module.Dual.eval` is bijective, as Mathlib's `Module.evalEquiv` records.
- For the ball over `Spa(C, O_C), 𝔻(Λ) ≅ Λ(1)[2]`.
- Over `Spa(C, C⁺)` with `C⁺ ⊊ O_C`, take `a ∈ O_C ∖ C⁺` and the rational open `j : {|a| ≤ 1} → Spa(C, C⁺)`. Then `RHom(j_!𝔽_ℓ, 𝔽_ℓ) = Rj_*𝔽_ℓ = 𝔽_ℓ`, so the naive double dual of `j_!𝔽_ℓ` is `𝔽_ℓ ≠ j_!𝔽_ℓ` (Section S6.2). When `Spa(C, O_C)` is open, its inclusion gives the same calculation.
- `𝔻` is an exact contravariant functor: `𝔻(A[1]) = (𝔻A)[−1]`.

*Needs:* Sections S3.1, S3.2, S4.2, S4.3, S4.5; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C3.11`.

### S6.2 Biduality and finiteness

**Biduality**. Let `C` be a complete algebraically closed nonarchimedean field of characteristic `p` with ring of integers `O_C`. Let `X` be a locally spatial diamond, separated and `ℓ`-cohomologically smooth over `Spa(C, O_C)` for some `ℓ ≠ p`, and `A ∈ D_ét(X, 𝔽_ℓ)` bounded with constructible cohomology. Then the naive biduality map `A → RHom_{𝔽_ℓ}(RHom_{𝔽_ℓ}(A, 𝔽_ℓ), 𝔽_ℓ)` is an equivalence; equivalently, since `Rf^!𝔽_ℓ` is invertible, so is the Verdier biduality map `A → 𝔻_X𝔻_X A`. The base must be `Spa(C, O_C)`: over `Spa(C, C⁺)` with `C⁺ ≠ O_C` the statement fails, even for the identity. (ECD Theorem 25.1 and its proof, pp. 158–160.)

*Proof route.* Reduce to `X` spatial and `A` in degree `0`. Both sides of the biduality map are exact functors of `A`, so the objects for which it is an equivalence form a triangulated subcategory: it is closed under shifts, and under cones by the five lemma. By `DiamondEtaleCohomology §C7.11` (ECD 20.8), `A` has a finite filtration with graded pieces `j_!(L|_Z)`, where `j : U → X` is quasicompact separated étale, `Z ⊂ |U|` is constructible closed and `L` is a local system on `U`. The complement `k : W = U ∖ Z → U` is a quasicompact open, and the open–closed triangle on `U` (`DiamondEtaleCohomology §C5.3`), pushed forward by the exact `j_!`, is `(j∘k)_!(L|_W) → j_!L → j_!(L|_Z)`. Hence it suffices to treat `A = j_!L` for `j` quasicompact separated étale; the closed strata cannot be omitted from the filtration, since such a `j_!L` has open support. Étale localisation makes `j` an open immersion and `L` constant (C7, ECD 20.7), since quasicompact opens of strict localisations are strictly local. For `A = j_!𝔽_ℓ, RHom(j_!𝔽_ℓ, 𝔽_ℓ) = Rj_*𝔽_ℓ`, so it suffices that `j_!M → RHom(Rj_*𝔽_ℓ, M)` is an equivalence for every `M ∈ D(𝔽_ℓ)`.

Next, describe `U` by an equation. Choose a quasi-pro-étale surjection `X̃ = lim X̃ᵢ → X` from a strictly totally disconnected space (D5, ECD 11.24). Write `Ũ = {|f| ≤ |ϖ|}` for some `f ∈ H⁰(X̃, O⁺)` (ECD Lemma 7.6, D1). By continuity of `H⁰(−, O⁺/ϖ)` (C0, ECD 14.9; `O⁺/ϖ` is an étale sheaf, C2, ECD 14.12), descend `f` to `f ∈ H⁰(X, O⁺/ϖ)` with `U = {f = 0}`. Let `Y = {f − T = 0} ⊂ X × B_C`, with `B_C` the perfectoid ball over `Spa(C, O_C)`. Then `Y → X` is smooth and surjective (an open of a pullback of the ball), and `Y → B_C` is smooth. Smooth pullback of internal `Hom` and smooth base change (Section S4.5) replace `j : U → X` by `{T = 0} ⊂ B_C`.

Now `X` is a quasicompact smooth rigid curve over `C`, smooth over `Spa(C, O_C)` by Section S5.5, and it suffices to prove `RΓ(X, j_!M) ≃ RHom(Rj_*𝔽_ℓ, M)`. The cone of this comparison `α_X` is supported on the finite frontier of `U`. Its contribution is a direct summand of the cone for a proper smooth curve `X′` containing neighbourhoods of the frontier (`ClassicalAdicEtaleCohomology`, Section 11.3, using the local compactification of smooth curves of Section 8.2). For `X′` proper, write `M = Rf^!M′`. Then `RHom(Rj_*𝔽_ℓ, M) = RHom(RΓ(U, 𝔽_ℓ), M′)` and `RΓ(X′, j_!M) = RΓ_c(U, Rf^!M′)` by Verdier duality. Both sides commute with colimits in `M` because `RΓ_c(U, Rf^!𝔽_ℓ)` and `RΓ(U, 𝔽_ℓ)` are finite (the practical criterion (2)), so take `M = 𝔽_ℓ`. Poincaré duality on `U`, that is Verdier duality with the invertible `Rf^!𝔽_ℓ`, dualises in finite-dimensional vector spaces. It remains to check that the map `RΓ(X′, j_!M) → RHom(Rj_*𝔽_ℓ, M)` induced by biduality is the Poincaré-duality pairing. ECD leaves this to the reader; it is the proper-curve duality reduction of `ClassicalAdicEtaleCohomology`, Section 11.3.

**Checks.**

- For `X = B × Spa(C, O_C)` and `U` the closed subdisc of radius `|ϖ|`, the double dual of `j_!𝔽_ℓ` is `j_!𝔽_ℓ`.
- Dévissage with a closed stratum: in the same `X` let `Z = X ∖ U` and `A = coker(j_!𝔽_ℓ → 𝔽_ℓ)`, with stalks `0` on `U` and `𝔽_ℓ` on `Z`. Since `X` is connected and `Z` is a nonempty proper closed subset, `A` has nonopen support, so no finite filtration by sheaves `j′_!L` with `j′` étale produces it. The triangle `j_!𝔽_ℓ → 𝔽_ℓ → A`, with stalks `𝔽_ℓ → 𝔽_ℓ → 0` on `U` and `0 → 𝔽_ℓ → 𝔽_ℓ` on `Z`, reduces biduality for `A` to the two open extensions `j_!𝔽_ℓ` and `𝔽_ℓ`.
- For `X = Spa(C, O_C)` and `A = 𝔽_ℓ²`, the biduality map is the evaluation isomorphism of a two-dimensional vector space with its double dual.

*Needs:* Sections S3.2, S4.2, S4.3, S4.5, S5.2, S5.5, S6.1; `ClassicalAdicEtaleCohomology`, Sections 8.2 and 11.3; `DiamondsAndVStacks D5/universally-open-presentation`; `DiamondsAndVStacks D1/pro-constructible-generalizing-subsets-are-affinoid`; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C2.3`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C7.3`; `DiamondEtaleCohomology §C7.11`; `DiamondEtaleCohomology §C7.17`.

**Finiteness of cohomology**. In the situation of biduality, if `X` is quasicompact then `Hⁱ(X, A)` is a finite-dimensional `𝔽_ℓ`-vector space for every `i ∈ ℤ` and every bounded `A` with constructible cohomology. Reduce as for biduality, through the closed-stratum filtration of `DiamondEtaleCohomology §C7.11` and the open–closed triangles (finite-dimensionality in every degree passes through finite triangles by the long exact sequence), to `A = j_!𝔽_ℓ`, and étale localise so that `Rf^!𝔽_ℓ = 𝔽_ℓ[d]`. Then `RΓ(X, j_!M) = RHom(Rj_*𝔽_ℓ, M)`, the claim proved for biduality, which is `RHom_{D(𝔽_ℓ)}(Rf_!Rj_*𝔽_ℓ, M)[−d]`. The left side commutes with all colimits in `M` (`DiamondEtaleCohomology §C9.5`, ECD 20.10), so `Rf_!Rj_*𝔽_ℓ ∈ D(𝔽_ℓ)` is compact, that is, bounded with finite cohomology; take `M = 𝔽_ℓ`. For example `H⁰(B × Spa(C, O_C), 𝔽_ℓ) = 𝔽_ℓ` with vanishing higher groups, and for the closed annulus `H¹ = 𝔽_ℓ(−1)`. (ECD Theorem 25.1 and its proof, pp. 158–159.)

**Checks.**

- For the geometric point, a bounded constructible complex has finite-dimensional cohomology in each degree.
- For a quasicompact closed annulus over `Spa(C, O_C), H¹(X, 𝔽_ℓ) = 𝔽_ℓ(−1)`, which is finite-dimensional.
- For `X = ⊔_{n∈ℕ} Spa(C, O_C)` and `A = 𝔽_ℓ`, the map to `Spa(C, O_C)` is separated étale and smooth, and `A` is bounded constructible, but `H⁰(X, A) = ∏_{n∈ℕ} 𝔽_ℓ` is infinite-dimensional. Quasicompactness is essential.

*Needs:* other targets of Section S6.2; Section S2.3; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C7.11`; `DiamondEtaleCohomology §C9.5`.

**`ℓ`-power-torsion coefficients**. In the situation of biduality, let `Λ` be an `ℓ`-power-torsion ring `(ℓᵐΛ = 0)` and `A ∈ D_ét(X, Λ)` perfect-constructible (C7). Then the biduality map `A → RHom_Λ(RHom_Λ(A, Λ), Λ)` is an equivalence, and if `X` is quasicompact, `RΓ(X, A)` is a perfect complex of `Λ`-modules (ECD prints "`A`-modules"). (ECD Remark 25.3 and footnote 6, p. 158.)

*Proof route.* Compact objects are the perfect-constructible complexes (`DiamondEtaleCohomology §C9.12`, ECD 20.17), which reduces to `A = j_!Λ` for quasicompact separated étale `j : U → X`. The `𝔽_ℓ` case gives the `ℤ/ℓᵐ` case by the five lemma, filtering by `𝔽_ℓ`, and then the case of `j_!Λ` by extension of scalars. For the biduality map, `Rj_*Λ = Rj_*ℤ/ℓᵐ ⊗^L_{ℤ/ℓᵐ} Λ`, because `j` is qcqs of finite cohomological dimension and so `Rj_*` commutes with colimits. Hence `RHom_Λ(RHom_Λ(j_!Λ, Λ), Λ) = RHom_{ℤ/ℓᵐ}(Rj_*ℤ/ℓᵐ, Λ)`, and this equals `j_!Λ` by the proof of biduality with `M = Λ`. Perfectness: `RΓ(X, j_!Λ) = RΓ(X, j_!ℤ/ℓᵐ) ⊗^L Λ`, and `RΓ(X, j_!ℤ/ℓᵐ)` is perfect over `ℤ/ℓᵐ` by finiteness on each `𝔽_ℓ`-graded piece and finite Tor-amplitude. For `Λ = ℤ/ℓ²` and `A = Λ` on the ball over `Spa(C, O_C), RΓ = Λ` is perfect and `A` is its own double dual.

*Needs:* other targets of Section S6.2; `DiamondEtaleCohomology §C9.12`; `DiamondEtaleCohomology §C3.11`; `DiamondEtaleCohomology §C3.9`; `DiamondEtaleCohomology §C7.14`; `DiamondEtaleCohomology §C7.22`.

**Biduality fails over `Spa(C, C⁺)`**. Let `C` be complete algebraically closed nonarchimedean of characteristic `p, ℓ ≠ p` a prime, `C⁺ ⊊ O_C` an open bounded valuation subring and `X = Spa(C, C⁺)`. Choose `a ∈ O_C ∖ C⁺` and let `j : U = {|a| ≤ 1} → X` be the inclusion of the rational open. `U` is nonempty, proper and quasicompact: it contains the norm point and excludes the closed point `s`. Thus `A = j_!𝔽_ℓ` is bounded constructible. One has `RHom_{𝔽_ℓ}(j_!𝔽_ℓ, 𝔽_ℓ) = Rj_*𝔽_ℓ = 𝔽_ℓ`, so the double dual of `A` is `𝔽_ℓ ≠ A`. Hence the hypothesis `C⁺ = O_C` in the biduality target is essential at arbitrary valuation rank, even for the identity `X → X`, which is `ℓ`-cohomologically smooth. (ECD Remark 25.2, p. 158, with a rational open in place of the generic point; Kaib–Werner, §2.1, p. 4, for the valuation-spectrum description.)

*Proof route.* With `k = O_C/m_C` and `V = C⁺/m_C, |X|` is `Spec(V)`, a valuation chain with generic norm point. Every nonempty open `W` meets `U` in an irreducible space. The constant sheaf on `W ∩ U` has sections `𝔽_ℓ` on each nonempty open and identity restriction maps, so it is flabby. The topological description of the étale topos of this strictly totally disconnected space (C0) therefore gives `Rj_*𝔽_ℓ = 𝔽_ℓ`. The extension-by-zero adjunction gives `RHom(j_!𝔽_ℓ, 𝔽_ℓ) = Rj_*𝔽_ℓ`, and the double dual has stalk `𝔽_ℓ` at `s`, where `A` has stalk `0`. The canonical compactification of `j` is `X`, as in Section S0.1. If the norm point is open, for example at finite rank, its inclusion gives the same calculation; no openness of that point is needed for `U`.

**Checks.**

- For `C⁺` of rank two, `U` is the generic point; `j_!𝔽_ℓ` has stalk `0` at the closed point but its double dual has stalk `𝔽_ℓ`.
- In rank three the generic point is open, but `U` can also contain the intermediate point. Both proper opens give the same stalk discrepancy at `s`.
- At infinite rank, take `k = overline(𝔽_p(x_i : i ∈ ℤ))`, extend the monomial valuation `v(x_i) = e_i` with value group `Γ = ⊕_{i∈ℤ} ℚ e_i` ordered by the least nonzero index, and pull its valuation ring back to `O_C` for `C` the completed algebraic closure of `k((π))`. Every finite set of values lies in a proper convex tail of `Γ`. Coarsening by that tail gives a nontrivial residue valuation in the same basic neighbourhood as the trivial valuation, so the generic point is not open. Nevertheless `a = x₀⁻¹` defines a nonempty proper rational open `U` and the stated failure of biduality. The closed-point-complement construction of Section S6.3 also applies.

*Needs:* Sections S4.2, S6.1; `AdicSpacesPartII §R0.19.2 (pro-constructible-subsets)`; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C0.24`; `DiamondEtaleCohomology §C7.3`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.3`; `DiamondEtaleCohomology §C2.2`.

### S6.3 Conservativity

**The closed points of a Zariski–Riemann space**. Let `k` be an algebraically closed field, `K ⊇ k` a field, `A ⊆ K` a finitely generated `k`-subalgebra and `V₀` a valuation subring of `K` containing `A`. Then there is a valuation subring `W ⊆ V₀` of `K` containing `A` whose residue field is `k`, the image of `k`. For any field `k`, such a `W` is a closed point of the Zariski–Riemann space `ZR(K/k)` of valuation subrings of `K` containing `k`: any valuation subring `V ⊆ W` containing `k` equals `W`. Consequently every nonempty locally closed subset of `ZR(K/k)` contains a closed point, so `ZR(K/k)` is a Jacobson space. (Used in the proof of ECD Proposition 25.4, p. 161, where `ZR(K/k)` arises as the space of a compactified geometric point.)

*Proof route.* By Zorn's lemma choose `W` minimal among valuation subrings with `A ⊆ W ⊆ V₀`; the intersection of a chain of valuation subrings is a valuation subring, because if `x` is missing from one member then `x⁻¹` lies in every member by comparability. Let `B` be the image of `A` in the residue field `κ(W)`. Suppose `κ(W)/k` is not algebraic. If `B` is not a field, pick a nonzero nonunit `b ∈ B` and a maximal ideal `𝔪 ∋ b`. Then `B_𝔪` embeds into `κ(W)`, and Mathlib's `IsLocalRing.exists_factor_valuationRing` gives a valuation subring `U` of `κ(W)` dominating `B_𝔪`, proper because `b` stays a nonunit. If `B` is a field, it is finite over `k` by Zariski's lemma (`finite_of_finite_type_of_isJacobsonRing`), so `B = k`; pick `t ∈ κ(W)` transcendental over `k` and dominate `k[t]_{(t)}` instead. In both cases the preimage `W′` of `U` in `W` is a valuation subring of `K` with `A ⊆ W′ ⊊ W`, contradicting minimality. Hence `κ(W)` is algebraic over `k`, so `κ(W) = k`. Closedness: a valuation subring `V ⊆ W` containing `k` contains the maximal ideal of `W` and is the preimage of a valuation subring of `κ(W) = k` containing `k`, so `V = W`. Since `W ⊆ V₀, W` is a specialization of `V₀` lying in the basic open set `{V ⊇ A}` and in every closed set containing `V₀`.

**Checks.**

- For `K = k, ZR(K/k)` is the single point `k`; its residue classes are represented by constants.
- For `K = k(t)`, the closed points are the valuation rings with residue field `k`: the local rings at points of `P¹_k`. In particular the ring at `t = 0` has `t` in its maximal ideal and residue field `k`. The trivial valuation ring `K` has residue field `K ≠ k` and is not closed.
- The hypothesis that `k` is algebraically closed is used: for `k = ℝ` and `K = ℝ(t)`, the closed point at `t² + 1 = 0` has residue field `ℂ ≠ k` and is minimal among valuation subrings containing `ℝ`, so "residue field `k`" does not characterise closed points.

*Needs:* Mathlib `ValuationSubring`, `IsLocalRing.exists_factor_valuationRing`, `finite_of_finite_type_of_isJacobsonRing`, `JacobsonSpace`; `ClassicalAdicEtaleCohomology`, Section 2.4.

**Sheaves on a Jacobson space are detected at closed points**. Let `X` be a Jacobson topological space and `F` a sheaf of modules (or abelian groups) on `X` whose stalks vanish at every closed point. Then `F = 0`. A complex of such sheaves whose cohomology sheaves vanish at all closed points is acyclic. If a section `s` over an open `U` were nonzero, its support would be a nonempty closed subset of `U`, hence locally closed in `X`, and it would contain a closed point of `X` (Mathlib `nonempty_inter_closedPoints`), where the germ of `s` cannot vanish. (Proof of ECD Proposition 25.4, p. 161.)

**Checks.**

- On a finite discrete space every point is closed and the statement is stalkwise vanishing.
- On the Sierpiński space `{s, η}` (`η` open, `s` closed), the extension by zero of a nonzero module from the open point `η` is a nonzero sheaf whose stalk at the unique closed point `s` is zero. The Sierpiński space is not Jacobson, since the locally closed set `{η}` contains no closed point; so the hypothesis is needed.
- On `Spec ℤ` (`PrimeSpectrum ℤ`), which is Jacobson, a sheaf vanishing at all maximal ideals vanishes at the generic point too.

*Needs:* Mathlib `JacobsonSpace`, `closedPoints`, `nonempty_inter_closedPoints`, `TopCat.Presheaf.stalk`.

**Closed points detect vanishing on proper perfectoid spaces over `Spa(C, O_C)`**. Let `C` be complete algebraically closed nonarchimedean of characteristic `p` with residue field `k`. Let `X` be an affinoid perfectoid space, proper and compactifiable over `Spa(C, O_C)`, whose connected components are `Spa(C′, C′⁺)` with `C′` complete algebraically closed and `C′⁺ ⊂ O_{C′}` open and integrally closed. Then `|X|` is a Jacobson space, and an object `A ∈ D(|X|, 𝔽_ℓ)` whose stalks vanish at all closed points of `|X|` is zero. (Proof of ECD Proposition 25.4, p. 161; ECD Proposition 18.7(iv)–(v), Corollary 18.8 and proof of Theorem 19.2, pp. 104–110.)

*Proof route.* Put `S = Spa(C, O_C)`. Compactification commutes with the limits defining connected components (C4.15), and properness identifies `X` with its canonical compactification over `S`. The relative affinoid formula (C4.9) therefore identifies a component `Spa(C′, C′⁺)` with its compactification `Spa(C′, O_C + C′°°)`; the plus ring is the preimage of `k` in the residue field `k′` of `C′`. Its underlying space is `ZR(k′/k)`, by C5.6, and it is Jacobson by the Zariski–Riemann target. For a nonempty locally closed subset `L ⊂ |X|`, choose a component meeting `L`. The intersection is locally closed in that Jacobson component and contains a point closed there. Since the component is closed in `|X|`, this point is closed in `|X|`. Thus `|X|` is Jacobson. Apply the sheaf detection target to every cohomology sheaf of `A`. The same argument detects vanishing for complexes with coefficients in any ring.

For its application, let `T → Z → S` with `T` affinoid strictly totally disconnected and `Z → S` compactifiable. Write `X₀ = T̄^{/Z}` and `W = T̄^{/S}`. The canonical compactification formulas give `X₀ = W ×_{Z̄^{/S}} Z`, an open subdiamond of `W`, and `(X₀)‾^{/S} = W`. If `X₀ = Spa(R, R⁺)`, the relative affinoid formula gives `W = Spa(R, R⁺_S)`, where `R⁺_S` is the integral closure of the image of `O_C` plus `R°°`. In particular `W` remains affinoid perfectoid. The component projection extends to `W → S × π₀T`, and its fibres are `Spa(C_t, O_C + C_t°°)`, with underlying spaces `ZR(k_t/k)`. They are connected, while `π₀T` is profinite, so they are the connected components of `W`. The components of `X₀` are the nonempty open pieces of these fibres. Thus `W` satisfies the helper's hypotheses with the same algebraically closed component fields and the compactified plus rings. Every rank-one point of `W` has algebraically closed completed residue field, so its étale topos is topological and `D_ét(W, Λ) = D(|W|, Λ)`, as in the proof of ECD Proposition 25.4. The helper applies to `j_!A` on `W`, where `j : X₀ → W`.

**Checks.**

- For `X = Spa(C, O_C)`, closed-point detection is vanishing of the coefficient complex at its single point.
- Choose `C′/C` with residue extension `k′ = overline(k(t))/k` and `a ∈ O_{C′}` lifting `t`. In `W = (Spa(C′, O_{C′}))‾^{/S}`, the rational open `X₀ = {|a| ≤ 1}` is `Spa(C′, C′⁺)`, where `C′⁺` is the preimage of the integral closure of `k[t]` in `k′`. This is a connected nonproper affinoid with `C′⁺ ≠ O_{C′}`; its plus ring is not a valuation ring. Its canonical compactification over `S` is `W = Spa(C′, O_C + C′°°)`, with underlying space `ZR(k′/k)`: valuations above `t = ∞` belong to `W` and are absent from `X₀`. Detection applies to `j_!A` on `W`, with these additional closed points included.
- For a profinite set `P` and `X = S × P, |X| = P` and every point is closed. Detection holds for arbitrary complexes, including when `P` is infinite.

*Needs:* other targets of Section S6.3; Sections S0.1, S1.3; `DiamondsAndVStacks D1/components-of-totally-disconnected`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.15`; `DiamondEtaleCohomology §C4.9`; `DiamondEtaleCohomology §C5.6`; `DiamondEtaleCohomology §C2.2`; `ClassicalAdicEtaleCohomology`, Section 2.4.

**Conservativity of Verdier duality**. Let `C` be a complete algebraically closed nonarchimedean field of characteristic `p, X` a locally spatial diamond with `f : X → Spa(C, O_C)` compactifiable and of locally finite `dim.trg`, and `A ∈ D_ét(X, 𝔽_ℓ)` with `RHom_{𝔽_ℓ}(A, Rf^!𝔽_ℓ) = 0`. Then `A = 0`. No smoothness or constructibility is assumed, and the base `Spa(C, O_C)` is essential (next target). ECD's statement omits "complete", which the base `Spa(C, O_C)` of a perfectoid space requires, as in Theorem 25.1. (ECD Proposition 25.4 and its proof, p. 161.)

*Proof route.* Assume `X` quasicompact and put `S = Spa(C, O_C)`. Take `g : T → X` quasi-pro-étale surjective from an affinoid strictly totally disconnected space (D5), and write `X₀ = T̄^{/X}` with proper structure map `h : X₀ → X` of `dim.trg ≤ 0`. Section S3 gives `0 = Rh^!RHom(A, Rf^!𝔽_ℓ) = RHom(h^*A, R(f ∘ h)^!𝔽_ℓ)`, and it suffices to show `A₀ = h^*A` vanishes. Here `X₀` is affinoid perfectoid, compactifiable over `S`, with components `Spa(C′, C′⁺)` for open integrally closed plus rings. Its canonical compactification over `S` is `W = T̄^{/S}` of the preceding target. Let `j : X₀ → W` be the open immersion, `B = j_!A₀` and `f_W : W → S` the proper structure map. Verdier duality and composition of exceptional inverse images give `RHom(B, Rf_W^!𝔽_ℓ) = Rj_*RHom(A₀, R(f ∘ h)^!𝔽_ℓ) = 0`. For every open `U ⊂ W, RHom(RΓ_c(U, B), 𝔽_ℓ) = RΓ(U, RHom(B, Rf_W^!𝔽_ℓ)) = 0`, hence `RΓ_c(U, B) = 0`. Taking `U = W` and `U = W ∖ {x}` for `x` closed identifies the cone with the stalk `B_x` in `D(|W|, 𝔽_ℓ)`, so every closed-point stalk vanishes. The preceding target gives `B = 0`; restriction along `j` gives `A₀ = 0`, and surjectivity of `h` gives `A = 0`. Combined with biduality: for bounded constructible `A, B` on a smooth `X`, a map inducing an isomorphism on Verdier duals is an isomorphism.

**Checks.**

- For `X = Spa(C, O_C)`, linear duality over `𝔽_ℓ` detects every nonzero complex, including unbounded ones.
- For `X` empty the only object is zero and the assertion holds.
- Over a rank-two `Spa(C, C⁺)` with `C⁺ ⊊ O_C`, the nonzero skyscraper at the closed point has zero dual; this base is outside the hypothesis.

*Needs:* other targets of Section S6.3; Sections S0.4, S3.1, S3.2, S6.1; `DiamondsAndVStacks D5/universally-open-presentation`; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C0.24`; `DiamondEtaleCohomology §C2.3`; `DiamondEtaleCohomology §C4.13`; `DiamondEtaleCohomology §C4.14`.

**Conservativity fails over `Spa(C, C⁺)`**. Let `X = Spa(C, C⁺)` with `C⁺ ⊊ O_C, i : {s} → |X|` the inclusion of the closed point, and `Λ` nonzero with `nΛ = 0` for some `n` prime to `p`. Then `RHom_Λ(i_*Λ, Λ) = 0` although `i_*Λ ≠ 0`. Here `D_ét(X, Λ) = D(|X|, Λ)` because `X` is strictly totally disconnected (C0), `|X|` is a chain with closed point `s` and generic point `η`, and `i_*Λ` is the skyscraper at `s`. Write `j_s : U_s = |X| ∖ {s} → |X|` for the complementary open immersion. `Hom(i_*Λ, Λ[k]) = Hom(Λ, i^!Λ[k])`, and `i^!Λ = 0` by the triangle `i_*i^!Λ → Λ → Rj_{s*}j_s^*Λ`. Indeed every nonempty open `V` of `|X|` meets `U_s` in an irreducible space. Its constant sheaf has sections `Λ` on every nonempty open and identity restriction maps, so it is flabby; hence `Rj_{s*}j_s^*Λ = Λ`. This also gives vanishing of the internal `Hom`: its derived sections on each open `V` containing `s` vanish by the same argument, and on opens avoiding `s` its first argument is zero. Thus conservativity fails over `Spa(C, C⁺)`, although `f = id` is `ℓ`-cohomologically smooth with `Rf^!Λ = Λ`. The open–closed triangle has `j_{s!}Λ` and `i_*Λ` as the open and closed pieces of `Λ`. When the generic point is open, its immersion `j_η : Spa(C, O_C) → X` from the biduality counterexample equals `j_s` only when `X` has two points. The construction with `j_s` applies at arbitrary valuation rank. (ECD Remark 25.5, p. 161.)

**Checks.**

- If `C⁺` has rank two, `|X| = {η, s}`, so `j_s = j_η`; the two sheaves `j_{η!}Λ` and `i_*Λ` are the open and closed pieces of `Λ`.
- If `C⁺` has rank three, `|X| = {η, t, s}`. The stalk of `j_{s!}Λ` at `t` is `Λ`, whereas that of `j_{η!}Λ` is 0. Thus `j_{η!}Λ` and `i_*Λ` are not the two pieces of `Λ`, although the skyscraper still has zero dual.
- For `Λ = ℤ/1`, both the skyscraper and its dual are zero. The failure of conservativity requires `Λ ≠ 0`.

*Needs:* other targets of Section S6.3; `DiamondEtaleCohomology §C0.19`; `DiamondEtaleCohomology §C0.24`; `DiamondEtaleCohomology §C5.1`; `DiamondEtaleCohomology §C5.3`.

**Conditional conservativity for general coefficients**. Let `C` be complete algebraically closed nonarchimedean of characteristic `p, X` a locally spatial diamond, and `Λ` a ring killed by some `n` prime to `p` such that, for every `M ∈ D(Λ), RHom_Λ(M, Λ) = 0` implies `M = 0`. Then conservativity of Verdier duality holds with `Λ` in place of `𝔽_ℓ`: for `f : X → Spa(C, O_C)` compactifiable with locally `dim.trg f < ∞` and `A ∈ D_ét(X, Λ), RHom_Λ(A, Rf^!Λ) = 0` implies `A = 0`. The ring hypothesis fails for `Λ = O_K` with `K` spherically complete and nondiscretely valued and `M` its nonzero residue field. In particular `K = 𝔽_ℓ((t^ℚ))` is a spherically complete Hahn-series field of characteristic `ℓ ≠ p`; its valuation ring is killed by `ℓ` and is an admissible coefficient ring for which the hypothesis fails. Spherical completeness and nondiscreteness impose no characteristic-zero condition. For `K` of characteristic zero, `O_K` is not killed by any positive integer and illustrates the same ring obstruction outside the coefficient class. Noetherianity alone does not suffice: for `Λ = 𝔽_ℓ[[t]]` (noetherian, killed by `ℓ, ℓ ≠ p`) and `M = Λ[1/t] = 𝔽_ℓ((t)) ≠ 0` one has `RHom_Λ(M, Λ) = 0`, since applying `Hom_Λ(−, Λ)` to the telescope resolution `⊕ Λe_n → ⊕ Λe_n, e_n ↦ e_n − t e_{n+1}`, gives the map `(b_n) ↦ (b_n − t b_{n+1})` on `∏ Λ`, which is an isomorphism with inverse `b_n = Σ_j tʲ a_{n+j}` (equivalently, `Λ` is `t`-adically complete, hence derived complete, so `RHom(Λ[1/t], Λ) = 0`); `M` is not finitely generated, so this does not touch the perfect-constructible biduality statements above. The proof follows the previous one with `Λ`. The reductions use only Verdier duality and base change. `RHom_Λ(RΓ_c(U, A), Λ) = 0` gives `RΓ_c(U, A) = 0` by the ring hypothesis, and the last step of closed-point detection works for any coefficient ring. `Λ = ℤ/ℓᵐ` satisfies the hypothesis: it is self-injective, so `RHom(M, Λ)` is `Hom` of the cohomology into `Λ`, and `Λ` is a cogenerator. (ECD Remark 25.6, p. 161; Poonen, *Maximally complete fields*, Lemma 4 and Theorem 1, pp. 8–9, for the Hahn-field completeness property.)

**Checks.**

- For `K = 𝔽_ℓ((t^ℚ))` with `ℓ ≠ p, Λ = O_K` is killed by `ℓ`, but `RHom_Λ(𝔽_ℓ, Λ) = 0` while `𝔽_ℓ ≠ 0`. At `X = Spa(C, O_C)`, this already gives failure of unconditional conservativity with admissible coefficients.
- For `K = ℚ((t^ℚ)), Λ = O_K` has characteristic zero, so no positive integer kills it. The residue-field obstruction illustrates only the ring condition.
- For `K = 𝔽_p((t^ℚ)), Λ = O_K` is killed by `p` and by no integer prime to `p`; it is outside the coefficient class. The characteristic of the coefficient field is distinct from the characteristic `p` defining `Perf`.
- For `Λ = 𝔽_ℓ[[t]]` with `ℓ ≠ p` and `M = 𝔽_ℓ((t))`, `RHom_Λ(M, Λ) = 0` although `M ≠ 0`: a noetherian ring killed by `ℓ` for which the ring hypothesis fails.
- For `Λ = ℤ/ℓᵐ` with `ℓ ≠ p` and `m ≥ 1`, linear duality detects every nonzero complex by self-injectivity and the cogenerator property.

*Needs:* other targets of Section S6.3; Section S3.2.

### Examples

- Over `Spa(C, O_C)`: quasicompact smooth curves and balls have finite cohomology and reflexive constructible complexes; `RΓ_c(B × Spa(C, O_C), Λ) = Λ(−1)[−2]`.
- Over `Spa(C, C⁺)` with `C⁺ ⊊ O_C`, extension by zero from `{|a| ≤ 1}` for `a ∈ O_C ∖ C⁺` has double dual `𝔽_ℓ` at every valuation rank. When the generic point is open its inclusion gives the same example. The skyscraper at the closed point has vanishing Verdier dual at arbitrary rank.
- `ZR(k(t)/k)` for `k` algebraically closed: its closed points are the points of `P¹_k`, and it is a Jacobson space.

### Dependencies

Layers S0–S5; `DiamondsAndVStacks` D1, D5; `DiamondEtaleCohomology` C0, C2, C3, C4, C5, C7, C9; `ClassicalAdicEtaleCohomology`, Sections 2.4, 8.2 and 11.3; Mathlib `JacobsonSpace`, `ValuationSubring`, `IsLocalRing.exists_factor_valuationRing`, `finite_of_finite_type_of_isJacobsonRing`.

## Downstream consumers

- `VStackSheavesAndLisseCategories` descends the exceptional operations of this roadmap along separated cohomologically smooth charts to Artin v-stacks, builds universally locally acyclic objects and the `2`-category of cohomological correspondences from `Rf_!` and `Rf^!`, uses the cohomology of perfectoid open balls for Banach–Colmez spaces, and compares Verdier biduality on `Bun_G` stratumwise with Layer S6.
- `AdicCoefficientsAndComparisons` transports `Rf_!` and `Rf^!` to `ℓ`-adic coefficients and compares them with Huber's and with schemes; it needs the diamond maps to be eligible.
- `BunGAndNewtonStrata`, `GeometricSatakeAndFusion`, `VectorBundlesAndIsocrystals`, `RelativeFarguesFontaine`, `HeckeStacksAndLocalShtukas` and `IgusaVarietiesAndTorsionConcentration` use cohomological smoothness of charts, strata, Banach–Colmez spaces and `Div¹`, the dualizing complex and its degree, and compactly supported cohomology of eligible maps.

## References

- [ECD] P. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 April 2026), to appear in Astérisque; §§22–25, pp. 127–161, with the statements of §§17–21 cited there. https://arxiv.org/abs/1709.07343v4
- [Hub96] R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg, 1996; Corollary 1.6.10 (p. 80), Proposition 5.5.8 (p. 304), Theorem 6.2.2 (p. 329), Theorems 7.2.2 (p. 368) and 7.5.3 (p. 390), Lemma 7.5.4 (pp. 391–396).
- [HTT] J. Lurie, *Higher Topos Theory*, Annals of Mathematics Studies 170, Princeton University Press, 2009; §4.3.2 (4.3.1.7, 4.3.2.2, 4.3.2.14) and 5.5.2.9.
- [HA] J. Lurie, *Higher Algebra*, 2017; Proposition 1.4.4.1.
- [LZ14] Y. Liu and W. Zheng, *Enhanced six operations and base change theorem for Artin stacks*, arXiv:1211.5948v2, 2014.
- [Sch92] C. Scheiderer, *Quasi-augmented simplicial spaces, with an application to cohomological dimension*, J. Pure Appl. Algebra 81 (1992), 293–311; Corollary 4.6.
- [SGA4] M. Artin, A. Grothendieck and J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas* (SGA 4), Lecture Notes in Mathematics 269, 270, 305, Springer, 1972–1973; Exposé VI, 5.2.
- [KW] S. Kaib and A. Werner, *Abeloid varieties over higher rank valued fields: Raynaud uniformization and Néron models*, §2.1, p. 4. https://arxiv.org/abs/2610.01354
- [Poo] B. Poonen, *Maximally complete fields*, Lemma 4 and Theorem 1, pp. 8–9. https://math.mit.edu/~poonen/papers/amsval.pdf

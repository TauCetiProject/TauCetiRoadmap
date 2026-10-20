# Roadmap: general algebraic K-theory

**Summary.** Build algebraic K-theory of small exact and Waldhausen categories, compare the `Q`, plus and `S` constructions, and prove additivity, resolution, localization and approximation. For associative rings, develop products, transfers, relative and nonunital theory, the ring projective line, Nil terms and the Bass Fundamental Theorem. Construct the nonconnective theories of rings and Frobenius models, compare them through finite domination, and identify precisely which enhancements are required for derived invariance.

## Scope and ownership

This roadmap owns exact-category Q-theory and the S/Q comparison, the ring plus/Q comparison, the Bass/Schlichting comparison and the ordinary finite-field calculation needed by the Artin example. StableHomotopyKTheory supplies generic categorical homotopy, plus and monoidal group completion, Waldhausen/S foundations, additivity and relative-S delooping. The corresponding names here are supplied aliases or comparison targets; the exact-category and ring-specific comparisons and the K-theory adapters to the supplied spectrum category belong here. AlgebraicKTheory supplies associative scalar extension, stable GL/E, classical ring K₁ and finite-projective Milnor patching with its low-degree exact sequence; §§3.1, 3.3–3.4 and 8.4–8.6 expose these inputs through convention adapters. The higher comparisons and relative homotopy-fibre comparisons belong here. The ordinary interfaces supplied here for GeometryOfNumbersAndQuadraticArithmetic are §§1.1–1.6, §§2.1–2.6, §§5.2–5.11 and §§11.5–11.16 for its §§6.1.1–6.1.5; §§3.1–3.5, §§10.10–10.11 and §12.10 for its §6.1.7; §3.12 for its §6.10.3 plus/Q adapter; and §§13.8a–13.8c for its ordinary finite-field input. Under this consumer contract its local ordinary names are aliases for the supplied interfaces; its hermitian and shared-spectrum adapters and finite-field hermitian applications remain separate. With the same ordered charts, its first-to-second Milnor clutching parameter u corresponds to α=u⁻¹ in §8.4, so its boundary at u is the boundary here at u⁻¹, the negative of the boundary here at u.

Exact structures, conflations, admissible maps, exact functors, projective and injective objects, and Frobenius exact categories belong to Tau Ceti. Its exact Grothendieck groups, finite-projective exact categories and Cartan map are inputs here. The new conflation-category target equips the supplied category of conflations with its componentwise exact structure; it does not construct that underlying category again. GrothendieckEulerForms Layers 2–3 supply the algebraic degree-zero Euler and finite-resolution comparisons; the resolution theorem here adds the homotopy equivalence and all higher groups.

AlgebraicTopology Stages 2, 4 and 8 supply local coefficient complexes, CW attachment and the homotopy/Hurewicz/Whitehead tools. GeneralizedCohomology G2.10 supplies generic mapping-path fibres and their homotopy exact sequence; G2.3–G2.7 and G3 supply the stable category, sequential/symmetric comparison, integer homotopy, derived fibres/cofibres and telescopes. StableHomotopyKTheory supplies the categorical realization and acyclic-plus results used in Layer 1; the local targets add the specified model comparisons and K-theoretic adapters to those spectra. Mathlib supplies simplicial sets, nerves, their realization and ordinary homotopy groups. Serre quotient categories and their abelian universal properties are supplied by Mathlib; Layer 4 proves their K-theory localization sequence.

DGAInfinity Layers 5–7 own perfect differential graded models, pretriangulated hulls, derived Morita theory and differential graded quotients. Layer 13 uses these carriers only to compare K-theory under an actual map of enhanced models. Triangulated structures, Verdier localization and idempotent completion are supplied category theory. The K-theoretic dense-class and completion criteria here add their Euler-class and boundary conclusions.

Field-specific symbol presentations, including Matsumoto’s theorem, and indecomposable `K₃` comparisons for infinite fields are outside this roadmap. No Bloch-group presentation of `K₃` for arbitrary rings is claimed. Scheme K-theory, descent, arithmetic calculations, topological K-theory and a general theory of commutative ring spectra remain separate directions; the projective-line construction here is stated directly for rings.

[AlgebraicVectorBundles L0B](../AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves) supplies the finite-projective/finite-locally-free comparison over affine commutative schemes. [SchemeAndStackFoundations §5.4](../SchemeAndStackFoundations/README.md#54-projective-bundles-and-chern-classes) owns projective bundles as schemes. The gluing category in Layer 9 instead admits associative noncommutative coefficient rings and adds the K-theory splitting; it does not rebuild that affine equivalence or scheme theory.

## Conventions

A ring is associative and unital unless it is explicitly nonunital; ordinary ring maps preserve the unit. Polynomial variables are central. Ideals of a noncommutative ring are two-sided. Write `P(R)` for finite projective left modules. Right-module arguments use `Rᵒᵖ` and the duality comparison; this is essential for the idempotent extension and projective-line formulas. No invariant-basis-number, flatness or noetherian hypothesis is implicit. When regularity is used for vanishing, the stated sufficient scope is left noetherian with finite left global dimension.

Categories and diagrams are small in a specified universe. An essentially w-small exact category is replaced by a w-small exact model before taking Q, a nerve or homotopy groups; model independence is a theorem, not a choice of universe equality. All equivalences and natural transformations used for transport preserve the indicated exact or Waldhausen structures. The zero object supplies the basepoint.

Set `K(C)=ΩBQC` for exact C, and `K_n(C)=π_{n+1}BQC` for `n≥0`. For Waldhausen C, set `K(C)=Ω|NwS•C|`. The connective spectrum has no negative groups. Bass `K_{−n}=LⁿK₀`, `n≥0`, and the nonconnective spectra are built later to recover these groups. A homotopy-fibre sequence includes its nullhomotopy. Exactness at degree zero uses pointed sets unless a grouplike structure has already supplied groups.

Fix localization boundaries by `[coker α]−[ker α]`. A DVR uniformizer therefore has boundary `+[k]`. A relative triple `(P,α,Q)` has difference `[P]−[Q]`. Milnor clutching uses `α` from the second chart to the first, so `x̄=α(ȳ)`. Projective-line gluing instead goes from the plus chart to the minus chart and twist n multiplies that gluing by `t^{−n}`. These two gluing conventions concern different categories.

For Laurent splitting use `{t,x}` with the t-class first; its boundary is x. Graded interchange contributes `(−1)^{pq}`; odd squares are only proved to be killed by 2. Finite chain Euler classes are alternating sums, with degree zero positive. Each of these conventions has a computed check below. Sequential spectra are used through their derived fibre, cofibre and pairing interface; binary pairings alone do not supply an `E∞` structure.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.nerve` and `nerveMap`, `SSet.toTop`, `SSet.toTopSimplex` and `sSetTopAdj` for realization. Use `Path`, `ContinuousMap.Homotopy`, `ContinuousMap.HomotopyEquiv`, `LoopSpace` and `HomotopyGroup.Pi` for spaces and their based homotopy. StableHomotopyKTheory supplies Quillen A/B, the plus construction and the generic homotopy comparisons; Layer 1 identifies their carriers and maps with the conventions used here.

Use `ShortComplex`, kernels, cokernels, pullbacks, pushouts, biproducts and additive functors. The exact square arguments retain `IsPullback`/`IsPushout` witnesses. `CategoryTheory.Idempotents.Karoubi` supplies actual idempotents; a map idempotent only up to chain homotopy is not such an object. Use homological complexes and chain homotopies, triangulated object properties and Verdier localizations as their existing carriers.

For a Serre object property P, use `P.isoModSerre.Localization` and its functor `P.isoModSerre.Q`. In `CategoryTheory.ObjectProperty.SerreClassLocalization`, use `abelian`, `isZero_obj_iff`, `isIso_map_iff`, `preservesFiniteLimits`, `preservesFiniteColimits` and `exactFunctor_comp_iff`: the quotient is abelian, kills precisely P, inverts precisely the maps with P-kernel and P-cokernel, and has the exact-functor universal property. The calculus-of-fractions hypotheses come from `P.IsSerreClass`.

For rings and modules use `ModuleCat`, finite generation and projectivity, finite `Matrix.GeneralLinearGroup`, elementary matrix algebra, `RingHom.pullback`, `TwoSidedIdeal.ringCon`, `RingCon.Quotient` and `RingCon.mk'` for two-sided quotient rings and their quotient maps, `Polynomial`, `LaurentPolynomial`, `IsNilpotent`, tensor products and `Unitization ℤ I`. Commutative `ModuleCat.extendScalars` is used in its actual commutative scope; AlgebraicKTheory supplies the general associative bimodule extension. Use `MoritaEquivalence` for an R-linear module equivalence over a commutative base semiring R, and `ModuleCat.matrixEquivalence` for rings and a finite nonempty matrix index. Stable GL and its Whitehead subgroup theorem are supplied by AlgebraicKTheory A1.

`Module.Finite.exists_comp_eq_id_of_projective` supplies the finite-free retraction for a finite projective module. `Module.finrank_mul_finrank` supplies the tower dimension identity for free scalar extensions; the finite-field degree-zero transfer calculation uses that identity rather than introducing another dimension theorem.

### From Tau Ceti

The following modules supply the exact-category and degree-zero interfaces. Their existing carriers and algebraic universal properties are used directly.

From `TauCeti.CategoryTheory.Exact.ExactStructure`, `TauCeti.CategoryTheory.Exact.Functor`, `TauCeti.CategoryTheory.Exact.Equivalence` and `TauCeti.CategoryTheory.Exact.AdmissibleBaseChange`, use `TauCeti.ExactStructure`, its `Conflation`, `IsInflation`, `IsDeflation`, exact base-change axioms and `IsConflationExact`. An additive functor preserving conflations is the exact-functor input. Use `ExactStructure.transport` for the supplied exact-structure transport. From `TauCeti.CategoryTheory.Exact.Conflation`, use `TauCeti.ExactStructure.ConflationCategory` and `TauCeti.ConflationClass.ConflationCategory.π₁`, `π₂`, `π₃` for the underlying category and its subobject, total and quotient evaluations in §4.2.

From `TauCeti.CategoryTheory.GrothendieckGroup.Exact` and `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`, use `TauCeti.ExactK0`, `ExactK0.of`, `ExactK0.map`, `ExactK0.of_conflation` and its split comparison. The construction is available for essentially small exact categories. Use `finiteProjectiveModules`, `finiteProjectiveModulesExactStructure`, `finiteProjectiveModulesExactStructure_eq_split` and the existing Cartan map; these fix both the ring `K₀` carrier and its generators. Throughout, `K₀(R)` means `TauCeti.ExactK0 (TauCeti.finiteProjectiveModulesExactStructure R)`, and its map under an exact finite-projective functor is `TauCeti.ExactK0.map`. `TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic` supplies `TauCeti.SplitK0.of_mul_of`, identifying the degree-zero tensor product on generators.

From `TauCeti.CategoryTheory.GrothendieckGroup.Resolving` and `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic`, use `ExactStructure.resolutionEquiv` and `moduleResolutionEquiv` for the algebraic finite-resolution comparisons. `TauCeti.RepresentationTheory.GrothendieckGroup.SimpleBasis` supplies `TauCeti.simpleClassBasis` for an exhaustive, pairwise nonisomorphic family of simple finitely generated modules over an Artinian ring; §4.8 uses it only in that ring specialization, while its general dévissage theorem is constructed here.

From `TauCeti.CategoryTheory.Exact.Frobenius` and `TauCeti.CategoryTheory.Exact.Stable.Triangulated`, use `ExactStructure.IsFrobenius` with enough projectives, enough injectives and equality of the projective and injective classes, and `ExactStructure.IsFrobenius.stableIsTriangulated`. `TauCeti.CategoryTheory.Exact.HomologicalComplex.Frobenius` supplies `ExactStructure.homologicalComplex_split_isFrobenius` on `ℤ`-indexed complexes and identifies contractibles as the projective-injectives. Restriction to bounded complexes and the homotopy-acyclic subpair are part of §11.1; admissible acyclicity and homotopy-acyclicity remain distinct. The new object of §11.1 is a pair of these structures and its derived quotient, not another Frobenius predicate.

From `TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita`, use `CategoryTheory.Equivalence.finiteProjectiveModulesEquivalence` and `isConflationExact_finiteProjectiveModulesEquivalence_functor` for Morita restriction and its exactness; `finiteProjectiveModulesK0Equiv` supplies its degree-zero map. From `TauCeti.RingTheory.Morita.Corner`, `IsIdempotentElem.cornerEquivalence` supplies the module equivalence for a full idempotent, with fullness `TwoSidedIdeal.span {e}=⊤`. The new corner results compare higher and negative K-maps; the general nonunital functor also allows non-full h(1).

### From TauCetiRoadmap

[AlgebraicKTheory](../AlgebraicKTheory/README.md#conventions-dependencies-and-ownership), conventions and A0, supplies balanced tensor products for arbitrary associative rings, the all-module extension/restriction adjunction, its unit, counit, triangle identities and universe transport, and restriction of extension to finite projectives. A1–A2 supply stable GL, its elementary perfect commutator subgroup, classical K₁ and its projective-automorphism presentation. A6 supplies the patching equivalence, boundary and four-interior-term sequence for a pullback with at least one surjective leg. These are algebraic inputs, independent of Q/S, plus constructions and higher spectra.

Use its right-projective category over Rᵒᵖ as `P(R)`, with the native `finiteProjectiveModules R` carrier and split exact structure. Its split K₀ over Rᵒᵖ is identified with `TauCeti.ExactK0 (TauCeti.finiteProjectiveModulesExactStructure R)` by `ExactK0.fromSplitEquiv`; generators and scalar-extension maps agree. This change of module convention is distinct from the contravariant duality `P↦Hom_R(P,R)`. For classical K₁ use the matrix and projective-automorphism adapters of §3.14; for patching use the inverse-parameter adapter of §8.4. The section names retained here denote these supplied constructions and their comparisons, not additional low-degree ring groups.

[StableHomotopyKTheory](../StableHomotopyKTheory/README.md), §§1.1–1.34 and 2.17–2.35, supplies realized-nerve homotopy, compactly generated product and opposite comparisons, filtered continuity, bisimplicial realization and Quillen A/B. Its §§3.1–3.28 supply acyclic plus maps, their local-coefficient property, universal factorization, uniqueness and coherent functorial models. Its §§4.3–4.21 supply monoidal localizations, action fibres, group completion and the topological stable-linear/projective-complement comparisons over AlgebraicKTheory A0–A1. Its §§6.1–6.2 supply Waldhausen/S foundations, K₀, additivity and relative-S delooping, including the corrected connective Ω-model with zero space `Ω|wS_•C|`. The outbound table specifies the aliases, map comparisons and additional local targets. Generic countable-tower algebra retains its supplied carriers: StableHomotopyKTheory §7.9 compares the tower algebra of DerivedModuleAlgebra §1.T.1 on main with GeneralizedCohomology G3.8's spectral Milnor maps; no separate tower algebra is constructed here.

[AlgebraicTopology Stage 2](../AlgebraicTopology/README.md#stage-2-relative-singular-chains-and-homology) supplies local coefficient chain complexes and their homology, [Stage 4](../AlgebraicTopology/README.md#stage-4-cw-pairs-cellular-homology-and-cofibrations) the CW constructions and replacements, and [Stage 8](../AlgebraicTopology/README.md#stage-8-relative-homotopy-hurewicz-and-whitehead) relative homotopy exactness, Hurewicz and simply connected Whitehead. [UniversalCovers Stages 0–3](../../Completed/UniversalCovers/README.md#stage-0-port-the-foundations-into-tauceti) supply universal covers, the subgroup/cover correspondence and covering invariance of higher homotopy groups for connected, locally path-connected, semilocally simply connected spaces; connected CW realizations satisfy these hypotheses. StableHomotopyKTheory §§3.25–3.27 supply plus factorization, uniqueness and functoriality with these covers and pulled-back local coefficients; §1.5 transports their maps under X.

[GrothendieckEulerForms Layer 2](../GrothendieckEulerForms/README.md#layer-2-split-exact-abelian-and-triangulated-grothendieck-groups) supplies degree-zero exact Euler relations and [Layer 3](../GrothendieckEulerForms/README.md#layer-3-finite-resolutions-and-the-resolution-theorem) the resolving-subcategory Euler comparison. [DGAInfinity Layer 5](../DGAInfinity/README.md#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes) supplies perfect/pretriangulated differential graded models, [Layer 6](../DGAInfinity/README.md#layer-6-quasi-equivalence-derived-morita-theory-and-compact-generators) their derived Morita comparison and [Layer 7](../DGAInfinity/README.md#layer-7-dg-and-a-quotients-verdier-comparison-and-k₀-localization) the differential graded quotient. The higher and nonconnective K-comparison requires an enhanced functor satisfying approximation or the Frobenius-pair derived-equivalence theorem; it does not follow from these suppliers’ bare triangulated equivalences.

[GeneralizedCohomology G2](../GeneralizedCohomology/README.md#g2-a-concrete-spectral-model-and-represented-theories), items 3–7, supplies stable model structures, the derived symmetric monoidal category, sequential/symmetric comparison and true integer-graded homotopy; item 7 supplies `Hℤ`. Its G3.4 and G3.7 supply telescopes and homotopy-group continuity. Layer 1 constructs the adapters for the sequential K-theory diagrams in this supplied category. Its G2.4 derived smash and sphere symmetry supply the stable interchange used by K-products. Its G2.10 supplies `MappingPathFiber`, its raw product/subspace topology, projection, basepoint, homotopy-square transport and homotopy-choice comparisons, and the homotopy exact sequence through its DGFloer1.2 comparison. Section 1.2 supplies only the incoming-path coordinate adapter, path-reversal comparisons and the group compatibility of K-theory maps.

## How to read the build

Layer 1 supplies homotopy tools for Q-theory (Layer 2) and the ring/plus comparison (Layer 3). Layer 4 gives exact additivity, resolution and Serre localization. Layer 5 imports and compares the supplied S-theory and deloopings, retaining its exact-category S/Q targets; Layer 6 proves fibration, approximation and cofinality with cylinders or existential factorizations. Products and transfers (Layer 7) precede relative theory (Layer 8) and projective-line/Nil arguments (Layer 9). Bass groups and their spectrum (Layer 10) are compared with Frobenius and controlled-cone theory (Layers 11–12). Layer 13 proves continuity and compatibility, then exhibits the limits of bare triangulated invariance.

## Layer 1: Categorical homotopy tools

### 1.1 Homotopies from functors

Use StableHomotopyKTheory §§1.1, 1.7–1.16: `classifyingSpace C` and `classifyingSpaceMap F` are aliases for the same Mathlib realized nerve and nerve map, retaining their vertices. The natural-transformation, equivalence, contraction, product, opposite and filtered-continuity names below are supplied aliases on these carriers. Compare products through the realized projections in the compactly generated topology, and opposites by reversing both arrow strings and simplex coordinates. The additional local target is `classifyingSpace_finitePosetDetection`: for nonempty C, if every functor from a finite poset into C realizes to a nullhomotopic map, BC is contractible, by finite sphere triangulations, face-poset subdivision and CW Whitehead. Here a nullhomotopy includes its constant value; it is not merely vanishing of positive homotopy groups.

(Weibel IV, §3.1–3.3, pp.IV.24–27;§6.4, pp.IV.55–56;Schlichting 2003, Appendix A.10, p.26.)

Use:

- `classifyingSpace_natTrans`: cylinder homotopy has endpoints BF and BG.
- `classifyingSpace_equivalence`: An equivalence realizes to a homotopy equivalence.
- `classifyingSpace_filtered`: Nonempty filtered categories have contractible realization.
- `classifyingSpace_product`: the realized projections identify a finite product realization with the compactly generated product by a homeomorphism, hence a homotopy equivalence.
- `classifyingSpace_op`: reversing simplices gives a homeomorphism with the opposite-category realization.
- `classifyingSpaceMap_id`, `classifyingSpaceMap_comp`: realization preserves identity and composition.
- `classifyingSpace_filteredColimit_pi`: filtered diagrams of small categories give the corresponding filtered-colimit comparison on based homotopy groups, with compatible basepoints.

**Checks.**

- `classifyingSpace_point`: the discrete category on one object realizes to a contractible space.
- `classifyingSpace_discreteTwo_not_contractible`: the discrete category on two objects has two components and is not contractible.
- `classifyingSpace_empty_not_contractible`: the empty category realizes to the empty space, which is not contractible; the nonempty hypothesis cannot be discarded from the finite-poset criterion by interpreting nullhomotopy as a statement only about positive homotopy groups.
- `classifyingSpace_initialEndpoint` and `classifyingSpace_terminalEndpoint`: for `[1]`, either endpoint inclusion is a homotopy equivalence; a category with a zero object is therefore contractible even if it has many morphisms.
- Realizing an identity functor gives the identity continuous map, and realizing a composite gives the composite continuous map; Suggested.lean states these map laws and both endpoint inclusions as named theorem targets.

*Needs:* StableHomotopyKTheory §§1.1, 1.7–1.16; Mathlib nerve, realization, paths and homotopy groups; the space-level suppliers in Scope and ownership.

### 1.2 Based homotopy fibres

For based `f:X→Y`, use GeneralizedCohomology G2.10's `MappingPathFiber f y₀`, including its raw product/subspace topology, basepoint, projection, homotopy-square transport and homotopy exact sequence comparison. `HomotopyFibre` is a consumer alias for that supplied carrier. Express its points in incoming-path coordinates `(x,γ)`, `γ:y₀⇝f(x)`, by reversing the supplied outgoing paths. Prove this coordinate homeomorphism, its naturality and its basepoint/projection compatibility. Transport the specified square homotopies and localization nullhomotopies through it. Compare the supplied connecting maps under reversal, retaining loop inversion (negation in additive homotopy degrees), and keep the pointed-set ending. StableHomotopyKTheory §§2.4–2.11 supply the generic connecting-map, fibre-transport and comma/fibre comparisons on that same outgoing-path carrier. Identify their projection and nullhomotopy after reversal, including local-coefficient transport. Only the incoming-coordinate comparison and the group compatibility arising from K-theory maps are added here.

(Weibel IV, Homotopy Fiber 1.2, pp.IV.3–4.)

Use:

- `HomotopyFibre`: consumer alias for the supplied based mapping-path fibre.
- `HomotopyFibre.pathReversal`: incoming/outgoing coordinate homeomorphism, with naturality and basepoint/projection comparisons.
- `HomotopyFibre.map`: transport of the supplied homotopy-square map, retaining its specified homotopy.
- `HomotopyFibre.boundary`: transport and reversal comparison of the supplied connecting map.
- `HomotopyFibre.exact`: transported exact sequence and K-theory group compatibility, retaining pointed sets where required.

**Checks.**

- For `id_X`, the incoming/outgoing homeomorphism carries the constant-path basepoint to itself and transports the supplied contraction, even when X is disconnected.
- For `point→Y`, both coordinate fibres identify with `ΩY` at `y₀`; the coordinate comparison is loop reversal, so its action on `π₁Y` is inversion and on higher additive homotopy groups is negation.
- For `X→point`, reversal is the identity on the constant-path coordinate and the projection identifies the fibre with X. For the inclusion of one point into a discrete two-point space the adapter retains a point as the fibre, rather than all of the target.

*Needs:* GeneralizedCohomology G2.10 (`MappingPathFiber` and its DGFloer1.2 homotopy exact sequence comparison); StableHomotopyKTheory §§2.4–2.11; Mathlib paths, path reversal and homotopy groups.

### 1.3 Bisimplicial realization and subdivision

Use StableHomotopyKTheory §§2.17–2.18's `BisimplicialSet.realization` and `BisimplicialSet.diagonalRealizationIso` for `bisimplicialRealization` and its diagonal comparison. Its §§2.23–2.25 supply total weak equivalences and realization of compatible level fibre squares under the stated properness and connectedness hypotheses; §2.28 supplies the nerve-base fibre comparison. Preserve the comparison maps, basepoints and nullhomotopies. For relative S, the realized fibre and base levels are connected and the degeneracies are cellular. The additional local targets are edgewise subdivision by `[n]↦[n]^op⋆[n]`, its realization homeomorphism, and the horizontal-isomorphism/all-vertical-map double nerve comparison with the ordinary nerve by contraction of the isomorphism direction.

(Weibel IV, D 3.6 and T 3.6.1, pp.IV.29–30;Examples 3.10.1–3.10.2, pp.IV.33–34 and E 3.13, p.IV.35;§8.5.1, pp.IV.69–70;Waldhausen, §1.5, P 1.5.3, p.342, and P 1.5.5 with proof, pp.343–344.)

Use:

- `bisimplicialRealization`: Iterated realization with a natural diagonal comparison.
- `edgewiseSubdivision`: Precomposition by the ordered join functor.
- `edgewiseSubdivision_homeomorph`: canonical realization homeomorphism.
- `isomorphismDoubleNerve`: horizontal-isomorphism double nerve and its comparison map.

**Checks.**

- A constant bisimplicial singleton realizes to a point in both models.
- The diagonal of a constant discrete two-point bisimplicial set has two components; no contractibility conclusion is available.
- For a one-arrow category the subdivision bisects its interval, rather than turning it into a circle.

*Needs:* StableHomotopyKTheory §§2.17–2.25 and 2.28; Mathlib nerve, realization, paths and homotopy groups; the space-level suppliers in Scope and ownership.

### 1.4 Comma categories and Quillen’s criteria

Use StableHomotopyKTheory §§2.31–2.35's `quillenTheoremA`, `quillenTheoremB` and their dual and prefibred forms. The names here identify these supplied criteria on §1.1's realized nerves: contractible d↓F makes BF a homotopy equivalence, and equivalences `B(d′↓F)→B(d↓F)` for all `d→d′` identify `B(d↓F)` with the fibre over d. The dual F↓d version uses the outgoing-arrow paths of the supplier. Compare the projections and specified homotopies by §1.2's path reversal and §1.1's opposite homeomorphism. For prefibred functors use the supplied strict-fibre/comma adjunction, retaining the base-change-equivalence hypothesis for Theorem B.

The named targets are `QuillenA`, `QuillenB`, `QuillenA_dual`, `QuillenB_dual` with the hypotheses and conclusions above.

(Weibel IV, T 3.7 and 3.8, C 3.7.4, pp.IV.30–32;Quillen, §1, T A and B, pp.93–97.)

**Checks.**

- An adjoint supplies contractible comma categories and recovers an equivalence of classifying spaces.
- The inclusion of one object into a discrete two-object category has an empty comma category at the other object and fails Theorem A.
- A strict fibre may be empty while its comma category is nonempty: include the initial vertex of `[1]` and use the slice over the terminal vertex.

*Needs:* §1.1–1.3; StableHomotopyKTheory §§2.31–2.35; Mathlib comma categories and adjunctions.

### 1.5 Acyclic maps and the plus construction

For connected based CW X and perfect normal `P⊂π₁X`, use StableHomotopyKTheory §§3.3, 3.8, 3.10–3.13 and 3.25–3.27's plus construction and its `IsPlusConstruction` predicate. `PlusConstruction` packages that supplied map with its kernel and acyclic homotopy fibre; acyclicity preserves every pulled-back target local coefficient system. Compare any two chosen models by the supplied homotopy equivalence under X, retaining the source map and coefficient transport. Use `IsPlusConstruction.lift` for a map `g:X→Z` to connected CW-type Z killing P on π₁: there is h with `g≃h∘f`, unique up to homotopy. A pointed map to a disconnected CW-type target uses its basepoint component. Transport uniqueness, maps preserving subgroup data and the supplied coherent functorial model through this under-X comparison.

(Weibel IV, D 1.3–1.4.1, T 1.5(1)–(3), L 1.6, pp.IV.4–6.)

Use:

- `PlusConstruction`: supplied target and based map, with acyclic-fibre proof and prescribed kernel.
- `PlusConstruction.pi1`: induced fundamental group is `π₁X/P`.
- `PlusConstruction.localHomology`: Preservation of pulled-back local homology.
- `PlusConstruction.map`: supplied maps of subgroup data, transported with coherent composition.
- `PlusConstruction.lift`: supplied factorization up to homotopy for maps killing P, with its uniqueness.

**Checks.**

- For `P=1` the map is a homotopy equivalence.
- If `π₁X` is perfect, `X⁺` is simply connected, but nonzero `H₂(X;ℤ)` prevents it from being contractible.
- For `π₁X=ℤ` the only perfect subgroup is zero, so plus cannot kill the fundamental class of the circle.
- For a field F, determinant `BGL(F)→B(Fˣ)` kills E(F); its supplied lift induces the determinant quotient on π₁.
- For the zero ring, GL and E are trivial and the pointed factorization is the unique homotopy class from a point; based-free rank labels still range over `ℕ`.

*Needs:* §1.2; StableHomotopyKTheory §§3.3, 3.8, 3.10–3.13 and 3.25–3.27; AlgebraicTopology Stages 2, 4 and 8 and UniversalCovers for the supplied local-coefficient and cover comparisons.

### 1.6 Symmetric monoidal group completion

For a small symmetric monoidal groupoid S with faithful translations acting on X, use StableHomotopyKTheory §§4.3–4.12's `SInvS`, `MonoidalActionCategory.loc`, `SInvS.pi0Equiv`, `quillenGroupCompletion` and `SInvS.fibration`. Identify the local names with the same pairs (s,x) and stabilized morphism classes. Preserve inclusion, translations, equivariant maps and the component difference `[a]−[b]`, including its universal group-completion and homology-localization maps. Its §§4.19–4.21's `cofinality_action` and `cofinality` supply positive-group equivalence and degree-zero injection for a full symmetric monoidal `T⊂S` when every s has a complement into T. The action-fibre comparison over a chosen `x₀∈X` uses `(a,b)↦(a,b⊕x₀)` and retains the composite nullhomotopy. Its hypotheses are monic X-arrows and injective `Aut_S(s)→Aut_X(s⊕x)` for all s,x; naturality retains the chosen object and coherence isomorphisms. Its §4.8 supplies `X→S⁻¹X` as a homotopy equivalence when all translations already realize to equivalences. These supplied results precede Waldhausen cofinality in the plus/Q comparison.

(Weibel IV, D 4.2, 4.4, 4.7–4.7.1;T 4.8–4.11;E 4.5–4.7, pp.IV.37–46.)

Use:

- `MonoidalLocalization`: Pairs and stabilized-morphism equivalence classes.
- `MonoidalLocalization.action`: Functoriality for faithful actions and their equivariant maps.
- `MonoidalLocalization.pi0`: universal group-completion isomorphism.
- `MonoidalLocalization.cofinality`: Positive-degree equivalence and degree-zero injection for a cofinal inclusion.
- `MonoidalLocalization.actionFibration`: homotopy-fibre identification over a chosen x₀ under the monic and injective-translation hypotheses, natural in pointed actions.

**Checks.**

- For the discrete monoid `ℕ`, `π₀` of its completion is `ℤ`, so the map on components is not an equivalence.
- For an abelian group G viewed as a discrete symmetric monoidal groupoid, the completion map on components is `G→G`, `g↦g`. For `G=ℤ` it sends 1 to 1, and introduces no new components.
- Finite free objects in projectives over `k×k` have diagonal degree-zero image in `ℤ²`, despite positive cofinality.
- For empty X there is no x₀ and no fibre map from `B(S⁻¹S)`; even terminal S does not supply one.
- For terminal S acting trivially on a category X whose arrows are monic, both `S⁻¹X` and ⟨S,X⟩ identify with X. The fibre over each chosen x₀ is contractible, as is `B(S⁻¹S)`.

*Needs:* §1.1–1.4; StableHomotopyKTheory §§4.3–4.12 and 4.19–4.21; Mathlib symmetric monoidal categories, group completion and categorical localization.

### 1.7 Sequential K-theory diagrams in the supplied stable category

Use GeneralizedCohomology G2.3–G2.7 and G3 for spectra and all derived stable operations. The diagrams `E_r` with `ΣE_r→E_{r+1}` in this roadmap are sequential representatives in that supplied category. Construct `kTheorySequentialComparison`, transporting the iterated-S, Bass and Frobenius diagrams through the supplied sequential/symmetric equivalence. Identify their true integer `π_j` with `colim_r π_{j+r}E_r` on the cofinal tail `j+r≥2`, using G2.6's sequential computation. Transport the K-theory localization nullhomotopies to the supplied fibre/cofibre triangles and the Bass transitions to the supplied telescopes. Prove naturality in these diagrams and compatibility with their structure maps. No separate spectrum carrier or generic spectrification is constructed here.

(May, Chapter 22 §§1–2, pp.176–178;Chapter 25 §§1,6–7, pp.220,230–233;Weibel IV, §10.1–10.2, pp.IV.79–80.)

Use:

- `kTheorySequentialComparison`: the K-theory-specific adapter, with stable-group, localization-triangle and telescope comparison diagrams.

**Checks.**

- For finite-dimensional k-spaces, `kTheorySequentialComparison` carries the iterated-S class of k to +1 in `π₀`, fixing both the rank normalization and its sign (§§2.4, 5.11).
- Under `kTheorySequentialComparison` and the matrix Morita normalization, scalar extension `k→M₂(k)` sends 1 to 2 (§3.1).
- The DVR localization diagram transported by `kTheorySequentialComparison` sends the uniformizer's `K₁` class to `+[k]` under its boundary, with the chosen composite nullhomotopy (§8.12).
- The zero prespectrum has zero groups in every integer degree.
- For the Eilenberg–Mac Lane spectrum `Hℤ` only `π₀` is `ℤ`; for its desuspension `Σ⁻¹Hℤ`, `π₋₁` is `ℤ`, so a negative degree cannot be replaced by degree zero.
- For a map `E→0` the fibre is E and the cofibre is `ΣE`, fixing the shift direction.
- The telescope of `Hℤ --2→ Hℤ --2→` … has `π₀=ℤ[1/2]`; its ordinary set-theoretic union is not a model unless embeddings have actually been chosen.

*Needs:* §1.1–1.2; GeneralizedCohomology G2.3–G2.7, G3.4 and G3.7 for the stable category, sequential/symmetric comparison, true integer homotopy, derived fibres/cofibres and telescopes. The adapter applies to the K-theory structure maps constructed in Layers 5 and 10–11.

### 1.8 Stable pairings and the sphere sign

Use GeneralizedCohomology G2.4's derived smash, unit and sphere symmetry. For the levelwise K-theory pairings `E_r∧F_s→G_{r+s}` constructed in Layer 7 and extended in Layer 13, retain the suspension squares including sphere interchange. Construct `kTheoryPairingComparison`, comparing these maps with maps of the supplied derived smash and identifying their stage-independent bilinear `π_iE⊗π_jF→π_{i+j}G`. Transport associativity, units and symmetry from the specified K-theory diagrams; the supplied integer-sphere symmetry contributes `(−1)^{ij}`. Prove compatibility with §1.7 and the supplied derived sequential colimits. Binary pairings do not assert an `E∞` structure.

(May, Chapter 25 §2, pp.221–223, ring-prespectrum definition and graded-ring lemma;Waldhausen, §1.5, p.342.)

Use:

- `kTheoryPairingComparison`: comparison of K-theory level pairings with the supplied derived smash, retaining their integer-graded products and coherences.
- `sphereInterchangeSign i j`: the arithmetic unit `(−1)^(ij)` in `ℤ×`; its zero-degree, symmetry and degree-addition formulas are the sign API used in the pairing identities.

**Checks.**

- Through `kTheoryPairingComparison`, the tensor product of k-spaces of ranks 2 and 3 has rank 6 in `K₀(k)` (§§7.4, 7.6).
- Through `kTheoryPairingComparison`, the degree-zero unit `[R]` for a commutative ring R acts as the identity on its K-groups (§7.4).
- The transported external product `{[t],[R]}` has Laurent boundary `+[R]`; replacing t by `t⁻¹` gives `−[R]` (§9.17).
- Exchanging two one-spheres acts by `−1` on their two-sphere smash.
- Exchanging a one-sphere and a two-sphere acts by +1.
- `sphereInterchangeSign (−1) 1=−1`, so the formula uses integer degrees and not truncated natural subtraction.
- In characteristic two, the integer sign maps to `−1=1` in `𝔽₂`.
- An odd-degree square is annihilated by 2; it is not asserted to be zero without excluding 2-torsion.

*Needs:* §1.7; GeneralizedCohomology G2.4–G2.7 for derived smash, integer-sphere interchange and stable comparison; Mathlib tensor products of abelian groups. Layer 7 supplies the K-theory-specific biexact maps to which this adapter applies.

### Examples

The discrete category on two objects detects a missing connectedness hypothesis. The fibre of `point→Y` is `ΩY`, whereas the fibre of `id_Y` is contractible. Interchanging two one-spheres has degree `−1`; interchanging a one-sphere and a two-sphere has degree +1.

### Dependencies

Mathlib nerves, geometric realization, paths and ordinary homotopy groups; the AlgebraicTopology supplier contracts.

## Layer 2: Quillen categories and connective groups

### 2.1 Exact categories and Quillen's category `Q(A)`

Construct `QCat E` on the objects of a small exact category. A map `X → Y` is a span `X ↞ M ↣ Y`, with the left arrow a deflation and the right arrow an inflation, modulo an isomorphism of M that fixes both endpoint maps. To compose `X ↞ M ↣ Y` and `Y ↞ N ↣ Z`, use `M ×_Y N`. The projections are respectively a deflation to M and an inflation to N; their composites give the new span. Prove representative independence and the category laws. Every Q-map factors as a reversed deflation followed by an inflation, uniquely up to an isomorphism of its middle object. Q-isomorphisms come precisely from isomorphisms of the original category. A map from zero is the same as an admissible subobject of its target. Interchanging subobjects and quotient objects identifies Q of the opposite exact category with Q of the original.

Use E0–E2 and their duals. Deflation base change supplies the pullback; the kernel–cokernel property and deflation composition supply the inflation leg. The obscure axiom retains its cokernel hypothesis, or kernel hypothesis dually. Span representatives and their quotient are small in one universe; §2.3 treats essentially small categories.

(Weibel IV, D 6.1;6.1.1, p.IV.53;6.1.2 (Subobjects) and the paragraph after it, p.IV.53;6.1, the paragraph on the two distinguished kinds of morphism, p.IV.53;Bühler, P 2.15, p.10, and P 2.16;Remark 2.17, pp.10–11 (arXiv v2);Weibel II, E 7.8, pp.II.70–71;Quillen, §2, pp.99–104.)

Use:

- `QCat`: category `Q(A)` attached to an exact structure.
- `QCat.hom_equiv_subobject`: Admissible subobject of the target with admissible epimorphism to the source.
- `QCat.inflation`: morphism attached to an admissible monomorphism.
- `QCat.deflation`: The reversed arrow of an admissible epimorphism.
- `QCat.factor`: Reversed-deflation/inflation normal form, unique up to middle isomorphism.
- `QCat.hom_zero`: Morphisms out of the zero object are the admissible subobjects.
- `QCat.isoQ_equiv_iso`: isomorphisms of `Q(A)` are those of A.
- `QCat.op`: Q of the opposite exact category is isomorphic to `Q(A)`.

**Checks.**

- The spans `0 ↞ 0 ↣ V` and `0 ↞ V ↣ V` give respectively the zero and whole admissible subobjects of V. For a nonzero one-dimensional vector space these are distinct Q-arrows.
- In the split exact category of finitely generated abelian groups, `ℤ → ℤ/2` is an epimorphism but is not a deflation; it cannot supply a Q-span.
- An invertible span has both legs invertible; an automorphism of V survives as a Q-automorphism.
- Taking the opposite interchanges the inflation and deflation factors without reversing the direction of the resulting Q-category equivalence.

*Needs:* `ExactStructure`; `ExactStructure.conflation_baseChange`; `ExactStructure.conflation_comp_of_isPullback`.

### 2.2 The universal property of `Q(A)`

Prove that a functor from `Q(A)` to D is specified by its object values, its covariant values on admissible inflations and its contravariant values on admissible deflations. Each assignment preserves identities and composition. For every admissible bicartesian square, the two induced composites agree. These conditions extend the assignments uniquely across the normal form of a Q-span. An additive functor preserving conflations consequently induces `QMap`, with identity, composition and natural-isomorphism compatibility.

A is small exact and D arbitrary; impose only admissible bicartesian-square relations from span composition.

(Weibel IV, 6.1, the factorisation, and 6.2, the proof, pp.IV.53–IV.54;Quillen, §2, pp.99–104.)

Use:

- `QCat.lift`: functor out of `Q(A)` determined by the data.
- `QCat.lift_inflation`: Its value on an inflation.
- `QCat.lift_deflation`: Its value on a deflation.
- `QCat.lift_unique`: Uniqueness of the functor.
- `QCat.map`: functor induced by an exact functor.

**Checks.**

- For the identity exact functor, the induced Q-map fixes the zero and whole Q-subobject arrows of k.
- The zero exact functor sends both arrows `0→k` to the single identity of `Q(0)`.
- The square (`0→k`, `0→0`) with vertical maps `id₀` and `k→0` is not bicartesian: its two reversed-deflation/inflation composites are the distinct zero and whole subobject arrows.

*Needs:* §2.1.

### 2.3 Small models, transport of the exact structure and independence

Extend Q, BQ and the higher K-groups to essentially small exact categories by applying them to a small exact model. Prove independence of that model, and naturality for squares commuting up to an exact natural isomorphism. An additive equivalence preserving and reflecting conflations induces a Q-equivalence and a homotopy equivalence of classifying spaces. The result concerns Q and higher homotopy, beyond the algebraic transport of exact `K₀`.

The named targets are `SmallExactModel`, `qConstruction_model_independent` with the hypotheses and conclusions above.

For essentially w-small C, transport conflations to a w-small model; its Q, nerve, realization and groups are w-small. Ring projective models are u-small for R:Type u.

(Weibel IV, D 6.3.1 and the surrounding remark, p.IV.55.)

The `SmallExactModel` interface records a small category, its transported exact structure and a conflation-preserving and -reflecting equivalence to the given category. Its comparison API identifies Q-functors for different choices, commutes with exact functors and natural isomorphisms, and satisfies the identity and three-model cocycle laws.

**Checks.**

- For the zero exact category, every small exact model has contractible BQ and zero K-groups; changing the chosen zero object does not create a component.
- Finite-dimensional k-spaces and their matrix skeleton give the same `K₀`, with the standard one-dimensional object representing +1 in either model.
- The identity additive functor on finitely generated abelian groups does not identify the split and abelian exact models: the nonsplit sequence `ℤ --2→ ℤ → ℤ/2` is a conflation only in the latter. An additive equivalence without the exact-structure comparison is insufficient.

*Needs:* §2.1; `ExactStructure.transport`; `ExactK0.transportEquiv`; `ExactK0.mapEquiv`.

### 2.4 The fundamental group of the Q-construction is the Grothendieck group

Prove that `BQ(E)` is connected and that `π₁(BQ(E),0)` is the `ExactK₀(E)`. The class of A is the loop that follows the inflation `0→A` and returns along the reverse of the Q-arrow associated with `A↠0`. The triangle relations in the nerve impose `[B]=[A]+[C]` for each conflation `A↣B↠C`. Construct inverse using `ExactK₀`’s universal property and the covering associated with the functor from `Q(E)` to its one-object Grothendieck-group category; prove both composites on generators.

The named targets are `twoEdgeLoop`, `pi1QEquivExactK0` with the hypotheses and conclusions above.

E is small, or transported by §2.3. Inflation followed by reversed deflation gives the positive loop; reversing both edges negates its class.

(Weibel IV, P 6.2 and proof, Example 6.2.3, p.IV.54;Quillen, §2, pp.99–104.)

**Checks.**

- The zero object gives the constant loop and class zero.
- For finite-dimensional k-spaces, the stated loop for k has class +1; traversing it backwards gives `−1`. The arithmetic direction is `1−0` versus `0−1`.
- The split conflation `k↣k²↠k` gives the relation `2=1+1`; treating the positive loop as a difference of the two identical legs would incorrectly give zero.

*Needs:* §2.2; §2.3; Layer 1; `ExactK0`; `ExactK0.of`; `ExactK0.of_conflation`; `ExactK0.AdditiveInvariant`; `ExactK0.lift`; `ExactK0.liftEquiv`; `ExactK0.hom_ext`; `ExactK0.transportEquiv`; `CategoryTheory.nerve`; `SSet.toTop`; `HomotopyGroup`.

### 2.5 The K-groups of an exact category

Define `BQ(E)=|nerve Q(E)|` with its zero-object vertex as basepoint, `KSpace(E)=ΩBQ(E)`, and `K_n(E)=π_{n+1}BQ(E)` for `n≥0`. Prove that these groups are commutative, including `n=0` by §2.4. Construct maps for exact functors and prove that an exact natural isomorphism gives homotopic maps. Change of zero object and of small model gives the compatible canonical group isomorphisms. The equality `π_nKSpace=π_{n+1}BQ` includes `π₀` as the component group of the loop space.

Keep the essential-small universe throughout; zero-object comparison isomorphisms give basepoint independence.

(Weibel IV, D 6.3, p.IV.54;Quillen, §2, pp.99–104.)

Use:

- `KSpace`: based loop space `ΩBQ(A)`, whose `π₀` is ExactK0(A).
- `KGroup`: `π_n KSpace=π_{n+1}BQ`.
- `KGroup.addCommGroup`: Commutative addition, including degree zero.
- `KGroup.map`: map induced by an exact functor.
- `KGroup.map_of_natIso`: Isomorphic exact functors induce the same map.
- `KGroup.zero_eq_exactK0`: The natural degree-zero comparison.

**Checks.**

- For finite-dimensional k-spaces, `K₀=ℤ` and `[k]=1`.
- The zero exact category has zero `K_n` for all `n≥0`.
- For k-spaces, BQ is connected but `π₀KSpace=ℤ`, including the virtual component `−1`.
- Opposite duality identifies `K₀(k^op)` with `ℤ` and takes `[k]` to 1.

*Needs:* §2.4; §2.3; `CategoryTheory.nerve`; `SSet.toTop`; `HomotopyGroup`.

### 2.6 Elementary properties: opposites, finite products and filtered colimits

Show that finite products of exact categories give products of Q-categories and K-groups, and that reversing the exact category leaves its K-groups unchanged. For a small filtered diagram of exact categories and exact functors, give its colimit the conflations that descend from a stage and prove continuity of `K_n`. Direct sum makes BQ a homotopy-commutative H-space; prove that its induced addition agrees with the homotopy-group operation. The colimit argument descends finite spans, their equations and finite representatives of homotopies to one stage.

The named targets are `kGroup_op`, `kGroup_finiteProduct`, `kGroup_filteredColimit` with the hypotheses and conclusions above.

Products are finite; check the filtered-colimit conflations against the exact axioms and exact-functor preservation.

(Weibel IV, Elementary properties 6.4, pp.IV.55–IV.56;Quillen, §2, pp.99–104.)

*Needs:* §2.5; Layer 1; `CategoryTheory.Limits.HasFilteredColimits`.

### Examples

For finite-dimensional k-spaces, the two Q-arrows `0→k` associated to the zero and whole subobject are distinct. Their two-edge loop gives `[k]=1` in `K₀(k)`. Although BQ is connected, its loop space has components indexed by `ℤ`.

### Dependencies

Layer 1 categorical homotopy and the supplied exact structure and exact `K₀`.

## Layer 3: Rings and the plus comparison

### 3.1 Scalar extension as an exact functor of finitely generated projectives, without a flatness hypothesis

For a unital map `f:A→B` of associative rings, use AlgebraicKTheory's all-module extension/restriction adjunction and A0's finite-projective restriction of extension. Transport its right-projective functor along `fᵒᵖ` to the native left-projective categories here: `P⊗_{Aᵒᵖ}Bᵒᵖ≅B⊗_A P`, with pure tensors `p⊗bᵒᵖ↦b⊗p`. Prove that this adapter respects the supplied identity and composite tensor isomorphisms, their coherence, the split/exact K₀ comparison and the commutative scalar-extension comparison. These induce the Q-theory maps of §3.2.

Use unital ring maps and essentially small split-exact projective categories, with the supplier's universe transport. Extension on all modules need not be exact; restriction of scalars along an arbitrary map need not preserve finite projectivity.

(Weibel, II.2.2–2.4, pp.70–73;IV.6.3.2, p.319;III.1.1.1, p.180.)

Use:

- `projBaseChange`: left-projective alias of the supplied scalar extension along fᵒᵖ.
- `projBaseChange_exact`: transport of its preservation of split conflations.
- `projBaseChange_id`: transported tensor-unit natural isomorphism.
- `projBaseChange_comp`: transported tensor-associativity natural isomorphism, with coherence.
- `projBaseChange_comm`: agreement with the supplier's native commutative comparison.

**Checks.**

- `ℤ→ℤ/2` is exact on split projectives despite non-flatness.
- `Rⁿ` extends to `Sⁿ`, including `n=0`.
- Extension along `id_R` returns P; extension along `R→S→T` agrees with direct extension.
- Tensoring `ℤ --2→ ℤ` with `ℤ/2` gives the zero map, showing failure of monic preservation on all modules.
- For `k→M₂(k)`, k extends to `M₂(k)`, of Morita rank 2; the induced `K₀` map is `×2`.

*Needs:* AlgebraicKTheory conventions and A0; the `K₀` contract; `ModuleCat.extendScalars`; `ExactStructure.isConflationExact_split`; `ExactStructure`; `finiteProjectiveModules`; `finiteProjectiveModulesExactStructure`; `finiteProjectiveModulesExactStructure_eq_split`; `finiteProjectiveModulesExactStructure_conflation_iff`.

### 3.2 The early ring model: functorial connective K-theory of unital rings

Apply the small-model Q-theory to `P(R)`, the exact category of finite projective left R-modules, and write `K(R)`, `K_n(R)`. For a unital `f:R→S`, the map is induced by f_!. Prove functoriality using the coherent tensor isomorphisms. Its degree-zero comparison carries a projective class to the same exact `K₀` class. Prove finite-product compatibility and filtered continuity in every connective degree: the finite idempotent-matrix model descends objects, maps and their finitely many equations to a common stage, even when transition maps are not injective. The dual `P↦Hom_R(P,R)` gives an exact equivalence `P(R)^op≃P(R^op)`, and opposite-ring K-group isomorphisms natural in ring maps.

Rings in Type u use u-small projective models. Products are finite, filtered diagrams small. Duality takes values in right modules; the dual-basis comparison commutes with scalar extension. Flatness, noetherianness and invariant basis number are unnecessary.

(Weibel IV, D 6.3.2 and Elementary properties 6.4, pp.IV.55–IV.56;Elementary Properties 6.4, the ring instances, pp.IV.55–56.)

Use:

- `KSpace.ofRing`: `ΩBQ(P(R))` in the ring universe.
- `KSpace.ofRing_map`: The based map induced by projBaseChange.
- `KSpace.ofRing_map_id`: Identity compatibility through model comparison.
- `KSpace.ofRing_map_comp`: Composition compatibility up to natural homotopy.
- `KGroup.ofRing_zero_equiv`: `π₀K(R) ≃ TauCeti.ExactK0 (TauCeti.finiteProjectiveModulesExactStructure R)`, preserving `[P]`, naturally in R.
- `KGroup.ofRing_prod`: Finite-product comparison.
- `KGroup.ofRing_colimit`: Filtered-colimit comparison by idempotent descent.
- `KGroup.ofRing_op`: The duality isomorphism `K_n(Rᵒᵖ)≃K_n(R)`.

**Checks.**

- The two projections `R × S → R`,S give the product isomorphism in degree zero and every higher degree.
- Identity and two composable ring maps give the same K-map as the tensor unit/associativity isomorphisms.
- `ℤ → ℤ/2` induces exact scalar extension on the split projective category although it is not flat on all modules.
- An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.
- The degree-zero group of `K(R)` is `TauCeti.ExactK0 (TauCeti.finiteProjectiveModulesExactStructure R)`, and `K₀(f)` is `TauCeti.ExactK0.map` applied to the scalar-extension functor of §3.1; for `R = ℤ` it is `ℤ` generated by `[ℤ]`.
- For a commutative ring the isomorphism `K₀(R^op) ≅ K₀(R)` induced by duality, composed with R^`op = R`, sends `[P]` to `[Hom_R(P, R)]`; for a Dedekind domain it inverts the ideal class of an invertible ideal, so it is not the identity when the class group has an element of order greater than two.

*Needs:* §3.1; §2.5; §2.6; §2.4; §2.3; the `K₀` contract; `finiteProjectiveModules`; `finiteProjectiveModulesExactStructure`; `finiteProjectiveModulesExactStructure_eq_split`; `ExactK0.hom_ext`; §2.3–2.6 and §3.1; finite-projective `K₀` contract.

### 3.3 Stable matrices and elementary transformations

Use AlgebraicKTheory A1's `GL(R)=colim_n GL_n(R)` under `g↦diag(g,1)`, its elementary subgroup E(R), coefficient maps and finite block sums. A2 supplies classical K₁ as the abelianization with its canonical additive GL/E comparison. The local names below are aliases of those carriers and maps. Retain `e_ij(a)=1+aE_ij`, `i≠j`, and `[g,h]=ghg⁻¹h⁻¹`; the supplier's distinct-index identity is `[e_ij(a),e_jk(b)]=e_ik(ab)`.

For the plus comparison, use StableHomotopyKTheory §4.14's realization of the supplied permutation conjugations and its coherent homotopies under successive stabilizations. Its `stableGeneralLinearGroup` and `stableElementaryGroup` identify with the aliases here by the finite-stage identity maps, preserving matrix-labelled edges, ring maps and elementary subgroups. Its plus H-space multiplication uses these homotopies and AlgebraicKTheory's supplied equality in GL/E. Both finite input sizes remain explicit: ordinary finite block sum does not define `StableGL×StableGL→StableGL`.

(Weibel III, D 1.1–1.2, equation (1.3.1), pp.III.1–4.)

Use:

- `StableGL`: alias of A1's diagonal-stabilized group colimit.
- `stableElementary`: alias of A1's stable elementary subgroup.
- `finiteGLBlockSum`: supplied finite block sum, with its permutation-conjugacy comparisons realized as coherent homotopies.
- `StableGL.map`: alias of A1's group map for a unital ring homomorphism.
- `classicalK1`: A2's additive classical K₁, through its canonical GL/E identification.

**Checks.**

- Stabilizing the `1×1` matrix (u) gives diag(u,1), so the identity unit gives the identity stable matrix.
- Over `ℤ`, block summing `I₁` and `(−1)` and then stabilizing gives `diag(1,−1,1)`, whereas block summing `I₂` and `(−1)` gives `diag(1,1,−1)`. They remain distinct under trailing-identity stabilization, but exchanging the last two coordinates conjugates one to the other.
- `e₁₂(a)e₁₂(−a)=1`; using +a for the inverse fails over `ℤ` at `a=1`.
- Over `ℤ` in rank 3, `[e₁₂(1),e₂₃(1)]=e₁₃(1)`, with the displayed commutator order, sign and entry.
- Over `𝔽₂`, `GL₂` has order 6 and its elementary subgroup is not perfect; the third distinct index is necessary for the commutator proof.

*Needs:* AlgebraicKTheory A1–A2; StableHomotopyKTheory §4.14; §1.1 for the realized-nerve comparison.

### 3.4 Whitehead’s stable commutator theorem

Use AlgebraicKTheory A1's theorem that `E(R)` is perfect and equals `[GL(R),GL(R)]`, including normality and the abelian quotient universal property. Its proof uses a third index and the elementary factorization of `diag(g,g⁻¹)`. Transport these statements through the §3.3 aliases as the subgroup hypotheses for the plus construction; A2 supplies the unit-class map. No second stable commutator theorem or classical K₁ carrier is constructed here.

(Weibel III, L 1.3.2, Whitehead L 1.3.3 and equation (1.3.4), p.III.4.)

Use:

- `stableElementary_perfect`: supplied perfection theorem on the aliased subgroup.
- `stableElementary_eq_commutator`: supplied stable GL commutator theorem on that subgroup.
- `classicalK1.unit`: supplied unit classes by `GL₁` stabilization.

**Checks.**

- For a field, GL/E is the multiplicative group of units under determinant.
- Over `ℤ`, the class of `−1` has order 2; it is not annihilated by quotienting to zero.
- At finite rank 2 over `𝔽₂`, `E₂≅S₃` is not perfect. Stabilization is essential.

*Needs:* §3.3; AlgebraicKTheory A1–A2.

### 3.5 Idempotent extension for nonunital maps

For an additive multiplicative map `h:A→B` between unital rings, put `e=h(1)`, prove `e²=e` and `h(a)e=eh(a)=h(a)`, and define the exact right-projective functor `P↦P⊗_A eB`. The module eB is the image of the idempotent left-multiplication map on B, hence finite projective, and tensoring a finite-projective A-summand preserves that property. Construct block tensor comparison under `ℤ⋉A≅ℤ×A` and `ℤ⋉B≅ℤ×B`; Layer 8 uses it to identify the connective fibre map. This supplies nonunital corner maps before the Bass axioms. For the zero map `e=0` the functor is zero, while for a unital map `e=1` it is ordinary scalar extension.

(Weibel, Additive Functors II.2.8, p.II.12, and Example 2.8.1, p.II.13;IV.6.3.2 and finite-product property 6.4, pp.IV.55–56;I Exercise 1.10, p.I.5;the idempotent bimodule and block tensor calculations above.)

Use:

- `idempotentBaseChange`: exact finite-projective functor using eB.
- `idempotentBaseChange_unital`: For `h(1)=1` it agrees with scalar extension.
- `idempotentBaseChange_comp`: tensor comparison for composable nonunital maps.
- `idempotentBaseChange_unitization`: block decomposition identifies the associated fibre map.

**Checks.**

- For the zero map `A→B`, `eB=0` and every projective maps to zero.
- For `id_A`, `eA=A` and the tensor unit recovers P.
- For the corner `R→M₂R`, `e=diag(1,0)`, and `eM₂R` is the first-row projective; the image of R is not the whole `M₂R`.

*Needs:* §3.1–3.2; Mathlib idempotent image and split projective modules.

### 3.6 The Q-extension category

Define the Q-extension category `ExtQ(A)`: objects are conflations `A₀↣B↠C`. A morphism from `A₀↣B↠C` to `A₀′↣B′↠C′` is represented by an intermediate conflation `A₀′↣B↠M`, an inflation `α:A₀′↣A₀`, an inflation `β:B↣B′`, a deflation `ρ:M↠C` and an inflation `ι:M↣C′`. Require the three-row diagram to commute: the intermediate kernel map is `α` followed by `A₀↣B`, the source quotient is `B↠M` followed by `ρ`, `β` carries the intermediate kernel to the target kernel, and the target quotient composed with `β` is `B↠M` followed by `ι`. Identify representatives under an isomorphism of M preserving every map. The right column is the Q-span `C↞M↣C′`, giving `t:ExtQ(A)→QA`. Its fibre `E_C` is a groupoid: `α` and `β` are then isomorphisms over C. Identify `E_0` with `Core(A)`, by `A₀↦(A₀=A₀↠0)`. Direct sum on the kernel and middle terms defines its `Core(A)`-action. This is a Q-type category of extensions, different from the ordinary category of maps of conflations.

A is small exact; only the later fibre comparison needs split exactness. Morphisms use admissible quotient/pullback data.

(Weibel IV, D 7.3;(7.3.1), p.IV.62;§7, opening, p.IV.61.)

Use:

- `ExtCat`: extension category of an exact category.
- `ExtCat.quot`: The quotient projection to QA.
- `ExtCat.fibre_zero`: The zero fibre is `Core(A)`.

**Checks.**

- The fibre over the zero object is the groupoid of isomorphisms.
- The right column of every morphism (7.3.1) is a morphism of `Q(A)`, and composing morphisms of EA composes these columns, so taking the quotient term is a functor t from EA to `Q(A)`.
- The fibration criterion does not apply to the extension category over `Q(A)` itself unless the category is zero; the localised functor must be used.
- EA is not the category of conflations: its morphisms over an identity of `Q(A)` are pairs of isomorphisms (Weibel 7.4), whereas a conflation `X ↣ X ↠ 0` with X nonzero has the zero endomorphism in the category of conflations; a formalisation that reused the category of conflations here would lose the identification of the fibre over 0 with the groupoid of isomorphisms.

*Needs:* §2.1; `CategoryTheory.Core`.

### 3.7 Monoidal products in the extension fibres

On `E_C`, define the product of `A₁↣B₁↠C` and `A₂↣B₂↠C` by `A₁⊕A₂↣B₁×_C B₂↠C`. The trivial extension `0↣C=C` is its unit. Construct symmetric monoidal coherence from pullback universality. The split-extension functor `η_C:S→E_C`, `A↦(A↣A⊕C↠C)`, is faithful and strong symmetric monoidal. If A is split exact, every `E_C`-object is isomorphic to a split extension, so the associated translation-action category is connected.

For `C∈A`, Only the last assertion uses split exactness.

(Weibel IV, L 7.5 and Remark 7.5.2, pp.IV.62–63.)

Use:

- `ExtFibre.tensor`: displayed pullback product in `E_C`.
- `ExtFibre.unit`: sequence `0 ↣ C = C`.
- `ExtFibre.split`: faithful symmetric monoidal split-extension functor `η_C`.
- `ExtFibre.splitEssentiallySurjective`: For split exact A, every `E_C`-object is isomorphic to `η_C(A₀)`.

**Checks.**

- At `C=0` the product identifies with direct sum.
- `η_C(A₁)*η_C(A₂) ≅ η_C(A₁⊕A₂)`, compatibly with quotient C.
- A nonsplit extension is not isomorphic to `η_C` of its kernel.

*Needs:* §3.6; `ExactStructure.conflation_baseChange`; `ExactStructure.conflation_biprod`.

### 3.8 Cartesian extension lifts

For the Q-span `C′↞M↣C` and an extension `A↣B↠C`, form `B′=B×_C M` and let A′ be the kernel of `B′↠M↠C′`. The extension is the cartesian lift over that Q-arrow. Construct pullback functors `E_C→E_C′` and their coherent identity and composition isomorphisms. The S-action commutes with these lifts, so localizing the fibres preserves the prefibred structure.

Choose span and pullback data; comparisons are natural isomorphisms, with `A→A′` and `B′→B` oriented as in §3.6.

(Weibel IV, L 7.7, E 7.2 and E 7.5, pp.IV.63–65.)

Use:

- `ExtCat.baseChange`: fibre functor `φ*` defined by pullback and composite kernel.
- `ExtCat.cartesianArrow`: canonical cartesian arrow `φ*E→E` over `φ`.
- `ExtCat.baseChange_comp`: Coherent `(ψφ)*≅φ*ψ*` with compatible domains.
- `ExtCat.baseChange_zero_inflation`: Base change along `0↣C` extracts the kernel.
- `ExtCat.baseChange_zero_deflation`: Base change along `0↞C` extracts the middle term.

**Checks.**

- Lifting `id_C` gives a sequence canonically isomorphic to E.
- An arrow `E→φ*E` would project from C to C′ and cannot lie over `φ` when C′ and C differ.
- For a split extension `A↣A⊕C↠C` the two zero lifts yield A and `A⊕C` respectively.

*Needs:* §3.6; `ExactStructure.conflation_baseChange`; `ExactStructure.conflation_comp_of_isPullback`; Layer 1.

### 3.9 Contractibility of the localised extension-action category

For split exact A, prove `B(S⁻¹S)→B(S⁻¹E_C)` is a homotopy equivalence. In the action-localization fibration, the third term is the realization of the translation-action category. Its product is connected and homotopy associative; the diagonal supplies `id≃2·id`. The H-space inverse then cancels one copy and contracts this third term. Track the map as the one induced by `η_C`.

The named targets are `ExtFibre.localized_action_equivalence` with the hypotheses and conclusions above.

`Core(A)` acts faithfully on `E_C`. The action fibration and CW realization of §1.6 apply; H-space cancellation needs connectedness.

(Weibel IV, P 7.6, p.IV.63.)

*Needs:* §3.7; Layer 1.

### 3.10 The localised extension category fibres over Q

Prove that every base change between the localized extension fibres is a homotopy equivalence: compare the lift along each inflation and reversed deflation with the split-extension functor. Theorem B then gives `B(S⁻¹S)→B(S⁻¹ExtQ(A))→BQA` as a homotopy-fibre sequence over zero.

The named targets are `ExtQ.localized_baseChange_equivalence`, `ExtQ.localized_fibration` with the hypotheses and conclusions above.

A is split exact; cartesian lifts respect the faithful action, with coherent comparison isomorphisms.

(Weibel IV, T 7.8;proof, pp.IV.63–64.)

*Needs:* §3.8; §3.9; §2.1; Layer 1.

### 3.11 Contractibility of extensions

Contract `BExtQ(A)` for any small exact A by the extension diagrams and the inflation subcategory of QA. For split exact A, prove that localization by its S-action leaves the total category contractible. The fibre sequence of §3.10 identifies `B(S⁻¹S)` with `ΩBQA`. The localization invariance concerns this action on this contractible model, not arbitrary localization of categories.

The named targets are `ExtQ.contractible`, `ExtQ.localized_contractible` with the hypotheses and conclusions above.

The inflation category has zero as initial object. Use subdivision and the action-localization comparison of §1.3 and §1.6.

(Weibel IV, Proof of T 7.1 and E 7.3, pp.IV.64–65.)

*Needs:* §3.6; Layer 1.

### 3.12 The plus-equals-Q theorem

For a small split exact category A, prove `ΩBQA≃B(S⁻¹S)`, where `S=Core(A)` with direct sum. Localize the Q-extension fibres by the S-action, prove the base-change equivalences, and use Theorem B together with contractibility of the localized total category. For `P(R)`, first identify the zero component using the supplied right-projective model over Rᵒᵖ. Use §3.14's inverse-transpose and grouplike-inverse normalization to compare with `BGL(R)⁺`, giving the plus/Q comparison in every positive degree. After choices of component translations this gives `K(R)≃K₀(R)_discrete×BGL(R)⁺` as spaces.

The named targets are `plusEqualsQ`, `stableGL_plus_comparison` with the hypotheses and conclusions above.

The action is faithful and A split exact. Ring maps and block sum preserve the zero-component comparison; §3.15 controls other component translations.

(Weibel IV, T 7.1 and C 7.2, pp.IV.61–IV.62.)

*Needs:* §3.6; §2.5; Layer 1; §3.10; §3.11.

### 3.13 Projective complements and cofinality

Use StableHomotopyKTheory §§4.15 and 4.20–4.21's `projectiveFreeComplement`, `cofinality` and `kSpace_projective_plus`, transported from AlgebraicKTheory A0 at Rᵒᵖ to the native left-projective model. Retain the actual splitting maps in `P⊕P′≅Rⁿ`; P′ is finite projective. Compare the resulting inclusion of free into projective group completions with Q-theory through §3.12: it induces isomorphisms on all positive K-groups and an injection on `K₀`. This explains why stable GL detects the positive groups while its free-module components need not account for all of `K₀`. Use §1.6, rather than the later Waldhausen cofinality theorem, in the plus comparison.

The named targets are `cofinalFreeComparison` with the hypotheses and conclusions above.

The subgroupoid on finite free modules is full, and finite extensions split. No invariant-basis-number assumption is needed.

(Weibel IV, Cofinality T 4.11;its proof, and the paragraph before C 4.11.1, pp.IV.44–45.)

**Checks.**

- The zero projective admits complement zero and free rank zero, including over the zero ring.
- A nonprincipal invertible ideal of a Dedekind domain has a projective complement but no free complement: a free complement would leave its nontrivial determinant class unchanged.
- Over `k×k`, the free-subcategory map has diagonal image in `K₀=ℤ²`, while it is an isomorphism on every positive K-group.

*Needs:* AlgebraicKTheory A0; StableHomotopyKTheory §§4.15 and 4.20–4.21; `Module.Finite.exists_comp_eq_id_of_projective`; `LinearMap.ker_eq_range_of_comp_eq_id`; §3.12; Layer 1.

### 3.14 Early absolute K0/K1 comparison for rings

Prove natural comparison `π₀K(R)≃ExactK₀(P(R))` and the zero-component comparison `π₁K(R)≃classicalK1(R)` with AlgebraicKTheory A2's group. The latter identifies its supplied projective-automorphism class with the loop under group completion and plus/Q. For the right-projective convention it sends `[P,g]` to that same automorphism loop; the left-projective convention uses the following matrix transport. Check block sums, scalar-extension naturality and the supplied complement-independent automorphism presentation. In the ring specialization of §4.16 that presentation is this same group.

Write `τ(g)=(gᵗ)ᵒᵖ∈GL_n(Rᵒᵖ)`. Transposition reverses multiplication: `τ(gh)=τ(h)τ(g)`. It therefore gives an additive isomorphism on the supplied abelian K₁ quotients, preserving unit classes, whereas `g↦τ(g⁻¹)` is the actual group isomorphism between stable GL models. On the plus spaces compose the latter comparison with additive inversion in the grouplike zero component. Its degree-one map is the classwise transpose adapter. Thus the left-linear row automorphism `x↦xg` has class `[g]∈classicalK1(R)`; using inverse transpose alone would give `−[g]`. Transport elementary subgroups, stabilization and projective complements along these maps. This normalization also fixes the Laurent unit used in §9.17.

The named targets are `ringKGroup.zeroEquiv`, `ringKGroup.oneEquiv` with the hypotheses and conclusions above.

GL is the stable colimit under diagonal stabilization, E the stable elementary subgroup. The comparisons use the split exact structure on `P(R)`.

(Weibel IV, D 1.1–1.1.2, pp.IV.2–3;T 7.1, C 7.2 and E 7.9, pp.IV.61–65.)

**Checks.**

- Over a commutative field, multiplication by a unit a represents a under determinant, including a of order greater than two; the uncorrected inverse-transpose map would give a⁻¹.
- A right projective P and its scalar extension have the same classes in the supplied split K₀ and the native exact K₀ comparison; in left convention use the supplier at Rᵒᵖ.
- Adjoining the identity on two different complements of P gives the same supplied K₁ class and the same Q-loop.
- Over `ℤ`, the automorphism −1 retains its nonzero order-two class; an elementary shear represents zero.

*Needs:* §2.4; §3.12; §3.13; AlgebraicKTheory conventions and A0–A2; the `K₀` contract; Layer 1.

### 3.15 What the product description does not say

The comparison `K(R) ≃ K₀(R)_discrete × BGL(R)⁺` is an equivalence of spaces after choosing a point in every component. These points represent virtual classes `[P] − [Q]`; they cannot in general be chosen as projective modules. Translations identify each component with the component of zero, but are not naturally chosen in R. Keep the canonical plus comparison with the zero component separate from this product description. No splitting of the connective spectrum into its degree-zero and positive parts follows.

The named targets are `ringKSpace.componentwise_product` with the hypotheses and conclusions above.

R is unital, with no invariant-basis-number hypothesis. The group `K₀` has the discrete topology. The infinite-loop structure is the one constructed from the S-deloopings.

(Weibel IV, C 7.2, p.IV.62.)

**Checks.**

- Over a field, −`1 ∈ K₀(k)=ℤ` is not represented by a vector space; it is `[0]−[k]`.
- For `k×k`, the components are indexed by `ℤ²`, not by a single rank.
- The comparison on the zero component is compatible with ring maps even though arbitrary chosen translations of other components are not.

*Needs:* §3.2; §3.12.

### Examples

The unital map `k→M₂(k)` sends the rank-one free module to the whole matrix ring, of Morita rank 2. The nonunital corner instead gives the rank-one row projective. Over `k×k` the `K₀` group is `ℤ²` and the free-subcategory image is its diagonal.

### Dependencies

Layers 1–2; AlgebraicKTheory conventions and A0–A2; supplied finite-projective exact categories.

## Layer 4: Exact additivity, resolution and abelian localization

### 4.1 The `3×3` lemma for exact categories

Establish intrinsic `3×3` lemma for E-conflations. In a commutative three-row, three-column diagram with conflation columns, a conflation middle row and either outer row force the other outer row to be a conflation. If both outer rows are conflations, the middle row is a conflation provided its two maps compose to zero. Prove these statements through admissible pullback–pushout squares and kernel–cokernel universality, without an ambient abelian category.

The named targets are `exactCategory_threeByThree` with the hypotheses and conclusions above.

Use the exact axioms and their duals. The second implication requires zero composite in addition to diagram commutativity.

(Bühler, C 3.6 (`3 × 3`-L );its proof, pp.13–14 (arXiv v2);P 3.1 and L 3.5, pp.12–13 (arXiv v2).)

*Needs:* `ExactStructure`; `ExactStructure.conflation_cobaseChange`; `ExactStructure.conflation_baseChange`; `ExactStructure.bicartesianSq_of_isPushout_of_isInflation`; `ExactStructure.exists_conflation_comp`; `ExactStructure.conflation_comp_of_isPullback`.

### 4.2 The exact category of conflations

Equip the `ConflationCategory(E)` with the componentwise exact structure: a sequence of its objects is a conflation when each of its three sequences of components is an E-conflation. Prove exact axioms by §4.1. Show that the three evaluation functors s,t,q are exact and that `(X,Z)↦(X↣X⊕Z↠Z)` is exact. Exact functors into this category correspond to pointwise conflations of exact functors into A. This new exact structure extends the existing underlying category and evaluation functors; it is different from ExtQ of §3.6.

A is essentially small exact; rows are witnessed conflations and component sequences are maps of short complexes.

(Weibel V, Universal Example 1.1.1, p.V.1;Bühler, E 3.9 (Heller) and Remark 3.10, p.16 (arXiv v2);Weibel II, Extension Categories 9.3 and P 9.3.1, pp.II.92–93.)

Use:

- `ConflationCategory.exactStructure`: Componentwise exactness on the supplied conflation category.
- `ConflationCategory.conflation_iff`: Conflations are exactly the three-column E-conflations.
- `ConflationCategory.isConflationExact_sub`: Exactness of subterm evaluation s.
- `ConflationCategory.isConflationExact_total`: Exactness of total-term evaluation t.
- `ConflationCategory.isConflationExact_quot`: Exactness of quotient evaluation q.
- `ConflationCategory.coprod`: The split-sequence functor `(X,Z)↦(X↣X⊕Z↠Z)`.
- `ConflationCategory.sub_quot_coprod`: (s, q) ∘ ∐ = id and t ∘ ∐ ≅ ⊞.
- `ConflationCategory.exactFunctorEquiv`: Exact functors into `E(A)` correspond to conflations of exact functors.
- `ConflationCategory.essentiallySmall`: Essential smallness inherited from A.

**Checks.**

- A sequence of conflations is a conflation of `E(A)` if and only if its three columns are E-conflations; a sequence that is a kernel–cokernel pair of short complexes but has a column that is not an E-conflation is not one.
- (s, q) ∘ ∐ is the identity of `A × A`, and t ∘ ∐ is naturally isomorphic to the biproduct functor.
- (s, q) induces ExactK0 `(E(A)) ≃ ExactK0 A × ExactK0` A, with inverse induced by ∐ (Weibel, Proposition II.9.3.1).
- For the category of abelian groups with its canonical exact structure, `E(Ab)` is not an abelian category (Bühler, Remark 3.10), so its exact structure is not the canonical structure of an abelian category.

*Needs:* `ExactStructure`; `ExactStructure.ConflationCategory`; `ExactStructure.conflation_cobaseChange`; `ExactStructure.conflation_baseChange`; `ExactStructure.conflation_biprod`; §4.1.

### 4.3 The Additivity theorem

For the componentwise exact category of conflations, prove that `(s,q):QConf(A)→QA×QA` realizes to a homotopy equivalence. Therefore a pointwise conflation `F′↣F↠F″` of exact functors satisfies `K(F)≃K(F′)+K(F″)`, with the homotopy compatible with the H-space structures. Iterate to a finite admissible filtration with exact quotient functors. For a bounded admissibly exact sequence of exact functors, the alternating sum of induced maps vanishes.

The named targets are `exactCategory_additivity`, `exactFunctor_filtration_additivity` with the hypotheses and conclusions above.

Categories are essentially small. Every functor, including each filtration quotient, is exact.

(Weibel V, Additivity T 1.2;its proof, p.V.2;Extension T 1.3 and its proof for exact categories, pp.V.2–4;C 1.2.1 and P 1.8, pp.V.2 and V.9.)

*Needs:* §2.5; §4.2; Layer 1; `ExactStructure.conflation_cobaseChange`; `ExactStructure.conflation_baseChange`.

### 4.4 Length-one resolution comparison

Let P be a replete full exact subcategory of H, closed under extensions and under kernels of admissible epimorphisms between its objects. Assume that every `X ∈ H` admits a conflation `P₁ ↣ P₀ ↠ X` with `P₀`,`P₁ ∈ P`. Prove that `QP → QH` induces a homotopy equivalence. Use the full subcategory of QH on P-objects only as an intermediate comma model: it need not have the same morphisms as QP. Contract the comma categories by comparing length-one resolutions and their common refinements.

The named targets are `resolution_lengthOne` with the hypotheses and conclusions above.

Use induced exact structures and essentially small categories; length `≤1` resolution is stronger than a P-cover.

(Quillen, §4 T 3 full proof, pp.108–109.)

**Checks.**

- For `P=H` every object has the resolution `0 ↣ X = X`, and the comparison is the identity.
- For a DVR, a finite torsion module has a length-one resolution by finite free modules; the theorem applies.
- Over `k[ε]/(ε²)`, the simple module k has projective covers but no finite projective resolution. Covers alone would incorrectly force its Cartan map, multiplication by 2, to be an isomorphism.

*Needs:* §2.1; Layer 1.

### 4.5 Resolution dimensions and successive exact subcategories

For a resolving `P ⊂ H`, let `H_n` be the full subcategory of objects with admissible P-resolution length at most n. Prove extension closure and the admissible-kernel closure needed for `H_n ⊂ H_{n+1}`; every object of `H_{n+1}` has a length-one `H_n`-resolution. Apply the preceding comparison successively. If every H-object has finite P-resolution, the filtered union of the `H_n` is H and finite-data continuity gives `K(P) ≃ K(H)`.

The named targets are `resolutionSubcategory`, `resolutionSubcategory_successor` with the hypotheses and conclusions above.

P is replete, full, extension closed and closed under admissible kernels between P-objects. Resolutions are finite and admissible.

(Quillen, §4 C 1 and its three-inequality proof, pp.109–111.)

**Checks.**

- `H₀=P`; a zero object has resolution length zero.
- For `P=P(ℤ)`, `ℤ/2` has a length-one resolution and belongs to `H₁` but not `H₀`.
- For dual numbers `k[ε]/ε²`, the simple module k has infinite projective dimension and belongs to none of the `H_n`; omitting the finite-resolution hypothesis would change the union.

*Needs:* §4.4; §2.6.

### 4.6 The Resolution theorem

For a resolving full exact `P⊂H`, assume every H-object has a finite admissible P-resolution. The inclusion then induces `K(P)≃K(H)`, and hence isomorphisms in all connective degrees. Prove this using the bounded-resolution subcategories and §4.4–4.5. For a ring, compare its finite projectives with the finitely generated modules admitting finite projective resolutions; in the finite-global-dimension noetherian scope this identifies K-theory with G-theory. The new assertion is the higher-space comparison; the degree-zero resolution comparison is a supplier.

The named targets are `exactCategory_resolution` with the hypotheses and conclusions above.

`P⊂H` is replete, full, extension closed and admissible-kernel closed. H is essentially small and every H-object has finite admissible P-resolution. For rings use finite projectives and modules finitely resolved by them; left noetherian finite-left-global-dimension rings suffice. Scheme resolution is separate.

(Weibel V, Resolution T 3.1;proof, p.V.20;Weibel II, Example 8.2.4, p.II.77;E 9.10(d), p.II.100.)

*Needs:* §2.5; §2.6; Layer 1; `ExactStructure.resolutionEquiv`; `moduleResolutionEquiv`; §4.5.

### 4.7 The actual two intersection functors in dévissage

Let A be an essentially small abelian category with its abelian exact structure, and B a full exact abelian subcategory closed under A-subobjects and A-quotients. Assume each A-object has a finite B-filtration.

In the dévissage comma model, an object is an admissible layer `L⊂M⊂X` with M/L in B. Given one fixed layer `L₀⊂M₀`, intersections with `L₀` and `M₀` provide functorial comparisons of layer posets. Show that the resulting finite zigzag contracts the comma category when X has a finite B-filtration. Intersections and quotient stability are essential: the filtration is used to reduce to one B-layer, not to manufacture exact successive-quotient functors.

The named targets are `devissage_layer_contraction` with the hypotheses and conclusions above.

B need not be extension closed in A; the intersections and quotients are formed in the abelian category A.

(Quillen, §5 T 4 full proof, pp.112–113.)

**Checks.**

- In finite abelian p-groups with B the groups killed by p, intersecting subgroups of `ℤ/p²` with its subgroup `pℤ/p²` again gives admissible subobjects in A.
- The filtration `0⊂pℤ/p²⊂ℤ/p²` has two B-layers although B is not extension closed in A.
- Finite free abelian groups with their split exact structure are not an abelian ambient category: the cokernel of multiplication by 2 is missing. The intersection proof above does not apply to that ambient category.

*Needs:* §2.1; Layer 1.

### 4.8 The Devissage theorem

Let A be an essentially small abelian category with its abelian exact structure, and B a full exact abelian subcategory closed under A-subobjects and A-quotients. Assume every A-object has a finite filtration with quotients in B. Prove `K(B)≃K(A)` by the contracted layer comma categories and Theorem A. For a nilpotent ideal I in a noetherian ring, the filtration by powers of I identifies `G(R/I)` with `G(R)`. For the category of modules killed by a power of a central element, use its filtered union of finite-exponent subcategories and the same argument.

The named targets are `exactCategory_devissage` with the hypotheses and conclusions above.

A,B are essentially small; B need not be extension closed. Successive quotients need not give exact functors, so use dévissage rather than functor-filtration additivity.

(Weibel V, Devissage T 4.1;proof, p.V.33;Open Problem 4.1.1, p.V.33.)

**Checks.**

- For finite modules over `ℤ/p²`, inclusion of finite `𝔽_p`-spaces induces the dévissage equivalence, and `[ℤ/p²]` corresponds to `2[𝔽_p]` in degree zero.
- For B=A the comparison is the identity, and the zero abelian category has zero K-groups.
- The subcategory B=0 cannot déviss a nonzero finite-dimensional k-space: the required finite B-filtration does not exist.

*Needs:* §2.5; Layer 1; `TauCeti.simpleClassBasis` in the Artinian-ring specialization; §4.7.

### 4.9 Isomorphic quotient comma models

Let B be a Serre subcategory of a small abelian A, let `q:A→A/B` be the exact quotient, and fix `L∈A/B`. Inside L↓Qq retain those (X,u) for which `u:L→qX` is an isomorphism. Prove its inclusion is a realization equivalence by contracting the refinement comma categories using representatives of quotient subobjects. At `L=0` this model identifies with QB: `qX=0` means `X∈B`, and the induced Q-morphisms are precisely those of B.

The named targets are `LocalizationModel.isoComma_equivalence` with the hypotheses and conclusions above.

Use the abelian Serre quotient and fractions whose kernels and cokernels lie in B.

(Weibel V, Claims5.1.2–5.1.3, p.V.36;Quillen, §5 T 5 and L 1–5, pp.113–116.)

*Needs:* §2.1; §2.2; Layer 1; `CategoryTheory.ObjectProperty.IsSerreClass`.

### 4.10 Models of a quotient object with kernel functor

For `N∈A`, construct `E_N` on maps `h:X→N` becoming isomorphisms under q. Its arrows are Q-spans between X-terms, compatible with the maps to N. The kernels belong to B and the induced kernel spans define `k_N:E_N→QB`. Let E′_N be the full subcategory on epimorphic h. A map `g:N→N′` inverted by q induces g_* by postcomposition, and the kernel comparison is natural up to the Q-transformation.

A is small abelian, B Serre, and exact structures abelian. Both `ker(h)` and `coker(h)` lie in B.

(Weibel V, D before Claim5.1.4 and Claim5.1.6, pp.V.36–37;Quillen, §5 T 5 and L 1–5, pp.113–116.)

Use:

- `LocalizationModel`: category `E_N` of quotient-isomorphism lifts `h:A→N` and Q-spans over N.
- `LocalizationModel.kernel`: kernel functor `k_N` to QB.
- `LocalizationModel.epimorphic`: full subcategory E′_N.
- `LocalizationModel.postcompose`: functor g_* for g invertible modulo B.
- `LocalizationModel.postcompose_id`: Postcomposition by identity is identity.
- `LocalizationModel.postcompose_comp`: Postcomposition by g′g is the composite.
- `LocalizationModel.kernel_postcompose`: Natural inflation `ker(h)→ker(gh)`.

**Checks.**

- For `h=id_N`, its kernel is zero.
- In finite 2-primary groups, `h:ℤ/4→ℤ/2` has kernel `ℤ/2` and cokernel zero; killing that Serre category makes qh invertible.
- For `h=id_{ℤ/4}` and `g:ℤ/4→ℤ/2`, the kernel comparison is `0→ℤ/2`, with cokernel in the Serre subcategory.

*Needs:* §2.1; §2.2; `CategoryTheory.ObjectProperty.IsSerreClass`.

### 4.11 Epimorphic kernel equivalence

Prove `Bk′_N:B(E′_N)→BQB` is an equivalence. Factor a Q-arrow in the two possible orders available in an abelian category; push out its kernel inflation to obtain compatible epimorphic models. Apply Theorem A to the resulting comma categories, contracting them through their common pushout refinements.

The named targets are `LocalizationModel.epi_kernel_equivalence` with the hypotheses and conclusions above.

Use E′_N from §4.10 and the admissible Q-span composition, not ordinary maps of kernels alone.

(Weibel V, Claim5.1.4, p.V.36;Quillen, §5 T 5 and L 1–5, pp.113–116.)

*Needs:* §4.10; §2.1; Layer 1.

### 4.12 Epimorphic models suffice

For `N_i⊂N` with `N/N_i∈B`, pull the epimorphic model over `N_i` into `E_N`. Their union compares E′_N with `E_N` by common image refinements. Prove `B(E′_N)→B(E_N)` and `Bk_N` are equivalences. If qg is invertible, the comparison for g_* commutes with the kernel equivalences and is also an equivalence.

The named targets are `LocalizationModel.epi_inclusion_equivalence` with the hypotheses and conclusions above.

The subobject indexing category includes N and is directed under sums. B is closed under subobjects, quotients and extensions.

(Weibel V, Claims5.1.5–5.1.6, pp.V.36–37;Quillen, §5 T 5 and L 1–5, pp.113–116.)

*Needs:* §4.10; §4.11; Layer 1.

### 4.13 Filtered quotient models

For `L∈A/B`, organize representatives `(N,qN≅L)` and their maps over L into the quotient refinement category. Prove it is filtered by clearing the finitely many denominators of each finite diagram and equality. The isomorphic comma model is the filtered union of the `E_N` models; finite-data realization continuity makes each comparison a weak equivalence. Identify the base-change map for `0↣L` with these comparisons and conclude the homotopy-fibre criterion for Qq.

Use `LocalizationModel.quotientRefinement L` for this category, with `representative` its forgetful functor to A and `quotientIso` the specified natural isomorphism from its composite with q to the constant L-functor. Identity and composition are inherited from A subject to that commuting equation; `LocalizationModel.refinement_filtered` supplies finite cocones and equality refinements.

Refinements preserve `qN≅L`; use quotient fractions and §1.1, §4.9–4.12.

(Weibel V, Claim5.1.7 and conclusion of T 5.1, p.V.37;Quillen, §5 T 5 and L 1–5, pp.113–116.)

**Checks.**

- For `B=0`, q is an equivalence and the representative category over L is equivalent to a point.
- For `B=A` and `L=0`, every object is a representative and the zero object is terminal; it is not an empty refinement category.
- In finitely generated abelian groups modulo finite groups, identify L with `ℚ`. Representatives `(ℤ,1/2)` and `(ℤ,1/3)` admit a common target `(ℤ,1/6)` with maps multiplication by 3 and 2. Restricting refinement maps to integral isomorphisms would lose this cocone.

*Needs:* §4.9; §4.12; §2.1; Layer 1.

### 4.14 Serre localization

For a Serre subcategory B of a small abelian A, prove `K(B)→K(A)→K(A/B)` is a homotopy-fibre sequence. Construct nullhomotopy from the quotient functor, and identify the fibre by the localization models of §4.9–4.13. Obtain the natural exact sequence `K₁(A/B)→K₀(B)→K₀(A)→K₀(A/B)→0` and its higher terms. Exact functors of Serre pairs preserve the boundary. An arbitrary exact subcategory does not satisfy this theorem’s hypotheses.

The named targets are `serreLocalization` with the hypotheses and conclusions above.

B is full, subobject-, quotient- and extension-closed. The quotient is abelian Serre, distinct from the additive ideal quotient.

(Weibel V, Abelian Localization T 5.1;(5.1.1), p.V.35;E 5.1, pp.V.37–38.)

*Needs:* §4.8; §4.6; §2.2; Layer 1; `CategoryTheory.ObjectProperty.IsSerreClass`; §4.13; §4.9.

### 4.15 Relative triples for an additive functor

For a small additive `T:C→D`, define the relative split group by triples `(P,α,Q)` with `α:T(P)≅T(Q)`. Take the free abelian group on isomorphism classes of triples and impose direct-sum additivity and `[P,α,Q]+[Q,β,R]=[P,β∘α,R]`. Its difference map is `[P]−[Q]` in split `K₀(C)`. The groups here use split additive categories; comparison with nonsplit exact `K₁` is a separate theorem.

T is additive and C,D small. Completion versions apply the construction explicitly to `C^♮,D^♮`.

(Weibel, §II.2.10, p.77;E II.2.17(a–b), p.81.)

Use:

- `RelativeAdditiveTriple`: Objects P,Q of C and an isomorphism `TP≅TQ`.
- `ClassicalRelativeK0`: abelian group presented by triple sum and composition relations.
- `ClassicalRelativeK0.difference`: map to split `K0(C),[(P,α,Q)]↦[P]−[Q]`.
- `ClassicalRelativeK0.map`: Maps from additive commuting squares with a specified comparison isomorphism.
- `relativeDifference a b=a−b` in any abelian group records the orientation; prove the zero, diagonal and swap formulas used by `ClassicalRelativeK0.difference`.

**Checks.**

- `[P,id,P]=0` follows from the composition relation.
- `[P,α,Q]=−[Q,α⁻¹,P]`, so the difference map changes sign under inversion.
- For `C=finite`-dimensional k-spaces and `D=0`, the group is `ℤ` and [k,unique,0] maps to +1; for `T=id` the relative group is zero.
- In `ℤ`, `relativeDifference 2 1=1`, `relativeDifference 1 2=−1` and `relativeDifference 1 1=0`; these distinguish the orientation from its negative and from a sum.

*Needs:* the layer prerequisites.

### 4.16 Stable automorphism boundary

Define `ClassicalAdditiveK1 C` for small additive C by the abelian presentation with generators `(X,α)`, `α∈Aut(X)`, modulo composition, direct-sum and isomorphism-conjugacy relations. An additive functor induces a map. Identify this group with `K₁` of C equipped with the split exact structure. For `C=P(R)` identify it with AlgebraicKTheory A2's supplied projective-automorphism group through §3.14, including its complement and matrix class maps. If every D-object is a direct summand of some `T(P)`, define `δ:K₁^cl(D)→K₀^cl(T)`. For `α∈Aut(X)`, choose `X⊕Y≅T(P)`, extend `α` by `id_Y`, and take `[P,α⊕id_Y,P]`. Prove independence of complements and transport, preservation of composition and direct sum, and naturality in cofinal squares of additive functors.

Density means summand density. Use the split groups of §4.15 with consistent completions.

(Weibel, §II.2.10.2, p.77;E II.2.17(c), p.81;Weibel III, L 1.6, C 1.6.3 and L 1.7, pp.III.7–8;Weibel IV, T 4.10.1 and Example 4.11.1, pp.IV.43–44.)

Use:

- `ClassicalAdditiveK1`: automorphism presentation of split-exact `K₁`.
- `ClassicalAdditiveK1.class`: class of an object automorphism.
- `ClassicalAdditiveK1.composition`: `[αβ]=[α]+[β]`.
- `ClassicalAdditiveK1.directSum`: `[α⊕β]=[α]+[β]`.
- `ClassicalAdditiveK1.map`: additive-functor map.
- `ClassicalAdditiveK1.quillenEquiv`: Comparison with `K₁` for the split exact structure.
- `ClassicalAdditiveK1.boundary`: stable relative-triple boundary under the cofinality hypothesis.

**Checks.**

- The identity automorphism has class 0; an inverse automorphism has class `−[α]`.
- For finite-dimensional k-spaces, the presentation maps isomorphically to `k×` by determinant; diag(u,v) has class uv.
- The zero additive category has zero group. Over `ℤ`, the automorphism `−1` of `ℤ` has nonzero class of order 2.
- For `T=id`, the relative triple `(P,α,P)` has zero relative class, so the boundary is zero.

*Needs:* §4.15.

### 4.17 The classical five-term sequence of an additive functor

For additive T dense up to summands, prove `K₁^cl(C)→K₁^cl(D)→K₀^cl(T)→K₀^split(C)→K₀^split(D)` is exact at the three interior groups. The middle maps are `δ` and the triple difference. Establish naturality and complement stability by the triple relations; there is no surjectivity assertion onto the last group.

The named targets are `ClassicalRelativeK0.fiveTerm_exact` with the hypotheses and conclusions above.

C,D are small additive and every D-object is a summand of `T(P)`. Karoubi applications use completion-corrected split `K₀`.

(Weibel, §II.2.10 and E II.2.17(d–e), pp.77, 81;Karoubi 1970, T 2.1, PDF p.27.)

*Needs:* §4.16.

### Examples

A DVR torsion module has a length-one free resolution. The simple module over `k[ε]/ε²` has covers but no finite projective resolution; its Cartan map is multiplication by 2. Finite-length dévissage records composition factors, not only projective ranks.

### Dependencies

Layers 1–3, exact square calculus, the supplied Serre quotient and degree-zero Euler comparisons.

## Layer 5: Waldhausen filtrations and deloopings

### 5.1 Waldhausen structures and extra axioms

Use StableHomotopyKTheory §6.1's `WaldhausenCategory`, `ExactFunctor` and `WaldhausenCategory.K0`. The names here identify the same zero object, wide cofibration and weak-equivalence subcategories, pushouts along cofibrations and weak gluing, and the same exact functors preserving these data. The K₀ identification preserves `[X]`, weak-equivalence relations and `[B]=[A]+[B/A]`. `CategoryWithCofibrations` denotes its cofibration data without a choice of weak equivalences. The additional local interfaces are saturation (two out of three), extension for cofibration sequences, a cylinder functor with its cylinder axiom, and `WaldhausenCategory.ofExact` on Tau Ceti's exact-category carrier; these remain separate from the supplied Waldhausen axioms.

C is pointed and small. Cylinders include endpoint cofibrations, weak projections and their pushout cofibration conditions.

(Weibel II, D 9.1;(W0)–(W2), p.II.87;D 9.1.1–9.1.3, pp.II.87–II.88;Weibel IV, Extension axiom 8.2.1, p.IV.67.)

Use:

- `CategoryWithCofibrations`: three cofibration axioms.
- `WaldhausenCategory`: Cofibrations together with weak equivalences and the gluing axiom.
- `WaldhausenCategory.IsSaturated`: Two out of three.
- `WaldhausenCategory.HasExtensionAxiom`: Extension for weak maps of cofibration sequences.
- `WaldhausenCategory.CylinderFunctor`: cylinder functor and its axiom.
- `WaldhausenCategory.K0`: Grothendieck group.
- `WaldhausenCategory.ofExact`: An exact category as a Waldhausen category.
- `WaldhausenCategory.exactFunctor`: Exact functors between Waldhausen categories.

**Checks.**

- Finite-dimensional vector spaces with injections and isomorphisms have `K₀=ℤ`, with `[k²]=2[k]`.
- For bounded finite-dimensional complexes with quasi-isomorphisms, the two-term identity complex has class zero, while k concentrated in degree zero has class 1.
- If every morphism of a pointed category is a weak equivalence, `[X]=[0]=0` for every X; using only isomorphism relations would fail this test.
- Split projective modules give the exact-category `K₀` comparison; an arbitrary epimorphism is not a cofibration in that model.

*Needs:* StableHomotopyKTheory §6.1; `CategoryTheory.Limits.HasPushouts`; `ExactStructure`.

### 5.2 S-diagrams and latching cofibrations

Use StableHomotopyKTheory §6.1's `S.obj` and `S.waldhausenStructure` for `SConstruction`. Identify diagrams by their entries `A_{ij}`, zero diagonals and chosen cofibration/pushout quotient squares `A_{ij}↣A_{ik}↠A_{jk}`. Morphisms are the same diagram natural transformations. The comparison identifies objectwise weak equivalences and the relative latching cofibrations `B_{0i}⊔_{A_{0i}}A_{0j}→B_{0j}` for every `i≤j`; it preserves pushouts and gluing. The face and degeneracy names identify `S.face` and `S.degeneracy` on index restrictions, with the same simplicial identities. Transport `S.oneEquiv` and `S.twoEquiv`: `S₀C` is the zero category, `S₁C` is C, and `S₂C` is its cofibration-sequence category. Its faces are quotient, total and subobject, in that order.

C is small with cofibrations; add its Waldhausen structure when taking `wS_nC`. Compatible quotient choices are part of each diagram.

(Weibel IV, D 8.3;(8.3.0), p.IV.67;D 8.3.1, p.IV.67;§8.3, low terms, p.IV.67.)

Use:

- `SConstruction`: n-th term of the S-construction.
- `SConstruction.cofibration`: latching condition defining its cofibrations.
- `SConstruction.face`: face functors.
- `SConstruction.degeneracy`: degeneracy functors.
- `SConstruction.simplicial`: simplicial identities.
- `SConstruction.two_eq_ext`: second term is the extension category.

**Checks.**

- For `0↣k↣k²`, the `S₂` faces are `k,k²,k`, so their `K₀` ranks are 1,2,1.
- The degeneracy of k gives a repeated filtration with one zero quotient; the face–degeneracy identities recover k.
- In `S₂` of vector spaces, the map `(0↣k↠k)→(k↣k↠0)` with total map id is objectwise injective on sub and total terms, but its quotient map `k→0` is not injective; checking only the filtration terms misses the required latching condition.
- `S₀` has only zero data, whereas `S₁` contains k and its automorphisms.

*Needs:* §5.1; StableHomotopyKTheory §6.1; `ExactStructure.ConflationCategory`.

### 5.3 Isomorphic functors on object S

On §5.2's supplied S-diagrams, construct the additional object-S comparison: an exact natural isomorphism between functors of categories with cofibrations induces a simplicial homotopy on `δC=Ob(S_•C)`. Prove that `δC→nerve(iS_•C)` realizes to a homotopy equivalence by contraction of the isomorphism direction. This object-S homotopy is a local target; StableHomotopyKTheory §6.1 supplies the S-diagrams and §2.18 the diagonal comparison.

The named targets are `SConstruction.natIso_homotopy` with the hypotheses and conclusions above.

The natural-transformation components are invertible and all functors preserve cofibration pushouts.

(Waldhausen, L 1.4.1 and its corollary, pp.335–336.)

**Checks.**

- The identity natural isomorphism induces the constant homotopy on each object-S simplex.
- For the zero category both realizations are points and the comparison fixes their zero vertices.
- The natural transformation from the zero functor to the identity on finite-dimensional k-spaces is not invertible. It cannot give this homotopy: on `π₁|δC|=ℤ`, these functors act by zero and identity.

*Needs:* §5.2; StableHomotopyKTheory §§2.18 and 6.1; Layer 1.

### 5.4 The simplex fibres in Waldhausen additivity

The following explicit simplex-fibre model is an additional local target on the supplied S-diagrams. For the subobject map `δS₂C→δC` and `y∈δ_nC`, define `F_y=Δ[n]×_{δC}δS₂C`. Its m-simplices are monotone `u:[m]→[n]` and a cofibration sequence `u*y↣D↠B` in `S_mC`. Quotient gives `p_y:F_y→δC`. The constant last-vertex map and `0↣B=B` give a section `q_y`, since every vertex restriction of an `S_n`-object is zero. Prove `p_yq_y=id` and make these constructions natural in y.

Use the induced cofibration structure on `S₂C`, and the actual simplicial pullback.

(Waldhausen, Proof of L 1.4.3, pp.337–338.)

Use:

- `AdditivityFibre`: simplicial pullback over y of the subobject projection.
- `AdditivityFibre.quotient`: Its map `p_y` to the quotient filtration.
- `AdditivityFibre.lastVertexSection`: section `q_y` at the last vertex with zero subobject.
- `AdditivityFibre.quotient_section`: `p_y∘q_y=id`.

**Checks.**

- For `n=0` and `y=0`, `F_y` parametrizes `0↣B=B` and `p_y` is the quotient identification.
- On `q_y(B)`, the quotient is exactly B, rather than the zero object.
- For the filtration `0↣k↣k²`, the middle object of a fibre extension may be larger than u*y; the fibre is not the set of subobjects of y.

*Needs:* §5.2; §5.3.

### 5.5 The pushout contraction of an additivity fibre

Construct the additional local contraction of §5.4's explicit fibre model. For `v:[m]→[1]`, replace u(j) by n at indices with `v(j)=1`, leaving the other indices unchanged. The monotone comparison `u≤ū` induces `u*y→ū*y`, and cobase change of the fibre extension defines a simplicial homotopy `id_{F_y}≃q_yp_y`. Prove its endpoint formulas, simplicial compatibility, constancy on the section, and preservation of the quotient B. `p_y` and `q_y` are homotopy inverses.

The named targets are `AdditivityFibre.pushout_contraction` with the hypotheses and conclusions above.

Choose pushouts coherently to obtain simplicial S-diagrams.

(Waldhausen, Proof of the sublemma–L 1.4.3, pp.339–340.)

**Checks.**

- At `v=0` the homotopy is the original fibre simplex; at `v=1` it is the last-vertex section of its quotient.
- On a last-vertex section simplex the subobject is zero and the homotopy is stationary.
- For a fibre extension with nonzero quotient k, the quotient remains k at both endpoints; a contraction through quotient zero would give a different map.

*Needs:* §5.4; §5.2.

### 5.6 Object S-additivity

Prove the additional object-S refinement `|δS₂C|≃|δC|×|δC|` through subobject and quotient, using the local simplex-fibre contractions and the supplied simplicial fibre comparisons. Identify its isomorphism-nerve version with StableHomotopyKTheory §6.2's additivity under §5.3, preserving both projection maps. The object-S refinement applies to categories with cofibrations before a choice of weak equivalences.

The named targets are `SConstruction.object_additivity` with the hypotheses and conclusions above.

C is small with cofibrations. No saturation, cylinder or extension axiom is involved.

(Waldhausen, L 1.4.3 and L 1.4.A–B, pp.336–338.)

**Checks.**

- For the zero category the comparison is the point-to-point product map.
- The sequence `k↣k²↠k` has subobject/quotient ranks (1,1); total rank 2 is not a coordinate of the additivity map.
- For finite abelian groups the nonsplit sequence `ℤ/2↣ℤ/4↠ℤ/2` is admitted. The realization equivalence does not assert that each cofibration sequence splits.

*Needs:* §5.5; §5.3; StableHomotopyKTheory §§2.25 and 6.2; Layer 1.

### 5.7 The K-theory space of a Waldhausen category

For small Waldhausen C, use StableHomotopyKTheory §§6.1–6.2's connective Ω-model with zero space `K(C)=Ω|nerve(wS_•C)|`, based at the zero diagram. The local `KSpace`, `KGroup` and `iteratedS` names are aliases, with `K_n(C)=π_{n+1}|wS_•C|`. Transport `kSpectrum.pi0K0Equiv`, preserving the loop of each object and its K₀ generator, the weak-equivalence relations and the cofibration-sequence relations. Compare the exact-functor maps with `kSpectrum.map` and their natural-isomorphism homotopies; identify the coproduct operation with loop addition through supplied additivity. Section 5.11 compares the positive iterated-S levels and their structure maps.

Use diagonal realization of the nerve and S directions; no cylinder, saturation or extension is needed.

(Weibel IV, P 8.4 and D 8.5, p.IV.68;Infinite Loop Structure 8.5.5, p.IV.69.)

Use:

- `WaldhausenCategory.KSpace`: K-theory space.
- `WaldhausenCategory.KGroup`: Its K-groups, with the stated shift.
- `WaldhausenCategory.pi1_eq_K0`: fundamental group of the realisation is the Grothendieck group.
- `WaldhausenCategory.KSpace_map`: map induced by an exact functor.
- `WaldhausenCategory.hSpace`: H-space structure from the coproduct.
- `WaldhausenCategory.iteratedS`: The degreewise multisimplicial `S^n` construction; §5.11 gives deloopings.

**Checks.**

- The zero Waldhausen category has a contractible K-space.
- For finite-dimensional k-spaces, `π₀K=ℤ` while |wC| has components `ℕ`; its map to K is not a homotopy equivalence.
- For exact C with isomorphisms as weak equivalences, the comparison of §5.9 identifies these groups with Q-theory.
- The two-term identity complex has class zero with quasi-isomorphisms, pinning the shift `K₀=π₁|wS|`.

*Needs:* §5.2; StableHomotopyKTheory §§6.1–6.2; `CategoryTheory.nerve`; `SSet.toTop`; `HomotopyGroup`.

### 5.8 Edgewise S/Q diagrams

For a small exact A, send an `S_{2n+1}`-filtration on n′<⋯<0′<0<⋯<n to the Q-chain whose jth vertex is `A_{j′,j}`. Its `j→j+1` arrow is the span `A_{j′,j}↞A_{(j+1)′,j}↣A_{(j+1)′,j+1}`. On isomorphisms this gives a degreewise equivalence `iS_{2n+1}A→iQ_nA`. Construct its inverse by choosing representatives and quotients, and prove compatibility with the edgewise face and degeneracy maps.

`iQ_n` is the groupoid of Q-chains and component isomorphisms. S retains quotient choices; Q quotients middle terms by their isomorphisms.

(Waldhausen, §1.9, pp.375–376.)

Use:

- `SConstruction.edgewiseQ`: simplicial functor given by diagonal subquotients and the spans.
- `SConstruction.edgewiseQ_degreeEquiv`: degree-n equivalence `iS_{2n+1}A≌iQ_nA`.
- `SConstruction.edgewiseQ_faces`: Face operators agree with span composition by the intermediate pullback square.
- `SConstruction.edgewiseQ_degeneracies`: Duplicating an index inserts an identity Q-arrow.

**Checks.**

- At `n=0` the construction takes an `S₁`-object to the same A-object.
- For the length-three filtration `0⊂k⊂k²⊂k³`, the edgewise Q-arrow goes from a rank-one interval quotient to a rank-three interval quotient through the rank-two quotient; its deflation is not oriented forward.
- A degenerate filtration produces an identity Q-span after quotient identifications; an automorphism is retained as an isomorphism of the Q-chain.

*Needs:* §5.2; §2.1; `ExactStructure.conflation_baseChange`; Layer 1.

### 5.9 Comparison of the S-construction with the Q-construction

Combine the degreewise edgewise equivalence of §5.8 with subdivision invariance and the isomorphism-double-nerve comparison to obtain `|iS_•A|≃BQA`. Prove naturality for exact functors and identify the loop representing an automorphism with its Q representative. This construction precedes additivity and uses neither relative delooping nor a spectrum.

The named targets are `sEqualsQ` with the hypotheses and conclusions above.

A is small exact, with inflations as cofibrations and isomorphisms as weak equivalences.

(Weibel IV, §8.6, p.IV.69;E 8.5(c) and the opening of E 8.6, p.IV.74;Waldhausen, §1.9, pp.375–376.)

*Needs:* §5.7; §2.5; §5.8; §5.3; Layer 1.

### 5.10 Additivity for Waldhausen categories

Use StableHomotopyKTheory §6.2's additivity `|wS_•S₂C|≃|wS_•C|×|wS_•C|` for small Waldhausen C. `WaldhausenCategory.additivity` compares its subobject/quotient map with the map in §5.2's S-model, including §5.6's object-S refinement. Apply this supplied equivalence to a cofibration sequence of exact functors to obtain `K(F)≃K(F′)+K(F″)`. The local cylinder interface gives its cone/suspension consequences `K(cone)≃0` and `K(Σ)≃−id` when the cylinder axiom holds.

The named targets are `WaldhausenCategory.additivity` with the hypotheses and conclusions above.

Functor cofibrations satisfy the pushout comparison condition. Additivity needs no cylinder, saturation or extension; cone/suspension consequences use a cylinder.

(Weibel V, Additivity T 1.2 and Example 1.2.3, p.V.2;Waldhausen, T 1.4.2, p.336.)

**Checks.**

- Source and quotient of `k↣k²↠k` each give [k], whose sum is [k²].
- On bounded complexes with chain-homotopy equivalences the identity cone is contractible and suspension changes the Euler class of k from +1 to −1.
- Isomorphisms as weak equivalences alone do not make the usual complex cone contractible in K-theory: the cone projection to zero is not an isomorphism, so the cylinder-axiom consequence does not apply.

*Needs:* §5.2; §5.7; StableHomotopyKTheory §6.2; Layer 1; §5.6.

### 5.11 Relative S-delooping and spectra

For an exact `F:B→C`, use StableHomotopyKTheory §6.2's relative S-construction. `relativeS` identifies its diagrams with `S_nB×_{S_nC}S_{n+1}C`, using `∂₀` on the last factor; compare strict equality and compatible-isomorphism models. Preserve the constant-filtration inclusion of C over the zero B-diagram and the supplied sequence `|wS_•C|→|wS_•(S_•F)|→|wS_•(S_•B)|`, including its nullhomotopy. `relativeS_delooping` transports the supplied fibre and path-object comparisons; for `F=id` the contraction is its extra degeneracy, although its degree-zero category need not be zero. The realization comparison uses connected fibre and base levels and cellular degeneracies. `iteratedS_spectrum` compares §1.7's sequential representative with `WaldhausenCategory.kSpectrum.sequentialComparison`, preserving positive structure maps and `|wS^rC|≃Ω|wS^{r+1}C|` for `r≥1`. Its connective Ω-model has levels `K(C)`, `|wS_•C|`, `|wS²C|,…`; the unreplaced symmetric spectrum instead has level zero `nerve(wC)`. Relative `K(F)=Ω²|wS_•(S_•F)|` uses the supplied fibre comparison.

The named targets are `relativeS`, `relativeS_delooping`, `iteratedS_spectrum` with the hypotheses and conclusions above.

B,C are small Waldhausen and F exact. The realization-fibration argument uses connected proper simplicial CW spaces.

(Weibel V, P 1.7;its proof, p.V.8;E 1.7, p.V.10;Weibel IV, Relative K-theory spaces 8.5.3 and L 8.5.4, p.IV.69;Infinite Loop Structure 8.5.5, p.IV.69.)

**Checks.**

- For `F=id_C`, the relative K-space is contractible.
- For `0→C`, the fibre is `ΩK(C)`, so double looping of the relative-S model is required.
- For `C→0`, the fibre is `K(C)`; the relative-S component correction in degree `−1` is zero.
- For finite-dimensional k-spaces, the unreplaced level zero has components `ℕ`, while the connective Ω-model has zero-space components `ℤ`; the comparison carries the object loop of k to +1.

*Needs:* §5.10; §5.2; §5.7; StableHomotopyKTheory §§6.1–6.2 and 2.24; Layer 1.

### 5.12 Non-functorial Waldhausen factorizations

Define the factorization property by the existence, for every `f:X→Y`, of `X↣Z→Y` with first map a cofibration and second map a weak equivalence. This is a property of the Waldhausen structure; it includes neither an assigned functorial Z nor cylinder data. Apply it to `X→0` to produce a cone and suspension usable in cofinality arguments.

C is small Waldhausen. Every later result explicitly names saturation or extension when needed.

(Schlichting 2003, Appendix A.1 and A.5 p.24–25;Remark11.2 p.20.)

Use:

- `Waldhausen.HasFactorization`: Every map admits the cofibration–weak-equivalence composite.
- `Waldhausen.HasFactorization.factor`: Existential intermediate object, cofibration and weak arrow.
- `Waldhausen.HasFactorization.ofCylinder`: The cylinder axiom implies factorization.

**Checks.**

- Bounded complexes with monomorphism cofibrations and quasi-isomorphisms factor through their mapping cylinder.
- With isomorphisms as weak equivalences, the property would force every map to be a cofibration; ordinary vector spaces with injection cofibrations fail it for `k→0`.
- In the zero category the identity factorization supplies the property without any nontrivial cylinder choice.

*Needs:* §5.1.

### 5.13 Cofibrant diagrams on a finite poset

For finite P, define a relative cofibration `X→Y` by the latching colimit over `({0}×{p})∪([1]×P_{<p})` and the cofibration from this colimit to `Y_p`, for every p. Define a cofibrant diagram by `0→X` having this property. Its colimit is built by adjoining minimal remaining vertices with pushouts along cofibrations. Pointwise weak equivalences and relative latching cofibrations equip the full subcategory of cofibrant diagrams with a Waldhausen structure. The ambient category `C^P` need not have all latching colimits for arbitrary objects.

P is finite. Induct over predecessor-closed subsets, constructing relative latching colimits by cofibration pushouts.

(Schlichting 2003, Appendix A.6–A.8 pp.25–26.)

Use:

- `CofibrantPosetDiagram`: finite-poset diagram with the latching cofibrations.
- `CofibrantPosetDiagram.latching`: relative colimit at each vertex.
- `CofibrantPosetDiagram.colimit`: colimit exists and is built by cofibration pushouts.
- `CofibrantPosetDiagram.structural_cof`: Cofibrancy preserves structural cofibrations.
- `CofibrantPosetDiagram.map`: Relative-latching cofibrations of diagram maps.

**Checks.**

- For a one-point P, relative cofibrations are exactly those of C.
- For the chain 0<1, a cofibrant diagram is `X₀↣X₁`; a relative cofibration also requires `X₁∪_{X₀}Y₀↣Y₁`.
- For the diamond with two incomparable predecessors, the latching object contains their pushout over their common predecessor; checking only each individual arrow misses that map.

*Needs:* §5.1.

### 5.14 Swallowing a second weak-map nerve direction

For a wide subcategory `A⊂B`, form the double category of commuting squares, with vertical arrows in A and horizontal arrows in B. Prove that the inclusion of constant vertical strings from nerve B induces a realization equivalence: an n-string has a contraction to its first term in the horizontal direction. Apply this to weak-map diagrams of `S_nC`, eliminating an extra nerve direction in the stabilized pairing.

The named targets are `weakDoubleNerve_swallowing` with the hypotheses and conclusions above.

All objects occur in both A and B, identities belong to A, and square compositions stay in the classes. Use the diagonal/iterated realization comparison.

(Waldhausen, Swallowing L 1.6.5, p.352/PDF35;pairing paragraph p.342/PDF25.)

*Needs:* Layer 1.

### Examples

For `0↣k↣k²` the three `S₂` faces have ranks 1,2,1. The latching map detects cofibration conditions that objectwise injectivity on the displayed filtration misses. The complex k `--id→` k has `K₀` class zero with quasi-isomorphisms.

### Dependencies

Layers 1–2 and exact additivity from Layer 4; finite ordinal diagrams, pushouts and weak-equivalence nerves.

## Layer 6: Fibration, approximation and cofinality

### 6.1 Trivial-cofibration comparison

In a saturated Waldhausen category with a cylinder satisfying its axiom, prove `B(cof∩w)→B(wC)` is a homotopy equivalence. Both categories have all C-objects. Factor a weak map by its cylinder and use the resulting functorial zigzags to contract the relevant comma categories. The maps from both cylinder ends are cofibrations, and saturation makes the required ones weak equivalences.

The named targets are `trivialCofibration_comparison` with the hypotheses and conclusions above.

Use the natural cylinder with its pushout cofibrations, weak projection and saturation; §6.13 handles existential factorizations.

(Weibel IV, E 8.15, p.IV.75;Waldhausen L 1.6.3 proof is the same cylinder contraction.)

*Needs:* §5.1; Layer 1.

### 6.2 Relative S-localization comparison

For `v⊂w` and `F:(C^w,v)→(C,v)`, identify `S_nF` with the category of length-n strings of w-cofibrations by forgetting the chosen quotient data. In the extra `S_m` direction, identify the v-map diagrams. Prove these are equivalences of the relative diagrams, natural in both indices, and hence `|vS_•S_•F|≃|v·co_w,•S_•C|`, preserving the inclusion of |vS_•C|.

The named targets are `relativeS_localization_comparison` with the hypotheses and conclusions above.

`C^w` has `0→X∈w`. The v,w structures share cofibrations; saturation and extension characterize w-cofibrations by w-acyclic quotient.

(Weibel V, Proof of T 2.1, pp.V.12–13.)

*Needs:* §5.2; §5.11; §5.1; Layer 1.

### 6.3 The Waldhausen localisation (fibration) theorem

Let `v⊂w` be weak equivalences on the same category with cofibrations. If the w-structure is saturated, satisfies extension, and has a cylinder satisfying its axiom, prove `K(C^w,v)→K(C,v)→K(C,w)` is a homotopy-fibre sequence. Identify the nullhomotopy through the w-acyclic objects and use the relative-S comparison and trivial-cofibration nerve theorem. The sequence includes the higher boundary and the right-exact ending `K₀(C^w,v)→K₀(C,v)→K₀(C,w)→0`.

The named targets are `WaldhausenCategory.fibration` with the hypotheses and conclusions above.

Use inherited cofibrations and v-equivalences on `C^w`. Saturation, extension and the cylinder axiom concern w.

(Weibel V, Waldhausen Localization T 2.1, p.V.12;T 2.6.3 and Caveat 7.1.1, pp.V.17 and V.52.)

*Needs:* §5.11; §5.1; §6.1; §6.2; Layer 1.

### 6.4 Approximation lifts filtered objects

For an exact `F:A→B` satisfying approximation, lift a map from F of a finite filtration by induction on its length. At each step use a cofibration factorization from App2, then pushout and gluing to extend the comparisons to all quotient squares. Prove `S_nF` reflects weak equivalences and has App2 for every n.

The named targets are `approximation_filtered_lift` with the hypotheses and conclusions above.

App1 says a map is weak exactly when its F-image is weak. App2 factors any `F(A)→B` as F of a cofibration followed by a weak equivalence. Weak maps in `S_n` are objectwise.

(Waldhausen, L 1.6.6, p.353.)

*Needs:* §5.2; §5.1.

### 6.5 Iterated mapping cylinders of a simplex diagram

Build a cylinder `T(A₀→⋯→A_n)` recursively: start with `A₀`, and take the mapping cylinder of the preceding cylinder’s projection followed by `A_{n−1}→A_n`. Construct its projection to `A_n` and the maps from cylinders of every face. These form a diagram on the nondegenerate face poset. When the string maps are weak equivalences, each face map and final projection is a weak equivalence.

The cylinder satisfies pushout/cofibration exactness and its weak-projection axiom. Face maps use its projections coherently.

(Waldhausen, Proof of T 1.6.7, pp.356–357.)

Use:

- `IteratedCylinder`: recursive cylinder object of a composable string.
- `IteratedCylinder.projection`: natural weak-equivalence projection to the final vertex.
- `IteratedCylinder.face`: Compatible cylinder maps for nondegenerate faces.
- `IteratedCylinder.face_comp`: face identities and their naturality.
- `Approximation.cylinderDiagram`: functor `T_q` to wF/B and its projection to q_*.

**Checks.**

- For a one-vertex string, `T(A)=A` and the projection is id.
- For `id_A`, both endpoints enter its mapping cylinder by cofibrations and the projection is weak.
- For the two-vertex identity string on `k[0]`, the mapping cylinder projects quasi-isomorphically to `k[0]`; `k[0]⊕k[0]→k[0]` is not a quasi-isomorphism.

*Needs:* §5.1; Layer 1.

### 6.6 Cylinder extension over boundaries

Extend the iterated-cylinder diagram on the faces of a finite nonsingular simplicial set X to its finite simplicial subsets. In F↓B, inclusions become cofibrations and unions become pushouts. Prove in particular `t(∂x)↣t(x)` is a cofibration for every nondegenerate simplex x. The extension is constructed in F↓B; unions need not retain the weak-equivalence map to B required in wF↓B.

The named targets are `IteratedCylinder.boundary_extension` with the hypotheses and conclusions above.

Use the cylinder pushout cofibration axiom and the finite face-poset induction. Nonsingularity prevents repeated vertices from invalidating that poset model.

(Waldhausen, Proof of the sublemma–T 1.6.7, pp.357–358.)

*Needs:* §6.5; §5.1.

### 6.7 Cylinder comma contractions

For F with approximation and a source cylinder, contract `B(wF↓B)` for each B-object. Represent a map of a finite subdivided sphere through a nonsingular finite face poset, apply the cylinder-boundary construction to extend it over a cone, and compare the extension with the original weak diagram. Simplicial approximation and CW Whitehead conclude contractibility.

The named targets are `approximation_cylinder_comma_contractible` with the hypotheses and conclusions above.

A,B are saturated; F is exact and satisfies App1/App2; A has a cylinder satisfying its axiom. Comma comparisons `F(A)→B` are weak.

(Waldhausen, T 1.6.7, pp.354–359.)

*Needs:* §6.5; §6.6; Layer 1.

### 6.8 The Approximation theorem

If an exact `F:A→B` reflects weak equivalences and satisfies App2, between saturated small Waldhausen categories, and A has a cylinder satisfying its axiom, prove |wS_•F| and `K(F)` are homotopy equivalences. Apply the contracted weak comma categories first to wF and then to `S_nF`. The source cylinder hypothesis is part of the theorem, rather than inferred from App2.

The named targets are `WaldhausenCategory.approximation` with the hypotheses and conclusions above.

App2 permits a cofibration `A↣A′` and a weak equivalence `F(A′)→B` whose composite is the given `F(A)→B`. The saturated structures are both named.

(Weibel V, Waldhausen Approximation T 2.4;its proof, p.V.15;Changing cofibrations 2.5.1, p.V.16;Waldhausen, T 1.6.7, pp.354–359.)

*Needs:* §6.3; §5.1; §6.7; §6.4; Layer 1.

### 6.9 The Gillet-Waldhausen comparison

Let E be a full extension-closed subcategory of an abelian M, closed under kernels of M-surjections between E-objects, with its induced exact structure. The inclusion in bounded complexes concentrated at degree zero induces `K(E)≃K(Chᵇ(E),qis)`. Cofibrations are degreewise admissible inflations, and quasi-isomorphisms are computed in M. Prove comparison with the mapping cylinder and the fibration/approximation results. Its acyclic complexes agree with admissibly exact complexes under this closure hypothesis.

The named targets are `gilletWaldhausen` with the hypotheses and conclusions above.

Use an explicit ambient abelian category and induced exact structure, with quasi-isomorphisms. Neither an embedding of every exact category nor replacement by chain homotopy equivalences is assumed.

(Weibel V, T 2.2 (Gillet-Waldhausen);proof, p.V.13;Remark 2.2.1, p.V.14.)

*Needs:* §6.8; §6.3; §2.5; `ExactStructure.abelian`; `ExactStructure.fullSubcategory`.

### 6.10 Finite-poset factorization

Assume C has factorization. A map `X→Y` of arbitrary diagrams on a finite poset factors as a relative latching cofibration `X↣Z` followed by a pointwise weak equivalence `Z→Y`. Construct Z inductively from relative latching colimits. The relative construction does not require existence of each predecessor colimit of X separately; the theorem does not assume X is a cofibrant diagram.

The named targets are `finitePoset_factorization` with the hypotheses and conclusions above.

P is finite and factorization existential; this gives neither functorial factorization nor a Waldhausen structure on all `C^P`.

(Schlichting 2003, Appendix A.9 p.26.)

*Needs:* §5.12; §5.13.

### 6.11 Contract the approximation comma categories

For saturated A,B, an exact F with App1/App2 and factorization in A has contractible weak comma categories wF↓B. Replace a finite-poset diagram X there by a cofibrant `Y→X`. Its colimit exists and F preserves it. Apply App2 to F`(colim Y)→B`, obtaining `F(Z)→B` weak. Reflection and saturation make `Y→const` Z pointwise weak. Thus `X←Y→const` Z contracts the diagram; finite-poset detection contracts the comma realization.

The named targets are `approximation_factorization_comma_contractible` with the hypotheses and conclusions above.

Factorization is required only in A. App2 uses the source cofibrations and a weak map to the B-object; saturation controls all comparison arrows.

(Schlichting 2003, Proof of Approximation A.2 and L A.10 pp.26–27.)

*Needs:* §6.10; Layer 1.

### 6.12 Approximation with factorizations

Under App1/App2 and saturation, with factorization in the source, an exact F induces realization equivalences on `wA→wB` and `wS_•A→wS_•B`, hence on K-spaces. Prove `S_n` version using §6.4 and finite-poset factorization. No functorial cylinder or factorization in the target is required.

The named targets are `WaldhausenCategory.approximation_factorization` with the hypotheses and conclusions above.

A and B are small Waldhausen with saturated weak equivalences. The source has the existential factorization property of §5.12.

(Schlichting 2003, Appendix A.2 p.24 and its proof pp.26–27.)

*Needs:* §6.11; §6.4; Layer 1.

### 6.13 Acyclic-cofibration comparison

For saturated C with factorization, prove `B(cof∩w)→B(wC)` is a homotopy equivalence. The proof uses finite-poset replacements and the comma contraction, allowing independent choices for each finite diagram. Thus it extends §6.1 to structures with no specified cylinder functor.

The named targets are `trivialCofibration_comparison_factorization` with the hypotheses and conclusions above.

C is saturated and has existential factorization. The conclusion is realization equivalence, not equality of morphism classes.

(Schlichting 2003, Appendix A.11 p.27.)

*Needs:* §6.10; §5.13; Layer 1.

### 6.14 Fibration with factorizations

Replace the cylinder hypothesis in §6.3 by factorization in (C,w). With saturation and extension for w, prove `K(C^w,v)→K(C,v)→K(C,w)` is a homotopy-fibre sequence and that `K₀(C,v)→K₀(C,w)` is onto. Use §6.13 in the relative-S proof; v-factorizations are unnecessary.

The named targets are `WaldhausenCategory.fibration_factorization` with the hypotheses and conclusions above.

`v⊂w` give small Waldhausen structures on the same cofibration category. The acyclic subcategory is defined by `0→X∈w`, with the inherited v-structure.

(Schlichting 2003, Appendix A.3 p.25 and its proof p.27.)

*Needs:* §6.13; §6.10; §6.4; §6.2; §5.11; Layer 1.

### 6.15 Weak equivalences detected by a Grothendieck quotient

For a surjective homomorphism `p:K₀(C,v)→G` to an abelian group, define `w_p` to contain every morphism `f:A→B` with `p[A]=p[B]`. For a cofibration this means `p[B/A]=0`. Prove `v⊂w_p`, gluing, saturation and extension, and retain the original factorization as a `w_p`-factorization. Its acyclic objects form `C₀={A:p[A]=0}`. Factoring `A→0` supplies representatives for additive inverses, which is needed to realize all G-classes by objects.

C is pointed, has v-factorization and p is onto. The new weak class compares endpoint classes.

(Thomason–Trobaugh, T 1.10.1 and full proof, pp.275–277/PDF15–16.)

Use:

- `KTheory.classWeakEquivalences`: map lies in `w_p` exactly when `p[B]=p[A]`.
- `KTheory.classWeakEquivalences_cof`: On cofibrations it is the zero class of the quotient.
- `KTheory.classWeakEquivalences_contains`: original weak equivalences are contained in `w_p`.
- `KTheory.classWeakEquivalences_saturated`: Saturation, extension and gluing for `w_p`.
- `KTheory.classAcyclic`: acyclic objects are exactly the kernel-class objects.

**Checks.**

- For `p=0` every map is in `w_p` and every object is acyclic.
- For bounded k-complexes and `p=Euler` rank, `k[0]→0` is not weak but `0→(k --id→ k)` is weak.
- A morphism between complexes of equal Euler rank belongs to `w_p` even when it is not a quasi-isomorphism; for `k[0]⊕k[1]→0` this distinguishes the new class.

*Needs:* §5.12; §5.7.

### 6.16 The class-weak S-construction realizes the quotient group

Send a length-n S-filtration to the n successive increments of its p-class in `G^n`. Prove `w_pS_nC→G^n` has contractible fibres and realizes to a homotopy equivalence. The face maps add adjacent increments or remove an end, and degeneracies insert zero; hence these equivalences identify `|w_pS_•C|` with BG.

The named targets are `classWeakS_realization` with the hypotheses and conclusions above.

Use the surjective p and source factorization of §6.15. `G^n` is discrete, and this is a statement about every degree before the total realization.

(Thomason–Trobaugh, T 1.10.1 and full proof, pp.275–277/PDF15–16.)

*Needs:* §6.15; §6.4; §5.2; Layer 1.

### 6.17 Cofinality with non-functorial factorizations

Apply factorization fibration to `v⊂w_p`. Looping the BG comparison gives `K(C₀,v)→K(C,v)→G_discrete` as a homotopy-fibre sequence. Thus `K_i(C₀,v)→K_i(C,v)` is an isomorphism for i>0 and `K₀(C₀,v)` identifies with ker p. Use complements to recover the general cofinal-subcategory statement and retain its degree-zero correction.

The named targets are `WaldhausenCategory.cofinality_factorization` with the hypotheses and conclusions above.

C,p,G and `C₀` satisfy §6.15. The discrete target carries its abelian group structure, and its map on components is exactly p.

(Thomason–Trobaugh, T 1.10.1 and full proof, pp.275–277/PDF15–16.)

*Needs:* §6.16; §6.14; Layer 1.

### 6.18 Cofinality and `K₀`

For an extension-closed full exact subcategory `A⊂B` that is cofinal under direct sum, prove BQA is homotopy equivalent over BQB to the covering associated with `K₀(A)⊂K₀(B)`. The realization of the original inclusion is not asserted to be literally a covering map. On `K_n` the induced map is an isomorphism for n>0 and injective for `n=0`. In the Waldhausen setting the fibre sequence ends in the discrete quotient `K₀(B)/K₀(A)`. For `A→A^♮` this proves positive-degree invariance but retains the possible proper degree-zero subgroup.

The named targets are `exactCategory_cofinality` with the hypotheses and conclusions above.

Every B-object has a B-complement with sum in A. Waldhausen versions retain saturation, weak-equivalence closure and the cylinder/factorization requirements of §6.17.

(Weibel IV, Cofinality 6.4.1, p.IV.56;E 6.6 (Gersten), p.IV.60, and Waldhausen Cofinality 8.9, p.IV.72;Weibel V, Cofinality T 2.3, p.V.14.)

*Needs:* §6.3; §5.11; §5.9; Layer 1; `CategoryTheory.Idempotents.Karoubi`.

### 6.19 Gillet–Waldhausen for an arbitrary exact category

For every essentially small exact E, prove `gilletWaldhausen_general`: the degree-zero embedding induces `K(E)≃K(Chᵇ(E),q)`, where q consists of maps whose cones are homotopy equivalent to admissibly acyclic complexes. Prove the same comparison for degreewise admissible and degreewise split cofibrations, and that the identity on complexes compares these Waldhausen structures. The weak class is intrinsic to E; an arbitrary ambient embedding need not compute it.

Construct `ExactStructure.yonedaExactEmbedding` into the abelian category of contravariant left exact additive functors, proving full faithfulness, preservation and reflection of conflations, and closure of E's idempotent completion under kernels of ambient epimorphisms between its objects. Construct `ExactStructure.k0CofinalCompletion`: the full exact subcategory E′ of E♮ on objects whose class lies in the image of `K₀(E)→K₀(E♮)`. Prove its kernel closure, direct-sum cofinality of E in E′, the induced `K₀` isomorphism, and the corresponding cofinality statements for bounded complexes. Identify q with the ambient quasi-isomorphisms restricted to E-complexes under this embedding; use §6.9 for E′ and §6.18 to descend to E. The mapping-cylinder comparison supplies the change from admissible to split cofibrations with this same q.

(Weibel V, Remark 2.2.1, p.V.14; II, E 7.8; IV, E 8.13; Thomason–Trobaugh, T 1.11.7 with §§1.11.3–1.11.6, pp.278–279; Weibel V, Changing cofibrations 2.5.1, p.V.16.)

**Checks.**

- For finite-dimensional k-spaces, q is the usual quasi-isomorphism class and the degree-zero map recovers `K₀=ℤ`.
- For finite free `(k×k)`-modules, E♮ contains (k,0), but E′ contains only projectives with diagonal rank class. Replacing E′ by all of E♮ would change `K₀` from the diagonal `ℤ` to `ℤ²`.
- Every bounded contractible complex is q-acyclic because it is homotopy equivalent to zero. This criterion does not require choosing cycle objects in E.
- The nonsplit conflation `0→ℤ/2→ℤ/4→ℤ/2→0` gives an acyclic bounded complex in finite abelian groups. Changing cofibrations to split ones retains this q-acyclic object.

*Needs:* §6.9; §6.18; §6.8; §5.1; §2.3; Tau Ceti exact structures and `ExactK0`; Mathlib additive functors, functor categories, kernels and idempotent completion.

### Examples

Vector spaces with injection cofibrations and only isomorphism weak equivalences fail factorization on `k→0`. Mapping cylinders supply it for complexes with quasi-isomorphisms. Class weak equivalences for Euler rank allow `k[0]⊕k[1]→0`, even though this is not a quasi-isomorphism.

### Dependencies

Layers 1 and 5; saturation and the indicated cylinder or factorization hypothesis.

## Layer 7: Products and transfers

### 7.1 The bisimplicial S-grid of a biexact functor

Given `A∈S_mA` and `B∈S_nB`, the diagram with entry `F(A_{ij},B_{kl})` defines an `S_mS_nC` object. Check every quotient pushout and relative latching cofibration using the joint pushout-product condition. Weak maps in either variable give the two weak-nerve directions. Construct grid maps naturally in the two simplex variables, with the zero faces mapped to zero.

F is biexact between small Waldhausen categories, including the joint cofibration condition of §7.4.

(Waldhausen, §1.5 pairing paragraph, p.342/PDF25.)

Use:

- `BiexactSGrid`: `F:S_mA×S_nB→S_mS_nC` with the joint latching condition.
- `BiexactSGrid.simplex_natural`: Compatibility with both simplicial directions.
- `BiexactSGrid.zero_left`: zero input gives a zero grid.
- `BiexactSGrid.pushoutProduct`: grid latching map is the pushout product.

**Checks.**

- For `m=n=1` the sole nonzero entry is `F(A,B)`.
- If one input filtration is the zero filtration, every grid entry is zero.
- For two flags of k-spaces whose increments have dimensions (1,2) and (2,1), the double increments have dimensions 2,1,4,2; replacing the grid by direct sums would give different values.

*Needs:* §5.7; §5.2.

### 7.2 Stabilization of pairings

Realize the double S-grid, remove its redundant weak direction by §5.14, and pass through the two delooping maps to obtain a stable pairing `K(A)∧K(B)→K(C)`. Prove independence of the chosen representing S-levels and bilinearity of the induced `K_i(A)⊗K_j(B)→K_{i+j}(C)`. On object classes its value is `[F(A,B)]`.

The named targets are `biexactPairing_stabilize` with the hypotheses and conclusions above.

Use small Waldhausen inputs and the complete biexactness data. No direct one-fold Q functor is substituted for the double construction.

(Waldhausen, §1.5 pairing paragraph, p.342/PDF25.)

*Needs:* §7.1; §5.14; §5.11; Layer 1.

### 7.3 Transport biexact natural isomorphisms to pairing homotopies

An exact natural isomorphism of biexact composites gives a homotopy of the associated stable pairings. Transport the associator, unit and symmetry diagrams of the input functors through the S-grid, and prove their coherence under further iteration. Sphere interchange contributes `(−1)^{ij}` on degree-i and degree-j classes. A binary symmetry homotopy by itself is insufficient for an `E∞` assertion.

The named targets are `biexactPairing_natIso_homotopy` with the hypotheses and conclusions above.

The diagrams of input natural isomorphisms, not only their existence, are part of the coherence data. Use §1.8 for suspension and sphere signs.

(Waldhausen, §1.5 pairing paragraph, p.342/PDF25.)

*Needs:* §7.2; Layer 1.

### 7.4 External products from biexact functors: the K-theoretic pairing and its coherence

Construct a spectrum pairing `K(A)∧K(B)→K(C)` from a biexact functor. On exact categories, require exactness in each variable and zero when either input is zero. On Waldhausen categories additionally require the pushout-product map `F(A′,B)∪_{F(A,B)}F(A,B′)→F(A′,B′)` to be a cofibration. Use the double S-grid and its stabilization, rather than claiming a direct functor `QA×QB→QC` realizes the desired degree-adding pairing. The induced product is bilinear `K_i(A)⊗K_j(B)→K_{i+j}(C)`, with `[a]·[b]=[F(a,b)]`. Coherent associators, units and symmetries of the input functors give the coherent homotopies. For k-algebras A,B over a commutative k, tensor product gives the external pairing into `K(A⊗_k B)`; for commutative R it gives the internal product with unit `[R]`.

Use small biexact inputs with the joint cofibration condition. External projective tensor pairings need neither commuting nor k-flat algebras. An `E∞` claim requires all symmetric monoidal coherence.

(Weibel, II.7, 'Products', and L 7.4, p.132;II.9.5.2, p.165;II.7.4.1 (Application 7.4.1), p.132;IV.6.6, p.322;IV.8.11 (Products), p.342.)

Use:

- `KTheory.biexactPairing`: pairing induced by a biexact functor.
- `KTheory.biexactPairing_natural`: Naturality in exact maps and transformations, compatible with variablewise fibre sequences.
- `KTheory.biexactPairing_K0`: In degree zero the pairing sends `[A] ⊗ [B]` to [F(A, B)].
- `KTheory.externalProduct`: external product of the K-groups of two algebras.
- `KTheory.mul`: internal product for a commutative ring.
- `KTheory.mul_assoc`: associativity homotopy.
- `KTheory.mul_one`: unit homotopy, with unit the class of the ring.
- `KTheory.mul_comm_graded`: symmetry homotopy, giving graded commutativity.

**Checks.**

- For finite-dimensional k-spaces of dimensions 2 and 3, the product class is 6 in `K₀(k)=ℤ`.
- Tensoring with R is the identity, while tensoring with zero gives the zero map.
- The direct-sum bifunctor is not a pairing input: `F(A,0)=A` for `A≠0`.
- The symmetry on degree-one classes has sign `−1`, whereas the degree-zero comparison has sign +1.

*Needs:* §2.5; §3.2; §5.7; §5.9; §5.11; Layer 1; `SplitK0.of_mul_of`; `SplitK0`; `TensorProduct`; §7.2; §7.3.

### 7.5 The total K-group is a graded-commutative ring

For a commutative ring R, use the symmetry homotopy of its tensor pairing and the interchange of the degree-p and degree-q spheres to prove `xy=(−1)^{pq}yx` on connective K-groups. The sign is forced by that sphere interchange. In degree one, products of unit classes anticommute; this does not force their squares to vanish in a group with 2-torsion. The nonconnective extension uses the Bass spectrum and the compatible extended pairing of §13.7.

The named targets are `ringKGroup.graded_commutative` with the hypotheses and conclusions above.

R is commutative and `p,q≥0` for the connective statement. Tensor coherence is part of the construction, rather than an extra unproved commutativity assertion.

(Weibel, IV.1.10 (T 1.10, Loday), p.266;V.8.2, p.430.)

**Checks.**

- For `p=q=0`, the sign is +1 and the product is symmetric.
- For `p=q=1`, the sign is `−1`; for `p=1,q=2` it is +1.
- At `p=q=1`, the equality `x²=−x²` implies only `2x²=0`; characteristic 2 does not justify discarding possible integral 2-torsion.

*Needs:* §7.4; Layer 1.

### 7.6 Units and the `K₀` tensor comparison

Compare the degree-zero tensor pairing with the split `K₀` multiplication by checking the value `[P⊗_R Q]` on projective generators. For `u∈R×`, stabilization of the one-by-one invertible matrix gives `[u]∈K₁(R)`; multiplication by it maps `K_n(R)` to `K_{n+1}(R)`. Since `[u⁻¹]=−[u]`, the inverse unit gives the negative degree-raising map, rather than an inverse operator.

The named targets are `ringKGroup.unit`, `ringKGroup.zero_tensorComparison` with the hypotheses and conclusions above.

R is commutative and P,Q finite projective; unit classes use `GL₁→GL→GL/E`.

(Weibel, II.7.4.1 (Application 7.4.1), p.132;III.1.1.1 (Example 1.1.1, SK1), p.180.)

**Checks.**

- For `P=R²,Q=R³`, the degree-zero product is `[R⁶]`.
- Multiplication by the class of `1∈R×` is zero because `[1]=0` in `K₁(R)`.
- Multiplication by `[u⁻¹]` is the negative of multiplication by `[u]` and still raises the degree.

*Needs:* §7.4; `SplitK0.of_mul_of`; `SplitK0`.

### 7.7 Transfer maps and the projection formula

Let `f:R→S` have S as a left R-module with a finite resolution by finite projectives. Restriction carries modules with finite finite-projective resolutions over S into the analogous R-category. Compose that exact functor with the two resolution equivalences to define `Tr_f:K_n(S)→K_n(R)`. Prove composition when both restrictions have this finiteness property. For commutative rings and `x∈K_i(R)`, `y∈K_j(S)`, prove `Tr_f(f^*x·y)=x·Tr_f(y)` by the tensor/restriction comparison. This statement uses the full connective pairing, not just the `K₀` action.

The named targets are `transfer`, `transfer_projectionFormula` with the hypotheses and conclusions above.

`i,j≥0`; resolutions have finitely generated terms, stronger than finite projective dimension. The internal projection formula needs commutativity.

(Weibel V, V.3.2 and V.3.3.2, p.V.21;V.3.3.2, p.V.21, projection-formula paragraph.)

**Checks.**

- For a finite field extension E/F of degree d, the degree-zero transfer sends 1 to d, including inseparable extensions.
- For `f=id_R`, the transfer and its projection formula are identities.
- For the quotient `ℤ→𝔽₂`, `[𝔽₂]` transfers to `[ℤ]−[ℤ]=0`; its finite resolution permits transfer although restriction does not itself land in projective `ℤ`-modules.

*Needs:* §4.6; §4.3; §2.6; §7.4.

### 7.8 Base change of a finite field transfer through an Artin algebra

For finite E/F and any field extension F′/F, write `E⊗_F F′=∏_j B_j` with residue fields `E_j` and lengths `ℓ_j=length_{B_j}B_j`. Prove `res_{F′/F}∘Tr_{E/F}=Σ_j ℓ_j Tr_{E_j/F′}∘res_{E_j/E}` on `K_n`, `n≥0`. The tensor/restriction square gives the base-change functor, and a composition series of each `B_j` gives its multiplicity by additivity. Nilpotence exponents are not substituted for the module lengths.

The named targets are `transfer_field_baseChange` with the hypotheses and conclusions above.

B is finite-dimensional over F′ and may be nonreduced. F′/F may be infinite or transcendental. `E→E_j` is the induced field map.

(Weibel V, Examples 3.5.3 and 3.7.2, pp.V.23–25;Example 4.2.1, p.V.34.)

*Needs:* §4.3; §7.7; §3.1.

### Examples

The tensor pairing of ranks 2 and 3 has rank 6. The unit 1 has zero `K₁` class and therefore gives a zero degree-raising operation. A finite field extension transfer sends `[L]` to `[L:k][k]`, including inseparable extensions.

### Dependencies

Layers 1–6, tensor products and exact or Waldhausen biexact functors.

## Layer 8: Relative theory and low-degree excision

### 8.1 Relative K-theory as a homotopy fibre

For a unital `f:R→S`, define `RelK(f)=fib(K(R)→K(S))` at zero, and `RelK_n(f)=π_nRelK(f)` for `n≥0`. For a two-sided ideal I use the quotient map and write `K(R,I)`. The functorial infinite-loop structure gives abelian groups even in relative degree zero. Construct long exact sequence and the maps for commuting squares. For an exact functor of Waldhausen categories, compare this fibre with `Ω²|wS_•S_•F|`; the extra component term of its relative-S model records `coker(K₀F)` in degree `−1`.

Ring maps are unital, ideals two-sided. Relative S uses §5.11; identifying relative `K₁` with a congruence quotient requires a further comparison.

(Weibel IV, Relative groups 1.11.1, p.IV.8;E 1.15, p.IV.16.)

Use:

- `relativeK`: relative K-theory space of a ring map.
- `relativeK.group`: relative groups.
- `relativeK.addCommGroup`: Their abelian group structure, degree zero included.
- `relativeK.les`: long exact sequence with the absolute groups.
- `relativeK.ofPair`: The quotient-map fibre for a two-sided ideal; §8.9 gives the degree-zero adapter.
- `relativeK.waldhausen`: Waldhausen relative theory and its extra term.

**Checks.**

- `RelK(id_R)` is contractible.
- For `R→0` the relative groups are `K_n(R)`.
- The degree-zero exact sequence contains `K₁(S)→RelK₀(f)`; `RelK₀(f)` is therefore not generally just `ker(K₀R→K₀S)`.

*Needs:* §3.2; §5.11; Layer 1; `TwoSidedIdeal.ringCon`; `RingCon.Quotient`; `RingCon.mk'`.

### 8.2 Relative K-theory is not support K-theory

Distinguish the fibre of `K(R)→K(R/I)` from a localization fibre supported on a closed subset. The relative space has a component map into `K₀(R)` with image `ker(K₀(R)→K₀(R/I))`; its components fit into the full exact sequence containing `K₁(R/I)`. In general `K₀(R)→K₀(R/I)` need not be onto. A Serre or Waldhausen localization has its own acyclic category as fibre, under its named hypotheses; a ring quotient by an ideal alone does not supply that category or its equivalence to the relative fibre.

The named targets are `relativeK.components_image`, `supportK_localization_distinction` with the hypotheses and conclusions above.

I is two-sided. There is no regularity, idempotent-lifting or localization assumption.

(Weibel V, T 2.6.3, p.V.17;Caveat 7.1.1, p.V.52.)

**Checks.**

- For `I=0` the relative fibre is contractible.
- For `I=R` the target is the zero ring and the relative fibre is `K(R)`.
- For `R=k[x]` and `I=(x(x−1))`, `K₀(R)=ℤ` maps diagonally into `K₀(k×k)=ℤ²`; it is not surjective, and the missing components are visible in the fibre sequence.

*Needs:* §8.1; §6.3; §6.8.

### 8.3 Nonunital rings, the unitisation and the comparison with the unital theory

Use the canonical augmentation `ℤ⋉I→ℤ` to define connective K-theory of a nonunital associative ring I as its relative homotopy fibre. A nonunital homomorphism induces a map of these fibres. If I is unital, `(z,a)↦(z,z·1_I+a)` identifies its unitization with `ℤ×I` and identifies the fibre with `K(I)`. If I embeds as a two-sided ideal in R, the square from `ℤ⋉I→R` and `ℤ→R/I` gives a comparison to `K(R,I)`; prove naturality of that map without assuming excision.

Nonunital maps preserve addition and multiplication; ideals are two-sided. Use Unitization `ℤ` I.

(Weibel I, Exercise 1.10, p.I.5;IV, Absolute Excision 1.11.2, p.IV.9, and finite-product property 6.4, pp.IV.55–56. The unital product identification is the displayed ring isomorphism.)

Use:

- `nonunitalK`: K-theory of a nonunital ring through its unitisation.
- `nonunitalK.map`: Functoriality in maps of nonunital rings.
- `nonunitalK.compare`: comparison map to the relative theory of a pair.
- `nonunitalK.of_unital`: Agreement with the usual theory for a unital ring.

**Checks.**

- `I=0` gives the fibre of the identity of `K(ℤ)`, hence a contractible space.
- For unital `I=ℤ`, the augmentation is projection `ℤ×ℤ→ℤ` and its fibre is the second `K(ℤ)`.
- A square-zero nonunital ring need not satisfy `K₁` excision; existence of the comparison map does not imply it is an equivalence.

*Needs:* §8.1; `Unitization`.

### 8.4 Projective patching and its clutching boundary

For `R=R₁×_S R₂` with at least one map to S surjective, use AlgebraicKTheory A6's right finite-projective patching equivalence. Its triple has first-to-second isomorphism u and equation `u x̄=ȳ`. Define the local alias with second-to-first isomorphism `α:P₂⊗S≅P₁⊗S` by passing `u=α⁻¹` to that equivalence; its module is the kernel of `(x,y)↦x̄−α(ȳ)`. Transport the supplied base-change and reconstruction isomorphisms and their naturality under maps of squares. Use A6's symmetric formulation when only the other leg is onto.

On free triples the local boundary is `∂[g]=[Patch(R₁ⁿ,R₂ⁿ,g)]−[Rⁿ]=δ_A6([g⁻¹])=−δ_A6([g])`. Its degree-zero carrier is the supplied right-projective split K₀, identified with native exact K₀; left-projective applications use the opposite square and §3.14. Transport A6's lift vanishing, elementary invariance, additivity and inverse-patching free sum through this parameter change. For the same ordered charts, `δ_A6([u])=∂[u⁻¹]=−∂[u]`. These are boundary adapters to the supplied low-degree sequence, not a higher-excision claim.

(Weibel, Milnor Patching T I.2.7, pp.13–14;E I.2.8, p.16;T II.2.9, pp.78–79;Weibel III, T 2.6, p.III.15.)

Use:

- `MilnorPatch`: alias of A6's patched module at the inverse parameter.
- `MilnorPatch.baseChange`: transported finite-projective base-change isomorphisms.
- `MilnorPatch.reconstruct`: transported recovery of a projective over the pullback.
- `MilnorPatch.boundary`: supplied clutching boundary precomposed with inversion.
- `MilnorPatch.inverse`: supplied free direct sum for g and `g⁻¹`.

**Checks.**

- For `g=1` the patched module is `Rⁿ` and the boundary is zero, including `n=0`.
- For `g=[[1,1],[0,1]]` over `ℤ` and `y=(0,1)`, `x=g y=(1,1)`; `g⁻¹y=(−1,1)` fails the patch equation.
- With the same ordered charts, a first-to-second parameter u imposes `u x̄=ȳ`, hence corresponds to `α=u⁻¹` here. Its boundary class is `∂[u⁻¹]=−∂[u]`; the inverse shear above tests this change of convention.
- For `𝔽₅[t]→𝔽₅[t]/(t²)←𝔽₅`, only the polynomial quotient is onto; patching and its boundary still apply. Swapping the charts tests the other one-surjective-leg case and reverses the boundary.
- Over the cusp `k[x²,x³]⊂k[x]`, its conductor square has a nontrivial clutching class from 1+x in `k[x]/x²`; projective patching cannot be replaced by ignoring `α`.

*Needs:* AlgebraicKTheory A6; §3.1–3.5; §3.14 for the higher K₁ comparison; Mathlib RingHom.pullback; supplied projective `K₀`.

### 8.5 Milnor's sequence is exact at the pair of `K₁`-groups

For `B=S×_C T` with at least one map to C onto, transport AlgebraicKTheory A6's exactness of `K₁(B)→K₁(S)⊕K₁(T)→K₁(C)` at the middle term through §3.14. The maps are the two projections and `(x,y)↦φ_*x−ψ_*y`. Identify these with the Q-induced maps by naturality of the stable GL/E and projective-automorphism comparisons. The supplied proof uses common-stage representatives and elementary lifts through the surjective leg.

The named targets are `milnorK1_exact` with the hypotheses and conclusions above.

Either leg may be onto. Equality in stable `K₁` requires stabilization, not equality of finite matrices.

(Weibel III, Proof of T 2.6, the last step, p.III.15.)

**Checks.**

- For an identity leg, a matching pair of stable classes is the image of the class on the other chart under the canonical pullback identification.
- Representatives differing by a quotient elementary shear are aligned by lifting its coefficient through the surjective leg; an arbitrary invertible matrix need not lift.
- The one-surjective-leg square of §8.4 satisfies this exactness in both chart orders.

*Needs:* AlgebraicKTheory A6; §3.14; §3.1–3.5, §8.4; `RingHom.pullback`; `RingHom.pullback_comm_sq`.

### 8.6 Milnor Mayer–Vietoris

Transport AlgebraicKTheory A6's natural exact sequence `K₁(B)→K₁(S)⊕K₁(T)→K₁(C)→K₀(B)→K₀(S)⊕K₀(T)→K₀(C)` at its four interior positions through the K₀ and K₁ comparisons. Use the local boundary `[FreePatch(a)]−n[B]`, with `φ(s)=aψ(t)`, which is the negative of A6's boundary at a. Keep both difference maps as the S-image minus the T-image. Negating the boundary preserves its kernel and image, so exactness follows from the supplied sequence; its naturality follows from the inverse-parameter adapter. Neither exactness to the left of `K₁(B)` nor surjectivity onto `K₀(C)` is asserted.

The named targets are `milnorMayerVietoris` with the hypotheses and conclusions above.

The square is a pullback of unital associative rings with at least one map onto C. The ring constructions, representative independence and exactness are supplied by A6; the Q-theory and convention comparisons are the targets here.

(Weibel III, T 2.6 (Mayer–Vietoris);its proof, p.III.15;Remark 2.2.1 and E 2.3, pp.III.13 and III.16;T 5.8, p.III.41.)

**Checks.**

- An identity leg gives zero clutching boundary; exactness retains its four specified interior positions.
- For the same ordered charts, `δ_A6([u])=∂[u⁻¹]=−∂[u]`; swapping the charts changes the boundary sign again.
- The cusp conductor square of §8.4 retains its nontrivial clutching class, while the square with only one surjective leg retains exactness without adding a second surjectivity hypothesis.

*Needs:* AlgebraicKTheory A6; §8.5; §3.14; §3.2; §3.1–3.5, §8.4; `RingHom.pullback`.

### 8.7 Relative projective triples are components of the K-fibre

For `f:R→S`, identify the relative split triple group of `f_!:P(R)→P(S)` with `π₀RelK(f)`. Map `(P,α,Q)` to `[P]−[Q]` together with the path from its scalar extension to zero furnished by `α`. Use stabilized virtual-projective representatives for surjectivity and paths representing stable automorphisms for injectivity. Compare the automorphism boundary with the connecting map from `K₁(S)`.

f is a unital map of associative rings. This triple comparison concerns degree zero. Separately, for a quotient `R→R/I`, prove `relativeK.one_eq_classical`: `π₁RelK(R,I)` is the classical relative `K₁` congruence group, compatibly with ideal maps and the low-degree exact sequence. Use the relative plus-construction model of IV.1.11.1 and its comparison with classical `K₁` in Exercise IV.1.15. This additional adapter is used in §10.12 and makes no assertion of higher excision.

(Weibel II, D 2.10,pp.II.13–14;E 2.17,p.II.17;IV E 1.16,p.IV.16;IV.1.11.1, pp.IV.8–9 and E 1.15, p.IV.16 for the relative `K₁` adapter.)

**Checks.**

- For `f=id_R` the relative space is contractible and its triple group is zero.
- For `R→0` the relative components are `K₀(R)`; a triple (P,unique,0) maps to `[P]`.
- For `I=0` the quotient map is the identity and both classical and spectral relative `K₁` are zero.

*Needs:* §8.1; §4.17; §3.14.

### 8.8 Ideal K-zero through the augmented-ring patching square

For a two-sided `I⊂R`, let R⋉I be the ring on `R×I` with `(r,i)(s,j)=(rs,rj+is+ij)`. Its projections `p₀(r,i)=r` and `p₁(r,i)=r+i` make it the pullback `R×_{R/I}R`. Milnor patching identifies `K₀^cl(R→R/I)` with `ker(p₀*:K₀(R⋉I)→K₀(R))`; the second projection recovers the triple’s difference map. Prove compatibility with automorphism boundaries and ideal maps.

The named targets are `idealK0_augmentedRing_kernel` with the hypotheses and conclusions above.

For I is two-sided. Use the split projective groups, the two specified projections and their common diagonal section.

(Weibel, E II.2.3(c), p.78;IV.1.15, p.274;§II.2.10, p.77.)

**Checks.**

- For `I=0`, `R⋉I=R` and `p₀=p₁=id`, so the kernel model is zero.
- For `I=R`, `(r,i)↦(r,r+i)` identifies R⋉R with `R×R` and the `p₀`-kernel is `K₀(R)`.
- For `I²=0`, the product retains the terms rj+is; using coordinatewise multiplication on `R×I` would not give the pullback ring.

*Needs:* §8.7; §8.6.

### 8.9 Degree-zero ideal excision

If a unital `f:R→S` identifies I with a two-sided ideal `J⊂S`, prove `RelK₀(R,I)≃RelK₀(S,J)`. Use the augmented-ring kernel model and the split Milnor square to construct inverse patching maps. Naturality gives independence of the chosen ambient ring. This argument uses only relative components and the low-degree patching sequence, without a relative `K₁` comparison.

The named targets are `relativeK.zero_excision` with the hypotheses and conclusions above.

f|I is bijective onto J. The result is an isomorphism in degree zero, with no implied higher excision.

(Weibel, E II.2.3(a), p.78;split augmentation and projective patching as above.)

*Needs:* §8.8; §8.6; §8.3.

### 8.10 Excision holds under hypotheses, and fails without them

Define absolute excision in degree n by requiring `K_n(ℤ⋉I,I)→K_n(R,I)` to be an isomorphism for every embedding of I as a two-sided ideal in a unital ring R. Degree zero always satisfies excision. For `n≥1`, the criterion is `Tor_i^{ℤ⋉I}(ℤ,ℤ)=0` for `1≤i≤n`. `Tor₁=I/I²`, so degree-one absolute excision is equivalent to `I=I²`. Call the all-degree condition Tor-unitality. The integral criterion is Suslin’s; the rational comparison and the plus model for the relative space have their separate Suslin–Wodzicki hypotheses. A bar-homology formulation over a base ring requires its own flatness comparison and is not silently substituted for the integral Tor criterion.

The named targets are `AbsoluteExcision`, `absoluteExcision_iff_tor`, `TorUnital` with the hypotheses and conclusions above.

I is associative nonunital and n>0. Tor uses augmentation modules and the assertion ranges over every unital ambient ring.

(Weibel I, Exercise 1.10, p.I.5;IV, Absolute Excision 1.11.2, p.IV.9, and finite-product property 6.4, pp.IV.55–56. The unital product identification is the displayed ring isomorphism.)

**Checks.**

- For `I=0`, all positive Tor groups vanish and excision holds.
- For a unital I, `ℤ⋉I≅ℤ×I`; `ℤ` is a direct summand and all positive Tor groups vanish.
- For a nonzero square-zero I, `I/I²=I≠0`, so degree-one absolute excision fails.

*Needs:* §8.3; §8.1.

### 8.11 The degree-one index

For a Serre subcategory `B⊂A`, let `α:X→X` be a morphism whose image is invertible in A/B. Compute the localization boundary of its automorphism class as `[coker α]−[ker α] ∈ K₀(B)`. In the finitely generated module category of a noetherian ring and a central element s, this yields `[R/sR]−[ann_R(s)]` in the torsion Grothendieck group. This is the G-theory boundary; identifying it with the projective K-theory boundary requires the resolution comparison. The formula still has its kernel term when s is a zero divisor.

The quotient automorphism supplies the `K₁` class. Its kernel/cokernel belong to B; use `coker−ker`. Noetherianness ensures finite-generation of the ring-example kernel.

Define the convention helper `indexClass ker coker=coker−ker` for any abelian group. Its API is the diagonal-zero formula, additivity in pairs and `indexClass k c=−indexClass c k`. This arithmetic helper does not construct the localization boundary.

(Weibel V, E 5.1 and Example 6.1.2, p.V.38;Weibel IV, E 7.9, p.IV.65.)

**Checks.**

- Over a DVR, multiplication by `π` has kernel zero and cokernel k, giving `+[k]`.
- For a unit, both kernel and cokernel are zero and the boundary vanishes.
- For multiplication by `ε` on `k[ε]/(ε²)`, kernel and cokernel are both k; their difference is zero. Dropping the kernel term gives a false answer.
- The two-term class calculations are `indexClass 0 1=1`, `indexClass 1 0=−1` and `indexClass 1 1=0` in `ℤ`.

*Needs:* §4.14; §2.4.

### 8.12 The DVR boundary is the normalized valuation

For a DVR O with fraction field F, residue field k and uniformizer `π`, identify the boundary `K₁(F)=F×→K₀(k)=ℤ` with the normalized valuation. The class of `π` maps to `[k]=1` by cokernel-minus-kernel; a unit maps to zero, and multiplicativity then gives `∂(π^m u)=m` for every integer m. This fixes the degree-one sign for all subsequent Laurent and tame-boundary comparisons.

The named targets are `localizationBoundary_DVR_valuation` with the hypotheses and conclusions above.

Use the finite-length torsion Serre subcategory and dévissage. Normalize `v(π)=1`, and transport projective K-theory by the DVR resolution equivalence.

(Weibel V, Example 6.1.2,p.V.38;Dedekind sequence 6.6,p.V.41.)

*Needs:* §8.11; §4.8; §4.6.

### 8.13 Transport the right product action through the localization boundary

For a biexact pairing `A×C→A′` taking `B×C` into B′, compare the localization fibres and show `∂(x·y)=∂x·y` for `x∈K_i(A/B)`, `y∈K_j(C)`. For the left pairing the sphere suspension gives `∂(y·x)=(−1)^j y·∂x`. Thus a uniformizer-last normalization in degree n is `δ_n=(−1)^{n−1}∂_n`. This is a module boundary identity, not a derivation identity for products of two arbitrary quotient classes.

The named targets are `localizationBoundary_product` with the hypotheses and conclusions above.

`i≥1` and `j≥0`; the uniformizer-last formula has `n≥1`. `B⊂A` and `B′⊂A′` are Serre subcategories; the pairing preserves them and is exact in each variable. The right-module suspension convention is fixed by `∂[π]=+[k]`.

Define `uniformizerLastSign n=(−1)^(n−1)` in `ℤ×` for natural n; only `n≥1` is used by the boundary theorem. Its API gives value 1 at `n=1`, negation on each positive successor and period two. This function records the normalization, not a degree-zero boundary.

(Weibel V, E 5.3, p.V.38;§6.6.1, pp.V.41–42;Weibel IV, E 1.23, p.IV.17.)

**Checks.**

- For uniformizer-last signs, `δ₁=∂₁`, `δ₂=−∂₂` and `δ₃=∂₃`.
- For `j=1`, the left-product boundary is `−y·∂x`, while the right-product boundary is `∂x·y`.
- For `j=0` both module-boundary formulas have sign +1.

*Needs:* §4.14; §7.2; Layer 1; §8.12.

### Examples

The relative fibre of `id_R` is contractible; the fibre of `R→0` is `K(R)`. Multiplication by a DVR uniformizer has index `+[k]`. Multiplication by `ε` on `k[ε]/ε²` has both kernel and cokernel k, so its G-theory index is zero.

### Dependencies

Layers 1–4 and 7; ring pullbacks, unitization and the supplied exact `K₀`.

## Layer 9: The ring projective line and Nil terms

### 9.1 The projective line over an associative ring, as a gluing category

For unital associative R, define the abelian gluing category by triples `(M₊,M₋,α)`, with right modules over `R[t]` and `R[t⁻¹]` and an isomorphism `α:M₊⊗R[t,t⁻¹]≅M₋⊗R[t,t⁻¹]`. A morphism is a pair of module maps commuting with `α`; kernels and cokernels are componentwise, since localization at the central variable is exact. The full subcategory VB has finite-projective components and the induced exact structure. Define `F(n)` by replacing `α` with `t^{−n}α`. Define `X₀=(1,t⁻¹)` and `X₁=(t,1)` as maps `F(n−1)→F(n)`. Put `u_i(P)=(P[t],P[t⁻¹],t^i)`, so `u_i(P)(n)=u_{i−n}(P)`. Define `H⁰F` and `H¹F` as kernel and cokernel of `(x,y)↦α(x)−y` on the two chart modules. These are ring gluing objects; scheme interpretation is a downstream comparison for commutative R.

Use right modules via `Rᵒᵖ` and opposite K-comparison; R may be noncommutative. VB is extension closed and essentially small, with gluing as object data.

(Weibel, V.1.5 and proof of V.1.5.4, pp.370–371.)

Use:

- `ProjectiveLine.Module`: Glued module triples and gluing-compatible maps.
- `ProjectiveLine.VectorBundle`: The full exact subcategory with finite-projective charts.
- `ProjectiveLine.KSpace`: K of the essentially small bundle category.
- `ProjectiveLine.twist`: `F(n)=(M₊,M₋,t⁻ⁿα)`; `X₀=(1,t⁻¹)`, `X₁=(t,1):F(n−1)→F(n)`.
- `ProjectiveLine.u`: `P↦(P[t],P[t⁻¹],tⁱ)`.
- `ProjectiveLine.u_twist`: Natural `u_i(P)(n)≅u_{i−n}(P)`.
- `ProjectiveLine.koszul`: Exact `0→F(−2)→F(−1)²→F→0`.
- `ProjectiveLine.directImage`: `H⁰=ker(d)`, `H¹=coker(d)`, `d(x,y)=α(x)−y`.
- `ProjectiveLine.map`: Exact unital bundle base change, compatible with `u_i`, twists, identity and composition.
- `twistExponent i n=i−n` for integers i,n: the zero-twist and successive-twist identities encode the exponent calculation in `ProjectiveLine.u_twist`.

**Checks.**

- `π_*(u_0(R)) ≅ R` and `R¹π_*(u_0(R)) = 0`.
- `π_*(u_1(R)) = 0` and `R¹π_*(u_1(R)) = 0`, so, if R is nonzero, `u_1(R)` is not isomorphic to `u_0(R)` although both have components `R[t]` and `R[t⁻¹]`; a definition that forgot the gluing would identify them.
- `R¹π_*(u_2(R)) ≅ R` and `π_*(u_2(R)) = 0`.
- For `R = 0` the category `VB(P¹_0)` is zero, so `K(P¹_0)` is contractible.
- `u_i(P)(n) ≅ u_{i−n}(P)` for all integers i and n, naturally in P.
- The computed exponents are `twistExponent 0 1=−1`, `twistExponent 1 1=0` and `twistExponent 2 (−1)=3`.

*Needs:* §3.2; §3.1; §2.5; `ModuleCat`; `Polynomial`; `LaurentPolynomial`.

### 9.2 The two-chart Koszul sequence

For every gluing module F and integer n, prove `0→F(n−2)→F(n−1)²→F(n)→0` is exact, using `(X₁,−X₀)` and `(X₀,X₁)`. On the plus chart these are `(t,−1)` and `(1,t)`; their composite is zero and the second map is split onto. On the minus chart use the analogous central `t⁻¹` calculation. For vector bundles the sequence is a VB-conflation, natural in F.

The named targets are `ProjectiveLine.koszul_exact` with the hypotheses and conclusions above.

Use the central-variable right-module convention of §9.1 for arbitrary unital associative R. No commutative scheme result is needed.

For the chart calculation define `koszulLeft t x=(t*x,−x)` and `koszulRight t (a,b)=a+t*b` on any ring. Prove `koszulRight_left` (zero composite), `koszulLeft_zero` and `koszulRight_zero`; the chart maps of a general module use its scalar action. These helpers fix the signs without asserting exactness from a zero composite alone.

**Checks.**

- Over `ℤ`, `koszulLeft 2 1=(2,−1)` and `koszulRight 2 (2,−1)=0`; replacing `−1` by +1 gives 4.
- `koszulLeft 0 1=(0,−1)` and `koszulLeft 2 0=(0,0)`; the first map is not zero when `t=0`.
- `koszulRight 0 (2,3)=2` and `koszulRight 2 (0,1)=2`; the second map retains both summands and is onto, including in characteristic two.

(Quillen, §8.3, p.135/PDF59, displayed sequence after T 3.1.)

*Needs:* §9.1.

### 9.3 Eventual regularity and projectivity of sections

For a vector bundle F, find `n₀` such that, for every `n≥n₀` and every left R-module N, `H¹(F(n)⊗_R N)=0` and `H⁰(F(n))⊗_R N→H⁰(F(n)⊗_R N)` is an isomorphism. Prove `H⁰(F(n))` is finite projective as a right R-module. Bound the finitely many powers appearing in the gluing matrix and its inverse, and use split polynomial projectives and the resulting universal cohomology calculation.

The named targets are `ProjectiveLine.eventually_regular`, `ProjectiveLine.sections_projective` with the hypotheses and conclusions above.

Require F to have finite-projective charts. The bound depends on F, while the cohomology statement is uniform in N.

(Quillen, §8.1 L 1.1(d), p.130/PDF54;L 1.12;proof, p.133/PDF57;§8.3 p.135/PDF59.)

*Needs:* §9.1.

### 9.4 Regularity and global generation on the two charts

Call F regular when `H¹(F(−1))=0`. Prove `H¹(F(k))=0` for every `k≥−1`, and that evaluation `u₀(H⁰F)→F` is onto. On conflations of regular vector bundles, `H⁰` is exact. For regular VB-objects, `H⁰(F(k))` is finite projective for all `k≥−1`. Use the Koszul sequence, the two-chart cohomology exact sequence and the finite-projective criterion; regularity does not mean regularity of the ring.

The named targets are `ProjectiveLine.IsRegular`, `ProjectiveLine.regular_globalGeneration` with the hypotheses and conclusions above.

Use the gluing category of §9.1 over arbitrary unital associative R. The evaluation and cohomology maps use the twist convention.

(Quillen, §8.1 L 1.2,1.3,1.7, p.131/PDF55;L 1.13 p.133/PDF57;§8.3 p.135/PDF59.)

**Checks.**

- `u₀(P)` is regular: `H¹(u₀(P)(−1))=H¹(u₁(P))=0`.
- For nonzero P, `u₁(P)` is not regular: `H¹(u₁(P)(−1))=H¹(u₂(P))=P`.
- For `u₋₁(P)`, evaluation from `u₀(P²)` is onto with kernel `u₁(P)`; regularity of the target does not force regularity of this kernel.

*Needs:* §9.2; §9.3.

### 9.5 The canonical resolution of a regular gluing bundle

On regular vector bundles MR, define `T₀F=H⁰F` and `Z₀F=ker(u₀(T₀F)→F)`, then `T₁F=H⁰(Z₀F(1))`. Prove `T₀,T₁:MR→P(R^op)` are exact and identify the kernel evaluation with `u₁(T₁F)`. It gives the natural VB-conflation `0→u₁(T₁F)→u₀(T₀F)→F→0`. The conflation lives in VB; its first term is not claimed to be regular.

For F is regular with finite-projective charts. `H⁰` and the kernel use the chart cohomology exactness of §9.4.

(Quillen, §8.1 construction1.9–1.11, p.132/PDF56;L 1.14 p.134/PDF58;§8.3 p.135/PDF59.)

Use:

- `P1.T0`: `H⁰` on MR, as a finite projective right module.
- `P1.Z0`: kernel of evaluation.
- `P1.T1`: `H⁰(Z₀(1))`, as a finite projective right module.
- `P1.canonicalResolution`: specified three-term conflation in VB.
- `P1.canonicalResolution_natural`: Bundle morphisms induce commuting maps of the resolution.
- `P1.T0_T1_exact`: Both coefficient functors preserve conflations of MR.

**Checks.**

- For `F=u₀(P)`, `T₀=P` and `T₁=0`.
- For `F=u₋₁(P)=O(1)⊗P`, `T₀=P²` and `T₁=P`, giving `0→O(−1)⊗P→O²⊗P→O(1)⊗P→0`.
- For nonzero P, `u₁(P)` is not regular because `H¹(u₁(P)(−1))=H¹(O(−2)⊗P)=P`; placing the first term in MR is false.

*Needs:* §9.4.

### 9.6 Regular bundle filtration

Let `MR(n)` contain F with `F(−n)` regular. Prove `MR(n)→MR(n−1)` induces a K-equivalence, by the canonical-resolution comma argument and twist. Eventual regularity expresses VB as the filtered union of these subcategories as n decreases, so `MR→VB` is a K-equivalence. The direction of the filtration follows from regularity persisting after positive twists.

The named targets are `ProjectiveLine.regular_filtration_equivalence` with the hypotheses and conclusions above.

For the exact structures are induced from VB. Use finite-data continuity and §9.2–9.5.

(Quillen, §8.2 L 2.2;proof, p.134/PDF58;§8.3 p.135/PDF59.)

**Checks.**

- `u₀(P)` belongs to `MR(0)` for every finite projective P.
- For `P≠0` it does not belong to `MR(1)`, because `u₀(P)(−1)=u₁(P)` is not regular.
- A sufficiently positive twist `F(r)` is regular, so F belongs to `MR(−r)`; the filtered union is taken as the index decreases.

*Needs:* §9.4; §4.3; §2.6.

### 9.7 The K-theory of the projective line over a ring: `K(R) × `K(R) ≃ K`(P¹_R)`

Prove `(u₀,u₁):K(R)×K(R)→K(VB(P¹_R))` is a homotopy equivalence in the connective theory. On MR use the canonical resolution to express the identity as `u₀T₀−u₁T₁`, then transport through the regular filtration and verify the inverse on `u₀` and `u₁`. The Koszul sequence gives `2(u_{i+1})_*=(u_i)_*+(u_{i+2})_*` for every integer i. Equivalently `(u₀,u₀−u₁)` is an equivalence; keep this basis for the localization argument.

The named targets are `ProjectiveLine.kTheory_splitting` with the hypotheses and conclusions above.

This is the ring gluing theorem in connective degrees; the general projective-bundle theorem for schemes belongs to its scheme owner.

(Weibel, T V.1.5, pp.369–371, including V.1.5.2 and V.1.5.4;E V.1.3, p.375;Quillen, §8.3 T 3.1, p.135.)

*Needs:* §9.1; §4.3; §2.6; §3.2; §9.2; §9.5; §9.6.

### 9.8 The Nil category of a ring and the Nil groups

Define `NilCat(R)` on pairs `(P,ν)` with P finite projective and `ν` nilpotent; morphisms commute with `ν` and conflations are exact on the underlying projectives. The forgetful exact functor is split by `P↦(P,0)`. Define the reduced Nil spectrum as its connective K-fibre and `Nil_n` as its homotopy groups, `n≥0`. Prove K`(NilCat R)≃K(R)×Nil(R)` and the analogous direct-sum decomposition of groups. Identify NilCat with the t-power-torsion modules of projective-resolution length at most one through `P_ν`. Its characteristic resolution is `0→P[t] --(t−ν)→ P[t]→P_ν→0`.

`ν` is nilpotent; use right modules consistently and the induced exact structure on the torsion-model equivalence.

(Weibel, II.7.4.4, p.133;IV.6.7, p.324;II.7.8.2;its proof, p.138;III.3.8.1, p.207.)

Use:

- `NilCat`: `Nil(R)`, with its exact structure.
- `NilCat.forget`: exact forgetful functor (P, `ν`) ↦ P.
- `NilCat.zero`: `P↦(P,0)`, the exact forgetful section.
- `nilGroup`: `π_n fib(K(Nil(R))→K(R))`, `n≥0`.
- `KGroup.nilCat_decomposition`: `K_n `Nil(R) ≅ K_n(R) ⊕ Nil_n`(R)`, naturally in R.
- `NilCat.equivTorsion`: `Nil(R) ≃ H_{1,T}(R[t])`, (P, `ν`) ↦ `P_ν`.
- `nilGroup_map`: Base change along unital ring maps.

**Checks.**

- For a field k, `Nil₀(k)=0`: the nilpotent filtration gives dévissage to k-spaces.
- For `A=k[ε]/(ε²)`, the unit `1+εt` has inverse `1−εt` and evaluation 1 at `t=0`. Its nonidentity determinant gives a nonzero `NK₁(A)` class, and therefore a nonzero `Nil₀(A)` under §9.15.
- The zero section splits the forgetful map; (P,0) has zero reduced Nil class.
- The endomorphism `2:ℤ→ℤ` is not nilpotent, since `2ⁿ≠0` for every n. It is excluded from NilCat.

*Needs:* §2.5; §3.2; `IsNilpotent`; `Polynomial`.

### 9.9 The resolution diagram for chart localization

Let `H₁` be the gluing modules admitting a length-one VB-resolution, and `H₁,t` the full subcategory with zero minus chart. Let P be the split exact category of minus-chart projectives extending from VB. Form `F=QVB×_{QP}ExtQ(P)`. Define G on conflations `K↣V↠M⊕Q`, with `K,V,Q∈VB` and `M∈H₁,t`, and Q-type morphisms preserving these data. The maps `h:G→QH₁,t` and `f:G→F` take respectively the M-term and the minus-chart conflation. `Core(VB)` acts by adding a bundle to K and V; both maps are equivariant. These models compare the chart fibre without relying on scheme localization.

Use the arbitrary-ring gluing category and the induced exact structures. F uses the Q-extension category of §3.6, not the ordinary category of conflations.

(Weibel V, V.7.2–7.3, pp.52–53/PDF52–53;V.7.8 pp.57–58/PDF57–58;E V.7.5 p.59/PDF59.)

Use:

- `P1.localisationModels`: equivariant diagram `QH₁,t←G→F` over `QVB→QP`.
- `P1.localisationModels_h`: h sends a resolution to its torsion quotient M.
- `P1.localisationModels_f`: f remembers Q and the split extension with quotient j*Q.
- `P1.localisationModels_action`: isoVB adds to kernel and middle object, equivariantly.
- `P1.torsionChartEquiv`: `H₁,t≃H₁,T(R[t])`, retaining the exact structures.

**Checks.**

- For `M=0` the resolution `V=K` with `Q=0` is an object of G.
- Taking `K=0,V=Q` and `M=0` sends h to zero and f to the split minus-chart extension.
- A gluing module with nonzero minus chart does not belong to `H₁,t`, even if its plus chart is t-torsion.

*Needs:* §9.1; §9.8; §4.6; §3.8.

### 9.10 Contractibility of the resolution fibres

For `M∈H₁,t`, contract the category of VB-deflations `V↠M` and admissible inflation comparisons over M as follows. Fix `q₀:V₀↠M`; send `q:V↠M` to `[q,q₀]:V⊕V₀↠M`. The two summand inclusions give natural transformations from the identity and the constant `V₀` functor to this sum functor, and are admissible inflations. These are the arrows the resolution category requires. Pullback projections are generally deflations and cannot replace those inclusions. Segal subdivision identifies this category with the homotopy-fibre model for h. Deduce that h, and its localization by `Core(VB)`, induce realization equivalences.

The named targets are `P1.resolutionFibre_contractible`, `P1.localisationModels_h_equivalence` with the hypotheses and conclusions above.

**Checks.**

- For `M=0` and `q=q₀:R→0`, the sum is `R⊕R→0`; both summand inclusions are split monomorphisms.
- With `M=0` and `V=V₀=R≠0`, the projection `V×_M V₀=R²→R` has nonzero kernel, so is not an allowable inflation comparison.
- For the zero bundle and zero target, the sum contraction stays at zero and the resolution category has a point as its realization.

M has a length-one bundle resolution. Use G from §9.9 and compatible subdivision quotient choices.

(Weibel V, V.7.3.1, pp.53–54/PDF53–54;V.7.8 pp.57–58.)

*Needs:* §9.9; Layer 1.

### 9.11 Directed bundle lattices

For a split minus-chart extension `A₋↣V₋↠Q₋` and a chosen extending bundle Q, show its compatible vector-bundle lattices inside the chart extension are nonempty and directed. Bound denominators in the chart gluing matrices and their inverses and enlarge finitely many lattices to a common one. For lattices P,P′ with the fixed quotient Q and kernel lattices K,K′, clear the finitely many denominators in P′ modulo P and enlarge the kernel to `t⁻ʳK` for sufficiently large r. The sum `P+t⁻ʳK` still maps onto precisely Q and is finite projective: the chosen quotient is projective on the affine chart, so the kernel extension splits there. The finitely many central-variable bounds make the gluing compatible on the other chart. This is the module calculation extending the scheme-language argument of V.7.8.1 to associative rings; no noncommutative scheme is invoked. The contractible poset supplies the fibre-comma comparison for f.

The named targets are `P1.bundleLattices`, `P1.bundleLattices_directed` with the hypotheses and conclusions above.

The target bundle Q and its gluing data are fixed; arbitrary choices of polynomial submodules would not satisfy the quotient condition.

(Weibel V, V.7.3.2 p.54/PDF54;L 7.8.1;proof of7.6.1 pp.57–58/PDF57–58.)

**Checks.**

- For zero quotient, kernel lattices `t⁻ʳP` form common enlargements after denominator bounds.
- For `V=P⊕Q` with fixed quotient Q, enlarging P to `t⁻ʳP` leaves the image exactly Q; enlarging Q instead would violate the defining condition.
- For the zero extension and zero quotient, the lattice poset has the zero object and is contractible.

*Needs:* §9.9; Layer 1.

### 9.12 Projective-line localization

Prove localized h and f of §9.9 are realization equivalences, using resolution fibres and directed lattices. Track the fibre map into QVB through the canonical `H₁,t→H₁` inclusion and the resolution equivalence. The diagram initially gives its additive inverse; invert on the fibre to orient the sequence as the canonical inclusion. Obtain `K(H₁,t)→K(VB)→K(P)` as a homotopy-fibre sequence with that chosen nullhomotopy.

The named targets are `P1.localisationModels_f_equivalence`, `P1.localization` with the hypotheses and conclusions above.

All models use the same right-module gluing and exact structures. The sign adjustment is checked on the two-term characteristic resolution of §9.8.

(Weibel V, V.7.2.1 pp.52–53, L 7.3.1–7.4 pp.53–55, V.7.8 pp.57–58, E 7.5 p.59 (same PDF pages).)

*Needs:* §9.10; §9.11; §3.10; §4.3; §6.18; Layer 1.

### 9.13 Localisation at t: the sequences through `R[t]` and through `P¹_R`

For `T={t^r}` in `R[t]`, prove `K(H₁,T(R[t]))→K(R[t])→K(R[t,t⁻¹])` is a homotopy-fibre sequence, where `H₁,T` has finite-projective resolution length at most one. Identify `H₁,T` with `H₁,t` by `M↦(M,0,0)`, and obtain `K(H₁,T)→K(VB(P¹_R))→K(R[t⁻¹])` from the chart comparison. Restricting to the plus chart gives a map between these sequences that is the identity on the fibre. Through the Nil equivalence this fibre is `K(R)×Nil(R)`. The final `K₀` map in the first sequence need not be surjective.

The named targets are `polynomial_t_localization`, `nilCategory_torsion_equivalence` with the hypotheses and conclusions above.

t is central and a nonzerodivisor in `R[t]`. `H₁,T` resolves all T-torsion modules with finite finite-projective resolutions. Central zero divisors require a perfect-support model.

(Weibel, V.7.1 and the paragraph after it, pp.420–421;V.7.1.1 (Caveat 7.1.1), p.421;E V.3.14, p.399;II.7.7.3, p.137;E V.3.13, p.399;E V.7.5, p.429;E V.7.5(b)–(c), p.429.)

*Needs:* §9.1; §9.8; §6.8; §6.3; §4.6; §3.2; §9.12.

### 9.14 The Nil inclusion factors through the forgetful map on K-theory

Compute the map from `NilCat(R)` into `H₁(P¹_R)`, `(P,ν)↦(P_ν,0,0)`, after the VB-resolution comparison. Its characteristic resolution gives `K(I)≃(u₀−u₁)∘K(forget)`. Hence its restriction to the reduced Nil fibre is nullhomotopic. Prove compatibility of this calculation with the sign-adjusted chart-fibre comparison.

The named targets are `nilInclusion_factorization` with the hypotheses and conclusions above.

`ν` is nilpotent and the module conventions are those of §9.1 and §9.8. The computation is of maps of K-spaces, and not only their `K₀` values.

(Weibel, Proof of T V.8.1, book p.430 (full PDF p.438;chapter V PDF pp.60–61),;the characteristic resolution of L II.7.8.2.)

*Needs:* §9.1; §9.8; §9.13; §4.3.

### 9.15 `Nil_n(R) ≅ NK_{n+1}`(R)

For `n≥0`, identify `Nil_n(R)` naturally with `NK_{n+1}(R)=coker(K_{n+1}(R)→K_{n+1}(R[t]))`. Split the chart localization sequence by the projective-line equivalence and the forgetful calculation: the `K_n(R)` summand enters by `u₀−u₁` while the reduced Nil summand enters by zero. The residual quotient gives the stated isomorphism. Evaluation at zero splits the polynomial injection, so its cokernel also identifies with the evaluation kernel.

The named targets are `nilGroup_eq_NK` with the hypotheses and conclusions above.

R is unital associative, and the Nil index is nonnegative. Changing t to `t⁻¹` gives the second polynomial-chart version. No negative-index NilCat homotopy group is defined here.

(Weibel, T V.8.1 and proof, p.430;III.3.5.3, p.205.)

*Needs:* §9.13; §9.7; §9.8; §4.3; §3.2; §9.14.

### 9.16 The positive Fundamental Theorem

For `n≥1`, prove `0→K_n(R)→K_n(R[t])⊕K_n(R[t⁻¹])→K_n(R[t,t⁻¹])→K_{n−1}(R)→0` is exact. The first map is diagonal scalar extension, the second is the difference of the chart maps, and the boundary is t-localization followed by the forgetful retraction from `K_{n−1}NilCat(R)`. Combine the two chart sequences and the projective-line basis `(u₀,u₀−u₁)`. Evaluation at `t=1` splits the constant terms; multiplication by `[t]` supplies the boundary splitting in §9.17.

The named targets are `fundamentalTheorem_positive` with the hypotheses and conclusions above.

Use the finite-resolution transfer of `0→R[t] --t→R[t]→R→0`. Layer 10 proves degree zero.

(Weibel, T V.8.2 and proof, pp.430–431;V.3.5.1, p.388.)

*Needs:* §9.13; §9.15; §9.7; §7.7; §4.3; §3.2.

### 9.17 The t-class section

For `x∈K_n(R)`, `n≥0`, use the external pairing with `[t]∈K₁(ℤ[t,t⁻¹])` in the first factor to define `{t,x}∈K_{n+1}(R[t,t⁻¹])`. Prove torsion-category boundary is `(x,0)∈K_n(R)⊕Nil_n(R)`, by the product-boundary formula and the characteristic resolution for the zero endomorphism. Thus `∂{t,x}=x` after forgetting the Nil coordinate, and this is the natural right inverse in the Fundamental Theorem. The sign is fixed by `∂[t]=+[R[t]/t]`.

The named targets are `laurentTSection`, `laurentTSection_boundary` with the hypotheses and conclusions above.

R need not be commutative: tensoring over `ℤ` gives the external biexact pairing. Keep `[t]` first; moving it to the second factor changes the sign according to the degree of x.

(Weibel, V.8.2, proof, the splitting, p.431;E V.8.1, p.434;E IV.1.23, p.276.)

**Checks.**

- For `x=[R]` in `K₀(R)`, `{t,x}` has boundary `[R]`, fixing the positive sign.
- For `x=0` the section is zero by bilinearity.
- Over a field, `{t,[R²]}` has boundary 2; replacing t by `t⁻¹` negates that value.

*Needs:* §7.4; §9.13; §9.8; §9.16; §3.1–3.5, §8.4; §3.12; Layer 1.

### Examples

The line objects `u₀,u₁,u₂` have `(H⁰,H¹)` equal to (R,0), (0,0), (0,R). This fixes twist direction and rules out forgetting the gluing. The unit `1+εt` detects a nonzero `Nil₀` class over dual numbers. In Laurent splitting, `{t,x}` maps to x.

### Dependencies

Layers 1–8; central polynomial localization, module kernels/cokernels and nilpotent endomorphisms.

## Layer 10: Bass contraction and the nonconnective ring spectrum

### 10.1 Flasque rings, infinite sum rings and the Eilenberg swindle

For an associative unital R, define flasque-ring data as an (R,R)-bimodule M, finite projective on the right, with a bimodule isomorphism `R⊕M≅M`. Tensoring right finite projectives with M gives an exact endofunctor T and a natural isomorphism `id⊕T≅T`. Additivity makes `K(id)` nullhomotopic, so connective `K(R)` is contractible. The same swindle applies to the polynomial and Laurent extensions and hence all Bass negative groups vanish. Define `C(R)` using countable row-and-column-finite matrices; its finite-support ideal is `M∞R` and `S(R)=C(R)/M∞R`. Show the shift decompositions give `C(R)` the stated swindle data.

Rows and columns are finite without uniform bounds on entries. Finite-support matrices form a two-sided ideal; use right-module tensor orientations.

(Weibel, II.2.1.3, p.69;E I.1.8 (Cone Ring), p.5.)

Use:

- `IsFlasqueRing`: bimodule and the isomorphism witnessing flasqueness.
- `IsFlasqueRing.K0_eq_zero`: zeroth K-group of a flasque ring vanishes.
- `IsInfiniteSumRing`: flasque ring whose bimodule is the ring as a right module.
- `coneRing`: cone ring of a ring, the row-and-column finite infinite matrices.
- `coneRing_isInfiniteSumRing`: cone ring is an infinite sum ring, hence flasque.

**Checks.**

- The row-and-column-finite cone ring ΓR is flasque by disjoint infinite block embeddings; finite-support matrices form its two-sided ideal `M∞R`.
- For a nonzero field k, k is not flasque: `[k]` is 1 in `K₀(k)=ℤ` and a swindle would force it to zero.
- For the zero ring, the zero bimodule witnesses flasqueness. The swindle gives `K₀=0`.
- For a flasque bimodule M with `M⊕R≅M`, tensoring a finite projective P gives `P⊗_R M⊕P≅P⊗_R M`, hence `[P]=0`.

*Needs:* `Matrix`; `RingHom`.

### 10.2 Contracted functors and the contraction LF

For F from unital rings to abelian groups, define `NF(R)=coker(F(R)→F(R[t]))` and `LF(R)=coker(F(R[t])⊕F(R[t⁻¹])→F(R[t,t⁻¹]))`, with difference of chart maps. Evaluation splits the map defining N. Call F acyclic if `0→F(R)→F(R[t])⊕F(R[t⁻¹])→F(R[t,t⁻¹])→LF(R)→0` is exact. Contracted data consist of acyclicity and a natural section of the final map, compatible with change of ring and relabeling of the polynomial variable. Establish formal N/L interchange and the induced contraction data on LF and NF.

R is associative unital and the polynomial variable is central. The diagonal, difference and cokernel maps are part of the data, as is naturality of the section.

The convention helper `chartDifference : A×A→A` is the homomorphism `(a,b)↦a−b` for an abelian group A. Its API is vanishing on the diagonal, compatibility with homomorphisms and negation on exchanging the factors. In the Laurent sequence the two chart images are first mapped into the common target before taking this difference.

(Weibel, III.4.1.1, p.210.)

Use:

- `contraction`: functor LF.
- `IsAcyclic`: acyclicity predicate.
- `IsContracted`: Acyclicity together with the natural splitting.
- `IsContracted.splitting`: splitting, natural in the ring and the variable.
- `contraction_iterate`: iterates NLF and L-squared F.
- `IsContracted.sum`: direct sum of contracted functors is contracted.

**Checks.**

- For the constant functor `F(R)=ℤ` with all maps the identity, the diagonal/difference sequence is exact, `NF=LF=0`.
- The diagonal sends 1 to (1,1) and the chart difference sends (a,b) to `a−b`; replacing the difference by sum makes their composite 2 at `a=b=1`.
- For `F=K₀` and a field k, `NK₀(k)=LK₀(k)=0`; the Laurent sequence reduces to `ℤ→ℤ²→ℤ` with diagonal and difference.
- Evaluation at `t=0` identifies NF with the kernel of evaluation, so an element coming from `F(R)` has zero N-class.
- In `ℤ`, `chartDifference (1,1)=0`, `chartDifference (1,0)=1` and `chartDifference (0,1)=−1`.

*Needs:* §10.1; `Polynomial`; `LaurentPolynomial`.

### 10.3 Bass's negative K-groups

Define Bass `K_{−n}(R)=LⁿK₀(R)` for `n≥0`, using the projective `K₀` functor. Construct its functorial maps by the cokernel universal property. For a nonunital I, first put `K₀(I)=ker(K₀(ℤ⋉I)→K₀(ℤ))`, and then apply the same central-variable contractions to nonunital polynomial and Laurent rings. The split augmentation makes this agree with the reduced contraction of unitization. This early group-level extension supplies the ideal and corner maps needed in the negative axioms. The later spectrum fibre comparison proves agreement with this definition.

Keep signed iteration indices; `K₀` remains the supplied degree-zero group.

(Weibel, III.4.1, p.210;III.3.7, p.206;III.4.1.1, following paragraph, p.210.)

Use:

- `negativeK`: n-th negative K-group.
- `negativeK_functor`: Functoriality in the ring.
- `negativeK_one`: first negative group is the contraction of the zeroth K-group.
- `negativeK_eq_contraction_iterate`: `K_{−n}=LⁿK₀`.
- `negativeK_flasque`: negative groups of a flasque ring vanish.
- `negativeK_prod`: Compatibility with finite products of rings.

**Checks.**

- At iteration zero, negativeK(R,0) is `K₀(R)`; for a field k its generator `[k]` is 1 in `ℤ`.
- For every field k, `negativeK(k,1)=0`; a copy of `K₀(k)` in degree `−1` would fail.
- For a flasque R every iteration vanishes, including zero.
- For `k×k`, iteration zero gives `ℤ²` and each positive iteration is zero; products are finite.

*Needs:* §10.2; §3.2; `LaurentPolynomial`; `ExactK0`.

### 10.4 Contraction of negative groups

Prove `K₀` is contracted and `LK₁≅K₀`. Obtain the degree-zero natural section by applying the degree-one Fundamental Theorem in a second variable and passing to its cokernel. Prove N/L interchange needed for iteration. It follows inductively that every `K_{−n}` is contracted and `LK_{−n}≅K_{−n−1}`. The Laurent decomposition has four terms `K_{−n}(R)`, `K_{−n−1}(R)`, and the two chart `NK_{−n}(R)` terms.

The named targets are `negativeK_contracted`, `contraction_K1_equiv_K0` with the hypotheses and conclusions above.

Use the central two-variable square, its commuting specializations and the connective `K₁` adapter. Sections are natural in rings and in the chosen variable.

(Weibel, T III.3.6–3.7 and proofs, pp.205–206;III.4.1.1–4.1.2, p.210;III.4.2, p.211.)

*Needs:* §10.2; §10.3; §9.16; §9.17; §3.2.

### 10.5 The Fundamental Theorem with Nil terms, in every degree

Combine the positive-degree theorem with contractedness to obtain the diagonal/difference split exact sequence in every integer degree. Thus `K_j(R[t,t⁻¹])≅K_j(R)⊕K_{j−1}(R)⊕NK_j(R)⊕NK_j(R)`. For `j≥1` the section is `x↦`{t,x}``; for `j≤0` use the contraction section, later identified with the extended spectrum product. In the overlap `NK_{n+1}≅Nil_n` for `n≥0`, use the precise reduced Nil definition of Layer 9. A two-term decomposition requires the NK terms to vanish.

The named targets are `fundamentalTheorem_allDegrees` with the hypotheses and conclusions above.

NilCat homotopy is only nonnegative; no negative `Nil_n` is introduced by this formula. Scheme projective-bundle results are downstream.

(Weibel, V.8.2, p.430;V.8.1, p.430;V.8, opening, p.430;V.8.2, proof, p.431.)

*Needs:* §9.16; §9.17; §10.4; §9.15; §10.3; §10.2; `LaurentPolynomial`.

### 10.6 Morita invariance

Use a supplied module-category Morita equivalence and its exact finite-projective restriction to induce connective K-equivalences. Prove it commutes with the central-variable construction: polynomial modules are modules with a commuting endomorphism, so the equivalence and its inverse extend to these categories. It induces natural Bass negative-group isomorphisms. For a nonempty finite matrix index, the matrix equivalence gives `K_j(M_nR)≅K_j(R)`. Pairing compatibility requires the stated commuting biexact diagram; internal unit preservation requires additional monoidal unit data.

Use right modules and opposite comparison. Additive Morita equivalences need not be monoidal; matrix size is positive.

(Weibel, II.2.7, p.75;II.2.7.1, p.76;II.2.7.2, p.76;IV.6.3.5, p.321.)

Use:

- `KTheory.moritaEquiv`: induced isomorphism of K-groups from a Morita equivalence.
- `KTheory.moritaEquiv_matrix`: instance for the matrix ring.
- `KTheory.moritaEquiv_mul`: External-product compatibility for Morita diagrams with a specified biexact comparison.
- `KTheory.moritaEquiv_negative`: isomorphism holds in negative degrees as well.

**Checks.**

- For `n ≥ 1`, `K_*(M_n(R)) ≅ K_*(R)`; the `n = 0` case over a field fails.
- For k and `M₂(k)`, `K₀` is `ℤ` on both sides although the rings are not isomorphic.
- For a commutative ring with an invertible module L whose class differs from `[R]` in `K₀`, the Morita autoequivalence `L ⊗_R −` sends `[R]` to `[L]`. Thus it is not a unital `K₀`-ring automorphism. A product comparison must carry additional monoidal/biexact compatibility data.
- For k and `M₂(k)`, every negative group is zero; the matrix equivalence retains the degree rather than shifting `K₀` into `K₋₁`.

*Needs:* `ModuleCat.matrixEquivalence`; `IsMoritaEquivalent`; `IsMoritaEquivalent.matrix`; `Matrix`; `ExactK0`; §2.5; §3.2; §10.3; §7.4.

### 10.7 The axioms a theory of negative K-theory must satisfy

Define negative-theory data on associative possibly nonunital rings: functors `E_j`, `j≤0`; `E₀≅K₀`; and natural ideal boundaries `E_j(R/I)→E_{j−1}(I)`. Require exactness of `E_j(I)→E_j(R)→E_j(R/I)→E_{j−1}(I)→E_{j−1}(R)`, vanishing on flasque rings, and invariance under the actual nonunital inclusion `R→M∞R`. Prove Bass groups with the early nonunital extension satisfy these axioms, using patching, contraction and the swindle. These requirements give a comparison interface, rather than assuming that all alternative negative models agree.

Ideals are two-sided. The finite corner maps and their union are nonunital and use the idempotent-extension functors introduced in Layer 3. Flasqueness includes its bimodule data.

(Weibel, Definition III.4.4, its axioms (3)–(4) and Example 4.4.1, p.III.32.)

Use:

- `NegativeKTheory`: functors in degrees at most zero together with the boundary maps.
- `NegativeKTheory.k0`: Axiom one: in degree zero the functor is the Grothendieck group.
- `NegativeKTheory.exact_ideal`: Axiom two: the five-term sequence of an ideal is exact.
- `NegativeKTheory.flasque`: Axiom three: a flasque ring has vanishing groups.
- `NegativeKTheory.matrix`: Axiom four: the inclusion in the infinite matrix ring is an isomorphism.
- `bassTheory`: Bass’s negative groups form such a theory.

**Checks.**

- At degree zero the comparison sends `[P]` to the projective class; for k the class `[k]` is 1.
- For `I=0`, the ideal exact sequence is `0→E_j(R) --id→ E_j(R)→0→0`.
- For `I=R`, the quotient is the zero ring and `E_j(I)→E_j(R)` is the identity.
- For the nonunital corner `k→M₂k`, the image of k is the rank-one row projective and its `K₀` class is 1 in the Morita normalization. The unital diagonal map instead has class 2.

*Needs:* §10.3; §10.1; `Matrix`.

### 10.8 The cone proof of uniqueness for negative ring theories

For every theory satisfying §10.7, the exact sequence `M∞R→C(R)→S(R)`, cone vanishing and matrix invariance identify `E_j(S(R))≅E_{j−1}(R)`, `j≤0`. Iterate these boundary isomorphisms from the `E₀≅K₀` to construct a unique natural comparison with Bass groups. Prove it preserves ideal boundaries by the commuting cone/ideal diagrams. The word unique is relative to the fixed degree-zero identification and boundary data.

The named targets are `NegativeKTheory.uniqueness` with the hypotheses and conclusions above.

Use the row-and-column-finite cone, its finite-support ideal and the nonunital maps, not an incorrectly unital matrix union.

(Weibel, Definition III.4.4 and Theorem 4.5 with its proof, p.III.32.)

*Needs:* §10.7.

### 10.9 Mayer–Vietoris for a Milnor square, continued into negative degrees

For a Milnor pullback square with one quotient map surjective, extend the `K₁–K₀` patching sequence downward in Bass degrees. Contract the polynomial-chart versions of the patching sequence and their compatible boundaries. For every `j≤0` obtain exactness `K_j(R)→K_j(R₁)⊕K_j(R₂)→K_j(S)→K_{j−1}(R)`, with the same chart difference in each successive term. The common ideal need not be Tor-unital. No `K₂` or higher Milnor excision is inferred.

The named targets are `negativeK_milnorMayerVietoris` with the hypotheses and conclusions above.

The square is a pullback of associative unital rings and at least one map to S is onto. Use projective patching and the nonunital negative groups for the common two-sided ideal.

(Weibel, III.4.3, pp.212–213;III.4, the paragraph before T 4.3, p.212;III.2.6, p.195;III.4.3.1, p.213.)

*Needs:* §10.3; §10.4; §10.2; §8.6; §3.1–3.5, §8.4; §3.12; Layer 1.

### 10.10 The nonconnective Bass K-theory spectrum

For a spectrum-valued ring functor E, form `P(E)(R)=E(R[t]) ⨿ʰ_{E(R)} E(R[t⁻¹])`, then `L(E)(R)=cofib(P(E)(R)→E(R[t,t⁻¹]))` and `ΛE=ΩL(E)`. The product with `[t]`, in the first factor, gives `K→ΛK` and compatible maps `Λ^rK→Λ^{r+1}K`. Define Kᴮ as their sequential homotopy colimit. Use the connective Fundamental Theorem to prove that each step retains the previously established degrees and adds the next Bass degree.

Use derived spectrum pushouts/cofibres (§1.7), S-deloopings (Layer 5) and pairings (Layer 7). Connectivity bounds depend on the stage.

(Weibel, IV.10.1–10.3, p.349;IV.10.4, p.350.)

Use:

- `deloop`: functor LE and its desuspension.
- `deloop_cofibration`: natural cofibration sequence.
- `bassSpectrum`: nonconnective Bass K-theory spectrum.
- `bassSpectrum_natural`: Naturality in the ring and in the model of connective K-theory.
- `bassSpectrum_independent`: Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra.

**Checks.**

- In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
- In degree minus one the homotopy group is the first negative K-group.
- For a regular noetherian ring the negative homotopy vanishes.
- Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.

*Needs:* §10.5; §10.3; §10.7; §7.4; §3.2; §5.11; Layer 1.

### 10.11 The homotopy groups of the Bass spectrum are the K-groups and Bass's negative groups

Prove `K(R)→Kᴮ(R)` is an isomorphism on `π_j` for `j≥0`, and `π_{−n}Kᴮ(R)≅LⁿK₀(R)` for `n≥1`. More precisely, the r-th stage `ΛʳK(R)`, `r≥0`, has `π_j=K_j(R)` for `j≥−r` and `π_j=0` for `j<−r`. Its transition is an isomorphism in degrees `j≥−r`; degree `−r−1` first appears at the next stage. At that first newly exposed degree identify the cokernel in the cofiber exact sequence with the Bass contraction; use the product-induced section and then induction. Sequential homotopy-colimit continuity makes these stage comparisons isomorphisms for the final spectrum. Prove naturality and agreement of the spectrum boundaries with the contraction boundaries.

The named targets are `bassSpectrum_stage_pi`, `bassSpectrum_pi` with the hypotheses and conclusions above.

**Checks.**

- At stage `r=0`, `π₋₁K(R)=0`, even for a ring with nonzero Bass `K₋₁`; that group cannot already be identified with the connective stage.
- At stage `r=1`, `π₋₁ΛK(R)=LK₀(R)`, while `π₋₂ΛK(R)=0`.
- For a regular noetherian ring of finite global dimension the new negative groups are zero at every stage, consistently with §10.13.

Integer indexing and the tail range of each Λ-stage are explicit; no negative homotopy group of a space is used.

(Weibel, IV.10, opening, p.349;IV.10.3, proof, p.350;IV.10.4, last sentence, p.350;V.8.4, p.432.)

*Needs:* §10.10; §10.5; §10.4; §10.3; §9.17.

### 10.12 Nonpositive Milnor excision

For a unital `f:R→S` identifying a two-sided ideal I with `J⊂S`, prove the map `fib(Kᴮ(R)→Kᴮ(R/I))→fib(Kᴮ(S)→Kᴮ(S/J))` induces isomorphisms in every degree `j≤0` and a surjection in degree 1. At degree zero use the relative-triple patching comparison; contract it compatibly to reach negative degrees. First compare the connective relative fibre with the Bass relative fibre: the natural map is an isomorphism on `π_j` for `j≥1`, by §10.11 and the long exact sequences of the two fibres. In particular, for degree 1 use this comparison, `relativeK.one_eq_classical` and classical relative `K₁` surjectivity for a map identifying the ideals. Thus its birelative fibre has `π_j=0` for all `j≤0`, by the long exact sequence. Applied to `ℤ⋉I→R`, the nonpositive relative groups depend only on I. No integral positive-degree equivalence follows without the excision hypotheses of §8.10.

The named targets are `bassSpectrum_nonpositive_excision` with the hypotheses and conclusions above.

The square is Milnor with `S→S/J` onto. No Tor-unitality is needed; classical relative `K₁` surjectivity requires an adapter to spectrum `π₁`.

(Weibel, IV.10.1, p.349;E IV.10.1, p.351;III Remark 2.2.1, p.III.13, and IV E 1.15, p.IV.16;Clausen–Mathew–Morrow, proof of P 4.34, arXiv:1803.10897v2 p.35, recalling the nonconnective K-theory connectivity assertion. Their T 4.33 concerns the cyclotomic-trace fibre and is not the K-theory excision theorem.)

*Needs:* §10.11; §10.10; §10.5; §10.4; §10.2; §10.9; §8.10; §8.1; §8.3; §8.6; Layer 1; §8.9; §8.7.

### 10.12a Polynomial and Laurent invariance in degree zero

Prove `noetherianRing_G0_polynomial`: for a left noetherian associative ring R and a central variable t, extension of scalars induces `G₀(R)≃G₀(R[t])`. Construct its inverse by `[M]↦[M/tM]−[ker(t:M→M)]`, proving additivity by the kernel–cokernel exact sequence. Evaluation on modules alone is not exact. Prove noetherianness of central polynomial rings and the noncommutative surjectivity argument, using finite filtrations and polynomial-module presentations.

Prove `regularRing_K0_polynomial`: for left noetherian R of finite left global dimension, `R→R[t]` induces `K₀(R)≃K₀(R[t])`, inverse to evaluation at zero. Supply finite-projective resolution comparisons with G₀ for both rings and their scalar-extension compatibility. Prove that an iterated central polynomial ring remains left noetherian with finite left global dimension (at most the old dimension plus the number of variables), so the comparison iterates with evaluation and either chart variable.

Prove `noetherianRing_G0_laurent`: for a left noetherian associative ring R, central localization induces `G₀(R[t])≃G₀(R[t,t⁻¹])`. Identify the Serre kernel with the finitely generated modules killed by a power of t. Filter them by powers of t; each successive R-module M has characteristic resolution `0→M[t] --t→ M[t]→M→0`, so its image in `G₀(R[t])` is zero. Serre localization then gives the isomorphism.

Prove central localization preserves left noetherianness and does not increase finite left global dimension. Together with the polynomial bound, this covers every mixed iterated central polynomial/Laurent extension of R. For left noetherian R of finite left global dimension, construct `regularRing_K0_laurent`: `K₀(R)≃K₀(R[t,t⁻¹])` induced by scalar extension, using the resolution comparisons for R, R[t] and R[t,t⁻¹]. Prove compatibility with `regularRing_K0_polynomial` and the localization map.

(Weibel II, T 6.5 and proof, pp.122–123, with E 6.13 for the noncommutative case; T 7.8, p.137, and the resolution comparison §7.7; III, D 4.1 and the following vanishing argument, p.210.)

**Checks.**

- For a field k, the polynomial comparison identifies both `K₀` groups with `ℤ` and sends `[k]` to `[k[t]]`.
- For `R=ℤ`, the module `R[t]/(t)` has G₀ class zero over R[t]. The inverse formula is `[R]−[R]=0`; ordinary evaluation alone would give the incorrect class `[R]`.
- For `R=k×k`, both primitive projective classes are retained separately by extension and evaluation, including after two polynomial variables.
- The Laurent comparison sends `[k]` to `[k[t,t⁻¹]]` and identifies both `K₀` groups with `ℤ`; the positive-chart map is onto, so `LK₀(k)=0`.
- For a finitely generated R-module M killed by t, its characteristic resolution gives zero in `G₀(R[t])`; a finite t-power filtration gives the same result for every module in the Serre kernel.
- For `R=k×k`, `regularRing_K0_laurent` retains both primitive projective classes after adjoining `t`, `t⁻¹` and another polynomial variable; the next Bass contraction also vanishes.
- The zero ring has zero groups throughout. The dual numbers over k do not have finite global dimension, so the regular-ring theorem does not apply to them.

*Needs:* §4.6; §4.14; GrothendieckEulerForms Layers 2–3 and `moduleResolutionEquiv`; Mathlib polynomial rings, central localization and module homological algebra.

### 10.13 Vanishing of the negative K-groups for a regular noetherian ring

For a left noetherian ring of finite left global dimension, prove `K_{−n}(R)=0` for every n>0. Use `regularRing_K0_laurent` and `regularRing_K0_polynomial` to make the positive-chart map `K₀(R[t])→K₀(R[t,t⁻¹])` onto, so `LK₀(R)=0`. Apply the same comparisons to all mixed iterated central polynomial/Laurent extensions; their noetherianness and finite left global dimension allow the contraction argument to iterate. The analogous right-module formulation is transported through opposite-ring duality. This supplies a sufficient regular noetherian scope without defining regularity by a claim about arbitrary infinite modules. The absence of negative homotopy in the connective spectrum is not evidence for this vanishing theorem.

The named targets are `negativeK_regular_vanishing` with the hypotheses and conclusions above.

Use the stated finite-global-dimension noetherian scope and Bass negative groups, or their identified nonconnective homotopy groups. No converse for singular rings is asserted.

(Weibel, III.4.1, after D 4.1, p.210;V.8, opening, p.430;I.3.7.1, p.23.)

*Needs:* §10.5; §10.10; §10.9; §4.14; §10.12a (`noetherianRing_G0_laurent`, `regularRing_K0_polynomial`, `regularRing_K0_laurent` and mixed-extension regularity).

### Examples

For a field all negative groups vanish. The zero ring has zero group even in iteration zero. A nonzero field cannot be flasque because its free class is 1 in `ℤ`. Matrix Morita invariance requires a nonempty matrix index; `M₀(k)` has zero `K₀`.

### Dependencies

Layers 1, 3 and 7–9; abelian-group cokernels and sequential derived spectrum constructions.

## Layer 11: Frobenius pairs and negative localization

### 11.1 Frobenius categories, Frobenius pairs and their derived categories

Define `FrobeniusPair` as a fully faithful exact inclusion `A₀→A₁` between small Frobenius exact categories that preserves projective-injective objects. Its derived category is the Verdier quotient `stable(A₁)/stable(A₀)`. Define maps of pairs by compatible exact functors preserving these objects, and the induced triangle functor. The new object is the pair and its quotient; its two Frobenius structures and stable triangulations are suppliers. For a small exact E, use bounded complexes with degreewise split conflations as `A₁`, and the complexes homotopy equivalent to admissibly acyclic complexes as `A₀`. Prove that this is a pair whose quotient is Dᵇ(E).

The inclusion is fully faithful and exact. Both structures have enough projectives and injectives with coincident classes; pair maps preserve these classes. Admissible acyclicity factors differentials through conflations; homotopy-acyclicity accommodates incomplete exact categories.

(Schlichting 2003, §3.3–3.5, pp.8–9;§5.3 and D 5.4, p.11.)

Use:

- `FrobeniusPair`: fully faithful exact inclusion preserving projective-injectives.
- `FrobeniusPair.derived`: Verdier quotient of the stable categories.
- `FrobeniusPair.map`: induced triangle functor for a compatible map of pairs.
- `FrobeniusPair.ofExact`: bounded-complex and homotopy-acyclic pair of an exact category.
- `FrobeniusPair.waldhausen`: Inflations and maps inverted in the derived quotient.

**Checks.**

- For the identity inclusion `A→A`, the derived quotient is zero.
- For `0→A` with A split exact, every A-object is projective-injective and the derived quotient is zero.
- For bounded finite-dimensional k-complexes, the acyclic part contains the two-term identity complex but excludes k concentrated in degree zero.
- Enough projectives alone does not supply the `IsFrobenius` hypothesis; finitely generated `ℤ`-modules are a negative control.

*Needs:* `ExactStructure.IsFrobenius`; `ExactStructure.split_isFrobenius`; `CategoryTheory.ObjectProperty.IsTriangulated`; `CategoryTheory.ObjectProperty.trW`; `ExactK0`; `CategoryTheory.Idempotents.Karoubi`.

### 11.2 Existential factorization in a Frobenius pair

For a Frobenius pair, factor any map by an inflation followed by a weak equivalence, using an inflation `i:A↣I` into a projective-injective and the graph inflation `(f,i):A↣B⊕I`. Projection `B⊕I→B` is the weak equivalence; its target summand must be B, not A. Construct dual deflation factorization using enough projectives. These choices prove existence and supply both orientations of the factorization-based Waldhausen apparatus; a functorial choice of projective-injectives is unnecessary.

The named targets are `FrobeniusPair.factorization` with the hypotheses and conclusions above.

Use the Frobenius axioms, including both enough-projective and enough-injective fields. Weak equivalences are inverted in the pair’s derived quotient.

(Schlichting 2003, Remark11.2, p.20/PDF20;Appendix A.5, p.25.)

**Checks.**

- For `f:A→B`, the factorization uses `(f,i):A↣B⊕I` and projection onto B.
- For `f:A→0`, it is the chosen inflation `A↣I` followed by `I→0`, a weak equivalence because I is projective-injective.
- For `f=id_A` one may use `i:A↣I`; projection `A⊕I→A` is a stable equivalence even though it need not be an isomorphism.

*Needs:* §11.1; §5.12.

### 11.3 Stable classes modulo a dense triangulated subcategory

For a strictly full dense triangulated `A⊂T`, define X∼Y when `X⊕A₁≅Y⊕A₂` for `A₁,A₂∈A`. Prove resulting direct-sum monoid is an abelian group: choose a complement to X in A to obtain an inverse. Triangle relations descend to this quotient, and comparison with the universal Euler presentation gives `G_A≅K₀(T)/im K₀(A)`. Prove that the zero stable class is equivalent to membership in A.

T is essentially small; dense means that every T-object is a direct summand of an A-object. Strict fullness, closure under shifts and triangles are essential.

(Thomason, L 2.2, pp.5–6/PDF5–6.)

Use:

- `DenseClasses`: Stable direct-sum quotient of T by A.
- `DenseClasses.zero_iff`: `class(X)=0` iff `X∈A`.
- `DenseClasses.euler`: distinguished triangle gives `class(Y)=class(X)+class(Z)`.
- `DenseClasses.quotientEquiv`: `G_A≃K₀(T)/im K₀(A)`.

**Checks.**

- If `A=T` the quotient is zero.
- For bounded complexes of finite-dimensional k-spaces, `A={Euler characteristic even}`; `G_A≅ℤ/2` and `k[0]` has nonzero class.
- A nonzero A-object has zero quotient class, so ordinary object isomorphism classes are the wrong quotient.

*Needs:* §11.1; `CategoryTheory.ObjectProperty.IsTriangulated`.

### 11.4 The K-zero criterion for a dense triangulated subcategory

Prove `X∈A` exactly when `[X]` belongs to `im(K₀A→K₀T)`. Conversely, for each subgroup `H⊂K₀T` the strictly full objects whose classes lie in H form a dense triangulated subcategory. These assignments are inverse and `K₀A→K₀T` is injective. Use the preceding stabilized-object quotient to realize Euler equalities, rather than inferring object membership from an arbitrary equality in a Grothendieck group.

The named targets are `DenseClasses.membership_iff`, `DenseClasses.classification` and `DenseClasses.map_injective` with the hypotheses and conclusions above.

Use the dense triangulated hypotheses of §11.3 and the Euler `K₀` presentation. Suggested.lean uses `TauCeti.TriangulatedK0`, its class map and functorial map from `TauCeti.CategoryTheory.GrothendieckGroup.Triangulated`; density is `A.retractClosure = ⊤` for Mathlib’s triangulated object property A. A non-dense triangulated subcategory need not be determined by its `K₀` image.

(Thomason, T 2.1 and C 2.3, pp.5–6/PDF5–6.)

**Checks.**

- For `A=T`, the inclusion induces the identity on `K₀(T)` and the membership criterion accepts every object.
- In bounded complexes of finite-dimensional k-spaces, the objects of even Euler characteristic form the dense subcategory for `2ℤ⊂ℤ`. Its `K₀` inclusion is injective but not surjective; `k[0]` is outside it.
- The zero subcategory of that derived category is not dense. The nonzero object `k[0]⊕k[1]` has class zero, so its class lies in the zero subcategory's image without the object belonging to that subcategory.

*Needs:* §11.3.

### 11.5 Flasque enlargement and suspension

Construct countable admissible-ind envelope: objects are inflation sequences `X₀↣X₁↣⋯` and maps are `lim_i colim_j Hom(X_i,Y_j)`, with induced exact structure. Establish exact countable coproducts and the natural swindle `id⊕T≅T`. For a Frobenius pair form its Frobenius envelope F and the suspension pair S using the full objects killed by the quotient of the envelope-derived category by the original derived category. Prove original idempotent-completed derived category identifies with the countably compact objects of the envelope, and `D(S)` is the Verdier quotient. Verify exactness of the natural sequence `id→F→S`. Define the Frobenius IK spectrum now by spectrifying levels `K(SʳA)`. The structure map `K(A)→ΩK(SA)` comes from the envelope contraction and the composite nullhomotopy; the completed-level computation is §11.14.

Keep the smallness bounds. Countable compactness concerns countable coproducts only; use the exact ind-envelope.

(Schlichting 2003, L 4.2, p.9;§4.1, D 4.3, P 4.4 and D 4.7, pp.9–10;T 4.8, p.10.)

Use:

- `countableEnvelope`: countable envelope of a small exact category.
- `countableEnvelope_isFlasque`: envelope is flasque, with the shift functor as witness.
- `FrobeniusPair.enlarge`: endofunctor F of Frobenius pairs.
- `FrobeniusPair.enlarge_generates`: enlarged derived category is c-compactly generated by the original.
- `FrobeniusPair.suspension`: suspension endofunctor S.
- `FrobeniusPair.setup`: identity, F and S satisfy the three conditions of the model set-up.
- `FrobeniusPair.IK`: Spectrification of the suspension prespectrum with envelope structure maps.

**Checks.**

- For the zero exact category the countable envelope and suspension are zero.
- In the envelope of finite-dimensional k-spaces, the countable-sum functor T satisfies `k⊕T(k)≅T(k)`; finite-dimensional k-spaces alone cannot admit that swindle.
- The enlargement has `IK₀=0` by additivity of `id⊕T≅T`, while the original k-model has `K₀=ℤ`.
- The composite `M→FM→SM` has zero derived image; the quotient SM still retains the connecting map, rather than being identified with FM.

*Needs:* §11.1; §10.1; `CategoryTheory.Idempotents.Karoubi`.

### 11.6 The set-up: negative K-groups of a triangulated category with models

Define a model setup as a category of models with a derived triangulated-category functor, endofunctors F,S, and natural transformations `id→F→S`. An exact sequence of triangulated categories has zero composite, fully faithful first map, and a cofinal induced Verdier quotient map. Require F and S to preserve these sequences, `K₀(D(FM)^♮)=0`, and `M→FM→SM` to be exact. Put `IK₀(M)=K₀(D(M)^♮)` and `IK_{−n}(M)=IK₀(SⁿM)`. Verify the preceding Frobenius envelopes satisfy these axioms.

Cofinal means fully faithful with every target object a summand of an image object. Idempotent completion and its triangulated structure are supplied; this target adds the K-theoretic setup.

(Schlichting 2003, D 1.1, Facts 1.2, Set-up 1.3 and D 1.4, pp.4–5;§5.5, p.11.)

Use:

- `IsExactSequence`: An exact sequence of small triangulated categories, with the cofinality condition.
- `IK0`: zeroth invariant, the K-group of the idempotent completion.
- `NegativeKSetup`: category of models with F, S and the three conditions.
- `negativeIK`: negative groups of a model.
- `negativeIK_frobenius`: instance at Frobenius pairs.
- `IK0_eq_K0_of_idempotentComplete`: `IK₀=K₀` for idempotent-complete exact categories.

**Checks.**

- For the exact category of finite-dimensional k-spaces, `IK₀` is `ℤ` with `[k]=1`, since it is idempotent complete.
- For the zero model all suspension iterates have zero group.
- For the identity sequence T `--id→ T→0`, exactness gives the expected identity and zero maps.
- The inclusion of the even-Euler-characteristic subcategory of Dᵇ(k) is cofinal but not essentially surjective: `k[0]` is a summand of `k[0]⊕k[0]` but is not itself an even-Euler object.

*Needs:* §11.5; `CategoryTheory.Idempotents.Karoubi`; §11.4.

### 11.7 Negative localization

For an exact sequence of setup models, construct the boundary by lifting a class through the flasque enlargement, and prove independence of the lift. Obtain the exact nonpositive sequence through `IK₀` and all negative groups. A cofinal derived functor induces isomorphisms on these groups. Relate vanishing of `IK₋₁(M)` to idempotent completeness of the quotient between idempotent-completed derived categories in every exact sequence beginning at M, using the object-lifting obstruction in the first boundary.

The named targets are `negativeIK_localization` with the hypotheses and conclusions above.

The Verdier quotient comparison need only be cofinal. Localization applies to exact model sequences, not arbitrary triangulated functors.

(Schlichting 2003, L 1.6, T 1.7, C 1.8 and Remark 1.9, pp.5–6;§5.5, p.11.)

*Needs:* §11.6; §11.5.

### 11.8 Additivity and filtered colimits for the negative groups

For a conflation `F₀↣F₁↠F₂` of model maps, prove `(F₁)_*=(F₀)_*+(F₂)_*` on every `IK_j`, `j≤0`. The componentwise inflation and its quotient must again be model maps. Prove filtered continuity in these degrees: compare the colimit of the flasque envelopes with an envelope of the colimit and use the swindle and localization to identify the groups. Apply this to exact-category models with compatible induced structures.

The named targets are `negativeIK_additivity`, `negativeIK_filteredColimit` with the hypotheses and conclusions above.

The indexing category is small filtered. A mere natural transformation has no additivity conclusion without the conflation hypotheses.

(Schlichting 2003, T 6.1, C 6.2, L 6.3 and C 6.4, pp.13–14.)

*Needs:* §11.7.

### 11.9 The weak inflation replacement of an exact functor

For an exact map F of Frobenius pairs inducing a derived equivalence, form the category of triples `(a,b,i:F(a)↣b)`. A conflation is detected on a, b and coker i. Restrict to weak inflations i to obtain the replacement C, with the `C₀`. Prove it is a Frobenius pair. The section `a↦(a,F(a),id)` and the a-projection induce inverse connective K-equivalences, by additivity applied to the triple and its weak quotient.

F preserves projective-injectives and both subpairs. The weak-inflation restriction is part of the model; the full inflation category alone is not this replacement.

(Schlichting 2003, P 11.15 proof, pp.22–23/PDF22–23.)

Use:

- `FrobeniusReplacement`: Objects `(a,i:F(a)↣b)` with i weak.
- `FrobeniusReplacement.exactStructure`: Conflations on `a,b,coker(i)`.
- `FrobeniusReplacement.toSource`: Projection to a.
- `FrobeniusReplacement.toTarget`: Projection to b.
- `FrobeniusReplacement.sourceKEquiv`: source embedding and retraction induce inverse K-equivalences.

**Checks.**

- For `F=id`, `a↦(a,id)` retracts onto a.
- `(0,0↣I)` is allowed for projective-injective I and is weakly zero.
- For `F=id` on bounded complexes over k, `0↣k[0]` has nonzero derived cokernel and is excluded.

*Needs:* §11.1; §11.2; §4.1; Layer 1.

### 11.10 Strictify the roof diagram for dual approximation

Prove replacement projection `C→B` reflects weak equivalences and satisfies dual approximation. For `c=(a,b,i)` and a map `b′→b`, represent its derived lift using the equivalence of derived categories, replace its roof by an admissible deflation, and pull back to obtain `c₃↠c` with a weak map `b′→pr_B(c₃)` over b. Check exactness and the weak condition after the pullback. The construction supplies the actual diagram required by App2, beyond fullness in the Verdier quotient.

The named targets are `FrobeniusReplacement.dual_approximation` with the hypotheses and conclusions above.

Use the exact pair map of §11.9 and factorization in both orientations; an abstract triangulated equivalence does not supply these data.

(Schlichting 2003, P 11.15, diagram11.16 and the pullback proof, p.23/PDF23;Thomason–Trobaugh, 1.9.8.3–1.9.8.4, pp.272–274/PDF14–15.)

*Needs:* §11.9; §11.2; Layer 1.

### 11.11 Derived invariance through the replacement and approximation

Apply factorization-based approximation to the target projection of the replacement, in the opposite category when using the dual form. Combine it with the source projection equivalence to prove `K(A)≃K(B)` for a pair map with derived equivalence. Envelope functoriality and countably compact generation preserve that hypothesis after each suspension, giving a stable equivalence `IK(A)≃IK(B)`.

The named targets are `IK_derivedEquivalence` with the hypotheses and conclusions above.

F is an exact pair map preserving projective-injectives and inducing a derived equivalence.

(Schlichting 2003, P 11.15, pp.22–23;T 4.8, p.10.)

*Needs:* §11.10; §6.12; §11.5.

### 11.12 Cofinality of Frobenius models

For an exact pair map inducing a fully faithful cofinal derived functor, identify its source with the target objects whose `K₀` classes lie in the source image, using dense triangulated classification. Apply factorization cofinality to prove an isomorphism on `π_jK` for `j≥1` and an injection on `π₀K`. The missing `π₀` classes form the explicitly retained quotient; completing idempotents is not claimed to preserve connective `K₀`.

The named targets are `FrobeniusPair.cofinality` with the hypotheses and conclusions above.

Cofinality is summand density and full faithfulness in the derived quotient. Use §11.4 and the factorization cofinality targets of Layer 6.

(Schlichting 2003, P 11.17, pp.23–24;Facts1.2, p.4;Appendix A.4, p.25.)

*Needs:* §11.11; §11.4; §6.17.

### 11.13 Fibration for nested Frobenius weak classes

For `D₀⊂D₁` thick triangulated subcategories of the stable category of B, let `B_i` be their inverse-image exact subcategories. The two nested weak-equivalence classes give `K(B₁,B₀)→K(B,B₀)→K(B,B₁)` as a homotopy-fibre sequence. Check extension, saturation and acyclic factorization through the stable triangulated conditions, then apply the factorization fibration theorem with its chosen nullhomotopy.

The named targets are `FrobeniusPair.nestedWeak_fibration` with the hypotheses and conclusions above.

The `D_i` contain zero and are closed under summands as well as triangles. B and `B_i` satisfy the Frobenius-pair conditions.

(Schlichting 2003, P 11.18, p.24/PDF24;Appendix A.3, p.25.)

*Needs:* §11.2; §6.14.

### 11.14 The completion comparison and the homotopy groups of IK

Inside the envelope FA retain objects killed in `D(SA)`, producing a completion pair Â. Prove `D(Â)≃D(A)^♮` by countably compact generation. The nested weak fibration and envelope swindle give `K(Â)≃ΩK(SA)`. These completed levels form an `Ω`-spectrum stably equivalent to the uncompleted suspension prespectrum. Compute `π_jIK(A)=π_jK(A)` for j>0, `π₀IK(A)=K₀(D(A)^♮)`, and `π_{−n}IK(A)=K₀(D(SⁿA)^♮)` for `n≥1`.

The named targets are `FrobeniusPair.completion_equivalence`, `IK_pi` with the hypotheses and conclusions above.

The stable comparison is a spectrum comparison; the degree-zero completion can change `K₀`. Use §11.5, §11.12 and §11.13.

(Schlichting 2003, T 11.7 proof, pp.21–22/PDF21–22.)

*Needs:* §11.12; §11.13; §11.5.

### 11.15 Localization of the Frobenius IK spectra in all degrees

An exact sequence of Frobenius pairs induces a homotopy-fibre sequence of their IK spectra. Apply the nested weak fibration at the completed envelope levels, and use model cofinality to compare the actual third pair with the quotient model. On the `Ω`-spectrum levels this identifies the fibre, including its specified nullhomotopy. Deduce the integer-graded localization sequence with the completion-corrected degree-zero term.

The named targets are `IK_localization` with the hypotheses and conclusions above.

Exactness means fully faithful derived first map and cofinal Verdier quotient map. All pair maps preserve projective-injectives. Saturation is inherited from derived isomorphisms.

(Schlichting 2003, T 11.10 proof, p.22/PDF22, and saturation qualification.)

*Needs:* §11.14; §11.13; §11.12; Layer 1.

### 11.16 Exact-category spectra and invariance

For the IK spectrum of §11.5, identify its envelope structure maps with those from localization. The preceding completed-level equivalence computes its groups; spectrum localization supplies exactness; and a derived equivalence induced by a pair map supplies stable invariance. For exact categories use their bounded-complex Frobenius model with the acyclic subpair. Its positive groups recover Quillen K, while its degree zero is `K₀` of the idempotent-completed derived category.

The named targets are `IK_exactCategory_comparison` with the hypotheses and conclusions above.

For every essentially small exact E, use split-complex Frobenius structures, `ℤ`-indexed complexes and §6.19's `gilletWaldhausen_general`, with its intrinsic homotopy-acyclic weak class and split-cofibration comparison. The acyclic subpair contains projective-injectives and has the closure properties proved in §11.1; no idempotent completeness of E is assumed.

(Schlichting 2003, D 11.1 and 11.4, L 11.3, pp.20–21;T 11.7, p.21;T 11.10 and §11.13, pp.21–22;P 11.15, p.22.)

*Needs:* §11.5; §11.7; §10.10; §11.11; §11.14; §11.15; §6.19 (`gilletWaldhausen_general`).

### Examples

The identity Frobenius pair has zero derived quotient. The even-Euler subcategory of Dᵇ(k) is dense with quotient class group `ℤ/2`. Its inclusion is not an equivalence, illustrating the cofinality condition used by completion.

### Dependencies

Layers 1, 4–6 and 10; supplied Frobenius stable categories, Verdier localization and idempotent completion.

## Layer 12: Karoubi filtrations, finite domination and comparison

### 12.1 Karoubi’s direct filtration in the discrete additive case

For a strictly full additive `A⊂U`, define a direct A-filtration as directed split decompositions `X=A_i⊕X_i` for each `X∈U`. Every map from an A-object into X factors through some `A_i`, and every map from X into an A-object factors through its projection to some `A_i`. Require compatibility with finite direct sums and refinement of both types of factorization simultaneously. Maps factoring through A form a two-sided additive ideal; construct U/A with the same objects and Hom groups modulo this ideal.

Use discrete exact factorizations and closure under finite direct sums. U/A is an additive ideal quotient.

(Karoubi 1970, §1 D 1.5,P 1.7–1.9,L 1.11,PDF9–21.)

Use:

- `KaroubiFiltration`: Actual split directed decompositions and the F1–F4 conditions.
- `KaroubiFiltration.finiteIdeal`: Morphisms factoring through an A-object.
- `KaroubiFiltration.quotient`: Same objects and quotient Hom groups.
- `KaroubiFiltration.zeroObjects`: Zero quotient objects are precisely the A-summand class.

**Checks.**

- For `A=U` the quotient is zero; `id_X` factors through the A-object X.
- For `A=0` the factorization ideal is zero and `U/A=U`.
- In row-and-column-finite sequence matrices, the projection to the first n coordinates splits and every map to or from a finite sequence factors through a sufficiently long truncation.
- A column-finite matrix with a nonzero entry in every column of its first row has no finite truncation through which that row map factors; it is excluded by row finiteness.

*Needs:* §11.1; `CategoryTheory.Idempotents.Karoubi`.

### 12.2 The finite-defect index and the cone boundary

For the completed quotient functor `U^♮→(U/A)^♮`, identify its relative triple group with `K₀(A^♮)`. A quotient automorphism gives an index in that group by lifting its matrix to a split decomposition and comparing its finite defect summands. The relative-triple five-term sequence becomes `K₁ᶜˡ(U)→K₁ᶜˡ(U/A)→K₀(A^♮)→K₀(U^♮)→K₀((U/A)^♮)`. For a flasque U, additivity annihilates its absolute `K₀` and `K₁ᶜˡ`, making the index boundary an isomorphism.

The named targets are `KaroubiFiltration.finiteDefectIndex`, `KaroubiFiltration.relativeK0Equiv` with the hypotheses and conclusions above.

Use the classical stabilized additive-category automorphism `K₁` and relative triples of Layer 4. This argument does not require the later relative ring `π₁` adapter. Without these completions `A=U` would yield `K₀(A)`, which can be smaller than `K₀(A^♮)`.

(Karoubi 1970, §2 T 2.13 proof,P 2.16,PDF36–40;§3 swindle and boundary,PDF50–51.)

**Checks.**

- For `A=U` the completed quotient is zero and the relative group is `K₀(A^♮)`.
- Finite free modules over `k×k` have `K₀=ℤ` with diagonal image in `K₀(A^♮)=ℤ²`; (1,0) is outside that image.
- For `A=0` the relative completed quotient is the identity and its relative group is zero.

*Needs:* §12.1; §4.17; §10.1.

### 12.3 Karoubi’s derived groups from a flasque cone

Construct controlled additive cone CA: objects are countable sequences using finitely many A-object types; morphisms are finite sums of permutant matrices in the discrete version of the source. Establish closure under composition, its additive structure, and a shift swindle. Finite sequences give a directly filtered copy of A. Define `SA=CA/A` and `Kar_{−n}(A)=K₀((SⁿA)^♮)`, with the source’s completion convention at each iteration. The cone index yields natural localization boundaries for direct filtrations.

A is small additive. Use controlled matrix morphisms and degree-zero idempotent completion.

(Karoubi 1970, §1 example3/Thm1.6,PDF11–13;§3 Thm3.2/3.10,Def3.11,Props3.12–14,Thms3.21/3.23,PDF41–57.)

Use:

- `KaroubiCone`: Finite-type countable sequences and the controlled matrix Hom groups.
- `KaroubiCone.swindle`: repeated-sequence functor and natural `id⊕T≅T`.
- `KaroubiSuspension`: direct-filtered quotient CA/A.
- `KaroubiNegative`: K0 of the idempotent completion of each iterated suspension.
- `KaroubiNegative.boundary`: Natural direct-filtration localization boundaries.

**Checks.**

- An old finite sequence becomes zero in the suspension.
- Adding the initial column to `ℕ×ℕ` is absorbed by a bijection.
- Arbitrary column-finite matrices without the source’s row/control condition are not silently admitted as morphisms.

*Needs:* §12.1; §12.2.

### 12.4 Compare Karoubi’s negative groups with Bass contractions

For `A=P(R)`, identify the cone-derived groups `Kar_{−n}(A)` with `LⁿK₀(R)`. Use the discrete norm to identify the source’s summable polynomial series with finite central polynomials, verify the four negative axioms for the cone theory, and invoke cone uniqueness. Prove compatibility with polynomial and Laurent chart maps and their boundaries. The source’s positive superscript `Kⁿ` denotes the present degree `−n`.

The named targets are `KaroubiNegative_eq_Bass` with the hypotheses and conclusions above.

For `n≥0`. The comparison is algebraic and in nonpositive degrees; no topological Bott periodicity is asserted.

(Karoubi 1971, §II.2.1–2.7,pp.66–72;§III.3.2 and preceding construction,pp.73–74.)

*Needs:* §12.2; §12.3; §10.3; §10.4.

### 12.5 Finite domination of a chain complex

Define A-domination of a bounded U-complex V by a finite A-complex D, chain maps `f:V→D` and `g:D→V`, and a chain homotopy `gf≃id_V`. Record the finite support explicitly; shift it into nonnegative degrees for the matrix formula. The composite fg is a homotopy idempotent and must be rectified before interpreting it as an object of the idempotent completion.

`A→U` is fully faithful additive. HomologicalComplex and Homotopy supply the carriers; fg is only homotopy idempotent.

(Ranicki, §3 P 3.1 and relative P 3.2,pp118–123/PDF14–19.)

Use:

- `FiniteChainDomination`: finite A-complex D, chain maps f,g and homotopy `gf≃id`.
- `FiniteChainDomination.transport`: Transport along a chain homotopy equivalence.
- `FiniteChainDomination.fg`: fg is idempotent up to the induced homotopy.
- `FiniteChainDomination.sum`: Direct sums of the given finite dominations.

**Checks.**

- A finite A-complex has `f=g=id,h=0`.
- A contractible complex is dominated by the zero complex.
- A supplied homotopy `(fg)²≃fg` does not justify an idempotent-completion object (D,fg).

*Needs:* §12.1.

### 12.6 Turn finite domination into a finite idempotent complex

From a finite domination form the corrected idempotent p on `F=⊕D_i` using the alternating differential matrix with entries fg, `1−fg`, ±d and the higher `fh^kg` terms. Verify `p²=p` using the chain-homotopy equation, and construct a finite `A^♮`-complex homotopy equivalent to V in `U^♮`. Its class is `[F,p]−[D_odd]`. At an odd upper support bound the top projection is `1−p`; combining the complementary summands gives the same displayed Euler formula. Its image in `K₀(U^♮)` is the Euler class of V.

Use the source homotopy convention throughout. Correct fg to an actual p; shifting once negates Euler class.

For a ring element p put `topProjector n p=p` for even n and `1−p` for odd n; prove the even/odd evaluation and two-step parity formulas, and idempotence when `p²=p`. This arithmetic function does not turn a homotopy idempotent into an idempotent. For an abelian group put `twoTermEuler a b=a−b`; its API gives the zero-term formulas, sum compatibility and sign change on swapping degrees.

(Ranicki, P 3.1 full proof,pp118–122/PDF14–18;P 3.2,123/PDF19.)

Use:

- `FiniteDomination.idempotent`: actual finite block idempotent p on `⊕D_i`.
- `FiniteDomination.finiteModel`: truncated complex E in `A^♮` with the parity-dependent top idempotent.
- `FiniteDomination.modelEquivalence`: Chain homotopy equivalence `V≃E` in `U^♮`.
- `FiniteDomination.euler`: `[V]=[F,p]−[D_odd]`, including its image in `U^♮`.

**Checks.**

- If f,g split strictly and D has only degree0, `p=fg` is the usual projector.
- For identity domination the Euler class is the usual alternating sum of `D_i`.
- At top degree 1 with `p=1`, the complementary projector `1−p` is 0; using p would give 1.
- `topProjector 0 1=1`, `topProjector 1 1=0`, and `topProjector 2 0=0` over `ℤ` test both parity branches and the zero projector.
- The two-term Euler values in `ℤ` are `twoTermEuler 2 3=−1`, `twoTermEuler 0 1=−1`, `twoTermEuler 1 0=1`; the boundary index uses the opposite order.

*Needs:* §12.5.

### 12.7 Return from restricted completion

A bounded `A^♮`-complex is homotopy equivalent to a bounded A-complex exactly when its Euler class lies in `im(K₀A→K₀A^♮)`. Prove this by adding complementary elementary complexes and moving the last remaining summand to a single degree. For `A⊂U` put `H=(K₀A^♮→K₀U^♮)⁻¹(im K₀U)`. An A-dominated U-complex has a finite model over `A^H`, the full objects whose classes lie in H, after adjoining those objects to U. This is the restricted completion needed in the quotient fibre.

The named targets are `restrictedCompletion_eulerCriterion` with the hypotheses and conclusions above.

Take the image in `K₀(U^♮)`. The obstruction is membership in that image, not zero in the ambient group.

(Ranicki, P 2.1, pp.115–116;P 3.2, pp.122–123;Cárdenas–Pedersen, §5 and §7.4, pp.10–14, 20–21.)

**Checks.**

- A complex concentrated in degree zero at an A-object passes the image criterion.
- For `A=finite` free `(k×k)`-modules, the projective (k,0) has class (1,0), outside the diagonal image; it cannot return to an A-complex.
- A contractible two-term identity complex on (k,0) has Euler class zero and returns to the zero A-complex, despite its individual terms being outside A.

*Needs:* §12.6.

### 12.8 Lift a quotient complex through a Karoubi filtration

For a direct A-filtration of U, lift a bounded U/A-complex to a bounded U-complex up to isomorphism in the quotient. Lift finitely many differential representatives, factor their finitely many nonzero composites through a common A-summand, and enlarge the complex by contractible summands to correct `d²` to zero. Similarly, lift a quotient contraction after a common refinement. A bounded U-complex becomes contractible in U/A precisely when it is A-dominated.

The named targets are `KaroubiFiltration.liftComplex` with the hypotheses and conclusions above.

Use simultaneous source/target factorizations, with A additive and containing zero; arbitrary quotient lifts need not square to zero.

(Carlsson–Pedersen, P 4.7;proof of T 4.1, pp.751–752;Cárdenas–Pedersen, §7.2–7.5, pp.18–21.)

*Needs:* §12.1; §12.5.

### 12.9 Karoubi complex approximation

On bounded U-complexes take degreewise split inflations as cofibrations and chain-homotopy equivalences as ordinary weak equivalences. Enlarge weak equivalences to maps becoming homotopy equivalences over U/A. Corrected quotient lifting and the standard mapping cylinder prove approximation to `C(U/A)`. Its acyclic fibre is K-equivalent to `C(A^H)`, using finite domination and restricted completion. The same corrections identify the associated Verdier quotient after the restricted completion.

The named targets are `KaroubiFiltration.complex_approximation` with the hypotheses and conclusions above.

H is the preimage subgroup of §12.7. All complexes are bounded and all mapping-cylinder and quotient maps are explicit.

(Cárdenas–Pedersen, §§4–6 and §7.1–7.9, pp.9–24;Schlichting 2003, T 7.1, pp.14–15.)

*Needs:* §12.8; §12.7; §6.8; §6.3; §6.18.

### 12.10 Cone–Frobenius comparison

For small idempotent-complete additive A with its split exact structure, apply the bounded-complex Frobenius construction to `A→CA→SA`. The controlled filtration, corrected complex lifting and restricted-completion approximation prove this is an exact sequence of the needed pair models. The cone swindle and IK localization identify `IK_{−n}(A)≅K₀((SⁿA)^♮)`. For `A=P(R)`, the Karoubi–Bass comparison identifies these groups with Bass `K_{−n}(R)`, naturally and with the same cone boundary.

The named targets are `KaroubiNegative_eq_negativeIK` with the hypotheses and conclusions above.

At later suspensions retain the idempotent-completion convention. For non-idempotent-complete A the degree-zero term is completion-corrected.

For every associative unital ring R, set `F(R)=IK(P(R))`, using the bounded-complex Frobenius model of §11.16. Construct the natural spectrum map `bassToFrobenius R:Kᴮ(R)→F(R)`. Start with the connective comparison `η:K(R)→F(R)`. Apply §11.15 to the Frobenius models of Layer 9's projective-line and Laurent localization diagrams, with their exact tensor functors, to obtain natural Bass delooping equivalences `β_F:F≃ΛF`. Retain the section induced by the t-class in the first factor. Iteration gives compatible maps `ΛʳK→ΛʳF≃F`, with specified homotopies for the Λ-tower transitions. Their homotopy-colimit map is `bassToFrobenius`.

Prove `bassToFrobenius_equivalence`: this actual map is an equivalence in the supplied stable category. In nonnegative degrees identify its homotopy maps with the common connective comparison; in negative degrees identify them with the cone–Bass–Frobenius comparisons above. Use the all-integer homotopy-group criterion for equivalence. Prove `bassToFrobenius_compatibility`: naturality for all unital ring maps and commutation, with the chosen homotopies, with polynomial inclusions and evaluation, Laurent inclusions, the t-class sections, Λ transitions and cone/Frobenius suspension equivalences. For the localization diagrams used to construct these maps, compare the fibre/cofibre triangles including their nullhomotopies and boundaries; the normalization is `∂{[t],x}=x`, in particular `∂[t]=[R]`. This supplies spectrum diagrams, not only abstract group isomorphisms.

(Schlichting 2003, T 7.1 and proof, pp.14–15, for negative groups; §§11.7, 11.10 and 11.13, pp.21–22, for IK spectra, localization and the connective comparison; Weibel IV, D 10.1, T 10.2, C 10.3, D 10.4 and Variant 10.4.1, pp.IV.79–80, for the Λ tower and spectrum comparison; Cárdenas–Pedersen, §7.1–7.9, pp.18–24, for the cone comparison.)

**Checks.**

- For the zero ring, `bassToFrobenius` is an equivalence between zero spectra, with zero boundaries.
- For `R=ℤ`, both spectra have vanishing negative groups and the compared Laurent triangles send `[t]` to `+[ℤ]`; replacing t by t⁻¹ negates this boundary.
- For `R=k[ε]/ε²`, the class of `1+εt` in `NK₁(R)` is retained on both sides of the Laurent diagram. The equivalence supplies neither polynomial invariance nor vanishing of Nil terms.
- At the first Λ stage the newly exposed degree minus one maps by the cone–Frobenius comparison, while the connective stage has zero negative homotopy; passage to the tower is essential.

*Needs:* §12.9; §12.3; §12.4; §§10.10–10.11; §§11.14–11.16; §11.8; Layer 9's projective-line and Laurent diagrams; §7.4's exact tensor pairings; §1.7 and GeneralizedCohomology G2.6 for the supplied stable equivalence criterion and telescopes.

### 12.10a The unbounded derived category of an exact category

Construct `ExactStructure.unboundedDerivedCategory` for small exact E from the homotopy category of `ℤ`-indexed complexes. Let Ac be the closure under chain-homotopy equivalence of complexes with admissible cycle factorizations. Prove Ac is triangulated and that passing to its thick closure gives the same Verdier quotient; thickness of Ac itself requires a separate hypothesis, such as idempotent completeness of E. Form `D(E)=Hot(E)/Ac` with its triangulation and quotient universal property, using Mathlib's homotopy and Verdier localization carriers rather than its abelian `DerivedCategory` specialization.

Construct bounded-above, bounded-below and bounded versions with the same weak class. Prove full faithfulness of their comparison functors into D(E), compatibility with §11.1's bounded model, and the equivalence `D⁺(E)/Dᵇ(E)≃D(E)/D⁻(E)`. Supply the degreewise split Frobenius pairs `(Ch♯E,Ac♯E)`, for each of these four boundedness conventions, including their projective-injectives and quotient comparisons. These are the models used in the obstruction theorem.

(Keller, §11, L 11.3 and L 11.7, pp.14–15; Schlichting 2003, §5.3, p.11, and L 8.1 with C 8.2, p.15.)

**Checks.**

- For abelian E, admissible acyclicity is ordinary acyclicity; the quotient agrees with Mathlib's abelian derived category, with the stated universe choices.
- For a split exact category, D(E) agrees with Hot(E). A nonzero k concentrated in degree zero survives; a two-term identity complex is zero.
- For finite free `(k×k)`-modules and `e=(1,0)`, the unbounded alternating e,1−e complex is contractible but its cycle modules are not free. Homotopy closure includes it, while raw admissible acyclicity does not.
- The bounded k-complex concentrated in degree zero embeds fully faithfully into the unbounded category; a complex with k in every degree and zero differential is not in the bounded image.

*Needs:* §11.1; §11.2; Tau Ceti `ExactStructure.homologicalComplex_split_isFrobenius`; Mathlib homotopy categories, triangulated object properties and Verdier localization.

### 12.11 Agreement and vanishing

Complete the natural comparison among the Bass, controlled-cone and Frobenius negative groups for rings, and between the cone and Frobenius groups for additive categories. For rings these are the negative homotopy maps of §12.10's `bassToFrobenius`, with its boundary and suspension compatibility. For a small exact E, use §12.10a's `ExactStructure.unboundedDerivedCategory` to present `IK₋₁(E)` as the direct-sum monoid of idempotents in D(E), modulo those that split; prove `IK₋₁(E)=0` exactly when D(E) is idempotent complete. Prove `IK₋₁=0` for every small abelian category, and `IK_{−n}=0` for every `n≥1` for a small noetherian abelian category. Regular noetherian rings in the finite-global-dimension scope have zero negative groups. General abelian all-negative vanishing is false: Neeman gives an abelian category with nonzero `K₋₂`.

The named targets are `negativeK_comparisons`, `negativeIK_idempotentObstruction`, `negativeIK_abelian_vanishing` with the hypotheses and conclusions above.

The all-negative abelian claim requires every object noetherian. The unbounded derived model uses admissible acyclicity and actual idempotents; the 2003 conjecture is not assumed.

(Schlichting 2003, T 7.1 and proof, pp.14–15;Remark 7.2, p.15;L 8.1 and C 8.2, p.15;T 9.1, p.16;T 9.3, pp.16–17;Examples 9.5–9.6, p.17;Neeman, §§0,5, pp.1–2,20–21.)

*Needs:* §11.16; §11.8; §10.3; §10.13; §12.4; §12.10; §12.10a (`ExactStructure.unboundedDerivedCategory`).

### Examples

For ranks 2,3 in degrees 0,1, the Euler class is `2−3=−1`. At top degree 1, `p=1` gives complementary projector 0. An arbitrary column-finite first row cannot be absorbed by a finite truncation; the controlled matrix condition matters.

### Dependencies

Layers 1, 5–6 and 10–11; additive quotient ideals, chain homotopies and actual idempotents.

## Layer 13: Continuity and the limits of derived invariance

### 13.1 The nonunital extension of the Bass spectrum

Define `Kᴮ_nu(I)=fib(Kᴮ(ℤ⋉I)→Kᴮ(ℤ))`, functorially for nonunital homomorphisms. For unital I, the decomposition `(z,a)↦(z,z1+a)` identifies the augmentation with the first projection `ℤ×I→ℤ`, hence the fibre with Kᴮ(I). On nonpositive homotopy groups compare this spectrum definition with the early reduced Bass-contraction groups; split augmentation and finite-product compatibility identify them.

The fibre is a spectrum fibre and uses the canonical augmentation. I need not have an identity.

(Weibel I Exercise 1.10, p.I.5;IV.1.11.2, p.IV.9;IV.6.4, pp.IV.55–56;IV.10.4, p.IV.80. The product decomposition and split-fibre comparison are the calculations above.)

Use:

- `NonunitalBass`: fibre of `K^B` of the unitization augmentation.
- `NonunitalBass.map`: nonunital ring map induces the fibre map.
- `NonunitalBass.unitalEquiv`: For unital A, `K^B_nu(A)≃K^B(A)`.

**Checks.**

- `A=0` gives `fib(id:K^B(ℤ)→K^B(ℤ))`, hence zero spectrum.
- For `A=ℤ` the unitization is `ℤ×ℤ` and the fibre is the second `K^B(ℤ)`.
- For the corner `ℤ→M₂(ℤ)`, the second component sends `(z,c)` to diag(c,z), not diag(c,0); ignoring z breaks unitality.

*Needs:* §8.3; §8.1; §10.10; §10.11; §3.2; Layer 1; §10.3.

### 13.2 Nonunital idempotent extension

For an additive multiplicative `h:A→B` between unital rings, put `e=h(1)`. Under the unital fibre identifications, the map of nonunital Bass spectra agrees with the map induced by `P↦P⊗_A eB` on right finite projectives. Prove this at the connective projective-functor level using the unitization block decomposition, then at each Λ-stage by naturality. The earlier group-level corner adapter is thereby promoted to a spectrum comparison.

The named targets are `NonunitalBass.idempotentBaseChange_comparison` with the hypotheses and conclusions above.

h need not preserve one. Since `e²=e` and `h(a)e=eh(a)=h(a)`, eB is a unital left A-module and a finite projective right B-module.

(Weibel, Additive Functors II.2.8, p.II.12;IV.6.3.2 and finite-product property 6.4, pp.IV.55–56;the block tensor calculation in §3.5 and naturality of the Bass construction.)

*Needs:* §13.1; §10.6; §3.2.

### 13.3 Corner embeddings become identity under matrix Morita

For `n≥1` and the upper-left corner `h_n:M_nR→M_{n+1}R`, compose its idempotent-extension functor with the standard column-bimodule Morita functors. The composite identifies naturally with the same finite-projective R-module. Deduce that `Kᴮ_nu(h_n)` becomes id on Kᴮ(R), coherently for any number of corner steps. In unitization coordinates the map is ``(z,c)`↦`(z,diag(c,z))``; diag(c,0) is the nonunital corner map before that coordinate change.

The named targets are `NonunitalBass.corner_morita` with the hypotheses and conclusions above.

The matrix index is finite nonempty. Specify both maps and their Morita comparisons.

For the two-by-two integer test define `cornerUnitizationSecond z c=diag(c,z)`. Its API is additivity, multiplicativity on coordinatewise products and preservation of the pair (1,1). It tests the coordinate change in the general unitization map, not a unital structure on the original corner embedding.

**Checks.**

- `cornerUnitizationSecond 1 1=I₂`; using diag(c,0) would fail preservation of one.
- `cornerUnitizationSecond 1 0=diag(0,1)`, so the augmentation coordinate survives even at `c=0`.
- `cornerUnitizationSecond 0 1=diag(1,0)`, recovering the nonunital corner on the augmentation kernel.

(Weibel, Corollary II.2.7.1 and Example 2.7.2, p.II.12;Definition III.4.4, p.III.32;the unitization coordinate calculation above.)

*Needs:* §13.2; §10.6.

### 13.4 Filtered continuity and products

Extend the early connective finite-product and filtered-colimit comparisons to Kᴮ in every integer degree. Central polynomial and Laurent extensions commute with filtered colimits; finite direct sums and cokernels preserve them, so all Bass groups do too. The canonical spectrum maps are equivalences by their homotopy-group isomorphisms. Finite ring products give finite products of Kᴮ spectra. For the nonunital matrix union use §13.5; no assertion about infinite ring products follows.

The named targets are `bassSpectrum_filteredColimit`, `bassSpectrum_finiteProduct` with the hypotheses and conclusions above.

Ring diagrams and filtered indexing categories are small. Product cardinality is finite. Frobenius nonpositive continuity is already §11.8.

(Weibel, II.2, the paragraph after Example 2.1.3, p.69;IV.6.4, p.321;IV.6.4, the filtered-colimit clause, p.321;Schlichting 2003, L 6.3 and C 6.4, pp.13–14.)

*Needs:* §3.2; §2.6; §10.3; §10.11; §11.8; §10.6; `CategoryTheory.Limits.HasFilteredColimits`; §8.3; §8.1.

### 13.5 Filtered continuity of the nonunital Bass spectrum

For a small filtered nonunital-ring diagram `I_a`, prove `hocolim_a Kᴮ_nu(I_a)≃Kᴮ_nu(colim_a I_a)`. Unitization commutes with its filtered colimit; unital Kᴮ continuity and exactness of filtered spectrum colimits allow passage through the augmentation fibre. Apply this to the finite corner diagram, using its coherent Morita comparisons, to identify `Kᴮ_nu(M∞R)` with Kᴮ(R) under the actual corner inclusion.

The named targets are `NonunitalBass.filteredColimit` with the hypotheses and conclusions above.

Use finite-data descent at each Bass stage to establish unital continuity first. Transition maps may be noninjective and need not preserve an identity.

(Weibel IV, §6.4, pp.IV.55–56;§10.4, p.IV.80;augmentation-fibre argument.)

*Needs:* §13.1; §13.3; §10.3; §10.11; §3.2; Layer 1; §13.4.

### 13.6 Derived invariance needs an enhancement, not a triangulated equivalence

For DG perfect-module categories supplied by the DG roadmap, an exact DG model map inducing the derived perfect equivalence gives a K-equivalence when carried by its Waldhausen or Frobenius models. For a Morita bimodule equivalence use its derived tensor model and inverse; roof strictification or approximation provides the connective comparison and the pair-map theorem the nonconnective comparison. Record the enhancement and actual model functor as hypotheses. A bare equivalence of triangulated perfect categories does not supply these data.

The named targets are `IK_enhancedDerivedInvariance` with the hypotheses and conclusions above.

DGAInfinity Layers 5–7 supply perfect modules, Morita bimodules and DG quotients. Apply the bounded/exact model comparisons of Layers 6,11; general `stable-∞` K-theory is separate.

(Schlichting 2003, D 11.1 and P 11.15, pp.20, 22–23;Keller, L 11.7 and T 12.1, pp.15–16.)

*Needs:* §10.6; §11.16; §6.8; `ExactK0.mapEquiv`; `CategoryTheory.Functor.IsEquivalence`; DGAInfinity Layers 5–7.

### 13.7 Relative and transfer compatibility

Extend the ring-spectrum pairing through the Λ tower, checking its two central-variable suspension squares and sphere interchanges. This induces integer-graded products, fibre-module products for relative spectra, and graded commutativity for commutative rings. For a localization sequence prove `∂(y·x)=(−1)^deg(y)y·∂x` and `∂(x·y)=∂x·y` in the chosen right-module convention. Transfer compatibility follows from the natural tensor/restriction isomorphism; finite-resolution transfers require the same resolving hypotheses as Layer 7. The negative Laurent contraction section is multiplication by `[t]` first.

The named targets are `bassSpectrum_pairing`, `bassSpectrum_relativePairing`, `bassSpectrum_transfer_projectionFormula` with the hypotheses and conclusions above.

Relative products require a compatible biexact square. Boundaries have signed module linearity; no fibre-product derivation law is asserted. Retain connective units and coherence.

(Weibel, V.3.12 (Projection Formula 3.12), p.395;IV.8.11 (Products), p.342.)

*Needs:* §7.4; §7.5; §10.10; §9.17; §7.7; §8.1.

### 13.8 Two Artin module models with equivalent triangulated stable categories

For an odd prime p, give the finite-module categories over `ℤ/p²` and `𝔽_p[ε]/ε²` their Frobenius exact structures. Their projective-injectives are the finite free modules. The stable quotient kills those and retains the simple modules; both stable categories are equivalent to finite-dimensional `𝔽_p` vector spaces, with suspension isomorphic to the identity and the induced split triangulated structure. Inflations and stable isomorphisms give the Waldhausen models.

Objects are finitely generated modules over these Artin rings. Use the stable Frobenius quotient and triangulation; p is odd as in the cited comparison.

(Schlichting 2002, §§0.2–0.3,1.1–1.4,pp.112–113.)

Use:

- `ArtinStableModel`: Finite modules with monic cofibrations and stable-isomorphism weak equivalences.
- `ArtinStableModel.projectiveInjective`: free modules are the projective-injective objects.
- `ArtinStableModel.simpleEquivalence`: Stable `category≃finite𝔽_p` vector spaces.
- `ArtinStableModel.suspension`: Multiplication by p or `ε` identifies suspension with identity.

**Checks.**

- At `p=3` the rings are `ℤ/9` and `𝔽₃[ε]/ε²`. Their free modules have zero stable class, whereas the simple `𝔽₃` has nonzero stable identity.
- The sequence `0→𝔽_p→R→𝔽_p→0`, with the first map multiplication by p or `ε`, identifies suspension of the simple with itself. It is not a split module sequence.
- The zero module represents zero in both stable categories, and adding a free summand leaves a stable object unchanged.
- A bare triangulated equivalence between these models cannot be promoted to a K-equivalence merely from its action on simple objects; for `p>3`, §13.10 gives different `K₄` p-primary groups.

*Needs:* §11.1; §11.2.

### 13.8a Topological inputs for the finite-field calculation

Construct `finiteField_adamsInput` on GeneralizedCohomology G5.4's represented complex KU and its connected rank-zero space BU. Use its Bott class β and comparison `Ω∞KU≃ℤ×BU`. Construct exterior-power operations from the finite bundle models, their splitting principle and Newton-polynomial Adams operations, and extend them to represented KU on CW spaces. Construct based H-maps `ψᵏ:BU→BU`, k≥1, with their addition and composition homotopies; prove `ψᵏ` acts by `kⁱ` on the Bott generator of `π₂ᵢBU=ℤ`, while `π₂ᵢ₋₁BU=0`, i≥1. Retain GeneralizedCohomology G3.4's Milnor exact sequence on countable CW telescopes, including its `lim¹ KU⁻¹` term in degree zero.

Construct `finiteGroup_KU_completion` for every finite group G: the complex representation ring, its augmentation ideal I and the associated-bundle map induce `Rℂ(G)^∧_I≃KU⁰(BG)`, with `KU¹(BG)=0`. Prove the finite-skeleton completion comparison and Adams compatibility. This is a proof input to stabilizing Brauer lifts, not an assumption that an arbitrary infinite CW K-class is determined by finite-stage restrictions.

(Weibel II, §4.4, P 4.4 and Example 4.4.1, pp.93–94; IV, §1.12, pp.268–269; Atiyah, Characters and cohomology of finite groups, L 4.6, p.37, and T 7.2 with C 7.3, p.46.)

**Checks.**

- On S², `ψᵏ(β)=kβ`; on S⁴ the exterior Bott generator is multiplied by k².
- `ψ¹` is homotopic to the identity; `ψᵃψᵇ` is homotopic to `ψᵃᵇ`, with the same equality on both displayed sphere groups.
- For the trivial group, `KU⁰(BG)=ℤ` and `KU¹(BG)=0`. For `G=C₂`, the completion theorem applies to the infinite CW space `BC₂=ℝP∞`; a finite-CW-only theorem would not suffice.
- For S⁰, full KU⁰ is `ℤ²` and reduced KU⁰ is `ℤ`. Maps into BU alone do not retain the rank on the non-basepoint component.

*Needs:* GeneralizedCohomology G5.4 (represented KU, BU and Bott comparison), G3.4 (telescope Milnor sequence), and G2.4–G2.7; AlgebraicTopology Stages 2, 4 and 8; Mathlib finite-dimensional complex representations and exterior powers. Exterior-power, splitting-principle and finite-group completion comparisons are targets of this subsection.

### 13.8b The Brauer-lift comparison

For `q=p^ν`, p prime and ν≥1, and an embedding `F̄_pˣ→ℂˣ`, construct `finiteField_brauerLift` using the Brauer characters of the standard representation of `GL_n(F_q)` minus its trivial rank-n representation. Build these as virtual complex representation classes and then KU-classes on `BGL_n(F_q)`. Assemble the compatible maps to BU on the stabilization telescope. The preceding finite-group completion theorem gives `KU¹(BGL_n(F_q))=0`, eliminating its Milnor `lim¹` ambiguity. Prove Frobenius invariance `ψ^qρ≃ρ`, with its homotopy, from Adams compatibility of the Brauer characters and the same telescope comparison.

Construct the resulting map `BGL(F_q)→fib(ψ^q−1:BU→BU)` together with its homotopies. Prove it induces an isomorphism on homology with `𝔽_ℓ` coefficients for every prime ℓ: supply Quillen's finite-GL cohomology calculation for ℓ≠p and the stable defining-characteristic vanishing for ℓ=p. Prove rational acyclicity and deduce the integral homology comparison. The fibre is an H-space; prove the acyclic-map recognition for this map, construct its descent homotopies to plus, and use §§1.5 and 3.12 to obtain a homotopy equivalence from the plus/Q model.

(Quillen 1972, §§2–11 and T 8; Weibel IV, T 1.8, p.IV.6, T 1.12, p.IV.10, P 5.7 and Example 5.8, p.315 in the combined book.)

**Checks.**

- For `GL₁(F₂)=1` the rank-zero standard-minus-trivial class is zero; for `GL₁(F₃)=C₂` it is the nontrivial character minus the trivial character.
- Restricting from rank n+1 to n adds a trivial line in both terms, so their difference is unchanged.
- On `π₂BU=ℤ`, `ψ^q−1` is multiplication by q−1; its fibre has `π₁=ℤ/(q−1)`. On `π₄BU`, multiplication is q²−1; replacing it by q−1 would give the wrong K₃.
- At the defining prime p, qⁱ−1 is prime to p for every i≥1, consistently with the stable mod-p homology vanishing; the other-prime computation alone does not supply this case.

*Needs:* §13.8a; §3.12; §1.5; §1.2; AlgebraicTopology Stage 5 for the Serre spectral sequence and coefficient comparisons. Brauer characters, their virtual complex lifts and Quillen's finite-GL homology comparisons are targets of this subsection.

### 13.8c Finite-field groups and degree-four vanishing

Prove `finiteFieldKGroups`: for a finite field `F_q`, rank identifies `K₀(F_q)=ℤ`, and for every i≥1 the ordinary groups of §3.2 satisfy `K₂ᵢ(F_q)=0` and `K₂ᵢ₋₁(F_q)≃ℤ/(qⁱ−1)`. Use the constructed Brauer homotopy equivalence and the fibre homotopy sequence, with `ψ^q−1` acting on `π₂ᵢBU` by qⁱ−1. In particular prove `finiteField_K4_vanishing` and retain `K₃(F_q)≃ℤ/(q²−1)` as the inputs to §13.9. The Q- and S-constructions alone do not compute these groups.

(Quillen, On the cohomology and K-theory of the general linear groups over a finite field, T 8; Weibel IV, T 1.12 and C 1.13, p.IV.10.)

**Checks.**

- `K₄(F₂)=0`, while `K₃(F₂)=ℤ/3` is nonzero.
- `K₁(F₄)=ℤ/3` agrees with the unit group, while `K₄(F₄)=0`.
- `K₃(F₅)=ℤ/24` has no 5-primary part, and `K₄(F₅)=0`, as needed for the p=5 Artin example.

*Needs:* §13.8b; §13.8a; §3.2; §3.12; §1.2.

### 13.9 The K-theory fibration for each Artin stable module model

Compare the isomorphism and stable weak-equivalence classes on the finite-module model. Write `i:P(R)→M(R)` for the projective inclusion and `d:M(𝔽_p)→M(R)` for dévissage. Factorization fibration, dévissage and the projective acyclic fibre give `K(R) --c_R→ K(𝔽_p)→K(mM(R))`, where `c_R=K(d)⁻¹∘K(i)` with a chosen homotopy inverse. Its homotopy sequence and `finiteField_K4_vanishing` identify `K₄(mM(R))` with `ker(π₃c_R)`. The Cartan map c_R has degree-zero map ×2; it is not K of the residue-ring homomorphism. Retain this map, its inverse-choice comparison and the composite nullhomotopy in the named fibration.

The named targets are `ArtinStableModel.kTheory_fibration` with the hypotheses and conclusions above.

Use the opposite factorization apparatus when needed. The symbol mM specifies the category with stable weak equivalences, rather than the stable quotient as a bare category.

(Schlichting 2002, §§1.5–1.6,pp.113–114.)

**Checks.**

- In both rings R, a rank-one free module has two simple factors, so `K₀(c_R)(1)=2` and `K₀(mM(R))=ℤ/2`.
- Scalar extension along `R→𝔽_p` instead sends the free generator to 1; using it as the first map would give the wrong cokernel.
- At `p=5`, `K₃(𝔽₅)=ℤ/24` has no 5-primary part, so the kernel has the full 5-primary part of K₃(R), irrespective of the prime-to-5 part of the Cartan map.

*Needs:* §13.8; §6.14; §4.8; §13.8c (`finiteFieldKGroups`, `finiteField_K4_vanishing`).

### 13.9a The two finite-ring K₃ inputs

For primes `p>3`, prove `ArtinStableModel.k3_pPrimary`: the p-primary subgroup of `K₃(ℤ/p²)` is `ℤ/p²`, while that of `K₃(𝔽_p[ε]/ε²)` is `(ℤ/p)²`. Construct the specialized finite-ring homology/plus comparisons used by the Evens–Friedlander and Aisbett–Lluis-Puebla–Snaith computations, and identify their K₃ with §3.2 through §3.12. No calculation at p=3 is included in this target.

(Schlichting 2002, §1.6, p.114, using Evens–Friedlander 1982 and Aisbett–Lluis-Puebla–Snaith 1985; Dugger–Shipley, Remark 4.9, pp.155–156, for the restriction p>3.)

**Checks.**

- At p=5 the first p-primary group has an element of order 25.
- At p=5 the second p-primary group is killed by 5, so it has no element of order 25.
- The stable-module comparison at p=3 in §13.8 remains in scope, but this numerical K₃ target cannot be instantiated at p=3.

*Needs:* §3.12; §3.2; §1.5; AlgebraicTopology Stages 2, 5 and 8 for group homology, spectral sequences and Hurewicz comparisons. The specialized finite-ring homology calculations are targets here.

### 13.10 A triangulated-invariance counterexample

For primes `p>3`, apply §13.9's Cartan-kernel identification and §13.9a's `ArtinStableModel.k3_pPrimary`. The p-primary part of `K₄(mM(ℤ/p²))` is cyclic of order `p²`, whereas that of `K₄(mM(𝔽_p[ε]/ε²))` is `(ℤ/p)²`. Thus the model K-theories are inequivalent despite the triangulated equivalence of their stable categories. At `p=5` the first group has an element of order 25 and the second p-primary group is killed by 5, so the abstract groups already distinguish them.

The named targets are `ArtinStableModel.noninvariance` with the hypotheses and conclusions above.

Use the p>3 finite-ring `K₃` calculations and the Cartan map; no general Artin-ring `K₃` calculation is asserted.

(Schlichting 2002, §§1.6–1.7,p.114;§2.1–2.2,pp.114–115; Dugger–Shipley, Remark 4.9, pp.155–156.)

**Checks.**

- At p=5 an element of order 25 survives on the `ℤ/25` side.
- At p=5 the dual-number p-primary group has exponent 5.
- At p=3, §13.8 still gives the triangulated equivalence, but the p>3 K₄ distinction supplies no conclusion.

*Needs:* §13.9; §13.9a; §13.8.

### Examples

For the corner map, `(z,c)` maps to `(z,diag(c,z))` after unitization. For `p=5`, `ℤ/25` and `𝔽₅[ε]/ε²` have equivalent triangulated stable categories, but their `K₄` p-primary groups are respectively cyclic of order 25 and `(ℤ/5)²`.

### Dependencies

Layers 3, 7–8 and 10–12; the DGAInfinity perfect-model and enhanced Morita supplier contracts.

## Downstream consumers

The following outbound interfaces retain the names used throughout this roadmap. Supplied aliases use the same carriers; comparison targets retain the indicated maps and homotopies.

| Interface here | Supplied construction and comparison | Additional targets owned here |
| --- | --- | --- |
| §1.1, `classifyingSpace` and its map/homotopy API | StableHomotopyKTheory §§1.1, 1.7–1.16: the same realized nerve, projections, opposite reversal and filtered homotopy maps. | `classifyingSpace_finitePosetDetection` is not stated there and remains local. |
| §1.2, `HomotopyFibre` | GeneralizedCohomology G2.10's `MappingPathFiber`; StableHomotopyKTheory §§2.4–2.11's boundary and comma/fibre maps on that carrier. | Incoming-path reversal, its sign, projection and K-group compatibility. |
| §1.3, `bisimplicialRealization` | StableHomotopyKTheory §§2.17–2.25 and 2.28: `BisimplicialSet.realization`, `BisimplicialSet.diagonalRealizationIso` and the proper connected fibre comparisons. | `edgewiseSubdivision`, `edgewiseSubdivision_homeomorph` and `isomorphismDoubleNerve` are not stated there and remain local. |
| §1.4, `QuillenA`, `QuillenA_dual`, `QuillenB`, `QuillenB_dual` | StableHomotopyKTheory §§2.31–2.35: `quillenTheoremA`, `quillenTheoremB` and their dual/prefibred forms, with path-reversal and projection homotopies. | Q-theory applications of these supplied criteria. |
| §1.5, `PlusConstruction` and its π₁/local-homology/map/lift API | StableHomotopyKTheory §§3.3–3.13 and 3.25–3.27: `IsPlusConstruction`, `plus_exists`, `IsPlusConstruction.lift`, `IsPlusConstruction.unique`, `IsPlusConstruction.map` and `plusFunctorialModel`, compared under X. | The ring plus/Q comparison of §3.12. |
| §1.6, `MonoidalLocalization` and its action/π₀/cofinality/fibration API | StableHomotopyKTheory §§4.3–4.12 and 4.19–4.21: `SInvS`, `MonoidalActionCategory.loc`, `SInvS.pi0Equiv`, `quillenGroupCompletion`, `SInvS.fibration`, `cofinality_action` and `cofinality`, preserving `[a]−[b]` and the chosen x₀. | Comparisons with the Q-extension fibres. |
| §§3.3–3.4 and 3.13, `StableGL`, `stableElementary`, `finiteGLBlockSum`, `cofinalFreeComparison` | AlgebraicKTheory A0–A2 supplies the matrix and projective algebra; StableHomotopyKTheory §§4.14–4.15 and 4.20–4.21 supply `stableGeneralLinearGroup`, `stableElementaryGroup`, `projectiveFreeComplement` and `kSpace_projective_plus` with the same matrices and splitting maps. | Plus/Q and §3.14's classwise transpose normalization. AlgebraicKTheory A6 retains Milnor patching ownership. |
| §§5.1–5.2, `WaldhausenCategory`, `CategoryWithCofibrations`, `SConstruction` and `WaldhausenCategory.K0` | StableHomotopyKTheory §6.1: `ExactFunctor`, `S.obj`, `S.waldhausenStructure`, `S.face`, `S.degeneracy`, `S.oneEquiv` and `S.twoEquiv`, identified entrywise with the same quotient squares and latching cofibrations. | `IsSaturated`, `HasExtensionAxiom`, `CylinderFunctor` and `WaldhausenCategory.ofExact` on the supplied carriers are not stated there and remain local. |
| §§5.3–5.6, `SConstruction.natIso_homotopy`, `AdditivityFibre`, `AdditivityFibre.pushout_contraction`, `SConstruction.object_additivity` | StableHomotopyKTheory §§6.1–6.2 supply S and weak-map additivity; §§2.18 and 2.25 supply realization comparisons. | The object-S homotopy, explicit simplex-fibre section/contraction and object-S refinement are not stated there and remain local, with their comparison to supplied additivity. |
| §§5.7, 5.10–5.11, `WaldhausenCategory.KSpace`, `WaldhausenCategory.KGroup`, `WaldhausenCategory.iteratedS`, `WaldhausenCategory.additivity`, `relativeS`, `relativeS_delooping`, `iteratedS_spectrum` | StableHomotopyKTheory §§6.1–6.2: `WaldhausenCategory.kSpectrum`, `kSpectrum.pi0K0Equiv`, `WaldhausenCategory.kSpectrum.map`, `WaldhausenCategory.kSpectrum.sequentialComparison`, `WaldhausenCategory.kSpectrumLevelFibrant_isPositiveOmega` and `WaldhausenCategory.kSpectrum.isSemistable`. Preserve object loops, source/quotient, the relative-S extra degeneracy, the level-fibrant replacement map and positive structure maps. | Comparisons of the coproduct and functor-sequence operations and the cylinder consequences with the supplied maps. |
| §§5.8–5.9, `SConstruction.edgewiseQ` and `sEqualsQ` | The S carrier is supplied by StableHomotopyKTheory §6.1. | Exact-category edgewise S/Q diagrams and their natural realization equivalence remain local. |
| §1.7 and Layers 10–13, K-theory spectrum diagrams | GeneralizedCohomology G2–G3 supplies spectra and telescopes; StableHomotopyKTheory §§6.1–6.2 supply the iterated-S spectrum comparison. Its §7.9's `abelianTower.difference`, `abelianTower.limitKernel` and `abelianTower.limOneCokernel` retain DerivedModuleAlgebra §1.T.1 on main's tower algebra and the spectral Milnor maps. | K-theory-specific Bass/Frobenius diagrams and their stable comparisons; no new generic tower algebra. |

The consumer contract for GeometryOfNumbersAndQuadraticArithmetic supplies the ordinary Q/S and ring plus/Q interfaces, the natural spectrum equivalence `bassToFrobenius` of §12.10 with its polynomial, Laurent, suspension and boundary diagrams, and `finiteFieldKGroups`; its local ordinary aliases retain these contracts, while its hermitian adapters and applications have separate scope. The low-degree ring engines are AlgebraicKTheory's inputs through §§3.1, 3.3–3.4 and 8.4–8.6, with the inverse Milnor parameter and native K₀/K₁ comparisons specified here. Scheme and arithmetic K-theory use resolution, localization, transfers and the Fundamental Theorem. Consumers of perfect complexes use enhanced derived invariance with a model map. Stable homotopy and homological invariants can consume the spectrum pairing and exactness interface without identifying a bare triangulated category with its K-theory.

## References

In locators, T/P/D/C/E/L mean theorem/proposition/definition/corollary/exercise/lemma; numbers retain the source numbering. Page numbers prefixed I, II, III, IV or V refer to the author’s separately paginated chapter PDFs. Page numbers without a chapter prefix refer to the combined 2013 K-book, unless the reference explicitly identifies another paper or a preprint. Quillen and Waldhausen locators use the printed proceedings pages. A PDF-page locator is used for Karoubi’s scanned thesis, whose copy has several pagination systems.

- Weibel, [The K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), combined draft dated 29 August 2013; separately paginated chapters [I](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), [II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), [III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), [IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), [V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf).
- Quillen, [Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf), LNM 341 (1973), 85–147.
- Quillen, [On the cohomology and K-theory of the general linear groups over a finite field](https://annals.math.princeton.edu/1972/96-3/p07), Annals of Mathematics 96 (1972), 552–586.
- Atiyah, [Characters and cohomology of finite groups](https://www.numdam.org/item/PMIHES_1961__9__23_0/), Publications mathématiques de l’IHÉS 9 (1961), 23–64.
- Evens–Friedlander, On K∗(ℤ/p²ℤ) and related homology groups, Transactions of the AMS 270 (1982), 1–46; Aisbett–Lluis-Puebla–Snaith, On K∗(ℤ/n) and K∗(F_q[t]/(t²)), Memoirs of the AMS 57, no.329 (1985). The specialized inputs are those cited in Schlichting 2002, §1.6, with the p>3 scope of Dugger–Shipley, Remark 4.9.
- Waldhausen, [Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf), LNM 1126 (1985), 318–419.
- Bühler, [Exact categories](https://arxiv.org/pdf/0811.1480v2), version 2.
- May, [A concise course in algebraic topology](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), revised author PDF, Chapters 22 and 25.
- Thomason–Trobaugh, [Higher algebraic K-theory of schemes and of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf), Grothendieck Festschrift III (1990), 247–435.
- Thomason, [The classification of triangulated subcategories](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8FA43E2F659E004A21FE2F0652743CE8/S0010437X97000067a.pdf/div-class-title-the-classification-of-triangulated-subcategories-div.pdf), Compositio 105 (1997), 1–27.
- Schlichting 2003, [Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf), 16 June 2003 preprint; its numbering differs from the published article.
- Schlichting 2002, [A note on K-theory and triangulated categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlk.pdf), Inventiones 150, 111–116.
- Dugger–Shipley, [A curious example of two model categories and some associated differential graded algebras](https://www.math.uic.edu/~bshipley/dugger.shipley.curious.example.pdf), Algebraic & Geometric Topology 9 (2009), 135–166, Remark 4.9.
- Karoubi 1970, [Foncteurs dérivés et K-théorie](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf), LNM 136, 107–186.
- Karoubi 1971, [La périodicité de Bott en K-théorie générale](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf), Annales ENS 4, 63–95.
- Cárdenas–Pedersen, [On the Karoubi filtration of a category](https://archive.mpim-bonn.mpg.de/547/1/preprint_1995_16.pdf), MPIM preprint 1995-16; locators use this preprint.
- Carlsson–Pedersen, [Controlled algebra and the Novikov conjectures for K- and L-theory](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carlped.pdf), Topology 34 (1995), 731–758.
- Ranicki, [The algebraic theory of finiteness obstruction](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf), Math. Scand. 57 (1985), 105–126.
- Clausen–Mathew–Morrow, [K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/pdf/1803.10897v2), version 2; locators use its preprint pages.
- Neeman, [A counterexample to vanishing conjectures for negative K-theory](https://arxiv.org/pdf/2006.16536v2), version 2.
- Keller, [Derived categories and their uses](https://webusers.imj-prg.fr/~bernhard.keller/publ/dcu.pdf) (1996 author manuscript), Lemma 11.7 and Theorem 12.1, pp. 15–16.

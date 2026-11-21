<!--tauceti-status:v1 {"roadmap":"DiagrammaticCoherence","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"morphism syntax, congruences, quotients and interpretations for the braided, rigid, pivotal, braided-pivotal and ribbon rows","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"comparison maps for winding normalization, rigid morphism syntax, planar winding diagrams and the rigid coherence theorem","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"300929cd373dad96ab32a443936e53a9456267fd9d49736a28f1fa2eba323fce","roadmap":"DiagrammaticCoherence","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: DiagrammaticCoherence

This file documents the status of the DiagrammaticCoherence roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the algebraic floor has substantial content. The monoidal row has its tensor-signature syntax and presentations, and §0.3's Drinfeld compatibility is now complete, up to the equivalence of functor groupoids. The rigid row has object-level winding normalization but no morphism syntax. Nothing geometric exists, and no coherence theorem from Layers 2–8 has begun.

### Named results

- **Twist-preserving and pivotal-preserving braided functors are equivalent** — for braided rigid categories with compatible pivotal and balanced structures, the two functor categories, and their groupoids of natural isomorphisms, are equivalent compatibly with forgetting and with whiskering: [`braidedPivotalBalancedFunctorEquivOfEq`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Groupoid.html#TauCeti.braidedPivotalBalancedFunctorEquivOfEq), [`braidedPivotalBalancedFunctorCoreEquivOfEq`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Groupoid.html#TauCeti.braidedPivotalBalancedFunctorCoreEquivOfEq). This is the §0.3 comparison Layer 7 consumes.
- **Functor-level Drinfeld compatibility** — a strong braided functor between rigid braided categories sends the Drinfeld isomorphism u_X to u_{F X} along the bidual comparison κ_X: [`map_drinfeldIso_hom_comp_mapDoubleRightDualIso_hom`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Basic.html#CategoryTheory.Functor.map_drinfeldIso_hom_comp_mapDoubleRightDualIso_hom).
- **Twist preservation is pivotal preservation** — for twists determined by pivotal structures, a braided functor is balanced exactly when it is pivotal: [`isBalanced_iff_isPivotal`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Balanced.html#CategoryTheory.Functor.isBalanced_iff_isPivotal).
- **Pivotal modifications shift the twist** — changing a pivotal structure by a monoidal automorphism u of the identity precomposes the induced twist with u, so the identity functor across such a change preserves either structure only when u = 1: [`balancedOfBraidedPivotal_smul_twist`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Torsor.html#TauCeti.balancedOfBraidedPivotal_smul_twist). This is the abstract form of the README's order-three check.
- **Normalization commutes with substitution** — replacing generators of a formal rigid object by arbitrary rigid objects and then normalizing agrees with substituting into the winding word: [`normalize_subst`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Diagram/RigidObject/Substitution.html#TauCeti.RigidObject.normalize_subst).

### Notable definitions and infrastructure

- **The bidual comparison** [`mapDoubleRightDualIso`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Rigid/Functor.html#CategoryTheory.Functor.mapDoubleRightDualIso), built by the roadmap's formula κ_X = δ_{X*} ≫ ((δ_X)*)⁻¹, natural and compatible with identities, composites and monoidal natural isomorphisms. It is the iterated-dual comparison the rigid and pivotal interpretations will use.
- **Winding words** [`WindingWord`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Diagram/RigidObject/Basic.html#TauCeti.WindingWord), the rigid boundary normal form of the conventions: ordered letters with integer dual levels, where duals reverse and shift by ±1 with no parity reduction. Formal [`RigidObject`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Diagram/RigidObject/Basic.html#TauCeti.RigidObject) expressions normalize onto all of them, and Mathlib's monoidal object expressions embed at level zero.
- **The free monoidal category on a tensor signature** (`TauCeti.TensorSignature.FreeMonoidal`) allows coupons of any arity, including nullary ones, with substitution, a lift into non-strict targets, and a presented quotient with the universal property for strong monoidal functors. Per the roadmap this presentation belongs to TemperleyLieb Layer 2 and is consumed here.

### Roadmap coverage

Layer 0 is partial. The monoidal row of §§0.1–0.2 is in place, and §0.3 is done, including the groupoid equivalence and its identity, composite and whiskering compatibilities. Missing: the morphism syntax, congruences, quotients and interpretations for the braided, rigid, pivotal, braided-pivotal and ribbon rows, and object syntax for all rows except rigid. Layer 4 is partial only in the narrowest sense: §4.1's object normalization to integer winding words exists combinatorially, without the categorical comparison maps, rigid morphism syntax, planar diagrams or the coherence theorem. Layers 1–3 and 5–8 are untouched: the source tree has no diagram, tangle or generic-position development for this roadmap.

## The frontier

- **Rigid comparison maps** — give the comparison isomorphisms from formal rigid expressions to their winding-word normal forms in a rigid category, compatible with evaluation, coevaluation, mates and substitution, as §4.1 asks; the combinatorial normal form is already in place.
- **Free braided category on a tensor signature** — braided expressions over `TensorSignature`, the §0.2 congruence and the universal property for strong braided functors. The rigid, pivotal, braided-pivotal and ribbon rows follow the same pattern with integer or ℤ/2 dual levels.
- **Finite progressive planar diagrams (§1.1)** — the first geometric carrier, with collared edges, coupons with ordered ports, stacking and juxtaposition. Every coherence endpoint needs it, and it depends on the relative geometric suppliers from GeometricTopology and KhovanovHomology.
- **Joyal–Street monoidal coherence (Layer 2)** — the free monoidal category exists; this needs the planar diagram category modulo relative isotopy and the proof that it is free, which in turn needs §§1.1–1.5.
- **Shum coherence and the Reshetikhin–Turaev functor (Layers 7–8)** — the summit, still far off. Its §0.3 input is now ready, but framed tangle geometry and the free ribbon category have not started.

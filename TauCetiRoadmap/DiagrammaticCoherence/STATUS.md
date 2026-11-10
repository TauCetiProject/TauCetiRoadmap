<!--tauceti-status:v1 {"roadmap":"DiagrammaticCoherence","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"syntax, congruences, quotients and interpretations for the braided, rigid, pivotal, braided-pivotal and ribbon rows; groupoid form of 0.3","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"23fdcd214a9bdce4fc9faed1ad217fb5e7d760037c3016e699856e80b64b481e","roadmap":"DiagrammaticCoherence","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: DiagrammaticCoherence

This file documents the status of the DiagrammaticCoherence roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the algebraic floor, Layer 0, has begun. The monoidal row has its tensor-signature syntax and presentation machinery, and the functor-level Drinfeld compatibility of §0.3 is proved. The other five rows have no syntax yet, and nothing geometric exists: no diagram categories, no generic-position presentations and no coherence theorem from Layers 1–8.

### Named results

- **Functor-level Drinfeld compatibility** — a strong braided functor between rigid braided categories sends the Drinfeld isomorphism u_X to u_{F X} along the bidual comparison κ_X: [`map_drinfeldIso_hom_comp_mapDoubleRightDualIso_hom`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Basic.html#CategoryTheory.Functor.map_drinfeldIso_hom_comp_mapDoubleRightDualIso_hom), with the inverse form [`map_drinfeldIso_inv`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Basic.html#CategoryTheory.Functor.map_drinfeldIso_inv).
- **Twist preservation is pivotal preservation** — for the twists determined by pivotal structures, a braided functor is balanced exactly when it is pivotal: [`isBalanced_iff_isPivotal`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Balanced.html#CategoryTheory.Functor.isBalanced_iff_isPivotal). The reverse statement, for pivotal structures induced by twists, is [`isPivotal_pivotalOfBalanced_iff`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Balanced.html#CategoryTheory.Functor.isPivotal_pivotalOfBalanced_iff).
- **Pivotality via the bidual comparison** — a monoidal functor is pivotal exactly when it carries the pivotal isomorphism to the target's pivotal isomorphism through κ: [`isPivotal_iff_map_pivotalIsoApp_hom_comp_mapDoubleRightDualIso_hom`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Pivotal/Functor/Basic.html#CategoryTheory.Functor.isPivotal_iff_map_pivotalIsoApp_hom_comp_mapDoubleRightDualIso_hom).

### Notable definitions and infrastructure

- **The bidual comparison** [`mapDoubleRightDualIso`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Rigid/Functor.html#CategoryTheory.Functor.mapDoubleRightDualIso) is defined by the roadmap's formula κ_X = δ_{X*} ≫ ((δ_X)*)⁻¹. It is natural ([`mapDoubleRightDualNatIso`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Rigid/Functor.html#CategoryTheory.Functor.mapDoubleRightDualNatIso)), compatible with identities and composites, and intertwined by monoidal natural isomorphisms. These are the iterated-dual comparisons that the rigid and pivotal interpretations will use.
- **Balanced functors** [`IsBalanced`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Braided/Balanced/Functor.html#CategoryTheory.Functor.IsBalanced) are braided functors that preserve the twist. They are closed under identities and composition and invariant under natural isomorphism. This is the preservation condition that ribbon interpretations in Layer 7 need.
- **The free monoidal category on a tensor signature** (`TauCeti.TensorSignature.FreeMonoidal`) allows arbitrary-arity coupons, including nullary ones. It comes with substitution and a lift into non-strict targets. Its presented quotient `TensorSignature.Presented` has the universal property for strong monoidal functors. Per the roadmap, this generic presentation belongs to TemperleyLieb Layer 2 and is consumed here.

### Roadmap coverage

Layer 0 is partial. The monoidal row of §§0.1–0.2 (signatures, substitution, congruence quotient, universal property) is in place. §0.3's Drinfeld equation and the twist/pivotal criterion are proved, along with their identity, composite and natural-isomorphism laws. Missing: the formal expressions, congruences, quotients and interpretations for the braided, rigid, pivotal, braided-pivotal and ribbon rows. Layers 1–8 are untouched: the source tree has no diagram, tangle, Morse-word or generic-family development for this roadmap.

## The frontier

- **Groupoid form of the twist/pivotal criterion** — §0.3 asks for an equivalence between the groupoids of twist-preserving and of pivotal-preserving braided functors. Today the result is an equivalence of predicates plus transport along isomorphisms. Packaging it as a groupoid equivalence is now routine.
- **Free braided category on a tensor signature** — the next row of §0.1: braided expressions over `TensorSignature`, the congruence of §0.2 and the universal property for strong braided functors. The rigid, pivotal, braided-pivotal and ribbon rows follow the same pattern with integer or ℤ/2 dual levels.
- **Finite progressive planar diagrams (§1.1)** — the first geometric carrier: collared edges, coupons with ordered ports, stacking and juxtaposition. It is a prerequisite for every coherence endpoint. It depends on the relative geometric suppliers from GeometricTopology and KhovanovHomology section G.
- **Joyal–Street monoidal coherence (Layer 2)** — the free monoidal category already exists. This needs the planar diagram category modulo relative isotopy and the comparison showing it is free, which in turn needs §§1.1–1.5.
- **Shum coherence and the Reshetikhin–Turaev functor (Layers 7–8)** — the summit. It is far off: it needs framed tangle geometry and the free ribbon category, neither of which has started.

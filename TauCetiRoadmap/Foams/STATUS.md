<!--tauceti-status:v1 {"roadmap":"Foams","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.8 transport, handle, graded version and Khovanov comparison; prefoams, labelling, linearization (0.2-0.7), 0.9 and 0.10","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"1f8c3401727dc432cec86309db2b3553193504d3eca97c640192ae89482bcf7e","roadmap":"Foams","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: Foams

This file documents the status of the Foams roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 has two finished pieces: the unlabelled closed webs of Section 0.1, and the Frobenius reconstruction at the heart of Section 0.8. Prefoams, labelling, linearization and the coefficient foundations have not begun, and neither have Layers 1–7.

### Named results

- **Frobenius reconstruction** — a perfect trace ε on a finite projective commutative algebra determines exactly one coalgebra structure with counit ε that satisfies the Frobenius law ([`existsUnique_frobeniusCoalgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#TauCeti.existsUnique_frobeniusCoalgebra)). This is the Section 0.8 acceptance test, proved over a commutative semiring, with projectivity in place of the freeness the roadmap asks for.

### Notable definitions and infrastructure

- **Unlabelled closed webs** ([`ClosedWeb`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Foam/ClosedWeb/Basic.html#TauCeti.ClosedWeb)) are finite oriented trivalent graphs with separate vertex-free circles. Edge ends are recorded individually, so loops count correctly, and the cyclic order at each vertex starts from the end of odd orientation. Isomorphisms, disjoint union, reversal and mirror reversal come with it. Every foam record of Layer 0 will have its boundary in this type, and planarity is left as a separate condition for Section 2.4.
- **The trace-reconstructed coalgebra** ([`LinearMap.frobeniusCoalgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.frobeniusCoalgebra)) makes comultiplication adjoint to multiplication under the trace pairing, with no choice of basis. This is the Δ that the Bar-Natan evaluation and the circle state spaces will use.
- **Trace-dual bases** ([`LinearMap.traceDualBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.traceDualBasis)) give the explicit formula Δ(a) = Σ bᵢ ⊗ bᵢ^∨·a for every finite basis. The handle element and the circle computations will be done in this form.

### Roadmap coverage

Layer 0 is partial. Section 0.1 is done, including the checks that separate the empty web from a single circle and count a loop's two ends. In Section 0.8, the trace-to-coalgebra correspondence and the dual-basis coproduct are done. Its transport operations, handle element, even-graded version and comparison with the chosen Khovanov coproduct remain. Sections 0.2–0.7 (prefoams with boundary, the prefoam categories, unoriented nilvalent prefoams, labelling, decorations and the gl(N) instances), 0.9 and 0.10 have not begun. Layers 1–7 are untouched: closed-foam evaluations, state spaces, semistrict monoidal 2-categories, the foam and Bar-Natan instances, spatial duality, the compiler and canopolis. The other two acceptance tests in Suggested.lean, graded freeness over Λ_N and the circle Schur basis, are unproved.

## The frontier

- **Prefoams with boundary (0.2–0.3)** — facets with genus and cyclic boundary words, seams with three sheet occurrences, and interior vertices with tetrahedral links, all over a `ClosedWeb` boundary. After that come gluing and the symmetric monoidal category PreFoam. The web records they need are now in place.
- **Labelled webs (0.5)** — labelling data and labelled closed webs satisfying the ordered a+b=c rule at each vertex. The merge/split roles they rely on are already recorded on `ClosedWeb`. Labelled prefoams have to wait for 0.2.
- **Finishing Section 0.8** — transport along trace-preserving isomorphisms, tensor products and scalar extension, the handle element, and degrees for even-supported algebras. After that, the check that the reconstructed coproduct on the dual numbers equals `TauCeti.Khovanov.coalgebra`, which KH1 needs.
- **Graded coefficient tensor (0.10)** — the balanced tensor over a graded base and its unsigned symmetric monoidal structure, built on the supplied `TauCeti.InternalGrading` interface. Layers 2 and 3 depend on it.
- **Integral graded freeness (2.8) and Layer 3** — the Suggested.lean statement about homogeneous bases of images of degree-zero idempotents over Λ_N is pure commutative algebra. The semistrict monoidal 2-categories of Layer 3 do not depend on the evaluations. Both can proceed in parallel with Layer 0.

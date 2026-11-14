<!--tauceti-status:v1 {"roadmap":"Foams","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.8 transport, handle and graded versions and the Khovanov comparison; webs, prefoams, labelling, linearization (0.1-0.7), 0.9 and 0.10","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"53bc35342e9bdb93bd64292fbf76e3bb52d077552b50977110edfbedc0e2f9cf","roadmap":"Foams","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: Foams

This file documents the status of the Foams roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. One algebraic headline from Layer 0, the reconstruction of a Frobenius coalgebra from a perfect trace, is proved. The combinatorial foam records, the evaluations, the state spaces and every higher-categorical layer have not been started.

### Named results

- **Frobenius reconstruction** — a perfect trace ε on a finite projective commutative algebra determines exactly one coalgebra structure with counit ε that satisfies the Frobenius law ([`existsUnique_frobeniusCoalgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#TauCeti.existsUnique_frobeniusCoalgebra)). This is the Section 0.8 acceptance test, proved over a commutative semiring with projectivity in place of the freeness the roadmap asks for.

### Notable definitions and infrastructure

- **The trace-reconstructed coalgebra** ([`LinearMap.frobeniusCoalgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.frobeniusCoalgebra)) makes the comultiplication adjoint to multiplication under the trace pairing, so no basis has to be chosen. This is the Δ that the Bar-Natan evaluation and the circle state spaces will use.
- **Trace-dual bases** ([`LinearMap.traceDualBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.traceDualBasis)) give the explicit formula Δ(a) = Σ bᵢ ⊗ bᵢ^∨·a, which [holds for every finite basis](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.frobeniusCoalgebra_comul_eq_sum). The handle element and the circle computations will be done in this form.

### Roadmap coverage

Layer 0 is partial. In Section 0.8, the trace-to-coalgebra correspondence and the dual-basis coproduct are done. The transport operations, the handle element, the even-graded version and the comparison with the chosen Khovanov coproduct remain. Sections 0.1–0.7, 0.9 and 0.10 (webs, prefoams, labelling, linearization, web presentations and the graded coefficient tensor) have not begun. Layers 1–7 are untouched: closed-foam evaluations, state spaces, semistrict monoidal 2-categories, the foam and Bar-Natan instances, spatial duality, the compiler and canopolis. The other two acceptance tests in Suggested.lean, graded freeness over Λ_N and the circle Schur basis, are unproved.

## The frontier

- **Finishing Section 0.8** — transport along trace-preserving isomorphisms, tensor products and scalar extension, the handle element, and the degree statements for even-supported algebras. Then check that the reconstructed coproduct on the dual numbers equals `TauCeti.Khovanov.coalgebra`, which KH1 needs.
- **Unlabelled webs and prefoams (0.1–0.3)** — the finite incidence records with boundary are the entry point for every foam construction. Nothing for them exists yet.
- **Graded coefficient tensor (0.10)** — the balanced tensor over a graded base and its unsigned symmetric monoidal structure, building on the supplied `TauCeti.InternalGrading` interface. Layers 2 and 3 depend on it.
- **Integral graded freeness (2.8)** — the Suggested.lean statement about homogeneous bases of degree-zero idempotent images over Λ_N. It is pure commutative algebra, so it can be done ahead of the foam carriers.
- **Reusable semistrict monoidal 2-categories (Layer 3)** — independent of the evaluations, so it can proceed in parallel with Layers 0–2.

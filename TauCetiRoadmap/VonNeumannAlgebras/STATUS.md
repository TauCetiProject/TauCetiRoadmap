<!--tauceti-status:v1 {"roadmap":"VonNeumannAlgebras","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"state space with weak-star compactness and Krein-Milman, Gelfand-Naimark faithful representation, separable l2 refinement","state":"partial"},{"id":"Layer 1","remaining":"ultraweak and ultrastrong wrappers and closures, Kaplansky density, weak compactness of the unit ball, counterexamples","state":"partial"},{"id":"Layer 2","remaining":"corners, tensor products, abelian classification; Borel calculus membership in generated algebras","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"group von Neumann algebras, integrated regular representation, crossed products and all later V8 targets","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"}],"readme_sha":"a70e7ac28fddf51f3011b27fcbb617e75cc61f21eda6f18c772b0ea0b4a1747b","roadmap":"VonNeumannAlgebras","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: VonNeumannAlgebras

This file documents the status of the VonNeumannAlgebras roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first summit, the bicommutant theorem, is proved for the weak and strong operator topologies. Layers 0, 1 and 2 are partial: Kaplansky density and the ultraweak and ultrastrong topologies are still missing from Layer 1. Layer 8 has only the translation action, and nothing from projection comparison onward (Layers 3–7 and 9–13) has begun.

### Named results

- **The bicommutant theorem** — a unital star subalgebra of operators on a Hilbert space equals its double commutant exactly when it is [weak operator closed](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.double_commutant_iff_isClosed_image_ofCLM), or equivalently [strong operator closed](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.double_commutant_iff_isClosed_image_toPointwiseConvergenceCLM).
- **Closures equal the double commutant** — the [weak](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.closure_image_ofCLM) and [strong](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.closure_image_toPointwiseConvergenceCLM) operator closures of a unital star subalgebra are both its double commutant. The same holds for the self-adjoint parts, which is the density input for Kaplansky.
- **The von Neumann density theorem** — every element of the double commutant is approximated by the algebra on any finitely many vectors at once. The proof amplifies to a finite Hilbert sum.
- **Weak limits of projections** — on an infinite-dimensional complex Hilbert space, the weak operator closure of the orthogonal projections is exactly the positive contractions, with no separability assumption (`closure_isStarProjection_eq_positive_contractions`).
- **Strong closedness of projections** — [a strong limit of orthogonal projections is a projection](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/StrongOperatorTopology.html#IsStarProjection.of_tendsto_pointwise), for arbitrary nets.

### Notable definitions and infrastructure

- **Strong versus weak operator topology.** The two topologies have the same continuous functionals, so convex sets have the same closure in both. [Commutants are weakly closed](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/WeakOperatorTopology.html#Set.isClosed_image_ofCLM_centralizer). Strong approximation results therefore identify weak closures directly.
- **The bounded Borel calculus of a representation of `C(K)`.** Such a representation extends to a unital star homomorphism on bounded Borel symbols, and its values commute with every operator that commutes with the representation. Its indicator values are the projections of a projection-valued measure. This is the core of V2.BorelCalculus.
- **GNS cyclic vector and uniqueness.** The class map is continuous and the unit's class is a cyclic vector that recovers the state. Every cyclic representation is unitarily equivalent to the GNS one, including in the nonunital case.

### Roadmap coverage

- **Layer 1 is partial.** The bicommutant and density theorems, the projection-closure theorems and the strong/weak dual comparison are done. Still missing:
  - the strong-star, ultraweak and ultrastrong wrappers, and the ultraweak and ultrastrong forms of the bicommutant theorem;
  - Kaplansky density (only its functional-calculus inputs exist);
  - weak compactness of the unit ball;
  - the counterexample suite.
- **Layer 0 is partial.** GNS recovery and unitary uniqueness are present. The norm-one state space with its compactness and Krein–Milman statements, the Gelfand–Naimark faithful representation and the separable ℓ² refinement were not found.
- **Layer 2 is partial.** The bounded Borel calculus is there; corners, tensor products and the abelian classification are not.
- **Layer 8 is partial only in a weak sense.** The strongly continuous left-regular translation action on `Lᵖ(G)` exists, but no group von Neumann algebra or crossed product does.
- **Layers 3–7 and 9–13 are untouched.** The C*-dynamical KMS states elsewhere in the library are not the modular V10.KMS target.

## The frontier

- **Kaplansky density** — prove that the unit ball of a unital star subalgebra is strongly dense in the unit ball of its double commutant (`closure_unitBall_eq_unitBall_double_centralizer`). The Kaplansky function and the closure of self-adjoint parts are already in place.
- **Ultraweak and ultrastrong topologies** — build these wrappers and their bounded-set agreement with the weak and strong topologies. They complete the bicommutant theorem's four closures and are the entry point to preduals and normality in Layer 4.
- **Norm boundedness of weakly convergent sequences** — the strong case is done. The weak case needs Banach–Steinhaus applied twice, through the matrix coefficients.
- **States and Gelfand–Naimark** — the Layer 0 state space, its weak-star compactness for unital algebras, and the faithful direct-sum representation.
- **The rest of the Borel calculus** — membership of Borel-calculus values in the generated von Neumann algebra, and the normal-operator case. These are needed before measurable fields and the multiplication models of Layer 4.

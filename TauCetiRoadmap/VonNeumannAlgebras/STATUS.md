<!--tauceti-status:v1 {"roadmap":"VonNeumannAlgebras","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10","ts":"2026-11-11T00:57:04Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"state separation, Gelfand-Naimark faithful representation, separable l2 refinement","state":"partial"},{"id":"Layer 1","remaining":"Kaplansky density, ultraweak and ultrastrong bicommutant closures, strong-star wrapper, converse unit-ball criterion, counterexamples","state":"partial"},{"id":"Layer 2","remaining":"corners, tensor products, abelian classification; Borel calculus membership in generated algebras","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"group von Neumann algebras, integrated regular representation, crossed products and all later V8 targets","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"}],"readme_sha":"e09a90ddb622a888f24402065d0435070819550a1e55db8857059420964b899b","roadmap":"VonNeumannAlgebras","to_sha":"e06d6728b2f32e212d12e96ddcd366c4445e9e10"}-->
# Status: VonNeumannAlgebras

This file documents the status of the VonNeumannAlgebras roadmap up until `e06d672` (2026-11-11T00:57:04Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The bicommutant theorem is proved for the weak and strong operator topologies, and the ultraweak and ultrastrong topologies now exist, but Layer 1 still lacks Kaplansky density and the ultraweak and ultrastrong bicommutant theorems. Layer 0 has states, Krein–Milman and GNS but not Gelfand–Naimark. Layers 2 and 8 are only begun, and nothing from type I algebras and preduals onward (Layers 3–7 and 9–13) has started.

### Named results

- **The bicommutant theorem** — a unital star subalgebra of operators on a Hilbert space equals its double commutant exactly when it is [weak operator closed](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.double_commutant_iff_isClosed_image_ofCLM), or equivalently [strong operator closed](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#StarSubalgebra.double_commutant_iff_isClosed_image_toPointwiseConvergenceCLM); both closures of such an algebra are its double commutant.
- **The von Neumann density theorem** — every element of the double commutant is approximated by the algebra on any finitely many vectors at once, by amplifying to a finite Hilbert sum.
- **Krein–Milman for states** — the state space of a unital C*-algebra is [weak-star compact](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/StateSpace.html#TauCeti.isCompact_stateSpace) and is [the closed convex hull of its pure states](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/StateSpace.html#TauCeti.closure_convexHull_extremePoints_stateSpace).
- **Weak operator compactness of the unit ball** — [closed balls of bounded operators are weak operator compact](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/WeakOperatorTopology/Compact.html#ContinuousLinearMapWOT.isCompact_image_ofCLM_closedBall), and so are [those of any von Neumann algebra](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#VonNeumannAlgebra.isCompact_image_ofCLM_inter_closedBall).
- **Weak limits of projections** — on an infinite-dimensional complex Hilbert space the weak operator closure of the orthogonal projections is exactly the positive contractions, with no separability assumption, while [strong limits of projections are projections](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/StrongOperatorTopology.html#IsStarProjection.of_tendsto_pointwise).

### Notable definitions and infrastructure

- **Ultraweak and ultrastrong topologies.** The [ultraweak](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UltraweakTopology.html#TauCeti.ContinuousLinearMapUltraweak) and [ultrastrong](https://taucetiproject.org/docs/TauCeti/Analysis/LocallyConvex/UltrastrongTopology.html#TauCeti.ContinuousLinearMapUltrastrong) topologies are built by ampliation to ℓ²(ℕ, H), as locally convex topologies with seminorm criteria. On norm-bounded sets they [agree with the weak operator topology](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UltraweakTopology.html#TauCeti.ContinuousLinearMapUltraweak.isInducing_restrict_toWOT) and with the strong one. This is the entry point to normality and preduals.
- **The lattice of von Neumann algebras.** Von Neumann algebras on H form a [complete lattice](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Lattice.html#VonNeumannAlgebra.instCompleteLattice) on which [the commutant is an order-reversing involution](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Lattice.html#VonNeumannAlgebra.commutantOrderIso). A generated algebra is the [weak operator closure](https://taucetiproject.org/docs/TauCeti/Analysis/VonNeumannAlgebra/Bicommutant.html#VonNeumannAlgebra.image_ofCLM_adjoin_eq_closure) of the generated star algebra.
- **The bounded Borel calculus of a representation of `C(K)`.** It extends such a representation to a unital star homomorphism on bounded Borel symbols. Its values commute with the representation's commutant, and its indicator values form a projection-valued measure. This is the core of V2.BorelCalculus.

### Roadmap coverage

- **Layer 1 is partial.** Done: the weak and strong bicommutant and density theorems, the projection-closure theorems, the ultraweak and ultrastrong wrappers with bounded-set agreement, weak compactness of the unit ball, and the lattice and commutant API. Missing: the strong-star wrapper, the ultraweak and ultrastrong closures in the bicommutant theorem, Kaplansky density (only its functional-calculus inputs exist), the converse unit-ball criterion, the characterisation of continuous functionals, and the counterexample suite.
- **Layer 0 is partial.** GNS recovery, unitary uniqueness and the state space with compactness and Krein–Milman are present. State separation, the Gelfand–Naimark faithful representation and the separable ℓ² refinement were not found.
- **Layers 2 and 8 are partial.** Layer 2 has the bounded Borel calculus but no corners, tensor products or abelian classification. Layer 8 has only the left-regular translation action on `Lᵖ(G)`, with no group von Neumann algebra or crossed product.
- **Layers 3–7 and 9–13 are untouched.** The C*-dynamical KMS states elsewhere in the library are not the modular V10.KMS target.

## The frontier

- **Kaplansky density** — prove that the unit ball of a unital star subalgebra is strongly dense in the unit ball of its double commutant (`closure_unitBall_eq_unitBall_double_centralizer`), with self-adjoint and positive forms. The Kaplansky function and the closure of self-adjoint parts are in place.
- **Ultraweak and ultrastrong bicommutant theorem** — apply the density theorem to the ampliation of the algebra on ℓ²(ℕ, H); the ampliation and both topologies now exist.
- **Ultraweakly continuous functionals** — characterise them as square-summable vector pairings, and separate them from the weak operator topology with the diagonal weights n⁻². This opens the predual of Layer 4.
- **Gelfand–Naimark** — prove state separation and build the faithful nondegenerate direct-sum representation from GNS (`exists_faithful_nondegenerate_representation`), then the separable ℓ² refinement.
- **The rest of the Borel calculus** — membership of its values in the generated von Neumann algebra, and the normal-operator case, before measurable fields and the multiplication models of Layer 4.

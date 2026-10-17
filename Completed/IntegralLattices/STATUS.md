<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"a0d1e9a9c488ec259476d1e5ad7010c634d3ef31","ts":"2026-10-09T18:16:04+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"a0d1e9a9c488ec259476d1e5ad7010c634d3ef31"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `a0d1e9a` (2026-10-09T18:16:04+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers of the completed integral-lattices roadmap are done, including the discriminant-form gluing theorem and the `D₈⁺ ≅ E₈` calculation. The later, broader quadratic-forms programme is partial: generator relations and Milgram's theorem remain open.

### Named results

- **The D₈⁺ ≅ E₈ isometry** — spinor glue enlarges the coordinate `D₈` lattice to one isometric to the `E₈` root lattice ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — even overlattices between `L` and `L^∨` correspond to quadratic-isotropic subgroups of `A_L` ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The orthogonal-quotient description of an overlattice** — the discriminant form of an even overlattice is `H⊥/H`, and the bilinear version also holds for integral overlattices that may be odd ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry), [`TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Bilinear.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry)).
- **The metabolic-overlattice criterion** — an even lattice has metabolic discriminant form exactly when it has an even unimodular overlattice ([`TauCeti.IntegralLattice.isMetabolic_discriminantQuadraticModule_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Metabolic.html#TauCeti.IntegralLattice.isMetabolic_discriminantQuadraticModule_iff)).
- **Smith decomposition of the discriminant group** — for every nondegenerate lattice, including indefinite ones, `A_L` has cyclic invariant factors read from a Gram matrix ([`TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) accommodates indefinite and degenerate integral forms in one bundled carrier; the radical quotient connects degenerate examples to duality.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) provides the common setting for discriminant forms, isotropic subgroups, and gluing.

### Roadmap coverage

Layers 1 through 3 and Layer 5 were already done: they provide the lattice and duality APIs, finite bilinear and quadratic modules, and the rank-one and ADE calculations. Layer 4 is now done too: the bilinear `H⊥/H` comparison for odd integral overlattices and the [componentwise orthogonal-sum comparison](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/OrthogonalSum.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantQuadraticOrthogonalQuotientIsometryOrthogonalSum) close its previously reported gaps.

## The frontier

- **Nikulin's generator relations** — the broader programme has a decomposition into finite quadratic-form generators, but still needs the relations among them for a classification.
- **Odd Gauss-sum values and Milgram's theorem** — compute the invariant on odd cyclic generators, then prove the signature congruence for even nondegenerate lattices.

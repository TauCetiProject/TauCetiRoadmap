<!--tauceti-status:v1 {"roadmap":"CStarAlgebras","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"C1.2 unitization, nonunital Gelfand duality and ideal theory, quasicentral approximate units, Pedersen ideal, strict topology and multiplier morphisms","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"4280de1d9690a75a7e6284342eabe6a7e46426cc03f9349ce831eb1d4d4a9471","roadmap":"CStarAlgebras","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: CStarAlgebras

This file documents the status of the CStarAlgebras roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening target of Layer 1 is complete: the matrix-order examples and the compression criterion (C1.1). The library already had some ideal, quotient and multiplier material that other roadmaps had built, and that covers parts of Layer 1. Representation theory, operator spaces, dilations, tensor products and the approximation layers (Layers 2–9) have not begun.

### Named results

- **The compression criterion.** For a positive element `T` and a star projection `p`, `pTp ≤ T` holds exactly when `p` commutes with `T` ([`IsStarProjection.conjugate_le_iff_commute`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Compression.html#IsStarProjection.conjugate_le_iff_commute)). It holds in nonunital C⋆-algebras, so it is more general than the unital statement the roadmap asks for.
- **Matrix order is semidefiniteness.** In the C⋆-algebra of square matrices, an element is positive exactly when it is positive semidefinite ([`CStarMatrix.nonneg_iff_posSemidef`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/MatrixOrder.html#CStarMatrix.nonneg_iff_posSemidef)). In size 2 this becomes [the trace and determinant test](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/PosSemidef/FinTwo.html#Matrix.IsHermitian.posSemidef_iff_trace_nonneg_and_det_nonneg).
- **Failure of monotonicity for positive parts and squares.** A diagonal matrix can dominate the flip without dominating its positive part, the averaging projection ([`flip_le_diagonal_not_posPart`](https://taucetiproject.org/docs/TauCeti/Examples/Analysis/CStarAlgebra/MatrixOrder.html#TauCeti.MatrixOrderExample.flip_le_diagonal_not_posPart)). A matrix can also dominate that projection while its square does not ([`averagingProjection_le_diagonal_not_sq`](https://taucetiproject.org/docs/TauCeti/Examples/Analysis/CStarAlgebra/MatrixOrder.html#TauCeti.MatrixOrderExample.averagingProjection_le_diagonal_not_sq)). Square roots, by contrast, [preserve the order](https://taucetiproject.org/docs/TauCeti/Examples/Analysis/CStarAlgebra/MatrixOrder.html#TauCeti.MatrixOrderExample.averagingProjection_le_sqrt_diagonal).

### Notable definitions and infrastructure

- **The zero-corner lemma.** For positive `a`, `b*ab = 0` exactly when `ab = 0` ([`TauCeti.star_mul_mul_eq_zero_iff_of_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Compression.html#TauCeti.star_mul_mul_eq_zero_iff_of_nonneg)). This is how a vanishing corner forces the off-diagonal blocks to vanish, and it is the step the compression criterion rests on.

### Roadmap coverage

Layer 1 is partial. C1.1 is done, with every parameter region and check in the roadmap proved. The library also has some of C1.3: closed two-sided ideals are self-adjoint and complex-linear, quotients by them are C⋆-algebras, and star homomorphisms have closed range. It also has a piece of C1.7: nondegenerate representations extend uniquely to the multiplier algebra. The rest of Layer 1 is absent: the left-action unitization (C1.2), nonunital Gelfand duality and the remaining ideal theory (C1.3), quasicentral approximate units and strict positivity (C1.4, C1.5), the Pedersen ideal and Calkin algebra (C1.6), the strict topology (C1.7) and the commutative multiplier morphisms. Layer 2 is untouched: the library has a state space and nondegenerate representations, but none of state extension, irreducible representations, primitive ideals or the bidual. Layers 3–9 are untouched.

## The frontier

- **The left-action unitization (C1.2).** Identify the unitization of a nonunital C⋆-algebra isometrically with `{λ·id + L_a}` acting on the algebra, and do the `C[0,1]` maximal-ideal example. It needs only Mathlib's unitization and the Neumann series.
- **Nonunital Gelfand duality and ideal theory (C1.3).** The nonunital adapter to `C₀(X)` is still to be built, along with ideal lattices, the isomorphism theorems and positive lifts through quotients. The existing results on closed ideals and quotients cover the foundations.
- **Quasicentral approximate units (C1.4).** Construct Arveson's quasicentral approximate unit for a closed ideal and prove that σ-unitality is equivalent to having a strictly positive element.
- **The strict topology on multipliers (C1.7).** Define the strict topology, prove the essential-ideal universal property, and compute `M(C₀(X)) = C_b(X)` and `M(K(H)) = B(H)`. Commutative multiplier morphisms (C1.CommutativeMultiplierMorphisms) wait on this.
- **Kadison transitivity (C2.2).** This opens Layer 2 and needs state extension (C2.1) first.

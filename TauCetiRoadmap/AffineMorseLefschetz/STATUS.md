<!--tauceti-status:v1 {"roadmap":"AffineMorseLefschetz","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: AffineMorseLefschetz

This file documents the status of the AffineMorseLefschetz roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** A1, the Levi calculus and the real index bounds, is done except for the maximum principle on compact submanifolds. A2 has the whole pointwise calculation of Milnor §7, but only for maps between vector spaces, and nothing global. A0 has begun with the projective zero locus and its Jacobian. The exhaustions (A3), duality and triangulation (A4), the Lefschetz theorems (A5) and the examples (A6) have not begun.

### Named results

- **The q-pseudoconvex index bound** — at a critical point of a strongly q-pseudoconvex function on a complex n-manifold, the intrinsic Morse index is at most n+q, so q=0 gives λ ≤ n for strictly plurisubharmonic functions ([`IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/LeviForm.html#TauCeti.IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le)).
- **Negative subspaces are totally real** — if B(v,v)+B(Jv,Jv) > 0 for every nonzero v, every negative-definite subspace W satisfies W∩JW=0 and so has dimension at most n ([`isTotallyReal_of_add_comp_posDef`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/TotallyReal/QuadraticForm.html#QuadraticForm.isTotallyReal_of_add_comp_posDef)).
- **The complex Hessian identity for squared distance** — along a holomorphic map i, the real Hessians of ‖i(x)−a‖² on v and on Jv sum to 4‖di(v)‖², so squared distance is strictly plurisubharmonic along an immersion ([`fderiv_fderiv_norm_sq_sub_comp_add_I_smul`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/SquaredDistance.html#TauCeti.fderiv_fderiv_norm_sq_sub_comp_add_I_smul)).
- **Paired principal curvatures** — for a holomorphic map, multiplication by J carries the κ-eigenspace of each shape operator onto the −κ-eigenspace, so κ and −κ have equal multiplicity ([`finrank_genEigenspace_shapeOperator_neg`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ShapeOperator.html#ContDiffAt.finrank_genEigenspace_shapeOperator_neg)).
- **Symmetric focal points** — for a holomorphic immersion, i(x)+ν and i(x)−ν are focal with the same multiplicity, the step Milnor uses to bound the index of squared distance by n ([`finrank_ker_fderiv_fderiv_norm_sq_sub_sub_comp`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ShapeOperator.html#ContDiffAt.finrank_ker_fderiv_fderiv_norm_sq_sub_sub_comp)).

### Notable definitions and infrastructure

- **The Levi form** ([`leviForm`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LeviForm.html#TauCeti.leviForm)) — the Hermitian form behind strict plurisubharmonicity and q-pseudoconvexity. It has sum, product, convex-composition and pullback laws, chart independence on manifolds, and fine C² openness, which A3 will need. Its matrix in a complex basis is now the matrix of mixed Wirtinger derivatives.
- **The shape operator** ([`shapeOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ShapeOperator.html#TauCeti.shapeOperator)) — the self-adjoint endomorphism dual to the second fundamental form in a normal direction. At a critical point the Hessian of squared distance is 2g((1−S)v,w), so the focal points of the embedding are exactly where that Hessian degenerates.
- **The projective zero locus** ([`complexProjectiveZeroLocus`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Projectivization/ZeroLocus.html#TauCeti.complexProjectiveZeroLocus)) — the set of lines in ℂᴺ killed by a polynomial family. It has chart equations by dehomogenization, ideal and power invariance, and linear pullback. Alongside it is a cone Jacobian whose rank is projectively invariant and agrees with the affine chart rank. This is the carrier on which A5 and A6 will be stated.

### Roadmap coverage

A1 is done except for the maximum principle for strictly plurisubharmonic restrictions to compact complex submanifolds, which is not in the library. A2 is partial. In flat coordinates it now has the J-identities for B, the shape operator with S_νJ=−JS_ν and S_(Jν)=JS_ν, paired curvatures with the zero eigenspace complex, symmetric focal multiplicities, and the squared-distance Hessian and Levi identities. None of this is on the GT Layer1 normal carrier, and properness, Morse genericity and the CW model of dimension ≤ n are absent. A0 is partial. It has the zero-locus set with its membership, chart, reindexing, intersection, power and linear-pullback lemmas, the cone Jacobian with Euler's identity, rank invariance and the bound of fewer equations than variables at full rank, and the topology on homogeneous coefficient spaces with continuous evaluation and Jacobian. Missing are the subtype topology and closedness in projective space, transport of K7.1's atlas, the incidence variety and its proper projection, the projective differential, and the induced submanifold at full rank. A3, A4, A5 and A6 are untouched.

## The frontier

- **Maximum principle on compact submanifolds (A1)** — show that no compact positive-dimensional complex submanifold carries a strictly plurisubharmonic restriction. A3's dimension bound and A5's component argument both use it.
- **Projective carrier topology (A0)** — make `complexProjectiveZeroLocus` a closed subtype of K7.1's projective space with the transported atlas, then build the incidence variety over the coefficient space, whose topology is already in place.
- **Smooth locus at full Jacobian rank (A0)** — from the existing rank lemmas, construct the induced complex submanifold of dimension N−1−|ι| and its tangent/normal sequence. This needs K7's holomorphic submanifold API.
- **Affine CW dimension ≤ n (A2)** — move the flat shape-operator and squared-distance results onto the GT Layer1 normal carrier and R6's intrinsic shape operator. Then combine properness, almost-everywhere Morse genericity and MorseTheory M1–M2.
- **Pseudoconvex exhaustion topology (A3)** — Morse-approximate a strongly q-pseudoconvex exhaustion using fine C² openness to get a CW model of dimension ≤ n+q. This depends on MorseTheory M3–M4.

<!--tauceti-status:v1 {"roadmap":"AffineMorseLefschetz","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: AffineMorseLefschetz

This file documents the status of the AffineMorseLefschetz roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** A1, the Levi calculus and the real index bounds, is essentially done. The one gap is the maximum principle on compact complex submanifolds. A2 has its pointwise identities in flat coordinates and nothing global yet. The projective carriers (A0), pseudoconvex exhaustions (A3), Borel–Moore duality and triangulation (A4), the Lefschetz theorems (A5) and the examples (A6) have not begun.

### Named results

- **The index bound λ ≤ n+q** — at a critical point of a strongly q-pseudoconvex function on ℂⁿ, the real Hessian has negative inertia at most n+q. It is proved by intersecting a complex positive subspace with a negative-definite real one ([`IsStronglyPseudoconvexAt.morseIndex_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Pseudoconvex.html#TauCeti.IsStronglyPseudoconvexAt.morseIndex_le)).
- **The manifold index bound** — the same bound holds on a complex manifold for the intrinsic Morse index, with q=0 giving λ ≤ n for strictly plurisubharmonic functions ([`IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/LeviForm.html#TauCeti.IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le)).
- **Negative subspaces are totally real** — if B(v,v)+B(Jv,Jv) > 0 for every nonzero v, then every negative-definite subspace W satisfies W∩JW=0, so its dimension is at most n ([`isTotallyReal_of_add_comp_posDef`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/TotallyReal/QuadraticForm.html#QuadraticForm.isTotallyReal_of_add_comp_posDef)).
- **Paired spectra under an anticommuting operator** — a symmetric operator that anticommutes with an invertible one has positive and negative spectral subspaces of equal dimension ([`finrank_positiveSpectralSubspace_eq_finrank_negativeSpectralSubspace_of_anticommute`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Spectrum.html#LinearMap.IsSymmetric.finrank_positiveSpectralSubspace_eq_finrank_negativeSpectralSubspace_of_anticommute)). The generalized eigenspaces for μ and −μ are identified as well, including the zero eigenspace, which has even dimension.
- **The complex Hessian identity for squared distance** — along a holomorphic map i, the real Hessians of ‖i(x)−a‖² on v and on Jv sum to 4‖di(v)‖². Hence squared distance is strictly plurisubharmonic wherever i is an immersion ([`fderiv_fderiv_norm_sq_sub_comp_add_I_smul`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/SquaredDistance.html#TauCeti.fderiv_fderiv_norm_sq_sub_comp_add_I_smul)).

### Notable definitions and infrastructure

- **The Levi form** ([`leviForm`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LeviForm.html#TauCeti.leviForm), with its manifold version [`manifoldLeviForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/LeviForm.html#TauCeti.manifoldLeviForm)) — the Hermitian form built from the real second derivative. It has sum, product, convex-composition and holomorphic-pullback rules, and it is chart-independent on manifolds. It is the single positivity notion behind strict plurisubharmonicity and q-pseudoconvexity.
- **Fine C² openness** — strong q-pseudoconvexity survives every C² perturbation below a continuous positive tolerance ([`exists_continuousOn_pos_forall_isStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Pseudoconvex.html#TauCeti.exists_continuousOn_pos_forall_isStronglyPseudoconvexAt)). There are uniform Levi lower bounds on compact sets as well. A3 needs this to Morse-approximate an exhaustion without losing positivity.
- **The second fundamental form of a map** ([`secondFundamentalForm`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.html#TauCeti.secondFundamentalForm)) — the normal part of D²i, defined for maps between inner product spaces. For holomorphic maps it satisfies B(Jv,w)=JB(v,w)=B(v,Jw) and B(Jv,Jw)=−B(v,w).

### Roadmap coverage

A1 is done except for the maximum principle for strictly plurisubharmonic restrictions to compact complex submanifolds, which does not appear in the library. Everything else in A1 has been proved: the Levi laws, the Wirtinger and critical-Hessian comparisons, the compact and fine-topology perturbation results, the λ ≤ n and λ ≤ n+q bounds compared with the manifold Morse index, the three acceptance examples with explicit inertia, and the anticommuting eigenspace pairing. A2 is partial. It has the J-identities for B, the critical-point normal test, and the squared-distance Hessian and Levi identities, all for maps of vector spaces rather than on the manifold normal-bundle carriers. The shape-operator identities, focal distances, properness and the CW model of dimension ≤ n are not there. A0, A3, A4, A5 and A6 are untouched.

## The frontier

- **Maximum principle on compact submanifolds (A1)** — show that a strictly plurisubharmonic function has no compact positive-dimensional complex submanifold in its domain. A3's dimension bound and A5's argument that A meets every component both need it.
- **Shape operators and paired focal distances (A2)** — derive S_νJ=−JS_ν and S_(Jν)=JS_ν from the existing B identities, then apply the anticommuting-spectrum theorem to get symmetric focal distances on each normal line. The input is the RiemannianGeometry R6 shape operator.
- **Affine CW dimension ≤ n (A2)** — move the squared-distance identities onto the GT Layer1 normal carrier, then combine properness, almost-every-point Morse genericity and MorseTheory M1–M2 to get a CW model with cells of index ≤ n.
- **Projective zero-locus carrier (A0)** — `complexProjectiveZeroLocus`, its incidence variety and the cone Jacobian, on K7.1's projective space. A5 and A6 cannot be stated without it.
- **Pseudoconvex exhaustion topology (A3)** — Morse-approximate a strongly q-pseudoconvex exhaustion with the fine-openness result above, then read off a CW dimension ≤ n+q and homology vanishing. MorseTheory M3–M4 has to supply this.

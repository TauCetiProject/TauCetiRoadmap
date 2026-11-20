<!--tauceti-status:v1 {"roadmap":"AffineMorseLefschetz","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the O(d_i)-valued projective differential and the proper holomorphic submersion over the full-rank parameter locus","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the CW homotopy model of dimension at most n; homology vanishing, freeness and the manifold shape operator are proved","state":"partial"},{"id":"Layer 3","remaining":"the CW model of dimension at most n+q and band Betti bounds; freeness and cohomology vanishing are proved","state":"partial"},{"id":"Layer 4","remaining":"compact-pair comparison with Borel-Moore homology, exhaustion-adapted refinement and noncompact duality","state":"partial"},{"id":"Layer 5","remaining":"root extension, the lifting theorem and finite semialgebraic triangulation; projective pair comparison","state":"partial"},{"id":"Layer 6","remaining":"discharge the good-neighbourhood hypothesis on X meet H, and generic transverse hyperplanes","state":"partial"},{"id":"Layer 7","remaining":"O(1) pullback to O(d), the affine examples and transport of weak Lefschetz through the Veronese embedding","state":"partial"}],"readme_sha":"c6bf1c50091a6a18b341fd2348d9f6fbcbecaf93d433ad1674994fffe493c218","roadmap":"AffineMorseLefschetz","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AffineMorseLefschetz

This file documents the status of the AffineMorseLefschetz roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Levi index bounds (Layer 1) are done. The Lefschetz hyperplane theorem is now proved in homotopy and homology, but it assumes a good neighbourhood of the hyperplane section, which the roadmap expects to come from triangulation. The affine homology bounds are proved. The CW homotopy models, finite semialgebraic triangulation and noncompact duality have not landed.

### Named results

- **The Lefschetz hyperplane theorem (Milnor, Theorem 7.4)** — let X ⊆ ℂℙⁿ be closed, with its part off a coordinate hyperplane H a holomorphically immersed complex d-manifold. If X∩H has a neighbourhood whose inclusion is a weak homotopy equivalence, then π_j(X, X∩H) = 0 for 1 ≤ j < d ([`subsingleton_relHomotopyGroup_notMem_affineOpen`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Projectivization/Lefschetz.html#TauCeti.subsingleton_relHomotopyGroup_notMem_affineOpen)). The homological form, with any abelian coefficients, is proved directly from cell attachments ([`isZero_singularHomology_notMem_affineOpen`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Projectivization/Lefschetz.html#TauCeti.isZero_singularHomology_notMem_affineOpen)).
- **The Andreotti–Frankel theorem, homologically** — a complex n-manifold with a proper holomorphic immersion into a finite-dimensional complex inner product space has Hₖ(M; R) = 0 for k > n ([`isZero_singularHomology_of_isProperMap_holomorphic_immersion`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/SublevelHomology.html#TauCeti.isZero_singularHomology_of_isProperMap_holomorphic_immersion)).
- **Topology of pseudoconvex exhaustions** — a smooth, proper, bounded-below, strongly q-pseudoconvex function, not assumed Morse, makes homology vanish above degree n+q. It also makes homology in degree n+q free ([`free_singularHomology_of_isProperMap_of_isManifoldStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/ExhaustionHomology.html#TauCeti.free_singularHomology_of_isProperMap_of_isManifoldStronglyPseudoconvexAt)) and cohomology vanish above n+q.
- **Compact submanifolds of pseudoconvex manifolds** — a compact complex submanifold of a manifold carrying a strongly q-pseudoconvex function has complex dimension at most q ([`finrank_le_of_isManifoldStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/MaximumPrinciple.html#TauCeti.finrank_le_of_isManifoldStronglyPseudoconvexAt)).
- **Milnor's focal-point formula (Lemma 6.5)** — on a manifold immersed in Euclidean space, the Morse index of squared distance at a critical point counts the focal points on the normal segment, with multiplicity ([`manifoldMorseIndex_norm_sq_sub_comp_eq_finsum_finrank_ker`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Immersion/ShapeOperator.html#TauCeti.manifoldMorseIndex_norm_sq_sub_comp_eq_finsum_finrank_ker)).

### Notable definitions and infrastructure

- **The smooth part of a projective zero locus** ([`isSmoothEmbedding_subtypeVal_complexProjectiveZeroLocus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Projectivization/ZeroLocus.html#TauCeti.isSmoothEmbedding_subtypeVal_complexProjectiveZeroLocus)) — where the cone Jacobian is surjective, the zero locus is an embedded complex submanifold of ℂℙⁿ. This is the carrier of the projective families, and its affine part is where the Lefschetz theorem applies.
- **Borel–Moore homology with local coefficients** ([`borelMooreHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Twisted/LocallyFinite/Basic.html#TauCeti.LocalCoefficientSystem.borelMooreHomology)) — built from locally finite chains, with its Milnor lim¹ sequence, naturality under enlarging the exhaustion, and degree-zero vanishing. It is the carrier for Layer 4's duality.
- **The manifold shape operator** ([`manifoldShapeOperator`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Immersion/ShapeOperator.html#TauCeti.manifoldShapeOperator)) — expresses the critical Hessian of squared distance intrinsically. For holomorphic immersions it pairs principal curvatures κ and −κ, which is what bounds the index.

### Roadmap coverage

**Done:** Layer 1.

**Partial, with only the CW models missing:**

- **Layer 2** lacks the CW model of dimension at most n.
- **Layer 3** lacks the CW model of dimension at most n+q and the band Betti bounds. Top-degree freeness and cohomology vanishing are now proved.

**Partial, with the main theorem proved under an extra hypothesis:**

- **Layer 6** has both the homotopy and homology Lefschetz theorems. They are proved for coordinate hyperplanes and assume a neighbourhood of X∩H whose inclusion is an equivalence. Discharging that hypothesis needs Layer 5.8, and generic transverse hyperplanes are absent.

**Partial, further from complete:**

- **Layer 0** has the incidence variety, the closed bad-rank locus and the open full-rank locus. It lacks the O(dᵢ)-valued differential and the proper holomorphic submersion family.
- **Layer 4** has locally finite chains, the Milnor sequence and NDR neighbourhoods. It lacks the compact-pair comparison and duality.
- **Layer 5** has CAD, the dimension theory, generic shears, simplex boundary extension and band homeomorphisms. It has no triangulation.
- **Layer 7** has the Veronese embedding and its binomial image. The O(d) pullback and Lefschetz transport are not yet there.

## The frontier

- **Unconditional weak Lefschetz (Layer 6)** — produce a neighbourhood of X∩H in X that retracts onto it, so the existing theorems lose their extra hypothesis. The roadmap's route goes through the triangulated projective pair of Layer 5.8.
- **Finite semialgebraic triangulation (Layer 5)** — the root-extension and lifting stages, then the face lists and pulling triangulation of Bochnak–Coste–Roy 9.2.1. Generic directions, boundary-height extension and band transfer now exist as inputs.
- **Closed-embedding and pseudoconvex CW bounds (Layers 2–3)** — assemble global CW models of dimension at most n and n+q from the per-level relative cell attachments. The Morse exhaustions and index bounds are already in place.
- **Compact-pair comparison and noncompact duality (Layer 4)** — prove Hⱼ(X,A) ≅ Hⱼᴮᴹ(X∖A), then orientation-twisted duality on noncompact manifolds. This is the roadmap's other route to Layer 6.
- **Proper submersion family and Veronese transport (Layers 0 and 7)** — build the holomorphic submersion over the full-rank parameter locus, and carry Lefschetz through the Veronese embedding to hypersurfaces of any degree.

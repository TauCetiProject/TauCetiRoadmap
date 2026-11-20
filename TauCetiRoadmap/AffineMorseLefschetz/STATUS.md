<!--tauceti-status:v1 {"roadmap":"AffineMorseLefschetz","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the O(d_i)-valued projective differential and the proper holomorphic submersion over the full-rank parameter locus","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the CW homotopy model of dimension at most n; homology vanishing is proved","state":"partial"},{"id":"Layer 3","remaining":"the CW model of dimension at most n+q, top-degree freeness, UCT cohomology vanishing and band Betti bounds","state":"partial"},{"id":"Layer 4","remaining":"open restriction, compact-pair comparison with Borel-Moore homology, exhaustion-adapted refinement and noncompact duality","state":"partial"},{"id":"Layer 5","remaining":"frontier preparation, the lifting theorem and finite semialgebraic triangulation; projective pair comparison","state":"partial"},{"id":"Layer 6","remaining":"relative homology vanishing below n and the relative homotopy version","state":"partial"},{"id":"Layer 7","remaining":"O(1) pullback to O(d), the affine examples and transport of weak Lefschetz through the Veronese embedding","state":"partial"}],"readme_sha":"f869a4fbfabf5712d07c17dc5f7aa86144244a33ebde515d1ff4d3cd98cc6f15","roadmap":"AffineMorseLefschetz","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: AffineMorseLefschetz

This file documents the status of the AffineMorseLefschetz roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Levi index bounds (Layer 1) are done. The homological content of the affine and pseudoconvex bounds (Layers 2–3) is proved, but the CW homotopy models the roadmap asks for are not. Every other layer has begun, and none is finished: the projective carriers, Borel–Moore homology, semialgebraic dimension, the hyperplane-section argument and the Veronese embedding all have pieces in place. The triangulation theorem, noncompact duality and weak Lefschetz itself are still to come.

### Named results

- **The Andreotti–Frankel theorem, homologically** — a complex n-manifold with a proper holomorphic immersion into a finite-dimensional complex inner product space has Hₖ(M; R) = 0 for k > n ([`isZero_singularHomology_of_isProperMap_holomorphic_immersion`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/SublevelHomology.html#TauCeti.isZero_singularHomology_of_isProperMap_holomorphic_immersion)).
- **Homology vanishing for pseudoconvex exhaustions** — a smooth, proper, bounded-below, everywhere strongly q-pseudoconvex function, not assumed Morse, forces homology to vanish above degree n+q ([`isZero_singularHomology_of_isProperMap_of_isManifoldStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/ExhaustionHomology.html#TauCeti.isZero_singularHomology_of_isProperMap_of_isManifoldStronglyPseudoconvexAt)).
- **The q-pseudoconvex index bound** — at a critical point of a strongly q-pseudoconvex function on a complex n-manifold, the Morse index is at most n+q ([`IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/LeviForm.html#TauCeti.IsManifoldStronglyPseudoconvexAt.manifoldMorseIndex_le)).
- **Compact submanifolds of pseudoconvex manifolds** — a compact complex submanifold of a manifold carrying a strongly q-pseudoconvex function has complex dimension at most q. This is the maximum-principle step that Layers 3 and 6 use ([`finrank_le_of_isManifoldStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/MaximumPrinciple.html#TauCeti.finrank_le_of_isManifoldStronglyPseudoconvexAt)).
- **The Tarski–Seidenberg theorem** — projecting a semialgebraic subset of ℝⁿ⁺¹ gives a semialgebraic set ([`instHasSemialgebraicProjectionsReal`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.instHasSemialgebraicProjectionsReal)).

### Notable definitions and infrastructure

- **Pseudoconvexity-preserving Morse approximation** ([`exists_isMorse_isProperMap_bddBelow_isManifoldStronglyPseudoconvexAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Pseudoconvex/Morse.html#TauCeti.exists_isMorse_isProperMap_bddBelow_isManifoldStronglyPseudoconvexAt)) — perturbs a pseudoconvex exhaustion within C⁰ distance 1 to a proper Morse exhaustion, keeping both strong q-pseudoconvexity and the index bound. Both homology theorems rest on it.
- **The smooth part of a projective zero locus** ([`isSmoothEmbedding_subtypeVal_complexProjectiveZeroLocus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Projectivization/ZeroLocus.html#TauCeti.isSmoothEmbedding_subtypeVal_complexProjectiveZeroLocus)) — where the cone Jacobian is surjective, the zero locus is an embedded complex submanifold of ℂℙⁿ of dimension n−|ι|, with slice charts and an exact tangent–normal sequence. Weak Lefschetz will be stated on this carrier.
- **Borel–Moore homology with local coefficients** ([`borelMooreHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Twisted/LocallyFinite/Basic.html#TauCeti.LocalCoefficientSystem.borelMooreHomology)) — built from locally finite twisted chains and identified with the inverse limit of relative chains over a compact exhaustion, which gives its Milnor lim¹ sequence. This is the carrier for Layer 4's noncompact duality.

### Roadmap coverage

**Done:** Layer 1, now that the compact-submanifold maximum principle has landed.

**Partial, with only the CW models missing:** Layers 2 and 3. The following are all proved:

- generic Morse squared distance with index ≤ n along holomorphic immersions;
- properness of squared distance on affine algebraic sets;
- relative and proper Morse approximation preserving q-pseudoconvexity;
- homology vanishing above n and n+q.

What is absent is the homotopy-equivalent CW complex of dimension ≤ n or ≤ n+q. Layer 3 also lacks top-degree freeness, UCT cohomology vanishing and band Betti bounds.

**Partial, further from complete:**

- **Layer 0** has the closed zero locus, the incidence variety with its proper projection, and the open full-rank parameter locus. It lacks the O(dᵢ)-valued projective differential and the proper holomorphic submersion family.
- **Layer 4** has locally finite chains, functoriality, subdivision homotopies, the Milnor sequence and simplicial NDR neighbourhoods. It lacks the compact-pair comparison and duality.
- **Layer 5** has CAD adapted to a semialgebraic set and the dimension API: unions, products, closure, projections and the fibre formula. It has no triangulation.
- **Layer 6** has the theorem that a hyperplane section meets every component, the reciprocal distance (1+ρ)⁻¹ extended by zero, and the index flip λ ↦ 2n−λ.
- **Layer 7** has the Veronese closed embedding and its binomial image.

## The frontier

- **Closed-embedding CW bound (Layer 2)** — upgrade the homology vanishing to a CW homotopy model with no cells above n. The generic Morse distance and the index bound are already in place, so what remains is assembling a global CW exhaustion from the per-level relative cell attachments.
- **Pseudoconvex CW bound and its consequences (Layer 3)** — the same upgrade to dimension n+q, followed by freeness of top homology, UCT cohomology vanishing and Betti bounds on each band.
- **Homological weak Lefschetz (Layer 6)** — prove Hⱼ(X, X∩H) = 0 for j < n when H contains the singular locus. One proof route needs Layer 4's compact-pair comparison. The reversed-exhaustion route needs the M2 handle attachments fixing A.
- **Compact-pair comparison and noncompact duality (Layer 4)** — prove Hⱼ(X,A) ≅ Hⱼᴮᴹ(X∖A) using the existing iterated simplicial neighbourhoods, then prove orientation-twisted duality for noncompact manifolds.
- **Finite semialgebraic triangulation (Layer 5)** — the generic-direction preparation, root extension and lifting stages leading to Bochnak–Coste–Roy 9.2.1. Only CAD existence and dimension theory exist so far.

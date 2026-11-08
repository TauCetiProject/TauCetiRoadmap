<!--tauceti-status:v1 {"roadmap":"BelyiMaps","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0","ts":"2026-10-28T00:12:20Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"1.6 label semantics in degrees 6 to 11","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the analytic genus reconciliation of 8.6","state":"partial"},{"id":"Layer 9","remaining":"local (e, f) data and the S3 agreement in 9.1, the lower bound of 9.3, and 9.4 to 9.8","state":"partial"},{"id":"Layer 10","remaining":"10.1 for rational functions and finite separable maps, and 10.4 to 10.8","state":"partial"},{"id":"Layer 11","remaining":"the conjugation action on isomorphism classes in 11.1, and 11.2 to 11.7","state":"partial"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","remaining":"orbit-size and field-of-definition certificates of 14.2, 14.3 to 14.5, and the full acceptance suite","state":"partial"}],"readme_sha":"a74b049f605382629e7b7bde131b3d0dbc33042f53affc86884eb97d5efa7e39","roadmap":"BelyiMaps","to_sha":"36f24f5d94ccf25e167520cf4c0f1a028c064fb0"}-->
# Status: BelyiMaps

This file documents the status of the BelyiMaps roadmap up until `36f24f5` (2026-10-28T00:12:20Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The topological and analytic classification of three-point covers is done: covers of `ℂ ∖ {0, 1}`, connected permutation triples, dessins, branched covers and analytic Belyi pairs classify one another. The arithmetic half of Belyi's theorem is done in its polynomial form for `ℚ̄`. The function-field comparison, the curve statement of Belyi's theorem, Galois conjugation and the LMFDB semantics are partial. The profinite layers (12 and 13) have not begun. The revised README now treats Layers 7 to 14 as specifications for three successor roadmaps. The assessments below measure the library against those specifications.

### Named results

- **Analytic Riemann existence for three-point covers** — isomorphism classes of analytic Belyi pairs of degree `n` correspond bijectively to connected degree-`n` covers of `ℂ ∖ {0, 1}` ([`TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.html#TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass)), and so to classes of connected triples, with automorphism groups matched.
- **Covers are classified by their triples** — connected degree-`n` covers of `ℂ ∖ {0, 1}` up to isomorphism correspond to isomorphism classes of connected degree-`n` triples ([`TauCeti.ConnectedCoverClass.isoClassEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/Classification.html#TauCeti.ConnectedCoverClass.isoClassEquiv)).
- **Polynomial Belyification of algebraic numbers** — every finite set of algebraic numbers is carried into `{0, 1}` by one rational polynomial whose critical values lie in `{0, 1}` ([`TauCeti.exists_polynomial_aeval_mem_criticalValues_subset`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Belyi.html#TauCeti.exists_polynomial_aeval_mem_criticalValues_subset)). It composes [Belyi's degree reduction](https://taucetiproject.org/docs/TauCeti/FieldTheory/Minpoly/BelyiReduction.html#TauCeti.exists_polynomial_aeval_mem_range) with the rational step through the Belyi polynomials `B_{m,n}`.
- **The genus-one superelliptic pair** — `y⁴ = t(t − 1)` is the analytic Belyi pair of the torus triple, with ramification `[4], [4], [2, 2]` and cyclic automorphism group of order four ([`TauCeti.AnalyticBelyiPair.nonempty_iso_superelliptic_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/Superelliptic.html#TauCeti.AnalyticBelyiPair.nonempty_iso_superelliptic_iff)).

### Notable definitions and infrastructure

- **The meromorphic function field** ([`TauCeti.RiemannSurface.MeromorphicFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/FunctionField.html#TauCeti.RiemannSurface.MeromorphicFunction)) — the field of a compact Riemann surface, with order valuations and pullbacks, and `ℂ(t)` on the sphere. It is the bridge that algebraization will cross.
- **Algebraic Belyi pairs** ([`TauCeti.IsAlgebraicBelyiPair`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Basic.html#TauCeti.IsAlgebraicBelyiPair)) — function fields over a characteristic-zero field, unramified outside `0`, `1`, `∞`. Superelliptic and polynomial examples are in place. Pairs are stable under the branch-point `S₃`-action and under [Galois conjugation](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Conjugation.html#TauCeti.IsAlgebraicBelyiPair.of_mapRingEquiv), which is where fields of moduli start.
- **LMFDB row certificates** ([`TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt`](https://taucetiproject.org/docs/TauCeti/Combinatorics/PermutationTriple/LMFDB/PassportRecord/Basic.html#TauCeti.PermutationTriple.LMFDB.PassportRecord.IsValidAt), [`TauCeti.PermutationTriple.LMFDB.BelyiRecord.IsValidFor`](https://taucetiproject.org/docs/TauCeti/Combinatorics/PermutationTriple/LMFDB/BelyiRecord.html#TauCeti.PermutationTriple.LMFDB.BelyiRecord.IsValidFor)) — these tie a stored passport or map row to the genus, geometry type, passport size, primitivity and transitive-group label of its triples. They also translate stored triples out of the database's convention.

### Roadmap coverage

- **Done:** Layers 0 and 2 to 7.
- **Layer 1** lacks only label semantics in degrees 6 to 11 (1.6).
- **Layer 8** lacks only the analytic genus reconciliation of 8.6. The genus-one superelliptic example of 8.5 now exists analytically.
- **Layer 9** has the carrier of 9.1 with its examples and the `S₃`-action on marked places and ramification indices. It lacks the local `(e, f)` data and the agreement with the topological action. 9.2 is in place, 9.3 has only its upper bound, and 9.4 to 9.8 are untouched.
- **Layer 10** has 10.2 and the polynomial form of 10.3 over `ℚ̄`. 10.1 exists only for polynomial critical values, and 10.4 to 10.8 are untouched.
- **Layer 11** has begun on 11.1: a conjugate pair is again a Belyi pair, with marked places and ramification indices preserved. There is no action on isomorphism classes, and 11.2 to 11.7 are untouched.
- **Layer 14** has the passport and map-orbit records of 14.1 and 14.2, with a primitivization certificate and the degree-at-most-four reconciliation. It lacks the orbit-size and field-of-definition certificates, 14.3 to 14.5, and most of the acceptance suite.
- **Untouched:** Layers 12 and 13.

## The frontier

- **The lower bound in the degree theorem (9.3)** — show that `M(X)` has degree exactly `deg β` over `ℂ(t)` by producing a function that separates an unbranched fibre. Point separation needs the Riemann–Roch chain from ModularForms.
- **A curve over `ℚ̄` admits a Belyi map (10.4)** — compose a nonconstant function on the curve with the polynomial Belyification above. This needs 10.1 in its form for finite separable maps.
- **Genus reconciliation (8.6)** — show that the analytic genus of a pair equals the combinatorial genus of its triple, through ModularForms' Riemann–Hurwitz.
- **The conjugation action (11.1)** — promote the conjugate pair to an action of `Gal(ℚ̄/ℚ)` on isomorphism classes, preserving the three partitions. Stabilizers (11.2) then wait on 10.6 and 10.7.
- **Label semantics in degrees 6 to 11 (1.6)** — this rests on PolynomialGaloisGroups' transitive-group labels at those degrees.

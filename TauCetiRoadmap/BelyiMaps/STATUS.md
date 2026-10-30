<!--tauceti-status:v1 {"roadmap":"BelyiMaps","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"1.6 label semantics in degrees 6 to 11","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the analytic superelliptic genus-one example and the analytic genus reconciliation","state":"partial"},{"id":"Layer 9","remaining":"local (e, f) data and S3-action in 9.1, the lower bound of 9.3, and 9.4 to 9.8","state":"partial"},{"id":"Layer 10","remaining":"composing degree reduction with the rational step, 10.1 for rational functions, and 10.4 to 10.8","state":"partial"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","remaining":"record semantics 14.1 to 14.5 and the acceptance suite; only the degree-at-most-four reconciliation exists","state":"partial"}],"readme_sha":"6831a42886019fc10409abc1bf9db904322dde80105caeaeee8a79d0092d2645","roadmap":"BelyiMaps","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d"}-->
# Status: BelyiMaps

This file documents the status of the BelyiMaps roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The topological and analytic classification of three-point covers is done. Covers of `ℂ ∖ {0, 1}`, connected permutation triples, dessins, topological branched covers and analytic Belyi pairs classify one another, with matching automorphism groups and rotations. The meromorphic function field and the algebraic carrier (Layer 9) are under way, as are the two explicit steps of Belyi's theorem (Layer 10). The descent and arithmetic layers (11 to 13) have not begun.

### Named results

- **Analytic Riemann existence for three-point covers** — isomorphism classes of analytic Belyi pairs of degree `n` correspond bijectively to connected degree-`n` covers of `ℂ ∖ {0, 1}` ([`TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.html#TauCeti.AnalyticBelyiPair.isoClassEquivConnectedCoverClass)), and so to classes of connected triples ([`TauCeti.AnalyticBelyiPair.isoClassEquivConnectedIsoClass`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.html#TauCeti.AnalyticBelyiPair.isoClassEquivConnectedIsoClass)). The automorphisms of a pair are [the automorphisms of its monodromy triple](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/BelyiPair.html#TauCeti.AnalyticBelyiPair.isoMulEquivAutomorphismGroup).
- **Covers are classified by their triples** — connected degree-`n` covers of `ℂ ∖ {0, 1}` up to isomorphism correspond to isomorphism classes of connected degree-`n` triples ([`TauCeti.ConnectedCoverClass.isoClassEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/Classification.html#TauCeti.ConnectedCoverClass.isoClassEquiv)).
- **Belyi's degree reduction** — every finite set of elements algebraic over a perfect field, such as a finite subset of `ℚ̄`, is carried into the field by a nonconstant polynomial whose critical values also lie in the field ([`TauCeti.exists_polynomial_aeval_mem_range`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Minpoly/BelyiReduction.html#TauCeti.exists_polynomial_aeval_mem_range)).
- **Polynomial Belyification over `ℚ`** — every finite set of rationals is carried into `{0, 1}` by a rational polynomial with all critical values in `{0, 1}`, built from Belyi polynomials `B_{m,n}` ([`TauCeti.exists_polynomial_eval_mem_criticalValues_subset`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Belyi.html#TauCeti.exists_polynomial_eval_mem_criticalValues_subset)).

### Notable definitions and infrastructure

- **The filled cover** ([`TauCeti.FilledCover`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/Basic.html#TauCeti.FilledCover)) — a cover of `ℂ ∖ {0, 1}` with one point added for each cycle of `σ0`, `σ1` and `σinf`. It is a compact complex manifold, and in its charts [the edges at a black point rotate by `σ0`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/Rotations.html#TauCeti.FilledCover.chartAt_center_overZero_symm_mul_mem_edge_iff).
- **The meromorphic function field** ([`TauCeti.RiemannSurface.MeromorphicFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/FunctionField.html#TauCeti.RiemannSurface.MeromorphicFunction)) — holomorphic maps to the sphere other than `∞`, forming a field with order valuations and pullbacks. On the sphere it is [`ℂ(t)`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/RiemannSurface/RationalFunction.html#TauCeti.RiemannSurface.MeromorphicFunction.ratFuncEquiv).
- **Algebraic Belyi pairs** ([`TauCeti.IsAlgebraicBelyiPair`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Basic.html#TauCeti.IsAlgebraicBelyiPair)) — function fields over a characteristic-zero `k`, unramified outside `0`, `1`, `∞`. The superelliptic fields `y ^ n = c t ^ a (t − 1) ^ b` are [examples](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Belyi/Radical.html#TauCeti.IsAlgebraicBelyiPair.of_pow_eq_X_zpow_mul_X_sub_one_zpow).

### Roadmap coverage

- **Done:** Layers 0, 2, 3, 4, 5, 6 and 7, as before.
- **Layer 1** still lacks label semantics in degrees 6 to 11 (1.6).
- **Layer 8** is done except for two items. In place are morphisms of pairs (8.4), the examples `zⁿ` and `4z(1 − z)`, the classification of 8.6 with automorphism and deck groups matched across pairs, branched covers and triples, and the rotations of 8.7 at all three kinds of point, read in the holomorphic charts. Missing are the analytic genus-one superelliptic example and the analytic genus reconciliation.
- **Layer 9** has two things. The carrier of 9.1 is there with its trivial, power-map and superelliptic examples, but without local `(e, f)` data or the `S₃`-action. The function field of 9.2 is there, but 9.3 has only its upper bound. Points and places, algebraization and analytification (9.4 to 9.8) are untouched.
- **Layer 10** has the degree-reduction step (10.2) and the Belyi polynomial with polynomial Belyification over `ℚ` (10.3). These are separate statements, not yet composed for sets in `ℙ¹(ℚ̄)`. 10.1 exists only for polynomial critical values, and 10.4 to 10.8 are untouched.
- **Layer 14** has only the degree-at-most-four reconciliation.
- **Untouched:** Layers 11 to 13.

## The frontier

- **The lower bound in the degree theorem (9.3)** — produce a function separating an unbranched fibre and show it generates `M(X)` over `ℂ(t)`, so that `[M(X) : ℂ(t)] = deg β`. Point separation needs the Riemann–Roch chain from ModularForms.
- **Polynomial Belyification over `ℚ̄` (10.3)** — compose the degree reduction with the rational step to send any finite `S ⊂ ℙ¹(ℚ̄)` containing `∞` into `{0, 1, ∞}` by one polynomial.
- **The positive-genus example and genus reconciliation (8.5, 8.6)** — realise `torusTriple` analytically as `y⁴ = t(t − 1)`, and show that the analytic genus of a pair equals the combinatorial genus. The superelliptic field exists algebraically, but no analytic surface for it does yet.
- **Points and places (9.4)** — send points of `X` to places of `M(X)` by the order valuations, which now exist, and prove this is a bijection compatible with ramification.
- **Label semantics in degrees 6 to 11 (1.6)** — this rests on PolynomialGaloisGroups' transitive-group labels at those degrees.

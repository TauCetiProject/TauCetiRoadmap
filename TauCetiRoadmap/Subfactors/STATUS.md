<!--tauceti-status:v1 {"roadmap":"Subfactors","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"Jones's positivity theorem markovTrace_nonneg_iff, the path models and C*-tower of 3.3, the tower action and index restriction of 3.4-3.5","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"90721fc9cfc831455b7fee078b1af9986faf143d7cb00e9761c3434c4df7097c","roadmap":"Subfactors","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: Subfactors

This file documents the status of the Subfactors roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All the progress so far is in Layer 3, and all of it is algebraic Temperley–Lieb groundwork over Tau Ceti's presentation. The analytic adjoint is done, and much of the algebra behind Jones's positivity theorem is in place: the tower normal form, uniqueness of the Markov trace, Jones–Wenzl projections and their quantum dimensions, and the signs of the quantum integers. The positivity theorem, the index restriction, and every layer that needs von Neumann algebras (correspondences, the basic construction, commuting squares, planar algebras and the classification results) have not begun.

### Named results

- **The analytic adjoint is unique** — for a self-adjoint loop value, the conjugate-linear, product-reversing involution fixing every generator is the only additive unital map with those properties ([`star_unique`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.star_unique)). Conversely, such a structure [forces the loop value to be self-adjoint](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.isSelfAdjoint_of_star_e), so a non-real δ has no adjoint.
- **Uniqueness of the Markov trace** — over every commutative semiring there is at most one Markov trace at each loop value, so the closure trace does not depend on the choice of spin parameter (`TauCeti.TemperleyLieb.IsMarkovTrace.unique`). It rests on Jones's normal form for the tower.
- **Quantum dimension of the Jones–Wenzl projections** — whenever the quantum integers [1], …, [n] are units, every Markov trace takes the value [n+1] on the Jones–Wenzl projection on n strands. So the projection lies in the trace radical exactly when [n+1] vanishes (`TauCeti.TemperleyLieb.jonesWenzl_mem_traceRadical_iff`).
- **The quantum-integer sign criterion** — at δ = 2cos θ with π/θ not an integer, the quantum integers are [positive up to ⌊π/θ⌋](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Real.html#TauCeti.qInt_two_mul_cos_pos_of_le_floor) and [negative at the next index](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Real.html#TauCeti.qInt_two_mul_cos_floor_add_one_neg). At δ = 2cos(π/m), the earlier ones are positive and [m] itself [vanishes](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Real.html#TauCeti.qInt_two_mul_cos_pi_div_eq_zero). This is the trigonometric input to the necessity half of Jones's theorem.

### Notable definitions and infrastructure

- **The analytic adjoint** ([`instStarRing`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.instStarRing)) makes the Temperley–Lieb algebra a star algebra. It [commutes with strand inclusion](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.strandIncl_star), and [an algebra map preserves it](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.map_star_iff) exactly when it sends the generators to self-adjoint elements. This is the criterion that the path models of 3.3 and the tower action of 3.4 will need.
- **Trace radicals and their quotients along the tower.** Strand inclusion induces injective maps between the trace-radical quotients for every loop value, with no positivity assumed. This is the algebraic skeleton of the positive Jones quotients.
- **Positive spin models for δ ≥ 2.** For a negative real spin parameter, the Markov trace is the pullback of a faithful positive weighted matrix trace, and every δ ≥ 2 admits such a parameter.

### Roadmap coverage

Layer 3 is partial. Section 3.1 is done. Of 3.2, the normal form, Markov uniqueness, the Jones–Wenzl projections with their quantum dimensions, the trace radical and the quantum-integer signs are proved. The dimension bound by the Catalan numbers, self-adjointness of the Jones–Wenzl projections and the Hermitian form are not established here, and neither is `markovTrace_nonneg_iff`. Sections 3.3–3.5 (the path models on the Dynkin graphs A_(m−1), the C*-tower, the action in the Jones tower and the index restriction) are untouched. Layers 1, 2 and 4–10 are untouched: nothing on correspondences, the basic construction, commuting squares, standard invariants, planar algebras, reconstruction, finite-depth classification or infinite index has landed.

## The frontier

- **Necessity in Jones's positivity theorem** — every ingredient is now present: the Jones–Wenzl projection f_k at k = ⌊π/θ⌋, its quantum dimension [k+1] < 0, and the adjoint. What remains is to show that f_k is self-adjoint and to assemble T_k(f_k† f_k) = [k+1] < 0, together with its image at higher levels.
- **The Hermitian form and Cauchy–Schwarz** — prove T_n(x†) = conj T_n(x) from Markov uniqueness, then Cauchy–Schwarz and the identification of the null space with the trace radical.
- **Positive path models (3.3)** — the representation on paths on the half-line and on A_(m−1), with weights [t+1], its trace identified with T_n, and its kernel identified with the trace radical. Sufficiency at δ = 2cos(π/m) depends on this. For δ ≥ 2, the spin model may shorten the route.
- **Jones's index restriction (3.4–3.5)** — blocked on Layer 2's Jones tower and the Markov relation of 2.3. These in turn need VonNeumannAlgebras V5–V7 (II₁ traces, coupling dimension and the trace-preserving expectation).
- **Layers 1–2** — correspondences, Connes fusion and the basic construction wait on the VonNeumannAlgebras supply (standard form, normality, coupling dimension).

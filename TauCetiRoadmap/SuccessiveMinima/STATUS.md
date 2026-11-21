<!--tauceti-status:v1 {"roadmap":"SuccessiveMinima","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"264e635835eb8a90c63b95b513fdd03752258c0235fb84394bfe78c9b0a84c40","roadmap":"SuccessiveMinima","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: SuccessiveMinima

This file documents the status of the SuccessiveMinima roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The end theorem, the lower half of Minkowski's second theorem, is proved for an arbitrary additive Haar measure. So are the sharpness of both halves, the linear forms theorem, the Hadamard and Gram bounds, the full successive-minima calculus with Mathlib's proposed foundational definition, and Minkowski's first theorem on minima.

### Named results

- **Minkowski's second theorem, lower half** — for a discrete full lattice `L`, any additive Haar measure `μ` and a symmetric convex body `K` with `0` in its interior, `(2^d/d!)·covolume(L,μ) ≤ (∏ λ_i)·μ(K)`. This is the roadmap's `minkowski_second_lower`: [`ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.html#ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal).
- **Sharpness of Minkowski's second theorem** — the minima of a weighted box or cross-polytope with nondecreasing weights are exactly the weights, so the cross-polytope attains [equality in the lower bound](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/BoxMinima.html#ZLattice.prod_successiveMin_mul_measureReal_crosspolytope) and the box attains [equality in the upper bound](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/BoxMinima.html#ZLattice.prod_successiveMin_mul_measureReal_box).
- **Minkowski's linear forms theorem** — for an invertible real matrix `A` and bounds `a_i ≥ 0` with `∏ a_i ≥ |det A|`, some nonzero integer vector satisfies every `|(A x)_i| ≤ a_i`: [`Matrix.exists_ne_zero_int_abs_sum_mul_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/LinearForms.html#Matrix.exists_ne_zero_int_abs_sum_mul_le).
- **Hadamard's inequality** — a determinant in orthonormal coordinates has norm at most the product of the column norms, [`OrthonormalBasis.norm_det_le_prod_norm`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.html#OrthonormalBasis.norm_det_le_prod_norm). Its hermitian Gram form, [`Matrix.re_det_gram_le_prod_norm_sq`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.html#Matrix.re_det_gram_le_prod_norm_sq), holds in any inner product space.
- **Minkowski's first theorem on successive minima** — `λ₀^d·μ(K) ≤ 2^d·covolume(L,μ)` in positive dimension: [`ZLattice.successiveMin_pow_mul_measureReal_le_two_pow_mul_covolume`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.html#ZLattice.successiveMin_pow_mul_measureReal_le_two_pow_mul_covolume).

### Notable definitions and infrastructure

- **The foundational successive minima** — [`MeasureTheory.successiveMin`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/GeometryOfNumbers/SuccessiveMinima.html#MeasureTheory.successiveMin) follows the name and definition of Mathlib's proposal, for an arbitrary set and lattices of any rank, and comes with that proposal's junk-value, attainment and directional-basis lemmas. [`MeasureTheory.coe_successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#MeasureTheory.coe_successiveMin) identifies it with Tau Ceti's body minima, so adopting the proposal should only need a deletion and an import.
- **Bases adapted to the minima** — [`ZLattice.exists_basis_gauge_eq_successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.exists_basis_gauge_eq_successiveMin) gives a real basis of lattice vectors attaining every minimum. [`ZLattice.exists_basis_mem_flag_of_gauge_lt_successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.exists_basis_mem_flag_of_gauge_lt_successiveMin) gives an integral basis whose flag contains the strict sublevels (Cassels VIII, Lemma 2), built from the [same-flag integral basis](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/AdaptedBasis.html#ZLattice.exists_basis_span_image_eq_flag).
- **Volumes of interior-disjoint convex sets** — [`Convex.addHaar_iUnion_vadd`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/Measure.html#Convex.addHaar_iUnion_vadd) shows that finitely many convex translates with disjoint interiors have total measure equal to the sum of their measures, for any Haar measure. This is the translate-volume input of Layer 3.

### Roadmap coverage

All four layers are done, and the source has no `sorry` in them. Layer 0 has the coordinate and hermitian Hadamard bounds, the uniform Gram bound and the same-flag integral basis (0.1–0.2). Layer 1 has the foundational minima and their proposal lemmas, the natural-index extension and the gauge and rank thresholds. It also has monotonicity in the body and the lattice, scaling, transport along linear maps, the attaining real basis and the integral minimum flag (1.1–1.11). Layer 2 has the cross-polytope volume, containment and covolume lemmas, the lower inequality, box and cross-polytope minima, and the linear forms theorem with its box volume (2.1–2.2). Layer 3 has the two translate-volume lemmas, the coordinate upper inequality and Minkowski's first theorem on minima (3.1–3.4). The roadmap's worked examples, such as the minima `(2,3)` of `[−1/2,1/2]×[−1/3,1/3]` in `ℤ²`, are proved as theorems.

## The frontier

- **Adopting Mathlib's successive-minima proposal** — if it lands, `MeasureTheory.successiveMin` and its lemmas were built to be replaced by an import. This is the only remaining work the roadmap itself anticipates.
- **Downstream consumers** — Siegel's lemma, Bombieri–Vaaler and lattice heights belong to the DiophantineApproximationAndTranscendence and HeightsAndUnits roadmaps. The comparison with the squared-norm minima of IntegralLattices belongs to GeometryOfNumbersAndQuadraticArithmetic. None of these is owned here.

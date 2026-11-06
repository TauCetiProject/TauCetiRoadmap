<!--tauceti-status:v1 {"roadmap":"SuccessiveMinima","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the Hadamard and Gram determinant bounds 0.1.1-0.1.3 and the same-flag integral basis 0.2.1","state":"untouched"},{"id":"Layer 1","remaining":"MeasureTheory.successiveMin and its comparison 1.1, the threshold and attainment calculus 1.2-1.5, monotonicity and transport 1.6-1.10, the integral flag 1.11","state":"untouched"},{"id":"Layer 2","remaining":"cross-polytope containment, the covolume bound, minkowski_second_lower, box and cross-polytope minima, and the linear forms theorem","state":"partial"},{"id":"Layer 3","remaining":"the translate-volume lemmas 3.1-3.2, the coordinate upper inequality 3.3 and Minkowski's first theorem on minima 3.4","state":"untouched"}],"readme_sha":"f8dbfd613dfe18745131acb7fda1e580c57a1ca2b2c1c05a9a9511cbc89c9426","roadmap":"SuccessiveMinima","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: SuccessiveMinima

This file documents the status of the SuccessiveMinima roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first volume lemma of Layer 2 is in place. Minkowski's lower inequality, the linear forms theorem, the minima calculus of Layer 1, the Gram and flag results of Layer 0 and the translate-volume results of Layer 3 have not begun. Tau Ceti's existing body minima and the upper half of Minkowski's second theorem, which the roadmap builds on, predate it and are not counted here.

### Named results

- **The volume of a weighted cross-polytope** — for an orthonormal basis `o`, a real basis `b` and positive weights `a_i`, the set `Σ a_i·|b.repr(x)_i| ≤ 1` has canonical volume `(2^n/n!)·|det_o(b)|/∏ a_i`, dimension zero included. This is 2.1.1, stated over an arbitrary finite index type: [`OrthonormalBasis.volume_weighted_crosspolytope`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Lebesgue/WeightedCrosspolytope.html#OrthonormalBasis.volume_weighted_crosspolytope).

### Roadmap coverage

Layer 2 is partial: 2.1.1 is proved, while 2.1.2–2.1.6 (cross-polytope containment, the covolume bound, `minkowski_second_lower`, and the box and cross-polytope minima) and the linear forms theorem 2.2 are absent. Layers 0, 1 and 3 are untouched. None of the Hadamard and Gram bounds, the same-flag integral basis, the foundational `MeasureTheory.successiveMin` and its comparison with Tau Ceti's body minima, the translate-volume lemmas or Minkowski's first theorem on successive minima is in the library.

## The frontier

- **Cross-polytope containment and the covolume bound (2.1.2, 2.1.3)** — the two remaining lemmas of the Euclidean lower-bound proof. Neither depends on Layer 1, so both can be done now.
- **Attaining basis and linear transport (1.5, 1.9)** — the real basis with `b_i ∈ λ_i·K` and transport of minima along linear equivalences. Both are short corollaries of Tau Ceti's existing body-minimum API, and `minkowski_second_lower` needs them.
- **Minkowski's lower inequality (2.1.4)** — the end theorem, `(2^d/d!)·covolume(L,μ) ≤ (∏ λ_i)·μ.real(K)` for an arbitrary additive Haar measure. It is blocked on 2.1.2, 2.1.3, 1.5 and 1.9.
- **Minkowski's linear forms theorem (2.2)** — the box volume under an invertible matrix, then a nonzero integer point with non-strict bounds. It needs only Minkowski's first theorem and is independent of the minima.
- **Layer 0 and the foundational minima (0.1, 0.2, 1.1)** — the hermitian Gram–Hadamard bound, the same-flag integral basis built from `ZLattice.exists_basis_triangular`, and the proposal's `MeasureTheory.successiveMin` identified with the body minima.

<!--tauceti-status:v1 {"roadmap":"HeightsAndUnits","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the integral kernel basis as one statement (compose the intPoints minima basis with the minorGcd minima bound) and Bombieri-Vaaler Theorem 1","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"85f7adf029e6c37cf2f857702ebe8ac077c2df9921a58f96098fb3acdf4029cb","roadmap":"HeightsAndUnits","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: HeightsAndUnits

This file documents the status of the HeightsAndUnits roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1, 3 and 4 are done. These cover the height estimates, the heights of units with the regulator bounded in both directions, and the `S`-unit theorem with its lattice and `S`-regulator. Layer 2 lacks only its last assembly step, the integral kernel basis, and the smallest-vector form of Bombieri–Vaaler.

### Named results

- **The reduced fundamental system** (Bugeaud–Győry, Lemma 1) — every number field has a fundamental system of units whose absolute heights have product at most `(r!)²/(2^{r−1} d^r)` times the regulator ([`exists_fundSystem_prod_absLogHeight₁_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/FundamentalSystem.html#TauCeti.NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le)). With Hadamard's bound ([`regulator_le_prod_absLogHeight₁`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/Regulator/Height.html#TauCeti.NumberField.Units.regulator_le_prod_absLogHeight₁)) this pins the regulator between products of heights.
- **Minkowski's second theorem** — the product of the successive minima of a lattice with respect to a symmetric convex body, times its volume, is at most `2ⁿ` times the covolume ([`prod_successiveMin_mul_measure_le_two_pow_mul_covolume`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.html#ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume)). It is proved here in its upper-bound form, rather than taken from the geometry-of-numbers roadmap.
- **Bombieri–Vaaler's Theorem 2 in the sup norm** — an integer system `A x = 0` with independent rows has `n − p` independent primitive solutions whose sup norms have product at most `√det(A Aᵀ)` divided by the gcd of the maximal minors ([`exists_linearIndependent_mulVec_eq_zero_prod_norm_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/BombieriVaaler.html#Matrix.exists_linearIndependent_mulVec_eq_zero_prod_norm_le)). It rests on Vaaler's cube-slicing theorem ([`two_pow_finrank_le_volume_setOf_forall_abs_le_one`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Lebesgue/CubeSlice.html#Submodule.two_pow_finrank_le_volume_setOf_forall_abs_le_one)).
- **The determinant formula for the `S`-regulator** — for any fundamental system of `S`-units and any omitted infinite place, the `S`-regulator is the absolute determinant of the matrix of weighted logarithms ([`regulator_eq_abs_det`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Regulator.html#TauCeti.NumberField.SUnit.regulator_eq_abs_det)).
- **Kronecker's theorem for projective tuples** — a tuple of algebraic numbers has absolute height one exactly when every ratio of its coordinates is zero or a root of unity ([`absoluteProjectiveTupleHeight_eq_one_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Kronecker.html#TauCeti.absoluteProjectiveTupleHeight_eq_one_iff)).

### Notable definitions and infrastructure

- **Successive minima** ([`successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.successiveMin)), together with the basis lemma in minima form: every lattice has a basis with `b i ∈ max 1 ((i+1)/2) · λ_i · K` ([`exists_basis_mem_smul_successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.exists_basis_mem_smul_successiveMin)). This converts Minkowski's minima bound into bases, at the cost `n!/2^{n−1}`.
- **The minor gcd** [`minorGcd`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/MaximalMinor.html#Matrix.minorGcd), with the identity `minorGcd A · H(ker A) = √det(A Aᵀ)` ([`minorGcd_mul_subspaceHeight_ker_mulVecLin`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/IntMatrix.html#Matrix.minorGcd_mul_subspaceHeight_ker_mulVecLin)). It turns the kernel's covolume into a quantity that `GL_m(ℤ)` row operations leave unchanged.
- **The `S`-units modulo torsion as a lattice** ([`logEmbeddingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Lattice.html#TauCeti.NumberField.SUnit.logEmbeddingEquiv)). This is why fundamental systems of `S`-units and lattice bases are the same thing.

### Roadmap coverage

Layers 0, 1 and 4 are done, as before. Layer 3 is now done: the logarithmic-embedding dictionary, height one as torsion, Hadamard's bound, and the reduced fundamental system against the regulator with the README's constant are all proved. Layer 2 is partial. The general and minima forms of the basis lemma, the factorial loss, the minor gcd with its identity and invariance, the geometric half (the product of cube-slice minima is at most the covolume), sharpness of Siegel's exponent and the Theorem 2 adapter are all proved. Still missing are the integral kernel basis as one statement and Bombieri–Vaaler's Theorem 1.

## The frontier

- **The integral kernel basis (2.2)**: a `ℤ`-basis of `ker A` with product of sup norms at most `k!/2^{k−1} · √det(A Aᵀ)/minorGcd A`. The two ingredients are already proved: the basis of integral points from the minima ([`exists_basis_intPoints_prod_norm_le_prod_successiveMin`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/CubeSlice.html#Submodule.exists_basis_intPoints_prod_norm_le_prod_successiveMin)) and the bound on the kernel's minima ([`minorGcd_mul_prod_successiveMin_le_sqrt_det`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/SupNormMinima.html#Matrix.minorGcd_mul_prod_successiveMin_le_sqrt_det)). What remains is to compose them, including the `k = 0` edge case.
- **Bombieri–Vaaler's Theorem 1 in the sup norm**: for `p < n`, a nonzero integral solution with sup norm at most `(√det(A Aᵀ)/minorGcd A)^{1/k}`. It is the smallest member of the Theorem 2 family, so it should be a short corollary.

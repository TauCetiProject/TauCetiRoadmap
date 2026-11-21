<!--tauceti-status:v1 {"roadmap":"HeightsAndUnits","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"6564cc5c09856f1d9e8b487ff22abd4b22336d2cbd85db45b99995dcea055903","roadmap":"HeightsAndUnits","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: HeightsAndUnits

This file documents the status of the HeightsAndUnits roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The height estimates, the Northcott instances and Kronecker's theorem, the lattice bases and Bombieri–Vaaler in the sup norm, the heights of units against the regulator, and the `S`-unit theorem with its lattice and `S`-regulator are all proved; the last piece, the integral kernel basis, closed Layer 2.

### Named results

- **The integral kernel basis** — an integer matrix `A` with independent rows has a `ℤ`-basis of its whole integral kernel whose sup norms have product at most `k!/2^{k−1} · √det(A Aᵀ)/minorGcd A`, where `k` is the kernel's dimension ([`exists_basis_ker_mulVecLin_prod_norm_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/BombieriVaaler.html#Matrix.exists_basis_ker_mulVecLin_prod_norm_le)). Without the factorial loss, the same bound holds for an independent family of solutions, which is Bombieri–Vaaler's Theorem 2 ([`exists_linearIndependent_mulVec_eq_zero_prod_norm_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/BombieriVaaler.html#Matrix.exists_linearIndependent_mulVec_eq_zero_prod_norm_le)).
- **Bombieri–Vaaler's Siegel lemma** — for `p < n`, the system `A x = 0` has a nonzero integer solution of sup norm at most `(√det(A Aᵀ)/minorGcd A)^{1/(n−p)}` ([`exists_ne_zero_mulVec_eq_zero_norm_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/SiegelsLemma.html#Matrix.exists_ne_zero_mulVec_eq_zero_norm_le)).
- **The reduced fundamental system** (Bugeaud–Győry, Lemma 1) — every number field has a fundamental system of units whose absolute heights have product at most `(r!)²/(2^{r−1} d^r)` times the regulator ([`exists_fundSystem_prod_absLogHeight₁_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/FundamentalSystem.html#TauCeti.NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le)). With Hadamard's bound this pins the regulator between products of heights.
- **Minkowski's second theorem** — the product of the successive minima of a lattice with respect to a symmetric convex body, times the body's volume, is at most `2ⁿ` times the covolume ([`prod_successiveMin_mul_measure_le_two_pow_mul_covolume`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.html#ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume)), in its upper-bound form.
- **The determinant formula for the `S`-regulator** — for any fundamental system of `S`-units and any omitted infinite place, the `S`-regulator is the absolute determinant of the matrix of weighted logarithms ([`regulator_eq_abs_det`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Regulator.html#TauCeti.NumberField.SUnit.regulator_eq_abs_det)).

### Notable definitions and infrastructure

- **Successive minima** ([`successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.successiveMin)) with the basis lemma in minima form ([`exists_basis_mem_smul_successiveMin`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.html#ZLattice.exists_basis_mem_smul_successiveMin)), which turns minima bounds into bases at the cost `n!/2^{n−1}`.
- **The minor gcd** [`minorGcd`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/MaximalMinor.html#Matrix.minorGcd), with `minorGcd A · H(ker A) = √det(A Aᵀ)` ([`minorGcd_mul_subspaceHeight_ker_mulVecLin`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/IntMatrix.html#Matrix.minorGcd_mul_subspaceHeight_ker_mulVecLin)). It lets the kernel results be stated either for a matrix or for any rational subspace with its height, as in [`exists_basis_intPoints_prod_norm_le_subspaceHeight`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Arakelov/BombieriVaaler.html#Submodule.exists_basis_intPoints_prod_norm_le_subspaceHeight).
- **The `S`-units modulo torsion as a lattice** ([`logEmbeddingEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/SUnits/Lattice.html#TauCeti.NumberField.SUnit.logEmbeddingEquiv)), so fundamental systems of `S`-units and lattice bases are the same thing.

### Roadmap coverage

All five layers are done. Layers 0, 1, 3 and 4 were already complete. Layer 2 is now complete too: the integral kernel basis and Bombieri–Vaaler's Theorem 1 joined the basis lemma, the minor gcd identity and its invariance, the geometric half, Theorem 2 and the sharpness of Siegel's exponent. Beyond the README's milestones, rank-one fields now have an exact formula: the norm of a unit's logarithmic embedding is the index of the subgroup it generates with the torsion, times the regulator ([`norm_logEmbedding_eq_index_mul_regulator`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/Regulator/Basic.html#TauCeti.NumberField.Units.norm_logEmbedding_eq_index_mul_regulator)).

## The frontier

- **Nothing remains inside this roadmap.** Every milestone the README sets is proved.
- **Number-field versions of the kernel results**: the Siegel lemma and kernel basis here are over `ℤ` in the sup norm. The README leaves the general number-field Siegel theorem, effective lower bounds for heights and `S`-unit equations to other roadmaps.

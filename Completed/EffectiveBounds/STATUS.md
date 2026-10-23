<!--tauceti-status:v1 {"roadmap":"EffectiveBounds","to_sha":"315040461dd16f4333a14977d01a661f2c11e50a","ts":"2026-10-23T17:09:14Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"optional: connect the packing and doubling API to Mathlib's ZLattice and covolume","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"regulator lower bounds for positive unit rank and the volume computations for the class number formula","state":"partial"}],"readme_sha":"5c436d080fbdd4a94bb2f626b574b9c660b4b40d7ddfe0554c16e2227466713e","roadmap":"EffectiveBounds","to_sha":"315040461dd16f4333a14977d01a661f2c11e50a"}-->
# Status: EffectiveBounds

This file documents the status of the EffectiveBounds roadmap up until `3150404` (2026-10-23T17:09:14Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The maintainers have declared this roadmap complete. The Layer-1 explicit bounds, the Layer-0 lattice-point engine and the Layer-2 summit, an explicit count of number fields of bounded discriminant, are all proved without sorry. Layer 3 (regulators) has only its rank-zero base case, and the Brauer–Siegel horizon has not begun.

### Named results

- **Effective Hermite–Minkowski count** — inside a fixed extension `A/ℚ`, the number of number fields with `|d_K| ≤ N` is at most `(2C+1)^(D+1)·D`, where `D` is Mathlib's degree bound and `C` an explicit coefficient height. This upgrades Mathlib's finiteness theorem to a count ([`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le)).
- **Explicit ideal count** — for `X ≥ 1` there are at most `X²·2ⁿ` nonzero integral ideals of norm at most `X`, a uniform bound that the asymptotic count cannot supply ([`NumberField.card_ideal_absNorm_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.html#NumberField.card_ideal_absNorm_le)). It feeds the class-number bound `h_F ≤ |d_F|·4ⁿ`.
- **Lattice doubling bound** — for an additive subgroup `Λ` of `ι → ℂ`, `#(Λ ∩ box r 2) ≤ 49^#ι · #(Λ ∩ box r 1)`, proved without measure theory ([`TauCeti.GeometryOfNumbers.ncard_inter_box_two_le_pow_mul_ncard_inter_box_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.html#TauCeti.GeometryOfNumbers.ncard_inter_box_two_le_pow_mul_ncard_inter_box_one)).
- **Bounded integer-polynomial roots** — the roots of integer polynomials of degree at most `d` with coefficients bounded by `B` form a finite set of at most `(2B+1)^(d+1)·d` elements. This is the counting core of the summit ([`TauCeti.Polynomial.ncard_biUnion_roots_natDegree_le_abs_intCoeff_le`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Card/RootSetUnion.html#TauCeti.Polynomial.ncard_biUnion_roots_natDegree_le_abs_intCoeff_le)), and it also gives an explicit Northcott count for the naive height ([`TauCeti.finite_setOf_naiveHeight_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Height/Counting.html#TauCeti.finite_setOf_naiveHeight_le)).
- **Rank-zero regulator** — a number field of unit rank zero has regulator `1` ([`NumberField.Units.regulator_eq_one_of_rank_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/Regulator.html#NumberField.Units.regulator_eq_one_of_rank_eq_zero)).

### Notable definitions and infrastructure

- **Polydisc boxes** — the per-coordinate polydisc `box r c` in `ι → ℂ`, on which the packing and doubling bounds are stated, so that lattice points can be counted without a measure ([`TauCeti.GeometryOfNumbers.box`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.html#TauCeti.GeometryOfNumbers.box)).
- **Hermite-count constants** — the explicit coefficient height ([`NumberField.coeffBoundOfDiscrBdd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.coeffBoundOfDiscrBdd)) and the monotone count expression ([`NumberField.hermiteCountBound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.hermiteCountBound)). With these, a consumer can substitute coarser degree or height bounds, a larger threshold, or a natural-number discriminant.
- **Squares in a finitely generated commutative group** — the subgroup of squares has index at most `2^#S` for any generating set `S`. This is the engine behind the unit-square index `[O_F^× : (O_F^×)²] ≤ 2ⁿ` ([`TauCeti.index_square_le_of_closure_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Group/PowMonoidHom.html#TauCeti.index_square_le_of_closure_eq_top)).

### Roadmap coverage

Layers 0, 1 and 2 are done, and so are the three worked examples (`|d_{ℚ(i)}| = 4`, `h_{ℚ(√−5)} ≤ 320`, and doubling on the Gaussian lattice). Layer 1 covers the discriminant bound from a basis of integers, the ideal count, the class-number bound and the unit-square index. Layer 2 covers the effective count together with its generating step, its root and simple-field counts, and its monotone and threshold packagings. Layer 0 is done with one caveat: the engine is stated for additive subgroups of `ι → ℂ`, and the material here does not show whether it was reconciled with `ZLattice` as the README asked. Layer 3 is partial: only the rank-zero case (`R_K = 1`, with `1 ≤ R_K` in degree one, with one infinite place, and for imaginary quadratic fields). The Brauer–Siegel horizon is untouched.

## The frontier

The roadmap is archived and no longer offered to contributors. These are the open ends its README names.

- **Regulator lower bounds for positive unit rank** — the core of Layer 3. Everything present reduces to a zero-dimensional unit lattice, and no lower bound on the covolume exists for positive rank.
- **Volume computations for the analytic class number formula** — the second half of Layer 3; not started.
- **`ZLattice` reconciliation of the engine** — the packing and doubling API lives on additive subgroups of `ι → ℂ`. Whether it connects to Mathlib's `ZLattice` and covolume API has not been established.
- **Brauer–Siegel** — `log(h_F·R_F) ∼ log √|d_F|` with explicit constants. It is untouched, and it needs the Layer-3 regulator bounds first.

<!--tauceti-status:v1 {"roadmap":"EffectiveBounds","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: EffectiveBounds

This file documents the status of the EffectiveBounds roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** This roadmap lives under `Completed/`: the maintainers have declared it complete against its README, which records the Layer-1 explicit bounds, the explicit ideal count, the Layer-0 engine and the Layer-2 summit (an explicit count of number fields of bounded discriminant) as landed sorry-free. Layer 3 (regulators) has only its rank-zero base case, and the Brauer–Siegel horizon has not begun. The declaration list behind this snapshot under-represents the delivered work: each declaration is attributed to the commit that last touched it, and later consolidation of the `EffectiveBounds/` files moved much of the Layer-1 code out of this window.

### Named results

- **Effective Hermite–Minkowski count** — inside a fixed extension `A/ℚ`, the number of number fields with `|d_K| ≤ N` is at most `(2C+1)^(D+1)·D`, with `D` Mathlib's degree bound and `C` an explicit coefficient height; Mathlib gives only finiteness ([`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le)).
- **Hermite–Minkowski generating step** — every such field is generated over `ℚ` by a root in `A` of an integer polynomial of bounded degree and coefficient height, extracted from Mathlib's finiteness proof ([`NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le)).
- **Explicit ideal count** — for `X ≥ 1` the nonzero integral ideals of norm at most `X` number at most `X²·2ⁿ`, the uniform bound the asymptotic count cannot supply ([`NumberField.card_ideal_absNorm_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.html#NumberField.card_ideal_absNorm_le)).
- **Lattice doubling bound** — for an additive subgroup `Λ` of `ι → ℂ`, `#(Λ ∩ box r 2) ≤ 49^#ι · #(Λ ∩ box r 1)`, measure-free ([`TauCeti.GeometryOfNumbers.ncard_inter_box_two_le_pow_mul_ncard_inter_box_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.html#TauCeti.GeometryOfNumbers.ncard_inter_box_two_le_pow_mul_ncard_inter_box_one)).
- **Rank-zero regulator** — a number field of unit rank zero has regulator `1`, the base case of Layer 3 ([`NumberField.Units.regulator_eq_one_of_rank_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/Regulator.html#NumberField.Units.regulator_eq_one_of_rank_eq_zero)).

### Notable definitions and infrastructure

- **Polydisc boxes** — the per-coordinate polydisc `box r c` in `ι → ℂ` on which the packing and doubling bounds are stated, so lattice-point counts can be made without a measure ([`TauCeti.GeometryOfNumbers.box`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.html#TauCeti.GeometryOfNumbers.box)).
- **Hermite-count constants** — the explicit coefficient height ([`NumberField.coeffBoundOfDiscrBdd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.coeffBoundOfDiscrBdd)) and the monotone count expression ([`NumberField.hermiteCountBound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.hermiteCountBound)), which let a consumer substitute coarser degree or height bounds, a larger threshold, or a natural-number discriminant.
- **Squares in a finitely generated commutative group** — the subgroup of squares has index at most `2^#S` for a generating set `S`, the engine behind the unit-square index ([`TauCeti.index_square_le_of_closure_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Group/PowMonoidHom.html#TauCeti.index_square_le_of_closure_eq_top)).

### Roadmap coverage

- **Layer 0 (engine): done.** Boxes, the packing bound, the doubling bound at factor `49^#ι`, and the rank-two Gaussian-lattice instance (at most `256` points in the radius-two box). The engine is stated for an arbitrary additive subgroup of `ι → ℂ`, and the doubling bound takes finiteness of `Λ ∩ box r 2` as a hypothesis (discharged by packing in the example); whether the `ZLattice` reconciliation the README asked for was carried out is not visible here.
- **Layer 1 (explicit bounds): done according to the README; partly verifiable here.** The ideal count, the abstract group lemma and the trace-form diagonalisation for square-root bases appear as declarations. The discriminant bound `|d_F| ≤ |disc b|`, the class-number bound `h_F ≤ |d_F|·4ⁿ` and the unit-square index `[O_F^× : (O_F^×)²] ≤ 2ⁿ` (TauCeti#144, TauCeti#151), with their quadratic forms (`|d_K| ≤ 4|a|`, `h_K ≤ 64|a|`), the product bound `h_F·[O_F^× : (O_F^×)²] ≤ |d_F|·8ⁿ`, and the integral-basis equality, are recorded in the pull-request history but their declarations were re-attributed by later consolidation.
- **Layer 2 (summit): done.** The count, its generating step, the bounded-polynomial and root counts, the simple-field count, and monotone, threshold and natural-discriminant packagings.
- **Worked examples: done.** `|d_{ℚ(i)}| = 4` from `{1, i}` ([`NumberField.WorkedExamples.abs_discr_cyclotomicField_four`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/WorkedExamples.html#NumberField.WorkedExamples.abs_discr_cyclotomicField_four)), `h_{ℚ(√−5)} ≤ 320` ([`NumberField.WorkedExamples.classNumber_adjoinRoot_sqrt_neg_five_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/WorkedExamples.html#NumberField.WorkedExamples.classNumber_adjoinRoot_sqrt_neg_five_le)), and the Gaussian doubling instance.
- **Layer 3 (regulators): partial.** Rank zero only: `R_K = 1`, and `1 ≤ R_K` in the degree-one, single-infinite-place and imaginary-quadratic forms. Nothing for positive unit rank; no volume computations.
- **Long horizon (Brauer–Siegel): untouched.**

## The frontier

The roadmap is archived and no longer offered to contributors; these are the open ends its README names.

- **Regulator lower bounds for positive unit rank** — the Layer-3 item proper. Everything present reduces to `R_K = 1` for a zero-dimensional unit lattice; no lower bound on the covolume exists for positive rank.
- **Volume computations for the analytic class number formula** — the second half of Layer 3; not started.
- **`ZLattice` reconciliation of the engine** — the README asked that the packing and doubling API be mapped onto Mathlib's `ZLattice`/covolume before porting. The engine landed on additive subgroups of `ι → ℂ`; whether it also speaks to `ZLattice` is not established here.
- **Brauer–Siegel** — `log(h_F·R_F) ∼ log √|d_F|` with explicit constants; the long-horizon aspiration, untouched; it needs the Layer-3 regulator bounds.

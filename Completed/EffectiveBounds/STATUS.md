<!--tauceti-status:v1 {"roadmap":"EffectiveBounds","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"3aa3db6b698e2c2a0fe079dd66f54f94c957a5b455c4793fa39e8b3055dd9efb","roadmap":"EffectiveBounds","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: EffectiveBounds

This file documents the status of the EffectiveBounds roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are done: the explicit Layer-1 bounds, the measure-free lattice-point engine (now reconciled with `ZLattice`), the effective Hermite–Minkowski count, and an explicit regulator lower bound in every unit rank. Only the Brauer–Siegel aspiration has not begun.

### Named results

- **Effective Hermite–Minkowski count** — inside a fixed extension `A/ℚ`, at most `(2C+1)^(D+1)·D` number fields have `|d_K| ≤ N`, where `D` is Mathlib's degree bound and `C` an explicit coefficient height. This upgrades Mathlib's finiteness theorem to a count ([`NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.html#NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le)).
- **Explicit regulator lower bound** — for a field of degree `d` and unit rank `r`, `R_K ≥ δ(d)^r / r!` with `δ(d) = log 2 / (N(d)+1)`, positive in every rank and equal to one in rank zero ([`regulatorLowerBound_le_regulator`](https://taucetiproject.org/docs/TauCeti/NumberTheory/EffectiveBounds/Regulator.html#TauCeti.NumberField.Units.regulatorLowerBound_le_regulator)).
- **Unit height gap** — every nontorsion unit of a degree-`d` field has relative logarithmic height at least `δ(d)`. The proof counts bounded powers rather than choosing an ineffective Northcott minimum ([`unitHeightLowerBound_le_logHeight₁`](https://taucetiproject.org/docs/TauCeti/NumberTheory/EffectiveBounds/UnitHeight.html#TauCeti.NumberField.Units.unitHeightLowerBound_le_logHeight₁)).
- **Explicit ideal count** — for `X ≥ 1`, at most `X²·2ⁿ` nonzero integral ideals have norm at most `X`, a uniform bound that the asymptotic count cannot supply. It feeds the class-number bound `h_F ≤ |d_F|·4ⁿ` ([`NumberField.card_ideal_absNorm_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.html#NumberField.card_ideal_absNorm_le)).
- **Lattice doubling** — for any discrete `ℤ`-submodule of `ι → ℂ`, and so for a full `ZLattice`, the points in the doubled polydisc number at most `49^#ι` times those in the original, proved without measure theory ([`ncard_inter_pi_closedBall_two_le_pow_mul_of_discreteTopology`](https://taucetiproject.org/docs/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.html#TauCeti.GeometryOfNumbers.ncard_inter_pi_closedBall_two_le_pow_mul_of_discreteTopology)).

### Notable definitions and infrastructure

- **Unit-log covolume normalization** — the full weighted logarithmic unit lattice, with the Euclidean volume induced on the sum-zero hyperplane, has covolume `√(r+1)·R_K`. This links the Euclidean picture of the unit lattice to Mathlib's regulator ([`covolume_fullUnitLattice_fullLogEuclideanVolume`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Units/Log/Covolume.html#TauCeti.covolume_fullUnitLattice_fullLogEuclideanVolume)).
- **Bounded-house count** — an explicit bound `N(d)` on the number of algebraic integers of degree at most `d` with house at most two. It is the single constant that drives both the height gap and the regulator bound ([`unitPowerCountBound`](https://taucetiproject.org/docs/TauCeti/NumberTheory/EffectiveBounds/UnitHeight.html#TauCeti.NumberField.Units.unitPowerCountBound)).
- **Squares in a finitely generated commutative group** — for any generating set `S`, the subgroup of squares has index at most `2^#S`. This is the engine behind the unit-square index `[O_F^× : (O_F^×)²] ≤ 2ⁿ` ([`TauCeti.index_square_le_of_closure_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Group/PowMonoidHom.html#TauCeti.index_square_le_of_closure_eq_top)).

### Roadmap coverage

Layers 0–3 are done, and so are the three worked examples (`|d_{ℚ(i)}| = 4`, `h_{ℚ(√−5)} ≤ 320`, and doubling on the Gaussian lattice). Layer 1 covers the discriminant bound from a basis of integers, the ideal count, the class-number bound and the unit-square index. Layer 0's mandatory reconciliation has landed: the `box` wrapper is removed, and doubling applies to discrete submodules. Layer 2 is the effective count. Layer 3 has the explicit regulator lower bound and the full-log covolume normalization. For the volumes behind the analytic class number formula, the roadmap's own audit consumes Mathlib's existing fundamental-cone volume and residue formula rather than reproving them. The Brauer–Siegel horizon is untouched.

## The frontier

- **Sharper regulator bounds** — the proved bound is fully explicit, but it decays quickly in the degree because `N(d)` is a crude count of bounded-house integers. The README asks only for an explicit bound, so sharpening it would be new work beyond the roadmap.
- **Brauer–Siegel** — `log(h_F·R_F) ∼ log √|d_F|`, with explicit constants. This is the README's long-horizon aspiration; nothing toward it has landed, and it would need analytic input on Dedekind zeta functions well beyond the bounds here.

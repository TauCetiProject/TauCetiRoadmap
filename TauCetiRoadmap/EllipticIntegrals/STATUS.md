<!--tauceti-status:v1 {"roadmap":"EllipticIntegrals","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Milestone 1","state":"done"},{"id":"Milestone 2","state":"done"},{"id":"Milestone 3","state":"done"},{"id":"Milestone 4","state":"done"},{"id":"Milestone 5","state":"done"},{"id":"Milestone 6","state":"done"},{"id":"Milestone 7","state":"done"},{"id":"Milestone 8","state":"done"}],"readme_sha":"53065b11e211a12fa4a09c3c5bd83163cbafc6412efdfc1f950adb2904a9d089","roadmap":"EllipticIntegrals","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: EllipticIntegrals

This file documents the status of the EllipticIntegrals roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All eight milestones are proved. The last gap, Carlson's duplication theorem on the complex slit-plane domain, is now closed. The classical real theory is complete: Legendre's integrals, the AGM and Gauss–Brent–Salamin, the special values, Carlson's integrals, the real Jacobi functions with the pendulum, and the AGM formulas for the real period of an elliptic curve.

### Named results

- **Legendre's relation** — for `0 < k < 1`, `E K′ + E′ K − K K′ = π/2`. It is proved by showing that the left side has derivative zero in the modulus and taking its limit at `k → 0⁺` ([`legendre_relation`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.html#TauCeti.Real.legendre_relation)).
- **Gauss's theorem on the AGM** — `K(k) = π / (2 M(1, √(1 − k²)))`, from the integral representation `agmIntegral a b = π/2 / M(a, b)` ([`legendreK_eq_pi_div_two_mul_agm`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Gauss.html#TauCeti.Real.legendreK_eq_pi_div_two_mul_agm)).
- **The Gauss–Brent–Salamin formula** — `π = 4 M(1, 1/√2)² / (1 − ∑ 2^(n+1) cₙ²)`, which combines the AGM series for `E` with Legendre's relation ([`pi_eq_four_mul_agm_sq_div_one_sub_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/BrentSalamin.html#TauCeti.Real.pi_eq_four_mul_agm_sq_div_one_sub_tsum)).
- **Carlson's duplication theorem** — `R_F(x, y, z) = R_F((x + λ)/4, (y + λ)/4, (z + λ)/4)` with `λ = √x√y + √y√z + √z√x`, for slit-plane arguments or 0 with at most one of them 0. It is proved by analytic continuation from the nonnegative reals ([`carlsonRF_duplication`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Duplication/Complex.html#Complex.carlsonRF_duplication)).
- **The AGM formula for the real period** — the real period of a real elliptic curve is an explicit AGM, so the period in the Birch–Swinnerton-Dyer quotient can be computed with quadratic convergence. With three real roots it is `2π / M(√(e₁ − e₃), √(e₁ − e₂))` ([`realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/RealPeriod.html#WeierstrassCurve.realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots)), and the one-real-root case is [`realPeriod_eq_two_mul_pi_div_agm_of_one_real_root`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/RealPeriod.html#WeierstrassCurve.realPeriod_eq_two_mul_pi_div_agm_of_one_real_root).

### Notable definitions and infrastructure

- **The integral of the first kind as an order isomorphism** — `φ ↦ F(φ, k)` is packaged as `ℝ ≃o ℝ` ([`legendreFOrderIso`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Legendre.html#TauCeti.Real.legendreFOrderIso)). Its inverse is the amplitude [`jacobiAm`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.html#TauCeti.Real.jacobiAm), so the periods, derivatives, addition theorem and pendulum solution for `sn, cn, dn` all come from facts about `F`.
- **The AGM integral** — [`agmIntegral`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/AGM/Basic.html#TauCeti.agmIntegral) has exactly the name and statement of mathlib4#34397. Gauss's theorem, Landen's transformation and the cubic integrals behind the real period all reduce to it.
- **Carlson's integrals and their joint analyticity** — [`carlsonRF`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Basic.html#Complex.carlsonRF) and its companions are defined directly as improper integrals on slit-plane nodes. `R_F` is [analytic in its three arguments jointly](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/JointAnalytic.html#Complex.analyticAt_carlsonRF), not just in each one separately. Duplication needs this, because its right side moves all three arguments at once.

### Roadmap coverage

All eight milestones are done. Milestones 1 and 2 give the Legendre integrals' theory in the amplitude and in the modulus, up to Legendre's differential equations, the hypergeometric series and analyticity. Milestone 3 has all three limits at `k = 1`, including the logarithmic singularity of `K`, and Legendre's relation. Milestone 4 has the AGM from quadratic convergence through Gauss, Landen, the AGM series for `E` and Brent–Salamin. Milestone 5 has `K(1/√2)`, `E(1/√2)` and the lemniscate constant. Milestone 6 now has separate and joint holomorphy, duplication on the whole domain and the full Legendre dictionary, including `E(k) = 2 R_G(0, 1 − k², 1)`. Milestone 7 has the amplitude and the real `sn, cn, dn`, with `4K` as the least period of `sn`, the addition theorems, the degenerations at `k = 0` and `k → 1⁻`, and the pendulum with uniqueness and least period. Milestone 8 has the ellipse perimeter with either axis the larger, both cubic integrals, and both real-period cases.

## The frontier

- **Adopting Mathlib's AGM integral** — once mathlib4#34397 lands, `TauCeti.agmIntegral` and its evaluation `agmIntegral a b = π/2 / M(a, b)` should be replaced by Mathlib's versions, as the README plans. This should be a deletion, since the name and statement already match.
- **Retiring the open targets** — the README's "Prove" paragraphs and the acceptance file `Suggested.lean` still state as targets theorems that are now proved, among them duplication, the pendulum and the three-root period. Nothing mathematical remains within this roadmap's scope. Complex-variable Jacobi functions and the lattice side belong to other roadmaps.

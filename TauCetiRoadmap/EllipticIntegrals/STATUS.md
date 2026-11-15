<!--tauceti-status:v1 {"roadmap":"EllipticIntegrals","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Milestone 1","state":"done"},{"id":"Milestone 2","state":"done"},{"id":"Milestone 3","state":"done"},{"id":"Milestone 4","state":"done"},{"id":"Milestone 5","state":"done"},{"id":"Milestone 6","remaining":"the duplication theorem for R_F on the whole slit-plane domain; only the nonnegative real case is proved","state":"partial"},{"id":"Milestone 7","state":"done"},{"id":"Milestone 8","state":"done"}],"readme_sha":"01062a5dd8e502f24c76561073892e7ed4bc7654a5a1170e5237f0b417b429cf","roadmap":"EllipticIntegrals","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: EllipticIntegrals

This file documents the status of the EllipticIntegrals roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Seven of the eight milestones are proved. These include Legendre's relation, Gauss's AGM evaluation of `K`, the Gauss–Brent–Salamin formula, the special values, the real Jacobi functions with the pendulum, and the AGM formulas for `WeierstrassCurve.realPeriod`. Only Carlson's milestone is partial: its duplication theorem is proved at nonnegative real arguments but not on the complex slit-plane domain.

### Named results

- **Legendre's relation** — for `0 < k < 1`, `E K′ + E′ K − K K′ = π/2`. It is proved by showing that the left side has derivative zero and then taking its limit at `k → 0⁺` ([`legendre_relation`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.html#TauCeti.Real.legendre_relation)).
- **Gauss's theorem on the AGM** — `K(k) = π / (2 M(1, √(1 − k²)))`. It rests on the integral representation `agmIntegral a b = π/2 / M(a, b)` ([`legendreK_eq_pi_div_two_mul_agm`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Gauss.html#TauCeti.Real.legendreK_eq_pi_div_two_mul_agm)).
- **The Gauss–Brent–Salamin formula** — `π = 4 M(1, 1/√2)² / (1 − ∑ 2^(n+1) cₙ²)`. It combines the AGM series for `E` with Legendre's relation ([`pi_eq_four_mul_agm_sq_div_one_sub_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/BrentSalamin.html#TauCeti.Real.pi_eq_four_mul_agm_sq_div_one_sub_tsum)).
- **Gauss's lemniscate identity** — the lemniscate constant satisfies `ϖ = π / M(1, √2)`. It sits alongside `ϖ = √2 K(1/√2)` and `K(1/√2) = Γ(1/4)²/(4√π)` ([`lemniscateConstant_eq_pi_div_agm`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Lemniscate.html#TauCeti.Real.lemniscateConstant_eq_pi_div_agm)).
- **The AGM formula for the real period** — the real period of a real elliptic curve is an explicit AGM, which makes the Birch–Swinnerton-Dyer period quadratically computable. The one-real-root case is [`realPeriod_eq_two_mul_pi_div_agm_of_one_real_root`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/RealPeriod.html#WeierstrassCurve.realPeriod_eq_two_mul_pi_div_agm_of_one_real_root). The three-real-roots case, `realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots`, sits in the same file.

### Notable definitions and infrastructure

- **The integral of the first kind as an order isomorphism** — `φ ↦ F(φ, k)` is packaged as `ℝ ≃o ℝ` ([`legendreFOrderIso`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Legendre.html#TauCeti.Real.legendreFOrderIso)). Its inverse is the amplitude [`jacobiAm`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.html#TauCeti.Real.jacobiAm), so periodicity, derivatives and the addition theorem for `sn, cn, dn` all transfer from facts about `F`.
- **The AGM integral** — [`agmIntegral`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/AGM/Basic.html#TauCeti.agmIntegral) has exactly the name and statement of mathlib4#34397, so adopting Mathlib's version will be a deletion. Gauss's theorem, Landen's transformation and the cubic integrals behind the real period all reduce to it.
- **Carlson's integrals on slit-plane nodes** — [`carlsonRF`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Basic.html#Complex.carlsonRF) and its companions are defined directly as improper integrals, not through Carlson's general `R`-function. Holomorphy in each variable is proved by differentiating under the integral sign.

### Roadmap coverage

Milestones 1–5, 7 and 8 are done. Milestone 1 covers the Legendre integrals' basic API, the third-kind reductions and the imaginary modulus. Milestone 2 covers continuity, derivatives, Legendre's differential equations, the hypergeometric series and analyticity. Milestone 3 covers the logarithmic singularity and Legendre's relation. Milestone 4 covers quadratic convergence, Gauss, Landen, the AGM series for `E` and Brent–Salamin. Milestone 5 covers `K(1/√2)`, `E(1/√2)` and the three evaluations of `ϖ`. Milestone 7 covers the amplitude, `sn/cn/dn` with periods (`4K` is the least period of `sn`), the addition theorem, the degenerations and the nonlinear pendulum. Milestone 8 covers the ellipse perimeter, both cubic integrals and both real-period cases. Milestone 6 is partial. Convergence, holomorphy, positivity, symmetry, homogeneity, diagonal values, the elementary `R_C` and the Legendre dictionary are proved. The duplication theorem `carlsonRF_ofReal_duplication` holds only for nonnegative reals.

## The frontier

- **Carlson duplication on the whole domain** — extend `R_F(x, y, z) = R_F((x+λ)/4, (y+λ)/4, (z+λ)/4)` from nonnegative reals to slit-plane nodes. The principal-root node [`carlsonDuplicationLambda`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Duplication/Domain.html#Complex.carlsonDuplicationLambda) and the lemmas keeping shifted nodes in the slit plane are in place. What remains is the theorem itself, for example by analytic continuation from the real case using the separate holomorphy already proved.
- **Adopting Mathlib's AGM integral** — once mathlib4#34397 lands, `TauCeti.agmIntegral` and `agmIntegral_eq_pi_div_two_div_agm` should be replaced by Mathlib's versions, as the README plans.

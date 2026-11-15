<!--tauceti-status:v1 {"roadmap":"PolylogarithmFunctions","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"radial integrability, general disc series, rational form of negative weights, holomorphy and recursion on the cut plane, conjugation, zeta values","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"cacdcb309a0be44d392d75c8ebda699f45a1bc5a96058345c0b7cae60e194f18","roadmap":"PolylogarithmFunctions","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: PolylogarithmFunctions

This file documents the status of the PolylogarithmFunctions roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening of Layer 1 exists: the principal integer-weight polylogarithm is defined with its normalizations and convention checks, and the nonpositive weights are known to be holomorphic away from 1. The analytic theory of weights two and up, and all of Layers 2–7 (monodromy, functional equations, single-valued polylogarithms, Bloch–Wigner, Rogers, estimates), have not begun.

### Notable definitions and infrastructure

- **The principal polylogarithm** [`polylog`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog) `: ℤ → ℂ → ℂ`, defined exactly as §1.1 prescribes: `z/(1−z)` in weight zero, `−Log(1−z)` in weight one, the logarithmic radial integral `(1/k!)∫₀¹(−log t)^k(−Log(1−tz))dt/t` in weight `k+2`, and iterated Euler derivatives in negative weight. Every later layer is stated in terms of it. It vanishes at zero in every weight and agrees with Mathlib's logarithm Taylor series in weight one on the open disc.
- **Holomorphy of the negative weights** — every `Li₋ᵣ` is analytic on `ℂ∖{1}`, not just on the cut plane, so continuing these weights along paths will be trivial ([`analyticOnNhd_polylog_neg_nat`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.analyticOnNhd_polylog_neg_nat)).
- **Convention checks** — `Li₋₁(z) = z/(1−z)²` ([`polylog_neg_one`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog_neg_one)) pins the Euler operator, and `Li₁(3) = −log 2 − πi` ([`polylog_one_three`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog_one_three)) pins the lower boundary value on `[1,∞)` that every later layer relies on. No headline theorem of the roadmap has landed yet.

### Roadmap coverage

Layer 1 is partial. §1.1 (definition, defining identities, vanishing at zero, Euler recursion and its checks) is essentially done. §1.4 has holomorphy away from the pole, but not the rational form `z·A_r(z)/(1−z)^{r+1}` or discontinuity at the pole. §1.3 has only the weight-one case, which is Mathlib's theorem. §1.2 (radial integrability), §1.5 (holomorphy on `ℂ∖[1,∞)` and `z·Li′ₙ₊₁ = Liₙ`), §1.6 (conjugation) and §1.7 (closed disc, `Liₙ(1) = ζ(n)`, exponential zeta) are not started. Layers 2 through 7 are untouched.

## The frontier

- **Radial integrability (§1.2)** — show the integrand `(−log t)^k(−Log(1−tz))/t` is integrable on `[0,1]` for every `z`, with the uniform integrability estimate. Every positive-weight result above weight one depends on this.
- **The disc series (§1.3)** — `∑ z^{k+1}/(k+1)^n = Liₙ(z)` for `|z| < 1` in every integer weight, by termwise integration for `n ≥ 2` and termwise Euler differentiation for `n ≤ 0`, together with derivative 1 at 0.
- **Rationality of the negative weights (§1.4)** — the polynomials `A_r` with `A_r(1) = r!`, and the proof that `Li₋ᵣ` is not continuous at 1.
- **Holomorphy and the derivative recursion (§1.5)** — `analyticOnNhd_polylog` on `ℂ∖[1,∞)` and `z·Li′ₙ₊₁ = Liₙ`, by differentiating the parameter integral and gluing with the disc germ. This unlocks Layer 2's tower germ.
- **Zeta boundary values (§1.7)** — continuity on the closed disc and `Liₙ(1) = ζ(n)` for `n ≥ 2`, so that `Li₂(1) = π²/6` follows from Mathlib's `riemannZeta_two`.

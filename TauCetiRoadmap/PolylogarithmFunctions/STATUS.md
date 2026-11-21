<!--tauceti-status:v1 {"roadmap":"PolylogarithmFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"disc series in general weight, holomorphy and recursion on the cut plane, uniform radial integrability, closed disc and zeta values","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"positive-weight distribution and inversion, Euler reflection, five-term identity, coherent branches, exact dilogarithm values","state":"partial"},{"id":"Layer 4","remaining":"define the single-valued family and prove branch independence, real analyticity, symmetries and sphere continuity","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"2182c8caee8af6fa55f1dd7956b42008ddee0dec5335b0ac0dce5faa7a2c743e","roadmap":"PolylogarithmFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PolylogarithmFunctions

This file documents the status of the PolylogarithmFunctions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is more than half built: the principal polylogarithm, the rational form of the nonpositive weights, conjugation symmetry and radial integrability are proved, but the disc series in general weight, holomorphy on the cut plane and the zeta values at 1 are not. Layers 3 and 4 have their algebraic openings (nonpositive-weight inversion and distribution; Zagier's Bernoulli coefficients), while Layers 2, 5, 6 and 7 have not begun.

### Named results

- **Nonpositive weights are rational** — for every `r`, `Li₋ᵣ(z) = z·A_r(z)/(1−z)^{r+1}` with `A_r` the Eulerian polynomial, `A_r(1) = r!`, and `Li₋ᵣ` is never continuous at its pole 1 ([`polylog_neg_nat_eq_div`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Nonpositive.html#TauCeti.Polylog.polylog_neg_nat_eq_div), [`not_continuousAt_polylog_neg_nat_one`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Nonpositive.html#TauCeti.Polylog.not_continuousAt_polylog_neg_nat_one)).
- **Conjugation symmetry** — `Liₙ(z̄) = conj Liₙ(z)` in every integer weight off the cut `[1, ∞)`, and everywhere in nonpositive weight; on the cut it fails, as `Li₁(3)` shows ([`polylog_conj`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Conj.html#TauCeti.Polylog.polylog_conj)).
- **Radial integrability** — the integrand `(−log t)^k·(−Log(1−tz))/t` is integrable on `[0,1]` for every `z`, including the interior logarithmic singularity when `z > 1` is real, which makes the positive weights honest integrals ([`intervalIntegrable_radialIntegrand`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/RadialIntegrand.html#TauCeti.Polylog.intervalIntegrable_radialIntegrand)).
- **Inversion and distribution in nonpositive weight** — `Liₙ(z) + (−1)ⁿLiₙ(1/z)` is `−1` in weight zero and `0` below, and `Liₙ(z^m) = m^{n−1}∑ⱼLiₙ(ζⱼz)` wherever `z^m ≠ 1` ([`polylog_inversion_of_nonpos`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Inversion.html#TauCeti.Polylog.polylog_inversion_of_nonpos), [`polylog_distribution_of_nonpos`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Distribution.html#TauCeti.Polylog.polylog_distribution_of_nonpos)).
- **Monodromy cancellation** — in every weight, the parity projection of the `T₁`-monodromy change of Zagier's combination vanishes for any logarithm determination; this is the algebraic heart of branch independence, proved before the single-valued functions exist ([`ite_odd_re_im_sum_bernoulliCoeff_mul_pow_div_factorial_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/BernoulliCoeff.html#TauCeti.Polylog.ite_odd_re_im_sum_bernoulliCoeff_mul_pow_div_factorial_eq_zero)).

### Notable definitions and infrastructure

- **The principal polylogarithm** [`polylog`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog) `: ℤ → ℂ → ℂ`, defined by the roadmap's radial integral and Euler derivatives, with the lower boundary value on the cut; every later layer is stated in terms of it.
- **Zagier's Bernoulli coefficients** [`bernoulliCoeff`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/BernoulliCoeff.html#TauCeti.Polylog.bernoulliCoeff), `cₖ = 2ᵏBₖ/k!` with `B₁ = −1/2`, whose product with `eˢ` is the even series `s/sinh s`; this evenness is what makes the single-valued `Lₙ` single-valued.
- **The Eulerian polynomials** [`eulerianPolynomial`](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Eulerian.html#TauCeti.eulerianPolynomial), built by the Euler-differentiation recursion, which give the nonpositive weights in closed form.

### Roadmap coverage

Layer 1 is partial: §1.1, §1.4 (rational form, discontinuity and holomorphy off the pole) and §1.6 (conjugation) are done; §1.2 has pointwise integrability and a compact majorant on the cut plane but not uniform integrability over general bounded parameter sets; §1.3 has only weight one; §1.5 (holomorphy on `ℂ∖[1,∞)` and `z·Li′ₙ₊₁ = Liₙ`) and §1.7 (closed disc and `Liₙ(1) = ζ(n)`) are not started. Layer 3 is partial: only the nonpositive-weight halves of §3.1 and §3.2 are done; positive-weight distribution and inversion, Euler reflection, Abel's five-term identity, the coherent-branch forms and the exact dilogarithm values are not. Layer 4 is partial: §4.1 is done, and the cancellation algebra behind §§4.3 and 4.6 is in place, but `Lₙ` is not defined. Layers 2, 5, 6 and 7 are untouched.

## The frontier

- **Holomorphy and the derivative recursion (§1.5)** — `Liₙ` analytic on `ℂ∖[1,∞)` and `z·Li′ₙ₊₁ = Liₙ`, by differentiating the parameter integral with the compact majorant now available. This unlocks Layer 2's tower germ and the positive-weight halves of Layer 3.
- **The disc series (§1.3)** — `∑ z^{k+1}/(k+1)^n = Liₙ(z)` on the open disc in every weight, by termwise integration against the radial majorant for `n ≥ 2` and termwise Euler differentiation for `n ≤ 0`.
- **Zeta boundary values (§1.7)** — continuity on the closed disc and at 1, and `Liₙ(1) = ζ(n)`; blocked on the missing uniform-integrability half of §1.2.
- **Zagier's single-valued family (§4.2)** — the definition of `Lₙ` needs only §§1.1 and 4.1 and could land now; its unit-circle API waits on §1.7.
- **Positive-weight distribution and inversion (§§3.1–3.2)** — the headline `polylog_distribution` and `polylog_inversion`, which need §1.5, and for inversion also §1.7 and the principal jump of §2.4.

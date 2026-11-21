<!--tauceti-status:v1 {"roadmap":"LinearFormsInLogarithms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"division by a coordinate (0.5), including analyticAt_dslope_update","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","remaining":"Taylor coefficients of exponential monomials, mvTaylorCoeff_prod_pow_mul_cexp (2.1)","state":"partial"},{"id":"Layer 3","remaining":"Liouville's inequality (3.1), sizes (3.2), the field of the data (3.3), Siegel's lemma with a constant (3.5)","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"6.1, 6.2, Hermite-Lindemann (6.3), and the principal-branch and quotient-of-logarithms forms of 6.4","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b6271aa412fbb99426f13f9c7e6dacbcd810c221798fead5c76e62a76eb53467","roadmap":"LinearFormsInLogarithms","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: LinearFormsInLogarithms

This file documents the status of the LinearFormsInLogarithms roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations are mostly laid. Layer 0's multi-index power series are done except for division by a coordinate. Layer 2 has its growth bound and linear independence. Layer 3 has the Thue–Siegel lemma, and Layer 6 has a branch-free Gelfond–Schneider theorem, proved by Gelfond's own method. The polydisc estimates, the auxiliary function, the Schneider–Lang criterion, Baker's theorem and its `p`-adic counterpart have not begun.

### Named results

- **The Gelfond–Schneider theorem** — `TauCeti.transcendental_exp_mul`: if `x ≠ 0`, `exp x` is algebraic, and `b` is algebraic and irrational, then `exp (b x)` is transcendental. It carries the name and statement of 6.4. It is proved by Gelfond's one-variable method rather than as a corollary of the criterion.
- **Linear independence of exponential polynomials** — [`eq_zero_of_sum_eval_mul_cexp`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/ExpPolynomial/LinearIndependence.html#TauCeti.eq_zero_of_sum_eval_mul_cexp): if `∑ P_w(z) exp(w · z)` vanishes on all of `ℂⁿ` and the frequencies are distinct, every polynomial `P_w` is zero. This is target 2.3, in one and several variables.
- **The Thue–Siegel lemma** — [`exists_ne_zero_int_vec_norm_le_of_pow_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ThueSiegel.html#TauCeti.ThueSiegel.exists_ne_zero_int_vec_norm_le_of_pow_le): when a pigeonhole count allows, finitely many complex linear forms are simultaneously small at a nonzero integer vector of bounded size. This is Waldschmidt's Lemma 4.12, and the real form of Lemma 4.11 accompanies it ([`exists_ne_zero_int_vec_abs_le_of_pow_lt`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ThueSiegel.html#TauCeti.ThueSiegel.exists_ne_zero_int_vec_abs_le_of_pow_lt)).
- **Multi-index expansion of an analytic function** — [`hasSum_mvCoeff`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/MultiIndex/Coeff.html#HasFPowerSeriesOnBall.hasSum_mvCoeff): on a polydisc where its power series converges, an analytic function on `ι → 𝕜` is the normally convergent sum of `(∏ zᵢ ^ αᵢ) • mvCoeff p α`. The converse direction is [`exists_hasFPowerSeriesOnBall_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/MultiIndex/Coeff.html#TauCeti.exists_hasFPowerSeriesOnBall_tsum).
- **Sums of power series** — [`hasFPowerSeriesOnBall_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/InfiniteSum.html#TauCeti.hasFPowerSeriesOnBall_tsum): a family of functions with power series on a common ball can be summed term by term under a joint summability condition. This is target 0.2.

### Notable definitions and infrastructure

- **Multi-index coefficients** — [`mvCoeff`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/MultiIndex/Coeff.html#FormalMultilinearSeries.mvCoeff) reads off the coefficient of `∏ zᵢ ^ αᵢ` from a formal multilinear series. Cauchy's inequalities (1.4) will be stated through it.
- **Multi-index Taylor coefficients** — [`mvTaylorCoeff`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/MultiIndex/TaylorCoeff.html#TauCeti.mvTaylorCoeff) is the coefficient of `(z - x) ^ α` in the expansion about `x`, and `0` off the analytic locus. It has the product rule, translation, locality, agreement with iterated derivatives up to `α!`, and invariance of vanishing in each total degree under linear changes of variables. Layers 1, 2 and 5 are stated in it.
- **Mixed partial derivatives on `ℂⁿ`** — `TauCeti.Baker.mDeriv` comes with a Leibniz formula for exponential monomials, which is Waldschmidt's Lemma 4.9 in derivative form. It is a starting point for 2.1, which asks for that lemma in `mvTaylorCoeff` form.

### Roadmap coverage

Layer 0 is done except for 0.5, division by a coordinate: products of series (0.1), sums of power series (0.2), `mvCoeff` (0.3) and `mvTaylorCoeff` (0.4) are all in place with their checks. Layer 2 is partial: growth (2.2) and linear independence (2.3) are done, while the Taylor-coefficient formula for exponential monomials (2.1) is absent. Layer 3 is partial: the Thue–Siegel lemma (3.4) is done, but Liouville's inequality (3.1), sizes (3.2), the field of the data (3.3) and Siegel's lemma with a constant (3.5) are absent. Layer 6 is partial only because the branch-free 6.4 statement exists. Corollaries 6.1 and 6.2, Hermite–Lindemann (6.3), the principal-branch form and the quotient-of-logarithms form of 6.4 are absent. Layers 1, 4, 5, 7 and 8 are untouched.

## The frontier

- **Division by a coordinate (0.5)** — the factorisation `f (x + z) = z i ^ m • g z` with `g` analytic, and the analyticity of the divided difference `analyticAt_dslope_update`. This is the last step of Layer 0, and the Schwarz lemma for Cartesian products (1.6) needs it.
- **Polydisc estimates (1.3–1.5)** — the one-variable Schwarz lemma for a zero of order `T` needs only Mathlib, and Cauchy's inequalities in multi-index form are now stateable through `mvCoeff`. Truncated Taylor interpolation (1.5) then follows. With 3.4 done, 1.4 and 1.5 are all that the auxiliary function (4.1) still waits on.
- **Taylor coefficients of exponential monomials (2.1)** — the closed formula for `mvTaylorCoeff` of `(∏ zᵥ ^ τᵥ) exp (w · z)`. Its prerequisites, 0.1 and 0.4, are in place.
- **The rest of Layer 3** — Liouville's inequality via the house (3.1, 3.2), the field of the data (3.3) and Siegel's lemma with a constant (3.5). They need only Mathlib, and they are all that Layer 8 takes from the rest of the roadmap.
- **The rest of 6.4** — `GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational` and `exists_rat_eq_div_or_transcendental`. Both should follow from the existing branch-free theorem without the criterion.

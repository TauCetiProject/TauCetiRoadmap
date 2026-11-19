<!--tauceti-status:v1 {"roadmap":"LinearFormsInLogarithms","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"multi-index coefficients mvCoeff (0.3), Taylor coefficients mvTaylorCoeff (0.4), division by a coordinate (0.5)","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"6.1, 6.2, Hermite-Lindemann (6.3), and the principal-branch and quotient-of-logarithms forms of 6.4","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"972f341fe4b3a125ba626668814e8e9d7105dde07c39e202cd0eb9fca28c8c39","roadmap":"LinearFormsInLogarithms","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: LinearFormsInLogarithms

This file documents the status of the LinearFormsInLogarithms roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** This roadmap has barely begun. In Layer 0, the two summation lemmas (0.1 and 0.2) are proved, but the multi-index coefficients they lead to are not. In Layer 6, the branch-free Gelfond–Schneider theorem is in Tau Ceti, proved by Gelfond's one-variable method rather than from the criterion. Nothing else is in place: the polydisc estimates, exponential polynomials, the arithmetic layer, the auxiliary function, the Schneider–Lang criterion, Baker's theorem and its `p`-adic counterpart.

### Named results

- **Sums of power series** — [`hasFPowerSeriesOnBall_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/InfiniteSum.html#TauCeti.hasFPowerSeriesOnBall_tsum): suppose a family of functions has power series on a common ball, and the coefficient norms, weighted by the radius to the degree, are summable over degree and index together. Then the sum has the summed series as its power series on that ball. This is target 0.2.
- **The Gelfond–Schneider theorem** — `TauCeti.transcendental_exp_mul`: if `x ≠ 0` and `exp x` is algebraic, and `b` is algebraic and irrational, then `exp (b x)` is transcendental. It carries the name and statement of 6.4. It is proved by Gelfond's method, so it is not the corollary of the criterion that the roadmap builds toward. A principal-branch form, `TauCeti.transcendental_cpow`, comes with it.

### Notable definitions and infrastructure

- **Finite products of absolutely convergent series** — `TauCeti.prod_tsum_of_summable_norm` gives `∏ i, ∑' b, f i b = ∑' x, ∏ i, f i (x i)` for finitely many absolutely summable families. This is 0.1, the identity that will expand products of one-variable series into multi-index series.
- **Mixed partial derivatives on `ℂⁿ`** — `TauCeti.Baker.mDeriv` comes with the Leibniz formula for exponential monomials, `mDeriv_monomial_mul_exp`. This is Waldschmidt's Lemma 4.9 in derivative form. The roadmap wants that lemma in coefficient form, through `mvTaylorCoeff` (2.1), so this is a starting point rather than the milestone.

### Roadmap coverage

Layer 0 is partial: 0.1 and 0.2 are done, while the multi-index coefficient `mvCoeff` (0.3), the Taylor coefficient `mvTaylorCoeff` (0.4) and division by a coordinate (0.5) are absent. Layer 6 is partial only because the branch-free 6.4 statement exists. Corollaries 4.3 and 4.4 (6.1, 6.2), Hermite–Lindemann (6.3), the Mathlib-named principal-branch form and the rational-or-transcendental quotient of logarithms (both 6.4) are all absent. Layers 1–5, 7 and 8 are untouched. Tau Ceti has neighbouring results, but none in the form a milestone asks for: a Schwarz estimate on the kernel of a jet, close to 1.3, and a number-field Siegel lemma with integer unknowns, which is not 3.5's form with a field constant.

## The frontier

- **Multi-index coefficients (0.3–0.5)** — the definitions `mvCoeff` and `mvTaylorCoeff`, with the identity theorem, the product rule and the local expansion. 0.1 and 0.2 are their only prerequisites, and both are now in place. Everything in Layers 1, 2, 4 and 5 waits on this.
- **Layer 3 arithmetic** — Liouville's inequality via the house (3.1, 3.2), the field of the data (3.3), the Thue–Siegel lemma for small values of linear forms (3.4) and Siegel's lemma with a constant (3.5). This needs only Mathlib, and it also unblocks Layer 8.
- **Schwarz's lemma for a zero of order `T` (1.3)** — a short derivation from Mathlib's `Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`, needing nothing from Layer 0. The jet-kernel estimate already in Tau Ceti uses the same argument.
- **The rest of 6.4** — `GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational`, stated with `∀ i j : ℤ, b ≠ i / j`, and `exists_rat_eq_div_or_transcendental`. Both should follow from the existing branch-free theorem without the criterion.
- **The `p`-adic exponential on its disc (8.1)** — the `PadicExp` facts for a complete normed field over `ℚ_[p]`. The roadmap notes that the deep-unit exponential for finite extensions does not cover `ℂ_[p]`.

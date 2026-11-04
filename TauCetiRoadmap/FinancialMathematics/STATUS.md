<!--tauceti-status:v1 {"roadmap":"FinancialMathematics","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: FinancialMathematics

This file documents the status of the FinancialMathematics roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The analytic core of M0.4 is in place: the closed-form call and put prices, their risk-neutral expectation formulas, put–call parity, the Black–Scholes equation and the Greeks. The stochastic market of M0.1–M0.3 has not begun. That market covers the asset SDE, self-financing trading, the equivalent martingale measure, completeness and replication.

### Named results

- **The Black–Scholes call and put formulas.** The discounted Gaussian expectation of `(S_τ − K)⁺` is `sΦ(d₊) − Ke^{−rτ}Φ(d₋)`, where `S_τ` is the lognormal risk-neutral terminal spot. The put payoff `(K − S_τ)⁺` gives the matching put formula. ([`riskNeutralPrice_call`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Basic.html#TauCeti.BlackScholes.riskNeutralPrice_call), [`riskNeutralPrice_put`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Basic.html#TauCeti.BlackScholes.riskNeutralPrice_put))
- **The Black–Scholes equation.** Both closed-form prices, in calendar time, satisfy `V_t + σ²s²/2·V_ss + r(sV_s − V) = 0` for `s > 0` and `t < T`. This needs only `σ ≠ 0`. ([`callPrice_pde`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Greeks.html#TauCeti.BlackScholes.callPrice_pde), [`putPrice_pde`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Greeks.html#TauCeti.BlackScholes.putPrice_pde))
- **Put–call parity.** For the closed forms, `C − P = s − Ke^{−rτ}`. ([`callPrice_sub_putPrice`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Basic.html#TauCeti.BlackScholes.callPrice_sub_putPrice))
- **Bounds on delta.** The call delta is `Φ(d₊)` and lies strictly in `(0, 1)`. The put delta lies in `(−1, 0)`. Gamma and vega are positive for both options when `σ > 0`. ([`deriv_callPrice_spot_mem_Ioo`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Greeks.html#TauCeti.BlackScholes.deriv_callPrice_spot_mem_Ioo))

### Notable definitions and infrastructure

- **The risk-neutral pricing functional.** [`riskNeutralPrice`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Basic.html#TauCeti.BlackScholes.riskNeutralPrice) is the discounted expectation `e^{−rτ}E[h(S_τ)]` against a standard Gaussian. It is a defined integral, not yet linked to any market model or measure change.
- **Gaussian exponential tilting.** [`setIntegral_exp_mul_gaussianReal`](https://taucetiproject.org/docs/TauCeti/Probability/Distributions/Tilted.html#TauCeti.Probability.setIntegral_exp_mul_gaussianReal) says that integrating `e^{tx}` over a set against `N(m, v)` gives the moment-generating function times the mass of that set under `N(m + vt, v)`. This is the stock-numéraire change behind the call formula.
- **The density identity.** [`mul_gaussianPDFReal_dPlus`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Basic.html#TauCeti.BlackScholes.mul_gaussianPDFReal_dPlus) proves `sφ(d₊) = Ke^{−rτ}φ(d₋)`. This makes the `d₊`/`d₋` terms cancel in every Greek.

### Roadmap coverage

The README's milestones are M0.1–M0.4; the plan lists no machine-tracked layers. **M0.4 is partial.**

- **Done in M0.4:** the formulas, the PDE, parity, the payoff expectation, exact delta, gamma, vega and maturity derivatives, and the sign statements.
- **Missing from M0.4:** self-financing replication; the continuous extension to `t = T`; the uniqueness class under linear growth; the boundary values at `s = 0` and the far-field limits; the bond-holding formulas; and the `τ↓0` behaviour of gamma, including the `√τ`-rescaled blow-up at the money.

**M0.1, M0.2 and M0.3 are untouched.** These cover GBM as a strong SDE solution, strategies and self-financing, the Girsanov density, completeness and no-arbitrage, and the self-financing PDE derivation. The library contains no stochastic-integral or Itô layer for them to stand on.

## The frontier

- **Black–Scholes boundary and limit API.** This means the call and put values at `s = 0`, the far-field limits, the continuous extension to maturity by the payoffs, and gamma tending to `0` away from the strike and blowing up like `1/(Kσ√(2πτ))` at it. All of this is deterministic analysis on the existing closed forms.
- **Bond holdings and delta-hedge algebra.** This means the call and put bond holdings `b = −Ke^{−rτ}Φ(d₋)/β_t` and their put analogue. Combined with the PDE, these give the deterministic drift-matching statement the suggested file pins.
- **Uniqueness of the Black–Scholes price.** This means uniqueness in the linear-growth classical class via stopped Itô on `[1/n, n]` and GBM moment bounds. It needs Itô's formula and GBM moments from StochasticCalculus.
- **M0.1 asset and trading contracts.** This means the GBM/linear-SDE identification and the self-financing definition with its simple-strategy formula. It is blocked on StochasticCalculus S3 (stochastic integrals) and S9.4 (linear SDEs).
- **M0.2 completeness and no arbitrage.** This means the true-martingale density, the Brownian motion under `Q`, replication of `L²` claims, and the absence of arbitrage. It is blocked on StochasticCalculus S6.1 (martingale representation) and S7.4 (Girsanov), and on M0.1.

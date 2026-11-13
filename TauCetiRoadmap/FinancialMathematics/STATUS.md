<!--tauceti-status:v1 {"roadmap":"FinancialMathematics","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
# Status: FinancialMathematics

This file documents the status of the FinancialMathematics roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** M0.4, the analytic Black–Scholes layer, is done except for self-financing replication. That step waits on a stochastic integral, which the library does not yet have. M0.1–M0.3 are partial: the bond, explicit geometric Brownian motion, simple strategies, constant-drift Girsanov, simple-strategy no-arbitrage and PDE uniqueness are in place. Completeness, general replication and PDE existence have not begun.

### Named results

- **Uniqueness of the Black–Scholes price** — a classical solution of the Black–Scholes equation with linear growth `|C| ≤ A(1 + s)` and the call payoff at maturity is the closed-form call price ([`eq_callValue_of_pde`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Uniqueness.html#TauCeti.BlackScholes.eq_callValue_of_pde); the put is analogous). It is proved by a PDE comparison principle, not by stopped Itô.
- **The comparison principle for the pricing equation** — for bounded volatility and rate, a linear-growth subsolution lying below a supersolution at maturity stays below it throughout ([`le_of_pde_le_of_terminal_le`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Comparison.html#TauCeti.Finance.le_of_pde_le_of_terminal_le)). It comes from a whole-line parabolic maximum principle in log spot.
- **The Black–Scholes price as a conditional expectation** — under the risk-neutral measure `Q`, the extended call at `(S_u, T − u)` equals `e^{−r(T−u)} E_Q[(S_T − K)⁺ | ℱ_u]` ([`callValue_eq_condExp_tilted_geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/ConditionalPrice.html#TauCeti.Probability.IsFilteredPreBrownianReal.callValue_eq_condExp_tilted_geometricBrownianMotion)). The discounted value process is a square-integrable `Q`-martingale that converges to the payoff.
- **Girsanov's theorem for a constant drift** — tilting by `exp(−κW_T − κ²T/2)` makes `W_t + κ min(t, T)` a Brownian motion ([`sub_mul_min_tilted_mul_eval`](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/Girsanov.html#TauCeti.Probability.IsFilteredPreBrownianReal.sub_mul_min_tilted_mul_eval)). The augmented natural filtrations of `W` and `W + κt` [agree](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/NaturalFiltration.html#ProbabilityTheory.IsPreBrownianReal.rightCont_nullAugment_natural_add_drift_tilted).
- **No arbitrage with simple strategies** — in the Black–Scholes market, no self-financing simple stock/bond strategy is an arbitrage ([`not_isArbitrage_geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/NoArbitrage.html#TauCeti.Probability.IsFilteredPreBrownianReal.not_isArbitrage_geometricBrownianMotion)).

### Notable definitions and infrastructure

- **Simple strategies and self-financing.** [`IsSelfFinancing`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/SimpleStrategy/Basic.html#TauCeti.Finance.IsSelfFinancing) is defined for simple stock/bond strategies, and it is proved equivalent to the wealth identity `V_t = V₀ + ∫a dS + ∫b dβ` with elementary integrals. This is the setting for the arbitrage and static-claim results.
- **Geometric Brownian motion.** [`geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/Geometric/Basic.html#TauCeti.Probability.geometricBrownianMotion) is the explicit formula, with its [real moments](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/Geometric/Basic.html#ProbabilityTheory.IsPreBrownianReal.integral_rpow_geometricBrownianMotion), Markov property and an integrable running maximum. These moment bounds remove localisation for linear-growth prices.
- **The weighted log-spot pricing operator.** [`weightedLogSpotPricingOperatorL`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Pricing/Operator.html#TauCeti.Finance.weightedLogSpotPricingOperatorL) is the pricing operator conjugated by the weight `1 + e^y`. It acts as a bounded map between parabolic Hölder spaces and has an a priori bound and uniqueness. This is the setting for M0.3's general existence target.

### Roadmap coverage

The plan lists no machine-tracked layers; the README's milestones are M0.1–M0.4.

- **M0.4 is done except replication.** It has the formulas, the PDE, parity, the risk-neutral expectation, the Greeks with signs, the bond holdings, the boundary and far-field limits, the continuous extension to maturity, the gamma limits as `τ↓0`, and uniqueness. Self-financing replication of the call and put is missing, although the hedge's predictability and time integrability are already proved.
- **M0.1 is partial.** The [money-market account](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Bond.html#TauCeti.Finance.bondPrice), constant-coefficient GBM given by its formula, and simple strategies with the simple-strategy formula are done. The linear SDE with progressive coefficients, and self-financing via stochastic integrals, are not.
- **M0.2 is partial.** It has the density and Girsanov, equality of the filtrations, no arbitrage for simple strategies, and the scaled static-claim arbitrage. Martingale representation, completeness, `L²` replication and the variable-coefficient extension are missing.
- **M0.3 is partial.** It has the step from the along-path equation to the pointwise equation, linear-growth uniqueness for bounded coefficients, and the weighted Hölder-class uniqueness. The necessity theorem itself (which needs Itô), `Q`-based sufficiency and general Schauder existence are missing.

## The frontier

- **A stochastic integral against Brownian motion and GBM.** This is the common blocker for general self-financing (M0.1), replication (M0.2–M0.4) and the PDE necessity theorem (M0.3). Elementary integrands and a left-endpoint approximation exist, but the integral itself does not. It belongs to StochasticCalculus S3.
- **Black–Scholes replication.** The delta hedge's predictability and integrability, the drift-matching identity and the martingale value process are all present. What remains is the Itô step showing that the hedge is self-financing with terminal value the payoff.
- **Completeness in the constant-coefficient market.** This means replicating every claim with `e^{−rT}H ∈ L²(Q)` and proving uniqueness of its value. It needs martingale representation (StochasticCalculus S6.1) on the natural filtration, whose invariance under the measure change is already proved.
- **General PDE existence.** This means existence in the weighted `C^{2+α,1+α/2}` class for the log-spot operator, where uniqueness is already proved. It consumes the PDE Lane F27 Schauder theorem.
- **GBM as an SDE solution.** This means identifying the explicit process as the unique strong solution of `dS = μS dt + σS dW` with progressive coefficients, which is StochasticCalculus S9.4's linear-SDE theorem.

<!--tauceti-status:v1 {"roadmap":"FinancialMathematics","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"global clearing for x(1 - H(x)) = y, the feedback volatility and its pricing equation, and the consistency of reference demand","state":"untouched"},{"id":"Layer 2","remaining":"finite smooth claim families with deterministic weights, continuous expiry and the literal cutoff price-slice model","state":"untouched"},{"id":"Layer 3","remaining":"smoothing thresholds, the local nonlinear solution and perturbation, noncompact comparison and full-market sufficiency","state":"untouched"},{"id":"Layer 4","remaining":"local least-squares implied-volatility fits and the fixed-cutoff limit","state":"untouched"},{"id":"Layer 5","remaining":"log-price and residual-cash coordinate identities, feedback system estimates and the exact positive asset identity","state":"untouched"}],"readme_sha":"11df6b6210e0cc1c5b752a50db0f8dada7d1020321f264b905fe07165d920115","roadmap":"FinancialMathematics/MarketImpact","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: FinancialMathematics

This file documents the status of the FinancialMathematics roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** M0.4, the analytic Black–Scholes layer, is done except for self-financing replication, which waits on a stochastic integral the library does not yet have. M0.1–M0.3 are partial. The bond and its trading integral, explicit geometric Brownian motion, simple strategies and their approximation, constant-drift Girsanov, simple-strategy no-arbitrage and PDE uniqueness are in place. Completeness, general replication and PDE existence have not begun, and nothing has begun in the MarketImpact sub-roadmap.

### Named results

- **Uniqueness of the Black–Scholes price** — a classical solution of the Black–Scholes equation with linear growth `|C| ≤ A(1 + s)` and the call payoff at maturity is the closed-form call price ([`eq_callValue_of_pde`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/Uniqueness.html#TauCeti.BlackScholes.eq_callValue_of_pde); the put is analogous).
- **The comparison principle for the pricing equation** — for bounded volatility and rate, a linear-growth subsolution that lies below a supersolution at maturity stays below it throughout ([`le_of_pde_le_of_terminal_le`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Comparison.html#TauCeti.Finance.le_of_pde_le_of_terminal_le)).
- **The Black–Scholes price as a conditional expectation** — under the risk-neutral measure `Q`, the extended call at `(S_u, T − u)` equals `e^{−r(T−u)} E_Q[(S_T − K)⁺ | ℱ_u]` ([`callValue_eq_condExp_tilted_geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/ConditionalPrice.html#TauCeti.Probability.IsFilteredPreBrownianReal.callValue_eq_condExp_tilted_geometricBrownianMotion)).
- **Girsanov's theorem for a constant drift** — tilting by `exp(−κW_T − κ²T/2)` makes `W_t + κ min(t, T)` a Brownian motion ([`sub_mul_min_tilted_mul_eval`](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/Girsanov.html#TauCeti.Probability.IsFilteredPreBrownianReal.sub_mul_min_tilted_mul_eval)). The augmented natural filtrations of `W` and `W + κt` [agree](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/NaturalFiltration.html#ProbabilityTheory.IsPreBrownianReal.rightCont_nullAugment_natural_add_drift_tilted).
- **No arbitrage with simple strategies** — in the Black–Scholes market, no self-financing simple stock/bond strategy is an arbitrage ([`not_isArbitrage_geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/BlackScholes/NoArbitrage.html#TauCeti.Probability.IsFilteredPreBrownianReal.not_isArbitrage_geometricBrownianMotion)).

### Notable definitions and infrastructure

- **Simple strategies and their approximation.** [`IsSelfFinancing`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/SimpleStrategy/Basic.html#TauCeti.Finance.IsSelfFinancing) is proved equivalent to the elementary wealth identity `V_t = V₀ + ∫a dS + ∫b dβ`. A predictable holding with finite weighted square energy is an [almost-sure limit of bounded finite-grid simple holdings](https://taucetiproject.org/docs/TauCeti/Probability/Finance/SimpleStrategy/WeightedApproximation.html#MeasureTheory.IsStronglyPredictable.exists_seq_simpleHolding_ae_tendsto_lintegral_mul_enorm_sub_sq).
- **The bond's Stieltjes measure.** With a continuous short rate, the bond price has [a signed Stieltjes measure with density `rβ`](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Bond/Trading.html#TauCeti.Finance.vectorMeasureIcc_bondPrice). Integrating a holding against it gives that holding's interest income and agrees with simple-strategy gains, so the bond leg `∫b dβ` is defined for general holdings.
- **Geometric Brownian motion.** [`geometricBrownianMotion`](https://taucetiproject.org/docs/TauCeti/Probability/BrownianMotion/Geometric/Basic.html#TauCeti.Probability.geometricBrownianMotion) is given by its explicit formula, with all real moments, the Markov property and an integrable running maximum.

### Roadmap coverage

The umbrella's milestones are M0.1–M0.4, which are not machine-tracked.

- **M0.4 is done except replication.** It has the formulas, the PDE, parity, the risk-neutral expectation, the Greeks with signs and exact vega and gamma formulas, the bond holdings, the boundary and far-field limits, the extension to maturity, the gamma and vega limits as `τ↓0`, and uniqueness. Self-financing replication of the call and put is missing.
- **M0.1 is partial.** The money-market account, its pathwise trading integral, constant-coefficient GBM given by its formula, simple strategies and their weighted approximation are done. The linear SDE with progressive coefficients and the stochastic integral `∫a dS` are not.
- **M0.2 is partial.** It has the constant-drift density and Girsanov, equality of the filtrations, simple-strategy no-arbitrage, the scaled static-claim arbitrage and [predictable versions of bounded progressive coefficients](https://taucetiproject.org/docs/TauCeti/Probability/Finance/Coefficients.html#MeasureTheory.IsStronglyProgressive.exists_isStronglyPredictable_marketCoefficients). Martingale representation, completeness, `L²` replication and the rest of the variable-coefficient extension are missing.
- **M0.3 is partial.** The along-path-to-pointwise step and uniqueness in the linear-growth and weighted Hölder classes are done. The Itô necessity theorem, `Q`-based sufficiency and Schauder existence are missing.
- **MarketImpact is untouched.** None of its five layers has any Lean development yet.

## The frontier

- **The stochastic integral against Brownian motion and GBM.** It is the common blocker for general self-financing (M0.1), replication (M0.2–M0.4) and PDE necessity (M0.3). The simple-holding approximation is now in place; the isometry and the limit integral are not. It belongs to StochasticCalculus S3.
- **Black–Scholes replication.** The hedge's predictability, the drift-matching identity and the martingale value process are present. What remains is the Itô step showing that the delta hedge is self-financing with the payoff as its terminal value.
- **Completeness.** In the constant-coefficient market this means replicating every claim with `e^{−rT}H ∈ L²(Q)`. That needs martingale representation (StochasticCalculus S6.1). The variable-coefficient version also needs a true-martingale density for random `κ` and the transfer of the representation to `Q`.
- **Global clearing for MarketImpact.** Layer 1's `global_clearing`, a unique positive root of `x(1 − 𝓗(x)) = y` under a derivative margin, is one-variable real analysis. It needs no stochastic integral, which makes it the nearest MarketImpact target.
- **General PDE existence.** This is existence in the weighted `C^{2+α,1+α/2}` class, where uniqueness is already proved. It consumes the PDE Lane F27 Schauder theorem.

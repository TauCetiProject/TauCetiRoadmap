# Financial mathematics: one-factor markets and replication

This roadmap owns one-factor asset markets, self-financing trading, replication and the Black–Scholes theorem. [MarketImpact](MarketImpact/README.md) consumes this foundation and owns endogenous demand, equilibrium feedback, coupled pricing and its numerical models.

## Conventions

Time is calendar time t∈[0,T], T>0, and spot is s>0. Write C(s,t), with spot first, as in the Lean `Price` type. Remaining-maturity notation is f(s,τ)=C(s,T−τ). Asset drift is μ_S; income drift in MarketImpact is μ_Y; the MarketImpact source notation μ₁ is its model-specific instance. Holdings (a,b) mean numbers of stock and bond shares. The bond price is β, and bβ is the bond part of wealth. The market price of risk is κ; it is not a holding.

Work on a filtered probability space with the usual conditions and Brownian motion relative to that filtration. State filtration-relative increment independence; a native Brownian marginal-law predicate alone does not supply it. Equivalence of measures preserves completed null sets on the finite horizon.

## M0.1. Assets and trading

Let r_t be deterministic continuous, β₀>0 and β_t=β₀ exp(∫₀ᵗr_u du). For progressively measurable real μ_t,σ_t with ∫₀ᵀ(|μ_t|+σ_t²)dt<∞ almost surely, construct the unique strong solution of

`dS_t=μ_t S_t dt+σ_t S_t dW_t`,

for a positive F₀-measurable S₀, and prove

`S_t=S₀ exp(∫₀ᵗ(μ_u−σ_u²/2)du+∫₀ᵗσ_u dW_u)>0`.

No initial moment assumption is needed for existence/positivity. Moment estimates carry their own hypotheses. Consume [StochasticCalculus S9.4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1030)'s progressively measurable linear-SDE theorem, including its stochastic-integrand/localization and stopped integrating-factor uniqueness proofs. M0.1 supplies the positive asset initial value and the financial coefficient hypotheses, and identifies the resulting asset process. This includes σ_t=0, time-dependent deterministic coefficients and constant GBM. Trading, self-financing and admissibility remain financial contracts.

A strategy is a predictable pair (a_t,b_t) with stochastic integrability against S and pathwise integrability against β. Wealth is V_t=a_t S_t+b_t β_t. Define self-financing by

`V_t=V₀+∫₀ᵗa_u dS_u+∫₀ᵗb_u dβ_u`

simultaneously in t, after selecting continuous versions. Prove the simple-strategy formula for a_t=Σ_j a_{t_{j−1}}1_(t_{j−1},t_j], where a_{t_j} is F_{t_j}-measurable and supplies the following interval. Approximation and integral congruence give the general formula. Negative a means short stock; negative b means borrowing. Specify initial cost, terminal payoff and scaling of strategies. Trading costs and dividends are absent in this market.

## M0.2. Equivalent measure, completeness and no arbitrage

For constants r,μ_S and σ≠0, use β_t=e^{rt} and the augmented natural filtration of W. Put κ=(μ_S−r)/σ and

`Z_T=exp(−κW_T−κ²T/2)`, `dQ=Z_T dP`.

Prove that Z is a true positive martingale on [0,T], Q is an equivalent probability and W^Q_t=W_t+κt is Brownian under Q. Prove that the augmented natural filtrations of W and W^Q agree; deterministic path translation is invertible and P,Q have the same null sets. Consume S6.1's natural-Brownian L² martingale representation under Q on that filtration. An arbitrary larger filtration carrying Brownian motion is not declared complete.

The baseline admissible class consists of self-financing integrable strategies whose discounted wealth is a true square-integrable Q-martingale. Prove closure under finite linear combinations. For every F_T-measurable real claim H with e^{−rT}H∈L²(Q), construct its predictable replicating strategy, including the bond holding, and prove uniqueness of the value process

`V_t=e^{rt} E_Q[e^{−rT}H | F_t]`.

Define arbitrage as zero initial cost, nonnegative terminal wealth almost surely, and strictly positive terminal wealth with positive probability. Prove its absence in the baseline admissible class. Prove law of one price and the static-claim extension: if both signs of a claim can be traded at price p and the stock/bond replication costs q, p≠q gives a zero-cost arbitrage after placing the surplus in the bond. With unrestricted position scaling, the family of N-fold strategies yields unbounded sure profit; one fixed trade yields only its fixed surplus. State the scaling premise explicitly. This does not impose the baseline martingale condition on a mispriced added claim by definition.

Extend the completeness and pricing theorem to progressively measurable coefficients on the same augmented natural P-Brownian filtration. On each finite horizon assume deterministic constants `0<δ_σ≤C_σ<∞` and `K_κ≥0` with `δ_σ≤|σ_t|≤C_σ` and `|κ_t|≤K_κ` for Lebesgue-time×P almost every (t,ω), deterministic continuous r, and `κ_t=(μ_t−r_t)/σ_t` on this full-measure set. Consume StochasticCalculus S3.4 to choose predictable-equivalent versions of progressive σ and κ before forming the stochastic integrals, preserving the coefficient identities almost everywhere. Construct `Z=exp(−∫κdW−½∫κ²dt)`, prove it is a strictly positive true martingale, and define Q on the full horizon. Prove predictable representation under Q on the original filtration by the density/Bayes and Itô-product transformation of the P-representation, with localization for intermediate products. For random κ, do not infer that the natural filtrations of W and `W^Q=W+∫κdt` coincide. For F_T-measurable real H with `H/β_T∈L²(Q)` construct the Q-martingale `M_t=E_Q[H/β_T|F_t]`, its integrand h, wealth `V=βM`, and holdings `a=βh/(Sσ)`, `b=(V−aS)/β`. Verify predictable representatives and integrability under P as well as Q, self-financing and terminal convergence. Export the same no-arbitrage, uniqueness and static-claim results in this class. This theorem supplies variable-coefficient consumers; extensions from stopped/local coefficient bounds require separately proved full-horizon nonexplosion, true density and integrability conditions.

## M0.3. Classical price and the self-financing PDE

For deterministic continuous Markov coefficients μ_S(s,t),σ(s,t), r_t, assume a positive nonexplosive strong solution from every deterministic start (s₀,t₀). Let C be C^{2,1} on s>0, t<T, with derivatives continuous there and the stated terminal extension. Replication here means V_t=C(S_t,t) simultaneously throughout [t₀,T), almost surely, not merely equality at maturity.

On an open pricing domain where σ(s,t)≠0, identify a=C_s by the martingale part, set b=(C−sC_s)/β, and derive the necessary pointwise equation

`C_t+(σ(s,t)²s²/2)C_{ss}+r_t(sC_s−C)=0`.

First obtain the identity dt×P-almost everywhere along each solution. Continuity and the all-start hypothesis give the value at each starting point. A single initial trajectory supplies only the along-path statement. Conversely, only use a Q-based sufficiency criterion after M0.2 has constructed an equivalent measure Q on the declared filtration with the needed true-density and predictable-representation properties (including its variable-coefficient hypotheses when applicable). Under those hypotheses, use the following sufficient admissibility conditions: the candidate holdings have predictable representatives, are stochastically integrable against S and pathwise integrable against β on the full horizon, `C(S_t,t)/β_t` extends to a true square-integrable Q-martingale on [t₀,T], and `C(S_t,t)→h(S_T)` almost surely as t↑T. Prove replication with terminal value h(S_T), and identify its value with M0.2’s conditional price. Supply a usable derivative/moment criterion implying these conditions; for example `|C|+|sC_s|≤A(1+s^p)` uniformly, continuous terminal convergence and finite Q-moments of order 2p with corresponding full-horizon maximal bounds. The constant-coefficient call/put case follows with p=1 from GBM moments. Local Itô identities without these terminal and true-martingale conditions do not assert admissibility. Prescribed delta strategies give the drift identity even when σ vanishes; arbitrary replicating strategies in a degenerate market do not identify a=C_s. Do not assert the same necessity theorem there without a separate no-arbitrage/drift condition. The zero-volatility asset and deterministic bond cases remain part of M0.1.

General-coefficient PDE existence is a separate target in an explicit class: write y=log s, assume the pricing generator’s transformed risk-neutral drift r(t)−σ(e^y,t)²/2 and diffusion σ(e^y,t) are bounded parabolic C^α coefficients, α∈(0,1), globally Lipschitz in y uniformly in time, with 0<δ≤σ²≤Λ, and r∈C^{α/2}([0,T]). For terminal data h with h(e^y)/(1+e^y)∈C_b^{2+α}(ℝ), construct a classical solution with C(e^y,t)/(1+e^y) in C_b^{2+α,1+α/2}(ℝ×[0,T]), and prove uniqueness there. The transformation by the weight 1+e^y has bounded logarithmic derivatives. Own the localization/Feynman–Kac coefficient and growth adapters; consume [PDE Lane F27.3 and F27.6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/959)’s classical whole-space parabolic Schauder theorem, including its bounded terminal operator and weight-conjugation estimate. The constant call/put theorem below has an independent direct proof and does not assume this general theorem for its nonsmooth payoff.

## M0.4. Black–Scholes calls, puts and analytic API

Fix r∈ℝ, σ>0, K>0, T>0. Define φ(z)=(2π)^(−1/2)e^(−z²/2) and Φ(z)=∫_(−∞)^z φ(u)du, using the native standard Gaussian measure and CDF. Prove its normalization, derivative, symmetry and tail identities through [StandardDistributions](../StandardDistributions/README.md)' Gaussian targets. For s>0, τ=T−t>0 put

`d_+=(log(s/K)+(r+σ²/2)τ)/(σ√τ)`, `d_−=d_+−σ√τ`,

`C(s,t)=sΦ(d_+)−Ke^(−rτ)Φ(d_−)`,

`P(s,t)=Ke^(−rτ)Φ(−d_−)−sΦ(−d_+)`.

Prove the PDE, put–call parity, risk-neutral payoff expectation and self-financing replication. Extend continuously to t=T by (s−K)_+ and (K−s)_+, respectively. The uniqueness class consists of classical solutions for s>0, 0≤t<T (right time derivative at t=0), continuous up to t=T and s=0, with |C(s,t)|≤A(1+s) uniformly. Prove uniqueness directly by stopped Itô on s∈[1/n,n] and GBM moment bounds, then pass to the limit by uniform integrability. This does not use a bounded-domain elliptic maximum principle as an unbounded parabolic uniqueness theorem.

Prove call boundary C(0,t)=0, put boundary P(0,t)=Ke^(−rτ), and far-field limits C(s,t)−s+Ke^(−rτ)→0 and P(s,t)→0. Prove call delta 0<C_s<1, call bond holding b=−Ke^(−rτ)Φ(d_−)/β_t<0, and the corresponding put delta and bond formulas. Prove positive call/put gamma and vega on s>0,t<T, with exact derivative formulas and terminal limits under their actual domains. For fixed s>0 distinct from K, gamma tends to zero as τ↓0. At s=K it diverges to +∞, with `√τ gamma(K,T−τ)→1/(Kσ√(2π))`; it has no finite pointwise terminal value there. The zero-feedback substitution in MarketImpact is algebraic; a parameter limit also requires its solution-dependence theorem.

## Dependencies and order

Use [StochasticCalculus](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1030) S0.2 for versions and measurability, S3.2–S3.4 for the actual stochastic integrals, S5.1 for Itô, S5.4 for exponentials, S6.1 for natural-Brownian L² martingale representation, S7.3 for Bayes/density transformations, S7.4 for finite-horizon true-density Girsanov, and S9.4 for the progressive-coefficient linear-SDE solution, uniqueness and constant GBM specialization. M0.1 supplies its asset-model inputs and owns the trading/self-financing contracts. M0.2 follows those inputs. M0.3 uses M0.1 and Itô; its general existence consumes the [PDE Lane F27 proposal](https://github.com/TauCetiProject/TauCetiRoadmap/pull/959)’s whole-space Schauder supplier. M0.4 uses the explicit Gaussian formulas, stopped Itô and GBM moments; S10.3's polynomial-growth theorem on ℝ^d is not silently applied to an exponentially growing function of log spot. [StandardDistributions](../StandardDistributions/README.md) owns the Gaussian CDF analytic identities. MarketImpact owns its nonlinear equilibrium, perturbation, noncompact minimum principle, fitting, and numerical theorem adapters.

The suggested Lean file pins price derivatives, drift algebra, deterministic exponential positivity, native Gaussian payoff integrability and the call payoff expectation identity. That identity is an admitted analytic theorem target. The README specifies the full market and replication contracts.

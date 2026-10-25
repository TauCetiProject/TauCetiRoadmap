<!--tauceti-status:v1 {"roadmap":"MarkovChainsAndRenewal","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"kernels from transition weights with PMF/matrix adapters, process-law equivalence on arbitrary spaces, the uniform sampler, completion examples","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"convolution powers, renewal measure U and renewal function m, the worked examples, natural-number count convention","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"cc6d7c2b67dca7f9d12966d9294ab320d4a84fba7db1b290187bfba7761cf590","roadmap":"MarkovChainsAndRenewal","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: MarkovChainsAndRenewal

This file documents the status of the MarkovChainsAndRenewal roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations of two layers are in place: Layer 0 has a working path-law API, and Layer 4 has its renewal process with nonexplosion and finite moments for the counts. Nothing yet touches the Markov property, recurrence, equilibrium, renewal measures, renewal limits or the Poisson connections.

### Named results

- **Nonexplosion of a renewal process**: for i.i.d. nonnegative increments that are not almost surely zero, the arrival times tend to infinity almost surely ([`ae_tendsto_arrival_atTop`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.ae_tendsto_arrival_atTop)), so every count is almost surely finite ([`ae_renewalCount_lt_top`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.ae_renewalCount_lt_top)).
- **Finite moments of the renewal counts**: every count has a finite moment of every order, even when the mean increment is infinite ([`lintegral_renewalCount_pow_lt_top`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Moments.html#TauCeti.Probability.lintegral_renewalCount_pow_lt_top)). The proof goes through a Chernoff bound on the lower tail of the arrival times ([`measureReal_arrival_le_le_exp_mul_mgf_pow`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Moments.html#TauCeti.Probability.measureReal_arrival_le_le_exp_mul_mgf_pow)), not through the roadmap's comparison with {0, a}-valued increments.
- **Uniqueness of the Markov path law**: a measure on paths with initial marginal ν that satisfies the prefix recursion is `markovChainLaw ν κ` ([`eq_markovChainLaw`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#MeasureTheory.Measure.eq_markovChainLaw)).
- **The time-n marginal of a chain**: the state at time n has law κⁿ ∘ ν ([`markovChainLaw_map_eval`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#MeasureTheory.Measure.markovChainLaw_map_eval)).

### Notable definitions and infrastructure

- **The path-law kernel** x ↦ ℙₓ ([`markovChainKernel`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#ProbabilityTheory.Kernel.markovChainKernel)) is a Markov kernel, and it writes the path law with any initial law as a mixture of chains started at fixed states. The path-valued and strong Markov properties of Layer 1 need exactly this.
- **The renewal count** ([`renewalCount`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.renewalCount)) takes values in the extended naturals and counts genuine arrivals at time zero. It comes with the inversion relations N_t ≥ n ⇔ S_n ≤ t and N_t = n ⇔ S_n ≤ t < S_{n+1}, monotonicity, right continuity, and a transfer of laws to the canonical product space. The README's convention of a natural-number count set to zero off the nonexplosion event has not been set up; the code works with the extended count throughout.

### Roadmap coverage

Layer 0 is partial. Item 2 is essentially done: marginals, the finite-path product formula, uniqueness, measurable dependence on the starting state and the path-law kernel. Items 1 (transition weights to kernels, with `PMF` and stochastic-matrix adapters), 3 (laws of processes on arbitrary probability spaces) and 4 (the uniform-variable sampler) have not been found, and neither have the completion examples. Layer 4 is partial. Items 1 and 2 are done, apart from the natural-number count convention. Item 3 (convolution powers, the renewal measure U and the renewal function m) and item 4 (the worked deterministic, {0, a} and exponential examples) are untouched. Layers 1, 2, 3, 5, 6 and 7 are untouched. The existing i.i.d. excursion decomposition at a recurrent state belongs to the Exchangeability roadmap. Layer 1.4 still has to supply its hypothesis, infinitely many returns, from the strong Markov property.

## The frontier

- **The renewal measure and renewal function** (Layer 4.3): define F^{*n} and U = Σ F^{*n}, prove U = δ₀ + F ∗ U, and relate them to m(t) = 𝔼N_t. The finite moments already give the local integrability this needs.
- **The elementary renewal theorem** (Layer 5.1): N_t/t → r almost surely, including infinite mean. Nonexplosion and the moment bounds are in place; what remains is the strong-law argument with truncation for μ = ∞, and uniform integrability.
- **Markov property relative to a filtration** (Layer 1.1–1.2): the conditional-expectation formulation, its equivalence with the prefix recursion, and the shifted-path law ℙ_{X_n}. This is now unblocked by the path-law kernel.
- **Transition weights and the sampler** (Layer 0.1, 0.4): build kernels from countable stochastic weights, and simulate the chain from i.i.d. uniforms.
- **Strong Markov property and returns** (Layer 1.3–1.4): needed before any recurrence classification in Layer 2, and to connect to the existing excursion decomposition.

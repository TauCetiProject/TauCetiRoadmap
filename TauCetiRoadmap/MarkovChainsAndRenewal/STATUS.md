<!--tauceti-status:v1 {"roadmap":"MarkovChainsAndRenewal","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468","ts":"2026-10-24T12:00:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"kernels from countable transition weights with PMF/matrix adapters, law equivalence for arbitrary processes, the uniform sampler, examples","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"convolution powers, renewal measure U and renewal function m, the N-valued count, and the deterministic/two-point/exponential examples","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"cc6d7c2b67dca7f9d12966d9294ab320d4a84fba7db1b290187bfba7761cf590","roadmap":"MarkovChainsAndRenewal","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468"}-->
# Status: MarkovChainsAndRenewal

This file documents the status of the MarkovChainsAndRenewal roadmap up until `5d671b9` (2026-10-24T12:00:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has foundations on both sides but no summit yet. The Markov-chain path law has most of the extension Layer 0 asks for, and ordinary renewal processes are constructed with nonexplosion and finite moments of their counts. The Markov property, state classification, equilibrium, renewal measures, the renewal limit theorems, renewal equations and the Poisson connections have not begun.

### Named results

- **Nonexplosion of a renewal process**: if the i.i.d. nonnegative increments are not almost surely zero, the arrival times tend to infinity almost surely ([`ae_tendsto_arrival_atTop`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.ae_tendsto_arrival_atTop)). Hence all the counts are finite simultaneously ([`ae_renewalCount_lt_top`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.ae_renewalCount_lt_top)).
- **Finite moments of the renewal counts**: under the same hypotheses each count has a finite moment of every order, with no assumption on the mean of the increments ([`lintegral_renewalCount_pow_lt_top`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Moments.html#TauCeti.Probability.lintegral_renewalCount_pow_lt_top)). The proof goes through a Chernoff bound for the arrival times ([`measureReal_arrival_le_le_exp_mul_mgf_pow`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Moments.html#TauCeti.Probability.measureReal_arrival_le_le_exp_mul_mgf_pow)).
- **Uniqueness of the Markov-chain path law**: a finite measure on path space with the right initial law whose prefix laws satisfy the Markov recursion is the chain's path law ([`eq_markovChainLaw`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#MeasureTheory.Measure.eq_markovChainLaw)).
- **Marginals of the chain**: the state at time n has law κⁿ ∘ ν, the initial law pushed through the n-th kernel power ([`markovChainLaw_map_eval`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#MeasureTheory.Measure.markovChainLaw_map_eval)).

### Notable definitions and infrastructure

- **The path-law kernel** x ↦ ℙₓ ([`markovChainKernel`](https://taucetiproject.org/docs/TauCeti/Probability/Process/MarkovChain.html#ProbabilityTheory.Kernel.markovChainKernel)) depends measurably on the starting state, and every path law is a mixture of it. The path-valued and strong Markov properties of Layer 1 will be stated in terms of this kernel.
- **The renewal count** ([`renewalCount`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.renewalCount)) takes values in the extended nonnegative numbers, so it is defined before finiteness is known. It comes with the inverse relations to the arrival times ([`renewalCount_eq_natCast_iff`](https://taucetiproject.org/docs/TauCeti/Probability/Renewal/Basic.html#TauCeti.Probability.renewalCount_eq_natCast_iff)) and a transfer of its law to the canonical product space.

### Roadmap coverage

Layer 0 is partial. Item 2 is essentially done, covering marginals, finite path masses, uniqueness, measurable dependence on the start and the path-law kernel. What remains is item 1 (Markov kernels from countable transition weights, with `PMF` and stochastic-matrix adapters), item 3 (the law equivalence for processes on an arbitrary probability space), item 4 (the uniform-variable sampler) and the worked examples. Layer 4 is partial. Items 1 and 2 are done, except for the ℕ-valued count set to zero off the nonexplosion event, which the conventions ask for. Item 3 (convolution powers, the renewal measure U and the renewal function) and the item 4 examples are untouched. The excursion decomposition consumed from Exchangeability is present but predates this roadmap. Layers 1, 2, 3, 5, 6 and 7 are untouched.

## The frontier

- **Renewal measure and renewal function**: define F^{*n} and U = Σ F^{*n}, prove local finiteness, U = δ₀ + F * U and U([0,t]) = 1 + m(t). The finite-moment theorem already supplies integrability of the counts. This unlocks Layers 5 and 6.
- **Kernels from transition weights**: build the Markov kernel determined by countable row-stochastic weights, with its `PMF` and finite-matrix forms and its behaviour under composition and powers. This finishes Layer 0 item 1 and is needed for every concrete example chain.
- **The filtration-relative Markov property**: state the one-step property by conditional expectations with explicit adaptation, and prove it equivalent to the prefix recursion already in hand for the natural filtration. This opens Layer 1.
- **Strong Markov property and returns**: prove it at stopping times valued in `WithTop ℕ`, then derive infinitely many returns from almost-sure return, which is the hypothesis of the existing excursion decomposition. Layer 2 depends on this.
- **The elementary renewal theorem**: prove N_t/t → 1/μ almost surely and in mean, including infinite mean. This needs the renewal function above plus the scalar strong law.

<!--tauceti-status:v1 {"roadmap":"FreeProbability","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: FreeProbability

This file documents the status of the FreeProbability roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic foundation is well under way. F1 has free independence and the law of a selfadjoint element. F2 now has free cumulants, the moment–cumulant formula and the Catalan counts. Both layers are still partial: there are no *-distributions, GNS realisations, Kreweras complement or cumulant criterion for freeness yet. F3–F8 are untouched.

### Named results

- **The moment–cumulant formula** — a moment of a word is the sum over NC(n) of the products of free cumulants along the blocks ([`apply_prod_ofFn_eq_sum_prod_freeCumulant`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Cumulant/Basic.html#TauCeti.apply_prod_ofFn_eq_sum_prod_freeCumulant)). Conversely, κ_n is the Möbius-weighted sum of block moments ([`freeCumulant_eq_sum_mu_mul_partitionMoment`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Cumulant/Basic.html#TauCeti.freeCumulant_eq_sum_mu_mul_partitionMoment)).
- **Free cumulants with products as arguments** — the cumulant of a word whose letters are grouped products is a sum over the noncrossing partitions whose join with the grouping partition is the top ([`freeCumulant_fiberProd_eq_sum_prod`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Cumulant/Product.html#TauCeti.freeCumulant_fiberProd_eq_sum_prod)).
- **Catalan enumeration of noncrossing partitions** — NC(n) has catalan n elements ([`card_fin_eq_catalan`](https://taucetiproject.org/docs/TauCeti/Combinatorics/NoncrossingPartition/Catalan.html#TauCeti.NoncrossingPartition.card_fin_eq_catalan)), as does the set of noncrossing pairings of 2n points ([`card_isPairing_fin_eq_catalan`](https://taucetiproject.org/docs/TauCeti/Combinatorics/NoncrossingPartition/Catalan.html#TauCeti.NoncrossingPartition.card_isPairing_fin_eq_catalan)).
- **Moment determinacy of spectral laws** — two selfadjoint elements, possibly in different C*-algebras, have the same law exactly when they have the same moments ([`law_eq_law_iff_forall_apply_pow`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Law.html#PositiveLinearMap.law_eq_law_iff_forall_apply_pow)). Every compactly supported law is realised in some C(K) ([`law_integralPositiveLinearMap_comap_restrict_id`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Law.html#PositiveLinearMap.law_integralPositiveLinearMap_comap_restrict_id)).
- **Freeness determines the joint law** — a normalised functional that makes a family free is determined on the generated algebra by its restrictions to the members ([`IsFreelyIndependent.eqOn_iSup`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Independence.html#TauCeti.IsFreelyIndependent.eqOn_iSup)).

### Notable definitions and infrastructure

- [`freeCumulant`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Cumulant/Basic.html#TauCeti.freeCumulant) is defined by Möbius inversion of block moments on NC(s), as the README prescribes. Multiplicativity over blocks is [proved](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Cumulant/Basic.html#TauCeti.partitionCumulant_eq_prod_freeCumulant), via the [factorisation of each lower interval of NC(s)](https://taucetiproject.org/docs/TauCeti/Combinatorics/NoncrossingPartition/Interval.html#TauCeti.NoncrossingPartition.iicOrderIso) as a product of smaller NC lattices. Cumulants are multilinear and vanish when an entry is 1.
- [`PositiveLinearMap.law`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Law.html#PositiveLinearMap.law) is the measure μ_a on the spectrum with ∫ f dμ_a = φ(f(a)). It is unique, a probability measure for states, and compatible with affine maps and functional calculus. This is the bridge that free convolution in F5 will be defined through.
- [`IsFreelyIndependent`](https://taucetiproject.org/docs/TauCeti/Probability/FreeProbability/Independence.html#TauCeti.IsFreelyIndependent) states freeness of subalgebras for an arbitrary linear functional. Normalisation, positivity and traciality are separate hypotheses.

### Roadmap coverage

**F1** is partial. The algebraic free-independence theory is in place, including transport of freeness along equal joint distributions. Laws of selfadjoint elements now exist with uniqueness, moments, pushforwards, moment determinacy and realisation of compact laws, and the [method of moments](https://taucetiproject.org/docs/TauCeti/Probability/Moments/WeakConvergence.html#MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow) gives weak convergence from moment convergence. Still missing: the *-polynomial synonym and *-distributions, *-freeness, GNS realisations and the bounded-realisation criterion, comparison of μ_a with a GNS spectral measure, convergence in distribution, and closure under norm and weak limits. **F2** is partial. Done: the NC lattice, lower-interval factorisation, Catalan counts, cumulants, both moment–cumulant directions, multiplicativity and the products-as-arguments formula. Missing: the permutation and plane-tree models, the Kreweras complement, the Möbius value (−1)^(n−1)catalan(n−1), the freeness–cumulant criterion, additivity, and the Kreweras product formulas. **F3–F8** are untouched.

## The frontier

- **Freeness ⇔ vanishing mixed cumulants (F2)** — both ingredients the README names are now present: the centred-word decomposition and the products-as-arguments formula. What remains is the criterion itself, then additivity of cumulants for free sums.
- **Kreweras complement and NC Möbius values (F2)** — the complement on interlaced positions with its block-count identity, the permutation model, and μ(0_n,1_n) = (−1)^(n−1)catalan(n−1). These are needed for the multiplicative free-product formulas and for F8's genus bound.
- **\*-distributions and GNS realisation (F1)** — the `FreeAlgebra ℂ (ι×Bool)` synonym with its conjugate-linear involution, *-freeness, and the bounded-realisation criterion. Nothing yet touches positivity of algebraic distributions.
- **Finishing the law interface (F1)** — compare μ_a with the scalar spectral measure in a GNS representation, and define convergence in (*-)distribution on top of the method of moments.
- **Reduced free products (F3)** — needed to realise free bounded selfadjoint pairs, which is the prerequisite for defining μ⊞ν in F5.

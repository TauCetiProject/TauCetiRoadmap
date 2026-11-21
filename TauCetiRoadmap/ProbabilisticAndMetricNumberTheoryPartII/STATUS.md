<!--tauceti-status:v1 {"roadmap":"ProbabilisticAndMetricNumberTheoryPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the complex weight bound; words, delays and the renewal count with freeness (0.3); C1 jet spaces and their calculus (0.4, 0.5)","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"51499f7f0feac101e960f2571dc2ff59b1dc50471b25b77a7bbd88f4d8bab067","roadmap":"ProbabilisticAndMetricNumberTheoryPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ProbabilisticAndMetricNumberTheoryPartII

This file documents the status of the ProbabilisticAndMetricNumberTheoryPartII roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first two sections of Layer 0 have landed: the ordered projective simplex and the accelerated branches with their explicit estimates. Words and the renewal count, the C¹ jet spaces, and all of Layers 1–7 (contraction, transfer operators, Ruelle–Perron–Frobenius, perturbation, non-lattice separation, uniform renewal counting and the Gauss and Rauzy comparisons) have not begun.

### Named results

- **The homogeneous identity**: for `y` in the ordered cone over `w`, the accelerated element `γ_{n−1}^A γ_j` sends `y` to `y_n q_a(w) (F_a(w), 1)`, so the branch `F_a` is exactly the projective action of the semigroup ([`linearMove_last_pow_linearMove_of_mem_orderedCone`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.linearMove_last_pow_linearMove_of_mem_orderedCone)).
- **Branch invariance**: every branch maps the ordered simplex into itself ([`mapsTo_branchMap`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.mapsTo_branchMap)) and is smooth on it.
- **The delay lower bound**: on the simplex `(A + 3)/2 ≤ q_a ≤ A + 2`, so every delay `τ_a = log q_a` is at least `log(3/2)` ([`log_three_halves_le_log_branchDenom`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.log_three_halves_le_log_branchDenom)). This is what will make the renewal count finite.
- **The uniform logarithmic-derivative bound**: `‖D log q_a‖ = (A + 1)/q_a ≤ 2(A + 1)/(A + 3) < 2` on the simplex, uniformly in the letter ([`norm_fderiv_log_branchDenom_lt_two`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.norm_fderiv_log_branchDenom_lt_two)).

### Notable definitions and infrastructure

- **The ordered projective simplex** in `d = n − 2` chart coordinates ([`orderedSimplex`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Basic.html#TauCeti.orderedSimplex)), compact and convex with nonempty interior, together with the normalisation from the ordered cone. Within-derivatives on it are therefore unique, which is what the C¹ theory of §0.4 needs.
- **The branches and denominators** ([`branchMap`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.branchMap), [`branchDenom`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.branchDenom)) indexed by letters `(A, j)`, with the linear moves `γ_j` ([`linearMove`](https://taucetiproject.org/docs/TauCeti/Dynamics/OrderedSimplex/Branch.html#TauCeti.linearMove)). Words, delays and the transfer operators will all be built from these.

### Roadmap coverage

Layer 0 is partial. §0.1 (the simplex) is done. §0.2 (the branches) is done except for the complex-weight statement `|q_a^{−s}| = q_a^{−Re s}`. §0.3 (words, delays, the count `N(w, r)`, the renewal equation and freeness), §0.4 (C¹ jets on compact convex bodies) and §0.5 (pullback, Leibniz and compact inclusion) are untouched. Layers 1 through 7 are untouched: none of their named targets, from `eventual_contraction` and `transferOp` through `ruelle_perron_frobenius` to `uniform_counting` and `counting_three`, appears in the library.

## The frontier

- **Words, delays and the renewal count (§0.3)**: define `wordMap`, `wordDelay` and `wordCount`, then prove concatenation, the homogeneous meaning of `T_u`, finiteness from the existing `log(3/2)` delay bound, the renewal equation and freeness of `Γ′`. The homogeneous identity already proved is the main input.
- **The complex weight (§0.2)**: `|q_a^{−s}| = q_a^{−Re s}` and positivity at real `s`. This is a short step that follows from positivity of `q_a`, which is already proved.
- **C¹ jets (§0.4)**: the Banach space of value-plus-derivative jets on a compact convex body and the predicate `C1BoundedOn` on the simplex. Unique within-derivatives on the simplex are already available.
- **C¹ calculus (§0.5)**: the pullback bound, the Leibniz rule and the compactness of the value inclusion via Arzelà–Ascoli. These need §0.4 first.
- **Uniform contraction (Layer 1)**: the core/cusp decomposition and short-block derivative bounds. These need the word machinery of §0.3.

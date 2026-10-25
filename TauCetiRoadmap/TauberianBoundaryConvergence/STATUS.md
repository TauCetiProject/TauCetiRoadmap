<!--tauceti-status:v1 {"roadmap":"TauberianBoundaryConvergence","to_sha":"da4d8dc48847cea93910477b85cf0cd427f169b3","ts":"2026-10-24T18:42:01Z"}-->
# Status: TauberianBoundaryConvergence

This file documents the status of the TauberianBoundaryConvergence roadmap up until `da4d8dc` (2026-10-24T18:42:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** N1, the bounded-complex Newman Tauberian theorem, is done. N2, the ordered boundary sum for bounded Dirichlet coefficients, is partial: its holomorphic correction term is proved but the endpoint theorem is not. N3, the ordered Euler product for a nontrivial Dirichlet character at `s = 1`, has not begun.

### Named results

- **Newman's Tauberian theorem** — let `f` be measurable and bounded on `[0, ∞)`, and suppose its Laplace transform continues holomorphically to an open set containing `Re z ≥ 0`. Then `∫₀ᵀ f` tends to the continuation's value at `0`, with no sign hypothesis: [`newmanLaplace_tendsto_integral`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Tauberian.html#TauCeti.LSeries.newmanLaplace_tendsto_integral).
- **Newman's fixed-radius estimate** — for each radius `R`, the truncated integral eventually lies within `2M/R + ε` of `G(0)`. This is the quantitative core of the argument, and the theorem follows from it by letting `R → ∞`: [`eventually_norm_sub_intervalIntegral_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Tauberian.html#TauCeti.LSeries.eventually_norm_sub_intervalIntegral_le).
- **Primitives on star-shaped domains** — a holomorphic function on an open star-shaped set has a primitive. This is general complex analysis, proved here to justify the contour deformation: [`isExactOn_of_starConvex`](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Primitive.html#TauCeti.Contour.isExactOn_of_starConvex).

### Notable definitions and infrastructure

- **Newman's left detour** — an explicit parabolic arc from `iR` to `−iR` that lies strictly left of the imaginary axis except at its endpoints. Openness of the continuation domain lets it be [placed inside that domain](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.exists_convex_newmanDetour_subset), and its kernel contribution [vanishes as `T → ∞`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.tendsto_integral_newmanDetour_mul_kernel). [`newmanDetour`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.newmanDetour)
- **Laplace transform estimates** — truncated transforms are entire. The full transform of a bounded function is [holomorphic on `Re z > 0`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LaplaceTransform.html#TauCeti.differentiableOn_integral_mul_cexp_neg_mul), with the tail bound `M e^{−T Re z}/Re z`. These are reusable beyond Newman's argument.
- **The step correction** — `H(z) = Σ a n (∫ₙⁿ⁺¹ x^{−z−1} dx − n^{−z−1})` converges absolutely and is holomorphic on `Re z > −1`, with value `Σ a n (log(1+1/n) − 1/n)` at `0`. It is the term that turns N1 into N2: [`stepCorrection`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/BoundaryConvergence/StepCorrection.html#TauCeti.LSeries.stepCorrection), [`differentiableOn_stepCorrection`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/BoundaryConvergence/StepCorrection.html#TauCeti.LSeries.differentiableOn_stepCorrection).

### Roadmap coverage

N1 is done as specified: the finite-transform holomorphy, the semicircle bounds, the detour and the improper-integral limit are all proved, with the continuation on an open neighbourhood as the README requires. N2 is partial. The step correction and the `x = eᵗ` substitution are in place. Not yet proved: local integrability of the step function `a ⌊eᵗ⌋₊`, the identity between its Laplace transform and `F(z+1) + H(z)`, the endpoint `boundedDirichlet_tendsto_ordered_at_one`, and its cutoff, linearity and finite-correction API. N3 is untouched: the source contains no coefficient `χ(n)Λ(n)/log n`, no patched logarithm of `LFunction χ`, and no ordered prime product.

## The frontier

- **Laplace transform of the step function** — prove that `a ⌊eᵗ⌋₊` is locally integrable and that, for `Re z > 0`, its Laplace transform equals `F(z+1) + H(z)`, using native `LSeriesHasSum` on `Re s > 1`.
- **The ordered endpoint `boundedDirichlet_tendsto_ordered_at_one`** — apply Newman's theorem at `T = log(N+1)` and subtract `H(0)`, giving `Σ_{n ≤ N} a n / n → F(1)`. Then add the real-to-natural cutoff, linearity, uniqueness and finite coefficient-change lemmas.
- **A holomorphic logarithm of `LFunction χ` near `Re s ≥ 1`** — patch local branches on balls along `Re s = 1`, built with the existing `exists_differentiableOn_eqOn_exp_comp`, onto the Euler logarithm for `Re s > 1`. This uses native nonvanishing on the whole closed half-plane, and it is independent of N2.
- **The ordered Euler product at `s = 1`** — once N2 is in place, remove the higher prime powers, which converge absolutely, and exponentiate. This gives `∏_{p ≤ N} (1 − χ(p)/p)⁻¹ → LFunction χ 1`, together with the finite-deletion, conjugation and level-change laws.

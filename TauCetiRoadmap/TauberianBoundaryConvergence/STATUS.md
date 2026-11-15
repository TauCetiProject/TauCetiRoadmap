<!--tauceti-status:v1 {"roadmap":"TauberianBoundaryConvergence","to_sha":"e177885ee120f8074a7610c3e60571ab00b20004","ts":"2026-10-24T06:33:22Z"}-->
# Status: TauberianBoundaryConvergence

This file documents the status of the TauberianBoundaryConvergence roadmap up until `e177885` (2026-10-24T06:33:22Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** N1, the bounded-complex Newman Tauberian theorem, is done. N2, the ordered Dirichlet-series endpoint at `s = 1`, is partial: only its holomorphic step correction exists. N3, the Dirichlet-character Euler-product comparison, has not begun.

### Named results

- **Newman's Tauberian theorem** — if `f : ℝ → ℂ` is measurable and bounded on `[0, ∞)`, and its Laplace transform agrees on `Re z > 0` with a function holomorphic on an open set containing the closed right half-plane, then `∫₀ᵀ f → G(0)` as `T → ∞`. This is [`newmanLaplace_tendsto_integral`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Tauberian.html#TauCeti.LSeries.newmanLaplace_tendsto_integral), proved through the fixed-radius bound [`eventually_norm_sub_intervalIntegral_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Tauberian.html#TauCeti.LSeries.eventually_norm_sub_intervalIntegral_le).
- **Newman's contour identity** — for a holomorphic continuation on a convex set, the right semicircle plus the left detour, integrated against Newman's kernel `exp(Tz)(1 + z²/R²)/z`, give `2πi` times the value at `0`. This is [`integral_right_semicircle_add_integral_newmanDetour_mul_kernel`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Tauberian.html#TauCeti.LSeries.integral_right_semicircle_add_integral_newmanDetour_mul_kernel).
- **Primitives on star-shaped sets** — every function holomorphic on an open star-shaped set has a primitive there. This is [`isExactOn_of_starConvex`](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Primitive.html#TauCeti.Contour.isExactOn_of_starConvex), which supplies the Cauchy deformation used to replace the left semicircle by the detour.
- **Holomorphy of the step correction** — for coefficients bounded from `n = 1` on, `H(z) = Σ a n (∫ₙⁿ⁺¹ x^(−z−1) dx − n^(−z−1))` converges absolutely and is holomorphic on `Re z > −1`. This is [`differentiableOn_stepCorrection`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/BoundaryConvergence/StepCorrection.html#TauCeti.LSeries.differentiableOn_stepCorrection), and its value at `0` is `Σ a n (log(1 + 1/n) − 1/n)` ([`stepCorrection_zero`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/BoundaryConvergence/StepCorrection.html#TauCeti.LSeries.stepCorrection_zero)).

### Notable definitions and infrastructure

- **Newman's left detour** — [`newmanDetour`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.newmanDetour) is the parabolic arc `s ↦ −δ(1 − s²) − R s i` from `iR` to `−iR`. Its interior lies strictly left of the imaginary axis, and for small `δ` it sits, with the right semicircle, in a convex subset of the continuation domain ([`exists_convex_newmanDetour_subset`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.exists_convex_newmanDetour_subset)). Its contribution vanishes as `T → ∞` ([`tendsto_integral_newmanDetour_mul_kernel`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Newman/Detour.html#TauCeti.LSeries.tendsto_integral_newmanDetour_mul_kernel)).
- **Laplace transform analytics** — truncated transforms are [entire](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LaplaceTransform.html#TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul), and the full transform of a bounded function is [holomorphic on `Re z > 0`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LaplaceTransform.html#TauCeti.differentiableOn_integral_mul_cexp_neg_mul). Both come with the tail and left-half-plane bounds `M e^(−T Re z)/|Re z|` that feed the semicircle estimates.
- **The substitution `x = eᵗ`** — [`intervalIntegral_ofReal_cpow_neg_sub_one`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/LaplaceTransform.html#TauCeti.intervalIntegral_ofReal_cpow_neg_sub_one) rewrites `∫ᵤᵛ x^(−z−1) dx` as a truncated Laplace transform. It is the first link between N1 and the step function of N2.

### Roadmap coverage

N1 is done, including the finite-transform, Cauchy-formula, semicircle and detour lemmas the README asks for. The theorem assumes `f` is measurable and bounded on `[0, ∞)`, which gives the required local integrability. N2 is partial: the step correction `H`, its absolute convergence, holomorphy on `Re z > −1` and value at `0` are proved. Not yet in place: the step function `f(t) = a ⌊eᵗ⌋₊`, its Laplace transform `F(z+1) + H(z)`, the endpoint `boundedDirichlet_tendsto_ordered_at_one`, and the cutoff, linearity, uniqueness and finite-change API. N3 is untouched: no character coefficient `aχ`, no glued Euler logarithm, and no ordered prime-product limit.

## The frontier

- **Laplace transform of the step function** — define `f(t) = a ⌊eᵗ⌋₊` for `t ≥ 0`, prove it is locally integrable using the step partition, and identify its transform on `Re z > 0` with `F(z+1) + H(z)` from `LSeriesHasSum`.
- **`boundedDirichlet_tendsto_ordered_at_one`** — apply Newman's theorem at `T = log(N+1)`, identify the finite integral with `Σ_{n≤N} a n log(1 + 1/n)`, and subtract the step correction at `0`. The result must be stated as the ordered limit of `Σ_{1≤n≤N} a n / n`.
- **N2 comparison API** — the real-to-natural cutoff equivalence, finite coefficient changes with explicit corrections, linearity and uniqueness of the endpoint.
- **N3 coefficients and Euler logarithm** — define `aχ = χ · Λ / log`, prove its values on prime powers and the bound `‖aχ‖ ≤ 1`, and glue local logarithms of `LFunction χ` on balls along `Re s = 1` into a holomorphic extension of the Euler log. This needs N2's endpoint before it can be used.
- **Ordered Euler product at `1`** — the `Tendsto` of the finite products `∏_{p≤N} (1 − χ(p)/p)⁻¹` to `LFunction χ 1`, plus the finite-deletion variant. Both wait on the item above.

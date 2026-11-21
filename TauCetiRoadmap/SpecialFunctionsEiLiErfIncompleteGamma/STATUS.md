<!--tauceti-status:v1 {"roadmap":"SpecialFunctionsEiLiErfIncompleteGamma","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"1.2-1.5: P and the lower function, the ray integral for the upper function and Q, the real bridge, and upperIncompleteGammaLog","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","state":"untouched"},{"id":"Layer 15","state":"untouched"}],"readme_sha":"570e773f7771621d528c373fec599acf20e340033c3f5639ac2ce349243a3b94","roadmap":"SpecialFunctionsEiLiErfIncompleteGamma","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: SpecialFunctionsEiLiErfIncompleteGamma

This file documents the status of the SpecialFunctionsEiLiErfIncompleteGamma roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Tricomi's entire function `γ*` exists so far. It meets every requirement of subsection 1.1. The rest of Layer 1 (`P`, `γ`, `Γ(a, z)`, the real bridge and the logarithmic continuation) and all of Layers 2–15 have not started.

### Named results

- **The power series of Tricomi's function** — [`hasSum_tricomiIncompleteGamma`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.hasSum_tricomiIncompleteGamma) gives `γ*(a, z) = e^{−z} ∑ zᵏ/Γ(a + k + 1)` for every `a` and `z`, and [`hasSum_tricomiIncompleteGamma_of_ne_neg_natCast`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.hasSum_tricomiIncompleteGamma_of_ne_neg_natCast) gives the alternating series `Γ(a)⁻¹ ∑ (−z)ᵏ/(k!(a + k))` for `a ∉ −ℕ` (DLMF 8.7.1).
- **Tricomi's integral** — [`tricomiIncompleteGamma_eq_integral`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.tricomiIncompleteGamma_eq_integral): for `Re a > 0`, `γ*(a, z) = Γ(a)⁻¹ ∫₀¹ t^{a−1} e^{−zt} dt` (DLMF 8.2.7). This is the bridge to the lower function in 1.2.
- **The differential equation of `γ*`** — [`tricomiIncompleteGamma_ode`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.tricomiIncompleteGamma_ode): `z w″ + (a + 1 + z) w′ + a w = 0` (DLMF 8.2.14). It is the starting point for the real zeros in Layer 6.
- **Entirety in both variables** — `γ*` is entire [in the parameter](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.differentiable_tricomiIncompleteGamma_left) and [in the argument](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.differentiable_tricomiIncompleteGamma), with [`∂γ*/∂z = −a γ*(a + 1, z)`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.hasDerivAt_tricomiIncompleteGamma).
- **Special values and the parameter recurrence** — `γ*(a, 0) = 1/Γ(a + 1)` and [`γ*(−n, z) = zⁿ`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.tricomiIncompleteGamma_neg_natCast) (DLMF 8.4.2, 8.4.12), with [`γ*(a, z) = z γ*(a + 1, z) + e^{−z}/Γ(a + 1)`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.tricomiIncompleteGamma_eq_mul_tricomiIncompleteGamma_add_one).

### Notable definitions and infrastructure

- [`tricomiIncompleteGamma`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/IncompleteGamma/Tricomi.html#Complex.tricomiIncompleteGamma) follows the roadmap's convention: it is `e^{−z} 𝐌(1, a + 1, z)` through Mathlib's regularized Kummer function. Its declarations live in the namespace `Complex`, not the `TauCeti.Complex` that the conventions specify.
- [`summable_norm_regularizedHGFun`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.html#Complex.summable_norm_regularizedHGFun) and [`hasSum_deriv_regularizedHGFun`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.html#Complex.hasSum_deriv_regularizedHGFun) give absolute convergence and termwise differentiation of the regularized `pFq` series when `p ≤ q`. Any later identity proved from a Kummer series will need these.
- [`norm_inv_Gamma_add_natCast_le`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Basic.html#Complex.norm_inv_Gamma_add_natCast_le) bounds `1/Γ(s + k)` by `1/(k! Γ(s))` on `Re s ≥ 1`. This factorial decay drives the convergence arguments.

### Roadmap coverage

Layer 1 is partial: subsection 1.1 is done, including its three checks, while 1.2–1.5 have not started. Layers 2–15 are untouched. The `γ*` recurrence and derivative are groundwork for the recurrences of 2.4 and 2.5, but those are stated for `γ` and `Γ`, which do not exist yet. The real incomplete Gamma, Beta and error functions that the later layers restrict to are owned by other roadmaps. They are not milestones here.

## The frontier

- **`P` and `γ` (1.2)** — define `P(a, z) = z^a γ*(a, z)` and `γ = Γ(a) P`. Then prove 8.2.1 from Tricomi's integral and the residues `(a + n) γ(a, z) → (−1)ⁿ/n!` at `a = −n`, together with the checks `P(1, z) = 1 − e^{−z}` and `P(−n, z) = 1`.
- **`Γ(a, z)` and `Q` (1.3)** — the horizontal ray integral on `slitPlane`: absolute convergence, entirety in `a`, `γ + Γ = Γ(a)`, and 8.2.12–8.2.13. This needs a rectangle Cauchy argument to move the ray onto the segment.
- **The real bridge (1.4)** — identify the complex `γ` and `P` with `TauCeti.lowerIncompleteGamma`, `TauCeti.regularizedGamma` and Mathlib's `Complex.partialGamma`, and show that `γ*(a, x)` is real for real `a` and `x`.
- **The Kummer representation (2.2)** — `γ*(a, z) = 𝐌(a, a + 1, −z)`, which is Kummer's transformation for the parameters `(1, a + 1)`. The new absolute-convergence results for the `𝐌` series make this the nearest result outside Layer 1.
- **Continuation (1.5)** — `upperIncompleteGammaLog` and the monodromy formulas 8.2.9–8.2.11. Layers 7–10 are written entirely through this function, so it gates the exponential, sine and cosine integrals.

<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"show the kernel of the global trace W^{1,p}(Omega) to L^p of the boundary is exactly W^{1,p}_0; only the inclusion W^{1,p}_0 into the kernel is proved","state":"partial"},{"id":"Lane B","state":"done"},{"id":"Lane C","state":"done"},{"id":"Lane D","state":"done"},{"id":"Lane E","remaining":"cover small-ball W^{2,p} and Schauder estimates into domain estimates for continuous or Hoelder coefficients, boundary estimates, C^{2,alpha} solvability","state":"partial"},{"id":"Lane F","remaining":"item 27: parabolic Hoelder spaces C_{par,b}^{k+alpha}, heat potentials, variable coefficients, BUC traces and weights","state":"partial"}],"readme_sha":"5390098587ecc457a9edc25d48a7f0c93fe718fdce919cc17070099f584d4ec5","roadmap":"PDE","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lanes B, C and D are done, and Lane A is done except for one identification: the kernel of the new global trace operator. Lane E has De Giorgi-Nash-Moser and the global small-oscillation estimates, and now their localised versions on small balls. Theorems for continuous or Hölder coefficients on a domain are not yet assembled. In Lane F the weak parabolic theory is complete, and the whole-space parabolic Schauder theory (item 27) has only just begun.

### Named results

- **Existence and uniqueness for the Dirichlet problem** — on a bounded open set, `-∂ⱼ(aⁱʲ∂ᵢu) + b·∇u + cu = f` with measurable, uniformly elliptic `a`, bounded drift and `c ≥ 0` has exactly one weak solution in `H¹₀(Ω)` ([`existsUnique_isWeakSolutionDirichlet_of_mass_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/Drift.html#TauCeti.PDE.UniformlyEllipticOn.existsUnique_isWeakSolutionDirichlet_of_mass_nonneg)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with merely measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension, with an exponent depending only on `λ`, `Λ` and `n` ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)). Moser's [Harnack inequality](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Harnack.html#TauCeti.PDE.exists_ae_ae_value_le_mul_value) holds in the same generality.
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for every `k ≤ N`, where `2N > n`, gives a Fourier multiplier bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).
- **The Calderón-Zygmund estimate** — `‖D²u‖_p ≤ C‖Δu‖_p` for `1 < p < ∞` ([`exists_eLpNorm_iteratedFDeriv_two_le_eLpNorm_laplacian`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/Lp.html#TauCeti.exists_eLpNorm_iteratedFDeriv_two_le_eLpNorm_laplacian)). It extends to coefficients of small oscillation, globally and on [small balls](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/Interior.html#TauCeti.PDE.exists_mul_lpNorm_iteratedGradient_ball_le_of_sum_mul_inner_eq_of_abs_sub_le).
- **Existence for linear parabolic equations** — in a Gelfand triple `V ↪ H ↪ V*`, the problem `u' + A(t)u = f`, `u(a) = u₀` has a weak solution whenever `A(t)` satisfies Gårding's inequality ([`exists_hasWeakLineDerivOn_gelfandDual`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Existence.html#TauCeti.exists_hasWeakLineDerivOn_gelfandDual)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives and complete at every order. Meyers-Serrin and agreement with the Bessel-potential scale tie it to Mathlib, and it underlies the energy method, spectral theory and regularity.
- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain is a bounded linear map `W^{1,p}(Ω) → Lᵖ(∂Ω)` with surface measure, for `1 ≤ p < ∞`. It is the unique such map that restricts continuous functions to the boundary. With extension and Rellich-Kondrachov on the same domains, this completes the boundary toolkit for global estimates.
- [`CkHolderSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Holder/Iterated.html#TauCeti.CkHolderSpace) is the bounded `C^{k,α}` space at every order. Its norm is the sum of the sup norms of the iterated derivatives and the Hölder seminorm of the top one, and it is complete. These are the trace spaces that Lane F's parabolic Schauder theory needs.

### Roadmap coverage

**Lanes B, C and D** are done. **Lane A** is partial only in that the global trace is known to vanish on `W^{1,p}_0(Ω)`, while the reverse inclusion is proved chart by chart, not for the glued operator. Everything else is in place: Sobolev spaces, density, the embeddings, Poincaré, extension, Rellich, and Hölder spaces at every order. **Lane E** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ` regularity, `H²` up to a flat boundary, and `W^{2,p}` and `C^{2,α}` estimates for small oscillation, globally and on small balls. The covering step to continuous or Hölder coefficients on a domain, boundary estimates, and `C^{2,α}` solvability are missing. **Lane F** is partial. Items 24 to 26 are done. Item 27 has parabolic space-time with its Hölder seminorms, the control of the temporal `(1+α)/2` seminorm of `D_x u`, and the whole-space comparison principle. The `C_{par,b}^{k+α}` spaces, heat potentials and everything after them are not yet there.

## The frontier

- **The kernel of the trace** — prove that the kernel of the global trace is exactly `W^{1,p}_0(Ω)`. The chart-wise characterisation already exists, so what remains is showing the glued trace vanishes only when every chart trace does.
- **`W^{2,p}` and Schauder estimates on domains** — cover a compact set by the new small-ball estimates to get interior estimates for continuous and Hölder coefficients. Then handle VMO coefficients and the boundary, and deduce `C^{2,α}` solvability of the Dirichlet problem.
- **Parabolic Hölder spaces `C_{par,b}^{k+α}` (F27.1)** — define them on slabs with mixed derivatives and the norm the README gives, then prove completeness and the interpolation and absorption bounds. The space-time metric and seminorms they need are in place.
- **Heat potentials (F27.2)** — the pointwise heat-kernel derivative bounds and the order-two Hölder estimates for the Cauchy and Duhamel potentials, leading to the constant-coefficient isomorphism. This depends on the item above.
- **Variable coefficients, BUC traces and weights (F27.3–F27.6)** — not started. They depend on the two items above.

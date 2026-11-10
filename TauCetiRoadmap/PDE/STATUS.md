<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"2c9b12be26ca8efd0c54851aead7b7a6553f7f5c","ts":"2026-11-09T18:41:13Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"interval representatives, every-order Meyers-Serrin and Campanato spaces","state":"partial"},{"id":"Layer 2","remaining":"Riesz-Thorin, Calderon-Zygmund decomposition and operators, Gehring as a standalone lemma, BMO and John-Nirenberg, the commutator theorem, VMO","state":"partial"},{"id":"Layer 3","remaining":"the divergence-form Hopf lemma for weak solutions; the W^{2,n} strong-solution form of Aleksandrov-Bakelman-Pucci","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"lower Meyers range, VMO coefficients, global boundary estimates, C^{2,alpha} solvability, Krylov-Safonov","state":"partial"},{"id":"Layer 6","remaining":"F27.3 variable-coefficient existence isomorphism, F27.4 BUC traces, F27.5 higher orders, F27.6 weighted solvability","state":"partial"},{"id":"Layer 7","remaining":"the reverse square-function bound, Besov spaces and paraproducts","state":"partial"},{"id":"Layer 8","remaining":"wave dispersive bounds on dyadic blocks, the TT* engine and the Strichartz estimates themselves","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"2c9b12be26ca8efd0c54851aead7b7a6553f7f5c"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `2c9b12b` (2026-11-09T18:41:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The energy method (Layer 4) is done, now including the trace form of the Dirichlet condition on Lipschitz domains. The function spaces, harmonic analysis, maximum principles, regularity, parabolic, dyadic and Strichartz layers are all partial. Quasilinear existence (Layer 9) has not begun.

### Named results

- **The Fredholm alternative** — with no sign condition on `c` and no smallness of the drift, `L u = ℓ` is solvable in `H¹₀(Ω)` exactly when `ℓ` vanishes on the weak adjoint kernel, and the kernel and adjoint kernel have the same finite dimension ([`exists_forall_energyFormH1_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative.html#TauCeti.PDE.UniformlyEllipticOn.exists_forall_energyFormH1_eq_iff)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with merely measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)), and Moser's [Harnack inequality](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Harnack.html#TauCeti.PDE.exists_ae_ae_value_le_mul_value) holds in the same generality.
- **Meyers' theorem** — the gradient of a weak solution of `-div(a∇u) = div F` with measurable, uniformly elliptic `a` lies in `Lᵖ` on smaller balls for some `p > 2` ([`exists_memLp_gradient_ball_divergence`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HigherIntegrability.html#TauCeti.PDE.exists_memLp_gradient_ball_divergence)).
- **The Aleksandrov-Bakelman-Pucci estimate** — for a non-divergence operator `aⁱʲ∂ᵢⱼ` with positive definite `a`, the supremum of `u` is bounded by its boundary values plus a multiple of the `Lⁿ` norm of `f⁻/(det a)^{1/n}` ([`le_add_mul_eLpNorm_negPart_div_det_rpow`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/AleksandrovBakelmanPucci.html#TauCeti.PDE.le_add_mul_eLpNorm_negPart_div_det_rpow)).
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for every `k ≤ N`, where `2N > n`, gives a Fourier multiplier bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives and complete at every order.
- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain is the unique bounded map `W^{1,p}(Ω) → Lᵖ(∂Ω)` that restricts continuous functions. Its zero set is now [exactly the zero-boundary space](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.mem_w1p0Submodule_iff_frontierTrace_compAffineIsometryEquivL_eq_zero), so the Dirichlet problem [takes its boundary data as a trace condition](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/DirichletProblem/Trace.html#TauCeti.PDE.existsUnique_frontierTrace_eq_forall_energyFormH1_eq).
- [`ParabolicC2HolderSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/Two.html#TauCeti.ParabolicC2HolderSpace) is the Banach space `C_b^{2+α,1+α/2}` on a time slab. The heat potentials map into it and the variable-coefficient operator maps it boundedly to `C_b^{α,α/2}`.

### Roadmap coverage

- **Layer 4 (energy method)** is done, through the Dirichlet spectrum and the trace form of the boundary condition.
- **Layer 1 (function spaces)** is partial. Sobolev spaces, density, embeddings, Poincaré and Sobolev-Poincaré, Lipschitz-domain extension, Rellich at subcritical exponents and the trace with its kernel are in place. Interval representatives, every-order Meyers-Serrin and Campanato spaces are not established here.
- **Layer 2 (harmonic analysis)** is partial. It has the maximal inequalities, Marcinkiewicz, Young's inequality, Mihlin-Hörmander and the Calderón-Zygmund Hessian estimate. Riesz-Thorin, Calderón-Zygmund operators, a standalone Gehring lemma, BMO and John-Nirenberg, the commutator theorem and VMO are absent.
- **Layer 3 (maximum principles)** is partial. It has mean values, Harnack, Perron's method, the variable-coefficient strong maximum principle and Hopf lemma, and the Aleksandrov-Bakelman-Pucci estimate, whose `W^{2,n}` strong-solution form is not established here. The divergence-form Hopf lemma for weak solutions is missing.
- **Layer 5 (regularity)** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ`, interior `W^{2,p}` and Schauder estimates, Meyers' upper range, an interior divergence-form `C^{1,α}` estimate, and a Calderón-Zygmund estimate near a flat boundary. Missing are the lower Meyers range, VMO coefficients, global boundary estimates, `C^{2,α}` solvability and Krylov-Safonov.
- **Layer 6 (parabolic)** is partial. The weak theory, maximum principles and the `BUC` heat semigroup are done, and F27.1 and F27.2 are largely in place. F27.3 to F27.5 lack their existence theorems, and F27.6 has only the conjugation identities.
- **Layers 7 and 8** are partial. Layer 7 has the Littlewood-Paley blocks, Bernstein's inequalities and the upper square-function bound, but no Besov spaces or paraproducts. Layer 8 has the Schrödinger group with its `Lᵖ → L^q` dispersive estimate and the half-wave propagator, but no Strichartz estimate. **Layer 9** is untouched.

## The frontier

- **The variable-coefficient Cauchy problem (F27.3)**: prove the localised global `C^{2+α,1+α/2}` a priori estimate, then run the method of continuity from the heat operator to get the isomorphism `u ↦ (Pu, u(·,0))`.
- **Krylov-Safonov**: the Aleksandrov-Bakelman-Pucci estimate is now available. The weak Harnack inequality still needs the barrier and measure estimate and the covering lemma on cubes.
- **Global elliptic estimates**: carry the flat-boundary Calderón-Zygmund and Schauder estimates through Lipschitz or `C^{1,α}` charts, then prove `C^{2,α}` solvability by the method of continuity.
- **BMO, Calderón-Zygmund operators and VMO**: these block the full-range `W^{1,p}` and `W^{2,p}` theory for VMO coefficients in Layer 5.
- **Strichartz and Besov foundations**: the wave dispersive bound on dyadic blocks and the `TT*` engine for Layer 8. For Layer 7, the reverse square-function bound and the Besov spaces themselves.

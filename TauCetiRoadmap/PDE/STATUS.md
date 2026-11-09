<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"identify the kernel of the global trace with W^{1,p}_0; interval representatives, every-order Meyers-Serrin and Campanato spaces not established","state":"partial"},{"id":"Layer 2","remaining":"Riesz-Thorin, Calderon-Zygmund decomposition and operators, Gehring, BMO and John-Nirenberg, the commutator theorem, VMO","state":"partial"},{"id":"Layer 3","remaining":"the Aleksandrov-Bakelman-Pucci estimate and the Hopf lemmas for variable coefficients","state":"partial"},{"id":"Layer 4","remaining":"the Dirichlet boundary condition as a trace condition on Lipschitz domains, waiting on the trace kernel of Layer 1","state":"partial"},{"id":"Layer 5","remaining":"VMO coefficients, boundary estimates, C^{2,alpha} solvability, Meyers higher integrability, divergence-form C^{1,beta}, Krylov-Safonov","state":"partial"},{"id":"Layer 6","remaining":"F27.3 variable-coefficient existence isomorphism, F27.4 BUC traces, F27.5 higher orders, F27.6 weighted solvability","state":"partial"},{"id":"Layer 7","remaining":"Bernstein inequalities, the Littlewood-Paley square-function theorem, Besov spaces and paraproducts","state":"partial"},{"id":"Layer 8","remaining":"wave dispersive bounds on dyadic blocks, the TT* engine and the Strichartz estimates themselves","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `e583e15` (2026-11-07T20:34:01+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Eight of nine layers have started and none is finished. The energy method is complete except for the trace form of the boundary condition. Parabolic Schauder theory has its spaces, potentials and operators but not its variable-coefficient existence theorem, and quasilinear existence (Layer 9) has not begun.

### Named results

- **Existence and uniqueness for the Dirichlet problem** — on a bounded open set, `-∂ⱼ(aⁱʲ∂ᵢu) + b·∇u + cu = f` with measurable, uniformly elliptic `a`, bounded drift and `c ≥ 0` has exactly one weak solution in `H¹₀(Ω)` ([`existsUnique_isWeakSolutionDirichlet_of_mass_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/Drift.html#TauCeti.PDE.UniformlyEllipticOn.existsUnique_isWeakSolutionDirichlet_of_mass_nonneg)).
- **The Fredholm alternative** — with no sign condition on `c` and no smallness of the drift, `L u = ℓ` is solvable in `H¹₀(Ω)` exactly when `ℓ` vanishes on the weak adjoint kernel, and the kernel and adjoint kernel have the same finite dimension ([`exists_forall_energyFormH1_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative.html#TauCeti.PDE.UniformlyEllipticOn.exists_forall_energyFormH1_eq_iff)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with merely measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)). Moser's [Harnack inequality](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Harnack.html#TauCeti.PDE.exists_ae_ae_value_le_mul_value) holds in the same generality.
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for every `k ≤ N`, where `2N > n`, gives a Fourier multiplier bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).
- **The interior Calderón-Zygmund estimate for continuous coefficients** — for `1 < p < ∞`, strong solutions of a non-divergence equation whose principal coefficient is continuous and elliptic on a compact `K ⊆ Ω` have `‖D²u‖_{Lᵖ(K)}` controlled by the equation and by `u` near `K` ([`exists_lpNorm_iteratedGradient_le_of_sum_mul_inner_add_inner_add_mul_eq_of_continuousAt`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Hessian/ContinuousCoefficient.html#TauCeti.PDE.exists_lpNorm_iteratedGradient_le_of_sum_mul_inner_add_inner_add_mul_eq_of_continuousAt)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives, complete at every order; the energy method and regularity theory rest on it.
- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain is the unique bounded linear map `W^{1,p}(Ω) → Lᵖ(∂Ω)` that restricts continuous functions to the boundary, for `1 ≤ p < ∞`.
- [`ParabolicC2HolderSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/Two.html#TauCeti.ParabolicC2HolderSpace) is the Banach space `C_b^{2+α,1+α/2}` on a closed time slab, with bounded traces into `C_b^{2,α}`. The heat potentials map into it and the variable-coefficient operator `P` maps it boundedly to `C_b^{α,α/2}`, so the remaining parabolic theorems are stated there.

### Roadmap coverage

- **Layer 1 (function spaces)** is partial. Sobolev spaces, density, embeddings, Poincaré, Lipschitz-domain extension, Rellich and the trace operator are in place. The kernel of the trace has not been identified with `W^{1,p}_0(Ω)`. Interval representatives, every-order Meyers-Serrin and Campanato spaces are not established here.
- **Layer 2 (harmonic analysis)** is partial. It has the maximal inequalities, Mihlin-Hörmander and the Calderón-Zygmund estimate; Riesz-Thorin, Calderón-Zygmund operators, Gehring's lemma, BMO and John-Nirenberg, the commutator theorem and VMO are absent.
- **Layer 3 (maximum principles and potential theory)** is partial. It has mean values, strong maximum principles, sharp Harnack in every dimension, Hopf's lemma for `-Δ - b·∇ + c`, and Perron's method with regular points characterised by barriers. The Aleksandrov-Bakelman-Pucci estimate and the variable-coefficient Hopf lemmas are missing.
- **Layer 4 (energy method)** is done except that, on Lipschitz domains, the boundary condition is not yet expressed through the trace.
- **Layer 5 (elliptic regularity)** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ`, interior `W^{2,p}` for continuous coefficients, and interior and whole-space Schauder estimates. Missing are VMO coefficients, boundary estimates, `C^{2,α}` solvability, Meyers' higher integrability (only his counterexample is proved), divergence-form `C^{1,β}` and Krylov-Safonov.
- **Layer 6 (parabolic)** is partial. The weak theory and classical maximum principles are done, the `BUC` heat semigroup has its generator, and F27.1 and F27.2 are largely in place. F27.3 to F27.5 lack their existence theorems, and F27.6 has only the conjugation identities.
- **Layers 7 and 8** have first steps: uniform `Lᵖ` bounds for Littlewood-Paley blocks, and the Schrödinger group with its dispersive estimate. **Layer 9** is untouched.

## The frontier

- **The variable-coefficient Cauchy problem (F27.3)**: prove the localised global a priori `C^{2+α,1+α/2}` estimate, then run the method of continuity from the heat operator to obtain the isomorphism `u ↦ (Pu, u(·,0))`. Every other ingredient is proved.
- **The kernel of the trace**: show the glued trace vanishes only on `W^{1,p}_0(Ω)`, which also completes Layer 4.
- **Global elliptic estimates**: boundary `W^{2,p}` and Schauder estimates, then `C^{2,α}` solvability by the method of continuity.
- **BMO, Gehring and Calderón-Zygmund operators**: these block Meyers' higher integrability and the `W^{2,p}` theory for VMO coefficients in Layer 5.
- **Strichartz and Besov foundations**: wave dispersive bounds and the `TT*` engine for Layer 8; Bernstein, the square function and Besov spaces for Layer 7.

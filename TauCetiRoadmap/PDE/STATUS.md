<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418","ts":"2026-11-11T08:00:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Hölder spaces C^{k,α}(Ω) and C^{k,α}_loc(Ω) on an open set","state":"partial"},{"id":"Layer 2","remaining":"the Coifman-Rochberg-Weiss Lp commutator bound and its small-radius VMO form","state":"partial"},{"id":"Layer 3","remaining":"the divergence-form Hopf lemma for weak solutions","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"Krylov-Safonov weak Harnack and Hölder for strong solutions, lower Meyers range, VMO coefficients, global boundary estimates, C^{2,α} solvability","state":"partial"},{"id":"Layer 6","remaining":"F27.3 variable-coefficient existence isomorphism, F27.4 BUC traces, F27.5 higher orders, F27.6 weighted solvability","state":"partial"},{"id":"Layer 7","remaining":"paraproducts and Bony's decomposition","state":"partial"},{"id":"Layer 8","remaining":"Strichartz in every dimension, the endpoint and inhomogeneous estimates, wave dispersive bounds and wave Strichartz","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"566f1f7248a031ea483ba206711dbd72e4a9827a3ce04b54eb7ed52650d25d0e","roadmap":"PDE","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `a6027b1` (2026-11-11T08:00:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The energy method (Layer 4) is done. Function spaces and harmonic analysis (Layers 1 and 2) are close, each with one or two named gaps. Maximum principles, regularity, parabolic theory, dyadic analysis and Strichartz estimates are partial, and quasilinear existence (Layer 9) has not begun.

### Named results

- **The Fredholm alternative** — with no sign condition on `c` and no smallness of the drift, `L u = ℓ` is solvable in `H¹₀(Ω)` exactly when `ℓ` vanishes on the weak adjoint kernel, and the two kernels have the same finite dimension ([`exists_forall_energyFormH1_eq_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/FredholmAlternative.html#TauCeti.PDE.UniformlyEllipticOn.exists_forall_energyFormH1_eq_iff)).
- **De Giorgi's theorem** — weak solutions of divergence-form equations with measurable, uniformly elliptic coefficients are locally Hölder continuous in every dimension ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)), and Moser's [Harnack inequality](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Regularity/Harnack.html#TauCeti.PDE.exists_ae_ae_value_le_mul_value) holds in the same generality.
- **The Aleksandrov-Bakelman-Pucci estimate** — for a `W^{2,n}` subsolution of `aⁱʲ∂ᵢⱼu ≥ f` with positive definite `a`, the supremum of `u` is bounded by its boundary values plus a multiple of `‖f⁻/(det a)^{1/n}‖_{Lⁿ}` ([`le_add_mul_eLpNorm_negPart_div_det_rpow_of_wkp`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/MaximumPrinciple/AleksandrovBakelmanPucci/Sobolev.html#TauCeti.PDE.le_add_mul_eLpNorm_negPart_div_det_rpow_of_wkp)).
- **The Mihlin-Hörmander multiplier theorem** — a symbol with `‖Dᵏm(ξ)‖ ≤ A‖ξ‖⁻ᵏ` for every `k ≤ N`, `2N > n`, gives a Fourier multiplier bounded on `Lᵖ` for `1 < p < ∞` ([`exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/MihlinHormander.html#TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le)).
- **The Strichartz estimate on the line** — the Schrödinger group satisfies `‖e^{itΔ}f‖_{L⁴_t L^∞_x} ≲ ‖f‖₂`, in weak form, derived from an abstract `TT*` argument ([`exists_enorm_integral_inner_schrodingerPropagator_le`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Schrodinger/Strichartz.html#TauCeti.exists_enorm_integral_inner_schrodingerPropagator_le)).

### Notable definitions and infrastructure

- The [trace operator](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.frontierTrace) of a bounded Lipschitz domain is the unique bounded map `W^{1,p}(Ω) → Lᵖ(∂Ω)` that restricts continuous functions. Its zero set is [exactly the zero-boundary space](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/LipschitzDomain/Trace/Frontier.html#TauCeti.W1p.mem_w1p0Submodule_iff_frontierTrace_compAffineIsometryEquivL_eq_zero), so the Dirichlet problem takes boundary data as a trace condition.
- [`ParabolicC2HolderSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Parabolic/Holder/Two.html#TauCeti.ParabolicC2HolderSpace) is the Banach space `C_b^{2+α,1+α/2}` on a time slab. It carries the heat potentials, the variable-coefficient operator, and localization and patching of its norm.
- The Besov spaces `B^s_{p,q}` are [independent of the bump function](https://taucetiproject.org/docs/TauCeti/Analysis/FunctionalSpaces/BesovSpace.html#TauCeti.BesovSpace.bumpEquiv), sit between the Bessel-potential spaces `H^{s,p}`, and have the Bernstein embeddings.

### Roadmap coverage

- **Layer 4 (energy method)** is done, now with continuous dependence on the coefficients and the Dirichlet eigenvalues enumerated as `0 < λ₀ ≤ λ₁ ≤ ⋯ → ∞`.
- **Layer 1 (function spaces)** is partial. Interval representatives, Meyers-Serrin and Rellich-Kondrachov at every order, embeddings, the trace and Campanato's characterization are in place. Hölder spaces `C^{k,α}(Ω)` and `C^{k,α}_loc(Ω)` on an open set are not established here: only the whole-space `C_b^{k,α}` exists.
- **Layer 2 (harmonic analysis)** is partial but close. It has Riesz-Thorin, Calderón-Zygmund theory, Mihlin-Hörmander, the Riesz transforms, Gehring's lemma, BMO with John-Nirenberg, and Sarason's VMO. Missing is the Coifman-Rochberg-Weiss `Lᵖ` commutator bound (only Janson's pointwise sharp-function estimate exists) and its VMO form.
- **Layer 3 (maximum principles)** is partial. Its one remaining gap is the divergence-form Hopf lemma for weak solutions.
- **Layer 5 (regularity)** is partial. It has De Giorgi-Nash-Moser, interior `Hᵏ`, `W^{2,p}` and Schauder estimates, Meyers' upper range and the first Krylov-Safonov lemmas. Missing are the weak Harnack and Hölder estimates for strong solutions, the lower Meyers range, VMO coefficients, global boundary estimates and `C^{2,α}` solvability.
- **Layer 6 (parabolic)** is partial. The weak theory and the `BUC` heat semigroup are done, and so is most of F27.1-F27.2. F27.3-F27.5 still lack their existence theorems, and F27.6 has only the conjugation identities.
- **Layers 7 and 8** are partial. Layer 7 has the blocks, Bernstein, both square-function bounds and the Besov spaces, but no paraproducts. Layer 8 has the propagators, the dispersive estimate, the `TT*` engine and the one-dimensional `(4, ∞)` estimate. **Layer 9** is untouched.

## The frontier

- **Krylov-Safonov**: the measure estimate and `L^ε` decay exist for classical supersolutions. They need to be carried to `W^{2,n}` strong solutions, where the Aleksandrov-Bakelman-Pucci estimate now applies, and then combined into the weak Harnack inequality, Harnack and the Hölder estimate.
- **The variable-coefficient Cauchy problem (F27.3)**: localization and patching are in place. What remains is the global a priori estimate for `C^{2+α,1+α/2}` and then the method of continuity from the heat operator, giving the isomorphism `u ↦ (Pu, u(·,0))`.
- **Global elliptic estimates**: carry the flat-boundary Calderón-Zygmund and Schauder estimates through charts, then prove `C^{2,α}` solvability.
- **The commutator theorem and VMO coefficients**: the `Lᵖ` bound for `[b, T]`, which blocks the full-range `W^{1,p}` and `W^{2,p}` theory of Layer 5.
- **Strichartz in every dimension and paraproducts**: the general admissible pairs, the endpoint and the inhomogeneous estimate, the wave dispersive bound on dyadic blocks, and Bony's decomposition with its estimates on `𝒞^s`.
